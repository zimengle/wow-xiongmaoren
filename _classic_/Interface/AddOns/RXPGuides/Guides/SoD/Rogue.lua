RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 暗影之击 - 3(艾尔文森林)
#displayname Shadowstrike

step << Rogue
    #season 2
    .goto Elwynn Forest,52.544,51.922
    >>|cRXP_WARN_打开地面上的|cRXP_PICK_Defias 储物箱|r. 拾取其中的|r|T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    .collect 204795,1 -- Rune of Shadowstrike (1)
    .train 400105,1
step << Rogue
    #season 2
    .train 400105 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[暗影之击符文]|r|cRXP_WARN_来学习|r|T132291:0|t[暗影之击]
    .use 204795
    .itemcount 204795,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 暗影之击 - 3(丹莫洛)
#displayname Shadowstrike

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
    .goto 1426,30.489,80.165,50 >>前往位于里面的|cRXP_PICK_Frostmane 掉落物宝箱|r
step
    .goto Dun Morogh,30.773,80.063
    >>打开地面内的|cRXP_PICK_Frostmane Loot Cache|r, 从中拾取 |T134419:0|t|cRXP_LOOT_[暗影之击符文]|r
    .collect 204795,1 --Rune of Shadowstrike (1)
    .train 400105,1
step
    .train 400105 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[暗影之击符文]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 暗影之击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 暗影之击 - 3(影谷)
#displayname Shadowstrike

step << Rogue
    #season 2
    .goto Teldrassil,57.922,40.687,25,0
    .goto Teldrassil,58.709,38.782,10,0
    .goto Teldrassil,59.15,40.66,20,0
    .goto Teldrassil,59.674,42.613
    >>|cRXP_WARN_沿着奥达希尔树上的坡道向上走, 然后跳到屋顶上|r
    >>|cRXP_WARN_|cRXP_PICK_Idol|r 位于屋顶上|r
    >>打开|cRXP_PICK_偶像|r. 拾取它以获得|T134419:0|t|cRXP_LOOT_[暗影之击符文]|r
    >>|cRXP_WARN_如果你难以跳上屋顶, 可以尝试在沿着斜坡奔跑时跳过栏杆|r
    .collect 204795,1 -- Rune of Shadowstrike (1)
    .train 400105,1
step << Rogue
    #season 2
    .train 400105 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[暗影之击符文]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 暗影之击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 快枪手 - 8(艾尔文森林)
#displayname Quick Draw

step << Rogue
    #season 2
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9
    >>|T133644:0|t[扒窃] |cRXP_ENEMY_河爪豺狼人前锋|r和 |cRXP_ENEMY_矮小的河爪豺狼人|r. 击败他们以获取 |T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 203787,1 -- Bottom-Left Map Piece (1)
    .mob Riverpaw Outrunner
    .mob Riverpaw Runt
    .train 398196,1
step << Rogue
    #season 2
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_狗头人矿工|r和|cRXP_ENEMY_狗头人隧道工|r. 击杀他们以获取 |T134327:0|t[|cRXP_LOOT_右上地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 203784,1 -- Top-Right Map Piece (1)
    .mob Kobold Miner
    .mob Kobold Tunneler
    .train 398196,1
step << Rogue
    #season 2
    .goto Elwynn Forest,67.4,78.6,60,0
    .goto Elwynn Forest,70.8,79.8,60,0
    .goto Elwynn Forest,89.2,78.8
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_Defias|r. 击杀后搜刮, 获取 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_WARN_注意:这也可能来自艾尔文森林中的任何其他|cRXP_ENEMY_Defias|r成员|r
    .collect 203785,1 -- Top-Left Map Piece (1)
    .mob Defias Bandit
    .train 398196,1
step << Rogue
    #season 2
    .goto Elwynn Forest,75.4,85.4,60,0
    .goto Elwynn Forest,77.8,82.2,60,0
    .goto Elwynn Forest,83.2,87.0,60,0
    .goto Elwynn Forest,75.4,82.4
    >>|T133644:0|t[扒手]|cRXP_ENEMY_鱼人强盗|r和|cRXP_ENEMY_鱼人潜伏者|r. 击败他们以获取 |T134269:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_WARN_注意:这也可能来自艾尔文森林中的任何其他|cRXP_ENEMY_鱼人|r|r
    .collect 203786,1 -- Bottom-Right Map Piece (1)
    .mob Murloc Forager
    .mob Murloc Lurker
    .mob Murloc Streamrunner
    .mob Murloc
    .train 398196,1
step << Rogue
    #season 2
    .cast 401847 >>|cRXP_WARN_使用任意|r|T134327:0|t[|cRXP_LOOT_地图碎片]|r|cRXP_WARN_将其合成|r|T134269:0|t[|cRXP_LOOT_艾尔文森林藏宝图|r]
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
    .cast 401617 >>|cRXP_WARN_使用|r|T134269:0|t[|cRXP_LOOT_艾尔文森林藏宝图|r]|cRXP_WARN_在箭头指示的位置. 这将触发一个 |cRXP_PICK_隐藏宝藏|r出现|r
    .use 203750
    .itemcount 203750,1
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
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 快速拔枪 - 8(丹莫洛)
#displayname Quick Draw

step << Rogue
    #season 2
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_暗铁间谍|r. 击杀他们以获取 |T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208219,1 -- Bottom-Left Map Piece (1)
    .mob Dark Iron Spy
    .train 398196,1
step << Rogue
    #season 2
    .goto Dun Morogh,25.4,50.8
    >>|T133644:0|t[扒窃] |cRXP_ENEMY_霜鬃巨魔|r. 击杀他们以获取 |T134327:0|t[|cRXP_LOOT_右上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208213,1 -- Top-Right Map Piece (1)
    .mob Frostmane Headhunter
    .mob Frostmane Hideskinner
    .mob Frostmane Shadowcaster
    .train 398196,1
step << Rogue
    #season 2
    .goto Dun Morogh,70.8,56.0
    >>|T133644:0|t[劫掠]|cRXP_ENEMY_石腭击颅者|r和|cRXP_ENEMY_石腭断骨者|r. 搜刮他们以获得 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208215,1 -- Top-Left Map Piece (1)
    .mob Rockjaw Skullthumper
    .mob Rockjaw Bonesnapper
    .train 398196,1
step << Rogue
    #season 2
    .goto Dun Morogh,26.0,41.8
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_麻风侏儒|r. 击杀他们以获取 |T134269:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208218,1 -- Bottom-Right Map Piece (1)
    .mob Leper Gnome
    .train 398196,1
step << Rogue
    #season 2
    .cast 418600 >>|cRXP_WARN_使用任意|r|T134327:0|t[|cRXP_LOOT_地图碎片]|r|cRXP_WARN_将其组合成|r|T134269:0|t[|cRXP_LOOT_丹莫罗藏宝图|r]
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
    .cast 418599 >>|cRXP_WARN_使用|r|T134269:0|t[|cRXP_LOOT_丹莫罗藏宝图|r] |cRXP_WARN_在小桥下方. 这将触发一个 |cRXP_PICK_埋藏的宝藏|r出现|r
    .use 208220
    .itemcount 208220,1
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
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 快枪手 - 8(泰达希尔)
#displayname Quick Draw

step << Rogue
    #season 2
    #completewith next
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >>前往费尔石
    .train 398196,1
step << Rogue
    #season 2
    .goto Teldrassil,77.86,61.66
    >>击杀|cRXP_ENEMY_邪恶劣魔|r和|cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_影魂劣魔|r. 击败它们后可获得 |T134327:0|t[|cRXP_LOOT_Bottom-Left Map Piece]|r
    .collect 208604,1 -- Bottom-Left Map Piece (1)
    .mob Vicious Grell
    .mob Rascal Sprite
    .mob Shadow Sprite
    .train 398196,1
step << Rogue
    #season 2
    .goto Teldrassil,61.2,67.0
    >>击杀|cRXP_ENEMY_林精|r. 击杀后搜刮, 获取 |T134327:0|t[|cRXP_LOOT_右上方地图碎片]|r
    .collect 208601,1 -- Top-Right Map Piece (1)
    .mob Timberling
    .mob Timberling Bark Ripper
    .mob Timberling Trampler
    .train 398196,1
step << Rogue
    #season 2
    .goto Teldrassil,46.8,54.6,60,0
    .goto Teldrassil,44.2,59.2
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
    .goto Teldrassil,37.8,43.0,60,0
    .goto Teldrassil,36.0,34.4,60,0
    .goto Teldrassil,34.6,28.8,60,0
    .goto Teldrassil,37.8,43.0
    >>击杀或 |T133644:0|t[扒窃]|cRXP_ENEMY_血羽女妖|r. 击杀后搜刮出 |T134327:0|t[|cRXP_LOOT_左上地图碎片]|r
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
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 暗影屠戮 - 1(艾尔文森林)
#displayname Slaughter from the Shadows

step << Rogue
    #season 2
    .goto Elwynn Forest,46.122,62.937,5,0
    .goto Elwynn Forest,46.175,62.124
    >>|cRXP_WARN_利用屋外的木箱, 跳上屋顶, 跑到烟囱后面|r
    >>打开|cRXP_PICK_Rusty Lockbox|r(生锈的锁箱). 将其打开后获得 |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r]
    .collect 203993,1 -- Rune of Slaughter (1)
    .train 424992,1
step << Rogue
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r]|cRXP_WARN_来训练|r|T236280:0|t[暗影屠杀]
    .use 203993
    .itemcount 203993,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 暗影屠戮 - 1(丹莫洛)
