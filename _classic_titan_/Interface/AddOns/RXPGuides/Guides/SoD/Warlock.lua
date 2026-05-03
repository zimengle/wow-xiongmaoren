RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 鬼魂 - 3（艾尔文森林）
#title Haunt

step << Warlock
    #season 2
    .goto Elwynn Forest,52.544,51.922
    >>打开地面上的 |cRXP_PICK_Defias Stashbox|r。拾取其中的 |T134419:0|t[|cRXP_FRIENDLY_Rune of Haunting|r]
    .collect 205230,1 -- Rune of Haunting (1)
    .train 403919,1
step << Warlock
    #season 2
    #label RoH
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_鬼影符文|r] |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 鬼影]
    .use 205230
    .itemcount 205230,1
    .train 403919,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 鬼魂出没-1（丹莫洛）
#title Haunt

step << Warlock
    #season 2
    .goto Dun Morogh,26.733,72.552
    >>打开地面上的 |cRXP_PICK_Rockjaw 储物柜|r。拾取其中的 |T134419:0|t|cRXP_LOOT_[鬼影符文]|r
    .collect 205230,1 -- Rune of Haunting (1)
    .train 403919,1
step << Warlock
    #season 2
    .train 403919 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[鬼影符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 鬼影]
    .use 205230
    .itemcount 205230,1 -- Rune of Haunting (1)
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 鬼影重重-2（杜隆塔尔）
#title Haunt


    --Rune of Haunt

step << Orc
    #season 2
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纳托克|r
    .accept 77586 >>接受偷来的电力
    .target Nartok
    .train 403919,1
step
    #season 2
    .goto Durotar,42.99,54.43
    >>掠夺 |cRXP_PICK_Waterlogged Stashbox|r 以获得洞穴内的 |T134419:0|t[|cRXP_FRIENDLY_Rune of Haunting|r]
    .collect 205230,1 --Rune of Haunting (1)
    .train 403919,1
step
    #season 2
    .train 403919 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[鬼影符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 鬼影]
    .use 205230
    .itemcount 205230,1 -- Rune of Haunting (1)
step << Orc
    #season 2
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_迈安|r
    .turnin 77586 >>交出偷来的电力
    .target Nartok
    .isOnQuest 77586
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 困扰 - 2（提瑞斯法林地）
#title Haunt


    --Rune of Haunt

step << Undead
    #season 2
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马克希米林|r
    .accept 77672 >>接受失落的符文
    .target Maximillion
step
    #season 2
    .goto Tirisfal Glades,24.60,59.45
    >>拾取洞穴内的 |cRXP_PICK_Lost Stache|r 以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Haunting|r]
    .collect 205230,1 --Rune of Haunting (1)
    .train 403919,1
step
    #season 2
    .cast 402265 >>使用 |T134939:0|t[|cRXP_FRIENDLY_Spell 注释：CALE ENCI|r]
    .use 205230
    .train 403919,1
step << Undead
    #season 2
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马克希米林|r
    .turnin 77672 >>交出失落的符文
    .target Maximillion


]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 灵魂虹吸-13（杜隆塔尔）
#title Soul Siphon

step
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step
    .train 403920,1
    .goto Durotar,48.60,15.28
    .collect 205020,1 >>对小动物使用 |T136163:0|t[吸取灵魂] 来获得 |T134095:0|t[纯净灵魂碎片]
step
    --Wowhead npc 3203 also possible, maybe better?
    .train 403920,1
    >>对 |cRXP_ENEMY_Gazz'uz|r (在洞穴内) 使用 |T136163:0|t[吸取灵魂] 来获得 |T134085:0|t[被污染的灵魂碎片]。|cRXP_WARN_你不必杀死他，可以从下面吸取他的灵魂|r
    .goto Durotar,51.47,9.73
    .collect 205019,1
    .mob Gazz'uz
step
    .train 403920,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darmak Bloodhowl|r
    .goto Durotar,54.6,41.6
    .collect 205022,1
    .skipgossip 208226,1
    .target Darmak Bloodhowl
step
    .use 205022
    .itemcount 205022,1
    .train 403920 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_灵魂虹吸符文|r] |cRXP_WARN_训练|r |T136169:0|t[灵魂虹吸]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 灵魂虹吸 - 9（提瑞斯法林地）
#title Soul Siphon

step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    #completewith next
    .train 403920,1
    .collect 205020,1 >>对小动物使用 |T136163:0|t[吸取灵魂] 来获得 |T134095:0|t[纯净灵魂碎片]
step
    .train 403920,1
    >>对 |cRXP_ENEMY_Maggot Eye|r 使用 |T136163:0|t[Drain Soul] 来获得 |T134085:0|t[Tainted Soul Shard]。|cRXP_WARN_你不必杀死他。|r
    .goto Tirisfal Glades,58.6,31.6
    .collect 205019,1
    .mob Maggot Eye
step
    .train 403920,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Denton Bleakway|r in Undercity
    .goto Undercity,84.2,25.8
    .collect 205022,1
    .skipgossip 208682,1
    .target Denton Bleakway
step
    .use 205022
    .itemcount 205022,1
    .train 403920 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_灵魂虹吸符文|r] |cRXP_WARN_训练|r |T136169:0|t[灵魂虹吸]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 恶魔战术 - 4（提瑞斯法林地）
#title Demonic Tactics

step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 416009,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Dead Acolyte|r 互动。打开 |T133625:0|t[Acolyte's Knapsack]
    .goto Tirisfal Glades,76.61,44.87
    .use 205364
    .collect 205181,1
    .collect 208224,1
    .skipgossip 208927,1
    .mob Dead Acolyte
step
    .train 416009,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁伯特·鲍什|r
    .goto Tirisfal Glades,61.6,52.4
    .collect 205182,1
    .skipgossip 2127,2
    .target Rupert Boch
step
    .train 416009,1
    >>使用符文石旁边的 |T133447:0|t[无力神器]。|cRXP_WARN_之后你有 10 分钟的时间到达幽暗城（看看你的减益效果）|r
    .goto Tirisfal Glades,76.61,44.87
    .use 205182
    .collect 205183,1
step
    .train 416009,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carentin Halgar|r in Undercity
    .goto Undercity,85.0,25.6
    .collect 205215,1
    .skipgossip 5675,1
    .target Carendin Halgar
step
    .use 205215
    .itemcount 205215,1
    .train 416009 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_战术符文|r] |cRXP_WARN_进行训练|r |T136150:0|t[恶魔战术]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 恶魔优雅 - 8（杜隆塔尔）
#title Demonic Grace

step
    #completewith DemonicGraceDurotarTome
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step
    #completewith DemonicGraceDurotarSkull
    >>杀死 |cRXP_ENEMY_Makrura|r。掠夺他们以获得 |T133571:0|t[Makrura Legs]
    .collect 207732,1
    .mob 龙虾
    .mob 龙虾壳皮
step
    #label DemonicGraceDurotarTome
    >>杀死 |cRXP_ENEMY_被诅咒的巨魔s|r 和 |cRXP_ENEMY_巫毒巨魔s|r。从他们身上拾取 |T133733:0|t[不祥之书]
    .goto Durotar,67.2,85.6
    .collect 207731,1
    .mob 被诅咒的巨魔
    .mob 巫毒巨魔
step
    #label DemonicGraceDurotarSkull
    >>杀死 |cRXP_ENEMY_库尔提拉斯人类|r。掠夺他们以获得 |T133730:0|t[库尔提拉斯骷髅]
    .goto Durotar,58.6,56.0
    .collect 207733,1
    .mob 库尔提拉斯水手
    .mob 库尔提拉斯海军陆战队
step
    #loop
    .goto Durotar,61.0,43.0,50,0
    .goto Durotar,60.8,70.6,50,0
    .goto Durotar,51.6,84.6,50,0
    .goto Durotar,60.8,70.6,50,0
    >>杀死 |cRXP_ENEMY_Makrura|r。掠夺他们以获得 |T133571:0|t[Makrura Legs]
    .collect 207732,1
    .mob 龙虾
    .mob 龙虾壳皮
step
    .train 425477,1
    *|cRXP_WARN_CAREFUL: Others can tag your demon which means that you would have to farm the reagents again|r
    >>进入下水道。在召唤之环处使用 |T133733:0|t[不祥之书]。杀死 |cRXP_WARN_THE ELITE（可能寻求帮助）|r |cRXP_ENEMY_Soboz|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_恩典符文|r]
    .goto Durotar,67.45,87.83
    .collect 204912,1
    .mob Soboz
step
    .use 204912
    .itemcount 204912,1
    .train 425477 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_恩典符文|r] |cRXP_WARN_进行训练|r |T236293:0|t[恶魔恩典]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 恶魔之恩 - 8（提瑞斯法林地）
#title Demonic Grace

step
    .train 425477,1
    #completewith DemonicGraceTirisfalGladesTome
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 425477,1
    #completewith DemonicGraceTirisfalGladesBlood
    >>杀死 |cRXP_ENEMY_Darkhounds|r。掠夺它们以获得 |T133726:0|t[猎犬颚骨]
    .collect 207973,1
    .mob Cursed Darkhound
    .mob Decrepit Darkhound
    .mob Ravenous Darkhound
step
    .train 425477,1
    #label DemonicGraceTirisfalGladesTome
    >>击杀 |cRXP_ENEMY_暗眼骨法师s|r。拾取他们以获得 |T133733:0|t[不祥之书]
    .goto Tirisfal Glades,47.6,36.4
    .collect 207974,1
    .mob 暗眼骨法师
