RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Gloves
#name 冰枪 - 2（艾尔文森林）
#title Ice Lance
<< Human Mage SoD


step
    +|cRXP_WARN_你必须至少达到 2 级才能获得|r |T133816:0|t[雕刻手套 - 冰枪] |cRXP_WARN_因为这是获得|r |T133736:0|t[理解入门]的等级要求
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133816:0|t[雕刻手套 - 冰枪]
    .train 401760,1
    .xp >2,1
step
    #completewith next
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
    .train 401760,1
    .xp <2,1
step
    #optional
    #label IceLance1
    #completewith Research
    .goto Elwynn Forest,48.33,41.90,15 >>进入北郡修道院
    .train 401760,1
    .xp <2,1
step
    #optional
    #requires IceLance1
    #completewith Research
    .goto 1429,48.79,41.58,12,0
    .goto 1429,48.975,41.146,12,0
    .goto 1429,49.262,40.633,12,0
    .goto 1429,49.510,40.095,6,0
    .goto 1429,49.691,40.230,6,0
    .goto 1429,49.595,40.673,6,0
    .goto 1429,49.324,40.492,6,0
    .goto 1429,49.436,39.881,10,0
    .goto Elwynn Forest,49.661,39.402,12 >>前往 |cRXP_FRIENDLY_Khelden Bremen|r 楼上
    .train 401760,1
    .xp <2,1
step
    #label Research
    .goto Elwynn Forest,49.661,39.402
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯尔登·布雷门|r, 他在里面
    .accept 77620 >>接受法术研究
    .target Khelden Bremen
    .train 401760,1
    .xp <2,1
step
    #optional
    #completewith next
    .goto 1429,48.303,42.098,15 >>退出北郡修道院
    .train 401760,1
    .xp <2,1
step
    #loop
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,50,0
    .goto Elwynn Forest,53.89,50.52,50,0
    .goto Elwynn Forest,55.09,49.00,50,0
    .goto Elwynn Forest,55.43,45.87,50,0
    .goto Elwynn Forest,53.86,47.05,50,0
    >>杀死 |cRXP_ENEMY_Defias Thugs|r。从他们身上搜刮物品以获得 |T134939:0|t|cRXP_FRIENDLY_[法术注释：CALE ENCI]|r
    .collect 203751,1,77620,1 -- Spell Notes: CALE ENCI (1)
    .mob Defias Thug
    .train 401760,1
    .xp <2,1
step
    .train 401760 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术注释：CALE ENCI]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 冰枪]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
    .xp <2,1
step
    #optional
    #label IceLance2
    #completewith Research2
    .goto Elwynn Forest,48.33,41.90,15 >>进入北郡修道院
    .isOnQuest 77620
    .xp <2,1
step
    #optional
    #requires IceLance2
    #completewith Research2
    .goto 1429,48.79,41.58,12,0
    .goto 1429,48.975,41.146,12,0
    .goto 1429,49.262,40.633,12,0
    .goto 1429,49.510,40.095,6,0
    .goto 1429,49.691,40.230,6,0
    .goto 1429,49.595,40.673,6,0
    .goto 1429,49.324,40.492,6,0
    .goto 1429,49.436,39.881,10,0
    .goto Elwynn Forest,49.661,39.402,12 >>前往 |cRXP_FRIENDLY_Khelden Bremen|r 楼上
    .isQuestComplete 77620
    .xp <2,1
step
    #label Research2
    .goto Elwynn Forest,49.661,39.402
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯尔登·布雷门|r, 他在里面
    .turnin 77620 >>提交法术研究
    .target Khelden Bremen
    .isQuestComplete 77620
    .xp <2,1
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Gloves
#name 冰枪术 - 2（丹莫洛）
#title Ice Lance

<< Gnome Mage SoD


step
    +|cRXP_WARN_你必须至少达到 2 级才能获得|r |T133816:0|t[雕刻手套 - 冰枪] |cRXP_WARN_因为这是获得|r |T133736:0|t[理解入门]的等级要求
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133816:0|t[雕刻手套 - 冰枪]
    .train 401760,1
    .xp >2,1
step
    #completewith next
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
    .train 401760,1
    .xp <2,1
step
    #optional
    #completewith next
    .goto 1426,28.910,69.703,15,0
    .goto 1426,28.835,69.050,10,0
    .goto 1426,28.835,68.702,10,0
    .goto 1426,28.939,68.387,12 >>进入安威玛尔
    .train 401760,1
    .xp <2,1
step
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .accept 77667 >>接受法术研究
    .target 马里克·努里比特
    .train 401760,1
    .xp <2,1
step
    #optional
    #completewith next
    .goto 1426,28.751,69.058,12,0
    .goto 1426,28.676,69.669,15 >>离开安威玛尔
    .train 401760,1
    .xp <2,1
step
    .goto Dun Morogh,26.733,72.552
    >>打开 |cRXP_PICK_Rockjaw 储物柜|r。从中获取 |T134939:0|t|cRXP_FRIENDLY_[法术注释：CALE ENCI]|r
    .collect 203751,1,77667,1 -- Spell Notes: CALE ENCI (1)
    .train 401760,1
    .xp <2,1
step
    .train 401760 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术注释：CALE ENCI]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 冰枪]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
    .xp <2,1
step
    #optional
    #completewith next
    .goto 1426,28.676,69.669,15,0
    .goto 1426,28.751,69.058,10,0
    .goto 1426,28.758,68.721,10,0
    .goto 1426,28.645,68.364,12 >>进入安威玛尔
    .isQuestComplete 77667
    .xp <2,1
step
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r
    .turnin 77667 >>提交法术研究
    .target 马里克·努里比特
    .isQuestComplete 77667
    .xp <2,1
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Gloves
#name 冰枪 - 2（杜隆塔尔）
#title Ice Lance

<< Troll Mage SoD


step
    +|cRXP_WARN_你必须至少达到 2 级才能获得|r |T133816:0|t[雕刻手套 - 冰枪] |cRXP_WARN_因为这是获得|r |T133736:0|t[理解入门]的等级要求
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133816:0|t[雕刻手套 - 冰枪]
    .train 401760,1
    .xp >2,1
step
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    .train 401760,1
    .xp <2,1
step
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_迈安|r
    .accept 77643 >>接受法术研究
    .target Mai'ah
    .xp <2,1
step
    #optional
    #label IceLance1
    #completewith Stashbox
    .goto 1411,45.363,55.673
    .subzone 365 >>进入火刃之门
    .train 401760,1
    .xp <2,1
step
    #optional
    #requires IceLance1
    #completewith Stashbox
    .goto 1411,45.306,55.177,12,0
    .goto 1411,44.103,55.254,12,0
    .goto 1411,43.241,55.384,12,0
    .goto Durotar,43.004,54.456,15 >>前往 |cRXP_PICK_Waterlogged Stashbox|r
    .train 401760,1
    .xp <2,1
step
    #label Stashbox
    .goto Durotar,43.004,54.456
    >>打开洞穴内水下的 |cRXP_PICK_Waterlogged Stashbox|r。从中获取 |T134939:0|t|cRXP_FRIENDLY_[法术注释：CALE ENCI]|r
    .collect 203751,1 --Spell Notes: CALE ENCI (1)
    .train 401760,1
    .xp <2,1
step
    .train 401760 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术注释：CALE ENCI]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 冰枪]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
    .xp <2,1
step
    #optional
    #completewith next
    .goto 1411,43.241,55.384,12,0
    .goto 1411,44.103,55.254,12,0
    .goto 1411,45.306,55.177,12,0
    .goto 1411,45.245,56.520,15 >>离开火刃之门
    .isQuestComplete 77643
    .subzoneskip 363
    .train 401760,1
    .xp <2,1
step
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_迈安|r
    .turnin 77643 >>提交法术研究
    .target Mai'ah
    .isQuestComplete 77643
    .xp <2,1
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Gloves
#name 冰枪术 - 2（提瑞斯法）
#title Ice Lance
<< Undead Mage SoD


step
    +|cRXP_WARN_你必须至少达到 2 级才能获得|r |T133816:0|t[雕刻手套 - 冰枪] |cRXP_WARN_因为这是获得|r |T133736:0|t[理解入门]的等级要求
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133816:0|t[雕刻手套 - 冰枪]
    .train 401760,1
    .xp >2,1
step
    #optional
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .train 401760,1
    .xp <2,1
step
    #optional
    #completewith next
    .goto 1420,31.324,66.173,15 >>进入丧钟教堂
    .train 401760,1
    .xp <2,1
step
    .goto 1420,30.931,66.060
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊莎贝拉|r
    .accept 77671 >>接受法术研究
    .target Isabella
    .xp <2,1
step
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
    >>杀死 |cRXP_ENEMY_Scarlet Initiates|r。掠夺他们以获得 |T134939:0|t|cRXP_FRIENDLY_[法术注释：CALE ENCI]|r
    .collect 203751,1,77671,1 --Spell Notes: CALE ENCI (1)
    .mob Scarlet Initiate
    .train 401760,1
    .xp <2,1
step
    .train 401760 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术注释：CALE ENCI]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 冰枪]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
    .xp <2,1
step
    #optional
    #completewith next
    .goto 1420,31.324,66.173,15 >>进入丧钟教堂
    .isQuestComplete 77671
    .xp <2,1
step
    .goto 1420,30.931,66.060
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊莎贝拉|r
    .turnin 77671 >>提交法术研究
    .target Isabella
    .isQuestComplete 77671
    .xp <2,1
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 再生 - 12（西部荒野）
#title Regeneration

<< Alliance Mage SoD


step
    +|cRXP_WARN_你必须至少达到 12 级才能单独获得|r |T133815:0|t[雕刻宝箱 - 再生] |cRXP_WARN_in 西部荒野|r
    .train 401767,1
    .xp >12,1
step
    #optional
    #label Charm
    #completewith Comprehension
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 401767,1
step
    #optional
    #requires Charm
    #completewith Comprehension
    .goto Stormwind City,56.54,64.77,8 >>进入佩斯特尔的药剂师
    .train 401767,1
step
    #label Comprehension
    .goto 1453,56.038,65.401
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯拉·布舍尔|r, 他在里面
    >>|cRXP_BUY_从她那里购买一个或多个|r |T135933:0|t[理解咒] |cRXP_BUY_|r
    .collect 211779,1 --Comprehension Charm (1)
    .target Kyra Boucher
    .train 401767,1
step
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
    .train 401767,1
step
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
step
    .train 401767 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术说明：TENGI RONEERA]|r |cRXP_WARN_学习|r |T133815:0|t[雕刻胸部 - 再生]
    .use 208754
    .itemcount 208754,1 --Spell Notes: TENGI RONEERA (1)
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 再生 - 13（洛克莫丹）
#title Regeneration

<< Alliance Mage SoD


step
    +|cRXP_WARN_你必须至少达到 13 级才能单独获得|r |T133815:0|t[雕刻宝箱 - 再生] |cRXP_WARN_in 洛克莫丹|r
    .train 401767,1
    .xp >13,1
step
    #optional
    #label Charm
    #completewith Comprehension
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .train 401767,1
step
    #optional
    #requires Charm
    #completewith Comprehension
    .goto Ironforge,31.33,27.80,8,0
    .goto Ironforge,30.47,26.57,6 >>进入 |cRXP_FRIENDLY_Ginny Longberry|r 的房子
    .train 401767,1
step
    #label Comprehension
    .goto Ironforge,31.33,27.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉恩|r, 他在里面
    >>|cRXP_BUY_从她那里购买一个或多个|r |T135933:0|t[理解咒] |cRXP_BUY_|r
    .collect 211779,1 --Comprehension Charm (1)
    .target Ginny Longberry
    .train 401767,1
step
    #label Loch1
    #completewith Tengi
    .zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r
    .train 401767,1
step
    #optional
    #requires Loch1
    #completewith next
    .goto 1432,54.33,26.82,5 >>进入帐篷
    .train 401767,1
step
    #label Tengi
    .goto 1432,54.33,26.82,5,0
    .goto 1432,54.17,27.03
    >>打开里面的 |cRXP_PICK_被盗书籍堆|r。从中获取 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: TENGI RONEERA|r]
    .collect 208754,1 --Spell Notes: TENGI RONEERA (1)
    .train 401767,1
step
    .train 401767 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：TENGI RONEERA|r] |cRXP_WARN_学习|r |T133815:0|t[雕刻胸甲 - 再生]
    .use 208754
    .itemcount 208754,1 --Spell Notes: TENGI RONEERA (1)
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 再生-12（贫瘠之地）
#title Regeneration

<< Horde Mage SoD


step
    +|cRXP_WARN_你必须至少达到 12 级才能在贫瘠之地单独获得|r |T133815:0|t[雕刻宝箱 - 再生] |cRXP_WARN_|r
    .train 401767,1
    .xp >12,1
step
    #optional
    #ah
    .goto Orgrimmar,50.67,70.39,0
    .goto Orgrimmar,53.74,64.60,15,0
    .goto Orgrimmar,55.54,64.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Auctioneer Wabang|r
    >>|cRXP_BUY_从拍卖行购买 a|r |T134237:0|t[科卡尔战利品钥匙] |cRXP_BUY_|r
    >>|cRXP_WARN_这将为你节省几分钟|r
    .collect 5020,1 --Kolkar Booty Key (1)
    .target Auctioneer Wabang
    .zoneskip Orgrimmar,1
    .train 401767,1
step
    #optional
    #ah
    .goto Thunder Bluff,45.23,59.40,0
    .goto Thunder Bluff,40.41,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师斯塔比|r
    >>|cRXP_BUY_从拍卖行购买 a|r |T134237:0|t[科卡尔战利品钥匙] |cRXP_BUY_|r
    >>|cRXP_WARN_这将为你节省几分钟|r
    .collect 5020,1 --Kolkar Booty Key (1)
    .target Auctioneer Stampi
    .zoneskip Thunder Bluff,1
    .train 401767,1
step
    #completewith Regeneration
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
    .train 401767,1
step
    .goto 1413,51.393,30.203
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈拉玛|r
    >>|cRXP_BUY_从他那里购买一个或多个|r |T135933:0|t[理解咒] |cRXP_BUY_|r
    .collect 211779,1 --Comprehension Charm (1)
    .target Hula'mahi
    .train 401767,1
step
    #loop
    .goto The Barrens,45.78,25.52,0
    .goto The Barrens,43.86,21.38,0
    .goto The Barrens,43.56,26.30,0
    .goto The Barrens,45.78,25.52,50,0
    .goto The Barrens,46.54,22.99,50,0
    .goto The Barrens,45.03,20.09,50,0
    .goto The Barrens,43.86,21.38,50,0
    .goto The Barrens,43.49,23.57,50,0
    .goto The Barrens,43.56,26.30,50,0
    >>杀死 |cRXP_ENEMY_Kolkar Wranglers|r 和 |cRXP_ENEMY_Kolkar Stormers|r。掠夺他们以获得 |T134237:0|t[Kolkar Booty Key]
    .collect 5020,1 --Kolkar Booty Key (1)
    .mob Kolkar Wrangler
    .mob Kolkar Stormer
    .train 401767,1
step
    #label Regeneration
    .goto The Barrens,43.02,23.52,-1
--  .goto The Barrens,52.73,41.84,-1
--   .goto The Barrens,44.33,37.66,-1
    >>打开地面上的 |cRXP_PICK_Kolkars' Booty|r。将其拾取以获得 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: TENGI RONEERA|r]
    .collect 208754,1 --Spell Notes: TENGI RONEERA (1)
    .train 401767,1
step
    .train 401767 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_咒语注释：TENGI RONEERA|r] |cRXP_WARN_进行训练|r |T132869:0|t[再生]
    .use 208754
    .itemcount 208754,1 --Spell Notes: TENGI RONEERA (1)
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 再生 - 12（银松森林）
#title Regeneration
<< Horde Mage SoD


step
    +|cRXP_WARN_你必须至少达到 12 级才能在银松森林单独获得|r |T133815:0|t[雕刻宝箱 - 再生] |cRXP_WARN_|r
    .train 401767,1
    .xp >12,1
step
    #optional
    #label Charm
    #completewith next
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .train 401767,1
step
    #label Comprehension
    .goto 1458,69.700,39.052
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托马斯·莫丹|r
    >>|cRXP_BUY_从他那里购买一个或多个|r |T135933:0|t[理解咒] |cRXP_BUY_|r
    .collect 211779,1 --Comprehension Charm (1)
    .target Thomas Mordan
    .train 401767,1
step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
    .train 401767,1
step
    #loop
    .goto 1421,52.375,56.808,0
    .goto 1421,49.614,60.886,0
    .goto 1421,51.556,64.300,0
    .goto 1421,52.689,71.258,0
    .goto 1421,52.375,56.808,45,0
    .goto 1421,51.644,57.939,45,0
    .goto 1421,50.539,59.184,45,0
    .goto 1421,50.826,59.697,45,0
    .goto 1421,50.053,60.021,45,0
    .goto 1421,49.614,60.886,45,0
    .goto 1421,50.449,60.894,45,0
    .goto 1421,50.914,61.289,45,0
    .goto 1421,51.749,61.612,45,0
    .goto 1421,50.566,62.991,45,0
    .goto 1421,51.556,64.300,45,0
    .goto 1421,52.412,63.834,45,0
    .goto 1421,51.969,65.028,45,0
    .goto 1421,52.850,66.113,45,0
    .goto 1421,51.986,66.138,45,0
    .goto 1421,52.689,71.258,45,0
    >>杀死 |cRXP_ENEMY_达拉然学徒|r。掠夺他们以获得 |T134939:0|t|cRXP_FRIENDLY_[法术说明：TENGI RONEERA]|r
    .collect 208754,1 --Spell Notes: TENGI RONEERA (1)
    .mob Dalaran Apprentice
    .train 401767,1
step
    .train 401767 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_咒语注释：TENGI RONEERA|r] |cRXP_WARN_进行训练|r |T132869:0|t[再生]
    .use 208754
    .itemcount 208754,1 --Spell Notes: TENGI RONEERA (1)
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 冰霜之指 - 10（艾尔文森林）
#title Fingers of Frost

<< Alliance Mage SoD


