RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Shadowstrike - 3 (Elwynn Forest)
#title 暗影打击
#displayname 暗影打击 - 3（艾尔文森林）
step << Rogue
    #season 2
    .goto Elwynn Forest,52.544,51.922
    >>|cRXP_WARN_打开地上的|r|cRXP_PICK_迪菲亚储藏箱|r|cRXP_WARN_，拾取其中的|r|T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    .collect 204795,1 -- Rune of Shadowstrike (1)
    .train 400105,1
step << Rogue
    #season 2
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T132291:0|t[暗影打击]
    .use 204795
    .itemcount 204795,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Shadowstrike - 3 (Dun Morogh)
#title 暗影打击
#displayname 暗影打击 - 3（丹莫罗）
step
    #optional
    #label FrostMCave1
    #completewith Rune
    .goto 1426,27.098,80.707,20 >> 进入霜鬃洞穴
step
    #optional
    #requires FrostMCave1
    #completewith Rune
    .goto 1426,28.298,79.836,15,0
    .goto 1426,29.252,79.043,15,0
    .goto 1426,30.489,80.165,50 >> 进入洞穴寻找 |cRXP_PICK_霜鬃战利品箱|r
step
    #label Rune
    .goto Dun Morogh,30.773,80.063
    >>打开洞穴内地上的|cRXP_PICK_霜鬃战利品箱|r，从中拾取|T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    .collect 204795,1 --Rune of Shadowstrike (1)
    .train 400105,1
step
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 暗影打击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Shadowstrike - 3 (Shadowglen)
#title 暗影打击
#displayname 暗影打击 - 3（幽影谷）
step << Rogue
    #season 2
    .goto Teldrassil,57.922,40.687,25,0
    .goto Teldrassil,58.709,38.782,10,0
    .goto Teldrassil,59.15,40.66,20,0
    .goto Teldrassil,59.674,42.613
    >>|cRXP_WARN_沿着奥达希尔树上的坡道上去,然后跳到屋顶上|r
    >>|cRXP_PICK_神像|r|cRXP_WARN_ 在屋顶上|r
    >>打开 |cRXP_PICK_神像|r, 拾取 |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    >>|cRXP_WARN_如果你难以上屋顶,可以在顺着坡道跑下时尝试跳过栏杆|r
    .collect 204795,1 -- Rune of Shadowstrike (1)
    .train 400105,1
step << Rogue
    #season 2
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 暗影打击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Quick Draw - 8 (Elwynn Forest)
#title 速射
#displayname 速射 - 8（艾尔文森林）
step << Rogue
    #season 2
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9
    >>|T133644:0|t[搜索]|cRXP_ENEMY_河爪豺狼人前锋|r和|cRXP_ENEMY_矮小的河爪豺狼人|r，取得|T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    .collect 203787,1 -- Bottom-Left Map Piece (1)
    .mob 河爪豺狼人前锋
    .mob 矮小的河爪豺狼人
    .train 398196,1
step << Rogue
    #season 2
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76
    >>|T133644:0|t[搜索]|cRXP_ENEMY_狗头人矿工|r和|cRXP_ENEMY_狗头人隧道工|r，取得|T134327:0|t[|cRXP_LOOT_右上角地图碎片]|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    .collect 203784,1 -- Top-Right Map Piece (1)
    .mob 狗头人矿工
    .mob 狗头人隧道工
    .train 398196,1
step << Rogue
    #season 2
    .goto Elwynn Forest,67.4,78.6,60,0
    .goto Elwynn Forest,70.8,79.8,60,0
    .goto Elwynn Forest,89.2,78.8
    >>|T133644:0|t[搜索]|cRXP_ENEMY_迪菲亚|r成员，取得|T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    >>|cRXP_WARN_注意：此物品也可从艾尔文森林的其他|r|cRXP_ENEMY_迪菲亚|r|cRXP_WARN_成员处获得|r
    .collect 203785,1 -- Top-Left Map Piece (1)
    .mob 迪菲亚强盗
    .train 398196,1
step << Rogue
    #season 2
    .goto Elwynn Forest,75.4,85.4,60,0
    .goto Elwynn Forest,77.8,82.2,60,0
    .goto Elwynn Forest,83.2,87.0,60,0
    .goto Elwynn Forest,75.4,82.4
    >>|T133644:0|t[搜索]|cRXP_ENEMY_鱼人强盗|r和|cRXP_ENEMY_鱼人潜伏者|r，取得|T134269:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    >>|cRXP_WARN_注意：此物品也可从艾尔文森林的其他|r|cRXP_ENEMY_鱼人|r|cRXP_WARN_身上获得|r
    .collect 203786,1 -- Bottom-Right Map Piece (1)
    .mob 鱼人强盗
    .mob 鱼人潜伏者
    .mob 鱼人士兵
    .mob 鱼人
    .train 398196,1
step << Rogue
    #season 2
    .cast 401847 >>|cRXP_WARN_使用任意|r |T134327:0|t[|cRXP_LOOT_地图碎片]|r |cRXP_WARN_将其组合成|r |T134269:0|t[|cRXP_LOOT_艾尔文藏宝图|r]
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
    .cast 401617 >>|cRXP_WARN_在箭头位置使用|r |T134269:0|t[|cRXP_LOOT_艾尔文藏宝图|r] |cRXP_WARN_。这会触发一个|r|cRXP_PICK_埋藏的宝藏|r|cRXP_WARN_出现|r
    .use 203750
    .itemcount 203750,1
    .train 398196,1
step << Rogue
    #season 2
    >>打开|cRXP_PICK_埋藏的宝藏|r，拾取其中的|T134419:0|t[|cRXP_FRIENDLY_速射符文|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
step << Rogue
    #season 2
    .train 400095 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_速射符文|r] |cRXP_WARN_学习|r |T134536:0|t[速射]
    .use 203991
    .itemcount 203991,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Quick Draw - 8 (Dun Morogh)
#title 速射
#displayname 速射 - 8（丹莫罗）
step << Rogue
    #season 2
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[搜索] |cRXP_ENEMY_黑铁间谍|r。从他们身上拾取|T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    .collect 208219,1 -- Bottom-Left Map Piece (1)
    .mob 黑铁间谍
    .train 398196,1
step << Rogue
    #season 2
    .goto Dun Morogh,25.4,50.8
    >>|T133644:0|t[搜索]|cRXP_ENEMY_霜鬃巨魔|r。从他们身上拾取|T134327:0|t[|cRXP_LOOT_右上角地图碎片]|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    .collect 208213,1 -- Top-Right Map Piece (1)
    .mob 霜鬃猎头者
    .mob 霜鬃剥皮者
    .mob 霜鬃暗法师
    .train 398196,1
step << Rogue
    #season 2
    .goto Dun Morogh,70.8,56.0
    >>|T133644:0|t[搜索] |cRXP_ENEMY_石腭击颅者|r和|cRXP_ENEMY_石腭断骨者|r。拾取它们身上的|T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    .collect 208215,1 -- Top-Left Map Piece (1)
    .mob 石腭击颅者
    .mob 石腭断骨者
    .train 398196,1
step << Rogue
    #season 2
    .goto Dun Morogh,26.0,41.8
    >>|T133644:0|t[搜索]|cRXP_ENEMY_麻疯侏儒|r。从他们身上拾取|T134269:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    .collect 208218,1 -- Bottom-Right Map Piece (1)
    .mob 麻疯侏儒
    .train 398196,1
step << Rogue
    #season 2
    .cast 418600 >>|cRXP_WARN_使用任意|r |T134327:0|t[|cRXP_LOOT_地图碎片]|r |cRXP_WARN_将它们合成为|r |T134269:0|t[|cRXP_LOOT_丹莫罗藏宝图|r]
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
    .cast 418599 >>|cRXP_WARN_在小桥下使用|r |T134269:0|t[|cRXP_LOOT_丹莫罗藏宝图|r] |cRXP_WARN_，这将触发一个|r|cRXP_PICK_埋藏的宝藏|r|cRXP_WARN_出现|r
    .use 208220
    .itemcount 208220,1
    .train 398196,1
step << Rogue
    #season 2
    >>打开|cRXP_PICK_埋藏的宝藏|r，拾取其中的|T134419:0|t[|cRXP_FRIENDLY_速射符文|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
step << Rogue
    #season 2
    .train 400095 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_速射符文|r] |cRXP_WARN_学习|r |T134536:0|t[速射]
    .use 203991
    .itemcount 203991,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Quick Draw - 8 (Teldrassil)
#title 速射
#displayname 速射 - 8（泰达希尔）
step << Rogue
    #season 2
    #completewith next
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >> 前往地狱石洞穴
    .train 398196,1
step << Rogue
    #season 2
    .goto Teldrassil,54.04,51.17
    >>击杀|cRXP_ENEMY_邪恶劣魔|r、|cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_影魂劣魔|r，拾取其掉落的|T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    .collect 208604,1 -- Bottom-Left Map Piece (1)
    .mob 邪恶劣魔
    .mob 恶灵劣魔
    .mob 影魂劣魔
    .train 398196,1
step << Rogue
    #season 2
    .goto Teldrassil,61.2,67.0
    >>击杀|cRXP_ENEMY_林精|r，拾取其掉落的|T134327:0|t[|cRXP_LOOT_右上角地图碎片]|r
    .collect 208601,1 -- Top-Right Map Piece (1)
    .mob 林精
    .mob 林精碎木者
    .mob 林精践踏者
    .train 398196,1
step << Rogue
    #season 2
    .goto Teldrassil,46.8,54.6,60,0
    .goto Teldrassil,44.2,59.2
    >>击杀或|T133644:0|t[搜索]|cRXP_ENEMY_瘤背熊怪|r，拾取|T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    .collect 208602,1 -- Top-Left Map Piece (1)
    .mob 瘤背伏击者
    .mob 瘤背萨满祭司
    .mob 瘤背防御者
    .mob 瘤背占卜师
    .train 398196,1
