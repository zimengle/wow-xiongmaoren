RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 幽灵 - 3(艾尔文森林)
#displayname Haunt

step << Warlock
    #season 2
    .goto Elwynn Forest,52.544,51.922
    >>打开地面上的|cRXP_PICK_Defias Stashbox|r, 拾取其中的 |T134419:0|t[|cRXP_FRIENDLY_Rune of Haunting|r]
    .collect 205230,1 -- Rune of Haunting (1)
    .train 403919,1
step << Warlock
    #season 2
    #label RoH
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_萦绕符文|r]|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 萦绕]
    .use 205230
    .itemcount 205230,1
    .train 403919,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 幽灵出没-1(丹莫洛)
#displayname Haunt

step << Warlock
    #season 2
    .goto Dun Morogh,26.733,72.552
    >>打开地面上的|cRXP_PICK_Rockjaw Footlocker|r. 拾取其中的 |T134419:0|t|cRXP_LOOT_[鬼影符文]|r
    .collect 205230,1 -- Rune of Haunting (1)
    .train 403919,1
step << Warlock
    #season 2
    .train 403919 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[幽魂符文]|r|cRXP_WARN_来学习|r|T133816:0|t[刻印手套 - 幽魂]
    .use 205230
    .itemcount 205230,1 -- Rune of Haunting (1)
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 幽灵之影 - 2 (杜隆塔尔)
#displayname Haunt


    --Rune of Haunt

step << Orc
    #season 2
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .accept 77586 >>接任务: |cRXP_WARN_失窃的力量|r
    .target Nartok
    .train 403919,1
step
    #season 2
    .goto Durotar,42.99,54.43
    >>在洞穴内掠夺|cRXP_PICK_Waterlogged Stashbox|r, 获取其中的 |T134419:0|t[|cRXP_FRIENDLY_萦绕符文|r]
    .collect 205230,1 --Rune of Haunting (1)
    .train 403919,1
step
    #season 2
    .train 403919 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[幽魂符文]|r|cRXP_WARN_来学习|r|T133816:0|t[刻印手套 - 幽魂]
    .use 205230
    .itemcount 205230,1 -- Rune of Haunting (1)
step << Orc
    #season 2
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛娅|r交谈
    .turnin 77586 >>交任务: |cRXP_FRIENDLY_失窃的力量|r
    .target Nartok
    .isOnQuest 77586
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 幽魂 - 2(提瑞斯法林地)
#displayname Haunt


    --Rune of Haunt

step << Undead
    #season 2
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克希米林|r交谈
    .accept 77672 >>接受失落的符文
    .target Maximillion
step
    #season 2
    .goto Tirisfal Glades,24.60,59.45
    >>在洞穴内拾取|cRXP_PICK_失落胡须|r, 以获得 |T134419:0|t[|cRXP_FRIENDLY_萦绕符文|r]
    .collect 205230,1 --Rune of Haunting (1)
    .train 403919,1
step
    #season 2
    .cast 402265 >>使用 |T134939:0|t[|cRXP_FRIENDLY_法术说明:CALE ENCI|r]
    .use 205230
    .train 403919,1
step << Undead
    #season 2
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克希米林|r交谈
    .turnin 77672 >>交还失落的符文
    .target Maximillion


]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 灵魂虹吸 - 13 (杜隆塔尔)
#displayname Soul Siphon

step
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step
    .train 403920,1
    .goto Durotar,48.60,15.28
    .collect 205020,1 >>对一只小动物使用 |T136163:0|t[吸取灵魂], 即可获得 |T134095:0|t[纯净灵魂碎片]
step
    --Wowhead npc 3203 also possible, maybe better?
    .train 403920,1
    >>对|cRXP_ENEMY_Gazz'uz|r(在洞穴内)使用 |T136163:0|t[吸取灵魂], 以获得一个 |T134085:0|t[污染的灵魂碎片]. |cRXP_WARN_你无需击杀他, 可从下方对他使用此技能|r
    .goto Durotar,51.47,9.73
    .collect 205019,1
    .mob Gazz'uz
step
    .train 403920,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Darmak Bloodhowl|r交谈
    .goto Durotar,54.6,41.6
    .collect 205022,1
    .skipgossip 208226,1
    .target Darmak Bloodhowl
step
    .use 205022
    .itemcount 205022,1
    .train 403920 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_灵魂虹吸符文|r]|cRXP_WARN_来训练|r|T136169:0|t[灵魂虹吸]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 灵魂虹吸 - 9(提瑞斯法林地)
#displayname Soul Siphon

step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    #completewith next
    .train 403920,1
    .collect 205020,1 >>对一只小动物使用 |T136163:0|t[吸取灵魂], 即可获得 |T134095:0|t[纯净灵魂碎片]
step
    .train 403920,1
    >>对|cRXP_ENEMY_蛆眼|r使用 |T136163:0|t[吸取灵魂], 以获得一个 |T134085:0|t[污染的灵魂碎片]. |cRXP_WARN_你无需杀死他. |r
    .goto Tirisfal Glades,58.6,31.6
    .collect 205019,1
    .mob Maggot Eye
step
    .train 403920,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与幽暗城的|cRXP_FRIENDLY_Denton Bleakway|r交谈
    .goto Undercity,84.2,25.8
    .collect 205022,1
    .skipgossip 208682,1
    .target Denton Bleakway
step
    .use 205022
    .itemcount 205022,1
    .train 403920 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_灵魂虹吸符文|r]|cRXP_WARN_来训练|r|T136169:0|t[灵魂虹吸]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 恶魔战术 - 4(提瑞斯法林地)
#displayname Demonic Tactics

step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 416009,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dead Acolyte|r互动. 打开 |T133625:0|t[侍从的背包]
    .goto Tirisfal Glades,76.61,44.87
    .use 205364
    .collect 205181,1
    .collect 208224,1
    .skipgossip 208927,1
    .mob Dead Acolyte
step
    .train 416009,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅馆楼上的人|cRXP_FRIENDLY_鲁伯特·鲍什|r谈话
    .goto Tirisfal Glades,61.6,52.4
    .collect 205182,1
    .skipgossip 2127,2
    .target Rupert Boch
step
    .train 416009,1
    >>在符文石旁使用 |T133447:0|t[无力神器]. |cRXP_WARN_之后你有 10 分钟时间前往幽暗城(查看你的减益效果)|r
    .goto Tirisfal Glades,76.61,44.87
    .use 205182
    .collect 205183,1
step
    .train 416009,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与幽暗城的|cRXP_FRIENDLY_卡伦廷·哈尔加|r交谈
    .goto Undercity,85.0,25.6
    .collect 205215,1
    .skipgossip 5675,1
    .target Carendin Halgar
step
    .use 205215
    .itemcount 205215,1
    .train 416009 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_战术符文|r]|cRXP_WARN_来训练|r|T136150:0|t[恶魔战术]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 恶魔的恩赐 - 8(杜隆塔尔)
#displayname Demonic Grace

step
    #completewith DemonicGraceDurotarTome
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step
    #completewith DemonicGraceDurotarSkull
    >>击杀|cRXP_ENEMY_Makrura|r. 击败后搜刮出 |T133571:0|t[马库鲁拉腿]
    .collect 207732,1
    .mob Makrura Clacker
    .mob Makrura Shellhide
step
    #label DemonicGraceDurotarTome
    >>击杀妖术巨魔和巫毒巨魔. 从他们身上拾取[阴森之书]
    .goto Durotar,67.2,85.6
    .collect 207731,1
    .mob Hexed Troll
    .mob Voodoo Troll
step
    #label DemonicGraceDurotarSkull
    >>击杀|cRXP_ENEMY_Kul Tiran 人类|r. 击败他们后搜刮出 |T133730:0|t[库尔提拉斯骷髅]
    .goto Durotar,58.6,56.0
    .collect 207733,1
    .mob Kul Tiras Sailor
    .mob Kul Tiras Marine