step
    .train 425477,1
    #label DemonicGraceTirisfalGladesBlood
    >>杀死 |cRXP_ENEMY_Rot Hides|r。从中获取 |T133730:0|t[豺狼人之血]
    .goto Tirisfal Glades,58.6,34.6
    .collect 204906,1
    .mob Rot Hide Mongrel
    .mob Rot Hide Gnoll
    .mob Rot Hide Graverobber
step
    .train 425477,1
    #loop
    .goto Tirisfal Glades,73.4,52.8,50,0
    .goto Tirisfal Glades,59.4,60.2,50,0
    .goto Tirisfal Glades,44.4,58.4,50,0
    .goto Tirisfal Glades,42.0,43.0,50,0
    >>杀死 |cRXP_ENEMY_Darkhounds|r。掠夺它们以获得 |T133726:0|t[猎犬颚骨]
    .collect 207973,1
    .mob Cursed Darkhound
    .mob Decrepit Darkhound
    .mob Ravenous Darkhound
step
    .train 425477,1
    *|cRXP_WARN_CAREFUL: Others can tag your demon which means that you would have to farm the reagents again|r
    >>进入下水道。在召唤之环处使用 |T133733:0|t[不祥之书]。杀死 |cRXP_WARN_THE ELITE（可能寻求帮助）|r |cRXP_ENEMY_Soboz|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_恩典符文|r]
    .goto Undercity,15.1,31.3,20,0
    .goto Undercity,24.11,41.59
    .collect 204912,1
    .mob Soboz
step
    .use 204912
    .itemcount 204912,1
    .train 425477 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_恩典符文|r] |cRXP_WARN_进行训练|r |T236293:0|t[恶魔恩典]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文书指南
-- #subgroup Chest << Mage
#subgroup Gloves << Warlock
-- #name 倦怠 - 8（提瑞斯法林地） << Mage
#name 混乱之箭 - 8（提瑞斯法林地） << Warlock
#title Chaos Bolt << Warlock
--Permok: Dont load it for mages for now

step << Mage
    >>从试剂供应商处购买一个 (或多个) |T135933:0|t[理解咒]
    .collect 211779,1
step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 403925,1 << Warlock
    .train 401759,1 << Mage
    .goto Tirisfal Glades,66.3,40.0
    >>释放 |cRXP_ENEMY_Frozen Murloc|r |cRXP_WARN_使用火焰法术|r。从他身上搜刮 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Burnout|r] << Mage
    >>释放 |cRXP_ENEMY_Frozen Murloc|r |cRXP_WARN_by using fire pells|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_Rune of Chaos Bolt|r] << Warlock
    *|cRXP_WARN_At low levels you won't be able to free it alone, search for another Warlock of Mage|r
    .collect 205228,1 << Warlock
    .collect 203748,1 << Mage
    .mob Frozen Murloc
step
    .use 205228 << Warlock
    .use 203748 << Mage
    .itemcount 205228,1 << Warlock
    .itemcount 203748,1 << Mage
    .collect 211779,1 >>您需要从试剂供应商处获得 |T135933:0|t[理解咒] 才能使用该物品 << Mage
    .train 403925 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_混乱之箭符文|r] |cRXP_WARN_进行训练|r |T236291:0|t[混乱之箭]  << Warlock
    .train 401759 >>使用 |T134939:0|t[|cRXP_FRIENDLY_Spell 注释：Burnout|r] |cRXP_WARN_to train|r |T236207:0|t[Burnout] << Mage
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 火湖 - 25（希尔斯布莱德丘陵）
#title Lake of Fire

step
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r, 可以从幽暗城穿过银松森林 << Horde
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r << Alliance
step
    .train 403937,1
    #loop
    .goto Hillsbrad Foothills,58.2,19.6,40,0
    .goto Hillsbrad Foothills,57.5,36.4,50,0
    .goto Hillsbrad Foothills,51.1,46.4,40,0
    >>寻找 |cRXP_FRIENDLY_Zixil|r。他在塔伦米尔和南海镇之间巡逻。从他那里购买 |cRXP_WARN_1 金币|r 的 |T133709:0|t[爆破炸药]
    .collect 211487,1
    .target Zixil
step
    .train 403937,1
    >>使用 |T133709:0|t[拆除炸药] 摧毁 |cRXP_PICK_Rubble|r。掠夺地面上的 |cRXP_PICK_Storage Locker|r，获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Fires Wake|r]
    .goto Hillsbrad Foothills,79.7,41.0
    .collect 211476,1
step
    .use 211476
    .itemcount 211476,1
    .train 403937 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_火焰唤醒符文|r] |cRXP_WARN_训练|r |T135826:0|t[火湖]
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup Bracers
#name 焚化 - 22（赤脊山）
#title Incinerate

step
    #completewith next
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
step
    .goto Redridge Mountains,74.0,82.2,60,0
    .goto Redridge Mountains,77.6,86.6,50,0
    .goto Redridge Mountains,76.8,82.2
    >>杀死 |cRXP_ENEMY_Incinerator Gar'im|r |cRXP_WARN_(lvl 23 elite)|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_Rune of Incinerate|r]
    .collect 211477,1
    .unitscan Incinerator Gar'im
    .train 416015,1
step
    .use 211477
    .itemcount 211477,1
    .train 416015 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_焚化符文|r] |cRXP_WARN_进行训练|r |T135789:0|t[焚化]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 通灵大师-12（贫瘠之地）
#title Master Channeler

step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 403932,1
    >>|cRXP_WARN_前往荆棘祭坛|r。施放|T136126:0|t[生命分流]直到你快要死了。然后对你的宠物施放|T136168:0|t[生命漏斗]，让它死去并获得|T134419:0|t[|cRXP_FRIENDLY_引导符文|r]
    *|cRXP_WARN_You will be revived immediately after dying|r
    .goto The Barrens,58.2,26.7
    .cast 1454
    .cast 735
    .collect 208750,1
step
    .use 208750
    .itemcount 208750,1
    .train 403932 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_通灵符文|r] |cRXP_WARN_进行训练|r |T136168:0|t[通灵大师]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 引导大师-14（银松森林）
#title Master Channeler

step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .train 403932,1
    >>进入路径点位置的洞穴。对 |cRXP_ENEMY_Sadistic Fiend|r 使用 |T136225:0|t[鲁莽诅咒]。杀死它并拾取 |T134419:0|t[|cRXP_FRIENDLY_引导符文|r]
    .goto Silverpine Forest,56.6,46.4
    .collect 208750,1
    .mob Sadistic Fiend
step
    .use 208750
    .itemcount 208750,1
    .train 403932 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_通灵符文|r] |cRXP_WARN_进行训练|r |T136168:0|t[通灵大师]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 暗影箭雨 - 16（贫瘠之地）
#title Shadow Bolt Volley

step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 403936,1
    >>对 |cRXP_ENEMY_Supervisor Lugwizzle|r 使用 |T136163:0|t[Drain Soul] (|cRXP_ENEMY_Overseer Glibby|r 可能也有效) 直到你获得 |T134105:0|t[Soul of Greed]
    *|cRXP_WARN_You don't need the tag|r
    .goto The Barrens,56.6,8.2
    .collect 208743,1
    .mob Supervisor Lugwizzle
    .mob Overseer Glibby
step
    .train 403936,1
    >>点击 |cRXP_PICK_Hungry Idol|r 获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Shadowbolts|r]
    .goto The Barrens,57.06,9.65
    .collect 208744,1
step
    .use 208744
    .itemcount 208744,1
    .train 403936 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_暗影箭符文|r] |cRXP_WARN_进行训练|r |T136195:0|t[暗影箭雨]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 暗影箭雨 - 18（银松森林）
#title Shadow Bolt Volley

step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .goto Silverpine Forest,60.38,74.37,40,0
    .goto Silverpine Forest,60.29,72.21,40,0
    .goto Silverpine Forest,59.38,70.54
    .train 403936,1
    >>杀死 |cRXP_ENEMY_Ravenclaw Drudger|r 和 |cRXP_ENEMY_Ravenclaw Guardians|r |cRXP_WARN_inside|r。从他们身上搜刮 |T236295:0|t[受折磨的灵魂]
    .collect 210713,1
    .mob Ravenclaw Drudger
    .mob Ravenclaw Guardian
step
    .train 403936,1
    >>使用 |T136126:0|t[生命分流] 一次，然后使用 |T236295:0|t[痛苦的灵魂]。杀死 |cRXP_ENEMY_痛苦的灵魂|r。拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_暗影箭符文|r]
    .collect 208744,1
    .use 210713
    .cast 1455
    .mob Tortured Soul
step
    .use 208744
    .itemcount 208744,1
    .train 403936 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_暗影箭符文|r] |cRXP_WARN_进行训练|r |T136195:0|t[暗影箭雨]
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 变形 - 25（艾泽拉斯）
#title Metamorphosis

step
    #completewith WarlockRuneMetamorphosisA
    +|cRXP_WARN_建议集体完成所有这些步骤。有些步骤可以单独完成。|r
step
    #completewith next
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r, 前往赤脊山（例如从棘齿城乘船到藏宝海湾，然后向北前进） << Horde
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r << Alliance
step
    #label WarlockRuneMetamorphosisA
    .train 403938,1
    >>拾取塔顶的 |cRXP_PICK_Demonic Reliquary|r 以获得 |T134337:0|t[Orb of Des]
    *|cRXP_WARN_Be careful as it's guarded by an elite. Loot the chest whilst your Voidwalker tanks the mobs|r
    .collect 210765,1
    .goto Redridge Mountains,80.2,49.5
