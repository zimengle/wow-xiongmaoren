RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 忏悔 - 3（艾尔文森林）
#title Penance

step << Priest
    #season 2
    .goto Elwynn Forest,48.61,27.63
    >>杀死 |cRXP_ENEMY_Kobold Laborers|r。掠夺他们以获得 |T136222:0|t[|cRXP_FRIENDLY_Memory of a Troubled Acolyte|r]
    .collect 205951,1 -- Memory of a Troubled Acolyte (1)
    .mob Kobold Laborer
    .train 402862,1
step << Priest
    #season 2
    .goto Elwynn Forest,49.808,39.489
    >>|cRXP_WARN_在北郡修道院内，在聊天框中输入/kneel|r
    >>|cRXP_WARN_您将收到|r |T135934:0|t[光之冥想] |cRXP_WARN_buff|r
    .cast 410958 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_Memory of a Troubled Acolyte|r] |cRXP_WARN_当你拥有|r |T135934:0|t[Meditation on the Light] |cRXP_WARN_buff|r
    .use 205951
    .itemcount 205951,1
    .train 402862,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 忏悔-1（丹莫洛）
#title Penance


step << Priest
    #season 2
    .goto Dun Morogh,26.733,72.552
    >>打开地面上的 |cRXP_PICK_Rockjaw 储物柜|r。拾取其中的 |T136222:0|t|cRXP_LOOT_[困扰侍僧的记忆]|r
    .collect 205951,1 -- Memory of a Troubled Acolyte (1)
    .train 402862,1
step << Priest
    #season 2
    .goto 1426,28.922,66.378
    .aura 410935 >>|cRXP_WARN_瞄准里面的 |cRXP_FRIENDLY_光之祭坛|r 来接收|r |T135934:0|t[光之冥想] |cRXP_WARN_buff|r
    >>|cRXP_WARN_如果这不起作用，请输入 /kneel 并以 |cRXP_FRIENDLY_Altar of the Light|r 为目标|r
    .target Altar of the Light
    .emote KNEEL,208565
    .train 402862,1
step << Priest
    #season 2
    .train 402862 >>|cRXP_WARN_使用|r |T136222:0|t|cRXP_LOOT_[陷入困境的侍僧的记忆]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 忏悔]
    .aura -410935
    .use 205951
]])

RXPGuides.RegisterGuide([[
#classic
<< NightElf Priest SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 忏悔-2（暗影谷）
#title Penance

step << NightElf Priest
    #season 2
    .goto Teldrassil,59.92,41.74,20,0
    .goto Teldrassil,59.174,40.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_珊达|r, 他在楼上
    .accept 77574 >>接受艾露恩冥想
    .target Shanda
    .train 402862,1
step << NightElf Priest
    #season 2
    #completewith next
    .isOnQuest 77574
    .goto Teldrassil,59.940,33.052,10 >>前往 Shadowglen 的月亮井
    .train 402862,1
step << NightElf Priest
    #season 2
    .isOnQuest 77574
    .goto Teldrassil,59.940,33.052
    .aura 419307 >>|cRXP_WARN_到达月亮井后，在聊天框中输入/kneel|r
    >>|cRXP_WARN_你将获得|r |T136057:0|t[艾露恩冥想] |cRXP_WARN_buff|r
    .train 402862,1
step << NightElf Priest
    #season 2
    #label PenanceRune
    .isOnQuest 77574
    .use 205951 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_困扰侍僧的回忆|r] |cRXP_WARN_当你拥有|r |T136057:0|t[艾露恩的冥想] |cRXP_WARN_buff|r
    .complete 77574,1 -- Learn: Engrave Gloves - Penance
    .target Altar of the Light
    .train 402862,1
step << NightElf Priest
    #season 2
    .goto Teldrassil,59.92,41.74,20,0
    .goto Teldrassil,59.174,40.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_珊达|r, 他在楼上
    .turnin 77574 >>交出艾露恩冥想
    .target Shanda
    .train 402862,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Troll Priest SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 忏悔-2（杜隆塔尔）
#title Penance


    --Rune of Penance

step << Priest
    #season 2
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_肯杰|r
    .accept 77642 >>接受洛阿神的智慧
    .target Ken'jai
step << Priest
    #season 2
    .goto Durotar,55.41,72.84
    >>前往森金村的 |cRXP_PICK_Loa 祭坛|r 并输入 /kneel
    .use 205951 >>Talk to |cRXP_FRIENDLY_Serpent Loa|r as he appears, then use |T136222:0|t[|cRXP_FRIENDLY_Memory of a Troubled Acolyte|r]
    .complete 77642,1 --学习法术：雕刻手套 - 忏悔
    .target Serpent Loa
    .skipgossip
step << Priest
    #season 2
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_肯杰|r
    .turnin 77642 >>交出洛阿神灵的智慧
    .target Ken'jai
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Undead Priest SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 忏悔-2（提瑞斯法）
#title Penance


    --Rune of Penance

step << Priest
    #season 2
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑暗牧师杜斯滕|r
    .accept 77670 >>接受亡灵冥想
    .target Dark Cleric Duesten
step << Priest
    #season 2
    .goto Tirisfal Glades,31.06,64.80
    >>进入墓地并输入/kneel
    .use 205951 >>当你获得 |T237569:0|t[Meditation on Undeath] 增益时使用 |T136222:0|t[|cRXP_FRIENDLY_Memory of a Troubled Acolyte|r]
    .complete 77670,1 >>学习法术：雕刻手套 - 忏悔
step << Priest
    #season 2
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑暗牧师杜斯滕|r
    .turnin 77670 >>交出亡灵冥想
    .target Dark Cleric Duesten

]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 人造人-8（杜隆塔尔）
#title Homunculi

step
    .train 402852,1
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step
    .train 402852,1
    .goto Durotar,55.32,72.66
    .emote KNEEL,208309
    .aura 417316 >>跪在 |cRXP_PICK_Loa 祭坛|r 前并与 |cRXP_FRIENDLY_Serpent Loa|r 交谈
    .skipgossip 208307,1
    .target Serpent Loa
step
    .train 402852,1
    >>杀死 |cRXP_ENEMY_巫毒巨魔s|r。从他们身上搜刮来 |T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r]
    .goto Durotar,67.6,86.4
    .collect 205947,1
    .mob 巫毒巨魔
step << Troll
    .train 402852,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>跪在 |cRXP_PICK_Loa 祭坛|r 前并与 |cRXP_FRIENDLY_Serpent Loa|r 交谈以获得 |T136077:0|t[Meditation on the Loa] 增益
step << Troll
    .train 402852,1
    .aura 418459 >>|cRXP_WARN_现在你必须找到一个拥有 Loa 增益的亡灵牧师。你必须跪在他面前，他必须为你祈祷。|r
step << Undead
    .train 402852,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>跪在 |cRXP_PICK_Loa 祭坛|r 前并与 |cRXP_FRIENDLY_Serpent Loa|r 交谈以获得 |T136077:0|t[Meditation on the Loa] 增益
step << Undead
    .train 402852,1
    .goto Durotar,55.32,72.66
    .aura 418459 >>|cRXP_WARN_跪在森金墓地|r 获得 |T237569:0|t[不死冥想] 增益
step
    .use 205947
    .itemcount 205947,1
    .train 402852 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r] |cRXP_WARN_训练|r |T237570:0|t[Homunculi]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 人造人-7（提瑞斯法林地）
#title Homunculi

step
    .train 402852,1
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 402852,1
    >>杀死 |cRXP_ENEMY_Scarlet 战士|r 或 |cRXP_ENEMY_Scarlet 传教士|r。掠夺他们以获得 |T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r]
    .goto Tirisfal Glades,50.6,67.8,0
    .goto Tirisfal Glades,32.6,48.6
    .collect 205947,1
    .mob Scarlet Warrior
    .mob Scarlet Missionary
step << Troll
    .train 402852,1
    .aura 418459 >>|cRXP_WARN_现在你必须找到一个拥有 Loa 增益的亡灵牧师。你必须跪在他面前，他必须/为你祈祷才能获得 |T237569:0|t[Meditation on Undeath] 增益。|r
step << Troll
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Troll
    .train 402852,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>跪在 |cRXP_PICK_Loa 祭坛|r 前并与 |cRXP_FRIENDLY_Serpent Loa|r 交谈以获得 |T136077:0|t[Meditation on the Loa] 增益
step << Undead
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Undead
    .train 402852,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>跪在 |cRXP_PICK_Loa 祭坛|r 前并与 |cRXP_FRIENDLY_Serpent Loa|r 交谈以获得 |T136077:0|t[Meditation on the Loa] 增益
    *|cRXP_WARN_You can also find a Troll Priest with the |T136077:0|t[Meditation on the Loa] buff. Kneel before him and he has to /pray for you|r.
step << Undead
    .train 402852,1
    .goto Durotar,57.15,73.36
    .aura 418459 >>|cRXP_WARN_跪在森金墓地|r 获得 |T237569:0|t[不死冥想] 增益
step
    .use 205947
    .itemcount 205947,1
    .train 402852 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r] |cRXP_WARN_训练|r |T237570:0|t[Homunculi]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 分享痛苦 - 13（杜隆塔尔）
#title Shared Pain

step
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step
    .train 402854,1
    >>杀死 |cRXP_ENEMY_Makasgar|r 或 |cRXP_ENEMY_Gazz'uz|r（在洞穴中），无论哪个离你最近（路径点会引导你找到最近的那个）。拾取它们以获得 |T136222:0|t[|cRXP_FRIENDLY_Memory of an Imprisoned Savior|r]
    .goto Durotar,52.6,8.8,-1
    .goto Durotar,62.0,66.2,-1
    .collect 205945,1
    .mob Makasgar
    .mob Gazz'uz
