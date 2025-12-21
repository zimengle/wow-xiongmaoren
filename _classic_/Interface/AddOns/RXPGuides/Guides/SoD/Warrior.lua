RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 胜利冲刺 - 1(艾尔文森林)
#displayname Victory Rush

step << Warrior
    #season 2
    #optional
    #completewith next
    .goto 1429,48.086,30.502,20,0
    .goto 1429,48.379,29.579,20,0
    .goto 1429,48.336,28.597,20,0
    .goto 1429,48.679,26.618,20,0
    .goto 1429,49.919,25.792,20,0
    .goto 1429,50.639,27.274,15 >>前往回声岭矿洞内的|cRXP_PICK_Kobold Stashbox|r
    .train 403470,1
step << Warrior
    #season 2
    .goto Elwynn Forest,50.640,27.276
    >>打开地面上的|cRXP_PICK_Kobold Stashbox|r, 从中获取 |T134419:0|t|cRXP_LOOT_[胜利冲刺符文]|r
    .collect 204806,1 -- Rune of Victory Rush (1)
    .train 403470,1
step << Warrior
    #season 2
    .train 403470 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[胜利冲刺符文]|r|cRXP_WARN_来学习|r|T132342:0|t[胜利冲刺]
    .use 204806
    .itemcount 204806,1 -- Rune of Victory Rush (1)
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 胜利冲刺 - 3(杜隆塔尔)
#displayname Victory Rush

step << Warrior
    #season 2
    .goto Dun Morogh,26.3,79.2,40,0
    .goto Dun Morogh,22.7,79.3,40,0
    .goto Dun Morogh,20.9,75.7,40,0
    .goto Dun Morogh,22.7,79.3,40,0
    .goto Dun Morogh,20.9,75.7
    >>击杀|r|cRXP_ENEMY_霜鬃巨魔幼崽|r. 击败它们可获得|r|T134419:0|t[|cRXP_FRIENDLY_胜利符文|r]
    .collect 204806,1
    .mob Frostmane Troll Whelp
    .train 403470,1
step << Warrior
    #season 2
    #label WarriorVR
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_胜利冲刺符文|r]
    .use 204806
    .itemcount 204806,1
    .train 403470,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 胜利冲刺 - 3(影谷)
#displayname Victory Rush

step << Warrior
    #season 2
    .goto Teldrassil,56.8,31.7
    >>击杀|cRXP_ENEMY_树林蜘蛛|r. 击败它们以获取 |T134419:0|t[|cRXP_FRIENDLY_胜利冲刺符文|r]
    .collect 204806,1 -- Rune of Victory Rush (1)
    .mob Webwood Spider
    .train 403470,1
step << Warrior
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_胜利冲刺符文|r]
    .use 204806
    .itemcount 204806,1
    .train 403470,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 血狂怒 - 10(艾尔文森林)
#displayname Blood Frenzy

step << Warrior
    #season 2
    .goto Elwynn Forest,25.5,70.1,0
    .goto Elwynn Forest,22.1,73.8,0
    .goto Elwynn Forest,29.9,73.3,0
    .goto Elwynn Forest,36.1,80.4,0
    .goto Elwynn Forest,38.0,75.4,0
    .goto Elwynn Forest,25.5,70.1,70,0
    .goto Elwynn Forest,22.1,73.8,70,0
    .goto Elwynn Forest,29.9,73.3,70,0
    .goto Elwynn Forest,36.1,80.4,70,0
    .goto Elwynn Forest,38.0,75.4,70,0
    .goto Elwynn Forest,40.6,74.7
    >>与艾尔文森林中的|cRXP_FRIENDLY_游侠剑士|r交谈
    >>在决斗中击败流浪剑士|r
    >>打开地上掉落的|cRXP_PICK_剑士的奖励|r, 拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_血之狂暴符文|r]
    >>|cRXP_WARN_注意:|cRXP_FRIENDLY_Wandering Swordsman|r可能在艾尔文森林的任意位置出现|r
    .collect 204441,1 -- Rune of Blood Frenzy (1)
    .train 403474,1
    .skipgossip
    .unitscan Wandering Swordsman
step << Warrior
    #season 2
    .train 403474 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_血狂符文|r]|cRXP_WARN_进行训练|r|T136012:0|t[血狂]
    .use 204441
    .itemcount 204441,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 血狂怒 - 10 (丹莫洛)
#displayname Blood Frenzy

step << Warrior
    #season 2
    .goto Dun Morogh,53.47,47.60
    >>与丹莫罗的|cRXP_FRIENDLY_游侠剑士|r交谈
    >>在决斗中击败流浪剑士|r
    >>打开地上掉落的|cRXP_PICK_剑士的奖励|r, 拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_血之狂暴符文|r]
    .collect 204441,1 -- Rune of Blood Frenzy (1)
    .train 403474,1
    .skipgossip
    .unitscan Wandering Swordsman
step << Warrior
    #season 2
    .train 403474 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_血狂符文|r]|cRXP_WARN_进行训练|r|T136012:0|t[血狂]
    .use 204441
    .itemcount 204441,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 血狂怒 - 10(泰达希尔)
#displayname Blood Frenzy

step << Warrior
    #season 2
    .goto Teldrassil,39.8,69.6,60,0
    .goto Teldrassil,43.8,76.8,60,0
    .goto Teldrassil,54.6,66.0,60,0
    .goto Teldrassil,62.6,71.8,60,0
    .goto Teldrassil,39.6,37.6
    >>与泰达希尔的|cRXP_FRIENDLY_游侠剑士|r交谈
    >>在决斗中击败流浪剑士|r
    >>打开地上掉落的|cRXP_PICK_剑士的奖励|r, 拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_血之狂暴符文|r]
    >>|cRXP_WARN_注意:|cRXP_FRIENDLY_Wandering Swordsman|r可能在泰达希尔的任意位置出现|r
    .collect 204441,1 -- Rune of Blood Frenzy (1)
    .train 403474,1
    .skipgossip
    .unitscan Wandering Swordsman
step << Warrior
    #season 2
    .train 403474 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_血狂符文|r]|cRXP_WARN_进行训练|r|T136012:0|t[血狂]
    .use 204441
    .itemcount 204441,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狂怒雷霆 - 6(艾尔文森林)
#displayname Furious Thunder

step << Warrior
    #season 2
    #completewith next
    .goto Elwynn Forest,38.34,81.54,20 >>进入法戈迪普矿坑
    .train 403476,1
step << Warrior
    #season 2
    .goto Elwynn Forest,41.7,78.1
    >>击杀|cRXP_ENEMY_金牙|r, 击败后可获得 |T134419:0|t[|cRXP_FRIENDLY_雷霆符文|r]
    .collect 204809,1 -- Rune of Furious Thunder (1)
    .mob Goldtooth
    .train 403476,1
step << Warrior
    #season 2
    .train 403476 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狂暴雷霆符文|r] |cRXP_WARN_来训练|r |T136048:0|t[狂暴雷霆]
    .use 204809
    .itemcount 204809,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狂怒雷霆 - 9 (丹莫洛)
#displayname Furious Thunder

step << Warrior
    #season 2
    .goto 1426,31.87,38.45,0
    .goto 1426,30.42,39.84,0
    .goto 1426,30.02,39.08,0
    .goto 1426,33.82,37.26,0
    .goto 1426,31.87,38.45,50,0
    .goto 1426,30.42,39.84,50,0
    .goto 1426,30.02,39.08,50,0
    .goto 1426,33.82,37.26,50,0
    >>击杀|cRXP_ENEMY_Fyodi|r. 击败他后搜刮出 |T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r
    >>|cRXP_WARN_尽管|cRXP_ENEMY_Fyodi|r显示为精英怪, 但其生命值和伤害和护甲数值仍与普通怪物一致|r
    >>|cRXP_WARN_注意, 当他施放时|r|T132337:0|t[冲锋]|cRXP_WARN_(自身瞬发:提升移动速度3秒, 命中时造成35-80点近战伤害. 仅可在远程状态下施放)|r
    >>|cRXP_WARN_注意:|r|T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r|cRXP_WARN_也可能从丹莫罗的每个稀有怪物身上掉落, 以及|r|cRXP_ENEMY_瓦加什|r和|cRXP_ENEMY_癞爪|r和|r|cRXP_ENEMY_冰须 |r
    .collect 204809,1 -- Rune of Furious Thunder (1)
    .mob Fyodi
    .train 403476,1
    .xp >10,1
step << Warrior
    #season 2
    .goto 1426,62.094,47.154,40,0
    .goto 1426,62.434,48.989,40,0
    .goto 1426,62.538,46.195
    >>击杀 |cRXP_ENEMY_瓦加什|r. 击败他后搜刮 |T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r
    >>|cRXP_WARN_注意:|r|T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r|cRXP_WARN_也可能从丹莫罗的所有稀有怪物身上掉落, 包括|cRXP_ENEMY_菲奥迪|r和|cRXP_ENEMY_癞爪|r和|cRXP_ENEMY_冰须|r|r
    .collect 204809,1 -- Rune of Furious Thunder (1)
    .mob Vagash
    .train 403476,1
    .xp <10,1
step << Warrior
    #label FuriousThunder
    #season 2
    .train 403476 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r|cRXP_WARN_来训练|r|T136048:0|t[狂暴雷霆]
    .use 204809
    .itemcount 204809,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狂暴突袭 - 10(暴风城)
#displayname Frenzied Assault

