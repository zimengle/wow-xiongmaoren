local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#season 2
#name 1-7 幽影谷 赛季服
#displayname 1-7 幽影谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor NightElf
#next 7-13 泰达希尔 赛季服
step << !NightElf
    #sticky
    #completewith next
    +您已选择适用于暗夜精灵的指南, 请选择与您角色起始区域相同的初始区域
step
    .goto Teldrassil,58.695,44.266
    .target Conservator Ilthalaine
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .accept 456 >>接任务: |cRXP_LOOT_自然的平衡|r
step << Druid/Warrior/Rogue/Hunter/Priest
    .goto Teldrassil,58.88,43.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_BUY_向他出售你的|r|T135005:0|t[衬衫], 并从他那里|cRXP_BUY_购买|r|T135975:0|t[被亵渎要塞的友好预言]|r << Priest
    >>|cRXP_BUY_出售你的|r|T133975:0|t[苹果]|cRXP_BUY_并购买以下符文:|r << Druid
    >>|cRXP_BUY_你的某位供应商 |T133972:0|t|cRXP_LOOT_[硬肉干]|r 并购买|r |T134419:0|t[|cRXP_FRIENDLY_胜利冲刺符文|r] << Warrior
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衫]和 |T132540:0|t[靴子]|cRXP_WARN_(它们无法刻印)|r|cRXP_BUY_并购买|r|T134419:0|t[|cRXP_FRIENDLY_影击符文|r]|cRXP_BUY_以及|r|T134419:0|t[|cRXP_FRIENDLY_斩击符文|r] << Rogue
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衫]和 |T132540:0|t[靴子]|cRXP_WARN_(它们无法刻印)|r|cRXP_BUY_并从他那里购买 |T134419:0|t[|cRXP_FRIENDLY_杀戮命令符文|r]|cRXP_BUY_以及|r|T133739:0|t[|cRXP_FRIENDLY_雄狮之心典籍]|r|r << Hunter
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel
    .collect 209852,1 << Hunter --Rune of Kill Command
    .collect 226401,1 << Hunter --Treatise on the Heart of the Lion
    .collect 208414,1 << Druid --Lunar Idol
    .collect 210500,1 << Druid --Rune of the Stars
    .collect 206989,1 << Druid --Rune of the Sun
    .collect 227749,1 << Druid --Rune of the Falling Star
    .collect 204806,1 << Warrior --Rune of Victory Rush
    .collect 210979,1 << Rogue --Rune of Shadowstep
    .collect 208772,1 << Rogue --Rune of Saber Slash
    >>你很快就会得到剩下的符文
    .target Rune Broker
    .skipgossip
step << Warrior/Rogue/Hunter/Druid/Priest
    .equip 18 >>装备|T134903:0|t[|cRXP_FRIENDLY_月之祭品|r], 30秒后可使用它来训练|T237472:0|t[风暴之怒] << Druid
    .train 402852 >>使用 |T135975:0|t[|cRXP_FRIENDLY_亵渎要塞的预言|r] 来训练 |T237570:0|t[人造人] << Priest
    .train 400105 >>使用|T134419:0|t[|cRXP_FRIENDLY_暗影之击符文|r]来训练|T132323:0|t[暗影之击] << Rogue
    .train 424984 >>使用|T134419:0|t[|cRXP_FRIENDLY_萨伯尔斩符文|r]来训练|T132375:0|t[萨伯尔斩] << Rogue
    .train 403470 >>使用 |T134419:0|t[|cRXP_FRIENDLY_胜利之纹|r] 来训练 |T132342:0|t[胜利冲刺], 你将很快将其刻印 << Warrior
    .train 410111 >>使用|T134419:0|t[|cRXP_FRIENDLY_击杀命令符文|r] << Hunter
    .train 409580 >>使用|T133739:0|t[|cRXP_FRIENDLY_雄狮之心论|r]来训练|T132185:0|t[雄狮之心] << Hunter
    .train 424718 >>使用|T134419:0|t[|cRXP_FRIENDLY_ 星之符文|r]来训练|T135730:0|t[星涌] << Druid
    .train 416044 >>使用|T134419:0|t[|cRXP_FRIENDLY_太阳符文|r]来训练|T236216:0|t[太阳之火] << Druid
    .train 439770 >>使用|T134419:0|t[|cRXP_FRIENDLY_坠星石符文|r]来训练|T236168:0|t[坠星石] << Druid
    .use 205947 << Priest --Prophecy of a Desecrated Citadel
    .use 204806 << Warrior --Rune of Victory Rush
    .use 204795 << Rogue --Rune of Shadowstrike
    .use 208772 << Rogue --Rune of Saber Slash
    .use 209852 << Hunter --Rune of Kill Command
    .use 226401 << Hunter --Treatise on the Heart of the Lion
    .use 208414 << Druid --Lunar Idol
    .use 210500 << Druid --Rune of the Stars
    .use 206989 << Druid --Rune of the Sun
    .use 227749 << Druid --Rune of the Falling Star
    .engrave 7 >>在你的裤子上刻上|T237570:0|t[人造人] << Priest
    .engrave 7 >>在你的裤子上刻上|T236174:0|t[致命一击] << Hunter
    .engrave 7 >>在你的裤子上刻印[Starsurge] |T135730:0|t << Druid
step << Hunter
    #optional
    #sticky
    .aura 409583 >>记得激活你的 |T132185:0|t[雄狮之心]
step << Druid
    #season 2
    #optional
    #sticky
    .train 410061 >>使用角色面板中的|T134903:0|t[|cRXP_FRIENDLY_Lunar Idol|r]来学习|T237472:0|t[风暴之怒的狂怒]
    .engrave 5 >>在你的胸膛上刻下 |T237472:0|t[风暴怒吼的狂怒]
step
    #sticky
    #label balance1
    #completewith GoodProtector
    >>击杀|cRXP_ENEMY_夜刃豹幼崽|r和|cRXP_ENEMY_草刺野猪幼崽|r
    .goto Teldrassil,62.0,42.6,0,0
    .complete 456,1 --Kill Young Nightsaber (x7)
    .complete 456,2 --Kill Young Thistle Boar (x4)
    .mob Young Nightsaber
    .mob Young Thistle Boar
step
    >>击杀怪物后掠夺战利品, 确保至少拥有价值10铜的可出售垃圾物品, 这些物品将用于训练 |T132333:0|t[战斗怒吼]<< Warrior
    .xp 2 >>升级到2级
step << !Warrior !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪兰妮亚·月光|r和|cRXP_FRIENDLY_麦利萨尔·鹿盔|r交谈
    #label GoodProtector
    .accept 4495 >>接任务: |cRXP_LOOT_好朋友|r
    .goto Teldrassil,60.899,41.961
    .accept 458 >>接任务: |cRXP_LOOT_森林守护者|r
	.goto Teldrassil,59.924,42.474
    .target Dirania Silvershine
    .target Melithar Staghelm
step << Warrior
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦利萨尔·鹿盔|r交谈
    #label GoodProtector
    .accept 458 >>接任务: |cRXP_LOOT_森林守护者|r
	.goto Teldrassil,59.924,42.474
    .target Melithar Staghelm
step << Warrior/Rogue
    #season 2
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
	.vendor >>|cRXP_WARN_出售垃圾|r
    .target Keina
step << Rogue
    .goto Teldrassil,59.63,38.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗拉胡恩·影语者|r交谈
    .accept 77573 >>接任务: |cRXP_WARN_抢占二楼|r
    .turnin 77573 >>交任务: |cRXP_FRIENDLY_抢占二楼|r
    .target Frahun Shadewhisper
step << Warrior
    #season 2
    .goto Teldrassil,59.637,38.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莉希亚|r交谈
    .accept 77575 >>接受任务:阴影交织之中
    .turnin 77575 >>交还“阴影之网”
    .trainer >>训练 |T132333:0|t[战斗怒吼]
    .target Alyissia
step << Warrior/Rogue
    .equip 10 >>装备 |T132938:0|t[无光泽的链甲手套] << Warrior
    .engrave 10 >>在你的手套上刻上[胜利冲刺]|T132342:0|t << Warrior
    .use 2385 << Warrior -- Tarnished Chain Gloves
    .equip 10 >>装备 |T132952:0|t[破损的皮手套] << Rogue
    .engrave 10 >>在你的手套上刻上|T132375:0|t[Saber Slash] << Rogue
    .use 2125 << Rogue --Cracked Leather Gloves
step << Warrior/Rogue
    #season 2
    .goto Teldrassil,60.8,42.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_迪兰妮亚·月光|r
    .accept 4495 >>接任务: |cRXP_LOOT_好朋友|r
    .target Dirania Silvershine
step
    >>|cRXP_WARN_确保装备所有能获得的装备, 如果它们掉落的话. 你需要它们来雕刻|r|T134419:0|t|[符文]|r
    >>击杀|cRXP_ENEMY_夜刃豹幼崽|r和|cRXP_ENEMY_草刺野猪幼崽|r
    .goto Teldrassil,62.0,42.6,0,0
    .complete 456,1 --Kill Young Nightsaber (x7)
    .complete 456,2 --Kill Young Thistle Boar (x4)
    .mob Young Nightsaber
    .mob Young Thistle Boar
step
    #requires balance1
	.goto Teldrassil,58.695,44.266
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    >>将|T132939:0|t[手套]作为奖励, 刻印符文于其上 << Druid/Hunter
    >>将|T132611:0|t[护腕]作为奖励, 用来在上面刻上符文 << Priest
    .turnin 456 >>交任务: |cRXP_FRIENDLY_自然的平衡|r
    .target Conservator Ilthalaine
    .accept 457 >>接任务: |cRXP_LOOT_自然的平衡|r
step << Hunter/Rogue/Priest
    .goto Teldrassil,58.88,43.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    >>|cRXP_BUY_出售垃圾并购买以下所有符文:|r << Hunter/Rogue/Priest
    .collect 212552,1 << Priest --Psychosophic Epiphany
    .collect 221481,1 << Priest --Nihilist Epiphany
    .collect 205940,1 << Priest --Memory of a Dark Purpose
    .collect 205951,1 << Priest --Memory of a Troubled Acolyte
    .collect 205932,1 << Priest --Prophecy of a King's Demise
    .collect 206168,1 << Hunter --Rune of the Chimera
    .collect 216770,1 << Hunter --Treatise on Aspect of the Viper
    .collect 210818,1 << Hunter --Rune of Lone Wolf
    .collect 213124,1 << Hunter --Rune of Close Combat
    .collect 226252,1 << Hunter --Rune of the Guerrilla
    .collect 210979,1 << Rogue --Rune of Shadowstep
    .collect 221428,1 << Rogue --Rune of Foul Play
    .collect 227922,1 << Rogue --Rune of the Swashbuckler
    >>你很快就会得到剩下的符文
    .target Rune Broker
    .skipgossip
step << Hunter/Rogue/Priest
    .use 212552 << Priest --Psychosophic Epiphany
    .use 221481 << Priest --Nihilit Epiphany
    .use 205940 << Priest --Memory of a Dark Purpose
    .use 205951 << Priest --Memory of a Troubled Acolyte
    .use 205932 << Priest --Prophecy of a King's Demise
    .use 206168 << Hunter --Rune of the Chimera
    .use 216770 << Hunter --Treatise on Aspect of the Viper
    .use 210818 << Hunter --Rune of Lone Wolf
    .use 213124 << Hunter --Rune of Close Combat
    .use 226252 << Hunter --Rune of the Guerrilla
    .use 210979 << Rogue --Rune of Shadowstep
    .use 221428 << Rogue --Rune of Foul Play
    .use 227922 << Rogue --Rune of the Swashbuckler
    .train 431663 >>使用|T135791:0|t[心灵顿悟]来训练|T136181:0|t[心灵尖刺] << Priest
    .train 431705 >>使用|T135791:0|t[|cRXP_FRIENDLY_Nihilist Epiphany|r]训练|T132886:0|t[虚空地带] << Priest
    .train 425216 >>使用|T136222:0|t[|cRXP_FRIENDLY_黑暗记忆|r]来训练|T237514:0|t[虚空瘟疫] << Priest
    .train 402862 >>使用|T136222:0|t[|cRXP_FRIENDLY_侍僧的回忆|r]来训练|T237545:0|t[忏悔] << Priest
    .train 402849 >>使用|T135975:0|t[|cRXP_FRIENDLY_国王之死的预言|r]来训练|T136149:0|t[暗影之言:死亡] << Priest
    .train 410121 >>使用|T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r]来训练|T236176:0|t[奇美拉射击] << Hunter
    .train 415423 >>使用|T133739:0|t[|cRXP_FRIENDLY_《毒蛇之心》论述|r]来训练|T132160:0|t[毒蛇之心] << Hunter
    .train 410122 >>使用|T134419:0|t[|cRXP_FRIENDLY_独狼符文|r]训练|T132266:0|t[独狼] << Hunter
    .train 416086 >>使用|T134419:0|t[|cRXP_FRIENDLY_近战符文|r]来训练|T132394:0|t[近战专家] << Hunter
    .train 440563 >>使用|T134419:0|t[|cRXP_FRIENDLY_游击符文|r]来训练|T132171:0|t[突袭与撤退] << Hunter
    .train 400101 >>使用 |T134419:0|t[|cRXP_FRIENDLY_ 阴影步符文|r] 来训练 |T132303:0|t[阴影步] << Rogue
    .train 432301 >>使用|T134419:0|t[|cRXP_FRIENDLY_卑鄙行径符文|r]来训练|T236285:0|t[不公平优势] << Rogue
    .train 415922 >>使用|T134419:0|t[|cRXP_FRIENDLY_ 海盗符文|r]来训练|T134538:0|t[火枪] << Rogue
step << Druid
    #sticky
    #optional
    >>|cRXP_WARN_留意任何|r|cRXP_WARN_披风|r|cRXP_WARN_掉落, 装备并刻印|r|T236168:0|t[坠星]|cRXP_WARN_于其上|r
    .engrave 15 >>在你的斗篷上刻上坠星村
step << Hunter
    #sticky
    #optional
    >>|cRXP_WARN_请注意任何|r胸甲/腰带/披风|cRXP_WARN_掉落|r|cRXP_WARN_. 装备它们并刻上相应的符文|r
    .engrave 5 >>在你的胸甲上刻上[独狼]
    .engrave 6 >>刻印 |T132394:0|t[近战专家] 在你的 |T132513:0|t[腰带] 上
    .engrave 15 >>在你的|T133771:0|t[斗篷]上刻上|T132171:0|t[突袭]
step << Rogue
    #sticky
    #optional
    >>|cRXP_WARN_请注意任何|r腰带/披风/护腕|cRXP_WARN_掉落|r|cRXP_WARN_, 装备它们并刻上相应的符文|r
    .engrave 5 >>在你的|T133830:0|t[护腕]上刻上|T236285:0|t[不公平优势]
    .engrave 6 >>在你的|T132513:0|t[腰带]上刻印|T132303:0|t[影步]
    .engrave 15 >>在你的斗篷上刻上霰弹枪
