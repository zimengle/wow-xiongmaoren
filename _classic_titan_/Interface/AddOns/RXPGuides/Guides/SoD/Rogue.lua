RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 暗影打击 - 3（艾尔文森林）
#title Shadowstrike

step << Rogue
    #season 2
    .goto Elwynn Forest,52.544,51.922
    >>|cRXP_WARN_打开地面上的 |cRXP_PICK_Defias 储物箱|r。拾取其中的|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    .collect 204795,1 -- Rune of Shadowstrike (1)
    .train 400105,1
step << Rogue
    #season 2
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T132291:0|t[暗影打击]
    .use 204795
    .itemcount 204795,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 暗影打击-3（丹莫洛）
#title Shadowstrike

step
    #optional
    #label FrostMCave1
    #completewith Rune
    .goto 1426,27.098,80.707,20 >>进入霜鬃洞穴
step
    #optional
    #requires FrostMCave1
    #completewith Rune
    .goto 1426,28.298,79.836,15,0
    .goto 1426,29.252,79.043,15,0
    .goto 1426,30.489,80.165,50 >>前往里面的 |cRXP_PICK_Frostmane Loot Cache|r
step
    .goto Dun Morogh,30.773,80.063
    >>打开里面地面上的 |cRXP_PICK_Frostmane Loot Cache|r。从中获取 |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    .collect 204795,1 --Rune of Shadowstrike (1)
    .train 400105,1
step
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 暗影打击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 暗影打击 - 3（暗影谷）
#title Shadowstrike

step << Rogue
    #season 2
    .goto Teldrassil,57.922,40.687,25,0
    .goto Teldrassil,58.709,38.782,10,0
    .goto Teldrassil,59.15,40.66,20,0
    .goto Teldrassil,59.674,42.613
    >>|cRXP_WARN_沿着阿尔达希尔树上的斜坡向上走，然后跳到屋顶上|r
    >>|cRXP_WARN_|cRXP_PICK_Idol|r 位于屋顶上|r
    >>打开|cRXP_PICK_Idol|r。拾取它以获得|T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    >>|cRXP_WARN_如果你很难跳上屋顶，可以尝试沿着斜坡跑下来，跳过栏杆|r
    .collect 204795,1 -- Rune of Shadowstrike (1)
    .train 400105,1
step << Rogue
    #season 2
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 暗影打击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 快速抽奖 - 8（艾尔文森林）
#title Quick Draw

step << Rogue
    #season 2
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_Riverpaw Outrunners|r 和 |cRXP_ENEMY_Riverpaw Runts|r。从他们身上搜刮 |T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 203787,1 -- Bottom-Left Map Piece (1)
    .mob Riverpaw Outrunner
    .mob Riverpaw Runt
    .train 398196,1
step << Rogue
    #season 2
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_Kobold Miners|r 和 |cRXP_ENEMY_Kobold Tunnelers|r。掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_Top-Right Map Piece]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 203784,1 -- Top-Right Map Piece (1)
    .mob Kobold Miner
    .mob Kobold Tunneler
    .train 398196,1
step << Rogue
    #season 2
    .goto Elwynn Forest,67.4,78.6,60,0
    .goto Elwynn Forest,70.8,79.8,60,0
    .goto Elwynn Forest,89.2,78.8
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_Defias|r。掠夺它们以获得 |T134327:0|t[|cRXP_LOOT_左上角的地图碎片]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    >>|cRXP_WARN_注意：这也可以来自艾尔文森林的任何其他|cRXP_ENEMY_Defias|r成员|r
    .collect 203785,1 -- Top-Left Map Piece (1)
    .mob Defias Bandit
    .train 398196,1
step << Rogue
    #season 2
    .goto Elwynn Forest,75.4,85.4,60,0
    .goto Elwynn Forest,77.8,82.2,60,0
    .goto Elwynn Forest,83.2,87.0,60,0
    .goto Elwynn Forest,75.4,82.4
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_Murloc Foragers|r 和 |cRXP_ENEMY_Murloc Lurkers|r。掠夺他们以获得 |T134269:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    >>|cRXP_WARN_注意：这也可以来自艾尔文森林中的任何其他|cRXP_ENEMY_Murloc|r|r
    .collect 203786,1 -- Bottom-Right Map Piece (1)
    .mob Murloc Forager
    .mob Murloc Lurker
    .mob Murloc Streamrunner
    .mob Murloc
    .train 398196,1
step << Rogue
    #season 2
    .cast 401847 >>|cRXP_WARN_使用任意|r |T134327:0|t[|cRXP_LOOT_地图碎片]|r |cRXP_WARN_将它们组合成|r |T134269:0|t[|cRXP_LOOT_艾尔文藏宝图|r]
    .collect 203750,1
    .itemcount 203787,1
    .itemcount 203784,1
    .itemcount 203785,1
    .itemcount 203786,1
    .use 203787
    .use 203784
    .use 203785
    .use 203786
    .train 398196,1
step << Rogue
    #season 2
    #completewith next
    .goto Elwynn Forest,80.365,79.134
    .cast 401617 >>|cRXP_WARN_使用|r |T134269:0|t[|cRXP_LOOT_Elwynn Treasure Map|r] |cRXP_WARN_at箭头位置。这将导致|cRXP_PICK_Buried Treasure|r弹出。|r
    .use 203750
    .itemcount 203750,1
    .train 398196,1
step << Rogue
    #season 2
    >>打开 |cRXP_PICK_Buried Treasure|r。获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Quick Draw|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
step << Rogue
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_快速绘制符文|r] |cRXP_WARN_进行训练|r |T134536:0|t[快速绘制]
    .use 203991
    .itemcount 203991,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 快速拔枪 - 8（丹莫洛）
#title Quick Draw

step << Rogue
    #season 2
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_黑铁间谍|r. 掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_左下角的地图碎片]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 208219,1 -- Bottom-Left Map Piece (1)
    .mob Dark Iron Spy
    .train 398196,1
step << Rogue
    #season 2
    .goto Dun Morogh,25.4,50.8
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_Frostmane Trolls|r. 掠夺它们以获得 |T134327:0|t[|cRXP_LOOT_右上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 208213,1 -- Top-Right Map Piece (1)
    .mob Frostmane Headhunter
    .mob Frostmane Hideskinner
    .mob Frostmane Shadowcaster
    .train 398196,1
step << Rogue
    #season 2
    .goto Dun Morogh,70.8,56.0
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_Rockjaw Skullthumpers|r 和 |cRXP_ENEMY_岩颚骨撕咬者s|r。从他们身上搜刮 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 208215,1 -- Top-Left Map Piece (1)
    .mob Rockjaw Skullthumper
    .mob 岩颚骨撕咬者
    .train 398196,1
step << Rogue
    #season 2
    .goto Dun Morogh,26.0,41.8
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_麻风侏儒|r. 掠夺他们以获得 |T134269:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 208218,1 -- Bottom-Right Map Piece (1)
    .mob Leper Gnome
    .train 398196,1
step << Rogue
    #season 2
    .cast 418600 >>|cRXP_WARN_使用任意|r |T134327:0|t[|cRXP_LOOT_地图碎片]|r |cRXP_WARN_将它们组合成|r |T134269:0|t[|cRXP_LOOT_丹莫洛藏宝图|r]
    .collect 208220,1
    .itemcount 208219,1
    .itemcount 208213,1
    .itemcount 208215,1
    .itemcount 208218,1
    .use 208219
    .use 208213
    .use 208215
    .use 208218
    .train 398196,1
step << Rogue
    #season 2
    #completewith next
    .goto Dun Morogh,46.985,43.632
    .cast 418599 >>|cRXP_WARN_使用|r |T134269:0|t[|cRXP_LOOT_丹莫洛藏宝图|r] |cRXP_WARN_小桥下。这将导致|cRXP_PICK_埋藏的宝藏|r弹出|r
    .use 208220
    .itemcount 208220,1
    .train 398196,1
step << Rogue
    #season 2
    >>打开 |cRXP_PICK_Buried Treasure|r。获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Quick Draw|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
step << Rogue
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_快速绘制符文|r] |cRXP_WARN_进行训练|r |T134536:0|t[快速绘制]
    .use 203991
    .itemcount 203991,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 快速绘制 - 8（泰达希尔）
#title Quick Draw

step << Rogue
    #season 2
    #completewith next
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >>前往魔岩
    .train 398196,1
step << Rogue
    #season 2
    .goto Teldrassil,77.86,61.66
    >>杀死 |cRXP_ENEMY_Vicious Grell|r、|cRXP_ENEMY_Rascal Sprites|r 和 |cRXP_ENEMY_Shadow Sprites|r。从他们身上夺取 |T134327:0|t[|cRXP_LOOT_Bottom-Left Map Piece]|r
    .collect 208604,1 -- Bottom-Left Map Piece (1)
    .mob Vicious Grell
    .mob Rascal Sprite
    .mob Shadow Sprite
    .train 398196,1
step << Rogue
    #season 2
    .goto Teldrassil,61.2,67.0
    >>杀死 |cRXP_ENEMY_Timberlings|r。掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_Top-Right Map Piece]|r
    .collect 208601,1 -- Top-Right Map Piece (1)
    .mob Timberling
    .mob Timberling Bark Ripper
    .mob Timberling Trampler
    .train 398196,1
step << Rogue
    #season 2
    .goto Teldrassil,46.8,54.6,60,0
    .goto Teldrassil,44.2,59.2
    >>杀死或 |T133644:0|t[偷窃] |cRXP_ENEMY_Gnarlpine Furbolgs|r。掠夺它们以获得 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 208602,1 -- Top-Left Map Piece (1)
    .mob Gnarlpine Ambusher
    .mob Gnarlpine Shaman
    .mob Gnarlpine Defender
    .mob Gnarlpine Augur
    .train 398196,1
step << Rogue
    #season 2
    .goto Teldrassil,37.8,43.0,60,0
    .goto Teldrassil,36.0,34.4,60,0
    .goto Teldrassil,34.6,28.8,60,0
    .goto Teldrassil,37.8,43.0
    >>杀死或 |T133644:0|t[偷窃] |cRXP_ENEMY_Bloodfeather Harpies|r。掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
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
    .cast 418600 >>|cRXP_WARN_使用任意|r |T134327:0|t[|cRXP_LOOT_地图碎片]|r |cRXP_WARN_将它们组合成|r |T134269:0|t[|cRXP_LOOT_泰达希尔藏宝图|r]
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
step << Rogue
    #season 2
    #completewith next
    .goto Darnassus,29.466,41.405
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
    .train 398196,1