step << Warrior
    #season 2
    .gossipoption 109045 >>与旅店内的|cRXP_FRIENDLY_Liv Bradford|r交谈
    .gossipoption 109047
    .goto Stormwind City,22.608,64.621
    .gossipoption 109084 >>与|cRXP_ENEMY_Stuart|r交谈, 然后击败他. 当他血量降至 0% 时会晕倒
    .goto Stormwind City,21.213,62.781
    >>如果|cRXP_ENEMY_Stuart|r不在, 就等待他刷新
    .gossipoption 109044 >>击败|cRXP_ENEMY_斯图尔特|r后, 再次与|cRXP_FRIENDLY_丽芙·布拉德福德|r交谈, 以获得|T134419:0|t[|cRXP_FRIENDLY_狂暴冲锋符文|r]
    .goto Stormwind City,22.608,64.621
    .train 425447,1 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狂怒冲击符文|r]|cRXP_WARN_来训练|r|T236317:0|t[狂怒冲击]
    >>|cRXP_WARN_注意:根据你的等级, 单人完成可能相当困难. 如有需要, 请寻求帮助|r
    .use 204716
    .target Liv Bradford
    .mob Stuart
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狂暴突袭 - 10 (铁炉堡)
#displayname Frenzied Assault

step << Warrior
    #season 2
    .goto Ironforge,72.512,76.942
    >>与军事区的|cRXP_FRIENDLY_布鲁克·麦须|r交谈
    >>与|cRXP_FRIENDLY_Bruart|r(在门口), 然后揍他一顿. 当他生命值降至0%时, 他会晕倒
    >>如果|cRXP_ENEMY_Bruart|r不在, 等待他刷新
    >>击败|cRXP_ENEMY_Bruart|r后, 再次与|cRXP_FRIENDLY_布鲁克·麦须|r交谈, 以获得|T134419:0|t[|cRXP_FRIENDLY_狂怒冲锋符文|r]
    .train 425447,1 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狂怒冲击符文|r]|cRXP_WARN_来训练|r|T236317:0|t[狂怒冲击]
    >>|cRXP_WARN_注意:根据你的等级, 单人完成可能相当困难. 如有需要, 请寻求帮助|r
    .use 204716
    .target Bruuk Barleybeard
    .mob Bruart
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狂暴突袭 - 10(泰达希尔)
#displayname Frenzied Assault

step << Warrior
    #season 2
    .goto Teldrassil,55.619,59.787
    >>与多兰纳尔的|cRXP_FRIENDLY_旅店老板凯达米尔|r交谈
    >>与楼上的|cRXP_ENEMY_Syllart|r交谈, 然后击败他. 当他血量降至0%时会倒地昏迷
    >>如果|cRXP_ENEMY_Syllart|r不在, 请等待他刷新
    >>击败|cRXP_ENEMY_Syllart|r后, 再次与|cRXP_FRIENDLY_旅店老板凯达米尔|r交谈, 以获得|T134419:0|t[|cRXP_FRIENDLY_狂怒冲锋符文|r]
    .train 425447,1 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狂怒冲击符文|r]|cRXP_WARN_来训练|r|T236317:0|t[狂怒冲击]
    >>|cRXP_WARN_注意:根据你的等级, 单人完成可能相当困难. 如有需要, 请寻求帮助|r
    .use 204716
    .target Innkeeper Keldamyr
    .mob Syllart
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup 头盔
#name 无尽怒火 - 20(西部荒野)
#displayname Endless Rage

step << Warrior
    #season 2
    .goto Westfall,34.43,83.93,55,0
    .goto Westfall,29.55,79.90,60,0
    .goto Westfall,28.29,71.07,60,0
    .goto Westfall,26.42,65.88,60,0
    .goto Westfall,34.43,83.93
    .line Westfall,34.43,83.93,33.88,83.32,33.08,82.86,32.56,82.71,32.08,82.49,31.91,82.36,31.55,81.88,30.86,81.42,30.63,81.16,30.33,80.81,30.02,80.11,29.68,79.22,29.32,78.19,29.29,77.60,29.27,77.31,29.18,76.26,29.07,75.29,28.95,74.14,28.85,73.29,28.79,72.48,28.37,71.94,27.84,71.29,27.44,70.25,27.29,69.47,27.13,68.65,27.09,67.57,27.07,67.01,26.74,66.09,27.07,67.01,27.09,67.57,27.13,68.65,27.29,69.47,27.44,70.25,27.84,71.29,28.37,71.94,28.79,72.48,28.85,73.29,28.95,74.14,29.07,75.29,29.18,76.26,29.27,77.31,29.29,77.60,29.32,78.19,29.68,79.22,30.02,80.11,30.33,80.81,30.63,81.16,30.86,81.42,31.55,81.88,31.91,82.36,32.08,82.49,32.56,82.71,33.08,82.86,33.88,83.32,34.43,83.93
    >>击杀|cRXP_ENEMY_老瞎眼|r. 击败他后搜刮出 |T132347:0|t[|cRXP_FRIENDLY_无尽狂暴符文|r]
    >>|cRXP_ENEMY_老瞎眼|r|cRXP_WARN_在长岸一带巡逻. 如果你在长岸没看到他, 就等他刷新到最南边的|cRXP_ENEMY_鱼人|r营地|r
    .collect 208741,1 -- Rune of Endless Rage (1)
    .unitscan Old Murk-Eye
    .train 403489,1
step << Warrior
    #season 2
    .train 403489 >>|cRXP_WARN_使用|r|T132347:0|t[|cRXP_FRIENDLY_无尽怒火符文|r]|cRXP_WARN_来训练|r|T132347:0|t[无尽怒火]
    .use 208741
    .itemcount 208741,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 无尽怒火 - 16 (黑海岸)
#displayname Endless Rage

step << Warrior
    #season 2
    #completewith next
    .goto Darkshore,55.106,33.621,30 >>进入悬崖之春纳迦洞穴
    .train 403489,1
step << Warrior
    #season 2
    .goto Darkshore,55.40,36.05
    >>击杀|cRXP_ENEMY_Lady Sedorax|r. 击败她后可获得 |T132347:0|t[|cRXP_FRIENDLY_无尽愤怒符文|r]
    >>|cRXP_ENEMY_Lady Sedorax|r|cRXP_WARN_是一个18级精英怪, 周围还有其他小怪. 你可以选择去西部荒野击杀她, 这样会容易得多|r
    .collect 208741,1 -- Rune of Endless Rage (1)
    .unitscan Lady Sedorax
    .train 403489,1
step << Warrior
    #season 2
    .train 403489 >>|cRXP_WARN_使用|r|T132347:0|t[|cRXP_FRIENDLY_无尽怒火符文|r]|cRXP_WARN_来训练|r|T132347:0|t[无尽怒火]
    .use 208741
    .itemcount 208741,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 毁灭打击 - 8 (艾尔文森林)
#displayname Devastate

step << Warrior
    #season 2
    >>击杀|cRXP_ENEMY_狗头人矿工|r和|cRXP_ENEMY_狗头人隧道工|r. 击败他们后搜刮出 |T134168:0|t[|cRXP_LOOT_被砍下的狗头人头颅|r]
    >>击杀|cRXP_ENEMY_鱼人|r和|cRXP_ENEMY_鱼人士兵|r. 击败它们后拾取其 |T134169:0|t[|cRXP_LOOT_鱼人的头颅|r]
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r 和|cRXP_ENEMY_河爪豺狼人前锋|r. 搜刮他们的 |T134163:0|t[|cRXP_LOOT_severed gnoll head|r ]
    .collect 204476,1 -- Severed Kobold Head (1)
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76,25,0
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76,25,0
    .goto Elwynn Forest,40.5,82.3
    .collect 204477,1 -- Severed Murloc Head (1)
    .goto Elwynn Forest,47.6,63.3,60,0
    .goto Elwynn Forest,51.4,64.6,60,0
    .goto Elwynn Forest,57.6,62.8,60,0
    .goto Elwynn Forest,57.6,62.8
    .collect 204478,1 -- Severed Gnoll Head (1)
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,25.9,93.9
    .mob Kobold Tunneler
    .mob Kobold Miner
    .mob Goldtooth
    .mob Murloc
	.mob Murloc Streamrunner
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
    .train 403475,1
step << Warrior
    #completewith RoDSW
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Warrior
    #season 2
    #completewith RoDSW
    .goto Stormwind City,69.690,51.023
    .gossipoption 109028 >>与|cRXP_FRIENDLY_|Viktoria Woods|r交谈, 提交你的|T134168:0|t[|cRXP_LOOT_|被斩断的地精头颅|r], 以获得|T134455:0|t[猎魔者初阶符文碎片]
    .collect 204688,1 -- Monster Hunter's First Rune Fragment (1)
    .itemcount 204476,1 -- Severed Kobold Head (1)
    .target Viktoria Woods
    .train 403475,1
step << Warrior
    #season 2
    #completewith RoDSW
    .goto Stormwind City,69.690,51.023
    .gossipoption 109027 >>与|cRXP_FRIENDLY_维克托莉亚·伍兹|r交谈, 提交你的|T134169:0|t[|cRXP_LOOT_鱼人的头颅|r], 以获得|T134455:0|t[猎魔者第二符文碎片]
    .collect 204689,1 -- Monster Hunter's Second Rune Fragment (1)
    .itemcount 204477,1 -- Severed Murloc Head (1)
    .target Viktoria Woods
    .train 403475,1
step << Warrior
    #season 2
    #label GnollHead
    #completewith RoDSW
    .goto Stormwind City,69.690,51.023
    .gossipoption 109026 >>与|cRXP_FRIENDLY_维多利亚·伍兹|r交谈, 提交你的|T134163:0|t[断头豺狼头|r], 以获得|T134455:0|t[猎魔者第三符文碎片]
    .collect 204690,1 -- Monster Hunter's Third Rune Fragment (1)
    .itemcount 204478,1 -- Severed Gnoll Head (1)
    .target Viktoria Woods
    .train 403475,1