step << Horde
    .train 403938,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜安·卡汉|r
    *|cRXP_WARN_Skip this step if you're traveling through The Barrens|r
    .goto The Barrens,49.2,57.2
    .accept 1740 >>接任务: |cRXP_WARN_索兰鲁克宝珠|r
    .target 多安·卡汉
step
    #completewith next
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r << Alliance
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r << Horde
step
    .train 403938,1
    >>拾取塔顶的 |cRXP_PICK_Bough of Altek|r 以获得 |T135153:0|t[Bough of Altek]
    *|cRXP_WARN_Be careful. One way would be to die near it, jump up behind the bookcase, ress, (maybe fear the first caster that would attack you) and loot it.|r
    .collect 210763,1
    .goto Darkshore,56.3,26.5
step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 403938,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜安·卡汉|r
    .goto The Barrens,49.2,57.2
    .accept 1740 >>接任务: |cRXP_WARN_索兰鲁克宝珠|r
    .target 多安·卡汉
step
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step
    .train 403938,1
    >>杀死 BFD 团队入口附近的 |cRXP_ENEMY_Twilight Acolytes|r。从他们身上获取 |cRXP_LOOT_Soran'ruk Fragments|r
    *|cRXP_WARN_The |cRXP_WARN_Twilight Acolyte|r inside the raid before the 5th boss drop them as well|r
    .goto Ashenvale,14.5,14.3
    .complete 1740,1 --3/3 Soran'ruk Fragment
    .mob Twilight Acolyte
step
    .train 403938,1
    >>杀死 |cRXP_WARN_Shadowfang Keep 地下城内的 |cRXP_ENEMY_Shadowfang Darksouls|r (在 |cRXP_ENEMY_Baron Silverlaine|r 后面右转)|r。从他们身上拾取 |cRXP_LOOT_Large Soran'ruk Fragment|r
    .complete 1740,2 --1/1 Large Soran'ruk Fragment
    .mob Shadowfang Darksoul
step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 403938,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜安·卡汉|r
    .goto The Barrens,49.2,57.2
    .turnin 1740 >>交任务: |cRXP_FRIENDLY_索兰鲁克宝珠|r
    .accept 78680 >>接受谣言四起
    .turnin 78680 >>谣言四起
    .accept 78681 >>接受召唤
    .target 多安·卡汉
step
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step
    .train 403938,1
    .goto Ashenvale,83.07,70.56,40,0
    .goto Ashenvale,84.05,76.96,30,0
    .goto Ashenvale,81.29,78.14,30,0
    .goto Ashenvale,79.05,81.11,30,0
    .goto Ashenvale,84.2,76.4
    >>杀死该区域的 |cRXP_ENEMY_Demons|r。掠夺它们以获得 |cRXP_LOOT_Blood of the Legion|r
    .complete 78681,1 --10/10 Blood of the Legion
    .mob Mannoroc Lasher
    .mob Felguard
    .mob Searing Infernal
    .mob Legion Hound
step
    #completewith WarlockRuneMetamorphosisB
    +|cRXP_WARN_如果你和一群术士在一起，那么第一个接受任务的术士（带有减益效果的术士）必须站在符文内，受到|cRXP_ENEMY_Searing Infernal|r 的致命一击|r
step
    .train 403938,1
    >>与 |cRXP_PICK_黑暗仪式石|r互动
    .goto Ashenvale,78.92,80.29
    .turnin 78681 >>交出招魂
    .target Dark Ritual Stone
step
    .train 403938,1
    #label WarlockRuneMetamorphosisB
    >>杀死生成的 |cRXP_ENEMY_Demons|r。|cRXP_WARN_杀死 |cRXP_ENEMY_Searing Infernal|r 引导时|r |T136163:0|t[吸取灵魂] |cRXP_WARN_并且站在符文内时|r
    .goto Ashenvale,79.00,80.38
    .accept 78684 >>接受神秘旅人
    .mob Searing Infernal
step
    .train 403938,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜安·卡汉|r, Rune of Metamorphosis
    .goto The Barrens,49.2,57.2
    .turnin 78684 >>交出神秘旅人
    .turnin 78702 >>交出拉泽尔·安德
    .collect 210980,1
    .target 多安·卡汉
step
    .use 210980
    .itemcount 210980,1
    .train 403938 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_变形符文|r] |cRXP_WARN_进行训练|r |T237558:0|t[变形]
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup Belt
#name 协同魔典-40（艾泽拉斯）
#title Grimoire of Synergy

step
    #optional
    #completewith next
    .train 426445,1
    +|cRXP_WARN_你必须至少达到 30 级才能获得|r |T133738:0|t[协同魔法书] |cRXP_WARN_rune|r
    .xp >30,1
step
    .train 403938 >>|cRXP_WARN_你必须先获得|r |T237558:0|t[变形] |cRXP_WARN_符文，然后才能获得|r |T133738:0|t[协同魔法书] |cRXP_WARN_符文|r
step
    #optional
    .train 426445,1
    +|cRXP_WARN_你必须至少达到 30 级才能获得|r |T133738:0|t[协同魔法书] |cRXP_WARN_rune|r
    .xp >30,1
step
    .train 426445,1
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 426445,1
    .goto The Barrens,49.271,57.239
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raszel Ander|r
    >>|cRXP_WARN_您必须位于|r |T237558:0|t[Metamorphosis] |cRXP_WARN_才能查看|r |cRXP_FRIENDLY_Raszel Ander|r
    .accept 78994 >>接受坚实的基础
    .target Raszel Ander
step << Alliance
    .train 426445,1
    .isOnQuest 78994
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板维尔雷|r
    .home >>将你的炉石设置为棘轮
    .target Innkeeper Wiley
step << Horde
    .train 426445,1
    .isOnQuest 78994
    .goto The Barrens,45.58,59.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Byula|r
    .home >>将你的炉石设为陶拉祖营地
    .target Innkeeper Byula
step << Alliance
    .train 426445,1
    .isOnQuest 78994
    .goto The Barrens,63.084,37.163
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布拉高克|r
    .fly Azshara >>飞往艾萨拉
    .target Bragok
step << Horde
    .train 426445,1
    .isOnQuest 78994
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Omusa|r
    .fly Splintertree Post >>飞往斯普林特树岗哨
    .target Omusa Thunderhorn
step
    .train 426445,1
    .train 126,3 -- skips step if they don't have eye of killrog trained
    .isOnQuest 78994
    .goto Ashenvale,88.82,41.52
    >>|cRXP_WARN_前往灰谷的箭头位置|r
    .cast 126 >>|cRXP_WARN_施放|r |T136155:0|t[基尔罗格之眼] |cRXP_WARN_并带着它前往 Bough Shadow（该区域有所有 60 级以上的精英），寻找 |cRXP_PICK_Bough of Shadows|r 树。Bough Shadow 中可能出现多个生成点，理想情况下，您希望找到一个附近没有太多精英的生成点，以便您可以将其掠夺|r
step
    .train 426445,1
    .isOnQuest 78994
    #completewith next
    .goto Ashenvale,88.82,41.52
    .cast 440505 >>|cRXP_WARN_使用|r |T236874:0|t[隐身药水] |cRXP_WARN_并寻找遍布 Bough Shadow 的 |cRXP_PICK_Bough of Shadows|r 树木之一。该地区有许多巡逻的 60 级以上精英|r
    .use 217693
step
    .train 426445,1
    .isOnQuest 78994
    .goto Ashenvale,90.9,38.6,20,0
    .goto Ashenvale,91,37,0
    >>|cRXP_WARN_在拾取 |cRXP_PICK_Bough of Shadows|r 之前，脱下所有装备并施放 |r |T136121:0|t[暗影守卫]|cRXP_WARN_。你将受到非常高的伤害减益，该减益会造成基于百分比的伤害。拾取后准备好玩炉石|r
    >>在 Bough Shadow 中拾取任意 |cRXP_PICK_Bough of Shadows|r
    .complete 78994,1
step
    #completewith next
    .train 426445,1
    .isOnQuest 78994
    .hs >>从炉边到棘轮 << Alliance
    .hs >>炉火之源至陶拉祖营地 << Horde
    .zoneskip The Barrens
step
    .train 426445,1
    .goto The Barrens,49.271,57.239
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raszel Ander|r
    >>|cRXP_WARN_您必须位于|r |T237558:0|t[Metamorphosis] |cRXP_WARN_才能查看|r |cRXP_FRIENDLY_Raszel Ander|r
    .turnin 78994 >>打下坚实的基础
    .accept 78914 >>接受灵魂容器
    .target Raszel Ander
step
    .train 426445,1
    >>|cRXP_WARN_获取以下材料并让工程师为您制作|r |T133254:0|t[灵魂容器] |cRXP_WARN_。请注意，|r |T134133:0|t[黑色硫酸] |cRXP_WARN_和|r |T134074:0|t[暗影宝石] |cRXP_WARN_可以从拍卖行购买，并且|r |T134337:0|t[恶魔雕像] |cRXP_WARN_来自|r |cRXP_FRIENDLY_试剂供应商|r
    .collect 9262,1,78914,1,1 -- Black Vitriol
    .collect 1210,4,78914,1,1 -- Shadowgem
    .collect 16583,1,78914,1,1 -- Demonic Figurine
    >>|cRXP_WARN_或者你可以直接从拍卖行购买|r |T133254:0|t[灵魂容器] |cRXP_WARN_straight|r
    .collect 211427,1,78914,1
