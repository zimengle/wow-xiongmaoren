RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 忏悔 - 3 (艾尔文森林)
#displayname Penance

step << Priest
    #season 2
    .goto Elwynn Forest,48.61,27.63
    >>击杀|cRXP_ENEMY_狗头人苦力|r. 击败他们后可获得 |T136222:0|t[|cRXP_FRIENDLY_受困侍僧的记忆|r]
    .collect 205951,1 -- Memory of a Troubled Acolyte (1)
    .mob Kobold Laborer
    .train 402862,1
step << Priest
    #season 2
    .goto Elwynn Forest,49.808,39.489
    >>|cRXP_WARN_在北郡修道院内, 打开聊天框并输入 /kneel|r
    >>|cRXP_WARN_您将获得|r|T135934:0|t[光明冥想]|cRXP_WARN_buff|r
    .cast 410958 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_ 侍僧的困扰记忆|r]|cRXP_WARN_当你拥有|r|T135934:0|t[光明冥想]|cRXP_WARN_ 效果时|r
    .use 205951
    .itemcount 205951,1
    .train 402862,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 忏悔 - 1(丹莫洛)
#displayname Penance


step << Priest
    #season 2
    .goto Dun Morogh,26.733,72.552
    >>打开地面上的|cRXP_PICK_Rockjaw Footlocker|r. 拾取其中的 |T136222:0|t|cRXP_LOOT_[困扰侍僧的记忆]|r
    .collect 205951,1 -- Memory of a Troubled Acolyte (1)
    .train 402862,1
step << Priest
    #season 2
    .goto 1426,28.922,66.378
    .aura 410935 >>|cRXP_WARN_瞄准内部的|cRXP_FRIENDLY_光之祭坛|r以获得 |T135934:0|t[光明冥想]|cRXP_WARN_buff|r
    >>|cRXP_WARN_如果这不起作用, 请输入 /kneel 并将目标锁定在|cRXP_FRIENDLY_Altar of the Light|r上|r
    .target Altar of the Light
    .emote KNEEL,208565
    .train 402862,1
step << Priest
    #season 2
    .train 402862 >>|cRXP_WARN_使用|r|T136222:0|t|cRXP_LOOT_[困扰侍僧的记忆]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 忏悔]
    .aura -410935
    .use 205951
]])

RXPGuides.RegisterGuide([[
#classic
<< NightElf Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 忏悔 - 2(影谷)
#displayname Penance

step << NightElf Priest
    #season 2
    .goto Teldrassil,59.92,41.74,20,0
    .goto Teldrassil,59.174,40.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_珊达|r交谈
    .accept 77574 >>接任务: |cRXP_WARN_艾露恩之思|r
    .target Shanda
    .train 402862,1
step << NightElf Priest
    #season 2
    #completewith next
    .isOnQuest 77574
    .goto Teldrassil,59.940,33.052,10 >>前往幽影谷的月井
    .train 402862,1
step << NightElf Priest
    #season 2
    .isOnQuest 77574
    .goto Teldrassil,59.940,33.052
    .aura 419307 >>|cRXP_WARN_到达月亮井后, 在聊天框中输入/kneel|r
    >>|cRXP_WARN_你将获得|r|T136057:0|t[艾露恩的冥想]|cRXP_WARN_buff|r
    .train 402862,1
step << NightElf Priest
    #season 2
    #label PenanceRune
    .isOnQuest 77574
    .use 205951 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_困扰侍僧的回忆|r]|cRXP_WARN_ while you have the|r|T136057:0|t[艾露恩的冥想]|cRXP_WARN_ buff|r
    .complete 77574,1 -- Learn: Engrave Gloves - Penance
    .target Altar of the Light
    .train 402862,1
step << NightElf Priest
    #season 2
    .goto Teldrassil,59.92,41.74,20,0
    .goto Teldrassil,59.174,40.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_珊达|r交谈
    .turnin 77574 >>交任务: |cRXP_FRIENDLY_艾露恩之思|r
    .target Shanda
    .train 402862,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Troll Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 忏悔 - 2 (杜隆塔尔)
#displayname Penance


    --Rune of Penance

step << Priest
    #season 2
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯贾伊|r交谈
    .accept 77642 >>接受洛阿神明的智慧
    .target Ken'jai
step << Priest
    #season 2
    .goto Durotar,55.41,72.84
    >>前往森金村的|cRXP_PICK_Loa 祭坛|r并输入 /kneel
    .use 205951 >>当他出现时, 与|cRXP_FRIENDLY_[毒蛇之神]|r交谈, 然后使用|T136222:0|t[|cRXP_FRIENDLY_动荡侍僧的记忆|r]
    .complete 77642,1 --学习法术:刻印手套 - 赎罪
    .target Serpent Loa
    .skipgossip
step << Priest
    #season 2
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯贾伊|r交谈
    .turnin 77642 >>交还洛阿的智慧
    .target Ken'jai
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Undead Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 忏悔 - 2 (提瑞斯法)
#displayname Penance


    --Rune of Penance

step << Priest
    #season 2
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Duesten|r交谈
    .accept 77670 >>接受亡灵冥想
    .target Dark Cleric Duesten
step << Priest
    #season 2
    .goto Tirisfal Glades,31.06,64.80
    >>进入墓地后输入 /kneel 命令
    .use 205951 >>当你获得 |T237569:0|t[冥想不死] 增益时, 使用 |T136222:0|t[|cRXP_FRIENDLY_ 侍僧的困扰记忆|r]
    .complete 77670,1 >>学习法术:刻印手套 - 赎罪
step << Priest
    #season 2
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Duesten|r交谈
    .turnin 77670 >>交还《亡灵冥想》
    .target Dark Cleric Duesten

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 傀儡 - 8 (杜隆塔尔)
#displayname Homunculi

step
    .train 402852,1
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step
    .train 402852,1
    .goto Durotar,55.32,72.66
    .emote KNEEL,208309
    .aura 417316 >>跪在|cRXP_PICK_Loa 祭坛|r前, 并与|cRXP_FRIENDLY_蛇神 Loa|r交谈
    .skipgossip 208307,1
    .target Serpent Loa
step
    .train 402852,1
    >>击杀|cRXP_ENEMY_巫毒巨魔|r. 从他们身上搜刮出 |T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r]
    .goto Durotar,67.6,86.4
    .collect 205947,1
    .mob Voodoo Troll
step << Troll
    .train 402852,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>在|cRXP_PICK_Loa 祭坛|r前跪下, 并与|cRXP_FRIENDLY_Serpent Loa|r交谈, 以获得 |T136077:0|t[冥想之灵] 增益效果
step << Troll
    .train 402852,1
    .aura 418459 >>|cRXP_WARN_现在你必须找到一个带有洛阿增益的亡灵牧师. 你必须在他面前跪下, 然后他为你施放祈祷|r
step << Undead
    .train 402852,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>在|cRXP_PICK_Loa 祭坛|r前跪下, 并与|cRXP_FRIENDLY_Serpent Loa|r交谈, 以获得 |T136077:0|t[冥想之灵] 增益效果
step << Undead
    .train 402852,1
    .goto Durotar,55.32,72.66
    .aura 418459 >>|cRXP_WARN_在森金墓地跪下|r以获得 |T237569:0|t[亡者冥想] 增益
step
    .use 205947
    .itemcount 205947,1
    .train 402852 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r]|cRXP_WARN_来训练|r|T237570:0|t[傀儡]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 人造人 - 7 (提瑞斯法林地)
#displayname Homunculi

step
    .train 402852,1
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 402852,1
    >>击杀 |cRXP_ENEMY_血色战士|r或 |cRXP_ENEMY_血色传教士|r. 击败他们后搜刮, 获取 |T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r]
    .goto Tirisfal Glades,50.6,67.8,0
    .goto Tirisfal Glades,32.6,48.6
    .collect 205947,1
    .mob Scarlet Warrior
    .mob Scarlet Missionary
step << Troll
    .train 402852,1
    .aura 418459 >>|cRXP_WARN_现在你必须找到一名拥有洛阿增益的亡灵牧师. 你需要在他面前跪下, 他必须为你施法祈福, 才能获得 |T237569:0|t[对亡灵的冥想] 增益效果|r
step << Troll
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Troll
    .train 402852,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>在|cRXP_PICK_Loa 祭坛|r前跪下, 并与|cRXP_FRIENDLY_Serpent Loa|r交谈, 以获得 |T136077:0|t[冥想之灵] 增益效果
step << Undead
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Undead
    .train 402852,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>在|cRXP_PICK_Loa 祭坛|r前跪下, 并与|cRXP_FRIENDLY_Serpent Loa|r交谈, 以获得 |T136077:0|t[冥想之灵] 增益效果
    *|cRXP_WARN_You can also find a Troll Priest with the |T136077:0|t[Meditation on the Loa] buff. Kneel before him and he has to /pray for you|r.
step << Undead
    .train 402852,1
    .goto Durotar,57.15,73.36
    .aura 418459 >>|cRXP_WARN_在森金墓地跪下|r以获得 |T237569:0|t[亡者冥想] 增益
step
    .use 205947
    .itemcount 205947,1
    .train 402852 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r]|cRXP_WARN_来训练|r|T237570:0|t[傀儡]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 共感之痛 - 13 (杜隆塔尔)
#displayname Shared Pain

step
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step
    .train 402854,1
    >>击杀|cRXP_ENEMY_马卡斯加|r或|cRXP_ENEMY_Gazz'uz|r(在洞穴中), 选择离你最近的一个(路径点会指引你前往最近的目标). 击败后可拾取 |T136222:0|t[|cRXP_FRIENDLY_被囚禁救世主的记忆|r]
    .goto Durotar,52.6,8.8,-1
    .goto Durotar,62.0,66.2,-1
    .collect 205945,1
    .mob Makasgar
    .mob Gazz'uz
step
    .train 402854,1
    .goto Durotar,55.32,72.66
    .emote KNEEL,208309
    .aura 417316 >>在|cRXP_PICK_Loa 祭坛|r前跪下, 并与|cRXP_FRIENDLY_Serpent Loa|r交谈, 以获得 |T136077:0|t[冥想之灵] 增益效果
    .skipgossip 208307,1
    .target Serpent Loa