step << Warrior
    #season 2
    #label RoDSW
    #requires GnollHead
    .cast 406651 >>|cRXP_WARN_使用任意|r|T134455:0|t[猎魔人符文碎片]|cRXP_WARN_来制作|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .collect 204703,1 -- Rune of Devastate (1)
    .use 204690
    .use 204689
    .use 204688
    .itemcount 204688,1
    .itemcount 204689,1
    .itemcount 204690,1
    .train 403475,1
step << Warrior
    #season 2
    .train 403475 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]|cRXP_WARN_来训练|r|T135291:0|t[毁灭]
    .use 204703
    .itemcount 204703,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 毁灭打击 - 6 (泰达希尔)
#displayname Devastate

step << Warrior
    #season 2
    >>击杀|cRXP_ENEMY_夜刃豹|r或|cRXP_ENEMY_夜刃捕食者|r. 击败它们后可获得|cRXP_LOOT_被斩下的虎头|r
    >>击杀|cRXP_ENEMY_巨翼枭|r 或|cRXP_ENEMY_巨翼恶枭|r, 掠夺其掉落的|cRXP_LOOT_severed owl head|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r 或|cRXP_ENEMY_树林毒蜘蛛|r. 击败它们后可获得|cRXP_LOOT_severed spider head|r
    .collect 208611,1 -- Severed Tiger Head (1)
    .goto Teldrassil,53.6,62.4
    .collect 208610,1 -- Severed Owl Head (1)
    .goto Teldrassil,54.6,60.4
    .collect 208612,1 -- Severed Spider Head (1)
    .goto Teldrassil,53.0,67.0
    .mob Nightsaber
    .mob Nightsaber Stalker
    .mob Strigid Owl
    .mob Strigid Screecher
    .mob Webwood Lurker
    .mob Webwood Venomfang
    .train 403475,1
step << Warrior
    #completewith next
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Warrior
    #season 2
    .goto Darnassus,63.108,21.858
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_Delwynna|r交谈
    >>|cRXP_WARN_在提交三颗|r|cRXP_LOOT_被斩首的头颅|r后, 你将获得|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .train 403475 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]|cRXP_WARN_来训练|r|T135291:0|t[毁灭]
    .use 204703
    .skipgossip
    .target Delwynna
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 毁灭打击 - 6 (杜隆塔尔)
#displayname Devastate

step << Warrior
    #season 2
    >>击杀|cRXP_ENEMY_Wendigos|r. 击败它们后可获得战利品|cRXP_LOOT_Severed Wendigo Paw|r
    >>击杀|cRXP_ENEMY_霜鬃巨魔|r. 掠夺他们掉落的|cRXP_LOOT_ severed troll head|r
    >>击杀|cRXP_ENEMY_石腭穴居人|r. 掠夺他们的|cRXP_LOOT_纯净穴居人心脏|r
    .collect 208160,1 -- Severed Wendigo Paw (1)
    .goto Dun Morogh,42.2,52.6
    .collect 208159,1 -- Severed Troll Head (1)
    .goto Dun Morogh,41.6,43.8,60,0
    .goto Dun Morogh,42.2,35.0
    .collect 208158,1 -- Pristine Trogg Heart (1)
    .goto Dun Morogh,70.6,56.6
    .mob Young Wendigo
    .mob Wendigo
    .mob Frostmane Troll
    .mob Frostmane Headhunter
    .mob Frostmane Snowstrider
    .mob Frostmane Seer
    .mob Rockjaw Ambusher
    .mob Rockjaw Skullthumper
    .mob Rockjaw Bonesnapper
    .train 403475,1
step << Warrior
    #season 2
    .goto Dun Morogh,46.611,53.335
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Junni Steelpass|r交谈
    >>|cRXP_WARN_上交三件物品后, 你将获得|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .train 403475 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]|cRXP_WARN_来训练|r|T135291:0|t[毁灭]
    .use 204703
    .skipgossip
    .target Junni Steelpass
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 胜利冲刺 - 2(杜隆塔尔)
#displayname Victory Rush


    --Rune of Victory Rush

step << Orc/Troll
    #season 2
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .accept 77588 >>接受体能测试 << Troll
    .accept 77582 >>接受体能测试 << Orc
    .target Frang
step
    #season 2
    .goto Durotar,43.27,69.51
    >>掠夺隐藏宝箱以获得[胜利之符]
    >>|cRXP_WARN_绕过|r|cRXP_ENEMY_萨科斯|r|cRXP_WARN_然后跳下去到达宝箱|r
    .collect 204806,1 --Rune of Victory Rush (1)
    .train 403470,1
step
    #season 2
    .train 403470 >>使用 |T134419:0|t[|cRXP_FRIENDLY_胜利冲刺符文|r]
    .use 204806
    .itemcount 204806,1
step << Orc/Troll
    #season 2
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 77588 >>提交体能测试 << Troll
    .turnin 77582 >>提交体能测试 << Orc
    .target Frang

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 胜利冲刺 - 2(莫高雷)
#displayname Victory Rush


    --Rune of Victory Rush

step << Tauren
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .accept 77651 >>接受任务:踏入荆棘丛
    .target Harutt Thunderhorn
step
    #season 2
    .goto Mulgore,60.33,75.10,30,0
    .goto Mulgore,61.62,76.04
    >>掠夺|cRXP_PICK_Bristleback 战利品缓存|r以获得 |T134419:0|t[|cRXP_FRIENDLY_胜利冲刺符文|r]
    .collect 204806,1 --Rune of Victory Rush (1)
    .train 403470,1
step
    #season 2
    .train 403470 >>使用 |T134419:0|t[|cRXP_FRIENDLY_胜利冲刺符文|r]
    .use 204806
    .itemcount 204806,1
step << Tauren
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 77651 >>交给荆棘丛
    .target Harutt Thunderhorn

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 胜利冲刺 - 2 (提瑞斯法)
#displayname Victory Rush

    --Rune of Victory Rush

step << Undead
    #season 2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .accept 77668 >>接受失落的符文
    .target Dannal Stern
step
    #season 2
    .goto Tirisfal Glades,24.60,59.45
    >>在洞穴内拾取|cRXP_PICK_Lost Stache|r, 以获得 |T134419:0|t[|cRXP_FRIENDLY_胜利符文|r]
    .collect 204806,1 --Rune of Victory Rush (1)
    .train 403470,1
step
    #season 2
    .train 403470 >>使用 |T134419:0|t[|cRXP_FRIENDLY_胜利冲刺符文|r]
    .use 204806
    .itemcount 204806,1
step << Undead
    #season 2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 77668 >>交还失落的符文
    .target Dannal Stern

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狂怒雷霆 - 2 (杜隆塔尔)
#displayname Furious Thunder

    --Rune of Furious Thunder

step
    #season 2
    .goto Durotar,40.60,66.80
    >>击杀|cRXP_ENEMY_萨科斯|r. 击败他后可获得 |T134419:0|t[|cRXP_FRIENDLY_狂暴雷霆符文|r]
    .collect 204809,1 --Rune of Furious Thunder(1)
    .mob Sarkoth
    .train 403476,1
step
    #season 2
    .train 403476 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂怒雷霆符文|r]
    .use 204809
    .itemcount 204809,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狂怒雷霆 - 10 (提瑞斯法)
#displayname Furious Thunder


    --Rune of Furious Thunder

step
    #season 2
    .goto Tirisfal Glades,25.79,48.00
    >>击杀|cRXP_ENEMY_Gillgar|r. 击败他后可获得 |T134419:0|t[|cRXP_FRIENDLY_狂暴符文|r]
    >>|cRXP_WARN_这是7级精英|r
    .collect 204809,1 --Rune of Furious Thunder(1)
    .mob Gillgar
    .train 403476,1
step
    #season 2
    .train 403476 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂怒雷霆符文|r]
    .use 204809
    .itemcount 204809,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狂暴突袭 - 10(奥格瑞玛)
#displayname Frenzied Assault


    --Rune of Frenzied Assault

step
    #season 2
    #completewith next
    .goto Orgrimmar,57.40,53.93,-1
    .goto Orgrimmar,58.05,51.40,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎姆沙|r和|cRXP_FRIENDLY_格鲁阿克|r交谈
    +当|cRXP_ENEMY_Gru'ark|r变成敌对状态时将其击杀
    .target Zamja
    .target Gru'ark
    .skipgossip
    --Gossipoption
step
    #season 2
    .goto Orgrimmar,58.52,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎姆沙|r交谈
    >>从她那里获得 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target Zamja
    .train 425447,1
    .skipgossip
step
    #season 2
    .train 425447 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r]
    .use 204716
    .itemcount 204716,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狂暴突袭 - 10(雷霆崖)
#displayname Frenzied Assault


    --Rune of Frenzied Assault

step
    #season 2
    #completewith next
    .goto Thunder Bluff,28.73,18.00,-1
    .goto Thunder Bluff,26.19,18.65,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与灵魂高地上的|cRXP_FRIENDLY_Netali|r和|cRXP_FRIENDLY_Mooart|r交谈
    +击杀变为敌对的 |cRXP_FRIENDLY_Mooart|r
    .target Netali Proudwind
    .target Mooart
    .skipgossip
    --Gossipoption
step
    #season 2
    .goto Thunder Bluff,28.73,18.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈塔莉|r交谈
    >>从她那里获得 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target Netali
    .train 425447,1
    .skipgossip
step
    #season 2
    .train 425447 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r]
    .use 204716
    .itemcount 204716,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狂暴突袭 - 10(提瑞斯法)
#displayname Frenzied Assault


    --Rune of Frenzied Assault

step
    .goto Tirisfal Glades,61.73,51.91
    .gossipoption 110750 >>与|cRXP_FRIENDLY_本尼|r交谈
    .target Penny Hawkins
    .train 425447,1