step
    #completewith next
    .train 426445,1
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .train 426445,1
    .goto Desolace,51.171,82.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raszel Ander|r
    >>|cRXP_WARN_您必须位于|r |T237558:0|t[Metamorphosis] |cRXP_WARN_才能查看|r |cRXP_FRIENDLY_Raszel Ander|r
    .turnin 78914 >>交还灵魂容器
    .accept 79298 >>接受命运的诱惑
    .target Raszel Ander
step
    .train 426445,1
    .goto Desolace,51.171,82.425
    .gossip 215850,1 >>Talk to |cRXP_FRIENDLY_Raszel Ander|r to begin the ritaul
    .timer 14,Tempting Fate RP
    .skipgossip
step
    .train 426445,1
    .goto Desolace,51.195,82.465
    >>点击 |cRXP_PICK_Reconstructed Staff of Des'Altek|r 来召唤 |cRXP_ENEMY_Des'Altek|r
    >>|cRXP_WARN_确保你的生命值满格，并且使用|r |T136121:0|t[暗影守卫] |cRXP_WARN_active，因为你将在引导过程中和整个战斗中受到伤害|r
    >>杀死 |cRXP_ENEMY_Des'Altek|r
    .complete 79298,1
    .mob Des'Altek
step
    .train 426445,1
    .goto Desolace,51.171,82.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raszel Ander|r
    >>|cRXP_WARN_您必须位于|r |T237558:0|t[Metamorphosis] |cRXP_WARN_才能查看|r |cRXP_FRIENDLY_Raszel Ander|r
    .turnin 79298 >>交出诱惑命运
    .target Raszel Ander
step
    .train 426445 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_协同符文|r] |cRXP_WARN_训练|r |T133738:0|t[协同魔法书]
    .use 213090
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 引导大师-10（洛克莫丹）
#title Master Channeler

step << Warlock
    .line Loch Modan,22.87,70.89,24.69,68.20,28.02,65.41,29.47,59.92,31.56,56.66,32.36,50.09,34.94,47.10,32.36,50.09,31.36,47.60,31.54,44.72,32.29,42.34,32.25,41.14,31.08,38.57,30.04,31.45,27.96,25.37,26.73,23.07,26.04,19.16,25.95,15.13,25.53,11.66
    .goto Loch Modan,22.87,70.89,50,0
    .goto Loch Modan,24.69,68.20,50,0
    .goto Loch Modan,28.02,65.41,50,0
    .goto Loch Modan,29.47,59.92,50,0
    .goto Loch Modan,31.56,56.66,50,0
    .goto Loch Modan,32.36,50.09,50,0
    .goto Loch Modan,34.94,47.10,50,0
    .goto Loch Modan,32.36,50.09,50,0
    .goto Loch Modan,31.36,47.60,50,0
    .goto Loch Modan,31.54,44.72,50,0
    .goto Loch Modan,32.29,42.34,50,0
    .goto Loch Modan,32.25,41.14,50,0
    .goto Loch Modan,31.08,38.57,50,0
    .goto Loch Modan,30.04,31.45,50,0
    .goto Loch Modan,27.96,25.37,50,0
    .goto Loch Modan,26.73,23.07,50,0
    .goto Loch Modan,26.04,19.16,50,0
    .goto Loch Modan,25.95,15.13,50,0
    .goto Loch Modan,25.53,11.66
    >>|cRXP_WARN_寻找在洛克莫丹路上巡逻的 |cRXP_FRIENDLY_Greishan Ironstove|r。他的巡逻路线已标记在你的地图上|r
    >>|cRXP_BUY_从他那里购买 a|r |T237359:0|t[Malevolent Pie] |cRXP_BUY_|r
    .collect 208833,1
    .unitscan Greishan Ironstove
    .train 403932,1
step << Warlock
    .use 208833 >>|cRXP_WARN_使用|r |T237359:0|t[恶意馅饼] |cRXP_WARN_吃掉它。一旦|r |T132108:0|t[地狱消化不良] |cRXP_WARN_减益效果从你身上掉落，你将获得|r |T134419:0|t[|cRXP_FRIENDLY_引导符文|r]
    .collect 208750,1 -- Rune of Channeling (1)
    .train 403932,1
step << Warlock
    .train 403932 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_通灵符文|r] |cRXP_WARN_进行训练|r |T136168:0|t[通灵大师]
    .use 208750
    .itemcount 208750,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 通灵大师 - 15（黑海岸）
#title Master Channeler

step << Warlock
    .goto Darkshore,55.27,27.74,40,0
    .goto Darkshore,56.92,27.27,40,0
    .goto Darkshore,57.54,25.99,40,0
    .goto Darkshore,56.92,27.27,40,0
    .goto Darkshore,55.27,27.74
    >>杀死 |cRXP_ENEMY_Dark Strand Fanatics|r。从他们身上夺取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Channeling|r]
    .collect 208750,1 -- Rune of Channeling (1)
    .mob Dark Strand Fanatic
    .train 403932,1
step << Warlock
    .train 403932 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_通灵符文|r] |cRXP_WARN_进行训练|r |T136168:0|t[通灵大师]
    .use 208750
    .itemcount 208750,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文书指南
#subgroup 披风
#name 灵魂虹吸-10（丹莫洛）
#title Soul Siphon

step << Warlock
    #completewith next
    >>|cRXP_WARN_Cast|r |T136163:0|t[吸取灵魂] |cRXP_WARN_on 任何小动物都会收到|r |T134095:0|t[|cRXP_LOOT_纯净灵魂碎片|r]
    .collect 205020,1 -- Pure Soul Shard (1)
    .train 403920,1
step << Warlock
    .goto Dun Morogh,77.894,62.236
    >>杀死楼下建筑内的 |cRXP_ENEMY_Captain Beld|r。搜刮他以获得 |T134085:0|t[|cRXP_LOOT_Tainted Soul Shard|r]
    >>|cRXP_WARN_确保他死的时候你也有|r |T136163:0|t[吸取灵魂] |cRXP_WARN_在他身上|r
    .collect 205019,1 -- Tainted Soul Shard (1)
    .mob Captain Beld
    .train 403920,1
step << Warlock
    >>|cRXP_WARN_Cast|r |T136163:0|t[吸取灵魂] |cRXP_WARN_on 任何小动物都会收到|r |T134095:0|t[|cRXP_LOOT_纯净灵魂碎片|r]
    .collect 205020,1 -- Pure Soul Shard (1)
    .train 403920,1
step << Warlock
    .goto Dun Morogh,47.351,53.550
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaklik Voidtwist|r to receive the |T134419:0|t[|cRXP_FRIENDLY_Rune of Soul Siphon|r]
    .collect 205022,1 -- Rune of Soul Siphon (1)
    .skipgossip
    .itemcount 205020,1
    .itemcount 205019,1
    .target Gaklik Voidtwist
step << Warlock
    .train 403920 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_灵魂虹吸符文|r] |cRXP_WARN_训练|r |T136169:0|t[灵魂虹吸]
    .use 208750
    .itemcount 208750,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 灵魂虹吸-10（艾尔文森林）
#title Soul Siphon

step << Warlock
    #completewith next
    >>|cRXP_WARN_Cast|r |T136163:0|t[吸取灵魂] |cRXP_WARN_on 任何小动物都会收到|r |T134095:0|t[|cRXP_LOOT_纯净灵魂碎片|r]
    .collect 205020,1 -- Pure Soul Shard (1)
    .train 403920,1
step << Warlock
    .goto Elwynn Forest,27.0,86.7,80,0
    .goto Elwynn Forest,26.1,89.9,80,0
    .goto Elwynn Forest,25.2,92.7,80,0
    .goto Elwynn Forest,27.0,93.9,80,0
    .goto Elwynn Forest,27.0,86.7,80,0
    .goto Elwynn Forest,26.1,89.9,80,0
    .goto Elwynn Forest,25.2,92.7,80,0
    .goto Elwynn Forest,27.0,93.9,80,0
    .goto Elwynn Forest,27.0,86.7,80,0
    .goto Elwynn Forest,26.1,89.9,80,0
    .goto Elwynn Forest,25.2,92.7,80,0
    .goto Elwynn Forest,27.0,93.9,80,0
    >>杀死 |cRXP_ENEMY_Hogger|r。从他身上搜刮物品，获得 |T134085:0|t[|cRXP_LOOT_Tainted Soul Shard|r]
    >>|cRXP_WARN_确保他死的时候你也有|r |T136163:0|t[吸取灵魂] |cRXP_WARN_在他身上|r
    .collect 205019,1 -- Tainted Soul Shard (1)
    .mob Hogger
    .train 403920,1
step << Warlock
    >>|cRXP_WARN_Cast|r |T136163:0|t[吸取灵魂] |cRXP_WARN_on 任何小动物都会收到|r |T134095:0|t[|cRXP_LOOT_纯净灵魂碎片|r]
    .collect 205020,1 -- Pure Soul Shard (1)
    .train 403920,1
step << Warlock
    .goto Elwynn Forest,44.093,66.315
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Damien Kane|r in the basement of the inn to receive the |T134419:0|t[|cRXP_FRIENDLY_Rune of Soul Siphon|r]
    .collect 205022,1 -- Rune of Soul Siphon (1)
    .skipgossip
    .itemcount 205020,1
    .itemcount 205019,1
    .target Damien Kane