step
    .use 205945
    .itemcount 205945,1
    .train 402854 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的记忆|r]|cRXP_WARN_进行训练|r|T136160:0|t[共享痛苦]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 共感之痛 - 6(提瑞斯法林地)
#displayname Shared Pain

step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 402854,1
    >>击杀|cRXP_ENEMY_提瑞斯法农夫|r. 击败他们后搜刮出 |T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的回忆|r]
    .goto Tirisfal Glades,36.2,50.4
    .collect 205945,1
    .mob Tirisfal Farmer
step << Undead
    .train 402854,1
    .goto Tirisfal Glades,56.39,49.39
    .aura 418459 >>在墓地跪拜, 直到获得增益效果 |T237569:0|t[亡灵冥想]
step << Troll
    #completewith SharedPainTirisfalA
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Troll
    #label SharedPainTirisfalA
    .train 402854,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .aura 417316 >>在|cRXP_PICK_Loa 祭坛|r前跪下, 并与|cRXP_FRIENDLY_Serpent Loa|r交谈, 以获得 |T136077:0|t[冥想之灵] 增益效果
    .aura -418459
    >>|cRXP_WARN_你还可以找到一名带有洛阿增益的亡灵牧师. 你需要在他面前跪下, 他必须对你使用“祈祷”技能, 才能获得 |T237569:0|t[亡灵冥想] 效果|r
    .skipgossip 208307,1
step
    .use 205945
    .itemcount 205945,1
    .train 402854 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的记忆|r]|cRXP_WARN_进行训练|r|T136160:0|t[共享痛苦]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 虚空瘟疫 - 5(杜隆塔尔)
#displayname Void Plague

step
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step
    .train 425216,1
    >>击杀|cRXP_ENEMY_Sailors|r和|cRXP_ENEMY_Marines|r. 搜刮他们的尸体, 获取 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的记忆|r]
    .goto Durotar,57.6,55.4
    .collect 205940,1
    .mob Kul Tiras Sailor
    .mob Kul Tiras Marine
step
    .train 425216,1
    .goto Durotar,55.32,72.66
    .emote KNEEL,208309
    .aura 417316 >>在|cRXP_PICK_Loa 祭坛|r前跪下, 并与|cRXP_FRIENDLY_Serpent Loa|r交谈, 以获得 |T136077:0|t[冥想之灵] 增益效果
    .skipgossip 208307,1
    .target Serpent Loa
step
    .use 205940
    .itemcount 205940,1
    .train 425216 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_黑暗目的的记忆|r]|cRXP_WARN_来训练|r|T237514:0|t[虚空瘟疫]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 虚空瘟疫 - 6(提瑞斯法林地)
#displayname Void Plague

step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 425216,1
    >>击杀|cRXP_ENEMY_Gillgar|r. 击败他后搜刮出物品:|T136222:0|t[|cRXP_FRIENDLY_黑暗意图的记忆|r]
    .goto Tirisfal Glades,25.6,48.2
    .collect 205940,1
    .mob Gillgar
step << Undead
    .train 425216,1
    .goto Tirisfal Glades,56.39,49.39
    .aura 418459 >>在墓地跪拜, 直到获得增益效果 |T237569:0|t[亡灵冥想]
step << Troll
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Troll
    .train 402854,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .aura 417316 >>在|cRXP_PICK_Loa 祭坛|r前跪下, 并与|cRXP_FRIENDLY_Serpent Loa|r交谈, 以获得 |T136077:0|t[冥想之灵] 增益效果
    .skipgossip 208307,1
step
    .use 205940
    .itemcount 205940,1
    .train 425216 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_黑暗目的的记忆|r]|cRXP_WARN_来训练|r|T237514:0|t[虚空瘟疫]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 愈合祷言 - 6(杜隆塔尔)
#displayname Prayer of Mending

step
    .goto Durotar,48.04,79.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔卡尔峭壁内的探险者灵魂|r交谈
    >>|cRXP_WARN_另一个玩家(牧师或萨满)需要点击传送门. 拾取|r|cRXP_FRIENDLY_冒险者之灵|r|cRXP_WARN_后, 使用|r|T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r]
    .collect 205944,1 --Reciprocal Epiphany (1)
    .target Adventurer's Spirit
    .skipgossip
    .train 402848,1
step
    .use 205944
    .itemcount 205944,1
    .train 402848 >>|cRXP_WARN_使用|r|T135791:0|t[|cRXP_FRIENDLY_相互顿悟|r]|cRXP_WARN_来训练|r|T135944:0|t[治疗祷言]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 愈合祷言 - 10(莫高雷)
#displayname Prayer of Mending

step
    .goto Mulgore,60.39,33.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冒险者之灵|r交谈(在通天峰矿井外)
    >>|cRXP_WARN_另一个玩家(牧师或萨满)需要点击传送门. 拾取|r|cRXP_FRIENDLY_冒险者之灵|r|cRXP_WARN_后, 使用|r|T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r]
    .collect 205944,1 --Reciprocal Epiphany (1)
    .target Adventurer's Spirit
    .skipgossip
    .train 402848,1
step
    .use 205944
    .itemcount 205944,1
    .train 402848 >>|cRXP_WARN_使用|r|T135791:0|t[|cRXP_FRIENDLY_相互顿悟|r]|cRXP_WARN_来训练|r|T135944:0|t[治疗祷言]
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 扭曲的信仰 - 10(洛克莫丹)
#displayname Twisted Faith

step << Priest
    #completewith MinerGear
    .goto Loch Modan,35.50,18.97,20 >>进入银溪矿井
    .train 425215,1
step << Priest
    .goto Loch Modan,35.6,20.6
    >>击杀|cRXP_ENEMY_Tunnel Rats|r. 击杀它们以获取 |T237281:0|t[|cRXP_LOOT_Offering Coin|r]
    .collect 208823,1 -- Offering Coin (1)
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Geomancer
    .train 425215,1
step << Priest
    .goto Loch Modan,36.689,20.964
    .use 208823 >>|cRXP_WARN_使用|r|T237281:0|t[|cRXP_LOOT_献祭币|r]|cRXP_WARN_在银溪矿井内的井中|r|cRXP_WARN_获得|r|T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r]
    .collect 205905,1 -- Memory of a Devout Champion (1)
    .train 425215,1
step << Priest
    .train 425215 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的记忆|r]|cRXP_WARN_来训练|r|T237566:0|t[扭曲的信仰]
    >>|cRXP_WARN_你必须在神圣区域(例如北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区)输入 /kneel, 才能获得|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buff|r
    .use 205905
    .itemcount 205905,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 扭曲的信仰 - 14(西部荒野)
#displayname Twisted Faith

step << Priest
    .goto Westfall,32.6,43.2,60,0
    .goto Westfall,29.8,46.6,60,0
    .goto Westfall,45.0,26.0,60,0
    .goto Westfall,45.6,21.2
    >>击杀|cRXP_ENEMY_Undying Laborer|r. 击败后拾取其掉落的 |T136222:0|t[|cRXP_FRIENDLY_Memory of a Devout Champion|r]
    >>|cRXP_WARN_你必须使用一个神圣法术才能终结|r|cRXP_ENEMY_Undying Laborer|r
    >>|cRXP_WARN_|cRXP_ENEMY_Undying Laborer|r可以在黄金海岸采石场和詹戈洛德矿洞生成|r
    .collect 205905,1 -- Memory of a Devout Champion (1)
    .unitscan Undying Laborer
    .train 425215,1
step << Priest
    .train 425215 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的记忆|r]|cRXP_WARN_来训练|r|T237566:0|t[扭曲的信仰]
    >>|cRXP_WARN_你必须在神圣区域(例如北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区)输入 /kneel, 才能获得|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buff|r
    .use 205905
    .itemcount 205905,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 扭曲的信仰 - 18 (黑海岸)
#displayname Twisted Faith

step << Priest
    .goto Darkshore,59.2,23.4,60,0
    .goto Darkshore,60.0,15.4
    >>击杀|cRXP_ENEMY_雷鳞侍从|r和|cRXP_ENEMY_雷鳞战士|r和|cRXP_ENEMY_雷鳞法师|r. 击败后可掠夺获得 |T236364:0|t[|cRXP_LOOT_断矛献礼|r]
    .collect 211482,1 -- Shatterspear Offering (1)
    .mob Stormscale Myrmidon
    .mob Stormscale Warrior
    .mob Stormscale Sorceress
    .train 425215,1
step << Priest
    .goto Darkshore,59.2,22.6
    .use 211482 >>|cRXP_WARN_使用|r|T236364:0|t[|cRXP_LOOT_碎矛祭品|r]|cRXP_WARN_在水下的碎矛圣坛处使用, 以获得|r|T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r]
    .collect 205905,1 -- Memory of a Devout Champion (1)
    .train 425215,1
step << Priest
    .train 425215 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的记忆|r]|cRXP_WARN_来训练|r|T237566:0|t[扭曲的信仰]
    >>|cRXP_WARN_你必须在神圣区域(例如北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区)输入 /kneel, 才能获得|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buff|r
    .use 205905
    .itemcount 205905,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 共感之痛 - 10 (丹莫洛)
#displayname Shared Pain

step << Priest
    .goto Loch Modan,77.894,62.236
    >>击杀楼下建筑内的|cRXP_ENEMY_贝尔德队长|r. 从他身上搜刮出|T136222:0|t[|cRXP_FRIENDLY_被囚禁救世主的记忆|r]
    .collect 205945,1 -- Memory of an Imprisoned Savior (1)
    .mob Captain Beld
    .train 402854,1
step << Priest
    .train 402854 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的记忆|r]|cRXP_WARN_进行训练|r|T136160:0|t[共享痛苦]
    >>|cRXP_WARN_你必须在神圣区域(例如北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区)输入 /kneel, 才能获得|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buff|r
    .use 205945
    .itemcount 205945,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 共感之痛 - 6(艾尔文森林)
#displayname Shared Pain

step << Priest
    .goto Elwynn Forest,40.6,81.8
    >>击杀|r|cRXP_ENEMY_狗头人矿工|r. 掠夺他们以获取|r|T136222:0|t[|cRXP_FRIENDLY_被囚禁救世主的记忆|r]
    .collect 205945,1 -- Memory of an Imprisoned Savior (1)
    .mob Kobold Miner
    .train 402854,1
