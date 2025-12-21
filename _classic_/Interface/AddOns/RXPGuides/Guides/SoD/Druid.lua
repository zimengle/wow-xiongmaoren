RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 风暴怒吼的狂怒 - 4(夜谷)
#displayname  Fury of Stormrage

step << Druid
    #season 2
    .goto Teldrassil,57.80,40.97,25,0
    .goto Teldrassil,58.626,40.287
    >>攀上奥达希尔之树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛丹特·硬木|r交谈
    .accept 77571 >>接任务: |cRXP_WARN_卡多雷的圣物|r
    .trainer >>训练你的职业法术. 确保你学会 |T136096:0|t[月火术]
    .target Mardant Strongoak
    .train 410061,1
step << Druid
    #season 2
    .goto Teldrassil,55.0,43.7
    >>击杀|cRXP_ENEMY_小劣魔|r和|cRXP_ENEMY_劣魔|r. 击败他们后拾取 |T134903:0|t[|cRXP_FRIENDLY_月之祭坛|r]
    .collect 208414,1 -- Lunar Idol (1)
    .mob Grell
    .mob Grellkin
    .train 410061,1
step << Druid
    #season 2
    .equip 18,208414 >>|cRXP_WARN_装备|r|T134903:0|t[|cRXP_FRIENDLY_月神雕像|r]
    .use 208414
    .train 410061,1
step << Druid
    #season 2
    .use 208414 >>|cRXP_WARN_在敌人受到|r|T136096:0|t[月火术]影响时击杀他们6次, 以获得|r|T237556:0|t[灵感]叠加
    >>|cRXP_WARN_击杀6次后获得|r |T136116:0|t[灵感] |cRXP_WARN_buff, 使用你刚刚装备的|r |T134903:0|t[|cRXP_FRIENDLY_月之圣物|r] |cRXP_WARN_again|r
    .complete 77571,1 -- Learn: Engrave Chest - Fury of Stormrage
    .train 410061,1
step << Druid
    #season 2
    .goto Teldrassil,57.80,40.97,25,0
    .goto Teldrassil,58.626,40.287
    >>攀上奥达希尔之树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛丹特·硬木|r交谈
    .turnin 77571 >>交任务: |cRXP_FRIENDLY_卡多雷的圣物|r
    .target Mardant Strongoak
    .train 410061,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 生命种子 - 10(泰达希尔)
#displayname Living Seed

step << Druid
    .goto Teldrassil,64.0,54.0,60,0
    .goto Teldrassil,59.0,60.0,60,0
    .goto Teldrassil,57.0,65.0,60,0
    .goto Teldrassil,69.0,55.0,60,0
    .goto Teldrassil,58.0,73.0,60,0
    .goto Teldrassil,61.0,54.0,60,0
    .goto Teldrassil,66.55,51.52
    >>战利品 |T133941:0|t|cRXP_LOOT_Glade Flowers|r出现在地面上
    >>|cRXP_WARN_这些物品遍布泰达希尔各地|r
    .collect 208609,3 -- Glade Flower (3)
    .train 416050,1
step << Druid
    >>|cRXP_WARN_使用|r|T133941:0|t|cRXP_LOOT_林地花蕾|r|cRXP_WARN_将其合成|r|T132767:0|t[林地王冠]
    .collect 208760,1 -- Glade Flower (3)
    .train 416050,1
step << Druid
    #completewith NatureSpirit
    .subzone 260 >>前往星风村
    .train 416050,1
step << Druid
    #completewith next
    .goto Teldrassil,67.026,58.039
    .cast 414724 >>|cRXP_WARN_使用|r|T132767:0|t[林地王冠]|cRXP_WARN_施加在|cRXP_ENEMY_木制雕像|r上. 这将召唤出一个|r|cRXP_ENEMY_失控的自然之灵|r|r
    >>|cRXP_WARN_您可能需要等待几分钟让它刷新|r
    .use 208760
    .mob Wooden Effigy
    .train 416050,1
step << Druid
    #label NatureSpirit
    .goto Teldrassil,67.026,58.039
    >>击杀|cRXP_ENEMY_Unleashed Nature Spirit|r. 击败后可拾取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Natural Potential|r]
    >>|cRXP_WARN_这是7级精英|r
    .collect 206963,1 -- Rune of Natural Potential (1)
    .mob Unleashed Nature Spirit
    .train 416050,1
step << Druid
    .train 416050 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_自然潜能符文|r]|cRXP_WARN_来训练|r|T136152:0|t[生命种子]
    .use 206963
    .itemcount 206963,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 生命绽放 - 8(泰达希尔)
#displayname Lifebloom

step << Druid
    #sticky
    +|cRXP_WARN_你必须有帮手才能收集这个符文！它无法单人完成, 因为需要协助点击召唤仪式, 而该仪式 requires 第二名玩家参与！|r
    .train 410033,1
step << Druid
    .goto Teldrassil,33.610,35.732
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冒险者的遗骸|r交谈
    >>|cRXP_WARN_这将启动召唤仪式, 另一名玩家也需要点击确认|r
    >>掠夺|cRXP_FRIENDLY_冒险者的遗骸|r以获得 |T134419:0|t[|cRXP_FRIENDLY_生命符文|r]
    .collect 206970,1 -- Rune of Life (1)
    .skipgossip
    .target Adventurer's Remains
    .train 410033,1