step << Rogue
    #season 2
    #completewith next
    .goto Teldrassil,55.339,90.818
    .cast 421424 >>|cRXP_WARN_使用|r |T134269:0|t[|cRXP_LOOT_泰达希尔藏宝图|r] |cRXP_WARN_位于鲁瑟兰村树干内。这将导致|cRXP_PICK_埋藏的宝藏|r弹出|r
    .use 208605
    .itemcount 208605,1
    .train 398196,1
step << Rogue
    #season 2
    >>打开 |cRXP_PICK_Buried Treasure|r。获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Quick Draw|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
step << Rogue
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_快速绘制符文|r] |cRXP_WARN_进行训练|r |T134536:0|t[快速绘制]
    .use 203991
    .itemcount 203991,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 暗影屠戮 - 1（艾尔文森林）
#title Slaughter from the Shadows

step << Rogue
    #season 2
    .goto Elwynn Forest,46.122,62.937,5,0
    .goto Elwynn Forest,46.175,62.124
    >>|cRXP_WARN_利用屋外的板条箱，跳上屋顶，跑到烟囱后面|r
    >>打开 |cRXP_PICK_Rusty Lockbox|r。从中获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Slaughter|r]
    .collect 203993,1 -- Rune of Slaughter (1)
    .train 424992,1
step << Rogue
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r] |cRXP_WARN_训练|r |T236280:0|t[暗影屠杀]
    .use 203993
    .itemcount 203993,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 暗影屠戮-1（丹莫洛）
#title Slaughter from the Shadows

step << Rogue
    #season 2
    .goto Dun Morogh,47.658,51.706,5,0
    .goto Dun Morogh,47.160,52.335,5,0
    .goto Dun Morogh,46.917,51.995
    >>|cRXP_WARN_爬上卡拉诺斯旅馆的屋顶，然后跳到巨大的酒桶上。跟着箭头走|r
    >>打开 |cRXP_PICK_Rusty Lockbox|r。从中获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Slaughter|r]
    .collect 203993,1 -- Rune of Slaughter (1)
    .train 424992,1
step << Rogue
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r] |cRXP_WARN_训练|r |T236280:0|t[暗影屠杀]
    .use 203993
    .itemcount 203993,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 眉间之眼-8（暴风城）
#title Between the Eyes

step << Rogue
    #season 2
    #completewith next
    .goto Stormwind City,56.93,29.54,8,0
    .goto Stormwind City,58.65,27.56,10 >>进入暴风城矮人区的割喉小巷
    .train 400081,1
step << Rogue
    #season 2
    .goto Stormwind City,63.201,29.491,5,0
    .goto Stormwind City,61.728,29.190
    >>|cRXP_WARN_上楼进屋|r
    >>打开 |cRXP_PICK_Dusty Chest|r。获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Precision|r]
    >>|cRXP_WARN_这样做会生成两个 10 级 |cRXP_ENEMY_Cut-throat Muggers|r 来攻击你|r
    .collect 204174,1 -- Rune of Precision (1)
    .mob Cut-throat Mugger
    .train 400081,1
step << Rogue
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_进行训练|r |T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 眉间之隔 - 8（铁炉堡）
#title Between the Eyes

step << Rogue
    #season 2
    .goto Ironforge,51.913,13.383
    >>打开 |cRXP_PICK_Dusty Chest|r。获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Precision|r]
    >>|cRXP_WARN_这样做会生成两个 10 级 |cRXP_ENEMY_Cut-throat Muggers|r 来攻击你|r
    .collect 204174,1 -- Rune of Precision (1)
    .mob Cut-throat Mugger
    .train 400081,1
step << Rogue
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_进行训练|r |T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 双眼之间 - 8（泰达希尔）
#title Between the Eyes

step << Rogue
    #season 2
    .goto Teldrassil,38.92,79.93
    >>杀死或 |T133644:0|t[Pick Pocket] |cRXP_ENEMY_Gnarlpine Pathfinders|r 和 |cRXP_ENEMY_Gnarlpine Avengers|r。抢劫他们以获得 |T134241:0|t[|cRXP_LOOT_Gnarlpine Stash Key]|r
    .collect 208749,1 -- Gnarlpine Stash Key (1)
    .mob Gnarlpine Pathfinder
    .mob Gnarlpine Avenger
    .train 400081,1
step << Rogue
    #season 2
    .goto Teldrassil,37.836,82.588
    >>打开 |cRXP_PICK_Gnarlpine Stash|r。从中获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Precision|r]
    .collect 204174 -- Rune of Precision (1)
    .itemcount 208749,1
    .train 400081,1
step << Rogue
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_进行训练|r |T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 剑舞 - 10（西部荒野）
#title Blade Dance

step << Rogue
    #season 2
    .goto Westfall,48.27,46.91,60,0
    .goto Westfall,46.39,37.38,60,0
    .goto Westfall,48.27,46.91
    >>|T133644:0|t[偷窃] 西部荒野各处的 |cRXP_ENEMY_Defias|r。从他们身上搜刮来 |T133463:0|t[|cRXP_LOOT_保密信封]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 209031,1 -- Discreet Envelope (1)
    .mob Defias Trapper
    .mob Defias Smuggler
    .mob Defias Looter
    .train 400099,1
step << Rogue
    #season 2
    >>打开 |cRXP_PICK_Discreet 信封|r。从中获取 |T134237:0|t[|cRXP_LOOT_Equipment Stash Key]|r
    .collect 209030,1 -- Equipment Stash Key (1)
    .use 209031
    .itemcount 209031,1
    .train 400099,1
step << Rogue
    #season 2
    #map Westfall
    .goto 1415,40.805,80.235
    >>前往死亡矿井的后门
    >>打开 |cRXP_PICK_Equipment Stash|r。拾取其中的 |T134419:0|t[|cRXP_FRIENDLY_Rune of Blade Dance|r]
    .collect 208771,1 -- Rune of Blade Dance (1)
    .train 400099,1
step << Rogue
    #season 2
    .train 400099 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_剑舞符文|r] |cRXP_WARN_进行训练|r |T132350:0|t[剑舞]
    .use 208771
    .itemcount 208771,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 刃舞-16（丹莫洛）
#title Blade Dance

step << Rogue
    #season 2
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[扒窃] |cRXP_ENEMY_黑铁间谍|r. 抢劫他们以获得 |T133875:0|t[|cRXP_LOOT_黑铁锁箱]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 208838,1 -- Dark Iron Lockbox (1)
    .mob Dark Iron Spy
    .train 400099,1
step << Rogue
    #season 2
    >>打开 |T133875:0|t[|cRXP_LOOT_黑铁锁箱]|r。拾取其中的 |T134419:0|t[|cRXP_FRIENDLY_刃舞符文|r]
    >>|cRXP_WARN_注意：你必须拥有|r |T136058:0|t[Lockpicking] |cRXP_WARN_from你的训练师才能打开它|r
    .collect 208771,1 -- Rune of Blade Dance (1)
    .itemcount 208838,1
    .train 400099,1
step << Rogue
    #season 2
    .train 400099 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_剑舞符文|r] |cRXP_WARN_进行训练|r |T132350:0|t[剑舞]
    .use 208771
    .itemcount 208771,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 剑舞-16（黑海岸）
#title Blade Dance

step << Rogue
    #season 2
    #completewith learnBD
    .goto Darkshore,55.106,33.621,30 >>进入 Cliffspring Naga 洞穴
    .train 400099,1
step << Rogue
    #season 2
    .goto Darkshore,56.253,34.877
    >>杀死 |cRXP_ENEMY_Stormscale Sirens|r 和 |cRXP_ENEMY_Stormscale Wave Rider|r。掠夺他们以获得 |T134242:0|t[|cRXP_LOOT_Cliffspring Key]|r
    .collect 211471,1 -- Cliffspring Key (1)
    .mob Stormscale Wave Rider
    .mob Stormscale Siren
    .train 400099,1
step << Rogue
    .goto Darkshore,56.253,34.877
    >>打开洞穴内的 |cRXP_PICK_Clliffspring Chest|r。获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Blade Dance|r]
    .collect 208771,1 -- Rune of Blade Dance (1)
    .itemcount 211471,1
    .train 400099,1
step << Rogue
    #season 2
    .train 400099 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_剑舞符文|r] |cRXP_WARN_进行训练|r |T132350:0|t[剑舞]
    .use 208771
    .itemcount 208771,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 毁伤 - 5（艾尔文森林）
#title Mutilate

step << Rogue
    #season 2
    .goto Elwynn Forest,57.5,48.2
    >>|T133644:0|t[扒窃] |cRXP_ENEMY_Garrick Padfoot|r 换 |T134331:0|t[Cutty 的笔记]
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 203723,1 -- Cutty's Note (1)
    .mob Garrick Padfoot
    .train 400094,1
step << Rogue
    #season 2
    .goto Elwynn Forest,49.983,52.012
    >>Talk to |cRXP_FRIENDLY_Cutty|r just south of the Northshire Valley wall
    >>他会给你|T134419:0|t[|cRXP_FRIENDLY_Rune of Mutilation|r]
    .collect 203990,1 -- Rune of Mutilation (1)
    .skipgossip
    .target Cutty
    .train 400094,1
step << Rogue
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_残害符文|r]
    .use 203990 -- Rune of Mutilation (1)
    .target Cutty
    .train 400094,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 毁伤—8（丹莫洛）
#title Mutilate

step << Rogue
    #season 2
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_黑铁间谍|r. 掠夺他们以获得 |T134331:0|t[黑鼠的笔记]
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 208205,1 --Blackrat's Note (1)
    .mob Dark Iron Spy
    .train 400094,1
step << Rogue
    #season 2
    .goto Dun Morogh,57.256,45.227
    >>Talk to |cRXP_FRIENDLY_Blackrat|r to receive the |T134419:0|t[|cRXP_FRIENDLY_Rune of Mutilation|r]
    .collect 203990,1
    .skipgossip
    .train 400094,1
step << Rogue
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_残害符文|r]
    .use 203990 -- Rune of Mutilation (1)
    .train 400094,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 剑刃斩 - 12（西部荒野）
#title Saber Slash