step << Hunter/Druid
    #optional
    #sticky
    .equip 10 >>装备 |T132939:0|t[箭术训练手套]
    .engrave 10 >>在你的手套上刻印|T236176:0|t[幻影射击] << Hunter
    .engrave 10 >>在你的手套上刻上|T236216:0|t[太阳之火] << Druid
    .use 5394
step << NightElf Priest
    #season 2
    .goto Teldrassil,59.6,41.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_简娜·明月|r交谈
    >>|cRXP_BUY_出售垃圾并购买r|T132495:0|t[薄布腰带]|cRXP_BUY_和|r|T132543:0|t[薄布靴]|cRXP_BUY_. 你需要它们来刻印符文|r
    .collect 3599,1 --Thin Cloth Belt (1)
    .collect 2117,1 --Thin Cloth Shoes (1)
    .target Janna Brightmoon
step << NightElf Priest
    #season 2
    .goto Teldrassil,59.174,40.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_珊达|r交谈
    .accept 77574 >>接任务: |cRXP_WARN_艾露恩之思|r
    .turnin 77574 >>交任务: |cRXP_FRIENDLY_艾露恩之思|r
    .target Shanda
step << Priest
    #optional
    #completewith next
    .equip 10 >>装备 |T132961:0|t[破布手套]
    .equip 6 >>装备 |T132495:0|t[薄布腰带]
    .equip 8 >>装备 |T132543:0|t[薄布靴]
    .equip 9 >>装备 |T132611:0|t[蒸汽叶护腕]
    .engrave 10 >>在你的手套上刻印「暗影之言:死」|T136149:0|t
    .engrave 6 >>在你的护腕上刻印「心灵尖刺」|T136181:0|t
    .engrave 8 >>在你的脚上刻印[虚空瘟疫] |T237514:0|t
    .engrave 9 >>在你的护腕上刻印|T132886:0|t[虚空地带]
    .use 711 --Tattered Cloth Gloves
    .use 3599 --Thin Cloth Belt
    .use 2117 --Thin Cloth Shoes
    .use 11187 --Steamleaf Bracers
step << NightElf Priest
    #season 2
    .goto Teldrassil,59.6,40.8
    >>|cRXP_WARN_跳下去|r and talk to|Tinterface/worldmap/chatbubble_64grey.blp:20|t |cRXP_FRIENDLY_Dellylah|r
    .vendor >>|cRXP_BUY_购买 10 个|r|T132794:0|t|cRXP_LOOT_凉爽泉水|r
    .target Dellylah
step
    #label balancetwocomplete
    .goto Teldrassil,59.8,34.1
    >>击杀 |cRXP_ENEMY_癞皮夜刃豹|r和 |cRXP_ENEMY_草刺野猪|r
    .complete 457,1 --Kill Mangy Nightsaber (x7)
    .complete 457,2 --Kill Thistle Boar (x7)
    .mob Mangy Nightsaber
    .mob Thistle Boar
step
    .goto Teldrassil,54.593,32.992
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃沃隆|r交谈
    .turnin 4495 >>交任务: |cRXP_FRIENDLY_好朋友|r
    .target Iverron
    .accept 3519 >>接任务: |cRXP_LOOT_需要帮助的朋友|r
step
    #season 2
    .goto Teldrassil,59.8,34.1
    .xp 3-400 >>刷怪直到距离3级还差400点经验(当前进度500/900)
step
    #completewith next
    .hs >>炉石到幽影谷
step << Hunter
    .goto Teldrassil,57.9,45.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r交谈
    .turnin 458 >>交任务: |cRXP_FRIENDLY_森林守护者|r
    .target Tarindrella
    .accept 459 >>接任务: |cRXP_LOOT_森林守护者|r
step
    #requires balance1
	.goto Teldrassil,58.695,44.266
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .turnin 457 >>交任务: |cRXP_FRIENDLY_自然的平衡|r
    .target Conservator Ilthalaine
	.accept 3116 >>接任务: |cRXP_LOOT_简易符记|r << Warrior
	.accept 3117 >>接任务: |cRXP_LOOT_风化符记|r << Hunter
    .accept 3119 >>接任务: |cRXP_LOOT_神圣符记|r << Priest
step
    .goto Teldrassil,60.899,41.961
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_迪兰妮亚·月光|r
    .turnin 3519 >>交任务: |cRXP_FRIENDLY_需要帮助的朋友|r
    .target Dirania Silvershine
    .accept 3521 >>接任务: |cRXP_LOOT_埃沃隆的解药|r
step << Hunter
    #season 2
    #completewith htraining
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
    >>|cRXP_WARN_确保离开商人后手中还剩1银, 以便能负担|r|T132204:0|t[|cRXP_FRIENDLY_蛇毒之刺|r]. |cRXP_WARN_如果之后无法负担训练费用, 请勿购买此弓|r
	.vendor >>|cRXP_BUY_购买一叠|r|T132382:0|t[劣质箭]
    .vendor >>|cRXP_BUY_购买|r |T135499:0|t[角木弯弓]
    .target Keina
step << Hunter
    #season 2
    #completewith next
    +|cRXP_WARN_装备|r|T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.37
step << !Hunter !Druid !Priest
    #season 2
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
	.vendor >>|cRXP_WARN_出售垃圾|r
    .target Keina
 step << NightElf Warrior
    #season 2
    .goto Teldrassil,59.637,38.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莉希亚|r交谈
    .turnin 3116 >>交任务: |cRXP_FRIENDLY_简易符记|r
    .train 772 >>训练 |T132155:0|t[撕裂]
    .train 100 >>训练 |T132337:0|t[冲锋]
    .target Alyissia
step << Druid/Priest
    #season 2
    #label DTrain4
    .goto Teldrassil,59.602,40.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德林拉尔|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    >>|cRXP_BUY_购买 10|r|T132794:0|t[清凉的泉水]
    .collect 159,10 --Collect Refreshing Spring Water (x10)
    .target Dellylah
step
    .goto Teldrassil,57.807,41.653
    .target Gilshalan Windwalker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔沙兰·风行者|r交谈
    .accept 916 >>接任务: |cRXP_LOOT_树林蜘蛛的毒囊|r
    .target Gilshalan Windwalker
step << Hunter
    .xp 4-40
step << Hunter
    .goto Teldrassil,57.80,40.97,25,0
    .goto Teldrassil,58.659,40.449
    >>攀上奥达希尔之树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿亚娜·远途|r交谈
    .turnin 3117 >>交任务: |cRXP_FRIENDLY_风化符记|r
    .accept 77568 >>接任务: |cRXP_WARN_猎人的力量|r
    .turnin 77568 >>交任务: |cRXP_FRIENDLY_猎人的力量|r
    .train 1978 >>训练毒蛇钉刺
    .target Ayanna Everstride
step
    .goto Teldrassil,57.95,38.20,10,0
    .goto Teldrassil,57.76,37.27,10,0
    .goto Teldrassil,58.21,36.40,10,0
    .goto Teldrassil,58.81,37.83,10,0
    .goto Teldrassil,57.95,38.20
    >>拾取地面上的|cRXP_LOOT_Moonpetal Lilies|r
    .complete 3521,2 --Collect Moonpetal Lily (x4)
step
    #label IchorVenomSac
    .goto Teldrassil,56.8,31.7
    >>击杀|cRXP_ENEMY_树林蜘蛛|r. 击败它们以获取|cRXP_LOOT_毒液|r和|cRXP_LOOT_毒囊|r
    .complete 3521,3 --Collect Webwood Ichor (x1)
    .complete 916,1 --Collect Webwood Venom Sac (x10)
    .mob Webwood Spider
step
    .goto Teldrassil,55.0,43.7
    >>击杀|cRXP_ENEMY_小劣魔|r和|cRXP_ENEMY_劣魔|r. 击败它们后搜刮其掉落的|cRXP_LOOT_魔苔|r和|cRXP_LOOT_魔苔|r
    .complete 3521,1 --Collect Hyacinth Mushroom (x7)
    .complete 459,1 --Collect Fel Moss (x8)
    .mob Grell
    .mob Grellkin
step
    .goto Teldrassil,57.8,45.1
    .target Tarindrella
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r交谈
    >>提示:|cRXP_WARN_领取护腿作为奖励并保留. 稍后你会用它们来刻印符文|r << sod Hunter/sod Rogue/sod Warrior/sod Druid
    .turnin 459 >>交任务: |cRXP_FRIENDLY_森林守护者|r
step
    .goto Teldrassil,60.899,41.961
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_迪兰妮亚·月光|r
    .turnin 3521 >>交任务: |cRXP_FRIENDLY_埃沃隆的解药|r
    .accept 3522 >>接任务: |cRXP_LOOT_埃沃隆的解药|r
    .target Dirania Silvershine
    .xp >7,1
step
    .goto Teldrassil,60.899,41.961
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_迪兰妮亚·月光|r
    .turnin 3521 >>交任务: |cRXP_FRIENDLY_埃沃隆的解药|r
    .target Dirania Silvershine
    .xp <7,1
step << !Hunter
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
	.vendor >>|cRXP_WARN_出售垃圾|r << !Hunter
    .target Keina
step << Hunter
    #season 2
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
	.vendor >>|cRXP_WARN_出售垃圾|r << !Hunter
	.vendor >>|cRXP_BUY_购买 3 或 4 堆|r|T132382:0|t[劣质箭] << Hunter
    .vendor >>|cRXP_BUY_购买|r|T135499:0|t[角木弯弓]|cRXP_BUY_若尚未拥有, 请购买|r << Hunter
    .target Keina
step << Hunter
    #completewith next
    +|cRXP_WARN_装备|r|T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.37
step
    .goto Teldrassil,57.807,41.653
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔沙兰·风行者|r交谈
    .turnin 916 >>交任务: |cRXP_FRIENDLY_树林蜘蛛的毒囊|r
    .target Gilshalan Windwalker
    .accept 917 >>接任务: |cRXP_LOOT_树林蜘蛛的卵|r
    .xp >7,1
step
    .goto Teldrassil,57.807,41.653
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔沙兰·风行者|r交谈
    .turnin 916 >>交任务: |cRXP_FRIENDLY_树林蜘蛛的毒囊|r
    .target Gilshalan Windwalker
    .xp <7,1,ExitRune
step << Hunter/Rogue
    #completewith next
    +|cRXP_WARN_装备|r|T135641:0|t[棘木匕首]
    .use 5392
    .itemcount 5392,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.05
step << Druid
    #season 2
    .goto Teldrassil,57.80,40.97,25,0
    .goto Teldrassil,58.626,40.287
    >>攀上奥达希尔之树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛丹特·硬木|r交谈
	.turnin 3120 >>交任务: |cRXP_FRIENDLY_绿色符记|r
    .train 5177 >>训练 |T136006:0|t[|cRXP_FRIENDLY_Wrath|r] 奖励等级 2
    .target Mardant Strongoak
step
    .goto Teldrassil,54.593,32.992
    .target Iverron
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃沃隆|r交谈
    >>提示:|cRXP_WARN_从他那里拿取裤子作为奖励. 稍后你将用它来刻印符文|r << Priest sod
    .turnin 3522 >>交任务: |cRXP_FRIENDLY_埃沃隆的解药|r
    .isOnQuest 3522
step
    #completewith next
    .goto Teldrassil,56.73,31.17,25 >>进入暗影丝洞窟
    .isOnQuest 917
step
    .goto Teldrassil,57.0,26.4
    >>在洞穴后方地面上拾取一颗|cRXP_LOOT_树林蜘蛛的卵|r
    .complete 917,1 --Collect Webwood Egg (x1)
    .isOnQuest 917
step
	#softcore
	#completewith next
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
    .isOnQuest 917
step
	.goto Teldrassil,57.807,41.653
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔沙兰·风行者|r交谈
    >>提示:|cRXP_WARN_领取此任务的奖励物品“护甲”并装备上. 稍后你将用它来刻印符文|r << Hunter/Rogue
    .turnin 917 >>交任务: |cRXP_FRIENDLY_树林蜘蛛的卵|r
    .target Gilshalan Windwalker
    .isQuestComplete 917
step
    #season 2
    #label ExitRune
    .goto Teldrassil,58.88,43.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>|cRXP_BUY_从商人那里购买所有你需要的|T134419:0|t|cRXP_WARN_[符文]|r|r
    .target Rune Broker
    .skipgossip
step << Priest
    #requires vial1
    .goto Teldrassil,59.2,40.5
    .target Shanda
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊达|r交谈
    .accept 5622 >>接任务: |cRXP_LOOT_月神的恩赐|r
    .turnin 3119 >>交任务: |cRXP_FRIENDLY_神圣符记|r
step
    .goto Teldrassil,61.159,47.644
    .target Porthannius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯萨努斯|r交谈
    .accept 2159 >>接任务: |cRXP_LOOT_多兰纳尔的货物|r
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#season 2
#name 7-13 泰达希尔 赛季服
#displayname 7-13 泰达希尔 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor NightElf
#next 13-20 黑海岸 赛季服


step
    .goto Teldrassil,60.5,56.3
    .target Zenn Foulhoof
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .accept 488 >>接任务: |cRXP_LOOT_赛恩的要求|r
step << Hunter
    #season 2
    #completewith FlankingStrike
    #sticky
    >>任务期间击杀|r巨翼枭|r或|r巨翼恶枭|r. 击败它们后可获得|T134025:0|t|r泰达希尔鸟肉|r
    .collect 208608,1 -- Teldrassil Bird Meat 1/1
    .train 425762,1 --Flanking Strike
step << Warrior
    #season 2
    #completewith zenn
    >>击杀|cRXP_ENEMY_夜刃豹|r或|cRXP_ENEMY_夜刃捕食者|r. 击败它们后可获得|cRXP_LOOT_被斩下的虎头|r
    >>击杀|cRXP_ENEMY_巨翼枭|r 或|cRXP_ENEMY_巨翼恶枭|r, 掠夺其掉落的|cRXP_LOOT_severed owl head|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r 或|cRXP_ENEMY_树林毒蜘蛛|r. 击败它们后可获得|cRXP_LOOT_severed spider head|r
    .collect 208611,1 -- Severed Tiger Head (1)
    .collect 208610,1 -- Severed Owl Head (1)
    .collect 208612,1 -- Severed Spider Head (1)
    .mob Nightsaber
    .mob Nightsaber Stalker
    .mob Strigid Owl
    .mob Strigid Screecher
    .mob Webwood Lurker
    .mob Webwood Venomfang
    .train 403475,1
step
    #sticky
    #completewith zenn
    >>击杀|cRXP_ENEMY_夜刃豹|r. 击败它们后搜刮其|cRXP_LOOT_毒牙|r
    >>击杀|r巨翼枭|cRXP_ENEMY_Strigid Owls|r. 掠夺它们获取|r羽毛|cRXP_LOOT_Feathers|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r. 击杀后搜刮其掉落的|cRXP_LOOT_丝线|r
    .complete 488,1 --Collect Nightsaber Fang (x3)
    .complete 488,2 --Collect Strigid Owl Feather (x3)
    .complete 488,3 --Collect Webwood Spider Silk (x3)
    .mob Nightsaber
    .mob Strigid Owl
    .mob Webwood Lurker