step
    +|cRXP_WARN_你必须至少达到 10 级才能单独在艾尔文森林中获得|r |T133815:0|t[雕刻胸甲 - 冰霜之指] |cRXP_WARN_|r
    .train 401765,1
    .xp >10,1
step
    #optional
    #label Charm
    #completewith Comprehension
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 401765,1
step
    #optional
    #requires Charm
    #completewith Comprehension
    .goto Stormwind City,56.54,64.77,8 >>进入佩斯特尔的药剂师
    .train 401765,1
step
    #label Comprehension
    .goto 1453,56.038,65.401
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯拉·布舍尔|r, 他在里面
    >>|cRXP_BUY_从她那里购买一个或多个|r |T135933:0|t[理解咒] |cRXP_BUY_|r
    .collect 211779,1 --Comprehension Charm (1)
    .target Kyra Boucher
    .train 401765,1
step
    #completewith next
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
    .train 401765,1
step
    #loop
    .goto Elwynn Forest,27.0,86.7,0
    .goto Elwynn Forest,26.1,89.9,0
    .goto Elwynn Forest,25.2,92.7,0
    .goto Elwynn Forest,27.0,93.9,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    >>杀死 |cRXP_ENEMY_Hogger|r。从他身上搜刮 |T134939:0|t|cRXP_FRIENDLY_[法术说明：RING SEFF OSTROF]|r
    .collect 203753,1 --Spell Notes: RING SEFF OSTROF (1)
    .unitscan Hogger
    .train 401765,1
step
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术说明：RING SEFF OSTROF]|r |cRXP_WARN_学习|r |T133815:0|t[雕刻胸甲 - 冰霜之指]
    .use 203753
    .itemcount 203753,1 --Spell Notes: RING SEFF OSTROF (1)
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 冰霜之指 - 5（丹莫洛）
#title Fingers of Frost
<< Alliance Mage SoD


step
    +|cRXP_WARN_你必须至少达到 5 级才能单独获得|r |T133815:0|t[雕刻胸甲 - 冰霜之指] |cRXP_WARN_in 丹莫洛|r
    .train 401765,1
    .xp >5,1
step
    #optional
    #label Charm
    #completewith Comprehension
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .train 401765,1
step
    #optional
    #requires Charm
    #completewith Comprehension
    .goto Ironforge,31.33,27.80,8,0
    .goto Ironforge,30.47,26.57,6 >>进入 |cRXP_FRIENDLY_Ginny Longberry|r 的房子
    .train 401765,1
step
    #label Comprehension
    .goto Ironforge,31.33,27.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉恩|r, 他在里面
    >>|cRXP_BUY_从她那里购买一个或多个|r |T135933:0|t[理解咒] |cRXP_BUY_|r
    .collect 211779,1 --Comprehension Charm (1)
    .target Ginny Longberry
    .train 401765,1
step
    #completewith next
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
    .train 401765,1
step
    #loop
    .goto 1426,31.87,38.45,0
    .goto 1426,30.42,39.84,0
    .goto 1426,30.02,39.08,0
    .goto 1426,33.82,37.26,0
    .goto 1426,31.87,38.45,50,0
    .goto 1426,30.42,39.84,50,0
    .goto 1426,30.02,39.08,50,0
    .goto 1426,33.82,37.26,50,0
    >>杀死 |cRXP_ENEMY_Fyodi|r。从他身上搜刮 |T134939:0|t|cRXP_FRIENDLY_[法术说明：RING SEFF OSTROF]|r
    >>|cRXP_WARN_尽管 |cRXP_ENEMY_Fyodi|r 显示为精英，但他的生命值、伤害和护甲值与标准暴徒相同|r
    >>|cRXP_WARN_当他施放时要小心|r |T132337:0|t[冲锋] |cRXP_WARN_（自身瞬发：增加移动速度 3 秒，击中时造成 35-80 点近战伤害。仅可远距离施放）|r
    >>|cRXP_WARN_注意：|r |T134939:0|t|cRXP_FRIENDLY_[法术说明：RING SEFF OSTROF]|r |cRXP_WARN_ 还可以掉落丹莫洛的所有稀有怪物，以及 |cRXP_ENEMY_Vagash|r、|cRXP_ENEMY_Mangeclaw|r 和|r |cRXP_ENEMY_Old Icebeard|r
    .collect 203753,1 --Spell Notes: RING SEFF OSTROF (1)
    .mob Fyodi
    .train 401765,1
    .xp >10,1
step
    .goto 1426,62.094,47.154,40,0
    .goto 1426,62.434,48.989,40,0
    .goto 1426,62.538,46.195
    >>杀死 |cRXP_ENEMY_Vagash|r。从他身上搜刮 |T134939:0|t|cRXP_FRIENDLY_[法术说明：RING SEFF OSTROF]|r
    >>|cRXP_WARN_注意：|r |T134939:0|t|cRXP_FRIENDLY_[法术说明：RING SEFF OSTROF]|r |cRXP_WARN_ 还可以掉落丹莫洛的所有稀有怪物，以及 |cRXP_ENEMY_Fyodi|r、|cRXP_ENEMY_Mangeclaw|r 和|r |cRXP_ENEMY_Old Icebeard|r
    .collect 203753,1 --Spell Notes: RING SEFF OSTROF (1)
    .mob Vagash
    .train 401765,1
    .xp <10,1
step
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术说明：RING SEFF OSTROF]|r |cRXP_WARN_学习|r |T133815:0|t[雕刻胸甲 - 冰霜之指]
    .use 203753
    .itemcount 203753,1 --Spell Notes: RING SEFF OSTROF (1)
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 冰霜之指 - 8（提瑞斯法林地）
#title Fingers of Frost
<< Horde Mage SoD


step
    +|cRXP_WARN_你必须至少达到 8 级才能在提瑞斯法林地单独获得|r |T133815:0|t[雕刻胸甲 - 冰霜之指] |cRXP_WARN_|r
    .train 401765,1
    .xp >8,1
step
    #optional
    #label Charm
    #completewith next
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .train 401765,1
step
    #label Comprehension
    .goto 1458,69.700,39.052
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托马斯·莫丹|r
    >>|cRXP_BUY_从他那里购买一个或多个|r |T135933:0|t[理解咒] |cRXP_BUY_|r
    .collect 211779,1 --Comprehension Charm (1)
    .target Thomas Mordan
    .train 401765,1
step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .train 401765,1
step
    #optional
    #completewith next
    .goto 1420,28.649,46.992,40,0
    .goto 1420,27.849,46.734,40,0
    .goto 1420,27.076,46.855,40,0
    .goto 1420,26.213,47.473,40,0
    .goto Tirisfal Glades,25.53,48.39,60 >>前往 |cRXP_ENEMY_Gillgar|r
step
    .goto Tirisfal Glades,25.53,48.39
    >>杀死 |cRXP_ENEMY_Gillgar|r。从他身上搜刮 |T134939:0|t|cRXP_FRIENDLY_[法术说明：RING SEFF OSTROF]|r
    .collect 203753,1 --Spell Notes: RING SEFF OSTROF (1)
    .mob Gillgar
    .train 401765,1
step
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术说明：RING SEFF OSTROF]|r |cRXP_WARN_学习|r |T133815:0|t[雕刻胸甲 - 冰霜之指]
    .use 203753
    .itemcount 203753,1 --Spell Notes: RING SEFF OSTROF (1)
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Mage SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 冰霜之指 - 8（杜隆塔尔）
#title Fingers of Frost


step
    +|cRXP_WARN_你必须至少达到 8 级才能在杜隆塔尔单独获得|r |T133815:0|t[雕刻胸甲 - 冰霜之指] |cRXP_WARN_|r
    .train 401765,1
    .xp >8,1
step
    #optional
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .train 401765,1
step
    #label Comprehension
    .goto 1454,45.439,56.550
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍苏斯|r, 他在里面
    >>|cRXP_BUY_从他那里购买一个或多个|r |T135933:0|t[理解咒] |cRXP_BUY_|r
    .collect 211779,1 --Comprehension Charm (1)
    .target Horthus
    .train 401765,1
step
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    .train 401765,1
step
    .goto 1411,66.936,87.360,40,0
    .goto 1411,67.376,86.710,40,0
    .goto 1411,67.502,87.618
    >>杀死 |cRXP_ENEMY_Zalazane|r。从他身上搜刮 |T134939:0|t|cRXP_FRIENDLY_[法术说明：RING SEFF OSTROF]|r
    .collect 203753,1 --Spell Notes: RING SEFF OSTROF (1)
    .mob Zalazane
    .train 401765,1
    .xp >12,1
step
    .goto 1411,42.123,26.666,40,0
    .goto 1411,42.654,26.448,40,0
    .goto 1411,42.123,26.666
    >>杀死 |cRXP_ENEMY_Fizzle Darkstorm|r。从他身上搜刮 |T134939:0|t|cRXP_FRIENDLY_[法术说明：RING SEFF OSTROF]|r
    .collect 203753,1 --Spell Notes: RING SEFF OSTROF (1)
    .mob Fizzle Darkstorm
    .train 401765,1
    .xp <12,1
step
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术说明：RING SEFF OSTROF]|r |cRXP_WARN_学习|r |T133815:0|t[雕刻胸甲 - 冰霜之指]
    .use 203753
    .itemcount 203753,1 --Spell Notes: RING SEFF OSTROF (1)
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 倦怠-6（丹莫洛）
#title Burnout

<< Alliance Mage SoD


step
    +|cRXP_WARN_您必须至少达到 6 级才能与其他玩家一起在丹莫洛获得|r |T132686:0|t[雕刻宝箱 - 烧尽] |cRXP_WARN_|r
    .train 401759,1
    .xp >6,1
step
    #completewith next
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
    .train 401759,1
step
    .goto 1426,69.369,58.311
    >>|cRXP_WARN_在 |cRXP_ENEMY_Frozen Trogg|r 附近或在常规聊天中寻找其他法师或术士（在聊天中输入 /1）|r
    >>|cRXP_WARN_对 |cRXP_ENEMY_Frozen Trogg|r 施放|r |T135812:0|t[火球术] |cRXP_WARN_，叠加一层|r |T135805:0|t[施加热量]|cRXP_WARN_。同时叠加 5 层，即可杀死 |cRXP_ENEMY_Frozen Trogg|r。将其拾取，以获得|r |T134939:0|t|cRXP_FRIENDLY_[法术说明：烧尽]|r
    .collect 203748,1 --Spell Notes: Burnout (1)
    .train 401759,1
    .mob Frozen Trogg
step
    .train 401759 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术注释：Burnout]|r |cRXP_WARN_学习|r |T132686:0|t[雕刻胸甲 - Burnout]
    .use 203748
    .itemcount 203748,1 --Spell Notes: Burnout (1)
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 倦怠-6（艾尔文森林）
#title Burnout

<< Alliance Mage SoD

step
    +|cRXP_WARN_你必须至少达到 6 级才能与其他玩家一起在艾尔文森林中获得|r |T132686:0|t[雕刻宝箱 - 烧尽] |cRXP_WARN_|r
    .train 401759,1
    .xp >6,1
step
    #completewith next
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
    .train 401759,1
step
    .goto 1429,77.015,51.901
    >>|cRXP_WARN_在 |cRXP_ENEMY_Frozen Murloc|r 附近或在常规聊天中寻找其他法师或术士（在聊天中输入 /1）|r
    >>|cRXP_WARN_对 |cRXP_ENEMY_Frozen Murloc|r 施放|r |T135812:0|t[火球术] |cRXP_WARN_，叠加一层|r |T135805:0|t[施加热量]|cRXP_WARN_。同时叠加 5 层，杀死 |cRXP_ENEMY_Frozen Murloc|r。拾取它以获得|r |T134939:0|t|cRXP_FRIENDLY_[法术说明：烧尽]|r
    .collect 203748,1 --Spell Notes: Burnout (1)
    .train 401759,1
    .mob Frozen Murloc
step
    .train 401759 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术注释：Burnout]|r |cRXP_WARN_学习|r |T132686:0|t[雕刻胸甲 - Burnout]
    .use 203748
    .itemcount 203748,1 --Spell Notes: Burnout (1)
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 倦怠 - 6（杜隆塔尔）
#title Burnout

<< Horde Mage SoD

step
    +|cRXP_WARN_你必须至少达到 6 级才能与其他玩家一起在杜隆塔尔获得|r |T132686:0|t[雕刻宝箱 - 烧尽] |cRXP_WARN_|r
    .train 401759,1
    .xp >6,1
step
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    .train 401579,1
step
    .goto Durotar,58.69,45.53
    >>|cRXP_WARN_在 |cRXP_ENEMY_Frozen Makrura|r 附近或在常规聊天中寻找其他法师、术士或萨满 (在聊天中输入 /1)|r
    >>|cRXP_WARN_对 |cRXP_ENEMY_Frozen Makrura|r 施放|r |T135812:0|t[火球术] |cRXP_WARN_，叠加一层|r |T135805:0|t[施加热量]|cRXP_WARN_。同时叠加 5 层，即可杀死 |cRXP_ENEMY_Frozen Makrura|r。将其拾取，以获得|r |T134939:0|t|cRXP_FRIENDLY_[法术说明：Burnout]|r
    .collect 203748,1 --Spell Notes: Burnout (1)
    .mob Frozen Makrura
    .train 401579,1
step
    .train 401759 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术注释：Burnout]|r |cRXP_WARN_学习|r |T132686:0|t[雕刻胸甲 - Burnout]
    .use 203748
    .itemcount 203748,1 --Spell Notes: Burnout (1)
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 倦怠 - 6（提瑞斯法林地）
#title Burnout

<< Horde Mage SoD


step
    +|cRXP_WARN_你必须至少达到 6 级才能与其他玩家一起在提瑞斯法林地获取|r |T132686:0|t[雕刻宝箱 - 烧尽] |cRXP_WARN_|r
    .train 401759,1
    .xp >6,1
step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .train 401759,1
step
    .goto 1420,66.337,40.059
    >>|cRXP_WARN_在 |cRXP_ENEMY_Frozen Murloc|r 附近或在常规聊天中寻找其他法师或术士（在聊天中输入 /1）|r
    >>|cRXP_WARN_对 |cRXP_ENEMY_Frozen Murloc|r 施放|r |T135812:0|t[火球术] |cRXP_WARN_，叠加一层|r |T135805:0|t[施加热量]|cRXP_WARN_。同时叠加 5 层，杀死 |cRXP_ENEMY_Frozen Murloc|r。拾取它以获得|r |T134939:0|t|cRXP_FRIENDLY_[法术说明：烧尽]|r
    .collect 203748,1 --Spell Notes: Burnout (1)
    .train 401759,1
    .mob Frozen Murloc
step
    .train 401759 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术注释：Burnout]|r |cRXP_WARN_学习|r |T132686:0|t[雕刻胸甲 - Burnout]
    .use 203748
    .itemcount 203748,1 --Spell Notes: Burnout (1)
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 启蒙-8（艾尔文森林）
#title Enlightenment

<< Alliance Mage SoD


step
    +|cRXP_WARN_你必须至少达到 8 级才能获得|r |T133815:0|t[雕刻宝箱 - 启蒙] |cRXP_WARN_因为这是训练的等级要求|r |T136071:0|t[变形术]
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133815:0|t[雕刻宝箱 - 启蒙]
    .train 415942,1
    .xp >8,1
step
    #completewith Enlightenment
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
    .train 415942,1
    .xp <8,1
step
    #optional
    #completewith next
    .goto 1429,43.133,65.740,8,0
    .goto 1429,43.226,65.953,8,0
    .goto 1429,43.824,66.361,8 >>进入金郡旅馆。上楼
    .train 415942,1
    .xp <8,1
step
    .goto 1429,43.248,66.192
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r
    .train 118 >>列车 |T136071:0|t[变形术]
    .target Zaldimar Wefhellt
    .train 415942,1
    .xp <8,1
step
    #label Enlightenment
    #loop
    .goto 1429,49.68,73.74,0
    .goto 1429,79.92,64.51,0
    .goto 1429,83.61,83.86,0
    .goto 1429,77.54,40.05,0
    .goto 1429,83.67,83.53,0
    .goto 1429,49.68,73.74,40,0
    .goto 1429,49.04,55.23,40,0
    .goto 1429,58.93,59.8,40,0
    .goto 1429,62.95,63.3,40,0
    .goto 1429,70.46,63.41,40,0
    .goto 1429,79.92,64.51,40,0
    .goto 1429,85.79,65.94,40,0
    .goto 1429,82.89,70.69,40,0
    .goto 1429,79.07,79.02,40,0
    .goto 1429,82.61,86.35,40,0
    .goto 1429,83.61,83.86,40,0
    .goto 1429,87.27,82.16,40,0
    .goto 1429,90.67,77.25,40,0
    .goto 1429,86.02,66.26,40,0
    .goto 1429,80.6,50.21,40,0
    .goto 1429,77.54,40.05,40,0
    .goto 1429,73.96,41.08,40,0
    .goto 1429,65.67,41.75,40,0
    .goto 1429,58.87,59.97,40,0
    .goto 1429,79.37,78.84,40,0
    .goto 1429,83.67,83.53,40,0
    >>对下列不寻常的小动物施放 |T136071:0|t[变形术]：|cRXP_ENEMY_Gazelles|r、|cRXP_ENEMY_Maggots|r、|cRXP_ENEMY_Parrots|r、|cRXP_ENEMY_Fire Beetles|r、|cRXP_ENEMY_Rams|r、|cRXP_ENEMY_Larvas|r 和 |cRXP_ENEMY_Cats|r。等待 RP
    >>打开地面上的 |cRXP_PICK_Spell Notes|r。将其拾取以获得 |T134332:0|t|cRXP_LOOT_[Azora Apprentice Notes]|r
    .collect 204864,6 --Azora Apprentice Notes (6)
    .mob Gazelle
    .mob Maggot
    .mob Parrot
    .mob Fire Beetle
    .mob Ram
    .mob Larva
    .mob Cat
    .train 415942,1
    .xp <8,1
step
    >>使用 |T134332:0|t|cRXP_LOOT_[Azora Apprentice Notes]|r 创建 |T134332:0|t|cRXP_FRIENDLY_[Spell Notes: Enlightenment]|r
    .collect 203749,1 --Spell Notes: Enlightenment (1)
    .use 204864
    .train 415942,1
    .xp <8,1