step << Rogue
    #season 2
    .goto Teldrassil,37.8,43.0,60,0
    .goto Teldrassil,36.0,34.4,60,0
    .goto Teldrassil,34.6,28.8,60,0
    .goto Teldrassil,37.8,43.0
    >>击杀或|T133644:0|t[搜索]|cRXP_ENEMY_血羽鹰身人|r，拾取|T134327:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
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
    .cast 421425 >>|cRXP_WARN_使用任意|r |T134327:0|t[|cRXP_LOOT_地图碎片]|r |cRXP_WARN_将其组合成|r |T134269:0|t[|cRXP_LOOT_泰达希尔藏宝图|r]
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
    .zone Teldrassil >> 穿过紫色传送门前往鲁瑟兰村
    .train 398196,1
step << Rogue
    #season 2
    #completewith next
    .goto Teldrassil,55.339,90.818
    .cast 421424 >>|cRXP_WARN_在鲁瑟兰村的树干内使用|r |T134269:0|t[|cRXP_LOOT_泰达希尔藏宝图|r]|cRXP_WARN_，这将触发一个|r|cRXP_PICK_埋藏的宝物|r|cRXP_WARN_出现|r
    .use 208605
    .itemcount 208605,1
    .train 398196,1
step << Rogue
    #season 2
    >>打开|cRXP_PICK_埋藏的宝物|r，拾取其中的|T134419:0|t[|cRXP_FRIENDLY_速射符文|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
step << Rogue
    #season 2
    .train 400095 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_速射符文|r] |cRXP_WARN_学习|r |T134536:0|t[速射]
    .use 203991
    .itemcount 203991,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Slaughter from the Shadows - 1 (Elwynn Forest)
#title 暗影杀手
#displayname 暗影杀手 - 1（艾尔文森林）
step << Rogue
    #season 2
    .goto Elwynn Forest,46.122,62.937,5,0
    .goto Elwynn Forest,46.175,62.124
    >>|cRXP_WARN_利用屋外的箱子跳上屋顶，然后跑到烟囱后面|r
    >>打开|cRXP_PICK_生锈的宝箱|r，拾取|T134419:0|t[|cRXP_FRIENDLY_杀手符文|r]
    .collect 203993,1 -- Rune of Slaughter (1)
    .train 424992,1
step << Rogue
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_杀手符文|r] |cRXP_WARN_学习|r |T236280:0|t[暗影杀手]
    .use 203993
    .itemcount 203993,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Slaughter from the Shadows - 1 (Dun Morogh)
#title 暗影杀手
#displayname 暗影杀手 - 1（丹莫罗）
step << Rogue
    #season 2
    .goto Dun Morogh,47.658,51.706,5,0
    .goto Dun Morogh,47.160,52.335,5,0
    .goto Dun Morogh,46.917,51.995
    >>|cRXP_WARN_爬上卡拉诺斯旅店的屋顶，再跳上巨大的酒桶。跟随箭头前进|r
    >>打开|cRXP_PICK_生锈的宝箱|r，拾取|T134419:0|t[|cRXP_FRIENDLY_杀手符文|r]
    .collect 203993,1 -- Rune of Slaughter (1)
    .train 424992,1
step << Rogue
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_杀手符文|r] |cRXP_WARN_学习|r |T236280:0|t[暗影杀手]
    .use 203993
    .itemcount 203993,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Between the Eyes - 8 (Stormwind)
#title 正中眉心
#displayname 正中眉心 - 8（暴风城）
step << Rogue
    #season 2
    #completewith next
    .goto Stormwind City,56.93,29.54,8,0
    .goto Stormwind City,58.65,27.56,10 >> 前往暴风城矮人区的割喉小巷
    .train 400081,1
step << Rogue
    #season 2
    .goto Stormwind City,63.201,29.491,5,0
    .goto Stormwind City,61.728,29.190
    >>|cRXP_WARN_进入屋内并上楼|r
    >>打开|cRXP_PICK_布满灰尘的箱子|r，拾取|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_这样会召出两名10级的|r|cRXP_ENEMY_割喉劫匪|r|cRXP_WARN_，他们会攻击你|r
    .collect 204174,1 -- Rune of Precision (1)
    .mob 割喉劫匪
    .train 400081,1
step << Rogue
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_学习|r |T135610:0|t[正中眉心]
    .use 204174
    .itemcount 204174,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Between the Eyes - 8 (Ironforge)
#title 正中眉心
#displayname 正中眉心 - 8（铁炉堡）
step << Rogue
    #season 2
    .goto Ironforge,51.913,13.383
    >>打开|cRXP_PICK_积灰的箱子|r，拾取|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_这样会刷出两名10级的|r|cRXP_ENEMY_割喉劫匪|r|cRXP_WARN_，他们会攻击你|r
    .collect 204174,1 -- Rune of Precision (1)
    .mob 割喉劫匪
    .train 400081,1
step << Rogue
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_学习|r |T135610:0|t[正中眉心]
    .use 204174
    .itemcount 204174,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Between the Eyes - 8 (Teldrassil)
#title 正中眉心
#displayname 正中眉心 - 8（泰达希尔）
step << Rogue
    #season 2
    .goto Teldrassil,38.92,79.93
    >>击杀或用|T133644:0|t[搜索]偷窃|cRXP_ENEMY_瘤背探险者|r和|cRXP_ENEMY_瘤背复仇者|r，获取|T134241:0|t[|cRXP_LOOT_瘤背藏品钥匙]|r
    .collect 208749,1 -- Gnarlpine Stash Key (1)
    .mob 瘤背探险者
    .mob 瘤背复仇者
    .train 400081,1
step << Rogue
    #season 2
    .goto Teldrassil,37.836,82.588
    >>打开|cRXP_PICK_瘤背储物箱|r，拾取|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 204174 -- Rune of Precision (1)
    .itemcount 208749,1
    .train 400081,1
step << Rogue
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_学习|r |T135610:0|t[正中眉心]
    .use 204174
    .itemcount 204174,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Blade Dance - 10 (Westfall)
#title 刃舞
#displayname 刃舞 - 10（西部荒野）
step << Rogue
    #season 2
    .goto Westfall,48.27,46.91,60,0
    .goto Westfall,46.39,37.38,60,0
    .goto Westfall,48.27,46.91
    >>|T133644:0|t[搜索] 遍布西部荒野的 |cRXP_ENEMY_迪菲亚成员|r。拾取它们的 |T133463:0|t[|cRXP_LOOT_不起眼的信封|r]
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    .collect 209031,1 -- Discreet Envelope (1)
    .mob 迪菲亚捕兽者
    .mob 迪菲亚走私者
    .mob 迪菲亚强夺者
    .train 400099,1
step << Rogue
    #season 2
    >>打开 |cRXP_PICK_不起眼的信封|r，取出 |T134237:0|t[|cRXP_LOOT_装备贮藏钥匙|r]
    .collect 209030,1 -- Equipment Stash Key (1)
    .use 209031
    .itemcount 209031,1
    .train 400099,1
step << Rogue
    #season 2
    #map Westfall
    .goto 1415,40.805,80.235
    >>前往死亡矿井的后门
    >>打开 |cRXP_PICK_装备贮藏|r，取出 |T134419:0|t[|cRXP_FRIENDLY_刃舞符文|r]
    .collect 208771,1 -- Rune of Blade Dance (1)
    .train 400099,1
step << Rogue
    #season 2
    .train 400099 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_刃舞符文|r] |cRXP_WARN_学习|r |T132350:0|t[刃舞]
    .use 208771
    .itemcount 208771,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Blade Dance - 16 (Dun Morogh)
#title 刃舞
#displayname 刃舞 - 16（丹莫罗）
step << Rogue
    #season 2
    .goto Dun Morogh,77.86,61.66
    >>使用|T133644:0|t[搜索]偷窃|cRXP_ENEMY_黑铁间谍|r，拾取|T133875:0|t[|cRXP_LOOT_黑铁宝箱]|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    .collect 208838,1 -- Dark Iron Lockbox (1)
    .mob 黑铁间谍
    .train 400099,1
step << Rogue
    #season 2
    >>打开|T133875:0|t[|cRXP_LOOT_黑铁宝箱]|r，拾取|T134419:0|t[|cRXP_FRIENDLY_刃舞符文|r]
    >>|cRXP_WARN_注意：必须先向训练师学会|r |T136058:0|t[开锁] |cRXP_WARN_才能打开它|r
    .collect 208771,1 -- Rune of Blade Dance (1)
    .itemcount 208838,1
    .train 400099,1
step << Rogue
    #season 2
    .train 400099 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_刃舞符文|r] |cRXP_WARN_学习|r |T132350:0|t[刃舞]
    .use 208771
    .itemcount 208771,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Blade Dance - 16 (Darkshore)
#title 刃舞
#displayname 刃舞 - 16（黑海岸）
step << Rogue
    #season 2
    #completewith learnBD
    .goto Darkshore,55.106,33.621,30 >> 进入壁泉河娜迦洞穴
    .train 400099,1
step << Rogue
    #season 2
    .goto Darkshore,56.253,34.877
    >>击杀 |cRXP_ENEMY_雷鳞海妖|r 和 |cRXP_ENEMY_雷鳞御浪者|r, 拾取 |T134242:0|t[|cRXP_LOOT_壁泉钥匙|r]
    .collect 211471,1 -- Cliffspring Key (1)
    .mob 雷鳞御浪者
    .mob 雷鳞海妖
    .train 400099,1
step << Rogue
    .goto Darkshore,56.253,34.877
    >>打开洞穴内的 |cRXP_PICK_壁泉宝箱|r，取出 |T134419:0|t[|cRXP_FRIENDLY_刃舞符文|r]
    .collect 208771,1 -- Rune of Blade Dance (1)
    .itemcount 211471,1
    .train 400099,1
step << Rogue
    #season 2
    #label learnBD
    .train 400099 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_刃舞符文|r] |cRXP_WARN_学习|r |T132350:0|t[刃舞]
    .use 208771
    .itemcount 208771,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Mutilate - 5 (Elwynn Forest)