step
    #sticky
	#completewith SoDSpiderLegs
    >>击杀|cRXP_ENEMY_树林潜伏者|r 和|cRXP_ENEMY_树林毒蜘蛛|r , 搜刮它们掉落的|cRXP_LOOT_小蜘蛛腿|r
    >>|cRXP_WARN_你需要这些来完成后续任务|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob Webwood Lurker
    .mob Webwood Venomfang
step
    .goto Teldrassil,56.08,57.72
    .target Syral Bladeleaf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    >>|cRXP_WARN_接受此任务前请确保你有一个空的背包格子|r
    .accept 997 >>接任务: |cRXP_LOOT_德纳兰的泥土|r
step
    .goto Teldrassil,55.954,57.272
    .target Athridas Bearmantle
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .accept 475 >>接任务: |cRXP_LOOT_烦恼之风|r
step << Priest
    .goto Teldrassil,55.564,56.746
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
    .turnin 5622 >>交任务: |cRXP_FRIENDLY_月神的恩赐|r
    .target Laurna Morninglight
    .accept 5621 >>接任务: |cRXP_LOOT_月光之衣|r
	.trainer >>训练你的职业法术
step << Rogue
    .goto Teldrassil,55.508,57.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥蒂亚|r 上楼
    .vendor >>|cRXP_BUY_购买并装备一个|r|T135426:0|t[破损的小飞刀]
    .target Aldia
step
#xprate <1.99 << Hunter/Warrior/Druid
    .goto Teldrassil,55.574,56.948
    .target Tallonkai Swiftroot
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树上的|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .accept 932 >>接任务: |cRXP_LOOT_扭曲的仇恨|r
    .accept 2438 >>接任务: |cRXP_LOOT_翡翠摄梦符|r
step << Hunter/Warrior/Druid
#xprate >1.99
    .goto Teldrassil,55.574,56.948
    .target Tallonkai Swiftroot
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树上的|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .accept 2438 >>接任务: |cRXP_LOOT_翡翠摄梦符|r
step << Hunter
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    >>|cRXP_BUY_购买并装备 a|r|T135499:0|t[角木弯弓]
    >>|cRXP_BUY_购买|r|T132382:0|t[劣质箭] |cRXP_BUY_直到你的箭袋装满|r
    .collect 2506,1 --Collect Hornwood Recurve Bow
    .target Jeena Featherbow
    .money <0.0285
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.38
step << Hunter
    #season 0
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    .vendor >>|cRXP_BUY_购买|r|T132382:0|t[劣质箭] |cRXP_BUY_直到你的箭袋装满|r
    .target Jeena Featherbow
step << Hunter
    #season 2
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    .vendor >>|cRXP_BUY_购买|r|T132382:0|t[劣质箭] |cRXP_BUY_直到你剩下 2 银或拥有 3 堆|r
    .target Jeena Featherbow
step << Hunter
    #completewith next
    +|cRXP_WARN_装备|r|T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.37
step << Warrior
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r |T135321:0|t[步兵剑] |cRXP_BUY_(如果负担得起, 价格为5银36铜), 否则跳过此步骤|r
    .collect 2488,1 --Collect Gladius
    .target Shalomon
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r|T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
step << Warrior
    .goto Teldrassil,56.221,59.198
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
	.trainer >>训练你的职业法术
    .target Kyra Windblade
step << Rogue
    .goto Teldrassil,56.381,60.139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
	.trainer >>训练你的职业法术
    .target Jannok Breezesong
step << Rogue
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r|T135641:0|t[卷刃的剑]|cRXP_BUY_(若能负担得起, 花费4秒1铜币), 否则跳过此步骤|r
    .collect 2494,1 --Stiletto (1)
    .target Shalomon
    .money <0.0401
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith next
    +|cRXP_WARN_装备|r|T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Druid
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r|T135145:0|t[手杖] |cRXP_BUY_(若能负担得起, 价格为5银4铜), 否则跳过此步骤|r
    .collect 2495,1 --Walking Stick (1)
    .target Shalomon
    .money <0.0504
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.20
step << Druid
    #completewith next
    +|cRXP_WARN_装备|r|T135145:0|t[手杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.19
step
    .goto Teldrassil,55.619,59.788
    .target Innkeeper Keldamyr
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板凯达米尔|r交谈
    .turnin 2159,2 >>交任务: |cRXP_FRIENDLY_多兰纳尔的货物|r << Hunter
    .turnin 2159 >>交任务: |cRXP_FRIENDLY_多兰纳尔的货物|r << !Hunter
    .vendor >>|cRXP_BUY_购买 10 |T132815:0|t|cRXP_LOOT_冰镇牛奶|r, 或尽可能多的数量 << Priest
    .home >>将你的[炉石]设置为多兰纳尔
step << Warrior
    #season 2
    .goto Teldrassil,54.8,66.0,25 >>前往标记地点. 查看|cRXP_FRIENDLY_游荡剑客|r是否在那儿. 如果找到他, 便可向其挑战决斗, 胜利后将获得|rT132334:0|t[|cRXP_FRIENDLY_鲜血狂怒|r]符文
    >>|cRXP_WARN_他有多个刷新点, 同一时间只能出现在其中一个. 如果他不在那里, 请跳过此步骤|r
    >>|cRXP_WARN_在这个等级, 你很可能无法单独击败他. 如果周围没人帮忙, 请跳过这一步, 等你升到10级和学会“腿筋”和“投掷”技能后再回来, 看看他是否还在那里|r
    .unitscan Wandering Swordsman
    .train 412507,1
step << Hunter
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .train 1130 >>学习猎人印记
    .train 3044 >>学习奥术射击
    .target Dazalar
    .xp >8,1
step << Hunter
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .train 5116 >>训练震荡射击
    .target Dazalar
    .xp <8,1
step << Druid
    #season 0
    .goto Teldrassil,55.945,61.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔|r交谈
	.trainer >>训练你的职业法术
    .target Kal
step
#xprate <1.99
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 928 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Corithras Moonrage
    .accept 929 >>接任务: |cRXP_LOOT_大地之冠|r
step << Priest
    .goto Teldrassil,57.242,63.511
    >>目标 |cRXP_FRIENDLY_哨兵莎恩雅|r
    >>|cRXP_WARN_施放|r|T135929:0|t[治疗术(等级2)]|cRXP_WARN_和|r|T135987:0|t[真言术:坚韧], |cRXP_WARN_目标: |r|cRXP_FRIENDLY_哨兵莎恩雅|r
    .complete 5621,1 --Heal and fortify Sentinel Shaya
    .target Sentinel Shaya
step
    .goto Teldrassil,60.900,68.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    >>|cRXP_WARN_不要接豆芽任务|r << !sod/Warrior/Rogue
    .turnin 997 >>交任务: |cRXP_FRIENDLY_德纳兰的泥土|r
    .target Denalan
    .accept 918 >>接任务: |cRXP_LOOT_林精的种子|r
    .accept 919 >>接任务: |cRXP_LOOT_林精的新芽|r << !sod/Warrior/Rogue
step << Rogue
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_林精|r. 击杀后搜刮, 获取 |T134327:0|t[|cRXP_LOOT_右上方地图碎片]|r
    .collect 208601,1 -- Top-Right Map Piece (1)
    .mob Timberling
    .mob Timberling Bark Ripper
    .mob Timberling Trampler
    .train 398196,1
step << Druid
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_林精|r. 击杀后搜刮其掉落的|cRXP_LOOT_种子|r
    >>拾取地面上的林精的新芽
    .complete 918,1 --Collect Timberling Seed (x8)
    .complete 919,1 << !sod --Collect Timberling Sprout (x12)
    .mob Timberling
step << Druid
    #season 2
    #completewith next
    .goto Teldrassil,52.831,78.731,100 >>前往巨树的枝干
    .train 416044,1
step << Druid
    #season 2
    .goto Teldrassil,52.831,78.731,20,0
    .goto Teldrassil,52.988,80.086,15,0
    .goto Teldrassil,52.831,78.731
    >>|cRXP_WARN_在巨大的树枝上你会看到 3|r|cRXP_ENEMY_月石|r
    >>|cRXP_WARN_对树枝上的所有3个|r|cRXP_ENEMY_Lunar Stones|r|cRXP_WARN_施放|r|T136096:0|t[月火术], 然后前往箭头标记位置, 拾取出现的宝箱|r
    .collect 206989,1 -- Rune of the Sun (1)
    .mob Lunar Stone
    .train 416044,1
step << Druid
    #season 2
    #hardcore
    .train 416044 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_太阳符文|r]|cRXP_WARN_来训练|r|T236216:0|t[太阳之火]
    .use 206989
    .itemcount 206989,1
    .train 416044,1
step << Druid
    #season 2
    #softcore
    #completewith next
    .train 416044 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_太阳符文|r]|cRXP_WARN_来训练|r|T236216:0|t[太阳之火]
    .deathskip >>在多兰纳尔死亡并重生
    .use 206989
    .itemcount 206989,1
    .train 416044,1
step
    .goto Teldrassil,61.63,68.89,55,0
    .goto Teldrassil,60.52,70.47,55,0
    .goto Teldrassil,59.04,72.52,55,0
    .goto Teldrassil,57.69,69.92,55,0
    .goto Teldrassil,55.33,67.22,55,0
    .goto Teldrassil,57.89,64.84,55,0
    .goto Teldrassil,61.21,66.28
    >>击杀|cRXP_ENEMY_林精|r. 击杀后搜刮其掉落的|cRXP_LOOT_种子|r
    >>拾取地面上的林精的新芽 << !sod
    .complete 918,1 --Collect Timberling Seed (x8)
    .complete 919,1 << !sod/Warrior/Rogue --Collect Timberling Sprout (x12)
    .mob Timberling
step << Rogue
    #season 2
    .goto Teldrassil,61.2,67.0
    >>击杀|cRXP_ENEMY_林精|r. 击杀后搜刮, 获取 |T134327:0|t[|cRXP_LOOT_右上方地图碎片]|r
    .collect 208601,1 -- Top-Right Map Piece (1)
    .mob Timberling
    .mob Timberling Bark Ripper
    .mob Timberling Trampler
    .train 398196,1
step
    .goto Teldrassil,60.900,68.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .turnin 918 >>交任务: |cRXP_FRIENDLY_林精的种子|r
    .target Denalan
    .accept 922 >>接任务: |cRXP_LOOT_雷利亚·绿树|r
    .turnin 919 >>交任务: |cRXP_FRIENDLY_林精的新芽|r << !sod/Warrior/Rogue
step
    #season 2 << Hunter/Druid/Priest
    #season 1 << Warrior/Rogue
	.abandon 919 >>放弃“林精的新芽”任务, 不值得做
step << Warrior
    #season 2
    .goto Teldrassil,62.6,71.8,25 >>前往标记地点. 查看|cRXP_FRIENDLY_游荡剑客|r是否在那儿. 如果找到他, 便可向其挑战决斗, 胜利后将获得|rT132334:0|t[|cRXP_FRIENDLY_鲜血狂怒|r]符文
    >>|cRXP_WARN_他有多个刷新点, 同一时间只能出现在其中一个. 如果他不在那里, 请跳过此步骤|r
    >>|cRXP_WARN_在这个等级, 你很可能无法单独击败他. 如果周围没人帮忙, 请跳过这一步, 等你升到10级和学会“腿筋”和“投掷”技能后再回来, 看看他是否还在那里|r
    .unitscan Wandering Swordsman
    .train 412507,1
step
    #completewith next
    .goto Teldrassil,68.02,59.66,120 >>前往星风村
step
    .goto Teldrassil,68.02,59.66
    >>打开|cRXP_PICK_塔隆凯的衣柜|r. 从中拾取|cRXP_LOOT_翡翠摄梦符|r
    .complete 2438,1 --Collect Emerald Dreamcatcher (x1)
step
    #label zenn
    .goto Teldrassil,66.26,58.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_盖洛拉斯·塔文斯伦|r交谈
    .turnin 475 >>交任务: |cRXP_FRIENDLY_烦恼之风|r
    .target Gaerolas Talvethren
    .accept 476 >>接任务: |cRXP_LOOT_瘤背熊怪的堕落|r
step
    #xprate <1.99
    .goto Teldrassil,63.38,58.10
    >>|cRXP_WARN_使用|r|T134721:0|t[翡翠瓶] |cRXP_WARN_在 星风村月亮井|r
    .complete 929,1 --Collect Filled Jade Phial (x1)
step << Warrior
    #season 2
    #completewith TeldrassilEnd
    #sticky
    >>击杀|cRXP_ENEMY_夜刃豹|r或|cRXP_ENEMY_夜刃捕食者|r. 击败它们后可获得|cRXP_LOOT_被斩下的虎头|r
    >>击杀|cRXP_ENEMY_巨翼枭|r 或|cRXP_ENEMY_巨翼恶枭|r, 掠夺其掉落的|cRXP_LOOT_severed owl head|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r 或|cRXP_ENEMY_树林毒蜘蛛|r. 击败它们后可获得|cRXP_LOOT_severed spider head|r
    .collect 208611,1 -- Severed Tiger Head (1)
    .collect 208610,1 -- Severed Owl Head (1)
    .collect 208612,1 -- Severed Spider Head (1)
    .mob Nightsaber
    .mob Nightsaber Stalker
    .mob Strigid Owl
    .mob Strigid Screecher
    .mob Webwood Lurker
    .mob Webwood Venomfang
    .train 403475,1
step
    >>击杀|cRXP_ENEMY_夜刃豹|r. 击败它们后搜刮其|cRXP_LOOT_毒牙|r
    >>击杀|r巨翼枭|cRXP_ENEMY_Strigid Owls|r. 掠夺它们获取|r羽毛|cRXP_LOOT_Feathers|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r. 击杀后搜刮其掉落的|cRXP_LOOT_丝线|r
    >>|cRXP_WARN_保存任何|r|T132832:0|t[小蛋] |cRXP_WARN_和|r|T134321:0|t[小蜘蛛腿] |cRXP_WARN_用于后续升级时的 |T133971:0|t[烹饪] |r
    >>如果你在掉落物品上运气不好, 且附近没有怪物可杀, 请跳过此步骤
    .complete 488,1 --Collect Nightsaber Fang (x3)
    .goto Teldrassil,66.10,52.43,60,0
    .goto Teldrassil,61.95,61.07,50,0
    .goto Teldrassil,59.14,60.91
    .complete 488,2 --Collect Strigid Owl Feather (x3)
    .goto Teldrassil,66.10,52.43,60,0
    .goto Teldrassil,63.39,64.22,50,0
    .goto Teldrassil,59.14,60.91
    .complete 488,3 --Collect Webwood Spider Silk (x3)
    .goto Teldrassil,61.06,54.66,50,0
    .goto Teldrassil,60.17,59.62,50,0
    .goto Teldrassil,58.22,56.32
    .mob Nightsaber
    .mob Strigid Owl
    .mob Webwood Lurker