step
    .train 415942 >>|cRXP_WARN_使用|r |T134332:0|t|cRXP_FRIENDLY_[法术说明：启蒙]|r |cRXP_WARN_学习|r |T133815:0|t[雕刻胸甲 - 启蒙]
    .use 203749
    .itemcount 203749,1 --Spell Notes: Enlightenment (1)
    .xp <8,1
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest
#name 启蒙 - 8（提瑞斯法林地）
#title Enlightenment

<< Horde Mage SoD

step
    +|cRXP_WARN_你必须至少达到 8 级才能获得|r |T133815:0|t[雕刻宝箱 - 启蒙] |cRXP_WARN_因为这是训练的等级要求|r |T136071:0|t[变形术]
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133815:0|t[雕刻宝箱 - 启蒙]
    .train 415942,1
    .xp >8,1
step
    #completewith Enlightenment
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .train 415942,1
step
    #optional
    #completewith next
    .goto 1420,61.619,52.856,8,0
    .goto 1420,61.734,52.720,8,0
    .goto 1420,61.958,52.066,8 >>进入 Brill Inn。上楼
    .train 415942,1
    .xp <8,1
step
    .goto 1420,61.972,52.476
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯恩·火歌|r
    .train 118 >>列车 |T136071:0|t[变形术]
    .target Cain Firesong
    .train 415942,1
    .xp <8,1
step
    #label Enlightenment
    #loop
    .goto 1420,58.840,58.321,0
    .goto 1420,52.861,57.885,0
    .goto 1420,47.292,50.612,0
    .goto 1420,58.840,58.321,30,0
    .goto 1420,54.062,60.058,30,0
    .goto 1420,53.920,58.332,30,0
    .goto 1420,54.000,56.767,30,0
    .goto 1420,52.861,57.885,30,0
    .goto 1420,51.611,57.241,30,0
    .goto 1420,50.303,61.941,30,0
    .goto 1420,49.885,59.576,30,0
    .goto 1420,50.073,50.644,30,0
    .goto 1420,49.573,46.473,30,0
    .goto 1420,47.292,50.612,30,0
    >>对 |cRXP_ENEMY_Odd Melons|r 施放 |T136071:0|t[变形术]，然后等待 RP
    >>拾取地面上的 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob Odd Melon
    .train 415942,1
step
    >>使用 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r 创建 |T134332:0|t|cRXP_FRIENDLY_[法术笔记：启蒙]|r
    .collect 203749,1 --Spell Notes: Enlightenment (1)
    .use 208183 --Apothecary Notes
    .train 415942,1
step
    .train 415942 >>|cRXP_WARN_使用|r |T134332:0|t|cRXP_FRIENDLY_[法术说明：启蒙]|r |cRXP_WARN_学习|r |T133815:0|t[雕刻胸甲 - 启蒙]
    .use 203749
    .itemcount 203749,1 --Spell Notes: Enlightenment (1)
]])