#displayname Slaughter from the Shadows

step << Rogue
    #season 2
    .goto Dun Morogh,47.658,51.706,5,0
    .goto Dun Morogh,47.160,52.335,5,0
    .goto Dun Morogh,46.917,51.995
    >>|cRXP_WARN_爬上卡拉诺斯旅店的屋顶, 然后跳到那个巨大的酒桶上, 接着沿箭头指示前进|r
    >>打开|cRXP_PICK_Rusty Lockbox|r(生锈的锁箱). 将其打开后获得 |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r]
    .collect 203993,1 -- Rune of Slaughter (1)
    .train 424992,1
step << Rogue
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r]|cRXP_WARN_来训练|r|T236280:0|t[暗影屠杀]
    .use 203993
    .itemcount 203993,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 眉间之眼 - 8 (暴风城)
#displayname Between the Eyes

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
    >>|cRXP_WARN_上楼进入房屋|r
    >>打开|cRXP_PICK_Dusty Chest|r. 将其打开后获得 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_这样做会刷新两个等级为10的|cRXP_ENEMY_刀疤劫匪|r, 他们会攻击你|r
    .collect 204174,1 -- Rune of Precision (1)
    .mob Cut-throat Mugger
    .train 400081,1
step << Rogue
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_来训练|r|T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 眉间之隔 - 8(铁炉堡)
#displayname Between the Eyes

step << Rogue
    #season 2
    .goto Ironforge,51.913,13.383
    >>打开|cRXP_PICK_Dusty Chest|r. 将其打开后获得 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_这样做会刷新两个等级为10的|cRXP_ENEMY_刀疤劫匪|r, 他们会攻击你|r
    .collect 204174,1 -- Rune of Precision (1)
    .mob Cut-throat Mugger
    .train 400081,1
step << Rogue
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_来训练|r|T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 双眼之间 - 8(泰达希尔)
#displayname Between the Eyes

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
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 刀锋舞者 - 10(西部荒野)
#displayname Blade Dance

step << Rogue
    #season 2
    .goto Westfall,48.27,46.91,60,0
    .goto Westfall,46.39,37.38,60,0
    .goto Westfall,48.27,46.91
    >>|T133644:0|t[扒窃] 西部荒野各地的|cRXP_ENEMY_Defias|r. 从他们身上搜刮出 |T133463:0|t[|cRXP_LOOT_机密信封]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 209031,1 -- Discreet Envelope (1)
    .mob Defias Trapper
    .mob Defias Smuggler
    .mob Defias Looter
    .train 400099,1
step << Rogue
    #season 2
    >>打开|cRXP_PICK_Discreet Envelope|r. 从中获取 |T134237:0|t[|cRXP_LOOT_Equipment Stash Key]|r
    .collect 209030,1 -- Equipment Stash Key (1)
    .use 209031
    .itemcount 209031,1
    .train 400099,1
step << Rogue
    #season 2
    #map Westfall
    .goto 1415,40.805,80.235
    >>前往死亡矿井后门入口
    >>打开|cRXP_PICK_Equipment Stash|r. 拾取其中的 |T134419:0|t[|cRXP_FRIENDLY_剑舞符文|r]
    .collect 208771,1 -- Rune of Blade Dance (1)
    .train 400099,1
step << Rogue
    #season 2
    .train 400099 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_剑舞符文|r]|cRXP_WARN_来学习|r|T132350:0|t[剑舞]
    .use 208771
    .itemcount 208771,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 刃舞 - 16(丹莫洛)
#displayname Blade Dance

step << Rogue
    #season 2
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[扒窃] |cRXP_ENEMY_黑铁间谍|r. 偷取他们以获得 |T133875:0|t[|cRXP_LOOT_铁质宝箱]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208838,1 -- Dark Iron Lockbox (1)
    .mob Dark Iron Spy
    .train 400099,1
step << Rogue
    #season 2
    >>打开 |T133875:0|t[|cRXP_LOOT_铁质宝箱]|r, 从中获取 |T134419:0|t[|cRXP_FRIENDLY_刃舞符文|r]
    >>|cRXP_WARN_注意:你必须从训练师处习得|r|T136058:0|t[开锁术]|cRXP_WARN_才能打开它|r
    .collect 208771,1 -- Rune of Blade Dance (1)
    .itemcount 208838,1
    .train 400099,1
step << Rogue
    #season 2
    .train 400099 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_剑舞符文|r]|cRXP_WARN_来学习|r|T132350:0|t[剑舞]
    .use 208771
    .itemcount 208771,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 剑舞 - 16(暗礁海岸)
#displayname Blade Dance

step << Rogue
    #season 2
    #completewith learnBD
    .goto Darkshore,55.106,33.621,30 >>进入悬崖之春纳迦洞穴
    .train 400099,1
step << Rogue
    #season 2
    .goto Darkshore,56.253,34.877
    >>击杀|cRXP_ENEMY_雷鳞海妖|r和|cRXP_ENEMY_雷鳞御浪者|r. 击败它们后可获得 |T134242:0|t[|cRXP_LOOT_Cliffspring Key]|r
    .collect 211471,1 -- Cliffspring Key (1)
    .mob Stormscale Wave Rider
    .mob Stormscale Siren
    .train 400099,1
step << Rogue
    .goto Darkshore,56.253,34.877
    >>打开洞穴内的|cRXP_PICK_Clliffspring Chest|r宝箱, 从中获取 |T134419:0|t[|cRXP_FRIENDLY_剑舞符文|r]
    .collect 208771,1 -- Rune of Blade Dance (1)
    .itemcount 211471,1
    .train 400099,1
step << Rogue
    #season 2
    .train 400099 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_剑舞符文|r]|cRXP_WARN_来学习|r|T132350:0|t[剑舞]
    .use 208771
    .itemcount 208771,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 斩击 - 5(艾尔文森林)
#displayname Mutilate

step << Rogue
    #season 2
    .goto Elwynn Forest,57.5,48.2
    >>|T133644:0|t[扒窃] |cRXP_ENEMY_加瑞克·帕德弗特|r获取 |T134331:0|t[卡蒂的笔记]
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 203723,1 -- Cutty's Note (1)
    .mob Garrick Padfoot
    .train 400094,1
step << Rogue
    #season 2
    .goto Elwynn Forest,49.983,52.012
    >>与北境谷墙以南的|cRXP_FRIENDLY_Cutty|r交谈
    >>他会给你|T134419:0|t[|cRXP_FRIENDLY_残害符文|r]
    .collect 203990,1 -- Rune of Mutilation (1)
    .skipgossip
    .target Cutty
    .train 400094,1
step << Rogue
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r]
    .use 203990 -- Rune of Mutilation (1)
    .target Cutty
    .train 400094,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 斩击 - 8(丹莫洛)
#displayname Mutilate

step << Rogue
    #season 2
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_暗铁间谍|r. 击杀他们以获取 |T134331:0|t[黑鼠的笔记]
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208205,1 --Blackrat's Note (1)
    .mob Dark Iron Spy
    .train 400094,1
step << Rogue
    #season 2
    .goto Dun Morogh,57.256,45.227
    >>与|cRXP_FRIENDLY_黑鼠|r交谈以获得|T134419:0|t[|cRXP_FRIENDLY_残肢符文|r]
    .collect 203990,1
    .skipgossip
    .train 400094,1