step
    .goto Teldrassil,60.5,56.3
    .target Zenn Foulhoof
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 488 >>交任务: |cRXP_FRIENDLY_赛恩的要求|r
    .isQuestComplete 488
step
    #xprate < 1.5
    .goto Teldrassil,60.7,54.4
	.xp 7+3520 >>升级至7级 +3520经验值
step
    #xprate >1.49
    .xp 7+2350 >>升级至7级 +2350经验值
step
	.goto Teldrassil,56.078,57.723
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .accept 489 >>接任务: |cRXP_LOOT_寻求救赎！|r
    .target Syral Bladeleaf
    .isQuestTurnedIn 488
step
    .goto Teldrassil,55.954,57.272
    .target Athridas Bearmantle
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .turnin 476 >>交任务: |cRXP_FRIENDLY_瘤背熊怪的堕落|r
step << Priest
    .goto Teldrassil,55.564,56.746
    .target Laurna Morninglight
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
    .turnin 5621 >>交任务: |cRXP_FRIENDLY_月光之衣|r
	.trainer >>训练你的职业法术
step
    #season 1 << Priest/Rogue
    #season 2 << Hunter/Warrior/Druid
    .goto Teldrassil,55.574,56.948
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树上的|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 2438 >>交任务: |cRXP_FRIENDLY_翡翠摄梦符|r
    .target Tallonkai Swiftroot
    .accept 2459 >>接任务: |cRXP_LOOT_噬梦者菲罗斯塔|r << !sod/Warrior
step << Hunter
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    >>|cRXP_BUY_购买并装备|r|T135499:0|t[角木弯弓]|cRXP_BUY_(若能负担得起, 价格为2银85铜), 否则跳过此步骤|r
    .collect 2506,1 --Collect Hornwood Recurve Bow
    .target Jeena Featherbow
    .money <0.0285
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.38
step << Rogue
    .goto Teldrassil,56.381,60.139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
	.trainer >>训练你的职业法术
    .target Jannok Breezesong
step << Warrior
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r |T135321:0|t[步兵剑] |cRXP_BUY_(如果负担得起, 价格为5银36铜), 否则跳过此步骤|r
    .collect 2488,1 --Collect Gladius
    .target Shalomon
    .money <0.0536
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r|T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
    step << Warrior
    .goto Teldrassil,56.221,59.198
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
	.trainer >>训练你的职业法术
    .target Kyra Windblade
step << Rogue
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r|T135641:0|t[卷刃的剑]|cRXP_BUY_(若能负担得起, 花费4秒1铜币), 否则跳过此步骤|r
    .collect 2494,1 --Stiletto (1)
    .target Shalomon
    .money <0.0401
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith next
    +|cRXP_WARN_装备|r|T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Druid
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r|T135145:0|t[手杖] |cRXP_BUY_(若能负担得起, 价格为5银4铜), 否则跳过此步骤|r
    .collect 2495,1 --Walking Stick (1)
    .target Shalomon
    .money <0.0504
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.20
step << Druid
    #completewith next
    +|cRXP_WARN_装备|r|T135145:0|t[手杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.19
step << Druid
#xprate 1.49-1.99
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 929 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Corithras Moonrage
step << Druid
#xprate <1.50
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 929 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Corithras Moonrage
    .accept 933 >>接任务: |cRXP_LOOT_大地之冠|r
step << Druid
    #season 0
    .goto Teldrassil,55.945,61.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔|r交谈
	.trainer >>训练你的职业法术
    .target Kal
step
    #loop
    .goto 1438/1,854.400,9952.500,6 >>小树附近
    .goto 1438/1,822.200,9948.500,6 >>在小山丘上
    .goto 1438/1,809.800,9926.400,6 >>在那棵巨大的树旁边
    >>从地图标记位置获取3个邪能锥 
    >>|cRXP_WARN_如果其中任何一个目标对象不存在且你无法完成当前目标, 请跳过此步骤|r
    .complete 489,1 --Fel Cone 3/3
    .isOnQuest 489
step
    #label SoDSpiderLegs
    .goto Teldrassil,60.4,56.4
    .target Zenn Foulhoof
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 489 >>交任务: |cRXP_FRIENDLY_寻求救赎！|r
    .itemcount 3418,3
    .isOnQuest 489
    .target Zenn Foulhoof
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
	#completewith jewel
    >>拾取地面上的魔锥果
    >>|cRXP_WARN_它们通常位于树干附近|r
    .complete 489,1 --Collect Fel Cone (x3)
    .isOnQuest 489
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
    #completewith next
    >>击杀|cRXP_ENEMY_瘤背秘法师|r
    >>|cRXP_WARN_如果没有太多|cRXP_ENEMY_瘤背秘法师|r, 你可能需要击杀|cRXP_ENEMY_瘤背战士|r来促使它们出现|r
    .complete 2459,1 --Kill Gnarlpine Mystic (x7)
    .mob Gnarlpine Mystic
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
	.goto Teldrassil,69.37,53.41
	>>击杀|cRXP_ENEMY_噬梦者菲罗斯塔|r. 从他身上搜刮出 |T133288:0|t[|cRXP_LOOT_瘤背熊怪的项链|r]
    .use 8049 >>|cRXP_WARN_使用 |T133288:0|t[|cRXP_LOOT_瘤背熊怪的项链|r] 来获取 |cRXP_LOOT_祖维尔|r
    .complete 2459,2 --Collect Tallonkai's Jewel (x1)
    .mob Ferocitas the Dream Eater
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
    #label jewel
    .goto Teldrassil,68.38,52.06,30,0
    .goto Teldrassil,69.37,53.41
    >>击杀|cRXP_ENEMY_瘤背秘法师|r
    >>|cRXP_WARN_如果没有太多|cRXP_ENEMY_瘤背秘法师|r, 你可能需要击杀|cRXP_ENEMY_瘤背战士|r来促使它们出现|r
    .complete 2459,1 --Kill Gnarlpine Mystic (x7)
    .mob Gnarlpine Mystic
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
    #softcore
    #completewith next
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
    .isQuestTurnedIn 489
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
    #softcore
    .goto Teldrassil,56.2,60.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰诺尔·鹰月|r交谈
    .vendor >>|cRXP_BUY_必要时向商人出售物品并修理装备|r
    .target Brannol Eaglemoon
    .isQuestTurnedIn 489
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
    .goto Teldrassil,59.0,56.1,50,0
    .goto Teldrassil,56.5,65.5,50,0
    .goto Teldrassil,53.0,59.5,50,0
    .goto Teldrassil,63.6,62.3,50,0
    .goto Teldrassil,58.7,55.7
    >>拾取地面上的魔锥果
    >>|cRXP_WARN_它们通常位于树干附近|r
    .complete 489,1 --Collect Fel Cone (x3)
    .isOnQuest 489
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
    .goto Teldrassil,60.4,56.4
    .target Zenn Foulhoof
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 489 >>交任务: |cRXP_FRIENDLY_寻求救赎！|r
    .isOnQuest 489
step
    #season 1 << Warrior
    #season 2 << Hunter/Druid/Priest/Rogue
    .goto Teldrassil,44.69,70.52,40,0
    .goto Teldrassil,44.88,73.83
    >>尝试完成|cRXP_LOOT_小蜘蛛腿|r任务
    >>|cRXP_WARN_如果Zenn附近没有蜘蛛, 请跳过此步骤|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob Webwood Lurker
    .mob Webwood Venomfang
step
    #season 0
    #sticky
	#completewith spiderLegs
    >>击杀|cRXP_ENEMY_树林潜伏者|r 和|cRXP_ENEMY_树林毒蜘蛛|r , 搜刮它们掉落的|cRXP_LOOT_小蜘蛛腿|r
    >>|cRXP_WARN_你需要这些来完成后续任务|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob Webwood Lurker
    .mob Webwood Venomfang
step
    #season 2
    .abandon 489 >>放弃寻求救赎吧. 没必要特意跑一趟交还它
step << !sod/Priest/Rogue
    #completewith next
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >>前往费尔石
step << Rogue
    #season 2
    #completewith MutiRune
    >>击杀|cRXP_ENEMY_邪恶劣魔|r和|cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_影魂劣魔|r. 击败它们后可获得 |T134327:0|t[|cRXP_LOOT_Bottom-Left Map Piece]|r
    .collect 208604,1 -- Bottom-Left Map Piece (1)
    .mob Vicious Grell
    .mob Rascal Sprite
    .mob Shadow Sprite
    .train 398196,1
step << Rogue
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_迈雷纳斯|r. 击败他后搜刮出 |T134419:0|t[|cRXP_FRIENDLY_残肢符文|r]
    .collect 203990,1
    .unitscan Lord Melenas
    .train 400094,1
step << Priest
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_邪恶劣魔|r和|cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_影魂劣魔|r. 击败它们后可获得 |T135975:0|t[|cRXP_FRIENDLY_亵渎要塞的预言|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob Vicious Grell
    .mob Rascal Sprite
    .mob Shadow Sprite
    .train 402852,1
step << !sod/Priest/Rogue
    .goto Teldrassil,51.2,50.6
    >>击杀|cRXP_ENEMY_迈雷纳斯|r. 击败他后搜刮他的|cRXP_LOOT_头|r
    >>|cRXP_ENEMY_迈雷纳斯|r 可能出现在费尔石块的多个不同刷新点
    .complete 932,1 --Collect Melenas' Head (x1)
    .unitscan Lord Melenas
step << Priest
    #season 2
    .goto Teldrassil,77.86,61.66
    >>击杀|cRXP_ENEMY_邪恶劣魔|r和|cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_影魂劣魔|r. 击败它们后可获得 |T135975:0|t[|cRXP_FRIENDLY_亵渎要塞的预言|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob Vicious Grell
    .mob Rascal Sprite
    .mob Shadow Sprite
    .train 402852,1
step << Priest
    #season 2
    .train 402852 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r]|cRXP_WARN_来训练|r|T237570:0|t[傀儡]
    >>|cRXP_WARN_你必须在神圣地点(例如月亮井和北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘守卫)输入 /kneel, 才能获得 2|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buffs|r
    .use 205947
    .itemcount 205947,1
step << Rogue
    #season 2
    .goto Teldrassil,51.2,50.6
    >>击杀|cRXP_ENEMY_迈雷纳斯|r. 击败他后搜刮出 |T134419:0|t[|cRXP_FRIENDLY_残肢符文|r]
    .collect 203990,1
    .unitscan Lord Melenas
    .train 400094,1
step << Rogue
    #season 2
    #label MutiRune
    .train 400094 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r]|cRXP_WARN_来训练|r|T132304:0|t[撕裂]
    .use 203990
    .itemcount 203990,1
step << Rogue
    #season 2
    .goto Teldrassil,77.86,61.66
    >>击杀|cRXP_ENEMY_邪恶劣魔|r和|cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_影魂劣魔|r. 击败它们后可获得 |T134327:0|t[|cRXP_LOOT_Bottom-Left Map Piece]|r
    .collect 208604,1 -- Bottom-Left Map Piece (1)
    .mob Vicious Grell
    .mob Rascal Sprite
    .mob Shadow Sprite
    .train 398196,1
step << !sod/Priest/Rogue
    #softcore
    #completewith next
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
step << !Druid
#xprate <1.99
    .goto Teldrassil,56.142,61.714
    .target Corithras Moonrage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 929 >>交任务: |cRXP_FRIENDLY_大地之冠|r
step
	#xprate <1.5
    .goto Teldrassil,56.142,61.714
    .target Corithras Moonrage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .accept 933 >>接任务: |cRXP_LOOT_大地之冠|r
step
	#xprate <1.5
    #completewith next
    .goto Teldrassil,42.61,76.18,50 >>前往泰达希尔西南部
step
	#xprate <1.5
	.goto Teldrassil,42.61,76.18
	>>点击|cRXP_PICK_奇怪的果树|r
	.accept 930 >>接任务: |cRXP_LOOT_发光的水果|r
step
	#xprate <1.5
    #completewith next
    .goto Teldrassil,42.41,67.07,50 >>前往阿利瑟里恩之池
step
	#xprate <1.5
	#label spiderLegs
	.goto Teldrassil,42.41,67.07
    .use 5621 >>|cRXP_WARN_使用|r|T134765:0|t[红玉瓶] |cRXP_WARN_在阿利瑟恩月井|r
	.complete 933,1
step
	#xprate <1.5
    .goto Teldrassil,44.69,70.52,40,0
    .goto Teldrassil,44.88,73.83
    >>击杀|cRXP_ENEMY_树林潜伏者|r 和|cRXP_ENEMY_树林毒蜘蛛|r , 搜刮它们掉落的|cRXP_LOOT_小蜘蛛腿|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob Webwood Lurker
    .mob Webwood Venomfang
step
	#xprate <1.5
    #hardcore
    #completewith next
    .goto Teldrassil,56.142,61.714,90 >>前往多兰纳尔
step
	#xprate <1.5
    #softcore
	#completewith next
    .goto Teldrassil,43.50,68.42
    .deathskip >>在多兰纳尔墓地死亡并重生, 确保死亡位置位于月亮井以东, 否则可能会被传送到达纳苏斯
step
	#xprate <1.5
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 933 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Corithras Moonrage
    .accept 7383 >>接任务: |cRXP_LOOT_大地之冠|r
step
	#xprate <1.5
    .goto Teldrassil,57.121,61.296
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞恩|r交谈
    .train 2550 >>学习烹饪技能
    .accept 4161 >>接任务: |cRXP_LOOT_卡多雷的菜谱|r
    .turnin 4161 >>交任务: |cRXP_FRIENDLY_卡多雷的菜谱|r
    .target Zarrin
step << Warrior/Rogue
    #season 0
    .goto Teldrassil,55.29,56.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拜恩希|r交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Byancie
step
    #season 1 << Warrior
    #season 2 << Hunter/Druid/Priest/Rogue
    .goto Teldrassil,57.121,61.296
    .train 2550 >>学习烹饪技能
    .target Zarrin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞恩|r交谈
    .accept 4161 >>接任务: |cRXP_LOOT_卡多雷的菜谱|r
    .turnin 4161 >>交任务: |cRXP_FRIENDLY_卡多雷的菜谱|r
    >>|cRXP_WARN_如果你已达到10级且尚未获得蜘蛛腿, 可以跳过此任务；但无论怎样都记得去训练烹饪技能|r
step << Rogue
    #season 2
    .goto Teldrassil,55.29,56.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拜恩希|r交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Byancie
step << !sod/Priest/Rogue
    .goto Teldrassil,55.574,56.948
    .target Tallonkai Swiftroot
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树上的|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 2438 >>交任务: |cRXP_FRIENDLY_翡翠摄梦符|r << sod Priest/sod Rogue
    .turnin 932 >>交任务: |cRXP_FRIENDLY_扭曲的仇恨|r
    .turnin 2459 >>交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r << !sod
step << Warrior
    #season 2
    .goto Teldrassil,55.574,56.948
    .target Tallonkai Swiftroot
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树上的|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 2459 >>交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r
    .accept 932 >>接任务: |cRXP_LOOT_扭曲的仇恨|r
step
#xprate >1.99
    .xp 10
   >>|cRXP_WARN_如果你离完成迈雷纳斯的任务还差得远, 就先去做他的任务|r
step << Druid
    #season 2
    .goto Teldrassil,55.945,61.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔|r交谈
	.trainer >>训练你的职业法术
    .accept 5925 >>接任务: |cRXP_LOOT_响应召唤|r
    .target Kal
step << Priest
#xprate >1.99
    .goto Teldrassil,55.564,56.746
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
	.trainer >>训练你的职业法术
    .accept 5629 >>接任务: |cRXP_WARN_回家|r << sod
    .target Laurna Morninglight
step << Warrior
#xprate >1.99
    .goto Teldrassil,56.221,59.198
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
	.trainer >>训练你的职业法术
    .target Kyra Windblade
step << Rogue
#xprate >1.99
    .goto Teldrassil,56.381,60.139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
	.trainer >>训练你的职业法术
    .train 5171 >>训练 |T132306:0|t[切片与切割] << !sod
    .train 921 >>学习 |T133644:0|t[扒窃]技能, 这也是完成你10级潜行者任务所需的
    .target Jannok Breezesong
step << Hunter
#xprate >1.99
    .goto Teldrassil,56.676,59.489
    .target Dazalar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .accept 6063 >>接任务: |cRXP_LOOT_驯服野兽|r
	.trainer >>训练你的职业法术
step << Hunter
#xprate >1.99
    .goto Teldrassil,59.9,58.8
    .use 15921 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒] |cRXP_WARN_对一只|r|cRXP_ENEMY_树林潜伏者|r
    .complete 6063,1 --Tame a Webwood Lurker
    .mob Webwood Lurker