RXPGuides.RegisterGuide[[
#classic
#group RestedXP 符文书指南
<<Alliance Mage SoD
#subgroup 腿/靴子/头盔
#name 冰冷血脉/法术强度/深度冻结 - 40（艾泽拉斯）
#title Icy Veins & Spell Power & Deep Freeze

--x Shiek: The guide is specifically tailored for players who have reached level 25, rather than being intended for use during the leveling process.
--x Shiek: Although there are a total of 16 books in the game, only 10 are necessary for this particular purpose. The additional books, while not included in the current version of the guide, have been noted and could be referenced later if needed.
--x Shiek: Furthermore, I have created distinct routes for both Horde and Alliance players. These routes are designed to be generally effective, considering the varying locations and book possessions players might have when they start following this guide.
--QQQ WIP to here

step
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .cast 3561 >>使用[传送暴风城] |cRXP_WARN_如果你有|r |T134419:0|t[传送符文]
    .disablecheckbox
step
    .money <0.20
    .goto Stormwind City,55.8,65.2
    .collect 17031,10 >>从 |cRXP_FRIENDLY_试剂、神秘商品、卷轴药水供应商处购买 |T134419:0|t[传送符文]。|r |cRXP_WARN_这将大大减少旅行时间。|r
    >>|cRXP_WARN_如果您不想这样做，请手动跳过此步骤。|r
step
    .goto Stormwind City,56.4,73.2
    .bankwithdraw 209850,203755,208860,209845,209849,203754,208860,209848,209843,209851,209844,215817,215822,215683,215815,215816,215820,213165,215824,216523,209846 >>|cRXP_WARN_检查您的银行是否有已存入的书籍。|r
step
    .goto Stormwind City,57.2,57.2
    .vendor >>|cRXP_WARN_强烈建议修复，因为我们将利用死亡跳过。|r
    >>|cFFFF0000如果您不想使用死亡跳过，请手动跳过此步骤。|r
step
    .goto 1429,64.41,69.08,10,0
    .goto 1429,64.69,69.58,5,0
    .goto 1429,64.73,70.32,5,0
    .goto 1429,64.83,69.87,5,0
    .goto 1429,65.16,69.69,5,0
    .goto 1429,65.24,70.25,5,0
    .goto 1429,65.02,70,5,0
    .goto 1429,65.47,70.07
    >>点击位于 |cFFfa9602艾尔文森林|r 架子上的 |cRXP_PICK_图书馆书籍|r，获取 |T133744:0|t[大法师忒奥克里图斯的研究日志。]
    .collect 203755,1
    .isQuestAvailable 79092
step
    #completewith Rumi of Gnomeregan the Collected Works
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r, 如果你在|cRXP_WARN_艾尔文森林|r，请步行前|cFFfa9602往西部荒野|r。
    .fly Westfall >>如果您 |cRXP_WARN_ 不在|r |cFFfa9602艾尔文森林中，请采取前往 |cFFfa9602西部荒野|r 的飞行路线。|r|r
    .disablecheckbox
    .isQuestAvailable 79093
-- step
--     #completewith Rumi of Gnomeregan the Collected Works
--
--     .deathskip >>死亡并在 |cFF00FF25Spirit Healer|r 处重生 |cRXP_WARN_如果您想节省修理费用，还可以选择跳过任何死亡跳过！|r
--     >>|cRXP_WARN_如果您在飞行路径上，请手动跳过此步骤。|r
--     .isQuestAvailable 79092
step
    #label Rumi of Gnomeregan the Collected Works
    .goto 1436,53.01,53.34,10,0
    .goto 1436,52.64,53.83
    >>点击西部荒野旅馆桌子上的 |cRXP_PICK_Gnomish Tome|r |cFFfa9602以获取 |T133744:0|t[诺莫瑞根的鲁米文集。]
    .collect 208860,1
    .isQuestAvailable 79093
    --x shiek: designed for human, can be picked up as a gnome.
step
    #completewith next
    .zoneskip Westfall
    .fly Westfall >>前往: |cRXP_PICK_西部荒野|r |cRXP_WARN_by taking a flight path.|r
    .isQuestAvailable 78142
    .disablecheckbox
step
    .goto 1436,45.41,69.93,10,0
    .goto 1436,45.36,70.43
    >>点击位于 |cFFfa9602西部荒野月溪镇一所小房子里的炼金柜上的 |cRXP_PICK_法术书|r，获得 |T133733:0|t[迷惑与魅力。]
    .collect 209845,1
    .isQuestAvailable 78142
step
    #completewith next
    .zone Duskwood >>前往: |cRXP_PICK_暮色森林|r
    .fly Westfall >>搭乘飞机前往 |cFFfa9602Westfall|r |cRXP_WARN_如果你已经解锁但还没到达。|r
    .disablecheckbox
    .isQuestAvailable 78147
step
    .goto 1431,15.9,38.74,10,0
    .goto 1431,15.3,38.52,15,0
    .goto 1431,15.61,36.52,15,0
    .goto 1431,16.12,33.43,15,0
    .goto 1431,16.15,30.75,15,0
    .goto 1431,16.64,28.33
    >>点击暮色森林炼金桌上的晨木墓穴内的 |cRXP_PICK_Book|r |cFFfa9602|r 以获得 |T133738:0|t[违反解剖学的罪行。]
    >>|cRXP_WARN_建议跑到地下墓穴的尽头然后死掉。此外，你可能还需要考虑组队。|r
    .collect 209849,1
    .isQuestAvailable 78147
step
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
    .fly Swamp of Sorrows >>沿着飞行路线前往 |cFFfa9602悲伤沼泽|r |cRXP_WARN_如果你已解锁但尚未到达。|r
    .disablecheckbox
    .isQuestAvailable 79953
step
    #loop
    .goto 55.6,29.0,25,0
    .goto 65.0,23.2,25,0
    .goto 63.6,27.2,25,0
    .goto 57.0,33.0,25,0
    >>杀死 |cRXP_ENEMY_Lost One Hunter|r、|cRXP_ENEMY_Lost One Muckdweller|r、|cRXP_ENEMY_Lost One Cook|r 和 |cRXP_ENEMY_Lost One Seer|r 。从他们身上搜刮物品，获得 |cRXP_LOOT_|T237379:0|t[生锈的笼子钥匙]|r
    .collect 216523,1
    .mob Lost One Hunter
    .mob Lost One Muckdweller
    .mob Lost One Cook
    .mob Lost One Seer
    .isQuestAvailable 79953
step
    .goto Swamp of Sorrows,61.0,22.0
    >>点击 |cRXP_PICK_Rusted Cage|r 接收书籍 |T133742:0|t[卢德派恶魔宠物护理指南]
    .collect 215824,1
    .isQuestAvailable 79953
step
    .goto Swamp of Sorrows,70,51
    >>点击|cRXP_PICK_Book|r获取|T133738:0|t[Sanguine Sorcery]
    .collect 220345,1
    .isQuestAvailable 81947
step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
    .fly Blasted Lands >>搭乘飞机前往 |cFFfa9602Blasted Lands|r |cRXP_WARN_如果你已经解锁但还没到达。|r
    .disablecheckbox
    .isQuestAvailable 81955
step
    .goto Blasted Lands,55.3,32.2
    >>点击 |cRXP_PICK_Book|r 获取 |T133736:0|t[Conjurer's Codex]
    .collect 220353,1
    .isQuestAvailable 81955
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    .fly Stranglethorn Vale >>搭乘飞机前往 |cFFfa9602荆棘谷|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79535
step
    .goto Stranglethorn Vale,41.0,51.0
    >>点击工作台上的 |cRXP_PICK_Researchnotes|r 接收书籍 |T237162:0|t[蛇怪：应该害怕石化吗？]
    .collect 213165,1
    .isQuestAvailable 79535
step
    #completewith next
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
    .fly Searing Gorge >>搭乘飞机前往 |cFFfa9602灼热峡谷|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 81955
step
    .goto Searing Gorge,37.8,49.6
    >>点击 |cRXP_PICK_Book|r 获取 |T133743:0|t[Stonerought Design]
    .collect 220352,1
    .isQuestAvailable 81955
step
    #completewith next
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
    .fly Searing Gorge >>搭乘飞机前往 |cFFfa9602灼热峡谷|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 81953
step
    .goto 1415,20.7,62
    >>点击 |cRXP_PICK_Book|r 获取 |T133743:0|t[Stonerought Design]
    .collect 220349,1
    .isQuestAvailable 81953
step
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .cast 3562 >>使用[传送铁炉堡] |cRXP_WARN_如果你有|r |T134419:0|t[传送符文]
    .disablecheckbox
step
    .goto 1455,31.96,57.93
    .vendor >>|cRXP_WARN_“强烈建议修复，因为我们将利用死亡跳过。|r
    >>|cFFFF0000如果您不想使用死亡跳过，请手动跳过此步骤。|r
step
    .goto 1455,69.76,24.39,10,0
    .goto 1455,70.43,18.37,10,0
    .goto 1455,75.99,10.55
    >>点击铁炉堡探险者大厅桌子上的 |cRXP_PICK_图书馆之书|r |cFFfa9602，获得 |T133744:0|t[大法师安东尼达斯的完整自传。]
    .collect 203754,1
    .isQuestAvailable 79091
step
    #completewith next
    .goto 1455,55.51,47.78,10,0
    .zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r
    .fly Loch Modan >>使用飞行路径前往 |cFFfa9602洛克莫丹|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79093
step
    .goto 1432,35.2,47.76,10,0
    .goto 1432,35.5,48.98
    >>点击洛克莫丹旅馆桌子上的 |cRXP_PICK_Gnomish Tome|r |cFFfa9602|r 以获得 |T133744:0|t[诺莫瑞根的鲁米文集。]
    .collect 208860,1
    .isQuestAvailable 79093
    --x shiek: designed for gnome, can be picked up as human.
step
    #completewith next
    .goto 1455,55.51,47.78,10,0
    .zoneskip Loch Modan
    .zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r
    .fly Loch Modan >>搭乘飞机前往 |cFFfa9602洛克莫丹|r |cRXP_WARN_如果你有的话。|r
    .disablecheckbox
    .isQuestAvailable 78148
step
    .goto 1432,74.61,19.91,10,0
    .goto 1432,75.46,18.66,5,0
    .goto 1432,75.18,16.41,5,0
    .goto 1432,76.42,14.67,5,0
    .goto 1432,77.45,14.15
    >>点击 |cFFfa9602洛克莫丹的精英食人魔洞穴|r 中的 |cRXP_PICK_Scroll|r 以获得 |T134938:0|t[巫师之王的符文。]
    >>|cRXP_WARN_建议跑到洞穴尽头等死。另外你可能还需要考虑组队。|r
    .collect 209850,1
    .isQuestAvailable 78148
step
    #completewith Goaz Scrolls
    .zoneskip Ironforge
    .deathskip >>死亡并在 |cFF00FF25Spirit Healer|r 处重生 |cRXP_WARN_如果您想节省修理费用，还可以选择跳过任何死亡跳过！|r
    .isQuestAvailable 78148
step
    #completewith Goaz Scrolls
    .zone Badlands >>前往: |cRXP_PICK_荒芜之地|r
    .fly >>使用飞行路径前往 |cFFfa9602Badlands|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79951
step
    #label Goaz Scrolls
    .goto Badlands,56.7,39.9
    >>点击书籍 |T134937:0|t[木乃伊：令人厌恶的亡灵指南]
    .collect 215820,1
    .isQuestAvailable 79951
step
    .fly Menethil Harbor >>飞往 |cFFfa9602米奈希尔港|r
    .isQuestAvailable 78146
step
    .goto 1437,33.61,47.82
    >>点击湿地|r花瓶中的|cRXP_PICK_Scroll|r |cFFfa9602|r 获得|T237450:0|t[Goaz Scrolls.]
    .collect 209848,1
    .isQuestAvailable 78146
-- step
--     #loop
--     .goto 1437,32.93,49.21,15,0
--     .goto 1437,34.1,49.75,15,0
--     .goto 1437,35.45,49.47,15,0
--     .goto 1437,35.41,47.44,15,0
--     .goto 1437,35.62,45.27,15,0
--     .goto 1437,34.2,43.89,15,0
--     .deathskip >>死亡后在 |cFF00FF25Spirit Healer|r 处重生
--     .isQuestAvailable 78146
--     .zoneskip Ironforge
step
    .zoneskip Ironforge
    .goto Wetlands,8.0,55.8
    .vendor >>|cRXP_WARN_强烈建议修复，因为我们将利用死亡跳过。|r
    >>|cFFFF0000如果您不想使用死亡跳过，请手动跳过此步骤。|r
step
    #completewith next
    .goto 1437,4.64,57.24,20,0
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
    .fly Menethil Harbor >>飞往 |cFFfa9602米奈希尔港|r |cRXP_WARN_如果你还没到达那里。|r
    .disablecheckbox
    .isQuestAvailable 78124
    --x shiek might add teleport darnassus step later
step
    #completewith next
    .deathskip >>淹死在水中然后在 |cFF00FF25Spirit Healer|r 处重生 |cRXP_WARN_如果您想节省修理费用，还可以选择跳过任何死亡跳过！|r
    .isQuestAvailable 78124
step
    .goto 1439,59.51,23.05,10,0
    .goto 1439,58.99,22.49,10,0
    .goto 1439,59.07,23.07,15,0
    .goto 1439,59.62,22.13
    >>点击 |cFFfa9602Darkshore|r 中的 |cRXP_PICK_Scroll|r 以获取 |T237447:0|t[Narthalas Almanac vol 74.]
    .collect 209843,1
    .isQuestAvailable 78124
step
    #completewith Everyday Etiquette
    .goto 1439,59.35,22.55
    .isQuestAvailable 78146
    .deathskip >>死亡后在 |cFF00FF25Spirit Healer|r 处重生
step
    #completewith Everyday Etiquette
    .isQuestAvailable 81952
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
    .fly Ashenvale >>飞往 |cFFfa9602阿什维尔|r
    .disablecheckbox
step
    #label Everyday Etiquette
    .goto Azshara,20.7,62
    >>点击 |cRXP_PICK_Book|r 获取 |T133740:0|t[日常礼仪。]
    .collect 220348,1
    .isQuestAvailable 81952
step
    #completewith next
    .isQuestAvailable 78146
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r, |cRXP_WARN_飞行路线未解锁则步行前往|r
    .fly Stonetalon Mountains >>飞往 |cFFfa9602石爪山脉|r |cRXP_WARN_如果你已解锁飞行路径。|r
    .disablecheckbox
step
    .goto 1442,74.27,85.72,5,0
    .goto 1442,74.37,85.75
    >>点击位于石爪山脉的桶上的帐篷内的|cRXP_PICK_Scroll|r |cFFfa9602|r 以获得|T133209:0|t[土地之怒。]
    .collect 209851,1
    .isQuestAvailable 78149
step
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
    .fly Desolace >>搭乘飞机前往 |cFFfa9602Desolace|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79950
step
    .goto Desolace,55.0,26.0
    >>点击 |cRXP_PICK_Scroll|r 接收书籍 |T133733:0|t[Demons and You]r
    .collect 215817,1
    .isQuestAvailable 79950
step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r, |cRXP_WARN_如果没有飞行路线，请步行。|r
    .fly Ratchet >>沿着飞行路径前往 |cFFfa9602Ratchet|r |cRXP_WARN_如果你已解锁。|r
    .disablecheckbox
    .isQuestAvailable 79097
step
    .goto The Barrens,62.665,36.222
    >>单击 Ratchet 中 |cRXP_PICK_Goblin Tome|r |cFFfa9602 中 |r |cRXP_FRIENDLY_Gazlowe|r 旁边的 |T133744:0|t[Baxtan on Destructive Magics.]
    .collect 208800,1
    .isQuestAvailable 79097
step
    .goto 1413,45.98,36.39,15,0
    .goto 1414,51.91,55.42,15,0
    .goto 1414,51.98,55.23,15,0
    .goto 1414,51.95,55.11,15,0
    .goto 1414,51.89,54.79,15,0
    .goto 1414,51.94,54.63,15,0
    .goto 1414,52.01,54.57,15,0
    .goto 1414,52.26,54.63,15,0
    .goto 1414,52.48,54.93,15,0
    .goto 1414,52.62,54.94,15,0
    .goto 1414,52.83,54.71
    >>点击位于 |cFFfa9602贫瘠之地哀嚎洞穴传送门附近地面上的 |cRXP_PICK_Scroll|r，获得 |T135142:0|t[梦境者的秘密。]
    .collect 209846,1
    .isQuestAvailable 78143
step
    #completewith next
    .goto 1414,52.83,54.71
    .deathskip >>死亡后在 |cFF00FF25Spirit Healer|r 处重生
    .isQuestAvailable 78143
step
    .goto The Barrens,56.3,8.8
    >>点击贫瘠之地石油钻井平台顶部的 |cRXP_PICK_Manual|r |cFFfa9602|r 以获取 |T134509:0|t[Arcanic Systems Manual.]
    .collect 209847,1
    .isQuestAvailable 78145
step
    #completewith next
    .zone Dustwallow Marsh >>前往: |cRXP_PICK_尘泥沼泽|r
    .fly Dustwallow Marsh >>搭乘飞机前往 |cFFfa9602尘泥沼泽|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79952
step
    .goto Dustwallow Marsh,57.5,21.0
    >>点击 |cRXP_PICK_Waterlogged Book|r 即可获得书籍 |T133740:0|t[RwlRwlRwlRwl!]。
    .collect 215822,1
    .isQuestAvailable 79952
step
    #completewith next
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
    .fly Thousand Needles >>搭乘飞机前往 |cFFfa9602千针石林|r |cRXP_WARN_如果你已解锁。|r
    .disablecheckbox
    .isQuestAvailable 79947
step
    .goto Thousand Needles,34.0,40.0
    >>点击|cRXP_PICK_Scroll|r 来获得帐篷内麻袋旁边的书籍|T133740:0|t[Geomancy: The Stone-Cold Truth]。
    .collect 215683,1
    .isQuestAvailable 79947
step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
    .fly Tanaris >>搭乘飞机前往 |cFFfa9602Tanaris|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 81949
step
    .goto Tanaris,72.6,47.8
    >>点击 |cRXP_PICK_Book|r 获取 |T134941:0|t[潮汐贤者传奇]
    .collect 220346,1
    .isQuestAvailable 81949
step
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .cast 3562 >>使用 |T135757:0|t[传送铁炉堡] |cRXP_WARN_如果你有|r |T134419:0|t[传送符文]
    .disablecheckbox
step
    #completewith next
    .isQuestAvailable 78127
    -- .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
    -- .fly Hillsbrad Foothills >>|cRXP_WARN_如果飞行路径已解锁，请飞往希尔斯布莱德丘陵。|r
    -- .disablecheckbox
    .fly Arathi Highlands >>|cRXP_WARN_如果您尚未解锁希尔斯布莱德丘陵飞行路线，请飞往阿拉希高地。|r
    .disablecheckbox
    .fly Wetlands >>|cRXP_WARN_如果您尚未解锁阿拉希高地，请飞往湿地。|r
    .disablecheckbox
step
    #completewith next
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
    .fly Arathi Highlands >>搭乘飞机前往 |cFFfa9602阿拉希高地|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79949
step
    .goto Arathi Highlands,74.0,65.0
    >>点击 |cRXP_PICK_Scroll|r 接收书籍 |T134331:0|t[谎言之网：揭穿神话与传说]
    .collect 215816,1
    .isQuestAvailable 79949
step
    #completewith next
    .zone The Hinterlands >>前往: |cRXP_PICK_辛特兰|r
    .fly The Hinterlands >>搭乘飞机前往 |cFFfa9602内陆地区|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 81954
step
    .goto The Hinterlands,36,72.7
    >>点击 |cRXP_PICK_Book|r 获取 |T134942:0|t[Venomous Journeys]
    .collect 220350,1
    .isQuestAvailable 81954
step
    #completewith next
    .zone Alterac Mountains >>前往: |cRXP_PICK_奥特兰克山脉|r
    .fly Alterac Mountains >>搭乘飞机前往 |cFFfa9602奥特兰克山脉|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79948
step
    .goto Alterac Mountains,48.5,57.6
    >>点击塔内板条箱上的 |cRXP_PICK_Manual|r 以获取书籍 |T133736:0|t[防御魔法 101]。
    .collect 215815,1
    .isQuestAvailable 79948
step
    .goto 1421,62.01,64.19,10,0
    .goto 1421,63.08,63.99,5,0
    .goto 1421,63.08,63.48,5,0
    .goto 1421,63.54,63.13
    >>点击位于银松森林琥珀岭主城堡内书架上的|cRXP_PICK_Book|r |cFFfa9602|r 以获得|T134917:0|t[达拉然文摘第 23 卷。]
    .collect 209844,1
    .isQuestAvailable 78127
step
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .cast 3561 >>使用[传送暴风城] |cRXP_WARN_如果你有|r |T134419:0|t[传送符文]
    .disablecheckbox
step
    .goto Stormwind City,37.81,79.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garion Wendell|r |cFFfa9602in Stormwind, Mage Tower.|r
    --x .accept is correct here because its a special kind of quest shiek
    .accept 78124 >>交回纳萨拉斯年鉴
    .accept 78127 >>提交达拉然文摘
    .accept 78142 >>交出迷惑和魅力
    .accept 78143 >>交出梦想家的秘密
    .accept 78145 >>上交 Arcanic 系统手册
    .accept 78146 >>交出 Goaz 卷轴
    .accept 78147 >>举报违反解剖学的罪行
    .accept 78148 >>交出巫王符文
    .accept 78149 >>交出土地之怒
    .accept 79091 >>交出大法师安东尼达斯：完整自传
    .accept 79092 >>交出大法师忒奥克里托斯的研究日志
    .accept 79093 >>交出诺莫瑞根的鲁米：文集
    .accept 79094 >>交出塔佐的教训
    .accept 79095 >>交出药剂师的形而上学入门书
    .accept 79096 >>交出 Ataeric：关于神秘奇事
    .accept 79097 >>交出 Ataeric：Baxtan：论破坏性魔法
    .accept 79535 >>交出蛇怪：应该害怕石化吗？
    .accept 79947 >>风水学的转变：冷酷的真相
    .accept 79948 >>交出防御魔法 101
    .accept 77949 >>接任务: |cRXP_WARN_[Fashion Feathers]|r
    .accept 79950 >>交出恶魔和你
    .accept 79951 >>交出木乃伊：令人厌恶的亡灵指南
    .accept 79952 >>交出RwlRwlRwlRwl！
    .accept 81947 >>交出血红魔法
    .accept 81949 >>交出潮汐贤者传说
    .accept 81951 >>交出界限与奥秘
    .accept 81952 >>遵守日常礼仪
    .accept 81953 >>提交石雕设计图
    .accept 81954 >>交出毒液之旅
    .accept 81955 >>交出金属之心
    .accept 81956 >>交出魔法师法典
    .accept 79953 >>交出卢德派恶魔宠物护理指南
    .accept 78150 >>交出图书馆之友
    .accept 79536 >>交出“图书馆之友”
    .accept 82208 >>交出“图书馆之友”
    .target Garion Wendell
step
    .goto Stormwind City,56.4,73.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_牛顿·伯恩赛德|r
    .bankdeposit 209850,203755,208860,209845,209849,203754,208860,209848,209843,209851,209844,215817,215822,215683,215815,215816,215820,213165,215824,216523 >>|cRXP_WARN_存入剩余的书籍。|r
    .target Newton Burnside
]]

RXPGuides.RegisterGuide[[
#classic
#group RestedXP 符文书指南
#subgroup 腿/靴子
#subgroup 腿/靴子/头盔
#name 冰冷血脉/法术强度/深度冻结 - 40（艾泽拉斯）
#title Icy Veins & Spell Power & Deep Freeze

<< Horde Mage SoD

--x Shiek: The guide is specifically tailored for players who have reached level 25, rather than being intended for use during the leveling process.
--x Shiek: Although there are a total of 16 books in the game, only 10 are necessary for this particular purpose. The additional books, while not included in the current version of the guide, have been noted and could be referenced later if needed.
--x Shiek: Furthermore, I have created distinct routes for both Horde and Alliance players. These routes are designed to be generally effective, considering the varying locations and book possessions players might have when they start following this guide.

step
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .cast 3567 >>使用[传送奥格瑞玛] |cRXP_WARN_如果你有|r |T134419:0|t[传送符文]
    .disablecheckbox
    .isQuestAvailable 79094
step
    .money <0.20
    .goto Orgrimmar,45.6,56.8
    .collect 17031,10 >>从 |cRXP_FRIENDLY_试剂、神秘商品、卷轴药水供应商处购买 |T134419:0|t[传送符文]。|r |cRXP_WARN_这将大大减少旅行时间。|r
    >>|cRXP_WARN_如果您不想这样做，请手动跳过此步骤。|r
step
    .goto Orgrimmar,50.0,68.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_the Banker|r
    .bankwithdraw 209850,208185,208860,209845,209849,207972,210177,209848,209843,209851,209844,215817,215822,215683,215815,215816,215820,213165,215824,216523 >>|cRXP_WARN_检查你的银行是否有任何可能已存入的书籍|r
    .target Karus
    .target Komawa
    .target Soran
step
    .goto Orgrimmar,55.8,73.0
    .vendor >>|cRXP_WARN_强烈建议修复，因为我们将利用死亡跳过。|r
    >>|cFFFF0000如果您不想使用死亡跳过，请手动跳过此步骤。|r
step
    .goto 1454,38.66,78.43
    >>点击奥格瑞玛墙壁上的 |cRXP_PICK_巨石|r |cFFfa9602|r 获得 |T134938:0|t[塔佐的教诲。]
    .collect 207972,1
    .isQuestAvailable 79094
step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r, |cRXP_WARN_如果没有飞行路线，请步行。|r
    .fly Ratchet >>沿着飞行路径前往 |cFFfa9602Ratchet|r |cRXP_WARN_如果你已解锁。|r
    .fly Crossroads >>走飞行路线到 |cFFfa9602Crossroads|r |cRXP_WARN_如果你没有 Ratchet。|r
    .disablecheckbox
    .isQuestAvailable 79097
step
    .goto The Barrens,62.665,36.222
    >>单击 Ratchet 中 |cRXP_PICK_Goblin Tome|r |cFFfa9602 中 |r |cRXP_FRIENDLY_Gazlowe|r 旁边的 |T133744:0|t[Baxtan on Destructive Magics.]
    .collect 208800,1
    .isQuestAvailable 79097
step
    #completewith next
    .fly Crossroads >>如果已解锁，请沿飞行路径前往 |cRXP_WARN_Crossroads|r，|cRXP_WARN_否则，请步行前往。|r
    .disablecheckbox
    .isQuestAvailable 78143
step
    .goto 1413,45.98,36.39,15,0
    .goto 1414,51.91,55.42,15,0
    .goto 1414,51.98,55.23,15,0
    .goto 1414,51.95,55.11,15,0
    .goto 1414,51.89,54.79,15,0
    .goto 1414,51.94,54.63,15,0
    .goto 1414,52.01,54.57,15,0
    .goto 1414,52.26,54.63,15,0
    .goto 1414,52.48,54.93,15,0
    .goto 1414,52.62,54.94,15,0
    .goto 1414,52.83,54.71
    >>点击位于 |cFFfa9602贫瘠之地哀嚎洞穴传送门附近地面上的 |cRXP_PICK_Scroll|r，获得 |T135142:0|t[梦境者的秘密。]
    .collect 209846,1
    .isQuestAvailable 78143
step
    #completewith Arcanic Systems Manual
    .zoneskip Orgrimmar
    .goto 1414,52.83,54.71
    .deathskip >>死亡后在 |cFF00FF25Spirit Healer|r 处重生
    .isQuestAvailable 78143
step
    #completewith Arcanic Systems Manual
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
    .fly Crossroads >>如果已解锁，请沿飞行路径前往 |cRXP_WARN_Crossroads|r，|cRXP_WARN_否则，请步行前往。|r
    .disablecheckbox
    .isQuestAvailable 78145
step
    #label Arcanic Systems Manual
    .goto The Barrens,56.3,8.8
    >>点击贫瘠之地石油钻井平台顶部的 |cRXP_PICK_Manual|r |cFFfa9602|r 以获取 |T134509:0|t[Arcanic Systems Manual.]
    .collect 209847,1
    .isQuestAvailable 78145
step
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
    .fly Desolace >>搭乘飞机前往 |cFFfa9602Desolace|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79950
step
    .goto Desolace,55.0,26.0
    >>点击 |cRXP_PICK_Scroll|r 接收书籍 |T133733:0|t[Demons and You]r
    .collect 215817,1
    .isQuestAvailable 79950
step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r, |cRXP_WARN_如果没有飞行路线，请步行。|r
    .fly Ratchet >>沿着飞行路径前往 |cFFfa9602Ratchet|r |cRXP_WARN_如果你已解锁。|r
    .disablecheckbox
    .isQuestAvailable 79097
step
    #completewith next
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r, 如果你在|cFFfa9602贫瘠之地|r，请步行前往
    .fly Stonetalon Mountains >>如果已解锁，请从 |cFFfa9602Orgrimmar|r 选取一条飞行路径。
    .disablecheckbox
    .isQuestAvailable 78149
step
    .goto 1442,74.27,85.72,5,0
    .goto 1442,74.37,85.75
    >>点击石爪山的|cRXP_PICK_Scroll|r |cFFfa9602|r获取|T133209:0|t[土地之怒。]
    .collect 209851,1
    .isQuestAvailable 78149
step
    .isQuestAvailable 81952
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
    .fly Ashenvale >>飞往 |cFFfa9602阿什维尔|r
    .disablecheckbox
step
    .goto Azshara,20.7,62
    >>点击 |cRXP_PICK_Book|r 获取 |T133740:0|t[日常礼仪。]
    .collect 220348,1
    .isQuestAvailable 81952
step
    #completewith next
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r, |cRXP_WARN如果您都没有飞行路径, 请步行前往|r
    .disablecheckbox
    .isQuestAvailable 78124
step
    .goto 1439,59.51,23.05,10,0
    .goto 1439,58.99,22.49,10,0
    .goto 1439,59.07,23.07,15,0
    .goto 1439,59.62,22.13
    >>点击 |cFFfa9602Darkshore|r 中的 |cRXP_PICK_Scroll|r 以获取 |T237447:0|t[Narthalas Almanac vol 74.]
    .collect 209843,1
    .isQuestAvailable 78124
step
    #completewith next
    .zone Dustwallow Marsh >>前往: |cRXP_PICK_尘泥沼泽|r
    .fly Dustwallow Marsh >>搭乘飞机前往 |cFFfa9602尘泥沼泽|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79952
step
    .goto Dustwallow Marsh,57.5,21.0
    >>点击 |cRXP_PICK_Waterlogged Book|r 即可获得书籍 |T133740:0|t[RwlRwlRwlRwl!]。
    .collect 215822,1
    .isQuestAvailable 79952
step
    #completewith next
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
    .fly Thousand Needles >>搭乘飞机前往 |cFFfa9602千针石林|r |cRXP_WARN_如果你已解锁。|r
    .disablecheckbox
    .isQuestAvailable 79947
step
    .goto Thousand Needles,34.0,40.0
    >>点击|cRXP_PICK_Scroll|r 来获得帐篷内麻袋旁边的书籍|T133740:0|t[Geomancy: The Stone-Cold Truth]。
    .collect 215683,1
    .isQuestAvailable 79947
step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
    .fly Tanaris >>搭乘飞机前往 |cFFfa9602Tanaris|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 81949
step
    .goto Tanaris,72.6,47.8
    >>点击 |cRXP_PICK_Book|r 获取 |T134941:0|t[潮汐贤者传奇]
    .collect 220346,1
    .isQuestAvailable 81949
step
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .cast 3563 >>使用[传送幽暗城] |cRXP_WARN_如果你有|r |T134419:0|t[传送符文]
    .disablecheckbox
step
    .goto Undercity,69.8,27.6
    .vendor >>|cRXP_WARN_强烈建议修复，因为我们将利用死亡跳过。|r
    >>|cFFFF0000如果您不想使用死亡跳过，请手动跳过此步骤。|r
step
    .goto 1420,59.62,52.05,5,0
    .goto 1420,59.39,52.29
    >>点击位于 Tirisfal Glades, Brill 的 |cRXP_PICK_The Apothecary's Society Primer|r |cFFfa9602|r 以获得 |T133737：0|吨[The Apothecary's Metaphysical Primer。]
    .collect 208185,1
    .isQuestAvailable 79095
step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r, |cRXP_WARN_如果你在|r |cFFfa9602提瑞斯法林地|r 就步行前往
    .fly Silverpine Forest >>搭乘飞机前往 |cFFfa9602银松森林|r |cRXP_WARN_如果你在|r |cFFfa9602幽暗城。|r
    .disablecheckbox
    .isQuestAvailable 79096
step
    .goto 1421,43.12,41.39,5,0
    .goto 1421,42.7,41.37,5,0
    .goto 1421,42.72,40.85,5,0
    .goto 1421,43.43,41.29
    >>点击银松森林中的 |cRXP_PICK_Arcane Secrets|r |cFFfa9602|r 以获取 |T133744:0|t[Ataeric：关于奥术奇观。]
    .collect 219177,1
    .isQuestAvailable 79096
step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
    .fly Silverpine Forest >>搭乘飞机前往 |cFFfa9602银松森林|r |cRXP_WARN_如果你在|r |cFFfa9602幽暗城。|r
    .disablecheckbox
    .isQuestAvailable 78127
step
    .goto 1421,62.01,64.19,10,0
    .goto 1421,63.08,63.99,5,0
    .goto 1421,63.08,63.48,5,0
    .goto 1421,63.54,63.13
    >>点击位于银松森林琥珀岭主城堡内的 |cRXP_PICK_Book|r |cFFfa9602|r 以获得 |T134917:0|t[达拉然文摘第 23 卷。]
    .collect 209844,1
    .isQuestAvailable 78127
step
    #completewith next
    .zone Alterac Mountains >>前往: |cRXP_PICK_奥特兰克山脉|r
    .fly Alterac Mountains >>搭乘飞机前往 |cFFfa9602奥特兰克山脉|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79948
step
    .goto Alterac Mountains,48.5,57.6
    >>点击塔内板条箱上的 |cRXP_PICK_Manual|r 以获取书籍 |T133736:0|t[防御魔法 101]。
    .collect 215815,1
    .isQuestAvailable 79948
step
    #completewith next
    .zone The Hinterlands >>前往: |cRXP_PICK_辛特兰|r
    .fly Hinterlands >>搭乘飞机前往 |cFFfa9602Hinterlands|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 81954
step
    .goto The Hinterlands,36.0,72.7
    >>点击 |cRXP_PICK_Book|r 获取 |T134942:0|t[Venomous Journeys]
    .collect 220350,1
    .isQuestAvailable 81954
step
    #completewith next
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
    .fly Arathi Highlands >>搭乘飞机前往 |cFFfa9602阿拉希高地|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79949
step
    .goto Arathi Highlands,74.0,65.0
    >>点击 |cRXP_PICK_Scroll|r 接收书籍 |T134331:0|t[谎言之网：揭穿神话与传说]
    .collect 215816,1
    .isQuestAvailable 79949
step
    #completewith next
    .zone Badlands >>前往: |cRXP_PICK_荒芜之地|r
    .fly >>使用飞行路径前往 |cFFfa9602Badlands|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79951
step
    .goto Badlands,56.7,39.9
    >>点击书籍 |T134937:0|t[木乃伊：令人厌恶的亡灵指南]
    .collect 215820,1
    .isQuestAvailable 79951
step
    .goto 1437,33.61,47.82
    >>点击湿地|r花瓶中的|cRXP_PICK_Scroll|r |cFFfa9602|r 获得|T237450:0|t[Goaz Scrolls.]
    .collect 209848,1
    .isQuestAvailable 78146
step
    #completewith next
    .zoneskip Westfall
    .fly Westfall >>前往: |cRXP_PICK_西部荒野|r |cRXP_WARN_by taking a flight path.|r
    .isQuestAvailable 78142
    .disablecheckbox
step
    .goto 1436,45.41,69.93,10,0
    .goto 1436,45.36,70.43
    >>点击位于 |cFFfa9602西部荒野月溪镇一所小房子里的炼金柜上的 |cRXP_PICK_法术书|r，获得 |T133733:0|t[迷惑与魅力。]
    .collect 209845,1
    .isQuestAvailable 78142
step
    #completewith next
    .zone Duskwood >>前往: |cRXP_PICK_暮色森林|r
    .fly Westfall >>搭乘飞机前往 |cFFfa9602Westfall|r |cRXP_WARN_如果你已经解锁但还没到达。|r
    .disablecheckbox
    .isQuestAvailable 78147
step
    .goto 1431,15.9,38.74,10,0
    .goto 1431,15.3,38.52,15,0
    .goto 1431,15.61,36.52,15,0
    .goto 1431,16.12,33.43,15,0
    .goto 1431,16.15,30.75,15,0
    .goto 1431,16.64,28.33
    >>点击暮色森林炼金桌上的晨木墓穴内的 |cRXP_PICK_Book|r |cFFfa9602|r 以获得 |T133738:0|t[违反解剖学的罪行。]
    >>|cRXP_WARN_建议跑到地下墓穴的尽头然后死掉。此外，你可能还需要考虑组队。|r
    .collect 209849,1
    .isQuestAvailable 78147
step
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
    .fly Swamp of Sorrows >>沿着飞行路线前往 |cFFfa9602悲伤沼泽|r |cRXP_WARN_如果你已解锁但尚未到达。|r
    .disablecheckbox
    .isQuestAvailable 79953
step
    #loop
    .goto 55.6,29.0,25,0
    .goto 65.0,23.2,25,0
    .goto 63.6,27.2,25,0
    .goto 57.0,33.0,25,0
    >>杀死 |cRXP_ENEMY_Lost One Hunter|r、|cRXP_ENEMY_Lost One Muckdweller|r、|cRXP_ENEMY_Lost One Cook|r 和 |cRXP_ENEMY_Lost One Seer|r 。从他们身上搜刮物品，获得 |cRXP_LOOT_|T237379:0|t[生锈的笼子钥匙]|r
    .collect 216523,1
    .mob Lost One Hunter
    .mob Lost One Muckdweller
    .mob Lost One Cook
    .mob Lost One Seer
    .isQuestAvailable 79953
step
    .goto Swamp of Sorrows,61.0,22.0
    >>点击 |cRXP_PICK_Rusted Cage|r 接收书籍 |T133742:0|t[卢德派恶魔宠物护理指南]
    .collect 215824,1
    .isQuestAvailable 79953
step
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
    .fly Swamp of Sorrows >>沿着飞行路线前往 |cFFfa9602悲伤沼泽|r |cRXP_WARN_如果你已解锁但尚未到达。|r
    .disablecheckbox
    .isQuestAvailable 81947
step
    .goto Swamp of Sorrows,70,51
    >>点击|cRXP_PICK_Book|r获取|T133738:0|t[Sanguine Sorcery]
    .collect 220345,1
    .isQuestAvailable 81947
step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
    .fly Blasted Lands >>搭乘飞机前往 |cFFfa9602Blasted Lands|r |cRXP_WARN_如果你已经解锁但还没到达。|r
    .disablecheckbox
    .isQuestAvailable 81955
step
    .goto Blasted Lands,55.3,32.2
    >>点击 |cRXP_PICK_Book|r 获取 |T133736:0|t[Conjurer's Codex]
    .collect 220353,1
    .isQuestAvailable 81955
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    .fly Stranglethorn Vale >>搭乘飞机前往 |cFFfa9602荆棘谷|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 79535
step
    .goto Stranglethorn Vale,41.0,51.0
    >>点击工作台上的 |cRXP_PICK_Researchnotes|r 接收书籍 |T237162:0|t[蛇怪：应该害怕石化吗？]
    .collect 213165,1
    .isQuestAvailable 79535
step
    #completewith next
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
    .fly Searing Gorge >>搭乘飞机前往 |cFFfa9602灼热峡谷|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 81955
step
    .goto Searing Gorge,37.8,49.6
    >>点击 |cRXP_PICK_Book|r 获取 |T133743:0|t[Stonerought Design]
    .collect 220352,1
    .isQuestAvailable 81955
step
    #completewith next
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
    .fly Searing Gorge >>搭乘飞机前往 |cFFfa9602灼热峡谷|r |cRXP_WARN_如果你已经解锁。|r
    .disablecheckbox
    .isQuestAvailable 81953
step
    .goto 1415,20.7,62
    >>点击 |cRXP_PICK_Book|r 获取 |T133743:0|t[Stonerought Design]
    .collect 220349,1
    .isQuestAvailable 81953
step
    #completewith next
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .cast 3563 >>使用 |T135766:0|t[传送幽暗城] |cRXP_WARN_如果你有|r |T134419:0|t[传送符文]
    .disablecheckbox
step
    .goto 1458,73.47,33.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Owen Thadd|r |cFFfa9602in Undercity, Magic Quarter.|r
    --x .accept is correct here because its a special kind of quest shiek
    .accept 78124 >>交回纳萨拉斯年鉴
    .accept 78127 >>提交达拉然文摘
    .accept 78142 >>交出迷惑和魅力
    .accept 78143 >>交出梦想家的秘密
    .accept 78145 >>上交 Arcanic 系统手册
    .accept 78146 >>交出 Goaz 卷轴
    .accept 78147 >>举报违反解剖学的罪行
    .accept 78148 >>交出巫王符文
    .accept 78149 >>交出土地之怒
    .accept 79094 >>交出塔佐的教训
    .accept 79095 >>交出药剂师的形而上学入门书
    .accept 79096 >>交出 Ataeric：关于神秘奇事
    .accept 79097 >>交出 Ataeric：Baxtan：论破坏性魔法
    .accept 79535 >>交出蛇怪：应该害怕石化吗？
    .accept 79947 >>风水学的转变：冷酷的真相
    .accept 79948 >>交出防御魔法 101
    .accept 77949 >>接任务: |cRXP_WARN_[Fashion Feathers]|r
    .accept 79950 >>交出恶魔和你
    .accept 79951 >>交出木乃伊：令人厌恶的亡灵指南
    .accept 79952 >>交出RwlRwlRwlRwl！
    .accept 81947 >>交出血红魔法
    .accept 81949 >>交出潮汐贤者传说
    .accept 81951 >>交出界限与奥秘
    .accept 81952 >>遵守日常礼仪
    .accept 81953 >>提交石雕设计图
    .accept 81954 >>交出毒液之旅
    .accept 81955 >>交出金属之心
    .accept 81956 >>交出魔法师法典
    .accept 79953 >>交出卢德派恶魔宠物护理指南
    .accept 78150 >>交出图书馆之友
    .accept 79536 >>交出“图书馆之友”
    .accept 82208 >>交出“图书馆之友”
    .target Owen Thadd
    .target Garion Wendell
step
    .goto Orgrimmar,50.0,68.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_The Banker|r
    .bankdeposit 209850,208185,208860,209845,209849,207972,210177,209848,209843,209851,209844,215817,215822,215683,215815,215816,215820,213165,215824,216523 >>|cRXP_WARN_存入剩余的书籍。|r
    .target Karus
    .target Komawa
    .target Soran
]]

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Legs
#name 活体火焰 - 6（艾尔文森林）
#title Living Flame

<< Alliance Mage SoD


step
    .train 401768,1
    .goto Stormwind City,55.8,65.2,-1
    .goto Stormwind City,32.4,80.0,-1
    .goto Stormwind City,43.4,26.8,-1
    .goto Stormwind City,36.0,74.8,-1
    .goto Elwynn Forest,64.8,69.2,-1
    .goto Ironforge,19.6,56.2,-1
    .goto Undercity,69.6,39.2,-1
    .goto Darnassus,38.8,60.4,-1
    .goto Ashenvale,35.0,48.6,-1
    .goto Ironforge,31.2,27.6,-1
    .goto Duskwood,76.0,45.2,-1
    .goto Darnassus,34.6,9.8,-1
    .goto Wetlands,8.4,56.6,-1
    >>从 |cRXP_FRIENDLY_Reagent Vendor|r 购买一个或多个 |T135933:0|t[Comprehension Charm]。
    .collect 211779,1
step
    .train 401768,1
    #completewith next
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
step
    #loop
    .goto Elwynn Forest,61.0,49.2,20,0
    .goto Elwynn Forest,61.2,51.6,20,0
    .goto Elwynn Forest,62.6,54.2,20,0
    .goto Elwynn Forest,63.6,58.6,20,0
    .train 401556,1
    >>杀死 |cRXP_ENEMY_Kobold Geomancer|r 掠夺他们以获得 |cRXP_LOOT_|T134939:0|t[法术注释：MILEGIN VALF]|r
    .collect 203752,1
    .mob Kobold Geomancer
step
    .collect 211779,1 >>您需要从 |cRXP_FRIENDLY_Reagent Vendor|r 处获得 |T135933:0|t[Comprehension Charm] 才能使用该物品。
    .train 401768 >>|cRXP_WARN_Use|r|T134939:0|t[|cRXP_FRIENDLY_Spell 注释：MILEGIN VALF|r] |cRXP_WARN_to learn|r |T135820:0|t[Living Flame]
    .use 203752
-- step
    --.engrave 7,401556 >>打开你的角色表并在你的腿上刻上|T135820:0|t[活火焰]。|cRXP_WARN_强烈推荐。|r
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Legs
#name 活体火焰-7（丹莫洛）
#title Living Flame

<< Alliance Mage SoD


step
    .train 401768,1
    .goto Stormwind City,55.8,65.2,-1
    .goto Stormwind City,32.4,80.0,-1
    .goto Stormwind City,43.4,26.8,-1
    .goto Stormwind City,36.0,74.8,-1
    .goto Elwynn Forest,64.8,69.2,-1
    .goto Ironforge,19.6,56.2,-1
    .goto Undercity,69.6,39.2,-1
    .goto Darnassus,38.8,60.4,-1
    .goto Ashenvale,35.0,48.6,-1
    .goto Ironforge,31.2,27.6,-1
    .goto Duskwood,76.0,45.2,-1
    .goto Darnassus,34.6,9.8,-1
    .goto Wetlands,8.4, 56.6,-1
    >>从 |cRXP_FRIENDLY_Reagent Vendor|r 购买一个或多个 |T135933:0|t[Comprehension Charm]。
    .collect 211779,1
step
    .train 401768,1
    #completewith next
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
step
    #loop
    .goto Dun Morogh,42.0,45.6,10,0
    .goto Dun Morogh,40.2,42.8,10,0
    .goto Dun Morogh,42.0,44.6,10,0
    .goto Dun Morogh,41.4,36.0,10,0
    .goto Dun Morogh,42.6,33.6,10,0
    .goto Dun Morogh,42.8,36.6,10,0
    .train 401556,1
    >>杀死 |cRXP_ENEMY_Frostmane Shadowcaster|r 和 |cRXP_ENEMY_霜鬃先知|r 以获得 |cRXP_LOOT_|T134939:0|t[法术说明：MILEGIN VALF]|r
    .collect 203746,1
    .mob Frostmane Shadowcaster
    .mob 霜鬃先知
step
    .collect 211779,1 >>您需要从 |cRXP_FRIENDLY_Reagent Vendor|r 处获得 |T135933:0|t[Comprehension Charm] 才能使用该物品。
    .train 401768 >>|cRXP_WARN_Use|r|T134939:0|t[|cRXP_FRIENDLY_Spell 注释：MILEGIN VALF|r] |cRXP_WARN_to learn|r |T135820:0|t[Living Flame]
    .use 203752
-- step
    --.engrave 7,401556 >>打开你的角色表并在你的腿上刻上|T135820:0|t[活火焰]。|cRXP_WARN_强烈推荐。|r
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Legs
#name 活体火焰 - 6（杜隆塔尔）
#title Living Flame

<< Horde Mage SoD


step
    .train 401768,1
    .goto Orgrimmar,45.6,56.8,
    .goto Orgrimmar,46.2,46.6,
    .goto Orgrimmar,45.8,40.6,
    .goto The Barrens,51.4,30.2,
    .goto Swamp of Sorrows,45.8,53.0,
    .goto Thunder Bluff,42.6,55.4,
    .goto Dustwallow Marsh,36.4,30.4,
    .goto Undercity,82.6,16.0,
    .goto Thunder Bluff,41.8,55.0,
    .goto Thousand Needles,45.2,50.6,
    .goto Stonetalon Mountains,47.6,61.6,
    >>从 |cRXP_FRIENDLY_Reagent Vendor|r 购买一个或多个 |T135933:0|t[Comprehension Charm]。
    .collect 211779,1
step
    #completewith Flame
    .train 401768,1
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step
    .train 401768,1
    >>杀死尘风洞内的 |cRXP_ENEMY_Burning Blade Orcs|r。从他们身上搜刮 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: MILEGIN VALF|r]
    .collect 203752,1
    .goto Durotar,52.83,29.02
    .mob Burning Blade Thug
    .mob Burning Blade Neophyte
    .xp >10,1