step
    #loop
    .goto Durotar,61.0,43.0,50,0
    .goto Durotar,60.8,70.6,50,0
    .goto Durotar,51.6,84.6,50,0
    .goto Durotar,60.8,70.6,50,0
    >>击杀|cRXP_ENEMY_Makrura|r. 击败后搜刮出 |T133571:0|t[马库鲁拉腿]
    .collect 207732,1
    .mob Makrura Clacker
    .mob Makrura Shellhide
step
    .train 425477,1
    *|cRXP_WARN_CAREFUL: Others can tag your demon which means that you would have to farm the reagents again|r
    >>进入下水道. 在召唤圆环处使用 |T133733:0|t[不祥之书]. 击杀|cRXP_WARN_THE ELITE(可能需要寻求帮助)|r|cRXP_ENEMY_Soboz|r. 击败他后搜刮出 |T134419:0|t[|cRXP_FRIENDLY_恩典符文|r]
    .goto Durotar,67.45,87.83
    .collect 204912,1
    .mob Soboz
step
    .use 204912
    .itemcount 204912,1
    .train 425477 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_恩典符文|r]|cRXP_WARN_来学习|r|T236293:0|t[恶魔恩典]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 恶魔之恩 - 8(提瑞斯法林地)
#displayname Demonic Grace

step
    .train 425477,1
    #completewith DemonicGraceTirisfalGladesTome
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 425477,1
    #completewith DemonicGraceTirisfalGladesBlood
    >>击杀|cRXP_ENEMY_Darkhounds|r. 击败它们后搜刮出 |T133726:0|t[猎犬颚骨]
    .collect 207973,1
    .mob Cursed Darkhound
    .mob Decrepit Darkhound
    .mob Ravenous Darkhound
step
    .train 425477,1
    #label DemonicGraceTirisfalGladesTome
    >>击杀|cRXP_ENEMY_暗眼骷髅法师|r. 击败后可拾取 |T133733:0|t[诡秘之书]
    .goto Tirisfal Glades,47.6,36.4
    .collect 207974,1
    .mob Darkeye Bonecaster
step
    .train 425477,1
    #label DemonicGraceTirisfalGladesBlood
    >>击杀|cRXP_ENEMY_Rot Hides|r. 击败它们后搜刮出 |T133730:0|t[豺狼人之血]
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
    >>击杀|cRXP_ENEMY_Darkhounds|r. 击败它们后搜刮出 |T133726:0|t[猎犬颚骨]
    .collect 207973,1
    .mob Cursed Darkhound
    .mob Decrepit Darkhound
    .mob Ravenous Darkhound
step
    .train 425477,1
    *|cRXP_WARN_CAREFUL: Others can tag your demon which means that you would have to farm the reagents again|r
    >>进入下水道. 在召唤圆环处使用 |T133733:0|t[不祥之书]. 击杀|cRXP_WARN_THE ELITE(可能需要寻求帮助)|r|cRXP_ENEMY_Soboz|r. 击败他后搜刮出 |T134419:0|t[|cRXP_FRIENDLY_恩典符文|r]
    .goto Undercity,15.1,31.3,20,0
    .goto Undercity,24.11,41.59
    .collect 204912,1
    .mob Soboz
step
    .use 204912
    .itemcount 204912,1
    .train 425477 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_恩典符文|r]|cRXP_WARN_来学习|r|T236293:0|t[恶魔恩典]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文与书籍指南
-- #subgroup Chest << Mage
#subgroup Gloves << Warlock
-- #name 倦怠 - 8 (提瑞斯法林地) << Mage
#name 混乱之箭 - 8(提瑞斯法林地) << Warlock
#displayname Chaos Bolt << Warlock
#displayname Chaos Bolt << !Warlock
--Permok: Dont load it for mages for now

step << Mage
    >>从试剂商处购买一个(或多个)|T135933:0|t[领悟之咒]
    .collect 211779,1
step
    #completewith next
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step
    .train 403925,1 << Warlock
    .train 401759,1 << Mage
    .goto Tirisfal Glades,66.3,40.0
    >>解冻|cRXP_ENEMY_Frozen Murloc|r, 使用火焰法术将其击败. 击杀后可获得 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Burnout|r] << Mage
    >>解冻|cRXP_ENEMY_冰冻的鱼人|r|cRXP_WARN_|, 使用火系法术将其击败. 击败后可获得 |T134419:0|t[|cRXP_FRIENDLY_混沌 bolt符文|r] << Warlock
    *|cRXP_WARN_At low levels you won't be able to free it alone, search for another Warlock of Mage|r
    .collect 205228,1 << Warlock
    .collect 203748,1 << Mage
    .mob Frozen Murloc
step
    .use 205228 << Warlock
    .use 203748 << Mage
    .itemcount 205228,1 << Warlock
    .itemcount 203748,1 << Mage
    .collect 211779,1 >>你需要从试剂商处获得一个 |T135933:0|t[理解之魅] 才能使用该物品 << Mage
    .train 403925 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_混乱之箭符文|r]|cRXP_WARN_来训练|r|T236291:0|t[混乱之箭]  << Warlock
    .train 401759 >>使用 |T134939:0|t[|cRXP_FRIENDLY_法术说明:燃尽|r]|cRXP_WARN_去训练|r|T236207:0|t[燃尽] << Mage
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 火湖 - 25(希尔斯布莱德丘陵)
#displayname Lake of Fire

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
    >>寻找|cRXP_FRIENDLY_吉克希尔|r. 他在塔伦米尔和南海镇之间巡逻. 从他那里购买 |T133709:0|t[爆破炸药], 价格为1金币
    .collect 211487,1
    .target Zixil
step
    .train 403937,1
    >>使用 |T133709:0|t[爆破炸药]摧毁|cRXP_PICK_碎石|r. 拾取地面上的|cRXP_PICK_储物柜|r, 获得 |T134419:0|t[|cRXP_FRIENDLY_烈焰符文 Wake|r]
    .goto Hillsbrad Foothills,79.7,41.0
    .collect 211476,1
step
    .use 211476
    .itemcount 211476,1
    .train 403937 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_烈焰符文|r] |cRXP_WARN_来训练|r|T135826:0|t[火湖]
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#name 灼烧 - 22(赤脊山)
#displayname Incinerate

step
    #completewith next
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
step
    .goto Redridge Mountains,74.0,82.2,60,0
    .goto Redridge Mountains,77.6,86.6,50,0
    .goto Redridge Mountains,76.8,82.2
    >>击杀|cRXP_ENEMY_焚化者加林|r|cRXP_WARN_(等级23精英)|r. 击败后可获得 |T134419:0|t[|cRXP_FRIENDLY_灼烧符文|r]
    .collect 211477,1
    .unitscan Incinerator Gar'im
    .train 416015,1
step
    .use 211477
    .itemcount 211477,1
    .train 416015 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_焚化符文|r]|cRXP_WARN_来学习|r|T135789:0|t[焚化]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 大师引导者 - 12(贫瘠之地)
#displayname Master Channeler

step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 403932,1
    >>|cRXP_WARN_前往荆棘祭坛|r. 施放 |T136126:0|t[生命分流], 直到你几乎濒死. 然后对你宠物施放 |T136168:0|t[生命汲取], 使其死亡并获得 |T134419:0|t[|cRXP_FRIENDLY_引导符文|r]
    *|cRXP_WARN_You will be revived immediately after dying|r
    .goto The Barrens,58.2,26.7
    .cast 1454
    .cast 735
    .collect 208750,1