step
    .train 402854,1
    .goto Durotar,55.32,72.66
    .emote KNEEL,208309
    .aura 417316 >>跪在 |cRXP_PICK_Loa 祭坛|r 前并与 |cRXP_FRIENDLY_Serpent Loa|r 交谈以获得 |T136077:0|t[Meditation on the Loa] 增益
    .skipgossip 208307,1
    .target Serpent Loa
step
    .use 205945
    .itemcount 205945,1
    .train 402854 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的记忆|r] |cRXP_WARN_进行训练|r |T136160:0|t[共享痛苦]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 共享痛苦 - 6（提瑞斯法林地）
#title Shared Pain

step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 402854,1
    >>杀死 |cRXP_ENEMY_提瑞斯法农民|r。掠夺他们以获得 |T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的回忆|r]
    .goto Tirisfal Glades,36.2,50.4
    .collect 205945,1
    .mob Tirisfal Farmer
step << Undead
    .train 402854,1
    .goto Tirisfal Glades,56.39,49.39
    .aura 418459 >>跪在墓地直到你获得增益 |T237569:0|t[不死冥想]
step << Troll
    #completewith SharedPainTirisfalA
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Troll
    #label SharedPainTirisfalA
    .train 402854,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .aura 417316 >>跪在 |cRXP_PICK_Loa 祭坛|r 前并与 |cRXP_FRIENDLY_Serpent Loa|r 交谈以获得 |T136077:0|t[Meditation on the Loa] 增益
    .aura -418459
    >>|cRXP_WARN_您还可以找到具有 Loa 增益的亡灵牧师。您必须跪在他面前，他必须/为您祈祷才能获得 |T237569:0|t[亡灵冥想] 增益。|r
    .skipgossip 208307,1
step
    .use 205945
    .itemcount 205945,1
    .train 402854 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的记忆|r] |cRXP_WARN_进行训练|r |T136160:0|t[共享痛苦]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 虚空瘟疫 - 5（杜隆塔尔）
#title Void Plague

step
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step
    .train 425216,1
    >>杀死 |cRXP_ENEMY_Sailors|r 和 |cRXP_ENEMY_Marines|r。从他们身上夺取 |T136222:0|t[|cRXP_FRIENDLY_Memory of a Dark Purpose|r]
    .goto Durotar,57.6,55.4
    .collect 205940,1
    .mob 库尔提拉斯水手
    .mob 库尔提拉斯海军陆战队
step
    .train 425216,1
    .goto Durotar,55.32,72.66
    .emote KNEEL,208309
    .aura 417316 >>跪在 |cRXP_PICK_Loa 祭坛|r 前并与 |cRXP_FRIENDLY_Serpent Loa|r 交谈以获得 |T136077:0|t[Meditation on the Loa] 增益
    .skipgossip 208307,1
    .target Serpent Loa
step
    .use 205940
    .itemcount 205940,1
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗目的的记忆|r] |cRXP_WARN_进行训练|r |T237514:0|t[虚空瘟疫]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 虚空瘟疫 - 6（提瑞斯法林地）
#title Void Plague

step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 425216,1
    >>杀死 |cRXP_ENEMY_Gillgar|r。从他身上搜刮 |T136222:0|t[|cRXP_FRIENDLY_Memory of Dark Purpose|r]
    .goto Tirisfal Glades,25.6,48.2
    .collect 205940,1
    .mob Gillgar
step << Undead
    .train 425216,1
    .goto Tirisfal Glades,56.39,49.39
    .aura 418459 >>跪在墓地直到你获得增益 |T237569:0|t[不死冥想]
step << Troll
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Troll
    .train 402854,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .aura 417316 >>跪在 |cRXP_PICK_Loa 祭坛|r 前并与 |cRXP_FRIENDLY_Serpent Loa|r 交谈以获得 |T136077:0|t[Meditation on the Loa] 增益
    .skipgossip 208307,1
step
    .use 205940
    .itemcount 205940,1
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗目的的记忆|r] |cRXP_WARN_进行训练|r |T237514:0|t[虚空瘟疫]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 愈合祷言 - 6（杜隆塔尔）
#title Prayer of Mending

step
    .goto Durotar,48.04,79.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Adventurer's Spirit|r inside Kolkar Crag
    >>|cRXP_WARN_另一个玩家（牧师或萨满）需要点击传送门。掠夺|r |cRXP_FRIENDLY_冒险者之灵|r |cRXP_WARN_之后|r |T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r]
    .collect 205944,1 --Reciprocal Epiphany (1)
    .target Adventurer's Spirit
    .skipgossip
    .train 402848,1
step
    .use 205944
    .itemcount 205944,1
    .train 402848 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_相互顿悟|r] |cRXP_WARN_训练|r |T135944:0|t[修补祷告]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 愈合祷言 - 10（莫高雷）
#title Prayer of Mending

step
    .goto Mulgore,60.39,33.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Adventurer's Spirit|r outside of the Venture Co. Mine
    >>|cRXP_WARN_另一个玩家（牧师或萨满）需要点击传送门。掠夺|r |cRXP_FRIENDLY_冒险者之灵|r |cRXP_WARN_之后|r |T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r]
    .collect 205944,1 --Reciprocal Epiphany (1)
    .target Adventurer's Spirit
    .skipgossip
    .train 402848,1
step
    .use 205944
    .itemcount 205944,1
    .train 402848 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_相互顿悟|r] |cRXP_WARN_训练|r |T135944:0|t[修补祷告]
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 扭曲的信仰-10（洛克莫丹）
#title Twisted Faith

step << Priest
    #completewith MinerGear
    .goto Loch Modan,35.50,18.97,20 >>进入银溪矿井
    .train 425215,1
step << Priest
    .goto Loch Modan,35.6,20.6
    >>杀死 |cRXP_ENEMY_Tunnel Rats|r。掠夺它们以获得 |T237281:0|t[|cRXP_LOOT_Offering Coin|r]
    .collect 208823,1 -- Offering Coin (1)
    .mob Tunnel Rat Scout
    .mob 隧道鼠风水师
    .train 425215,1
step << Priest
    .goto Loch Modan,36.689,20.964
    .use 208823 >>|cRXP_WARN_使用|r |T237281:0|t[|cRXP_LOOT_献祭币|r] |cRXP_WARN_在银溪矿井内的井中|r |cRXP_WARN_接收|r |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r]
    .collect 205905,1 -- Memory of a Devout Champion (1)
    .train 425215,1
step << Priest
    .train 425215 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的回忆|r] |cRXP_WARN_训练|r |T237566:0|t[扭曲的信仰]
    >>|cRXP_WARN_你必须通过输入 /kneel 在圣地获得|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buff，例如北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘守卫|r
    .use 205905
    .itemcount 205905,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 扭曲的信仰 - 14（西部荒野）
#title Twisted Faith

step << Priest
    .goto Westfall,32.6,43.2,60,0
    .goto Westfall,29.8,46.6,60,0
    .goto Westfall,45.0,26.0,60,0
    .goto Westfall,45.6,21.2
    >>杀死 |cRXP_ENEMY_Undying Laborer|r。拾取它以获得 |T136222:0|t[|cRXP_FRIENDLY_Memory of a Devout Champion|r]
    >>|cRXP_WARN_你必须使用神圣法术才能消灭|r |cRXP_ENEMY_Undying Laborer|r
    >>|cRXP_WARN_|cRXP_ENEMY_Undying Laborer|r 可以在黄金海岸采石场和 Jangolode 矿场生成|r
    .collect 205905,1 -- Memory of a Devout Champion (1)
    .unitscan Undying Laborer
    .train 425215,1
step << Priest
    .train 425215 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的回忆|r] |cRXP_WARN_训练|r |T237566:0|t[扭曲的信仰]
    >>|cRXP_WARN_你必须通过输入 /kneel 在圣地获得|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buff，例如北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘守卫|r
    .use 205905
    .itemcount 205905,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 扭曲的信仰-18（黑海岸）
#title Twisted Faith

step << Priest
    .goto Darkshore,59.2,23.4,60,0
    .goto Darkshore,60.0,15.4
    >>杀死 |cRXP_ENEMY_Stormscale Myrmidons|r、|cRXP_ENEMY_Stormscale Warriors|r 和 |cRXP_ENEMY_Stormscale Sorceresses|r。掠夺他们以获得 |T236364:0|t[|cRXP_LOOT_Shatterspear Offering|r]
    .collect 211482,1 -- Shatterspear Offering (1)
    .mob Stormscale Myrmidon
    .mob Stormscale Warrior
    .mob Stormscale Sorceress
    .train 425215,1
step << Priest
    .goto Darkshore,59.2,22.6
    .use 211482 >>|cRXP_WARN_使用|r |T236364:0|t[|cRXP_LOOT_碎矛祭品|r] |cRXP_WARN_对着水下的碎矛雕像领取|r |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r]
    .collect 205905,1 -- Memory of a Devout Champion (1)
    .train 425215,1
step << Priest
    .train 425215 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的回忆|r] |cRXP_WARN_训练|r |T237566:0|t[扭曲的信仰]
    >>|cRXP_WARN_你必须通过输入 /kneel 在圣地获得|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buff，例如北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘守卫|r
    .use 205905
    .itemcount 205905,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 分享痛苦-10（丹莫洛）
#title Shared Pain

step << Priest
    .goto Loch Modan,77.894,62.236
    >>杀死楼下建筑内的 |cRXP_ENEMY_Captain Beld|r。从他身上搜刮 |T136222:0|t[|cRXP_FRIENDLY_Memory of an Imprisoned Savior|r]
    .collect 205945,1 -- Memory of an Imprisoned Savior (1)
    .mob Captain Beld
    .train 402854,1