step
    #label Flame
    .train 401768,1
    >>杀死骷髅岩洞穴内的 |cRXP_ENEMY_Burning Blade Orcs|r。从他们身上搜刮物品，获得 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: MILEGIN VALF|r]
    .collect 203752,1
    .goto Durotar,55.0,9.8
    .mob Burning Blade Fanatic
    .mob Burning Blade Apprentice
step
    .collect 211779,1 >>您需要从 |cRXP_FRIENDLY_Reagent Vendor|r 处获得 |T135933:0|t[Comprehension Charm] 才能使用该物品。
    .train 401768 >>|cRXP_WARN_Use|r|T134939:0|t[|cRXP_FRIENDLY_Spell 注释：MILEGIN VALF|r] |cRXP_WARN_to learn|r |T135820:0|t[Living Flame]
    .use 203752
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Legs
#name 活体火焰 - 6（提瑞斯法林地）
#title Living Flame

<< Horde Mage SoD


step
    .train 401768,1
    .goto Orgrimmar,45.6,56.8,
    .goto Orgrimmar,46.2,46.6,
    .goto Orgrimmar,45.8,40.6,
    .goto The Barrens,51.4,30.2,
    .goto Swamp of Sorrows,45.8,53.0,
    .goto Thunder Bluff,42.6,55.4,
    .goto Dustwallow Marsh,36.4,30.4,
    .goto Undercity,82.6,16.0,
    .goto Thunder Bluff,41.8,55.0,
    .goto Thousand Needles,45.2,50.6,
    .goto Stonetalon Mountains,47.6,61.6,
    >>从 |cRXP_FRIENDLY_Reagent Vendor|r 购买一个或多个 |T135933:0|t[Comprehension Charm]。
    .collect 211779,1
step
    .train 401768,1
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 401768,1
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
    >>杀死 |cRXP_ENEMY_Scarlet Humans|r。掠夺他们以获得 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: MILEGIN VALF|r]
    .collect 203752,1
    .mob Scarlet Warrior
    .mob Scarlet Missionary
    .mob Scarlet Zealot
step
    .collect 211779,1 >>您需要从 |cRXP_FRIENDLY_Reagent Vendor|r 处获得 |T135933:0|t[Comprehension Charm] 才能使用该物品。
    .train 401768 >>|cRXP_WARN_Use|r|T134939:0|t[|cRXP_FRIENDLY_Spell 注释：MILEGIN VALF|r] |cRXP_WARN_to learn|r |T135820:0|t[Living Flame]
    .use 203752
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Gloves
#name 奥术冲击 - 18（灰谷）
#title Arcane Blast

