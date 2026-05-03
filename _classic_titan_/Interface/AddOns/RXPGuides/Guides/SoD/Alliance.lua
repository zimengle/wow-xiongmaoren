RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD/Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 割裂 - 12（黑海岸） << Druid
#name 野兽控制 - 12（黑海岸） << Hunter
#title Lacerate << Druid
#title Beast Mastery << Hunter

step << Druid/Hunter
    .goto Darkshore,39.84,53.82,50,0
    .goto Darkshore,40.03,56.24,50,0
    .goto Darkshore,39.34,56.58,50,0
    .goto Darkshore,39.84,53.82
    >>杀死 |cRXP_ENEMY_黑木探路者s|r 和 |cRXP_ENEMY_黑木风语者s|r。掠夺他们的 |T237270:0|t[|cRXP_LOOT_Crab Treats|r]
    .collect 209027,1 -- Crab Treats (1)
    .mob 黑木探路者
    .mob 黑木风语者
    .train 416049,1 << Druid
    .train 410110,1 << Hunter
step << Druid/Hunter
    .goto Darkshore,35.8,55.6
    .use 209027 >>|cRXP_WARN_对 |cRXP_ENEMY_Young Reef Crawler|r 使用|r |T237270:0|t[|cRXP_LOOT_Crab Treats|r] |cRXP_WARN_来获得|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Lacerate|r] << Druid
    .use 209027 >>|cRXP_WARN_对 |cRXP_ENEMY_幼年礁石爬行者|r 使用|r |T237270:0|t[|cRXP_LOOT_蟹肉零食|r] |cRXP_WARN_以获得|r |T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r] << Hunter
    .collect 208687,1 << Druid -- Rune of Lacerate (1)
    .collect 208701,1 << Hunter -- Beast Mastery (1)
    .target Young Reef Crawler
    .train 416049,1 << Druid
    .train 410110,1 << Hunter
step << Druid/Hunter
    .train 416049 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r] |cRXP_WARN_训练|r |T132131:0|t[撕裂] << Druid
    .use 208687 << Druid
    .itemcount 208687,1 << Druid
    .train 410110 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_兽王符文|r] |cRXP_WARN_进行训练|r |T132270:0|t[兽王] << Hunter
    .use 208701 << Hunter
    .itemcount 208701,1 << Hunter
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Druid SoD/Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 裂伤-8（泰达希尔） << Druid
#name 爆炸射击 - 8（泰达希尔） << Hunter
#title Mangle << Druid
#title Explosive Shot << Hunter

step
    +|cRXP_WARN_你必须至少达到 8 级才能单独获得|r |T133816:0|t[雕刻手套 - 裂伤] |cRXP_WARN_in 泰达希尔|r << Druid
    +|cRXP_WARN_你必须至少达到 8 级才能单独获得|r |T133816:0|t[雕刻手套 - 爆炸射击] |cRXP_WARN_in 泰达希尔|r << Hunter
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
    .xp >8,1
step
    #completewith Rune
    #label Teld1
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
    .subzoneskip 262
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
step
    #optional
    #requires Teld1
    #label ShadowCave1
    #completewith Rune
    .goto 1438,44.197,58.040
    .subzone 262 >>进入班奈希尔古墓
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
step
    #optional
    #requires ShadowCave1
    #completewith Rune
    .goto 1438,44.064,58.196,15,0
    .goto 1438,43.975,58.537,15,0
    .goto 1438,44.196,58.597,15,0
    .goto 1438,44.167,58.204,15,0
    .goto 1438,43.073,59.123,15,0
    .goto 1438,43.399,59.885,15,0
    .goto 1438,43.602,59.799,15,0
    .goto 1438,44.254,59.083,15,0
    .goto 1438,44.292,58.555,15,0
    .goto 1438,43.944,57.918,15,0
    .goto 1438,43.947,57.297,15,0
    .goto 1438,44.731,57.355,15,0
    .goto 1438,45.118,57.701,20 >>前往 |cRXP_ENEMY_Rageclaw|r 内部
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
step
    #loop
    #label Rune
    .line 1438,45.055,57.739,45.008,58.055,45.091,58.386,45.256,58.538,45.492,58.609,45.668,58.356,45.702,57.980,45.604,57.699,45.370,57.566,45.161,57.638,45.118,57.701
    .goto 1438,45.055,57.739,12,0
    .goto 1438,45.008,58.055,12,0
    .goto 1438,45.091,58.386,12,0
    .goto 1438,45.256,58.538,12,0
    .goto 1438,45.492,58.609,12,0
    .goto 1438,45.668,58.356,12,0
    .goto 1438,45.702,57.980,12,0
    .goto 1438,45.604,57.699,12,0
    .goto 1438,45.370,57.566,12,0
    .goto 1438,45.161,57.638,12,0
    .goto 1438,45.118,57.701,12,0
    >>在最底层杀死 |cRXP_ENEMY_Rageclaw|r。从他身上搜刮 |T136061:0|t|cRXP_LOOT_[熊之怒偶像]|r << Druid
    >>在最底层杀死 |cRXP_ENEMY_Rageclaw|r。从他身上搜刮 |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r << Hunter
    .collect 206954,1 << Druid -- Idol of Ursine Rage (1)
    .collect 206169,1 << Hunter -- Rune of Explosive Shot (1)
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
    .unitscan Rageclaw