step << Priest
    .train 402854 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的记忆|r] |cRXP_WARN_进行训练|r |T136160:0|t[共享痛苦]
    >>|cRXP_WARN_你必须通过输入 /kneel 在圣地获得|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buff，例如北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘守卫|r
    .use 205945
    .itemcount 205945,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 分享痛苦 - 6（艾尔文森林）
#title Shared Pain

step << Priest
    .goto Elwynn Forest,40.6,81.8
    >>杀死 |cRXP_ENEMY_Kobold Miners|r。掠夺他们以获得 |T136222:0|t[|cRXP_FRIENDLY_Memory of an Imprisoned Savior|r]
    .collect 205945,1 -- Memory of an Imprisoned Savior (1)
    .mob Kobold Miner
    .train 402854,1
step << Priest
    .train 402854 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的记忆|r] |cRXP_WARN_进行训练|r |T136160:0|t[共享痛苦]
    >>|cRXP_WARN_你必须通过输入 /kneel 在圣地获得|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buff，例如北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘守卫|r
    .use 205945
    .itemcount 205945,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 人造人—8（丹莫洛）
#title Homunculi

step << Priest
    .goto Dun Morogh,42.0,44.6,50,0
    .goto Dun Morogh,42.4,35.8
    >>杀死 |cRXP_ENEMY_霜鬃先知s|r。掠夺他们以获得 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of a Desecrated Citadel|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob 霜鬃先知
    .train 402852,1
step << Priest
    .train 402852 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r] |cRXP_WARN_训练|r |T237570:0|t[Homunculi]
    >>|cRXP_WARN_你必须通过输入 /kneel 在圣地获得 2|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buffs，例如北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘守卫|r
    .use 205947
    .itemcount 205947,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 人造人-8（艾尔文森林）
#title Homunculi

step << Priest
    .goto Elwynn Forest,74.0,51.8
    >>杀死 |cRXP_ENEMY_Defias 盗贼巫师|r。掠夺他们以获得 |T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob Defias Rogue Wizard
    .train 402852,1
step << Priest
    .train 402852 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r] |cRXP_WARN_训练|r |T237570:0|t[Homunculi]
    >>|cRXP_WARN_你必须通过输入 /kneel 在圣地获得 2|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buffs，例如北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘守卫|r
    .use 205947
    .itemcount 205947,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 人造人-8（泰达希尔）
#title Homunculi

step << Priest
    #completewith next
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >>前往魔岩
    .train 402852,1
step << Priest
    .goto Teldrassil,77.86,61.66
    >>杀死 |cRXP_ENEMY_Vicious Grells|r、|cRXP_ENEMY_Rascal Sprites|r 和 |cRXP_ENEMY_Shadow Sprites|r。从他们身上获取 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of a Desecrated Citadel|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob Vicious Grell
    .mob Rascal Sprite
    .mob Shadow Sprite
    .train 402852,1
step << Priest
    .train 402852 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r] |cRXP_WARN_训练|r |T237570:0|t[Homunculi]
    >>|cRXP_WARN_你必须通过输入 /kneel 在圣地获得 2|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buffs，例如月亮井、北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘守卫|r
    .use 205947
    .itemcount 205947,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 愈合祷言 - 6（艾尔文森林）
#title Prayer of Mending

step << Priest
    .goto Elwynn Forest,52.28,84.56
    >>|cRXP_WARN_加入另一个站在 |cRXP_FRIENDLY_Adventurer's Remains|r 上的牧师或圣骑士的队伍，或在常规聊天中寻求圣骑士或牧师的帮助（在聊天中输入 /1）|r
    >>|cRXP_WARN_与地面上的 |cRXP_FRIENDLY_冒险者的遗骸|r 交谈以开始仪式，或点击其他玩家的|r |T136223:0|t[精神仪式] |cRXP_WARN_（在他们的小组中）|r
    >>|cRXP_WARN_An |cRXP_FRIENDLY_Adventurer's Spirit|r 将在完成仪式后出现并死亡。将其掠夺以获得|r |T135791:0|t[|cRXP_FRIENDLY_Reciprocal Epiphany|r]
    .train 402848 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_相互顿悟|r] |cRXP_WARN_学习|r |T135944:0|t[治愈祷告]
    .use 205942
    .use 205944
    .skipgossip
    .target Adventurer's Remains
    .target Adventurer's Spirit
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 愈合祷言 - 8（泰达希尔）
#title Prayer of Mending

step << Priest
    .goto Teldrassil,33.610,35.732
    >>|cRXP_WARN_加入一个有另一位牧师或德鲁伊守护 |cRXP_FRIENDLY_Adventurer's Remains|r 的队伍，或者在常规聊天中寻求德鲁伊或牧师的帮助（在聊天中输入 /1）|r
    >>|cRXP_WARN_与地面上的 |cRXP_FRIENDLY_冒险者的遗骸|r 交谈以开始仪式，或点击其他玩家的|r |T136223:0|t[精神仪式] |cRXP_WARN_（在他们的小组中）|r
    >>|cRXP_WARN_An |cRXP_FRIENDLY_Adventurer's Spirit|r 将在完成仪式后出现并死亡。将其掠夺以获得|r |T135791:0|t[|cRXP_FRIENDLY_Reciprocal Epiphany|r]
    .train 402848 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_相互顿悟|r] |cRXP_WARN_学习|r |T135944:0|t[治愈祷告]
    .use 205942
    .use 205944
    .skipgossip
    .target Adventurer's Remains
    .target Adventurer's Spirit
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 愈合祷言 - 6（丹莫洛）
#title Prayer of Mending

step << Priest
    .goto Dun Morogh,43.0,49.6
    >>|cRXP_WARN_加入另一个站在 |cRXP_FRIENDLY_Adventurer's Remains|r 上的牧师或圣骑士的队伍，或在常规聊天中寻求圣骑士或牧师的帮助（在聊天中输入 /1）|r
    >>|cRXP_WARN_与地面上的 |cRXP_FRIENDLY_冒险者的遗骸|r 交谈以开始仪式，或点击其他玩家的|r |T136223:0|t[精神仪式] |cRXP_WARN_（在他们的小组中）|r
    >>|cRXP_WARN_An |cRXP_FRIENDLY_Adventurer's Spirit|r 将在完成仪式后出现并死亡。将其掠夺以获得|r |T135791:0|t[|cRXP_FRIENDLY_Reciprocal Epiphany|r]
    .train 402848 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_相互顿悟|r] |cRXP_WARN_学习|r |T135944:0|t[治愈祷告]
    .use 205942
    .use 205944
    .skipgossip
    .target Adventurer's Remains
    .target Adventurer's Spirit
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 暗言术：灭 - 10（黑海岸）
#title Shadow Word: Death

step << Priest
    .goto Darkshore,30.5,47.5
    >>点击小岛上的 |cRXP_PICK_Remnant|r。拾取它以获得 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of a King's Demise|r]
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .train 402849,1
step << Priest
    >>你现在必须获得两个|T135934:0|t|T136057:0|t[冥想]增益
    >>你必须跪在下列地点之一内：月亮井、北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘区
    >>为了获得你的第二个 |T135934:0|t|T136057:0|t[冥想] 增益，你需要 /跪在一个与你拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前，并且他们必须 /在瞄准你时祈祷
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益，使用|r |T135975:0|t[|cRXP_FRIENDLY_国王灭亡的预言]|r |cRXP_WARN_学习|r |T136149:0|t[暗言术：灭]
    .use 205932
    .itemcount 205932,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 暗言术 - 死亡 - 12（洛克莫丹）
#title Shadow Word: Death

step << Priest
    #completewith next
    .goto Loch Modan,71.8,27.6
    .subzone 143 >>前往洛克莫丹的莫格罗什要塞
step << Priest
    #season 2
    .goto Loch Modan,71.8,27.6
    .aura 410935 >>|cRXP_WARN_瞄准 |cRXP_FRIENDLY_Heretic Idol|r 自动/跪下|r
    .emote KNEEL,208565 >>|cRXP_WARN_如果不起作用，请在以 |cRXP_FRIENDLY_Heretic Idol|r 为目标的聊天框中输入 /kneel|r
    >>|cRXP_WARN_您将收到|r |T135975:0|t[|cRXP_FRIENDLY_国王灭亡的预言|r]
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .target Heretic Idol
step << Priest
    >>你现在必须获得两个|T135934:0|t|T136057:0|t[冥想]增益
    >>你必须跪在下列地点之一内：月亮井、北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘区
    >>为了获得你的第二个 |T135934:0|t|T136057:0|t[冥想] 增益，你需要 /跪在一个与你拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前，并且他们必须 /在瞄准你时祈祷
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益，使用|r |T135975:0|t[|cRXP_FRIENDLY_国王灭亡的预言]|r |cRXP_WARN_学习|r |T136149:0|t[暗言术：灭]
    .use 205932
    .itemcount 205932,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 暗言术：灭 - 20（贫瘠之地）
#title Shadow Word: Death

step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    #loop
    .goto The Barrens,54.8,35.6,40,0
    .goto The Barrens,58.8,37.6,40,0
    >>对 |cRXP_ENEMY_Desert Mirage|r 使用 |T135894:0|t[驱散魔法]。拾取它以获得 |T135975:0|t[|cRXP_FRIENDLY_国王灭亡的预言|r]
    *|cRXP_WARN_It's a green ghost which patrolls around. Use the RestedXP target macro to target it.|r
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .train 402849,1
    .mob Desert Mirage