step << Rogue
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r]
    .use 203990 -- Rune of Mutilation (1)
    .train 400094,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 剑刃斩 - 12(西部荒野)
#displayname Saber Slash

step << Rogue
    #season 2
    .goto Westfall,51.540,55.361,30,0
    .goto Westfall,51.093,54.642,30,0
    .goto Westfall,50.81,47.15,50,0
    .goto Westfall,51.093,54.642
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_Defias Scout|r获取 |T134419:0|t[|cRXP_FRIENDLY_碎裂之刃符文|r]
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208772,1 -- Rune of Saber Slash (1)
    .mob Defias Scout
    .train 424785,1
step << Rogue
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .train 424785,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 萨伯斩击 - 12(洛克莫丹)
#displayname Saber Slash

step << Rogue
    #season 2
    #completewith next
    .goto Loch Modan,41.01,12.60,50,0
    .goto Loch Modan,42.86,10.36,60,0
    .goto Loch Modan,46.20,13.15,10 >>|cRXP_WARN_前往洛克莫丹大坝的坝墙, 小心地跳到大坝中央的 ledge 上. 跟随箭头指示前进|r
    .train 424785,1
step << Rogue
    #season 2
    .goto Loch Modan,46.373,12.666
    >>打开 ledge 上的|cRXP_PICK_石匠工具箱|r, 从中获取 |T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    .collect 208772,1 -- Rune of Saber Slash (1)
    .train 424785,1
step << Rogue
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .train 424785,1
step << Rogue
    #season 2
    .goto Loch Modan,45.823,12.652
    .cast 6477 >>点击|cRXP_PICK_Escape Rope|r返回顶部
    .subzoneskip 146,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 斩击 - 1(黑暗森林)
#displayname Saber Slash

step << Rogue
    #season 2
    #completewith next
    .goto Darkshore,32.80,37.72,20 >>游到有灯塔的小岛上
    .train 424785,1
step << Rogue
    #season 2
    .goto Darkshore,32.729,37.093
    >>打开树干内的|cRXP_PICK_Lighthouse Stash|r, 从中获取 |T134419:0|t[|cRXP_FRIENDLY_斩击符文|r]
    .collect 208772,1 -- Rune of Saber Slash (1)
    .train 424785,1
step << Rogue
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .train 424785,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 暗影之击 - 2 (杜隆塔尔)
#displayname Shadowstrike


    --Rune of Shadowstrike

step << Troll/Orc
    #season 2
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .accept 77592 >>接受:悬崖之巅 << Troll
    .accept 77583 >>接受:悬崖之巅 << Orc
    .target Rwag
step
    #season 2
    .goto Durotar,43.27,69.51
    >>打开|r|cRXP_PICK_隐藏宝箱|r, 从中获取|T134419:0|t|cRXP_LOOT_[暗影之击符文]|r
    >>|cRXP_WARN_绕过|r|cRXP_ENEMY_萨科斯|r|cRXP_WARN_然后跳下去到达宝箱|r
    .collect 204795,1 --Rune of Shadowstrike (1)
    .train 400105,1
step
    #season 2
    .train 400105 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[暗影之击符文]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 暗影之击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
step << Troll/Orc
    #season 2
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .turnin 77592 >>提交任务:悬崖之巅 << Troll
    .turnin 77583 >>提交任务:悬崖之巅 << Orc
    .target Rwag
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 暗影之击 - 2 (提瑞斯法)
#displayname Shadowstrike


    --Rune of Shadowstrike

step << Undead
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
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
    >>击杀或扒窃|cRXP_ENEMY_血色信徒|r. 掠夺他们以获得|T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    .collect 204795,1 --Rune of Shadowstrike (1)
    .mob Scarlet Convert
    .train 400105,1
step
    #season 2
    .train 400105 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[暗影之击符文]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 暗影之击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
step << Undead
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 77669 >>交还血色符文
    .target David Trias
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 致命之酿 - 25(银松森林)
#displayname Deadly Brew


    --Rune of Deadly Brew

step
    #season 2
    .goto Silverpine Forest,47.12,71.01
    >>点击银松森林中的“Dead Drop”标记
    .accept 78261 >>接任务: |cRXP_WARN_谢尔索斯号角|r
step
    #season 2
    #completewith next
    .zone 209 >>进入影牙城堡
    >>|cRXP_WARN_你必须单独完成下一部分！组队将无法获得所需的钥匙|r
step << Horde
    #season 2
    .gossipoption 96495,1 >>潜行通过|cRXP_ENEMY_雷希戈尔|r, 与|cRXP_FRIENDLY_亡灵哨兵阿达曼特|r交谈, 随后使用 |T132331:0|t[消失] 技能. 他会为你打开门
    .target Deathstalker Adamant
    .train 400080,1
step << Alliance
    #season 2
    .gossipoption 96494 >>潜行绕过|cRXP_ENEMY_雷希戈尔|r, 与|cRXP_FRIENDLY_巫师阿克鲁比|r交谈, 随后使用 |T132331:0|t[消失]. 他会为你打开门
    .target Sorcerer Ashcrombe
    .train 400080,1
step
    #season 2
    #completewith next
    >>对|cRXP_ENEMY_Gemela|r使用 |T133644:0|t[扒窃], 获得 |T134243:0|t[|cRXP_LOOT_姐妹的半钥匙|r]
    >>|cRXP_WARN_她位于底层餐厅|r
    .collect 210213,1 --Sister's Half-Key (1)
    .mob Gemela
step
    #season 2
    >>对|cRXP_ENEMY_Gefell|r使用 |T133644:0|t[扒窃], 获得 |T134244:0|t[|cRXP_LOOT_兄弟的半钥匙|r]
    >>|cRXP_WARN_他位于二楼餐厅上方|r
    .collect 210212,1 --Brother's Half-Key (1)
    .mob Gefell
    .train 400080,1
step
    #season 2
    >>对|cRXP_ENEMY_Gemela|r使用 |T133644:0|t[扒窃], 获得 |T134243:0|t[|cRXP_LOOT_姐妹的半钥匙|r]
    >>|cRXP_WARN_她位于底层餐厅|r
    .collect 210213,1 --Sister's Half-Key (1)
    .mob Gemela
    .train 400080,1
step
    #season 2
    .use 210212 >>返回外面的庭院, 进入马厩. 将两把钥匙合成为 |T237379:0|t[|cRXP_LOOT_Twin Key|r]
    .collect 210209,1 --Twin Key (1)
    .train 400080,1
step
    #season 2
    >>在马厩中打开装饰箱, 以获得泽尔索斯之 horn
    .complete 78261,1 --Horn of Xelthos (1)
step
    #season 2
    .goto Silverpine Forest,47.114,70.974
    >>点击银松森林中的“Dead Drop”标记
    .turnin 78261 >>交任务: |cRXP_FRIENDLY_谢尔索斯号角|r
step
    #season 2
    #completewith next
    +|cRXP_WARN_你现在需要进入一座主城才能收取来自 *C* 的邮件|r
    .train 400080,1
step << Horde
    #season 2
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与卡拉斯交谈(|cRXP_FRIENDLY_Karos|r)
    .fly Undercity >>飞往幽暗城
    .target Karos Razok
    .zoneskip Undercity
    .train 400080,1
step << Alliance
    >>前往南海镇
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达尔拉·哈瑞斯|r交谈
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
    +|cRXP_WARN_收到 *C* 的邮件后, 请打开邮箱查阅. 准备就绪后, 飞回银松森林|r << Horde
    +|cRXP_WARN_收到*C*的邮件后, 请打开邮箱查看. 随后飞回南海镇, 准备就绪后前往银松森林|r << Alliance
step << Horde
    #season 2
    .goto Undercity,63.27,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fly The Sepulcher>>飞往瑟伯切尔
    .target Michael Garrett
    .zoneskip Silverpine Forest
    .train 400080,1
step << Alliance
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fly Southshore >>飞往南海镇
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
    >>点击银松森林中的|cRXP_PICK_Dead Drop|r以获得 |T134419:0|t[|cRXP_FRIENDLY_致命酿造符文|r]
    .collect 203994,1 --Rune of Deadly Brew (1)
    .train 400080,1
step
    #season 2
    .train 400080 >>使用 |T134419:0|t[|cRXP_FRIENDLY_致命酿造符文|r]
    .use 204795
    .itemcount 204795,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 快枪手 - 10 (杜隆塔尔)