step
    .use 208750
    .itemcount 208750,1
    .train 403932 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_引导符文|r]|cRXP_WARN_来训练|r|T136168:0|t[引导大师]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 引导大师 - 14 (银松森林)
#displayname Master Channeler

step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .train 403932,1
    >>进入路径点位置的洞穴, 使用 |T136225:0|t[鲁莽诅咒] 对|cRXP_ENEMY_Sadistic Fiend|r(残忍狂魔)施法, 击杀它并拾取 |T134419:0|t[|cRXP_FRIENDLY_引导符文|r]
    .goto Silverpine Forest,56.6,46.4
    .collect 208750,1
    .mob Sadistic Fiend
step
    .use 208750
    .itemcount 208750,1
    .train 403932 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_引导符文|r]|cRXP_WARN_来训练|r|T136168:0|t[引导大师]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 暗影箭雨 - 16(贫瘠之地)
#displayname Shadow Bolt Volley

step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 403936,1
    >>对|cRXP_ENEMY_鲁格维兹主管|r 使用 |T136163:0|t[吸取灵魂](|cRXP_ENEMY_监工格里比|r 可能也有效), 直到获得 |T134105:0|t[贪婪之魂]
    *|cRXP_WARN_You don't need the tag|r
    .goto The Barrens,56.6,8.2
    .collect 208743,1
    .mob Supervisor Lugwizzle
    .mob Overseer Glibby
step
    .train 403936,1
    >>点击|cRXP_PICK_Hungry Idol|r以获得 |T134419:0|t[|cRXP_FRIENDLY_影箭符文|r]
    .goto The Barrens,57.06,9.65
    .collect 208744,1
step
    .use 208744
    .itemcount 208744,1
    .train 403936 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_暗影箭符文|r]|cRXP_WARN_来学习|r|T136195:0|t[暗影箭雨]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 暗影箭雨 - 18(银松森林)
#displayname Shadow Bolt Volley

step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
step
    .goto Silverpine Forest,60.38,74.37,40,0
    .goto Silverpine Forest,60.29,72.21,40,0
    .goto Silverpine Forest,59.38,70.54
    .train 403936,1
    >>击杀|cRXP_ENEMY_鸦爪苦工|r和 |cRXP_ENEMY_鸦爪守护者|r|cRXP_WARN_在洞穴内|r. 击败他们后可获得 |T236295:0|t[被折磨的灵魂]
    .collect 210713,1
    .mob Ravenclaw Drudger
    .mob Ravenclaw Guardian
step
    .train 403936,1
    >>使用 |T136126:0|t[生命分流] 一次, 然后使用 |T236295:0|t[被折磨的灵魂]. 击杀 |cRXP_ENEMY_被折磨的灵魂|r. 拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_暗影箭符文|r]
    .collect 208744,1
    .use 210713
    .cast 1455
    .mob Tortured Soul
step
    .use 208744
    .itemcount 208744,1
    .train 403936 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_暗影箭符文|r]|cRXP_WARN_来学习|r|T136195:0|t[暗影箭雨]
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 恶魔变身 - 25(艾泽拉斯)
#displayname Metamorphosis

step
    #completewith WarlockRuneMetamorphosisA
    +|cRXP_WARN_建议以团队形式完成所有这些步骤, 部分步骤可单独完成|r
step
    #completewith next
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r, 前往赤脊山（例如从棘齿城乘船到藏宝海湾，然后向北前进） << Horde
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r << Alliance
step
    #label WarlockRuneMetamorphosisA
    .train 403938,1
    >>在塔顶拾取|cRXP_PICK_Demonic Reliquary|r以获得 |T134337:0|t[毁灭之球]
    *|cRXP_WARN_Be careful as it's guarded by an elite. Loot the chest whilst your Voidwalker tanks the mobs|r
    .collect 210765,1
    .goto Redridge Mountains,80.2,49.5
step << Horde
    .train 403938,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜安·卡汉|r交谈
    *|cRXP_WARN_Skip this step if you're traveling through The Barrens|r
    .goto The Barrens,49.2,57.2
    .accept 1740 >>接任务: |cRXP_WARN_索兰鲁克宝珠|r
    .target Doan Karhan
step
    #completewith next
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r << Alliance
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r << Horde
step
    .train 403938,1
    >>在塔顶拾取|cRXP_PICK_Bough of Altek|r, 以获得 |T135153:0|t[奥尔特克之枝]
    *|cRXP_WARN_Be careful. One way would be to die near it, jump up behind the bookcase, ress, (maybe fear the first caster that would attack you) and loot it.|r
    .collect 210763,1
    .goto Darkshore,56.3,26.5
step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 403938,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜安·卡汉|r交谈
    .goto The Barrens,49.2,57.2
    .accept 1740 >>接任务: |cRXP_WARN_索兰鲁克宝珠|r
    .target Doan Karhan
step
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step
    .train 403938,1
    >>在BFD团队副本入口附近击杀暮光侍僧, 从他们身上拾取索兰鲁克碎片
    *|cRXP_WARN_The |cRXP_WARN_Twilight Acolyte|r inside the raid before the 5th boss drop them as well|r
    .goto Ashenvale,14.5,14.3
    .complete 1740,1 --3/3 Soran'ruk Fragment
    .mob Twilight Acolyte
step
    .train 403938,1
    >>击杀影牙城堡地牢内的影牙魔魂狼人(在击败席瓦莱恩男爵后向右前进). 从他们身上拾取大型索兰鲁克碎片
    .complete 1740,2 --1/1 Large Soran'ruk Fragment
    .mob Shadowfang Darksoul
step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 403938,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜安·卡汉|r交谈
    .goto The Barrens,49.2,57.2
    .turnin 1740 >>交任务: |cRXP_FRIENDLY_索兰鲁克宝珠|r
    .accept 78680 >>接受任务:谣言四起
    .turnin 78680 >>提交任务:谣言四起
    .accept 78681 >>接受召唤
    .target Doan Karhan
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
    >>击杀该区域的|cRXP_ENEMY_Demons|r恶魔. 击杀后掠夺它们, 获取|cRXP_LOOT_Blood of the Legion|r亵渎之血
    .complete 78681,1 --10/10 Blood of the Legion
    .mob Mannoroc Lasher
    .mob Felguard
    .mob Searing Infernal
    .mob Legion Hound
step
    #completewith WarlockRuneMetamorphosisB
    +|cRXP_WARN_如果你和一群术士组队, 那么第一个接到任务的术士(即身上带有减益效果的那位)必须在符文范围内, 对|cRXP_ENEMY_灼热的地狱火|r造成最后一击, 才能完成任务|r
step
    .train 403938,1
    >>与 |cRXP_PICK_黑暗仪式石|r 互动
    .goto Ashenvale,78.92,80.29
    .turnin 78681 >>交出《招魂》
    .target Dark Ritual Stone
step
    .train 403938,1
    #label WarlockRuneMetamorphosisB
    >>击杀生成的|cRXP_ENEMY_恶魔|r. |cRXP_WARN_在施放|cRXP_ENEMY_灼热的地狱火|r的同时, 且站在符文内时|r |T136163:0|t[吸取灵魂]|cRXP_WARN_时|r
    .goto Ashenvale,79.00,80.38
    .accept 78684 >>接受神秘旅人
    .mob Searing Infernal
step
    .train 403938,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜安·卡汉|t交谈以获得|T134419:0|t[|cRXP_FRIENDLY_变形符文|r]
    .goto The Barrens,49.2,57.2
    .turnin 78684 >>交予神秘旅人
    .turnin 78702 >>交予拉泽尔·安德
    .collect 210980,1
    .target Doan Karhan
step
    .use 210980
    .itemcount 210980,1
    .train 403938 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_变形符文|r] |cRXP_WARN_来训练|r|T237558:0|t[恶魔变身]
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 协同魔典 - 40 (艾泽拉斯)
#displayname Grimoire of Synergy