step << Priest
    .train 402854 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的记忆|r]|cRXP_WARN_进行训练|r|T136160:0|t[共享痛苦]
    >>|cRXP_WARN_你必须在神圣区域(例如北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区)输入 /kneel, 才能获得|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buff|r
    .use 205945
    .itemcount 205945,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 人造人—8(丹莫洛)
#displayname Homunculi

step << Priest
    .goto Dun Morogh,42.0,44.6,50,0
    .goto Dun Morogh,42.4,35.8
    >>击杀|r|cRXP_ENEMY_霜鬃先知|r. 击败他们后可获得物品:|T135975:0|t[|cRXP_FRIENDLY_亵渎要塞的预言|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob Frostmane Seer
    .train 402852,1
step << Priest
    .train 402852 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r]|cRXP_WARN_来训练|r|T237570:0|t[傀儡]
    >>|cRXP_WARN_你必须在神圣区域(例如北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区)输入 /kneel, 才能获得2|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buffs|r
    .use 205947
    .itemcount 205947,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 人造人 - 8 (艾尔文森林)
#displayname Homunculi

step << Priest
    .goto Elwynn Forest,74.0,51.8
    >>击杀|cRXP_ENEMY_迪菲亚流浪巫师|r. 掠夺他们以获得 |T135975:0|t[|cRXP_FRIENDLY_被亵渎要塞的预言|r ]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob Defias Rogue Wizard
    .train 402852,1
step << Priest
    .train 402852 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r]|cRXP_WARN_来训练|r|T237570:0|t[傀儡]
    >>|cRXP_WARN_你必须在神圣区域(例如北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区)输入 /kneel, 才能获得2|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buffs|r
    .use 205947
    .itemcount 205947,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 人造人 - 8 (泰达希尔)
#displayname Homunculi

step << Priest
    #completewith next
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >>前往费尔石
    .train 402852,1
step << Priest
    .goto Teldrassil,77.86,61.66
    >>击杀|cRXP_ENEMY_邪恶劣魔|r和|cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_影魂劣魔|r. 击败它们后可获得 |T135975:0|t[|cRXP_FRIENDLY_亵渎要塞的预言|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob Vicious Grell
    .mob Rascal Sprite
    .mob Shadow Sprite
    .train 402852,1
step << Priest
    .train 402852 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r]|cRXP_WARN_来训练|r|T237570:0|t[傀儡]
    >>|cRXP_WARN_你必须在神圣地点(例如月亮井和北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘守卫)输入 /kneel, 才能获得 2|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buffs|r
    .use 205947
    .itemcount 205947,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 愈合祷言 - 6(艾尔文森林)
#displayname Prayer of Mending

step << Priest
    .goto Elwynn Forest,52.28,84.56
    >>|cRXP_WARN_加入一个由另一位牧师或圣骑士守护在|cRXP_FRIENDLY_Adventurer's Remains|r附近的队伍, 或在通用聊天频道中寻找牧师或圣骑士的帮助(在聊天框中输入 /1)|r
    >>|cRXP_WARN_与地面上的|cRXP_FRIENDLY_冒险者遗骸|r交谈以开始仪式, 或点击其他玩家的|r|T136223:0|t[灵魂仪式]|cRXP_WARN_(处于其队伍中时)|r
    >>|cRXP_WARN_An|cRXP_FRIENDLY_冒险者之灵|r将在完成仪式后出现并消失. 击杀它以获取|r|T135791:0|t[|cRXP_FRIENDLY_相互启示|r]
    .train 402848 >>|cRXP_WARN_使用|r|T135791:0|t[|cRXP_FRIENDLY_相互顿悟|r]|cRXP_WARN_来学习|r|T135944:0|t[治疗祷言]
    .use 205942
    .use 205944
    .skipgossip
    .target Adventurer's Remains
    .target Adventurer's Spirit
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 愈合祷言 - 8(泰达希尔)
#displayname Prayer of Mending

step << Priest
    .goto Teldrassil,33.610,35.732
    >>|cRXP_WARN_加入一个由另一位牧师或德鲁伊守护在|cRXP_FRIENDLY_Adventurer's Remains|r附近的队伍, 或者在普通聊天频道中寻找牧师或德鲁伊的帮助(输入 /1 进入聊天)|r
    >>|cRXP_WARN_与地面上的|cRXP_FRIENDLY_冒险者遗骸|r交谈以开始仪式, 或点击其他玩家的|r|T136223:0|t[灵魂仪式]|cRXP_WARN_(处于其队伍中时)|r
    >>|cRXP_WARN_An|cRXP_FRIENDLY_冒险者之灵|r将在完成仪式后出现并消失. 击杀它以获取|r|T135791:0|t[|cRXP_FRIENDLY_相互启示|r]
    .train 402848 >>|cRXP_WARN_使用|r|T135791:0|t[|cRXP_FRIENDLY_相互顿悟|r]|cRXP_WARN_来学习|r|T135944:0|t[治疗祷言]
    .use 205942
    .use 205944
    .skipgossip
    .target Adventurer's Remains
    .target Adventurer's Spirit
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 愈合祷言 - 6(丹莫洛)
#displayname Prayer of Mending

step << Priest
    .goto Dun Morogh,43.0,49.6
    >>|cRXP_WARN_加入一个由另一位牧师或圣骑士守护在|cRXP_FRIENDLY_Adventurer's Remains|r附近的队伍, 或在通用聊天频道中寻找牧师或圣骑士的帮助(在聊天框中输入 /1)|r
    >>|cRXP_WARN_与地面上的|cRXP_FRIENDLY_冒险者遗骸|r交谈以开始仪式, 或点击其他玩家的|r|T136223:0|t[灵魂仪式]|cRXP_WARN_(处于其队伍中时)|r
    >>|cRXP_WARN_An|cRXP_FRIENDLY_冒险者之灵|r将在完成仪式后出现并消失. 击杀它以获取|r|T135791:0|t[|cRXP_FRIENDLY_相互启示|r]
    .train 402848 >>|cRXP_WARN_使用|r|T135791:0|t[|cRXP_FRIENDLY_相互顿悟|r]|cRXP_WARN_来学习|r|T135944:0|t[治疗祷言]
    .use 205942
    .use 205944
    .skipgossip
    .target Adventurer's Remains
    .target Adventurer's Spirit
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 暗言术:灭 - 10(黑海岸)
#displayname Shadow Word: Death

step << Priest
    .goto Darkshore,30.5,47.5
    >>点击小岛上的|cRXP_PICK_Remnant|r, 拾取它获得 |T135975:0|t[|cRXP_FRIENDLY_国王陨落的预言|r]
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .train 402849,1
step << Priest
    >>你现在必须获得两个 |T135934:0|t|T136057:0|t[冥想]效果
    >>你必须在以下地点之一内下跪:月亮井和北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区
    >>为了获得第二个 |T135934:0|t|T136057:0|t[冥想] 增益, 你需要在一位拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前 /kneel(下跪), 且该牧师必须在目标锁定你的情况下执行 /pray(祈祷)指令
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_增益效果, 使用|r|T135975:0|t[|cRXP_FRIENDLY_国王灭亡的预言]|r|cRXP_WARN_来学习|r|T136149:0|t[暗言术:灭]
    .use 205932
    .itemcount 205932,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 暗言术:死亡 - 12(洛克莫丹)
#displayname Shadow Word: Death

step << Priest
    #completewith next
    .goto Loch Modan,71.8,27.6
    .subzone 143 >>前往洛克莫丹的莫格罗什要塞
step << Priest
    #season 2
    .goto Loch Modan,71.8,27.6
    .aura 410935 >>|cRXP_WARN_瞄准|cRXP_FRIENDLY_Heretic Idol|r以自动下跪|r
    .emote KNEEL,208565 >>|cRXP_WARN_如果无效, 请在聊天框中输入 /kneel, 并确保目标为|cRXP_FRIENDLY_Heretic Idol|r|r
    >>|cRXP_WARN_您将获得|r|T135975:0|t[|cRXP_FRIENDLY_国王陨落的预言|r]
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .target Heretic Idol
step << Priest
    >>你现在必须获得两个 |T135934:0|t|T136057:0|t[冥想]效果
    >>你必须在以下地点之一内下跪:月亮井和北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区
    >>为了获得第二个 |T135934:0|t|T136057:0|t[冥想] 增益, 你需要在一位拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前 /kneel(下跪), 且该牧师必须在目标锁定你的情况下执行 /pray(祈祷)指令
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_增益效果, 使用|r|T135975:0|t[|cRXP_FRIENDLY_国王灭亡的预言]|r|cRXP_WARN_来学习|r|T136149:0|t[暗言术:灭]
    .use 205932
    .itemcount 205932,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 暗言术:灭 - 20(贫瘠之地)
#displayname Shadow Word: Death

step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    #loop
    .goto The Barrens,54.8,35.6,40,0
    .goto The Barrens,58.8,37.6,40,0
    >>对|cRXP_ENEMY_Desert Mirage|r使用 |T135894:0|t[驱散魔法], 击败它后可拾取 |T135975:0|t[|cRXP_FRIENDLY_国王灭亡的预言|r]
    *|cRXP_WARN_It's a green ghost which patrolls around. Use the RestedXP target macro to target it.|r
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .train 402849,1
    .mob Desert Mirage
step << Troll
    >>你现在必须获得两个 |T237569:0|t|T136077:0|t[冥想]效果
    >>你必须在祭坛前以下地点之一|r|cRXP_WARN_下跪|r, 然后与灵魂交谈:森金或十字路口|cRXP_WARN_(神龛位置已在你的地图上标记, 你也可以找到任何拥有该增益效果的牧师, 他们可以将这些位置复制给你)|r
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    >>要获得你的第二个 |T237569:0|t|T136077:0|t[冥想] 增益, 你需要在一名拥有 |T237569:0|t[亡灵冥想] 的亡灵牧师面前|cRXP_WARN_/跪下|r, 并且该牧师必须在瞄准你的情况下 /祈祷
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_增益效果, 使用|r|T135975:0|t[|cRXP_FRIENDLY_国王陨落的预言]|r|cRXP_WARN_来学习|r|T136149:0|t[暗言术:灭]
    .use 205932
    .itemcount 205932,1