step << Hunter
#xprate >1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6063 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6101 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
#xprate >1.99
    .goto Teldrassil,62.6,72.2
    .use 15922 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_夜刃捕食者|r
    >>|cRXP_WARN_你必须右键点击宠物界面并解散当前宠物, 才能驯服新的宠物|r
    .complete 6101,1 --Tame a Nightsaber Stalker
    .mob Nightsaber Stalker
step << Hunter
#xprate >1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6101 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6102 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
#xprate >1.99
    .goto Teldrassil,64.7,66.7
    .use 15923 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_巨翼恶枭|r
    >>|cRXP_WARN_你必须右键点击宠物界面并解散当前宠物, 才能驯服新的宠物|r
    .complete 6102,1 --Tame a Strigid Screecher
    .mob Strigid Screecher
step << Hunter
#xprate >1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6102 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6103 >>接任务: |cRXP_LOOT_训练野兽|r
    .train 1130 >>|cRXP_WARN_确保你已学会猎人印记, 稍后需要用它来获取符文|r
step << Warrior
#xprate >1.99
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_巡逻多兰纳尔以西的道路|r
    .accept 1684 >>接任务: |cRXP_LOOT_艾兰娜瑞|r
    .accept 487 >>接任务: |cRXP_LOOT_达纳苏斯之路|r
    .target Moon Priestess Amara
step << Rogue
#xprate >1.99
    .goto Teldrassil,56.381,60.139
    .target Jannok Breezesong
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
    .accept 2241 >>接任务: |cRXP_LOOT_詹诺克的花|r
step
    #season 0
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_巡逻多兰纳尔以西的道路|r
    .accept 487 >>接任务: |cRXP_LOOT_达纳苏斯之路|r
    .target Moon Priestess Amara
step << Rogue
    #season 2
    #completewith runeOfPrecision
    #optional
    #label topleft
    >>击杀或 |T133644:0|t[扒窃]|cRXP_ENEMY_Gnarlpine Furbolgs|r. 掠夺它们以获取 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208602,1 -- Top-Left Map Piece (1)
    .mob Gnarlpine Ambusher
    .mob Gnarlpine Shaman
    .mob Gnarlpine Defender
    .mob Gnarlpine Augur
    .train 398196,1
step
    #season 0
    .goto Teldrassil,46.6,53.0
    >>击杀|cRXP_ENEMY_瘤背伏击者|r
    .complete 487,1 --Kill Gnarlpine Ambusher (x6)
    .mob Gnarlpine Ambusher
step << Warrior
    #season 2
    .goto Teldrassil,46.6,53.0
    >>击杀|cRXP_ENEMY_瘤背伏击者|r
    .complete 487,1 --Kill Gnarlpine Ambusher (x6)
    .mob Gnarlpine Ambusher
step
    #season 0
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_巡逻多兰纳尔以西的道路|r
    .turnin 487 >>交任务: |cRXP_FRIENDLY_达纳苏斯之路|r
    .target Moon Priestess Amara
step << Priest
    #season 2
    #completewith next
    .goto Teldrassil,44.18,58.19
    .subzone 262 >>进入班尼希尔墓穴巢穴. 此任务单人难度较高, 建议组队完成. 你也可以稍后再进行, 以获得你的|T237514:0|t[虚空瘟疫]符文
    .train 425216,1 << Priest
step << Priest
    #season 2
    .goto Teldrassil,44.401,60.655
    >>打开 |cRXP_PICK_Gnarlpine Cache|r. 搜索后获得一个 |T136222:0|t[|cRXP_FRIENDLY_Memory of a Dark Purpose|r]
    >>|cRXP_WARN_注意:|cRXP_PICK_Gnarlpine Cache|r在班尼希尔墓穴内可能出现在多个位置|r
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .train 425216 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_黑暗目的的记忆|r]|cRXP_WARN_来训练|r|T237514:0|t[虚空瘟疫]
    >>|cRXP_WARN_你必须在神圣区域(例如月亮井和北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘守卫)输入 /kneel, 才能获得|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buff|r
    .use 205940
step << Rogue
    #season 2
    .goto Teldrassil,38.92,79.93
    >>击杀或 |T133644:0|t[扒手]|cRXP_ENEMY_瘤背探险者|r和|cRXP_ENEMY_瘤背复仇者|r. 抢劫他们以获取 |T134241:0|t[|cRXP_LOOT_尖齿草药包钥匙]|r
    .collect 208749,1 -- Gnarlpine Stash Key (1)
    .mob Gnarlpine Pathfinder
    .mob Gnarlpine Avenger
    .train 400081,1
step << Rogue
    #season 2
    #label runeOfPrecision
    .goto Teldrassil,37.836,82.588
    >>打开|cRXP_PICK_Gnarlpine Stash|r, 从中获取 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 204174 -- Rune of Precision (1)
    .itemcount 208749,1
    .train 400081,1
step << Rogue
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_来训练|r|T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1
step << Rogue
    #season 2
    .goto Teldrassil,38.92,79.93
    >>击杀或 |T133644:0|t[扒窃]|cRXP_ENEMY_Gnarlpine Furbolgs|r. 掠夺它们以获取 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208602,1 -- Top-Left Map Piece (1)
    .mob Gnarlpine Ambusher
    .mob Gnarlpine Shaman
    .mob Gnarlpine Defender
    .mob Gnarlpine Augur
    .train 398196,1
step << Rogue
    #season 2
    #softcore
    #completewith next
    .deathskip >>在达纳苏斯的灵魂医者处死亡并重生
    .target Spirit Healer
step << Hunter
    #season 2
    .goto Teldrassil,55.890,59.205
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    >>|cRXP_BUY_购买并装备 a|r|T135489:0|t[多层弯弓]
    .collect 2507,1
    .target Ariyell Skyshadow
    .money <0.1751
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.77 
step << Hunter
    #season 2
    #completewith next
    +|cRXP_WARN_装备|r |T135489:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.76
step << Hunter
    #season 2
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    >>|cRXP_BUY_购买并装备 400|r|T132382:0|t[锋利的箭]
    .target Jeena Featherbow
step << Hunter
    #season 2
    .goto Teldrassil,46.6,46.3
    >>|cRXP_WARN_施放|r|T132212:0|t[猎人印记], |cRXP_WARN_目标: |r|cRXP_ENEMY_沙沙作响的灌木|r
    >>击杀生成的堕根偷猎者. 从他身上搜刮[精准符文]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Fallenroot Poacher
    .train 410113,1 --Master Marksman
step
	#xprate < 1.5
    #completewith next
    .goto Teldrassil,38.32,34.36,50 >>前往神谕林地
step
	#xprate < 1.5
    .goto Teldrassil,38.32,34.36
    .target Sentinel Arynia Cloudsbreak
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .accept 937 >>接任务: |cRXP_LOOT_神谕林地|r
step
	#xprate < 1.5
    .goto Teldrassil,38.43,34.03
    .use 18152 >>|cRXP_WARN_使用|r|T134798:0|t[紫水晶瓶]|cRXP_WARN_在神谕林地月井|r
    .complete 7383,1 --Collect Filled Amethyst Phial (x1)
step << Rogue
	#xprate < 1.5
    #season 2
    #completewith xp10
    >>击杀或 |T133644:0|t[扒窃]|cRXP_ENEMY_血羽哈比|r. 击败它们以获取 |T134327:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208603,1 -- Bottom-Right Map Piece (1)
    .mob Bloodfeather Harpy
    .mob Bloodfeather Rogue
    .mob Bloodfeather Sorceress
    .mob Bloodfeather Fury
    .mob Bloodfeather Wind Witch
    .mob Bloodfeather Matriarch
    .train 398196,1
step
	#xprate < 1.5
    #completewith xp10
	#label harpies
    >>击杀|cRXP_ENEMY_Bloodfeather Harpies|r. 击杀后搜刮它们的|cRXP_LOOT_Belts|r
    >>|cRXP_ENEMY_血羽女族长|r|cRXP_WARN_施法|r|T136052:0|t[治疗波]|cRXP_WARN_和|r|T136048:0|t[闪电箭]|cRXP_WARN_会造成大量伤害. 尽量快速击杀|r
    .complete 937,1 --Collect Bloodfeather Belt (x6)
    .mob Bloodfeather Harpy
    .mob Bloodfeather Rogue
    .mob Bloodfeather Sorceress
    .mob Bloodfeather Fury
    .mob Bloodfeather Wind Witch
    .mob Bloodfeather Matriarch
step
	#xprate < 1.5
    .goto Teldrassil,34.61,28.79
    >>点击|cRXP_PICK_奇怪的树木|r
    .accept 931 >>接任务: |cRXP_LOOT_发光的树叶|r

step << Hunter
	#xprate <1.5
    #completewith xp10
    #label mist1
    .goto Teldrassil,31.54,31.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密斯特|r交谈
    >>|cRXP_WARN_这将触发一个护送任务|r
    .accept 938 >>接任务: |cRXP_LOOT_密斯特|r
    .target Mist
step << Hunter
	#xprate <1.5
    #sticky
    #label xp10
    .xp 10-2670 >>刷怪直到距离10级还差2670点经验值(当前/所需:3830/6500)
    >>|cRXP_WARN_达到此经验断点后, 跳过哈帕/护送任务, 直接前往达纳苏斯. 稍后你将有另一次机会完成这些任务|r
step << Hunter
	#xprate <1.5
    #completewith xp10
    #requires mist1
    .goto Teldrassil,38.32,34.36
    .target Sentinel Arynia Cloudsbreak
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin 938 >>交任务: |cRXP_FRIENDLY_密斯特|r
step << Hunter
	#xprate <1.5
    #completewith xp10
	#requires harpies
    .goto Teldrassil,38.32,34.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin 937 >>交任务: |cRXP_FRIENDLY_神谕林地|r
    .target Sentinel Arynia Cloudsbreak
    .accept 940 >>接任务: |cRXP_LOOT_泰达希尔|r
step << !Hunter
	#xprate <1.5
    #label mist1
    .goto Teldrassil,31.54,31.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密斯特|r交谈
    >>|cRXP_WARN_这将触发一个护送任务|r
    .accept 938 >>接任务: |cRXP_LOOT_密斯特|r
    .target Mist
step << !Hunter
	#xprate <1.5
    .goto Teldrassil,38.32,34.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin 937 >>交任务: |cRXP_FRIENDLY_神谕林地|r
    .target Sentinel Arynia Cloudsbreak
    .accept 940 >>接任务: |cRXP_LOOT_泰达希尔|r
    .turnin 938 >>交任务: |cRXP_FRIENDLY_密斯特|r
step << Druid
    #xprate <1.5
    #label xp10
    #season 2
    .xp 10
step << Druid
    #xprate <1.5
    #season 0,1
    #label xp10
    .xp 10-750
step << !Hunter !Druid
	#xprate <1.5
    #label xp10
    .xp 10-3110
step << Rogue
	#xprate <1.5
    #season 2
    .goto Teldrassil,37.8,43.0,60,0
    .goto Teldrassil,36.0,34.4,60,0
    .goto Teldrassil,34.6,28.8,60,0
    .goto Teldrassil,37.8,43.0
    >>击杀或 |T133644:0|t[扒窃]|cRXP_ENEMY_血羽哈比|r. 击败它们以获取 |T134327:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208603,1 -- Bottom-Right Map Piece (1)
    .mob Bloodfeather Harpy
    .mob Bloodfeather Rogue
    .mob Bloodfeather Sorceress
    .mob Bloodfeather Fury
    .mob Bloodfeather Wind Witch
    .mob Bloodfeather Matriarch
    .train 398196,1
step << Rogue
	#xprate < 1.5
    #season 2
    .cast 418600 >>|cRXP_WARN_使用任意|r|T134327:0|t[|cRXP_LOOT_地图碎片]|r|cRXP_WARN_将其合成|r|T134269:0|t[|cRXP_LOOT_泰达希尔藏宝图|r]
    .collect 208605,1
    .itemcount 208604,1
    .itemcount 208601,1
    .itemcount 208602,1
    .itemcount 208603,1
    .use 208604
    .use 208601
    .use 208602
    .use 208603
    .train 398196,1
step
	#xprate 1.49-1.99
   .goto Teldrassil,38.6,58.0
   >>完成收集7条小蜘蛛腿
   .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
step << Druid
   #xprate 1.49-1.99
   #label xp10
   .xp 10-850
   .goto Teldrassil,38.3,34.4
   >>如果你的经验还落后, 去北方做哈拉帕任务
step << !Druid
    #xprate 1.49-1.99
	#label xp10
	.xp 10-4415
step << Hunter
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_进行训练|r|T132177:0|t[神射手大师]
    .use 206155
    .train 410113,1
step << !Rogue
    #softcore
    #requires xp10
    #completewith next
    .deathskip >>在达纳苏斯的灵魂医者处死亡并重生
    >>|cRXP_WARN_确保你离达纳苏斯墓地比多尔纳尔墓地更近, 否则可能会跑错方向. 如果不确定, 就一路跑出巢穴, 然后死亡|r << sod Priest
    >>|cRXP_WARN_确保你离达纳苏斯墓地比离多尔纳尔墓地更近, 否则可能会走错方向. 如果不确定, 就跑到河的西岸|r << sod Hunter/sod Warrior/sod Druid
    .target Spirit Healer
step << !Rogue
    #hardcore
    #requires xp10
    #completewith next
    .goto Darnassus,82.01,36.70,100 >>前往: |cRXP_PICK_达纳苏斯|r