step << Rogue
    #season 2
    .goto Westfall,51.540,55.361,30,0
    .goto Westfall,51.093,54.642,30,0
    .goto Westfall,50.81,47.15,50,0
    .goto Westfall,51.093,54.642
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_Defias Scout|r 以获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Saber Slash|r]
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 208772,1 -- Rune of Saber Slash (1)
    .mob Defias Scout
    .train 424785,1
step << Rogue
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .train 424785,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 光剑斩击-12（洛克莫丹）
#title Saber Slash

step << Rogue
    #season 2
    #completewith next
    .goto Loch Modan,41.01,12.60,50,0
    .goto Loch Modan,42.86,10.36,60,0
    .goto Loch Modan,46.20,13.15,10 >>|cRXP_WARN_登上洛克莫丹大坝的墙壁，小心地跳到大坝中心的壁架上。按照箭头指示|r
    .train 424785,1
step << Rogue
    #season 2
    .goto Loch Modan,46.373,12.666
    >>打开壁架上的 |cRXP_PICK_石匠工具箱|r。从中获取 |T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    .collect 208772,1 -- Rune of Saber Slash (1)
    .train 424785,1
step << Rogue
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .train 424785,1
step << Rogue
    #season 2
    .goto Loch Modan,45.823,12.652
    .cast 6477 >>点击 |cRXP_PICK_Escape Rope|r 返回顶部
    .subzoneskip 146,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 军刀猛击-1（黑海岸）
#title Saber Slash

step << Rogue
    #season 2
    #completewith next
    .goto Darkshore,32.80,37.72,20 >>游到有灯塔的小岛
    .train 424785,1
step << Rogue
    #season 2
    .goto Darkshore,32.729,37.093
    >>打开树干内的 |cRXP_PICK_Lighthouse Stash|r。从中获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Saber Slash|r]
    .collect 208772,1 -- Rune of Saber Slash (1)
    .train 424785,1
step << Rogue
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .train 424785,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 暗影打击-2（杜隆塔尔）
#title Shadowstrike


    --Rune of Shadowstrike

step << Troll/Orc
    #season 2
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁瓦格|r
    .accept 77592 >>接受悬崖之上 << Troll
    .accept 77583 >>接受悬崖之上 << Orc
    .target Rwag
step
    #season 2
    .goto Durotar,43.27,69.51
    >>打开|cRXP_PICK_隐藏缓存|r。从中获取|T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    >>|cRXP_WARN_绕过|r |cRXP_ENEMY_Sarkoth|r |cRXP_WARN_然后跳下来到达箱子|r
    .collect 204795,1 --Rune of Shadowstrike (1)
    .train 400105,1
step
    #season 2
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 暗影打击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
step << Troll/Orc
    #season 2
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁瓦格|r
    .turnin 77592 >>悬崖之上 << Troll
    .turnin 77583 >>悬崖之上 << Orc
    .target Rwag
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 暗影突袭-2（提瑞斯法）
#title Shadowstrike


    --Rune of Shadowstrike

step << Undead
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_David|r
    .accept 77669 >>接受血色符文
    .target David Trias
step
    #season 2
#loop
	.line Tirisfal Glades,36.13,68.74,36.46,69.49,36.85,70.02,37.42,69.58,38.05,69.79,37.91,69.22,38.03,68.77,38.49,68.28,38.72,67.07,38.59,66.25,38.65,65.07,37.62,65.36,36.93,65.38,36.51,65.42,36.85,66.59,37.45,67.95,36.93,68.16,36.13,68.74
	.goto Tirisfal Glades,36.13,68.74,25,0
	.goto Tirisfal Glades,36.46,69.49,25,0
	.goto Tirisfal Glades,36.85,70.02,25,0
	.goto Tirisfal Glades,37.42,69.58,25,0
	.goto Tirisfal Glades,38.05,69.79,25,0
	.goto Tirisfal Glades,37.91,69.22,25,0
	.goto Tirisfal Glades,38.03,68.77,25,0
	.goto Tirisfal Glades,38.49,68.28,25,0
	.goto Tirisfal Glades,38.72,67.07,25,0
	.goto Tirisfal Glades,38.59,66.25,25,0
	.goto Tirisfal Glades,38.65,65.07,25,0
	.goto Tirisfal Glades,37.62,65.36,25,0
	.goto Tirisfal Glades,36.93,65.38,25,0
	.goto Tirisfal Glades,36.51,65.42,25,0
	.goto Tirisfal Glades,36.85,66.59,25,0
	.goto Tirisfal Glades,37.45,67.95,25,0
	.goto Tirisfal Glades,36.93,68.16,25,0
	.goto Tirisfal Glades,36.13,68.74,25,0
    >>杀死或偷走 |cRXP_ENEMY_Scarlet Converts|r。掠夺他们以获得 |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    .collect 204795,1 --Rune of Shadowstrike (1)
    .mob Scarlet Convert
    .train 400105,1
step
    #season 2
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 暗影打击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
step << Undead
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_David|r
    .turnin 77669 >>交出血色符文
    .target David Trias
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 致命酒酿 - 25（银松森林）
#title Deadly Brew


    --Rune of Deadly Brew

step
    #season 2
    .goto Silverpine Forest,47.12,71.01
    >>点击银松森林中的|cRXP_PICK_Dead Drop|r
    .accept 78261 >>接受泽索斯之角
step
    #season 2
    #completewith next
    .zone 209 >>进入影牙堡
    >>|cRXP_WARN_您必须独自完成下一部分！组队将阻止您获得所需的钥匙|r
step << Horde
    #season 2
    .gossipoption 96495,1 >>潜行经过 |cRXP_ENEMY_Rethilgore|r，与 |cRXP_FRIENDLY_Deathstalker Adamant|r 交谈，然后 |T132331:0|t[消失]。他会为你开门
    .target Deathstalker Adamant
    .train 400080,1
step << Alliance
    #season 2
    .gossipoption 96494 >>潜行经过 |cRXP_ENEMY_Rethilgore|r，与 |cRXP_FRIENDLY_Sorcerer Ashcrombe|r 交谈，然后 |T132331:0|t[消失]。他会为你开门
    .target Sorcerer Ashcrombe
    .train 400080,1