step << Warlock
    .train 403920 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_灵魂虹吸符文|r] |cRXP_WARN_训练|r |T136169:0|t[灵魂虹吸]
    .use 208750
    .itemcount 208750,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 恶魔战术 - 1（艾尔文森林）
#title Demonic Tactics

step << Warlock
    .goto Elwynn Forest,56.743,57.650
    >>掠夺 |cRXP_FRIENDLY_Dead Acolyte|r 以获得 |T133625:0|t[|cRXP_LOOT_Acolyte's Knapsack|r]
    .collect 205364,1 -- Acolyte's Knapsack (1)
    .skipgossip
    .target Dead Acolyte
    .train 416009,1
step << Warlock
    .use 205364 >>|cRXP_WARN_使用|r |T133625:0|t[|cRXP_LOOT_侍僧背包|r] |cRXP_WARN_接收|r |T133447:0|t[|cRXP_LOOT_未识别的神器|r]
    .collect 205181,1 -- Unidentified Artifact (1)
    .train 416009,1
step << Warlock
    .goto Elwynn Forest,44.390,66.242
    .gossipoption 109291 >>对话: |cRXP_FRIENDLY_玛克西米利安·克洛文|r, Powerless Artifact
    .collect 205182,1 -- Powerless Artifact (1)
    .skipgossip
    .target 马克西米利安·克罗
    .train 416009,1
step << Warlock
    .goto Elwynn Forest,56.743,57.650
    .cast 408755 >>|cRXP_WARN_使用|r |T133447:0|t[|cRXP_LOOT_Powerless Artifact|r] |cRXP_WARN_at the |cRXP_FRIENDLY_Dead Acolyte's|r 位置来接收|r |T136008:0|t[Blood Offering] |cRXP_WARN_debuff|r
    .use 205182
    .aura 408755
    .target Dead Acolyte
    .train 416009,1
step << Warlock
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 416009,1
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往被屠宰的羔羊并下楼
    .train 416009,1
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑暗缚灵者加科因|r, Rune of Tactics
    .collect 205215,1 -- Rune of Tactics (1)
    .skipgossip
    .target Gakin the Darkbinder
    .train 416009,1
step << Warlock
    .train 416009 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_战术符文|r] |cRXP_WARN_进行训练|r |T136150:0|t[恶魔战术]
    .use 205215
    .itemcount 205215,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 恶魔之恩 - 10（艾尔文森林）
#title Demonic Grace

step << Warlock
    .goto Elwynn Forest,61.6,53.8
    >>杀死 |cRXP_ENEMY_Kobold Geomancers|r。掠夺他们以获得 |T133733:0|t[|cRXP_LOOT_Ominous Tome|r]
    .collect 204905,1 -- Ominous Tome (1)
    .mob Kobold Geomancer
    .train 425477,1
step << Warlock
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,25.9,93.9
    >>杀死 |cRXP_ENEMY_Riverpaw Runts|r 和 |cRXP_ENEMY_Riverpaw Outrunners|r。掠夺他们的 |cRXP_LOOT_Gnoll Blood|r
    .collect 204906,1 -- Gnoll Blood (1)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
    .train 425477,1
step << Warlock
    .goto Elwynn Forest,35.6,61.0,60,0
    .goto Elwynn Forest,57.8,59.4
    >>杀死 |cRXP_ENEMY_Mangy Wolves|r、|cRXP_ENEMY_Gray Forest Wolves|r 和 |cRXP_ENEMY_Prowlers|r。掠夺他们以获得 |cRXP_LOOT_Wolf Jawbone|r
    .collect 204907,1 -- Wolf Jawbone (1)
    .mob Mangy Wolf
    .mob Gray Forest Wolf
    .mob Prowler
    .train 425477,1
step << Warlock
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 425477,1
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往被屠宰的羔羊并下楼
    .train 425477,1
step << Warlock
    #completewith next
    .goto StormwindClassic,25.2,80.7,18,0
    .goto StormwindClassic,23.2,79.5,18,0
    .goto StormwindClassic,26.3,79.5,18,0
    .goto StormwindClassic,25.154,77.406
    >>|cRXP_WARN_前往被屠宰的羔羊底部|r
    .cast 418065 >>|cRXP_WARN_使用|r |T133733:0|t[|cRXP_LOOT_Ominous Tome|r] |cRXP_WARN_来召唤|r |cRXP_ENEMY_Soboz|r
    .use 204905
    .train 425477,1
step << Warlock
    .goto StormwindClassic,25.154,77.406
    .use 204905 >>杀死 |cRXP_ENEMY_Soboz|r。从他身上搜刮物品，获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Grace|r]
    .collect 204912,1 -- Rune of Grace (1)
    .mob Soboz
    .train 425477,1
step << Warlock
    .train 425477 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_恩典符文|r] |cRXP_WARN_进行训练|r |T236293:0|t[恶魔恩典]
    .use 204912
    .itemcount 204912,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 恶魔优雅-10（丹莫洛）
#title Demonic Grace

step << Warlock
    .goto Dun Morogh,22.8,50.6
    >>杀死 |cRXP_ENEMY_Frostmane Shadowcasters|r。掠夺他们以获得 |T133733:0|t[|cRXP_LOOT_Ominous Tome|r]
    .collect 208139,1 -- Ominous Tome (1)
    .mob Frostmane Shadowcaster
    .train 425477,1
step << Warlock
#loop
	.line Dun Morogh,42.57,54.80,41.89,54.51,42.13,52.68,42.46,51.96,41.91,51.43,42.46,51.96,42.13,52.68,42.57,54.80
	.goto Dun Morogh,42.57,54.80,10,0
	.goto Dun Morogh,41.89,54.51,10,0
	.goto Dun Morogh,42.13,52.68,10,0
	.goto Dun Morogh,42.46,51.96,10,0
	.goto Dun Morogh,41.91,51.43,10,0
	.goto Dun Morogh,42.46,51.96,10,0
	.goto Dun Morogh,42.13,52.68,10,0
	.goto Dun Morogh,42.57,54.80,10,0
    >>杀死 |cRXP_ENEMY_Young Wendigos|r 和 |cRXP_ENEMY_Wendigos|r。掠夺他们的 |cRXP_LOOT_Wendigo Blood|r
    .collect 208140,1 -- Wendigo Blood (1)
    .mob Young Wendigo
    .mob Wendigo
    .train 425477,1
step << Warlock
    .goto Dun Morogh,45.6,43.2,60,0
    .goto Dun Morogh,34.6,41.8
    >>杀死丹莫洛的任意 |cRXP_ENEMY_Wolf|r。掠夺他们的 |cRXP_LOOT_Wolf Jawbone|r
    .collect 204907,1 -- Wolf Jawbone
    .mob Starving Winter Wolf
    .mob Winter Wolf
    .mob Snow Tracker Wolf
    .train 425477,1
step << Warlock
    .goto Dun Morogh,42.23,35.40
    .cast 418065 >>|cRXP_WARN_使用|r |T133733:0|t[|cRXP_LOOT_Ominous Tome|r] |cRXP_WARN_来召唤|r |cRXP_ENEMY_Soboz|r
    .use 208139
    .train 425477,1
step << Warlock
    .goto Dun Morogh,42.23,35.40
    .use 204905 >>杀死 |cRXP_ENEMY_Soboz|r。从他身上搜刮物品，获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Grace|r]
    .collect 204912,1 -- Rune of Grace (1)
    .mob Soboz
    .train 425477,1
step << Warlock
    .train 425477 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_恩典符文|r] |cRXP_WARN_进行训练|r |T236293:0|t[恶魔恩典]
    .use 204912
    .itemcount 204912,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 暗影箭雨 - 16（黑海岸）
#title Shadow Bolt Volley

step << Warlock
    .goto Darkshore,56.8,27.6,60,0
    .goto Darkshore,57.6,26.0
    >>杀死 |cRXP_ENEMY_Delmanis the Hated|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_Rune of Shadowbolts|r]
    .collect 208744,1 -- Rune of Shadowbolts (1)
    .unitscan Delmanis the Hated
    .train 403936,1
step << Warlock
    .train 403936 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_暗影箭符文|r] |cRXP_WARN_进行训练|r |T136195:0|t[暗影箭雨]
    .use 208744
    .itemcount 208744,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 混乱之箭 - 8（丹莫洛）
#title Chaos Bolt

step << Warlock
    .goto Dun Morogh,69.365,58.302
    >>杀死 |cRXP_ENEMY_Frozen Trogg|r。拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Chaos Bolt|r]
    >>|cRXP_WARN_注意：为了打破冰块，你必须以非常快的速度连续使用多个火焰法术攻击它|r
    >>|cRXP_WARN_施放|r |T135817:0|t[献祭] |cRXP_WARN_并使用你的小鬼攻击它。你需要另一个术士或法师的帮助才能打破它|r
    .collect 205228,1 -- Rune of Chaos Bolt (1)
    .mob Frozen Trogg
    .train 403925,1
step << Warlock
    .train 403925 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_混乱之箭符文|r] |cRXP_WARN_进行训练|r |T236291:0|t[混乱之箭]
    .use 208744
    .itemcount 208744,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 混乱之箭 - 8（艾尔文森林）
#title Chaos Bolt

step << Warlock
    .goto Elwynn Forest,77.010,51.897
    >>杀死 |cRXP_ENEMY_Frozen Murloc|r。拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Chaos Bolt|r]
    >>|cRXP_WARN_注意：为了打破冰块，你必须以非常快的速度连续使用多个火焰法术攻击它|r
    >>|cRXP_WARN_施放|r |T135817:0|t[献祭] |cRXP_WARN_并使用你的小鬼攻击它。你需要另一个术士或法师的帮助才能打破它|r
    .collect 205228,1 -- Rune of Chaos Bolt (1)
    .mob Frozen Murloc
    .train 403925,1