step << Undead
    >>你现在必须获得两个 |T237569:0|t|T136077:0|t[冥想]效果
    >>你必须在祭坛前以下地点之一|r|cRXP_WARN_|/下跪|r, 然后与灵魂交谈:森金或十字路口
    .emote KNEEL,208309
    .goto The Barrens,51.5,29.5,0
    .goto The Barrens,50.7,32.7,0
    >>为了获得你的第二个 |T237569:0|t|T136077:0|t[冥想] 增益效果|cRXP_WARN_/kneel|r, 请前往墓地获取 |T237569:0|t[对亡灵的冥想] 增益效果|cRXP_WARN_(神龛和墓地已在你的地图上标记, 你也可以寻找任何拥有该增益效果的牧师, 他们能将此增益复制给你)|r
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_增益效果, 使用|r|T135975:0|t[|cRXP_FRIENDLY_国王陨落的预言]|r|cRXP_WARN_来学习|r|T136149:0|t[暗言术:灭]
    .use 205932
    .itemcount 205932,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 暗言术:灭 - 24(银松森林)
#displayname Shadow Word: Death

step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .goto Silverpine Forest,65.8,23.6
    >>拾取图勒·鸦爪(等级24精英)身后的|r卷轴|r, 以获得|T135975:0|t[|cRXP_FRIENDLY_国王的末日预言|r]
    *|cRXP_WARN_The scroll is one the second floor. It's easier in a group.|r
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .train 402849,1
step << Troll
    >>你现在必须获得两个 |T237569:0|t|T136077:0|t[冥想]效果
    >>你必须在祭坛前以下地点之一|r|cRXP_WARN_下跪|r, 然后与灵魂交谈:森金或十字路口|cRXP_WARN_(神龛位置已在你的地图上标记, 你也可以找到任何拥有该增益效果的牧师, 他们可以将这些位置复制给你)|r
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    >>要获得你的第二个 |T237569:0|t|T136077:0|t[冥想] 增益, 你需要在一名拥有 |T237569:0|t[亡灵冥想] 的亡灵牧师面前|cRXP_WARN_/跪下|r, 并且该牧师必须在瞄准你的情况下 /祈祷
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_增益效果, 使用|r|T135975:0|t[|cRXP_FRIENDLY_国王陨落的预言]|r|cRXP_WARN_来学习|r|T136149:0|t[暗言术:灭]
    .use 205932
    .itemcount 205932,1
step << Undead
    >>你现在必须获得两个 |T237569:0|t|T136077:0|t[冥想]效果
    >>你必须在祭坛前以下地点之一|r|cRXP_WARN_|/下跪|r, 然后与灵魂交谈:森金或十字路口
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    .goto Silverpine Forest,44.2,42.7,0
    >>为了获得你的第二个 |T237569:0|t|T136077:0|t[冥想] 增益效果|cRXP_WARN_/kneel|r, 请前往墓地获取 |T237569:0|t[对亡灵的冥想] 增益效果|cRXP_WARN_(神龛和墓地已在你的地图上标记, 你也可以寻找任何拥有该增益效果的牧师, 他们能将此增益复制给你)|r
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_增益效果, 使用|r|T135975:0|t[|cRXP_FRIENDLY_国王陨落的预言]|r|cRXP_WARN_来学习|r|T136149:0|t[暗言术:灭]
    .use 205932
    .itemcount 205932,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 扭曲命运 - 10(银松森林)
#displayname Twisted Fate

step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .train 425215,1
    >>击杀|cRXP_ENEMY_Wailing Spirit|r. 击败后可拾取 |T136222:0|t[|cRXP_FRIENDLY_Memory of a Devout Champion]
    .goto Silverpine Forest,57.9,71.5
    .collect 205905,1
    .mob Wailing Spirit
step
    .train 425215 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的记忆]|cRXP_WARN_来训练|r|T237566:0|t[扭曲的命运]
    >>|cRXP_WARN_你必须拥有|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_buff, 方法是在|r|cRXP_PICK_Loa Shrine|r(位于杜隆塔尔或贫瘠之地)前输入|r/kneel|cRXP_WARN_, 或者在另一名牧师为你施放|r/pray|cRXP_WARN_时, 在他们面前跪下获得该增益效果|r << Troll
    >>|cRXP_WARN_你必须拥有|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_buff 效果, 方法是在墓地输入|r/kneel|cRXP_WARN_, 或是在另一位牧师为你施放|r/pray 时, 跪在他们面前并获得该增益效果|r << Undead
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    .goto Silverpine Forest,55.6,73.3 << Undead
    .use 205905
    .itemcount 205905,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 扭曲命运 - 10(贫瘠之地)
#displayname Twisted Fate

step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 425215,1
    >>击杀|cRXP_ENEMY_Razormanes|r. 击败他们后拾取 |T236248:0|t[|cRXP_FRIENDLY_援助之手]
    .goto The Barrens,54.6,25.6
    .collect 208765,1
    .mob Razormane Thornweaver
    .mob Razormane Hunter
    .mob Razormane Water Seeker
    .mob Razormane Defender
step
    .train 425215,1
    >>|cRXP_WARN_找到一名可复活的死亡玩家或宠物(使用 |T135955:0|t[复活术])以获得|r|T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的回忆]
    .collect 205905,1
step
    .train 425215 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的记忆]|cRXP_WARN_来训练|r|T237566:0|t[扭曲的命运]
    >>|cRXP_WARN_你必须拥有|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_buff, 方法是在|r|cRXP_PICK_Loa Shrine|r(位于杜隆塔尔或贫瘠之地)前输入|r/kneel|cRXP_WARN_, 或者在另一名牧师为你施放|r/pray|cRXP_WARN_时, 在他们面前跪下获得该增益效果|r << Troll
    >>|cRXP_WARN_你必须拥有|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_buff 效果, 方法是在墓地输入|r/kneel|cRXP_WARN_, 或是在另一位牧师为你施放|r/pray 时, 跪在他们面前并获得该增益效果|r << Undead
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    .goto The Barrens,50.7,32.8 << Undead
    .use 205905
    .itemcount 205905,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 虚空瘟疫 - 6(艾尔文森林)
#displayname Void Plague

step << Priest
    #season 2
    #completewith next
    .goto Elwynn Forest,38.34,81.54,20 >>进入法戈迪普矿坑
    .train 425216,1
step << Priest
    #season 2
    .goto Elwynn Forest,41.7,78.1
    >>击杀|cRXP_ENEMY_金牙|r. 击败他后搜刮出|T136222:0|t[|cRXP_FRIENDLY_暗黑目的的记忆|r ]
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .mob Goldtooth
    .train 425216,1
step << Priest
    #season 2
    .train 425216 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_黑暗目的的记忆|r]|cRXP_WARN_来训练|r|T237514:0|t[虚空瘟疫]
    .use 205940
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 虚空瘟疫 - 6 (丹莫洛)
#displayname Void Plague


step << Priest
    #season 2
    .goto Dun Morogh,27.2,43.0,60,0
    .goto Dun Morogh,24.8,39.3,60,0
    .goto Dun Morogh,25.6,43.4,60,0
    .goto Dun Morogh,24.3,44.0,60,0
    .goto Dun Morogh,25.4,45.4,60,0
    .goto Dun Morogh,25.00,43.50
    >>击杀|r|cRXP_ENEMY_麻疯侏儒|r. 击败他们后搜刮, 获得|r|cRXP_FRIENDLY_黑暗意图的记忆|r
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .mob Leper Gnome
    .train 425216,1
step << Priest
    #season 2
    .train 425216 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_黑暗目的的记忆|r]|cRXP_WARN_来训练|r|T237514:0|t[虚空瘟疫]
    .use 205940
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 赋能再生 - 27(千针石林)
#displayname Empowered Renew


-- Empowered Renew

step
    .train 425309,1
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
step
    .train 425309,1
    .goto Thousand Needles,31.33,37.05,10,0
    .goto Thousand Needles,33.17,35.38,15,0
    .goto Thousand Needles,31.96,31.32,15,0
    .goto Thousand Needles,33.04,27.61,30,0
    .goto Thousand Needles,35.20,31.09,30,0
    .goto Thousand Needles,34.17,38.81
    >>击杀恐怖图腾地卜师和恐怖图腾强盗和恐怖图腾抢夺者和恐怖图腾践踏者. 击败他们后可获得 |T135975:0|t[|cRXP_LOOT_预言之速径|r]
    .collect 213140,1
    .mob Grimtotem Geomancer
    .mob Grimtotem Bandit
    .mob Grimtotem Reaver
    .mob Grimtotem Stomper
step
    .train 425309 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_LOOT_加速之路的预言|r]|cRXP_WARN_进行训练|r|T236254:0|t[强化恢复]
    .use 213140
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 强化治疗 - 33(奥特兰克山脉)
#displayname Empowered Renew

-- Empowered Renew

step
    .train 425309,1
    .zone Alterac Mountains >>前往: |cRXP_PICK_奥特兰克山脉|r
step
    .train 425309,1
    #loop
    .goto Alterac Mountains,47.48,58.94,0
    .goto Alterac Mountains,51.73,40.23,70,0
    .goto Alterac Mountains,45.19,33.91,70,0
    .goto Alterac Mountains,51.46,53.84,70,0
    .goto Alterac Mountains,48.54,40.72,70,0
    >>击杀|cRXP_ENEMY_破碎岭食人魔|r 和|cRXP_ENEMY_破碎岭蛮兵|r. 从他们身上搜刮出 |T135975:0|t[|cRXP_LOOT_快速之路的预言|r ]
    .collect 213140,1
    .mob Crushridge Ogre
    .mob Crushridge Brute
step
    .train 425309 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_LOOT_加速之路的预言|r]|cRXP_WARN_进行训练|r|T236254:0|t[强化恢复]
    .use 213140
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 重燃希望 - 31(荒芜之地)
#displayname Renewed Hope

-- Renewed Hope

step
    #optional
    .train 425310,1
    .train 605 >>|cRXP_WARN_你必须已掌握|r |T136206:0|t[心灵控制] |cRXP_WARN_技能, 才能获得|r |T135923:0|t[重获希望] |cRXP_WARN_符文|r
