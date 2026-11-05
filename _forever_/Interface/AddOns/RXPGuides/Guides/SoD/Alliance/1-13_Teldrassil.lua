local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
<< Alliance
#season 2
#name 1-7 Shadowglen SoD
#title 幽影谷
#version 1
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#defaultfor NightElf
#next 7-13 Teldrassil SoD
#displayname 1-7 幽影谷
step << !NightElf
    #sticky
    #completewith next
    +您选择的是暗夜精灵指南, 请选择与角色起始区域相同的指南
step
    .goto Teldrassil,58.695,44.266
    .target 管理员伊尔萨莱恩
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .accept 456 >> 接任务：自然的平衡
step << Druid/Warrior/Rogue/Hunter/Priest
    .goto Teldrassil,58.88,43.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_符文贩子|r 交谈
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衣]|cRXP_BUY_，并从他那里购买|T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]|r << Priest
    >>|cRXP_BUY_出售你的|r |T133975:0|t[苹果] |cRXP_BUY_并购买以下符文：|r << Druid
    >>|cRXP_BUY_卖掉一份|T133972:0|t|cRXP_LOOT_[硬肉干]|r，再购买|r|T134419:0|t[|cRXP_FRIENDLY_乘胜追击符文|r] << Warrior
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衣]和|T132540:0|t[靴子]|cRXP_WARN_（它们无法刻印符文）|r|cRXP_BUY_，并购买|T134419:0|t[|cRXP_FRIENDLY_暗影打击符文|r]|cRXP_BUY_和|r|T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r] << Rogue
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衣]和|T132540:0|t[靴子]|cRXP_WARN_（它们无法刻印符文）|r|cRXP_BUY_，并从他那里购买|T134419:0|t[|cRXP_FRIENDLY_杀戮命令符文|r]|cRXP_BUY_和|r|T133739:0|t[|cRXP_FRIENDLY_论述：雄狮之心|r]|r << Hunter
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel
    .collect 209852,1 << Hunter --Rune of Kill Command
    .collect 226401,1 << Hunter --Treatise on the Heart of the Lion
    .collect 208414,1 << Druid --Lunar Idol
    .collect 210500,1 << Druid --Rune of the Stars
    .collect 206989,1 << Druid --Rune of the Sun
    .collect 227749,1 << Druid --Rune of the Falling Star
    .collect 204806,1 << Warrior --Rune of Victory Rush
    .collect 204795,1 << Rogue --Rune of Shadowstep
    .collect 208772,1 << Rogue --Rune of Saber Slash
    >>其余符文很快就会获得
    .target 符文贩子
    .skipgossip
step << Warrior/Rogue/Hunter/Druid/Priest
    .equip 18,208414 >> 装备 |T134903:0|t[|cRXP_FRIENDLY_月光神像|r]，30 秒后使用以学习 |T237472:0|t[怒风之怒] << Druid
    .train 402852 >> 使用 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] 学习 |T237570:0|t[裂魂魔] << Priest
    .train 400105 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_暗影打击符文|r] 学习 |T132323:0|t[暗影打击] << Rogue
    .train 424984 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r] 学习 |T132375:0|t[军刀猛刺] << Rogue
    .train 403470 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_乘胜追击符文|r] 学习 |T132342:0|t[乘胜追击]，稍后刻印 << Warrior
    .train 410111 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_杀戮命令符文|r] << Hunter
    .train 409580 >> 使用 |T133739:0|t[|cRXP_FRIENDLY_论述：雄狮之心|r] 学习 |T132185:0|t[雄狮之心] << Hunter
    .train 424718 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_星辰符文|r] 学习 |T135730:0|t[星涌术] << Druid
    .train 416044 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_日灼符文|r] 学习 |T236216:0|t[阳炎术] << Druid
    .train 439770 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_坠落星辰符文|r] 学习 |T236168:0|t[星辰坠落] << Druid
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
    .engrave 7 >> 在裤子上刻印 |T237570:0|t[裂魂魔] << Priest
    .engrave 7 >> 在裤子上刻印 |T236174:0|t[夺命射击] << Hunter
    .engrave 7 >> 在裤子上刻印 |T135730:0|t[星涌术] << Druid
step << Hunter
    #optional
    #sticky
    .aura 409583 >> 记得激活 |T132185:0|t[雄狮之心]
step << Druid
    #season 2
    #optional
    #sticky
    .train 410061 >> 从角色面板使用 |T134903:0|t[|cRXP_FRIENDLY_月光神像|r] 学习 |T237472:0|t[怒风之怒]
    .engrave 5 >> 在胸甲上刻印 |T237472:0|t[怒风之怒]
step
    #sticky
    #label balance1
    #completewith GoodProtector
    >>击杀 |cRXP_ENEMY_夜刃豹幼崽|r 和 |cRXP_ENEMY_草刺野猪幼崽|r
    .goto Teldrassil,62.0,42.6,0,0
    .complete 456,1 --Kill Young Nightsaber (x7)
    .complete 456,2 --Kill Young Thistle Boar (x4)
    .mob 夜刃豹幼崽
    .mob 草刺野猪幼崽
step
    >>拾取击杀的怪物掉落的物品，确保杂物至少可卖10铜币；你需要这笔钱学习|T132333:0|t[战斗怒吼]<< Warrior
    .xp 2 >> 刷到2级
step << !Warrior !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪兰妮亚·月光|r和|cRXP_FRIENDLY_麦利萨尔·鹿盔|r交谈
    #label GoodProtector
    .accept 4495 >> 接任务：好朋友
    .goto Teldrassil,60.899,41.961
    .accept 458 >> 接任务：森林守护者
	.goto Teldrassil,59.924,42.474
    .target 迪兰妮亚·月光
    .target 麦利萨尔·鹿盔
step << Warrior
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦利萨尔·鹿盔|r交谈
    #label GoodProtector
    .accept 458 >> 接任务：森林守护者
	.goto Teldrassil,59.924,42.474
    .target 麦利萨尔·鹿盔
step << Warrior/Rogue
    #season 2
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
	.vendor >> |cRXP_WARN_卖掉杂物|r
    .target 奇娜
step << Rogue
    .goto Teldrassil,59.63,38.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗拉胡恩·影语者|r交谈
    .accept 77573 >> 接任务：抢占二楼
    .turnin 77573 >> 交任务：抢占二楼
    .target 弗拉胡恩·影语者
step << Warrior
    #season 2
    .goto Teldrassil,59.637,38.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莉希亚|r交谈
    .accept 77575 >> 接任务：暗影蛛网之间
    .turnin 77575 >> 交任务：暗影蛛网之间
    .trainer >> 学习 |T132333:0|t[战斗怒吼]
    .target 奥莉希亚
step << Warrior/Rogue
    .equip 10 >> 装备 |T132938:0|t[无光泽的链甲手套] << Warrior
    .engrave 10 >> 在手套上刻印 |T132342:0|t[乘胜追击] << Warrior
    .use 2385 << Warrior -- Tarnished Chain Gloves
    .equip 10 >> 装备 |T132952:0|t[破损的皮手套] << Rogue
    .engrave 10 >> 在手套上刻印 |T132375:0|t[军刀猛刺] << Rogue
    .use 2125 << Rogue --Cracked Leather Gloves
step << Warrior/Rogue
    #label GoodProtector << Rogue
    #season 2
    .goto Teldrassil,60.8,42.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪兰妮亚·月光|r交谈
    .accept 4495 >> 接任务：好朋友
    .target 迪兰妮亚·月光
    .goto Teldrassil,59.924,42.474 << Rogue
    .accept 458 >> 接任务：森林守护者 << Rogue
    .target 麦利萨尔·鹿盔 << Rogue
step
    >>|cRXP_WARN_怪物掉落可装备的装备时，务必全部装备上。你需要在这些装备上刻印|r|T134419:0|t[符文]|cRXP_WARN_。|r
    >>击杀 |cRXP_ENEMY_夜刃豹幼崽|r 和 |cRXP_ENEMY_草刺野猪幼崽|r
    .goto Teldrassil,62.0,42.6,0,0
    .complete 456,1 --Kill Young Nightsaber (x7)
    .complete 456,2 --Kill Young Thistle Boar (x4)
    .mob 夜刃豹幼崽
    .mob 草刺野猪幼崽
step
    #requires balance1
	.goto Teldrassil,58.695,44.266
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    >>选择|T132939:0|t[手套]作为任务奖励，用于刻印符文 << Druid/Hunter
    >>选择|T132611:0|t[护腕]作为任务奖励，用于刻印符文 << Priest
    .turnin 456 >> 交任务：自然的平衡
    .target 管理员伊尔萨莱恩
    .accept 457 >> 接任务：自然的平衡
step << Hunter/Rogue/Priest
    .goto Teldrassil,58.88,43.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_符文贩子|r 交谈
    >>|cRXP_WARN_不要将可装备的物品卖给商人|r
    >> |cRXP_BUY_出售垃圾并购买以下所有符文:|r << Hunter/Rogue/Priest
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
    >>其余符文很快就会获得
    .target 符文贩子
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
    .train 431663 >> 使用 |T135791:0|t[|cRXP_FRIENDLY_灵智顿悟|r] 学习 |T136181:0|t[心灵尖刺] << Priest
    .train 431705 >> 使用 |T135791:0|t[|cRXP_FRIENDLY_虚无顿悟|r] 学习 |T132886:0|t[虚空领域] << Priest
    .train 425216 >> 使用 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] 学习 |T237514:0|t[虚空疫病] << Priest
    .train 402862 >> 使用 |T136222:0|t[|cRXP_FRIENDLY_忧虑助祭的回忆|r] 学习 |T237545:0|t[苦修] << Priest
    .train 402849 >> 使用 |T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言|r] 学习 |T136149:0|t[暗言术：灭] << Priest
    .train 410121 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r] 学习 |T236176:0|t[奇美拉射击] << Hunter
    .train 415423 >> 使用 |T133739:0|t[|cRXP_FRIENDLY_论述：蝰蛇守护|r] 学习 |T132160:0|t[蝰蛇守护] << Hunter
    .train 410122 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_独来独往符文|r] 学习 |T132266:0|t[独来独往] << Hunter
    .train 416086 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_短兵相接符文|r] 学习 |T132394:0|t[近战专家] << Hunter
    .train 440563 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_游击符文|r] 学习 |T132171:0|t[一击脱离] << Hunter
    .train 400101 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_暗影步符文|r] 学习 |T132303:0|t[暗影步] << Rogue
    .train 432301 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_犯禁符文|r] 学习 |T236285:0|t[压倒优势] << Rogue
    .train 415922 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_豪侠符文|r] 学习 |T134538:0|t[短枪射击] << Rogue
step << Druid
    #sticky
    #optional
    >> |cRXP_WARN_留意|r 披风 |cRXP_WARN_掉落|r |cRXP_WARN_，获得后装备并铭刻|r |T236168:0|t[星辰坠落] |cRXP_WARN_到披风上|r
    .engrave 15 >> 铭刻 |T236168:0|t[星辰坠落]，部位为 |T133771:0|t[披风]
step << Hunter
    #sticky
    #optional
    >> |cRXP_WARN_留意|r 胸甲/腰带/披风 |cRXP_WARN_掉落|r |cRXP_WARN_，获得后装备，并铭刻各部位对应的符文|r
    .engrave 5 >> 铭刻 |T132266:0|t[独来独往]，部位为 |T132724:0|t[胸甲]
    .engrave 6 >> 铭刻 |T132394:0|t[近战专家]，部位为 |T132513:0|t[腰带]
    .engrave 15 >> 铭刻 |T132171:0|t[一击脱离]，部位为 |T133771:0|t[披风]
step << Rogue
    #sticky
    #optional
    >> |cRXP_WARN_留意|r 腰带/披风/护腕 |cRXP_WARN_掉落|r |cRXP_WARN_，获得后装备，并铭刻各部位对应的符文|r
    .engrave 9 >> 铭刻 |T236285:0|t[压倒优势]，部位为 |T133830:0|t[护腕]
    .engrave 6 >> 铭刻 |T132303:0|t[暗影步]，部位为 |T132513:0|t[腰带]
    .engrave 15 >> 铭刻 |T134538:0|t[短枪射击]，部位为 |T133771:0|t[披风]
step << Hunter/Druid
    #optional
    #sticky
    .equip 10 >> 装备 |T132939:0|t[箭术训练手套]
    .engrave 10 >> 在手套上刻印 |T236176:0|t[奇美拉射击] << Hunter
    .engrave 10 >> 在手套上刻印 |T236216:0|t[阳炎术] << Druid
    .use 5394
step << NightElf Priest
    #season 2
    .goto Teldrassil,59.6,41.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_简娜·明月|r 交谈
    >>|cRXP_BUY_将垃圾卖给商人，购买|r |T132495:0|t[薄布腰带] |cRXP_BUY_和|r |T132543:0|t[薄布靴]|cRXP_BUY_。你需要它们来铭刻符文|r
    .collect 3599,1 --Thin Cloth Belt (1)
    .collect 2117,1 --Thin Cloth Shoes (1)
    .target 简娜·明月
step << NightElf Priest
    #season 2
    .goto Teldrassil,59.174,40.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊达|r交谈（在楼上）
    .accept 77574 >> 接任务：艾露恩之思
    .turnin 77574 >> 交任务：艾露恩之思
    .target 珊达
step << Priest
    #optional
    #completewith next
    .equip 10 >> 装备 |T132961:0|t[破布手套]
    .equip 6 >> 装备 |T132495:0|t[薄布腰带]
    .equip 8 >> 装备 |T132543:0|t[薄布靴]
    .equip 9 >> 装备 |T132611:0|t[树叶护腕]
    .engrave 10 >> 在手套上刻印 |T136149:0|t[暗言术：灭]
    .engrave 6 >> 在腰带上刻印 |T136181:0|t[心灵尖刺]
    .engrave 8 >> 在脚上刻印 |T237514:0|t[虚空疫病]
    .engrave 9 >> 在护腕上刻印 |T132886:0|t[虚空领域]
    .use 711 --Tattered Cloth Gloves
    .use 3599 --Thin Cloth Belt
    .use 2117 --Thin Cloth Shoes
    .use 11187 --Stemleaf Bracers
step << NightElf Priest
    #season 2
    .goto Teldrassil,59.6,40.8
    >>|cRXP_WARN_跳下去|r，并与 |Tinterface/worldmap/chatbubble_64grey.blp:20|t |cRXP_FRIENDLY_德林拉尔|r 交谈
    .vendor >>|cRXP_BUY_购买10份|r |T132794:0|t|cRXP_LOOT_清凉的泉水|r
    .target 德林拉尔