step << Druid
    .train 410033 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_生命符文|r]|cRXP_WARN_来训练|r|T134206:0|t[生命绽放]
    .use 206970
    .itemcount 206970,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狂野咆哮 - 20 (黑海岸)
#displayname Savage Roar

step << Druid
    #season 2
    #sticky
    +|cRXP_WARN_注意: 你必须达到 20 级才能装备|r|T132942:0|t[|cRXP_FRIENDLY_狂暴图腾|r]|cRXP_WARN_这是学习|r|T236167:0|t[野蛮咆哮] 所必需的
    .xp 20,1
    .train 407988,1
step << Druid
    #season 2
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>击杀|cRXP_ENEMY_雌蓟熊|r. 掠夺她以获得 |T132942:0|t[|cRXP_FRIENDLY_狂怒图腾|r]
    >>|cRXP_WARN_请注意|cRXP_ENEMY_蓟熊幼崽|r, 它们可能会让你眩晕2秒|r
    .collect 208689,1 -- Ferocious Idol (1)
    .mob Den Mother
    .train 407988,1
step << Druid
    #season 2
    .equip 18,208689 >>|cRXP_WARN_装备|r|T132942:0|t[|cRXP_FRIENDLY_狂怒图腾|r]
    .use 208689
    .itemcount 208689,1
    .train 407988,1
step << Druid
    #season 2
    .train 407988 >>|cRXP_WARN_对|r|T132152:0|t[撕裂]|cRXP_WARN_或|r|T132122:0|t[抓击]|cRXP_WARN_造成20次流血伤害给类人生物, 然后使用|r|T132942:0|t[|cRXP_FRIENDLY_凶猛图腾|r]|cRXP_WARN_再次学习|r|T236167:0|t[野蛮咆哮]
    .use 208689
    .itemcount 208689,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 野蛮咆哮 - 20(西部荒原)
#displayname Savage Roar

step << Druid
    #season 2
    #sticky
    +|cRXP_WARN_注意: 你必须达到 20 级才能装备|r|T132942:0|t[|cRXP_FRIENDLY_狂暴图腾|r]|cRXP_WARN_这是学习|r|T236167:0|t[野蛮咆哮] 所必需的
    .xp 20,1
    .train 407988,1
step << Druid
    #season 2
    .goto Westfall,56.6,13.2,70,0
    .goto Westfall,52.8,15.4,70,0
    .goto Westfall,44.8,13.8,70,0
    .goto Westfall,41.6,20.6,70,0
    .goto Westfall,56.6,13.2
    >>击杀|cRXP_ENEMY_河爪豺狼人|r和|cRXP_ENEMY_河爪斥候|r和|cRXP_ENEMY_混血河爪豺狼人|r. 击败后拾取|T132942:0 |t[|cRXP_FRIENDLY_狂怒图腾|r]
    .collect 208689,1 -- Ferocious Idol (1)
    .mob Riverpaw Gnoll
    .mob Riverpaw Scout
    .mob Riverpaw Mongrel
    .train 407988,1
step << Druid
    #season 2
    .equip 18,208689 >>|cRXP_WARN_装备|r|T132942:0|t[|cRXP_FRIENDLY_狂怒图腾|r]
    .use 208689
    .itemcount 208689,1
    .train 407988,1
step << Druid
    #season 2
    .train 407988 >>|cRXP_WARN_对|r|T132152:0|t[撕裂]|cRXP_WARN_或|r|T132122:0|t[抓击]|cRXP_WARN_造成20次流血伤害给类人生物, 然后使用|r|T132942:0|t[|cRXP_FRIENDLY_凶猛图腾|r]|cRXP_WARN_再次学习|r|T236167:0|t[野蛮咆哮]
    .use 208689
    .itemcount 208689,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 太阳之焰 - 6(泰达希尔)
#displayname Sunfire

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
    .train 416044 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_太阳符文|r]|cRXP_WARN_来训练|r|T236216:0|t[太阳之火]
    .use 206989
    .itemcount 206989,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 撕裂 - 10(洛克莫丹)
#displayname Lacerate

step << Druid
    #season 2
    .goto Loch Modan,40.371,39.404,10,0
    .goto Loch Modan,39.467,39.207
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑物内的|r卡拉·深水|r交谈
    >>|cRXP_BUY_购买|r|T237270:0|t[彩鳍鱼诱饵]
    .collect 208855,1 -- Rainbow Fin Albacore Chum (1)
    .target Khara Deepwater
    .train 416049,1
step << Druid
    #season 2
    .goto Loch Modan,46.6,35.6
    .use 208855 >>|cRXP_WARN_对|cRXP_ENEMY_幼年蛇颈龙|r使用|r|T237270:0|t[彩鳍鱼诱饵]|cRXP_WARN_来获得|r|T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r]
    .collect 208687,1 -- Rune of Lacerate (1)
    .target Young Threshadon
    .train 416049,1
step << Druid
    #season 2
    .train 416049 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r]|cRXP_WARN_来学习|r|T132131:0|t[撕裂]
    .use 208687
    .itemcount 208687,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 风暴怒吼的愤怒 - 4(莫高雷)
#displayname Fury of Stormrage


    --Rune of Fury of Stormrage

step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .accept 77648 >>接任务: |cRXP_WARN_牛头人的圣物|r
    .trainer >>训练你的职业法术. 确保你学会 |T136096:0|t[月火术]
    .target Gart Mistrunner