step << Troll
    >>你现在必须获得两个|T237569:0|t|T136077:0|t[冥想]增益
    >>你必须|cRXP_WARN_/跪下|r 在祭坛前的下列地点之一并与灵魂交谈：森金或十字路口|cRXP_WARN_（神殿位置已在你的地图上标记，你也可以找到任何拥有可以将它们复制到你身上的 buff 的牧师）|r
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    >>为了获得第二个 |T237569:0|t|T136077:0|t[冥想] 增益，你需要 |cRXP_WARN_/跪|r 在具有 |T237569:0|t[不死冥想] 的不死牧师面前，并且他们必须/祈祷并瞄准你
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益，使用|r |T135975:0|t[|cRXP_FRIENDLY_国王灭亡的预言]|r |cRXP_WARN_学习|r |T136149:0|t[暗言术：灭]
    .use 205932
    .itemcount 205932,1
step << Undead
    >>你现在必须获得两个|T237569:0|t|T136077:0|t[冥想]增益
    >>你必须|cRXP_WARN_/跪|r在祭坛前的下列地点之一并与灵魂交谈：森金或十字路口
    .emote KNEEL,208309
    .goto The Barrens,51.5,29.5,0
    .goto The Barrens,50.7,32.7,0
    >>为了获得第二个 |T237569:0|t|T136077:0|t[冥想] 增益 |cRXP_WARN_/跪|r 在墓地获得 |T237569:0|t[不死冥想] 增益 |cRXP_WARN_(神殿和墓地标记在你的地图上，你也可以找到任何拥有可以将它们复制到你身上的增益的牧师)|r
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益，使用|r |T135975:0|t[|cRXP_FRIENDLY_国王灭亡的预言]|r |cRXP_WARN_学习|r |T136149:0|t[暗言术：灭]
    .use 205932
    .itemcount 205932,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 暗言术：灭 - 24（银松森林）
#title Shadow Word: Death

step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .goto Silverpine Forest,65.8,23.6
    >>拿起 |cRXP_ENEMY_Thule Ravenclaw|r (24 级精英) 身后的 |cRXP_PICK_Scroll|r 以获得 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of a King's Demise|r]
    *|cRXP_WARN_The scroll is one the second floor. It's easier in a group.|r
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .train 402849,1
step << Troll
    >>你现在必须获得两个|T237569:0|t|T136077:0|t[冥想]增益
    >>你必须|cRXP_WARN_/跪下|r 在祭坛前的下列地点之一并与灵魂交谈：森金或十字路口|cRXP_WARN_（神殿位置已在你的地图上标记，你也可以找到任何拥有可以将它们复制到你身上的 buff 的牧师）|r
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    >>为了获得第二个 |T237569:0|t|T136077:0|t[冥想] 增益，你需要 |cRXP_WARN_/跪|r 在具有 |T237569:0|t[不死冥想] 的不死牧师面前，并且他们必须/祈祷并瞄准你
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益，使用|r |T135975:0|t[|cRXP_FRIENDLY_国王灭亡的预言]|r |cRXP_WARN_学习|r |T136149:0|t[暗言术：灭]
    .use 205932
    .itemcount 205932,1
step << Undead
    >>你现在必须获得两个|T237569:0|t|T136077:0|t[冥想]增益
    >>你必须|cRXP_WARN_/跪|r在祭坛前的下列地点之一并与灵魂交谈：森金或十字路口
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    .goto Silverpine Forest,44.2,42.7,0
    >>为了获得第二个 |T237569:0|t|T136077:0|t[冥想] 增益 |cRXP_WARN_/跪|r 在墓地获得 |T237569:0|t[不死冥想] 增益 |cRXP_WARN_(神殿和墓地标记在你的地图上，你也可以找到任何拥有可以将它们复制到你身上的增益的牧师)|r
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益，使用|r |T135975:0|t[|cRXP_FRIENDLY_国王灭亡的预言]|r |cRXP_WARN_学习|r |T136149:0|t[暗言术：灭]
    .use 205932
    .itemcount 205932,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 扭曲的命运-10（银松森林）
#title Twisted Fate

step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .train 425215,1
    >>杀死 |cRXP_ENEMY_哀嚎之灵|r。拾取它以获得 |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆]
    .goto Silverpine Forest,57.9,71.5
    .collect 205905,1
    .mob Wailing Spirit
step
    .train 425215 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的回忆] |cRXP_WARN_训练|r |T237566:0|t[扭曲的命运]
    >>|cRXP_WARN_你必须拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_buff，方法是在 |cRXP_PICK_Loa Shrine|r 前（在杜隆塔尔或贫瘠之地）输入|r /跪下 |cRXP_WARN_，或者在另一个牧师为你/祈祷时跪在他们面前|r << Troll
    >>|cRXP_WARN_您必须拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益，方法是在墓地输入|r /kneel |cRXP_WARN_，或者在另一位牧师/为您祈祷时跪在他们面前，获得增益|r << Undead
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    .goto Silverpine Forest,55.6,73.3 << Undead
    .use 205905
    .itemcount 205905,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Priest SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 扭曲的命运-10（贫瘠之地）
#title Twisted Fate

step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 425215,1
    >>杀死 |cRXP_ENEMY_Razormanes|r。从他们身上夺取 |T236248:0|t[|cRXP_FRIENDLY_Helping Hand]
    .goto The Barrens,54.6,25.6
    .collect 208765,1
    .mob 钢鬃棘织者
    .mob 钢鬃猎人
    .mob 钢鬃寻水者
    .mob 钢鬃防御者
step
    .train 425215,1
    >>|cRXP_WARN_找到一个你可以复活的死亡玩家或宠物（使用 |T135955:0|t[复活]）来获得|r |T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的回忆]
    .collect 205905,1
step
    .train 425215 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的回忆] |cRXP_WARN_训练|r |T237566:0|t[扭曲的命运]
    >>|cRXP_WARN_你必须拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_buff，方法是在 |cRXP_PICK_Loa Shrine|r 前（在杜隆塔尔或贫瘠之地）输入|r /跪下 |cRXP_WARN_，或者在另一个牧师为你/祈祷时跪在他们面前|r << Troll
    >>|cRXP_WARN_您必须拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益，方法是在墓地输入|r /kneel |cRXP_WARN_，或者在另一位牧师/为您祈祷时跪在他们面前，获得增益|r << Undead
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    .goto The Barrens,50.7,32.8 << Undead
    .use 205905
    .itemcount 205905,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 虚空瘟疫 - 6（艾尔文森林）
#title Void Plague

step << Priest
    #season 2
    #completewith next
    .goto Elwynn Forest,38.34,81.54,20 >>进入法戈迪普矿井
    .train 425216,1
step << Priest
    #season 2
    .goto Elwynn Forest,41.7,78.1
    >>杀死 |cRXP_ENEMY_Goldtooth|r。从他身上搜刮 |T136222:0|t[|cRXP_FRIENDLY_Memory of a Dark Purpose|r]
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .mob Goldtooth
    .train 425216,1
step << Priest
    #season 2
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗目的的记忆|r] |cRXP_WARN_训练|r |T237514:0|t[虚空瘟疫]
    .use 205940
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Priest SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 虚空瘟疫-6（丹莫洛）
#title Void Plague


step << Priest
    #season 2
    .goto Dun Morogh,27.2,43.0,60,0
    .goto Dun Morogh,24.8,39.3,60,0
    .goto Dun Morogh,25.6,43.4,60,0
    .goto Dun Morogh,24.3,44.0,60,0
    .goto Dun Morogh,25.4,45.4,60,0
    .goto Dun Morogh,25.00,43.50
    >>杀死 |cRXP_ENEMY_Leper Gnomes|r。掠夺他们以获得 |T136222:0|t[|cRXP_FRIENDLY_Memory of a Dark Purpose|r]
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .mob Leper Gnome
    .train 425216,1
step << Priest
    #season 2
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗目的的记忆|r] |cRXP_WARN_训练|r |T237514:0|t[虚空瘟疫]
    .use 205940
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Belt
#name 赋能再生-27（千针石林）
#title Empowered Renew


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
    >>杀死 |cRXP_ENEMY_Grimtotem Geomancers|r、|cRXP_ENEMY_Grimtotem Bandits|r、|cRXP_ENEMY_Grimtotem Reavers|r 和 |cRXP_ENEMY_Grimtotem Stompers|r。拾取他们以获得 |T135975:0|t[|cRXP_LOOT_Prophecy of the Quickened Path|r]
    .collect 213140,1
    .mob Grimtotem Geomancer
    .mob Grimtotem Bandit
    .mob Grimtotem Reaver
    .mob Grimtotem Stomper
step
    .train 425309 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_LOOT_加速之路的预言|r] |cRXP_WARN_进行训练|r |T236254:0|t[强化恢复]
    .use 213140
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Belt
#name 强化恢复 - 33（奥特兰克山脉）
#title Empowered Renew

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
    >>杀死 |cRXP_ENEMY_Crushridge Ogres|r 和 |cRXP_ENEMY_Crushridge Brutes|r。从他们身上获取 |T135975:0|t[|cRXP_LOOT_Prophecy of the Quickened Path|r]
    .collect 213140,1
    .mob Crushridge Ogre
    .mob Crushridge Brute
step
    .train 425309 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_LOOT_加速之路的预言|r] |cRXP_WARN_进行训练|r |T236254:0|t[强化恢复]
    .use 213140
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Belt
#name 重燃希望-31（凄凉之地）
#title Renewed Hope

-- Renewed Hope

step
    #optional
    .train 425310,1
    .train 605 >>|cRXP_WARN_你必须接受|r |T136206:0|t[心灵控制] |cRXP_WARN_训练才能获得|r |T135923:0|t[重获希望] |cRXP_WARN_rune|r