step
    #label balancetwocomplete
    .goto Teldrassil,59.8,34.1
    >>击杀 |cRXP_ENEMY_癞皮夜刃豹|r 和 |cRXP_ENEMY_草刺野猪|r
    .complete 457,1 --Kill Mangy Nightsaber (x7)
    .complete 457,2 --Kill Thistle Boar (x7)
    .mob 癞皮夜刃豹
    .mob 草刺野猪
step
    .goto Teldrassil,54.593,32.992
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃沃隆|r交谈
    .turnin 4495 >> 交任务：好朋友
    .target 埃沃隆
    .accept 3519 >> 接任务：需要帮助的朋友
step
    #season 2
    .goto Teldrassil,59.8,34.1
    .xp 3-400 >> 刷怪至还差400点经验升到3级（500/900）
step
    #completewith next
    .hs >> 炉石回幽影谷
step
    .goto Teldrassil,57.9,45.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r交谈
    .turnin 458 >> 交任务：森林守护者
    .target 塔琳德拉
    .accept 459 >> 接任务：森林守护者
step
    #requires balance1
	.goto Teldrassil,58.695,44.266
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .turnin 457 >> 交任务：自然的平衡
    .target 管理员伊尔萨莱恩
	.accept 3116 >> 接任务：简易符记 << Warrior
	.accept 3117 >> 接任务：风化符记 << Hunter
    .accept 3120 >> 接任务：绿色符记 << Druid
    .accept 3119 >> 接任务：神圣符记 << Priest
step
    .goto Teldrassil,60.899,41.961
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪兰妮亚·月光|r交谈
    .turnin 3519 >> 交任务：需要帮助的朋友
    .target 迪兰妮亚·月光
    .accept 3521 >> 接任务：埃沃隆的解药
step << Hunter
    #season 2
    #completewith htraining
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
    >>|cRXP_WARN_离开商人时确保还剩1银币，以支付|r|T132204:0|t[|cRXP_FRIENDLY_毒蛇钉刺|r]|cRXP_WARN_的训练费用；若买弓后无法支付训练费，就不要买弓|r
	.vendor >> |cRXP_BUY_购买一组|r|T132382:0|t[劣质箭]
    .vendor >> |cRXP_BUY_购买|r|T135499:0|t[角木弯弓]
    .target 奇娜
step << Hunter
    #season 2
    #completewith next
    +|cRXP_WARN_装备|r |T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.37
step << !Hunter !Druid !Priest
    #season 2
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
	.vendor >> |cRXP_WARN_卖掉杂物|r
    .target 奇娜
 step << NightElf Warrior
    #season 2
    .goto Teldrassil,59.637,38.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莉希亚|r交谈
    .turnin 3116 >> 交任务：简易符记
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .target 奥莉希亚
step << Druid/Priest
    #season 2
    #label DTrain4
    .goto Teldrassil,59.602,40.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德林拉尔|r交谈
    .vendor >> |cRXP_WARN_卖掉杂物|r
    >>|cRXP_BUY_购买10份|r|T132794:0|t[清凉的泉水]
    .collect 159,10 --Collect Refreshing Spring Water (x10)
    .target 德林拉尔
step
    .goto Teldrassil,57.807,41.653
    .target 基尔沙兰·风行者
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔沙兰·风行者|r交谈
    .accept 916 >> 接任务：树林蜘蛛的毒囊
    .target 基尔沙兰·风行者
step << Hunter
    .xp 4-40
step << Hunter
    #label htraining
    .goto Teldrassil,57.80,40.97,25,0
    .goto Teldrassil,58.659,40.449
    >>爬上奥达希尔大树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿亚娜·远途|r交谈
    .turnin 3117 >> 交任务：风化符记
    .accept 77568 >> 接受任务 猎人的力量
    .turnin 77568 >> 交任务 猎人的力量
    .train 1978 >>学习 [毒蛇钉刺]
    .target 阿亚娜·远途
step
    .goto Teldrassil,57.95,38.20,10,0
    .goto Teldrassil,57.76,37.27,10,0
    .goto Teldrassil,58.21,36.40,10,0
    .goto Teldrassil,58.81,37.83,10,0
    .goto Teldrassil,57.95,38.20
    >>拾取地面上的 |cRXP_LOOT_月牙百合花|r
    .complete 3521,2 --Collect Moonpetal Lily (x4)
step
    #label IchorVenomSac
    .goto Teldrassil,56.8,31.7
    >>击杀 |cRXP_ENEMY_树林蜘蛛|r, 搜刮 |cRXP_LOOT_树林蜘蛛的脓液|r 和 |cRXP_LOOT_毒囊|r
    .complete 3521,3 --Collect Webwood Ichor (x1)
    .complete 916,1 --Collect Webwood Venom Sac (x10)
    .mob 树林蜘蛛
step
    .goto Teldrassil,55.0,43.7
    >>击杀 |cRXP_ENEMY_小劣魔|r 和 |cRXP_ENEMY_劣魔|r, 搜刮 |cRXP_LOOT_蘑菇|r 和 |cRXP_LOOT_魔苔|r
    .complete 3521,1 --Collect Hyacinth Mushroom (x7)
    .complete 459,1 --Collect Fel Moss (x8)
    .mob 小劣魔
    .mob 劣魔
step
    .goto Teldrassil,57.8,45.1
    .target 塔琳德拉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r交谈
    >>提示：|cRXP_WARN_选择护腿作为任务奖励并保留，稍后会在上面刻印符文|r << sod Hunter/sod Rogue/sod Warrior/sod Druid
    .turnin 459 >> 交任务：森林守护者
step
    .goto Teldrassil,60.899,41.961
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪兰妮亚·月光|r交谈
    .turnin 3521 >> 交任务：埃沃隆的解药
    .accept 3522 >> 接任务：埃沃隆的解药
    .target 迪兰妮亚·月光
    .xp >7,1
step
    .goto Teldrassil,60.899,41.961
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪兰妮亚·月光|r交谈
    .turnin 3521 >> 交任务：埃沃隆的解药
    .target 迪兰妮亚·月光
    .xp <7,1
step << !Hunter
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
	.vendor >> |cRXP_WARN_卖掉杂物|r << !Hunter
    .target 奇娜
step << Hunter
    #season 2
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
	.vendor >> |cRXP_WARN_卖掉杂物|r << !Hunter
	.vendor >> |cRXP_BUY_购买3或4组|r|T132382:0|t[劣质箭] << Hunter
    .vendor >> |cRXP_BUY_购买|r|T135499:0|t[角木弯弓]|cRXP_BUY_（若尚未拥有）|r << Hunter
    .target 奇娜
step << Hunter
    #completewith next
    +|cRXP_WARN_装备|r |T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.37
step
    .goto Teldrassil,57.807,41.653
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔沙兰·风行者|r交谈
    .turnin 916 >> 交任务：树林蜘蛛的毒囊
    .target 基尔沙兰·风行者
    .accept 917 >> 接任务：树林蜘蛛的卵
    .xp >7,1
step
    .goto Teldrassil,57.807,41.653
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔沙兰·风行者|r交谈
    .turnin 916 >> 交任务：树林蜘蛛的毒囊
    .target 基尔沙兰·风行者
    .xp <7,1
step << Hunter/Rogue
    #completewith next
    +|cRXP_WARN_装备|r |T135641:0|t[棘木匕首]
    .use 5392
    .itemcount 5392,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.05
step << Druid
    #season 2
    .goto Teldrassil,57.80,40.97,25,0
    .goto Teldrassil,58.626,40.287
    >>爬上奥达希尔大树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛丹特·硬木|r交谈
	.turnin 3120 >> 交任务：绿色符记
    .train 5177 >>学习|T136006:0|t[|cRXP_FRIENDLY_愤怒|r]等级2
    .target 玛丹特·硬木
step
    .goto Teldrassil,54.593,32.992
    .target 埃沃隆
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃沃隆|r交谈
    >>提示：|cRXP_WARN_选择裤子作为任务奖励，稍后会在上面刻印符文|r << Priest sod
    .turnin 3522 >> 交任务：埃沃隆的解药
    .isOnQuest 3522
step
    #completewith next
    .goto Teldrassil,56.73,31.17,25 >> 进入黑丝洞
    .isOnQuest 917
step
    .goto Teldrassil,57.0,26.4
    >>在洞穴深处拾取地上的 |cRXP_LOOT_树林蜘蛛的卵|r
    .complete 917,1 --Collect Webwood Egg (x1)
    .isOnQuest 917
step
	#softcore
	#completewith next
    .deathskip >> 死亡后在灵魂医者处复活
    .target 灵魂医者
    .isOnQuest 917
step
	.goto Teldrassil,57.807,41.653
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔沙兰·风行者|r交谈
    >>提示：|cRXP_WARN_选择外套作为本任务的奖励并装备，稍后会在上面刻印符文|r << Hunter/Rogue
    .turnin 917 >> 交任务：树林蜘蛛的卵
    .target 基尔沙兰·风行者
    .isQuestComplete 917
step
    #season 2
    #label ExitRune
    .goto Teldrassil,58.88,43.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_符文贩子|r 交谈
    >>|cRXP_WARN_不要将可装备的物品卖给商人|r
    .vendor >> |cRXP_BUY_卖掉杂物，并从他那里购买你需要的全部|T134419:0|t|cRXP_WARN_[符文]|r
    .target 符文贩子
    .skipgossip
step << NightElf Priest
    .xp <5,1
    .goto Teldrassil,59.2,40.5
    .target 珊达
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊达|r交谈
    .accept 5622 >> 接任务：月神的恩赐
    .turnin 3119 >> 交任务：神圣符记
step
    .goto Teldrassil,61.159,47.644
    .target 伯萨努斯
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯萨努斯|r交谈
    .accept 2159 >> 接任务：多兰纳尔的货物
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
<< Alliance
#season 2
#name 7-13 Teldrassil SoD
#title 泰达希尔
#version 1
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#defaultfor NightElf
#next 13-20 Darkshore SoD
#displayname 7-13 泰达希尔
step
    .goto Teldrassil,60.5,56.3
    .target 赛恩·腐蹄
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .accept 488 >> 接任务：赛恩的要求
step << Hunter
    #season 2
    #completewith FlankingStrike
    #sticky
    >>任务途中击杀 |cRXP_ENEMY_巨翼枭|r 或 |cRXP_ENEMY_巨翼恶枭|r，拾取 |T134025:0|t|cRXP_LOOT_泰达希尔鸟肉|r
    .collect 208608,1 -- Teldrassil Bird Meat 1/1
    .train 425762,1 --Flanking Strike
step << Warrior
    #season 2
    #completewith zenn
    >>击杀|cRXP_ENEMY_夜刃豹|r或|cRXP_ENEMY_夜刃捕食者|r，拾取|cRXP_LOOT_被砍下的老虎的头|r
    >>击杀|cRXP_ENEMY_巨翼枭|r或|cRXP_ENEMY_巨翼恶枭|r，拾取|cRXP_LOOT_被砍下的猫头鹰的头|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r或|cRXP_ENEMY_树林毒蜘蛛|r，拾取|cRXP_LOOT_被砍下的蜘蛛的头|r
    .collect 208611,1 -- Severed Tiger Head (1)
    .collect 208610,1 -- Severed Owl Head (1)
    .collect 208612,1 -- Severed Spider Head (1)
    .mob 夜刃豹
    .mob 夜刃捕食者
    .mob 巨翼枭
    .mob 巨翼恶枭
    .mob 树林潜伏者
    .mob 树林毒蜘蛛
    .train 403475,1
step
    #sticky
    #completewith zenn
    >>击杀|cRXP_ENEMY_夜刃豹|r，拾取|cRXP_LOOT_牙齿|r
    >>击杀|cRXP_ENEMY_巨翼枭|r，拾取|cRXP_LOOT_羽毛|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r，拾取|cRXP_LOOT_蛛丝|r
    .complete 488,1 --Collect Nightsaber Fang (x3)
    .complete 488,2 --Collect Strigid Owl Feather (x3)
    .complete 488,3 --Collect Webwood Spider Silk (x3)
    .mob 夜刃豹
    .mob 巨翼枭
    .mob 树林潜伏者
step
    #sticky
	#completewith SoDSpiderLegs
    >>击杀|cRXP_ENEMY_树林潜伏者|r和|cRXP_ENEMY_树林毒蜘蛛|r，拾取|cRXP_LOOT_小蜘蛛腿|r
    >>|cRXP_WARN_后续任务需要这些物品|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob 树林潜伏者
    .mob 树林毒蜘蛛
step
    .goto Teldrassil,56.08,57.72
    .target 塞拉尔·刃叶
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    >>|cRXP_WARN_接此任务前，确保背包有 1 个空格|r
    .accept 997 >> 接任务：德纳兰的泥土
step
    .goto Teldrassil,55.954,57.272
    .target 阿斯瑞达斯·熊皮
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .accept 475 >> 接任务：烦恼之风
step << Priest
    .goto Teldrassil,55.564,56.746
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
    .turnin -5622 >> 交任务：月神的恩赐
    .target 劳尔娜·晨光
    .accept 5621 >> 接任务：月光之衣
	.trainer >> 学习职业技能
step << Rogue
    .goto Teldrassil,55.508,57.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_奥蒂亚|r 交谈
    .vendor >> |cRXP_BUY_购买并装备|r |T135426:0|t[小飞刀]
    .target 奥蒂亚
step
#xprate <1.99 << Hunter/Warrior/Druid
    .goto Teldrassil,55.574,56.948
    .target 塔隆凯·捷根
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树顶的 |cRXP_FRIENDLY_塔隆凯·捷根|r 交谈
    .accept 932 >> 接任务：扭曲的仇恨
    .accept 2438 >> 接任务：翡翠摄梦符
step << Hunter/Warrior/Druid
#xprate >1.99
    .goto Teldrassil,55.574,56.948
    .target 塔隆凯·捷根
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树顶的 |cRXP_FRIENDLY_塔隆凯·捷根|r 交谈
    .accept 2438 >> 接任务：翡翠摄梦符
step << Hunter
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T135499:0|t[角木弯弓]
    >>|cRXP_BUY_购买|r |T132382:0|t[劣质箭]|cRXP_BUY_直到箭袋装满为止|r
    .collect 2506,1 --Collect Hornwood Recurve Bow
    .target 吉娜·羽弓
    .money <0.0285
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.38
step << Hunter
    #season 0
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    .vendor >>|cRXP_BUY_购买|r |T132382:0|t[劣质箭]|cRXP_BUY_直到箭袋装满为止|r
    .target 吉娜·羽弓