step << Druid
    #season 2
    .goto Mulgore,60.33,75.10,30,0
    .goto Mulgore,61.62,76.04
    >>掠夺|cRXP_PICK_Bristleback 战利品缓存|r以获取 |T134903:0|t[|cRXP_FRIENDLY_Lunar Idol|r]
    .collect 208414,1,77648,1 --Lunar Idol (1)
    .train 410061,1
step << Druid
    #season 2
    .equip 18,208414 >>|cRXP_WARN_装备|r|T134903:0|t[|cRXP_FRIENDLY_月神雕像|r]
    .use 208414
    .train 410061,1
step << Druid
    #season 2
    .use 208414 >>|cRXP_WARN_在敌人受到|r|T136096:0|t[月火术]影响时击杀他们6次, 以获得|r|T237556:0|t[灵感]叠加
    >>|cRXP_WARN_击杀6次后获得|r |T136116:0|t[灵感] |cRXP_WARN_buff, 使用你刚刚装备的|r |T134903:0|t[|cRXP_FRIENDLY_月之圣物|r] |cRXP_WARN_again|r
    .complete 77648,1 -- Learn: Engrave Chest - Fury of Stormrage
    .train 410061,1
step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .turnin 77648 >>交任务: |cRXP_FRIENDLY_牛头人的圣物|r
    .target Gart Mistrunner

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 撕裂 - 10 (莫高雷)
#displayname Mangle


    --Rune of Mangle

step
    #season 2
    .goto Mulgore,43.78,10.96,90,0
    .goto Mulgore,39.62,13.35,90,0
    .goto Mulgore,37.12,16.84,90,0
    .goto Mulgore,44.57,17.39,90,0
    .goto Mulgore,48.70,20.85,90,0
    .goto Mulgore,43.78,10.96
    >>击杀|cRXP_ENEMY_平原徘徊者|r 和|cRXP_ENEMY_草原狼前锋|r . 击败它们后可获得 |T134903:0|t[|cRXP_FRIENDLY_熊之怒狂石|r ]
    .collect 206954,1 --Idol of Ursine Rage (1)
    .mob Flatland Prowler
    .mob Prairie Wolf Alpha
    .train 410025,1
step
    #season 2
    .equip 18,206954 >>|cRXP_WARN_装备|r|T134903:0|t[|cRXP_FRIENDLY_熊怒之偶像|r]
    .use 206954
    .train 410025,1
step
    #completewith next
    +|cRXP_WARN_保持50+怒气至少60秒方可学习|r|T132135:0|t[撕裂]
step
    #season 2
    .train 410025 >>|cRXP_WARN_使用|r|T134903:0|t[|cRXP_FRIENDLY_熊之怒图腾|r]|cRXP_WARN_来训练|r|T132135:0|t[撕裂]
    .use 206954
    .itemcount 206954,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 太阳之火 - 5(莫高雷)
#displayname Sunfire


    --Rune of Sunfire

step
    #season 2
    .goto Mulgore,35.72,69.57
    >>对三块|cRXP_ENEMY_Lunar Stones|r施放 |T136096:0|t[月火术]. 一颗宝箱将会出现在它们之间
    >>打开|cRXP_PICK_Lunar Chest|r获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Sun|r]
    .collect 206989,1 --Rune of the Sun (1)
    .mob Lunar Stone
    .train 416044,1
step
    #season 2
    .train 416044 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_太阳符文|r]|cRXP_WARN_来训练|r|T236216:0|t[太阳之火]
    .use 206989
    .itemcount 206989,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 生命绽放 - 10(莫高雷)
#displayname Lifebloom

    --Rune of Lifebloom

step
    #season 2
    .goto Mulgore,60.39,33.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冒险者之灵|r交谈(在通天峰矿井外)
    >>|cRXP_WARN_其他玩家需要点击传送门. 拾取|r|cRXP_FRIENDLY_冒险者之灵|r|cRXP_WARN_后获得|r|T134419:0|t[|cRXP_FRIENDLY_生命符文|r]
    .collect 206970,1 --Rune of Life (1)
    .target Adventurer's Spirit
    .skipgossip
    .train 410033,1
step << Druid
    #season 2
    .train 410033 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_生命符文|r]|cRXP_WARN_来训练|r|T134206:0|t[生命绽放]
    .use 206970
    .itemcount 206970,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 活种 - 8(莫高雷)
#displayname Living Seed

    --Rune of Living Seed

step
    #season 2
    .goto Mulgore,58.88,51.18,50,0
    .goto Mulgore,50.94,45.98,50,0
    .goto Mulgore,44.95,46.88,50,0
    .goto Mulgore,39.88,51.61,50,0
    .goto Mulgore,41.36,63.26
    >>战利品 |T133941:0|t|cRXP_LOOT_Prairie Flowers|r位于地面
    >>|cRXP_WARN_这些在莫高雷各地都能找到|r
    .collect 206469,3 -- Glade Flower (3)
    .train 416050,1
step
    #season 2
    .use >>|cRXP_WARN_使用|r|T133941:0|t|cRXP_LOOT_草原之花|r|cRXP_WARN_将其组合成一个|r|T132767:0|t[草原王冠]
    .collect 206466,1 -- Prairie Crown (1)
    .train 416050,1
step
    #season 2
    #completewith next
    .goto Mulgore,37.70,49.52
    .cast 414724 >>|cRXP_WARN_使用|r|T132767:0|t[林地王冠]|cRXP_WARN_施加在|cRXP_ENEMY_木制雕像|r上. 这将召唤出一个|r|cRXP_ENEMY_失控的自然之灵|r|r
    >>|cRXP_WARN_您可能需要等待几分钟让它刷新|r
    .use 206466
    .mob Wooden Effigy
    .train 416050,1