step
    #season 2
    #completewith next
    >>使用 |T133644:0|t[Pick Pocket] 对 |cRXP_ENEMY_Gemela|r 进行交易，获取 |T134243:0|t[|cRXP_LOOT_Sister's Half-Key|r]
    >>|cRXP_WARN_她位于底层的餐厅|r
    .collect 210213,1 --Sister's Half-Key (1)
    .mob Gemela
step
    #season 2
    >>使用 |T133644:0|t[Pick Pocket] 对 |cRXP_ENEMY_Gefell|r 进行交易，获取 |T134244:0|t[|cRXP_LOOT_Brother's Half-Key|r]
    >>|cRXP_WARN_他位于二楼餐厅上方|r
    .collect 210212,1 --Brother's Half-Key (1)
    .mob Gefell
    .train 400080,1
step
    #season 2
    >>使用 |T133644:0|t[Pick Pocket] 对 |cRXP_ENEMY_Gemela|r 进行交易，获取 |T134243:0|t[|cRXP_LOOT_Sister's Half-Key|r]
    >>|cRXP_WARN_她位于底层的餐厅|r
    .collect 210213,1 --Sister's Half-Key (1)
    .mob Gemela
    .train 400080,1
step
    #season 2
    .use 210212 >>返回外面的庭院，进入马厩。将两把钥匙组合起来，获得 |T237379:0|t[|cRXP_LOOT_Twin Key|r]
    .collect 210209,1 --Twin Key (1)
    .train 400080,1
step
    #season 2
    >>打开马厩中的 |cRXP_PICK_Ornamented Chest|r 获得 |cRXP_LOOT_Horn of Xelthos|r
    .complete 78261,1 --Horn of Xelthos (1)
step
    #season 2
    .goto Silverpine Forest,47.114,70.974
    >>点击银松森林中的|cRXP_PICK_Dead Drop|r
    .turnin 78261 >>交出泽索斯之角
step
    #season 2
    #completewith next
    +|cRXP_WARN_您现在需要输入首都才能接收来自 *C* 的邮件|r
    .train 400080,1
step << Horde
    #season 2
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karos|r
    .fly Undercity >>飞往幽暗城
    .target Karos Razok
    .zoneskip Undercity
    .train 400080,1
step << Alliance
    >>奔向南海镇
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达尔拉·哈瑞斯|r
    .goto Hillsbrad Foothills,49.338,52.272
    .fly Ironforge >>飞往铁炉堡
    .target Darla Harris
    .train 400080,1
step
    .goto Undercity,68.290,38.043,5 >>|cRXP_WARN_前往: |cRXP_PICK_幽暗城|r. Check your mailbox for the letter from *C*|r << Horde
    .goto Ironforge,71.485,72.280,5 >>|cRXP_WARN_前往: |cRXP_PICK_铁炉堡|r. Check your mailbox for the letter from *C*. Skip this step if you're doing it in another major city|r << Alliance
    .train 400080,1
step
    #season 2
    #completewith next
    +|cRXP_WARN_收到 *C* 的邮件后，打开邮箱阅读。准备好后飞回银松森林|r << Horde
    +|cRXP_WARN_收到 *C* 的邮件后，打开邮箱阅读。飞回南海镇，准备好后前往银松森林|r << Alliance
step << Horde
    #season 2
    .goto Undercity,63.27,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_麦克尔|r
    .fly The Sepulcher>>飞往坟墓
    .target Michael Garrett
    .zoneskip Silverpine Forest
    .train 400080,1
step << Alliance
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fly Southshore >>飞往 南海镇
    .target Gryth Thurden
    .zoneskip Silverpine Forest
    .train 400080,1
step << Alliance
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
    .train 400080,1
step
    #season 2
    .goto Silverpine Forest,47.114,70.974
    >>点击银松森林的 |cRXP_PICK_Dead Drop|r 以获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Dead Brew|r]
    .collect 203994,1 --Rune of Deadly Brew (1)
    .train 400080,1
step
    #season 2
    .train 400080 >>使用 |T134419:0|t[|cRXP_FRIENDLY_致命酒符|r]
    .use 204795
    .itemcount 204795,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 快速绘图 - 10（杜隆塔尔）
#title Quick Draw


    --Rune of Quick Draw

step
    #season 2
    .goto Durotar,57.65,58.52,30,0
    .goto Durotar,57.36,56.59,30,0
    .goto Durotar,58.10,55.52,30,0
    .goto Durotar,58.54,53.68,30,0
    .goto Durotar,56.54,54.52,30,0
    .goto Durotar,56.37,58.35,30,0
    .goto Durotar,58.99,58.30
    >>杀死或使用 |T133644:0|t[偷窃] 攻击 |cRXP_ENEMY_Kul Tiras 水手|r 和 |cRXP_ENEMY_Kul Tiras 海军陆战队|r。掠夺他们可获得 |T134327:0|t[|cRXP_LOOT_右上角地图碎片|r]
    .collect 207109,1 --Top-Right Map Piece (1)
    .mob 库尔提拉斯水手
    .mob 库尔提拉斯海军陆战队
    .train 400095,1
step
    #season 2
    .goto Durotar,50.21,50.78,30,0
    .goto Durotar,50.18,49.23,30,0
    .goto Durotar,49.48,49.14,30,0
    .goto Durotar,49.32,48.18,30,0
    .goto Durotar,48.81,49.00,30,0
    .goto Durotar,48.49,49.29,30,0
    .goto Durotar,47.58,49.62,30,0
    .goto Durotar,47.06,49.53,30,0
    .goto Durotar,46.90,48.11,30,0
    .goto Durotar,49.22,48.96
    >>杀死 |cRXP_ENEMY_钢鬃野猪人s|r 和 |cRXP_ENEMY_钢鬃斥候s|r，或使用 |T133644:0|t[Pick Pocket]。掠夺他们可获得 |T134327:0|t[|cRXP_LOOT_Bottom-Right Map Piece|r]
    .collect 207107,1 --Bottom-Right Map Piece (1)
    .mob 钢鬃野猪人
    .mob 钢鬃斥候
    .train 400095,1
step
    #season 2
#loop
	.line Durotar,67.23,88.76,66.52,87.74,65.94,86.72,65.90,84.04,65.88,82.85,67.38,82.61,68.42,82.43,68.50,84.32,68.47,86.77,67.23,88
	.goto Durotar,67.23,88.76,25,0
	.goto Durotar,66.52,87.74,25,0
	.goto Durotar,65.94,86.72,25,0
	.goto Durotar,65.90,84.04,25,0
	.goto Durotar,65.88,82.85,25,0
	.goto Durotar,67.38,82.61,25,0
	.goto Durotar,68.42,82.43,25,0
	.goto Durotar,68.50,84.32,25,0
	.goto Durotar,68.47,86.77,25,0
	.goto Durotar,67.23,88.00,25,0
    >>杀死 |cRXP_ENEMY_被诅咒的巨魔s|r 和 |cRXP_ENEMY_巫毒巨魔s|r，或使用 |T133644:0|t[Pick Pocket]。掠夺他们可获得 |T134327:0|t[|cRXP_LOOT_Bottom-Left Map Piece|r]
    .collect 207106,1 --Bottom-Left Map Piece (1)
    .mob 被诅咒的巨魔
    .mob 巫毒巨魔
    .train 400095,1
step
    #completewith next
    .goto Durotar,55.12,10.10,60 >>前往骷髅岩
step
    #season 2
    .goto Durotar,54.72,8.78,15,0
    .goto Durotar,54.29,8.89,15,0
    .goto Durotar,53.77,8.87,15,0
    .goto Durotar,53.37,7.73,15,0
    .goto Durotar,52.73,7.85,15,0
    .goto Durotar,52.42,8.59,15,0
    .goto Durotar,51.65,8.19,15,0
    .goto Durotar,51.39,8.71,15,0
    .goto Durotar,51.48,9.71,15,0
    .goto Durotar,53.77,8.87
    >>杀死 |cRXP_ENEMY_Burning Blade Orcs|r 或使用 |T133644:0|t[Pick Pocket]。掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_Top-Left Map Piece|r]
    .collect 207108,1 --Top-Left Map Piece (1)
    .mob Burning Blade Thug
    .mob Burning Blade Fanatic
    .mob Burning Blade Apprentice
    .train 400095,1
step
    #season 2
    .use 207108 >>使用 |T134327:0|t[|cRXP_LOOT_Map Pieces|r] 来创建 |T134269:0|t[|cRXP_LOOT_Durotar Treasure Map|r]
    .collect 207110,1 --Durotar Treasure Map (1)
    .train 400095,1
step
    #season 2
    .goto Durotar,62.14,94.66
    .use 207110 >>使用最南端的回音岛的 |T134269:0|t[|cRXP_LOOT_杜罗塔尔藏宝图|r]
    >>拾取生成的 |cRXP_PICK_Buried Treasure|r 宝箱，获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Quick Draw|r]
    .collect 203991,1 --Rune of Quick Draw (1s)
    .train 400095,1
step
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_快速绘制符文|r] |cRXP_WARN_进行训练|r |T134536:0|t[快速绘制]
    .use 203991
    .itemcount 203991,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 快速抽奖 - 10（提瑞斯法）
#title Quick Draw


    --Rune of Quick Draw

step
    #season 2
    .goto Tirisfal Glades,37.20,52.17,50,0
    .goto Tirisfal Glades,36.64,50.09,50,0
    .goto Tirisfal Glades,36.10,49.07,50,0
    .goto Tirisfal Glades,35.08,49.82,50,0
    .goto Tirisfal Glades,35.30,50.91,50,0
    .goto Tirisfal Glades,34.57,51.58,50,0
    .goto Tirisfal Glades,36.63,50.09
    >>杀死 |cRXP_ENEMY_Tirisfal 农民|r 和 |cRXP_ENEMY_Tirisfal 农场工人|r，或使用 |T133644:0|t[偷窃]。掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_左上角地图碎片|r]
    .collect 208036,1 --Top-Left Map Piece (1)
    .mob Tirisfal Farmer
    .mob Tirisfal Farmhand
    .train 400095,1
step
    #season 2
    #loop
    .goto Tirisfal Glades,31.78,51.36,0
    .goto Tirisfal Glades,33.73,49.34,50,0
    .goto Tirisfal Glades,33.65,51.07,50,0
    .goto Tirisfal Glades,31.78,51.36,50,0
    .goto Tirisfal Glades,30.02,50.48,50,0
    .goto Tirisfal Glades,29.91,49.24,50,0
    .goto Tirisfal Glades,30.62,47.53,50,0
    .goto Tirisfal Glades,31.01,46.50,50,0
    .goto Tirisfal Glades,32.15,44.83,50,0
    .goto Tirisfal Glades,33.73,45.29,50,0
    .goto Tirisfal Glades,34.10,47.88,50,0
    .goto Tirisfal Glades,33.73,49.34,50,0
    >>杀死 |cRXP_ENEMY_Scarlet Warriors|r 或使用 |T133644:0|t[Pick Pocket]。掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_Top-Right Map Piece|r]
    >>|cRXP_WARN_提瑞斯法的任何一个血色人形生物都可以掉落地图碎片|r
    .collect 208035,1 --Top-Right Map Piece (1)
    .mob Scarlet Warrior
    .train 400095,1
step
    #season 2
    .goto Tirisfal Glades,56.31,39.67,40,0
    .goto Tirisfal Glades,54.71,41.19,40,0
    .goto Tirisfal Glades,53.90,43.93,40,0
    .goto Tirisfal Glades,55.24,42.54,40,0
    .goto Tirisfal Glades,56.43,43.92,40,0
    .goto Tirisfal Glades,55.24,42.54
    >>杀死 |cRXP_ENEMY_Rot Hide Gnolls|r 或使用 |T133644:0|t[Pick Pocket]。掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_Bottom-Left Map Piece|r]
    .collect 208038,1 --Bottom-Left Map Piece (1)
    .mob Rot Hide Mongrel
    .mob Rot Hide Graverobber
    .mob Rot Hide Gnoll
    .train 400095,1
step
    #season 2
    .goto Tirisfal Glades,59.38,29.05,50,0
    .goto Tirisfal Glades,59.54,27.86,50,0
    .goto Tirisfal Glades,60.64,28.66,50,0
    .goto Tirisfal Glades,61.49,29.40,50,0
    .goto Tirisfal Glades,62.96,29.46,50,0
    .goto Tirisfal Glades,65.68,30.22,50,0
    .goto Tirisfal Glades,67.48,28.97,50,0
    .goto Tirisfal Glades,68.22,26.46,50,0
    .goto Tirisfal Glades,59.54,27.86
    >>杀死 |cRXP_ENEMY_Murlocs|r 或使用 |T133644:0|t[Pick Pocket]。掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_Bottom-Right Map Piece|r]
    .collect 208037,1 --Bottom-Right Map Piece (1)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .train 400095,1
step
    #season 2
    .use 208036 >>使用 |T134327:0|t[|cRXP_LOOT_Map Pieces|r] 创建 |T134269:0|t[|cRXP_LOOT_Tirisfal Treasure Map|r]
    .collect 208034,1 --Tirisfal Treasure Map (1)
    .train 400095,1
step
    #season 2
    .goto Tirisfal Glades,52.89,54.03
    .use 208034 >>使用桥下的|T134269:0|t[|cRXP_LOOT_Tirisfal Treasure Map|r]
    >>拾取生成的 |cRXP_PICK_Buried Treasure|r 宝箱，获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Quick Draw|r]
    .collect 203991,1 --Rune of Quick Draw (1s)
    .train 400095,1
step
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_快速绘制符文|r] |cRXP_WARN_进行训练|r |T134536:0|t[快速绘制]
    .use 203991
    .itemcount 203991,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 暗影屠戮 - 10（杜隆塔尔）
#title Slaughter from the Shadows


    --Rune of Slaughter from the Shadows

step
    #completewith next
    .goto Durotar,54.25,27.64,40 >>前往尘风洞东边的跳跃点
step
    #season 2
    .goto Durotar,54.25,27.64,40,0
    .goto Durotar,53.74,27.14
    >>掠夺 |cRXP_PICK_Rusty Lockbox|r 以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Slaughter|r]
    >>|cRXP_WARN_你需要稍微跳一下才能到达箱子|r
    .collect 203993,1 --Rune of Slaughter (1)
    .train 42992,1
step
    #season 2
    .train 42992 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r] |cRXP_WARN_训练|r |T236280:0|t[暗影屠杀]
    .use 203993
    .itemcount 203993,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 暗影屠戮 - 10（提瑞斯法）