step
    #optional
    .train 425310,1
    .xp 31
    >>|cRXP_WARN_你必须至少达到31级, 才能对之后出现的33级敌对目标[滑刃海潮女祭司]施放|r|T136206:0|t[心灵控制]|r
step
    .train 425310,1
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    #loop
    .goto Desolace,35.4,29.6,60,0
    .goto Desolace,33.6,15,0,60,0
    .goto Desolace,40.0,17.4,60,0
    .goto Desolace,38.6,23.6,60,0
    .train 425310,1
    >>击杀|cRXP_ENEMY_滑刃纳迦|r. 击败后可掠夺获得 |T136222:0|t[|cRXP_LOOT_不安之视|r]
    .collect 213599,1
    .mob Slitherblade Naga
    .mob Slitherblade Warrior
    .mob Slitherblade Oracle
    .mob Slitherblade Myrmidon
    .mob Slitherblade Sea Witch
    .mob Slitherblade Tide Priestess
step -- step shows for players that are only level 31
    #optional
    #completewith next
    +|cRXP_WARN_注意:你只能对等级为33级的|r|T136206:0|t[心灵控制] |cRXP_ENEMY_滑刃海潮女祭司|r施放, 对34级的目标施放将失败|r
    .xp >32,1
    .xp <31,1
    .train 425310,1
step
    #label MCPriestess
    #loop
    .goto Desolace,38.8,24.0,60,0
    .goto Desolace,34.6,30.0,60,0
    .goto Desolace,34.6,20.2,60,0
    .aura 435117 >>|cRXP_WARN_|cRXP_WARN_请选中|r |cRXP_ENEMY_滑刃海潮女祭司|r并使用|r|T136206:0|t[心灵控制]|r
    >>|cRXP_WARN_当它处于|r|T136206:0|t[心灵控制]|cRXP_WARN_效果影响下时, 以你自己为目标, 并从宠物动作栏中施放|r|T136077:0|t[深渊冥想]|r
    >>|cRXP_WARN_按 Esc 键取消|r|T136206:0|t[心灵控制]|cRXP_WARN_后击杀|r|cRXP_ENEMY_滑刃海潮女祭司|r
    .mob Slitherblade Tide Priestess
    .train 425310,1
step
    .train 425310 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_LOOT_令人不安的幻象|r]|cRXP_WARN_进行训练|r|T135923:0|t[重燃希望]
    .use 213599
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#name 分散 40(荆棘谷)
#displayname Dispersion

-- Dispersion

step
    .train 425314,1
    >>|cRXP_WARN_在荆棘谷找到一名拥有|r|T132299:0|t[隐秘大师]|cRXP_WARN_符文和|r|T338666:0|t[贾尼的护身符]|cRXP_WARN_饰品的潜行者, 使用|r|T133644:0|t[扒窃]|cRXP_WARN_对任意一名|r|cRXP_ENEMY_血头皮巨魔|r进行偷窃, 以获得|r|T237446:0|t[神秘的巨魔卷轴]|cRXP_WARN_. 随后, 一名法师必须使用|r|T135933:0|t[理解之魅惑]|cRXP_WARN_来破译它, 使其变成|r|T134938:0|t[|cRXP_LOOT_已破译的巨魔卷轴|r]|r
    >>|cRXP_WARN_或者从拍卖行购买|r|T237446:0|t[神秘的巨魔卷轴]|r|cRXP_WARN_, 让法师解密；或者直接购买已|r|T134938:0|t[|cRXP_LOOT_解密的巨魔卷轴]|r|r
    .use 216880 >>|cRXP_WARN_使用 |T134938:0|t[|cRXP_LOOT_Deciphered Troll Scroll|r] 开始任务|r
    >>|cRXP_WARN_你也可以找一位牧师与你共享任务|r
    .collect 216880,1
    .disablecheckbox
    .accept 79731 >>接任务: |cRXP_WARN_巨魔卷轴|r
step
    .train 425314,1
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    >>|cRXP_WARN_确保在前往那里之前已激活2个「冥想」效果 |T135934:0|t|T136057:0|t|r|cRXP_WARN_buffs|r
step
    .train 425314,1
    .goto Stranglethorn Vale,28.961,61.931
    >>点击|cRXP_PICK_圣泉|r. 拾取它以获得 |T134712:0|t[|cRXP_LOOT_圣泉之水|r]
    >>|cRXP_WARN_你可能需要击杀守卫在|r|cRXP_PICK_圣泉|r前的|r|cRXP_ENEMY_萨克拉希斯|r(等级45稀有)|r
    .collect 737,1 --Holy Spring Water
    .mob Lord Sakrasis
step
    #completewith next
    .subzone 102 >>前往祖尔库拉废墟
step
    .train 425314,1
    .goto Stranglethorn Vale,23.569,7.955
    .cast 3591 >>|cRXP_WARN_使用|r|T134712:0|t[|cRXP_LOOT_圣泉之水|r]|cRXP_WARN_ 在小喷泉处|r
    >>|cRXP_WARN_你可能需要击杀|cRXP_ENEMY_Gan'zulah|r(等级41)以及他周围的若干|cRXP_ENEMY_巨魔|r, 才能抵达小喷泉|r
    .use 737
    .mob Gan'zulah
step
    .train 425314,1
    .goto Stranglethorn Vale,23.569,7.955
    >>点击出现的|cRXP_PICK_Fount|r, 拾取它以获得 |T135975:0|t|cRXP_LOOT_[被囚禁恶念的预言]|r
    .collect 213142,1
step
    .train 425314 >>|cRXP_WARN_使用|r|T135975:0|t|cRXP_LOOT_[被囚禁的恶意预言]|r|cRXP_WARN_来训练|r|T237563:0|t[分散]
    .use 213142
step
    .isQuestComplete 79731
    .goto Stranglethorn Vale,35.658,10.808
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫米特·奈辛瓦里|r交谈
    .turnin 79731 >>交任务: |cRXP_FRIENDLY_巨魔卷轴|r
    .target Hemet Nesingwary
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#name 压制 - 32 (艾泽拉斯)
#displayname Pain Suppression

-- Pain Suppression

step
    .train 402855,1
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 402855,1
    .goto 1415,47.44,19.75,10,0
    .goto 1415,47.45,19.69,5,0
    .goto 1415,47.62,19.59,10,0
    .goto 1415,47.73,19.39,5 >>进入血色修道院地下城:墓地
step
    >>点击无头骑士刷新点附近的 |cRXP_PICK_Tombstone|r, 以收集 |cRXP_LOOT_|T136222:0|t[墓地回声]|r |cRXP_WARN_强烈建议组队5人完成此步骤. |r
    .link https://imgur.com/a/lqRc0i6 >>|cRXP_WARN_点击此处查看图片参考|r
    .collect 215426,1
step
    #optional
    .train 402855,1
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    .train 402855,1
    .goto Arathi Highlands,62.1,54.5
    >>点击|cRXP_PICK_Grave|r以收集戈谢克农场(靠近最大建筑物)的|cRXP_LOOT_|T136222:0|t[阿拉希回声]|r
    .collect 215427,1
step
    .train 402855,1
    .zone Dustwallow Marsh >>前往: |cRXP_PICK_尘泥沼泽|r
step
    .train 402855,1
    .goto Dustwallow Marsh,63.7,42.3
    >>点击|cRXP_PICK_Tombstone|r以收集位于联盟墓地附近的|cRXP_LOOT_|T136222:0|t[塞拉摩回声]|r
    .collect 215428,1
step
    .train 402855,1
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
step
    .train 402855,1
    .goto Swamp of Sorrows,16.7,53.8
    >>点击|cRXP_PICK_Grave|r以收集位于湖边树旁的|cRXP_LOOT_|T136222:0|t[沼泽回声]|r
    .collect 215425,1
step
    .train 402855,1
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 402855,1
    .goto 1415,47.44,19.75,10,0
    .goto 1415,47.45,19.69,5,0
    .goto 1415,47.62,19.59,10 >>进入血色修道院地下城:图书馆|cRXP_WARN_强烈建议组队5人以继续下一步. |r
step
    .train 402855,1
    .cast 437054 >>在战士雕像前使用|T136222:0|t[沼泽回声]
    .use 215425
step
    .train 402855,1
    .cast 437053 >>在法师雕像前使用|T136222:0|t[阿拉希回响]
    .use 215428
step
    .train 402855,1
    .cast 436952 >>在圣骑士雕像前使用|T136222:0|t[塞拉摩回声]
    .use 215425
step
    .train 402855,1
    .cast 437055 >>在牧师雕像前使用|T136222:0|t[墓地回声]
    .use 215426
step
    .train 402855 >>点击房间中央的橙色残片以接收 |T135791:0|t|cRXP_FRIENDLY_[伪经顿悟]|r, 使用它来学习 |T135936:0|t[疼痛抑制]
    .use 213143
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup 头盔
#name 虚空之眼 - 50(艾泽拉斯)
#displayname 虚空之眼 - 50(艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

--x shiek: needs better coordinates and travelsteps
step
    #completewith next
    .zone The Hinterlands >>前往: |cRXP_PICK_辛特兰|r
    .train 402864,1
step
    .goto The Hinterlands,58.4,72.7
    >>点击|cRXP_PICK_|T236407:0|t闪光之眼|r
    .collect 223334,1 --1/1 Glowing Eye
    .train 402864,1
step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
    .train 402864,1
step
    .goto Blasted Lands,43.8,45.8
    >>点击|cRXP_PICK_|T236407:0|t跳动的眼球|r
    .collect 223331,1 --1/1 Pulsating Eye
    .train 402864,1
step
    #completewith next
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
    .train 402864,1
step
    .goto Searing Gorge,43.8,45.8
    >>点击|cRXP_PICK_|T236407:0|t震动之眼|r
    .collect 223332,1 --1/1 Vibrating Eye
    .train 402864,1
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    .train 402864,1
step
    .goto Stranglethorn Vale,33,88
    >>点击|cRXP_PICK_|T236407:0|t邪眼|r
    .collect 223333,1 --1/1 Baleful Eye
    .train 402864,1
step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
    .train 402864,1