step << Hunter
    .train 410123 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 爆炸射击]
    .use 206169
    .itemcount 206169,1
step << Druid
    .equip 18,206954 >>|cRXP_WARN_装备|r |T136061:0|t|cRXP_LOOT_[熊之怒雕像]|r
    .use 206954
    .itemcount 206954,1
    .train 410025,1
step << Druid
    #loop
    .goto 1438,44.731,57.355,0
    .goto 1438,44.254,59.083,0
    .goto 1438,44.064,58.196,0
    .goto 1438,44.731,57.355,15,0
    .goto 1438,43.947,57.297,15,0
    .goto 1438,43.944,57.918,15,0
    .goto 1438,44.292,58.555,15,0
    .goto 1438,44.254,59.083,15,0
    .goto 1438,43.602,59.799,15,0
    .goto 1438,43.399,59.885,15,0
    .goto 1438,43.073,59.123,15,0
    .goto 1438,44.167,58.204,15,0
    .goto 1438,44.196,58.597,15,0
    .goto 1438,43.975,58.537,15,0
    .goto 1438,44.064,58.196,15,0
    .aura 414824 >>|cRXP_WARN_处于|r |T132276:0|t[熊形态]|cRXP_WARN_时，保持 50 点或更多怒气，持续 60 秒|r
    .itemStat 18,QUALITY,2
    .train 410025,1
step << Druid
    .train 410025 >>|cRXP_WARN_使用|r |T136061:0|t|cRXP_LOOT_[熊之怒雕像]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 裂伤]
    .use 206954
    .aura -414824
    .train 410025,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD/Alliance Warrior SoD/Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Chest << Rogue/Priest
#subgroup Legs << Warrior
#name 暗影屠戮-8（泰达希尔） << Rogue
#name 狂怒雷霆-8（泰达希尔） << Warrior
#name 虚空瘟疫-8（泰达希尔） << Priest
#title Slaughter from the Shadows << Rogue
#title Furious Thunder << Warrior
#title Void Plague << Priest

step
    #completewith next
    .goto Teldrassil,44.18,58.19
    .subzone 262 >>进入班奈希尔古墓
    .train 424992,1 << Rogue
    .train 403476,1 << Warrior
    .train 425216,1 << Priest
step << Rogue
    .goto Teldrassil,44.155,61.182
    >>打开 |cRXP_PICK_Gnarlpine Stash|r。拾取其中的 |T134419:0|t[|cRXP_FRIENDLY_Rune of Slaughter|r]
    >>|cRXP_WARN_注意：|cRXP_PICK_Gnarlpine Stash|r 会在 Ban'ethil Barrows 内随机生成|r
    .collect 203993 -- Rune of Slaughter (1)
    .train 424992 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r] |cRXP_WARN_训练|r |T236280:0|t[暗影屠杀]
    .use 203993
step << Warrior
    .goto Teldrassil,44.401,60.655
    >>打开 |cRXP_PICK_Gnarlpine Cache|r。从中获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Furious Thunder|r]
    >>|cRXP_WARN_注意：|cRXP_PICK_Gnarlpine Cache|r 可以在 Ban'ethil Barrows 内有多个生成位置|r
    .collect 204809,1 -- Rune of Furious Thunder (1)
    .train 403476 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狂暴雷霆符文|r] |cRXP_WARN_进行训练|r |T136048:0|t[狂暴雷霆]
    .use 204809
step << Priest
    .goto Teldrassil,44.401,60.655
    >>打开 |cRXP_PICK_Gnarlpine Cache|r。从中获取 |T136222:0|t[|cRXP_FRIENDLY_Memory of a Dark Purpose|r]
    >>|cRXP_WARN_注意：|cRXP_PICK_Gnarlpine Cache|r 可以在 Ban'ethil Barrows 内有多个生成位置|r
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗目的的记忆|r] |cRXP_WARN_训练|r |T237514:0|t[虚空瘟疫]
    .use 205940
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Rogue SoD/Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Gloves << Rogue
#subgroup Legs << Priest
#name 毁伤 — 8（泰达希尔） << Rogue
#name 分享痛苦-8（泰达希尔） << Priest
#title Mutilate << Rogue
#title Shared Pain << Priest

step << Rogue/Priest
    #completewith next
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >>前往魔岩
    .train 400094,1 << Rogue
    .train 402854,1 << Priest
step << Rogue/Priest
    .goto Teldrassil,51.2,50.6
    >>杀死 |cRXP_ENEMY_Lord Melenas|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_Rune of Mutilation|r] << Rogue
    >>杀死 |cRXP_ENEMY_Lord Melenas|r。从他身上搜刮物品，获得 |T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的回忆|r] << Priest
    >>|cRXP_ENEMY_梅勒那斯领主|r |cRXP_WARN_可能位于魔岩各地的不同刷新位置|r
    .collect 203990,1 << Rogue
    .collect 205945,1 << Priest
    .unitscan Lord Melenas
    .train 400094,1 << Rogue
    .train 402854,1 << Priest
step << Rogue
    .train 400094 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r] |cRXP_WARN_进行训练|r |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1
step << Priest
    .train 402854 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的记忆|r] |cRXP_WARN_进行训练|r |T136160:0|t[共享痛苦]
    >>|cRXP_WARN_你必须通过输入 /kneel 在圣地获得|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buff，例如，月亮井、北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘守卫|r
    .use 205945
    .itemcount 205945,1
]])