<< Mage SoD

step << Alliance
    .train 401757,1
    .goto Stormwind City,55.8,65.2,-1
    .goto Stormwind City,32.4,80.0,-1
    .goto Stormwind City,43.4,26.8,-1
    .goto Stormwind City,36.0,74.8,-1
    .goto Elwynn Forest,64.8,69.2,-1
    .goto Ironforge,19.6,56.2,-1
    .goto Undercity,69.6,39.2,-1
    .goto Darnassus,38.8,60.4,-1
    .goto Ashenvale,35.0,48.6,-1
    .goto Ironforge,31.2,27.6,-1
    .goto Duskwood,76.0,45.2,-1
    .goto Darnassus,34.6,9.8,-1
    .goto Wetlands,8.4, 56.6,-1
    >>从 |cRXP_FRIENDLY_Reagent Vendor|r 购买一个或多个 |T135933:0|t[Comprehension Charm]。
    .collect 211779,1
step << Horde
    .goto Orgrimmar,45.6,56.8,
    .goto Orgrimmar,46.2,46.6,
    .goto Orgrimmar,45.8,40.6,
    .goto The Barrens,51.4,30.2,
    .goto Swamp of Sorrows,45.8,53.0,
    .goto Thunder Bluff,42.6,55.4,
    .goto Dustwallow Marsh,36.4,30.4,
    .goto Undercity,82.6,16.0,
    .goto Thunder Bluff,41.8,55.0,
    .goto Thousand Needles,45.2,50.6,
    .goto Stonetalon Mountains,47.6,61.6,
    >>从 |cRXP_FRIENDLY_Reagent Vendor|r 购买一个或多个 |T135933:0|t[Comprehension Charm]。
    .collect 211779,1
step
    .train 401757,1
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step
    .aura 430139,1 >>|cRXP_WARN_施放|r |T136116:0|t[秘法爆炸] |cRXP_WARN_在|r |cRXP_PICK_紫水晶|r |cRXP_WARN_旁边以获得|r |T135734:0|t[秘法充能] |cRXP_WARN_增益|r
    .goto Ashenvale,13.06,24.84
    .train 401757,1
step
    .aura 430139,2+ >>|cRXP_WARN_Cast|r |T136116:0|t[秘法爆炸] |cRXP_WARN_在|r |cRXP_PICK_紫水晶|r |cRXP_WARN_获得另一层|r |T135734:0|t[秘法充能] |cRXP_WARN_buff|r
    .goto Ashenvale,14.04,19.80
    .train 401757,1
step
    .aura 430139,3+ >>|cRXP_WARN_Cast|r |T136116:0|t[秘法爆炸] |cRXP_WARN_在|r |cRXP_PICK_紫水晶|r |cRXP_WARN_获得另一层|r |T135734:0|t[秘法充能] |cRXP_WARN_buff|r
    .goto Ashenvale,13.50,15.75
    .train 401757,1
step
    .collect 211779,1 >>您需要从 |cRXP_FRIENDLY_Reagent Vendor|r 处获得 |T135933:0|t[Comprehension Charm] 才能使用该物品。
    .train 401757 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：奥术冲击|r] |cRXP_WARN_训练|r |T135820:0|t[奥术冲击]
    .use 211691
step
    #optional
    .destroy 211777 >>销毁 |T133737：0|吨[纳迦手稿]。你不再需要它
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Gloves
#name 活体炸弹-11（洛克莫丹）
#title Living Bomb

<< Alliance Mage SoD


step
    +|cRXP_WARN_你必须至少达到 11 级才能单独获得|r |T236220:0|t[活体炸弹] |cRXP_WARN_in 洛克莫丹|r
    .train 415936,1
    .xp >11,1
step
    #optional
    #label Charm
    #completewith Comprehension
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .train 415936,1
step
    #optional
    #requires Charm
    #completewith Comprehension
    .goto Ironforge,31.33,27.80,8,0
    .goto Ironforge,30.47,26.57,6 >>进入 |cRXP_FRIENDLY_Ginny Longberry|r 的房子
    .train 415936,1
step
    #label Comprehension
    .goto Ironforge,31.33,27.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉恩|r, 他在里面
    >>|cRXP_BUY_从她那里购买一个或多个|r |T135933:0|t[理解咒] |cRXP_BUY_|r
    .collect 211779,1 --Comprehension Charm (1)
    .target Ginny Longberry
    .train 415936,1
step
    #label Loch1
    #completewith Tengi
    .zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r
    .train 415936,1
step
    .goto Loch Modan,29.2,81.2,15,0
    .goto Loch Modan,28.8,83.4,15,0
    .goto Loch Modan,30.0,83.8,15,0
    .goto Loch Modan,32.2,87.2,15,0
    .goto Loch Modan,33.8,88.6,15,0
    .goto Loch Modan,36.0,88.0,15,0
    .goto Loch Modan,36.6,81.2,15,0
    .goto Loch Modan,36.6,79.6,15,0
    .train 415936,1
    >>杀死 |cRXP_ENEMY_Stonesplinter Seer|r 并掠夺他们以获得 |cRXP_LOOT_|T134939:0|t[Chewed Spell Notes]|r
    .collect 208854,1
    .mob Stonesplinter Seer
step
    .collect 211779,1 >>您需要从 |cRXP_FRIENDLY_Reagent Vendor|r 处获得 |T135933:0|t[Comprehension Charm] 才能使用该物品。
    .train 415936 >>|T134939:0|t[|cRXP_FRIENDLY_Chewed Spell Notes|r] 学习 |T236220:0|t[Living Bomb]
    .use 208854
-- step
    --.engrave 9,400613 >>打开你的角色表并在你的手套上刻上|T236220:0|t[活体炸弹]。
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Gloves
#name 活体炸弹 - 18（西部荒野）
#title Living Bomb

<< Alliance Mage SoD


step
    .train 415936,1
    .goto Stormwind City,55.8,65.2,-1
    .goto Stormwind City,32.4,80.0,-1
    .goto Stormwind City,43.4,26.8,-1
    .goto Stormwind City,36.0,74.8,-1
    .goto Elwynn Forest,64.8,69.2,-1
    .goto Ironforge,19.6,56.2,-1
    .goto Undercity,69.6,39.2,-1
    .goto Darnassus,38.8,60.4,-1
    .goto Ashenvale,35.0,48.6,-1
    .goto Ironforge,31.2,27.6,-1
    .goto Duskwood,76.0,45.2,-1
    .goto Darnassus,34.6,9.8,-1
    .goto Wetlands,8.4, 56.6,-1
    >>从 |cRXP_FRIENDLY_Reagent Vendor|r 购买一个或多个 |T135933:0|t[Comprehension Charm]。
    .collect 211779,1
step
    .train 415936,1
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
    #loop
    .goto Westfall,55.2,33.6,20,0
    .goto Westfall,45.0,40.8,20,0
    .goto Westfall,35.6,52.2,20,0
    >>杀死 |cRXP_ENEMY_Harvest Watcher|r 以获得 |cRXP_LOOT_|T132996:0|t[备用收割机零件]|r
    .train 401417,1
    .collect 209056,1
    .mob Harvest Golem
    .mob Harvest Repair
    .mob Harvest Watcher
    .mob Rusty Harvest Golem
step
    #loop
    .goto Westfall,55.2,33.6,20,0
    .goto Westfall,45.0,40.8,20,0
    .goto Westfall,35.6,52.2,20,0
    >>杀死 |cRXP_ENEMY_Dust Devils|r 以获得 |cRXP_LOOT_|T132842:0|t[Elemental Core]|r
    .train 401417,1
    .collect 209058,1
    .mob Dust Devil
step
    .train 401417,1
    >>使用 |T132996:0|t[备用收割机零件]|r| 来创建 |T133000:0|t[原型引擎]
    .collect 209057,1
    .use 209058
    .use 209056
step
    .train 401417,1
    .goto Westfall,55.2,33.6,20,0
    .goto Westfall,45.0,40.8,20,0
    .goto Westfall,35.6,52.2,20,0
    .collect 208851,1 >>找到 |cRXP_FRIENDLY_Harvest Reaper Prototype|r 并使用 |T133000:0|t[Prototype Engine]。继续杀死 |cRXP_ENEMY_Harvest Reaper Prototype。|r
    .target Harvest Reaper Prototype
    .mob Harvest Reaper Prototype
    .use 209057
step
    .collect 211779,1 >>您需要从 |cRXP_FRIENDLY_Reagent Vendor|r 处获得 |T135933:0|t[Comprehension Charm] 才能使用该物品。
    .train 415936 >>|T134939:0|t[|cRXP_FRIENDLY_Chewed Spell Notes|r] 学习 |T236220:0|t[Living Bomb]
    .use 208854
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Gloves
#name 活体炸弹-17（银松森林）
#title Living Bomb

<< Horde Mage SoD

step
    .train 415936,1
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .train 415936,1
    >>杀死芬里斯岛上的 |cRXP_ENEMY_Rot Hides|r |cFFfa9602。|r 搜刮它们可获得 |T134173:0|t[会说话的头颅]。|cRXP_WARN_将其放入背包中点击。|r
    .goto Silverpine Forest,66.0,24.7
    .collect 3317,1
    .accept 460 >>接任务: |cRXP_WARN_支离破碎|r
    .use 3317
    .mob Rot Hide Brute
    .mob Rot Hide Plague Weaver
    .mob Rot Hide Savage
    .mob Raging Rot Hide
step
    .train 415936,1
    >>与 |cRXP_PICK_Shallow Grave|r 互动
    .goto Silverpine Forest,67.8,24.8
    .turnin 460 >>交任务: |cRXP_FRIENDLY_支离破碎|r
    .accept 461 >>接任务: |cRXP_WARN_密室|r
    .target Shallow Grave
step
    .train 415936,1
    >>与 |cRXP_PICK_Dusty Shelf|r |cRXP_WARN_城堡内左上塔楼的物体互动（经过第一个楼梯后向左走）|r
    .goto Silverpine Forest,65.3,24.8
    .turnin 461 >>交任务: |cRXP_FRIENDLY_密室|r
    .accept 491 >>接任务: |cRXP_WARN_给比索的魔杖|r
    .target Dusty Shelf
step
    .train 415936,1
    #completewith next
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r, 如果你有幽暗城飞行点你可以死亡跳跃到墓穴然后从那里飞
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_比索·埃斯沙德|r
    .goto Undercity,83.8,16.2
    .turnin 491 >>交任务: |cRXP_FRIENDLY_给比索的魔杖|r
    .accept 78277 >>接受一份感谢的礼物
    .turnin 78277 >>交出一份谢意
    .train 415936 >>|cRXP_WARN_你将通过提交任务自动训练符文|r
    .target Bethor Iceshard
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Gloves
#name 活体炸弹 - 20（贫瘠之地）
#title Living Bomb

<< Horde Mage SoD

step
    #optional
    .train 415936,1
    .train 1953,1
    +|cRXP_WARN_你必须训练|r |T135736:0|t[闪烁] |cRXP_WARN_才能获得|r |T236220:0|t[活体炸弹] |cRXP_WARN_符文|r
step
    #optional
    .train 415936,1
    .goto Orgrimmar,45.6,56.8,-1
    .goto Orgrimmar,46.2,46.6,-1
    .goto Orgrimmar,45.8,40.6,-1
    .goto The Barrens,51.4,30.2,-1
    .goto Swamp of Sorrows,45.8,53.0,-1
    .goto Thunder Bluff,42.6,55.4,-1
    .goto Dustwallow Marsh,36.4,30.4,-1
    .goto Undercity,82.6,16.0,-1
    .goto Thunder Bluff,41.8,55.0,-1
    .goto Thousand Needles,45.2,50.6,-1
    .goto Stonetalon Mountains,47.6,61.6,-1
    >>|cRXP_BUY_购买一个或多个|r |T135933:0|t[理解护身符] |cRXP_BUY_来自|r |cRXP_FRIENDLY_试剂供应商|r
    .collect 211779,1
step
    .train 415936,1
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 415936,1
    .goto The Barrens,45.45,80.00
    .aura 421063,1 >>|cRXP_WARN_对着墙上的|r |cRXP_PICK_蚀刻雕刻|r |cRXP_WARN_眨眼即可获得|r |T236168:0|t[无台阶之路] |cRXP_WARN_buff|r
step
    .train 415936,1
    .goto The Barrens,45.28,80.14,5,0
    .goto The Barrens,45.23,80.42,5,0
    .goto The Barrens,45.06,80.57,5,0
    .goto The Barrens,44.94,80.80,5,0
    .goto The Barrens,44.87,81.08,5,0
    .goto The Barrens,44.80,81.37
    .train 415936 >>|cRXP_WARN_Cast|r |T135736:0|t[闪烁] |cRXP_WARN_逐个进入绿色圆圈。最后，对着|r |cRXP_PICK_蚀刻雕刻|r |cRXP_WARN_进行闪烁训练|r |T236220:0|t[活体炸弹]
]])

RXPGuides.RegisterGuide([[
#classic
<< Mage SoD
#group RestedXP 符文书指南
#subgroup Belt
#title Spellfrost Bolt/Frostfire Bolt
#name 冰霜箭/霜火箭 - 37 (荆棘谷)

step << Alliance
    .train 415948,1
    .train 401762,1
    .goto Stormwind City,55.8,65.2,-1
    .goto Stormwind City,32.4,80.0,-1
    .goto Stormwind City,43.4,26.8,-1
    .goto Stormwind City,36.0,74.8,-1
    .goto Elwynn Forest,64.8,69.2,-1
    .goto Ironforge,19.6,56.2,-1
    .goto Undercity,69.6,39.2,-1
    .goto Darnassus,38.8,60.4,-1
    .goto Ashenvale,35.0,48.6,-1
    .goto Ironforge,31.2,27.6,-1
    .goto Duskwood,76.0,45.2,-1
    .goto Darnassus,34.6,9.8,-1
    .goto Wetlands,8.4, 56.6,-1
    >>|cRXP_BUY_购买一个或多个|r |T135933:0|t[理解护身符] |cRXP_BUY_来自|r |cRXP_FRIENDLY_试剂供应商|r
    .collect 211779,1
step << Horde
    .train 415948,1
    .train 401762,1
    .goto Orgrimmar,45.6,56.8,-1
    .goto Orgrimmar,46.2,46.6,-1
    .goto Orgrimmar,45.8,40.6,-1
    .goto The Barrens,51.4,30.2,-1
    .goto Swamp of Sorrows,45.8,53.0,-1
    .goto Thunder Bluff,42.6,55.4,-1
    .goto Dustwallow Marsh,36.4,30.4,-1
    .goto Undercity,82.6,16.0,-1
    .goto Thunder Bluff,41.8,55.0,-1
    .goto Thousand Needles,45.2,50.6,-1
    .goto Stonetalon Mountains,47.6,61.6,-1
    >>|cRXP_BUY_购买一个或多个|r |T135933:0|t[理解护身符] |cRXP_BUY_来自|r |cRXP_FRIENDLY_试剂供应商|r
    .collect 211779,1
step
    .train 415948,1
    .train 401762,1
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
step
    .train 415948,1
    .train 401762,1
    #loop
    .goto Stranglethorn Vale,46.6,30.0,60,0
    .goto Stranglethorn Vale,43.6,33.2,60,0
    .goto Stranglethorn Vale,46.4,40.6,60,0
    .goto Stranglethorn Vale,48.6,40.8,60,0
    >>杀死 |cRXP_ENEMY_Skullsplitter Mystics|r。从他们身上搜刮 |T134939:0|t[|cRXP_LOOT_Spell 注释：PELFRB STOLLOTS]|r 和 |T134939:0|t[|cRXP_LOOT_Spell 注释：TROFF IRESTBOL|r]
    .collect 213127,1
    .collect 217161,1
    .mob Skullsplitter Mystic
step << Alliance
    #optional
    #completewith next
    .train 415948,1
    .train 401762,1
    .goto Stormwind City,55.8,65.2,-1
    .goto Stormwind City,32.4,80.0,-1
    .goto Stormwind City,43.4,26.8,-1
    .goto Stormwind City,36.0,74.8,-1
    .goto Elwynn Forest,64.8,69.2,-1
    .goto Ironforge,19.6,56.2,-1
    .goto Undercity,69.6,39.2,-1
    .goto Darnassus,38.8,60.4,-1
    .goto Ashenvale,35.0,48.6,-1
    .goto Ironforge,31.2,27.6,-1
    .goto Duskwood,76.0,45.2,-1
    .goto Darnassus,34.6,9.8,-1
    .goto Wetlands,8.4, 56.6,-1
    >>|cRXP_BUY_从 |cRXP_FRIENDLY_试剂供应商|r 购买一个或多个|r |T135933:0|t[理解护身符] |cRXP_BUY_来解读符文|r
    .collect 211779,1
step << Horde
    #optional
    #completewith next
    .train 415948,1
    .train 401762,1
    .goto Orgrimmar,45.6,56.8,-1
    .goto Orgrimmar,46.2,46.6,-1
    .goto Orgrimmar,45.8,40.6,-1
    .goto The Barrens,51.4,30.2,-1
    .goto Swamp of Sorrows,45.8,53.0,-1
    .goto Thunder Bluff,42.6,55.4,-1
    .goto Dustwallow Marsh,36.4,30.4,-1
    .goto Undercity,82.6,16.0,-1
    .goto Thunder Bluff,41.8,55.0,-1
    .goto Thousand Needles,45.2,50.6,-1
    .goto Stonetalon Mountains,47.6,61.6,-1
    >>|cRXP_BUY_从 |cRXP_FRIENDLY_试剂供应商|r 购买一个或多个|r |T135933:0|t[理解护身符] |cRXP_BUY_来解读符文|r
    .collect 211779,1
step
    .train 415948 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_LOOT_法术说明：PELFRB STOLLOTS|r] |cRXP_WARN_训练|r |T135780:0|t[法术霜冻之箭]
    .train 401762 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_LOOT_法术说明：TROFF IRESTBOL|r] |cRXP_WARN_训练|r |T236217:0|t[霜火之箭]
    .use 213127
    .use 217161
]])