#title 毁伤
#displayname 毁伤 - 5（艾尔文森林）
step << Rogue
    #season 2
    .goto Elwynn Forest,57.5,48.2
    >>|T133644:0|t[搜索]|cRXP_ENEMY_加瑞克·帕德弗特|r获取|T134331:0|t[阿刨的便条]
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    .collect 203723,1 -- Cutty's Note (1)
    .mob 加瑞克·帕德弗特
    .train 400094,1
step << Rogue
    #season 2
    .goto Elwynn Forest,49.983,52.012
    >>与北郡山谷围墙正南侧的|cRXP_FRIENDLY_阿刨|r交谈
    >>他会给你 |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    .collect 203990,1 -- Rune of Mutilation (1)
    .skipgossip
    .target 阿刨
    .train 400094,1
step << Rogue
    #season 2
    .cast 402265 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    .use 203990 -- Rune of Mutilation (1)
    .target 阿刨
    .train 400094,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Mutilate - 8 (Dun Morogh)
#title 毁伤
#displayname 毁伤 - 8（丹莫罗）
step << Rogue
    #season 2
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[搜索]|cRXP_ENEMY_黑铁间谍|r，拾取|T134331:0|t[黑鼠的笔记]
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    .collect 208205,1 --Blackrat's Note (1)
    .mob 黑铁间谍
    .train 400094,1
step << Rogue
    #season 2
    .goto Dun Morogh,57.256,45.227
    >>与|cRXP_FRIENDLY_黑鼠|r交谈，获得|T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    .collect 203990,1
    .skipgossip
    .train 400094,1
step << Rogue
    #season 2
    .cast 402265 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    .use 203990 -- Rune of Mutilation (1)
    .train 400094,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Saber Slash - 12 (Westfall)
#title 军刀猛刺
#displayname 军刀猛刺 - 12（西部荒野）
step << Rogue
    #season 2
    .goto Westfall,51.540,55.361,30,0
    .goto Westfall,51.093,54.642,30,0
    .goto Westfall,50.81,47.15,50,0
    .goto Westfall,51.093,54.642
    >>|T133644:0|t搜索|cRXP_ENEMY_迪菲亚斥候|r获取|T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态下才能使用|r |T133644:0|t[搜索]
    .collect 208772,1 -- Rune of Saber Slash (1)
    .mob 迪菲亚斥候
    .train 424785,1
step << Rogue
    #season 2
    .cast 402265 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .train 424785,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Saber Slash - 12 (Loch Modan)
#title 军刀猛刺
#displayname 军刀猛刺 - 12（洛克莫丹）
step << Rogue
    #season 2
    #completewith next
    .goto Loch Modan,41.01,12.60,50,0
    .goto Loch Modan,42.86,10.36,60,0
    .goto Loch Modan,46.20,13.15,10 >> |cRXP_WARN_前往洛克莫丹大坝坝墙，小心向下跳到大坝中央的突出平台，跟随箭头指示|r
    .train 424785,1
step << Rogue
    #season 2
    .goto Loch Modan,46.373,12.666
    >>打开平台边缘的|cRXP_PICK_石工工具箱|r，拾取|T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    .collect 208772,1 -- Rune of Saber Slash (1)
    .train 424785,1
step << Rogue
    #season 2
    .cast 402265 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .train 424785,1
step << Rogue
    #season 2
    .goto Loch Modan,45.823,12.652
    .cast 6477 >> 点击 |cRXP_PICK_逃生绳|r 返回顶部
    .subzoneskip 146,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Saber Slash - 1 (Darkshore)
#title 军刀猛刺
#displayname 军刀猛刺 - 1（黑海岸）
step << Rogue
    #season 2
    #completewith next
    .goto Darkshore,32.80,37.72,20 >> 游到有灯塔的小岛
    .train 424785,1
step << Rogue
    #season 2
    .goto Darkshore,32.729,37.093
    >>打开树干中的|cRXP_PICK_灯塔藏匿物|r，拾取|T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    .collect 208772,1 -- Rune of Saber Slash (1)
    .train 424785,1
step << Rogue
    #season 2
    .cast 402265 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .train 424785,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Shadowstrike - 2 (Durotar)
#title 暗影打击
    --Rune of Shadowstrike
#displayname 暗影打击 - 2（杜隆塔尔）
step << Troll/Orc
    #season 2
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .accept 77592 >>接任务：悬崖之上 << Troll
    .accept 77583 >>接任务：悬崖之上 << Orc
    .target 鲁瓦格
step
    #season 2
    .goto Durotar,43.27,69.51
    >>打开|cRXP_PICK_隐秘的宝箱|r，拾取|T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    >>|cRXP_WARN_绕过|r |cRXP_ENEMY_萨科斯|r |cRXP_WARN_，跳下去到达宝箱处|r
    .collect 204795,1 --Rune of Shadowstrike (1)
    .train 400105,1
step
    #season 2
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 暗影打击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
step << Troll/Orc
    #season 2
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .turnin 77592 >>交任务：悬崖之上 << Troll
    .turnin 77583 >>交任务：悬崖之上 << Orc
    .target 鲁瓦格
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Shadowstrike - 2 (Tirisfal)
#title 暗影打击
    --Rune of Shadowstrike
#displayname 暗影打击 - 2（提瑞斯法林地）
step << Undead
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大卫·提亚斯|r交谈
    .accept 77669 >>接任务：血色符文
    .target 大卫·提亚斯
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
    >>击杀|cRXP_ENEMY_血色信徒|r或对其使用搜索，获取|T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    .collect 204795,1 --Rune of Shadowstrike (1)
    .mob 血色信徒
    .train 400105,1
step
    #season 2
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 暗影打击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
step << Undead
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大卫·提亚斯|r交谈
    .turnin 77669 >>交任务：血色符文
    .target 大卫·提亚斯
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Deadly Brew - 25 (Silverpine Forest)
#title 致命阴谋
    --Rune of Deadly Brew
#displayname 致命阴谋 - 25（银松森林）
step
    #season 2
    .goto Silverpine Forest,47.12,71.01
    >>点击银松森林的|cRXP_PICK_秘密投放点|r
    .accept 78261 >> 接任务：谢尔索斯号角
step
    #season 2
    #completewith next
    .zone 209 >> 进入影牙城堡
    >>|cRXP_WARN_接下来的部分必须独自完成！组队会使你无法获得所需的钥匙|r
step << Horde
    #season 2
    .gossipoption 96495,1 >>潜行绕过|cRXP_ENEMY_雷希戈尔|r，与|cRXP_FRIENDLY_亡灵哨兵阿达曼特|r交谈，随后使用|T132331:0|t[消失]。他会为你开门
    .target 亡灵哨兵阿达曼特
    .train 400080,1
step << Alliance
    #season 2
    .gossipoption 96494 >>潜行绕过|cRXP_ENEMY_雷希戈尔|r，与|cRXP_FRIENDLY_巫师阿克鲁比|r交谈，随后使用|T132331:0|t[消失]。他会为你开门
    .target 巫师阿克鲁比
    .train 400080,1
step
    #season 2
    #completewith next
    >>使用 |T133644:0|t[搜索] 从 |cRXP_ENEMY_戈梅拉|r 身上取得 |T134243:0|t[|cRXP_LOOT_妹妹的半把钥匙|r]
    >>|cRXP_WARN_她在底层餐厅内|r
    .collect 210213,1 --Sister's Half-Key (1)
    .mob 戈梅拉
step
    #season 2
    >>使用 |T133644:0|t[搜索] 从 |cRXP_ENEMY_戈菲尔|r 身上取得 |T134244:0|t[|cRXP_LOOT_哥哥的半把钥匙|r]
    >>|cRXP_WARN_他在餐厅上方的二楼|r
    .collect 210212,1 --Brother's Half-Key (1)
    .mob 戈菲尔
    .train 400080,1
step
    #season 2
    >>使用 |T133644:0|t[搜索] 从 |cRXP_ENEMY_戈梅拉|r 身上取得 |T134243:0|t[|cRXP_LOOT_妹妹的半把钥匙|r]
    >>|cRXP_WARN_她在底层餐厅内|r
    .collect 210213,1 --Sister's Half-Key (1)
    .mob 戈梅拉
    .train 400080,1
step
    #season 2
    .use 210212 >>返回外面的庭院, 进入马厩. 将两把钥匙合成 |T237379:0|t[|cRXP_LOOT_双子钥匙|r]
    .collect 210209,1 --Twin Key (1)
    .train 400080,1
step
    #season 2
    >>打开马厩内的|cRXP_PICK_装饰箱|r，获取|cRXP_LOOT_谢尔索斯号角|r
    .complete 78261,1 --Horn of Xelthos (1)
step
    #season 2
    .goto Silverpine Forest,47.114,70.974
    >>点击银松森林的|cRXP_PICK_秘密投放点|r
    .turnin 78261 >> 交任务：谢尔索斯号角
step
    #season 2
    #completewith next
    +|cRXP_WARN_现在需要进入一座主城，才能收到来自 *C* 的邮件|r
    .train 400080,1
step << Horde
    #season 2
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡洛斯|r交谈
    .fly Undercity >> 飞往幽暗城
    .target 卡洛斯·拉佐克
    .zoneskip Undercity
    .train 400080,1
step << Alliance
    >>跑到南海镇
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达尔拉·哈瑞斯|r交谈
    .goto Hillsbrad Foothills,49.338,52.272
    .fly Ironforge >> 飞往铁炉堡
    .target 达尔拉·哈瑞斯
    .train 400080,1
step
    .goto Undercity,68.290,38.043,5 >> |cRXP_WARN_进入幽暗城。检查你的邮箱，查看来自*C*的信件|r << Horde
    .goto Ironforge,71.485,72.280,5 >> |cRXP_WARN_进入铁炉堡。检查你的邮箱中来自 *C* 的信件。如果你在另一个主城执行，跳过此步骤|r << Alliance
    .train 400080,1
step
    #season 2
    #completewith next
    +|cRXP_WARN_来自 *C* 的邮件送达后，打开邮箱查阅。准备好后飞回银松森林|r << Horde
    +|cRXP_WARN_来自 *C* 的邮件送达后，打开邮箱查阅。准备好后飞回南海镇，再前往银松森林|r << Alliance