#displayname Quick Draw


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
    >>击杀或使用 |T133644:0|t[扒窃] 对 |cRXP_ENEMY_库尔提拉斯水手|r和 |cRXP_ENEMY_库尔提拉斯水兵|r. 搜刮他们以获得 |T134327:0|t[|cRXP_LOOT_右上角地图碎片|r]
    .collect 207109,1 --Top-Right Map Piece (1)
    .mob Kul Tiras Sailor
    .mob Kul Tiras Marine
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
    >>击杀或使用 |T133644:0|t[扒窃] 对|cRXP_ENEMY_钢鬃野猪人|r和|cRXP_ENEMY_钢鬃斥候|r. 掠夺他们可获得 |T134327:0|t[|cRXP_LOOT_右下地图碎片|r]
    .collect 207107,1 --Bottom-Right Map Piece (1)
    .mob Razormane Quilboar
    .mob Razormane Scout
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
    >>击杀或使用 |T133644:0|t[扒窃] 对|cRXP_ENEMY_Hexed Trolls|r(妖术巨魔)和|cRXP_ENEMY_Voodoo Trolls|r(巫毒巨魔). 掠夺他们可获得 |T134327:0|t[|cRXP_LOOT_左下地图碎片|r]
    .collect 207106,1 --Bottom-Left Map Piece (1)
    .mob Hexed Troll
    .mob Voodoo Troll
    .train 400095,1
step
    #completewith next
    .goto Durotar,55.12,10.10,60 >>前往骷髅石
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
    >>击杀或使用 |T133644:0|t[扒窃] 对|cRXP_ENEMY_燃烧之刃兽人|r. 搜刮他们以获得 |T134327:0|t[|cRXP_LOOT_左上地图碎片|r]
    .collect 207108,1 --Top-Left Map Piece (1)
    .mob Burning Blade Thug
    .mob Burning Blade Fanatic
    .mob Burning Blade Apprentice
    .train 400095,1
step
    #season 2
    .use 207108 >>使用 |T134327:0|t[|cRXP_LOOT_地图碎片|r] 来制作 |T134269:0|t[|cRXP_LOOT_杜隆塔尔宝藏地图|r]
    .collect 207110,1 --Durotar Treasure Map (1)
    .train 400095,1
step
    #season 2
    .goto Durotar,62.14,94.66
    .use 207110 >>使用 |T134269:0|t[|cRXP_LOOT_杜隆塔尔藏宝图|r] 在最南端的回音岛上
    >>拾取生成的|cRXP_PICK_Buried Treasure|r宝箱, 该宝箱会掉落 |T134419:0|t[|cRXP_FRIENDLY_Rune of Quick Draw|r]
    .collect 203991,1 --Rune of Quick Draw (1s)
    .train 400095,1
step
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_迅捷拔枪符文|r]|cRXP_WARN_来训练|r|T134536:0|t[迅捷拔枪]
    .use 203991
    .itemcount 203991,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 快速拔枪 - 10(提瑞斯法)
#displayname Quick Draw


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
    >>击杀或使用 |T133644:0|t[扒窃] 对 |cRXP_ENEMY_提瑞斯法农夫|r和 |cRXP_ENEMY_提瑞斯法雇农|r. 掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_左上角地图碎片|r]
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
    >>击杀或使用 |T133644:0|t[扒窃] 对 |cRXP_ENEMY_血色战士|r . 搜刮他们以获得 |T134327:0|t[|cRXP_LOOT_右上地图碎片|r ]
    >>|cRXP_WARN_提瑞斯法林地的任意血色人类生物都有可能掉落地图碎片|r
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
    >>击杀或使用 |T133644:0|t[扒窃] 对|cRXP_ENEMY_腐皮豺狼人|r. 搜刮他们以获得 |T134327:0|t[|cRXP_LOOT_左下地图碎片|r]
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
    >>击杀或使用 |T133644:0|t[扒窃] 对|cRXP_ENEMY_鱼人|r. 掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_右下地图碎片|r]
    .collect 208037,1 --Bottom-Right Map Piece (1)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .train 400095,1
step
    #season 2
    .use 208036 >>使用 |T134327:0|t[|cRXP_LOOT_地图碎片|r] 制作 |T134269:0|t[|cRXP_LOOT_提瑞斯法宝藏地图|r]
    .collect 208034,1 --Tirisfal Treasure Map (1)
    .train 400095,1
step
    #season 2
    .goto Tirisfal Glades,52.89,54.03
    .use 208034 >>使用桥下的|T134269:0|t[|cRXP_LOOT_提瑞斯法宝藏地图|r]
    >>拾取生成的|cRXP_PICK_Buried Treasure|r宝箱, 该宝箱会掉落 |T134419:0|t[|cRXP_FRIENDLY_Rune of Quick Draw|r]
    .collect 203991,1 --Rune of Quick Draw (1s)
    .train 400095,1
step
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_迅捷拔枪符文|r]|cRXP_WARN_来训练|r|T134536:0|t[迅捷拔枪]
    .use 203991
    .itemcount 203991,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 暗影屠戮 - 10 (杜隆塔尔)
#displayname Slaughter from the Shadows


    --Rune of Slaughter from the Shadows

step
    #completewith next
    .goto Durotar,54.25,27.64,40 >>前往尘风洞以东的跳跃点
step
    #season 2
    .goto Durotar,54.25,27.64,40,0
    .goto Durotar,53.74,27.14
    >>掠夺|cRXP_PICK_Rusty Lockbox|r以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Slaughter|r]
    >>|cRXP_WARN_你需要跳一小下才能拿到箱子|r
    .collect 203993,1 --Rune of Slaughter (1)
    .train 42992,1
step
    #season 2
    .train 42992 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r]|cRXP_WARN_来训练|r|T236280:0|t[暗影屠杀]
    .use 203993
    .itemcount 203993,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 暗影屠戮 - 10(提瑞斯法)
#displayname Slaughter from the Shadows


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
    >>击杀|cRXP_ENEMY_哀嚎的鬼魂|r和 |cRXP_ENEMY_腐烂的古尸|r. 击败它们后, 可获得一个 |T134245:0|t[|cRXP_LOOT_遗物宝箱钥匙|r]
    >>|cRXP_WARN_小心！此墓穴中的怪物会动态刷新！|r
    .collect 208005,1 --Agamand Relic Coffer Key (1)
    .mob Wailing Ancestor
    .mob Rotting Ancestor
    .train 42992,1
step
    #season 2
    .goto Tirisfal Glades,52.53,26.91
    >>打开|cRXP_PICK_古物宝库|r获取 |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r]
    .collect 203993,1 --Rune of Slaughter (1)
    .train 42992,1
step
    #season 2
    .train 42992 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r]|cRXP_WARN_来训练|r|T236280:0|t[暗影屠杀]
    .use 203993
    .itemcount 203993,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 撕裂 — 8 (提瑞斯法)
#displayname Mutilate


    --Rune of Mutilate

step
    #season 2
    .goto Tirisfal Glades,51.17,67.81
    >>对|cRXP_ENEMY_派瑞恩队长|r 使用 |T133644:0|t[扒窃], 可获得 |T133385:0|t[|cRXP_LOOT_猩红副官指环|r ]
    .collect 208085,1 --Scarlet Lieutenant Signet Ring (1)
    .mob Captain Perrine
    .train 400094,1
step
    #season 2
    #completewith next
    .goto Tirisfal Glades,60.90,51.49,10 >>前往布瑞尔议政厅
step
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    .use 208085 >>使用 |T133385:0|t[|cRXP_LOOT_猩红中尉印章戒指|r] 制作 |T134328:0|t[|cRXP_LOOT_伪造的猩红备忘录|r]
    .collect 208086,1 --Forged Scarlet Memorandum (1)
    .train 400094,1
step
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加米尔·诺瑞|r交谈, 从她那里获得|T134419:0|t[|cRXP_FRIENDLY_残肢符文|r]
    .collect 203990,1 --Rune of Mutilation (1)
    .target Jamie Nore
    .skipgossip
    .train 400094,1
step
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r]|cRXP_WARN_来训练|r|T132304:0|t[撕裂]
    .use 203990
    .itemcount 203990,1


]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 撕裂 — 10(杜隆塔尔)
#displayname Mutilate


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
    >>对|cRXP_ENEMY_火刃暴徒|r使用 |T133644:0|t[扒窃] 获取 |T134331:0|t[|cRXP_LOOT_巴索的便条|r]
    .collect 207098,1 --Note from Ba'so (1)
    .mob Burning Blade Thug
    .train 400094,1