step
    #optional
    .train 425310,1
    .xp 31
    >>|cRXP_WARN_你必须至少达到 31 级才能对 33 级 |cRXP_ENEMY_Slitherblade Tide Priestess|r 施放|r |T136206:0|t[Mind Control] |cRXP_WARN_on|r
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
    >>杀死 |cRXP_ENEMY_Slitherblade Nagas|r。掠夺他们以获得 |T136222:0|t[|cRXP_LOOT_Unsettling Vision|r]
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
    +|cRXP_WARN_注意：你只能对 33 级 |cRXP_ENEMY_Slitherblade Tide Priestess|r 施放 |r |T136206:0|t[Mind Control] |cRXP_WARN_on。对 34 级的施法将失败|r
    .xp >32,1
    .xp <31,1
    .train 425310,1
step
    #label MCPriestess
    #loop
    .goto Desolace,38.8,24.0,60,0
    .goto Desolace,34.6,30.0,60,0
    .goto Desolace,34.6,20.2,60,0
    .aura 435117 >>|cRXP_WARN_施法|r |T136206:0|t[精神控制] |cRXP_WARN_on a|r |cRXP_ENEMY_Slitherblade 潮汐女祭司|r
    >>|cRXP_WARN_当它受到|r |T136206:0|t[心灵控制]|cRXP_WARN_的影响时，以你自己为目标并从宠物动作栏中施放|r |T136077:0|t[深渊冥想]|cRXP_WARN_|r
    >>|cRXP_WARN_然后按 Esc 键取消|r |T136206:0|t[精神控制] |cRXP_WARN_并杀死|r |cRXP_ENEMY_Slitherblade 潮汐女祭司|r
    .mob Slitherblade Tide Priestess
    .train 425310,1
step
    .train 425310 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_LOOT_令人不安的愿景|r] |cRXP_WARN_进行训练|r |T135923:0|t[重燃希望]
    .use 213599
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Boots
#name 分散 40（荆棘谷）
#title Dispersion

-- Dispersion

step
    .train 425314,1
    >>|cRXP_WARN_在荆棘谷找到一名拥有|r |T132299:0|t[精妙大师] |cRXP_WARN_符文和|r |T338666:0|t[贾尼的护身符] |cRXP_WARN_饰品的盗贼，将其交给|r |T133644:0|t[扒窃] |cRXP_WARN_任何 |cRXP_敌方_血头巨魔|r，获得|r |T237446:0|t[神秘的巨魔卷轴]|cRXP_WARN_。法师必须使用|r |T135933:0|t[理解护身符] |cRXP_WARN_来破译它，使其成为|T134938:0|t[|cRXP_LOOT_破译的巨魔卷轴|r]|r
    >>|cRXP_WARN_或者从拍卖行购买|r |T237446:0|t[神秘的巨魔卷轴]|r |cRXP_WARN_并让法师解密，或者购买已经|T134938:0|t[|cRXP_LOOT_解密的巨魔卷轴|r]|r
    .use 216880 >>|cRXP_WARN_使用 |T134938:0|t[|cRXP_LOOT_Deciphered Troll Scroll|r] 开始任务|r
    >>|cRXP_WARN_你也可以寻找一位牧师与你分享任务|r
    .collect 216880,1
    .disablecheckbox
    .accept 79731 >>接受巨魔卷轴
step
    .train 425314,1
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    >>|cRXP_WARN_确保在前往那里之前有 2 个正在运行的|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buffs|r
step
    .train 425314,1
    .goto Stranglethorn Vale,28.961,61.931
    >>点击 |cRXP_PICK_The Holy Spring|r。拾取它以获得 |T134712:0|t[|cRXP_LOOT_Holy Spring Water|r]
    >>|cRXP_WARN_你可能需要杀死守卫在|r |cRXP_PICK_圣泉前的|cRXP_ENEMY_Lord Sakrasis|r (等级 45 稀有)|r
    .collect 737,1 --Holy Spring Water
    .mob Lord Sakrasis
step
    #completewith next
    .subzone 102 >>前往祖昆达废墟
step
    .train 425314,1
    .goto Stranglethorn Vale,23.569,7.955
    .cast 3591 >>|cRXP_WARN_使用|r |T134712:0|t[|cRXP_LOOT_圣泉水|r] |cRXP_WARN_在小喷泉处|r
    >>|cRXP_WARN_您可能需要杀死 |cRXP_ENEMY_Gan'zulah|r (等级 41) 和他周围的一小群 |cRXP_ENEMY_Trolls|r 才能到达小喷泉|r
    .use 737
    .mob Gan'zulah
step
    .train 425314,1
    .goto Stranglethorn Vale,23.569,7.955
    >>点击出现的 |cRXP_PICK_Fount|r。拾取它以获得 |T135975:0|t|cRXP_LOOT_[Prophecy of Imprisoned Malice]|r
    .collect 213142,1
step
    .train 425314 >>|cRXP_WARN_使用|r |T135975:0|t|cRXP_LOOT_[被监禁的恶意的预言]|r |cRXP_WARN_进行训练|r |T237563:0|t[分散]
    .use 213142
step
    .isQuestComplete 79731
    .goto Stranglethorn Vale,35.658,10.808
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赫米特·奈辛瓦里|r
    .turnin 79731 >>交出巨魔卷轴
    .target 赫米特·奈辛瓦里
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Boots
#name 痛苦抑制 - 32（艾泽拉斯）
#title Pain Suppression

-- Pain Suppression

step
    .train 402855,1
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 402855,1
    .goto 1415,47.44,19.75,10,0
    .goto 1415,47.45,19.69,5,0
    .goto 1415,47.62,19.59,10,0
    .goto 1415,47.73,19.39,5 >>进入血色修道院地下城：墓地
step
    >>点击无头骑士刷新点附近的|cRXP_PICK_Tombstone|r 来收集|cRXP_LOOT_|T136222:0|t[墓地回声]|r |cRXP_WARN_强烈建议组成一个 5 人小组来完成这一步。|r
    .link https://imgur.com/a/lqRc0i6 >>|cRXP_WARN_点击此处查看图片参考。|r
    .collect 215426,1
step
    #optional
    .train 402855,1
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    .train 402855,1
    .goto Arathi Highlands,62.1,54.5
    >>点击 |cRXP_PICK_Grave|r 来收集 Go'sheks Farm 上最大建筑物旁边的 |cRXP_LOOT_|T136222:0|t[阿拉希回声]|r。
    .collect 215427,1
step
    .train 402855,1
    .zone Dustwallow Marsh >>前往: |cRXP_PICK_尘泥沼泽|r
step
    .train 402855,1
    .goto Dustwallow Marsh,63.7,42.3
    >>点击|cRXP_PICK_Tombstone|r 来收集位于联盟墓地附近的|cRXP_LOOT_|T136222:0|t[塞拉摩回声]|r。
    .collect 215428,1
step
    .train 402855,1
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
step
    .train 402855,1
    .goto Swamp of Sorrows,16.7,53.8
    >>点击 |cRXP_PICK_Grave|r 来收集位于湖边一棵树附近的 |cRXP_LOOT_|T136222:0|t[Swamp Echo]|r。
    .collect 215425,1
step
    .train 402855,1
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 402855,1
    .goto 1415,47.44,19.75,10,0
    .goto 1415,47.45,19.69,5,0
    .goto 1415,47.62,19.59,10 >>进入血色修道院地下城：图书馆 |cRXP_WARN_强烈建议组成 5 人小组进行下一步操作。|r
step
    .train 402855,1
    .cast 437054 >>在战士雕像前使用|T136222:0|t[沼泽回声]。
    .use 215425
step
    .train 402855,1
    .cast 437053 >>在法师雕像前使用|T136222:0|t[阿拉希回响]。
    .use 215428
step
    .train 402855,1
    .cast 436952 >>在圣骑士雕像前使用|T136222:0|t[塞拉摩回声]。
    .use 215425
step
    .train 402855,1
    .cast 437055 >>在牧师雕像前使用|T136222:0|t[墓地回声]。
    .use 215426
step
    .train 402855 >>点击房间中央的橙色残余物以接收 |T135791:0|t|cRXP_FRIENDLY_[伪经顿悟]|r，使用它来学习 |T135936:0|t[疼痛抑制]
    .use 213143
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Helmet
#name 虚空之眼 - 50（艾泽拉斯）

--x shiek: needs better coordinates and travelsteps
step
    #completewith next
    .zone The Hinterlands >>前往: |cRXP_PICK_辛特兰|r
    .train 402864,1
step
    .goto The Hinterlands,58.4,72.7
    >>点击 |cRXP_PICK_|T236407:0|tGlowing Eye|r
    .collect 223334,1 --1/1 Glowing Eye
    .train 402864,1
step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
    .train 402864,1
step
    .goto Blasted Lands,43.8,45.8
    >>点击 |cRXP_PICK_|T236407:0|tPulsating Eye|r
    .collect 223331,1 --1/1 Pulsating Eye
    .train 402864,1
step
    #completewith next
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
    .train 402864,1
step
    .goto Searing Gorge,43.8,45.8
    >>点击 |cRXP_PICK_|T236407:0|tVibrating Eye|r
    .collect 223332,1 --1/1 Vibrating Eye
    .train 402864,1
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    .train 402864,1
step
    .goto Stranglethorn Vale,33,88
    >>点击|cRXP_PICK_|T236407:0|tBaleful Eye|r
    .collect 223333,1 --1/1 Baleful Eye
    .train 402864,1
step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
    .train 402864,1
step
    .goto Feralas,57.2,68.7
    >>点击 |cRXP_PICK_|T236407:0|tBurning Eye|r
    .collect 223337,1 --1/1 Burning Eye
    .train 402864,1
step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
    .train 402864,1
step
    .goto Tanaris,56.4,73.7
    >>点击 |cRXP_PICK_|T236407:0|tOozing Eye|r
    .collect 223335,1 --1/1 Oozing Eye
    .train 402864,1
step
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
    .train 410013,1
step
    .goto Felwood,36.5,55.7
    >>点击|cRXP_PICK_|T236407:0|tPiercing Eye|r
    .collect 223336,1 --1/1 Piercing Eye
    .train 402864,1
