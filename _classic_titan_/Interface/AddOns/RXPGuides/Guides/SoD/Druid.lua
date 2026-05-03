RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 怒风之怒 - 4（夜谷）
#title Fury of Stormrage

step << Druid
    #season 2
    .goto Teldrassil,57.80,40.97,25,0
    .goto Teldrassil,58.626,40.287
    >>攀登艾达希尔之树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛丹特·硬木|r
    .accept 77571 >>接受卡多雷圣物
    .trainer >>训练你的职业法术。确保你学会|T136096:0|t[月火术]
    .target Mardant Strongoak
    .train 410061,1
step << Druid
    #season 2
    .goto Teldrassil,55.0,43.7
    >>杀死 |cRXP_ENEMY_Grell|r 和 |cRXP_ENEMY_Grellkin|r。从他们身上夺取 |T134903:0|t[|cRXP_FRIENDLY_Lunar Idol|r]
    .collect 208414,1 -- Lunar Idol (1)
    .mob Grell
    .mob Grellkin
    .train 410061,1
step << Druid
    #season 2
    .equip 18,208414 >>|cRXP_WARN_装备|r |T134903:0|t[|cRXP_FRIENDLY_月球神像|r]
    .use 208414
    .train 410061,1
step << Druid
    #season 2
    .use 208414 >>|cRXP_WARN_在敌人受到|r |T136096:0|t[月火术]影响时杀死他们 6 次 |cRXP_WARN_获得叠加|r |T237556:0|t[灵感]
    >>|cRXP_WARN_击杀 6 人后获得|r |T136116:0|t[Inspired] |cRXP_WARN_buff 后，使用刚刚装备的|r |T134903:0|t[|cRXP_FRIENDLY_Lunar Idol|r] |cRXP_WARN_again|r
    .complete 77571,1 -- Learn: Engrave Chest - Fury of Stormrage
    .train 410061,1
step << Druid
    #season 2
    .goto Teldrassil,57.80,40.97,25,0
    .goto Teldrassil,58.626,40.287
    >>攀登艾达希尔之树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛丹特·硬木|r
    .turnin 77571 >>交出卡多雷圣物
    .target Mardant Strongoak
    .train 410061,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 生命种子 - 10（泰达希尔）
#title Living Seed

step << Druid
    .goto Teldrassil,64.0,54.0,60,0
    .goto Teldrassil,59.0,60.0,60,0
    .goto Teldrassil,57.0,65.0,60,0
    .goto Teldrassil,69.0,55.0,60,0
    .goto Teldrassil,58.0,73.0,60,0
    .goto Teldrassil,61.0,54.0,60,0
    .goto Teldrassil,66.55,51.52
    >>战利品 |T133941:0|t|cRXP_LOOT_Glade Flowers|r 在地面上
    >>|cRXP_WARN_它们遍布泰达希尔|r
    .collect 208609,3 -- Glade Flower (3)
    .train 416050,1
step << Druid
    >>|cRXP_WARN_使用|r |T133941:0|t|cRXP_LOOT_Glade Flowers|r |cRXP_WARN_将它们组合成|r |T132767:0|t[Glade Crown]
    .collect 208760,1 -- Glade Flower (3)
    .train 416050,1
step << Druid
    #completewith NatureSpirit
    .subzone 260 >>前往星风村
    .train 416050,1
step << Druid
    #completewith next
    .goto Teldrassil,67.026,58.039
    .cast 414724 >>|cRXP_WARN_使用|r |T132767:0|t[Glade Crown] |cRXP_WARN_on |cRXP_ENEMY_Wooden Effigy|r。这将产生一个|r |cRXP_ENEMY_Unleashed Nature Spirit。|r
    >>|cRXP_WARN_您可能需要等待几分钟才能重生|r
    .use 208760
    .mob Wooden Effigy
    .train 416050,1
step << Druid
    #label NatureSpirit
    .goto Teldrassil,67.026,58.039
    >>杀死 |cRXP_ENEMY_Unleashed Nature Spirit|r。拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Natural Potential|r]
    >>|cRXP_WARN_这是7级精英|r
    .collect 206963,1 -- Rune of Natural Potential (1)
    .mob Unleashed Nature Spirit
    .train 416050,1
step << Druid
    .train 416050 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_自然潜能符文|r] |cRXP_WARN_进行训练|r |T136152:0|t[生命种子]
    .use 206963
    .itemcount 206963,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 生命绽放 - 8（泰达希尔）
#title Lifebloom

step << Druid
    #sticky
    +|cRXP_WARN_您必须有助手才能收集此符文！它不能单独完成，因为他们必须协助点击召唤仪式，而召唤仪式需要第二名玩家！|r
    .train 410033,1
step << Druid
    .goto Teldrassil,33.610,35.732
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Adventurer's Remains|r
    >>|cRXP_WARN_这将启动召唤仪式，另一个玩家也需要点击|r
    >>掠夺 |cRXP_FRIENDLY_冒险者的遗骸|r 以获得 |T134419:0|t[|cRXP_FRIENDLY_生命符文|r]
    .collect 206970,1 -- Rune of Life (1)
    .skipgossip
    .target Adventurer's Remains
    .train 410033,1
step << Druid
    .train 410033 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_生命符文|r] |cRXP_WARN_进行训练|r |T134206:0|t[生命绽放]
    .use 206970
    .itemcount 206970,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 野蛮咆哮 - 20（黑海岸）
#title Savage Roar

step << Druid
    #season 2
    #sticky
    +|cRXP_WARN_注意：你必须达到 20 级才能装备|r |T132942:0|t[|cRXP_FRIENDLY_凶猛偶像|r] |cRXP_WARN_这是学习|r |T236167:0|t[野蛮咆哮] 所必需的
    .xp 20,1
    .train 407988,1
step << Druid
    #season 2
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>杀死 |cRXP_ENEMY_Den Mother|r。掠夺她以获得 |T132942:0|t[|cRXP_FRIENDLY_Ferocious Idol|r]
    >>|cRXP_WARN_请注意 |cRXP_ENEMY_Thistle Cubs|r 可以让你昏迷 2 秒|r
    .collect 208689,1 -- Ferocious Idol (1)
    .mob Den Mother
    .train 407988,1