step
    .goto Durotar,51.82,58.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ba'so|r对话, 以获得|T134419:0|t[|cRXP_FRIENDLY_残虐符文|r]
    >>|cRXP_WARN_他已潜行！|r
    .collect 203990,1 --Rune of Mutilation (1)
    .target Ba'so
    .skipgossip
    .train 400094,1
step
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r]|cRXP_WARN_来训练|r|T132304:0|t[撕裂]
    .use 203990
    .itemcount 203990,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 双眼之间 - 8(提瑞斯法)
#displayname Between the Eyes


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
    >>对|cRXP_ENEMY_邪鳍鱼人|r使用 |T133644:0|t[扒窃], 获得 |T134241:0|t[|cRXP_LOOT_沉船宝箱钥匙|r]
    .collect 208007,1 --Shipwreck Cache Key (1)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .train 400081,1
step
    #season 2
    .goto Tirisfal Glades,66.66,24.41
    >>掠夺|cRXP_PICK_沉船宝箱|r以获得 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 204174,1 --Rune of Precision (1)
    .train 400081,1
step
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_来训练|r|T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1


]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 眉间之眼 - 8(奥格瑞玛)
#displayname Between the Eyes


    --Rune of Between the Eyes

step
    #season 2
    .goto Orgrimmar,55.87,44.89
    >>从|cRXP_PICK_Dusty Chest|r中获取|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_它位于暗巷区的上层|r
    .collect 204174,1 --Rune of Precision (1)
    .train 400081,1
step
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_来训练|r|T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1


]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 剑舞 - 15(荒芜之地)
#displayname Blade Dance


    --Rune of Blade Dance

step
    #season 2
    .goto The Barrens,64.40,44.09,50,0
    .goto The Barrens,63.62,46.26,50,0
    .goto The Barrens,64.23,47.10
    >>对|cRXP_ENEMY_南海歹徒|r使用 |T133644:0|t[扒窃], 获得 |T132761:0|t[|cRXP_LOOT_海盗火柴盒|r]
    .collect 208768,1 --Buccaneer's Matchbox (1)
    .mob Southsea Brigand
    .train 400099,1
step
    #season 2
    .goto The Barrens,61.82,45.80
    >>点击火药桶. 拾取生成的|r|cRXP_PICK_Southsea战利品箱|r, 它会掉落|r|T134419:0|t[|cRXP_FRIENDLY_剑舞符文|r]
    .collect 208771,1 --Rune of Blade Dance (1)
    .train 400099,1
step
    #season 2
    .train 400099 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_剑舞符文|r]|cRXP_WARN_来学习|r|T132350:0|t[剑舞]
    .use 208771
    .itemcount 208771,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 斩击 - 15 (贫瘠之地)
#displayname Saber Slash


    --Rune of Saber Slash

step
    #season 2
    #completewith next
    +|cRXP_WARN_你的开锁技能至少需达到80, 才能获得此符文！|r
    .skill pick lock,>80,1
step
    #season 2
    .goto The Barrens,62.31,54.22
    >>在马厩顶部掠夺|cRXP_PICK_马厩手的箱子|r, 获得 |T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    >>|cRXP_WARN_向上跑上山丘, 跳到城堡墙上. 从那里可以跳上马厩顶部|r
    .collect 208772,1 --Rune of Saber Slash (1)
    .train 424984,1
step
    #season 2
    .train 424984 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_斩击符文|r]|cRXP_WARN_来训练|r|T132375:0|t[斩击]
    .use 208772
    .itemcount 208772,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 萨伯斩击 - 15 (银松森林)
#displayname Saber Slash

    --Rune of Saber Slash

step
    #season 2
    .goto Silverpine Forest,45.25,68.06,20,0
    .goto Silverpine Forest,45.26,67.21
    >>在影牙城堡入口旁搜刮生锈的箱子, 获得[斩击符文]
    >>|cRXP_WARN_使用|r|T132307:0|t[冲刺]|cRXP_WARN_然后从桥上跳向宝箱|r
    .collect 208772,1 --Rune of Saber Slash (1)
    .train 424984,1
step
    #season 2
    .train 424984 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_斩击符文|r]|cRXP_WARN_来训练|r|T132375:0|t[斩击]
    .use 208772
    .itemcount 208772,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#displayname Shadowstep
#name 暗影步 - 30(银松森林)

step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .train 400101,1
    >>点击地面上的|cRXP_PICK_Dead Drop|r任务宝箱
    .goto Silverpine Forest,47.114,70.974
    .accept 78676 >>接受博斯卡之眼
step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    >>|cRXP_WARN_打开|r|cRXP_PICK_补给柜|r|cRXP_WARN_在马厩内获取|r|T132665:0|t[猩红新兵制服]
    .goto Tirisfal Glades,81.2,32.12
    .collect 210955,1
    .train 400101,1
step
    #completewith next
    .goto Eastern Kingdoms,47.44,19.69,10,0
    .goto Eastern Kingdoms,47.73,19.39,5 >>进入血色修道院:|cRXP_WARN_Graveyard|r地下城|cRXP_WARN_ALONE|r
step
    >>对一名|cRXP_ENEMY_血色占卜师|r使用 |T133644:0|t[扒窃], 以获得 |T134241:0|t[预言者之钥]
    >>|cRXP_WARN_利用|r|T132289:0|t[分散注意力]|cRXP_WARN_以避免被发现|r
    .goto Eastern Kingdoms,47.73,19.39
    .collect 210963,1
    .mob Scarlet Scryer
    .train 400101,1
step
    #completewith next
    .goto Eastern Kingdoms,47.79,19.59,5 >>进入血色修道院:|cRXP_WARN_Library|r地下城|cRXP_WARN_ALONE|r
step
    #completewith next
    +|cRXP_WARN_跑到最后一个Boss前的走廊里|r
step
    >>拾取左侧的|cRXP_PICK_Personal Letterbox|r以获得 |T134331:0|t[|cRXP_LOOT_Confidential Message|r]
    .use 210955 >>|cRXP_WARN_使用|r|T132665:0|t[猩红入门者制服]|cRXP_WARN_使NPC变为中立|r
    .goto Eastern Kingdoms,47.79,19.59
    .collect 210967,1
    .train 400101,1
step
    #completewith next
    .goto Eastern Kingdoms,47.73,19.39,5 >>进入血色修道院:|cRXP_WARN_Graveyard|r地下城|cRXP_WARN_ALONE|r
step
    >>|cRXP_WARN_前往地牢内的室外区域, 在左右两侧雕像之间寻找一张长凳|r
    *|cRXP_WARN_On both sides|r use /sit (doable while in stealth) on the benches until the emote |cRXP_WARN_"You hear the sound of stone moving"|r appears in chat.
    *Afterwards go to the Tomb next to |cRXP_WARN_the right wall|r and open the |cRXP_PICK_Stone Coffer|r for the |T134242:0|t[Reliquary Key]
    .goto Eastern Kingdoms,47.79,19.59
    .collect 210968,1
    .train 400101,1
step
    #completewith next
    .goto Eastern Kingdoms,47.79,19.59,5 >>进入血色修道院:|cRXP_WARN_Library|r地下城|cRXP_WARN_ALONE|r
step
    #completewith next
    +|cRXP_WARN_前往“珍宝画廊”|r
step
    >>在左侧第一个房间中拾取上锁的圣物箱, 获得[博斯卡之眼]
    .use 210955 >>|cRXP_WARN_使用|r|T132665:0|t[猩红入门者制服]|cRXP_WARN_使NPC变为中立|r
    .goto Eastern Kingdoms,47.79,19.59
    .complete 78676,1 --1/1 Eye of Bhossca
    .train 400101,1
step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .train 400101,1
    >>点击地面上的|cRXP_PICK_Dead Drop|r任务宝箱
    .goto Silverpine Forest,47.1,71.1
    .turnin 78676 >>交还博斯卡之眼
step
    #completewith next
    +|cRXP_WARN_你现在需要进入一座主城才能收取来自 *C* 的邮件|r
    .train 400101,1
step << Horde
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与卡拉斯交谈(|cRXP_FRIENDLY_Karos|r)
    .fly Undercity >>飞往幽暗城
    .target Karos Razok
    .zoneskip Undercity
    .train 400101,1