#title Slaughter from the Shadows


    --Rune of Slaughter from the Shadows


step
    #season 2
    .goto Tirisfal Glades,47.39,43.64,150,0
    .goto Tirisfal Glades,52.23,26.91,20,0
    .goto Tirisfal Glades,52.29,26.40,8 >>前往阿加曼德磨坊的墓穴
step
    #season 2
#loop
	.line Tirisfal Glades,51.88,25.86,52.61,25.85,52.60,26.88,51.90,26.87
	.goto Tirisfal Glades,51.88,25.86,15,0
	.goto Tirisfal Glades,52.61,25.85,15,0
	.goto Tirisfal Glades,52.60,26.88,15,0
	.goto Tirisfal Glades,51.90,26.87,15,0
    >>杀死 |cRXP_ENEMY_Wailing Ancestors|r 和 |cRXP_ENEMY_Rotting Ancestors|r。搜刮他们以获得 |T134245:0|t[|cRXP_LOOT_Agamand Relic Coffer Key|r]
    >>|cRXP_WARN_小心！此墓穴中的怪物会动态重生！|r
    .collect 208005,1 --Agamand Relic Coffer Key (1)
    .mob Wailing Ancestor
    .mob Rotting Ancestor
    .train 42992,1
step
    #season 2
    .goto Tirisfal Glades,52.53,26.91
    >>打开 |cRXP_PICK_Relic Coffer|r 获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Slaughter|r]
    .collect 203993,1 --Rune of Slaughter (1)
    .train 42992,1
step
    #season 2
    .train 42992 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r] |cRXP_WARN_训练|r |T236280:0|t[暗影屠杀]
    .use 203993
    .itemcount 203993,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 毁伤 — 8（提瑞斯法）
#title Mutilate


    --Rune of Mutilate

step
    #season 2
    .goto Tirisfal Glades,51.17,67.81
    >>对 |cRXP_ENEMY_Captain Perrine|r 使用 |T133644:0|t[Pick Pocket] 以获得 |T133385:0|t[|cRXP_LOOT_Scarlet Lieutenant Signet 戒指|r]
    .collect 208085,1 --Scarlet Lieutenant Signet 戒指 (1)
    .mob Captain Perrine
    .train 400094,1
step
    #season 2
    #completewith next
    .goto Tirisfal Glades,60.90,51.49,10 >>前往布里尔市政厅
step
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    .use 208085 >>使用 |T133385:0|t[|cRXP_LOOT_猩红中尉印章戒指|r] 来制作 |T134328:0|t[|cRXP_LOOT_伪造的猩红备忘录|r]
    .collect 208086,1 --Forged Scarlet Memorandum (1)
    .train 400094,1
step
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_加米尔·诺瑞|r, Rune of Mutilation
    .collect 203990,1 --Rune of Mutilation (1)
    .target Jamie Nore
    .skipgossip
    .train 400094,1
step
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r] |cRXP_WARN_进行训练|r |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1


]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 毁伤 — 10（杜隆塔尔）
#title Mutilate


    --Rune of Mutilate

step
    #season 2
    #completewith next
    .goto Durotar,53.18,29.15,50 >>前往尘风洞
step
    #season 2
    .goto Durotar,53.18,29.15,20,0
    .goto Durotar,52.70,27.97,12,0
    .goto Durotar,53.05,27.87,12,0
    .goto Durotar,53.14,27.24,12,0
    .goto Durotar,52.84,26.80,12,0
    .goto Durotar,52.07,26.85,12,0
    .goto Durotar,52.70,27.97
    >>对 |cRXP_ENEMY_Burning Blade Thugs|r 使用 |T133644:0|t[Pick Pocket] 来获取 |T134331:0|t[|cRXP_LOOT_Note from Ba'so|r]
    .collect 207098,1 --Note from Ba'so (1)
    .mob Burning Blade Thug
    .train 400094,1
step
    .goto Durotar,51.82,58.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ba'so|r to receive |T134419:0|t[|cRXP_FRIENDLY_Rune of Mutilation|r]
    >>|cRXP_WARN_他已隐身！|r
    .collect 203990,1 --Rune of Mutilation (1)
    .target Ba'so
    .skipgossip
    .train 400094,1
step
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r] |cRXP_WARN_进行训练|r |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 双眼之间 - 8（提瑞斯法）
#title Between the Eyes


    --Rune of Between the Eyes

step
    #season 2
    .goto Tirisfal Glades,59.38,29.05,50,0
    .goto Tirisfal Glades,59.54,27.86,50,0
    .goto Tirisfal Glades,60.64,28.66,50,0
    .goto Tirisfal Glades,61.49,29.40,50,0
    .goto Tirisfal Glades,62.96,29.46,50,0
    .goto Tirisfal Glades,65.68,30.22,50,0
    .goto Tirisfal Glades,67.48,28.97,50,0
    .goto Tirisfal Glades,68.22,26.46,50,0
    .goto Tirisfal Glades,59.54,27.86
    >>使用 |T133644:0|t[Pick Pocket] 对 |cRXP_ENEMY_Vile Fin Murlocs|r 进行攻击以获取 |T134241:0|t[|cRXP_LOOT_Shipwreck Cache Key|r]
    .collect 208007,1 --Shipwreck Cache Key (1)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .train 400081,1
step
    #season 2
    .goto Tirisfal Glades,66.66,24.41
    >>掠夺 |cRXP_PICK_沉船宝箱|r 以获得 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 204174,1 --Rune of Precision (1)
    .train 400081,1
step
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_进行训练|r |T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1


]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 眉间之眼 - 8（奥格瑞玛）
#title Between the Eyes


    --Rune of Between the Eyes

step
    #season 2
    .goto Orgrimmar,55.87,44.89
    >>掠夺 |cRXP_PICK_Dusty Chest|r 以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Precision|r]
    >>|cRXP_WARN_它位于 The Drag 的上层|r
    .collect 204174,1 --Rune of Precision (1)
    .train 400081,1
step
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_进行训练|r |T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1


]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 剑舞 - 15（贫瘠之地）
#title Blade Dance


    --Rune of Blade Dance

step
    #season 2
    .goto The Barrens,64.40,44.09,50,0
    .goto The Barrens,63.62,46.26,50,0
    .goto The Barrens,64.23,47.10
    >>使用 |T133644:0|t[Pick Pocket] 对 |cRXP_ENEMY_南海强盗s|r 交换 |T132761:0|t[|cRXP_LOOT_Buccaneer's Matchbox|r]
    .collect 208768,1 --Buccaneer's Matchbox (1)
    .mob 南海强盗
    .train 400099,1
step
    #season 2
    .goto The Barrens,61.82,45.80
    >>点击火药桶。拾取 |cRXP_PICK_Southsea Loot Stash|r，它会生成 |T134419:0|t[|cRXP_FRIENDLY_Rune of Blade Dance|r]
    .collect 208771,1 --Rune of Blade Dance (1)
    .train 400099,1
step
    #season 2
    .train 400099 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_剑舞符文|r] |cRXP_WARN_进行训练|r |T132350:0|t[剑舞]
    .use 208771
    .itemcount 208771,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 军刀斩 - 15（贫瘠之地）
#title Saber Slash


    --Rune of Saber Slash

step
    #season 2
    #completewith next
    +|cRXP_WARN_您的开锁技能必须达到至少 80 才能获得此符文！|r
    .skill pick lock,>80,1
step
    #season 2
    .goto The Barrens,62.31,54.22
    >>掠夺马厩顶部的 |cRXP_PICK_马厩手的箱子|r，获得 |T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    >>|cRXP_WARN_跑上山，跳到城堡的墙上。从那里你可以跳到马厩顶上|r
    .collect 208772,1 --Rune of Saber Slash (1)
    .train 424984,1
step
    #season 2
    .train 424984 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_圣剑斩符文|r] |cRXP_WARN_进行训练|r |T132375:0|t[圣剑斩]
    .use 208772
    .itemcount 208772,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 光剑斩击-15（银松森林）
#title Saber Slash

    --Rune of Saber Slash

step
    #season 2
    .goto Silverpine Forest,45.25,68.06,20,0
    .goto Silverpine Forest,45.26,67.21
    >>掠夺影牙城堡入口旁的 |cRXP_PICK_Rusty Chest|r，获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Saber Slash|r]
    >>|cRXP_WARN_使用|r |T132307:0|t[Sprint] |cRXP_WARN_然后从桥上跳向箱子|r
    .collect 208772,1 --Rune of Saber Slash (1)
    .train 424984,1
step
    #season 2
    .train 424984 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_圣剑斩符文|r] |cRXP_WARN_进行训练|r |T132375:0|t[圣剑斩]
    .use 208772
    .itemcount 208772,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup Belt
#title Shadowstep
#name 暗影步 - 30（银松森林）

step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .train 400101,1
    >>点击地面上的 |cRXP_PICK_Dead Drop|r 箱子
    .goto Silverpine Forest,47.114,70.974
    .accept 78676 >>接受 Bhossca 之眼
step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    >>|cRXP_WARN_打开|r |cRXP_PICK_补给柜|r |cRXP_WARN_在马厩内获取|r |T132665:0|t[猩红新兵制服]
    .goto Tirisfal Glades,81.2,32.12
    .collect 210955,1
    .train 400101,1
step
    #completewith next
    .goto Eastern Kingdoms,47.44,19.69,10,0
    .goto Eastern Kingdoms,47.73,19.39,5 >>进入血色修道院：|cRXP_WARN_Graveyard|r 地下城 |cRXP_WARN_ALONE|r