step << Druid
    #season 2
    .equip 18,208689 >>|cRXP_WARN_装备|r |T132942:0|t[|cRXP_FRIENDLY_凶猛偶像|r]
    .use 208689
    .itemcount 208689,1
    .train 407988,1
step << Druid
    #season 2
    .train 407988 >>|cRXP_WARN_对|r |T132152:0|t[撕扯] |cRXP_WARN_或|r |T132122:0|t[耙子] |cRXP_WARN_人形生物造成 20 次流血伤害，然后再次使用|r |T132942:0|t[|cRXP_FRIENDLY_凶猛偶像|r] |cRXP_WARN_学习|r |T236167:0|t[野蛮咆哮]
    .use 208689
    .itemcount 208689,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 野蛮咆哮 - 20（西部荒野）
#title Savage Roar

step << Druid
    #season 2
    #sticky
    +|cRXP_WARN_注意：你必须达到 20 级才能装备|r |T132942:0|t[|cRXP_FRIENDLY_凶猛偶像|r] |cRXP_WARN_这是学习|r |T236167:0|t[野蛮咆哮] 所必需的
    .xp 20,1
    .train 407988,1
step << Druid
    #season 2
    .goto Westfall,56.6,13.2,70,0
    .goto Westfall,52.8,15.4,70,0
    .goto Westfall,44.8,13.8,70,0
    .goto Westfall,41.6,20.6,70,0
    .goto Westfall,56.6,13.2
    >>杀死 |cRXP_ENEMY_Riverpaw Gnolls|r、|cRXP_ENEMY_Riverpaw Scouts|r 和 |cRXP_ENEMY_Riverpaw Mongrels|r。从他们身上拾取 |T132942:0|t[|cRXP_FRIENDLY_Ferocious Idol|r]
    .collect 208689,1 -- Ferocious Idol (1)
    .mob Riverpaw Gnoll
    .mob Riverpaw Scout
    .mob Riverpaw Mongrel
    .train 407988,1
step << Druid
    #season 2
    .equip 18,208689 >>|cRXP_WARN_装备|r |T132942:0|t[|cRXP_FRIENDLY_凶猛偶像|r]
    .use 208689
    .itemcount 208689,1
    .train 407988,1
step << Druid
    #season 2
    .train 407988 >>|cRXP_WARN_对|r |T132152:0|t[撕扯] |cRXP_WARN_或|r |T132122:0|t[耙子] |cRXP_WARN_人形生物造成 20 次流血伤害，然后再次使用|r |T132942:0|t[|cRXP_FRIENDLY_凶猛偶像|r] |cRXP_WARN_学习|r |T236167:0|t[野蛮咆哮]
    .use 208689
    .itemcount 208689,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 阳炎之火-6（泰达希尔）
#title Sunfire

step << Druid
    #season 2
    .goto Teldrassil,52.831,78.731,20,0
    .goto Teldrassil,52.988,80.086,15,0
    .goto Teldrassil,52.831,78.731
    >>|cRXP_WARN_在巨大的树枝上你会看到 3|r |cRXP_ENEMY_Lunar Stones|r
    >>|cRXP_WARN_对树枝上的所有 3 颗|r |cRXP_ENEMY_Lunar Stones|r |cRXP_WARN_on 施放|r |T136096:0|t[月火术] |cRXP_WARN_on，然后掠夺箭头位置后生成的宝箱|r
    .collect 206989,1 -- Rune of the Sun (1)
    .mob Lunar Stone
    .train 416044,1
step << Druid
    #season 2
    .train 416044 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_太阳符文|r] |cRXP_WARN_进行训练|r |T236216:0|t[太阳之火]
    .use 206989
    .itemcount 206989,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 割裂 - 10（洛克莫丹）
#title Lacerate

step << Druid
    #season 2
    .goto Loch Modan,40.371,39.404,10,0
    .goto Loch Modan,39.467,39.207
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡拉·深水|r
    >>|cRXP_BUY_购买 a|r |T237270:0|t[彩虹鳍长鳍金枪鱼鱼饵]
    .collect 208855,1 -- Rainbow Fin Albacore Chum (1)
    .target Khara Deepwater
    .train 416049,1
step << Druid
    #season 2
    .goto Loch Modan,46.6,35.6
    .use 208855 >>|cRXP_WARN_对 |cRXP_ENEMY_Young Threshadon|r 使用|r |T237270:0|t[Rainbow Fin Albacore Chum] |cRXP_WARN_来获得|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Lacerate|r]
    .collect 208687,1 -- Rune of Lacerate (1)
    .target Young Threshadon
    .train 416049,1
step << Druid
    #season 2
    .train 416049 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r] |cRXP_WARN_训练|r |T132131:0|t[撕裂]
    .use 208687
    .itemcount 208687,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 怒风之怒 - 4（莫高雷）
#title Fury of Stormrage


    --Rune of Fury of Stormrage

step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gart|r
    .accept 77648 >>接受牛头人的圣物
    .trainer >>训练你的职业法术。确保你学会|T136096:0|t[月火术]
    .target Gart Mistrunner
step << Druid
    #season 2
    .goto Mulgore,60.33,75.10,30,0
    .goto Mulgore,61.62,76.04
    >>掠夺 |cRXP_PICK_Bristleback 战利品缓存|r 以获得 |T134903:0|t[|cRXP_FRIENDLY_Lunar Idol|r]
    .collect 208414,1,77648,1 --Lunar Idol (1)
    .train 410061,1
step << Druid
    #season 2
    .equip 18,208414 >>|cRXP_WARN_装备|r |T134903:0|t[|cRXP_FRIENDLY_月球神像|r]
    .use 208414
    .train 410061,1