step
    #optional
    #completewith next
    .train 426445,1
    +|cRXP_WARN_你必须至少达到30级才能获得|r|T133738:0|t[协同法典]|cRXP_WARN_rune|r
    .xp >30,1
step
    .train 403938 >>|cRXP_WARN_你必须先获得|r|T237558:0|t[恶魔变身]|cRXP_WARN_符文, 才能获得|r|T133738:0|t[协同魔典]|cRXP_WARN_符文|r
step
    #optional
    .train 426445,1
    +|cRXP_WARN_你必须至少达到30级才能获得|r|T133738:0|t[协同法典]|cRXP_WARN_rune|r
    .xp >30,1
step
    .train 426445,1
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 426445,1
    .goto The Barrens,49.271,57.239
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|RXP_FRIENDLY_Raszel Ander|r交谈
    >>|cRXP_WARN_你必须在|r|T237558:0|t[恶魔变身] |cRXP_WARN_中才能看到|r|cRXP_FRIENDLY_拉泽尔·安德|r
    .accept 78994 >>接受稳固的基础
    .target Raszel Ander
step << Alliance
    .train 426445,1
    .isOnQuest 78994
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板维尔雷|r交谈
    .home >>将你的[炉石]设置为棘齿城
    .target Innkeeper Wiley
step << Horde
    .train 426445,1
    .isOnQuest 78994
    .goto The Barrens,45.58,59.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
    .home >>将你的炉石设置为陶拉祖营地
    .target Innkeeper Byula
step << Alliance
    .train 426445,1
    .isOnQuest 78994
    .goto The Barrens,63.084,37.163
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Azshara >>飞往艾萨拉
    .target Bragok
step << Horde
    .train 426445,1
    .isOnQuest 78994
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
    .fly Splintertree Post >>飞往裂枝岗哨
    .target Omusa Thunderhorn
step
    .train 426445,1
    .train 126,3 -- skips step if they don't have eye of killrog trained
    .isOnQuest 78994
    .goto Ashenvale,88.82,41.52
    >>|cRXP_WARN_前往灰谷的箭头位置|r
    .cast 126 >>|cRXP_WARN_使用|r|T136155:0|t[基尔罗格之眼]|cRXP_WARN_并带着它前往黑影树丛(该区域全是60级以上精英)寻找一棵|cRXP_PICK_黑影树|r. 黑影树丛中可能有多个刷新点, 理想情况下应找到一个附近没有太多精英的刷新点, 以便安全拾取|r
step
    .train 426445,1
    .isOnQuest 78994
    #completewith next
    .goto Ashenvale,88.82,41.52
    .cast 440505 >>|cRXP_WARN_使用|r|T236874:0|t[隐形药水] |cRXP_WARN_并寻找遍布布ough Shadow的|cRXP_PICK_黑影树|r. 该区域有许多等级60以上的精英巡逻|r
    .use 217693
step
    .train 426445,1
    .isOnQuest 78994
    .goto Ashenvale,90.9,38.6,20,0
    .goto Ashenvale,91,37,0
    >>|cRXP_WARN_在拾取|cRXP_PICK_Bough of Shadows|r之前, 请卸下所有装备并施放 |T136121:0|t[暗影结界]|cRXP_WARN_. 你将受到一个高额百分比伤害的负面效果, 拾取后请立即使用[炉石]|r
    >>在黑影枝条中任意拾取|cRXP_PICK_Bough of Shadows|r
    .complete 78994,1
step
    #completewith next
    .train 426445,1
    .isOnQuest 78994
    .hs >>传送回棘齿城 << Alliance
    .hs >>传送至陶拉祖营地 << Horde
    .zoneskip The Barrens
step
    .train 426445,1
    .goto The Barrens,49.271,57.239
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|RXP_FRIENDLY_Raszel Ander|r交谈
    >>|cRXP_WARN_你必须在|r|T237558:0|t[恶魔变身] |cRXP_WARN_中才能看到|r|cRXP_FRIENDLY_拉泽尔·安德|r
    .turnin 78994 >>交付“坚实的基础”
    .accept 78914 >>接受灵魂容器
    .target Raszel Ander
step
    .train 426445,1
    >>|cRXP_WARN_获取以下材料, 并请工程师为你制作一个|r |T133254:0|t[灵魂容器] |cRXP_WARN_. 请注意, |r |T134133:0|t[黑色硫酸盐] |cRXP_WARN_和|r |T134074:0|t[暗影石] |cRXP_WARN_可从拍卖行购买, 而|r |T134337:0|t[恶魔雕像] |cRXP_WARN_则可从|r |cRXP_FRIENDLY_试剂商处获得|r
    .collect 9262,1,78914,1,1 -- Black Vitriol
    .collect 1210,4,78914,1,1 -- Shadowgem
    .collect 16583,1,78914,1,1 -- Demonic Figurine
    >>|cRXP_WARN_或者你可以直接从拍卖行购买|r|T133254:0|t[灵魂容器]|r
    .collect 211427,1,78914,1
step
    #completewith next
    .train 426445,1
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .train 426445,1
    .goto Desolace,51.171,82.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|RXP_FRIENDLY_Raszel Ander|r交谈
    >>|cRXP_WARN_你必须在|r|T237558:0|t[恶魔变身] |cRXP_WARN_中才能看到|r|cRXP_FRIENDLY_拉泽尔·安德|r
    .turnin 78914 >>提交灵魂容器
    .accept 79298 >>接受诱惑的命运
    .target Raszel Ander
step
    .train 426445,1
    .goto Desolace,51.171,82.425
    .gossip 215850,1 >>与|cRXP_FRIENDLY_Raszel Ander|r交谈以开始仪式
    .timer 14,Tempting Fate RP
    .skipgossip
step
    .train 426445,1
    .goto Desolace,51.195,82.465
    >>点击|cRXP_PICK_德萨尔特克的重建法杖|r以召唤|cRXP_ENEMY_德萨尔特克|r
    >>|cRXP_WARN_确保你在满血状态下使用|r|T136121:0|t[暗影结界] |cRXP_WARN_active, 因为在引导过程中及整个战斗期间你都会受到伤害|r
    >>击杀|cRXP_ENEMY_Des'Altek|r
    .complete 79298,1
    .mob Des'Altek
step
    .train 426445,1
    .goto Desolace,51.171,82.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|RXP_FRIENDLY_Raszel Ander|r交谈
    >>|cRXP_WARN_你必须在|r|T237558:0|t[恶魔变身] |cRXP_WARN_中才能看到|r|cRXP_FRIENDLY_拉泽尔·安德|r
    .turnin 79298 >>提交任务“诱惑命运”
    .target Raszel Ander
step
    .train 426445 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_协同符文|r]|cRXP_WARN_来训练|r|T133738:0|t[协同法典]
    .use 213090
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 引导大师 - 10 (洛克莫丹)
#displayname Master Channeler

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
    >>|cRXP_WARN_寻找在洛克莫丹道路上巡逻的|cRXP_FRIENDLY_格雷珊·铁炉|r. 他的巡逻路线已标记在你的地图上|r
    >>|cRXP_BUY_从他那里购买 a|r|T237359:0|t[恶意馅饼]|r
    .collect 208833,1
    .unitscan Greishan Ironstove
    .train 403932,1
step << Warlock
    .use 208833 >>|cRXP_WARN_使用|r|T237359:0|t[恶意馅饼]|cRXP_WARN_吃掉它. 当|r|T132108:0|t[地狱消化不良]|cRXP_WARN_减益效果消失后, 你将获得|r|T134419:0|t[|cRXP_FRIENDLY_引导符文|r]
    .collect 208750,1 -- Rune of Channeling (1)
    .train 403932,1