step
    #season 2
    .goto Mulgore,37.70,49.52
    >>击杀|cRXP_ENEMY_Unleashed Nature Spirit|r. 击败后可拾取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Natural Potential|r]
    >>|cRXP_WARN_这是7级精英|r
    .collect 206963,1 -- Rune of Natural Potential (1)
    .mob Unleashed Nature Spirit
    .train 416050,1
step
    #season 2
    .train 416050 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_自然潜能符文|r]|cRXP_WARN_来训练|r|T136152:0|t[生命种子]
    .use 206963
    .itemcount 206963,1


]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 撕裂 - 15(贫瘠之地)
#displayname Lacerate

    --Rune of Lacerate

step
    #season 2
    #completewith next
    .subzone 386 >>前往遗忘之池
step
    #season 2
    .goto The Barrens,44.73,22.18
    >>在地面上掠夺|cRXP_PICK_废弃的钳嘴龟巢穴|r, 以获得|T294479:0|t[|cRXP_LOOT_废弃的钳嘴龟蛋|r]
    .collect 208682,1 --Abandoned Snapjaw Egg (1)
    .train 416049,1
step
    #season 2
    #completewith next
    .subzone 387 >>前往茂密水泉绿洲
step
    #season 2
    .goto The Barrens,48.32,40.25
    >>打开地面上的|cRXP_PICK_空壳钳嘴龟巢穴|r, 获得 |T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r]
    .collect 208687,1 --Unbalanced Idol (1)
    .train 416049,1
step
    #season 2
    .train 416049 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r]|cRXP_WARN_来学习|r|T132131:0|t[撕裂]
    .use 208687 --Rune of Lacerate (1)
    .itemcount 208687,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狂野咆哮 - 15(贫瘠之地)
#displayname Savage Roar

    --Rune of Savage Roar

step
    #season 2
    #sticky
    +|cRXP_WARN_注意: 你必须达到 20 级才能装备|r|T132942:0|t[|cRXP_FRIENDLY_狂暴图腾|r]|cRXP_WARN_这是学习|r|T236167:0|t[野蛮咆哮] 所必需的
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
    >>击杀|cRXP_ENEMY_科卡尔牧民|r 和|cRXP_ENEMY_科卡尔召雷师|r. 击败他们后拾取 |T134237:0|t[|cRXP_LOOT_科卡尔宝箱钥匙|r ]
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
    >>打开一个|cRXP_PICK_Kolkar Booty|r宝箱, 获得 |T132942:0|t[|cRXP_FRIENDLY_Ferocious Idol|r]
    .collect 5020,1 --Kolkar Booty Key (1)
    .collect 208689,1 --Ferocious Idol (1)
    .train 407988,1
step
    #season 2
    .equip 18,208689 >>|cRXP_WARN_装备|r|T132942:0|t[|cRXP_FRIENDLY_狂怒图腾|r]
    .use 208689
    .itemcount 208689,1
    .train 407988,1
step
    #season 2
    .train 407988 >>|cRXP_WARN_对|r|T132152:0|t[撕裂]|cRXP_WARN_或|r|T132122:0|t[抓击]|cRXP_WARN_造成20次流血伤害给类人生物, 然后使用|r|T132942:0|t[|cRXP_FRIENDLY_凶猛图腾|r]|cRXP_WARN_再次学习|r|T236167:0|t[野蛮咆哮]
    .use 208689
    .itemcount 208689,1


]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 狂暴 - 28(千针石林)
#displayname Berserk

step
    #optional
    +|cRXP_WARN_你必须至少达到28级才能学习|r|T236149:0|t[狂暴]
    .xp >29,1
step
    #optional
    .train 424760,1
    .train 5209 >>|cRXP_WARN_你必须已|r|T132117:0|t[挑战咆哮]|cRXP_WARN_训练, 才能获得|r|T236149:0|t[狂暴]|cRXP_WARN_符文|r
step
    #completewith next
    .train 424760,1
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
step
    .train 424760,1
    .goto Thousand Needles,68.690,55.155
    .aura 435081 >>|cRXP_WARN_站在|cRXP_PICK_Beastly Effigy|r野兽祭坛雕像旁, 以获得|r|T134912:0|t[野兽祭坛]|cRXP_WARN_buff|r
step
    #completewith next
    .train 424760,1
    .goto Thousand Needles,68.690,55.155
    .cast 5209 >>|cRXP_WARN_进入|r|T132276:0|t[熊形态]|cRXP_WARN_并施放|r|T132117:0|t[挑战咆哮]|cRXP_WARN_以召唤|r|cRXP_ENEMY_Zai'enki|r|cRXP_WARN_(等级28精英)|r|r
step
    .train 424760,1
    .goto Thousand Needles,68.690,55.155
    >>击杀|cRXP_ENEMY_Zai'enki|r. 击败后可获得 |T134912:0|t[|cRXP_FRIENDLY_喧闹者的圣像|r]
    .collect 213594,1
    .mob Zai'enki
step
    .train 424760,1
    .equip 18,213594 >>装备 |T134912:0|t[|cRXP_FRIENDLY_嘲弄者的偶像|r]
    .use 213594