step << Alliance
    >>前往南海镇
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达尔拉·哈瑞斯|r交谈
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
    +|cRXP_WARN_收到 *C* 的邮件后, 请打开邮箱查阅. 准备就绪后, 飞回银松森林|r << Horde
    +|cRXP_WARN_收到*C*的邮件后, 请打开邮箱查看. 随后飞回南海镇, 准备就绪后前往银松森林|r << Alliance
step << Horde
    .goto Undercity,63.27,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fly The Sepulcher>>飞往瑟伯切尔
    .target Michael Garrett
    .zoneskip Silverpine Forest
    .train 400101,1
step << Alliance
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fly Southshore >>飞往南海镇
    .target Gryth Thurden
    .zoneskip Silverpine Forest
    .train 400101,1
step << Alliance
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
    .train 400101,1
step
    .goto Silverpine Forest,47.114,70.974
    >>点击|cRXP_PICK_Dead Drop|r宝箱获取 |T134419:0|t[|cRXP_FRIENDLY_影遁符文|r]
    .collect 210979,1 --Rune of Shadowstep (1)
    .train 400101,1
step
    .train 400101 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_影遁符文|r]|cRXP_WARN_学习|r|T132303:0|t[影遁]
    .use 210979
    .itemcount 210979,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 手里剑投掷 - 30(悲伤沼泽)
#displayname Shuriken Toss

step
    .train 400096,1
    .train 1842 >>|cRXP_WARN_你必须先学会|r|T136162:0|t[解除陷阱]|cRXP_WARN_才能获得|r|T134419:0|t[|cRXP_FRIENDLY_刺客符文|r]
    .collect 5060,1 >>|cRXP_WARN_您还需要|r|T134065:0|t[盗贼工具]
step
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
step
    .goto Swamp of Sorrows,41.48,29.97
    .train 400096,1
    .cast 1842 >>|cRXP_WARN_施放|r|T136162:0|t[解除陷阱]|cRXP_WARN_在|r|cRXP_PICK_飞镖陷阱|r|cRXP_WARN_上的树|r
step
    .goto Swamp of Sorrows,42.76,30.77
    >>掠夺为|T134419:0|t[|cRXP_FRIENDLY_刺客之符|r]|r生成的|cRXP_PICK_显眼宝箱|r
    .collect 213139,1
step
    .itemcount 213139,1
    .use 213139
    .train 400096 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_刺客符文|r]|cRXP_WARN_来学习|r|T132330:0|t[飞镖投掷]
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#name 隐秘大师 - 34(荆棘谷)
#displayname Master of Subtlety

step
    .train 425103,1
    .skill lockpicking,125 >>|cRXP_WARN_你必须将你的|r|T136058:0|t[开锁]|cRXP_WARN_等级提升至至少125级, 才能获得|r|T132299:0|t[隐秘大师]|cRXP_WARN_符文|r
step
    .train 425103,1
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
step
    .train 425103,1
    #completewith Uniform
    .goto Stranglethorn Vale,46.30,7.61,30 >>进入储藏室(库尔岑的洞穴)
step
    .train 425103,1
    #completewith next
    >>对|cRXP_ENEMY_库尔森精英|r和|cRXP_ENEMY_库尔森副首领|r使用 |T133644:0|t[扒窃], 以获取|cRXP_LOOT_合成笼子钥匙|r
    .collect 216616,1
    .mob Kurzen Elite
    .mob Kurzen Subchief
step
    #label Uniform
    .train 425103,1
    .goto Stranglethorn Vale,49.616,7.743
    >>打开|cRXP_PICK_Kurzen 补给箱|r, 从中获取|cRXP_LOOT_Kurzen 战士制服|r
    .collect 216617,1
step
    .train 425103,1
    .goto Stranglethorn Vale,49.943,3.953,40,0
    .goto Stranglethorn Vale,49.617,7.562,40,0
    .goto Stranglethorn Vale,49.25,6.18
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_库尔森精英|r和 |cRXP_ENEMY_库尔森副首领|r, 获取 |cRXP_LOOT_Compound Cage Key|r
    .collect 216616,1
    .mob Kurzen Elite
    .mob Kurzen Subchief
step
    .train 425103,1
    #completewith next
    .goto Stranglethorn Vale,44.261,7.908,60 >>离开洞穴, 前往塔楼中位于外面的|cRXP_FRIENDLY_Wendel Mathers|r
step
    .train 425103,1
    .goto Stranglethorn Vale,44.261,7.908
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔楼中的|cRXP_FRIENDLY_温德尔·马瑟斯|r交谈
    >>|cRXP_WARN_他的刷新时间大约为3分钟|r
    .destroy 216616 >>将|cRXP_LOOT_Compound Cage Key|r交给他
    .destroy 216617 >>把|cRXP_LOOT_Kurzen 战士制服|r交给他
    .skipgossip 218230,1
    .target Wendel Mathers
step
    .train 425103,1
    #completewith next
    .subzone 35 >>前往藏宝海湾
step
    .train 425103,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Captain Aransas|r交谈
    >>她会给你 |T133640:0|t[|cRXP_LOOT_阿兰萨斯上尉的奖励|r]
    .goto Stranglethorn Vale,27.681,76.648
    .skipgossip
    .collect 216618,1
    .target Captain Aransas
step
    .train 425103,1
    .use 216618 >>打开 |T133640:0|t[|cRXP_LOOT_阿兰纳斯队长的奖励|r] 即可获得 |T134419:0|t[|cRXP_FRIENDLY_隐匿符文|r] 和 |T338666:0|t[|cRXP_FRIENDLY_贾尼的饰品|r]
    >>|cRXP_WARN_请勿摧毁|r|T338666:0|t[|cRXP_FRIENDLY_Jani's Charm|r]|cRXP_WARN_因为它用于收集未来的符文|r
    .collect 213136,1
step
    .itemcount 213136,1
    .use 213136
    .train 425103 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_潜行符文|r]|cRXP_WARN_来训练|r|T132299:0|t[潜行大师]
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#displayname Rolling with the Punches
#name 迎难而上 - 27(千针石林)


step
    #optional
    .train 400093,1
    .skill lockpicking,45 >>|cRXP_WARN_你必须将你的|r|T136058:0|t[开锁]|cRXP_WARN_等级提升至至少45级, 才能获得|r|T134919:0|t[随波逐流]|cRXP_WARN_符文|r
step
    .train 400093,1
    #completewith next
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
step
    .train 400093,1
    #completewith next
    .goto Thousand Needles,18.44,21.58,10 >>进入埃托克营地的大帐篷
step
    .train 400093,1
    .goto Thousand Needles,18.686,21.126
    >>打开|cRXP_PICK_Sizable 失窃的大型保险箱|r. 将其开启, 获得 |T132597:0|t[|cRXP_LOOT_Large 强力保险箱|r]
    .collect 215451,1
step
    .train 400093,1
    .cast 1804 >>|cRXP_WARN_使用|r|T136058:0|t[撬锁]|cRXP_WARN_对|r|T132597:0|t[|cRXP_LOOT_大型保险箱|r]|cRXP_WARN_进行解锁|r
    .usespell 1804
    .use 215451
step
    .train 400093,1
    .use 215451 >>打开 |T132597:0|t[|cRXP_LOOT_Large Strongbox|r], 拾取其中的 |T132597:0|t[|cRXP_LOOT_Medium Strongbox|r]
    .collect 215452,1
step
    .train 400093,1
    .cast 1804 >>|cRXP_WARN_使用|r|T136058:0|t[撬锁]|cRXP_WARN_对|r|T132597:0|t[|cRXP_LOOT_中型保险箱|r]|cRXP_WARN_进行解锁|r
    .usespell 1804
    .use 215452
step
    .train 400093,1
    .use 215452 >>打开 |T132597:0|t[|cRXP_LOOT_Medium Strongbox|r], 将其开启以获得 |T132597:0|t[|cRXP_LOOT_Small Strongbox|r]
    .collect 215453,1
step
    .train 400093,1
    .cast 1804 >>|cRXP_WARN_使用|r|T136058:0|t[撬锁]|cRXP_WARN_对|r|T132597:0|t[|cRXP_LOOT_小型保险箱|r]|cRXP_WARN_进行解锁|r
    .usespell 1804
    .use 215453
step
    .train 400093,1
    .use 215453 >>打开 |T132597:0|t[|cRXP_LOOT_小型保险箱|r], 从中获取 |T134419:0|t[|cRXP_FRIENDLY_左撇子符文|r]
    .collect 213138,1