step << Warlock
    .train 403932 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_引导符文|r]|cRXP_WARN_来训练|r|T136168:0|t[引导大师]
    .use 208750
    .itemcount 208750,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 通灵大师 - 15 (黑海岸)
#displayname Master Channeler

step << Warlock
    .goto Darkshore,55.27,27.74,40,0
    .goto Darkshore,56.92,27.27,40,0
    .goto Darkshore,57.54,25.99,40,0
    .goto Darkshore,56.92,27.27,40,0
    .goto Darkshore,55.27,27.74
    >>击杀|cRXP_ENEMY_暗滩狂热者|r. 击败他们后搜刮出 |T134419:0|t[|cRXP_FRIENDLY_引导符文|r]
    .collect 208750,1 -- Rune of Channeling (1)
    .mob Dark Strand Fanatic
    .train 403932,1
step << Warlock
    .train 403932 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_引导符文|r]|cRXP_WARN_来训练|r|T136168:0|t[引导大师]
    .use 208750
    .itemcount 208750,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#name 灵魂虹吸 - 10(杜隆塔尔)
#displayname Soul Siphon

step << Warlock
    #completewith next
    >>|cRXP_WARN_施放|r|T136163:0|t[灵魂汲取]|cRXP_WARN_对任何生物造成|r|T134095:0|t[|cRXP_LOOT_纯净灵魂碎片|r]
    .collect 205020,1 -- Pure Soul Shard (1)
    .train 403920,1
step << Warlock
    .goto Dun Morogh,77.894,62.236
    >>击杀楼下建筑内的 |cRXP_ENEMY_贝尔德队长|r. 搜刮他以获得 |T134085:0|t[|cRXP_LOOT_被污染的灵魂碎片|r]
    >>|cRXP_WARN_确保他在你身上带有|r|T136163:0|t[吸取灵魂]|cRXP_WARN_, 在死亡时|r
    .collect 205019,1 -- Tainted Soul Shard (1)
    .mob Captain Beld
    .train 403920,1
step << Warlock
    >>|cRXP_WARN_施放|r|T136163:0|t[灵魂汲取]|cRXP_WARN_对任何生物造成|r|T134095:0|t[|cRXP_LOOT_纯净灵魂碎片|r]
    .collect 205020,1 -- Pure Soul Shard (1)
    .train 403920,1
step << Warlock
    .goto Dun Morogh,47.351,53.550
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加克利克·虚空扭曲|r交谈, 以获得|T134419:0|t[|cRXP_FRIENDLY_吸魂符文|r]
    .collect 205022,1 -- Rune of Soul Siphon (1)
    .skipgossip
    .itemcount 205020,1
    .itemcount 205019,1
    .target Gaklik Voidtwist
step << Warlock
    .train 403920 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_灵魂虹吸符文|r]|cRXP_WARN_来训练|r|T136169:0|t[灵魂虹吸]
    .use 208750
    .itemcount 208750,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 灵魂吸取 - 10(艾尔文森林)
#displayname Soul Siphon

step << Warlock
    #completewith next
    >>|cRXP_WARN_施放|r|T136163:0|t[灵魂汲取]|cRXP_WARN_对任何生物造成|r|T134095:0|t[|cRXP_LOOT_纯净灵魂碎片|r]
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
    >>击杀|cRXP_ENEMY_霍格|r. 击败他后搜刮出一个 |T134085:0|t[|cRXP_LOOT_灵魂碎片|r]
    >>|cRXP_WARN_确保他在你身上带有|r|T136163:0|t[吸取灵魂]|cRXP_WARN_, 在死亡时|r
    .collect 205019,1 -- Tainted Soul Shard (1)
    .mob Hogger
    .train 403920,1
step << Warlock
    >>|cRXP_WARN_施放|r|T136163:0|t[灵魂汲取]|cRXP_WARN_对任何生物造成|r|T134095:0|t[|cRXP_LOOT_纯净灵魂碎片|r]
    .collect 205020,1 -- Pure Soul Shard (1)
    .train 403920,1
step << Warlock
    .goto Elwynn Forest,44.093,66.315
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往旅店地下室与|cRXP_FRIENDLY_达米安·凯恩|r交谈, 以获得[灵魂吸取符文]
    .collect 205022,1 -- Rune of Soul Siphon (1)
    .skipgossip
    .itemcount 205020,1
    .itemcount 205019,1
    .target Damien Kane
step << Warlock
    .train 403920 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_灵魂虹吸符文|r]|cRXP_WARN_来训练|r|T136169:0|t[灵魂虹吸]
    .use 208750
    .itemcount 208750,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 恶魔战术 - 1(艾尔文森林)
#displayname Demonic Tactics

step << Warlock
    .goto Elwynn Forest,56.743,57.650
    >>击杀|cRXP_FRIENDLY_Dead Acolyte|r, 以获得 |T133625:0|t[|cRXP_LOOT_Acolyte's Knapsack|r]
    .collect 205364,1 -- Acolyte's Knapsack (1)
    .skipgossip
    .target Dead Acolyte
    .train 416009,1
step << Warlock
    .use 205364 >>|cRXP_WARN_使用|r|T133625:0|t[|cRXP_LOOT_侍僧的背包|r]|cRXP_WARN_来获取一个|r|T133447:0|t[|cRXP_LOOT_未识别的神器|r]
    .collect 205181,1 -- Unidentified Artifact (1)
    .train 416009,1
step << Warlock
    .goto Elwynn Forest,44.390,66.242
    .gossipoption 109291 >>在闪金镇酒馆地下室与|cRXP_FRIENDLY_玛克西米利安·克洛文|r交谈, 以获得|T133447:0|t[|cRXP_LOOT_无能之物|r]
    .collect 205182,1 -- Powerless Artifact (1)
    .skipgossip
    .target Maximillian Crowe
    .train 416009,1
step << Warlock
    .goto Elwynn Forest,56.743,57.650
    .cast 408755 >>|cRXP_WARN_使用|r|T133447:0|t[|cRXP_LOOT_无能神器|r]|cRXP_WARN_在|r|cRXP_FRIENDLY_亡灵祭司的位置|r处, 以获得|r|T136008:0|t[鲜血献祭]|cRXP_WARN_减益效果|r
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
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
    .train 416009,1
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈, 以获得|T134419:0|t[|cRXP_FRIENDLY_战术符文|r]
    .collect 205215,1 -- Rune of Tactics (1)
    .skipgossip
    .target Gakin the Darkbinder
    .train 416009,1
step << Warlock
    .train 416009 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_战术符文|r]|cRXP_WARN_来训练|r|T136150:0|t[恶魔战术]
    .use 205215
    .itemcount 205215,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 恶魔恩赐 - 10(艾尔文森林)
#displayname Demonic Grace

step << Warlock
    .goto Elwynn Forest,61.6,53.8
    >>击杀|cRXP_ENEMY_狗头人地卜师|r. 击败后可掠夺出一个 |T133733:0|t[|cRXP_LOOT_阴谋之书|r]
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
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r 和|cRXP_ENEMY_河爪豺狼人前锋|r . 掠夺他们的|cRXP_LOOT_Gnoll Blood|r
    .collect 204906,1 -- Gnoll Blood (1)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
    .train 425477,1
step << Warlock
    .goto Elwynn Forest,35.6,61.0,60,0
    .goto Elwynn Forest,57.8,59.4
    >>击杀|cRXP_ENEMY_Mangy Wolves|r和|cRXP_ENEMY_Gray Forest Wolves|r和|cRXP_ENEMY_觅食的灰狼|r, 掠夺它们以获得|cRXP_LOOT_Wolf Jawbone|r
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
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
    .train 425477,1