step << Druid
    #season 2
    .use 208414 >>|cRXP_WARN_在敌人受到|r |T136096:0|t[月火术]影响时杀死他们 6 次 |cRXP_WARN_获得叠加|r |T237556:0|t[灵感]
    >>|cRXP_WARN_击杀 6 人后获得|r |T136116:0|t[Inspired] |cRXP_WARN_buff 后，使用刚刚装备的|r |T134903:0|t[|cRXP_FRIENDLY_Lunar Idol|r] |cRXP_WARN_again|r
    .complete 77648,1 -- Learn: Engrave Chest - Fury of Stormrage
    .train 410061,1
step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gart|r
    .turnin 77648 >>交出牛头人的圣物
    .target Gart Mistrunner

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 裂伤——10（莫高雷）
#title Mangle


    --Rune of Mangle

step
    #season 2
    .goto Mulgore,43.78,10.96,90,0
    .goto Mulgore,39.62,13.35,90,0
    .goto Mulgore,37.12,16.84,90,0
    .goto Mulgore,44.57,17.39,90,0
    .goto Mulgore,48.70,20.85,90,0
    .goto Mulgore,43.78,10.96
    >>杀死 |cRXP_ENEMY_平原徘徊者s|r 和 |cRXP_ENEMY_草原狼阿尔法s|r。掠夺他们以获得 |T134903:0|t[|cRXP_FRIENDLY_Idol of Ursine Rage|r]
    .collect 206954,1 --Idol of Ursine Rage (1)
    .mob 平原徘徊者
    .mob 草原狼阿尔法
    .train 410025,1
step
    #season 2
    .equip 18,206954 >>|cRXP_WARN_装备|r |T134903:0|t[|cRXP_FRIENDLY_熊之怒偶像|r]
    .use 206954
    .train 410025,1
step
    #completewith next
    +|cRXP_WARN_保持 50+ 怒气至少 60 秒即可学习|r |T132135:0|t[Mangle]
step
    #season 2
    .train 410025 >>|cRXP_WARN_使用|r |T134903:0|t[|cRXP_FRIENDLY_熊之怒偶像|r] |cRXP_WARN_训练|r |T132135:0|t[Mangle]
    .use 206954
    .itemcount 206954,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 阳炎之火 - 5（莫高雷）
#title Sunfire


    --Rune of Sunfire

step
    #season 2
    .goto Mulgore,35.72,69.57
    >>对三块 |cRXP_ENEMY_Lunar Stones|r 施放 |T136096:0|t[月火术]。石头之间会出现一个宝箱
    >>打开 |cRXP_PICK_Lunar Chest|r 获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Sun|r]
    .collect 206989,1 --Rune of the Sun (1)
    .mob Lunar Stone
    .train 416044,1
step
    #season 2
    .train 416044 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_太阳符文|r] |cRXP_WARN_进行训练|r |T236216:0|t[太阳之火]
    .use 206989
    .itemcount 206989,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 生命绽放 - 10（莫高雷）
#title Lifebloom

    --Rune of Lifebloom

step
    #season 2
    .goto Mulgore,60.39,33.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Adventurer's Spirit|r outside of the Venture Co. Mine
    >>|cRXP_WARN_其他玩家需要点击传送门。掠夺|r |cRXP_FRIENDLY_冒险者之灵|r |cRXP_WARN_之后|r |T134419:0|t[|cRXP_FRIENDLY_生命符文|r]
    .collect 206970,1 --Rune of Life (1)
    .target Adventurer's Spirit
    .skipgossip
    .train 410033,1
step << Druid
    #season 2
    .train 410033 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_生命符文|r] |cRXP_WARN_进行训练|r |T134206:0|t[生命绽放]
    .use 206970
    .itemcount 206970,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 生命种子 - 8（莫高雷）
#title Living Seed

    --Rune of Living Seed

step
    #season 2
    .goto Mulgore,58.88,51.18,50,0
    .goto Mulgore,50.94,45.98,50,0
    .goto Mulgore,44.95,46.88,50,0
    .goto Mulgore,39.88,51.61,50,0
    .goto Mulgore,41.36,63.26
    >>战利品 |T133941:0|t|cRXP_LOOT_Prairie Flowers|r 在地面上
    >>|cRXP_WARN_这些在莫高雷各处都有发现|r
    .collect 206469,3 -- Glade Flower (3)
    .train 416050,1
step
    #season 2
    .use >>|cRXP_WARN_使用|r |T133941:0|t|cRXP_LOOT_草原之花|r |cRXP_WARN_将它们组合成|r |T132767:0|t[草原王冠]
    .collect 206466,1 -- Prairie Crown (1)
    .train 416050,1
step
    #season 2
    #completewith next
    .goto Mulgore,37.70,49.52
    .cast 414724 >>|cRXP_WARN_使用|r |T132767:0|t[Glade Crown] |cRXP_WARN_on |cRXP_ENEMY_Wooden Effigy|r。这将产生一个|r |cRXP_ENEMY_Unleashed Nature Spirit。|r
    >>|cRXP_WARN_您可能需要等待几分钟才能重生|r
    .use 206466
    .mob Wooden Effigy
    .train 416050,1
step
    #season 2
    .goto Mulgore,37.70,49.52
    >>杀死 |cRXP_ENEMY_Unleashed Nature Spirit|r。拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Natural Potential|r]
    >>|cRXP_WARN_这是7级精英|r
    .collect 206963,1 -- Rune of Natural Potential (1)
    .mob Unleashed Nature Spirit
    .train 416050,1
step
    #season 2
    .train 416050 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_自然潜能符文|r] |cRXP_WARN_进行训练|r |T136152:0|t[生命种子]
    .use 206963
    .itemcount 206963,1


]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 割裂 - 15（贫瘠之地）
#title Lacerate

    --Rune of Lacerate

step
    #season 2
    #completewith next
    .subzone 386 >>前往被遗忘的池塘
step
    #season 2
    .goto The Barrens,44.73,22.18
    >>掠夺地面上的 |cRXP_PICK_Abandoned Snapjaw Nest|r 以获得 |T294479:0|t[|cRXP_LOOT_Abandoned Snapjaw Egg|r]
    .collect 208682,1 --Abandoned Snapjaw Egg (1)
    .train 416049,1