step
    .itemcount 213138,1
    .use 213138
    .train 400093 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_左撇子符文|r]|cRXP_WARN_来训练|r|T134919:0|t[随波逐流]
]])

 RXPGuides.RegisterGuide([[
 #classic
 << Rogue SoD
 #group RestedXP 符文与书籍指南
 #subgroup 头盔
 #displayname Focused Attacks
 #name 集中攻击 - 34(荒野之地)

 step
    >>|cRXP_WARN_你需要|r|T136175:0|t[致盲] |cRXP_WARN_和|r|T133587:0|t[无用的致盲粉] |cRXP_WARN_才能获得|r|T236274:0|t[集中攻击] |cRXP_WARN_符文|r
    .train 2094 >>火车 |T136175:0|t[盲]
    .collect 5530,1 -- Blinding Powder 1/1
    .train 432291,1
step
    #completewith next
    .zone The Hinterlands >>前往: |cRXP_PICK_辛特兰|r
step
    .goto The Hinterlands,72.76,52.91
    >>对|cRXP_ENEMY_Vilebranch Mask|r施放 |T136175:0|t[致盲], 然后拾取|cRXP_PICK_Treasure of the Bat|r宝箱以获得 |T134419:0|t[|cRXP_FRIENDLY_专注符文|r]
    .collect 221433,1 -- rune of focus
    .mob Vilebranch Mask
    .train 432291,1
step
    .itemcount 221433,1
    .use 221433
    .train 432291 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_专注符文|r]|cRXP_WARN_来训练|r|T236274:0|t[专注攻击]
 ]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Unfair Advantage
#name 不公平优势 - 40(塔纳利斯)

step
    .train 921 >>|cRXP_WARN_你需要训练|r|T133644:0|t[扒窃]|cRXP_WARN_以获得|r|T236285:0|t[不公平优势]|cRXP_WARN_符文|r
    .train 432301,1
step
    #completewith CoinPurse
    .zone Tanaris >>|cRXP_WARN_前往: |cRXP_PICK_塔纳利斯|r|r
step
    #completewith next
    .subzone 1336 >>前往失落的拉格里湾
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
    >>|cRXP_WARN_施放|r|T133644:0|t[扒窃], |cRXP_WARN_目标: |r|cRXP_ENEMY_南海海盗|r|cRXP_WARN_和|r|cRXP_ENEMY_南海自由佣兵|r|cRXP_WARN_直到你获得|r|T133639:0|t|cRXP_LOOT_绑架者的钱袋|r
    .collect 221371,1 - Kidnapper's Coin Purse 1/1
    .mob Southsea Pirate
    .mob Southsea Freebooter
    .train 432301,1
step
    >>打开 |T133639:0|t|cRXP_LOOT_绑架者钱袋|r并从中获取一个 |T133302:0|t|cRXP_LOOT_珍贵勋章|r
    .collect 221370,1 -- Precious Medalion 1/1
    .use 221371
    .train 432301,1
step << Rogue
    .goto Tanaris,67,22
    .gossipoption 122303 >>与|cRXP_FRIENDLY_加贝|c|r交谈以获得|r|T134419:0|t[|cRXP_FRIENDLY_诡计符文|r]
    .collect 221428,1 -- Rune of Foul Play
    .target Jabbey
    .train 432301,1
    .itemcount 221370,1
step << Rogue
    .itemcount 221428,1
    .use 221428
    .train 432301 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_卑鄙符文|r]|cRXP_WARN_来训练|r|T236285:0|t[不公平优势]

]])
RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Carnage
#name 卡纳基 - 45(荒芜之地)

step
    #optional
    .skill lockpicking,225 >>|cRXP_WARN_你必须将你的|r|T136058:0|t[开锁] |cRXP_WARN_等级提升至至少225级, 才能获得|r|T236268:0|t[卡纳基] |cRXP_WARN_符文|r
step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
step
    #completewith next
    .goto Blasted Lands,45.27,16.52,10 >>前往恐惧嚎叫要塞前方的高塔顶端
step
    .goto Blasted Lands,45.27,16.52
    >>打开|cRXP_PICK_Abandoned Cache|r. 击杀生成的|cRXP_ENEMY_Murderous Lost One|r(等级46)
    >>掠夺它以获得 |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r]
    .collect 221461,1 -- Rune of Carnage 1/1
    .unitscan Murderous Lost One
    .train 432299,1
step
    .use 221461
    .itemcount 221461,1
    .train 432299 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r]|cRXP_WARN_来训练|r|T236268:0|t[屠杀]

]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup 头盔
#displayname Honor Among Thieves
#name 盗贼间的荣誉 - 45(艾泽拉斯)

step
    #optional
    .xp 45 >>|cRXP_WARN_你需要达到45级才能获得此符文|r
step
    #optional
    .train 400101 >>|cRXP_WARN_你必须已学会|r|T132303:0|t[暗影步]|cRXP_WARN_才能获得此符文|r
step
    #optional
    .train 400080,1 >>|cRXP_WARN_你必须已学会|r|T236270:0|t[致命药剂]|cRXP_WARN_才能获得此符文|r
step
    #optional
    #completewith letterC
    >>|cRXP_WARN_要开始这个符文的任务, 你需要先完成“拉文霍德庄园”任务, 该任务会带你认识拉文霍德盗贼阵营. 要领取此符文, 请与|r |cRXP_FRIENDLY_夜行者奥斯伯|r |cRXP_WARN_在暴风城|r |cRXP_WARN_交谈|r << Alliance
    +|cRXP_WARN_要开始这个符文的任务, 你需要先完成“拉文霍德庄园”任务, 该任务会引导你认识拉文霍德盗贼阵营. 要领取符文, 请与|r|cRXP_FRIENDLY_奥莫克|r|cRXP_WARN_于奥格瑞玛交谈|r << Horde
    .accept 6681 >>接任务: |cRXP_WARN_拉文霍德庄园|r << Alliance
    .isQuestAvailable 6681
step << Horde
    .goto Orgrimmar,43.91,54.69
    .gossipoption 96925 >>与|cRXP_FRIENDLY_奥莫克|r交谈, 以获得一封 |T133460:0|t[|cRXP_LOOT_优美的信件|r]. 使用它来接受任务
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
    >>前往|cRXP_PICK_Chest|r附近
    .complete 6681,1 --Rite of Cunning: 1/1
    .isOnQuest 6681
step
    .goto Alterac Mountains,85.51,79.41,10,0
    .goto Alterac Mountains,86.11,80.22,10,0
    .goto Alterac Mountains,84.45,80.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_法拉德|r交谈
    .turnin 6681 >>交任务: |cRXP_FRIENDLY_拉文霍德庄园|r
    .target Fahrad
    .isOnQuest 6681
step << Alliance
    +|cRXP_WARN_前往任意主城|r
    >>Darnassus
    >>Ironforge
    >>Stormwind City
    .zoneskip Darnassus
    .zoneskip Ironforge
    .zoneskip Stormwind City
    .train 432295,1
step << Horde
    +|cRXP_WARN_前往任意主城|r
    >>Undercity
    >>Thunder Bluff
    >>Orgrimmar
    .zoneskip Undercity
    .zoneskip Thunder Bluff
    .zoneskip Orgrimmar
    .train 432295,1
step
    #label letterC
    +|cRXP_WARN_查看邮箱, 获取来自*Fahrad*的信件|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_法拉德|r交谈
    .accept 80526 >>接受“愚弄我两次”任务
    .turnin 80526 >>交出“愚弄我两次”
    .accept 80411 >>接受卡兹多尔护身符
    .target Fahrad
step
    #optional
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
step
    #completewith next
    .goto Tanaris,38.69,20.20
    .subzone 1176 >>进入祖尔法拉克
    >>|cRXP_WARN_你无法组队时完成此符文的任务|r
step
    .goto Tanaris,38.69,20.20
    >>打开|cRXP_PICK_Clay Vessels|r以获得 |T134799:0|t[|cRXP_LOOT_劣尸维尔药剂|r]
    >>|cRXP_WARN_它们位于祖尔法拉克各地的巨魔帐篷中|r
    .collect 217716,2
    .train 432295,1
step
    #completewith next
    +|cRXP_WARN_朝|r|cRXP_ENEMY_Antu'sul的|r|cRXP_WARN_洞穴方向移动|r