step
    .goto Feralas,57.2,68.7
    >>点击|cRXP_PICK_|T236407:0|t燃烧之眼|r
    .collect 223337,1 --1/1 Burning Eye
    .train 402864,1
step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
    .train 402864,1
step
    .goto Tanaris,56.4,73.7
    >>点击|cRXP_PICK_|T236407:0|t溢出的眼球|r
    .collect 223335,1 --1/1 Oozing Eye
    .train 402864,1
step
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
    .train 410013,1
step
    .goto Felwood,36.5,55.7
    >>点击|cRXP_PICK_|T236407:0|t穿孔之眼|r
    .collect 223336,1 --1/1 Piercing Eye
    .train 402864,1
step
    #completewith next
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
    .train 402864,1
step
    .goto Azshara,89.8,33.6
    >>目标|cRXP_FRIENDLY_守望者祭坛|r
    .emote KNEEL,223590
    .accept 82316,1 >>接受任务:七眼我寻求……
    .target Shrine of the Watcher
    .train 402864,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Surge of Light
#name 光之涌动 - 40(塔纳利斯)

-- Surge of Light

step
    #completewith RuneLearned
    +|cRXP_WARN_你可能只能在塔纳利斯的晚上9点至早上6点之间获得|r|T135981:0|t[光之涌动]|cRXP_WARN_符文|r
    +当你想在这个时间段之外获取符文时, 可以前往荆棘谷查看
    .train 431669,1
step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
    .train 431669,1
step
    .train 431669,1
    >>击杀|cRXP_ENEMY_失落的灵魂|r (拥有圣洁或奥术法术/法杖的敌人). 击败后拾取, 获得 |T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r ]
    .collect 221981,1
    .goto Tanaris,52,29
    .mob Echo of a Lost Soul
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_You need TWO meditation buffs: Look for a priest with multiple buffs, /kneel before him, wait for him to /pray for you.|r
    .train 431669 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r]|cRXP_WARN_来训练|r|T135981:0|t[光之涌动]
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Surge of Light
#name 光之涌动 - 40(悲苦沼泽)

-- Surge of Light

step
    #completewith RuneLearned
    +|cRXP_WARN_你只能在晚上9点至早上6点间于诅咒之地的悲伤沼泽中获得|r|T135981:0|t[光之涌动]|cRXP_WARN_rune|r
    +当你想在这个时间段之外获取符文时, 可以前往荆棘谷查看
    .train 431669,1
step
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
    .train 431669,1
step
    .train 431669,1
    >>击杀|cRXP_ENEMY_失落的灵魂|r (拥有圣洁或奥术法术/法杖的敌人). 击败后拾取, 获得 |T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r ]
    .collect 221981,1
    .goto Swamp of Sorrows,50,60
    .mob Echo of a Lost Soul
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_You need TWO meditation buffs: Look for a priest with multiple buffs, /kneel before him, wait for him to /pray for you.|r
    .train 431669 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r]|cRXP_WARN_来训练|r|T135981:0|t[光之涌动]
]])


RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Surge of Light
#name 光之涌动 - 40(荒野地带)

-- Surge of Light

step
    #completewith RuneLearned
    +|cRXP_WARN_你只能在晚上9点至早上6点间, 在荒野地区获得|r|T135981:0|t[光之涌动]|cRXP_WARN_rune|r
    +当你想在这个时间段之外获取符文时, 可以前往荆棘谷查看
    .train 431669,1
step
    #completewith next
    .zone The Hinterlands>>前往: |cRXP_PICK_辛特兰|r
    .train 431669,1
step
    .train 431669,1
    >>击杀|cRXP_ENEMY_失落的灵魂|r (拥有圣洁或奥术法术/法杖的敌人). 击败后拾取, 获得 |T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r ]
    .collect 221981,1
    .goto The Hinterlands,73,68
    .mob Echo of a Lost Soul
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_You need TWO meditation buffs: Look for a priest with multiple buffs, /kneel before him, wait for him to /pray for you.|r
    .train 431669 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r]|cRXP_WARN_来训练|r|T135981:0|t[光之涌动]
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Surge of Light
#name 圣光涌动 - 40 (荆棘谷) 2

-- Surge of Light

step
    #completewith RuneLearned
    +|cRXP_WARN_灵魂只有在血月事件后才会出现. 你也可以关闭该事件, 直接前往指定路点位置|r
    .train 431669,1
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    .train 431669,1
step
    .train 431669,1
    >>击杀|cRXP_ENEMY_失落的灵魂|r (拥有圣洁或奥术法术/法杖的敌人). 击败后拾取, 获得 |T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r ]
    .collect 221981,1
    .goto Stranglethorn Vale,40.0,58.0
    .mob Echo of a Lost Soul
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_You need TWO meditation buffs: Look for a priest with multiple buffs, /kneel before him, wait for him to /pray for you.|r
    .train 431669 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r]|cRXP_WARN_来训练|r|T135981:0|t[光之涌动]
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Surge of Light
#name 光之涌动 - 40 (荆棘谷) 1

-- Surge of Light

step
    #completewith RuneLearned
    +|cRXP_WARN_你只能在晚上9点至早上6点之间获得|r|T135981:0|t[光之涌动]|cRXP_WARN_rune|r
    +当你想在这个时间段之外获取符文时, 可以前往荆棘谷2查看
    .train 431669,1
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    .train 431669,1
step
    .train 431669,1
    >>击杀|cRXP_ENEMY_失落的灵魂|r (拥有圣洁或奥术法术/法杖的敌人). 击败后拾取, 获得 |T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r ]
    .collect 221981,1
    .goto Stranglethorn Vale,30.0,73.0
    .mob Echo of a Lost Soul
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_You need TWO meditation buffs: Look for a priest with multiple buffs, /kneel before him, wait for him to /pray for you.|r
    .train 431669 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r]|cRXP_WARN_来训练|r|T135981:0|t[光之涌动]
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Binding Heal
#name 束缚治疗 - 58(西和东瘟疫之地)
#next 牧师种族特长 - 60(艾泽拉斯)

step << Alliance
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Alliance
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂内的|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .accept 84320 >>接任务: |cRXP_WARN_失落的传家宝|r
    .target High Priestess Laurena
step << Horde
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step << Horde
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在精神谷与|cRXP_FRIENDLY_迪特里希·普莱斯|r交谈
    .accept 84405 >>接任务: |cRXP_WARN_失落的传家宝|r
    .target Dietrich Praice
step
    #completewith next
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    .goto Western Plaguelands,51.9,82.4,50 >>前往悲伤岭旁的大墓穴
step
    .goto Western Plaguelands,54.8,81.2
    >>|cRXP_WARN_进入墓穴后向左走. 下楼, 在右侧小壁龛中寻找一个小型木箱. 打开它以获取|r|T133299:0|t[|cRXP_PICK_家族传家宝|r]
    .collect 227745,1 --Family Heirloom(1)
step
    .goto Western Plaguelands,53.8,80.2
    >>|cRXP_WARN_前往墓穴底部. 从右侧书架上拾取|r|T133741:0|t[|cRXP_PICK_家族记录|r]|cRXP_WARN_, 并从左侧桌面上拾取|r|T133735:0|t[|cRXP_PICK_幸存者日志|r]|r
    .collect 227747,1 --Family Records
    .collect 227748,1 --Survivor Journal
step << Alliance
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Alliance
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂内的|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 84320 >>交任务: |cRXP_FRIENDLY_失落的传家宝|r
    .accept 84321 >>接任务: |cRXP_WARN_圣光的圣物|r
    .target High Priestess Laurena
step << Horde
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step << Horde
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在精神谷与|cRXP_FRIENDLY_迪特里希·普莱斯|r交谈
    .turnin 84405 >>交任务: |cRXP_FRIENDLY_失落的传家宝|r
    .accept 84406 >>接任务: |cRXP_WARN_圣光的圣物|r
    .target Dietrich Praice
step
    #completewith next
    >>|cRXP_WARN_下一个任务需要你从一个精英区域中获取一件物品. 虽然可以独自完成, 但如果你等级较低或装备不足, 建议找人协助|r
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    .goto Western Plaguelands,48.2,21.7,50 >>前往壁炉谷, |cRXP_WARN_请注意, 这是一个精英区域|r
step
    .goto Western Plaguelands,42.2,18.1
    >>|cRXP_WARN_进入壁炉谷的议政厅, 与讲台上的|r|cRXP_PICK_猩红账本|r|cRXP_WARN_互动. 注意, 该区域布满了精英怪物|r
    .turnin 84406 >>交任务: |cRXP_FRIENDLY_圣光的圣物|r << Horde
    .turnin 84321 >>交任务: |cRXP_FRIENDLY_圣光的圣物|r << Alliance
    .accept 84322 >>接任务: |cRXP_WARN_血色研究|r
step
    #completewith next
    >>|cRXP_WARN_下一个任务需要你从一个精英区域中获取一件物品. 虽然可以独自完成, 但如果你等级较低或装备不足, 建议找人协助|r
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step
    .goto Eastern Plaguelands,77.5,81.7,50 >>前往提尔之手, |cRXP_WARN_请记住, 这是一个精英区域|r
step
    .goto Eastern Plaguelands,83.6,78.2
    >>|cRXP_WARN_|r |T237537:0|t[神圣专精] 的符文也位于提尔之手, 如果你现在不想获取, 可以跳过此步骤|r 
    >>|cRXP_WARN_如果你想获得它, 请前往地图上标记的建筑物内的图书馆区域, 寻找放置在书架顶部的一本书, 拾取该书以获取符文. 请注意, 你不能在战斗状态下拾取它|r
    >>|cRXP_WARN_你可以选择清空房间内的所有怪物, 或者死亡在书旁, 并在怪物无法看到的位置释放, 从而拾取符文而无需击杀任何敌人|r
    .collect 226418,1 --Rune of Holy Specialization
    .train 453702,1
step
    #completewith next
    .train 453702 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神圣专精符文|r] 来训练 |T237537:0|t[神圣专精]
    .train 453702,1
    .itemcount 226418,1
step
    .goto Eastern Plaguelands,83.6,78.2
    >>|cRXP_WARN_进入钟楼, 前往顶层, 与那里的锁住的箱子互动|r
    .turnin 84322 >>交任务: |cRXP_FRIENDLY_血色研究|r
    .accept 84323 >>领取奖赏