step << Horde
    #season 2
    .goto Undercity,63.27,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈克尔|r交谈
    .fly The Sepulcher>> 飞往瑟伯切尔
    .target 迈克尔·加勒特
    .zoneskip Silverpine Forest
    .train 400080,1
step << Alliance
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fly Southshore >> 飞往南海镇
    .target 格莱斯·瑟登
    .zoneskip Silverpine Forest
    .train 400080,1
step << Alliance
    #completewith next
    .zone Silverpine Forest >> 前往银松森林
    .train 400080,1
step
    #season 2
    .goto Silverpine Forest,47.114,70.974
    >>在银松森林点击 |cRXP_PICK_秘密投放点|r 以获得 |T134419:0|t[|cRXP_FRIENDLY_致命阴谋符文|r]
    .collect 203994,1 --Rune of Deadly Brew (1)
    .train 400080,1
step
    #season 2
    .train 400080 >>使用 |T134419:0|t[|cRXP_FRIENDLY_致命阴谋符文|r]
    .use 203994
    .itemcount 203994,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Quick Draw - 10 (Durotar)
#title 速射
    --Rune of Quick Draw
#displayname 速射 - 10（杜隆塔尔）
step
    #season 2
    .goto Durotar,57.65,58.52,30,0
    .goto Durotar,57.36,56.59,30,0
    .goto Durotar,58.10,55.52,30,0
    .goto Durotar,58.54,53.68,30,0
    .goto Durotar,56.54,54.52,30,0
    .goto Durotar,56.37,58.35,30,0
    .goto Durotar,58.99,58.30
    >>击杀或使用|T133644:0|t[搜索]偷窃|cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r，拾取|T134327:0|t[|cRXP_LOOT_右上地图碎片|r]
    .collect 207109,1 --Top-Right Map Piece (1)
    .mob 库尔提拉斯水手
    .mob 库尔提拉斯水兵
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
    >>击杀或使用|T133644:0|t[搜索]偷窃|cRXP_ENEMY_钢鬃野猪人|r和|cRXP_ENEMY_钢鬃斥候|r，拾取|T134327:0|t[|cRXP_LOOT_右下地图碎片|r]
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
    >>击杀或使用|T133644:0|t[搜索]偷窃|cRXP_ENEMY_妖术巨魔|r和|cRXP_ENEMY_巫毒巨魔|r，拾取|T134327:0|t[|cRXP_LOOT_左下地图碎片|r]
    .collect 207106,1 --Bottom-Left Map Piece (1)
    .mob 妖术巨魔
    .mob 巫毒巨魔
    .train 400095,1
step
    #completewith next
    .goto Durotar,55.12,10.10,60 >> 前往 [骷髅石]
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
    >>击杀或使用|T133644:0|t[搜索]偷窃|cRXP_ENEMY_火刃兽人|r，拾取|T134327:0|t[|cRXP_LOOT_左上地图碎片|r]
    .collect 207108,1 --Top-Left Map Piece (1)
    .mob 火刃暴徒
    .mob 火刃狂热者
    .mob 火刃学徒
    .train 400095,1
step
    #season 2
    .use 207108 >>使用|T134327:0|t[|cRXP_LOOT_地图碎片|r]制作|T134269:0|t[|cRXP_LOOT_杜隆塔尔藏宝图|r]
    .collect 207110,1 --Durotar Treasure Map (1)
    .train 400095,1
step
    #season 2
    .goto Durotar,62.14,94.66
    .use 207110 >>在最南端的回音岛上使用|T134269:0|t[|cRXP_LOOT_杜隆塔尔藏宝图|r]
    >>打开刷新的|cRXP_PICK_埋藏的宝物|r宝箱，获取|T134419:0|t[|cRXP_FRIENDLY_速射符文|r]
    .collect 203991,1 --Rune of Quick Draw (1s)
    .train 400095,1
step
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_速射符文|r] |cRXP_WARN_学习|r |T134536:0|t[速射]
    .use 203991
    .itemcount 203991,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Quick Draw - 10 (Tirisfal)
#title 速射
    --Rune of Quick Draw
#displayname 速射 - 10（提瑞斯法林地）
step
    #season 2
    .goto Tirisfal Glades,37.20,52.17,50,0
    .goto Tirisfal Glades,36.64,50.09,50,0
    .goto Tirisfal Glades,36.10,49.07,50,0
    .goto Tirisfal Glades,35.08,49.82,50,0
    .goto Tirisfal Glades,35.30,50.91,50,0
    .goto Tirisfal Glades,34.57,51.58,50,0
    .goto Tirisfal Glades,36.63,50.09
    >>击杀或使用|T133644:0|t[搜索]偷取|cRXP_ENEMY_提瑞斯法农夫|r和|cRXP_ENEMY_提瑞斯法雇农|r，获取|T134327:0|t[|cRXP_LOOT_左上地图碎片|r]
    .collect 208036,1 --Top-Left Map Piece (1)
    .mob 提瑞斯法农夫
    .mob 提瑞斯法雇农
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
    >>击杀或使用|T133644:0|t[搜索]偷取|cRXP_ENEMY_血色战士|r，获取|T134327:0|t[|cRXP_LOOT_右上地图碎片|r]
    >>|cRXP_WARN_提瑞斯法的所有血色人型生物都有可能掉落地图碎片|r
    .collect 208035,1 --Top-Right Map Piece (1)
    .mob 血色战士
    .train 400095,1
step
    #season 2
    .goto Tirisfal Glades,56.31,39.67,40,0
    .goto Tirisfal Glades,54.71,41.19,40,0
    .goto Tirisfal Glades,53.90,43.93,40,0
    .goto Tirisfal Glades,55.24,42.54,40,0
    .goto Tirisfal Glades,56.43,43.92,40,0
    .goto Tirisfal Glades,55.24,42.54
    >>击杀或使用|T133644:0|t[搜索]偷取|cRXP_ENEMY_腐皮豺狼人|r，获取|T134327:0|t[|cRXP_LOOT_左下地图碎片|r]
    .collect 208038,1 --Bottom-Left Map Piece (1)
    .mob 混血腐皮豺狼人
    .mob 腐皮盗墓贼
    .mob 腐皮豺狼人
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
    >>击杀或使用|T133644:0|t[搜索]偷取|cRXP_ENEMY_鱼人|r，获取|T134327:0|t[|cRXP_LOOT_右下地图碎片|r]
    .collect 208037,1 --Bottom-Right Map Piece (1)
    .mob 邪鳍污水鱼人
    .mob 邪鳍先知
    .mob 邪鳍泥浆鱼人
    .train 400095,1
step
    #season 2
    .use 208036 >>使用 |T134327:0|t[|cRXP_LOOT_地图碎片|r]，合成 |T134269:0|t[|cRXP_LOOT_提瑞斯法藏宝图|r]
    .collect 208034,1 --Tirisfal Treasure Map (1)
    .train 400095,1
step
    #season 2
    .goto Tirisfal Glades,52.89,54.03
    .use 208034 >>在桥下使用|T134269:0|t[|cRXP_LOOT_提瑞斯法藏宝图|r]
    >>打开刷新的|cRXP_PICK_埋藏的宝物|r宝箱，获取|T134419:0|t[|cRXP_FRIENDLY_速射符文|r]
    .collect 203991,1 --Rune of Quick Draw (1s)
    .train 400095,1
step
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_速射符文|r] |cRXP_WARN_学习|r |T134536:0|t[速射]
    .use 203991
    .itemcount 203991,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Slaughter from the Shadows - 10 (Durotar)
#title 暗影杀手
    --Rune of Slaughter from the Shadows
#displayname 暗影杀手 - 10（杜隆塔尔）
step
    #completewith next
    .goto Durotar,54.25,27.64,40 >>前往尘风洞穴东侧的跳跃位置
step
    #season 2
    .goto Durotar,54.25,27.64,40,0
    .goto Durotar,53.74,27.14
    >>打开|cRXP_PICK_生锈的宝箱|r，拾取|T134419:0|t[|cRXP_FRIENDLY_杀手符文|r]
    >>|cRXP_WARN_你需要稍微跳一下才能够到宝箱|r
    .collect 203993,1 --Rune of Slaughter (1)
    .train 424992,1
step
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_杀手符文|r]|cRXP_WARN_学习|r|T236280:0|t[暗影杀手]
    .use 203993
    .itemcount 203993,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Slaughter from the Shadows - 10 (Tirisfal)
#title 暗影杀手
    --Rune of Slaughter from the Shadows
#displayname 暗影杀手 - 10（提瑞斯法林地）
step
    #season 2
    .goto Tirisfal Glades,47.39,43.64,150,0
    .goto Tirisfal Glades,52.23,26.91,20,0
    .goto Tirisfal Glades,52.29,26.40,8 >> 前往 [阿加曼德磨坊] 的墓穴
step
    #season 2
#loop
	.line Tirisfal Glades,51.88,25.86,52.61,25.85,52.60,26.88,51.90,26.87
	.goto Tirisfal Glades,51.88,25.86,15,0
	.goto Tirisfal Glades,52.61,25.85,15,0
	.goto Tirisfal Glades,52.60,26.88,15,0
	.goto Tirisfal Glades,51.90,26.87,15,0
    >>击杀|cRXP_ENEMY_哀嚎的鬼魂|r和|cRXP_ENEMY_腐烂的古尸|r，拾取|T134245:0|t[|cRXP_LOOT_阿加曼德遗物匣钥匙|r]
    >>|cRXP_WARN_小心！这座墓穴里的怪物会动态刷新！|r
    .collect 208005,1 --Agamand Relic Coffer Key (1)
    .mob 哀嚎的鬼魂
    .mob 腐烂的古尸
    .train 424992,1
step
    #season 2
    .goto Tirisfal Glades,52.53,26.91
    >>打开|cRXP_PICK_遗物匣|r，获取|T134419:0|t[|cRXP_FRIENDLY_杀手符文|r]
    .collect 203993,1 --Rune of Slaughter (1)
    .train 424992,1