step << Warlock
    #completewith next
    .goto StormwindClassic,25.2,80.7,18,0
    .goto StormwindClassic,23.2,79.5,18,0
    .goto StormwindClassic,26.3,79.5,18,0
    .goto StormwindClassic,25.154,77.406
    >>|cRXP_WARN_前往已宰的羔羊底部|r
    .cast 418065 >>|cRXP_WARN_使用|r|T133733:0|t[|cRXP_LOOT_阴森之书|r]|cRXP_WARN_来召唤|r|cRXP_ENEMY_索博兹|r
    .use 204905
    .train 425477,1
step << Warlock
    .goto StormwindClassic,25.154,77.406
    .use 204905 >>击杀|cRXP_ENEMY_Soboz|r. 击败他后搜刮物品, 获得 |T134419:0|t[|cRXP_FRIENDLY_符文之恩赐|r]
    .collect 204912,1 -- Rune of Grace (1)
    .mob Soboz
    .train 425477,1
step << Warlock
    .train 425477 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_恩典符文|r]|cRXP_WARN_来学习|r|T236293:0|t[恶魔恩典]
    .use 204912
    .itemcount 204912,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 恶魔恩赐 - 10(丹莫洛)
#displayname Demonic Grace

step << Warlock
    .goto Dun Morogh,22.8,50.6
    >>击杀|cRXP_ENEMY_霜鬃暗法师|r. 击败后可拾取 |T133733:0|t[|cRXP_LOOT_阴谋之书|r]
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
    >>击杀|cRXP_ENEMY_雪怪幼崽|r 和|cRXP_ENEMY_雪怪|r . 击败它们获取|cRXP_LOOT_雪怪之血|r
    .collect 208140,1 -- Wendigo Blood (1)
    .mob Young Wendigo
    .mob Wendigo
    .train 425477,1
step << Warlock
    .goto Dun Morogh,45.6,43.2,60,0
    .goto Dun Morogh,34.6,41.8
    >>击杀丹莫洛的任意狼. 从它们身上搜刮狼下颌骨
    .collect 204907,1 -- Wolf Jawbone
    .mob Starving Winter Wolf
    .mob Winter Wolf
    .mob Snow Tracker Wolf
    .train 425477,1
step << Warlock
    .goto Dun Morogh,42.23,35.40
    .cast 418065 >>|cRXP_WARN_使用|r|T133733:0|t[|cRXP_LOOT_阴森之书|r]|cRXP_WARN_来召唤|r|cRXP_ENEMY_索博兹|r
    .use 208139
    .train 425477,1
step << Warlock
    .goto Dun Morogh,42.23,35.40
    .use 204905 >>击杀|cRXP_ENEMY_Soboz|r. 击败他后搜刮物品, 获得 |T134419:0|t[|cRXP_FRIENDLY_符文之恩赐|r]
    .collect 204912,1 -- Rune of Grace (1)
    .mob Soboz
    .train 425477,1
step << Warlock
    .train 425477 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_恩典符文|r]|cRXP_WARN_来学习|r|T236293:0|t[恶魔恩典]
    .use 204912
    .itemcount 204912,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 暗影箭雨 - 16 (黑海岸)
#displayname Shadow Bolt Volley

step << Warlock
    .goto Darkshore,56.8,27.6,60,0
    .goto Darkshore,57.6,26.0
    >>击杀被憎恨的德玛尼斯. 从他身上搜刮出暗影箭符文
    .collect 208744,1 -- Rune of Shadowbolts (1)
    .unitscan Delmanis the Hated
    .train 403936,1
step << Warlock
    .train 403936 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_暗影箭符文|r]|cRXP_WARN_来学习|r|T136195:0|t[暗影箭雨]
    .use 208744
    .itemcount 208744,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 混乱弹丸 - 8 (丹莫洛)
#displayname Chaos Bolt

step << Warlock
    .goto Dun Morogh,69.365,58.302
    >>击杀|cRXP_ENEMY_Frozen Trogg|r. 击败后拾取其掉落的 |T134419:0|t[|cRXP_FRIENDLY_混沌之箭符文|r]
    >>|cRXP_WARN_注意:要击碎冰块, 你必须连续快速地使用多个火焰法术攻击它|r
    >>|cRXP_WARN_施放|r|T135817:0|t[献祭]|cRXP_WARN_并使用你的地狱火小鬼攻击目标. 你需要另一位术士或法师协助打断它|r
    .collect 205228,1 -- Rune of Chaos Bolt (1)
    .mob Frozen Trogg
    .train 403925,1
step << Warlock
    .train 403925 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_混乱之箭符文|r]|cRXP_WARN_来训练|r|T236291:0|t[混乱之箭]
    .use 208744
    .itemcount 208744,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 混乱之箭 - 8(艾尔文森林)
#displayname Chaos Bolt

step << Warlock
    .goto Elwynn Forest,77.010,51.897
    >>击杀|cRXP_ENEMY_冻僵鱼人|r. 击败后拾取其掉落的 |T134419:0|t[|cRXP_FRIENDLY_混沌之箭符文|r]
    >>|cRXP_WARN_注意:要击碎冰块, 你必须连续快速地使用多个火焰法术攻击它|r
    >>|cRXP_WARN_施放|r|T135817:0|t[献祭]|cRXP_WARN_并使用你的地狱火小鬼攻击目标. 你需要另一位术士或法师协助打断它|r
    .collect 205228,1 -- Rune of Chaos Bolt (1)
    .mob Frozen Murloc
    .train 403925,1
step << Warlock
    .train 403925 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_混乱之箭符文|r]|cRXP_WARN_来训练|r|T236291:0|t[混乱之箭]
    .use 208744
    .itemcount 208744,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 召唤 - 35(阿拉希高地)
#displayname Invocation

-- Invocation

step
    .train 426443,1
    #completewith SyndicateConjuror
    +|cRXP_WARN_建议你寻找额外的队友来获取|r|T134419:0|t[|cRXP_LOOT_召唤符文|r]|cRXP_WARN_, 因为它需要在激流堡要塞中击杀精英敌人|r
step
    .train 426443,1
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    .train 426443,1
    #completewith next
    .subzone 324 >>前往激流堡要塞
step
    #label SyndicateConjuror
    .train 426443,1
    #loop
    .goto Arathi Highlands,26.04,62.80,40,0
    .goto Arathi Highlands,29.47,64.14,40,0
    .goto Arathi Highlands,29.06,60.96,40,0
    >>击杀|cRXP_ENEMY_辛迪咒术师|r. 击杀后搜刮其身上的 |T348282:0|t[|cRXP_LOOT_咒术师吊坠|r ]
    >>在对虚空行者仆从施放[灵魂汲取]期间将其击杀, 即可获得[虚空之魂]
    .collect 213573,10
    .collect 213572,1
    .mob Syndicate Conjuror
    .mob Voidwalker Minion
step
    #completewith next
    .train 426443,1
    .goto Arathi Highlands,29.292,62.283,10 >>|cRXP_WARN_进入斯托姆加德要塞下层的大房子, 然后上到二楼|r
step
    #completewith next
    .train 426443,1
    .goto Arathi Highlands,29.077,63.079
    .cast 434994 >>|cRXP_WARN_使用|r|T348282:0|t[|cRXP_LOOT_召唤师吊坠|r]|cRXP_WARN_在浮空平台附近的楼梯上|r|cRXP_PICK_虚空棱镜|r|cRXP_WARN_来召唤一只36级精英|r|cRXP_ENEMY_虚空搜寻者|r
    .use 213573
step
    .train 426443,1
    .goto Arathi Highlands,29.077,63.079
    >>击杀|cRXP_ENEMY_虚空搜寻者|r, 击败后拾取其掉落的 |T134419:0|t[|cRXP_LOOT_召唤符文|r]
    .collect 213098,1
    .mob Void Seeker