step << Warlock
    .train 403925 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_混乱之箭符文|r] |cRXP_WARN_进行训练|r |T236291:0|t[混乱之箭]
    .use 208744
    .itemcount 208744,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup Belt
#name 祈祷 - 35（阿拉希高地）
#title Invocation

-- Invocation

step
    .train 426443,1
    #completewith SyndicateConjuror
    +|cRXP_WARN_建议你寻找额外的队友来获取|r |T134419:0|t[|cRXP_LOOT_Rune of Invocation|r] |cRXP_WARN_因为它需要在激流堡中杀死精英|r
step
    .train 426443,1
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    .train 426443,1
    #completewith next
    .subzone 324 >>前往激流堡
step
    #label SyndicateConjuror
    .train 426443,1
    #loop
    .goto Arathi Highlands,26.04,62.80,40,0
    .goto Arathi Highlands,29.47,64.14,40,0
    .goto Arathi Highlands,29.06,60.96,40,0
    >>杀死 |cRXP_ENEMY_Syndicate Conjurors|r。掠夺他们的 |T348282:0|t[|cRXP_LOOT_Conjuror's Pendants|r]
    >>在你对 |cRXP_ENEMY_Voidwalker Minion|r 进行 |T136163:0|t[Drain Soul] 引导时将其杀死，以获得 |T132885:0|t[|cRXP_LOOT_Soul of the Void|r]
    .collect 213573,10
    .collect 213572,1
    .mob Syndicate Conjuror
    .mob Voidwalker Minion
step
    #completewith next
    .train 426443,1
    .goto Arathi Highlands,29.292,62.283,10 >>|cRXP_WARN_进入 Stromgade Keep 下层的大房子，然后前往二楼|r
step
    #completewith next
    .train 426443,1
    .goto Arathi Highlands,29.077,63.079
    .cast 434994 >>|cRXP_WARN_使用|r |T348282:0|t[|cRXP_LOOT_魔法师吊坠|r] |cRXP_WARN_上楼梯，靠近漂浮的|r |cRXP_PICK_虚空棱镜|r |cRXP_WARN_召唤一个 36 级精英|cRXP_ENEMY_虚空探寻者|r
    .use 213573
step
    .train 426443,1
    .goto Arathi Highlands,29.077,63.079
    >>杀死 |cRXP_ENEMY_Void Seeker|r。拾取它以获得 |T134419:0|t[|cRXP_LOOT_Rune of Invocation|r]
    .collect 213098,1
    .mob Void Seeker
step
    .train 426443 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_LOOT_召唤符文|r] |cRXP_WARN_进行训练|r |T136133:0|t[召唤]
    .use 213098
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup Boots
#name 邪恶之舞 - 35（凄凉之地）
#title Dance of the Wicked

-- Dance of the Wicked

step
    .train 416017,1
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .train 416017,1
    .goto Desolace,74.5,13.4
    >>点击地面上的 |cRXP_ENEMY_Reckless Warlock|r。拾取他以获得 |T236297:0|t[Brimstone Carving]
    >>|cRXP_WARN_这是一个罕见的敌人，有可能不存在|r
    .collect 213583,1
    .mob Reckless Warlock
    .unitscan Reckless Warlock
step
    .train 416017,1
    >>|cRXP_WARN_Cast|r |T135818:0|t[地狱火] |cRXP_WARN_对自己造成低于 70% 生命值的伤害。之后|r |T236297:0|t[硫磺雕刻] |cRXP_WARN_将转变为|r |T134419:0|t[|cRXP_FRIENDLY_邪恶符文|r]
    .collect 213102,1 --Rune of Wickedness
step
    .train 416017 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_邪恶符文|r] |cRXP_WARN_学习|r |T236295:0|t[邪恶之舞]
    .use 416017
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup Boots
#name 邪恶之舞 - 35（荆棘谷）
#title Dance of the Wicked

-- Dance of the Wicked

step
    .train 416017,1
    #completewith next
    .zone Stranglethorn Vale>>前往荆棘谷
step
    .train 416017,1
    .goto Stranglethorn Vale,31.2,47.4
    >>点击地面上的 |cRXP_ENEMY_Reckless Warlock|r。拾取他以获得 |T236297:0|t[Brimstone Carving]
    >>|cRXP_WARN_这是一个罕见的敌人，有可能不存在|r
    .collect 213583,1
    .unitscan Reckless Warlock
    .mob Reckless Warlock
step
    .train 416017,1
    >>|cRXP_WARN_Cast|r |T135818:0|t[地狱火] |cRXP_WARN_对自己造成低于 70% 生命值的伤害。之后|r |T236297:0|t[硫磺雕刻] |cRXP_WARN_将转变为|r |T134419:0|t[|cRXP_FRIENDLY_邪恶符文|r]
    .collect 213102,1 --Rune of Wickedness
step
    .train 416017 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_邪恶符文|r] |cRXP_WARN_学习|r |T236295:0|t[邪恶之舞]
    .use 416017
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup Boots
#name 暗影烈焰 - 40（凄凉之地）
#title Shadowflame


-- Shadowflame

step
    .train 426467,1
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r, |cRXP_WARN_强烈建议至少组成 3 人小队。|r
step
    .train 426467,1
    .train 19028,3 --Soul Link
    .goto Desolace,81.2,79.7
    .cast 434869 >>|cRXP_WARN_点击祭坛召唤|r |cRXP_ENEMY_Seductress Ceeyna|r |cRXP_WARN_但一定要使用|r |T136121:0|t[暗影守卫]|cRXP_WARN_，|r |T136190:0|t[牺牲] |cRXP_WARN_和|r |T136160:0|t[灵魂链接]|r |cRXP_WARN_事先|r |cFFFF0000因为你会在引导过程中受到大量伤害，而且无法治愈|r
step
    .train 426467,1
    .train 19028,1 --Soul Link
    .goto Desolace,81.2,79.7
    .cast 434869 >>|cRXP_WARN_点击祭坛召唤|r |cRXP_ENEMY_Seductress Ceeyna|r |cRXP_WARN_但一定要使用|r |T136121:0|t[暗影守卫] |cRXP_WARN_和|r |T136190:0|t[牺牲] |cRXP_WARN_事先|r |cFFFF0000因为你会在引导过程中受到大量伤害并且无法治愈|r
step
    .train 426467,1
    .goto Desolace,81.2,79.7
    >>杀死 |cRXP_ENEMY_Seductress Ceeyna|r。掠夺她以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Shadowflames|r]
    .collect 213101,1
    .mob Seductress Ceeyna
step
    .train 426467 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_暗影烈焰符文|r] |cRXP_WARN_学习|r |T236302:0|t[暗影烈焰]
    .use 213101
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup Bracers
#title Immolation Aura
#name 献祭光环 - 40（灰谷）

step
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step
    .goto Ashenvale,93.5,38.0,100 >>前往地图上标记的灰谷梦魇入侵区域
    .train 431758,1
step
    >>杀死传送门外的恶魔，直到你获得下面列出的所有三件物品
    .collect 221972,1 >>|T132839:0|t|cRXP_LOOT_Dreampyre Fire|r 由 |cRXP_ENEMY_Dreampyre Imps|r 掉落
    .collect 221971,1 >>|T237396:0|t|cRXP_LOOT_Dreamsworn Horn|r 由 |cRXP_ENEMY_Emberspark Dreamsworn|r 掉落
    .collect 221973,1 >>|T133724:0|t|cRXP_LOOT_Dreamhunter Fang|r 由 |cRXP_ENEMY_Dreampyre Hounds|r 掉落
    .mob Dreampyre Imp
    .mob Emberspark Dreamsworn
    .mob Dreamhunter Hound
    .train 431758,1
step
    .cast 447537 >>右键单击背包中的任意物品，将其合并并获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Immolation Aura|r]
    .collect 220618,1 --Rune of Immolation Aura
    .use 221972
    .train 431758,1
step
    .train 431758 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_献祭光环符文|r] |cRXP_WARN_学习|r |T135802:0|t[献祭光环]
    .use 220618
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup Bracers
#title Summon Felguard
#name 召唤恶魔守卫 - 10（艾泽拉斯）

step
    #completewith next
    +|cRXP_WARN_为了获得此符文，您需要找到一个|r |T236294:0|t|cRXP_FRIENDLY_Explorer Imp|r。|cRXP_WARN_如果您还没有，请对怪物施放|r |T136163:0|t|cRXP_FRIENDLY_[Drain Soul]|r |cRXP_WARN_。每次施放此法术时，您都有机会获得一个|r |T133257:0|t|cRXP_LOOT_Explorer's Soul|r。|cRXP_WARN_使用它来学习如何召唤您的|r |T236294:0|t|cRXP_FRIENDLY_Explorer Imp|r
step
    +前往以下区域之一。符文可以在其中任何一个区域获得，但更高级别的区域将为您提供来自探险小鬼的更好奖励
    >>The Barrens
    >>Westfall
    >>Darkshore
    >>Silverpine Forest
    >>Ashenvale
    >>Redridge Mountains
    >>Swamp of Sorrows
    >>Desolace
    >>Feralas
    >>Azshara
    >>Blasted Lands
    .zoneskip The Barrens
    .zoneskip Westfall
    .zoneskip Darkshore
    .zoneskip Silverpine Forest
    .zoneskip Ashenvale
    .zoneskip Redridge Mountains
    .zoneskip Swamp of Sorrows
    .zoneskip Desolace
    .zoneskip Feralas
    .zoneskip Azshara
    .zoneskip Blasted Lands