step << Hunter
    #season 2
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    .vendor >>|cRXP_BUY_购买|r |T132382:0|t[劣质箭] |cRXP_BUY_直到剩余2银币或拥有3组为止|r
    .target 吉娜·羽弓
step << Hunter
    #completewith next
    +|cRXP_WARN_装备|r |T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.37
step << Warrior
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r |T135321:0|t[步兵剑] |cRXP_BUY_（5银 36铜），钱不够则跳过此步骤|r
    .money <0.0536
    .collect 2488,1 --Collect Gladius
    .target 沙洛蒙
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
step << Warrior
    .goto Teldrassil,56.221,59.198
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
	.trainer >> 学习职业技能
    .target 凯拉·风刃
step << Rogue
    .goto Teldrassil,56.381,60.139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
	.trainer >> 学习职业技能
    .target 詹诺克·柔歌
step << Rogue
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r |T135641:0|t[卷刃的剑] |cRXP_BUY_（4银 1铜），钱不够则跳过此步骤|r
    .collect 2494,1 --Stiletto (1)
    .target 沙洛蒙
    .money <0.0401
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith next
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Druid
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r |T135145:0|t[学徒短杖] |cRXP_BUY_（5银 4铜），钱不够则跳过此步骤|r
    .collect 2495,1 --Walking Stick (1)
    .target 沙洛蒙
    .money <0.0504
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.20
step << Druid
    #completewith next
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.19
step
    .goto Teldrassil,55.619,59.788
    .target 旅店老板凯达米尔
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板凯达米尔|r交谈
    .turnin 2159,2 >> 交任务：多兰纳尔的货物 << Hunter
    .turnin 2159 >> 交任务：多兰纳尔的货物 << !Hunter
    .vendor >>|cRXP_BUY_购买 10 份 |T132815:0|t|r|cRXP_LOOT_冰镇牛奶|r，钱不够则尽量多买 << Priest
    .home >> 将炉石设为多兰纳尔
step << Warrior
    #season 2
    .goto Teldrassil,54.8,66.0,25 >>前往地图标记位置，查看 |cRXP_FRIENDLY_漫游的剑士|r 是否在此。找到他后可以挑战决斗，获胜可获得 |T132334:0|t[|cRXP_FRIENDLY_血之狂暴|r] 符文
    >>|cRXP_WARN_他有多个刷新点，同一时间只会出现在其中一处。若他不在这里，跳过此步骤|r
    >>|cRXP_WARN_你目前的等级很可能无法单独击败他。如果附近无人帮忙，跳过此步骤；到 10 级学会断筋和投掷后，可以回来看看他是否还在|r
    .unitscan 漫游的剑士
    .train 412507,1
step << Hunter
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .train 1130 >> 学习猎人印记
    .train 3044 >> 学习奥术射击
    .target 达扎拉
    .xp >8,1
step << Hunter
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .train 5116 >> 学习震荡射击
    .target 达扎拉
    .xp <8,1
step << Druid
    #season 0
    .goto Teldrassil,55.945,61.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔|r交谈
	.trainer >> 学习职业技能
    .target 卡尔
step
    .isOnQuest 928
#xprate <1.99
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 928 >> 交任务：大地之冠
    .target 科瑞萨斯·月怒

step
    .isQuestTurnedIn 928
#xprate <1.99
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .target 科瑞萨斯·月怒
    .accept 929 >> 接任务：大地之冠

step << Priest
    .goto Teldrassil,57.242,63.511
    >>选中 |cRXP_FRIENDLY_哨兵莎恩雅|r
    >>|cRXP_WARN_使用|r |T135929:0|t[次级治疗术 (等级 2)]|cRXP_WARN_和|r |T135987:0|t[真言术：韧]|cRXP_WARN_治疗并强化|r|cRXP_FRIENDLY_哨兵莎恩雅|r
    .complete 5621,1 --Heal and fortify Sentinel Shaya
    .target 哨兵莎恩雅
step
    .goto Teldrassil,60.900,68.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    >>|cRXP_WARN_不要接“林精的新芽”任务|r << sod !Warrior !Rogue
    .turnin 997 >> 交任务：德纳兰的泥土
    .target 德纳兰
    .accept 918 >> 接任务：林精的种子
    .accept 919 >> 接任务：林精的新芽 << !sod/Warrior/Rogue
step << Rogue
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_林精|r，拾取|T134327:0|t[|cRXP_LOOT_右上角地图碎片]|r
    .collect 208601,1 -- Top-Right Map Piece (1)
    .mob 林精
    .mob 林精碎木者
    .mob 林精践踏者
    .train 398196,1
step << Druid
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_林精|r，拾取|cRXP_LOOT_种子|r
    >>拾取地上的|cRXP_LOOT_林精的新芽|r << !sod
    .complete 918,1 --Collect Timberling Seed (x8)
    .complete 919,1 << !sod --Collect Timberling Sprout (x12)
    .mob 林精
step << Druid
    #season 2
    #completewith next
    .goto Teldrassil,52.831,78.731,100 >> 前往巨大的树枝
    .train 416044,1
step << Druid
    #season 2
    .goto Teldrassil,52.831,78.731,20,0
    .goto Teldrassil,52.988,80.086,15,0
    .goto Teldrassil,52.831,78.731
    >>|cRXP_WARN_在巨大的树枝上你会看到3个|r |cRXP_ENEMY_月石|r
    >>|cRXP_WARN_施放|r |T136096:0|t[月火术] |cRXP_WARN_，击中全部3颗|r |cRXP_ENEMY_月石|r |cRXP_WARN_（在树枝上），再拾取随后在箭头位置生成的宝箱|r
    .collect 206989,1 -- Rune of the Sun (1)
    .mob 月亮石
    .train 416044,1
step << Druid
    #season 2
    #hardcore
    .train 416044 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_日灼符文|r] |cRXP_WARN_学习|r |T236216:0|t[阳炎术]
    .use 206989
    .itemcount 206989,1
    .train 416044,1
step << Druid
    #season 2
    #softcore
    #completewith next
    .train 416044 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_日灼符文|r] |cRXP_WARN_学习|r |T236216:0|t[阳炎术]
    .deathskip >>死亡并在多兰纳尔复活
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
    >>击杀|cRXP_ENEMY_林精|r，拾取|cRXP_LOOT_种子|r
    >>拾取地上的|cRXP_LOOT_林精的新芽|r << !sod/Warrior/Rogue
    .complete 918,1 --Collect Timberling Seed (x8)
    .complete 919,1 << !sod/Warrior/Rogue --Collect Timberling Sprout (x12)
    .mob 林精
step << Rogue
    #season 2
    .goto Teldrassil,61.2,67.0
    >>击杀|cRXP_ENEMY_林精|r，拾取|T134327:0|t[|cRXP_LOOT_右上角地图碎片]|r
    .collect 208601,1 -- Top-Right Map Piece (1)
    .mob 林精
    .mob 林精碎木者
    .mob 林精践踏者
    .train 398196,1
step
    .goto Teldrassil,60.900,68.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .turnin 918 >> 交任务：林精的种子
    .target 德纳兰
    .accept 922 >> 接任务：雷利亚·绿树
    .turnin 919 >> 交任务：林精的新芽 << !sod/Warrior/Rogue
step
    #season 2 << Hunter/Druid/Priest
    #season 1 << Warrior/Rogue
	.abandon 919 >> 放弃“林精的新芽”任务，这个任务不值得做
step << Warrior
    #season 2
    .goto Teldrassil,62.6,71.8,25 >>前往地图标记位置，查看 |cRXP_FRIENDLY_漫游的剑士|r 是否在此。找到他后可以挑战决斗，获胜可获得 |T132334:0|t[|cRXP_FRIENDLY_血之狂暴|r] 符文
    >>|cRXP_WARN_他有多个刷新点，同一时间只会出现在其中一处。若他不在这里，跳过此步骤|r
    >>|cRXP_WARN_你目前的等级很可能无法单独击败他。如果附近无人帮忙，跳过此步骤；到 10 级学会断筋和投掷后，可以回来看看他是否还在|r
    .unitscan 漫游的剑士
    .train 412507,1
step
    #completewith next
    .goto Teldrassil,68.02,59.66,120 >> 前往星风村
step
    .goto Teldrassil,68.02,59.66
    >>打开|cRXP_PICK_塔隆凯的衣柜|r，拾取|cRXP_LOOT_翡翠摄梦符|r
    .complete 2438,1 --Collect Emerald Dreamcatcher (x1)
step
    #label zenn
    .goto Teldrassil,66.26,58.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_盖洛拉斯·塔文斯伦|r 交谈
    .turnin 475 >> 交任务：烦恼之风
    .target 盖洛拉斯·塔文斯伦
    .accept 476 >> 接任务：瘤背熊怪的堕落
step
    .isOnQuest 929
    #xprate <1.99
    .goto Teldrassil,63.38,58.10
    >>|cRXP_WARN_在星风村月亮井使用|r |T134721:0|t[翡翠瓶] |cRXP_WARN_装水|r
    .complete 929,1 --Collect Filled Jade Phial (x1)
step << Warrior
    #season 2
    #completewith TeldrassilEnd
    #sticky
    >>击杀|cRXP_ENEMY_夜刃豹|r或|cRXP_ENEMY_夜刃捕食者|r，拾取|cRXP_LOOT_被砍下的老虎的头|r
    >>击杀|cRXP_ENEMY_巨翼枭|r或|cRXP_ENEMY_巨翼恶枭|r，拾取|cRXP_LOOT_被砍下的猫头鹰的头|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r或|cRXP_ENEMY_树林毒蜘蛛|r，拾取|cRXP_LOOT_被砍下的蜘蛛的头|r
    .collect 208611,1 -- Severed Tiger Head (1)
    .collect 208610,1 -- Severed Owl Head (1)
    .collect 208612,1 -- Severed Spider Head (1)
    .mob 夜刃豹
    .mob 夜刃捕食者
    .mob 巨翼枭
    .mob 巨翼恶枭
    .mob 树林潜伏者
    .mob 树林毒蜘蛛
    .train 403475,1
step
    >>击杀|cRXP_ENEMY_夜刃豹|r，拾取|cRXP_LOOT_牙齿|r
    >>击杀|cRXP_ENEMY_巨翼枭|r，拾取|cRXP_LOOT_羽毛|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r，拾取|cRXP_LOOT_蛛丝|r
    >>|cRXP_WARN_保留所有|r |T132832:0|t[小蛋] |cRXP_WARN_和|r |T134321:0|t[小蜘蛛腿] |cRXP_WARN_，稍后用于提升|T133971:0|t[烹饪] |r|cRXP_WARN_技能|r
    >>如果掉落运气不好，且附近已没有怪物，跳过此步骤
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
    .mob 夜刃豹
    .mob 巨翼枭
    .mob 树林潜伏者
step
    .goto Teldrassil,60.5,56.3
    .target 赛恩·腐蹄
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 488 >> 交任务：赛恩的要求
    .isQuestComplete 488
step
    #xprate < 1.5
    .goto Teldrassil,60.7,54.4
	.xp 7+3520 >> 刷怪至 7 级 +3520 经验
step
    #xprate >1.49
    .xp 7+2350 >> 刷怪至 7 级 +2350 经验
step
	.goto Teldrassil,56.078,57.723
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .accept 489 >> 接任务：寻求救赎！
    .target 塞拉尔·刃叶
    .isQuestTurnedIn 488
step
    .goto Teldrassil,55.954,57.272
    .target 阿斯瑞达斯·熊皮
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .turnin 476 >> 交任务：瘤背熊怪的堕落
step << Priest
    .goto Teldrassil,55.564,56.746
    .target 劳尔娜·晨光
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
    .turnin 5621 >> 交任务：月光之衣
	.trainer >> 学习职业技能
step
    #season 1 << Priest/Rogue
    #season 2 << Hunter/Warrior/Druid
    .goto Teldrassil,55.574,56.948
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树顶的 |cRXP_FRIENDLY_塔隆凯·捷根|r 交谈
    .turnin 2438 >> 交任务：翡翠摄梦符
    .target 塔隆凯·捷根
    .accept 2459 >> 接任务：噬梦者菲罗斯塔 << !sod/Warrior
step << Hunter
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    >>|cRXP_BUY_购买并装备|r |T135499:0|t[角木弯弓] |cRXP_BUY_（2银 85铜），钱不够则跳过此步骤|r
    .collect 2506,1 --Collect Hornwood Recurve Bow
    .target 吉娜·羽弓
    .money <0.0285
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.38
step << Rogue
    .goto Teldrassil,56.381,60.139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
	.trainer >> 学习职业技能
    .target 詹诺克·柔歌
step << Warrior
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r |T135321:0|t[步兵剑] |cRXP_BUY_（5银 36铜），钱不够则跳过此步骤|r
    .collect 2488,1 --Collect Gladius
    .target 沙洛蒙
    .money <0.0536
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
    step << Warrior
    .goto Teldrassil,56.221,59.198
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
	.trainer >> 学习职业技能
    .target 凯拉·风刃
step << Rogue
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r |T135641:0|t[卷刃的剑] |cRXP_BUY_（4银 1铜），钱不够则跳过此步骤|r
    .collect 2494,1 --Stiletto (1)
    .target 沙洛蒙
    .money <0.0401
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith next
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Druid
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r |T135145:0|t[学徒短杖] |cRXP_BUY_（5银 4铜），钱不够则跳过此步骤|r
    .collect 2495,1 --Walking Stick (1)
    .target 沙洛蒙
    .money <0.0504
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.20
step << Druid
    #completewith next
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.19
step << Druid
    .isOnQuest 929
#xprate 1.49-1.99
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 929 >> 交任务：大地之冠
    .target 科瑞萨斯·月怒
step << Druid
    .isOnQuest 929
#xprate <1.50
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 929 >> 交任务：大地之冠
    .target 科瑞萨斯·月怒

step << Druid
    .isQuestTurnedIn 929
#xprate <1.50
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .target 科瑞萨斯·月怒
    .accept 933 >> 接任务：大地之冠

step << Druid
    #season 0
    .goto Teldrassil,55.945,61.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔|r交谈
	.trainer >> 学习职业技能
    .target 卡尔
step
    #loop
    .goto 1438/1,854.400,9952.500,6 >>小树旁
    .goto 1438/1,822.200,9948.500,6 >>小山丘上
    .goto 1438/1,809.800,9926.400,6 >>大树旁
    >>从地图标记位置拾取3个 |cRXP_LOOT_魔锥果|r
    >>|cRXP_WARN_若有魔锥果未刷新，导致你无法完成目标，跳过此步骤|r
    .complete 489,1 --Fel Cone 3/3
    .isOnQuest 489