step
    .goto Tirisfal Glades,61.72,51.72
    .gossipoption 109084 >>与|cRXP_FRIENDLY_Blueheart|r(在旅店楼下)交谈
    .target Blueheart
    .train 425447,1
step
    #season 2
    .goto Tirisfal Glades,61.72,51.91
    >>击杀|cRXP_ENEMY_Blueheart|r, 然后与楼上的|cRXP_FRIENDLY_本尼|r交谈
    .gossipoption 110751 >>从她那里获得 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target Netali
    .mob Blueheart
    .train 425447,1
    .skipgossip
step
    #season 2
    .train 425447 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r]
    .use 204716
    .itemcount 204716,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 毁灭打击 - 8 (杜隆塔尔)
#displayname Devastate


    --Rune of Devastate

step
    #season 2
    .goto Durotar,50.10,79.24,40,0
    .goto Durotar,47.74,80.35,40,0
    .goto Durotar,46.54,80.12,40,0
    .goto Durotar,50.10,79.24
    >>击杀|cRXP_ENEMY_科卡尔苦工|r和|cRXP_ENEMY_科卡尔前锋|r. 击杀后搜刮出|cRXP_LOOT_被砍下的半人马头颅|r
    .collect 207062,1 --Severed Centaur Head (1)
    .mob Kolkar Drudge
    .mob Kolkar Outrunner
    .train 403475,1
step
    #season 2
    .goto Durotar,54.02,27.23,40,0
    .goto Durotar,52.82,24.27,40,0
    .goto Durotar,51.85,23.95,40,0
    .goto Durotar,54.01,23.63,40,0
    .goto Durotar,52.13,20.77,40,0
    .goto Durotar,51.26,19.19,40,0
    .goto Durotar,53.98,23.70
    >>击杀|cRXP_ENEMY_Dustwind Harpies|r. 击败它们后可获得|cRXP_LOOT_Severed Harpy Head|r
    .collect 206995,1 ---Severed Harpy Head (1)
    .mob Dustwind Savage
    .mob Dustwind Storm Witch
    .mob Dustwind Pillager
    .mob Dustwind Harpy
    .train 403475,1
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
    >>击杀|cRXP_ENEMY_钢鬃野猪人|r. 击杀后可获得|cRXP_LOOT_被斩首的野猪头|r
    .collect 206994,1 ---Severed Quilboar Head (1)
    .mob Razormane Quilboar
    .mob Razormane Scout
    .train 403475,1
step
    #season 2
    .goto Durotar,53.14,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦希|r交谈
    >>上交你收集到的|cRXP_LOOT_Heads|r, 换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target Vahi Bonesplitter
    .train 403475,1
step
    #season 2
    .use 204688 >>使用 |T134455:0|t[符文碎片] 制作 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step
    #season 2
    .train 403475 >>使用 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .use 204703
    .itemcount 204703,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 毁灭打击 - 8 (莫高雷)
#displayname Devastate


    --Rune of Devastate

step
    #season 2
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0
    >>击杀|cRXP_ENEMY_Palemane Gnolls|r. 击败他们后搜刮出一个|cRXP_LOOT_Severed Gnoll Head|r
    .collect 204478,1 --Severed Gnoll Head (1)
    .unitscan Snagglespear
    .mob Palemane Tanner
    .mob Palemane Skinner
    .mob Palemane Poacher
    .train 403475,1
step
    #season 2
#loop
	.line Mulgore,34.08,43.71,32.98,42.96,31.72,43.08,31.08,42.09,31.12,40.87,31.74,40.31,32.44,41.17,33.57,41.30,33.82,40.26,34.48,41.21,34.50,42.29
	.goto Mulgore,34.08,43.71,25,0
	.goto Mulgore,32.98,42.96,25,0
	.goto Mulgore,31.72,43.08,25,0
	.goto Mulgore,31.08,42.09,25,0
	.goto Mulgore,31.12,40.87,25,0
	.goto Mulgore,31.74,40.31,25,0
	.goto Mulgore,32.44,41.17,25,0
	.goto Mulgore,33.57,41.30,25,0
	.goto Mulgore,33.82,40.26,25,0
	.goto Mulgore,34.48,41.21,25,0
	.goto Mulgore,34.50,42.29,25,0
    >>击杀|cRXP_ENEMY_Windfury 风怒女巫|r和|cRXP_ENEMY_Windfury 哈比妖|r. 击败它们后可拾取|cRXP_LOOT_Severed 哈比妖头颅|r
    .collect 206995,1 ---Severed Harpy Head (1)
    .mob Windfury Wind Witch
    .mob Windfury Harpy
    .train 403475,1
step
    #season 2
#loop
	.line Mulgore,59.85,25.62,61.14,22.93,61.77,22.49,62.18,22.05,62.32,20.89,61.62,19.50,60.44,19.50,60.16,21.06,60.41,21.96,61.12,22.88
	.goto Mulgore,59.85,25.62,25,0
	.goto Mulgore,61.14,22.93,25,0
	.goto Mulgore,61.77,22.49,25,0
	.goto Mulgore,62.18,22.05,25,0
	.goto Mulgore,62.32,20.89,25,0
	.goto Mulgore,61.62,19.50,25,0
	.goto Mulgore,60.44,19.50,25,0
	.goto Mulgore,60.16,21.06,25,0
	.goto Mulgore,60.41,21.96,25,0
	.goto Mulgore,61.12,22.88,25,0
    >>击杀 |cRXP_ENEMY_刺背干涉者|r. 击败他们后可获得 |cRXP_LOOT_断头兽人头颅|r
    .collect 206994,1 ---Severed Quilboar Head (1)
    .mob Bristleback Interloper
    .train 403475,1
step
    #season 2
    .goto Mulgore,46.29,61.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与血蹄村的|cRXP_FRIENDLY_Vateya|r交谈
    >>上交你收集到的|cRXP_LOOT_Heads|r, 换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target Vateya Timberhoof
    .train 403475,1
step
    #season 2
    .use 204688 >>使用 |T134455:0|t[符文碎片] 制作 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step
    #season 2
    .train 403475 >>使用 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .use 204703
    .itemcount 204703,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 毁灭打击 - 8 (提瑞斯法)
#displayname Devastate


    --Rune of Devastate

step
    #season 2
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .goto Tirisfal Glades,56.45,62.62
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step
    #season 2
    .goto Tirisfal Glades,56.31,39.67,40,0
    .goto Tirisfal Glades,54.71,41.19,40,0
    .goto Tirisfal Glades,53.90,43.93,40,0
    .goto Tirisfal Glades,55.24,42.54,40,0
    .goto Tirisfal Glades,56.43,43.92,40,0
    .goto Tirisfal Glades,55.24,42.54
    >>击杀|cRXP_ENEMY_腐皮豺狼人|r. 击败后可掠夺获得|cRXP_LOOT_severed gnoll head|r
    .collect 204478,1 --Severed Gnoll Head (1)
    .mob Rot Hide Mongrel
    .mob Rot Hide Graverobber
    .mob Rot Hide Gnoll
    .train 403475,1
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
    >>击杀|cRXP_ENEMY_鱼人|r. 击杀后搜刮出|cRXP_LOOT_鱼人的头颅|r
    .collect 204477,1 --Severed Murloc Head (1)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .train 403475,1
step
    #season 2
    .goto Undercity,48.03,70.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与幽暗城中的|cRXP_FRIENDLY_Dorac|r交谈
    >>上交你收集到的|cRXP_LOOT_Heads|r, 换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target Dorac Graves
    .train 403475,1
step
    #season 2
    .use 204688 >>使用 |T134455:0|t[符文碎片] 制作 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step
    #season 2
    .train 403475 >>使用 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .use 204703
    .itemcount 204703,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 血狂暴 - 8(杜洛塔尔)
#displayname Blood Frenzy


    --Rune of Blood Frenzy

step
    #season 2
    .goto Durotar,56.10,21.61,0
    .goto Durotar,56.98,24.42,0
    .goto Durotar,55.42,38.55,0
    .goto Durotar,40.65,48.24,0
    .goto Durotar,36.11,47.85,0
    .goto Durotar,56.10,21.61,100,0
    .goto Durotar,56.98,24.42,100,0
    .goto Durotar,55.42,38.55,100,0
    .goto Durotar,40.65,48.24,100,0
    .goto Durotar,36.11,47.85,100,0
    .goto Durotar,56.10,21.61
    >>找到并挑战|cRXP_FRIENDLY_Wandering Swordsman|r. 击败后从他掉落的|cRXP_PICK_Box|r中获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Blood Frenzy|r]
    >>|cRXP_ENEMY_他会在整个区域巡逻, 难以找到. 路径点会引导你经过已知的刷新位置|r
    .collect 204441,1 --Rune of Blood Frenzy (1)
    .unitscan Wandering Swordsman
    .train 403474,1
step
    #season 2
    .train 403474 >>使用 |T134419:0|t[|cRXP_FRIENDLY_血之狂暴符文|r]
    .use 204441
    .itemcount 204441,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 血狂怒 - 8(莫高雷)
#displayname Blood Frenzy


--Rune of Blood Frenzy

step
    #season 2
    .goto Mulgore,37.38,56.58,0
    .goto Mulgore,45.11,37.75,0
    .goto Mulgore,52.56,43.61,0
    .goto Mulgore,60.43,68.56,0
    .goto Mulgore,37.38,56.58,100,0
    .goto Mulgore,45.11,37.75,100,0
    .goto Mulgore,52.56,43.61,100,0
    .goto Mulgore,60.43,68.56,100,0
    .goto Mulgore,37.38,56.58
    >>找到并挑战|cRXP_FRIENDLY_Wandering Swordsman|r. 击败后从他掉落的|cRXP_PICK_Box|r中获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Blood Frenzy|r]
    >>|cRXP_ENEMY_他会在整个区域巡逻, 难以找到. 路径点会引导你经过已知的刷新位置|r
    .collect 204441,1 --Rune of Blood Frenzy (1)
    .unitscan Wandering Swordsman
    .train 403474,1