RXPGuides.RegisterGuide([[
#classic
<< Mage SoD
#group RestedXP 符文书指南
#subgroup Helmet
#name 连胜 - 32（奥特兰克山脉）
#title Hot Streak

-- Hot Streak

step
    #optional
    .train 401749,1
    .train 2121,1 -- flamestrike r2
    .train 8422,1 -- flamestrike r3
    .train 8423,1 -- flamestrike r4
    .train 2120 >>|cRXP_WARN_你必须经过|r |T135826:0|t[Flamestrike] |cRXP_WARN_trained 才能获得|r |T236218:0|t[Hot Streak] |cRXP_WARN_rune|r
step
    .train 401749,1
    .goto Alterac Mountains,60.510,46.286
    .zone Alterac Mountains >>前往: |cRXP_PICK_奥特兰克山脉|r
step
    .train 401749,1
    .goto Alterac Mountains,60.510,46.286,-1
    .goto Alterac Mountains,60.278,44.900,-1
    >>|cRXP_WARN_对斯特兰布莱德铁匠铺建筑上的两个风箱施放|r |T135826:0|t[烈焰冲击] |cRXP_WARN_。一旦其中一个风箱开始发出红光和火焰，对第二个风箱再次施放|r |T135826:0|t[烈焰冲击] |cRXP_WARN_，将其点燃。这将触发|cRXP_ENEMY_Ancient Fire Elemental|r 生成|r
    >>杀死 |cRXP_ENEMY_Ancient Fire Elemental|r。拾取它以获得 |T134939:0|t[|cRXP_LOOT_Spell Notes: Hot Streak|r]
    .collect 213113,1
    .mob Ancient Fire Elemental
step
    .train 401749 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_LOOT_法术说明：连续击中|r] |cRXP_WARN_进行训练|r |T236218:0|t[连续击中]
    .use 213113
]])

RXPGuides.RegisterGuide([[
#classic
<< Mage SoD
#group RestedXP 符文书指南
#subgroup Belt
#name 连胜纪录 - 37（阿拉希高地）
#title Hot Streak

-- Hot Streak

step
    .train 401749,1
    #completewith next
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    .train 401749,1
    .goto Arathi Highlands,67.46,28.79,40,0
    .goto Arathi Highlands,65.47,28.77,40,0
    .goto Arathi Highlands,65.87,31.24,40,0
    .goto Arathi Highlands,67.47,30.65,40,0
    .goto Arathi Highlands,66.82,29.77
    >>杀死 |cRXP_ENEMY_Burning Exiles|r。掠夺他们以获得 |T134939:0|t[|cRXP_LOOT_Spell Notes: Hot Streak|r]
    >>|cRXP_WARN_注意：据报道，该物品掉落率相对较低。你可能需要考虑从奥特兰克山脉获取|r
    .collect 213113,1
    .mob Burning Exile
step
    .train 401749 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_LOOT_法术说明：连续击中|r] |cRXP_WARN_进行训练|r |T236218:0|t[连续击中]
    .use 213113
]])

RXPGuides.RegisterGuide([[
#classic
<< Mage SoD
#group RestedXP 符文书指南
#subgroup Boots
#name 时间静态保存 - 30（千针石林）
#title Chronostatic Preservation

step
    .train 416028,1
    #completewith SpellNotes
    +|cRXP_WARN_确保至少带一位其他 |cFF69CCF0Mage|r 朋友一起完成以下步骤！下一部分无法单独完成！|r
step
    .train 425189,1
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
step
    .train 425189,1
    #loop
    .goto Thousand Needles,23.2,25.0,25,0
    .goto Thousand Needles,20.2,22.0,25,0
    .goto Thousand Needles,17.6,19.6,25,0
    .goto Thousand Needles,18.6,24.6,25,0
    >>杀死 |cRXP_ENEMY_Galak Marauders|r、|cRXP_ENEMY_Galak Maulers|r 和 |cRXP_ENEMY_Galak Stormers|r。从他们身上搜刮 |cRXP_LOOT_Cougar Cage Key|r
    .collect 214435,1
    .mob Galak Mauler
    .mob Galak Marauder
    .mob Galak Stormer
    .itemcount 213634,<1
step
    #completewith next
    .goto Thousand Needles,23.714,24.780
    +打开 |cRXP_PICK_Cougar Cage|r 释放 |cRXP_ENEMY_Seared Needles Cougar|r
    .itemcount 214435,1
step
    .train 425189,1
    .goto Thousand Needles,23.714,24.780
    >>杀死 |cRXP_ENEMY_Seared Needles Cougar|r。从她身上搜刮物品，获得 |T134943:0|t[|cRXP_LOOT_Partial Spell Notes|r]
    >>|cRXP_WARN_你必须只使用冰霜法术来削弱它，这样它才能受到伤害|r
    .mob Seared Needles Cougar
    .collect 213634,1
step
    .train 425189,1
    .goto Thousand Needles,13.598,33.854,40,0
    .goto Thousand Needles,10.81,39.60
    >>杀死 |cRXP_ENEMY_Singed Highperch Consort|r。拾取它以获得 |T134938:0|t[|cRXP_LOOT_Partial Spell Notes|r]
    >>|cRXP_WARN_你必须只使用冰霜法术来削弱它，这样它才能受到伤害|r
    .collect 213633,1
    .mob Singed Highperch Consort
step
    #label SpellNotes
    .train 425189,1
    .goto Thousand Needles,26.66,46.38
    >>杀死 |cRXP_ENEMY_Scorched Screeching Roguefeather|r。拾取它以获得 |T134937:0|t[|cRXP_LOOT_Partial Spell Notes|r]
    >>|cRXP_WARN_你必须只使用冰霜法术来削弱它，这样它才能受到伤害|r
    .collect 213632,1
    .mob Scorched Screeching Roguefeather
step
    .train 425189,1
    >>|cRXP_WARN_使用|r |T134943:0|t|T134938:0|t|T134937:0|t[|cRXP_LOOT_部分法术说明|r] |cRXP_WARN_创建|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：时间静态保存|r]
    .collect 213116,1
    .use 213634
    .use 213633
    .use 213632
step
    .train 425189 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_拼写说明：Chronostatic Preservation|r |cRXP_WARN_进行训练|r |T135729:0|t[Chronostatic Preservation]
    .use 213116
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Helmet
#name 时间异常 - 42（艾泽拉斯）


<< Mage SoD

step
    .train 429306,1
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
    .train 429306,1
    #loop
    .goto Feralas,76.0,58.4,20,0
    .goto Feralas,76.8,63.6,20,0
    .goto Feralas,72.6,63.8,20,0
    .goto Feralas,75.0,59.2,20,0
    >>杀死 |cRXP_ENEMY_Zukk'ash 部队。|r 掠夺他们以获得 |T237070:0|t[Zukk'ash 树脂。]
    .collect 221361,5
    .mob Zukk'ash Worker
    .mob Zukk'ash Stinger
    .mob Zukk'ash Tunneler
    .mob Zukk'ash Wasp
step
    .train 429306,1
    .zone The Hinterlands >>前往: |cRXP_PICK_辛特兰|r
step
    .train 429306,1
    >>杀死 |cRXP_ENEMY_猫头鹰beast。|r 掠夺它们以获得 |cRXP_LOOT_|T132914:0|tPristine 猫头鹰beast Quill。|r
    .collect 221359,1
    .mob Primitive 猫头鹰beast
    .mob Savage 猫头鹰beast
    .mob Vicious 猫头鹰beast
step
    .train 429306,1
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
step
    .train 429306,1
    >>杀死|cRXP_ENEMY_Zul'Farrak Zombie|r。掠夺它们以获取 |cRXP_LOOT_|T237132:0|tFarraki Papyrus。|r
    .collect 221360,8
    .mob Zul'Farrak Zombie
step << Horde
    .train 429306,1
    .goto 1458,73.47,33.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Owen Thadd|r |cFFfa9602in Undercity, Magic Quarter.|r
    .accept 82054
step << Alliance
    .train 429306,1
    .goto Stormwind City,37.81,79.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garion Wendell|r |cFFfa9602in Stormwind, Mage Tower.|r
    .accept 82054
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup 护腕（野火之箭）
#name 野火箭 - 15（西部荒野）

<< Mage SoD

step << Alliance
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Horde
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
step
    .train 429311,1
    #label Scroll of Spatial Mending
    >>|cRXP_BUY_从拍卖行购买|r |T134945:0|t[空间修复卷轴] |cRXP_BUY_。|r |cRXP_WARN_或者附魔师可以为您制作它。|r
    .collect 220792,1 --Scroll of Spatial Mending
step
    .train 429311,1
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
    .train 429311,1
    #loop
    .goto Westfall,47.0,39.4,40,0
    .goto Westfall,51.0,32.6,40,0
    .goto Westfall,47.6,22.0,40,0
    .goto Westfall,46.8,12.6,40,0
    .goto Westfall,41.6,15.2,40,0
    .goto Westfall,32.4,29.2,40,0
    .goto Westfall,29.8,34.4,40,0
    .goto Westfall,31.8,39.4,40,0
    .goto Westfall,28.6,44.0,40,0
    .goto Westfall,29.0,47.8,40,0
    .goto Westfall,29.0,58.8,40,0
    .goto Westfall,31.4,65.6,40,0
    .goto Westfall,29.6,69.4,40,0
    .goto Westfall,32.2,76.0,40,0
    .goto Westfall,32.2,80.2,40,0
    .goto Westfall,34.0,82.2,40,0
    .goto Westfall,37.8,85.4,40,0
    .goto Westfall,47.6,79.6,40,0
    .goto Westfall,51.6,71.4,40,0
    .goto Westfall,47.6,67.2,40,0
    .goto Westfall,62.6,26.6,40,0
    .goto Westfall,57.0,10.6,40,0
    .cast 448381 >>在 |cRXP_PICK_Portal|r 上使用 |cRXP_FRIENDLY_Scroll of Spatial Mending|r 来召唤 |cRXP_ENEMY_Fel Interloper。|r
    .target Fel Silver
    .target Fel Crack
    .target Fel Tear
    .target Fel Scar
    .target Fel Rift
    .use 220792
step
    >>杀死 |cRXP_ENEMY_Fel Interloper|r。从他身上搜刮 |cRXP_LOOT_|T134939:0|tSpell Notes: Balefire Bolt。|r
    .collect 223147,1 --Spell Notes: Balefire Bolt
    .mob Fel Interloper
step
    .train 429311 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：Balefire Bolt|r |cRXP_WARN_训练|r |T135809:0|t[Balefire Bolt]
    .use 223147
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup 护腕（野火之箭）
#name 野火之箭 - 35（凄凉之地）

<< Mage SoD

step << Alliance
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Horde
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .train 429311,1
    #label Scroll of Spatial Mending
    >>|cRXP_BUY_从拍卖行购买|r |T134945:0|t[空间修复卷轴] |cRXP_BUY_。|r |cRXP_WARN_或者附魔师可以为您制作它。|r
    .collect 220792,1 --Scroll of Spatial Mending
step
    .train 429311,1
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .train 429311,1
    #loop
    .goto Desolace,71.6,18.4,40,0
    .goto Desolace,73.6,24.8,40,0
    .goto Desolace,80.4,17.0,40,0
    .goto Desolace,74.6,10.4,40,0
    .goto Desolace,54.4,19.2,40,0
    .goto Desolace,47.4,22.2,40,0
    .goto Desolace,56.0,74.8,40,0
    .goto Desolace,52.0,85.6,40,0
    .goto Desolace,49.6,74.8,40,0
    .cast 448381 >>在 |cRXP_PICK_Portal|r 上使用 |cRXP_FRIENDLY_Scroll of Spatial Mending|r 来召唤 |cRXP_ENEMY_Fel Interloper。|r
    .target Fel Silver
    .target Fel Crack
    .target Fel Tear
    .target Fel Scar
    .target Fel Rift
    .use 220792
step
    >>杀死 |cRXP_ENEMY_Fel Interloper|r。从他身上搜刮 |cRXP_LOOT_|T134939:0|tSpell Notes: Balefire Bolt。|r
    .collect 223147,1 --Spell Notes: Balefire Bolt
    .mob Fel Interloper
step
    .train 429311 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：Balefire Bolt|r |cRXP_WARN_进行训练|r |T135809:0|t[Balefire Bolt。]
    .use 223147
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup 护腕（野火之箭）
#name 野火箭 - 45（菲拉斯）

<< Mage SoD

step << Alliance
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Horde
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .train 429311,1
    #label Scroll of Spatial Mending
    >>|cRXP_BUY_从拍卖行购买|r |T134945:0|t[空间修复卷轴] |cRXP_BUY_。|r |cRXP_WARN_或者附魔师可以为您制作它。|r
    .collect 220792,1 --Scroll of Spatial Mending
step
    .train 429311,1
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
    .train 429311,1
    #loop
    .goto Feralas,74.2,50.8,40,0
    .goto Feralas,73.2,54.4,40,0
    .goto Feralas,74.2,56.8,40,0
    .goto Feralas,76.2,56.6,40,0
    .goto Feralas,74.2,60.0,40,0
    .goto Feralas,76.6,63.6,40,0
    .goto Feralas,72.6,63.8,40,0
    .goto Feralas,70.6,62.6,40,0
    .goto Feralas,68.2,58.8,40,0
    .cast 448381 >>在 |cRXP_PICK_Portal|r 上使用 |cRXP_FRIENDLY_Scroll of Spatial Mending|r 来召唤 |cRXP_ENEMY_Fel Interloper。|r
    .target Fel Silver
    .target Fel Crack
    .target Fel Tear
    .target Fel Scar
    .target Fel Rift
    .use 220792
step
    >>杀死 |cRXP_ENEMY_Fel Interloper|r。从他身上搜刮 |cRXP_LOOT_|T134939:0|tSpell Notes: Balefire Bolt。|r
    .collect 223147,1 --Spell Notes: Balefire Bolt
    .mob Fel Interloper
step
    .train 429311 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：Balefire Bolt|r |cRXP_WARN_进行训练|r |T135809:0|t[Balefire Bolt。]
    .use 223147
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup 护腕（野火之箭）
#name 野火之箭 - 45（艾萨拉）

<< Mage SoD

step << Alliance
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Horde
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .train 429311,1
    #label Scroll of Spatial Mending
    >>|cRXP_BUY_从拍卖行购买|r |T134945:0|t[空间修复卷轴] |cRXP_BUY_。|r |cRXP_WARN_或者附魔师可以为您制作它。|r
    .collect 220792,1 --Scroll of Spatial Mending
step
    .train 429311,1
    #completewith next
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
step
    .train 429311,1
    #loop
    .goto Azshara,17.6,58.8,40,0
    .goto Azshara,16.6,51.0,40,0
    .goto Azshara,21.2,54.0,40,0
    .goto Azshara,24.8,47.8,40,0
    .goto Azshara,33.0,81.6,40,0
    .goto Azshara,30.2,79.8,40,0
    .goto Azshara,25.2,81.6,40,0
    .cast 448381 >>在 |cRXP_PICK_Portal|r 上使用 |cRXP_FRIENDLY_Scroll of Spatial Mending|r 来召唤 |cRXP_ENEMY_Fel Interloper。|r
    .target Fel Silver
    .target Fel Crack
    .target Fel Tear
    .target Fel Scar
    .target Fel Rift
    .use 220792
step
    >>杀死 |cRXP_ENEMY_Fel Interloper|r。从他身上搜刮 |cRXP_LOOT_|T134939:0|tSpell Notes: Balefire Bolt。|r
    .collect 223147,1 --Spell Notes: Balefire Bolt
    .mob Fel Interloper
step
    .train 429311 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：Balefire Bolt|r |cRXP_WARN_进行训练|r |T135809:0|t[Balefire Bolt。]
    .use 223147
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup 护腕（野火之箭）
#name 烈焰箭 - 35（诅咒之地）

<< Mage SoD

step << Alliance
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Stormwind City>>前往: |cRXP_PICK_暴风城|r
step << Horde
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
step
    .train 429311,1
    #label Scroll of Spatial Mending
    >>|cRXP_BUY_从拍卖行购买|r |T134945:0|t[空间修复卷轴] |cRXP_BUY_。|r |cRXP_WARN_或者附魔师可以为您制作它。|r
    .collect 220792,1 --Scroll of Spatial Mending
step
    .train 429311,1
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
step
    .train 429311,1
    #loop
    .goto Blasted Lands,56.2,36.6,40,0
    .goto Blasted Lands,62.0,39.2,40,0
    .goto Blasted Lands,60.2,46.8,40,0
    .goto Blasted Lands,49.0,48.2,40,0
    .goto Blasted Lands,46.8,39.2,40,0
    .goto Blasted Lands,41.4,33.6,40,0
    .goto Blasted Lands,43.8,25.0,40,0
    .goto Blasted Lands,35.0,54.8,40,0
    .cast 448381 >>在 |cRXP_PICK_Portal|r 上使用 |cRXP_FRIENDLY_Scroll of Spatial Mending|r 来召唤 |cRXP_ENEMY_Fel Interloper。|r
    .target Fel Silver
    .target Fel Crack
    .target Fel Tear
    .target Fel Scar
    .target Fel Rift
step
    >>杀死 |cRXP_ENEMY_Fel Interloper|r。从他身上搜刮 |cRXP_LOOT_|T134939:0|tSpell Notes: Balefire Bolt。|r
    .collect 223147,1 --Spell Notes: Balefire Bolt
    .mob Fel Interloper
step
    .train 429311 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：Balefire Bolt|r |cRXP_WARN_进行训练|r |T135809:0|t[Balefire Bolt。]
    .use 223147
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup 护腕（野火之箭）
#name 野火箭 - 15（贫瘠之地）

<< Mage SoD

step << Alliance
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Horde
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .train 429311,1
    #label Scroll of Spatial Mending
    >>|cRXP_BUY_从拍卖行购买|r |T134945:0|t[空间修复卷轴] |cRXP_BUY_。|r |cRXP_WARN_或者附魔师可以为您制作它。|r
    .collect 220792,1 --Scroll of Spatial Mending
step
    .train 429311,1
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
    .train 429311,1
    #loop
    .goto The Barrens,60.2,36.0,40,0
    .goto The Barrens,60.8,29.0,40,0
    .goto The Barrens,59.8,27.6,40,0
    .goto The Barrens,57.6,23.6,40,0
    .goto The Barrens,42.0,14.2,40,0
    .goto The Barrens,40.0,18.4,40,0
    .goto The Barrens,44.4,50.0,40,0
    .goto The Barrens,46.4,52.6,40,0
    .goto The Barrens,47.6,49.4,40,0
    .goto The Barrens,54.4,48.6,40,0
    .goto The Barrens,58.2,49.6,40,0
    .goto The Barrens,51.8,53.4,40,0
    .goto The Barrens,48.6,83.0,40,0
    .goto The Barrens,46.2,85.6,40,0
    .goto The Barrens,43.8,83.8,40,0
    .cast 448381 >>在 |cRXP_PICK_Portal|r 上使用 |cRXP_FRIENDLY_Scroll of Spatial Mending|r 来召唤 |cRXP_ENEMY_Fel Interloper。|r
    .target Fel Silver
    .target Fel Crack
    .target Fel Tear
    .target Fel Scar
    .target Fel Rift
    .use 220792
step
    >>杀死 |cRXP_ENEMY_Fel Interloper|r。从他身上搜刮 |cRXP_LOOT_|T134939:0|tSpell Notes: Balefire Bolt。|r
    .collect 223147,1 --Spell Notes: Balefire Bolt
    .mob Fel Interloper
step
    .train 429311 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：Balefire Bolt|r |cRXP_WARN_进行训练|r |T135809:0|t[Balefire Bolt。]
    .use 223147
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup 护腕（野火之箭）
#name 野火箭 - 15（黑海岸）

<< Mage SoD

step << Alliance
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Horde
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .train 429311,1
    #label Scroll of Spatial Mending
    >>|cRXP_BUY_从拍卖行购买|r |T134945:0|t[空间修复卷轴] |cRXP_BUY_。|r |cRXP_WARN_或者附魔师可以为您制作它。|r
    .collect 220792,1 --Scroll of Spatial Mending
step
    .train 429311,1
    #completewith next
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
step
    .train 429311,1
    #loop
    .goto Darkshore,43.2,27.0,40,0
    .goto Darkshore,47.4,28.8,40,0
    .goto Darkshore,56.4,24.8,40,0
    .goto Darkshore,59.8,21.8,40,0
    .goto Darkshore,49.8,36.8,40,0
    .goto Darkshore,46.2,46.8,40,0
    .goto Darkshore,37.6,63.8,40,0
    .cast 448381 >>在 |cRXP_PICK_Portal|r 上使用 |cRXP_FRIENDLY_Scroll of Spatial Mending|r 来召唤 |cRXP_ENEMY_Fel Interloper。|r
    .target Fel Silver
    .target Fel Crack
    .target Fel Tear
    .target Fel Scar
    .target Fel Rift
    .use 220792
step
    >>杀死 |cRXP_ENEMY_Fel Interloper|r。从他身上搜刮 |cRXP_LOOT_|T134939:0|tSpell Notes: Balefire Bolt。|r
    .collect 223147,1 --Spell Notes: Balefire Bolt
    .mob Fel Interloper
step
    .train 429311 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：Balefire Bolt|r |cRXP_WARN_进行训练|r |T135809:0|t[Balefire Bolt。]
    .use 223147
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup 护腕（野火之箭）
#name 野火之箭 - 15（银松森林）

<< Mage SoD

step << Alliance
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
step << Horde
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
step
    .train 429311,1
    #label Scroll of Spatial Mending
    >>|cRXP_BUY_从拍卖行购买|r |T134945:0|t[空间修复卷轴] |cRXP_BUY_。|r |cRXP_WARN_或者附魔师可以为您制作它。|r
    .collect 220792,1 --Scroll of Spatial Mending
step
    .train 429311,1
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
    .train 429311,1
    #loop
    .goto Silverpine Forest,45.6,31.8,40,0
    .goto Silverpine Forest,44.6,25.8,40,0
    .goto Silverpine Forest,38.8,23.4,40,0
    .goto Silverpine Forest,38.8,18.4,40,0
    .goto Silverpine Forest,49.8,13.4,40,0
    .goto Silverpine Forest,55.6,24.6,40,0
    .goto Silverpine Forest,50.2,56.8,40,0
    .goto Silverpine Forest,50.2,65.2,40,0
    .cast 448381 >>在 |cRXP_PICK_Portal|r 上使用 |cRXP_FRIENDLY_Scroll of Spatial Mending|r 来召唤 |cRXP_ENEMY_Fel Interloper。|r
    .target Fel Silver
    .target Fel Crack
    .target Fel Tear
    .target Fel Scar
    .target Fel Rift
step
    >>杀死 |cRXP_ENEMY_Fel Interloper|r。从他身上搜刮 |cRXP_LOOT_|T134939:0|tSpell Notes: Balefire Bolt。|r
    .collect 223147,1 --Spell Notes: Balefire Bolt
    .mob Fel Interloper
step
    .train 429311 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：Balefire Bolt|r |cRXP_WARN_进行训练|r |T135809:0|t[Balefire Bolt。]
    .use 223147
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup 护腕（野火之箭）
#name 烈焰箭 - 35（悲伤沼泽）

<< Mage SoD

step << Alliance
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Horde
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
step
    .train 429311,1
    #label Scroll of Spatial Mending
    >>|cRXP_BUY_从拍卖行购买|r |T134945:0|t[空间修复卷轴] |cRXP_BUY_。|r |cRXP_WARN_或者附魔师可以为您制作它。|r
    .collect 220792,1 --Scroll of Spatial Mending
step
    .train 429311,1
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
step
    .train 429311,1
    #loop
    .goto Swamp of Sorrows,36.6,50.0,40,0
    .goto Swamp of Sorrows,27.0,49.8,40,0
    .goto Swamp of Sorrows,22.8,64.6,40,0
    .goto Swamp of Sorrows,16.6,63.6,40,0
    .goto Swamp of Sorrows,10.6,60.2,40,0
    .goto Swamp of Sorrows,12.6,29.6,40,0
    .goto Swamp of Sorrows,34.6,28.0,40,0
    .goto Swamp of Sorrows,49.8,38.6,40,0
    .goto Swamp of Sorrows,61.0,43.4,40,0
    .goto Swamp of Sorrows,60.8,27.4,40,0
    .goto Swamp of Sorrows,72.8,10.4,40,0
    .goto Swamp of Sorrows,87.6,26.0,40,0
    .goto Swamp of Sorrows,81.4,34.6,40,0
    .goto Swamp of Sorrows,91.6,56.4,40,0
    .goto Swamp of Sorrows,91.0,65.6,40,0
    .goto Swamp of Sorrows,83.8,66.4,40,0
    .goto Swamp of Sorrows,77.4,89.6,40,0
    .goto Swamp of Sorrows,77.6,90.0,40,0
    .goto Swamp of Sorrows,69.8,78.0,40,0
    .goto Swamp of Sorrows,56.8,65.6,40,0
    .cast 448381 >>在 |cRXP_PICK_Portal|r 上使用 |cRXP_FRIENDLY_Scroll of Spatial Mending|r 来召唤 |cRXP_ENEMY_Fel Interloper。|r
    .target Fel Silver
    .target Fel Crack
    .target Fel Tear
    .target Fel Scar
    .target Fel Rift
    .use 220792
step
    >>杀死 |cRXP_ENEMY_Fel Interloper|r。从他身上搜刮 |cRXP_LOOT_|T134939:0|tSpell Notes: Balefire Bolt。|r
    .collect 223147,1 --Spell Notes: Balefire Bolt
    .mob Fel Interloper
step
    .train 429311 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：Balefire Bolt|r |cRXP_WARN_进行训练|r |T135809:0|t[Balefire Bolt。]
    .use 223147
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup 护腕（野火之箭）
#name 野火箭 - 28（赤脊山）

<< Mage SoD

step << Alliance
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Horde
    .train 429311,1
    #completewith Scroll of Spatial Mending
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
step
    .train 429311,1
    #label Scroll of Spatial Mending
    >>|cRXP_BUY_从拍卖行购买|r |T134945:0|t[空间修复卷轴] |cRXP_BUY_。|r |cRXP_WARN_或者附魔师可以为您制作它。|r
    .collect 220792,1 --Scroll of Spatial Mending
step
    .train 429311,1
    #completewith next
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
step
    .train 429311,1
    #loop
    .goto Redridge Mountains,29.8,30.4,40,0
    .goto Redridge Mountains,79.2,33.8,40,0
    .goto Redridge Mountains,83.2,45.2,40,0
    .goto Redridge Mountains,81.8,60.8,40,0
    .goto Redridge Mountains,79.0,73.0,40,0
    .goto Redridge Mountains,71.4,83.6,40,0
    .cast 448381 >>在 |cRXP_PICK_Portal|r 上使用 |cRXP_FRIENDLY_Scroll of Spatial Mending|r 来召唤 |cRXP_ENEMY_Fel Interloper。|r
    .target Fel Silver
    .target Fel Crack
    .target Fel Tear
    .target Fel Scar
    .target Fel Rift
    .use 220792
step
    >>杀死 |cRXP_ENEMY_Fel Interloper|r。从他身上搜刮 |cRXP_LOOT_|T134939:0|tSpell Notes: Balefire Bolt。|r
    .collect 223147,1 --Spell Notes: Balefire Bolt
    .mob Fel Interloper
step
    .train 429311 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：Balefire Bolt|r |cRXP_WARN_进行训练|r |T135809:0|t[Balefire Bolt。]
    .use 223147
]])