step << Druid
    #optional
    #season 2
    .xp <10,1
    .goto Darnassus,70.679,45.379
    .target Mydrannul
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈德兰努尔|r交谈
    .accept 6344 >>接任务: |cRXP_LOOT_尼莎·影歌|r
 step << Warrior
    #season 2
    .goto Darnassus,57.56,46.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊琳尼雅·月火|r交谈
    .train 227 >>训练法杖 << Warrior
    .train 2567 >>投掷训练 << Warrior
    .target Ilyenia Moonfire
step << Warrior
    #season 2
    .goto Darnassus,58.76,44.48
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
    >>|cRXP_BUY_购买并装备一叠|r|T135425:0|t[锐利投掷匕首]
    .collect 3107,200
    .target Ariyell Skyshadow
step << Warrior
    #season 2
    #ah
    .goto Darnassus,56.245,54.039,-1
    .goto Darnassus,56.374,51.820,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达纳苏斯拍卖商|r交谈
    >>购买一瓶【次级治疗药水】. 它将帮助你从多尔纳尔处获得【狂暴冲锋】符文
    .collect 929,1 --Lesser Healing Potion (1)
    .target Auctioneer Tolon
    .target Auctioneer Golothas
    .train 425412,1 --Skips if you already have Frenzied Assault
step << Warrior
#xprate >1.99
    .goto Darnassus,57.305,34.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾兰娜瑞|r交谈
    .turnin 1684 >>交任务: |cRXP_FRIENDLY_艾兰娜瑞|r
    .target Elanaria
    .accept 1683 >>接任务: |cRXP_LOOT_沃鲁斯·邪蹄|r
step << Warrior
    #season 2
    #requires xp10
    .goto Darnassus,63.108,21.858
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_Delwynna|r交谈
    >>|cRXP_WARN_ 交还三个|cRXP_LOOT_ 断头|r以获得|r|T134455:0|t[|cRXP_FRIENDLY_ 怪物猎人符文碎片|r]
    .collect 204689,1
    .collect 204690,1
    .collect 204688,1
    .use 204703
    .skipgossip
    .target Delwynna
    .itemcount 208612,1 --Severed Spider Head (1)
    .itemcount 208611,1 --Severed Tiger Head (1)
    .itemcount 208610,1 --Severed Owl Head
    .train 403475,1 --Rune not known
step << Warrior
    #season 2
    >>使用任意一个 |T134455:0|t[|cRXP_FRIENDLY_怪物猎人的符文碎片|r], 将其合成得到 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .train 403475 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]|cRXP_WARN_来训练|r|T135291:0|t[毁灭]
    .use 204689
    .itemcount 204689,1
    .itemcount 204690,1
    .itemcount 204688,1
step << !Rogue !Hunter !Warrior
#xprate >1.99
    .goto Darnassus,67.427,15.655
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板塞琳尼|r交谈
    .home >>将你的[炉石]设置为达纳苏斯 << !Warrior
    .vendor >>|cRXP_BUY_再买一些|r|T132815:0|t|cRXP_LOOT_冰镇牛奶|r << Priest
    .target Innkeeper Saelienne
step << !Rogue
    #requires xp10
    .goto Darnassus,38.18,21.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    .turnin 922 >>交任务: |cRXP_FRIENDLY_雷利亚·绿树|r
    .target Rellian Greenspyre
    .accept 923 >>接任务: |cRXP_LOOT_青苔之瘤|r
step << !Hunter !Rogue
	#xprate <1.5
    .goto Darnassus,34.96,9.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树顶上的|cRXP_FRIENDLY_大德鲁伊范达尔·鹿盔|r交谈
    .turnin 940 >>交任务: |cRXP_FRIENDLY_泰达希尔|r
	.isOnQuest 940
    .target Arch Druid Fandral Staghelm
step << Druid
    .goto Darnassus,35.38,8.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与中层的|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 5925 >>交任务: |cRXP_FRIENDLY_响应召唤|r << sod
    .accept 5921 >>接任务: |cRXP_LOOT_月光林地|r
	.trainer >>训练你的职业法术
    .target Mathrengyl Bearwalker
step << Hunter
#xprate >1.99
    .goto Darnassus,40.377,8.545
    .target Jocaste
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .turnin 6103 >>交任务: |cRXP_FRIENDLY_训练野兽|r
step << !Rogue
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    .target Priestess A'moora
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .accept 2518 >>接任务: |cRXP_LOOT_月神的泪水|r
step << Warrior
    #season 2
    .hs >>炉石传送至多尔纳尔
    .vendor >>|cRXP_BUY_从旅店老板处购买5-10个 |T133968:0|t[|cRXP_LOOT_刚出炉的面包|r]
step << Warrior
    #season 2
    #sticky
    #completewith FrenziedAssault
    >>如果你在完成其他步骤时碰巧见到哨兵阿玛拉·夜行者(|cRXP_FRIENDLY_Moon Priestess Amara|r), 请将任务交给她
    >>|cRXP_WARN_先别特意绕路去找她|r
    .turnin 487 >>交任务: |cRXP_FRIENDLY_达纳苏斯之路|r
    .target Moon Priestess Amara
step << Warrior
	#season 2
    .goto Teldrassil,56.308,59.488
    .money <0.0504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买|r |T135145:0|t[手杖], 装备它
    .collect 2495,1 -- Walking Stick (1)
    .target Shalomon
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.20
step << Warrior
    #season 2
    #completewith melenas
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >>前往费尔石
step << Warrior
    #season 2
    #label melenas
    .goto Teldrassil,51.2,50.6
    >>击杀|cRXP_ENEMY_迈雷纳斯|r. 击败他后搜刮他的|cRXP_LOOT_头|r
    >>|cRXP_ENEMY_迈雷纳斯|r 可能出现在费尔石块的多个不同刷新点
    .complete 932,1 --Collect Melenas' Head (x1)
    .unitscan Lord Melenas
step << Warrior
	#season 2
    #softcore
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
step << Warrior
    #season 2
    .goto Teldrassil,57.121,61.296
    .train 2550 >>学习烹饪技能
    .target Zarrin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞恩|r交谈
    .accept 4161 >>接任务: |cRXP_LOOT_卡多雷的菜谱|r
    .turnin 4161 >>交任务: |cRXP_FRIENDLY_卡多雷的菜谱|r
    >>|cRXP_WARN_如果你没有7只小蜘蛛腿, 就跳过这个任务. 烹饪技能还是得练, 以后用得上|r
step << Warrior
    #season 2
    #label FrenziedAssault
    .goto Teldrassil,55.619,59.787
    >>与多兰纳尔的|cRXP_FRIENDLY_旅店老板凯达米尔|r交谈
    >>与楼上的|cRXP_ENEMY_Syllart|r交谈, 然后击败他. 当他血量降至0%时会倒地昏迷
    >>如果|cRXP_ENEMY_Syllart|r不在, 请等待他刷新
    >>击败|cRXP_ENEMY_Syllart|r后, 再次与|cRXP_FRIENDLY_旅店老板凯达米尔|r交谈, 以获得|T134419:0|t[|cRXP_FRIENDLY_狂怒冲锋符文|r]
    .train 425447 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狂怒冲击符文|r]|cRXP_WARN_来训练|r|T236317:0|t[狂怒冲击]
    >>|cRXP_WARN_注意:根据你的等级, 单人完成可能相当困难. 如有需要, 请寻求帮助|r
    >>|cRXP_WARN_你可以通过投掷风筝打法单独对付他. 尝试使用|r|T132316:0|t[打断]|cRXP_WARN_减缓他的速度, 然后跑开并|r|r|T132324:0|t[投掷]|cRXP_WARN_从远处攻击他. |r|cRXP_WARN_必要时使用|r|T134830:0|t[治疗药水]|cRXP_WARN_和|r|T133685:0|t[绷带]|cRXP_WARN_进行自疗|r
    --Might wanna add a guide video
    .use 204716
    .target Innkeeper Keldamyr
    .mob Syllart
step << Warrior
    #season 2
    .goto Teldrassil,55.574,56.948
    .target Tallonkai Swiftroot
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树上的|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 932 >>交任务: |cRXP_FRIENDLY_扭曲的仇恨|r
step << Warrior
    #season 2
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_巡逻多兰纳尔以西的道路|r
    .turnin 487 >>交任务: |cRXP_FRIENDLY_达纳苏斯之路|r
    .target Moon Priestess Amara
    .target Laird 
step
#xprate <1.99
    #requires xp10 << Rogue
    .hs >>炉石传送至多兰纳尔
    .subzoneskip 186
step << Hunter
#xprate <1.99
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
	.vendor >>|cRXP_BUY_购买 4 堆|r|T132382:0|t[锋利的箭]|cRXP_BUY_. 达到 10 级后立即装备|r
    .target Jeena Featherbow
step
	#xprate 1.49-1.99
    .goto Teldrassil,57.121,61.296
    .train 2550 >>学习烹饪技能
    .target Zarrin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞恩|r交谈
    .accept 4161 >>接任务: |cRXP_LOOT_卡多雷的菜谱|r
    .turnin 4161 >>交任务: |cRXP_FRIENDLY_卡多雷的菜谱|r
step
	#xprate 1.49-1.99
    .goto Teldrassil,51.9,56.4
    >>找到哨兵阿玛拉·夜行者, 她正在多兰纳尔西方的道路上巡逻
    .target Moon Priestess Amara
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    .turnin 487 >>交任务: |cRXP_FRIENDLY_达纳苏斯之路|r
	.maxlevel 9
step << Hunter
#xprate <1.99
    #optional
    #completewith L10
    #level 10
    #label beast1
    .goto Teldrassil,56.676,59.489
    .target Dazalar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .accept 6063 >>接任务: |cRXP_LOOT_驯服野兽|r
	.train 13165 >>训练你的10级法术
step << Hunter
#xprate <1.99
    #optional
    #completewith L10
    #level 10
    #requires beast1
    #label beast2
    .goto Teldrassil,59.9,58.8
    .use 15921 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒] |cRXP_WARN_对一只|r|cRXP_ENEMY_树林潜伏者|r
    .complete 6063,1 --Tame a Webwood Lurker
    .mob Webwood Lurker
step << Hunter
#xprate <1.99
    #optional
    #completewith L10
    #level 10
    #requires beast2
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6063 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6101 >>接任务: |cRXP_LOOT_驯服野兽|r
step
	#xprate <1.5
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 7383 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Corithras Moonrage
    .accept 935 >>接任务: |cRXP_LOOT_大地之冠|r
step
	#xprate <1.5
	.goto Teldrassil,60.900,68.489
    .target Denalan
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .turnin 931 >>交任务: |cRXP_FRIENDLY_发光的树叶|r
    .turnin 930 >>交任务: |cRXP_FRIENDLY_发光的水果|r
step
	#xprate <1.5
	.goto Teldrassil,60.900,68.489
    .target Denalan
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
	.turnin 927 >>交任务: |cRXP_FRIENDLY_布满苔藓的心脏|r
    .isOnQuest 927
step
	#xprate <1.5
	.goto Teldrassil,60.78,68.59
	>>点击|cRXP_LOOT_德纳兰的园艺师|r
	.turnin 941 >>交任务: |cRXP_FRIENDLY_培养心脏|r
	.isQuestTurnedIn 927
step << Hunter
	#xprate <1.5
    .goto Teldrassil,62.6,72.2
    .use 15922 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_夜刃捕食者|r
    >>|cRXP_WARN_你必须右键点击宠物界面并解散当前宠物, 才能驯服新的宠物|r
    .complete 6101,1 --Tame a Nightsaber Stalker
	.isOnQuest 6101
    .mob Nightsaber Stalker
step
#xprate <1.99
    #label L10
    .xp 10
step
	#xprate <1.5
    #softcore
	#sticky
    #completewith next
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
step << Priest
#xprate <1.99
    .goto Teldrassil,55.564,56.746
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
	.trainer >>训练你的职业法术
    .target Laurna Morninglight
step << Warrior
#xprate <1.99
    .goto Teldrassil,56.221,59.198
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
	.trainer >>训练你的职业法术
    .target Kyra Windblade
step << Rogue
#xprate <1.99
    .goto Teldrassil,56.381,60.139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
	.trainer >>训练你的职业法术
    .train 5171 >>训练 |T132306:0|t[切片与切割]
    .train 921 >>学习 |T133644:0|t[扒窃]技能, 这也是完成你10级潜行者任务所需的
    .target Jannok Breezesong
step << Hunter
#xprate <1.99
    .goto Teldrassil,56.676,59.489
    .target Dazalar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .accept 6063 >>接任务: |cRXP_LOOT_驯服野兽|r
	.trainer >>训练你的职业法术
step << Hunter
#xprate <1.99
    .goto Teldrassil,59.9,58.8
    .use 15921 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒] |cRXP_WARN_对一只|r|cRXP_ENEMY_树林潜伏者|r
    .complete 6063,1 --Tame a Webwood Lurker
    .mob Webwood Lurker
step << Hunter
#xprate <1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6063 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6101 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
#xprate <1.99
    .goto Teldrassil,62.6,72.2
    .use 15922 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_夜刃捕食者|r
    >>|cRXP_WARN_你必须右键点击宠物界面并解散当前宠物, 才能驯服新的宠物|r
    .complete 6101,1 --Tame a Nightsaber Stalker
    .mob Nightsaber Stalker
step << Hunter
#xprate <1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6101 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6102 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
#xprate <1.99
    .goto Teldrassil,64.7,66.7
    .use 15923 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_巨翼恶枭|r
    >>|cRXP_WARN_你必须右键点击宠物界面并解散当前宠物, 才能驯服新的宠物|r
    .complete 6102,1 --Tame a Strigid Screecher
    .mob Strigid Screecher
step << Hunter
#xprate <1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6102 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6103 >>接任务: |cRXP_LOOT_训练野兽|r
step << Warrior
#xprate <1.99
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_巡逻多兰纳尔以西的道路|r
    .accept 1684 >>接任务: |cRXP_LOOT_艾兰娜瑞|r
    .target Moon Priestess Amara
step << Rogue
#xprate <1.99
    .goto Teldrassil,56.381,60.139
    .target Jannok Breezesong
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
    .accept 2241 >>接任务: |cRXP_LOOT_詹诺克的花|r
step << Hunter
	#xprate <1.5--money issues 1.5x
    .goto Teldrassil,56.308,59.488
    .money <0.0504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买|r |T135145:0|t[手杖]
    >>|cRXP_WARN_你稍后会装备这个. 如果你恰好找到了另一根法杖, 请跳过此步骤|r
    .collect 2495,1 -- Walking Stick (1)
    .target Shalomon
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.20
step << !Druid
#xprate <1.99
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_巡逻多兰纳尔以西的道路|r
    .turnin 487 >>交任务: |cRXP_FRIENDLY_达纳苏斯之路|r
    .target Moon Priestess Amara
step << Rogue
#xprate <1.99
    #softcore
    #completewith next
    .goto Teldrassil,44.0,54.6
    .deathskip >>一旦通过熊怪区域, 故意死亡并在达纳苏斯墓地复活
    .target Spirit Healer