step
    #season 2
    .train 403474 >>使用 |T134419:0|t[|cRXP_FRIENDLY_血之狂暴符文|r]
    .use 204441
    .itemcount 204441,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 血狂暴 - 8 (提瑞斯法)
#displayname Blood Frenzy


    --Rune of Blood Frenzy

step
    #season 2
    .goto Tirisfal Glades,79.25,65.02
    >>找到并挑战|cRXP_FRIENDLY_Wandering Swordsman|r. 击败后从他掉落的|cRXP_PICK_Box|r中获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Blood Frenzy|r]
    >>|cRXP_ENEMY_他出现在巴尼尔农庄以东|r
    .collect 204441,1 --Rune of Blood Frenzy (1)
    .unitscan Wandering Swordsman
    .train 403474,1
step
    #season 2
    .train 403474 >>使用 |T134419:0|t[|cRXP_FRIENDLY_血之狂暴符文|r]
    .use 204441
    .itemcount 204441,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 快速打击 - 12(洛克莫丹)
#displayname Quick Strike

step << Warrior
    .goto Loch Modan,33.2,73.8
    >>击杀|cRXP_ENEMY_Troggs|r. 击杀后搜刮出|cRXP_LOOT_Skull-Shaped Geode|r
    .collect 208847,1 -- Skull-Shaped Geode (1)
    .mob Stonesplinter Scout
    .mob Stonesplinter Trogg
    .train 425443,1
step << Warrior
    .goto Loch Modan,33.2,73.8
    >>击杀碎石怪击颅者
    >>|cRXP_WARN_在战斗中, 它会给你一个猛烈的打击, 将|cRXP_LOOT_骷髅形晶洞|r变成|r|T236489:0|t[|cRXP_LOOT_破裂的骷髅形晶洞|r]
    .collect 208848,1 -- Cracked Skull-Shaped Geode (1)
    .mob Stonesplinter Skullthumper
    .train 425443,1
step << Warrior
    .use 208848 >>|cRXP_WARN_使用|r|T236489:0|t[|cRXP_LOOT_裂开的骷髅形矿石|r]|cRXP_WARN_来获取|r|T134419:0|t[|cRXP_FRIENDLY_迅击符文|r]
    .collect 208778,1 -- Rune of Quick Strike (1)
    .train 425443,1
step << Warrior
    .train 425443 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_快速打击符文|r]|cRXP_WARN_来训练|r|T132394:0|t[快速打击]
    .use 208778
    .itemcount 208778,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 无尽怒火 - 15(荒芜之地)
#displayname Endless Rage


    --Rune of Endless Rage

step
    #season 2
    .goto The Barrens,52.27,31.08,
    .aura 420667 >>点击|cRXP_PICK_Horde 战旗|r
    .train 403489,1
step
    #season 2
    #completewith next
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Ratchet >>飞往棘齿城
    .target Devrak
step
    #completewith next
    .subzone 385 >>前往北哨站
step
    #season 2
    .goto The Barrens,62.55,56.31
    >>点击|cRXP_PICK_Alliance Warbanner|r
    >>击杀|cRXP_ENEMY_Lieutenant Stonebrew|r, 他在出现时. 击败他后可获得 |T134419:0|t[|cRXP_FRIENDLY_符文 of Endless Rage|r]
    .collect 208741,1 --Rune of Endless Rage (1)
    .mob Lieutenant Stonebrew
    .train 403489,1
step
    #season 2
    .train 403489 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_无尽怒火符文|r] |cRXP_WARN_来训练|r |T132347:0|t[无尽怒火]
    .use 208741
    .itemcount 208741,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 无尽怒火 - 15(银松森林)
#displayname Endless Rage


    --Rune of Endless Rage

step
    #season 2
    #completewith next
    +|cRXP_WARN_建议组队, 因为你需要击杀一个17级精英怪|r
step
    #season 2
    .goto Silverpine Forest,35.03,7.73
    >>攻击|cRXP_ENEMY_蛛网受害者|r, 并杀死其生成的|cRXP_ENEMY_迷途探险者|r. 从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_无尽怒火符文|r]
    >>|cRXP_WARN_你必须击破|r|cRXP_ENEMY_蛛网受害者|r|cRXP_WARN_, 因为他每隔几秒就会恢复生命|r
    .collect 208741,1 --Rune of Endless Rage (1)
    .mob Webbed Victim
    .mob Lost Adventurer
    .train 403489,1
step
    #season 2
    .train 403489 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_无尽怒火符文|r] |cRXP_WARN_来训练|r |T132347:0|t[无尽怒火]
    .use 208741
    .itemcount 208741,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 快速打击 - 20(暗礁海岸)
#displayname Quick Strike

step << Warrior
    .goto 1439,44.081,20.739
    >>在骷髅的眼中拾取|T135129:0|t[扭曲鱼叉]
    .collect 209047,1 --Gnarled Harpoon (1)
    .train 425443,1
step << Warrior
    #completewith next
    .goto 1439,44.081,20.739
    .cast 422397 >>|cRXP_WARN_使用|r|T135129:0|t[扭曲鱼叉], |cRXP_WARN_目标: |r|cRXP_ENEMY_Paxnozz|r, 将他的最大生命值降至743|r
    .train 425443,1
step << Warrior
    #loop
    .goto Darkshore,48.0,18.0,0
    .goto Darkshore,47.6,13.2,0
    .goto Darkshore,50.4,12.0,0
    .goto Darkshore,48.8,16.0,0
    .goto Darkshore,48.0,18.0,40,0
    .goto Darkshore,47.6,13.2,40,0
    .goto Darkshore,50.4,12.0,40,0
    .goto Darkshore,48.8,16.0,40,0
    >>击杀|cRXP_ENEMY_Paxnozz|r. 击败他后搜刮出 |T134419:0|t|cRXP_LOOT_[快速打击符文]|r
    >>|cRXP_WARN_小心, 他是个20级精英怪|r
    .collect 208778,1 -- Rune of Quick Strike (1)
    .unitscan Paxnozz
    .use 209047
    .train 425443,1
step << Warrior
    .train 425443 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_快速打击符文|r]|cRXP_WARN_来训练|r|T132394:0|t[快速打击]
    .use 208778
    .itemcount 208778,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 血涌 - 40(艾泽拉斯)
#displayname Blood Surge

step
    .train 416004,1
    #completewith SpiceBlend
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    #completewith IllegibleReciple
    +|cRXP_WARN_你可能需要组队, 因为要获得|r|T134419:0|t[|cRXP_FRIENDLY_血涌符文|r], 必须击杀等级37以上的精英怪|r
    .subzoneskip 324
step
    #label IllegibleReciple
    .train 416004,1
    #loop
    .goto Alterac Mountains,39.0,54.6,0
    .goto Arathi Highlands,24.14,61.85,0
    .goto Arathi Highlands,24.14,61.85,30,0
    .goto Arathi Highlands,24.25,64.97,30,0
    .goto Arathi Highlands,21.22,66.52,40,0
    .goto Arathi Highlands,20.21,67.17,40,0
    >>击杀激流堡要塞内的石拳食人魔. 击败他们后可获得一个[难以辨认的配方]
    >>|cRXP_WARN_使用|r|T237451:0|t[|cRXP_LOOT_无法辨认的配方|r]|cRXP_WARN_来开始任务|r
    >>|cRXP_WARN_或者你也可以在奥特兰克山脉击杀|cRXP_ENEMY_破碎岭食人魔|r|r
    .collect 213422,1,79624 --Illegible Recipe (1x)
    .accept 79624 >>接受任务:任何人都能做饭
    .mob Boulderfist Shaman
    .mob Boulderfist Mauler
    .mob Boulderfist Lord
    .mob Crushridge Mauler
    .mob Crushridge Mage
    .mob Crushridge Enforcer
    .mob Crushridge Warmonger
step
    #completewith next
    .goto Arathi Highlands,57.587,72.499,10 >>爬上山顶前往 |cRXP_FRIENDLY_Skonk|r
step
    .train 416004,1
    .goto Arathi Highlands,57.68,74.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Skonk|r交谈
    .turnin 79624 >>交出“任何人都可以做饭”
    .accept 79677 >>接受快速杂货跑腿任务
    .target Skonk
step
    #completewith SpiceBlend
    .goto Arathi Highlands,30.74,66.94,60,0
    .goto Arathi Highlands,22.72,71.98,50,0
    .goto Arathi Highlands,21.50,75.91,40,0
    .goto Arathi Highlands,21.98,79.96,30 >>前往法迪尔湾
step
    #label SpiceBlend
    .train 416004,1
    .goto Arathi Highlands,20.47,84.90,8,0
    .goto Arathi Highlands,21.379,83.919
    >>打开|cRXP_PICK_密封的桶|r, 从中获取|cRXP_LOOT_走私者的香料混合物|r
    >>|cRXP_WARN_它位于沉船底部. 请游过最底层的大洞即可到达|r
    .complete 79677,2 --Smuggler's Spice Blend (1x)