step
    #label SoDSpiderLegs
    .goto Teldrassil,60.4,56.4
    .target 赛恩·腐蹄
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 489 >> 交任务：寻求救赎！
    .itemcount 3418,3
    .isOnQuest 489
    .target 赛恩·腐蹄
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
	#completewith jewel
    >>拾取地上的 |cRXP_LOOT_魔锥果|r
    >>|cRXP_WARN_它们通常位于树干旁边|r
    .complete 489,1 --Collect Fel Cone (x3)
    .isOnQuest 489
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
    #completewith next
    >>击杀|cRXP_ENEMY_瘤背秘法师|r
    >>|cRXP_WARN_如果 |cRXP_ENEMY_瘤背秘法师|r 数量不足，可能需要击杀 |cRXP_ENEMY_瘤背战士|r 使其刷新|r
    .complete 2459,1 --Kill Gnarlpine Mystic (x7)
    .mob 瘤背秘法师
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
	.goto Teldrassil,69.37,53.41
	>>击杀|cRXP_ENEMY_噬梦者菲罗斯塔|r，拾取|T133288:0|t[|cRXP_LOOT_瘤背熊怪的项链|r]
    .use 8049 >>|cRXP_WARN_使用 |T133288:0|t[|cRXP_LOOT_瘤背熊怪的项链|r]，从中取出|r |cRXP_LOOT_塔隆凯的珠宝|r
    .complete 2459,2 --Collect Tallonkai's Jewel (x1)
    .mob 噬梦者菲罗斯塔
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
    #label jewel
    .goto Teldrassil,68.38,52.06,30,0
    .goto Teldrassil,69.37,53.41
    >>击杀|cRXP_ENEMY_瘤背秘法师|r
    >>|cRXP_WARN_如果 |cRXP_ENEMY_瘤背秘法师|r 数量不足，可能需要击杀 |cRXP_ENEMY_瘤背战士|r 使其刷新|r
    .complete 2459,1 --Kill Gnarlpine Mystic (x7)
    .mob 瘤背秘法师
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
    #softcore
    #completewith next
    .deathskip >> 死亡并在灵魂医者处复活
    .target 灵魂医者
    .isQuestTurnedIn 489
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
    #softcore
    .goto Teldrassil,56.2,60.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰诺尔·鹰月|r交谈
    .vendor >> |cRXP_BUY_出售杂物，必要时修理装备|r
    .target 布兰诺尔·鹰月
    .isQuestTurnedIn 489
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
    .goto Teldrassil,59.0,56.1,50,0
    .goto Teldrassil,56.5,65.5,50,0
    .goto Teldrassil,53.0,59.5,50,0
    .goto Teldrassil,63.6,62.3,50,0
    .goto Teldrassil,58.7,55.7
    >>拾取地上的 |cRXP_LOOT_魔锥果|r
    >>|cRXP_WARN_它们通常位于树干旁边|r
    .complete 489,1 --Collect Fel Cone (x3)
    .isOnQuest 489
step
    #season 0 << Priest/Hunter/Druid/Rogue
    #season 2 << Warrior
    .goto Teldrassil,60.4,56.4
    .target 赛恩·腐蹄
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 489 >> 交任务：寻求救赎！
    .isOnQuest 489
step
    #season 1 << Warrior
    #season 2 << Hunter/Druid/Priest/Rogue
    .goto Teldrassil,44.69,70.52,40,0
    .goto Teldrassil,44.88,73.83
    >>尽量收齐 |cRXP_LOOT_小蜘蛛腿|r
    >>|cRXP_WARN_如果赛恩附近没有蜘蛛，跳过此步骤|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob 树林潜伏者
    .mob 树林毒蜘蛛
step
    #season 0
    #sticky
	#completewith spiderLegs
    >>击杀|cRXP_ENEMY_树林潜伏者|r和|cRXP_ENEMY_树林毒蜘蛛|r，拾取|cRXP_LOOT_小蜘蛛腿|r
    >>|cRXP_WARN_后续任务需要这些物品|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob 树林潜伏者
    .mob 树林毒蜘蛛
step
    #season 2
    .abandon 489 >> 放弃“寻求救赎！”任务，之后不值得专程回来交任务
step << !sod/Priest/Rogue
    #completewith next
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >> 前往地狱石
step << Rogue
    #season 2
    #completewith MutiRune
    >>击杀|cRXP_ENEMY_邪恶劣魔|r、|cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_影魂劣魔|r，拾取|T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    .collect 208604,1 -- Bottom-Left Map Piece (1)
    .mob 邪恶劣魔
    .mob 恶灵劣魔
    .mob 影魂劣魔
    .train 398196,1
step << Rogue
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_迈雷纳斯|r，拾取|T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    .collect 203990,1
    .unitscan 迈雷纳斯
    .train 400094,1
step << Priest
    #season 2
    #completewith next
    >>击杀 |cRXP_ENEMY_邪恶劣魔|r、|cRXP_ENEMY_恶灵劣魔|r 和 |cRXP_ENEMY_影魂劣魔|r，拾取 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob 邪恶劣魔
    .mob 恶灵劣魔
    .mob 影魂劣魔
    .train 402852,1
step << !sod/Priest/Rogue
    .goto Teldrassil,51.2,50.6
    >>击杀|cRXP_ENEMY_迈雷纳斯|r，拾取|cRXP_LOOT_头颅|r
    >>|cRXP_ENEMY_迈雷纳斯|r 可能出现在地狱石洞穴内的多个刷新位置
    .complete 932,1 --Collect Melenas' Head (x1)
    .unitscan 迈雷纳斯
step << Priest
    #season 2
    .goto Teldrassil,51.2,50.6
    >>击杀 |cRXP_ENEMY_邪恶劣魔|r、|cRXP_ENEMY_恶灵劣魔|r 和 |cRXP_ENEMY_影魂劣魔|r，拾取 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob 邪恶劣魔
    .mob 恶灵劣魔
    .mob 影魂劣魔
    .train 402852,1
step << Priest
    #season 2
    .train 402852 >> |cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] |cRXP_WARN_学习|r |T237570:0|t[裂魂魔]
    >>|cRXP_WARN_你必须获得 2 个|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益。可在月亮井、北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛、铁炉堡秘法区等神圣区域输入 /kneel|r
    .use 205947
    .itemcount 205947,1
step << Rogue
    #season 2
    .goto Teldrassil,51.2,50.6
    >>击杀|cRXP_ENEMY_迈雷纳斯|r，拾取|T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    .collect 203990,1
    .unitscan 迈雷纳斯
    .train 400094,1
step << Rogue
    #season 2
    #label MutiRune
    .train 400094 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r] |cRXP_WARN_学习|r |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1
step << Rogue
    #season 2
    .goto Teldrassil,51.2,50.6
    >>击杀|cRXP_ENEMY_邪恶劣魔|r、|cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_影魂劣魔|r，拾取|T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    .collect 208604,1 -- Bottom-Left Map Piece (1)
    .mob 邪恶劣魔
    .mob 恶灵劣魔
    .mob 影魂劣魔
    .train 398196,1
step << !sod/Priest/Rogue
    #softcore
    #completewith next
    .deathskip >> 死亡并在灵魂医者处复活
    .target 灵魂医者
step << !Druid
    .isOnQuest 929
#xprate <1.99
    .goto Teldrassil,56.142,61.714
    .target 科瑞萨斯·月怒
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 929 >> 交任务：大地之冠
step
    .isQuestTurnedIn 929
	#xprate <1.5
    .goto Teldrassil,56.142,61.714
    .target 科瑞萨斯·月怒
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .accept 933 >> 接任务：大地之冠
step
	#xprate <1.5
    #completewith next
    .goto Teldrassil,42.61,76.18,50 >> 前往泰达希尔西南部
step
	#xprate <1.5
	.goto Teldrassil,42.61,76.18
	>>点击 |cRXP_PICK_奇怪的果树|r
	.accept 930 >> 接任务：发光的水果
step
	#xprate <1.5
    #completewith next
    .goto Teldrassil,42.41,67.07,50 >> 前往阿里斯瑞恩之池
step
    .isOnQuest 933
	#xprate <1.5
	#label spiderLegs
	.goto Teldrassil,42.41,67.07
    .use 5621 >>|cRXP_WARN_使用|r |T134765:0|t[红玉瓶] |cRXP_WARN_在阿里斯瑞恩之池的月亮井装水|r
	.complete 933,1
step
	#xprate <1.5
    .goto Teldrassil,44.69,70.52,40,0
    .goto Teldrassil,44.88,73.83
    >>击杀|cRXP_ENEMY_树林潜伏者|r和|cRXP_ENEMY_树林毒蜘蛛|r，拾取|cRXP_LOOT_小蜘蛛腿|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob 树林潜伏者
    .mob 树林毒蜘蛛
step
	#xprate <1.5
    #hardcore
    #completewith next
    .goto Teldrassil,56.142,61.714,90 >> 前往多兰纳尔
step
	#xprate <1.5
    #softcore
	#completewith next
    .goto Teldrassil,43.50,68.42
    .deathskip >> 死亡并在多兰纳尔墓地复活。务必在月亮井东侧死亡，否则可能在达纳苏斯复活
step
    .isOnQuest 933
	#xprate <1.5
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 933 >> 交任务：大地之冠
    .target 科瑞萨斯·月怒

step
    .isQuestTurnedIn 933
	#xprate <1.5
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .target 科瑞萨斯·月怒
    .accept 7383 >> 接任务：大地之冠

step
	#xprate <1.5
    .goto Teldrassil,57.121,61.296
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞恩|r交谈
    .train 2550 >>学习烹饪
    .target 扎瑞恩

step
	#xprate <1.5
    #optional
    .goto Teldrassil,57.121,61.296
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t若已收齐7条小蜘蛛腿，与|cRXP_FRIENDLY_扎瑞恩|r交谈并完成菜谱任务；未收齐则跳过此任务
    .itemcount 5465,7
    .accept 4161 >> 接任务：卡多雷的菜谱
    .turnin 4161 >> 交任务：卡多雷的菜谱
    .target 扎瑞恩

step << Warrior/Rogue
    #season 0
    .goto Teldrassil,55.29,56.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拜恩希|r交谈
    .train 3273 >> 学习|T135966:0|t[急救]
    .target 拜恩希
step
    #season 1 << Warrior
    #season 2 << Hunter/Druid/Priest/Rogue
    .goto Teldrassil,57.121,61.296
    .train 2550 >>学习烹饪
    .target 扎瑞恩
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞恩|r交谈

step
    #season 1 << Warrior
    #season 2 << Hunter/Druid/Priest/Rogue
    #optional
    .goto Teldrassil,57.121,61.296
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t若已收齐7条小蜘蛛腿，与|cRXP_FRIENDLY_扎瑞恩|r交谈并完成菜谱任务；未收齐则跳过此任务
    .itemcount 5465,7
    .accept 4161 >> 接任务：卡多雷的菜谱
    .turnin 4161 >> 交任务：卡多雷的菜谱
    .target 扎瑞恩

step << Rogue
    #season 2
    .goto Teldrassil,55.29,56.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拜恩希|r交谈
    .train 3273 >> 学习|T135966:0|t[急救]
    .target 拜恩希
step << !sod/Priest/Rogue
    .goto Teldrassil,55.574,56.948
    .target 塔隆凯·捷根
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树顶的 |cRXP_FRIENDLY_塔隆凯·捷根|r 交谈
    .turnin 2438 >> 交任务：翡翠摄梦符 << sod Priest/sod Rogue
    .turnin 932 >> 交任务：扭曲的仇恨
    .turnin 2459 >> 交任务：噬梦者菲罗斯塔 << !sod
step << Warrior
    #season 2
    .goto Teldrassil,55.574,56.948
    .target 塔隆凯·捷根
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树顶的 |cRXP_FRIENDLY_塔隆凯·捷根|r 交谈
    .turnin 2459 >> 交任务：噬梦者菲罗斯塔
    .accept 932 >> 接任务：扭曲的仇恨
step
#xprate >1.99
    #label xp10
    .xp 10
   >>|cRXP_WARN_如果离目标经验还差很多，去做迈雷纳斯的任务|r
step << Druid
    #season 2
    .goto Teldrassil,55.945,61.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔|r交谈
	.trainer >> 学习职业技能
    .accept 5925 >> 接任务：响应召唤
    .target 卡尔
step << Priest
#xprate >1.99
    .goto Teldrassil,55.564,56.746
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
	.trainer >> 学习职业技能
    .target 劳尔娜·晨光

step << NightElf Priest
#xprate >1.99
    #season 2
    .goto Teldrassil,55.564,56.746
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
    .accept 5629 >> 接任务：回家
    .target 劳尔娜·晨光
    .isNotOnQuest 5627,5628,5630,5631,5632,5633
    .train 10797,1

step << Warrior
#xprate >1.99
    .goto Teldrassil,56.221,59.198
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
	.trainer >> 学习职业技能
    .target 凯拉·风刃
step << Rogue
#xprate >1.99
    .goto Teldrassil,56.381,60.139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
	.trainer >> 学习职业技能
    .train 5171 >> 学习|T132306:0|t[切割] << !sod
    .train 921 >> 还要学习 |T133644:0|t[搜索]，10 级潜行者任务需要此技能
    .target 詹诺克·柔歌
step << Hunter
#xprate >1.99
    .goto Teldrassil,56.676,59.489
    .target 达扎拉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .accept 6063 >> 接任务：驯服野兽
	.trainer >> 学习职业技能
step << Hunter
#xprate >1.99
    .goto Teldrassil,59.9,58.8
    .use 15921 >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_驯服|r |cRXP_ENEMY_树林潜伏者|r
    .complete 6063,1 --Tame a Webwood Lurker
    .mob 树林潜伏者
step << Hunter
#xprate >1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6063 >> 交任务：驯服野兽
    .target 达扎拉
    .accept 6101 >> 接任务：驯服野兽
step << Hunter
#xprate >1.99
    .goto Teldrassil,62.6,72.2
    .use 15922 >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_驯服|r |cRXP_ENEMY_夜刃捕食者|r
    >>|cRXP_WARN_驯服另一只宠物前，必须右键点击宠物头像并解散当前宠物|r
    .complete 6101,1 --Tame a Nightsaber Stalker
    .mob 夜刃捕食者
step << Hunter
#xprate >1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6101 >> 交任务：驯服野兽
    .target 达扎拉
    .accept 6102 >> 接任务：驯服野兽