step
    >>在地图上标记的位置寻找 |cRXP_FRIENDLY_Fel Portals|r。找到后，召唤您的 |T236294:0|t|cRXP_FRIENDLY_Explorer Imp|r，并站在门户旁边完成其对话。小鬼将开始探索它，您将获得 |T136164:0|t|cRXP_FRIENDLY_Imp on a Mission|r 增益。大约 10-20 分钟后，您的小鬼将返回您身边，或者您可以重新召唤它并再次与它交谈以交出可重复的任务，奖励 |T​​133639:0|t|cRXP_LOOT_Otherworldly Treasure|r。打开它后，您将获得战利品，并有机会获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Felguard|r]。继续寻找裂缝并掠夺宝藏，直到找到它
    .goto Westfall,28.6,44.0,0
    .goto Westfall,29.0,47.8,0
    .goto Westfall,29.0,58.2,0
    .goto Westfall,29.6,69.4,0
    .goto Westfall,29.8,34.4,0
    .goto Westfall,31.4,39.2,0
    .goto Westfall,31.4,65.6,0
    .goto Westfall,32.2,76.0,0
    .goto Westfall,32.2,80.2,0
    .goto Westfall,32.4,29.2,0
    .goto Westfall,34.0,82.2,0
    .goto Westfall,37.4,85.0,0
    .goto Westfall,41.4,15.4,0
    .goto Westfall,44.8,46.6,0
    .goto Westfall,47.0,39.4,0
    .goto Westfall,47.4,79.2,0
    .goto Westfall,47.6,22.0,0
    .goto Westfall,47.6,67.2,0
    .goto Westfall,47.8,13.8,0
    .goto Westfall,51.0,32.2,0
    .goto Westfall,51.6,71.4,0
    .goto Westfall,57.0,10.6,0
    .goto Westfall,62.6,26.0,0
    .goto The Barrens,39.6,13.8,0
    .goto The Barrens,40.0,18.4,0
    .goto The Barrens,40.8,14.4,0
    .goto The Barrens,42.0,14.2,0
    .goto The Barrens,44.4,50.0,0
    .goto The Barrens,45.8,51.2,0
    .goto The Barrens,46.4,52.6,0
    .goto The Barrens,47.6,49.4,0
    .goto The Barrens,51.6,53.4,0
    .goto The Barrens,53.0,50.8,0
    .goto The Barrens,54.2,52.6,0
    .goto The Barrens,54.4,48.6,0
    .goto The Barrens,55.6,25.6,0
    .goto The Barrens,55.8,51.0,0
    .goto The Barrens,56.0,24.8,0
    .goto The Barrens,57.6,23.6,0
    .goto The Barrens,58.2,49.6,0
    .goto The Barrens,58.8,25.8,0
    .goto The Barrens,59.0,29.2,0
    .goto The Barrens,59.0,32.0,0
    .goto The Barrens,59.2,36.4,0
    .goto The Barrens,59.8,27.6,0
    .goto The Barrens,60.2,36.0,0
    .goto The Barrens,60.8,29.0,0
    .goto The Barrens,61.8,32.0,0
    .goto Silverpine Forest,38.8,18.4,0
    .goto Silverpine Forest,38.8,23.4,0
    .goto Silverpine Forest,44.6,25.2,0
    .goto Silverpine Forest,45.4,31.8,0
    .goto Silverpine Forest,49.8,13.4,0
    .goto Silverpine Forest,50.2,56.8,0
    .goto Silverpine Forest,50.2,65.2,0
    .goto Silverpine Forest,55.6,24.6,0
    .goto Darkshore,37.6,63.8,0
    .goto Darkshore,43.2,27.0,0
    .goto Darkshore,44.0,82.0,0
    .goto Darkshore,45.0,26.2,0
    .goto Darkshore,46.2,46.8,0
    .goto Darkshore,47.4,28.8,0
    .goto Darkshore,49.8,36.8,0
    .goto Darkshore,56.4,24.8,0
    .goto Darkshore,59.8,21.8,0
    .goto Ashenvale,24.4,63.4,0
    .goto Ashenvale,27.6,62.6,0
    .goto Ashenvale,30.2,30.2,0
    .goto Ashenvale,33.6,28.4,0
    .goto Ashenvale,44.6,64.2,0
    .goto Ashenvale,51.2,47.0,0
    .goto Ashenvale,52.6,62.8,0
    .goto Ashenvale,55.6,40.2,0
    .goto Ashenvale,67.0,46.0,0
    .goto Ashenvale,67.2,51.0,0
    .goto Ashenvale,77.4,73.0,0
    .goto Ashenvale,80.4,70.6,0
    .goto Ashenvale,84.8,70.2,0
    .goto Redridge Mountains,29.8,30.4,0
    .goto Redridge Mountains,31.2,21.8,0
    .goto Redridge Mountains,42.8,16.8,0
    .goto Redridge Mountains,71.4,57.8,0
    .goto Redridge Mountains,71.4,83.6,0
    .goto Redridge Mountains,72.0,57.8,0
    .goto Redridge Mountains,79.0,33.4,0
    .goto Redridge Mountains,81.6,60.4,0
    .goto Redridge Mountains,83.2,44.4,0
    .goto Redridge Mountains,86.2,52.6,0
    .goto The Barrens,42.8,81.8,0
    .goto The Barrens,43.2,80.2,0
    .goto The Barrens,46.2,85.6,0
    .goto The Barrens,47.8,83.6,0
    .goto The Barrens,48.4,81.2,0
    .goto The Barrens,50.2,80.6,0
    .goto Swamp of Sorrows,10.4,59.4,0
    .goto Swamp of Sorrows,12.4,29.8,0
    .goto Swamp of Sorrows,16.4,63.0,0
    .goto Swamp of Sorrows,22.8,64.0,0
    .goto Swamp of Sorrows,27.0,48.8,0
    .goto Swamp of Sorrows,34.2,28.8,0
    .goto Swamp of Sorrows,36.2,50.6,0
    .goto Swamp of Sorrows,49.0,38.8,0
    .goto Swamp of Sorrows,56.6,65.0,0
    .goto Swamp of Sorrows,60.2,27.6,0
    .goto Swamp of Sorrows,69.4,78.4,0
    .goto Swamp of Sorrows,72.4,10.4,0
    .goto Swamp of Sorrows,77.4,89.6,0
    .goto Swamp of Sorrows,81.2,34.0,0
    .goto Swamp of Sorrows,83.2,66.6,0
    .goto Swamp of Sorrows,87.6,26.0,0
    .goto Swamp of Sorrows,90.8,65.2,0
    .goto Swamp of Sorrows,91.4,57.0,0
    .goto Desolace,47.4,22.2,0
    .goto Desolace,48.8,82.2,0
    .goto Desolace,49.4,75.0,0
    .goto Desolace,52.0,85.4,0
    .goto Desolace,52.2,72.4,0
    .goto Desolace,52.8,81.0,0
    .goto Desolace,54.4,19.2,0
    .goto Desolace,56.0,74.8,0
    .goto Desolace,71.6,18.4,0
    .goto Desolace,72.6,21.8,0
    .goto Desolace,73.4,24.6,0
    .goto Desolace,74.4,10.6,0
    .goto Desolace,76.4,19.2,0
    .goto Desolace,80.4,17.0,0
    .goto Blasted Lands,35.0,55.0,0
    .goto Blasted Lands,41.2,33.4,0
    .goto Blasted Lands,43.6,25.0,0
    .goto Blasted Lands,46.8,39.2,0
    .goto Blasted Lands,48.8,48.6,0
    .goto Blasted Lands,56.0,36.6,0
    .goto Blasted Lands,60.2,46.0,0
    .goto Blasted Lands,62.0,39.2,0
    .goto Feralas,68.2,58.8,0
    .goto Feralas,70.4,62.6,0
    .goto Feralas,72.4,63.8,0
    .goto Feralas,73.2,54.4,0
    .goto Feralas,74.2,50.4,0
    .goto Feralas,74.2,60.0,0
    .goto Feralas,76.2,56.4,0
    .goto Feralas,76.6,63.4,0
    .goto Azshara,16.4,51.0,0
    .goto Azshara,17.6,58.4,0
    .goto Azshara,21.2,54.0,0
    .goto Azshara,24.8,47.8,0
    .goto Azshara,25.0,81.4,0
    .goto Azshara,30.2,79.8,0
    .goto Azshara,33.0,81.4,0
    
    .collect 221499,1 --Rune of the felguard
    .use 223148 --Otherworldy Treasure
    .unitscan Fel Sliver
    .unitscan Fel Crack
    .unitscan Fel Tear
    .unitscan Fel Scar
    .unitscan Fel Rift
step
    .train 431756 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_恶魔守卫符文|r] |cRXP_WARN_学习|r |T136216:0|t[召唤恶魔守卫]
    .use 221499

]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup Helmet
#title Pandemic
#name 疫情 - 40（菲拉斯）

step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
    .goto Feralas,69.6,43.3 
    >>前往莫沙彻营地西边的标记位置。寻找躺在树旁的 |cRXP_ENEMY_Dead Diseased Grimtotem Shaman|r。在尸体旁边你会发现一个 |cRXP_PICK_Grimtotem Chest|r，将其拾取以获得 |T133291:0|t|cRXP_LOOT_Grimtotem Necklace|r
    .collect 221974,1 --Grimtotem Necklace 1/1
    .unitscan Dead Diseased Grimtotem Shaman
    .train 431743,1