step
    >>在坩埚上使用 |T134799:0|t[|cRXP_LOOT_劣尸维尔调制药剂|r]. |cRXP_WARN_这不会破坏你的潜行|r
    >>当Boss分心时, 拾取|cRXP_PICK_Antu'Sul's Satchel|r以获得|T133724:0|t[|cRXP_LOOT_Offering of Bone|r]
    .collect 217721,1 --Offering of Bone
    .use 217716
    .train 432295,1
step
    #completewith next
    +|cRXP_WARN_前往墓地区域, 向敌对的术士祖拉移动|r
step
    >>在|cRXP_ENEMY_Witch Doctor Zum'rah|r旁边的坩埚上使用你的第二个 |T134799:0|t[|cRXP_LOOT_劣尸维尔调制药剂|r]. |cRXP_WARN_这不会破坏你的潜行|r
    >>当他分心时, 拾取|cRXP_PICK_Zum'rahs Satchel|r获取 |T136232:0|t|cRXP_LOOT_Ward of the Dead|r
    .collect 217727,1 --ward of the dead
    .use 217716
    .train 432295,1
step
    #completewith next
    .equip 13,217727 >>装备你刚刚拾取的 |T136232:0|t|cRXP_LOOT_Ward of the Dead|r饰品
    >>|cRXP_WARN_这将揭示哪个|r|cRXP_PICK_浅墓穴|r|cRXP_WARN_需要被拾取|r
step
    >>拾取带有蓝色光环的|cRXP_PICK_浅墓穴|r, 以获得|T236304:0|t|cRXP_LOOT_肉献礼|r
    .collect 217720,1 --offering of flesh
    .use 217727
    .train 432295,1
step
    >>使用你刚刚收集的 |T236304:0|t[|cRXP_LOOT_肉之献祭|r], 与 |T133724:0|t[|cRXP_LOOT_骨之献祭|r] 合成一个 |T236305:0|t[|cRXP_LOOT_鲜血魔法精华|r]
    .collect 217719,1 --Blood Magic Essence
    .use 217720
    .train 432295,1
step
    >>前往金字塔阶梯底部, 向右查看. 在墙边会看到一块小石块, 跳上去后沿边缘行走
    >>在右侧的第二个木制阳台, 你会找到一个|cRXP_PICK_Sandfury Cache|r. 将其打开以获得 |T237274:0|t[|cRXP_LOOT_Hollow Emblem|r]
    .collect 217717,1 --Hollow Emblem
    .train 432295,1
step
    >>使用你刚拾取的 |T237274:0|t|cRXP_LOOT_Hollow Emblem|r, 将其与 |T236305:0|t[|cRXP_LOOT_Blood Magic Essence|r] 合成一个 |T133572:0|t[|cRXP_LOOT_Emblem of Blood Magic|r]
    .collect 217718,1 --Emblem of Blood Magic
    .use 217717
    .train 432295,1
step
    >>爬上金字塔顶部的楼梯, 打开|cRXP_PICK_魔法束缚战利品箱|r获取|T133313:0|t[|cRXP_LOOT_卡兹多尔护身符|r]
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_法拉德|r交谈
    .turnin 80411 >>交还卡兹多尔的护身符
    .accept 80453 >>接受最佳计划
    .target Fahrad
step
    .goto Alterac Mountains,86.0,80.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地下室的|cRXP_FRIENDLY_萨恩·刀链|r交谈
    .turnin 80453 >>提交“最佳计划”
    .accept 80454 >>接受最后一滴
    .target Zan Shivsproket
step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .goto Silverpine Forest,47.114,70.974
    >>点击|cRXP_PICK_Dead Drop|r宝箱
    .turnin 80454 >>交出最后一滴
    .accept 80455 >>接受:把握时机
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_法拉德|r交谈
    .turnin 80455 >>交还“等待时机”
    .target Fahrad
step
    .train 432295 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_小圈子符文|r]|cRXP_WARN_来训练|r|T236275:0|t[盗贼间的荣誉]
    .use 217736
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Crimson Tempest
#name 赤红风暴 - 60(西瘟疫之地)

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
    >>击杀或 |T133644:0|t[扒窃] |cRXP_ENEMY_血色工人|r . 掠夺他们以获得|cRXP_LOOT_工具箱钥匙|r
    .collect 227928,1 -- Toolbox Key 1/1
    .mob Scarlet Worker
step
    .train 415918,1
    .goto Western Plaguelands,45.0,14.2
    >>打开|cRXP_PICK_Scarlet Toolbox|r. 从中获取|cRXP_LOOT_Rusty Crowbar|r
    .collect 227932,1 -- Rusty Crowbar 1/1
step
    .goto Western Plaguelands,49.5,18.5
    >>前往壁炉谷中央塔楼的顶部. 打开那里的|cRXP_PICK_Marked Crate|r, 从中获取 |T133640:0|t[|cRXP_LOOT_Hidden Bundle|r], 然后打开它获得 |T134237:0|t[|cRXP_LOOT_Safe Box Key|r]
    .collect 227930,1
step
    .goto Western Plaguelands,46.3,14.6
    >>前往位于城市北侧壁炉谷的第二座塔楼的中层. 使用 |T134237:0|t[|cRXP_LOOT_保险箱钥匙|r] 打开 [|cRXP_PICK_Belavus的保险箱|r] 并从中获取 |T134419:0|t[|cRXP_FRIENDLY_赤红风暴符文|r]
    .collect 227456,1 --Rune of the crimson tempest
step
    .use 227456
    .itemcount 227456,1
    .train 415918 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_赤红风暴符文|r]|cRXP_WARN_来训练|r|T135315:0|t[赤红风暴]
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Fan of Knives
#name 刀扇 - 55(冬泉谷)

step
    .train 436609,1
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
step
    .train 436609,1
    .goto Winterspring,67.7,35.4
    >>打开|cRXP_PICK_木箱|r, 从中获取 |T134419:0|t[|cRXP_FRIENDLY_刀刃符文|r]
    >>|cRXP_WARN_打开|cRXP_PICK_Wooden Chest|r时, 请按以下顺序选择对应选项:|r
    >>|cRXP_WARN_Frostsaber|r
    >>|cRXP_WARN_Owl|r
    >>|cRXP_WARN_Bear|r
    >>|cRXP_WARN_Owl|r
    .collect 227921,1
step
    .use 227921
    .itemcount 227921,1
    .train 436609 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_刀刃符文|r]|cRXP_WARN_来训练|r|T236273:0|t[旋风斩]
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Blunderbuss
#name 火枪 - 60(东部瘟疫之地)

step
    .train 415922,1
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step
    .train 415922,1
    .goto Eastern Plaguelands,83,85
    >>在特里之手区域内打开血色十字军提箱, 直到你获得信号发送器
    .collect 227451,1
step
    .train 415922,1
    #completewith FinalPillar
    >>|cRXP_WARN_完成以下步骤时, 你必须按正确顺序点击四个|cRXP_PICK_Sending Pillars|r. 每次点击后, 你会被随机传送至另一个位置. 请在点击下一个之前, 确保自己已处于正确地点！|r
step
    .train 415922,1
    .goto Eastern Plaguelands,82,57
    .cast 6477,6478 >>点击第一个|cRXP_PICK_烈焰之柱|r|cRXP_WARN_在圣光之愿礼拜堂后方|r
step
    .train 415922,1
    .goto Eastern Plaguelands,40,92
    .cast 6477,6478 >>点击第二个|cRXP_PICK_Sending Pillar|r|cRXP_WARN_在达隆郡|r
step
    .train 415922,1
    .goto Eastern Plaguelands,70,34
    .cast 6477,6478 >>点击第三个|cRXP_PICK_Sending Pillar|r|cRXP_WARN_in Northdale|r
step
    .train 415922,1
    #label FinalPillar
    .goto Eastern Plaguelands,14,30
    .cast 6477,6478 >>点击第四个|cRXP_PICK_Sending Pillar|r|cRXP_WARN_在恐惧谷|r
step
    .train 415922,1
    >>|cRXP_WARN_进入房屋|r
    >>打开地面上的|cRXP_PICK_Adon's Trunk|r, 拾取其中的 |T134419:0|t[|cRXP_LOOT_浪人符文|r]
    .collect 227922,1
step
    .use 227922
    .itemcount 227922,1
    .train 415922 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_剑客符文|r]|cRXP_WARN_来训练|r|T134538:0|t[火枪]
]])