step
    #completewith next
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
    .train 402864,1
step
    .goto Azshara,89.8,33.6
    >>目标 |cRXP_FRIENDLY_守望者神殿|r
    .emote KNEEL,223590
    .accept 82316,1 >>接受七眼我寻求......
    .target Shrine of the Watcher
    .train 402864,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Bracers
#title Surge of Light
#name 光之涌动 - 40（塔纳利斯）

-- Surge of Light

step
    #completewith RuneLearned
    +|cRXP_WARN_你只能在塔纳利斯的晚上 9 点至早上 6 点之间获得|r |T135981:0|t[光之涌动] |cRXP_WARN_rune。|r
    +当你想要在此时间跨度之外获取符文时，你可以查看荆棘谷。
    .train 431669,1
step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
    .train 431669,1
step
    .train 431669,1
    >>杀死 |cRXP_ENEMY_Echo of a Lost Soul|r |cRXP_WARN_with Holy or Arcane Spitches/wands|r。拾取它以获得 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of the Lost Tribe|r]
    .collect 221981,1
    .goto Tanaris,52,29
    .mob Echo of a Lost Soul
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_You need TWO meditation buffs: Look for a priest with multiple buffs, /kneel before him, wait for him to /pray for you.|r
    .train 431669 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r] |cRXP_WARN_训练|r |T135981:0|t[光之涌动]
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Bracers
#title Surge of Light
#name 光之涌动 - 40（悲伤沼泽）

-- Surge of Light

step
    #completewith RuneLearned
    +|cRXP_WARN_您只能在晚上 9 点至早上 6 点之间在悲伤沼泽中获得|r |T135981:0|t[光之涌动] |cRXP_WARN_rune。|r
    +当你想要在此时间跨度之外获取符文时，你可以查看荆棘谷。
    .train 431669,1
step
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
    .train 431669,1
step
    .train 431669,1
    >>杀死 |cRXP_ENEMY_Echo of a Lost Soul|r |cRXP_WARN_with Holy or Arcane Spitches/wands|r。拾取它以获得 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of the Lost Tribe|r]
    .collect 221981,1
    .goto Swamp of Sorrows,50,60
    .mob Echo of a Lost Soul
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_You need TWO meditation buffs: Look for a priest with multiple buffs, /kneel before him, wait for him to /pray for you.|r
    .train 431669 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r] |cRXP_WARN_训练|r |T135981:0|t[光之涌动]
]])


RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Bracers
#title Surge of Light
#name 光之涌动 - 40（内陆地区）

-- Surge of Light

step
    #completewith RuneLearned
    +|cRXP_WARN_你只能在晚上 9 点至早上 6 点之间在内陆地区获得|r |T135981:0|t[光之涌动] |cRXP_WARN_rune。|r
    +当你想要在此时间跨度之外获取符文时，你可以查看荆棘谷。
    .train 431669,1
step
    #completewith next
    .zone The Hinterlands>>前往: |cRXP_PICK_辛特兰|r
    .train 431669,1
step
    .train 431669,1
    >>杀死 |cRXP_ENEMY_Echo of a Lost Soul|r |cRXP_WARN_with Holy or Arcane Spitches/wands|r。拾取它以获得 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of the Lost Tribe|r]
    .collect 221981,1
    .goto The Hinterlands,73,68
    .mob Echo of a Lost Soul
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_You need TWO meditation buffs: Look for a priest with multiple buffs, /kneel before him, wait for him to /pray for you.|r
    .train 431669 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r] |cRXP_WARN_训练|r |T135981:0|t[光之涌动]
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Bracers
#title Surge of Light
#name 圣光涌动 - 40 (荆棘谷) 2

-- Surge of Light

step
    #completewith RuneLearned
    +|cRXP_WARN_灵魂只能在血月事件后产生。您也可以禁用该事件并跑到路径点位置|r。
    .train 431669,1
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    .train 431669,1
step
    .train 431669,1
    >>杀死 |cRXP_ENEMY_Echo of a Lost Soul|r |cRXP_WARN_with Holy or Arcane Spitches/wands|r。拾取它以获得 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of the Lost Tribe|r]
    .collect 221981,1
    .goto Stranglethorn Vale,40.0,58.0
    .mob Echo of a Lost Soul
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_You need TWO meditation buffs: Look for a priest with multiple buffs, /kneel before him, wait for him to /pray for you.|r
    .train 431669 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r] |cRXP_WARN_训练|r |T135981:0|t[光之涌动]
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Bracers
#title Surge of Light
#name 圣光涌动 - 40 (荆棘谷) 1

-- Surge of Light

step
    #completewith RuneLearned
    +|cRXP_WARN_您只能在晚上 9 点至早上 6 点之间获得|r |T135981:0|t[光之涌动] |cRXP_WARN_rune。|r
    +当你想要在此时间跨度之外获取符文时，你可以查看荆棘谷 2。
    .train 431669,1
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    .train 431669,1
step
    .train 431669,1
    >>杀死 |cRXP_ENEMY_Echo of a Lost Soul|r |cRXP_WARN_with Holy or Arcane Spitches/wands|r。拾取它以获得 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of the Lost Tribe|r]
    .collect 221981,1
    .goto Stranglethorn Vale,30.0,73.0
    .mob Echo of a Lost Soul
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_You need TWO meditation buffs: Look for a priest with multiple buffs, /kneel before him, wait for him to /pray for you.|r
    .train 431669 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_失落部落的预言|r] |cRXP_WARN_训练|r |T135981:0|t[光之涌动]
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup 披风
#title Binding Heal
#name 束缚治疗 - 58（西瘟疫之地和东瘟疫之地）
#next 牧师种族值 - 60（艾泽拉斯）

step << Alliance
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Alliance
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .accept 84320 >>接受遗失的传家宝
    .target High Priestess Laurena
step << Horde
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step << Horde
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dietrich Praice|r in the Valley of Spirits
    .accept 84405 >>接受遗失的传家宝
    .target Dietrich Praice
step
    #completewith next
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    .goto Western Plaguelands,51.9,82.4,50 >>前往悲伤岭旁边的大墓穴
step
    .goto Western Plaguelands,54.8,81.2
    >>|cRXP_WARN_进入墓穴并向左走。下楼并在右侧的小凹室中寻找一个小木箱。将其抢走以获得|r |T133299:0|t[|cRXP_PICK_传家宝|r]
    .collect 227745,1 --Family Heirloom(1)
step
    .goto Western Plaguelands,53.8,80.2
    >>|cRXP_WARN_前往墓穴底部。从右侧的书架上拾取|r |T133741:0|t[|cRXP_PICK_家庭记录|r] |cRXP_WARN_，并从左侧的桌子上拾取|r |T133735:0|t[|cRXP_PICK_幸存者日志|r] |cRXP_WARN_|r
    .collect 227747,1 --Family Records
    .collect 227748,1 --Survivor Journal
step << Alliance
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Alliance
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .turnin 84320 >>交还遗失的传家宝
    .accept 84321 >>接受光之遗物
    .target High Priestess Laurena
step << Horde
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step << Horde
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dietrich Praice|r in the Valley of Spirits
    .turnin 84405 >>交还遗失的传家宝
    .accept 84406 >>接受光之遗物
    .target Dietrich Praice
step
    #completewith next
    >>|cRXP_WARN_下一个任务需要你从精英区域抢夺一件物品。可以单独完成，但如果你的等级较低或装备不太好，可以考虑找人帮你|r
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    .goto Western Plaguelands,48.2,21.7,50 >>前往壁炉谷，|cRXP_WARN_请记住，这是一个精英区域|r
step
    .goto Western Plaguelands,42.2,18.1
    >>|cRXP_WARN_进入壁炉谷的市政厅，与位于讲台上的|r |cRXP_PICK_猩红账本|r |cRXP_WARN_互动。小心，因为该区域充满了精英怪物|r
    .turnin 84406 >>交还光之遗物 << Horde
    .turnin 84321 >>交还光之遗物 << Alliance
    .accept 84322 >>接受猩红研究
step
    #completewith next
    >>|cRXP_WARN_下一个任务需要你从精英区域抢夺一件物品。可以单独完成，但如果你的等级较低或装备不太好，可以考虑找人帮你|r
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step
    .goto Eastern Plaguelands,77.5,81.7,50 >>前往提尔之手，|cRXP_WARN_请记住，这是一个精英区域|r
step
    .goto Eastern Plaguelands,83.6,78.2
    >>|cRXP_WARN_|r |T237537:0|t[神圣专长] |cRXP_WARN_ 的符文也位于 Tyr's Hand 中，如果你现在不想得到它，请跳过此步骤|r 
    >>|cRXP_WARN_如果你想得到它，请前往地图上标记的建筑物图书馆侧楼，寻找位于书架顶部的一本书。抢夺它以获取符文。请记住，你不能在战斗中抢夺它|r
    >>|cRXP_WARN_你可以清除房间里的所有怪物，或者死在书本旁边，然后在怪物视线之外的地方释放，这样就可以掠夺符文，而不必杀死任何东西|r
    .collect 226418,1 --Rune of Holy Specialization
    .train 453702,1
step
    #completewith next
    .train 453702 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神圣专长符文|r] 来训练 |T237537:0|t[神圣专长]
    .train 453702,1
    .itemcount 226418,1
step
    .goto Eastern Plaguelands,83.6,78.2
    >>|cRXP_WARN_进入钟楼，前往顶层。与那里的锁箱互动|r
    .turnin 84322 >>提交猩红研究
    .accept 84323 >>接受奖品