step
    #season 2
    #completewith next
    .subzone 387 >>前往 Lushwater 绿洲
step
    #season 2
    .goto The Barrens,48.32,40.25
    >>打开地面上的 |cRXP_PICK_Empty Snapjaw Nest|r 获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Lacerate|r]
    .collect 208687,1 --Unbalanced Idol (1)
    .train 416049,1
step
    #season 2
    .train 416049 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r] |cRXP_WARN_训练|r |T132131:0|t[撕裂]
    .use 208687 --Rune of Lacerate (1)
    .itemcount 208687,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 野蛮咆哮 - 15（贫瘠之地）
#title Savage Roar

    --Rune of Savage Roar

step
    #season 2
    #sticky
    +|cRXP_WARN_注意：你必须达到 20 级才能装备|r |T132942:0|t[|cRXP_FRIENDLY_凶猛偶像|r] |cRXP_WARN_这是学习|r |T236167:0|t[野蛮咆哮] 所必需的
    .xp 20,1
    .train 407988,1
step
    #season 2
    .goto The Barrens,43.57,23.48,50,0
    .goto The Barrens,43.84,21.47,50,0
    .goto The Barrens,45.04,20.04,50,0
    .goto The Barrens,46.60,22.98,50,0
    .goto The Barrens,45.71,25.63,50,0
    .goto The Barrens,43.55,26.39,50,0
    .goto The Barrens,42.21,26.92,50,0
    .goto The Barrens,42.02,24.68,50,0
    .goto The Barrens,43.57,23.48
    >>杀死 |cRXP_ENEMY_Kolkar Wranglers|r 和 |cRXP_ENEMY_Kolkar Stormers|r。掠夺他们以获得 |T134237:0|t[|cRXP_LOOT_Kolkar Booty Key|r]
    .collect 5020,1 --Kolkar Booty Key (1)
    .mob Kolkar Wrangler
    .mob Kolkar Stormer
    .train 407988,1
step
    #season 2
    #loop
    .goto The Barrens,44.3,37.7,0
    .goto The Barrens,43,23.5,0
    .goto The Barrens,52.7,41.8,0
    .goto The Barrens,44.3,37.7,20,0
    .goto The Barrens,43,23.5,20,0
    .goto The Barrens,52.7,41.8,20,0
    >>打开 |cRXP_PICK_Kolkar Booty|r 宝箱，获取 |T132942:0|t[|cRXP_FRIENDLY_Ferocious Idol|r]
    .collect 5020,1 --Kolkar Booty Key (1)
    .collect 208689,1 --Ferocious Idol (1)
    .train 407988,1
step
    #season 2
    .equip 18,208689 >>|cRXP_WARN_装备|r |T132942:0|t[|cRXP_FRIENDLY_凶猛偶像|r]
    .use 208689
    .itemcount 208689,1
    .train 407988,1
step
    #season 2
    .train 407988 >>|cRXP_WARN_对|r |T132152:0|t[撕扯] |cRXP_WARN_或|r |T132122:0|t[耙子] |cRXP_WARN_人形生物造成 20 次流血伤害，然后再次使用|r |T132942:0|t[|cRXP_FRIENDLY_凶猛偶像|r] |cRXP_WARN_学习|r |T236167:0|t[野蛮咆哮]
    .use 208689
    .itemcount 208689,1


]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup Belt
#name 狂暴 - 28（千针石林）
#title Berserk

step
    #optional
    +|cRXP_WARN_你必须达到至少 28 级才能学习|r |T236149:0|t[狂暴]
    .xp >29,1
step
    #optional
    .train 424760,1
    .train 5209 >>|cRXP_WARN_你必须接受|r |T132117:0|t[挑战咆哮] |cRXP_WARN_训练才能获得|r |T236149:0|t[狂暴] |cRXP_WARN_符文|r
step
    #completewith next
    .train 424760,1
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
step
    .train 424760,1
    .goto Thousand Needles,68.690,55.155
    .aura 435081 >>|cRXP_WARN_站在 |cRXP_PICK_Beastly Effigy|r 雕像旁边接收|r |T134912:0|t[Beastly Effigy] |cRXP_WARN_buff|r
step
    #completewith next
    .train 424760,1
    .goto Thousand Needles,68.690,55.155
    .cast 5209 >>|cRXP_WARN_进入|r |T132276:0|t[熊形态] |cRXP_WARN_并施放|r |T132117:0|t[挑战咆哮] |cRXP_WARN_召唤|r |cRXP_ENEMY_Zai'enki|r |cRXP_WARN_(28 级精英)|r
step
    .train 424760,1
    .goto Thousand Needles,68.690,55.155
    >>击杀 |cRXP_ENEMY_Zai'enki|r。拾取它以获得 |T134912:0|t[|cRXP_FRIENDLY_Idol of the Heckler|r]
    .collect 213594,1
    .mob Zai'enki
step
    .train 424760,1
    .equip 18,213594 >>装备 |T134912:0|t[|cRXP_FRIENDLY_Idol of the Heckler|r]
    .use 213594
step
    #title Gain 5x |T237556:0|t[Building Inspiration]
    .itemcount 213594,1
    .train 424760,1
    .aura 408828 >>|cRXP_WARN_施放|r |T132117:0|t[挑战咆哮] |cRXP_WARN_嘲讽至少 2 名敌人并在他们获得|r |T132117:0|t[挑战咆哮] |cRXP_WARN_debuff 时杀死其中一名。这将为你提供一堆|r |T237556:0|t[建筑灵感] |cRXP_WARN_buff。重复此操作 5 次，直到你获得|r |T136116:0|t[灵感] |cRXP_WARN_buff|r
    *|cRXP_WARN_It's recommened you fight one mob and almost kill it, then pull a 2nd and cast|r |T132117:0|t[Challenging Roar]|cRXP_WARN_, then kill the low health mob. You will lose all stacks of|r |T237556:0|t[Building Inspiration] |cRXP_WARN_if you die|r