step << Hunter
#xprate >1.99
    .goto Teldrassil,64.7,66.7
    .use 15923 >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_驯服|r |cRXP_ENEMY_巨翼恶枭|r
    >>|cRXP_WARN_驯服另一只宠物前，必须右键点击宠物头像并解散当前宠物|r
    .complete 6102,1 --Tame a Strigid Screecher
    .mob 巨翼恶枭
step << Hunter
#xprate >1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6102 >> 交任务：驯服野兽
    .target 达扎拉
    .accept 6103 >> 接任务：训练野兽
    .train 1130 >> |cRXP_WARN_确保已学会猎人印记，很快就需要用它获取符文|r
step << Warrior
#xprate >1.99
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_沿多兰纳尔以西的道路巡逻|r
    .accept 1684 >> 接任务：艾兰娜瑞
    .accept 487 >> 接任务：达纳苏斯之路
    .target 哨兵阿玛拉·夜行者
step << Rogue
#xprate >1.99
    .goto Teldrassil,56.381,60.139
    .target 詹诺克·柔歌
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
    .accept 2241 >> 接任务：詹诺克的花
step
    #season 0
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_沿多兰纳尔以西的道路巡逻|r
    .accept 487 >> 接任务：达纳苏斯之路
    .target 哨兵阿玛拉·夜行者
step << Rogue
    #season 2
    #completewith runeOfPrecision
    #optional
    #label topleft
    >>击杀或使用 |T133644:0|t[搜索]，目标为 |cRXP_ENEMY_瘤背熊怪|r，获取 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 208602,1 -- Top-Left Map Piece (1)
    .mob 瘤背伏击者
    .mob 瘤背萨满祭司
    .mob 瘤背防御者
    .mob 瘤背占卜师
    .train 398196,1
step
    #season 0
    .goto Teldrassil,46.6,53.0
    >>击杀|cRXP_ENEMY_瘤背伏击者|r
    .complete 487,1 --Kill Gnarlpine Ambusher (x6)
    .mob 瘤背伏击者
step << Warrior
    #season 2
    .goto Teldrassil,46.6,53.0
    >>击杀|cRXP_ENEMY_瘤背伏击者|r
    .complete 487,1 --Kill Gnarlpine Ambusher (x6)
    .mob 瘤背伏击者
step
    #season 0
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_沿多兰纳尔以西的道路巡逻|r
    .turnin 487 >> 交任务：达纳苏斯之路
    .target 哨兵阿玛拉·夜行者
step << Priest
    #season 2
    #completewith next
    .goto Teldrassil,44.18,58.19
    .subzone 262 >> 进入班奈希尔兽穴。没有队伍时可能较难，也可以稍后再来获取 |T237514:0|t[虚空疫病] 符文
    .train 425216,1 << Priest
step << Priest
    #season 2
    .goto Teldrassil,44.401,60.655
    >>打开|cRXP_PICK_瘤背储物箱|r，拾取|T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]
    >>|cRXP_WARN_注意：|cRXP_PICK_瘤背储物箱|r 在班奈希尔兽穴内有多个可能的刷新位置|r
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] |cRXP_WARN_学习|r |T237514:0|t[虚空疫病]
    >>|cRXP_WARN_你必须获得一个|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益。可在月亮井、北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛、铁炉堡秘法区等神圣区域输入 /kneel|r
    .use 205940
    .train 425216,1
step << Rogue
    #season 2
    .goto Teldrassil,38.92,79.93
    >>击杀或使用 |T133644:0|t[搜索]，目标为 |cRXP_ENEMY_瘤背探险者|r 和 |cRXP_ENEMY_瘤背复仇者|r，获取 |T134241:0|t[|cRXP_LOOT_瘤背藏品钥匙]|r
    .collect 208749,1 -- Gnarlpine Stash Key (1)
    .mob 瘤背探险者
    .mob 瘤背复仇者
    .train 400081,1
step << Rogue
    #season 2
    #label runeOfPrecision
    .goto Teldrassil,37.836,82.588
    >>打开|cRXP_PICK_瘤背藏品箱|r，拾取|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 204174 -- Rune of Precision (1)
    .itemcount 208749,1
    .train 400081,1
step << Rogue
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_学习|r |T135610:0|t[正中眉心]
    .use 204174
    .itemcount 204174,1
step << Rogue
    #season 2
    .goto Teldrassil,38.92,79.93
    >>击杀或使用 |T133644:0|t[搜索]，目标为 |cRXP_ENEMY_瘤背熊怪|r，获取 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 208602,1 -- Top-Left Map Piece (1)
    .mob 瘤背伏击者
    .mob 瘤背萨满祭司
    .mob 瘤背防御者
    .mob 瘤背占卜师
    .train 398196,1
step << Rogue
    #season 2
    #softcore
    #completewith next
    .deathskip >> 死亡并在达纳苏斯的灵魂医者处复活
    .target 灵魂医者
step << Hunter
    #season 2
    .goto Teldrassil,55.890,59.205
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    >>|cRXP_BUY_购买并装备|r |T135489:0|t[多层弯弓]
    .collect 2507,1
    .target 吉娜·羽弓
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
    >>|cRXP_BUY_购买并装备400支|r |T132382:0|t[锋利的箭]
    .target 吉娜·羽弓
step << Hunter
    #season 2
    .goto Teldrassil,46.6,46.3
    >>|cRXP_WARN_施放|r |T132212:0|t[猎人印记] |cRXP_WARN_，目标选择|r |cRXP_ENEMY_沙沙作响的灌木丛|r
    >>击杀出现的 |cRXP_ENEMY_npc:腐根偷猎者:209812|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob 沙沙作响的灌木丛
    .mob 腐根偷猎者::209812
    .train 410113,1 --Master Marksman
step
	#xprate < 1.5
    #completewith next
    .goto Teldrassil,38.32,34.36,50 >> 前往神谕林地
step
	#xprate < 1.5
    .goto Teldrassil,38.32,34.36
    .target 哨兵阿瑞尼亚·碎云
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .accept 937 >> 接任务：神谕林地
step
    .isOnQuest 7383
	#xprate < 1.5
    .goto Teldrassil,38.43,34.03
    .use 18152 >>|cRXP_WARN_使用|r |T134798:0|t[紫水晶瓶] |cRXP_WARN_在神谕林地的月亮井装水|r
    .complete 7383,1 --Collect Filled Amethyst Phial (x1)
step << Rogue
	#xprate < 1.5
    #season 2
    #completewith xp10
    >>击杀或使用 |T133644:0|t[搜索]，目标为 |cRXP_ENEMY_血羽鹰身人|r，获取 |T134327:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 208603,1 -- Bottom-Right Map Piece (1)
    .mob 血羽鹰身人
    .mob 血羽游荡者
    .mob 血羽女巫
    .mob 血羽复仇者
    .mob 血羽风巫
    .mob 血羽女族长
    .train 398196,1
step
	#xprate < 1.5
    #completewith xp10
	#label harpies
    >>击杀|cRXP_ENEMY_血羽鹰身人|r，拾取|cRXP_LOOT_腰带|r
    >>|cRXP_ENEMY_血羽女族长|r |cRXP_WARN_会施放|r |T136052:0|t[治疗波] |cRXP_WARN_和|r |T136048:0|t[闪电箭] |cRXP_WARN_，伤害很高，尽量用爆发伤害快速击杀|r
    .complete 937,1 --Collect Bloodfeather Belt (x6)
    .mob 血羽鹰身人
    .mob 血羽游荡者
    .mob 血羽女巫
    .mob 血羽复仇者
    .mob 血羽风巫
    .mob 血羽女族长
step
	#xprate < 1.5
    .goto Teldrassil,34.61,28.79
    >>点击 |cRXP_PICK_奇怪的树叶|r
    .accept 931 >> 接任务：发光的树叶
step << Hunter
	#xprate <1.5
    #completewith xp10
    #label mist1
    .goto Teldrassil,31.54,31.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密斯特|r交谈
    >>|cRXP_WARN_这会开始一个护送任务|r
    .accept 938 >> 接任务：密斯特
    .target 密斯特
step << Hunter
	#xprate <1.5
    #sticky
    #label xp10
    .xp 10-2670 >> 刷怪至距离 10 级还差 2670 经验（3830/6500）
    >>|cRXP_WARN_达到这个经验节点后，跳过鹰身人或护送任务，直接前往达纳苏斯；稍后还会有机会完成这些任务|r
step << Hunter
	#xprate <1.5
    #completewith xp10
    #requires mist1
    .goto Teldrassil,38.32,34.36
    .target 哨兵阿瑞尼亚·碎云
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin -938,1 >> 交任务：密斯特
step << Hunter
	#xprate <1.5
    #completewith xp10
	#requires harpies
    .goto Teldrassil,38.32,34.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin 937 >> 交任务：神谕林地
    .target 哨兵阿瑞尼亚·碎云
    .accept 940 >> 接任务：泰达希尔
step << !Hunter
	#xprate <1.5
    #label mist1
    .goto Teldrassil,31.54,31.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密斯特|r交谈
    >>|cRXP_WARN_这会开始一个护送任务|r
    .accept 938 >> 接任务：密斯特
    .target 密斯特
step << !Hunter
	#xprate <1.5
    .goto Teldrassil,38.32,34.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin 937 >> 交任务：神谕林地
    .target 哨兵阿瑞尼亚·碎云
    .accept 940 >> 接任务：泰达希尔
    .turnin -938,1 >> 交任务：密斯特
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
    >>击杀或使用 |T133644:0|t[搜索]，目标为 |cRXP_ENEMY_血羽鹰身人|r，获取 |T134327:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 208603,1 -- Bottom-Right Map Piece (1)
    .mob 血羽鹰身人
    .mob 血羽游荡者
    .mob 血羽女巫
    .mob 血羽复仇者
    .mob 血羽风巫
    .mob 血羽女族长
    .train 398196,1
step << Rogue
	#xprate < 1.5
    #season 2
    .cast 418600 >>|cRXP_WARN_使用任意一块|r |T134327:0|t[|cRXP_LOOT_地图碎片]|r |cRXP_WARN_，将它们合成为|r |T134269:0|t[|cRXP_LOOT_泰达希尔藏宝图|r]
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
   >>收齐 7 条小蜘蛛腿
   .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
step << Druid
   #xprate 1.49-1.99
   #label xp10
   .xp 10-850
   .goto Teldrassil,38.3,34.4
   >>如果经验仍不足，去做北边的鹰身人任务
step << !Druid
    #xprate 1.49-1.99
	#label xp10
	.xp 10-4415
step << Hunter
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_神射手符文|r] |cRXP_WARN_学习|r |T132177:0|t[神射手]
    .use 206155
    .train 410113,1
step << !Rogue
    #softcore
    #requires xp10
    #completewith next
    .deathskip >> 死亡并在达纳苏斯的灵魂医者处复活
    >>|cRXP_WARN_确保你离达纳苏斯墓地比离多兰纳尔墓地更近，否则可能在错误地点复活；若不确定，先跑出兽穴再死亡|r << sod Priest
    >>|cRXP_WARN_确保你离达纳苏斯墓地比离多兰纳尔墓地更近，否则可能在错误地点复活；若不确定，先跑到河流西侧|r << sod Hunter/sod Warrior/sod Druid
    .target 灵魂医者
step << !Rogue
    #hardcore
    #requires xp10
    #completewith next
    .goto Darnassus,82.01,36.70,100 >> 前往达纳苏斯
step << Druid
    #optional
    #season 2
    .xp <10,1
    .goto Darnassus,70.679,45.379
    .target 迈德兰努尔
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈德兰努尔|r交谈
    .accept 6344 >> 接任务：尼莎·影歌
 step << Warrior
    #season 2
    .goto Darnassus,57.56,46.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊琳尼雅·月火|r交谈
    .skipgossip 11866,1
    .train 227 >>学习法杖 << Warrior
    .train 2567 >> 学习投掷武器 << Warrior
    .target 伊琳尼雅·月火
step << Warrior
    #season 2
    .goto Darnassus,58.76,44.48
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿瑞耶尔·天影|r 对话
    >>|cRXP_BUY_购买并装备一组|r |T135425:0|t[锋利的飞刀]
    .collect 3107,200
    .target 阿瑞耶尔·天影
step << Warrior
    #season 2
    #ah
    .goto Darnassus,56.245,54.039,-1
    .goto Darnassus,56.374,51.820,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达纳苏斯拍卖师|r交谈
    >>购买一瓶 |T134830:0|t[|cRXP_LOOT_次级治疗药水|r]，这有助于在多兰纳尔获取 |T236317:0|t[狂乱攻击] 符文
    .collect 929,1 --Lesser Healing Potion (1)
    .target 拍卖师图尔伦
    .target 拍卖师戈洛萨斯
    .train 425412,1 --Skips if you already have Frenzied Assault
step << Warrior
#xprate >1.99
    .goto Darnassus,57.305,34.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾兰娜瑞|r交谈
    .turnin 1684 >> 交任务：艾兰娜瑞
    .target 艾兰娜瑞
    .accept 1683 >> 接任务：沃鲁斯·邪蹄
step << Warrior
    #season 2
    #requires xp10
    .goto Darnassus,63.108,21.858
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_戴尔威娜|r交谈，交出|cRXP_LOOT_被砍下的蜘蛛的头|r，换取|cRXP_LOOT_怪物猎手的第三个符文碎片|r
    .collect 204690,1
    .skipgossip
    .target 戴尔威娜
    .itemcount 208612,1 --Severed Spider Head (1)
    .itemcount 204703,<1
    .train 403475,1

step << Warrior
    #season 2
    #requires xp10
    .goto Darnassus,63.108,21.858
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_戴尔威娜|r交谈，交出|cRXP_LOOT_被砍下的老虎的头|r，换取|cRXP_LOOT_怪物猎手的第二个符文碎片|r
    .collect 204689,1
    .skipgossip
    .target 戴尔威娜
    .itemcount 208611,1 --Severed Tiger Head (1)
    .itemcount 204703,<1
    .train 403475,1

step << Warrior
    #season 2
    #requires xp10
    .goto Darnassus,63.108,21.858
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_戴尔威娜|r交谈，交出|cRXP_LOOT_被砍下的猫头鹰的头|r，换取|cRXP_LOOT_怪物猎手的第一个符文碎片|r
    .collect 204688,1
    .skipgossip
    .target 戴尔威娜
    .itemcount 208610,1 --Severed Owl Head
    .itemcount 204703,<1
    .train 403475,1 --Rune not known