step
    .goto Eastern Plaguelands,83.6,78.2
    >>击杀泰尔之手内的任意猩红教团成员, 击败后可掠夺获得 |T134245:0|t[|cRXP_LOOT_神器储物钥匙|r]
    >>|cRXP_WARN_你可以跳过刷钥匙的步骤, 直接找一个开锁技能达到175以上的盗贼, 因为他们也能帮你打开箱子. 如果你更愿意去找盗贼而不是刷钥匙, 这一步就可以跳过|r
    .collect 228912,1 --Artifact Storage Key
    .itemcount 132874,<1 --Skips if you get the Shard of Light without the key
step
    >>使用 |T134245:0|t[|cRXP_LOOT_神器储物钥匙|r] 解锁 |T133876:0|t[|cRXP_LOOT_谜题箱子|r], 或让一名盗贼用开锁技能为你打开. 开启后可获得 |T132874:0|t[|cRXP_LOOT_光明碎片|r]
    .collect 227938,1 --Shard of Light(1)
step << Alliance
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Alliance
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂内的|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 84323 >>交还《内在之奖》
    .target High Priestess Laurena
step << Horde
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step << Horde
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在精神谷与|cRXP_FRIENDLY_迪特里希·普莱斯|r交谈
    .turnin 84323 >>交还《内在之奖》
    .target Dietrich Praice
step
    .train 402853 >>使用 |T135791:0|t[|cRXP_FRIENDLY_欢欣启示|r] 来训练 |T135883:0|t[|cRXP_FRIENDLY_束缚治疗|r]
    .use 228123
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Vampiric Touch
#name 吸血鬼之触 - 60(恶魔坠落峡谷地下城)

step
    #completewith next
    >>符文 |T135978:0|t[|cRXP_FRIENDLY_Vampiric Touch|r] 会从《末日之潮》新增地下城“恶魔坠落峡谷”的最终Boss掉落
    .zone Felwood >>|cRXP_WARN_前往: |cRXP_PICK_费伍德森林|r|r
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    .goto Felwood,51.4,82.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影牙使者|r交谈
    .accept 84384 >>接任务: |cRXP_WARN_恶魔骗术|r
    .target Shadowtooth Emissary
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    #completewith next
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    .goto Winterspring,65.6,21.4
    >>在永望镇北方寻找|r|cRXP_ENEMY_狂暴枭兽|r. 击杀它们并从其身上获取|r|T237413:0|t[|cRXP_LOOT_枭兽松果腺|r]
    .complete 84384,1
    .mob Berserk Owlbeast
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    .goto Felwood,51.4,82.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影牙使者|r交谈
    .turnin 84384 >>交任务: |cRXP_FRIENDLY_恶魔骗术|r
    .target Shadowtooth Emissary
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    #completewith next
    +将 |T136232:0|t[|cRXP_FRIENDLY_Shadowtooth Illusion Ward|r] 装备在任意饰品栏位中. 你需要装备它才能进入地下城
    .use 228172
    .itemcount 228172,<1
step
    >>|cRXP_WARN_符文|r|T135978:0|t[|cRXP_FRIENDLY_ 亡灵之触|r]|cRXP_WARN_掉落自《暗影之境》新增地下城“恶魔坠落峡谷”的最终首领. 前往灰谷时, 开始组队吧|r
    >>如果你在飞行, 建议飞往艾萨拉的塔伦德里斯点, 而不是阿斯特兰纳, 那里更靠近地下城入口 << Alliance
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step
    .goto Ashenvale,84.5,75.0,50 >>前往恶魔坠落峡谷地下城入口
step
    >>清理地下城. |T135791:0|t[|cRXP_FRIENDLY_开胃佳肴启示|r] 会教你 |T135978:0|t[|cRXP_FRIENDLY_吸血之触|r], 该技能由地下城最终首领|cRXP_ENEMY_地狱咆哮的幻影|r掉落. |cRXP_WARN_请务必击杀他以获取符文！|r
    .collect 228126,1 --Apperitive Epiphany
    .mob Hellscream's Phantom
step
    .train 402857 >>使用 |T135791:0|t[|cRXP_FRIENDLY_Aperitive Epiphany|r] 来学习 |T135978:0|t[|cRXP_FRIENDLY_Vampiric Touch|r]
    .use 228126
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup 额外内容
#displayname Priest Racials
#name 牧师种族特长 - 60(艾泽拉斯)


step
    #completewith next
    >>|cRXP_WARN_额外的牧师能力是全服务器解锁的. 这意味着, 如果已有玩家在你的服务器上完成该任务, 你就可以跳过整个任务线, 直接前往卡拉赞学习新的种族技能. 如果尚未有人完成, 你可以参考以下指南, 成为为服务器解锁该能力的第一人！|r
    .zone Deadwind Pass >>前往: |cRXP_PICK_逆风小径|r
step
    .goto Deadwind Pass,40.8,78.4
    >>前往位于卡拉赞旁边的一座小神殿
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往卡拉赞附近的神龛处与|cRXP_FRIENDLY_Divine Apprehension|r交谈, 选择你想要的种族能力
    .target Divine Apprehension
step
    #completewith PreQStart
    +这是全服务器解锁额外牧师种族任务链的起点. |cRXP_WARN_您的服务器很可能已经完成此任务, 无需执行后续步骤. 仅当您想尝试该任务链或确定尚未解锁时, 请继续|r
step
    #completewith QStart
    +|cRXP_WARN_要开始此任务, 您需要先完成授予|r|T135883:0|t[|cRXP_FRIENDLY_绑定治疗|r]|cRXP_WARN_的任务线. 您可以在斗篷符文章节找到相关指南|r
    .train 402853,1
step
    #label PreQStart
    .goto Eastern Plaguelands,48.1,24.0
    >>|cRXP_WARN_要完成此任务链中的第一个任务, 你需要 4|r|T134855:0|t[|cRXP_LOOT_斯坦索姆圣水|r]|cRXP_WARN_以及可从拍卖行购买的其他材料. 寻找一个队伍去挑战斯坦索姆(亡灵)地下城|r
    >>|cRXP_WARN_进入后, 寻找并拾取散落在副本各处地面上的补给箱. 它们可能包含圣水, 也可能是诱饵, 会召唤出难以应对的敌人|r
    .collect 13180,4 --Stratholme Holy Water(4)
step << Alliance
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Alliance
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>从拍卖行购买 6 |T133682:0|t[|cRXP_LOOT_厚符文布绷带|r]和4 |T134834:0|t[|cRXP_LOOT_特效治疗药水|r] 和 8 |T132834:0|t[|cRXP_LOOT_巨大的卵|r]. 你需要这些物品, 连同你已收集的 |T134855:0|t[|cRXP_LOOT_斯坦索姆圣水|r], 来完成该任务链中的第一个任务
    .collect 14530,6 --Heavy runecloth bandage (6)
    .collect 13446,4 --Major Healing Potion (4)
    .collect 12207,8 --Giant Egg(8)
    .collect 13180,4 --Stratholme Holy Water(4)
    .target Auctioneer Jaxon
step << Alliance
    #label QStart
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂内的|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .accept 84324 >>接任务: |cRXP_WARN_外交手段|r
    .turnin 84324 >>交任务: |cRXP_FRIENDLY_外交手段|r
    .target High Priestess Laurena
step << Horde
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step << Horde
    .goto Orgrimmar,55.59,62.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thathung|r交谈
    >>从拍卖行购买 6 |T133682:0|t[|cRXP_LOOT_厚符文布绷带|r]和4 |T134834:0|t[|cRXP_LOOT_特效治疗药水|r] 和 8 |T132834:0|t[|cRXP_LOOT_巨大的卵|r]. 你需要这些物品, 连同你已收集的 |T134855:0|t[|cRXP_LOOT_斯坦索姆圣水|r], 来完成该任务链中的第一个任务
    .collect 14530,6 --Heavy runecloth bandage (6)
    .collect 13446,4 --Major Healing Potion (4)
    .collect 12207,8 --Giant Egg(8)
    .collect 13180,4 --Stratholme Holy Water(4)
    .target Thathung
step << Horde
    #label QStart
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在精神谷与|cRXP_FRIENDLY_迪特里希·普莱斯|r交谈
    .accept 84408 >>接任务: |cRXP_WARN_外交手段|r
    .turnin 84408 >>交任务: |cRXP_FRIENDLY_外交手段|r
    .target Dietrich Praice
step
    #completewith next
    >>|cRXP_WARN_在接下来的任务环节中, 你需要找到一位同样处于任务线上的敌对阵营牧师, 才能继续推进|r
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step
    .goto Eastern Plaguelands,47,58
    >>|cRXP_WARN_前往位于EPL的|r|cRXP_FRIENDLY_合作圣坛|r|cRXP_WARN_, 与敌对阵营的牧师互相攻击, 然后使用你完成上一个任务后获得的|r|T134918:0|t[|cRXP_FRIENDLY_利他者护盾|r]|cRXP_WARN_物品来互相治疗|r
    >>如果操作正确, |cRXP_FRIENDLY_Shrine of Cooperation|r会赐予你一个任务, 请接受它
    .accept 84325 >>接受合作圣坛 << Alliance
    .accept 84410 >>接受合作圣坛 << Horde
    .use 228130
step << Alliance
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Alliance
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>从拍卖行购买 2 个|T134459:0|t[|cRXP_LOOT_奥金锭|r]和2 个|T134086:0|t[|cRXP_LOOT_山脉之血|r] 和 3 个|T134132:0|t[|cRXP_LOOT_蓝宝石|r]. 这些物品很快就要用来交任务, 可能价格不菲
    .collect 12360,2 --Arcanite Bar(2)
    .collect 11382,2 --Blood of the Mountain(2)
    .collect 12361,3 --Blue Sapphire(3)
    .target Auctioneer Jaxon
step << Alliance
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂内的|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 84325 >>提交至合作神殿
    .accept 84326 >>接受外交官戒指
    .turnin 84326 >>交还外交官戒指
    .accept 84327 >>接任务: |cRXP_LOOT_外交任务|r
    .target High Priestess Laurena