step
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_杀手符文|r]|cRXP_WARN_学习|r|T236280:0|t[暗影杀手]
    .use 203993
    .itemcount 203993,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Mutilate - 8 (Tirisfal)
#title 毁伤
    --Rune of Mutilate
#displayname 毁伤 - 8（提瑞斯法林地）
step
    #season 2
    .goto Tirisfal Glades,51.17,67.81
    >>使用 |T133644:0|t[搜索] 从 |cRXP_ENEMY_派瑞恩队长|r 身上取得 |T133385:0|t[|cRXP_LOOT_血色军官玺戒|r]
    .collect 208085,1 --Scarlet Lieutenant Signet Ring (1)
    .mob 派瑞恩队长
    .train 400094,1
step
    #season 2
    #completewith next
    .goto Tirisfal Glades,60.90,51.49,10 >>前往布瑞尔的城镇大厅
step
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    .use 208085 >>使用 |T133385:0|t[|cRXP_LOOT_血色军官玺戒|r] 制作 |T134328:0|t[|cRXP_LOOT_伪造的血色备忘录|r]
    .collect 208086,1 --Forged Scarlet Memorandum (1)
    .train 400094,1
step
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加米尔·诺瑞|r 对话，从她那获得 |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    .collect 203990,1 --Rune of Mutilation (1)
    .target 加米尔·诺瑞
    .skipgossip
    .train 400094,1
step
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r] |cRXP_WARN_来学习|r |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Mutilate - 10 (Durotar)
#title 毁伤
    --Rune of Mutilate
#displayname 毁伤 - 10（杜隆塔尔）
step
    #season 2
    #completewith next
    .goto Durotar,53.18,29.15,50 >> 前往 [尘风洞穴]
step
    #season 2
    .goto Durotar,53.18,29.15,20,0
    .goto Durotar,52.70,27.97,12,0
    .goto Durotar,53.05,27.87,12,0
    .goto Durotar,53.14,27.24,12,0
    .goto Durotar,52.84,26.80,12,0
    .goto Durotar,52.07,26.85,12,0
    .goto Durotar,52.70,27.97
    >>使用 |T133644:0|t[搜索] 从 |cRXP_ENEMY_火刃暴徒|r 身上取得 |T134331:0|t[|cRXP_LOOT_巴索的便条|r]
    .collect 207098,1 --Note from Ba'so (1)
    .mob 火刃暴徒
    .train 400094,1
step
    .goto Durotar,51.82,58.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴索|r交谈，获得|T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    >>|cRXP_WARN_他处于潜行状态！|r
    .collect 203990,1 --Rune of Mutilation (1)
    .target 巴索
    .skipgossip
    .train 400094,1
step
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r] |cRXP_WARN_来学习|r |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Between the Eyes - 8 (Tirisfal)
#title 正中眉心
    --Rune of Between the Eyes
#displayname 正中眉心 - 8（提瑞斯法林地）
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
    >>使用 |T133644:0|t[搜索] 从 |cRXP_ENEMY_邪鳍鱼人|r 身上取得 |T134241:0|t[|cRXP_LOOT_船只残骸宝箱钥匙|r]
    .collect 208007,1 --Shipwreck Cache Key (1)
    .mob 邪鳍污水鱼人
    .mob 邪鳍先知
    .mob 邪鳍泥浆鱼人
    .train 400081,1
step
    #season 2
    .goto Tirisfal Glades,66.66,24.41
    >>打开|cRXP_PICK_沉船储藏箱|r以获得|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 204174,1 --Rune of Precision (1)
    .train 400081,1
step
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_学习|r |T135610:0|t[正中眉心]
    .use 204174
    .itemcount 204174,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Between the Eyes - 8 (Orgrimmar)
#title 正中眉心
    --Rune of Between the Eyes
#displayname 正中眉心 - 8（奥格瑞玛）
step
    #season 2
    .goto Orgrimmar,55.87,44.89
    >>打开|cRXP_PICK_布满灰尘的箱子|r获取|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_箱子位于暗巷区的楼上|r
    .collect 204174,1 --Rune of Precision (1)
    .train 400081,1
step
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_学习|r |T135610:0|t[正中眉心]
    .use 204174
    .itemcount 204174,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Blade Dance - 15 (The Barrens)
#title 刃舞
    --Rune of Blade Dance
#displayname 刃舞 - 15（贫瘠之地）
step
    #season 2
    .goto The Barrens,64.40,44.09,50,0
    .goto The Barrens,63.62,46.26,50,0
    .goto The Barrens,64.23,47.10
    >>使用 |T133644:0|t[搜索] 从 |cRXP_ENEMY_南海歹徒|r 身上取得 |T132761:0|t[|cRXP_LOOT_海盗的火柴盒|r]
    .collect 208768,1 --Buccaneer's Matchbox (1)
    .mob 南海歹徒
    .train 400099,1
step
    #season 2
    .goto The Barrens,61.82,45.80
    >>点击火药桶。从出现的|cRXP_PICK_南海战利品藏匿处|r中拾取|T134419:0|t[|cRXP_FRIENDLY_刃舞符文|r]
    .collect 208771,1 --Rune of Blade Dance (1)
    .train 400099,1
step
    #season 2
    .train 400099 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_刃舞符文|r] |cRXP_WARN_学习|r |T132350:0|t[刃舞]
    .use 208771
    .itemcount 208771,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Saber Slash - 15 (The Barrens)
#title 军刀猛刺
    --Rune of Saber Slash
#displayname 军刀猛刺 - 16（贫瘠之地）
step
    #season 2
    #completewith next
    +|cRXP_WARN_你的开锁技能必须至少达到80才能获取此符文！|r
    .skill lockpicking,>80,1
step
    #season 2
    .goto The Barrens,62.31,54.22
    >>打开马厩顶部的|cRXP_PICK_马夫的箱子|r，获得|T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    >>|cRXP_WARN_跑上山坡，跳到城墙顶部，再从那里跳到马厩顶部|r
    .collect 208772,1 --Rune of Saber Slash (1)
    .train 424984,1
step
    #season 2
    .train 424984 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r] |cRXP_WARN_学习|r |T132375:0|t[军刀猛刺]
    .use 208772
    .itemcount 208772,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Saber Slash - 15 (Silverpine)
#title 军刀猛刺
    --Rune of Saber Slash
#displayname 军刀猛刺 - 15（银松森林）
step
    #season 2
    .goto Silverpine Forest,45.25,68.06,20,0
    .goto Silverpine Forest,45.26,67.21
    >>打开影牙城堡入口旁的|cRXP_PICK_生锈的宝箱|r，获取|T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    >>|cRXP_WARN_使用|r |T132307:0|t[疾跑] |cRXP_WARN_，然后从桥上跳向宝箱|r
    .collect 208772,1 --Rune of Saber Slash (1)
    .train 424984,1
step
    #season 2
    .train 424984 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r] |cRXP_WARN_学习|r |T132375:0|t[军刀猛刺]
    .use 208772
    .itemcount 208772,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Belt
#subgroupdisplayname 腰带
#title 暗影步
#name Shadowstep - 30 (Silverpine Forest)
#displayname 暗影步 - 30（银松森林）
step
    #completewith next
    .zone Silverpine Forest >>前往银松森林
step
    .train 400101,1
    >>点击地面上的|cRXP_PICK_秘密交接箱|r
    .goto Silverpine Forest,47.114,70.974
    .accept 78676 >>接任务：波斯卡之眼
step
    #completewith next
    .zone Tirisfal Glades >>前往提瑞斯法林地的血色修道院
step
    >>|cRXP_WARN_打开马厩内的|r|cRXP_PICK_补给柜|r，|cRXP_WARN_取得|r|T132665:0|t[血色新兵的制服]
    .goto Tirisfal Glades,81.2,32.12
    .collect 210955,1
    .train 400101,1
step
    #completewith next
    .goto Eastern Kingdoms,47.44,19.69,10,0
    .goto Eastern Kingdoms,47.73,19.39,5 >> |cRXP_WARN_单人|r 进入血色修道院: |cRXP_WARN_墓地|r 地下城
step
    >>对目标使用 |T133644:0|t[搜索]，从 |cRXP_ENEMY_血色占卜师|r 身上获得 |T134241:0|t[占卜师的秘钥]
    >>|cRXP_WARN_利用|r |T132289:0|t[扰乱] |cRXP_WARN_来避免被发现|r
    .goto Eastern Kingdoms,47.73,19.39
    .collect 210963,1
    .mob 血色占卜师
    .train 400101,1
step
    #completewith next
    .goto Eastern Kingdoms,47.79,19.59,5 >> |cRXP_WARN_单人|r 进入血色修道院: |cRXP_WARN_图书馆|r 地下城
step
    #completewith next
    +|cRXP_WARN_前往最终首领前方的走廊|r
step
    >>打开左侧的|cRXP_PICK_私人信箱|r，取得|T134331:0|t[|cRXP_LOOT_机密信息|r]
    .use 210955 >>|cRXP_WARN_使用|r |T132665:0|t[血色新兵的制服] |cRXP_WARN_来使NPC中立|r
    .goto Eastern Kingdoms,47.79,19.59
    .collect 210967,1
    .train 400101,1
step
    #completewith next
    .goto Eastern Kingdoms,47.73,19.39,5 >> |cRXP_WARN_单人|r 进入血色修道院: |cRXP_WARN_墓地|r 地下城
step
    >>|cRXP_WARN_前往副本内的露天区域，在左右两侧墙边各寻找两尊雕像之间的长椅|r
    *在|cRXP_WARN_两侧|r的长椅上分别使用 /sit（潜行时也可操作），直到聊天框出现|cRXP_WARN_“你听到了石头移动的声音”|r的提示。
    *随后前往|cRXP_WARN_右侧墙边|r的墓室，打开|cRXP_PICK_石箱|r，取得|T134242:0|t[遗物匣钥匙]
    .goto Eastern Kingdoms,47.73,19.39
    .collect 210968,1
    .train 400101,1