step
    #title Gain 5x |T237556:0|t[Building Inspiration]
    .itemcount 213594,1
    .train 424760,1
    .aura 408828 >>|cRXP_WARN_施放|r|T132117:0|t[挑战咆哮]|cRXP_WARN_嘲讽至少2名敌人, 并在他们带有|r|T132117:0|t[挑战咆哮]|cRXP_WARN_debuff时击杀其中一名. 这将为你叠加一层|r|T237556:0|t[建筑灵感]|cRXP_WARN_buff. 重复此过程5次, 直到获得|r|T136116:0|t[灵感]|cRXP_WARN_buff|r
    *|cRXP_WARN_It's recommened you fight one mob and almost kill it, then pull a 2nd and cast|r |T132117:0|t[Challenging Roar]|cRXP_WARN_, then kill the low health mob. You will lose all stacks of|r |T237556:0|t[Building Inspiration] |cRXP_WARN_if you die|r
step
    .itemcount 213594,1
    .use 213594
    .train 424760 >>|cRXP_WARN_使用|r|T134912:0|t[|cRXP_FRIENDLY_嘲讽者之偶像|r]|cRXP_WARN_来训练|r|T236149:0|t[狂暴]
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#name 梦之境 - 33(荒芜之地)
#displayname Dreamstate

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
    >>击杀|cRXP_ENEMY_Kolkars|r并从其身上搜刮 |T134187:0|t[干枯的种子荚]
    .collect 213574,1
    .mob Kolkar Centaur
    .mob Kolkar Mauler
    .mob Kolkar Scout
    .mob Kolkar Windchaser
step
    .train 410060,1
    >>在水中游泳, 直到荚果变成|T134208:0|t[萨特草鳞茎]
    .goto Desolace,70.8,71.8
    .collect 206966,1
step
    .goto Desolace,75.5,20.7
    .train 410060 >>点击|cRXP_PICK_Sandy Loam|r种下种子, 学习 |T136090:0|t[梦之境]
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 滋养 - 35(艾泽拉斯)
#displayname Nourish

-- Probably needs better waypoints to avoid some dangerous mobs or anything else that could kill you

step
    #completewith next
    .train 410059,1
    .goto Dustwallow Marsh,30.2,47.3,200,0
    .zone Dustwallow Marsh >>前往: |cRXP_PICK_尘泥沼泽|r
step
    .train 410059,1
    >>击杀|cRXP_ENEMY_Rotting Ancient|r. 击败后拾取 |T134217:0|t[腐烂种子]. |cRXP_WARN_在背包中点击该物品|r
    #loop
    .goto Dustwallow Marsh,43.6,41.0,40,0
    .goto Dustwallow Marsh,40.91,43.52,40,0
    .collect 212693,1
    .accept 79348 >>接任务: |cRXP_WARN_失落的古树|r
    .mob Rotting Ancient
step
    #completewith next
    .train 410059,1
    .zone Moonglade >>前往: |cRXP_PICK_月光林地|r
step
    #completewith next
    +|cRXP_WARN_你必须严格遵循接下来的每一条指令. 死亡和被传送到其他区域和被召唤和使用传送技能或获得“无荣誉目标”状态都会导致任务失败(你会失去该状态), 因此请勿在 contested areas(争夺区域)使用飞行点|r
step
    .train 410059,1
    .goto Moonglade,41.48,43.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥罗凯|r交谈
    *|cRXP_WARN_Accepting the next quest start a 1 hour timer. Make sure that you can commit the whole hour.|r
    .turnin 79348 >>交任务: |cRXP_FRIENDLY_失落的古树|r
    .accept 79377 >>接任务: |cRXP_WARN_失落的树苗|r
    .timer 3600,Water Duration
    .target Orokai
step << Alliance
    .train 410059,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛德拉尔|r交谈
    .goto Moonglade,48.11,67.37
    .fly Auberdine >>飞往奥伯丁
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
    >>对|cRXP_FRIENDLY_Ancient Sapling|r使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,3 --Fall Sapling
    .use 213036
    .goto Arathi Highlands,46.98,71.83
    .target Ancient Sapling
step << Alliance
    #completewith next
    .zone Alterac Mountains >>前往: |cRXP_PICK_奥特兰克山脉|r, |cRXP_WARN_不要使用飞行管理员|r
step << Alliance
    .train 410059,1
    >>对|cRXP_FRIENDLY_Ancient Sapling|r使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,4 --Winter Sapling
    .use 213036
    .goto Alterac Mountains,58.27,43.57
    .target Ancient Sapling
step << Alliance
    #completewith next
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step << Alliance
    .train 410059,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比比尔法兹|r交谈
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
    >>对|cRXP_FRIENDLY_Ancient Sapling|r使用 |T132852:0|t[艾露娜拉之水]
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
    >>对|cRXP_FRIENDLY_Ancient Sapling|r使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,1 --Summer Sapling
    .use 213036
    .goto Stranglethorn Vale,32.74,64.82
    .target Ancient Sapling
step << Horde
    .train 410059,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑟恩·草风|r交谈
    .goto Moonglade,44.29,45.86
    .skipgossip 11798,1
    .zone Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Bunthen Plainswind
step << Horde
    .train 410059,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .goto Thunder Bluff,47.00,49.82
    .fly Ratchet >>飞往棘齿城
    .target Tal
step << Horde
    .goto The Barrens,63.677,38.618
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r, 乘船前往藏宝海湾。|cRXP_WARN_船开始移动后登出。等待 40 秒，然后重新登录。|r
step << Horde
    .train 410059,1
    >>对|cRXP_FRIENDLY_Ancient Sapling|r使用 |T132852:0|t[艾露娜拉之水]
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
    >>对|cRXP_FRIENDLY_Ancient Sapling|r使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,2 --Spring Sapling
    .use 213036
    .goto Swamp of Sorrows,17.68,42.41,50,0
    .goto Swamp of Sorrows,10.98,38.40
    .target Ancient Sapling