step << Horde
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step << Horde
    .goto Orgrimmar,55.59,62.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thathung|r交谈
    >>从拍卖行购买 2 个|T134459:0|t[|cRXP_LOOT_奥金锭|r]和2 个|T134086:0|t[|cRXP_LOOT_山脉之血|r] 和 3 个|T134132:0|t[|cRXP_LOOT_蓝宝石|r]. 这些物品很快就要用来交任务, 可能价格不菲
    .collect 12360,2 --Arcanite Bar(2)
    .collect 11382,2 --Blood of the Mountain(2)
    .collect 12361,3 --Blue Sapphire(3)
    .target Thathung
step << Horde
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在精神谷与|cRXP_FRIENDLY_迪特里希·普莱斯|r交谈
    .turnin 84410 >>提交至合作神殿
    .accept 84411 >>接受外交官戒指
    .turnin 84411 >>交还外交官戒指
    .accept 84412 >>接任务: |cRXP_LOOT_外交任务|r
    .target Dietrich Praice
step << Horde
    #completewith next
    >>|cRXP_WARN_要完成此任务, 你需再次寻找敌对阵营的牧师, 让他们在你靠近暴风城城门时对你使用|r |T133396:0|t[|cFF0070FF外交官戒指|r] |cRXP_WARN_. 这样城市守卫将不再攻击你, 让你安全进入敌方首都|r
    >>|cRXP_WARN_请记住, 在PvP服务器上, 敌对阵营的玩家仍然可以攻击你！|r
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
step << Horde
    .goto Stormwind City,38.8,26.6
    >>让敌对阵营的牧师对你使用他们的 |T133396:0|t[|cFF0070FF外交官戒指|r], 这样城市卫兵就不会攻击你, 然后前往暴风城大教堂. |cRXP_WARN_你仍可能受到其他玩家的攻击！|r
    >>|cRXP_WARN_敌对阵营的牧师必须护送你前往任务发布者处, 否则你将失去外交豁免效果|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂内的|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 84412 >>提交外交任务
    .accept 84413 >>接受修复碎片
    .target High Priestess Laurena
step << Alliance
    #completewith next
    >>|cRXP_WARN_要完成此任务, 你需要再次找到一名敌对阵营的牧师, 并让他们在你靠近奥格瑞玛城门时对你使用|r|T133396:0|t[|cFF0070FF外交官戒指|r]|cRXP_WARN_. 这将使城市守卫不再攻击你, 让你安全进入敌方首都|r
    >>|cRXP_WARN_请记住, 在PvP服务器上, 敌对阵营的玩家仍然可以攻击你！|r
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Alliance
    .goto Orgrimmar,35.8,87.2
    >>让敌对阵营的牧师对你使用他们的 |T133396:0|t[|cFF0070FF外交官戒指|r], 这样城市守卫就不会攻击你, 然后前往灵魂谷. |cRXP_WARN_你仍可能受到其他玩家的攻击！|r
    >>|cRXP_WARN_敌对阵营的牧师必须护送你前往任务发布者处, 否则你将失去外交豁免效果|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在精神谷与|cRXP_FRIENDLY_迪特里希·普莱斯|r交谈
    .turnin 84327 >>交任务: |cRXP_FRIENDLY_外交任务|r
    .accept 84328 >>接受修复碎片
    .target Dietrich Praice
step
    #completewith next
    >>|cRXP_WARN_开始寻找队伍前往恐惧之槌西部地下城, 下一个任务你需要击杀|r|cRXP_ENEMY_卡雷迪斯镇长|r|cRXP_WARN_其中一个地下城首领|r
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
    .goto Feralas,59.1,43.2,100 >>进入恐惧之槌区域
step
    .goto Feralas,60.4,30.2
    >>进入恐惧之槌西部, 击杀|cRXP_ENEMY_卡雷迪斯镇长|r. 从他身上搜刮书籍|T133737:0|t[|cRXP_LOOT_应用神学|r]. 他位于地下城的幽灵区域
    .collect 227912,1
step << Horde
    #completewith next
    >>|cRXP_WARN_要完成此任务, 你需再次寻找敌对阵营的牧师, 让他们在你靠近暴风城城门时对你使用|r |T133396:0|t[|cFF0070FF外交官戒指|r] |cRXP_WARN_. 这样城市守卫将不再攻击你, 让你安全进入敌方首都|r
    >>|cRXP_WARN_请记住, 在PvP服务器上, 敌对阵营的玩家仍然可以攻击你！|r
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
step << Horde
    .goto Stormwind City,38.8,26.6
    >>让敌对阵营的牧师对你使用他们的 |T133396:0|t[|cFF0070FF外交官戒指|r], 这样城市卫兵就不会攻击你, 然后前往暴风城大教堂. |cRXP_WARN_你仍可能受到其他玩家的攻击！|r
    >>|cRXP_WARN_敌对阵营的牧师必须护送你前往任务发布者处, 否则你将失去外交豁免效果|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂内的|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 84413 >>提交修复碎片
    .accept 84329 >>接受召集令
    .target High Priestess Laurena
step << Alliance
    #completewith next
    >>|cRXP_WARN_要完成此任务, 你需要再次找到一名敌对阵营的牧师, 并让他们在你靠近奥格瑞玛城门时对你使用|r|T133396:0|t[|cFF0070FF外交官戒指|r]|cRXP_WARN_. 这将使城市守卫不再攻击你, 让你安全进入敌方首都|r
    >>|cRXP_WARN_请记住, 在PvP服务器上, 敌对阵营的玩家仍然可以攻击你！|r
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Alliance
    .goto Orgrimmar,35.8,87.2
    >>让敌对阵营的牧师对你使用他们的 |T133396:0|t[|cFF0070FF外交官戒指|r], 这样城市守卫就不会攻击你, 然后前往灵魂谷. |cRXP_WARN_你仍可能受到其他玩家的攻击！|r
    >>|cRXP_WARN_敌对阵营的牧师必须护送你前往任务发布者处, 否则你将失去外交豁免效果|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在精神谷与|cRXP_FRIENDLY_迪特里希·普莱斯|r交谈
    .turnin 84328 >>提交修复碎片
    .accept 84329 >>接受召集令
    .target Dietrich Praice
step
    #completewith next
    .zone Deadwind Pass >>前往: |cRXP_PICK_逆风小径|r
step
    .goto Deadwind Pass,40.8,78.4
    >>前往位于卡拉赞旁边的一座小神殿
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与卡拉赞旁边的神龛处的|cRXP_FRIENDLY_玛瑟拉·熔心|r交谈
    .turnin 84329 >>交出召集大会
step
    +完成上述任务即可完成任务线, 并解锁在全服务器范围内学习其他种族牧师种族技能的能力
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Soul Warding
#name 灵魂守护 - 60(斯坦索姆)

step
    #completewith next
    >>|cRXP_WARN_为了完成这个符文, 你需要在斯坦索姆地下城(生者与亡者区域)完成几个任务. 现在就开始寻找队伍吧|r
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step
    .goto Eastern Plaguelands,47.8,24.2
    >>进入斯坦索姆
    >>|cRXP_WARN_请仔细阅读本节, 因为这个符文任务有些特别|r
    >>为了获得符文, 你需要从斯坦索姆的首领那里收集3个精华. 拥有这些精华的首领是随机的, 且每次进入的地下城ID不同. 要确定本次副本中哪些首领持有精华, 你需要在地下城活体区域的猩红建筑内柱子上寻找线索
    >>要收集精华, 你需要 3 个 |T134799:0|t[|cRXP_LOOT_斯坦索姆黑影罐|r], 它们从副本内的 [|cRXP_PICK_邮箱包裹|r] 中掉落. 要打开这些 [|cRXP_PICK_邮箱|r], 你首先需要击杀|cRXP_ENEMY_斯坦索姆信使|r, 以从他身上获得 |T134237:0|t[|cRXP_LOOT_邮箱钥匙|r]
    >>收集完所有精华后, 你必须带着线索返回对应的柱子, 并用与提示相对应的精华激活它们. 这会在柱子旁边生成一个宝珠, 你需要拾取它以获得符文
    +|cRXP_WARN_阅读完以上内容后, 如果您想查看每个线索对应哪个首领的详细信息, 请点击此处. 如需返回, 可随时回到此步骤|r
step
    >>|cRXP_WARN_以下是线索及其对应的Boss:|r
    >>在亡者之中, 这个凡人与侍僧及冰系法术为伴 = 苍白的玛勒基
    >>一个被诅咒的幽灵, 被迫守护一座塔楼, 无法从财富或权力中获得慰藉 = 安娜丝塔丽男爵夫人
    >>古代王国重现. 以一个主人取代另一个主人 = 尼鲁布恩坎
    >>由血肉铸成, 被遗弃者最优秀的猎手追捕的科学之罪——吞咽者拉姆斯登
    >>人民在最危难之际期盼他带领众人——巴瑟拉斯镇长
    >>一个邪恶恶意的冠军, 庞大的恐怖生物守护着他的宫殿 = 瑞文戴尔男爵
    >>神圣狂怒涤荡罪恶, 然而暗影仍潜藏其中. = 巴纳扎尔
    >>房间里弥漫着硫磺的气息. 这位狂热者以一声怒吼向你打招呼. = 炮手威利
    +|cRXP_WARN_点击此处查看完成此任务的推荐高效步骤顺序. 如需再次阅读提示, 可随时返回此步骤|r
step
    >>|cRXP_WARN_完成此任务时的高效操作顺序如下:|r
    >>1. 从地下城的生者区域开始 
    >>2. 为|T134799:0|t[|cRXP_LOOT_斯坦索姆 黑影罐|r]收集三个 [|cRXP_PICK_邮箱包裹|r], 这些罐子是唯一的, 因此请让不同的玩家分别拾取每个 
    >>3. 清理至基座房间, 找出你的ID中哪些首领持有精华 
    >>4. 随着你深入地下城, 收集所有精华 
    >>5. 返回基座室, 用其精华激活每个祭坛 
    >>6. 击败为你生成的符文之球
    .collect 228124,1 --Oneiric Epiphany
step
    .train 402850 >>使用 |T135791:0|t[|cRXP_FRIENDLY_梦幻顿悟|r] 来学习 |T135948:0|t[|cRXP_FRIENDLY_灵魂守护|r]
    .use 228124
]])