step
    #completewith next
    .goto Eastern Kingdoms,47.79,19.59,5 >> |cRXP_WARN_单人|r 进入血色修道院: |cRXP_WARN_图书馆|r 地下城
step
    #completewith next
    +|cRXP_WARN_前往图书馆内陈列珍宝的走廊|r
step
    >>从左侧第一个房间内的 |cRXP_PICK_上锁的圣物箱|r 中拾取 |T134331:0|t[|cRXP_LOOT_波斯卡之眼|r]
    .use 210955 >>|cRXP_WARN_使用|r |T132665:0|t[血色新兵的制服] |cRXP_WARN_来使NPC中立|r
    .goto Eastern Kingdoms,47.79,19.59
    .complete 78676,1 --1/1 Eye of Bhossca
    .train 400101,1
step
    #completewith next
    .zone Silverpine Forest >>前往银松森林
step
    .train 400101,1
    >>点击地面上的|cRXP_PICK_秘密交接箱|r
    .goto Silverpine Forest,47.1,71.1
    .turnin 78676 >>交任务：波斯卡之眼
step
    #completewith next
    +|cRXP_WARN_现在需要进入一座主城，以收到*C*寄来的邮件|r
    .train 400101,1
step << Horde
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡洛斯·拉佐克|r 交谈
    .fly Undercity >> 飞往幽暗城
    .target 卡洛斯·拉佐克
    .zoneskip Undercity
    .train 400101,1
step << Alliance
    >>跑到南海镇
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达尔拉·哈瑞斯|r 交谈
    .goto Hillsbrad Foothills,49.338,52.272
    .fly Ironforge >> 飞往铁炉堡
    .target 达尔拉·哈瑞斯
    .train 400101,1
step
    .goto Undercity,68.290,38.043,5 >> |cRXP_WARN_进入幽暗城，检查你的邮箱，查看来自*C*的信件|r << Horde
    .goto Ironforge,71.485,72.280,5 >> |cRXP_WARN_进入铁炉堡。检查你的邮箱中来自 *C* 的信件。如果你在另一个主城执行，跳过此步骤|r << Alliance
    .train 400101,1
step
    #completewith next
    +|cRXP_WARN_*C*的邮件到达后，打开邮箱阅读。准备好后飞回银松森林|r << Horde
    +|cRXP_WARN_*C*的邮件到达后，打开邮箱阅读。准备好后飞回南海镇，再前往银松森林|r << Alliance
step << Horde
    .goto Undercity,63.27,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迈克尔·加勒特|r 交谈
    .fly The Sepulcher>> 飞往瑟伯切尔
    .target 迈克尔·加勒特
    .zoneskip Silverpine Forest
    .train 400101,1
step << Alliance
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 交谈
    .fly Southshore >> 飞往南海镇
    .target 格莱斯·瑟登
    .zoneskip Silverpine Forest
    .train 400101,1
step << Alliance
    #completewith next
    .zone Silverpine Forest >> 前往银松森林
    .train 400101,1
step
    .goto Silverpine Forest,47.114,70.974
    >>点击|cRXP_PICK_秘密交接箱|r，取得|T134419:0|t[|cRXP_FRIENDLY_暗影步符文|r]
    .collect 210979,1 --Rune of Shadowstep (1)
    .train 400101,1
step
    .train 400101 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_暗影步符文|r]|cRXP_WARN_学习|r|T132303:0|t[暗影步]
    .use 210979
    .itemcount 210979,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Belt
#subgroupdisplayname 腰带
#name Shuriken Toss - 30 (Swamp of Sorrows)
#title 飞镖投掷
#displayname 飞镖投掷 - 30（悲伤沼泽）
step
    .train 400096,1
    .train 1842 >>|cRXP_WARN_必须先学会|r |T136162:0|t[解除陷阱] |cRXP_WARN_才能获得|r |T134419:0|t[|cRXP_FRIENDLY_刺客符文|r]
    .collect 5060,1 >>|cRXP_WARN_还需要|r |T134065:0|t[潜行者工具]
step
    #completewith next
    .zone Swamp of Sorrows >>前往悲伤沼泽
step
    .goto Swamp of Sorrows,41.48,29.97
    .train 400096,1
    .cast 1842 >>|cRXP_WARN_施放|r |T136162:0|t[解除陷阱] |cRXP_WARN_解除|r |cRXP_PICK_飞镖陷阱|r |cRXP_WARN_（位于树上）|r
step
    .goto Swamp of Sorrows,42.76,30.77
    >>打开出现的 |cRXP_PICK_显眼的箱子|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_刺客符文|r]
    .collect 213139,1
step
    .itemcount 213139,1
    .use 213139
    .train 400096 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_刺客符文|r] |cRXP_WARN_学习|r |T132330:0|t[飞镖投掷]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Boots
#subgroupdisplayname 靴子
#name Master of Subtlety - 34 (Stranglethorn Vale)
#title 敏锐大师
#displayname 敏锐大师 - 34（荆棘谷）
step
    .train 425103,1
    .skill lockpicking,125 >>|cRXP_WARN_需将|r |T136058:0|t[开锁] |cRXP_WARN_技能提升至至少125点，才能获得|r |T132299:0|t[敏锐大师] |cRXP_WARN_符文|r
step
    .train 425103,1
    #completewith next
    .zone Stranglethorn Vale >>前往荆棘谷
step
    .train 425103,1
    #completewith Uniform
    .goto Stranglethorn Vale,46.30,7.61,30 >> 进入储藏室 (库尔森的洞穴)
step
    .train 425103,1
    #completewith next
    >>使用 |T133644:0|t[搜索]，从 |cRXP_ENEMY_库尔森精英|r 和 |cRXP_ENEMY_库尔森副首领|r 身上取得 |cRXP_LOOT_营地囚笼钥匙|r
    .collect 216616,1
    .mob 库尔森精英
    .mob 库尔森副首领
step
    #label Uniform
    .train 425103,1
    .goto Stranglethorn Vale,49.616,7.743
    >>打开 |cRXP_PICK_库尔森补给箱|r, 搜刮 |cRXP_LOOT_库尔森斗士制服|r
    .collect 216617,1
step
    .train 425103,1
    .goto Stranglethorn Vale,49.943,3.953,40,0
    .goto Stranglethorn Vale,49.617,7.562,40,0
    .goto Stranglethorn Vale,49.25,6.18
    >>使用 |T133644:0|t[搜索]，从 |cRXP_ENEMY_库尔森精英|r 和 |cRXP_ENEMY_库尔森副首领|r 身上取得 |cRXP_LOOT_营地囚笼钥匙|r
    .collect 216616,1
    .mob 库尔森精英
    .mob 库尔森副首领
step
    .train 425103,1
    #completewith next
    .goto Stranglethorn Vale,44.261,7.908,60 >> 离开洞穴, 前往外面塔楼中的 |cRXP_FRIENDLY_温德尔·玛瑟斯|r
step
    .train 425103,1
    .goto Stranglethorn Vale,44.261,7.908
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔楼中的|cRXP_FRIENDLY_温德尔·玛瑟斯|r交谈
    >>|cRXP_WARN_刷新时间约 3 分钟|r
    .destroy 216616 >> 将 |cRXP_LOOT_营地囚笼钥匙|r 交给他
    .destroy 216617 >> 将 |cRXP_LOOT_库尔森斗士制服|r 交给他
    .skipgossip 218230,1
    .target 温德尔·玛瑟斯
step
    .train 425103,1
    #completewith next
    .subzone 35 >>前往藏宝海湾
step
    .train 425103,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿兰萨斯船长|r交谈
    >>她会给你 |T133640:0|t[|cRXP_LOOT_阿兰萨斯船长的奖赏|r]
    .goto Stranglethorn Vale,27.681,76.648
    .skipgossip
    .collect 216618,1
    .target 阿兰萨斯船长
step
    .train 425103,1
    .use 216618 >>打开 |T133640:0|t[|cRXP_LOOT_阿兰萨斯船长的奖赏|r] 获得 |T134419:0|t[|cRXP_FRIENDLY_敏锐者符文|r] 和 |T338666:0|t[|cRXP_FRIENDLY_加尼的护符|r]
    >>|cRXP_WARN_请勿摧毁|r |T338666:0|t[|cRXP_FRIENDLY_加尼的护符|r] |cRXP_WARN_，后续收集符文时会用到|r
    .collect 213136,1
step
    .itemcount 213136,1
    .use 213136
    .train 425103 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_敏锐者符文|r] |cRXP_WARN_学习|r |T132299:0|t[敏锐大师]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Boots
#subgroupdisplayname 靴子
#title 闪转腾挪
#name Rolling with the Punches - 27 (Thousand Needles)
#displayname 闪转腾挪 - 27（千针石林）
step
    #optional
    .train 400093,1
    .skill lockpicking,45 >>|cRXP_WARN_需将|r |T136058:0|t[开锁] |cRXP_WARN_技能提升至至少45点，才能获得|r |T134919:0|t[闪转腾挪] |cRXP_WARN_符文|r
step
    .train 400093,1
    #completewith next
    .zone Thousand Needles >>前往|cFFfa9602千针石林|r
step
    .train 400093,1
    #completewith next
    .goto Thousand Needles,18.44,21.58,10 >> 进入伊索克营地的大帐篷
step
    .train 400093,1
    .goto Thousand Needles,18.686,21.126
    >>打开|cRXP_PICK_失窃的巨大保险箱|r，拾取|T132597:0|t[|cRXP_LOOT_大型保险箱|r]
    .collect 215451,1
step
    .train 400093,1
    .cast 1804 >>|cRXP_WARN_施放|r |T136058:0|t[开锁] |cRXP_WARN_，为|r |T132597:0|t[|cRXP_LOOT_大型保险箱|r] |cRXP_WARN_解锁|r
    .usespell 1804
    .use 215451
step
    .train 400093,1
    .use 215451 >> 打开 |T132597:0|t[|cRXP_LOOT_大型保险箱|r], 搜刮 |T132597:0|t[|cRXP_LOOT_中型保险箱|r]
    .collect 215452,1