step
    .goto Eastern Plaguelands,83.6,78.2
    >>杀死提尔之手中的猩红色怪物。掠夺它们以获得 |T134245:0|t[|cRXP_LOOT_Artifact Storage Key|r]
    >>|cRXP_WARN_你可以跳过收集钥匙的步骤，直接找一个开锁技能达到 175 以上的盗贼，因为他们也可以帮你打开箱子。如果你宁愿找盗贼也不愿收集钥匙，那就跳过这一步|r
    .collect 228912,1 --Artifact Storage Key
    .itemcount 132874,<1 --Skips if you get the Shard of Light without the key
step
    >>使用 |T134245:0|t[|cRXP_LOOT_Artifact Storage Key|r] 解锁 |T133876:0|t[|cRXP_LOOT_Puzzle Box|r] 或让盗贼用撬锁技术帮你打开。抢劫它以获得 |T132874:0|t[|cRXP_LOOT_Shard of Light|r]
    .collect 227938,1 --Shard of Light(1)
step << Alliance
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Alliance
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .turnin 84323 >>交出奖品
    .target High Priestess Laurena
step << Horde
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step << Horde
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dietrich Praice|r in the Valley of Spirits
    .turnin 84323 >>交出奖品
    .target Dietrich Praice
step
    .train 402853 >>使用 |T135791:0|t[|cRXP_FRIENDLY_Jubilant Epiphany|r] 来训练 |T135883:0|t[|cRXP_FRIENDLY_Binding Heal|r]
    .use 228123
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup 披风
#title Vampiric Touch
#name 吸血鬼之触 - 60（恶魔坠落峡谷地下城）

step
    #completewith next
    >>|T135978:0|t[|cRXP_FRIENDLY_Vampiric Touch|r] 符文由 赛季服 新增地下城 Demon Fall Canyon 的最后一个 Boss 掉落
    .zone Felwood >>|cRXP_WARN_前往: |cRXP_PICK_费伍德森林|r|r
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    .goto Felwood,51.4,82.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Shadowtooth Emissary|r
    .accept 84384 >>接受恶魔的欺骗
    .target Shadowtooth Emissary
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    #completewith next
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    .goto Winterspring,65.6,21.4
    >>在永望镇北部寻找 |cRXP_ENEMY_Berserk 猫头鹰beasts|r。杀死它们并掠夺 |T237413:0|t[|cRXP_LOOT_猫头鹰beast Pineal Glands|r]
    .complete 84384,1
    .mob Berserk 猫头鹰beast
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    .goto Felwood,51.4,82.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Shadowtooth Emissary|r
    .turnin 84384 >>交出恶魔欺骗
    .target Shadowtooth Emissary
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    #completewith next
    +在你的任意饰品槽中装备 |T136232:0|t[|cRXP_FRIENDLY_Shadowtooth Illusion Ward|r]。你需要装备它才能进入地下城
    .use 228172
    .itemcount 228172,<1
step
    >>|cRXP_WARN_|r |T135978:0|t[|cRXP_FRIENDLY_Vampiric Touch|r] |cRXP_WARN_drops 符文来自恶魔坠落峡谷的最后一个 Boss，恶魔坠落峡谷是 赛季服 中新增的地下城。前往灰谷时，开始寻找一个团队|r
    >>如果你要坐飞机，那就飞到艾萨拉的塔伦德里斯岗哨，而不是阿斯特兰纳。那里离地下城入口更近 << Alliance
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step
    .goto Ashenvale,84.5,75.0,50 >>前往恶魔坠落峡谷地下城的入口
step
    >>清理地下城。|T135791:0|t[|cRXP_FRIENDLY_Aperitive Epiphany|r] 会教你 |T135978:0|t[|cRXP_FRIENDLY_Vampiric Touch|r] 会从地下城的最后一个 Boss |cRXP_ENEMY_Hellscream's Phantom|r 处掉落。|cRXP_WARN_一定要从他那里抢走符文！|r
    .collect 228126,1 --Apperitive Epiphany
    .mob Hellscream's Phantom
step
    .train 402857 >>使用 |T135791:0|t[|cRXP_FRIENDLY_Aperitive Epiphany|r] 来训练 |T135978:0|t[|cRXP_FRIENDLY_Vampiric Touch|r]
    .use 228126
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Extras
#title Priest Racials
#name 牧师种族值 - 60（艾泽拉斯）


step
    #completewith next
    >>|cRXP_WARN_额外的牧师能力是全服务器解锁的。这意味着如果有人已经在您的服务器上完成了这项任务，您可以跳过整个任务线，直接前往卡拉赞训练您的新种族能力。如果不是这种情况，您可以使用以下指南成为为您的服务器解锁该能力的人！|r
    .zone Deadwind Pass >>前往: |cRXP_PICK_逆风小径|r
step
    .goto Deadwind Pass,40.8,78.4
    >>前往卡拉赞旁边的一座小神殿
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Divine Apprehension|r at a shrine next to Karazhan to pick which racial ability you would like to choose
    .target Divine Apprehension
step
    #completewith PreQStart
    +这是全服务器解锁额外牧师种族的任务链的开始。|cRXP_WARN_很有可能它已经在您的服务器上完成，您不需要执行以下操作。仅当您想尝试该链或您知道它尚未解锁时才继续执行|r
step
    #completewith QStart
    +|cRXP_WARN_要开始此任务，您需要先完成授予|r |T135883:0|t[|cRXP_FRIENDLY_Binding Heal|r]|cRXP_WARN_的任务线。您可以在斗篷符文部分找到相关指南|r
    .train 402853,1
step
    #label PreQStart
    .goto Eastern Plaguelands,48.1,24.0
    >>|cRXP_WARN_要完成此链中的第一个任务，您需要 4|r |T134855:0|t[|cRXP_LOOT_斯坦索姆圣水|r] |cRXP_WARN_以及可从拍卖行购买的其他材料。寻找一个团队来运行斯坦索姆（亡灵）地下城|r
    >>|cRXP_WARN_进入后，寻找并掠夺散落在副本各处的地面上的补给箱。它们可以装圣水，也可以是诱饵，用来对付敌人|r
    .collect 13180,4 --Stratholme Holy Water(4)
step << Alliance
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Alliance
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师亚克森|r
    >>从拍卖行购买 6 |T133682:0|t[|cRXP_LOOT_厚符文布绷带|r]、4 |T134834:0|t[|cRXP_LOOT_特效治疗药水|r] 和 8 |T132834:0|t[|cRXP_LOOT_巨蛋|r]。您需要用它们和您已收集的 |T134855:0|t[|cRXP_LOOT_斯坦索姆圣水|r] 完成此链中的第一个任务
    .collect 14530,6 --Heavy runecloth bandage (6)
    .collect 13446,4 --Major Healing Potion (4)
    .collect 12207,8 --Giant Egg(8)
    .collect 13180,4 --Stratholme Holy Water(4)
    .target Auctioneer Jaxon
step << Alliance
    #label QStart
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .accept 84324 >>接受外交提议
    .turnin 84324 >>提出外交提议
    .target High Priestess Laurena
step << Horde
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step << Horde
    .goto Orgrimmar,55.59,62.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thathung|r
    >>从拍卖行购买 6 |T133682:0|t[|cRXP_LOOT_厚符文布绷带|r]、4 |T134834:0|t[|cRXP_LOOT_特效治疗药水|r] 和 8 |T132834:0|t[|cRXP_LOOT_巨蛋|r]。您需要用它们和您已收集的 |T134855:0|t[|cRXP_LOOT_斯坦索姆圣水|r] 完成此链中的第一个任务
    .collect 14530,6 --Heavy runecloth bandage (6)
    .collect 13446,4 --Major Healing Potion (4)
    .collect 12207,8 --Giant Egg(8)
    .collect 13180,4 --Stratholme Holy Water(4)
    .target Thathung
step << Horde
    #label QStart
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dietrich Praice|r in the Valley of Spirits
    .accept 84408 >>接受外交提议
    .turnin 84408 >>提出外交提议
    .target Dietrich Praice
step
    #completewith next
    >>|cRXP_WARN_对于任务的下一部分，你需要找到一个与任务线相同的对立派系牧师才能继续前进|r
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step
    .goto Eastern Plaguelands,47,58
    >>|cRXP_WARN_前往位于 EPL 的 |r |cRXP_FRIENDLY_合作神殿|r |cRXP_WARN_。与敌对阵营的牧师互相伤害，然后使用 |r |T134918:0|t[|cRXP_FRIENDLY_利他守卫|r] |cRXP_WARN_物品互相治疗|r
    >>如果操作正确，|cRXP_FRIENDLY_Shrine of Cooperation|r 将为你提供任务，接受它
    .accept 84325 >>接受合作神殿 << Alliance
    .accept 84410 >>接受合作神殿 << Horde
    .use 228130
step << Alliance
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Alliance
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师亚克森|r
    >>从拍卖行购买 2 |T134459:0|t[|cRXP_LOOT_Arcanite Bars|r]、2 |T134086:0|t[|cRXP_LOOT_Blood of the Mountain|r] 和 3 |T134132:0|t[|cRXP_LOOT_Blue Sapphires|r]。您很快就会需要它们来完成任务。这些物品可能很贵
    .collect 12360,2 --Arcanite Bar(2)
    .collect 11382,2 --Blood of the Mountain(2)
    .collect 12361,3 --Blue Sapphire(3)
    .target Auctioneer Jaxon
step << Alliance
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .turnin 84325 >>交至合作神殿
    .accept 84326 >>接受外交官戒指
    .turnin 84326 >>交出外交官戒指
    .accept 84327 >>接任务: |cRXP_LOOT_外交任务|r
    .target High Priestess Laurena