step
    .goto 1444/1,695.400,-4920.300,20 >>沿着通往 Woodpaw Den 的山上小路走
    .train 431743,1
step
    .goto 1444/1,831.200,-4851.000,20 >>沿着火把标记的道路向上走
    .train 431743,1
step
    .goto 1444/1,826.500,-4725.100
    >>坚持营地的右边缘，然后前往 |cRXP_ENEMY_Dead Diseased Woodpaw Mystic|r。在他旁边你会发现一个 |cRXP_PICK_Woodpaw Bag|r，将其拾取以获得 |T135139:0|t|cRXP_LOOT_Broken Woodpaw Staff|r
    .collect 221975,1 --Broken Woodpaw Staff
    .unitscan Dead Diseased Woodpaw Mystic
    .train 431743,1
step
    >>使用 |T135139:0|t|cRXP_LOOT_Broken Woodpaw Staff|r 将其与 |T133291:0|t|cRXP_LOOT_Grimtotem Necklace|r 结合并制作 |T135153:0|t|cRXP_LOOT_Diseased Nature Staff|r
    .collect 221976,1 --Diseased Nature Staff
    .use 221975
    .train 431743,1
step
    .goto Feralas,72.6,50.8
    >>寻找一个沉睡的 |cRXP_ENEMY_Diseased Forest Walker|r，使用你的 |T135153:0|t|cRXP_LOOT_Diseased Nature Staff|r 唤醒他。击败他并掠夺 |T134419:0|t[|cRXP_FRIENDLY_Rune of Pandemic|r]
    .collect 220617,1 --Rune of Pandemic
    .use 221976
    .train 431743,1
step
    .train 431743 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_疫情符文|r] |cRXP_WARN_学习|r |T136227:0|t[疫情]
    .use 220617
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup 披风
#title Decimation
#name 屠杀 - 55（艾泽拉斯）

step
    #completewith next
    .zone Burning Steppes >>前往: |cRXP_PICK_燃烧平原|r
step
    #loop
    .goto Burning Steppes,93.2,59.0,55,0
    .goto Burning Steppes,72.2,31.6,55,0
    .goto Burning Steppes,69.0,26.4,55,0
    .goto Burning Steppes,59.8,65.0,55,0
    .goto Burning Steppes,36.4,60.8,55,0
    .goto Burning Steppes,24.2,64.6,55,0
    .goto Burning Steppes,37.6,42.2,55,0
    >>|cRXP_WARN_寻找 |cRXP_PICK_Fel Rifts|r。这些是可能出现在整个区域的门户|r
    >>|cRXP_WARN_与 |cRXP_PICK_Rift|r 对话以将你的 |cRXP_FRIENDLY_Explorer Imp|r 通过 |cRXP_PICK_Rift|r 发送并等待它带着|r |T135222:0|t[|cRXP_LOOT_Legion Portal Tuner|r] 返回
    >>|cRXP_WARN_您可能需要重复此操作几次，直到它返回|r |T135222:0|t[|cRXP_LOOT_Legion Portal Tuner|r]
    .collect 224806,1
    .train 440922,1
    .skipgossip
step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
step
    #loop
    .goto Blasted Lands,43.6,25.6,50,0
    .goto Blasted Lands,41.4,33.8,50,0
    .goto Blasted Lands,46.6,39.2,50,0
    .goto Blasted Lands,49.0,48.2,50,0
    .goto Blasted Lands,60.6,46.2,50,0
    .goto Blasted Lands,62.0,39.2,50,0
    .goto Blasted Lands,56.2,36.8,50,0
    .use 224806 >>|cRXP_WARN_使用|r |T135222:0|t[|cRXP_LOOT_Legion Portal Tuner|r] |cRXP_WARN_on |cRXP_PICK_Fel Scar|r 将其变成|r |cRXP_PICK_Otherworldly Portal|r
    >>|cRXP_WARN_与 |cRXP_PICK_Otherwordly Portal|r 对话并派遣你的 |cRXP_FRIENDLY_Explorer Imp|r 通过它并等待它带着|r |T134429:0|t[|cRXP_LOOT_Portal Tuner Tuner|r] 返回
    >>|cRXP_WARN_您可能需要重复此操作几次，直到它返回|r |T134429:0|t[|cRXP_LOOT_Portal Tuner Tuner|r]
    .collect 224912,1
    .train 440922,1
    .skipgossip
step
    .use 224912 >>|cRXP_WARN_使用|r |T134429:0|t[|cRXP_LOOT_Portal Tuner Tuner|r] |cRXP_WARN_将其转变为|r |T135224:0|t[|cRXP_LOOT_Overcharged Portal Tuner|r]
    .collect 224893,1
    .train 440922,1
step
    #loop
    .goto Blasted Lands,43.6,25.6,50,0
    .goto Blasted Lands,41.4,33.8,50,0
    .goto Blasted Lands,46.6,39.2,50,0
    .goto Blasted Lands,49.0,48.2,50,0
    .goto Blasted Lands,60.6,46.2,50,0
    .goto Blasted Lands,62.0,39.2,50,0
    .goto Blasted Lands,56.2,36.8,50,0
    .use 224893 >>|cRXP_WARN_使用|r |T135224:0|t[|cRXP_LOOT_Overcharged Portal Tuner|r] |cRXP_WARN_on |cRXP_PICK_Fel Scar|r 会使其变成红色|r
    >>|cRXP_WARN_与它交谈并派遣你的 |cRXP_FRIENDLY_Explorer Imp|r 通过它并等待它带着|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Decimation|r] 返回
    .collect 225686,1
    .train 440922,1
    .skipgossip
step
    .train 440922 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_抽取符文|r] |cRXP_WARN_学习|r |T135808:0|t[抽取]
    .use 225686
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup 披风
#title Mark of Chaos
#name 混沌印记 - 50（西瘟疫之地）

step
    #completewith next
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    #loop
    .goto Western Plaguelands,50.6,77.6
    >>|cRXP_WARN_施放|r |T136163:0|t[吸取灵魂] |cRXP_WARN_on |cRXP_ENEMY_骷髅剥皮者s|r 直到你收到 3|r |cRXP_LOOT_Plagued Soul Shards|r
    .collect 225929,3
    .mob 骷髅剥皮者
    .train 440924,1
step
    .goto Western Plaguelands,43.361,84.143 << Alliance
    .goto Tirisfal Glades,83.035,72.631 << Horde
    >>|cRXP_WARN_将你的 |cRXP_LOOT_瘟疫灵魂碎片|r 交给冰风营地的 |cRXP_FRIENDLY_皮克西·皮尔弗斯碎片|r 以获得|r |T134419:0|t[|cRXP_FRIENDLY_混沌印记符文|r] << Alliance
    >>|cRXP_WARN_将你的 |cRXP_LOOT_瘟疫灵魂碎片|r 交给堡垒的 |cRXP_FRIENDLY_Prazik Pilfershard|r 以获得|r |T134419:0|t[|cRXP_FRIENDLY_混沌印记符文|r] << Horde
    .collect 225688,1
    .target Pixi Pilfershard << Alliance
    .target Prazik Pilfershard << Horde
    .train 440924,1
step
    .train 440924 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_混沌印记符文|r] |cRXP_WARN_学习|r |T136226:0|t[混沌印记]
    .use 225688
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文书指南
#subgroup 披风
#title Infernal Armor
#name 地狱火护甲 - 55（诅咒之地）

step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
    >>|cRXP_WARN_确保你已经训练了以下技能，并考虑带上一名治疗师，因为你需要杀死一名 56 级精英|r
    >>|T134131:0|t[高级法术石]
    >>|T136121:0|t[暗影守卫]
    >>|T136190:0|t[牺牲] |cRXP_WARN_for 你的|r |T136221:0|t[虚空行者]
step
    .train 440926,1
    #loop
    .goto Blasted Lands,65.31,32.63,20,0
    .goto Blasted Lands,68.050,28.667
    >>杀死任意 |cRXP_ENEMY_Shadowsworn|r。掠夺他们以获得 |cRXP_LOOT_Shadowsworn Note|r
    .collect 227658,1
    .mob Shadowsworn Cultist
    .mob Shadowsworn Thug
    .mob Shadowsworn Adept
    .mob Shadowsworn Enforcer
    .mob Shadowsworn Warlock
    .mob Shadowsworn Dreadweaver
step
    .train 440926,1
    .goto Blasted Lands,68.050,28.667
    >>前往洞穴后面的 |cRXP_PICK_Altar|r
    >>|cRXP_WARN_在点击 |cRXP_PICK_Altar|r 之前，请确保你已经使用了 |r |T134131:0|t[高级法术石]|cRXP_WARN_、|r |T136121:0|t[暗影守卫] |cRXP_WARN_和|r |T136190:0|t[牺牲] |cRXP_WARN_，因为你将在点击 |cRXP_PICK_Altar|r 时受到大量伤害，并在此过程中召唤 |cRXP_ENEMY_Heliath|r。|cRXP_ENEMY_Heliath|r 是 56 级精英|r
    >>杀死 |cRXP_ENEMY_Heliath|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_炼狱护甲符文|r] 
    .collect 225687,1
    .mob Heliath
step
    .train 440926 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_地狱护甲符文|r] |cRXP_WARN_学习|r |T236418:0|t[地狱护甲]
    .use 225687
]])