step << Horde
    .goto Swamp of Sorrows,46.10,54.70
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布雷依克|r交谈
    .fly Undercity >>飞往幽暗城
	.target Breyk
step << Horde
    .goto Tirisfal Glades,61.6,62.2,50,0
    .goto Tirisfal Glades,54.7,73.0,50,0
    .goto Silverpine Forest,66.7,8.8,50,0
    .zone Alterac Mountains >>|cRXP_WARN_前往: |cRXP_PICK_奥特兰克山脉|r , 离开幽暗城并前往银松森林，游过湖泊到达奥特兰克山脉|r
step << Horde
    .train 410059,1
    >>对|cRXP_FRIENDLY_Ancient Sapling|r使用 |T132852:0|t[艾露娜拉之水]
    .complete 79377,4 --Winter Sapling
    .use 213036
    .goto Alterac Mountains,58.27,43.57
    .target Ancient Sapling
    step << Horde
    #completewith next
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step << Horde
    .train 410059,1
    >>对|cRXP_FRIENDLY_Ancient Sapling|r使用 |T132852:0|t[艾露娜拉之水]
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥罗凯|r交谈
    .turnin 79377 >>交任务: |cRXP_FRIENDLY_失落的树苗|r
    .target Orokai
step
    .itemcount 213594,1
    .use 213594
    .train 410059 >>使用 |T134419:0|t[|cRXP_FRIENDLY_滋养符文|r]学习 |T236162:0|t[滋养]
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#name 盛开 - 45 (艾泽拉斯)
#displayname 盛开 - 45 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    #optional
    .train 431468,1
    .train 2728 >>|cRXP_WARN_你必须已学会|r|T135952:0|t[解除诅咒]|cRXP_WARN_trained, 才能获得|r|T134222:0|t[盛开]|cRXP_WARN_rune|r
step
    #optional
    .train 431468,1
    .train 8946 >>|cRXP_WARN_你必须已掌握|r|T136067:0|t[解毒术]|cRXP_WARN_trained, 才能获得|r|T134222:0|t[盛开]|cRXP_WARN_符文|r
step
    #optional
    .train 431468,1
    .train 16914 >>|cRXP_WARN_你必须已|r|T136018:0|t[飓风] |cRXP_WARN_受训, 才能获得|r|T134222:0|t[盛开] |cRXP_WARN_符文|r
step
    #optional
    .train 431468,1
    .train 740 >>|cRXP_WARN_你必须已|r|T136107:0|t[宁静]|cRXP_WARN_受训, 才能获得|r|T134222:0|t[盛开]|cRXP_WARN_符文|r
step
    #optional
    .train 431468,1
    .train 768 >>|cRXP_WARN_你必须已掌握|r |T132115:0|t[猫形态] |cRXP_WARN_技能, 才能获得|r |T134222:0|t[盛开] |cRXP_WARN_符文|r
step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
    .train 431468,1
step
    .train 431468,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tyrisius|r|cRXP_WARN_塔内|r交谈
    .goto Feralas,57.2,69.0
    .accept 81924 >>接受守护者之智
    .target Tyrisius
step
    .train 431468,1
    .aura 446488 >>点击 |cRXP_PICK_Shrine of the Warden|r 获取 |T132145:0|t[守卫者的职责]效果
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
    >>攻击一个|cRXP_ENEMY_戈杜尼术士|r. |cRXP_WARN_等待他们对你使用|r |T136121:0|t[缩小]|cRXP_WARN_技能. |r 
    .cast 2728 >>|cRXP_WARN_使用|r|T135952:0|t[解除诅咒]|cRXP_WARN_来移除|r|T136121:0|t[缩小]|cRXP_WARN_减益效果|r
    .mob Gordunni Warlock
step
    .train 431468,1
    .goto Feralas,73.8,61.6
    >>攻击一只|cRXP_ENEMY_Zukk'ash Wasp|r. |cRXP_WARN_请等待它们对你使用|r|T136016:0|t[毒药]|cRXP_WARN_. |r
    .cast 526 >>|cRXP_WARN_使用|r|T135952:0|t[解毒]|cRXP_WARN_来移除|r|T136016:0|t[中毒]|cRXP_WARN_减益效果|r
    .mob Zukk'ash Wasp
step
    #requires MarkoftheWarden
    .train 431468,1
    >>|cRXP_WARN_点击/跑到|r|cRXP_PICK_守望者神龛|r|cRXP_WARN_以召唤|r|cRXP_ENEMY_树人化身|r|r
    >>击杀|cRXP_ENEMY_Treant Avatar|r
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
    .gossip 441947,0 >>点击|cRXP_PICK_野兽的神殿|r
    *|cRXP_WARN_Skip this step manually if it doesn't complete|r
step
    .train 431468,1
    >>击杀|cRXP_ENEMY_阿帕罗之子|r|cRXP_WARN_具备近战能力(建议进入猫形态或熊形态)|r. 击败后可拾取 |T134338:0|t[|cRXP_LOOT_圣鹿之心|r]
    .collect 221326,1
    .mob Child of Apa'ro