step << Rogue
    #hardcore
    #completewith next
    .goto Darnassus,82.01,36.70,100 >>前往: |cRXP_PICK_达纳苏斯|r
step << Rogue
    .goto Darnassus,38.18,21.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    .turnin 922 >>交任务: |cRXP_FRIENDLY_雷利亚·绿树|r
    .target Rellian Greenspyre
    .accept 923 >>接任务: |cRXP_LOOT_青苔之瘤|r
step << Rogue
    #season 0
    .goto Darnassus,34.96,9.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树顶上的|cRXP_FRIENDLY_大德鲁伊范达尔·鹿盔|r交谈
    .turnin -935 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .turnin -940 >>交任务: |cRXP_FRIENDLY_泰达希尔|r
    .target Arch Druid Fandral Staghelm
    .accept 952 >>接任务: |cRXP_LOOT_古树之林|r
step << Rogue
    .goto Darnassus,31.21,17.72,8,0
    .goto Darnassus,36.99,21.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞尤娜|r交谈
    .turnin 2241 >>交任务: |cRXP_FRIENDLY_詹诺克的花|r
    .target Syurna
    .accept 2242 >>接任务: |cRXP_LOOT_命运的召唤|r
step << Rogue
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    .target Priestess A'moora
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .accept 2518 >>接任务: |cRXP_LOOT_月神的泪水|r
step << Warrior
#xprate >1.99
    #sticky
    #completewith next
    .goto Teldrassil,48.7,62.2,18 >>前往|cRXP_ENEMY_沃鲁斯·邪蹄|r
step << Warrior
#xprate >1.99
    .goto Teldrassil,47.2,63.7
    >>击杀 |cRXP_ENEMY_沃鲁斯·邪蹄|r. 击败他后拾取他的 |cRXP_LOOT_Horn|r
    .complete 1683,1 --Collect Horn of Vorlus (x1)
    .mob Vorlus Vilehoof
step << Hunter
    #season 2
    .goto Darnassus,64.2,63.0
    .line Darnassus,60.65,66.47,61.68,63.73,62.36,58.91,62.32,55.22,65.77,55.75,67.88,57.48,68.35,59.98,65.14,68.14,64.34,71.36,62.28,68.79,60.65,66.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t寻找|cRXP_FRIENDLY_加伊娜|r, 她会在商人露台附近巡逻
    >>|cRXP_BUY_从她那里购买一整堆|r|T133972:0|t[硬肉干] 
    >>|cRXP_WARN_你需要它来喂你的猫头鹰, 它们只吃肉, 而暗夜精灵的黑海岸没有卖肉的商人|r
    .collect 117,15
    .target Jaeana
step << !Warrior
    #season 2
    .goto Darnassus,70.679,45.379
    .target Mydrannul
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈德兰努尔|r交谈
    .accept 6344 >>接任务: |cRXP_LOOT_尼莎·影歌|r
step << Hunter
    #season 2
    .goto Darnassus,58.76,44.48
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
    >>|cRXP_BUY_购买并装备 a|r|T135489:0|t[多层弯弓]
    .collect 2507,1
    .target Ariyell Skyshadow
    .money <0.1751
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.77 
step << Hunter
    #season 2
    #completewith next
    +|cRXP_WARN_装备|r |T135489:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.76
step << Hunter
    #sticky
    #label StrigidHunter
	.goto Teldrassil,41.2,44.4,0
	.goto Teldrassil,44.2,39.8,0
	.goto Teldrassil,45.6,31.4,0
	.goto Teldrassil,37.6,28.8,0
    >>|cRXP_WARN_施放|r|T132164:0|t[驯服野兽]|cRXP_WARN_在|r|cRXP_ENEMY_巨翼猎枭|r身上|r -- .tame 1997
    .train 2981 >>|cRXP_WARN_用它攻击怪物来学习|r |T132140:0|t[利爪 (等级 2)]
    .link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
	.unitscan Strigid Hunter
step << Hunter
    #sticky
    #requires StrigidHunter
    .engrave 5 >>在你的胸甲上刻印[野兽专精]
step
    #season 0 << Rogue/Druid
    .goto Teldrassil,43.2,42.8,55,0
    .goto Teldrassil,43.2,32.8,55,0
    .goto Teldrassil,43.6,26.0,55,0
    .goto Teldrassil,43.2,42.8
	>>击杀|cRXP_ENEMY_林精践踏者|r和|cRXP_ENEMY_林精泥泞兽|r和|cRXP_ENEMY_林精长老|r. 击杀后可掠夺其掉落的|cRXP_LOOT_青苔之瘤|r
    .complete 923,1 --Collect Mossy Tumor (x5)
    .mob Elder Timberling
    .mob Timberling Trampler
    .mob Timberling Mire Beast
step << Hunter
    #season 2
    .train 425762,1
    .goto Teldrassil,48.3,31.4
    >>在尸体附近使用 |T134025:0|t[泰达希尔鸟肉] 召唤|cRXP_ENEMY_Mowgh|r
    >>击杀 |cRXP_ENEMY_Mowgh|r并从他身上获取 |T134419:0|t|cRXP_LOOT_[侧翼符文]|r
    .collect 205979,1
    .train 425762,1 --Flanking Strike
    .use 208608
    .mob Mowgh
step << Hunter
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r]|cRXP_WARN_来训练|r|T132175:0|t[突袭打击]
    .use 205979
    .itemcount 205979,1
    .train 425762,1 --Flanking Strike
step << Hunter
    #season 2
    #optional
    #completewith next
    .engrave 7 >>打开角色面板, 并用|T132175:0|t[侧翼打击]雕刻你的腿部
step
    #season 0 << Rogue/Druid
    #label Spinnerets
	.goto Teldrassil,47.3,26.0,0
    .goto Teldrassil,37.9,25.1,0
    .goto Teldrassil,47.3,26.0,30,0
    .goto Teldrassil,37.9,25.1,30,0
    .goto Teldrassil,40.7,25.4
    >>击杀|cRXP_ENEMY_萨丝拉|r. 击败后掠夺其|cRXP_LOOT_Spinnerets|r
    >>|cRXP_ENEMY_萨丝拉|r |cRXP_WARN_可在3个不同位置刷新|r
    .complete 2518,1 --Collect Silvery Spinnerets (x1)
    .mob Lady Sathrah
step << !sod/Warrior/Rogue/Druid
    .goto Teldrassil,38.3,34.3
    .target Sentinel Arynia Cloudsbreak
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .accept 937 >>接任务: |cRXP_LOOT_神谕林地|r
step << Rogue
    #season 2
    #label Spinnerets
	.goto Teldrassil,47.3,26.0,0
    .goto Teldrassil,37.9,25.1,0
    .goto Teldrassil,47.3,26.0,30,0
    .goto Teldrassil,37.9,25.1,30,0
    .goto Teldrassil,40.7,25.4
    >>击杀|cRXP_ENEMY_萨丝拉|r. 击败后掠夺其|cRXP_LOOT_Spinnerets|r
    >>|cRXP_ENEMY_萨丝拉|r |cRXP_WARN_可在3个不同位置刷新|r
    .complete 2518,1 --Collect Silvery Spinnerets (x1)
    .mob Lady Sathrah
step << Rogue
    .goto Teldrassil,38.0,25.2
    >>|cRXP_WARN_对远古的塞希尔施放|r|T133644:0|t[盗贼技能:扒窃]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_ENEMY_远古的塞希尔|r|cRXP_WARN_沿着大树枝行走|r
    >>|cRXP_WARN_避免与|cRXP_ENEMY_远古的塞希尔|r战斗. 让他从你身边走过, 然后|r|T132320:0|t[潜行]|cRXP_WARN_并在|r|T133644:0|t[偷窃]|cRXP_WARN_他身后时|r
    .complete 2242,1
    .mob Sethir the Ancient
step << Rogue
    #season 2
    #sticky
    #completewith MistStart
    #label BottomRightMapPiece
    >>击杀或 |T133644:0|t[扒窃]|cRXP_ENEMY_血羽哈比|r. 击败它们以获取 |T134327:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208603,1 -- Bottom-Right Map Piece (1)
    .mob Bloodfeather Harpy
    .mob Bloodfeather Rogue
    .mob Bloodfeather Sorceress
    .mob Bloodfeather Fury
    .mob Bloodfeather Wind Witch
    .mob Bloodfeather Matriarch
    .train 398196,1
step << !sod/Warrior/Rogue/Druid
    #sticky
	#label harpies2
    .goto Teldrassil,33.619,29.819,0,0
    >>击杀|cRXP_ENEMY_Bloodfeather Harpies|r. 击杀后搜刮它们的|cRXP_LOOT_Belts|r
    >>|cRXP_ENEMY_血羽女族长|r|cRXP_WARN_施法|r|T136052:0|t[治疗波]|cRXP_WARN_和|r|T136048:0|t[闪电箭]|cRXP_WARN_会造成大量伤害. 尽量快速击杀|r
    .complete 937,1 --Collect Bloodfeather Belt (x6)
    .mob Bloodfeather Harpy
    .mob Bloodfeather Rogue
    .mob Bloodfeather Sorceress
    .mob Bloodfeather Fury
    .mob Bloodfeather Wind Witch
    .mob Bloodfeather Matriarch
step << Rogue
    #season 2
    #sticky
    #completewith next
    #requires BottomRightMapPiece
    .cast 418600 >>|cRXP_WARN_使用任意|r|T134327:0|t[|cRXP_LOOT_地图碎片]|r|cRXP_WARN_将其合成|r|T134269:0|t[|cRXP_LOOT_泰达希尔藏宝图|r]
    .collect 208605,1
    .itemcount 208604,1
    .itemcount 208601,1
    .itemcount 208602,1
    .itemcount 208603,1
    .use 208604
    .use 208601
    .use 208602
    .use 208603
    .train 398196,1
step << !sod/Warrior/Rogue/Druid
    .goto Teldrassil,31.54,31.62
    .target Mist
    #label MistStart
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密斯特|r交谈
    >>|cRXP_WARN_这将触发一个护送任务|r
    >>|cRXP_WARN_如果NPC不在, 请跳过此任务|r
    .accept 938 >>接任务: |cRXP_LOOT_密斯特|r
step << Rogue
    #season 2
    .goto Teldrassil,37.8,43.0,60,0
    .goto Teldrassil,36.0,34.4,60,0
    .goto Teldrassil,34.6,28.8,60,0
    >>击杀或 |T133644:0|t[扒窃]|cRXP_ENEMY_血羽哈比|r. 击败它们以获取 |T134327:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208603,1 -- Bottom-Right Map Piece (1)
    .mob Bloodfeather Harpy
    .mob Bloodfeather Rogue
    .mob Bloodfeather Sorceress
    .mob Bloodfeather Fury
    .mob Bloodfeather Wind Witch
    .mob Bloodfeather Matriarch
    .train 398196,1
step << Rogue
    #season 2
    .cast 418600 >>|cRXP_WARN_使用任意|r|T134327:0|t[|cRXP_LOOT_地图碎片]|r|cRXP_WARN_将其合成|r|T134269:0|t[|cRXP_LOOT_泰达希尔藏宝图|r]
    .collect 208605,1
    .itemcount 208604,1
    .itemcount 208601,1
    .itemcount 208602,1
    .itemcount 208603,1
    .use 208604
    .use 208601
    .use 208602
    .use 208603
    .train 398196,1
step << !sod/Warrior/Rogue/Druid
    .goto Teldrassil,38.3,34.4
    .target Sentinel Arynia Cloudsbreak
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin 938 >>交任务: |cRXP_FRIENDLY_密斯特|r
    .isOnQuest 938
step << !sod/Warrior/Rogue/Druid
    #requires harpies2
    #label TeldrassilEnd
    .goto Teldrassil,38.3,34.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin 937 >>交任务: |cRXP_FRIENDLY_神谕林地|r
    .target Sentinel Arynia Cloudsbreak
    .accept 940 >>接任务: |cRXP_LOOT_泰达希尔|r
step << Druid
    #season 2
    #label Spinnerets
	.goto Teldrassil,47.3,26.0,0
    .goto Teldrassil,37.9,25.1,0
    .goto Teldrassil,47.3,26.0,30,0
    .goto Teldrassil,37.9,25.1,30,0
    .goto Teldrassil,40.7,25.4
    >>击杀|cRXP_ENEMY_萨丝拉|r. 击败后掠夺其|cRXP_LOOT_Spinnerets|r
    >>|cRXP_ENEMY_萨丝拉|r |cRXP_WARN_可在3个不同位置刷新|r
    .complete 2518,1 --Collect Silvery Spinnerets (x1)
    .mob Lady Sathrah
step << Druid
    #season 2
    .goto Teldrassil,43.2,42.8,55,0
    .goto Teldrassil,43.2,32.8,55,0
    .goto Teldrassil,43.6,26.0,55,0
    .goto Teldrassil,43.2,42.8
	>>击杀|cRXP_ENEMY_林精践踏者|r和|cRXP_ENEMY_林精泥泞兽|r和|cRXP_ENEMY_林精长老|r. 击杀后可掠夺其掉落的|cRXP_LOOT_青苔之瘤|r
    .complete 923,1 --Collect Mossy Tumor (x5)
    .mob Elder Timberling
    .mob Timberling Trampler
    .mob Timberling Mire Beast
step << Warrior
    #season 2
    .goto Teldrassil,39.8,37.4,25 >>前往标记地点. 查看|cRXP_FRIENDLY_游荡剑客|r是否在那儿. 如果找到他, 便可向其挑战决斗, 胜利后将获得|rT132334:0|t[|cRXP_FRIENDLY_鲜血狂怒|r]符文
    >>|cRXP_WARN_他有多个刷新点, 同一时间只能出现在其中一个. 如果他不在那里, 请跳过此步骤|r
    .unitscan Wandering Swordsman
    .train 412507,1
step
    #softcore
	#completewith darn << era
    #completewith darnSoD << sod
    .deathskip >>在达纳苏斯墓地死亡并复活
    >>|cRXP_WARN_确保你位于河的西岸, 否则可能会走错方向|r << sod
    .target Spirit Healer
step
    #hardcore
    #completewith next
    .goto Darnassus,82.01,36.70
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Warrior
    #season 2
    .goto Teldrassil,39.8,69.6,25 >>前往标记地点. 如果尚未找到|cRXP_FRIENDLY_Wandering Swordsman|r, 请确认他是否在场. 若找到他, 可向其发起决斗, 胜利后将获得符文 |T132334:0|t[|cRXP_FRIENDLY_Blood Frenzy|r]
    >>|cRXP_WARN_他有多个刷新点, 同一时间只能出现在其中一个. 如果他不在那里, 请跳过此步骤|r
    .unitscan Wandering Swordsman
    .train 412507,1
step << Warrior
    #season 2
    .goto Teldrassil,43.8,77.0,25 >>前往标记地点. 如果尚未找到|cRXP_FRIENDLY_Wandering Swordsman|r, 请确认他是否在场. 若找到他, 可向其发起决斗, 胜利后将获得符文 |T132334:0|t[|cRXP_FRIENDLY_Blood Frenzy|r]
    >>|cRXP_WARN_他有多个刷新点, 同一时间只能出现在其中一个. 如果他不在那里, 请跳过此步骤|r
    .unitscan Wandering Swordsman
    .train 412507,1