step
    .train 400093,1
    .cast 1804 >>|cRXP_WARN_施放|r |T136058:0|t[开锁] |cRXP_WARN_，为|r |T132597:0|t[|cRXP_LOOT_中型保险箱|r] |cRXP_WARN_解锁|r
    .usespell 1804
    .use 215452
step
    .train 400093,1
    .use 215452 >> 打开 |T132597:0|t[|cRXP_LOOT_中型保险箱|r], 搜刮 |T132597:0|t[|cRXP_LOOT_小型保险箱|r]
    .collect 215453,1
step
    .train 400093,1
    .cast 1804 >>|cRXP_WARN_施放|r |T136058:0|t[开锁] |cRXP_WARN_，为|r |T132597:0|t[|cRXP_LOOT_小型保险箱|r] |cRXP_WARN_解锁|r
    .usespell 1804
    .use 215453
step
    .train 400093,1
    .use 215453 >> 打开 |T132597:0|t[|cRXP_LOOT_小型保险箱|r], 搜刮 |T134419:0|t[|cRXP_FRIENDLY_左拳符文|r]
    .collect 213138,1
step
    .itemcount 213138,1
    .use 213138
    .train 400093 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_左拳符文|r] |cRXP_WARN_学习|r |T134919:0|t[闪转腾挪]
]])
 RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
 #classic
 << Rogue SoD
 #group RestedXP Rune & Books Guide
#subgroup Helmet
#subgroupdisplayname 头盔
#title 专注攻击
#name Focused Attacks - 34 (Hinterlands)
#displayname 专注攻击 - 34（辛特兰）
 step
    >>|cRXP_WARN_需要|r|T136175:0|t[致盲]|cRXP_WARN_和|r|T133587:0|t[致盲粉]|cRXP_WARN_才能获取|r|T236274:0|t[专注攻击]|cRXP_WARN_符文|r
    .train 2094 >>学习 |T136175:0|t[致盲]
    .collect 5530,1 -- Blinding Powder 1/1
    .train 432291,1
step
    #completewith next
    .zone The Hinterlands >>前往|cFFfa9602辛特兰|r
step
    .goto The Hinterlands,72.76,52.91
    >>施放 |T136175:0|t[致盲] 使 |cRXP_ENEMY_邪枝面具|r 失明，然后打开 |cRXP_PICK_蝙蝠的宝藏|r 宝箱，取得 |T134419:0|t[|cRXP_FRIENDLY_聚焦符文|r]
    .collect 221433,1 -- rune of focus
    .mob 邪枝面具
    .train 432291,1
step
    .itemcount 221433,1
    .use 221433
    .train 432291 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_聚焦符文|r]|cRXP_WARN_学习|r|T236274:0|t[专注攻击]
 ]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Bracers
#subgroupdisplayname 护腕
#title 压倒优势
#name Unfair Advantage - 40 (Tanaris)
#displayname 压倒优势 - 40（塔纳利斯）
step
    .train 921 >>|cRXP_WARN_必须先学习|r|T133644:0|t[搜索]|cRXP_WARN_才能获取|r|T236285:0|t[压倒优势]|cRXP_WARN_符文|r
    .train 432301,1
step
    #completewith CoinPurse
    .zone Tanaris >>|cRXP_WARN_前往|r|cFFfa9602塔纳利斯|r
step
    #completewith next
    .subzone 1336 >>前往落帆海湾
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
    >>|cRXP_WARN_使用|r|T133644:0|t[搜索]|cRXP_WARN_偷窃|r|cRXP_ENEMY_南海海盗|r|cRXP_WARN_和|r|cRXP_ENEMY_南海劫掠者|r|cRXP_WARN_，持续偷窃直到获得|r|T133639:0|t|cRXP_LOOT_绑匪的钱包|r
    .collect 221371,1 -- Kidnapper's Coin Purse 1/1
    .mob 南海海盗
    .mob 南海劫掠者
    .train 432301,1
step
    >>打开|T133639:0|t|cRXP_LOOT_绑匪的钱包|r，拾取里面的|T133302:0|t|cRXP_LOOT_珍贵奖章|r
    .collect 221370,1 -- Precious Medallion 1/1
    .use 221371
    .train 432301,1
step << Rogue
    .goto Tanaris,67,22
    .gossipoption 122303 >>与|cRXP_FRIENDLY_加贝|r交谈，获得|T134419:0|t[|cRXP_FRIENDLY_犯禁符文|r]
    .collect 221428,1 -- Rune of Foul Play
    .target 加贝
    .train 432301,1
    .itemcount 221370,1
step << Rogue
    .itemcount 221428,1
    .use 221428
    .train 432301 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_犯禁符文|r]|cRXP_WARN_学习|r|T236285:0|t[压倒优势]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Bracers
#subgroupdisplayname 护腕
#title 诛灭
#name Carnage - 45 (Blasted Lands)
#displayname 诛灭 - 45（诅咒之地）
step
    #optional
    .skill lockpicking,225 >>|cRXP_WARN_需将|r |T136058:0|t[开锁] |cRXP_WARN_技能提升至至少225点，才能获得|r |T236268:0|t[诛灭] |cRXP_WARN_符文|r
step
    #completewith next
    .zone Blasted Lands >>前往|cFFfa9602诅咒之地|r
step
    #completewith next
    .goto Blasted Lands,45.27,16.52,10 >>前往巨槌要塞前方的塔顶
step
    .goto Blasted Lands,45.27,16.52
    >>打开|cRXP_PICK_被遗弃的容器|r，击杀出现的|cRXP_ENEMY_残忍的失落者|r（46级）
    >>拾取|T134419:0|t[|cRXP_FRIENDLY_疾戮符文|r]
    .collect 221461,1 -- Rune of Carnage 1/1
    .unitscan 残忍的失落者
    .train 432299,1
step
    .use 221461
    .itemcount 221461,1
    .train 432299 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_疾戮符文|r] |cRXP_WARN_学习|r |T236268:0|t[诛灭]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Helmet
#subgroupdisplayname 头盔
#title 盗贼的尊严
#name Honor Among Thieves - 45 (Azeroth)
#displayname 盗贼的尊严 - 45（艾泽拉斯）
step
    #optional
    .xp 45 >>|cRXP_WARN_需要达到 45 级才能获得此符文|r
step
    #optional
    +|cRXP_WARN_必须先完成|r |T132303:0|t[暗影步] |cRXP_WARN_任务线并交付“波斯卡之眼”，才能开启此符文任务；仅向符文经纪人学习符文不满足此前置|r
    .isQuestAvailable 78676
step
    #optional
    +|cRXP_WARN_必须先完成|r |T236270:0|t[致命阴谋] |cRXP_WARN_任务线并交付“谢尔索斯号角”，才能开启此符文任务；仅向符文经纪人学习符文不满足此前置|r
    .isQuestAvailable 78261
step
    #optional
    #completewith letterC
    >>|cRXP_WARN_要开启此符文的任务，必须先完成介绍拉文霍德阵营的“拉文霍德庄园”任务。请前往暴风城，与|r |cRXP_FRIENDLY_夜行者奥斯伯|r |cRXP_WARN_交谈以接取这项前置任务|r << Alliance
    +|cRXP_WARN_要开启此符文的任务，必须先完成介绍拉文霍德阵营的“拉文霍德庄园”任务。请前往奥格瑞玛，与|r |cRXP_FRIENDLY_奥莫克|r |cRXP_WARN_交谈以接取这项前置任务|r << Horde
    .accept 6681 >>接受任务：拉文霍德庄园 << Alliance
    .isQuestAvailable 6681
step << Horde
    .goto Orgrimmar,43.91,54.69
    .gossipoption 96925 >>与 |cRXP_FRIENDLY_奥莫克|r 交谈, 获得 |T133460:0|t[|cRXP_LOOT_优美的信件|r], 使用它接受任务
    .disablecheckbox
    .collect 17126,1,6681
    .accept 6681 >>接受任务：拉文霍德庄园
    .target 奥莫克
    .isQuestAvailable 6681
step
    #completewith next
    .zone Hillsbrad Foothills >>前往|cFFfa9602希尔斯布莱德丘陵|r
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
    >>前往 |cRXP_PICK_箱子|r 附近
    .complete 6681,1 --Rite of Cunning: 1/1
    .isOnQuest 6681
step
    .goto Alterac Mountains,85.51,79.41,10,0
    .goto Alterac Mountains,86.11,80.22,10,0
    .goto Alterac Mountains,84.45,80.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_法拉德|r 交谈
    .turnin 6681 >> 交任务：拉文霍德庄园
    .target 法拉德
    .isOnQuest 6681
step << Alliance
    +|cRXP_WARN_前往任意主城|r
    >>达纳苏斯
    >>铁炉堡
    >>暴风城
    .zoneskip Darnassus
    .zoneskip Ironforge
    .zoneskip Stormwind City
    .train 432295,1
step << Horde
    +|cRXP_WARN_前往任意主城|r
    >>幽暗城
    >>雷霆崖
    >>奥格瑞玛
    .zoneskip Undercity
    .zoneskip Thunder Bluff
    .zoneskip Orgrimmar
    .train 432295,1
step
    #label letterC
    +|cRXP_WARN_查看邮箱, 获取来自*法拉德*的信件|r
    >>|cRXP_WARN_准备好后跳过此步骤|r
    .train 432295,1
step
    #completewith next
    .zone Hillsbrad Foothills >>前往|cFFfa9602希尔斯布莱德丘陵|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_法拉德|r 交谈
    .accept 80526 >>接受任务：骗我两次
    .turnin 80526 >>交任务：骗我两次
    .accept 80411 >>接受任务：卡兹多尔的护符
    .target 法拉德
step
    #optional
    #completewith next
    .zone Tanaris >>前往塔纳利斯
step
    #completewith next
    .goto Tanaris,38.69,20.20
    .subzone 1176 >>进入祖尔法拉克
    >>|cRXP_WARN_组队状态下无法完成此符文的任务|r