step
    .itemcount 213594,1
    .use 213594
    .train 424760 >>|cRXP_WARN_使用|r |T134912:0|t[|cRXP_FRIENDLY_Heckler 的偶像|r] |cRXP_WARN_进行训练|r |T236149:0|t[Berserk]
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup Boots
#name 梦境-33（凄凉之地）
#title Dreamstate

step
    #completewith next
    .train 410060,1
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .train 410060,1
    #loop
    .goto Desolace,70.6,39.8,0
    .goto Desolace,70.6,39.8,25,0
    .goto Desolace,69.2,46.6,25,0
    .goto Desolace,68.6,52.6,25,0
    >>杀死 |cRXP_ENEMY_Kolkars|r 并掠夺他们以获得 |T134187:0|t[干燥的种荚]
    .collect 213574,1
    .mob Kolkar Centaur
    .mob Kolkar Mauler
    .mob Kolkar Scout
    .mob Kolkar Windchaser
step
    .train 410060,1
    >>在水中游泳，直到豆荚变成|T134208:0|t[Satyrweed Bulb]
    .goto Desolace,70.8,71.8
    .collect 206966,1
step
    .goto Desolace,75.5,20.7
    .train 410060 >>点击 |cRXP_PICK_Sandy Loam|r 种下种子来学习 |T136090:0|t[Dreamstate]
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup Belt
#name 滋养-35（艾泽拉斯）
#title Nourish

-- Probably needs better waypoints to avoid some dangerous mobs or anything else that could kill you

step
    #completewith next
    .train 410059,1
    .goto Dustwallow Marsh,30.2,47.3,200,0
    .zone Dustwallow Marsh >>前往: |cRXP_PICK_尘泥沼泽|r
step
    .train 410059,1
    >>杀死 |cRXP_ENEMY_Rotting Ancient|r。拾取它以获得 |T134217:0|t[Rotten Seed]。|cRXP_WARN_将其放入你的包中点击|r
    #loop
    .goto Dustwallow Marsh,43.6,41.0,40,0
    .goto Dustwallow Marsh,40.91,43.52,40,0
    .collect 212693,1
    .accept 79348 >>接受失落的古迹
    .mob Rotting Ancient
step
    #completewith next
    .train 410059,1
    .zone Moonglade >>前往: |cRXP_PICK_月光林地|r
step
    #completewith next
    +|cRXP_WARN_您必须严格遵守每个即将到来的指示。死亡、陷入阶段、被召唤、使用传送或获得“无荣誉目标”增益都可能导致任务失败（您会失去增益），因此不要使用任何飞行点进入有争议的区域。|r
step
    .train 410059,1
    .goto Moonglade,41.48,43.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orokai|r
    *|cRXP_WARN_Accepting the next quest start a 1 hour timer. Make sure that you can commit the whole hour.|r
    .turnin 79348 >>交出失落的古迹
    .accept 79377 >>接受丢失的树苗
    .timer 3600,Water Duration
    .target Orokai
step << Alliance
    .train 410059,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_辛德拉尔|r
    .goto Moonglade,48.11,67.37
    .fly Auberdine >>飞往 奥伯丁
    .target Sindrayl
step << Alliance
    .train 410059,1
    .goto Darkshore,36.90,44.13,10,0
    .goto Darkshore,32.44,43.71
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r, 乘船前往米奈希尔港。|cRXP_WARN_船开始移动后退出。等待 40 秒然后重新登录|r
step << Alliance
    #completewith next
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step << Alliance
    .train 410059,1
    >>对 |cRXP_FRIENDLY_Ancient Sapling|r 使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,3 --Fall Sapling
    .use 213036
    .goto Arathi Highlands,46.98,71.83
    .target Ancient Sapling
step << Alliance
    #completewith next
    .zone Alterac Mountains >>前往: |cRXP_PICK_奥特兰克山脉|r, |cRXP_WARN_不要使用飞行管理员|r
step << Alliance
    .train 410059,1
    >>对 |cRXP_FRIENDLY_Ancient Sapling|r 使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,4 --Winter Sapling
    .use 213036
    .goto Alterac Mountains,58.27,43.57
    .target Ancient Sapling
step << Alliance
    #completewith next
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step << Alliance
    .train 410059,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_比比尔法兹|r
    .goto Western Plaguelands,42.93,85.07
    .fly Stormwind >>飞往暴风城
    .target Bibilfaz Featherwhistle
step << Alliance
    #completewith AncientSapling3Alliance
    .goto Deadwind Pass,32.5,35,7,50,0
    .zone Deadwind Pass >>前往: |cRXP_PICK_逆风小径|r
step << Alliance
    #completewith AncientSapling3Alliance
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
step << Alliance
    #label AncientSapling3Alliance
    .train 410059,1
    >>对 |cRXP_FRIENDLY_Ancient Sapling|r 使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,2 --Spring Sapling
    .use 213036
    .goto Swamp of Sorrows,17.68,42.41,50,0
    .goto Swamp of Sorrows,10.98,38.40
    .target Ancient Sapling
step << Alliance
    #completewith next
    .goto Swamp of Sorrows,3.5,61.3,50,0
    .goto Deadwind Pass,32.3,36.0,50,0
    .goto Duskwood,44.6,87.3,50,0
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
step << Alliance
    .train 410059,1
    >>对 |cRXP_FRIENDLY_Ancient Sapling|r 使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,1 --Summer Sapling
    .use 213036
    .goto Stranglethorn Vale,32.74,64.82
    .target Ancient Sapling
step << Horde
    .train 410059,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布瑟恩·草风|r
    .goto Moonglade,44.29,45.86
    .skipgossip 11798,1
    .zone Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Bunthen Plainswind
step << Horde
    .train 410059,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔尔|r
    .goto Thunder Bluff,47.00,49.82
    .fly Ratchet >>飞往棘齿城
    .target Tal
step << Horde
    .goto The Barrens,63.677,38.618
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r, 乘船前往藏宝海湾。|cRXP_WARN_船开始移动后登出。等待 40 秒，然后重新登录。|r
step << Horde
    .train 410059,1
    >>对 |cRXP_FRIENDLY_Ancient Sapling|r 使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,1 --Summer Sapling
    .use 213036
    .goto Stranglethorn Vale,32.74,64.82
    .target Ancient Sapling