step
    >>使用 |T133644:0|t[Pick Pocket] 对 |cRXP_ENEMY_Scarlet Scryer|r 进行攻击以获取 |T134241:0|t[Scryer's Key]
    >>|cRXP_WARN_利用|r |T132289:0|t[Distract] |cRXP_WARN_避免被发现|r
    .goto Eastern Kingdoms,47.73,19.39
    .collect 210963,1
    .mob Scarlet Scryer
    .train 400101,1
step
    #completewith next
    .goto Eastern Kingdoms,47.79,19.59,5 >>进入血色修道院：|cRXP_WARN_Library|r 地牢 |cRXP_WARN_ALONE|r
step
    #completewith next
    +|cRXP_WARN_跑到最后一个boss前的走廊|r
step
    >>拾取左侧的 |cRXP_PICK_Personal Letterbox|r 以获得 |T134331:0|t[|cRXP_LOOT_Confidential Message|r]
    .use 210955 >>|cRXP_WARN_使用|r |T132665:0|t[Scarlet Initiate's Uniform] |cRXP_WARN_使 NPC 保持中立|r
    .goto Eastern Kingdoms,47.79,19.59
    .collect 210967,1
    .train 400101,1
step
    #completewith next
    .goto Eastern Kingdoms,47.73,19.39,5 >>进入血色修道院：|cRXP_WARN_Graveyard|r 地下城 |cRXP_WARN_ALONE|r
step
    >>|cRXP_WARN_前往地牢外部区域，寻找左右墙壁上两尊雕像之间的长凳|r
    *|cRXP_WARN_On both sides|r use /sit (doable while in stealth) on the benches until the emote |cRXP_WARN_"You hear the sound of stone moving"|r appears in chat.
    *Afterwards go to the Tomb next to |cRXP_WARN_the right wall|r and open the |cRXP_PICK_Stone Coffer|r for the |T134242:0|t[Reliquary Key]
    .goto Eastern Kingdoms,47.79,19.59
    .collect 210968,1
    .train 400101,1
step
    #completewith next
    .goto Eastern Kingdoms,47.79,19.59,5 >>进入血色修道院：|cRXP_WARN_Library|r 地牢 |cRXP_WARN_ALONE|r
step
    #completewith next
    +|cRXP_WARN_奔向“珍宝馆”|r
step
    >>在左侧第一个房间中拾取 |cRXP_PICK_Padlocked Reliquary|r，获得 |T134331:0|t[|cRXP_LOOT_Eye of Bhossca|r]
    .use 210955 >>|cRXP_WARN_使用|r |T132665:0|t[Scarlet Initiate's Uniform] |cRXP_WARN_使 NPC 保持中立|r
    .goto Eastern Kingdoms,47.79,19.59
    .complete 78676,1 --1/1 Eye of Bhossca
    .train 400101,1
step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .train 400101,1
    >>点击地面上的 |cRXP_PICK_Dead Drop|r 箱子
    .goto Silverpine Forest,47.1,71.1
    .turnin 78676 >>交出 Bhossca 之眼
step
    #completewith next
    +|cRXP_WARN_您现在需要输入首都才能接收来自 *C* 的邮件|r
    .train 400101,1
step << Horde
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karos|r
    .fly Undercity >>飞往幽暗城
    .target Karos Razok
    .zoneskip Undercity
    .train 400101,1
step << Alliance
    >>奔向南海镇
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达尔拉·哈瑞斯|r
    .goto Hillsbrad Foothills,49.338,52.272
    .fly Ironforge >>飞往铁炉堡
    .target Darla Harris
    .train 400101,1
step
    .goto Undercity,68.290,38.043,5 >>|cRXP_WARN_前往: |cRXP_PICK_幽暗城|r. Check your mailbox for the letter from *C*|r << Horde
    .goto Ironforge,71.485,72.280,5 >>|cRXP_WARN_前往: |cRXP_PICK_铁炉堡|r. Check your mailbox for the letter from *C*. Skip this step if you're doing it in another major city|r << Alliance
    .train 400101,1
step
    #completewith next
    +|cRXP_WARN_收到 *C* 的邮件后，打开邮箱阅读。准备好后飞回银松森林|r << Horde
    +|cRXP_WARN_收到 *C* 的邮件后，打开邮箱阅读。飞回南海镇，准备好后前往银松森林|r << Alliance
step << Horde
    .goto Undercity,63.27,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_麦克尔|r
    .fly The Sepulcher>>飞往坟墓
    .target Michael Garrett
    .zoneskip Silverpine Forest
    .train 400101,1
step << Alliance
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fly Southshore >>飞往 南海镇
    .target Gryth Thurden
    .zoneskip Silverpine Forest
    .train 400101,1
step << Alliance
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
    .train 400101,1
step
    .goto Silverpine Forest,47.114,70.974
    >>点击 |cRXP_PICK_Dead Drop|r 宝箱，获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Shadowstep|r]
    .collect 210979,1 --Rune of Shadowstep (1)
    .train 400101,1
step
    .train 400101 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_暗影步符文|r] |cRXP_WARN_学习|r |T132303:0|t[暗影步]
    .use 210979
    .itemcount 210979,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup Belt
#name 手里剑投掷 - 30（悲伤沼泽）
#title Shuriken Toss

step
    .train 400096,1
    .train 1842 >>|cRXP_WARN_你必须先学习|r |T136162:0|t[解除陷阱] |cRXP_WARN_然后才能获得|r |T134419:0|t[|cRXP_FRIENDLY_刺客符文|r]
    .collect 5060,1 >>|cRXP_WARN_您还需要|r |T134065:0|t[盗贼工具]
step
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
step
    .goto Swamp of Sorrows,41.48,29.97
    .train 400096,1
    .cast 1842 >>|cRXP_WARN_施放|r |T136162:0|t[解除陷阱] |cRXP_WARN_on |r |cRXP_PICK_飞镖陷阱|r |cRXP_WARN_on 树|r
step
    .goto Swamp of Sorrows,42.76,30.77
    >>掠夺 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Assassin|r]|r 生成的 |cRXP_PICK_Conspicuous Cache|r
    .collect 213139,1
step
    .itemcount 213139,1
    .use 213139
    .train 400096 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_刺客符文|r] |cRXP_WARN_学习|r |T132330:0|t[手里剑投掷]
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup Boots
#name 敏锐大师 - 34（荆棘谷）
#title Master of Subtlety

step
    .train 425103,1
    .skill lockpicking,125 >>|cRXP_WARN_你必须将你的|r |T136058:0|t[撬锁] |cRXP_WARN_等级至少提升至 125 级才能获得|r |T132299:0|t[敏锐大师] |cRXP_WARN_符文|r
step
    .train 425103,1
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
step
    .train 425103,1
    #completewith Uniform
    .goto Stranglethorn Vale,46.30,7.61,30 >>进入储备处（库尔森的洞穴）
step
    .train 425103,1
    #completewith next
    >>对 |cRXP_ENEMY_Kurzen Elites|r 和 |cRXP_ENEMY_Kurzen Subchiefs|r 施放 |T133644:0|t[Pick Pocket]，获得 |cRXP_LOOT_Compound Cage Key|r
    .collect 216616,1
    .mob Kurzen Elite
    .mob Kurzen Subchief
step
    #label Uniform
    .train 425103,1
    .goto Stranglethorn Vale,49.616,7.743
    >>打开 |cRXP_PICK_Kurzen 补给箱|r。获取 |cRXP_LOOT_Kurzen 战士制服|r
    .collect 216617,1
step
    .train 425103,1
    .goto Stranglethorn Vale,49.943,3.953,40,0
    .goto Stranglethorn Vale,49.617,7.562,40,0
    .goto Stranglethorn Vale,49.25,6.18
    >>|T133644:0|t[扒窃] |cRXP_ENEMY_Kurzen 精英|r 和 |cRXP_ENEMY_Kurzen 副酋长|r 获得 |cRXP_LOOT_复合笼子钥匙|r
    .collect 216616,1
    .mob Kurzen Elite
    .mob Kurzen Subchief
step
    .train 425103,1
    #completewith next
    .goto Stranglethorn Vale,44.261,7.908,60 >>离开洞穴。前往外面塔楼里的 |cRXP_FRIENDLY_Wendel Mathers|r
step
    .train 425103,1
    .goto Stranglethorn Vale,44.261,7.908
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wendel Mathers|r in the tower
    >>|cRXP_WARN_他的重生计时器大约为 3 分钟|r
    .destroy 216616 >>将 |cRXP_LOOT_Compound Cage Key|r 交给他
    .destroy 216617 >>把 |cRXP_LOOT_Kurzen 战士制服|r 交给他
    .skipgossip 218230,1
    .target Wendel Mathers
step
    .train 425103,1
    #completewith next
    .subzone 35 >>前往藏宝海湾
step
    .train 425103,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Aransas|r
    >>她会给你 |T133640:0|t[|cRXP_LOOT_阿兰萨斯上尉的奖励|r]
    .goto Stranglethorn Vale,27.681,76.648
    .skipgossip
    .collect 216618,1
    .target Captain Aransas
step
    .train 425103,1
    .use 216618 >>打开 |T133640:0|t[|cRXP_LOOT_Captain Aransas' Reward|r] 即可获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Sublety|r] 和 |T338666:0|t[|cRXP_FRIENDLY_Jani's Charm|r]
    >>|cRXP_WARN_不要摧毁|r |T338666:0|t[|cRXP_FRIENDLY_Jani's Charm|r] |cRXP_WARN_因为它用于收集未来的符文|r
    .collect 213136,1
step
    .itemcount 213136,1
    .use 213136
    .train 425103 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_微妙符文|r] |cRXP_WARN_进行训练|r |T132299:0|t[微妙大师]
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup Boots
#title Rolling with the Punches
#name 随波逐流-27（千针石林）


step
    #optional
    .train 400093,1
    .skill lockpicking,45 >>|cRXP_WARN_你必须将你的|r |T136058:0|t[撬锁] |cRXP_WARN_等级至少提升至 45 级才能获得|r |T134919:0|t[随波逐流] |cRXP_WARN_符文|r
step
    .train 400093,1
    #completewith next
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
step
    .train 400093,1
    #completewith next
    .goto Thousand Needles,18.44,21.58,10 >>进入 Camp E'thok 的大帐篷
step
    .train 400093,1
    .goto Thousand Needles,18.686,21.126
    >>打开 |cRXP_PICK_Sizable 失窃保险箱|r。获取 |T132597:0|t[|cRXP_LOOT_Large Strongbox|r]
    .collect 215451,1
step
    .train 400093,1
    .cast 1804 >>|cRXP_WARN_施放|r |T136058:0|t[撬锁] |cRXP_WARN_在|r |T132597:0|t[|cRXP_LOOT_大型保险箱|r] |cRXP_WARN_解锁|r
    .usespell 1804
    .use 215451
step
    .train 400093,1
    .use 215451 >>打开 |T132597:0|t[|cRXP_LOOT_Large Strongbox|r]。将其拾取以获取 |T132597:0|t[|cRXP_LOOT_Medium Strongbox|r]
    .collect 215452,1