step << Warrior
    #season 2
    >>使用任意一块 |T134455:0|t[|cRXP_FRIENDLY_怪物猎手的符文碎片|r]，将三块碎片合成 |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .collect 204703,1
    .use 204689
    .itemcount 204689,1
    .itemcount 204690,1
    .itemcount 204688,1
    .train 403475,1

step << Warrior
    #season 2
    .train 403475 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r] |cRXP_WARN_学习|r |T135291:0|t[毁灭打击]
    .use 204703
    .itemcount 204703,1

step << !Rogue !Hunter !Warrior
#xprate >1.99
    .goto Darnassus,67.427,15.655
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板塞琳尼|r交谈
    .home >> 将炉石设为达纳苏斯 << !Warrior
    .vendor >>|cRXP_BUY_再买一些|r |T132815:0|t|cRXP_LOOT_冰镇牛奶|r << Priest
    .target 旅店老板塞琳尼
step << !Rogue
    #requires xp10
    .goto Darnassus,38.18,21.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    .turnin 922 >> 交任务：雷利亚·绿树
    .target 雷利亚·绿树
    .accept 923 >> 接任务：青苔之瘤
step << !Hunter !Rogue
	#xprate <1.5
    .goto Darnassus,34.96,9.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树顶的 |cRXP_FRIENDLY_大德鲁伊范达尔·鹿盔|r 交谈
    .turnin 940 >> 交任务：泰达希尔
	.isOnQuest 940
    .target 大德鲁伊范达尔·鹿盔
step << Druid
    .goto Darnassus,35.38,8.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与中层的 |cRXP_FRIENDLY_玛斯雷·驭熊者|r 交谈
    .turnin -5925 >>  交任务：响应召唤 << sod
    .accept 5921 >> 接任务：月光林地
	.trainer >> 学习职业技能
    .target 玛斯雷·驭熊者
step << Hunter
#xprate >1.99
    .goto Darnassus,40.377,8.545
    .target 祖卡斯特
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .turnin 6103 >> 交任务：训练野兽
step << !Rogue
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    .target 女祭司艾茉拉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女祭司艾茉拉|r交谈
    .accept 2518 >> 接任务：月神的泪水
step << Warrior
    #season 2
    .hs >> 炉石回多兰纳尔
    .vendor >> |cRXP_BUY_出售杂物，并向旅店老板购买 5-10 份 |T133968:0|t[|r|cRXP_LOOT_刚出炉的面包|r]
step << Warrior
    #season 2
    #sticky
    #completewith FrenziedAssault
    >>完成其他步骤时，如果遇到 |cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r，就向她交任务
    >>|cRXP_WARN_暂时不要专程寻找她|r
    .turnin 487 >> 交任务：达纳苏斯之路
    .target 哨兵阿玛拉·夜行者
step << Warrior
	#season 2
    .goto Teldrassil,56.308,59.488
    .money <0.0504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买|r |T135145:0|t[学徒短杖]，并装备
    .collect 2495,1 -- Walking Stick (1)
    .target 沙洛蒙
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.20
step << Warrior
    #season 2
    #completewith melenas
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >> 前往地狱石
step << Warrior
    #season 2
    #label melenas
    .goto Teldrassil,51.2,50.6
    >>击杀|cRXP_ENEMY_迈雷纳斯|r，拾取|cRXP_LOOT_头颅|r
    >>|cRXP_ENEMY_迈雷纳斯|r 可能出现在地狱石洞穴内的多个刷新位置
    .complete 932,1 --Collect Melenas' Head (x1)
    .unitscan 迈雷纳斯
step << Warrior
	#season 2
    #softcore
    .deathskip >> 死亡并在灵魂医者处复活
    .target 灵魂医者
step << Warrior
    #season 2
    .goto Teldrassil,57.121,61.296
    .train 2550 >>学习烹饪
    .target 扎瑞恩
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞恩|r交谈

step << Warrior
    #season 2
    #optional
    .goto Teldrassil,57.121,61.296
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t若已收齐7条小蜘蛛腿，与|cRXP_FRIENDLY_扎瑞恩|r交谈并完成菜谱任务；未收齐则跳过此任务
    .itemcount 5465,7
    .accept 4161 >> 接任务：卡多雷的菜谱
    .turnin 4161 >> 交任务：卡多雷的菜谱
    .target 扎瑞恩

step << Warrior
    #season 2
    #label FrenziedAssault
    .goto Teldrassil,55.619,59.787
    >>与多兰纳尔的 |cRXP_FRIENDLY_旅店老板凯达米尔|r 交谈
    >>与楼上的 |cRXP_ENEMY_西拉尔特|r 交谈，然后击败他；生命值降至 0% 时他会昏倒
    >>如果 |cRXP_ENEMY_西拉尔特|r 不在这里，等待他刷新
    >>再次与 |cRXP_FRIENDLY_旅店老板凯达米尔|r 交谈，在击倒 |cRXP_ENEMY_西拉尔特|r 后领取 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .train 425447 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r] |cRXP_WARN_学习|r |T236317:0|t[狂乱攻击]
    >>|cRXP_WARN_视你的等级而定，单独完成可能比较困难；必要时寻求帮助|r
    >>|cRXP_WARN_可以用投掷武器风筝他来单独完成。先使用|r |T132316:0|t[断筋] |cRXP_WARN_减速，然后拉开距离并|r  |T132324:0|t[投掷] |cRXP_WARN_攻击他。|r |cRXP_WARN_必要时使用|r |T134830:0|t[治疗药水] |cRXP_WARN_和|r |T133685:0|t[绷带] |cRXP_WARN_恢复生命值|r
    --Might wanna add a guide video
    .use 204716
    .target 旅店老板凯达米尔
    .mob 西拉尔特
step << Warrior
    #season 2
    .goto Teldrassil,55.574,56.948
    .target 塔隆凯·捷根
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树顶的 |cRXP_FRIENDLY_塔隆凯·捷根|r 交谈
    .turnin 932 >> 交任务：扭曲的仇恨
step << Warrior
    #season 2
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_沿多兰纳尔以西的道路巡逻|r
    .turnin 487 >> 交任务：达纳苏斯之路
    .target 哨兵阿玛拉·夜行者

step
#xprate <1.99
    #requires xp10 << Rogue
    .hs >> 炉石回多兰纳尔
    .subzoneskip 186
step << Hunter
#xprate <1.99
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
	.vendor >> |cRXP_BUY_购买 4 组|r |T132382:0|t[锋利的箭]|cRXP_BUY_，到 10 级后立即装备|r
    .target 吉娜·羽弓
step
	#xprate 1.49-1.99
    .goto Teldrassil,57.121,61.296
    .train 2550 >>学习烹饪
    .target 扎瑞恩
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞恩|r交谈

step
	#xprate 1.49-1.99
    #optional
    .goto Teldrassil,57.121,61.296
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t若已收齐7条小蜘蛛腿，与|cRXP_FRIENDLY_扎瑞恩|r交谈并完成菜谱任务；未收齐则跳过此任务
    .itemcount 5465,7
    .accept 4161 >> 接任务：卡多雷的菜谱
    .turnin 4161 >> 交任务：卡多雷的菜谱
    .target 扎瑞恩

step
	#xprate 1.49-1.99
    .goto Teldrassil,51.9,56.4
    >>寻找哨兵阿玛拉·夜行者，她沿多兰纳尔以西的道路巡逻
    .target 哨兵阿玛拉·夜行者
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    .turnin 487 >> 交任务：达纳苏斯之路
	.maxlevel 9
step << Hunter
#xprate <1.99
    #optional
    #completewith L10
    #level 10
    #label beast1
    .goto Teldrassil,56.676,59.489
    .target 达扎拉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .accept 6063 >> 接任务：驯服野兽
	.train 13165 >> 学习 10 级职业技能
step << Hunter
#xprate <1.99
    #optional
    #completewith L10
    #level 10
    #requires beast1
    #label beast2
    .goto Teldrassil,59.9,58.8
    .use 15921 >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_驯服|r |cRXP_ENEMY_树林潜伏者|r
    .complete 6063,1 --Tame a Webwood Lurker
    .mob 树林潜伏者
step << Hunter
#xprate <1.99
    #optional
    #completewith L10
    #level 10
    #requires beast2
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6063 >> 交任务：驯服野兽
    .target 达扎拉
    .accept 6101 >> 接任务：驯服野兽
step
    .isOnQuest 7383
	#xprate <1.5
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 7383 >> 交任务：大地之冠
    .target 科瑞萨斯·月怒

step
    .isQuestTurnedIn 7383
	#xprate <1.5
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .target 科瑞萨斯·月怒
    .accept 935 >> 接任务：大地之冠

step
	#xprate <1.5
	.goto Teldrassil,60.900,68.489
    .target 德纳兰
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .turnin 931 >> 交任务：发光的树叶
    .turnin 930 >> 交任务：发光的水果
step
	#xprate <1.5
	.goto Teldrassil,60.900,68.489
    .target 德纳兰
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
	.turnin 927 >> 交任务：布满苔藓的心脏
    .isOnQuest 927

step
    #xprate <1.5
    .goto Teldrassil,60.900,68.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .accept 941 >> 接任务：培养心脏
    .target 德纳兰
    .isQuestTurnedIn 927

step
	#xprate <1.5
	.goto Teldrassil,60.78,68.59
	>>点击 |cRXP_LOOT_德纳兰的培养槽|r
	.turnin 941 >> 交任务：培养心脏
	.isQuestTurnedIn 927
step << Hunter
	#xprate <1.5
    .goto Teldrassil,62.6,72.2
    .use 15922 >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_驯服|r |cRXP_ENEMY_夜刃捕食者|r
    >>|cRXP_WARN_驯服另一只宠物前，必须右键点击宠物头像并解散当前宠物|r
    .complete 6101,1 --Tame a Nightsaber Stalker
	.isOnQuest 6101
    .mob 夜刃捕食者
step
#xprate <1.99
    #label L10
    .xp 10
step
	#xprate <1.5
    #softcore
	#sticky
    #completewith next
    .deathskip >> 死亡并在灵魂医者处复活
    .target 灵魂医者
step << Priest
#xprate <1.99
    .goto Teldrassil,55.564,56.746
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
	.trainer >> 学习职业技能
    .target 劳尔娜·晨光
step << Warrior
#xprate <1.99
    .goto Teldrassil,56.221,59.198
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
	.trainer >> 学习职业技能
    .target 凯拉·风刃
step << Rogue
#xprate <1.99
    .goto Teldrassil,56.381,60.139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
	.trainer >> 学习职业技能
    .train 5171 >> 学习|T132306:0|t[切割]
    .train 921 >> 还要学习 |T133644:0|t[搜索]，10 级潜行者任务需要此技能
    .target 詹诺克·柔歌
step << Hunter
#xprate <1.99
    .goto Teldrassil,56.676,59.489
    .target 达扎拉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .accept 6063 >> 接任务：驯服野兽
	.trainer >> 学习职业技能
step << Hunter
#xprate <1.99
    .goto Teldrassil,59.9,58.8
    .use 15921 >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_驯服|r |cRXP_ENEMY_树林潜伏者|r
    .complete 6063,1 --Tame a Webwood Lurker
    .mob 树林潜伏者
step << Hunter
#xprate <1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6063 >> 交任务：驯服野兽
    .target 达扎拉
    .accept 6101 >> 接任务：驯服野兽
step << Hunter
#xprate <1.99
    .goto Teldrassil,62.6,72.2
    .use 15922 >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_驯服|r |cRXP_ENEMY_夜刃捕食者|r
    >>|cRXP_WARN_驯服另一只宠物前，必须右键点击宠物头像并解散当前宠物|r
    .complete 6101,1 --Tame a Nightsaber Stalker
    .mob 夜刃捕食者
step << Hunter
#xprate <1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6101 >> 交任务：驯服野兽
    .target 达扎拉
    .accept 6102 >> 接任务：驯服野兽
step << Hunter
#xprate <1.99
    .goto Teldrassil,64.7,66.7
    .use 15923 >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_驯服|r |cRXP_ENEMY_巨翼恶枭|r
    >>|cRXP_WARN_驯服另一只宠物前，必须右键点击宠物头像并解散当前宠物|r
    .complete 6102,1 --Tame a Strigid Screecher
    .mob 巨翼恶枭
step << Hunter
#xprate <1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6102 >> 交任务：驯服野兽
    .target 达扎拉
    .accept 6103 >> 接任务：训练野兽
step << Warrior
#xprate <1.99
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_沿多兰纳尔以西的道路巡逻|r
    .accept 1684 >> 接任务：艾兰娜瑞
    .target 哨兵阿玛拉·夜行者
step << Rogue
#xprate <1.99
    .goto Teldrassil,56.381,60.139
    .target 詹诺克·柔歌
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
    .accept 2241 >> 接任务：詹诺克的花
step << Hunter
	#xprate <1.5--money issues 1.5x
    .goto Teldrassil,56.308,59.488
    .money <0.0504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买|r |T135145:0|t[学徒短杖]
    >>|cRXP_WARN_稍后再装备这根法杖；如果已找到其他法杖，跳过此步骤|r
    .collect 2495,1 -- Walking Stick (1)
    .target 沙洛蒙
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.20
step << !Druid
#xprate <1.99
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_沿多兰纳尔以西的道路巡逻|r
    .turnin 487 >> 交任务：达纳苏斯之路
    .target 哨兵阿玛拉·夜行者
step << Rogue
#xprate <1.99
    #softcore
    #completewith next
    .goto Teldrassil,44.0,54.6
    .deathskip >>经过熊怪区域后，故意死亡并在达纳苏斯墓地复活
    .target 灵魂医者
step << Rogue
    #hardcore
    #completewith next
    .goto Darnassus,82.01,36.70,100 >> 前往达纳苏斯
step << Rogue
    .goto Darnassus,38.18,21.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    .turnin 922 >> 交任务：雷利亚·绿树
    .target 雷利亚·绿树
    .accept 923 >> 接任务：青苔之瘤
step << Rogue
    #season 0
    .goto Darnassus,34.96,9.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树顶的 |cRXP_FRIENDLY_大德鲁伊范达尔·鹿盔|r 交谈
    .turnin -935 >> 交任务：大地之冠
    .turnin -940 >> 交任务：泰达希尔
    .target 大德鲁伊范达尔·鹿盔
    .accept 952 >> 接任务：古树之林
step << Rogue
    .goto Darnassus,31.21,17.72,8,0
    .goto Darnassus,36.99,21.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞尤娜|r交谈
    .turnin 2241 >> 交任务：詹诺克的花
    .target 塞尤娜
    .accept 2242 >> 接任务：命运的召唤