step << Horde
    #completewith next
    .goto Duskwood,44.0,66.4,100,0
    .goto Duskwood,89,4,41.2,50,0
    .goto Deadwind Pass,58.3,42.0,50,0
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r, 向北穿过暮色森林和逆风小径进入悲伤沼泽。|cRXP_WARN_避开夜色镇|r
step << Horde
    .train 410059,1
    >>对 |cRXP_FRIENDLY_Ancient Sapling|r 使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,2 --Spring Sapling
    .use 213036
    .goto Swamp of Sorrows,17.68,42.41,50,0
    .goto Swamp of Sorrows,10.98,38.40
    .target Ancient Sapling
step << Horde
    .goto Swamp of Sorrows,46.10,54.70
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布雷依克|r
    .fly Undercity >>飞往幽暗城
	.target Breyk
step << Horde
    .goto Tirisfal Glades,61.6,62.2,50,0
    .goto Tirisfal Glades,54.7,73.0,50,0
    .goto Silverpine Forest,66.7,8.8,50,0
    .zone Alterac Mountains >>|cRXP_WARN_前往: |cRXP_PICK_奥特兰克山脉|r , 离开幽暗城并前往银松森林，游过湖泊到达奥特兰克山脉|r
step << Horde
    .train 410059,1
    >>对 |cRXP_FRIENDLY_Ancient Sapling|r 使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,4 --Winter Sapling
    .use 213036
    .goto Alterac Mountains,58.27,43.57
    .target Ancient Sapling
    step << Horde
    #completewith next
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step << Horde
    .train 410059,1
    >>对 |cRXP_FRIENDLY_Ancient Sapling|r 使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,3 --Fall Sapling
    .use 213036
    .goto Arathi Highlands,46.98,71.83
    .target Ancient Sapling
step
    #completewith next
    .train 410059,1
    .zone Moonglade >>前往: |cRXP_PICK_月光林地|r
step
    .train 410059,1
    .goto Moonglade,41.48,43.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orokai|r
    .turnin 79377 >>交还丢失的树苗
    .target Orokai
step
    .itemcount 213594,1
    .use 213594
    .train 410059 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Nourishing|r] 学习 |T236162:0|t[Nourish]
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup Bracers
#name 白华 - 45（艾泽拉斯）

step
    #optional
    .train 431468,1
    .train 2728 >>|cRXP_WARN_你必须经过|r |T135952:0|t[解除诅咒] |cRXP_WARN_trained才能获得|r |T134222:0|t[白花] |cRXP_WARN_rune|r
step
    #optional
    .train 431468,1
    .train 8946 >>|cRXP_WARN_你必须经过|r |T136067:0|t[Cure Poison] |cRXP_WARN_trained才能获得|r |T134222:0|t[Efflorescence] |cRXP_WARN_rune|r
step
    #optional
    .train 431468,1
    .train 16914 >>|cRXP_WARN_你必须经过|r |T136018:0|t[飓风] |cRXP_WARN_训练才能获得|r |T134222:0|t[风化] |cRXP_WARN_符文|r
step
    #optional
    .train 431468,1
    .train 740 >>|cRXP_WARN_你必须经过|r |T136107:0|t[Tranquility] |cRXP_WARN_trained才能获得|r |T134222:0|t[Efflorescence] |cRXP_WARN_rune|r
step
    #optional
    .train 431468,1
    .train 768 >>|cRXP_WARN_你必须经过|r |T132115:0|t[Cat Form] |cRXP_WARN_trained才能获得|r |T134222:0|t[Efflorescence] |cRXP_WARN_rune|r
step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
    .train 431468,1
step
    .train 431468,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tyrisius|r |cRXP_WARN_inside the tower|r
    .goto Feralas,57.2,69.0
    .accept 81924 >>接受守护者的智慧
    .target Tyrisius
step
    .train 431468,1
    .aura 446488 >>点击 |cRXP_PICK_Shrine of the Warden|r 获得 |T132145:0|t[Duty of the Warden] 增益
    .goto Feralas,58.7,52.4
step
    .train 431468,1
    #sticky
    #label MarkoftheWarden
    .aura 446467 >>按照以下步骤获取 |T236157:0|t[守望者印记] 增益
step
    .train 431468,1
    #loop
    .goto Feralas,61.8,55.6,35,0
    .goto Feralas,58.6,66.2,35,0
    >>攻击 |cRXP_ENEMY_戈杜尼术士|r。|cRXP_WARN_等到他们对你使用|r |T136121:0|t[缩小] |cRXP_WARN_。|r 
    .cast 2728 >>|cRXP_WARN_使用|r |T135952:0|t[移除诅咒] |cRXP_WARN_来移除|r |T136121:0|t[缩小] |cRXP_WARN_debuff|r
    .mob 戈杜尼术士
step
    .train 431468,1
    .goto Feralas,73.8,61.6
    >>攻击 |cRXP_ENEMY_Zukk'ash Wasp|r。|cRXP_WARN_等到他们对你使用|r |T136016:0|t[毒药] |cRXP_WARN_。|r
    .cast 526 >>|cRXP_WARN_使用|r |T135952:0|t[解毒] |cRXP_WARN_来移除|r |T136016:0|t[毒药] |cRXP_WARN_减益效果|r
    .mob Zukk'ash Wasp
step
    #requires MarkoftheWarden
    .train 431468,1
    >>|cRXP_WARN_点击/跑到|r |cRXP_PICK_守望者神殿|r |cRXP_WARN_召唤|cRXP_ENEMY_树人化身|r|r
    >>杀死 |cRXP_ENEMY_Treant Avatar|r。
    .complete 81924,1 --Guardian of Feralas
    .goto Feralas,58.7,52.4
    .mob Treant Avatar
step
    .train 431468,1
    #completewith next
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
step
    .train 431468,1
    .goto Azshara,34.6,49.0
    .gossip 441947,0 >>点击 |cRXP_PICK_Shrine of the Beast|r
    *|cRXP_WARN_Skip this step manually if it doesn't complete|r