step
    .train 400093,1
    .cast 1804 >>|cRXP_WARN_施放|r |T136058:0|t[撬锁] |cRXP_WARN_在|r |T132597:0|t[|cRXP_LOOT_中型保险箱|r] |cRXP_WARN_解锁它|r
    .usespell 1804
    .use 215452
step
    .train 400093,1
    .use 215452 >>打开 |T132597:0|t[|cRXP_LOOT_Medium Strongbox|r]。 将其拾取以获取 |T132597:0|t[|cRXP_LOOT_Small Strongbox|r]
    .collect 215453,1
step
    .train 400093,1
    .cast 1804 >>|cRXP_WARN_施放|r |T136058:0|t[撬锁] |cRXP_WARN_在|r |T132597:0|t[|cRXP_LOOT_小保险箱|r] |cRXP_WARN_解锁|r
    .usespell 1804
    .use 215453
step
    .train 400093,1
    .use 215453 >>打开 |T132597:0|t[|cRXP_LOOT_小型保险箱|r]。获取 |T134419:0|t[|cRXP_FRIENDLY_左撇子符文|r]
    .collect 213138,1
step
    .itemcount 213138,1
    .use 213138
    .train 400093 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_左撇子符文|r] |cRXP_WARN_进行训练|r |T134919:0|t[随波逐流]
]])

 RXPGuides.RegisterGuide([[
 #classic
 << Rogue SoD
 #group RestedXP 符文书指南
 #subgroup Helmet
 #title Focused Attacks
 #name 集中攻击 - 34（内陆地区）

 step
    >>|cRXP_WARN_你将需要|r |T136175:0|t[致盲] |cRXP_WARN_和|r |T133587:0|t[致盲粉] |cRXP_WARN_来获得|r |T236274:0|t[集中攻击] |cRXP_WARN_符文|r
    .train 2094 >>列车 |T136175:0|t[盲]
    .collect 5530,1 -- Blinding Powder 1/1
    .train 432291,1
step
    #completewith next
    .zone The Hinterlands >>前往: |cRXP_PICK_辛特兰|r
step
    .goto The Hinterlands,72.76,52.91
    >>对 |cRXP_ENEMY_Vilebranch Mask|r 施放 |T136175:0|t[致盲]，然后拾取 |cRXP_PICK_Treasure of the Bat|r 宝箱以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Focus|r]
    .collect 221433,1 -- rune of focus
    .mob Vilebranch Mask
    .train 432291,1
step
    .itemcount 221433,1
    .use 221433
    .train 432291 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_专注符文|r] |cRXP_WARN_进行训练|r |T236274:0|t[集中攻击]
 ]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup Bracers
#title Unfair Advantage
#name 不公平优势 - 40（塔纳利斯）

step
    .train 921 >>|cRXP_WARN_你需要训练|r |T133644:0|t[扒窃] |cRXP_WARN_以获得|r |T236285:0|t[不公平优势] |cRXP_WARN_rune|r
    .train 432301,1
step
    #completewith CoinPurse
    .zone Tanaris >>|cRXP_WARN_前往: |cRXP_PICK_塔纳利斯|r|r
step
    #completewith next
    .subzone 1336 >>前往 Lost Rigger Cove
step
    #label CoinPurse
	.line Tanaris,70.94,42.85,72.22,44.35,72.58,45.30,71.07,46.03,71.25,47.98,72.39,48.23,72.59,47.10,73.27,47.99,74.25,47.27,73.68,45.89,72.58,45.30,72.22,44.35,70.94,42.85
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
	.goto Tanaris,70.94,42.85,50,0
    >>|cRXP_WARN_施放|r |T133644:0|t[扒窃] |cRXP_WARN_on|r |cRXP_ENEMY_南海海盗|r |cRXP_WARN_and|r |cRXP_ENEMY_南海海盗|r |cRXP_WARN_直到你收到|r |T133639:0|t|cRXP_LOOT_绑架者的钱包|r
    .collect 221371,1 - Kidnapper's Coin Purse 1/1
    .mob Southsea Pirate
    .mob Southsea Freebooter
    .train 432301,1
step
    >>打开 |T133639:0|t|cRXP_LOOT_Kidnapper's Coin Purse|r 并从中获取 |T133302:0|t|cRXP_LOOT_Precious Medalion|r
    .collect 221370,1 -- Precious Medalion 1/1
    .use 221371
    .train 432301,1
step << Rogue
    .goto Tanaris,67,22
    .gossipoption 122303 >>对话: |cRXP_FRIENDLY_加贝|r, Rune of Foul Play
    .collect 221428,1 -- Rune of Foul Play
    .target Jabbey
    .train 432301,1
    .itemcount 221370,1
step << Rogue
    .itemcount 221428,1
    .use 221428
    .train 432301 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_犯规符文|r] |cRXP_WARN_进行训练|r |T236285:0|t[不公平优势]

]])
RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup Bracers
#title Carnage
#name 屠杀 - 45（诅咒之地）

step
    #optional
    .skill lockpicking,225 >>|cRXP_WARN_你必须将你的|r |T136058:0|t[撬锁] |cRXP_WARN_等级至少提升至 225 级才能获得|r |T236268:0|t[屠杀] |cRXP_WARN_符文|r
step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
step
    #completewith next
    .goto Blasted Lands,45.27,16.52,10 >>前往 Dreadmaul Hold 前面的塔顶
step
    .goto Blasted Lands,45.27,16.52
    >>打开 |cRXP_PICK_Abandoned Cache|r。杀死生成的 |cRXP_ENEMY_Murderous Lost One|r（等级 46）
    >>掠夺它以获得 |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r]
    .collect 221461,1 -- Rune of Carnage 1/1
    .unitscan Murderous Lost One
    .train 432299,1
step
    .use 221461
    .itemcount 221461,1
    .train 432299 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r] |cRXP_WARN_进行训练|r |T236268:0|t[屠杀]

]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup Helmet
#title Honor Among Thieves
#name 盗贼荣誉 - 45（艾泽拉斯）

step
    #optional
    .xp 45 >>|cRXP_WARN_你需要达到 45 级才能获得此符文|r
step
    #optional
    .train 400101 >>|cRXP_WARN_你必须训练过|r |T132303:0|t[暗影步] |cRXP_WARN_in才能获得此符文|r
step
    #optional
    .train 400080,1 >>|cRXP_WARN_你必须训练过|r |T236270:0|t[致命药剂] |cRXP_WARN_in才能获得此符文|r
step
    #optional
    #completewith letterC
    >>|cRXP_WARN_要开始这个符文的任务，你需要完成“拉文霍德庄园”任务，该任务将向你介绍拉文霍德流氓派系。要获得它，请与|r |cRXP_FRIENDLY_夜行人奥斯本|r |cRXP_WARN_in 暴风城交谈|r << Alliance
    +|cRXP_WARN_要开始这个符文的任务，你需要完成“拉文霍德庄园”任务，该任务将向你介绍拉文霍德流氓派系。要接收它，请与|r |cRXP_FRIENDLY_Ormok|r |cRXP_WARN_in Orgrimmar交谈|r << Horde
    .accept 6681 >>接任务: |cRXP_WARN_拉文霍德庄园|r << Alliance
    .isQuestAvailable 6681
step << Horde
    .goto Orgrimmar,43.91,54.69
    .gossipoption 96925 >>对话: |cRXP_FRIENDLY_奥莫克|r, Elegant Letter
    .disablecheckbox
    .collect 17126,1,6681
    .accept 6681 >>接任务: |cRXP_WARN_拉文霍德庄园|r
    .target Ormok
    .isQuestAvailable 6681
step
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
    .isOnQuest 6681
step
    #completewith next
    .goto Hillsbrad Foothills,75.27,23.66,15,0
    .goto Hillsbrad Foothills,75.66,20.30,15,0
    .goto Hillsbrad Foothills,77.24,21.98,15,0
    .goto Hillsbrad Foothills,78.62,17.96,20 >>进入拉文霍德庄园
    .isOnQuest 6681
step
    .goto Hillsbrad Foothills,78.62,17.96
    >>移向 |cRXP_PICK_Chest|r
    .complete 6681,1 --Rite of Cunning: 1/1
    .isOnQuest 6681
step
    .goto Alterac Mountains,85.51,79.41,10,0
    .goto Alterac Mountains,86.11,80.22,10,0
    .goto Alterac Mountains,84.45,80.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_法拉德|r, 他在楼上
    .turnin 6681 >>交任务: |cRXP_FRIENDLY_拉文霍德庄园|r
    .target Fahrad
    .isOnQuest 6681
step << Alliance
    +|cRXP_WARN_前往任何大城市|r
    >>Darnassus
    >>Ironforge
    >>Stormwind City
    .zoneskip Darnassus
    .zoneskip Ironforge
    .zoneskip Stormwind City
    .train 432295,1
step << Horde
    +|cRXP_WARN_前往任何大城市|r
    >>Undercity
    >>Thunder Bluff
    >>Orgrimmar
    .zoneskip Undercity
    .zoneskip Thunder Bluff
    .zoneskip Orgrimmar
    .train 432295,1
step
    #label letterC
    +|cRXP_WARN_检查你的邮箱，查找来自 *Fahrad* 的来信|r
    >>|cRXP_WARN_准备好后跳过此步骤|r
    .train 432295,1
step
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
step
    #completewith next
    .goto Hillsbrad Foothills,75.27,23.66,15,0
    .goto Hillsbrad Foothills,75.66,20.30,15,0
    .goto Hillsbrad Foothills,77.24,21.98,15,0
    .goto Hillsbrad Foothills,78.62,17.96,20 >>进入拉文霍德庄园
step
    .goto Alterac Mountains,85.51,79.41,10,0
    .goto Alterac Mountains,86.11,80.22,10,0
    .goto Alterac Mountains,84.45,80.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_法拉德|r, 他在楼上
    .accept 80526 >>接受“愚弄我两次”
    .turnin 80526 >>上交愚弄我两次
    .accept 80411 >>接受卡兹多尔的护身符
    .target Fahrad
step
    #optional
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
step
    #completewith next
    .goto Tanaris,38.69,20.20
    .subzone 1176 >>进入祖尔法拉克
    >>|cRXP_WARN_你不能加入团队才能完成此符文的任务|r