RXPGuides.RegisterGuide([[
#classic
<< Mage SoD
#group RestedXP 符文书指南
#subgroup 披风
#name 过热 - 55（西瘟疫之地）
#title Overheat

step
    .train 401764,1
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    .train 401764,1
    #loop -- not sure which coord is tied to which itemid, update in future
    .goto Western Plaguelands,36.8,54.7,30,0
    .goto Western Plaguelands,64.2,57.7,30,0
    .goto Western Plaguelands,53.3,64.5,30,0
    .goto Western Plaguelands,45.1,51.9,30,0
    >>|cRXP_WARN_使用火焰魔法，解冻|r|cRXP_FRIENDLY_新手冰霜法师|r|cRXP_WARN_。不要杀死他们！|r
    >>|cRXP_WARN_之后对他们施放|r |T136082:0|t[移除较小诅咒] |cRXP_WARN_并与他们交谈以获得他们的|r |T134937:0|t|T134938:0|t|T134943:0|t|T134945:0|t[|cRXP_LOOT_撕裂法术说明|r]
    >>|cRXP_WARN_对西瘟疫之地的每一块田地中的每个 |cRXP_FRIENDLY_Novice Frost Mage|r 重复此操作|r
    .collect 225938,1 --Felstone Field
    .collect 225939,1
    .collect 225940,1
    .collect 225941,1
    .target Novice Frost Mage
    .skipgossip
step
    .train 401764,1
    .use 225938 >>|cRXP_WARN_使用任意的|r |T134937:0|t|T134938:0|t|T134943:0|t|T134945:0|t[|cRXP_LOOT_Torn Spell Notes|r] |cRXP_WARN_将它们合并为|r |T134939:0|t[|cRXP_LOOT_Spell Notes: Overheat|r]
    .use 225939
    .use 225940
    .use 225941
    .collect 225691,1
step
    .train 401764 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_LOOT_法术说明：过热|r] |cRXP_WARN_进行训练|r |T135813:0|t[过热]
    .use 225691
]])

RXPGuides.RegisterGuide([[
#classic
<< Mage SoD
#group RestedXP 符文书指南
#subgroup 披风
#name 冰冻宝珠 - 55 （费伍德森林/冬泉谷）
#title Frozen Orb

step
    #completewith next
    .train 440858,1
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
step
    .train 440858,1
    .goto Felwood,63.0,9.0
    >>杀死 |cRXP_ENEMY_Deadwood Avengers|r 和 |cRXP_ENEMY_Deadwood Shamans|r。掠夺他们以获得 |T237446:0|t[|cRXP_LOOT_Mysterious Darnassian Scroll|r]
    .collect 227796,1 -- Mysterious Darnassian Scroll 1/1
    .mob Deadwood Shaman
    .mob Deadwood Avenger
step
    .train 440858,1
    >>|cRXP_WARN_使用|r |T135933:0|t[|cRXP_LOOT_理解咒|r] |cRXP_WARN_在|r |T237446:0|t[|cRXP_LOOT_神秘的达纳苏斯卷轴|r] |cRXP_WARN_将其解密为|r |T134937:0|t[|cRXP_LOOT_解密的达纳苏斯卷轴|r]
    .collect 227797,1 -- Deciphered Darnassian Scroll 1/1
    .use 211779
    .use 227796
step
    .train 440858,1
    .goto Felwood,61.0,12.0
    .use 227797 >>|cRXP_WARN_使用|r |T134937:0|t[|cRXP_LOOT_解密的达纳苏斯卷轴|r] |cRXP_WARN_on |cRXP_FRIENDLY_Calyx Greenglow|r并接受他的任务|r
    >>|cRXP_FRIENDLY_Calyx Greenglow|r |cRXP_WARN_patrols 稍微四处走动|r
    .accept 84369 >>接受治疗者治疗
    .unitscan Calyx Greenglow
step
    .train 440858,1
    .goto Winterspring,55.0,22.0
    >>杀死 |cRXP_ENEMY_Irontree Stompers|r。掠夺它们以获得 |cRXP_LOOT_Unusual Flask|r
    .collect 227924,1,84369,1 -- Unusual Flask 1/1
    .mob Irontree Stomper
step
    .train 440858,1
    #completewith next
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
step
    .train 440858,1
    .goto Winterspring,29.0,35.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calyx Greenglow|r
    >>|cRXP_WARN_你需要在完成此任务后杀死|cRXP_ENEMY_Calyx Greenglow|r|r
    .turnin 84369 >>交任务“治愈治疗师”
    .unitscan Calyx Greenglow
step
    .train 440858,1
    >>杀死 |cRXP_ENEMY_Enraged Shade|r。拾取它以获得 |T134939:0|t[|cRXP_LOOT_Spell Notes: Frozen Orb|r]
    .collect 225690,1 -- Spell Notes: Frozen Orb 1/1
    .mob Enraged Shade
step
    .train 440858 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_LOOT_法术说明：冰冻宝珠|r] |cRXP_WARN_训练|r |T135851:0|t[冰冻宝珠]
    .use 225690
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup 披风
#name 奥术弹幕 - 60（艾泽拉斯）
#title Arcane Barrage

<< Mage SoD

step
    .train 401722,1
    #completewith Necromancy101
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    .train 401722,1
    .goto Western Plaguelands,38.3,54.6
    >>在费尔斯通田野农舍楼上拾取 |cRXP_LOOT_Undead Potatoes|r 书
    .collect 228132,1
    .isQuestAvailable 84395
step
    .train 401722,1
    #label Necromancy101
    .goto Western Plaguelands,69.41,72.84
    >>在通灵学院城堡中拾取 |cRXP_LOOT_Necromancy 101|r
    .collect 228141,1
    .isQuestAvailable 84402
step
    .train 401722,1
    #completewith UndeadMenace
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    .train 401722,1
    .goto Eastern Plaguelands,81.7,57.8
    >>战利品 |cRXP_LOOT_A Study of the Light|r 书
    .collect 228135,1
    .isQuestAvailable 84398
step
    .train 401722,1
    .goto Eastern Plaguelands,54.5,50.8
    >>战利品 |cRXP_LOOT_骑士与淑女|r 书
    .collect 228138,1
    .isQuestAvailable 84400
step
    .train 401722,1
    #label UndeadMenace
    .goto Eastern Plaguelands,31.250,21.000
    >>抢劫 |cRXP_LOOT_Scourge：亡灵威胁还是误解？|r 书
    .collect 228140,1
    .isQuestAvailable 84401
step
    .train 401722,1
    #completewith next
    .subzone 1445 >>前往: |cRXP_PICK_灼热峡谷|r or Burning Steppes and head into Blackrock Mountain
step
    .train 401722,1
    .goto 1415,48.388,63.626
    >>|cRXP_WARN_放下锁链，前往黑石深渊入口|r
    >>抢劫地面上的 |cRXP_LOOT_Magma 或 Lava?|r 书籍
    .collect 228133,1
    .isQuestAvailable 84396
step
    .train 401722,1
    #completewith next
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
step
    .train 401722,1
    .goto Winterspring,60.7,37.7
    >>抢夺书架上的 |cRXP_LOOT_Ka-Boom!|r 书
    .collect 228136,1
    .isQuestAvailable 84399
step
    .train 401722,1
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
    .subzoneskip 1216
step
    .train 401722,1
    .goto Felwood,65.214,3.248
    >>|cRXP_WARN_前往木喉要塞隧道。注意，如果你与木喉要塞的友好程度不低于敌对，熊怪就会攻击你|r
    >>拾取地面上的 |cRXP_LOOT_Northern Kalimdor - A Comprehensive Guide|r 书籍
    .collect 228134,1
    .isQuestAvailable 84397
step
    .train 401722,1
    .goto Stormwind City,38.6,79.6 << Alliance
    .goto 1458,73.6,32.6 << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_詹妮亚·坎农|r << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥兰·斯内克威瑟|r  << Horde
    .accept 84395 >>交出亡灵土豆
    .accept 84402 >>交出亡灵法术 101
    .accept 84398 >>提交光的研究
    .accept 84400 >>交出骑士与贵妇
    .accept 84401 >>交出天灾：亡灵威胁还是误解？
    .accept 84396 >>交出岩浆还是熔岩？
    .accept 84399 >>交出 Ka-Boom！
    .accept 84397 >>北卡利姆多地区 - 综合指南
    .target Jennea Cannon << Alliance
    .target Oran Snakewrithe << Horde
step
    .train 401722,1
    .goto Stormwind City,38.6,79.6 << Alliance
    .goto 1458,73.6,32.6 << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_詹妮亚·坎农|r << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥兰·斯内克威瑟|r << Horde
    >>|cRXP_WARN_如果你不能接受这个任务，请确保你已经获得了冰冷血脉的符文/法术强度/深度冻结，因为这是这些符文的延续，并且是必需的|r
    .accept 84394 >>接受图书馆之友
    .turnin 84394 >>交出“图书馆之友”
    .target Jennea Cannon << Alliance
    .target Oran Snakewrithe << Horde
]])