step
    .goto Tanaris,38.69,20.20
    >>打开 |cRXP_PICK_陶土容器|r 以获得 |T134799:0|t[|cRXP_LOOT_邪恶混剂|r]
    >>|cRXP_WARN_它们位于祖尔法拉克各地的巨魔帐篷中|r
    .collect 217716,2
    .train 432295,1
step
    #completewith next
    +|cRXP_WARN_前往|r |cRXP_ENEMY_安图苏尔|r |cRXP_WARN_的洞穴|r
step
    >>在坩埚上使用 |T134799:0|t[|cRXP_LOOT_邪恶混剂|r]. |cRXP_WARN_此操作不会破坏潜行|r
    >>当首领分心时, 拾取 |cRXP_PICK_安图苏尔的袋子|r 以获得 |T133724:0|t[|cRXP_LOOT_骸骨供品|r]
    .collect 217721,1 --Offering of Bone
    .use 217716
    .train 432295,1
step
    #completewith next
    +|cRXP_WARN_前往墓地区域, 向 |r|cRXP_ENEMY_巫医祖穆拉恩|r|cRXP_WARN_ 移动|r
step
    >>在大锅上使用第二瓶 |T134799:0|t[|cRXP_LOOT_邪恶混剂|r]，大锅位于 |cRXP_ENEMY_巫医祖穆拉恩|r 旁。|cRXP_WARN_此操作不会破坏潜行|r
    >>当他分心时, 拾取 |cRXP_PICK_祖穆拉恩的背包|r 获取 |T136232:0|t|cRXP_LOOT_亡者结界|r
    .collect 217727,1 --ward of the dead
    .use 217716
    .train 432295,1
step
    #completewith next
    .equip 13,217727 >>装备你刚刚拾取的 |T136232:0|t|cRXP_LOOT_亡者结界|r 饰品
    >>|cRXP_WARN_这会显示哪个|r |cRXP_PICK_浅墓穴|r |cRXP_WARN_需要开启|r
step
    >>打开带有蓝色光环的 |cRXP_PICK_浅墓穴|r, 以获得 |T236304:0|t|cRXP_LOOT_血肉供品|r
    .collect 217720,1 --offering of flesh
    .use 217727
    .train 432295,1
step
    >>使用 |T236304:0|t[|cRXP_LOOT_血肉供品|r] 与 |T133724:0|t[|cRXP_LOOT_骸骨供品|r] 合成 |T236305:0|t[|cRXP_LOOT_鲜血魔法精华|r]
    .collect 217719,1 --Blood Magic Essence
    .use 217720
    .train 432295,1
step
    >>前往金字塔阶梯底部，向右看。墙边有一块小石块，跳上去后走到边缘
    >>在右侧第二个木制阳台上找到 |cRXP_PICK_沙怒宝箱|r, 打开获取 |T237274:0|t[|cRXP_LOOT_空无纹章|r]
    .collect 217717,1 --Hollow Emblem
    .train 432295,1
step
    >>使用 |T237274:0|t|cRXP_LOOT_空无纹章|r 与 |T236305:0|t[|cRXP_LOOT_鲜血魔法精华|r] 合成 |T133572:0|t[|cRXP_LOOT_鲜血魔法纹章|r]
    .collect 217718,1 --Emblem of Blood Magic
    .use 217717
    .train 432295,1
step
    >>沿楼梯登上金字塔顶端, 打开 |cRXP_PICK_魔法束缚战利品箱|r 获取 |T133313:0|t[|cRXP_LOOT_卡兹多尔护符|r]
    .collect 217609,1 --Talisman of Kazdor
    .train 432295,1
step
    #completewith next
    .zone Hillsbrad Foothills >>前往|cFFfa9602希尔斯布莱德丘陵|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_法拉德|r 交谈
    .turnin 80411 >>交任务：卡兹多尔的护符
    .accept 80453 >>接受任务：周密的计划
    .target 法拉德
step
    .goto Alterac Mountains,86.0,80.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地下室的 |cRXP_FRIENDLY_萨恩·刀链|r 交谈
    .turnin 80453 >>交任务：周密的计划
    .accept 80454 >>接受任务：最后一投
    .target 萨恩·刀链
step
    #completewith next
    .zone Silverpine Forest >>前往银松森林
step
    .goto Silverpine Forest,47.114,70.974
    >>点击 |cRXP_PICK_秘密投放点|r
    .turnin 80454 >>交任务：最后一投
    .accept 80455 >>接受任务：伺机待发
    .train 432295,1
step
    #completewith next
    .zone Hillsbrad Foothills >>前往|cFFfa9602希尔斯布莱德丘陵|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_法拉德|r 交谈
    .turnin 80455 >>交任务：伺机待发
    .target 法拉德
step
    .train 432295 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_同伙符文|r] |cRXP_WARN_来学习|r |T236275:0|t[盗贼的尊严]
    .use 217736
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Cloak
#subgroupdisplayname 披风
#title 猩红风暴
#name Crimson Tempest - 60 (Western Plaguelands)
#displayname 猩红风暴 - 60（西瘟疫之地）
step
    .train 415918,1
    .zone Western Plaguelands >>前往西瘟疫之地
step
    .train 415918,1
    #completewith next
    .subzone 190 >> 前往壁炉谷
step
    #label ToolboxKey
    .train 415918,1
    .goto Western Plaguelands,45.0,13.6
    >>击杀或用|T133644:0|t[搜索]偷窃|cRXP_ENEMY_血色工人|r，获取|cRXP_LOOT_工具箱钥匙|r
    .collect 227928,1 -- Toolbox Key 1/1
    .mob 血色工人
step
    .train 415918,1
    .goto Western Plaguelands,45.0,14.2
    >>打开|cRXP_PICK_血色工具箱|r，拾取|cRXP_LOOT_锈蚀撬棒|r
    .collect 227932,1 -- Rusty Crowbar 1/1
step
    .goto Western Plaguelands,45.85,18.45
    >>前往壁炉谷中央塔楼的顶部，打开那里的|cRXP_PICK_有标记的箱子|r，拾取|T133640:0|t[|cRXP_LOOT_隐藏的包袱|r]，再打开包袱获得|T134237:0|t[|cRXP_LOOT_保险箱钥匙|r]
    .use 227931
    .collect 227930,1
step
    .goto Western Plaguelands,46.3,14.6
    >>前往壁炉谷北侧第二座塔楼的中层，使用|T134237:0|t[|cRXP_LOOT_保险箱钥匙|r]打开[|cRXP_PICK_蓓拉芙丝的保险箱|r]，拾取|T134419:0|t[|cRXP_FRIENDLY_猩红风暴符文|r]
    .collect 227456,1 --Rune of the crimson tempest
step
    .use 227456
    .itemcount 227456,1
    .train 415918 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_猩红风暴符文|r] |cRXP_WARN_学习|r |T135315:0|t[猩红风暴]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Cloak
#subgroupdisplayname 披风
#title 刀扇
#name Fan of Knives - 55 (Winterspring)
#displayname 刀扇 - 55（冬泉谷）
step
    .train 436609,1
    .zone Winterspring >>前往冬泉谷
step
    .train 436609,1
    .goto Winterspring,67.7,35.4
    >>打开|cRXP_PICK_木箱|r，拾取|T134419:0|t[|cRXP_FRIENDLY_万刀符文|r]
    >>|cRXP_WARN_打开|r|cRXP_PICK_木箱|r|cRXP_WARN_时，请依次选择以下选项：|r
    >>|cRXP_WARN_霜刃豹|r
    >>|cRXP_WARN_猫头鹰|r
    >>|cRXP_WARN_熊|r
    >>|cRXP_WARN_猫头鹰|r
    .collect 227921,1
step
    .use 227921
    .itemcount 227921,1
    .train 436609 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_万刀符文|r] |cRXP_WARN_学习|r |T236273:0|t[刀扇]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Cloak
#subgroupdisplayname 披风
#title 短枪射击
#name Blunderbuss - 60 (Eastern Plaguelands)
#displayname 短枪射击 - 60（东瘟疫之地）
step
    .train 415922,1
    .zone Eastern Plaguelands >>前往东瘟疫之地
step
    .train 415922,1
    .goto Eastern Plaguelands,83,85
    >>打开提尔之手各处的 |cRXP_LOOT_血色储物箱|r，直到拾取到 |cRXP_LOOT_通讯魔符|r
    .collect 227451,1
step
    .train 415922,1
    #completewith FinalPillar
    >>|cRXP_WARN_接下来必须按正确顺序点击四根 |r|cRXP_PICK_通讯支柱|r|cRXP_WARN_。每点击一根，都会被随机传送到另一根支柱旁；点击下一根前务必确认自己所在的位置正确！|r
step
    .train 415922,1
    .goto Eastern Plaguelands,82,57
    .cast 6477,6478 >>点击第一个 |cRXP_PICK_通讯支柱|r，位于 |cRXP_WARN_圣光之愿礼拜堂后方|r
step
    .train 415922,1
    .goto Eastern Plaguelands,40,92
    .cast 6477,6478 >>点击第二个 |cRXP_PICK_通讯支柱|r，位于 |cRXP_WARN_达隆郡|r
step
    .train 415922,1
    .goto Eastern Plaguelands,70,34
    .cast 6477,6478 >>点击第三个 |cRXP_PICK_通讯支柱|r，位于 |cRXP_WARN_北谷|r
step
    .train 415922,1
    #label FinalPillar
    .goto Eastern Plaguelands,14,30
    .cast 6477,6478 >>点击第四个 |cRXP_PICK_通讯支柱|r，位于 |cRXP_WARN_恐惧谷|r
step
    .train 415922,1
    >>|cRXP_WARN_进入房屋|r
    >>打开地上的 |cRXP_PICK_阿顿的行李箱|r，拾取 |T134419:0|t[|cRXP_LOOT_豪侠符文|r]
    .collect 227922,1
step
    .use 227922
    .itemcount 227922,1
    .train 415922 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_豪侠符文|r] |cRXP_WARN_学习|r |T134538:0|t[短枪射击]
]])