step << Warrior
    #softcore
    #completewith next
    #sesaon 2
    .goto Teldrassil,40.8,75.6
    .deathskip >>在达纳苏斯墓地死亡并复活
    >>|cRXP_WARN_请确保你距离达纳苏斯墓地比多尔纳尔墓地更近, 否则可能会走错方向. 如果你不确定, 就去地图标记位置的东边死亡|r
    .target Spirit Healer
step
    #hardcore
    #completewith next
    #season 2
    .goto Darnassus,82.01,36.70
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step
    .goto Darnassus,70.679,45.379
    .target Mydrannul
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈德兰努尔|r交谈
    .accept 6344 >>接任务: |cRXP_LOOT_尼莎·影歌|r
step
    #softcore
    #label darn
    #optional
    .goto Darnassus,82.01,36.70
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step
	.abandon 927 >>放弃苔藓缠绕之心. 你将永远没有机会提交任务
step << Warrior
#xprate <1.99
    .goto Darnassus,57.305,34.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾兰娜瑞|r交谈
    .turnin 1684 >>交任务: |cRXP_FRIENDLY_艾兰娜瑞|r
    .target Elanaria
    .accept 1683 >>接任务: |cRXP_LOOT_沃鲁斯·邪蹄|r
step << Warrior
#xprate <1.99
    #sticky
    #completewith next
    .goto Teldrassil,48.7,62.2,18 >>前往|cRXP_ENEMY_沃鲁斯·邪蹄|r
step << Warrior
#xprate <1.99
    .goto Teldrassil,47.2,63.7
    >>击杀 |cRXP_ENEMY_沃鲁斯·邪蹄|r. 击败他后拾取他的 |cRXP_LOOT_Horn|r
    .complete 1683,1 --Collect Horn of Vorlus (x1)
    .mob Vorlus Vilehoof
step << Warrior
#xprate <1.99
    #softcore
	#sticky
    #completewith next
    .goto Teldrassil,43.6,54.3
    .deathskip >>通过熊怪区域后故意死亡, 并在达纳苏斯复活
step << Warrior
#xprate <1.99
    #hardcore
    #completewith next
    .goto Darnassus,82.01,36.70,100 >>前往: |cRXP_PICK_达纳苏斯|r
step << Warrior
    .goto Darnassus,57.305,34.606
    .target Elanaria
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾兰娜瑞|r交谈
    .turnin 1683 >>交任务: |cRXP_FRIENDLY_沃鲁斯·邪蹄|r
--	.accept 1686 >>接任务: |cRXP_LOOT_艾鲁拉的阴影|r
step << Warrior
    #season 2
    #requires xp10
    .goto Darnassus,63.108,21.858
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_Delwynna|r交谈
    >>|cRXP_WARN_ 交还三个|cRXP_LOOT_ 断头|r以获得|r|T134455:0|t[|cRXP_FRIENDLY_ 怪物猎人符文碎片|r]
    .collect 204689,1
    .collect 204690,1
    .collect 204688,1
    .use 204703
    .skipgossip
    .target Delwynna
    .itemcount 208612,1 --Severed Spider Head (1)
    .itemcount 208611,1 --Severed Tiger Head (1)
    .itemcount 208610,1 --Severed Owl Head
    .train 403475,1 --Rune not known
step << Warrior
    #season 2
    >>使用任意一个 |T134455:0|t[|cRXP_FRIENDLY_怪物猎人的符文碎片|r], 将其合成得到 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .train 403475 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]|cRXP_WARN_来训练|r|T135291:0|t[毁灭]
    .use 204689
    .itemcount 204689,1
    .itemcount 204690,1
    .itemcount 204688,1
step << Hunter
#xprate <1.99
    .goto Darnassus,40.377,8.545
    .target Jocaste
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .turnin 6103 >>交任务: |cRXP_FRIENDLY_训练野兽|r
step << Druid
    #season 0
    .goto Darnassus,35.38,8.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与中层的|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 5931 >>交任务: |cRXP_FRIENDLY_返回达纳苏斯|r
    .target Mathrengyl Bearwalker
    .accept 6001 >>接任务: |cRXP_LOOT_身心之力|r
step
    #season 0
    .goto Darnassus,34.814,9.255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊范达尔·鹿盔|r交谈
    .turnin -935 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .turnin -940 >>交任务: |cRXP_FRIENDLY_泰达希尔|r
    .target Arch Druid Fandral Staghelm
    .accept 952 >>接任务: |cRXP_LOOT_古树之林|r
step << !Rogue
    #season 2
    #label darnSoD
    .goto Darnassus,38.184,21.639
    .target Rellian Greenspyre
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    .turnin 923 >>交任务: |cRXP_FRIENDLY_青苔之瘤|r
step << Rogue
    #season 2
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .turnin 2518 >>交任务: |cRXP_FRIENDLY_月神的泪水|r
    .target Priestess A'moora
    .accept 2520 >>接任务: |cRXP_LOOT_萨丝拉的祭品|r
step << Rogue
    #season 2
    .goto Darnassus,39.7,85.8
	.use 8155 >>|cRXP_WARN_使用|r|T135652:0|t[萨丝拉的祭品]|cRXP_WARN_在喷泉处|r
    .complete 2520,1 --Offer the sacrifice at the fountain
step << Rogue
    #season 2
    #label end
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    .target Priestess A'moora
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .turnin 2520 >>交任务: |cRXP_FRIENDLY_萨丝拉的祭品|r
step << Warrior/Rogue/Druid
    #season 2
    .goto Darnassus,34.814,9.255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊范达尔·鹿盔|r交谈
    .turnin 940 >>交任务: |cRXP_FRIENDLY_泰达希尔|r
    .target Arch Druid Fandral Staghelm
    .accept 952 >>接任务: |cRXP_LOOT_古树之林|r
step
    #season 0
    .goto Darnassus,38.184,21.639
    .target Rellian Greenspyre
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    .turnin 923 >>交任务: |cRXP_FRIENDLY_青苔之瘤|r
step << Hunter
    .goto Darnassus,40.2,9.8
    .trainer >>学习12级法术 << sod
    >>|cRXP_WARN_如果你没有足够的钱或等级未达到12级, 可跳过此步骤, 待交出“月神的泪水”后再回来|r << sod
    .target Jocaste
step << Hunter
    .goto Darnassus,42.2,8.8
    .trainer >>训练宠物技能
    .target Silvaria
step << Rogue
    #season 2
    .goto Darnassus,38.6,15.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱兰奈|r交谈
    .vendor >>|cRXP_BUY_出售垃圾|r
    .target Lelanai
step << Rogue
    .goto Darnassus,31.21,17.72,8,0
    .goto Darnassus,36.99,21.91
    .target Syurna
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞尤娜|r交谈
    .turnin 2242 >>交任务: |cRXP_FRIENDLY_命运的召唤|r
step << Rogue
    #season 2
    >>|cRXP_WARN_确保训练后至少剩余29银, 你将需要用它来购买弓|r
    .trainer >>学习12级法术
step << !sod/!Rogue
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .turnin 2518 >>交任务: |cRXP_FRIENDLY_月神的泪水|r
    .target Priestess A'moora
    .accept 2520 >>接任务: |cRXP_LOOT_萨丝拉的祭品|r
step << !sod/!Rogue
    .goto Darnassus,39.7,85.8
	.use 8155 >>|cRXP_WARN_使用|r|T135652:0|t[萨丝拉的祭品]|cRXP_WARN_在喷泉处|r
    .complete 2520,1 --Offer the sacrifice at the fountain
step << !sod/!Rogue
    #label end
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    .target Priestess A'moora
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .turnin 2520 >>交任务: |cRXP_FRIENDLY_萨丝拉的祭品|r
step << Priest
    #season 2
    .goto Darnassus,40.0,80.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女祭司阿兰希雅|r交谈
    .turnin 5629 >>交任务: |cRXP_FRIENDLY_回家|r
    .target Priestess Alathea
step << Priest
    #season 2
    .goto Darnassus,38.6,82.0
    .trainer >>学习12级法术
step << Druid
#ssf
    #season 0
    .goto Darnassus,47.95,68.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲罗迪恩·唤月|r交谈
    .train 2366 >>学习 |T136065:0|t[草药学]
    >>|T136065:0|t[草药学] |cRXP_WARN_需要采集 5|r|T134187:0|t[地根草] |cRXP_WARN_用于一个即将开启的重要职业任务. 完成后可选择遗忘|r
    .target Firodren Mooncaller
step
    #ah
    .goto Darnassus,56.245,54.039,-1
    .goto Darnassus,56.374,51.820,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达纳苏斯拍卖商|r交谈
    >>请购买以下物品, 以便稍后在黑海岸立即提交
    >>|T134187:0|t[地根草] << Druid era
    >>|T133912:0|t[黑海岸石斑鱼]
    >>|T133972:0|t[陆行鸟肉]
    *Skip this step if you wish to not buy any
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .collect 2449,5,6123,1 << Druid
    .target Auctioneer Tolon
    .target Auctioneer Golothas
step << Hunter
    .goto Darnassus,64.2,63.0
    .line Darnassus,60.65,66.47,61.68,63.73,62.36,58.91,62.32,55.22,65.77,55.75,67.88,57.48,68.35,59.98,65.14,68.14,64.34,71.36,62.28,68.79,60.65,66.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t寻找|cRXP_FRIENDLY_加伊娜|r, 她会在商人露台附近巡逻
    >>|cRXP_BUY_从她那里购买一整堆|r|T133972:0|t[硬肉干] 
    >>|cRXP_WARN_你需要它来喂你的猫头鹰, 它们只吃肉, 而暗夜精灵的黑海岸没有卖肉的商人|r
    .collect 117,15
    .target Jaeana
step << Hunter
    #season 2
    .goto Darnassus,64.2,59.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔兰|r交谈. 他在小屋的上层
    >>|cRXP_BUY_购买|r |T135145:0|t[手杖]
    >>|cRXP_WARN_如果您的背包中已备有其他法杖, 请跳过此步骤|r
    .collect 2495,1
    .target Kieran
    .money <0.1539
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.19
step << Hunter/Warrior/Priest/Sod Rogue
    .goto Darnassus,57.56,46.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊琳尼雅·月火|r交谈
    .train 227 >>训练法杖 << Hunter/Warrior/Priest
    .train 265 >>训练弓箭 << Sod Rogue
    >>如果你的背包里有法杖, 请装备它 << Hunter
    >>如果你的背包里有弓, 请装备它 << Rogue
    .target Ilyenia Moonfire
step << Hunter
    #optional
    #completewith end
    +|cRXP_WARN_装备|r|T135145:0|t[手杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.19
step << Hunter/Sod Rogue
    .goto Darnassus,58.76,44.48
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
    >>|cRXP_BUY_购买并装备 a|r|T135489:0|t[多层弯弓]
    .collect 2507,1
    .target Ariyell Skyshadow
    .money <0.1751
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.77
step << Hunter
    #season 0
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
	.vendor >>|cRXP_BUY_购买|r|T132382:0|t[锋利的箭]
    .target Ariyell Skyshadow
step << Hunter/Sod Rogue
    #season 2
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
	.vendor >>|cRXP_BUY_购买|r|T132382:0|t[锋利的箭]
    .vendor >>|cRXP_BUY_如果你有闲钱, 就买 a|r|T134410:0|t[中型箭袋]|r << Hunter
    .target Ariyell Skyshadow
step << Hunter
    #completewith next
    +|cRXP_WARN_装备|r |T135489:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.76
step << Warrior
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
    >>|cRXP_BUY_购买|r|T135147:0|t[法师之杖]|cRXP_BUY_. 在15级时装备它|r
	.collect 2030,1
    .target Ariyell Skyshadow
    .money <0.5022
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Warrior
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
    >>|cRXP_BUY_购买 a|r|T135154:0|t[短杖]|cRXP_BUY_. 在 11 级时装备它|r << era
    >>|cRXP_BUY_购买并装备|r|T135154:0|t[短杖] |cRXP_BUY_如果买不起, 就用|r|T135147:0|t[法师之杖] << sod
	.collect 854,1
    .target Ariyell Skyshadow
    .money <0.3022
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.44
step << Warrior
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
	>>|cRXP_BUY_购买并装备|r |T135346:0|t[斗士短剑] |cRXP_BUY_如果负担不起, 就用|r |T135154:0|t[短杖]
	.collect 851,1
    .target Ariyell Skyshadow
    .money <0.2023
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.82
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r|T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.81
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r|T135154:0|t[短杖]
    .use 854
    .itemcount 854,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.43
step << Warrior
    #season 2
	.goto Darnassus,58.6,35.6
    .target Arias'ta Bladesinger
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arias'ta 刀锋舞者|r交谈
    .trainer >>训练你的职业法术
step << Rogue
    #season 0
    .goto Darnassus,62.68,65.58
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    >>|cRXP_BUY_购买一个|r|T135641:0|t[破损的平衡飞刀]
    .collect 2946,1 -- Balanced Throwing Dagger
    .target Turian
step
    #completewith NessaShadowsong
    .goto Darnassus,28.52,39.89
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
    .zoneskip Darkshore
    .subzoneskip 702
step << Rogue
    #season 2
    #completewith next
    .goto Teldrassil,55.339,90.818
    .cast 421424 >>|cRXP_WARN_使用|r|T134269:0|t[|cRXP_LOOT_泰达希尔藏宝图|r]|cRXP_WARN_在鲁瑟兰村的树干内. 这将触发一个|cRXP_PICK_埋藏的宝藏|r出现|r
    .use 208605
    .itemcount 208605,1
    .train 398196,1
step << Rogue
    #season 2
    >>打开|cRXP_PICK_Buried Treasure|r. 从中获取 |T134419:0|t[|cRXP_FRIENDLY_迅捷符文|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
step << Rogue
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_迅捷拔枪符文|r]|cRXP_WARN_来训练|r|T134536:0|t[迅捷拔枪]
    .use 203991
    .itemcount 203991,1
step
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼莎·影歌|r 交谈
    .turnin 6344 >>交任务: |cRXP_FRIENDLY_尼莎·影歌|r
    .target Nessa Shadowsong
    .accept 6341 >>接任务: |cRXP_LOOT_泰达希尔的渔业|r
step
    #label NessaShadowsong
    #optional
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼莎·影歌|r 交谈
    .turnin 6343 >>交任务: |cRXP_FRIENDLY_飞回泰达希尔|r
    .isOnQuest 6343
    .target Nessa Shadowsong
step
    .goto Teldrassil,58.399,94.016
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .turnin 6341 >>交任务: |cRXP_FRIENDLY_泰达希尔的渔业|r
    .target Vesprystus
    .accept 6342 >>接任务: |cRXP_LOOT_飞往奥伯丁|r
step
    .goto Teldrassil,58.399,94.016
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >>飞往黑海岸
    .target Vesprystus
]])