step << Rogue
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    .target 女祭司艾茉拉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女祭司艾茉拉|r交谈
    .accept 2518 >> 接任务：月神的泪水
step << Warrior
#xprate >1.99
    #sticky
    #completewith next
    .goto Teldrassil,48.7,62.2,18 >> 前往 |cRXP_ENEMY_沃鲁斯·邪蹄|r 所在处
step << Warrior
#xprate >1.99
    .goto Teldrassil,47.2,63.7
    >>击杀|cRXP_ENEMY_沃鲁斯·邪蹄|r，拾取|cRXP_LOOT_角|r
    .complete 1683,1 --Collect Horn of Vorlus (x1)
    .mob 沃鲁斯·邪蹄
step << Hunter
    #season 2
    .goto Darnassus,64.2,63.0
    .line Darnassus,60.65,66.47,61.68,63.73,62.36,58.91,62.32,55.22,65.77,55.75,67.88,57.48,68.35,59.98,65.14,68.14,64.34,71.36,62.28,68.79,60.65,66.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t寻找 |cRXP_FRIENDLY_加伊娜|r，她在工匠区周围巡逻
    >>|cRXP_BUY_购买一组|r |T133972:0|t[硬肉干] |cRXP_BUY_，向她购买即可|r
    >>|cRXP_WARN_这些肉用来喂养猫头鹰；它们只吃肉，黑海岸没有卖肉的商人|r
    .collect 117,15
    .target 加伊娜
step << !Warrior
    #season 2
    .goto Darnassus,70.679,45.379
    .target 迈德兰努尔
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈德兰努尔|r交谈
    .accept 6344 >> 接任务：尼莎·影歌
step << Hunter
    #season 2
    .goto Darnassus,58.76,44.48
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿瑞耶尔·天影|r 对话
    >>|cRXP_BUY_购买并装备|r |T135489:0|t[多层弯弓]
    .collect 2507,1
    .target 阿瑞耶尔·天影
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
    >>|cRXP_WARN_施放|r |T132164:0|t[驯服野兽] |cRXP_WARN_，目标为 |cRXP_ENEMY_巨翼猎枭|r，将其驯服|r -- .tame 1997
    .train 2981 >> |cRXP_WARN_让它攻击怪物，以学会|r |T132140:0|t[爪击（等级 2）]
    .link https://www.wow-petopia.com/classic/training.php >> |cRXP_WARN_点击这里查看宠物训练的更多信息|r
	.unitscan 巨翼猎枭
step << Hunter
    #sticky
    #requires StrigidHunter
    .engrave 5 >> 将 |T132270:0|t[野兽掌握] 铭刻在 |T132724:0|t[胸甲] 上
step
    #season 0 << Rogue/Druid
    .goto Teldrassil,43.2,42.8,55,0
    .goto Teldrassil,43.2,32.8,55,0
    .goto Teldrassil,43.6,26.0,55,0
    .goto Teldrassil,43.2,42.8
	>>击杀|cRXP_ENEMY_林精践踏者|r、|cRXP_ENEMY_林精泥泞兽|r和|cRXP_ENEMY_林精长老|r，拾取|cRXP_LOOT_青苔之瘤|r
    .complete 923,1 --Collect Mossy Tumor (x5)
    .mob 林精长老
    .mob 林精践踏者
    .mob 林精泥泞兽
step << Hunter
    #season 2
    #label FlankingStrike
    .train 425762,1
    .goto Teldrassil,48.3,31.4
    >>在尸体附近使用 |T134025:0|t[泰达希尔鸟肉] 来召唤 |cRXP_ENEMY_莫格|r
    >>击杀 |cRXP_ENEMY_莫格|r，拾取 |T134419:0|t|cRXP_LOOT_[侧翼符文]|r
    .collect 205979,1
    .train 425762,1 --Flanking Strike
    .use 208608
    .mob 莫格
step << Hunter
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r] |cRXP_WARN_学习|r |T132175:0|t[侧翼打击]
    .use 205979
    .itemcount 205979,1
    .train 425762,1 --Flanking Strike
step << Hunter
    #season 2
    #optional
    #completewith next
    .engrave 7 >> 打开角色面板，在腿部装备上铭刻 |T132175:0|t[侧翼打击]
step
    #season 0 << Rogue/Druid
    #label Spinnerets
	.goto Teldrassil,47.3,26.0,0
    .goto Teldrassil,37.9,25.1,0
    .goto Teldrassil,47.3,26.0,30,0
    .goto Teldrassil,37.9,25.1,30,0
    .goto Teldrassil,40.7,25.4
    >>击杀|cRXP_ENEMY_萨丝拉|r，拾取|cRXP_LOOT_纺丝器|r
    >>|cRXP_ENEMY_萨丝拉|r |cRXP_WARN_可能在 3 个不同位置刷新|r
    .complete 2518,1 --Collect Silvery Spinnerets (x1)
    .mob 萨丝拉
step << !sod/Warrior/Rogue/Druid
    .goto Teldrassil,38.3,34.3
    .target 哨兵阿瑞尼亚·碎云
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .accept 937 >> 接任务：神谕林地
step << Rogue
    #season 2
    #label Spinnerets
	.goto Teldrassil,47.3,26.0,0
    .goto Teldrassil,37.9,25.1,0
    .goto Teldrassil,47.3,26.0,30,0
    .goto Teldrassil,37.9,25.1,30,0
    .goto Teldrassil,40.7,25.4
    >>击杀|cRXP_ENEMY_萨丝拉|r，拾取|cRXP_LOOT_纺丝器|r
    >>|cRXP_ENEMY_萨丝拉|r |cRXP_WARN_可能在 3 个不同位置刷新|r
    .complete 2518,1 --Collect Silvery Spinnerets (x1)
    .mob 萨丝拉
step << Rogue
    .goto Teldrassil,38.0,25.2
    >>|cRXP_WARN_施放|r |T133644:0|t[搜索]，目标为 |cRXP_ENEMY_远古的塞希尔|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    >>|cRXP_ENEMY_远古的塞希尔|r |cRXP_WARN_沿巨大的树枝行走|r
    >>|cRXP_WARN_避免与 |cRXP_ENEMY_远古的塞希尔|r 交战。等他从你身边走过，再进入|r |T132320:0|t[潜行] |cRXP_WARN_状态，然后施放|r |T133644:0|t[搜索] |cRXP_WARN_；施放时须在他身后|r
    .complete 2242,1
    .mob 远古的塞希尔
step << Rogue
    #season 2
    #sticky
    #completewith MistStart
    #label BottomRightMapPiece
    >>击杀或使用 |T133644:0|t[搜索]，目标为 |cRXP_ENEMY_血羽鹰身人|r，获取 |T134327:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 208603,1 -- Bottom-Right Map Piece (1)
    .mob 血羽鹰身人
    .mob 血羽游荡者
    .mob 血羽女巫
    .mob 血羽复仇者
    .mob 血羽风巫
    .mob 血羽女族长
    .train 398196,1
step << !sod/Warrior/Rogue/Druid
    #sticky
	#label harpies2
    .goto Teldrassil,33.619,29.819,0,0
    >>击杀|cRXP_ENEMY_血羽鹰身人|r，拾取|cRXP_LOOT_腰带|r
    >>|cRXP_ENEMY_血羽女族长|r |cRXP_WARN_会施放|r |T136052:0|t[治疗波] |cRXP_WARN_和|r |T136048:0|t[闪电箭] |cRXP_WARN_，伤害很高，尽量用爆发伤害快速击杀|r
    .complete 937,1 --Collect Bloodfeather Belt (x6)
    .mob 血羽鹰身人
    .mob 血羽游荡者
    .mob 血羽女巫
    .mob 血羽复仇者
    .mob 血羽风巫
    .mob 血羽女族长
step << Rogue
    #season 2
    #sticky
    #completewith next
    #requires BottomRightMapPiece
    .cast 418600 >>|cRXP_WARN_使用任意一块|r |T134327:0|t[|cRXP_LOOT_地图碎片]|r |cRXP_WARN_，将它们合成为|r |T134269:0|t[|cRXP_LOOT_泰达希尔藏宝图|r]
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
    .target 密斯特
    #label MistStart
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密斯特|r交谈
    >>|cRXP_WARN_这会开始一个护送任务|r
    >>|cRXP_WARN_如果该角色不在这里，跳过此任务|r
    .accept 938 >> 接任务：密斯特
step << Rogue
    #season 2
    .goto Teldrassil,37.8,43.0,60,0
    .goto Teldrassil,36.0,34.4,60,0
    .goto Teldrassil,34.6,28.8,60,0
    >>击杀或使用 |T133644:0|t[搜索]，目标为 |cRXP_ENEMY_血羽鹰身人|r，获取 |T134327:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 208603,1 -- Bottom-Right Map Piece (1)
    .mob 血羽鹰身人
    .mob 血羽游荡者
    .mob 血羽女巫
    .mob 血羽复仇者
    .mob 血羽风巫
    .mob 血羽女族长
    .train 398196,1
step << Rogue
    #season 2
    .cast 418600 >>|cRXP_WARN_使用任意一块|r |T134327:0|t[|cRXP_LOOT_地图碎片]|r |cRXP_WARN_，将它们合成为|r |T134269:0|t[|cRXP_LOOT_泰达希尔藏宝图|r]
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
    .target 哨兵阿瑞尼亚·碎云
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin 938 >> 交任务：密斯特
    .isOnQuest 938
step << !sod/Warrior/Rogue/Druid
    #requires harpies2
    #label TeldrassilEnd
    .goto Teldrassil,38.3,34.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin 937 >> 交任务：神谕林地
    .target 哨兵阿瑞尼亚·碎云
    .accept 940 >> 接任务：泰达希尔
step << Druid
    #season 2
    #label Spinnerets
	.goto Teldrassil,47.3,26.0,0
    .goto Teldrassil,37.9,25.1,0
    .goto Teldrassil,47.3,26.0,30,0
    .goto Teldrassil,37.9,25.1,30,0
    .goto Teldrassil,40.7,25.4
    >>击杀|cRXP_ENEMY_萨丝拉|r，拾取|cRXP_LOOT_纺丝器|r
    >>|cRXP_ENEMY_萨丝拉|r |cRXP_WARN_可能在 3 个不同位置刷新|r
    .complete 2518,1 --Collect Silvery Spinnerets (x1)
    .mob 萨丝拉
step << Druid
    #season 2
    .goto Teldrassil,43.2,42.8,55,0
    .goto Teldrassil,43.2,32.8,55,0
    .goto Teldrassil,43.6,26.0,55,0
    .goto Teldrassil,43.2,42.8
	>>击杀|cRXP_ENEMY_林精践踏者|r、|cRXP_ENEMY_林精泥泞兽|r和|cRXP_ENEMY_林精长老|r，拾取|cRXP_LOOT_青苔之瘤|r
    .complete 923,1 --Collect Mossy Tumor (x5)
    .mob 林精长老
    .mob 林精践踏者
    .mob 林精泥泞兽
step << Warrior
    #season 2
    .goto Teldrassil,39.8,37.4,25 >>前往地图标记位置，查看 |cRXP_FRIENDLY_漫游的剑士|r 是否在此。找到他后可以挑战决斗，获胜可获得 |T132334:0|t[|cRXP_FRIENDLY_血之狂暴|r] 符文
    >>|cRXP_WARN_他有多个刷新点，同一时间只会出现在其中一处。若他不在这里，跳过此步骤|r
    .unitscan 漫游的剑士
    .train 412507,1
step
    #softcore
	#completewith darn << era
    #completewith darnSoD << sod
    .deathskip >>死亡并在达纳苏斯墓地复活
    >>|cRXP_WARN_确保位于河流西侧，否则可能在错误地点复活|r << sod
    .target 灵魂医者
step
    #hardcore
    #completewith next
    .goto Darnassus,82.01,36.70
    .zone Darnassus >> 前往达纳苏斯
step << Warrior
    #season 2
    .goto Teldrassil,39.8,69.6,25 >>如果仍未找到 |cRXP_FRIENDLY_漫游的剑士|r，前往地图标记位置查看；找到他后可以挑战决斗，获胜可获得 |T132334:0|t[|cRXP_FRIENDLY_血之狂暴|r] 符文
    >>|cRXP_WARN_他有多个刷新点，同一时间只会出现在其中一处。若他不在这里，跳过此步骤|r
    .unitscan 漫游的剑士
    .train 412507,1
step << Warrior
    #season 2
    .goto Teldrassil,43.8,77.0,25 >>如果仍未找到 |cRXP_FRIENDLY_漫游的剑士|r，前往地图标记位置查看；找到他后可以挑战决斗，获胜可获得 |T132334:0|t[|cRXP_FRIENDLY_血之狂暴|r] 符文
    >>|cRXP_WARN_他有多个刷新点，同一时间只会出现在其中一处。若他不在这里，跳过此步骤|r
    .unitscan 漫游的剑士
    .train 412507,1
step << Warrior
    #softcore
    #completewith next
    #season 2
    .goto Teldrassil,40.8,75.6
    .deathskip >>死亡并在达纳苏斯墓地复活
    >>|cRXP_WARN_确保你离达纳苏斯墓地比离多兰纳尔墓地更近，否则可能在错误地点复活；若不确定，在地图标记位置的东侧死亡|r
    .target 灵魂医者
step
    #hardcore
    #completewith next
    #season 2
    .goto Darnassus,82.01,36.70
    .zone Darnassus >> 前往达纳苏斯
step
    .goto Darnassus,70.679,45.379
    .target 迈德兰努尔
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈德兰努尔|r交谈
    .accept 6344 >> 接任务：尼莎·影歌
step
    #softcore
    #label darn
    #optional
    .goto Darnassus,82.01,36.70
    .zone Darnassus >> 前往达纳苏斯
step
	.abandon 927 >> 放弃“布满苔藓的心脏”任务，之后没有机会交任务
step << Warrior
#xprate <1.99
    .goto Darnassus,57.305,34.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾兰娜瑞|r交谈
    .turnin 1684 >> 交任务：艾兰娜瑞
    .target 艾兰娜瑞
    .accept 1683 >> 接任务：沃鲁斯·邪蹄
step << Warrior
#xprate <1.99
    #sticky
    #completewith next
    .goto Teldrassil,48.7,62.2,18 >> 前往 |cRXP_ENEMY_沃鲁斯·邪蹄|r 所在处