step
    .train 426443 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_LOOT_召唤符文|r]|cRXP_WARN_来训练|r|T136133:0|t[唤术]
    .use 213098
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#name 邪舞之章 - 35(荒芜之地)
#displayname Dance of the Wicked

-- Dance of the Wicked

step
    .train 416017,1
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .train 416017,1
    .goto Desolace,74.5,13.4
    >>点击地面上的|cRXP_ENEMY_Reckless Warlock|r, 击杀后拾取 |T236297:0|t[硫磺雕刻]
    >>|cRXP_WARN_这是一个稀有敌人, 可能不会出现|r
    .collect 213583,1
    .mob Reckless Warlock
    .unitscan Reckless Warlock
step
    .train 416017,1
    >>|cRXP_WARN_施放|r|T135818:0|t[地狱火]|cRXP_WARN_对自己造成伤害, 使其生命值低于70%. 之后|r|T236297:0|t[硫磺雕刻]|cRXP_WARN_将转化为|r|T134419:0|t[|cRXP_FRIENDLY_邪恶符文|r]
    .collect 213102,1 --Rune of Wickedness
step
    .train 416017 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_邪恶符文|r]|cRXP_WARN_来学习|r|T236295:0|t[邪能之舞]
    .use 416017
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#name 邪舞之章 - 35(荆棘谷)
#displayname Dance of the Wicked

-- Dance of the Wicked

step
    .train 416017,1
    #completewith next
    .zone Stranglethorn Vale>>前往荆棘谷
step
    .train 416017,1
    .goto Stranglethorn Vale,31.2,47.4
    >>点击地面上的|cRXP_ENEMY_Reckless Warlock|r, 击杀后拾取 |T236297:0|t[硫磺雕刻]
    >>|cRXP_WARN_这是一个稀有敌人, 可能不会出现|r
    .collect 213583,1
    .unitscan Reckless Warlock
    .mob Reckless Warlock
step
    .train 416017,1
    >>|cRXP_WARN_施放|r|T135818:0|t[地狱火]|cRXP_WARN_对自己造成伤害, 使其生命值低于70%. 之后|r|T236297:0|t[硫磺雕刻]|cRXP_WARN_将转化为|r|T134419:0|t[|cRXP_FRIENDLY_邪恶符文|r]
    .collect 213102,1 --Rune of Wickedness
step
    .train 416017 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_邪恶符文|r]|cRXP_WARN_来学习|r|T236295:0|t[邪能之舞]
    .use 416017
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#name 暗影之焰 - 40(荒芜之地)
#displayname Shadowflame


-- Shadowflame

step
    .train 426467,1
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r, |cRXP_WARN_强烈建议至少组成 3 人小队。|r
step
    .train 426467,1
    .train 19028,3 --Soul Link
    .goto Desolace,81.2,79.7
    .cast 434869 >>|cRXP_WARN_点击祭坛召唤|r|cRXP_ENEMY_魅惑者 Ceeyna|r|cRXP_WARN_但务必提前使用|r|T136121:0|t[暗影结界]|cRXP_WARN_和|r|T136190:0|t[献祭]|cRXP_WARN_和|r|T136160:0|t[灵魂链接]|r|cRXP_WARN_技能|r|cFFFF0000因为你在引导期间会受到大量伤害, 且无法被治疗|r
step
    .train 426467,1
    .train 19028,1 --Soul Link
    .goto Desolace,81.2,79.7
    .cast 434869 >>|cRXP_WARN_点击祭坛召唤|r|cRXP_ENEMY_魅惑者 Ceeyna|r|cRXP_WARN_但务必提前使用|r|T136121:0|t[暗影结界] |cRXP_WARN_和|r|T136190:0|t[牺牲] |cRXP_WARN_技能|r|cFFFF0000因为在引导期间你会受到大量伤害, 且无法被治疗|r
step
    .train 426467,1
    .goto Desolace,81.2,79.7
    >>击杀|cRXP_ENEMY_魅惑者 Ceeyna|r. 击败她后拾取|T134419:0|t[|cRXP_FRIENDLY_暗焰符文|r]
    .collect 213101,1
    .mob Seductress Ceeyna
step
    .train 426467 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_暗影烈焰符文|r]|cRXP_WARN_来学习|r|T236302:0|t[暗影烈焰]
    .use 213101
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Immolation Aura
#name 献祭光环 - 40(灰谷)

step
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step
    .goto Ashenvale,93.5,38.0,100 >>前往地图上标记的灰谷梦魇入侵区域
    .train 431758,1
step
    >>击杀传送门外的恶魔, 直到你获得以下列出的三件物品
    .collect 221972,1 >>|T132839:0|t|cRXP_LOOT_Dreampyre Fire|r由|cRXP_ENEMY_Dreampyre Imps|r掉落
    .collect 221971,1 >>|T237396:0|t|cRXP_LOOT_梦誓者号角|r由|cRXP_ENEMY_燃灵梦誓者|r掉落
    .collect 221973,1 >>|T133724:0|t|cRXP_LOOT_猎梦者利牙|r由|cRXP_ENEMY_梦境猎犬|r掉落
    .mob Dreampyre Imp
    .mob Emberspark Dreamsworn
    .mob Dreamhunter Hound
    .train 431758,1
step
    .cast 447537 >>右键点击背包中的任意物品, 将其合成并获得 |T134419:0|t[|cRXP_FRIENDLY_燃烧之焰符文|r]
    .collect 220618,1 --Rune of Immolation Aura
    .use 221972
    .train 431758,1
step
    .train 431758 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_焚毁光环符文|r]|cRXP_WARN_来学习|r|T135802:0|t[焚毁光环]
    .use 220618
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Summon Felguard
#name 召唤恶魔守卫 - 10 (艾泽拉斯)

step
    #completewith next
    +|cRXP_WARN_要获得此符文, 你需要找到一个|r|T236294:0|t|cRXP_FRIENDLY_探索者小鬼|r. |cRXP_WARN_如果你还没有, 先对怪物施放|r|T136163:0|t|cRXP_FRIENDLY_[灵魂吸取]|r|cRXP_WARN_. 每次该法术生效时, 你都有机会获得一个|r|T133257:0|t|cRXP_LOOT_探索者之魂|r. |cRXP_WARN_使用它来学习如何召唤你的|r|T236294:0|t|cRXP_FRIENDLY_探索者小鬼|r|r
step
    +前往以下任意一个区域. 符文可在其中任意区域获得, 但等级较高的区域将为你提供来自探险小鬼的更好奖励
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
    >>在地图标记的位置寻找|cRXP_FRIENDLY_Fel Portals|r. 找到后, 召唤你的 |T236294:0|t|cRXP_FRIENDLY_Explorer Imp|r, 并站在传送门旁边完成对话. 小鬼将开始探索该裂隙, 你将获得 |T136164:0|t|cRXP_FRIENDLY_Imp on a Mission|r增益效果. 大约10至20分钟后, 小鬼会返回你身边, 或者你可以重新召唤它并再次与其对话, 提交可重复任务, 获得奖励 |T133639:0|t|cRXP_LOOT_Otherworldly Treasure|r. 打开战利品后, 你将获得物品, 并有机会获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Felguard|r]. 继续寻找裂隙并收集宝藏, 直到获得该符文为止
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
    .train 431756 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_恶魔守卫符文|r]|cRXP_WARN_来学习|r|T136216:0|t[召唤地狱火]
    .use 221499

]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup 头盔
#displayname Pandemic
#name 疫情 - 40(费拉斯)