step
    .train 416004,1
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
step
    .train 416004,1
    #loop
    .goto Hillsbrad Foothills,84.34,32.40,0
    .goto Hillsbrad Foothills,81.33,34.03,50,0
    .goto Hillsbrad Foothills,84.34,32.40,50,0
    .goto Hillsbrad Foothills,82.09,36.92,50,0
    >>击杀|cRXP_ENEMY_野生狮鹫|r. 击杀后搜刮其掉落的|cRXP_LOOT_混合兽腿|r`
    .complete 79677,1 --Hybrid Haunch (1x)
    .mob Kurdros << Horde
    .mob Granistad << Horde
    .mob Wild Gryphon
step
    .train 416004,1
    #completewith next
    .zone Badlands >>前往: |cRXP_PICK_荒芜之地|r
step
    #completewith next
    .goto Badlands,42.87,29.77,60 >>进入安戈尔要塞
step
    .train 416004,1
    .goto Badlands,41.92,26.26,20,0
    .goto Badlands,41.383,27.964
    >>点击|cRXP_PICK_Tapped Shadowforge Keg|r. 拾取它获得|cRXP_LOOT_Balmy Brew|r
    >>|cRXP_WARN_保持最大距离以避免吸引仇恨|r|cRXP_ENEMY_因弗努斯大使|r
    .complete 79677,3 --Balmy Brew (1x)
step
    .train 416004,1
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
step
    .train 416004,1
    #loop
    .goto Swamp of Sorrows,56.16,61.19,0
    .goto Swamp of Sorrows,62.11,65.79,0
    .goto Swamp of Sorrows,68.52,73.12,0
    .goto Swamp of Sorrows,72.50,82.18,0
    .goto Swamp of Sorrows,78.49,88.19,0
    .goto Swamp of Sorrows,56.16,61.19,60,0
    .goto Swamp of Sorrows,62.11,65.79,60,0
    .goto Swamp of Sorrows,68.52,73.12,60,0
    .goto Swamp of Sorrows,72.50,82.18,60,0
    .goto Swamp of Sorrows,78.49,88.19,60,0
    >>击杀|cRXP_ENEMY_Deathstrike 死亡狼蛛|r. 击杀后掠夺其掉落的|cRXP_LOOT_粘稠毒液|r
    >>|cRXP_WARN_它们位于悲伤沼泽的东南区域|r
    .complete 79677,4 --Viscous Venom (1x)
    .mob Deathstrike Tarantula
step
    .train 416004,1
    #completewith GroceryRun
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    #completewith next
    .goto Arathi Highlands,57.587,72.499,10 >>爬上山顶前往 |cRXP_FRIENDLY_Skonk|r
step
    #label GroceryRun
    .train 416004,1
    .goto Arathi Highlands,57.68,74.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Skonk|r交谈
    .turnin 79677 >>交还《快速杂货采购》
    .accept 79678 >>接任务: |cRXP_WARN_尝味|ring
    .timer 23,Taste Testing RP
    .target Skonk
step
    .train 416004,1
    .goto Arathi Highlands,57.68,74.66
    >>在|cRXP_ENEMY_Skonk|r吃完饭后击败他
    .complete 79678,1 --Taste Testing
    .mob Skonk
step
    .train 416004,1
    .goto Arathi Highlands,57.68,74.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Skonk|r交谈
    .turnin 79678 >>交任务: |cRXP_FRIENDLY_尝味|ring
    .target Skonk
step
    .train 416004 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_血涌符文|r] |cRXP_WARN_来训练|r |T236306:0|t[血涌]
    .use 213103
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 专注怒气 - 35(阿拉希高地)
#displayname Focused Rage

-- Focused Rage

step
    .train 409163,1
    #completewith WitherbarkCave
    +|cRXP_WARN_建议在尝试获取|r|T134419:0|t[|cRXP_LOOT_符文·专注狂怒|r]|cRXP_WARN_之前, 先寻找额外的队友, 因为该任务需要同时击杀一个35级精英怪和2个普通怪物|r
step
    .train 409163,1
    #completewith WitherbarkCave
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    .train 409163,1
    .goto Arathi Highlands,72.51,65.67,70,0
    .goto Arathi Highlands,70.334,69.93,70,0
    .goto Arathi Highlands,64.06,72.51,70,0
    .goto Arathi Highlands,61.35,71.72,70,0
    .goto Arathi Highlands,64.23,67.72,70,0
    .goto Arathi Highlands,66.56,63.98
    >>击杀|cRXP_ENEMY_枯木巨魔|r. 击败后可获得 |T133057:0|t[|cRXP_LOOT_枯木巨魔战锤|r]
    >>|cRXP_WARN_你也可以从拍卖行购买|r|T133057:0|t[|cRXP_LOOT_枯木锤|r]|r
    .collect 216483,1
    .mob Witherbark Shadow Hunter
    .mob Witherbark Axe Thrower
    .mob Witherbark Headhunter
    .mob Witherbark Witch Doctor
step
    .train 409163,1
    #label WitherbarkCave
    .goto Arathi Highlands,68.363,75.806,25 >>进入枯木洞窟
step
    .train 409163,1
    #completewith next
    .goto Arathi Highlands,69.502,81.924
    .cast 436278 >>|cRXP_WARN_使用|r|T133057:0|t[|cRXP_LOOT_枯木槌|r]|cRXP_WARN_ 在洞穴内的|cRXP_PICK_铜锣|r|r
    .use 216483 >>|cRXP_WARN_这将生成一个|cRXP_ENEMY_Witherbark Goliath|r(35级精英)以及另外2个怪物|r
step
    .train 409163,1
    .goto Arathi Highlands,69.61,81.60
    >>击杀|cRXP_ENEMY_Witherbark Goliath|r. 击败后拾取其掉落的 |T134419:0|t[|cRXP_LOOT_专注狂暴符文|r]
    .collect 213109,1
    .mob Witherbark Goliath
step
    .train 409163 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_LOOT_聚焦怒火符文|r]|cRXP_WARN_来训练|r|T132345:0|t[聚焦怒火]
    .use 213109
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#name 干预 - 24(千针石林)
#displayname Intervene

-- Intervene

step
    #optional
    .train 403472,1
    +|cRXP_WARN_你必须至少达到24级才能获得|r|T134419:0|t[|cRXP_FRIENDLY_干预符文|r]
    .xp >24,1
step
    .train 403472,1
    #completewith next
    .train 72,1
    .train 1671,1
    .train 1672,1
    +|cRXP_WARN_你必须学习|r|T132357:0|t[盾击]|cRXP_WARN_才能获得|r|T134419:0|t[|cRXP_FRIENDLY_干预符文|r]
step
    .train 403472,1
    .train 5308,1
    .train 20658,1
    .train 20660,1
    .train 20661,1
    .train 20662,1
    +|cRXP_WARN_你必须训练|r|T135358:0|t[执行]|cRXP_WARN_以获取|r|T134419:0|t[|cRXP_FRIENDLY_干预符文|r]
step
    .train 403472,1
    #optional
    .train 72,1
    .train 1671,1
    .train 1672,1
    +|cRXP_WARN_你必须学习|r|T132357:0|t[盾击]|cRXP_WARN_才能获得|r|T134419:0|t[|cRXP_FRIENDLY_干预符文|r]
step
    .train 403472,1
    #completewith next
    >>|cRXP_WARN_在前往千针石林之前, 请确保你已备齐以下物品(它们的属性强度无关紧要)|r
    +单手武器
    +一面盾牌
step
    .train 403472,1
    .goto Thousand Needles,67.84,89.50,100 >>前往 |cFFfa9602千针石林|r的锈槌挖掘场
step
    #completewith next
    +|cRXP_WARN_确保你已装备单手武器和盾牌|r
step
    .train 403472,1
    .goto Thousand Needles,67.968,89.800
    .cast 5308,20658,20660,20661,20662 >>|cRXP_WARN_对|cRXP_ENEMY_作战假人|r施放 |T135358:0|t[执行]|cRXP_WARN_, 然后移动到下一个|cRXP_ENEMY_作战假人|r|r
    .mob Combat Dummy
step
    .train 403472,1
    .goto Thousand Needles,67.845,89.511
    .cast 355 >>|cRXP_WARN_对|cRXP_ENEMY_作战假人|r施放|r|T136080:0 |t[嘲讽]|cRXP_WARN_, 然后移动到下一个|r|cRXP_ENEMY_作战假人|r|r
    .mob Combat Dummy
step
    .train 403472,1
    .goto Thousand Needles,67.713,89.245
    .cast 72,1671,1672 >>|cRXP_WARN_施放|r|T132357:0|t[盾击]|cRXP_WARN_在|r|cRXP_ENEMY_作战假人|r
    .mob Combat Dummy
step
    .train 403472,1
    .goto Thousand Needles,67.933,89.408
    >>打开|cRXP_PICK_战士的赏金|r宝箱. 将其打开后获得 |T134419:0|t[|cRXP_FRIENDLY_干预符文|r]
    .collect 213111,1 --Rune of Intervention (1x)
step
    .train 403472 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_干预符文|r]|cRXP_WARN_来训练|r|T132365:0|t[干预]
    .use 213111
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#name 集结号 - 40(荒芜之地)
#displayname Rallying Cry

-- Rallying Cry

step
    .train 426491,1
    #completewith next
    .zone Badlands >>前往: |cRXP_PICK_荒芜之地|r
step
    .train 426491,1
    #loop
    .goto Badlands,15.6,45.8,0
    .goto Badlands,20.0,57.0,0
    .goto Badlands,27.8,67.8,0
    .goto Badlands,33.0,66.2,0
    .goto Badlands,36.6,56.8,0
    .goto Badlands,15.6,45.8,30,0 << Alliance
    .goto Badlands,20.0,57.0,30,0 << Alliance
    .goto Badlands,27.8,67.8,30,0 << Alliance
    .goto Badlands,33.0,66.2,30,0 << Alliance
    .goto Badlands,36.6,56.8,30,0 << Alliance
    .goto Badlands,36.6,56.8,30,0 << Horde
    .goto Badlands,33.0,66.2,30,0 << Horde
    .goto Badlands,27.8,67.8,30,0 << Horde
    .goto Badlands,20.0,57.0,30,0 << Horde
    .goto Badlands,15.6,45.8,30,0 << Horde
    >>与荒芜之地的|cRXP_FRIENDLY_游侠剑士|r交谈
    >>在决斗中击败流浪剑士|r
    >>打开他掉在地上的|cRXP_PICK_剑士的奖励|r, 拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_指挥官符文|r]
    >>|cRXP_WARN_注意:|cRXP_FRIENDLY_流浪剑客|r可能在荒芜之地的多个地点出现|r
    .collect 213110,1 --Rune of the Commander (1x)
    .unitscan Wandering Swordsman
    .skipgossip
step
    .train 426491 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_指挥官符文|r]|cRXP_WARN_来学习|r|T132339:0|t[集结号角]
    .use 213110
]])


RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Rampage
#name 狂暴 - 43 (费拉斯)


step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
    .goto Feralas,75,35.2,20 >>前往莫沙彻营地以北的戈杜尼前哨洞穴
    .train 427081,1
step
    .goto Feralas,74.8,24.9
    >>进入洞穴, 寻找等级43的精英食人魔奥克齐. 击杀他可获得 |T134419:0|t[|cRXP_FRIENDLY_无羁符文|r]
    .collect 220682,1 -- Rune of Unbridled 1/1
    .unitscan Ohk'zi
    .train 427081,1
step
    .train 427081 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_无羁符文|r]|cRXP_WARN_来学习|r|T132352:0|t[狂暴]
    .use 220682

]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Wrecking Crew
#name 拆船小队 - 40(荒野地带)

step
    #completewith next
    .zone The Hinterlands >>前往: |cRXP_PICK_辛特兰|r
step
    #loop
    .goto The Hinterlands,23.6,57.4
    .goto The Hinterlands,36.6,66.2,0
    .goto The Hinterlands,31.6,59.8,0
    >>击杀地图西部区域的任意一个|cRXP_ENEMY_Witherbark Trolls|r枯木巨魔, 直到从它们身上 loot 到 |T133054:0|t|cRXP_LOOT_Geode Hammer|r重锤之矿石
    .collect 220912,1 --Geode Hammer 1/1
    .mob Witherbark Sadist
    .mob Witherbark Scalper
    .mob Witherbark Zealot
    .mob Witherbark Hideskinner
    .mob Witherbark Venomblood
    .train 427084,1
step
    .equip 16,220912 >>装备 |T133054:0|t|cRXP_LOOT_Geode Hammer|r作为你的主手武器. 继续击杀怪物, 直到锤子破碎并转化为 |T133054:0|t|cRXP_LOOT_Broken Geode Hammer|r
    .collect 220914,1 --Broken Geode Hammer
    .train 427084,1
step
    >>右键点击 |T133054:0|t|cRXP_LOOT_破碎晶石重锤|r以获取 |T134419:0|t[|cRXP_FRIENDLY_爆破符文|r]
    .collect 220913,1 --Rune of the Demolition
    .train 427084,1
step
    .train 427084 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_拆除符文|r]|cRXP_WARN_来学习|r|T132364:0|t[拆毁小队]
    .use 220913
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup 头盔
#displayname Taste for Blood
#name 嗜血之味 - 50(灼热峡谷)

step
    #completewith SlagPits
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
step
    #sticky
    #completewith summonIodax
    >>|cRXP_WARN_要完成此任务, 你需要召唤并击杀一只50级精英熔岩傀儡, 其生命值约为12,000. 虽然可以单人完成, 但我建议组队挑战. 召唤该傀儡需要从灼热峡谷的炉渣坑中收集4个部件. 不过, 如果你能找到其他玩家帮你召唤Boss, 就无需亲自收集这些部件——此时可直接跳转至第13步|r
    .collect 221258,1 --Right Foot of the Obliterator
    .collect 221256,1 --Right Arm of the Obliterator
    .collect 221259,1 --Left Foot of the Obliterator
    .collect 221257,1 --Left Arm of the Obliterator
step
    #label SlagPits
    .goto 1427/0,-1247.100,-6906.900,10 >>通过此处洞穴进入熔渣坑
    .train 427076,1
step
    .goto 1427/0,-1257.200,-6764.300
    >>进入洞穴后, 沿着弯曲的小路前进. 毁灭者右臂(|cRXP_LOOT_Right Arm of the Obliterator|r)就在一堆箱子和木桶旁边的地上
    .collect 221256,1 --Right Arm of the Obliterator 1/1
    .train 427076,1
step
    .goto 1427/0,-1161.500,-6756.500,10 >>跑向并穿过大门
    .train 427076,1
step
    .goto 1427/0,-1303.200,-6461.500,15 >>继续沿着路径前进. 在有巨大石像鬼(golem)位于地面上的大房间中, 沿着坡道前往深坑的上层
    .train 427076,1
step
    .goto 1427/0,-1301.900,-6584.700
    >>拾取地面上|cRXP_LOOT_毁灭者的右脚|r
    .collect 221258,1 --Right Foot of the Obliterator
    .train 427076,1
step
    .goto 1427/0,-1387.200,-6722.700,10 >>前往桥的南端
    .train 427076,1
step
    .goto 1427/0,-1428.600,-6656.800
    >>从桥上跳下, 前往炎龙洞穴. 在熔岩池旁边的地板上拾取|cRXP_LOOT_毁灭者之左臂|r
    .collect 221257,1 --Left Arm of the Obliterator
    .train 427076,1
step
    .goto 1427/0,-1271.900,-6553.500
    >>前往焚火龙洞穴的最深处, 从地面拾取毁灭者的左脚|cRXP_LOOT_左脚|r
    .collect 221259,1
    .train 427076,1
step
	#completewith next
	+通过跳到脚后方的岩石上并注销来跳过登录界面
	.link https://youtu.be/oBnDG1AWcxU >>点击此处参考
step
    #label summonIodax
    #optional
    #completewith next
    .goto 1427/0,-1791.400,-6774.900
    .cast 446363 >>前往地图上标记的毁灭者之首, 使用你收集到的部件召唤|cRXP_ENEMY_Iodax 毁灭者|r——一名50级精英巨怪
    .unitscan Iodax the Obliterator
    .train 427076,1
step
    .goto 1427/0,-1791.400,-6774.900
    >>击杀|cRXP_ENEMY_Iodax the Obliterator|r并从他身上获取 |T134419:0|t[|cRXP_FRIENDLY_血渴符文|r]
    .collect 221267,1 --Rune of the Bloodthirsty
    .unitscan Iodax the Obliterator
    .train 427076,1
step
    .train 427076 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_嗜血符文|r]|cRXP_WARN_来学习|r|T236276:0|t[嗜血之味]
    .use 221267
    .itemcount 221267,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup 头盔
#displayname Vigilance
#name 警戒 - 46(费拉斯)

step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
    .goto Feralas,77.6,62.0,30 >>前往菲拉斯的蠕动深渊, 那里是虫群的巢穴. |cRXP_WARN_你需要击败一只高伤害的46级精英怪. 如果你等级未满50, 请寻找组队|r
    .train 427078,1
step
    .goto Feralas,77.6,62.0
    >>寻找|cRXP_ENEMY_Tyrant of the Hive|r, 击杀他并拾取 |T134419:0|t[|cRXP_FRIENDLY_守望者符文|r]
    .collect 221473,1 --Rune of the watchman
    .unitscan Tyrant of the Hive
    .train 427078,1
step
    .train 427078 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_守望者符文|r]|cRXP_WARN_来学习|r|T236318:0|t[警戒]
    .use 221473
]])
RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#displayname Gladiator Stance
#name 角斗士姿态 - 45(塔纳利斯 & 阿兹莎拉)

step
    #completewith theOldChamp
    +|cRXP_WARN_为了解锁|r|T236541:0|t[角斗士姿态]|cRXP_WARN_, 你需要击败两名会掉落|r|T132334:0|t[血性狂怒] 和 |T132339:0|t[激励呐喊]|cRXP_WARN_符文的流浪剑客. 请确保在继续前完成此任务. 若不确定它们的位置, 请参考各自的符文指南|r
    +|cRXP_WARN_进行此任务线时, 请勿与任何人组队. 据报告, 这会导致任务经常出现错误, 使任务无法完成|r
step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
step
    #label theOldChamp
    .goto Tanaris,51.6,27.6
    >>与加基森的|cRXP_FRIENDLY_Fizbuz Mithril|r交谈
    .accept 81682 >>接受老冠军任务
    .target Fizbuz Mithril
step
    #completewith next
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
step
    .goto Azshara,27,61,40 >>寻找一条通往山顶的小路, 路上有部落旗帜标记
    .train 416002,1
step
    .goto Azshara,25.4,66.2
    >>与山顶路径上的|cRXP_FRIENDLY_Kajind|r交谈
    .turnin 81682 >>交还“老冠军”
    .accept 81697 >>接受“拔牙”任务
    .target Kajind
step
    .goto Azshara,39.4,72.4
    >>寻找|cRXP_ENEMY_Ceruleos|r一只50级蓝龙. 它在湖的北侧巡逻. 击败他后可获得 |T251962:0|t|cRXP_LOOT_Kajind's Blade|r
    .complete 81697,1 --Kajind's Blade
    .unitscan Ceruleos
step
    .goto Azshara,25.4,66.2
    >>返回|cRXP_FRIENDLY_Kajind|r
    .turnin 81697 >>交出无牙的物品
    .accept 81801 >>接受返回竞技场
    .target Kajind
step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
step
    .goto Tanaris,51.6,27.6
    >>回到加基森, 找|cRXP_FRIENDLY_Fizbuz Mithril|r交谈
    .turnin 81801 >>交还任务:重返竞技场
    .accept 81877 >>接受斗技之夜
    .target Fizbuz Mithril
step
    >>在加基森竞技场击败卡金德
    .complete 81877,1 --Arena Victory 1/1
    .unitscan Kajind
step
    .goto Tanaris,51.6,27.6
    >>在|cRXP_FRIENDLY_Fizbuz Mithril|r处交任务
    .turnin 81877 >>交还“搏击之夜”任务
    .target Fizbuz Mithril
step
    .train 416002 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_角斗士符文|r] |cRXP_WARN_来学习|r |T236541:0|t[角斗士姿态]
    .use 220164
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Fresh Meat
#name 新鲜的螃蟹腿 - 55(燃烧平原)

step
    #completewith next
    .zone Burning Steppes >>前往: |cRXP_PICK_燃烧平原|r
step
    .train 440492,1
    .goto Burning Steppes,40.4,33.6
    .aura 459616 >>|cRXP_WARN_击杀黑石要塞中的黑石兽人, 直到获得|r|T132353:0|t[战争节奏]|cRXP_WARN_buff|r
    .mob Blackrock Battlemaster
    .mob Blackrock Slayer
    .mob Blackrock Warlock
    .mob Blackrock Sorcerer
step
    .train 440492,1
    .goto Burning Steppes,39.549,27.828
    >>|cRXP_WARN_前往|r|cRXP_PICK_崇敬祭坛|r
    >>|cRXP_WARN_到达那里后, 在聊天框中输入“/salute”. 这将召唤出一名|r|cRXP_ENEMY_Revered Champion(声望崇敬的冠军)|r
    >>击杀|r|cRXP_ENEMY_Revered Champion|r, 然后点击|r|cRXP_PICK_Altar of Reverence|r
    .accept 84124 >>接任务: |cRXP_WARN_遗产|r of Valor
    .turnin 84124 >>交任务: |cRXP_FRIENDLY_遗产|r of Valor
    .mob Revered Champion
step
    .train 440492 >>|cRXP_WARN_使用|r|T133747:0|t[|cRXP_LOOT_首战者符文|r] |cRXP_WARN_来学习|r|T237516:0|t[新鲜的螃蟹腿]
    .use 226680
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Sudden Death
#name 突然死亡 - 57(希利苏斯)

step
    #completewith next
    .zone Silithus >>前往: |cRXP_PICK_希利苏斯|r
step
    .train 440494,1
    #loop
    .goto Silithus,55.4,53.2,60,0
    .goto Silithus,47.0,53.6,60,0
    .goto Silithus,45.0,74.0,60,0
    .goto Silithus,44.2,83.4,60,0
    .goto Silithus,33.6,69.2,60,0
    .goto Silithus,41.0,65.2,60,0
    .goto Silithus,34.8,33.6,60,0
    .goto Silithus,31.0,17.2,60,0
    .gossip 228611,2 >>|cRXP_WARN_在希利苏斯寻找一名|cRXP_FRIENDLY_流浪剑客|r|r
    >>|cRXP_WARN_与|cRXP_FRIENDLY_流浪剑士|r交谈. 你必须选择中等或困难难度, 才能获得符文|r
    >>|cRXP_WARN_你将立即被传送至一个小型平台, 随后对|r|cRXP_ENEMY_Khonsu展开战斗|r
    >>|cRXP_WARN_它会施放看起来像[Cleave]的技能. 当你看到这些技能动画时, 请迅速远离|r
    >>|cRXP_WARN_当他施放 [雷霆践踏] 时, 你必须移动到平台突出的小边缘之一, 否则你会被击落|r
    >>|cRXP_WARN_还建议你在战斗中使用|r|T132342:0|t[胜利冲刺]|cRXP_WARN_rune, 因为你会在整个战斗过程中击杀小怪|r
    .unitscan Wandering Swordsman
step
    .train 440494,1
    >>|cRXP_WARN_击败|cRXP_ENEMY_Khonsu|r
    >>|cRXP_WARN_它会施放看起来像[Cleave]的技能. 当你看到这些技能动画时, 请迅速远离|r
    >>|cRXP_WARN_当他施放 [雷霆践踏] 时, 你必须移动到平台突出的小边缘之一, 否则你会被击落|r
    >>|cRXP_WARN_成功后, 接受并提交任务|r
    .accept 84317 >>接任务: |cRXP_WARN_午夜无明|r
    .turnin 84317 >>交任务: |cRXP_FRIENDLY_午夜无明|r
    .mob Titanic Watcher
step
    .train 440494 >>|cRXP_WARN_使用|r|T133739:0|t[|cRXP_LOOT_永恒流浪者的启示|r]|cRXP_WARN_来学习|r|T132346:0|t[突然死亡]
    .use 226679
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Shockwave
#name 震波 - 60(艾泽拉斯)

step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
step
    .train 440496,1
    .goto Tanaris,59.2,91.5 
    >>|cRXP_WARN_沿着海岸线前往塔纳利斯南部|r
    >>点击地面上的|cRXP_PICK_Half-Buried Mech|r和|cRXP_PICK_Access Hatch|r
    .accept 84135 >>接任务: |cRXP_WARN_迷滩机器人|r
    .turnin 84135 >>交任务: |cRXP_FRIENDLY_迷滩机器人|r
    .accept 84137 >>接任务: |cRXP_WARN_机械罗曼史|r
step
    .train 440496,1
    #completewith next
    .cast 459613 >>|cRXP_WARN_使用|r|T134731:0|t[引导浮力加速剂]|cRXP_WARN_可在接下来的4分钟内提升你的游泳速度|r
    .use 226856
step
    .train 440496,1
    >>|cRXP_WARN_注意:此步骤无指引箭头！|r
    >>|cRXP_WARN_你现在必须向南游到那座偏远的岛屿, 与|cRXP_FRIENDLY_Sebastian Jurgens|r交谈. 你需要游过疲劳水域才能抵达他所在的位置. 前往岛上位于石油钻井平台处, 就能找到他|r
    .turnin 84137 >>交任务: |cRXP_FRIENDLY_机械罗曼史|r
    .accept 84138 >>接任务: |cRXP_WARN_冷淡之谊|r
    .target Sebastian Jurgens
step
    .train 440496,1
    #completewith next
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
step
    .train 440496,1
    .goto Winterspring,61.2,37.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Numi|r交谈
    .turnin 84138 >>交任务: |cRXP_FRIENDLY_冷淡之谊|r
    .accept 84146 >>接任务: |cRXP_WARN_红口袋，蓝受心|r
    .target Numi
step
    #completewith next
    .zone Burning Steppes >>前往: |cRXP_PICK_燃烧平原|r
step
    .train 440496,1
    .goto Burning Steppes,52.955,24.374
    >>点击地面上的|cRXP_PICK_Red Bag|r
    .turnin 84146 >>交任务: |cRXP_FRIENDLY_红口袋，蓝受心|r
    .accept 84211 >>接任务: |cRXP_WARN_偷猎者窝点|r
    .target Red Bag
step
    .train 440496,1
    #loop
    .goto Burning Steppes,47.0,27.2,45,0
    .goto Burning Steppes,46.4,21.4,45,0
    .goto Burning Steppes,52.95,24.37,45,0
    >>击杀 |cRXP_ENEMY_Blackrock Bootleggers|r 和 |cRXP_ENEMY_Sulfuron Smugglers|r. 从他们身上搜刮出 |cRXP_LOOT_Vertically Composited Patch Hamplers|r 和 |cRXP_LOOT_Brass-fitted Flam-Tamp Flange|r
    .complete 84211,1
    .complete 84211,2
    .mob Blackrock Bootlegger
    .mob Sulfuron Smuggler
step
    .train 440496,1
    #completewith next
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
step
    .train 440496,1
    .goto Winterspring,61.2,37.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Numi|r交谈
    .turnin 84211 >>交任务: |cRXP_FRIENDLY_偷猎者窝点|r
    .accept 84212 >>接任务: |cRXP_WARN_返程长票|r
    .target Numi
step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
step
    .train 440496,1
    >>|cRXP_WARN_再次回到南部偏远岛屿上的|cRXP_FRIENDLY_塞巴斯蒂安·尤尔根斯|r处|r
    .turnin 84212 >>交任务: |cRXP_FRIENDLY_返程长票|r
    .accept 84213 >>接任务: |cRXP_WARN_朝来隙往|r
    .target Sebastian Jurgens
step
    .train 440496,1
    .zone Westfall >>|cRXP_WARN_前往: |cRXP_PICK_西部荒野|r|r << Alliance
    .zone Tirisfal Glades >>|cRXP_WARN_前往: |cRXP_PICK_提瑞斯法林地|r|r << Horde
    .target Sebastian Jurgens
step
    .train 440496,1
    >>|cRXP_WARN_寻找一个团队来帮你完成这个任务！你至少需要有一个坦克和一个治疗者协助你！|r
    >>与|cRXP_FRIENDLY_塞巴斯蒂安·尤尔根斯|r交谈, 以召唤|r麦田傀儡 V000-A|r
    >>击杀|cRXP_ENEMY_麦田傀儡 V000-A|r
    .complete 84213,1
    .mob Harvest Golem V000-A
step
    .train 440496,1
    >>点击地面上的|cRXP_PICK_Mech Arm|r
    .turnin 84213 >>交任务: |cRXP_FRIENDLY_朝来隙往|r
step
    .train 440496 >>|cRXP_WARN_使用|r|T133738:0|t[|cRXP_LOOT_预感与战斗先知|r]|cRXP_WARN_来学习|r|T236312:0|t[震荡波]
    .use 226678
]])