step << Horde
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step << Horde
    .goto Orgrimmar,55.59,62.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thathung|r
    >>从拍卖行购买 2 |T134459:0|t[|cRXP_LOOT_Arcanite Bars|r]、2 |T134086:0|t[|cRXP_LOOT_Blood of the Mountain|r] 和 3 |T134132:0|t[|cRXP_LOOT_Blue Sapphires|r]。您很快就会需要它们来完成任务。这些物品可能很贵
    .collect 12360,2 --Arcanite Bar(2)
    .collect 11382,2 --Blood of the Mountain(2)
    .collect 12361,3 --Blue Sapphire(3)
    .target Thathung
step << Horde
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dietrich Praice|r in the Valley of Spirits
    .turnin 84410 >>交至合作神殿
    .accept 84411 >>接受外交官戒指
    .turnin 84411 >>交出外交官戒指
    .accept 84412 >>接任务: |cRXP_LOOT_外交任务|r
    .target Dietrich Praice
step << Horde
    #completewith next
    >>|cRXP_WARN_要完成此任务，您需要再次找到敌对阵营的牧师，并让他们在您靠近暴风城大门时对您使用|r |T133396:0|t[|cFF0070FF外交官戒指|r] |cRXP_WARN_。这样一来，城市守卫就不会再攻击您，让您安全进入敌方首都|r
    >>|cRXP_WARN_请记住，敌对阵营的玩家仍然可以在 PvP 服务器上攻击您！|r
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
step << Horde
    .goto Stormwind City,38.8,26.6
    >>让敌对阵营的牧师对你使用 |T133396:0|t[|cFF0070FF外交官戒指|r]，这样城市卫兵就不会攻击你并前往暴风城大教堂。|cRXP_WARN_你仍然可能受到其他玩家的攻击！|r
    >>|cRXP_WARN_敌对派系的牧师必须护送你去见任务给予者，否则你将失去外交豁免权|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .turnin 84412 >>交出外交使团
    .accept 84413 >>接受修复碎片
    .target High Priestess Laurena
step << Alliance
    #completewith next
    >>|cRXP_WARN_要完成此任务，您需要再次找到敌对阵营的牧师，并让他们在您靠近奥格瑞玛大门时对您使用|r |T133396:0|t[|cFF0070FF外交官戒指|r] |cRXP_WARN_。这样一来，城市守卫就不会再攻击您，让您安全进入敌方首都|r
    >>|cRXP_WARN_请记住，敌对阵营的玩家仍然可以在 PvP 服务器上攻击您！|r
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Alliance
    .goto Orgrimmar,35.8,87.2
    >>让敌对阵营的牧师对你使用他们的 |T133396:0|t[|cFF0070FF外交官戒指|r]，这样城市守卫就不会攻击你并前往精神之谷。|cRXP_WARN_你仍然可能受到其他玩家的攻击！|r
    >>|cRXP_WARN_敌对派系的牧师必须护送你去见任务给予者，否则你将失去外交豁免权|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dietrich Praice|r in the Valley of Spirits
    .turnin 84327 >>交任务: |cRXP_FRIENDLY_外交任务|r
    .accept 84328 >>接受修复碎片
    .target Dietrich Praice
step
    #completewith next
    >>|cRXP_WARN_开始寻找厄运之槌西部地下城的队伍，下一个任务你需要杀死|r |cRXP_ENEMY_Magister Kalendris|r |cRXP_WARN_其中一个地下城首领|r
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
    .goto Feralas,59.1,43.2,100 >>进入厄运之槌区域
step
    .goto Feralas,60.4,30.2
    >>进入厄运之槌西部并杀死 |cRXP_ENEMY_Magister Kalendris|r。从他身上搜刮书籍 |T133737：0|吨[|cRXP_LOOT_Applied Divinity|r]。他位于地下城的幽灵区域
    .collect 227912,1
step << Horde
    #completewith next
    >>|cRXP_WARN_要完成此任务，您需要再次找到敌对阵营的牧师，并让他们在您靠近暴风城大门时对您使用|r |T133396:0|t[|cFF0070FF外交官戒指|r] |cRXP_WARN_。这样一来，城市守卫就不会再攻击您，让您安全进入敌方首都|r
    >>|cRXP_WARN_请记住，敌对阵营的玩家仍然可以在 PvP 服务器上攻击您！|r
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
step << Horde
    .goto Stormwind City,38.8,26.6
    >>让敌对阵营的牧师对你使用 |T133396:0|t[|cFF0070FF外交官戒指|r]，这样城市卫兵就不会攻击你并前往暴风城大教堂。|cRXP_WARN_你仍然可能受到其他玩家的攻击！|r
    >>|cRXP_WARN_敌对派系的牧师必须护送你去见任务给予者，否则你将失去外交豁免权|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .turnin 84413 >>交修复碎片
    .accept 84329 >>接受召集会
    .target High Priestess Laurena
step << Alliance
    #completewith next
    >>|cRXP_WARN_要完成此任务，您需要再次找到敌对阵营的牧师，并让他们在您靠近奥格瑞玛大门时对您使用|r |T133396:0|t[|cFF0070FF外交官戒指|r] |cRXP_WARN_。这样一来，城市守卫就不会再攻击您，让您安全进入敌方首都|r
    >>|cRXP_WARN_请记住，敌对阵营的玩家仍然可以在 PvP 服务器上攻击您！|r
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Alliance
    .goto Orgrimmar,35.8,87.2
    >>让敌对阵营的牧师对你使用他们的 |T133396:0|t[|cFF0070FF外交官戒指|r]，这样城市守卫就不会攻击你并前往精神之谷。|cRXP_WARN_你仍然可能受到其他玩家的攻击！|r
    >>|cRXP_WARN_敌对派系的牧师必须护送你去见任务给予者，否则你将失去外交豁免权|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dietrich Praice|r in the Valley of Spirits
    .turnin 84328 >>交修复碎片
    .accept 84329 >>接受召集会
    .target Dietrich Praice
step
    #completewith next
    .zone Deadwind Pass >>前往: |cRXP_PICK_逆风小径|r
step
    .goto Deadwind Pass,40.8,78.4
    >>前往卡拉赞旁边的一座小神殿
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maethra Slagheart|r at a shrine next to Karazhan
    .turnin 84329 >>交出召集会
step
    +完成上述任务即可完成任务线，并解锁在服务器范围内训练其他种族牧师的能力
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup 披风
#title Soul Warding
#name 灵魂守护 - 60（斯坦索姆）

step
    #completewith next
    >>|cRXP_WARN_为了完成这个符文，你需要完成斯坦索姆地下城中的几个任务（生死两面）。开始寻找一个团队|r
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step
    .goto Eastern Plaguelands,47.8,24.2
    >>进入斯坦索姆
    >>|cRXP_WARN_请仔细阅读本节，因为此符文任务有点不寻常|r
    >>为了获得符文，你需要从斯坦索姆的 Boss 那里收集 3 个精华。拥有精华的 Boss 是 |cRXP_WARN_RANDOM 且每个地下城 ID 都不同|r。为了知道你这次冒险中哪些 Boss 拥有精华，你需要在地下城活动侧的猩红建筑内的柱子上找到线索
    >>要收集精华，你需要 3 个 |T134799:0|t[|cRXP_LOOT_Stratholme Shadow Jars|r]，它们从地下城中的 [|cRXP_PICK_Postbox Parcels|r] 掉落，要打开 [|cRXP_PICK_Postboxes|r]，首先你需要杀死 |cRXP_ENEMY_Stratholme Courier|r 以从他那里获得 |T134237:0|t[|cRXP_LOOT_Postbox 按键|r]
    >>收集完所有精华后，你必须带着线索回到柱子那里，用与它们给出的提示相对应的精华激活它们。这会在柱子旁边产生一个球体，你必须掠夺它才能获得符文
    +|cRXP_WARN_阅读完以上内容后，如果您想要查看有关哪个线索对应哪个老板的更多详细信息，请单击此处。如果需要，您可以随时返回此步骤|r
step
    >>|cRXP_WARN_以下是线索和它们对应的boss：|r
    >>在死者之中，这个凡人与侍僧和冰冷的咒语共存=苍白的玛勒基
    >>被诅咒守卫塔楼的幽灵财富和权力无法带来安慰 = 阿纳斯塔里男爵夫人
    >>古代王国重现。将一个主人换成另一个主人 = 尼鲁布恩坎
    >>由肉体构成，是被遗弃者最优秀的猎杀者=吞噬者拉姆斯坦
    >>人民在最需要帮助的时候指望他能带领人民 = 巴瑟拉斯法官
    >>邪恶的恶毒斗士，巨大的恐怖守卫着他的宫殿=瑞文戴尔男爵
    >>神圣的愤怒净化了罪恶，但阴影却潜伏在内心。= 巴纳扎尔
    >>硫磺的气味弥漫在房间里。这个狂热分子用一声隆隆声迎接你。= 炮手威利
    +|cRXP_WARN_如果您想查看完成此任务的推荐有效步骤顺序，请单击此处。如果需要，您可以随时返回此步骤再次阅读线索|r
step
    >>|cRXP_WARN_执行此任务时的有效工作顺序如下：|r
    >>1. 从地下城的生活区开始 
    >>2. 掠夺三个 [|cRXP_PICK_Postbox Parcels|r] 以获得 |T134799:0|t[|cRXP_LOOT_Stratholme Shadow Jars|r]，这些罐子都是独一无二的，所以让不同的玩家分别捡起它们 
    >>3. 清理基座房间，找出哪些老板拥有你 ID 中的精华 
    >>4. 在地下城中前进时收集所有精华 
    >>5. 返回基座室，用其精华激活每一个 
    >>6. 掠夺符文生成的球体
    .collect 228124,1 --Oneiric Epiphany
step
    .train 402850 >>使用 |T135791:0|t[|cRXP_FRIENDLY_Oneiric Epiphany|r] 来训练 |T135948:0|t[|cRXP_FRIENDLY_Soul Warding|r]
    .use 228124
]])
