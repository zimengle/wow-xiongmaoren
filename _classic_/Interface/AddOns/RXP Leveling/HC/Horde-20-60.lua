RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 23-25 希尔斯布莱德
#displayname 23-25 希尔斯布莱德 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 20-30
#next 25-27 南贫瘠之地/石爪山
step
.zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
.zoneskip Tirisfal Glades
step
#completewith next
.goto Tirisfal Glades,61.52,53.20,80 >>前往布瑞尔
step
.goto Tirisfal Glades,61.26,50.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞弗伦|r交谈
.turnin 440 >>交任务: |cRXP_FRIENDLY_黛丽娅的戒指|r
.accept 441 >>接任务: |cRXP_LOOT_拉林夫与幽暗城|r
.target Magistrate Sevren
.isOnQuest 440
step
.goto Tirisfal Glades,61.26,50.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞弗伦|r交谈
.accept 441 >>接任务: |cRXP_LOOT_拉林夫与幽暗城|r
.target Magistrate Sevren
.isQuestTurnedIn 440
step
#completewith HusbandsRevenge
.goto Tirisfal Glades,61.80,65.06,20,0
.zone Undercity >>前往: |cRXP_PICK_幽暗城|r
.zoneskip Undercity
step
#completewith next
.goto Undercity,66.09,20.06,35,0
.goto Undercity,64.37,23.94,35,0
.goto Undercity,65.93,26.71,10,0
.goto Undercity,65.89,34.03,10,0
.goto Undercity,64.22,39.77,10,0
.goto Undercity,65.53,43.62,15 >>乘坐升降梯前往幽暗城
step
#label HusbandsRevenge
.goto Undercity,62.02,42.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱克兰|r交谈
.turnin 441 >>交任务: |cRXP_FRIENDLY_拉林夫与幽暗城|r
.accept 530 >>接任务: |cRXP_WARN_丈夫的复仇|r
.target Raleigh Andrean
.isQuestTurnedIn 440
step << Mage
.goto Undercity,84.18,15.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱克斯顿|r交谈
.train 3563 >>坐骑 |T135766:0|t[传送:幽暗城]
.target Lexington Mortaim
step << Mage
.goto Undercity,82.78,15.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_汉娜|r|cRXP_BUY_交谈. 从她那里购买一个或多个|r|T134419:0|t[传送符文] |r
.collect 17031,1 
.target Hannah Akeley
step << Undead Priest
.goto Undercity,48.98,18.33
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r交谈
.turnin 5644 >>交任务: |cRXP_FRIENDLY_噬灵瘟疫|r
.target Aelthalyste
step
.goto Undercity,53.74,54.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bel'dugur|r交谈
.accept 1013 >>接任务: |cRXP_WARN_乌尔之书|r
.target Keeper Bel'dugur
.dungeon SFK
step
.goto Undercity,63.27,48.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
.fly The Sepulcher>>飞往瑟伯切尔
.target Michael Garrett
.zoneskip Silverpine Forest
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿利斯特|r和|cRXP_FRIENDLY_伦弗雷尔|r和|cRXP_FRIENDLY_姆拉|r交谈
.accept 480 >>接任务: |cRXP_WARN_法师的头领|r
.accept 516 >>接任务: |cRXP_WARN_博伦的巢穴|r
.target +Shadow Priest Allister
.goto Silverpine Forest,43.98,40.93
.accept 493 >>接任务: |cRXP_LOOT_前往希尔斯布莱德丘陵|r
.target +Apothecary Renferrel
.goto Silverpine Forest,42.90,40.80
.turnin 3301 >>交任务: |cRXP_FRIENDLY_茉拉·符文图腾|r
.target +Mura Runetotem
.goto Silverpine Forest,42.90,41.99
.isQuestTurnedIn 479
.group
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿利斯特|r和|cRXP_FRIENDLY_伦弗雷尔|r和|cRXP_FRIENDLY_姆拉|r交谈
.accept 516 >>接任务: |cRXP_WARN_博伦的巢穴|r
.target +Shadow Priest Allister
.goto Silverpine Forest,43.98,40.93
.accept 493 >>接任务: |cRXP_LOOT_前往希尔斯布莱德丘陵|r
.target +Apothecary Renferrel
.goto Silverpine Forest,42.90,40.80
.turnin 3301 >>交任务: |cRXP_FRIENDLY_茉拉·符文图腾|r
.target +Mura Runetotem
.goto Silverpine Forest,42.90,41.99
step << Druid
#completewith next
.goto Silverpine Forest,36.12,28.30,120 >>前往北方或东方的大海
step << Druid
.goto Silverpine Forest,29.58,29.30
>>在水中拾取|cRXP_PICK_奇怪的保险箱|r, 以获得|T133442:0 |t[水兽耐力坠饰]

.collect 15882,1,30,1 

step
#completewith next
.goto Silverpine Forest,46.07,85.75,100 >>向南前往格雷迈恩墙
step
.goto Silverpine Forest,46.07,85.75
>>击杀|cRXP_ENEMY_瓦德雷·莫莱|r. 从他身上搜刮|cRXP_LOOT_双手|r
>>|cRXP_WARN_他正在四处巡逻. 单独拉怪时要注意避开聚集的敌人|r
.complete 530,1 
.unitscan Valdred Moray
.isOnQuest 530
step
#completewith next
.goto Silverpine Forest,60.35,74.54,40 >>前往博伦的巢穴中的洞穴
step
#loop
.goto Silverpine Forest,59.73,71.73,0
.goto Silverpine Forest,60.38,72.43,20,0
.goto Silverpine Forest,59.73,71.73,15,0
.goto Silverpine Forest,59.52,70.66,15,0
.goto Silverpine Forest,58.71,71.34,15,0
.goto Silverpine Forest,58.26,71.99,15,0
.goto Silverpine Forest,57.65,71.61,15,0
.goto Silverpine Forest,57.30,69.96,30,0
>>击杀|cRXP_ENEMY_鸦爪苦工|r和|cRXP_ENEMY_鸦爪守护者|r
.complete 516,1 
.mob +Ravenclaw Drudger
.complete 516,2 
.mob +Ravenclaw Guardian
step
#completewith next
.goto Silverpine Forest,62.10,64.42,80 >>前往安伯米尔
.isOnQuest 480
.group
step
.goto Silverpine Forest,62.10,64.42,20,0
.goto Silverpine Forest,62.91,63.95,10,0
.goto Silverpine Forest,63.22,63.45,10,0
.goto Silverpine Forest,63.40,64.26
>>进入市政厅并击杀大法师阿塔瑞克. 搜刮他的法杖
>>|cRXP_WARN_房间里有很多怪物, 请小心地把它们拉出来|r
.complete 480,1 
.mob Archmage Ataeric
.isOnQuest 480
.group 2
step
#completewith next
.zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
.zoneskip Hillsbrad Foothills
step
.goto Hillsbrad Foothills,20.79,47.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵哨兵莱什|r交谈
.accept 494 >>接任务: |cRXP_LOOT_进攻的时机|r
.target Deathstalker Lesh
step
#completewith next
.goto Hillsbrad Foothills,62.06,20.19,120 >>前往塔伦米尔
step
.goto Hillsbrad Foothills,60.14,18.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞斯|r交谈
.fp Tarren Mill>>获取塔伦米尔飞行路径
.target Zarise
step << Rogue
.goto Hillsbrad Foothills,61.55,19.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hinott|r交谈
.turnin 2479 >>交任务: |cRXP_FRIENDLY_希诺特的帮助|r
.accept 2480 >>接任务: |cRXP_LOOT_希诺特的帮助|r
.timer 30,Hinott's Assistance RP
.target Serge Hinott
step << Rogue
.goto Hillsbrad Foothills,61.55,19.19
>>等待|cRXP_FRIENDLY_Hinott|r完成治疗
.complete 2480,1 
step << Rogue
.goto Hillsbrad Foothills,61.50,19.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hinott|r交谈
.turnin 2480 >>交任务: |cRXP_FRIENDLY_希诺特的帮助|r
.target Serge Hinott
step << Rogue
#completewith TarrenMillPickups
.cast 10723 >>使用 |T134807:0|t[希诺特之油] 治疗你身上的 |T136230:0|t[赞吉尔之触]
.aura -9991
.use 8095
step << Rogue
#completewith TarrenMillPickups
>>制作 |T132273:0|t[速效药膏]
.collect 6947,20,1067,1 
step
.goto Hillsbrad Foothills,61.50,19.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师林度恩|r交谈
.turnin 493 >>交任务: |cRXP_FRIENDLY_前往希尔斯布莱德丘陵|r
.turnin 1065 >>交任务: |cRXP_FRIENDLY_塔伦米尔之旅|r
.accept 1066 >>接任务: |cRXP_LOOT_无辜者之血|r
.accept 496 >>接任务: |cRXP_LOOT_受难药剂|r
.accept 501 >>接任务: |cRXP_LOOT_痛苦药剂|r
.target Apothecary Lydon
step << Shaman
.goto Hillsbrad Foothills,62.18,20.78
.use 7768 >>在塔伦米尔中央的井处使用 |T132829:0|t[空的红色水囊]
.complete 1536,1 
step
.goto Hillsbrad Foothills,62.20,20.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级执行官达萨利亚|r交谈
.turnin 494 >>交任务: |cRXP_FRIENDLY_进攻的时机|r
.accept 527 >>接任务: |cRXP_LOOT_希尔斯布莱德之战|r
.goto Hillsbrad Foothills,62.20,20.50
.target High Executor Darthalia
step
.goto Hillsbrad Foothills,62.60,20.70
>>点击|cRXP_FRIENDLY_通缉告示|r
.accept 549 >>接任务: |cRXP_LOOT_通缉：辛迪加成员|r
step
.goto Hillsbrad Foothills,63.20,20.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁斯克|r交谈
.accept 498 >>接任务: |cRXP_LOOT_拯救行动|r
.target Krusk
step
#label TarrenMillPickups
.goto Hillsbrad Foothills,62.50,19.70
>>点击|cRXP_FRIENDLY_通缉告示|r
.accept 567 >>接任务: |cRXP_LOOT_危险！|r
step << Hunter
.goto Hillsbrad Foothills,62.56,19.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kayren交谈|r
>>|cRXP_BUY_从他那里购买|r |T132382:0|t[锋利的箭] |r
.collect 2515,1800,549,1 << Hunter 
.target Kayren Soothallow
.xp >25,1
step << Hunter
.goto Hillsbrad Foothills,62.56,19.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kayren交谈|r
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,1800,549,1 << Hunter 
.target Kayren Soothallow
.xp <25,1
step
.goto Hillsbrad Foothills,62.76,19.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板沙恩|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Shay
step << Shaman/Warrior
.goto Hillsbrad Foothills,60.43,26.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥特|r交谈
.vendor >>|cRXP_BUY_如果该物品已上线且你尚未拥有, 请从他那里购买|r|T132408:0|t[无情战斧]|r
.money <3.0195
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<21.0
.target Ott
step << Rogue
.goto Hillsbrad Foothills,60.43,26.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥特|r交谈
.vendor >>|cRXP_BUY_如果该物品已上架且你尚未拥有, 可以从他那里购买 a|r|T135640:0|t[宽刃小刀]|r
.money <2.8372
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.7
.target Ott
step << Hunter
#completewith next
.goto Hillsbrad Foothills,62.31,19.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_西奥多交谈|r
.stable >>驯服你的宠物. 你将很快驯服一只|cRXP_ENEMY_灰熊|r 和一只|cRXP_ENEMY_森林最毒虫|r
.target Theodore Mont Claire
step << Hunter
#loop
.goto Hillsbrad Foothills,57.93,27.85,0
.goto Hillsbrad Foothills,57.93,27.85,60,0
.goto Hillsbrad Foothills,58.88,32.28,60,0
.goto Hillsbrad Foothills,61.77,36.16,60,0
.train 16829 >>|cRXP_WARN_施放|r|T132164:0|t[驯服野兽]|cRXP_WARN_对一只|r|cRXP_ENEMY_灰熊|r. 用它攻击怪物以学习|r|T132140:0|t[利爪(等级3)]
.train 17263 >>|cRXP_WARN_施放|r |T132164:0|t[驯服野兽] |cRXP_WARN_在|r |cRXP_ENEMY_森林中的巨爬行者|r上. 攻击它以学习|r |T132278:0|t[咬击(等级3)]
.link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
.mob Gray Bear
.mob Forest Most Creeper
step << Hunter
.goto Hillsbrad Foothills,62.31,19.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_西奥多交谈|r
.stable >>放弃|cRXP_ENEMY_灰熊|r 或|cRXP_ENEMY_森林最爬行者|r, 然后取回你的常规宠物
.target Theodore Mont Claire
step << Rogue
#completewith Durnholde1
.cast 8679 >>在你的武器上使用 |T132273:0|t[速效药膏]
.itemcount 6947,2
step
#completewith next
>>途中击杀 |cRXP_ENEMY_熊|r和 |cRXP_ENEMY_蜘蛛|r, 搜刮它们的 |cRXP_LOOT_舌头|r和 |cRXP_LOOT_黏液|r
>>|cRXP_WARN_避开|r|cRXP_ENEMY_老灰熊|r|cRXP_WARN_和|r|cRXP_ENEMY_巨型食苔蛛|r|cRXP_WARN_, 因为它们等级较高, 不值得击杀|r
.complete 496,1 
.mob +Gray Bear
.mob +Vicious Gray Bear
.complete 496,2 
.mob +Forest Moss Creeper
step
#label Durnholde1
.goto Hillsbrad Foothills,76.57,46.48,120 >>奔向敦霍尔德城堡
step
#completewith Drull
>>击杀|cRXP_ENEMY_辛迪加潜行者|r和|cRXP_ENEMY_守卫|r和|cRXP_ENEMY_影法师|r
>>击杀|cRXP_ENEMY_暗影法师|r, 以获取他们的|cRXP_LOOT_无辜之血瓶|r
.complete 549,1 
.mob +Syndicate Rogue
.complete 549,2 
.mob +Syndicate Watchman
.complete 1066,1 
.mob +Syndicate Shadow Mage
step
#completewith Togthar
.goto Hillsbrad Foothills,79.55,41.85,15,0
>>击杀|cRXP_ENEMY_狱卒埃斯顿|r, 搜刮他的|cRXP_LOOT_铁钥匙|r
>>|cRXP_WARN_他可以在|cRXP_FRIENDLY_Tog'thar|r的军营前, 或在|cRXP_FRIENDLY_德鲁尔|r的面前找到|r
.collect 3467,1,498,1 
.mob Jailor Eston
step
#loop
.goto Hillsbrad Foothills,79.45,40.57,0
.goto Hillsbrad Foothills,77.99,40.19,0
.goto Hillsbrad Foothills,79.45,40.57,15,0
.goto Hillsbrad Foothills,77.99,40.19,15,0
>>击杀|cRXP_ENEMY_狱卒玛尔根|r, 搜刮他的|cRXP_LOOT_金钥匙|r
>>|cRXP_WARN_他可以在|cRXP_FRIENDLY_Tog'thar|r前方或塔楼底部找到|r
.collect 3499,1,498,2 
.mob Jailor Marlgen
step
#label Togthar
.goto Hillsbrad Foothills,79.79,39.65
>>点击地面上的|cRXP_PICK_链球|r
.complete 498,2 
step << Rogue/Hunter/Shaman
.goto Hillsbrad Foothills,80.14,38.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波刃短剑|r交谈
>>如果她那里有售, 请向她购买[|cRXP_FRIENDLY_捕猎短裤|r]和[|cRXP_FRIENDLY_野狼护腕|r]
.vendor >>NPC与修理
.target Kris Legace
.money <1.1374
.itemcount 4831,<1
.itemcount 4794,<1
.itemStat 7,ITEM_MOD_ARMOR_SHORT,<76
.itemStat 9,ITEM_MOD_ARMOR_SHORT,<37
step << Rogue/Hunter/Shaman/Druid
.goto Hillsbrad Foothills,80.14,38.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波刃短剑|r交谈
>>如果她有 |T134590:0|t[|cRXP_FRIENDLY_捕猎短裤|r], 就向她购买
.vendor >>NPC与修理
.target Kris Legace
.money <0.7859
.itemcount 4831,<1
.itemStat 7,ITEM_MOD_ARMOR_SHORT,<76
step << Rogue/Hunter/Shaman/Druid
.goto Hillsbrad Foothills,80.14,38.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波刃短剑|r交谈
>>如果他们上线, 从她那里购买|T132603:0|t[|cRXP_FRIENDLY_野狼护腕|r]
.vendor >>NPC与修理
.target Kris Legace
.money <0.3515
.itemcount 4794,<1
.itemStat 9,ITEM_MOD_ARMOR_SHORT,<37
step << Rogue/Hunter/Shaman/Druid
#completewith Drull
+装备 |T134590:0|t[|cRXP_FRIENDLY_捕猎短裤|r] 和 |T132603:0|t[|cRXP_FRIENDLY_野狼护腕|r]
.use 4831
.use 4794
.itemcount 4831,1
.itemcount 4794,1
.itemStat 7,ITEM_MOD_ARMOR_SHORT,<76
.itemStat 9,ITEM_MOD_ARMOR_SHORT,<37
.equip 9,4794
.equip 7,1831
step << Rogue/Hunter/Shaman/Druid
#completewith Drull
+装备 |T134590:0|t[|cRXP_FRIENDLY_捕猎短裤|r]
.use 4831
.itemcount 4831,1
.itemStat 7,ITEM_MOD_ARMOR_SHORT,<76
.equip 7,1831
step << Rogue/Hunter/Shaman/Druid
#completewith Drull
+装备 |T132603:0|t[|cRXP_FRIENDLY_野狼护腕|r]
.use 4794
.itemcount 4794,1
.itemStat 9,ITEM_MOD_ARMOR_SHORT,<37
.equip 9,4794
step << !Rogue !Hunter !Shaman !Druid
.goto Hillsbrad Foothills,80.14,38.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波刃短剑|r交谈
.vendor >>NPC与修理
.target Kris Legace
step
#loop
.goto Hillsbrad Foothills,79.55,41.85,0
.goto Hillsbrad Foothills,75.31,41.63,0
.goto Hillsbrad Foothills,79.55,41.85,15,0
.goto Hillsbrad Foothills,75.31,41.63,15,0
>>击杀|cRXP_ENEMY_狱卒埃斯顿|r, 搜刮他的|cRXP_LOOT_铁钥匙|r
>>|cRXP_WARN_他可以在|cRXP_FRIENDLY_Tog'thar|r的军营前, 或在|cRXP_FRIENDLY_德鲁尔|r的面前找到|r
.collect 3467,1,498,1 
.mob Jailor Eston
step
#label Drull
.goto Hillsbrad Foothills,75.33,41.50
>>点击地面上的|cRXP_PICK_链球|r
.complete 498,1 
step
#completewith next
>>击杀 |cRXP_ENEMY_辛迪加潜行者|r和 |cRXP_ENEMY_辛迪加守卫|r
.complete 549,1 
.mob +Syndicate Rogue
.complete 549,2 
.mob +Syndicate Watchman
step
#loop
.goto Hillsbrad Foothills,67.22,45.85,0
.goto Hillsbrad Foothills,67.88,47.93,40,0
.goto Hillsbrad Foothills,67.06,50.84,40,0
.goto Hillsbrad Foothills,66.24,48.79,40,0
.goto Hillsbrad Foothills,65.36,48.65,40,0
.goto Hillsbrad Foothills,64.86,47.05,40,0
.goto Hillsbrad Foothills,65.37,46.46,40,0
.goto Hillsbrad Foothills,66.13,45.63,40,0
.goto Hillsbrad Foothills,67.22,45.85,40,0
>>击杀|cRXP_ENEMY_辛迪加暗影法师|r. 掠夺他们以获取|cRXP_LOOT_药剂瓶|r
>>|cRXP_WARN_在要塞西南方向的塔楼里可以找到更多|r
.complete 1066,1 
.mob Syndicate Shadow Mage
step
#loop
.goto Hillsbrad Foothills,67.22,45.85,0
.goto Hillsbrad Foothills,67.88,47.93,40,0
.goto Hillsbrad Foothills,67.06,50.84,40,0
.goto Hillsbrad Foothills,66.24,48.79,40,0
.goto Hillsbrad Foothills,65.36,48.65,40,0
.goto Hillsbrad Foothills,64.86,47.05,40,0
.goto Hillsbrad Foothills,65.37,46.46,40,0
.goto Hillsbrad Foothills,66.13,45.63,40,0
.goto Hillsbrad Foothills,67.22,45.85,40,0
>>击杀 |cRXP_ENEMY_辛迪加潜行者|r和 |cRXP_ENEMY_辛迪加守卫|r
>>|cRXP_WARN_在要塞西南方向的塔楼里可以找到更多|r
.complete 549,1 
.mob +Syndicate Rogue
.complete 549,2 
.mob +Syndicate Watchman
step
#completewith TarrenMillTurnins1
>>返回塔伦米尔的路上击杀|cRXP_ENEMY_熊|r和|cRXP_ENEMY_蜘蛛|r. 击杀后搜刮它们的|cRXP_LOOT_舌头|r和|cRXP_LOOT_蛊汁|r
>>|cRXP_WARN_避开|r|cRXP_ENEMY_老灰熊|r|cRXP_WARN_和|r|cRXP_ENEMY_巨型食苔蛛|r|cRXP_WARN_, 因为它们等级较高, 不值得击杀|r
.complete 496,1 
.mob +Gray Bear
.mob +Vicious Gray Bear
.complete 496,2 
.mob +Forest Moss Creeper
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lydon|r和|rDarthalia|r和|r克鲁斯克|r交谈
.turnin 1066 >>交任务: |cRXP_FRIENDLY_无辜者之血|r
.turnin 496 >>交任务: |cRXP_FRIENDLY_受难药剂|r
.accept 499 >>接任务: |cRXP_LOOT_受难药剂|r
.target +Apothecary Lydon
.goto Hillsbrad Foothills,61.50,19.20
.turnin 549 >>交任务: |cRXP_FRIENDLY_通缉：辛迪加成员|r
.target +High Executor Darthalia
.goto Hillsbrad Foothills,62.20,20.50
.turnin 498 >>交任务: |cRXP_FRIENDLY_拯救行动|r
.target +Krusk
.goto Hillsbrad Foothills,63.20,20.70
.isQuestComplete 496
step
.goto Hillsbrad Foothills,61.50,19.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lydon|r和|cRXP_FRIENDLY_Darthalia|r交谈
.accept 499 >>接任务: |cRXP_LOOT_受难药剂|r
.isQuestTurnedIn 496
step
.goto Hillsbrad Foothills,61.55,19.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌比|r 交谈
.turnin 499 >>交任务: |cRXP_FRIENDLY_受难药剂|r
.target Umpi
.isQuestTurnedIn 496
step
#label TarrenMillTurnins1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lydon|r和|rDarthalia|r和|r克鲁斯克|r交谈
.turnin 1066 >>交任务: |cRXP_FRIENDLY_无辜者之血|r
.target +Apothecary Lydon
.goto Hillsbrad Foothills,61.50,19.20
.turnin 549 >>交任务: |cRXP_FRIENDLY_通缉：辛迪加成员|r
.target +High Executor Darthalia
.goto Hillsbrad Foothills,62.20,20.50
.turnin 498 >>交任务: |cRXP_FRIENDLY_拯救行动|r
.target +Krusk
.goto Hillsbrad Foothills,63.20,20.70
step
.goto Hillsbrad Foothills,62.76,19.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板沙恩|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Shay
step << Hunter
.goto Hillsbrad Foothills,62.56,19.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kayren交谈|r
>>|cRXP_BUY_从他那里购买|r |T132382:0|t[锋利的箭] |r
.collect 2515,1800,527,1 << Hunter 
.target Kayren Soothallow
.xp >25,1
.itemcount 2515,<1000
step << Hunter
.goto Hillsbrad Foothills,62.56,19.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kayren交谈|r
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,1800,527,1 << Hunter 
.target Kayren Soothallow
.xp <25,1
.itemcount 3030,<1000
step
#completewith FarmerRay
.destroy 3499 >>摧毁: |cRXP_ENEMY_抛光的金钥匙|r, 它在你的背包中. 不再需要它了
step
#completewith Fields1
>>击杀|cRXP_ENEMY_灰熊|r和|cRXP_ENEMY_饥饿的山地狮|r. 击败它们后拾取|cRXP_LOOT_灰熊的舌头|r和|cRXP_LOOT_山地狮的血液|r
.complete 496,1 
.mob +Gray Bear
.mob +Vicious Gray Bear
.complete 501,1 
.mob +Starving Mountain Lion
.isOnQuest 496
step
#completewith Fields1
>>击杀|cRXP_ENEMY_饥饿的山地狮|r. 击杀后可掠夺其|cRXP_LOOT_山地狮的血液|r
.complete 501,1 
.mob Starving Mountain Lion
.isQuestTurnedIn 496
step
#label Fields1
.goto Hillsbrad Foothills,36.7,39.4
.subzone 286 >>前往希尔斯布莱德丘陵
.isOnQuest 527
step
#completewith FarmerRay
>>击杀希尔斯布莱德农夫和希尔斯布莱德雇农, 地点位于农田及周边区域
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_希尔斯布莱德农夫|r|cRXP_WARN_可能|r|T132343:0|t[解除武装] |cRXP_WARN_你|r|r << Rogue/Warrior/Shaman
.complete 527,1 
.mob +Hillsbrad Farmer
.complete 527,2 
.mob +Hillsbrad Farmhand
step
#loop
.goto Hillsbrad Foothills,36.7,39.4,0
.goto Hillsbrad Foothills,36.7,39.4,60,0
.goto Hillsbrad Foothills,35.2,37.6,45,0
.goto Hillsbrad Foothills,35.1,41.0,60,0
>>击杀 |cRXP_ENEMY_农夫盖兹|r. 他可能在房子里和谷仓里或田野里
.complete 527,4 
.unitscan Farmer Getz
step
#label FarmerRay
#loop
.goto Hillsbrad Foothills,33.28,34.65,0
.goto Hillsbrad Foothills,33.65,35.44,30,0
.goto Hillsbrad Foothills,32.90,35.23,10,0
.goto Hillsbrad Foothills,33.23,34.65,10,0
.goto Hillsbrad Foothills,32.69,34.77,8,0
.goto Hillsbrad Foothills,32.88,34.99,8,0
.goto Hillsbrad Foothills,33.28,34.65,8,0
>>击杀|cRXP_ENEMY_农夫雷恩|r
>>|cRXP_WARN_他可能在葡萄藤下的户外区域, 或房屋的一楼和二楼生成|r
.complete 527,3 
.unitscan Farmer Ray
step
#loop
.goto Hillsbrad Foothills,31.30,37.08,0
.goto Hillsbrad Foothills,31.30,37.08,40,0
.goto Hillsbrad Foothills,33.81,40.91,40,0
.goto Hillsbrad Foothills,35.49,40.36,40,0
>>击杀希尔斯布莱德农夫和希尔斯布莱德雇农, 地点位于农田及周边区域
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_希尔斯布莱德农夫|r|cRXP_WARN_可能|r|T132343:0|t[解除武装] |cRXP_WARN_你|r|r << Rogue/Warrior/Shaman
.complete 527,1 
.mob +Hillsbrad Farmer
.complete 527,2 
.mob +Hillsbrad Farmhand
step
#completewith next
>>击杀|cRXP_ENEMY_Bears|r. 击杀后搜刮其|cRXP_LOOT_Tongues|r
.complete 496,1 
.mob Gray Bear
.mob Vicious Gray Bear
step
#loop
.goto Hillsbrad Foothills,54.77,28.72,0
.goto Hillsbrad Foothills,39.79,34.43,60,0
.goto Hillsbrad Foothills,38.70,36.71,60,0
.goto Hillsbrad Foothills,38.45,38.77,60,0
.goto Hillsbrad Foothills,39.88,40.56,60,0
.goto Hillsbrad Foothills,37.97,44.59,60,0
.goto Hillsbrad Foothills,39.92,45.83,60,0
.goto Hillsbrad Foothills,40.91,44.23,60,0
.goto Hillsbrad Foothills,42.56,40.19,60,0
.goto Hillsbrad Foothills,43.36,39.38,60,0
.goto Hillsbrad Foothills,51.28,35.37,60,0
.goto Hillsbrad Foothills,54.29,31.75,60,0
.goto Hillsbrad Foothills,52.93,29.45,60,0
.goto Hillsbrad Foothills,54.77,28.72,60,0
>>击杀|cRXP_ENEMY_山地狮|r. 击败它们获取|cRXP_LOOT_血液|r掉落
.complete 501,1 
.mob Starving Mountain Lion
step
#completewith TarrenMillTurnins2
>>击杀返回塔伦米尔途中遇到的熊, 从它们身上获取舌头
.complete 496,1 
.mob Gray Bear
.mob Vicious Gray Bear
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lydon|r和|cRXP_FRIENDLY_Darthalia|r和|cRXP_FRIENDLY_Samsa|r交谈
.turnin 496 >>交任务: |cRXP_FRIENDLY_受难药剂|r
.accept 499 >>接任务: |cRXP_LOOT_受难药剂|r
.turnin 501 >>交任务: |cRXP_FRIENDLY_痛苦药剂|r
.accept 502 >>接任务: |cRXP_LOOT_痛苦药剂|r
.target +Apothecary Lydon
.goto Hillsbrad Foothills,61.50,19.20
.turnin 527 >>交任务: |cRXP_FRIENDLY_希尔斯布莱德之战|r
.accept 528 >>接任务: |cRXP_LOOT_希尔斯布莱德之战|r
.target +High Executor Darthalia
.goto Hillsbrad Foothills,62.20,20.50
.accept 546 >>接任务: |cRXP_LOOT_死亡的纪念品|r
.target +Deathguard Samsa
.goto Hillsbrad Foothills,62.11,19.68
.isQuestComplete 496
step
.goto Hillsbrad Foothills,61.50,19.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lydon|r和|cRXP_FRIENDLY_Darthalia|r交谈
.accept 499 >>接任务: |cRXP_LOOT_受难药剂|r
.isQuestTurnedIn 496
step
.goto Hillsbrad Foothills,61.55,19.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌比|r 交谈
.turnin 499 >>交任务: |cRXP_FRIENDLY_受难药剂|r
.target Umpi
.isQuestTurnedIn 496
step
#label TarrenMillTurnins2
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lydon|r和|cRXP_FRIENDLY_Darthalia|r和|cRXP_FRIENDLY_Samsa|r交谈
.turnin 501 >>交任务: |cRXP_FRIENDLY_痛苦药剂|r
.accept 502 >>接任务: |cRXP_LOOT_痛苦药剂|r
.target +Apothecary Lydon
.goto Hillsbrad Foothills,61.50,19.20
.turnin 527 >>交任务: |cRXP_FRIENDLY_希尔斯布莱德之战|r
.accept 528 >>接任务: |cRXP_LOOT_希尔斯布莱德之战|r
.target +High Executor Darthalia
.goto Hillsbrad Foothills,62.20,20.50
.accept 546 >>接任务: |cRXP_LOOT_死亡的纪念品|r
.target +Deathguard Samsa
.goto Hillsbrad Foothills,62.11,19.68
step
.goto Hillsbrad Foothills,62.76,19.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板沙恩|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Shay
step
#completewith next
>>击杀返回希尔斯布莱德平原路上的|cRXP_ENEMY_Bears|r, 搜刮它们掉落的|cRXP_LOOT_Tongues|r
.complete 496,1 
.mob Gray Bear
.mob Vicious Gray Bear
step
.goto Hillsbrad Foothills,36.02,39.19,150 >>奔向希尔斯布莱德丘陵
.isOnQuest 528
step
#completewith Kalaba
>>击杀|cRXP_ENEMY_希尔斯布莱德人类|r. 搜刮他们的|cRXP_LOOT_头骨|r
>>|cRXP_WARN_这个任务无需立即完成|r
.complete 546,1,17 
step
#completewith next
.goto Hillsbrad Foothills,32.67,35.33
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯坦利|r 交谈
>>|cRXP_WARN_等待RP结束, 然后击杀|r|cRXP_ENEMY_暴怒的斯坦利|r
>>|cRXP_ENEMY_暴怒的斯坦利|r|cRXP_WARN_提供完整任务经验|r
.turnin 502 >>交任务: |cRXP_FRIENDLY_痛苦药剂|r
.timer 9,Stanley RP (BE ALERT)
.mob Stanley
step
.line Hillsbrad Foothills,36.54,39.44,35.36,38.73,33.98,38.78,32.56,40.03,32.58,38.17,32.66,36.08,32.92,35.25,32.66,36.08,32.58,38.17,32.56,40.03,32.65,41.12,32.45,42.58,31.27,42.06,30.53,40.56,31.27,42.06,32.45,42.58,32.41,43.85,32.46,44.59,32.29,45.13
#loop
.goto Hillsbrad Foothills,36.54,39.44,0
.goto Hillsbrad Foothills,36.54,39.44,40,0
.goto Hillsbrad Foothills,35.36,38.73,40,0
.goto Hillsbrad Foothills,33.98,38.78,40,0
.goto Hillsbrad Foothills,32.56,40.03,40,0
.goto Hillsbrad Foothills,32.58,38.17,40,0
.goto Hillsbrad Foothills,32.66,36.08,40,0
.goto Hillsbrad Foothills,32.92,35.25,40,0
.goto Hillsbrad Foothills,32.56,40.03,40,0
.goto Hillsbrad Foothills,32.65,41.12,40,0
.goto Hillsbrad Foothills,32.45,42.58,40,0
.goto Hillsbrad Foothills,31.27,42.06,40,0
.goto Hillsbrad Foothills,30.53,40.56,40,0
.goto Hillsbrad Foothills,31.27,42.06,40,0
.goto Hillsbrad Foothills,32.45,42.58,40,0
.goto Hillsbrad Foothills,32.41,43.85,40,0
.goto Hillsbrad Foothills,32.46,44.59,40,0
.goto Hillsbrad Foothills,32.29,45.13,40,0
.goto Hillsbrad Foothills,32.45,42.58,40,0
.goto Hillsbrad Foothills,32.56,40.03,40,0
>>击杀|cRXP_ENEMY_平民维尔克斯|r
>>|cRXP_WARN_他沿着小镇的道路巡逻|r
.complete 567,2 
.unitscan Citizen Wilkes
.unitscan Enraged Stanley
step
.goto Hillsbrad Foothills,32.67,35.33
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯坦利|r 交谈
>>|cRXP_WARN_等待RP结束, 然后击杀|r|cRXP_ENEMY_暴怒的斯坦利|r
>>|cRXP_ENEMY_暴怒的斯坦利|r|cRXP_WARN_提供完整任务经验|r
.turnin 502 >>交任务: |cRXP_FRIENDLY_痛苦药剂|r
.timer 9,Stanley RP (BE ALERT)
.mob Stanley
step
#completewith next
>>击杀|cRXP_ENEMY_希尔斯布莱德农民|r
.complete 528,1 
.mob Hillsbrad Peasant
step
#label Kalaba
.goto Hillsbrad Foothills,36.00,46.50
>>击杀|cRXP_ENEMY_农夫卡拉巴|r
.complete 567,4 
.mob Farmer Kalaba
step
#loop
.goto Hillsbrad Foothills,36.64,45.21,0
.goto Hillsbrad Foothills,36.64,45.21,25,0
.goto Hillsbrad Foothills,36.03,44.40,25,0
.goto Hillsbrad Foothills,34.36,44.62,25,0
.goto Hillsbrad Foothills,33.82,45.75,25,0
.goto Hillsbrad Foothills,33.25,48.54,25,0
.goto Hillsbrad Foothills,34.59,48.13,25,0
.goto Hillsbrad Foothills,35.29,47.28,25,0
.goto Hillsbrad Foothills,36.49,47.49,25,0
>>击杀|cRXP_ENEMY_希尔斯布莱德农民|r
.complete 528,1 
.mob Hillsbrad Peasant
step
#loop
.goto Hillsbrad Foothills,66.52,34.52,0
.goto Hillsbrad Foothills,40.88,33.87,60,0
.goto Hillsbrad Foothills,40.86,37.40,60,0
.goto Hillsbrad Foothills,40.85,39.42,60,0
.goto Hillsbrad Foothills,38.50,38.04,60,0
.goto Hillsbrad Foothills,37.68,41.23,60,0
.goto Hillsbrad Foothills,38.71,42.66,60,0
.goto Hillsbrad Foothills,40.40,44.65,60,0
.goto Hillsbrad Foothills,44.39,41.34,60,0
.goto Hillsbrad Foothills,45.23,39.62,60,0
.goto Hillsbrad Foothills,43.87,37.01,60,0
.goto Hillsbrad Foothills,49.75,34.33,60,0
.goto Hillsbrad Foothills,52.06,36.86,60,0
.goto Hillsbrad Foothills,51.91,32.97,60,0
.goto Hillsbrad Foothills,52.39,29.27,60,0
.goto Hillsbrad Foothills,57.38,22.85,60,0
.goto Hillsbrad Foothills,57.09,25.67,60,0
.goto Hillsbrad Foothills,58.08,28.07,60,0
.goto Hillsbrad Foothills,56.88,28.85,60,0
.goto Hillsbrad Foothills,59.68,30.90,60,0
.goto Hillsbrad Foothills,57.71,34.06,60,0
.goto Hillsbrad Foothills,59.89,36.74,60,0
.goto Hillsbrad Foothills,62.63,37.64,60,0
.goto Hillsbrad Foothills,64.73,38.03,60,0
.goto Hillsbrad Foothills,66.52,34.52,60,0
>>击杀|cRXP_ENEMY_Bears|r. 击杀后搜刮它们的|cRXP_LOOT_Tongues|r
.complete 496,1 
.mob Gray Bear
.mob Vicious Gray Bear
step
#loop
.goto Hillsbrad Foothills,62.85,38.74,0
.goto Hillsbrad Foothills,62.85,38.74,60,0
.goto Hillsbrad Foothills,62.24,39.96,60,0
.goto Hillsbrad Foothills,60.92,37.92,60,0
.goto Hillsbrad Foothills,59.62,33.33,60,0
.goto Hillsbrad Foothills,56.88,29.73,60,0
.goto Hillsbrad Foothills,59.80,27.72,60,0
.goto Hillsbrad Foothills,57.63,24.16,60,0
.goto Hillsbrad Foothills,56.47,16.42,60,0
.goto Hillsbrad Foothills,59.36,14.55,60,0
.goto Hillsbrad Foothills,60.54,13.67,60,0
.goto Hillsbrad Foothills,62.65,12.90,60,0
.goto Hillsbrad Foothills,64.43,10.22,60,0
.goto Hillsbrad Foothills,65.18,6.93,60,0
.goto Hillsbrad Foothills,65.31,5.76,60,0
.goto Hillsbrad Foothills,66.90,9.02,60,0
.goto Hillsbrad Foothills,70.39,8.89,60,0
.goto Hillsbrad Foothills,68.86,10.18,60,0
.goto Hillsbrad Foothills,67.35,12.95,60,0
.goto Hillsbrad Foothills,71.38,19.81,60,0
.goto Hillsbrad Foothills,71.78,21.89,60,0
.goto Hillsbrad Foothills,64.85,24.92,60,0
.goto Hillsbrad Foothills,66.68,28.15,60,0
.goto Hillsbrad Foothills,69.76,31.89,60,0
.goto Hillsbrad Foothills,67.62,37.65,60,0
>>击杀|cRXP_ENEMY_森林食苔蛛|r 和|cRXP_ENEMY_巨型食苔蛛|r , 从它们身上搜刮|cRXP_LOOT_Ichor|r
.complete 496,2 
.mob Forest Moss Creeper
.mob Giant Moss Creeper
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lydon|r和|cRXP_FRIENDLY_Darthalia|r交谈
.turnin 496 >>交任务: |cRXP_FRIENDLY_受难药剂|r
.accept 499 >>接任务: |cRXP_LOOT_受难药剂|r
.accept 1067 >>接任务: |cRXP_LOOT_返回雷霆崖|r
.target +Apothecary Lydon
.goto Hillsbrad Foothills,61.50,19.20
.turnin 528 >>交任务: |cRXP_FRIENDLY_希尔斯布莱德之战|r
.target +High Executor Darthalia
.goto Hillsbrad Foothills,62.20,20.50
.isQuestComplete 496
step
.goto Hillsbrad Foothills,61.50,19.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lydon|r和|cRXP_FRIENDLY_Darthalia|r交谈
.accept 499 >>接任务: |cRXP_LOOT_受难药剂|r
.isQuestTurnedIn 496
step
.goto Hillsbrad Foothills,61.55,19.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌比|r 交谈
.turnin 499 >>交任务: |cRXP_FRIENDLY_受难药剂|r
.target Umpi
.isQuestTurnedIn 496
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lydon|r和|cRXP_FRIENDLY_Darthalia|r交谈
.accept 1067 >>接任务: |cRXP_LOOT_返回雷霆崖|r
.target +Apothecary Lydon
.goto Hillsbrad Foothills,61.50,19.20
.turnin 528 >>交任务: |cRXP_FRIENDLY_希尔斯布莱德之战|r
.target +High Executor Darthalia
.goto Hillsbrad Foothills,62.20,20.50
step
.goto Hillsbrad Foothills,62.76,19.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板沙恩|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Shay
step << Hunter
.goto Hillsbrad Foothills,62.56,19.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kayren交谈|r
>>|cRXP_BUY_从他那里购买|r |T132382:0|t[锋利的箭] |r
.collect 2515,1800,516,1 << Hunter 
.target Kayren Soothallow
.itemcount 2515,<1000
.xp >25,1
step << Hunter
.goto Hillsbrad Foothills,62.56,19.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kayren交谈|r
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,1800,516,1 << Hunter 
.target Kayren Soothallow
.itemcount 3030,<1000
.xp <25,1
step << Shaman/Warrior
.goto Hillsbrad Foothills,60.43,26.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥特|r交谈
.vendor >>|cRXP_BUY_如果该物品已上线且你尚未拥有, 请从他那里购买|r|T132408:0|t[无情战斧]|r
.money <3.0195
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<21.0
.target Ott
step << Rogue
.goto Hillsbrad Foothills,60.43,26.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥特|r交谈
.vendor >>|cRXP_BUY_如果该物品已上架且你尚未拥有, 可以从他那里购买 a|r|T135640:0|t[宽刃小刀]|r
.money <2.8372
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.7
.target Ott
step
#completewith BerensPerilTurnin
.goto Hillsbrad Foothills,60.14,18.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞斯|r交谈
.fly The Sepulcher>>飞往瑟伯切尔
.target Zarise
.zoneskip Silverpine Forest
step
#sticky
#completewith EnterSFK
.subzone 209,2 >>现在你应该寻找一个前往影牙城堡的队伍
.dungeon SFK
step
.goto Silverpine Forest,43.98,40.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾利斯特|r交谈
.turnin 480 >>交任务: |cRXP_FRIENDLY_法师的头领|r
.turnin 516 >>交任务: |cRXP_FRIENDLY_博伦的巢穴|r
.target Shadow Priest Allister
.isQuestComplete 480
.group
step
#label BerensPerilTurnin
.goto Silverpine Forest,43.98,40.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾利斯特|r交谈
.turnin 516 >>交任务: |cRXP_FRIENDLY_博伦的巢穴|r
.target Shadow Priest Allister
step
.goto Silverpine Forest,43.43,40.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hadrec|r交谈
.accept 1098 >>接任务: |cRXP_WARN_影牙城堡里的亡灵哨兵|r
.target High Executor Hadrec
.dungeon SFK
step
.goto Silverpine Forest,44.22,39.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达拉尔交谈|cRXP_FRIENDLY_Dalar|r
.accept 1014 >>接任务: |cRXP_WARN_除掉阿鲁高|r
.target Dalar Dawnweaver
.dungeon SFK
step
#label EnterSFK
.goto Silverpine Forest,44.87,67.86
.subzone 209,2 >>进入SFK副本传送门. 区域切换
.dungeon SFK
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vincent|r交谈
.turnin 1098 >>交任务: |cRXP_FRIENDLY_影牙城堡里的亡灵哨兵|r
.target Deathstalker Vincent
.dungeon SFK
.isOnQuest 1098
step
>>从|cRXP_ENEMY_吞噬者芬鲁斯|r房间的书架上拾取|cRXP_PICK_乌尔之书|r
.complete 1013,1 
.dungeon SFK
.isOnQuest 1013
step
>>击杀|r|cRXP_ENEMY_大法师阿鲁高|r. 从他身上搜刮|r|cRXP_LOOT_头|r
.complete 1014,1 
.mob Archmage Arugal
.dungeon SFK
.isOnQuest 1014
step
#completewith FlytoUC
.goto Silverpine Forest,45.51,41.26,150,0
.subzone 228 >>前往瑟伯切尔
.dungeon SFK
step
.goto Silverpine Forest,43.43,40.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hadrec|r交谈
.turnin 1098 >>交任务: |cRXP_FRIENDLY_影牙城堡里的亡灵哨兵|r
.target High Executor Hadrec
.dungeon SFK
.isQuestComplete 1098
step
.goto Silverpine Forest,44.22,39.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达拉尔交谈|cRXP_FRIENDLY_Dalar|r
.turnin 1014 >>交任务: |cRXP_FRIENDLY_除掉阿鲁高|r
.target Dalar Dawnweaver
.dungeon SFK
.isQuestComplete 1014
step << Mage
#completewith ThunderBluffHS
.cast 3563 >>传送 |T135766:0|t[传送:幽暗城]
.zoneskip Undercity
step << !Mage
#label FlytoUC
#completewith ThunderBluffHS
.goto Silverpine Forest,45.62,42.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与卡拉斯交谈(|cRXP_FRIENDLY_Karos|r)
.fly Undercity >>飞往幽暗城
.target Karos Razok
.zoneskip Undercity
step
#label HusbandsRevenge
.goto Undercity,62.02,42.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱克兰|r交谈
.turnin 530 >>交任务: |cRXP_FRIENDLY_丈夫的复仇|r
.target Raleigh Andrean
.isQuestComplete 530
step
.goto Undercity,65.99,44.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉|r交谈
.bankdeposit 3692 >>存入你的 |T133730:0|t[|cRXP_LOOT_希尔斯布莱德人类颅骨|r]
.bankwithdraw 5075 >>取出你的|T134128:0|t[血岩碎片]
.bankwithdraw 5059 >>取出你的 |T132938:0|t[掘地铲]
.target William Montague
step
.goto Undercity,53.74,54.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bel'dugur|r交谈
.turnin 1013 >>交任务: |cRXP_FRIENDLY_乌尔之书|r
.target Keeper Bel'dugur
.dungeon SFK
.isQuestComplete 1013
step << Warrior
.goto Undercity,48.32,15.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安吉拉|r交谈
.train 5308 >>训练你的职业法术
.target Angela Curthas
.xp <24,1
.xp >26,1
step << Warrior
#optional
.goto Undercity,48.32,15.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安吉拉|r交谈
.train 6178 >>训练你的职业法术
.target Angela Curthas
.xp <26,1
step << Rogue
.goto Undercity,75.19,51.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_伊瑟基尔|r|cRXP_BUY_交谈. 从他那里购买|r|T133849:0|t[腐朽之尘]|cRXP_BUY_和|r|T132793:0|t[空瓶]|r
.collect 2928,40,1067,1 
.collect 3371,40,1067,1 
.target Ezekiel Graves
step << Rogue
#completewith ThunderBluffHS
>>制作 |T132273:0|t[速效药膏]
.collect 6947,40,1067,1 
step << Rogue
.goto Undercity,83.86,72.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
.train 6762 >>训练你的职业法术
.target Carolyn Ward
.xp <24,1
.xp >26,1
step << Rogue
#optional
.goto Undercity,83.86,72.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
.train 1833 >>训练你的职业法术
.target Carolyn Ward
.xp <26,1
step << Warlock
.goto Undercity,88.93,15.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richard|r交谈
.train 6223 >>训练你的职业法术
.target Richard Kerwin
.xp <24,1
.xp >26,1
step << Warlock
#optional
.goto Undercity,88.93,15.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richard|r交谈
.train 1456 >>训练你的职业法术
.target Richard Kerwin
.xp <26,1
step << Druid
#completewith next
.cast 18960 >>施放 |T135758:0|t[传送:月光林地]
.zoneskip Moonglade
step << Druid
.goto Moonglade,36.026,41.374
>>|cRXP_WARN_在雷姆洛斯神殿将两个吊坠合成, 即可获得|r|cRXP_LOOT_海狮坠饰|r
.collect 15882,1,30,1,1
.collect 15883,1,30,1,1
.complete 30,1 
step << Druid
.goto Moonglade,56.21,30.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dendrite|r交谈
.turnin 30 >>交任务: |cRXP_FRIENDLY_海狮试炼|r
.accept 31 >>接任务: |cRXP_LOOT_水栖形态|r
.target Dendrite Starblaze
step
#label ThunderBluffHS
.hs >>炉石传送至雷霆崖
.use 6948
.zoneskip Thunder Bluff
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde-
#name 25-27 南贫瘠之地/石爪山
#displayname 25-27 南贫瘠之地/石爪山 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 20-30
#next 27-29级灰谷
step
#optional
.abandon 480 >>放弃法师头领
.isOnQuest 480
step
#optional
.abandon 1013 >>放弃《乌尔之书》
.isOnQuest 1013
.dungeon SFK
step
#optional
.abandon 1014 >>除掉阿鲁高
.isOnQuest 1014
.dungeon SFK
step
#optional
.abandon 1098 >>放弃影牙城堡里的亡灵哨兵
.isOnQuest 1098
.dungeon SFK
step << Shaman/Warrior
.goto Thunder Bluff,54.06,57.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Delgo交谈|r
.vendor >>|cRXP_BUY_如果该物品已上线且你尚未拥有, 请从他那里购买|r|T132408:0|t[无情战斧]|r
.money <3.0195
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<21.0
.target Delgo Ragetotem
step << Hunter
#completewith HunterTraining26
.goto Thunder Bluff,61.31,78.25,80 >>前往猎人高地
step << Hunter
.goto Thunder Bluff,59.13,86.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 14262 >>训练你的职业法术
.target Urek Thunderhorn
.xp <24,1
.xp >26,1
step << Hunter
#optional
.goto Thunder Bluff,59.13,86.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 3045 >>训练你的职业法术
.target Urek Thunderhorn
.xp <26,1
step << Hunter
#label HunterTraining26
.goto Thunder Bluff,54.07,84.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hesuwa|r交谈
.train 24558 >>训练你的宠物法术
.target Hesuwa Thunderhorn
step << Druid
#completewith next
.goto Thunder Bluff,69.88,30.90,80 >>前往长者高地
step << Druid
.goto Thunder Bluff,76.48,27.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
.trainer >>训练你的职业法术
.turnin 31 >>交任务: |cRXP_FRIENDLY_水栖形态|r
.target Turak Runetotem
step << Hunter
.goto Thunder Bluff,46.98,45.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库纳·雷角|r交谈
.vendor >>|cRXP_BUY_如果有的话, 从她那里购买 a|r|T135495:0|t[强韧的弯弓]|r
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.9
.target Kuna Thunderhorn
.money <1.9467
step
#completewith next
.goto Thunder Bluff,28.14,32.97,40,0
.goto Thunder Bluff,28.51,28.95,10 >>前往灵魂高地, 进入幻视之池
step
.goto Thunder Bluff,22.90,21.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
.turnin 1067 >>交任务: |cRXP_FRIENDLY_返回雷霆崖|r
.accept 1086 >>接任务: |cRXP_LOOT_地精空港|r
.target Apothecary Zamah
step << Priest
.goto Thunder Bluff,25.31,15.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈尔斯|r交谈
.train 3747 >>训练你的职业法术
.target Miles Welsh
.xp <24,1
.xp >26,1
step << Priest
#optional
.goto Thunder Bluff,25.31,15.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈尔斯|r交谈
.train 992 >>训练你的职业法术
.target Miles Welsh
.xp <26,1
step << Mage
.goto Thunder Bluff,22.74,14.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shymm|r交谈
.train 8400 >>训练你的职业法术
.target Archmage Shymm
.xp <24,1
.xp >26,1
step << Mage
#optional
.goto Thunder Bluff,22.74,14.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shymm|r交谈
.train 120 >>训练你的职业法术
.target Archmage Shymm
.xp <26,1
step << Shaman
.goto Thunder Bluff,23.64,18.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 905 >>训练你的职业法术
.target Tigor Skychaser
.xp <24,1
.xp >26,1
step << Shaman
#optional
.goto Thunder Bluff,23.64,18.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 8190 >>训练你的职业法术
.target Tigor Skychaser
.xp <26,1
step
#completewith next
+制作 |T133688:0|t[绒线绷带] 直到你的技能达到 115 或更高
.skill firstaid,<1,1
step
.goto Thunder Bluff,29.68,21.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Pand|r交谈
.train 3278 >>训练 |T133687:0|t[厚绒线绷带]
.target Pand Stonebinder
.skill firstaid,<1,1
step
#optional
#completewith FlytoCampT2
>>放弃死亡食谱
.abandon 264 >>放弃死亡食谱
.isOnQuest 264
step
#optional
#completewith FlytoCampT2
>>放弃茉拉·符文图腾
.abandon 3301 >>放弃茉拉·符文图腾
.isOnQuest 264
step
.goto Thunder Bluff,54.96,51.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zangen|r交谈
.accept 1195 >>接任务: |cRXP_LOOT_神圣之火|r
.target Zangen Stonehoof
step
#label FlytoCampT2
#completewith CampTHS2
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Camp Taurajo >>飞往陶拉霍营地
.target Tal
.zoneskip The Barrens
step
.goto The Barrens,44.55,59.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碎牙|r交谈
.accept 879 >>接任务: |cRXP_LOOT_内奸|r
.target Mangletooth
step
#completewith CampTHS2
+|cRXP_WARN_使用你剩余的|r|T134128:0|t[血岩碎片]|cRXP_WARN_来获得|r|T136104:0|t[野猪之皮]|cRXP_WARN_及其他增益效果|r << !Mage !Druid
+|cRXP_WARN_使用你剩余的|r|T134128:0|t[血岩碎片]|cRXP_WARN_来获得增益|r << Mage/Druid
>>|cRXP_WARN_如果可能, 请保存10|r|T134128:0|t[血岩碎片]|cRXP_WARN_, 以便在指南后续阶段利用速度增益|r
>>|cRXP_WARN_请确保关闭 Questie 或 Leatrix Plus 等插件的自动完成功能！|r
.addquestitem 4075,5052
step
.goto The Barrens,44.85,59.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
.accept 6382 >>接任务: |cRXP_LOOT_灰谷狩猎|r
.target Jorn Skyseer
step << Warrior
.goto The Barrens,44.67,59.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑内的 |cRXP_FRIENDLY_鲁迦·狂暴图腾|r交谈
.turnin 1823 >>交任务: |cRXP_FRIENDLY_和鲁迦交谈|r
.accept 1824 >>接任务: |cRXP_LOOT_巨人旷野的试炼|r
.target Ruga Ragetotem
step
#label CampTHS2
.goto The Barrens,45.58,59.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
.home >>将你的炉石设置为陶拉祖营地
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Byula
step
#loop
.goto The Barrens,44.63,62.71,0
.goto The Barrens,45.78,63.09,0
.goto The Barrens,49.57,59.36,0
.goto The Barrens,49.21,61.42,0
.goto The Barrens,44.63,62.71,80,0
.goto The Barrens,45.78,63.09,80,0
.goto The Barrens,49.21,61.42,80,0
.goto The Barrens,49.57,59.36,80,0
>>在该区域附近找到并击杀|cRXP_ENEMY_Owatanka|r(蓝色雷霆蜥蜴). 击败后搜刮其掉落的 |T133723:0|t[|cRXP_LOOT_Owatanka's Tailspike|r], 用它来开启任务
>>|cRXP_WARN_如果找不到他, 请跳过此任务|r
.collect 5102,1,884 
.accept 884 >>接任务: |cRXP_LOOT_奥瓦坦卡|r
.use 5102
.unitscan Owatanka
step << Warrior
#loop
.goto The Barrens,45.17,69.08,0
.goto The Barrens,45.17,69.08,50,0
.goto The Barrens,43.87,68.84,50,0
.goto The Barrens,42.17,69.65,50,0
.goto The Barrens,42.35,71.85,50,0
.goto The Barrens,42.77,72.28,50,0
.goto The Barrens,43.86,72.06,50,0
.goto The Barrens,45.38,72.25,50,0
>>击杀异种护卫者和异种群居蝎和异种爬行者和异种幼蝎. 击败它们后可获得其掉落的 |T133027:0|t[颤抖的触角]
>>|cRXP_WARN_注意:|T133027:0|t[颤抖的触角]效果仅持续15分钟, 请在任务期间勿离开或退出游戏|r
.complete 1824,1 
.mob Silithid Protector
.mob Silithid Swarmer
.mob Silithid Creeper
.mob Silithid Grub
step << Warrior
.goto The Barrens,44.67,59.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑内的 |cRXP_FRIENDLY_鲁迦·狂暴图腾|r交谈
>>|cRXP_WARN_跳过后续任务|r
.turnin 1824 >>交任务: |cRXP_FRIENDLY_巨人旷野的试炼|r
.target Ruga Ragetotem
step
#completewith next
>>击杀|cRXP_ENEMY_异种收割者|r. 击败后拾取其掉落的 |T134321:0|t[|cRXP_LOOT_异种收割者之首|r ], 并使用该物品启动任务
>>|cRXP_WARN_如果找不到他, 就跳过此任务. 这个怪物非常稀有！|r
.collect 5138,1,897,1 
.accept 897 >>接任务: |cRXP_LOOT_收割者|r
.use 5138
.unitscan Silithid Harvester
step
#label SilithidEggs
#loop
.goto The Barrens,42.91,69.86,0
.goto The Barrens,45.04,69.85,60,0
.goto The Barrens,42.91,69.86,60,0
.goto The Barrens,42.97,71.11,60,0
.goto The Barrens,45.36,72.36,60,0
.goto The Barrens,47.40,70.11,60,0
.goto The Barrens,48.40,70.08,60,0
.goto The Barrens,42.91,69.86,60,0
>>掠夺|cRXP_PICK_异种蝎土丘|r以获得|cRXP_LOOT_异种蝎卵|r
.complete 868,1 
step
#completewith Gann1
>>击杀|cRXP_ENEMY_雷鳞蜥蜴|r. 从它们身上搜刮|cRXP_LOOT_闪电腺|r
>>击杀|cRXP_ENEMY_巨型雷鹰|r. 击败它们后可掉落|cRXP_LOOT_Saliva Gland|r
>>击杀|cRXP_ENEMY_Kodos|r. 击败它们以获得|cRXP_LOOT_科多兽的肝脏|r
.complete 822,1 
.mob +Greater Thunderhawk
.complete 822,2 
.mob +Stormhide
.complete 822,3 
.mob +Barrens Kodo
.mob +Greater Barrens Kodo
.mob +Wooly Kodo
step << Shaman
#completewith next
.goto The Barrens,44.76,74.79,45,0
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step << Shaman
#completewith next
.goto The Barrens,43.84,77.28,25,0
.goto The Barrens,43.62,77.29,25,0
.goto The Barrens,43.42,77.41,15 >>前往|cRXP_FRIENDLY_布瑞恩|r方向
step << Shaman
.goto The Barrens,43.42,77.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞恩|r交谈
.turnin 1536 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.accept 1534 >>接任务: |cRXP_LOOT_水之召唤|r
.target Brine
step
#completewith next
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
#label Gann1
#loop
.line The Barrens,46.12,81.25,46.09,80.54,46.16,79.66,46.14,79.37,46.07,79.19,45.86,78.77,45.79,78.47,45.83,77.21,45.91,76.97,46.02,76.71,46.08,76.33,46.14,75.40
.goto The Barrens,46.14,75.40,40,0
.goto The Barrens,46.08,76.33,40,0
.goto The Barrens,46.02,76.71,40,0
.goto The Barrens,45.91,76.97,40,0
.goto The Barrens,45.83,77.21,40,0
.goto The Barrens,45.79,78.47,40,0
.goto The Barrens,45.86,78.77,40,0
.goto The Barrens,46.07,79,19,40,0
.goto The Barrens,46.14,79.37,40,0
.goto The Barrens,46.16,79.66,40,0
.goto The Barrens,46.09,80.54,40,0
.goto The Barrens,46.12,81.25,40,0
.goto The Barrens,46.14,75.40,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加恩|r交谈
>>|cRXP_FRIENDLY_甘恩|r|cRXP_WARN_patrols 在道路上南北巡逻|r
.accept 843 >>接任务: |cRXP_LOOT_加恩的报复|r
.target Gann Stonespire
step
#completewith Lok
>>击杀|cRXP_ENEMY_钢鬃捕猎者|r和|cRXP_ENEMY_钢鬃探路者|r. 击败后拾取掉落的 |T135640:0|t[|cRXP_LOOT_钢鬃背刺匕首|r]
>>击杀|cRXP_ENEMY_钢鬃先知|r. 击败他们后可获得一个 |T135139:0|t[|cRXP_LOOT_烧焦的钢鬃魔杖|r]
>>击杀|cRXP_ENEMY_Razormane Warfrenzies|r. 击败后可掠夺获得 |T134955:0|t[|cRXP_LOOT_钢鬃大盾|r]
>>|cRXP_WARN_|r 的钢鬃捕猎者处于潜行状态|c|r
.collect 5093,1,893,1 
.mob +Razormane Stalker
.mob +Razormane Pathfinder
.collect 5092,1,893,1 
.mob +Razormane Seer
.collect 5094,1,893,1 
.mob +Razormane Warfrenzy
step
#completewith next
.goto The Barrens,44.85,78.81,45,0
.goto The Barrens,44.44,78.97,45,0
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
.line The Barrens,44.37,79.85,44.83,79.87,45.05,79.75,45.12,79.20,44.89,78.87,44.43,78.71,43.80,79.46,43.66,79.12,43.48,78.95,43.07,78.98,42.65,79.87,42.82,80.23,43.24,80.49,43.49,80.48,43.63,80.97,43.79,81.40,44.15,81.44,44.83,80.95,45.46,80.91,45.52,80.47,45.10,80.30,44.66,80.49,44.31,80.79,44.16,80.46,44.03,80.38,43.91,80.46,44.06,80.02,44.37,79.85
#loop
.goto The Barrens,44.06,80.02,45,0
.goto The Barrens,43.91,80.46,45,0
.goto The Barrens,44.03,80.38,45,0
.goto The Barrens,44.16,80.46,45,0
.goto The Barrens,44.31,80.79,45,0
.goto The Barrens,44.66,80.49,45,0
.goto The Barrens,45.10,80.30,45,0
.goto The Barrens,45.52,80.47,45,0
.goto The Barrens,45.46,80.91,45,0
.goto The Barrens,44.83,80.95,45,0
.goto The Barrens,44.15,81.44,45,0
.goto The Barrens,43.79,81.40,45,0
.goto The Barrens,43.63,80.97,45,0
.goto The Barrens,43.49,80.48,45,0
.goto The Barrens,43.24,80.49,45,0
.goto The Barrens,42.82,80.23,45,0
.goto The Barrens,42.65,79.87,45,0
.goto The Barrens,43.07,78.98,45,0
.goto The Barrens,43.48,78.95,45,0
.goto The Barrens,43.66,79.12,45,0
.goto The Barrens,43.80,79.46,45,0
.goto The Barrens,44.43,78.71,45,0
.goto The Barrens,44.89,78.87,45,0
.goto The Barrens,45.12,79.20,45,0
.goto The Barrens,45.05,79.75,45,0
.goto The Barrens,44.83,79.87,45,0
.goto The Barrens,44.83,79.87,0
>>击杀|cRXP_ENEMY_Kuz|r. 击败他后搜刮其|cRXP_LOOT_Kuz's Skull|r
>>|cRXP_ENEMY_卡兹|r|cRXP_WARN_巡逻时稍有移动|r
.complete 879,1 
.unitscan Kuz
step
#completewith next
.goto The Barrens,43.14,80.75,45,0
.goto The Barrens,43.35,81.16,45,0
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
#label Lok
.goto The Barrens,40.31,80.70,20,0
.goto The Barrens,40.14,80.56
>>击杀|cRXP_ENEMY_洛克·奥克班恩|r. 击败他后搜刮|cRXP_LOOT_洛克的头骨|r
.complete 879,3 
.mob Lok Orcbane
step
#completewith WandShield
.goto The Barrens,44.85,78.81,45,0
.goto The Barrens,44.44,78.97,45,0
.goto The Barrens,43.14,80.75,45,0
.goto The Barrens,43.35,81.16,45,0
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
#completewith next
>>击杀|cRXP_ENEMY_钢鬃捕猎者|r 和|cRXP_ENEMY_钢鬃探路者|r. 击败后搜刮, 有几率获得 |T135640:0|t[|cRXP_LOOT_钢鬃背刺匕首|r ]
>>|cRXP_WARN_|r 的钢鬃捕猎者处于潜行状态|c|r
.complete 893,1 
.mob Razormane Stalker
.mob Razormane Pathfinder
step
#label WandShield
#loop
.goto The Barrens,42.57,78.81,50,0
.goto The Barrens,42.12,78.48,50,0
.goto The Barrens,41.49,78.69,50,0
.goto The Barrens,41.22,79.72,50,0
.goto The Barrens,40.91,80.60,50,0
.goto The Barrens,40.55,80.84,50,0
.goto The Barrens,41.62,80.92,50,0
.goto The Barrens,41.54,82.28,50,0
.goto The Barrens,42.48,82.28,50,0
.goto The Barrens,42.57,78.81,50,0
>>击杀|cRXP_ENEMY_钢鬃先知|r. 击败他们后可获得一个 |T135139:0|t[|cRXP_LOOT_烧焦的钢鬃魔杖|r]
>>击杀|cRXP_ENEMY_Razormane Warfrenzies|r. 击败后可掠夺获得 |T134955:0|t[|cRXP_LOOT_钢鬃大盾|r]
.collect 5092,1,893,1 
.mob +Razormane Seer
.collect 5094,1,893,1 
.mob +Razormane Warfrenzy
step
.goto The Barrens,43.87,83.43
>>击杀|cRXP_ENEMY_Nak|r. 击杀后搜刮其掉落的|cRXP_LOOT_Nak's Skull|r
.complete 879,2 
.mob Nak
step
#loop
.goto The Barrens,45.48,79.89,0
.goto The Barrens,44.09,83.70,15,0
.goto The Barrens,44.15,83.34,15,0
.goto The Barrens,44.38,83.05,15,0
.goto The Barrens,44.22,82.67,15,0
.goto The Barrens,44.10,82.38,15,0
.goto The Barrens,43.85,82.25,15,0
.goto The Barrens,43.76,80.84,40,0
.goto The Barrens,44.14,80.03,40,0
.goto The Barrens,44.17,81.02,40,0
.goto The Barrens,44.66,81.18,40,0
.goto The Barrens,45.08,80.34,40,0
.goto The Barrens,45.48,79.89,40,0
.goto The Barrens,44.09,83.70,15,0
.goto The Barrens,44.15,83.34,15,0
.goto The Barrens,44.38,83.05,15,0
.goto The Barrens,44.22,82.67,15,0
.goto The Barrens,44.10,82.38,15,0
.goto The Barrens,43.85,82.25,15,0
.goto The Barrens,43.76,80.84,40,0
.goto The Barrens,44.14,80.03,40,0
.goto The Barrens,44.17,81.02,40,0
.goto The Barrens,44.66,81.18,40,0
.goto The Barrens,45.08,80.34,40,0
.goto The Barrens,45.48,79.89,40,0
>>击杀|cRXP_ENEMY_钢鬃捕猎者|r 和|cRXP_ENEMY_钢鬃探路者|r. 击败后搜刮, 有几率获得 |T135640:0|t[|cRXP_LOOT_钢鬃背刺匕首|r ]
>>|cRXP_WARN_|r 的钢鬃捕猎者处于潜行状态|c|r
.complete 893,1 
.mob Razormane Stalker
.mob Razormane Pathfinder
step
#completewith next
>>击杀|cRXP_ENEMY_Bael'dun 掘土者|r和|cRXP_ENEMY_Bael'dun 工头|r
.complete 843,1 
.mob +Bael'dun Excavator
.complete 843,2 
.mob +Bael'dun Foreman
step
#loop
.goto The Barrens,48.34,86.19,0
.goto The Barrens,47.51,85.04,15,0
.goto The Barrens,47.44,85.71,15,0
.goto The Barrens,47.94,85.68,15,0
.goto The Barrens,48.34,86.19,15,0
>>击杀|cRXP_ENEMY_勘察员卡兹戈姆|r. 搜刮其尸体, 获取|cRXP_LOOT_卡兹戈姆的日记|r
.complete 843,3 
.mob Prospector Khazgorm
step
#loop
.goto The Barrens,47.22,84.98,0
.goto The Barrens,47.22,84.98,40,0
.goto The Barrens,47.28,85.74,40,0
.goto The Barrens,47.60,85.66,40,0
.goto The Barrens,48.43,86.34,40,0
.goto The Barrens,48.03,85.46,40,0
.goto The Barrens,47.94,84.86,40,0
.goto The Barrens,47.37,84.01,40,0
.goto The Barrens,46.92,84.22,40,0
.goto The Barrens,46.99,85.82,40,0
>>击杀|cRXP_ENEMY_Bael'dun 掘土者|r和|cRXP_ENEMY_Bael'dun 工头|r
.complete 843,1 
.complete 843,2 
.mob Bael'dun Excavator
.mob Bael'dun Foreman
step
#completewith BaelModan
.goto The Barrens,47.21,79.35,45,0
.goto The Barrens,47.22,79.72,45,0
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
#completewith BaelModan
>>击杀|cRXP_ENEMY_雷鳞蜥蜴|r. 从它们身上搜刮|cRXP_LOOT_闪电腺|r
>>击杀|cRXP_ENEMY_巨型雷鹰|r. 击败它们后可掉落|cRXP_LOOT_Saliva Gland|r
>>击杀|cRXP_ENEMY_Kodos|r. 击败它们以获得|cRXP_LOOT_科多兽的肝脏|r
.complete 822,1 
.mob +Greater Thunderhawk
.complete 822,2 
.mob +Stormhide
.complete 822,3 
.mob +Barrens Kodo
.mob +Greater Barrens Kodo
.mob +Wooly Kodo
step
#loop
.line The Barrens,46.12,81.25,46.09,80.54,46.16,79.66,46.14,79.37,46.07,79.19,45.86,78.77,45.79,78.47,45.83,77.21,45.91,76.97,46.02,76.71,46.08,76.33,46.14,75.40
.goto The Barrens,46.14,75.40,40,0
.goto The Barrens,46.08,76.33,40,0
.goto The Barrens,46.02,76.71,40,0
.goto The Barrens,45.91,76.97,40,0
.goto The Barrens,45.83,77.21,40,0
.goto The Barrens,45.79,78.47,40,0
.goto The Barrens,45.86,78.77,40,0
.goto The Barrens,46.07,79,19,40,0
.goto The Barrens,46.14,79.37,40,0
.goto The Barrens,46.16,79.66,40,0
.goto The Barrens,46.09,80.54,40,0
.goto The Barrens,46.12,81.25,40,0
.goto The Barrens,46.14,75.40,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加恩|r交谈
>>|cRXP_FRIENDLY_甘恩|r|cRXP_WARN_patrols 在道路上南北巡逻|r
.turnin 843 >>交任务: |cRXP_FRIENDLY_加恩的报复|r
.accept 846 >>接任务: |cRXP_LOOT_加恩的报复|r
.target Gann Stonespire
step
#label BaelModan
.goto The Barrens,48.63,84.49,110 >>前往贝勒莫丹
.isOnQuest 846
step
#loop
.goto The Barrens,48.96,84.36,0
.goto The Barrens,48.96,84.36,30,0
.goto The Barrens,48.88,84.02,30,0
.goto The Barrens,49.28,83.76,30,0
.goto The Barrens,49.22,84.21,30,0
.goto The Barrens,49.47,84.41,30,0
.goto The Barrens,49.09,84.67,30,0
>>击杀|cRXP_ENEMY_Bael'dun 矮人|r. 击杀后搜刮他们的|cRXP_LOOT_硝化甘油|r和|cRXP_LOOT_木浆|r和|cRXP_LOOT_硝酸钠|r
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_巴尔丹军官|r|cRXP_WARN_在进入防御姿态动画后, 8秒内招架几率提升50%|r|r << Rogue/Warrior/Druid/Shaman
.complete 846,1 
.complete 846,2 
.complete 846,3 
.mob Bael'dun Rifleman
.mob Bael'dun Soldier
.mob Bael'dun Officer
step
#completewith WashtethePawne
>>击杀|cRXP_ENEMY_雷鳞蜥蜴|r. 从它们身上搜刮|cRXP_LOOT_闪电腺|r
>>击杀|cRXP_ENEMY_巨型雷鹰|r. 击败它们后可掉落|cRXP_LOOT_Saliva Gland|r
>>击杀|cRXP_ENEMY_Kodos|r. 击败它们以获得|cRXP_LOOT_科多兽的肝脏|r
.complete 822,1 
.mob +Greater Thunderhawk
.complete 822,2 
.mob +Stormhide
.complete 822,3 
.mob +Barrens Kodo
.mob +Greater Barrens Kodo
.mob +Wooly Kodo
step
#loop
.line The Barrens,46.12,81.25,46.09,80.54,46.16,79.66,46.14,79.37,46.07,79.19,45.86,78.77,45.79,78.47,45.83,77.21,45.91,76.97,46.02,76.71,46.08,76.33,46.14,75.40
.goto The Barrens,46.14,75.40,40,0
.goto The Barrens,46.08,76.33,40,0
.goto The Barrens,46.02,76.71,40,0
.goto The Barrens,45.91,76.97,40,0
.goto The Barrens,45.83,77.21,40,0
.goto The Barrens,45.79,78.47,40,0
.goto The Barrens,45.86,78.77,40,0
.goto The Barrens,46.07,79,19,40,0
.goto The Barrens,46.14,79.37,40,0
.goto The Barrens,46.16,79.66,40,0
.goto The Barrens,46.09,80.54,40,0
.goto The Barrens,46.12,81.25,40,0
.goto The Barrens,46.14,75.40,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加恩|r交谈
>>|cRXP_FRIENDLY_甘恩|r|cRXP_WARN_patrols 在道路上南北巡逻|r
.turnin 846 >>交任务: |cRXP_FRIENDLY_加恩的报复|r
.accept 849 >>接任务: |cRXP_LOOT_加恩的报复|r
.target Gann Stonespire
step
.goto The Barrens,46.97,85.63
>>点击平台顶部的|cRXP_PICK_巴尔莫丹飞行器|r
>>|cRXP_WARN_此技能射程为50码|r
.complete 849,1 
step
#loop
.line The Barrens,46.12,81.25,46.09,80.54,46.16,79.66,46.14,79.37,46.07,79.19,45.86,78.77,45.79,78.47,45.83,77.21,45.91,76.97,46.02,76.71,46.08,76.33,46.14,75.40
.goto The Barrens,46.14,75.40,40,0
.goto The Barrens,46.08,76.33,40,0
.goto The Barrens,46.02,76.71,40,0
.goto The Barrens,45.91,76.97,40,0
.goto The Barrens,45.83,77.21,40,0
.goto The Barrens,45.79,78.47,40,0
.goto The Barrens,45.86,78.77,40,0
.goto The Barrens,46.07,79,19,40,0
.goto The Barrens,46.14,79.37,40,0
.goto The Barrens,46.16,79.66,40,0
.goto The Barrens,46.09,80.54,40,0
.goto The Barrens,46.12,81.25,40,0
.goto The Barrens,46.14,75.40,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加恩|r交谈
>>|cRXP_FRIENDLY_甘恩|r|cRXP_WARN_patrols 在道路上南北巡逻|r
.turnin 849 >>交任务: |cRXP_FRIENDLY_加恩的报复|r
.target Gann Stonespire
step
#label WashtethePawne
#loop
.goto The Barrens,44.85,78.81,0
.goto The Barrens,44.85,78.81,60,0
.goto The Barrens,44.44,78.97,60,0
.goto The Barrens,43.14,80.75,60,0
.goto The Barrens,43.35,81.16,60,0
.goto The Barrens,47.22,79.72,60,0
.goto The Barrens,47.21,79.35,60,0
.goto The Barrens,44.76,74.79,60,0
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
#loop
.goto The Barrens,47.70,80.48,0
.goto The Barrens,45.35,77.51,60,0
.goto The Barrens,45.42,76.23,60,0
.goto The Barrens,45.05,75.25,60,0
.goto The Barrens,44.70,74.31,60,0
.goto The Barrens,47.28,74.73,60,0
.goto The Barrens,47.89,75.80,60,0
.goto The Barrens,47.70,80.48,60,0
>>击杀|cRXP_ENEMY_雷鳞蜥蜴|r. 从它们身上搜刮|cRXP_LOOT_闪电腺|r
>>击杀|cRXP_ENEMY_巨型雷鹰|r. 击败它们后可掉落|cRXP_LOOT_Saliva Gland|r
>>击杀|cRXP_ENEMY_Kodos|r. 击败它们以获得|cRXP_LOOT_科多兽的肝脏|r
.complete 822,1 
.mob +Greater Thunderhawk
.complete 822,2 
.mob +Stormhide
.complete 822,3 
.mob +Barrens Kodo
.mob +Greater Barrens Kodo
.mob +Wooly Kodo
step
#completewith WeaponsofChoiceTurnin
.hs >>传送至陶拉祖营地
.use 6948
.cooldown item,6948,>0
step
#completewith next
.goto The Barrens,45.13,58.47,120 >>返回陶拉祖营地. 你也可以继续刷怪, 直到你的|T134414:0|t[炉石]冷却完毕
.cooldown item,6948,<0
step
#label WeaponsofChoiceTurnin
.goto The Barrens,45.10,57.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tatternack|r交谈
.accept 893 >>接任务: |cRXP_LOOT_野猪人的武器|r
.turnin 893 >>交任务: |cRXP_FRIENDLY_野猪人的武器|r
.target Tatternack Steelforge
step
.goto The Barrens,44.86,59.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jorn|r交谈
.accept 884 >>接任务: |cRXP_LOOT_奥瓦坦卡|r
.turnin 884 >>交任务: |cRXP_FRIENDLY_奥瓦坦卡|r
.itemcount 5102,1
.target Jorn Skyseer
step
.goto The Barrens,44.86,59.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jorn|r交谈
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.turnin 885 >>交任务: |cRXP_FRIENDLY_瓦希塔帕恩|r
.target Jorn Skyseer
.itemcount 5103,1
step
.goto The Barrens,44.86,59.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jorn|r交谈
.accept 897 >>接任务: |cRXP_LOOT_收割者|r
.turnin 897 >>交任务: |cRXP_FRIENDLY_收割者|r
.itemcount 5138,1
.target Jorn Skyseer
step
.goto The Barrens,44.54,59.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碎牙|r交谈
.turnin 879 >>交任务: |cRXP_FRIENDLY_内奸|r
.accept 906 >>接任务: |cRXP_LOOT_内奸|r
.target Mangletooth
step
#completewith next
.goto The Barrens,44.45,59.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
.fly Crossroads >>飞往十字路口
.target Omusa Thunderhorn
step
.goto The Barrens,51.50,30.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
.turnin 906 >>交任务: |cRXP_FRIENDLY_内奸|r
.target Thork
step
#completewith next
+|cRXP_WARN_如果你拥有超过12个|cRXP_LOOT_异种蝎卵|r|cRXP_WARN_, 请将多余的数量拆分成堆(按住 Shift 键点击), 然后删除它们|r
step
.goto The Barrens,51.07,29.63
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科兰|r交谈
.turnin 868 >>交任务: |cRXP_FRIENDLY_蝎卵|r
.target Korran
step
.goto The Barrens,51.99,29.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板博兰德|r交谈
.home >>将你的炉石设置为十字路口
.target Innkeeper Boorand Plainswind
step << Rogue
.goto The Barrens,51.39,30.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|h1|cRXP_FRIENDLY_Hula'mahi|r交谈
.vendor >>|cRXP_BUY_储备|r|T134387:0|t[闪光粉] |cRXP_BUY_和|r|T132273:0|t[速效药膏]
.target Hula'mahi
step << Hunter
#completewith next
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.zoneskip Orgrimmar
.target Devrak
step << Hunter
.goto Orgrimmar,48.12,80.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Trak'gen|r交谈
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,1800,874,1 << Hunter 
.target Trak'gend

step << Hunter
.goto Orgrimmar,45.13,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Ratchet >>飞往棘齿城
.target Doras
step << !Hunter
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.fly Ratchet >>飞往棘齿城
.target Devrak
step
.goto The Barrens,62.370,37.615
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mebok|r交谈
.accept 1221 >>接任务: |cRXP_WARN_蓝叶薯|r
.target Mebok Mizzyrix
.dungeon RFK
step
>>在|cRXP_FRIENDLY_Mebok|r旁边拾取|cRXP_LOOT_地鼠指挥棒|r和|cRXP_LOOT_地鼠训练手册|r和|cRXP_LOOT_开孔的箱子|r
.collect 6684,1,1221,1 
.goto The Barrens,62.340,37.607
.collect 5897,1,1221,1 
.goto The Barrens,62.332,37.623
.collect 5880,1,1221,1 
.goto The Barrens,62.323,37.620
.dungeon RFK
step
.goto The Barrens,62.27,38.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Drohn|r交谈
.turnin 822 >>交任务: |cRXP_FRIENDLY_老陈的空酒桶|r
.target Brewmaster Drohn
.isQuestComplete 822
step
.goto The Barrens,65.84,43.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛伦·星眼|r交谈
.turnin 874 >>交任务: |cRXP_FRIENDLY_玛伦·星眼|r
.accept 873 >>接任务: |cRXP_LOOT_依沙瓦克|r
.target Mahren Skyseer
step
#loop
.goto The Barrens,65.67,46.63,0
.goto The Barrens,64.74,50.35,0
.goto The Barrens,63.60,53.54,0
.goto The Barrens,65.77,45.28,50,0
.goto The Barrens,65.67,46.63,50,0
.goto The Barrens,64.74,50.35,50,0
.goto The Barrens,63.60,53.54,50,0
>>击杀|cRXP_ENEMY_依沙瓦克|r. 击杀后搜刮其掉落的|cRXP_LOOT_依沙瓦克的心脏|r
>>|cRXP_WARN_他有四个不同的刷新点, 分布在海岸沿线|r
.complete 873,1 
.unitscan Isha Awak
step
.goto The Barrens,65.84,43.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛伦·星眼|r交谈
.turnin 873 >>交任务: |cRXP_FRIENDLY_依沙瓦克|r
.target Mahren Skyseer
step
#completewith CenariusPickup
.goto The Barrens,63.09,37.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
.fly Sun Rock Retreat >>飞往烈日石居
.zoneskip Stonetalon Mountains
.target Bragok
step
#label CenariusPickup
.goto Stonetalon Mountains,45.90,60.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布莱林|r交谈
.accept 1087 >>接任务: |cRXP_LOOT_塞纳留斯的遗产|r
.target Braelyn Firehand
step
.goto Stonetalon Mountains,47.30,61.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马格兰|r交谈
.accept 5881 >>接任务: |cRXP_LOOT_召回卫兵|r
.accept 6282 >>接任务: |cRXP_LOOT_鹰身人的威胁|r
.target Maggran Earthbinder
step
.goto Stonetalon Mountains,47.40,58.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔姆拉·荒原|r交谈
.accept 6301 >>接任务: |cRXP_LOOT_生生不息|r
.target Tammra Windfield
step
.goto Stonetalon Mountains,47.47,62.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板杰卡|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Jayka
step
.goto Stonetalon Mountains,47.61,61.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_基达|r交谈
.vendor >>|cRXP_BUY_从她那里购买|r|T134831:0|t[治疗药水]|cRXP_BUY_(如果价格合适)|r
.target Jeeda
step
#completewith next
.goto Stonetalon Mountains,49.38,61.68,30,0
.goto Stonetalon Mountains,48.92,62.71,30,0
.goto Stonetalon Mountains,48.11,63.88,30,0
.goto Stonetalon Mountains,47.21,64.05,30 >>沿着右侧的路径跑上去
step
.goto Stonetalon Mountains,47.36,64.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏纳曼|r交谈
.accept 6393 >>接任务: |cRXP_LOOT_元素战争|r
.target Tsunaman
step
.goto Stonetalon Mountains,59.08,75.70
>>点击|cRXP_FRIENDLY_通缉告示|r
.accept 6284 >>接任务: |cRXP_LOOT_贝瑟莱斯|r
step
.goto Stonetalon Mountains,51.89,73.81,50,0
.goto Stonetalon Mountains,52.46,71.67
>>击杀|cRXP_ENEMY_贝瑟莱斯|r. 击败后掠夺她的|cRXP_LOOT_利牙|r
>>|cRXP_WARN_在拉她之前先清空周围区域. 小心, 她会用蛛网困住你10秒！|r
.complete 6284,1 
.unitscan Besseleth
step
#completewith next
.goto Stonetalon Mountains,58.99,62.60,100 >>前往狂风峭壁
step
.goto Stonetalon Mountains,58.99,62.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_其兹|r交谈
.accept 1096 >>接任务: |cRXP_LOOT_格雷苏|r
.target Ziz Fizziks
step
#loop
.line Stonetalon Mountains,70.82,55.25,70.52,56.22,69.76,56.70,68.52,56.04,67.77,55.97,66.94,56.25,66.41,56.31,65.74,57.20,65.14,57.02,64.37,56.47,63.72,56.80,62.99,56.25,62.32,56.11,61.58,55.10,61.10,54.68,60.98,54.06,59.81,53.51,59.66,52.14,60.33,51.68
.goto Stonetalon Mountains,61.03,52.32,50,0
.goto Stonetalon Mountains,60.33,51.68,50,0
.goto Stonetalon Mountains,59.66,52.14,50,0
.goto Stonetalon Mountains,59.81,53.51,50,0
.goto Stonetalon Mountains,60.98,54.06,50,0
.goto Stonetalon Mountains,61.10,54.68,50,0
.goto Stonetalon Mountains,61.58,55.10,50,0
.goto Stonetalon Mountains,62.32,56.11,50,0
.goto Stonetalon Mountains,62.99,56.25,50,0
.goto Stonetalon Mountains,63.72,56.80,50,0
.goto Stonetalon Mountains,64.37,56.47,50,0
.goto Stonetalon Mountains,65.14,57.02,50,0
.goto Stonetalon Mountains,65.74,57.20,50,0
.goto Stonetalon Mountains,66.41,56.31,50,0
.goto Stonetalon Mountains,66.94,56.25,50,0
.goto Stonetalon Mountains,67.77,55.97,50,0
.goto Stonetalon Mountains,68.52,56.04,50,0
.goto Stonetalon Mountains,69.76,56.70,50,0
.goto Stonetalon Mountains,70.52,56.22,50,0
.goto Stonetalon Mountains,70.82,55.25,50,0
.goto Stonetalon Mountains,59.66,52.14,0
>>击杀|cRXP_ENEMY_XT:9|r. 它在河的南岸巡逻
.complete 1068,2 
.unitscan XT:9
step
#loop
.line Stonetalon Mountains,67.18,46.87,66.53,46.95,65.72,45.09,63.73,45.02,63.72,45.92,63.43,46.57,64.43,46.13,64.72,46.63,64.82,47.72,65.11,48.31,65.98,48.67,66.24,49.65,66.65,49.58,66.88,48.95,68.41,49.58,69.45,46.56,70.22,48.62,70.95,48.49,71.41,45.54,71.25,43.45
.goto Stonetalon Mountains,67.18,46.87,50,0
.goto Stonetalon Mountains,66.53,46.95,50,0
.goto Stonetalon Mountains,65.72,45.09,50,0
.goto Stonetalon Mountains,63.73,45.02,50,0
.goto Stonetalon Mountains,63.72,45.92,50,0
.goto Stonetalon Mountains,63.43,46.57,50,0
.goto Stonetalon Mountains,64.43,46.13,50,0
.goto Stonetalon Mountains,64.72,46.63,50,0
.goto Stonetalon Mountains,64.82,47.72,50,0
.goto Stonetalon Mountains,65.11,48.31,50,0
.goto Stonetalon Mountains,65.98,48.67,50,0
.goto Stonetalon Mountains,66.24,49.65,50,0
.goto Stonetalon Mountains,66.65,49.58,50,0
.goto Stonetalon Mountains,66.88,48.95,50,0
.goto Stonetalon Mountains,68.41,49.58,50,0
.goto Stonetalon Mountains,69.45,46.56,50,0
.goto Stonetalon Mountains,70.22,48.62,50,0
.goto Stonetalon Mountains,70.95,48.49,50,0
.goto Stonetalon Mountains,71.41,45.54,50,0
.goto Stonetalon Mountains,71.25,43.45,50,0
.goto Stonetalon Mountains,64.82,47.23,50,0
.goto Stonetalon Mountains,64.82,47.23,0
>>击杀|cRXP_ENEMY_XT:4|r. 它在河的北岸巡逻
.complete 1068,1 
.unitscan XT:4
step
.goto Stonetalon Mountains,66.47,45.45
.use 5638 >>|cRXP_WARN_使用|r|T132620:0|t[剧毒粮草] |cRXP_WARN_below 或在平台下方或上方|r
.complete 1086,1 
.isQuestTurnedIn 1066
step
#completewith next
.goto Stonetalon Mountains,68.81,39.61,50,0
.goto Stonetalon Mountains,67.83,37.77,50,0
.goto Stonetalon Mountains,66.58,37.71,50,0
.goto Stonetalon Mountains,64.56,38.03,50 >>上山并进入平台
step
.goto Stonetalon Mountains,64.48,40.24,20,0
.goto Stonetalon Mountains,63.45,39.78,20,0
.goto Stonetalon Mountains,62.75,40.31
>>击杀|cRXP_ENEMY_Gerenzo|r. 击败他后搜刮其掉落的|cRXP_LOOT_Mechanical Arm|r
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_风险投资公司机械师|r|cRXP_WARN_可召唤|r|cRXP_ENEMY_收割傀儡|r|cRXP_WARN_. 请逐个击破|r
.complete 1096,1 
.unitscan Gerenzo Wrenchwhistle
step
.goto Stonetalon Mountains,62.70,40.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_尼兹克|r|cRXP_BUY_交谈. 如果有的话, 购买装备升级|r
.vendor
.target Nizzik
step
.goto Stonetalon Mountains,58.99,62.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_其兹|r交谈
.turnin 1096 >>交任务: |cRXP_FRIENDLY_格雷苏|r
.target Ziz Fizziks
step
.goto Stonetalon Mountains,47.20,61.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马格兰|r交谈
.turnin 6284 >>交任务: |cRXP_FRIENDLY_贝瑟莱斯|r
.target Maggran Earthbinder
.isQuestComplete 6284
step
#completewith ReachthePeak
.goto Stonetalon Mountains,49.73,45.10,50,0
.goto Stonetalon Mountains,48.88,43.83,50,0
.goto Stonetalon Mountains,46.35,39.37,50,0
.goto Stonetalon Mountains,46.85,31.87,50,0
>>在经过湖泊时, 拾取你沿途看到的所有地面上的|cRXP_LOOT_盖亚之种|r
.complete 6301,1 
step
#completewith next
.goto Stonetalon Mountains,46.64,27.48,80,0
.goto Stonetalon Mountains,45.59,23.87,80,0
.goto Stonetalon Mountains,43.79,16.95,80,0
>>击杀前往石爪峰途中遇见的所有|cRXP_ENEMY_巨角鹿|r, 从它们身上搜刮出|cRXP_LOOT_眼球|r
.complete 1058,3 
.mob Antlered Courser
step
#label ReachthePeak
.goto Stonetalon Mountains,41.61,16.02,40 >>抵达石爪峰
step
#completewith Whiskers
>>击杀|cRXP_ENEMY_塞纳留斯之子|r和|cRXP_ENEMY_塞纳留斯之女|r和|cRXP_ENEMY_塞纳里奥植物学家|r
.complete 1087,1 
.mob +Son of Cenarius
.complete 1087,2 
.mob +Daughter of Cenarius
.complete 1087,3 
.mob +Cenarion Botanist
step
#completewith Whiskers
>>击杀|cRXP_ENEMY_Sap 腐蚀兽|r. 击杀后搜刮它们的|cRXP_LOOT_Sap|r
>>|cRXP_WARN_只有普通|r|cRXP_ENEMY_腐蚀兽|r|cRXP_WARN_会掉落树液. |r|cRXP_ENEMY_腐蚀性的腐蚀兽|r|cRXP_WARN_不会掉落它|r
.complete 1058,1 
.mob Sap Beast
step
#completewith next
>>击杀一只|cRXP_ENEMY_灵龙|r. 击败后搜刮其|cRXP_LOOT_龙鳞|r
.complete 1058,4 
.mob Fey Dragon
.mob Wily Fey Dragon
step
#label Whiskers
#loop
.goto Stonetalon Mountains,32.24,10.76,0
.goto Stonetalon Mountains,31.75,12.58,50,0
.goto Stonetalon Mountains,30.87,9.47,50,0
.goto Stonetalon Mountains,32.40,9.97,50,0
.goto Stonetalon Mountains,33.33,8.16,50,0
.goto Stonetalon Mountains,34.68,7.89,50,0
.goto Stonetalon Mountains,32.24,10.76,50,0
>>击杀|cRXP_ENEMY_夜行虎|r. 击杀后搜刮其掉落的|cRXP_LOOT_晶须猫|r
.complete 1058,2 
.mob Twilight Runner
step
#completewith CenariusLegacy
>>击杀|cRXP_ENEMY_Sap 腐蚀兽|r. 击杀后搜刮它们的|cRXP_LOOT_Sap|r
>>|cRXP_WARN_只有普通|r|cRXP_ENEMY_腐蚀兽|r|cRXP_WARN_会掉落树液. |r|cRXP_ENEMY_腐蚀性的腐蚀兽|r|cRXP_WARN_不会掉落它|r
.complete 1058,1 
.mob Sap Beast
step
#completewith next
>>击杀一只|cRXP_ENEMY_灵龙|r. 击败后搜刮出|cRXP_LOOT_龙鳞|r
.complete 1058,4 
.mob Fey Dragon
.mob Wily Fey Dragon
step
#label CenariusLegacy
#loop
.goto Stonetalon Mountains,34.43,12.65,0
.goto Stonetalon Mountains,34.43,12.65,40,0
.goto Stonetalon Mountains,35.49,15.33,40,0
.goto Stonetalon Mountains,36.99,15.29,40,0
.goto Stonetalon Mountains,37.71,14.81,40,0
.goto Stonetalon Mountains,38.17,12.77,40,0
.goto Stonetalon Mountains,37.95,11.21,40,0
.goto Stonetalon Mountains,36.25,10.27,40,0
.goto Stonetalon Mountains,35.41,11.13,40,0
>>击杀|cRXP_ENEMY_塞纳留斯之子|r和|cRXP_ENEMY_塞纳留斯之女|r和|cRXP_ENEMY_塞纳里奥植物学家|r
.complete 1087,1 
.mob +Son of Cenarius
.complete 1087,2 
.mob +Daughter of Cenarius
.complete 1087,3 
.mob +Cenarion Botanist
step
#completewith next
>>击杀|cRXP_ENEMY_Sap 腐蚀兽|r. 击杀后搜刮它们的|cRXP_LOOT_Sap|r
>>|cRXP_WARN_只有普通|r|cRXP_ENEMY_腐蚀兽|r|cRXP_WARN_会掉落树液. |r|cRXP_ENEMY_腐蚀性的腐蚀兽|r|cRXP_WARN_不会掉落它|r
.complete 1058,1 
.mob Sap Beast
step
#loop
.goto Stonetalon Mountains,33.96,11.82,0
.goto Stonetalon Mountains,33.96,11.82,60,0
.goto Stonetalon Mountains,36.64,18.76,60,0
>>击杀一只|cRXP_ENEMY_灵龙|r. 击败后搜刮出|cRXP_LOOT_龙鳞|r
.complete 1058,4 
.mob Fey Dragon
.mob Wily Fey Dragon
step
#loop
.goto Stonetalon Mountains,33.61,20.27,0
.goto Stonetalon Mountains,33.00,16.21,50,0
.goto Stonetalon Mountains,33.61,20.27,50,0
.goto Stonetalon Mountains,35.78,19.13,50,0
.goto Stonetalon Mountains,37.57,20.33,50,0
.goto Stonetalon Mountains,38.62,18.04,50,0
.goto Stonetalon Mountains,39.80,17.10,50,0
>>击杀|cRXP_ENEMY_Sap 腐蚀兽|r. 击杀后搜刮它们的|cRXP_LOOT_Sap|r
>>|cRXP_WARN_只有普通|r|cRXP_ENEMY_腐蚀兽|r|cRXP_WARN_会掉落树液. |r|cRXP_ENEMY_腐蚀性的腐蚀兽|r|cRXP_WARN_不会掉落它|r
.complete 1058,1 
.mob Sap Beast
step
#loop
.goto Stonetalon Mountains,44.51,20.92,0
.goto Stonetalon Mountains,44.51,20.92,50,0
.goto Stonetalon Mountains,44.45,23.59,50,0
.goto Stonetalon Mountains,46.26,26.72,50,0
>>在向南跑回湖边的过程中, 击杀|cRXP_ENEMY_巨角鹿|r , 从它们身上搜刮出|cRXP_LOOT_眼睛|r
.complete 1058,3 
.mob Antlered Courser
step
#loop
.goto Stonetalon Mountains,47.93,36.17,0
.goto Stonetalon Mountains,49.73,45.09,0
.goto Stonetalon Mountains,45.95,40.72,0
.goto Stonetalon Mountains,50.44,37.28,40,0
.goto Stonetalon Mountains,50.56,39.79,40,0
.goto Stonetalon Mountains,51.75,42.62,40,0
.goto Stonetalon Mountains,49.72,43.27,40,0
.goto Stonetalon Mountains,49.73,45.09,40,0
.goto Stonetalon Mountains,48.92,43.86,40,0
.goto Stonetalon Mountains,46.98,42.83,40,0
.goto Stonetalon Mountains,45.78,43.13,40,0
.goto Stonetalon Mountains,45.95,40.72,40,0
.goto Stonetalon Mountains,47.04,37.53,40,0
>>从湖边地面拾取 |cRXP_LOOT_盖亚之种|r
.complete 6301,1 
step
#completewith BloodfuryHarpies
.goto Stonetalon Mountains,42.64,42.43,50,0
.goto Stonetalon Mountains,38.18,43.28,60,0
.goto Stonetalon Mountains,34.85,58.38,80 >>沿着西方的道路前往焦炭谷
step
#completewith next
>>击杀|cRXP_ENEMY_火元素|r. 击杀后从它们身上搜刮|cRXP_LOOT_Increndrite|r
.complete 6393,1 
.mob Burning Ravager
.mob Rogue Flame Spirit
.mob Burning Destroyer
step
#label BloodfuryHarpies
#loop
.goto Stonetalon Mountains,29.61,63.57,0
.goto Stonetalon Mountains,34.07,61.47,60,0
.goto Stonetalon Mountains,31.59,60.58,60,0
.goto Stonetalon Mountains,29.90,62.51,60,0
.goto Stonetalon Mountains,28.38,64.26,60,0
.goto Stonetalon Mountains,27.65,67.88,60,0
.goto Stonetalon Mountains,27.36,69.75,60,0
.goto Stonetalon Mountains,29.98,71.52,60,0
.goto Stonetalon Mountains,34.96,71.29,60,0
.goto Stonetalon Mountains,36.57,68.19,60,0
.goto Stonetalon Mountains,35.24,63.44,60,0
.goto Stonetalon Mountains,33.94,61.17,60,0
.goto Stonetalon Mountains,29.61,63.57,60,0
>>击杀|cRXP_ENEMY_Bloodfury 狂怒哈比兽|r. |cRXP_WARN_请注意, 它们拥有特殊能力|r
>>|cRXP_ENEMY_血怒杀戮者|r|cRXP_WARN_当你生命值低于20%时将处决你|r
>>|cRXP_ENEMY_血怒伏击者|r|cRXP_WARN_shock 对低冷却时间造成高额伤害|r
>>|cRXP_ENEMY_血怒游荡者|r|cRXP_WARN_可|r|T132152:0|t[撕裂]
.complete 6282,1 
.mob +Bloodfury Harpy
.complete 6282,2 
.mob +Bloodfury Ambusher
.complete 6282,3 
.mob +Bloodfury Slayer
.complete 6282,4 
.mob +Bloodfury Roguefeather
step
#completewith TammraTurnin1
.goto Stonetalon Mountains,37.89,67.77,30,0
.goto Stonetalon Mountains,39.58,69.84,30,0
.goto Stonetalon Mountains,41.20,70.09,30,0
.goto Stonetalon Mountains,42.07,66.41,30,0
.goto Stonetalon Mountains,43.54,65.35,30,0
.goto Stonetalon Mountains,44.68,63.50,30 >>沿着西部路径前往烈日石居
step
.goto Stonetalon Mountains,47.36,64.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏纳曼|r交谈
.turnin 6393 >>交任务: |cRXP_FRIENDLY_元素战争|r
.target Tsunaman
.isQuestComplete 6393
step
#label TammraTurnin1
.goto Stonetalon Mountains,47.40,58.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔姆拉·荒原|r交谈
.turnin 6301 >>交任务: |cRXP_FRIENDLY_生生不息|r
.accept 6381 >>接任务: |cRXP_LOOT_新的生命|r
.target Tammra Windfield
step
.goto Stonetalon Mountains,47.20,61.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马格兰|r交谈
.turnin 6282 >>交任务: |cRXP_FRIENDLY_鹰身人的威胁|r
.accept 6283 >>接任务: |cRXP_LOOT_血怒一族|r
.target Maggran Earthbinder
.group
step
.goto Stonetalon Mountains,47.20,61.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马格兰|r交谈
.turnin 6282 >>交任务: |cRXP_FRIENDLY_鹰身人的威胁|r
.target Maggran Earthbinder
step
.goto Stonetalon Mountains,47.47,62.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板杰卡|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Jayka
step
.goto Stonetalon Mountains,47.61,61.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_基达|r交谈
.vendor >>|cRXP_BUY_从她那里购买|r|T134831:0|t[治疗药水]|cRXP_BUY_(如果价格合适)|r
.target Jeeda
step
.goto Stonetalon Mountains,45.90,60.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布莱林|r交谈
.turnin 1087 >>交任务: |cRXP_FRIENDLY_塞纳留斯的遗产|r
.accept 1088 >>接任务: |cRXP_LOOT_奥达努斯|r
.target Braelyn Firehand
.group
step
.goto Stonetalon Mountains,45.90,60.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布莱林|r交谈
.turnin 1087 >>交任务: |cRXP_FRIENDLY_塞纳留斯的遗产|r
.target Braelyn Firehand
step
#completewith Ripper
.goto Stonetalon Mountains,44.31,63.64,30,0
.goto Stonetalon Mountains,43.31,65.47,30,0
.goto Stonetalon Mountains,42.07,66.51,30,0
.goto Stonetalon Mountains,41.26,70.06,30,0
.goto Stonetalon Mountains,37.80,67.68,80 >>返回焦灼谷
step
#completewith Ripper
.goto Stonetalon Mountains,36.07,67.95,40,0
.goto Stonetalon Mountains,34.22,61.25,40,0
.goto Stonetalon Mountains,31.33,61.38,40,0
>>将种子种植在地面上的|cRXP_PICK_盖亚土堆|r中
.complete 6381,1 
.group 0
step
#completewith next
>>击杀|cRXP_ENEMY_火元素|r. 击杀后从它们身上搜刮|cRXP_LOOT_Increndrite|r
.complete 6393,1 
.mob Burning Ravager
.mob Rogue Flame Spirit
.mob Burning Destroyer
.group 0
step
#label Ripper
.goto Stonetalon Mountains,30.75,61.91
>>击杀|cRXP_ENEMY_血怒撕裂者|r. 搜刮她的|cRXP_LOOT_残骸|r
>>|cRXP_WARN_先清理她周围的|r|cRXP_ENEMY_Harpies|r|cRXP_WARN_！她的群体吸引范围很大|r
.complete 6283,1 
.unitscan Bloodfury Ripper
.group 2
step
#completewith next
>>将种子种植在地面上的|cRXP_PICK_盖亚土堆|r中
.complete 6381,1 
step
#loop
.goto Stonetalon Mountains,31.84,70.92,0
.goto Stonetalon Mountains,31.84,70.92,60,0
.goto Stonetalon Mountains,33.84,70.45,60,0
.goto Stonetalon Mountains,35.75,73.03,60,0
.goto Stonetalon Mountains,33.94,63.81,60,0
.goto Stonetalon Mountains,34.47,60.19,60,0
.goto Stonetalon Mountains,30.56,67.08,60,0
>>击杀|cRXP_ENEMY_火元素|r. 击杀后从它们身上搜刮|cRXP_LOOT_Increndrite|r
.complete 6393,1 
.mob Burning Ravager
.mob Rogue Flame Spirit
.mob Burning Destroyer
step
#loop
.goto Stonetalon Mountains,31.90,64.25,0
.goto Stonetalon Mountains,30.20,67.61,40,0
.goto Stonetalon Mountains,29.06,68.87,40,0
.goto Stonetalon Mountains,29.64,71.34,40,0
.goto Stonetalon Mountains,30.50,70.80,40,0
.goto Stonetalon Mountains,32.25,70.07,40,0
.goto Stonetalon Mountains,33.70,72.92,40,0
.goto Stonetalon Mountains,34.70,72.25,40,0
.goto Stonetalon Mountains,34.49,69.09,40,0
.goto Stonetalon Mountains,36.06,67.96,40,0
.goto Stonetalon Mountains,36.01,65.24,40,0
.goto Stonetalon Mountains,34.21,61.28,40,0
.goto Stonetalon Mountains,31.90,64.25,40,0
>>将种子种植在地面上的|cRXP_PICK_盖亚土堆|r中
.complete 6381,1 
step
#loop
.goto Stonetalon Mountains,36.69,67.66,60,0
.goto Stonetalon Mountains,35.89,64.85,60,0
.goto Stonetalon Mountains,35.28,63.36,60,0
.goto Stonetalon Mountains,34.58,61.42,60,0
.goto Stonetalon Mountains,33.14,60.26,60,0
.goto Stonetalon Mountains,31.89,58.88,60,0
.goto Stonetalon Mountains,30.85,60.72,60,0
.goto Stonetalon Mountains,29.70,61.90,60,0
.goto Stonetalon Mountains,28.13,63.70,60,0
.goto Stonetalon Mountains,28.37,66.87,60,0
.goto Stonetalon Mountains,26.94,69.66,60,0
.goto Stonetalon Mountains,29.63,70.80,60,0
.goto Stonetalon Mountains,30.58,72.39,60,0
.goto Stonetalon Mountains,31.92,72.67,60,0
.goto Stonetalon Mountains,33.32,73.17,60,0
.goto Stonetalon Mountains,35.60,73.46,60,0
.goto Stonetalon Mountains,36.55,71.13,60,0
.goto Stonetalon Mountains,36.84,68.70,60,0
.xp 27+28850 >>升级至28850/38900经验值
.isQuestComplete 6393
.isQuestComplete 6283
step
#loop
.goto Stonetalon Mountains,36.69,67.66,60,0
.goto Stonetalon Mountains,35.89,64.85,60,0
.goto Stonetalon Mountains,35.28,63.36,60,0
.goto Stonetalon Mountains,34.58,61.42,60,0
.goto Stonetalon Mountains,33.14,60.26,60,0
.goto Stonetalon Mountains,31.89,58.88,60,0
.goto Stonetalon Mountains,30.85,60.72,60,0
.goto Stonetalon Mountains,29.70,61.90,60,0
.goto Stonetalon Mountains,28.13,63.70,60,0
.goto Stonetalon Mountains,28.37,66.87,60,0
.goto Stonetalon Mountains,26.94,69.66,60,0
.goto Stonetalon Mountains,29.63,70.80,60,0
.goto Stonetalon Mountains,30.58,72.39,60,0
.goto Stonetalon Mountains,31.92,72.67,60,0
.goto Stonetalon Mountains,33.32,73.17,60,0
.goto Stonetalon Mountains,35.60,73.46,60,0
.goto Stonetalon Mountains,36.55,71.13,60,0
.goto Stonetalon Mountains,36.84,68.70,60,0
.xp 27+30850 >>升级至30850/38900经验值
.isQuestComplete 6283
step
#loop
.goto Stonetalon Mountains,36.69,67.66,60,0
.goto Stonetalon Mountains,35.89,64.85,60,0
.goto Stonetalon Mountains,35.28,63.36,60,0
.goto Stonetalon Mountains,34.58,61.42,60,0
.goto Stonetalon Mountains,33.14,60.26,60,0
.goto Stonetalon Mountains,31.89,58.88,60,0
.goto Stonetalon Mountains,30.85,60.72,60,0
.goto Stonetalon Mountains,29.70,61.90,60,0
.goto Stonetalon Mountains,28.13,63.70,60,0
.goto Stonetalon Mountains,28.37,66.87,60,0
.goto Stonetalon Mountains,26.94,69.66,60,0
.goto Stonetalon Mountains,29.63,70.80,60,0
.goto Stonetalon Mountains,30.58,72.39,60,0
.goto Stonetalon Mountains,31.92,72.67,60,0
.goto Stonetalon Mountains,33.32,73.17,60,0
.goto Stonetalon Mountains,35.60,73.46,60,0
.goto Stonetalon Mountains,36.55,71.13,60,0
.goto Stonetalon Mountains,36.84,68.70,60,0
.xp 27+30950 >>升级至30950/38900经验值
.isQuestComplete 6393
step
#loop
.goto Stonetalon Mountains,36.69,67.66,60,0
.goto Stonetalon Mountains,35.89,64.85,60,0
.goto Stonetalon Mountains,35.28,63.36,60,0
.goto Stonetalon Mountains,34.58,61.42,60,0
.goto Stonetalon Mountains,33.14,60.26,60,0
.goto Stonetalon Mountains,31.89,58.88,60,0
.goto Stonetalon Mountains,30.85,60.72,60,0
.goto Stonetalon Mountains,29.70,61.90,60,0
.goto Stonetalon Mountains,28.13,63.70,60,0
.goto Stonetalon Mountains,28.37,66.87,60,0
.goto Stonetalon Mountains,26.94,69.66,60,0
.goto Stonetalon Mountains,29.63,70.80,60,0
.goto Stonetalon Mountains,30.58,72.39,60,0
.goto Stonetalon Mountains,31.92,72.67,60,0
.goto Stonetalon Mountains,33.32,73.17,60,0
.goto Stonetalon Mountains,35.60,73.46,60,0
.goto Stonetalon Mountains,36.55,71.13,60,0
.goto Stonetalon Mountains,36.84,68.70,60,0
.xp 27+32950 >>升级至32950/38900经验值
step
#completewith TammraTurnin2
.goto Stonetalon Mountains,37.89,67.77,30,0
.goto Stonetalon Mountains,39.58,69.84,30,0
.goto Stonetalon Mountains,41.20,70.09,30,0
.goto Stonetalon Mountains,42.07,66.41,30,0
.goto Stonetalon Mountains,43.54,65.35,30,0
.goto Stonetalon Mountains,44.68,63.50,30 >>沿着西方的道路返回烈日石居
step
.goto Stonetalon Mountains,47.36,64.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏纳曼|r交谈
.turnin 6393 >>交任务: |cRXP_FRIENDLY_元素战争|r
.target Tsunaman
step
#label TammraTurnin2
.goto Stonetalon Mountains,47.40,58.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔姆拉·荒原|r交谈
.turnin 6381 >>交任务: |cRXP_FRIENDLY_新的生命|r
.target Tammra Windfield
step
.goto Stonetalon Mountains,47.20,61.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马格兰|r交谈
.turnin 6283 >>交任务: |cRXP_FRIENDLY_血怒一族|r
.target Maggran Earthbinder
.isQuestComplete 6283
.group
step
#completewith next
.subzone 2539 >>向南前往马拉卡吉恩
step
.goto Stonetalon Mountains,74.54,97.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jin'Zil|r交谈
.turnin 1058 >>交任务: |cRXP_FRIENDLY_金吉尔的森林魔法|r
.target Witch Doctor Jin'Zil
step
#map Stonetalon Mountains
.goto The Barrens,35.26,27.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Seereth|r交谈
.turnin 1068 >>交任务: |cRXP_FRIENDLY_伐木机|r
.target Seereth Stonebreak
step << Druid
#completewith DruidTraining3
.cast 18960 >>施放 |T135758:0|t[传送:月光林地]
.zoneskip Moonglade
step << Druid
#optional
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 1850 >>训练你的职业法术
.target Loganaar
.xp <26,1
.xp >28,1
step << Druid
#label DruidTraining3
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 3029 >>训练你的职业法术
.target Loganaar
.xp <28,1
step
#completewith next
.hs >>传送至十字路口
.use 6948
step << Rogue
.goto The Barrens,51.39,30.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|h1|cRXP_FRIENDLY_Hula'Mahi|r|H|h交谈
.vendor >>|cRXP_BUY_储备闪光粉和毒药|r
.target Hula'Mahi
step << !Mage
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.zoneskip Orgrimmar
.target Devrak
step << Mage
.cast 3567 >>施放 |T135759:0|t[传送:奥格瑞玛]
.zoneskip Orgrimmar
step
#optional
.abandon 6283 >>放弃血怒一族
.isOnQuest 6283
step << Mage
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 120 >>训练你的职业法术
.target Pephredo
.xp <26,1
.xp >28,1
step << Mage
#optional
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 759 >>训练你的职业法术
.target Pephredo
.xp <28,1
step
#ah
.goto Orgrimmar,55.59,62.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thathung|r交谈
>>|cRXP_BUY_如果可用, 请从拍卖行购买|r|T133021:0|t[碎纸机操作手册页]|r 
.target Auctioneer Thathung
.collect 16645,1,6504,1 
.collect 16646,1,6504,1 
.collect 16647,1,6504,1 
.collect 16648,1,6504,1 
.collect 16649,1,6504,1 
.collect 16650,1,6504,1 
.collect 16651,1,6504,1 
.collect 16652,1,6504,1 
.collect 16653,1,6504,1 
.collect 16654,1,6504,1 
.collect 16655,1,6504,1 
.collect 16656,1,6504,1 
step << Rogue
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 8687 >>训练你的职业法术
>>|T132273:0|t[速效药膏 等级2]|cRXP_WARN_需要毒药技能达到120级！|r
.target Ormok
.xp <26,1
.xp >28,1
step << Rogue
#optional
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 1833 >>训练你的职业法术
>>|T132273:0|t[速效药膏 等级2]|cRXP_WARN_需要毒药技能达到120级！|r
.target Ormok
.xp <28,1
step << Rogue
.goto Orgrimmar,48.12,80.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Trak'gen|r|cRXP_BUY_交谈. 从他那里购买|r|T135423:0|t[破损的致命飞斧]|r
.collect 3137,200,6544,1 
.target Trak'gen
step << Shaman
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 8190 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <26,1
.xp >28,1
step << Shaman
#optional
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 8053 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <28,1
step << Warrior
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 6178 >>训练你的职业法术
.target Grezz Ragefist
.xp <26,1
.xp >28,1
step << Warrior
#optional
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 7887 >>训练你的职业法术
.target Grezz Ragefist
.xp <28,1
step << Warlock
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 1456 >>训练你的职业法术
.target Mirket
.xp <26,1
.xp >28,1
step << Warlock
#optional
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 6217 >>训练你的职业法术
.target Mirket
.xp <28,1
step << Warlock
.goto Orgrimmar,47.52,46.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈
.vendor >>购买任何你负担得起的宠物升级道具
.target Kurgul

step << Priest/Warlock
.goto Orgrimmar,44.16,48.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_卡提斯|r|cRXP_BUY_交谈. 从她那里购买|r|T135466:0|t[致命魔杖]|r
.collect 5347,1,6544,1 
.money <1.5713
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<26.9
.target Katis
step << Hunter
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 3045 >>训练你的职业法术
.target Ormak Grimshot
.xp <26,1
.xp >28,1
step << Hunter
#optional
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14319 >>训练你的职业法术
.target Ormak Grimshot
.xp <28,1
step << Hunter
.goto Orgrimmar,78.11,38.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤索克|r交谈
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,1800,549,1 << Hunter 
.target Jin'sora
step << Priest
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 992 >>训练你的职业法术
.target Ur'kyo
.xp <26,1
.xp >28,1
step << Priest
#optional
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 8104 >>训练你的职业法术
.target Ur'kyo
.xp <28,1
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 27-29级灰谷
#displayname 27-29级灰谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 20-30
#next 29-31 千针石林
step
#completewith next
.goto Orgrimmar,26.22,61.58,80,0
.goto Orgrimmar,15.66,63.33,30,0
.zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
.zoneskip The Barrens
step
#completewith next
.goto Kalimdor,56.80,45.45,15,0
.goto Ashenvale,94.54,76.15,40,0
.goto Ashenvale,93.49,73.76,40,0
.goto Ashenvale,92.47,71.18,40,0
.goto Ashenvale,91.85,68.71,40,0
.goto Ashenvale,91.39,65.86,25 >>沿着河流向北前往灰谷
step
.goto Ashenvale,89.87,68.07,40,0
.goto Ashenvale,86.89,68.65,40,0
.goto Ashenvale,79.89,68.38,40,0
.goto Ashenvale,73.52,63.50,30 >>前往裂树岗哨
>>|cRXP_WARN_你可能会遇到一些29至30级的怪物, 如果可能的话请避开它们|r
step
.goto Ashenvale,73.78,61.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞娜尼|r交谈
.turnin 6382 >>交任务: |cRXP_FRIENDLY_灰谷狩猎|r
.turnin 6383 >>交任务: |cRXP_FRIENDLY_灰谷狩猎|r
.target Senani Thunderheart
step
.goto Ashenvale,74.00,60.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板凯利斯克|r交谈
.home >>将你的[炉石]设置为裂枝岗哨
.target Innkeeper Kaylisk
step
.goto Ashenvale,73.67,60.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马斯托克|r交谈
.accept 25 >>接任务: |cRXP_LOOT_石爪山的困境|r
.target Mastok Wrilehiss
step
.goto Ashenvale,73.06,61.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮克希尔|r交谈
.accept 6441 >>接任务: |cRXP_LOOT_萨特之角|r
.target Pixel
step
.goto Ashenvale,73.18,61.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔格拉|r交谈
.fp Splintertree Post >>获取Splintertree哨所的飞行路径
.target Vhulgra
step
.goto Ashenvale,71.10,68.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Kuray'bin|r交谈
.accept 6503 >>接任务: |cRXP_LOOT_灰谷先驱者|r
.target Kuray'bin
step << Hunter
#completewith ClawBiteAshenvale1
.goto Ashenvale,73.38,61.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_基苏 交谈|r
.stable >>驯服你的宠物. 你将很快驯服一只|cRXP_ENEMY_老灰谷熊|r和一只|cRXP_ENEMY_幽爪前锋|r
.target Qeeju
step << Hunter
#loop
.goto Ashenvale,65.31,64.65,0
.goto Ashenvale,69.12,64.45,0
.goto Ashenvale,69.12,64.45,50,0
.goto Ashenvale,68.59,60.53,50,0
.goto Ashenvale,66.62,62.81,50,0
.goto Ashenvale,65.31,64.65,50,0
.train 16830 >>|cRXP_WARN_施放|r|T132164:0|t[驯服野兽]|cRXP_WARN_在|r|cRXP_ENEMY_老灰谷熊|r上. 用它攻击怪物以学习|r|T132140:0|t[利爪 (等级 4)]
.mob +Elder Ashenvale Bear
.train 17264 >>|cRXP_WARN_施放|r|T132164:0|t[驯服野兽]|cRXP_WARN_作用于|r|cRXP_ENEMY_幽爪前锋|r身上. 攻击怪物以学习|r|T132278:0|t[撕咬(等级4)]
.mob +Ghostpaw Alpha
.link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
.xp <27,1 
step << Hunter
#label ClawBiteAshenvale1
#optional
#loop
.goto Ashenvale,65.31,64.65,0
.goto Ashenvale,68.59,60.53,50,0
.goto Ashenvale,66.62,62.81,50,0
.goto Ashenvale,65.31,64.65,50,0
.train 16830 >>|cRXP_WARN_施放|r|T132164:0|t[驯服野兽]|cRXP_WARN_在|r|cRXP_ENEMY_老灰谷熊|r上. 用它攻击怪物以学习|r|T132140:0|t[利爪 (等级 4)]
.mob Elder Ashenvale Bear
.link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
.xp >26,1 
step << Hunter
.goto Ashenvale,73.38,61.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_基苏 交谈|r
.stable >>放弃|cRXP_ENEMY_老灰谷熊|r 或|cRXP_ENEMY_幽爪前锋|r, 然后取回你的普通宠物
.target Qeeju
.zoneskip Ashenvale,1
step
#ah
#completewith Outrunners
.goto Ashenvale,70.01,71.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gurda|r交谈
>>|cRXP_WARN_如果您没有(所有)页面, 请跳过此步骤|r
.accept 6504 >>接任务: |cRXP_WARN_丢失的书页|r
.turnin 6504 >>交任务: |cRXP_FRIENDLY_丢失的书页|r
.target Gurda Ragescar
step
#completewith next
.goto Ashenvale,75.25,71.86,0
.line Ashenvale,71.46,70.10,72.08,70.47,72.50,70.60,72.94,70.67,73.33,70.61,74.36,70.10,74.86,70.06,75.26,69.96,75.94,69.80,76.11,68.95,76.93,68.04,77.35,66.96,77.60,66.33,77.93,65.93,78.24,65.72
>>击杀|cRXP_ENEMY_沙普塔隆|r. 击败他后搜刮 |T136063:0|t[|cRXP_LOOT_沙普塔隆的爪子|r], 并使用它开启任务
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_沙普塔隆|r|cRXP_WARN_是31级, 会在附近巡逻. 如果你难以击杀他, 可以风筝他回到碎木林哨站或被遗弃者营地. 如果这么做, 请确保造成50%以上的伤害才能获得任务奖励. 你也可以稍后再完成这个任务|r
.collect 16305,1,2 
.accept 2 >>接任务: |cRXP_LOOT_沙普塔隆的爪子|r
.unitscan Sharptalon
.use 16305
step
#label Outrunners
#loop
.goto Ashenvale,76.15,67.60,0
.goto Ashenvale,76.15,67.60,15,0
.goto Ashenvale,76.03,69.02,15,0
.goto Ashenvale,76.25,70.62,15,0
.goto Ashenvale,75.76,71.61,15,0
.goto Ashenvale,75.57,70.33,15,0
.goto Ashenvale,75.20,70.62,15,0
.goto Ashenvale,74.37,69.31,15,0
.goto Ashenvale,73.61,70.91,15,0
.goto Ashenvale,72.96,70.34,15,0
.goto Ashenvale,72.66,69.46,15,0
.goto Ashenvale,72.09,70.17,15,0
.goto Ashenvale,71.07,72.60,15,0
.goto Ashenvale,71.92,73.64,15,0
.goto Ashenvale,72.53,72.58,15,0
.goto Ashenvale,72.32,74.64,15,0
.goto Ashenvale,73.36,74.43,15,0
.goto Ashenvale,73.85,75.03,15,0
>>击杀|cRXP_ENEMY_灰谷先驱者|r
>>|cRXP_WARN_他们处于潜行状态|r
.complete 6503,1 
.mob Ashenvale Outrunner
step
#loop
.goto Ashenvale,78.24,65.72,0
.goto Ashenvale,78.24,65.72,45,0
.goto Ashenvale,77.93,65.93,45,0
.goto Ashenvale,77.60,66.33,45,0
.goto Ashenvale,77.35,66.96,45,0
.goto Ashenvale,76.93,68.04,45,0
.goto Ashenvale,76.11,68.95,45,0
.goto Ashenvale,75.94,69.80,45,0
.goto Ashenvale,75.26,69.96,45,0
.goto Ashenvale,74.86,70.06,45,0
.goto Ashenvale,74.36,70.10,45,0
.goto Ashenvale,73.33,70.61,45,0
.goto Ashenvale,72.94,70.67,45,0
.goto Ashenvale,72.50,70.60,45,0
.goto Ashenvale,72.08,70.47,45,0
.goto Ashenvale,71.46,70.10,45,0
.line Ashenvale,71.46,70.10,72.08,70.47,72.50,70.60,72.94,70.67,73.33,70.61,74.36,70.10,74.86,70.06,75.26,69.96,75.94,69.80,76.11,68.95,76.93,68.04,77.35,66.96,77.60,66.33,77.93,65.93,78.24,65.72
>>击杀|cRXP_ENEMY_沙普塔隆|r. 击败他后搜刮 |T136063:0|t[|cRXP_LOOT_沙普塔隆的爪子|r], 并使用它开启任务
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_沙普塔隆|r|cRXP_WARN_是31级, 会在附近巡逻. 如果你难以击杀他, 可以风筝他回到碎木林哨站或被遗弃者营地. 如果这么做, 请确保造成50%以上的伤害才能获得任务奖励. 你也可以稍后再完成这个任务|r
.collect 16305,1,2 
.accept 2 >>接任务: |cRXP_LOOT_沙普塔隆的爪子|r
.unitscan Sharptalon
.use 16305
step
.goto Ashenvale,68.34,75.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_托雷克|r开始护送任务
>>|cRXP_FRIENDLY_托雷克|r|cRXP_WARN_有5分钟的刷新时间|r
.accept 6544 >>接任务: |cRXP_LOOT_托雷克的突袭|r
.target Torek
step
.goto Ashenvale,66.08,74.50,60,0
.goto Ashenvale,65.07,75.36,20,0
.goto Ashenvale,64.28,75.33,10,0
.goto Ashenvale,64.81,75.34
>>跟随|cRXP_FRIENDLY_托雷克|r
>>让|cRXP_FRIENDLY_托雷克|r和他的|cRXP_FRIENDLY_碎木掠夺者|r牵制住|cRXP_ENEMY_银翼战士|r和|cRXP_ENEMY_银翼哨兵|r
>>清理完建筑后, 跑向阳台. 当|cRXP_ENEMY_杜瑞尔·月火|r出现时, 让|cRXP_FRIENDLY_托雷克|r和他的|cRXP_FRIENDLY_碎木掠夺者|r先拉住仇恨, 再进行输出伤害
.complete 6544,1 
.mob Silverwing Warrior
.mob Silverwing Sentinel
.unitscan Duriel Moonfire
step
#completewith Tideress
.goto Ashenvale,51.51,71.02,100 >>前往迷斯特拉湖
.isOnQuest 25
step
#completewith Tideress
>>击杀|cRXP_ENEMY_污浊的水元素|r
.complete 25,1 
.mob Befouled Water Elemental
step
#completewith next
.line Ashenvale,45.84,70.67,46.07,70.83,46.53,70.80,46.72,70.63,47.22,70.44,47.57,70.42,47.79,69.90,48.04,69.67,48.71,69.54,48.36,69.74,48.43,70.14,48.93,70.82,49.49,70.76,50.21,70.36,50.47,70.43,50.54,71.08,50.74,71.31,51.42,70.86,51.75,70.86,52.13,71.14,52.18,71.60,52.08,72.10
.goto Ashenvale,52.08,72.10,40,0
.goto Ashenvale,52.18,71.60,40,0
.goto Ashenvale,52.13,71.14,40,0
.goto Ashenvale,51.42,70.86,40,0
.goto Ashenvale,50.74,71.31,40,0
.goto Ashenvale,50.54,71.08,40,0
.goto Ashenvale,50.47,70.43,40,0
.goto Ashenvale,50.21,70.36,40,0
.goto Ashenvale,49.49,70.76,40,0
.goto Ashenvale,48.93,70.82,40,0
.goto Ashenvale,48.43,70.14,40,0
.goto Ashenvale,48.36,69.74,40,0
>>击杀|cRXP_ENEMY_泰德雷斯|r. 击败她后搜刮出 |T136222:0|t[|cRXP_LOOT_被污染的水球|r], 使用该物品开启任务
>>|cRXP_ENEMY_泰德雷斯|r在岛屿周边及水下区域巡逻
.collect 16408,1,1918,1 
.accept 1918 >>接任务: |cRXP_LOOT_被污染的水元素|r
.use 16408
.unitscan Tideress
step
.goto Ashenvale,48.93,69.56
>>前往凉亭下方
.complete 25,2 
step
#label Tideress
#loop
.line Ashenvale,45.84,70.67,46.07,70.83,46.53,70.80,46.72,70.63,47.22,70.44,47.57,70.42,47.79,69.90,48.04,69.67,48.71,69.54,48.36,69.74,48.43,70.14,48.93,70.82,49.49,70.76,50.21,70.36,50.47,70.43,50.54,71.08,50.74,71.31,51.42,70.86,51.75,70.86,52.13,71.14,52.18,71.60,52.08,72.10
.goto Ashenvale,48.71,69.54,40,0
.goto Ashenvale,48.04,69.67,40,0
.goto Ashenvale,47.79,69.90,40,0
.goto Ashenvale,47.57,70.42,40,0
.goto Ashenvale,47.22,70.44,40,0
.goto Ashenvale,46.72,70.63,40,0
.goto Ashenvale,46.53,70.80,40,0
.goto Ashenvale,46.07,70.83,40,0
.goto Ashenvale,45.84,70.67,40,0
.goto Ashenvale,45.84,70.67,0
>>击杀|cRXP_ENEMY_泰德雷斯|r. 击败她后搜刮出 |T136222:0|t[|cRXP_LOOT_被污染的水球|r], 使用该物品开启任务
>>|cRXP_ENEMY_泰德雷斯|r在岛屿周边及水下区域巡逻
.collect 16408,1,1918,1 
.accept 1918 >>接任务: |cRXP_LOOT_被污染的水元素|r
.use 16408
.unitscan Tideress
step
#loop
.goto Ashenvale,48.36,69.74,0
.goto Ashenvale,48.36,69.74,50,0
.goto Ashenvale,48.43,70.14,50,0
.goto Ashenvale,48.93,70.82,50,0
.goto Ashenvale,49.49,70.76,50,0
.goto Ashenvale,50.21,70.36,50,0
.goto Ashenvale,50.47,70.43,50,0
.goto Ashenvale,50.54,71.08,50,0
.goto Ashenvale,50.74,71.31,50,0
.goto Ashenvale,51.42,70.86,50,0
.goto Ashenvale,52.13,71.14,50,0
.goto Ashenvale,52.18,71.60,50,0
.goto Ashenvale,52.08,72.10,50,0
.goto Ashenvale,45.84,70.67,50,0
>>击杀|cRXP_ENEMY_污浊的水元素|r
.complete 25,1 
.mob Befouled Water Elemental
step
#loop
.line Ashenvale,39.81,62.94,39.65,63.74,39.77,65.40,40.22,66.23,41.41,66.56,41.46,67.44,41.55,67.71,41.79,68.28,42.08,68.71,42.46,68.39,42.96,68.43,43.33,68.09,43.78,68.86
.goto Ashenvale,43.78,68.86,0
.goto Ashenvale,43.78,68.86,40,0
.goto Ashenvale,43.33,68.09,40,0
.goto Ashenvale,42.46,68.39,40,0
.goto Ashenvale,42.08,68.71,40,0
.goto Ashenvale,41.79,68.28,40,0
.goto Ashenvale,41.55,67.71,40,0
.goto Ashenvale,41.46,67.44,40,0
.goto Ashenvale,41.41,66.56,40,0
.goto Ashenvale,40.22,66.23,40,0
.goto Ashenvale,39.77,65.40,40,0
.goto Ashenvale,39.65,63.74,40,0
.goto Ashenvale,39.81,62.94,40,0
>>击杀|cRXP_ENEMY_乌萨苟斯|r. 击败后搜刮其掉落的 |T132941:0|t[|cRXP_LOOT_乌萨苟斯的爪子|r], 并使用该物品开启任务
>>|cRXP_WARN_他稍作巡逻|r
.collect 16303,1,23 
.accept 23 >>接任务: |cRXP_LOOT_乌萨苟斯的爪子|r
.unitscan Ursangous
.use 16303
step
#completewith ThistlefurVillageArrive
.goto Ashenvale,35.58,56.31,70,0
.goto Ashenvale,34.14,53.51,40,0
.goto Ashenvale,31.73,51.69,100 >>|cRXP_WARN_小心别走进阿斯特兰纳(联盟城镇), |cRXP_ENEMY_南海镇卫兵|r 会杀了你. 为安全起见, 请跟随路径点箭头指引|r
.subzoneskip 2301
.unitscan Astranaar Sentinel
step << Shaman
.goto Ashenvale,33.55,67.47
>>|cRXP_WARN_使用|r|T132821:0|t[空的蓝色水囊] |cRXP_WARN_在凉亭下|r
.complete 1534,1 
.use 7767
step
#label ThistlefurVillageArrive
.goto Ashenvale,36.81,33.48,200 >>前往蓟皮村
>>|cRXP_WARN_请务必在途中避开阿斯特兰纳守卫|r
.subzoneskip 2301
.unitscan Astranaar Sentinel
.isOnQuest 216
step
#completewith next
>>在前往洞穴的路上击杀蓟皮萨满祭司和蓟皮复仇者
.complete 216,2 
.mob +Thistlefur Shaman
.complete 216,1 
.mob +Thistlefur Avenger
step
#label EntertheHold
.goto Ashenvale,38.67,30.62,40 >>进入蓟皮堡
.isOnQuest 6462
step
#loop
.goto Ashenvale,40.39,33.22,0
.goto Ashenvale,40.39,33.22,20,0
.goto Ashenvale,40.77,32.81,20,0
.goto Ashenvale,41.36,32.19,20,0
.goto Ashenvale,41.75,32.94,20,0
.goto Ashenvale,41.77,33.68,20,0
.goto Ashenvale,42.37,33.61,20,0
.goto Ashenvale,42.82,34.11,20,0
.goto Ashenvale,41.73,34.47,20,0
.goto Ashenvale,41.66,35.70,20,0
>>从地面上的巨魔的箱子中搜刮出巨魔符咒
.complete 6462,1 
step
.goto Ashenvale,41.49,34.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与在洞穴后方的|cRXP_FRIENDLY_Ruul|r交谈, 这将触发护送任务
.accept 6482 >>接任务: |cRXP_LOOT_鲁尔的自由|r
.target Ruul Snowhoof
step
.goto Ashenvale,40.68,33.21,20,0
.goto Ashenvale,40.29,32.25,20,0
.goto Ashenvale,39.41,31.00,20,0
.goto Ashenvale,38.28,30.68,20,0
.goto Ashenvale,37.39,32.74,30,0
.goto Ashenvale,37.30,34.49,30,0
.goto Ashenvale,38.73,36.86
.complete 6482,1 
>>|cRXP_WARN_小心！当你走到洞穴一半时, 会刷新3只|cRXP_ENEMY_Thistlefurs|r|cRXP_WARN_, 另外3只会在蓟毛村大门外刷新|r
.target Ruul Snowhoof
step
#loop
.goto Ashenvale,35.75,32.01,0
.goto Ashenvale,37.91,34.49,40,0
.goto Ashenvale,35.89,36.65,40,0
.goto Ashenvale,35.75,32.01,40,0
.goto Ashenvale,34.09,38.48,40,0
.goto Ashenvale,31.86,39.25,40,0
.goto Ashenvale,32.57,42.78,40,0
.goto Ashenvale,30.98,44.40,40,0
.goto Ashenvale,35.75,32.01,40,0
>>完成击杀|cRXP_ENEMY_蓟皮萨满祭司|r 和|cRXP_ENEMY_蓟皮复仇者|r
.complete 216,2 
.mob +Thistlefur Shaman
.complete 216,1 
.mob +Thistlefur Avenger
step
#completewith next
.goto Ashenvale,58.03,55.87,100 >>向东前往雷尼伍德隐修院
.isOnQuest 5867
step
#completewith next
.line Ashenvale,62.39,49.80,61.99,49.81,61.30,50.03,61.03,50.43,61.01,51.09,60.94,51.53,60.49,52.41,59.83,53.40,59.55,53.71,59.26,54.25,59.10,54.76,58.80,55.24,58.17,55.57,57.91,55.90,57.54,56.03,56.93,56.06,56.37,55.90,56.16,55.46,55.62,55.41,54.80,55.09,54.06,54.91,53.01,54.54,52.68,54.42,52.24,54.38
.goto Ashenvale,52.24,54.38,40,0
.goto Ashenvale,52.68,54.42,40,0
.goto Ashenvale,54.06,54.91,40,0
.goto Ashenvale,53.01,54.54,40,0
.goto Ashenvale,54.80,55.09,40,0
.goto Ashenvale,55.62,55.41,40,0
.goto Ashenvale,56.16,55.46,40,0
.goto Ashenvale,56.37,55.90,40,0
.goto Ashenvale,57.54,56.03,40,0
.goto Ashenvale,56.93,56.06,40,0
.goto Ashenvale,57.91,55.90,40,0
.goto Ashenvale,58.17,55.57,40,0
.goto Ashenvale,58.80,55.24,40,0
.goto Ashenvale,59.10,54.76,40,0
.goto Ashenvale,59.26,54.25,40,0
.goto Ashenvale,59.55,53.71,40,0
.goto Ashenvale,59.83,53.40,40,0
.goto Ashenvale,60.49,52.41,40,0
.goto Ashenvale,60.94,51.53,40,0
>>击杀|cRXP_ENEMY_萨杜布拉|r. 击败她后拾取 |T132225:0|t[|cRXP_LOOT_萨杜布拉的头颅|r], 并使用它开启任务
>>|cRXP_ENEMY_萨杜布拉|r在附近轻微巡逻
.collect 16304,1,24 
.accept 24 >>接任务: |cRXP_LOOT_萨杜布拉的头颅|r
.unitscan Shadumbra
.use 16304
step
#loop
.goto Ashenvale,58.08,56.06,0
.goto Ashenvale,58.08,56.06,40,0
.goto Ashenvale,58.69,55.18,40,0
.goto Ashenvale,59.27,54.47,40,0
.goto Ashenvale,59.83,53.26,40,0
.goto Ashenvale,60.40,52.83,40,0
.goto Ashenvale,61.03,51.96,40,0
.goto Ashenvale,60.99,49.19,40,0
.goto Ashenvale,62.51,50.16,40,0
>>击杀|cRXP_ENEMY_欢笑的姐妹|r. 击败她们后可掠夺一个 |T134776:0|t[|cRXP_LOOT_蚀刻瓶|r]
.collect 5867,1,1195,1 
.mob Laughing Sister
step
#label Shadumbra
.line Ashenvale,62.39,49.80,61.99,49.81,61.30,50.03,61.03,50.43,61.01,51.09,60.94,51.53,60.49,52.41,59.83,53.40,59.55,53.71,59.26,54.25,59.10,54.76,58.80,55.24,58.17,55.57,57.91,55.90,57.54,56.03,56.93,56.06,56.37,55.90,56.16,55.46,55.62,55.41,54.80,55.09,54.06,54.91,53.01,54.54,52.68,54.42,52.24,54.38
.goto Ashenvale,60.94,51.53,40,0
.goto Ashenvale,60.49,52.41,40,0
.goto Ashenvale,59.83,53.40,40,0
.goto Ashenvale,59.55,53.71,40,0
.goto Ashenvale,59.26,54.25,40,0
.goto Ashenvale,59.10,54.76,40,0
.goto Ashenvale,58.80,55.24,40,0
.goto Ashenvale,58.17,55.57,40,0
.goto Ashenvale,57.91,55.90,40,0
.goto Ashenvale,57.54,56.03,40,0
.goto Ashenvale,56.93,56.06,40,0
.goto Ashenvale,56.37,55.90,40,0
.goto Ashenvale,56.16,55.46,40,0
.goto Ashenvale,55.62,55.41,40,0
.goto Ashenvale,54.80,55.09,40,0
.goto Ashenvale,54.06,54.91,40,0
.goto Ashenvale,53.01,54.54,40,0
.goto Ashenvale,52.68,54.42,40,0
.goto Ashenvale,52.24,54.38,40,0
.goto Ashenvale,62.39,49.80,40,0
.goto Ashenvale,62.39,49.80,0
>>击杀|cRXP_ENEMY_萨杜布拉|r. 击败她后拾取 |T132225:0|t[|cRXP_LOOT_萨杜布拉的头颅|r], 并使用它开启任务
>>|cRXP_ENEMY_萨杜布拉|r在附近轻微巡逻
.collect 16304,1,24 
.accept 24 >>接任务: |cRXP_LOOT_萨杜布拉的头颅|r
.unitscan Shadumbra
.use 16304
step
.goto Ashenvale,62.07,51.32
>>击杀位于建筑顶部的|cRXP_ENEMY_守护者奥达努斯|r, 从他身上搜刮出|cRXP_LOOT_头颅|r
>>|cRXP_WARN_当心！他有两个|r|cRXP_ENEMY_塞纳里奥辩护者|r|cRXP_WARN_在保护他. 他们可以施放|r|T136036:0|t[自然之力] |cRXP_WARN_(召唤3个|r|cRXP_ENEMY_树人|r)|r
>>|cRXP_ENEMY_奥达努斯|r|cRXP_WARN_可施放|r|T136100:0|t[缠绕根须]|cRXP_WARN_和|r|T136048:0|t[闪电箭]
.complete 1088,1 
.target Keeper Ordanus
.isOnQuest 1088
.group 2
step
#completewith next
.goto Ashenvale,63.34,44.14,40,0
.goto Ashenvale,65.32,44.22,40,0
.goto Ashenvale,66.56,51.77,80 >>前往夜跑之地
step
#loop
.goto Ashenvale,67.85,51.34,0
.goto Ashenvale,66.78,51.71,50,0
.goto Ashenvale,66.19,53.44,50,0
.goto Ashenvale,66.17,54.40,50,0
.goto Ashenvale,66.22,55.27,50,0
.goto Ashenvale,66.20,56.37,50,0
.goto Ashenvale,66.77,57.14,50,0
.goto Ashenvale,67.11,56.39,50,0
.goto Ashenvale,67.35,55.53,50,0
.goto Ashenvale,67.92,54.42,50,0
.goto Ashenvale,68.92,53.44,50,0
.goto Ashenvale,68.63,52.69,50,0
.goto Ashenvale,67.85,51.34,50,0
>>击杀|cRXP_ENEMY_魔草巡影者|r和|cRXP_ENEMY_魔草萨特|r和|cRXP_ENEMY_魔草魔仆|r, 掠夺他们的|cRXP_LOOT_萨特的角|r
>>|cRXP_WARN_小心！所有邪火之灵都会施放|r|T136119:0|t[压倒性恶臭]|cRXP_WARN_, 一个瞬发的6秒沉默技能|r << Mage/Warlock/Priest/Druid/Shaman
.complete 6441,1 
.mob Felmusk Shadowstalker
.mob Felmusk Felsworn
.mob Felmusk Satyr
step
.goto Ashenvale,60.20,72.90
>>在月亮井中使用|T134776:0|t[|cRXP_LOOT_蚀刻瓶|r]
.complete 1195,1 
.use 5867
step
.goto Ashenvale,71.10,68.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Kuray'bin|r交谈
.turnin 6503 >>交任务: |cRXP_FRIENDLY_灰谷先驱者|r
.target Kuray'bin
step
#loop
.goto Ashenvale,78.24,65.72,0
.goto Ashenvale,78.24,65.72,45,0
.goto Ashenvale,77.93,65.93,45,0
.goto Ashenvale,77.60,66.33,45,0
.goto Ashenvale,77.35,66.96,45,0
.goto Ashenvale,76.93,68.04,45,0
.goto Ashenvale,76.11,68.95,45,0
.goto Ashenvale,75.94,69.80,45,0
.goto Ashenvale,75.26,69.96,45,0
.goto Ashenvale,74.86,70.06,45,0
.goto Ashenvale,74.36,70.10,45,0
.goto Ashenvale,73.33,70.61,45,0
.goto Ashenvale,72.94,70.67,45,0
.goto Ashenvale,72.50,70.60,45,0
.goto Ashenvale,72.08,70.47,45,0
.goto Ashenvale,71.46,70.10,45,0
.line Ashenvale,71.46,70.10,72.08,70.47,72.50,70.60,72.94,70.67,73.33,70.61,74.36,70.10,74.86,70.06,75.26,69.96,75.94,69.80,76.11,68.95,76.93,68.04,77.35,66.96,77.60,66.33,77.93,65.93,78.24,65.72
>>击杀|cRXP_ENEMY_沙普塔隆|r. 击败他后搜刮 |T136063:0|t[|cRXP_LOOT_沙普塔隆的爪子|r], 并使用它开启任务
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_沙普塔隆|r|cRXP_WARN_是31级, 会在附近巡逻. 如果你难以击杀他, 可以风筝他回到碎木林哨站或被遗弃者营地. 如果这么做, 请确保造成50%以上的伤害才能获得任务奖励. 你也可以稍后再完成这个任务|r
.collect 16305,1,2 
.accept 2 >>接任务: |cRXP_LOOT_沙普塔隆的爪子|r
.unitscan Sharptalon
.use 16305
step
#sticky
#completewith EnterBFD
.subzone 2797,2 >>现在你应该寻找一个前往黑潮深海的队伍
.dungeon BFD
step
.goto Ashenvale,73.04,62.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃尔托格·怒齿|r交谈
.turnin 6544 >>交任务: |cRXP_FRIENDLY_托雷克的突袭|r
.target Ertog Ragetusk
.isQuestComplete 6544
step
.goto Ashenvale,73.78,61.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞娜尼|r交谈
.turnin 2 >>交任务: |cRXP_FRIENDLY_沙普塔隆的爪子|r
.turnin 24 >>交任务: |cRXP_FRIENDLY_萨杜布拉的头颅|r
.turnin 23 >>交任务: |cRXP_FRIENDLY_乌萨苟斯的爪子|r
.turnin 247 >>交任务: |cRXP_FRIENDLY_完成狩猎|r
.target Senani Thunderheart
.isOnQuest 2
step
.goto Ashenvale,73.78,61.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞娜尼|r交谈
.turnin 24 >>交任务: |cRXP_FRIENDLY_萨杜布拉的头颅|r
.turnin 23 >>交任务: |cRXP_FRIENDLY_乌萨苟斯的爪子|r
.target Senani Thunderheart
step
.goto Ashenvale,73.06,61.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮克希尔|r交谈
.turnin 6441 >>交任务: |cRXP_FRIENDLY_萨特之角|r
.target Pixel
step
.goto Ashenvale,73.67,60.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马斯托克|r交谈
.turnin 25 >>交任务: |cRXP_FRIENDLY_石爪山的困境|r
.turnin 1918 >>交任务: |cRXP_FRIENDLY_被污染的水元素|r
.accept 824 >>接任务: |cRXP_LOOT_陶土议会的耶努萨克雷|r
.target Mastok Wrilehiss
step
.goto Ashenvale,74.11,60.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅玛·雪蹄|r交谈
.turnin 6482 >>交任务: |cRXP_FRIENDLY_鲁尔的自由|r
.target Yama Snowhoof
step << Hunter
#optional
#completewith ClawBiteAshenvale2
.goto Ashenvale,73.38,61.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_基苏 交谈|r
.stable >>驯服你的宠物. 你将很快驯服一只|cRXP_ENEMY_老灰谷熊|r和一只|cRXP_ENEMY_幽爪前锋|r
.target Qeeju
step << Hunter
#optional
#loop
.goto Ashenvale,65.31,64.65,0
.goto Ashenvale,69.12,64.45,0
.goto Ashenvale,69.12,64.45,50,0
.goto Ashenvale,68.59,60.53,50,0
.goto Ashenvale,66.62,62.81,50,0
.goto Ashenvale,65.31,64.65,50,0
.train 16830 >>|cRXP_WARN_施放|r|T132164:0|t[驯服野兽]|cRXP_WARN_在|r|cRXP_ENEMY_老灰谷熊|r上. 用它攻击怪物以学习|r|T132140:0|t[利爪 (等级 4)]
.mob +Elder Ashenvale Bear
.train 17264 >>|cRXP_WARN_施放|r|T132164:0|t[驯服野兽]|cRXP_WARN_作用于|r|cRXP_ENEMY_幽爪前锋|r身上. 攻击怪物以学习|r|T132278:0|t[撕咬(等级4)]
.mob +Ghostpaw Alpha
.link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
.xp <27,1 
step << Hunter
#label ClawBiteAshenvale2
#optional
#loop
.goto Ashenvale,65.31,64.65,0
.goto Ashenvale,68.59,60.53,50,0
.goto Ashenvale,66.62,62.81,50,0
.goto Ashenvale,65.31,64.65,50,0
.train 16830 >>|cRXP_WARN_施放|r|T132164:0|t[驯服野兽]|cRXP_WARN_在|r|cRXP_ENEMY_老灰谷熊|r上. 用它攻击怪物以学习|r|T132140:0|t[利爪 (等级 4)]
.mob Elder Ashenvale Bear
.link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
.xp >26,1 
step
.goto Ashenvale,73.18,61.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔格拉|r交谈
.fly Zoram'gar >>飞往佐拉姆加前哨站
.target Vhulgra
step
.goto Ashenvale,11.90,34.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡拉恩|r交谈
.turnin 216 >>交任务: |cRXP_FRIENDLY_蓟皮熊怪的麻烦|r
.target Karang Amakkar
step
.goto Ashenvale,11.65,34.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米苏瓦|r交谈
.turnin 6462 >>交任务: |cRXP_FRIENDLY_巨魔符咒|r
.target Mitsuwa
step
.goto Ashenvale,11.56,34.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
.turnin 824 >>交任务: |cRXP_FRIENDLY_陶土议会的耶努萨克雷|r
.accept 6563 >>接任务: |cRXP_LOOT_阿库麦尔水晶|r
.accept 6921 >>接任务: |cRXP_WARN_废墟之间|r
.accept 6565 >>接任务: |cRXP_LOOT_上古之神的仆从|r
.target Je'neu Sancrea
.dungeon BFD
.isQuestTurnedIn 6564
step
.goto Ashenvale,11.56,34.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
.turnin 824 >>交任务: |cRXP_FRIENDLY_陶土议会的耶努萨克雷|r
.accept 6563 >>接任务: |cRXP_LOOT_阿库麦尔水晶|r
.accept 6921 >>接任务: |cRXP_WARN_废墟之间|r
.target Je'neu Sancrea
.dungeon BFD
step
.goto Ashenvale,11.56,34.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
.turnin 824 >>交任务: |cRXP_FRIENDLY_陶土议会的耶努萨克雷|r
.target Je'neu Sancrea
step
.goto Ashenvale,12.06,34.63
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆格拉什|r交谈
>>|cRXP_WARN_这将触发一个护送任务|r
.accept 6641,1 >>接任务: |cRXP_LOOT_鞭笞者沃尔沙|r
.target Muglash
step
.goto Ashenvale,9.63,27.63
>>到达目的地后, 点击 |cRXP_PICK_火盆|r
.complete 6641,1 
.mob Vorsha the Lasher
step
.goto Kalimdor,43.89,35.23,100 >>前往黑暗深渊入口
.dungeon BFD
step
#completewith next
>>从墙上获取阿库麦尔蓝宝石的战利品
.complete 6563,1 
.dungeon BFD
.isOnQuest 6563
step
#loop
.goto Kalimdor,43.94,34.86,0
.goto Kalimdor,43.81,35.16,20,0
.goto Kalimdor,43.94,34.86,20,0
.goto Kalimdor,43.90,34.59,20,0
.goto Kalimdor,44.00,34.57,20,0
.goto Kalimdor,44.16,34.85,20,0
.goto Kalimdor,44.35,34.97,20,0
.goto Kalimdor,44.53,34.86,20,0
>>击杀黑潮海潮女祭司. 从她们身上搜刮出一个潮湿的便笺, 并使用它来开启任务
.collect 16790,1,6564 
.accept 6564 >>接任务: |cRXP_LOOT_上古之神的仆从|r
.mob Blackfathom Tide Priestess
.use 16790
.dungeon BFD
step
#loop
.goto Kalimdor,44.34,35.11,0
.goto Kalimdor,44.53,34.86,20,0
.goto Kalimdor,44.35,34.97,20,0
.goto Kalimdor,44.16,34.85,20,0
.goto Kalimdor,44.00,34.57,20,0
.goto Kalimdor,43.90,34.59,20,0
.goto Kalimdor,43.94,34.86,20,0
.goto Kalimdor,43.81,35.16,20,0
.goto Kalimdor,44.34,35.11,20,0
>>从墙上获取阿库麦尔蓝宝石的战利品
.complete 6563,1 
.dungeon BFD
.isOnQuest 6563
step
#label EnterBFD
.goto Kalimdor,44.36,34.86
.subzone 2797,2 >>进入BFD副本传送门. 传入区域
.dungeon BFD
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_银色守卫瑟拉瑞德(Argent Guard Thaelrid)|r交谈
.accept 6561 >>接任务: |cRXP_WARN_黑暗深渊中的邪恶|r
.target Argent Guard Thaelrid
.dungeon BFD
step
>>击杀|cRXP_ENEMY_Lorguss Jett|r
.complete 6565,1 
.mob Lorguss Jett
.isOnQuest 6565
.dungeon BFD
step
#completewith next
>>在地面上的水中拾取|cRXP_PICK_深渊之石|r, 以获得|cRXP_LOOT_深渊之核|r
>>|cRXP_WARN_掠夺此物品将召唤|r|cRXP_ENEMY_阿奎尼斯男爵|r
.complete 6921,1 
.isOnQuest 6921
.dungeon BFD
step
>>击杀|cRXP_ENEMY_阿奎尼斯男爵|r. 击败他后搜刮一个 |T136222:0|t[|cRXP_LOOT_奇怪的水球|r]. 使用它来接取任务
.collect 16782,1,6782 
.accept 6922 >>接任务: |cRXP_LOOT_阿奎尼斯男爵|r
.mob Baron Aquanis
.use 16782
.dungeon BFD
step
>>在地面上的水中拾取|cRXP_PICK_深渊之石|r, 以获得|cRXP_LOOT_深渊之核|r
.complete 6921,1 
.isOnQuest 6921
.dungeon BFD
step
>>击杀 |cRXP_ENEMY_梦游者克尔里斯|r, 掠夺他的 |cRXP_LOOT_头|r
.complete 6561,1 
.mob Twilight Lord Kelris
.isOnQuest 6561
.dungeon BFD
step
#completewith next
.hs >>传送至裂枝村邮局
.use 6948
>>|cRXP_WARN_如果你愿意, 可以先击杀|r|cRXP_ENEMY_Aku'mai|r|cRXP_WARN_|first. 这是副本的最后一个首领|r
.dungeon BFD
step
.goto Ashenvale,73.18,61.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔格拉|r交谈
.fly Zoram'gar >>飞往佐拉姆加前哨站
.target Vhulgra
.dungeon BFD
step
.goto Ashenvale,12.22,34.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战歌信使|r交谈
.turnin 6641 >>交任务: |cRXP_FRIENDLY_鞭笞者沃尔沙|r
.target Warsong Runner
step
.goto Ashenvale,11.56,34.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
.turnin 6564 >>交任务: |cRXP_FRIENDLY_上古之神的仆从|r
.target Je'neu Sancrea
.dungeon BFD
.isOnQuest 6564
step
.goto Ashenvale,11.56,34.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
.turnin 6565 >>交任务: |cRXP_FRIENDLY_上古之神的仆从|r
.target Je'neu Sancrea
.dungeon BFD
.isQuestComplete 6565
step
.goto Ashenvale,11.56,34.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
.turnin 6563 >>交任务: |cRXP_FRIENDLY_阿库麦尔水晶|r
.target Je'neu Sancrea
.dungeon BFD
.isQuestComplete 6563
step
.goto Ashenvale,11.56,34.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
.turnin 6921 >>交任务: |cRXP_FRIENDLY_废墟之间|r
.target Je'neu Sancrea
.dungeon BFD
.isQuestComplete 6521
step
.goto Ashenvale,11.56,34.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
.turnin 6922 >>交任务: |cRXP_FRIENDLY_阿奎尼斯男爵|r
.target Je'neu Sancrea
.dungeon BFD
.isQuestComplete 6922
step
#completewith next
.hs >>传送至裂枝村邮局
.use 6948
.cooldown item,6948,>0,1

step
.goto Ashenvale,73.18,61.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔格拉|r交谈
.fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
.target Vhulgra
.cooldown item,6948,>0,1
step
.goto Ashenvale,12.24,33.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德鲁克|r交谈
.fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
.target Andruk
.cooldown item,6948,<0
.subzoneskip 431
step
.goto Thunder Bluff,71.04,34.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴珊娜|r交谈
.turnin 6561 >>交任务: |cRXP_FRIENDLY_黑暗深渊中的邪恶|r
.target Bashana Runetotem
.isQuestComplete 6561
.dungeon BFD
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 29-31 千针石林
#displayname 29-31 千针石林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 20-30
#next 31-34 希尔斯布莱德/阿拉希高地
step << Shaman/Warrior
.goto Thunder Bluff,54.06,57.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Delgo交谈|r
.vendor >>|cRXP_BUY_如果该物品已上线且你尚未拥有, 请从他那里购买|r|T132408:0|t[无情战斧]|r
.money <3.0195
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<21.0
.target Delgo Ragetotem
step << Rogue
.goto Thunder Bluff,53.00,56.63
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kard|r|cRXP_BUY_交谈. 从他那里购买|r|T135651:0|t[钝刺] |cRXP_BUY_作为你的副手武器|r
.collect 2526,1,5881,1 
.money <2.0353
.target Kard Ragetotem
.itemStat 17,QUALITY,<7
.itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.5
step << Rogue
#completewith FreewindHome
+装备 |T135651:0|t[钝刺]
.use 2526
.itemcount 2526,1
.itemStat 17,QUALITY,<7
.itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.5
step
.goto Thunder Bluff,54.90,51.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zangen|r交谈
.turnin 1195 >>交任务: |cRXP_FRIENDLY_神圣之火|r
.accept 1196 >>接任务: |cRXP_LOOT_神圣之火|r
.target Zangen Stonehoof
step << Druid
.goto Thunder Bluff,76.79,31.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯姆·蛮鬃|r交谈
.train 3029 >>训练你的职业法术
.target Kym Wildmane
.xp <28,1
.xp >30,1
step << Druid
#optional
.goto Thunder Bluff,76.79,31.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯姆·蛮鬃|r交谈
.train 783 >>训练你的职业法术
.target Kym Wildmane
.xp <30,1
step
.goto Thunder Bluff,61.53,80.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Melor|r交谈
.accept 1131 >>接任务: |cRXP_LOOT_钢齿土狼|r
.target Melor Stonehoof
step << Hunter
.goto Thunder Bluff,59.13,86.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 14319 >>训练你的职业法术
.target Urek Thunderhorn
.xp <28,1
.xp >30,1
step << Hunter
#optional
.goto Thunder Bluff,59.13,86.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 5384 >>训练你的职业法术
.target Urek Thunderhorn
.xp <30,1
step << Hunter
.goto Thunder Bluff,54.07,84.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hesuwa|r交谈
.train 24559 >>训练你的宠物法术
.target Hesuwa Thunderhorn
.xp <30,1
step << Warrior
.goto Thunder Bluff,57.59,85.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
.train 7887 >>训练你的职业法术
.target Ker Ragetotem
.xp <28,1
.xp >30,1
step << Warrior
#optional
.goto Thunder Bluff,57.27,87.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔姆交谈|cRXP_FRIENDLY_TORM|r
.train 7369 >>训练你的职业法术
.accept 1718 >>接任务: |cRXP_LOOT_岛民|r
.target Torm Ragetotem
.xp <30,1
step
.goto Thunder Bluff,45.83,64.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
.home >>将你的炉石设置为雷霆崖
.target Innkeeper Pala
step
#completewith next
.goto Thunder Bluff,28.14,32.97,40,0
.goto Thunder Bluff,28.51,28.95,10 >>前往灵魂高地, 进入幻视之池
step
.goto Thunder Bluff,22.81,20.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
.turnin 1086 >>交任务: |cRXP_FRIENDLY_地精空港|r
.target Apothecary Zamah
.isOnQuest 1086
step << Priest
.goto Thunder Bluff,25.31,15.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈尔斯|r交谈
.train 8104 >>训练你的职业法术
.target Miles Welsh
.xp <28,1
.xp >30,1
step << Priest
#optional
.goto Thunder Bluff,25.31,15.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈尔斯|r交谈
.train 602 >>训练你的职业法术
.target Miles Welsh
.xp <30,1
step << Mage
.goto Thunder Bluff,22.74,14.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shymm|r交谈
.train 759 >>训练你的职业法术
.target Archmage Shymm
.xp <28,1
.xp >30,1
step << Mage
#optional
.goto Thunder Bluff,22.74,14.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shymm|r交谈
.train 8412 >>训练你的职业法术
.target Archmage Shymm
.xp <30,1
step << Mage
.goto Thunder Bluff,22.48,16.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Birgitte|r交谈
.train 3566 >>坐骑 |T135765:0|t[传送:雷霆崖]
.target Birgitte Cranston
.xp <30,1
step << Shaman
.goto Thunder Bluff,23.64,18.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 8053 >>训练你的职业法术
.target Tigor Skychaser
.xp <28,1
.xp >30,1
step << Shaman
#optional
.goto Thunder Bluff,23.64,18.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 556 >>训练你的职业法术
.target Tigor Skychaser
.xp <30,1
step
#completewith next
.skill firstaid,150 >>制作 |T133687:0|t[厚绒线绷带] 直到你的技能达到 150
.skill firstaid,<1,1
step
.goto Thunder Bluff,29.68,21.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Pand|r交谈
.train 7928 >>训练 |T133671:0|t[丝质绷带]
>>|cRXP_WARN_如果毛料不足无法达到150点技能, 可跳过此步骤|r
.target Pand Stonebinder
.skill firstaid,<1,1
step << Hunter
.goto Thunder Bluff,46.98,45.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库纳·雷角|r交谈
.vendor >>|cRXP_BUY_如果有的话, 从她那里购买 a|r|T135495:0|t[强韧的弯弓]|r
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.9
.target Kuna Thunderhorn
.money <1.9467
step << Hunter
.goto Thunder Bluff,46.98,45.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kuna交谈|r
>>|cRXP_BUY_从她那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,1800,5881,1 << Hunter 
.target Kuna Thunderhorn
step
#optional
.abandon 6561 >>放弃黑暗深渊中的恶魔
.isOnQuest 6561
.dungeon BFD
step
#optional
.abandon 6565 >>放弃对上古之神的效忠
.isOnQuest 6565
.dungeon BFD
step
#optional
.abandon 6563 >>放弃阿库麦尔水晶
.isOnQuest 6563
.dungeon BFD
step
#optional
.abandon 6921 >>遗弃于废墟之间
.isOnQuest 6921
.dungeon BFD
step
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Camp Taurajo >>飞往陶拉霍营地
.target Tal
.zoneskip The Barrens
.isQuestAvailable 4542
step
.goto The Barrens,45.10,57.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tatternack|r交谈
.accept 1153 >>接任务: |cRXP_LOOT_新的矿石样本|r
.target Tatternack Steelforge
step
.goto The Barrens,44.55,59.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碎牙|r交谈
.aura 16618 >>|cRXP_WARN_If you have 10|r |T134128:0|t[|cRXP_LOOT_Blood Shards|r |cRXP_WARN_left, use them to obtain|r |T136022:0|t[接任务: |cRXP_WARN_风之魂|r] |cRXP_WARN_from|r |cRXP_FRIENDLY_Mangletooth|r
.itemcount 5075,10
.target Mangletooth
step << Shaman
#completewith next
.goto The Barrens,43.84,77.28,25,0
.goto The Barrens,43.62,77.29,25,0
.goto The Barrens,43.42,77.41,15 >>前往|cRXP_FRIENDLY_布瑞恩|r方向
step << Shaman
.goto The Barrens,43.42,77.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞恩|r交谈
.turnin 1534 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.accept 220 >>接任务: |cRXP_LOOT_水之召唤|r
.target Brine
step
#completewith next
.goto The Barrens,48.85,84.88,50 >>前往贝勒莫丹
.group
step
.goto The Barrens,48.94,86.31
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Feegly|r交谈
.accept 857 >>接任务: |cRXP_LOOT_众月之泪|r
.target Feegly the Exiled
.group
step
#completewith next
.goto The Barrens,49.01,84.48,8,0
.goto The Barrens,49.06,84.59,8,0
.goto The Barrens,49.38,84.48,8,0
.goto The Barrens,49.53,84.42,8,0
.goto The Barrens,49.43,84.28,6 >>前往贝奥尔登的底层
.group
step
.goto The Barrens,49.13,84.25
>>打开|cRXP_PICK_塔文布莱德将军的箱子|r. 从中获取|cRXP_LOOT_众月之泪|r
>>|cRXP_WARN_小心！在塔文布莱德将军的房间很容易发生过度拉怪|r
>>|cRXP_WARN_直接拉怪时, 除了塔文布莱德将军以外的任何怪物都不要拉|r
.complete 857,1 
.group 3
step
#completewith next
.goto The Barrens,49.43,84.28,8,0
.goto The Barrens,49.53,84.42,8,0
.goto The Barrens,49.38,84.48,8,0
.goto The Barrens,49.06,84.59,8,0
.goto The Barrens,49.01,84.48,8,0
.goto The Barrens,48.75,84.63,20 >>离开贝奥尔丹要塞
.group
step
#label TearMoons
.goto The Barrens,48.94,86.31
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Feegly|r交谈
>>|cRXP_WARN_赶紧去交任务, 否则可能因RP事件而需要等待|r
.turnin 857 >>交任务: |cRXP_FRIENDLY_众月之泪|r
.target Feegly the Exiled
.group
step
#completewith next
.goto The Barrens,44.13,91.44,80 >>向南前往大升降梯
step
.goto Thousand Needles,31.87,21.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里什|r交谈
.turnin 5881 >>交任务: |cRXP_FRIENDLY_召回卫兵|r
.target Grish Longrunner
.isOnQuest 5881
step
.goto Thousand Needles,32.24,22.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moonhorn|r交谈
.accept 4542 >>接任务: |cRXP_LOOT_给乱风岗的紧急信件|r
.target Brave Moonhorn
step
.goto Thousand Needles,31.97,23.76,30 >>乘坐电梯前往千针石林
>>|cRXP_WARN_别掉下去！你会死的！|r
.isOnQuest 4542
step
#completewith next
.goto Thousand Needles,38.46,32.60,0
.goto Thousand Needles,38.61,31.49,50,0
.line Thousand Needles,39.51,33.43,39.34,32.31,38.81,31.73,37.34,29.29,36.57,29.47,35.84,28.59,35.19,28.11,34.25,29.49,33.89,29.77,33.81,30.12,33.27,30.86,32.73,30.68,32.29,30.52,31.55,30.61,30.69,32.43,29.51,33.89,29.24,33.96,28.64,33.43,28.24,33.37,27.34,34.02,25.29,34.23,24.56,32.76,22.05,30.61,20.83,28.26,20.45,27.87,19.96,27.67,19.46,27.04,18.98,26.71,18.63,26.19,18.70,24.42,18.47,23.06,18.72,22.53,18.32,22.10,19.14,22.81,19.06,23.80,18.60,25.14
>>击杀|cRXP_ENEMY_加拉克信使|r. 击败后搜刮其尸体, 获得 |T133473:0|t[|cRXP_LOOT_暗杀指令|r], 使用该物品开启任务
>>|cRXP_WARN_他出现在斯普利霍夫峭壁(东部半人马营地)|r
.collect 12564,1,4881 
.accept 4881 >>接任务: |cRXP_LOOT_暗杀计划|r
.use 12564
.unitscan Galak Messenger
step
#completewith next
.goto Thousand Needles,46.73,48.27,30 >>前往风语要塞的升降梯
step
.goto Thousand Needles,45.91,49.91,25 >>乘坐升降梯前往自由风村
step
.goto Thousand Needles,45.70,50.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Longhorn|r交谈
.turnin 4542 >>交任务: |cRXP_FRIENDLY_给乱风岗的紧急信件|r
.accept 4841 >>接任务: |cRXP_LOOT_清除半人马|r
.target Cliffwatcher Longhorn
step
.goto Thousand Needles,46.00,50.80
>>点击|cRXP_FRIENDLY_通缉告示|r
.accept 5147 >>接任务: |cRXP_LOOT_通缉：阿纳克·恐怖图腾|r
step
.goto Thousand Needles,46.10,51.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|RXP_FRIENDLY_Rau|r交谈
.turnin 1196 >>交任务: |cRXP_FRIENDLY_神圣之火|r
.accept 1197 >>接任务: |cRXP_LOOT_神圣之火|r
.target Rau Cliffrunner
.group
step
.goto Thousand Needles,46.10,51.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|RXP_FRIENDLY_Rau|r交谈
.turnin 1196 >>交任务: |cRXP_FRIENDLY_神圣之火|r
.target Rau Cliffrunner
step
.goto Thousand Needles,45.15,50.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫塔尔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134937:0|t[卷轴]|cRXP_BUY_, 如果有的话|r << !Warrior
.vendor >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134937:0|t[卷轴]|cRXP_BUY_和|r|T134413:0|t[活根草]|cRXP_BUY_, 如果有的话|r << Warrior
.target Montarr
step << Hunter
.goto Thousand Needles,44.89,50.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯塔恩|r交谈
.vendor >>|cRXP_BUY_购买|r|T135495:0|t[|cRXP_FRIENDLY_笨重短弓|r]|cRXP_BUY_如果可用|r
.target Starn
.money <2.7172
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<14.2
step
.goto Thousand Needles,44.70,50.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈加尔|r交谈
.accept 4821 >>接任务: |cRXP_LOOT_异型卵|r
.target Hagar Lightninghoof
step
.goto Thousand Needles,44.90,48.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾鲁|r交谈
.accept 4767 >>接任务: |cRXP_LOOT_驭风者|r
.target Elu
step
.goto Thousand Needles,45.14,49.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈瑟|r交谈
.fp Freewind Post >>获取乱风岗的飞行路径
.target Nyse
step
#completewith Clovenhoof
>>击杀|cRXP_ENEMY_加拉克斥候|r和|cRXP_ENEMY_加拉克争斗者|r和|cRXP_ENEMY_加拉克逐风者|r
>>击杀你看到的每一个|cRXP敌方加拉克斥候|c
.complete 4841,1 
.mob +Galak Scout
.complete 4841,2 
.mob +Galak Wrangler
.complete 4841,3 
.mob +Galak Windchaser
step
#label Splithoofcave
#completewith Clovenhoof
.goto Thousand Needles,44.12,37.22,20 >>进入洞窟
.group
step
#requires Splithoofcave
#completewith Clovenhoof
.goto Thousand Needles,44.44,36.32,12,0
.goto Thousand Needles,43.14,35.19,12,0
.goto Thousand Needles,42.11,34.54,12,0
.goto Thousand Needles,42.01,31.47,20 >>前往|cRXP_PICK_古代火盆|r
.group
step
#requires Splithoofcave
#label Clovenhoof
.goto Thousand Needles,42.01,31.47
>>打开|cRXP_PICK_古代火盆|r, 拾取其中的|cRXP_LOOT_裂开的蹄子|r
>>|cRXP_WARN_小心！火盆由两名30级的|r|cRXP_ENEMY_加拉克烈焰守卫守护|r
.complete 1197,1 
.mob Galak Flame Guard
.group 2
step
#completewith next
.goto Thousand Needles,38.46,32.60,0
.goto Thousand Needles,38.46,32.60,50,0
.line Thousand Needles,39.51,33.43,39.34,32.31,38.81,31.73,37.34,29.29,36.57,29.47,35.84,28.59,35.19,28.11,34.25,29.49,33.89,29.77,33.81,30.12,33.27,30.86,32.73,30.68,32.29,30.52,31.55,30.61,30.69,32.43,29.51,33.89,29.24,33.96,28.64,33.43,28.24,33.37,27.34,34.02,25.29,34.23,24.56,32.76,22.05,30.61,20.83,28.26,20.45,27.87,19.96,27.67,19.46,27.04,18.98,26.71,18.63,26.19,18.70,24.42,18.47,23.06,18.72,22.53,18.32,22.10,19.14,22.81,19.06,23.80,18.60,25.14
>>击杀|cRXP_ENEMY_加拉克信使|r. 击败后搜刮其尸体, 获得 |T133473:0|t[|cRXP_LOOT_暗杀指令|r], 使用该物品开启任务
>>|cRXP_WARN_他出现在斯普利霍夫峭壁(东部半人马营地)|r
.collect 12564,1,4881 
.accept 4881 >>接任务: |cRXP_LOOT_暗杀计划|r
.use 12564
.unitscan Galak Messenger
step
#loop
.line Thousand Needles,43.12,36.86,41.18,34.83,40.42,34.45,39.00,32.56,39.68,34.93,39.76,35.82,39.32,36.93,40.43,37.96,41.04,39.03,41.12,41.34,42.33,40.54,42.84,39.09,44.15,40.72,44.98,41.03,45.66,43.81,47.23,41.98,48.57,43.53,49.39,41.24,48.14,40.43,47.11,40.29,45.89,40.32,44.43,38.36,,43.12,36.86
.goto Thousand Needles,43.12,36.86,50,0
.goto Thousand Needles,41.18,34.83,50,0
.goto Thousand Needles,40.42,34.45,50,0
.goto Thousand Needles,39.00,32.56,50,0
.goto Thousand Needles,39.68,34.93,50,0
.goto Thousand Needles,39.76,35.82,50,0
.goto Thousand Needles,39.32,36.93,50,0
.goto Thousand Needles,40.43,37.96,50,0
.goto Thousand Needles,41.04,39.03,50,0
.goto Thousand Needles,41.12,41.34,50,0
.goto Thousand Needles,42.33,40.54,50,0
.goto Thousand Needles,42.84,39.09,50,0
.goto Thousand Needles,44.15,40.72,50,0
.goto Thousand Needles,44.98,41.03,50,0
.goto Thousand Needles,45.66,43.81,50,0
.goto Thousand Needles,47.23,41.98,50,0
.goto Thousand Needles,48.57,43.53,50,0
.goto Thousand Needles,49.39,41.24,50,0
.goto Thousand Needles,48.14,40.43,50,0
.goto Thousand Needles,47.11,40.29,50,0
.goto Thousand Needles,45.89,40.32,50,0
.goto Thousand Needles,44.43,38.36,50,0
.goto Thousand Needles,43.12,36.86,50,0
>>击杀|cRXP_ENEMY_加拉克斥候|r和|cRXP_ENEMY_加拉克争斗者|r和|cRXP_ENEMY_加拉克逐风者|r
.complete 4841,1 
.mob +Galak Scout
.complete 4841,2 
.mob +Galak Wrangler
.complete 4841,3 
.mob +Galak Windchaser
step
#completewith next
.goto Thousand Needles,54.57,44.36,12,0
.goto Thousand Needles,53.71,42.59,10,0
.goto Thousand Needles,53.95,41.49,10 >>前往|cRXP_FRIENDLY_Dorn|r
step
.goto Thousand Needles,53.95,41.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多恩|r交谈
.accept 1149 >>接任务: |cRXP_LOOT_信仰的试炼|r
.timer 7,Test of Faith RP
.target Dorn Plainstalker
step
.goto Thousand Needles,26.63,34.23
>>|cRXP_WARN_等待RP结束|r
>>|cRXP_WARN_从木制平台末端跳下, 你会被传送而非因坠落伤害而死亡|r
.complete 1149,1 
step
.goto Thousand Needles,53.95,41.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多恩|r交谈
.turnin 1149 >>交任务: |cRXP_FRIENDLY_信仰的试炼|r
.accept 1150 >>接任务: |cRXP_LOOT_耐力的试炼|r
.target Dorn Plainstalker
.group
step
.goto Thousand Needles,53.95,41.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多恩|r交谈
.turnin 1149 >>交任务: |cRXP_FRIENDLY_信仰的试炼|r
.target Dorn Plainstalker
step
#completewith next
.goto Thousand Needles,56.36,50.39,20,0
>>拾取地面上的|cRXP_LOOT_异型卵|r
.complete 4821,1 
step
#loop
.line Thousand Needles,51.89,43.02,53.41,46.19,54.05,44.96
.line Thousand Needles,53.47,46.65,52.61,48.28,53.64,48.50,52.61,48.28,51.48,48.06
.line Thousand Needles,62.21,47.76,63.05,48.92,62.63,48.38,62.96,47.64,64.01,47.52,63.92,46.63,63.10,45.53
.line Thousand Needles,65.83,51.44,65.87,51.01,65.44,50.11,64.91,50.30,65.44,50.11,66.11,49.91,66.32,49.13
.line Thousand Needles,59.79,58.16,59.53,58.57,58.87,58.69,57.66,57.70,58.87,58.69,58.93,57.68,58.94,56.55,58.97,54.98,59.32,53.69,59.79,58.16
.goto Thousand Needles,51.89,43.02,40,0
.goto Thousand Needles,53.41,46.19,40,0
.goto Thousand Needles,54.05,44.96,40,0
.goto Thousand Needles,53.47,46.65,40,0
.goto Thousand Needles,52.61,48.28,40,0
.goto Thousand Needles,53.64,48.50,40,0
.goto Thousand Needles,51.48,48.06,40,0
.goto Thousand Needles,59.69,47.76,40,0
.goto Thousand Needles,62.21,47.76,40,0
.goto Thousand Needles,62.63,48.38,40,0
.goto Thousand Needles,64.01,47.52,40,0
.goto Thousand Needles,63.92,46.63,40,0
.goto Thousand Needles,63.10,45.53,40,0
.goto Thousand Needles,65.83,51.44,40,0
.goto Thousand Needles,65.44,50.11,40,0
.goto Thousand Needles,64.91,50.30,40,0
.goto Thousand Needles,66.11,49.91,40,0
.goto Thousand Needles,66.32,49.13,40,0
.goto Thousand Needles,59.79,58.16,40,0
.goto Thousand Needles,58.87,58.69,40,0
.goto Thousand Needles,57.66,57.70,40,0
.goto Thousand Needles,58.93,57.68,40,0
.goto Thousand Needles,58.94,56.55,40,0
.goto Thousand Needles,58.97,54.98,40,0
.goto Thousand Needles,59.32,53.69,40,0
.goto Thousand Needles,59.79,58.16,40,0
.goto Thousand Needles,59.79,58.16,0
>>击杀|cRXP_ENEMY_砂齿勘探员|r和|cRXP_ENEMY_砂齿掘地工|r, 以及(如果出现)|cRXP_ENEMY_吉比斯尼克|r, 从他们身上搜刮一个|cRXP_LOOT_矿石样本|r
.complete 1153,1 
.unitscan Gravelsnout Digger;Gravelsnout Surveyor;Gibblesnik
step
#loop
.goto Thousand Needles,52.34,55.24,0
.goto Thousand Needles,37.63,56.11,0
.goto Thousand Needles,56.36,50.39,0
.goto Thousand Needles,52.34,55.24,20,0
.goto Thousand Needles,37.63,56.11,20,0
.goto Thousand Needles,56.36,50.39,20,0
>>拾取地面上的|cRXP_LOOT_异型卵|r
>>|cRXP_WARN_它有3个不同的刷新位置, 均已标记在地图上|r
.complete 4821,1 
step
#completewith next
.goto Thousand Needles,46.73,48.27,30 >>前往风语要塞的升降梯
step
.goto Thousand Needles,45.70,50.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Longhorn|r交谈
.turnin 4841 >>交任务: |cRXP_FRIENDLY_清除半人马|r
.accept 5064 >>接任务: |cRXP_LOOT_恐怖图腾的密信|r
.target Cliffwatcher Longhorn
step
.goto Thousand Needles,46.10,51.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|RXP_FRIENDLY_Rau|r交谈
.turnin 1197 >>交任务: |cRXP_FRIENDLY_神圣之火|r
.target Rau Cliffrunner
.group
.isQuestComplete 1197
step
.goto Thousand Needles,44.70,50.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈加尔|r交谈
.turnin 4821 >>交任务: |cRXP_FRIENDLY_异型卵|r
.accept 4865 >>接任务: |cRXP_LOOT_狂热之蛇|r
.target Hagar Lightninghoof
step << Hunter
.goto Thousand Needles,44.89,50.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯塔恩|r交谈
.vendor >>|cRXP_BUY_购买|r|T135495:0|t[|cRXP_FRIENDLY_笨重短弓|r]|cRXP_BUY_如果可用|r
.target Starn
.money <2.7172
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<14.2
step << Hunter
.goto Thousand Needles,44.89,50.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯塔恩|r交谈
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,1800,4767,1 
.target Starn
step
.goto Thousand Needles,45.15,50.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫塔尔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134937:0|t[卷轴]|cRXP_BUY_, 如果有的话|r << !Warrior
.vendor >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134937:0|t[卷轴]|cRXP_BUY_和|r|T134413:0|t[活根草]|cRXP_BUY_, 如果有的话|r << Warrior
.target Montarr
step
#label GrenkaCave
.goto Thousand Needles,27.59,49.86,12,0
.goto Thousand Needles,28.65,51.30,12,0
.goto Thousand Needles,27.29,51.30,12 >>进入掠羽巢
.group 3
.isOnQuest 1150
step
#completewith Grenka
+|cRXP_WARN_当|cRXP_ENEMY_尖啸的唤风者|r施放 |T136022:0|t[狂风之息]|cRXP_WARN_ 时, 请小心, 这将在距离其 10 码范围内的区域造成持续 4 秒的范围性眩晕|r
+|cRXP_ENEMY_尖啸女妖|r施放|r|T136122:0|t[震耳欲聋的尖啸]|cRXP_WARN_, 造成8秒沉默|r << Mage/Warlock/Priest/Druid/Shaman
.group
.isOnQuest 1150
step
#completewith next
.goto Thousand Needles,25.84,54.78
+打开洞穴后方地面上的|cRXP_PICK_鹰身人的粮食|r, 召唤|cRXP_ENEMY_格伦卡|r
>>|cRXP_WARN_请注意, 多群|cRXP_ENEMY_Harpies|r|cRXP_WARN_将会陆续出现|r
.group
.isOnQuest 1150
step
#label Grenka
.goto Thousand Needles,26.16,55.89,15,0
.goto Thousand Needles,26.69,55.62,15,0
.goto Thousand Needles,25.90,55.23
>>击杀|cRXP_ENEMY_格林卡·血啸|r. 击败她并搜刮|cRXP_LOOT_格林卡的利爪|r
.complete 1150,1 
.mob Grenka Bloodscreech
.group 3
.isOnQuest 1150
step
#completewith next
.line Thousand Needles,14.34,30.13,15.08,31.63,15.67,31.56,16.59,30.34,17.19,29.60,17.82,27.50,18.48,26.74,18.64,25.90,18.68,24.68,18.57,24.07,18.11,23.65,17.66,22.98,17.24,22.32,17.54,21.49,17.87,20.78,17.96,20.18,17.66,19.46,17.28,18.93,16.70,18.61,16.20,18.53,15.69,18.65,14.49,20.04,12.89,19.97,11.88,20.90,11.50,21.61,11.20,22.29,11.16,23.21,11.49,24.07,11.55,24.44,11.91,25.02,13.01,26.31,13.36,26.97,13.75,28.54,14.34,30.13
>>击杀|cRXP_ENEMY_Steelsnap|r. 击败他后搜刮|cRXP_LOOT_Steelsnap's Rib|r
>>|cRXP_WARN_小心, 有两只鬣狗在守护他！|r
.complete 1131,1 
.unitscan Steelsnap
step
#completewith next
.goto Thousand Needles,14.41,32.44,20,0
.goto Thousand Needles,14.04,32.37,12,0
.goto Thousand Needles,14.04,32.37,20 >>前往高栖崖
step
#completewith PaokaEscort
>>战利品|cRXP_LOOT_风巢双足飞龙的蛋|r在地面上
.complete 4767,1 
step
#completewith next
.goto Thousand Needles,13.18,39.55,15,0
.goto Thousand Needles,13.52,40.27,15,0
.goto Thousand Needles,14.01,40.27,15,0
.goto Thousand Needles,14.92,39.63,15,0
.goto Thousand Needles,16.46,41.09,25,0
.goto Thousand Needles,17.89,40.57,20 >>沿着小路跑上去, 朝帕卡(|cRXP_FRIENDLY_Pao'ka|r)前进
step
#label Paoka1
.goto Thousand Needles,17.89,40.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pao'ka|r交谈以开始护送任务
>>|cRXP_WARN_如果|cRXP_ENEMY_哈特拉斯|r |cRXP_WARN_出现, 请小心！这是一个32级稀有精英|r
.accept 4770,1 >>接任务: |cRXP_LOOT_回家|r
.target Pao'ka Swiftmountain
.unitscan Heartrazor
step
#label PaokaEscort
.goto Thousand Needles,11.06,34.95,40,0
.goto Thousand Needles,15.17,32.66
>>|cRXP_WARN_护送|r|cRXP_FRIENDLY_Pao'ka|r
>>|cRXP_WARN_当|cRXP_FRIENDLY_Pao'ka|r到达风巢中部时, 会召唤出三只风巢双足飞龙. 你只需拉怪东部的那只, 其余两只便会消失|r
.complete 4770,1 
.target Pao'ka Swiftmountain
step
#loop
.goto Thousand Needles,13.91,39.11,0
.goto Thousand Needles,11.31,33.07,50,0
.goto Thousand Needles,9.57,34.90,50,0
.goto Thousand Needles,10.68,40.95,50,0
.goto Thousand Needles,11.98,36.72,50,0
.goto Thousand Needles,13.91,39.11,50,0
>>完成搜刮地面上的|cRXP_LOOT_风巢双足飞龙的蛋|r
.complete 4767,1 
step
#completewith Messenger
.line Thousand Needles,14.34,30.13,15.08,31.63,15.67,31.56,16.59,30.34,17.19,29.60,17.82,27.50,18.48,26.74,18.64,25.90,18.68,24.68,18.57,24.07,18.11,23.65,17.66,22.98,17.24,22.32,17.54,21.49,17.87,20.78,17.96,20.18,17.66,19.46,17.28,18.93,16.70,18.61,16.20,18.53,15.69,18.65,14.49,20.04,12.89,19.97,11.88,20.90,11.50,21.61,11.20,22.29,11.16,23.21,11.49,24.07,11.55,24.44,11.91,25.02,13.01,26.31,13.36,26.97,13.75,28.54,14.34,30.13
>>击杀|cRXP_ENEMY_Steelsnap|r. 击败他后搜刮|cRXP_LOOT_Steelsnap's Rib|r
>>|cRXP_WARN_小心, 有两只鬣狗在守护他！|r
.complete 1131,1 
step
.goto Thousand Needles,21.06,31.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Laer Stepperunner
step
#optional
.goto Thousand Needles,21.25,32.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳提|r交谈
>>|cRXP_WARN_小心！提交此任务将召唤三名 |cRXP_ENEMY_加拉克刺客|r |cRXP_WARN_你必须保护 |cRXP_FRIENDLY_Kanati|r 免受他们的攻击|r
.turnin 4881 >>交任务: |cRXP_FRIENDLY_暗杀计划|r
.accept 4966 >>接任务: |cRXP_LOOT_保护卡纳提·灰云|r
.target Kanati Greycloud
.isOnQuest 4881
step
#optional
.goto Thousand Needles,21.25,32.05
>>击杀|r|cRXP_ENEMY_加拉克刺客|r以保护|r|cRXP_FRIENDLY_Kanati|r
.complete 4966,1 
.mob Galak Assassin
.isOnQuest 4966
step
#optional
.goto Thousand Needles,21.25,32.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳提|r交谈
.turnin 4966 >>交任务: |cRXP_FRIENDLY_保护卡纳提·灰云|r
.isQuestComplete 4966
step
.goto Thousand Needles,21.54,32.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Motega|r交谈
.turnin 4865 >>交任务: |cRXP_FRIENDLY_狂热之蛇|r
.accept 5062 >>接任务: |cRXP_LOOT_神圣之火|r
.turnin 4770 >>交任务: |cRXP_FRIENDLY_回家|r
.target Motega Firemane
step
.goto Thousand Needles,21.43,32.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Wizlo|r 交谈
.accept 5151 >>接任务: |cRXP_LOOT_超适应齿轮|r
.target Wizlo Bearingshiner
.group
step
.goto Thousand Needles,22.78,24.53
>>打开笼子, 击杀被激怒的黑豹. 从它身上搜刮超适应齿轮
.complete 5151,1 
.mob Enraged Panther
.group 2
step
#label Messenger
#loop
.line Thousand Needles,39.51,33.43,39.34,32.31,38.81,31.73,37.34,29.29,36.57,29.47,35.84,28.59,35.19,28.11,34.25,29.49,33.89,29.77,33.81,30.12,33.27,30.86,32.73,30.68,32.29,30.52,31.55,30.61,30.69,32.43,29.51,33.89,29.24,33.96,28.64,33.43,28.24,33.37,27.34,34.02,25.29,34.23,24.56,32.76,22.05,30.61,20.83,28.26,20.45,27.87,19.96,27.67,19.46,27.04,18.98,26.71,18.63,26.19,18.70,24.42,18.47,23.06,18.72,22.53,18.32,22.10,19.14,22.81,19.06,23.80,18.60,25.14
.goto Thousand Needles,38.46,32.60,0
.goto Thousand Needles,18.32,22.10,0
.goto Thousand Needles,18.32,22.10,40,0
.goto Thousand Needles,18.72,22.53,40,0
.goto Thousand Needles,18.47,23.06,40,0
.goto Thousand Needles,18.70,24.42,40,0
.goto Thousand Needles,18.63,26.19,40,0
.goto Thousand Needles,18.98,26.71,40,0
.goto Thousand Needles,19.46,27.04,40,0
.goto Thousand Needles,19.96,27.67,40,0
.goto Thousand Needles,20.45,27.87,40,0
.goto Thousand Needles,20.83,28.26,40,0
.goto Thousand Needles,22.05,30.61,40,0
.goto Thousand Needles,24.56,32.76,40,0
.goto Thousand Needles,25.29,34.23,40,0
.goto Thousand Needles,27.34,34.02,40,0
.goto Thousand Needles,28.24,33.37,40,0
.goto Thousand Needles,28.64,33.43,40,0
.goto Thousand Needles,29.24,33.96,40,0
.goto Thousand Needles,29.51,33.89,40,0
.goto Thousand Needles,30.69,32.43,40,0
.goto Thousand Needles,31.55,30.61,40,0
.goto Thousand Needles,32.29,30.52,40,0
.goto Thousand Needles,33.27,30.86,40,0
.goto Thousand Needles,33.81,30.12,40,0
.goto Thousand Needles,34.25,29.49,40,0
.goto Thousand Needles,35.19,28.11,40,0
.goto Thousand Needles,35.84,28.59,40,0
.goto Thousand Needles,36.57,29.47,40,0
.goto Thousand Needles,37.34,29.29,40,0
.goto Thousand Needles,38.81,31.73,40,0
.goto Thousand Needles,39.51,33.43,40,0
>>击杀|cRXP_ENEMY_加拉克信使|r. 击败后搜刮其尸体, 获得 |T133473:0|t[|cRXP_LOOT_暗杀指令|r], 使用该物品开启任务
>>|cRXP_WARN_他出现在斯普利霍夫峭壁(东部半人马营地)|r
>>|cRXP_WARN_为他侦察|r|T132172:0|t[鹰眼]|cRXP_WARN_如果你已训练过它|r << Hunter
>>|cRXP_WARN_为他侦察|r|T136034:0|t[远视]|cRXP_WARN_如果你已学会此技能|r << Shaman
.collect 12564,1,4881 
.accept 4881 >>接任务: |cRXP_LOOT_暗杀计划|r
.use 12564
.unitscan Galak Messenger
step
#loop
.line Thousand Needles,14.34,30.13,15.08,31.63,15.67,31.56,16.59,30.34,17.19,29.60,17.82,27.50,18.48,26.74,18.64,25.90,18.68,24.68,18.57,24.07,18.11,23.65,17.66,22.98,17.24,22.32,17.54,21.49,17.87,20.78,17.96,20.18,17.66,19.46,17.28,18.93,16.70,18.61,16.20,18.53,15.69,18.65,14.49,20.04,12.89,19.97,11.88,20.90,11.50,21.61,11.20,22.29,11.16,23.21,11.49,24.07,11.55,24.44,11.91,25.02,13.01,26.31,13.36,26.97,13.75,28.54,14.34,30.13
.goto Thousand Needles,11.50,21.61,40,0
.goto Thousand Needles,11.88,20.90,40,0
.goto Thousand Needles,12.89,19.97,40,0
.goto Thousand Needles,14.49,20.04,40,0
.goto Thousand Needles,15.69,18.65,40,0
.goto Thousand Needles,16.20,18.53,40,0
.goto Thousand Needles,16.70,18.61,40,0
.goto Thousand Needles,17.28,18.93,40,0
.goto Thousand Needles,17.66,19.46,40,0
.goto Thousand Needles,17.96,20.18,40,0
.goto Thousand Needles,17.87,20.78,40,0
.goto Thousand Needles,17.54,21.49,40,0
.goto Thousand Needles,17.24,22.32,40,0
.goto Thousand Needles,17.66,22.98,40,0
.goto Thousand Needles,18.11,23.65,40,0
.goto Thousand Needles,18.57,24.07,40,0
.goto Thousand Needles,18.68,24.68,40,0
.goto Thousand Needles,18.64,25.90,40,0
.goto Thousand Needles,18.48,26.74,40,0
.goto Thousand Needles,17.82,27.50,40,0
.goto Thousand Needles,17.19,29.60,40,0
.goto Thousand Needles,15.67,31.56,40,0
.goto Thousand Needles,15.08,31.63,40,0
.goto Thousand Needles,14.34,30.13,40,0
.goto Thousand Needles,13.75,28.54,40,0
.goto Thousand Needles,13.36,26.97,40,0
.goto Thousand Needles,13.01,26.31,40,0
.goto Thousand Needles,11.91,25.02,40,0
.goto Thousand Needles,11.55,24.44,40,0
.goto Thousand Needles,11.49,24.07,40,0
.goto Thousand Needles,11.16,23.21,40,0
.goto Thousand Needles,11.20,22.29,40,0
.goto Thousand Needles,11.50,21.61,0
>>击杀|cRXP_ENEMY_Steelsnap|r. 击败他后搜刮|cRXP_LOOT_Steelsnap's Rib|r
>>|cRXP_WARN_他沿逆时针方向巡逻|r
>>|cRXP_WARN_为他侦察|r|T132172:0|t[鹰眼]|cRXP_WARN_如果你已训练过它|r << Hunter
>>|cRXP_WARN_为他侦察|r|T136034:0|t[远视]|cRXP_WARN_如果你已学会此技能|r << Shaman
.complete 1131,1 
.unitscan Steelsnap
step
.goto Thousand Needles,21.25,32.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳提|r交谈
>>|cRXP_WARN_小心！提交此任务将召唤三名 |cRXP_ENEMY_加拉克刺客|r |cRXP_WARN_你必须保护 |cRXP_FRIENDLY_Kanati|r 免受他们的攻击|r
.turnin 4881 >>交任务: |cRXP_FRIENDLY_暗杀计划|r
.accept 4966 >>接任务: |cRXP_LOOT_保护卡纳提·灰云|r
.target Kanati Greycloud
.isOnQuest 4881
step
.goto Thousand Needles,21.25,32.05
>>击杀|r|cRXP_ENEMY_加拉克刺客|r以保护|r|cRXP_FRIENDLY_Kanati|r
.complete 4966,1 
.mob Galak Assassin
.isOnQuest 4966
step
.goto Thousand Needles,21.25,32.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳提|r交谈
.turnin 4966 >>交任务: |cRXP_FRIENDLY_保护卡纳提·灰云|r
.isQuestComplete 4966
step
.goto Thousand Needles,21.43,32.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Wizlo|r 交谈
.turnin 5151 >>交任务: |cRXP_FRIENDLY_超适应齿轮|r
.target Wizlo Bearingshiner
.group
.isQuestComplete 5151
step
#loop
.goto Thousand Needles,36.58,38.77,0
.goto Thousand Needles,36.58,38.77,35,0
.goto Thousand Needles,37.77,38.17,35,0
.goto Thousand Needles,36.63,36.23,35,0
.goto Thousand Needles,34.96,33.22,35,0
.goto Thousand Needles,33.37,32.85,35,0
.goto Thousand Needles,33.67,34.09,35,0
.goto Thousand Needles,34.88,34.82,35,0
.goto Thousand Needles,35.62,36.20,35,0
.goto Thousand Needles,36.05,37.41,35,0
>>收集地面和水下的|cRXP_PICK_Incendia 火岩龙舌兰植物|r
>>|cRXP_ENEMY_滚烫的水元素|r和 |cRXP_ENEMY_沸腾的水元素|r对冰霜伤害免疫, 且对火焰伤害有极高抗性. 建议避开它们, 或使用奥术法术应对 << Mage
>>|cRXP_WARN_请注意, |r|cRXP_ENEMY_沸腾的水元素|r|cRXP_WARN_施放|r|T132156:0|t[蒸汽喷射]|cRXP_WARN_, 会使你的命中率降低30%, 持续10秒|r << Warrior/Rogue/Shaman/Druid
>>|cRXP_WARN_小心|r|cRXP_ENEMY_滚烫的水元素|r|cRXP_WARN_施法|r|T135807:0|t[斯卡尔德]|cRXP_WARN_, 立即造成150点火焰伤害并使你眩晕4秒|r
.complete 5062,1 
step
#completewith next
.hs >>炉石传送至雷霆崖
.use 6948
step
.goto Thunder Bluff,45.83,64.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Pala
step
.goto Thunder Bluff,61.53,80.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Melor|r交谈
.turnin 1131 >>交任务: |cRXP_FRIENDLY_钢齿土狼|r
.target Melor Stonehoof
step << Hunter
.goto Thunder Bluff,59.13,86.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 14319 >>训练你的职业法术
.target Urek Thunderhorn
.xp <28,1
.xp >30,1
step << Hunter
#optional
.goto Thunder Bluff,59.13,86.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 5384 >>训练你的职业法术
.target Urek Thunderhorn
.xp <30,1
step << Hunter
.goto Thunder Bluff,54.07,84.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hesuwa|r交谈
.train 24559 >>训练你的宠物法术
.target Hesuwa Thunderhorn
.xp <30,1
step << Warrior
.goto Thunder Bluff,57.59,85.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
.train 7887 >>训练你的职业法术
.target Ker Ragetotem
.xp <28,1
.xp >30,1
step << Warrior
#optional
.goto Thunder Bluff,57.27,87.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔姆交谈|cRXP_FRIENDLY_TORM|r
.train 7369 >>训练你的职业法术
.accept 1718 >>接任务: |cRXP_LOOT_岛民|r
.target Torm Ragetotem
.xp <30,1
step
.goto Thunder Bluff,69.88,30.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格萨|r交谈
.turnin 5062 >>交任务: |cRXP_FRIENDLY_神圣之火|r
.accept 5088 >>接任务: |cRXP_LOOT_阿利卡拉|r
.target Magatha Grimtotem
.group
step
.goto Thunder Bluff,69.88,30.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格萨|r交谈
.turnin 5062 >>交任务: |cRXP_FRIENDLY_神圣之火|r
.target Magatha Grimtotem
step << Druid
.goto Thunder Bluff,76.79,31.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯姆·蛮鬃|r交谈
.train 3029 >>训练你的职业法术
.target Kym Wildmane
.xp <28,1
.xp >30,1
step << Druid
#optional
.goto Thunder Bluff,76.79,31.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯姆·蛮鬃|r交谈
.train 783 >>训练你的职业法术
.target Kym Wildmane
.xp <30,1
step
.goto Thunder Bluff,36.01,59.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔德|r交谈
.accept 1102 >>接任务: |cRXP_WARN_奥尔德的报复|r
.target Auld Stonespire
.dungeon RFK
step << Priest
.goto Thunder Bluff,25.31,15.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈尔斯|r交谈
.train 8104 >>训练你的职业法术
.target Miles Welsh
.xp <28,1
.xp >30,1
step << Priest
#optional
.goto Thunder Bluff,25.31,15.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈尔斯|r交谈
.train 602 >>训练你的职业法术
.target Miles Welsh
.xp <30,1
step << Mage
.goto Thunder Bluff,22.74,14.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shymm|r交谈
.train 759 >>训练你的职业法术
.target Archmage Shymm
.xp <28,1
.xp >30,1
step << Mage
#optional
.goto Thunder Bluff,22.74,14.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shymm|r交谈
.train 8412 >>训练你的职业法术
.target Archmage Shymm
.xp <30,1
step << Mage
.goto Thunder Bluff,22.48,16.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Birgitte|r交谈
.train 3566 >>坐骑 |T135765:0|t[传送:雷霆崖]
.target Birgitte Cranston
.xp <30,1
step << Shaman
.goto Thunder Bluff,23.64,18.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 8053 >>训练你的职业法术
.target Tigor Skychaser
.xp <28,1
.xp >30,1
step << Shaman
#optional
.goto Thunder Bluff,23.64,18.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 556 >>训练你的职业法术
.target Tigor Skychaser
.xp <30,1
step
#completewith next
.skill firstaid,150 >>制作 |T133687:0|t[厚绒线绷带] 直到你的技能达到 150
.skill firstaid,<1,1
step
.goto Thunder Bluff,29.68,21.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Pand|r交谈
.train 7928 >>训练 |T133671:0|t[丝质绷带]
>>|cRXP_WARN_如果毛料不足无法达到150点技能, 可跳过此步骤|r
.target Pand Stonebinder
.skill firstaid,<1,1
step << Hunter
.goto Thunder Bluff,46.98,45.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库纳·雷角|r交谈
.vendor >>|cRXP_BUY_如果有的话, 从她那里购买 a|r|T135495:0|t[强韧的弯弓]|r
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.9
.target Kuna Thunderhorn
.money <1.9467
step << Hunter
.goto Thunder Bluff,46.98,45.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kuna交谈|r
>>|cRXP_BUY_从她那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,1800,1153,1 
.target Kuna Thunderhorn
step << Shaman/Warrior
.goto Thunder Bluff,54.06,57.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Delgo交谈|r
.vendor >>|cRXP_BUY_如果该物品已上线且你尚未拥有, 请从他那里购买|r|T132408:0|t[无情战斧]|r
>>|cRXP_BUY_或者您也可以购买一个|r|T135576:0|t[巨型战斧]
.money <3.0195
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<21.0
.target Delgo Ragetotem
step << Rogue
.goto Thunder Bluff,53.00,56.63
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_卡德|r|cRXP_BUY_交谈. 从他那里购买|r|T135275:0|t[骑士长剑]|r
.collect 2520,1,1153,1 
.money <2.5924
.target Kard Ragetotem
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.6
step << Rogue
#completewith TearMoons
+装备 |T135275:0|t[骑士长剑]
.use 2520
.itemcount 2520,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.6
step << Rogue
.goto Thunder Bluff,53.00,56.63
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kard|r|cRXP_BUY_交谈. 从他那里购买|r|T135651:0|t[钝刺] |cRXP_BUY_作为你的副手武器|r
.collect 2526,1,1153,1 
.money <2.0353
.target Kard Ragetotem
.itemStat 17,QUALITY,<7
.itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.5
step << Rogue
#completewith FreewindHome
+装备 |T135651:0|t[钝刺]
.use 2526
.itemcount 2526,1
.itemStat 17,QUALITY,<7
.itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.5
step
#completewith next
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Camp Taurajo >>飞往陶拉霍营地
.target Tal
.zoneskip The Barrens
step
.goto The Barrens,45.10,57.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tatternack|r交谈
.turnin 1153 >>交任务: |cRXP_FRIENDLY_新的矿石样本|r
.target Tatternack Steelforge
step
.goto The Barrens,50.48,78.72,100 >>前往尘泥沼泽
step
#optional
#label Hoofprints
.goto Dustwallow Marsh,29.71,47.65
>>点击地面上的|cRXP_PICK_蹄印|r
.accept 1268 >>接任务: |cRXP_LOOT_可疑的蹄印|r
.xp <30,1
step
#optional
#label Badge
.goto Dustwallow Marsh,29.83,48.24
>>点击木板上的|cRXP_PICK_塞拉摩卫兵徽章|r
.accept 1269 >>接任务: |cRXP_LOOT_帕瓦尔·雷瑟上尉|r
.xp <30,1
step
#optional
.goto Dustwallow Marsh,29.63,48.60
>>点击壁炉上方的|cRXP_PICK_黑色盾牌|r
.accept 1251 >>接任务: |cRXP_LOOT_黑色盾牌|r
.xp <30,1
step
#completewith PotsandScrolls
.goto Dustwallow Marsh,30.65,45.34,60,0
.goto Dustwallow Marsh,32.28,42.80,60,0
.goto Dustwallow Marsh,33.12,40.85,60,0
.goto Dustwallow Marsh,33.55,38.71,60,0
.goto Dustwallow Marsh,34.73,37.66,60,0
.goto Dustwallow Marsh,34.31,34.40,60,0
.goto Dustwallow Marsh,33.30,31.23,60,0
.goto Dustwallow Marsh,34.58,30.62,60,0
.goto Dustwallow Marsh,36.64,31.72,120 >>前往蕨墙村
>>|cRXP_WARN_小心！该区域有36-38级的怪物. 请沿路径前进以确保安全|r
step
#optional
.goto Dustwallow Marsh,36.41,31.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗格|r交谈
.turnin 1268 >>交任务: |cRXP_FRIENDLY_可疑的蹄印|r
.target Krog
.isOnQuest 1268
step
#optional
.goto Dustwallow Marsh,36.41,31.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗格|r交谈
.turnin 1269 >>交任务: |cRXP_FRIENDLY_帕瓦尔·雷瑟上尉|r
.target Krog
.isOnQuest 1269
step
#optional
.goto Dustwallow Marsh,36.41,31.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗格|r交谈
.turnin 1251 >>交任务: |cRXP_FRIENDLY_黑色盾牌|r
.accept 1321 >>接任务: |cRXP_LOOT_黑色盾牌|r
.target Krog
.isOnQuest 1251
step
#optional
.goto Dustwallow Marsh,36.41,31.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗格|r交谈
.accept 1321 >>接任务: |cRXP_LOOT_黑色盾牌|r
.target Krog
.isQuestTurnedIn 1251
step
#optional
.goto Dustwallow Marsh,36.50,30.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Do'gol|r交谈
.turnin 1321 >>交任务: |cRXP_FRIENDLY_黑色盾牌|r
.target Do'gol
.isQuestTurnedIn 1251
step << Warrior/Shaman
.goto Dustwallow Marsh,36.17,31.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_祖尔格|r|cRXP_BUY_交谈. 如果他有货, 可以向他购买|r|T135158:0|t[大棍子]|r
.collect 12251,1,4904,1 
.money <4.3117
.target Zulrg
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<25.6
step
#label PotsandScrolls
.goto Dustwallow Marsh,36.49,30.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Balai|r交谈
.vendor >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134937:0|t[卷轴]|cRXP_BUY_, 如果它们有售|r
.target Balai Lok'Wein
step
.goto Dustwallow Marsh,36.49,30.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Balai|r交谈
>>|cRXP_BUY_从她那里购买|r|T133735:0|t[急救手册]|r
.collect 16112,1,4904,1 >>手册：厚丝质绷带 (1)
.collect 16113,1,4904,1 >>手册：魔纹绷带 (1)
.collect 16084,1,4904,1 >>手册:中级急救教材 - 绷带缚体(1)
.target Balai Lok'Wein
.skill firstaid,<1,1
step
#completewith next
.goto Dustwallow Marsh,35.57,31.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙尔迪|r交谈
.fp Brackenwall >>获取蕨墙村飞行点
.fly Freewind >>飞往乱风岗
.target Shardi
.zoneskip Thousand Needles
step
.goto Thousand Needles,44.90,48.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾鲁|r交谈
.turnin 4767 >>交任务: |cRXP_FRIENDLY_驭风者|r
.target Elu
step << Hunter
.goto Thousand Needles,44.89,50.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯塔恩|r交谈
.vendor >>|cRXP_BUY_购买|r|T135495:0|t[|cRXP_FRIENDLY_笨重短弓|r]|cRXP_BUY_如果可用|r
.target Starn
.money <2.7172
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<14.2
step
.goto Thousand Needles,45.15,50.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫塔尔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134937:0|t[卷轴]|cRXP_BUY_, 如果有的话|r << !Warrior
.vendor >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134937:0|t[卷轴]|cRXP_BUY_和|r|T134413:0|t[活根草]|cRXP_BUY_, 如果有的话|r << Warrior
.target Montarr
step
#label FreewindHome
.goto Thousand Needles,46.07,51.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板埃比克瓦|r交谈
.home >>将你的炉石设置为乱风岗
.target Innkeeper Abeqwa
step
.goto Thousand Needles,53.95,41.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多恩|r交谈
.turnin 1150 >>交任务: |cRXP_FRIENDLY_耐力的试炼|r
.accept 1151 >>接任务: |cRXP_LOOT_力量的试炼|r
.target Dorn Plainstalker
.isQuestComplete 1150
.group
step
.goto Thousand Needles,53.95,41.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多恩|r交谈
.accept 1151 >>接任务: |cRXP_LOOT_力量的试炼|r
.target Dorn Plainstalker
.isQuestTurnedIn 1150
.group
step
#loop
.goto Thousand Needles,24.34,44.72,0
.goto Thousand Needles,36.10,55.02,100,0
.goto Thousand Needles,30.35,51.58,40,0
.goto Thousand Needles,24.34,44.72,60,0
.goto Thousand Needles,20.88,39.84,60,0
.goto Thousand Needles,17.33,36.72,60,0
.goto Thousand Needles,13.27,26.74,60,0
.goto Thousand Needles,9.98,21.71,60,0
>>找到并击杀|r|cRXP_ENEMY_Rok'Alim the Pounder|r. 击败他后搜刮其掉落的|r|cRXP_LOOT_Fragments|r碎片
>>|cRXP_WARN_他巡逻该区域西北部的大部分范围|r
.complete 1151,1 
.unitscan Rok'Alim the Pounder
.isOnQuest 1151
.group 2
step
.goto Thousand Needles,31.47,36.71,30 >>前往暗云峰
step
#completewith next
.goto Thousand Needles,33.08,35.33,20,0
.goto Thousand Needles,32.78,32.24,20,0
.goto Thousand Needles,32.03,31.36,20,0
.goto Thousand Needles,32.37,28.64,20,0
.goto Thousand Needles,32.60,27.51,20,0
.goto Thousand Needles,34.87,31.76,20,0
.goto Thousand Needles,34.15,35.77,20,0
.goto Thousand Needles,33.32,36.24,20 >>前往暗云峰顶
step
.goto Thousand Needles,31.79,32.58
>>打开高地顶部的|cRXP_PICK_文件箱|r, 从中获取|cRXP_LOOT_密信#1|r
.complete 5064,1 
step
.goto Thousand Needles,33.80,39.90
>>打开大帐篷内的|cRXP_PICK_文件箱|r, 从中获取|cRXP_LOOT_密信#1|r
.complete 5064,2 
step
.goto Thousand Needles,39.20,41.60
>>打开东部高原帐篷内的|cRXP_PICK_文件箱|r, 搜刮出|cRXP_LOOT_密信#1|r
.complete 5064,3 
step
#completewith next
.goto Thousand Needles,35.68,39.25,20,0
.goto Thousand Needles,34.32,35.74,20,0
.goto Thousand Needles,35.56,30.94,20,0
.goto Thousand Needles,36.97,31.97,20 >>前往东北高原上的篝火方向前进
.group
step
>>清除|r敌对势力:格里姆图腾|r, 然后点燃篝火
>>击杀|cRXP_ENEMY_阿利卡拉|r. 搜刮她的|cRXP_LOOT_皮肤|r
.goto Thousand Needles,38.00,35.30
.complete 5088,2 
.complete 5088,1 
.mob Arikara
.group 2
step
.goto Thousand Needles,38.00,26.80
>>击杀|cRXP_ENEMY_阿纳克·恐怖图腾|r. 击败他后搜刮他的|cRXP_LOOT_蹄子|r
.complete 5147,1 
.mob Arnak Grimtotem
step
.goto Thousand Needles,38.00,26.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lakota|r交谈
>>|cRXP_WARN_这将开始护送任务|r
.accept 4904,1 >>接任务: |cRXP_LOOT_终获解救|r
.target Lakota Windsong
step
.goto Thousand Needles,38.96,29.46,20,0
.goto Thousand Needles,37.56,31.43,20,0
.goto Thousand Needles,36.89,31.73,20,0
.goto Thousand Needles,35.64,31.01,20,0
.goto Thousand Needles,34.53,30.78,20,0
.goto Thousand Needles,33.19,28.54,20,0
.goto Thousand Needles,32.53,27.44,20,0
.goto Thousand Needles,32.28,28.67,20,0
.goto Thousand Needles,32.04,31.37,20,0
.goto Thousand Needles,32.86,32.62,20,0
.goto Thousand Needles,33.05,35.42,20,0
.goto Thousand Needles,31.06,36.89
>>护送|cRXP_FRIENDLY_Lakota|r到安全地点
>>|cRXP_WARN_两个|r|cRXP_ENEMY_枯骨图腾|r|cRXP_WARN_会在她每次到达新平台时出现. 如果身后有复活点, 请尽量领先她以清理平台|r
>>|cRXP_WARN_请注意, 这个任务难度很高. 如果感到困难, 可以转身逃跑并放弃护送任务|r
.complete 4904,1 
.target Lakota Windsong
step
.goto Thousand Needles,21.54,32.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Motega|r交谈
.turnin 5088 >>交任务: |cRXP_FRIENDLY_阿利卡拉|r
.target Motega Firemane
.isQuestComplete 5088
.group
step
#loop
.goto Thousand Needles,18.74,24.36,50,0
.goto Thousand Needles,20.11,21.98,50,0
.goto Thousand Needles,17.25,19.01,50,0
.goto Thousand Needles,16.72,22.61,50,0
.xp 29+44350 >>升级至44350/47400
.isQuestComplete 1151
step
#loop
.goto Thousand Needles,18.74,24.36,50,0
.goto Thousand Needles,20.11,21.98,50,0
.goto Thousand Needles,17.25,19.01,50,0
.goto Thousand Needles,16.72,22.61,50,0
.xp 30 >>刷到30级

step
.goto Thousand Needles,53.95,41.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多恩|r交谈
.turnin 1151 >>交任务: |cRXP_FRIENDLY_力量的试炼|r

.target Dorn Plainstalker
.isQuestComplete 1151
.group
step << skip
.goto Thousand Needles,53.95,41.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多恩|r交谈
.accept 1152 >>接任务: |cRXP_WARN_知识试炼|r
.target Dorn Plainstalker
.isQuestTurnedIn1151
.group

step
#completewith next
.goto Thousand Needles,70.58,62.69,200 >>前往: |cRXP_PICK_千针石林|r
step
.goto Thousand Needles,77.79,77.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kravel|r交谈
.accept 1110 >>接任务: |cRXP_LOOT_火箭车零件|r
.accept 1111 >>接任务: |cRXP_LOOT_码头管理员迪兹维格|r
.target Kravel Koalbeard
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹尔|r和|cRXP_FRIENDLY_威兹尔|r交谈
.accept 1104 >>接任务: |cRXP_LOOT_含盐的蝎毒|r
.target +Fizzle Brassbolts
.goto Thousand Needles,78.07,77.13
.accept 1105 >>接任务: |cRXP_LOOT_硬化龟壳|r
.target +Wizzle Brassbolts
.goto Thousand Needles,78.14,77.12
step
.goto Thousand Needles,80.17,75.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普兹克|r交谈
.accept 1176 >>接任务: |cRXP_LOOT_减轻负重|r
.target Pozzik
step
.goto Thousand Needles,81.63,77.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zherin|r交谈
.accept 1175 >>接任务: |cRXP_LOOT_安全隐患|r
.target Trackmaster Zherin
step
#completewith TraveltoFWP
.goto Thousand Needles,75.44,97.37,40,0
.goto Tanaris,51.60,25.44,100 >>前往: |cRXP_PICK_塔纳利斯|r
.cooldown item,6948,<0
step
.goto Tanaris,51.60,25.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fp Gadgetzan >>获取加基森的飞行路线
.fly Freewind >>飞往乱风岗
.target Bulkrek Ragefist
.cooldown item,6948,<0
step << skip
.goto Tanaris,51.60,25.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fp Gadgetzan >>获取加基森的飞行路线
.target Bulkrek Ragefist
.cooldown item,6948,>0,1
step
#label TraveltoFWP
.hs >>炉石传送至乱风岗
.use 6948
.cooldown item,6948,>0,1
step
.goto Thousand Needles,45.70,50.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Longhorn|r交谈
.turnin 5064 >>交任务: |cRXP_FRIENDLY_恐怖图腾的密信|r
.turnin 5147 >>交任务: |cRXP_FRIENDLY_通缉：阿纳克·恐怖图腾|r
.target Cliffwatcher Longhorn
step
.goto Thousand Needles,46.00,51.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thalia|r交谈
.turnin 4904 >>交任务: |cRXP_FRIENDLY_终获解救|r
.target Thalia Amberhide
.isQuestComplete 4904
step
.goto Thousand Needles,45.15,50.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫塔尔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134937:0|t[卷轴]|cRXP_BUY_, 如果有的话|r << !Warrior
.vendor >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134937:0|t[卷轴]|cRXP_BUY_和|r|T134413:0|t[活根草]|cRXP_BUY_, 如果有的话|r << Warrior
.target Montarr
step << Hunter
.goto Thousand Needles,44.89,50.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯塔恩|r交谈
.vendor >>|cRXP_BUY_购买|r|T135495:0|t[|cRXP_FRIENDLY_笨重的短弓|r]|cRXP_BUY_, 如果它可用, 请从他那里购买并用箭矢填满你的箭袋|r
.collect 3030,1800,4767,1 
.target Starn
.money <2.7172
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<14.2
step << Hunter
.goto Thousand Needles,44.89,50.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯塔恩|r交谈
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,1800,4767,1 
.target Starn
step
.goto Thousand Needles,45.14,49.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈瑟|r交谈
.fly Crossroads >>飞往十字路口
.target Nyse
.zoneskip The Barrens
step
.goto The Barrens,51.10,29.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科兰|r交谈
.accept 1145 >>接任务: |cRXP_LOOT_疯狂的虫群|r
.target Korran
step << !Warrior
#completewith WharfDizzy
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.fly Ratchet >>飞往棘齿城
.target Devrak
step << Warrior
#completewith WharfDizzy
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.fly Ratchet >>飞往棘齿城
.target Devrak
.isOnQuest 1718
step << Warrior
#completewith IslanderPickUp
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.target Devrak
.zoneskip Orgrimmar
step << Warrior
#completewith next
.goto Orgrimmar,75.00,34.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔戈洛姆|r交谈
.turnin 1145 >>交任务: |cRXP_FRIENDLY_疯狂的虫群|r
.accept 1146 >>接任务: |cRXP_LOOT_疯狂的虫群|r
.target Belgrom Rockmaul
step << Warrior
#label IslanderPickUp
.goto Orgrimmar,80.37,32.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索瑞克|r交谈
.accept 1718 >>接任务: |cRXP_LOOT_岛民|r
.target Sorek
step << Warrior
#completewith WharfDizzy
.goto Orgrimmar,45.12,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Ratchet >>飞往棘齿城
.target Doras
.zoneskip Orgrimmar,1
step
#label WharfDizzy
.goto The Barrens,63.35,38.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dizzywig|r交谈
.turnin 1111 >>交任务: |cRXP_FRIENDLY_码头管理员迪兹维格|r
.accept 1112 >>接任务: |cRXP_LOOT_给克拉维尔的零件|r
.target Wharfmaster Dizzywig
step << Shaman
.goto The Barrens,65.83,43.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水之先知伊斯伦|r交谈
.turnin 220 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.accept 63 >>接任务: |cRXP_LOOT_水之召唤|r
.target Islen Waterseer
step << Shaman
.goto The Barrens,65.83,43.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水之先知伊斯伦|r交谈
>>|cRXP_WARN_确保你获得|r|T134754:0|t[|cRXP_LOOT_水之灵契|r
.turnin 972 >>交任务: |cRXP_FRIENDLY_水之灵契|r
.collect 6637,1 
step << Warrior
#completewith next
.goto The Barrens,65.09,47.81,90,0
.goto The Barrens,68.61,49.16,100 >>前往弗雷岛
step << Warrior
.goto The Barrens,68.62,49.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克兰诺克|r交谈
.turnin 1718 >>交任务: |cRXP_FRIENDLY_岛民|r
.accept 1719 >>接任务: |cRXP_LOOT_格斗考验|r
.target Klannoc Macleod
step << Warrior
>>踏上你身后的铁栅栏. 迅速击杀陆续出现的|cRXP_ENEMY_挑衅者|r
>>一旦比格维尔出现, 击杀他一次
.goto The Barrens,68.59,48.76
.complete 1719,1 
.complete 1719,2 
.mob Big Will
step << Warrior
.goto The Barrens,68.62,49.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克兰诺克|r交谈
>>|cRXP_WARN_这将教你狂战士姿态|r
.turnin 1719 >>交任务: |cRXP_FRIENDLY_格斗考验|r
.accept 1791 >>接任务: |cRXP_LOOT_捕风者|r
.target Klannoc Macleod
step << Warrior
.goto The Barrens,62.81,37.91,200 >>返回棘齿城

step << !Mage
.goto The Barrens,63.09,37.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.target Bragok
.zoneskip Orgrimmar
step << Mage
.cast 3567 >>施放 |T135759:0|t[传送:奥格瑞玛]
.zoneskip Orgrimmar
step << Mage
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 8412 >>训练你的职业法术
.target Pephredo
.xp <30,1
.xp >32,1
step << Mage
#optional
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 8422 >>训练你的职业法术
.target Pephredo
.xp <32,1
step << Mage
.goto Orgrimmar,45.43,56.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_霍苏斯|r|cRXP_BUY_交谈. 从他那里购买两个或更多的|r|T134419:0|t[传送符文]|r
.collect 17031,2 
.target Horthus
step << Rogue
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 1760 >>训练你的职业法术
.target Ormok
.xp <30,1
.xp >32,1
step << Rogue
#optional
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 8623 >>训练你的职业法术
.target Ormok
.xp <32,1
step << Shaman
.goto Orgrimmar,37.95,37.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔恩·火结|r交谈
.trainer >>训练你的职业法术
.accept 1531 >>接任务: |cRXP_LOOT_空气的召唤|r
.target Searn Firewarder
step
.goto Orgrimmar,44.70,52.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Craven|r交谈
>>|cRXP_WARN_他在暗影裂口中巡逻|r
.accept 1431 >>接任务: |cRXP_LOOT_联盟关系|r
.target Craven Drok
step << Warlock
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 2941 >>训练你的职业法术
.target Mirket
.xp <30,1
.xp >32,1
step << Warlock
#optional
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 6213 >>训练你的职业法术
.target Mirket
.xp <32,1
step << Warlock
.goto Orgrimmar,47.52,46.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈
.vendor >>购买任何你负担得起的宠物升级道具
.target Kurgul

step << Priest/Warlock
.goto Orgrimmar,44.16,48.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_卡提斯|r|cRXP_BUY_交谈. 从她那里购买|r|T135466:0|t[致命魔杖]|r
.collect 5347,1,6544,1 
.money <1.5713
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<26.9
.target Katis
step
.goto Orgrimmar,75.00,34.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔戈洛姆|r交谈
.turnin 1145 >>交任务: |cRXP_FRIENDLY_疯狂的虫群|r
.accept 1146 >>接任务: |cRXP_LOOT_疯狂的虫群|r
.target Belgrom Rockmaul
step << Warrior
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 7369 >>训练你的职业法术
.target Grezz Ragefist
.xp <30,1
.xp >32,1
step << Warrior
#optional
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 20658 >>训练你的职业法术
.target Grezz Ragefist
.xp <32,1
step << Hunter
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
>>|cRXP_WARN_至少保留1金88银, 以备后用|r
.train 5384 >>训练你的职业法术
.target Ormak Grimshot
.xp <30,1
.xp >32,1
step << Hunter
#optional
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
>>|cRXP_WARN_至少保留1金88银, 以备后用|r
.train 14263 >>训练你的职业法术
.target Ormak Grimshot
.xp <32,1
step << Hunter
.goto Orgrimmar,66.34,14.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xao'tsu|r交谈
.train 24559 >>训练你的宠物法术
.target Xao'tsu
.xp <30,1
step << Hunter
.goto Orgrimmar,78.11,38.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Jin'sora交谈|r
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,1800,549,1 << Hunter 
.target Jin'sora
step << Hunter
.goto Orgrimmar,81.52,19.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
.train 197 >>训练双手斧
.target Hanashi
step << Priest
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 602 >>训练你的职业法术
.target Ur'kyo
.xp <30,1
.xp >32,1
step << Priest
#optional
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 6077 >>训练你的职业法术
.target Ur'kyo
.xp <32,1
step
.goto Orgrimmar,22.50,52.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与奥格瑞玛西部出口附近的|r科尔丹|r交谈
.turnin 1431 >>交任务: |cRXP_FRIENDLY_联盟关系|r
.accept 1432 >>接任务: |cRXP_LOOT_联盟关系|r
.target Keldran
step
#sticky
#completewith EnterRFK
.subzone 491,2 >>现在你应该寻找一支前往剃刀沼泽的队伍
.dungeon RFK
step
#optional
.abandon 5151 >>放弃超适应齿轮
.isOnQuest 5151
step
#optional
.abandon 5088 >>放弃阿利卡拉
.isOnQuest 5088
step
#optional
.abandon 1150 >>放弃耐力的试炼
.isOnQuest 1150
step
#optional
.abandon 1151 >>放弃力量的试炼
.isOnQuest 1151
step << Mage
#completewith GoingGoing
.cast 3563 >>传送 |T135766:0|t[传送:幽暗城]
.zoneskip Undercity
.dungeon RFK
step << !Mage
#completewith GoingGoing
.zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
.zoneskip Durotar
.dungeon RFK
step << !Mage
#completewith GoingGoing
.goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
.zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
.zoneskip Tirisfal Glades
.dungeon RFK
step
#completewith next
.goto Undercity,47.20,59.69,0
.goto Undercity,47.20,59.69,12,0
.goto Undercity,43.55,68.11,12,0
.goto Undercity,45.20,71.67,12 >>前往|cRXP_FRIENDLY_Faranell|r
.dungeon RFK
step
#label GoingGoing
.goto Undercity,48.80,69.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔|r交谈
.accept 1109 >>接任务: |cRXP_WARN_蝙蝠的粪便|r
.target Master Apothecary Faranell
.dungeon RFK
.xp <30,1
step
.goto Tirisfal Glades,60.96,58.63,12,0
.goto Tirisfal Glades,61.51,59.01,10,0
.goto Tirisfal Glades,61.27,59.22,8,0
.goto Tirisfal Glades,61.13,58.84,8,0
.goto Tirisfal Glades,61.38,58.71,8,0
.goto Tirisfal Glades,61.34,59.17,8,0
.goto Tirisfal Glades,60.51,58.69,-1
.goto Tirisfal Glades,60.94,46.35,-1
>>登上齐柏林飞艇塔
.zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
.zoneskip Orgrimmar
.dungeon RFK
step
.goto Orgrimmar,45.12,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Camp Taurajo >>飞行营地陶拉霍
.target Doras
.zoneskip The Barrens
.dungeon RFK
step
#label EnterRFK
.goto The Barrens,43.46,90.18,0
.goto The Barrens,43.46,90.18,40,0
.goto 1414,50.89,70.35
.subzone 491,2 >>进入剃刀沼泽(Razorfen Kraul)
.dungeon RFK
step
>>击杀|cRXP_ENEMY_沼泽蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_沼泽蝙蝠的粪便|r
.complete 1109,1 
.mob Kraul Bat
.mob Greater Kraul Bat
.dungeon RFK
.isOnQuest 1109
step
>>击杀|cRXP_ENEMY_卡尔加·刺肋|r. 搜刮她的|cRXP_LOOT_心脏|r和|T134939:0 |t[|cRXP_LOOT_小卷轴|r]. 使用小卷轴开启任务
.complete 1102,1 
.collect 17008,1,6522 
.accept 6522 >>接任务: |cRXP_WARN_邪恶的盟友|r
.mob Charlga Razorflank
.use 17008
.dungeon RFK
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_进口商威利克斯|r交谈
>>|cRXP_WARN_这将开始护送任务|r
.accept 1144 >>接任务: |cRXP_WARN_进口商威利克斯|r
.target Willix the Importer
.dungeon RFK
step
>>护送|cRXP_FRIENDLY_进口商威利克斯|r穿过剃刀沼泽
>>|cRXP_WARN_请确保你靠近|cRXP_FRIENDLY_Willix|r, 否则任务可能无法完成！|r
.complete 1144,1 
.isOnQuest 1144
.target Willix the Importer
.dungeon RFK
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_进口商威利克斯|r交谈
.turnin 1144 >>交任务: |cRXP_FRIENDLY_进口商威利克斯|r
.target Willix the Importer
.isQuestComplete 1144
.dungeon RFK
step
>>|cRXP_WARN_进入副本后, 第一时间向左转. 到达尽头的藤蔓处时, 跳到下方你看到|cRXP_ENEMY_Agam'ars|r的位置|r
>>|cRXP_WARN_与你的队伍一起击杀下方的|cRXP_ENEMY_Agam'ars|r, 以清理出一片安全区域|r
>>|cRXP_WARN_使用|r|T132765:0|t[开孔的箱子] |cRXP_WARN_在此位置召唤一只 |cRXP_FRIENDLY_鼻鼠地鼠|r. 找到正确的召唤位置可能比较棘手|r
>>|cRXP_WARN_使用|r|T135474:0|t[地鼠指挥棒] |cRXP_WARN_来指挥 |cRXP_FRIENDLY_地鼠|r挖出|r|cRXP_LOOT_蓝叶薯|r
>>|cRXP_WARN_一旦挖出蓝叶薯, 就将其拾取|r
>>|cRXP_WARN_继续使用|r|T135474:0|t[地鼠指挥棒] |cRXP_WARN_再次点击, 让它挖出另一个. 重复此过程, 直到你获得6|r|cRXP_LOOT_蓝叶薯|r
>>|cRXP_WARN_如果您的|cRXP_FRIENDLY_Gopher|r消失了, 请使用|r |T132765:0|t[开孔的箱子]|cRXP_WARN_召唤一只新的. 注意它只有 5 次充能次数|r
.complete 1221,1 
.use 5880 
.use 6684 
.target Snufflenose Gopher
.isOnQuest 1221
.dungeon RFK
step << !Mage
#completewith RFKFinish
.hs >>炉石传送至乱风岗
.use 6948
.dungeon RFK
step << !Mage
.goto Thousand Needles,45.14,49.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈瑟|r交谈
.fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
.target Nyse
.zoneskip Thunder Bluff
.isQuestComplete 1102
.dungeon RFK
step << Mage
.cast 3566 >>施放 |T135765:0|t[传送:雷霆崖]
.zoneskip Thunder Bluff
.isQuestComplete 1102
.dungeon RFK
step
.goto Thunder Bluff,36.01,59.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔德|r交谈
.turnin 1102 >>交任务: |cRXP_FRIENDLY_奥尔德的报复|r
.target Auld Stonespire
.isQuestComplete 1102
.dungeon RFK
step
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Orgrimmar >>飞往奥格瑞玛
.target Tal
.zoneskip Thunder Bluff,1
.dungeon GNOMER
step << !Mage
.goto Thousand Needles,45.14,49.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈瑟|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.target Nyse
.zoneskip Thousand Needles,1
.isQuestComplete 1102
.dungeon RFK
step
#optional
#label RFKFinish
step
#sticky
#completewith EnterGNOMER
.zone 721,2 >>现在你应该寻找一支前往诺莫瑞根的队伍
.dungeon GNOMER
step
.goto Orgrimmar,76.00,25.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺格|r交谈
.accept 2841 >>接任务: |cRXP_WARN_设备之战|r
.target Nogg
.dungeon GNOMER
step
.goto Orgrimmar,75.50,25.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索维克|r交谈
>>与他对话以接受任务
.accept 2842 >>接任务: |cRXP_WARN_主工程师斯库提|r
.target Sovik
.dungeon GNOMER
step
.goto Orgrimmar,45.13,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Ratchet >>飞往棘齿城
.target Doras
.zoneskip Orgrimmar,1
.dungeon GNOMER
step
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Ratchet >>飞往棘齿城
.target Tal
.zoneskip Thunder Bluff,1
.dungeon RFK
step
.goto The Barrens,62.370,37.615
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mebok|r交谈
.turnin 1221 >>交任务: |cRXP_FRIENDLY_蓝叶薯|r
.target Mebok Mizzyrix
.isQuestComplete 1221
.dungeon RFK
step
#completewith next
.goto The Barrens,63.74,38.66
.zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
.zoneskip Stranglethorn Vale
.dungeon GNOMER
step
.goto Stranglethorn Vale,27.60,77.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯库提|r交谈
.turnin 2842 >>交任务: |cRXP_FRIENDLY_主工程师斯库提|r
.accept 2843 >>接任务: |cRXP_WARN_出发！诺莫瑞根！|r
.target Scooty
.timer 9 >>地精传送器
.dungeon GNOMER
step
.goto Stranglethorn Vale,27.60,77.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯库提|r交谈
.turnin 2843 >>交任务: |cRXP_FRIENDLY_出发！诺莫瑞根！|r
.target Scooty
.dungeon GNOMER
step
.goto Stranglethorn Vale,27.63,77.55
.goto Eastern Kingdoms,42.75,59.93,30 >>踏上诺莫瑞根应答器
.dungeon GNOMER
step
#label EnterGNOMER
.goto Eastern Kingdoms,42.64,59.80,20,0
.goto Eastern Kingdoms,42.58,59.82,20,0
.goto Eastern Kingdoms,42.56,59.87,20,0
.goto Eastern Kingdoms,42.51,60.15,20,0
.goto Eastern Kingdoms,42.34,60.18
.zone 721,2 >>进入诺莫瑞根
.dungeon GNOMER
step
>>击杀|cRXP_ENEMY_麦克尼尔·瑟玛普拉格|r. 击败他后搜刮出他的|cRXP_LOOT_保险箱密码|r
>>在房间北侧的|cRXP_PICK_瑟玛普拉格的保险箱|r中获取|cRXP_LOOT_钻探设备蓝图|r
.complete 2841,2 
.complete 2841,1 
.mob Mekgineer Thermaplugg
.dungeon GNOMER
step << !Mage
#completewith next
.hs >>炉石传送至乱风岗
.use 6948
.dungeon GNOMER
step << !Mage
.goto Thousand Needles,45.14,49.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈瑟|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.target Nyse
.zoneskip Orgrimmar
.dungeon GNOMER
step << !Mage
#optional
.goto The Barrens,63.09,37.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.target Bragok
.zoneskip 392,1
step << Mage
.cast 3567 >>施放 |T135759:0|t[传送:奥格瑞玛]
.zoneskip Orgrimmar
step
.goto Orgrimmar,76.00,25.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺格|r交谈
.turnin 2841 >>交任务: |cRXP_FRIENDLY_设备之战|r
.target Nogg
.dungeon GNOMER
.isQuestComplete 2841
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 31-34 希尔斯布莱德/阿拉希高地
#displayname 31-34 希尔斯布莱德/阿拉希高地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 30-40
#next 34-35 闪光平原
step << Mage
#completewith next
.cast 3563 >>传送 |T135766:0|t[传送:幽暗城]
step << Mage
.goto Undercity,82.79,15.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉娜·阿克雷|r交谈
.vendor >>|cRXP_BUY_至少购买两个|r|T134419:0|t[传送符文]
.collect 17031,2 
.target Hannah Akeley
step << !Mage
#completewith next
.zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
.zoneskip Durotar
step << !Mage
.goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
.zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
.zoneskip Tirisfal Glades
step
#completewith StealfromThievesPickup
.goto Tirisfal Glades,61.80,65.06,20,0
.zone Undercity >>前往: |cRXP_PICK_幽暗城|r
.zoneskip Undercity
step
#completewith StealfromThievesPickup
.goto Undercity,66.09,20.06,20,0
.goto Undercity,64.37,23.94,20,0
.goto Undercity,65.93,26.71,10,0
.goto Undercity,65.89,34.03,10,0
.goto Undercity,64.22,39.77,10,0
.goto Undercity,65.53,43.62,15 >>乘坐升降梯前往幽暗城
step << Hunter
.goto Undercity,57.31,32.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基巴德|r交谈
.train 5011 >>训练弩箭
.train 202 >>学习双手剑技能
.target Archibald
step << Hunter
.goto Undercity,58.82,32.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Benijah|r|cRXP_BUY_交谈. 从他那里购买|r|T134402:0|t[重型箭袋] |cRXP_BUY_和|r|T135532:0|t[重弩] |cRXP_BUY_, 并将箭装满你的箭袋|r
.collect 15809,1,552,1 
.collect 7371,1,552,1 
.collect 3030,2600,552,1 << Hunter 
.money <1.6691
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.0
.target Benijah Fenner
step << Hunter
.goto Undercity,58.82,32.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Benijah|r|cRXP_BUY_交谈. 从他那里购买|r|T134402:0|t[重型箭袋]|cRXP_BUY_, 并将你的箭袋装满箭|r
.collect 7371,1,552,1 
.target Benijah Fenner
step << Rogue
.goto Undercity,58.65,33.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Geoffrey|r|cRXP_BUY_交谈. 从他那里购买|r|T135275:0|t[骑士长剑]|r
.collect 2520,1,552,1 
.money <2.2165
.target Geoffrey Hartwell
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.6
step << Rogue
#completewith StealfromThievesPickup
+装备 |T135275:0|t[骑士长剑]
.use 2520
.itemcount 2520,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.6
step << Rogue
.goto Undercity,58.65,33.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Geoffrey|r|cRXP_BUY_交谈. 从他那里购买|r|T135651:0|t[钝刺]|cRXP_BUY_作为你的副手武器|r
.collect 2526,1,552,1 
.money <1.7402
.target Geoffrey Hartwell
.itemStat 17,QUALITY,<7
.itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.5
step << Rogue
#completewith StealfromThievesPickup
+装备 |T135651:0|t[钝刺]
.use 2526
.itemcount 2526,1
.itemStat 17,QUALITY,<7
.itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.5
step
#completewith next
.goto Undercity,47.20,59.69,0
.goto Undercity,47.20,59.69,12,0
.goto Undercity,43.55,68.11,12,0
.goto Undercity,45.20,71.67,12 >>前往|cRXP_FRIENDLY_Faranell|r
.isQuestComplete 1109
.dungeon RFK
step
.goto Undercity,48.80,69.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔|r交谈
.turnin 1109 >>交任务: |cRXP_FRIENDLY_蝙蝠的粪便|r
.target Master Apothecary Faranell
.isQuestComplete 1109
.dungeon RFK
step
#completewith next
.goto Undercity,51.92,64.68,15 >>前往|cRXP_FRIENDLY_瓦里玛萨斯|r方向前进
.isOnQuest 6522
.dungeon RFK
step
.goto Undercity,56.24,92.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
.turnin 6522 >>交任务: |cRXP_FRIENDLY_邪恶的盟友|r
.target Varimathras
.isOnQuest 6522
.dungeon RFK
step
#ah
.goto Undercity,64.20,49.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
.collect 3712,10 >>|cRXP_BUY_从拍卖行购买十|r|T134026:0|t[海龟肉]|r
.target Auctioneer Rhyker
.isQuestAvailable 7321
step
#label StealfromThievesPickup
.goto Undercity,64.20,49.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉纳维|r交谈
.accept 1164 >>接任务: |cRXP_LOOT_科娜塔一家|r
.target Genavie Callow
step
.goto Undercity,62.14,44.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤奈斯·伯奇|r交谈
.train 2550 >>为后续任务练习烹饪
.target Eunice Burch
step
.goto Undercity,62.30,43.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_罗纳德|r交谈. |cRXP_BUY_购买|r|T134059:0|t[舒心草]|cRXP_BUY_从他那里|r
.collect 3713,1 
.target Ronald Burch
.isQuestAvailable 7321
step
.goto Undercity,65.99,44.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉|r交谈
.bankwithdraw 3692 >>从你的银行取出 |T133730:0|t[|cRXP_LOOT_希尔斯布莱德人类颅骨|r]
.target William Montague
step << !Shaman
#completewith AcceptAgony
.goto Undercity,63.27,48.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
.fly Tarren Mill >>飞往塔伦米尔
.target Michael Garrett
.zoneskip Hillsbrad Foothills
step << Shaman
#completewith next
.goto Undercity,63.27,48.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
.fly The Sepulcher >>飞往瑟伯切尔
.target Michael Garrett
.zoneskip Silverpine Forest
step << Shaman
.zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
>>|cRXP_WARN_点击以下链接打开网站的解卡页面. 在网站上选择您当前的角色, 但请勿点击其他任何内容|r
>>|cRXP_WARN_如果此步骤失败, 请跳过并正常返回|r
.link https://us.battle.net/support/en/help/product/wow/197/834/solution >>|cRXP_WARN_点击这里|r
.isOnQuest 63
step << Shaman
#completewith CallofWaterSVP
#label CallofWaterSVP1
.goto Silverpine Forest,42.05,40.62,10,0
.goto Silverpine Forest,41.83,41.16,8 >>跳上树干一侧
.isOnQuest 63
step << Shaman
#completewith CallofWaterSVP
#label CallofWaterSVP2
#requires CallofWaterSVP1
.goto Silverpine Forest,38.09,44.40,15 >>跑下山
.isOnQuest 63
step << Shaman
#completewith next
#requires CallofWaterSVP2
.goto Silverpine Forest,38.09,44.40
.aura 8899 >>喝下 |T134754:0|t[水之灵契], 以看到|cRXP_ENEMY_腐败的水之微现|r
.use 6637
.isOnQuest 63
step << Shaman
.goto Silverpine Forest,38.50,44.46
>>击杀|cRXP_ENEMY_Corrupt Minor Manifestation of Water|r, 拾取其掉落的|cRXP_LOOT_Corrupt Manifestation's Bracers|r
.complete 63,1 
.mob Corrupt Minor Manifestation of Water
.isOnQuest 63
step << Shaman
#label CallofWaterSVP
.goto Silverpine Forest,38.26,44.56
>>点击|cRXP_PICK_源源不断的火盆|r
.turnin 63 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.accept 100 >>接任务: |cRXP_LOOT_水之召唤|r
.timer 15,Call of Water RP
step << Shaman
.goto Silverpine Forest,38.75,44.63
>>|cRXP_WARN_等待RP结束|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水之魂|r交谈
.turnin 100 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.accept 96 >>接任务: |cRXP_LOOT_水之召唤|r
.target Minor Manifestation of Water
step << Shaman
#completewith next
.goto Silverpine Forest,45.62,42.59,100 >>|cRXP_WARN_如果你之前打开过网站上的“解困”页面, 现在可以退出游戏, 然后点击将角色传送至最近的墓地(陵墓)|r
>>|cRXP_WARN_如果此步骤失败或页面无法加载, 请跳过此步骤|r
.link https://us.battle.net/support/en/help/product/wow/197/834/solution >>|cRXP_WARN_点击这里|r
.zoneskip Silverpine Forest,1
step << Shaman
#completewith HammerPickip
.goto Silverpine Forest,45.62,42.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与卡拉斯交谈(|cRXP_FRIENDLY_Karos|r)
.fly Tarren Mill >>飞往塔伦米尔
.target Karos Razok
.zoneskip Hillsbrad Foothills
step
#optional
.abandon 1144 >>放弃进口商威利克斯
.isOnQuest 1144
.dungeon RFK
step
#optional
.abandon 1102 >>放弃奥尔德的报复
.isOnQuest 1102
.dungeon RFK
step
#optional
.abandon 1221 >>放弃蓝叶薯
.isOnQuest 1221
.dungeon RFK
step
#optional
.abandon 1109 >>放弃《去吧, 去吧, 蝙蝠粪！》
.isOnQuest 1109
.dungeon RFK
step
.goto Hillsbrad Foothills,61.44,19.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与莱登交谈|cRXP_FRIENDLY_Lydon|r
.accept 509 >>接任务: |cRXP_LOOT_苦楚药剂|r
.target Apothecary Lydon
step
#label HammerPickip
.goto Hillsbrad Foothills,61.86,19.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔隆|r交谈
.accept 676 >>接任务: |cRXP_LOOT_落锤之战|r
.target Tallow
step
.goto Hillsbrad Foothills,62.31,20.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达尔萨利亚(|cRXP_FRIENDLY_Darthalia|r)交谈
.accept 529 >>接任务: |cRXP_LOOT_希尔斯布莱德之战|r
.target High Executor Darthalia
.isQuestTurnedIn 528
step
.goto Hillsbrad Foothills,63.24,20.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁斯克|r交谈
.accept 533 >>接任务: |cRXP_LOOT_秘密潜入|r
.target Krusk
step
.goto Hillsbrad Foothills,63.88,19.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thaivand|r交谈
.accept 552 >>接任务: |cRXP_LOOT_赫尔库拉的复仇|r
.target Novice Thaivand
step << !Warrior
#loop
.goto Alterac Mountains,77.32,63.20,0
.goto Hillsbrad Foothills,68.42,17.01,50,0
.goto Hillsbrad Foothills,70.31,11.72,50,0
.goto Alterac Mountains,74.67,65.36,50,0
.goto Alterac Mountains,77.32,63.20,50,0
.goto Alterac Mountains,80.07,58.61,50,0
.goto Alterac Mountains,84.76,51.26,50,0
.goto Alterac Mountains,89.36,47.26,50,0
.goto Hillsbrad Foothills,68.21,19.09,50,0
.goto Hillsbrad Foothills,68.32,25.16,50,0
.goto Hillsbrad Foothills,67.66,31.88,50,0
.goto Hillsbrad Foothills,67.38,35.69,50,0
.goto Hillsbrad Foothills,63.76,40.24,50,0
.goto Hillsbrad Foothills,61.97,42.50,50,0
.goto Alterac Mountains,89.36,47.26,50,0
>>沿河上下航行. 击杀|cRXP_ENEMY_钳嘴龟|r. 击杀后搜刮出|T134026:0|t[|cRXP_LOOT_海龟肉|r]
.collect 3712,10 
.mob Snapjaw
.isQuestAvailable 7321
step << Warrior
#completewith next
>>沿河上下航行. 击杀|cRXP_ENEMY_钳嘴龟|r. 击杀后搜刮出|T134026:0|t[|cRXP_LOOT_海龟肉|r]
.collect 3712,10 
.mob Snapjaw
.isQuestAvailable 7321
step << Warrior
.goto Alterac Mountains,80.49,66.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bath'rah|r交谈
.turnin 1791 >>交任务: |cRXP_FRIENDLY_捕风者|r
.accept 1712 >>接任务: |cRXP_LOOT_塞克隆尼亚|r
.target Bath'rah the Windwatcher
step << Warrior
#loop
.goto Alterac Mountains,77.32,63.20,0
.goto Alterac Mountains,77.32,63.20,50,0
.goto Alterac Mountains,80.07,58.61,50,0
.goto Alterac Mountains,84.76,51.26,50,0
.goto Alterac Mountains,89.36,47.26,50,0
.goto Hillsbrad Foothills,68.21,19.09,50,0
.goto Hillsbrad Foothills,68.32,25.16,50,0
.goto Hillsbrad Foothills,67.66,31.88,50,0
.goto Hillsbrad Foothills,67.38,35.69,50,0
.goto Hillsbrad Foothills,63.76,40.24,50,0
.goto Hillsbrad Foothills,61.97,42.50,50,0
.goto Alterac Mountains,89.36,47.26,50,0
>>沿河上下航行. 击杀|cRXP_ENEMY_钳嘴龟|r. 击杀后搜刮出|T134026:0|t[|cRXP_LOOT_海龟肉|r]
.collect 3712,10 
.mob Snapjaw
.isQuestAvailable 7321
step
.goto Hillsbrad Foothills,62.28,19.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_克里斯托夫|r交谈
.accept 7321 >>接任务: |cRXP_LOOT_海龟汤|r
.turnin 7321 >>交任务: |cRXP_FRIENDLY_海龟汤|r
.target Christoph Jeffcoat
step
#completewith next
.goto Hillsbrad Foothills,62.76,19.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板沙恩|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Shay
step
.goto Hillsbrad Foothills,36.02,39.19,150 >>奔向希尔斯布莱德丘陵
.isOnQuest 529
step
#completewith next
>>击杀|cRXP_ENEMY_铁匠维林坦|r和|cRXP_ENEMY_希尔斯布莱德见习铁匠|r
.complete 529,1 
.unitscan +Blacksmith Verringtan
.complete 529,2 
.mob +Hillsbrad Apprentice Blacksmith
step
.goto Hillsbrad Foothills,32.02,45.45
>>掠夺|cRXP_PICK_一箱铁材|r以获得 |T132761:0|t[|cRXP_LOOT_一箱铁材|r]
.complete 529,3 
step
#loop
.goto Hillsbrad Foothills,32.23,45.32,0
.goto Hillsbrad Foothills,32.65,45.48,20,0
.goto Hillsbrad Foothills,31.87,46.66,20,0
.goto Hillsbrad Foothills,32.23,45.32,20,0
>>击杀|cRXP_ENEMY_铁匠维林坦|r和|cRXP_ENEMY_希尔斯布莱德见习铁匠|r
.complete 529,1 
.unitscan +Blacksmith Verringtan
.complete 529,2 
.mob +Hillsbrad Apprentice Blacksmith
step
#completewith next
.goto Hillsbrad Foothills,62.31,20.29,125 >>返回塔伦米尔
step
.goto Hillsbrad Foothills,62.31,20.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达尔萨利亚(|cRXP_FRIENDLY_Darthalia|r)交谈
.turnin 529 >>交任务: |cRXP_FRIENDLY_希尔斯布莱德之战|r
.accept 532 >>接任务: |cRXP_LOOT_希尔斯布莱德之战|r
.target High Executor Darthalia
.isQuestTurnedIn 528
step
#loop
.goto Hillsbrad Foothills,47.90,31.50,0
.goto Hillsbrad Foothills,47.90,31.50,25,0
.goto Hillsbrad Foothills,46.10,33.20,25,0
.goto Hillsbrad Foothills,43.50,27.30,25,0
.goto Hillsbrad Foothills,43.90,30.20,25,0
.goto Hillsbrad Foothills,41.80,30.60,25,0
.goto Hillsbrad Foothills,43.60,24.90,25,0
>>在达罗山洞内外击杀雪怪, 搜刮它们以获得赫尔库拉的法杖
>>|T135471:0|t[赫尔库拉之杖]|cRXP_WARN_掉落几率较低|r
.complete 552,1 
.mob Cave Yeti
.mob Ferocious Yeti
step
#completewith next
#label Council
.goto Hillsbrad Foothills,29.63,42.33
>>击杀|cRXP_ENEMY_希尔斯布莱德议员|r
>>|cRXP_WARN_小心他们的冰霜新星和冰霜箭|r
.complete 532,2 
.mob Hillsbrad Councilman
.isQuestTurnedIn 529
step
>>在希尔斯布莱德议政厅内击杀波恩塞德镇长和书记员赫拉斯·怀特斯蒂德
>>掠夺|cRXP_LOOT_希尔斯布莱德城镇文档|r并焚烧|cRXP_PICK_希尔斯布莱德宣言|r
.complete 532,1 
.complete 567,1 
.goto Hillsbrad Foothills,29.67,41.64
.complete 532,4 
.goto Hillsbrad Foothills,29.52,41.53
.complete 532,3 
.goto Hillsbrad Foothills,29.73,41.75
.isQuestTurnedIn 529
.mob Magistrate Burnside
step
.goto Hillsbrad Foothills,29.63,42.33
>>完成击杀|cRXP_ENEMY_希尔斯布莱德议会议员|r
>>|cRXP_WARN_小心他们的冰霜新星和冰霜箭|r
.complete 532,2 
.mob Hillsbrad Councilman
.isQuestTurnedIn 529
step
#completewith next
.goto Hillsbrad Foothills,62.31,20.29,125 >>返回塔伦米尔
step
#requires Council
.goto Hillsbrad Foothills,62.31,20.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达尔萨利亚(|cRXP_FRIENDLY_Darthalia|r)交谈
.turnin 532 >>交任务: |cRXP_FRIENDLY_希尔斯布莱德之战|r
.accept 539 >>接任务: |cRXP_LOOT_希尔斯布莱德之战|r
.target High Executor Darthalia
.isQuestTurnedIn 529
step
.goto Hillsbrad Foothills,63.88,19.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thaivand|r交谈
.turnin 552 >>交任务: |cRXP_FRIENDLY_赫尔库拉的复仇|r
.target Novice Thaivand
step << Hunter
#completewith next
.goto Hillsbrad Foothills,62.55,19.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯伦|r交谈
.vendor >>|cRXP_BUY_给你的箭袋装满箭枝|r
.target Kayren Soothallow
step
.goto Hillsbrad Foothills,62.76,19.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板沙恩|r交谈
>>|cRXP_BUY_从他那里购买 |T132795:0|t[南海镇烈酒]|r
.collect 3703,1,533,1 
.target Innkeeper Shay
step
.goto Hillsbrad Foothills,26.95,59.55,100 >>前往Azurelode矿井
.isOnQuest 546
step
#completewith Hacket
>>击杀|r|cRXP_ENEMY_希尔斯布莱德|r怪物. 击杀后搜刮它们的|r|cRXP_LOOT_骷髅|r
.complete 546,1 
.isOnQuest 546
step
#completewith next
.goto Hillsbrad Foothills,31.8,52.5,60,0
.goto Hillsbrad Foothills,29.7,55.7,60,0
.goto Hillsbrad Foothills,31.1,58.6,60,0
>>击杀矿工哈克特
.complete 567,3 
.unitscan Miner Hackett
.isQuestTurnedIn 528
step
.goto Hillsbrad Foothills,31.21,56.01
>>击杀工头邦德斯和希尔斯布莱德矿工
>>|cRXP_ENEMY_工头邦德斯|r|cRXP_WARN_位于矿井最底层的中心位置|r
>>|cRXP_WARN_当生命值降至30%或以下时, |cRXP_ENEMY_工头邦德斯|r 会立即召唤两名|cRXP_ENEMY_丹加洛克士兵|r (等级30)前来支援|r
.complete 539,1 
.mob +Foreman Bonds
.complete 539,2 
.isQuestTurnedIn 528
step
#label Hacket
#loop
.goto Hillsbrad Foothills,31.8,52.5,0
.goto Hillsbrad Foothills,31.8,52.5,60,0
.goto Hillsbrad Foothills,29.7,55.7,60,0
.goto Hillsbrad Foothills,31.1,58.6,60,0
>>击杀矿工哈克特
.complete 567,3 
.unitscan Miner Hackett
.isQuestTurnedIn 528
step
#loop
.goto Hillsbrad Foothills,31.15,54.73,0
.goto Hillsbrad Foothills,29.69,58.03,15,0
.goto Hillsbrad Foothills,28.17,57.27,15,0
.goto Hillsbrad Foothills,26.48,58.74,15,0
.goto Hillsbrad Foothills,27.39,59.38,15,0
.goto Hillsbrad Foothills,27.48,57.60,15,0
.goto Hillsbrad Foothills,28.06,55.12,15,0
.goto Hillsbrad Foothills,28.33,53.10,15,0
.goto Hillsbrad Foothills,31.15,54.73,15,0
>>击杀|cRXP_ENEMY_希尔斯布莱德|r怪物. 击败它们以获取|cRXP_LOOT_骷髅|r
.complete 546,1 
.isQuestTurnedIn 528
step
#loop
.goto Hillsbrad Foothills,31.15,54.73,0
.goto Hillsbrad Foothills,29.69,58.03,15,0
.goto Hillsbrad Foothills,28.17,57.27,15,0
.goto Hillsbrad Foothills,26.48,58.74,15,0
.goto Hillsbrad Foothills,27.39,59.38,15,0
.goto Hillsbrad Foothills,27.48,57.60,15,0
.goto Hillsbrad Foothills,28.06,55.12,15,0
.goto Hillsbrad Foothills,28.33,53.10,15,0
.goto Hillsbrad Foothills,31.15,54.73,15,0
.xp 32 >>练级到32级
step
#completewith next
.goto Alterac Mountains,57.17,69.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_仆从瓦里克|r交谈
>>|cRXP_WARN_交易|r |T132795:0|t[南海镇烈酒] |cRXP_WARN_换取|r |cRXP_LOOT_辛迪加信件|r
>>|cRXP_WARN_他可能敌对. 如果是这样, 杀死他并等待其复活. 或者击杀|r|cRXP_ENEMY_Syndicate|r|cRXP_WARN_以获得|r|cRXP_LOOT_辛迪加信件|r
.complete 533,1 
.target Henchman Valik
.itemcount 3703,1 
.isOnQuest 533
step
#loop
.goto Alterac Mountains,48.86,82.87,0
.goto Alterac Mountains,46.51,81.74,50,0
.goto Alterac Mountains,48.86,82.87,50,0
.goto Alterac Mountains,48.78,80.96,50,0
.goto Alterac Mountains,56.38,66.23,50,0
.goto Alterac Mountains,57.85,69.74,50,0
.goto Alterac Mountains,59.14,69.36,50,0
.goto Alterac Mountains,59.53,66.50,50,0
.goto Alterac Mountains,58.30,66.67,50,0
>>击杀|cRXP_ENEMY_Syndicate 辛迪加盗贼|r和|cRXP_ENEMY_Syndicate 辛迪加劫匪|r. 击败他们后搜刮出|cRXP_LOOT_辛迪加信件|r
.complete 533,1 
.mob Syndicate Footpad
.mob Syndicate Thief
step
.goto Hillsbrad Foothills,62.11,19.67
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Samsa|r交谈
.turnin 546 >>交任务: |cRXP_FRIENDLY_死亡的纪念品|r
.target Deathguard Samsa
step
.goto Hillsbrad Foothills,62.31,20.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达尔萨利亚(|cRXP_FRIENDLY_Darthalia|r)交谈
.turnin 567 >>交任务: |cRXP_FRIENDLY_危险！|r
.turnin 539 >>交任务: |cRXP_FRIENDLY_希尔斯布莱德之战|r
.accept 541 >>接任务: |cRXP_LOOT_希尔斯布莱德之战|r
.target High Executor Darthalia
.group
step
.goto Hillsbrad Foothills,62.31,20.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达尔萨利亚(|cRXP_FRIENDLY_Darthalia|r)交谈
.turnin 567 >>交任务: |cRXP_FRIENDLY_危险！|r
.turnin 539 >>交任务: |cRXP_FRIENDLY_希尔斯布莱德之战|r
.target High Executor Darthalia
step
.goto Hillsbrad Foothills,63.24,20.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁斯克|r交谈
.turnin 533 >>交任务: |cRXP_FRIENDLY_秘密潜入|r
.target Krusk
step
#completewith EnterArathi
.destroy 3703 >>|cRXP_WARN_摧毁: |cRXP_ENEMY_南海镇烈酒|r|r
step << Hunter
.goto Hillsbrad Foothills,62.55,19.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯伦|r交谈
.vendor >>|cRXP_BUY_给你的箭袋装满箭枝|r
.target Kayren Soothallow
step
.goto Hillsbrad Foothills,62.79,19.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板沙恩|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Shay
step
#completewith RaisingSpirits
.skill herbalism,70 >>如果你有125点炼金术, 收集两株|T134181:0|t[跌打草]和两株|T134412:0|t[布瑞尔索恩]
>>|cRXP_WARN_如果炼金术等级接近125, 收集足够的材料将其提升至125级；否则跳过此步骤. 为“苦楚药剂”任务线保存两株布瑞尔索恩和两株跌打草|r
.collect 2453,2 
.collect 2450,2 
.skill alchemy,<125,1
step
#loop
.goto Hillsbrad Foothills,64.68,62.01,0
.goto Hillsbrad Foothills,64.67,60.01,20,0
.goto Hillsbrad Foothills,63.02,61.19,20,0
.goto Hillsbrad Foothills,63.45,62.50,20,0
.goto Hillsbrad Foothills,64.68,62.01,20,0
>>在奈瑟丹庄园周围采集|cRXP_PICK_白蘑菇|r, 以获得|cRXP_LOOT_泥头花|r
.complete 509,1 
step
#label EnterArathi
.goto Arathi Highlands,20.19,29.54
.zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
.zoneskip Arathi Highlands
step
#loop
.goto Arathi Highlands,35.51,44.26,0
.goto Arathi Highlands,31.91,41.15,50,0
.goto Arathi Highlands,35.53,40.93,50,0
.goto Arathi Highlands,35.51,44.26,50,0
.goto Arathi Highlands,34.40,44.25,12,0
.goto Arathi Highlands,31.08,43.68,12,0
>>击杀石拳食人魔和石拳执行者, 地点位于巨石镇及其周边地区
>>|cRXP_WARN_当心. 他们可以用|r|T132154:0|t[石拳]|cRXP_WARN_为自己增加效果(每次攻击造成100点额外伤害, 移动速度降低75%)|r
.complete 676,1 
.mob +Boulderfist Ogre
.complete 676,2 
.mob +Boulderfist Enforcer
step
#completewith next
.goto Arathi Highlands,73.52,33.20,150 >>前往落锤镇
step
.goto Arathi Highlands,73.10,32.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤尔达|r交谈
.fp Hammerfall >>获取落锤镇的飞行点
.target Urda
step
.goto Arathi Highlands,74.20,33.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜拉姆法尔|r交谈
.turnin 676 >>交任务: |cRXP_FRIENDLY_落锤之战|r
.accept 677 >>接任务: |cRXP_LOOT_短兵相接|r
.target Drum Fel
step
.goto Arathi Highlands,72.64,33.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈尔姆尔|r交谈
.accept 655 >>接任务: |cRXP_LOOT_落锤镇|r
.target Gor'mul
step
.goto Arathi Highlands,73.84,32.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板埃德瓦|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Adegwa
step
.goto Arathi Highlands,74.60,36.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托加恩|r交谈
.turnin 655 >>交任务: |cRXP_FRIENDLY_落锤镇|r
.accept 672 >>接任务: |cRXP_LOOT_振奋精神|r
.accept 671 >>接任务: |cRXP_LOOT_邪恶的魔法|r
.target Tor'gan
step << Hunter
#completewith next
.goto Arathi Highlands,73.92,33.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨里顿|r交谈
.stable >>将你的宠物安置在马厩里. 你很快就会驯服一只|cRXP_ENEMY_平原狼蛛|r
.target Tharlidun
step << Hunter
#loop
.goto Arathi Highlands,69.28,37.53,0
.goto Arathi Highlands,62.09,38.95,0
.goto Arathi Highlands,68.55,51.64,0
.goto Arathi Highlands,69.28,37.53,40,0
.goto Arathi Highlands,62.09,38.95,40,0
.goto Arathi Highlands,68.55,51.64,40,0
>>|cRXP_WARN_使用|r |T132172:0|t[鹰眼] |cRXP_WARN_尝试寻找一只 |cRXP_ENEMY_平原狼蛛|r. 它们的部分位置已在你的地图上标记|r
>>|cRXP_WARN_对|cRXP_ENEMY_平原狼蛛|r施放|r|T132164:0|t[驯服野兽]|cRXP_WARN_以驯服它|r 
.train 17265 >>|cRXP_WARN_用它攻击怪物来学习|r|T132278:0|t[撕咬(等级 5)]
.link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
.unitscan Plains Creeper
.zoneskip Arathi Highlands,1
step << Hunter
.goto Arathi Highlands,73.92,33.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨里顿|r交谈
.stable >>放弃|cRXP_ENEMY_平原狼蛛|r并取回你的常规宠物
.target Tharlidun
.train 17265,3
.zoneskip Arathi Highlands,1
step
#hardcore
#completewith WitherbarkArrive
.goto Arathi Highlands,45.78,43.61,0
+|cRXP_WARN_请注意不要过于靠近区域中心的避难点(联盟基地). |r|cRXP_ENEMY_避难点守卫|r|cRXP_WARN_会杀死你|r
.unitscan Refuge Point Defender
step
#completewith xpgate
>>击杀你遇到的任何|cRXP_ENEMY_高地迅猛龙|r, 搜刮它们掉落的|cRXP_LOOT_眼睛|r
>>|cRXP_WARN_小心|r|cRXP_ENEMY_高地杂兵|r, |cRXP_WARN_因为他们实际上会|r|T132152:0|t[撕碎]
.complete 672,1 
.mob Highland Strider
.mob Highland Thrasher
step
#loop
.goto Arathi Highlands,34.07,28.35,0
.goto Arathi Highlands,34.07,28.35,50,0
.goto Arathi Highlands,33.36,26.41,50,0
.goto Arathi Highlands,31.79,26.47,50,0
.goto Arathi Highlands,30.83,27.49,50,0
.goto Arathi Highlands,31.01,29.58,50,0
.goto Arathi Highlands,32.32,30.87,50,0
.goto Arathi Highlands,33.36,30.72,50,0
>>击杀|cRXP_ENEMY_Syndicate 成员|r. 从他们身上搜刮|cRXP_LOOT_Amulets|r
>>|cRXP_WARN_小心|cRXP_ENEMY_Syndicate Highwaymen|r；他们会在农场周围潜行, 如果你风筝或逃跑, 他们会从背后偷袭你|r
.complete 671,1 
.mob Syndicate Pathstalker
.mob Syndicate Mercenary
.mob Syndicate Highwayman
step
#label xpgate
#loop
.goto Arathi Highlands,34.07,28.35,50,0
.goto Arathi Highlands,33.36,26.41,50,0
.goto Arathi Highlands,31.79,26.47,50,0
.goto Arathi Highlands,30.83,27.49,50,0
.goto Arathi Highlands,31.01,29.58,50,0
.goto Arathi Highlands,32.32,30.87,50,0
.goto Arathi Highlands,33.36,30.72,50,0
.xp 33>>练级至33级
step
#completewith StealFromThieves
>>击杀|cRXP_ENEMY_高地迅猛龙|r. 从它们身上搜刮|cRXP_LOOT_眼睛|r
>>|cRXP_WARN_小心|r|cRXP_ENEMY_高地杂兵|r, |cRXP_WARN_因为他们实际上会|r|T132152:0|t[撕碎]
.complete 672,1 
.mob Highland Strider
.mob Highland Thrasher
step
.goto Arathi Highlands,54.20,38.20
>>击杀|cRXP敌方马塞尔|r. 掠夺他的|cRXP战利品头|r
>>|cRXP_WARN_他使用|r|T132362:0|t[盾墙]|cRXP_WARN_(-75%伤害, 持续10秒)和|r|T132357:0|t[盾击]|cRXP_WARN_(打断)|r
.complete 1164,2 
.unitscan Marcel Dabyrie
step
.goto Arathi Highlands,56.40,36.10
>>击杀|cRXP_ENEMY_Kenata|r. 击杀后搜刮她的|cRXP_LOOT_Head|r
>>|cRXP_WARN_这可能相当困难. 务必小心|r << Rogue/Warrior/Shaman
.complete 1164,1 
.unitscan Kenata Dabyrie
step
#label StealFromThieves
.goto Arathi Highlands,56.50,38.70
>>击杀|cRXP_ENEMY_Fardel|r. 击败他后搜刮其掉落的|cRXP_LOOT_Head|r
>>|cRXP_WARN_小心他的高伤害毒药和|r|T132152:0|t[横扫]
.complete 1164,3 
.unitscan Fardel Dabyrie
step
.goto Arathi Highlands,59.40,42.61
>>击杀|cRXP_ENEMY_高地迅猛龙|r. 击败它们并获取其|cRXP_LOOT_眼睛|r
>>|cRXP_WARN_小心|r|cRXP_ENEMY_高地杂兵|r, |cRXP_WARN_因为他们实际上会|r|T132152:0|t[撕碎]
.complete 672,1 
.mob Highland Strider
.mob Highland Thrasher
step
#completewith WitherbarkTrolls
+留意|cRXP_ENEMY_屠戮者尼玛尔|r(稀有). 他可能掉落强力的绑定物品(BoE)
.unitscan Nimar the Slayer
step
#label WitherbarkArrive
#completewith next
.goto Arathi Highlands,66.68,62.96,150 >>前往凋零橡木村
step
#label WitherbarkTrolls
#loop
.goto Arathi Highlands,71.70,60.30,0
.goto Arathi Highlands,71.70,60.30,50,0
.goto Arathi Highlands,73.40,65.20,50,0
.goto Arathi Highlands,70.60,69.30,50,0
.goto Arathi Highlands,68.30,74.50,50,0
.goto Arathi Highlands,66.20,69.20,50,0
.goto Arathi Highlands,64.80,73.10,50,0
.goto Arathi Highlands,61.30,72.40,50,0
.goto Arathi Highlands,63.30,67.70,50,0
.goto Arathi Highlands,66.50,63.70,50,0
>>击杀|cRXP_ENEMY_枯木巫医|r和|cRXP_ENEMY_猎头者|r和|cRXP_ENEMY_投斧者|r
>>|cRXP_WARN_下一个任务可能相当困难, 务必格外小心|r
.complete 677,3 
.mob +Witherbark Witch Doctor
.complete 677,2 
.mob +Witherbark Headhunter
.complete 677,1 
.mob +Witherbark Axe Thrower
step
.goto Arathi Highlands,74.72,36.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回至|cRXP_FRIENDLY_Tor'gan|r
.turnin 671 >>交任务: |cRXP_FRIENDLY_邪恶的魔法|r
.turnin 672 >>交任务: |cRXP_FRIENDLY_振奋精神|r
.accept 674 >>接任务: |cRXP_LOOT_振奋精神|r
.target Tor'gan
step
#label RaisingSpirits
.goto Arathi Highlands,72.64,33.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回|cRXP_FRIENDLY_Gor'mul|r
.turnin 674 >>交任务: |cRXP_FRIENDLY_振奋精神|r
.accept 675 >>接任务: |cRXP_LOOT_振奋精神|r
.target Gor'mul
step
.goto Arathi Highlands,74.72,36.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托加恩|r交谈
.turnin 675 >>交任务: |cRXP_FRIENDLY_振奋精神|r
.target Tor'gan
step
.goto Arathi Highlands,74.24,33.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回 |cRXP_FRIENDLY_Drum|r
.turnin 677 >>交任务: |cRXP_FRIENDLY_短兵相接|r
.target Drum Fel
step
#completewith next
.goto Arathi Highlands,73.10,32.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤尔达|r交谈
.fly Tarren Mill >>飞往塔伦米尔
.target Urda
.zoneskip Hillsbrad Foothills
step
.goto Hillsbrad Foothills,61.50,19.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回|cRXP_FRIENDLY_Lydon|r
.turnin 509 >>交任务: |cRXP_FRIENDLY_苦楚药剂|r
.accept 513 >>接任务: |cRXP_LOOT_苦楚药剂|r
.target Apothecary Lydon
step << Mage
.cast 3563 >>传送 |T135766:0|t[传送:幽暗城]
.zoneskip Undercity
.itemcount 17031,1
step << !Mage
.goto Hillsbrad Foothills,60.14,18.63
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞斯|r交谈
.fly Undercity >>飞往幽暗城
.target Zarise
.zoneskip Undercity
step
#label Thieves
.goto Undercity,63.83,49.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉纳维·卡隆|r交谈
.turnin 1164 >>交任务: |cRXP_FRIENDLY_科娜塔一家|r
.target Genavie Callow
step
#completewith next
.skill alchemy,125 >>如果你准备好了, 就把炼金术练到125级. 否则, 跳过这一步
.skill alchemy,<100,1
step
.goto Undercity,64.12,50.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Felicia|r交谈
.vendor >>购买 |T132793:0|t[铅瓶] 以完成苦楚药剂任务线
>>|cRXP_WARN_如果你的炼金术等级接近125级且已收集额外草药, 请购买足够的|r|T132793:0|t[铅瓶]|cRXP_WARN_用于炼金术升级至125级. 否则, 跳过此步骤|r
.collect 3372,1 
.target Felicia Doan
.skill alchemy,<100,1
.isOnQuest 513
step
#ah
.goto Undercity,64.20,49.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
.collect 3388,1 >>|cRXP_BUY_购买一瓶|r|T134858:0|t[强效巨魔血药水] |cRXP_BUY_, 从拍卖行获取, 用于“苦楚药剂”任务线|r
.collect 5996,3 >>|cRXP_BUY_购买三个|r |T134797:0|t[水下呼吸药剂] << !Warlock !Druid !Shaman
.collect 17057,3 >>|cRXP_BUY_购买三个|r|T134310:0|t[闪亮的鱼鳞] << Shaman
.target Auctioneer Rhyker
.train 131,3 << Shaman 
step
#optional << Shaman
#ah
.goto Undercity,64.20,49.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
.collect 3388,1 >>|cRXP_BUY_购买一瓶|r|T134858:0|t[强效巨魔血药水] |cRXP_BUY_, 从拍卖行获取, 用于“苦楚药剂”任务线|r
.collect 5996,3 >>|cRXP_BUY_购买三个|r |T134797:0|t[水下呼吸药剂] << !Warlock !Druid
.target Auctioneer Rhyker
.train 131,1 << Shaman 
step
.goto Undercity,47.77,73.34
>>为“苦楚药剂”任务线制作一瓶 |T134858:0|t[强效巨魔血药水]
*|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_WARN_Talk to|r |cRXP_FRIENDLY_Doctor Herbert Halsey|r |cRXP_WARN_by the stairs to learn this recipe|r
.collect 3388,1 
.target Doctor Herbert Halsey
.skill alchemy,<125,1
.isOnQuest 513
step
#completewith next
.goto Undercity,47.20,59.69,0
.goto Undercity,47.20,59.69,12,0
.goto Undercity,43.55,68.11,12,0
.goto Undercity,45.20,71.67,12 >>前往|cRXP_FRIENDLY_Faranell|r
step
#ah
.goto Undercity,48.60,69.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔|r交谈
.turnin 513 >>交任务: |cRXP_FRIENDLY_苦楚药剂|r
.accept 515 >>接任务: |cRXP_LOOT_苦楚药剂|r
.target Master Apothecary Faranell
step
#ssf
.goto Undercity,48.60,69.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔|r交谈
.turnin 513 >>交任务: |cRXP_FRIENDLY_苦楚药剂|r
.accept 515 >>接任务: |cRXP_LOOT_苦楚药剂|r
.target Master Apothecary Faranell
.skill alchemy,<125,1
step
.goto Undercity,48.80,69.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔|r交谈
.turnin 513 >>交任务: |cRXP_FRIENDLY_苦楚药剂|r
.target Master Apothecary Faranell
step << Warrior
.goto Undercity,48.32,15.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安吉拉|r交谈
.train 11554 >>训练你的职业法术
.target Angela Curthas
.xp <34,1
.xp >36,1
step << Warrior
#optional
.goto Undercity,48.32,15.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安吉拉|r交谈
.train 1680 >>训练你的职业法术
.target Angela Curthas
.xp <36,1
step << Rogue
.goto Undercity,83.86,72.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
.train 8696 >>训练你的职业法术
.target Carolyn Ward
.xp <34,1
.xp >36,1
step << Rogue
#optional
.goto Undercity,83.86,72.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
.train 8691 >>训练你的职业法术
>>|T132273:0|t[速效药膏等级3]|cRXP_WARN_需要毒药技能达到160级！|r
.target Carolyn Ward
.xp <36,1
step << Warlock
.goto Undercity,88.93,15.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richard|r交谈
.train 7648 >>训练你的职业法术
.target Richard Kerwin
.xp <34,1
.xp >36,1
step << Warlock
#optional
.goto Undercity,88.93,15.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richard|r交谈
.train 2362 >>训练你的职业法术
.target Richard Kerwin
.xp <36,1
step << Mage
.goto Undercity,85.15,10.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
.train 8492 >>训练你的职业法术
.target Anastasia Hartwell
.xp <34,1
.xp >36,1
step << Mage
#optional
.goto Undercity,85.15,10.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
.train 8495 >>训练你的职业法术
.target Anastasia Hartwell
.xp <36,1
step << Priest
.goto Undercity,47.55,18.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉扎鲁斯|r交谈
.train 2767 >>训练你的职业法术
.target Father Lazarus
.xp <34,1
.xp >36,1
step << Priest
#optional
.goto Undercity,47.55,18.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉扎鲁斯|r交谈
.train 15264 >>训练你的职业法术
.target Father Lazarus
.xp <36,1
step
.goto Undercity,63.27,48.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
.fly Tarren Mill >>飞往塔伦米尔
.target Michael Garrett
.zoneskip Hillsbrad Foothills
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bel'varil|r和|cRXP_FRIENDLY_Wordeen|r交谈
.accept 556 >>接任务: |cRXP_LOOT_石雕|r
.target +Keeper Bel'varil
.goto Hillsbrad Foothills,61.60,20.86
.accept 544 >>接任务: |cRXP_LOOT_入室偷窃|r
.target +Magus Wordeen Voidglare
.goto Hillsbrad Foothills,61.49,20.93
step
#completewith next
+|cRXP_WARN_下一个任务可能相当困难, 务必格外小心！|r
step
#completewith Belamoore
>>击杀所有 |cRXP_ENEMY_达拉然人形生物|r. 从他们身上搜刮出 |cRXP_LOOT_用旧的石雕|r
>>|cRXP_WARN_小心|r|cRXP_ENEMY_达拉然护盾卫士'|r|cRXP_WARN_发光|r|T136173:0|t[紫罗兰护盾效果]|cRXP_WARN_增益. 持续8秒, 受到近战攻击时会反弹85点伤害|r << !Mage/!Priest/!Warlock
.complete 556,1 
step
.goto Alterac Mountains,20.14,84.28,20,0
.goto Alterac Mountains,20.33,86.31,12,0
.goto Alterac Mountains,19.93,85.94
>>击杀|cRXP_ENEMY_瑞克特尔|r和|cRXP_ENEMY_奥丽娜|r和|cRXP_ENEMY_德莫特|r, 击败后搜刮他们的|cRXP_LOOT_血石|r
.complete 544,2 
.mob +Ricter
.complete 544,3 
.mob +Alina
.complete 544,1 
.mob +Dermot
step
#completewith next
.goto Alterac Mountains,18.70,84.38,10 >>进入西侧建筑
step
#label Belamoore
.goto Alterac Mountains,18.29,82.83,8,0
.goto Alterac Mountains,17.65,84.11,8,0
.goto Alterac Mountains,17.76,83.18
>>在建筑二楼击杀|cRXP_ENEMY_克甘达玛|r, 搜刮他的|cRXP_LOOT_血石|r
>>|cRXP_WARN_小心|r|cRXP_ENEMY_典狱官贝拉摩尔|r|cRXP_WARN_. 在攻击|r|cRXP_ENEMY_克甘·达玛|r之前先击杀她|r
.complete 544,4 
.mob Kegan Darkmar
.mob Warden Belamoore
step
#loop
.goto Alterac Mountains,20.10,86.20,0
.goto Alterac Mountains,20.10,86.20,40,0
.goto Alterac Mountains,17.90,83.00,40,0
.goto Alterac Mountains,10.70,76.60,40,0
.goto Alterac Mountains,19.40,75.60,40,0
>>击杀|cRXP_ENEMY_达拉然人形生物|r. 从他们身上搜刮出|cRXP_LOOT_用旧的石雕|r
>>|cRXP_WARN_小心|cRXP_ENEMY_达拉然护盾守卫的|r|cRXP_WARN_发光|r|T136173:0|t[紫罗兰护盾效果]|cRXP_WARN_增益. 该增益持续8秒, 受到近战攻击时会反弹85点伤害|r << !Mage/!Priest/!Warlock
.complete 556,1 
.mob Dalaran Shield Guard
.mob Dalaran Theurgist
.mob Dalaran Worker
.mob Dalaran Summoner
step
#optional
#completewith next
.destroy 3711 >>|cRXP_WARN_摧毁: |cRXP_ENEMY_贝拉摩尔的研究日记|r|r
step
#completewith next
.goto Hillsbrad Foothills,62.31,20.29,125 >>返回塔伦米尔
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bel'varil|r和|cRXP_FRIENDLY_Wordeen|r交谈
.turnin 556 >>交任务: |cRXP_FRIENDLY_石雕|r
.target +Keeper Bel'varil
.goto Hillsbrad Foothills,61.60,20.86
.turnin 544 >>交任务: |cRXP_FRIENDLY_入室偷窃|r
.target +Magus Wordeen Voidglare
.goto Hillsbrad Foothills,61.49,20.93
step
.goto Hillsbrad Foothills,62.76,20.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈伯特|r交谈
.accept 547 >>接任务: |cRXP_LOOT_亨伯特的长剑|r
.target Deathguard Humbert
.group
step
#ssf
#loop
.goto Hillsbrad Foothills,55.76,61.82,0
.goto Hillsbrad Foothills,55.76,61.82,50,0
.goto Hillsbrad Foothills,56.50,64.70,50,0
.goto Hillsbrad Foothills,58.36,65.49,50,0
.goto Hillsbrad Foothills,59.20,70.58,50,0
.goto Hillsbrad Foothills,61.01,73.35,50,0
.goto Hillsbrad Foothills,62.30,75.68,50,0
.goto Hillsbrad Foothills,65.17,77.36,50,0
.goto Hillsbrad Foothills,66.66,79.86,50,0
.goto Hillsbrad Foothills,66.81,84.29,50,0
.goto Hillsbrad Foothills,67.15,86.84,50,0
.goto Hillsbrad Foothills,66.11,85.69,50,0
.goto Hillsbrad Foothills,64.26,78.48,50,0
.goto Hillsbrad Foothills,61.83,77.51,50,0
.goto Hillsbrad Foothills,57.84,71.98,50,0
.goto Hillsbrad Foothills,57.74,69.23,50,0
.goto Hillsbrad Foothills,55.05,64.45,50,0
.goto Hillsbrad Foothills,53.69,64.22,50,0
.goto Hillsbrad Foothills,54.08,62.05,50,0
>>前往: |cRXP_PICK_希尔斯布莱德丘陵|r's eastern coast, then kill all |cRXP_ENEMY_Daggerspine Nagas|r. Loot them for their |cRXP_LOOT_Scales|r
>>|cRXP_WARN_旅行时请留在河的东侧, 并在完成此步骤时务必小心|r|cFFEB144C南海镇卫兵|r|r
.collect 3509,5,515,1 
.unitscan Southshore Guard << Horde
.mob Daggerspine Siren
.mob Daggerspine Shorehunter
.mob Daggerspine Shorestalker
.skill alchemy,<125,1
step
#ah
.goto Hillsbrad Foothills,55.76,61.82,0
.goto Hillsbrad Foothills,55.76,61.82,50,0
.goto Hillsbrad Foothills,56.50,64.70,50,0
.goto Hillsbrad Foothills,58.36,65.49,50,0
.goto Hillsbrad Foothills,59.20,70.58,50,0
.goto Hillsbrad Foothills,61.01,73.35,50,0
.goto Hillsbrad Foothills,62.30,75.68,50,0
.goto Hillsbrad Foothills,65.17,77.36,50,0
.goto Hillsbrad Foothills,66.66,79.86,50,0
.goto Hillsbrad Foothills,66.81,84.29,50,0
.goto Hillsbrad Foothills,67.15,86.84,50,0
.goto Hillsbrad Foothills,66.11,85.69,50,0
.goto Hillsbrad Foothills,64.26,78.48,50,0
.goto Hillsbrad Foothills,61.83,77.51,50,0
.goto Hillsbrad Foothills,57.84,71.98,50,0
.goto Hillsbrad Foothills,57.74,69.23,50,0
.goto Hillsbrad Foothills,55.05,64.45,50,0
.goto Hillsbrad Foothills,53.69,64.22,50,0
>>前往: |cRXP_PICK_希尔斯布莱德丘陵|r's eastern coast, then kill |cRXP_ENEMY_Daggerspine Nagas|r. Loot them for their |cRXP_LOOT_Scales|r
>>|cRXP_WARN_旅行时请留在河的东侧, 并在完成此步骤时务必小心|r|cFFEB144C南海镇卫兵|r|r << Horde
.collect 3509,5,515,1 
.unitscan Southshore Guard << Horde
.mob Daggerspine Siren
.mob Daggerspine Shorehunter
.mob Daggerspine Shorestalker
step
#ssf
#loop
.goto Hillsbrad Foothills,50.63,66.44,0
.goto Hillsbrad Foothills,47.97,63.97,50,0
.goto Hillsbrad Foothills,45.98,63.38,50,0
.goto Hillsbrad Foothills,43.98,66.10,50,0
.goto Hillsbrad Foothills,40.63,67.95,50,0
.goto Hillsbrad Foothills,35.71,66.97,50,0
.goto Hillsbrad Foothills,32.85,69.86,50,0
.goto Hillsbrad Foothills,30.82,72.47,50,0
.goto Hillsbrad Foothills,25.74,69.92,50,0
.goto Hillsbrad Foothills,24.96,64.40,50,0
.goto Hillsbrad Foothills,22.56,64.04,50,0
.goto Hillsbrad Foothills,24.32,66.28,50,0
.goto Hillsbrad Foothills,24.70,71.38,50,0
.goto Hillsbrad Foothills,27.79,73.18,50,0
.goto Hillsbrad Foothills,30.12,74.19,50,0
.goto Hillsbrad Foothills,33.31,72.96,50,0
.goto Hillsbrad Foothills,34.83,69.75,50,0
.goto Hillsbrad Foothills,39.63,70.37,50,0
.goto Hillsbrad Foothills,42.98,69.70,50,0
.goto Hillsbrad Foothills,43.75,68.47,50,0
.goto Hillsbrad Foothills,45.28,67.92,50,0
.goto Hillsbrad Foothills,46.73,65.07,50,0
.goto Hillsbrad Foothills,47.97,63.97,50,0
>>游到南海镇西海岸, |cRXP_WARN_始终与南海镇保持最远距离, |r然后击杀|cRXP_ENEMY_破鳍鱼人|r. 搜刮他们的|cRXP_LOOT_眼睛|r << Horde
>>|cRXP_WARN_完成此步骤时, 请确保自己与南海镇之间有山丘阻挡. 一名 |cFFEB144C南海镇卫兵|r呆在码头西南角, 非常靠近最东边的鱼人刷新点, 且其仇恨范围极大|r << Horde
>>|cRXP_WARN_小心|r|cRXP_ENEMY_Torn Fin Tidehunters'|r|cRXP_WARN_Frost Nova, 特别是在营地附近|r
.collect 3510,5,515,1 
.unitscan Southshore Guard << Horde
.mob Torn Fin Tidehunter
.mob Torn Fin Oracle
.mob Torn Fin Coastrunner
.mob Torn Fin Muckdweller
.skill alchemy,<125,1
step
#ah
#loop
.goto Hillsbrad Foothills,50.63,66.44,0
.goto Hillsbrad Foothills,47.97,63.97,50,0
.goto Hillsbrad Foothills,45.98,63.38,50,0
.goto Hillsbrad Foothills,43.98,66.10,50,0
.goto Hillsbrad Foothills,40.63,67.95,50,0
.goto Hillsbrad Foothills,35.71,66.97,50,0
.goto Hillsbrad Foothills,32.85,69.86,50,0
.goto Hillsbrad Foothills,30.82,72.47,50,0
.goto Hillsbrad Foothills,25.74,69.92,50,0
.goto Hillsbrad Foothills,24.96,64.40,50,0
.goto Hillsbrad Foothills,22.56,64.04,50,0
.goto Hillsbrad Foothills,24.32,66.28,50,0
.goto Hillsbrad Foothills,24.70,71.38,50,0
.goto Hillsbrad Foothills,27.79,73.18,50,0
.goto Hillsbrad Foothills,30.12,74.19,50,0
.goto Hillsbrad Foothills,33.31,72.96,50,0
.goto Hillsbrad Foothills,34.83,69.75,50,0
.goto Hillsbrad Foothills,39.63,70.37,50,0
.goto Hillsbrad Foothills,42.98,69.70,50,0
.goto Hillsbrad Foothills,43.75,68.47,50,0
.goto Hillsbrad Foothills,45.28,67.92,50,0
.goto Hillsbrad Foothills,46.73,65.07,50,0
.goto Hillsbrad Foothills,47.97,63.97,50,0
>>游到南海镇西海岸, |cRXP_WARN_始终与南海镇保持最远距离, |r然后击杀|cRXP_ENEMY_破鳍鱼人|r. 搜刮他们的|cRXP_LOOT_眼睛|r << Horde
>>|cRXP_WARN_完成此步骤时, 请确保自己与南海镇之间有山丘阻挡. 一名 |cFFEB144C南海镇卫兵|r呆在码头西南角, 非常靠近最东边的鱼人刷新点, 且其仇恨范围极大|r << Horde
>>|cRXP_WARN_小心|r|cRXP_ENEMY_Torn Fin Tidehunters'|r|cRXP_WARN_Frost Nova, 特别是在营地附近|r
.collect 3510,5,515,1 
.unitscan Southshore Guard << Horde
.mob Torn Fin Tidehunter
.mob Torn Fin Oracle
.mob Torn Fin Coastrunner
.mob Torn Fin Muckdweller
step
.goto Hillsbrad Foothills,61.50,19.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与莱登交谈|cRXP_FRIENDLY_Lydon|r
.turnin 515 >>交任务: |cRXP_FRIENDLY_苦楚药剂|r
.accept 517 >>交任务: |cRXP_FRIENDLY_苦楚药剂|r
.target Apothecary Lydon
.isQuestTurnedIn 515
.group
step
.goto Hillsbrad Foothills,61.50,19.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回|cRXP_FRIENDLY_Lydon|r
.turnin 515 >>交任务: |cRXP_FRIENDLY_苦楚药剂|r
.target Apothecary Lydon
.isQuestComplete 515
step
#completewith DunGarok
.goto Hillsbrad Foothills,70.76,78.14,150 >>前往丹加洛克
.group
step
#completewith next
>>击杀|cRXP_PICK_矿工烈酒|r. 它在城堡内有多个刷新位置
.complete 517,1 
.isOnQuest 517
.group 5
step
#label DunGarok
#loop
.goto Hillsbrad Foothills,71.26,75.17,0
.goto Hillsbrad Foothills,71.26,75.17,25,0
.goto Hillsbrad Foothills,69.11,75.18,25,0
.goto Hillsbrad Foothills,68.59,78.47,25,0
.goto Hillsbrad Foothills,69.66,78.68,25,0
.goto Hillsbrad Foothills,71.01,79.09,25,0
.goto Hillsbrad Foothills,70.57,79.70,25,0
.goto Hillsbrad Foothills,71.48,81.57,25,0
.goto Hillsbrad Foothills,71.72,80.64,25,0
.goto Hillsbrad Foothills,71.98,81.24,25,0
.goto Hillsbrad Foothills,72.57,80.52,25,0
.goto Hillsbrad Foothills,72.20,80.00,25,0
.goto Hillsbrad Foothills,72.87,79.79,25,0
.goto Hillsbrad Foothills,72.40,79.28,25,0
.goto Hillsbrad Foothills,71.84,78.26,25,0
.goto Hillsbrad Foothills,71.32,78.69,25,0
>>击杀|cRXP_ENEMY_丹加洛克士兵|r 和|cRXP_ENEMY_达伦·铁山上尉|r . 击杀后搜刮出|cRXP_LOOT_亨伯特的长剑|r
>>|cRXP_WARN_进出邓加洛克时要小心；路上和要塞内有多支巡逻队|r
.complete 541,1 
.mob +Dun Garok Mountaineer
.complete 541,2 
.mob +Dun Garok Rifleman
.complete 541,3 
.mob +Dun Garok Priest
.complete 541,4 
.unitscan +Captain Ironhill
.complete 547,1 
.mob +Dun Garok Mountaineer
.mob +Dun Garok Rifleman
.mob +Dun Garok Priest
.group 5
step
#loop
.goto Hillsbrad Foothills,71.26,75.17,0
.goto Hillsbrad Foothills,71.26,75.17,25,0
.goto Hillsbrad Foothills,69.11,75.18,25,0
.goto Hillsbrad Foothills,68.59,78.47,25,0
.goto Hillsbrad Foothills,69.66,78.68,25,0
.goto Hillsbrad Foothills,71.01,79.09,25,0
.goto Hillsbrad Foothills,70.57,79.70,25,0
.goto Hillsbrad Foothills,71.48,81.57,25,0
.goto Hillsbrad Foothills,71.72,80.64,25,0
.goto Hillsbrad Foothills,71.98,81.24,25,0
.goto Hillsbrad Foothills,72.57,80.52,25,0
.goto Hillsbrad Foothills,72.20,80.00,25,0
.goto Hillsbrad Foothills,72.87,79.79,25,0
.goto Hillsbrad Foothills,72.40,79.28,25,0
.goto Hillsbrad Foothills,71.84,78.26,25,0
.goto Hillsbrad Foothills,71.32,78.69,25,0
>>击杀|cRXP_PICK_矿工烈酒|r. 它在城堡内有多个刷新位置
>>|cRXP_WARN_进出邓加洛克时要小心；路上和要塞内有多支巡逻队|r
.complete 517,1 
.isOnQuest 517
.group 5
step
.goto Hillsbrad Foothills,62.76,20.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈伯特|r交谈
.turnin 547 >>交任务: |cRXP_FRIENDLY_亨伯特的长剑|r
.target Deathguard Humbert
.isQuestComplete 547
.group
step
.goto Hillsbrad Foothills,61.50,19.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与莱登交谈|cRXP_FRIENDLY_Lydon|r
.turnin 517 >>交任务: |cRXP_FRIENDLY_苦楚药剂|r
.accept 524 >>接任务: |cRXP_LOOT_苦楚药剂|r
.target Apothecary Lydon
.isOnQuest 517
.group
step
.goto Hillsbrad Foothills,62.31,20.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达尔萨利亚(|cRXP_FRIENDLY_Darthalia|r)交谈
.turnin 541 >>交任务: |cRXP_FRIENDLY_希尔斯布莱德之战|r
.accept 550 >>接任务: |cRXP_LOOT_希尔斯布莱德之战|r
.target High Executor Darthalia
.isQuestComplete 541
.group
step
.goto Hillsbrad Foothills,62.31,20.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达尔萨利亚(|cRXP_FRIENDLY_Darthalia|r)交谈
.accept 550 >>接任务: |cRXP_LOOT_希尔斯布莱德之战|r
.target High Executor Darthalia
.isQuestTurnedIn 541
.group
step
.goto Hillsbrad Foothills,62.80,18.80
>>爬上旅馆的二楼, 然后点击|cRXP_PICK_布满灰尘的毯子|r
.turnin 524 >>交任务: |cRXP_FRIENDLY_苦楚药剂|r
.isQuestTurnedIn 517
.group
step
#completewith next
.goto Hillsbrad Foothills,60.14,18.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞斯|r交谈
.fly Undercity >>飞往幽暗城
.target Zarise
.zoneskip Undercity
.isOnQuest 550
.group
step
#completewith next
.goto Undercity,51.92,64.68,15 >>前往|cRXP_FRIENDLY_瓦里玛萨斯|r方向前进
.isOnQuest 550
.group
step
.goto Undercity,56.24,92.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
.turnin 550 >>交任务: |cRXP_FRIENDLY_希尔斯布莱德之战|r
.target Varimathras
.isOnQuest 550
.group
step << Druid
#completewith DruidTraining4
.cast 18960 >>施放 |T135758:0|t[传送:月光林地]
.zoneskip Moonglade
step << Druid
#optional
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 1823 >>训练你的职业法术
.target Loganaar
.xp <34,1
.xp >36,1
step << Druid
#label DruidTraining4
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 9005 >>训练你的职业法术
.target Loganaar
.xp <36,1
step
#completewith next
.hs >>炉石传送至乱风岗
.use 6948
step
.goto Thousand Needles,46.07,51.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板埃比克瓦|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Abeqwa
step
#optional
.abandon 541 >>接任务: |cRXP_WARN_希尔斯布莱德之战|r
.isOnQuest 541
step
#optional
.abandon 547 >>亨伯特的长剑
.isOnQuest 547
step
#optional
.abandon 517 >>苦楚药剂
.isOnQuest 517
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 34-35 闪光平原
#displayname 34-35 闪光平原 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 30-40
#next 35-37号凄凉之地(部落)
step
.goto Thousand Needles,45.70,50.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_峭壁卫兵图林·长角|r交谈
.accept 5361 >>接任务: |cRXP_LOOT_兄弟|r
.target Cliffwatcher Longhorn
step
.goto Thousand Needles,46.10,51.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|RXP_FRIENDLY_Rau|r交谈
.accept 1197 >>接任务: |cRXP_LOOT_神圣之火|r
.target Rau Cliffrunner
step << Hunter
.goto Thousand Needles,44.89,50.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯塔恩|r交谈
.vendor >>|cRXP_BUY_购买|r|T135495:0|t[|cRXP_FRIENDLY_笨重短弓|r]|cRXP_BUY_如果可用|r
.target Starn
.money <2.7172
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<14.2
step << Hunter
.goto Thousand Needles,44.89,50.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯塔恩|r交谈
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,2600,1146,1 
.target Starn
step
.goto Thousand Needles,45.15,50.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫塔尔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134937:0|t[卷轴]|cRXP_BUY_, 如果有的话|r << !Warrior
.vendor >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134937:0|t[卷轴]|cRXP_BUY_和|r|T134413:0|t[活根草]|cRXP_BUY_, 如果有的话|r << Warrior
.target Montarr
step
#completewith Clovenhoof2
.goto Thousand Needles,44.12,37.22,20 >>进入洞窟
step
#completewith Clovenhoof2
.goto Thousand Needles,44.44,36.32,12,0
.goto Thousand Needles,43.14,35.19,12,0
.goto Thousand Needles,42.11,34.54,12,0
.goto Thousand Needles,42.01,31.47,20 >>前往|cRXP_PICK_古代火盆|r
step
#label Clovenhoof2
.goto Thousand Needles,42.01,31.47
>>打开|cRXP_PICK_古代火盆|r, 拾取其中的|cRXP_LOOT_裂开的蹄子|r
>>|cRXP_WARN_小心！火盆由两名30级的|r|cRXP_ENEMY_加拉克烈焰守卫守护|r
.complete 1197,1 
.mob Galak Flame Guard
step << Shaman
#completewith next
.goto Thousand Needles,54.7,44.4,30 >>沿着这里的小坡跑上去
step << Shaman
.goto Thousand Needles,53.5,42.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Prate|r交谈
>>|cRXP_WARN_提交此任务可获得1小时增益效果, 移动速度提高40%, 攻击速度提高30%|r
.turnin 1531 >>交任务: |cRXP_FRIENDLY_空气的召唤|r
.target Prate Cloudseer
step
.goto Thousand Needles,67.58,63.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩克塔|r交谈
.turnin 1146 >>交任务: |cRXP_FRIENDLY_疯狂的虫群|r
.accept 1147 >>接任务: |cRXP_LOOT_疯狂的虫群|r
.target Moktar Krin
step
.goto Thousand Needles,77.79,77.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kravel|r交谈
.turnin 1112 >>交任务: |cRXP_FRIENDLY_给克拉维尔的零件|r
.timer 15,Parts for Kravel RP
.accept 1114 >>接任务: |cRXP_LOOT_侏儒的货物|r
.accept 1110 >>接任务: |cRXP_LOOT_火箭车零件|r
.target Kravel Koalbeard
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹尔|r和|cRXP_FRIENDLY_威兹尔|r交谈
.turnin 1114 >>交任务: |cRXP_FRIENDLY_侏儒的货物|r
.accept 1104 >>接任务: |cRXP_LOOT_含盐的蝎毒|r
.target +Fizzle Brassbolts
.goto Thousand Needles,78.07,77.13
.accept 1105 >>接任务: |cRXP_LOOT_硬化龟壳|r
.target +Wizzle Brassbolts
.goto Thousand Needles,78.14,77.12
step
.goto Thousand Needles,77.79,77.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kravel|r交谈
.accept 1115 >>接任务: |cRXP_LOOT_车手的传闻|r
.target Kravel Koalbeard
step
.goto Thousand Needles,80.18,75.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普兹克|r交谈
.accept 1176 >>接任务: |cRXP_LOOT_减轻负重|r
.target Pozzik
step
.goto Thousand Needles,81.64,77.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zherin|r交谈
.accept 1175 >>接任务: |cRXP_LOOT_安全隐患|r
.target Trackmaster Zherin
step
.goto Thousand Needles,69.66,85.97,150 >>前往锈锤挖掘场, 路上刷怪
.isOnQuest 1147
step
#completewith next
>>击杀|cRXP_ENEMY_异种侵略者|r和|cRXP_ENEMY_异种侵略者|r和|cRXP_ENEMY_异种侵略者|r
>>|cRXP_WARN_小心！它们被攻击时会呼叫求救, 你可能会意外引怪, 招来附近的多个怪物|r
.complete 1147,3 
.mob +Silithid Invader
.complete 1147,1 
.mob +Silithid Searcher
.complete 1147,2 
.mob +Silithid Hive Drone
step
#loop
.goto Thousand Needles,67.27,85.30,0
.goto Thousand Needles,67.27,85.30,50,0
.goto Thousand Needles,68.14,85.96,50,0
.goto Thousand Needles,68.03,86.93,50,0
.goto Thousand Needles,68.08,88.54,50,0
.goto Thousand Needles,69.48,89.64,50,0
.goto Thousand Needles,70.31,87.64,50,0
.goto Thousand Needles,71.09,86.23,50,0
.goto Thousand Needles,71.34,84.11,50,0
.goto Thousand Needles,70.51,82.80,50,0
.goto Thousand Needles,68.52,80.87,50,0
.goto Thousand Needles,67.45,82.28,50,0
>>击杀|cRXP_ENEMY_Silithid|r怪物以获得 |T135034:0|t[|cRXP_LOOT_破碎的异种蝎壳|r ]. 使用它来开启任务
.collect 5877,1,1148,1 
.accept 1148 >>接任务: |cRXP_LOOT_虫群的样本|r
.use 5877
step
#loop
.goto Thousand Needles,67.27,85.30,0
.goto Thousand Needles,67.27,85.30,50,0
.goto Thousand Needles,68.14,85.96,50,0
.goto Thousand Needles,68.03,86.93,50,0
.goto Thousand Needles,68.08,88.54,50,0
.goto Thousand Needles,69.48,89.64,50,0
.goto Thousand Needles,70.31,87.64,50,0
.goto Thousand Needles,71.09,86.23,50,0
.goto Thousand Needles,71.34,84.11,50,0
.goto Thousand Needles,70.51,82.80,50,0
.goto Thousand Needles,68.52,80.87,50,0
.goto Thousand Needles,67.45,82.28,50,0
>>击杀|cRXP_ENEMY_异种侵略者|r和|cRXP_ENEMY_异种搜寻者|r和|cRXP_ENEMY_异种筑巢蝎|r. 掠夺他们的|cRXP_LOOT_心脏|r和|cRXP_LOOT_利爪|r和|cRXP_LOOT_甲壳|r
>>|cRXP_WARN_小心！它们被攻击时会呼叫求救, 你可能会意外引怪, 招来附近的多个怪物|r
.complete 1147,3 
.mob +Silithid Invader
.complete 1147,1 
.mob +Silithid Searcher
.complete 1147,2 
.mob +Silithid Hive Drone
.complete 1148,1 
.mob +Silithid Invader
.mob +Silithid Searcher
.mob +Silithid Hive Drone
.complete 1148,2 
.mob +Silithid Invader
.mob +Silithid Searcher
.mob +Silithid Hive Drone
.complete 1148,3 
.mob +Silithid Invader
.mob +Silithid Searcher
.mob +Silithid Hive Drone
step
#completewith ShimmeringFlatsLoop
+|cRXP_WARN_小心！|r|cRXP_ENEMY_盐湖秃鹫|r|cRXP_WARN_可造成致命打击. 保持生命值高于20%！|r
step
#completewith next
.goto Thousand Needles,67.58,63.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回至|cRXP_FRIENDLY_Moktar|r
.turnin 1147 >>交任务: |cRXP_FRIENDLY_疯狂的虫群|r
.target Moktar Krin
step
#label ShimmeringFlatsLoop
>>|cRXP_WARN_在闪光平原上绕圈跑, 直到完成所有目标|r
>>击杀|cRXP_ENEMY_盐湖食腐鹫|r 和|cRXP_ENEMY_盐湖秃鹫|r . 搜刮它们获取|cRXP_LOOT_Bones|r
>>击杀|cRXP_ENEMY_盐壳龟|r和|cRXP_ENEMY_盐壳掘地龟|r和|cRXP_ENEMY_盐壳钳嘴龟|r, 掠夺它们的|cRXP_LOOT_Shells|r
>>击杀|cRXP_ENEMY_恐蝎劫掠者|r 和|cRXP_ENEMY_恐蝎|r , 击败它们后可获得其|cRXP_LOOT_毒液|r
>>击杀|cRXP_ENEMY_盐石蜥蜴|r和|cRXP_ENEMY_盐石水晶蜥蜴|r和|cRXP_ENEMY_盐石凝视者|r
>>打开|cRXP_PICK_火箭车碎片|r, 从中拾取|cRXP_LOOT_火箭车零件|r
.complete 1176,1 
.mob +Salt Flats Scavenger
.mob +Salt Flats Vulture
.goto Thousand Needles,87.5,65.6,0
.complete 1105,1 
.mob +Sparkleshell Snapper
.mob +Sparkleshell Borer
.mob +Sparkleshell Tortoise
.goto Thousand Needles,82.6,54.8,0
.complete 1104,1 
.mob +Scorpid Reaver
.mob +Scorpid Terror
.goto Thousand Needles,71.8,73.4,0
.complete 1175,1 
.mob +Saltstone Basilisk
.goto Thousand Needles,73.5,59.9,0
.complete 1175,2 
.mob +Saltstone Crystalhide
.goto Thousand Needles,77.65,87.34,0
.complete 1175,3 
.mob +Saltstone Gazer
.goto Thousand Needles,77.65,87.34,0
.complete 1110,1 
step
.goto Thousand Needles,67.58,63.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回至|cRXP_FRIENDLY_Moktar|r
.turnin 1147 >>交任务: |cRXP_FRIENDLY_疯狂的虫群|r
.target Moktar Krin
step
.goto Thousand Needles,77.79,77.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回|cRXP_FRIENDLY_Kravel|r
.turnin 1110 >>交任务: |cRXP_FRIENDLY_火箭车零件|r
.accept 5762 >>接任务: |cRXP_WARN_赫米特·奈辛瓦里|r
.target Kravel Koalbeard
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹尔|r和|cRXP_FRIENDLY_威兹尔|r交谈
.turnin 1104 >>交任务: |cRXP_FRIENDLY_含盐的蝎毒|r
.goto Thousand Needles,78.07,77.13
.turnin 1105 >>交任务: |cRXP_FRIENDLY_硬化龟壳|r
.target +Wizzle Brassbolts
.goto Thousand Needles,78.14,77.12
.accept 1106 >>接任务: |cRXP_LOOT_流放者马特克|r
.target +Fizzle Brassbolts
.goto Thousand Needles,78.07,77.13
step
#ah << !Warlock !Druid !Shaman
.goto Thousand Needles,78.14,77.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维兹尔·铜栓|r谈话
.accept 1107 >>接任务: |cRXP_WARN_坚硬的尾鳍|r
.target Wizzle Brassbolts
.group
step
.goto Thousand Needles,80.18,75.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普兹克|r交谈
.turnin 1176 >>交任务: |cRXP_FRIENDLY_减轻负重|r
.accept 1178 >>接任务: |cRXP_LOOT_地精赞助商|r
.target Pozzik
step
.goto Thousand Needles,81.63,77.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zherin|r交谈
.turnin 1175 >>交任务: |cRXP_FRIENDLY_安全隐患|r
.target Trackmaster Zherin
step
.goto Thousand Needles,75.44,97.37,40,0
.goto Tanaris,51.60,25.44,100 >>前往: |cRXP_PICK_塔纳利斯|r
step
#optional
#completewith next
.goto Tanaris,51.61,25.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Freewind Post >>飞往乱风岗
.target Bulkrek Ragefist
.isQuestComplete 1197
step
#optional
.goto Thousand Needles,46.10,51.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|RXP_FRIENDLY_Rau|r交谈
.turnin 1197 >>交任务: |cRXP_FRIENDLY_神圣之火|r
.target Rau Cliffrunner
.isQuestComplete 1197
step
#optional
#completewith SetHSCampT
.goto Thousand Needles,45.14,49.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈瑟|r交谈
.fly Camp Taurajo >>飞往陶拉霍营地
.target Nyse
.zoneskip Thousand Needles,1
step
#completewith next
.goto Tanaris,51.61,25.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Camp Taurajo >>飞往陶拉霍营地
.target Bulkrek Ragefist
.zoneskip Tanaris,1
step
#label SetHSCampT
.goto The Barrens,45.60,59.0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
.home >>将你的炉石设置为陶拉祖营地
.target Innkeeper Byula
step
#completewith next
.goto The Barrens,44.45,59.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
.fly Crossroads >>飞往十字路口
.target Omusa Thunderhorn
step
.goto The Barrens,51.10,29.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科兰|r交谈
.turnin 1148 >>交任务: |cRXP_FRIENDLY_虫群的消息|r
.accept 1184 >>接任务: |cRXP_LOOT_虫群的样本|r
.target Korran
step
#completewith next
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.fly Ratchet >>飞往棘齿城
.target Devrak
step
.goto The Barrens,62.68,37.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_兹科尔|r交谈
.bankdeposit 4306,15 >>将 15 |T132905:0|t[丝绸布] 存入你的银行
.target Zikkel
step
.goto The Barrens,62.68,36.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹鲁维|r交谈
.turnin 1178 >>交任务: |cRXP_FRIENDLY_地精赞助商|r
.accept 1180 >>接任务: |cRXP_LOOT_地精赞助商|r
.target Gazlowe
step << Shaman
.goto The Barrens,65.83,43.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水之先知伊斯伦|r交谈
.turnin 96 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.target Islen Waterseer
step
#completewith next
.goto The Barrens,63.74,38.66
.zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
.zoneskip Stranglethorn Vale
step
.goto Stranglethorn Vale,26.30,73.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lozgil|r交谈
.turnin 1180 >>交任务: |cRXP_FRIENDLY_地精赞助商|r
.accept 1181 >>接任务: |cRXP_LOOT_地精赞助商|r
.target Wharfmaster Lozgil
step
.goto Stranglethorn Vale,28.30,77.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_崔斯里克|r交谈
.accept 575 >>接任务: |cRXP_LOOT_供与求|r
.target Drizzlik
step << Warrior/Shaman
.goto Stranglethorn Vale,28.34,75.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_泽琳娜|r|cRXP_BUY_交谈. 如果她有货, 可以购买|r|T135158:0|t[大棍子] |cRXP_BUY_或|r|T135144:0|t[保护法杖] |r
.collect 12251,1,1115,1 
.collect 12252,1,1115,1 
.money <5.3896
.target Zarena Cromwind
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<25.6
step
.goto Stranglethorn Vale,27.10,77.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与酒馆内的|cRXP_FRIENDLY_Crank|r交谈
.accept 605 >>接任务: |cRXP_LOOT_歌唱水晶碎片|r
.target Crank Fizzlebub
step << Rogue
.goto Stranglethorn Vale,26.82,77.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_Ian|r交谈
.train 8696 >>训练你的职业法术
.target Ian Strom
.xp <34,1
.xp >36,1
step << Rogue
#optional
.goto Stranglethorn Vale,26.82,77.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_Ian|r交谈
.train 8691 >>训练你的职业法术
>>|T132273:0|t[速效药膏等级3]|cRXP_WARN_需要毒药技能达到160级！|r
.target Ian Strom
.xp <36,1
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店三楼的|cRXP_FRIENDLY_克拉兹克|r和|cRXP_FRIENDLY_科博克|r交谈
.turnin 1115 >>交任务: |cRXP_FRIENDLY_车手的传闻|r
.accept 201 >>接任务: |cRXP_LOOT_调查营地|r
.target +Krazek
.goto Stranglethorn Vale,26.94,77.21
.accept 189 >>接任务: |cRXP_LOOT_血顶巨魔的耳朵|r
.accept 213 >>接任务: |cRXP_LOOT_恶性竞争|r
.target +Kebok
.goto Stranglethorn Vale,27.00,77.13
step
.goto Stranglethorn Vale,27.20,76.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与三楼阳台的|cRXP_FRIENDLY_男爵|r交谈
.turnin 1181 >>交任务: |cRXP_FRIENDLY_地精赞助商|r
.accept 1182 >>接任务: |cRXP_LOOT_地精赞助商|r
.target Baron Revilgaz
step
.goto Stranglethorn Vale,26.90,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在阳台拐角处找|cRXP_FRIENDLY_格林戈|r交谈
.fp Booty Bay >>获取藏宝海湾的飞行路径
.target Gringer
step
.goto Stranglethorn Vale,28.14,78.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Glyx交谈|r
.vendor >>|cRXP_BUY_购买|r|T134832:0|t[强效治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Glyx Brewright
step
#completewith next
.hs >>返回陶拉祖营地
.use 6948
step
.goto The Barrens,44.45,59.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
.fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
.target Omusa Thunderhorn
.zoneskip Thunder Bluff
step
.goto Thunder Bluff,45.81,64.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
.home >>将你的炉石设置为雷霆崖
.target Innkeeper Pala
step << Druid
.goto Thunder Bluff,76.46,27.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
.train 1823 >>训练你的职业法术
.target Turak Runetotem
.xp <34,1
.xp >36,1
step << Druid
#optional
.goto Thunder Bluff,76.46,27.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
.train 1823 >>训练你的职业法术
.target Turak Runetotem
.xp <36,1
step << Hunter
.goto Thunder Bluff,59.11,86.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 13552 >>训练你的职业法术
.target Urek Thunderhorn
.xp <34,1
.xp >36,1
step << Hunter
#optional
.goto Thunder Bluff,59.11,86.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 14284 >>训练你的职业法术
.target Urek Thunderhorn
.xp <36,1
step << Hunter
.goto Thunder Bluff,54.08,84.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hesuwa|r交谈
.train 24560 >>训练你的宠物法术
.target Hesuwa Thunderhorn
.xp <36,1
step << Warrior
.goto Thunder Bluff,57.56,85.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
.train 11554 >>训练你的职业法术
.target Ker Ragetotem
.xp <34,1
.xp >36,1
step << Warrior
#optional
.goto Thunder Bluff,57.56,85.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
.train 1680 >>训练你的职业法术
.target Ker Ragetotem
.xp <36,1
step << Shaman
.goto Thunder Bluff,22.84,21.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 16314 >>训练你的职业法术
.target Tigor Skychaser
.xp <34,1
.xp >36,1
step << Shaman
#optional
.goto Thunder Bluff,22.84,21.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 10412 >>训练你的职业法术
.target Tigor Skychaser
.xp <36,1
step << Priest
.goto Thunder Bluff,24.56,22.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马拉凯|r交谈
.train 2767 >>训练你的职业法术
.target Malakai Cross
.xp <34,1
.xp >36,1
step << Priest
#optional
.goto Thunder Bluff,24.56,22.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马拉凯|r交谈
.train 15264 >>训练你的职业法术
.target Malakai Cross
.xp <36,1
step << Mage
.goto Thunder Bluff,25.18,20.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thurston|r交谈
.train 8492 >>训练你的职业法术
.target Thurston Xane
.xp <34,1
.xp >36,1
step << Mage
#optional
.goto Thunder Bluff,25.18,20.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thurston|r交谈
.train 8495 >>训练你的职业法术
.target Thurston Xane
.xp <36,1
step
#ah
.goto Thunder Bluff,40.39,51.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Stampi|r交谈
.collect 13545,10,5386,1 
.target Auctioneer Stampi
step
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Sun Rock >>飞往石爪山脉
.target Tal
.zoneskip Stonetalon Mountains
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 37-39 北荆棘谷
#displayname 37-39 北荆棘谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 30-40
#next 39-39 尘泥沼泽
step
.goto Stranglethorn Vale,32.20,28.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官Aggro'gosh|r交谈
.accept 568 >>接任务: |cRXP_LOOT_格罗姆高保卫战|r
.target Commander Aggro'gosh
step
.goto Stranglethorn Vale,32.20,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kin'weelay|r交谈
.accept 596 >>接任务: |cRXP_LOOT_染血的白骨项链|r
.target Kin'weelay
step
.goto Stranglethorn Vale,32.20,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼姆布亚|r交谈
.accept 581 >>接任务: |cRXP_LOOT_耶尼库的下落|r
.target Nimboya
step
#completewith next
.subzone 100 >>前往内辛瓦里的远征队
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Barnil|r和|cRXP_FRIENDLY_Hemet|r和|cRXP_FRIENDLY_Ajeck|r和|cRXP_FRIENDLY_S. J. Erlgadin|r交谈
.accept 583 >>接任务: |cRXP_LOOT_欢迎来到丛林|r
.target +Barnil Stonepot
.goto Stranglethorn Vale,35.66,10.53
.turnin 583 >>交任务: |cRXP_FRIENDLY_欢迎来到丛林|r
.turnin 5762 >>交任务: |cRXP_FRIENDLY_赫米特·奈辛瓦里|r
.turnin 5763 >>交任务: |cRXP_FRIENDLY_荆棘谷狩猎|r
.accept 194 >>接任务: |cRXP_LOOT_猎龙|r
.target +Hemet Nesingwary
.goto Stranglethorn Vale,35.66,10.81
.accept 185 >>接任务: |cRXP_LOOT_猎虎|r
.target +Ajeck Rouack
.goto Stranglethorn Vale,35.62,10.62
.accept 190 >>接任务: |cRXP_LOOT_猎豹|r
.target +Sir S. J. Erlgadin
.goto Stranglethorn Vale,35.56,10.55
step
#completewith YoungPanthers
>>沿河击杀淡水鳄(|cRXP_ENEMY_River Crocolisks|r). 击杀后可掠夺其|cRXP_LOOT_Skin|r皮肤
.complete 575,1 
.mob River Crocolisk
step
#completewith YoungPanthers
>>击杀|cRXP_ENEMY_荆棘谷猛虎幼崽|r
.complete 185,1 
.mob Young Stranglethorn Tiger
step
#label YoungPanthers
#loop
.goto Stranglethorn Vale,41.48,13.18,0
.goto Stranglethorn Vale,36.82,10.25,60,0
.goto Stranglethorn Vale,36.66,11.88,60,0
.goto Stranglethorn Vale,37.70,14.44,60,0
.goto Stranglethorn Vale,39.26,14.53,60,0
.goto Stranglethorn Vale,41.01,13.63,60,0
.goto Stranglethorn Vale,41.48,13.18,60,0
.goto Stranglethorn Vale,42.29,13.14,60,0
.goto Stranglethorn Vale,43.06,12.26,60,0
.goto Stranglethorn Vale,42.86,10.49,60,0
.goto Stranglethorn Vale,41.99,10.21,60,0
.goto Stranglethorn Vale,41.04,9.37,60,0
.goto Stranglethorn Vale,40.26,10.04,60,0
.goto Stranglethorn Vale,39.96,11.55,60,0
.goto Stranglethorn Vale,40.42,12.35,60,0
.goto Stranglethorn Vale,40.96,13.65,60,0
>>击杀|cRXP_ENEMY_猎豹幼崽|r
.complete 190,1 
.mob Young Panther
step << Warrior
#loop
.goto Stranglethorn Vale,43.99,11.95,0
.goto Stranglethorn Vale,43.99,11.95,50,0
.goto Stranglethorn Vale,44.73,11.46,50,0
.goto Stranglethorn Vale,45.21,11.05,50,0
.goto Stranglethorn Vale,45.19,9.53,50,0
.goto Stranglethorn Vale,44.83,8.60,50,0
.goto Stranglethorn Vale,43.91,8.74,50,0
.goto Stranglethorn Vale,43.50,9.72,50,0
.goto Stranglethorn Vale,43.95,10.50,50,0
>>前往库尔森营地. 击杀库尔森药剂师. 从他们身上搜刮出[活根草]
>>|cRXP_WARN_你也可以从拍卖行购买活根草来替代|r
>>|cRXP_WARN_丛林战士和巫医共享刷新点, 因此你必须同时击杀两者|r
.collect 3357,8 
.mob Kurzen Jungle Fighter
.mob Kurzen Medicine Man
step
#completewith next
>>沿河击杀淡水鳄(|cRXP_ENEMY_River Crocolisks|r). 击杀后可掠夺其|cRXP_LOOT_Skin|r皮肤
.complete 575,1 
.mob River Crocolisk
step
#loop
.goto Stranglethorn Vale,34.07,11.34,0
.goto Stranglethorn Vale,38.82,14.20,60,0
.goto Stranglethorn Vale,37.04,13.94,60,0
.goto Stranglethorn Vale,35.58,12.38,60,0
.goto Stranglethorn Vale,33.59,12.20,60,0
.goto Stranglethorn Vale,32.67,10.15,60,0
.goto Stranglethorn Vale,31.42,8.48,60,0
.goto Stranglethorn Vale,33.47,10.25,60,0
.goto Stranglethorn Vale,34.07,11.34,60,0
>>击杀|cRXP_ENEMY_荆棘谷猛虎幼崽|r
.complete 185,1 
.mob Young Stranglethorn Tiger
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ajeck|r和|cRXP_FRIENDLY_S. J. Erlgadin|r交谈
.turnin 185 >>交任务: |cRXP_FRIENDLY_猎虎|r
.accept 186 >>接任务: |cRXP_LOOT_猎虎|r
.target +Ajeck Rouack
.goto Stranglethorn Vale,35.62,10.62
.turnin 190 >>交任务: |cRXP_FRIENDLY_猎豹|r
.accept 191 >>接任务: |cRXP_LOOT_猎豹|r
.target +Sir S. J. Erlgadin
.goto Stranglethorn Vale,35.56,10.55
step
#completewith RaptorsPart1
>>沿河击杀淡水鳄(|cRXP_ENEMY_River Crocolisks|r). 击杀后可掠夺其|cRXP_LOOT_Skin|r皮肤
.complete 575,1 
.mob River Crocolisk
step
#loop
.goto Stranglethorn Vale,31.00,11.20,0
.goto Stranglethorn Vale,31.00,11.20,60,0
.goto Stranglethorn Vale,29.70,8.90,60,0
.goto Stranglethorn Vale,28.40,12.30,60,0
.goto Stranglethorn Vale,28.80,13.60,60,0
.goto Stranglethorn Vale,28.50,16.90,60,0
.goto Stranglethorn Vale,30.60,13.90,60,0
>>击杀 |cRXP_ENEMY_黑豹|r和 |cRXP_ENEMY_荆棘谷猛虎|r
.complete 191,1 
.mob +Panther
.complete 186,1 
.mob +Stranglethorn Tiger
step
#label RaptorsPart1
#loop
.goto Stranglethorn Vale,28.08,15.41,0
.goto Stranglethorn Vale,28.08,15.41,60,0
.goto Stranglethorn Vale,27.82,16.35,60,0
.goto Stranglethorn Vale,27.18,16.81,60,0
.goto Stranglethorn Vale,26.28,16.70,60,0
.goto Stranglethorn Vale,25.39,16.33,60,0
.goto Stranglethorn Vale,23.71,15.44,60,0
.goto Stranglethorn Vale,25.69,15.71,60,0
.goto Stranglethorn Vale,26.61,15.85,60,0
.goto Stranglethorn Vale,27.24,15.14,60,0
.goto Stranglethorn Vale,27.80,14.33,60,0
>>击杀|cRXP_ENEMY_荆棘谷迅猛龙|r
.complete 194,1 
.mob Stranglethorn Raptor
step
#completewith NesingwaryTurnIns
.goto Stranglethorn Vale,35.55,10.55,80 >>返回奈辛瓦里远征队
step
#label NesingwaryTurnIns
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_S. J. Erlgadin|r和|cRXP_FRIENDLY_Ajeck|r和|cRXP_FRIENDLY_Hemet|r交谈
.turnin 191 >>交任务: |cRXP_FRIENDLY_猎豹|r
.accept 192 >>接任务: |cRXP_LOOT_猎豹|r
.target +Sir S. J. Erlgadin
.goto Stranglethorn Vale,35.55,10.55
.turnin 186 >>交任务: |cRXP_FRIENDLY_猎虎|r
.accept 187 >>接任务: |cRXP_LOOT_猎虎|r
.target +Ajeck Rouack
.goto Stranglethorn Vale,35.61,10.62
.turnin 194 >>交任务: |cRXP_FRIENDLY_猎龙|r
.accept 195 >>接任务: |cRXP_LOOT_猎龙|r
.target +Hemet Nesingwary
.goto Stranglethorn Vale,35.66,10.81
step
#loop
.goto Stranglethorn Vale,39.8,14.4,0
.goto Stranglethorn Vale,32.4,8.8,90,0
.goto Stranglethorn Vale,34.4,8.2,90,0
.goto Stranglethorn Vale,36.8,10.4,90,0
.goto Stranglethorn Vale,39.8,11.4,90,0
.goto Stranglethorn Vale,39.8,14.4,90,0
>>沿河击杀淡水鳄(|cRXP_ENEMY_River Crocolisks|r). 击杀后可掠夺其|cRXP_LOOT_Skin|r皮肤
.complete 575,1 
.mob River Crocolisk
step
#completewith next
>>击杀你遇到的每一只|r老年荆棘谷猛虎|cRXP_ENEMY_Elder Stranglethorn Tiger|r
.complete 187,1 
.mob Elder Stranglethorn Tiger
step
#loop
.goto Stranglethorn Vale,33.90,15.60,0
.goto Stranglethorn Vale,33.90,15.60,50,0
.goto Stranglethorn Vale,33.20,13.70,50,0
.goto Stranglethorn Vale,28.80,19.60,50,0
.goto Stranglethorn Vale,29.80,19.40,50,0
.goto Stranglethorn Vale,30.60,18.90,50,0
>>击杀血皮巨魔. 掠夺他们的獠牙和耳朵和项链
.complete 581,1 
.complete 189,1 
.disablecheckbox
.complete 596,1 
.disablecheckbox
.mob Bloodscalp Warrior
.mob Bloodscalp Axe Thrower
.mob Bloodscalp Shaman
step
#loop
.goto Stranglethorn Vale,32.10,15.80,0
.goto Stranglethorn Vale,32.10,15.80,60,0
.goto Stranglethorn Vale,31.40,18.40,60,0
.goto Stranglethorn Vale,31.80,20.00,60,0
.goto Stranglethorn Vale,34.20,17.60,60,0
>>完成击杀|cRXP_ENEMY_老年荆棘谷猛虎|r
.complete 187,1 
.mob Elder Stranglethorn Tiger
step
#loop
.goto Stranglethorn Vale,31.90,20.90,0
.goto Stranglethorn Vale,31.90,20.90,60,0
.goto Stranglethorn Vale,30.40,24.70,60,0
.goto Stranglethorn Vale,32.50,23.40,60,0
.goto Stranglethorn Vale,34.10,25.50,60,0
.goto Stranglethorn Vale,36.00,26.80,60,0
.goto Stranglethorn Vale,38.90,25.10,60,0
.goto Stranglethorn Vale,38.10,28.10,60,0
>>击杀|cRXP_ENEMY_鞭尾迅猛龙|r
>>|cRXP_WARN_注意他们的眩晕和缴械技能|r
.complete 568,1 
.complete 195,1 
.mob Lashtail Raptor
step
#completewith next
.subzone 117 >>返回格罗姆高营地
step
.goto Stranglethorn Vale,32.2,27.8
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼姆布亚|r交谈
.turnin 581 >>交任务: |cRXP_FRIENDLY_耶尼库的下落|r
.accept 582 >>接任务: |cRXP_LOOT_猎头行动|r
.target Nimboya
step
.goto Stranglethorn Vale,32.20,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kin'weelay|r交谈
.accept 629 >>接任务: |cRXP_LOOT_暗礁海|r
.target Kin'weelay
step
.goto Stranglethorn Vale,32.17,28.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官Aggro'gosh|r交谈
.turnin 568 >>交任务: |cRXP_FRIENDLY_格罗姆高保卫战|r
.accept 569 >>接任务: |cRXP_LOOT_格罗姆高保卫战|r
.target Commander Aggro'gosh
step << Hunter
.goto Stranglethorn Vale,31.55,27.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤索克|r交谈
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,2600,629,1 
.target Uthok
step << Hunter
.goto Stranglethorn Vale,31.23,28.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克拉格|r交谈
.train 14303 >>训练你的职业法术
.target Kragg
.xp <36,1
.xp >38,1
step << Hunter
#optional
.goto Stranglethorn Vale,31.23,28.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克拉格|r交谈
.train 14320 >>训练你的职业法术
.target Kragg
.xp <38,1
step
#completewith next
.goto Stranglethorn Vale,24.77,22.85
>>掠夺|cRXP_PICK_游荡者格里雷克|r以获得|cRXP_LOOT_石板碎片|r
.complete 629,1 
.group 3
step
#ah << !Warlock !Druid !Shaman
#loop
.goto Stranglethorn Vale,26.80,26.00,0
.goto Stranglethorn Vale,24.92,23.59,60,0
.goto Stranglethorn Vale,23.40,24.49,60,0
.goto Stranglethorn Vale,23.71,25.90,60,0
.goto Stranglethorn Vale,25.46,25.61,60,0
.goto Stranglethorn Vale,25.31,24.59,60,0
.goto Stranglethorn Vale,26.80,26.00,60,0
.use 5996 >>饮用 |T134797:0|t[水下呼吸药剂] << !Warlock !Druid !Shaman
>>击杀|cRXP_ENEMY_鱼人|r. 掠夺他们的|cRXP_LOOT_尾鳍|r
.complete 1107,1 
.mob Saltscale Forager
.mob Saltscale Warrior
.mob Saltscale Hunter
.mob Saltscale Oracle
.mob Saltscale Tide Lord
.itemcount 5996,1 << !Warlock !Druid !Shaman
.group 3
step
.goto Stranglethorn Vale,24.77,22.85
>>掠夺|cRXP_PICK_游荡者格里雷克|r以获得|cRXP_LOOT_石板碎片|r
>>|cRXP_WARN_墙壁两侧各有一块石碑, 拾取墙外的那块即可, 这样就不会激怒任何精英|r|cRXP_ENEMY_Saltscale 盐鳞鱼人|r
.complete 629,1 
step
#loop
.goto Stranglethorn Vale,27.37,18.62,0
.goto Stranglethorn Vale,27.37,18.62,60,0
.goto Stranglethorn Vale,25.94,18.20,60,0
.goto Stranglethorn Vale,24.84,17.26,60,0
.goto Stranglethorn Vale,23.22,16.89,60,0
.goto Stranglethorn Vale,23.21,18.35,60,0
.goto Stranglethorn Vale,24.80,18.98,60,0
.goto Stranglethorn Vale,26.97,19.78,60,0
>>击杀|cRXP_ENEMY_晶背蜥蜴|r. 击败它们后可获得其掉落的|cRXP_LOOT_水晶碎片|r
>>|cRXP_WARN_你必须来回往返此处, 以触发动态刷新|r
.complete 605,1 
.mob Crystal Spine Basilisk
step << Warrior
#loop
.goto Stranglethorn Vale,20.38,13.94,0
.goto Stranglethorn Vale,20.38,13.94,50,0
.goto Stranglethorn Vale,20.81,12.74,50,0
.goto Stranglethorn Vale,21.00,10.81,50,0
.goto Stranglethorn Vale,20.06,11.88,50,0
.goto Stranglethorn Vale,19.36,11.81,50,0
.goto Stranglethorn Vale,19.67,13.31,50,0
>>击杀|cRXP_ENEMY_Bloodscalp 巨魔|r. 击杀后搜刮他们的|cRXP_LOOT_Ears|r和|cRXP_LOOT_Heads|r和|cRXP_LOOT_Necklaces|r和|cRXP_LOOT_Tusks|r
>>|T133730:0|t[|cRXP_LOOT_皱缩的头颅|r] |cRXP_WARN_仅由|r |cRXP_ENEMY_血顶猎头者|r掉落
.complete 189,1 
.complete 582,1 
.complete 596,1 
.complete 1712,2 
.mob Bloodscalp Witch Doctor
.mob Bloodscalp Berserker
.mob Bloodscalp Headhunter
step << !Warrior
#loop
.goto Stranglethorn Vale,20.38,13.94,0
.goto Stranglethorn Vale,20.38,13.94,50,0
.goto Stranglethorn Vale,20.81,12.74,50,0
.goto Stranglethorn Vale,21.00,10.81,50,0
.goto Stranglethorn Vale,20.06,11.88,50,0
.goto Stranglethorn Vale,19.36,11.81,50,0
.goto Stranglethorn Vale,19.67,13.31,50,0
>>击杀|cRXP_ENEMY_Bloodscalp 巨魔|r. 击杀后搜刮他们的|cRXP_LOOT_Ears|r和|cRXP_LOOT_Heads|r和|cRXP_LOOT_Necklaces|r
>>|T133730:0|t[皱缩的头颅]|cRXP_WARN_仅由|r|cRXP_ENEMY_血顶猎头者|r掉落
.complete 189,1 
.complete 582,1 
.complete 596,1 
.mob Bloodscalp Witch Doctor
.mob Bloodscalp Berserker
.mob Bloodscalp Headhunter
step
#completewith next
.subzone 117 >>返回格罗姆高营地
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼姆布亚|r和|cRXP_FRIENDLY_金韦拉|r交谈
.turnin 582 >>交任务: |cRXP_FRIENDLY_猎头行动|r
.target +Nimboya
.goto Stranglethorn Vale,32.16,27.72
.turnin 596 >>交任务: |cRXP_FRIENDLY_染血的白骨项链|r
.turnin 629 >>交任务: |cRXP_FRIENDLY_暗礁海|r
.target +Kin'weelay
.goto Stranglethorn Vale,32.27,27.70
step
#completewith next
.goto Stranglethorn Vale,32.5,29.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞斯塔|r交谈
.fly Booty Bay >>飞往藏宝海湾
.target Thysta
step
.goto Stranglethorn Vale,28.29,77.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_崔斯里克|r交谈
.turnin 575 >>交任务: |cRXP_FRIENDLY_供与求|r
.accept 577 >>接任务: |cRXP_LOOT_收集鳄鱼皮|r
.target Drizzlik
step
.goto Stranglethorn Vale,28.14,78.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Glyx交谈|r
.vendor >>|cRXP_BUY_购买|r|T134832:0|t[强效治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Glyx Brewright
.subzoneskip 35,1
step
.goto Stranglethorn Vale,26.87,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格林戈|r交谈
.fly Grom'gol >>飞往格罗姆高营地
.target Gringer
.subzoneskip 35,1
step
.goto Stranglethorn Vale,32.12,29.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知莫克塔尔丁|r交谈
.accept 570 >>接任务: |cRXP_LOOT_摩克萨尔丁的魔法|r
.target Far Seer Mok'thardin
step
#loop
.goto Stranglethorn Vale,36.49,31.61,0
.goto Stranglethorn Vale,36.49,31.61,50,0
.goto Stranglethorn Vale,37.28,30.96,50,0
.goto Stranglethorn Vale,38.04,29.61,50,0
.goto Stranglethorn Vale,36.88,29.69,50,0
.goto Stranglethorn Vale,35.60,30.62,50,0
>>击杀 |cRXP_ENEMY_Mosh'Ogg Brutes|r 和 |cRXP_ENEMY_Mosh'Ogg Witch Doctors|r
>>|cRXP_WARN_击杀|r|cRXP_ENEMY_老虎|r|cRXP_WARN_和|r|cRXP_ENEMY_黑豹|r|cRXP_WARN_在河对岸|r|cRXP_WARN_等待重生时|r
.complete 569,1 
.mob +Mosh'Ogg Brute
.complete 569,2 
.mob +Mosh'Ogg Witch Doctor
step
#loop
.goto Stranglethorn Vale,42.6,17.2,0
.goto Stranglethorn Vale,38.0,32.4,50,0
.goto Stranglethorn Vale,38.8,28.4,50,0
.goto Stranglethorn Vale,40.4,24.4,50,0
.goto Stranglethorn Vale,40.4,22.8,50,0
.goto Stranglethorn Vale,39.4,21.6,50,0
.goto Stranglethorn Vale,39.8,16.6,50,0
.goto Stranglethorn Vale,42.6,17.2,50,0
>>击杀沿河的|cRXP_ENEMY_钳嘴鳄鱼|r, 从它们身上搜刮出|cRXP_LOOT_皮毛|r
.complete 577,1 
.mob Snapjaw Crocolisk
step
#completewith CozzleBl
>>击杀|cRXP_ENEMY_风险投资公司地质学家|r. 击杀后可掠夺其持有的|cRXP_LOOT_水晶|r
.complete 213,1 
.mob Venture Co. Geologist
step
.goto Stranglethorn Vale,42.74,18.04,40,0
.goto Stranglethorn Vale,42.10,18.33,12,0
.goto Stranglethorn Vale,42.29,18.98,12,0
.goto Stranglethorn Vale,42.51,18.82,12,0
.goto Stranglethorn Vale,42.66,18.36
>>攀上钻油平台顶层, 然后击杀|cRXP_ENEMY_工头考兹尔|r, 搜刮他的|cRXP_LOOT_钥匙|r
.collect 5851,1 
.unitscan Foreman Cozzle
.isOnQuest 1182
step
#label CozzleBl
.goto Stranglethorn Vale,43.33,20.33
>>进入锯木厂旁边的房屋, 然后搜刮|cRXP_PICK_考兹尔的箱子|r获取|cRXP_LOOT_蓝图|r
.complete 1182,1 
step
#loop
.goto Stranglethorn Vale,36.49,31.61,0
.goto Stranglethorn Vale,36.49,31.61,50,0
.goto Stranglethorn Vale,37.28,30.96,50,0
.goto Stranglethorn Vale,38.04,29.61,50,0
.goto Stranglethorn Vale,36.88,29.69,50,0
.goto Stranglethorn Vale,35.60,30.62,50,0
>>返回米扎哈遗迹, 完成击杀|cRXP_ENEMY_Mosh'Ogg Brutes|r和|cRXP_ENEMY_Mosh'Ogg Witch Doctors|r
.complete 569,1 
.mob +Mosh'Ogg Brute
.complete 569,2 
.mob +Mosh'Ogg Witch Doctor
step
#loop
.goto Stranglethorn Vale,43.26,21.05,0
.goto Stranglethorn Vale,43.26,21.05,60,0
.goto Stranglethorn Vale,42.58,22.00,60,0
.goto Stranglethorn Vale,43.78,22.80,60,0
.goto Stranglethorn Vale,44.42,23.55,60,0
.goto Stranglethorn Vale,45.38,23.28,60,0
.goto Stranglethorn Vale,46.29,23.45,60,0
.goto Stranglethorn Vale,46.26,21.94,60,0
.goto Stranglethorn Vale,47.02,20.02,60,0
.goto Stranglethorn Vale,46.67,19.13,60,0
.goto Stranglethorn Vale,46.34,18.00,60,0
.goto Stranglethorn Vale,45.27,17.76,60,0
.goto Stranglethorn Vale,44.89,16.79,60,0
.goto Stranglethorn Vale,44.44,16.19,60,0
.goto Stranglethorn Vale,43.60,15.80,60,0
.goto Stranglethorn Vale,43.39,17.63,60,0
.goto Stranglethorn Vale,43.65,19.32,60,0
>>击杀|cRXP_ENEMY_风险投资公司地质学家|r. 掠夺他们的|cRXP_LOOT_水晶|r
.complete 213,1 
.mob Venture Co. Geologist
step
#loop
.goto Stranglethorn Vale,43.26,21.05,0
.goto Stranglethorn Vale,43.26,21.05,60,0
.goto Stranglethorn Vale,42.58,22.00,60,0
.goto Stranglethorn Vale,43.78,22.80,60,0
.goto Stranglethorn Vale,44.42,23.55,60,0
.goto Stranglethorn Vale,45.38,23.28,60,0
.goto Stranglethorn Vale,46.29,23.45,60,0
.goto Stranglethorn Vale,46.26,21.94,60,0
.goto Stranglethorn Vale,47.02,20.02,60,0
.goto Stranglethorn Vale,46.67,19.13,60,0
.goto Stranglethorn Vale,46.34,18.00,60,0
.goto Stranglethorn Vale,45.27,17.76,60,0
.goto Stranglethorn Vale,44.89,16.79,60,0
.goto Stranglethorn Vale,44.44,16.19,60,0
.goto Stranglethorn Vale,43.60,15.80,60,0
.goto Stranglethorn Vale,43.39,17.63,60,0
.goto Stranglethorn Vale,43.65,19.32,60,0
.xp 38+40400 >>升级至38.5级
step
#completewith ShadowPanthers
>>击杀 |cRXP_ENEMY_荆棘谷雌虎|r. 击败它们后可获得 |cRXP_LOOT_雌虎的牙齿|r
.complete 570,2 
.mob Stranglethorn Tigress
step << !Hunter
#ah
#completewith next
.aura 12608 >>|cRXP_WARN_消耗你的|r|T134816:0|t[猫眼药剂]|cRXP_WARN_以更轻松地找到|r|cRXP_ENEMY_深喉猎豹|r|r
.use 10592
.itemcount 10592,1
step << Hunter
#completewith next
.cast 19885 >>|cRXP_WARN_使用|r |T132320:0|t[追踪隐藏] |cRXP_WARN_可更轻松地找到|r |cRXP_ENEMY_深喉猎豹|r |r
step
#label ShadowPanthers
#loop
.goto Stranglethorn Vale,48.82,23.91,0
.goto Stranglethorn Vale,47.64,22.47,40,0
.goto Stranglethorn Vale,48.08,23.54,40,0
.goto Stranglethorn Vale,48.82,23.91,40,0
.goto Stranglethorn Vale,49.58,25.41,40,0
.goto Stranglethorn Vale,50.29,24.76,40,0
.goto Stranglethorn Vale,50.25,23.37,40,0
.goto Stranglethorn Vale,50.26,21.44,40,0
.goto Stranglethorn Vale,49.29,19.84,40,0
.goto Stranglethorn Vale,48.33,19.99,40,0
.goto Stranglethorn Vale,47.75,21.21,40,0
>>击杀|cRXP_ENEMY_深喉猎豹|r. 击败后搜刮他们的|cRXP_LOOT_爪子|r
>>|cRXP_WARN_这些是潜行的怪物. 请搜索任何空旷区域|r
.complete 570,1 
.complete 192,1 
.unitscan Shadowmaw Panther
step
#loop
.goto Stranglethorn Vale,48.82,23.91,0
.goto Stranglethorn Vale,47.64,22.47,40,0
.goto Stranglethorn Vale,48.08,23.54,40,0
.goto Stranglethorn Vale,48.82,23.91,40,0
.goto Stranglethorn Vale,49.58,25.41,40,0
.goto Stranglethorn Vale,50.29,24.76,40,0
.goto Stranglethorn Vale,50.25,23.37,40,0
.goto Stranglethorn Vale,50.26,21.44,40,0
.goto Stranglethorn Vale,49.29,19.84,40,0
.goto Stranglethorn Vale,48.33,19.99,40,0
.goto Stranglethorn Vale,47.75,21.21,40,0
>>击杀 |cRXP_ENEMY_荆棘谷雌虎|r. 击败它们后可获得 |cRXP_LOOT_雌虎的牙齿|r
.complete 570,2 
.mob Stranglethorn Tigress
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_S. J. Erlgadin|r和|cRXP_FRIENDLY_Ajeck|r和|cRXP_FRIENDLY_Hemet|r交谈
.turnin 192 >>交任务: |cRXP_FRIENDLY_猎豹|r
.target +Sir S. J. Erlgadin
.goto Stranglethorn Vale,35.55,10.55
.turnin 187 >>交任务: |cRXP_FRIENDLY_猎虎|r
.accept 188 >>接任务: |cRXP_LOOT_猎虎|r
.target +Ajeck Rouack
.goto Stranglethorn Vale,35.61,10.62
.turnin 195 >>交任务: |cRXP_FRIENDLY_猎龙|r
.accept 196 >>接任务: |cRXP_LOOT_猎龙|r
.target +Hemet Nesingwary
.goto Stranglethorn Vale,35.66,10.81
step
.goto Stranglethorn Vale,32.2,17.4
>>击杀|cRXP_ENEMY_Sin'Dall|r. 击败他后可拾取他的|cRXP_LOOT_Paw|r
>>|cRXP_WARN_Sin'Dall 要么在高地顶部, 要么在基地周围巡逻|r
.complete 188,1 
.unitscan Sin'Dall
step
.goto Stranglethorn Vale,35.61,10.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿杰克|r交谈
.turnin 188 >>交任务: |cRXP_FRIENDLY_猎虎|r
.target Ajeck Rouack
step
#completewith next
.subzone 117 >>返回格罗姆高营地
step
.goto Stranglethorn Vale,32.16,27.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼姆布亚|r交谈
.accept 638 >>接任务: |cRXP_LOOT_巨魔之敌|r
.target Nimboya
step
.goto Stranglethorn Vale,32.17,28.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官Aggro'gosh|r交谈
.turnin 569 >>交任务: |cRXP_FRIENDLY_格罗姆高保卫战|r
.target Commander Aggro'gosh
step
.goto Stranglethorn Vale,32.12,29.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知莫克塔尔丁|r交谈
.turnin 570 >>交任务: |cRXP_FRIENDLY_摩克萨尔丁的魔法|r
.target Far Seer Mok'thardin
step
#completewith BBturnins2
.goto Stranglethorn Vale,32.5,29.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞斯塔|r交谈
.fly Booty Bay >>飞往藏宝海湾
.target Thysta
step
.goto Stranglethorn Vale,27.23,76.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大财主里维加兹|r交谈
.turnin 1182 >>交任务: |cRXP_FRIENDLY_地精赞助商|r
.accept 1183 >>接任务: |cRXP_LOOT_地精赞助商|r
.target Baron Revilgaz
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科博克|r和|cRXP_FRIENDLY_克拉兹克|r交谈
.turnin 189 >>交任务: |cRXP_FRIENDLY_血顶巨魔的耳朵|r
.turnin 213 >>交任务: |cRXP_FRIENDLY_恶性竞争|r
.target +Kebok
.goto Stranglethorn Vale,27.0,77.13
.turnin 201 >>交任务: |cRXP_FRIENDLY_调查营地|r
.accept 209 >>接任务: |cRXP_LOOT_劈颅巨魔的獠牙|r
.goto Stranglethorn Vale,26.95,77.21
.target +Krazek
step
.goto Stranglethorn Vale,27.12,77.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店底层的|r|cRXP_FRIENDLY_克兰克·菲兹巴布|r交谈
.turnin 605 >>交任务: |cRXP_FRIENDLY_歌唱水晶碎片|r
.accept 600 >>接任务: |cRXP_LOOT_风险投资公司|r
.target Crank Fizzlebub
step
#label BBturnins2
.goto Stranglethorn Vale,28.29,77.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_崔斯里克|r交谈
.turnin 577 >>交任务: |cRXP_FRIENDLY_收集鳄鱼皮|r
.accept 628 >>接任务: |cRXP_LOOT_刨花皮靴|r
.target Drizzlik
step << Druid
#completewith DruidTraining5
.cast 18960 >>施放 |T135758:0|t[传送:月光林地]
.zoneskip Moonglade
step << Druid
#optional
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 5201 >>训练你的职业法术
.target Loganaar
.xp <38,1
.xp >40,1
step << Druid
#label DruidTraining5
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 9634 >>训练你的职业法术
.target Loganaar
.xp <40,1
step
#completewith next
.hs >>炉石传送至奥格瑞玛
.use 6948
.zoneskip Orgrimmar
step
.goto Orgrimmar,54.65,67.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酒吧老板莫拉格|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Barkeep Morag
step
.goto Orgrimmar,49.57,69.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁斯|r交谈
.bankdeposit 2725,2728,2735,2730,2742,2732,2748,2751,2734,2740,2749,2745,2738,2744,2750 >>将所有|T134332:0|t[荆棘谷的青山页]存入银行
.target Karus
step
#ah
.goto Orgrimmar,55.59,62.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师萨苏恩|r交谈
>>|cRXP_WARN_这是在尘泥沼泽稍后可免费提交以获取3,450点经验的任务. 如果你无法获得该物品, 请跳过此步骤|r
.collect 3853,1 >>|cRXP_BUY_从拍卖行购买一件|r|T135326:0|t[月钢宽剑]|r
.target Auctioneer Thathung
step
.goto Orgrimmar,57.57,52.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xen'to|r交谈
>>|cRXP_BUY_从他那里购买|r[舒心草]|r
.collect 3713,3 
.target Xen'to
step << Mage
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 8413 >>训练你的职业法术
.target Pephredo
.xp <38,1
.xp >40,1
step << Mage
#optional
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 8423 >>训练你的职业法术
.target Pephredo
.xp <40,1
step << Mage
.goto Orgrimmar,38.70,85.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与小屋顶部的|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 11417 >>传送门 |T135744:0|t[奥格瑞玛]
.target Thuul
.xp <40,1
step << Mage
.goto Orgrimmar,45.43,56.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_霍苏斯|r|cRXP_BUY_交谈. 从他那里购买两个或更多|r|T134419:0|t[传送符文] |cRXP_BUY_, 并可选择性地购买一个或多个|r|T134421:0|t[传送门符文] |r
.collect 17031,2 
.collect 17032,1 
.target Horthus
.xp <40,1
step << Mage
.goto Orgrimmar,45.43,56.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_霍苏斯|r|cRXP_BUY_交谈. 从他那里购买两个或更多的|r|T134419:0|t[传送符文]|r
.collect 17031,2 
.target Horthus
.xp >40,1
step << Shaman
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 10391 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <38,1
.xp >40,1
step << Shaman
#optional
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 8134 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <40,1
step << Rogue
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 8621 >>训练你的职业法术
.target Ormok
.xp <38,1
.xp >40,1
step << Rogue
#optional
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 8624 >>训练你的职业法术
.target Ormok
.xp <40,1
step << Rogue
.goto Orgrimmar,42.10,49.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔交谈|r
.vendor >>|cRXP_BUY_储备闪光粉和毒药|r
.target Rekkul
step << Warlock
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 11711 >>训练你的职业法术
.target Mirket
.xp <38,1
.xp >40,1
step << Warlock
#optional
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 11733 >>训练你的职业法术
.target Mirket
.xp <40,1
step << Warlock
.goto Orgrimmar,47.52,46.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈
.vendor >>购买任何你负担得起的宠物升级道具
.target Kurgul
step << Warrior
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 8820 >>训练你的职业法术
.target Grezz Ragefist
.xp <38,1
.xp >40,1
step << Warrior
#optional
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 20660 >>训练你的职业法术
.target Grezz Ragefist
.xp <40,1
step << Hunter
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14320 >>训练你的职业法术
.target Ormak Grimshot
.xp <38,1
.xp >40,1
step << Hunter
#optional
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14324 >>训练你的职业法术
.target Ormak Grimshot
.xp <40,1
step << Hunter
.goto Orgrimmar,66.34,14.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xao'tsu|r交谈
.train 14925 >>训练你的宠物法术
.target Xao'tsu
.xp <40,1
step << Priest
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 6078 >>训练你的职业法术
.target Ur'kyo
.xp <38,1
.xp >40,1
step << Priest
#optional
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 8106 >>训练你的职业法术
.target Ur'kyo
.xp <40,1
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 39-39 尘泥沼泽
#displayname 39-39 尘泥沼泽 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 30-40
#next 39-41 阿尔萨斯/阿拉希
step
#completewith BrackenWvisit1
.goto Orgrimmar,45.120,63.889
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_多拉斯|r交谈
.fly Brackenwall Village >>飞往蕨墙村
.target Doras
.zoneskip Dustwallow Marsh
step
#optional
.abandon 629 >>放弃暗礁海
.isOnQuest 629
step
#label Hoofprints
.goto Dustwallow Marsh,29.71,47.65
>>点击地面上的|cRXP_PICK_蹄印|r
.accept 1268 >>接任务: |cRXP_LOOT_可疑的蹄印|r
step
#label Badge
.goto Dustwallow Marsh,29.83,48.24
>>点击木板上的|cRXP_PICK_塞拉摩卫兵徽章|r
.accept 1269 >>接任务: |cRXP_LOOT_帕瓦尔·雷瑟上尉|r
step
.goto Dustwallow Marsh,29.63,48.60
>>点击壁炉上方的|cRXP_PICK_黑色盾牌|r
.accept 1251 >>接任务: |cRXP_LOOT_黑色盾牌|r
step
#requires Badge
.goto Dustwallow Marsh,35.15,38.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mudcrush|r交谈
.accept 1177 >>接任务: |cRXP_LOOT_饿！|r
.target Mudcrush Durtfeet
step
.goto Dustwallow Marsh,35.21,30.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nazeer|r交谈
.accept 1201 >>接任务: |cRXP_LOOT_塞拉摩间谍|r
.target Nazeer Bloodpike
step << Hunter
.goto Dustwallow Marsh,35.51,30.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_萨纳拉交谈|r
>>|cRXP_BUY_从她那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,2600,1322,1 << Hunter 
.target Zanara
step
.goto Dustwallow Marsh,36.41,31.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗格|r交谈
.turnin 1268 >>交任务: |cRXP_FRIENDLY_可疑的蹄印|r
.turnin 1269 >>交任务: |cRXP_FRIENDLY_帕瓦尔·雷瑟上尉|r
.target Krog
step
.goto Dustwallow Marsh,36.41,31.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗格|r交谈
.turnin 1251 >>交任务: |cRXP_FRIENDLY_黑色盾牌|r
.accept 1321 >>接任务: |cRXP_LOOT_黑色盾牌|r
.target Krog
step
#label BrackenWvisit1
.goto Dustwallow Marsh,36.50,30.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Do'gol|r交谈
.turnin 1321 >>交任务: |cRXP_FRIENDLY_黑色盾牌|r
.accept 1322 >>接任务: |cRXP_LOOT_黑色盾牌|r
.target Do'gol
step
#completewith Infiltrator
>>击杀|cRXP_ENEMY_暗牙蜘蛛|r. 击杀后搜刮它们的|cRXP_LOOT_毒囊|r
>>|cRXP_ENEMY_血沼迅猛龙|r|cRXP_WARN_会与|r|cRXP_ENEMY_黑牙蜘蛛|r共享刷新点, 如有需要请一并击杀|r
.complete 1322,1 
.mob Darkfang Lurker
.mob Darkfang Spider
.mob Darkfang Venomspitter
step
.goto Dustwallow Marsh,40.96,36.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_奥格隆|r, 然后开始他的护送任务
.accept 1273 >>接任务: |cRXP_LOOT_盘问雷瑟|r
>>|cRXP_WARN_小心！这个任务难度很高|r
.target Ogron
step
.goto Dustwallow Marsh,42.50,38.00
>>当你到达营地时, 会刷新出四个怪物, 它们会在完成剧情表演后发起攻击
>>|cRXP_WARN_让|r|cRXP_FRIENDLY_奥格隆|r|cRXP_WARN_aggro|r一个目标, 然后利用你的冷却技能击杀另外三个|r
.complete 1273,1 
.target Ogron
step
#completewith next
.goto Dustwallow Marsh,42.06,26.03,0
.goto Dustwallow Marsh,39.63,23.85,0
.goto Dustwallow Marsh,38.94,22.44,0
.goto Dustwallow Marsh,38.01,25.50,0
.goto Dustwallow Marsh,37.63,27.60,0
.goto Dustwallow Marsh,38.03,33.99,0
.goto Dustwallow Marsh,38.02,37.40,0
.goto Dustwallow Marsh,40.67,35.22,0
>>击杀你遇到的任何|cRXP_ENEMY_塞拉摩间谍|r
>>|cRXP_WARN_他们处于潜行状态|r << !Hunter
>>|cRXP_WARN_他们隐身了！施放|r|T132320:0|t[追踪隐形]|cRXP_WARN_以便更容易找到他们|r << Hunter
.complete 1201,1 
.unitscan Theramore Infiltrator
step
.goto Dustwallow Marsh,46.90,17.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_“臭气”伊格纳兹|r, 然后开始护送任务
.accept 1270,1 >>接任务: |cRXP_LOOT_伊格纳兹的逃亡|r
.target "Stinky" Ignatz
step
>>护送|cRXP_FRIENDLY_大臭|r
>>|cRXP_WARN_小心！|r |cRXP_ENEMY_血沼尖啸龙|r |cRXP_WARN_生命值降至33%时呼叫援助|r|r
.complete 1270,1 
.target "Stinky" Ignatz
.mob Bloodfen Screecher
step
.goto Dustwallow Marsh,55.43,26.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“沼泽之眼”加尔|r交谈
.accept 1218 >>接任务: |cRXP_WARN_舒心草|r
.turnin 1218 >>交任务: |cRXP_FRIENDLY_舒心草|r
.accept 1206 >>接任务: |cRXP_LOOT_加尔和蜘蛛眼|r
.target "Swamp Eye" Jarl
step
.goto Dustwallow Marsh,55.44,25.93
>>点击|cRXP_PICK_松软的泥土|r, 位于|cRXP_FRIENDLY_"Swamp Eye" Jarl's|r房屋的西边
.accept 1238 >>接任务: |cRXP_LOOT_遗失的报告|r
step
#loop
.goto Dustwallow Marsh,57.80,21.30,0
.goto Dustwallow Marsh,56.82,22.42,50,0
.goto Dustwallow Marsh,57.80,21.30,50,0
.goto Dustwallow Marsh,57.49,16.80,50,0
.goto Dustwallow Marsh,58.29,15.47,50,0
>>击杀 |cRXP_ENEMY_黑鳍鱼人|r. 击杀后搜刮他们的 |cRXP_LOOT_头颅|r
.complete 1177,1 
.mob Mirefin Puddlejumper
.mob Mirefin Murloc
.mob Mirefin Coastrunner
.mob Mirefin Muckdweller
step
#completewith next
>>击杀你遇到的任何|cRXP_ENEMY_塞拉摩间谍|r
>>|cRXP_WARN_他们处于潜行状态|r << !Hunter
>>|cRXP_WARN_他们隐身了！施放|r|T132320:0|t[追踪隐形]|cRXP_WARN_以便更容易找到他们|r << Hunter
.complete 1201,1 
.unitscan Theramore Infiltrator
step
#loop
.goto Dustwallow Marsh,35.9,20.7,90,0
.goto Dustwallow Marsh,32.8,21.4,90,0
.goto Dustwallow Marsh,34.40,25.20,40,0
.goto Dustwallow Marsh,35.90,20.70,40,0
.goto Dustwallow Marsh,32.80,21.40,40,0
.goto Dustwallow Marsh,34.40,25.20,40,0
>>击杀|cRXP_ENEMY_all 黑雾蜘蛛|r. 击杀后搜刮它们的|cRXP_LOOT_Eyes|r
.complete 1206,1 
.mob Darkmist Recluse
.mob Darkmist Spider
.mob Darkmist Spider
.mob Darkmist Lurker
.unitscan Darkmist Widow
step
#label Infiltrator
#loop
.goto Dustwallow Marsh,42.06,26.03,0
.goto Dustwallow Marsh,39.63,23.85,0
.goto Dustwallow Marsh,38.94,22.44,0
.goto Dustwallow Marsh,38.01,25.50,0
.goto Dustwallow Marsh,37.63,27.60,0
.goto Dustwallow Marsh,38.03,33.99,0
.goto Dustwallow Marsh,38.02,37.40,0
.goto Dustwallow Marsh,40.67,35.22,0
.goto Dustwallow Marsh,42.06,26.03,40,0
.goto Dustwallow Marsh,39.63,23.85,40,0
.goto Dustwallow Marsh,38.94,22.44,40,0
.goto Dustwallow Marsh,38.01,25.50,40,0
.goto Dustwallow Marsh,37.63,27.60,40,0
.goto Dustwallow Marsh,38.03,33.99,40,0
.goto Dustwallow Marsh,38.02,37.40,40,0
.goto Dustwallow Marsh,40.67,35.22,40,0
.goto Dustwallow Marsh,40.50,33.48,40,0
>>完成击杀|cRXP_ENEMY_塞拉摩间谍|r
>>|cRXP_WARN_他们处于潜行状态|r << !Hunter
>>|cRXP_WARN_他们隐身了！施放|r|T132320:0|t[追踪隐形]|cRXP_WARN_以便更容易找到他们|r << Hunter
.complete 1201,1 
.unitscan Theramore Infiltrator
step
#loop
.goto Dustwallow Marsh,37.79,27.07,0
.goto Dustwallow Marsh,40.99,25.49,0
.goto Dustwallow Marsh,35.45,40.88,0
.goto Dustwallow Marsh,40.21,47.43,0
.goto Dustwallow Marsh,38.52,51.31,0
.goto Dustwallow Marsh,37.79,27.07,50,0
.goto Dustwallow Marsh,38.75,25.98,50,0
.goto Dustwallow Marsh,40.99,25.49,50,0
.goto Dustwallow Marsh,38.26,36.91,50,0
.goto Dustwallow Marsh,35.45,40.88,50,0
.goto Dustwallow Marsh,38.11,43.09,50,0
.goto Dustwallow Marsh,40.21,47.43,50,0
.goto Dustwallow Marsh,38.52,51.31,50,0
.goto Dustwallow Marsh,36.99,52.10,50,0
>>击杀|cRXP_ENEMY_暗牙蜘蛛|r. 击杀后搜刮它们的|cRXP_LOOT_毒囊|r
>>|cRXP_ENEMY_血沼迅猛龙|r|cRXP_WARN_会与|r|cRXP_ENEMY_黑牙蜘蛛|r共享刷新点, 如有需要请一并击杀|r
.complete 1322,1 
.mob Darkfang Lurker
.mob Darkfang Spider
.mob Darkfang Venomspitter
step
#completewith next
.goto Dustwallow Marsh,35.21,30.66,120 >>返回蕨墙村
step
.goto Dustwallow Marsh,35.21,30.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nazeer|r交谈
.turnin 1201 >>交任务: |cRXP_FRIENDLY_塞拉摩间谍|r
.turnin 1238 >>交任务: |cRXP_FRIENDLY_遗失的报告|r
.target Nazeer Bloodpike






step
.goto Dustwallow Marsh,36.50,30.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Do'gol|r交谈
.turnin 1322 >>交任务: |cRXP_FRIENDLY_黑色盾牌|r
.accept 1323 >>接任务: |cRXP_LOOT_黑色盾牌|r
.target Do'gol
step
.goto Dustwallow Marsh,36.50,31.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗格|r交谈
.turnin 1323 >>交任务: |cRXP_FRIENDLY_黑色盾牌|r
.turnin 1273 >>交任务: |cRXP_FRIENDLY_盘问雷瑟|r
.accept 1276 >>接任务: |cRXP_LOOT_黑色盾牌|r
.target Krog
step
.goto Dustwallow Marsh,35.20,38.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mudcrush|r交谈
.turnin 1177 >>交任务: |cRXP_FRIENDLY_饿！|r
.target Mudcrush Durtfeet
step
.goto Dustwallow Marsh,55.44,25.93
>>点击|cRXP_PICK_松软的泥土|r, 位于|cRXP_FRIENDLY_"Swamp Eye" Jarl's|r房屋的西边
.accept 1239 >>接任务: |cRXP_LOOT_被斩下的头颅|r
step
.goto Dustwallow Marsh,55.43,26.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“沼泽之眼”加尔|r交谈
.turnin 1206 >>交任务: |cRXP_FRIENDLY_加尔和蜘蛛眼|r
.target "Swamp Eye" Jarl
step
#ah
#optional
.goto Dustwallow Marsh,55.43,26.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“沼泽之眼”加尔|r交谈
.accept 1203 >>接任务: |cRXP_LOOT_加尔的剑|r
.turnin 1203 >>交任务: |cRXP_FRIENDLY_加尔的剑|r
.target "Swamp Eye" Jarl
.itemcount 3853,1
.isQuestTurnedIn 1206
step
#completewith NazeerB
.destroy 5884 >>摧毁: |cRXP_ENEMY_黑雾蜘蛛的眼球|r
step
#completewith next
.goto Dustwallow Marsh,35.21,30.66,120 >>返回蕨墙村
step
#label NazeerB
.goto Dustwallow Marsh,35.30,30.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nazeer|r交谈
.turnin 1239 >>交任务: |cRXP_FRIENDLY_被斩下的头颅|r
.accept 1240 >>接任务: |cRXP_LOOT_巨魔巫医|r
.target Nazeer Bloodpike
.isQuestTurnedIn 1238






step
#completewith next
.goto Dustwallow Marsh,35.57,31.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙尔迪|r交谈
.fly Gadgetzan >>飞往加基森
.target Shardi
.zoneskip Tanaris
step
.goto Thousand Needles,80.18,75.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普兹克|r交谈
.turnin 1183 >>交任务: |cRXP_FRIENDLY_地精赞助商|r
.accept 1186 >>接任务: |cRXP_LOOT_第十八个驾驶员|r
.target Pozzik
step
.goto Thousand Needles,80.328,76.094
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉泽瑞克|r交谈
.turnin 1186 >>交任务: |cRXP_FRIENDLY_第十八个驾驶员|r
.accept 1187 >>接任务: |cRXP_LOOT_拉泽瑞克的调整|r
.target Razzeric
step
#ah << !Warlock !Druid !Shaman
.goto Thousand Needles,78.14,77.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wizzle|r交谈
.turnin 1107 >>交任务: |cRXP_FRIENDLY_坚硬的尾鳍|r
.target Wizzle Brassbolts
.group
.isQuestComplete 1107
step << Druid
#completewith DruidTraining6
.cast 18960 >>施放 |T135758:0|t[传送:月光林地]
.zoneskip Moonglade
step << Druid
#optional
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 5201 >>训练你的职业法术
.target Loganaar
.xp <38,1
.xp >40,1
step << Druid
#label DruidTraining6
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 9634 >>训练你的职业法术
.target Loganaar
.xp <40,1
step << Druid
.hs >>炉石传送至奥格瑞玛
.use 6948
.zoneskip Orgrimmar
step << !Mage !Druid
.hs >>炉石传送至奥格瑞玛
.use 6948
.cooldown item,6948,>0
.zoneskip Orgrimmar
step << !Mage
.goto Tanaris,51.60,25.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.target Bulkrek Ragefist
.cooldown item,6948,<0
.zoneskip Orgrimmar
step
#optional
.abandon 1186 >>放弃地精赞助商
step << Shaman
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 10391 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <38,1
.xp >40,1
step << Shaman
#optional
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 8134 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <40,1
step << Rogue
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 8621 >>训练你的职业法术
.target Ormok
.xp <38,1
.xp >40,1
step << Rogue
#optional
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 8624 >>训练你的职业法术
.target Ormok
.xp <40,1
step << Rogue
.goto Orgrimmar,42.10,49.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔交谈|r
.vendor >>|cRXP_BUY_储备闪光粉和毒药|r
.target Rekkul
step << Warrior
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 8820 >>训练你的职业法术
.target Grezz Ragefist
.xp <38,1
.xp >40,1
step << Warrior
#optional
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 20660 >>训练你的职业法术
.target Grezz Ragefist
.xp <40,1
step << Hunter
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14320 >>训练你的职业法术
.target Ormak Grimshot
.xp <38,1
.xp >40,1
step << Hunter
#optional
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14324 >>训练你的职业法术
.target Ormak Grimshot
.xp <40,1
step << Hunter
.goto Orgrimmar,66.34,14.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xao'tsu|r交谈
.train 14925 >>训练你的宠物法术
.target Xao'tsu
.xp <40,1
step << Priest
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 6078 >>训练你的职业法术
.target Ur'kyo
.xp <38,1
.xp >40,1
step << Priest
#optional
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 8106 >>训练你的职业法术
.target Ur'kyo
.xp <40,1
step << Hunter
.goto Orgrimmar,48.13,80.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Trak'gen|r交谈
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,2600,232 
.target Trak'gen
.xp >40,1
step << Hunter
.goto Orgrimmar,48.13,80.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Trak'gen|r交谈
>>|cRXP_BUY_从他那里购买|r|T135661:0|t[锯齿箭]|r
.collect 11285,2600,232 
.target Trak'gen
.xp <40,1
step << Orc !Warlock
#optional
.goto Orgrimmar,69.40,13.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔达|r和|cRXP_FRIENDLY_奥古纳罗|r交谈
.train 825 >>驯兽 |T136103:0|t[狼骑术]
.vendor >>|cRXP_BUY_购买|r|T132224:0|t[|cFF0070FF狼|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Kildar
.target Ogunaro Wolfrunner
step << Troll
#completewith next
.subzone 367 >>前往森金村
.xp <40,1
.money <90
.skill riding,75,1
step << Troll
.goto Durotar,55.28,75.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xar'Ti|r和|cRXP_FRIENDLY_祖尼尔|r交谈
.train 10861 >>训练 |T136103:0|t[迅猛龙骑术]
.vendor >>|cRXP_BUY_购买|r|T132253:0|t[|cFF0070FF迅猛龙|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Xar'Ti
.target Zjolnir
step << Warlock
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 11711 >>训练你的职业法术
.target Mirket
.xp <38,1
.xp >40,1
step << Warlock
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.trainer >>训练你的职业法术
.accept 3631 >>接任务: |cRXP_LOOT_召唤地狱战马|r
.target Mirket
.xp <40,1
step << Warlock
.goto Orgrimmar,47.52,46.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈
.vendor >>购买任何你负担得起的宠物升级道具
.target Kurgul
step << Warlock
#completewith next
.goto Orgrimmar,45.13,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Ratchet >>飞往棘齿城
.zoneskip The Barrens
.target Doras
.isOnQuest 3631
step << Warlock
.goto The Barrens,62.63,35.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯坦哈德·法尔杉|r交谈
.turnin 3631 >>交任务: |cRXP_FRIENDLY_召唤地狱战马|r
.target Strahad Farsan
.isOnQuest 3631
step << Warlock
.goto The Barrens,63.09,37.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.target Bragok
.isQuestTurnedIn 3631
.zoneskip Orgrimmar
step << Tauren
#optional
#completewith KodoRiding
.goto Orgrimmar,45.13,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
.zoneskip Thunder Bluff
.target Doras
step << Tauren
#optional
#completewith next
.subzone 222 >>前往血蹄村
.xp <40,1
.money <90
.skill riding,75,1
step << Tauren
#optional
#label KodoRiding
.goto Mulgore,47.64,58.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xar'Ti|r和|cRXP_FRIENDLY_祖尼尔|r交谈
.train 132245 >>训练 |T136103:0|t[科多兽骑术]
.vendor >>|cRXP_BUY_购买|r|T132253:0|t[|cFF0070FF科多兽|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Kar Stormsinger
.target Harb Clawhoof
step << Tauren
#optional
.hs >>炉石传送至奥格瑞玛
.use 6948
.cooldown item,6948,>0
.zoneskip Orgrimmar
step << Tauren
#optional
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Orgrimmar >>飞往奥格瑞玛
.target Tal
.cooldown item,6948,<0
.zoneskip Orgrimmar
step
#sticky
#completewith EnterSM
.subzone 796,2 >>现在你应该在寻找一个前往血色修道院的队伍
.dungeon SM
step << !Mage
#completewith next
.zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
.zoneskip Durotar
step << !Mage
.goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
.zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
.zoneskip Tirisfal Glades
step << Mage
.cast 3563 >>传送 |T135766:0|t[传送:幽暗城]
.zoneskip Undercity
step << Mage
.goto Undercity,85.13,10.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
.train 8413 >>训练你的职业法术
.target Anastasia Hartwell
.xp <38,1
.xp >40,1
step << Mage
#optional
.goto Undercity,85.13,10.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
.train 8423 >>训练你的职业法术
.target Anastasia Hartwell
.xp <40,1
step << Mage
.goto Undercity,84.20,15.56
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Lexington|r交谈
.train 11418 >>训练 |T11418:0|t[传送门:幽暗城]
.target Lexington Mortaim
.xp <40,1
step << Mage
.goto Undercity,82.79,15.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_汉娜|r|cRXP_BUY_交谈. 从她那里购买两个或更多|r|T134419:0|t[传送符文] |r
.collect 17031,2 
.target Hannah Akeley
step
#optional
.abandon 1107 >>放弃坚硬的尾鳍
.isOnQuest 1107
step
#completewith next
.goto Undercity,51.92,64.68,15 >>前往|cRXP_FRIENDLY_瓦里玛萨斯|r方向前进
.dungeon SM
step
.goto Undercity,56.24,92.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
.accept 1048 >>接任务: |cRXP_WARN_深入血色修道院|r
.target Varimathras
.dungeon SM
step
#completewith next
.goto Undercity,47.20,59.69,0
.goto Undercity,47.20,59.69,12,0
.goto Undercity,43.55,68.11,12,0
.goto Undercity,45.20,71.67,12 >>前往|cRXP_FRIENDLY_Faranell|r
.isQuestTurnedIn 1109 
.dungeon SM
step
.goto Undercity,48.80,69.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔|r交谈
.accept 1113 >>接任务: |cRXP_WARN_狂热之心|r
.target Master Apothecary Faranell
.isQuestTurnedIn 1109 
.dungeon SM
step << Undead !Warlock
#optional
#completewith next
.subzone 159 >>前往布瑞尔
.xp <40,1
.money <90
.skill riding,75,1
step << Undead !Warlock
#optional
.goto Tirisfal Glades,60.09,52.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velma|r和|cRXP_FRIENDLY_Zachariah|r交谈
.train 10906 >>训练 |T136103:0|t[亡灵骑术]
.vendor >>|cRXP_BUY_购买|r|T132264:0|t[|cFF0070FF骸骨战马|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Velma Warnam
.target Zachariah Post
step
#label EnterSM
.goto Eastern Kingdoms,47.43,19.71,30,0
.goto Eastern Kingdoms,47.76,19.49
.subzone 796,2 >>进入血色修道院, 从图书馆开始, 这样你就可以在最后获得[|cRXP_FRIENDLY_血色十字军钥匙|r]
.zoneskip 304
.zoneskip 305
.dungeon SM




step << !Undead
#completewith Bosses
>>掠夺|cRXP_LOOT_堕落者纲要|r
>>|cRXP_WARN_它位于地牢最深处左侧角落的书架上|r
.complete 1049,1 
.dungeon SM
step
#completewith Compendium
>>击杀|cRXP_LOOT_Scarlet|r怪物. 击杀后搜刮出|cRXP_LOOT_狂热之心|r
.complete 1113,1 
.isOnQuest 1113
.dungeon SM
step
#label Bosses
>>击杀|cRXP_ENEMY_驯犬者洛克希|r和|cRXP_ENEMY_赫洛德|r和|cRXP_ENEMY_大检察官怀特迈恩|r和|cRXP_ENEMY_血色十字军指挥官莫格莱尼|r
>>|cRXP_ENEMY_驯犬者洛克希|r|cRXP_WARN_位于图书馆|r
>>|cRXP_ENEMY_赫洛德|r|cRXP_WARN_位于军械库|r
>>|cRXP_ENEMY_大检察官怀特迈恩|r|cRXP_WARN_和 |cRXP_ENEMY_血色十字军指挥官莫格莱尼|r位于大教堂|r
.complete 1048,4 
.complete 1048,3 
.complete 1048,1 
.complete 1048,2 
.isOnQuest 1048
.mob Houndmaster Loksey
.mob Herod
.mob High Inquisitor Whitemane
.mob Scarlet Commander Mograine
.dungeon SM
step << !Undead
#label Compendium
>>掠夺|cRXP_LOOT_堕落者纲要|r
>>|cRXP_WARN_它位于地牢最深处左侧角落的书架上|r
.complete 1049,1 
.isOnQuest 1049
.dungeon SM
step << Mage
#completewith SMturnin
.cast 3563 >>传送 |T135766:0|t[传送:幽暗城]
.zoneskip Undercity
.dungeon SM
step << !Mage
#completewith SMturnin
.goto Undercity,66.07,9.18,150 >>前往: |cRXP_PICK_幽暗城|r
.zoneskip Undercity
.dungeon SM
step
#completewith SMturnin
.goto Undercity,51.92,64.68,15 >>前往|cRXP_FRIENDLY_瓦里玛萨斯|r方向前进
.isQuestComplete 1048
.dungeon SM
step
#label SMturnin
.goto Undercity,56.24,92.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
.turnin 1048 >>交任务: |cRXP_FRIENDLY_深入血色修道院|r
.isQuestComplete 1048
.target Varimathras
.dungeon SM
step
.goto Undercity,56.24,92.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
.accept 6521 >>接任务: |cRXP_WARN_邪恶的盟友|r
.target Varimathras
.isQuestTurnedIn 6522 
.dungeon RFD
step
.goto Undercity,48.80,69.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔|r交谈
.turnin 1113 >>交任务: |cRXP_FRIENDLY_狂热之心|r
.target Master Apothecary Faranell
.isQuestComplete 1113
.dungeon SM
step
.goto Undercity,74.05,33.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德鲁|r交谈
.accept 3341 >>接任务: |cRXP_WARN_寒冰之王|r
.target Andrew Brownell
.dungeon RFD
step << Mage
.cast 3566 >>施放 |T135765:0|t[传送:雷霆崖]
.zoneskip Thunder Bluff
.isQuestComplete 1049
.dungeon SM
step
.hs >>炉石传送至奥格瑞玛
.goto Orgrimmar,54.65,67.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酒吧老板莫拉格|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Barkeep Morag
.use 6948
.cooldown item,6948,>0
.zoneskip Undercity,1
.dungeon RFD
step << Mage
.cast 3567 >>施放 |T135759:0|t[传送:奥格瑞玛]
.zoneskip Undercity,1
.cooldown item,6948,<0
.dungeon RFD
step << !Mage
.hs >>炉石传送至奥格瑞玛
.goto Orgrimmar,54.65,67.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酒吧老板莫拉格|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Barkeep Morag
.use 6948
.zoneskip Orgrimmar
.dungeon SM
.isQuestComplete 1049
step << !Mage
.goto Tirisfal Glades,61.06,58.86,12,0
.goto Tirisfal Glades,61.51,59.01,10,0
.goto Tirisfal Glades,61.27,59.22,8,0
.goto Tirisfal Glades,61.13,58.84,8,0
.goto Tirisfal Glades,61.38,58.71,8,0
.goto Tirisfal Glades,61.34,59.17,8,0
.goto Tirisfal Glades,60.51,58.69,-1
.goto Tirisfal Glades,60.94,46.35,-1
>>登上齐柏林飞艇塔
.zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
.zoneskip Orgrimmar
.cooldown item,6948,<0
.dungeon RFD
step << !Mage
#completewith next
.goto Orgrimmar,45.13,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
.zoneskip Thunder Bluff
.target Doras
.dungeon SM
.isQuestComplete 1049
step << !Undead
.goto Thunder Bluff,34.42,46.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sage|r交谈
.turnin 1049 >>交任务: |cRXP_FRIENDLY_堕落者纲要|r
.target Sage
.dungeon SM
.isQuestComplete 1049
step
#sticky
#completewith EnterRFD
.subzone 722,2 >>现在你应该寻找一支前往剃刀高地的队伍
.dungeon RFD
step
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Camp Taurajo >>飞往陶拉霍营地
.target Tal
.zoneskip Thunder Bluff,1
.dungeon RFD
step
.goto Orgrimmar,45.13,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Camp Taurajo >>飞往陶拉霍营地
.zoneskip Orgrimmar,1
.target Doras
.dungeon RFD
step
#completewith next
.goto The Barrens,46.30,90.27,200 >>前往剃刀高地
.dungeon RFD
step
#completewith next
.goto The Barrens,46.30,90.27,50,0
.goto The Barrens,46.92,91.84,50,0
.goto The Barrens,48.20,92.66,50,0
>>击杀|cRXP_ENEMY_玛克林大使|r. 击杀后搜刮他的|cRXP_LOOT_头颅|r
>>|cRXP_WARN_他可以在副本外的4个不同帐篷中出现|r
.complete 6521,1 
.unitscan Ambassador Malcin
.isOnQuest 6521
.dungeon RFD
step
.goto The Barrens,49.012,94.938
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦雷姆·月歌|r交谈
.accept 6626 >>接任务: |cRXP_WARN_邪恶之地|r
.target Myriam Moonsinger
.dungeon RFD
step
#completewith next
>>击杀|cRXP_ENEMY_剃刀沼泽护卫者|r和|cRXP_ENEMY_剃刀沼泽织棘者|r和|cRXP_ENEMY_死亡之头教徒|r
>>|cRXP_WARN_此任务在副本外完成|r
.complete 6626,1 
.mob +Razorfen Battleguard
.complete 6626,2 
.mob +Razorfen Thornweaver
.complete 6626,3 
.mob +Death's Head Cultist
.isOnQuest 6626
.dungeon RFD
step
#loop
.goto The Barrens,48.57,95.69,0
.goto The Barrens,48.20,92.66,0
.goto The Barrens,46.92,91.84,0
.goto The Barrens,46.30,90.27,0
.goto The Barrens,48.57,95.69,50,0
.goto The Barrens,48.20,92.66,50,0
.goto The Barrens,46.92,91.84,50,0
.goto The Barrens,46.30,90.27,50,0
>>击杀|cRXP_ENEMY_玛克林大使|r. 击杀后搜刮他的|cRXP_LOOT_头颅|r
>>|cRXP_WARN_他可以在副本外的4个不同帐篷中出现|r
.complete 6521,1 
.unitscan Ambassador Malcin
.isOnQuest 6521
.dungeon RFD
step
#loop
.goto The Barrens,48.23,92.31,0
.goto The Barrens,48.23,92.31,70,0
.goto The Barrens,48.15,90.57,70,0
.goto The Barrens,47.86,88.75,70,0
.goto The Barrens,46.46,90.19,70,0
.goto The Barrens,46.94,92.19,70,0
>>击杀|cRXP_ENEMY_剃刀沼泽护卫者|r和|cRXP_ENEMY_剃刀沼泽织棘者|r和|cRXP_ENEMY_死亡之头教徒|r
>>|cRXP_WARN_此任务在副本外完成|r
.complete 6626,1 
.mob +Razorfen Battleguard
.complete 6626,2 
.mob +Razorfen Thornweaver
.complete 6626,3 
.mob +Death's Head Cultist
.isOnQuest 6626
.dungeon RFD
step
.goto The Barrens,49.012,94.938
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦雷姆·月歌|r交谈
.turnin 6626 >>交任务: |cRXP_FRIENDLY_邪恶之地|r
.target Myriam Moonsinger
.isQuestComplete 6626
.dungeon RFD
step
#label EnterRFD
.goto The Barrens,49.255,93.077,0
.goto The Barrens,49.255,93.077,30,0
.goto 1414,53.26,71.18
.subzone 722,2 >>进入剃刀高地
.dungeon RFD
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奔尼斯特拉兹|r交谈
>>|cRXP_WARN_走左边的路并一直向左前行, 直到抵达谋杀围栏, 即可到达|r|cRXP_FRIENDLY_奔尼斯特拉兹|r|r
>>|cRXP_WARN_在队伍其他成员准备就绪前, 请勿接受“封印神像”, 因为这将触发护送任务. 此步骤已关闭自动接受功能|r
.accept 3523 >>接任务: |cRXP_WARN_剃刀高地的亡灵天灾|r
.turnin 3523 >>交任务: |cRXP_FRIENDLY_剃刀高地的亡灵天灾|r
.accept 3525,1 >>接任务: |cRXP_WARN_封印神像|r
.target Belnistrasz
.dungeon RFD
step
>>跟随并保护奔尼斯特拉兹在进行仪式时的安全
.complete 3525,1 
.target Belnistrasz
.isOnQuest 3525
.dungeon RFD
step
>>点击|cRXP_PICK_奔尼斯特拉兹的火盆|r
.turnin 3525 >>交任务: |cRXP_FRIENDLY_封印神像|r
.isQuestComplete 3525
.dungeon RFD
step
>>击杀|cRXP_ENEMY_寒冰之王亚门纳尔|r. 抢夺他的|cRXP_LOOT_头骨|r
.complete 3341,1 
.mob Amnennar the Coldbringer
.isOnQuest 3341
.dungeon RFD
step << !Mage
.hs >>炉石传送至奥格瑞玛
.goto Orgrimmar,54.65,67.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酒吧老板莫拉格|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Barkeep Morag
.use 6948
.dungeon RFD
step << Hunter
.goto Orgrimmar,78.11,38.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Jin'sora交谈|r
.vendor >>|cRXP_BUY_购买|r|T135489:0|t[|cRXP_FRIENDLY_大型长弓|r]|cRXP_BUY_如果可用|r
.target Jin'sora
.money <6.7952
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<21.9
.itemcount 11307,<1
.dungeon RFD
step << Hunter
.goto Orgrimmar,48.13,80.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Trak'gen|r交谈
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,2600,232 
.target Trak'gen
.xp >40,1
.dungeon RFD
step << Hunter
.goto Orgrimmar,48.13,80.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Trak'gen|r交谈
>>|cRXP_BUY_从他那里购买|r|T135661:0|t[锯齿箭]|r
.collect 11285,2600,232 
.target Trak'gen
.xp <40,1
.dungeon RFD
step << !Mage
.goto Durotar,50.53,12.52
.zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
.dungeon RFD
step << Mage
.cast 3563 >>传送 |T135766:0|t[传送:幽暗城]
.zoneskip Undercity
.dungeon RFD
step
#completewith SMturnin
.goto Undercity,51.92,64.68,15 >>前往|cRXP_FRIENDLY_瓦里玛萨斯|r方向前进
.isQuestComplete 6521
.dungeon RFD
step
.goto Undercity,56.24,92.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
.turnin 6521 >>交任务: |cRXP_FRIENDLY_邪恶的盟友|r
.target Varimathras
.isQuestComplete 6521
.dungeon RFD
step
.goto Undercity,74.05,33.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德鲁|r交谈
.turnin 3341 >>交任务: |cRXP_FRIENDLY_寒冰之王|r
.target Andrew Brownell
.isQuestComplete 3341
.dungeon RFD
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 39-41 阿尔萨斯/阿拉希
#displayname 39-41 阿尔萨斯/阿拉希 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 30-40
#next 41-42 荒芜之地
step
#completewith next
.goto Undercity,47.20,59.69,0
.goto Undercity,47.20,59.69,12,0
.goto Undercity,43.55,68.11,12,0
.goto Undercity,45.20,71.67,12 >>前往|cRXP_FRIENDLY_Zinge|r
step
.goto Undercity,50.15,67.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zinge|r交谈
.accept 232 >>接任务: |cRXP_LOOT_金格的货物|r
.target Apothecary Zinge
step
.goto Undercity,58.61,54.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alessandro|r交谈
.turnin 232 >>交任务: |cRXP_FRIENDLY_金格的货物|r
.accept 238 >>接任务: |cRXP_LOOT_金格的货物|r
.target Alessandro Luca
step
#completewith Return2Zinge
.goto Undercity,47.20,59.69,0
.goto Undercity,47.20,59.69,12,0
.goto Undercity,43.55,68.11,12,0
.goto Undercity,45.20,71.67,12 >>返回|cRXP_FRIENDLY_Zinge|r
step
.goto Undercity,50.15,67.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zinge|r交谈
.turnin 238 >>交任务: |cRXP_FRIENDLY_金格的货物|r
.accept 243 >>接任务: |cRXP_LOOT_进入沙漠|r
.target Apothecary Zinge
.solo
step
.goto Undercity,50.15,67.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zinge|r交谈
.turnin 238 >>交任务: |cRXP_FRIENDLY_金格的货物|r
.target Apothecary Zinge
.group
step
#optional
#label Return2Zinge
step << Hunter
.goto Undercity,54.71,38.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
.vendor >>|cRXP_BUY_如果有的话, 从她那里购买一把|r|T135489:0|t[大型长弓]|r
.target Abigail Sawyer
.money <6.7952
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<21.9
step << Hunter
#completewith BracersofBinding
+当你达到42级时装备 |T135489:0|t[大型长弓]
.use 11307
.itemcount 11307,1
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<21.9
step << Hunter
.goto Undercity,58.66,33.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Geoffrey|r|cRXP_BUY_交谈. 如果你是近战职业, 请从他那里购买|r|cRXP_BUY_购买|r|T135424:0|t[巨斧]|cRXP_BUY_. 否则, 跳过此步骤|r
.collect 2531,1,503,1 
.target Geoffrey Hartwell
.money <5.0552
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<31.2
step << Hunter
#completewith BracersofBinding
+当你达到39级时装备|T135424:0|t[巨斧]
.use 2531
.itemcount 2531,1
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<31.2
.xp >39,1
step << Hunter
#completewith BracersofBinding
+装备 |T135424:0|t[巨斧]
.use 2531
.itemcount 2531,1
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<31.2
.xp <39,1
step << Rogue
.goto Undercity,58.66,33.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Geoffrey|r|cRXP_BUY_交谈. 从他那里购买|r|T135344:0|t[贵族阔剑]|r
.collect 2528,1,503,1 
.money <4.6652
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<25.6
.target Geoffrey Hartwell
step << Rogue
.goto Undercity,58.66,33.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_杰弗里|r|cRXP_BUY_交谈. 从他那里购买|r|T135341:0|t[致命的细短剑]|r
.collect 2534,1,503,1 
.money <4.0888
.itemStat 17,QUALITY,<7
.itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<24.0
.target Geoffrey Hartwell
step << Rogue
#completewith BracersofBinding
+当你达到41级时装备 |T135344:0|t[贵族阔剑]
.use 2528
.itemcount 2528,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<25.6
step << Rogue
#completewith BracersofBinding
+当你达到39级时, 在副手装备|T135341:0|t[致命的细短剑]
.use 2534
.itemcount 2534,1
.itemStat 17,QUALITY,<7
.itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<24.0
step << Priest
.goto Undercity,69.54,26.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Zane|r|cRXP_BUY_交谈. 从他那里购买|r|T133718:0|t[黑骨魔杖]|r
.collect 5239,1,503,1 
.money <4.0769
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<35.3
.target Zane Bradford
step << Priest
#completewith BracersofBinding
+当你达到41级时装备 |T135344:0|t[黑骨魔杖]
.use 5239
.itemcount 5239,1
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<35.3
step << Warrior
.goto Undercity,77.48,49.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_纳撒尼尔|r|cRXP_BUY_交谈, 向他购买两堆|r|T135424:0|t[破损的闪光飞斧] |r
.collect 15326,2 
.target Nathaniel Steenwick
step << Warrior
#ah
#completewith next
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的拍卖师斯托克顿交谈|cRXP_FRIENDLY_Auctioneer Stockton|r
>>|cRXP_BUY_如果购买|r|T134717:0|t[自然防护药水]|cRXP_BUY_后还有余额, 请购买以下物品:|r
.collect 4480,8 
.collect 4479,8 
.collect 4481,8 
.collect 3357,8 
.target Auctioneer Stockton
step << Warrior
#ah
.goto Undercity,71.42,46.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的拍卖师斯托克顿交谈|cRXP_FRIENDLY_Auctioneer Stockton|r
.collect 6052,2 
.target Auctioneer Stockton
step
#ah
.goto Undercity,71.42,46.69
>>|cRXP_BUY_如果你还有剩余的钱, 可以购买以下物品:|r
.collect 3829,1 
.collect 4389,1 
.collect 929,1 
.collect 3823,1 
.collect 2868,1 
.collect 4611,9 
.collect 3404,4 
step
.goto Undercity,62.32,48.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕特里克|r交谈
.accept 2342 >>接任务: |cRXP_LOOT_失而复得|r
.target Patrick Garrett
.group
step << Warrior
#completewith ArathiCharms
.goto Undercity,63.27,48.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
>>|cRXP_ENEMY_如果你在拍卖行购买了8个升腾和轰鸣和燃烧符文, 可直接飞往塔伦米尔, 并跳过接下来的3个步骤|r
.fly Hammerfall >>飞往落锤镇
.target Michael Garrett
.zoneskip Arathi Highlands
step << Warrior
#hardcore
#completewith ArathiCharms
.goto Arathi Highlands,45.78,43.61,0
+|cRXP_WARN_请注意不要过于靠近区域中心的避难点(联盟基地). |r|cRXP_ENEMY_避难点守卫|r|cRXP_WARN_会杀死你|r
.unitscan Refuge Point Defender
step << Warrior
#label Cresting
.goto Arathi Highlands,66.72,29.72
>>击杀|cRXP_ENEMY_水浪流放者|r. 击败后可掠夺他们的 |T133438:0|t[海浪咒符]
.collect 4481,8 
.mob Cresting Exile
step << Warrior
.goto Arathi Highlands,52.06,50.60
>>击杀雷霆流放者. 从他们身上搜刮出雷霆咒符
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_雷霆流放者|r|cRXP_WARN_具有高爆发伤害|r
.collect 4480,8 
.mob Thundering Exile
step << Warrior
#label ArathiCharms
.goto Arathi Highlands,25.47,30.09
>>击杀|cRXP_ENEMY_烈焰流放者|r. 击败他们后可获得他们的 |T133434:0|t[燃烧咒符]
.collect 4479,8 
.mob Burning Exile
step << Warrior
#completewith BracersofBinding
.goto Hillsbrad Foothills,62.06,20.19,120 >>前往塔伦米尔
.zoneskip Arathi Highlands,1
step
#completewith BracersofBinding
.goto Undercity,63.27,48.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
.fly Tarren Mill >>飞往塔伦米尔
.target Michael Garrett
.zoneskip Hillsbrad Foothills
.zoneskip Undercity,1 << Warrior
step << !Undead
#optional
.abandon 1049 >>堕落者纲要
.isOnQuest 1049
.dungeon SM
step
#optional
.abandon 1048 >>深入血色修道院
.isOnQuest 1048
.dungeon SM
step
#optional
.abandon 1113 >>狂热之心
.isOnQuest 1113
.dungeon SM
step
#optional
.abandon 6521 >>放弃邪恶的盟友
.isOnQuest 6521
.dungeon RFD
step
#optional
.abandon 6626 >>放弃邪恶之地
.isOnQuest 6626
.dungeon RFD
step
#optional
.abandon 3341 >>放弃寒冰之王
.isOnQuest 3341
.dungeon RFD
step
#label BracersofBinding
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bel'varil|r和|cRXP_FRIENDLY_Wordeen|r交谈
.accept 557 >>接任务: |cRXP_LOOT_地缚护腕|r
.target +Keeper Bel'varil
.goto Hillsbrad Foothills,61.60,20.86
.accept 545 >>接任务: |cRXP_LOOT_达拉然巡逻队|r
.target +Magus Wordeen Voidglare
.goto Hillsbrad Foothills,61.49,20.93
step
.goto Hillsbrad Foothills,62.62,20.74
>>点击|cRXP_PICK_通缉：瓦杜斯男爵|r 海报, 它就在|cRXP_FRIENDLY_梅里萨拉|r 旁边
.accept 566 >>接任务: |cRXP_LOOT_通缉：瓦杜斯男爵|r
.target Melisara
.group
step
.goto Hillsbrad Foothills,63.20,20.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁斯克|r交谈
.accept 503 >>接任务: |cRXP_LOOT_高迪尔|r
.target Krusk
step << Warrior
#completewith Whirlwind
+|cRXP_WARN_观看这个关于如何利用技巧击败塞克隆尼亚的视频非常重要|r|T132403:0|t[旋风之斧]
.link https://www.youtube.com/watch?v=BiuWeMSHEhA >>点击这里
step << Warrior
#ah
.goto Alterac Mountains,80.49,66.92
.use 6052 >>旅行时使用[自然防护药水]
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bath'rah the Windwatcher|r交谈
.turnin 1714 >>交任务: |cRXP_FRIENDLY_流放精华|r
.target Bath'rah the Windwatcher
step << Warrior
.goto Alterac Mountains,80.49,66.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bath'rah the Windwatcher|r交谈
.turnin 1714 >>交任务: |cRXP_FRIENDLY_流放精华|r
.target Bath'rah the Windwatcher
step << Warrior
.goto Alterac Mountains,80.49,66.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bath'rah the Windwatcher|r交谈
.turnin 1712 >>交任务: |cRXP_FRIENDLY_塞克隆尼亚|r
.accept 1713 >>接任务: |cRXP_LOOT_召唤|r
.target Bath'rah the Windwatcher
step << Warrior
#label Whirlwind
.goto Alterac Mountains,80.6,62.2
>>等待|cRXP_FRIENDLY_Bath'rah's|r角色扮演结束后, 击杀|cRXP_LOOT_塞克隆尼亚|r并从他身上搜刮其|cRXP_LOOT_心脏|r
>>|cRXP_WARN_装备你的|r |T135424:0|t[破损的闪光飞斧] |cRXP_WARN_, 如果你还没有|r
.complete 1713,1 
.unitscan Cyclonian
step << Warrior
.goto Alterac Mountains,80.49,66.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴特拉, 风语者|r交谈, 并选择|T132403:0|t[旋风之斧]
.turnin 1713 >>交任务: |cRXP_FRIENDLY_召唤|r
.turnin 1792 >>交任务: |cRXP_FRIENDLY_旋风武器|r
.target Bath'rah the Windwatcher
step
.goto Hillsbrad Foothills,62.63,20.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅里萨拉|r交谈
.accept 518 >>接任务: |cRXP_LOOT_意志之冠|r
.target Melisara
.group
step
#loop
.goto Alterac Mountains,60.55,43.91,0
.goto Alterac Mountains,63.10,43.47,0
.goto Alterac Mountains,62.67,40.16,0
.goto Alterac Mountains,61.77,43.88,8,0
.goto Alterac Mountains,60.55,43.91,8,0
.goto Alterac Mountains,63.10,43.47,8,0
.goto Alterac Mountains,62.31,41.59,8,0
.goto Alterac Mountains,62.67,40.16,12,0
>>击杀|cRXP_ENEMY_看守员博胡恩|r, 击败后搜刮他的|cRXP_LOOT_Key|r
>>|cRXP_WARN_他在斯特兰布拉德有多个刷新点:|r
>>|cRXP_WARN_旅馆二楼内部|r
>>|cRXP_WARN_旅馆对面建筑的一楼内部|r
>>|cRXP_WARN_市政厅内部|r
.complete 503,1 
.unitscan Jailor Borhuin
step
.goto Alterac Mountains,60.00,43.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_高迪尔|r交谈
.turnin 503 >>交任务: |cRXP_FRIENDLY_高迪尔|r
.accept 506 >>接任务: |cRXP_LOOT_布莱克摩尔的余孽|r
.target Gol'dir
step
.goto Alterac Mountains,42.7,46.6
>>击杀|cRXP_ENEMY_破碎岭虐待者|r
.complete 518,1 
.mob Crushridge Mauler
.group 3
step
#completewith next
.subzone 272 >>返回塔伦米尔
.group
step
.goto Hillsbrad Foothills,62.6,20.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回至梅里萨拉
.turnin 518 >>交任务: |cRXP_FRIENDLY_意志之冠|r
.accept 519 >>接任务: |cRXP_LOOT_意志之冠|r
.target Melisara
.group
step
.goto Alterac Mountains,39.49,41.82
>>击杀|cRXP_ENEMY_戈洛姆斯|r. 击败后搜刮他的|cRXP_LOOT_头|r
.complete 519,3 
.unitscan Glommus
.group 3
step
.goto Alterac Mountains,38.61,46.78
>>击杀|cRXP_ENEMY_玛克拉克|r. 击败他后搜刮其掉落的|cRXP_LOOT_头颅|r
.complete 519,2 
.unitscan Muckrake
.group 3
step
.goto Alterac Mountains,39.59,52.86
>>击杀|cRXP_ENEMY_塔尔格|r. 击败他后搜刮他的|cRXP_LOOT_头颅|r
.complete 519,1 
.unitscan Targ
.group 3
step
#completewith next
.subzone 272 >>返回塔伦米尔
.group
step
.goto Hillsbrad Foothills,62.63,20.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅里萨拉|r交谈
.turnin 519 >>交任务: |cRXP_FRIENDLY_意志之冠|r
.accept 520 >>接任务: |cRXP_LOOT_意志之冠|r
.target Melisara
.group
step
.goto Alterac Mountains,35.68,54.25
>>击杀|cRXP_ENEMY_Mug'thol|r. 击败他后搜刮其|cRXP_LOOT_头颅|r和|cRXP_LOOT_意志之冠|r
>>|cRXP_WARN_要特别小心|r|cRXP_ENEMY_破碎岭好战者|r|cRXP_WARN_, 他们在低血量时会呼叫援军|r
.complete 520,1 
.complete 520,2 
.mob Crushridge Warmonger
.unitscan Mug'thol
.group 3
step
#completewith next
.subzone 272 >>返回塔伦米尔
step
#completewith next
.goto Hillsbrad Foothills,62.76,19.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板沙恩|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Shay
step
.goto Hillsbrad Foothills,63.20,20.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁斯克|r交谈
.turnin 506 >>交任务: |cRXP_FRIENDLY_布莱克摩尔的余孽|r
.target Krusk
step
.goto Hillsbrad Foothills,63.20,20.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁斯克|r交谈
.accept 507 >>接任务: |cRXP_LOOT_奥里登·匹瑞诺德|r
.target Krusk
.group
step
#completewith FrostMaw1
.goto Alterac Mountains,39.90,80.93,0
+|cRXP_WARN_当您向北行进时, 请小心奥特兰克山谷洞穴中的|cRXP_ENEMY_Alliance Guards|r！他们仇恨范围很大, 可能在两下之内就将你击杀|r
>>|cRXP_WARN_查看地图以确定他们的位置|r
.unitscan Southshore Guard
step
#completewith next
.goto Alterac Mountains,42.2,77.8,90,0
.goto Alterac Mountains,46.2,78.2,90,0
>>击杀|cRXP_ENEMY_山地狮|r. 击杀后搜刮出 |T134368:0|t[|cRXP_LOOT_新鲜的尸体|r]
>>|T134368:0|t[|cRXP_LOOT_新鲜的尸体|r] |cRXP_WARN_30分钟后消失|r
.collect 5810,1 
.mob Feral Mountain Lion
.mob Mountain Lion
.mob Starving Mountain Lion
.mob Hulking Mountain Lion
step
#label FrostMaw1
.goto Alterac Mountains,37.56,68.22
.use 5810 >>使用|T134368:0|t[|cRXP_LOOT_新鲜的尸体|r]进入无草洞穴, 召唤|cRXP_ENEMY_霜喉雪人|r. 击杀他并搜刮其|cRXP_LOOT_鬃毛|r

.complete 1136,1 
.unitscan Frostmaw

step
#loop
.goto Alterac Mountains,10.30,78.50,0
.goto Alterac Mountains,10.30,78.50,60,0
.goto Alterac Mountains,20.50,75.20,60,0
.goto Alterac Mountains,21.30,53.50,60,0
.goto Alterac Mountains,17.80,56.20,60,0
.goto Alterac Mountains,21.30,53.50,60,0
.goto Alterac Mountains,20.50,75.20,60,0
>>击杀|cRXP_ENEMY_达拉然召唤师|r和|cRXP_ENEMY_元素奴仆|r, 击败后搜刮他们的|cRXP_LOOT_护腕|r
.complete 545,1 
.mob +Dalaran Summoner
.complete 545,2 
.complete 557,1 
.mob Elemental Slave
step << !Hunter
#ah
#completewith next
.aura 12608 >>|cRXP_WARN_在接近阿尔登·佩伦德勋爵的宅邸时, 消耗你的|r|T134816:0|t[猫眼药剂]|r
.itemcount 10592,1
.use 10592
.group 0
step << Hunter
#completewith next
.cast 19885 >>|cRXP_WARN_施放|r|T132320:0|t[追踪隐藏]|cRXP_WARN_当你接近阿尔登·佩伦诺尔德爵士的宅邸时|r
.group 0
step
.goto Alterac Mountains,39.28,14.52
>>击杀|cRXP_ENEMY_奥里登·匹瑞诺德领主|r
>>|cRXP_WARN_请注意|cRXP_ENEMY_辛迪加刺客|r|cRXP_WARN_. |r|cRXP_ENEMY_Aliden|r|cRXP_WARN_会使用“真言术·盾”, 施放“治疗术”, 并会使宠物和其他玩家陷入睡眠状态|r
.complete 507,1 
.unitscan Lord Aliden Perenolde
.mob Syndicate Assassin
.group 2
step
.goto Alterac Mountains,39.30,14.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾丽萨|r交谈
.turnin 507 >>交任务: |cRXP_FRIENDLY_奥里登·匹瑞诺德|r
.accept 508 >>接任务: |cRXP_LOOT_塔蕾莎的礼物|r
.target Elysa
.group
step
#loop
.goto Alterac Mountains,47.8,17.1,0
.goto Alterac Mountains,53.6,20.6,0
.goto Alterac Mountains,56.2,26.8,0
.goto Alterac Mountains,58.1,29.9,0
.goto Alterac Mountains,59.7,43.9,0
.goto Alterac Mountains,47.8,17.1,70,0
.goto Alterac Mountains,53.6,20.6,70,0
.goto Alterac Mountains,56.2,26.8,70,0
.goto Alterac Mountains,58.1,29.9,70,0
.goto Alterac Mountains,59.7,43.9,70,0
>>在每个营地和斯特兰布拉德的酒馆中寻找|cRXP_ENEMY_巴隆·瓦杜斯|r, 击杀他并搜刮他的|cRXP_LOOT_头颅|r
.complete 566,1 
.unitscan Baron Vardus
.group 2
step
#completewith next
.subzone 272 >>返回塔伦米尔
step
.goto Alterac Mountains,61.10,82.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级执行官达萨利亚|r交谈
.turnin 566 >>交任务: |cRXP_FRIENDLY_通缉：瓦杜斯男爵|r
.target High Executor Darthalia
.group
step
.goto Hillsbrad Foothills,63.20,20.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁斯克|r交谈
.turnin 508 >>交任务: |cRXP_FRIENDLY_塔蕾莎的礼物|r
.target Krusk
.group
step
.goto Hillsbrad Foothills,62.63,20.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅里萨拉|r交谈
.turnin 520 >>交任务: |cRXP_FRIENDLY_意志之冠|r
.target Melisara
.group
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wordeen|r和|cRXP_FRIENDLY_Bel'varil|r交谈
.turnin 545 >>交任务: |cRXP_FRIENDLY_达拉然巡逻队|r
.target +Magus Wordeen Voidglare
.goto Hillsbrad Foothills,61.56,20.89
.turnin 557 >>交任务: |cRXP_FRIENDLY_地缚护腕|r
.target +Keeper Bel'varil
.goto Hillsbrad Foothills,61.49,20.93
step
#completewith MyzraelPickup
.goto Hillsbrad Foothills,60.14,18.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞斯|r交谈
.fly Hammerfall >>飞往落锤镇
.target Zarise
.zoneskip Arathi Highlands
step
#optional
.abandon 566 >>通缉：瓦杜斯男爵
.isOnQuest 566
step
#optional
.abandon 518 >>放弃意志之冠
.isOnQuest 518
step
#optional
.abandon 519 >>放弃意志之冠
.isOnQuest 519
step
#optional
.abandon 520 >>放弃意志之冠
.isOnQuest 520
step
#optional
.abandon 507 >>放弃奥里登·匹瑞诺德领主
.isOnQuest 507
step
.goto Arathi Highlands,73.80,33.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森古|r交谈
.turnin 638 >>交任务: |cRXP_FRIENDLY_巨魔之敌|r
.accept 639 >>接任务: |cRXP_LOOT_激流堡符印|r
.target Zengu
.group
step
.goto Arathi Highlands,73.80,33.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森古|r交谈
.turnin 638 >>交任务: |cRXP_FRIENDLY_巨魔之敌|r
.target Zengu
step
.goto Arathi Highlands,74.30,33.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜拉姆法尔|r交谈
.accept 678 >>接任务: |cRXP_LOOT_短兵相接|r
.target Drum Fel
step
.goto Arathi Highlands,72.64,33.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈尔姆尔|r交谈
.accept 675 >>接任务: |cRXP_LOOT_振奋精神|r
.target Gor'mul
step
.goto Arathi Highlands,74.70,36.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托加恩|r交谈
.turnin 675 >>交任务: |cRXP_FRIENDLY_振奋精神|r
.accept 701 >>接任务: |cRXP_LOOT_迅猛龙的狡诈|r
.target Tor'gan
step
#label MyzraelPickup
.goto Arathi Highlands,62.50,33.80
>>点击|cRXP_PICK_密斯莱尔水晶碎块|r
.accept 642 >>接任务: |cRXP_LOOT_被困的公主|r
step
#loop
.goto Arathi Highlands,84.32,30.93,0
.goto Arathi Highlands,80.80,39.91,20,0
.goto Arathi Highlands,82.25,38.94,20,0
.goto Arathi Highlands,82.39,36.78,20,0
.goto Arathi Highlands,83.56,35.02,20,0
.goto Arathi Highlands,84.87,31.67,20,0
.goto Arathi Highlands,87.10,31.31,20,0
.goto Arathi Highlands,84.73,28.99,20,0
.goto Arathi Highlands,84.32,30.93,20,0
>>击杀|cRXP_ENEMY_Drywhisker 枯须狗头人|r和|cRXP_ENEMY_Diggers|r和|cRXP_ENEMY_测量者|r. 掠夺他们以获取|cRXP_LOOT_密斯莱尔之尘|r`
.complete 642,1 
.mob Drywhisker Kobold
.mob Drywhisker Digger
.mob Drywhisker Surveyor
step
.goto Arathi Highlands,84.30,30.95
>>点击洞穴后方的|cRXP_PICK_虹光水晶碎块|r
.turnin 642 >>交任务: |cRXP_FRIENDLY_被困的公主|r
.accept 651 >>接任务: |cRXP_LOOT_禁锢之石|r
step << skip
.goto Arathi Highlands,83.93,28.49
.goto Arathi Highlands,73.66,29.11,30 >>|cRXP_WARN_跳上一个节点或跑到洞穴后面. 通过注销再重新登录来执行“登出跳过”(Logout Skip). 注销时你需要做一个跳跃动作|r
.link https://www.youtube.com/watch?v=RSedlGeYX_k&ab_channel=RestedXP >>|cRXP_WARN_点击此处查看示例|r
step
#phase 4-6
.goto Arathi Highlands,66.70,29.80
>>拾取|cRXP_PICK_东禁锢之石|r以获得|cRXP_LOOT_海浪钥匙|r
>>击杀|cRXP_ENEMY_水浪流放者|r. 击败后可掠夺获得 |T134714:0|t[元素之水] << Shaman
>>|cRXP_ENEMY_顶峰流放者|r|cRXP_WARN_拥有冰霜护甲和冰霜新星|r
.complete 651,2 
.collect 7070,1 << Shaman 
.mob Cresting Exile
step
step
#phase 1-3
.goto Arathi Highlands,66.70,29.80
>>拾取|cRXP_PICK_东禁锢之石|r以获得|cRXP_LOOT_海浪钥匙|r
>>|cRXP_ENEMY_顶峰流放者|r|cRXP_WARN_拥有冰霜护甲和冰霜新星|r
.complete 651,2 
.mob Cresting Exile
step
#phase 4-6
.goto Arathi Highlands,52.00,50.80
>>掠夺|cRXP_PICK_外禁锢之石|r以获取|cRXP_LOOT_雷霆钥匙|r
>>击杀|cRXP_ENEMY_雷霆流放者|r. 击败后可掠夺获得 |T136107:0|t[元素空气] << Shaman
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_雷霆流放者|r|cRXP_WARN_拥有强大的爆发伤害|r
.complete 651,3 
.collect 7069,1 << Shaman 
.mob Thundering Exile
step
#phase 1-3
.goto Arathi Highlands,52.00,50.80
>>掠夺|cRXP_PICK_外禁锢之石|r以获取|cRXP_LOOT_雷霆钥匙|r
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_雷霆流放者|r|cRXP_WARN_拥有强大的爆发伤害|r
.complete 651,3 
.mob Thundering Exile
step
#phase 4-6
.goto Arathi Highlands,25.50,30.10
>>掠夺 |cRXP_PICK_西禁锢之石|r以获得 |cRXP_LOOT_烈焰钥匙|r
>>击杀|cRXP_ENEMY_烈焰流放者|r. 击败他们后可拾取 |T135805:0|t[元素火焰] << Shaman
>>|cRXP_WARN_如果你发现自己处于危险之中, 请使用|r|T133438:0|t[海浪咒符], |cRXP_WARN_目标: |r|cRXP_ENEMY_烈焰流放者|r
.complete 651,1 
.collect 7068,1 << Shaman 
.mob Burning Exile
.use 4481
step
#phase 1-3
.goto Arathi Highlands,25.50,30.10
>>掠夺 |cRXP_PICK_西禁锢之石|r以获得 |cRXP_LOOT_烈焰钥匙|r
>>|cRXP_WARN_如果你发现自己处于危险之中, 请使用|r|T133438:0|t[海浪咒符], |cRXP_WARN_目标: |r|cRXP_ENEMY_烈焰流放者|r
.complete 651,1 
.mob Burning Exile
.use 4481
step
.goto Arathi Highlands,36.20,57.30
>>点击|cRXP_PICK_内禁锢之石|r
.turnin 651 >>交任务: |cRXP_FRIENDLY_禁锢之石|r
step << Shaman
#phase 4-6
.goto Arathi Highlands,36.20,57.30
>>击杀|cRXP_ENEMY_顽石流放者|r. 击败后可掠夺获得 |T134572:0|t[元素之土]
>>|cRXP_WARN_稍后完成50级萨满祭司任务时会用到这些物品. 到达奥格瑞玛后, 请将它们存入银行|r
.collect 7067,1 
.mob Rumbling Exile
step
.goto Arathi Highlands,36.20,57.30
>>再次点击|cRXP_PICK_内禁锢之石|r
.accept 652 >>接任务: |cRXP_LOOT_打开钥匙之石|r
.group
step
#completewith next
>>击杀|cRXP_ENEMY_高地猎兽龙|r. 击败它们获取其|cRXP_LOOT_心脏|r
.complete 701,1 
.mob Highland Fleshstalker
step
#loop
.goto Arathi Highlands,53.81,74.59,0
.goto Arathi Highlands,52.06,74.38,50,0
.goto Arathi Highlands,53.81,74.59,50,0
.goto Arathi Highlands,53.58,76.20,50,0
.goto Arathi Highlands,54.52,78.00,15,0
.goto Arathi Highlands,53.68,79.95,20,0
>>击杀|cRXP_ENEMY_Boulderfist 石拳蛮兵|r和|cRXP_ENEMY_Boulderfist 石拳法师|r
>>|cRXP_WARN_小心法师的冰霜护甲和冰霜新星|r
>>|cFFEB144CBe **极其谨慎**对待稀有怪“粉碎者莫洛克”, 它不是精英怪, 但伤害高达250-450|r
.complete 678,1 
.mob +Boulderfist Brute
.complete 678,2 
.mob +Boulderfist Magus
.unitscan Molok the Crusher
step
#loop
.goto Arathi Highlands,49.71,68.69,0
.goto Arathi Highlands,52.77,63.56,70,0
.goto Arathi Highlands,50.22,65.00,70,0
.goto Arathi Highlands,49.71,68.69,70,0
.goto Arathi Highlands,48.07,74.25,70,0
.goto Arathi Highlands,46.21,76.74,70,0
.goto Arathi Highlands,46.04,79.55,70,0
.goto Arathi Highlands,48.59,80.56,70,0
>>击杀|cRXP_ENEMY_高地猎兽龙|r. 击败它们获取其|cRXP_LOOT_心脏|r
.complete 701,1 
.mob Highland Fleshstalker
step
.goto Arathi Highlands,27.3,62.8
>>击杀|cRXP_ENEMY_辛迪加潜伏者|r和|cRXP_ENEMY_召唤者|r和|cRXP_ENEMY_法师|r. 从他们身上搜刮出|cRXP_LOOT_激流堡符印|r
>>|cRXP_WARN_它的掉落率非常低. 注意刷新. 小心|r |cRXP_ENEMY_辛迪加潜伏者|r|cRXP_WARN_, 他们可以布网并解除你的装备|r
.complete 639,1 
.mob Syndicate Prowler
.mob Syndicate Conjuror
.mob Syndicate Magus
.isOnQuest 639
.group 3
step
#loop
.line Arathi Highlands,67.3,31.1,61.8,43.0,47.4,56.8,30.5,54.6,21.1,36.5,26.4,30.3,26.0,45.4,30.5,54.6,47.4,56.8,61.8,43.0,67.3,31.1
.goto Arathi Highlands,67.30,31.10,70,0
.goto Arathi Highlands,61.80,43.00,70,0
.goto Arathi Highlands,47.40,56.80,70,0
.goto Arathi Highlands,30.50,54.60,70,0
.goto Arathi Highlands,21.10,36.50,70,0
.goto Arathi Highlands,26.40,30.30,70,0
.goto Arathi Highlands,26.00,45.40,70,0
.goto Arathi Highlands,30.50,54.60,70,0
.goto Arathi Highlands,47.40,56.80,70,0
.goto Arathi Highlands,61.80,43.00,70,0
.goto Arathi Highlands,67.30,31.10,0
>>击杀|cRXP_ENEMY_弗兹鲁克|r. 击败他后可获得他的|cRXP_LOOT_杆|r
.link https://youtu.be/8Exjtb2ohPQ >>点击此处查看视频参考. 如果你选择不拆分拉怪, 应优先集中火力击杀|cRXP_ENEMY_斯利比|r
>>|cRXP_WARN_如果你无法组队, 可以考虑跳过此步骤|r << !Warlock
.complete 652,1 
.unitscan Fozruk
.unitscan Znort
.unitscan Feeboz
.unitscan Sleeby
.isOnQuest 652
.group 3
step
#completewith next
.goto Arathi Highlands,73.52,33.20,150 >>返回落锤镇
step
.goto Arathi Highlands,74.70,36.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托加恩|r交谈
.turnin 701 >>交任务: |cRXP_FRIENDLY_迅猛龙的狡诈|r
.accept 702 >>接任务: |cRXP_LOOT_迅猛龙的狡诈|r
.accept 673 >>接任务: |cRXP_LOOT_邪恶的魔法|r
.target Tor'gan
.group
step
.goto Arathi Highlands,74.70,36.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托加恩|r交谈
.turnin 701 >>交任务: |cRXP_FRIENDLY_迅猛龙的狡诈|r
.accept 702 >>接任务: |cRXP_LOOT_迅猛龙的狡诈|r
.target Tor'gan
step
.goto Arathi Highlands,72.64,33.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈尔姆尔|r交谈
.turnin 702 >>交任务: |cRXP_FRIENDLY_迅猛龙的狡诈|r
.target Gor'mul
step
.goto Arathi Highlands,73.80,33.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森古|r交谈
.turnin 639 >>交任务: |cRXP_FRIENDLY_激流堡符印|r
.accept 640 >>接任务: |cRXP_LOOT_破碎的符印|r
.target Zengu
.isQuestComplete 639
.group
step
#optional
.goto Arathi Highlands,73.80,33.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森古|r交谈
.accept 640 >>接任务: |cRXP_LOOT_破碎的符印|r
.target Zengu
.isQuestTurnedIn 639
.group
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜拉姆法尔|r交谈
.turnin 678 >>交任务: |cRXP_FRIENDLY_短兵相接|r
.accept 679 >>接任务: |cRXP_LOOT_短兵相接|r
.target Drum Fel
.isQuestComplete 678
.group
step
#optional
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜拉姆法尔|r交谈
.accept 679 >>接任务: |cRXP_LOOT_短兵相接|r
.target Drum Fel
.isQuestTurnedIn 678
.group
step
.goto Arathi Highlands,74.20,33.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜拉姆法尔|r交谈
.turnin 678 >>交任务: |cRXP_FRIENDLY_短兵相接|r
.target Drum Fel
step
.goto Arathi Highlands,74.00,33.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科林法尔|r交谈
.accept 680 >>接任务: |cRXP_LOOT_真正的威胁|r
.target Korin Fel
.group
step
.goto Arathi Highlands,72.64,33.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈尔姆尔|r交谈
.accept 847 >>接任务: |cRXP_LOOT_迅猛龙的狡诈|r
.target Gor'mul
step
.goto Arathi Highlands,74.70,36.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托加恩|r交谈
.turnin 847 >>交任务: |cRXP_FRIENDLY_迅猛龙的狡诈|r
.target Tor'gan
step
.goto Arathi Highlands,36.07,58.09
>>点击|cRXP_PICK_钥匙之石|r
>>|cRXP_WARN_小心|r|cRXP_ENEMY_隆隆流亡者|r|cRXP_WARN_. 他们的眩晕效果无递减机制|r
>>|cRXP_WARN_如果你仍在队伍中, 请与你的队伍一起提交此任务！|cRXP_ENEMY_瑟恩纳|r, 将刷新一名42级精英怪. 你可以选择击杀他, 或者单人时逃跑并重置该怪物|r
.turnin 652 >>交任务: |cRXP_FRIENDLY_打开钥匙之石|r
.group
.isQuestComplete 652
step
.goto Arathi Highlands,36.07,58.09
>>点击|cRXP_PICK_钥匙之石|r
>>|cRXP_WARN_小心|r|cRXP_ENEMY_隆隆流亡者|r|cRXP_WARN_. 他们的眩晕效果无递减机制|r
.accept 688 >>接任务: |cRXP_LOOT_密斯莱尔的盟友|r
.group
.isQuestTurnedIn 652
step
#completewith next
>>击杀|cRXP_ENEMY_石拳萨满祭司|r 和|cRXP_ENEMY_石拳领主|r
.complete 679,1 
.mob +Boulderfist Shaman
.complete 679,2 
.mob +Boulderfist Lord
.isOnQuest 679
.group 3
step
.goto Arathi Highlands,18.74,66.30,30,0
.goto Arathi Highlands,19.6,66.9
>>击杀|cRXP_ENEMY_Or'Kalar|r. 击败他后搜刮他的|cRXP_LOOT_Head|r
>>|cRXP_ENEMY_奥尔卡拉|r|cRXP_WARN_可在阿拉索塔基地周围的两个区域生成|r
.complete 680,1 
.unitscan Or'Kalar
.isOnQuest 680
.group 3
step
#loop
.goto Arathi Highlands,18.91,65.80,0
.goto Arathi Highlands,18.91,65.80,50,0
.goto Arathi Highlands,20.05,65.43,50,0
.goto Arathi Highlands,20.50,66.72,50,0
.goto Arathi Highlands,21.49,67.03,50,0
.goto Arathi Highlands,21.84,65.41,50,0
.goto Arathi Highlands,23.64,65.69,50,0
.goto Arathi Highlands,22.25,67.74,50,0
.goto Arathi Highlands,20.89,69.19,50,0
.goto Arathi Highlands,19.51,69.14,50,0
.goto Arathi Highlands,18.26,67.42,50,0
>>击杀|cRXP_ENEMY_石拳萨满祭司|r 和|cRXP_ENEMY_石拳领主|r
.complete 679,1 
.mob +Boulderfist Shaman
.complete 679,2 
.mob +Boulderfist Lord
.isOnQuest 679
.group 3
step
#completewith next
>>击杀 |cRXP_ENEMY_激流堡仲裁者|r. 从他们身上搜刮 |cRXP_LOOT_符印碎片|r
>>|cRXP_ENEMY_风暴守卫者|r|cRXP_WARN_有盾击|r
.complete 640,1 
.mob Stromgarde Troll Hunter
.mob Stromgarde Defender
.mob Stromgarde Vindicator
.isOnQuest 640
.group 3
step
.goto Arathi Highlands,29.45,64.39,30,0
.goto Arathi Highlands,29.63,62.95
>>击杀|cRXP_ENEMY_玛雷兹·考尔|r. 掠夺她的|cRXP_LOOT_魔法之球|r
>>|cRXP_WARN_她在城堡东侧有两个刷新点|r
.complete 673,1 
.unitscan Marez Cowl
.isOnQuest 673
.group 3
step
#loop
.goto Arathi Highlands,23.73,60.75,0
.goto Arathi Highlands,23.73,60.75,50,0
.goto Arathi Highlands,23.25,63.09,50,0
.goto Arathi Highlands,22.03,63.07,50,0
.goto Arathi Highlands,21.21,63.22,50,0
.goto Arathi Highlands,21.19,60.65,50,0
.goto Arathi Highlands,22.49,59.37,50,0
.goto Arathi Highlands,22.83,58.02,50,0
.goto Arathi Highlands,23.82,57.13,50,0
.goto Arathi Highlands,24.92,57.18,50,0
.goto Arathi Highlands,27.50,57.62,50,0
.goto Arathi Highlands,27.37,58.92,50,0
.goto Arathi Highlands,24.36,58.87,50,0
.goto Arathi Highlands,23.49,59.57,50,0
>>击杀 |cRXP_ENEMY_激流堡仲裁者|r. 从他们身上搜刮 |cRXP_LOOT_符印碎片|r
>>|cRXP_ENEMY_风暴守卫者|r|cRXP_WARN_有盾击|r
.complete 640,1 
.isOnQuest 640
.mob Stromgarde Troll Hunter
.mob Stromgarde Defender
.mob Stromgarde Vindicator
.group 3
step << skip
.goto Arathi Highlands,29.59,59.54
.goto Arathi Highlands,73.66,29.11,30 >>|cRXP_WARN_进入墓穴, 跳到火光灯塔顶部. 通过登出再重新登录来实现登出跳跃|r
.link https://www.youtube.com/watch?v=ppLRbuzEKGc&ab_channel=RestedXP >>|cRXP_WARN_点击此处查看示例|r
.group
step
#completewith next
.goto Arathi Highlands,73.52,33.20,150 >>返回落锤镇
.group
step
.goto Arathi Highlands,74.70,36.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托加恩|r交谈
.turnin 673 >>交任务: |cRXP_FRIENDLY_邪恶的魔法|r
.turnin 640 >>交任务: |cRXP_FRIENDLY_破碎的符印|r
.accept 641 >>接任务: |cRXP_WARN_索拉丁符印|r
.target Tor'gan
.isQuestComplete 673
.isQuestComplete 640
.group
step
#optional
.goto Arathi Highlands,74.70,36.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托加恩|r交谈
.turnin 673 >>交任务: |cRXP_FRIENDLY_邪恶的魔法|r
.target Tor'gan
.isQuestComplete 673
.group
step
#optional
.goto Arathi Highlands,74.70,36.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托加恩|r交谈
.turnin 640 >>交任务: |cRXP_FRIENDLY_破碎的符印|r
.accept 641 >>接任务: |cRXP_WARN_索拉丁符印|r
.target Tor'gan
.isQuestComplete 640
.group
step
#optional
.goto Arathi Highlands,74.70,36.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托加恩|r交谈
.accept 641 >>接任务: |cRXP_WARN_索拉丁符印|r
.target Tor'gan
.isQuestTurnedIn 640
.group
step
.goto Arathi Highlands,74.00,33.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科林法尔|r交谈
.turnin 680 >>交任务: |cRXP_FRIENDLY_真正的威胁|r
.target Korin Fel
.isQuestComplete 680
.group
step
.goto Arathi Highlands,73.80,33.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森古|r交谈
.turnin 641 >>交任务: |cRXP_FRIENDLY_索拉丁符印|r
.accept 643 >>接任务: |cRXP_WARN_阿拉索符印|r
.target Zengu
.isQuestComplete 641
.group
step
#optional
.goto Arathi Highlands,73.80,33.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森古|r交谈
.accept 643 >>接任务: |cRXP_WARN_阿拉索符印|r
.target Zengu
.isQuestTurnedIn 641
.group
step
.goto Arathi Highlands,74.25,33.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜拉姆法尔|r交谈
.turnin 679 >>交任务: |cRXP_FRIENDLY_短兵相接|r
.target Drum Fel
.isQuestComplete 679
.group
step
.goto Arathi Highlands,73.84,32.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板埃德瓦|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Adegwa
step
.goto Arathi Highlands,73.41,36.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里高利·维克托医生|r交谈
.accept 6622 >>接任务: |cRXP_WARN_救死扶伤|r
.target Doctor Gregory Victor
.skill firstaid,<225,1
step
.goto Arathi Highlands,73.03,36.84
.use 16991 >>|cRXP_WARN_引导|r|T133682:0|t[急救绷带]|cRXP_WARN_施加在|cRXP_FRIENDLY_部落士兵|r上. 优先为|cRXP_FRIENDLY_受致命伤的士兵|r施加|r
.complete 6622,1 
.target Critically Injured Horde Soldier
.target Badly Injured Horde Soldier
.target Injured Horde Soldier
.isOnQuest 6622
step
.goto Arathi Highlands,73.41,36.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里高利·维克托医生|r交谈
.turnin 6622 >>交任务: |cRXP_FRIENDLY_救死扶伤|r
.target Doctor Gregory Victor
.isQuestComplete 6622
step
.destroy 16991 >>摧毁: |cRXP_ENEMY_急救绷带|r
.isQuestTurnedIn 6622
step
.goto Arathi Highlands,74.40,35.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨鲁克|r交谈
.turnin 688 >>交任务: |cRXP_FRIENDLY_密斯莱尔的盟友|r
.accept 687 >>接任务: |cRXP_LOOT_迷失者塞尔杜林|r
.target Zaruk
.isQuestTurnedIn 652
.group
step
#loop
.goto Arathi Highlands,27.4,58.2,0
.goto Arathi Highlands,53.8,40.8,60,0
.goto Arathi Highlands,49.5,44.0,60,0
.goto Arathi Highlands,43.2,55.1,60,0
.goto Arathi Highlands,34.7,52.2,60,0
.goto Arathi Highlands,27.2,49.8,60,0
.goto Arathi Highlands,66.0,55.6,60,0
.goto Arathi Highlands,24.2,60.3,60,0
.goto Arathi Highlands,27.4,58.2,60,0
>>击杀 |cRXP_ENEMYT_Lieutenant Valorcall|r及其两名 |cRXP_ENEMY_激流堡骑兵|r. 击败瓦罗卡尔中尉后拾取其持有的 |cRXP_LOOT_Sigil|r
>>|cRXP_WARN_瓦罗卡尔中尉会治疗并使用神圣之盾. 他的骑兵拥有高伤害的冲锋技能|r
.complete 643,1 
.unitscan Lieutenant Valorcall
.mob Stromgarde Cavalryman
.isQuestTurnedIn 641
.group 3
step
.goto Arathi Highlands,73.80,33.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森古|r交谈
.turnin 643 >>交任务: |cRXP_FRIENDLY_阿拉索符印|r
.accept 644 >>接任务: |cRXP_WARN_托尔贝恩符印|r
.target Zengu
.isQuestComplete 643
.group
step
#optional
.goto Arathi Highlands,73.80,33.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森古|r交谈
.accept 644 >>接任务: |cRXP_WARN_托尔贝恩符印|r
.target Zengu
.isQuestTurnedIn 643
.group
step
.goto Arathi Highlands,28.5,58.1
>>击杀|cRXP_ENEMY_加林·托尔贝恩王子|r. 击败他后可获得他的|cRXP_LOOT_印记|r
.complete 644,1 
.unitscan Prince Galen Trollbane
.isQuestTurnedIn 643
.group 3
step
.goto Arathi Highlands,73.80,33.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森古|r交谈
.turnin 644 >>交任务: |cRXP_FRIENDLY_托尔贝恩符印|r
.accept 645 >>接任务: |cRXP_WARN_托卡拉尔|r
.target Zengu
.isQuestComplete 644
.group
step
#optional
.goto Arathi Highlands,73.80,33.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森古|r交谈
.accept 645 >>接任务: |cRXP_WARN_托卡拉尔|r
.target Zengu
.isQuestTurnedIn 644
.group
step
.goto Arathi Highlands,28.9,59.6
>>点击|cRXP_PICK_托尔贝恩的墓室|r
.turnin 645 >>交任务: |cRXP_FRIENDLY_托卡拉尔|r
.accept 646 >>接任务: |cRXP_WARN_托卡拉尔|r
.isQuestTurnedIn 644
.group 3
step
#completewith next
.goto Arathi Highlands,21.6,75.6,30,0
.goto Arathi Highlands,22.1,79.9,25 >>穿过洞穴前往法迪尔海湾
step
.goto Arathi Highlands,31.83,82.67
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛洛|r交谈
.accept 663 >>接任务: |cRXP_LOOT_法迪尔海湾|r
.target Lolo the Lookout
step
.goto Arathi Highlands,32.28,81.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙克斯·奥布里|r交谈
.turnin 663 >>交任务: |cRXP_FRIENDLY_法迪尔海湾|r
.target Shakes O'Breen
step
.goto Arathi Highlands,32.78,81.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nilzlix|r交谈
.accept 662 >>接任务: |cRXP_LOOT_深海打捞|r
.target First Mate Nilzlix
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯迪加特船长|r和|cRXP_FRIENDLY_菲兹索普教授|r交谈
.accept 664 >>接任务: |cRXP_LOOT_船长的复仇|r
.target +Captain Steelgut
.goto Arathi Highlands,34.00,80.79
.accept 665 >>接任务: |cRXP_LOOT_水下宝藏|r
.target +Professor Phizzlethorpe
.goto Arathi Highlands,33.87,80.55
step
.goto Arathi Highlands,35.7,79.7
>>等待|cRXP_FRIENDLY_Phizzlethorpe|r完成角色扮演, 然后击杀生成的两个|cRXP_ENEMY_复仇巨浪|r
>>|cRXP_WARN_这些怪物等级为40级. 请尽快将它们从|cRXP_FRIENDLY_Phizzlethorpe|r|cRXP_WARN_上移开|r
.complete 665,1 
.unitscan Vengeful Surge
step
.goto Arathi Highlands,33.8,80.5
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德拉克里格博士|r交谈
.turnin 665 >>交任务: |cRXP_FRIENDLY_水下宝藏|r
.accept 666 >>接任务: |cRXP_LOOT_水下宝藏|r
.target Doctor Draxlegauge
step << !Druid !Warlock !Shaman
#ah
#completewith SLog
.aura 7178 >>|cRXP_WARN_喝下|r |T134797:0|t[水下呼吸药剂]
.use 5996
.itemcount 5996,1
step
#sticky
#completewith Daggerspines
+|cRXP_ENEMY_刺脊袭击者|r|cRXP_WARN_拥有网状能力, 因此如果你还没使用过|r|T134797:0|t[水下呼吸药剂], 请务必小心你的呼吸 << !Druid !Warlock !Shaman
+|cRXP_ENEMY_刺脊袭击者|r|cRXP_WARN_拥有网技能, 因此请务必保持水下呼吸效果生效|r << Warlock/Shaman
+|cRXP_WARN_当你的呼吸值较低时, 使用水栖形态|r << Druid
step
#completewith ElvenGems
>>击杀|cRXP_ENEMY_刺脊袭击者|r和|cRXP_ENEMY_法师|r
.complete 664,1 
.mob +Daggerspine Raider
.complete 664,2 
.mob +Daggerspine Sorceress
step
#completewith SLog
>>找到|cRXP_PICK_石化精灵宝钻|r. 击杀后获得|cRXP_LOOT_精灵宝石|r
.use 4491 >>|cRXP_WARN_装备你的|r|T133149:0|t[寻宝潜水镜]|cRXP_WARN_以在小地图上查看它们|r
.complete 666,1 
step
.goto Arathi Highlands,23.40,85.09
>>掠夺|cRXP_PICK_Book|r获取|cRXP_LOOT_处女号的航海日志|r
>>|cRXP_WARN_日志位于船体中层, 靠近船头位置|r
.complete 662,2 
step
.goto Arathi Highlands,23.04,84.51
>>掠夺|cRXP_PICK_展开的羊皮纸|r获取|cRXP_LOOT_处女号的航海图|r
>>|cRXP_WARN_海图位于船体中层, 靠近中心位置|r
.complete 662,1 
step
.goto Arathi Highlands,20.46,85.61
>>掠夺|cRXP_PICK_展开的羊皮纸|r以获得|cRXP_LOOT_银松之魂号的航海图|r
>>|cRXP_WARN_图表位于船体中层和靠近船头位置, 放在一门大炮旁的箱子上|r
.complete 662,3 
step
#label SLog
.goto Arathi Highlands,20.65,85.10
>>掠夺|cRXP_PICK_Book|r获取|cRXP_LOOT_银松之魂号的航海日志|r
>>|cRXP_WARN_原木位于船体最底层, 靠近船头, 埋在泥土中|r
.complete 662,4 
step
#label ElvenGems
#loop
.goto Arathi Highlands,19.30,84.10,0
.goto Arathi Highlands,19.30,84.10,60,0
.goto Arathi Highlands,17.70,89.50,60,0
.goto Arathi Highlands,25.50,90.80,60,0
.goto Arathi Highlands,24.10,85.70,60,0
.goto Arathi Highlands,23.20,89.70,60,0
>>找到|cRXP_PICK_石化精灵宝钻|r. 击杀后获得|cRXP_LOOT_精灵宝石|r
.use 4491 >>|cRXP_WARN_装备你的|r|T133149:0|t[寻宝潜水镜]|cRXP_WARN_以在小地图上查看它们|r
.complete 666,1 
step
#label Daggerspines
#loop
.goto Arathi Highlands,21.05,84.62,0
.goto Arathi Highlands,21.05,84.62,60,0
.goto Arathi Highlands,23.44,84.76,60,0
.goto Arathi Highlands,25.38,86.03,60,0
.goto Arathi Highlands,23.14,89.88,60,0
.goto Arathi Highlands,21.55,86.67,60,0
.goto Arathi Highlands,18.75,85.31,60,0
.goto Arathi Highlands,19.76,84.00,60,0
>>完成击杀|cRXP_ENEMY_刺脊袭击者|r和|cRXP_ENEMY_法师|r
.complete 664,1 
.mob +Daggerspine Raider
.complete 664,2 
.mob +Daggerspine Sorceress
step
#completewith next
+|cRXP_WARN_重新装备你常用的头盔, 然后手动跳过此步骤|r
step
#requires ElvenGems
.goto Arathi Highlands,32.77,81.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nilzlix|r交谈
.turnin 662 >>交任务: |cRXP_FRIENDLY_深海打捞|r
.target First Mate Nilzlix
step
.goto Arathi Highlands,33.86,80.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德拉克斯拉盖|r交谈
.turnin 666 >>交任务: |cRXP_FRIENDLY_水下宝藏|r
.accept 668 >>接任务: |cRXP_LOOT_水下宝藏|r
.target Doctor Draxlegauge
step
.goto Arathi Highlands,34.00,80.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯迪加特船长|r交谈
.turnin 664 >>交任务: |cRXP_FRIENDLY_船长的复仇|r
.target Captain Steelgut
step
.goto Arathi Highlands,32.28,81.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙克斯·奥布里|r交谈
.turnin 668 >>交任务: |cRXP_FRIENDLY_水下宝藏|r
.accept 669 >>接任务: |cRXP_LOOT_水下宝藏|r
.target Shakes O'Breen
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 41-42 荒芜之地
#displayname 41-42 荒芜之地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 40-50
#next 42-43号 荆棘谷
step
#completewith WetlandsLogoutSkip
.goto Wetlands,32.78,13.12
.zone Wetlands >>前往: |cRXP_PICK_湿地|r
step
#optional
.abandon 639 >>放弃激流堡符印
.isOnQuest 639
step
#optional
.abandon 652 >>放弃打开钥匙之石
.isOnQuest 652
step
#optional
.abandon 673 >>摒弃邪恶的魔法
.isOnQuest 673
step
#optional
.abandon 680 >>放弃真正的威胁
.isOnQuest 680
step
#optional
.abandon 640 >>放弃破碎的符印
.isOnQuest 640
step
#optional
.abandon 679 >>放弃短兵相接
.isOnQuest 679
step
#optional
.abandon 643 >>放弃阿拉索符印
.isOnQuest 643
step << skip
.goto Wetlands,53.86,46.42,150,0
.goto Wetlands,63.9,78.6
.zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r, 在洞穴后面的蘑菇上注销。当你重新登录时，这会将你传送到塞尔萨玛外面
.link https://www.youtube.com/watch?v=21CuGto26Mk >>点击此处观看视频教程
>>|cRXP_WARN_在塞尔萨玛登录后, 向西南方向跑到道路另一边以避开守卫. 登录时务必小心不要向前移动, 否则很可能激怒30-40级的守卫|r
.unitscan Mountaineer Stenn
.unitscan Mountaineer Kamdar
step
#optional
#label WetlandsLogoutSkip
step
#completewith next
+|cRXP_WARN_当心！不要被|cRXP_ENEMY_Mountaineers|r(矮人守卫)击中, 否则你会被标记为PVP状态！|r
step
#completewith next
.goto Loch Modan,25.34,67.27,0
.goto Loch Modan,24.76,70.59,30,0
.goto Loch Modan,25.10,72.98,30,0
.goto Loch Modan,26.11,75.42,30,0
.goto Loch Modan,23.27,81.30,30,0
.goto Loch Modan,22.82,84.81,30,0
.goto Loch Modan,19.59,87.23,30,0
.goto Loch Modan,20.37,91.08,30,0
.goto Loch Modan,22.33,91.55,30,0
.goto Loch Modan,22.87,94.92,30,0
.goto Badlands,5.73,29.78,0
>>使用快捷方式更快抵达荒芜之地
.zone Badlands >>前往: |cRXP_PICK_荒芜之地|r
.link https://www.youtube.com/watch?v=oNFXup-DCM0 >>点击此处观看视频教程
step
.goto Badlands,3.99,44.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里克|r交谈
.fp Kargath >>获取卡加斯的飞行点
.target Gorrik
step
.goto Badlands,2.90,47.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯兰达|r交谈
.vendor >>|cRXP_BUY_出售你的垃圾物品, 并在必要时进行修理|r
.target Sranda
step
.goto Badlands,2.91,45.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高恩|r交谈
.accept 782 >>接任务: |cRXP_LOOT_破碎的联盟|r
.target Gorn
.group
step
.goto Badlands,2.42,46.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加卡尔|r交谈
.accept 2258 >>接任务: |cRXP_LOOT_荒芜之地的材料|r
.target Jarkal Mossmeld
step
.goto Badlands,6.4,47.5
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼卡·血痕|r交谈
.accept 1419 >>接任务: |cRXP_LOOT_捕猎山狗|r
.target Neeka Bloodscar
step
#ah
.goto Badlands,25.95,44.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁特维尔·沃拉图斯|r交谈
.accept 713 >>接任务: |cRXP_WARN_至关重要的冷却剂|r
.turnin 713 >>交任务: |cRXP_FRIENDLY_至关重要的冷却剂|r
.target Lotwil Veriatus
.itemcount 3829,1 
step
#ah
.goto Badlands,25.95,44.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁特维尔·沃拉图斯|r交谈
.accept 714 >>接任务: |cRXP_WARN_发条式什么什么仪|r
.turnin 714 >>交任务: |cRXP_FRIENDLY_发条式什么什么仪|r
.target Lotwil Veriatus
.itemcount 4389,1 
.isQuestTurnedIn 713
step
.goto Badlands,25.95,44.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁特维尔·沃拉图斯|r交谈
.accept 710 >>接任务: |cRXP_LOOT_研究石元素|r
.target Lotwil Veriatus
step
#completewith badlandsall
>>在任务过程中, 击杀你遇到的任何|cRXP_ENEMY_秃鹫|r和|cRXP_ENEMY_山狗|r. 从它们身上搜刮|cRXP_LOOT_翅膀|r和|cRXP_LOOT_胃石|r和|cRXP_LOOT_下颌骨|r和|cRXP_LOOT_毒牙|r|r
>>|cRXP_WARN_不要关注这个, 稍后再完成即可|r
.collect 3404,4,703,1 
.mob +Buzzard
.mob +Giant Buzzard
.mob +Starving Buzzard
.complete 2258,1 
.mob +Buzzard
.mob +Giant Buzzard
.mob +Starving Buzzard
.complete 1419,1 
.mob +Crag Coyote
.mob +Feral Crag Coyote
.mob +Rabid Crag Coyote
.mob +Elder Crag Coyote
.complete 2258,2 
.mob +Crag Coyote
.mob +Feral Crag Coyote
.mob +Rabid Crag Coyote
.mob +Elder Crag Coyote
step
#loop
.goto Badlands,23.41,45.26,0
.goto Badlands,23.41,45.26,50,0
.goto Badlands,21.90,43.22,50,0
.goto Badlands,19.99,43.10,50,0
.goto Badlands,17.76,41.06,50,0
.goto Badlands,16.62,38.29,50,0
.goto Badlands,14.78,37.34,50,0
.goto Badlands,13.48,37.80,50,0
.goto Badlands,13.01,40.09,50,0
.goto Badlands,15.11,41.89,50,0
.goto Badlands,16.94,42.80,50,0
.goto Badlands,19.17,45.74,50,0
.goto Badlands,20.47,48.40,50,0
.goto Badlands,23.12,48.20,50,0
>>击杀|r|cRXP_ENEMY_土元素|r. 从他们身上获取|r|cRXP_LOOT_石片|r和|r|cRXP_LOOT_元素碎片|r
.complete 710,1 
.complete 2258,3 
.mob Lesser Rock Elemental
.mob Rock Elemental
.mob Enraged Rock Elemental
.mob Greater Rock Elemental
step
#label badlandsall
.goto Badlands,25.95,44.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁特维尔·沃拉图斯|r交谈
.turnin 710 >>交任务: |cRXP_FRIENDLY_研究石元素|r
.accept 711 >>接任务: |cRXP_LOOT_研究石元素|r
.target Lotwil Veriatus
step
#completewith next
>>击杀 |cRXP_ENEMY_山狗|r. 从它们身上搜刮出 |cRXP_LOOT_下颌骨|r和 |cRXP_LOOT_毒牙|r
.complete 1419,1 
.complete 2258,2 
.mob Buzzard
.mob Giant Buzzard
.mob Starving Buzzard
.mob Crag Coyote
.mob Feral Crag Coyote
.mob Rabid Crag Coyote
.mob Elder Crag Coyote
step
#loop
.goto Badlands,17.24,58.53,0
.goto Badlands,17.24,58.53,50,0
.goto Badlands,15.35,58.51,50,0
.goto Badlands,14.85,60.16,50,0
.goto Badlands,15.00,61.98,50,0
.goto Badlands,16.15,61.84,50,0
.goto Badlands,17.01,61.24,50,0
>>击杀|cRXP_ENEMY_秃鹫|r. 从它们身上搜刮|cRXP_LOOT_翅膀|r
.collect 3404,4,703,1 
.mob Buzzard
.mob Giant Buzzard
.mob Starving Buzzard
step
#completewith badlands3
>>击杀|cRXP_ENEMY_山狗|r和|cRXP_ENEMY_秃鹫|r. 击败它们后拾取其掉落的|cRXP_LOOT_下颌骨|r和|cRXP_LOOT_毒牙|r和|cRXP_LOOT_胃石|r
>>|cRXP_WARN_优先考虑|r|cRXP_ENEMY_山狗|r|cRXP_WARN_over|r|cRXP_ENEMY_秃鹫|r
.complete 1419,1 
.mob +Crag Coyote
.mob +Feral Crag Coyote
.mob +Rabid Crag Coyote
.mob +Elder Crag Coyote
.complete 2258,2 
.mob +Crag Coyote
.mob +Feral Crag Coyote
.mob +Rabid Crag Coyote
.mob +Elder Crag Coyote
.complete 2258,1 
.mob +Buzzard
.mob +Giant Buzzard
.mob +Starving Buzzard
step
.goto Badlands,42.47,52.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹里克|r交谈
.vendor >>|cRXP_BUY_出售你的垃圾物品, 并在必要时进行修理|r
.target Jazzrik
step
#ah
.goto Badlands,42.39,52.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里格弗兹|r交谈
.accept 705 >>接任务: |cRXP_LOOT_潜水采珍珠|r
.turnin 705 >>交任务: |cRXP_FRIENDLY_潜水采珍珠|r
.target Rigglefuzz
.itemcount 4611,9 
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里格弗兹|r和|cRXP_FRIENDLY_马特克|r交谈
.accept 703 >>接任务: |cRXP_LOOT_烧烤秃鹰翅膀|r
.turnin 703 >>交任务: |cRXP_FRIENDLY_烧烤秃鹰翅膀|r
.target +Rigglefuzz
.goto Badlands,42.39,52.92
.turnin 1106 >>交任务: |cRXP_FRIENDLY_流放者马特克|r
.accept 1108 >>接任务: |cRXP_LOOT_精铁碎片|r
.target +Martek the Exiled
.goto Badlands,42.21,52.70
step
#sticky
#label signofearthBL
>>找到并击杀首领Tho'grun, 从他身上搜刮大地之印
>>|cRXP_LOOT_Boss 托格伦|r|cRXP_WARN_在该区域巡逻, 身旁有五名护卫|r
.complete 782,1 
.unitscan Boss Tho'grun
.mob Dustbelcher Mystic
.mob Dustbelcher Wyrmhunter
.mob Dustbelcher Shaman
.mob Dustbelcher Mauler
.isOnQuest 782
.group 3
step
#loop
.goto Badlands,36.20,75.10,0
.goto Badlands,36.20,75.10,50,0
.goto Badlands,46.00,78.40,50,0
.goto Badlands,42.80,87.20,50,0
>>击杀|cRXP_ENEMY_石元素|r. 击败它们以获取|cRXP_LOOT_石板|r
>>|cRXP_ENEMY_岩石元素|r|cRXP_WARN_在这一带的南部地区非常常见, 但之前元素任务中的北部区域也有一些分布|r
.complete 711,1 
.mob Rock Elemental
step
.goto Badlands,51.38,76.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Theldurin|r交谈
.turnin 687 >>交任务: |cRXP_FRIENDLY_迷失者塞尔杜林|r
.accept 709 >>接任务: |cRXP_LOOT_化解灾难|r
.target Theldurin the Lost
.isOnQuest 687
.group
step
.goto Badlands,51.38,76.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Theldurin|r交谈
.accept 709 >>接任务: |cRXP_LOOT_化解灾难|r
.target Theldurin the Lost
.group
step
#loop
.goto Badlands,47.16,69.82,0
.goto Badlands,47.16,69.82,50,0
.goto Badlands,48.38,72.06,50,0
.goto Badlands,49.86,72.12,50,0
.goto Badlands,51.20,71.93,50,0
.goto Badlands,52.41,69.96,50,0
.goto Badlands,52.55,67.79,50,0
.goto Badlands,52.46,65.90,50,0
.goto Badlands,51.00,63.86,50,0
.goto Badlands,49.66,63.97,50,0
.goto Badlands,49.69,66.39,50,0
.goto Badlands,49.78,68.28,50,0
.goto Badlands,48.14,68.30,50,0
>>击杀|cRXP_ENEMY_石窟穴居人|r. 从他们身上搜刮出|cRXP_LOOT_精铁碎片|r
.complete 1108,1 
.mob Stonevault Bonesnapper
.mob Stonevault Shaman
step
#label badlands3
.goto Badlands,42.21,52.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛特克|r交谈
.turnin 1108 >>交任务: |cRXP_FRIENDLY_精铁碎片|r
.timer 20,Indurium RP
.accept 1137 >>接任务: |cRXP_LOOT_回复菲兹尔|r
.target Martek the Exiled
step
#completewith next
>>击杀|cRXP_ENEMY_秃鹫|r. 击败它们后搜刮出|cRXP_LOOT_胃囊|r
.complete 2258,1 
.mob Buzzard
.mob Giant Buzzard
.mob Starving Buzzard
step
#loop
.goto Badlands,25.09,55.10,0
.goto Badlands,44.11,71.87,90,0
.goto Badlands,37.09,69.28,90,0
.goto Badlands,30.28,62.70,90,0
.goto Badlands,25.09,55.10,90,0
>>击杀 |cRXP_ENEMY_山狗|r. 从它们身上搜刮出 |cRXP_LOOT_下颌骨|r和 |cRXP_LOOT_毒牙|r
.complete 1419,1 
.complete 2258,2 
.mob Crag Coyote
.mob Feral Crag Coyote
.mob Rabid Crag Coyote
.mob Elder Crag Coyote
step
#loop
.goto Badlands,17.24,58.53,0
.goto Badlands,17.24,58.53,50,0
.goto Badlands,15.35,58.51,50,0
.goto Badlands,14.85,60.16,50,0
.goto Badlands,15.00,61.98,50,0
.goto Badlands,16.15,61.84,50,0
.goto Badlands,17.01,61.24,50,0
>>击杀|cRXP_ENEMY_秃鹫|r. 击败它们后搜刮出|cRXP_LOOT_胃囊|r
.complete 2258,1 
.mob Buzzard
.mob Giant Buzzard
.mob Starving Buzzard
step
.goto Badlands,6.49,47.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Neeka|r交谈
.turnin 1419 >>交任务: |cRXP_FRIENDLY_捕猎山狗|r
.target Neeka Bloodscar
step
.goto Badlands,2.42,46.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jarkal|r交谈
.turnin 2258 >>交任务: |cRXP_FRIENDLY_荒芜之地的材料|r
.accept 2202 >>接任务: |cRXP_LOOT_奥达曼的蘑菇|r
.target Jarkal Mossmeld
.group
step
.goto Badlands,2.42,46.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jarkal|r交谈
.turnin 2258 >>交任务: |cRXP_FRIENDLY_荒芜之地的材料|r
.target Jarkal Mossmeld
step
#completewith RockyElements
.destroy 7846 >>摧毁: |cRXP_ENEMY_峭壁山狗的牙齿|r
.itemcount 7846,1
step
#requires signofearthBL
.goto Badlands,2.91,45.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高恩|r交谈
.turnin 782 >>交任务: |cRXP_FRIENDLY_破碎的联盟|r
.target Gorn
.isQuestComplete 782
.group
step
#label RockyElements
.goto Badlands,25.95,44.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁特维尔·沃拉图斯|r交谈
.turnin 711 >>交任务: |cRXP_FRIENDLY_研究石元素|r
.target Lotwil Veriatus
step
.goto Badlands,42.39,52.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里格弗兹|r交谈
.accept 2418 >>接任务: |cRXP_WARN_能量石|r
.target Rigglefuzz
.group
step
#completewith Tablet
>>击杀 |cRXP_ENEMY_Shadowforge Dwarves|r和 |cRXP_ENEMY_Stonevault Troggs|r有几率获得 |T133289:0|t[|cRXP_LOOT_破碎的项链|r]
>>|cRXP_WARN_由于可能存在任务日志问题, 请暂时不要接受此任务|r
.collect 7666,1,2283,1 
.group 3
step
#completewith next
.goto Eastern Kingdoms,54.49,57.77
.zone 1415 >>前往荒芜之地北方的造物主露台, 然后进入洞穴
.group 3
step
#completewith Tablet
>>收集|cRXP_PICK_紫色蘑菇|r以获得|cRXP_LOOT_菌菇帽|r
>>击杀|cRXP_ENEMY_暗铸矮人|r. 从他们身上搜刮出|cRXP_LOOT_能量石|r
>>|cRXP_WARN_小心！|cRXP_ENEMY_暗炉勘探员|r|cRXP_WARN_使用冰霜新星和|cRXP_ENEMY_黑曜石傀儡|r可以反射法术, 并且对嘲讽免疫！|r
.complete 2202,1 
.complete 2418,1 
.complete 2418,2 
.mob Shadowforge Surveyor
.mob Shadowforge Ruffian
.mob Shadowforge Digger
.group 3
step
.goto Eastern Kingdoms,53.81,57.94,0
.goto Eastern Kingdoms,53.81,57.94,20,0
.goto Eastern Kingdoms,53.69,57.94,12,0
.goto Eastern Kingdoms,53.78,58.23
>>在南公共大厅的南角处掠夺|cRXP_PICK_加勒特家族宝箱|r, 获得|cRXP_LOOT_加勒特的家族宝藏|r
>>|cRXP_WARN_南公共大厅位于奥达曼副本入口的西南方向|r
.complete 2342,1 
.isOnQuest 2342
.group 3
step
#label Tablet
.goto Eastern Kingdoms,53.99,57.90,0
.goto Eastern Kingdoms,53.99,57.90,25,0
.goto Eastern Kingdoms,54.14,58.24
>>在房间中央搜刮|cRXP_PICK_古代储物箱|r获得|cRXP_LOOT_里恩之石板|r
.complete 709,1 
.group 3
step
#loop
.goto Eastern Kingdoms,54.15,58.05,0
.goto Eastern Kingdoms,54.15,58.05,50,0
.goto Eastern Kingdoms,54.25,58.03,50,0
.goto Eastern Kingdoms,54.03,57.96,50,0
.goto Eastern Kingdoms,54.01,58.18,50,0
.goto Eastern Kingdoms,54.03,57.96,50,0
.goto Eastern Kingdoms,53.97,57.91,50,0
.goto Eastern Kingdoms,53.95,58.03,50,0
.goto Eastern Kingdoms,53.87,57.93,50,0
.goto Eastern Kingdoms,53.71,57.92,50,0
.goto Eastern Kingdoms,53.87,57.93,50,0
.goto Eastern Kingdoms,53.90,57.81,50,0
.goto Eastern Kingdoms,53.87,57.93,50,0
.goto Eastern Kingdoms,53.95,58.03,50,0
.goto Eastern Kingdoms,53.97,57.91,50,0
.goto Eastern Kingdoms,53.94,57.78,50,0
.goto Eastern Kingdoms,54.03,57.69,50,0
.goto Eastern Kingdoms,54.18,57.79,50,0
.goto Eastern Kingdoms,54.11,57.84,50,0
.goto Eastern Kingdoms,54.20,57.87,50,0
.goto Eastern Kingdoms,54.29,57.77,50,0
.goto Eastern Kingdoms,54.20,57.67,50,0
.goto Eastern Kingdoms,54.11,57.84,50,0
.goto Eastern Kingdoms,54.18,57.79,50,0
.goto Eastern Kingdoms,54.03,57.69,50,0
.goto Eastern Kingdoms,53.94,57.78,50,0
.goto Eastern Kingdoms,54.03,57.96,50,0
>>完成掠夺|cRXP_PICK_紫色蘑菇|r以获得|cRXP_LOOT_蘑菇帽|r
>>击杀|cRXP_ENEMY_Shadowforge Dwarves|r. 从他们身上搜刮|cRXP_LOOT_能量石|r
>>|cRXP_WARN_小心！|cRXP_ENEMY_暗炉勘探员|r|cRXP_WARN_使用冰霜新星和|cRXP_ENEMY_黑曜石傀儡|r可以反射法术, 并且对嘲讽免疫！|r
.complete 2202,1 
.complete 2418,1 
.complete 2418,2 
.mob Shadowforge Surveyor
.mob Shadowforge Ruffian
.mob Shadowforge Digger
.group 3
step
.goto Eastern Kingdoms,54.51,57.77,10,0
.goto Badlands,51.3,77.0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t离开奥达曼后, 与|cRXP_FRIENDLY_Theldurin|r交谈
.turnin 709 >>交任务: |cRXP_FRIENDLY_化解灾难|r
.target Theldurin the Lost
.group
step
.goto Badlands,42.39,52.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里格弗兹|r交谈
.turnin 2418 >>交任务: |cRXP_FRIENDLY_能量石|r
.target Rigglefuzz
.group
step
.goto Badlands,42.47,52.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹里克|r交谈
.vendor >>|cRXP_BUY_出售你的垃圾物品, 并在必要时进行修理|r
.target Jazzrik
.group
step
.goto Badlands,6.49,47.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Neeka|r交谈
.accept 1420 >>接任务: |cRXP_WARN_向赫格拉姆报到|r
.target Neeka Bloodscar
step
.goto Badlands,2.42,46.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jarkal|r交谈
.turnin 2202 >>交任务: |cRXP_FRIENDLY_奥达曼的蘑菇|r
.target Jarkal Mossmeld
.group
step << Druid
#completewith DruidTraining7
.cast 18960 >>施放 |T135758:0|t[传送:月光林地]
.zoneskip Moonglade
step << Druid
#optional
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 9634 >>训练你的职业法术
.target Loganaar
.xp <40,1
.xp >42,1
step << Druid
#label DruidTraining7
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 9750 >>训练你的职业法术
.target Loganaar
.xp <42,1
step
#completewith next
.hs >>炉石传送至奥格瑞玛
.use 6948
step
.goto Orgrimmar,54.65,67.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酒吧老板莫拉格|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Barkeep Morag
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 42-43号 荆棘谷
#displayname 42-43号 荆棘谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 40-50
#next 43-43 凄凉之地 II
step << Mage
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 8423 >>训练你的职业法术
.target Pephredo
.xp <40,1
.xp >42,1
step << Mage
#optional
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 10159 >>训练你的职业法术
.target Pephredo
.xp <42,1
step << Mage
.goto Orgrimmar,38.70,85.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与小屋顶部的|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 11417 >>传送门 |T135744:0|t[奥格瑞玛]
.target Thuul
.xp <40,1
step << Shaman
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 8134 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <40,1
.xp >42,1
step << Shaman
#optional
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 11314 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <42,1
step << Rogue
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 8624 >>训练你的职业法术
.target Ormok
.xp <40,1
.xp >42,1
step << Rogue
#optional
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 6774 >>训练你的职业法术
.target Ormok
.xp <42,1
step << Rogue
.goto Orgrimmar,42.10,49.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔交谈|r
.vendor >>|cRXP_BUY_储备闪光粉和毒药|r
.target Rekkul
step << Warlock
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 11665 >>训练你的职业法术
.target Mirket
.xp <40,1
.xp >42,1
step << Warlock
#optional
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 6789 >>训练你的职业法术
.target Mirket
.xp <42,1
step << Warlock
.goto Orgrimmar,47.52,46.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈
.vendor >>购买任何你负担得起的宠物升级道具
.target Kurgul
step << Hunter
#optional
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14324 >>训练你的职业法术
.target Ormak Grimshot
.xp <40,1
.xp >42,1
step << Hunter
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14289 >>训练你的职业法术
.target Ormak Grimshot
.xp <42,1
step << Hunter
#optional
.goto Orgrimmar,66.34,14.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xao'tsu|r交谈
.train 14925 >>训练你的宠物法术
.target Xao'tsu
.xp <40,1
.xp >42,1
step << Hunter
.goto Orgrimmar,66.34,14.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xao'tsu|r交谈
.train 24561 >>训练你的宠物法术
.target Xao'tsu
.xp <42,1
step << Hunter
.goto Orgrimmar,78.11,38.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Jin'sora交谈|r
.vendor >>|cRXP_BUY_购买|r|T135489:0|t[|cRXP_FRIENDLY_大型长弓|r]|cRXP_BUY_如果可用|r
.target Jin'sora
.money <6.7952
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<21.9
.itemcount 11307,<1
step << Priest
#optional
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 8106 >>训练你的职业法术
.target Ur'kyo
.xp <40,1
.xp >42,1
step << Priest
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 10898 >>训练你的职业法术
.target Ur'kyo
.xp <42,1
step
.goto Orgrimmar,59.4,36.8
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dran|r交谈
.accept 2283 >>接任务: |cRXP_LOOT_搜寻项链|r
.turnin 2283 >>交任务: |cRXP_FRIENDLY_搜寻项链|r
.target Dran Droffers
.itemcount 7666,1
step << Warrior
#optional
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 11608 >>训练你的职业法术
.target Grezz Ragefist
.xp <40,1
.xp >42,1
step << Warrior
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 11550 >>训练你的职业法术
.target Grezz Ragefist
.xp <42,1
step
.goto Orgrimmar,75.18,34.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔戈洛姆·石槌|r交谈
.accept 2981 >>接任务: |cRXP_LOOT_菲拉斯的危机|r
.target Belgrom Rockmaul
step << Orc !Warlock
#optional
.goto Orgrimmar,69.40,13.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔达|r和|cRXP_FRIENDLY_奥古纳罗|r交谈
.train 825 >>驯兽 |T136103:0|t[狼骑术]
.vendor >>|cRXP_BUY_购买|r|T132224:0|t[|cFF0070FF狼|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Kildar
.target Ogunaro Wolfrunner
step << Shaman
#phase 4-6
.goto Orgrimmar,49.6,69.10
.bankdeposit 7069,7068,7067,7070 >>将以下物品存入您的银行:
>>|T135805:0|t[元素火焰]
>>|T134714:0|t[元素之水]
>>|T134572:0|t[元素之土]
>>|T136107:0|t[元素空气]
step
#ah
#completewith STVZepp
+|cRXP_WARN_检查你的银行是否有任何缺失|r|T134332:0|t[荆棘谷的青山 - 页面]|cRXP_WARN_并从拍卖行购买你仍需要的物品|r
>>|cRXP_WARN_第一章需要:第1和4和6和8页|r
>>|cRXP_WARN_第二章需要:第10和11和14和16页|r
>>|cRXP_WARN_第3章要求:第18和20和21和24页|r
>>|cRXP_WARN_第4章要求:第25和26和27页|r
>>|cRXP_WARN_将任何新购买的页面放入你的银行. 如果你无法获得它们, 请跳过此步骤|r
.solo
step << Troll
#optional
#completewith next
.subzone 367 >>前往森金村
step << Troll
#optional
.goto Durotar,55.28,75.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xar'Ti|r和|cRXP_FRIENDLY_祖尼尔|r交谈
.train 10861 >>训练 |T136103:0|t[迅猛龙骑术]
.vendor >>|cRXP_BUY_购买|r|T132253:0|t[|cFF0070FF迅猛龙|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Xar'Ti
.target Zjolnir
step
#completewith STVZepp
.zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
.zoneskip Durotar
step
#optional
.abandon 782 >>放弃破碎的联盟
.isOnQuest 782
step
#optional
.abandon 709 >>放弃化解灾难, 走向毁灭
.isOnQuest 709
step
#optional
.abandon 2202 >>放弃奥达曼的蘑菇跑环
.isOnQuest 2202
step
#optional
.abandon 2418 >>放弃能量石
.isOnQuest 2418
step
#label STVZepp
.goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
.zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
.zoneskip Stranglethorn Vale
step
.goto Stranglethorn Vale,31.49,29.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板苏贝克|r交谈
.home >>将你的[炉石]设置为格罗姆高营地
.target Innkeeper Thulbek
step
.goto Stranglethorn Vale,32.12,29.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知莫克塔尔丁|r交谈
.accept 572 >>接任务: |cRXP_LOOT_摩克萨尔丁的魔法|r
.target Far Seer Mok'thardin
step
.goto Stranglethorn Vale,32.20,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kin'weelay|r交谈
.turnin 1240 >>交任务: |cRXP_FRIENDLY_巨魔巫医|r
.target Kin'weelay
.isQuestTurnedIn 1238
step
.goto Stranglethorn Vale,32.10,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼姆布亚|r交谈
.accept 584 >>接任务: |cRXP_LOOT_血顶之颅|r
.target Nimboya
step
.goto Stranglethorn Vale,32.20,27.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kin'weelay|r交谈
.accept 598 >>接任务: |cRXP_LOOT_裂骨项链|r
.target Kin'weelay
step
#completewith next
.goto Stranglethorn Vale,23.82,10.78,200 >>前往祖尔库拉废墟
step
#completewith next
>>击杀一只|cRXP_ENEMY_老海鳄|r, 击败后拾取其|cRXP_LOOT_皮肤|r
.complete 628,1 
.unitscan Elder Saltwater Crocolisk
step
.goto Stranglethorn Vale,23.52,9.53
>>击杀|cRXP_ENEMY_可怕的奈兹里奥克|r. 击败他后拾取他的|cRXP_LOOT_头|r
>>|cRXP_WARN_非常小心！|cRXP_ENEMY_Nezzliok|r施放|r|T136115:0|t[冲击]|cRXP_WARN_. 一个瞬间造成280点伤害的法术|r
.complete 584,2 
.unitscan Nezzliok the Dire
step
.goto Stranglethorn Vale,23.44,8.14
>>击杀|cRXP_ENEMY_Gan'zulah|r, 击败他后搜刮其|cRXP_LOOT_Head|r
.complete 584,1 
.unitscan Gan'zulah
step
#completewith next
.subzone 117 >>返回格罗姆高营地
step
#completewith next
>>击杀一只|cRXP_ENEMY_老海鳄|r, 击败后拾取其|cRXP_LOOT_皮肤|r
.complete 628,1 
.unitscan Elder Saltwater Crocolisk
step
.goto Stranglethorn Vale,32.22,27.60
>>点击|cRXP_PICK_冒泡大锅|r
.turnin 584 >>交任务: |cRXP_FRIENDLY_血顶之颅|r
.accept 585 >>接任务: |cRXP_LOOT_奈兹里奥克|r
step
#loop
.goto Stranglethorn Vale,32.99,38.06,0
.goto Stranglethorn Vale,31.00,42.50,60,0
.goto Stranglethorn Vale,32.99,38.06,50,0
.goto Stranglethorn Vale,31.42,40.17,50,0
.goto Stranglethorn Vale,30.14,43.06,50,0
.goto Stranglethorn Vale,28.36,43.47,50,0
.goto Stranglethorn Vale,28.53,45.96,50,0
.goto Stranglethorn Vale,30.61,44.54,50,0
.goto Stranglethorn Vale,31.80,43.08,50,0
.goto Stranglethorn Vale,33.24,40.38,50,0
.goto Stranglethorn Vale,33.85,38.45,50,0
>>击杀|cRXP_ENEMY_丛林捕猎者|r. 从他们身上搜刮|cRXP_LOOT_羽毛|r
.complete 196,1 
.complete 572,1 
.mob Jungle Stalker
step
#loop
.goto Stranglethorn Vale,40.36,41.93,0
.goto Stranglethorn Vale,40.36,41.93,50,0
.goto Stranglethorn Vale,43.73,41.47,50,0
.goto Stranglethorn Vale,44.73,42.05,50,0
.goto Stranglethorn Vale,43.26,42.29,50,0
.goto Stranglethorn Vale,42.55,41.55,50,0
.goto Stranglethorn Vale,41.48,41.18,50,0
.goto Stranglethorn Vale,41.43,40.36,50,0
>>击杀|cRXP_ENEMY_Venture Co. 地精|r. 掠夺他们的|cRXP_LOOT_水晶|r
.complete 600,1 
.mob Venture Co. Surveyor
.mob Venture Co. Foreman
.mob Venture Co. Strip Miner
.mob Venture Co. Tinkerer
.mob Foreman Cozzle
step
#completewith SkullP
>>击杀|cRXP_ENEMY_Skullsplitter 劈颅巨魔|r. 掠夺他们的|cRXP_LOOT_獠牙|r和|cRXP_LOOT_项链|r
.complete 209,1 
.complete 598,1 
.mob Skullsplitter Mystic
.mob Skullsplitter Warrior
.mob Skullsplitter Axe Thrower
step
.goto Stranglethorn Vale,42.20,36.10
>>掠夺|cRXP_PICK_赞塔加颅骨堆|r以获取其|cRXP_LOOT_战利品|r
.complete 585,2 
step
.goto Stranglethorn Vale,47.60,39.60
>>掠夺|cRXP_PICK_祖玛维颅骨堆|r以获取其|cRXP_LOOT_战利品|r
.complete 585,3 
step
#label SkullP
.goto Stranglethorn Vale,46.10,32.30
>>掠夺|cRXP_PICK_巴里亚曼颅骨堆|r以获取其|cRXP_LOOT_战利品|r
.complete 585,1 
step
#loop
.goto Stranglethorn Vale,42.13,36.29,0
.goto Stranglethorn Vale,42.13,36.29,50,0
.goto Stranglethorn Vale,41.89,35.93,50,0
.goto Stranglethorn Vale,42.45,35.03,50,0
.goto Stranglethorn Vale,42.47,33.35,50,0
.goto Stranglethorn Vale,43.47,33.25,50,0
.goto Stranglethorn Vale,45.06,32.39,50,0
.goto Stranglethorn Vale,45.51,31.66,50,0
.goto Stranglethorn Vale,46.42,31.98,50,0
.goto Stranglethorn Vale,47.19,30.85,50,0
.goto Stranglethorn Vale,47.11,32.54,50,0
.goto Stranglethorn Vale,47.13,34.31,50,0
.goto Stranglethorn Vale,45.23,34.47,50,0
.goto Stranglethorn Vale,44.00,35.53,50,0
.goto Stranglethorn Vale,43.44,37.92,50,0
>>击杀|cRXP_ENEMY_劈颅巨魔|r. 击败他们后拾取其|cRXP_LOOT_牙齿|r和|cRXP_LOOT_颈饰|r`
.complete 209,1 
.complete 598,1 
.mob Skullsplitter Mystic
.mob Skullsplitter Warrior
.mob Skullsplitter Axe Thrower
step
#loop
.goto Stranglethorn Vale,42.13,36.29,50,0
.goto Stranglethorn Vale,41.89,35.93,50,0
.goto Stranglethorn Vale,42.45,35.03,50,0
.goto Stranglethorn Vale,42.47,33.35,50,0
.goto Stranglethorn Vale,43.47,33.25,50,0
.goto Stranglethorn Vale,45.06,32.39,50,0
.goto Stranglethorn Vale,45.51,31.66,50,0
.goto Stranglethorn Vale,46.42,31.98,50,0
.goto Stranglethorn Vale,47.19,30.85,50,0
.goto Stranglethorn Vale,47.11,32.54,50,0
.goto Stranglethorn Vale,47.13,34.31,50,0
.goto Stranglethorn Vale,45.23,34.47,50,0
.goto Stranglethorn Vale,44.00,35.53,50,0
.goto Stranglethorn Vale,43.44,37.92,50,0
.xp 42 >>升级至42级
step
#completewith next
.hs >>传送至格罗姆高尔营地
.use 6948
step
.goto Stranglethorn Vale,31.48,29.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板苏贝克|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Thulbek
step << Hunter
.goto Stranglethorn Vale,31.55,27.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤索克|r交谈
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,2600,669,1 
.target Uthok
.xp >40,1
step << Hunter
.goto Stranglethorn Vale,31.55,27.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤索克|r交谈
>>|cRXP_BUY_从他那里购买|r|T135661:0|t[锯齿箭]|r
.collect 11285,2600,669,1 
.target Uthok
.xp <40,1
step
.goto Stranglethorn Vale,32.10,29.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知莫克塔尔丁|r交谈
.turnin 572 >>交任务: |cRXP_FRIENDLY_摩克萨尔丁的魔法|r
.target Far Seer Mok'thardin
step
.goto Stranglethorn Vale,32.20,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kin'weelay|r交谈
.turnin 598 >>交任务: |cRXP_FRIENDLY_裂骨项链|r
.target Kin'weelay
step
>>点击|cRXP_PICK_冒泡大锅|r
.turnin 585 >>交任务: |cRXP_FRIENDLY_奈兹里奥克|r
.accept 1261 >>接任务: |cRXP_LOOT_玛尔格的嘱托|r
.isQuestTurnedIn 1240
step
.goto Stranglethorn Vale,32.10,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼姆布亚|r交谈
.accept 2932 >>接任务: |cRXP_WARN_可怕的消息|r
.target Nimboya
step
.goto Stranglethorn Vale,33.51,32.53
>>击杀一只|cRXP_ENEMY_老海鳄|r, 击败后拾取其|cRXP_LOOT_皮肤|r
>>|cRXP_WARN_沿岸北部有更多|r|cRXP_ENEMY_老海鳄|r|cRXP_WARN_north|r
.complete 628,1 
.unitscan Elder Saltwater Crocolisk
step
#completewith BBvisit
.goto Stranglethorn Vale,32.54,29.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞斯塔|r交谈
.fly Booty Bay >>飞往藏宝海湾
.target Thysta
step
.goto Stranglethorn Vale,27.10,77.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_舰队指挥官卡拉·海角|r交谈
.turnin 669 >>交任务: |cRXP_FRIENDLY_水下宝藏|r
.accept 670 >>接任务: |cRXP_LOOT_水下宝藏|r
.target Fleet Master Seahorn
step
.goto Stranglethorn Vale,27.10,77.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅馆一楼的|cRXP_FRIENDLY_Crank|r交谈
.turnin 600 >>交任务: |cRXP_FRIENDLY_风险投资公司|r
.target Crank Fizzlebub
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与位于顶层楼梯处的|cRXP_FRIENDLY_科博克|r和|cRXP_FRIENDLY_克拉兹克|r交谈
.turnin 209 >>交任务: |cRXP_FRIENDLY_劈颅巨魔的獠牙|r
.target +Kebok
.goto Stranglethorn Vale,27.000,77.124
.accept 1116 >>接任务: |cRXP_WARN_梦境之尘|r
.target +Krazek
.goto Stranglethorn Vale,26.943,77.207
step
.goto Stranglethorn Vale,28.29,77.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_崔斯里克|r交谈
.turnin 628 >>交任务: |cRXP_FRIENDLY_刨花皮靴|r
.target Drizzlik
step
.goto Stranglethorn Vale,26.55,76.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_掘金者维兹尼克|r 交谈
.bankwithdraw 2725,2728,2735,2730,2742,2732,2748,2751,2734,2740,2749,2745,2738,2744,2750 >>从银行取出所有|T134332:0|t[荆棘谷的青山页]
.target Viznik Goldgrubber
.solo
step
.goto Stranglethorn Vale,26.55,76.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_掘金者维兹尼克|r 交谈
.bankdeposit 2725,2728,2735,2730,2742,2732,2748,2751,2734,2740,2749,2745,2738,2744,2750 >>将所有|T134332:0|t[荆棘谷的青山页]存入银行
.target Viznik Goldgrubber
.group
step
#completewith next
.goto Stranglethorn Vale,35.70,10.80,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尼尔|r交谈
+交出你拥有的所有|T134332:0|t[荆棘谷的青山 - 页面]
.target Barnil Stonepot
.solo
step
#optional
#label BBvisit
step
#completewith NesingCampTurnins
.goto Stranglethorn Vale,26.87,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格林戈|r交谈
.fly Grom'gol >>飞往格罗姆高营地
.target Gringer
.subzoneskip 35,1
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Hemet|r 和 |cRXP_FRIENDLY_S. J. Erlgadin|r 交谈
.turnin 196 >>交任务: |cRXP_FRIENDLY_猎龙|r
.accept 197 >>接任务: |cRXP_LOOT_猎龙|r
.goto Stranglethorn Vale,35.66,10.81
.accept 193 >>接任务: |cRXP_LOOT_猎豹|r
.goto Stranglethorn Vale,35.55,10.55
.group
step
#label NesingCampTurnins
.goto Stranglethorn Vale,35.66,10.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫梅特|r交谈
.turnin 196 >>交任务: |cRXP_FRIENDLY_猎龙|r
step
#completewith next
.goto Stranglethorn Vale,39.30,6.49,60,0
.goto Stranglethorn Vale,40.63,3.12,50 >>前往: |cRXP_PICK_暮色森林|r
.zoneskip Duskwood
step
#completewith next
.goto Duskwood,74.06,56.49,70,0
.goto Duskwood,80.46,54.47,70,0
.goto Duskwood,82.11,46.62,70,0
+|cRXP_WARN_小心|cRXP_WARN_夜色镇卫兵|r！不要盲目地沿着道路前进|r
>>|cRXP_WARN_请跟随导航点箭头以确保安全|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zraedus|r和|cRXP_FRIENDLY_Faustin|r交谈
.accept 1372 >>接任务: |cRXP_WARN_真言药水|r
.target +Deathstalker Zraedus
.goto Duskwood,87.81,35.62
.turnin 1372 >>交任务: |cRXP_FRIENDLY_真言药水|r
.target +Apothecary Faustin
.goto Duskwood,87.45,35.25
step
#completewith next
.goto Duskwood,88.47,41.00,50 >>前往: |cRXP_PICK_逆风小径|r
.zoneskip Deadwind Pass
step
.goto Deadwind Pass,48.02,34.60,60,0
.goto Deadwind Pass,58.43,41.51,50,0
.zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
.zoneskip Swamp of Sorrows
step
#era
#completewith next
.goto Swamp of Sorrows,15.12,65.50,0
.goto Swamp of Sorrows,15.12,65.50,80,0
>>击杀|cRXP_ENEMY_翠绿幼龙|r 和|cRXP_ENEMY_睡梦雏龙|r , 击败它们后可获得|cRXP_LOOT_梦境之尘|r
>>|cRXP_WARN_别纠结这个任务. 先杀光所有幼崽, 稍后再回来完成它|r
.complete 1116,1 
.mob Dreaming Whelp
.mob Adolescent Whelp
step
#completewith next
.subzone 75 >>前往斯托纳德
step
.goto Swamp of Sorrows,44.70,57.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达尔|r交谈
.accept 698 >>接任务: |cRXP_WARN_缺乏补给|r
.target Dar
step
.goto Swamp of Sorrows,46.10,54.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布雷依克|r交谈
.fp Stonard >>获取斯托纳德的飞行路线
.target Breyk
step
.goto Swamp of Sorrows,45.78,52.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏塔佐尔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Thultazor
step
.goto Swamp of Sorrows,45.38,56.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的好友|r拉尔塔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Rartar
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与位于那座大型建筑顶层的|cRXP_FRIENDLY_克里普友善·赫格拉姆|r和|cRXP_FRIENDLY_克里普·费尔泽鲁尔|r交谈
.turnin 1420 >>交任务: |cRXP_FRIENDLY_向赫格拉姆报到|r
.target +Helgrum the Swift
.goto Swamp of Sorrows,47.80,55.20
.accept 1424 >>接任务: |cRXP_WARN_泪水之池|r
.target +Fel'zerul
.goto Swamp of Sorrows,47.80,55.20
step << Hunter
.goto Swamp of Sorrows,47.27,53.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ogrom|r交谈
.train 13553 >>训练你的职业法术
.target Ogrom
.xp <42,1
.xp >44,1
step << Hunter
#optional
.goto Swamp of Sorrows,47.27,53.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ogrom|r交谈
.train 14285 >>训练你的职业法术
.target Ogrom
.xp <44,1
step << Hunter
.goto Swamp of Sorrows,47.35,52.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格罗科尔|r交谈
.train 24561 >>训练你的宠物法术
.target Grokor
.xp <42,1
step << Warlock
.goto Swamp of Sorrows,48.64,55.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡托什|r交谈
.train 6789 >>训练你的职业法术
.target Kartosh
.xp <42,1
.xp >44,1
step << Warlock
#optional
.goto Swamp of Sorrows,48.64,55.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡托什|r交谈
.train 11671 >>训练你的职业法术
.target Kartosh
.xp <44,1
step << Warlock
.goto Swamp of Sorrows,48.59,55.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷沙卡|r交谈
.vendor >>购买任何你负担得起的宠物升级道具
.target Greshka
step << Shaman
.goto Swamp of Sorrows,48.19,57.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷沙卡|r交谈
.train 11314 >>训练你的职业法术
.target Haromm
.xp <42,1
.xp >44,1
step << Shaman
#optional
.goto Swamp of Sorrows,48.19,57.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷沙卡|r交谈
.train 16315 >>训练你的职业法术
.target Haromm
.xp <44,1
step << Warrior
.goto Swamp of Sorrows,44.89,57.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马尔罗什|r交谈
.train 11550 >>训练你的职业法术
.target Malosh
.xp <42,1
.xp >44,1
step << Warrior
#optional
.goto Swamp of Sorrows,44.89,57.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马尔罗什|r交谈
.train 11584 >>训练你的职业法术
.target Malosh
.xp <44,1
step
#completewith GalenStrongbox
>>击杀|cRXP_ENEMY_盐齿鳄鱼|r和|cRXP_ENEMY_盐齿钳嘴鳄|r. 击败它们后掠夺其|cRXP_LOOT_盐齿鳄鱼皮|r
.complete 698,1 
.mob Sawtooth Crocolisk
.mob Sawtooth Snapper
step
#loop
.line Swamp of Sorrows,32.24,36.70,33.22,39.96,33.92,44.25,36.71,46.36,37.92,43.17,38.29,39.13,38.86,35.61,40.34,34.40,40.86,32.29,42.43,32.11,45.77,36.75,46.68,38.55,48.95,38.71,53.41,38.98,55.48,37.42,56.06,36.05
.goto Swamp of Sorrows,56.06,36.05,40,0
.goto Swamp of Sorrows,55.48,37.42,40,0
.goto Swamp of Sorrows,53.41,38.98,40,0
.goto Swamp of Sorrows,48.95,38.71,40,0
.goto Swamp of Sorrows,46.68,38.55,40,0
.goto Swamp of Sorrows,45.77,36.75,40,0
.goto Swamp of Sorrows,42.43,32.11,40,0
.goto Swamp of Sorrows,40.86,32.29,40,0
.goto Swamp of Sorrows,40.34,34.40,40,0
.goto Swamp of Sorrows,38.86,35.61,40,0
.goto Swamp of Sorrows,38.29,39.13,40,0
.goto Swamp of Sorrows,37.92,43.17,40,0
.goto Swamp of Sorrows,36.71,46.36,40,0
.goto Swamp of Sorrows,33.92,44.25,40,0
.goto Swamp of Sorrows,33.22,39.96,40,0
.goto Swamp of Sorrows,32.24,36.70,40,0
.goto Swamp of Sorrows,32.24,36.70,0
>>击杀|cRXP_ENEMY_木棒诺博鲁|r. 击败他后搜刮 |T133485:0|t[|cRXP_LOOT_轻棍|r]. 使用该物品开启任务
>>|cRXP_ENEMY_木棒诺博鲁|r|cRXP_WARN_巡逻该区域的中央偏上位置|r
.collect 6196,1,1392 
.accept 1392 >>接任务: |cRXP_WARN_木棒诺博鲁|r
.unitscan Noboru the Cudgel
step
.goto Swamp of Sorrows,25.98,31.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛格图尔|r交谈
.accept 1389 >>接任务: |cRXP_WARN_德莱尼水晶|r
.turnin 1392 >>交任务: |cRXP_FRIENDLY_木棒诺博鲁|r
.target Magtoor
step
#completewith GalenE
>>击杀|cRXP_ENEMY_盎格库尔|r. 击败他后可获得他的|cRXP_LOOT_碎片|r
>>|cRXP_WARN_盎格库尔可以在整个休耕地圣所中找到|r
.complete 1373,1 
.unitscan Ongeku
.isOnQuest 1373
step
#completewith GalenE
>>拾取地面上的蓝色德莱尼水晶|cRXP_LOOT_Draenethyst Crystals|r
.complete 1389,1 
.target Galen Goodward
step
#completewith next
+|cRXP_WARN_下一个任务可能相当困难, 务必格外小心|r
step
#label Galen
.goto Swamp of Sorrows,65.46,18.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_Galen|r 开始护送任务
>>|cRXP_WARN_在开始前, 尽量提前清理掉加伦西南方向附近的怪物|r
.accept 1393 >>接任务: |cRXP_WARN_加林的逃亡|r
.target Galen Goodward
step
#label GalenE
.goto Swamp of Sorrows,53.03,29.65
>>护送|cRXP_FRIENDLY_加林·古瓦德|r安全离开荒芜避难所
.complete 1393,1 
.target Galen Goodward
step
#completewith next
>>拾取地面上的蓝色德莱尼水晶|cRXP_LOOT_Draenethyst Crystals|r
.complete 1389,1 
.target Galen Goodward
step
.goto Swamp of Sorrows,62.60,22.86,-1
.goto Swamp of Sorrows,64.74,22.46,-1
>>击杀|cRXP_ENEMY_盎格库尔|r. 击败他后可获得他的|cRXP_LOOT_碎片|r
>>|cRXP_WARN_盎格库尔可以在整个休耕地圣所中找到|r
.complete 1373,1 
.unitscan Ongeku
.isOnQuest 1373
step
#loop
.goto Swamp of Sorrows,58.31,25.47,0
.goto Swamp of Sorrows,58.31,25.47,50,0
.goto Swamp of Sorrows,61.69,22.38,50,0
.goto Swamp of Sorrows,64.52,19.68,50,0
.goto Swamp of Sorrows,63.88,24.38,50,0
>>完成拾取地面上的蓝色|cRXP_LOOT_德莱尼水晶|r
.complete 1389,1 
step
#label GalenStrongbox
.goto Swamp of Sorrows,47.80,39.75
>>点击|cRXP_PICK_加林的保险箱|r
.turnin 1393 >>交任务: |cRXP_FRIENDLY_加林的逃亡|r
step
#loop
.goto Swamp of Sorrows,52.44,37.14,0
.goto Swamp of Sorrows,52.44,37.14,60,0
.goto Swamp of Sorrows,56.71,35.60,60,0
.goto Swamp of Sorrows,60.47,31.60,60,0
.goto Swamp of Sorrows,63.96,32.23,60,0
>>击杀|cRXP_ENEMY_盐齿鳄鱼|r和|cRXP_ENEMY_盐齿钳嘴鳄|r. 击败它们后掠夺其|cRXP_LOOT_盐齿鳄鱼皮|r
.complete 698,1 
.mob Sawtooth Crocolisk
.mob Sawtooth Snapper
step
#completewith next
>>掠夺散落在泪水之池岸边或池底的|cRXP_LOOT_Atal'ai Artifacts|r阿塔莱神器
>>|cRXP_WARN_这些神器有不同的模型. 打开菜单, 点击“系统”, 然后选择“图形”, 最后将最底部的“环境杂乱”滑块调整为 0|r
.complete 1424,1 
step
.goto Swamp of Sorrows,81.40,81.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tok'Kar|r交谈
.turnin 698 >>交任务: |cRXP_FRIENDLY_缺乏补给|r
.accept 699 >>接任务: |cRXP_WARN_缺乏补给|r
.target Tok'Kar
step
#loop
.goto Swamp of Sorrows,75.44,60.41,0
.goto Swamp of Sorrows,75.44,60.41,50,0
.goto Swamp of Sorrows,71.14,61.44,50,0
.goto Swamp of Sorrows,65.36,57.19,50,0
.goto Swamp of Sorrows,65.99,47.10,50,0
.goto Eastern Kingdoms,53.87,79.26,50,0
.goto Swamp of Sorrows,70.57,46.04,50,0
.goto Swamp of Sorrows,75.03,50.83,50,0
>>掠夺散落在泪水之池岸边或池底的|cRXP_LOOT_Atal'ai Artifacts|r阿塔莱神器
>>|cRXP_WARN_这些神器有不同的模型. 打开菜单, 点击“系统”, 然后选择“图形”, 最后将最底部的“环境杂乱”滑块调整为 0|r
.complete 1424,1 
step
.goto Swamp of Sorrows,48.00,54.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回斯通纳德找|r|cRXP_FRIENDLY_Fel'zerul|r
.turnin 1424 >>交任务: |cRXP_FRIENDLY_泪水之池|r
.target Fel'zerul
step
.goto Swamp of Sorrows,25.90,31.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛格图尔|r交谈
.turnin 1389 >>交任务: |cRXP_FRIENDLY_德莱尼水晶|r
.target Magtoor
step
#loop
.goto Swamp of Sorrows,12.02,60.27,0
.goto Swamp of Sorrows,12.02,60.27,50,0
.goto Swamp of Sorrows,12.00,67.29,50,0
.goto Swamp of Sorrows,15.12,65.50,50,0
.goto Swamp of Sorrows,16.54,61.12,50,0
.goto Swamp of Sorrows,15.37,55.45,50,0
.goto Swamp of Sorrows,12.19,57.13,50,0
>>击杀|cRXP_ENEMY_翠绿幼龙|r 和|cRXP_ENEMY_睡梦雏龙|r , 从它们身上获取|cRXP_LOOT_梦境之尘|r
.complete 1116,1 
.mob Dreaming Whelp
.mob Adolescent Whelp
step
.goto Swamp of Sorrows,46.08,54.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布雷依克|r交谈
.fly Badlands >>飞往荒芜之地
.target Breyk
.zoneskip Badlands
step
.goto Badlands,25.95,44.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁特维尔·沃拉图斯|r交谈
.accept 712 >>接任务: |cRXP_LOOT_研究石元素|r
.target Lotwil Veriatus
step
#loop
.goto Badlands,6.58,75.55,0
.goto Badlands,6.58,75.55,50,0
.goto Badlands,1.23,79.29,50,0
.goto Badlands,2.06,82.38,50,0
.goto Badlands,6.66,81.68,50,0
>>击杀|cRXP_ENEMY_巨型石元素|r. 从他们身上搜刮出|cRXP_LOOT_护腕|r
.complete 712,1 
.mob Greater Rock Elemental
step
.goto Badlands,51.38,76.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Theldurin|r交谈
.accept 692 >>接任务: |cRXP_LOOT_遗失的卷轴碎片|r
.target Theldurin the Lost
.isQuestTurnedIn 688
.group
step
.goto Badlands,51.38,76.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Theldurin|r交谈
.accept 728 >>接任务: |cRXP_LOOT_远赴幽暗城|r
.target Theldurin the Lost
.isQuestTurnedIn 709
.group
step
#loop
.goto Badlands,53.65,81.49,0
.goto Badlands,53.65,81.49,50,0
.goto Badlands,54.29,85.26,50,0
.goto Badlands,55.43,86.87,50,0
.goto Badlands,56.13,82.85,50,0
>>击杀|cRXP_ENEMY_被激怒的石元素|r. 击败它们获取|cRXP_LOOT_卷轴|r
.complete 692,1 
.complete 692,2 
.complete 692,3 
.mob Enraged Rock Elemental
.isQuestTurnedIn 688
.group
step
.goto Badlands,51.38,76.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回至|cRXP_FRIENDLY_Theldurin|r
.turnin 692 >>交任务: |cRXP_FRIENDLY_遗失的卷轴碎片|r
.accept 656 >>接任务: |cRXP_LOOT_召唤大地公主|r
.target Theldurin the Lost
.isQuestTurnedIn 688
.group
step
.goto Badlands,25.95,44.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁特维尔·沃拉图斯|r交谈
.turnin 712 >>交任务: |cRXP_FRIENDLY_研究石元素|r
.target Lotwil Veriatus
step
#ah
.goto Badlands,25.82,44.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢西恩|r交谈
.accept 715 >>接任务: |cRXP_WARN_卢希恩的药水|r
.turnin 715 >>交任务: |cRXP_FRIENDLY_卢希恩的药水|r
.target Lucien Tosselwrench
.itemcount 929,1 
.itemcount 3823,1 
.isQuestTurnedIn 714
step
#ah
.goto Badlands,25.82,44.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢西恩|r交谈
.accept 716 >>接任务: |cRXP_WARN_有备无患|r
.turnin 716 >>交任务: |cRXP_FRIENDLY_有备无患|r
.target Lucien Tosselwrench
.itemcount 2868,1 
.isQuestTurnedIn 714
.isQuestTurnedIn 712
step
#ah
.goto Badlands,25.95,44.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁特维尔·沃拉图斯|r交谈
.accept 734 >>接任务: |cRXP_WARN_不祥的感觉|r
.target Lotwil Veriatus
.isQuestTurnedIn 714
.isQuestTurnedIn 712
step
#ah
.goto Badlands,25.82,44.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢西恩|r交谈
.turnin 734 >>交任务: |cRXP_FRIENDLY_不祥的感觉|r
.accept 777 >>接任务: |cRXP_WARN_不祥的感觉|r
.target Lucien Tosselwrench
.isQuestTurnedIn 714
.isQuestTurnedIn 712
step
#ah
.goto Badlands,25.95,44.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁特维尔·沃拉图斯|r交谈
.turnin 777 >>交任务: |cRXP_FRIENDLY_不祥的感觉|r
.accept 778 >>接任务: |cRXP_WARN_不祥的感觉|r
.target Lotwil Veriatus
.isQuestTurnedIn 714
.isQuestTurnedIn 712
step
#ah
.goto Badlands,26.09,46.83
>>击杀 |cRXP_ENEMY_Fam'retor Guardian|r, 击败后从他身上获取 |cRXP_LOOT_Bindings|r
.complete 778,1 
.unitscan Fam'retor Guardian
.isQuestTurnedIn 714
.isQuestTurnedIn 712
step
.goto Badlands,25.95,44.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回|cRXP_FRIENDLY_鲁特维尔·沃拉图斯|r
.turnin 778 >>交任务: |cRXP_FRIENDLY_不祥的感觉|r
.target Lotwil Veriatus
.isQuestComplete 778
step
#completewith DeathsFromBelow
.goto Badlands,3.99,44.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里克|r交谈
.fly Hammerfall >>飞往落锤镇
.target Gorrik
step
.goto Arathi Highlands,73.80,33.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森古|r交谈
.turnin 646 >>交任务: |cRXP_FRIENDLY_托卡拉尔|r
.target Zengu
.isQuestTurnedIn 645
.group
step
.goto Arathi Highlands,62.45,33.72
.use 4472 >>使用你的 |T134937:0|t[密斯莱尔卷轴], 然后等待剧情互动
>>击杀|cRXP_ENEMY_密斯莱尔|r. 击败她后搜刮其掉落的|cRXP_LOOT_链锁|r
>>|cRXP_WARN_建议配备一名坦克和一名治疗者. 她会召唤大量元素小怪|r
.complete 656,1 
.unitscan Myzrael
.isQuestTurnedIn 692
.group 5
step
.goto Arathi Highlands,62.45,33.72
>>点击密斯莱尔水晶碎块
.turnin 656 >>交任务: |cRXP_FRIENDLY_召唤大地公主|r
.isQuestComplete 656
.group
step
#completewith next
.goto Arathi Highlands,21.6,75.6,30,0
.goto Arathi Highlands,22.1,79.9,25 >>穿过洞穴前往法迪尔海湾
step
.goto Arathi Highlands,32.28,81.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙克斯·奥布里|r交谈
.turnin 670 >>交任务: |cRXP_FRIENDLY_水下宝藏|r
.accept 667 >>接任务: |cRXP_WARN_水下伏兵|r
.target Shakes O'Breen
step
.goto Arathi Highlands,31.56,82.14,15,0
.goto Arathi Highlands,31.47,81.06,15,0
.goto Arathi Highlands,32.02,80.71
>>登上船只, 然后等待纳迦出现
>>点击|cRXP_PICK_Cannon|r可立即击杀|cRXP_ENEMY_刺脊掠夺者|r
.complete 667,1 
.mob Daggerspine Marauder
step
#label DeathsFromBelow
.goto Arathi Highlands,32.28,81.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回至|cRXP_FRIENDLY_沙克斯·奥布里|r
.turnin 667 >>交任务: |cRXP_FRIENDLY_水下伏兵|r
.target Shakes O'Breen
step << skip
#completewith next
.goto Arathi Highlands,35.78,79.52
.goto Arathi Highlands,48.71,55.80,30 >>在洞穴中央的岩石顶部登出. 通过登出再重新登录来实现登出跳过|r
.link https://www.youtube.com/watch?v=SWBtPqm5M0Q&t=114s >>|cRXP_WARN_点击此处查看视频参考|r
step << skip
.goto Arathi Highlands,73.10,32.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤尔达|r交谈
.fly Tarren Mill >>飞往塔伦米尔
.target Urda
.zoneskip Hillsbrad Foothills

step
#completewith VenomBottle
.goto Hillsbrad Foothills,86.60,29.49,30,0
.goto The Hinterlands,9.7,55.8
.zone The Hinterlands >>前往希尔斯布莱德并进入辛特兰
step
#completewith grimmes
>>击杀 |cRXP_ENEMY_枯木巨魔|r. 从他们身上搜刮 |cRXP_LOOT_骷髅|r
.collect 9320,20 
.isOnQuest 2932
step
#label VenomBottle
.goto The Hinterlands,23.00,57.73
>>点击营地周围的一个绿色|cRXP_PICK_毒液瓶|r
.accept 2933 >>接任务: |cRXP_LOOT_毒液瓶|r
step
#completewith next
.use 15002 >>|cRXP_WARN_点击|r|T135128:0|t[尼姆布亚的长矛] |cRXP_WARN_以制作|r|T135125:0|t[尼姆布亚的装载长矛]
.itemcount 15002,1
step
#label grimmes
.goto The Hinterlands,23.9,58.3
.use 9319 >>|cRXP_WARN_使用|r|T135125:0|t[尼姆博亚的长矛]|cRXP_WARN_in营地中央|r
.complete 2932,1 
.isOnQuest 2932
step
#completewith next
.goto Hillsbrad Foothills,62.31,20.29,125 >>返回塔伦米尔
step
.goto Hillsbrad Foothills,61.50,19.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与莱登交谈|cRXP_FRIENDLY_Lydon|r
.turnin 2933 >>交任务: |cRXP_FRIENDLY_毒液瓶|r
.target Apothecary Lydon
step
.goto Hillsbrad Foothills,63.20,20.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁斯克|r交谈
.accept 507 >>接任务: |cRXP_LOOT_奥里登·匹瑞诺德|r
.target Krusk
.solo
step
.goto Hillsbrad Foothills,62.62,20.74
>>点击|cRXP_PICK_通缉：瓦杜斯男爵|r 海报, 它就在|cRXP_FRIENDLY_梅里萨拉|r 旁边
.accept 566 >>接任务: |cRXP_LOOT_通缉：瓦杜斯男爵|r
.target Melisara
.solo
step
#completewith next
>>在每个营地和斯坦恩布莱德旅店中寻找|cRXP_ENEMY_巴隆·瓦杜斯|r, 击杀他并搜刮他的|cRXP_LOOT_头颅|r
.complete 566,1 
.unitscan Baron Vardus
.solo
step
.goto Alterac Mountains,39.28,14.52
>>击杀|cRXP_ENEMY_奥里登·匹瑞诺德领主|r
>>|cRXP_WARN_请注意|cRXP_ENEMY_辛迪加刺客|r. |cRXP_ENEMY_Aliden|r会使用“真言术·盾”, 施放“治疗术”, 并会使宠物和其他玩家陷入睡眠状态|r
.complete 507,1 
.unitscan Lord Aliden Perenolde
.mob Syndicate Assassin
.solo
step
.goto Alterac Mountains,39.30,14.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾丽萨|r交谈
.turnin 507 >>交任务: |cRXP_FRIENDLY_奥里登·匹瑞诺德|r
.accept 508 >>接任务: |cRXP_LOOT_塔蕾莎的礼物|r
.target Elysa
.solo
step
#loop
.goto Alterac Mountains,47.8,17.1,0
.goto Alterac Mountains,53.6,20.6,0
.goto Alterac Mountains,56.2,26.8,0
.goto Alterac Mountains,58.1,29.9,0
.goto Alterac Mountains,59.7,43.9,0
.goto Alterac Mountains,47.8,17.1,70,0
.goto Alterac Mountains,53.6,20.6,70,0
.goto Alterac Mountains,56.2,26.8,70,0
.goto Alterac Mountains,58.1,29.9,70,0
.goto Alterac Mountains,59.7,43.9,70,0
>>在每个营地和斯坦恩布莱德旅店中寻找|cRXP_ENEMY_巴隆·瓦杜斯|r, 击杀他并搜刮他的|cRXP_LOOT_头颅|r
.complete 566,1 
.unitscan Baron Vardus
.solo
step
.goto Alterac Mountains,61.10,82.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达尔萨利亚(|cRXP_FRIENDLY_Darthalia|r)交谈
.turnin 566 >>交任务: |cRXP_FRIENDLY_通缉：瓦杜斯男爵|r
.target High Executor Darthalia
.solo
step
.goto Hillsbrad Foothills,63.20,20.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁斯克|r交谈
.turnin 508 >>交任务: |cRXP_FRIENDLY_塔蕾莎的礼物|r
.target Krusk
.solo
step
.goto Hillsbrad Foothills,62.63,20.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅里萨拉|r交谈
.accept 521 >>接任务: |cRXP_LOOT_意志之冠|r
.target Melisara
.isQuestTurnedIn 520
.group
step
#completewith UCVisit
.goto Hillsbrad Foothills,60.14,18.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞斯|r交谈
.fly Undercity >>飞往幽暗城
.target Zarise
.zoneskip Undercity
step
.goto Undercity,62.32,48.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕特里克|r交谈
.turnin 2342 >>交任务: |cRXP_FRIENDLY_失而复得|r
.target Patrick Garrett
.isQuestComplete 2342
.group
step
.goto Undercity,62.31,48.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕特里克|r交谈
.accept 2342 >>接任务: |cRXP_LOOT_失而复得|r
.target Patrick
.dungeon ULDA
step
.goto Undercity,53.77,54.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bel'dugur|r交谈
.turnin 728 >>交任务: |cRXP_FRIENDLY_远赴幽暗城|r
.target Keeper Bel'dugur
.group
step
.goto Undercity,50.15,67.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zinge|r交谈
.accept 243 >>接任务: |cRXP_LOOT_进入沙漠|r
.target Apothecary Zinge
.group
step
.goto Undercity,57.65,93.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙琳德拉|r交谈
.turnin 521 >>交任务: |cRXP_FRIENDLY_意志之冠|r
.target Sharlindra
.group
step << Warrior
.goto Undercity,48.32,15.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安吉拉|r交谈
.train 11550 >>训练你的职业法术
.target Angela Curthas
.xp <42,1
.xp >44,1
.group
step << Warrior
#optional
.goto Undercity,48.32,15.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安吉拉|r交谈
.train 11584 >>训练你的职业法术
.target Angela Curthas
.xp <44,1
.group
step << Rogue
.goto Undercity,83.86,72.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
.train 6774 >>训练你的职业法术
.target Carolyn Ward
.xp <42,1
.xp >44,1
.group
step << Rogue
#optional
.goto Undercity,83.86,72.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
.train 11341 >>训练你的职业法术
.target Carolyn Ward
.xp <44,1
.group
step << Warlock
.goto Undercity,88.93,15.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richard|r交谈
.train 6789 >>训练你的职业法术
.target Richard Kerwin
.xp <42,1
.xp >44,1
.group
step << Warlock
#optional
.goto Undercity,88.93,15.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richard|r交谈
.train 11671 >>训练你的职业法术
.target Richard Kerwin
.xp <44,1
.group
step << Mage
.goto Undercity,85.15,10.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
.train 10159 >>训练你的职业法术
.target Anastasia Hartwell
.xp <42,1
.xp >44,1
.group
step << Mage
#optional
.goto Undercity,85.15,10.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
.train 10185 >>训练你的职业法术
.target Anastasia Hartwell
.xp <44,1
.group
step << Priest
.goto Undercity,47.55,18.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉扎鲁斯|r交谈
.train 10892 >>训练你的职业法术
.target Father Lazarus
.xp <42,1
.xp >44,1
.group
step << Priest
#optional
.goto Undercity,47.55,18.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉扎鲁斯|r交谈
.train 10927 >>训练你的职业法术
.target Father Lazarus
.xp <44,1
.group
step << Undead !Warlock
#optional
#completewith next
.subzone 159 >>前往布瑞尔
.xp <40,1
.money <90
.skill riding,75,1
step << Undead !Warlock
#optional
.goto Tirisfal Glades,60.09,52.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velma|r和|cRXP_FRIENDLY_Zachariah|r交谈
.train 10906 >>训练 |T136103:0|t[亡灵骑术]
.vendor >>|cRXP_BUY_购买|r|T132264:0|t[|cFF0070FF骸骨战马|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Velma Warnam
.target Zachariah Post
step
#optional
#label UCVisit
step
#completewith next
.hs >>传送至格罗姆高尔营地
.use 6948
step
.goto Stranglethorn Vale,31.48,29.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板苏贝克|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Thulbek
step
.goto Stranglethorn Vale,32.10,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼姆布亚|r交谈
.turnin 2932 >>交任务: |cRXP_FRIENDLY_可怕的消息|r
.target Nimboya
step
#completewith Boat2Ratchet
.goto Stranglethorn Vale,32.5,29.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞斯塔|r交谈
.fly Booty Bay >>飞往藏宝海湾
.target Thysta
step
#optional
.abandon 692 >>放弃遗失的卷轴碎片
.isOnQuest 692
step
#optional
.abandon 656 >>放弃召唤大地公主
.isOnQuest 656
step
.goto Stranglethorn Vale,26.99,77.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t爬上旅馆的三楼, 然后与|cRXP_FRIENDLY_克拉兹克|r交谈
.turnin 1116 >>交任务: |cRXP_FRIENDLY_梦境之尘|r
.timer 11,Dream Dust in the Swamp RP
.target Krazek
step << Rogue
.goto Stranglethorn Vale,26.82,77.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_Ian|r交谈
.train 6774 >>训练你的职业法术
.target Ian Strom
.xp <42,1
.xp >44,1
step << Rogue
#optional
.goto Stranglethorn Vale,26.82,77.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_Ian|r交谈
.train 11341 >>训练你的职业法术
.target Ian Strom
.xp <44,1
step
.goto Stranglethorn Vale,27.10,77.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往三楼阳台, 然后与|cRXP_FRIENDLY_大财主里维加兹|r交谈
.accept 1183 >>接任务: |cRXP_LOOT_地精赞助商|r
.target Baron Revilgaz
step
.goto Stranglethorn Vale,26.99,77.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回至克拉兹克
.accept 1117 >>接任务: |cRXP_WARN_地精的谣言|r
.accept 2864 >>接任务: |cRXP_LOOT_特兰雷克|r
.target Krazek
step
.goto Stranglethorn Vale,27.70,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“海狼”马克基雷|r交谈
.accept 2872 >>接任务: |cRXP_LOOT_斯杜雷的债务|r
.target "Sea Wolf" MacKinley
step
.goto Stranglethorn Vale,28.14,78.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Glyx交谈|r
.vendor >>|cRXP_BUY_购买|r|T134832:0|t[强效治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Glyx Brewright
step
#completewith next
.goto Stranglethorn Vale,25.90,73.14,40 >>前往藏宝海湾码头
step
#label Boat2Ratchet
.goto Stranglethorn Vale,25.76,73.04
.zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
.goto The Barrens,62.40,37.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mebok|r交谈
.turnin 1270 >>交任务: |cRXP_FRIENDLY_伊格纳兹的逃亡|r
.target Mebok Mizzyrix
.isQuestComplete 1270
step
.goto The Barrens,63.09,37.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
.fly Camp Taurajo >>飞往陶拉霍营地
.target Bragok
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 43-43 凄凉之地 II
#displayname 43-43 凄凉之地 II \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 40-50
#next 43-45 塔纳利斯/尘泥沼泽

step
.goto The Barrens,45.58,59.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
.home >>将你的炉石设置为陶拉祖营地
.target Innkeeper Byula
step << !Mage
.goto The Barrens,44.45,59.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
.fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
.target Omusa Thunderhorn
.zoneskip Thunder Bluff
step << Mage
.cast 3566 >>施放 |T135765:0|t[传送:雷霆崖]
.zoneskip Thunder Bluff
step << Priest
.goto Thunder Bluff,24.56,22.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马拉凯|r交谈
.train 10892 >>训练你的职业法术
.target Malakai Cross
.xp <42,1
.xp >44,1
step << Priest
#optional
.goto Thunder Bluff,24.56,22.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马拉凯|r交谈
.train 10927 >>训练你的职业法术
.target Malakai Cross
.xp <44,1
step << Mage
.goto Thunder Bluff,25.18,20.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thurston|r交谈
.train 10159 >>训练你的职业法术
.target Thurston Xane
.xp <42,1
.xp >44,1
step << Mage
#optional
.goto Thunder Bluff,25.18,20.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thurston|r交谈
.train 10185 >>训练你的职业法术
.target Thurston Xane
.xp <44,1
step
.goto Thunder Bluff,54.00,80.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫萨恩|r交谈
.turnin 1276 >>交任务: |cRXP_FRIENDLY_黑色盾牌|r
.target Mosarn
.isOnQuest 1276
step
.goto Thunder Bluff,61.40,80.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Melor|r交谈
.turnin 1136 >>交任务: |cRXP_FRIENDLY_霜喉雪人|r
.accept 1205 >>接任务: |cRXP_LOOT_死沼巨鳄|r
.target Melor Stonehoof
.isQuestComplete 1136
step
.goto Thunder Bluff,61.40,80.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Melor|r交谈
.accept 1205 >>接任务: |cRXP_LOOT_死沼巨鳄|r
.target Melor Stonehoof
step
#optional
#completewith FlyDesolace
.destroy 5838 >>|cRXP_WARN_摧毁: |cRXP_ENEMY_科多兽皮卷轴|r|r
step << Druid
.goto Thunder Bluff,76.46,27.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
.train 9750 >>训练你的职业法术
.target Turak Runetotem
.xp <42,1
.xp >44,1
step << Druid
#optional
.goto Thunder Bluff,76.46,27.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
.train 9752 >>训练你的职业法术
.target Turak Runetotem
.xp <44,1
step << Hunter
.goto Thunder Bluff,59.11,86.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 13553 >>训练你的职业法术
.target Urek Thunderhorn
.xp <42,1
.xp >44,1
step << Hunter
#optional
.goto Thunder Bluff,59.11,86.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 14285 >>训练你的职业法术
.target Urek Thunderhorn
.xp <44,1
step << Hunter
.goto Thunder Bluff,54.08,84.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hesuwa|r交谈
.train 24561 >>训练你的宠物法术
.target Hesuwa Thunderhorn
.xp <42,1
step << Warrior
.goto Thunder Bluff,57.56,85.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
.train 11550 >>训练你的职业法术
.target Ker Ragetotem
.xp <42,1
.xp >44,1
step << Warrior
#optional
.goto Thunder Bluff,57.56,85.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
.train 11584 >>训练你的职业法术
.target Ker Ragetotem
.xp <44,1
step << Shaman
.goto Thunder Bluff,22.84,21.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 11314 >>训练你的职业法术
.target Tigor Skychaser
.xp <42,1
.xp >44,1
step << Shaman
#optional
.goto Thunder Bluff,22.84,21.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 16315 >>训练你的职业法术
.target Tigor Skychaser
.xp <44,1
step << Hunter
.goto Thunder Bluff,46.98,45.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库纳·雷角|r交谈
.vendor >>|cRXP_BUY_购买|r|T135489:0|t[|cRXP_FRIENDLY_大型长弓|r]|cRXP_BUY_, 如果 available 的话|r
.target Kuna Thunderhorn
.money <6.7952
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<21.9
.itemcount 11307,<1
step << Tauren
#optional
#completewith next
.subzone 222 >>前往血蹄村
.xp <40,1
.money <90
.skill riding,75,1
step << Tauren
#optional
.goto Mulgore,47.64,58.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xar'Ti|r和|cRXP_FRIENDLY_祖尼尔|r交谈
.train 132245 >>训练 |T136103:0|t[科多兽骑术]
.vendor >>|cRXP_BUY_购买|r|T132253:0|t[|cFF0070FF科多兽|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Kar Stormsinger
.target Harb Clawhoof
step
#label FlyDesolace
#completewith next
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Shadowprey Village >>飞往葬影村
.target Tal
.zoneskip Desolace
step
.goto Desolace,25.80,68.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回|cRXP_FRIENDLY_Taiga|r
.accept 5581 >>接任务: |cRXP_WARN_燃烧军团的传送门|r
.target Taiga Wisemane
step
.goto Desolace,36.30,79.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_智者乌泰克|r交谈
.turnin 1373 >>交任务: |cRXP_FRIENDLY_盎格库尔|r
.accept 1374 >>接任务: |cRXP_WARN_杰恩可汗|r
.target Uthek the Wise
step
.goto Desolace,47.80,61.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍恩尼兹|r交谈
.accept 6134 >>接任务: |cRXP_WARN_幽灵电浆|r
.target Hornizz Brimbuzzle
step
.goto Desolace,52.20,53.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛乌林·碎骨|r交谈
.accept 1484 >>接任务: |cRXP_LOOT_堕落者|r
.target Maurin Bonesplitter
step
.goto Desolace,52.60,54.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔卡塔·钢刃|r谈话
.turnin 1484 >>交任务: |cRXP_FRIENDLY_堕落者|r
.accept 1488 >>接任务: |cRXP_LOOT_堕落者|r
.target Takata Steelblade
step
#completewith KhanJ
.goto Desolace,53.36,79.47,0
>>点击|cRXP_PICK_恶魔之门|r, 然后击杀|cRXP_ENEMY_恶魔之门的卫士|r
>>|cRXP_WARN_不要纠结这一步；可以稍后完成|r
.complete 5581,1 
.mob Demon Portal Guardian
step
#completewith next
>>击杀|cRXP_ENEMY_Jugkar Grim'rod|r
.complete 1488,2 
.unitscan Jugkar Grim'rod
step
.goto Desolace,55.90,77.80
>>击杀|cRXP_ENEMY_魔王阿兹雷索克|r. 他会在曼诺罗克聚居地东侧区域巡逻
>>|cRXP_WARN_他使用|r|T132355:0|t[致命打击]|cRXP_WARN_(-50% 治疗减益), 并拥有高额近战伤害|r
>>|cRXP_WARN_风筝他|r|T135849:0|t[霜击]|cRXP_WARN_if needed|r << Shaman
>>|cRXP_WARN_使用|r|T132336:0|t[复仇]|cRXP_WARN_以确保你能击败他|r << Warrior
>>|cRXP_WARN_施放|r|T136184:0|t[心灵尖啸]|cRXP_WARN_在期间恢复生命值, 然后|r|T132355:0|t[致命打击] << Priest
>>|cRXP_WARN_他很容易被风筝|r << Hunter/Mage
>>|cRXP_WARN_使用|r |T132155:0|t[突袭] |cRXP_WARN_来恢复能量并用绷带治疗. 保存|r |T136205:0|t[闪避] |cRXP_WARN_以防失误|r << Rogue
>>|cRXP_WARN_与他保持距离, 施放|r|T136183:0|t[恐惧] << Warlock
>>|cRXP_WARN_他很容易击杀, 可使用|r|T132276:0|t[熊形态]|cRXP_WARN_或用|r|T136100:0|t[缠绕根须]风筝他 << Druid
.complete 1488,1 
.unitscan Lord Azrethoc
step
#era
#label Jugkar
.goto Desolace,55.90,77.80
>>击杀|cRXP_ENEMY_Jugkar Grim'rod|r
.complete 1488,2 
.unitscan Jugkar Grim'rod
step
#label KhanJ
.goto Desolace,66.30,80.10
>>击杀|cRXP_ENEMY_杰恩可汗|r. 击杀后搜刮他的|cRXP_LOOT_头|r
.complete 1374,1 
.mob Khan Jehn
step
#completewith next
.subzone 2657 >>前往白骨之谷
step
.goto Desolace,64.00,91.70
.use 15848 >>|cRXP_WARN_使用|r |T132763:0|t[幽灵磁铁箱]
>>击杀|cRXP_ENEMY_玛格拉姆鬼魂|r, 它们出现时立即清理. 击败后可掉落|cRXP_LOOT_幽灵电浆|r
>>|cRXP_WARN_小心. 他们共享仇恨, 这里很容易拉怪过多|r
.complete 6134,1 
.mob Magrami Spectre
step
.goto Desolace,53.36,79.47
>>点击|cRXP_PICK_恶魔之门|r, 然后击杀|cRXP_ENEMY_恶魔之门的卫士|r
.complete 5581,1 
.mob Demon Portal Guardian
step
.goto Desolace,52.60,54.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Takata|r交谈
.turnin 1488 >>交任务: |cRXP_FRIENDLY_堕落者|r
.target Takata Steelblade
step
.goto Desolace,47.83,61.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hornizz|r交谈
.turnin 6134 >>交任务: |cRXP_FRIENDLY_幽灵电浆|r
.target Hornizz Brimbuzzle
step
.goto Desolace,36.30,79.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_智者乌泰克|r交谈
.turnin 1374 >>交任务: |cRXP_FRIENDLY_杰恩可汗|r
.accept 1380 >>接任务: |cRXP_WARN_赫鲁萨可汗|r
.target Uthek the Wise
.group
step
.goto Desolace,36.30,79.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_智者乌泰克|r交谈
.turnin 1374 >>交任务: |cRXP_FRIENDLY_杰恩可汗|r
.target Uthek the Wise
step
#loop
.goto Desolace,30.24,57.82,0
.goto Desolace,29.97,68.88,30,0
.goto Desolace,30.00,66.32,30,0
.goto Desolace,31.57,65.07,30,0
.goto Desolace,32.98,65.93,30,0
.goto Desolace,32.91,62.80,30,0
.goto Desolace,32.01,60.85,50,0
.goto Desolace,29.53,60.66,50,0
.goto Desolace,29.95,58.26,50,0
.goto Desolace,30.73,55.60,50,0
.goto Desolace,32.56,54.95,50,0
.goto Desolace,34.65,56.81,50,0
.goto Desolace,35.28,61.30,50,0
.goto Desolace,36.76,60.62,50,0
.goto Desolace,35.09,57.90,50,0
.goto Desolace,30.57,52.07,50,0
.goto Desolace,29.99,54.66,50,0
.goto Desolace,30.24,57.82,50,0
>>击杀 |cRXP_ENEMY_掠夺者半人马|r. 击败他们后可获得 |T134374:0|t[|cRXP_LOOT_半人马号角哨嘴|r]
>>|cRXP_WARN_这个物品掉落率很低, 可能需要较长时间才能获得|r
.collect 6074,1,1380,1 
.mob Maraudine Khan Advisor
.mob Maraudine Stormer
.mob Maraudine Scout
.mob Maraudine Windchaser
.mob Maraudine Mauler
.mob Maraudine Wrangler
.mob Maraudine Marauder
.isOnQuest 1380
.group 2
step
.goto Desolace,30.31,50.57,25,0
.goto Desolace,29.37,50.94,25,0
.goto Desolace,29.74,53.50
>>点击位于俯瞰玛拉顿山顶的|cRXP_PICK_哨嘴|r, 然后击杀多波次的玛拉顿半人马, 直到|cRXP_ENEMY_赫鲁萨可汗|r生成. 击杀他后, 拾取他的|cRXP_LOOT_Key Fragment|r
.complete 1380,1 
.mob Maraudine Khan Guard
.mob Maraudine Stormer
.mob Maraudine Khan Advisor
.mob Khan Hratha
.isOnQuest 1380
.group 2
step
.goto Desolace,33.90,53.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_梅丽萨|r开始护送任务
.accept 6132 >>接任务: |cRXP_WARN_救我出去！|r
.target Melizza Brimbuzzle
.group 2
step
>>护送|cRXP_FRIENDLY_Melizza|r至安全地点
>>|cRXP_WARN_这个任务很难！护送过程中会刷新两波怪物. 第一波有4个怪物, 尽量不要用掉所有的冷却技能. 第二波有5个怪物, 这里可以尽情使用所有技能|r
.complete 6132,1
.isOnQuest 6132
.group 2
step
.goto Desolace,47.80,61.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hornizz|r交谈
.turnin 6132 >>交任务: |cRXP_FRIENDLY_救我出去！|r
.target Hornizz Brimbuzzle
.isQuestComplete 6132
.group
step
.goto Desolace,36.30,79.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Uthek|r交谈
.turnin 1380 >>交任务: |cRXP_FRIENDLY_赫鲁萨可汗|r
.target Uthek the Wise
.isQuestComplete 1380
.group
step
#era
#completewith next
.goto Desolace,27.07,75.74,100,0
.goto Desolace,26.09,74.49,60,0
.subzone 2408 >>前往葬影村
step
.goto Desolace,25.81,68.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰迦·慧鬃|r谈话
.turnin 5581 >>交任务: |cRXP_FRIENDLY_燃烧军团的传送门|r
.target Taiga Wisemane
step
.hs >>返回陶拉祖营地
.goto The Barrens,45.58,59.04,30 >>抵达陶拉若营地
.use 6948
.cooldown item,6948,>0
step
.goto The Barrens,45.58,59.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Byula
.zoneskip The Barrens,1
step
.goto The Barrens,44.45,59.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
.fly Tanaris >>飞往塔纳利斯
.target Omusa Thunderhorn
.zoneskip The Barrens,1
step
.goto Desolace,21.60,74.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在码头尽头与|cRXP_FRIENDLY_萨隆|r交谈
.fly Tanaris >>飞往塔纳利斯
.target Thalon
.zoneskip Desolace,1
step
#optional
.abandon 1380 >>放弃赫鲁萨可汗
.isOnQuest 1380
step
#optional
.abandon 6132 >>放弃任务《救我出去！》
.isOnQuest 6132
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 43-45 塔纳利斯/尘泥沼泽
#displayname 43-45 塔纳利斯/尘泥沼泽 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 40-50
#next 45-46 菲拉斯
step
.goto Tanaris,51.60,26.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特兰雷克|r交谈
.turnin 2864 >>交任务: |cRXP_FRIENDLY_特兰雷克|r
.target Tran'rek
step
.goto Tanaris,51.84,27.02
>>点击|cRXP_PICK_通缉告示|r
.accept 2781 >>接任务: |cRXP_LOOT_通缉：卡利夫·斯科比斯汀|r
step
.goto Tanaris,52.50,27.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板菲兹格瑞博|r交谈
.home >>将你的[炉石]设置为加基森
.target Innkeeper Fizzgrimble
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bilgewhizzle|r和|cRXP_FRIENDLY_Luglunket|r交谈
.turnin 243 >>交任务: |cRXP_FRIENDLY_进入沙漠|r
.accept 379 >>接任务: |cRXP_LOOT_口渴的比格维兹|r
.accept 1690 >>接任务: |cRXP_LOOT_废土的公正|r
.target +Chief Engineer Bilgewhizzle
.goto Tanaris,52.46,28.52
.accept 1707 >>接任务: |cRXP_LOOT_收集水袋|r
.target +Spigot Operator Luglunket
.goto Tanaris,52.49,28.44
step
.goto Tanaris,50.20,27.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级勘探员菲兹杜瑟|r交谈
.accept 992 >>接任务: |cRXP_LOOT_加基森水业公司|r
.target Senior Surveyor Fizzledowser
step << Hunter
#completewith next
.goto Tanaris,52.253,28.001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉兹弗斯|r交谈
.stable >>驯服你的宠物. 你很快就会遇到一只沙漠猎食蝎
.xp <40,1
.target Laziphus
step << Hunter
.goto Tanaris,54.07,32.21
>>|cRXP_WARN_对|cRXP_ENEMY_沙漠猎食蝎|r施放 |T132164:0|t[驯服野兽]|cRXP_WARN_以驯服它|r 
.train 2976 >>|cRXP_WARN_用它攻击怪物来学习|r|T132140:0|t[利爪(等级6)]
.link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
.xp <40,1
.mob Scorpid Hunter
.zoneskip Tanaris,1
step << Hunter
.goto Tanaris,52.253,28.001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉兹弗斯|r交谈
.stable >>放弃|cRXP_ENEMY_沙漠猎食蝎|r并取回你的常规宠物
.target Laziphus
.train 2976,3
.zoneskip Tanaris,1





step
#completewith next
.goto Tanaris,59.36,24.75,60,0
.goto Tanaris,60.46,23.42,60,0
>>在前往蒸汽港的途中, 击杀正午废墟中的废土强盗和废土窃贼, 搜刮他们的水囊
.complete 1690,1 
.mob +Wastewander Bandit
.complete 1690,2 
.mob +Wastewander Thief
.collect 8483,10 
.mob +Wastewander Bandit
.mob +Wastewander Thief
step
.goto Tanaris,67.00,22.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Yeh'kinya|r交谈
.accept 3520 >>接任务: |cRXP_LOOT_尖啸者的灵魂|r
.target Yeh'kinya
step << Hunter
.goto Tanaris,67.01,21.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加贝|r交谈
>>|cRXP_BUY_从他那里购买|r|T135661:0|t[锯齿箭]|r
.collect 11285,2600,1690,1 
.target Jabbey
step
.goto Tanaris,67.10,24.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯杜雷|r交谈
.turnin 2872 >>交任务: |cRXP_FRIENDLY_斯杜雷的债务|r
.target Stoley
step
.goto Tanaris,64.22,29.16,0
.goto Tanaris,64.22,29.16,60,0
.goto Tanaris,63.62,31.32,60,0
.goto Tanaris,63.24,32.84,60,0
.goto Tanaris,59.36,24.75,60,0
.goto Tanaris,60.46,23.42,60,0
>>击杀|cRXP_ENEMY_废土强盗|r 和|cRXP_ENEMY_废土强盗|r , 搜刮他们的|cRXP_LOOT_Water Pouches|r
.complete 1690,1 
.mob +Wastewander Bandit
.complete 1690,2 
.mob +Wastewander Thief
.collect 8483,10 
.mob +Wastewander Bandit
.mob +Wastewander Thief
step << Shaman
#completewith next
.hs >>炉石或星界传送至加基森
.use 6948
step << Shaman
.goto Tanaris,52.63,28.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪尔格·奎克里弗|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Dirge Quikcleave
step
.goto Tanaris,52.46,28.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Bilgewhizzle|r 交谈
.turnin 379 >>交任务: |cRXP_FRIENDLY_口渴的比格维兹|r
.turnin 1690 >>交任务: |cRXP_FRIENDLY_废土的公正|r
.accept 1691 >>接任务: |cRXP_LOOT_废土的公正|r
.target Chief Engineer Bilgewhizzle
step
.goto Tanaris,52.49,28.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Luglunket|r交谈
.turnin 1707 >>交任务: |cRXP_FRIENDLY_收集水袋|r
.target Spigot Operator Luglunket
.itemcount 8483,5
step << skip
.goto Tanaris,50.20,27.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级勘探员菲兹杜瑟|r交谈
.turnin 992 >>交任务: |cRXP_FRIENDLY_加基森水业公司|r
.target Senior Surveyor Fizzledowser

step << !Shaman
.goto Tanaris,52.63,28.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪尔格·奎克里弗|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Dirge Quikcleave
step
#completewith next
.goto Tanaris,50.87,23.09,30,0
.goto Thousand Needles,75.49,97.58,30,0
.zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
step
.goto Thousand Needles,77.79,77.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kravel|r交谈
.turnin 1117 >>交任务: |cRXP_FRIENDLY_地精的谣言|r
.target Kravel Koalbeard
step
.goto Thousand Needles,78.07,77.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹尔|r交谈
.turnin 1137 >>交任务: |cRXP_FRIENDLY_回复菲兹尔|r
.target Fizzle Brassbolts
.isQuestTurnedIn 1108
step
.goto Thousand Needles,80.18,75.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普兹克|r交谈
.turnin 1183 >>交任务: |cRXP_FRIENDLY_地精赞助商|r
.accept 1186 >>接任务: |cRXP_LOOT_第十八个驾驶员|r
.accept 1190 >>接任务: |cRXP_LOOT_跟上节奏|r
.target Pozzik
.isQuestTurnedIn 1108
step
.goto Thousand Needles,80.18,75.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普兹克|r交谈
.turnin 1183 >>交任务: |cRXP_FRIENDLY_地精赞助商|r
.accept 1186 >>接任务: |cRXP_LOOT_第十八个驾驶员|r
.target Pozzik
step
.goto Thousand Needles,80.32,76.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉泽瑞克|r交谈
.turnin 1186 >>交任务: |cRXP_FRIENDLY_第十八个驾驶员|r
.accept 1187 >>接任务: |cRXP_LOOT_拉泽瑞克的调整|r
.target Razzeric
step
#completewith next
.goto Thousand Needles,79.81,77.02
>>与|cRXP_FRIENDLY_扎米克|r交谈以制造一个干扰
.turnin 1191 >>交任务: |cRXP_FRIENDLY_扎米克的困扰|r
.target Zamek
.timer 30,Zamek's Distraction RP
step
.goto Thousand Needles,77.21,77.41
>>点击金属小屋内的|r瑞兹尔的计划|r
.turnin 1190 >>交任务: |cRXP_FRIENDLY_跟上节奏|r
.accept 1194 >>接任务: |cRXP_LOOT_瑞兹尔的图表|r
.isQuestTurnedIn 1108
step
.goto Thousand Needles,77.79,77.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kravel|r交谈
.accept 1118 >>接任务: |cRXP_WARN_返回藏宝海湾|r
.target Kravel Koalbeard
step
.goto Thousand Needles,80.18,75.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普兹克|r交谈
.turnin 1194 >>交任务: |cRXP_FRIENDLY_瑞兹尔的图表|r
.target Pozzik
step
#optional
#completewith FlyDWM1
.destroy 5866 >>|cRXP_WARN_摧毁: |cRXP_ENEMY_精铁矿石样本|r|r
.itemcount 5866,1
step
#completewith FlyDWM1
.hs >>炉石前往加基森
.use 6948
.cooldown item,6948,>0
step
#completewith next
.goto Thousand Needles,75.44,97.37,40,0
.goto Tanaris,51.60,25.44,100 >>前往: |cRXP_PICK_塔纳利斯|r
.cooldown item,6948,<0
step
#label FlyDWM1
#completewith DWMpickups2
.goto Tanaris,51.60,25.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Brackenwall >>飞往尘泥沼泽
.target Bulkrek Ragefist
step
.goto Dustwallow Marsh,36.30,31.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领莫克莫洛克|r交谈
.accept 1166 >>接任务: |cRXP_LOOT_莫格穆洛克的任务|r
.target Overlord Mok'Morokk
step
.goto Dustwallow Marsh,37.10,33.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Draz'Zilb|r交谈
.target Draz'Zilb
.accept 1169 >>接任务: |cRXP_LOOT_群龙之首|r
step
#label DWMpickups2
.goto Dustwallow Marsh,37.30,31.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔格|r交谈
.accept 1168 >>接任务: |cRXP_LOOT_黑龙军团|r
.target Tharg
step
#completewith MokSnuff
.line Dustwallow Marsh,50.57,52.82,50.51,55.20,49.15,57.14,48.01,55.61,47.24,57.70,45.94,61.21,44.69,62.28,45.94,61.21,47.24,57.70,48.01,55.61,47.24,54.53,46.08,54.38,45.72,53.06,46.08,54.38,47.24,54.53,47.15,51.45
>>找到并击杀|cRXP_ENEMY_死沼巨鳄|r. 击败他后搜刮他的|cRXP_LOOT_牙|r
>>|cRXP_WARN_他是一只白色鳄鱼, 巡逻于该区域的水域沼泽中|r
.complete 1205,1 
.unitscan Deadmire
step
.goto Dustwallow Marsh,54.10,56.50
>>在坠毁的齐柏林飞艇附近的地面上拾取箱子, 以获得爆盐增压器
.complete 1187,1 
step
#loop
.goto Dustwallow Marsh,56.51,61.15,0
.goto Dustwallow Marsh,56.51,61.15,50,0
.goto Dustwallow Marsh,55.46,61.60,50,0
.goto Dustwallow Marsh,54.80,62.41,50,0
.goto Dustwallow Marsh,54.31,63.24,50,0
.goto Dustwallow Marsh,54.68,64.41,50,0
.goto Dustwallow Marsh,56.10,65.14,50,0
.goto Dustwallow Marsh,56.52,63.62,50,0
.goto Dustwallow Marsh,56.81,62.56,50,0
.goto Dustwallow Marsh,57.30,60.20,50,0
>>在海滩上击杀莫克壳玛克拉拉斯. 击败它们以获得吊坠
.complete 1261,1 
.isOnQuest 1261
.mob Muckshell Razorclaw
.mob Muckshell Clacker
.mob Muckshell Scrabbler
.mob Muckshell Pincer
.mob Muckshell Snapclaw
.unitscan Lord Angler
step
#completewith ScalebaneCave
>>击杀|cRXP_ENEMY_火鬃斥候|r 和|cRXP_ENEMY_火鬃灰尾龙人|r
.complete 1168,1 
.mob +Firemane Scout
.complete 1168,2 
.mob +Firemane Ash Tail
step
#completewith ScalebaneCave
>>击杀|cRXP_ENEMY_Searing 灼热雏龙|r和|cRXP_ENEMY_Searing 灼热龙崽|r. 击杀后掠夺它们的|cRXP_LOOT_舌头|r和|cRXP_LOOT_心脏|r
.complete 1169,1 
.complete 1169,2 
.mob Searing Whelp
.mob Searing Hatchling
step
#label MokSnuff
.goto Dustwallow Marsh,44.50,66.00
>>搜刮地面上的|cRXP_PICK_Barrel|r以获得|cRXP_LOOT_莫格穆洛克的鼻烟|r
.complete 1166,1 
step
.goto Dustwallow Marsh,38.70,65.60
>>拾取地面上的|cRXP_PICK_Vase|r, 获得|cRXP_LOOT_莫格穆洛克的烈酒|r
.complete 1166,2 
step
#label ScalebaneCave
#completewith Dragondeez
.goto Dustwallow Marsh,38.31,66.23,12 >>进入洞窟
step
#completewith next
>>击杀|cRXP_ENEMY_火鬃守卫|r
>>|cRXP_WARN_它们只能在洞穴内部找到|r
.complete 1168,3 
.mob Firemane Scalebane
step
.goto Dustwallow Marsh,36.60,69.50
>>在洞穴后方的|cRXP_PICK_Chest|r中掠夺, 以获得|cRXP_LOOT_莫格穆洛克的保险箱|r
.complete 1166,3 
step
#label Dragondeez
#loop
.goto Dustwallow Marsh,37.44,68.47,0
.goto Dustwallow Marsh,37.44,68.47,15,0
.goto Dustwallow Marsh,38.59,68.10,15,0
.goto Dustwallow Marsh,38.31,66.98,15,0
.goto Dustwallow Marsh,37.27,67.39,15,0
>>击杀|cRXP_ENEMY_火鬃守卫|r
>>|cRXP_WARN_它们只能在洞穴内部找到|r
.complete 1168,3 
.mob Firemane Scalebane
step
#completewith next
>>击杀|cRXP_ENEMY_Searing 灼热雏龙|r和|cRXP_ENEMY_Searing 灼热龙崽|r. 击杀后掠夺它们的|cRXP_LOOT_舌头|r和|cRXP_LOOT_心脏|r
.complete 1169,1 
.complete 1169,2 
.mob Searing Whelp
.mob Searing Hatchling
step
#label Firemanemobs
#loop
.goto Dustwallow Marsh,39.08,65.92,0
.goto Dustwallow Marsh,39.08,65.92,80,0
.goto Dustwallow Marsh,42.81,66.35,80,0
.goto Dustwallow Marsh,44.63,66.16,80,0
>>击杀|cRXP_ENEMY_火鬃斥候|r 和|cRXP_ENEMY_火鬃灰尾龙人|r
.complete 1168,1 
.mob +Firemane Scout
.complete 1168,2 
.mob +Firemane Ash Tail
step
#loop
.goto Dustwallow Marsh,45.60,82.28,0
.goto Dustwallow Marsh,48.10,80.85,60,0
.goto Dustwallow Marsh,47.09,82.39,60,0
.goto Dustwallow Marsh,45.60,82.28,60,0
.goto Dustwallow Marsh,43.99,81.35,60,0
.goto Dustwallow Marsh,42.31,80.73,60,0
.goto Dustwallow Marsh,42.08,78.40,60,0
.goto Dustwallow Marsh,42.45,75.89,60,0
.goto Dustwallow Marsh,45.60,82.28,60,0
>>击杀|cRXP_ENEMY_Searing 灼热雏龙|r和|cRXP_ENEMY_Searing 灼热龙崽|r. 击杀后掠夺它们的|cRXP_LOOT_舌头|r和|cRXP_LOOT_心脏|r
.complete 1169,1 
.complete 1169,2 
.mob Searing Whelp
.mob Searing Hatchling
step
#completewith next
.line Dustwallow Marsh,50.57,52.82,50.51,55.20,49.15,57.14,48.01,55.61,47.24,57.70,45.94,61.21,44.69,62.28,45.94,61.21,47.24,57.70,48.01,55.61,47.24,54.53,46.08,54.38,45.72,53.06,46.08,54.38,47.24,54.53,47.15,51.45
>>找到并击杀|cRXP_ENEMY_死沼巨鳄|r. 击败他后搜刮他的|cRXP_LOOT_牙|r
>>|cRXP_WARN_他是一只白色鳄鱼, 巡逻于该区域的水域沼泽中|r
.complete 1205,1 
.unitscan Deadmire
.dungeon ZF
step
.goto Dustwallow Marsh,46.021,57.096
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔贝萨|r交谈
.accept 2846 >>接任务: |cRXP_WARN_深渊皇冠|r
.target Tabetha
.dungeon ZF
step
#loop
.line Dustwallow Marsh,50.57,52.82,50.51,55.20,49.15,57.14,48.01,55.61,47.24,57.70,45.94,61.21,44.69,62.28,45.94,61.21,47.24,57.70,48.01,55.61,47.24,54.53,46.08,54.38,45.72,53.06,46.08,54.38,47.24,54.53,47.15,51.45
.goto Dustwallow Marsh,50.57,52.82,50,0
.goto Dustwallow Marsh,50.51,55.20,50,0
.goto Dustwallow Marsh,49.15,57.14,50,0
.goto Dustwallow Marsh,48.01,55.61,50,0
.goto Dustwallow Marsh,47.24,57.70,50,0
.goto Dustwallow Marsh,45.94,61.21,50,0
.goto Dustwallow Marsh,44.69,62.28,50,0
.goto Dustwallow Marsh,45.94,61.21,50,0
.goto Dustwallow Marsh,47.24,57.70,50,0
.goto Dustwallow Marsh,47.24,54.53,50,0
.goto Dustwallow Marsh,46.08,54.38,50,0
.goto Dustwallow Marsh,45.72,53.06,50,0
.goto Dustwallow Marsh,46.08,54.38,50,0
.goto Dustwallow Marsh,47.73,53.18,50,0
.goto Dustwallow Marsh,47.15,51.45,50,0
.goto Dustwallow Marsh,50.57,52.82,0
>>找到并击杀|cRXP_ENEMY_死沼巨鳄|r. 击败他后搜刮他的|cRXP_LOOT_牙|r
>>|cRXP_WARN_他是一只白色鳄鱼, 巡逻于该区域的水域沼泽中|r
.complete 1205,1 
.unitscan Deadmire
step
#completewith next
.goto Dustwallow Marsh,36.64,31.72,120,0
.subzone 496 >>前往蕨墙村
step
.goto Dustwallow Marsh,37.10,33.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Draz'Zilb|r交谈
.turnin 1169 >>交任务: |cRXP_FRIENDLY_群龙之首|r
.target Draz'Zilb
step
.goto Dustwallow Marsh,36.30,31.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领莫克莫洛克|r交谈
.turnin 1166 >>交任务: |cRXP_FRIENDLY_莫格穆洛克的任务|r
.target Overlord Mok'Morokk
step
.goto Dustwallow Marsh,37.30,31.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔格|r交谈
.turnin 1168 >>交任务: |cRXP_FRIENDLY_黑龙军团|r
.target Tharg
step
.goto Dustwallow Marsh,35.30,30.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nazeer|r交谈
.turnin 1261 >>交任务: |cRXP_FRIENDLY_玛尔格的嘱托|r
.accept 1262 >>接任务: |cRXP_LOOT_向佐尔报告|r
.target Nazeer Bloodpike
.isQuestComplete 1261
step
.goto Dustwallow Marsh,35.30,30.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nazeer|r交谈
.accept 1262 >>接任务: |cRXP_LOOT_向佐尔报告|r
.target Nazeer Bloodpike
.isQuestTurnedIn 1261
step
#completewith TanarisResupply
.hs >>炉石前往加基森
.use 6948
.cooldown item,6948,>0
.zoneskip Tanaris
step
#completewith TanarisResupply
.goto Dustwallow Marsh,35.57,31.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙尔迪|r交谈
.fly Gadgetzan >>飞往加基森
.target Shardi
.zoneskip Tanaris
.cooldown item,6948,<0
step
.goto Tanaris,51.84,27.02
>>点击|cRXP_PICK_通缉告示|r
.accept 2781 >>接任务: |cRXP_LOOT_通缉：卡利夫·斯科比斯汀|r
step
.use 8524 >>使用 |T134459:0|t[|cRXP_LOOT_发电器4711-FTZ型|r] 开始任务
.accept 654 >>接任务: |cRXP_LOOT_塔纳利斯的样本|r
.isQuestTurnedIn 379
step << skip
#completewith next
>>击杀|cRXP_ENEMY_Basilisks|r和|cRXP_ENEMY_Hyenas|r和|cRXP_ENEMY_蝎子|r, 击败后掠夺其掉落的|cRXP_LOOT_Samples|r
>>|cRXP_WARN_使用|r|cRXP_LOOT_Samples|r|cRXP_WARN_来测试它们|r
>>|cRXP_WARN_请勿删除任何未测试的样本|r
>>|cRXP_WARN_此任务有一个2小时的倒计时. 如果时间耗尽, 你将需要从|r|cRXP_FRIENDLY_首席工程师沙克斯·比格维兹|r处获取一个新的|r|cRXP_FRIENDLY_发电器4711-FTZ型|r|r
.complete 654,1 
.mob +Glasshide Basilisk
.mob +Glasshide Gazer
.mob +Glasshide Petrifier
.complete 654,2 
.mob +Starving Blisterpaw
.mob +Blisterpaw Hyena
.mob +Murderous Blisterpaw
.mob +Rabid Blisterpaw
.complete 654,3 
.mob +Scorpid Tail Lasher
.mob +Scorpid Hunter
.mob +Scorpid Dunestalker
.mob +Scorpid Duneburrower
.use 9437
.use 9439
.use 9442
step << skip 
.goto Tanaris,39.10,29.30
.use 8584 >>|cRXP_WARN_在池边使用|r|T134867:0|t[未使用的寻水器]|r
>>|cRXP_WARN_远离生成的两个怪物, 不要攻击它们|r
.complete 992,1 
step
#loop
.goto Tanaris,47.99,33.20,0
.goto Tanaris,55.94,32.72,90,0
.goto Tanaris,53.75,35.37,90,0
.goto Tanaris,51.13,35.41,90,0
.goto Tanaris,50.18,32.78,90,0
.goto Tanaris,47.99,33.20,90,0
.goto Tanaris,45.47,32.72,90,0
.goto Tanaris,42.52,32.90,90,0
.goto Tanaris,41.23,33.18,90,0
.goto Tanaris,38.30,32.55,90,0
.goto Tanaris,47.99,33.20,90,0
>>击杀|cRXP_ENEMY_Basilisks|r和|cRXP_ENEMY_Hyenas|r和|cRXP_ENEMY_蝎子|r, 击败后掠夺其掉落的|cRXP_LOOT_Samples|r
>>|cRXP_WARN_使用|r|cRXP_LOOT_Samples|r|cRXP_WARN_来测试它们|r
>>|cRXP_WARN_请勿删除任何未测试的样本|r
>>|cRXP_WARN_此任务有一个2小时的倒计时. 如果时间耗尽, 你将需要从|r|cRXP_FRIENDLY_首席工程师沙克斯·比格维兹|r处获取一个新的|r|cRXP_FRIENDLY_发电器4711-FTZ型|r|r
.complete 654,1 
.mob +Glasshide Basilisk
.mob +Glasshide Gazer
.mob +Glasshide Petrifier
.complete 654,2 
.mob +Starving Blisterpaw
.mob +Blisterpaw Hyena
.mob +Murderous Blisterpaw
.mob +Rabid Blisterpaw
.complete 654,3 
.mob +Scorpid Tail Lasher
.mob +Scorpid Hunter
.mob +Scorpid Dunestalker
.mob +Scorpid Duneburrower
.use 9437
.use 9439
.use 9442
step << skip
.goto Tanaris,50.20,27.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级勘探员菲兹杜瑟|r交谈
.turnin 992 >>交任务: |cRXP_FRIENDLY_加基森水业公司|r
.target Senior Surveyor Fizzledowser
step
.goto Tanaris,52.40,28.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Bilgewhizzle|r 交谈
.turnin 654 >>交任务: |cRXP_FRIENDLY_塔纳利斯的样本|r
.target Chief Engineer Bilgewhizzle
.isOnQuest 654
step
#completewith next
.line Tanaris,61.91,35.57,61.91,34.80,62.93,33.28,63.92,31.73,63.93,33.36,63.43,34.33,62.47,35.20,61.91,35.57,60.95,36.69,60.33,37.27,59.56,38.41,58.86,39.41,59.56,38.41,60.33,37.27,60.95,36.69,61.91,35.57,62.47,35.20,63.35,37.42,62.21,37.99,60.84,38.59,62.21,37.99,63.35,37.42,64.21,36.43,64.64,35.28,64.30,33.66,64.18,32.42,63.94,31.73
>>击杀 |cRXP_ENEMY_卡利夫·斯科比斯汀|r. 击败他后搜刮其 |cRXP_LOOT_头|r
>>|cRXP_WARN_小心, 他身边有两个潜行的小怪|r
.complete 2781,1 
.unitscan Caliph Scorpidsting
step
#loop
.goto Tanaris,61.04,32.76,0
.goto Tanaris,58.75,36.42,80,0
.goto Tanaris,60.10,37.07,80,0
.goto Tanaris,60.84,38.91,80,0
.goto Tanaris,61.04,32.76,80,0
.goto Tanaris,61.84,34.95,80,0
.goto Tanaris,63.48,37.90,80,0
.goto Tanaris,63.80,39.94,80,0
.goto Tanaris,65.10,39.50,80,0
.goto Tanaris,65.36,36.67,80,0
.goto Tanaris,61.04,32.76,80,0
>>击杀|cRXP_ENEMY_废土游荡者|r和|cRXP_ENEMY_刺客|r和|cRXP_ENEMY_影法师|r
.complete 1691,1 
.mob +Wastewander Rogue
.complete 1691,2 
.mob +Wastewander Assassin
.complete 1691,3 
.mob +Wastewander Shadow Mage
step
#loop
.line Tanaris,61.91,35.57,61.91,34.80,62.93,33.28,63.92,31.73,63.93,33.36,63.43,34.33,62.47,35.20,61.91,35.57,60.95,36.69,60.33,37.27,59.56,38.41,58.86,39.41,59.56,38.41,60.33,37.27,60.95,36.69,61.91,35.57,62.47,35.20,63.35,37.42,62.21,37.99,60.84,38.59,62.21,37.99,63.35,37.42,64.21,36.43,64.64,35.28,64.30,33.66,64.18,32.42,63.94,31.73
.goto Tanaris,61.09,35.99,60,0
.goto Tanaris,61.91,34.80,60,0
.goto Tanaris,62.93,33.28,60,0
.goto Tanaris,63.92,31.73,60,0
.goto Tanaris,63.93,33.36,60,0
.goto Tanaris,63.43,34.33,60,0
.goto Tanaris,62.47,35.20,60,0
.goto Tanaris,61.91,35.57,60,0
.goto Tanaris,60.95,36.69,60,0
.goto Tanaris,60.33,37.27,60,0
.goto Tanaris,59.56,38.41,60,0
.goto Tanaris,58.86,39.41,60,0
.goto Tanaris,59.56,38.41,60,0
.goto Tanaris,60.33,37.27,60,0
.goto Tanaris,60.95,36.69,60,0
.goto Tanaris,61.91,35.57,60,0
.goto Tanaris,62.47,35.20,60,0
.goto Tanaris,63.35,37.42,60,0
.goto Tanaris,62.21,37.99,60,0
.goto Tanaris,60.84,38.59,60,0
.goto Tanaris,62.21,37.99,60,0
.goto Tanaris,63.35,37.42,60,0
.goto Tanaris,64.21,36.43,60,0
.goto Tanaris,64.64,35.28,60,0
.goto Tanaris,64.30,33.66,60,0
.goto Tanaris,64.18,32.42,60,0
.goto Tanaris,63.94,31.73,60,0
.goto Tanaris,63.94,31.73,0
>>击杀 |cRXP_ENEMY_卡利夫·斯科比斯汀|r. 击败他后搜刮其 |cRXP_LOOT_头|r
>>|cRXP_WARN_小心, 他身边有两个潜行的小怪|r
.complete 2781,1 
.unitscan Caliph Scorpidsting
step
.goto Tanaris,52.40,28.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Bilgewhizzle|r 交谈
.turnin 1691 >>交任务: |cRXP_FRIENDLY_废土的公正|r
.turnin 2781 >>交任务: |cRXP_FRIENDLY_通缉：卡利夫·斯科比斯汀|r
.target Chief Engineer Bilgewhizzle
step
#sticky
#completewith EnterUldaman
.subzone 1337,2 >>现在你应该寻找一个团队进入奥达曼
.dungeon ULDA
step << !Mage
.goto Tanaris,51.60,25.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.target Bulkrek Ragefist
.zoneskip Tanaris
.dungeon ULDA
step << Mage
.cast 3567 >>施放 |T135759:0|t[传送:奥格瑞玛]
.zoneskip Orgrimmar
.dungeon ULDA
step << Mage
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 10185 >>训练你的职业法术
.target Pephredo
.xp <44,1
.xp >46,1
.dungeon ULDA
step << Mage
#optional
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 10197 >>训练你的职业法术
.target Pephredo
.xp <46,1
.dungeon ULDA
step << Priest
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 10927 >>训练你的职业法术
.target Ur'kyo
.xp <44,1
.xp >46,1
.dungeon ULDA
step << Priest
#optional
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 10945 >>训练你的职业法术
.target Ur'kyo
.xp <46,1
.dungeon ULDA
step << Shaman
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 16315 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <44,1
.xp >46,1
.dungeon ULDA
step << Shaman
#optional
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 10472 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <46,1
.dungeon ULDA
step << Hunter
.goto Orgrimmar,78.11,38.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Jin'sora交谈|r
.vendor >>|cRXP_BUY_购买|r|T135489:0|t[|cRXP_FRIENDLY_大型长弓|r]|cRXP_BUY_如果可用|r
.target Jin'sora
.money <6.7952
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<21.9
.itemcount 11307,<1
.dungeon ULDA
step << Hunter
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14285 >>训练你的职业法术
.target Ormak Grimshot
.xp <44,1
.xp >46,1
.dungeon ULDA
step << Hunter
#optional
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14304 >>训练你的职业法术
.target Ormak Grimshot
.xp <46,1
.dungeon ULDA
step << Warrior
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 11584 >>训练你的职业法术
.target Grezz Ragefist
.xp <44,1
.xp >46,1
.dungeon ULDA
step << Warrior
#optional
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 11578 >>训练你的职业法术
.target Grezz Ragefist
.xp <46,1
.dungeon ULDA
step << Rogue
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 11341 >>训练你的职业法术
.target Ormok
.xp <44,1
.xp >46,1
.dungeon ULDA
step << Rogue
#optional
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 11293 >>训练你的职业法术
.target Ormok
.xp <46,1
.dungeon ULDA
step << Rogue
.goto Orgrimmar,42.10,49.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔交谈|r
.vendor >>|cRXP_BUY_储备闪光粉和毒药|r
.target Rekkul
.dungeon ULDA
step << Warlock
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 11671 >>训练你的职业法术
.target Mirket
.xp <44,1
.xp >46,1
.dungeon ULDA
step << Warlock
#optional
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 11699 >>训练你的职业法术
.target Mirket
.xp <46,1
.dungeon ULDA
step
#completewith next
.zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
.zoneskip Durotar
.dungeon ULDA
step
.goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
.zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
.zoneskip Stranglethorn Vale
.dungeon ULDA
step
.goto Stranglethorn Vale,32.5,29.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞斯塔|r交谈
.fly Badlands >>飞往荒芜之地
.target Thysta
.dungeon ULDA
step
.goto Badlands,2.42,46.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加卡尔|r交谈
.accept 2202 >>接任务: |cRXP_LOOT_奥达曼的蘑菇|r
.target Jarkal Mossmeld
.isQuestTurnedIn 2258
.dungeon ULDA
step
.goto Badlands,51.38,76.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与迷失者塞尔杜林交谈|cRXP_FRIENDLY_Theldurin the Lost|r
.accept 709 >>接任务: |cRXP_LOOT_化解灾难|r
.target Theldurin the Lost
.dungeon ULDA
step
.goto Eastern Kingdoms,54.49,57.77
.zone 1415 >>前往奥达曼遗迹
.dungeon ULDA
step
#completewith EnterUldaman
>>如果你拾取了|T133289:0|t[|cRXP_LOOT_破碎的项链|r], 请将其保存在你的物品栏中
.collect 7666,1,2283,1 
.dungeon ULDA
step
#completewith Treasure
>>拾取地面上的|cRXP_LOOT_紫色蘑菇|r
>>|cRXP_WARN_这可以在奥达曼内部和外部完成|r
.complete 2202,1 
.isOnQuest 2202
.dungeon ULDA
step
.goto Eastern Kingdoms,53.99,57.90,0
.goto Eastern Kingdoms,53.99,57.90,25,0
.goto Eastern Kingdoms,54.14,58.24
>>打开|cRXP_PICK_古代储物箱|r. 将其打开后获得|cRXP_LOOT_里温之石板|r
>>|cRXP_WARN_这个任务是在奥达曼之外完成的|r
.complete 709,1 
.isOnQuest 709
.dungeon ULDA
step
#label Treasure
.goto Eastern Kingdoms,53.81,57.94,0
.goto Eastern Kingdoms,53.81,57.94,20,0
.goto Eastern Kingdoms,53.69,57.94,12,0
.goto Eastern Kingdoms,53.78,58.23
>>在南公共大厅的南角处掠夺|cRXP_PICK_加勒特家族宝箱|r, 获得|cRXP_LOOT_加勒特的家族宝藏|r
>>|cRXP_WARN_南公共大厅位于奥达曼副本入口的西南方向|r
.complete 2342,1 
.isOnQuest 2342
.dungeon ULDA
step
#completewith next
>>拾取地面上的|cRXP_LOOT_紫色蘑菇|r
>>|cRXP_WARN_这可以在奥达曼内部和外部完成|r
.complete 2202,1 
.isOnQuest 2202
.dungeon ULDA
step
#label EnterUldaman
.goto Eastern Kingdoms,53.85,57.68
.subzone 1337,2 >>进入奥达曼遗址
.dungeon ULDA
step
#completewith next
>>拾取地面上的|cRXP_LOOT_紫色蘑菇|r
>>|cRXP_WARN_这可以在奥达曼内部和外部完成|r
.complete 2202,1 
.isOnQuest 2202
.dungeon ULDA
step
>>击杀|cRXP_ENEMY_阿扎达斯|r
>>点击 |cRXP_PICK_诺甘农圆盘|r
.accept 2278 >>接任务: |cRXP_WARN_白金圆盘|r
.mob Archaedas
.dungeon ULDA
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺甘农的看门人|r交谈
.complete 2278,1 
.skipgossip
.target Lore Keeper of Norgannon
.dungeon ULDA
step
>>点击 |cRXP_PICK_诺甘农圆盘|r
.turnin 2278 >>交任务: |cRXP_FRIENDLY_白金圆盘|r
.accept 2280 >>接任务: |cRXP_WARN_白金圆盘|r
.dungeon ULDA
step
.zone Badlands >>前往: |cRXP_PICK_荒芜之地|r
.dungeon ULDA
step
.goto Badlands,51.38,76.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与迷失者塞尔杜林交谈|cRXP_FRIENDLY_Theldurin the Lost|r
.turnin 709 >>交任务: |cRXP_FRIENDLY_化解灾难|r
.accept 728 >>接任务: |cRXP_LOOT_远赴幽暗城|r
.target Theldurin the Lost
.isQuestComplete 709
.dungeon ULDA
step
.goto Badlands,2.42,46.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加卡尔|r交谈
.turnin 2202 >>交任务: |cRXP_FRIENDLY_奥达曼的蘑菇|r
.target Jarkal Mossmeld
.isQuestComplete 2202
.dungeon ULDA
step
.hs >>炉石前往加基森
.use 6948
.cooldown item,6948,>0
.dungeon ULDA
.zoneskip Tanaris
step
.goto Tanaris,51.60,25.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Freewind >>飞往乱风岗
.target Bulkrek Ragefist
step
#optional
.abandon 2202 >>Abandon 接任务: |cRXP_LOOT_奥达曼的蘑菇|r
.isOnQuest 2202
.dungeon ULDA
step
#optional
.abandon 709 >>放弃化解灾难, 走向毁灭
.isOnQuest 709
.dungeon ULDA
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 45-46 菲拉斯
#displayname 45-46 菲拉斯 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 40-50
#next 46-47 南荆棘谷
step
#completewith next
.zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
#completewith FeralasHS
.line Feralas,75.99,42.85,76.49,43.22,75.53,43.68,74.38,44.01,73.56,46.53,73.52,45.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗克|r交谈
>>|cRXP_WARN_她巡逻莫沙彻营地的道路|r
.turnin 2981 >>交任务: |cRXP_FRIENDLY_菲拉斯的危机|r
.accept 2975 >>接任务: |cRXP_LOOT_菲拉斯的食人魔|r
.unitscan Rok Orhan
step
.goto Feralas,75.70,44.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔文·吉兹米克|r交谈
.accept 2987 >>接任务: |cRXP_LOOT_戈杜尼钴矿石|r
.target Orwin Gizzmick
step
.goto Feralas,76.06,43.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布隆克|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Bronk
step
.goto Feralas,76.00,42.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁伊格·碎颅|r交谈
.accept 2973 >>接任务: |cRXP_LOOT_新斗篷的光辉|r
.target Krueg Skullsplitter
step
.goto Feralas,74.90,42.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hadoken|r交谈
.accept 2862 >>接任务: |cRXP_LOOT_与豺狼人开战|r
.target Hadoken Swiftstrider
step
.goto Feralas,74.50,42.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑内的|cRXP_FRIENDLY_Jangdor|r交谈
.accept 2822 >>接任务: |cRXP_LOOT_质量的保证|r
.target Jangdor Swiftstrider
step
#label FeralasHS
.goto Feralas,74.81,45.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格鲁尔|cRXP_FRIENDLY_旅店老板格鲁尔|r交谈
.home >>将你的炉石设置为莫沙彻营地
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Greul
step
#loop
.line Feralas,75.99,42.85,76.49,43.22,75.53,43.68,74.38,44.01,73.56,46.53,73.52,45.13
.goto Feralas,73.56,46.53,20,0
.goto Feralas,73.71,46.03,20,0
.goto Feralas,75.99,42.85,20,0
.goto Feralas,76.49,43.22,20,0
.goto Feralas,75.53,43.68,20,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗克|r交谈
>>|cRXP_WARN_她巡逻莫沙彻营地的道路|r
.turnin 2981 >>交任务: |cRXP_FRIENDLY_菲拉斯的危机|r
.accept 2975 >>接任务: |cRXP_LOOT_菲拉斯的食人魔|r
.unitscan Rok Orhan
step << Hunter
#completewith next
.goto Feralas,74.49,43.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_谢尔卡·狼行者|r交谈
.stable >>将你的宠物安置在马厩里. 你很快就会驯服一只长牙奔跑者
.target Shyrka Wolfrunner
step << Hunter
#loop
.goto Feralas,72.18,43.82,0
.goto Feralas,70.61,41.52,0
.goto Feralas,72.18,43.82,60,0
.goto Feralas,70.61,41.52,60,0
>>|cRXP_WARN_对|cRXP_ENEMY_长牙奔跑者|r 施放 |T132164:0|t[驯服野兽] 来驯服它|r 
.train 17266 >>|cRXP_WARN_用它攻击怪物来学习|r|T132278:0|t[噬咬(等级6)]
.link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
.mob Longtooth Runner
step << Hunter
.goto Feralas,74.49,43.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_谢尔卡·狼行者|r交谈
.stable >>放弃|cRXP_ENEMY_长牙奔跑者|r并取回你的普通宠物
.target Shyrka Wolfrunner
.train 17266,3
.zoneskip Feralas,1
step
#sticky
#completewith YetiHide
>>在菲拉斯各地完成任务时, 请留意 |T132836:0|t[|cRXP_FRIENDLY_Distress Beacon|r] 的掉落
.collect 8705,1,2766
.accept 2766 >>接任务: |cRXP_LOOT_寻找OOX-22/FE！|r
step
#loop
.goto Feralas,72.79,39.32,0
.goto Feralas,72.79,39.32,60,0
.goto Feralas,72.11,37.21,60,0
.goto Feralas,73.18,36.29,60,0
>>击杀|cRXP_ENEMY_Woodpaw Gnolls|r. 搜刮其|cRXP_LOOT_Manes|r
>>|cRXP_ENEMY_木爪捕兽者|r|cRXP_WARN_施法|r|T132149:0|t[网]|cRXP_WARN_可使目标 immobilize(禁锢)10秒|r
.complete 2862,1 
.mob Woodpaw Mongrel
.mob Woodpaw Trapper
.mob Woodpaw Brute
.mob Woodpaw Reaver
.mob Woodpaw Mystic
.mob Woodpaw Alpha
step
#completewith Scroll
.goto Feralas,75.30,28.26,0
.use 9466 >>|cRXP_WARN_使用|r|T134435:0|t[奥尔温的铁铲]|cRXP_WARN_在蓝色圆圈|r
>>掠夺地面上刷新的|cRXP_PICK_戈杜尼土堆|r以获得|cRXP_LOOT_戈杜尼钴矿石|r
.complete 2987,1 
step
#completewith Shovel
.goto Feralas,76.10,33.20,0
>>在戈杜尼前哨站击杀戈杜尼食人魔和食人魔法师和暴徒
.complete 2975,1 
.mob +Gordunni Ogre
.complete 2975,2 
.mob +Gordunni Ogre Mage
.complete 2975,3 
.mob +Gordunni Brute
step
#label Scroll
#loop
.goto Feralas,75.25,34.44,0
.goto Feralas,79.40,34.80,25,0
.goto Feralas,80.50,34.30,25,0
.goto Feralas,80.80,35.00,25,0
.goto Feralas,75.10,29.80,25,0
.goto Feralas,75.20,28.70,25,0
.goto Feralas,74.60,27.90,25,0
>>拾取地面上的|cRXP_PICK_卷轴|r以获得|T134943:0|t[|cRXP_LOOT_戈杜尼卷轴|r]. 使用它来开启任务
>>|cRXP_WARN_跟随箭头前往其不同的刷新位置|r
.collect 9370,1,2978 
.accept 2978 >>接任务: |cRXP_LOOT_戈杜尼卷轴|r
.use 9370
step
#label Shovel
#loop
.goto Feralas,74.29,28.98,0
.goto Feralas,74.29,28.98,30,0
.goto Feralas,75.35,28.23,30,0
.goto Feralas,76.01,29.00,30,0
.goto Feralas,76.89,29.60,30,0
.goto Feralas,76.47,33.05,30,0
.goto Feralas,76.70,33.86,30,0
.use 9466 >>|cRXP_WARN_使用|r|T134435:0|t[奥尔温的铁铲]|cRXP_WARN_在蓝色圆圈|r
>>掠夺地面上刷新的|cRXP_PICK_戈杜尼土堆|r以获得|cRXP_LOOT_戈杜尼钴矿石|r
.complete 2987,1 
step
.goto Feralas,74.82,27.53,0
.goto Feralas,74.82,27.53,50,0
.goto Feralas,75.25,29.55,50,0
.goto Feralas,76.51,30.48,50,0
.goto Feralas,75.45,34.59,50,0
>>在戈杜尼前哨站击杀戈杜尼食人魔和食人魔法师和暴徒
.complete 2975,1 
.mob +Gordunni Ogre
.complete 2975,2 
.mob +Gordunni Ogre Mage
.complete 2975,3 
.mob +Gordunni Brute
step
.goto Feralas,76.10,33.20
.xp 45 >>升级到45级
step << Shaman
#completewith WoodpawWarTurnin
.hs >>传送至莫沙彻营地
.use 6948
step << !Shaman
#completewith next
.goto Feralas,74.73,43.59,150 >>返回莫哈切营地
step
#label WoodpawWarTurnin
.goto Feralas,74.90,42.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hadoken|r交谈
.turnin 2862 >>交任务: |cRXP_FRIENDLY_与豺狼人开战|r
.accept 2863 >>接任务: |cRXP_LOOT_突然袭击|r
.target Hadoken Swiftstrider
step
#loop
.line Feralas,75.99,42.85,76.49,43.22,75.53,43.68,74.38,44.01,73.56,46.53,73.52,45.13
.goto Feralas,73.56,46.53,20,0
.goto Feralas,73.71,46.03,20,0
.goto Feralas,75.99,42.85,20,0
.goto Feralas,76.49,43.22,20,0
.goto Feralas,75.53,43.68,20,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗克|r交谈
.turnin 2975 >>交任务: |cRXP_FRIENDLY_菲拉斯的食人魔|r
.accept 2980 >>接任务: |cRXP_LOOT_菲拉斯的食人魔|r
.turnin 2978 >>交任务: |cRXP_FRIENDLY_戈杜尼卷轴|r
.accept 2979 >>接任务: |cRXP_LOOT_黑暗仪式|r
.target Rok Orhan
step
.goto Feralas,75.70,44.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔文·吉兹米克|r交谈
.turnin 2987 >>交任务: |cRXP_FRIENDLY_戈杜尼钴矿石|r
.target Orwin Gizzmick
step
.goto Feralas,68.80,48.00
>>击杀|cRXP_ENEMY_小精龙|r. 击败它们并拾取其|cRXP_LOOT_翅膀|r
.complete 2973,1 
.mob Sprite Darter
step
#loop
.goto Feralas,69.05,55.78,0
.goto Feralas,68.60,54.25,0
.goto Feralas,71.51,55.98,0
.goto Feralas,72.42,56.63,0
.goto Feralas,73.21,56.25,0
.goto Feralas,69.05,55.78,50,0
.goto Feralas,68.60,54.25,50,0
.goto Feralas,71.51,55.98,50,0
.goto Feralas,72.42,56.63,50,0
.goto Feralas,73.21,56.25,50,0
.goto Feralas,72.42,56.63,50,0
.goto Feralas,71.51,55.98,50,0
.goto Feralas,68.60,54.25,50,0
>>在规定时间内击杀木爪突击队员
>>|cRXP_WARN_每个营地通常都会有一个|r
>>|cRXP_WARN_这是一个限时任务(1小时). 如果失败, 请重新接受任务|r
.complete 2863,1 
.unitscan Woodpaw Alpha
step
#completewith KruegTurnin1
.hs >>传送至莫沙彻营地
.use 6948
.cooldown item,6948,>0
step
#completewith KruegTurnin1
.goto Feralas,74.73,43.59,150 >>返回莫哈切营地
.cooldown item,6948,<0
step
.goto Feralas,76.06,43.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布隆克|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Bronk
step
#label KruegTurnin1
.goto Feralas,76.00,42.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁伊格·碎颅|r交谈
.turnin 2973 >>交任务: |cRXP_FRIENDLY_新斗篷的光辉|r
.accept 2974 >>接任务: |cRXP_LOOT_可怕的发现|r
.target Krueg Skullsplitter
step
.goto Feralas,74.90,42.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hadoken|r交谈
.turnin 2863 >>交任务: |cRXP_FRIENDLY_突然袭击|r
.accept 2902 >>接任务: |cRXP_LOOT_调查木爪岭|r
.target Hadoken Swiftstrider
step
#loop
.goto Feralas,66.63,46.62,0
.goto Feralas,69.92,38.97,60,0
.goto Feralas,68.71,39.90,60,0
.goto Feralas,68.08,46.12,60,0
.goto Feralas,66.63,46.62,60,0
.goto Feralas,69.92,38.97,60,0
>>击杀|cRXP_ENEMY_Grimtotem 牛头人|r. 击杀后搜刮他们的|cRXP_LOOT_Horns|r
>>|cRXP_ENEMY_恐怖图腾袭击者|r|cRXP_WARN_施放|r|T132149:0|t[网]|cRXP_WARN_使目标无法移动10秒|r
.complete 2974,1 
.mob Grimtotem Shaman
.mob Grimtotem Raider
.mob Grimtotem Naturalist
step
.goto Feralas,71.60,55.90
>>点击位于木箱顶部的|cRXP_PICK_木爪作战地图|r
.turnin 2902 >>交任务: |cRXP_FRIENDLY_调查木爪岭|r
.accept 2903 >>接任务: |cRXP_LOOT_作战计划|r
step
.goto Feralas,76.00,42.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁伊格·碎颅|r交谈
.turnin 2974 >>交任务: |cRXP_FRIENDLY_可怕的发现|r
.accept 2976 >>接任务: |cRXP_LOOT_可怕的发现|r
.target Krueg Skullsplitter
step
.goto Feralas,74.90,42.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hadoken|r交谈
.turnin 2903 >>交任务: |cRXP_FRIENDLY_作战计划|r
.accept 7730 >>接任务: |cRXP_LOOT_祖卡什的入侵|r
.accept 7731 >>接任务: |cRXP_LOOT_毒刺鞭笞者|r
.target Hadoken Swiftstrider
step << Hunter
.goto Feralas,74.94,45.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡温德|r交谈
>>|cRXP_BUY_从他那里购买|r|T135661:0|t[锯齿箭]|r
.collect 11285,2600,7731,1 
.target Cawind Trueaim
step
#optional
#completewith egghypo
.destroy 9460 >>摧毁: |cRXP_ENEMY_恐怖图腾之角|r
step
#completewith next
.goto Feralas,73.38,62.94,0
>>击杀|cRXP_ENEMY_Zukk'ash Silithid|r. 掠夺其|cRXP_LOOT_Carapace|r
.complete 7730,1 
.mob Zukk'ash Worker
.mob Zukk'ash Wasp
.mob Zukk'ash Tunneler
.mob Zukk'ash Stinger
step
#loop
.goto Feralas,73.38,63.24,0
.goto Feralas,76.36,61.19,0
.goto Feralas,73.38,63.24,50,0
.goto Feralas,76.36,61.19,50,0
>>击杀|cRXP_ENEMY_毒刺鞭笞者|r. 击杀后拾取其|cRXP_LOOT_腺体|r
>>|cRXP_WARN_这个怪物可能很难对付, 确保准备好冷却技能|r
>>|cRXP_WARN_它在丝莉希德蜂巢内外巡逻|r
.complete 7731,1 
.unitscan Stinglasher
step
#loop
.goto Feralas,73.38,63.24,0
.goto Feralas,76.36,61.19,0
.goto Feralas,73.38,63.24,50,0
.goto Feralas,76.36,61.19,50,0
>>击杀|cRXP_ENEMY_Zukk'ash Silithid|r. 掠夺其|cRXP_LOOT_Carapace|r
.complete 7730,1 
.mob Zukk'ash Worker
.mob Zukk'ash Wasp
.mob Zukk'ash Tunneler
.mob Zukk'ash Stinger
step
#completewith egghypo
.goto Feralas,56.15,46.88,0
.use 10699 >>击杀|cRXP_ENEMY_山谷尖啸者|r
>>|cRXP_WARN_使用|r|T135474:0|t[耶金尼亚的荆棘] |cRXP_WARN_在他们的尸体上. 与出现的|r|cRXP_FRIENDLY_尖啸者的灵魂|r|cRXP_WARN_交谈|r
.complete 3520,1 
.unitscan Rogue Vale Screecher
.unitscan Vale Screecher
.target Screecher Spirit
step
#completewith next
.goto Feralas,58.59,69.85,0
>>击杀|cRXP_ENEMY_戈杜尼大法师|r. 从他们身上搜刮|cRXP_LOOT_圆球|r
.complete 2979,1 
.mob Gordunni Mage-Lord
step
.goto Feralas,59.72,62.77,0
.goto Feralas,61.86,54.46,60,0
.goto Feralas,61.03,56.55,60,0
.goto Feralas,60.69,58.52,60,0
#loop
.goto Feralas,59.72,62.77,60,0
.goto Feralas,58.93,64.13,60,0
.goto Feralas,58.31,65.20,60,0
.goto Feralas,58.25,66.56,60,0
.goto Feralas,58.55,67.75,60,0
.goto Feralas,59.54,68.37,60,0
.goto Feralas,60.85,69.68,60,0
.goto Feralas,60.95,67.65,60,0
.goto Feralas,60.35,66.63,60,0
.goto Feralas,60.11,64.93,60,0
.goto Feralas,59.58,64.51,60,0
>>击杀|cRXP_ENEMY_戈杜尼虐待者|r和|cRXP_ENEMY_术士|r和|cRXP_ENEMY_巫师|r
>>|cRXP_WARN_击杀你看到的每一个|r|cRXP_ENEMY_萨满祭司|r|cRXP_WARN_, 因为他们刷新数量有限|r
.complete 2980,1 
.mob +Gordunni Shaman
.complete 2980,2 
.mob +Gordunni Warlock
.complete 2980,3 
.mob +Gordunni Mauler
step
#loop
.goto Feralas,60.95,67.65,0
.goto Feralas,59.72,62.77,60,0
.goto Feralas,58.93,64.13,60,0
.goto Feralas,58.31,65.20,60,0
.goto Feralas,58.25,66.56,60,0
.goto Feralas,58.55,67.75,60,0
.goto Feralas,59.54,68.37,60,0
.goto Feralas,60.85,69.68,60,0
.goto Feralas,60.95,67.65,60,0
.goto Feralas,60.35,66.63,60,0
.goto Feralas,60.11,64.93,60,0
.goto Feralas,59.58,64.51,60,0
>>击杀|cRXP_ENEMY_戈杜尼大法师|r. 从他们身上搜刮|cRXP_LOOT_圆球|r
.complete 2979,1 
.mob Gordunni Mage-Lord
step
#ssf
#completewith next
>>击杀|cRXP_ENEMY_Frayfeather 乱羽角鹰兽|r. 从它们身上获取|cRXP_LOOT_羽毛|r
>>|cRXP_LOOT_羽毛|r |cRXP_WARN_仅由|r |cRXP_ENEMY_角鹰兽|r |cRXP_WARN_掉落. |r |cRXP_ENEMY_鹿翼兽|r |cRXP_WARN_和|r |cRXP_ENEMY_风暴之翼|r |cRXP_WARN_不会掉落它们|r
.collect 4589,10,7842,1 
.mob Frayfeather Hippogryph
step
#ah
#completewith next
>>击杀|cRXP_ENEMY_Frayfeather 乱羽角鹰兽|r. 从它们身上获取|cRXP_LOOT_羽毛|r
>>|cRXP_WARN_你也可以从拍卖行购买这些|r
>>|cRXP_LOOT_羽毛|r |cRXP_WARN_仅由|r |cRXP_ENEMY_角鹰兽|r |cRXP_WARN_掉落. |r |cRXP_ENEMY_鹿翼兽|r |cRXP_WARN_和|r |cRXP_ENEMY_风暴之翼|r |cRXP_WARN_不会掉落它们|r
.collect 4589,10,7842,1 
.mob Frayfeather Hippogryph
step
#label egghypo
.goto Feralas,56.66,75.89
>>从角鹰兽巢穴中拾取 |T132833:0|t[|cRXP_LOOT_角鹰兽的蛋|r]
>>|cRXP_WARN_南部山区有多个巢穴|r
.collect 8564,1 
step
#completewith next
.use 10699 >>击杀|cRXP_ENEMY_山谷尖啸者|r
>>|cRXP_WARN_使用|r|T135474:0|t[耶金尼亚的荆棘] |cRXP_WARN_在他们的尸体上. 与出现的|r|cRXP_FRIENDLY_尖啸者的灵魂|r|cRXP_WARN_交谈|r
.complete 3520,1 
.unitscan Rogue Vale Screecher
.unitscan Vale Screecher
.target Screecher Spirit
step
#ssf
#loop
.goto Feralas,56.71,64.09,0
.goto Feralas,56.71,64.09,60,0
.goto Feralas,56.61,62.01,60,0
.goto Feralas,55.87,60.34,60,0
.goto Feralas,54.79,60.44,60,0
.goto Feralas,55.30,62.17,60,0
.goto Feralas,54.49,64.33,60,0
.goto Feralas,55.23,66.21,60,0
.goto Feralas,55.88,65.91,60,0
>>击杀|cRXP_ENEMY_Frayfeather 乱羽角鹰兽|r. 从它们身上获取|cRXP_LOOT_羽毛|r
>>|cRXP_LOOT_羽毛|r |cRXP_WARN_仅由|r |cRXP_ENEMY_角鹰兽|r |cRXP_WARN_掉落. |r |cRXP_ENEMY_鹿翼兽|r |cRXP_WARN_和|r |cRXP_ENEMY_风暴之翼|r |cRXP_WARN_不会掉落它们|r
.collect 4589,10,7842,1 
.mob Frayfeather Hippogryph
step
#ah
#loop
.goto Feralas,56.71,64.09,0
.goto Feralas,56.71,64.09,60,0
.goto Feralas,56.61,62.01,60,0
.goto Feralas,55.87,60.34,60,0
.goto Feralas,54.79,60.44,60,0
.goto Feralas,55.30,62.17,60,0
.goto Feralas,54.49,64.33,60,0
.goto Feralas,55.23,66.21,60,0
.goto Feralas,55.88,65.91,60,0
>>击杀|cRXP_ENEMY_Frayfeather 乱羽角鹰兽|r. 从它们身上获取|cRXP_LOOT_羽毛|r
>>|cRXP_WARN_你也可以从拍卖行购买这些|r
>>|cRXP_LOOT_羽毛|r |cRXP_WARN_仅由|r |cRXP_ENEMY_角鹰兽|r |cRXP_WARN_掉落. |r |cRXP_ENEMY_鹿翼兽|r |cRXP_WARN_和|r |cRXP_ENEMY_风暴之翼|r |cRXP_WARN_不会掉落它们|r
.collect 4589,10,7842,1 
.mob Frayfeather Hippogryph
step
#loop
.goto Feralas,58.39,51.88,0
.goto Feralas,57.54,48.70,0
.goto Feralas,55.74,46.71,0
.goto Feralas,58.45,55.83,0
.goto Feralas,58.39,51.88,80,0
.goto Feralas,57.54,48.70,80,0
.goto Feralas,55.74,46.71,80,0
.goto Feralas,58.45,55.83,80,0
.goto Feralas,56.70,56.13,80,0
.use 10699 >>击杀|cRXP_ENEMY_山谷尖啸者|r
>>|cRXP_WARN_使用|r|T135474:0|t[耶金尼亚的荆棘] |cRXP_WARN_在他们的尸体上. 与出现的|r|cRXP_FRIENDLY_尖啸者的灵魂|r|cRXP_WARN_交谈|r
.complete 3520,1 
.unitscan Rogue Vale Screecher
.unitscan Vale Screecher
.target Screecher Spirit
step
#label YetiHide
#loop
.goto Feralas,52.05,58.40,0
.goto Feralas,55.14,56.35,70,0
.goto Feralas,53.12,56.27,70,0
.goto Feralas,52.05,58.40,70,0
>>击杀|cRXP_ENEMY_Yetis|r. 击杀后搜刮其|cRXP_LOOT_Hides|r
.complete 2822,1 
.mob Feral Scar Yeti
.mob Enraged Feral Scar
.mob Hulking Feral Scar
.mob Lurking Feral Scar
.mob Bloodroar the Stalker
step
.accept 2766 >>接任务: |cRXP_LOOT_寻找OOX-22/FE！|r
.itemcount 8705,1 
.use 8705
step
.goto Feralas,53.35,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_自动导航机器人OOX-22/FE|r交谈
.turnin 2766 >>交任务: |cRXP_FRIENDLY_寻找OOX-22/FE！|r
.target Homing Robot OOX-22/FE
.isOnQuest 2766
step
.goto Feralas,53.35,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_自动导航机器人OOX-22/FE|r交谈
.accept 2767,1 >>接任务: |cRXP_LOOT_拯救OOX-22/FE！|r
>>|cRXP_WARN_这将开启小鸡护送任务；请准备好使用技能冷却和消耗品, 因为这个任务很难|r

.target Homing Robot OOX-22/FE
.isQuestTurnedIn 2766
step
.goto Feralas,55.47,56.37,30,0
.goto Feralas,54.38,51.32,60,0
.goto Feralas,50.31,49.91,40,0
.goto Feralas,48.38,44.83,40,0
.goto Feralas,45.04,43.27
>>护送|cRXP_FRIENDLY_自动导航机器人 OOX-22/FE|r至岸边
>>|cRXP_WARN_途中将刷新3波怪物. 请将所有长时间冷却技能保留给|r|cRXP_ENEMY_Gnolls|r|cRXP_WARN_, 并在|r|cRXP_ENEMY_Yetis上使用部分技能|r
+|cRXP_WARN_3 只雪人(等级46)|r
.disablecheckbox
+|cRXP_WARN_3只大猩猩(等级43)|r
.disablecheckbox
+|cRXP_WARN_4 只豺狼人(等级 41-43)|r
.disablecheckbox
.complete 2767,1 
.isOnQuest 2767
.target Homing Robot OOX-22/FE
step
#completewith next
.hs >>返回莫沙彻营地
.use 6948
step
.goto Feralas,74.81,45.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格鲁尔|cRXP_FRIENDLY_旅店老板格鲁尔|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
>>|cRXP_WARN_请确保不要出售任何|r|T135992:0|t[细长的狮鹫羽毛]
.target Innkeeper Greul
step << Hunter
.goto Feralas,74.94,45.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡温德|r交谈
>>|cRXP_BUY_从他那里购买|r|T135661:0|t[锯齿箭]|r
.collect 11285,2600,3002,1 
.target Cawind Trueaim
step
#completewith MorePotions
.line Feralas,75.99,42.85,76.49,43.22,75.53,43.68,74.38,44.01,73.56,46.53,73.52,45.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗克|r交谈
>>|cRXP_WARN_她巡逻莫沙彻营地的道路|r
.turnin 2980 >>交任务: |cRXP_FRIENDLY_菲拉斯的食人魔|r
.turnin 2979 >>交任务: |cRXP_FRIENDLY_黑暗仪式|r
.accept 3002 >>接任务: |cRXP_LOOT_戈杜尼宝珠|r
.target Rok Orhan
step
.goto Feralas,74.90,42.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hadoken|r交谈
.turnin 7730 >>交任务: |cRXP_FRIENDLY_祖卡什的入侵|r
.turnin 7731 >>交任务: |cRXP_FRIENDLY_毒刺鞭笞者|r
.accept 7732 >>接任务: |cRXP_LOOT_祖卡什报告|r
.target Hadoken Swiftstrider
step
.goto Feralas,74.40,43.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Uzer'i|r交谈
.accept 3121 >>接任务: |cRXP_LOOT_奇怪的要求|r
.target Witch Doctor Uzer'i
step
.goto Feralas,74.40,42.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杉多尔·迅蹄|r交谈
.turnin 2822 >>交任务: |cRXP_FRIENDLY_质量的保证|r
.target Jangdor Swiftstrider
step
#label MorePotions
.goto Feralas,76.06,43.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布隆克|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Bronk
step
#loop
.line Feralas,75.99,42.85,76.49,43.22,75.53,43.68,74.38,44.01,73.56,46.53,73.52,45.13
.goto Feralas,73.56,46.53,20,0
.goto Feralas,73.71,46.03,20,0
.goto Feralas,75.99,42.85,20,0
.goto Feralas,76.49,43.22,20,0
.goto Feralas,75.53,43.68,20,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗克|r交谈
>>|cRXP_WARN_她巡逻莫沙彻营地的道路|r
.turnin 2980 >>交任务: |cRXP_FRIENDLY_菲拉斯的食人魔|r
.turnin 2979 >>交任务: |cRXP_FRIENDLY_黑暗仪式|r
.accept 3002 >>接任务: |cRXP_LOOT_戈杜尼宝珠|r
.target Rok Orhan
step << Druid
.goto Feralas,76.0,42.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jannos|r交谈
.train 1824 >>训练你的职业法术
.target Jannos Lighthoof
.xp <44,1
.xp >46,1
step << Druid
#optional
.goto Feralas,76.0,42.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jannos|r交谈
.train 9821 >>训练你的职业法术
.target Jannos Lighthoof
.xp <46,1
step << !Mage
.goto Feralas,75.45,44.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏恩|r交谈
.fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
.target Shyn
.zoneskip Thunder Bluff
step << Mage
.cast 3566 >>施放 |T135765:0|t[传送:雷霆崖]
.zoneskip Thunder Bluff
step
.goto Thunder Bluff,34.42,46.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sage|r交谈
.turnin 2280 >>交任务: |cRXP_FRIENDLY_白金圆盘|r
.accept 2440 >>接任务: |cRXP_WARN_白金圆盘|r
.target Sage Truthseeker
.isQuestTurnedIn 2278
.dungeon ULDA
step
.goto Thunder Bluff,46.61,33.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_本娜·冰蹄|r交谈
.turnin 2440 >>交任务: |cRXP_FRIENDLY_白金圆盘|r
.target Bena Winterhoof
.isQuestTurnedIn 2278
.dungeon ULDA
step
.goto Thunder Bluff,34.42,46.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sage|r交谈
.accept 2965 >>接任务: |cRXP_WARN_奥丹姆的线索|r
.target Sage Truthseeker
.isQuestTurnedIn 2278
.dungeon ULDA
.xp <45,1
step
.goto Thunder Bluff,75.67,31.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与纳拉(|cRXP_FRIENDLY_Nara|r)交谈
.turnin 2965 >>交任务: |cRXP_FRIENDLY_奥丹姆的线索|r
.accept 2966 >>接任务: |cRXP_WARN_拭目以待|r
.target Nara Wildmane
.isOnQuest 2965
.dungeon ULDA
step
#optional
.goto Thunder Bluff,75.67,31.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与纳拉(|cRXP_FRIENDLY_Nara|r)交谈
.accept 2966 >>接任务: |cRXP_WARN_拭目以待|r
.target Nara Wildmane
.isQuestTurnedIn 2965
.dungeon ULDA
step
.goto Thunder Bluff,61.50,80.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Melor|r交谈
.turnin 1205 >>交任务: |cRXP_FRIENDLY_死沼巨鳄|r
.target Melor Stonehoof
.isQuestComplete 1205
step << !Mage
#completewith STVZepp2
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Orgrimmar >>飞往奥格瑞玛
.target Tal
step << Mage
#completewith STVZepp2
.cast 3567 >>施放 |T135759:0|t[传送:奥格瑞玛]
.zoneskip Orgrimmar
step
.goto Orgrimmar,39.20,86.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Uthel'nay|r交谈
.turnin 3002 >>交任务: |cRXP_FRIENDLY_戈杜尼宝珠|r
.target Uthel'nay
step << Mage
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 10185 >>训练你的职业法术
.target Pephredo
.xp <44,1
.xp >46,1
step << Mage
#optional
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 10197 >>训练你的职业法术
.target Pephredo
.xp <46,1
step << Priest
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 10927 >>训练你的职业法术
.target Ur'kyo
.xp <44,1
.xp >46,1
step << Priest
#optional
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 10945 >>训练你的职业法术
.target Ur'kyo
.xp <46,1
step
.goto Orgrimmar,39.00,38.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zor|r交谈
.turnin 1262 >>交任务: |cRXP_FRIENDLY_向佐尔报告|r
.target Zor Lonetree
.isOnQuest 1262
step
.goto Orgrimmar,39.00,38.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zor|r交谈
.accept 7541 >>接任务: |cRXP_WARN_为部落效力|r
.turnin 7541 >>交任务: |cRXP_FRIENDLY_为部落效力|r
.target Zor Lonetree
.isQuestTurnedIn 1262
step << Shaman
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 16315 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <44,1
.xp >46,1
step << Shaman
#optional
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 10472 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <46,1
step
.goto Orgrimmar,59.4,36.8
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德兰·杜佛斯|r交谈
.accept 2283 >>接任务: |cRXP_LOOT_搜寻项链|r
.turnin 2283 >>交任务: |cRXP_FRIENDLY_搜寻项链|r
.target Dran Droffers
.itemcount 7666,1
step
.goto Orgrimmar,56.50,46.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zilzibin|r交谈
>>|cRXP_WARN_他位于龙脊山的上层|r
.turnin 7732 >>交任务: |cRXP_FRIENDLY_祖卡什报告|r
.target Zilzibin Drumlore
step
.goto Orgrimmar,75.20,34.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔戈洛姆|r交谈
.turnin 2976 >>交任务: |cRXP_FRIENDLY_可怕的发现|r
.target Belgrom Rockmaul
step << Hunter
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14285 >>训练你的职业法术
.target Ormak Grimshot
.xp <44,1
.xp >46,1
step << Hunter
#optional
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14304 >>训练你的职业法术
.target Ormak Grimshot
.xp <46,1
step << Warrior
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 11584 >>训练你的职业法术
.target Grezz Ragefist
.xp <44,1
.xp >46,1
step << Warrior
#optional
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 11578 >>训练你的职业法术
.target Grezz Ragefist
.xp <46,1
step << Orc !Warlock
#optional
.goto Orgrimmar,69.40,13.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔达|r和|cRXP_FRIENDLY_奥古纳罗|r交谈
.train 825 >>驯兽 |T136103:0|t[狼骑术]
.vendor >>|cRXP_BUY_购买|r|T132224:0|t[|cFF0070FF狼|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Kildar
.target Ogunaro Wolfrunner
step << Hunter
.goto Orgrimmar,78.11,38.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Jin'sora交谈|r
.vendor >>|cRXP_BUY_购买|r|T135489:0|t[|cRXP_FRIENDLY_大型长弓|r]|cRXP_BUY_如果可用|r
.target Jin'sora
.money <6.7952
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<21.9
.itemcount 11307,<1
step
.goto Orgrimmar,49.60,50.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Neeru|r交谈
.turnin 3121 >>交任务: |cRXP_FRIENDLY_奇怪的要求|r
.accept 3122 >>接任务: |cRXP_LOOT_向巫医尤克里回复|r
.target Neeru Fireblade
step << Rogue
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 11341 >>训练你的职业法术
.target Ormok
.xp <44,1
.xp >46,1
step << Rogue
#optional
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 11293 >>训练你的职业法术
.target Ormok
.xp <46,1
step << Rogue
.goto Orgrimmar,42.10,49.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔交谈|r
.vendor >>|cRXP_BUY_储备闪光粉和毒药|r
.target Rekkul
step << Warlock
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 11671 >>训练你的职业法术
.target Mirket
.xp <44,1
.xp >46,1
step << Warlock
#optional
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 11699 >>训练你的职业法术
.target Mirket
.xp <46,1
step << Warlock
.goto Orgrimmar,47.52,46.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈
.vendor >>购买任何你负担得起的宠物升级道具
.target Kurgul
step
.goto Orgrimmar,49.58,69.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁斯|r交谈
.bankdeposit 10699,5862,9628,8564 >>将以下物品存入您的银行:
>>|T135474:0|t[耶基尼亚的荆棘] 
>>|T132385:0|t[爆盐增压器] 
>>|T133645:0|t[尼尔鲁的草药袋] 
>>|T132833:0|t[角鹰兽的蛋] 
step
#ah
#completewith STVZepp2
+|cRXP_WARN_检查你的银行是否有任何缺失|r|T134332:0|t[荆棘谷的青山 - 页面]|cRXP_WARN_并从拍卖行购买你仍需要的物品|r
>>|cRXP_WARN_第一章需要:第1和4和6和8页|r
>>|cRXP_WARN_第二章需要:第10和11和14和16页|r
>>|cRXP_WARN_第3章要求:第18和20和21和24页|r
>>|cRXP_WARN_第4章要求:第25和26和27页|r
>>|cRXP_WARN_将任何新购买的页面放入你的银行. 如果你无法获得它们, 请跳过此步骤|r
.group
step
#ah
.goto Orgrimmar,55.59,62.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师萨苏恩|r交谈
.collect 2799,10,349,1 >>|cRXP_BUY_从拍卖行购买十|r|T134298:0|t[猩猩牙] |r
.target Auctioneer Thathung
.group
step << Troll
#optional
#completewith next
.subzone 367 >>前往森金村
.xp <40,1
.money <90
.skill riding,75,1
step << Troll
#optional
.goto Durotar,55.28,75.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xar'Ti|r和|cRXP_FRIENDLY_祖尼尔|r交谈
.train 10861 >>训练 |T136103:0|t[迅猛龙骑术]
.vendor >>|cRXP_BUY_购买|r|T132253:0|t[|cFF0070FF迅猛龙|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Xar'Ti
.target Zjolnir
step
#completewith next
.zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
.zoneskip Durotar
step
#label STVZepp2
.goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
.zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
.zoneskip Stranglethorn Vale
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 46-47 南荆棘谷
#displayname 46-47 南荆棘谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 40-50
#next 47-48 悲伤沼泽
step
.goto Stranglethorn Vale,32.20,27.60
>>点击|cRXP_PICK_冒泡大锅|r
.accept 586 >>接任务: |cRXP_LOOT_甘祖拉恩|r
step
.goto Stranglethorn Vale,32.10,29.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知莫克塔尔丁|r交谈
.accept 571 >>接任务: |cRXP_LOOT_摩克萨尔丁的魔法|r
.target Far Seer Mok'thardin
step
.goto Stranglethorn Vale,28.80,44.80
>>击杀|cRXP_ENEMY_泰希斯|r. 击败后搜刮他的|cRXP_LOOT_爪牙|r
>>他巡逻于迅猛龙区域周围
.complete 197,1 
.unitscan Tethis
.group 2
step
#completewith Anathek
>>击杀|cRXP_ENEMY_劈颅猎人|r和|cRXP_ENEMY_狂暴者|r和|cRXP_ENEMY_猎头者|r
.complete 586,1 
.mob +Skullsplitter Hunter
.complete 586,3 
.mob +Skullsplitter Berserker
.complete 586,2 
.mob +Skullsplitter Headhunter
step
#completewith next
+|cRXP_WARN_下一个任务可能相当困难, 务必格外小心|r
step
#label Anathek
.goto Stranglethorn Vale,44.3,44.9,30,0
#loop
.line Stranglethorn Vale,47.1,40.7,44.3,44.9,45.8,41.2,47.1,40.7
.goto Stranglethorn Vale,47.10,40.70,50,0
.goto Stranglethorn Vale,44.30,44.90,50,0
.goto Stranglethorn Vale,45.80,41.20,50,0
.goto Stranglethorn Vale,47.10,40.70,50,0
>>击杀|cRXP_ENEMY_Ana'thek the Cruel|r. 从他身上搜刮|cRXP_LOOT_Armor|r
*|cRXP_WARN_Be careful of Ana'thek's adds and his|r |cFFEB144Cexecute ability.|r
.complete 586,4 
.unitscan Ana'thek the Cruel
step
#loop
.goto Stranglethorn Vale,47.90,42.90,0
.goto Stranglethorn Vale,47.90,42.90,50,0
.goto Stranglethorn Vale,47.60,44.10,50,0
.goto Stranglethorn Vale,46.00,42.80,50,0
.goto Stranglethorn Vale,44.40,41.90,50,0
.goto Stranglethorn Vale,47.40,39.80,50,0
>>击杀|cRXP_ENEMY_劈颅猎人|r和|cRXP_ENEMY_狂暴者|r和|cRXP_ENEMY_猎头者|r
.complete 586,1 
.mob +Skullsplitter Hunter
.complete 586,3 
.mob +Skullsplitter Berserker
.complete 586,2 
.mob +Skullsplitter Headhunter
step
#loop
.goto Stranglethorn Vale,47.2,28.0,0
.goto Stranglethorn Vale,49.8,24.6,0
.goto Stranglethorn Vale,48.4,19.2,0
.goto Stranglethorn Vale,47.26,28.58,50,0
.goto Stranglethorn Vale,49.61,23.98,50,0
.goto Stranglethorn Vale,48.95,19.87,50,0
.goto Stranglethorn Vale,47.26,23.98,50,0
>>击杀|cRXP_ENEMY_Bhag'thera|r. 击败他后搜刮其掉落的|cRXP_LOOT_利牙|r
>>|cRXP_ENEMY_Bhag'thera|r|cRXP_WARN_可在莫什奥格食人魔冢以北或以西生成|r
>>|cRXP_WARN_在与|r|cRXP_ENEMY_Bhag'thera|r|cRXP_WARN_交战前, 请先清除|r|cRXP_ENEMY_深喉猎豹|r|cRXP_WARN_区域, 以避免刷新额外敌人|r
>>|cRXP_WARN_施放|r|T132172:0|t[鹰眼]|cRXP_WARN_尝试寻找|cRXP_ENEMY_巴格瑟拉|r|r << Hunter
>>|cRXP_WARN_施放|r|T136034:0|t[远视]|cRXP_WARN_尝试定位|cRXP_ENEMY_巴格瑟拉|r|r << Shaman
.complete 193,1 
.mob Shadowmaw Panther
.unitscan Bhag'thera
.group 2
step
#completewith next
.subzone 100 >>前往内辛瓦里的远征队
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_S. J. Erlgadin|r和|cRXP_FRIENDLY_Hemet|r交谈
.turnin 193 >>交任务: |cRXP_FRIENDLY_猎豹|r
.target +Sir S. J. Erlgadin
.goto Stranglethorn Vale,35.55,10.55
.turnin 197 >>交任务: |cRXP_FRIENDLY_猎龙|r
.accept 208 >>接任务: |cRXP_LOOT_王牌猎人|r
.target +Hemet Nesingwary
.goto Stranglethorn Vale,35.66,10.81
.group
step
#completewith next
.subzone 117 >>前往格罗姆高基地
step
.goto Stranglethorn Vale,32.20,27.70
>>点击|cRXP_PICK_冒泡大锅|r
.turnin 586 >>交任务: |cRXP_FRIENDLY_甘祖拉恩|r
.accept 588 >>接任务: |cRXP_LOOT_耶尼库的命运|r
step
.goto Stranglethorn Vale,32.20,27.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kin'weelay|r交谈
.turnin 588 >>交任务: |cRXP_FRIENDLY_耶尼库的命运|r
.accept 589 >>接任务: |cRXP_LOOT_歌唱水晶|r
.target Kin'weelay
step
#completewith BBvisit2
.goto Stranglethorn Vale,32.5,29.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞斯塔|r交谈
.fly Booty Bay >>飞往藏宝海湾
.target Thysta
step
.goto Stranglethorn Vale,28.35,76.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Oglethorpe|r交谈
.turnin 2767 >>交任务: |cRXP_FRIENDLY_拯救OOX-22/FE！|r
.target Oglethorpe Obnoticus
.isQuestComplete 2767
step
.goto Stranglethorn Vale,26.70,76.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海盗布劳兹|r交谈
.accept 617 >>接任务: |cRXP_LOOT_一捆海蛇草|r
.target Privateer Bloads
step
.goto Stranglethorn Vale,27.10,77.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crank|r交谈
.turnin 1118 >>交任务: |cRXP_FRIENDLY_返回藏宝海湾|r
.accept 621 >>接任务: |cRXP_LOOT_赞吉尔的秘密|r
.target Crank Fizzlebub
step
.goto Stranglethorn Vale,27.70,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“海狼”马克基雷|r交谈
.accept 606 >>接任务: |cRXP_LOOT_吓唬病鬼|r
.target "Sea Wolf" MacKinley
step
.goto Stranglethorn Vale,28.10,76.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大副克拉兹|r交谈
.accept 595 >>接任务: |cRXP_LOOT_血帆海盗|r
.target First Mate Crazz
step
.goto Stranglethorn Vale,27.27,69.51
>>点击营地中心桶顶上的|r血帆海盗的信件|cRXP_PICK_Bloodsail Correspondence|r
.turnin 595 >>交任务: |cRXP_FRIENDLY_血帆海盗|r
.accept 597 >>接任务: |cRXP_LOOT_血帆海盗|r
step
.goto Stranglethorn Vale,28.09,76.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大副克拉兹|r交谈
.turnin 597 >>交任务: |cRXP_FRIENDLY_血帆海盗|r
.accept 599 >>接任务: |cRXP_LOOT_血帆海盗|r
.target First Mate Crazz
step
.goto Stranglethorn Vale,26.92,77.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪格|r交谈
.accept 587 >>接任务: |cRXP_LOOT_鼻烟|r
.target Deeg
step
.goto Stranglethorn Vale,27.17,77.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_舰队指挥官卡拉·海角|r交谈
.turnin 599 >>交任务: |cRXP_FRIENDLY_血帆海盗|r
.accept 604 >>接任务: |cRXP_LOOT_血帆海盗|r
.target Fleet Master Seahorn
step
.goto Stranglethorn Vale,28.59,75.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_独眼迪兹|r交谈
.accept 576 >>接任务: |cRXP_LOOT_海盗的眼睛|r
.target Dizzy One-Eye
step
#optional
#label BBvisit2
step
#completewith Swashbucklers
>>击杀|cRXP_ENEMY_血帆海盗|r. 击杀后搜刮出|cRXP_LOOT_迷幻之眼|r
>>|cRXP_WARN_不要关注这个, 稍后再完成它|r
.complete 576,1 
step
#completewith next
>>击杀|cRXP_ENEMY_血帆流氓|r
.complete 604,1 
.mob Bloodsail Swashbuckler
step
#loop
.goto Stranglethorn Vale,26.94,82.49,0
.goto Stranglethorn Vale,29.61,80.89,0
.goto Stranglethorn Vale,27.75,83.13,0
.goto Stranglethorn Vale,29.61,80.89,20,0
.goto Stranglethorn Vale,27.75,83.13,20,0
.goto Stranglethorn Vale,27.18,82.66,20,0
.goto Stranglethorn Vale,26.94,82.49,20,0
>>掠夺|cRXP_LOOT_血帆计划书|r 和 |cRXP_LOOT_血帆海图|r
>>|cRXP_WARN_他们通常位于半岛上的大型营地, 或在靠近该营地的船只上|r
.complete 604,2 
.complete 604,3 
step
#label Swashbucklers
#loop
.goto Stranglethorn Vale,27.18,82.79,0
.goto Stranglethorn Vale,32.02,79.47,60,0
.goto Stranglethorn Vale,29.83,81.11,60,0
.goto Stranglethorn Vale,27.18,82.79,60,0
>>击杀|cRXP_ENEMY_血帆流氓|r
.complete 604,1 
.mob Bloodsail Swashbuckler
step
#loop
.goto Stranglethorn Vale,31.27,65.53,0
.goto Stranglethorn Vale,31.19,68.29,60,0
.goto Stranglethorn Vale,32.92,65.99,60,0
.goto Stranglethorn Vale,33.74,63.40,60,0
.goto Stranglethorn Vale,32.73,61.44,60,0
.goto Stranglethorn Vale,31.12,59.80,60,0
.goto Stranglethorn Vale,31.27,65.53,60,0
>>击杀|cRXP_ENEMY_老迈的迷雾谷猩猩|r. 击败它们获取|cRXP_LOOT_Giblets|r和|cRXP_LOOT_Sinew|r
>>|cRXP_WARN_拾取任何|r|T134298:0|t[|cRXP_LOOT_猩猩牙|r]|cRXP_WARN_你已拾取. 稍后完成另一个任务时, 你将需要用到它们|r
.complete 606,1 
.complete 571,1 
.mob Elder Mistvale Gorilla
.group
step
#loop
.goto Stranglethorn Vale,31.27,65.53,0
.goto Stranglethorn Vale,31.19,68.29,60,0
.goto Stranglethorn Vale,32.92,65.99,60,0
.goto Stranglethorn Vale,33.74,63.40,60,0
.goto Stranglethorn Vale,32.73,61.44,60,0
.goto Stranglethorn Vale,31.12,59.80,60,0
.goto Stranglethorn Vale,31.27,65.53,60,0
>>击杀|cRXP_ENEMY_老迈的迷雾谷猩猩|r. 击败它们获取|cRXP_LOOT_Giblets|r和|cRXP_LOOT_Sinew|r
.complete 606,1 
.complete 571,1 
.mob Elder Mistvale Gorilla
.solo
step
#optional
.goto Stranglethorn Vale,28.60,75.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_独眼迪兹|r交谈
.turnin 576 >>交任务: |cRXP_FRIENDLY_海盗的眼睛|r
.target Dizzy One-Eye
.isQuestComplete 576
step
.goto Stranglethorn Vale,26.90,73.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“病鬼”菲利普|r交谈
.turnin 606 >>交任务: |cRXP_FRIENDLY_吓唬病鬼|r
.accept 607 >>接任务: |cRXP_LOOT_向马克基雷回报|r
.target "Shaky" Phillipe
step
.goto Stranglethorn Vale,27.70,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“海狼”马克基雷|r交谈
.turnin 607 >>交任务: |cRXP_FRIENDLY_向马克基雷回报|r
.accept 609 >>接任务: |cRXP_LOOT_讨债行动|r
.target "Sea Wolf" MacKinley
step
.goto Stranglethorn Vale,27.20,77.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_舰队指挥官卡拉·海角|r交谈
.turnin 604 >>交任务: |cRXP_FRIENDLY_血帆海盗|r
.accept 608 >>接任务: |cRXP_LOOT_血帆海盗|r
.target Fleet Master Seahorn
.group
step
.goto Stranglethorn Vale,27.20,77.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_舰队指挥官卡拉·海角|r交谈
.turnin 604 >>交任务: |cRXP_FRIENDLY_血帆海盗|r
.target Fleet Master Seahorn
step
.goto Stranglethorn Vale,26.87,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格林戈|r交谈
.fly Grom'gol >>飞往格罗姆高营地
.target Gringer
.subzoneskip 35,1
step
.goto Stranglethorn Vale,32.10,29.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知莫克塔尔丁|r交谈
.turnin 571 >>交任务: |cRXP_FRIENDLY_摩克萨尔丁的魔法|r
.accept 573 >>接任务: |cRXP_LOOT_摩克萨尔丁的魔法|r
.target Far Seer Mok'thardin
step
.goto Stranglethorn Vale,38.18,35.60
>>击杀|cRXP_ENEMY_虎王邦加拉什|r. 从他身上搜刮出他的|cRXP_LOOT_头|r
>>|cRXP_WARN_这个任务很难. 他出现时会带2个怪物, 血量降至约50%时会再召唤2个|r
.complete 208,1 
.unitscan King Bangalash
.group 3
step
#completewith next
.goto Stranglethorn Vale,39.48,47.42,60,0
.goto Stranglethorn Vale,41.83,50.12,20,0
.subzone 310 >>进入晶脉矿井
step
#loop
.goto Stranglethorn Vale,43.84,47.77,0
.goto Stranglethorn Vale,42.69,49.05,20,0
.goto Stranglethorn Vale,43.84,47.77,20,0
>>击杀|cRXP_ENEMY_铁腭蜥蜴|r. 击杀后搜刮其掉落的|cRXP_LOOT_碎块|r
.complete 589,1 
.mob Ironjaw Basilisk
step
#completewith Chucky
>>击杀|cRXP_ENEMY_赞吉尔亡灵|r. 从他们身上搜刮|cRXP_LOOT_混合物|r`
>>|cRXP_WARN_请勿拉怪或攻击流亡者赞吉尔|r
.complete 621,1 
step
.goto Stranglethorn Vale,35.25,51.25
>>击杀|cRXP_ENEMY_Maury|r. 搜刮她的战利品|cRXP_LOOT_Clubbed Foot|r
.complete 609,1 
.unitscan Maury "Club Foot" Wilkins
step
.goto Stranglethorn Vale,34.92,51.84
>>击杀|cRXP_ENEMY_Jon-Jon|r. 击杀后搜刮他的|cRXP_LOOT_Spyglass|r
.complete 609,2 
.unitscan Jon-Jon the Crow
step
#label Chucky
.goto Stranglethorn Vale,40.00,58.24
>>击杀|cRXP_ENEMY_Chucky|r. 从他身上搜刮他的|cRXP_LOOT_Ring|r
.complete 609,3 
.unitscan Chucky "Ten Thumbs"
step
#loop
.goto Stranglethorn Vale,40.63,60.03,0
.goto Stranglethorn Vale,40.63,60.03,50,0
.goto Stranglethorn Vale,39.66,59.28,50,0
.goto Stranglethorn Vale,38.71,59.72,50,0
.goto Stranglethorn Vale,38.58,58.54,50,0
.goto Stranglethorn Vale,38.90,57.60,50,0
.goto Stranglethorn Vale,39.95,57.25,50,0
.goto Stranglethorn Vale,41.27,57.15,50,0
.goto Stranglethorn Vale,40.77,59.00,50,0
>>击杀|cRXP_ENEMY_赞吉尔亡灵|r. 从他们身上搜刮|cRXP_LOOT_混合物|r`
>>|cRXP_WARN_请勿拉怪或攻击流亡者赞吉尔|r
.complete 621,1 
.mob Zanzil Zombie
.mob Zanzil Hunter
.mob Zanzil Witch Doctor
.mob Zanzil Naga
step
#completewith next
>>击杀|cRXP_ENEMY_血帆海盗|r. 击杀后搜刮出|cRXP_LOOT_迷幻之眼|r
.complete 576,1 
.mob Bloodsail Swashbuckler
.mob Bloodsail Warlock
.isOnQuest 576
.solo
step
#loop
.goto Stranglethorn Vale,24.37,52.88,0
.goto Stranglethorn Vale,24.37,52.88,50,0
.goto Stranglethorn Vale,23.10,52.77,50,0
.goto Stranglethorn Vale,22.77,53.90,50,0
.goto Stranglethorn Vale,23.63,55.24,50,0
.goto Stranglethorn Vale,24.10,54.50,50,0
.goto Stranglethorn Vale,24.53,54.06,50,0
>>击杀|cRXP_ENEMY_血帆海盗|r. 击败他们后搜刮出|cRXP_LOOT_呼呼|r
.complete 587,1 
.mob Bloodsail Swashbuckler
.mob Bloodsail Warlock
.isOnQuest 587
.solo
step
#loop
.goto Stranglethorn Vale,24.37,52.88,0
.goto Stranglethorn Vale,24.37,52.88,50,0
.goto Stranglethorn Vale,23.10,52.77,50,0
.goto Stranglethorn Vale,22.77,53.90,50,0
.goto Stranglethorn Vale,23.63,55.24,50,0
.goto Stranglethorn Vale,24.10,54.50,50,0
.goto Stranglethorn Vale,24.53,54.06,50,0
>>击杀|cRXP_ENEMY_血帆海盗|r. 击杀后搜刮出|cRXP_LOOT_迷幻之眼|r
.complete 576,1 
.mob Bloodsail Swashbuckler
.mob Bloodsail Warlock
.isOnQuest 576
.solo
step
#completewith next
>>击杀|cRXP_ENEMY_纳迦探险者|r. 击败他们后搜刮出|cRXP_LOOT_海蛇草|r
.complete 573,1 
.complete 617,1 
.mob Naga Explorer
step
.goto Stranglethorn Vale,28.96,61.94
>>点击|cRXP_PICK_圣泉|r获取|cRXP_LOOT_圣泉之水|r
.collect 737,1,573,1 
step
#loop
.goto Stranglethorn Vale,28.00,63.12,0
.goto Stranglethorn Vale,28.00,63.12,50,0
.goto Stranglethorn Vale,28.15,64.42,50,0
.goto Stranglethorn Vale,25.55,63.11,50,0
.goto Stranglethorn Vale,25.07,63.73,50,0
.goto Stranglethorn Vale,24.61,64.59,50,0
.goto Stranglethorn Vale,24.02,63.74,50,0
.goto Stranglethorn Vale,24.15,62.14,50,0
.goto Stranglethorn Vale,24.49,61.33,50,0
.goto Stranglethorn Vale,24.73,59.87,50,0
.goto Stranglethorn Vale,25.21,59.03,50,0
.goto Stranglethorn Vale,25.92,59.52,50,0
.goto Stranglethorn Vale,26.95,59.14,50,0
.goto Stranglethorn Vale,27.00,61.39,50,0
>>击杀|cRXP_ENEMY_纳迦探险者|r. 从他们身上搜刮出|cRXP_LOOT_海蛇草|r
.complete 573,1 
.complete 617,1 
.mob Naga Explorer
step
.goto Stranglethorn Vale,28.60,75.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_独眼迪兹|r交谈
.turnin 576 >>交任务: |cRXP_FRIENDLY_海盗的眼睛|r
.target Dizzy One-Eye
.isQuestComplete 576
step
.goto Stranglethorn Vale,27.80,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“海狼”马克基雷|r交谈
.turnin 609 >>交任务: |cRXP_FRIENDLY_讨债行动|r
.target "Sea Wolf" MacKinley
step
.goto Stranglethorn Vale,27.80,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“海狼”马克基雷|r交谈
.accept 613 >>接任务: |cRXP_LOOT_玛雷的腿|r
.target "Sea Wolf" MacKinley
.group
step
.goto Stranglethorn Vale,26.70,76.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海盗布劳兹|r交谈
.turnin 617 >>交任务: |cRXP_FRIENDLY_一捆海蛇草|r
.target Privateer Bloads
step
.goto Stranglethorn Vale,27.11,77.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crank|r交谈
.turnin 621 >>交任务: |cRXP_FRIENDLY_赞吉尔的秘密|r
.target Crank Fizzlebub
step
.goto Stranglethorn Vale,27.13,77.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威士忌斯利姆|r交谈
.accept 580 >>接任务: |cRXP_LOOT_威士忌斯利姆的酒|r
.target Whiskey Slim
step
.goto Stranglethorn Vale,27.11,77.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crank|r交谈
.accept 1119 >>接任务: |cRXP_WARN_赞吉尔的药剂和蠢人酒|r
.target Crank Fizzlebub
.solo
step
.goto Stranglethorn Vale,27.00,77.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪格|r交谈
.turnin 587 >>交任务: |cRXP_FRIENDLY_鼻烟|r
.target Deeg
.isQuestComplete 587
step
#completewith next
.isOnQuest 1119
+|cRXP_WARN_请注意, 赞吉尔的药剂和蠢人酒任务均有2小时计时|r
.solo
step
.goto Stranglethorn Vale,27.70,76.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_芬|r交谈
.accept 348 >>接任务: |cRXP_LOOT_荆棘谷热疫|r
.target Fin Fizracket
.group
step
.goto Stranglethorn Vale,26.70,73.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海克拜瑞·斯莫特船长|r交谈
.accept 8551 >>接任务: |cRXP_LOOT_船长的箱子|r
.target Captain Hecklebury Smotts
.group
step
.goto Stranglethorn Vale,26.55,76.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_掘金者维兹尼克|r 交谈
.bankwithdraw 10699,5862,9628,8564 >>从您的银行提取以下物品:
>>|T135474:0|t[耶基尼亚的荆棘] 
>>|T132385:0|t[爆盐增压器] 
>>|T133645:0|t[尼尔鲁的草药袋] 
>>|T132833:0|t[角鹰兽的蛋] 
.target Viznik Goldgrubber
.solo
step
.goto Stranglethorn Vale,26.55,76.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_掘金者维兹尼克|r 交谈
.bankwithdraw 2725,2728,2735,2730,2742,2732,2748,2751,2734,2740,2749,2745,2738,2744,2750 >>从您的银行提取以下物品:
>>你所有的 |T134332:0|t[荆棘谷的青山页面] 
.target Viznik Goldgrubber
.group
step
.goto Stranglethorn Vale,26.87,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格林戈|r交谈
.fly Grom'gol >>飞往格罗姆高营地
.target Gringer
.subzoneskip 35,1
step
.goto Stranglethorn Vale,32.10,29.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知莫克塔尔丁|r交谈
.turnin 573 >>交任务: |cRXP_FRIENDLY_摩克萨尔丁的魔法|r
.target Far Seer Mok'thardin
step
.goto Stranglethorn Vale,32.20,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kin'weelay|r交谈
.turnin 589 >>交任务: |cRXP_FRIENDLY_歌唱水晶|r
.accept 591 >>接任务: |cRXP_WARN_心灵之眼|r
.target Kin'weelay
.group
step
.goto Stranglethorn Vale,32.20,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kin'weelay|r交谈
.turnin 589 >>交任务: |cRXP_FRIENDLY_歌唱水晶|r
.target Kin'weelay
step
.goto Stranglethorn Vale,38.18,35.60
>>击杀|cRXP_ENEMY_虎王邦加拉什|r. 从他身上搜刮出他的|cRXP_LOOT_头|r
>>|cRXP_WARN_这个任务很难. 他出现时会带2个怪物, 大约在50%血量时再召唤2个|r
.complete 208,1 
.unitscan King Bangalash
.group 3
step
#completewith next
>>击杀|cRXP_ENEMY_Mosh'Ogg Ogres|r. 击败他们后可搜刮出|cRXP_LOOT_Maury's Key|r
.complete 613,1 
.group 4
step
.goto Stranglethorn Vale,52.93,27.60
>>击杀|cRXP_ENEMY_麦佐斯|r. 击败他后搜刮|cRXP_LOOT_心智之眼|r
>>|cRXP_WARN_他位于洞穴深处, 由两只小怪守护|r
.complete 591,1 
.mob Mai'Zoth
.group 4
step
.goto Stranglethorn Vale,50.78,27.74,-1
.goto Stranglethorn Vale,49.25,27.10,-1
>>击杀|cRXP_ENEMY_Mosh'Ogg Ogres|r. 击败他们后可搜刮出|cRXP_LOOT_Maury's Key|r
.complete 613,1 
.group 4
step
#completewith next
.goto Stranglethorn Vale,35.70,10.80,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尼尔|r交谈
+交出你拥有的所有|T134332:0|t[荆棘谷的青山 - 页面]
.target Barnil Stonepot
.group
step
.goto Stranglethorn Vale,35.70,10.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫梅特|r交谈
.turnin 208 >>交任务: |cRXP_FRIENDLY_王牌猎人|r
.target Hemet Nesingwary
.isQuestComplete 208
.group
step
.goto Stranglethorn Vale,32.20,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kin'weelay|r交谈
.turnin 591 >>交任务: |cRXP_FRIENDLY_心灵之眼|r
.accept 592 >>接任务: |cRXP_WARN_拯救耶尼库|r
.target Kin'weelay
.group
step
#completewith next
.goto Stranglethorn Vale,32.80,65.80,0
>>击杀你发现的任何|cRXP_ENEMY_大猩猩|r. 从它们身上搜刮出|cRXP_LOOT_毒牙|r
.collect 2799,10 
.isOnQuest 348
.group
.addquestitem 2799,348
step
.goto Stranglethorn Vale,35.27,60.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巫医安巴格瓦|r交谈
.turnin 349 >>交任务: |cRXP_FRIENDLY_荆棘谷热疫|r
.target Witch Doctor Unbagwa
.isOnQuest 348
.group 3
step
.goto Stranglethorn Vale,35.27,60.40
>>面对一波波|cRXP_ENEMY_猩猩|r, 直到|cRXP_ENEMY_野蛮的莫克|r出现. 击杀他并搜刮他的|cRXP_LOOT_心脏|r
.complete 348,1 
.unitscan Mokk the Savage
.isOnQuest 348
.group 3
step
.goto Stranglethorn Vale,39.0,58.20
.use 3912 >>使用 |T134336:0|t[灵魂宝石] 对|cRXP_ENEMY_耶尼库|r施放, 然后与其对话以获取他的|cRXP_LOOT_宝石|r
.complete 592,1 
.unitscan Yenniku
.group
.isOnQuest 592
step
.goto Stranglethorn Vale,36.86,69.51
>>击杀|cRXP_ENEMY_高拉什|r. 击败后搜刮他的|cRXP_LOOT_胸甲|r
.complete 8551,1 
.isOnQuest 8551
.unitscan Gorlash
.group 3
step
#completewith Keelhaul
.goto Stranglethorn Vale,32.90,88.20,0
.goto Stranglethorn Vale,30.60,90.60,0
.goto Stranglethorn Vale,29.30,88.30,0
>>搜索飞船的底层, 直到在地上找到一个|cRXP_PICK_小卷轴|r. 拾取它以获得 |T134939:0|t[|cRXP_LOOT_科泰罗的谜题|r]. 使用它来开始任务
.accept 624 >>接任务: |cRXP_LOOT_科泰罗的谜题|r
.collect 4056,1,624,1 
.use 4056
.group 3
step
#completewith Keelhaul
>>击杀|cRXP_ENEMY_Bloodsail Pirates|r. 搜刮他们的|cRXP_LOOT_Snuff|r和|cRXP_LOOT_Dizzy's Eye|r
.complete 587,1 
.complete 576,1 
.group
step
.goto Stranglethorn Vale,32.90,88.20
>>击杀船体后部二楼的斯蒂沃特船长(|cRXP_ENEMY_Captain Stillwater|r)
.complete 608,1 
.unitscan Captain Stillwater
.group 3
step
.goto Stranglethorn Vale,30.60,90.60
>>击杀位于船体二楼后方的舰队指挥官菲尔拉伦|r
.complete 608,3 
.unitscan Fleet Master Firallon
.group 3
step
#label Keelhaul
.goto Stranglethorn Vale,29.30,88.30
>>击杀船体后方二楼的尼哈鲁船长
>>|cRXP_ENEMY_加尔|r|cRXP_WARN_可造成高额伤害和眩晕2秒, 并且|r|T132152:0|t[横扫]
.complete 608,2 
.unitscan Captain Keelhaul
.unitscan Garr Salthoof
.group 3
step
#completewith next
>>击杀|cRXP_ENEMY_血帆海盗|r. 击败他们后搜刮出|cRXP_LOOT_呼呼|r
.complete 587,1 
.isOnQuest 587
.group
step
#loop
.goto Stranglethorn Vale,32.02,79.47,0
.goto Stranglethorn Vale,32.02,79.47,60,0
.goto Stranglethorn Vale,29.83,81.11,60,0
.goto Stranglethorn Vale,27.18,82.79,60,0
>>击杀|cRXP_ENEMY_血帆海盗|r. 击杀后搜刮出|cRXP_LOOT_迷幻之眼|r
.complete 576,1 
.isOnQuest 576
.group
step
#loop
.goto Stranglethorn Vale,32.02,79.47,0
.goto Stranglethorn Vale,32.02,79.47,60,0
.goto Stranglethorn Vale,29.83,81.11,60,0
.goto Stranglethorn Vale,27.18,82.79,60,0
>>击杀|cRXP_ENEMY_血帆海盗|r. 击败他们后搜刮出|cRXP_LOOT_呼呼|r
.complete 587,1 
.isOnQuest 587
.group
step
.goto Stranglethorn Vale,26.70,73.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海克拜瑞·斯莫特船长|r交谈
.turnin 8551 >>交任务: |cRXP_FRIENDLY_船长的箱子|r
.target Captain Hecklebury Smotts
.isQuestComplete 8551
.group
step
.goto Stranglethorn Vale,28.60,75.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_独眼迪兹|r交谈
.turnin 576 >>交任务: |cRXP_FRIENDLY_海盗的眼睛|r
.target Dizzy One-Eye
.group
step
.goto Stranglethorn Vale,27.60,76.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_芬·菲兹拉克|r交谈
.turnin 348 >>交任务: |cRXP_FRIENDLY_荆棘谷热疫|r
.target Fin Fizracket
.group
step
.goto Stranglethorn Vale,27.80,77.0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“海狼”马克基雷|r交谈
.turnin 613 >>交任务: |cRXP_FRIENDLY_玛雷的腿|r
.target "Sea Wolf" MacKinley
.isQuestComplete 613
.group
step
.goto Stranglethorn Vale,27.00,77.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪格|r交谈
.turnin 587 >>交任务: |cRXP_FRIENDLY_鼻烟|r
.target Deeg
.group
step
.goto Stranglethorn Vale,27.11,77.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crank|r交谈
.accept 1119 >>接任务: |cRXP_WARN_赞吉尔的药剂和蠢人酒|r
.target Crank Fizzlebub
.group
step
.goto Stranglethorn Vale,27.10,77.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_舰队指挥官卡拉·海角|r交谈
.turnin 608 >>交任务: |cRXP_FRIENDLY_血帆海盗|r
.target Fleet Master Seahorn
.isQuestComplete 608
.group
step
.goto Stranglethorn Vale,26.55,76.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_掘金者维兹尼克|r 交谈
.bankwithdraw 10699,5862,9628,8564 >>从您的银行提取以下物品:
>>|T135474:0|t[耶基尼亚的荆棘] 
>>|T132385:0|t[爆盐增压器] 
>>|T133645:0|t[尼尔鲁的草药袋] 
>>|T132833:0|t[角鹰兽的蛋] 
.target Viznik Goldgrubber
.group
step
#completewith next
.isOnQuest 1119
+|cRXP_WARN_请注意, 赞吉尔的药剂和蠢人酒任务均有2小时计时|r
.group
step
.goto Stranglethorn Vale,26.87,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格林戈|r交谈
.fly Grom'gol >>飞往格罗姆高营地
.target Gringer
.group
step
.goto Stranglethorn Vale,32.20,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kin'weelay|r交谈
.turnin 592 >>交任务: |cRXP_FRIENDLY_拯救耶尼库|r
.target Kin'weelay
.isQuestComplete 592
.group
step
.goto Stranglethorn Vale,32.5,29.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞斯塔|r交谈
.fly Stonard>>飞往斯托纳德
.target Thysta
.zoneskip Swamp of Sorrows
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 47-48 悲伤沼泽
#displayname 47-48 悲伤沼泽 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 40-50
#next 47-49 塔纳利斯
step
.goto Swamp of Sorrows,34.30,66.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在诅咒之地边境与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.accept 2784 >>接任务: |cRXP_WARN_失落的荣耀|r
.target Fallen Hero of the Horde
step
.goto Swamp of Sorrows,34.30,66.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈, 并完成全部对话
.complete 2784,1 
.target Fallen Hero of the Horde
.skipgossip 7572,1,1,1
step
.goto Blasted Lands,52.76,2.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.turnin 2784 >>交任务: |cRXP_FRIENDLY_失落的荣耀|r
.accept 2621 >>接任务: |cRXP_WARN_悔恨的战士|r
.target Fallen Hero of the Horde
step
#completewith next
.goto Swamp of Sorrows,46.0,54.2,50,0
.subzone 75 >>前往斯托纳德
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_Fel'zerul|r和|cRXP_FRIENDLY_Ruag|r交谈
.accept 1429 >>接任务: |cRXP_WARN_阿塔莱流放者|r
.target +Fel'zerul
.goto Swamp of Sorrows,47.93,54.79
.turnin 2621 >>交任务: |cRXP_FRIENDLY_悔恨的战士|r
.accept 2622 >>接任务: |cRXP_WARN_丢失的命令|r
.target +Dispatch Commander Ruags
.goto Swamp of Sorrows,47.78,54.94
step
.goto Swamp of Sorrows,44.96,57.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_本戈尔|r交谈
.turnin 2622 >>交任务: |cRXP_FRIENDLY_丢失的命令|r
.accept 2623 >>接任务: |cRXP_WARN_沼泽空谈者|r
.target Bengor
step
.goto Swamp of Sorrows,81.31,80.97
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tok'Kar|r交谈
.accept 699 >>接任务: |cRXP_WARN_缺乏补给|r
.target Tok'Kar
step
.goto Swamp of Sorrows,45.78,52.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏塔佐尔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Thultazor
step
.goto Swamp of Sorrows,45.38,56.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的好友|r拉尔塔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Rartar
step
.goto Swamp of Sorrows,82.0,68.6,40,0
.goto Swamp of Sorrows,86.6,58.6,40,0
#loop
.goto Swamp of Sorrows,87.60,39.60,60,0
.goto Swamp of Sorrows,86.80,35.80,60,0
.goto Swamp of Sorrows,83.20,31.60,60,0
.goto Swamp of Sorrows,82.80,26.20,60,0
.goto Swamp of Sorrows,80.60,20.80,60,0
.goto Swamp of Sorrows,78.60,13.60,60,0
.goto Swamp of Sorrows,74.00,15.60,60,0
.goto Swamp of Sorrows,75.80,20.60,60,0
.goto Swamp of Sorrows,78.60,23.00,60,0
.goto Swamp of Sorrows,79.60,29.20,60,0
.goto Swamp of Sorrows,81.60,33.00,60,0
.goto Swamp of Sorrows,84.80,36.20,60,0
.goto Swamp of Sorrows,87.60,39.60,60,0
.goto Swamp of Sorrows,87.60,39.60,25,0
>>击杀 |cRXP_ENEMY_盐齿钳嘴鳄|r. 击杀后可从它们身上获得 |cRXP_LOOT_Claws|r
.complete 699,1 
.mob Sawtooth Snapper
step
.goto Swamp of Sorrows,81.40,80.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tok'Kar|r交谈
.turnin 699 >>交任务: |cRXP_FRIENDLY_缺乏补给|r
.accept 1422 >>接任务: |cRXP_WARN_海中的威胁|r
.target Tok'Kar
step
.goto Swamp of Sorrows,83.70,80.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡塔尔|r交谈
.turnin 1422 >>交任务: |cRXP_FRIENDLY_海中的威胁|r
.accept 1426 >>接任务: |cRXP_WARN_海中的威胁|r
.target Katar
step
#loop
.goto Swamp of Sorrows,85.40,82.80,0
.goto Swamp of Sorrows,85.40,82.80,60,0
.goto Swamp of Sorrows,86.60,79.40,60,0
.goto Swamp of Sorrows,88.60,76.60,60,0
.goto Swamp of Sorrows,91.60,69.60,60,0
.goto Swamp of Sorrows,93.40,64.00,60,0
.goto Swamp of Sorrows,94.60,58.20,60,0
.goto Swamp of Sorrows,95.20,51.00,60,0
.goto Swamp of Sorrows,94.60,58.20,60,0
.goto Swamp of Sorrows,93.40,64.00,60,0
.goto Swamp of Sorrows,91.60,69.60,60,0
.goto Swamp of Sorrows,88.60,76.60,60,0
.goto Swamp of Sorrows,87.20,80.40,60,0
.goto Swamp of Sorrows,86.40,84.60,60,0
.goto Swamp of Sorrows,85.60,88.80,60,0
.goto Swamp of Sorrows,83.60,93.80,60,0
.goto Swamp of Sorrows,81.20,93.00,60,0
.goto Swamp of Sorrows,83.20,88.40,60,0
>>击杀|cRXP_ENEMY_沼泽鱼人|r和|cRXP_ENEMY_沼泽喷墨鱼人|r和|cRXP_ENEMY_沼泽食腐鱼人|r
.complete 1426,1 
.mob +Marsh Murloc
.complete 1426,2 
.mob +Marsh Inkspewer
.complete 1426,3 
.mob +Marsh Flesheater
step
.goto Swamp of Sorrows,83.70,80.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡塔尔|r交谈
.turnin 1426 >>交任务: |cRXP_FRIENDLY_海中的威胁|r
.accept 1427 >>接任务: |cRXP_WARN_海中的威胁|r
.target Katar
step
.goto Swamp of Sorrows,81.40,80.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tok'Kar|r交谈
.turnin 1427 >>交任务: |cRXP_FRIENDLY_海中的威胁|r
.target Tok'Kar
step
.goto Swamp of Sorrows,83.75,80.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡塔尔|r交谈
.accept 1428 >>接任务: |cRXP_WARN_海中的威胁|r
.target Katar
step
#completewith SwampTalker
.goto Swamp of Sorrows,66.03,79.60,40,0
.subzone 1817 >>向西前进, 进入斯塔加尔博格洞穴
step
#completewith next
>>击杀|cRXP_ENEMY_沼泽鱼人|r和|cRXP_ENEMY_沼泽喷墨鱼人|r和|cRXP_ENEMY_沼泽食腐鱼人|r
>>|cRXP_WARN_这些生物在营地西边的斯塔加尔博洞穴中生成速率更高|r
.complete 1428,1 
.mob +Marsh Murloc
.complete 1428,2 
.mob +Marsh Inkspewer
.complete 1428,3 
.mob +Marsh Flesheater
step
#label SwampTalker
.goto Swamp of Sorrows,66.08,77.67,60,0
.goto Swamp of Sorrows,62.90,87.40
>>击杀|cRXP_ENEMY_沼泽空谈者|r. 击败后搜刮物品, 获得|cRXP_LOOT_部落大酋长的命令|r
>>|cRXP_WARN_把你的冷却技能留着对付|r|cRXP_ENEMY_沼泽空谈者|r|cRXP_WARN_. 他的小怪一击必杀, 但如果存活下来, 会造成大量伤害|r
.complete 2623,1 
.unitscan Swamp Talker
step
#loop
.goto Swamp of Sorrows,62.48,87.74,0
.goto Swamp of Sorrows,62.48,87.74,25,0
.goto Swamp of Sorrows,60.95,84.20,25,0
.goto Swamp of Sorrows,62.20,83.16,25,0
.goto Swamp of Sorrows,64.60,81.25,25,0
.goto Swamp of Sorrows,66.42,84.59,25,0
.goto Swamp of Sorrows,63.34,86.47,25,0
.goto Swamp of Sorrows,63.84,91.64,25,0
>>击杀|cRXP_ENEMY_沼泽鱼人|r和|cRXP_ENEMY_沼泽喷墨鱼人|r和|cRXP_ENEMY_沼泽食腐鱼人|r
>>|cRXP_WARN_这些生物在营地西边的斯塔加尔博洞穴中生成速率更高|r
.complete 1428,1 
.mob +Marsh Murloc
.complete 1428,2 
.mob +Marsh Inkspewer
.complete 1428,3 
.mob +Marsh Flesheater
step
.goto Swamp of Sorrows,83.70,80.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡塔尔|r交谈
.turnin 1428 >>交任务: |cRXP_FRIENDLY_海中的威胁|r
.target Katar
step << Hunter/Warlock/Shaman/Warrior
#completewith next
.goto Swamp of Sorrows,46.0,54.2,50,0
.subzone 75 >>前往西方的斯托纳德
step << Hunter
.goto Swamp of Sorrows,47.27,53.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ogrom|r交谈
.train 14304 >>训练你的职业法术
.target Ogrom
.xp <46,1
.xp >48,1
step << Hunter
#optional
.goto Swamp of Sorrows,47.27,53.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ogrom|r交谈
.train 14321 >>训练你的职业法术
.target Ogrom
.xp <48,1
step << Hunter
.goto Swamp of Sorrows,47.35,52.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格罗科尔|r交谈
.train 24562 >>训练你的宠物法术
.target Grokor
.xp <48,1
step << Warlock
.goto Swamp of Sorrows,48.64,55.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡托什|r交谈
.train 11699 >>训练你的职业法术
.target Kartosh
.xp <46,1
.xp >48,1
step << Warlock
#optional
.goto Swamp of Sorrows,48.64,55.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡托什|r交谈
.train 11712 >>训练你的职业法术
.target Kartosh
.xp <48,1
step << Warlock
.goto Swamp of Sorrows,48.59,55.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷沙卡|r交谈
.vendor >>购买任何你负担得起的宠物升级道具
.target Greshka
step << Shaman
.goto Swamp of Sorrows,48.19,57.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷沙卡|r交谈
.train 10586 >>训练你的职业法术
.target Haromm
.xp <46,1
.xp >48,1
step << Shaman
#optional
.goto Swamp of Sorrows,48.19,57.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷沙卡|r交谈
.train 10431 >>训练你的职业法术
.target Haromm
.xp <48,1
step << Warrior
.goto Swamp of Sorrows,44.89,57.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马尔罗什|r交谈
.train 11578 >>训练你的职业法术
.target Malosh
.xp <46,1
.xp >48,1
step << Warrior
#optional
.goto Swamp of Sorrows,44.89,57.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马尔罗什|r交谈
.train 20661 >>训练你的职业法术
.target Malosh
.xp <48,1
step
.goto Swamp of Sorrows,34.30,66.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.turnin 2623 >>交任务: |cRXP_FRIENDLY_沼泽空谈者|r
.accept 2801 >>接任务: |cRXP_LOOT_悲伤的故事|r
.target Fallen Hero of the Horde
step
.goto Swamp of Sorrows,34.30,66.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈, 并完成全部对话
.complete 2801,1 
.skipgossip
step
.goto Blasted Lands,52.76,2.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.turnin 2801 >>交任务: |cRXP_FRIENDLY_悲伤的故事|r
.target Fallen Hero of the Horde
step
.goto Swamp of Sorrows,22.90,48.30
>>点击桥下水中的|cRXP_PICK_Soggy 卷轴|r
.turnin 624 >>交任务: |cRXP_FRIENDLY_科泰罗的谜题|r
.accept 625 >>接任务: |cRXP_LOOT_科泰罗的谜题|r
.isOnQuest 624
.group
step
#completewith next
.hs >>传送至莫沙彻营地
.use 6948
step
.goto Feralas,74.81,45.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格鲁尔|cRXP_FRIENDLY_旅店老板格鲁尔|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Greul
step << Druid
.goto Feralas,76.0,42.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jannos|r交谈
.train 9823 >>训练你的职业法术
.target Jannos Lighthoof
.xp <46,1
.xp >48,1
step << Druid
#optional
.goto Feralas,76.0,42.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jannos|r交谈
.train 22828 >>训练你的职业法术
.target Jannos Lighthoof
.xp <48,1
step
.goto Feralas,74.50,43.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Uzer'i|r交谈
.turnin 3122 >>交任务: |cRXP_FRIENDLY_向巫医尤克里回复|r
.timer 23,Return to Witch Doctor Uzer'i RP
.accept 3123 >>接任务: |cRXP_LOOT_测试容器|r
.accept 3380 >>接任务: |cRXP_LOOT_沉没的神庙|r
.target Witch Doctor Uzer'i
step
.goto Feralas,75.45,44.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏恩|r交谈
.fly Tanaris >>飞往塔纳利斯
.target Shyn
.zoneskip Tanaris
step
#optional
.abandon 197 >>放弃猎龙
.isOnQuest 197
step
#optional
.abandon 193 >>放弃猎豹专精
.isOnQuest 193
step
#optional
.abandon 208 >>放弃王牌猎枪
.isOnQuest 208
step
#optional
.abandon 608 >>放弃血帆海盗
.isOnQuest 608
step
#optional
.abandon 613 >>放弃破解玛雷的腿
.isOnQuest 613
step
.abandon 348 >>放弃荆棘谷热疫
.isOnQuest 348
step
#optional
.abandon 8551 >>放弃船长的箱子
.isOnQuest 8551
step
#optional
.abandon 591 >>舍弃心灵之眼
.isOnQuest 591
step
#optional
.abandon 348 >>放弃荆棘谷热疫
.isOnQuest 348
step
#optional
.abandon 348 >>放弃荆棘谷热疫
.isOnQuest 348
step
#optional
.abandon 592 >>放弃拯救耶尼库
.isOnQuest 592
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 47-49 塔纳利斯
#displayname 47-49 塔纳利斯 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 40-50
#next 49-50 辛特兰
step
#completewith next
.goto Thousand Needles,70.58,62.69,200 >>前往: |cRXP_PICK_千针石林|r
step
.goto Thousand Needles,77.79,77.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kravel|r交谈
.turnin 1119 >>交任务: |cRXP_FRIENDLY_赞吉尔的药剂和蠢人酒|r
.timer 13,Kravel Koalbeard RP
.target Kravel Koalbeard
step
.goto Thousand Needles,80.33,76.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉泽瑞克|r交谈
.turnin 1187 >>交任务: |cRXP_FRIENDLY_拉泽瑞克的调整|r
.target Razzeric
.isQuestComplete 1187
step
.goto Thousand Needles,80.33,76.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉泽瑞克|r交谈
.accept 1188 >>接任务: |cRXP_LOOT_安全第一|r
.target Razzeric
.isQuestTurnedIn 1187
step
.goto Thousand Needles,77.79,77.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kravel|r交谈
.accept 1120 >>接任务: |cRXP_WARN_灌醉侏儒|r
.target Kravel Koalbeard
step
.goto Thousand Needles,77.56,76.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_侏儒车队老板|r交谈
.turnin 1120 >>交任务: |cRXP_FRIENDLY_灌醉侏儒|r
.target Gnome Pit Boss
step
.goto Thousand Needles,77.79,77.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kravel|r交谈
.accept 1122 >>接任务: |cRXP_WARN_向菲兹巴布报告|r
.target Kravel Koalbeard
step
#completewith next
.goto Thousand Needles,75.44,97.37,40,0
.subzone 976 >>前往: |cRXP_PICK_塔纳利斯|r
step
.goto Tanaris,51.56,26.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特兰雷克|r交谈
.accept 3362 >>接任务: |cRXP_LOOT_灌木谷|r
.target Tran'rek
step
.goto Tanaris,51.00,27.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史瑞夫|r交谈
.turnin 1188 >>交任务: |cRXP_FRIENDLY_安全第一|r
.target Shreev
.isQuestComplete 1188
step
.goto Tanaris,50.20,27.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级勘探员菲兹杜瑟|r交谈
.accept 82 >>接任务: |cRXP_LOOT_腐化之巢|r
.target Kravel Koalbeard
step
.goto Tanaris,51.90,27.00
>>点击巨型笼子旁的|cRXP_PICK_通缉告示|r
.accept 2875 >>接任务: |cRXP_LOOT_通缉：安德雷·费尔比德|r
step
.goto Tanaris,51.80,28.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛琳|r交谈
.accept 2605 >>接任务: |cRXP_LOOT_口渴的地精|r
.target Marin Noggenfogger
step
.goto Tanaris,52.50,27.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fizzgrimble|r交谈
.home >>将你的[炉石]设置为加基森
.target Innkeeper Fizzgrimble
step
.goto Tanaris,52.39,26.97
>>点击传送器旁边的|cRXP_PICK_测蛋器|r, 然后交出你的角鹰兽的蛋
.accept 2741 >>接任务: |cRXP_WARN_超级测蛋器|r
.turnin 2741 >>交任务: |cRXP_FRIENDLY_超级测蛋器|r
.addquestitem 8564,2741
step
.goto Tanaris,52.80,27.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安蒂|r交谈
.accept 5863 >>接任务: |cRXP_LOOT_砂槌食人魔|r
.target Andi Lynn
step
+打开你的 |T132594:0|t[蛋箱]
.itemcount 8647,1 
.use 8647
step
.goto Tanaris,52.358,26.904
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克格尔·曲藤|r交谈
.accept 2750 >>接任务: |cRXP_WARN_坏掉的蛋|r
.turnin 2750 >>交任务: |cRXP_FRIENDLY_坏掉的蛋|r
.target Curgle Cranklehop
.itemcount 8646,1 
step
.goto Tanaris,52.358,26.904
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克格尔·曲藤|r交谈
.accept 2749 >>接任务: |cRXP_WARN_普通的蛋|r
.turnin 2749 >>交任务: |cRXP_FRIENDLY_普通的蛋|r
.target Curgle Cranklehop
.itemcount 8645,1 
step
.goto Tanaris,52.358,26.904
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克格尔·曲藤|r交谈
.accept 2748 >>接任务: |cRXP_WARN_优良的蛋|r
.turnin 2748 >>交任务: |cRXP_FRIENDLY_优良的蛋|r
.target Curgle Cranklehop
.itemcount 8644,1 
step
.goto Tanaris,52.358,26.904
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克格尔·曲藤|r交谈
.accept 2747 >>接任务: |cRXP_WARN_特别的蛋|r
.turnin 2747 >>交任务: |cRXP_FRIENDLY_特别的蛋|r
.target Curgle Cranklehop
.itemcount 8643,1 
step
+打开你的 |T132594:0|t[补给物品盒]
.itemcount 9539,1 
.use 9539
step
+打开你的 |T132595:0|t[法术盒]
.itemcount 9540,1 
.use 9540
step
+打开你的 |T132597:0|t[糖果盒]
.itemcount 9541,1 
.use 9541
step
.goto Tanaris,50.20,27.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级勘探员菲兹杜瑟|r交谈
.accept 992 >>接任务: |cRXP_LOOT_加基森水业公司|r
.target Senior Surveyor Fizzledowser
step
.goto Tanaris,39.10,29.30
.use 8584 >>|cRXP_WARN_在池边使用|r|T134867:0|t[未使用的寻水器]|r
>>|cRXP_WARN_当心！完成任务后会刷新两只|cRXP_ENEMY_森提帕尔掘洞蝎|r(48级)敌人, 请提前做好逃跑准备|r
.complete 992,1 
step
.goto Tanaris,50.20,27.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级勘探员菲兹杜瑟|r交谈
.turnin 992 >>交任务: |cRXP_FRIENDLY_加基森水业公司|r
.accept 82 >>接任务: |cRXP_LOOT_腐化之巢|r
.target Senior Surveyor Fizzledowser
step
#completewith next
.subzone 977 >>前往东方的热砂港
step
.goto Tanaris,66.60,22.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Modiste|r交谈
.accept 8365 >>接任务: |cRXP_LOOT_海盗的帽子！|r
.target Haughty Modiste
step
.goto Tanaris,67.00,22.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Yeh'kinya|r交谈
.turnin 3520 >>交任务: |cRXP_FRIENDLY_尖啸者的灵魂|r
.target Yeh'kinya
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯杜雷|r和|cRXP_FRIENDLY_斯杜雷|r交谈
.accept 8366 >>接任务: |cRXP_LOOT_南海复仇|r
.target +Security Chief Bilgewhizzle
.goto Tanaris,67.06,23.89
.accept 2873 >>接任务: |cRXP_LOOT_斯杜雷的货物|r
.target +Stoley
.goto Tanaris,67.11,23.98
step
#completewith FireBeard
.goto Tanaris,68.76,41.51,30,0
.subzone 1336 >>前往南方的失落拉格港湾
step
#completewith StolenCargo
>>击杀|cRXP_ENEMY_南海海盗|r和|cRXP_ENEMY_南海流氓|r和|cRXP_ENEMY_南海码头工人|r和|cRXP_ENEMY_南海流氓|r. 掠夺他们以获取|cRXP_LOOT_海盗帽|r和 |T132596:0|t[|cRXP_LOOT_海盗的箱子|r]
>>|cRXP_WARN_打开|r|T132596:0|t[|cRXP_LOOT_海盗的储物箱|r]|cRXP_WARN_直到你找到|r|T134939:0|t[|cRXP_LOOT_船运时刻表|r]
>>|cRXP_WARN_不要开始寻找|T134939:0|t[|cRXP_LOOT_船运时刻表|r]的任务. 该任务掉落几率较低, 如有需要可跳过|r
.complete 8366,1 
.mob +Southsea Pirate
.complete 8366,2 
.mob +Southsea Freebooter
.complete 8366,3 
.mob +Southsea Dock Worker
.complete 8366,4 
.mob +Southsea Swashbuckler
.complete 8365,1 
.mob +Southsea Pirate
.mob +Southsea Freebooter
.mob +Southsea Dock Worker
.mob +Southsea Swashbuckler
.collect 9250,1,2876,1 
.mob +Southsea Pirate
.mob +Southsea Freebooter
.mob +Southsea Dock Worker
.mob +Southsea Swashbuckler

.use 9276 

step
#completewith next
>>在西边房屋的二楼搜刮|cRXP_PICK_被偷走的货物|r, 以获得|cRXP_LOOT_斯杜雷的货物|r
.complete 2873,1 
step
#label FireBeard
.goto Tanaris,73.37,47.14
>>击杀|cRXP_ENEMY_安德雷·费尔比德|r, 击败他后拾取他的|cRXP_LOOT_头|r
>>|cRXP_WARN_小心, 他可能会拉到附近的怪物. 如果可以, 先分开拉怪, 然后风筝走以重置其他怪物|r
.complete 2875,1 
.unitscan Andre Firebeard
step
#label StolenCargo
.goto Tanaris,72.23,46.81
>>在西边房屋的二楼搜刮|cRXP_PICK_被偷走的货物|r, 以获得|cRXP_LOOT_斯杜雷的货物|r
.complete 2873,1 
step
>>击杀|cRXP_ENEMY_南海海盗|r和|cRXP_ENEMY_南海流氓|r和|cRXP_ENEMY_南海码头工人|r和|cRXP_ENEMY_南海流氓|r. 掠夺他们以获取|cRXP_LOOT_海盗帽|r和 |T132596:0|t[|cRXP_LOOT_海盗的箱子|r]
>>|cRXP_WARN_打开|r|T132596:0|t[|cRXP_LOOT_海盗的储物箱|r]|cRXP_WARN_直到你找到|r|T134939:0|t[|cRXP_LOOT_船运时刻表|r]
>>|cRXP_WARN_不要开始寻找|T134939:0|t[|cRXP_LOOT_船运时刻表|r]的任务. 该任务掉落几率较低, 如有需要可跳过|r
.complete 8366,1 
.mob +Southsea Pirate
.goto Tanaris,71.10,42.86,70,0
.goto Tanaris,71.33,46.05,70,0
.goto Tanaris,73.09,45.30,70,0
.goto Tanaris,74.17,46.28,70,0
.goto Tanaris,71.90,44.92
.complete 8366,2 
.mob +Southsea Freebooter
.goto Tanaris,71.10,42.86,70,0
.goto Tanaris,71.33,46.05,70,0
.goto Tanaris,73.09,45.30,70,0
.goto Tanaris,74.17,46.28,70,0
.goto Tanaris,71.90,44.92
.complete 8366,3 
.mob +Southsea Dock Worker
.goto Tanaris,73.76,47.79,65,0
.goto Tanaris,74.46,46.85,50,0
.goto Tanaris,74.62,47.73
.complete 8366,4 
.mob +Southsea Swashbuckler
.goto Tanaris,75.17,45.84
.complete 8365,1 
.mob +Southsea Pirate
.mob +Southsea Freebooter
.mob +Southsea Dock Worker
.mob +Southsea Swashbuckler
.goto Tanaris,71.10,42.86,70,0
.goto Tanaris,71.33,46.05,70,0
.goto Tanaris,73.09,45.30,70,0
.goto Tanaris,74.17,46.28,70,0
.goto Tanaris,71.90,44.92,70,0
.goto Tanaris,73.76,47.79,65,0
.goto Tanaris,74.46,46.85,50,0
.goto Tanaris,74.62,47.73,50,0
.goto Tanaris,75.17,45.84,60,0
.goto Tanaris,72.15,46.76
.collect 9250,1,2876,1 
.mob +Southsea Pirate
.mob +Southsea Freebooter
.mob +Southsea Dock Worker
.mob +Southsea Swashbuckler

.goto Tanaris,71.10,42.86,70,0
.goto Tanaris,71.33,46.05,70,0
.goto Tanaris,73.09,45.30,70,0
.goto Tanaris,74.17,46.28,70,0
.goto Tanaris,71.90,44.92,70,0
.goto Tanaris,73.76,47.79,65,0
.goto Tanaris,74.46,46.85,50,0
.goto Tanaris,74.62,47.73,50,0
.goto Tanaris,75.17,45.84,60,0
.goto Tanaris,72.15,46.76
.use 9276 

.mob +Southsea Pirate
.mob +Southsea Freebooter
.mob +Southsea Dock Worker
.mob +Southsea Swashbuckler
step
#optional
#label TanarisPirates
step
#loop
.goto Tanaris,70.94,42.85,50,0
.goto Tanaris,72.22,44.35,50,0
.goto Tanaris,72.58,45.30,50,0
.goto Tanaris,71.07,46.03,50,0
.goto Tanaris,71.25,47.98,50,0
.goto Tanaris,72.39,48.23,50,0
.goto Tanaris,72.59,47.10,50,0
.goto Tanaris,73.27,47.99,50,0
.goto Tanaris,74.25,47.27,50,0
.goto Tanaris,73.68,45.89,50,0
.goto Tanaris,72.58,45.30,50,0
.goto Tanaris,72.22,44.35,50,0
>>击杀|cRXP_ENEMY_南海海盗|r
.xp 47 >>升级至47级
.mob Southsea Pirate
.mob Southsea Freebooter
.mob Southsea Dock Worker
.mob Southsea Swashbuckler
step
#completewith Gahzridian
.goto Tanaris,68.27,41.21,30,0
.goto Tanaris,65.71,41.53,30,0
.goto Tanaris,52.71,45.92,50,0
.subzone 1938 >>离开失落的拉格瑞克湾, 然后向西前往破碎石柱
step
#optional
.goto Tanaris,52.70,45.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回至|cRXP_FRIENDLY_Marvon|r
.turnin 3380 >>交任务: |cRXP_FRIENDLY_沉没的神庙|r
.accept 3161 >>接任务: |cRXP_LOOT_加兹瑞迪安|r
.target Marvon Rivetseeker
.isOnQuest 3380
step
#label Gahzridian
.goto Tanaris,52.70,45.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马尔冯|r交谈
.accept 3161 >>接任务: |cRXP_LOOT_加兹瑞迪安|r
.target Marvon Rivetseeker
step
#completewith next
.subzone 982 >>继续向西前往剧毒巢穴
step
#loop
.goto Tanaris,35.68,39.78,0
.goto Tanaris,35.68,39.78,70,0
.goto Tanaris,36.55,41.98,70,0
.goto Tanaris,35.59,44.08,70,0
.goto Tanaris,35.60,48.79,70,0
.goto Tanaris,31.70,49.12,70,0
.goto Tanaris,30.83,46.10,70,0
>>击杀|cRXP_ENEMY_Centipaar 蛇尾虫|r. 击败它们获取其|cRXP_LOOT_Insect Parts|r
>>|cRXP_WARN_小心|r|cRXP_ENEMY_森提帕尔群居蝎|r|cRXP_WARN_. 它们会召唤大量小怪, 并从很远的距离引发社交仇恨|r
>>|cRXP_WARN_全体|r|cRXP_ENEMY_百足|r|cRXP_WARN_施放|r|T132152:0|t[践踏]|cRXP_WARN_(每10秒额外发动2次攻击)
.complete 82,1 
.mob Centipaar Wasp
.mob Centipaar Stinger
.mob Centipaar Swarmer
.mob Centipaar Worker
.mob Centipaar Sandreaver
.mob Centipaar Tunneler
step
#completewith Garmarok
.goto Tanaris,40.98,57.16,50,0
.subzone 983 >>前往东南方向的杜内毛尔营地
step
#completewith next
>>击杀|cRXP_ENEMY_砂槌蛮兵|r 和|cRXP_ENEMY_砂槌执行者|r
>>|cRXP_WARN_避开|r|cRXP_ENEMY_砂槌术士|r|cRXP_WARN_, 因为他们拥有荆棘诅咒|r << Rogue/Warrior/Shaman/Paladin/Hunter
.complete 5863,1 
.mob +Dunemaul Brute
.complete 5863,2 
.mob +Dunemaul Enforcer
step
#label Garmarok
.goto Tanaris,41.50,57.80
>>击杀洞穴中的戈尔玛洛克
>>|cRXP_WARN_注意他的高额伤害输出和致命打击|r
.complete 5863,3 
.unitscan Gor'marok the Ravager
step
#completewith next
.use 9978 >>装备你的 |T133151:0|t[加兹瑞迪安探测器]
>>掠夺|cRXP_PICK_沙堆|r以获得|cRXP_LOOT_加兹瑞迪安饰品|r
>>|cRXP_WARN_加兹瑞迪安会出现在你的小地图上. 许多加兹瑞迪安可以在东月和南月废墟及其周围找到|r
.complete 3161,1 
.use 9978
step
#loop
.goto Tanaris,39.86,73.23,0
.goto Tanaris,44.97,63.83,80,0
.goto Tanaris,47.66,65.53,80,0
.goto Tanaris,41.98,71.25,80,0
.goto Tanaris,39.86,73.23,60,0
>>击杀|cRXP_ENEMY_砂槌蛮兵|r 和|cRXP_ENEMY_砂槌执行者|r
>>|cRXP_WARN_避开|r|cRXP_ENEMY_砂槌术士|r|cRXP_WARN_, 因为他们拥有荆棘诅咒|r << Rogue/Warrior/Shaman/Paladin/Hunter
.complete 5863,1 
.mob +Dunemaul Brute
.complete 5863,2 
.mob +Dunemaul Enforcer
step
#loop
.goto Tanaris,39.86,73.23,0
.goto Tanaris,44.97,63.83,80,0
.goto Tanaris,47.66,65.53,80,0
.goto Tanaris,41.98,71.25,80,0
.goto Tanaris,39.86,73.23,60,0
.use 9978 >>装备你的 |T133151:0|t[加兹瑞迪安探测器]
>>掠夺|cRXP_PICK_沙堆|r以获得|cRXP_LOOT_加兹瑞迪安饰品|r
>>|cRXP_WARN_加兹瑞迪安会出现在你的小地图上. 许多加兹瑞迪安可以在东月和南月废墟及其周围找到|r
.complete 3161,1 
.use 9978
step
.goto Tanaris,39.69,78.30,60,0
.goto Tanaris,39.21,80.25,25,0
.goto Tanaris,38.67,80.45,25,0
.goto Tanaris,38.47,80.99,30,0
.goto Tanaris,37.63,81.40
>>点击|cRXP_PICK_奥丹姆石座|r
>>|cRXP_WARN_小心！该区域有精英|r|cRXP_ENEMY_沙丘巨人|r|cRXP_WARN_. 请跟随路径箭头避开仇恨|r
.turnin 2966 >>交任务: |cRXP_FRIENDLY_拭目以待|r
.accept 2954 >>接任务: |cRXP_WARN_石头卫士|r
.unitscan Dune Smasher
.unitscan Raging Dune Smasher
.isQuestTurnedIn 2965
.dungeon ULDA
step
.goto Tanaris,37.63,81.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺甘农的石卫兵|r交谈
.complete 2954,1 
.skipgossip
.target Stone Watcher of Norgannon
.isQuestTurnedIn 2965
.dungeon ULDA
step
.goto Tanaris,37.63,81.40
>>点击|cRXP_PICK_奥丹姆石座|r
.turnin 2954 >>交任务: |cRXP_FRIENDLY_石头卫士|r
.accept 2967 >>接任务: |cRXP_LOOT_返回雷霆崖|r
.isQuestTurnedIn 2965
.dungeon ULDA
step
#completewith Thistleshrubs
.goto Tanaris,31.06,64.91,20,0
.subzone 980 >>前往蓟灌木谷
step
#completewith next
>>击杀 |cRXP_ENEMY_灌木露水收集者|r, 从其身上获取 |cRXP_LOOT_饱满的露水腺|r
>>|cRXP_WARN_这个物品的掉落率较低, 且其生成与其他怪物类型共享, 因此请击杀所有怪物以加快它们的生成速度|r
.complete 2605,1 
.mob Thistleshrub Dew Collector
step
#label Thistleshrubs
#loop
.goto Tanaris,29.50,62.98,0
.goto Tanaris,29.50,62.98,50,0
.goto Tanaris,27.76,65.80,50,0
.goto Tanaris,28.30,68.39,50,0
.goto Tanaris,30.63,66.57,50,0
.goto Tanaris,30.62,63.76,50,0
>>击杀|cRXP_ENEMY_长瘤的灌木兽|r 和|cRXP_ENEMY_灌木塑根者|r
.complete 3362,1 
.mob +Gnarled Thistleshrub
.complete 3362,2 
.mob +Thistleshrub Rootshaper
step
#loop
.goto Tanaris,29.50,62.98,0
.goto Tanaris,29.50,62.98,50,0
.goto Tanaris,27.76,65.80,50,0
.goto Tanaris,28.30,68.39,50,0
.goto Tanaris,30.63,66.57,50,0
.goto Tanaris,30.62,63.76,50,0
>>击杀 |cRXP_ENEMY_灌木露水收集者|r, 从其身上获取 |cRXP_LOOT_饱满的露水腺|r
>>|cRXP_WARN_这个物品的掉落率较低, 且其生成与其他怪物类型共享, 因此请击杀所有怪物以加快它们的生成速度|r
.complete 2605,1 
.mob Thistleshrub Dew Collector
step
#loop
.goto Tanaris,29.37,59.97,0
.goto Tanaris,28.70,67.32,0
.goto Tanaris,31.66,74.70,0
.goto Tanaris,29.37,59.97,25,0
.goto Tanaris,28.70,67.32,25,0
.goto Tanaris,31.66,74.70,25,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t寻找|cRXP_FRIENDLY_图加|r, 然后与他交谈以开启护送任务
>>|cRXP_WARN_他在该区域有4个不同的刷新点|r
.accept 1560 >>接任务: |cRXP_LOOT_图加的任务|r
.target Tooga
step
.goto Tanaris,66.58,25.64
>>引导|cRXP_FRIENDLY_图加|r前往热砂港
>>|cRXP_WARN_如果你离他太远, 任务就会失败|r
>>|cRXP_WARN_此任务限时30分钟！|r
.complete 1560,1 
.target Tooga
step
.goto Tanaris,66.58,25.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔塔|r交谈
.turnin 1560 >>交任务: |cRXP_FRIENDLY_图加的任务|r
.target Torta
step
#completewith SteemWeedleFinal
.goto Tanaris,67.1,22.4,50,0
.subzone 977 >>前往北方的热砂港
step
#sticky
#label ScheduleEnd
>>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_船运时刻表|r] 开始任务|r
>>|cRXP_WARN_您可能需要在向|r|cRXP_FRIENDLY_安全主管吉罗姆·比格维兹|r和|r|cRXP_FRIENDLY_斯杜雷|r提交后接受此任务|r
.accept 2876 >>接任务: |cRXP_LOOT_船运时刻表|r
.itemcount 9250,1 
.use 9250 
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯杜雷|r和|cRXP_FRIENDLY_斯杜雷|r交谈
.turnin 2875 >>交任务: |cRXP_FRIENDLY_通缉：安德雷·费尔比德|r
.turnin 8366 >>交任务: |cRXP_FRIENDLY_南海复仇|r
.turnin 2876 >>交任务: |cRXP_FRIENDLY_船运时刻表|r
.target +Security Chief Bilgewhizzle
.goto Tanaris,67.06,23.89
.turnin 2873 >>交任务: |cRXP_FRIENDLY_斯杜雷的货物|r
.accept 2874 >>接任务: |cRXP_LOOT_给马克基雷的货物|r
.target +Stoley
.goto Tanaris,67.11,23.98
.itemcount 9250,1 
.use 9250 
step
#optional
#label SteemWeedleFinal
#requires ScheduleEnd
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯杜雷|r和|cRXP_FRIENDLY_斯杜雷|r交谈
.turnin 2875 >>交任务: |cRXP_FRIENDLY_通缉：安德雷·费尔比德|r
.turnin 8366 >>交任务: |cRXP_FRIENDLY_南海复仇|r
.target +Security Chief Bilgewhizzle
.goto Tanaris,67.06,23.89
.turnin 2873 >>交任务: |cRXP_FRIENDLY_斯杜雷的货物|r
.accept 2874 >>接任务: |cRXP_LOOT_给马克基雷的货物|r
.target +Stoley
.goto Tanaris,67.11,23.98
step
.goto Tanaris,66.60,22.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Haughty|r交谈
.turnin 8365 >>交任务: |cRXP_FRIENDLY_海盗的帽子！|r
.target Haughty Modiste
step
.goto Tanaris,66.989,22.354
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Yeh'kinya|r再次交谈
.accept 3527 >>接任务: |cRXP_WARN_摩沙鲁的预言|r
.target Yeh'kinya
.isQuestTurnedIn 3520
.dungeon ZF
step
#completewith next
.hs >>炉石返回加基森
.use 6948
.cooldown item,6948,>0
step
.goto Tanaris,52.63,28.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪尔格·奎克里弗|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Dirge Quikcleave
step << skip
.goto Tanaris,52.30,28.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉布索恩|r交谈
.bankdeposit 9245 >>将斯托利的瓶子存入你的银行
.target Gimblethorn
step
.goto Tanaris,51.80,28.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛琳|r交谈
.turnin 2605 >>交任务: |cRXP_FRIENDLY_口渴的地精|r
.accept 2606 >>接任务: |cRXP_LOOT_好味道|r
.target Marin Noggenfogger
step
.goto Tanaris,50.90,27.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pestlezugg|r交谈
.turnin 82 >>交任务: |cRXP_FRIENDLY_腐化之巢|r
.target Alchemist Pestlezugg
step
.goto Tanaris,51.10,26.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯普琳科|r交谈
.turnin 2606 >>交任务: |cRXP_FRIENDLY_好味道|r
.accept 2641 >>接任务: |cRXP_LOOT_斯普琳科的秘密佐料|r
.target Sprinkle
step
.goto Tanaris,50.20,27.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级勘探员菲兹杜瑟|r交谈
.accept 10 >>接任务: |cRXP_LOOT_谢申克的救赎|r
.target Senior Surveyor Fizzledowser
step
.goto Tanaris,51.50,26.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特兰雷克|r交谈
.turnin 3362 >>交任务: |cRXP_FRIENDLY_灌木谷|r
.target Tran'rek
step
.goto Tanaris,52.80,27.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安蒂|r交谈
.turnin 5863 >>交任务: |cRXP_FRIENDLY_砂槌食人魔|r
.target Andi Lynn
step
.goto Tanaris,52.70,45.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马尔冯|r交谈
.turnin 3161 >>交任务: |cRXP_FRIENDLY_加兹瑞迪安|r
.accept 3444 >>接任务: |cRXP_LOOT_石环|r
.target Marvon Rivetseeker
step
#completewith next
.goto Tanaris,56.19,66.62,30,0
.subzone 981 >>向南前往裂谷
step
#label BugHole
.goto Tanaris,55.69,69.44,50,0
.goto Tanaris,56.36,68.44,30,0
.goto Tanaris,57.45,70.45,30,0
.goto Tanaris,55.96,71.16
>>进入异种蜂巢, 然后点击|cRXP_PICK_谢申克的勘探设备控制台|r并拾取|cRXP_LOOT_谢申克的勘探设备|r
>>|cRXP_WARN_要特别小心|cRXP_ENEMY_哈扎里群居蝎|r|cRXP_WARN_, 因为它们能快速召唤出造成高额伤害的随从(Adds), 还可能从极远距离引发其他怪物的仇恨(社交仇恨)|r
.complete 10,1 
.unitscan Hazzali Swarmer
step
.use 8623 >>如果你找到了 |T132836:0|t[OOX-17/TN 定位器], 点击它并接受任务. 否则, 跳过此步骤
.accept 351 >>接任务: |cRXP_LOOT_寻找OOX-17/TN！|r
.itemcount 8623,1
.use 8623
step
#optional
.goto Tanaris,60.20,64.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_自动导航机器人OOX-17/TN|r交谈
.turnin 351 >>交任务: |cRXP_FRIENDLY_寻找OOX-17/TN！|r
.target Homing Robot OOX-17/TN
.isOnQuest 351
step
#optional
.goto Tanaris,60.23,64.71
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_自动导航机器人OOX-17/TN再次|r交谈, 以开启护送任务
>>|cRXP_WARN_这个任务可能比较困难. 请先吃饱喝足, 并使用任何自我增益效果(卷轴和食物和药水等)|r
.accept 648,1 >>接任务: |cRXP_LOOT_拯救OOX-17/TN！|r
.target Homing Robot OOX-17/TN
.isQuestTurnedIn 351
step
#optional
.goto Tanaris,67.09,23.18
>>护送自动导航机器人OOX-17/TN至热砂港
>>|cRXP_WARN_一组3只等级46-47的蝎子将会在下一座山脉区域刷新|r
>>|cRXP_WARN_一组3只等级43-45的|r|cRXP_ENEMY_废墟流浪者|r|cRXP_WARN_将在水源地附近生成. 请优先击杀|r|cRXP_ENEMY_掠夺者|r|cRXP_WARN_, 当你的生命值低于20%时, 它会发动致命一击|r
.complete 648,1 
.target Homing Robot OOX-17/TN
.unitscan Wastewander Scofflaw
.isQuestTurnedIn 351
step
#sticky
#completewith EnterZF
.subzone 978,2 >>现在你应该去找一支前往祖尔法拉克的队伍
.dungeon ZF
step << Shaman
#completewith next
.hs >>炉石或星界传送至加基森
.subzoneskip 976
step << Shaman
.goto Tanaris,52.63,28.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_挽歌|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Dirge Quikcleave
step << !Shaman
#completewith next
.goto Tanaris,50.6,28.1
.subzone 976 >>前往: |cRXP_PICK_塔纳利斯|r
step
.goto Tanaris,50.21,27.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级勘探员菲兹杜瑟|r交谈
.turnin 10 >>交任务: |cRXP_FRIENDLY_谢申克的救赎|r
.accept 110 >>接任务: |cRXP_LOOT_昆虫研究|r
.target Senior Surveyor Fizzledowser
step
.goto Tanaris,50.90,27.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pestlezugg|r交谈
.turnin 110 >>交任务: |cRXP_FRIENDLY_昆虫研究|r
.accept 113 >>接任务: |cRXP_LOOT_昆虫研究|r
.target Alchemist Pestlezugg
step
.goto Tanaris,50.20,27.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级勘探员菲兹杜瑟|r交谈
.turnin 113 >>交任务: |cRXP_FRIENDLY_昆虫研究|r
.accept 32 >>接任务: |cRXP_LOOT_异种蝎的威胁|r
.target Senior Surveyor Fizzledowser
step
.goto Tanaris,51.413,28.752
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦顿·轻锤|r交谈
.accept 3042 >>接任务: |cRXP_WARN_巨魔调和剂|r
.target Trenton Lighthammer
.dungeon ZF
step
.goto Tanaris,52.462,28.514
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席工程师沙克斯·比格维兹|r交谈
.accept 2768 >>接任务: |cRXP_WARN_探水棒|r
.target Chief Engineer Bilgewhizzle
.dungeon ZF
step
.goto Tanaris,51.566,26.759
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特兰雷克|r交谈
.accept 2865 >>接任务: |cRXP_WARN_圣甲虫的壳|r
.target Tran'rek
.dungeon ZF
step
#completewith next
.goto Thousand Needles,70.58,62.69,200 >>前往: |cRXP_PICK_千针石林|r
.dungeon ZF
step
.goto Thousand Needles,78.143,77.120
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维兹尔·铜栓|r谈话
.accept 2770 >>接任务: |cRXP_WARN_加兹瑞拉|r
.target Wizzle Brassbolts
.dungeon ZF
step
#label EnterZF
.goto Tanaris,38.91,20.78,40,0
.goto Tanaris,38.731,19.839
.subzone 978,2 >>进入祖尔法拉克
.dungeon ZF
step
#completewith Gahzrilla
>>击杀|cRXP_ENEMY_巨魔|r. 掠夺他们以获得|cRXP_LOOT_巨魔调和剂|r
.complete 3042,1 
.isOnQuest 3042
.dungeon ZF
step
#completewith next
>>击杀|cRXP_ENEMY_圣甲虫|r. 击败它们后 loot 出其|cRXP_LOOT_完整的圣甲虫壳|r
.complete 2865,1 
.isOnQuest 2865
.dungeon ZF
step
>>击杀 |cRXP_ENEMY_殉教者泰卡|r. 从他身上搜刮 |cRXP_LOOT_第一块莫斯哈鲁石碑|r|r
.complete 3527,1 
.mob Theka the Martyr
.isOnQuest 3527
.dungeon ZF
step
>>击杀|cRXP_ENEMY_圣甲虫|r. 击败它们后 loot 出其|cRXP_LOOT_完整的圣甲虫壳|r
.complete 2865,1 
.isOnQuest 2865
.dungeon ZF
step
#completewith next
+攀登金字塔
>>击杀|cRXP_ENEMY_沙怒刽子手|r. 击败他后搜刮出|cRXP_LOOT_沙怒刽子手的钥匙|r
>>|cRXP_WARN_小队中的任何成员均可拾取|r|cRXP_LOOT_Key|r
>>|cRXP_WARN_使用|r|cRXP_LOOT_刽子手之钥|r|cRXP_WARN_在其中一个|cRXP_PICK_巨魔囚笼|r上, 以解救|cRXP_FRIENDLY_布莱中士|r及其部下|r
.collect 8444,1 
.disablecheckbox
.isOnQuest 2768
.mob Sandfury Executioner
.dungeon ZF
step
>>保卫|cRXP_FRIENDLY_布莱中士|r及其小队, 短暂休息后随他们一同前进
>>击杀 |cRXP_ENEMY_耐克鲁姆|r. 进食并饮水后, 与 |cRXP_FRIENDLY_布莱中士|r交谈以挑战他
>>击杀|cRXP_ENEMY_布莱中士|r. 击败他后搜刮|cRXP_LOOT_探水棒|r
.complete 2768,1 
.isOnQuest 2768
.skipgossip
.dungeon ZF
step
>>击杀 |cRXP_ENEMY_水占师维蕾萨|r. 击败她后拾取 |cRXP_LOOT_深渊皇冠|r和 |cRXP_LOOT_第二块莫沙鲁石板|r
.complete 2846,1 
.complete 3527,2 
.mob Hydromancer Velratha
.isOnQuest 2846
.isOnQuest 3527
.dungeon ZF
step
>>击杀|cRXP_ENEMY_水占师维蕾萨|r. 击败她以获取|cRXP_LOOT_深渊皇冠|r
.complete 2846,1 
.mob Hydromancer Velratha
.isOnQuest 2846
.dungeon ZF
step
>>击杀|cRXP_ENEMY_水占师维蕾萨|r. 击败她后拾取|cRXP_LOOT_第二块莫沙鲁石碑|r
.complete 3527,2 
.mob Hydromancer Velratha
.isOnQuest 3527
.dungeon ZF
step
#label Gahzrilla
>>|cRXP_WARN_使用|r|T133056:0|t[祖尔法拉克之槌] |cRXP_WARN_对 |cRXP_PICK_祖尔法拉克铁锣|r施放, 召唤|r|cRXP_ENEMY_加兹瑞拉|r
>>击杀|cRXP_ENEMY_加兹瑞拉|r. 击败他后搜刮|cRXP_LOOT_充电的鳞片|r
>>|cRXP_WARN_如果您的小队中没有人拥有|r|T133056:0|t[祖尔法拉克之槌]|cRXP_WARN_, 您将无法召唤|r|cRXP_ENEMY_加兹瑞拉|r
.complete 2770,1 
.mob Gahz'rilla
.isOnQuest 2770
.dungeon ZF
step
>>击杀|cRXP_ENEMY_巨魔|r. 掠夺他们以获得|cRXP_LOOT_巨魔调和剂|r
.complete 3042,1 
.isOnQuest 3042
.dungeon ZF
step
.hs >>炉石返回加基森
.use 6948
.cooldown item,6948,>0
.dungeon ZF
.zoneskip Tanaris
step
.goto Tanaris,51.413,28.752
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦顿·轻锤|r交谈
.turnin 3042 >>交任务: |cRXP_FRIENDLY_巨魔调和剂|r
.target Trenton Lighthammer
.isQuestComplete 3042
.dungeon ZF
step
.goto Tanaris,52.462,28.514
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席工程师沙克斯·比格维兹|r交谈
.turnin 2768 >>交任务: |cRXP_FRIENDLY_探水棒|r
.target Chief Engineer Bilgewhizzle
.isQuestComplete 2768
.dungeon ZF
step
.goto Tanaris,51.566,26.759
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特兰雷克|r交谈
.turnin 2865 >>交任务: |cRXP_FRIENDLY_圣甲虫的壳|r
.target Tran'rek
.isQuestComplete 2865
.dungeon ZF
step
.goto Tanaris,52.40,28.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Bilgewhizzle|r 交谈
.accept 864 >>接任务: |cRXP_LOOT_向药剂师金格回报|r
.target Chief Engineer Bilgewhizzle
.isQuestTurnedIn 654
step
#completewith next
.goto Tanaris,66.989,22.354,100 >>前往热砂港
.dungeon ZF
step
.goto Tanaris,66.989,22.354
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Yeh'kinya|r交谈
.turnin 3527 >>交任务: |cRXP_FRIENDLY_摩沙鲁的预言|r
.target Yeh'kinya
.isQuestComplete 3527
.dungeon ZF
step
.goto Tanaris,66.989,22.354
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Yeh'kinya|r交谈
.accept 4787 >>接任务: |cRXP_WARN_远古之卵|r
.target Yeh'kinya
.isQuestTurnedIn 3527
.dungeon ZF
step
#completewith next
.zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
.dungeon ZF
step
.goto Thousand Needles,78.143,77.120
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维兹尔·铜栓|r谈话
.turnin 2770 >>交任务: |cRXP_FRIENDLY_加兹瑞拉|r
.target Wizzle Brassbolts
.isQuestComplete 2770
.dungeon ZF
step
#optional
.abandon 2770 >>放弃加兹瑞拉
.dungeon ZF
step
#completewith DWMpickups2
.goto Tanaris,51.60,25.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Brackenwall >>飞往尘泥沼泽
.target Bulkrek Ragefist
.zoneskip Dustwallow Marsh
step
.goto Dustwallow Marsh,37.10,33.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Draz'Zilb|r交谈
.accept 1170 >>接任务: |cRXP_LOOT_奥妮克希亚的血脉|r
.target Draz'Zilb
step
.goto Dustwallow Marsh,36.30,31.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫克·莫洛克|r交谈
.turnin 1170 >>交任务: |cRXP_FRIENDLY_奥妮克希亚的血脉|r
.accept 1171 >>接任务: |cRXP_LOOT_奥妮克希亚的血脉|r
.target Overlord Mok'Morokk
step
.goto Dustwallow Marsh,37.10,33.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Draz'Zilb|r交谈
.turnin 1171 >>交任务: |cRXP_FRIENDLY_奥妮克希亚的血脉|r
.accept 1172 >>接任务: |cRXP_LOOT_奥妮克希亚的血脉|r
.target Draz'Zilb
step
#completewith next
.goto Dustwallow Marsh,32.28,65.54,30,0
.subzone 498 >>向南前往血沼洞穴
step
.goto Dustwallow Marsh,31.10,66.10
>>进入洞穴, 然后点击岩石上的|cRXP_PICK_发霉的卷轴|r
>>|cRXP_WARN_请小心, 因为该区域怪物刷新频率极高|r
.turnin 625 >>交任务: |cRXP_FRIENDLY_科泰罗的谜题|r
.accept 626 >>接任务: |cRXP_LOOT_科泰罗的谜题|r
.isOnQuest 625
.group
step
#loop
.goto Dustwallow Marsh,53.6,72.5,0
.goto Dustwallow Marsh,48.50,75.30,25,0
.goto Dustwallow Marsh,55.9,81.9,25,0
.goto Dustwallow Marsh,53.6,72.5,25,0
>>点击|cRXP_PICK_奥妮克希亚|r以摧毁它们
.complete 1172,1 
step
.goto Dustwallow Marsh,46.021,57.096
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔贝萨|r交谈
.turnin 2846 >>交任务: |cRXP_FRIENDLY_深渊皇冠|r
.target Tabetha
.isQuestComplete 2846
.dungeon ZF
step
.goto Dustwallow Marsh,48.50,75.30
.xp 47+118800 >>升级至47级+118800

step
#completewith next
.goto Dustwallow Marsh,36.1,30.7,30,0
.subzone 496 >>前往北方的蕨墙村
step
.goto Dustwallow Marsh,37.15,33.08
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Draz'Zilb|r交谈
.turnin 1172 >>交任务: |cRXP_FRIENDLY_奥妮克希亚的血脉|r
.target Draz'Zilb
step
#completewith next
.goto Dustwallow Marsh,36.30,31.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫克·莫洛克|r交谈
>>|cRXP_WARN_接受此任务后, 将遭遇|r|cRXP_ENEMY_Overlord Mok'Morokk|r|cRXP_WARN_敌对. 他伤害极高, 应采取风筝战术. 请做好准备|r
.accept 1173 >>接任务: |cRXP_LOOT_挑战莫格穆洛克|r
.unitscan Overlord Mok'Morokk
.group
step
.goto Dustwallow Marsh,36.30,31.50
>>击败|cRXP_ENEMY_Overlord Mok'Morokk|r, 将其血量降至约30%
>>|cRXP_WARN_他伤害极高, 应采用风筝打法|r
>>|cRXP_WARN_他令人畏惧|r << Warlock/Priest
.complete 1173,1 
.unitscan Overlord Mok'Morokk
.group 3
step
.goto Dustwallow Marsh,36.30,31.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫克·莫洛克|r交谈
>>|cRXP_WARN_请勿接受此任务的后续内容. |r|cRXP_FRIENDLY_Mok'Morokk|r|cRXP_WARN_将转为敌对状态并可能杀死你|r
.turnin 1172 >>交任务: |cRXP_FRIENDLY_奥妮克希亚的血脉|r
.unitscan Overlord Mok'Morokk
.solo
step
.goto Dustwallow Marsh,37.10,33.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Draz'Zilb|r交谈
.turnin 1173 >>交任务: |cRXP_FRIENDLY_挑战莫格穆洛克|r
.target Draz'Zilb
.isQuestComplete 1173
.group
step << Mage
.cast 3566 >>施放 |T135765:0|t[传送:雷霆崖]
.zoneskip Thunder Bluff
.isOnQuest 2967
.dungeon ULDA
step << !Mage
.goto Dustwallow Marsh,35.57,31.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙尔迪|r交谈
.fly Thunder Bluff>>前往: |cRXP_PICK_雷霆崖|r
.target Shardi
.zoneskip Thunder Bluff
.isOnQuest 2967
.dungeon ULDA
step
.goto Thunder Bluff,75.67,31.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与纳拉(|cRXP_FRIENDLY_Nara|r)交谈
.turnin 2967 >>交任务: |cRXP_FRIENDLY_返回雷霆崖|r
.accept 2968 >>接任务: |cRXP_WARN_进一步的任务|r
.target Nara Wildmane
.isQuestTurnedIn 2954
.dungeon ULDA
step
.goto Thunder Bluff,34.42,46.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sage|r交谈
.turnin 2968 >>交任务: |cRXP_FRIENDLY_进一步的任务|r
.target Sage Truthseeker
.isQuestTurnedIn 2954
.dungeon ULDA
step << Hunter
.goto Thunder Bluff,59.11,86.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 14304 >>训练你的职业法术
.target Urek Thunderhorn
.xp <46,1
.xp >48,1
.zoneskip Thunder Bluff,1
.dungeon ULDA
step << Hunter
#optional
.goto Thunder Bluff,59.11,86.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 14321 >>训练你的职业法术
.target Urek Thunderhorn
.xp <48,1
.zoneskip Thunder Bluff,1
.dungeon ULDA
step << Hunter
.goto Thunder Bluff,54.08,84.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hesuwa|r交谈
.train 24562 >>训练你的宠物法术
.target Hesuwa Thunderhorn
.xp <48,1
.zoneskip Thunder Bluff,1
.dungeon ULDA
step << Warrior
.goto Thunder Bluff,57.56,85.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
.train 11578 >>训练你的职业法术
.target Ker Ragetotem
.xp <46,1
.xp >48,1
.zoneskip Thunder Bluff,1
.dungeon ULDA
step << Warrior
#optional
.goto Thunder Bluff,57.56,85.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
.train 20661 >>训练你的职业法术
.target Ker Ragetotem
.xp <48,1
.zoneskip Thunder Bluff,1
.dungeon ULDA
step << Druid
.goto Thunder Bluff,76.46,27.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
.train 9823 >>训练你的职业法术
.target Turak Runetotem
.xp <46,1
.xp >48,1
.zoneskip Thunder Bluff,1
.dungeon ULDA
step << Druid
#optional
.goto Thunder Bluff,76.46,27.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
.train 22828 >>训练你的职业法术
.target Turak Runetotem
.xp <48,1
.zoneskip Thunder Bluff,1
.dungeon ULDA
step << !Mage
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Orgrimmar >>飞往奥格瑞玛
.target Tal
.zoneskip Thunder Bluff,1
.dungeon ULDA
step << !Mage
.goto Dustwallow Marsh,35.57,31.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙尔迪|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.target Shardi
.zoneskip Dustwallow Marsh,1
step << Mage
.cast 3567 >>施放 |T135759:0|t[传送:奥格瑞玛]
.zoneskip Orgrimmar
step << Mage
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 10197 >>训练你的职业法术
.target Pephredo
.xp <46,1
.xp >48,1
step << Mage
#optional
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 10215 >>训练你的职业法术
.target Pephredo
.xp <48,1
step << Priest
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 10945 >>训练你的职业法术
.target Ur'kyo
.xp <46,1
.xp >48,1
step << Priest
#optional
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 10899 >>训练你的职业法术
.target Ur'kyo
.xp <48,1
step << Shaman
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 10586 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <46,1
.xp >48,1
step << Shaman
#optional
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 10431 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <48,1
step << Rogue
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 11293 >>训练你的职业法术
.target Ormok
.xp <46,1
.xp >48,1
step << Rogue
#optional
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 11299 >>训练你的职业法术
.target Ormok
.xp <48,1
step << Rogue
.goto Orgrimmar,42.10,49.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔交谈|r
.vendor >>|cRXP_BUY_储备闪光粉和毒药|r
.target Rekkul
step << Warlock
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 11699 >>训练你的职业法术
.target Mirket
.xp <46,1
.xp >48,1
step << Warlock
#optional
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 11712 >>训练你的职业法术
.target Mirket
.xp <48,1
step << Warlock
.goto Orgrimmar,47.52,46.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈
.vendor >>提升宠物的技能
.target Kurgul
step
.goto Orgrimmar,56.40,46.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zilzibin|r交谈
>>|cRXP_WARN_他位于龙脊山的上层|r
.turnin 32 >>交任务: |cRXP_FRIENDLY_异种蝎的威胁|r
.target Zilzibin Drumlore
step
.goto Orgrimmar,59.40,36.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dran|r交谈
.accept 649 >>接任务: |cRXP_LOOT_寻找蜜酒|r
.target Dran Droffers
step
.goto Orgrimmar,59.50,36.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔顿|r交谈
.turnin 649 >>交任务: |cRXP_FRIENDLY_寻找蜜酒|r
.accept 650 >>接任务: |cRXP_LOOT_寻找蜜酒|r
.target Malton Droffers
step
.goto Orgrimmar,55.52,34.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jes'rimon|r交谈
>>|cRXP_WARN_他位于建筑顶部|r
.accept 4300 >>接任务: |cRXP_LOOT_骨刃武器|r
.target Jes'rimon
step << Hunter
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14304 >>训练你的职业法术
.target Ormak Grimshot
.xp <46,1
.xp >48,1
step << Hunter
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14321 >>训练你的职业法术
.target Ormak Grimshot
.xp <48,1
step << Hunter
#optional
.goto Orgrimmar,66.33,14.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xao'tsu|r交谈
.train 24562 >>训练你的宠物法术
.target Xao'tsu
.xp <48,1
step << Warrior
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 11578 >>训练你的职业法术
.target Grezz Ragefist
.xp <46,1
.xp >48,1
step << Warrior
#optional
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 20661 >>训练你的职业法术
.target Grezz Ragefist
.xp <48,1
step << Orc !Warlock
.goto Orgrimmar,69.40,13.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔达|r和|cRXP_FRIENDLY_奥古纳罗|r交谈
.train 825 >>驯兽 |T136103:0|t[狼骑术]
.vendor >>|cRXP_BUY_购买|r|T132224:0|t[|cFF0070FF狼|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Kildar
.target Ogunaro
step << Troll
#completewith next
.subzone 367 >>前往森金村
step << Troll
.goto Durotar,55.28,75.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xar'Ti|r和|cRXP_FRIENDLY_祖尼尔|r交谈
.train 10861 >>训练 |T136103:0|t[迅猛龙骑术]
.vendor >>|cRXP_BUY_购买|r|T132253:0|t[|cFF0070FF迅猛龙|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Xar'Ti
.target Zjolnir
step << !Mage
#completewith next
.zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
.zoneskip Durotar
step << !Mage
.goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
.zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
.zoneskip Tirisfal Glades
step << Mage
.cast 3563 >>传送 |T135766:0|t[传送:幽暗城]
.zoneskip Undercity
step
#optional
.abandon 2846 >>放弃深渊皇冠
.isOnQuest 2846
.dungeon ZF
step
#optional
.abandon 3527 >>放弃摩沙鲁的预言
.isOnQuest 3527
.dungeon ZF
step
#optional
.abandon 2768 >>放弃探水棒
.isOnQuest 2768
.dungeon ZF
step
#optional
.abandon 3042 >>放弃巨魔调和剂
.isOnQuest 3042
.dungeon ZF
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 49-50 辛特兰
#displayname 49-50 辛特兰 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 40-50
#next 50-51 菲拉斯
step << Mage
.goto Undercity,82.79,15.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉娜|r交谈
.vendor >>至少购买四个|cRXP_BUY_传送符文|r
.collect 17031,4 
.target Hannah Akeley
step
.goto Undercity,73.20,32.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰|r交谈
.accept 2995 >>接任务: |cRXP_LOOT_通讯路线|r
.target Oran Snakewrithe
step
#completewith next
.goto Undercity,47.20,59.69,0
.goto Undercity,47.20,59.69,12,0
.goto Undercity,43.55,68.11,12,0
.goto Undercity,45.20,71.67,12 >>前往|cRXP_FRIENDLY_Zinge|r
.isOnQuest 864
step
.goto Undercity,50.00,68.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zinge|r交谈
.turnin 864 >>交任务: |cRXP_FRIENDLY_向药剂师金格回报|r
.target Apothecary Zinge
.isOnQuest 864
step
.goto Undercity,53.77,54.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bel'dugur|r交谈
.turnin 728 >>交任务: |cRXP_FRIENDLY_远赴幽暗城|r
.target Keeper Bel'dugur
.isOnQuest 728
.dungeon ULDA
step
.goto Undercity,62.31,48.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕特里克|r交谈
.turnin 2342 >>交任务: |cRXP_FRIENDLY_失而复得|r
.target Patrick
.dungeon ULDA
.isQuestComplete 2342
step
#ah
.goto Undercity,64.20,49.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
.collect 4589,10,7842,1 >>|cRXP_BUY_购买|r|T135992:0|t[细长的狮鹫羽毛]|cRXP_BUY_从拍卖行|r
.target Auctioneer Rhyker
step << Undead !Warlock
#completewith next
.subzone 159 >>前往布瑞尔
step << Undead !Warlock
.goto Tirisfal Glades,60.09,52.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velma|r和|cRXP_FRIENDLY_Zachariah|r交谈
.train 10906 >>训练 |T136103:0|t[亡灵骑术]
.vendor >>|cRXP_BUY_购买|r|T132264:0|t[|cFF0070FF骸骨战马|r]
.xp <40,1
.money <90
.skill riding,75,1
.target Velma Warnam
.target Zachariah Post
step
#label FlyTM1
.goto Undercity,63.27,48.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
.fly Tarren Mill >>飞往塔伦米尔
.target Michael Garrett
.zoneskip Hillsbrad Foothills
step
#optional
.abandon 2342 >>放弃失而复得的宝藏
.isOnQuest 2342
step
.goto Hillsbrad Foothills,61.53,19.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与莱登交谈|cRXP_FRIENDLY_Lydon|r
.accept 2934 >>接任务: |cRXP_LOOT_完好无损的毒囊|r
.target Apothecary Lydon
step
.goto Hillsbrad Foothills,86.60,29.49,30,0
.goto The Hinterlands,9.7,55.8
.zone The Hinterlands >>前往: |cRXP_PICK_辛特兰|r, 沿着敦霍尔德城堡东北部的山路进入
step
#completewith AtalalExile
.goto The Hinterlands,35.9,63.9,40,0
.subzone 353 >>前往东南方向的沙德拉奥尔
step
#completewith AtalalExile
>>击杀|cRXP_ENEMY_枯木巢穴守卫|r. 击败后可掠夺获得|cRXP_LOOT_完好无损的毒囊|r
>>|cRXP_WARN_|r |cRXP_LOOT_完好无损的毒囊|r|cRXP_WARN_持续时间为30分钟, 请尽快提交|r
.complete 2934,1 
.mob Witherbark Broodguard
step
.goto The Hinterlands,33.751,75.210
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Atal'ai Exile|r交谈
.turnin 1429 >>交任务: |cRXP_FRIENDLY_阿塔莱流放者|r
.accept 1444 >>接任务: |cRXP_WARN_向费泽鲁尔复命|r
.accept 1446 >>接任务: |cRXP_WARN_预言者迦玛兰|r
.target Atal'ai Exile
.dungeon ST
step
#label AtalalExile
.goto The Hinterlands,33.70,75.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿塔莱流亡者|r交谈
.turnin 1429 >>交任务: |cRXP_FRIENDLY_阿塔莱流放者|r
.accept 1444 >>接任务: |cRXP_WARN_向费泽鲁尔复命|r
.target Atal'ai Exile
step
#loop
.goto The Hinterlands,33.19,69.66,0
.goto The Hinterlands,36.28,68.43,60,0
.goto The Hinterlands,34.16,67.00,60,0
.goto The Hinterlands,33.19,69.66,60,0
.goto The Hinterlands,30.66,69.71,60,0
.goto The Hinterlands,32.08,73.36,60,0
.goto The Hinterlands,35.48,74.42,60,0
.goto The Hinterlands,35.32,70.90,60,0
.goto The Hinterlands,35.79,64.35,60,0
.goto The Hinterlands,33.19,69.66,60,0
>>击杀|cRXP_ENEMY_枯木巢穴守卫|r. 击败后可掠夺获得|cRXP_LOOT_完好无损的毒囊|r
>>|cRXP_WARN_|r |cRXP_LOOT_完好无损的毒囊|r|cRXP_WARN_持续时间为30分钟, 请尽快提交|r
.complete 2934,1 
.mob Witherbark Broodguard
step
#completewith next
.goto Hillsbrad Foothills,60.8,21.2,60,0
.subzone 272 >>前往内陆之外, 返回塔伦米尔
step
.goto Hillsbrad Foothills,61.53,19.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与莱登交谈|cRXP_FRIENDLY_Lydon|r
>>|cRXP_WARN_|r |cRXP_LOOT_完好无损的毒囊|r|cRXP_WARN_持续时间为30分钟, 请尽快提交|r
.turnin 2934 >>交任务: |cRXP_FRIENDLY_完好无损的毒囊|r
.target Apothecary Lydon










step
.goto The Hinterlands,26.70,48.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沃拉丁|r交谈
.turnin 650 >>交任务: |cRXP_FRIENDLY_寻找蜜酒|r
.accept 77 >>接任务: |cRXP_LOOT_收集蜜糖|r
.target Gilveradin Sunchaser
step
#completewith next
.subzone 3317 >>前往恶齿村
step
#label ViHo
.goto The Hinterlands,77.52,80.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Slagtree|r交谈
.accept 7839 >>接任务: |cRXP_LOOT_邪枝窃贼|r
.target Smith Slagtree
step
.goto The Hinterlands,78.20,81.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉尔德|r交谈
.accept 7840 >>接任务: |cRXP_LOOT_拉尔德的午餐|r
.target Lard
step
.goto The Hinterlands,80.40,81.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Katoom|r交谈
.accept 7815 >>接任务: |cRXP_LOOT_钳嘴龟！|r
.accept 7816 >>接任务: |cRXP_LOOT_加莫里塔！|r
.target Katoom the Angler
step << Hunter
#completewith next
.goto The Hinterlands,79.10,79.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Markhor|r交谈
.stable >>驯服你的宠物. 你将很快驯服一只|cRXP_ENEMY_海水钳嘴龟|r
.target Huntsman Markhor
step << Hunter
#loop
.goto The Hinterlands,80.00,58.80,0
.goto The Hinterlands,80.00,58.80,50,0
.goto The Hinterlands,77.20,61.80,50,0
.goto The Hinterlands,77.20,64.20,50,0
.goto The Hinterlands,74.80,68.60,50,0
.goto The Hinterlands,75.60,72.00,50,0
.goto The Hinterlands,78.20,69.20,50,0
.goto The Hinterlands,78.00,64.20,50,0
>>|cRXP_WARN_施放|r|T132164:0|t[驯服野兽]|cRXP_WARN_对一只|cRXP_ENEMY_海水钳嘴龟|r进行驯服|r 
.train 17267 >>|cRXP_WARN_用它攻击怪物来学习|r|T132278:0|t[咬击(等级 7)]
.link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
.mob Saltwater Snapjaw
step << Hunter
.goto The Hinterlands,79.10,79.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Markhor|r交谈
.stable >>放弃|cRXP_ENEMY_海水钳嘴龟|r并取回你的普通宠物
.target Huntsman Markhor
.train 17267,3
.zoneskip The Hinterlands,1
step
#completewith Gammerita
>>沿着海岸掠夺|cRXP_PICK_紫葡萄酒瓶子|r
.complete 580,1 
step
#completewith next
>>击杀|cRXP_ENEMY_海水钳嘴龟|r
.complete 7815,1 
.mob Saltwater Snapjaw
step
#label Gammerita
#loop
.goto The Hinterlands,78.83,76.26,0
.goto The Hinterlands,81.87,49.36,70,0
.goto The Hinterlands,79.86,60.32,70,0
.goto The Hinterlands,78.54,67.85,70,0
.goto The Hinterlands,79.14,71.45,70,0
.goto The Hinterlands,77.47,75.83,70,0
.goto The Hinterlands,78.83,76.26,70,0
>>击杀|cRXP_ENEMY_加莫里塔|r. 击败她以获取|cRXP_LOOT_卡图姆的最佳诱饵|r
>>|cRXP_WARN_她沿海岸巡逻. 风筝引她至守卫处. 若无法持续重新释放她, 就等她靠近村庄时再行动|r
.complete 7816,1 
.unitscan Gammerita
step
>>点击瀑布下方的|cRXP_PICK_科泰罗的谜题|r
.goto The Hinterlands,80.80,46.80
.turnin 626 >>交任务: |cRXP_FRIENDLY_科泰罗的谜题|r
.isOnQuest 626
.group
step
.goto The Hinterlands,84.40,41.30
>>点击|cRXP_PICK_拉尔德的午餐篮|r. 击杀出现的3个|cRXP_ENEMY_邪枝绑架者|r. 从其中一人身上拾取|cRXP_LOOT_拉尔德的午餐|r
>>|cRXP_WARN_所有怪物都有“处决”技能. 执行此任务时要格外小心, 尽量不要让自己的血量降到20%以下|r
.complete 7840,1 
.unitscan Vilebranch Kidnapper
step
#completewith next
>>沿着海岸掠夺|cRXP_PICK_紫葡萄酒瓶子|r
.complete 580,1 
step
#loop
.goto The Hinterlands,80.00,58.80,0
.goto The Hinterlands,80.00,58.80,50,0
.goto The Hinterlands,77.20,61.80,50,0
.goto The Hinterlands,77.20,64.20,50,0
.goto The Hinterlands,74.80,68.60,50,0
.goto The Hinterlands,75.60,72.00,50,0
.goto The Hinterlands,78.20,69.20,50,0
.goto The Hinterlands,78.00,64.20,50,0
>>击杀|cRXP_ENEMY_海水钳嘴龟|r
.complete 7815,1 
.mob Saltwater Snapjaw
step
#loop
.goto The Hinterlands,78.83,76.26,0
.goto The Hinterlands,79.86,60.32,80,0
.goto The Hinterlands,78.54,67.85,80,0
.goto The Hinterlands,79.14,71.45,80,0
.goto The Hinterlands,77.47,75.83,80,0
.goto The Hinterlands,78.83,76.26,80,0
>>沿着海岸掠夺|cRXP_PICK_紫葡萄酒瓶子|r
.complete 580,1 
step
#completewith next
.goto The Hinterlands,77.28,78.64,100,0
.subzone 3317 >>前往恶齿村
step
.goto The Hinterlands,80.30,81.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Katoom|r交谈
.turnin 7815 >>交任务: |cRXP_FRIENDLY_钳嘴龟！|r
.turnin 7816 >>交任务: |cRXP_FRIENDLY_加莫里塔！|r
.target Katoom the Angler
step
.goto The Hinterlands,78.20,81.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉尔德|r交谈
.turnin 7840 >>交任务: |cRXP_FRIENDLY_拉尔德的午餐|r
.target Lard
step
.goto The Hinterlands,78.80,78.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Yayo'jin|r交谈
.accept 7844 >>接任务: |cRXP_LOOT_野蛮的亲戚|r
.target Mystic Yayo'jin
step
.goto The Hinterlands,79.40,79.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Otho|r交谈
.accept 7841 >>接任务: |cRXP_LOOT_给蛮锤部族的警告|r
.target Otho Moji'ko
step
.goto The Hinterlands,79.10,79.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Markhor|r交谈
.accept 7828 >>接任务: |cRXP_LOOT_银鬃捕猎者|r
.accept 7829 >>接任务: |cRXP_LOOT_野蛮的枭兽|r
.accept 7830 >>接任务: |cRXP_LOOT_死者的复仇|r
.target Huntsman Markhor
step
#completewith Bucket
>>击杀|cRXP_ENEMY_银鬃捕猎者|r
.complete 7828,1 
.mob Silvermane Stalker
step
#completewith Bucket
.use 9618 >>击杀野蛮的枭兽, 并在其尸体附近使用 |T133841:0|t[野兽灵魂精华容器]
>>|cRXP_WARN_此物品有冷却时间, 且每次只能作用于一具尸体, 即使它们堆叠在一起|r
.complete 7829,1 
.complete 3123,1 
.mob Savage Owlbeast
step
#completewith Bucket
>>击杀|cRXP_ENEMY_Vilebranch 邪枝割颅者|r和|cRXP_ENEMY_Vilebranch 邪枝占卜者|r
>>|cRXP_ENEMY_邪枝割颅者|r|cRXP_WARN_有处决技能. 执行此任务时要格外小心, 尽量不要让自己的血量降到20%以下|r
.complete 7844,1 
.mob +Vilebranch Scalper
.complete 7844,2 
.mob +Vilebranch Soothsayer
step
#label Bucket
#loop
.goto The Hinterlands,72.53,52.92,0
.goto The Hinterlands,72.53,52.92,25,0
.goto The Hinterlands,71.14,48.64,25,0
.goto The Hinterlands,66.09,44.71,25,0
.goto The Hinterlands,57.57,42.50,25,0
.goto The Hinterlands,53.18,39.20,25,0
>>战利品|cRXP_PICK_斯拉提的工具|r(一个小桶)
>>|cRXP_WARN_桶可能出现在5个位置|r
.complete 7839,1 
step
#completewith next
.goto The Hinterlands,58.7,41.9,50,0
.subzone 351 >>向西北方向前进, 然后进入洞穴, 斯洛克岩窟
step
.goto The Hinterlands,57.50,39.50,20,0
.goto The Hinterlands,56.5,43.9
>>掠夺|cRXP_PICK_部落补给箱|r以获取其|cRXP_LOOT_辛特兰蜜糖|r
.complete 77,1 
step
#completewith QuelDanilLodge
.use 9618 >>击杀野蛮的枭兽, 并在其尸体附近使用 |T133841:0|t[野兽灵魂精华容器]
>>|cRXP_WARN_此物品有冷却时间, 且每次只能作用于一具尸体, 即使它们堆叠在一起|r
.complete 7829,1 
.complete 3123,1 
.mob Savage Owlbeast
step
#completewith next
>>击杀|cRXP_ENEMY_银鬃嗥狼|r
.complete 7828,2 
.mob Silvermane Howler
step
#label QuelDanilLodge
.goto The Hinterlands,31.06,47.84,50,0
.subzone 350 >>向西前往奎尔丹尼小屋
.isOnQuest 7841
step
#requires QuelDanilLodge
#completewith Escort
>>击杀|cRXP_ENEMY_Highvale 高等精灵|r
>>|cRXP_WARN_注意你的健康！|r|cRXP_ENEMY_高原游侠|r|cRXP_WARN_会施放妖火, 使逃脱更加困难|c|r << Rogue
.complete 7841,1 
.mob +Highvale Scout
.complete 7841,2 
.mob +Highvale Outrunner
.complete 7841,3 
.mob +Highvale Ranger
.complete 7841,4 
.mob +Highvale Marksman
step
.goto The Hinterlands,29.60,48.70
>>点击地面上的|cRXP_PICK_高原精灵笔记|r
.complete 2995,2 
step
.goto The Hinterlands,28.60,46.10
>>点击桌上的|cRXP_PICK_高原精灵报告|r
.complete 2995,3 
step
.goto The Hinterlands,32.00,46.90
>>点击地面上的|cRXP_PICK_高原精灵记录|r
.complete 2995,1 
step
.goto The Hinterlands,30.73,46.97
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|Rin'ji|cRXP_FRIENDLY_Rin'ji|r交谈
>>|cRXP_WARN_这将开启护送任务！|r
.accept 2742,1 >>接任务: |cRXP_LOOT_林吉被困住了！|r
.target Rin'ji
step
#label Escort
.goto The Hinterlands,34.98,56.92
>>护送|cRXP_FRIENDLY_Rin'ji|r
.complete 2742,1 
step
#loop
.goto The Hinterlands,33.00,51.60,0
.goto The Hinterlands,33.00,51.60,50,0
.goto The Hinterlands,30.40,51.00,50,0
.goto The Hinterlands,29.60,48.60,50,0
.goto The Hinterlands,28.60,46.60,50,0
.goto The Hinterlands,29.60,48.60,50,0
.goto The Hinterlands,32.20,47.60,50,0
.goto The Hinterlands,32.60,43.60,50,0
.goto The Hinterlands,33.80,44.80,50,0
.goto The Hinterlands,33.80,48.60,50,0
>>完成击杀|cRXP_ENEMY_Highvale 高等精灵|r
>>|cRXP_WARN_注意你的健康；|r |cRXP_ENEMY_高原游侠|r |cRXP_WARN_会施放妖术火焰, 使逃脱更加困难|r << Rogue
.complete 7841,1 
.mob +Highvale Scout
.complete 7841,2 
.mob +Highvale Outrunner
.complete 7841,3 
.mob +Highvale Ranger
.complete 7841,4 
.mob +Highvale Marksman
step
#completewith Tragan
>>击杀|cRXP_ENEMY_银鬃嗥狼|r
.complete 7828,2 
.mob Silvermane Howler
step
.goto The Hinterlands,26.61,48.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沃拉丁|r交谈
.turnin 77 >>交任务: |cRXP_FRIENDLY_收集蜜糖|r
.accept 81 >>接任务: |cRXP_LOOT_送回蜜酒|r
.target Gilveradin Sunchaser
step
#completewith JinthaAlor
+|cRXP_WARN_你现在应该开始寻找一支队伍去完成金塔阿尔洛任务(5人组)
.group
step
#label Tragan
.goto The Hinterlands,40.00,59.90
>>游到池塘底部, 然后拾取|cRXP_PICK_Mushroom|r获得|cRXP_LOOT_紫色水生菇|r
.complete 2641,1 
step
#loop
.goto The Hinterlands,38.80,50.80,0
.goto The Hinterlands,51.00,41.60,60,0
.goto The Hinterlands,51.40,47.80,60,0
.goto The Hinterlands,51.20,57.20,60,0
.goto The Hinterlands,50.60,63.60,60,0
.goto The Hinterlands,49.60,59.80,60,0
.goto The Hinterlands,45.60,58.80,60,0
.goto The Hinterlands,43.20,61.80,60,0
.goto The Hinterlands,39.20,63.20,60,0
.goto The Hinterlands,36.80,58.60,60,0
.goto The Hinterlands,39.40,55.80,60,0
.goto The Hinterlands,38.80,50.80,60,0
.goto The Hinterlands,39.40,46.20,60,0
.goto The Hinterlands,43.40,46.40,60,0
.goto The Hinterlands,38.80,50.80,60,0
>>完成击杀|cRXP_ENEMY_银鬃嗥狼|r
.complete 7828,2 
.mob Silvermane Howler
step
#loop
.goto The Hinterlands,53.27,39.91,0
.goto The Hinterlands,66.28,43.71,0
.goto The Hinterlands,71.13,49.10,0
.goto The Hinterlands,45.60,63.40,0
.goto The Hinterlands,45.60,63.40,50,0
.goto The Hinterlands,44.40,67.00,50,0
.goto The Hinterlands,46.40,68.80,50,0
.goto The Hinterlands,49.60,65.20,50,0
.goto The Hinterlands,50.60,65.80,50,0
.goto The Hinterlands,50.60,62.40,50,0
>>击杀神庙底部周围的|cRXP_ENEMY_邪枝割颅者|r 和|cRXP_ENEMY_邪枝占卜者|r
>>|cRXP_ENEMY_邪枝割颅者|r|cRXP_WARN_有处决技能. 执行此任务时要格外小心, 尽量不要让自己的血量降到20%以下|r
>>|cRXP_WARN_不要去顶端！那里有高等级精英怪|r
.complete 7844,1 
.mob +Vilebranch Scalper
.complete 7844,2 
.mob +Vilebranch Soothsayer
step
#completewith SkylordPlume
>>击杀|cRXP_ENEMY_银鬃捕猎者|r
.complete 7828,1 
.mob Silvermane Stalker
step
#completewith next
.use 9618 >>击杀野蛮的枭兽, 并在其尸体附近使用 |T133841:0|t[野兽灵魂精华容器]
>>|cRXP_WARN_此物品有冷却时间, 且每次只能作用于一具尸体, 即使它们堆叠在一起|r
.complete 7829,1 
.complete 3123,1 
.mob Savage Owlbeast
step
#label SkylordPlume
#loop
.goto The Hinterlands,50.60,53.00,0
.goto The Hinterlands,53.00,56.60,60,0
.goto The Hinterlands,54.00,54.20,60,0
.goto The Hinterlands,56.00,51.60,60,0
.goto The Hinterlands,58.60,53.00,60,0
.goto The Hinterlands,61.00,54.80,60,0
.goto The Hinterlands,64.20,56.60,60,0
.goto The Hinterlands,63.80,53.60,60,0
.goto The Hinterlands,64.60,48.60,60,0
.goto The Hinterlands,66.60,42.60,60,0
.goto The Hinterlands,61.40,42.40,60,0
.goto The Hinterlands,60.60,48.20,60,0
.goto The Hinterlands,59.80,52.20,60,0
.goto The Hinterlands,57.00,50.20,60,0
.goto The Hinterlands,54.60,47.00,60,0
.goto The Hinterlands,51.00,44.00,60,0
.goto The Hinterlands,50.60,53.00,60,0
>>找到并击杀一只|cRXP_ENEMY_翱翔的锋喙狮鹫|r. 从它身上获取其|cRXP_LOOT_羽饰|r
.complete 7830,1 
.unitscan Razorbeak Skylord
step
#completewith Stalkers
.use 9618 >>击杀野蛮的枭兽, 并在其尸体附近使用 |T133841:0|t[野兽灵魂精华容器]
>>|cRXP_WARN_此物品有冷却时间, 且每次只能作用于一具尸体, 即使它们堆叠在一起|r
.complete 7829,1 
.complete 3123,1 
.mob Savage Owlbeast
step
#label Stalkers
#loop
.goto The Hinterlands,70.60,63.40,0
.goto The Hinterlands,70.60,63.40,60,0
.goto The Hinterlands,70.60,57.40,60,0
.goto The Hinterlands,73.20,52.60,60,0
.goto The Hinterlands,69.00,50.60,60,0
.goto The Hinterlands,69.00,45.60,60,0
.goto The Hinterlands,66.60,48.00,60,0
.goto The Hinterlands,63.20,47.80,60,0
.goto The Hinterlands,61.60,41.80,60,0
.goto The Hinterlands,58.60,46.80,60,0
.goto The Hinterlands,56.20,46.80,60,0
.goto The Hinterlands,54.40,44.00,60,0
.goto The Hinterlands,53.60,49.20,60,0
.goto The Hinterlands,53.20,55.60,60,0
.goto The Hinterlands,55.60,51.40,60,0
.goto The Hinterlands,58.60,53.20,60,0
.goto The Hinterlands,60.80,55.60,60,0
.goto The Hinterlands,64.00,54.60,60,0
.goto The Hinterlands,66.60,57.20,60,0
.goto The Hinterlands,68.40,62.60,60,0
>>完成击杀|cRXP_ENEMY_银鬃捕猎者|r
.complete 7828,1 
.mob Silvermane Stalker
step
.goto The Hinterlands,70.60,63.40,0
.goto The Hinterlands,70.60,63.40,60,0
.goto The Hinterlands,70.60,57.40,60,0
.goto The Hinterlands,73.20,52.60,60,0
.goto The Hinterlands,69.00,50.60,60,0
.goto The Hinterlands,69.00,45.60,60,0
.goto The Hinterlands,66.60,48.00,60,0
.goto The Hinterlands,63.20,47.80,60,0
.goto The Hinterlands,61.60,41.80,60,0
.goto The Hinterlands,58.60,46.80,60,0
.goto The Hinterlands,56.20,46.80,60,0
.goto The Hinterlands,54.40,44.00,60,0
.goto The Hinterlands,53.60,49.20,60,0
.goto The Hinterlands,53.20,55.60,60,0
.goto The Hinterlands,55.60,51.40,60,0
.goto The Hinterlands,58.60,53.20,60,0
.goto The Hinterlands,60.80,55.60,60,0
.goto The Hinterlands,64.00,54.60,60,0
.goto The Hinterlands,66.60,57.20,60,0
.goto The Hinterlands,68.40,62.60,60,0
.use 9618 >>击杀野蛮的枭兽, 并在其尸体附近使用 |T133841:0|t[野兽灵魂精华容器]
>>|cRXP_WARN_此物品有冷却时间, 且每次只能作用于一具尸体, 即使它们堆叠在一起|r
.complete 7829,1 
.complete 3123,1 
.mob Savage Owlbeast
step

.goto The Hinterlands,49.30,37.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_自动导航机器人OOX-09/HL|r交谈
.accept 485 >>接任务: |cRXP_LOOT_找到OOX-09/HL！|r
.turnin 485 >>交任务: |cRXP_FRIENDLY_找到OOX-09/HL！|r
.target Homing Robot OOX-09/HL
.itemcount 8704,1 
.use 8704
.solo
step
.goto The Hinterlands,49.35,37.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_自动导航机器人OOX-09/HL|r交谈以开启护送任务
>>|cRXP_WARN_这种护送可能致命. 如果它危及你的任务进程, 请毫不犹豫地放弃|r
.accept 836,1 >>接任务: |cRXP_LOOT_拯救OOX-09/HL！|r
.target Homing Robot OOX-09/HL
.isQuestTurnedIn 485
.solo

step
.goto The Hinterlands,79.47,61.21
>>护送自动导航机器人OOX-09/HL至海岸
>>|cRXP_WARN_这种护送可能致命. 如果它危及你的任务进程, 请毫不犹豫地放弃|r
>>|cRXP_WARN_一群3只46级|r|cRXP_ENEMY_狂暴的枭兽|r|cRXP_WARN_将出现在斯卡尔石块以南的道路旁. 它们在低血量时会进入狂怒状态, 因此请尽量逐个击杀|r
>>|cRXP_WARN_一组 3 个 47 级|r|cRXP_ENEMY_邪枝伏击者|r|cRXP_WARN_ 将在金塔阿洛尔以北的树林中出现. 它们会在你血量低于 20% 时发动处决. 建议使用长时间控制技能(CC), 并让鸡(坦克)吸引其中一到两个, 直到其血量降至约一半|r
.complete 836,1 
.target Homing Robot OOX-09/HL
.mob Marauding Owlbeast
.unitscan Vilebranch Ambusher
.isQuestTurnedIn 485
.solo
step
.goto The Hinterlands,86.30,59.00
>>游到最东边的岛屿, 然后点击 |cRXP_PICK_Rinji's Secret|r
.turnin 2742 >>交任务: |cRXP_FRIENDLY_林吉被困住了！|r
.accept 2782 >>接任务: |cRXP_LOOT_林吉的秘密|r
step
#completewith next
.goto The Hinterlands,77.28,78.64,30,0
.subzone 3317 >>前往恶齿村
step
.goto The Hinterlands,77.20,80.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Slagtree|r交谈
.turnin 7839 >>交任务: |cRXP_FRIENDLY_邪枝窃贼|r
.target Smith Slagtree
step
.goto The Hinterlands,78.80,78.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Yayo'jin|r交谈
.turnin 7844 >>交任务: |cRXP_FRIENDLY_野蛮的亲戚|r
.target Mystic Yayo'jin
step
#label JinthaAlor
.goto The Hinterlands,79.08,78.99
>>点击小屋旁的|cRXP_PICK_作战公告！|r作战公告
>>|cRXP_WARN_这些是5人团队任务|r
.accept 7861 >>接任务: |cRXP_LOOT_通缉：邪恶祭司海克斯和她的爪牙|r
.accept 7862 >>接任务: |cRXP_LOOT_职位空缺：恶齿村卫兵队长|r
.group
step
.goto The Hinterlands,79.30,79.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Otho|r交谈
.turnin 7841 >>交任务: |cRXP_FRIENDLY_给蛮锤部族的警告|r
.target Otho Moji'ko
step
.goto The Hinterlands,79.30,79.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Otho|r交谈
.accept 7842 >>接任务: |cRXP_LOOT_又一个给蛮锤部族的警告|r
.turnin 7842 >>交任务: |cRXP_FRIENDLY_又一个给蛮锤部族的警告|r
.target Otho Moji'ko
.addquestitem 4589,7842
step
.goto The Hinterlands,79.10,79.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Markhor|r交谈
.turnin 7828 >>交任务: |cRXP_FRIENDLY_银鬃捕猎者|r
.turnin 7829 >>交任务: |cRXP_FRIENDLY_野蛮的枭兽|r
.turnin 7830 >>交任务: |cRXP_FRIENDLY_死者的复仇|r
.target Huntsman Markhor
step
#completewith next
.goto The Hinterlands,78.20,81.30,15,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉尔德|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Lard
.group
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Markhor|r和|cRXP_FRIENDLY_Torntusk|r交谈
>>|cRXP_WARN_这些是5人团队任务|r
.accept 7849 >>接任务: |cRXP_LOOT_分离的痛苦|r
.target +Huntsman Markhor
.goto The Hinterlands,79.16,79.53
.accept 7845 >>接任务: |cRXP_LOOT_被绑架的断齿长者！|r
.accept 7850 >>接任务: |cRXP_LOOT_黑暗之瓶|r
.target +Primal Torntusk
.goto The Hinterlands,78.20,81.17
.group
step
#completewith Vilebranchs
>>掠夺地面上的|cRXP_LOOT_污血容器|r
>>|cRXP_WARN_不用担心专注于此；你可以在后续步骤中完成它|r
.complete 7850,1 
.isOnQuest 7850
.group 5
step
#completewith ReKey
>>击杀|cRXP_ENEMY_Vilebranch 恶树枝巨魔|r
>>|cRXP_WARN_不用担心专注于此；你可以在后续步骤中完成它|r
.complete 7862,4 
.mob +Vilebranch Soul Eater
.complete 7862,1 
.mob +Vilebranch Berserker
.complete 7862,3 
.mob +Vilebranch Blood Drinker
.complete 7862,2 
.mob +Vilebranch Shadow Hunter
.isOnQuest 7862
.group 5
step
.goto The Hinterlands,62.1,75.3
>>在坑洞中央拾取|cRXP_PICK_一堆白骨|r, 以获得|cRXP_LOOT_猎人马尔霍尔的骨头|r
.complete 7849,2 
.isOnQuest 7849
.group 5
step
.goto The Hinterlands,58.6,64.9
>>掠夺|cRXP_PICK_颅骨堆|r以获得|cRXP_LOOT_猎人马尔霍尔的头骨|r
.complete 7849,1 
.isOnQuest 7849
.group 5
step
.goto The Hinterlands,59.6,77.8
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断齿长者|r交谈
.turnin 7845 >>交任务: |cRXP_FRIENDLY_被绑架的断齿长者！|r
.accept 7846 >>接任务: |cRXP_LOOT_找回钥匙！|r
.target Elder Torntusk
.isOnQuest 7845
.group
step
.goto The Hinterlands,59.6,77.8
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断齿长者|r交谈
.accept 7846 >>接任务: |cRXP_LOOT_找回钥匙！|r
.target Elder Torntusk
.isQuestTurnedIn 7845
.group
step
#completewith Hitahya
>>击杀|cRXP_ENEMY_Vilebranch 阿曼扎西守卫|r
.complete 7861,2 
.mob Vilebranch Aman'zasi Guard
.isOnQuest 7861
.group
step
.goto The Hinterlands,59.3,78.2
>>击杀|cRXP_ENEMY_劣尸维尔 Hex|r
>>|cRXP_WARN_要特别小心她的诅咒技能, 她可能会频繁使用这个技能|r
.complete 7861,1 
.unitscan Vile Priestess Hexx
.isOnQuest 7861
.group 5
step
#completewith Hitahya
>>|cRXP_WARN_你可以通过跳跃技巧到达上层(无需与众多守卫战斗)|r
.link https://www.youtube.com/watch?v=UPiNtMem9tM >>点击此处查看视频攻略
.group
step
#completewith next
>>击杀获取|cRXP_LOOT_远古之卵|r
.complete 4787,1 
.isQuestTurnedIn 3527
.group 5
step
#label Hitahya
.goto The Hinterlands,57.8,86.8
>>击杀守护者|cRXP_ENEMY_Hitah'ya|r. 从她身上搜刮她的|cRXP_LOOT_Key|r
.complete 7846,1 
.unitscan Hitah'ya the Keeper
.isOnQuest 7846
.group 5
step
.goto The Hinterlands,57.60,86.79
>>击杀获取|cRXP_LOOT_远古之卵|r
.complete 4787,1 
.isQuestTurnedIn 3527
.group 5
step
.goto The Hinterlands,59.6,77.9
>>击杀|cRXP_ENEMY_Vilebranch 阿曼扎西守卫|r
.complete 7861,2 
.mob Vilebranch Aman'zasi Guard
.isOnQuest 7846
.group 5
step
.goto The Hinterlands,59.6,77.9
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断齿长者|r交谈
.turnin 7846 >>交任务: |cRXP_FRIENDLY_找回钥匙！|r
.accept 7847 >>接任务: |cRXP_LOOT_向断齿族长复命|r
.target Elder Torntusk
.isQuestComplete 7846
.group
step
#label ReKey
.goto The Hinterlands,59.6,77.9
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断齿长者|r交谈
.accept 7847 >>接任务: |cRXP_LOOT_向断齿族长复命|r
.target Elder Torntusk
.isQuestTurnedIn 7846
.group
step
#label Vilebranchs
.goto The Hinterlands,60.6,65.4
>>完成击杀|cRXP_ENEMY_Vilebranch Trolls|r
>>|cRXP_ENEMY_噬魂者|r|cRXP_WARN_位于第二层. |r|cRXP_ENEMY_狂战士|r|cRXP_WARN_位于第三层. |r|cRXP_ENEMY_饮血者|r|cRXP_WARN_和|r|cRXP_ENEMY_暗影猎手|r|cRXP_WARN_位于第四层和第五层|r
.complete 7862,4 
.mob +Vilebranch Soul Eater
.complete 7862,1 
.mob +Vilebranch Berserker
.complete 7862,3 
.mob +Vilebranch Blood Drinker
.complete 7862,2 
.mob +Vilebranch Shadow Hunter
.isOnQuest 7862
.group 5
step
.goto The Hinterlands,67.9,73.4
>>完成搜刮地面上的|cRXP_LOOT_污血容器|r
.complete 7850,1 
.isOnQuest 7850
.group 5
step

.goto The Hinterlands,49.30,37.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_自动导航机器人OOX-09/HL|r交谈
.accept 485 >>接任务: |cRXP_LOOT_找到OOX-09/HL！|r
.turnin 485 >>交任务: |cRXP_FRIENDLY_找到OOX-09/HL！|r
.target Homing Robot OOX-09/HL
.itemcount 8704,1 
.use 8704
.group
step
.goto The Hinterlands,49.35,37.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_自动导航机器人OOX-09/HL|r交谈以开启护送任务
>>|cRXP_WARN_这种护送可能致命. 如果它危及你的任务进程, 请毫不犹豫地放弃|r
.accept 836,1 >>接任务: |cRXP_LOOT_拯救OOX-09/HL！|r
.target Homing Robot OOX-09/HL
.isQuestTurnedIn 485
.group
step
.goto The Hinterlands,79.47,61.21
>>护送自动导航机器人OOX-09/HL至海岸
>>|cRXP_WARN_这种护送可能致命. 如果它危及你的任务进程, 请毫不犹豫地放弃|r
>>|cRXP_WARN_一群3只46级|r|cRXP_ENEMY_狂暴的枭兽|r|cRXP_WARN_将出现在斯卡尔石块以南的道路旁. 它们在低血量时会进入狂怒状态, 因此请尽量逐个击杀|r
>>|cRXP_WARN_一组 3 个 47 级|r|cRXP_ENEMY_邪枝伏击者|r|cRXP_WARN_ 将在金塔阿洛尔以北的树林中出现. 它们会在你血量低于 20% 时发动处决. 建议使用长时间控制技能(CC), 并让鸡(坦克)吸引其中一到两个, 直到其血量降至约一半|r
.complete 836,1 
.target Homing Robot OOX-09/HL
.mob Marauding Owlbeast
.unitscan Vilebranch Ambusher
.isQuestTurnedIn 485
.group
step
#completewith next
.goto The Hinterlands,77.28,78.64,30,0
.subzone 3317 >>前往恶齿村
.group
step
.goto The Hinterlands,78.20,81.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断齿族长|r交谈
.turnin 7862 >>交任务: |cRXP_FRIENDLY_职位空缺：恶齿村卫兵队长|r
.turnin 7861 >>交任务: |cRXP_FRIENDLY_通缉：邪恶祭司海克斯和她的爪牙|r
.target Primal Torntusk
.isQuestComplete 7862
.isQuestComplete 7861
.group
step
.goto The Hinterlands,78.20,81.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断齿族长|r交谈
.turnin 7861 >>交任务: |cRXP_FRIENDLY_通缉：邪恶祭司海克斯和她的爪牙|r
.target Primal Torntusk
.isQuestComplete 7861
.group
step
.goto The Hinterlands,78.20,81.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断齿族长|r交谈
.turnin 7862 >>交任务: |cRXP_FRIENDLY_职位空缺：恶齿村卫兵队长|r
.target Primal Torntusk
.isQuestComplete 7862
.group
step
.goto The Hinterlands,79.16,79.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Markhor|r交谈
.turnin 7849 >>交任务: |cRXP_FRIENDLY_分离的痛苦|r
.target Huntsman Markhor
.isQuestComplete 7849
.group
step
#completewith next
.goto The Hinterlands,78.20,81.30,15,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉尔德|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Lard
.group
step
.goto The Hinterlands,78.20,81.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断齿族长|r交谈
.turnin 7845 >>交任务: |cRXP_FRIENDLY_被绑架的断齿长者！|r
.turnin 7850 >>交任务: |cRXP_FRIENDLY_黑暗之瓶|r
.turnin 7847 >>交任务: |cRXP_FRIENDLY_向断齿族长复命|r
.target Primal Torntusk
.isOnQuest 7845
.isQuestComplete 7850
.isOnQuest 7847
.group
step
.goto The Hinterlands,78.20,81.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断齿族长|r交谈
.turnin 7845 >>交任务: |cRXP_FRIENDLY_被绑架的断齿长者！|r
.target Primal Torntusk
.isOnQuest 7845
.group
step
.goto The Hinterlands,78.20,81.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断齿族长|r交谈
.turnin 7850 >>交任务: |cRXP_FRIENDLY_黑暗之瓶|r
.target Primal Torntusk
.isQuestComplete 7850
.group
step
.goto The Hinterlands,78.20,81.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断齿族长|r交谈
.turnin 7847 >>交任务: |cRXP_FRIENDLY_向断齿族长复命|r
.target Primal Torntusk
.isOnQuest 7847
.group
step
#completewith next
.goto The Hinterlands,81.70,81.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格卡斯|r交谈
.fly Hammerfall >>飞往落锤镇
.target Gorkas
.skill firstaid,<260,1
step
.goto Arathi Highlands,73.41,36.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里高利·维克托医生|r交谈
.train 18629 >>符文布绷带
.target Doctor Gregory Victor
.skill firstaid,<260,1
step
#sticky
#completewith EnterMaraudon
.subzone 2100,2 >>现在你应该寻找一支前往玛拉顿的队伍
.dungeon MARA
step << !Mage
.goto Arathi Highlands,73.10,32.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤尔达|r交谈
.fly Undercity >>飞往幽暗城
.target Urda
.zoneskip Arathi Highlands,1
step << !Mage
.goto The Hinterlands,81.70,81.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格卡斯|r交谈
.fly Undercity >>飞往幽暗城
.target Gorkas
.zoneskip The Hinterlands,1
step << Mage
#completewith next
.cast 3563 >>传送 |T135766:0|t[传送:幽暗城]
.zoneskip Undercity
step << Mage
.goto Undercity,82.79,15.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉娜|r交谈
.vendor >>至少购买四个|cRXP_BUY_传送符文|r
.collect 17031,4 
.target Hannah Akeley
step
#ah
.goto Undercity,64.20,49.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
>>|cRXP_BUY_从拍卖行购买以下物品|r
>>|cRXP_WARN_完成后将它们存入银行！|r
.collect 8391,5,2581,1 
.collect 8392,6,2581,1 
.collect 8393,6,2581,1 
.collect 8396,14,2581,1 
.collect 8394,11,2581,1 
.collect 4457,10 
.target Auctioneer Rhyker
.group
step
#ah
.goto Undercity,64.20,49.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
>>|cRXP_BUY_从拍卖行购买以下物品|r
>>|cRXP_WARN_完成后将它们存入银行！|r
.collect 8391,5,2581,1 
.collect 8392,6,2581,1 
.collect 8393,6,2581,1 
.collect 8396,14,2581,1 
.collect 8394,11,2581,1 
.target Auctioneer Rhyker
.solo
step
.goto Undercity,73.50,32.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰|r交谈
.turnin 2995 >>交任务: |cRXP_FRIENDLY_通讯路线|r
.turnin 2782 >>交任务: |cRXP_FRIENDLY_林吉的秘密|r
.accept 8273 >>接任务: |cRXP_WARN_奥兰的感谢|r
.turnin 8273 >>交任务: |cRXP_FRIENDLY_奥兰的感谢|r
.target Oran Snakewrithe
step
#completewith next
.goto Undercity,47.20,59.69,0
.goto Undercity,47.20,59.69,12,0
.goto Undercity,43.55,68.11,12,0
.goto Undercity,45.20,71.67,12 >>前往|cRXP_FRIENDLY_Cuely|r
step
.goto Undercity,48.50,71.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Cuely|r 交谈
.accept 3568 >>接任务: |cRXP_WARN_堕落之水|r
.target Chemist Cuely
step
#optional
.abandon 7862 >>放弃职位空缺：恶齿村卫兵队长
.isOnQuest 7862
step
#optional
.abandon 7861 >>通缉：邪恶女祭司海克斯及其爪牙
.isOnQuest 7861
step
#optional
.abandon 7849 >>摆脱分离的痛苦
.isOnQuest 7849
step
#optional
.abandon 7845 >>放弃被绑架的断齿长者！
.isOnQuest 7845
step
#optional
.abandon 7850 >>放弃黑暗之瓶
.isOnQuest 7850
step
#optional
.abandon 7846 >>放弃找回钥匙！
.isOnQuest 7846
step
.hs >>炉石传送至塔纳利斯
.use 6948
step
#completewith next
.goto Tanaris,52.63,28.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_挽歌|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Dirge Quikcleave
step
.goto Tanaris,51.10,26.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯普琳科|r交谈
.turnin 2641 >>交任务: |cRXP_FRIENDLY_斯普琳科的秘密佐料|r
.accept 2661 >>接任务: |cRXP_LOOT_给马林的粉末|r
.target Sprinkle
step
.goto Tanaris,51.80,28.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛琳|r交谈
.turnin 2661 >>交任务: |cRXP_FRIENDLY_给马林的粉末|r
.accept 2662 >>接任务: |cRXP_LOOT_诺格弗格药剂|r
.turnin 2662 >>交任务: |cRXP_FRIENDLY_诺格弗格药剂|r
.collect 8529,60 >>|cRXP_WARN_随身携带一叠|r|T134863:0|t[诺格弗格药剂]|cRXP_WARN_在身上是个好习惯. 请多购买2叠, 然后存入银行|r
.target Marin Noggenfogger
step
.goto Tanaris,66.989,22.354
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Yeh'kinya|r交谈
.turnin 4787 >>交任务: |cRXP_FRIENDLY_远古之卵|r
.target Yeh'kinya
.isQuestComplete 4787
.dungeon ZF
step
.goto Tanaris,51.60,25.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Shadowprey Village >>飞往葬影村
.target Bulkrek Ragefist
.zoneskip Feralas
.dungeon MARA
step
.goto Desolace,23.22,70.33
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与小屋顶部的|cRXP_FRIENDLY_Vark|r交谈
.accept 7029 >>接任务: |cRXP_WARN_维利塔恩的污染|r
.target Vark Battlescar
.dungeon MARA
step
.goto Desolace,26.87,77.67
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟琳德拉|r交谈
.accept 7064 >>接任务: |cRXP_WARN_大地的污染|r
.target Selendra
.dungeon MARA
step
#loop
.line Desolace,50.48,86.66,50.39,86.61,50.18,87.01,49.89,87.11,48.95,87.04,48.73,87.11,48.25,87.14,47.82,87.34,47.01,86.96,45.68,86.22,45.16,86.32,44.74,86.12,44.40,85.69,44.11,85.25,43.77,84.93,43.59,84.93
.goto Desolace,43.59,84.93,50,0
.goto Desolace,47.01,86.96,70,0
.goto Desolace,50.48,86.66,50,0
.goto Desolace,50.48,86.66,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_半人马贱民|r交谈
>>|cRXP_WARN_|r半人马贱民|r在凄凉之地南部稍作巡逻|r
.accept 7067 >>接任务: |cRXP_WARN_贱民的指引|r
.target Centaur Pariah
.dungeon MARA
step
.goto Desolace,62.194,39.624
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维洛|r交谈
.accept 7028 >>接任务: |cRXP_WARN_扭曲的邪恶|r
.target Willow
.dungeon MARA
step
.goto Desolace,29.89,62.44,0
.goto 1414,38.43,57.97
.zone 1414 >>前往: |cRXP_PICK_凄凉之地|r
.dungeon MARA
step
#completewith EnterMaraudon
>>击杀玛拉顿内的所有|cRXP_ENEMY_怪物|r, 击杀后掠夺其掉落的|cRXP_LOOT_瑟莱德丝水晶雕像|r
>>|cRXP_WARN_此任务可在副本内外完成, 现在不要尝试进行|r
.complete 7028,1 
.isOnQuest 7028
.dungeon MARA
step
>>击杀|cRXP_ENEMY_无名预言者|r. 击败后拾取其掉落的 |T133277:0|t[|cRXP_LOOT_灵魂坠饰|r]
>>|cRXP_WARN_这是在副本外完成的. |cRXP_ENEMY_无名预言者|r可能正在巡逻|r
.collect 17757,1,7067,1 
.mob The Nameless Prophet
.isOnQuest 7067
.dungeon MARA
step
#completewith next
>>击杀|cRXP_ENEMY_暗影碎片击碎者|r 和|cRXP_ENEMY_暗影碎片巡游者|r , 掠夺他们的|cRXP_LOOT_暗影残片|r
>>|cRXP_WARN_这些仅在副本外的紫色区域找到|r
.complete 7068,1 
.mob Shadowshard Smasher
.mob Shadowshard Rumbler
.isOnQuest 7068
.dungeon MARA
step
.goto 1414,38.469,57.287,20,0
.goto 1414,38.380,57.376,30,0
.goto 1414,38.469,57.287
>>|cRXP_WARN_使用|r|T133277:0|t[|cRXP_LOOT_灵魂坠饰|r] |cRXP_WARN_在|r|cRXP_FRIENDLY_格尔克之魂 |c|r
>>击杀|cRXP_ENEMY_吉尔克|r. 击败他后搜刮 |T134104:0|t[|cRXP_LOOT_第二可汗的宝石|r]
>>|cRXP_WARN_这是在副本外完成的|r
.collect 17762,1,7067,1 
.use 17757 
.mob Spirit of Gelk
.mob Gelk
.isOnQuest 7067
.dungeon MARA
step
.goto 1414,38.13,56.90,60,0
.goto 1414,28.76,56.96,60,0
.goto 1414,38.13,56.90
>>击杀|cRXP_ENEMY_暗影碎片击碎者|r 和|cRXP_ENEMY_暗影碎片巡游者|r , 掠夺他们的|cRXP_LOOT_暗影残片|r
>>|cRXP_WARN_这些仅在副本外的紫色区域找到|r
.complete 7068,1 
.mob Shadowshard Smasher
.mob Shadowshard Rumbler
.isOnQuest 7068
.dungeon MARA
step
.goto 1414,38.497,57.721
>>|cRXP_WARN_使用|r|T133277:0|t[|cRXP_LOOT_灵魂坠饰|r] |cRXP_WARN_在|r|cRXP_FRIENDLY_考尔克之魂上|r
>>击杀|cRXP_ENEMY_考尔克|r. 击败他后搜刮出 |T134129:0|t[|cRXP_LOOT_第一可汗的宝石|r]
>>|cRXP_WARN_这是在副本外完成的|r
.collect 17761,1,7067,1 
.use 17757 
.mob Spirit of Kolk
.mob Kolk
.isOnQuest 7067
.dungeon MARA
step
.goto 1414,38.77,58.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_半人马贱民|r交谈
.accept 7044 >>接任务: |cRXP_WARN_玛拉顿的传说|r
.target Cavindra
.dungeon MARA
step
.goto 1414,38.928,58.354
>>|cRXP_WARN_使用|r|T134865:0|t[天蓝水瓶] |cRXP_WARN_在橙色池中|r
.complete 7029,2 
.use 17693 
.isOnQuest 7029
.dungeon MARA
step
.goto 1414,39.00,58.32,70,0
.goto 1414,39.13,57.68,60,0
.goto 1414,39.25,57.71,20,0
.goto 1414,39.13,57.68
>>|cRXP_WARN_使用|r|T133277:0|t[|cRXP_LOOT_灵魂坠饰|r] |cRXP_WARN_上的|r|cRXP_FRIENDLY_玛格拉之魂|r
>>击杀|cRXP_ENEMY_玛格拉|r. 击败他后搜刮出 |T134135:0|t[|cRXP_LOOT_第三可汗的宝石|r]
>>|cRXP_WARN_这是在副本外完成的|r
.collect 17763,1,7067,1 
.use 17757 
.mob Spirit of Magra
.mob Magra
.isOnQuest 7067
.dungeon MARA
step
#label EnterMaraudon
.goto 1414,39.266,58.205
.subzone 2100,2 >>通过橙色入口进入玛拉顿副本
.dungeon MARA
step
#completewith CrystalCarving
>>击杀玛拉顿中的任意|cRXP_ENEMY_Monster|r, 击败后从其身上搜刮|cRXP_LOOT_瑟莱德丝水晶雕像|r
.complete 7028,1 
.isOnQuest 7028
.dungeon MARA
step
#completewith next
>>|cRXP_WARN_使用|r|T134804:0|t[装满水的天蓝水瓶] |cRXP_WARN_在橙色区域内的小花/植物上|r
>>击杀被召唤出的诺克赛恩幼体
.complete 7029,1 
.use 17696 
.isOnQuest 7029
.dungeon MARA
step
>>|cRXP_WARN_使用|r|T133277:0|t[|cRXP_LOOT_灵魂坠饰|r] |cRXP_WARN_在|r|cRXP_FRIENDLY_温格之魂 |cRXP_NORMAL_ 上|r
>>击杀|cRXP_ENEMY_温格|r. 击败他后搜刮出 |T134116:0|t[|cRXP_LOOT_第五可汗的宝石|r]
>>|cRXP_ENEMY_温格|r|cRXP_WARN_在玛拉顿橙色副本内巡逻|r
.collect 17765,1,7067,1 
.use 17757 
.mob Spirit of Veng
.mob Veng
.isOnQuest 7067
.dungeon MARA
step
>>|cRXP_WARN_使用|r|T134804:0|t[装满水的天蓝水瓶] |cRXP_WARN_在橙色区域内的小花/植物上|r
>>击杀被召唤出的诺克赛恩幼体
.complete 7029,1 
.use 17696 
.isOnQuest 7029
.dungeon MARA
step
>>击杀|cRXP_ENEMY_诺克赛恩|r. 击败他后搜刮|cRXP_LOOT_塞雷布拉斯魔棒|r
>>击杀 |cRXP_ENEMY_维利塔恩|r. 击败他后拾取 |cRXP_LOOT_塞雷布拉斯钻石|r
>>|cRXP_ENEMY_诺克赛恩|r|cRXP_WARN_位于橙色区域, 而|cRXP_ENEMY_维利塔恩|r在紫色区域|r
.complete 7044,2 
.complete 7044,1 
.isOnQuest 7044
.dungeon MARA
step
>>|cRXP_WARN_使用|r|T133277:0|t[|cRXP_LOOT_灵魂坠饰|r] |cRXP_WARN_在|r|cRXP_FRIENDLY_玛劳杜斯之魂上|r
>>击杀|cRXP_ENEMY_玛拉多斯|r. 击败他后搜刮出 |T134132:0|t[|cRXP_LOOT_第四可汗的宝石|r]
>>|cRXP_ENEMY_玛拉多斯|r|cRXP_WARN_在玛拉顿紫色副本内部巡逻|r
.collect 17764,1,7067,1 
.use 17757 
.mob Spirit of Maraudos
.mob Maraudos
.isOnQuest 7067
.dungeon MARA
step
>>|cRXP_WARN_在任意|r|T134129:0|t|T134104:0|t|T134135:0|t|T134132:0|t|T134116:0|t[|cRXP_LOOT_可汗的宝石|r] |cRXP_WARN_用于制作|r|T133277:0|t[|cRXP_LOOT_联合坠饰|r]
.complete 7067,1 
.use 17761,1
.use 17762,1
.use 17763,1
.use 17764,1
.use 17765,1
.itemcount 17761,1
.itemcount 17762,1
.itemcount 17763,1
.itemcount 17764,1
.itemcount 17765,1
.isOnQuest 7067
.dungeon MARA
step
>>击杀|cRXP_ENEMY_被诅咒的塞雷布拉斯|r, 然后与|cRXP_FRIENDLY_赎罪的塞雷布拉斯|r交谈
.turnin 7044 >>交任务: |cRXP_FRIENDLY_玛拉顿的传说|r
.isQuestComplete 7044
.mob Celebras the Cursed
.target Celebras the Redeemed
.dungeon MARA
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与赎罪的塞雷布拉斯交谈|cRXP_FRIENDLY_赎罪的塞雷布拉斯|r
.accept 7046 >>接任务: |cRXP_WARN_塞雷布拉斯节杖|r
.timer 14,Incantation of Celebras Spawning RP
.target Celebras the Redeemed
.isQuestTurnedIn 7044
.dungeon MARA
step
.cast 6477 >>点击地面上的|cRXP_PICK_Incantation of Celebras|r
.timer 34,The Scepter of Celebras RP
.isQuestTurnedIn 7044
.dungeon MARA
step
>>|cRXP_WARN_等待RP结束|r
.complete 7046,1 
.isQuestTurnedIn 7044
.dungeon MARA
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与赎罪的塞雷布拉斯交谈|cRXP_FRIENDLY_赎罪的塞雷布拉斯|r
.turnin 7046 >>交任务: |cRXP_FRIENDLY_塞雷布拉斯节杖|r
.isQuestTurnedIn 7044
.target Celebras the Redeemed
.dungeon MARA
step
>>击杀|cRXP_ENEMY_瑟莱德丝公主|r
.complete 7064,1 
.mob Princess Theradras
.isOnQuest 7064
.dungeon MARA
step
#label CrystalCarving
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zaetar的幽灵|r交谈
.accept 7066 >>接任务: |cRXP_WARN_生命之种|r
.target Zaetar's Spirit
.dungeon MARA
step
>>击杀玛拉顿中的任意|cRXP_ENEMY_Monster|r, 击败后从其身上搜刮|cRXP_LOOT_瑟莱德丝水晶雕像|r
>>|cRXP_WARN_这个任务可以在副本外部和内部完成|r
.complete 7028,1 
.isOnQuest 7028
.dungeon MARA
step
#completewith MaraTurnins
.zone Desolace >>离开玛拉顿副本
.dungeon MARA
step
.goto Desolace,26.87,77.67
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟琳德拉|r交谈
.turnin 7064 >>交任务: |cRXP_FRIENDLY_大地的污染|r
.target Selendra
.isQuestComplete 7064
.dungeon MARA
step
.goto Desolace,23.22,70.33
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与小屋顶部的|cRXP_FRIENDLY_Vark|r交谈
.turnin 7029 >>交任务: |cRXP_FRIENDLY_维利塔恩的污染|r
.target Vark Battlescar
.isQuestComplete 7029
.dungeon MARA
step
#loop
.line Desolace,50.48,86.66,50.39,86.61,50.18,87.01,49.89,87.11,48.95,87.04,48.73,87.11,48.25,87.14,47.82,87.34,47.01,86.96,45.68,86.22,45.16,86.32,44.74,86.12,44.40,85.69,44.11,85.25,43.77,84.93,43.59,84.93
.goto Desolace,43.59,84.93,50,0
.goto Desolace,47.01,86.96,70,0
.goto Desolace,50.48,86.66,50,0
.goto Desolace,50.48,86.66,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_半人马贱民|r交谈
>>|cRXP_WARN_|r半人马贱民|r在凄凉之地南部稍作巡逻|r
.turnin 7067 >>交任务: |cRXP_FRIENDLY_贱民的指引|r
.target Centaur Pariah
.isQuestComplete 7067
.dungeon MARA
step
#label MaraTurnins
.goto Desolace,62.194,39.624
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维洛|r交谈
.turnin 7028 >>交任务: |cRXP_FRIENDLY_扭曲的邪恶|r
.target Willow
.isQuestComplete 7028
.dungeon MARA
step
#completewith next
.hs >>炉石传送至塔纳利斯
.use 6948
.dungeon MARA
step
.goto Tanaris,52.63,28.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_挽歌|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Dirge Quikcleave
.dungeon MARA
step
.goto Tanaris,52.30,28.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉布索恩|r交谈
.bankdeposit 10695,10687,10688,10689,10690,17760 >>请将以下物品存入银行:
>>|T134199:0|t[生命之种]
>>|T132594:0|t[装空瓶的盒子] |cRXP_WARN_(或|r|T132793:0|t[空瓶] |cRXP_WARN_如果你打开了盒子)|r
.target Gimblethorn
.dungeon MARA
step
.goto Tanaris,52.30,28.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉布索恩|r交谈
.bankdeposit 10695,10687,10688,10689,10690 >>将|T132594:0|t[装空瓶的盒子]放在银行上
.target Gimblethorn
.dungeon !MARA
step
.goto Tanaris,51.60,25.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Feralas>>飞往菲拉斯
.target Bulkrek Ragefist
.zoneskip Feralas
step
#optional
.abandon 7029 >>驱散维利塔恩的污染
.isOnQuest 7029
.dungeon MARA
step
#optional
.abandon 7064 >>摒弃大地的污染
.isOnQuest 7064
.dungeon MARA
step
#optional
.abandon 7067 >>放弃贱民的指引
.isOnQuest 7067
.dungeon MARA
step
#optional
.abandon 7028 >>放弃扭曲的邪恶
.isOnQuest 7028
.dungeon MARA
step
#optional
.abandon 7068 >>丢弃暗影残片
.isOnQuest 7068
.dungeon MARA
step
#optional
.abandon 7044 >>放弃玛拉顿的传说
.isOnQuest 7044
.dungeon MARA
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南(50-60级)
#name 50-51 菲拉斯
#displayname 50-51 菲拉斯 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 51-52 狂牙洞/诅咒之地
step
.goto Feralas,76.06,43.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布隆克|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Bronk
step
.goto Feralas,76.20,43.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔洛|r交谈
.accept 3063 >>接任务: |cRXP_LOOT_对鹰身人的复仇|r
.accept 3062 >>接任务: |cRXP_LOOT_黑暗之心|r
.target Talo Thornhoof
.group
step
.goto Feralas,76.20,43.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔洛|r交谈
.accept 3063 >>接任务: |cRXP_LOOT_对鹰身人的复仇|r
.target Talo Thornhoof
step
.goto Feralas,74.50,42.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杉多尔·迅蹄|r交谈
.accept 7734 >>接任务: |cRXP_LOOT_更高的品质|r
.target Jangdor Swiftstrider
step
.goto Feralas,74.50,43.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Uzer'i|r交谈
.turnin 3123 >>交任务: |cRXP_FRIENDLY_测试容器|r
.accept 3124 >>接任务: |cRXP_LOOT_角鹰兽灵魂精华|r
.accept 3128 >>接任务: |cRXP_LOOT_天然材料|r
.target Witch Doctor Uzer'i
step
#completewith next
.goto Feralas,58.0,53.1,50,0
.goto Feralas,54.2,68.6,0
.subzone 1106 >>前往西南方向的弗雷费瑟高地
step
#loop
.goto Feralas,55.60,60.60,0
.goto Feralas,55.60,60.60,60,0
.goto Feralas,55.40,64.20,60,0
.goto Feralas,53.80,66.80,60,0
.goto Feralas,54.60,68.60,60,0
.goto Feralas,54.00,71.60,60,0
.goto Feralas,54.20,72.60,60,0
.goto Feralas,55.60,75.20,60,0
.goto Feralas,57.00,74.80,60,0
.goto Feralas,56.00,72.40,60,0
.goto Feralas,55.00,70.60,60,0
.goto Feralas,56.20,66.00,60,0
.goto Feralas,56.80,65.60,60,0
.goto Feralas,57.40,62.60,60,0
.use 9619 >>击杀所有类型的|cRXP_ENEMY_Frayfeathers|r. 击败它们后, 收集其掉落的|cRXP_LOOT_Fragments|r和|cRXP_LOOT_有弹性的肌腱|r
>>使用 |T133841:0|t[角鹰兽灵魂精华容器] 对他们的尸体进行交互
>>|cRXP_WARN_此物品有冷却时间, 且每次只能作用于一具尸体, 即使它们堆叠在一起|r
.complete 3124,1 
.complete 3128,4 
.complete 3128,3 
.mob Frayfeather Stagwing
.mob Frayfeather Skystormer
.mob Frayfeather Hippogryph
.mob Frayfeather Patriarch
step
#completewith next
.goto Feralas,75.9,43.7,0
.subzone 1099 >>前往莫沙彻营地
step
.goto Feralas,74.42,43.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Uzer'i|r交谈
.turnin 3124 >>交任务: |cRXP_FRIENDLY_角鹰兽灵魂精华|r
.accept 3125 >>接任务: |cRXP_LOOT_精灵龙灵魂精华|r
.target Witch Doctor Uzer'i
step
#loop
.goto Feralas,66.57,47.74,0
.goto Feralas,69.55,46.96,50,0
.goto Feralas,68.82,48.54,50,0
.goto Feralas,67.69,47.95,50,0
.goto Feralas,66.57,47.74,50,0
.use 9620 >>击杀|cRXP_ENEMY_小精龙|r. 击杀后掠夺其掉落的|cRXP_LOOT_矿物|r
>>在他们的尸体上使用 |T133841:0|t[精灵龙灵魂精华容器]
>>|cRXP_WARN_此物品有冷却时间, 且每次只能作用于一具尸体, 即使它们堆叠在一起|r
.complete 3125,1 
.complete 3128,2 
.mob Sprite Darter
step
.goto Feralas,74.42,43.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Uzer'i|r交谈
.turnin 3125 >>交任务: |cRXP_FRIENDLY_精灵龙灵魂精华|r
.accept 3126 >>接任务: |cRXP_LOOT_树人灵魂精华|r
.target Witch Doctor Uzer'i
step
#loop
.goto Feralas,69.4,44.6,0
.goto Feralas,69.4,44.6,70,0
.goto Feralas,70.6,41.8,70,0
.goto Feralas,75.0,38.6,70,0
.goto Feralas,77.4,40.8,70,0
.goto Feralas,78.6,42.4,70,0
.goto Feralas,79.6,45.4,70,0
.line Feralas,55.8,60.8,55.0,65.0,55.4,66.2,54.4,69.0,55.0,71.6,58.2,74.6
.line Feralas,67.97,59.99,68.99,60.19,69.57,59.39,70.42,57.76,71.48,58.00,72.27,59.39,72.71,58.54,74.24,58.18,74.72,56.33,74.24,58.18,72.89,57.66,72.67,56.02,73.44,54.87,73.60,53.79,73.97,53.33,74.26,53.12,73.94,51.66,72.80,50.88
.line Feralas,78.4,41.8,74.6,38.4,72.4,41.2,70.6,41.8,69.4,44.6
.line Feralas,52.0,47.8,52.8,46.2,55.0,47.6,55.6,47.0
.use 9606 >>击杀|r森林漫游者|cRXP_ENEMY_. 从他们身上搜刮出|r断裂的原木
>>在他们的尸体上使用 |T133841:0|t[树人灵魂精华容器]
>>|cRXP_WARN_箭头会指引你沿着他们的巡逻路线前进, 这些路线也会在你的世界地图上标出. 该任务物品有冷却时间, 且每次只能作用于一具尸体, 即使尸体堆叠在一起也是如此|r
.collect 9590,1,3128,1 
.collect 9593,1,3126,1 
.unitscan Wandering Forest Walker
step
#loop
.goto Feralas,72.80,50.88,0
.goto Feralas,67.97,59.99,70,0
.goto Feralas,68.99,60.19,70,0
.goto Feralas,69.57,59.39,70,0
.goto Feralas,70.42,57.76,70,0
.goto Feralas,71.48,58.00,70,0
.goto Feralas,72.27,59.39,70,0
.goto Feralas,72.71,58.54,70,0
.goto Feralas,74.24,58.18,70,0
.goto Feralas,74.72,56.33,70,0
.goto Feralas,74.24,58.18,70,0
.goto Feralas,72.89,57.66,70,0
.goto Feralas,72.67,56.02,70,0
.goto Feralas,73.44,54.87,70,0
.goto Feralas,73.60,53.79,70,0
.goto Feralas,73.97,53.33,70,0
.goto Feralas,74.26,53.12,70,0
.goto Feralas,73.94,51.66,70,0
.goto Feralas,72.80,50.88,70,0
.line Feralas,55.8,60.8,55.0,65.0,55.4,66.2,54.4,69.0,55.0,71.6,58.2,74.6
.line Feralas,67.97,59.99,68.99,60.19,69.57,59.39,70.42,57.76,71.48,58.00,72.27,59.39,72.71,58.54,74.24,58.18,74.72,56.33,74.24,58.18,72.89,57.66,72.67,56.02,73.44,54.87,73.60,53.79,73.97,53.33,74.26,53.12,73.94,51.66,72.80,50.88
.line Feralas,78.4,41.8,74.6,38.4,72.4,41.2,70.6,41.8,69.4,44.6
.line Feralas,52.0,47.8,52.8,46.2,55.0,47.6,55.6,47.0
.use 9606 >>击杀|r森林漫游者|cRXP_ENEMY_. 从他们身上搜刮出|r断裂的原木
>>在他们的尸体上使用 |T133841:0|t[树人灵魂精华容器]
>>|cRXP_WARN_箭头会指引你沿着他们的巡逻路线前进, 这些路线也会在你的世界地图上标出. 该任务物品有冷却时间, 且每次只能作用于一具尸体, 即使尸体堆叠在一起也是如此|r
.collect 9590,2,3128,1 
.collect 9593,2,3126,1 
.unitscan Wandering Forest Walker
step
#loop
.goto Feralas,58.6,52.0,0
.goto Feralas,58.6,52.0,70,0
.goto Feralas,60.0,48.8,70,0
.goto Feralas,57.8,48.0,70,0
.goto Feralas,55.6,47.0,70,0
.goto Feralas,53.2,46.6,70,0
.goto Feralas,51.6,49.0,70,0
.line Feralas,55.8,60.8,55.0,65.0,55.4,66.2,54.4,69.0,55.0,71.6,58.2,74.6
.line Feralas,67.97,59.99,68.99,60.19,69.57,59.39,70.42,57.76,71.48,58.00,72.27,59.39,72.71,58.54,74.24,58.18,74.72,56.33,74.24,58.18,72.89,57.66,72.67,56.02,73.44,54.87,73.60,53.79,73.97,53.33,74.26,53.12,73.94,51.66,72.80,50.88
.line Feralas,78.4,41.8,74.6,38.4,72.4,41.2,70.6,41.8,69.4,44.6
.line Feralas,52.0,47.8,52.8,46.2,55.0,47.6,55.6,47.0
.use 9606 >>击杀|r森林漫游者|cRXP_ENEMY_. 从他们身上搜刮出|r断裂的原木
>>在他们的尸体上使用 |T133841:0|t[树人灵魂精华容器]
>>|cRXP_WARN_箭头会指引你沿着他们的巡逻路线前进, 这些路线也会在你的世界地图上标出. 该任务物品有冷却时间, 且每次只能作用于一具尸体, 即使尸体堆叠在一起也是如此|r
.collect 9593,3,3126,1 
.unitscan Wandering Forest Walker
step
#completewith next
.goto Feralas,75.9,43.7,0
.subzone 1099 >>前往莫沙彻营地
step
.goto Feralas,74.42,43.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Uzer'i|r交谈
.turnin 3126 >>交任务: |cRXP_FRIENDLY_树人灵魂精华|r
.accept 3127 >>接任务: |cRXP_LOOT_山岭巨人灵魂精华|r
.target Witch Doctor Uzer'i
step
#completewith next
.goto Feralas,51.89,49.82,30,0
.goto Feralas,48.82,45.15,30,0
.goto Feralas,45.67,46.94,30,0
.subzone 1108 >>向西前往被遗忘的灵魂海岸
step
.goto Feralas,44.81,43.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zorbin|r交谈
.accept 7003 >>接任务: |cRXP_LOOT_被缩小的巨人|r
.target Zorbin Fandazzle
step
#completewith ZappedGiants1
+|T133003:0|t【佐宾的超缩小器】|cRXP_WARN_持续时间为2小时. 如果效果消失, 你必须放弃被缩小的巨人并重新开始任务|r
step
#completewith next
>>留意一个 |T134362:0|t[|cRXP_LOOT_完美的雪人毛皮|r]
>>|cRXP_WARN_不要接受任务！如果在收集完所有怒痕雪人的毛皮之前没有找到任务, 请跳过此步骤|r
.collect 18972,1 
step
.goto Feralas,52.06,30.72,0
.goto Feralas,52.05,31.82,40,0
#loop
.goto Feralas,52.06,30.72,25,0
.goto Feralas,52.50,29.74,25,0
.goto Feralas,53.09,30.80,25,0
.goto Feralas,52.05,31.82,25,0
.goto Feralas,53.11,31.79,25,0
.goto Feralas,54.33,32.54,25,0
.goto Feralas,55.07,32.27,25,0
.goto Feralas,55.43,33.53,25,0
.goto Feralas,55.81,33.00,25,0
.goto Feralas,54.34,33.21,25,0
.goto Feralas,54.81,33.86,25,0
.goto Feralas,54.34,33.21,25,0
.goto Feralas,55.81,33.00,25,0
.goto Feralas,55.43,33.53,25,0
.goto Feralas,55.07,32.27,25,0
.goto Feralas,54.33,32.54,25,0
.goto Feralas,53.11,31.79,25,0
.goto Feralas,52.05,31.82,25,0
>>击杀|cRXP_ENEMY_狂暴的怒痕雪人|r. 击败它们后搜刮|cRXP_LOOT_兽皮|r
.complete 7734,1 
.mob Ferocious Rage Scar
.mob Rage Scar Yeti
.mob Elder Rage Scar
step
#label ZappedGiants1
#loop
.goto Feralas,41.08,24.52,0
.goto Feralas,41.08,24.52,60,0
.goto Feralas,39.36,24.29,60,0
.goto Feralas,38.38,22.21,60,0
.goto Feralas,38.52,20.83,60,0
.goto Feralas,39.47,22.04,60,0
.use 18904 >>对|cRXP_ENEMY_大地行者|r 和|cRXP_ENEMY_峭壁巨人|r 使用 |T133003:0|t[佐宾的超收缩器], 击杀它们并收集其掉落的|cRXP_LOOT_Residue|r
.use 9621 >>在他们的尸体上使用 |T133841:0|t[山岭巨人灵魂精华容器]
>>|cRXP_WARN_此物品有冷却时间, 且每次只能作用于一具尸体, 即使它们堆叠在一起|r
.complete 3127,1 
.collect 18956,8,7003,1 
.mob Land Walker
.mob Cliff Giant
step
#completewith NorthSpringHarpies
.goto Feralas,40.9,12.0,0
.subzone 1114 >>前往北方的鸦风废墟
step
#completewith EdanaKill
>>击杀北泉的|cRXP_ENEMY_Harpies|r和|cRXP_ENEMY_Roguefeathers|r和|cRXP_ENEMY_Slayers|r和|cRXP_ENEMY_Windcallers|r
.complete 3063,1 
.mob +Northspring Harpy
.complete 3063,2 
.mob +Northspring Roguefeather
.complete 3063,3 
.mob +Northspring Slayer
.complete 3063,4 
.mob +Northspring Windcaller
.group 0
step
#label HatetalonHorn
#loop
.goto Feralas,38.61,14.64,0
.goto Feralas,38.62,13.35,50,0
.goto Feralas,38.61,14.64,50,0
.goto Feralas,39.78,14.09,50,0
.goto Feralas,39.95,12.41,50,0
.goto Feralas,40.98,11.09,50,0
.goto Feralas,39.70,11.09,50,0
.goto Feralas,38.83,10.87,50,0
.goto Feralas,38.07,12.04,50,0
>>击杀|cRXP_ENEMY_Northspring Harpies|r. 击败后可拾取物品:|T134228:0|t[|cRXP_LOOT_艾丹娜的角|r]
.collect 9530,1,13062,1 
.group 2
step
#label EdanaKill
#requires HatetalonHorn
.goto Feralas,40.56,8.58
.use 9530 >>|cRXP_WARN_使用|r|T134228:0|t[艾丹娜的角]|cRXP_WARN_召唤|cRXP_ENEMY_艾丹娜·邪爪|r(48级精英)|r
>>杀死她并掠夺她的|cRXP_LOOT_Heart|r
.complete 3062,1 
.unitscan Edana of Hatetalon
.group 2
step
#label NorthSpringHarpies
#loop
.goto Feralas,38.62,13.35,0
.goto Feralas,38.62,13.35,50,0
.goto Feralas,38.61,14.64,50,0
.goto Feralas,39.78,14.09,50,0
.goto Feralas,39.95,12.41,50,0
.goto Feralas,40.98,11.09,50,0
.goto Feralas,39.70,11.09,50,0
.goto Feralas,38.83,10.87,50,0
.goto Feralas,38.07,12.04,50,0
>>击杀北泉的|cRXP_ENEMY_Harpies|r和|cRXP_ENEMY_Roguefeathers|r和|cRXP_ENEMY_Slayers|r和|cRXP_ENEMY_Windcallers|r
.complete 3063,1 
.mob +Northspring Harpy
.complete 3063,2 
.mob +Northspring Roguefeather
.complete 3063,3 
.mob +Northspring Slayer
.complete 3063,4 
.mob +Northspring Windcaller
step
#loop
.goto Feralas,41.08,24.52,0
.goto Feralas,41.08,24.52,60,0
.goto Feralas,39.36,24.29,60,0
.goto Feralas,38.38,22.21,60,0
.goto Feralas,38.52,20.83,60,0
.goto Feralas,39.47,22.04,60,0
.use 18904 >>对|cRXP_ENEMY_大地行者|r 和|cRXP_ENEMY_峭壁巨人|r 使用 |T133003:0|t[佐宾的超收缩器], 击杀它们并收集其掉落的|cRXP_LOOT_Residue|r
.use 9621 >>在他们的尸体上使用 |T133841:0|t[山岭巨人灵魂精华容器]
>>|cRXP_WARN_此物品有冷却时间, 且每次只能作用于一具尸体, 即使它们堆叠在一起|r
.complete 3127,1 
.complete 7003,1 
.mob Land Walker
.mob Cliff Giant
step
.goto Feralas,38.1,14.4
.xp 51 >>刷到51级

step
#completewith next
.goto Feralas,44.8,44.0,0
.subzone 1108 >>前往南方的遗忘海岸
step
.goto Feralas,44.81,43.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zorbin|r交谈
.turnin 7003 >>交任务: |cRXP_FRIENDLY_被缩小的巨人|r
.target Zorbin Fandazzle
step << Druid
#completewith DruidTraining11
.cast 18960 >>施放 |T135758:0|t[传送:月光林地]
.zoneskip Moonglade
step << Druid
#optional
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 22828 >>训练你的职业法术
.target Loganaar
.xp <48,1
.xp >50,1
step << Druid
#label DruidTraining11
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 9884 >>训练你的职业法术
.target Loganaar
.xp <50,1
step
#completewith next
.hs >>炉石前往加基森
.use 6948
step
.goto Tanaris,52.63,28.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_挽歌|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Dirge Quikcleave
step
.goto Tanaris,52.70,45.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马尔冯|r交谈
.turnin 3380 >>交任务: |cRXP_FRIENDLY_沉没的神庙|r
.target Marvon Rivetseeker
step
#completewith next
.goto Tanaris,27.00,55.66,150,0
.goto Tanaris,27.00,50.21
.zone Un'Goro Crater >>前往: |cRXP_PICK_安戈洛环形山|r
step
.goto Un'Goro Crater,71.64,75.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔瓦|r交谈
.accept 4289 >>接任务: |cRXP_LOOT_安戈洛的猩猩|r
.accept 4290 >>接任务: |cRXP_LOOT_拉克维的食物|r
.target Torwa Pathfinder
step
#completewith BoneBlade
>>掠夺 |T133743:0|t[|cRXP_LOOT_被撕破的日记|r]
>>|cRXP_WARN_安戈洛环形山中的任何怪物都可能掉落它|r
.collect 11116,1,3884,1 
.use 11116
step
#completewith Scent
>>击杀|cRXP_ENEMY_Ravasaur 暴掠龙|r. 击败它们后拾取其|cRXP_LOOT_利爪|r
>>|cRXP_WARN_先别急着做这个任务, 如果遇到他们, 直接杀掉就行|r
.complete 4300,1 
.mob Ravasaur
.mob Ravasaur Hunter
.mob Venomhide Ravasaur
.mob Ravasaur Runner
.mob Ravasaur Matriarch
.isOnQuest 4300
step
#completewith BoneBlade
.goto Un'Goro Crater,70.60,53.26,0
>>收集 25|cRXP_LOOT_安戈洛的泥土|r, 这些物品会从你任务途中击杀的怪物身上掉落
.collect 11018,25 
step
#completewith BoneBlade
.goto Un'Goro Crater,73.06,51.57,0
>>在完成任务时, 拾取每种颜色的 7 个|cRXP_LOOT_Power Crystals|r
.collect 11186,7,4284,1 
.collect 11188,7,4284,1 
.collect 11185,7,4284,1 
.collect 11184,7,4284,1 
step
.goto Un'Goro Crater,63.10,68.60
>>点击|cRXP_PICK_Wrecked Raft|r
.accept 3844 >>接任务: |cRXP_LOOT_无人知晓的秘密|r
step
.goto Un'Goro Crater,63.10,69.00
>>潜入水下, 然后点击|cRXP_PICK_Small Pack|r
.turnin 3844 >>交任务: |cRXP_FRIENDLY_无人知晓的秘密|r
.accept 3845 >>接任务: |cRXP_LOOT_无人知晓的秘密|r
step
.goto Un'Goro Crater,68.80,56.80
>>击杀|cRXP_PICK_新鲜的蛇颈龙肉|r, 获得|cRXP_LOOT_蛇颈龙肉块|r
.complete 4290,1 
step
.goto Un'Goro Crater,71.64,75.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔瓦|r交谈
.turnin 4290 >>交任务: |cRXP_FRIENDLY_拉克维的食物|r
.accept 4291 >>接任务: |cRXP_LOOT_拉克维的气味|r
.target Torwa Pathfinder
step
.goto Un'Goro Crater,67.30,73.10,20,0
.goto Un'Goro Crater,66.60,66.70
>>踩上小蛋巢即可召唤|cRXP_ENEMY_Lar'Korwi Mates|r. 击杀它们并掠夺其|cRXP_LOOT_Glands|r
.complete 4291,1 
.unitscan Lar'Korwi Mate
step
#label Scent
.goto Un'Goro Crater,71.64,75.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔瓦|r交谈
.turnin 4291 >>交任务: |cRXP_FRIENDLY_拉克维的气味|r
.target Torwa Pathfinder
step
#label BoneBlade
#loop
.goto Un'Goro Crater,68.20,75.00,0
.goto Un'Goro Crater,68.20,75.00,60,0
.goto Un'Goro Crater,67.00,71.20,60,0
.goto Un'Goro Crater,67.80,67.00,60,0
.goto Un'Goro Crater,68.00,61.60,60,0
.goto Un'Goro Crater,64.80,62.60,60,0
.goto Un'Goro Crater,63.00,66.40,60,0
.goto Un'Goro Crater,61.60,70.80,60,0
.goto Un'Goro Crater,59.80,75.20,60,0
.goto Un'Goro Crater,59.40,79.00,60,0
.goto Un'Goro Crater,62.00,82.40,60,0
.goto Un'Goro Crater,61.80,76.00,60,0
.goto Un'Goro Crater,63.60,77.20,60,0
.goto Un'Goro Crater,66.20,77.80,60,0
>>击杀|cRXP_ENEMY_Ravasaur 暴掠龙|r. 击败它们后拾取其|cRXP_LOOT_利爪|r
.complete 4300,1 
.mob Ravasaur
.mob Ravasaur Hunter
.mob Venomhide Ravasaur
.mob Ravasaur Runner
.mob Ravasaur Matriarchaw
.isOnQuest 4300
step 
>>收集 7 个每种颜色的|cRXP_LOOT_Power Crystals|r
>>|cRXP_WARN_尽量待在西部和西北部或北部区域. 这些地方的怪物等级较低, 更容易逃跑|r
.collect 11186,7,4284,1 
.collect 11188,7,4284,1 
.collect 11185,7,4284,1 
.collect 11184,7,4284,1 
step
#completewith next
.goto Un'Goro Crater,44.70,8.10
.use 11107 >>打开 |T133653:0|t[小背包] 获取以下奖励:
.complete 3845,1 
.complete 3845,2 
.complete 3845,3 
step
#completewith next
.goto Un'Goro Crater,44.6,8.2
.subzone 541 >>向北前往指挥官避难所
step
.goto Un'Goro Crater,44.70,8.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林克|r交谈
.turnin 3845 >>交任务: |cRXP_FRIENDLY_无人知晓的秘密|r
.accept 3908 >>接任务: |cRXP_LOOT_无人知晓的秘密|r
.target Linken
step
.destroy 11107 >>摧毁: |cRXP_ENEMY_小背包|r
.destroy 3108 >>摧毁: |cRXP_ENEMY_破损的重型飞刀|r
.destroy 11108 >>摧毁: |cRXP_ENEMY_褪色的照片|r
>>|cRXP_WARN_你不再需要这些了|r
step
.goto Un'Goro Crater,43.947,7.137
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威利德·马绍尔|r交谈
.use 11116 >>|cRXP_WARN_使用 |T133743:0|t[被撕破的日记] 开始任务|r
.collect 11116,1,3884,1 
.accept 3884 >>接任务: |cRXP_LOOT_威利德的日记|r
.turnin 3884 >>交任务: |cRXP_FRIENDLY_威利德的日记|r
.target Williden Marshal
.itemcount 11116,1
step
.goto Un'Goro Crater,43.16,6.24,30,0
.goto Un'Goro Crater,41.90,2.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_J.D. 科琳|r交谈
.accept 4284 >>接任务: |cRXP_LOOT_能量水晶|r
.turnin 4284 >>交任务: |cRXP_FRIENDLY_能量水晶|r
.target J.D. Collie
step
.goto Un'Goro Crater,43.16,6.24,30,0
.goto Un'Goro Crater,45.23,5.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t离开洞穴, 然后与|cRXP_FRIENDLY_格莱菲|r交谈
.fp Marshal >>获取安戈洛环形山飞行点
.fly Camp Mojache >>飞往莫沙彻营地
.target Gryfe
step
.goto Feralas,74.42,43.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Uzer'i|r交谈
.turnin 3128 >>交任务: |cRXP_FRIENDLY_天然材料|r
.turnin 3127 >>交任务: |cRXP_FRIENDLY_山岭巨人灵魂精华|r
.accept 3129 >>接任务: |cRXP_LOOT_灵魂武器|r
.target Witch Doctor Uzer'i
step
.goto Feralas,74.43,42.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杉多尔·迅蹄|r交谈
.turnin 7734 >>交任务: |cRXP_FRIENDLY_更高的品质|r
.target Jangdor Swiftstrider
step
.goto Feralas,74.43,42.91
.use 18972 >>使用 |T134362:0|t[|cRXP_LOOT_完美的雪人毛皮|r] 接受任务
.accept 7738 >>接任务: |cRXP_WARN_完美的雪人毛皮|r
.itemcount 18972,1
step
.goto Feralas,74.43,42.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杉多尔·迅蹄|r交谈
.turnin 7738 >>交任务: |cRXP_FRIENDLY_完美的雪人毛皮|r
.target Jangdor Swiftstrider
.isOnQuest 7738
step
.goto Feralas,76.18,43.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔洛|r交谈
.turnin 3063 >>交任务: |cRXP_FRIENDLY_对鹰身人的复仇|r
.accept 4120 >>接任务: |cRXP_WARN_堕落的力量|r
.turnin 3062 >>交任务: |cRXP_FRIENDLY_黑暗之心|r
.target Talo Thornhoof
.isQuestComplete 3062
.group
step
.goto Feralas,76.18,43.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔洛|r交谈
.turnin 3063 >>交任务: |cRXP_FRIENDLY_对鹰身人的复仇|r
.accept 4120 >>接任务: |cRXP_WARN_堕落的力量|r
.target Talo Thornhoof
step
.goto Feralas,74.42,43.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Uzer'i|r交谈
.turnin 3129 >>交任务: |cRXP_FRIENDLY_灵魂武器|r
.target Witch Doctor Uzer'i
step
.goto Feralas,76.06,43.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布隆克|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Bronk
step << Druid
.goto Feralas,76.0,42.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jannos|r交谈
.train 9884 >>训练你的职业法术
.target Jannos Lighthoof
.xp <50,1
.xp >52,1
step << Druid
#optional
.goto Feralas,76.0,42.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jannos|r交谈
.train 9894 >>训练你的职业法术
.target Jannos Lighthoof
.xp <52,1
step << Shaman
#phase 4-6
#completewith next
.goto Feralas,75.45,44.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏恩|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.target Shyn
step << Shaman
#phase 4-6
.goto Orgrimmar,38.66,35.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sagorne|r交谈
.accept 8410 >>接任务: |cRXP_WARN_元素掌握|r
.target Sagorne Creststrider
step << Shaman
#phase 4-6
#completewith HSXR
.goto Orgrimmar,45.13,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Crossroads >>飞往十字路口
.target Doras
step
#phase 1-3 << Shaman
#completewith next
.goto Feralas,75.45,44.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏恩|r交谈
.fly Crossroads >>飞往十字路口
.target Shyn
step
#label HSXR
.goto The Barrens,51.99,29.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板博兰德|r交谈
.home >>将你的炉石设置为十字路口
.target Innkeeper Boorand Plainswind
step
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.fly Ratchet >>飞往棘齿城
.target Devrak
step
#optional
.abandon 3062 >>放弃黑暗之心
.isOnQuest 3062
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 51-52 狂牙洞/诅咒之地
#displayname 51-52 狂牙洞/诅咒之地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南(50-60级)
#next 52-53 灼热峡谷/燃烧平原
step
.goto The Barrens,62.50,38.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Liv|r交谈
.accept 4502 >>接任务: |cRXP_LOOT_火山的活动|r
.target Liv Rizzlefix
step
.goto The Barrens,62.50,38.60
>>在建筑外的|cRXP_PICK_玛尔冯的箱子|r中搜刮, 可获得|cRXP_LOOT_石环|r
.complete 3444,1 
step
.goto The Barrens,63.74,38.66
.zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
.zoneskip Stranglethorn Vale
step
.goto Stranglethorn Vale,23.60,72.00
>>击杀|cRXP_ENEMY_Mok'rash|r. 击败后搜刮其掉落的 |T133694:0|t[|cRXP_LOOT_刺着字母的腰带|r], 并使用该物品开启任务
.collect 3985,1,8552 
.accept 8552 >>接任务: |cRXP_LOOT_刺着字母的腰带|r
.use 3985
.group 3
step
.goto Stranglethorn Vale,28.40,76.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Oglethorpe|r交谈
.turnin 648 >>交任务: |cRXP_FRIENDLY_拯救OOX-17/TN！|r
.target Oglethorpe Obnoticus
.isQuestComplete 648
step
.goto Stranglethorn Vale,28.40,76.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Oglethorpe|r交谈
.turnin 836 >>交任务: |cRXP_FRIENDLY_拯救OOX-09/HL！|r
.target Oglethorpe Obnoticus
.isQuestComplete 836
step
.goto Stranglethorn Vale,28.40,76.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Oglethorpe|r交谈
.turnin 2767 >>交任务: |cRXP_FRIENDLY_拯救OOX-22/FE！|r
.target Oglethorpe Obnoticus
.isQuestComplete 2767
step
.goto Stranglethorn Vale,28.40,76.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Oglethorpe|r交谈
.accept 3721 >>接任务: |cRXP_WARN_你自己的OOX|r
.turnin 3721 >>交任务: |cRXP_FRIENDLY_你自己的OOX|r
.target Oglethorpe Obnoticus
.isQuestTurnedIn 648
.isQuestTurnedIn 836
.isQuestTurnedIn 2767
step
.goto Stranglethorn Vale,26.70,73.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Smotts|r交谈
.turnin 8552 >>交任务: |cRXP_FRIENDLY_刺着字母的腰带|r
.target Captain Hecklebury Smotts
.isOnQuest 8552
.group
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯普罗格|r和|cRXP_FRIENDLY_斯普罗格|r交谈
.accept 615 >>接任务: |cRXP_LOOT_船长的弯刀|r
.goto Stranglethorn Vale,26.69,73.62
.turnin 615 >>交任务: |cRXP_FRIENDLY_船长的弯刀|r
.goto Stranglethorn Vale,26.66,73.64
.target Captain Hecklebury Smotts
.target Sprogger
.isQuestTurnedIn 8552
.group
step
#ah
.goto Stranglethorn Vale,26.70,73.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯普罗格|r交谈
.accept 8554 >>接任务: |cRXP_WARN_挑战奈古拉什|r
.target Sprogger
.group
step
#completewith next
.goto Stranglethorn Vale,26.55,76.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Viznik|r交谈
.bankwithdraw 4306,15 >>从你的银行提取 15 |T132905:0|t[丝绸布]
.target Viznik
step
.goto Stranglethorn Vale,27.70,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"海狼"|r交谈
.turnin 2874 >>交任务: |cRXP_FRIENDLY_给马克基雷的货物|r
.target "Sea Wolf" MacKinley
step
.goto Stranglethorn Vale,27.10,77.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威士忌斯利姆|r交谈
.turnin 580 >>交任务: |cRXP_FRIENDLY_威士忌斯利姆的酒|r
.target Whiskey Slim
step
.goto Stranglethorn Vale,27.10,77.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crank|r交谈
.turnin 1122 >>交任务: |cRXP_FRIENDLY_向菲兹巴布报告|r
.target Crank Fizzlebub
step
#ah
.goto Stranglethorn Vale,27.04,77.17,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nixxrax|r交谈
>>|cRXP_WARN_如果你没有获得|r|T133974:0|t[烧烤秃鹰翅膀]|cRXP_WARN_earlier(且队伍中无人拥有), 则跳过此步骤. 你需要总共10个翅膀来召唤|r|cRXP_ENEMY_奈古拉什|r
.vendor >>从|cRXP_FRIENDLY_Nixxrax|r处购买|cRXP_BUY_密林葡萄酒|r
.collect 4457,10 
.collect 4595,5 
.target Nixxrax Fillamug
.group
step
#ah
#completewith next
.goto Stranglethorn Vale,29.83,72.25,50,0
.goto Stranglethorn Vale,33.66,75.05,50,0
.subzone 43 >>从藏宝海湾向北前进, 然后向东前往海滩
.group
step
#ah
.goto Stranglethorn Vale,32.5,81.90
>>点击|cRXP_PICK_破损的救生艇|r
.turnin 619 >>交任务: |cRXP_FRIENDLY_引诱奈古拉什|r
.group
step
#ah
.goto Stranglethorn Vale,32.50,81.94
>>点击|cRXP_PICK_破损的救生艇|r召唤|cRXP_ENEMY_奈古拉什|r, 击杀他并搜刮出|cRXP_LOOT_斗士短剑|r
>>|cRXP_WARN_如果你没有获得|r|T133974:0|t[烧烤秃鹰翅膀]|cRXP_WARN_earlier(且队伍中无人拥有), 则跳过此步骤. 你需要总共10个翅膀来召唤|r|cRXP_ENEMY_奈古拉什|r
.complete 8554,1 
.unitscan Negolash
.group 3
step
#loop
.goto Stranglethorn Vale,34.22,73.25,0
.goto Stranglethorn Vale,34.01,77.21,0
.goto Stranglethorn Vale,32.34,79.44,0
.goto Stranglethorn Vale,32.38,82.23,0
.goto Stranglethorn Vale,34.22,73.25,60,0
.goto Stranglethorn Vale,34.01,77.21,60,0
.goto Stranglethorn Vale,32.34,79.44,60,0
.goto Stranglethorn Vale,32.38,82.23,60,0
>>在东南海岸掠夺埋藏的瓶子|r
.collect 4098,1,594
.accept 594 >>接任务: |cRXP_LOOT_瓶中信|r
step
.goto Stranglethorn Vale,38.53,80.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普巴尔公主|r交谈
.turnin 594 >>交任务: |cRXP_FRIENDLY_瓶中信|r
.accept 630 >>接任务: |cRXP_LOOT_瓶中信|r
.target Princess Poobah
.group
step
.goto Stranglethorn Vale,40.94,83.89
>>击杀|cRXP_ENEMY_穆克拉|r. 击败他后拾取他的|cRXP_LOOT_钥匙|r
>>|cRXP_WARN_清理|r|cRXP_ENEMY_穆克拉|r|cRXP_WARN_周围的空间, 因为他有恐惧效果|r
.complete 630,1 
.unitscan King Mukla
.group 4
step
.goto Stranglethorn Vale,38.53,80.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普巴尔公主|r交谈
.turnin 630 >>交任务: |cRXP_FRIENDLY_瓶中信|r
.target Princess Poobah
.group
step
#ah
.goto Stranglethorn Vale,26.70,73.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯普罗格|r交谈
.turnin 8554 >>交任务: |cRXP_FRIENDLY_引诱奈古拉什|r
.target Sprogger
.isQuestComplete 8554
.group
step << Shaman
#phase 4-6
.goto Stranglethorn Vale,26.55,76.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Viznik|r交谈
.bankwithdraw 7069,7068,7067,7070 >>从您的银行提取以下物品:
+|T135805:0|t[元素火焰]
+|T134714:0|t[元素之水]
+|T134572:0|t[元素之土]
+|T136107:0|t[元素空气]
.target Viznik
step << Rogue
.goto Stranglethorn Vale,26.82,77.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_Ian|r交谈
.train 8643 >>训练你的职业法术
.target Ian Strom
.xp <50,1
.xp >52,1
step << Rogue
#optional
.goto Stranglethorn Vale,26.82,77.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_Ian|r交谈
.train 11342 >>训练你的职业法术
.target Ian Strom
.xp <52,1
step
#ah
.goto Stranglethorn Vale,26.55,76.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Viznik|r交谈
.bankwithdraw 4306,8391,8392,8393,8396,8394 >>从您的银行提取以下物品:
+|T132905:0|t[丝绸] 
+|T133972:0|t[弯牙土狼的颚骨] 
+|T134343:0|t[诅咒之地的野猪肺] 
+|T133708:0|t[厚甲蝎螯] 
+|T134342:0|t[秃鹫的砂囊] 
+|T134340:0|t[石化蜥蜴的大脑] 
.target Viznik
step
#completewith StonardPots2
.goto Stranglethorn Vale,26.87,77.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格林戈|r交谈
.fly Stonard>>飞往斯托纳德
.target Gringer
step
.goto Swamp of Sorrows,47.90,55.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fel'zerul|r交谈
.turnin 1444 >>交任务: |cRXP_FRIENDLY_向费泽鲁尔复命|r
.target Fel'zerul
step << Hunter
.goto Swamp of Sorrows,47.27,53.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ogrom|r交谈
.train 13554 >>训练你的职业法术
.target Ogrom
.xp <50,1
.xp >52,1
step << Hunter
#optional
.goto Swamp of Sorrows,47.27,53.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ogrom|r交谈
.train 13543 >>训练你的职业法术
.target Ogrom
.xp <52,1
step << Warlock
.goto Swamp of Sorrows,48.64,55.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡托什|r交谈
.train 17925 >>训练你的职业法术
.target Kartosh
.xp <50,1
.xp >52,1
step << Warlock
#optional
.goto Swamp of Sorrows,48.64,55.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡托什|r交谈
.train 11675 >>训练你的职业法术
.target Kartosh
.xp <52,1
step << Warlock
.goto Swamp of Sorrows,48.59,55.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷沙卡|r交谈
.vendor >>购买任何你负担得起的宠物升级道具
.target Greshka
step << Shaman
#optional
.goto Swamp of Sorrows,48.19,57.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷沙卡|r交谈
.train 10437 >>训练你的职业法术
.target Haromm
.xp <50,1
.xp >52,1
step << Shaman
.goto Swamp of Sorrows,48.19,57.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷沙卡|r交谈
.train 10467 >>训练你的职业法术
.target Haromm
.xp <52,1
step << Warrior
#optional
.goto Swamp of Sorrows,44.89,57.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马尔罗什|r交谈
.train 1719 >>训练你的职业法术
.target Malosh
.xp <50,1
.xp >52,1
step << Warrior
.goto Swamp of Sorrows,44.89,57.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马尔罗什|r交谈
.train 11551 >>训练你的职业法术
.target Malosh
.xp <52,1
step
.goto Swamp of Sorrows,45.78,52.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏塔佐尔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Thultazor
step
#label StonardPots2
.goto Swamp of Sorrows,45.38,56.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的好友|r拉尔塔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Rartar
step << Warrior
#phase 4-6
.goto Swamp of Sorrows,34.20,66.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.accept 8423 >>接任务: |cRXP_WARN_战士的血脉|r
.target Fallen Hero of the Horde
step
#completewith BlastedEnd
.zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
step << Warrior
#phase 4-6
#loop
.goto Blasted Lands,53.60,37.20,0
.goto Blasted Lands,53.60,37.20,60,0
.goto Blasted Lands,54.60,41.40,60,0
.goto Blasted Lands,55.60,43.20,60,0
.goto Blasted Lands,52.80,41.80,60,0
.goto Blasted Lands,50.20,38.60,60,0
.goto Blasted Lands,48.00,37.60,60,0
.goto Blasted Lands,46.60,40.20,60,0
.goto Blasted Lands,44.60,37.00,60,0
.goto Blasted Lands,44.60,33.80,60,0
.goto Blasted Lands,48.00,34.40,60,0
.goto Blasted Lands,50.80,36.00,60,0
>>在诅咒之地击杀|cRXP_ENEMY_地狱野猪|r
.complete 8423,1 
.mob Helboar
step << Warrior
#phase 4-6
.goto Swamp of Sorrows,34.20,66.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.turnin 8423 >>交任务: |cRXP_FRIENDLY_战士的血脉|r
.accept 8424 >>接任务: |cRXP_WARN_魔誓者之战|r
.target Fallen Hero of the Horde
step
#era
#completewith BlastedEnd
>>在完成任务时, 请留意 |T134089:0|t[|cRXP_LOOT_不完美的德莱尼水晶碎片|r] 和一个 |T134564:0|t[|cRXP_LOOT_无暇的德莱尼水晶球|r]
.collect 10593,1,3501,1 
.collect 8244,1,3501,1 
step << Hunter/Rogue
#era
#completewith next
.blastedLands
#loop
.goto Blasted Lands,62.48,27.98,0
.goto Blasted Lands,49.00,18.20,70,0
.goto Blasted Lands,49.31,23.30,70,0
.goto Blasted Lands,45.25,22.64,70,0
.goto Blasted Lands,45.57,34.71,70,0
.goto Blasted Lands,52.98,37.94,70,0
.goto Blasted Lands,57.95,35.28,70,0
.goto Blasted Lands,56.69,29.18,70,0
.goto Blasted Lands,62.48,27.98,70,0
>>击杀|cRXP_ENEMY_Vultures|r. 击杀后搜刮其掉落的|cRXP_LOOT_Gizzards|r
>>击杀|cRXP_ENEMY_Basilisks|r. 击杀后搜刮其|cRXP_LOOT_Brains|r
>>击杀|cRXP_ENEMY_野猪|r. 从它们身上搜刮|cRXP_LOOT_肺|r
>>击杀|cRXP_ENEMY_蝎子|r. 击败它们后搜刮出|cRXP_LOOT_钳子|r
>>击杀 |cRXP_ENEMY_Hyenas|r. 搜刮它们的 |cRXP_LOOT_Jowls|r
>>|cRXP_WARN_优先击杀|cRXP_ENEMY_蝎子|r和|cRXP_ENEMY_鹰身女妖|r和|cRXP_ENEMY_野猪|r, 以便获得 25 点敏捷增益|r
>>|cRXP_WARN_|cRXP_ENEMY_蛇怪|r与|cRXP_ENEMY_野猪|r共享刷新点, 而|cRXP_ENEMY_鬣狗|r则与|cRXP_ENEMY_蝎子|r共享刷新点|r
.mob Redstone Basilisk
.mob Redstone Crystalhide
.mob Black Slayer
.mob Bone Picker
.mob Starving Snickerfang
.mob Snickerfang Hyena
.mob Scorpok Stinger
.mob Ashmane Boar
step << Hunter/Rogue
#era
.goto Blasted Lands,50.548,14.204
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥达兰大使|r交谈
>>|cRXP_WARN_一旦你拥有 3 个|cRXP_LOOT_Pincers|r和2 个|cRXP_LOOT_Gizzards|r和 1 个|cRXP_LOOT_Lung|r, 即可提交任务以获得 25 点敏捷增益|r
.collect 8393,3,2585,1 
.collect 8396,2,2585,1 
.collect 8392,1,2585,1 
.accept 2585 >>接任务: |cRXP_WARN_决定性的打击|r
.disablecheckbox
.turnin 2585 >>交任务: |cRXP_FRIENDLY_决定性的打击|r
.disablecheckbox
.target Bloodmage Drazial
step << Hunter/Rogue
#era
.goto Blasted Lands,50.548,14.204
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥达兰大使|r交谈
.accept 2585 >>接任务: |cRXP_WARN_决定性的打击|r
.turnin 2585 >>交任务: |cRXP_FRIENDLY_决定性的打击|r
.target Bloodmage Drazial
step << Druid/Shaman/Warrior
#era
#completewith next
.blastedLands
#loop
.goto Blasted Lands,62.48,27.98,0
.goto Blasted Lands,49.00,18.20,70,0
.goto Blasted Lands,49.31,23.30,70,0
.goto Blasted Lands,45.25,22.64,70,0
.goto Blasted Lands,45.57,34.71,70,0
.goto Blasted Lands,52.98,37.94,70,0
.goto Blasted Lands,57.95,35.28,70,0
.goto Blasted Lands,56.69,29.18,70,0
.goto Blasted Lands,62.48,27.98,70,0
>>击杀|cRXP_ENEMY_Vultures|r. 击杀后搜刮其掉落的|cRXP_LOOT_Gizzards|r
>>击杀|cRXP_ENEMY_Basilisks|r. 击杀后搜刮其|cRXP_LOOT_Brains|r
>>击杀|cRXP_ENEMY_野猪|r. 从它们身上搜刮|cRXP_LOOT_肺|r
>>击杀|cRXP_ENEMY_蝎子|r. 击败它们后搜刮出|cRXP_LOOT_钳子|r
>>击杀 |cRXP_ENEMY_Hyenas|r. 搜刮它们的 |cRXP_LOOT_Jowls|r
>>|cRXP_WARN_优先击杀|cRXP_ENEMY_Hyenas|r和|cRXP_ENEMY_Boars|r和|cRXP_ENEMY_Scorpids|r, 以便获得25点力量增益|r
>>|cRXP_WARN_|cRXP_ENEMY_蛇怪|r与|cRXP_ENEMY_野猪|r共享刷新点, 而|cRXP_ENEMY_鬣狗|r则与|cRXP_ENEMY_蝎子|r共享刷新点|r
.mob Redstone Basilisk
.mob Redstone Crystalhide
.mob Black Slayer
.mob Bone Picker
.mob Starving Snickerfang
.mob Snickerfang Hyena
.mob Scorpok Stinger
.mob Ashmane Boar
step << Druid/Shaman/Warrior
#era
.goto Blasted Lands,50.548,14.204
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥达兰大使|r交谈
>>|cRXP_WARN_一旦你拥有 3 个|cRXP_LOOT_Jowls|r和2 个|cRXP_LOOT_Lungs|r和 1 个|cRXP_LOOT_Pincer|r, 即可提交任务以获得 25 点力量增益|r
.collect 8391,3,2581,1 
.collect 8392,2,2581,1 
.collect 8393,1,2581,1 
.accept 2581 >>接任务: |cRXP_WARN_弯牙土狼的颚骨|r
.disablecheckbox
.turnin 2581 >>交任务: |cRXP_FRIENDLY_弯牙土狼的颚骨|r
.disablecheckbox
.target Bloodmage Drazial
step << Druid/Shaman/Warrior
#era
.goto Blasted Lands,50.548,14.204
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与血法师德拉吉亚交谈|cRXP_FRIENDLY_血法师德拉吉亚|r
.accept 2581 >>接任务: |cRXP_WARN_弯牙土狼的颚骨|r
.turnin 2581 >>交任务: |cRXP_FRIENDLY_弯牙土狼的颚骨|r
.target Bloodmage Drazial
step
#era
.blastedLands
#loop
.goto Blasted Lands,62.48,27.98,0
.goto Blasted Lands,49.00,18.20,70,0
.goto Blasted Lands,49.31,23.30,70,0
.goto Blasted Lands,45.25,22.64,70,0
.goto Blasted Lands,45.57,34.71,70,0
.goto Blasted Lands,52.98,37.94,70,0
.goto Blasted Lands,57.95,35.28,70,0
.goto Blasted Lands,56.69,29.18,70,0
.goto Blasted Lands,62.48,27.98,70,0
>>击杀|cRXP_ENEMY_Vultures|r. 击杀后搜刮其掉落的|cRXP_LOOT_Gizzards|r
>>击杀|cRXP_ENEMY_Basilisks|r. 击杀后搜刮其|cRXP_LOOT_Brains|r
>>击杀|cRXP_ENEMY_野猪|r. 从它们身上搜刮|cRXP_LOOT_肺|r
>>击杀|cRXP_ENEMY_蝎子|r. 击败它们后搜刮出|cRXP_LOOT_钳子|r
>>击杀 |cRXP_ENEMY_Hyenas|r. 搜刮它们的 |cRXP_LOOT_Jowls|r
>>|cRXP_WARN_|cRXP_ENEMY_蛇怪|r与|cRXP_ENEMY_野猪|r共享刷新点, 而|cRXP_ENEMY_鬣狗|r则与|cRXP_ENEMY_蝎子|r共享刷新点|r
.mob Redstone Basilisk
.mob Redstone Crystalhide
.mob Black Slayer
.mob Bone Picker
.mob Starving Snickerfang
.mob Snickerfang Hyena
.mob Scorpok Stinger
.mob Ashmane Boar
step
#era
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_血法师莱诺雷|r和|cRXP_FRIENDLY_血法师德拉吉亚|r
.accept 2601 >>接任务: |cRXP_WARN_石化蜥蜴的大脑|r
.turnin 2601 >>交任务: |cRXP_FRIENDLY_石化蜥蜴的大脑|r
.accept 2603 >>接任务: |cRXP_WARN_秃鹫的活力|r
.turnin 2603 >>交任务: |cRXP_FRIENDLY_秃鹫的活力|r
.target +Bloodmage Lynnore
.goto Blasted Lands,50.640,14.299
.accept 2585 >>接任务: |cRXP_WARN_决定性的打击|r
.turnin 2585 >>交任务: |cRXP_FRIENDLY_决定性的打击|r
.accept 2583 >>接任务: |cRXP_WARN_野猪的活力|r
.turnin 2583 >>交任务: |cRXP_FRIENDLY_野猪的活力|r
.accept 2581 >>接任务: |cRXP_WARN_弯牙土狼的颚骨|r
.turnin 2581 >>交任务: |cRXP_FRIENDLY_弯牙土狼的颚骨|r
.target +Bloodmage Drazial
.goto Blasted Lands,50.548,14.204
.addquestitem 8391,2581
.addquestitem 8392,2583
.addquestitem 8393,2585
.addquestitem 8394,2601
.addquestitem 8396,2603
step
#era
#optional
#completewith BlastedEnd
.goto Blasted Lands,51.799,35.636
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kum'isha the Collector|r交谈
.accept 3501 >>接任务: |cRXP_WARN_多多益善|r
.turnin 3501 >>交任务: |cRXP_FRIENDLY_多多益善|r
.collect 10593,1,3501,1 
.itemcount 10593,1 
.target Kum'isha the Collector
step
#era
#optional
#completewith BlastedEnd
.goto Blasted Lands,51.799,35.636
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kum'isha the Collector|r交谈
.accept 2521 >>接任务: |cRXP_WARN_为库米沙效力|r
.turnin 2521 >>交任务: |cRXP_FRIENDLY_为库米沙效力|r
.collect 8244,1,2521,1 
.itemcount 8244,1 
.target Kum'isha the Collector
step << Warrior
#era
#phase 4-6
#loop
.line Blasted Lands,62.4,39.4,62.4,43.0,64.6,47.8,64.0,45.6,63.6,42.6,63.6,39.2,62.4,39.4
.goto Blasted Lands,62.40,39.40,0
.goto Blasted Lands,62.40,39.40,50,0
.goto Blasted Lands,62.40,43.00,50,0
.goto Blasted Lands,64.60,47.80,50,0
.goto Blasted Lands,64.00,45.60,50,0
.goto Blasted Lands,63.60,42.60,50,0
.goto Blasted Lands,63.60,39.20,50,0
.complete 8424,1 
.mob +Shadowsworn Adept
.complete 8424,2 
.mob +Shadowsworn Cultist
.complete 8424,3 
.mob +Shadowsworn Thug
>>|CRXP_WARN_如果你进入洞穴, 请小心两端的两个精英怪|r
step << Warrior
#era
#phase 4-6
.goto Swamp of Sorrows,34.20,66.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.turnin 8424 >>交任务: |cRXP_FRIENDLY_魔誓者之战|r
.target Fallen Hero of the Horde
step
#label BlastedEnd
#completewith next
.subzone 75 >>前往斯托纳德
.subzoneskip 75
step
.goto Swamp of Sorrows,45.78,52.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏塔佐尔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Thultazor
step
.goto Swamp of Sorrows,45.38,56.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的好友|r拉尔塔|r交谈
.vendor >>|cRXP_BUY_购买|r|T134833:0|t[优质治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
.target Rartar
step
.goto Swamp of Sorrows,46.10,54.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布雷依克|r交谈
.fly Badlands>>飞往荒芜之地
.target Breyk
step
#optional
.abandon 8554 >>放弃挑战奈古拉什
.isOnQuest 8554
step
#optional
.abandon 630 >>丢弃瓶中信
.isOnQuest 630
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 52-53 灼热峡谷/燃烧平原
#displayname 52-53 灼热峡谷/燃烧平原 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南(50-60级)
#next 53-54 艾萨拉
step
.goto Badlands,2.80,45.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高恩|r交谈
.accept 793 >>接任务: |cRXP_LOOT_破碎的联盟|r
.target Gorn
.group
step
#completewith next
.goto Badlands,79.97,36.57,50,0
.subzone 339 >>向东前往莱瑟洛峡谷
.isOnQuest 793
.group
step
.goto Badlands,72.30,66.80
>>掠夺|cRXP_PICK_玛瑙石柱|r以获得|cRXP_LOOT_玛瑙符石|r
.collect 4844,1 
.isOnQuest 793
.group 4
step
.goto Badlands,81.30,64.20
>>掠夺|cRXP_PICK_紫水晶石柱|r以获得|cRXP_LOOT_紫水晶符石|r
.collect 4843,1 
.isOnQuest 793
.group 4
step
.goto Badlands,83.50,32.90
>>掠夺|cRXP_PICK_钻石柱|r以获得|cRXP_LOOT_星钻符石|r
.collect 4845,1 
.isOnQuest 793
.group 4
step
.goto Badlands,81.70,49.90
>>收集完3块符文石后, 点击|cRXP_PICK_大地封印|r召唤|cRXP_ENEMY_布莱克拉什|r和|cRXP_ENEMY_赫玛图斯|r
.accept 795 >>接任务: |cRXP_WARN_大地封印|r
.turnin 795 >>交任务: |cRXP_FRIENDLY_大地封印|r
.isOnQuest 793
.group
step
.goto Badlands,81.70,49.90
>>击杀|cRXP_ENEMY_布莱克拉什|r和|cRXP_ENEMY_赫玛图斯|r. 击败他们后搜刮其掉落的|cRXP_LOOT_Bindings|r和|cRXP_LOOT_Chains|r
>>|cRXP_WARN_通过首先击杀|r|cRXP_ENEMY_赫玛图斯|r|cRXP_WARN_, 可简化此次遭遇, 因为他的火焰冲击会随之增强|r|cRXP_ENEMY_黑拉什|r|cRXP_WARN_的火焰吐息|r
.complete 793,1 
.mob +Blacklash
.complete 793,2 
.mob +Hematus
.isOnQuest 793
.group 4
step
>>如果你没有15块丝绸布, 可以到安戈尔要塞或锤趾挖掘场, 从|cRXP_ENEMY_影炉矮人|r那里收集
>>|cRXP_WARN_你将需要这块布来完成一个即将到来的任务. 荒芜之地怪物的掉落率比灼热峡谷怪物高得多|r
.collect 4306,15 
.group
step
.goto Badlands,2.80,45.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高恩|r交谈
.turnin 793 >>交任务: |cRXP_FRIENDLY_破碎的联盟|r
.target Gorn
.isQuestComplete 793
.group
step
.goto Badlands,3.40,48.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thal'trak|r交谈
>>|cRXP_WARN_你可能需要等待|r|cRXP_FRIENDLY_塔尔特拉克|r|cRXP_WARN_完成他的角色扮演. 只需跟随他即可|r
.accept 3821 >>接任务: |cRXP_LOOT_巨槌石|r
.target Thal'trak Proudtusk
step
#completewith HoardO
>>如果你没有15个丝绸布, 可以到尘吐洞穴中从|cRXP_ENEMY_火烟食人魔|r处收集
>>|cRXP_WARN_你将需要这块布来完成一个即将到来的任务. 荒芜之地怪物的掉落率比灼热峡谷怪物高得多|r
.collect 4306,15 
step
.goto Badlands,3.62,61.88,50,0
.goto Searing Gorge,72.34,55.47
.zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
step
.goto Searing Gorge,65.55,62.15
>>点击|cRXP_PICK_木制厕所|r
.accept 4449 >>接任务: |cRXP_LOOT_被锁起来的矮人|r
step
#loop
.goto Searing Gorge,63.43,60.91,0
.goto Searing Gorge,69.29,33.39,0
.goto Searing Gorge,63.43,60.91,40,0
.goto Searing Gorge,69.29,33.39,40,0
>>击杀|cRXP_ENEMY_黑铁地质学家|r
>>|cRXP_WARN_你可能需要在北部营地与南部挖掘点之间来回奔波, 才能完成这个任务|r
.complete 4449,1 
.mob Dark Iron Geologist
step
.goto Searing Gorge,39.10,39.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velarok|r交谈, 然后完成他的对话
.accept 3441 >>接任务: |cRXP_LOOT_神圣的惩戒|r
.complete 3441,1 
.target Velarok Windblade
.skipgossip
step
.goto Searing Gorge,39.05,38.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velarok|r交谈
.turnin 3441 >>交任务: |cRXP_FRIENDLY_神圣的惩戒|r
.accept 3442 >>接任务: |cRXP_LOOT_无瑕之焰|r
.target Velarok Windblade
step
#completewith next
.goto Searing Gorge,32.50,32.48,30,0
.subzone 1446 >>向西沿山坡上行, 前往钍金点
step
.goto Searing Gorge,34.84,30.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞沙|r交谈
.fp Thorium >>获取灼热峡谷飞行路径
.target Grisha
step
.goto Searing Gorge,38.58,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈尼塞尔|r交谈
.accept 7723 >>接任务: |cRXP_LOOT_该死的手指头！|r
.accept 7724 >>接任务: |cRXP_LOOT_熔岩蜘蛛的威胁！|r
.accept 7727 >>接任务: |cRXP_LOOT_熏火龙|r
.target Hansel Heavyhands
step
.goto Searing Gorge,37.64,26.47
>>点击|cRXP_PICK_通缉/遗失/招领|r板
.accept 7728 >>接任务: |cRXP_LOOT_被盗：鼓风机和望远镜|r
.accept 7729 >>接任务: |cRXP_LOOT_工作机会：肃清竞争对手|r
step
#completewith Spiders
>>击杀|cRXP_ENEMY_作战傀儡|r和|cRXP_ENEMY_元素生物|r, 击败它们后拾取其掉落的|cRXP_LOOT_烈焰之心|r和|cRXP_LOOT_傀儡之油|r
>>|cRXP_WARN_击杀你看到的任何|r|cRXP_ENEMY_熔岩元素|r|cRXP_WARN_. 它们可能掉落任务物品|r
.complete 3442,1 
.complete 3442,2 
.mob Heavy War Golem
.mob Tempered War Golem
.mob Inferno Elemental
.mob Blazing Elemental
.unitscan Magma Elemental
step
#completewith 元素生物
.goto Searing Gorge,32.6,55.0,40,0
.goto Searing Gorge,36.2,61.6,40,0
.goto Searing Gorge,44.6,62.6,40,0
.goto Searing Gorge,52.4,57.8,40,0
.goto Searing Gorge,51.4,55.8,40,0
>>击杀|cRXP_ENEMY_黑铁哨兵|r. 掠夺他们以获得|cRXP_LOOT_哨望者望远镜|r
.complete 7728,2 
.mob Dark Iron Lookout
step
#completewith 元素生物
.goto Searing Gorge,38.0,49.8,40,0
.goto Searing Gorge,40.8,49.8,40,0
.goto Searing Gorge,42.8,51.6,40,0
>>击杀|cRXP_ENEMY_黑铁锻造师|r. 击败后可获得|cRXP_LOOT_冶炼鼓风机|r
.complete 7728,1 
.unitscan Dark Iron Steamsmith
step
#label Spiders
#loop
.goto Searing Gorge,33.00,39.60,0
.goto Searing Gorge,33.00,39.60,60,0
.goto Searing Gorge,28.80,43.80,60,0
.goto Searing Gorge,27.60,52.00,60,0
.goto Searing Gorge,30.80,59.80,60,0
.goto Searing Gorge,26.60,69.40,60,0
.goto Searing Gorge,22.60,74.00,60,0
.goto Searing Gorge,25.00,76.20,60,0
.goto Searing Gorge,29.60,75.80,60,0
.goto Searing Gorge,30.60,71.80,60,0
.goto Searing Gorge,31.80,66.40,60,0
.goto Searing Gorge,30.80,59.80,60,0
.goto Searing Gorge,27.60,52.00,60,0
.goto Searing Gorge,28.80,43.80,60,0
>>击杀沿西部/西南部山脉的巨型熔岩蜘蛛|r
.complete 7724,1 
.mob Greater Lava Spider
step
#completewith next
.goto Searing Gorge,43.61,40.78,0
.goto Searing Gorge,32.54,47.19,0
>>击杀|cRXP_ENEMY_重型作战傀儡|r
.complete 7723,1 
.mob Heavy War Golem
step
#label 元素生物
#loop
.goto Searing Gorge,44.00,38.20,0
.goto Searing Gorge,44.00,38.20,60,0
.goto Searing Gorge,46.60,37.80,60,0
.goto Searing Gorge,47.00,41.40,60,0
.goto Searing Gorge,43.60,44.60,60,0
.goto Searing Gorge,40.60,44.80,60,0
.goto Searing Gorge,36.80,47.60,60,0
.goto Searing Gorge,33.20,52.20,60,0
.goto Searing Gorge,34.00,59.60,60,0
.goto Searing Gorge,36.60,62.80,60,0
.goto Searing Gorge,32.60,70.60,60,0
.goto Searing Gorge,30.60,64.60,60,0
.goto Searing Gorge,28.40,64.00,60,0
.goto Searing Gorge,25.60,53.60,60,0
.goto Searing Gorge,32.40,53.60,60,0
.goto Searing Gorge,33.80,47.40,60,0
.goto Searing Gorge,35.60,41.20,60,0
.goto Searing Gorge,37.60,44.60,60,0
.goto Searing Gorge,40.60,42.80,60,0
>>击杀|cRXP_ENEMY_作战傀儡|r 和|cRXP_ENEMY_元素生物|r. 击败后掠夺其掉落的|cRXP_LOOT_烈焰之心|r 和|cRXP_LOOT_傀儡之油|r
>>|cRXP_WARN_击杀你看到的任何|r|cRXP_ENEMY_熔岩元素|r|cRXP_WARN_. 它们可能掉落任务物品|r
.complete 3442,1 
.complete 3442,2 
.mob Heavy War Golem
.mob Tempered War Golem
.mob Inferno Elemental
.mob Blazing Elemental
.unitscan Magma Elemental
step
#label WarGolems
#loop
.goto Searing Gorge,35.16,45.78,0
.goto Searing Gorge,35.16,45.78,70,0
.goto Searing Gorge,40.40,44.42,70,0
.goto Searing Gorge,45.72,41.98,70,0
.goto Searing Gorge,50.66,39.23,70,0
>>击杀|cRXP_ENEMY_重型作战傀儡|r
.complete 7723,1 
.mob Heavy War Golem
step
.goto Searing Gorge,39.05,38.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velarok|r交谈
.turnin 3442 >>交任务: |cRXP_FRIENDLY_无瑕之焰|r
.accept 3443 >>接任务: |cRXP_LOOT_铸造火炬杆|r
.target Velarok Windblade
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈尼塞尔|r交谈
.turnin 7724 >>交任务: |cRXP_FRIENDLY_熔岩蜘蛛的威胁！|r
.turnin 7723 >>交任务: |cRXP_FRIENDLY_该死的手指头！|r
.goto Searing Gorge,38.58,27.80
.target Hansel Heavyhands
step
.goto Searing Gorge,37.64,26.47
.accept 7701 >>接任务: |cRXP_LOOT_悬赏：工头玛托留斯|r
.group
step
.goto Searing Gorge,38.58,27.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大铁匠博恩奈特|r交谈
.accept 7722 >>接任务: |cRXP_LOOT_绝密配方！|r
.target Master Smith Burninate
.group
step
#completewith next
.goto Searing Gorge,47.54,46.89,30 >>跳到平台, 进入洞穴
step
.goto Searing Gorge,51.49,36.55,40,0
#loop
.goto Searing Gorge,51.36,32.24,0
.goto Searing Gorge,51.36,32.24,50,0
.goto Searing Gorge,50.35,24.24,50,0
.goto Searing Gorge,46.76,20.91,50,0
.goto Searing Gorge,44.04,25.41,50,0
.goto Searing Gorge,48.64,27.42,50,0
.goto Searing Gorge,49.68,31.63,50,0
>>下到洞穴的底层, 然后击杀|cRXP_ENEMY_Incendosaurs|r
.complete 7727,1 
.mob Incendosaur
step
#completewith Shanksinnit
.goto Searing Gorge,48.41,41.08,40,0
.goto Searing Gorge,47.94,47.58,40,0
.goto Searing Gorge,49.86,45.97,40,0
.goto Searing Gorge,49.75,45.82,35 >>离开洞穴, 沿平台向上前进, 从较高层重新进入洞穴
step
#completewith Shanksinnit
>>击杀 |cRXP_ENEMY_黑铁工头|r和 |cRXP_ENEMY_黑铁奴隶贩子|r
.complete 7729,1 
.mob +Dark Iron Taskmaster
.complete 7729,2 
.mob +Dark Iron Slaver
step
.goto Searing Gorge,40.45,35.75
>>再次离开洞穴, 然后从右侧重新进入
>>击杀 |cRXP_ENEMY_工头玛托留斯|r. 击败他后搜刮其 |cRXP_LOOT_头颅|r, 并拾取 |cRXP_PICK_秘密设计图：炽热助熔剂|r
>>|cRXP_WARN_这是一场具有挑战性的战斗. 在获取计划前, 请先清空整个房间, 为风筝打法或逃生开辟路径|r
.complete 7722,1 
.complete 7701,1 
.unitscan Overseer Maltorius
.isOnQuest 7701
.group 3
step
#loop
.goto Searing Gorge,46.36,53.91,0
.goto Searing Gorge,46.36,53.91,50,0
.goto Searing Gorge,42.75,54.91,50,0
.goto Searing Gorge,41.35,53.44,50,0
.goto Searing Gorge,37.97,49.17,50,0
.goto Searing Gorge,39.32,44.55,50,0
.goto Searing Gorge,37.97,49.17,50,0
.goto Searing Gorge,35.85,42.12,50,0
.goto Searing Gorge,38.16,38.35,50,0
.goto Searing Gorge,39.24,32.84,50,0
.goto Searing Gorge,41.60,26.95,50,0
.goto Searing Gorge,43.59,22.85,50,0
.goto Searing Gorge,43.46,28.38,50,0
.goto Searing Gorge,46.04,25.49,50,0
.goto Searing Gorge,45.47,30.46,50,0
.goto Searing Gorge,43.13,32.50,50,0
.goto Searing Gorge,43.41,35.64,50,0
.goto Searing Gorge,48.27,43.38,50,0
.goto Searing Gorge,49.88,46.10,50,0
.goto Searing Gorge,48.28,50.79,50,0
>>击杀所有|cRXP_ENEMY_暗铁矮人|r和|cRXP_ENEMY_奴隶工人|r. 搜刮他们的|cRXP_LOOT_匕首|r
.complete 3443,1 
.mob Dark Iron Steamsmith
.mob Dark Iron Lookout
.mob Dark Iron Slaver
.mob Dark Iron Taskmaster
.mob Dark Iron Geologist
.mob Dark Iron Watchman
.mob Dark Iron Steelshifter
.mob Dark Iron Kidnapper
step
#label Shanksinnit
#loop
.goto Searing Gorge,46.36,53.91,0
.goto Searing Gorge,46.36,53.91,50,0
.goto Searing Gorge,42.75,54.91,50,0
.goto Searing Gorge,41.35,53.44,50,0
.goto Searing Gorge,37.97,49.17,50,0
.goto Searing Gorge,39.32,44.55,50,0
.goto Searing Gorge,37.97,49.17,50,0
.goto Searing Gorge,35.85,42.12,50,0
.goto Searing Gorge,38.16,38.35,50,0
.goto Searing Gorge,39.24,32.84,50,0
.goto Searing Gorge,41.60,26.95,50,0
.goto Searing Gorge,43.59,22.85,50,0
.goto Searing Gorge,43.46,28.38,50,0
.goto Searing Gorge,46.04,25.49,50,0
.goto Searing Gorge,45.47,30.46,50,0
.goto Searing Gorge,43.13,32.50,50,0
.goto Searing Gorge,43.41,35.64,50,0
.goto Searing Gorge,48.27,43.38,50,0
.goto Searing Gorge,49.88,46.10,50,0
.goto Searing Gorge,48.28,50.79,50,0
>>继续击杀|cRXP_ENEMY_暗铁矮人|r, 直到你获得物品:|T134246:0|t[|cRXP_LOOT_格里塞特厕所钥匙|r]
>>|cRXP_WARN_暂时不要接受任务！这可能会导致任务日志异常|r
.collect 11818,1,4451 
.mob Dark Iron Steamsmith
.mob Dark Iron Lookout
.mob Dark Iron Slaver
.mob Dark Iron Taskmaster
.mob Dark Iron Geologist
.mob Dark Iron Watchman
.mob Dark Iron Steelshifter
.mob Dark Iron Kidnapper
step << skip
#completewith next
.goto Searing Gorge,35.45,23.51,50 >>登出以跳过洞穴. 有许多不同的地点可供使用
.link https://www.youtube.com/watch?v=-mcsjDkeSUw >>点击此处查看参考
step
.goto Searing Gorge,39.05,38.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velarok|r交谈
.turnin 3443 >>交任务: |cRXP_FRIENDLY_铸造火炬杆|r
.accept 3452 >>接任务: |cRXP_LOOT_烈焰之盒|r
.target Velarok Windblade
.group
step
.goto Searing Gorge,39.05,38.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velarok|r交谈
.turnin 3443 >>交任务: |cRXP_FRIENDLY_铸造火炬杆|r
.target Velarok Windblade
step
.goto Searing Gorge,26.56,35.03,70,0
#loop
.goto Searing Gorge,24.56,39.25,0
.goto Searing Gorge,24.56,39.25,50,0
.goto Searing Gorge,22.50,39.77,50,0
.goto Searing Gorge,22.18,36.45,50,0
.goto Searing Gorge,24.52,34.62,50,0
.goto Searing Gorge,25.02,31.00,50,0
.goto Searing Gorge,25.74,29.39,50,0
.goto Searing Gorge,22.33,26.85,50,0
.goto Searing Gorge,25.73,25.38,50,0
.goto Searing Gorge,27.43,24.93,50,0
.goto Searing Gorge,25.74,29.39,50,0
.goto Searing Gorge,25.02,31.00,50,0
.goto Searing Gorge,24.52,34.62,50,0
>>击杀|cRXP_ENEMY_Twilight暮光怪物|r. 击败它们后可获得|cRXP_LOOT_拉格纳罗斯符记|r
.complete 3452,1 
.mob Twilight Dark Shaman
.mob Twilight Fire Guard
.mob Twilight Geomancer
.mob Twilight Idolater
.isOnQuest 3452
.group 3
step
.isQuestComplete 3452
.goto Searing Gorge,39.057,38.990
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velarok Windblade|r交谈
.turnin 3452 >>交任务: |cRXP_FRIENDLY_烈焰之盒|r
.accept 3453 >>接任务: |cRXP_LOOT_惩戒火炬|r
.timer 28,惩戒之火炬 RP
.turnin 3453 >>交任务: |cRXP_FRIENDLY_惩戒火炬|r
.accept 3454 >>接任务: |cRXP_LOOT_惩戒火炬|r
.target Velarok Windblade
.group
step
.isQuestTurnedIn 3452
.goto Searing Gorge,39.057,38.990
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velarok Windblade|r交谈
.accept 3453 >>接任务: |cRXP_LOOT_惩戒火炬|r
.timer 28,惩戒之火炬 RP
.turnin 3453 >>交任务: |cRXP_FRIENDLY_惩戒火炬|r
.accept 3454 >>接任务: |cRXP_LOOT_惩戒火炬|r
.target Velarok Windblade
.group
step
.isQuestTurnedIn 3452
.goto Searing Gorge,39.055,39.067
>>点击|cRXP_PICK_惩戒火炬|r
.turnin 3454 >>交任务: |cRXP_FRIENDLY_惩戒火炬|r
.group
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velarok|r和|cRXP_FRIENDLY_Maltrake|r交谈
.accept 3462 >>接任务: |cRXP_LOOT_侍卫玛特拉克|r
.target +Velarok Windblade
.goto Searing Gorge,39.06,38.99
.turnin 3462 >>交任务: |cRXP_FRIENDLY_侍卫玛特拉克|r
.accept 3463 >>接任务: |cRXP_LOOT_烧掉它们！|r
.target +Squire Maltrake
.goto Searing Gorge,39.17,39.00
.isQuestTurnedIn 3452
.group
step
#completewith OuthouseAndy
.goto Searing Gorge,34.08,53.99,0
>>击杀|cRXP_ENEMY_黑铁哨兵|r. 掠夺他们以获得|cRXP_LOOT_哨兵的眼镜|r
.complete 7728,2 
.mob Dark Iron Lookout
step
#completewith WarGolems
.goto Searing Gorge,40.90,50.31,0
>>击杀 |cRXP_ENEMY_黑铁锻造师|r. 掠夺他们以获得 |cRXP_LOOT_冶炼鼓风机|r
.complete 7728,1 
.unitscan Dark Iron Steamsmith
step
.goto Searing Gorge,33.30,54.47
.use 10515 >>装备 |T135466:0|t[惩戒火炬], 然后爬上塔楼并点击|cRXP_PICK_哨岗火盆|r
.complete 3463,4 
.unitscan Dark Iron Sentry
.isQuestTurnedIn 3452
.group
step
#loop
.goto Searing Gorge,40.43,49.37,0
.goto Searing Gorge,42.91,51.73,50,0
.goto Searing Gorge,40.43,49.37,50,0
.goto Searing Gorge,37.81,49.66,50,0
>>击杀 |cRXP_ENEMY_黑铁锻造师|r. 掠夺他们以获得 |cRXP_LOOT_冶炼鼓风机|r
.complete 7728,1 
.unitscan Dark Iron Steamsmith
step
.goto Searing Gorge,35.66,60.68
.use 10515 >>装备 |T135466:0|t[惩戒火炬], 然后爬上塔楼并点击|cRXP_PICK_哨岗火盆|r
.complete 3463,1 
.unitscan Dark Iron Sentry
.isQuestTurnedIn 3452
.group
step
.goto Searing Gorge,44.03,60.90
.use 10515 >>装备 |T135466:0|t[惩戒火炬], 然后爬上塔楼并点击|cRXP_PICK_哨岗火盆|r
.complete 3463,2 
.unitscan Dark Iron Sentry
.isQuestTurnedIn 3452
.group
step
#label OuthouseAndy
.goto Searing Gorge,65.59,62.17
>>点击|cRXP_PICK_木制厕所|r
.turnin 4449 >>交任务: |cRXP_FRIENDLY_被锁起来的矮人|r
.addquestitem 4306,4449
step
.goto Searing Gorge,65.59,62.17
>>使用 |T134246:0|t[|cRXP_LOOT_格里塞特厕所钥匙|r] 接受任务
.collect 11818,1,4451 
.accept 4451 >>接任务: |cRXP_LOOT_自由的钥匙|r
.use 11818
step
.goto Searing Gorge,65.59,62.17
>>点击|cRXP_PICK_木制厕所|r
.turnin 4451 >>交任务: |cRXP_FRIENDLY_自由的钥匙|r
step
#label OuthouseAndy
.goto Searing Gorge,50.10,54.70
.use 10515 >>装备 |T135466:0|t[惩戒火炬], 然后爬上塔楼并点击|cRXP_PICK_哨岗火盆|r
>>|cRXP_WARN_小心, 北侧的桥可能会掉下去！离开塔时务必跳上桥|r << !Tauren
.complete 3463,3 
.unitscan Dark Iron Sentry
.isQuestTurnedIn 3452
.group
step
.goto Searing Gorge,34.08,53.99
>>击杀|cRXP_ENEMY_黑铁哨兵|r. 掠夺他们以获得|cRXP_LOOT_哨兵的眼镜|r
.complete 7728,2 
.mob Dark Iron Lookout
step
#loop
.goto Searing Gorge,46.36,53.91,0
.goto Searing Gorge,46.36,53.91,50,0
.goto Searing Gorge,42.75,54.91,50,0
.goto Searing Gorge,41.35,53.44,50,0
.goto Searing Gorge,37.97,49.17,50,0
.goto Searing Gorge,39.32,44.55,50,0
.goto Searing Gorge,37.97,49.17,50,0
.goto Searing Gorge,35.85,42.12,50,0
.goto Searing Gorge,38.16,38.35,50,0
.goto Searing Gorge,39.24,32.84,50,0
.goto Searing Gorge,41.60,26.95,50,0
.goto Searing Gorge,43.59,22.85,50,0
.goto Searing Gorge,43.46,28.38,50,0
.goto Searing Gorge,46.04,25.49,50,0
.goto Searing Gorge,45.47,30.46,50,0
.goto Searing Gorge,43.13,32.50,50,0
.goto Searing Gorge,43.41,35.64,50,0
.goto Searing Gorge,48.27,43.38,50,0
.goto Searing Gorge,49.88,46.10,50,0
.goto Searing Gorge,48.28,50.79,50,0
>>击杀 |cRXP_ENEMY_黑铁工头|r和 |cRXP_ENEMY_黑铁奴隶贩子|r
.complete 7729,1 
.mob +Dark Iron Taskmaster
.complete 7729,2 
.mob +Dark Iron Slaver
step
#completewith next
.goto Searing Gorge,39.05,38.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maltrake|r交谈
.turnin 3463 >>交任务: |cRXP_FRIENDLY_烧掉它们！|r
.target Squire Maltrake
.isQuestTurnedIn 3452
.group
step
.goto Searing Gorge,38.85,38.99
>>在地上打开宝箱两次, 然后打开|cRXP_PICK_黑龙军团宝箱|r并拾取|cRXP_LOOT_黑龙皮|r
.accept 3481 >>接任务: |cRXP_LOOT_打开箱子…|r
.turnin 3481 >>交任务: |cRXP_FRIENDLY_打开箱子…|r
.isQuestTurnedIn 3452
.group
step
.goto Searing Gorge,37.60,26.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛洛|r交谈
.turnin 7701 >>交任务: |cRXP_FRIENDLY_悬赏：工头玛托留斯|r
.target Lookout Captain Lolo Longstriker
.isQuestComplete 7701
.group
step
#completewith next
.goto Searing Gorge,32.50,32.48,30,0
.subzone 1446 >>前往钍金岛
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hansel|r和|cRXP_FRIENDLY_Scrange|r交谈
.turnin 7727 >>交任务: |cRXP_FRIENDLY_熏火龙|r
.target +Hansel Heavyhands
.goto Searing Gorge,38.58,27.80
.turnin 7728 >>交任务: |cRXP_FRIENDLY_被盗：鼓风机和望远镜|r
.target +Taskmaster Scrange
.goto Searing Gorge,38.98,27.50
step
.goto Searing Gorge,38.80,28.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大铁匠博恩奈特|r交谈
.turnin 7722 >>交任务: |cRXP_FRIENDLY_绝密配方！|r
.target Master Smith Burninate
.isQuestComplete 7722
.group
step
.goto Searing Gorge,38.80,28.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Scrange|r交谈
.turnin 7729 >>交任务: |cRXP_FRIENDLY_工作机会：肃清竞争对手|r
.target Taskmaster Scrange
.isQuestComplete 7729
step << skip
#completewith next
.goto Searing Gorge,69.2,71.6,50,0
.goto Searing Gorge,73.2,76.0,50,0
.goto Searing Gorge,73.61,82.93
+跑到灼热峡谷东南部, 找到 |cRXP_ENEMY_狂暴的玛尔戈|r. 等他巡逻完离开洞穴后, 再退出游戏, 从洞穴后方的蘑菇处跳过 << Druid/Shaman
>>注意, |cRXP_ENEMY_Margol|r对自然系法术免疫 << Shaman/Druid
+前往灼热峡谷东南部, 找到狂暴的玛尔戈. 等他巡逻至洞穴外(或直接击杀他), 然后退出游戏, 从洞穴后方的蘑菇处跳过 << !Druid !Shaman
.link https://www.youtube.com/watch?v=0_g2SY2JKt8 >>点击此处查看参考
step
#completewith next
.goto Searing Gorge,59.80,77.65,0
.goto Searing Gorge,59.80,77.65,50,0
.goto Searing Gorge,59.57,85.06,20,0
.goto Burning Steppes,46.59,21.45
.zone Burning Steppes >>前往: |cRXP_PICK_燃烧平原|r
>>|cRXP_WARN_或者你可以穿越黑石山|r
.link https://www.youtube.com/watch?v=tFVsNuMvI5c&ab_channel=RestedXP >>点击此处查看参考
step
.goto Burning Steppes,65.69,24.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦格鲁克|r交谈
.fp Flame Crest >>获取燃烧平原的飞行路径
.target Vahgruk
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tinkee|r和|cRXP_FRIENDLY_Maxwort|r交谈
.accept 4726 >>接任务: |cRXP_LOOT_雏龙精华|r
.target +Tinkee Steamboil
.goto Burning Steppes,65.24,24.01
.accept 4296 >>接任务: |cRXP_LOOT_七贤石板|r
.target +Maxwort Uberglint
.goto Burning Steppes,65.15,23.94
step
#completewith HoardO
.use 12284 >>使用你的 |T133001:0|t[龙灵采集器900型] 攻击|cRXP_ENEMY_黑色小龙|r, 然后击杀它们, 并从它们尸体上的|cRXP_PICK_红石碑|r中获取|cRXP_LOOT_雏龙精华|r
.complete 4726,1 
.mob Black Broodling
step
.goto Burning Steppes,54.10,40.70
>>点击矮人雕像前的|cRXP_PICK_石板|r以生成|cRXP_LOOT_石板拓文|r
.complete 4296,1 
step
.goto Burning Steppes,77.68,38.23,60,0
.goto Burning Steppes,79.80,45.60
>>过桥后上山, 点击祭坛顶端的|cRXP_PICK_沙妮·长齿的遗骸|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sha'ni|r交谈
>>|cRXP_WARN_注意|r|cRXP_ENEMY_Firegut Brutes'|r|cRXP_WARN_knockback, 它会将你击退, 可能导致你从山上掉下去|r
.turnin 3821 >>交任务: |cRXP_FRIENDLY_巨槌石|r
.accept 3822 >>接任务: |cRXP_WARN_克罗格鲁尔|r
.target Sha'ni Proudtusk
step
#loop
.goto Burning Steppes,77.20,47.50,0
.goto Burning Steppes,82.70,38.90,0
.goto Burning Steppes,81.60,48.20,0
.goto Burning Steppes,77.20,47.50,25,0
.goto Burning Steppes,82.70,38.90,25,0
.goto Burning Steppes,81.60,48.20,25,0
>>击杀|cRXP_ENEMY_克罗格鲁尔|r. 击败他后搜刮出|cRXP_LOOT_沙尼的鼻环|r`
>>|cRXP_WARN_他可能出现在三个洞穴中的任意一个；你可能需要仔细搜索. 注意|r|cRXP_ENEMY_火肚蛮兵'|r|cRXP_WARN_击退效果|r, 因为它会将你击落山崖|r
.complete 3822,1 
.target Krom'Grul
step
#label HoardO
.goto Burning Steppes,95.09,31.56
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cyrus|r交谈
>>|cRXP_WARN_打开你的|r |T132595:0|t[黑龙军团宝箱] |cRXP_WARN_如果你还没有|r
.accept 4022 >>接任务: |cRXP_LOOT_烈焰精华|r
.turnin 4022 >>交任务: |cRXP_FRIENDLY_烈焰精华|r
.target Cyrus Therepentous
.isQuestTurnedIn 3452
.group
step
#loop
.goto Burning Steppes,81.80,27.80,0
.goto Burning Steppes,81.80,27.80,60,0
.goto Burning Steppes,85.80,30.20,60,0
.goto Burning Steppes,90.60,29.80,60,0
.goto Burning Steppes,92.00,39.40,60,0
.goto Burning Steppes,90.60,49.40,60,0
.goto Burning Steppes,88.80,56.20,60,0
.goto Burning Steppes,85.20,61.40,60,0
.goto Burning Steppes,82.00,61.60,60,0
.goto Burning Steppes,84.60,56.00,60,0
.goto Burning Steppes,89.40,52.60,60,0
.goto Burning Steppes,88.60,44.80,60,0
.goto Burning Steppes,91.60,38.40,60,0
.goto Burning Steppes,89.80,33.60,60,0
.goto Burning Steppes,86.40,32.00,60,0
.use 12284 >>使用你的 |T133001:0|t[龙灵采集器900型] 对准 |cRXP_ENEMY_黑色小龙|r. 击杀它们后, 从其尸体上拾取 |cRXP_LOOT_雏龙精华|r, 并从尸体旁的 |cRXP_PICK_红石方尖碑|r上获取物品
.complete 4726,1 
.mob Black Broodling
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tinkee|r和|cRXP_FRIENDLY_Maxwort|r交谈
.turnin 4726 >>交任务: |cRXP_FRIENDLY_雏龙精华|r
.accept 4808 >>接任务: |cRXP_LOOT_菲诺克|r
.target +Tinkee Steamboil
.goto Burning Steppes,65.24,24.01
.turnin 4296 >>交任务: |cRXP_FRIENDLY_七贤石板|r
.target +Maxwort Uberglint
.goto Burning Steppes,65.15,23.94
step
#completewith next
.goto Burning Steppes,65.70,24.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦格鲁克|r交谈
.fly Badlands >>飞往荒芜之地
.target Vahgruk
.zoneskip Badlands
step
.goto Badlands,2.81,45.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shul'kar|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Shul'kar
step
.goto Badlands,3.40,48.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thal'trak|r交谈
>>|cRXP_WARN_你可能需要等塔尔特拉克完成他的角色扮演. 只要跟着他就行了|r
.turnin 3822 >>交任务: |cRXP_FRIENDLY_克罗格鲁尔|r
.target Thal'trak Proudtusk
step << Rogue
#phase 4-6
#completewith RogueSTClassQ
.goto Badlands,4.00,44.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里克|r交谈
.fly Undercity >>飞往幽暗城
.target Vahgruk
.zoneskip Undercity
.dungeon ST
step << skip 
#phase 4-6
.goto Undercity,47.46,73.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fuely|r交谈
.accept 4293 >>接任务: |cRXP_WARN_软泥怪的样本…|r
.accept 4294 >>接任务: |cRXP_WARN_一大堆软泥怪|r
.target Chemist Fuely
.dungeon ST
step << Rogue
#phase 4-6
#label RogueSTClassQ
.goto Undercity,85.20,71.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈尔斯·迪克斯特|r交谈
.trainer >>训练你的职业法术
.accept 8233 >>接任务: |cRXP_WARN_简单的要求|r
.target Miles Dexter
.dungeon ST
step << Rogue
#phase 4-6
#completewith next
.goto Undercity,63.27,48.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
.fly Tarren Mill >>飞往塔伦米尔
.target Michael Garrett
.zoneskip Hillsbrad Foothills
.dungeon ST
.isOnQuest 8233
step << Rogue
#phase 4-6
.goto Hillsbrad Foothills,75.575,22.076,20,0
.goto Hillsbrad Foothills,86.026,78.879
.subzone 3486 >>前往拉文霍德庄园
.isOnQuest 8233
.dungeon ST
step << Rogue
#phase 4-6
.goto Hillsbrad Foothills,75.49,23.96,30,0
.goto Hillsbrad Foothills,75.61,19.52,30,0
.goto Hillsbrad Foothills,77.68,22.59,30,0
.goto Hillsbrad Foothills,77.58,19.61,30,0
.goto Alterac Mountains,86.02,78.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔拉齐|r交谈
.turnin 8233 >>交任务: |cRXP_FRIENDLY_简单的要求|r
.accept 8234 >>接任务: |cRXP_WARN_密封的蓝袋子|r
.target Lord Jorach Ravenholdt
.isOnQuest 8233
.dungeon ST
step << Rogue
#phase 4-6
#optional
.goto Hillsbrad Foothills,75.49,23.96,30,0
.goto Hillsbrad Foothills,75.61,19.52,30,0
.goto Hillsbrad Foothills,77.68,22.59,30,0
.goto Hillsbrad Foothills,77.58,19.61,30,0
.goto Alterac Mountains,86.02,78.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔拉齐|r交谈
.accept 8234 >>接任务: |cRXP_WARN_密封的蓝袋子|r
.target Lord Jorach Ravenholdt
.isQuestTurnedIn 8233
.dungeon ST
step << Shaman
#phase 4-6
#completewith next
.goto Badlands,4.00,44.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里克|r交谈
.fly Tarren Mill >>飞往塔伦米尔
.target Gorrik
.zoneskip Hillsbrad Foothills
step << Shaman
#phase 4-6
.goto Alterac Mountains,80.50,66.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bath'rah|r交谈
.turnin 8410 >>交任务: |cRXP_FRIENDLY_元素掌握|r
.accept 8412 >>接任务: |cRXP_WARN_灵魂图腾|r
.target Bath'rah the Windwatcher
step << Shaman
#phase 4-6
#loop
.goto Western Plaguelands,34.60,65.80,0
.goto Western Plaguelands,34.60,65.80,60,0
.goto Western Plaguelands,33.60,63.20,60,0
.goto Western Plaguelands,31.80,63.60,60,0
.goto Western Plaguelands,32.00,59.60,60,0
.goto Western Plaguelands,30.80,50.20,60,0
.goto Western Plaguelands,32.80,56.00,60,0
.goto Western Plaguelands,36.00,58.40,60,0
.goto Western Plaguelands,34.00,61.80,60,0
>>向北进入西瘟疫之地, 然后向西跑. 小心附近的联盟小型营地. 游过水面
>>击杀|cRXP_ENEMY_毒雾潜伏者|r和|cRXP_ENEMY_食腐秃鹫|r和|cRXP_ENEMY_生病的黑熊|r. 击败它们后搜刮其|cRXP_LOOT_眼睛|r和|cRXP_LOOT_利爪|r
.complete 8412,1 
.mob +Carrion Vulture
.mob +Venom Mist Lurker
.complete 8412,2 
.mob +Diseased Black Bear
.mob +Carrion Vulture
step << Shaman
#phase 4-6
.goto Alterac Mountains,80.50,66.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bath'rah|r交谈
.turnin 8412 >>交任务: |cRXP_FRIENDLY_灵魂图腾|r
.target Bath'rah the Windwatcher
step << Shaman
#phase 4-6
.goto Alterac Mountains,80.50,66.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bath'rah|r交谈
.accept 8413 >>接任务: |cRXP_WARN_巫毒羽毛|r
.target Bath'rah the Windwatcher
.isQuestTurnedIn 8412
.dungeon ST
step << Shaman
#phase 4-6
.goto Hillsbrad Foothills,60.14,18.63
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦格鲁克|r交谈
.fly Undercity >>飞往幽暗城
.target Vahgruk
.zoneskip Undercity
step
#phase 1-3 << Rogue/Shaman
.goto Badlands,4.00,44.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里克|r交谈
.fly Undercity >>飞往幽暗城
.target Vahgruk
.zoneskip Undercity
step << Rogue
#phase 4-6
.goto Badlands,4.00,44.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里克|r交谈
.fly Undercity >>飞往幽暗城
.target Vahgruk
.zoneskip Undercity
.dungeon !ST
step << skip
.goto Undercity,47.46,73.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fuely|r交谈
.accept 4293 >>接任务: |cRXP_WARN_软泥怪的样本…|r
.accept 4294 >>接任务: |cRXP_WARN_一大堆软泥怪|r
.target Chemist Fuely
step << Druid
#completewith DruidTraining8
.cast 18960 >>施放 |T135758:0|t[传送:月光林地]
.zoneskip Moonglade
step << Druid
#optional
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 9894 >>训练你的职业法术
.target Loganaar
.xp <52,1
.xp >54,1
step << Druid
#label DruidTraining8
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 9904 >>训练你的职业法术
.target Loganaar
.xp <54,1
step << !Mage
#completewith next
.hs >>传送至十字路口
.use 6948
step << !Mage
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.target Devrak
.zoneskip Orgrimmar
step << Mage
.cast 3567 >>施放 |T135759:0|t[传送:奥格瑞玛]
.zoneskip Orgrimmar
step
#optional
.abandon 795 >>放弃大地封印
.isOnQuest 795
step
#optional
.abandon 793 >>放弃破碎的联盟
.isOnQuest 793
step
#optional
.abandon 7701 >>放弃悬赏：工头玛托留斯
.isOnQuest 7701
step
#optional
.abandon 7722 >>放弃绝密配方！
.isOnQuest 7722
step
#optional
.abandon 3452 >>放弃烈焰之盒
.isOnQuest 3452
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 53-54 艾萨拉
#displayname 53-54 艾萨拉 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南(50-60级)
#next 54-54 费伍德森林
step
.goto Orgrimmar,54.10,68.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格雷什卡|r交谈
.home >>将你的[炉石]设置为奥格瑞玛
.target Innkeeper Gryshka
step
.goto Orgrimmar,49.57,69.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁斯|r交谈
.bankwithdraw 10695,10687,10688,10689,10690 >>从银行提取以下物品:
>>|T132594:0|t[装空瓶的盒子] |cRXP_WARN_(或|r|T132793:0|t[空瓶] |cRXP_WARN_如果你打开了盒子)|r
.target Karus
.dungeon !MARA
step
.goto Orgrimmar,49.57,69.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁斯|r交谈
.bankwithdraw 10695,10687,10688,10689,10690,17760 >>从银行提取以下物品:
>>|T134199:0|t[生命之种]
>>|T132594:0|t[装空瓶的盒子] |cRXP_WARN_(或|r|T132793:0|t[空瓶] |cRXP_WARN_如果你打开了盒子)|r
.target Karus
.dungeon MARA
step << Shaman
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 10467 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <52,1
.xp >54,1
step << Shaman
#optional
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 10408 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <54,1
step << Rogue
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 11342 >>训练你的职业法术
.target Ormok
.xp <52,1
.xp >54,1
step << Rogue
#optional
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 11294 >>训练你的职业法术
.target Ormok
.xp <54,1
step << Rogue
.goto Orgrimmar,42.10,49.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔交谈|r
.vendor >>|cRXP_BUY_储备闪光粉和毒药|r
.target Rekkul
step << Warlock
#phase 4-6
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.trainer >>训练你的职业法术
.accept 8419 >>接任务: |cRXP_LOOT_小鬼的要求|r
.target Mirket
step << Warlock
#phase 1-3
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.trainer >>训练你的职业法术
.target Mirket
step << Warlock
.goto Orgrimmar,47.55,46.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈
.vendor >>提升宠物的技能
.target Kurgul
step << Mage
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 10186 >>训练你的职业法术
.target Pephredo
.xp <52,1
.xp >54,1
step << Mage
#optional
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 10199 >>训练你的职业法术
.target Pephredo
.xp <54,1
step << Mage
#phase 4-6
.goto Orgrimmar,39.20,86.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Uthel'nay|r交谈
.accept 8250 >>接任务: |cRXP_WARN_法师的会见|r
.target Uthel'nay
step << Priest
#phase 1-3
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 10946 >>训练你的职业法术
.target Ur'kyo
.xp <52,1
.xp >54,1
step << Priest
#phase 1-3
#optional
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 15267 >>训练你的职业法术
.target Ur'kyo
.xp <54,1
step << Priest
#phase 4-6
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 10946 >>训练你的职业法术
.accept 8254 >>接任务: |cRXP_WARN_塞纳里奥议会的求助|r
.target Ur'kyo
step
.goto Orgrimmar,59.40,36.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dran|r交谈
.turnin 81 >>交任务: |cRXP_FRIENDLY_送回蜜酒|r
.target Dran Droffers
step
.goto Orgrimmar,55.60,34.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jes'rimon|r交谈
>>|cRXP_WARN_他位于建筑顶部|r
.turnin 4300 >>交任务: |cRXP_FRIENDLY_骨刃武器|r
.target Jes'rimon
step << skip
.goto Orgrimmar,55.52,34.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jes'rimon|r交谈
>>|cRXP_WARN_他位于建筑顶部|r
.accept 4300 >>接任务: |cRXP_LOOT_骨刃武器|r
.target Jes'rimon

step
.goto Orgrimmar,75.00,34.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔戈洛姆|r交谈
.accept 3504 >>接任务: |cRXP_WARN_叛徒|r
.target Belgrom Rockmaul
step << Hunter
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 13543 >>训练你的职业法术
.target Ormak Grimshot
.xp <52,1
.xp >54,1
step << Hunter
#optional
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14290 >>训练你的职业法术
.target Ormak Grimshot
.xp <54,1
step << Hunter
#phase 4-6
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.accept 8151 >>接任务: |cRXP_WARN_猎人的护符|r
.target Ormak Grimshot
step << Hunter
.goto Orgrimmar,66.33,14.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xao'tsu|r交谈
.train 24631 >>训练你的宠物法术
.target Xao'tsu
.xp <54,1
step << Warrior
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 11551 >>训练你的职业法术
.target Grezz Ragefist
.xp <52,1
.xp >54,1
step << Warrior
#optional
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 11605 >>训练你的职业法术
.target Grezz Ragefist
.xp <54,1
step << Hunter
.goto Orgrimmar,48.13,80.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Trak'gen|r交谈
>>|cRXP_BUY_从他那里购买|r|T135661:0|t[锯齿箭]|r
.collect 11285,2600,3504,1 
.target Trak'gen
step << Warlock
#ah
#phase 4-6
.goto Orgrimmar,55.59,62.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thathung|r交谈
>>请在费伍德森林附近购买以下物品, 可立即提交任务. 如果您不打算购买任何物品, 请跳过此步骤
>>|T132888:0|t[恶魔布]
.collect 14256,1,8419,1 
.target Auctioneer Thathung
step
.goto Orgrimmar,45.13,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Splintertree Post >>飞往裂枝岗哨
.target Doras
.zoneskip Ashenvale
step
#completewith next
.goto Ashenvale,75.37,64.73,20,0
.goto Ashenvale,79.07,55.41,30,0
.goto Ashenvale,91.24,46.47,30,0
.goto Ashenvale,95.33,48.38,15,0
.subzone 879 >>前往: |cRXP_PICK_艾萨拉|r
step
.goto Azshara,10.40,74.90,40,0
.goto Azshara,11.40,78.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛哈图|r交谈
.accept 5535 >>接任务: |cRXP_WARN_永不安息的灵魂|r
.accept 5536 >>接任务: |cRXP_WARN_充满仇恨的土地|r
.target Loh'atu
step
#phase 4-6
#completewith next
>>击杀|cRXP_ENEMY_上层精灵的幻影|r 和|cRXP_ENEMY_上层精灵鬼巫|r << !Priest
>>击杀|cRXP_ENEMY_上层精灵的幻影|r和|cRXP_ENEMY_上层精灵鬼巫|r. 保留 1 |T134437:0|t[亡灵腐液] 以完成你的职业任务 << Priest
.complete 5535,1 
.mob +Highborne Apparition
.complete 5535,2 
.mob +Highborne Lichling
.collect 7972,1 << Priest 
.mob +Highborne Apparition << Priest
.mob +Highborne Lichling << Priest
step
#phase 1-3
#completewith next
>>击杀|cRXP_ENEMY_上层精灵的幻影|r 和|cRXP_ENEMY_上层精灵鬼巫|r
.complete 5535,1 
.mob +Highborne Apparition
.complete 5535,2 
.mob +Highborne Lichling
step
#loop
.goto Azshara,19.40,64.00,0
.goto Azshara,19.40,64.00,50,0
.goto Azshara,19.60,60.80,50,0
.goto Azshara,21.20,60.80,50,0
.goto Azshara,20.60,63.60,50,0
>>击杀|cRXP_ENEMY_哈达尔萨特|r和|cRXP_ENEMY_哈达尔欺诈者|r和|cRXP_ENEMY_哈达尔魔仆|r
.complete 5536,1 
.mob +Haldarr Satyr
.complete 5536,2 
.mob +Haldarr Trickster
.complete 5536,3 
.mob +Haldarr Felsworn
step
#phase 4-6
#loop
.goto Azshara,17.80,67.80,0
.goto Azshara,17.80,67.80,50,0
.goto Azshara,16.60,71.80,50,0
.goto Azshara,14.60,73.60,50,0
.goto Azshara,13.60,72.60,50,0
.goto Azshara,16.60,68.60,50,0
.goto Azshara,17.20,66.00,50,0
>>击杀|cRXP_ENEMY_上层精灵的幻影|r 和|cRXP_ENEMY_上层精灵鬼巫|r << !Priest
>>击杀|cRXP_ENEMY_上层精灵的幻影|r和|cRXP_ENEMY_上层精灵鬼巫|r. 保留 1 |T134437:0|t[亡灵腐液] 以完成你的职业任务 << Priest
.complete 5535,1 
.mob +Highborne Apparition
.complete 5535,2 
.mob +Highborne Lichling
.collect 7972,1 << Priest 
.mob +Highborne Apparition << Priest
.mob +Highborne Lichling << Priest
step
#phase 1-3
#loop
.goto Azshara,17.80,67.80,0
.goto Azshara,17.80,67.80,50,0
.goto Azshara,16.60,71.80,50,0
.goto Azshara,14.60,73.60,50,0
.goto Azshara,13.60,72.60,50,0
.goto Azshara,16.60,68.60,50,0
.goto Azshara,17.20,66.00,50,0
>>击杀|cRXP_ENEMY_上层精灵的幻影|r 和|cRXP_ENEMY_上层精灵鬼巫|r
.complete 5535,1 
.mob +Highborne Apparition
.complete 5535,2 
.mob +Highborne Lichling
step
.goto Azshara,11.36,78.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛哈图|r交谈
.turnin 5535 >>交任务: |cRXP_FRIENDLY_永不安息的灵魂|r
.turnin 5536 >>交任务: |cRXP_FRIENDLY_充满仇恨的土地|r
.target Loh'atu
step
#completewith next
.goto Azshara,22.00,49.70,30,0
.subzone 1237 >>前往东北方向的瓦洛莫克
step
.goto Azshara,22.00,49.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克隆姆|r交谈
.fp Azshara >>获取艾萨拉飞行点
.target Kroum
step
.goto Azshara,22.20,51.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ag'tor|r交谈
.turnin 3504 >>交任务: |cRXP_FRIENDLY_叛徒|r
.target Ag'tor Bloodfist
.isOnQuest 3504
step
.goto Azshara,22.20,51.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ag'tor|r交谈
.accept 3505 >>接任务: |cRXP_WARN_叛徒|r
.target Ag'tor Bloodfist
.isQuestTurnedIn 3504
step
.goto Azshara,22.50,51.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰迪加|r交谈
.accept 3517 >>接任务: |cRXP_WARN_偷窃知识|r
.target Jediga
step << Rogue
#phase 4-6
.goto Azshara,44.20,22.40
>>扒窃|cRXP_ENEMY_木喉萨满祭司|r, 直到你抢到一个|cRXP_LOOT_密封的蓝袋子|r
.complete 8234,1 
.mob Timbermaw Shaman
.isOnQuest 8234
.dungeon ST
step << Rogue/Mage
#phase 4-6
#completewith STRogueMage1
.goto Azshara,28.11,50.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳斯|r交谈
.turnin 3503 >>交任务: |cRXP_FRIENDLY_见到主人|r
.target Sanath Lim-yo
step << Rogue
#phase 4-6
.goto Azshara,27.64,41.49,30,0
.goto Azshara,29.7,40.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师克希雷姆|r交谈
>>|cRXP_WARN_大法师在他的塔中徘徊|r
.turnin 8234 >>交任务: |cRXP_FRIENDLY_密封的蓝袋子|r
.accept 8235 >>接任务: |cRXP_WARN_密文碎片|r
.target Archmage Xylem
.isQuestComplete 8234
.dungeon ST
step << Rogue
#phase 4-6
.goto Azshara,27.64,41.49,30,0
.goto Azshara,29.7,40.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师克希雷姆|r交谈
>>|cRXP_WARN_大法师在他的塔中徘徊|r
.accept 8235 >>接任务: |cRXP_WARN_密文碎片|r
.target Archmage Xylem
.isQuestTurnedIn 8234
.dungeon ST
step << Mage
#phase 4-6
.goto Azshara,29.2,40.2
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师克希雷姆|r交谈
>>|cRXP_WARN_大法师在他的塔中徘徊|r
.turnin 8250 >>交任务: |cRXP_FRIENDLY_法师的会见|r
.accept 8251 >>接任务: |cRXP_WARN_魔法的尘埃|r
.target Archmage Xylem
step
#optional
#label STRogueMage1
step << Rogue/Mage
#phase 4-6
#completewith KJI
.goto Azshara,26.466,46.271
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼瑞尔|r交谈
>>|cRXP_WARN_这会将你传送到下方|r
.turnin 3421 >>交任务: |cRXP_FRIENDLY_回程|r
.timer 8,Return Trip RP
.target Nyrill
.dungeon ST << Rogue
step << Hunter/Priest
#phase 4-6
#completewith next
.goto Azshara,41.61,42.68,50 >>前往|cRXP_FRIENDLY_奥汀克|r, 他位于一座小山峰上
step << Hunter/Priest
#phase 4-6
.goto Azshara,42.40,42.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥汀克|r交谈
>>|cRXP_WARN_靠近他时要注意脚下, 他站在一个危险的位置|r
.turnin 8151 >>交任务: |cRXP_FRIENDLY_猎人的护符|r << Hunter
.accept 8153 >>接任务: |cRXP_WARN_苔蹄快步者的鹿角|r << Hunter
.turnin 8254 >>交任务: |cRXP_FRIENDLY_塞纳里奥议会的求助|r << Priest
.accept 8255 >>接任务: |cRXP_WARN_苔蹄快步者|r << Priest
.target Ogtinc
step << Hunter/Priest
#phase 4-6
#loop
.goto Azshara,48.40,33.20,0
.goto Azshara,48.40,33.20,60,0
.goto Azshara,48.40,16.40,60,0
.goto Azshara,55.20,17.00,60,0
.goto Azshara,59.60,22.90,60,0
.goto Azshara,70.60,28.40,60,0
.goto Azshara,83.20,25.00,60,0
.goto Azshara,76.60,27.30,60,0
.goto Azshara,67.80,27.40,60,0
.goto Azshara,61.40,23.30,60,0
.goto Azshara,55.30,25.30,60,0
.goto Azshara,50.20,25.40,60,0
>>击杀|cRXP_ENEMY_苔蹄快步者|r. 击败它们后搜刮其|cRXP_LOOT_鹿角|r << Hunter
>>击杀|cRXP_ENEMY_苔蹄快步者|r. 击杀后搜刮它们的|cRXP_LOOT_腺体|r << Priest
>>|cRXP_ENEMY_苔蹄快步者|r|cRXP_WARN_share 与角鹰兽和奇美拉一起重生|r
.complete 8153,1 << Hunter 
.complete 8255,1 << Priest 
.mob Mosshoof Courser
step << Hunter
#phase 4-6
.goto Azshara,42.40,42.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥汀克|r交谈
.turnin 8153 >>交任务: |cRXP_FRIENDLY_苔蹄快步者的鹿角|r
.accept 8231 >>接任务: |cRXP_WARN_碎浪多头怪|r
.target Ogtinc
.dungeon ST
step << Hunter
#phase 4-6
.goto Azshara,42.40,42.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥汀克|r交谈
.turnin 8153 >>交任务: |cRXP_FRIENDLY_苔蹄快步者的鹿角|r
.target Ogtinc
step
#label KJI
.goto Azshara,53.45,21.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kim'jael|r交谈
.accept 3601 >>接任务: |cRXP_WARN_我就是基姆加尔！|r
.target Kim'jael
step
#completewith Magus
>>掠夺营地周围散落的|cRXP_PICK_Kim'Jael's Equipment|r箱子
.complete 3601,1 
.complete 3601,2 
.complete 3601,3 
.complete 3601,4 
step << Mage
#phase 4-6
#loop
.goto Azshara,55.80,25.90,0
.goto Azshara,55.80,25.90,50,0
.goto Azshara,57.80,26.40,50,0
.goto Azshara,58.00,28.20,50,0
.goto Azshara,59.20,29.60,50,0
.goto Azshara,57.90,31.40,50,0
.goto Azshara,57.00,30.30,50,0
.goto Azshara,56.90,27.50,50,0
.goto Azshara,56.00,29.70,50,0
.goto Azshara,55.40,29.70,50,0
>>击杀|cRXP_ENEMY_血精灵搜寻者|r 和|cRXP_ENEMY_血精灵勘测员|r , 掠夺他们的|cRXP_LOOT_Dust|r
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_测量者|r|cRXP_WARN_火焰新星冷却时间较短, 而|r|cRXP_ENEMY_回收者|r|cRXP_WARN_火球伤害极高|r
.complete 3505,1 
.complete 3505,2 
.complete 8251,1 
.mob Blood Elf Reclaimer
.mob Blood Elf Surveyor
.isOnQuest 3505
step
#loop
.goto Azshara,55.80,25.90,0
.goto Azshara,55.80,25.90,50,0
.goto Azshara,57.80,26.40,50,0
.goto Azshara,58.00,28.20,50,0
.goto Azshara,59.20,29.60,50,0
.goto Azshara,57.90,31.40,50,0
.goto Azshara,57.00,30.30,50,0
.goto Azshara,56.90,27.50,50,0
.goto Azshara,56.00,29.70,50,0
.goto Azshara,55.40,29.70,50,0
>>击杀|cRXP_ENEMY_血精灵搜寻者|r 和|cRXP_ENEMY_血精灵勘测员|r
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_测量者|r|cRXP_WARN_火焰新星冷却时间较短, 而|r|cRXP_ENEMY_回收者|r|cRXP_WARN_火球伤害极高|r
.complete 3505,1 
.mob +Blood Elf Reclaimer
.complete 3505,2 
.mob +Blood Elf Surveyor
.isOnQuest 3505
step
.goto Azshara,59.40,31.20
>>点击召唤圈基座上的|cRXP_PICK_卡多雷召唤宝典|r
.complete 3505,3 
.turnin 3505 >>交任务: |cRXP_FRIENDLY_叛徒|r
.isOnQuest 3505
step
.goto Azshara,59.50,31.20
>>再次点击|cRXP_PICK_卡多雷召唤宝典|r
.accept 3506 >>接任务: |cRXP_WARN_叛徒|r
.isQuestTurnedIn 3505
step
#label Magus
.goto Azshara,59.50,31.40
>>摧毁其中一个|cRXP_PICK_奥术集中水晶|r. 这将召唤出一个|cRXP_ENEMY_血精灵防御者|r
>>13秒后, |cRXP_ENEMY_大法师雷姆托里|r将出现. 击杀她并搜刮她的|cRXP_LOOT_头颅|r
.complete 3506,1 
.isQuestTurnedIn 3505
.mob Blood Elf Defender
.unitscan Magus Rimtori
step
#loop
.goto Azshara,58.50,25.00,0
.goto Azshara,58.50,25.00,25,0
.goto Azshara,58.90,28.30,25,0
.goto Azshara,59.60,30.90,25,0
.goto Azshara,57.00,29.90,25,0
.goto Azshara,56.50,28.40,25,0
>>掠夺营地周围散落的|cRXP_PICK_Kim'Jael's Equipment|r箱子
.complete 3601,1 
.complete 3601,2 
.complete 3601,3 
.complete 3601,4 
step << Warrior/Hunter/Rogue/Druid/Shaman
#loop
.goto Azshara,55.80,25.90,50,0
.goto Azshara,57.80,26.40,50,0
.goto Azshara,58.00,28.20,50,0
.goto Azshara,59.20,29.60,50,0
.goto Azshara,57.90,31.40,50,0
.goto Azshara,57.00,30.30,50,0
.goto Azshara,56.90,27.50,50,0
.goto Azshara,56.00,29.70,50,0
.goto Azshara,55.40,29.70,50,0
.xp 54 >>刷怪练级至54级
.mob Blood Elf Reclaimer
.mob Blood Elf Surveyor
step
.goto Azshara,53.45,21.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kim'jael|r交谈
.turnin 3601 >>交任务: |cRXP_FRIENDLY_我就是基姆加尔！|r
.accept 5534 >>接任务: |cRXP_WARN_基姆加尔“丢失”的装备|r
.target Kim'jael
step << Hunter
#completewith next
.goto Azshara,47.80,60.80,50
>>向南前往悬崖, 然后跳入水中
step << Hunter
#phase 4-6
#loop
.goto Azshara,88.69,25.88,70,0
.goto Azshara,54.2,42.2,70,0
.goto Azshara,59.2,35.6,70,0
.goto Azshara,71.6,36.8,70,0
.goto Azshara,90.4,33.6,70,0
.goto Azshara,87.0,9.0
.goto Azshara,54.2,42.2,0
.goto Azshara,59.2,35.6,0
.goto Azshara,71.6,36.8,0
.goto Azshara,90.4,33.6,0
.goto Azshara,88.69,25.88,0
>>击杀 |cRXP_ENEMY_碎浪多头怪|r. 击败后可掠夺其 |cRXP_LOOT_碎浪多头怪的鳞片|r
>>|cRXP_WARN_这些可能很难找到. 请确保使用|r|T132328:0|t[追踪野兽]|cRXP_WARN_并施放|r|T132172:0|t[鹰眼]|cRXP_WARN_, 然后沿着海岸线寻找, 以更快地发现它们|r
.complete 8231,1 
.mob Wavethrasher
.mob Young Wavethrasher
.mob Great Wavethrasher
.dungeon ST
step << Rogue
#phase 4-6
#loop
.goto Azshara,66.60,25.20,0
.goto Azshara,66.60,25.20,60,0
.goto Azshara,69.00,25.60,60,0
.goto Azshara,71.60,29.20,60,0
.goto Azshara,71.60,24.60,60,0
.goto Azshara,80.80,24.60,60,0
.goto Azshara,86.60,19.60,60,0
.goto Azshara,74.60,12.60,60,0
>>击杀|cRXP_ENEMY_森林软泥怪|r. 掠夺它们以获取|cRXP_LOOT_密文碎片|r
.complete 8235,1 
.unitscan Forest Ooze
.dungeon ST
.isOnQuest 8235
step << Mage
#phase 4-6
#completewith next
.goto Azshara,28.11,50.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳斯|r交谈
.turnin 3503 >>交任务: |cRXP_FRIENDLY_见到主人|r
.target Sanath Lim-yo
step << Mage
#phase 4-6
.goto Azshara,29.2,40.2
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师克希雷姆|r交谈
>>|cRXP_WARN_大法师在他的塔中徘徊|r
.turnin 8251 >>交任务: |cRXP_FRIENDLY_魔法的尘埃|r
.accept 8252 >>接任务: |cRXP_WARN_纳迦的珊瑚|r
.target Archmage Xylem
step << Mage
#phase 4-6
#completewith Tablets
.goto Azshara,28.11,50.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳斯|r交谈
.turnin 3503 >>交任务: |cRXP_FRIENDLY_见到主人|r
.target Sanath Lim-yo
step << !Hunter !Mage
#completewith next
.goto Azshara,47.80,60.80,50
>>向南前往悬崖, 然后跳入水中
step
#completewith Tablets
>>击杀所有|cRXP_ENEMY_Spitelash Nagas|r. 击败他们以获取|cRXP_LOOT_一些符文|r
.complete 5534,1 
.mob Spitelash Myrmidon
.mob Spitelash Enchantress
.mob Spitelash Battlemaster
step << Mage
#phase 4-6
#completewith SomeRune
>>击杀|cRXP_ENEMY_恶鞭海妖|r. 击败它们以获取其|cRXP_LOOT_魔化珊瑚|r
.complete 8252,1 
.mob Spitelash Siren
step
#completewith next
.use 10695 >>|cRXP_WARN_打开你的|r|T132594:0|t[装空瓶的盒子]
.collect 10687,1,3568,1
.collect 10688,1,3568,1
.collect 10689,1,3568,1
.collect 10690,1,3568,1
step
.goto Azshara,47.50,46.20
.use 10870 >>|cRXP_WARN_使用你的|r|T132793:0|t[空瓶子 #4] |cRXP_WARN_放置在水坑中央|r
.complete 3568,4 
step
.goto Azshara,48.70,48.50
.use 10689 >>|cRXP_WARN_使用你的|r|T132793:0|t[空瓶子 #3] |cRXP_WARN_在水坑中央|r
.complete 3568,3 
step
.goto Azshara,47.80,51.30
.use 10688 >>|cRXP_WARN_使用你的|r|T132793:0|t[空瓶子 #2] |cRXP_WARN_放置在水坑中央|r
.complete 3568,2 
step
.goto Azshara,47.80,60.80
.use 10687 >>|cRXP_WARN_使用你的|r|T132793:0|t[空瓶子 #1] |cRXP_WARN_放置在水坑的中心|r
.complete 3568,1 
step
#label Tablets
#loop
.goto Azshara,35.86,53.49,0
.goto Azshara,39.80,46.81,40,0
.goto Azshara,39.86,48.72,40,0
.goto Azshara,37.30,48.12,40,0
.goto Azshara,38.55,54.58,40,0
.goto Azshara,40.97,55.00,40,0
.goto Azshara,40.81,62.69,40,0
.goto Azshara,42.95,63.76,40,0
.goto Azshara,38.70,63.30,40,0
.goto Azshara,36.35,58.75,40,0
.goto Azshara,35.92,57.55,40,0
.goto Azshara,34.89,53.93,40,0
.goto Azshara,35.86,53.49,40,0
>>搜集散落在废墟周围的|cRXP_PICK_Glowing Tablets|r
.complete 3517,1 
.complete 3517,2 
.complete 3517,3 
.complete 3517,4 
step
#label SomeRune
#loop
.goto Azshara,44.00,48.20,0
.goto Azshara,44.00,48.20,50,0
.goto Azshara,45.60,43.80,50,0
.goto Azshara,47.00,41.60,50,0
.goto Azshara,48.80,45.00,50,0
.goto Azshara,47.40,49.00,50,0
.goto Azshara,48.20,54.00,50,0
.goto Azshara,48.20,59.80,50,0
.goto Azshara,48.60,64.80,50,0
.goto Azshara,46.20,61.00,50,0
.goto Azshara,45.60,57.80,50,0
.goto Azshara,46.00,52.80,50,0
.goto Azshara,44.00,48.20,25,0
>>击杀所有|cRXP_ENEMY_Spitelash Nagas|r. 击败他们以获取|cRXP_LOOT_一些符文|r
.complete 5534,1 
.mob Spitelash Myrmidon
.mob Spitelash Enchantress
.mob Spitelash Battlemaster
step << Mage
#phase 4-6
#loop
.goto Azshara,44.00,48.20,0
.goto Azshara,44.00,48.20,50,0
.goto Azshara,45.60,43.80,50,0
.goto Azshara,47.00,41.60,50,0
.goto Azshara,48.80,45.00,50,0
.goto Azshara,47.40,49.00,50,0
.goto Azshara,48.20,54.00,50,0
.goto Azshara,48.20,59.80,50,0
.goto Azshara,48.60,64.80,50,0
.goto Azshara,46.20,61.00,50,0
.goto Azshara,45.60,57.80,50,0
.goto Azshara,46.00,52.80,50,0
>>击杀|cRXP_ENEMY_恶鞭海妖|r. 击败它们以获取其|cRXP_LOOT_魔化珊瑚|r
.complete 8252,1 
.mob Spitelash Siren
step << Hunter/Priest
#phase 4-6
.goto Azshara,42.40,42.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥汀克|r交谈
.turnin 8231 >>交任务: |cRXP_FRIENDLY_碎浪多头怪|r << Hunter
.turnin 8255 >>交任务: |cRXP_FRIENDLY_苔蹄快步者|r << Priest
.accept 8256 >>接任务: |cRXP_WARN_亡灵的腐液|r << Priest
.turnin 8256 >>交任务: |cRXP_FRIENDLY_亡灵的腐液|r << Priest
.target Ogtinc
.dungeon ST << Hunter
step << Hunter/Priest
#phase 4-6
.goto Azshara,42.400,42.619
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥汀克|r交谈
.accept 8232 >>接任务: |cRXP_WARN_神庙中的绿龙|r << Hunter
.accept 8257 >>接任务: |cRXP_WARN_摩弗拉斯之血|r << Priest
.target Ogtinc
.isQuestTurnedIn 8231 << Hunter
.isQuestTurnedIn 8256 << Priest
.dungeon ST
step
.goto Azshara,45.55,37.79,50,0
.goto Azshara,53.45,21.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跑上山, 离开废墟, 然后与|cRXP_FRIENDLY_Kim'jael|r交谈
.turnin 5534 >>交任务: |cRXP_FRIENDLY_基姆加尔“丢失”的装备|r
.target Kim'jael
step
.goto Azshara,22.60,51.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰迪加|r交谈
.turnin 3517 >>交任务: |cRXP_FRIENDLY_偷窃知识|r
.accept 3561 >>接任务: |cRXP_WARN_大法师克希雷姆的石版|r
.accept 3518 >>接任务: |cRXP_WARN_玛加萨的石版|r
.accept 3541 >>接任务: |cRXP_WARN_杰斯雷蒙的石版|r
.target Jediga
step
.goto Azshara,22.26,51.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ag'tor|r交谈
.turnin 3506 >>交任务: |cRXP_FRIENDLY_叛徒|r
.accept 3507 >>接任务: |cRXP_WARN_叛徒|r
.target Ag'tor Bloodfist
.isQuestTurnedIn 3505
step
#completewith next
.goto Azshara,28.11,50.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Sanath|r 交谈
.turnin 3503 >>交任务: |cRXP_FRIENDLY_见到主人|r
.target Sanath Lim-yo
step
.goto Azshara,29.7,40.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师克希雷姆|r交谈
.turnin 3561 >>交任务: |cRXP_FRIENDLY_大法师克希雷姆的石版|r
.accept 3565 >>接任务: |cRXP_WARN_克希雷姆的报酬|r
.target Archmage Xylem
step << Mage/Rogue
#phase 4-6
.goto Azshara,29.248,40.210
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|cRXP_FRIENDLY_大法师克希雷姆|r交谈
.turnin 8252 >>交任务: |cRXP_FRIENDLY_纳迦的珊瑚|r << Mage
.turnin 8235 >>交任务: |cRXP_FRIENDLY_密文碎片|r << Rogue
.accept 8236 >>接任务: |cRXP_WARN_碧蓝钥匙|r << Rogue
.target Archmage Xylem
.isQuestComplete 8252 << Mage
.isQuestComplete 8235 << Rogue
.dungeon ST << Rogue
step << Mage/Rogue
#phase 4-6
.goto Azshara,29.248,40.210
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|cRXP_FRIENDLY_大法师克希雷姆|r交谈
.accept 8253 >>接任务: |cRXP_WARN_毁灭摩弗拉斯|r << Mage
.accept 8236 >>接任务: |cRXP_WARN_碧蓝钥匙|r << Rogue
.target Archmage Xylem
.isQuestTurnedIn 8252 << Mage
.isQuestTurnedIn 8235 << Rogue
.dungeon ST
step
#completewith next
.goto Azshara,26.466,46.271
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼瑞尔|r交谈
>>|cRXP_WARN_这会将你传送到下方|r
.turnin 3421 >>交任务: |cRXP_FRIENDLY_回程|r
.timer 8,Return Trip RP
.target Nyrill
step
.goto Azshara,22.56,51.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰迪加|r交谈
.turnin 3565 >>交任务: |cRXP_FRIENDLY_克希雷姆的报酬|r
.target Jediga
step
#completewith next
.goto Azshara,21.96,49.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克隆姆|r交谈
.fly Splintertree Post >>飞往裂枝岗哨
.target Kroum
.zoneskip Ashenvale
step
.goto Ashenvale,55.78,28.12
.zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 54-54 费伍德森林
#displayname 54-54 费伍德森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南(50-60级)
#next 54-56 安戈洛环形山
step
#optional
#completewith next
.abandon 3504 
step
#completewith EnterFW1
.zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
step
.goto Felwood,51.00,85.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格拉兹|r交谈
.accept 8460 >>接任务: |cRXP_LOOT_木喉熊怪的盟友|r
.target Grazle
step
.goto Felwood,51.20,82.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷塔·苔蹄|r交谈
.accept 5155 >>接任务: |cRXP_LOOT_加德纳尔的势力|r
.target Greta Mosshoof
step
.goto Felwood,50.90,81.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Taronn|r交谈
.accept 5156 >>接任务: |cRXP_LOOT_验证腐蚀|r
.target Taronn Redfeather
step
#label EnterFW1
.goto Felwood,46.70,83.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅贝丝·河风|r交谈
.accept 4102 >>接任务: |cRXP_LOOT_净化费伍德|r
.target Maybess Riverbreeze
step
#completewith next
.subzone 1763 >>前往加德纳尔
step
#loop
.goto Felwood,36.49,61.40,0
.goto Felwood,38.55,59.14,50,0
.goto Felwood,36.49,61.40,60,0
.goto Felwood,35.01,59.83,60,0
.goto Felwood,36.49,61.40,60,0
.goto Felwood,38.55,59.14,60,0
.goto Felwood,36.49,61.40,60,0
>>击杀|cRXP_ENEMY_加德纳尔恶犬|r和|cRXP_ENEMY_Guardians|r和|cRXP_ENEMY_Adepts|r和|cRXP_ENEMY_Cultists|r
>>|cRXP_WARN_要非常小心|r|cRXP_ENEMY_加德纳尔精兵|r|cRXP_WARN_；他们拥有瞬移技能, 以及强大的火球术和火焰冲击|r
.complete 5155,1 
.mob +Jaedenar Hound
.complete 5155,2 
.mob +Jaedenar Guardian
.complete 5155,3 
.mob +Jaedenar Adept
.complete 5155,4 
.mob +Jaedenar Cultist
step
#completewith next
.goto Felwood,37.37,49.83,40,0
.goto Felwood,35.45,50.10,40,0
.goto Felwood,34.57,52.12
.subzone 1997 >>前往血毒哨所
step
.goto Felwood,34.80,52.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dreka'Sur|r交谈
.accept 6162 >>接任务: |cRXP_LOOT_最后一战|r
.target Dreka'Sur
step
.goto Felwood,34.20,52.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温娜|r交谈
.accept 4505 >>接任务: |cRXP_LOOT_腐化之井|r
.target Winna Hazzard
step
.goto Felwood,34.40,53.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉卡尔|r交谈
.fp Felwood >>获取费伍德森林飞行点
.target Brakkar
step << Warlock
#phase 4-6
#completewith next
>>击杀所有|cRXP_ENEMY_碧火萨特|r, 直到你获得 1 件|cRXP_LOOT_恶魔布|r
.collect 14256,1,8419,1 
.mob Jadefire Rogue
.mob Jadefire Felsworn
.unitscan Jadefire Shadowstalker
.isOnQuest 8419
step
#completewith next
.goto Felwood,36.02,66.99,70,0
.goto Felwood,32.30,66.60,50 >>前往科斯塔拉废墟中的绿色月井
step
.goto Felwood,32.30,66.60
.use 12566 >>|cRXP_WARN_使用你的|r |T134870:0|t[坚硬的小瓶] |cRXP_WARN_在月井中|r
>>|cRXP_WARN_此区域有潜行的萨提罗斯敌人, 带有强力减速毒药. 其中一些会巡逻, 所以要小心|r
.complete 4505,1 
.unitscan Jadefire Shadowstalker << !Warlock
step << Warlock
#phase 4-6
.goto Felwood,43.27,84.98,45,0
#loop
.goto Felwood,43.41,88.13,0
.goto Felwood,39.45,84.55,0
.goto Felwood,43.41,88.13,70,0
.goto Felwood,39.45,84.55,70,0
>>击杀所有|cRXP_ENEMY_碧火萨特|r, 直到你获得 1 件|cRXP_LOOT_恶魔布|r
.collect 14256,1,8419,1 
.mob Jadefire Rogue
.mob Jadefire Felsworn
.unitscan Jadefire Shadowstalker
.isOnQuest 8419
step
#completewith next
>>击杀|cRXP_ENEMY_死木战士|r和|cRXP_ENEMY_死木探险者|r和|cRXP_ENEMY_死木园丁|r
.complete 8460,1 
.mob +Deadwood Warrior
.complete 8460,2 
.mob +Deadwood Pathfinder
.complete 8460,3 
.mob +Deadwood Gardener
step
.goto Felwood,48.20,94.30
>>击杀|cRXP_ENEMY_主宰洛尔|r. 搜刮他的|cRXP_LOOT_利爪|r
>>|cRXP_WARN_清理该区域, 以免他的范围恐惧技能造成麻烦|r
.complete 6162,1 
.unitscan Overlord Ror
step
#loop
.goto Felwood,48.20,94.30,0
.goto Felwood,48.20,94.30,50,0
.goto Felwood,46.80,91.80,50,0
.goto Felwood,46.60,90.40,50,0
.goto Felwood,46.60,88.60,50,0
.goto Felwood,48.60,89.40,50,0
.goto Felwood,49.20,91.60,50,0
>>击杀|cRXP_ENEMY_死木战士|r和|cRXP_ENEMY_死木探险者|r和|cRXP_ENEMY_死木园丁|r
.complete 8460,1 
.mob +Deadwood Warrior
.complete 8460,2 
.mob +Deadwood Pathfinder
.complete 8460,3 
.mob +Deadwood Gardener
step << !Warrior !Hunter !Rogue !Druid !Shaman
#loop
.goto Felwood,48.20,94.30,50,0
.goto Felwood,46.80,91.80,50,0
.goto Felwood,46.60,90.40,50,0
.goto Felwood,46.60,88.60,50,0
.goto Felwood,48.60,89.40,50,0
.goto Felwood,49.20,91.60,50,0
.xp 54+35000 >>升级至54级 35000/173900
.mob Deadwood Warrior
.mob Deadwood Pathfinder
.mob Deadwood Gardener
step
.goto Felwood,51.00,85.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格拉兹|r交谈
.turnin 8460 >>交任务: |cRXP_FRIENDLY_木喉熊怪的盟友|r
.accept 8462 >>接任务: |cRXP_LOOT_与纳菲恩交谈|r
.target Grazle
step
#loop
.goto Felwood,48.48,89.60,0
.goto Felwood,48.48,89.60,70,0
.goto Felwood,48.22,93.81,70,0
.goto Felwood,46.68,88.03,70,0
.reputation 576,unfriendly
>>|cRXP_WARN_请不要跳过此步骤. 稍后你需要该声望才能通过木喉要塞前往北方|r
.mob Deadwood Warrior
.mob Deadwood Pathfinder
.mob Deadwood Gardener
step
.goto Felwood,51.20,82.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷塔·苔蹄|r交谈
.turnin 5155 >>交任务: |cRXP_FRIENDLY_加德纳尔的势力|r
.accept 5157 >>接任务: |cRXP_LOOT_收集堕落之水|r
.target Greta Mosshoof
step
#completewith next
.subzone 1763 >>前往加德纳尔
step
.goto Felwood,35.20,59.80
.use 12922 >>在绿色月井中使用你的 |T132788:0|t[空壶]
>>|cRXP_WARN_要特别小心加德纳尔学徒；他们拥有瞬移能力, 以及强大的火球术和火焰冲击|r
.complete 5157,1 
.unitscan Jaedenar Adept
step << Warlock
#phase 4-6
.isOnQuest 8419
#loop
.goto Felwood,39.45,84.55,0
.goto Felwood,43.27,84.98,45,0
.goto Felwood,43.41,88.13,70,0
.goto Felwood,39.45,84.55,70,0
>>击杀|cRXP_ENEMY_Jadefire 碧火萨特|r和|cRXP_ENEMY_Jadefire 碧火魔仆|r. 击败它们后可掉落|T132888:0|t[|cRXP_LOOT_恶魔布|r]
.collect 14256,1,8419,1 
.mob Jadefire Satyr
.mob Jadefire Felsworn
step << Warlock
#phase 4-6
.isQuestComplete 8419
.goto Felwood,41.52,44.99
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊普斯|r交谈
.turnin 8419 >>交任务: |cRXP_FRIENDLY_小鬼的要求|r
.accept 8421 >>接任务: |cRXP_LOOT_奇怪的材料|r
.target Impsy
.dungeon ST
step << Warlock
#phase 4-6
.isQuestTurnedIn 8419
.goto Felwood,41.52,44.99
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊普斯|r交谈
.accept 8421 >>接任务: |cRXP_LOOT_奇怪的材料|r
.target Impsy
.dungeon ST
step << Warlock
#phase 4-6
#loop
.goto Felwood,41.20,45.40,0
.goto Felwood,41.20,45.40,50,0
.goto Felwood,43.40,48.20,50,0
.goto Felwood,42.60,50.20,50,0
.goto Felwood,39.60,54.00,50,0
.goto Felwood,40.80,59.80,50,0
.goto Felwood,40.80,66.00,50,0
.goto Felwood,40.20,68.60,50,0
.goto Felwood,38.80,71.60,50,0
.goto Felwood,41.60,71.60,50,0
.goto Felwood,42.00,67.80,50,0
.goto Felwood,40.80,66.00,50,0
.goto Felwood,40.80,59.80,50,0
.goto Felwood,39.60,54.00,50,0
.goto Felwood,41.20,50.60,50,0
.goto Felwood,38.60,49.60,50,0
.goto Felwood,43.40,48.20,50,0
>>击杀|cRXP_ENEMY_被污染的软泥怪|r. 击败它们并拾取|cRXP_LOOT_血毒精华|r
>>|cRXP_WARN_仅限|r |cRXP_ENEMY_被污染的软泥怪|r |cRXP_WARN_可能掉落|r |cRXP_LOOT_血毒精华|r
.isOnQuest 8421
.complete 8421,2 
.mob Cursed Ooze
.mob Tainted Ooze
.dungeon ST
step << skip 
#phase 4-6
#loop
.goto Felwood,41.20,45.40,0
.goto Felwood,41.20,45.40,50,0
.goto Felwood,43.40,48.20,50,0
.goto Felwood,42.60,50.20,50,0
.goto Felwood,39.60,54.00,50,0
.goto Felwood,40.80,59.80,50,0
.goto Felwood,40.80,66.00,50,0
.goto Felwood,40.20,68.60,50,0
.goto Felwood,38.80,71.60,50,0
.goto Felwood,41.60,71.60,50,0
.goto Felwood,42.00,67.80,50,0
.goto Felwood,40.80,66.00,50,0
.goto Felwood,40.80,59.80,50,0
.goto Felwood,39.60,54.00,50,0
.goto Felwood,41.20,50.60,50,0
.goto Felwood,38.60,49.60,50,0
.goto Felwood,43.40,48.20,50,0
>>击杀|cRXP_ENEMY_被诅咒的软泥怪|r和|cRXP_ENEMY_被污染的软泥怪|r. 击杀后掠夺其|cRXP_LOOT_软泥怪样本|r和|cRXP_LOOT_血毒精华|r
>>|cRXP_WARN_仅限|r |cRXP_ENEMY_被污染的软泥怪|r |cRXP_WARN_可能掉落|r |cRXP_LOOT_血毒精华|r
.isOnQuest 8421
.collect 12230,35,4293,1 
.complete 8421,2 
.mob Cursed Ooze
.mob Tainted Ooze
.dungeon ST
step << skip
#loop
.goto Felwood,41.20,45.40,0
.goto Felwood,41.20,45.40,50,0
.goto Felwood,43.40,48.20,50,0
.goto Felwood,42.60,50.20,50,0
.goto Felwood,39.60,54.00,50,0
.goto Felwood,40.80,59.80,50,0
.goto Felwood,40.80,66.00,50,0
.goto Felwood,40.20,68.60,50,0
.goto Felwood,38.80,71.60,50,0
.goto Felwood,41.60,71.60,50,0
.goto Felwood,42.00,67.80,50,0
.goto Felwood,40.80,66.00,50,0
.goto Felwood,40.80,59.80,50,0
.goto Felwood,39.60,54.00,50,0
.goto Felwood,41.20,50.60,50,0
.goto Felwood,38.60,49.60,50,0
.goto Felwood,43.40,48.20,50,0
>>击杀|cRXP_ENEMY_被诅咒的软泥怪|r和|cRXP_ENEMY_被污染的软泥怪|r. 击败它们后搜刮出|cRXP_LOOT_软泥怪样本|r
.collect 12230,35,4293,1 
.mob Cursed Ooze
.mob Tainted Ooze
.dungeon !ST << Warlock
step
#completewith next
>>进入一个弹坑
.complete 5156,3 
step
#loop
.goto Felwood,40.60,42.40,0
.goto Felwood,40.60,42.40,50,0
.goto Felwood,42.00,37.60,50,0
.goto Felwood,45.60,38.60,50,0
.goto Felwood,44.60,42.60,50,0
>>击杀|cRXP_ENEMY_热能野兽|r 和|cRXP_ENEMY_热能恐兽|r
>>|cRXP_WARN_它们共享刷新点, 所以你可能需要额外击杀每种类型的怪物|r
.complete 5156,1 
.mob +Entropic Beast
.complete 5156,2 
.mob +Entropic Horror
.complete 5156,3 
step
.goto Felwood,41.20,42.82
>>进入一个弹坑
.complete 5156,3 
step << Warlock
#phase 4-6
#loop
.goto Felwood,49.60,30.00,0
.goto Felwood,49.60,30.00,60,0
.goto Felwood,46.40,24.60,60,0
.goto Felwood,49.20,19.80,60,0
.goto Felwood,53.00,20.40,60,0
.goto Felwood,52.00,24.80,60,0
>>击杀|cRXP_ENEMY_枯萎的保护者|和|cRXP_ENEMY_铁木践踏者| 和|cRXP_ENEMY_铁木游荡者|. 击败它们后可获得|cRXP_LOOT_腐烂的木头|r
.complete 8421,1 
.mob Withered Protectors
.mob Irontree Stompers
.mob Irontree Wanderers
.isOnQuest 8421
.dungeon ST
step << Warlock
#phase 4-6
.goto Felwood,37.6,68.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊普斯|r交谈
.turnin 8421 >>交任务: |cRXP_FRIENDLY_奇怪的材料|r
.target Impsy
.isQuestComplete 8421
.dungeon ST
step << Warlock
#phase 4-6
.goto Felwood,41.52,44.99
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊普斯|r交谈
.accept 8422 >>接任务: |cRXP_WARN_巨魔的羽毛|r
.target Impsy
.isQuestTurnedIn 8421
.dungeon ST
step
#completewith next
>>击杀|cRXP_ENEMY_魔爪掠夺者|r和|cRXP_ENEMY_魔爪掠夺者|r
.complete 4120,1 
.mob +Angerclaw Grizzly
.complete 4120,2 
.mob +Felpaw Ravager
step
#loop
.goto Felwood,59.2,20.4,0
.goto Felwood,56.6,17.4,40,0
.goto Felwood,57.8,19.2,40,0
.goto Felwood,57.6,21.8,40,0
.goto Felwood,59.2,20.4,40,0
>>击杀|cRXP_ENEMY_曲木食苔者|r和|cRXP_ENEMY_曲木撕裂者|r. 击杀后可掠夺其掉落的|cRXP_LOOT_血琥珀|r
.complete 4102,1 
.mob Warpwood Moss Flayer
.mob Warpwood Shredder
step
#loop
.goto Felwood,56.00,22.20,0
.goto Felwood,56.00,22.20,60,0
.goto Felwood,53.20,28.00,60,0
.goto Felwood,56.80,26.40,60,0
.goto Felwood,56.00,22.20,60,0
.goto Felwood,58.60,15.60,60,0
.goto Felwood,64.60,20.00,60,0
.goto Felwood,58.60,15.60,60,0
.goto Felwood,56.20,8.60,60,0
.goto Felwood,50.80,12.60,60,0
.goto Felwood,53.60,15.60,60,0
>>完成击杀|cRXP_ENEMY_Angerclaw Grizzlies|r和|cRXP_ENEMY_魔爪掠夺者|r
.complete 4120,1 
.mob +Angerclaw Grizzly
.complete 4120,2 
.mob +Felpaw Ravager
step
#completewith next
.goto Felwood,64.70,8.10,70 >>前往木喉要塞入口
step
.goto Felwood,64.70,8.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳菲恩|r交谈
.turnin 8462 >>交任务: |cRXP_FRIENDLY_与纳菲恩交谈|r
.target Nafien
step
#completewith next
.goto Felwood,65.37,6.92,20,0
.goto Felwood,64.89,5.82,20,0
.goto Felwood,64.56,3.46,20,0
.goto Felwood,65.41,2.77,20,0
.goto Felwood,65.38,1.08,20,0
.goto Felwood,65.98,0.64,20,0
.goto Kalimdor,52.27,22.95,20,0
.goto Kalimdor,52.33,22.62,20,0
.goto Kalimdor,52.23,22.49,20,0
.goto Kalimdor,52.27,22.35,20,0
.goto Kalimdor,52.33,22.34,20,0
.goto Moonglade,35.74,72.37,20,0
.zone Moonglade >>前往: |cRXP_PICK_月光林地|r
.zoneskip Moonglade
.isOnQuest 7066
.dungeon MARA
step
.goto Moonglade,36.178,41.798
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守护者雷姆洛斯|r交谈
.turnin 7066 >>交任务: |cRXP_FRIENDLY_生命之种|r
.target Keeper Remulos
.isOnQuest 7066
.dungeon MARA
step
#completewith next
.goto Felwood,65.44,2.81,20,0
.goto Felwood,66.51,2.98,20,0
.goto Felwood,67.82,4.33,20,0
.goto Felwood,67.93,5.11,20,0
.zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
>>|cRXP_WARN_如果你与木喉要塞的关系不友好, |cRXP_ENEMY_熊怪|r会攻击你|r
step
.goto Winterspring,31.269,45.164
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多诺瓦·雪山|r交谈
.accept 5082 >>接任务: |cRXP_LOOT_冬泉熊怪的威胁|r
.turnin 3908 >>交任务: |cRXP_FRIENDLY_无人知晓的秘密|r
.timer 36,It's a Secret to Everybody RP
.target Donova Snowden
step
#completewith next
>>击杀|cRXP_ENEMY_熊怪|r, 直到你获得一个 |T134865:0|t[|cRXP_LOOT_空的火酒瓶|r]. 使用它来接受任务
>>|cRXP_WARN_这个物品掉落地率很低, 并且不会被队伍共享|r
.collect 12771,1,5083 
.accept 5083 >>接任务: |cRXP_LOOT_冬泉火酒|r
.use 12771
.mob Winterfall Pathfinder
.mob Winterfall Den Watcher
.mob Winterfall Totemic
step
#loop
.goto Winterspring,31.00,36.80,0
.goto Winterspring,31.00,36.80,50,0
.goto Winterspring,30.00,35.80,50,0
.goto Winterspring,31.00,34.80,50,0
.goto Winterspring,33.60,37.00,50,0
>>击杀|cRXP_ENEMY_冬泉探路者|r和|cRXP_ENEMY_冬泉巢穴守卫|r和|cRXP_ENEMY_冬泉图腾师|r
>>|cRXP_WARN_如果刷新点用尽, 请清理东南部的营地|r
.complete 5082,1 
.mob +Winterfall Pathfinder
.complete 5082,2 
.mob +Winterfall Den Watcher
.complete 5082,3 
.mob +Winterfall Totemic
step
#loop
.goto Winterspring,39.00,42.80,0
.goto Winterspring,39.00,42.80,50,0
.goto Winterspring,41.80,44.60,50,0
.goto Winterspring,42.40,42.40,50,0
>>击杀|cRXP_ENEMY_熊怪|r, 直到你获得一个 |T134865:0|t[|cRXP_LOOT_空的火酒瓶|r]. 使用它来接受任务
>>|cRXP_WARN_这个物品掉落率很低, 且不参与组队共享|r
.collect 12771,1,5083 
.accept 5083 >>接任务: |cRXP_LOOT_冬泉火酒|r
.use 12771
.mob Winterfall Pathfinder
.mob Winterfall Den Watcher
.mob Winterfall Totemic
step
.goto Winterspring,31.30,45.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donova|r交谈
.turnin 5082 >>交任务: |cRXP_FRIENDLY_冬泉熊怪的威胁|r
.turnin 5083 >>交任务: |cRXP_FRIENDLY_冬泉火酒|r
.accept 5084 >>接任务: |cRXP_LOOT_堕落熊怪|r
.target Donova Snowden
step
#hardcoreserver
.goto Winterspring,31.269,45.164
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多诺瓦·雪山|r交谈
>>|cRXP_WARN_暴雪已调整任务【视灵药剂】, 使其在官方硬核服务器上不会再导致玩家死亡|r
.accept 3909 >>接任务: |cRXP_WARN_视灵药剂|r
.target Donova Snowden
step
#softcoreserver
.goto Winterspring,31.269,45.164
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多诺瓦·雪山|r交谈
>>|cRXP_WARN_你可以安全地完成此任务, 它是[视灵药剂]任务链的一部分|r
.accept 3909 >>接任务: |cRXP_WARN_视灵药剂|r
.target Donova Snowden
step
#completewith next
.subzone 2255 >>前往永望镇
step
.goto Winterspring,61.60,38.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Felnok|r交谈
.turnin 4808 >>交任务: |cRXP_FRIENDLY_菲诺克|r
.target Felnok Steelspring
step
.goto Winterspring,61.45,36.97
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊兹·考伯加布|r交谈
.bankdeposit 10691,10692,10693,10694 >>请将以下物品存入银行:
>>|T134815:0|t[装满水的瓶子 #1]
>>|T134822:0|t[装满水的瓶子#2]
>>|T134836:0|t[装满水的瓶子 #3]
>>|T134857:0|t[装满水的瓶子#4]
.target Izzy Coppergrab
.isOnQuest 3568
step << Hunter
#completewith next
.goto Winterspring,60.389,37.917
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿兹雷比|r交谈
.stable >>驯服你的宠物. 你将很快驯服一只|cRXP_ENEMY_碎齿熊|r或|cRXP_ENEMY_冬泉巨枭|r
.target Azzleby
step << Hunter
#loop
.goto Winterspring,53.27,37.30,0
.goto Winterspring,51.64,38.87,0
.goto Winterspring,45.47,37.40,0
.goto Winterspring,53.27,37.30,70,0
.goto Winterspring,51.64,38.87,70,0
.goto Winterspring,45.47,37.40,70,0
>>|cRXP_WARN_|cRXP_WARN_请选中|r|cRXP_ENEMY_碎齿熊|r或|cRXP_ENEMY_冬泉巨枭|r|r并使用|r|T132164:0|t[驯服野兽]以驯服它|r 
.train 2977 >>|cRXP_WARN_用它攻击怪物来学习|r|T132140:0|t[利爪 (等级 7)]
.link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
.mob Shardtooth Bear
.mob Winterspring Owl
.zoneskip Winterspring,1
step << Hunter
.goto Winterspring,60.389,37.917
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿兹雷比|r交谈
.stable >>放弃|cRXP_ENEMY_碎齿熊|r 或|cRXP_ENEMY_冬泉巨枭|r, 然后取回你的常规宠物
.target Azzleby
.train 2977,3
.zoneskip Winterspring,1
step
.goto Winterspring,60.47,36.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤格雷克|r交谈
.fp Everlook >>获取永望镇飞行路径
.fly Felwood >>飞往费伍德森林
.target Yugrek
step
.goto Felwood,34.20,52.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温娜|r交谈
.turnin 4505 >>交任务: |cRXP_FRIENDLY_腐化之井|r
.target Winna Hazzard
step
.goto Felwood,34.80,52.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dreka'Sur|r交谈
.turnin 6162 >>交任务: |cRXP_FRIENDLY_最后一战|r
.target Dreka'Sur
step
.goto Felwood,46.60,83.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅贝丝·河风|r交谈
.turnin 4102 >>交任务: |cRXP_FRIENDLY_净化费伍德|r
step
.goto Felwood,46.60,83.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maybess|r再次对话, 以获得一个|T134249:0|t[塞纳里奥信标]
>>|cRXP_WARN_请选择选项:|r“我需要一个塞纳里奥信标. ”
.collect 11511,1 
.target Maybess Riverbreeze
.skipgossip 9529,2
step
.goto Felwood,51.20,82.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷塔·苔蹄|r交谈
.turnin 5157 >>交任务: |cRXP_FRIENDLY_收集堕落之水|r
.accept 5158 >>接任务: |cRXP_LOOT_水之魂的帮助|r
.target Greta Mosshoof
step
.goto Felwood,50.90,81.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Taronn|r交谈
.turnin 5156 >>交任务: |cRXP_FRIENDLY_验证腐蚀|r
.target Taronn Redfeather
step
#completewith next
.hs >>炉石传送至奥格瑞玛
.use 6948
step
.goto Orgrimmar,54.65,67.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酒吧老板莫拉格|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Barkeep Morag
step
#ah
.goto Orgrimmar,55.59,62.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thathung|r交谈
>>|cRXP_BUY_从拍卖行购买一个|r|T133021:0|t[秘银外壳]|r 
.target Auctioneer Thathung
.collect 10561,1,4244,1 
step
.goto Orgrimmar,55.52,34.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jes'rimon|r交谈
>>|cRXP_WARN_他位于建筑顶部|r
.turnin 3541 >>交任务: |cRXP_FRIENDLY_杰斯雷蒙的石版|r
.accept 3563 >>接任务: |cRXP_WARN_杰斯雷蒙的报酬|r
.target Jes'rimon
.isOnQuest 3541
step
.goto Orgrimmar,55.52,34.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jes'rimon|r交谈
>>|cRXP_WARN_他位于建筑顶部|r
.accept 3563 >>接任务: |cRXP_WARN_杰斯雷蒙的报酬|r
.target Jes'rimon
.isQuestTurnedIn 3541
step
.goto Orgrimmar,75.20,34.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔戈洛姆|r交谈
.turnin 3507 >>交任务: |cRXP_FRIENDLY_叛徒|r
.target Belgrom Rockmaul
.isOnQuest 3507
step
.goto Orgrimmar,56.40,46.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zilzibin|r交谈
>>|cRXP_WARN_他位于龙脊山的上层|r
.accept 4494 >>接任务: |cRXP_LOOT_异种蝎的远征|r
.target Zilzibin Drumlore
step
.goto Orgrimmar,45.11,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_多拉斯|r交谈
.fly Camp Taurajo >>飞往陶拉霍营地
.target Doras
.zoneskip The Barrens
step
.goto The Barrens,45.58,59.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
.home >>将你的炉石设置为陶拉祖营地
.target Innkeeper Byula
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 54-56 安戈洛环形山
#displayname 54-56 安戈洛环形山 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南(50-60级)
#next 56-57 费伍德森林/冬泉谷
step
.goto The Barrens,44.45,59.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
.fly Tanaris >>飞往塔纳利斯
.target Omusa Thunderhorn
.zoneskip Tanaris
step
.goto Tanaris,50.90,27.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pestlezugg|r交谈
.turnin 4494 >>交任务: |cRXP_FRIENDLY_异种蝎的远征|r
.accept 4496 >>接任务: |cRXP_LOOT_擒虫先擒王|r
.target Alchemist Pestlezugg
step
.goto Tanaris,52.70,45.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马尔冯|r交谈
.turnin 3444 >>交任务: |cRXP_FRIENDLY_石环|r
.target Marvon Rivetseeker
step
#completewith next
.goto Tanaris,51.60,25.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Un'Goro Crater>>飞往安戈洛环形山
.target Bulkrek Ragefist
.zoneskip Un'Goro Crater
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hol'anyee|r和|cRXP_FRIENDLY_Williden|r交谈
.accept 3883 >>接任务: |cRXP_LOOT_异型的生态|r
.target +Hol'anyee Marshal
.goto Un'Goro Crater,43.89,7.24
.accept 3881 >>接任务: |cRXP_LOOT_抢救物资|r
.target +Williden Marshal
.goto Un'Goro Crater,43.95,7.14
step
.goto Un'Goro Crater,43.50,7.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Spark|r交谈
.accept 3882 >>接任务: |cRXP_LOOT_挖骨头|r
.target Spark Nilminer
step
.goto Un'Goro Crater,43.16,6.24,30,0
.goto Un'Goro Crater,41.90,2.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_J.D. 科琳|r交谈
.accept 4288 >>接任务: |cRXP_LOOT_西部水晶塔|r
.accept 4287 >>接任务: |cRXP_LOOT_东部水晶塔|r
.target J.D. Collie
step
.goto Un'Goro Crater,43.61,8.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Spraggle|r交谈
.accept 4501 >>接任务: |cRXP_LOOT_当心翼手龙|r
.target Spraggle Frock
step
.goto Un'Goro Crater,45.53,8.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉瑞安|r交谈
.accept 4145 >>接任务: |cRXP_LOOT_拉瑞安和穆尔金|r
.target Larion
step
.goto Tanaris,12.80,8.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希兹尔|r交谈
.accept 4503 >>接任务: |cRXP_LOOT_希兹尔的的飞行器|r
.target Shizzle
step
#completewith Mighty
>>在探索安戈洛环形山时收集|cRXP_LOOT_安戈洛的泥土|r
.collect 11018,25 
step << skip
#completewith Mighty
>>击杀你遇到的每一个|cRXP_ENEMY_Ooze|r软泥怪. 击杀后掠夺其掉落的|cRXP_LOOT_软泥怪样本|r和 |cRXP_LOOT_安戈洛的泥土|r
.collect 11018,25 
.collect 12235,35,4294,1 
.mob Muculent Ooze
.mob Glutinous Ooze
.mob Primal Ooze
step
#completewith Gorillaz
.goto Un'Goro Crater,52.8,13.4,40,0
.goto Un'Goro Crater,53.0,17.6,40,0
.goto Un'Goro Crater,56.6,16.6,40,0
.goto Un'Goro Crater,60.6,20.6,40,0
>>在前往真菌岩的路上, 击杀血瓣花掠夺者
>>|cRXP_WARN_它们的毒药会造成高额伤害, 不要优先处理它, 可以稍后再解决|r << Warrior/Rogue
>>|cRXP_WARN_它们的毒药会造成高额伤害并吸取法力. 不要优先处理它, 可以稍后再解决|r << !Warrior !Rogue
.complete 4145,3 
.mob Bloodpetal Flayer
step
#label Gorillaz
#completewith FungalRock
.goto Un'Goro Crater,62.97,17.39,40,0
.subzone 542 >>前往菌类岩
step
#label FungalRock
#loop
.goto Un'Goro Crater,62.86,18.17,0
.goto Un'Goro Crater,61.85,17.71,50,0
.goto Un'Goro Crater,64.32,16.35,25,0
.goto Un'Goro Crater,65.83,15.61,20,0
.goto Un'Goro Crater,68.70,17.13,20,0
.goto Un'Goro Crater,69.52,16.82,20,0
.goto Un'Goro Crater,68.63,14.36,20,0
.goto Un'Goro Crater,68.51,13.27,20,0
.goto Un'Goro Crater,65.64,14.60,20,0
.goto Un'Goro Crater,65.06,16.70,20,0
.goto Un'Goro Crater,63.91,16.35,20,0
.goto Un'Goro Crater,62.86,18.17,20,0
>>击杀|cRXP_ENEMY_Un'Goro Stompers|r和|cRXP_ENEMY_Un'Goro Thunderers|r和|cRXP_ENEMY_Un'Goro gorillas|r, 击败它们后拾取其|cRXP_LOOT_Pelts|r
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_乌戈罗大猩猩|r|cRXP_WARN_在90码范围内会召唤援助. |r|cRXP_ENEMY_乌戈罗雷霆者|r|cRXP_WARN_施放高伤害的瞬发冲击法术|r|r
.complete 4289,2 
.mob +Un'Goro Stomper
.complete 4289,3 
.mob +Un'Goro Thunderer
.complete 4289,1 
.mob +Un'Goro Gorilla
step
#completewith Ucha
>>击杀|cRXP_ENEMY_双帆龙|r. 掠夺其|cRXP_LOOT_骨骼|r和|cRXP_LOOT_甲片|r
>>|cRXP_WARN_小心|r|cRXP_ENEMY_长者迪梅特拉顿斯'|r|cRXP_WARN_重击技能, 该技能会打断法术|r << Warlock/Priest/Mage/Shaman/Druid
.complete 3882,1 
.complete 4503,1 
.mob Diemetradon
.mob Young Diemetradon
.mob Elder Diemetradon
step
#loop
.goto Un'Goro Crater,57.60,36.80,0
.goto Un'Goro Crater,57.60,36.80,60,0
.goto Un'Goro Crater,64.40,30.80,60,0
.goto Un'Goro Crater,68.20,24.00,60,0
.goto Un'Goro Crater,71.20,31.00,60,0
.goto Un'Goro Crater,74.20,39.60,60,0
.goto Un'Goro Crater,76.00,47.40,60,0
.goto Un'Goro Crater,74.20,39.60,60,0
.goto Un'Goro Crater,69.40,38.00,60,0
.goto Un'Goro Crater,66.60,35.60,60,0
.goto Un'Goro Crater,60.00,39.40,60,0
>>击杀|cRXP_ENEMY_血瓣花猛击者|r和|cRXP_ENEMY_血瓣花鞭笞者|r和|cRXP_ENEMY_血瓣花掠夺者|r
>>|cRXP_WARN_它们的毒药会造成高额伤害, 且能解除玩家武装|r << Warrior/Rogue/Shaman
>>|cRXP_WARN_它们的毒药会造成高额伤害并吸取法力|r << !Warrior !Rogue !Shaman
.complete 4145,4 
.mob +Bloodpetal Thresher
.complete 4145,1 
.mob +Bloodpetal Lasher
.complete 4145,3 
.mob +Bloodpetal Flayer
step
.goto Un'Goro Crater,68.54,36.54
>>点击|cRXP_PICK_食物箱|r
.complete 3881,1 
step
.goto Un'Goro Crater,77.24,49.96
>>点击|cRXP_PICK_东部水晶塔|r
.complete 4287,1 
.isOnQuest 4287
step
#phase 4-6
.goto Un'Goro Crater,71.64,75.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔瓦|r交谈
.turnin 4289 >>交任务: |cRXP_FRIENDLY_安戈洛的猩猩|r
.accept 4292 >>接任务: |cRXP_LOOT_拉克维的诱饵|r
.accept 9052 >>接任务: |cRXP_WARN_血瓣毒药|r << Druid
.target Torwa Pathfinder
step
#phase 1-3
.goto Un'Goro Crater,71.64,75.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔瓦|r交谈
.turnin 4289 >>交任务: |cRXP_FRIENDLY_安戈洛的猩猩|r
.accept 4292 >>接任务: |cRXP_LOOT_拉克维的诱饵|r
.target Torwa Pathfinder
step
.goto Un'Goro Crater,79.94,49.88
.use 11568 >>|cRXP_WARN_Open|r|T133635:0|t[托瓦的布袋]
.use 11569 >>|cRXP_WARN_靠近那块大平石, 然后使用|r|T133970:0|t[蛇颈龙肉]
.use 11570 >>|cRXP_WARN_使用|r|T134743:0|t[恐龙信息素]
>>击杀|cRXP_ENEMY_Lar'korwi|r, 他出现时立即消灭, 掉落他的|cRXP_LOOT_Head|r
.complete 4292,1 
.mob Lar'korwi
step
#label Ucha
.goto Un'Goro Crater,71.64,75.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔瓦|r交谈
.turnin 4292 >>交任务: |cRXP_FRIENDLY_拉克维的诱饵|r
.accept 4301 >>接任务: |cRXP_LOOT_强大的尤尔查|r
.target Torwa Pathfinder
step << Druid
#phase 4-6
#sticky
#label bloodcap
>>在该区域周围采集|cRXP_PICK_血瓣花苗|r, 直到你获得8个|cRXP_LOOT_血帽|r
.complete 9052,2 
step
#loop
.goto Un'Goro Crater,68.20,75.00,0
.goto Un'Goro Crater,68.20,75.00,60,0
.goto Un'Goro Crater,67.00,71.20,60,0
.goto Un'Goro Crater,67.80,67.00,60,0
.goto Un'Goro Crater,68.00,61.60,60,0
.goto Un'Goro Crater,64.80,62.60,60,0
.goto Un'Goro Crater,63.00,66.40,60,0
.goto Un'Goro Crater,61.60,70.80,60,0
.goto Un'Goro Crater,59.80,75.20,60,0
.goto Un'Goro Crater,59.40,79.00,60,0
.goto Un'Goro Crater,62.00,82.40,60,0
.goto Un'Goro Crater,61.80,76.00,60,0
.goto Un'Goro Crater,63.60,77.20,60,0
.goto Un'Goro Crater,66.20,77.80,60,0
>>击杀|cRXP_ENEMY_Ravasaur 迅猛龙|r. 击杀后搜刮它们的|cRXP_LOOT_利爪|r
.complete 4300,1 
.mob Ravasaur
.mob Ravasaur Hunter
.mob Venomhide Ravasaur
.mob Ravasaur Runner
.mob Ravasaur Matriarch
.isOnQuest 4300
step
#phase 4-6
#completewith HiveSample
.goto Un'Goro Crater,50.59,77.06,0
>>击杀|cRXP_ENEMY_Gorishi 硅质虫|r. 击败它们后可获得|cRXP_LOOT_格里什信息素|r << !Druid
>>击杀|cRXP_ENEMY_Gorishi Silithid|r. 击败它们可获得|cRXP_LOOT_格里什信息素|r和|cRXP_LOOT_格里什钉刺|r << Druid
.complete 4496,1 
.complete 9052,1 << Druid 
.mob Gorishi Worker
.mob Gorishi Wasp
.mob Gorishi Reaver
.mob Gorishi Tunneler
.mob Gorishi Stinger
.mob Gorishi Hive Guard
step
#phase 1-3
#completewith HiveSample
.goto Un'Goro Crater,50.59,77.06,0
>>击杀|cRXP_ENEMY_Gorishi 硅质虫|r. 击败它们后可获得|cRXP_LOOT_格里什信息素|r
.complete 4496,1 
.mob Gorishi Worker
.mob Gorishi Wasp
.mob Gorishi Reaver
.mob Gorishi Tunneler
.mob Gorishi Stinger
.mob Gorishi Hive Guard
step
.goto Un'Goro Crater,49.96,81.69,15 >>进入Silithid洞穴
.isOnQuest 3883
step
#completewith next
.goto Un'Goro Crater,49.43,82.90,15,0
.goto Un'Goro Crater,49.17,84.51,12 >>进入左侧房间
step
#label HiveSample
.goto Un'Goro Crater,48.69,85.31
.use 11132 >>|cRXP_WARN_在房间中央使用你的|r|T134864:0|t[刮削药剂瓶]|r
.complete 3883,1 
step
#phase 4-6
#loop
.goto Un'Goro Crater,51.74,75.36,0
.goto Un'Goro Crater,49.44,82.85,40,0
.goto Un'Goro Crater,50.35,79.55,50,0
.goto Un'Goro Crater,48.69,76.45,70,0
.goto Un'Goro Crater,47.58,81.58,70,0
.goto Un'Goro Crater,49.38,82.32,70,0
.goto Un'Goro Crater,52.38,84.31,70,0
.goto Un'Goro Crater,54.03,78.15,70,0
.goto Un'Goro Crater,51.74,75.36,70,0
>>击杀|cRXP_ENEMY_Gorishi 硅质虫|r. 击败它们后可获得|cRXP_LOOT_格里什信息素|r << !Druid
>>击杀|cRXP_ENEMY_Gorishi Silithid|r. 击败它们可获得|cRXP_LOOT_格里什信息素|r和|cRXP_LOOT_格里什钉刺|r << Druid
.complete 4496,1 
.complete 9052,1 << Druid 
.mob Gorishi Worker
.mob Gorishi Wasp
.mob Gorishi Reaver
.mob Gorishi Tunneler
.mob Gorishi Stinger
.mob Gorishi Hive Guard
step
#phase 1-3
#loop
.goto Un'Goro Crater,51.74,75.36,0
.goto Un'Goro Crater,49.44,82.85,40,0
.goto Un'Goro Crater,50.35,79.55,50,0
.goto Un'Goro Crater,48.69,76.45,70,0
.goto Un'Goro Crater,47.58,81.58,70,0
.goto Un'Goro Crater,49.38,82.32,70,0
.goto Un'Goro Crater,52.38,84.31,70,0
.goto Un'Goro Crater,54.03,78.15,70,0
.goto Un'Goro Crater,51.74,75.36,70,0
>>击杀|cRXP_ENEMY_Gorishi 硅质虫|r. 击败它们后可获得|cRXP_LOOT_格里什信息素|r
.complete 4496,1 
.mob Gorishi Worker
.mob Gorishi Wasp
.mob Gorishi Reaver
.mob Gorishi Tunneler
.mob Gorishi Stinger
.mob Gorishi Hive Guard
step
#loop
.goto Un'Goro Crater,43.6,92.4,0
.goto Un'Goro Crater,56.2,88.2,40,0
.goto Un'Goro Crater,57.0,92.6,40,0
.goto Un'Goro Crater,50.4,87.8,40,0
.goto Un'Goro Crater,50.6,89.8,40,0
.goto Un'Goro Crater,43.0,85.2,40,0
.goto Un'Goro Crater,43.6,92.4,40,0
>>在南部山区击杀翼手龙
.complete 4501,1 
.unitscan Pterrordax
step
#completewith WesternPylon
.goto Un'Goro Crater,35.49,43.91
>>击杀|cRXP_ENEMY_血瓣花捕兽者|r
>>|cRXP_WARN_它们的毒液会造成高额伤害, 且能施放缠绕根须|r << Warrior/Rogue/Shaman
>>|cRXP_WARN_它们的毒液会造成高额伤害并消耗法力值. 它们可以施放缠绕根须|r << !Warrior !Rogue !Shaman
.complete 4145,2 
.mob Bloodpetal Trapper
step
#completewith BloodpetalTrappers
>>击杀|cRXP_ENEMY_双帆龙|r. 掠夺其|cRXP_LOOT_骨骼|r和|cRXP_LOOT_甲片|r
.complete 3882,1 
.complete 4503,1 
.mob Diemetradon
.mob Young Diemetradon
.mob Elder Diemetradon
step
#completewith DiemetradonKills
.goto Un'Goro Crater,20.95,59.45,80,0
.goto Un'Goro Crater,36.76,35.47,0
>>击杀|cRXP_ENEMY_狂怒的翼手龙|r. 击杀后搜刮其|cRXP_LOOT_鳞片|r
.complete 4501,2 
.complete 4503,2 
.mob Frenzied Pterrordax
step
.goto Un'Goro Crater,38.46,66.07
>>点击|cRXP_PICK_研究设备 框|r
.complete 3881,2 
step
#label WesternPylon
.goto Un'Goro Crater,23.87,59.21
>>点击|cRXP_PICK_西方水晶柱|r
.complete 4288,1 
step
#label BloodpetalTrappers
.goto Un'Goro Crater,35.49,43.91
>>击杀|cRXP_ENEMY_血瓣花捕兽者|r
>>|cRXP_WARN_它们的毒液会造成高额伤害, 且能施放缠绕根须|r << Warrior/Rogue/Shaman
>>|cRXP_WARN_它们的毒液会造成高额伤害并消耗法力值. 它们可以施放缠绕根须|r << !Warrior !Rogue !Shaman
.complete 4145,2 
.mob Bloodpetal Trapper
step
#label DiemetradonKills
#loop
.goto Un'Goro Crater,40.80,62.80,0
.goto Un'Goro Crater,36.60,65.80,60,0
.goto Un'Goro Crater,40.80,62.80,60,0
.goto Un'Goro Crater,41.80,56.80,60,0
.goto Un'Goro Crater,40.60,51.20,60,0
.goto Un'Goro Crater,39.60,43.40,60,0
.goto Un'Goro Crater,37.80,36.60,60,0
.goto Un'Goro Crater,32.60,34.40,60,0
.goto Un'Goro Crater,27.60,37.20,60,0
.goto Un'Goro Crater,26.00,45.40,60,0
.goto Un'Goro Crater,26.80,58.20,60,0
.goto Un'Goro Crater,30.80,68.00,60,0
.goto Un'Goro Crater,38.40,74.00,60,0
.goto Un'Goro Crater,40.80,67.20,60,0
.goto Un'Goro Crater,32.80,63.20,60,0
.goto Un'Goro Crater,30.80,59.60,60,0
>>击杀|cRXP_ENEMY_双帆龙|r. 掠夺其|cRXP_LOOT_骨骼|r和|cRXP_LOOT_甲片|r
.complete 3882,1 
.complete 4503,1 
.mob Diemetradon
.mob Young Diemetradon
.mob Elder Diemetradon
step
#label PterrordaxAndys
#loop
.goto Un'Goro Crater,30.80,59.60,0
.goto Un'Goro Crater,36.60,65.80,60,0
.goto Un'Goro Crater,40.80,62.80,60,0
.goto Un'Goro Crater,41.80,56.80,60,0
.goto Un'Goro Crater,40.60,51.20,60,0
.goto Un'Goro Crater,39.60,43.40,60,0
.goto Un'Goro Crater,37.80,36.60,60,0
.goto Un'Goro Crater,32.60,34.40,60,0
.goto Un'Goro Crater,27.60,37.20,60,0
.goto Un'Goro Crater,26.00,45.40,60,0
.goto Un'Goro Crater,26.80,58.20,60,0
.goto Un'Goro Crater,30.80,68.00,60,0
.goto Un'Goro Crater,38.40,74.00,60,0
.goto Un'Goro Crater,40.80,67.20,60,0
.goto Un'Goro Crater,32.80,63.20,60,0
.goto Un'Goro Crater,30.80,59.60,60,0
>>击杀|cRXP_ENEMY_狂怒的翼手龙|r. 从它们身上搜刮|cRXP_LOOT_鳞片|r
.complete 4501,2 
.complete 4503,2 
.mob Frenzied Pterrordax
step
#completewith next
.subzone 541 >>前往指挥官的避难所
step
.goto Un'Goro Crater,43.61,8.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Spraggle|r交谈
.turnin 4501 >>交任务: |cRXP_FRIENDLY_当心翼手龙|r
.accept 4492 >>接任务: |cRXP_LOOT_走丢了！|r
.target Spraggle Frock
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hol'anyee|r和|cRXP_FRIENDLY_Williden|r交谈
.turnin 3883 >>交任务: |cRXP_FRIENDLY_异型的生态|r
.target +Hol'anyee Marshal
.goto Un'Goro Crater,43.89,7.24
.turnin 3881 >>交任务: |cRXP_FRIENDLY_抢救物资|r
.target +Williden Marshal
.goto Un'Goro Crater,43.95,7.14
step
.goto Un'Goro Crater,43.16,6.24,30,0
.goto Un'Goro Crater,41.9,2.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与洞穴内的|cRXP_FRIENDLY_科琳|r交谈
.turnin 4288 >>交任务: |cRXP_FRIENDLY_西部水晶塔|r
.turnin 4287 >>交任务: |cRXP_FRIENDLY_东部水晶塔|r
.accept 4285 >>接任务: |cRXP_LOOT_北部水晶塔|r
.target J.D. Collie
step
.goto Un'Goro Crater,43.50,7.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Spark|r交谈
.turnin 3882 >>交任务: |cRXP_FRIENDLY_挖骨头|r
.target Spark Nilminer
step
.goto Un'Goro Crater,45.53,8.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉瑞安|r交谈
.turnin 4145 >>交任务: |cRXP_FRIENDLY_拉瑞安和穆尔金|r
.target Larion
step
.goto Un'Goro Crater,44.23,11.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希兹尔|r交谈
.turnin 4503 >>交任务: |cRXP_FRIENDLY_希兹尔的的飞行器|r
.target Shizzle
step
.goto Un'Goro Crater,46.37,13.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Karna|r交谈
.accept 4243 >>接任务: |cRXP_LOOT_找回A-Me 01|r
.target Karna Remtravel
step
.goto Un'Goro Crater,56.49,12.44
>>点击|cRXP_PICK_北部水晶塔|r
.complete 4285,1 
.isOnQuest 4285
step
.goto Un'Goro Crater,64.17,16.43,40,0
.goto Un'Goro Crater,67.66,16.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入洞穴后紧贴右侧墙壁, 然后与|cRXP_FRIENDLY_A-Me 01|r交谈
.turnin 4243 >>交任务: |cRXP_FRIENDLY_找回A-Me 01|r
.target A-Me 01
step
.goto Un'Goro Crater,68.0,13.2
>>击杀洞穴后方的|cRXP_ENEMY_U'cha|r, 搜刮他的|cRXP_LOOT_Pelt|r
.complete 4301,1 
.unitscan U'cha
step
#ah
.goto Un'Goro Crater,67.67,16.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_A-Me|r交谈
.accept 4244 >>接任务: |cRXP_LOOT_找回A-Me 01|r
.turnin 4244 >>交任务: |cRXP_FRIENDLY_找回A-Me 01|r
.accept 4245,1 >>接任务: |cRXP_LOOT_找回A-Me 01|r
.target A-Me 01
step
#ah
.goto Un'Goro Crater,67.67,16.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_A-Me|r交谈
.accept 4245 >>接任务: |cRXP_LOOT_找回A-Me 01|r
.target A-Me 01
step
#ah
.goto Un'Goro Crater,46.37,13.43
>>护送|cRXP_FRIENDLY_A-Me|r返回元帅避难所
.complete 4245,1 
.isOnQuest 4245
step
#ah
.goto Un'Goro Crater,46.37,13.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Karna|r交谈
.turnin 4245 >>交任务: |cRXP_FRIENDLY_找回A-Me 01|r
.target Karna Remtravel
.isQuestComplete 4245
step
#phase 4-6
#label Mighty
.goto Un'Goro Crater,71.64,75.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔瓦|r交谈
.turnin 4301 >>交任务: |cRXP_FRIENDLY_强大的尤尔查|r
.turnin 9052 >>交任务: |cRXP_FRIENDLY_血瓣毒药|r << Druid
.target Torwa Pathfinder
.isQuestComplete 9052 << Druid
step
#phase 1-3
#label Mighty
.goto Un'Goro Crater,71.64,75.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔瓦|r交谈
.turnin 4301 >>交任务: |cRXP_FRIENDLY_强大的尤尔查|r
.target Torwa Pathfinder
step << Druid
#phase 4-6
.goto Un'Goro Crater,71.64,75.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔瓦|r交谈
>>|cRXP_WARN_当你到达此任务的完成步骤时, 请务必仔细阅读我们的说明. 此任务非常危险|r
.accept 9051 >>接任务: |cRXP_WARN_毒性测试|r
.target Torwa Pathfinder
.isQuestTurnedIn 9052
step
.goto Un'Goro Crater,30.94,50.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克拉兰克|r交谈
.accept 974 >>接任务: |cRXP_LOOT_究根问底|r
.target Krakle
step << Druid 
#phase 4-6
>>追踪|cRXP_ENEMY_魔暴龙|r或|cRXP_ENEMY_铁皮魔暴龙|r
>>|cRXP_WARN_不要与|r|cRXPTyrant Devilsaur|r|cRXP_WARN_交战；它们的恐惧技能非常致命|r
>>|cRXP_WARN_对|r|cRXP_ENEMY_魔暴龙|r|cRXP_WARN_施放寒冰陷阱, 仅此而已. 如果中断了, 再次施放|r
>>|cRXP_ENEMY_魔暴龙|r|cRXP_WARN_拥有170%移动速度；它们无法被追上|r
.use 22432 >>在它睡觉时, 使用你的 |T135125:0|t[魔暴龙之刺]
.complete 9051,1 
.unitscan Devilsaur
.unitscan Ironhide Devilsaur
.unitscan Tyrant Devilsaur
.isOnQuest 9051
step << Druid
#phase 4-6
.goto Un'Goro Crater,71.64,75.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔瓦|r交谈
.turnin 9051 >>交任务: |cRXP_FRIENDLY_毒性测试|r
.target Torwa Pathfinder
.isQuestComplete 9051
step << Druid
#phase 4-6
.goto Un'Goro Crater,71.639,75.960
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔瓦|r交谈
.accept 9053 >>接任务: |cRXP_WARN_更好的材料|r
.target Torwa Pathfinder
.isQuestTurnedIn 9051
.dungeon ST
step << skip
#loop
.goto Un'Goro Crater,50.93,67.97,0
.goto Un'Goro Crater,46.60,62.37,70,0
.goto Un'Goro Crater,49.25,64.43,70,0
.goto Un'Goro Crater,50.93,67.97,70,0
.goto Un'Goro Crater,55.97,69.52,70,0
.goto Un'Goro Crater,57.84,63.53,70,0
.goto Un'Goro Crater,58.80,57.84,70,0
.goto Un'Goro Crater,58.43,52.67,70,0
.goto Un'Goro Crater,57.94,44.83,70,0
>>击杀|cRXP_ENEMY_Oozes|r. 搜刮其掉落的|cRXP_LOOT_软泥怪样本|r和|cRXP_LOOT_安戈洛的泥土|r
>>|cRXP_ENEMY_原生软泥怪|r|cRXP_WARN_向南/西方向最为丰富, 但要小心|r|cRXP_ENEMY_魔暴龙|r|cRXP_WARN_在该区域巡逻|r
.collect 11018,25 
.collect 12235,35,4294,1 
.mob Muculent Ooze
.mob Glutinous Ooze
.mob Primal Ooze
step
#loop
.goto Un'Goro Crater,50.93,67.97,0
.goto Un'Goro Crater,46.60,62.37,70,0
.goto Un'Goro Crater,49.25,64.43,70,0
.goto Un'Goro Crater,50.93,67.97,70,0
.goto Un'Goro Crater,55.97,69.52,70,0
.goto Un'Goro Crater,57.84,63.53,70,0
.goto Un'Goro Crater,58.80,57.84,70,0
.goto Un'Goro Crater,58.43,52.67,70,0
.goto Un'Goro Crater,57.94,44.83,70,0
>>收集|cRXP_LOOT_安戈洛的泥土|r 或从|cRXP_PICK_安戈洛土堆|r 中获取
.collect 11018,25 
step
#completewith HotSpot
.goto Un'Goro Crater,47.1,47.1,10,0
.goto Un'Goro Crater,47.7,48.3,10,0
.goto Un'Goro Crater,48.2,50.1,10,0
.goto Un'Goro Crater,48.6,49.8,20 >>火山西侧的熔岩路径是通往山顶的捷径
step
#completewith next
>>击杀 |cRXP_ENEMY_火元素|r. 击杀后搜刮其掉落的 |cRXP_LOOT_灰烬|r
.complete 4502,1 
.mob Scorching Elemental
.mob Living Blaze
.mob Blazing Invader
step
#label HotSpot
.goto Un'Goro Crater,49.6,45.7
.use 12472 >>爬到火山顶部, 然后使用 |T132995:0|t[克拉克尔的温度计]
.complete 974,1 
step
.goto Un'Goro Crater,30.94,50.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克拉兰克|r交谈
.turnin 974 >>交任务: |cRXP_FRIENDLY_究根问底|r
.accept 980 >>接任务: |cRXP_LOOT_新的泉水|r
.target Krakle
step
#loop
.goto Un'Goro Crater,46.70,53.20,0
.goto Un'Goro Crater,46.70,53.20,50,0
.goto Un'Goro Crater,49.80,53.90,50,0
.goto Un'Goro Crater,52.20,54.20,50,0
.goto Un'Goro Crater,51.20,51.60,50,0
.goto Un'Goro Crater,53.10,50.40,50,0
.goto Un'Goro Crater,52.60,45.30,50,0
.goto Un'Goro Crater,51.50,46.30,50,0
.goto Un'Goro Crater,50.30,47.70,50,0
.goto Un'Goro Crater,51.30,49.40,50,0
.goto Un'Goro Crater,50.30,47.70,50,0
.goto Un'Goro Crater,49.50,47.30,50,0
.goto Un'Goro Crater,47.80,50.90,50,0
>>击杀 |cRXP_ENEMY_火元素|r. 击杀后搜刮其掉落的 |cRXP_LOOT_灰烬|r
.complete 4502,1 
.mob Scorching Elemental
.mob Living Blaze
.mob Blazing Invader
step
#completewith next
.goto Un'Goro Crater,52.42,51.00,30 >>进入火山东侧的洞穴
step
.goto Un'Goro Crater,51.90,49.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林格|r交谈
.turnin 4492 >>交任务: |cRXP_FRIENDLY_走丢了！|r
.accept 4491 >>接任务: |cRXP_LOOT_朋友的帮助|r
.target Ringo
step
.goto Un'Goro Crater,43.62,8.50
.use 11804 >>护送林格到元帅避难所. 当他倒下时, 使用 |T132805:0|t[斯普拉格尔的饭盒] 为他治疗
>>|cRXP_WARN_注意不要骑得太快离开林格|r
.complete 4491,1 
.target Ringo
step
.goto Un'Goro Crater,43.61,8.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Spraggle|r交谈
.turnin 4491 >>交任务: |cRXP_FRIENDLY_朋友的帮助|r
.target Spraggle Frock
step
.goto Un'Goro Crater,43.16,6.24,30,0
.goto Un'Goro Crater,41.9,2.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与洞穴内的|cRXP_FRIENDLY_科琳|r交谈
.turnin 4285 >>交任务: |cRXP_FRIENDLY_北部水晶塔|r
.accept 4321 >>接任务: |cRXP_LOOT_分析水晶塔|r
.turnin 4321 >>交任务: |cRXP_FRIENDLY_分析水晶塔|r
.target J.D. Collie
step
.goto Un'Goro Crater,45.53,8.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉瑞安|r交谈
.accept 4147 >>接任务: |cRXP_LOOT_玛尔冯的车间|r
.target Larion
step
#completewith FlyFeralas
.goto Un'Goro Crater,43.16,6.24,30,0
.goto Un'Goro Crater,45.23,5.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱菲|r交谈
.fly Tanaris >>飞往塔纳利斯
.target Gryfe
.zoneskip Tanaris
step
.goto Tanaris,50.90,27.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pestlezugg|r交谈
.turnin 4496 >>交任务: |cRXP_FRIENDLY_擒虫先擒王|r
.target Alchemist Pestlezugg
step
.goto Tanaris,52.707,45.923
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔冯·瑞文斯克|r交谈
.accept 3446 >>接任务: |cRXP_WARN_深入神庙|r
.accept 3447 >>接任务: |cRXP_WARN_雕像群的秘密|r
.target Marvon Rivetseeker
.isQuestTurnedIn 3444
.dungeon ST
step
.goto Tanaris,66.989,22.354
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Yeh'kinya|r交谈
.accept 3528 >>接任务: |cRXP_WARN_神灵哈卡|r
.target Yeh'kinya
.isQuestTurnedIn 4787 
.dungeon ST
step
#label FlyFeralas
.goto Tanaris,51.60,25.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Feralas >>飞往菲拉斯
.target Bulkrek Ragefist
.zoneskip Feralas
step
.goto Feralas,76.18,43.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔洛|r交谈
.turnin 4120 >>交任务: |cRXP_FRIENDLY_堕落的力量|r
.target Talo Thornhoof
step
#completewith next
.goto Feralas,55.90,46.23,20 >>沿着恐惧之槌的边界向西边行进
step
.goto Feralas,55.41,45.54
.zone 1414 >>|cRXP_WARN_你必须先探索恐惧之槌区域, 这是解锁后续任务的前置条件. 靠近恐惧之槌区域边界, 直到你的普通聊天频道名称变为“恐惧之槌”|r
.link https://youtu.be/ayEKuXSUU2A >>|cRXP_WARN_点击此处查看视频参考|r
step
.goto Feralas,50.76,49.83,60,0
.goto Feralas,45.12,25.56
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷甘|r交谈
>>|cRXP_BUY_从他那里买一些|r|T134006:0|t[诱饵]|r
.collect 11141,1,3909,1 
.target Gregan Brewspewer
step
#xprate <2.0
#completewith next
.goto Feralas,44.627,10.568
.cast 14008 >>|cRXP_WARN_将|r|T134006:0|t[诱饵]|cRXP_WARN_放在|cRXP_FRIENDLY_米布隆·乱齿|r身旁的地面上, 以吸引他的注意力|r
.use 11141 
.target Miblon Snarltooth
.isOnQuest 3909
step
#xprate <2.0
.goto Feralas,44.605,10.185,-1
.goto Feralas,44.517,10.220,-1
>>掠夺废墟内的|cRXP_LOOT_灵根草|r
.collect 11242,1,3909,1 
.use 11141 
.isOnQuest 3909
step
.goto Feralas,45.12,25.56
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷甘|r对话, 并交付|cRXP_LOOT_灵根草|r
.complete 3909,1 
.target Gregan Brewspewer
step
#completewith next
.hs >>传送至陶拉祖营地
.use 6948
step
.goto The Barrens,45.58,59.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Byula
step << !Mage
.goto The Barrens,44.45,59.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
.fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
.target Omusa Thunderhorn
.zoneskip Thunder Bluff
step << Mage
.cast 3566 >>施放 |T135765:0|t[传送:雷霆崖]
.zoneskip Thunder Bluff
step << Mage
.goto Thunder Bluff,25.18,20.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thurston|r交谈
.train 10199 >>训练你的职业法术
.target Thurston Xane
.xp <54,1
.xp >56,1
step << Mage
#optional
.goto Thunder Bluff,25.18,20.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thurston|r交谈
.train 10157 >>训练你的职业法术
.target Thurston Xane
.xp <56,1
step
#sticky
#label BluffRunner
.goto Thunder Bluff,41.54,57.87,70,0
.goto Thunder Bluff,52.76,62.07,30,0
.goto Thunder Bluff,55.63,50.08,70,0
.goto Thunder Bluff,41.54,57.87,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷霆崖信使斯塔德尔|r交谈
>>|cRXP_WARN_他会在平台区域巡逻, 所以你可能需要四处找找他|r
.accept 1000 >>接任务: |cRXP_WARN_新的边疆|r
.accept 5095 >>接任务: |cRXP_LOOT_战斗的号角：瘟疫之地！|r
.unitscan Bluff Runner Windstrider
step
.goto Thunder Bluff,45.80,64.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pala|r交谈
.accept 3762 >>接任务: |cRXP_WARN_协助大德鲁伊|r
.target Innkeeper Pala
step << Hunter
.goto Thunder Bluff,59.11,86.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 14290 >>训练你的职业法术
.target Urek Thunderhorn
.xp <54,1
.xp >56,1
step << Hunter
#optional
.goto Thunder Bluff,59.11,86.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 14305 >>训练你的职业法术
.target Urek Thunderhorn
.xp <56,1
step << Hunter
.goto Thunder Bluff,54.08,84.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hesuwa|r交谈
.train 24631 >>训练你的宠物法术
.target Hesuwa Thunderhorn
.xp <54,1
step << Warrior
.goto Thunder Bluff,57.56,85.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
.train 11605 >>训练你的职业法术
.target Ker Ragetotem
.xp <54,1
.xp >56,1
step << Warrior
#optional
.goto Thunder Bluff,57.56,85.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
.train 20662 >>训练你的职业法术
.target Ker Ragetotem
.xp <56,1
step << Shaman
.goto Thunder Bluff,22.84,21.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 10408 >>训练你的职业法术
.target Tigor Skychaser
.xp <54,1
.xp >56,1
step << Shaman
#optional
.goto Thunder Bluff,22.84,21.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 10432 >>训练你的职业法术
.target Tigor Skychaser
.xp <56,1
step << Priest
.goto Thunder Bluff,24.56,22.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马拉凯|r交谈
.train 10900 >>训练你的职业法术
.target Malakai Cross
.xp <54,1
.xp >56,1
step << Priest
#optional
.goto Thunder Bluff,24.56,22.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马拉凯|r交谈
.train 10929 >>训练你的职业法术
.target Malakai Cross
.xp <56,1
step << Druid
.goto Thunder Bluff,76.46,27.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
.train 9857 >>训练你的职业法术
.target Turak Runetotem
.xp <54,1
.xp >56,1
step << Druid
#optional
.goto Thunder Bluff,76.46,27.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
.train 22829 >>训练你的职业法术
.target Tura
.xp <56,1
step
.goto Thunder Bluff,78.50,28.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈穆尔|r交谈
.turnin 1000 >>交任务: |cRXP_FRIENDLY_新的边疆|r
.accept 1123 >>接任务: |cRXP_WARN_拉比恩·萨图纳|r
.turnin 3762 >>交任务: |cRXP_FRIENDLY_协助大德鲁伊|r
.accept 3761 >>接任务: |cRXP_LOOT_安戈洛的泥土|r
.target Arch Druid Hamuul Runetotem
step
.goto Thunder Bluff,77.30,22.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格德|r交谈
.turnin 3761 >>交任务: |cRXP_FRIENDLY_安戈洛的泥土|r
.target Ghede
step
.goto Thunder Bluff,78.40,28.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈穆尔|r交谈
.accept 3782 >>接任务: |cRXP_WARN_晨光麦研究|r
.target Arch Druid Hamuul Runetotem
step
.goto Thunder Bluff,70.20,30.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格萨|r交谈
.turnin 3518 >>交任务: |cRXP_FRIENDLY_玛加萨的石版|r
.target Magatha Grimtotem
.isOnQuest 3518
step
.goto Thunder Bluff,70.20,30.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格萨|r交谈
.accept 3562 >>接任务: |cRXP_WARN_玛加萨的报酬|r
.target Magatha Grimtotem
.isQuestTurnedIn 3518
step
.goto Thunder Bluff,71.00,33.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴珊娜|r交谈
.turnin 3782 >>交任务: |cRXP_FRIENDLY_晨光麦研究|r
.target Bashana Runetotem
step
#sticky
#completewith EnterST
.subzone 1417 >>现在你应该寻找一个前往沉没神庙的队伍
.dungeon ST
step
.goto Thunder Bluff,47.02,49.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Ratchet >>飞往棘齿城
.target Tal
.zoneskip Thunder Bluff,1
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 56-57 费伍德森林/冬泉谷
#displayname 56-57 费伍德森林/冬泉谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南(50-60级)
#next 57-59 西部群岛/东部群岛
step
.goto The Barrens,62.50,38.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Liv|r交谈
.turnin 4502 >>交任务: |cRXP_FRIENDLY_火山的活动|r
.turnin 4147 >>交任务: |cRXP_FRIENDLY_玛尔冯的车间|r
.target Liv Rizzlefix
step
.goto The Barrens,62.50,38.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Liv|r交谈
.accept 4146 >>接任务: |cRXP_WARN_除草器的燃料|r
.target Liv Rizzlefix
.isQuestTurnedIn 4147
.dungeon ST
step
.goto The Barrens,65.80,43.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水之先知伊斯伦|r交谈
.turnin 5158 >>交任务: |cRXP_FRIENDLY_水之魂的帮助|r
.timer 48,Seeking Spiritual Aid RP
.accept 5159 >>接任务: |cRXP_LOOT_净化过的水|r
.target Islen Waterseer
step
#completewith next
.goto The Barrens,63.74,38.66
.zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
.zoneskip Stranglethorn Vale
.dungeon ST
step
.goto Stranglethorn Vale,26.90,77.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格林戈|r交谈
.fly Stonard>>飞往斯托纳德
.target Gringer
.zoneskip Swamp of Sorrows
.dungeon ST
step
.goto Swamp of Sorrows,47.93,54.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fel'zerul|r交谈
.accept 1445 >>接任务: |cRXP_WARN_阿塔哈卡神庙|r
.isQuestTurnedIn 1444
.dungeon ST
step << Warrior
#phase 4-6
.goto Swamp of Sorrows,34.287,66.134
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.accept 8425 >>接任务: |cRXP_WARN_巫毒羽毛|r
.target Fallen Hero of the Horde
.isQuestTurnedIn 8424
.dungeon ST
step
.goto 1415,56.33,76.28
.subzone 1477 >>前往沉没的神庙
.dungeon ST
step
#completewith next
>>在沉没神庙中击杀|cRXP_ENEMY_巨魔|r, 击败他们后可获得他们的|cRXP_LOOT_哈卡神像|r
>>|cRXP_WARN_沉没神庙内外的巨魔都有可能掉落这些物品|r
.complete 1445,1 
.isOnQuest 1445
.dungeon ST
step
#label EnterST
.goto 1415,56.33,76.28,40,0
.goto 1415,56.46,75.54,20,0
.goto 1415,56.83,75.86,20,0
.goto 1415,56.94,76.03,15,0
.goto 1415,57.06,75.58,20,0
.goto 1415,56.76,75.35,15,0
.goto 1415,56.809,75.151
.subzone 1477,2 >>进入沉没的神庙区域
.dungeon ST
step
#sticky
>>在沉没神庙中击杀|cRXP_ENEMY_巨魔|r, 击败他们后可获得他们的|cRXP_LOOT_哈卡神像|r
.complete 1445,1 
.isOnQuest 1445
.dungeon ST
step
#sticky
>>击杀|cRXP_ENEMY_神庙深渊潜伏者|r和|cRXP_ENEMY_黑暗虫|r和|cRXP_ENEMY_深色软泥怪|r, 从它们身上搜刮出|cRXP_LOOT_Atal'ai Haze|r
>>|cRXP_ENEMY_在副本入口处右转下楼梯, 即可找到这些怪物|r
.complete 4146,1 
.isOnQuest 4146
.dungeon ST
step << Druid
#phase 4-6
#completewith Altar
>>击杀|cRXP_ENEMY_Atal'alarion|r. 击败他后搜刮|cRXP_LOOT_腐烂藤蔓|r
>>|cRXP_ENEMY_阿塔拉里昂|r|cRXP_WARN_位于沉没的神庙下层, 通过点击平台上的所有 |cRXP_PICK_阿塔莱塑像|r来召唤|r
.complete 9053,1 
.isOnQuest 9053
.dungeon ST
step 
#completewith next
>>点击|cRXP_PICK_哈卡祭坛|r
>>|cRXP_WARN_|cRXP_PICK_哈卡祭坛|r位于沉没的神庙底层|r
.turnin 3446 >>交任务: |cRXP_FRIENDLY_深入神庙|r
.isOnQuest 3446
.dungeon ST
step 
>>点击|cRXP_PICK_哈卡神像|r
>>|cRXP_WARN_点击平台上所有的|cRXP_PICK_阿塔莱塑像|r将激活 |cRXP_PICK_哈卡神像|r|r
>>|cRXP_WARN_|cRXP_PICK_哈卡神像|r位于沉没的神庙底层|r
.turnin 3447 >>交任务: |cRXP_FRIENDLY_雕像群的秘密|r
.isOnQuest 3447
.dungeon ST
step 
#label Altar
>>点击|cRXP_PICK_哈卡祭坛|r
>>|cRXP_WARN_|cRXP_PICK_哈卡祭坛|r位于沉没的神庙底层|r
.turnin 3446 >>交任务: |cRXP_FRIENDLY_深入神庙|r
.isOnQuest 3446
.dungeon ST
step << Druid
#phase 4-6
>>击杀|cRXP_ENEMY_Atal'alarion|r. 击败他后搜刮|cRXP_LOOT_腐烂藤蔓|r
>>|cRXP_ENEMY_阿塔拉里昂|r|cRXP_WARN_位于沉没的神庙下层, 通过点击平台上的所有 |cRXP_PICK_阿塔莱塑像|r来召唤|r
.complete 9053,1 
.isOnQuest 9053
.dungeon ST
step << Shaman/Warrior/Warlock
#phase 4-6
>>击杀|cRXP_ENEMY_加什尔|r和|cRXP_ENEMY_扎尔洛|r. 击败后搜刮他们的|cRXP_LOOT_琥珀巫毒羽毛|r
>>击杀|cRXP_ENEMY_米杉|r和|cRXP_ENEMY_胡库|r. 击败他们后拾取其掉落的|cRXP_LOOT_蓝色巫毒羽毛|r
>>击杀|cRXP_ENEMY_祖罗|r和|cRXP_ENEMY_洛若尔|r. 击败他们后拾取其掉落的|cRXP_LOOT_绿色巫毒羽毛|r
>>|cRXP_WARN_此任务在沉没神庙的上层完成|r
.complete 8413,1 << Shaman 
.complete 8413,2 << Shaman 
.complete 8413,3 << Shaman 
.complete 8425,1 << Warrior 
.complete 8425,2 << Warrior 
.complete 8425,3 << Warrior 
.complete 8422,1 << Warlock 
.complete 8422,2 << Warlock 
.complete 8422,3 << Warlock 
.isOnQuest 8413 << Shaman
.isOnQuest 8425 << Warrior
.isOnQuest 8422 << Warlock
.dungeon ST
step
>>|cRXP_WARN_使用|r|T132834:0|t[哈卡之卵]|cRXP_WARN_, 在靠近龙刃者骷髅时触发, 然后完成事件|r
>>击杀|cRXP_ENEMY_哈卡|r的爪牙, 直到|cRXP_ENEMY_哈卡的化身|r出现
>>击杀|cRXP_ENEMY_哈卡的化身|r. 击败后拾取, 获得 |T136148:0|t[|cRXP_LOOT_哈卡精华|r]
>>|cRXP_WARN_使用|r|T136148:0|t[|cRXP_LOOT_哈卡精华|r]|cRXP_WARN_填充至|r|T132834:0|t[哈卡之卵]
.collect 10663,1,3528,1 
.disablecheckbox
.complete 3528,1 
.use 10465 
.use 10663 
.isOnQuest 3528
.dungeon ST
step
>>杀死 |cRXP_ENEMY_先知贾玛兰|r。掠夺他的 |cRXP_LOOT_Head|r
>>|cRXP_WARN_你必须杀死上层平台上的 6 个 |cRXP_ENEMY_巨魔|r 才能进入|r |cRXP_ENEMY_预言者迦玛兰|r
.complete 1446,1 
.isOnQuest 1446
.dungeon ST
step << Hunter/Mage/Priest/Rogue
#phase 4-6
>>击杀|cRXP_ENEMY_摩弗拉斯|r. 击败后拾取其掉落的|cRXP_LOOT_摩弗拉斯之牙|r << Hunter
>>击杀|cRXP_ENEMY_摩弗拉斯|r. 击败后拾取掉落的|cRXP_LOOT_奥术碎片|r << Mage
>>击杀|cRXP_ENEMY_摩弗拉斯|r. 击败后掠夺其掉落的|cRXP_LOOT_摩弗拉斯之血|r << Priest
>>击杀|cRXP_ENEMY_摩弗拉斯|r. 击败后拾取|cRXP_LOOT_碧蓝钥匙|r << Rogue
.complete 8232,1 << Hunter 
.complete 8253,1 << Mage 
.complete 8257,1 << Priest 
.complete 8236,1 << Rogue 
.isOnQuest 8232 << Hunter
.isOnQuest 8253 << Mage
.isOnQuest 8257 << Priest
.isOnQuest 8236 << Rogue
.dungeon ST
step
>>击杀|cRXP_ENEMY_伊兰尼库斯的阴影|r. 击败他后可获得 |T135229:0|t[|cRXP_LOOT_伊兰尼库斯精华|r]
>>|cRXP_WARN_使用 |T135229:0|t[|cRXP_LOOT_伊兰尼库斯精华|r] 开始任务|r
>>|cRXP_WARN_在与伊兰尼库斯的阴影交战前, 请确保已击杀上层所有龙类怪物, 否则它们都会被激活并对你产生仇恨|r
.collect 10454,1,3373,1 
.accept 3373 >>接任务: |cRXP_WARN_伊兰尼库斯精华|r
.dungeon ST
step
>>点击|cRXP_PICK_精华之泉|r
.turnin 3373 >>交任务: |cRXP_FRIENDLY_伊兰尼库斯精华|r
.isOnQuest 3373
.dungeon ST
step
.zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
.dungeon ST
step
.goto Swamp of Sorrows,47.93,54.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fel'zerul|r交谈
.turnin 1445 >>交任务: |cRXP_FRIENDLY_阿塔哈卡神庙|r
.isQuestComplete 1445
.dungeon ST
step << Warrior
#phase 4-6
.goto Swamp of Sorrows,34.287,66.134
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
>>|cRXP_WARN_强烈建议您选择|r|T132788:0|t[|cFF0070FF钻石水瓶|r] |cRXP_WARN_作为您的奖励. 尽管其他奖励也很优秀, 但您将再也无法获得|r|T132788:0|t[|cFF0070FF钻石水瓶|r]
.turnin 8425 >>交任务: |cRXP_FRIENDLY_巫毒羽毛|r
.target Fallen Hero of the Horde
.isQuestComplete 842
.dungeon ST
step
.hs >>传送至陶拉祖营地
.subzone 378 >>抵达陶拉若营地
.use 6948
.dungeon ST
step
#completewith next
.goto The Barrens,44.45,59.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
.fly Un'Goro Crater>>飞往安戈洛环形山
.target Omusa Thunderhorn
.subzoneskip 378,1
.isQuestComplete 4146
.dungeon ST
step
.goto Un'Goro Crater,45.53,8.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉瑞安|r交谈
.turnin 4146 >>交任务: |cRXP_FRIENDLY_除草器的燃料|r
.target Larion
.isQuestComplete 4146
.dungeon ST
step << Druid
#phase 4-6
#completewith next
.goto The Barrens,44.45,59.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
.fly Un'Goro Crater>>飞往安戈洛环形山
.target Omusa Thunderhorn
.subzoneskip 378,1
.isQuestComplete 9053
.dungeon ST
step << Druid
#phase 4-6
.goto Un'Goro Crater,71.639,75.960
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔瓦·寻路者|r交谈
.turnin 9053 >>交任务: |cRXP_FRIENDLY_更好的材料|r
.target Torwa Pathfinder
.isQuestComplete 9053
.dungeon ST
step
.goto The Barrens,44.45,59.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
.fly Tanaris >>飞往塔纳利斯
.target Omusa Thunderhorn
.subzoneskip 378,1
.isQuestComplete 3528
.dungeon ST
step
#completewith next
.goto Un'Goro Crater,45.23,5.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱菲|r交谈
.fly Tanaris >>飞往塔纳利斯
.target Gryfe
.zoneskip Un'Goro Crater,1
.isQuestComplete 3528
.dungeon ST
step
.goto Tanaris,66.989,22.354
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Yeh'kinya|r交谈
.turnin 3528 >>交任务: |cRXP_FRIENDLY_神灵哈卡|r
.target Yeh'kinya
.isQuestComplete 3528
.dungeon ST
step
#completewith JedigaTurnins1
.goto Un'Goro Crater,45.23,5.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱菲|r交谈
.fly Azshara >>飞往艾萨拉
.target Gryfe
.zoneskip Un'Goro Crater,1
.dungeon ST
step
#completewith JedigaTurnins1
.goto Tanaris,51.60,25.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Azshara >>飞往艾萨拉
.target Bulkrek Ragefist
.zoneskip Tanaris,1
.dungeon ST
step
#completewith JedigaTurnins1
.goto The Barrens,44.45,59.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
.fly Azshara >>飞往艾萨拉
.target Omusa Thunderhorn
.subzoneskip 378,1
.dungeon ST
step
#completewith JedigaTurnins1
.goto The Barrens,63.08,37.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
.fly Azshara >>飞往艾萨拉
.target Bragok
.dungeon !ST
step
.goto Azshara,22.50,51.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰迪加|r交谈
.turnin 3562 >>交任务: |cRXP_FRIENDLY_玛加萨的报酬|r
.target Jediga
step
.goto Azshara,22.50,51.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰迪加|r交谈
.turnin 3563 >>交任务: |cRXP_FRIENDLY_杰斯雷蒙的报酬|r
.target Jediga
step
#label JedigaTurnins1
.goto Azshara,22.50,51.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰迪加|r交谈
.accept 3542 >>接任务: |cRXP_WARN_安德隆·甘特的石版|r
.target Jediga
step << Hunter/Priest
#phase 4-6
.goto Azshara,42.400,42.619
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥汀克|r交谈
.turnin 8232 >>交任务: |cRXP_FRIENDLY_神庙中的绿龙|r << Hunter
.turnin 8257 >>交任务: |cRXP_FRIENDLY_摩弗拉斯之血|r << Priest
.target Ogtinc
.isQuestComplete 8232 << Hunter
.isQuestComplete 8257 << Priest
.dungeon ST
step << Mage/Rogue
#phase 4-6
#completewith next
.goto Azshara,28.113,50.088
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳斯|r交谈
>>|cRXP_WARN_这会将你传送到山顶|r
.turnin 3503 >>交任务: |cRXP_FRIENDLY_见到主人|r
.target Sanath Lim-yo
.isQuestComplete 8253 << Mage
.isQuestComplete 8236 << Rogue
.dungeon ST
step << Mage/Rogue
#phase 4-6
.goto Azshara,29.248,40.210
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|cRXP_FRIENDLY_大法师克希雷姆|r交谈
.turnin 8253 >>交任务: |cRXP_FRIENDLY_毁灭摩弗拉斯|r << Mage
.turnin 8236 >>交任务: |cRXP_FRIENDLY_碧蓝钥匙|r << Rogue
.target Archmage Xylem
.dungeon ST
.isQuestComplete 8253 << Mage
.isQuestComplete 8236 << Rogue
step << Mage/Rogue
#phase 4-6
#completewith next
.goto Azshara,26.466,46.271
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼瑞尔|r交谈
>>|cRXP_WARN_这会将你传送到下方|r
.turnin 3421 >>交任务: |cRXP_FRIENDLY_回程|r
.timer 8,Return Trip RP
.target Nyrill
.dungeon ST
.isQuestTurnedIn 8253 << Mage
.isQuestTurnedIn 8236 << Rogue
step
.goto Azshara,22.00,49.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克隆姆|r交谈
.fly Felwood>>飞往费伍德森林
.target Kroum
.zoneskip Felwood
step
.goto Felwood,34.30,52.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温娜|r交谈
.accept 4506 >>接任务: |cRXP_WARN_被腐蚀的猫|r
.target Winna Hazzard
step
.goto Felwood,34.80,52.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Trull|r交谈
.accept 4521 >>接任务: |cRXP_WARN_冬泉谷的枭兽|r
.target Trull Failbane
step << Warlock
#phase 4-6
.goto Felwood,41.52,44.99
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊普斯|r交谈
.turnin 8422 >>交任务: |cRXP_FRIENDLY_巨魔的羽毛|r
.target Impsy
.isQuestComplete 8422
.dungeon ST
step
#completewith next
>>拾取费伍德森林任意怪物掉落的|cRXP_LOOT_被污染的灵魂碎片|r
>>|cRXP_WARN_一路向南刷怪, 直到你获得6个|r
.collect 11515,6,5882,1 
.itemcount 11511,1 
step
#completewith next
.subzone 2479 >>前往翡翠圣所
step
.goto Felwood,51.20,82.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷塔·苔蹄|r交谈
.turnin 5159 >>交任务: |cRXP_FRIENDLY_净化过的水|r
.target Greta Mosshoof
step
.goto Felwood,51.20,82.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷塔·苔蹄|r交谈
.accept 5165 >>接任务: |cRXP_LOOT_熄灭火焰|r
.target Greta Mosshoof
.group
step
.goto Felwood,46.60,83.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅贝丝·河风|r交谈
>>|cRXP_WARN_交还你的 6|r|T132884:0|t[|cRXP_LOOT_被污染的灵魂碎片|r] |cRXP_WARN_你需要获得 2|r|T132804:0|t[|cRXP_LOOT_塞纳里奥植物药膏|r]
>>如果你没有6个, 就去南方找|cRXP_ENEMY_熊怪|r获取
.collect 11515,6,5887,1 
.accept 5887 >>接任务: |cRXP_LOOT_狩猎换药膏|r
.turnin 5887 >>交任务: |cRXP_FRIENDLY_狩猎换药膏|r
.target Maybess Riverbreeze
.zoneskip Felwood,1
.mob Deadwood Warrior
.mob Deadwood Pathfinder
.mob Deadwood Gardener
step
#completewith next
#icon |T135934:0|t
.goto Felwood,55.808,10.438,0
.goto Felwood,50.575,13.918,0
.goto Felwood,63.336,22.610,0
.goto Felwood,40.142,44.353,0
.goto Felwood,40.142,56.523,0
.goto Felwood,48.260,75.650,0
.goto Felwood,45.942,85.219,0
.goto Felwood,52.893,87.825,0
.aura 15366 >>|cRXP_WARN_寻找一朵|r|cRXP_PICK_被腐化的轻歌花|r. 点击它以净化. 再点击|r|cRXP_PICK_净化过的轻歌花|r, 即可获得持续一小时的|r|T135934:0|t[轻歌花奏鸣曲] |cRXP_WARN_buff|r
>>|cRXP_WARN_它们的位置已标记在你的地图上. 如果无法找到其中任何一个, 请跳过此步骤|r
.itemcount 11516,2 
step
#label Kitten
.goto Felwood,36.02,66.99,70,0
.goto Felwood,32.40,66.60
.cast 15647 >>|cRXP_WARN_使用|r|T132599:0|t[温娜的小猫载体]|cRXP_WARN_在在科斯特拉斯遗迹的腐化月井处|r
.use 12565
.isOnQuest 4506
step
#optional
#completewith next
#icon |T135934:0|t
.goto Felwood,55.808,10.438,0
.goto Felwood,50.575,13.918,0
.goto Felwood,63.336,22.610,0
.goto Felwood,40.142,44.353,0
.goto Felwood,40.142,56.523,0
.goto Felwood,48.260,75.650,0
.goto Felwood,45.942,85.219,0
.goto Felwood,52.893,87.825,0
.aura 15366 >>|cRXP_WARN_寻找一朵|r|cRXP_PICK_被腐化的轻歌花|r. 点击它以净化. 再点击|r|cRXP_PICK_净化过的轻歌花|r, 即可获得持续一小时的|r|T135934:0|t[轻歌花奏鸣曲] |cRXP_WARN_buff|r
>>|cRXP_WARN_它们的位置已标记在你的地图上. 如果无法找到其中任何一个, 请跳过此步骤|r
.itemcount 11516,2 
.group
step
#label EnterShadowH
.goto Felwood,35.367,58.376
.subzone 1770 >>前往加德纳尔内的暗影要塞
.group
step
#completewith next
>>点击地面上的四个火盆|cRXP_PICK_Braziers|r
.complete 5165,1 
.goto Felwood,36.267,56.297
.complete 5165,4 
.goto Felwood,36.484,55.183
.complete 5165,3 
.goto Felwood,36.732,53.262
.complete 5165,2 
.goto Felwood,37.677,52.685
.group 2
step
>>击杀加德纳尔执行者和加德纳尔暗法师和加德纳尔术士和加德纳尔军团士兵. 击败他们后可获得 |T134235:0|t[|cRXP_LOOT_血红钥匙|r]
>>|cRXP_WARN_使用|r|T134235:0|t[|cRXP_LOOT_血红钥匙|r]|cRXP_WARN_开始任务|r
>>|cRXP_WARN_这将开启一个护送任务. 即使你仍需熄灭火盆, 也请开始护送|r
.collect 13140,1,5202 
.accept 5202 >>接任务: |cRXP_LOOT_奇怪的红钥匙|r
.use 13140 
.mob Jaedenar Enforcer
.mob Jaedenar Darkweaver
.mob Jaedenar Warlock
.mob Jaedenar Legionnaire
.group 2
step
#label eStart
.goto Felwood,36.207,55.465
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_被俘虏的阿科纳林|r交谈
.turnin 5202 >>交任务: |cRXP_FRIENDLY_奇怪的红钥匙|r
.accept 5203,1 >>接任务: |cRXP_LOOT_逃出加德纳尔|r
.target Captured Arko'narin
.group 2
step
#completewith next
>>点击地面上的四个火盆|cRXP_PICK_Braziers|r
.complete 5165,1 
.goto Felwood,36.267,56.297
.complete 5165,4 
.goto Felwood,36.484,55.183
.complete 5165,3 
.goto Felwood,36.732,53.262
.complete 5165,2 
.goto Felwood,37.677,52.685
.group 2
step
.goto Felwood,35.44,59.01
>>护送|cRXP_FRIENDLY_Arko'narin|r穿过暗影堡垒. 当|cRXP_FRIENDLY_Arko'narin|r装备好护甲后, 击杀出现的 3 名恶魔守卫 |cRXP_ENEMY_Felguard|r
>>|cRXP_FRIENDLY_Arko'narin|r|cRXP_WARN_拥有6,000点生命值；让她吸引怪物仇恨. 在向入口推进的过程中, 清除暗影堡内的火盆|r
>>一旦|cRXP_FRIENDLY_Arko'narin|r离开洞穴, |cRXP_ENEMY_特雷·莱弗治的灵魂|r便会现身. 击杀他
>>|cRXP_WARN_注意小怪. 他有500点伤害的冲击法术, 攻击非常猛烈. 如果有进攻类冷却技能, 请在此处全部使用|r
.complete 5203,1 
.target Arko'narin
.group 2
step
>>点击地面上的四个火盆|cRXP_PICK_Braziers|r
.complete 5165,1 
.goto Felwood,36.267,56.297
.complete 5165,4 
.goto Felwood,36.484,55.183
.complete 5165,3 
.goto Felwood,36.732,53.262
.complete 5165,2 
.goto Felwood,37.677,52.685
.group 2
step
#completewith next
.goto Felwood,37.37,49.83,40,0
.goto Felwood,35.45,50.10,40,0
.goto Felwood,34.57,52.12
.subzone 1997 >>前往血毒哨所
step
#completewith next
>>|cRXP_WARN_与|r|cRXP_FRIENDLY_被腐蚀的刃豹|r|cRXP_WARN_互动, 当你站在|r|cRXP_FRIENDLY_温娜·哈萨德|r旁边时|r
.complete 4506,1 
.skipgossip
.target Corrupted Saber
step
.goto Felwood,34.20,52.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t接近|cRXP_FRIENDLY_Winna|r. 先与|cRXP_FRIENDLY_被腐蚀的刃豹|r交谈, 然后再与|cRXP_FRIENDLY_Winna|r交谈
.turnin 4506 >>交任务: |cRXP_FRIENDLY_被腐蚀的猫|r
.target Winna Hazzard
step
#completewith next
.goto Felwood,64.70,8.10,70 >>前往木喉要塞入口
step
.goto Felwood,64.70,8.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳菲恩|r交谈
.accept 8461 >>接任务: |cRXP_LOOT_北方的死木熊怪|r
.target Nafien
step
#completewith next
.goto Felwood,62.68,8.06,0
>>击杀|cRXP_ENEMY_死木守卫|r和|cRXP_ENEMY_死木复仇者|r和|cRXP_ENEMY_死木萨满祭司|r
>>|cRXP_WARN_击杀|r|cRXP_ENEMY_死木复仇者|r|cRXP_WARN_first. 如果你同时拉怪, 当附近有熊怪死亡时它会进入狂怒状态|r
.complete 8461,1 
.mob +Deadwood Den Watcher
.complete 8461,2 
.mob +Deadwood Shaman
.complete 8461,3 
.mob +Deadwood Avenger
step
.goto Felwood,60.20,5.90
>>点击|cRXP_PICK_死木蒸锅|r
>>|cRXP_WARN_小心, |r|cRXP_PICK_死木蒸锅|r|cRXP_WARN_被5只|r|cRXP_ENEMY_死木熊怪守护|c|r
>>|cRXP_WARN_这是一个瞬发法术. 在交完任务后, 你可以逃离|r|cRXP_ENEMY_Deadwood 死木熊怪|r|r
.turnin 5084 >>交任务: |cRXP_FRIENDLY_堕落熊怪|r
.accept 5085 >>接任务: |cRXP_LOOT_神秘的粘液|r
step
.goto Felwood,63.19,13.01,0
.goto Felwood,61.67,7.23,50,0
.goto Felwood,62.68,8.39,50,0
.goto Felwood,62.55,10.49,50,0
.goto Felwood,63.19,13.01,50,0
>>击杀|cRXP_ENEMY_死木守卫|r和|cRXP_ENEMY_死木复仇者|r和|cRXP_ENEMY_死木萨满祭司|r
>>|cRXP_WARN_击杀|r|cRXP_ENEMY_死木复仇者|r|cRXP_WARN_first. 如果你同时拉怪, 当附近有熊怪死亡时它会进入狂怒状态|r
.complete 8461,1 
.mob +Deadwood Den Watcher
.complete 8461,2 
.mob +Deadwood Shaman
.complete 8461,3 
.mob +Deadwood Avenger
step
.goto Felwood,64.70,8.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳菲恩|r交谈
.turnin 8461 >>交任务: |cRXP_FRIENDLY_北方的死木熊怪|r
.accept 8465 >>接任务: |cRXP_LOOT_与萨尔法交谈|r
.target Nafien
step
#completewith next
.goto Felwood,65.16,7.88,40,0
.goto Felwood,64.67,3.14,40,0
.goto Felwood,66.40,2.95,40,0
.goto Felwood,68.24,5.60,40,0
.goto Felwood,68.73,6.38
.zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
step
.goto Winterspring,27.736,34.499
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔法|r交谈
.turnin 8465 >>交任务: |cRXP_FRIENDLY_与萨尔法交谈|r
.accept 8464 >>接任务: |cRXP_WARN_冬泉熊怪的活动|r
.target Salfa
step
#softcoreserver
.goto Winterspring,31.30,45.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donova|r交谈
>>|cRXP_WARN_不要接受后续任务“墓地相见”|r
.turnin 980 >>交任务: |cRXP_FRIENDLY_新的泉水|r
.accept 4842 >>接任务: |cRXP_LOOT_奇怪的源头|r
.turnin 3909 >>交任务: |cRXP_FRIENDLY_视灵药剂|r 
.turnin 5085 >>交任务: |cRXP_FRIENDLY_神秘的粘液|r
.accept 5086 >>接任务: |cRXP_LOOT_剧毒之水|r
.target Donova Snowden
.isQuestComplete 3909
step
#softcoreserver
.goto Winterspring,31.30,45.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donova|r交谈
.turnin 980 >>交任务: |cRXP_FRIENDLY_新的泉水|r
.accept 4842 >>接任务: |cRXP_LOOT_奇怪的源头|r
.turnin 5085 >>交任务: |cRXP_FRIENDLY_神秘的粘液|r
.accept 5086 >>接任务: |cRXP_LOOT_剧毒之水|r
.target Donova Snowden
step
#hardcoreserver
.goto Winterspring,31.30,45.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donova|r交谈
>>|cRXP_WARN_暴雪已调整了[视灵药剂]的任务链, 使其在官方硬核服务器上不会再导致玩家死亡|r
.turnin 980 >>交任务: |cRXP_FRIENDLY_新的泉水|r
.accept 4842 >>接任务: |cRXP_LOOT_奇怪的源头|r
.turnin 3909 >>交任务: |cRXP_FRIENDLY_视灵药剂|r 
.accept 3912 >>接任务: |cRXP_WARN_墓地相见|r 
.turnin 5085 >>交任务: |cRXP_FRIENDLY_神秘的粘液|r
.accept 5086 >>接任务: |cRXP_LOOT_剧毒之水|r
.target Donova Snowden
.isQuestComplete 3909
step
#hardcoreserver
.goto Winterspring,31.30,45.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donova|r交谈
.turnin 980 >>交任务: |cRXP_FRIENDLY_新的泉水|r
.accept 4842 >>接任务: |cRXP_LOOT_奇怪的源头|r
.turnin 5085 >>交任务: |cRXP_FRIENDLY_神秘的粘液|r
.accept 5086 >>接任务: |cRXP_LOOT_剧毒之水|r
.target Donova Snowden
step
#completewith WSYetis
>>在前往永望镇的路上, 击杀|cRXP_ENEMY_蓬毛枭兽|r
.complete 4521,2 
.mob Ragged Owlbeast
step
.goto Winterspring,61.36,38.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vizzie|r交谈
.home >>将你的[炉石]设置为永望镇
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Vizzie
step
#label WSYetis
.goto Winterspring,60.88,37.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌米|r交谈
.accept 3783 >>接任务: |cRXP_LOOT_雪怪计划！|r
.target Umi Rumplesnicker
step
#label Ursius
.goto Winterspring,61.93,38.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Storm|r交谈
.accept 5054 >>接任务: |cRXP_LOOT_碎齿熊尤西乌斯|r
.target Storm Shadowhoof
.group
step
#loop
.goto Winterspring,54.39,37.32,0
.goto Winterspring,47.46,36.84,0
.goto Winterspring,38.47,38.19,0
.goto Winterspring,45.14,42.46,0
.goto Winterspring,54.39,37.32,80,0
.goto Winterspring,48.13,34.60,80,0
.goto Winterspring,47.46,36.84,80,0
.goto Winterspring,44.39,37.72,80,0
.goto Winterspring,42.23,37.52,80,0
.goto Winterspring,38.47,38.19,80,0
.goto Winterspring,37.08,41.15,80,0
.goto Winterspring,45.14,42.46,80,0
>>击杀永望镇西边的蓬毛枭兽|r
.complete 4521,2 
.mob Ragged Owlbeast
step
#completewith ROwlbeasts
>>击杀所有类型的|r冰蓟雪人|r. 击杀它们获取|r毛皮|r作为战利品
>>|cRXP_WARN_不要关注这个；你可以稍后再完成|r
.complete 3783,1 
.mob Rogue Ice Thistle
.mob Ice Thistle Yeti
.mob Ice Thistle Patriarch
.mob Ice Thistle Matriarch
step
#completewith next
.goto Winterspring,60.67,29.81,0
.goto Winterspring,58.64,34.51,0
>>击杀|cRXP_ENEMY_狂怒的枭兽|r
.complete 4521,1 
.mob Raging Owlbeast
.group 0
step
#loop
.goto Winterspring,63.40,27.04,0
.goto Winterspring,56.62,32.34,70,0
.goto Winterspring,60.50,33.02,70,0
.goto Winterspring,62.55,30.83,70,0
.goto Winterspring,62.43,28.08,70,0
.goto Winterspring,63.40,27.04,70,0
>>击杀|cRXP_ENEMY_尤西乌斯|r. 如需, 可风筝他返回永望镇. 记得造成51%以上的伤害
>>|cRXP_WARN_请注意, 这个任务可能会比较困难|r
.complete 5054,1 
.unitscan Ursius
.group 2
step
#label ROwlbeasts
#loop
.goto Winterspring,60.58,29.76,0
.goto Winterspring,60.58,29.76,50,0
.goto Winterspring,58.82,27.41,70,0
.goto Winterspring,56.06,27.83,70,0
.goto Winterspring,55.97,30.25,70,0
.goto Winterspring,55.10,32.16,70,0
>>击杀|cRXP_ENEMY_狂怒的枭兽|r
.complete 4521,1 
.mob Raging Owlbeast
step
#loop
.goto Winterspring,66.50,41.70,0
.goto Winterspring,66.50,41.70,50,0
.goto Winterspring,64.90,40.20,50,0
.goto Winterspring,65.90,43.60,50,0
.goto Winterspring,66.20,45.80,50,0
.goto Winterspring,67.60,45.60,50,0
.goto Winterspring,67.60,43.80,50,0
.goto Winterspring,67.20,43.00,50,0
.goto Winterspring,67.60,41.90,50,0
.goto Winterspring,68.40,41.50,50,0
.goto Winterspring,69.00,41.30,50,0
.goto Winterspring,69.50,40.00,50,0
.goto Winterspring,69.80,41.80,50,0
.goto Winterspring,70.10,42.00,50,0
.goto Winterspring,70.30,40.80,50,0
.goto Winterspring,71.30,40.80,50,0
.goto Winterspring,71.80,39.80,50,0
.goto Winterspring,70.50,38.30,50,0
.goto Winterspring,71.80,39.80,50,0
.goto Winterspring,71.30,40.80,50,0
.goto Winterspring,70.30,40.80,50,0
.goto Winterspring,69.50,40.00,50,0
.goto Winterspring,69.00,41.30,50,0
.goto Winterspring,68.40,41.50,50,0
>>击杀所有类型的|r冰蓟雪人|r. 击杀它们获取|r毛皮|r作为战利品
.complete 3783,1 
.mob Rogue Ice Thistle
.mob Ice Thistle Yeti
.mob Ice Thistle Patriarch
.mob Ice Thistle Matriarch
step << Shaman
#completewith next
.hs >>炉石或星界传送回永望镇
step
.goto Winterspring,61.93,38.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Storm|r交谈
.turnin 5054 >>交任务: |cRXP_FRIENDLY_碎齿熊尤西乌斯|r
.accept 5055 >>接任务: |cRXP_LOOT_冰风奇美拉布鲁米兰|r
.target Storm Shadowhoof
.group
step
.goto Winterspring,60.88,37.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌米|r交谈
.turnin 3783 >>交任务: |cRXP_FRIENDLY_雪怪计划！|r
.target Umi Rumplesnicker
step
.goto Winterspring,61.36,38.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vizzie|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Vizzie
step
.goto Winterspring,60.47,36.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤格雷克|r交谈
.fly Felwood>>飞往费伍德森林
.target Yugrek
.zoneskip Felwood
step
.goto Felwood,34.70,52.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Trull|r交谈
.turnin 4521 >>交任务: |cRXP_FRIENDLY_冬泉谷的枭兽|r
.accept 4741 >>接任务: |cRXP_WARN_冬泉谷的枭兽|r
.target Trull Failbane
step 
#completewith next
.goto Felwood,34.42,53.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉卡尔|r交谈
.fly Tanaris>>飞往塔纳利斯
.target Brakkar
.zoneskip Tanaris
.isOnQuest 3912
step
#hardcoreserver
.isOnQuest 3912
#completewith next
.goto Tanaris,53.99,28.63
.cast 417627 >>|cRXP_WARN_在塔纳利斯墓地使用|r |T134813:0|t[视灵药剂] |r
>>|cRXP_WARN_暴雪已调整此任务, 因此在官方硬核服务器上使用该物品不会导致角色死亡, 但会将生命值降至3%. 请确保在离开墓地前进行包扎或进食|r
.use 11243 
step
#hardcoreserver
.isOnQuest 3912
.goto Tanaris,53.93,23.33
>>|cRXP_WARN_确保在离开墓地前包扎伤口或进食恢复|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加里杨|r交谈
>>|cRXP_WARN_你必须拥有 |T132331:0|t[濒死体验]debuff才能看到|r|cRXP_FRIENDLY_加里杨|r|cRXP_WARN_通过饮用|r|T134813:0|t[视灵药剂]
>>|cRXP_WARN_暴雪已调整此任务, 因此在官方硬核服务器上使用该物品不会导致角色死亡|r
.use 11243 
.turnin 3912 >>交任务: |cRXP_FRIENDLY_墓地相见|r
.accept 3913 >>接任务: |cRXP_WARN_寻找墓碑|r
.target Gaeriyan
step
#hardcoreserver
.isQuestTurnedIn 3912
.goto Tanaris,53.93,23.33
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加里杨|r交谈
>>|cRXP_WARN_你必须拥有 |T132331:0|t[濒死体验]debuff才能看到|r|cRXP_FRIENDLY_加里杨|r|cRXP_WARN_通过饮用|r|T134813:0|t[视灵药剂]
>>|cRXP_WARN_暴雪已调整此任务, 因此在官方硬核服务器上使用该物品不会导致角色死亡|r
.use 11243 
.accept 3913 >>接任务: |cRXP_WARN_寻找墓碑|r
.target Gaeriyan
step
#hardcoreserver
.isQuestTurnedIn 3912
.goto Tanaris,53.815,29.061
>>点击|cRXP_PICK_Conspicuous Gravestone|r
.turnin 3913 >>交任务: |cRXP_FRIENDLY_寻找墓碑|r
.accept 3914 >>接任务: |cRXP_WARN_林克的剑|r
step
#hardcoreserver
#completewith next
.destroy 11243 >>摧毁: |cRXP_ENEMY_视灵药剂|r
step
.isQuestTurnedIn 3912
.goto Tanaris,51.60,25.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Un'Goro Crater >>飞往安戈洛环形山
.target Bulkrek Ragefist
.zoneskip Tanaris,1
step
#hardcoreserver
.isQuestTurnedIn 3912
.goto Un'Goro Crater,44.658,8.098
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林克|r交谈
.turnin 3914 >>交任务: |cRXP_FRIENDLY_林克的剑|r
.accept 3941 >>接任务: |cRXP_WARN_侏儒的援助|r
.target Linken
step
#hardcoreserver
.isQuestTurnedIn 3912
.goto Un'Goro Crater,41.918,2.703
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_J.D. 科琳|r交谈
.turnin 3941 >>交任务: |cRXP_FRIENDLY_侏儒的援助|r
.timer 25,A Gnome's Assistance RP
.accept 3942 >>接任务: |cRXP_WARN_林克的记忆|r
.target J.D. Collie
step << Druid
#completewith DruidTraining9
.cast 18960 >>施放 |T135758:0|t[传送:月光林地]
.zoneskip Moonglade
step << Druid
#optional
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 9857 >>训练你的职业法术
.target Loganaar
.xp <54,1
.xp >56,1
step << Druid
#label DruidTraining9
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 22829 >>训练你的职业法术
.target Loganaar
.xp <56,1
step
#completewith next
.hs >>传送至冬泉谷
.use 6948
.zoneskip Winterspring
step
.goto Winterspring,61.36,38.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vizzie|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Vizzie
step
#loop
.goto Winterspring,58.8,63.5,0
.goto Winterspring,54.7,46.0,60,0
.goto Winterspring,56.6,52.4,60,0
.goto Winterspring,60.5,55.6,60,0
.goto Winterspring,62.4,58.9,60,0
.goto Winterspring,58.8,63.5,60,0
>>击杀|cRXP_ENEMY_布鲁米兰|r
.complete 5055,1 
.unitscan Brumeran
.group 3
step
#loop
.goto Winterspring,64.96,62.68,0
.goto Winterspring,63.49,59.25,70,0
.goto Winterspring,65.01,59.77,70,0
.goto Winterspring,65.30,61.06,70,0
.goto Winterspring,64.96,62.68,70,0
>>击杀|cRXP_ENEMY_月光枭兽|r
>>|cRXP_WARN_他们的月火伤害相当高, 而且他们的恢复能力也很强|r
.complete 4741,1 
.mob Moontouched Owlbeast
step
.goto Winterspring,60.09,73.34
>>前往暗语峡谷边境
.complete 4842,1 
step
#completewith next
.subzone 2255 >>前往永望镇
step
.goto Winterspring,61.93,38.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Storm|r交谈
.turnin 5055 >>交任务: |cRXP_FRIENDLY_冰风奇美拉布鲁米兰|r
.target Storm Shadowhoof
.group
step
.goto Winterspring,61.34,38.97
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷戈|r交谈
.accept 6029 >>接任务: |cRXP_LOOT_永望镇报告|r
.accept 6030 >>接任务: |cRXP_LOOT_尼古拉斯·瑟伦霍夫公爵|r
.accept 5601 >>接任务: |cRXP_LOOT_小妹妹帕米拉|r
.target Gregor Greystone
step
.goto Winterspring,60.47,36.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤格雷克|r交谈
.fly Felwood>>飞往费伍德森林
.target Yugrek
.zoneskip Felwood
step
.goto Felwood,34.70,52.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Trull|r交谈
.turnin 4741 >>交任务: |cRXP_FRIENDLY_冬泉谷的枭兽|r
.accept 4721 >>接任务: |cRXP_WARN_冬泉谷的枭兽|r
.target Trull Failbane
step
#completewith SilverHeartP
#icon |T135934:0|t
.goto Felwood,55.808,10.438,0
.goto Felwood,50.575,13.918,0
.goto Felwood,63.336,22.610,0
.goto Felwood,40.142,44.353,0
.goto Felwood,40.142,56.523,0
.goto Felwood,48.260,75.650,0
.goto Felwood,45.942,85.219,0
.goto Felwood,52.893,87.825,0
.aura 15366 >>|cRXP_WARN_寻找一朵|r|cRXP_PICK_被腐化的轻歌花|r. 点击它以净化. 再点击|r|cRXP_PICK_净化过的轻歌花|r, 即可获得持续一小时的|r|T135934:0|t[轻歌花奏鸣曲] |cRXP_WARN_buff|r
>>|cRXP_WARN_它们的位置已在你的地图上标记. 不必特意绕远去找其中一个|r
.itemcount 11516,2 
step
.goto Felwood,51.20,82.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷塔·苔蹄|r交谈
.turnin 5165 >>交任务: |cRXP_FRIENDLY_熄灭火焰|r
.accept 5242 >>接任务: |cRXP_LOOT_最终一击|r
.target Greta Mosshoof
.isQuestComplete 5165
.group
step
.goto Felwood,51.20,82.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷塔·苔蹄|r交谈
.accept 5242 >>接任务: |cRXP_LOOT_最终一击|r
.target Greta Mosshoof
.isQuestTurnedIn 5165
.group
step
.goto Felwood,51.30,82.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰希尔·月弓|r交谈
.turnin 5203 >>交任务: |cRXP_FRIENDLY_逃出加德纳尔|r
.accept 5204 >>接任务: |cRXP_LOOT_光明的惩戒|r
.target Jessir Moonbow
.isQuestComplete 5203
.group
step
.goto Felwood,51.30,82.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰希尔·月弓|r交谈
.accept 5204 >>接任务: |cRXP_LOOT_光明的惩戒|r
.target Jessir Moonbow
.isQuestTurnedIn 5203
.group
step
#hardcoreserver
#label SilverHeartP
.goto Felwood,51.350,81.511
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾瑞丹·蓝风|r交谈
.turnin 3942 >>交任务: |cRXP_FRIENDLY_林克的记忆|r 
.accept 4084 >>接任务: |cRXP_WARN_银爪铁心|r 
.target Eridan Bluewind
.isQuestTurnedIn 3912
step
#hardcoreserver
#completewith next
>>击杀|cRXP_ENEMY_怒爪熊|r和|cRXP_ENEMY_怒爪熊|r, 击败它们后拾取其|cRXP_LOOT_爪子|r
.complete 4084,1 
.mob Irontree Stomper
.mob Irontree Wanderer
.mob Angerclaw Mauler
.mob Angerclaw Grizzly
.mob Angerclaw Bear
.mob Felpaw Wolf
.mob Felpaw Scavenger
.mob Felpaw Ravager
.isQuestTurnedIn 3912
.group 0
step
#completewith ShadowLordFelidan
.goto Felwood,35.367,58.376
.subzone 1770 >>前往加德纳尔内的暗影要塞
.group
step
.goto Felwood,35.39,58.74,30,0
.goto Felwood,38.30,50.50
>>深入暗影堡垒深处, 然后击杀|cRXP_ENEMY_拉凯雅|r
.complete 5204,1 
.unitscan Rakaiah
.group 2
step
.goto Felwood,38.50,50.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特雷·莱弗治的残骸|r交谈
>>|cRXP_WARN_遗迹周围的怪物可能会因持续处于战斗状态而造成bug, 尽管它们并未实际攻击你|r
.turnin 5204 >>交任务: |cRXP_FRIENDLY_光明的惩戒|r
.accept 5385 >>接任务: |cRXP_LOOT_特雷·莱弗治的残骸|r
.target Remains of Trey Lightforge
.isQuestTurnedIn 5203
.group
step
#label ShadowLordFelidan
.goto Felwood,38.90,46.80
>>击杀|cRXP_ENEMY_暗影领主费尔丹|r和|cRXP_ENEMY_米莱恩|r和|cRXP_ENEMY_萨莉亚|r. 击败|cRXP_ENEMY_暗影领主费尔丹|r获取他的|cRXP_LOOT_头颅|r
>>|cRXP_WARN_在房间外徘徊, 利用视线(LOS)躲避费尔丹的暗影箭. 当他开始施法时, 立即躲到视线之外. 一旦他的施法结束或失败, 立刻进入视线范围, 让他重新开始施法, 或防止他靠近LOS点|r
.complete 5242,1 
.mob +Moora
.complete 5242,2 
.mob +Salia
.complete 5242,3 
.unitscan +Shadow Lord Felidan
.group 2
step << skip
#completewith next
.goto Felwood,38.72,46.77
.goto Felwood,49.57,30.76,30 >>执行登出跳过, 传送离开暗影要塞
.link https://youtu.be/SWBtPqm5M0Q?t=128 >>|cRXP_WARN_点击此处查看示例|r
.group
step
.goto Felwood,35.42,58.72,15 >>离开黑影之握
.isQuestComplete 5242
step
#hardcoreserver
#completewith ToxicHorrors
>>击杀|cRXP_ENEMY_怒爪熊|r和|cRXP_ENEMY_怒爪熊|r, 击败它们后拾取其|cRXP_LOOT_爪子|r
.complete 4084,1 
.mob Irontree Stomper
.mob Irontree Wanderer
.mob Angerclaw Mauler
.mob Angerclaw Grizzly
.mob Angerclaw Bear
.mob Felpaw Wolf
.mob Felpaw Scavenger
.mob Felpaw Ravager
.isQuestTurnedIn 3912
.group 0
step
#hardcoreserver
#loop
.goto Felwood,49.60,30.00,0
.goto Felwood,46.40,24.60,60,0
.goto Felwood,49.20,19.80,60,0
.goto Felwood,53.00,20.40,60,0
.goto Felwood,52.00,24.80,60,0
.goto Felwood,49.60,30.00,60,0
>>击杀|cRXP_ENEMY_树人|r. 击败它们可获得|cRXP_LOOT_铁树之心|r
.complete 4084,2 
.mob Irontree Stomper
.mob Irontree Wanderer
.isQuestTurnedIn 3912
step
#label ToxicHorrors
#loop
.goto Felwood,49.76,27.29,0
.goto Felwood,50.87,23.72,50,0
.goto Felwood,49.44,23.39,50,0
.goto Felwood,48.86,24.80,50,0
.goto Felwood,49.76,27.29,50,0
>>击杀 |cRXP_ENEMY_剧毒之水|r. 击败它们, 搜刮其掉落的 |cRXP_LOOT_滴液|r
.complete 5086,1 
.mob Toxic Horror
step
#hardcoreserver
#loop
.goto Felwood,63.27,19.15,0
.goto Felwood,53.75,28.06,90,0
.goto Felwood,58.03,17.83,90,0
.goto Felwood,63.27,19.15,90,0
>>击杀|cRXP_ENEMY_怒爪熊|r和|cRXP_ENEMY_怒爪熊|r, 击败它们后拾取其|cRXP_LOOT_爪子|r
.complete 4084,1 
.mob Angerclaw Mauler
.mob Angerclaw Grizzly
.mob Angerclaw Bear
.mob Felpaw Wolf
.mob Felpaw Scavenger
.mob Felpaw Ravager
.isQuestTurnedIn 3912
step
#optional
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳菲恩|r交谈
>>|cRXP_WARN_如果你拥有超过5个|r|T132926:0|t[死木头饰羽毛]|cRXP_WARN_, 可以将它们上交以提升与木喉要塞的声望|r
.dailyturnin 8467 >>提交给纳菲恩的羽毛
.itemcount 21377,>5 
.target Nafien
step
#label LeaveFelwood
#completewith next
.goto Felwood,65.16,7.88,40,0
.goto Felwood,64.67,3.14,40,0
.goto Felwood,66.40,2.95,40,0
.goto Felwood,68.24,5.60,40,0
.goto Felwood,68.73,6.38
.zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
step
.goto Winterspring,31.30,45.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donova|r交谈
.turnin 4842 >>交任务: |cRXP_FRIENDLY_奇怪的源头|r
.turnin 5086 >>交任务: |cRXP_FRIENDLY_剧毒之水|r
.accept 5087 >>接任务: |cRXP_LOOT_冬泉信使|r
.target Donova Snowden
step
#loop
.goto Winterspring,28.01,34.60,0
.goto Winterspring,67.96,37.54,40,0
.goto Winterspring,66.16,33.66,40,0
.goto Winterspring,64.37,32.06,40,0
.goto Winterspring,62.41,25.53,40,0
.goto Winterspring,61.97,23.00,40,0
.goto Winterspring,57.30,28.05,40,0
.goto Winterspring,54.07,30.98,40,0
.goto Winterspring,53.49,34.13,40,0
.goto Winterspring,47.81,39.23,40,0
.goto Winterspring,39.36,41.28,40,0
.goto Winterspring,30.12,42.57,40,0
.goto Winterspring,28.01,34.60,40,0
>>击杀|cRXP_ENEMY_冬泉信使|r
>>|cRXP_WARN_他们巡逻于木喉要塞隧道与位于永望镇东北方向的冬泉村之间的道路上. 或者, 穿过洞穴返回费伍德森林, 击杀位于邪爪村大锅旁的逃亡者|r
.complete 5087,1 
.unitscan Winterfall Runner
.zoneskip Felwood
step
.goto Felwood,60.20,5.90
>>击杀|cRXP_ENEMY_冬泉信使|r
>>|cRXP_WARN_跑者位于费尔帕村西北部的熔炉处|r
.complete 5087,1 
.unitscan Winterfall Runner
step
.goto Winterspring,31.30,45.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donova|r交谈
.turnin 5087 >>交任务: |cRXP_FRIENDLY_冬泉信使|r
.target Donova Snowden
step
.goto Winterspring,31.30,45.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donova|r交谈
.accept 5121 >>接任务: |cRXP_LOOT_冬泉酋长|r
.target Donova Snowden
.group
step << !Mage
.goto Winterspring,60.47,36.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤格雷克|r交谈
.fly Felwood>>飞往费伍德森林
.target Yugrek
.zoneskip Felwood
step << Mage
#completewith next
.cast 3567 >>施放 |T135759:0|t[传送:奥格瑞玛]
.zoneskip Orgrimmar
step << Mage
.goto Orgrimmar,45.13,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Splintertree Post >>飞往裂枝岗哨
.target Doras
.zoneskip Ashenvale
step
#completewith next
.subzone 2479 >>前往翡翠圣所
step
#hardcoreserver
.goto Felwood,51.35,81.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾瑞丹|r交谈
.turnin 4084 >>交任务: |cRXP_FRIENDLY_银爪铁心|r 
.target Eridan Bluewind
.isQuestTurnedIn 3912
step
.goto Felwood,51.23,82.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷塔·苔蹄|r交谈
.turnin 5242 >>交任务: |cRXP_FRIENDLY_最终一击|r
.target Greta Mosshoof
.isQuestComplete 5242
.group
step
.goto Felwood,51.35,82.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰希尔·月弓|r交谈
.turnin 5385 >>交任务: |cRXP_FRIENDLY_特雷·莱弗治的残骸|r
.target Jessir Moonbow
.isQuestTurnedIn 5204
.group
step << !Mage
#completewith next
.subzone 431 >>前往裂树岗哨
step << !Mage
.goto Ashenvale,73.18,61.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔格拉|r交谈
.fly Orgrimmar>>飞往奥格瑞玛
.target Vhulgra
.zoneskip Orgrimmar
step << Mage
.cast 3567 >>施放 |T135759:0|t[传送:奥格瑞玛]
.zoneskip Orgrimmar
.isQuestComplete 4300
step << Mage
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 10157 >>训练你的职业法术
.target Pephredo
.xp <56,1
.xp >58,1
.isQuestComplete 4300
step << Mage
#optional
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 10054 >>训练你的职业法术
.target Pephredo
.xp <58,1
.isQuestComplete 4300
step << Priest
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 10929 >>训练你的职业法术
.target Ur'kyo
.xp <56,1
.xp >58,1
step << Priest
#optional
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 10947 >>训练你的职业法术
.target Ur'kyo
.xp <58,1
step << Shaman
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 10432 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <56,1
.xp >58,1
step << Shaman
#optional
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 10473 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <58,1
step << Warrior
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 20662 >>训练你的职业法术
.target Grezz Ragefist
.xp <56,1
.xp >58,1
step << Warrior
#optional
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 11597 >>训练你的职业法术
.target Grezz Ragefist
.xp <58,1
step << Warlock
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 11689 >>训练你的职业法术
.target Mirket
.xp <56,1
.xp >58,1
step << Warlock
#optional
.goto Orgrimmar,48.62,46.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
.train 11713 >>训练你的职业法术
.target Mirket
.xp <58,1
step << Warlock
.goto Orgrimmar,47.55,46.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈
.vendor >>提升宠物的技能
.target Kurgul
step << Rogue
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 11300 >>训练你的职业法术
.target Ormok
.xp <56,1
.xp >58,1
step << Rogue
#optional
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 11305 >>训练你的职业法术
.target Ormok
.xp <58,1
step << Rogue
.goto Orgrimmar,42.09,49.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷库尔|r交谈
.vendor >>|cRXP_BUY_储备闪光粉和毒药|r
.target Rekkul
step << Hunter
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14305 >>训练你的职业法术
.target Ormak Grimshot
.xp <56,1
.xp >58,1
step << Hunter
#optional
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14322 >>训练你的职业法术
.target Ormak Grimshot
.xp <58,1
step
.goto Orgrimmar,55.60,34.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jes'rimon|r交谈
.turnin 4300 >>交任务: |cRXP_FRIENDLY_骨刃武器|r
.target Jes'rimon
.isQuestComplete 4300
step
.goto Orgrimmar,49.57,69.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁斯|r交谈
.bankwithdraw 8529 >>如果你有|T134863:0|t[诺格弗格药剂], 请从银行提取. 建议背包中至少保留40个, 以便在EPL中进行山地跳跃时使用
>>|cRXP_WARN_或者, |r|T132917:0|t[轻羽毛] |cRXP_WARN_同样适用于|r|T135992:0|t[减速坠落] << Mage
.target Karus
step << Mage
.cast 3563 >>传送 |T135766:0|t[传送:幽暗城]
.zoneskip Undercity
step << Mage
.goto Undercity,85.15,10.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
.train 10157 >>训练你的职业法术
.target Anastasia Hartwell
.xp <56,1
.xp >58,1
step << Mage
#optional
.goto Undercity,85.15,10.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
.train 10054 >>训练你的职业法术
.target Anastasia Hartwell
.xp <58,1
step << Mage
.goto Undercity,82.79,15.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉娜·阿克雷|r交谈
.vendor >>|cRXP_BUY_至少购买两个|r|T134419:0|t[传送符文]
.collect 17031,2 
.target Hannah Akeley
step << !Mage
#completewith next
.zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
.zoneskip Durotar
step << !Mage
.goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
.zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
.zoneskip Tirisfal Glades
step << Shaman
#phase 4-6
#completewith next
.goto Undercity,63.27,48.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
.fly Tarren Mill >>飞往塔伦米尔
.target Michael Garrett
.zoneskip Hillsbrad Foothills
.isQuestComplete 8413
.dungeon ST
step << Shaman
#phase 4-6
.goto Alterac Mountains,80.50,66.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bath'rah|r交谈
.turnin 8413 >>交任务: |cRXP_FRIENDLY_巫毒羽毛|r
.target Bath'rah the Windwatcher
.isQuestComplete 8413
.dungeon ST
step << Shaman
#phase 4-6
.goto Hillsbrad Foothills,60.14,18.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞斯|r交谈
.fly Undercity >>飞往幽暗城
.target Zarise
.zoneskip Undercity
.zoneskip Tirisfal Glades
.dungeon ST
step
#optional
.abandon 3447 >>放弃雕像群的秘密
.isOnQuest 3447
.dungeon ST
step
#optional
.abandon 3528 >>抛弃神灵哈卡
.isOnQuest 3528
.dungeon ST
step
#optional
.abandon 4146 >>放弃除草器的燃料
.isOnQuest 4146
.dungeon ST
step
#optional
.abandon 1445 >>放弃阿塔哈卡神庙
.isOnQuest 1445
.dungeon ST
step
#optional
.abandon 5165 >>放弃熄灭保护之焰
.isOnQuest 5165
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 57-59 西部群岛/东部群岛
#displayname 57-59 西部群岛/东部群岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南(50-60级)
#next 59-59 冬泉谷/希利苏斯 I
step << Mage
#completewith Bulwark1
.goto Tirisfal Glades,61.92,64.85
.zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
.zoneskip Undercity,1
step
#completewith next
.subzone 152 >>前往壁垒
step
.goto Tirisfal Glades,83.15,68.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往壁垒, 然后与|cRXP_FRIENDLY_Derrington|r交谈
.turnin 5095 >>交任务: |cRXP_FRIENDLY_战斗的号角：瘟疫之地！|r
.accept 5096 >>接任务: |cRXP_LOOT_误导血色十字军|r
.target High Executor Derrington
step
.goto Western Plaguelands,26.55,56.18
>>点击火堆旁的|cRXP_PICK_火岩箱|r
.collect 12814,1,5096,1 
step
.goto Tirisfal Glades,83.19,68.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_银色黎明军官加鲁什|r交谈
.turnin 6029 >>交任务: |cRXP_FRIENDLY_永望镇报告|r
.turnin 5405 >>交任务: |cRXP_FRIENDLY_银色黎明委任徽章|r
.target Argent Officer Garush
step
#label Bulwark1
.goto Tirisfal Glades,83.30,72.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奇|r交谈
.accept 5901 >>接任务: |cRXP_LOOT_瘟疫与你|r
.target Mickey Levine
step
#completewith next
.use 12846 >>装备你的 |T133440:0|t[银色黎明委任徽章]饰品
step 
.goto Western Plaguelands,40.5,51.8
.use 12807 >>点击|cRXP_PICK_Command 帐篷|r, 然后使用你的 |T132484:0|t[天灾战旗]
>>|cRXP_WARN_这些怪物相对较难应对, 且会相互连锁拉怪, 所以要小心|r
.complete 5096,1 
step
.goto Tirisfal Glades,83.15,68.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Derrington|r交谈
.turnin 5096 >>交任务: |cRXP_FRIENDLY_误导血色十字军|r
.accept 5098 >>接任务: |cRXP_LOOT_标记哨塔|r
.accept 5228 >>接任务: |cRXP_LOOT_瘟疫之锅|r
.target High Executor Derrington
step
.goto Tirisfal Glades,83.03,71.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_范迪斯|r交谈
.turnin 5228 >>交任务: |cRXP_FRIENDLY_瘟疫之锅|r
.accept 5229 >>接任务: |cRXP_LOOT_目标：费尔斯通农场|r
.target Shadow Priestess Vandis
step
.goto Western Plaguelands,37.12,57.18
>>击杀|cRXP_ENEMY_护锅者拜尔摩|r. 搜刮他的|cRXP_LOOT_大锅钥匙|r
.complete 5229,1 
.unitscan Cauldron Lord Bilemaw
step
.goto Western Plaguelands,37.2,56.8
>>点击祭坛上翻滚的瘟疫之锅
.turnin 5229 >>交任务: |cRXP_FRIENDLY_目标：费尔斯通农场|r
.accept 5230 >>接任务: |cRXP_LOOT_返回亡灵壁垒|r
step
.goto Western Plaguelands,38.40,54.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与房子二楼的|cRXP_FRIENDLY_Janice|r交谈
.accept 5021 >>接任务: |cRXP_LOOT_迟到总比不到好|r
.target Janice Felstone
step
.goto Western Plaguelands,38.8,55.3
>>点击谷仓里的詹妮丝的包裹
>>|cRXP_WARN_如果你想跳过房间内的怪物, 可以通过走廊墙上的按钮进行点击|r
.turnin 5021 >>交任务: |cRXP_FRIENDLY_迟到总比不到好|r
.accept 5023 >>接任务: |cRXP_LOOT_迟到总比不到好|r
step
#completewith next
.subzone 152 >>返回要塞
step
.goto Tirisfal Glades,83.03,71.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_范迪斯|r交谈
.turnin 5230 >>交任务: |cRXP_FRIENDLY_返回亡灵壁垒|r
.accept 5231 >>接任务: |cRXP_LOOT_目标：达尔松之泪|r
.target Shadow Priestess Vandis
step
.goto Western Plaguelands,46.04,52.33
>>击杀|cRXP_ENEMY_Cauldron Lord Malvinous|r, 击败他后可获得他的|cRXP_LOOT_Cauldron Key|r
.complete 5231,1 
.unitscan Cauldron Lord Malvinious
step
.goto Western Plaguelands,46.2,52.0
>>点击祭坛上翻滚的瘟疫之锅
.turnin 5231 >>交任务: |cRXP_FRIENDLY_目标：达尔松之泪|r
.accept 5232 >>接任务: |cRXP_LOOT_返回亡灵壁垒|r
step
.goto Western Plaguelands,47.8,50.6
>>点击|cRXP_PICK_达尔森夫人的日记|r
.turnin 5058 >>交任务: |cRXP_FRIENDLY_达尔松夫人的日记|r
step
.goto Western Plaguelands,47.49,51.00
>>击杀|cRXP_ENEMY_游荡的骷髅|r. 击败后拾取其|cRXP_LOOT_厕所钥匙|r
>>|cRXP_WARN_如果骷髅未生成, 请刷取白骨碎片|r
.collect 12738,1 
.unitscan Wandering Skeleton
step
#completewith next
.goto Western Plaguelands,48.2,49.7
>>点击|cRXP_PICK_厕所|r
.turnin 5059 >>交任务: |cRXP_FRIENDLY_被锁起来的农夫|r
step
.goto Western Plaguelands,48.2,49.7
>>击杀|cRXP_ENEMY_农夫达尔松|r. 击败后搜刮其身上的|cRXP_LOOT_柜子钥匙|r
>>|cRXP_WARN_这个怪物拥有猛击和激怒技能, 请务必小心|r
.collect 12739,1,5060 
.unitscan Farmer Dalson
step
.goto Western Plaguelands,47.4,49.7
>>点击房屋顶层的|cRXP_PICK_锁住的柜橱|r
.turnin 5060 >>交任务: |cRXP_FRIENDLY_被锁起来的农夫|r
step
.goto Western Plaguelands,39.46,66.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店顶层的|cRXP_FRIENDLY_克罗米|r交谈
.accept 4971 >>接任务: |cRXP_LOOT_时间问题|r
.target Chromie
step
.goto Western Plaguelands,40.15,71.50
.use 12815 >>在塔楼门框外角使用你的|T135432:0|t[信号火炬]
>>|cRXP_WARN_不要与内部的精英敌人交战|r
.complete 5098,1 
step
.goto Western Plaguelands,42.28,66.05
.use 12815 >>在塔楼门框外角使用你的|T135432:0|t[信号火炬]
>>|cRXP_WARN_不要与内部的精英敌人交战|r
.complete 5098,2 
step
.goto Western Plaguelands,44.24,63.06
.use 12815 >>在塔楼门框外角使用你的|T135432:0|t[信号火炬]
>>|cRXP_WARN_不要与内部的精英敌人交战|r
.complete 5098,3 
step
.goto Western Plaguelands,45.8,63.3
.use 12627 >>使用你的 |T134229:0|t[时光置换器] 在发光的筒仓附近召唤|cRXP_ENEMY_时光寄生虫|r
>>|cRXP_WARN_时光寄生虫会持续施放减速效果, 并且在死亡时会召唤更多时光寄生虫. 如果它们开始压倒你, 请立即跑向水域；它们无法游泳|r
.complete 4971,1 
.mob Temporal Parasite
step
#completewith next
.goto Western Plaguelands,65.23,86.30,0
.goto Western Plaguelands,65.23,86.30,40,0
.goto The Hinterlands,22.32,27.19,30,0
.goto The Hinterlands,24.37,31.09,30,0
.goto The Hinterlands,23.91,33.27,30,0
.goto The Hinterlands,24.44,36.69,30,0
.goto The Hinterlands,23.87,38.59,30,0
.goto The Hinterlands,24.70,44.70,60 >>沿小路向东南方向前往荒野地区. 请按照任务标记指引前进
.dungeon ST
step
.goto The Hinterlands,33.751,75.210
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Atal'ai Exile|r交谈
.turnin 1446 >>交任务: |cRXP_FRIENDLY_预言者迦玛兰|r
.target Atal'ai Exile
.isQuestComplete 1446
.dungeon ST
step
#completewith next
.goto The Hinterlands,24.70,44.70,0
.goto The Hinterlands,24.70,44.70,60,0
.goto The Hinterlands,23.87,38.59,30,0
.goto The Hinterlands,24.44,36.69,30,0
.goto The Hinterlands,23.91,33.27,30,0
.goto The Hinterlands,24.37,31.09,30,0
.goto The Hinterlands,22.32,27.19,30,0
.goto Western Plaguelands,65.23,86.30,40 >>返回西瘟疫之地
.zoneskip Western Plaguelands
.isQuestTurnedIn 1446
.dungeon ST
step
.goto Western Plaguelands,46.73,71.14
.use 12815 >>在塔楼门框外角使用你的|T135432:0|t[信号火炬]
>>|cRXP_WARN_不要与内部的精英敌人交战|r
.complete 5098,4 
step
#completewith next
.subzone 152 >>返回要塞
step
.goto Tirisfal Glades,83.03,71.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_范迪斯|r交谈
.turnin 5232 >>交任务: |cRXP_FRIENDLY_返回亡灵壁垒|r
.accept 5233 >>接任务: |cRXP_LOOT_目标：嚎哭鬼屋|r
.target Shadow Priestess Vandis
step
.goto Tirisfal Glades,83.15,68.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Derrington|r交谈
.turnin 5098 >>交任务: |cRXP_FRIENDLY_标记哨塔|r
.accept 838 >>接任务: |cRXP_LOOT_通灵学院|r
.target High Executor Derrington
step
.goto Tirisfal Glades,83.28,69.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dithers|r交谈
.turnin 838 >>交任务: |cRXP_FRIENDLY_通灵学院|r
.accept 964 >>接任务: |cRXP_LOOT_骸骨碎片|r
.target Apothecary Dithers
step
.goto Western Plaguelands,39.46,66.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店顶层的|cRXP_FRIENDLY_克罗米|r交谈
.turnin 4971 >>交任务: |cRXP_FRIENDLY_时间问题|r
.accept 4972 >>接任务: |cRXP_LOOT_找回时间|r
.target Chromie
.isQuestComplete 4971
step
.goto Western Plaguelands,39.46,66.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店顶层的|cRXP_FRIENDLY_克罗米|r交谈
.accept 4972 >>接任务: |cRXP_LOOT_找回时间|r
.target Chromie
.isQuestTurnedIn 4971
step
#completewith next
>>在废墟建筑中搜刮|cRXP_PICK_小型锁箱|r, 以获得|cRXP_LOOT_安多哈尔守望者|r
.complete 4972,1 
.isOnQuest 4972
step
#loop
.goto Western Plaguelands,46.40,70.00,0
.goto Western Plaguelands,46.40,70.00,50,0
.goto Western Plaguelands,45.60,72.20,50,0
.goto Western Plaguelands,42.60,71.40,50,0
.goto Western Plaguelands,41.60,73.20,50,0
.goto Western Plaguelands,38.80,71.00,50,0
.goto Western Plaguelands,38.80,68.20,50,0
.goto Western Plaguelands,40.40,66.40,50,0
.goto Western Plaguelands,42.60,70.00,50,0
.goto Western Plaguelands,43.40,64.40,50,0
.goto Western Plaguelands,45.80,65.80,50,0
>>击杀安多哈尔内的所有骷髅, 击杀后可掠夺其碎片
>>|cRXP_ENEMY_骷髅刽子手|r|cRXP_WARN_可执行|r
.complete 964,1 
.mob Skeletal Executioner
.mob Skeletal Acolyte
.mob Skeletal Warlord
.mob Skeletal Sorcerer
.mob Skeletal Flayer
.mob Skeletal Terror
step
#loop
.goto Western Plaguelands,40.40,66.50,0
.goto Western Plaguelands,40.40,66.50,30,0
.goto Western Plaguelands,38.90,68.10,30,0
.goto Western Plaguelands,41.30,69.80,30,0
.goto Western Plaguelands,42.80,73.90,30,0
.goto Western Plaguelands,43.60,73.40,30,0
.goto Western Plaguelands,45.10,73.70,30,0
.goto Western Plaguelands,46.50,73.00,30,0
.goto Western Plaguelands,44.80,70.50,30,0
.goto Western Plaguelands,42.90,68.50,30,0
.goto Western Plaguelands,40.90,67.20,30,0
>>在废墟建筑中搜刮|cRXP_PICK_小型锁箱|r, 以获得|cRXP_LOOT_安多哈尔守望者|r
.complete 4972,1 
.isOnQuest 4972
step
.goto Western Plaguelands,39.46,66.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店顶层的|cRXP_FRIENDLY_克罗米|r交谈
.turnin 4972 >>交任务: |cRXP_FRIENDLY_找回时间|r
.target Chromie
.isQuestComplete 4972
step
.goto Western Plaguelands,53.07,65.97
>>击杀|cRXP_ENEMY_护锅者拉扎奇|r. 击败他后搜刮出他的|cRXP_LOOT_护锅钥匙|r
>>|cRXP_ENEMY_冰冷的食尸鬼|r|cRXP_WARN_拥有一个持续5秒的瞬发范围眩晕效果|r
.complete 5233,1 
.unitscan Cauldron Lord Razarch
step
.goto Western Plaguelands,53.0,65.7
>>点击祭坛上翻滚的瘟疫之锅
>>|cRXP_ENEMY_冰冷的食尸鬼|r|cRXP_WARN_拥有一个持续5秒的瞬发范围眩晕效果|r
.turnin 5233 >>交任务: |cRXP_FRIENDLY_目标：嚎哭鬼屋|r
.accept 5234 >>接任务: |cRXP_LOOT_返回亡灵壁垒|r
step
.goto Western Plaguelands,53.73,64.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_穆格雷斯·深水|r交谈
>>|cRXP_ENEMY_冰冷的食尸鬼|r|cRXP_WARN_拥有一个持续5秒的瞬发范围眩晕效果|r
.accept 4984 >>接任务: |cRXP_LOOT_大自然的苦楚|r
.target Mulgris Deepriver
step
#completewith Businessman
>>击杀|cRXP_ENEMY_Diseased Wolves|r
>>|cRXP_ENEMY_病狼|r|cRXP_WARN_与|r|cRXP_ENEMY_腐虫潜伏者|r|cRXP_WARN_共享刷新点. 如有需要, 请击杀它们以重置该区域|r
.complete 4984,1 
.unitscan Diseased Wolf
step
.goto Western Plaguelands,51.92,28.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔斯塔|r交谈
.accept 6004 >>接任务: |cRXP_LOOT_未竟的事业|r
.target Kirsta Deepshadow
step
#completewith next
.goto Western Plaguelands,50.43,41.12,70,0
.goto Western Plaguelands,53.50,36.85,70,0
.goto Western Plaguelands,50.43,41.12,70,0
>>击杀|cRXP_ENEMY_血色法师|r和|cRXP_ENEMY_血色骑士|r
>>|cRXP_WARN_|r|cRXP_ENEMY_法师|r|cRXP_WARN_和|r|cRXP_ENEMY_骑士|r|cRXP_WARN_共享刷新点. 如有必要, 请击杀额外的怪物以重置该区域|r
.complete 6004,3 
.mob +Scarlet Mage
.complete 6004,4 
.mob +Scarlet Knight
step
.goto Western Plaguelands,51.77,44.13,70,0
.goto Western Plaguelands,40.83,52.30,70,0
.goto Western Plaguelands,47.35,51.54,0
.goto Western Plaguelands,51.77,44.13
>>击杀|cRXP_ENEMY_血色医护员|r 和|cRXP_ENEMY_血色猎人|r
>>|cRXP_ENEMY_医疗兵|r|cRXP_WARN_和|r|cRXP_ENEMY_猎人|r|cRXP_WARN_可在营地中找到. 如有需要, 击杀额外怪物以重置该区域|r
.complete 6004,1 
.mob +Scarlet Medic
.complete 6004,2 
.mob +Scarlet Hunter
step
.goto Western Plaguelands,50.43,41.12,70,0
.goto Western Plaguelands,53.50,36.85,70,0
.goto Western Plaguelands,50.43,41.12
>>完成击杀血色法师和血色骑士
>>|cRXP_WARN_|r|cRXP_ENEMY_法师|r|cRXP_WARN_和|r|cRXP_ENEMY_骑士|r|cRXP_WARN_共享刷新点. 如有必要, 请击杀额外的怪物以重置该区域|r
.complete 6004,3 
.mob +Scarlet Mage
.complete 6004,4 
.mob +Scarlet Knight
step
.goto Western Plaguelands,51.92,28.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔斯塔|r交谈
.turnin 6004 >>交任务: |cRXP_FRIENDLY_未竟的事业|r
.accept 6023 >>接任务: |cRXP_LOOT_未竟的事业|r
.target Kirsta Deepshadow
step
.goto Western Plaguelands,57.83,36.10
>>击杀猎人莱德雷
>>|cRXP_WARN_她周围的怪物很容易被连环拉扯. 法术束缚者施放冰霜新星|r
.complete 6023,1 
.unitscan Huntsman Radley
step
.goto Western Plaguelands,54.64,23.71
>>击杀|cRXP_ENEMY_骑士杜尔根|r
>>|cRXP_WARN_如果你等到他巡逻离开塔楼后再进行拉怪, 这次遭遇会安全得多. 他有一个5秒的瞬发眩晕技能|r
.complete 6023,2 
.unitscan Cavalier Durgen
step
#label Businessman
.goto Western Plaguelands,51.92,28.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔斯塔|r交谈
.turnin 6023 >>交任务: |cRXP_FRIENDLY_未竟的事业|r
.target Kirsta Deepshadow
step
#loop
.goto Western Plaguelands,46.80,39.60,0
.goto Western Plaguelands,46.80,39.60,70,0
.goto Western Plaguelands,45.80,46.40,70,0
.goto Western Plaguelands,43.40,54.80,70,0
.goto Western Plaguelands,46.00,59.20,70,0
.goto Western Plaguelands,51.60,61.60,70,0
.goto Western Plaguelands,51.00,53.20,70,0
.goto Western Plaguelands,50.00,46.60,70,0
.goto Western Plaguelands,47.80,43.40,70,0
>>击杀|cRXP_ENEMY_Diseased Wolves|r
>>|cRXP_ENEMY_病狼|r|cRXP_WARN_与|r|cRXP_ENEMY_腐虫潜伏者|r|cRXP_WARN_共享刷新点. 如有需要, 请击杀它们以重置该区域|r
.complete 4984,1 
.unitscan Diseased Wolf
step
.goto Western Plaguelands,53.73,64.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆格雷斯·深水|r交谈
.turnin 4984 >>交任务: |cRXP_FRIENDLY_大自然的苦楚|r
.accept 4985 >>接任务: |cRXP_LOOT_大自然的苦楚|r
.target Mulgris Deepriver
step
#loop
.goto Western Plaguelands,56.08,63.26,0
.goto Western Plaguelands,56.08,63.26,90,0
.goto Western Plaguelands,60.15,59.93,90,0
.goto Western Plaguelands,59.43,52.40,90,0
.goto Western Plaguelands,68.18,46.23,90,0
>>击杀|cRXP_ENEMY_Diseased Grizzlies|r
>>|cRXP_ENEMY_患病的灰熊|r|cRXP_WARN_会与|r|cRXP_ENEMY_瘟疫潜伏者|r|cRXP_WARN_共享刷新点. 如有必要, 请击杀它们以重置该区域|r
.complete 4985,1 
.unitscan Diseased Grizzly
step
.goto Western Plaguelands,53.73,64.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆格雷斯·深水|r交谈
>>|cRXP_WARN_暂时不要接受后续任务！|r
.turnin 4985 >>交任务: |cRXP_FRIENDLY_大自然的苦楚|r
.target Mulgris Deepriver
step
#completewith next
.goto Eastern Plaguelands,7.59,43.57,50 >>前往东瘟疫之地寻找|r|cRXP_FRIENDLY_Tirion|r
step
.goto Eastern Plaguelands,7.59,43.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提里奥|r交谈
.accept 5542 >>接任务: |cRXP_LOOT_恶魔之犬|r
.accept 5543 >>接任务: |cRXP_LOOT_血染的天空|r
.accept 5544 >>接任务: |cRXP_LOOT_腐肉虫|r
.target Tirion Fordring
step
#completewith WormMeat
>>击杀 |cRXP_ENEMY_腐肉蠕虫|r. 击杀后搜刮其掉落的 |cRXP_LOOT_肉|r
.complete 5544,1 
.mob Carrion Worm
.mob Carrion Devourer
step
#completewith Pamela
>>击杀|cRXP_ENEMY_瘟疫蝙蝠|r和|cRXP_ENEMY_瘟疫幼犬|r
.complete 5543,1 
.mob +Plaguebat
.complete 5542,1 
.mob +Plaguehound Runt
step
.goto Eastern Plaguelands,26.55,74.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈瑟诺斯|r交谈
.accept 6042 >>接任务: |cRXP_WARN_讨厌的蝙蝠|r
.target Nathanos Blightcaller
step
.goto Eastern Plaguelands,36.47,90.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕梅拉|r交谈
.turnin 5601 >>交任务: |cRXP_FRIENDLY_小妹妹帕米拉|r
.accept 5149 >>接任务: |cRXP_LOOT_帕米拉的洋娃娃|r
.target Pamela Redpath
step
.goto Eastern Plaguelands,38.10,92.24
>>在废墟建筑的地板上拾取3个|cRXP_PICK_Doll Parts|r
>>|cRXP_WARN_点击玩偶碎片可以召唤出一些|r|cRXP_ENEMY_过去的幽灵|r|cRXP_WARN_它们拥有冰甲和霜击|r
.collect 12886,1,5149,1 
.unitscan Ghost of the Past
step
.goto Eastern Plaguelands,39.64,92.51
>>在废墟建筑的地板上拾取3个|cRXP_PICK_Doll Parts|r
>>|cRXP_WARN_点击玩偶碎片可以召唤出一些|r|cRXP_ENEMY_过去的幽灵|r|cRXP_WARN_它们拥有冰甲和霜击|r
.collect 12887,1,5149,1 
.unitscan Ghost of the Past
step
.goto Eastern Plaguelands,39.67,90.24
>>在废墟建筑的地板上拾取3个|cRXP_PICK_Doll Parts|r
>>|cRXP_WARN_点击玩偶碎片可以召唤出一些|r|cRXP_ENEMY_过去的幽灵|r|cRXP_WARN_它们拥有冰甲和霜击|r
.collect 12888,1,5149,1 
.unitscan Ghost of the Past
step
.goto Eastern Plaguelands,36.47,90.80
.use 12886 >>|cRXP_WARN_点击|r|T134164:0|t[帕米拉的洋娃娃的脑袋] |cRXP_WARN_以合成三件套|r
.complete 5149,1 
step
#label Pamela
.goto Eastern Plaguelands,36.47,90.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕梅拉|r交谈
.turnin 5149 >>交任务: |cRXP_FRIENDLY_帕米拉的洋娃娃|r
.accept 5152 >>接任务: |cRXP_LOOT_玛莱恩姑妈|r
.accept 5241 >>接任务: |cRXP_LOOT_卡林叔叔|r
.target Pamela Redpath
step
#loop
.goto Eastern Plaguelands,34.16,82.21,0
.goto Eastern Plaguelands,40.09,82.83,70,0
.goto Eastern Plaguelands,43.06,82.47,70,0
.goto Eastern Plaguelands,43.97,74.96,70,0
.goto Eastern Plaguelands,36.35,69.28,70,0
.goto Eastern Plaguelands,30.46,70.17,70,0
.goto Eastern Plaguelands,19.69,68.12,70,0
.goto Eastern Plaguelands,18.24,77.03,70,0
.goto Eastern Plaguelands,24.94,70.55,70,0
.goto Eastern Plaguelands,31.20,72.10,70,0
.goto Eastern Plaguelands,34.16,82.21,70,0
>>击杀|cRXP_ENEMY_瘟疫蝙蝠|r和|cRXP_ENEMY_瘟疫幼犬|r
.complete 5543,1 
.mob +Plaguebat
.complete 5542,1 
.mob +Plaguehound Runt
step
#loop
.goto Eastern Plaguelands,77.94,69.64,0
.goto Eastern Plaguelands,46.14,65.32,70,0
.goto Eastern Plaguelands,49.24,61.48,70,0
.goto Eastern Plaguelands,50.26,54.66,70,0
.goto Eastern Plaguelands,55.24,54.72,70,0
.goto Eastern Plaguelands,61.47,61.92,70,0
.goto Eastern Plaguelands,65.18,70.17,70,0
.goto Eastern Plaguelands,69.94,72.99,70,0
.goto Eastern Plaguelands,72.99,75.98,70,0
.goto Eastern Plaguelands,77.94,69.64,70,0
>>击杀|cRXP_ENEMY_瘟疫犬|r和|cRXP_ENEMY_毒性瘟疫蝙蝠|r
.complete 5542,2 
.mob +Plaguehound
.complete 6042,1 
.mob +Noxious Plaguebat
step
#completewith LHFP
.subzone 2268 >>前往圣光之愿礼拜堂
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nicholas|r和|cRXP_FRIENDLY_Carlin|r交谈
.turnin 6030 >>交任务: |cRXP_FRIENDLY_尼古拉斯·瑟伦霍夫公爵|r
.target +Duke Nicholas Zverenhoff
.goto Eastern Plaguelands,81.44,59.81
.turnin 5241 >>交任务: |cRXP_FRIENDLY_卡林叔叔|r
.accept 5211 >>接任务: |cRXP_LOOT_达隆郡的保卫者|r
.target +Carlin Redpath
.goto Eastern Plaguelands,81.51,59.77
step
.goto Eastern Plaguelands,79.60,63.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿伦|r交谈
.accept 6021 >>接任务: |cRXP_LOOT_流亡者塞达尔|r
.accept 5281 >>接任务: |cRXP_LOOT_永不安息的灵魂|r
.target Caretaker Alen
step
#label LHFP
.goto Eastern Plaguelands,80.22,57.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔吉亚|r交谈
.fp Light's Hope Chapel	>>获取圣光之愿礼拜堂的飞行点
.target Georgia
step
#sticky
#completewith LostSymbol
.goto Eastern Plaguelands,77.11,48.00,0
.goto Eastern Plaguelands,67.30,40.67,0
.goto Eastern Plaguelands,26.48,37.58,0
>>击杀|cRXP_ENEMY_生病的剥皮者|r 和|cRXP_ENEMY_喋喋不休的食尸鬼|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与出现在他们尸体上方的|cRXP_FRIENDLY_达隆郡居民的灵魂|r交谈
>>|cRXP_WARN_这些怪物会与几种其他类型的怪物共享刷新点, 因此在所有食尸鬼死亡后, 请消灭所有生物|r
.complete 5211,1 
.unitscan Diseased Flayer;Gibbering Ghoul;Cannibal Ghoul
.skipgossip
step
#label WormMeat
#loop
.goto Eastern Plaguelands,51.18,39.91,0
.goto Eastern Plaguelands,69.73,50.55,70,0
.goto Eastern Plaguelands,70.42,43.50,70,0
.goto Eastern Plaguelands,70.34,38.47,70,0
.goto Eastern Plaguelands,67.02,34.41,70,0
.goto Eastern Plaguelands,62.69,34.72,70,0
.goto Eastern Plaguelands,50.36,28.49,70,0
.goto Eastern Plaguelands,51.18,39.91,70,0
>>击杀|cRXP_ENEMY_巨型瘟疫蝙蝠|r和|cRXP_ENEMY_狂怒的瘟疫犬|r
>>|cRXP_WARN_请注意|r|cRXP_ENEMY_巨型瘟疫蝙蝠|r|cRXP_WARN_在近战范围内可沉默10秒|r << !Rogue !Warrior
.complete 6042,2 
.mob +Monstrous Plaguebat
.complete 5542,3 
.mob +Frenzied Plaguehound
step
#loop
.goto Eastern Plaguelands,67.02,34.41,0
.goto Eastern Plaguelands,69.73,50.55,70,0
.goto Eastern Plaguelands,70.42,43.50,70,0
.goto Eastern Plaguelands,70.34,38.47,70,0
.goto Eastern Plaguelands,67.02,34.41,70,0
.goto Eastern Plaguelands,62.69,34.72,70,0
.goto Eastern Plaguelands,50.36,28.49,70,0
.goto Eastern Plaguelands,51.18,39.91,70,0
>>击杀 |cRXP_ENEMY_腐肉蠕虫|r. 击杀后搜刮其掉落的 |cRXP_LOOT_肉|r
.complete 5544,1 
.mob Carrion Worm
.mob Carrion Devourer
step
#completewith next
.subzone 2277 >>前往瘟疫之林
step
#loop
.goto Eastern Plaguelands,42.80,34.24,0
.goto Eastern Plaguelands,39.97,21.11,50,0
.goto Eastern Plaguelands,34.90,24.67,50,0
.goto Eastern Plaguelands,30.69,24.99,50,0
.goto Eastern Plaguelands,26.59,23.84,50,0
.goto Eastern Plaguelands,24.19,23.62,50,0
.goto Eastern Plaguelands,21.15,24.05,50,0
.goto Eastern Plaguelands,20.90,29.89,50,0
.goto Eastern Plaguelands,23.75,32.44,50,0
.goto Eastern Plaguelands,26.48,37.58,50,0
.goto Eastern Plaguelands,29.55,34.13,50,0
.goto Eastern Plaguelands,34.89,35.29,50,0
.goto Eastern Plaguelands,42.80,34.24,50,0
>>掠夺土黄色的|cRXP_PICK_Termite Mounds|r以获取其中的|cRXP_LOOT_Termites|r
.complete 5901,1 
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入房屋, 然后与|cRXP_FRIENDLY_埃根|r和|cRXP_FRIENDLY_奥古斯特斯|r交谈
.turnin 5281 >>交任务: |cRXP_FRIENDLY_永不安息的灵魂|r
.target +Egan
.goto Eastern Plaguelands,14.45,33.74
.accept 6164 >>接任务: |cRXP_LOOT_奥古斯图斯的收据册|r
.target +Augustus the Touched
.goto Eastern Plaguelands,14.44,33.51
step
.goto Eastern Plaguelands,17.42,31.10
>>战利品|cRXP_PICK_奥古斯图斯的单据|r在旅馆二楼找到
.complete 6164,1 
step
.goto Eastern Plaguelands,14.44,33.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|r|cRXP_FRIENDLY_Augustus|r交谈
.turnin 6164 >>交任务: |cRXP_FRIENDLY_奥古斯图斯的收据册|r
.target Augustus the Touched
step
.goto Eastern Plaguelands,14.44,33.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t再次与|cRXP_FRIENDLY_Augustus|r谈话
>>|cRXP_WARN_在背包中留出足够的空间 
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
step
#completewith next
.goto Eastern Plaguelands,27.59,43.33,40,0
.goto Eastern Plaguelands,24.43,41.00,40,0
.goto Eastern Plaguelands,23.33,42.30,40,0
.goto Eastern Plaguelands,21.80,40.36,40,0
.goto Eastern Plaguelands,19.58,42.98,40,0
.goto Eastern Plaguelands,18.71,40.81,40,0
.goto Eastern Plaguelands,16.37,42.00,40,0
.goto Eastern Plaguelands,10.99,47.75,40,0
+执行东瘟疫之地山地跳跃以节省时间
>>|cRXP_WARN_你必须在背包中拥有|r|T134863:0|t[诺格弗格药剂]|r
>>|cRXP_WARN_或者, |r|T132917:0|t[轻羽毛] |cRXP_WARN_同样适用于|r|T135992:0|t[减速坠落] << Mage
.link https://www.youtube.com/watch?v=6VIULBxMyfU >>点击此处查看参考
.use 8529
step
.goto Eastern Plaguelands,7.59,43.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提里奥|r交谈
.turnin 5542 >>交任务: |cRXP_FRIENDLY_恶魔之犬|r
.turnin 5543 >>交任务: |cRXP_FRIENDLY_血染的天空|r
.turnin 5544 >>交任务: |cRXP_FRIENDLY_腐肉虫|r
.accept 5742 >>接任务: |cRXP_LOOT_救赎|r
.target Tirion Fordring
step
.goto Eastern Plaguelands,7.59,43.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提里奥|r交谈
>>|cRXP_WARN_聆听提里奥的故事时输入 /sit. 这样你就可以骑乘了|r
.complete 5742,1 
.turnin 5742 >>交任务: |cRXP_FRIENDLY_救赎|r
.target Tirion Fordring
.skipgossip
step
.goto Eastern Plaguelands,7.59,43.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提里奥|r交谈
.accept 5781 >>接任务: |cRXP_LOOT_遗忘的记忆|r
.target Tirion Fordring
.group
step
.goto Eastern Plaguelands,26.55,74.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈瑟诺斯|r交谈
.accept 6133 >>接任务: |cRXP_WARN_游侠之王的命令|r
.accept 6022 >>接任务: |cRXP_WARN_杀戮的理由|r
.turnin 6042 >>交任务: |cRXP_FRIENDLY_讨厌的蝙蝠|r
.target Nathanos Blightcaller
.group
step
.goto Eastern Plaguelands,26.55,74.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈瑟诺斯|r交谈
.accept 6022 >>接任务: |cRXP_WARN_杀戮的理由|r
.turnin 6042 >>交任务: |cRXP_FRIENDLY_讨厌的蝙蝠|r
.target Nathanos Blightcaller
step
.goto Eastern Plaguelands,28.34,86.79
>>点击|cRXP_PICK_松软的泥土堆|r召唤|cRXP_ENEMY_米库提奥·污血|r和3名|cRXP_ENEMY_地穴抢劫者|r. 击杀他后, 搜刮其掉落的|cRXP_LOOT_锤子|r
>>|cRXP_WARN_这个任务非常危险. |r|cRXP_ENEMY_地穴抢劫者|r|cRXP_WARN_很不寻常；它们的刷新时间很长, 且在分组拉怪时可能再次出现|r
.complete 5781,1 
.mob Crypt Robber
.unitscan Mercutio Filthgorger
.group 2
step
.goto Eastern Plaguelands,27.41,84.92
>>击杀墓穴内的流亡者塞达尔. 搜刮他的头颅
.complete 6021,1 
.unitscan Zaeldarr the Outcast
step
.goto Eastern Plaguelands,27.28,85.22
>>点击墓穴内地上那个巨大的|cRXP_PICK_破损的卷轴|r
.accept 6024 >>接任务: |cRXP_LOOT_哈米亚的请求|r
.group
step
.goto Eastern Plaguelands,7.59,43.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提里奥|r交谈
.turnin 5781 >>交任务: |cRXP_FRIENDLY_遗忘的记忆|r
.accept 5845 >>接任务: |cRXP_LOOT_失落的荣耀|r
.target Tirion Fordring
.isQuestComplete 5781
.group
step
#optional
.goto Eastern Plaguelands,7.59,43.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提里奥|r交谈
.accept 5845 >>接任务: |cRXP_LOOT_失落的荣耀|r
.target Tirion Fordring
.isQuestTurnedIn 5781
.group
step
.goto Eastern Plaguelands,26.55,74.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈瑟诺斯|r交谈
.accept 6022 >>接任务: |cRXP_LOOT_杀戮的理由|r
.target Nathanos Blightcaller
step
#completewith RottingUndead
.subzone 2264 >>前往科林的十字路口
step
#completewith next
>>击杀|r|cRXP_ENEMY_亡灵|r. 击败后搜刮其|r|cRXP_LOOT_生命腐质|r
>>|cRXP_WARN_精英小队在北侧和东侧道路上巡逻. 科林十字路口内部有隐形怪物出没, 建议将它们引出来再战斗|r
.collect 15447,7 
.mob Hate Shrieker
.mob Scourge Warder
.mob Stitched Horror
.mob Gibbering Ghoul
.mob Unseen Servant
.mob Dark Caster
step
#label RottingUndead
#loop
.goto Eastern Plaguelands,58.20,70.20,0
.goto Eastern Plaguelands,58.20,70.20,25,0
.goto Eastern Plaguelands,60.40,71.60,25,0
.goto Eastern Plaguelands,61.00,69.40,25,0
.goto Eastern Plaguelands,61.40,66.40,25,0
.goto Eastern Plaguelands,59.40,66.40,25,0
.goto Eastern Plaguelands,58.00,67.60,25,0
.use 15454 >>|cRXP_WARN_在|r|T133748:0|t[研钵和捣杵]|cRXP_WARN_生命腐质|r过期之前使用|r
.complete 6022,1 
step
.goto Eastern Plaguelands,64.25,22.09,50,0
.goto Eastern Plaguelands,68.57,20.95,50,0
.goto Eastern Plaguelands,69.23,18.48
>>击杀|cRXP_ENEMY_渗透者哈米亚|r. 从她身上搜刮|cRXP_LOOT_钥匙|r
>>|cRXP_WARN_你应该能够避开上山途中遇到的所有怪物. 绕过它们, 然后向东跑上山. 不要靠近那些坟墓|r
.complete 6024,1 
.unitscan Infiltrator Hameya
.group 2
step
#completewith next
.goto Eastern Plaguelands,52.14,18.30,0
>>拾取长椅顶部的奎尔萨拉斯名册
.complete 6133,4 
.group 2
step
#loop
.goto Eastern Plaguelands,52.88,19.18,0
.goto Eastern Plaguelands,51.75,21.66,40,0
.goto Eastern Plaguelands,50.73,18.33,40,0
.goto Eastern Plaguelands,50.89,16.50,40,0
.goto Eastern Plaguelands,52.97,17.29,40,0
.goto Eastern Plaguelands,52.88,19.18,40,0
>>击杀|cRXP_ENEMY_巡路者|r和|cRXP_ENEMY_游侠|r和|cRXP_ENEMY_林务员|r
>>|cRXP_WARN_这些怪物对非精英玩家来说伤害非常高|r << !Rogue !Druid
>>|cRXP_WARN_这些怪物对非精英玩家造成的伤害非常高；记得利用Pathstrider的精灵火焰技能, 以便在需要时逃脱|r << Rogue/Druid
.complete 6133,1 
.mob +Pathstrider
.complete 6133,2 
.mob +Ranger
.complete 6133,3 
.mob +Woodsman
.group 2
step
.goto Eastern Plaguelands,52.14,18.30
>>拾取长椅顶部的奎尔萨拉斯名册
.complete 6133,4 
.group 2
step
#label LostSymbol
.goto Eastern Plaguelands,71.30,33.97
>>在水下拾取失落荣耀的象征
.complete 5845,1 
.isQuestTurnedIn 5781
.group 0
step
#loop
.goto Eastern Plaguelands,77.11,48.00,0
.goto Eastern Plaguelands,67.30,40.67,0
.goto Eastern Plaguelands,26.48,37.58,0
.goto Eastern Plaguelands,68.20,40.80,60,0
.goto Eastern Plaguelands,68.60,38.60,60,0
.goto Eastern Plaguelands,66.00,36.00,60,0
.goto Eastern Plaguelands,64.60,38.00,60,0
.goto Eastern Plaguelands,65.40,41.20,60,0
.goto Eastern Plaguelands,66.60,38.60,60,0
.goto Eastern Plaguelands,68.20,40.80,60,0
>>击杀|cRXP_ENEMY_生病的剥皮者|r 和|cRXP_ENEMY_喋喋不休的食尸鬼|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与出现在他们尸体上方的|cRXP_FRIENDLY_达隆郡居民的灵魂|r交谈
>>|cRXP_WARN_这些怪物会与几种其他类型的怪物共享刷新点, 因此在所有食尸鬼死亡后, 请消灭所有生物|r
.complete 5211,1 
.unitscan Diseased Flayer;Gibbering Ghoul;Cannibal Ghoul
.skipgossip
step
#completewith next
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿伦|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
>>|cRXP_WARN_再走几步你就会前往幽暗城提交布料；你需要至少13个背包格子空闲|r
.target Caretaker Alen
step
.goto Eastern Plaguelands,79.60,63.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿伦|r交谈
.turnin 6021 >>交任务: |cRXP_FRIENDLY_流亡者塞达尔|r
.target Caretaker Alen
step
.goto Eastern Plaguelands,81.51,59.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡林|r交谈
.turnin 5211 >>交任务: |cRXP_FRIENDLY_达隆郡的保卫者|r
.target Carlin Redpath
step << !Mage
.goto Eastern Plaguelands,80.22,57.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔吉亚|r交谈
.fly Undercity >>飞往幽暗城
.target Georgia
.zoneskip Undercity
step << Mage
.cast 3563 >>传送 |T135766:0|t[传送:幽暗城]
step << Mage
.goto Undercity,85.15,10.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
.train 10157 >>训练你的职业法术
.target Anastasia Hartwell
.xp <56,1
.xp >58,1
step << Mage
#optional
.goto Undercity,85.15,10.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
.train 10054 >>训练你的职业法术
.target Anastasia Hartwell
.xp <58,1
step << Warlock
.goto Undercity,88.93,15.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richard|r交谈
.train 11689 >>训练你的职业法术
.target Richard Kerwin
.xp <56,1
.xp >58,1
step << Warlock
#optional
.goto Undercity,88.93,15.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richard|r交谈
.train 11713 >>训练你的职业法术
.target Richard Kerwin
.xp <58,1
step << Warlock
.goto Undercity,85.70,16.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛莎|r交谈
.trainer >>提升宠物的技能
.target Martha Strain
step << Priest
.goto Undercity,47.55,18.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉扎鲁斯|r交谈
.train 10929 >>训练你的职业法术
.target Father Lazarus
.xp <56,1
.xp >58,1
step << Priest
#optional
.goto Undercity,47.55,18.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉扎鲁斯|r交谈
.train 10947 >>训练你的职业法术
.target Father Lazarus
.xp <58,1
step << Warrior
.goto Undercity,48.32,15.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安吉拉|r交谈
.train 20662 >>训练你的职业法术
.target Angela Curthas
.xp <56,1
.xp >58,1
step << Warrior
#optional
.goto Undercity,48.32,15.98
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安吉拉|r交谈
.train 11597 >>训练你的职业法术
.target Angela Curthas
.xp <58,1
step << Rogue
.goto Undercity,83.86,72.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
.train 11300 >>训练你的职业法术
.target Carolyn Ward
.xp <56,1
.xp >58,1
step << Rogue
#optional
.goto Undercity,83.86,72.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
.train 11305 >>训练你的职业法术
.target Carolyn Ward
.xp <58,1
step
.goto Undercity,69.79,43.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bauhaus|r交谈
.turnin 5023 >>交任务: |cRXP_FRIENDLY_迟到总比不到好|r
.accept 5049 >>接任务: |cRXP_LOOT_杰雷米亚的忧伤|r
.target Royal Overseer Bauhaus
step
.goto Undercity,67.61,44.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰里米亚|r交谈
.turnin 5049 >>交任务: |cRXP_FRIENDLY_杰雷米亚的忧伤|r
.accept 5050 >>接任务: |cRXP_LOOT_好运护符|r
.target Jeremiah Payson
step
.goto Undercity,65.99,44.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉|r交谈
.bankwithdraw 10691,10692,10693,10694 >>从银行提取以下物品:
>>|T134815:0|t[装满水的瓶子 #1]
>>|T134822:0|t[装满水的瓶子#2]
>>|T134836:0|t[装满水的瓶子 #3]
>>|T134857:0|t[装满水的瓶子#4]
.target William Montague
.isOnQuest 3568
step
#ah
#completewith UCClothTurnins
.goto Undercity,67.66,35.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cain|r交谈
>>|cRXP_BUY_在拍卖行购买每种布料各240份|r
.collect 2592,240 
.collect 4306,240 
.collect 4338,240 
.collect 14047,240 
.target Auctioneer Cain
step
#ah
#completewith next
.goto Undercity,68.15,38.26,0
+前往邮箱领取以下物品:
.collect 2592,60 
.collect 4306,60 
.collect 4338,60 
.collect 14047,60 
step
#ah
#label UCClothTurnins
.goto Undercity,71.66,29.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱斯顿|r交谈
>>|cRXP_WARN_禁用任何会自动上交声望物品的其他插件, 否则之后会被提示重新购买布料|r
.turnin 7813 >>交任务: |cRXP_FRIENDLY_捐献毛料|r
.turnin 7814 >>交任务: |cRXP_FRIENDLY_捐献丝绸|r
.turnin 7817 >>交任务: |cRXP_FRIENDLY_捐献魔纹布|r
.turnin 7818 >>交任务: |cRXP_FRIENDLY_捐献符文布|r
.target Ralston Farnsley
step
#completewith SamplesComplete
.goto Undercity,47.20,59.69,0
.goto Undercity,47.20,59.69,12,0
.goto Undercity,43.55,68.11,12,0
.goto Undercity,45.20,71.67,12 >>前往|cRXP_FRIENDLY_Cuely|r
step
.goto Undercity,48.50,71.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Cuely|r 交谈
.turnin 3568 >>交任务: |cRXP_FRIENDLY_堕落之水|r
.target Chemist Cuely
.isQuestComplete 3568
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cuely|r和|cRXP_FRIENDLY_Thersa|r交谈
.accept 3569 >>接任务: |cRXP_WARN_堕落之水|r
.target +Chemist Cuely
.goto Undercity,48.71,71.40
.turnin 3569 >>交任务: |cRXP_FRIENDLY_堕落之水|r
.turnin 3570 >>交任务: |cRXP_FRIENDLY_堕落之水|r
.target +Thersa Windsong
.goto Undercity,49.03,70.81
.isQuestTurnedIn 3568
step << skip
.goto Undercity,47.8,73.3
>>使用|cRXP_PICK_测试仪器|r测试所有样本
.use 15103 >>|cRXP_WARN_打开你的|r|T134437:0|t[测试过的堕落样本]
.use 15102 >>|cRXP_WARN_打开你的|r|T134437:0|t[乌戈罗测试样本]
.complete 4293,1 
.complete 4294,1 
step << skip
.goto Undercity,48.50,71.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Cuely|r 交谈
.turnin 4293 >>交任务: |cRXP_FRIENDLY_软泥怪的样本…|r
.turnin 4294 >>交任务: |cRXP_FRIENDLY_一大堆软泥怪|r
.target Chemist Cuely
step << skip
.goto Undercity,48.50,71.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fuely|r交谈
.accept 4642 >>接任务: |cRXP_WARN_融合软泥怪|r
.target Chemist Fuely
step
#optional
#label SamplesComplete
step
.goto Undercity,54.81,76.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德隆|r交谈
.turnin 3542 >>交任务: |cRXP_FRIENDLY_安德隆·甘特的石版|r
.accept 3564 >>接任务: |cRXP_WARN_安德隆的报酬|r
.target Andron Gant
.isOnQuest 3542
step
#optional
.goto Undercity,54.81,76.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德隆|r交谈
.accept 3564 >>接任务: |cRXP_WARN_安德隆的报酬|r
.target Andron Gant
.isQuestTurnedIn 3542
step
#phase 6
#ah
.goto Undercity,71.42,46.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的拍卖师斯托克顿交谈|cRXP_FRIENDLY_Auctioneer Stockton|r
>>|cRXP_BUY_从拍卖行购买以下物品, 稍后将在EPL中用于多个免费任务的提交|r
>>|cRXP_WARN_共有5个不同的任务, 每个任务都需要30个指定物品. 如果你无法获得某一种物品的30个, 则跳过该任务|r
.collect 22529,30,9136,1 
.collect 22526,30,9126,1 
.collect 22525,30,9124,1 
.collect 22527,30,9128,1 
.collect 22528,30,9131,1 
.target Auctioneer Stockton
step
>>如果你之前在灼热峡谷完成了任务并获得了|T134430:0|t[黑龙皮], 请从银行取出. 你将需要用到它
.collect 10575,1,4022,1 
.isQuestTurnedIn 3481
.dungeon BRD
step
.goto Undercity,51.88,64.49,30,0
.goto Undercity,58.07,91.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sylvanas|r交谈
.accept 5961 >>接任务: |cRXP_LOOT_女妖之王的勇士|r
.target Lady Sylvanas Windrunner
step << skip
.goto Undercity,55.22,90.88
.goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过将角色 positioned 在最低楼梯的最高处, 直到看起来像是漂浮一样, 然后登出再重新登录, 来执行一次“登出跳过”操作|r
.link https://www.youtube.com/watch?v=jj85AXyF1XE >>|cRXP_WARN_点击此处查看示例|r
>>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
step
#completewith next
.goto Tirisfal Glades,61.85,66.59,60 >>前往: |cRXP_PICK_提瑞斯法林地|r
.zoneskip Tirisfal Glades
step
.goto Tirisfal Glades,83.28,69.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dithers|r交谈
.turnin 964 >>交任务: |cRXP_FRIENDLY_骸骨碎片|r
.target Apothecary Dithers
step
.goto Tirisfal Glades,83.03,71.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_范迪斯|r交谈
.turnin 5234 >>交任务: |cRXP_FRIENDLY_返回亡灵壁垒|r
.accept 5235 >>接任务: |cRXP_LOOT_目标：盖罗恩农场|r
.target Shadow Priestess Vandis
step
.goto Tirisfal Glades,83.29,72.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奇|r交谈
.turnin 5901 >>交任务: |cRXP_FRIENDLY_瘟疫与你|r
.accept 5902 >>接任务: |cRXP_LOOT_瘟疫与你|r
.target Mickey Levine
step
#optional
.isQuestTurnedIn 5901
.destroy 15043 >>摧毁: |cRXP_ENEMY_瘟疫白蚁|r
step
.goto Western Plaguelands,38.40,54.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t爬上建筑顶层, 然后与|cRXP_FRIENDLY_Janice|r交谈
.turnin 5050 >>交任务: |cRXP_FRIENDLY_好运护符|r
.accept 5051 >>接任务: |cRXP_LOOT_两半合一|r
.target Janice Felstone
step
#loop
.line Western Plaguelands,36.8,58.6,36.4,56.4,37.4,55.6,38.6,56.2,37.8,57.6,36.8,58.6
.goto Western Plaguelands,36.80,58.60,0
.goto Western Plaguelands,36.80,58.60,50,0
.goto Western Plaguelands,36.40,56.40,50,0
.goto Western Plaguelands,37.40,55.60,50,0
.goto Western Plaguelands,38.60,56.20,50,0
.goto Western Plaguelands,37.80,57.60,50,0
>>击杀|cRXP_ENEMY_喋喋不休的食尸鬼|r, 将其尸体中的|cRXP_LOOT_另一半好运护符|r拾取
.use 12722 >>使用它来制作|cRXP_LOOT_好运护符|r
.complete 5051,1 
.unitscan Jabbering Ghoul
step
.goto Western Plaguelands,38.40,54.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与大楼顶层的|cRXP_FRIENDLY_Janice|r交谈
.turnin 5051 >>交任务: |cRXP_FRIENDLY_两半合一|r
.target Janice Felstone
step
.goto Western Plaguelands,49.13,78.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_Marlene|r交谈
.turnin 5152 >>交任务: |cRXP_FRIENDLY_玛莱恩姑妈|r
.accept 5153 >>接任务: |cRXP_LOOT_古怪的历史学家|r
.target Marlene Redpath
step
.goto Western Plaguelands,49.69,76.75
>>掠夺|cRXP_PICK_约瑟夫·雷德帕斯的纪念碑|r以获得|cRXP_LOOT_约瑟夫的结婚戒指|r
.complete 5153,1 
step
.goto Western Plaguelands,39.46,66.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店顶层的|cRXP_FRIENDLY_克罗米|r交谈
.turnin 5153 >>交任务: |cRXP_FRIENDLY_古怪的历史学家|r
.accept 5154 >>接任务: |cRXP_LOOT_达隆郡的历史|r
.target Chromie
step
.goto Western Plaguelands,43.4,69.6
>>在市政厅内拾取|cRXP_PICK_发霉的书籍|r, 直到获得|cRXP_LOOT_达隆郡的历史|r
>>|cRXP_WARN_许多书都是假的, 打开时会刷新怪物. 真正的书页完全为白色, 没有灰色或深色区域. 你可能需要点击假书才能触发真书的生成|r
.complete 5154,1 
.link https://i.imgur.com/B2HDb6K.png >>点击此处查看示例
step
.goto Western Plaguelands,39.46,66.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店顶层的|cRXP_FRIENDLY_克罗米|r交谈
.turnin 5154 >>交任务: |cRXP_FRIENDLY_达隆郡的历史|r
.accept 5210 >>接任务: |cRXP_LOOT_卡林·雷德帕斯|r
.target Chromie
step
.goto Western Plaguelands,53.73,64.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆格雷斯·深水|r交谈
.accept 4987 >>接任务: |cRXP_LOOT_雕文橡木枝|r
.target Mulgris Deepriver
step
.goto Western Plaguelands,62.80,58.76
>>击杀 |cRXP_ENEMY_Cauldron Lord Soulwraith|r, 搜刮其掉落的 |cRXP_LOOT_Cauldron Key|r
>>|cRXP_WARN_这个怪物带有持续10秒的沉默效果|r << !Priest
>>|cRXP_WARN_这个怪物带有持续10秒的沉默疾病；请提前施放“驱除疾病”并保持效果|r << Priest
.complete 5235,1 
.unitscan Cauldron Lord Soulwraith
step
.goto Western Plaguelands,62.5,58.6
>>点击祭坛上翻滚的瘟疫之锅
.turnin 5235 >>交任务: |cRXP_FRIENDLY_目标：盖罗恩农场|r
.accept 5236 >>接任务: |cRXP_LOOT_返回亡灵壁垒|r
step
#completewith next
.goto Eastern Plaguelands,7.59,43.57,50 >>返回提里奥
.group
step
.goto Eastern Plaguelands,7.59,43.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提里奥|r交谈
.turnin 5845 >>交任务: |cRXP_FRIENDLY_失落的荣耀|r
.accept 5846 >>接任务: |cRXP_LOOT_爱与家庭|r
.target Tirion Fordring
.isQuestTurnedIn 5781
.group
step
#completewith next
.subzone 2261 >>前往地下走廊
.group
step
.goto Eastern Plaguelands,28.03,86.16
>>点击墓穴后面的泥土堆|cRXP_PICK_mound of dirt|r
.turnin 6024 >>交任务: |cRXP_FRIENDLY_哈米亚的请求|r
.isQuestComplete 6024
.group
step
.goto Eastern Plaguelands,26.55,74.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈瑟诺斯|r交谈
.turnin 5961 >>交任务: |cRXP_FRIENDLY_女妖之王的勇士|r
.turnin 6022 >>交任务: |cRXP_FRIENDLY_杀戮的理由|r
.turnin 6133 >>交任务: |cRXP_FRIENDLY_游侠之王的命令|r
.target Nathanos Blightcaller
.group
step
.goto Eastern Plaguelands,26.55,74.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈瑟诺斯|r交谈
.turnin 5961 >>交任务: |cRXP_FRIENDLY_女妖之王的勇士|r
.turnin 6022 >>交任务: |cRXP_FRIENDLY_杀戮的理由|r
.target Nathanos Blightcaller
step
#completewith next
.subzone 2268 >>前往圣光之愿礼拜堂
step
.goto Eastern Plaguelands,81.51,59.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡林|r交谈
.turnin 5210 >>交任务: |cRXP_FRIENDLY_卡林·雷德帕斯|r
.accept 5181 >>接任务: |cRXP_LOOT_达隆郡的恶魔|r
.accept 5168 >>接任务: |cRXP_LOOT_达隆郡的英雄|r
.target Carlin Redpath
.group
step
.goto Eastern Plaguelands,81.51,59.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡林|r交谈
.turnin 5210 >>交任务: |cRXP_FRIENDLY_卡林·雷德帕斯|r
.accept 5181 >>接任务: |cRXP_LOOT_达隆郡的恶魔|r
.target Carlin Redpath
step
.goto Eastern Plaguelands,51.11,49.92
>>拾取位于湖中央的霍古斯的颅骨|r
.complete 5181,1 
step
.goto Eastern Plaguelands,53.91,65.76
>>在感染之痕中拾取|cRXP_LOOT_马杜克的破碎之剑|r
.complete 5181,2 
step
.goto Eastern Plaguelands,81.51,59.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡林|r交谈
.turnin 5181 >>交任务: |cRXP_FRIENDLY_达隆郡的恶魔|r
.target Carlin Redpath
.solo
step
.goto Western Plaguelands,63.80,57.18
>>战利品|cRXP_LOOT_雷德帕斯之盾|r
.complete 5168,2 
.group
step
#completewith next
.goto Western Plaguelands,65.79,75.41,100 >>游向凯尔达罗 << !Shaman/Priest
.goto Western Plaguelands,65.79,75.41,100 >>步行前往凯尔达罗, 或游泳 << Shaman
.goto Western Plaguelands,65.79,75.41,100 >>使用浮空术前往凯尔达罗, 或游泳 << Priest
.group
step
.goto Western Plaguelands,65.79,75.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Renfray|r交谈
.turnin 5846 >>交任务: |cRXP_FRIENDLY_爱与家庭|r
.target Artist Renfray
.isOnQuest 5846
.group
step
#completewith next
.subzone 192 >>前往北山木料伐木营地
step
.goto Western Plaguelands,48.35,32.00
>>进入磨坊. 点击坡道旁的|cRXP_PICK_北山伐木场箱子|r, 然后点击|cRXP_PICK_白蚁桶|r
.turnin 5902 >>交任务: |cRXP_FRIENDLY_瘟疫与你|r
.accept 6390 >>接任务: |cRXP_LOOT_瘟疫与你|r
step
.goto Western Plaguelands,51.92,28.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔斯塔|r交谈
.accept 6025 >>接任务: |cRXP_LOOT_未竟的事业|r
.target Kirsta Deepshadow
.group
step
.goto Western Plaguelands,47.94,21.43,60,0
.goto Western Plaguelands,43.31,17.34,50,0
.goto Western Plaguelands,45.6,18.6
>>进入壁炉谷后, 沿箭头指示前进并重置怪物
>>跑到塔顶. 注意外面的圣骑士会治疗, 建议绕过或控制住他们, 再冲到塔顶
>>|cRXP_WARN_请注意, 怪物没有Z轴范围判定, 如果它们正好位于你正下方, 可以从塔底攻击到你|r
.complete 6025,1 
.group 2
step
.goto Western Plaguelands,42.53,18.99
>>教堂内战利品|cRXP_LOOT_达维的圣契|r
>>|cRXP_WARN_小心, 里面有很多精英怪|r
.complete 5168,1 
.group 5
step
.goto Western Plaguelands,51.92,28.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t离开壁炉谷, 然后与|cRXP_FRIENDLY_Kirsta|r交谈
.turnin 6025 >>交任务: |cRXP_FRIENDLY_未竟的事业|r
.target Kirsta Deepshadow
.isQuestComplete 6025
.group
step
#completewith next
.subzone 152 >>返回壁垒
step
.goto Tirisfal Glades,83.03,71.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_范迪斯|r交谈
.turnin 5236 >>交任务: |cRXP_FRIENDLY_返回亡灵壁垒|r
.target Shadow Priestess Vandis
step
.goto Tirisfal Glades,83.30,72.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奇|r交谈
.turnin 6390 >>交任务: |cRXP_FRIENDLY_瘟疫与你|r
.target Mickey Levine
step
.goto Tirisfal Glades,83.15,68.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Derrington|r交谈
.turnin 5238 >>交任务: |cRXP_FRIENDLY_任务完成！|r
.target High Executor Derrington
step
#completewith next
.subzone 2268 >>返回圣光之愿礼拜堂
.group
step
.goto Eastern Plaguelands,81.51,59.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡林|r交谈
.turnin 5181 >>交任务: |cRXP_FRIENDLY_达隆郡的恶魔|r
.turnin 5168 >>交任务: |cRXP_FRIENDLY_达隆郡的英雄|r
.target Carlin Redpath
.isQuestComplete 5168
.group
step
.goto Eastern Plaguelands,81.51,59.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡林|r交谈
.turnin 5181 >>交任务: |cRXP_FRIENDLY_达隆郡的恶魔|r
.target Carlin Redpath
.group
step
.goto Eastern Plaguelands,81.51,59.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t再次与|cRXP_FRIENDLY_Carlin|r交谈
.accept 5206 >>接任务: |cRXP_WARN_达隆郡的掠夺者|r
.target Carlin Redpath
.isQuestTurnedIn 5181
.isQuestTurnedIn 5168
.group
step
#loop
.goto Eastern Plaguelands,82.07,43.47,0
.goto Eastern Plaguelands,77.17,48.18,50,0
.goto Eastern Plaguelands,81.49,43.17,50,0
.goto Eastern Plaguelands,82.52,40.47,50,0
.goto Eastern Plaguelands,82.73,37.94,50,0
.goto Eastern Plaguelands,84.43,38.30,50,0
.goto Eastern Plaguelands,84.88,41.89,50,0
.goto Eastern Plaguelands,86.73,44.35,50,0
.goto Eastern Plaguelands,84.19,44.85,50,0
.goto Eastern Plaguelands,82.07,43.47,50,0
>>击杀|cRXP_ENEMY_天灾勇士|r. 从他们身上搜刮出 |T133728:0|t[|cRXP_LOOT_恶臭颅骨|r]
.use 13156 >>使用你的 |T134095:0|t[秘法水晶] 对 |T33728:0|t[|cRXP_LOOT_恶臭颅骨|r] 进行处理, 以制作|cRXP_LOOT_共鸣颅骨|r
.complete 5206,1 
.mob Scourge Champion
.isOnQuest 5206
.group
step
.goto Eastern Plaguelands,81.51,59.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡林|r交谈
.turnin 5206 >>交任务: |cRXP_FRIENDLY_达隆郡的掠夺者|r
.target Carlin Redpath
.isQuestComplete 5206
.group
step
#optional
.abandon 4971 >>放弃:时间问题
.isOnQuest 4971
step
#optional
.abandon 5781 >>遗忘记忆的遗弃
.isOnQuest 5781
step
#optional
.abandon 6133 >>Abandon 交任务: |cRXP_FRIENDLY_游侠之王的命令|r
.isOnQuest 6133
step
#optional
.abandon 6024 >>放弃哈米亚的请求
.isOnQuest 6024
step
#optional
.abandon 5168 >>放弃达隆郡的英雄
.isOnQuest 5168
step
#optional
.abandon 6025 >>放弃未竟的事业
.isOnQuest 6025
step
#phase 6
#ah
.goto Eastern Plaguelands,80.937,58.515
+|cRXP_WARN_如果你购买了|r|T133614:0|t[黑铁碎片]|cRXP_WARN_/|r|T134139:0|t[元素之核]|cRXP_WARN_/|r|T133571:0|t[地穴魔的碎块]|cRXP_WARN_/|r|T133724:0|t[白骨碎片]|cRXP_WARN_/|r|T136074:0|t[蛮荒之叶]|cRXP_WARN_请从你的邮件中取出. 如果没有购买任何物品, 请跳过此步骤|r
.itemcount 22529,<30 
.itemcount 22526,<30 
.itemcount 22525,<30 
.itemcount 22527,<30 
.itemcount 22528,<30 
step
#phase 6
#ah
#completewith 5TurnIns
>>|cRXP_WARN_如果你的声望不足以接受这些任务, 请在附近的亡灵怪物身上刷怪, 直到你与银色黎明达到友好声望|r
.reputation 529,friendly
step
#phase 6
#ah
#optional
.goto Eastern Plaguelands,81.200,59.000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱茵|r交谈
.accept 9136 >>接任务: |cRXP_WARN_蛮荒之叶|r
.turnin 9136 >>交任务: |cRXP_FRIENDLY_蛮荒之叶|r
.itemcount 22529,30
.target Rayne
step
#phase 6
#ah
#optional
.goto Eastern Plaguelands,81.505,58.556
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_猎手雷奥普德|r交谈
.accept 9124 >>接任务: |cRXP_WARN_地穴追猎者护甲的材料……|r
.turnin 9124 >>交任务: |cRXP_FRIENDLY_地穴追猎者护甲的材料……|r
.itemcount 22525,30
.target Huntsman Leopold
step
#phase 6
#ah
#optional
.goto Eastern Plaguelands,81.428,58.507
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杀手洛汗|r交谈
.accept 9126 >>接任务: |cRXP_WARN_骨镰的材料|r
.turnin 9126 >>交任务: |cRXP_FRIENDLY_骨镰的材料|r
.itemcount 22526,30
.target Rohan the Assassin
step
#phase 6
#ah
#optional
.goto Eastern Plaguelands,81.523,58.269
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师安吉拉·杜萨图斯|r交谈
.accept 9128 >>接任务: |cRXP_WARN_元素交易|r
.turnin 9128 >>交任务: |cRXP_FRIENDLY_元素交易|r
.itemcount 22527,30
.target Archmage Angela Dosantos
step
#phase 6
#ah
#optional
#label 5TurnIns
.goto Eastern Plaguelands,81.798,58.079
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔法克斯|r交谈
.accept 9131 >>接任务: |cRXP_WARN_无畏护甲的材料|r
.turnin 9131 >>交任务: |cRXP_FRIENDLY_无畏护甲的材料|r
.itemcount 22528,30
.target Korfax, Champion of the Light

step
.goto Eastern Plaguelands,80.22,57.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔吉亚|r交谈
.fly Badlands >>飞往荒芜之地
.target Georgia
.zoneskip Badlands
.dungeon BRD
step
#completewith KargathBRDQuests
+你现在将开始接受黑石深渊的任务
>>黑石深渊是一个非常复杂的地下城. 为了以最高效的方式完成所有任务, 需要在通关途中离开副本去提交或接受后续任务, 这样才能在一次运行中完成全部任务
>>尽量确保所有队员都完成相同的主要任务及前置任务, 并预留2到3小时的游戏时间
.dungeon BRD

step
.goto Badlands,3.77,47.47
>>点击|cRXP_PICK_通缉告示|r
.accept 4081 >>接任务: |cRXP_WARN_格杀勿论：黑铁矮人|r
.dungeon BRD
step
.goto Badlands,3.31,48.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑德哈特|r交谈
>>|cRXP_WARN_他可能正在卡加斯附近的山间巡逻, 找到他或等他回来|r
.accept 3906 >>接任务: |cRXP_WARN_不和谐的烈焰|r
.unitscan Thunderheart
.dungeon BRD
step
.goto Badlands,2.90,47.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗法师薇薇安·拉格雷|r交谈
.accept 7201 >>接任务: |cRXP_WARN_最后的元素|r
.accept 4134 >>接任务: |cRXP_WARN_遗失的雷酒秘方|r
.target Shadowmage Vivian Lagrave
.isQuestTurnedIn 3906 
.dungeon BRD
step
.goto Badlands,2.90,47.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗法师薇薇安·拉格雷|r交谈
.accept 4134 >>接任务: |cRXP_WARN_遗失的雷酒秘方|r
.target Shadowmage Vivian Lagrave
.dungeon BRD
step
#label KargathBRDQuests
.goto Badlands,3.03,47.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hierophant 塞朵拉·穆瓦丹尼|r交谈
.accept 4061 >>接任务: |cRXP_WARN_机器的崛起|r
.target Hierophant Theodora Mulvadania
.dungeon BRD
step
#completewith next
+如果队伍中有法师, 请将你的炉石设置为卡加斯！
.dungeon BRD
step
.goto Badlands,3.98,44.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里克|r交谈
.fly Flame Crest >>飞往烈焰峰
.target Gorrik
.zoneskip Burning Steppes
.dungeon BRD

step
.goto Burning Steppes,65.152,23.911
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克斯沃特·尤博格林|r交谈
.accept 4123 >>接任务: |cRXP_WARN_山脉之心|r
.target Maxwort Uberglint
.dungeon BRD
step
.goto Burning Steppes,66.058,21.951
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤卡·斯库比格特|r交谈
.accept 4136 >>接任务: |cRXP_WARN_雷布里·斯库比格特|r
.target Yuka Screwspigot
.dungeon BRD
step
#loop
.goto Burning Steppes,67.37,44.38,0
.goto Burning Steppes,62.74,34.92,60,0
.goto Burning Steppes,57.43,36.36,60,0
.goto Burning Steppes,53.03,39.25,60,0
.goto Burning Steppes,59.19,40.17,60,0
.goto Burning Steppes,63.33,43.19,60,0
.goto Burning Steppes,67.37,44.38,60,0
>>击杀|cRXP_ENEMY_战争掠夺者|r. 击败他们后搜刮其掉落的|cRXP_LOOT_零碎|r
>>|cRXP_WARN_完成此任务将解锁一个可选的BRD任务. 该任务可以跳过|r
.complete 4061,1 
.mob War Reaver
.dungeon BRD
step
.goto Burning Steppes,95.061,31.563
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞勒斯·萨雷芬图斯|r交谈
>>请选择选项:“我向你呈上我的功绩证明, 赛勒斯. ”
.accept 4022 >>接任务: |cRXP_LOOT_烈焰精华|r
.turnin 4022 >>交任务: |cRXP_FRIENDLY_烈焰精华|r
.itemcount 10575,1 
.target Cyrus Therepentous
.isQuestTurnedIn 3481
.dungeon BRD
step
.goto Burning Steppes,95.061,31.563
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞勒斯·萨雷芬图斯|r交谈
>>如果你缺少 |T134430:0|t[黑龙皮] 且无法完成任务, 请与|cRXP_FRIENDLY_Cyrus|r交谈, 并选择选项:“我没有携带任何证明, 赛勒斯. ”
>>这将在小洞穴入口处生成一只54级精英龙. 请确保有队友协助击杀它, 然后击败它以获得 |T134430:0|t[黑龙皮]
>>选择以下选项:“我向你呈上我的功绩证明, 赛勒斯. ”
.collect 10575,1,4022,1 
.accept 4022 >>接任务: |cRXP_LOOT_烈焰精华|r
.turnin 4022 >>交任务: |cRXP_FRIENDLY_烈焰精华|r
.target Cyrus Therepentous
.isQuestAvailable 4022
.dungeon BRD
step
.goto Burning Steppes,95.061,31.563
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞勒斯·萨雷芬图斯|r交谈
.accept 4024 >>接任务: |cRXP_LOOT_烈焰精华|r
.target Cyrus Therepentous
.isQuestTurnedIn 4022
.dungeon BRD

step
#completewith CoreAttunement
.subzone 25 >>前往黑石山
.dungeon BRD
step
#softcoreserver
#softcore
+故意在黑石山的熔岩中死亡, 最好是在熔火之心入口附近
>>此步骤你需要成为 |T132331:0|t[鬼魂] 才能与黑石山内的|cRXP_FRIENDLY_弗兰克罗恩·铸铁|r交谈. 完成任务后, 请在尸体处复活
.goto 1415,48.624,64.186
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗兰克罗恩·铸铁|r交谈
.accept 3801 >>接任务: |cRXP_WARN_黑铁的遗产|r
.turnin 3801 >>交任务: |cRXP_FRIENDLY_黑铁的遗产|r
.accept 3802 >>接任务: |cRXP_WARN_黑铁的遗产|r
.target Franclorn Forgewright
.dungeon BRD
step
#hardcoreserver
.goto 1415,48.656,64.134
.cast 417803 >>|cRXP_WARN_点击|r|T136215:0|t[余烬之视]|cRXP_WARN_debuff的|r|cRXP_PICK_火盆|r以获得|r|r
.dungeon BRD
step
#hardcoreserver
.goto 1415,48.624,64.186
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗兰克罗恩·铸铁|r交谈
>>|cRXP_WARN_你必须拥有|r|T136215:0|t[余烬之光视觉]|cRXP_WARN_debuff 才能看见他|r
.accept 3801 >>接任务: |cRXP_WARN_黑铁的遗产|r
.turnin 3801 >>交任务: |cRXP_FRIENDLY_黑铁的遗产|r
.accept 3802 >>接任务: |cRXP_WARN_黑铁的遗产|r
.target Franclorn Forgewright
.dungeon BRD
step
#label CoreAttunement
.goto 1415,48.409,63.815
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛索斯·天痕|r交谈
.accept 7848 >>接任务: |cRXP_WARN_熔火之心的传送门|r
.target Lothos Riftwaker
.dungeon BRD
step
>>击杀|cRXP_ENEMY_征服者派隆|r
>>|cRXP_ENEMY_征服者派隆|r|cRXP_WARN_在BRD副本入口外巡逻|r
.complete 3906,1 
.mob Overmaster Pyron
.isOnQuest 3906
.dungeon BRD
step
#label EnterBRD1
.subzone 1584 >>进入黑石深渊副本
.dungeon BRD
step
>>击杀|cRXP_ENEMY_铁砧怒吼矮人|r
.complete 4081,1 
.mob +Anvilrage Guardsman
.complete 4081,2 
.mob +Anvilrage Warden
.complete 4081,3 
.mob +Anvilrage Footman
.isOnQuest 4081
.dungeon BRD
step
#completewith next
+返回卡加斯
.dungeon BRD
step
.goto Badlands,3.31,48.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑德哈特|r交谈
>>|cRXP_WARN_他可能正在卡加斯附近的山间巡逻, 找到他或等他回来|r
.turnin 3906 >>交任务: |cRXP_FRIENDLY_不和谐的烈焰|r
.unitscan Thunderheart
.isQuestComplete 3906
.dungeon BRD
step
.goto Badlands,3.31,48.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑德哈特|r交谈
>>|cRXP_WARN_他可能正在卡加斯附近的山间巡逻, 找到他或等他回来|r
.accept 3907 >>接任务: |cRXP_WARN_不和谐的火焰|r
.unitscan Thunderheart
.isQuestTurnedIn 3906
.dungeon BRD
step
.goto Badlands,3.03,47.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hierophant 塞朵拉·穆瓦丹尼|r交谈
.turnin 4061 >>交任务: |cRXP_FRIENDLY_机器的崛起|r
.target Hierophant Theodora Mulvadania
.isQuestComplete 4061
.dungeon BRD
step
.goto Badlands,3.03,47.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hierophant 塞朵拉·穆瓦丹尼|r交谈
.accept 4062 >>接任务: |cRXP_WARN_机器的崛起|r
.target Hierophant Theodora Mulvadania
.isQuestTurnedIn 4061
.dungeon BRD
step
.goto Badlands,5.81,47.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_军官高图斯|r交谈
.turnin 4081 >>交任务: |cRXP_FRIENDLY_格杀勿论：黑铁矮人|r
.target Warlord Goretooth
.isQuestComplete 4081
.dungeon BRD
step
.goto Badlands,5.96,47.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|cRXP_FRIENDLY_神射手贾拉玛弗|r交谈
.accept 3981 >>接任务: |cRXP_WARN_指挥官哥沙克|r
.target Galamav the Marksman
.isQuestTurnedIn 3906
.dungeon BRD
step
.goto Badlands,3.97,46.77
>>点击|cRXP_PICK_通缉告示|r
.accept 4082 >>接任务: |cRXP_WARN_格杀勿论：高阶黑铁军官|r
.isQuestTurnedIn 4081
.dungeon BRD
step
.goto Badlands,25.95,44.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁特维尔·沃拉图斯|r交谈
.turnin 4062 >>交任务: |cRXP_FRIENDLY_机器的崛起|r
.accept 4063 >>接任务: |cRXP_WARN_机器的崛起|r
.target Lotwil Veriatus
.isQuestTurnedIn 4061
.dungeon BRD
step
#label EnterBRD2
.subzone 1584 >>返回黑石山并进入黑石深渊副本
.dungeon BRD
step
#completewith WhatsGoingOn
>>击杀|cRXP_ENEMY_火元素|r 和|cRXP_ENEMY_石像鬼|r, 掠夺它们以获取|cRXP_LOOT_元素精华|r
>>|cRXP_WARN_这个任务无需立即完成|r
.complete 7201,1 
.isOnQuest 7201
.dungeon BRD
step
#completewith next
+完成“法律之环”Boss事件后, 沿着隧道出口向上前进, 立即右转, 翻越“法律之环”的顶部, 前往宝库
.dungeon BRD
step
>>在安全墙内获取|cRXP_LOOT_山脉之心|r. 它需要15秒才能刷新
>>有一个技巧可以让你在不打开保险箱的情况下获取战利品. 请查看下面的链接, 了解具体操作方法
.complete 4123,1 
.link https://youtu.be/694e1n_aiKY >>点击此处查看如何获取山脉之心
.isOnQuest 4123
.dungeon BRD
step
>>击杀|cRXP_ENEMY_弗诺斯·达克维尔|r. 击败他后搜刮|cRXP_LOOT_铁胆之锤|r
.complete 3802,1 
.target Fineous Darkvire
.isOnQuest 3802
.dungeon BRD
step
>>击杀|cRXP_ENEMY_伊森迪奥斯|r
.complete 3907,1 
.target Lord Incendius
.isOnQuest 3907
.dungeon BRD
step
>>跑回法环上方附近
>>点击|cRXP_PICK_弗兰克罗恩·铸铁的雕像|r
.turnin 3802 >>交任务: |cRXP_FRIENDLY_黑铁的遗产|r
.isQuestComplete 3802
.dungeon BRD
step
#completewith next
>>击杀|cRXP_ENEMY_铁砧怒吼矮人|r
.complete 4082,1 
.mob +Anvilrage Medic
.complete 4082,2 
.mob +Anvilrage Soldier
.complete 4082,3 
.mob +Anvilrage Officer
.isOnQuest 4082
.dungeon BRD
step
>>前往入口处的暗炉大门
>>击杀|cRXP_ENEMY_Bael'Gar|r
.use 11231 >>|cRXP_WARN_使用|r|T134430:0|t[特殊的黑龙皮] |cRXP_WARN_在他尸体上|r
.complete 4024,1 
.mob Bael'Gar
.isOnQuest 4024
.dungeon BRD
step
>>完成击杀|cRXP_ENEMY_Anvilrage 侏儒|r
.complete 4082,1 
.mob +Anvilrage Medic
.complete 4082,2 
.mob +Anvilrage Soldier
.complete 4082,3 
.mob +Anvilrage Officer
.isOnQuest 4082
.dungeon BRD
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官哥沙克|r交谈
>>如果你的队伍中没有潜行者, 可能需要击杀|cRXP_ENEMY_审讯官格斯塔恩|r以获取|cRXP_LOOT_监狱牢房钥匙|r来打开大门
>>|cRXP_WARN_确保所有队员在此步骤中关闭自动接受功能！RestedXP 已在此步骤中关闭自动接受功能|r
.turnin 3981 >>交任务: |cRXP_FRIENDLY_指挥官哥沙克|r
.accept 3982,1 >>接任务: |cRXP_WARN_[What Is Going On?]|r
.target Commander Gor'shak
.dungeon BRD
step
>>保卫|cRXP_FRIENDLY_指挥官哥沙克|r不受来袭的|cRXP_ENEMY_铁砧战锤矮人|r的攻击
.complete 3982,1 
.target Commander Gor'shak
.isQuestTurnedIn 3981
.dungeon BRD
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官哥沙克|r交谈
.turnin 3982 >>交任务: |cRXP_FRIENDLY_出了什么事？|r
.accept 4001 >>接任务: |cRXP_WARN_[What Is Going On?]|r
.target Commander Gor'shak
.isQuestTurnedIn 3981
.dungeon BRD
step
#label WhatsGoingOn
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡兰·巨锤|cRXP_FRIENDLY_卡兰·巨锤|r交谈并聆听他的故事
>>|cRXP_WARN_他位于大厅对面, 与|r|cRXP_FRIENDLY_指挥官哥沙克相邻|r
.complete 4001,1 
.target Kharan Mighthammer
.skipgossip
.isQuestTurnedIn 3981
.dungeon BRD
step
#completewith next
+前往永望镇, 然后飞往奥格瑞玛. 如果你有法师, 请让他帮你开一个通往奥格瑞玛的传送门
.dungeon BRD
step
.goto Orgrimmar,31.74,37.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
.turnin 4001 >>交任务: |cRXP_FRIENDLY_出了什么事？|r
.accept 4002 >>接任务: |cRXP_WARN_东部王国|r
.target Thrall
.isQuestTurnedIn 3982
.dungeon BRD
step
.goto Orgrimmar,31.74,37.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t再次与|cRXP_FRIENDLY_萨尔|r交谈
.complete 4002,1
.target Thrall
.isQuestTurnedIn 3982
.dungeon BRD
step
.goto Orgrimmar,31.74,37.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
.turnin 4002 >>交任务: |cRXP_FRIENDLY_东部王国|r
.accept 4003 >>接任务: |cRXP_WARN_拯救公主|r
.target Thrall
.isQuestTurnedIn 3982
.dungeon BRD
step
#completewith EnterBRD3
+如果你把炉石设在卡加斯, 就直接传送过去. 如果没有设置, 就乘坐飞艇前往荆棘谷, 然后从那里飞行前往目的地
.dungeon BRD
step
.goto Badlands,3.31,48.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑德哈特|r交谈
>>|cRXP_WARN_他可能正在卡加斯附近的山间巡逻, 找到他或等他回来|r
.turnin 3907 >>交任务: |cRXP_FRIENDLY_不和谐的火焰|r
.unitscan Thunderheart
.isQuestComplete 3907
.dungeon BRD
step
.goto Badlands,2.90,47.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗法师薇薇安·拉格雷|r交谈
.turnin 7201 >>交任务: |cRXP_FRIENDLY_最后的元素|r
.target Shadowmage Vivian Lagrave
.isQuestComplete 7201
.dungeon BRD
step
.goto Badlands,5.81,47.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_军官高图斯|r交谈
.turnin 4082 >>交任务: |cRXP_FRIENDLY_格杀勿论：高阶黑铁军官|r
.target Warlord Goretooth
.isQuestComplete 4082
.dungeon BRD
step
#label EnterBRD3
.subzone 1584 >>进入黑石深渊
.dungeon BRD
step
#completewith PrincessSaved
>>击杀|cRXP_ENEMY_火元素|r 和|cRXP_ENEMY_石像鬼|r, 掠夺它们以获取|cRXP_LOOT_元素精华|r
.complete 7201,1 
.isOnQuest 7201
.dungeon BRD
step
>>击杀 |cRXP_ENEMY_傀儡统帅阿格曼奇|r. 击败他后拾取他的 |cRXP_LOOT_头颅|r
>>击杀|cRXP_ENEMY_Golems|r. 击杀后搜刮他们的|cRXP_LOOT_Elemental Cores|r
.complete 4063,1 
.mob +Golem Lord Argelmach
.complete 4063,2 
.mob +Wrath Hammer Construct
.dungeon BRD
step
#completewith next
>>进入酒吧后, 前往左侧的小房间. 穿过酒吧时切勿攻击任何中立怪物
>>点击3个|cRXP_PICK_雷霆啤酒桶|r将其摧毁, 迫使|cRXP_ENEMY_霍尔雷·黑须|r和他的3名|cRXP_ENEMY_黑须帮派成员|r出现并交战
>>击杀|cRXP_ENEMY_霍尔雷·黑须|r. 击败他后搜刮出|cRXP_LOOT_遗失的雷酒秘方|r
.complete 4134,1 
.target Hurley Blackbreath
.isOnQuest 4134
.dungeon BRD
step
>>进入酒吧后, 前往左侧的小房间. 穿过酒吧时切勿攻击任何中立怪物
>>击杀|cRXP_ENEMY_雷布里·斯库比格特|r. 击败他后拾取他的|cRXP_LOOT_头|r
>>要与|cRXP_ENEMY_雷布里·斯库比格特|r互动, 需让坦克与其对话, 随后将他连同他的|cRXP_ENEMY_小弟们|r带入放置酒桶的房间
.complete 4136,1 
.target Ribbly Screwspigot
.skipgossip
.isOnQuest 4136
.dungeon BRD
step
>>进入酒吧后, 前往左侧的小房间. 穿过酒吧时切勿攻击任何中立怪物
>>点击3个|cRXP_PICK_雷霆啤酒桶|r将其摧毁, 迫使|cRXP_ENEMY_霍尔雷·黑须|r和他的3名|cRXP_ENEMY_黑须帮派成员|r出现并交战
>>击杀|cRXP_ENEMY_霍尔雷·黑须|r. 击败他后搜刮出|cRXP_LOOT_遗失的雷酒秘方|r
.complete 4134,1 
.isOnQuest 4134
.dungeon BRD
step
>>在熔火之心副本传送门外的地面上拾取|cRXP_LOOT_熔火碎片|r
.complete 7848,1 
.isOnQuest 7848
.dungeon BRD
step
>>击杀|cRXP_ENEMY_达格兰·索瑞森大帝|r
>>|cRXP_WARN_你必须不要杀死|cRXP_ENEMY_铁炉堡公主茉艾拉·铜须|r, 才能完成并提交此任务|r
>>|cRXP_WARN_让一名队员风筝|r|cRXP_ENEMY_铁炉堡公主茉艾拉·铜须|r, 同时其他队员击杀|r|cRXP_ENEMY_达格兰·索瑞森大帝|r|r
.complete 4003,1 
.isOnQuest 4003
.dungeon BRD
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡公主茉艾拉·铜须交谈|cRXP_FRIENDLY_铁炉堡公主茉艾拉·铜须|r
.turnin 4003 >>交任务: |cRXP_FRIENDLY_拯救公主|r
.accept 4004 >>接任务: |cRXP_WARN_拯救公主？|r
.target Princess Moira Bronzebeard
.isQuestComplete 4003
.dungeon BRD
step
#label PrincessSaved
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡公主茉艾拉·铜须交谈|cRXP_FRIENDLY_铁炉堡公主茉艾拉·铜须|r
.accept 4004 >>接任务: |cRXP_WARN_拯救公主？|r
.target Princess Moira Bronzebeard
.isQuestTurnedIn 4003
.dungeon BRD
step
#completewith KargathTurnins
+回到卡加斯或传送
.dungeon BRD
step
.goto Badlands,2.90,47.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗法师薇薇安·拉格雷|r交谈
.turnin 4134 >>交任务: |cRXP_FRIENDLY_遗失的雷酒秘方|r
.target Shadowmage Vivian Lagrave
.isQuestComplete 4134
.dungeon BRD
step
.goto Badlands,2.90,47.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗法师薇薇安·拉格雷|r交谈
.turnin 7201 >>交任务: |cRXP_FRIENDLY_最后的元素|r
.target Shadowmage Vivian Lagrave
.isQuestComplete 7201
.dungeon BRD
step
#label KargathTurnins
.goto Badlands,25.95,44.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁特维尔·沃拉图斯|r交谈
.turnin 4063 >>交任务: |cRXP_FRIENDLY_机器的崛起|r
.target Lotwil Veriatus
.isQuestTurnedIn 4062
.dungeon BRD
step
.goto Badlands,3.98,44.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里克|r交谈
.fly Flame Crest >>飞往烈焰峰
.target Gorrik
.zoneskip Burning Steppes
.dungeon BRD
step
.goto Burning Steppes,65.152,23.911
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克斯沃特·尤博格林|r交谈
.turnin 4123 >>交任务: |cRXP_FRIENDLY_山脉之心|r
.target Maxwort Uberglint
.isQuestComplete 4123
.dungeon BRD
step
.goto Burning Steppes,66.058,21.951
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤卡·斯库比格特|r交谈
.turnin 4136 >>交任务: |cRXP_FRIENDLY_雷布里·斯库比格特|r
.target Yuka Screwspigot
.isQuestComplete 4136
.dungeon BRD
step
.goto Burning Steppes,95.061,31.563
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞勒斯·萨雷芬图斯|r交谈
.turnin 4024 >>交任务: |cRXP_FRIENDLY_烈焰精华|r
.target Cyrus Therepentous
.dungeon BRD
.isQuestComplete 4024
step
.goto 1415,48.409,63.815
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛索斯·天痕|r交谈
>>|cRXP_WARN_你可以现在提交, 也可以下次去黑石山时再交|r
.turnin 7848 >>交任务: |cRXP_FRIENDLY_熔火之心的传送门|r
.target Lothos Riftwaker
.isQuestComplete 7848
.dungeon BRD
step
#completewith next
+前往永望镇, 然后飞往奥格瑞玛. 如果你有法师, 请让他帮你开一个通往奥格瑞玛的传送门
.dungeon BRD
step
.goto Orgrimmar,31.74,37.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
.turnin 4004 >>交任务: |cRXP_FRIENDLY_拯救公主？|r
.target Thrall
.isQuestTurnedIn 4003
.dungeon BRD
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 59-59 冬泉谷/希利苏斯 I
#displayname 59-59 冬泉谷/希利苏斯 I \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南(50-60级)
#next 59-60 冬泉谷/希利苏斯 II
step
#completewith ChillyHorns
+飞行或传送前往永望镇
.zoneskip Winterspring
.dungeon BRD
step
#completewith ChillyHorns
.hs >>传送至永望镇
.use 6948
.zoneskip Winterspring
.dungeon !BRD
step
#label ChillyHorns
.goto Winterspring,61.60,38.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Felnok|r交谈
.accept 4809 >>接任务: |cRXP_WARN_冰风奇美拉角|r
.target Felnok Steelspring
step
.goto Winterspring,61.93,38.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Storm|r交谈
.accept 5056 >>接任务: |cRXP_WARN_希洛塔姆|r
.target Storm Shadowhoof
.group
step
.goto Winterspring,60.90,37.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌米|r交谈
.accept 977 >>接任务: |cRXP_LOOT_雪怪计划！|r
.target Umi Rumplesnicker
step << Hunter
#completewith next
.goto Winterspring,60.389,37.916
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿兹雷比|r交谈
.stable >>将你的宠物安置在马厩里. 你很快就会驯服一只 |cRXP_ENEMY_冬泉鸣枭|r
.target Azzleby
.zoneskip Winterspring,1
step << Hunter
.goto Winterspring,57.8,26.4,70,0
.goto Winterspring,59.6,18.0
>>|cRXP_WARN_对|cRXP_ENEMY_冬泉鸣枭|r施放 |T132164:0|t[驯服野兽]|cRXP_WARN_, 以驯服它|r
.train 3666 >>|cRXP_WARN_用它攻击怪物来学习|r|T132140:0|t[利爪(等级8)]
.link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
.mob Winterspring Screecher
.zoneskip Winterspring,1
step << Hunter
#completewith next
.subzone 2255 >>前往永望镇
step << Hunter
.goto Winterspring,60.389,37.916
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌布雷克·火拳|r交谈
.stable >>召唤你的宠物
.target Azzleby
.zoneskip Winterspring,1
step
#completewith next
#loop
.goto Winterspring,51.64,11.34,0
.goto Winterspring,50.54,14.27,50,0
.goto Winterspring,48.52,12.15,50,0
.goto Winterspring,49.72,8.84,50,0
.goto Winterspring,48.54,7.89,50,0
.goto Winterspring,49.67,7.03,50,0
.goto Winterspring,51.94,9.31,50,0
.goto Winterspring,51.64,11.34,50,0
>>击杀|cRXP_ENEMY_霜刃豹|r. 击败后可获得 |T133298:0|t[|cRXP_LOOT_神圣的霜刃豹肉|r]
.collect 12733,1,5056,1 
.mob Frostsaber Pride Watcher
.mob Frostsaber Huntress
.mob Frostsaber Stalker
.mob Frostsaber Cub
.mob Frostsaber
.group 0
step
.goto Winterspring,49.68,9.75
.use 12733 >>将 |T133298:0|t[|cRXP_LOOT_神圣的霜刃豹肉|r] 放在石头上
>>击杀出现时的希洛塔姆
.complete 5056,1 
.unitscan Shy-Rotam
.group 3
step
#loop
.goto Winterspring,64.00,22.60,0
.goto Winterspring,64.00,22.60,50,0
.goto Winterspring,65.60,23.20,50,0
.goto Winterspring,67.60,22.60,50,0
.goto Winterspring,65.60,19.60,50,0
.goto Winterspring,63.60,16.20,50,0
.goto Winterspring,65.60,19.60,50,0
.goto Winterspring,64.00,20.80,50,0
>>击杀|cRXP_ENEMY_狂暴枭兽|r. 击败它们后可获得 |T133298:0|t[|cRXP_LOOT_蓝羽项链|r], 使用它来接受任务
.complete 4721,1 
.collect 12558,1,4721,1 
.accept 4882 >>接任务: |cRXP_WARN_守护秘密|r
.use 12558
.mob Berserk Owlbeast
step
#completewith next
>>击杀|cRXP_ENEMY_冬泉巨熊怪|r和|cRXP_ENEMY_冬泉萨满祭司|r和|cRXP_ENEMY_冬泉巢穴守卫|r
>>|cRXP_WARN_如果竞争过于激烈, 可跳过此步骤|r
.complete 8464,1 
.mob +Winterfall Shaman
.complete 8464,2 
.mob +Winterfall Den Watcher
.complete 8464,3 
.mob +Winterfall Ursa
step
.goto Winterspring,69.62,38.31
>>击杀|cRXP_ENEMY_冬泉酋长|r. 搜刮其尸体获得 |T133740:0|t[|cRXP_LOOT_潦草的日志|r], 使用该物品接受任务
>>|cRXP_WARN_先击杀|r|cRXP_ENEMY_冬泉萨满祭司|r|cRXP_WARN_第一个, 然后重置以确保安全. 如果可以, 请使用你的进攻类冷却技能和控制技能；他的冰霜冲击伤害很高|r
.complete 5121,1 
.collect 12842,1,5123 
.accept 5123 >>接任务: |cRXP_LOOT_最后一片|r
.use 12842
.mob Winterfall Shaman
.unitscan High Chief Winterfall
.group 2
step
#loop
.goto Winterspring,67.60,34.10,0
.goto Winterspring,67.60,34.10,50,0
.goto Winterspring,66.40,34.30,50,0
.goto Winterspring,65.90,35.30,50,0
.goto Winterspring,66.60,36.30,50,0
.goto Winterspring,67.50,35.50,50,0
.goto Winterspring,68.40,35.70,50,0
.goto Winterspring,68.30,37.30,50,0
.goto Winterspring,67.50,37.90,50,0
.goto Winterspring,66.80,37.30,50,0
.goto Winterspring,65.60,37.70,50,0
.goto Winterspring,66.70,39.10,50,0
.goto Winterspring,68.00,39.40,50,0
.goto Winterspring,68.80,37.70,50,0
.goto Winterspring,68.40,35.70,50,0
>>击杀|cRXP_ENEMY_冬泉巨熊怪|r和|cRXP_ENEMY_冬泉萨满祭司|r和|cRXP_ENEMY_冬泉巢穴守卫|r
>>|cRXP_WARN_如果竞争过于激烈, 可跳过此步骤|r
.complete 8464,1 
.mob +Winterfall Shaman
.complete 8464,2 
.mob +Winterfall Den Watcher
.complete 8464,3 
.mob +Winterfall Ursa
step
#loop
.goto Winterspring,66.50,41.70,0
.goto Winterspring,66.50,41.70,40,0
.goto Winterspring,64.90,40.20,40,0
.goto Winterspring,65.90,43.60,40,0
.goto Winterspring,66.20,45.80,40,0
.goto Winterspring,67.60,45.60,40,0
.goto Winterspring,67.60,43.80,40,0
.goto Winterspring,67.20,43.00,40,0
.goto Winterspring,67.60,41.90,40,0
.goto Winterspring,68.40,41.50,40,0
.goto Winterspring,69.00,41.30,40,0
.goto Winterspring,69.50,40.00,40,0
.goto Winterspring,69.80,41.80,40,0
.goto Winterspring,70.10,42.00,40,0
.goto Winterspring,70.30,40.80,40,0
.goto Winterspring,71.30,40.80,40,0
.goto Winterspring,71.80,39.80,40,0
.goto Winterspring,70.50,38.30,40,0
.goto Winterspring,71.80,39.80,40,0
.goto Winterspring,71.30,40.80,40,0
.goto Winterspring,70.30,40.80,40,0
.goto Winterspring,69.50,40.00,40,0
.goto Winterspring,69.00,41.30,40,0
.goto Winterspring,68.40,41.50,40,0
>>击杀|cRXP_ENEMY_冰蓟雪人王|r, 直到你获得|cRXP_LOOT_完美的雪人角|r
.complete 977,1 
.mob Ice Thistle Patriarch
.mob Ice Thistle Matriarch
step
#loop
.goto Winterspring,67.60,48.20,0
.goto Winterspring,67.60,48.20,60,0
.goto Winterspring,66.20,52.40,60,0
.goto Winterspring,63.60,47.20,60,0
.goto Winterspring,61.60,45.00,60,0
.goto Winterspring,58.20,45.00,60,0
.goto Winterspring,57.40,46.60,60,0
.goto Winterspring,55.40,49.00,60,0
.goto Winterspring,55.20,46.40,60,0
.goto Winterspring,48.60,45.00,60,0
.goto Winterspring,44.80,42.20,60,0
.goto Winterspring,44.00,36.00,60,0
.goto Winterspring,48.00,36.60,60,0
.goto Winterspring,49.40,34.40,60,0
.goto Winterspring,54.00,36.80,60,0
.goto Winterspring,56.60,25.60,60,0
.goto Winterspring,55.60,22.40,60,0
.goto Winterspring,58.00,19.80,60,0
.goto Winterspring,60.60,23.60,60,0
.goto Winterspring,66.40,26.80,60,0
.goto Winterspring,65.60,32.60,60,0
.goto Winterspring,62.40,36.20,60,0
.goto Winterspring,61.20,41.60,60,0
>>击杀永望镇北方的冰风奇美拉. 从它们身上获取角(Horns)
.complete 4809,1 
.mob Fledgling Chillwind
.mob Chillwind Chimaera
.mob Chillwind Ravager
step << Shaman
#completewith next
.hs >>炉石或星界传送回永望镇
step << Shaman
.goto Winterspring,61.36,38.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vizzie|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Vizzie
step
.goto Winterspring,61.6,38.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Felnok|r交谈
.turnin 4809 >>交任务: |cRXP_FRIENDLY_冰风奇美拉角|r
.target Felnok Steelspring
step
.goto Winterspring,61.93,38.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Storm|r交谈
.turnin 5056 >>交任务: |cRXP_FRIENDLY_希洛塔姆|r
.target Storm Shadowhoof
.isQuestComplete 5056
.group
step
.goto Winterspring,60.90,37.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌米|r交谈
.turnin 977 >>交任务: |cRXP_FRIENDLY_雪怪计划！|r
.accept 5163 >>接任务: |cRXP_LOOT_雪怪计划！|r
.target Umi Rumplesnicker
step
.goto Winterspring,61.50,38.60
.use 12928 >>在|cRXP_FRIENDLY_莱加奇|r 身上使用|T133003:0|t[机械雪人]
.complete 5163,1 
.target Legacki
step << !Shaman
.goto Winterspring,61.36,38.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vizzie|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Vizzie
step
#completewith next
.goto Winterspring,31.30,45.20,60 >>返回|cRXP_FRIENDLY_Donova|r
step
.goto Winterspring,31.30,45.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donova|r交谈
.turnin 5121 >>交任务: |cRXP_FRIENDLY_冬泉酋长|r
.turnin 5123 >>交任务: |cRXP_FRIENDLY_最后一片|r
.accept 5128 >>接任务: |cRXP_LOOT_熊怪酋长的话|r
.target Donova Snowden
.isQuestComplete 5121
.group
step
.goto Winterspring,31.30,45.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donova|r交谈
.turnin 5123 >>交任务: |cRXP_FRIENDLY_最后一片|r
.accept 5128 >>接任务: |cRXP_LOOT_熊怪酋长的话|r
.target Donova Snowden
.isOnQuest 5123
.group
step
.goto Winterspring,31.30,45.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donova|r交谈
.accept 5128 >>接任务: |cRXP_LOOT_熊怪酋长的话|r
.target Donova Snowden
.isQuestTurnedIn 5128
.group
step
.goto Winterspring,27.736,34.499
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔法|r交谈
.turnin 8464 >>交任务: |cRXP_FRIENDLY_冬泉熊怪的活动|r
.target Salfa
.isQuestComplete 8464
step << !Druid
#completewith RabineSaturna
.goto Winterspring,27.40,33.64,40,0
.goto Winterspring,25.70,31.93,40,0
.goto Winterspring,25.35,31.36,40,0
.goto Winterspring,26.36,28.04,40,0
.goto Winterspring,26.61,24.49,40,0
.goto Winterspring,26.59,24.17
.zone Moonglade >>前往: |cRXP_PICK_月光林地|r
step << Druid
#completewith RabineSaturna
.cast 18960 >>施放 |T135758:0|t[传送:月光林地]
.zoneskip Moonglade
step << Druid
#optional
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 22829 >>训练你的职业法术
.target Loganaar
.xp <56,1
.xp >58,1
step << Druid
#label DruidTraining10
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 9850 >>训练你的职业法术
.target Loganaar
.xp <58,1
step
#label RabineSaturna
.goto Moonglade,51.70,45.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉比恩|r交谈
.turnin 1123 >>交任务: |cRXP_FRIENDLY_拉比恩·萨图纳|r
.accept 1124 >>接任务: |cRXP_WARN_废土|r
.target Rabine Saturna
step
.goto Moonglade,51.68,45.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉比恩·萨图纳|r交谈, 然后继续他的对话流程
>>|cRXP_WARN_如果“恐惧之槌”对话不可用, 请跳过此步骤. 该对话将在你曾前往恐惧之槌的户外区域或在任何时间发现过恐惧之槌时可用|r
.accept 5527 >>接任务: |cRXP_WARN_净化之匣|r
.target Rabine Saturna
.skipgossip
step
.goto Moonglade,32.10,66.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法斯托恩|r交谈
.fp Moonglade >>获取月光林地的飞行路径 << !Druid
.fly Felwood>>飞往费伍德森林
.target Faustron
step
.goto Felwood,34.80,52.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Trull|r交谈
.turnin 4721 >>交任务: |cRXP_FRIENDLY_冬泉谷的枭兽|r
.turnin 4882 >>交任务: |cRXP_FRIENDLY_守护秘密|r
.accept 4883 >>接任务: |cRXP_WARN_守护秘密|r
.target Trull Failbane
.isQuestComplete 4721
step
.goto Felwood,34.80,52.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Trull|r交谈
.turnin 4882 >>交任务: |cRXP_FRIENDLY_守护秘密|r
.accept 4883 >>接任务: |cRXP_WARN_守护秘密|r
.target Trull Failbane
step
.goto Felwood,51.14,81.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科雷克·望天|r交谈
.turnin 5128 >>交任务: |cRXP_FRIENDLY_熊怪酋长的话|r
.target Kelek Skykeeper
.isQuestTurnedIn 5123
.group
step
#hardcoreserver
.goto Felwood,51.35,81.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾瑞丹|r交谈
.turnin 4084 >>交任务: |cRXP_FRIENDLY_银爪铁心|r
.accept 4005 >>接任务: |cRXP_WARN_亚奎门塔斯|r 
.target Eridan Bluewind
.isQuestTurnedIn 3912
step
#completewith next
.hs >>回到冬泉谷
.use 6948
.cooldown item,6948,>0,1
step
.goto Winterspring,60.47,36.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤格雷克|r交谈
.fly Azshara>>飞往艾萨拉
.target Yugrek
.cooldown item,6948,>0,1
.zoneskip Azshara
step
#completewith next
.subzone 431 >>前往裂树岗哨
.cooldown item,6948,<0,1
step
.goto Ashenvale,73.18,61.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔格拉|r交谈
.fly Azshara>>飞往艾萨拉
.target Vhulgra
.cooldown item,6948,<0,1
.zoneskip Azshara
step
.goto Azshara,22.50,51.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰迪加|r交谈
.turnin 3564 >>交任务: |cRXP_FRIENDLY_安德隆的报酬|r
.target Jediga
.isOnQuest 3564
step << !Mage
.goto Azshara,22.00,49.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克隆姆|r交谈
.fly Thunder Bluff>>前往: |cRXP_PICK_雷霆崖|r
.target Kroum
.zoneskip Thunder Bluff
step << Mage
.cast 3566 >>施放 |T135765:0|t[传送:雷霆崖]
.zoneskip Thunder Bluff
step << Mage
.goto Thunder Bluff,25.18,20.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thurston|r交谈
.train 10157 >>训练你的职业法术
.target Thurston Xane
.xp <56,1
.xp >58,1
step << Mage
#optional
.goto Thunder Bluff,25.18,20.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thurston|r交谈
.train 10054 >>训练你的职业法术
.target Thurston Xane
.xp <58,1
step
#ah
#completewith next
.goto Thunder Bluff,45.22,59.40
+如果你之前购买了足够的布料, 请前往邮箱领取以下物品:
.collect 2592,60 
.collect 4306,60 
.collect 4338,60 
.collect 14047,60 
step
#ah
.goto Thunder Bluff,43.3,42.8
>>|cRXP_WARN_禁用任何会自动上交声望物品的其他插件, 否则之后会被提示重新购买布料|r
>>如果捐赠所需的布料不足, 可从拍卖行购买每种布料各3堆
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉姆斯塔格|r交谈
.turnin 7820 >>交任务: |cRXP_FRIENDLY_捐献毛料|r
.turnin 7821 >>交任务: |cRXP_FRIENDLY_捐献丝绸|r
.turnin 7822 >>交任务: |cRXP_FRIENDLY_捐献魔纹布|r
.turnin 7823 >>交任务: |cRXP_FRIENDLY_捐献符文布|r
.target Auctioneer Stampi
.target Rumstag Proudstrider
step
.goto Thunder Bluff,75.80,31.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与纳拉(|cRXP_FRIENDLY_Nara|r)交谈
.turnin 4987 >>交任务: |cRXP_FRIENDLY_雕文橡木枝|r
.turnin 4883 >>交任务: |cRXP_FRIENDLY_守护秘密|r
.target Nara Wildmane
step << Hunter
.goto Thunder Bluff,59.11,86.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 14305 >>训练你的职业法术
.target Urek Thunderhorn
.xp <56,1
.xp >58,1
step << Hunter
#optional
.goto Thunder Bluff,59.11,86.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
.train 14322 >>训练你的职业法术
.target Urek Thunderhorn
.xp <58,1
step << Warrior
.goto Thunder Bluff,57.56,85.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
.train 20662 >>训练你的职业法术
.target Ker Ragetotem
.xp <56,1
.xp >58,1
step << Warrior
#optional
.goto Thunder Bluff,57.56,85.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
.train 11597 >>训练你的职业法术
.target Ker Ragetotem
.xp <58,1
step << Shaman
.goto Thunder Bluff,22.84,21.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 10432 >>训练你的职业法术
.target Tigor Skychaser
.xp <56,1
.xp >58,1
step << Shaman
#optional
.goto Thunder Bluff,22.84,21.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
.train 10473 >>训练你的职业法术
.target Tigor Skychaser
.xp <58,1
step << Priest
.goto Thunder Bluff,24.56,22.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马拉凯|r交谈
.train 10929 >>训练你的职业法术
.target Malakai Cross
.xp <56,1
.xp >58,1
step << Priest
#optional
.goto Thunder Bluff,24.56,22.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马拉凯|r交谈
.train 10947 >>训练你的职业法术
.target Malakai Cross
.xp <58,1
step << Druid
.goto Thunder Bluff,76.46,27.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
.train 22829 >>训练你的职业法术
.target Turak Runetotem
.xp <56,1
.xp >58,1
step << Druid
#optional
.goto Thunder Bluff,76.46,27.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
.train 9850 >>训练你的职业法术
.target Tura
.xp <58,1
step
.goto Thunder Bluff,47.02,49.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Tanaris>>飞往塔纳利斯
.target Tal
.zoneskip Tanaris
step
.goto Tanaris,51.56,26.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特兰雷克|r交谈
.accept 4504 >>接任务: |cRXP_LOOT_极度粘稠的沥青|r
.target Tran'rek
step
.goto Tanaris,51.10,26.90
.use 12928 >>在|cRXP_FRIENDLY_斯普琳科|r上使用|T133003:0|t[机械雪人]
.complete 5163,2 
.target Sprinkle
step
.goto Tanaris,50.90,27.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pestlezugg|r交谈
.accept 4507 >>接任务: |cRXP_LOOT_捕捉皇后|r
.target Alchemist Pestlezugg
.group
step
#hardcoreserver
#completewith next
.goto Tanaris,68.98,41.63
.subzone 1336 >>前往失落的拉格里湾
.isQuestTurnedIn 4084
step
#hardcoreserver
#completewith next
#label SummonAquementas
.goto Tanaris,70.43,49.90
.cast 13978 >>|cRXP_WARN_使用|r|T133742:0|t[阿奎尔之书]|cRXP_WARN_在迷失拉格湾内的石质召唤圈召唤|cRXP_ENEMY_亚奎门塔斯|r|r
.timer 15,Aquementas RP
.use 11617 
.use 11169 
.isQuestTurnedIn 4084
step
#hardcoreserver
.goto Tanaris,70.43,49.93
>>击杀|cRXP_ENEMY_亚奎门塔斯|r
.complete 4005,1 
.use 11617 
.use 11169 
.mob Aquementas
.isQuestTurnedIn 4084
step
.goto Tanaris,51.60,25.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Un'Goro Crater >>飞往安戈洛环形山
.target Bulkrek Ragefist
.zoneskip Un'Goro Crater
step
#hardcoreserver
.goto Un'Goro Crater,41.92,2.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_J.D. 科琳|r交谈
.turnin 4005 >>交任务: |cRXP_FRIENDLY_亚奎门塔斯|r 
.accept 3961 >>接任务: |cRXP_WARN_林克的冒险|r 
.target J.D. Collie
.isQuestComplete 4005
step
#hardcoreserver
#optional
.goto Un'Goro Crater,41.92,2.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_J.D. 科琳|r交谈
.accept 3961 >>接任务: |cRXP_WARN_林克的冒险|r 
.target J.D. Collie
.isQuestTurnedIn 4005
step
#hardcoreserver
.goto Un'Goro Crater,44.66,8.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林克|r交谈
.turnin 3961 >>交任务: |cRXP_FRIENDLY_林克的冒险|r 
.accept 3962 >>接任务: |cRXP_WARN_结伴而行|r 
.target Linken
.isQuestTurnedIn 4005
.group
step
#hardcoreserver
.goto Un'Goro Crater,44.66,8.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林克|r交谈
.turnin 3961 >>交任务: |cRXP_FRIENDLY_林克的冒险|r 
.target Linken
step
.goto Un'Goro Crater,43.70,9.40
.use 12928 >>在|cRXP_FRIENDLY_奎克希尔|r身上使用|T133003:0|t[机械雪人]
.complete 5163,3 
.target Quixxil
step
#loop
.goto Un'Goro Crater,47.20,14.70,0
.goto Un'Goro Crater,47.20,14.70,60,0
.goto Un'Goro Crater,48.10,17.70,60,0
.goto Un'Goro Crater,49.80,20.60,60,0
.goto Un'Goro Crater,51.30,23.90,60,0
.goto Un'Goro Crater,53.60,22.70,60,0
.goto Un'Goro Crater,54.50,27.00,60,0
.goto Un'Goro Crater,52.20,27.60,60,0
.goto Un'Goro Crater,49.20,31.20,60,0
.goto Un'Goro Crater,48.00,36.30,60,0
.goto Un'Goro Crater,46.60,30.50,60,0
.goto Un'Goro Crater,48.20,24.70,60,0
.goto Un'Goro Crater,47.80,20.50,60,0
.goto Un'Goro Crater,43.70,21.10,60,0
.goto Un'Goro Crater,41.30,21.00,60,0
>>击杀|cRXP_ENEMY_焦油元素|r. 从它们身上获取|cRXP_LOOT_极度粘稠的沥青|r
>>|cRXP_WARN_小心|r|cRXP_ENEMY_焦油兽王|r|cRXP_WARN_cast 纠缠根须|r << !Warrior !Rogue !Shaman
>>|cRXP_WARN_请注意, |r|cRXP_ENEMY_焦油兽王|r|cRXP_WARN_施放缠绕根须. |r|cRXP_ENEMY_焦油兽|r|cRXP_WARN_被击中时可使你眩晕4秒|r << Warrior/Rogue/Shaman
.complete 4504,1 
.mob Tar Beast
.mob Tar Creeper
.mob Tar Lord
.mob Tar Lurker
step << skip
#loop
.goto Un'Goro Crater,56.6,18.4,0
.goto Un'Goro Crater,51.6,34.8,40,0
.goto Un'Goro Crater,51.6,30.6,40,0
.goto Un'Goro Crater,47.6,26.8,40,0
.goto Un'Goro Crater,45.2,22.8,40,0
.goto Un'Goro Crater,54.0,18.6,40,0
.goto Un'Goro Crater,56.6,18.4,40,0
.use 12288 >>让一个|cRXP_ENEMY_原生软泥怪|r 在战斗中击中你, 然后使用 |T132622:0|t[堕落软泥怪]
>>击杀|cRXP_ENEMY_巨大的软泥怪|r, 拾取其|cRXP_LOOT_融合的软泥怪样本|r
>>|cRXP_WARN_你只能使用该任务物品一次. 先让软泥怪攻击你, 再释放自己的软泥怪|r
.complete 4642,1 
.mob Primal Ooze
.unitscan Gargantuan Ooze
.isOnQuest 4642
step
#hardcoreserver
.isOnQuest 3962
#completewith next
>>|cRXP_WARN_前往火羽岭顶端|r
.cast 14247 >>|cRXP_WARN_在你的副手装备|r|T135467:0|t[亚奎门塔斯的银图腾]|r
>>|cRXP_WARN_使用|r|T135467:0|t[亚奎门塔斯的银图腾] |cRXP_WARN_对 |cRXP_ENEMY_火焰使者|r施放, 以驱散他的光环. 他的光环会将你击退, 并且在战斗中可能多次重新施放. 确保你或队伍成员随时准备好使用|r|T135467:0|t[亚奎门塔斯的银图腾]
.use 11522 
.group 3
step
#hardcoreserver
.isOnQuest 3962
.goto Un'Goro Crater,49.401,49.305
>>|cRXP_WARN_使用|r|T135467:0|t[亚奎门塔斯的银图腾], |cRXP_WARN_目标: |r |cRXP_ENEMY_火焰使者|r来驱散他的光环|r
>>击杀|cRXP_ENEMY_火焰使者|r
.complete 3962,1 
.use 11522 
.mob Blazerunner
.group 3
step
#hardcoreserver
.isOnQuest 3962
.goto Un'Goro Crater,50.279,49.973
>>打开|cRXP_PICK_华丽宝箱|r. 从中获取|cRXP_LOOT_金色火焰|r
.complete 3962,2 
.group
step
.goto Un'Goro Crater,50.15,79.98,40,0
.goto Un'Goro Crater,49.74,82.52,30,0
.goto Un'Goro Crater,45.19,82.20,30,0
.goto Un'Goro Crater,43.41,80.98
>>深入异种虫巢, 抵达一个圆形房间中的高大水晶处
.use 11833 >>使用你的 |T134809:0|t[格里什皇后诱引剂] 召唤 |cRXP_ENEMY_格里什蜂后|r. 击杀她后, 搜刮她的 |cRXP_LOOT_格里什皇后的大脑|r
>>|cRXP_WARN_通过将怪物引诱至走廊, 可避免新一波敌人仇恨锁定你. 根据你的击杀速度, 走廊巡逻怪可能在第二波结束后刷新|r
.complete 4507,1 
.group 2
step
#completewith next
.goto Silithus,88.09,23.43,70,0
.goto Un'Goro Crater,30.15,10.41,70,0
.goto Un'Goro Crater,25.14,12.71,70,0
.goto Silithus,81.87,18.93
.zone Silithus >>前往: |cRXP_PICK_希利苏斯|r
step
.goto Silithus,81.87,18.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱耶·星击|r交谈
.turnin 1124 >>交任务: |cRXP_FRIENDLY_废土|r
.accept 1125 >>接任务: |cRXP_WARN_南风村的灵魂|r
.target Layo Starstrike
step
#completewith end
.xpto60hc >>一旦你获得足够的经验值达到60级, 请跳转到指南的第2部分

step
#phase 4
.goto Silithus,51.80,38.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店二楼的|cRXP_FRIENDLY_Beetix|r交谈
.accept 8277 >>接任务: |cRXP_LOOT_沙漠中的剧毒|r
.target Beetix Ficklespragg
step
#phase 4
.goto Silithus,51.30,38.20
>>点击|cRXP_PICK_通缉告示|r
.accept 8283 >>接任务: |cRXP_LOOT_通缉：死亡弯钩|r
.group
step
#phase 4
#completewith next
.goto Silithus,51.15,38.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Proudhorn|r交谈
.accept 8280 >>接任务: |cRXP_LOOT_保护补给线|r
.target Windcaller Proudhorn
step
#phase 4
.goto Silithus,49.60,37.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Larksbane|r交谈
.accept 8284 >>接任务: |cRXP_LOOT_暮光的秘密|r
.target Geologist Larksbane
step
#phase 4
.goto Silithus,49.20,34.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛拉利斯|r交谈
.accept 8304 >>接任务: |cRXP_LOOT_亲爱的纳塔莉亚|r
.target Commander Mar'alith
step
#phase 4
.goto Silithus,48.57,37.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博尔|r交谈
.accept 8318 >>接任务: |cRXP_LOOT_秘密交流|r
.target Bor Wildmane
step
#phase 4
#completewith s1
>>击杀|cRXP_ENEMY_掘泥打击者|r
.complete 8280,1 
.mob Dredge Stalker
step
#phase 4
#completewith s1
>>击杀|r石鞭蝎|r和|r掠沙蜘蛛|r. 击杀后搜刮它们的|r蛰刺|r和|r毒牙|r
.complete 8277,1 
.mob +Stonelash Scorpid
.complete 8277,2 
.mob +Sand Skitterer
step
#completewith Spirits
.use 20461 >>留意 |T133463:0|t[|cRXP_LOOT_布莱恩·铜须的信|r], 它由|h|cRXP_ENEMY_蜂巢阿希无人机|r掉落. 如果掉落后, 请使用它来开启任务
.collect 20461,1,8308 
.accept 8308 >>接任务: |cRXP_WARN_布莱恩·铜须的信|r
step
#completewith next
>>杀死|cRXP_ENEMY_被折磨的德鲁伊|r和|cRXP_ENEMY_被折磨的哨兵|r
>>|cRXP_WARN_当心！他们有很大几率在|r|cRXP_ENEMY_Hive'Ashi Drone|r|cRXP_WARN_死亡后刷新|r
>>|cRXP_WARN_确保一次只拉一个！|r
.complete 1125,1 
.mob +Tortured Druid
.complete 1125,2 
.mob +Tortured Sentinel
step
.goto Silithus,63.22,55.35
>>在小屋内搜刮|cRXP_PICK_覆满灰尘的箱子|r以获得|cRXP_LOOT_净化之匣|r
.complete 5527,1 
.isOnQuest 5527
step
#label Spirits
#loop
.goto Silithus,61.60,48.60,0
.goto Silithus,61.60,48.60,50,0
.goto Silithus,63.80,48.60,50,0
.goto Silithus,63.60,51.60,50,0
.goto Silithus,62.60,55.60,50,0
.goto Silithus,62.60,58.60,50,0
.goto Silithus,60.00,55.80,50,0
.goto Silithus,60.60,52.80,50,0
>>杀死|cRXP_ENEMY_被折磨的德鲁伊|r和|cRXP_ENEMY_被折磨的哨兵|r
>>|cRXP_WARN_当心！他们有很大几率在|r|cRXP_ENEMY_Hive'Ashi Drone|r|cRXP_WARN_死亡后刷新|r
>>|cRXP_WARN_确保一次只拉一个！|r
.complete 1125,1 
.mob +Tortured Druid
.complete 1125,2 
.mob +Tortured Sentinel
step
.goto Silithus,81.87,18.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱耶·星击|r交谈
.turnin 1125 >>交任务: |cRXP_FRIENDLY_南风村的灵魂|r
.target Layo Starstrike
step
.goto Silithus,81.87,18.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱耶·星击|r交谈
.accept 1126 >>接任务: |cRXP_WARN_塔中之巢|r
.target Layo Starstrike
.group
step
#completewith next
.use 20461 >>留意 |T133463:0|t[|cRXP_LOOT_布莱恩·铜须的信|r], 它由|h|cRXP_ENEMY_蜂巢阿希无人机|r掉落. 如果掉落后, 请使用它来开启任务
.collect 20461,1,8308 
.accept 8308 >>接任务: |cRXP_WARN_布莱恩·铜须的信|r
.group 0
step
.goto Silithus,60.22,52.55
>>点击塔顶的|cRXP_PICK_Gooey Nest|r
>>击杀刷新的两个|cRXP_ENEMY_迪菲亚伏击者|r, 从他们身上搜刮出一个|cRXP_LOOT_异种蝎粘液包裹的物体|r
>>|cRXP_WARN_三个|r|cRXP_ENEMY_Hive'Ashi 无人机|r|cRXP_WARN_将在你进入塔楼底层时出现！|r
.complete 1126,1 
.mob Hive'Ashi Drone
.mob Hive'Ashi Ambusher
.group 2
step
.goto Silithus,81.87,18.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱耶·星击|r交谈
.turnin 1126 >>交任务: |cRXP_FRIENDLY_塔中之巢|r
.accept 6844 >>接任务: |cRXP_WARN_档案管理员阿姆伯尔|r
.target Layo Starstrike
.isQuestComplete 1126
.group
step
.goto Silithus,81.87,18.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱耶·星击|r交谈
.accept 6844 >>接任务: |cRXP_WARN_档案管理员阿姆伯尔|r
.target Layo Starstrike
.isQuestTurnedIn 1126
.group
step
#phase 4
#label s1
#loop
.goto Silithus,19.50,21.10,0
.goto Silithus,19.50,21.10,50,0
.goto Silithus,20.10,15.50,50,0
.goto Silithus,21.50,12.80,50,0
.goto Silithus,21.70,9.40,50,0
.goto Silithus,24.10,9.80,50,0
.goto Silithus,26.60,13.30,50,0
.goto Silithus,24.10,15.50,50,0
.goto Silithus,21.50,22.00,50,0
>>拾取地面上的蓝色|cRXP_PICK_发光石板|r, 以获得|cRXP_LOOT_暮光石板碎片|r
.complete 8284,1 
step
#phase 4
#completewith next
>>击杀|cRXP_ENEMY_掘泥打击者|r
.complete 8280,1 
.mob Dredge Stalker
step
#phase 4
#loop
.goto Silithus,51.60,16.40,0
.goto Silithus,51.60,16.40,70,0,0
.goto Silithus,54.60,13.20,70,0,0
.goto Silithus,58.40,13.60,70,0,0
.goto Silithus,62.60,16.60,70,0,0
.goto Silithus,61.40,21.60,70,0,0
.goto Silithus,63.20,24.00,70,0,0
.goto Silithus,64.80,28.20,70,0,0
.goto Silithus,67.60,32.00,70,0,0
.goto Silithus,60.60,30.60,70,0,0
.goto Silithus,56.40,32.80,70,0,0
.goto Silithus,53.00,28.00,70,0,0
.goto Silithus,54.80,21.80,70,0,0
>>击杀|r石鞭蝎|r和|r掠沙蜘蛛|r. 击杀后搜刮它们的|r蛰刺|r和|r毒牙|r
.complete 8277,1 
.mob +Stonelash Scorpid
.complete 8277,2 
.mob +Sand Skitterer
step
#phase 4
#loop
.goto Silithus,63.20,24.00,0
.goto Silithus,51.60,16.40,70,0,0
.goto Silithus,54.60,13.20,70,0,0
.goto Silithus,58.40,13.60,70,0,0
.goto Silithus,62.60,16.60,70,0,0
.goto Silithus,61.40,21.60,70,0,0
.goto Silithus,63.20,24.00,70,0,0
.goto Silithus,64.80,28.20,70,0,0
.goto Silithus,67.60,32.00,70,0,0
.goto Silithus,60.60,30.60,70,0,0
.goto Silithus,56.40,32.80,70,0,0
.goto Silithus,53.00,28.00,70,0,0
.goto Silithus,54.80,21.80,70,0,0
>>击杀|cRXP_ENEMY_掘泥打击者|r
.complete 8280,1 
.mob Dredge Stalker
step
#phase 4
.goto Silithus,49.70,37.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Larksbane|r交谈
.turnin 8284 >>交任务: |cRXP_FRIENDLY_暮光的秘密|r
.accept 8285 >>接任务: |cRXP_LOOT_沙漠隐士|r
.target Geologist Larksbane
step
#phase 4
.goto Silithus,51.15,38.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Proudhorn|r交谈
.turnin 8280 >>交任务: |cRXP_FRIENDLY_保护补给线|r
.accept 8281 >>接任务: |cRXP_LOOT_确保安全|r
.target Windcaller Proudhorn
step
#phase 4
.goto Silithus,51.80,38.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Beetix|r交谈
.turnin 8277 >>交任务: |cRXP_FRIENDLY_沙漠中的剧毒|r
.accept 8278 >>接任务: |cRXP_LOOT_诺格的最后一线希望|r
.target Beetix Ficklespragg
step
#phase 4
#completewith Deserter
.goto Silithus,39.31,53.33,0
>>击杀|cRXP_ENEMY_掘泥摧毁者|r
>>|cRXP_WARN_不要关注这个；你可以稍后再完成|r
.complete 8281,1 
.mob Dredge Crusher
step
#phase 4
#completewith Deserter
.goto Silithus,62.52,64.00,0
.goto Silithus,50.73,55.99,0
>>击杀|r石鞭掠夺者|r和|r石鞭巨钳蝎|r. 击杀后可从它们身上获得|r蛰刺|r
>>击杀|cRXP_ENEMY_石行蜘蛛|r. 从它们身上搜刮|cRXP_LOOT_毒牙|r
>>|cRXP_WARN_不要关注这个；你可以稍后再完成|r
.complete 8278,1 
.mob +Stonelash Flayer
.complete 8278,2 
.mob +Stonelash Pincer
.complete 8278,3 
.mob +Rock Stalker
step
#phase 4
.goto Silithus,41.30,88.50,10,0
.goto Silithus,40.80,88.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁特加尔·雕石|r和|r|cRXP_FRIENDLY_弗兰卡·石桥|r交谈
.complete 8304,2 
.complete 8304,1 
.target Rutgar Glyphshaper
.target Frankal Stonebridge
.skipgossip
step
.goto Silithus,41.30,88.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t再次与|cRXP_FRIENDLY_鲁特加尔·雕石|r交谈
.turnin 8308 >>交任务: |cRXP_FRIENDLY_布莱恩·铜须的信|r
.target Rutgar Glyphshaper
.isOnQuest 8308
step
#phase 4
#label Deserter
.goto Silithus,67.19,69.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_隐士|r交谈
.turnin 8285 >>交任务: |cRXP_FRIENDLY_沙漠隐士|r
.accept 8279 >>接任务: |cRXP_LOOT_暮光词典|r
.target Hermit Ortell
step
#phase 4
#completewith next
>>击杀|cRXP_ENEMY_掘泥摧毁者|r
.complete 8281,1 
.mob Dredge Crusher
step
#phase 4
#loop
.goto Silithus,62.20,63.20,0
.goto Silithus,62.20,63.20,70,0
.goto Silithus,57.00,59.20,70,0
.goto Silithus,50.80,58.00,70,0
.goto Silithus,47.80,54.60,70,0
.goto Silithus,40.80,50.20,70,0
.goto Silithus,34.60,49.40,70,0
.goto Silithus,36.20,39.40,70,0
.goto Silithus,33.60,34.60,70,0
.goto Silithus,27.80,43.40,70,0
.goto Silithus,33.00,49.00,70,0
.goto Silithus,34.60,53.60,70,0
.goto Silithus,34.60,60.40,70,0
.goto Silithus,34.20,65.40,70,0
.goto Silithus,39.40,64.60,70,0
.goto Silithus,42.60,61.40,70,0
.goto Silithus,48.80,62.40,70,0
.goto Silithus,52.80,63.00,70,0
.goto Silithus,59.00,64.40,70,0
.goto Silithus,62.60,66.20,70,0
>>击杀|cRXP_ENEMY_石鞭巨钳蝎|r. 击杀后可从其身上获得|cRXP_LOOT_蛰刺|r
.complete 8278,2 
.mob Stonelash Pincer
step
#phase 4
#loop
.goto Silithus,62.20,63.20,0
.goto Silithus,62.20,63.20,70,0
.goto Silithus,57.00,59.20,70,0
.goto Silithus,50.80,58.00,70,0
.goto Silithus,47.80,54.60,70,0
.goto Silithus,40.80,50.20,70,0
.goto Silithus,34.60,49.40,70,0
.goto Silithus,36.20,39.40,70,0
.goto Silithus,33.60,34.60,70,0
.goto Silithus,27.80,43.40,70,0
.goto Silithus,33.00,49.00,70,0
.goto Silithus,34.60,53.60,70,0
.goto Silithus,34.60,60.40,70,0
.goto Silithus,34.20,65.40,70,0
.goto Silithus,39.40,64.60,70,0
.goto Silithus,42.60,61.40,70,0
.goto Silithus,48.80,62.40,70,0
.goto Silithus,52.80,63.00,70,0
.goto Silithus,59.00,64.40,70,0
.goto Silithus,62.60,66.20,70,0
>>击杀|cRXP_ENEMY_掘泥摧毁者|r
.complete 8281,1 
.mob Dredge Crusher
step
#phase 4
#loop
.goto Silithus,42.60,86.40,0
.goto Silithus,42.60,86.40,70,0
.goto Silithus,38.60,87.40,70,0
.goto Silithus,38.20,83.20,70,0
.goto Silithus,34.00,76.60,70,0
.goto Silithus,32.00,81.00,70,0
.goto Silithus,27.60,85.20,70,0
.goto Silithus,24.60,82.00,70,0
.goto Silithus,23.40,77.20,70,0
.goto Silithus,27.60,76.40,70,0
.goto Silithus,31.60,74.80,70,0
.goto Silithus,34.60,71.40,70,0
.goto Silithus,38.60,69.20,70,0
.goto Silithus,43.00,68.40,70,0
.goto Silithus,46.80,69.60,70,0
.goto Silithus,44.20,75.60,70,0
.goto Silithus,45.40,80.20,70,0
.goto Silithus,45.40,85.60,70,0
>>击杀|cRXP_ENEMY_石鞭掠夺者|r 和|cRXP_ENEMY_石行蜘蛛|r . 击败它们后拾取其掉落的|cRXP_LOOT_蛰刺|r 和|cRXP_LOOT_毒牙|r
.complete 8278,1 
.mob +Stonelash Flayer
.complete 8278,3 
.mob +Rock Stalker
step
#phase 4
.goto Silithus,51.15,38.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Proudhorn|r交谈
.turnin 8281 >>交任务: |cRXP_FRIENDLY_确保安全|r
.target Windcaller Proudhorn
step
#phase 4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Beetix|r和|cRXP_FRIENDLY_Noggle|r交谈
.turnin 8278 >>交任务: |cRXP_FRIENDLY_诺格的最后一线希望|r
.target +Beetix Ficklespragg
.goto Silithus,51.80,38.51
.accept 8282 >>接任务: |cRXP_LOOT_诺格的背包|r
.target +Noggle Ficklespragg
.goto Silithus,51.62,38.50
step
#phase 4
.goto Silithus,49.20,34.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛拉利斯|r交谈
.turnin 8304 >>交任务: |cRXP_FRIENDLY_亲爱的纳塔莉亚|r
.target Commander Mar'alith
step
#phase 4
#completewith LexiconChapter2
>>击杀|cRXP_ENEMY_暮光异教徒|r. 从他们身上搜刮|cRXP_LOOT_暮光密文信|r
>>|cRXP_ENEMY_暮光守护者|r|cRXP_WARN_, |r|cRXP_ENEMY_领主|r|cRXP_WARN_和|r|cRXP_ENEMY_大师|r|cRXP_WARN_具有极高的爆发潜力|r
.collect 20404,10,8323,1 
.mob Twilight Stonecaller
.mob Twilight Avenger
.mob Twilight Geolord
.mob Twilight Flamereaver
.mob Twilight Master
.mob Twilight Overlord
.mob Twilight Marauder
step
#phase 4
.goto Silithus,40.86,42.22
>>击杀|cRXP_ENEMY_暮光守护者哈弗斯|r. 搜刮其掉落的|cRXP_LOOT_暮光典籍篇章|r
>>他巡逻于塞纳里奥要塞西南方向营地的东侧
>>|cRXP_WARN_小心, 他的爆发伤害非常高|r
.complete 8279,3 
.unitscan Twilight Keeper Havunth
step
#phase 4
.goto Silithus,26.34,36.62
>>击杀|cRXP_ENEMY_暮光守护者玛恩纳|r. 搜刮她的|cRXP_LOOT_暮光典籍篇章|r
>>她巡逻于塞纳里奥要塞西方远处的营地
>>|cRXP_WARN_小心, 她会使用心灵尖啸(瞬间恐惧)|r
.complete 8279,1 
.unitscan Twilight Keeper Mayna
step
#phase 4
#label LexiconChapter2
.goto Silithus,16.08,86.37
>>击杀|cRXP_ENEMY_暮光守护者埃克斯特|r. 搜刮其掉落的|cRXP_LOOT_暮光典籍篇章|r
>>他位于营地后方, 距离塞纳里奥要塞西南很远, 靠近安其拉西北方向
>>|cRXP_WARN_小心, 他有眩晕和致命打击|r
.complete 8279,2 
.unitscan Twilight Keeper Exeter
step
#phase 4
#completewith next
>>战利品|cRXP_LOOT_诺格的背包|r
.complete 8282,1 
.unitscan Deathclasp
.group
step
#phase 4
.goto Silithus,45.00,92.20
>>分开拉怪, 将与|cRXP_ENEMY_死亡弯钩|r一起巡逻的小怪引开. 风筝它们直到|cRXP_ENEMY_死亡弯钩|r重置, 然后击杀
>>击杀|cRXP_ENEMY_死亡弯钩|r. 搜刮他的|cRXP_LOOT_钳子|r. 尽一切可能阻止他靠近至近战范围
>>|cRXP_WARN_这个任务怪物攻击力很高, 并带有可使目标昏迷8秒的中毒减益效果. 如果你不熟悉或未做好准备, 此任务非常危险；必要时请跳过|r
.complete 8283,1 
.mob Stonelash Flayer
.unitscan Deathclasp
.group 3
step
#phase 4
.goto Silithus,44.50,91.40
>>拾取地面上的诺格的背包
.complete 8282,1 
.unitscan Deathclasp
.group
step
#phase 4
.goto Silithus,44.50,91.40
>>拾取地面上的诺格的背包
>>|cRXP_WARN_小心不要激怒死亡弯钩|r
.complete 8282,1 
.unitscan Deathclasp
.solo
step
#phase 4
.goto Silithus,67.20,69.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_隐士|r交谈
.turnin 8279 >>交任务: |cRXP_FRIENDLY_暮光词典|r
.accept 8287 >>接任务: |cRXP_LOOT_摆脱困境|r
.accept 8323 >>接任务: |cRXP_LOOT_真正的信徒|r
.turnin 8323 >>交任务: |cRXP_FRIENDLY_真正的信徒|r
.target Hermit Ortell
step << skip
.goto Silithus,67.20,69.24
.goto Silithus,47.21,37.93,30 >>|cRXP_WARN_跳到洞穴中的一根立着的火把上, 通过注销再登录来执行“登出跳过”|r
.link https://www.youtube.com/watch?v=bFS4TUbJse8&ab_channel=RestedXP >>|cRXP_WARN_点击此处查看示例|r
step
#phase 4
.goto Silithus,51.62,38.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Noggle|r交谈
.turnin 8282 >>交任务: |cRXP_FRIENDLY_诺格的背包|r
.target Noggle Ficklespragg
step
#phase 4
.goto Silithus,50.80,33.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vish|r交谈
.turnin 8283 >>交任务: |cRXP_FRIENDLY_通缉：死亡弯钩|r
.target Vish Kozus
.isQuestComplete 8283
.group
step
#phase 4
.goto Silithus,49.20,34.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛拉利斯|r交谈
.turnin 8287 >>交任务: |cRXP_FRIENDLY_摆脱困境|r
.target Commander Mar'alith
step
#phase 4
#loop
.goto Silithus,38.80,45.40,0
.goto Silithus,38.80,45.40,50,0
.goto Silithus,38.20,43.80,50,0
.goto Silithus,38.80,42.60,50,0
.goto Silithus,40.40,42.40,50,0
.goto Silithus,41.40,45.60,50,0
.goto Silithus,40.00,46.20,50,0
>>击杀|cRXP_ENEMY_暮光异教徒|r. 从他们身上搜刮|cRXP_LOOT_暮光密文信|r
>>|cRXP_ENEMY_暮光守护者|r|cRXP_WARN_, |r|cRXP_ENEMY_领主|r|cRXP_WARN_和|r|cRXP_ENEMY_大师|r|cRXP_WARN_具有极高的爆发潜力|r
.complete 8318,1 
.mob Twilight Stonecaller
.mob Twilight Avenger
.mob Twilight Geolord
.mob Twilight Flamereaver
.mob Twilight Master
.mob Twilight Overlord
.mob Twilight Marauder
step
#phase 4
.goto Silithus,48.57,37.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博尔|r交谈
.turnin 8318 >>交任务: |cRXP_FRIENDLY_秘密交流|r
.target Bor Wildmane
step
.goto Silithus,48.69,36.67,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁克·驯风者|r交谈
.fly Un'Goro >>飞往安戈洛环形山
.target Runk Windtamer
.zoneskip Un'Goro Crater
step
#hardcoreserver
.goto Un'Goro Crater,44.65,8.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林克|r交谈
.turnin 3962 >>交任务: |cRXP_FRIENDLY_结伴而行|r 
.target Linken
.isQuestComplete 3962
.group
step
#completewith end
.goto Un'Goro Crater,45.23,5.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱菲|r交谈
.fly Tanaris >>飞往塔纳利斯
.target Gryfe
.zoneskip Tanaris
step
.goto Tanaris,51.56,26.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特兰雷克|r交谈
.turnin 4504 >>交任务: |cRXP_FRIENDLY_极度粘稠的沥青|r
.target Tran'rek
step
.goto Tanaris,50.88,26.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pestlezugg|r交谈
.turnin 4507 >>交任务: |cRXP_FRIENDLY_捕捉皇后|r
.accept 4509 >>接任务: |cRXP_LOOT_临危不惧|r
.target Alchemist Pestlezugg
.isQuestComplete 4507
.group
step
#label end
.goto Tanaris,50.88,26.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pestlezugg|r交谈
.accept 4509 >>接任务: |cRXP_LOOT_临危不惧|r
.target Alchemist Pestlezugg
.isQuestTurnedIn 4507
.group
]])
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#version 23
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南(50-60级)
#name 59-60 冬泉谷/希利苏斯 II
#displayname 59-60 冬泉谷/希利苏斯 II \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
step
#completewith next
.goto Tanaris,51.60,25.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
.fly Un'Goro Crater >>飞往安戈洛环形山
.target Bulkrek Ragefist
.zoneskip Un'Goro Crater
step
#hardcoreserver
.goto Un'Goro Crater,44.65,8.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林克|r交谈
.turnin 3962 >>交任务: |cRXP_FRIENDLY_结伴而行|r
.target Linken
.isQuestComplete 3962
.group
step
#completewith tanaris
.goto Un'Goro Crater,45.23,5.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱菲|r交谈
.fly Tanaris >>飞往塔纳利斯
.target Gryfe
.zoneskip Tanaris
step
.goto Tanaris,50.88,26.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pestlezugg|r交谈
.turnin 4507 >>交任务: |cRXP_FRIENDLY_捕捉皇后|r
.accept 4509 >>接任务: |cRXP_LOOT_临危不惧|r
.target Alchemist Pestlezugg
.isQuestComplete 4507
.group
step
.goto Tanaris,50.88,26.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pestlezugg|r交谈
.accept 4509 >>接任务: |cRXP_LOOT_临危不惧|r
.target Alchemist Pestlezugg
.isQuestTurnedIn 4507
.group
step
#label tanaris
.goto Tanaris,51.56,26.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特兰雷克|r交谈
.turnin 4504 >>交任务: |cRXP_FRIENDLY_极度粘稠的沥青|r
.target Tran'rek
step
#completewith next
.hs >>传送至永望镇
.use 6948
.zoneskip Winterspring
step
.goto Winterspring,61.36,38.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vizzie|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Vizzie
step
.goto Winterspring,60.88,37.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌米|r交谈
.turnin 5163 >>交任务: |cRXP_FRIENDLY_雪怪计划！|r
.target Umi Rumplesnicker
step << Druid
.cast 18960 >>施放 |T135758:0|t[传送:月光林地]
.zoneskip Moonglade
step << !Druid
#label moonglade
.goto Winterspring,60.47,36.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤格雷克|r交谈
.fly Moonglade>>飞往月光林地
.target Yugrek
.zoneskip Moonglade
step
.goto Moonglade,47.736,39.678,30,0
.goto Moonglade,44.88,35.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿姆伯尔|r交谈
>>|cRXP_FRIENDLY_阿姆伯尔|r|cRXP_WARN_可能正在永夜港巡逻|r
.turnin 6844 >>交任务: |cRXP_FRIENDLY_档案管理员阿姆伯尔|r
.accept 6845 >>接任务: |cRXP_WARN_发现过去的秘密|r
.target Umber
.isQuestTurnedIn 1126
.group
step
.goto Moonglade,51.68,45.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉比恩|r交谈
.turnin 6845 >>交任务: |cRXP_FRIENDLY_发现过去的秘密|r
.target Rabine Saturna
.isQuestTurnedIn 1126
.group
step
.goto Moonglade,51.68,45.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉比恩|r交谈
.turnin 5527 >>交任务: |cRXP_FRIENDLY_净化之匣|r
.target Rabine Saturna
.isQuestComplete 5527
step
.goto Moonglade,47.736,39.678,30,0
.goto Moonglade,44.88,35.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿姆伯尔|r交谈
>>|cRXP_FRIENDLY_阿姆伯尔|r|cRXP_WARN_可能正在永夜港巡逻|r
.accept 1185 >>接任务: |cRXP_WARN_壳中的东西…|r
.turnin 1185 >>交任务: |cRXP_FRIENDLY_壳中的东西…|r
.target Umber
.isQuestTurnedIn 1126
.group
step << !Mage
.goto Moonglade,32.10,66.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法斯托恩|r交谈
.fly Orgrimmar>>飞往奥格瑞玛
.target Faustron
.zoneskip Orgrimmar
step << Mage
.cast 3567 >>施放 |T135759:0|t[传送:奥格瑞玛]
.zoneskip Orgrimmar
step
.goto Orgrimmar,56.50,46.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zilzibin|r交谈
>>|cRXP_WARN_他位于龙脊山的上层|r
.turnin 4509 >>交任务: |cRXP_FRIENDLY_临危不惧|r
.accept 4511 >>接任务: |cRXP_LOOT_临危不惧|r
.target Zilzibin Drumlore
.isQuestTurnedIn 4507
.group
step
#ah
.goto Orgrimmar,63.62,51.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉沙娜|r交谈
>>|cRXP_WARN_禁用任何会自动上交声望物品的其他插件, 否则之后会被提示重新购买布料|r
.turnin 7826 >>交任务: |cRXP_FRIENDLY_捐献毛料|r
.turnin 7827 >>交任务: |cRXP_FRIENDLY_捐献丝绸|r
.turnin 7831 >>交任务: |cRXP_FRIENDLY_捐献魔纹布|r
.turnin 7824 >>交任务: |cRXP_FRIENDLY_捐献符文布|r
.target Rashona Straglash
step
#ah
#completewith next
.goto Orgrimmar,50.68,70.37,0
>>如果你之前购买了足够的布料, 请前往邮箱领取以下物品:
.collect 2592,60 
.collect 4306,60 
.collect 4338,60 
.collect 14047,60 
step
#ah
.goto Orgrimmar,37.69,87.92
>>|cRXP_WARN_禁用任何会自动上交声望物品的其他插件, 否则之后会被提示重新购买布料|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维赫纳|r交谈
.turnin 7833 >>交任务: |cRXP_FRIENDLY_捐献毛料|r
.turnin 7834 >>交任务: |cRXP_FRIENDLY_捐献丝绸|r
.turnin 7835 >>交任务: |cRXP_FRIENDLY_捐献魔纹布|r
.turnin 7836 >>交任务: |cRXP_FRIENDLY_捐献符文布|r
.target Vehena
step
.goto Orgrimmar,49.70,69.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁斯|r交谈
.turnin 4511 >>交任务: |cRXP_FRIENDLY_临危不惧|r
.target Karus
.isQuestTurnedIn 4507
.group
step
.goto Orgrimmar,54.10,68.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里什卡|r交谈
.home >>将你的[炉石]设置为奥格瑞玛
.target Innkeeper Gryshka
step << Mage
.cast 3563 >>传送 |T135766:0|t[传送:幽暗城]
.zoneskip Undercity
step << !Mage
#completewith next
.zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
.zoneskip Durotar
step << !Mage
.goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
.zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
.zoneskip Tirisfal Glades
step
#completewith next
.goto Undercity,47.20,59.69,0
.goto Undercity,47.20,59.69,12,0
.goto Undercity,43.55,68.11,12,0
.goto Undercity,45.20,71.67,12 >>前往|cRXP_FRIENDLY_Cuely|r
step << skip
.goto Undercity,48.50,71.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fuely|r交谈
.turnin 4642 >>交任务: |cRXP_FRIENDLY_融合软泥怪|r
.target Chemist Fuely
step
#completewith next
.goto Tirisfal Glades,61.9,59.1
.zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
.zoneskip Stranglethorn Vale
step
.goto Stranglethorn Vale,32.5,29.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞斯塔|r交谈
.fly Stonard>>飞往斯托纳德
.target Thysta
.zoneskip Swamp of Sorrows
step
.goto Swamp of Sorrows,34.29,66.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.accept 2681 >>接任务: |cRXP_WARN_禁锢我们的石头|r
.target Fallen Hero of the Horde
step
#completewith Stonesthat
+将|cRXP_ENEMY_仆从|r拖向附近的|cRXP_PICK_禁锢之石|r, 然后将其生命值降至1%
+当|cRXP_ENEMY_Servant|r被驱逐时, 点击|cRXP_PICK_禁锢之石|r, 然后将其击杀
step
#completewith StonesAlmostdone
>>击杀|cRXP_ENEMY_阿利斯塔的仆从|r
.complete 2681,3 
.mob Servant of Allistarj
step
#loop
.goto Blasted Lands,49.4,43.6,0
.goto Blasted Lands,43.6,11.8,50,0
.goto Blasted Lands,41.6,14.2,50,0
.goto Blasted Lands,49.4,43.6,50,0
>>击杀|cRXP_ENEMY_格罗尔的仆从|r
.complete 2681,2 
.mob Servant of Grol
step
#loop
.goto Blasted Lands,53.20,59.60,0
.goto Blasted Lands,53.20,59.60,60,0
.goto Blasted Lands,51.80,56.80,60,0
.goto Blasted Lands,53.80,53.60,60,0
.goto Blasted Lands,55.60,51.00,60,0
.goto Blasted Lands,60.00,50.60,60,0
.goto Blasted Lands,62.20,51.60,60,0
.goto Blasted Lands,63.80,55.80,60,0
.goto Blasted Lands,62.20,51.60,60,0
.goto Blasted Lands,60.00,50.60,60,0
.goto Blasted Lands,55.60,51.00,60,0
.goto Blasted Lands,53.80,53.60,60,0
.goto Blasted Lands,51.80,56.80,60,0
>>击杀|cRXP_ENEMY_拉泽里克的仆从|r
.complete 2681,1 
.mob Servant of Razelikh
step
#label StonesAlmostdone
#loop
.goto Blasted Lands,64.8,34.6,0
.goto Blasted Lands,64.6,46.6,50,0
.goto Blasted Lands,64.0,40.6,50,0
.goto Blasted Lands,64.8,34.6,50,0
>>击杀|cRXP_ENEMY_塞文的仆从|r
.complete 2681,4 
.mob Servant of Sevine
step
#label Stonesthat
#loop
.goto Blasted Lands,38.6,34.0,0
.goto Blasted Lands,43.4,40.4,50,0
.goto Blasted Lands,41.6,39.6,50,0
.goto Blasted Lands,38.6,34.0,50,0
>>击杀|cRXP_ENEMY_阿利斯塔的仆从|r
.complete 2681,3 
.mob Servant of Allistarj
step
#completewith next
.zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
step
.goto Blasted Lands,52.76,2.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.turnin 2681 >>交任务: |cRXP_FRIENDLY_禁锢我们的石头|r
.accept 2702 >>接任务: |cRXP_WARN_古代英雄|r
.target Fallen Hero of the Horde
step
.goto Swamp of Sorrows,34.29,66.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t再次与 |cRXP_FRIENDLY_部落英雄的灵魂|r 交谈
.turnin 2702 >>交任务: |cRXP_FRIENDLY_古代英雄|r
.accept 2701 >>接任务: |cRXP_WARN_古代英雄|r
.target Fallen Hero of the Horde
step
.goto Swamp of Sorrows,34.29,66.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最后一次与|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.turnin 2701 >>交任务: |cRXP_FRIENDLY_古代英雄|r
.target Fallen Hero of the Horde
step
.hs >>炉石传送至奥格瑞玛
.use 6948
.zoneskip Orgrimmar
step
#completewith next
.goto Orgrimmar,45.13,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Azshara >>飞往艾萨拉
.target Doras
.zoneskip Azshara
step
#loop
.goto Azshara,55.80,25.90,50,0
.goto Azshara,57.80,26.40,50,0
.goto Azshara,58.00,28.20,50,0
.goto Azshara,59.20,29.60,50,0
.goto Azshara,57.90,31.40,50,0
.goto Azshara,57.00,30.30,50,0
.goto Azshara,56.90,27.50,50,0
.goto Azshara,56.00,29.70,50,0
.goto Azshara,55.40,29.70,50,0
.xp 60 >>练级至60级
]])