step
    .train 431468,1
    >>杀死 |cRXP_ENEMY_Child of Apa'ro|r |cRXP_WARN_使用近战技能（进入猫形态或熊形态）|r。拾取它以获得 |T134338:0|t[|cRXP_LOOT_Sacred Stag Heart|r]
    .collect 221326,1
    .mob Child of Apa'ro
step
    #completewith next
    .itemcount 221362,1
    .use 221326
    .goto Azshara,34.6,49.0
    .cast 446509 >>|cRXP_WARN_使用|r |T134338:0|t[|cRXP_LOOT_神圣鹿心|r] |cRXP_WARN_在|r |cRXP_PICK_野兽神殿|r |cRXP_WARN_旁边的|r |cRXP_LOOT_神圣鹿心|r] |cRXP_WARN_召唤|r |cRXP_ENEMY_犀牛兽头像|r
    .train 431468,1
step
    .train 431468,1
    >>杀死 |cRXP_ENEMY_Hippogryph Avatar|r
    .goto Azshara,34.6,49.0
    .complete 81924,3 --Guardian of Azshara
    .mob Hippogryph Avatar
step
    .train 431468,1
    #completewith next
    .zone The Hinterlands >>前往: |cRXP_PICK_辛特兰|r
step
    .train 431468,1
    .goto The Hinterlands,66.2,53.1
    .gossip 441946,0 >>点击山顶的 |cRXP_PICK_Shrine of the Moon|r
    *|cRXP_WARN_Skip this step manually if it doesn't complete|r
step
    .train 431468,1
    .cast 740 >>|cRXP_WARN_Use|r |T136107:0|t[宁静]
step
    .train 431468,1
    .cast 16914 >>|cRXP_WARN_Use|r |T136018:0|t[飓风]
step
    .train 431468,1
    >>杀死|cRXP_WARN_Moonkin Avatar|r
    .goto The Hinterlands,66.2,53.1
    .complete 81924,2 --Guardian of the Hinterlands
    .mob Moonkin Avatar
step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
    .train 431468,1
step
    .train 431468,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tyrisius|r |cRXP_WARN_inside the tower|r
    .goto Feralas,57.2,69.0
    .turnin 81924 >>交出守护者的智慧
    .target Tyrisius
step
    .itemcount 220360,1
    .use 220360
    .train 431468 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Efflorescence|r] 来学习 |T134222:0|t[Efflorescence]
    
]])


-- RXPGuides.RegisterGuide([[
-- #classic
-- << Druid SoD
-- #group RestedXP 符文书指南
-- #subgroup Bracers
-- #name 强化狂暴回复
-- for phase 3


-- ]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup Helmet
#name 烈风 - 40（菲拉斯）

step
    #completewith NamidaGrimtotem
    .train 431451,1
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
    #label NamidaGrimtotem
    .train 431451,1
    >>杀死 |cRXP_ENEMY_Namida Grimtotem|r。掠夺她以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Windstorm|r]
    .goto Feralas,66.8,38.6
    .collect 220754,1 
    .mob Namida Grimtotem
step
    .itemcount 220754,1
    .use 220754
    .train 431451 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_风暴符文|r] |cRXP_WARN_进行训练|r |T236154:0|t[狂风]

]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup Bracers
#name 艾露恩之火 - 45（艾萨拉）

step
    #completewith next
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
    .train 416051,1
step
    --PERMOK: Check coordiantes
    .train 416051,1
    >>点击 |cRXP_PICK_旅行者的背包|r 以掠夺 |T236229:0|t[|cRXP_LOOT_野战药品包|r] 和 |T133741:0|t[|cRXP_LOOT_Kelara 的日志|r]
    .goto Azshara,20.61,61.97
    .collect 221018,1
    .collect 221017,1
step
    .train 416051,1
    --PERMOK: Fix coordiantes
    #loop
    .goto Azshara,20,65,30,0
    .goto Azshara,20,62,30,0
    .goto Azshara,21,61,30,0
    >>拾取 3 |T134218:0|t[|cRXP_PICK_Satyrweed 样本|r]
    .collect 221019,3
step
    >>|cRXP_WARN_使用|r |T236229:0|t[|cRXP_LOOT_野战医药包|r] |cRXP_WARN_将样本合并到|r |T236868:0|t[Satyrweed 酊剂]
    .collect 221199,1
step
    .train 416051,1
    #loop
    .goto Azshara,16.0,49.6,30,0
    .goto Azshara,18.6,66.6,30,0
    .goto Azshara,21.0,56.2,30,0
    >>寻找带有 |T136134:0|t[萨特腐化] 减益效果的 |cRXP_ENEMY_Thunderhead Hyppogryph|r
    *|cRXP_WARN_If it has the debuff then it emits a green poison cloud|r.
    .cast 2637 >>对 |cRXP_ENEMY_Thunderhead Hyppogryph|r 使用 |T136090:0|t[Hybernate]
    .mob Thunderhead Hyppogryph
step
    .train 416051,1
    >>|cRXP_WARN_对 |cRXP_ENEMY_Thunderhead Hyppogryph|r 使用|r |T236868:0|t[萨蒂尔草酊剂] |cRXP_WARN_来移除|r |T136134:0|t[萨蒂尔腐化] |cRXP_WARN_减益|r 并获得 |T134419:0|t[|cRXP_FRIENDLY_月神符文|r] 
    .itemcount 221199,1
    .use 221199
    .collect 221020,1
    .mob Thunderhead Hyppogryph
step
    .itemcount 221020,1
    .use 221020
    .train 416051 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_风暴符文|r] |cRXP_WARN_训练|r |T236163:0|t[艾露恩之火]
]]) 