step
    #completewith next
    .itemcount 221362,1
    .use 221326
    .goto Azshara,34.6,49.0
    .cast 446509 >>|cRXP_WARN_使用|r|T134338:0|t[|cRXP_LOOT_神圣鹿心|r]|cRXP_WARN_在|r|cRXP_PICK_野兽神龛|r|cRXP_WARN_旁召唤|r|cRXP_ENEMY_鹰头兽化身|r
    .train 431468,1
step
    .train 431468,1
    >>击杀 |cRXP_ENEMY_Hippogryph Avatar|r
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
    .gossip 441946,0 >>点击山顶的|cRXP_PICK_月亮神殿|r
    *|cRXP_WARN_Skip this step manually if it doesn't complete|r
step
    .train 431468,1
    .cast 740 >>|cRXP_WARN_Use|r|T136107:0|t[宁静]
step
    .train 431468,1
    .cast 16914 >>|cRXP_WARN_Use|r|T136018:0|t[飓风]
step
    .train 431468,1
    >>击杀|cRXP_WARN_Moonkin Avatar|r
    .goto The Hinterlands,66.2,53.1
    .complete 81924,2 --Guardian of the Hinterlands
    .mob Moonkin Avatar
step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
    .train 431468,1
step
    .train 431468,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tyrisius|r|cRXP_WARN_塔内|r交谈
    .goto Feralas,57.2,69.0
    .turnin 81924 >>交出守护者之智
    .target Tyrisius
step
    .itemcount 220360,1
    .use 220360
    .train 431468 >>使用 |T134419:0|t[|cRXP_FRIENDLY_盛开符文|r] 来学习 |T134222:0|t[盛开]
    
]])


-- RXPGuides.RegisterGuide([[
-- #classic
-- << Druid SoD
-- #group RestedXP 符文与书籍指南
-- #subgroup Bracers
-- #name 强化狂怒再生
-- for phase 3


-- ]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup 头盔
#name 狂风 - 40(费拉斯)
#displayname 狂风 - 40(费拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    #completewith NamidaGrimtotem
    .train 431451,1
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
    #label NamidaGrimtotem
    .train 431451,1
    >>击杀|cRXP_ENEMY_Namida Grimtotem|r. 击败她后可获得 |T134419:0|t[|cRXP_FRIENDLY_风storm符文|r]
    .goto Feralas,66.8,38.6
    .collect 220754,1 
    .mob Namida Grimtotem
step
    .itemcount 220754,1
    .use 220754
    .train 431451 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_风暴符文|r]|cRXP_WARN_来训练|r|T236154:0|t[狂风之息]

]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#name 艾露恩之火 - 45(艾萨拉)
#displayname 艾露恩之火 - 45(艾萨拉) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    #completewith next
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
    .train 416051,1
step
    --PERMOK: Check coordiantes
    .train 416051,1
    >>点击|cRXP_PICK_旅行者的背包|r以拾取 |T236229:0|t[|cRXP_LOOT_野战医药包|r] 和 |T133741:0|t[|cRXP_LOOT_凯拉的日志|r]
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
    >>拾取 3 |T134218:0|t[|cRXP_PICK_萨特草样本|r]
    .collect 221019,3
step
    >>|cRXP_WARN_使用|r|T236229:0|t[|cRXP_LOOT_野战医药包|r]|cRXP_WARN_将样本合成|r|T236868:0|t[萨特草酊剂]
    .collect 221199,1
step
    .train 416051,1
    #loop
    .goto Azshara,16.0,49.6,30,0
    .goto Azshara,18.6,66.6,30,0
    .goto Azshara,21.0,56.2,30,0
    >>寻找带有 |T136134:0|t[萨特腐化] 减益效果的|cRXP_ENEMY_Thunderhead Hyppogryph|r
    *|cRXP_WARN_If it has the debuff then it emits a green poison cloud|r.
    .cast 2637 >>对|cRXP_ENEMY_Thunderhead Hyppogryph|r使用 |T136090:0|t[冬眠]
    .mob Thunderhead Hyppogryph
step
    .train 416051,1
    >>|cRXP_WARN_对|cRXP_ENEMY_雷霆巨鹰海波格里夫|r使用|r|T236868:0|t[萨蒂尔草酊剂]|cRXP_WARN_来移除|r|T136134:0|t[萨蒂尔腐化]|cRXP_WARN_减益效果|r, 并获得 |T134419:0|t[|cRXP_FRIENDLY_月神符文|r] 
    .itemcount 221199,1
    .use 221199
    .collect 221020,1
    .mob Thunderhead Hyppogryph
step
    .itemcount 221020,1
    .use 221020
    .train 416051 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_风暴符文|r]|cRXP_WARN_来训练|r|T236163:0|t[艾露恩之火]
]]) 