step << Warrior
#xprate <1.99
    .goto Teldrassil,47.2,63.7
    >>击杀|cRXP_ENEMY_沃鲁斯·邪蹄|r，拾取|cRXP_LOOT_角|r
    .complete 1683,1 --Collect Horn of Vorlus (x1)
    .mob 沃鲁斯·邪蹄
step << Warrior
#xprate <1.99
    #softcore
	#sticky
    #completewith next
    .goto Teldrassil,43.6,54.3
    .deathskip >>经过熊怪区域后，故意死亡并在达纳苏斯复活
step << Warrior
#xprate <1.99
    #hardcore
    #completewith next
    .goto Darnassus,82.01,36.70,100 >> 前往达纳苏斯
step << Warrior
    .goto Darnassus,57.305,34.606
    .target 艾兰娜瑞
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾兰娜瑞|r交谈
    .turnin 1683 >> 交任务：沃鲁斯·邪蹄
--	.accept 1686 >> Accept The Shade of Elura
step << Warrior
    #season 2
    #requires xp10
    .goto Darnassus,63.108,21.858
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_戴尔威娜|r交谈，交出|cRXP_LOOT_被砍下的蜘蛛的头|r，换取|cRXP_LOOT_怪物猎手的第三个符文碎片|r
    .collect 204690,1
    .skipgossip
    .target 戴尔威娜
    .itemcount 208612,1 --Severed Spider Head (1)
    .itemcount 204703,<1
    .train 403475,1

step << Warrior
    #season 2
    #requires xp10
    .goto Darnassus,63.108,21.858
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_戴尔威娜|r交谈，交出|cRXP_LOOT_被砍下的老虎的头|r，换取|cRXP_LOOT_怪物猎手的第二个符文碎片|r
    .collect 204689,1
    .skipgossip
    .target 戴尔威娜
    .itemcount 208611,1 --Severed Tiger Head (1)
    .itemcount 204703,<1
    .train 403475,1

step << Warrior
    #season 2
    #requires xp10
    .goto Darnassus,63.108,21.858
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_戴尔威娜|r交谈，交出|cRXP_LOOT_被砍下的猫头鹰的头|r，换取|cRXP_LOOT_怪物猎手的第一个符文碎片|r
    .collect 204688,1
    .skipgossip
    .target 戴尔威娜
    .itemcount 208610,1 --Severed Owl Head
    .itemcount 204703,<1
    .train 403475,1 --Rune not known

step << Warrior
    #season 2
    >>使用任意一块 |T134455:0|t[|cRXP_FRIENDLY_怪物猎手的符文碎片|r]，将三块碎片合成 |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .collect 204703,1
    .use 204689
    .itemcount 204689,1
    .itemcount 204690,1
    .itemcount 204688,1
    .train 403475,1

step << Warrior
    #season 2
    .train 403475 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r] |cRXP_WARN_学习|r |T135291:0|t[毁灭打击]
    .use 204703
    .itemcount 204703,1

step << Hunter
#xprate <1.99
    .goto Darnassus,40.377,8.545
    .target 祖卡斯特
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .turnin 6103 >> 交任务：训练野兽
step << Druid
    #season 0
    .goto Darnassus,35.38,8.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与中层的 |cRXP_FRIENDLY_玛斯雷·驭熊者|r 交谈
    .turnin 5931 >> 交任务：返回达纳苏斯
    .target 玛斯雷·驭熊者
    .accept 6001 >> 接任务：身心之力
step
    #season 0
    .goto Darnassus,34.814,9.255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊范达尔·鹿盔|r交谈
    .turnin -935 >> 交任务：大地之冠
    .turnin -940 >> 交任务：泰达希尔
    .target 大德鲁伊范达尔·鹿盔
    .accept 952 >> 接任务：古树之林
step << !Rogue
    #season 2
    #label darnSoD
    .goto Darnassus,38.184,21.639
    .target 雷利亚·绿树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    .turnin 923 >> 交任务：青苔之瘤
step << Rogue
    #season 2
    #label darnSoD
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女祭司艾茉拉|r交谈
    .turnin 2518 >> 交任务：月神的泪水
    .target 女祭司艾茉拉
    .accept 2520 >> 接任务：萨丝拉的祭品
step << Rogue
    #season 2
    .goto Darnassus,39.7,85.8
	.use 8155 >>|cRXP_WARN_使用|r |T135652:0|t[萨丝拉的祭品] |cRXP_WARN_，在喷泉处献上祭品|r
    .complete 2520,1 --Offer the sacrifice at the fountain
step << Rogue
    #season 2
    #label end
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    .target 女祭司艾茉拉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女祭司艾茉拉|r交谈
    .turnin 2520 >> 交任务：萨丝拉的祭品
step << Warrior/Rogue/Druid
    #season 2
    .goto Darnassus,34.814,9.255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊范达尔·鹿盔|r交谈
    .turnin 940 >> 交任务：泰达希尔
    .target 大德鲁伊范达尔·鹿盔
    .accept 952 >> 接任务：古树之林
step
    #season 0
    .goto Darnassus,38.184,21.639
    .target 雷利亚·绿树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    .turnin 923 >> 交任务：青苔之瘤
step << Hunter
    .goto Darnassus,40.2,9.8
    .trainer >>学习 12 级职业技能 << sod
    >>|cRXP_WARN_如果钱不够或尚未到 12 级，跳过此步骤，交完“月神的泪水”后再回来|r << sod
    .target 祖卡斯特
step << Hunter
    .goto Darnassus,42.2,8.8
    .trainer >>学习宠物技能
    .target 西尔瓦莉雅
step << Rogue
    #season 2
    .goto Darnassus,38.6,15.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱兰奈|r交谈
    .vendor >> |cRXP_BUY_出售杂物|r
    .target 莱兰奈
step << Rogue
    .goto Darnassus,31.21,17.72,8,0
    .goto Darnassus,36.99,21.91
    .target 塞尤娜
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞尤娜|r交谈
    .turnin 2242 >> 交任务：命运的召唤
step << Rogue
    #season 2
    >>|cRXP_WARN_学习技能后至少保留 29 银币，用于购买弓|r
    .trainer >> 学习 12 级职业技能
step << !sod/!Rogue
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女祭司艾茉拉|r交谈
    .turnin 2518 >> 交任务：月神的泪水
    .target 女祭司艾茉拉
    .accept 2520 >> 接任务：萨丝拉的祭品
step << !sod/!Rogue
    .goto Darnassus,39.7,85.8
	.use 8155 >>|cRXP_WARN_使用|r |T135652:0|t[萨丝拉的祭品] |cRXP_WARN_，在喷泉处献上祭品|r
    .complete 2520,1 --Offer the sacrifice at the fountain
step << !sod/!Rogue
    #label end
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    .target 女祭司艾茉拉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女祭司艾茉拉|r交谈
    .turnin 2520 >> 交任务：萨丝拉的祭品
step << NightElf Priest
    #season 2
    .goto Darnassus,40.0,80.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女祭司阿兰希雅|r交谈
    .turnin -5628 >> 交任务：回家
    .turnin -5629 >> 交任务：回家
    .turnin -5630 >> 交任务：回家
    .turnin -5631 >> 交任务：回家
    .turnin -5632 >> 交任务：回家
    .turnin -5633 >> 交任务：回家
    .target 女祭司阿兰希雅

step << NightElf Priest
    #season 2
    .goto Darnassus,40.0,80.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女祭司阿兰希雅|r交谈；若此前未学会星辰碎片，可直接接取并完成这项训练
    .accept 5627 >> 接任务：艾露恩之星
    .turnin 5627 >> 交任务：艾露恩之星
    .target 女祭司阿兰希雅
    .train 10797,1

step << Priest
    #season 2
    .goto Darnassus,38.6,82.0
    .trainer >> 学习 12 级职业技能
step << Druid
#ssf
    #season 0
    .goto Darnassus,47.95,68.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲罗迪恩·唤月|r交谈
    .train 2366 >> 学习|T136065:0|t[草药学]
    >>|T136065:0|t[草药学] |cRXP_WARN_用于采集 5 株|r |T134187:0|t[地根草] |cRXP_WARN_，很快会有重要的职业任务需要它们，之后可以遗忘此专业|r
    .target 菲罗迪恩·唤月
step
    #ah
    .goto Darnassus,56.245,54.039,-1
    .goto Darnassus,56.374,51.820,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达纳苏斯拍卖师|r交谈
    >>购买以下物品，稍后到黑海岸即可直接交任务：
    >>|T134187:0|t[地根草] << Druid era
    >>|T133912:0|t[黑海岸石斑鱼]
    >>|T133972:0|t[陆行鸟肉]
    *如果不想购买，跳过此步骤
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .collect 2449,5,6123,1 << Druid era
    .target 拍卖师图尔伦
    .target 拍卖师戈洛萨斯
step << Hunter
    .goto Darnassus,64.2,63.0
    .line Darnassus,60.65,66.47,61.68,63.73,62.36,58.91,62.32,55.22,65.77,55.75,67.88,57.48,68.35,59.98,65.14,68.14,64.34,71.36,62.28,68.79,60.65,66.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t寻找 |cRXP_FRIENDLY_加伊娜|r，她在工匠区周围巡逻
    >>|cRXP_BUY_购买一组|r |T133972:0|t[硬肉干] |cRXP_BUY_，向她购买即可。|r
    >>|cRXP_WARN_这些肉用来喂养猫头鹰；它们只吃肉，黑海岸没有卖肉的商人|r
    .collect 117,15
    .target 加伊娜
step << Hunter
    #season 2
    .goto Darnassus,64.2,59.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基尔兰|r 交谈，他在小屋上层
    >>|cRXP_BUY_购买|r |T135145:0|t[学徒短杖]
    >>|cRXP_WARN_如果背包中已有其他可用的法杖，跳过此步骤|r
    .collect 2495,1
    .target 基尔兰
    .money <0.1539
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.19
step << Hunter/Warrior/Priest/Sod Rogue
    .goto Darnassus,57.56,46.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊琳尼雅·月火|r 对话
    .skipgossip 11866,1
    .train 227 >>学习法杖 << Hunter/Warrior/Priest
    .train 264 >>学习弓箭 << Sod Rogue
    >>如果背包中有法杖，装备它 << Hunter
    >>如果背包中有弓，装备它 << Rogue
    .target 伊琳尼雅·月火
step << Hunter
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.19
step << Hunter/Sod Rogue
    .goto Darnassus,58.76,44.48
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿瑞耶尔·天影|r 对话
    >>|cRXP_BUY_购买并装备一把|r |T135489:0|t[多层弯弓]
    .collect 2507,1
    .target 阿瑞耶尔·天影
    .money <0.1751
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.77
step << Hunter
    #season 0
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿瑞耶尔·天影|r 对话
	.vendor >>|cRXP_BUY_购买|r |T132382:0|t[锋利的箭]
    .target 阿瑞耶尔·天影
step << Hunter/Sod Rogue
    #season 2
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿瑞耶尔·天影|r 对话
	.vendor >>|cRXP_BUY_购买|r |T132382:0|t[锋利的箭]
    .vendor >>|cRXP_BUY_购买一个|r |T134410:0|t[中型箭袋] |cRXP_BUY_，如果你有闲钱|r << Hunter
    .target 阿瑞耶尔·天影
step << Hunter/Sod Rogue
    #completewith next
    +|cRXP_WARN_装备|r |T135489:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.76
step << Warrior
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿瑞耶尔·天影|r 对话
    >>|cRXP_BUY_购买|r |T135147:0|t[法师之杖]|cRXP_BUY_，到 15 级后装备|r
	.collect 2030,1
    .target 阿瑞耶尔·天影
    .money <0.5022
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Warrior
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿瑞耶尔·天影|r 对话
    >>|cRXP_BUY_购买一把|r |T135154:0|t[短杖]|cRXP_BUY_，11 级时装备|r << era
    >>|cRXP_BUY_购买并装备一把|r |T135154:0|t[短杖] |cRXP_BUY_，如果你买不起|r |T135147:0|t[法师之杖] << sod
	.collect 854,1
    .target 阿瑞耶尔·天影
    .money <0.3022
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.44
step << Warrior
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿瑞耶尔·天影|r 对话
	>>|cRXP_BUY_购买并装备一把|r |T135346:0|t[斗士短剑] |cRXP_BUY_，如果你买不起|r |T135154:0|t[短杖]
	.collect 851,1
    .target 阿瑞耶尔·天影
    .money <0.2023
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.82
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.81
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T135154:0|t[短杖]
    .use 854
    .itemcount 854,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.43
step << Warrior
    #season 2
	.goto Darnassus,58.6,35.6
    .target 阿雷亚斯塔·刃歌
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿雷亚斯塔·刃歌|r交谈
    .trainer >> 学习职业技能
step << Rogue
    #season 0
    .goto Darnassus,62.68,65.58
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_图里安|r 对话
    >>|cRXP_BUY_购买一把|r |T135641:0|t[平衡飞刀]
    .collect 2946,1 -- Balanced Throwing Dagger
    .target 图里安
step
    #completewith NessaShadowsong
    .goto Darnassus,28.52,39.89
    .zone Teldrassil >> 穿过紫色传送门前往鲁瑟兰村
    .zoneskip Darkshore
    .subzoneskip 702
step << Rogue
    #season 2
    #completewith next
    .goto Teldrassil,55.339,90.818
    .cast 421424 >>|cRXP_WARN_在鲁瑟兰村的树干内使用|r |T134269:0|t[|cRXP_LOOT_泰达希尔藏宝图|r] |cRXP_WARN_，使 |cRXP_PICK_埋藏的宝藏|r 出现|r
    .use 208605
    .itemcount 208605,1
    .train 398196,1
step << Rogue
    #season 2
    >>打开|cRXP_PICK_埋藏的宝藏|r，拾取|T134419:0|t[|cRXP_FRIENDLY_速射符文|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
step << Rogue
    #season 2
    .train 400095 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_速射符文|r] |cRXP_WARN_学习|r |T134536:0|t[速射]
    .use 203991
    .itemcount 203991,1
step
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6344 >> 交任务：尼莎·影歌
    .target 尼莎·影歌
    .accept 6341 >> 接任务：泰达希尔的渔业
step
    #label NessaShadowsong
    #optional
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6343 >> 交任务：飞回泰达希尔
    .isOnQuest 6343
    .target 尼莎·影歌
step
    .goto Teldrassil,58.399,94.016
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .turnin 6341 >> 交任务：泰达希尔的渔业
    .target 维斯派塔斯
    .accept 6342 >> 接任务：飞往奥伯丁
step
    .goto Teldrassil,58.399,94.016
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >> 飞往黑海岸
    .target 维斯派塔斯
]])