-- RXPGuides.RegisterGuide([[
-- #classic
-- << Druid SoD
-- #group RestedXP 符文书指南
-- #subgroup Helmet
-- #name Gore
-- for phase 3


-- ]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup Helmet
#name 强化树皮术 - 44（塔纳利斯）

step
    #optional
    .train 431449,1
    .train 22812 >>|cRXP_WARN_你必须经过|r |T136097:0|t[Barkskin] |cRXP_WARN_trained 才能获得|r |T136097:0|t[Improved Barkskin] |cRXP_WARN_rune|r
step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
    .train 431449,1
step
    #loop
    .goto Tanaris,28.2,63.0,40,0
    .goto Tanaris,28.2,68.6,40,0
    .goto Tanaris,30.8,63.4,40,0
    >>杀死 |cRXP_ENEMY_Thistleshrub 露水收集者|r 和 |cRXP_ENEMY_Thistleshrub 根塑者|r。拾取他们以获得 |T136061:0|t[|cRXP_LOOT_狂暴蹒跚者偶像|r]
    .collect 220915,1
    .mob Thistleshrub Dew Collector
    .mob 蓟灌木根塑造者
    .train 431449,1
step
    .equip 18,220915 >>|cRXP_WARN_装备|r |T136061:0|t[|cRXP_FRIENDLY_狂暴蹒跚者的偶像|r]
    .train 431449,1
step
    .aura 408828 >>在 |T136097:0|t[Barkskin] 的影响下，使用自然法术（例如愤怒）杀死 |cRXP_WARN_five 个敌人。|r 
    *|cRXP_WARN_Use |T136097:0|t[Barkskin] when the enemy is at low HP and finish him with a Wrath or another Nature spell|r
    .train 431449,1
step
    .itemcount 221020,1
    .use 221020
    .train 431449 >>|cRXP_WARN_使用|r |T136061:0|t[|cRXP_FRIENDLY_狂暴蹒跚者偶像|r] |cRXP_WARN_训练|r |T136097:0|t[改良树皮术]
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup 披风
#name 强化横扫 - 50 (安戈洛环形山)
#title Improved Swipe

step
    #completewith next
    .train 439765,1
    .zone Un'Goro Crater >>前往: |cRXP_PICK_安戈洛环形山|r
step
    .train 439765,1
    .goto Un'Goro Crater,68.0,51.4
    >>杀死 |cRXP_ENEMY_Ravasaurs|r、|cRXP_ENEMY_Ravasaur Hunters|r 和 |cRXP_ENEMY_Venomhide Ravasaurs|r。拾取它们以获得 |T134912:0|t[|cRXP_FRIENDLY_Idol of the Huntress|r]
    .collect 227444,1
    .mob Venomhide Ravasaur
    .mob Ravasaur Hunter
    .mob Ravasaur
step
    .train 439765,1
    .equip 18,227444 >>装备 |T134912:0|t[|cRXP_FRIENDLY_女猎手偶像|r]
    .use 227444
step
    .goto Un'Goro Crater,68.0,51.4
    #title Gain 5x |T237556:0|t[Building Inspiration]
    .itemcount 227444,1
    .train 439765,1
    .aura 408828 >>|cRXP_WARN_攻击 |cRXP_ENEMY_Ravasaur|r 直到它们的生命值降至大约 5-10%，并确保你在它们身上有 5 个连击点|r
    >>|cRXP_WARN_当它们的生命值降至 5-10% 时，施放|r |T136090:0|t[休眠] |cRXP_WARN_然后切换到|r |T132115:0|t[猫形态] |cRXP_WARN_并施放|r |T132127:0|t[凶猛撕咬] |cRXP_WARN_杀死它们以获得一层|r |T237556:0|t[建筑灵感]
    >>|cRXP_WARN_重复此过程 5 次|r
    .mob Venomhide Ravasaur
    .mob Ravasaur Hunter
    .mob Ravasaur   
step
    .itemcount 227444,1
    .use 227444
    .train 439765 >>|cRXP_WARN_使用|r |T134912:0|t[|cRXP_FRIENDLY_女猎手偶像|r] |cRXP_WARN_进行训练|r |T134296:0|t[改进的滑动]
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup 披风
#name 生命之树 - 50（费伍德森林）
#title Tree of Life

step
    #completewith next
    .train 439767,1
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
step
    .train 439767,1
    #loop
    .goto Felwood,42,15,70,0
    .goto Felwood,42,19,70,0
    .goto Felwood,42,15,0
    .goto Felwood,42,19,0
    >>|cRXP_WARN_对话: Vengeful Wisp, in northern Felwood, then follow it through Jadefire Run and kill any |cRXP_ENEMY_Satyrs|r
    >>|cRXP_WARN_|cRXP_FRIENDLY_Vengeful Wisp|r 有多个生成位置。如果您看到另一个德鲁伊已经拥有 |cRXP_FRIENDLY_Vengeful Wisp|r，您可以帮助他们并仍然获得积分。|r
    >>一旦完成，|cRXP_FRIENDLY_Vengeful Wisp|r 会将 |cRXP_PICK_Gift of the Wisp|r 掉落在地上。拾取它可获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of the World Tree|r]
    .collect 227746,1
    .unitscan Vengeful Wisp  
step
    .itemcount 227746,1
    .use 227746
    .train 439767 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_世界之树符文|r] |cRXP_WARN_训练|r |T132145:0|t[生命之树]
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup 披风
#name 星陨 - 60（冬泉谷）
#title Starfall

step
    #completewith next
    .train 439770,1
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
    >>|cRXP_WARN_请注意，要获得此符文，您必须杀死 58 级精英。考虑邀请朋友来帮助您|r
step
    .train 439770,1
    #loop
    .goto Winterspring,64.8,19.4,50,0
    .goto Winterspring,63.8,16.4
    >>杀死 |cRXP_ENEMY_Arcterris|r。从他身上搜刮物品，获得 |T134419:0|t[|cRXP_FRIENDLY_陨星符文|r]
    >>|cRXP_WARN_注意 |cRXP_ENEMY_Arcterris|r 是 58 级精英。考虑邀请朋友来帮助你|r
    .collect 227749,1
    .mob Arcterris
step
    .itemcount 227749,1
    .use 227749
    .train 439770 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_陨星符文|r] |cRXP_WARN_进行训练|r |T236168:0|t[星辰坠落]
]])