-- RXPGuides.RegisterGuide([[
-- #classic
-- << Druid SoD
-- #group RestedXP 符文与书籍指南
-- #subgroup 头盔
-- #name Gore
-- for phase 3


-- ]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup 头盔
#name 强化树皮术 - 44(塔纳利斯)
#displayname 强化树皮术 - 44(塔纳利斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    #optional
    .train 431449,1
    .train 22812 >>|cRXP_WARN_你必须已学会|r|T136097:0|t[树皮护甲]|cRXP_WARN_, 才能获得|r|T136097:0|t[强化树皮护甲]|cRXP_WARN_符文|r
step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
    .train 431449,1
step
    #loop
    .goto Tanaris,28.2,63.0,40,0
    .goto Tanaris,28.2,68.6,40,0
    .goto Tanaris,30.8,63.4,40,0
    >>击杀|cRXP_ENEMY_灌木露水收集者|r和|cRXP_ENEMY_灌木塑根者|r. 击败它们后拾取掉落的 |T136061:0|t[|cRXP_LOOT_狂暴蹒跚者之偶像|r]
    .collect 220915,1
    .mob Thistleshrub Dew Collector
    .mob Thistleshrub Rootshaper
    .train 431449,1
step
    .equip 18,220915 >>|cRXP_WARN_装备|r |T136061:0|t[|cRXP_FRIENDLY_狂暴蹒跚者的图腾|r]
    .train 431449,1
step
    .aura 408828 >>在受到【树皮护甲】效果影响下, 使用自然系法术(例如愤怒)击杀五名敌人 
    *|cRXP_WARN_Use |T136097:0|t[Barkskin] when the enemy is at low HP and finish him with a Wrath or another Nature spell|r
    .train 431449,1
step
    .itemcount 221020,1
    .use 221020
    .train 431449 >>|cRXP_WARN_使用|r|T136061:0|t[|cRXP_FRIENDLY_ 暴怒蹒跚者图腾|r]|cRXP_WARN_进行训练|r|T136097:0|t[增强树皮术]
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#name 强化横扫 - 50 (安戈洛环形山)
#displayname  Improved Swipe

step
    #completewith next
    .train 439765,1
    .zone Un'Goro Crater >>前往: |cRXP_PICK_安戈洛环形山|r
step
    .train 439765,1
    .goto Un'Goro Crater,68.0,51.4
    >>击杀|cRXP_ENEMY_Ravasaurs|r和|cRXP_ENEMY_狩猎暴掠龙|r和|cRXP_ENEMY_毒皮暴掠龙|r. 击败它们后可获得 |T134912:0|t[|cRXP_FRIENDLY_猎手之偶像|r]
    .collect 227444,1
    .mob Venomhide Ravasaur
    .mob Ravasaur Hunter
    .mob Ravasaur
step
    .train 439765,1
    .equip 18,227444 >>装备 |T134912:0|t[|cRXP_FRIENDLY_猎手之偶像|r]
    .use 227444
step
    .goto Un'Goro Crater,68.0,51.4
    #title Gain 5x |T237556:0|t[Building Inspiration]
    .itemcount 227444,1
    .train 439765,1
    .aura 408828 >>|cRXP_WARN_攻击暴掠龙, 直到其生命值降至约5-10%, 并确保对其积攒了5个连击点|r
    >>|cRXP_WARN_当它们的生命值降至 5-10% 时, 施放|r|T136090:0|t[休眠]|cRXP_WARN_然后切换至|r|T132115:0|t[猫形态]|cRXP_WARN_并施放|r|T132127:0|t[凶猛撕咬]|cRXP_WARN_击杀它们以获得一层|r|T237556:0|t[建筑灵感]
    >>|cRXP_WARN_重复此过程5次|r
    .mob Venomhide Ravasaur
    .mob Ravasaur Hunter
    .mob Ravasaur   
step
    .itemcount 227444,1
    .use 227444
    .train 439765 >>|cRXP_WARN_使用|r|T134912:0|t[|cRXP_FRIENDLY_女猎手的图腾|r]|cRXP_WARN_来学习|r|T134296:0|t[强化爪击]
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#name 生命之树 - 50 (费伍德)
#displayname Tree of Life

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
    >>|cRXP_WARN_与北方费伍德森林中的|r |cRXP_FRIENDLY_Vengeful Wisp|r |cRXP_WARN_怨灵游魂交谈, 然后跟随它穿过碧玉火河, 并击杀沿途遇到的任何|r |cRXP_ENEMY_Satyrs|r |cRXP_ENEMY_萨堤尔|r
    >>|cRXP_WARN_|cRXP_FRIENDLY_Vengeful Wisp|r有多个刷新位置. 如果您看到其他德鲁伊已经拥有|cRXP_FRIENDLY_Vengeful Wisp|r, 您可以协助他们并依然获得任务奖励|r
    >>完成后, |cRXP_FRIENDLY_复仇精灵|r会将|cRXP_PICK_精灵之礼|r掉落在地上. 拾取它可获得 |T134419:0|t[|cRXP_FRIENDLY_世界之树符文|r]
    .collect 227746,1
    .unitscan Vengeful Wisp  
step
    .itemcount 227746,1
    .use 227746
    .train 439767 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_世界之树符文|r]|cRXP_WARN_来训练|r|T132145:0|t[生命之树]
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#name 星陨 - 60(冬泉谷)
#displayname Starfall

step
    #completewith next
    .train 439770,1
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
    >>|cRXP_WARN_请注意, 要获得此符文, 您必须击杀一只58级精英怪. 建议邀请朋友协助您完成|r
step
    .train 439770,1
    #loop
    .goto Winterspring,64.8,19.4,50,0
    .goto Winterspring,63.8,16.4
    >>击杀|cRXP_ENEMY_Arcterris|r. 击败后搜刮掉落物品:|T134419:0|t[|cRXP_FRIENDLY_坠星石|r]
    >>|cRXP_WARN_注意|cRXP_ENEMY_Arcterris|r是一名58级精英怪. 建议邀请朋友协助你|r
    .collect 227749,1
    .mob Arcterris
step
    .itemcount 227749,1
    .use 227749
    .train 439770 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_坠星石|r] |cRXP_WARN_进行训练|r|T236168:0|t[星落]
]])