step
    .goto Tanaris,38.69,20.20
    >>打开 |cRXP_PICK_Clay Vessels|r 获取 |T134799:0|t[|cRXP_LOOT_Vile Concoctions|r]
    >>|cRXP_WARN_它们位于祖尔法拉克各处的巨魔帐篷里|r
    .collect 217716,2
    .train 432295,1
step
    #completewith next
    +|cRXP_WARN_移向|r |cRXP_ENEMY_Antu'sul's|r |cRXP_WARN_cave|r
step
    >>在大锅上使用 |T134799:0|t[|cRXP_LOOT_Vile Concoction|r]。|cRXP_WARN_它不会破坏你的隐身能力|r
    >>当 Boss 分心时，掠夺 |cRXP_PICK_Antu'Sul's Satchel|r 以获得 |T133724:0|t[|cRXP_LOOT_Offering of Bone|r]
    .collect 217721,1 --Offering of Bone
    .use 217716
    .train 432295,1
step
    #completewith next
    +|cRXP_WARN_朝墓地区域的 |cRXP_ENEMY_Witch Doctor Zum'rah|r 移动|r
step
    >>在 |cRXP_ENEMY_Witch Doctor Zum'rah|r 旁边的大锅上使用你的第二个 |T134799:0|t[|cRXP_LOOT_Vile Concoction|r]。|cRXP_WARN_它不会破坏你的隐身|r
    >>当他分心时，掠夺 |cRXP_PICK_Zum'rahs Satchel|r 以获得 |T136232:0|t|cRXP_LOOT_Ward of the Dead|r
    .collect 217727,1 --ward of the dead
    .use 217716
    .train 432295,1
step
    #completewith next
    .equip 13,217727 >>装备你刚刚抢夺的 |T136232:0|t|cRXP_LOOT_Ward of the Dead|r 饰品
    >>|cRXP_WARN_这将揭示哪个|r |cRXP_PICK_浅坟|r |cRXP_WARN_需要被掠夺|r
step
    >>拾取带有蓝色光环的 |cRXP_PICK_Shallow Grave|r 以获得 |T236304:0|t|cRXP_LOOT_Offering of Flesh|r
    .collect 217720,1 --offering of flesh
    .use 217727
    .train 432295,1
step
    >>使用你刚刚收集的 |T236304:0|t[|cRXP_LOOT_Offering of Flesh|r] 将其与 |T133724:0|t[|cRXP_LOOT_Offering of Bone|r] 结合起来制成 |T236305:0|t[|cRXP_LOOT_Blood Magic Essence|r]
    .collect 217719,1 --Blood Magic Essence
    .use 217720
    .train 432295,1
step
    >>走到金字塔楼梯脚下，向右看。在墙边你会看到一块小石块。跳上去，然后走到边缘
    >>在右侧的第二个木阳台上，你会发现一个 |cRXP_PICK_Sandfury Cache|r。将其拾取以获得 |T237274:0|t[|cRXP_LOOT_Hollow Emblem|r]
    .collect 217717,1 --Hollow Emblem
    .train 432295,1
step
    >>使用你刚拾取的 |T237274:0|t|cRXP_LOOT_Hollow Emblem|r 将其与 |T236305:0|t[|cRXP_LOOT_Blood Magic Essence|r] 结合成 |T133572:0|t[|cRXP_LOOT_Emblem of Blood Magic|r]
    .collect 217718,1 --Emblem of Blood Magic
    .use 217717
    .train 432295,1
step
    >>爬上金字塔顶部的楼梯并掠夺 |cRXP_PICK_Spellbound War Chest|r 以获得 |T133313:0|t[|cRXP_LOOT_Talisman of Kazdor|r]
    .collect 217609,1 --Talisman of Kazdor
    .train 432295,1
step
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
step
    #completewith next
    .goto Hillsbrad Foothills,75.27,23.66,15,0
    .goto Hillsbrad Foothills,75.66,20.30,15,0
    .goto Hillsbrad Foothills,77.24,21.98,15,0
    .goto Hillsbrad Foothills,78.62,17.96,20 >>进入拉文霍德庄园
step
    .goto Alterac Mountains,85.51,79.41,10,0
    .goto Alterac Mountains,86.11,80.22,10,0
    .goto Alterac Mountains,84.45,80.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_法拉德|r, 他在楼上
    .turnin 80411 >>交出卡兹多尔的护身符
    .accept 80453 >>接受最佳计划
    .target Fahrad
step
    .goto Alterac Mountains,86.0,80.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨恩·刀链|r
    .turnin 80453 >>提交最佳计划
    .accept 80454 >>接受最后一滴
    .target Zan Shivsproket
step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .goto Silverpine Forest,47.114,70.974
    >>点击|cRXP_PICK_Dead Drop|r 箱子
    .turnin 80454 >>交出最后一滴
    .accept 80455 >>接受等待时机
    .train 432295,1
step
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
step
    #completewith next
    .goto Hillsbrad Foothills,75.27,23.66,15,0
    .goto Hillsbrad Foothills,75.66,20.30,15,0
    .goto Hillsbrad Foothills,77.24,21.98,15,0
    .goto Hillsbrad Foothills,78.62,17.96,20 >>进入拉文霍德庄园
step
    .goto Alterac Mountains,85.51,79.41,10,0
    .goto Alterac Mountains,86.11,80.22,10,0
    .goto Alterac Mountains,84.45,80.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_法拉德|r, 他在楼上
    .turnin 80455 >>交出等待时机
    .target Fahrad
step
    .train 432295 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_小圈子符文|r] |cRXP_WARN_训练|r |T236275:0|t[盗贼间的荣誉]
    .use 217736
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup 披风
#title Crimson Tempest
#name 赤红风暴 - 60（西瘟疫之地）

step
    .train 415918,1
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    .train 415918,1
    #completewith next
    .subzone 190 >>前往壁炉谷
step
    #label ToolboxKey
    .train 415918,1
    .goto Western Plaguelands,45.0,13.6
    >>杀死或 |T133644:0|t[偷窃] |cRXP_ENEMY_Scarlet 工人|r。掠夺他们以获得 |cRXP_LOOT_工具箱钥匙|r
    .collect 227928,1 -- Toolbox Key 1/1
    .mob Scarlet Worker
step
    .train 415918,1
    .goto Western Plaguelands,45.0,14.2
    >>打开 |cRXP_PICK_Scarlet 工具箱|r。从中获取 |cRXP_LOOT_Rusty Crowbar|r
    .collect 227932,1 -- Rusty Crowbar 1/1
step
    .goto Western Plaguelands,49.5,18.5
    >>前往壁炉谷中部的塔顶。打开那里的 |cRXP_PICK_Marked Crate|r。从中获取 |T133640:0|t[|cRXP_LOOT_Hidden Bundle|r]，然后打开它获取 |T134237:0|t[|cRXP_LOOT_Safe Box Key|r]
    .collect 227930,1
step
    .goto Western Plaguelands,46.3,14.6
    >>前往位于城市北侧的壁炉谷第二座塔楼的中层。使用 |T134237:0|t[|cRXP_LOOT_保险箱钥匙|r] 打开 [|cRXP_PICK_Belavus 的保险箱|r] 并从中获取 |T134419:0|t[|cRXP_FRIENDLY_赤红风暴符文|r]
    .collect 227456,1 --Rune of the crimson tempest
step
    .use 227456
    .itemcount 227456,1
    .train 415918 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_赤红风暴符文|r] |cRXP_WARN_训练|r |T135315:0|t[赤红风暴]
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup 披风
#title Fan of Knives
#name 刀扇 - 55（冬泉谷）

step
    .train 436609,1
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
step
    .train 436609,1
    .goto Winterspring,67.7,35.4
    >>打开 |cRXP_PICK_木箱|r。从中获取 |T134419:0|t[|cRXP_FRIENDLY_刀之符文|r]
    >>|cRXP_WARN_打开 |cRXP_PICK_Wooden Chest|r 时，按以下顺序选择以下选项：|r
    >>|cRXP_WARN_霜刃豹|r
    >>|cRXP_WARN_猫头鹰|r
    >>|cRXP_WARN_熊|r
    >>|cRXP_WARN_猫头鹰|r
    .collect 227921,1
step
    .use 227921
    .itemcount 227921,1
    .train 436609 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_刀之符文|r] |cRXP_WARN_训练|r |T236273:0|t[刀之扇]
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup 披风
#title Blunderbuss
#name 火枪 - 60（东瘟疫之地）

step
    .train 415922,1
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step
    .train 415922,1
    .goto Eastern Plaguelands,83,85
    >>在 Try's Hand 中打开 |cRXP_LOOT_Scarlet Footlockers|r 直到你掠夺 |cRXP_LOOT_Sending Signal|r
    .collect 227451,1
step
    .train 415922,1
    #completewith FinalPillar
    >>|cRXP_WARN_为完成以下步骤，您必须按正确顺序单击四个 |cRXP_PICK_Sending Pillars|r。单击一个后，您将被随机传送到另一个。在单击另一个之前，请确保您处于正确的位置！|r
step
    .train 415922,1
    .goto Eastern Plaguelands,82,57
    .cast 6477,6478 >>点击第一个 |cRXP_PICK_Sending Pillar|r |cRXP_WARN_behind Light's Hope Chapel|r
step
    .train 415922,1
    .goto Eastern Plaguelands,40,92
    .cast 6477,6478 >>点击第二个 |cRXP_PICK_Sending Pillar|r |cRXP_WARN_in Darrowshire|r
step
    .train 415922,1
    .goto Eastern Plaguelands,70,34
    .cast 6477,6478 >>点击第三个 |cRXP_PICK_Sending Pillar|r |cRXP_WARN_in Northdal​​e|r
step
    .train 415922,1
    #label FinalPillar
    .goto Eastern Plaguelands,14,30
    .cast 6477,6478 >>点击第四个 |cRXP_PICK_Sending Pillar|r |cRXP_WARN_in Terrordale|r
step
    .train 415922,1
    >>|cRXP_WARN_进入房子|r
    >>打开地面上的 |cRXP_PICK_Adon's Trunk|r。拾取它以获得 |T134419:0|t[|cRXP_LOOT_Rune of the Swashbuckler|r]
    .collect 227922,1
step
    .use 227922
    .itemcount 227922,1
    .train 415922 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_剑客符文|r] |cRXP_WARN_进行训练|r |T134538:0|t[火枪]
]])