step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
    .goto Feralas,69.6,43.3 
    >>前往莫哈切营地以西的标记位置. 寻找一名躺在树旁的|cRXP_ENEMY_死亡感染的恐怖图腾萨满祭司|r. 在其尸体旁边会有一个|cRXP_PICK_恐怖图腾箱|r, 拾取它可获得 |T133291:0|t|cRXP_LOOT_恐怖图腾项链|r
    .collect 221974,1 --Grimtotem Necklace 1/1
    .unitscan Dead Diseased Grimtotem Shaman
    .train 431743,1
step
    .goto 1444/1,695.400,-4920.300,20 >>前往通往木爪巢穴的上山小径
    .train 431743,1
step
    .goto 1444/1,831.200,-4851.000,20 >>沿着火把标记的小径向上前进
    .train 431743,1
step
    .goto 1444/1,826.500,-4725.100
    >>沿着营地右侧边缘前进, 找到|cRXP_ENEMY_木爪秘法师|r. 在他旁边会有一个|cRXP_PICK_木爪包|r, 拾取后可获得 |T135139:0|t|cRXP_LOOT_破碎的木爪法杖|r
    .collect 221975,1 --Broken Woodpaw Staff
    .unitscan Dead Diseased Woodpaw Mystic
    .train 431743,1
step
    >>使用 |T135139:0|t|cRXP_LOOT_Broken Woodpaw Staff|r与 |T133291:0|t|cRXP_LOOT_Grimtotem Necklace|r合成, 制作出 |T135153:0|t|cRXP_LOOT_Diseased Nature Staff|r
    .collect 221976,1 --Diseased Nature Staff
    .use 221975
    .train 431743,1
step
    .goto Feralas,72.6,50.8
    >>寻找一名沉睡的|cRXP_ENEMY_Diseased Forest Walker|r, 使用你的 |T135153:0|t|cRXP_LOOT_Diseased Nature Staff|r将其唤醒. 击败他后, 即可获得 |T134419:0|t[|cRXP_FRIENDLY_瘟疫符文|r]
    .collect 220617,1 --Rune of Pandemic
    .use 221976
    .train 431743,1
step
    .train 431743 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_瘟疫符文|r]|cRXP_WARN_来学习|r|T136227:0|t[瘟疫]
    .use 220617
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Decimation
#name 人屠 - 55(艾泽拉斯)

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
    >>|cRXP_WARN_寻找|cRXP_PICK_Fel Rifts|r. 这些是可能出现在整个区域的传送门|r
    >>|cRXP_WARN_与|r|cRXP_PICK_Rift|r对话, 派遣你的|r|cRXP_FRIENDLY_Explorer Imp|r通过|r|cRXP_PICK_Rift|r传送, 并等待它带回|r|T135222:0|t[|cRXP_LOOT_军团传送门调谐器|r]
    >>|cRXP_WARN_您可能需要重复此任务几次, 直到它返回|r|T135222:0|t[|cRXP_LOOT_军团传送门调节器|r]
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
    .use 224806 >>|cRXP_WARN_使用|r|T135222:0|t[|cRXP_LOOT_军团传送门调谐器|r]|cRXP_WARN_在一个|cRXP_PICK_腐化裂隙|r上, 这将把它变成一个|r|cRXP_PICK_异界传送门|r
    >>|cRXP_WARN_与|cRXP_PICK_异界传送门|r对话, 并派遣你的|cRXP_FRIENDLY_小鬼探索者|r穿越它, 等待它带回一个|r|T134429:0|t[|cRXP_LOOT_传送门调谐器|r]
    >>|cRXP_WARN_您可能需要重复此步骤几次, 直到它返回|r|T134429:0|t[|cRXP_LOOT_传送门调谐器|r]
    .collect 224912,1
    .train 440922,1
    .skipgossip
step
    .use 224912 >>|cRXP_WARN_使用|r|T134429:0|t[|cRXP_LOOT_传送门调谐器|r]|cRXP_WARN_将其转化为|r|T135224:0|t[|cRXP_LOOT_过载传送门调谐器|r]
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
    .use 224893 >>|cRXP_WARN_使用|r |T135224:0|t[|cRXP_LOOT_过载传送门调节器|r] |cRXP_WARN_在|cRXP_PICK_恶魔裂痕|r上, 会使它变为红色|r
    >>|cRXP_WARN_与它交谈, 并派遣你的 |cRXP_FRIENDLY_探险者小鬼|r 穿过它, 等待它带回|r |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .collect 225686,1
    .train 440922,1
    .skipgossip
step
    .train 440922 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]|cRXP_WARN_来学习|r|T135808:0|t[毁灭]
    .use 225686
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Mark of Chaos
#name 混沌印记 - 50(西瘟疫之地)

step
    #completewith next
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    #loop
    .goto Western Plaguelands,50.6,77.6
    >>|cRXP_WARN_施放|r|T136163:0|t[吸取灵魂], |cRXP_WARN_目标: |r|cRXP_ENEMY_骷髅剥皮者|r, 直到你获得3|r|cRXP_LOOT_受诅咒的灵魂碎片|r
    .collect 225929,3
    .mob Skeletal Flayer
    .train 440924,1
step
    .goto Western Plaguelands,43.361,84.143 << Alliance
    .goto Tirisfal Glades,83.035,72.631 << Horde
    >>|cRXP_WARN_将你的 |cRXP_LOOT_瘟疫灵魂碎片|r交给冰风岗的 |cRXP_FRIENDLY_皮克西·皮尔弗斯碎片|r以获得|r|T134419:0|t[|cRXP_FRIENDLY_混沌印记符文|r] << Alliance
    >>|cRXP_WARN_将你的|cRXP_LOOT_瘟疫灵魂碎片|r交给堡垒的|cRXP_FRIENDLY_Prazik Pilfershard|r以获得|r|T134419:0|t[|cRXP_FRIENDLY_混沌印记符文|r] << Horde
    .collect 225688,1
    .target Pixi Pilfershard << Alliance
    .target Prazik Pilfershard << Horde
    .train 440924,1
step
    .train 440924 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_混沌印记符文|r]|cRXP_WARN_来学习|r|T136226:0|t[混沌印记]
    .use 225688
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Infernal Armor
#name 地狱火护甲 - 55(诅咒之地)

step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
    >>|cRXP_WARN_确保你已掌握以下技能, 并考虑带上一名治疗者, 因为你需要击败一名56级精英敌人|r
    >>|T134131:0|t[特效法术石]
    >>|T136121:0|t[暗影结界]
    >>|T136190:0|t[献祭]|cRXP_WARN_你的|r|T136221:0|t[虚空行者]
step
    .train 440926,1
    #loop
    .goto Blasted Lands,65.31,32.63,20,0
    .goto Blasted Lands,68.050,28.667
    >>击杀任意|cRXP_ENEMY_Shadowsworn|r. 击杀后搜刮出|cRXP_LOOT_Shadowsworn Note|r
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
    >>前往洞穴深处的|cRXP_PICK_Altar|r
    >>|cRXP_WARN_在点击|cRXP_PICK_Altar|r之前, 请确保已使用以下技能:|r|T134131:0|t[特效法术石]|cRXP_WARN_和|r|T136121:0|t[暗影结界]|cRXP_WARN_和|r|T136190:0|t[牺牲]|cRXP_WARN_, 因为点击后你会受到大量伤害, 并会召唤出|cRXP_ENEMY_Heliath|r. |cRXP_ENEMY_Heliath|r是一名等级为56的精英敌人|r
    >>击杀|cRXP_ENEMY_Heliath|r. 击败他后搜刮掉落物品:|T134419:0|t[|cRXP_FRIENDLY_炼狱护甲符文|r] 
    .collect 225687,1
    .mob Heliath
step
    .train 440926 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_地狱护甲符文|r]|cRXP_WARN_来学习|r|T236418:0|t[地狱护甲]
    .use 225687
]])