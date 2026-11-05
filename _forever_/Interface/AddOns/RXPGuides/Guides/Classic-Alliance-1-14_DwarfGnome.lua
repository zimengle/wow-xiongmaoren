local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
#tbc
#season 0,1
#version 1
<< Alliance
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 1-6 Coldridge Valley
#next 6-11 Dun Morogh << !Hunter
#next 6-11 Dun Morogh (Hunter);6-11 Dun Morogh << Hunter
#defaultfor Dwarf/Gnome
#displayname 1-6 寒脊山谷 << !SoD
#displayname 1-7 寒脊山谷 << SoD
#displayname 1-6 寒脊山谷
step << !Gnome !Dwarf
    #completewith next
    +你选择的指南适用于侏儒和矮人，请选择与你实际出生地点相符的新手区域指南
step << Mage
    #completewith next
    +你选择的是单体法师指南。单体法师比群体伤害法师安全得多，但升级速度也慢得多
step << !Gnome Mage
    #season 2
    #completewith next
    +探索赛季的法师不应从其他种族的新手区域起步，否则无法在这里获得你的第一个符文（|T133816:0|t[铭刻手套 - 冰枪术]）
step << !Warlock
    #season 2 << Warrior
    #optional
    #completewith WolfMeat
	.destroy 6948 >> 摧毁背包中的 |T134414:0|t[炉石]，之后不再需要
--XX Everyone except Warlocks, Era warriors drop HS
step
    .goto Dun Morogh,29.927,71.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .accept 179 >> 接任务：矮人的交易
    .target 斯登·粗臂
step << Warlock
#sticky
#label wlrune1
    #season 2
    .goto Dun Morogh,26.733,72.552
    >>打开地上的 |cRXP_PICK_石腭储物箱|r，从中拾取 |T134419:0|t|cRXP_LOOT_[鬼影缠身符文]|r
    .collect 205230,1 -- Rune of Haunting (1)
    .train 403919,1
step << Warlock
#requires wlrune1
#sticky
    #season 2
    .train 403919 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[鬼影缠身符文]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 鬼影缠身]
    .use 205230
    .itemcount 205230,1 -- Rune of Haunting (1)
--XX Era Level 1 Warrior/Warlock training, Era Warlock imp accept start
step << Warrior/Warlock
    #season 0,1
    #completewith next
    .goto 1426,28.533,72.587,50,0
    .goto 1426,28.239,71.707,50,0
    +|cRXP_WARN_击杀并拾取 |cRXP_ENEMY_蓬毛幼狼|r，直到获得价值至少10铜币的可出售杂物|r
    >>|cRXP_WARN_脱下你的|r |T132665:0|t[侍僧长袍]|cRXP_WARN_、|r |T135005:0|t[侍僧衬衣]|cRXP_WARN_、|r |T134581:0|t[侍僧短裤]|cRXP_WARN_和|r |T132535:0|t[侍僧鞋] |cRXP_WARN_，将它们出售可获得4铜币|r << Warlock
    >>|cRXP_WARN_脱下你的|r |T135009:0|t[新兵衬衣]|cRXP_WARN_、|r |T134582:0|t[新兵短裤]|cRXP_WARN_和|r |T132540:0|t[新兵之靴] |cRXP_WARN_，将它们出售可获得3铜币|r << Warrior
    .complete 179,1 --Tough Wolf Meat (8)
    .disablecheckbox
    .mob 蓬毛幼狼
    .money >0.001
step << Warrior/Warlock
    #season 0,1
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12,0
    .goto 1426,28.939,68.387,12 >> 进入安威玛尔
step << Warrior/Warlock
    #season 0,1
    .goto 1426,28.792,67.837
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦德尔·哈金|r（里面）交谈
    .vendor >> 卖掉杂物
    .target 格伦德尔·哈金
    .train 6673,1 << Warrior
    .train 348,1 << Warlock
step << Warrior
    #season 0,1
    .goto 1426,28.831,67.238
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_斯兰·库尔曼|r 交谈
    .train 6673 >>学习 |T132333:0|t[战斗怒吼]
    .target 斯兰·库尔曼
step << Warlock
    #season 0,1
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r（里面）交谈
    .train 348 >> 学习 |T135817:0|t[献祭]
    .accept 1599 >> 接任务：开端
    .target 阿拉玛尔·格里姆
step << Warrior/Warlock
    #season 0,1
    #softcore << Warlock
    #label WarriorHS
    #completewith WolfMeat
    .hs >> 使用炉石返回 寒脊山谷
    .subzoneskip 77,1
--XX All era warriors, era softcore warlocks
step << Warrior/Warlock
    #season 0,1
    #softcore << Warlock
    #optional
    #requires WarriorHS
    #completewith WolfMeat
	.destroy 6948 >> 摧毁背包中的 |T134414:0|t[炉石]，之后不再需要
--XX Era Warriors, Era Softcore Warlocks drop HS
step << Warlock
    #season 0,1
    #optional
    #completewith next
    .goto 1426,28.938,68.358,12,0
    .goto 1426,28.831,68.698,12 >> 离开安威玛尔
    .subzoneskip 77,1
--XX Era Level 1 Warrior/Warlock training, warlock imp accept end
step
    #label WolfMeat
    .goto 1426,29.529,73.286,0
    .goto 1426,28.117,75.088,0
    .goto 1426,28.557,72.487,0
    .goto 1426,29.529,73.286,60,0
    .goto 1426,29.054,74.608,60,0
    .goto 1426,28.558,75.781,60,0
    .goto 1426,28.117,75.088,60,0
    .goto 1426,27.562,74.331,60,0
    .goto 1426,27.793,73.123,60,0
    .goto 1426,28.557,72.487,60,0
    >>击杀 |cRXP_ENEMY_蓬毛幼狼|r，拾取它们掉落的 |cRXP_LOOT_硬狼肉|r
    .complete 179,1 --Collect Tough Wolf Meat (x8)
    .mob 蓬毛幼狼
step
    #optional
    .goto 1426,29.529,73.286,0
    .goto 1426,28.117,75.088,0
    .goto 1426,28.557,72.487,0
    .goto 1426,29.529,73.286,60,0
    .goto 1426,29.054,74.608,60,0
    .goto 1426,28.558,75.781,60,0
    .goto 1426,28.117,75.088,60,0
    .goto 1426,27.562,74.331,60,0
    .goto 1426,27.793,73.123,60,0
    .goto 1426,28.557,72.487,60,0
    .xp 2 >> 刷到2级
    .mob 蓬毛幼狼
step << Priest/Mage/Warlock
    #season 0,1
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾德林·怒流|r 交谈
    >>卖掉杂物
    >>|cRXP_BUY_向他购买15瓶|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
    >>|cRXP_WARN_如果钱不够，继续击杀 |cRXP_ENEMY_蓬毛幼狼|r 赚取铜币|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target 艾德林·怒流
    .xp >6,1
step << Mage
    #season 2
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾德林·怒流|r 交谈
    >>卖掉杂物
    >>|cRXP_BUY_向他购买15瓶|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
    >>|cRXP_WARN_如果钱不够，继续击杀 |cRXP_ENEMY_蓬毛幼狼|r 赚取铜币|r
    >>|cRXP_WARN_记得留下10铜币，稍后会用到|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target 艾德林·怒流
    .xp >6,1
step << !Priest !Mage !Warlock
    #completewith next << !Hunter
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_艾德林·怒流|r
    >>卖掉杂物 << Hunter
    >>|cRXP_BUY_向他购买600枚|r |T132384:0|t[轻弹丸] |cRXP_BUY_。|r << Hunter
    .vendor >> |cRXP_WARN_卖掉杂物|r << !Hunter
    .collect 2516,600 << Hunter --Light Shot (600)
    .target 艾德林·怒流
    .xp >6,1
step
    .goto Dun Morogh,29.927,71.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .turnin 179 >> 交任务：矮人的交易
    .accept 233 >> 接任务：寒脊山谷的送信任务
    .accept 3106 >> 接任务：简易符文 << Dwarf Warrior
    .accept 3107 >> 接任务：神圣符文 << Dwarf Paladin
    .accept 3108 >> 接任务：风蚀符文 << Dwarf Hunter
    .accept 3109 >> 接任务：密文符文 << Dwarf Rogue
    .accept 3110 >> 接任务：神圣符文 << Dwarf Priest
    .accept 3112 >> 接任务：简易备忘录 << Gnome Warrior
    .accept 3113 >> 接任务：密文备忘录 << Gnome Rogue
    .accept 3114 >> 接任务：雕文备忘录 << Gnome Mage
    .accept 3115 >> 接任务：被污染的备忘录 << Gnome Warlock
    .target 斯登·粗臂
step
    #xprate <1.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .goto Dun Morogh,29.709,71.255
    .accept 170 >> 接任务：新的威胁
    .target 巴尔林·霜锤
--XX SoD level 2 Training/Rune quest accept start (-Paladin, they don't need to yet)
step << Priest/Mage/Warlock
    #season 2
    #xprate <1.1
    #completewith EnterAnvilmar
    .goto 1426,27.096,72.545,0
    .goto 1426,26.620,73.548,0
    .goto 1426,25.722,72.261,0
    .goto 1426,24.878,72.329,0
    .goto 1426,24.100,73.749,0
    .goto 1426,24.920,74.697,0
    .goto 1426,21.813,72.584,0
    .goto 1426,19.578,72.086,0
    .goto 1426,20.627,70.415,0
    >>击杀 |cRXP_ENEMY_石腭穴居人|r 和 |cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +壮实的石腭怪
step << Priest
    #season 2
    .goto Dun Morogh,26.733,72.552
    >>打开地上的 |cRXP_PICK_石腭储物箱|r，从中拾取 |T136222:0|t|cRXP_LOOT_[忧虑助祭的回忆]|r
    .collect 205951,1 -- Memory of a Troubled Acolyte (1)
    .train 402862,1
step << Mage
    #season 2
    .goto Dun Morogh,26.733,72.552
    >>打开地上的 |cRXP_PICK_石腭储物箱|r，从中拾取 |T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r
    >>|cRXP_WARN_注意：你无法在这里学习|r |T133816:0|t[铭刻手套 - 冰枪术] |cRXP_WARN_，因为|r |T133736:0|t[理解入门] |cRXP_WARN_只能在自己种族的新手区域获得|r << !Gnome
    .collect 203751,1,77667,1 -- Spell Notes: CALE ENCI (1)
    .train 401760,1
step << !Paladin !Hunter
    #season 2
    #label EnterAnvilmar
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12,0
    .goto 1426,28.642,68.375,12 >> 进入安威玛尔 << Rogue/Warlock/Mage
    .goto 1426,28.939,68.387,12 >> 进入安威玛尔 << !Rogue !Warlock !Mage
step << Warlock
    #season 2
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r（楼上）交谈
    .accept 1599 >> 接任务：开端
    .turnin 3115 >> 交任务：被污染的备忘录 << Gnome
    .accept 77666 >> 接任务：失窃的力量 << Gnome
    .turnin 77666 >> 交任务：失窃的力量 << Gnome
    .train 348 >> 学习 |T135817:0|t[献祭]
    .target 阿拉玛尔·格里姆
step << Warrior
    #season 2
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_斯兰·库尔曼|r
    .turnin 3106 >> 交任务：简易符文 << Dwarf
    .turnin 3112 >> 交任务：简易备忘录 << Gnome
    .accept 77655 >> 接任务：失落的符文 << Dwarf
    .accept 77656 >> 接任务：失落的符文 << Gnome
    .train 6673 >>学习 |T132333:0|t[战斗怒吼]
    .trainer >> 学习职业技能
    .target 斯兰·库尔曼
step << Rogue
    #season 2
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索姆·哈格林|r（里面）交谈
    .turnin 3109 >> 交任务：密文符文 << Dwarf
    .turnin 3113 >> 交任务：密文备忘录 << Gnome
    .accept 77658 >> 接任务：三度被盗 << Dwarf
    .accept 77659 >> 接任务：三度被盗 << Gnome
    .train 1784 >>学习 |T132320:0|t[潜行]
    .target 索姆·哈格林
step << Priest
    #season 2
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰斯托克·卡德尔|r（里面）交谈
    >>|cRXP_WARN_学习|r |T135987:0|t[真言术：韧] |cRXP_WARN_，接下来的职业任务会用到|r << Dwarf
    .turnin 3110 >> 交任务：神圣符文 << Dwarf
    .accept 5626 >> 接任务：圣光的恩赐 << Dwarf
    .accept 77661 >> 接任务：圣光之思 << Dwarf
    .train 1243 >> 学习 |T135987:0|t[真言术：韧]
    .target 布兰斯托克·卡德尔
step << Priest
    #season 2
    .goto 1426,28.922,66.378
    .aura 410935 >>|cRXP_WARN_选中屋内的 |cRXP_FRIENDLY_圣光祭坛|r，即可获得|r |T135934:0|t[圣光之思] |cRXP_WARN_增益|r
    >>|cRXP_WARN_如果没有获得增益，选中 |cRXP_FRIENDLY_圣光祭坛|r 并输入 /kneel|r
    .target 圣光祭坛
    .emote KNEEL,208565
    .train 402862,1
step << Priest
    #season 2
    .train 402862 >> |cRXP_WARN_使用|r |T136222:0|t|cRXP_LOOT_[忧虑助祭的回忆]|r |cRXP_WARN_来学习|r |T133816:0|t[铭刻手套 - 苦修]
    .aura -410935
    .use 205951
step << Dwarf Priest
    #season 2
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰斯托克·卡德尔|r（里面）交谈
    .turnin 77661 >> 交任务：圣光之思
    .target 布兰斯托克·卡德尔
    .isQuestComplete 77661
step << Gnome Warlock/Dwarf Priest
    #season 2
    #label GlovesEquip
    #completewith Observations
    .equip 10,711 >> |cRXP_WARN_装备|r |T132961:0|t[破布手套]
    .use 711
    .train 402862,3 << Priest
    .train 403919,3 << Warlock
step << Gnome Warlock/Dwarf Priest
    #season 2
    #requires GlovesEquip
    #completewith Observations
    .engrave 10 >>|cRXP_WARN_为你的|r |T132961:0|t[破布手套]铭刻|r |T133816:0|t[铭刻手套 - 鬼影缠身] << Warlock
    .engrave 10 >>|cRXP_WARN_给你的|r |T132961:0|t[破布手套]铭刻|r |T133816:0|t[铭刻手套 - 苦修] << Priest
    .train 402862,3 << Priest
    .train 403919,3 << Warlock
step << Warlock
    #season 0,1

    #completewith next
    .goto 1426,30.146,74.521,0
    .goto 1426,28.322,77.854,0
    .goto 1426,28.747,74.380,0
    .goto 1426,27.018,77.305,0
    >>沿途击杀 |cRXP_ENEMY_石腭穴居人|r、|cRXP_ENEMY_壮实的石腭怪|r、|cRXP_ENEMY_蓬毛幼狼|r 和 |cRXP_ENEMY_蓬毛森林狼|r
    >>|cRXP_WARN_尽量避开|r |cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .mob +壮实的石腭怪
    .mob 蓬毛幼狼
    .mob 蓬毛森林狼
step << Warlock
    #season 0,1
    #optional

    #label FrostmaneC
    #completewith Feathers
    .goto Dun Morogh,26.85,79.83,20 >> 进入霜鬃洞穴
step << Warlock
    #season 0,1
    #optional
    #requires FrostmaneC
    #completewith Feathers
    .goto 1426,27.095,80.702,20,0
    .goto 1426,27.265,80.848,20,0
    .goto 1426,27.857,81.067,20,0
    .goto 1426,28.696,83.148,50 >> 前往洞穴深处寻找 |cRXP_ENEMY_霜鬃巨魔新兵|r
step << Warlock
    #season 0,1
    #label Feathers
    .goto 1426,28.696,83.148,0
    .goto 1426,30.216,80.254,0
    .goto 1426,28.696,83.148,40,0
    .goto 1426,28.999,82.504,40,0
    .goto 1426,29.298,81.579,15,0
    .goto 1426,29.041,81.168,40,0
    .goto 1426,30.055,82.385,40,0
    .goto 1426,30.381,80.766,40,0
    .goto 1426,30.216,80.254,40,0
    >>击杀洞内的 |cRXP_ENEMY_霜鬃巨魔新兵|r，拾取它们掉落的 |cRXP_LOOT_羽毛咒符|r
    .complete 1599,1 --Collect Feather Charm (x3)
    .mob 霜鬃巨魔新兵
step << Warlock
    #season 0,1
    #hardcore
    #label BeginningsHS
    #completewith BeginningsEnd
    .hs >> 使用炉石返回 寒脊山谷
    .subzoneskip 77,1
--XX Era hardcore warlocks
step << Warlock
    #season 0,1
    #hardcore
    #optional
    #requires BeginningsHS
    #completewith BeginningsEnd
	.destroy 6948 >> 摧毁背包中的 |T134414:0|t[炉石]，之后不再需要
--XX HC Warlocks drop HS (No hearthstone items remain)
step << Warlock
    #season 0,1
    #softcore
    #label BeginningsHS
    #completewith BeginningsEnd
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
step << Warlock
    #season 0,1
    #optional
    #requires BeginningsHS
    #completewith next
    .goto 1426,28.792,68.804,12,0
    .goto 1426,28.939,68.387,12 >> 进入安威玛尔 << Warlock
step << Warlock
    #season 0,1
    #label BeginningsEnd
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r（楼上）交谈
    .turnin 1599 >> 交任务：开端
    .turnin -3115 >> 交任务：被污染的备忘录
    .target 阿拉玛尔·格里姆
--XX Warlock Imp Quest End. Return to normal
step << !Paladin !Hunter
    #season 2 << !Warlock --Only Warlock is inside Anvilmar in Era at this step
    #optional
    #completewith Talin
    .goto 1426,28.792,68.804,12 >> 离开安威玛尔
    .subzoneskip 77,1
step
    #xprate <1.1
    #completewith Rockjaw
    .goto 1426,27.096,72.545,0
    .goto 1426,26.620,73.548,0
    .goto 1426,25.722,72.261,0
    .goto 1426,24.878,72.329,0
    .goto 1426,24.100,73.749,0
    .goto 1426,24.920,74.697,0
    .goto 1426,21.813,72.584,0
    .goto 1426,19.578,72.086,0
    .goto 1426,20.627,70.415,0
    >>击杀 |cRXP_ENEMY_石腭穴居人|r 和 |cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +壮实的石腭怪
step
#season 0,1
    #label Talin
    .goto Dun Morogh,22.601,71.433
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .turnin 233 >> 交任务：寒脊山谷的送信任务
    .accept 183 >> 接任务：猎杀野猪
    .accept 234 >> 接任务：寒脊山谷的送信任务
    .target 塔林·锐眼
step
#season 2
    #label Talin
    .goto Dun Morogh,22.601,71.433
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .turnin 233 >> 交任务：寒脊山谷的送信任务
    .accept 234 >> 接任务：寒脊山谷的送信任务
    .target 塔林·锐眼
step
#season 0,1
    #loop
    .goto 1426,22.276,72.549,0
    .goto 1426,20.924,70.393,0
    .goto 1426,22.662,69.331,0
    .goto 1426,24.358,72.591,0
    .goto 1426,22.276,72.549,45,0
    .goto 1426,21.209,72.266,45,0
    .goto 1426,20.880,71.470,45,0
    .goto 1426,20.924,70.393,45,0
    .goto 1426,21.330,69.261,45,0
    .goto 1426,22.035,69.231,45,0
    .goto 1426,22.662,69.331,45,0
    .goto 1426,24.317,68.026,45,0
    .goto 1426,24.754,69.257,45,0
    .goto 1426,24.878,71.191,45,0
    .goto 1426,24.358,72.591,45,0
    >>击杀 |cRXP_ENEMY_小型峭壁野猪|r
    .complete 183,1 --Kill Small Crag Boar (x12)
    .mob 小型峭壁野猪
step
#season 0,1
    .goto Dun Morogh,22.601,71.433
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .turnin 183 >> 交任务：猎杀野猪
    .target 塔林·锐眼
step << Paladin/Warlock/Hunter
    #xprate <1.1
    .goto 1426,27.858,76.482,0
    .goto 1426,30.727,76.831,0
    .goto 1426,29.280,75.500,0
    .goto 1426,27.858,76.482,50,0
    .goto 1426,28.946,77.153,50,0
    .goto 1426,29.716,77.605,50,0
    .goto 1426,30.727,76.831,50,0
    .goto 1426,32.814,75.221,50,0
    .goto 1426,31.138,74.048,50,0
    .goto 1426,30.077,74.479,50,0
    .goto 1426,29.280,75.500,50,0
    >>击杀 |cRXP_ENEMY_石腭穴居人|r 和 |cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +壮实的石腭怪
step << Paladin/Warlock
    #xprate <1.5
    #loop
    .goto 1426,23.595,72.462,0
    .goto 1426,26.117,74.469,0
    .goto 1426,26.832,74.649,0
    .goto 1426,26.884,72.733,0
    .goto 1426,23.595,72.462,50,0
    .goto 1426,24.290,73.406,50,0
    .goto 1426,24.642,74.138,50,0
    .goto 1426,26.117,74.469,50,0
    .goto 1426,26.832,74.649,50,0
    .goto 1426,26.884,72.733,50,0
    .xp 3+1130 >> 刷怪至 1130+/1400 经验值
step << Paladin/Warlock
    #xprate >1.49
    #loop
    .goto 1426,23.595,72.462,0
    .goto 1426,26.117,74.469,0
    .goto 1426,26.832,74.649,0
    .goto 1426,26.884,72.733,0
    .goto 1426,23.595,72.462,50,0
    .goto 1426,24.290,73.406,50,0
    .goto 1426,24.642,74.138,50,0
    .goto 1426,26.117,74.469,50,0
    .goto 1426,26.832,74.649,50,0
    .goto 1426,26.884,72.733,50,0
    .xp 3+995 >> 刷怪至 995+/1400 经验值
step
    #label Rockjaw
    .goto 1426,25.077,75.711
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 234 >> 交任务：寒脊山谷的送信任务
    .accept 182 >> 接任务：巨魔洞穴
    .target 格瑞林·白须
step << Hunter
    #completewith next
    .goto 1426,25.861,78.197,0
    .goto 1426,23.716,80.257,0
    .goto 1426,20.671,75.838,0
    .goto 1426,25.861,78.197,45,0
    .goto 1426,26.382,78.409,45,0
    .goto 1426,26.031,79.854,45,0
    .goto 1426,23.716,80.257,45,0
    .goto 1426,22.836,79.962,45,0
    .goto 1426,22.684,78.888,45,0
    .goto 1426,21.029,76.459,45,0
    .goto 1426,20.671,75.838,45,0
    >>击杀 |cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .mob 霜鬃巨魔幼崽
step << Hunter
    .goto 1426,25.861,78.197,0
    .goto 1426,23.716,80.257,0
    .goto 1426,20.671,75.838,0
    .xp 4 >> 刷到 4 级
step << Paladin/Warlock/Hunter
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    >>|cRXP_WARN_此任务会开始5分钟倒计时。接下来5分钟不要挂机或退出游戏|r
    .accept 3364 >> 接任务：热酒快递
    .target 诺里斯·激流
step << Warlock
#season 2
#completewith next
    .goto Dun Morogh,26.85,79.83,20 >> 进入巨魔洞窟
step << Warlock
#loop
#season 2
    #label Feathers
    .goto 1426,28.696,83.148,0
    .goto 1426,30.216,80.254,0
    .goto 1426,28.696,83.148,40,0
    .goto 1426,28.999,82.504,40,0
    .goto 1426,29.298,81.579,15,0
    .goto 1426,29.041,81.168,40,0
    .goto 1426,30.055,82.385,40,0
    .goto 1426,30.381,80.766,40,0
    .goto 1426,30.216,80.254,40,0
    >>击杀巨魔洞穴内的 |cRXP_ENEMY_霜鬃巨魔新兵|r，拾取它们掉落的 |cRXP_LOOT_羽毛咒符|r
    >>|cRXP_WARN_任务正在倒计时，不要挂机或退出游戏|r
    .complete 1599,1 --Collect Feather Charm (x3)
    .mob 霜鬃巨魔新兵
step << Warlock
    #season 2
    #completewith next
    .hs >> 使用炉石返回安威玛尔
step << Paladin/Warlock/Hunter
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12,0
    >>|cRXP_WARN_你必须在5分钟内返回安威玛尔，赶在|r |T132791:0|t[德南的热酒] |cRXP_WARN_过期之前|r
    .goto 1426,28.939,68.387,12 >> 进入安威玛尔
step << Paladin/Warlock/Hunter
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r（里面）交谈
    .turnin 3364 >> 交任务：热酒快递
    .accept 3365 >> 接任务：归还酒杯
    .vendor >> 卖掉杂物
    .target 德南·弗卡特
    .isQuestAvailable 317
step << Hunter
    #season 0,1
    .goto Dun Morogh,29.175,67.455
    .target 索加斯·格瑞姆森
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索加斯·格瑞姆森|r 交谈
    .turnin 3108 >>交任务 风蚀符文 << Dwarf
    .train 1978 >>学习 |T132204:0|t[毒蛇钉刺]
step << Hunter
    #season 2
    .goto Dun Morogh,29.175,67.455
    .target 索加斯·格瑞姆森
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索加斯·格瑞姆森|r
    .turnin 3108 >>交任务 风蚀符文 << Dwarf
    .accept 77660 >> 接任务：穿越洞穴 << Dwarf
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
step << Paladin
    #season 0,1
    .goto Dun Morogh,28.833,68.332
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r（里面）交谈
    .turnin 3107 >> 交任务：神圣符文 << Dwarf
    .train 19740 >> 学习 |T135906:0|t[力量祝福]
    .train 20271 >> 学习 |T135959:0|t[审判]
    .target 布罗莫斯·格鲁诺尔
step << Paladin
    #season 2
    .goto Dun Morogh,28.833,68.332
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r（里面）交谈
    .turnin 3107 >> 交任务：神圣符文 << Dwarf
    .accept 77657 >> 接任务：圣光遗物 << Dwarf
    .train 19740 >> 学习 |T135906:0|t[力量祝福]
    .train 20271 >> 学习 |T135959:0|t[审判]
    .target 布罗莫斯·格鲁诺尔
step << Warlock
    #season 0,1
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r（楼上）交谈
    .turnin 3115 >> 交任务：被污染的备忘录
    .train 172 >>学习 |T136118:0|t[腐蚀术]
    .target 阿拉玛尔·格里姆
step << Warlock
    #season 2
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r（楼上）交谈
    .train 172 >>学习 |T136118:0|t[腐蚀术]
    .turnin 1599 >> 交任务：开端
    .target 阿拉玛尔·格里姆
step << Paladin/Warlock/Hunter
    #hardcore
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12 >> 离开安威玛尔
    .subzoneskip 77,1
step << Paladin/Warlock/Hunter
    #xprate <1.1
    .goto Dun Morogh,29.709,71.255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .turnin 170 >> 交任务：新的威胁
    .target 巴尔林·霜锤
step << Warlock
#season 0,1
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾德林·怒流|r 交谈
    >>卖掉杂物
    >>|cRXP_BUY_向他购买15瓶|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target 艾德林·怒流
    .xp >6,1
step << !Paladin !Warlock !Hunter
    #xprate <1.1
    #sticky
    #label TroggEnd
    .goto 1426,24.193,77.305,0
    .goto 1426,22.529,74.512,0
    .goto 1426,24.288,73.154,0
    .goto 1426,29.303,77.337,0
    .waypoint 1426,24.193,77.305,55,0
    .waypoint 1426,23.497,76.707,55,0
    .waypoint 1426,22.828,76.017,55,0
    .waypoint 1426,22.529,74.512,55,0
    .waypoint 1426,22.735,73.285,55,0
    .waypoint 1426,23.616,72.634,55,0
    .waypoint 1426,24.288,73.154,55,0
    .waypoint 1426,24.619,74.280,55,0
    .waypoint 1426,25.920,74.571,55,0
    .waypoint 1426,28.812,76.397,55,0
    .waypoint 1426,29.303,77.337,55,0
    >>击杀 |cRXP_ENEMY_石腭穴居人|r 和 |cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +壮实的石腭怪
step << Warrior/Paladin
    #season 2
    #completewith Observations
    #label Victory1 << Warrior
    #label Libram1 << Paladin
    .goto 1426,25.861,78.197,0
    .goto 1426,23.716,80.257,0
    .goto 1426,20.671,75.838,0
    .waypoint 1426,22.836,79.962,45,0
    .waypoint 1426,22.684,78.888,45,0
    .waypoint 1426,21.029,76.459,45,0
    .waypoint 1426,20.671,75.838,45,0
    .waypoint 1426,25.861,78.197,45,0
    .waypoint 1426,26.382,78.409,45,0
    .waypoint 1426,26.031,79.854,45,0
    .waypoint 1426,23.716,80.257,45,0
    >>击杀 |cRXP_ENEMY_霜鬃巨魔幼崽|r，拾取它们掉落的 |T134419:0|t|cRXP_LOOT_[乘胜追击符文]|r << Warrior
    >>击杀 |cRXP_ENEMY_霜鬃巨魔幼崽|r，拾取它们掉落的 |T134916:0|t|cRXP_LOOT_[审判圣契]|r << Paladin
    .collect 204806,1 << Warrior --Rune of Victory Rush (1)
    .collect 205420,1 << Paladin -- Libram of Judgement (1)
    .mob 霜鬃巨魔幼崽
    .train 403470,1 << Warrior
    .train 410002,1 << Paladin
step << Warrior
    #season 2
    #completewith Observations
    #label Victory2
    #requires Victory1
    .train 403470 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[乘胜追击符文]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 乘胜追击]
    .use 204806
    .itemcount 204806,1
step << Warrior
    #season 2
    #completewith Observations
    #label Victory3
    #requires Victory2
    .equip 10 >>|cRXP_WARN_如果已有或拾取到一双|r |T132938:0|t|cRXP_LOOT_[手套]|r |cRXP_WARN_，将其装备|r
    .train 403470,3
step << Warrior
    #season 2
    #completewith Observations
    #requires Victory3
    .engrave 10 >>|cRXP_WARN_为你的|r |T132938:0|t|cRXP_LOOT_[手套]|r 铭刻|r |T133816:0|t[铭刻手套 - 乘胜追击]
    .train 403470,3
step << Paladin
    #season 2
    #completewith Observations
    #label Libram2
    #requires Libram1
    .equip 18,205420 >> |cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[审判圣契]|r
    .use 205420
    .itemcount 205420,1 --Libram of Judgement (1)
--  .itemStat 18,QUALITY,<2
    .train 410002,1
step << Paladin
    #season 2
    #completewith Observations
    #label Libram3
    #requires Libram2
    .goto 1426,24.193,77.305,0
    .goto 1426,22.529,74.512,0
    .goto 1426,24.288,73.154,0
    .goto 1426,29.303,77.337,0
    .waypoint 1426,29.303,77.337,55,0
    .waypoint 1426,28.812,76.397,55,0
    .waypoint 1426,25.920,74.571,55,0
    .waypoint 1426,24.619,74.280,55,0
    .waypoint 1426,24.288,73.154,55,0
    .waypoint 1426,23.616,72.634,55,0
    .waypoint 1426,22.735,73.285,55,0
    .waypoint 1426,22.529,74.512,55,0
    .waypoint 1426,22.828,76.017,55,0
    .waypoint 1426,23.497,76.707,55,0
    .waypoint 1426,24.193,77.305,55,0
    .aura 408828 >>|cRXP_WARN_施放|r |T135959:0|t[审判] |cRXP_WARN_10次，获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益|r
    .itemStat 18,QUALITY,2
    .train 410002,1
step << Paladin
    #season 2
    #completewith Observations
    #label Libram4
    #requires Libram3
    .cast 409920 >>|cRXP_WARN_使用|r |T134916:0|t|cRXP_LOOT_[审判圣契]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 十字军打击]
    .use 205420
    .aura -408828
    .train 410002,1
step << Paladin
    #season 2
    #completewith Observations
    #label Libram5
    #requires Libram4
    .equip 10 >>|cRXP_WARN_如果已有或拾取到一双|r |T132938:0|t|cRXP_LOOT_[手套]|r |cRXP_WARN_，将其装备|r
    .train 410002,3
step << Paladin
    #season 2
    #completewith Observations
    #requires Libram5
    .engrave 10 >>|cRXP_WARN_为你的|r |T132938:0|t|cRXP_LOOT_[手套]|r 铭刻|r |T133816:0|t[铭刻手套 - 十字军打击]
    .train 410002,3
step
    #loop
    #label TrollWhelps
    .goto 1426,25.861,78.197,0
    .goto 1426,23.716,80.257,0
    .goto 1426,20.671,75.838,0
    .goto 1426,25.861,78.197,45,0
    .goto 1426,26.382,78.409,45,0
    .goto 1426,26.031,79.854,45,0
    .goto 1426,23.716,80.257,45,0
    .goto 1426,22.836,79.962,45,0
    .goto 1426,22.684,78.888,45,0
    .goto 1426,21.029,76.459,45,0
    .goto 1426,20.671,75.838,45,0
    >>击杀 |cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .mob 霜鬃巨魔幼崽
step << Warrior/Paladin
    #season 2
    #optional
    #requires Victory2 << Warrior
    #requires Libram4 << Paladin
--XXREQ Placeholder invis step until multiple requires per step
step
    #requires TroggEnd << !Paladin !Warlock !Hunter
    .goto Dun Morogh,25.076,75.713
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 182 >> 交任务：巨魔洞穴
    .accept 218 >> 接任务：被窃取的日记
    .target 格瑞林·白须
step << Paladin/Warlock/Hunter
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .turnin 3365 >> 交任务：归还酒杯
    .target 诺里斯·激流
step << !Paladin !Warlock !Hunter
    #softcore
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    >>|cRXP_WARN_此任务会开始5分钟倒计时。接下来5分钟不要挂机或退出游戏|r
    .accept 3364 >> 接任务：热酒快递
    .target 诺里斯·激流
step << !Paladin !Warlock !Hunter
    #softcore
    #completewith next
    +|cRXP_WARN_你有5分钟时间取得 |cRXP_LOOT_格瑞林·白须的日记|r 并返回安威玛尔，赶在|r |T132791:0|t[德南的热酒] |cRXP_WARN_过期之前|r
    >>|cRXP_WARN_任务失败也不用担心，稍后可以重新接取|r
step
    #optional
    #label FrostMCave1
    #completewith Grelin
    .goto 1426,27.098,80.707,20 >> 进入霜鬃洞穴
step
    #optional
    #requires FrostMCave1
    #completewith Grelin
    .goto 1426,28.298,79.836,15,0
    .goto 1426,29.252,79.043,15,0
    .goto 1426,30.489,80.165,50 >> 去寻找洞穴里的 |cRXP_ENEMY_冷酷的格瑞克尼尔|r
step
    #sticky << Rogue/Hunter
    #label Grelin
    .goto 1426,30.489,80.165,0,0
    >>击杀洞内的 |cRXP_ENEMY_冷酷的格瑞克尼尔|r，拾取他掉落的 |cRXP_LOOT_格瑞林·白须的日记|r
    .complete 218,1 --Collect Grelin Whitebeard's Journal (x1)
    .mob 冷酷的格瑞克尼尔
--XXSOD xpgate for early 6 training?
step << Rogue/Hunter
    #season 2
    .goto Dun Morogh,30.773,80.063
    >>打开洞内地上的 |cRXP_PICK_霜鬃战利品箱|r，从中拾取 |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r << Rogue
    >>打开洞内地上的 |cRXP_PICK_霜鬃战利品箱|r，从中拾取 |T134419:0|t|cRXP_LOOT_[奇美拉符文]|r << Hunter
    .collect 204795,1 << Rogue --Rune of Shadowstrike (1)
    .collect 206168,1 << Hunter -- Rune of the Chimera (1)
    .train 400105,1 << Rogue
    .train 410121,1 << Hunter
step << Rogue
    #season 2
    #hardcore
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 暗影打击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
--XX HC as softcore have timed quest turnin in Anvilmar (softcore rogues do it after turnin)
step << Hunter
    #season 2
    .train 410121 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[奇美拉符文]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 奇美拉射击]
    .use 206168
    .itemcount 206168,1
step << Rogue
    #season 2
    #hardcore
    #completewith Observations
    #label Shadowstrike1
    .equip 10 >>|cRXP_WARN_如果已有或拾取到一双|r |T132952:0|t|cRXP_LOOT_[手套]|r |cRXP_WARN_，将其装备|r
    .train 400105,3
step << Hunter
    #season 2
    #completewith Observations
    #label Chimera1
    .equip 10 >>|cRXP_WARN_如果已有或拾取到一双|r |T132952:0|t|cRXP_LOOT_[手套]|r |cRXP_WARN_，将其装备|r
    .train 410121,3
step << Rogue
    #season 2
    #hardcore
    #completewith Observations
    #requires Shadowstrike1
    .engrave 10 >>|cRXP_WARN_为你的|r |T132952:0|t|cRXP_LOOT_[手套]|r 铭刻|r |T133816:0|t[铭刻手套 - 暗影打击]
    .train 400105,3
step << Hunter
    #season 2
    #completewith Observations
    #requires Chimera1
    .engrave 10 >>|cRXP_WARN_为你的|r |T132952:0|t|cRXP_LOOT_[手套]|r 铭刻|r |T133816:0|t[铭刻手套 - 奇美拉射击]
    .train 410121,3
step << !Paladin !Warlock !Hunter
    #softcore
    #requires Grelin << Rogue
    #completewith next
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
step
    #hardcore << !Paladin !Warlock !Hunter
    #optional
    #requires Grelin << Rogue/Hunter
    #completewith Stolen
    .goto 1426,29.252,79.043,15,0
    .goto 1426,28.298,79.836,15,0
    .goto 1426,27.098,80.707,20 >> 离开霜鬃洞穴
    .subzoneskip 132
--XX HC only unless you're a Paladin, Warlock, or Hunter
step << !Paladin !Warlock !Hunter
    #hardcore
    #requires Grelin << Rogue
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .accept 3364 >> 接任务：热酒快递
    .target 诺里斯·激流
step
    #hardcore << !Paladin !Warlock !Hunter
    #requires Grelin << Rogue/Hunter
    #label Stolen
    .goto Dun Morogh,25.075,75.715
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 218 >> 交任务：被窃取的日记
    .accept 282 >> 接任务：森内尔的观察站
    .target 格瑞林·白须
step << !Paladin !Warlock !Hunter
    #softcore
    #requires Grelin << Rogue
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    >>|cRXP_WARN_如果任务失败，跳过此步骤|r
    .turnin 3364 >> 交任务：热酒快递
    .accept 3365 >> 接任务：归还酒杯
    .vendor >> 卖掉杂物
    .target 德南·弗卡特
    .isOnQuest 3364
step << !Paladin !Warlock !Hunter
    #optional
    #softcore
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .accept 3365 >> 接任务：归还酒杯
    .vendor >> 卖掉杂物
    .target 德南·弗卡特
    .isQuestTurnedIn 3364
    .isQuestAvailable 317
step << !Paladin !Warlock !Hunter
    #softcore
    #requires Grelin << Rogue
    .abandon 3364 >> 放弃任务 [热酒快递]，稍后会重新接取
step << Rogue
    #season 2
    #softcore
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 暗影打击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
step << Rogue
    #season 2
    #softcore
    #completewith Observations
    #label Shadowstrike1
    .equip 10 >>|cRXP_WARN_如果已有或拾取到一双|r |T132952:0|t|cRXP_LOOT_[手套]|r |cRXP_WARN_，将其装备|r
    .train 400105,3
step << Rogue
    #season 2
    #softcore
    #completewith Observations
    #requires Shadowstrike1
    .engrave 10 >>|cRXP_WARN_为你的|r |T132952:0|t|cRXP_LOOT_[手套]|r 铭刻|r |T133816:0|t[铭刻手套 - 暗影打击]
    .train 400105,3
step << !Paladin !Warlock !Hunter
    #softcore
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r和|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .accept 3364 >> 接任务：热酒快递
    .goto Dun Morogh,24.980,75.963
    .target +诺里斯·激流
    .turnin 218 >> 交任务：被窃取的日记
    .accept 282 >> 接任务：森内尔的观察站
    .goto Dun Morogh,25.075,75.715
    .target +格瑞林·白须
    .isQuestAvailable 3364
step << !Paladin !Warlock !Hunter
    #softcore
    #optional
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .turnin 3364 >> 交任务：热酒快递
    .accept 3365 >> 接任务：归还酒杯
    .target 德南·弗卡特
step << !Paladin !Warlock !Hunter
    #hardcore
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .turnin 3364 >> 交任务：热酒快递
    .accept 3365 >> 接任务：归还酒杯
--  .vendor >> Vendor Trash
    .target 德南·弗卡特
    .isQuestAvailable 317
----Start of >1.59x training section----
step << Mage
    #xprate >1.59
    #season 0,1
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r（里面）交谈
    .turnin 3114 >> 交任务：雕文备忘录 << Gnome
    .trainer >> 学习职业技能
    .target 玛瑞克·斯托纳尔
step << Mage
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r（里面）交谈
    .turnin 3114 >> 交任务：雕文备忘录 << Gnome
    .accept 77667 >> 接任务：法术研究 << Gnome
    .trainer >> 学习职业技能
    .target 玛瑞克·斯托纳尔
step << Gnome Mage
    #xprate >1.59
    #season 2
    #completewith next
    .train 401760 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 冰枪术]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
step << Gnome Mage
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r（里面）交谈
    .turnin 77667 >> 交任务：法术研究
    .target 玛瑞克·斯托纳尔
step << Gnome Mage
    #xprate >1.59
    #season 2
    #label GlovesEquip
    #completewith Observations
    .equip 10,711 >> |cRXP_WARN_装备|r |T132961:0|t[破布手套]
    .use 711
    .train 401760,3
step << Gnome Mage
    #xprate >1.59
    #season 2
    #requires GlovesEquip
    #completewith Observations
    .engrave 10 >>|cRXP_WARN_为你的|r |T132961:0|t[破布手套]铭刻|r |T133816:0|t[铭刻手套 - 冰枪术]
    .train 401760,3
step << Rogue
    #xprate >1.59
    #season 0,1
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索姆·哈格林|r交谈
    .turnin 3113 >> 交任务：密文备忘录 << Gnome
    .turnin 3109 >> 交任务：密文符文 << Dwarf
    .train 1784 >>学习 |T132320:0|t[潜行]
    .trainer >>学习职业技能
    .target 索姆·哈格林
step << Rogue
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索姆·哈格林|r交谈
    .turnin 77658 >> 交任务：三度被盗 << Dwarf
    .turnin 77659 >> 交任务：三度被盗 << Gnome
    .train 921 >>学习 |T133644:0|t[搜索]
    .trainer >>学习职业技能
    .target 索姆·哈格林
step << Priest
    #xprate >1.59
    #season 0,1
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰斯托克·卡德尔|r交谈
    >>|cRXP_WARN_学习|r |T135987:0|t[真言术：韧] |cRXP_WARN_和|r |T135929:0|t[次级治疗术] （等级2） |cRXP_WARN_，接下来的职业任务会用到|r << Dwarf
    .turnin 3110 >> 交任务：神圣符文 << Dwarf
    .accept 5626 >> 接任务：圣光的恩赐 << Dwarf
    .train 1243 >> 学习 |T135987:0|t[真言术：韧]
    .train 2052 >> 学习 |T135929:0|t[次级治疗术] （等级2） << Dwarf
    .trainer >> 学习职业技能
    .target 布兰斯托克·卡德尔
step << Priest
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰斯托克·卡德尔|r交谈
    >>|cRXP_WARN_学习|r |T135929:0|t[次级治疗术] （等级2） |cRXP_WARN_，接下来的职业任务会用到|r << Dwarf
    .accept 5626 >> 接任务：圣光的恩赐 << Dwarf
    .train 2052 >> 学习 |T135929:0|t[次级治疗术] （等级2） << Dwarf
    .trainer >> 学习职业技能
    .target 布兰斯托克·卡德尔
step << Warrior
    #xprate >1.59
    #season 0,1
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .turnin 3106 >> 交任务：简易符文 << Dwarf
    .turnin 3112 >> 交任务：简易备忘录 << Gnome
    .trainer >> 学习职业技能
    .target 斯兰·库尔曼
step << Warrior
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .turnin 77655 >> 交任务：失落的符文 << Dwarf
    .turnin 77656 >> 交任务：失落的符文 << Gnome
    .trainer >> 学习职业技能
    .target 斯兰·库尔曼
----End of >1.59x training section----
----Start of <1.59x training section----
step << Mage
    #xprate <1.59
    #season 0,1
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r（里面）交谈
    .turnin 3114 >> 交任务：雕文备忘录 << Gnome
    .train 1459 >> 学习 |T135932:0|t[奥术智慧]
    .train 116 >> 学习 |T135846:0|t[寒冰箭]
    .target 玛瑞克·斯托纳尔
step << Mage
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r（里面）交谈
    .turnin 3114 >> 交任务：雕文备忘录 << Gnome
    .accept 77667 >> 接任务：法术研究 << Gnome
    .train 1459 >> 学习 |T135932:0|t[奥术智慧]
    .train 116 >> 学习 |T135846:0|t[寒冰箭]
    .target 玛瑞克·斯托纳尔
step << Gnome Mage
    #xprate <1.59
    #season 2
    #completewith next
    .train 401760 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 冰枪术]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
step << Gnome Mage
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r（里面）交谈
    .turnin 77667 >> 交任务：法术研究
    .target 玛瑞克·斯托纳尔
step << Gnome Mage
    #xprate <1.59
    #season 2
    #label GlovesEquip
    #completewith Observations
    .equip 10,711 >> |cRXP_WARN_装备|r |T132961:0|t[破布手套]
    .use 711
    .train 401760,3
step << Gnome Mage
    #xprate <1.59
    #season 2
    #requires GlovesEquip
    #completewith Observations
    .engrave 10 >>|cRXP_WARN_为你的|r |T132961:0|t[破布手套]铭刻|r |T133816:0|t[铭刻手套 - 冰枪术]
    .train 401760,3
step << Rogue
    #xprate <1.59
    #season 0,1
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索姆·哈格林|r交谈
    .turnin 3113 >> 交任务：密文备忘录 << Gnome
    .turnin 3109 >> 交任务：密文符文 << Dwarf
    .train 1784 >>学习 |T132320:0|t[潜行]
    .target 索姆·哈格林
step << Rogue
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索姆·哈格林|r交谈
    .turnin 77658 >> 交任务：三度被盗 << Dwarf
    .turnin 77659 >> 交任务：三度被盗 << Gnome
    .target 索姆·哈格林
step << Priest
    #xprate <1.59
    #season 0,1
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰斯托克·卡德尔|r交谈
    >>|cRXP_WARN_学习|r |T135987:0|t[真言术：韧] |cRXP_WARN_和|r |T135929:0|t[次级治疗术] （等级2） |cRXP_WARN_，接下来的职业任务会用到|r << Dwarf
    .turnin 3110 >> 交任务：神圣符文 << Dwarf
    .accept 5626 >> 接任务：圣光的恩赐 << Dwarf
    .train 1243 >> 学习 |T135987:0|t[真言术：韧]
    .train 2052 >> 学习 |T135929:0|t[次级治疗术] （等级2） << Dwarf
    .trainer >> 学习职业技能
    .target 布兰斯托克·卡德尔
step << Priest
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰斯托克·卡德尔|r交谈
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .target 布兰斯托克·卡德尔
step << Warrior
    #xprate <1.59
    #season 0,1
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .turnin 3106 >> 交任务：简易符文 << Dwarf
    .turnin 3112 >> 交任务：简易备忘录 << Gnome
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 斯兰·库尔曼
step << Warrior
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .turnin 77655 >> 交任务：失落的符文 << Dwarf
    .turnin 77656 >> 交任务：失落的符文 << Gnome
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 斯兰·库尔曼
----End of <1.59x training section----
step << !Paladin !Warlock !Hunter
    #optional
    #completewith Observations
    .goto 1426,28.831,68.698,12 >> 离开安威玛尔
    .subzoneskip 77,1
step << !Paladin !Warlock !Hunter
    #xprate <1.1
    .goto Dun Morogh,29.709,71.255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .turnin 170 >> 交任务：新的威胁
    .target 巴尔林·霜锤
step << Priest/Mage
#season 0,1
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾德林·怒流|r 交谈
    >>卖掉杂物
    >>|cRXP_BUY_向他购买5瓶|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
    .collect 159,5 --Collect Refreshing Spring Water (x5)
    .target 艾德林·怒流
    .money <0.0025
    .xp >8,1
step << !Paladin !Warlock !Hunter
    #softcore
    #label Stolen
    .goto Dun Morogh,25.075,75.715
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 218 >> 交任务：被窃取的日记
    .accept 282 >> 接任务：森内尔的观察站
    .target 格瑞林·白须
step << !Paladin !Warlock !Hunter
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .turnin 3365 >> 交任务：归还酒杯
    .target 诺里斯·激流
step << Dwarf Paladin/Dwarf Hunter
    #season 2
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12,0
    .goto 1426,28.939,68.387,12 >> 进入安威玛尔
step << Dwarf Paladin
    #season 2
    #optional
    .goto Dun Morogh,28.833,68.332
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r交谈
    .turnin 77657 >> 交任务：圣光遗物
    .target 布罗莫斯·格鲁诺尔
    .isQuestComplete 77657
    .equip 10 --Show step if you don't have gloves
step << Dwarf Hunter
    #season 2
    #optional
    .goto Dun Morogh,29.175,67.455
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索加斯·格瑞姆森|r
    .turnin 77660 >> 交任务：穿越洞穴
    .target 索加斯·格瑞姆森
    .isQuestComplete 77660
    .equip 10 --Show step if you don't have gloves
step << Dwarf Paladin/Dwarf Hunter
    #season 2
    #optional
    #completewith ColdridgePass
    .abandon 77657 >> 放弃“圣光遗物”任务，因为你已经装备了一双 |T132938:0|t[手套] << Paladin
    .abandon 77660 >> 放弃“穿越洞穴”任务，因为你已经装备了一双 |T132952:0|t[手套] << Hunter
step
    #label Observations
    >>与|cRXP_FRIENDLY_巡山人萨鲁斯|r和|cRXP_FRIENDLY_汉兹·跳链|r交谈
    .turnin 282 >> 交任务：森内尔的观察站
    .accept 420 >> 接任务：森内尔的观察站
    .goto Dun Morogh,33.484,71.841
    .target +巡山人萨鲁斯
    .accept 2160 >> 接任务：塔诺克的补给品
    .goto Dun Morogh,33.85,72.24
    .target +汉兹·跳链
step
    #label ColdridgePass
    .goto Dun Morogh,34.32,70.95,15,0
    .goto Dun Morogh,35.65,65.79,15 >> 穿越 寒脊山小径
    .subzoneskip 800,1
    .isOnQuest 2160
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#xprate >1.49 << Hunter
#era/som--h
#classic
#tbc
#season 0,1
#version 1
<< Alliance --!Hunter
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 6-11 Dun Morogh
#next 11-12 Elwynn (Dwarf/Gnome);11-12 Voidwalker Quest;12-14 Loch Modan (Dwarf/Gnome);11-13 Loch Modan (Hunter)
#defaultfor Dwarf/Gnome
#displayname 6-12 丹莫罗 << sod !Warlock
#displayname 6-11 丹莫罗
step
    #optional
    #label BoarMeatQuest
    #completewith SenirEnd
    >>击杀|cRXP_ENEMY_峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_保留拾取的全部|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，先用于贝尔丁的补给，之后用于提升|r |T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_你后续在奥伯丁的一个任务需要 10 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能等级|r
    >>|cRXP_WARN_需要50点|r |T133971:0|t[烹饪]|cRXP_WARN_才能完成后续在夜色镇的一个任务|r
    .collect 769,4,317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
    .subzoneskip 131 --Kharanos
step
    #xprate <1.49
    #optional
    .goto 1426,43.316,56.283,60,0
    .goto 1426,43.949,52.524,60,0
    .goto 1426,38.677,60.561,60,0
    .goto Dun Morogh,46.726,53.826
    .xp 5+2145 >> 前往卡拉诺斯. 途中击杀 |cRXP_ENEMY_峭壁野猪|r, 刷怪至 2145+/2800 经验值 << Priest
    .xp 5+2415 >> 前往卡拉诺斯. 途中击杀 |cRXP_ENEMY_峭壁野猪|r, 刷怪至 2415+/2800 经验值 << !Priest
    .subzoneskip 131
--XX 270 from priest quest
--XX 340 from quest, 45 from explore
step
    #xprate 1.49-1.59
    #optional
    .goto 1426,43.316,56.283,60,0
    .goto 1426,43.949,52.524,60,0
    .goto 1426,38.677,60.561,60,0
    .goto Dun Morogh,46.726,53.826
    .xp 5+1817 >> 前往卡拉诺斯. 途中击杀 |cRXP_ENEMY_峭壁野猪|r, 刷怪至 1817+/2800 经验值 << Priest
    .xp 5+2222 >> 前往卡拉诺斯. 途中击杀 |cRXP_ENEMY_峭壁野猪|r, 刷怪至 2222+/2800 经验值 << !Priest
    .subzoneskip 131
step
    #xprate >1.59
    #optional
    .goto 1426,43.316,56.283,60,0
    .goto 1426,43.949,52.524,60,0
    .goto 1426,38.677,60.561,60,0
    .goto Dun Morogh,46.726,53.826
    .xp 5+1490 >> 前往卡拉诺斯. 途中击杀 |cRXP_ENEMY_峭壁野猪|r, 刷怪至 1490+/2800 经验值 << Priest
    .xp 5+2030 >> 前往卡拉诺斯. 途中击杀 |cRXP_ENEMY_峭壁野猪|r, 刷怪至 2030+/2800 经验值 << !Priest
    .subzoneskip 131
step
    #hardcore
    #completewith next
    .goto Dun Morogh,46.726,53.826
    .subzone 131 >> 前往卡拉诺斯
    .mob 峭壁野猪
step
    #softcore
    #completewith next
    >>|cRXP_WARN_确认你当前的子区域不是寒脊山小径|r
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
step
    #label SenirEnd
    .goto Dun Morogh,46.726,53.826
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_森内尔·白须|r 交谈
    .turnin 420 >> 交任务: 森内尔的观察站
    .target 森内尔·白须
step << !Priest
    #xprate <1.5
    #optional
    .goto Dun Morogh,48.3,57.0
    .xp 5+2690 >> 刷怪至 2690+/2800 经验值
step << !Priest
    #xprate 1.49-1.59
    #optional
    .goto Dun Morogh,48.3,57.0
    .xp 5+2635 >> 刷怪至 2635+/2800 经验值
step << !Priest
    #xprate >1.99
    #optional
    .goto Dun Morogh,48.3,57.0
    .xp 5+2580 >> 刷怪至 2580+/2800 经验值
step << Warlock
    .goto Dun Morogh,47.329,53.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吉姆瑞兹·黑轮|r 交谈
    .trainer >> 学习职业技能
    .target 吉姆瑞兹·黑轮
step << Warlock
    .goto Dun Morogh,47.273,53.684
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹尼·血泡|r 交谈
    .vendor 6328 >> |cRXP_BUY_购买|r |T133738:0|t[魔典：血契（等级1）] |cRXP_BUY_（若买得起）；否则可稍后再买。|r
    .target 丹尼·血泡
    .money <0.0100
step
    .goto Dun Morogh,46.825,52.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉格纳·雷酒|r 交谈
    .accept 384 >> 接任务: 啤酒烤猪排
    .target 拉格纳·雷酒
step
    #optional
    #completewith next
    .goto 1426,46.952,52.050,8,0
    .goto 1426,47.153,51.939,8 >> 进入雷酒酿制厂
step
    .goto Dun Morogh,47.217,52.195
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔诺克·霜锤|r 交谈
    .turnin 2160,1 >> 交任务: 塔诺克的补给品 << Warrior/Rogue
    .turnin 2160,2 >> 交任务: 塔诺克的补给品 << !Warrior !Rogue
    .target 塔诺克·霜锤
step << Rogue
    .goto Dun Morogh,47.189,52.403
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克雷格·比尔姆|r交谈
    >>|cRXP_WARN_购买|r |T135641:0|t[平衡飞刀]
    .collect 2946,200 << !tbc
    .collect 25872,1 << tbc
    .target 克雷格·比尔姆
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #optional
    #sticky
    #label BalancedDaggers1
    +|cRXP_WARN_装备|r |T135641:0|t[平衡飞刀]
    .use 2946 << !tbc
    .use 25872 << tbc
    .itemcount 2946,1 << !tbc
    .itemcount 25872,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #optional
    #sticky
    #requires BalancedDaggers1
    #label DeleteOldDaggers
    .destroy 2947 >> 摧毁背包中的 |T135426:0|t[小飞刀或燃烧的远征的轻型飞刀]，之后不再需要
    .destroy 28979 << tbc
step << Rogue
    #xprate <1.59
    .goto Dun Morogh,47.563,52.608
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的后房的 |cRXP_FRIENDLY_霍格拉尔·巴坎|r 交谈
    .trainer >> 学习职业技能
    .target 霍格拉尔·巴坎
step << Mage
    #xprate <1.59
    .goto Dun Morogh,47.498,52.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内楼上的 |cRXP_FRIENDLY_玛济斯·石衣|r 交谈
    .trainer >> 学习职业技能
    .target 玛济斯·石衣
step << Paladin
    #xprate <1.59
    .goto Dun Morogh,47.597,52.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内楼上的 |cRXP_FRIENDLY_阿扎尔·战锤|r 交谈
    .trainer >> 学习职业技能
    .target 阿扎尔·战锤
step << Priest
    .goto Dun Morogh,47.342,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_马克萨恩·安沃尔|r 交谈
    .accept 5625 >> 接任务: 圣光之衣
    .target 马克萨恩·安沃尔
step << Priest
    .goto Dun Morogh,45.805,54.568
    >>施放 |T135929:0|t[次级治疗术]（等级2），然后施放 |T135987:0|t[真言术：韧]，目标为屋外的 |cRXP_FRIENDLY_巡山人多尔夫|r
    .complete 5625,1 --Heal and fortify Mountaineer Dolf
    .target 巡山人多尔夫
step << Priest
    #xprate <1.59
    .goto Dun Morogh,47.342,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_马克萨恩·安沃尔|r 交谈
    .turnin 5625 >> 交任务: 圣光之衣
    .trainer >> 学习职业技能
    .target 马克萨恩·安沃尔
step << Priest
    #xprate >1.59
    .goto Dun Morogh,47.342,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_马克萨恩·安沃尔|r 交谈
    .turnin 5625 >> 交任务: 圣光之衣
    .target 马克萨恩·安沃尔
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .home >> 将你的炉石设置为雷酒酿制厂
    .vendor >> |cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_，能负担多少就买多少。|r << Priest/Mage/Warlock
    .target 旅店老板贝尔姆
step << Warrior
    #xprate <1.59
    .goto Dun Morogh,47.360,52.646
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_格兰尼斯·快斧|r 交谈
    .trainer >> 学习职业技能
    .target 格兰尼斯·快斧
step << Paladin/Warrior/Rogue
    #optional
    #completewith Blacksmithing1
    .goto 1426,45.695,51.911,20 >> 进入铁匠铺
step << Gnome Warrior
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T135321:0|t[步兵剑]
    .target 格劳恩·索姆温
    .money <0.0536
    .collect 2488,1 --Collect Gladius (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Gnome Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
step << Dwarf Warrior
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T132401:0|t[双刃战斧]
    .target 格劳恩·索姆温
    .money <0.0460
    .collect 2491,1 --Collect Large Axe (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.30
step << Dwarf Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.29
step << Rogue
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T135641:0|t[卷刃的剑]
    .target 格劳恩·索姆温
    .money <0.0401
    .collect 2494,1 --Collect Stiletto (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith next
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Paladin
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T133053:0|t[木槌棒]
    .target 格劳恩·索姆温
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.00
step << Paladin
    #completewith next
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.99
step << Warrior/Rogue/Paladin
    #label Blacksmithing1
    .goto 1426,45.344,51.936
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托格努斯·燧火|r 交谈
    >>|cRXP_WARN_这将使你能够制作|r |T135248:0|t[劣质磨刀石]，|cRXP_WARN_使近战伤害提高 2 点|r << Warrior/Rogue
    >>|cRXP_WARN_这将使你能够制作|r |T135255:0|t[劣质平衡石]，|cRXP_WARN_使近战伤害提高 2 点|r << Paladin
    >>|cRXP_WARN_如果你不想做这个,请跳过此步骤|r
    .train 2018 >> 训练 |T136241:0|t[锻造]
    .target 托格努斯·燧火
step
    #requires DeleteOldDaggers << Rogue
    .goto Dun Morogh,46.021,51.676
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨雷克·黑石|r 交谈
    .accept 400 >> 接任务: 贝尔丁的工具
    .target 萨雷克·黑石
step << Rogue
    #season 2
    .goto Dun Morogh,47.658,51.706,5,0
    .goto Dun Morogh,47.160,52.335,5,0
    .goto Dun Morogh,46.917,51.995
    >>|cRXP_WARN_爬上卡拉诺斯旅店的屋顶，然后跳到那个巨大的酒桶上，沿箭头指示前进|r
    >>打开|cRXP_PICK_生锈的宝箱|r，获取 |T134419:0|t[|cRXP_FRIENDLY_杀手符文|r]
    .collect 203993,1 -- Rune of Slaughter (1)
    .train 424992,1
step << Rogue
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_杀手符文|r]|cRXP_WARN_学习符文技能：|r|T236280:0|t[暗影杀手]
    .use 203993
    .itemcount 203993,1
step
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    .collect 769,4,317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
    .subzoneskip 131 --Kharanos
step
    #xprate <1.5
    #label StartStocking
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 和 |cRXP_FRIENDLY_驾驶员迪恩·石轮|r 交谈
    >>|cRXP_WARN_途中不要杀掉任何 |cRXP_ENEMY_黑熊幼崽|r|r
    .accept 317 >> 接任务: 贝尔丁的补给
    .goto Dun Morogh,49.426,48.410
    .target +驾驶员贝隆·风箱
    .accept 313 >> 接任务: 灰色洞穴
    .goto Dun Morogh,49.622,48.612
    .target +驾驶员迪恩·石轮
step << Warrior/Paladin/Rogue
    #xprate 1.49-1.59
    #label StartStocking
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 和 |cRXP_FRIENDLY_驾驶员迪恩·石轮|r 交谈
    >>|cRXP_WARN_途中不要杀掉任何 |cRXP_ENEMY_黑熊幼崽|r|r
    .accept 317 >> 接任务: 贝尔丁的补给
    .goto Dun Morogh,49.426,48.410
    .target +驾驶员贝隆·风箱
    .accept 313 >> 接任务: 灰色洞穴
    .goto Dun Morogh,49.622,48.612
    .target +驾驶员迪恩·石轮
step
    #xprate >1.49 << !Warrior !Paladin !Rogue
    #xprate >1.59 << Warrior/Paladin/Rogue
    #label StartStocking
    .goto Dun Morogh,49.426,48.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 交谈
    >>|cRXP_WARN_途中不要杀掉任何 |cRXP_ENEMY_黑熊幼崽|r|r
    .accept 317 >> 接任务: 贝尔丁的补给
    .target 驾驶员贝隆·风箱
step << Warrior/Paladin/Rogue
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贝尔丁·钢架|r 和 |cRXP_FRIENDLY_罗斯洛·鲁治|r 交谈
    >>|cRXP_BUY_购买一把|r |T134708:0|t[矿工锄] |cRXP_BUY_，出售者为 |cRXP_FRIENDLY_罗斯洛·鲁治|r
    >>|cRXP_WARN_如果你负担不起, 就跳过这一步|r
    .turnin 400 >> 交任务: 贝尔丁的工具
    .goto Dun Morogh,50.443,49.092
    .target +贝尔丁·钢架
    .accept 5541 >> 接任务: 海格纳的弹药
    .collect 2901,1 --Mining Pick (1)
    .goto Dun Morogh,50.084,49.420
    .target +罗斯洛·鲁治
    .train 2018,3 --Blacksmithing
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贝尔丁·钢架|r 和 |cRXP_FRIENDLY_罗斯洛·鲁治|r 交谈
    .turnin 400 >> 交任务: 贝尔丁的工具
    .goto Dun Morogh,50.443,49.092
    .target +贝尔丁·钢架
    .accept 5541 >> 接任务: 海格纳的弹药
    .goto Dun Morogh,50.084,49.420
    .target +罗斯洛·鲁治
step << Warrior/Paladin/Rogue
    #optional
    .goto Dun Morogh,50.01,50.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内楼下的|cRXP_FRIENDLY_亚尔·锤石|r交谈
    >>|cRXP_WARN_如果负担不起，就跳过此步骤|r
    .train 2575 >>学习 |T134708:0|t[采矿]
    .target 亚尔·锤石
    .train 2018,3 --Blacksmithing
step << Warrior/Paladin/Rogue
    #optional
    #completewith RockjawEnd
    .cast 2580 >> |cRXP_WARN_激活技能:|r |T136025:0|t[寻找矿物]
    .usespell 2580
    .train 2575,3 --Mining
step << Warrior/Paladin/Rogue
    #xprate <1.59
    #completewith BearFur
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    .complete 317,1 --Chunk of Boar Meat (4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
    .mob 大峭壁野猪
step << Warrior/Paladin/Rogue
    #xprate <1.59
    #completewith BearFur
    >>击杀|cRXP_ENEMY_黑熊幼崽|r，拾取|cRXP_LOOT_厚熊皮|r
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob 黑熊幼崽
step << Hunter
    #season 2
    #sticky
    #label pigmeat
    >>击杀|cRXP_ENEMY_野猪|r，拾取 |T134026:0|t[丹莫罗猪肉]
    .collect 208192,1
    .mob 峭壁野猪
    .mob 老峭壁野猪
    .mob 大峭壁野猪
    .mob 有伤疤的峭壁野猪
    .train 425762,1
step
    #xprate >1.59 << Paladin/Warrior/Rogue
    #loop
    .goto Dun Morogh,52.0,50.1,0
    .goto Dun Morogh,43.5,52.5,0
    .goto Dun Morogh,52.0,50.1,75,0
    .goto Dun Morogh,51.5,53.9,75,0
    .goto Dun Morogh,50.1,53.9,75,0
    .goto Dun Morogh,49.9,50.9,75,0
    .goto Dun Morogh,48.0,49.5,75,0
    .goto Dun Morogh,48.2,46.9,75,0
    .goto Dun Morogh,43.5,52.5,75,0
    >>击杀|cRXP_ENEMY_黑熊幼崽|r，拾取|cRXP_LOOT_厚熊皮|r
    >>击杀|cRXP_ENEMY_大峭壁野猪|r和|cRXP_ENEMY_峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob +黑熊幼崽
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .disablecheckbox
    .mob 大峭壁野猪
    .mob 峭壁野猪
step
    #xprate >1.59 << Paladin/Warrior/Rogue
    #optional
    #completewith EvershineEnd
    >>击杀|cRXP_ENEMY_大峭壁野猪|r和|cRXP_ENEMY_峭壁野猪|r，拾取|cRXP_LOOT_峭壁野猪肋排|r
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 大峭壁野猪
    .mob 峭壁野猪
step
    #xprate >1.59 << Paladin/Warrior/Rogue
    .goto Dun Morogh,49.426,48.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 交谈
    .turnin 317 >> 交任务: 贝尔丁的补给
    .accept 318 >> 接任务: 艾沃沙酒
    .target 驾驶员贝隆·风箱
step << Warrior/Paladin/Rogue
    #xprate >1.59
    #optional
    .goto Dun Morogh,50.084,49.420
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗斯洛·鲁治|r交谈
    >>|cRXP_BUY_向他购买一把|r |T134708:0|t[矿工锄]|cRXP_BUY_。|r
    .collect 2901,1 --Mining Pick (1)
    .target 罗斯洛·鲁治
    .train 2018,3 --Blacksmithing
step << Warrior/Paladin/Rogue
    #xprate >1.59
    #optional
    .goto Dun Morogh,50.01,50.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内楼下的|cRXP_FRIENDLY_亚尔·锤石|r交谈
    .train 2575 >>学习 |T134708:0|t[采矿]
    .target 亚尔·锤石
    .train 2018,3 --Blacksmithing
step
    #xprate >1.59 << Warrior/Paladin/Rogue
    #optional
    #completewith next
    .goto 1426,46.952,52.050,8,0
    .goto 1426,47.153,51.939,8 >> 进入雷酒酿制厂
step
    #xprate >1.59 << Warrior/Paladin/Rogue
    #optional
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_向他购买一杯|r |T132800:0|t[狂想麦酒]|cRXP_BUY_。|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .target 旅店老板贝尔姆
    .itemcount 2886,6 --Crag Boar Rib (6)
step
    #xprate >1.59 << Warrior/Paladin/Rogue
    #optional
    .goto Dun Morogh,46.825,52.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋外的 |cRXP_FRIENDLY_拉格纳·雷酒|r 交谈
    .turnin 384 >> 交任务: 啤酒烤猪排
    .target 拉格纳·雷酒
    .isQuestComplete 384
step << Paladin/Warrior/Rogue
    #optional
    #completewith next
    .goto 1426,45.695,51.911,20 >> 进入铁匠铺
step << Gnome Warrior
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T135321:0|t[步兵剑]
    .target 格劳恩·索姆温
    .money <0.0536
    .collect 2488,1 --Collect Gladius (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Gnome Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
step << Dwarf Warrior
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T132401:0|t[双刃战斧]
    .target 格劳恩·索姆温
    .money <0.0460
    .collect 2491,1 --Collect Large Axe (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.30
step << Dwarf Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.29
step << Rogue
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T135641:0|t[卷刃的剑]
    .target 格劳恩·索姆温
    .money <0.0401
    .collect 2494,1 --Collect Stiletto (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith next
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Paladin
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T133053:0|t[木槌棒]
    .target 格劳恩·索姆温
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.00
step << Paladin
    #completewith next
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.99
step << Hunter
    #optional
    .xp 6 >> 刷到6级
step << Hunter
    #optional
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格瑞夫|r
    .train 3044 >> 学习 |T132218:0|t[奥术射击]
    .train 1130 >> 学习 |T132212:0|t[猎人印记]
    .target 格瑞夫
    .money <0.02
step << Hunter
    #season 0,1
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格瑞夫|r
    .train 3044 >> 学习 |T132218:0|t[奥术射击]
    .target 格瑞夫
    .money <0.01
step << Hunter
    #season 2
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格瑞夫|r
    .train 1130 >> 学习 |T132212:0|t[猎人印记]
    >>|cRXP_WARN_如果钱不够, 就在卡拉诺斯附近刷怪. 你很快就会用到这个法术|r
    .target 格瑞夫
step << Warrior/Rogue/Priest/Mage/Warlock
    #optional
    #completewith next
    .goto 1426,46.952,52.050,8,0
    .goto 1426,47.153,51.939,8 >> 进入雷酒酿制厂
step << Warrior/Rogue
    #completewith next
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .vendor 1247 >> |cRXP_BUY_购买|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_，能负担多少就买多少。|r
    .target 旅店老板贝尔姆
    .money <0.0125
    .itemcount 4541,<1 --Freshly Baked Bread (1)
    .xp >10,1
step << Priest/Mage/Warlock
    #completewith next
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .vendor 1247 >> |cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_，能负担多少就买多少。|r
    .target 旅店老板贝尔姆
    .money <0.0125
    .itemcount 1179,<1 --Ice Cold Milk (1)
    .xp >10,1
step
    #season 0,1 << Warrior
    #xprate <1.49 << !Warrior !Paladin !Rogue
    #xprate <1.59 << Warrior/Paladin/Rogue
    #optional
    #completewith next
    .goto 1426,42.982,54.755
    .subzone 136 >> 前往 灰色洞穴
    .isOnQuest 313
step << Warrior
    #season 2
    #optional
    #completewith next
    .goto 1426,42.982,54.755
    .subzone 136 >> 前往 灰色洞穴
    .isOnQuest 313
step << Warrior
    #season 2
    #sticky
    #label WendigoPaw
    #loop
    .goto 1426,42.982,54.755,0
    .goto 1426,41.918,54.053,0
    .goto 1426,41.100,48.927,0
    .waypoint 1426,41.918,54.053,40,0
    .waypoint 1426,42.177,53.274,40,0
    .waypoint 1426,41.100,48.927,40,0
    >>击杀|cRXP_ENEMY_雪怪|r，拾取|cRXP_LOOT_被砍下的雪怪的爪子|r
    .collect 208160,1 -- Severed Wendigo Paw (1)
    .mob 雪怪幼崽
    .mob 雪怪
    .train 403475,1
step
    #xprate <1.49 << !Warrior !Paladin !Rogue
    #xprate <1.59 << Warrior/Paladin/Rogue
    #optional << Warrior/Paladin/Rogue
    #loop
    .goto 1426,42.982,54.755,0
    .goto 1426,41.918,54.053,0
    .goto 1426,41.100,48.927,0
    .goto 1426,42.982,54.755,40,0
    .goto 1426,41.901,55.217,40,0
    .goto 1426,41.918,54.053,40,0
    .goto 1426,42.177,53.274,40,0
    .goto 1426,41.100,48.927,40,0
    >>击杀|cRXP_ENEMY_雪怪|r和|cRXP_ENEMY_雪怪幼崽|r，拾取|cRXP_LOOT_雪怪的鬃毛|r
    >>|cRXP_WARN_记得留意|r |T134566:0|t[铜矿]|cRXP_WARN_，其中会产出|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_，可用于制作|r |T135248:0|t[劣质磨刀石] << Warrior/Rogue
    >>|cRXP_WARN_记得留意|r |T134566:0|t[铜矿]|cRXP_WARN_，其中会产出|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_，可用于制作|r |T135255:0|t[劣质平衡石] << Paladin
    .complete 313,1 --Collect Wendigo Mane (x8)
    .mob 雪怪
    .mob 雪怪幼崽
    .train 2018,3 << Warrior/Paladin/Rogue --Blacksmithing Trained
step << Warrior/Paladin/Rogue
    #xprate <1.59
    #loop
    .goto 1426,42.982,54.755,0
    .goto 1426,41.918,54.053,0
    .goto 1426,41.100,48.927,0
    .goto 1426,42.982,54.755,40,0
    .goto 1426,41.901,55.217,40,0
    .goto 1426,41.918,54.053,40,0
    .goto 1426,42.177,53.274,40,0
    .goto 1426,41.100,48.927,40,0
    >>击杀|cRXP_ENEMY_雪怪|r和|cRXP_ENEMY_雪怪幼崽|r，拾取|cRXP_LOOT_雪怪的鬃毛|r
    .complete 313,1 --Collect Wendigo Mane (x8)
    .mob 雪怪
    .mob 雪怪幼崽
    .train 2018,1 << Warrior/Paladin/Rogue --Blacksmithing Not Trained
step
    .goto Dun Morogh,44.13,56.95
    >>打开|cRXP_PICK_弹药箱|r，获取|cRXP_LOOT_海格纳的弹药|r
    .complete 5541,1 --Collect Rumbleshot's Ammo (x1)
step
    #optional
    #completewith next
    .goto 1426,40.632,62.794,40,0
    .goto Dun Morogh,40.682,65.130,15 >>前往 |cRXP_FRIENDLY_海格纳·重枪|r
step << Hunter
    #optional
    .goto Dun Morogh,40.682,65.130
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_海格纳·重枪|r 交谈
    >>|cRXP_BUY_向他购买一把|r |T135611:0|t[精制短枪]|cRXP_BUY_。|r
    >>|cRXP_WARN_如果你负担不起, 就跳过这一步|r
    .turnin 5541 >> 交任务: 海格纳的弹药
    .collect 2509,1 -- Ornate Blunderbuss (1)
    .target 海格纳·重枪
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.95
step
    #label BearFur
    .goto Dun Morogh,40.682,65.130
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_海格纳·重枪|r 交谈
    .turnin 5541 >> 交任务: 海格纳的弹药
    .target 海格纳·重枪
step
    #xprate >1.59 << Warrior/Paladin/Rogue
    #optional
    #loop
    .goto 1426,38.874,61.932,0
    .goto 1426,38.783,60.304,0
    .goto 1426,36.237,60.316,0
    .goto 1426,38.874,61.932,45,0
    .goto 1426,38.783,60.304,45,0
    .goto 1426,36.237,60.316,45,0
    .xp 7 >> 刷怪升级到 7 级
    .mob 雪豹幼崽
    .mob 黑熊幼崽
    .mob 峭壁野猪
step << Warrior/Paladin/Rogue
    #xprate <1.59
    #loop
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    >>击杀|cRXP_ENEMY_黑熊幼崽|r，拾取|cRXP_LOOT_皮毛|r
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .mob +峭壁野猪
    .mob +大峭壁野猪
    .goto 1426,43.704,65.296,0
    .goto 1426,47.657,64.039,0
    .goto 1426,46.285,59.797,0
    .goto 1426,43.704,65.296,60,0
    .goto 1426,44.729,65.685,60,0
    .goto 1426,45.128,64.702,60,0
    .goto 1426,46.111,64.349,60,0
    .goto 1426,47.657,64.039,60,0
    .goto 1426,49.484,62.370,60,0
    .goto 1426,49.156,59.842,60,0
    .goto 1426,49.403,58.855,60,0
    .goto 1426,48.523,57.088,60,0
    .goto 1426,46.285,59.797,60,0
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .disablecheckbox
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob +黑熊幼崽
    .goto 1426,43.452,58.760,0
    .goto 1426,44.898,50.142,0
    .goto 1426,50.555,51.778,0
    .goto 1426,43.452,58.760,60,0
    .goto 1426,44.969,55.078,60,0
    .goto 1426,43.748,51.885,60,0
    .goto 1426,44.243,50.923,60,0
    .goto 1426,44.898,50.142,60,0
    .goto 1426,45.395,49.347,60,0
    .goto 1426,48.092,49.904,60,0
    .goto 1426,49.177,51.013,60,0
    .goto 1426,50.555,51.778,60,0
    .mob 峭壁野猪
    .mob 大峭壁野猪
step << Warrior/Paladin/Rogue
    #xprate <1.59
    #completewith Tundra
    .goto 1426,43.704,65.296,0
    .goto 1426,47.657,64.039,0
    .goto 1426,46.285,59.797,0
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取|cRXP_LOOT_峭壁野猪肋排|r
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
    .mob 大峭壁野猪
step << Warrior/Paladin/Rogue
    #xprate <1.59
    .goto Dun Morogh,49.426,48.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 交谈
    .turnin 317 >> 交任务: 贝尔丁的补给
    .accept 318 >> 接任务: 艾沃沙酒
    .target 驾驶员贝隆·风箱
step << Warrior/Paladin/Rogue
    #xprate <1.59
    .goto Dun Morogh,49.622,48.612
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员迪恩·石轮|r 交谈
    .turnin 313 >> 交任务: 灰色洞穴
    .target 驾驶员迪恩·石轮
step << Warrior/Paladin/Rogue
    #xprate <1.59
    #optional
    .goto Dun Morogh,50.084,49.420
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗斯洛·鲁治|r交谈
    >>|cRXP_BUY_向他购买一把|r |T134708:0|t[矿工锄]|cRXP_BUY_。|r
    .collect 2901,1 --Mining Pick (1)
    .target 罗斯洛·鲁治
    .train 2018,3 --Blacksmithing
step << Warrior/Paladin/Rogue
    #xprate <1.59
    #optional
    .goto Dun Morogh,50.01,50.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内楼下的|cRXP_FRIENDLY_亚尔·锤石|r交谈
    .train 2575 >>学习 |T134708:0|t[采矿]
    .target 亚尔·锤石
    .train 2018,3 --Blacksmithing
step << Warrior/Paladin/Rogue
    #xprate <1.59
    #optional
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_向他购买一杯|r |T132800:0|t[狂想麦酒]|cRXP_BUY_。|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .target 旅店老板贝尔姆
    .itemcount 2886,6 --Crag Boar Rib (6)
step << Warrior/Paladin/Rogue
    #xprate <1.59
    #optional
    .goto Dun Morogh,46.825,52.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋外的 |cRXP_FRIENDLY_拉格纳·雷酒|r 交谈
    .turnin 384 >> 交任务: 啤酒烤猪排
    .target 拉格纳·雷酒
    .isQuestComplete 384
step << Warrior/Paladin/Rogue
    #xprate <1.49
    #optional
    #loop
    .goto 1426,48.523,57.088,60,0
    .goto 1426,46.285,59.797,60,0
    .goto 1426,43.704,65.296,60,0
    .goto 1426,44.729,65.685,60,0
    .goto 1426,45.128,64.702,60,0
    .goto 1426,46.111,64.349,60,0
    .goto 1426,47.657,64.039,60,0
    .goto 1426,49.484,62.370,60,0
    .goto 1426,49.156,59.842,60,0
    .goto 1426,49.403,58.855,60,0
    .xp 7 >> 刷到 7 级
step << Warrior/Rogue
    #xprate <1.59
    #optional
    #loop
    .goto 1426,48.523,57.088,60,0
    .goto 1426,46.285,59.797,60,0
    .goto 1426,43.704,65.296,60,0
    .goto 1426,44.729,65.685,60,0
    .goto 1426,45.128,64.702,60,0
    .goto 1426,46.111,64.349,60,0
    .goto 1426,47.657,64.039,60,0
    .goto 1426,49.484,62.370,60,0
    .goto 1426,49.156,59.842,60,0
    .goto 1426,49.403,58.855,60,0
    .xp 8 >> 刷到 8 级
step << Rogue
    #xprate <1.59
    .goto Dun Morogh,47.563,52.608
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的后房的 |cRXP_FRIENDLY_霍格拉尔·巴坎|r 交谈
    .trainer >> 学习职业技能
    .target 霍格拉尔·巴坎
    .xp <8,1
step << Paladin
    #xprate <1.59
    .goto Dun Morogh,47.597,52.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内楼上的 |cRXP_FRIENDLY_阿扎尔·战锤|r 交谈
    .trainer >> 学习职业技能
    .target 阿扎尔·战锤
    .xp <8,1
step << Warrior
    #xprate <1.59
    .goto Dun Morogh,47.360,52.646
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_格兰尼斯·快斧|r 交谈
    .trainer >> 学习职业技能
    .target 格兰尼斯·快斧
    .xp <8,1
step << Paladin/Warrior/Rogue
    #xprate <1.59
    #optional
    #completewith next
    .goto 1426,45.695,51.911,20 >> 进入铁匠铺
step << Gnome Warrior
    #xprate <1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T135321:0|t[步兵剑]
    .target 格劳恩·索姆温
    .money <0.0536
    .goto Dun Morogh,45.290,52.190
    .collect 2488,1 --Collect Gladius (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Gnome Warrior
    #xprate <1.59
    #completewith Tundra
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
step << Dwarf Warrior
    #xprate <1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T132401:0|t[双刃战斧]
    .target 格劳恩·索姆温
    .money <0.0460
    .goto Dun Morogh,45.290,52.190
    .collect 2491,1 --Collect Large Axe (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.30
step << Dwarf Warrior
    #xprate <1.59
    #completewith Tundra
    +|cRXP_WARN_装备|r |T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.29
step << Rogue
    #xprate <1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T135641:0|t[卷刃的剑]
    .target 格劳恩·索姆温
    .money <0.0401
    .goto Dun Morogh,45.290,52.190
    .collect 2494,1 --Collect Stiletto (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #xprate <1.59
    #completewith Tundra
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Paladin
    #xprate <1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T133053:0|t[木槌棒]
    .target 格劳恩·索姆温
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.00
step << Paladin
    #xprate <1.59
    #completewith Tundra
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.99
step << Warrior/Rogue
    #xprate <1.59
    #optional
    #completewith next
    .goto 1426,46.952,52.050,8,0
    .goto 1426,47.153,51.939,8 >> 进入雷酒酿制厂
step << Warrior/Rogue
    #xprate <1.59
    #completewith Tundra
    .goto Dun Morogh,46.9,52.1,20,0
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
.vendor 1247 >> 向他购买尽可能多的[刚出炉的面包]，以你能负担的数量为限
    .target 旅店老板贝尔姆
    .money <0.0125
    .itemcount 4541,<1 --Freshly Baked Bread (1)
    .xp >10,1
step << Paladin/Warrior/Rogue
    #xprate <1.59
    #optional
    #completewith Tundra
    #label Chillbreeze
    .goto 1426,41.054,47.492
    .subzone 801 >> 前往 寒风峡谷
step << Paladin/Warrior/Rogue
    #xprate <1.59
    #optional
    #completewith Tundra
    #requires Chillbreeze
    .goto 1426,35.942,52.030,15,0
    .goto Dun Morogh,34.577,51.652,20 >> 前往 |cRXP_FRIENDLY_图德拉·马克格拉恩|r 处
step
    #xprate >1.59 << Paladin/Warrior/Rogue
    #optional
    #completewith Tundra
    #label Chillbreeze
    .goto 1426,35.237,56.815
    .subzone 801 >> 前往 寒风峡谷
step
    #xprate >1.59 << Paladin/Warrior/Rogue
    #optional
    #completewith Tundra
    #requires Chillbreeze
    .goto 1426,36.368,52.354,20,0
    .goto 1426,35.942,52.030,15,0
    .goto Dun Morogh,34.577,51.652,20 >> 前往 |cRXP_FRIENDLY_图德拉·马克格拉恩|r 处
step
    #label Tundra
    .goto Dun Morogh,34.577,51.652
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图德拉·马克格拉恩|r 交谈
    .accept 312 >> 接任务: 马克格拉恩的干肉
    .target 图德拉·马克格拉恩
step << Hunter/Rogue
    #xprate >1.59 << Rogue
    #season 0,1 << Hunter
    .goto Dun Morogh,38.517,53.927
    >>打开 |cRXP_PICK_马克格拉恩的储肉柜|r，拾取 |cRXP_LOOT_马克格拉恩的干肉|r
    >>|cRXP_WARN_等待 |cRXP_ENEMY_冰须|r 巡逻到洞穴外；它离开后即可进入并搜刮|r |cRXP_PICK_马克格拉恩的储肉柜|r
    .link https://www.youtube.com/watch?v=o55Y3LjgKoE >> |cRXP_WARN_点击这里查看视频参考|r
    .complete 312,1 --MacGrann's Dried Meats (1)
step << Hunter/Rogue
    #xprate >1.59 << Rogue
    #season 0,1 << Hunter
    .goto Dun Morogh,34.577,51.652
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图德拉·马克格拉恩|r 交谈
    .turnin 312 >> 交任务: 马克格拉恩的干肉
    .target 图德拉·马克格拉恩
step << Hunter
    #season 2
    .goto Dun Morogh,38.517,53.927
    >>打开 |cRXP_PICK_马克格拉恩的储肉柜|r，拾取 |cRXP_LOOT_马克格拉恩的干肉|r
    >>|cRXP_WARN_等待 |cRXP_ENEMY_冰须|r 巡逻到洞穴外；它离开后即可进入并搜刮|r |cRXP_PICK_马克格拉恩的储肉柜|r
    .link https://www.youtube.com/watch?v=o55Y3LjgKoE >> |cRXP_WARN_点击这里查看视频参考|r
    .complete 312,1 --MacGrann's Dried Meats (1)
step << Hunter
    #season 2
    .goto Dun Morogh,34.577,51.652
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图德拉·马克格拉恩|r 交谈
    .turnin 312 >> 交任务: 马克格拉恩的干肉
    .target 图德拉·马克格拉恩
step
    #completewith next
    .goto Dun Morogh,30.453,46.005
    .subzone 137 >> 前往 烈酒村
step << !Mage !Priest
    #completewith next
    .goto Dun Morogh,30.453,46.005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_基格·吉布恩|r
    .vendor >> 卖掉杂物
    .target 基格·吉布恩
step << Priest/Mage/Warlock
    #completewith next
    .goto Dun Morogh,30.453,46.005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    >>|cRXP_BUY_最多购买20杯|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_，出售者为他|r
    .collect 1179,20
    .target 基格·吉布恩
    .isOnQuest 318
step
    #label EvershineEnd
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷杰德·麦酒|r 和 |cRXP_FRIENDLY_马莱斯·麦酒|r
    .turnin 318 >> 交任务: 艾沃沙酒
    .accept 319 >> 接任务: 艾沃沙酒
    .accept 315 >> 接任务: 完美烈酒
    .goto Dun Morogh,30.190,45.726
    .target +雷杰德·麦酒
    .accept 310 >> 接任务: 针锋相对
    .goto Dun Morogh,30.186,45.531
    .target +马莱斯·麦酒
step
    #sticky
    #label ForceFavorRibNo
    #loop
    .goto 1426,31.212,39.189,0
    .goto 1426,27.876,45.549,0
    .goto 1426,29.443,50.102,0
    .goto 1426,31.691,46.837,0
    .waypoint 1426,31.212,39.189,60,0
    .waypoint 1426,30.049,38.561,60,0
    .waypoint 1426,29.198,40.458,60,0
    .waypoint 1426,29.362,42.975,60,0
    .waypoint 1426,28.298,44.441,60,0
    .waypoint 1426,27.876,45.549,60,0
    .waypoint 1426,26.294,46.484,60,0
    .waypoint 1426,27.562,47.657,60,0
    .waypoint 1426,28.020,48.267,60,0
    .waypoint 1426,27.874,49.402,60,0
    .waypoint 1426,29.443,50.102,60,0
    .waypoint 1426,28.412,52.449,60,0
    .waypoint 1426,27.650,53.709,60,0
    .waypoint 1426,26.769,55.778,60,0
    .waypoint 1426,29.294,54.249,60,0
    .waypoint 1426,31.767,49.790,60,0
    .waypoint 1426,33.832,48.153,60,0
    .waypoint 1426,31.691,46.837,60,0
    >>击杀|cRXP_ENEMY_老峭壁野猪|r，拾取|cRXP_LOOT_峭壁野猪肋排|r
    >>击杀|cRXP_ENEMY_冰爪熊|r和|cRXP_ENEMY_雪豹|r
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +老峭壁野猪
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob +老峭壁野猪
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +冰爪熊
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +雪豹
    .isQuestAvailable 384
step
    #sticky
    #label ForceFavorRibYes
    #loop
    .goto 1426,31.212,39.189,0
    .goto 1426,27.876,45.549,0
    .goto 1426,29.443,50.102,0
    .goto 1426,31.691,46.837,0
    .waypoint 1426,31.212,39.189,60,0
    .waypoint 1426,30.049,38.561,60,0
    .waypoint 1426,29.198,40.458,60,0
    .waypoint 1426,29.362,42.975,60,0
    .waypoint 1426,28.298,44.441,60,0
    .waypoint 1426,27.876,45.549,60,0
    .waypoint 1426,26.294,46.484,60,0
    .waypoint 1426,27.562,47.657,60,0
    .waypoint 1426,28.020,48.267,60,0
    .waypoint 1426,27.874,49.402,60,0
    .waypoint 1426,29.443,50.102,60,0
    .waypoint 1426,28.412,52.449,60,0
    .waypoint 1426,27.650,53.709,60,0
    .waypoint 1426,26.769,55.778,60,0
    .waypoint 1426,29.294,54.249,60,0
    .waypoint 1426,31.767,49.790,60,0
    .waypoint 1426,33.832,48.153,60,0
    .waypoint 1426,31.691,46.837,60,0
    >>击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +冰爪熊
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +老峭壁野猪
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +雪豹
    .isQuestTurnedIn 384
--XX Forcing this so people are a higher level for second wave of west quests (even on 2x)
step << Hunter
    #season 2
    #sticky
    #label Marksmanship1
    .goto Dun Morogh,28.852,49.859
    >>施放 |T132212:0|t[猎人印记]，目标为 |cRXP_ENEMY_沙沙作响的灌木丛|r
    >>击杀生成的|cRXP_ENEMY_钢鬃偷猎者|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob 沙沙作响的灌木丛
    .mob 钢鬃偷猎者
    .train 410113,1
step << Hunter
    #season 2
    #sticky
    #label Marksmanship2
    #requires Marksmanship1
    .cast 402265 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .use 206155
    .train 410113,1
step << Hunter/Mage/Warrior
    #season 2
    #requires Marksmanship2 << Hunter
    #label Fyodi1
    #loop
    .goto 1426,31.87,38.45,0
    .goto 1426,30.42,39.84,0
    .goto 1426,30.02,39.08,0
    .goto 1426,33.82,37.26,0
    .goto 1426,31.87,38.45,50,0
    .goto 1426,30.42,39.84,50,0
    .goto 1426,30.02,39.08,50,0
    .goto 1426,33.82,37.26,50,0
    >>击杀|cRXP_ENEMY_菲欧迪|r，拾取 |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r << Hunter
    >>击杀|cRXP_ENEMY_菲欧迪|r，拾取 |T134939:0|t|cRXP_LOOT_[法术笔记：IGBHNHZNAI]|r << Mage
    >>击杀|cRXP_ENEMY_菲欧迪|r，拾取 |T134419:0|t|cRXP_LOOT_[狂怒雷霆符文]|r << Warrior
    >>|cRXP_WARN_虽然|cRXP_ENEMY_菲欧迪|r显示为精英怪，但他的生命值、伤害和护甲其实都与普通怪相同|r
    >>|cRXP_WARN_注意它施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提升移动速度3秒，命中时造成35-80点近战伤害；仅可在一定距离外施放）|r
    >>|cRXP_WARN_注意：|r|T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r|cRXP_WARN_也可能从丹莫罗的所有稀有怪物，以及|cRXP_ENEMY_瓦加什|r、|cRXP_ENEMY_癞爪|r和|r|cRXP_ENEMY_冰须|r身上掉落 << Hunter
    >>|cRXP_WARN_注意：|r|T134939:0|t|cRXP_LOOT_[法术笔记：IGBHNHZNAI]|r |cRXP_WARN_也可能从丹莫罗的所有稀有怪物，以及|cRXP_ENEMY_瓦加什|r、|cRXP_ENEMY_癞爪|r和|r|cRXP_ENEMY_冰须|r身上掉落 << Mage
    >>|cRXP_WARN_注意：|r|T134419:0|t|cRXP_LOOT_[狂怒雷霆符文]|r|cRXP_WARN_也可能从丹莫罗的所有稀有怪物，以及|cRXP_ENEMY_瓦加什|r、|cRXP_ENEMY_癞爪|r和|r|cRXP_ENEMY_冰须|r身上掉落 << Warrior
    .collect 206169,1 << Hunter --Rune of Explosive Shot (1)
    .collect 203753,1 << Mage --Spell Notes: RING SEFF OSTROF (1)
    .collect 204809,1 << Warrior --Rune of Furious Thunder (1)
    .mob 菲欧迪
    .train 410123,1 << Hunter
    .train 401765,1 << Mage
    .train 403476,1 << Warrior
step << Hunter
    #season 2
    #sticky
    #requires Fyodi1
    #label FyodiEnd
    .train 410123 >> |cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r |cRXP_WARN_来学习|r |T133816:0|t[铭刻手套 - 爆炸射击]
    .use 206169
    .itemcount 206169,1
step << Mage
    #season 2
    #sticky
    #requires Fyodi1
    #label FyodiEnd
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_LOOT_[法术笔记：IGBHNHZNAI]|r |cRXP_WARN_学习|r |T133815:0|t[铭刻胸甲 - 寒冰指]
    .use 203753
    .itemcount 203753,1 --Spell Notes: RING SEFF OSTROF (1)
    .itemcount 211779,1 --Comprehension Charm (1)
step << Warrior
    #season 2
    #sticky
    #requires Fyodi1
    #label FyodiEnd
    .train 403476 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[狂怒雷霆符文]|r|cRXP_WARN_学习|r |T136048:0|t[狂怒雷霆]
    .use 204809
    .itemcount 204809,1 --Rune of Furious Thunder (1)
step
    #optional
    #requires ForceFavorRibNo
--XXREQ Placeholder invis step until multiple requires per step
step
    #optional
    #requires ForceFavorRibYes
--XXREQ Placeholder invis step until multiple requires per step
step
    #requires FyodiEnd << Hunter/Mage/Warrior --Season 2
    .goto Dun Morogh,30.189,45.725
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷杰德·麦酒|r 交谈
    .turnin 319 >> 交任务: 艾沃沙酒
    .accept 320 >> 接任务: 艾沃沙酒
    .target 雷杰德·麦酒
step
    #hardcore
    #completewith Distracting
    .goto Dun Morogh,47.377,52.523
    .subzone 131 >> 返回卡拉诺斯
--XX if they don't somehow meet xp gate by Kharanos then wcyd
step
    #xprate <1.5
    #loop
    .goto 1426,31.212,39.189,0
    .goto 1426,27.876,45.549,0
    .goto 1426,29.443,50.102,0
    .goto 1426,31.691,46.837,0
    .goto 1426,31.212,39.189,60,0
    .goto 1426,30.049,38.561,60,0
    .goto 1426,29.198,40.458,60,0
    .goto 1426,29.362,42.975,60,0
    .goto 1426,28.298,44.441,60,0
    .goto 1426,27.876,45.549,60,0
    .goto 1426,26.294,46.484,60,0
    .goto 1426,27.562,47.657,60,0
    .goto 1426,28.020,48.267,60,0
    .goto 1426,27.874,49.402,60,0
    .goto 1426,29.443,50.102,60,0
    .goto 1426,28.412,52.449,60,0
    .goto 1426,27.650,53.709,60,0
    .goto 1426,26.769,55.778,60,0
    .goto 1426,29.294,54.249,60,0
    .goto 1426,31.767,49.790,60,0
    .goto 1426,33.832,48.153,60,0
    .goto 1426,31.691,46.837,60,0
    .xp 7+3735 >>刷怪至 3735+/4500 经验值
    .isQuestAvailable 384
step
    #xprate 1.49-1.59
    #loop
    .goto 1426,31.212,39.189,0
    .goto 1426,27.876,45.549,0
    .goto 1426,29.443,50.102,0
    .goto 1426,31.691,46.837,0
    .goto 1426,31.212,39.189,60,0
    .goto 1426,30.049,38.561,60,0
    .goto 1426,29.198,40.458,60,0
    .goto 1426,29.362,42.975,60,0
    .goto 1426,28.298,44.441,60,0
    .goto 1426,27.876,45.549,60,0
    .goto 1426,26.294,46.484,60,0
    .goto 1426,27.562,47.657,60,0
    .goto 1426,28.020,48.267,60,0
    .goto 1426,27.874,49.402,60,0
    .goto 1426,29.443,50.102,60,0
    .goto 1426,28.412,52.449,60,0
    .goto 1426,27.650,53.709,60,0
    .goto 1426,26.769,55.778,60,0
    .goto 1426,29.294,54.249,60,0
    .goto 1426,31.767,49.790,60,0
    .goto 1426,33.832,48.153,60,0
    .goto 1426,31.691,46.837,60,0
    .xp 7+3355 >>刷怪至 3355+/4500 经验值
    .isQuestAvailable 384
step << Rogue/Hunter
    #xprate >1.59
    #loop
    .goto 1426,31.212,39.189,0
    .goto 1426,27.876,45.549,0
    .goto 1426,29.443,50.102,0
    .goto 1426,31.691,46.837,0
    .goto 1426,31.212,39.189,60,0
    .goto 1426,30.049,38.561,60,0
    .goto 1426,29.198,40.458,60,0
    .goto 1426,29.362,42.975,60,0
    .goto 1426,28.298,44.441,60,0
    .goto 1426,27.876,45.549,60,0
    .goto 1426,26.294,46.484,60,0
    .goto 1426,27.562,47.657,60,0
    .goto 1426,28.020,48.267,60,0
    .goto 1426,27.874,49.402,60,0
    .goto 1426,29.443,50.102,60,0
    .goto 1426,28.412,52.449,60,0
    .goto 1426,27.650,53.709,60,0
    .goto 1426,26.769,55.778,60,0
    .goto 1426,29.294,54.249,60,0
    .goto 1426,31.767,49.790,60,0
    .goto 1426,33.832,48.153,60,0
    .goto 1426,31.691,46.837,60,0
    .xp 9+6110 >>刷怪至 6110+/6500 经验值
    .isQuestAvailable 384
step
    #xprate <1.5
    #loop
    .goto 1426,31.212,39.189,0
    .goto 1426,27.876,45.549,0
    .goto 1426,29.443,50.102,0
    .goto 1426,31.691,46.837,0
    .goto 1426,31.212,39.189,60,0
    .goto 1426,30.049,38.561,60,0
    .goto 1426,29.198,40.458,60,0
    .goto 1426,29.362,42.975,60,0
    .goto 1426,28.298,44.441,60,0
    .goto 1426,27.876,45.549,60,0
    .goto 1426,26.294,46.484,60,0
    .goto 1426,27.562,47.657,60,0
    .goto 1426,28.020,48.267,60,0
    .goto 1426,27.874,49.402,60,0
    .goto 1426,29.443,50.102,60,0
    .goto 1426,28.412,52.449,60,0
    .goto 1426,27.650,53.709,60,0
    .goto 1426,26.769,55.778,60,0
    .goto 1426,29.294,54.249,60,0
    .goto 1426,31.767,49.790,60,0
    .goto 1426,33.832,48.153,60,0
    .goto 1426,31.691,46.837,60,0
    .xp 7+4360 >>刷怪至 4360+/4500 经验值
    .isQuestTurnedIn 384
step
    #xprate 1.49-1.59
    #loop
    .goto 1426,31.212,39.189,0
    .goto 1426,27.876,45.549,0
    .goto 1426,29.443,50.102,0
    .goto 1426,31.691,46.837,0
    .goto 1426,31.212,39.189,60,0
    .goto 1426,30.049,38.561,60,0
    .goto 1426,29.198,40.458,60,0
    .goto 1426,29.362,42.975,60,0
    .goto 1426,28.298,44.441,60,0
    .goto 1426,27.876,45.549,60,0
    .goto 1426,26.294,46.484,60,0
    .goto 1426,27.562,47.657,60,0
    .goto 1426,28.020,48.267,60,0
    .goto 1426,27.874,49.402,60,0
    .goto 1426,29.443,50.102,60,0
    .goto 1426,28.412,52.449,60,0
    .goto 1426,27.650,53.709,60,0
    .goto 1426,26.769,55.778,60,0
    .goto 1426,29.294,54.249,60,0
    .goto 1426,31.767,49.790,60,0
    .goto 1426,33.832,48.153,60,0
    .goto 1426,31.691,46.837,60,0
    .xp 7+4290 >>刷怪至 4290+/4500 经验值
    .isQuestTurnedIn 384
step << Rogue/Hunter
    #xprate >1.59
    #loop
    .goto 1426,31.212,39.189,0
    .goto 1426,27.876,45.549,0
    .goto 1426,29.443,50.102,0
    .goto 1426,31.691,46.837,0
    .goto 1426,31.212,39.189,60,0
    .goto 1426,30.049,38.561,60,0
    .goto 1426,29.198,40.458,60,0
    .goto 1426,29.362,42.975,60,0
    .goto 1426,28.298,44.441,60,0
    .goto 1426,27.876,45.549,60,0
    .goto 1426,26.294,46.484,60,0
    .goto 1426,27.562,47.657,60,0
    .goto 1426,28.020,48.267,60,0
    .goto 1426,27.874,49.402,60,0
    .goto 1426,29.443,50.102,60,0
    .goto 1426,28.412,52.449,60,0
    .goto 1426,27.650,53.709,60,0
    .goto 1426,26.769,55.778,60,0
    .goto 1426,29.294,54.249,60,0
    .goto 1426,31.767,49.790,60,0
    .goto 1426,33.832,48.153,60,0
    .goto 1426,31.691,46.837,60,0
    .xp 10 >> 刷怪至10级
    .isQuestTurnedIn 384
step
    #softcore
    #label WetlandsDS1
    #completewith next
    .goto 1426,30.741,34.269,15,0
    .goto 1426,30.812,33.548,15,0
    .goto 1426,31.060,32.543,15,0
    .goto 1426,31.439,32.356,15,0
    .goto 1426,31.675,29.636,15,0
    .goto 1426,32.209,28.777,15,0
    .goto 1426,32.645,27.740,15,0
    .goto 1415,44.910,52.022,15,0
    .goto 1415,44.910,52.030
    >>|cRXP_WARN_完成丹莫罗至湿地的死亡跳过路线，密切跟随箭头指示|r
    >>|cRXP_WARN_暂时不要从任何高处跳下|r
    .zone Wetlands >>|cRXP_WARN_爬上山，然后向下走过锯齿状地形，直到你的子区域变成湿地|r
    .isQuestAvailable 983
step
    #softcore
    #requires WetlandsDS1
    #label WetlandsDS2
    .goto 1415,44.733,51.882,-1
    .goto 1437,11.730,43.304,-1
    >>|cRXP_WARN_朝向北或西北方向跳下山坡|r
    .deathskip >> 在巴拉丁海湾死回墓地, 在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .isQuestAvailable 983
    .target 灵魂医者
step
    #softcore
    #optional
    #requires WetlandsDS2
    #completewith next
    .goto Wetlands,11.95,50.24,60 >> 朝米奈希尔港方向游向岸边
    .subzoneskip 150
step
    #softcore
    .goto Wetlands,9.490,59.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r 交谈
    .fp Wetlands >> 获取湿地飞行点
    .target 谢尔雷·布隆迪尔
step
    #softcore
	#completewith Distracting
    .hs >> 炉石回卡拉诺斯
    .subzoneskip 131
step
    #optional
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买一杯|r |T132800:0|t[狂想麦酒]|cRXP_BUY_和一杯|r |T132800:0|t[雷霆麦酒]|cRXP_BUY_，出售者为他|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .collect 2686,1,311 --Collect Thunder Ale (x1)
    .target 旅店老板贝尔姆
    .isQuestAvailable 384
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买一杯|r |T132800:0|t[雷霆麦酒]|cRXP_BUY_，出售者为他|r
    .collect 2686,1,311 --Collect Thunder Ale (x1)
    .target 旅店老板贝尔姆
    .isQuestTurnedIn 384
step
    #label Distracting
    #completewith next
    .goto Dun Morogh,47.779,52.426,6,0
    .goto Dun Morogh,47.644,52.655,3,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话楼下的 |cRXP_FRIENDLY_加文·雷酒|r
    .accept 308 >> 接任务：加文的爱好
    .turnin 308 >> 交任务: 加文的爱好
    .target 加文·雷酒
step
    .goto Dun Morogh,47.716,52.696
    >>点击 |cRXP_PICK_无人守卫的雷酒桶|r
    .turnin 310 >> 交任务: 针锋相对
    .accept 311 >> 接任务: 向马莱斯回报
step
    .goto Dun Morogh,46.825,52.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋外的 |cRXP_FRIENDLY_拉格纳·雷酒|r 交谈
    .turnin 384 >> 交任务: 啤酒烤猪排
    .target 拉格纳·雷酒
step << Hunter
    #xprate <1.59
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格瑞夫|r
    .trainer >> 学习职业技能
    .target 格瑞夫
step << Hunter
    #xprate >1.59
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格瑞夫|r
    .trainer >> 学习职业技能
    .accept 6064 >>接任务: 驯服野兽 << Dwarf
    .target 格瑞夫
step << Dwarf Hunter
    #xprate >1.59
    .goto Dun Morogh,48.3,56.9
    >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_驯服|r|cRXP_ENEMY_大峭壁野猪|r
    .complete 6064,1 --Tame a Large Crag Boar (1)
    .mob 大峭壁野猪
step << Dwarf Hunter
    #xprate >1.59
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6064 >>交任务 驯服野兽
    .accept 6084 >>接受任务 驯服野兽
    .target 格瑞夫
step << Dwarf Hunter
    #xprate >1.59
    .goto Dun Morogh,49.4,59.4
    >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_驯服|r|cRXP_ENEMY_雪豹|r
    .complete 6084,1 --Tame a Snow Leopard (1)
    .mob 雪豹
step << Dwarf Hunter
    #xprate >1.59
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6084 >>交任务 驯服野兽
    .accept 6085 >>接受任务 驯服野兽
    .target 格瑞夫
step << Dwarf Hunter
    #xprate >1.59
    .goto Dun Morogh,50.4,59.7
    >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_驯服|r|cRXP_ENEMY_冰爪熊|r
    .complete 6085,1 --Tame an Ice Claw Bear (1)
    .mob 冰爪熊
step << Dwarf Hunter
    #xprate >1.59
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6085 >>交任务 驯服野兽
    .accept 6086 >>接受任务 训练野兽
    .target 格瑞夫
step << Dwarf Hunter
    #xprate >1.59
    #optional
    .goto Dun Morogh,50.4,59.7
    >>|cRXP_WARN_驯兽棒控制的野兽只是临时宠物。若还没有长期宠物，先放弃临时宠物，再用法术书中的|r |T132164:0|t[驯服野兽] |cRXP_WARN_驯服一只|cRXP_ENEMY_冰爪熊|r；已有长期宠物可跳过此步|r
    .tame 1196 >> 驯服一只长期宠物
    .target 冰爪熊
    .train 1515,3
step << Warlock
    .goto Dun Morogh,47.327,53.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吉姆瑞兹·黑轮|r 交谈
    .trainer >> 学习职业技能
    .target 吉姆瑞兹·黑轮
step << Warlock
    .goto Dun Morogh,47.273,53.658
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹尼·血泡|r 交谈
    .vendor 6328 >> |cRXP_BUY_购买|r |T133738:0|t[魔典：火焰箭（等级 2）] |cRXP_BUY_，前提是你买得起；否则可以稍后再买。|r
    .target 丹尼·血泡
    .money <0.100
step << Rogue
    #xprate >1.59
    .goto Dun Morogh,47.563,52.608
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的后房的 |cRXP_FRIENDLY_霍格拉尔·巴坎|r 交谈
    >>|cRXP_WARN_只学习|r |T132147:0|t[双武器] |cRXP_WARN_和|r |T132307:0|t[疾跑]|cRXP_WARN_，不要学习其他技能，把金币留待后用|r
    .train 674 >> 学习 |T132147:0|t[双武器]
    .train 2983 >> 学习 |T132307:0|t[疾跑]
    .accept 2218 >> 接任务: 救赎之路
    .target 霍格拉尔·巴坎
step << Rogue
    #xprate <1.59
    .goto Dun Morogh,47.563,52.608
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的后房的 |cRXP_FRIENDLY_霍格拉尔·巴坎|r 交谈
    .trainer >> 学习职业技能
    .target 霍格拉尔·巴坎
step << Paladin
    .goto Dun Morogh,47.597,52.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内楼上的 |cRXP_FRIENDLY_阿扎尔·战锤|r 交谈
    .trainer >> 学习职业技能
    .target 阿扎尔·战锤
step << Warrior
    .goto Dun Morogh,47.360,52.646
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_格兰尼斯·快斧|r 交谈
    .trainer >> 学习职业技能
    .target 格兰尼斯·快斧
step << Mage
    .goto Dun Morogh,47.498,52.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内楼上的 |cRXP_FRIENDLY_玛济斯·石衣|r 交谈
    .train 118 >> 学习 |T136071:0|t[变形术]
    .target 玛济斯·石衣
step << Priest
    .goto Dun Morogh,47.342,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_马克萨恩·安沃尔|r 交谈
    .trainer >> 学习职业技能
    .target 马克萨恩·安沃尔
step << Warrior/Rogue/Paladin
    .goto Dun Morogh,47.180,52.610
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨姆诺·普尔|r 交谈
    .train 3273 >> 学习 |T135966:0|t[急救]
    .target 萨姆诺·普尔
    .money <0.01
step << Gnome Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r |T135321:0|t[步兵剑]
    .target 格劳恩·索姆温
    .money <0.0536
    .goto Dun Morogh,45.290,52.190
    .collect 2488,1 --Collect Gladius (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Gnome Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
step << Dwarf Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r |T132401:0|t[双刃战斧]
    .target 格劳恩·索姆温
    .money <0.0460
    .goto Dun Morogh,45.290,52.190
    .collect 2491,1 --Collect Large Axe (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.30
step << Dwarf Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.29
step << Rogue
    #xprate <1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r |T135641:0|t[卷刃的剑]
    .target 格劳恩·索姆温
    .money <0.0401
    .goto Dun Morogh,45.290,52.190
    .collect 2494,1 --Collect Stiletto (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #xprate <1.59
    #completewith next
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r |T133053:0|t[木槌棒]
    .target 格劳恩·索姆温
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.00
step << Paladin
    #completewith next
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.99
step << Warrior/Rogue/Paladin
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .vendor 1247 >> |cRXP_BUY_购买最多15个|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_，前提是你买得起。|r << Warrior/Rogue
    .vendor 1247 >> |cRXP_BUY_购买5个|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_，前提是你买得起。|r << Paladin
    .money <0.0125 << Paladin
    .target 旅店老板贝尔姆
step << Priest/Mage/Warlock
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .vendor 1247 >> |cRXP_BUY_购买最多20个|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_，前提是你买得起。|r
    .target 旅店老板贝尔姆
step
    .goto Dun Morogh,46.726,53.826
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_森内尔·白须|r 交谈
    .accept 287 >> 接任务: 霜鬃巨魔要塞
    .target 森内尔·白须
step << !Rogue !Warrior !Paladin
    #xprate <1.5
    .goto Dun Morogh,49.622,48.612
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员迪恩·石轮|r 交谈
    .turnin 313 >> 交任务: 灰色洞穴
    .target 驾驶员迪恩·石轮
step
    #xprate <1.49 << Rogue
    .goto Dun Morogh,49.426,48.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 交谈
    >>|cRXP_WARN_选择|r |T135637:0|t[露营小刀]|cRXP_WARN_，留到以后再用|r << Rogue
    .turnin 320 >> 交任务: 艾沃沙酒 << !Rogue
    .turnin 320,3 >> 交任务: 艾沃沙酒 << Rogue
    .target 驾驶员贝隆·风箱
step << Rogue
    #xprate >1.49
    .goto Dun Morogh,49.426,48.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 交谈
    >>|cRXP_WARN_选择奖励：|r |T135637:0|t[露营小刀]
    .turnin 320,3 >> 交任务: 艾沃沙酒
    .target 驾驶员贝隆·风箱
step << Rogue
    #xprate >1.49
    #completewith ShimmerweedCollect
    +|cRXP_WARN_将|r |T135637:0|t[露营小刀]|cRXP_WARN_装备到副手|r
    .use 10547
    .itemcount 10547,1
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.2
step << Gnome Rogue/Dwarf Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1426,47.861,41.827,30,0
    .goto 1426,51.373,39.595,30,0
    .goto 1426,52.013,36.589,30,0
    .goto 1455,18.428,82.995,60 >>前往铁炉堡
    .zoneskip Ironforge
step << Gnome Rogue/Dwarf Rogue
    #xprate >1.59
    #completewith next
    #label EnterIFRogue
    .goto 1455,18.428,82.995
    .zone Ironforge >>进入铁炉堡
step << Gnome Rogue/Dwarf Rogue
    #xprate >1.59
    #optional
    #completewith next
    #requires EnterIFRogue
    .goto 1455,22.283,79.620,30,0
    .goto 1455,27.315,82.828,30,0
    .goto 1455,38.913,71.447,30,0
    .goto 1455,46.624,53.683,30,0
    .goto 1455,60.781,25.800,30,0
    .goto 1455,59.236,14.974,30,0
    .goto 1455,52.941,12.466,12,0
    .goto 1455,51.919,14.468,12,0
    .goto 1455,51.438,16.000,10 >>前往屋内楼下的 |cRXP_FRIENDLY_霍夫丹·黑须|r 处
step << Gnome Rogue/Dwarf Rogue
    #xprate >1.59
    .goto Ironforge,51.958,14.838
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话楼下的 |cRXP_FRIENDLY_霍夫丹·黑须|r
    .turnin 2218 >> 交任务: 救赎之路
    .accept 2238 >> 接任务: 国王的财宝
    .target 霍夫丹·黑须
step
    #xprate <1.5
    .goto Dun Morogh,46.005,48.637,10,0
    .goto Dun Morogh,45.846,49.365
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_拉兹·滑链|r 交谈
    .accept 412 >> 接任务: 自动净化装置
    .target 拉兹·滑链
step
    #completewith ShimmerweedCollect
    #optional
    #label RidgeRamp
    .goto 1426,42.935,45.216,20,0
    .goto 1426,42.254,45.301,15 >> 沿着坡道前往闪光岭
step
    #optional
    #requires RidgeRamp
    #completewith ShimmerweedCollect
    >>击杀|cRXP_ENEMY_霜鬃猎头者|r
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob 霜鬃猎头者
step
    #label ShimmerweedCollect
    .goto Dun Morogh,40.9,45.3,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,42.1,34.3,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,40.9,45.3
    .goto Dun Morogh,39.5,43.0,0
    .goto Dun Morogh,41.5,36.0,0
    >>击杀|cRXP_ENEMY_霜鬃先知|r，拾取|cRXP_LOOT_微光草|r
    >>打开地面上的|cRXP_PICK_微光草篮|r，拾取|cRXP_LOOT_微光草|r
    .complete 315,1 --Collect Shimmerweed (x6)
    .mob 霜鬃先知
step << Priest
    #season 2
    .goto Dun Morogh,40.9,45.3,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,42.1,34.3,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,40.9,45.3
    .goto Dun Morogh,39.5,43.0,0
    .goto Dun Morogh,41.5,36.0,0
    >>击杀|cRXP_ENEMY_霜鬃先知|r，拾取 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob 霜鬃先知
    .train 402852,1
step << Priest
    #optional
    #sticky
    #completewith DRT
    #season 2
    .train 402852 >> |cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] |cRXP_WARN_来学习|r |T237570:0|t[裂魂魔]
    >>先在本族的圣地输入 /kneel 获得一种冥想增益（暗夜精灵在月亮井旁，人类或矮人在圣光圣地），再在拥有另一种增益的牧师面前跪下，请他以你为目标输入 /pray 分享增益
    >>拥有两种冥想增益后再使用预言；只有一种时可先继续路线
    .use 205947
    .itemcount 205947,1
    .aura -410935
    .aura -419307
    .train 402852,1
step << Mage
    #season 2
    .goto Dun Morogh,40.9,45.3,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,42.1,34.3,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,40.9,45.3
    .goto Dun Morogh,39.5,43.0,0
    .goto Dun Morogh,41.5,36.0,0
    >>击杀|cRXP_ENEMY_霜鬃先知|r，拾取 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN]|r
    .collect 203752,1
    .mob 霜鬃先知
    .train 401768,1
step << Mage
    #optional
    #season 2
    #completewith DRT
    .collect 211779,1 >>若已有理解魔符，现在可解读笔记；否则继续路线，稍后在铁炉堡向施法材料商购买。
    .train 401768 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN]|r |cRXP_WARN_学习|r |T135820:0|t[活体烈焰]
    .use 203752
    .itemcount 203752,1
    .train 401768,1
step << Rogue
    #season 2
    .goto Dun Morogh,25.4,50.8
    >>|T133644:0|t[搜索]|cRXP_ENEMY_霜鬃巨魔|r，拾取 |T134327:0|t[|cRXP_LOOT_右上角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 208213,1 -- Top-Right Map Piece (1)
    .mob 霜鬃先知
    .mob 霜鬃猎头者
    .mob 霜鬃雪行者
    .train 398196,1
step << Warrior
    #season 2
    >>击杀|cRXP_ENEMY_霜鬃巨魔|r，拾取|cRXP_LOOT_被砍下的巨魔的头|r
    .collect 208159,1 -- Severed Troll Head (1)
    .goto Dun Morogh,41.6,43.8,60,0
    .goto Dun Morogh,42.2,35.0
    .mob 霜鬃猎头者
    .mob 霜鬃雪行者
    .mob 霜鬃先知
    .train 403475,1
step << Hunter
    #season 2
    #requires pigmeat
    .train 425762,1
    .goto Dun Morogh,37.78,42.55
    >>在洞穴内的尸体附近使用 |T134026:0|t[丹莫罗猪肉]召唤|cRXP_ENEMY_乔鲁尔|r
    >>击杀|cRXP_ENEMY_乔鲁尔|r，拾取 |T134419:0|t|cRXP_LOOT_[侧翼符文]|r
    .collect 205979,1
    .use 208192
    .mob 乔鲁尔
step << Hunter
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[侧翼符文]|r|cRXP_WARN_学习|r |T132175:0|t[侧翼打击]
    .use 205979
    .itemcount 205979,1
step << !Mage !Warlock
    #season 0,1 << Hunter/Rogue
    #xprate <1.59 << Hunter/Rogue
    .goto Dun Morogh,38.517,53.927
    >>打开 |cRXP_PICK_马克格拉恩的储肉柜|r，拾取 |cRXP_LOOT_马克格拉恩的干肉|r
    >>|cRXP_WARN_等待 |cRXP_ENEMY_冰须|r 巡逻到洞穴外；它离开后即可进入并搜刮|r |cRXP_PICK_马克格拉恩的储肉柜|r
    .link https://www.youtube.com/watch?v=o55Y3LjgKoE >> |cRXP_WARN_点击这里查看视频参考|r
    .complete 312,1 --MacGrann's Dried Meats (1)
step << Mage/Warlock
    .goto Dun Morogh,38.517,53.927
    >>|cRXP_WARN_施放|r |T136071:0|t[变形术]|cRXP_WARN_控制|r|cRXP_ENEMY_冰须|r << Mage
    >>|cRXP_WARN_施放|r |T136183:0|t[恐惧术]|cRXP_WARN_控制|r|cRXP_ENEMY_冰须|r << Warlock
    >>打开|cRXP_PICK_马克格拉恩的储肉柜|r，拾取|cRXP_LOOT_马克格拉恩的干肉|r
    .complete 312,1 --Collect MacGrann's Dried Meats (x1)
step
    #season 0,1 << Hunter/Rogue
    #xprate <1.59 << Hunter/Rogue
    .goto Dun Morogh,34.577,51.652
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图德拉·马克格拉恩|r 交谈
    .turnin 312 >> 交任务: 马克格拉恩的干肉
    .target 图德拉·马克格拉恩
step << Mage/Priest/Warlock
    #completewith next
    .goto Dun Morogh,30.453,46.005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_基格·吉布恩|r
    .vendor >> |cRXP_BUY_从他那里再购买最多10个|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r
    .target 基格·吉布恩
step << Warrior/Paladin/Rogue
    #completewith next
    .goto Dun Morogh,30.453,46.005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_基格·吉布恩|r
    .vendor >> 卖掉杂物
    .target 基格·吉布恩
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷杰德·麦酒|r 和 |cRXP_FRIENDLY_马莱斯·麦酒|r
    .turnin 315 >> 交任务: 完美烈酒
    .accept 413 >> 接任务: 微光酒
    .goto Dun Morogh,30.189,45.725
    .target +雷杰德·麦酒
    .turnin 311 >> 交任务: 向马莱斯回报
    .goto Dun Morogh,30.186,45.531
    .target +马莱斯·麦酒
step << Rogue
    #season 2
    #completewith next
    >>|T133644:0|t[搜索]|cRXP_ENEMY_麻风侏儒|r，拾取 |T134269:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 208218,1 -- Bottom-Right Map Piece (1)
    .mob 麻风侏儒
    .train 398196,1
step << Priest
    #season 2
    >>击杀|cRXP_ENEMY_麻风侏儒|r，拾取 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .mob 麻风侏儒
    .train 425216,1
step << Dwarf Rogue/Gnome Rogue
    #xprate >1.59
    .goto Dun Morogh,25.164,44.460
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与飞行器停靠点上方的 |cRXP_FRIENDLY_奥宁·雨锤|r 交谈
    >>|cRXP_WARN_他|r |T132320:0|t[潜行中]
    .turnin 2238 >> 交任务: 国王的财宝
    .accept 2239 >> 接任务: 奥宁的报告
    .target 奥宁·雨锤
step
    #xprate <1.5
    #loop
    .goto 1426,26.653,43.844,0
    .goto 1426,24.601,40.790,0
    .goto 1426,25.540,45.374,0
    .goto 1426,26.653,43.844,55,0
    .goto 1426,26.587,42.702,55,0
    .goto 1426,26.175,41.822,55,0
    .goto 1426,26.052,40.769,55,0
    .goto 1426,24.739,39.481,55,0
    .goto 1426,24.601,40.790,55,0
    .goto 1426,24.662,41.770,55,0
    .goto 1426,24.487,43.265,55,0
    .goto 1426,24.805,43.848,55,0
    .goto 1426,24.871,44.693,55,0
    .goto 1426,25.540,45.374,55,0
    .goto 1426,25.950,43.930,55,0
    >>击杀|cRXP_ENEMY_麻风侏儒|r，拾取|cRXP_LOOT_多档齿轮|r和|cRXP_LOOT_自适应齿轮|r
    .complete 412,2 --Collect Gyromechanic Gear (x8)
    .complete 412,1 --Collect Restabilization Cog (x8)
    .mob 麻风侏儒
step << Priest
    #season 2
    #loop
    .goto 1426,26.653,43.844,0
    .goto 1426,24.601,40.790,0
    .goto 1426,25.540,45.374,0
    .goto 1426,26.653,43.844,55,0
    .goto 1426,26.587,42.702,55,0
    .goto 1426,26.175,41.822,55,0
    .goto 1426,26.052,40.769,55,0
    .goto 1426,24.739,39.481,55,0
    .goto 1426,24.601,40.790,55,0
    .goto 1426,24.662,41.770,55,0
    .goto 1426,24.487,43.265,55,0
    .goto 1426,24.805,43.848,55,0
    .goto 1426,24.871,44.693,55,0
    .goto 1426,25.540,45.374,55,0
    .goto 1426,25.950,43.930,55,0
    >>击杀|cRXP_ENEMY_麻风侏儒|r，拾取 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .mob 麻风侏儒
    .train 425216,1
step << Priest
    #season 2
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]|cRXP_WARN_学习|r |T237514:0|t[虚空疫病]
    >>|cRXP_WARN_学习回忆前需先获得一种|r |T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_增益：暗夜精灵在月亮井旁输入 /kneel；人类或矮人在北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛、铁炉堡秘法区等圣光圣地输入 /kneel。也可请已有增益的牧师传授|r
    .use 205940
step << Rogue
    #season 2
    #loop
    .goto 1426,26.653,43.844,0
    .goto 1426,24.601,40.790,0
    .goto 1426,25.540,45.374,0
    .goto 1426,26.653,43.844,55,0
    .goto 1426,26.587,42.702,55,0
    .goto 1426,26.175,41.822,55,0
    .goto 1426,26.052,40.769,55,0
    .goto 1426,24.739,39.481,55,0
    .goto 1426,24.601,40.790,55,0
    .goto 1426,24.662,41.770,55,0
    .goto 1426,24.487,43.265,55,0
    .goto 1426,24.805,43.848,55,0
    .goto 1426,24.871,44.693,55,0
    .goto 1426,25.540,45.374,55,0
    .goto 1426,25.950,43.930,55,0
    >>|T133644:0|t[搜索]|cRXP_ENEMY_麻风侏儒|r，拾取 |T134269:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 208218,1 -- Bottom-Right Map Piece (1)
    .mob 麻风侏儒
    .train 398196,1
step
    #sticky
    #label Headhunters
    #loop
    .goto 1426,22.390,51.701,0
    .goto 1426,23.136,50.886,0
    .goto 1426,24.301,50.898,0
    .waypoint 1426,22.390,51.701,30,0
    .waypoint 1426,21.113,51.717,30,0
    .waypoint 1426,21.131,51.024,30,0
    .waypoint 1426,22.067,50.215,30,0
    .waypoint 1426,23.136,50.886,30,0
    .waypoint 1426,23.373,51.385,30,0
    .waypoint 1426,23.568,50.924,30,0
    .waypoint 1426,24.301,50.898,30,0
    >>击杀洞穴内的|cRXP_ENEMY_霜鬃猎头者|r
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob 霜鬃猎头者
step
    #optional
    .goto 1426,24.975,50.473,20,0
    .goto 1426,24.682,50.836,20 >> 沿洞穴入口侧边跑上去，再向下跳进霜鬃巨魔要塞
    .isOnQuest 287
step << Hunter
    #xprate 1.49-1.59
    #loop
    .goto 1426,22.390,51.701,0
    .goto 1426,23.136,50.886,0
    .goto 1426,24.301,50.898,0
    .goto 1426,22.390,51.701,30,0
    .goto 1426,21.113,51.717,30,0
    .goto 1426,21.131,51.024,30,0
    .goto 1426,22.067,50.215,30,0
    .goto 1426,23.136,50.886,30,0
    .goto 1426,23.373,51.385,30,0
    .goto 1426,23.568,50.924,30,0
    .goto 1426,24.301,50.898,30,0
    .xp 9+4280 >> 刷怪至 4280+/6500 经验值
step
    #hardcore
    #requires Headhunters
    .goto Dun Morogh,22.86,52.16
    >>|cRXP_WARN_如果洞穴尽头的死胡同小房间里只有一只 |cRXP_ENEMY_霜鬃暗法师|r，就向下跳入该房间|r
    >>|cRXP_WARN_注意 |cRXP_ENEMY_霜鬃长老|r（稀有）可能巡逻到这个角落。如果他刷新了，就等他过来后再巡逻离开，或者一路小心战斗进入这个角落|r
    >>|cRXP_WARN_或者，走下到岩架上，再沿岩架稍微向下走，直到获得任务进度|r
    >>|cRXP_WARN_小心，如果 |cRXP_ENEMY_霜鬃剥皮者|r 在你走上或跳上岩架时位置不对，它可能会从下方击杀你|r
    .link https://youtu.be/70PX093soq4?si=YcTdPoKW-EplWQAn&t=3019 >> 点击这里查看参考
    .complete 287,2 --Fully explore Frostmane Hold
step
    #softcore
    #requires Headhunters
    .goto Dun Morogh,22.86,52.16
    >>|cRXP_WARN_跳下去，进洞里那个小死胡同房间|r
    >>|cRXP_WARN_不用担心会死，反正你马上就会通过死亡跳点返回卡拉诺斯|r
    .complete 287,2 --Fully explore Frostmane Hold
step
    #softcore
    #optional
    #completewith next
    .deathskip >> 死亡后在灵魂医者处复活
    .target 灵魂医者
step
    #hardcore
	#completewith next
	.hs >> 炉石回卡拉诺斯
step
    .goto Dun Morogh,46.726,53.826
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_森内尔·白须|r 交谈
    .turnin 287 >> 交任务: 霜鬃巨魔要塞
    .accept 291 >> 接任务: 森内尔的报告
    .target 森内尔·白须
step << Hunter
    #xprate 1.49-1.59
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .accept 6064 >>接受任务 驯服野兽
    .target 格瑞夫
step << Hunter
    #xprate 1.49-1.59
    .goto Dun Morogh,48.3,56.9
    >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_驯服|r|cRXP_ENEMY_大峭壁野猪|r
    .complete 6064,1 --Tame a Large Crag Boar (1)
    .mob 大峭壁野猪
step << Hunter
    #xprate 1.49-1.59
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6064 >>交任务 驯服野兽
    .accept 6084 >>接受任务 驯服野兽
    .target 格瑞夫
step << Hunter
    #xprate 1.49-1.59
    .goto Dun Morogh,49.4,59.4
    >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_驯服|r|cRXP_ENEMY_雪豹|r
    .complete 6084,1 --Tame a Snow Leopard (1)
    .mob 雪豹
step << Hunter
    #xprate 1.49-1.59
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6084 >>交任务 驯服野兽
    .accept 6085 >>接受任务 驯服野兽
    .target 格瑞夫
step << Hunter
    #xprate 1.49-1.59
    .goto Dun Morogh,50.4,59.7
    >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_驯服|r|cRXP_ENEMY_冰爪熊|r
    .complete 6085,1 --Tame an Ice Claw Bear (1)
    .mob 冰爪熊
step << Hunter
    #xprate 1.49-1.59
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6085 >>交任务 驯服野兽
    .accept 6086 >>接受任务 训练野兽
    .target 格瑞夫
step << Dwarf Hunter
    #xprate 1.49-1.59
    #optional
    .goto Dun Morogh,50.4,59.7
    >>|cRXP_WARN_驯兽棒控制的野兽只是临时宠物。若还没有长期宠物，先放弃临时宠物，再用法术书中的|r |T132164:0|t[驯服野兽] |cRXP_WARN_驯服一只|cRXP_ENEMY_冰爪熊|r；已有长期宠物可跳过此步|r
    .tame 1196 >> 驯服一只长期宠物
    .target 冰爪熊
    .train 1515,3
step << Rogue
    #xprate <1.59
    .goto Dun Morogh,47.563,52.608
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的后房的 |cRXP_FRIENDLY_霍格拉尔·巴坎|r 交谈
    .accept 2218 >> 接任务: 救赎之路
    .target 霍格拉尔·巴坎
    .xp <10,1
step << !Warrior !Rogue !Paladin
    .goto Dun Morogh,47.180,52.610
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨姆诺·普尔|r 交谈
    .train 3273 >> 学习 |T135966:0|t[急救]
    .target 萨姆诺·普尔
step
    #xprate <1.5
    .goto Dun Morogh,46.005,48.637,8,0
    .goto Dun Morogh,45.846,49.365
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_拉兹·滑链|r 交谈
    .turnin 412 >> 交任务: 自动净化装置
    .target 拉兹·滑链
step << Warrior
    #optional
    #completewith next
    +|cRXP_WARN_刷怪直到有价值 10 银 30 铜的可出售物品|r
    .money >0.1030
step << Warrior
    .goto Dun Morogh,47.58,41.58,40,0
    .goto Dun Morogh,50.19,40.79,20,0
    .goto Ironforge,14.90,87.10,40 >> 前往铁炉堡
step << Warrior
    .goto Ironforge,62.237,89.628
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比克斯|r 或 |cRXP_FRIENDLY_布里维夫·石手|r 对话
    .trainer >> 如果你已组队或有人能帮助你立即击杀 |cRXP_ENEMY_瓦加什|r，就向 |cRXP_FRIENDLY_布里维夫·石手|r 学习双手锤（2h）；否则向 |cRXP_FRIENDLY_比克斯|r 学习投掷武器。如果不确定，就学习投掷武器
    .target 比克斯
    .target 布里维夫·石手
step << Warrior
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]|cRXP_BUY_，向她购买即可|r
    .collect 3107,200 << !tbc
    .collect 25873,1 << tbc
    .target 布雷文·寒钢
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Warrior
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r |T135641:0|t[平衡飞刀]|cRXP_BUY_，向她购买即可|r
    .collect 2946,200 << !tbc
    .collect 25872,1 << tbc
    .target 布雷文·寒钢
    .xp >11,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #optional
    #completewith Dirt
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]
    .use 3107 << !tbc
    .use 25873 << tbc
    .itemcount 3107,1 << !tbc
    .itemcount 25873,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Warrior
    #optional
    #completewith Dirt
    +|cRXP_WARN_装备|r |T135641:0|t[平衡飞刀]
    .use 2946 << !tbc
    .use 25872 << tbc
    .itemcount 2946,1 << !tbc
    .itemcount 25872,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << skip --logout skip << Warrior
    #optional
    .goto 1455,48.046,83.707
    >>|cRXP_WARN_走到航点箭头上方金属地板的边缘|r
    .zone Dun Morogh >>|cRXP_WARN_调整角色位置直到看起来像在漂浮，然后登出再登入执行登出跳点|r
    .zoneskip Ironforge,1
step
    #optional
    #label BoarMeatDunMorogh1
    #completewith Dirt
    .goto 1426,57.936,50.787,0
    >>击杀|cRXP_ENEMY_老峭壁野猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_这些将用于稍后提升|r |T133971:0|t[烹饪]|cRXP_WARN_等级|r
    >>|cRXP_WARN_你后续在奥伯丁的一个任务需要 10 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能等级|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 老峭壁野猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires BoarMeatDunMorogh1
    #completewith Dirt
    .goto 1426,57.936,50.787,0
    >>击杀|cRXP_ENEMY_老峭壁野猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_这些将用于稍后提升|r |T133971:0|t[烹饪]|cRXP_WARN_等级|r
    >>|cRXP_WARN_需要50点|r |T133971:0|t[烹饪]|cRXP_WARN_才能完成后续在夜色镇的一个任务|r
    >>|cRXP_WARN_无需专门刷怪，路过时击杀野猪并拾取掉落即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 老峭壁野猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #completewith Rudra
    #label Dirt
    .goto Dun Morogh,59.84,49.56,40,0
    .goto Dun Morogh,61.36,47.07,40 >>沿土路上行
    .isQuestAvailable 314
step
    #completewith next
    #requires Dirt
    +|cRXP_WARN_将 |cRXP_ENEMY_瓦加什|r 向下风筝至|r |cRXP_FRIENDLY_鲁德拉|r 处
    .link https://youtu.be/70PX093soq4?si=-cIoU8WWdbC0IdHZ&t=3193 >>|cRXP_WARN_如果你在当前步骤遇到困难, 请点击此处查看详细说明|r << Mage
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >> |cRXP_WARN_点击这里查看视频参考|r << !Mage
    .mob 瓦加什
step
    #label Rudra
    .goto Dun Morogh,63.082,49.851
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁德拉·冻石|r 对话
    .accept 314 >> 接任务: 保护牲畜
    .target 鲁德拉·冻石
step << Warrior/Mage
    #season 2
    #sticky
    #optional
    #label rune1
    >>击杀|cRXP_ENEMY_瓦加什|r，拾取 |T134419:0|t|cRXP_LOOT_[狂怒雷霆符文]|r << Warrior
    >>击杀|cRXP_ENEMY_瓦加什|r，拾取 |T134939:0|t|cRXP_LOOT_[法术笔记：IGBHNHZNAI]|r << Mage
    .collect 204809,1 << Warrior -- Rune of Furious Thunder (1)
    .collect 203753,1 << Mage -- Spell Notes: RING SEFF OSTROF (1)
    .train 403476,1 << Warrior
    .train 401765,1 << Mage
step
    .goto 1426,62.094,47.154,40,0
    .goto 1426,62.434,48.989,40,0
    .goto 1426,62.538,46.195
    >>击杀 |cRXP_ENEMY_瓦加什|r，拾取 |cRXP_LOOT_瓦加什的牙齿|r
    >>|cRXP_WARN_将他风筝至牧场南边的守卫处，确保对他造成至少51%的伤害|r
    >>|cRXP_WARN_尝试击杀 |cRXP_ENEMY_瓦加什|r 前请先观看下方视频, 任何职业均可单刷|r
    .link https://youtu.be/70PX093soq4?si=-cIoU8WWdbC0IdHZ&t=3193 >> |cRXP_WARN_点击这里查看视频参考|r << Mage
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >> |cRXP_WARN_点击这里查看视频参考|r << !Mage
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob 瓦加什
step << Warrior
    #season 2
    #optional
    #requires rune1
    .train 403476 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[狂怒雷霆符文]|r|cRXP_WARN_学习|r |T136048:0|t[狂怒雷霆]
    .use 204809
    .itemcount 204809,1
step << Mage
    #optional
    #season 2
    #requires rune1
    #completewith QuarryStart
    .collect 211779,1 >>若已有理解魔符，现在可解读笔记；否则继续路线，稍后在铁炉堡向施法材料商购买。
    .disablecheckbox
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_LOOT_[法术笔记：IGBHNHZNAI]|r |cRXP_WARN_学习|r |T236227:0|t[寒冰指]
    .use 203753
    .itemcount 203753,1
    .train 401765,1
step
    .goto Dun Morogh,63.082,49.851
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁德拉·冻石|r 对话
    .turnin 314 >> 交任务: 保护牲畜
    .target 鲁德拉·冻石
step
    #optional
    #label BoarMeatDunMorogh2
    #completewith QuarryStart
    .goto 1426,66.356,51.02,0
    >>击杀|cRXP_ENEMY_大峭壁野猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 大峭壁野猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 134 --Gol'Bolar Quarry
step
    #optional
    #requires BoarMeatDunMorogh2
    #completewith QuarryStart
    .goto 1426,66.356,51.02,0
    >>击杀|cRXP_ENEMY_大峭壁野猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_无需专门刷怪，路过时击杀野猪并拾取掉落即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 大峭壁野猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 134 --Gol'Bolar Quarry
step
    #optional
    #completewith next
    .goto Dun Morogh,68.379,54.492,60 >> 前往古博拉采掘场
    .subzoneskip 134
step
    .goto Dun Morogh,68.379,54.492
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师格瑞姆|r 交谈
    .train 2550 >> 学习 |T133971:0|t[烹饪]
    .target 厨师格瑞姆
step << !Hunter
    #optional
    #completewith next
    .goto Dun Morogh,68.6,54.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡杉·莫格什|r 交谈
    .vendor 1237 >> |cRXP_BUY_最多购买10个|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_，按需向他购买。|r << Warrior/Rogue
    .vendor 1237 >> |cRXP_BUY_最多购买5个|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_和|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_，按需向他购买。|r << !Warrior !Rogue
    .target 卡杉·莫格什
--XX Mud slappers instead
step
    #label QuarryStart
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_参议员梅尔·圣石|r 和 |cRXP_FRIENDLY_工头乔尼·石眉|r
    .accept 433 >> 接任务: 公众之仆
    .target +参议员梅尔·圣石
    .goto Dun Morogh,68.671,55.969
    .accept 432 >> 接任务: 该死的石腭怪！
    .goto Dun Morogh,69.084,56.330
    .target +工头乔尼·石眉
step << Dwarf Paladin
    #xprate >1.49
    #sticky
    #label PalaCloth
    #loop
    .goto 1426,70.073,57.030,0
    .goto 1426,68.533,58.372,0
    .goto 1426,68.958,59.357,0
    .goto 1426,70.750,56.219,0
    .goto 1426,71.344,51.873,0
    .goto 1426,72.570,53.488,0
    .waypoint 1426,70.073,57.030,45,0
    .waypoint 1426,69.223,58.242,45,0
    .waypoint 1426,68.533,58.372,45,0
    .waypoint 1426,67.687,60.059,45,0
    .waypoint 1426,68.958,59.357,45,0
    .waypoint 1426,70.475,59.420,45,0
    >>击杀|cRXP_ENEMY_石腭击颅者|r和|cRXP_ENEMY_石腭断骨者|r，拾取 |T132889:0|t[亚麻布] << Dwarf Paladin
    >>|cRXP_WARN_把|r |T132889:0|t[亚麻布]|cRXP_WARN_留给之后的任务|r << Dwarf Paladin
    .collect 2589,10,1648,1 --Linen Cloth (10)
    .mob 石腭击颅者
    .mob 石腭断骨者
step
    #sticky
    #label Skullthumpers
    #loop
    .goto 1426,70.073,57.030,0
    .goto 1426,68.533,58.372,0
    .goto 1426,68.958,59.357,0
    .waypoint 1426,70.073,57.030,45,0
    .waypoint 1426,69.223,58.242,45,0
    .waypoint 1426,68.533,58.372,45,0
    .waypoint 1426,67.687,60.059,45,0
    .waypoint 1426,68.958,59.357,45,0
    .waypoint 1426,70.475,59.420,45,0
    >>在矿井内外击杀|cRXP_ENEMY_石腭击颅者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob 石腭击颅者
step
    #optional
    #completewith next
    .goto 1426,70.750,56.219,20 >>进入古博拉采掘场矿坑
    .isOnQuest 433
step
    #loop
    .goto 1426,70.750,56.219,0
    .goto 1426,71.344,51.873,0
    .goto 1426,72.570,53.488,0
    .goto 1426,70.750,56.219,30,0
    .goto 1426,70.964,54.538,30,0
    .goto 1426,70.679,53.301,30,0
    .goto 1426,70.461,52.292,30,0
    .goto 1426,71.344,51.873,30,0
    .goto 1426,71.999,50.204,30,0
    .goto 1426,72.456,51.300,30,0
    .goto 1426,72.613,52.509,30,0
    .goto 1426,72.570,53.488,30,0
    .goto 1426,71.790,52.278,30,0
    .goto 1426,71.591,51.831,30,0
    >>击杀矿井内的|cRXP_ENEMY_石腭断骨者|r
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
    .mob 石腭断骨者
step
    #optional
    #label RockjawEnd
    #requires Skullthumpers
--XXREQ Placeholder invis step until multiple requires per step
step
    #requires PalaCloth << Paladin -->1.49 or higher
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_工头乔尼·石眉|r 和 |cRXP_FRIENDLY_参议员梅尔·圣石|r
    .turnin 432 >> 交任务: 该死的石腭怪！
    .target +工头乔尼·石眉
    .goto Dun Morogh,69.084,56.330
    .turnin 433 >> 交任务: 公众之仆
    .goto Dun Morogh,68.671,55.969
    .target +参议员梅尔·圣石
step
    #optional
    #loop
    .goto 1426,70.073,57.030,0
    .goto 1426,68.533,58.372,0
    .goto 1426,68.958,59.357,0
    .goto 1426,70.073,57.030,45,0
    .goto 1426,69.223,58.242,45,0
    .goto 1426,68.533,58.372,45,0
    .goto 1426,67.687,60.059,45,0
    .goto 1426,68.958,59.357,45,0
    .goto 1426,70.475,59.420,45,0
    .xp 10 >> 刷到10级
    .mob 石腭击颅者
step << Rogue
    #season 2
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[搜索]|cRXP_ENEMY_黑铁间谍|r，拾取 |T134331:0|t[黑鼠的笔记]和 |T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 208205,1 --Blackrat's Note (1)
    .collect 208219,1 -- Bottom-Left Map Piece (1)
    .mob 黑铁间谍
    .train 400094,1
    .train 398196,1
step << Rogue
    #season 2
    #optional
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[搜索]|cRXP_ENEMY_黑铁间谍|r，拾取 |T134331:0|t[黑鼠的笔记]
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 208205,1
    .mob 黑铁间谍
    .train 400094,1
step << Rogue
    #season 2
    #optional
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[搜索]|cRXP_ENEMY_黑铁间谍|r，拾取 |T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 208219,1 -- Bottom-Left Map Piece (1)
    .mob 黑铁间谍
    .train 398196,1
step << Rogue
    #season 2
    .cast 418600 >>|cRXP_WARN_使用任意|r |T134327:0|t[|cRXP_LOOT_地图碎片]|r|cRXP_WARN_将它们合成为|r |T134269:0|t[|cRXP_LOOT_丹莫罗藏宝图|r]
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
step << Warrior/Rogue
    #season 2
    #softcore
    #optional
    #completewith next
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
    .train 403475,1 << Warrior
    .train 398196,1 << Rogue
step << Warrior
    #season 2
    .goto Dun Morogh,46.611,53.335
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尼·钢关|r交谈
    >>|cRXP_WARN_上交三件物品后，你将获得|r |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .train 403475 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]|cRXP_WARN_学习|r |T135291:0|t[毁灭打击]
    .use 204703
    .skipgossip
    .target 加尼·钢关
step << Rogue
    #season 2
    #completewith next
    .goto Dun Morogh,46.985,43.632
    .cast 418599 >>|cRXP_WARN_在小桥下方使用|r |T134269:0|t[|cRXP_LOOT_丹莫罗藏宝图|r]|cRXP_WARN_，这会使|cRXP_PICK_埋藏的宝藏|r出现|r
    .use 208220
    .itemcount 208220,1
    .train 398196,1
step << Rogue
    #season 2
    >>打开|cRXP_PICK_埋藏的宝藏|r，拾取其中的 |T134419:0|t[|cRXP_FRIENDLY_速射符文|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
step << Rogue
    #season 2
    .train 400095 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_速射符文|r] |cRXP_WARN_学习|r |T134536:0|t[铭刻胸甲 - 速射]
    .use 203991
    .itemcount 203991,1
step << Rogue
    #season 2
    .goto Dun Morogh,57.256,45.227
    >>与|cRXP_FRIENDLY_黑鼠|r交谈以获得|T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    .collect 203990,1
    .skipgossip
    .train 400094,1
step << Rogue
    #season 2
    .cast 402265 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    .use 203990 -- Rune of Mutilation (1)
    .train 400094,1
step
    #optional
    #label BoarMeatDunMorogh3
    #completewith LochEnter
    .goto 1426,70.845,51.784,0
    .goto 1426,73.533,50.850,0
    .goto 1426,75.353,48.533,0
    .goto 1426,79.881,46.805,0
    .goto 1426,81.040,43.456,0
    .goto 1426,80.583,36.040,0
    >>击杀|cRXP_ENEMY_有伤疤的峭壁野猪|r和|cRXP_ENEMY_老峭壁野猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 有伤疤的峭壁野猪
    .mob 老峭壁野猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires BoarMeatDunMorogh3
    #completewith LochEnter
    .goto 1426,70.845,51.784,0
    .goto 1426,73.533,50.850,0
    .goto 1426,75.353,48.533,0
    .goto 1426,79.881,46.805,0
    .goto 1426,81.040,43.456,0
    .goto 1426,80.583,36.040,0
    >>击杀|cRXP_ENEMY_有伤疤的峭壁野猪|r和|cRXP_ENEMY_老峭壁野猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_无需专门刷怪，路过时击杀野猪并拾取掉落即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 有伤疤的峭壁野猪
    .mob 老峭壁野猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #optional
    #completewith next
    .goto 1426,77.189,48.816,50,0
    .goto 1426,81.252,42.650,50,0
    .goto Dun Morogh,83.892,39.188,20 >> 前往 |cRXP_FRIENDLY_驾驶员塞克·锤足|r
step
    .goto Dun Morogh,83.892,39.188
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员塞克·锤足|r 交谈
    .accept 419 >> 接任务: 失踪的驾驶员
    .target 驾驶员塞克·锤足
step
    .goto Dun Morogh,79.672,36.171
    >>点击地面上的 |cRXP_PICK_矮人的尸体|r
    .turnin 419 >> 交任务: 失踪的驾驶员
    .accept 417 >> 接任务: 驾驶员的复仇
step << Warrior/Mage
    #season 2
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_癞爪|r，拾取 |T134419:0|t|cRXP_LOOT_[狂怒雷霆符文]|r << Warrior
    >>击杀|cRXP_ENEMY_癞爪|r，拾取 |T134939:0|t|cRXP_LOOT_[法术笔记：IGBHNHZNAI]|r << Mage
    .collect 204809,1 << Warrior -- Rune of Furious Thunder (1)
    .collect 203753,1 << Mage -- Spell Notes: RING SEFF OSTROF (1)
    .train 403476,1 << Warrior
    .train 401765,1 << Mage
step
    .goto Dun Morogh,78.97,37.14
    >>击杀|cRXP_ENEMY_癞爪|r，拾取|cRXP_LOOT_肮脏的爪子|r
    .complete 417,1 --Collect Mangy Claw (x1)
    .mob 癞爪
step << Warrior
    #season 2
    .train 403476 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[狂怒雷霆符文]|r|cRXP_WARN_学习|r |T136048:0|t[狂怒雷霆]
    .use 204809
    .itemcount 204809,1
step << Mage
    #optional
    #season 2
    #completewith next
    .collect 211779,1 >>若已有理解魔符，现在可解读笔记；否则继续路线，稍后在铁炉堡向施法材料商购买。
    .disablecheckbox
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_LOOT_[法术笔记：IGBHNHZNAI]|r |cRXP_WARN_学习|r |T236227:0|t[寒冰指]
    .use 203753
    .itemcount 203753,1
    .train 401765,1
step
    #xprate <1.49 << Rogue
    .goto Dun Morogh,83.892,39.188
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员塞克·锤足|r 交谈
    >>|cRXP_WARN_选择|r |T135641:0|t[工匠匕首]|cRXP_WARN_，留到以后再用|r << Rogue
    .turnin 417 >> 交任务: 驾驶员的复仇 << !Rogue
    .turnin 417,1 >> 交任务: 驾驶员的复仇 << Rogue
    .target 驾驶员塞克·锤足
step << Rogue
    #xprate >1.49
    .goto Dun Morogh,83.892,39.188
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员塞克·锤足|r 交谈
    >>|cRXP_WARN_选择|r |T135641:0|t[工匠匕首]
    .turnin 417,1 >> 交任务: 驾驶员的复仇
    .target 驾驶员塞克·锤足
step << Rogue
    #xprate >1.49
    #completewith ShimmerStoutEnd
    +|cRXP_WARN_将|r |T135641:0|t[工匠匕首]|cRXP_WARN_装备到主手|r
    .use 2218
    .itemcount 2218,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step
    #optional
    #completewith next
    .goto 1426,82.988,40.387,40,0
    .goto 1426,81.220,42.798,40,0
    .goto 1426,79.556,50.096,30,0
    .goto Dun Morogh,86.278,48.812,20 >> 前往对话 |cRXP_FRIENDLY_巡山人维拉特·麦酒|r
step
    #label ShimmerStoutEnd
    .goto Dun Morogh,86.278,48.812
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人维拉特·麦酒|r 交谈
    .turnin 413 >> 交任务: 微光酒
    .accept 414 >> 接任务: 卡德雷尔的酒
    .target 巡山人维拉特·麦酒
step
    #optional
    #label LochEnter
    #completewith next
    .goto 1432,16.494,58.424,20,0
    .goto 1432,19.594,62.735,20,0
    .goto 1432,20.749,64.326,20,0
    .goto 1432,21.106,65.007,20,0
    .goto 1432,21.388,66.357,20,0
    .goto 1432,21.498,67.840
    .subzone 924 >> 穿过南门小径, 进入洛克莫丹
step
    .goto Loch Modan,22.071,73.127
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人库伯弗林特|r 交谈
    .accept 224 >> 接任务: 保卫国王的领土
    .target 巡山人库伯弗林特
    .xp >14,1 << !Warrior !Paladin
    .xp >14,1 << Paladin !Dwarf
step
    #optional
    #completewith next
    .goto Loch Modan,23.27,75.65,12,0
    .goto Loch Modan,23.62,75.42,12,0
    .goto Loch Modan,23.12,73.93,12 >> 进入掩体, 前往顶层
step
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地堡内的 |cRXP_FRIENDLY_拉格弗斯上尉|r 对话
    .accept 267 >> 接任务: 穴居人的威胁
    .target 拉格弗斯上尉
    .xp >14,1 << !Warrior !Paladin
    .xp >14,1 << Paladin !Dwarf
--XX Skip if 14+ unless warr
step
    #optional
    .goto 1432,23.522,70.102,40,0
    .goto 1432,27.501,65.367,30,0
    .goto 1432,34.405,48.276
    .subzone 144 >> 前往塞尔萨玛
    .isOnQuest 414
step
    #completewith HonorStudents << Dwarf/Gnome
    #completewith ThelsaHS << !Dwarf !Gnome
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡德雷尔|r 交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .turnin 414 >> 交任务: 卡德雷尔的酒
    .accept 416 >> 接任务: 狗头人的耳朵
    .accept 1339 >> 接任务: 巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔
step
    #optional
    #completewith ThelsaHS
    .goto 1432,35.273,47.750,10,0
    .goto 1432,35.433,48.243,12 >> 进入烈酒旅店
step
    .goto Loch Modan,34.828,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_维德拉·壁炉|r 交谈
    .accept 418 >> 接任务: 塞尔萨玛血肠
    .target 维德拉·壁炉
    .xp >14,1
--XX Skip if 14+
step
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尼·铁心|r交谈
    >>|cRXP_BUY_购买一个|r |T135435:0|t[普通木柴]|cRXP_BUY_和一个|r |T135237:0|t[燧石和火绒]|cRXP_BUY_，向她购买即可|r
    >>|cRXP_BUY_购买一个|r |T133634:0|t[棕色小包]|cRXP_BUY_，如有需要也向她购买|r << !Rogue
    >>|cRXP_WARN_这些材料用于制作|r |T135805:0|t[基础营火]|cRXP_WARN_，在船上或矿道地铁上提升|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以节省时间|r
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能来完成之后暮色森林的一项任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .target 雅尼·铁心
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #xprate >1.49 << Paladin
    #label ThelsaHS
    .goto Loch Modan,35.534,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r 交谈
    .home >> 将你的炉石设置为塞尔萨玛
    .target 旅店老板纳克罗·壁炉
step
    #optional
    #completewith next
    .goto 1432,35.273,47.750,10 >> 离开烈酒旅店
step << Dwarf/Gnome
    #label HonorStudents
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.019,47.806
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布洛克·寻石者|r 交谈
    .accept 6387 >> 接任务: 荣誉学员
    .target 布洛克·寻石者
step
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡德雷尔|r 交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .turnin 414 >> 交任务: 卡德雷尔的酒
    .accept 416 >> 接任务: 狗头人的耳朵
    .accept 1339 >> 接任务: 巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔
step
    #optional
    #label BoarMeatLoch1
    #completewith Algaz
    >>击杀|cRXP_ENEMY_山猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_这些将用于稍后提升|r |T133971:0|t[烹饪]|cRXP_WARN_等级|r
    >>|cRXP_WARN_你后续在奥伯丁的一个任务需要 10 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能等级|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 山猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 925 --Algaz Station
step
    #optional
    #requires BoarMeatLoch1
    #completewith Algaz
    >>击杀|cRXP_ENEMY_山猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_这些将用于稍后提升|r |T133971:0|t[烹饪]|cRXP_WARN_等级|r
    >>|cRXP_WARN_需要50点|r |T133971:0|t[烹饪]|cRXP_WARN_才能完成后续在夜色镇的一个任务|r
    >>|cRXP_WARN_无需专门刷怪，路过时击杀野猪并拾取掉落即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 山猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 925 --Algaz Station
step
    #optional
    #completewith Algaz
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
    >>|cRXP_WARN_保留所有|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，稍后用于提升 |T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_现在不必特意去完成此任务。你很快就会回到洛克莫丹|r
    .isOnQuest 418
    .subzoneskip 925 --Algaz Station
step
    #optional
    #label Algaz
    #completewith Stormpike1
    .goto 1432,23.490,18.008
    .subzone 925 >>前往奥加兹岗哨
step
    #optional
    #requires Algaz
    #completewith Stormpike1
    .goto 1432,23.490,18.008,15,0
    .goto 1432,24.279,17.959,12 >> 进入掩体, 前往顶层
step
    #label Stormpike1
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话碉堡内的 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r
    .turnin 1339 >> 交任务: 巡山人卡尔·雷矛的任务
    .accept 1338 >> 接任务: 卡尔·雷矛的订单
    .accept 307 >> 接任务: 肮脏的爪子
    .target 巡山人卡尔·雷矛
    .dungeon DM << Human
step << Human
    #xprate <1.59
    #label Stormpike1
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r 交谈
    .turnin 1339 >> 交任务: 巡山人卡尔·雷矛的任务
    .accept 1338 >> 接任务: 卡尔·雷矛的订单
    .accept 307 >> 接任务: 肮脏的爪子
    .target 巡山人卡尔·雷矛
    .dungeon !DM
step << Human
    #xprate >1.59
    #label Stormpike1
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r 交谈
    .turnin 1339 >> 交任务: 巡山人卡尔·雷矛的任务
    .accept 1338 >> 接任务: 卡尔·雷矛的订单 << Mage/Warlock/Rogue
    .accept 307 >> 接任务: 肮脏的爪子
    .target 巡山人卡尔·雷矛
    .dungeon !DM
step
    #softcore
    #completewith flyIF
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
step
    #optional
    #completewith next
    .goto 1432,35.273,47.750,10,0
    .goto 1432,35.433,48.243,12 >> 进入烈酒旅店
step
    #optional
    #label Thelsamar1
    .goto Loch Modan,34.828,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_维德拉·壁炉|r 交谈
    .turnin 418 >> 交任务: 塞尔萨玛血肠
    .target 维德拉·壁炉
    .isQuestComplete 418
step << Dwarf Paladin
    #xprate 1.49-1.59
    #optional
    .goto 1432,26.186,49.030
    .xp 11+6885 >> 刷怪至 6885+/8800 经验值
step << Dwarf Paladin
    #xprate >1.59
    #optional
    .goto 1432,26.186,49.030
    .xp 11+6225 >> 刷怪至 6225+/8800 经验值
step << Dwarf/Gnome
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索格拉姆·伯雷森|r 交谈
    .turnin 6387 >> 交任务: 荣誉学员
    .accept 6391 >> 接任务: 飞往铁炉堡
    .target 索格拉姆·伯雷森
step
    #label flyIF
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索格拉姆·伯雷森|r 交谈
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
    .zoneskip Ironforge
step << Gnome Rogue/Dwarf Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1455,60.781,25.800,30,0
    .goto 1455,59.236,14.974,30,0
    .goto 1455,52.941,12.466,12,0
    .goto 1455,51.919,14.468,12,0
    .goto 1455,51.438,16.000,10 >>前往屋内楼下的 |cRXP_FRIENDLY_霍夫丹·黑须|r 处
step << Dwarf Rogue/Gnome Rogue
    #xprate <1.59
    #season 2
    #optional
    #completewith next
    .goto 1455,60.781,25.800,30,0
    .goto 1455,59.236,14.974,30,0
    .goto 1455,52.941,12.466,12,0
    .goto 1455,51.919,14.468,12,0
    .goto 1455,51.438,16.000,10 >>前往屋内楼下的 |cRXP_FRIENDLY_霍夫丹·黑须|r 处
step << Dwarf Rogue/Gnome Rogue
    #xprate <1.59
    #season 2
    #optional
    .goto Ironforge,51.958,14.838
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话楼下的 |cRXP_FRIENDLY_霍夫丹·黑须|r
    .turnin 2218 >> 交任务: 救赎之路
    .target 霍夫丹·黑须
    .isOnQuest 2218
step << Dwarf Rogue/Gnome Rogue
    #xprate >1.59
    .goto Ironforge,51.958,14.838
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话楼下的 |cRXP_FRIENDLY_霍夫丹·黑须|r
    .turnin 2239 >> 交任务: 奥宁的报告
    .target 霍夫丹·黑须
step << Dwarf Rogue/Gnome Rogue
    #xprate >1.59
    #label Cunning
    #completewith Ride
    +|cRXP_WARN_将|r |T135662:0|t[狡诈之刃]|cRXP_WARN_装备到主手|r
    .use 7298
    .itemcount 7298,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Dwarf Rogue/Gnome Rogue
    #xprate >1.59
    #requires Cunning
    #completewith Ride
    +|cRXP_WARN_将|r |T135641:0|t[工匠匕首]|cRXP_WARN_装备到副手|r
    .use 2218
    .itemcount 2218,1
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step << Rogue
    #xprate <1.59
    #season 2
    .goto Ironforge,51.913,13.383
    >>打开外面的|cRXP_PICK_积尘箱子|r，获取 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_这会召唤两个10级的|cRXP_ENEMY_割喉劫匪|r，他们会攻击你|r
    .collect 204174,1 -- Rune of Precision (1)
    .mob 割喉劫匪
    .train 400081,1
step << Rogue
    #xprate <1.59
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_以学习|r |T135610:0|t[正中眉心]
    .use 204174
    .itemcount 204174,1
step << Dwarf Rogue/Gnome Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1455,60.781,25.800,25,0
    .goto 1455,59.236,14.974,25,0
    .goto 1455,56.192,32.397,20,0
    .goto 1455,51.569,29.956,15,0
    .goto 1455,49.645,28.195,12,0
    .goto Ironforge,51.521,26.311,10 >>前往建筑内的 |cRXP_FRIENDLY_高尼尔·石趾|r 处
step << Dwarf Rogue/Gnome Rogue
    #xprate <1.59
    #season 2
    #optional
    #completewith next
    .goto 1455,60.781,25.800,25,0
    .goto 1455,59.236,14.974,25,0
    .goto 1455,56.192,32.397,20,0
    .goto 1455,51.569,29.956,15,0
    .goto 1455,49.645,28.195,12,0
    .goto Ironforge,51.521,26.311,10 >>前往建筑内的 |cRXP_FRIENDLY_高尼尔·石趾|r 处
step << Dwarf/Gnome
    #xprate <1.59 << Rogue
    #season 0,1 << Rogue
    #optional
    #completewith next
    .goto 1455,56.714,41.945,20,0
    .goto 1455,55.748,38.127,20,0
    .goto 1455,51.569,29.956,15,0
    .goto 1455,49.645,28.195,12,0
    .goto Ironforge,51.521,26.311,10 >>前往建筑内的 |cRXP_FRIENDLY_高尼尔·石趾|r 处
step
    #label Ride
    .goto Ironforge,51.521,26.311
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_高尼尔·石趾|r 交谈
    .turnin 6391 >> 交任务: 飞往铁炉堡
    .accept 6388 >> 接任务: 格莱斯·瑟登
    .target 高尼尔·石趾
step << Dwarf Paladin
    #xprate >1.49
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 交谈
    >>|cRXP_WARN_勿飞行|r
    .turnin 6388 >> 交任务: 格莱斯·瑟登
    .accept 6392 >> 接任务: 向布洛克回复
    .target 格莱斯·瑟登
step
    #optional
    #completewith next
    .goto 1455,44.029,50.074,20,0
    .goto Ironforge,39.550,57.490,12 >>前往 |cRXP_FRIENDLY_参议员巴林·红石|r 处
step
    .goto Ironforge,39.550,57.490
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_参议员巴林·红石|r 交谈
    .turnin 291 >> 交任务: 森内尔的报告
    .target 参议员巴林·红石
step
    #xprate <1.5 << Dwarf Paladin
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 交谈
    >>|cRXP_WARN_勿飞行|r
    .turnin 6388 >> 交任务: 格莱斯·瑟登
    .accept 6392 >> 接任务: 向布洛克回复
    .target 格莱斯·瑟登
step << Dwarf Paladin
    #xprate >1.49
    #optional
    #completewith next
    .goto 1455,44.403,49.020,20,0
    .goto 1455,35.239,32.789,20,0
    .goto 1455,27.208,12.552,20,0
    .goto Ironforge,23.131,6.143,12 >>前往 |cRXP_FRIENDLY_布兰度尔·铁锤|r 处
step << Dwarf Paladin
    #xprate >1.49
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰度尔·铁锤|r交谈
    .accept 2999 >>接受任务圣洁之书
    .target 布兰度尔·铁锤
step << Dwarf Paladin
    #xprate >1.49
    #optional
    #completewith next
    .goto 1455,25.400,2.676,10,0
    .goto 1455,23.621,2.544,10,0
    .goto 1455,22.014,4.533,10,0
    .goto 1455,21.831,7.651,10,0
    .goto 1455,23.766,11.636,10,0
    .goto 1455,27.622,12.177,12 >> 前往楼上对话 |cRXP_FRIENDLY_蒂萨·热炉|r
step << Dwarf Paladin
    #xprate >1.49
    .goto 1455,27.622,12.177
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 2999 >>交任务圣洁之书
    .accept 1645 >>接受任务圣洁之书
    .turnin 1645 >>交任务圣洁之书
    .target 蒂萨·热炉
step << Dwarf Paladin
    #xprate >1.49
    .goto 1455,27.622,12.177
    >>|cRXP_WARN_使用 |T133739:0|t|cRXP_LOOT_[圣洁之书]|r 开始任务|r
    .accept 1646 >>接受任务圣洁之书
    .use 6916
step << Dwarf Paladin
    #xprate >1.49
    .goto 1455,27.622,12.177
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 1646 >>交任务圣洁之书
    .accept 1647 >>接受任务圣洁之书
    .target 蒂萨·热炉
step << Dwarf Paladin
    #xprate >1.49
    #loop
    .line Ironforge,21.750,51.733,22.015,54.945,23.328,61.865,23.723,63.824,26.021,68.382,27.495,71.320,31.352,77.807,32.405,78.563,37.256,82.159,39.204,83.202,42.944,84.113
    .goto 1455,21.750,51.733,0
    .goto 1455,26.021,68.382,0
    .goto 1455,42.944,84.113,0
    .goto 1455,21.750,51.733,20,0
    .goto 1455,22.015,54.945,20,0
    .goto 1455,23.328,61.865,20,0
    .goto 1455,23.723,63.824,20,0
    .goto 1455,26.021,68.382,20,0
    .goto 1455,27.495,71.320,20,0
    .goto 1455,31.352,77.807,20,0
    .goto 1455,32.405,78.563,20,0
    .goto 1455,37.256,82.159,20,0
    .goto 1455,39.204,83.202,20,0
    .goto 1455,42.944,84.113,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_约翰·特纳|r交谈
    >>|cRXP_FRIENDLY_约翰·特纳|r|cRXP_WARN_沿铁炉堡外环巡逻，范围从稍过石火旅店的位置到稍过访客中心的位置|r
    .turnin 1647 >>交任务圣洁之书
    .accept 1648 >>接受任务圣洁之书
    .turnin 1648 >>交任务圣洁之书
    .accept 1778 >>接受任务圣洁之书
    .unitscan 约翰·特纳
step << Mage
    #optional
    #season 2
    .goto Ironforge,19.197,56.094
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞姆·贾根斯塔德|r交谈
    >>|cRXP_BUY_购买5个|r |T135933:0|t[理解魔符]|cRXP_BUY_，向他购买即可|r
    >>|cRXP_WARN_这些道具是学习符文所必需的|r
    .collect 211779,5
    .target 巴瑞姆·贾根斯塔德
    .money <0.375
step << Mage
    #season 2
    #optional
    .goto Ironforge,19.197,56.094
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴瑞姆·贾根斯塔德|r 交谈，购买一个 |T135933:0|t[理解魔符]
    .collect 211779,1
    .train 401765 >> 使用 [法术笔记：IGBHNHZNAI] 学习 [寒冰指]
    .use 203753
    .target 巴瑞姆·贾根斯塔德
    .itemcount 203753,1
    .train 401765,1
    .money <0.075
step << Mage
    #season 2
    #optional
    .goto Ironforge,19.197,56.094
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴瑞姆·贾根斯塔德|r 交谈，购买一个 |T135933:0|t[理解魔符]
    .collect 211779,1
    .train 401768 >> 使用 [法术笔记：IULAOYIHTEN] 学习 [活体烈焰]
    .use 203752
    .target 巴瑞姆·贾根斯塔德
    .itemcount 203752,1
    .train 401768,1
    .money <0.075
step
    #ah
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁炉堡拍卖师|r交谈
    >>|cRXP_BUY_购买|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_BUY_和/或|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_BUY_，以便稍后提升|r |T133971:0|t[烹饪]|cRXP_BUY_技能|r
    >>|cRXP_WARN_需要50点|r |T133971:0|t[烹饪]|cRXP_WARN_才能完成后续在夜色镇的一个任务|r
    >>|cRXP_WARN_如果不打算或无法完成此步骤，请跳过|r
    >>|cRXP_BUY_购买以下物品，以便稍后在洛克莫丹更快交任务并提升|r |T133971:0|t[烹饪]|cRXP_BUY_技能：|r
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    >>|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (1-50)
    .disablecheckbox
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (1-50)
    .disablecheckbox
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
    .zoneskip Dun Morogh
    .isQuestAvailable 418
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #ah
    #optional
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁炉堡拍卖师|r交谈
    >>|cRXP_WARN_如果不打算或无法完成此步骤，请跳过|r
    >>|cRXP_BUY_请先购买以下物品，以便之后在洛克莫丹快速交任务：|r
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
    .zoneskip Dun Morogh
    .isQuestAvailable 418
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
step << Dwarf Paladin
    #xprate >1.49
    #optional
    #label Tiza1
    #completewith Tiza2
    .goto 1455,27.228,12.724,15,0
    .goto 1455,25.400,2.676,12 >> 前往 |cRXP_FRIENDLY_蒂萨·热炉|r 下方的楼梯
step << Dwarf Paladin
    #xprate >1.49
    #optional
    #requires Tiza1
    #completewith Tiza2
    .goto 1455,25.400,2.676,10,0
    .goto 1455,23.621,2.544,10,0
    .goto 1455,22.014,4.533,10,0
    .goto 1455,21.831,7.651,10,0
    .goto 1455,23.766,11.636,10,0
    .goto 1455,27.622,12.177,12 >> 前往楼上对话 |cRXP_FRIENDLY_蒂萨·热炉|r
step << Dwarf Paladin
    #xprate >1.49
    #label Tiza2
    .goto 1455,27.622,12.177
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 1778 >>交任务圣洁之书
    .accept 1779 >>接受任务圣洁之书
    .target 蒂萨·热炉
step << Dwarf Paladin
    #xprate >1.49
    .goto Ironforge,23.539,8.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_穆里顿·热炉|r交谈
    .turnin 1779 >>交任务圣洁之书
    .accept 1783 >>接受任务圣洁之书
    .target 穆里顿·热炉
step << Dwarf Paladin
    #xprate >1.49
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话楼下的 |cRXP_FRIENDLY_布兰度尔·铁锤|r
    .trainer >> 学习职业技能
    .target 布兰度尔·铁锤
step << skip --logout skip << Dwarf Paladin
    #xprate >1.49
    #optional
    #completewith DRT
    .goto 1455,27.611,8.074
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳上|cRXP_FRIENDLY_彬克|r上方的柱顶，稍向东走到箭头位置，调整角色直到看起来像在漂浮，然后登出再登入执行登出跳点|r
step << skip --logout skip << !Hunter !Warrior --Hunter Class q, Warrior training Era SoD, Rune SoD
    #ah
    #season 0,1 << Paladin --Rebuke Rune
    #xprate <1.5 << Dwarf Paladin --XX 1.5x+ logout skips from trainers
    #optional
    #completewith DRT
    .goto 1455,35.743,74.853,30,0
    .goto 1455,39.105,78.213,30,0
    .goto 1455,49.422,81.849
    >>|cRXP_WARN_走到航点箭头上方金属地板的边缘|r
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_调整角色位置直到看起来像在漂浮，然后登出再登入执行登出跳点|r
    .zoneskip Ironforge,1
    .isQuestAvailable 418 --XX only if you havent turned it in yet
step << skip --logout skip << !Hunter !Warrior --Hunter Class q, Warrior training Era SoD, Rune SoD
    #ah
    #season 0,1 << Paladin --Rebuke Rune
    #xprate <1.5 << Dwarf Paladin --XX 1.5x+ logout skips from trainers
    #optional
    #completewith DRT
    .goto 1455,56.207,46.844
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到狮鹫的头部上方，然后登出并重新登录，执行登出跳点|r
    .zoneskip Ironforge,1
    .isQuestTurnedIn 418 --XX only if you have turned in (don't need to go toward AH)
step << skip --logout skip << !Hunter !Warrior --Hunter Class q, Warrior training Era SoD, Rune SoD
    #ssf
    #season 0,1 << Paladin --Rebuke Rune
    #xprate <1.5 << Dwarf Paladin --XX 1.5x+ logout skips from trainers
    #optional
    #completewith DRT
    .goto 1455,56.207,46.844
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到狮鹫的头部上方，然后登出并重新登录，执行登出跳点|r
    .zoneskip Ironforge,1
step << Paladin
    #season 2
    #completewith next
    .goto Ironforge,71.54,73.46,10,0
    .goto Ironforge,72.53,76.94,10 >>朝旅店内的|cRXP_FRIENDLY_布鲁克·麦须|r走去
    .train 425621,1
step << Paladin
    #season 2
    .goto Ironforge,72.53,76.94
    .gossipoption 110791 >>与屋内的|cRXP_FRIENDLY_布鲁克·麦须|r交谈
    .target 布鲁克·麦须
    .skipgossip 5570,1,1
    .train 425621,1
--XX 110793 "How's business?"
--XX 110791 "Sounds like you need someone to bounce him for you."
step << Paladin
    #season 2
    .goto Ironforge,72.40,73.63
    .gossipoption 109084 >>与|cRXP_FRIENDLY_布鲁阿特|r交谈以开始战斗
    >>击败|cRXP_ENEMY_布鲁阿特|r
    >>|cRXP_WARN_小心他施放|r |T132939:0|t[反手一击]|cRXP_WARN_（使你昏迷 2 秒）|r
    >>|cRXP_WARN_记得在开战前施放|r |T135924:0|t[十字军圣印]|cRXP_WARN_准备战斗|r
    >>|cRXP_WARN_不要误施放|r |T135906:0|t[力量祝福]|cRXP_WARN_在他身上|r
    >>|cRXP_WARN_将他风筝到楼上阳台，再跳到旅店外并施放|r |T135920:0|t[圣光术]|cRXP_WARN_（若有需要）|r
    .mob 布鲁阿特
    .skipgossip 209004,1
    .train 425621,1
--XX 109084 "Seems you've had a few too many"
--XX Check if another player can skip the "how's business" dialogue for you (paladin, warrior)
step << Paladin
    #season 2
    .goto Ironforge,72.40,73.63,-1
    .goto Ironforge,72.53,76.94,-1
    >>击败|cRXP_ENEMY_布鲁阿特|r
    >>|cRXP_WARN_小心他施放|r |T132939:0|t[反手一击]|cRXP_WARN_（使你昏迷 2 秒）|r
    >>|cRXP_WARN_记得在开战前施放|r |T135924:0|t[十字军圣印]|cRXP_WARN_准备战斗|r
    >>|cRXP_WARN_不要误施放|r |T135906:0|t[力量祝福]|cRXP_WARN_在他身上|r
    >>|cRXP_WARN_将他风筝到楼上阳台，再跳到旅店外并施放|r |T135920:0|t[圣光术]|cRXP_WARN_（若有需要）|r
    >>|cRXP_WARN_击败|cRXP_ENEMY_布鲁阿特|r后：|r
    >>再次与|cRXP_FRIENDLY_布鲁克·麦须|r交谈，领取 |T134419:0|t[责难符文]
    >>|cRXP_WARN_如果他不给你|r |T134419:0|t[责难符文]|cRXP_WARN_，你可能需要再次与|cRXP_ENEMY_布鲁阿特|r战斗|r
    .collect 205683,1 --Rune of Rebuke (1)
    .target 布鲁克·麦须
    .skipgossip 5570,2,1
    .skipgossip 209004,1
    .train 425621,1
--XX 109539 "I've taken care of Stuart. He shouldn't be a problem anymore."
step << Paladin
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[责难符文]|cRXP_WARN_以学习|r |T134596:0|t[铭刻裤子-责难]
    .use 205683
    .itemcount 205683,1 --Rune of Rebuke (1)
    .train 425621,1
step << Paladin
    #season 2
    #completewith DRT
    .engrave 7 >>|cRXP_WARN_铭刻你的|r |T134596:0|t|cRXP_LOOT_[裤子]|r，使用|r |T134596:0|t[铭刻裤子 - 责难]
    >>|cRXP_WARN_记得将|r |T134919:0|t[责难]|cRXP_WARN_拖到动作条上|r
    .train 425621,3
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_比克斯|r 和 |cRXP_FRIENDLY_布里维夫·石手|r
    >>如果之前没学过，就学习投掷武器和双手锤（2h）
    .train 2567 >> 学习 [投掷]
    .target +比克斯
    .goto Ironforge,62.237,89.628
    .train 199 >> 学习双手锤（2h）
    .goto Ironforge,61.177,89.508
    .target +布里维夫·石手
step << Warrior
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]|cRXP_BUY_，向她购买即可|r
    .collect 3107,200 << !tbc
    .collect 25873,1 << tbc
    .target 布雷文·寒钢
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Warrior
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r |T135641:0|t[平衡飞刀]|cRXP_BUY_，向她购买即可|r
    .collect 2946,200 << !tbc
    .collect 25872,1 << tbc
    .target 布雷文·寒钢
    .xp >11,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #optional
    #completewith DRT
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]
    .use 3107 << !tbc
    .use 25873 << tbc
    .itemcount 3107,1 << !tbc
    .itemcount 25873,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Warrior
    #optional
    #completewith DRT
    +|cRXP_WARN_装备|r |T135641:0|t[平衡飞刀]
    .use 2946 << !tbc
    .use 25872 << tbc
    .itemcount 2946,1 << !tbc
    .itemcount 25872,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #season 2
    #optional
    #completewith next
    .goto Ironforge,71.54,73.46,10,0
    .goto Ironforge,72.53,76.94,10 >>朝旅店内的|cRXP_FRIENDLY_布鲁克·麦须|r走去
    .train 425447,1
step << Warrior
    #season 2
    .goto Ironforge,72.53,76.94
    .gossipoption 110791 >>与屋内的|cRXP_FRIENDLY_布鲁克·麦须|r交谈
    .target 布鲁克·麦须
    .skipgossip 5570,1,1
    .train 425447,1
--XX 110793 "How's business?"
--XX 110791 "Sounds like you need someone to bounce him for you."
step << Warrior
    #season 2
    .goto Ironforge,72.40,73.63
    .gossipoption 109084 >>与|cRXP_FRIENDLY_布鲁阿特|r交谈以开始战斗
    >>击败|cRXP_ENEMY_布鲁阿特|r
    >>|cRXP_WARN_小心他施放|r |T132939:0|t[反手一击]|cRXP_WARN_（使你昏迷 2 秒）|r
    >>|cRXP_WARN_将他风筝到楼上的阳台，再跳到旅店外并使用|r |T133688:0|t[绷带]|cRXP_WARN_（如有绷带且需要）|r
    .mob 布鲁阿特
    .skipgossip 209004,1
    .train 425447,1
--XX 109084 "Seems you've had a few too many"
--XX Check if another player can skip the "how's business" dialogue for you (paladin, warrior)
step << Warrior
    #season 2
    #optional
    .goto Ironforge,72.40,73.63,-1
    .goto Ironforge,72.53,76.94,-1
    >>击败|cRXP_ENEMY_布鲁阿特|r
    >>|cRXP_WARN_小心他施放|r |T132939:0|t[反手一击]|cRXP_WARN_（使你昏迷 2 秒）|r
    >>|cRXP_WARN_将他风筝到楼上的阳台，再跳到旅店外并使用|r |T133688:0|t[绷带]|cRXP_WARN_（如有绷带且需要）|r
    >>|cRXP_WARN_击败|cRXP_ENEMY_布鲁阿特|r后：|r
    >>再次与|cRXP_FRIENDLY_布鲁克·麦须|r交谈，领取 |T134419:0|t[狂乱攻击符文]
    >>|cRXP_WARN_如果他不给你|r |T134419:0|t[狂乱攻击符文]|cRXP_WARN_，你可能需要再次与|cRXP_ENEMY_布鲁阿特|r战斗|r
    >>|cRXP_WARN_注意：此任务单人完成可能较困难，建议寻求帮助；若不想现在完成，可稍后在指南中再次尝试|r
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target 布鲁克·麦须
    .skipgossip 5570,2,1
    .skipgossip 209004,1
    .train 425447,1
--XX 109539 "I've taken care of Stuart. He shouldn't be a problem anymore."
step << Warrior
    #season 2
    .train 425447 >>|cRXP_WARN_使用|r |T134419:0|t[狂乱攻击符文]|cRXP_WARN_以学习|r |T134596:0|t[铭刻裤子-狂乱攻击]
    .use 204716
    .itemcount 204716,1 --Rune of Frenzied Assault (1)
step << Warrior
    #season 2
    #completewith DRT
    .engrave 7 >>|cRXP_WARN_为|r |T134596:0|t|cRXP_LOOT_[裤子]|r|cRXP_WARN_铭刻|r |T134596:0|t[铭刻裤子-狂乱攻击]
    .train 425447,3
step << skip --logout skip << Paladin/Warrior
    #season 2
    #optional
    #completewith DRT
    .goto 1455,72.481,74.910
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到桌上的蜡烛上，再登出并重新登录以执行登出跳过|r
step << Hunter
    #optional
    #completewith next
    .goto 1455,66.847,83.366,15,0
    .goto Ironforge,70.86,85.83,15 >>前往 |cRXP_FRIENDLY_贝莉亚·雷岩|r
step << Hunter
    .goto Ironforge,70.86,85.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贝莉亚·雷岩|r 交谈
    .turnin 6086 >> 交任务: 训练野兽
    .target 贝莉亚·雷岩
step << skip --logout skip << Hunter
    #optional
    #completewith DRT
    .goto 1455,70.408,85.520
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_站在大炮顶部。然后登出并重新登录，执行登出跳点|r
step
    #label DRT
    #completewith TramEnd
    .goto Ironforge,78.00,51.40
    .subzone 2257 >>进入矿道地铁
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话矿道地铁中间平台上的 |cRXP_FRIENDLY_蒙提|r
    .accept 6661 >> 接任务: 捕捉矿道老鼠
    .target 蒙提
step
    >>使用 |T133942:0|t[捕鼠者之笛]，目标选中矿道地铁里的|cRXP_FRIENDLY_矿道老鼠|r
    .complete 6661,1 --Rats Captured (x5)
    .use 17117
    .mob 矿道老鼠
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话矿道地铁中间平台上的 |cRXP_FRIENDLY_蒙提|r
    .turnin 6661 >> 交任务: 捕捉矿道老鼠
    .timer 11,矿道地铁捕鼠剧情
    .accept 6662 >> 接任务: 我的兄弟，尼普希
    .target 蒙提
----
step
    #optional
    #label TramCook1
    #completewith TramEnd
    >>|cRXP_WARN_地铁抵达后，在车上：|r
    .cast 818 >>|cRXP_WARN_制作一个|r |T135805:0|t[基础营火]|cRXP_WARN_（在法术书的通用技能标签页中）|r
    .usespell 818
    .zoneskip Stormwind City
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #optional
    #requires TramCook1
    #label TramCook2
    #completewith TramEnd
    >>|cRXP_WARN_地铁抵达后，在车上：|r
    .cast 818 >>|cRXP_WARN_制作一个|r |T135805:0|t[基础营火]|cRXP_WARN_（在法术书的通用技能标签页中）|r
    .usespell 818
    .zoneskip Stormwind City
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #optional
    #requires TramCook2
    #label TramCook3
    #completewith TramEnd
    >>|cRXP_WARN_地铁抵达后，在车上：|r
    .cast 818 >>|cRXP_WARN_制作一个|r |T135805:0|t[基础营火]|cRXP_WARN_（在法术书的通用技能标签页中）|r
    .usespell 818
    .zoneskip Stormwind City
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #optional
    #requires TramCook3
    #label TramCook4
    #completewith TramEnd
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能来完成之后暮色森林的一项任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_以下物品：|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Stormwind City
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #optional
    #requires TramCook4
    #label TramCook5
    #completewith TramEnd
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能来完成之后暮色森林的一项任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Stormwind City
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #optional
    #requires TramCook5
    #label TramCook6
    #completewith TramEnd
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能来完成之后暮色森林的一项任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    .usespell 2550
    .zoneskip Stormwind City
    .itemcount 769,1 --Chunk of Boar Meat (1)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
----
step
    #label TramEnd
    >>|cRXP_WARN_乘坐矿道地铁前往暴风城|r
    >>|cRXP_WARN_提升你的|r |T135966:0|t[急救] |cRXP_WARN_技能，趁等待前往暴风城的地铁时，若有需要|r << Rogue/Warrior/Paladin
    >>|cRXP_WARN_你需要把|r |T135966:0|t[急救] |cRXP_WARN_练到 80 点，以完成 24 级时的任务|r << Rogue !Dwarf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话矿道地铁暴风城端中间平台上的 |cRXP_FRIENDLY_尼普希|r
    .turnin 6662 >> 交任务: 我的兄弟，尼普希
    .target 尼普希
    .subzoneskip 2257,1 --Deeprun Tram
step
    #optional
    #completewith Order
    .abandon 6662 >> 放弃任务: 我的兄弟，尼普希
step
    #optional
    #completewith Order
    .zone Stormwind City >> 进入暴风城
    .isOnQuest 1338
step
    .goto StormwindClassic,51.757,12.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格瑞曼德·艾尔默|r 交谈
    .accept 353 >> 接任务: 雷矛的包裹
    .target 格瑞曼德·艾尔默
step
    #label Order
    .goto StormwindClassic,58.091,16.552
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗伦·长须|r 交谈
    .turnin 1338 >> 交任务: 卡尔·雷矛的订单
    .target 弗伦·长须
step << Paladin
    #season 2
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >> 前往 [暴风城大教堂]
step << Paladin
    #season 2
    .goto StormwindClassic,38.10,28.10
    .gossipoption 109653 >>与|cRXP_FRIENDLY_罗姆鲁斯修士|r交谈
    .target 罗姆鲁斯修士
    --.skipgossip
    .train 410015,1
step << Paladin
    #season 2
    #completewith next
    .goto StormwindClassic,37.39,29.76,5,0
    .goto StormwindClassic,37.87,29.10,5,0
    .goto StormwindClassic,36.52,32.67,8,0
    .goto StormwindClassic,36.55,33.45,8,0
    .goto StormwindClassic,35.95,34.05,8,0
    .goto StormwindClassic,35.46,33.03,8,0
    .goto StormwindClassic,35.95,31.54,8,0
    .goto StormwindClassic,34.79,29.31,8,0
    .goto StormwindClassic,33.69,29.69,8,0
    .goto StormwindClassic,32.57,27.49,8,0
    .goto StormwindClassic,33.41,25.61,8,0
    >>下楼进入大教堂地下墓穴的西侧
    .goto StormwindClassic,32.86,24.77,8 >>前往墓穴中的 |cRXP_LOOT_烧焦的笔记|r 方向
    .train 410015,1
step << Paladin
    #season 2
    .goto StormwindClassic,32.86,24.87
    >>拾取蜡烛旁的|cRXP_LOOT_烧焦的笔记|r
    .collect 205864,1 --Charred Note (1)
    .train 410015,1
step << Priest
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >> 前往 [暴风城大教堂]
step << Priest
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 交谈
    .trainer >> 学习职业技能
    .accept 5634 >> 接任务：绝望祷言
    .turnin 5634 >> 交任务: 绝望祷言
    .target 高阶牧师劳瑞娜
step << Priest
    .goto StormwindClassic,38.62,26.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 交谈
    .train 13908 >> 学习绝望祷言
    .target 高阶牧师劳瑞娜
step << Warrior
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.503,45.712
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊尔萨·考宾|r 交谈
    .trainer >> 学习职业技能
    .accept 1638 >> 接任务: 战士的训练
    .target 伊尔萨·考宾
step << Warrior
    #optional
    #completewith next
    .goto StormwindClassic,72.878,51.582,17,0
    .goto StormwindClassic,71.7,39.9,12 >> 进入酒馆
step << Warrior
    .goto StormwindClassic,74.249,37.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈里·伯加德|r 交谈
    .turnin 1638 >> 交任务: 战士的训练
    .accept 1639 >> 接任务: 醉鬼巴特莱比
    .target 哈里·伯加德
step << Warrior
    .goto StormwindClassic,73.787,36.323
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴特莱比|r 交谈
    .turnin 1639 >> 交任务: 醉鬼巴特莱比
    .accept 1640 >> 接任务: 击败巴特莱比
    .target 巴特莱比
step << Warrior
    .goto StormwindClassic,73.787,36.323
    >>击败|cRXP_ENEMY_巴特莱比|r
    .complete 1640,1 --Beat Bartleby
    .mob 巴特莱比
step << Warrior
    .goto StormwindClassic,73.787,36.323
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴特莱比|r 交谈
    .turnin 1640 >> 交任务: 击败巴特莱比
    .accept 1665 >> 接任务: 巴特莱比的酒杯
    .target 巴特莱比
step << Warrior
    .goto StormwindClassic,74.249,37.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈里·伯加德|r 交谈
    .turnin 1665 >> 交任务: 巴特莱比的酒杯
    .target 哈里·伯加德
step << Warlock
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往 [已宰的羔羊] 术士训练师处并下楼
step << Warlock
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 交谈
    .accept 1688 >> 接任务: 苏伦娜·凯尔东
    .target 黑暗缚灵者加科因
step
    .goto StormwindClassic,57.129,57.698
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .trainer >>学习单手剑（1h） << Rogue/Mage
    .trainer >>学习[法杖] << Priest/Hunter
    .trainer >>学习单手剑（1h）和法杖 << Warlock
    .trainer >>学习双手剑（2h） << Warrior/Paladin
    .target 吴平
step << Dwarf Paladin
    #xprate <1.5
    .goto StormwindClassic,52.623,65.701
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板奥里森|r 交谈
    .home >> 将你的炉石设置为暴风城
    .target 旅店老板奥里森
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#xprate >1.49
#classic
#tbc
#season 0,1
#version 1
<< Gnome Warlock
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 11-12 Voidwalker Quest
#next 12-14 Loch Modan (Dwarf/Gnome)
#displayname 12-13 虚空行者任务 << SoD
#displayname 11-12 虚空行者任务
step
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往 [已宰的羔羊] 术士训练师处并下楼
step
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .accept 1688 >> 接任务：苏伦娜·凯尔东
    .target 黑暗缚灵者加科因
step
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fp Stormwind >> 获取暴风城飞行路线
    .target 杜加尔·朗德瑞克
step
    #optional
    #completewith next
    .goto StormwindClassic,73.2,92.1
    .zone Elwynn Forest >> 离开暴风城
step
    >>点击|cRXP_PICK_通缉告示|r
    .accept 176 >> 接任务：通缉：霍格
    .goto Elwynn Forest,24.548,74.672
step
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
    >>击杀 |cRXP_ENEMY_霍格|r, 获取 |cRXP_LOOT_爪子|r
    >>|cRXP_ENEMY_霍格|r |cRXP_WARN_会在多个地点刷新|r
    >>|cRXP_WARN_持续施放|r |T136183:0|t[恐惧术] |cRXP_WARN_控制|cRXP_ENEMY_霍格|r，并用常规持续伤害技能将其击杀|r
    >>|cRXP_WARN_这个任务难度较高. 如需协助, 请为他组队. 若既无法组队，也无法单人击杀他, 可跳过此步骤|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .unitscan 霍格
step
    #softcore
    #optional
    #completewith next
    .deathskip >> 死亡后在闪金镇复活
step
    .goto Elwynn Forest,42.108,65.928
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 176,3 >> 交任务：通缉：霍格
    .target 治安官杜汉
    .isQuestComplete 176
step << Warlock
    #optional
    #label BoarMeatElwynnCooking1
    #completewith SChoker
    .goto 1429,49.917,72.959,0
    .goto 1429,54.444,75.879,0
    .goto 1429,57.620,76.213,0
    .goto 1429,61.911,78.274,0
    .goto 1429,65.619,78.388,0
    >>击杀 |cRXP_ENEMY_石皮野猪|r, 搜刮 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 石皮野猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 62 --Brackwell Pumpkin Patch
step << Warlock
    #optional
    #requires BoarMeatElwynnCooking1
    #completewith SChoker
    .goto 1429,49.917,72.959,0
    .goto 1429,54.444,75.879,0
    .goto 1429,57.620,76.213,0
    .goto 1429,61.911,78.274,0
    .goto 1429,65.619,78.388,0
    >>击杀 |cRXP_ENEMY_石皮野猪|r, 搜刮 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_无需专门刷, 路过时击杀并拾取野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 石皮野猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 62 --Brackwell Pumpkin Patch
step << Warlock
    #label SChoker
    .goto Elwynn Forest,71.10,80.66
    >>击杀 |cRXP_ENEMY_苏伦娜·凯尔东|r, 搜刮 |cRXP_LOOT_项圈|r
    >>|cRXP_WARN_全力快速击杀 |cRXP_ENEMY_苏伦娜·凯尔东|r|r
    >>|cRXP_WARN_持续施放|r |T136183:0|t[恐惧术] |cRXP_WARN_控制|cRXP_ENEMY_收货人莫根|r|r
    .complete 1688,1 --Surena's Choker (1)
    .mob 苏伦娜·凯尔东
step << Warlock
    #optional
    #label WolfMeatElwynnCooking1
    #completewith WlockRedridge
    .goto 1429,84.448,72.486,0
    .goto 1429,88.611,71.379,0
    .goto 1429,89.657,75.373,0
    .goto 1429,87.250,75.853,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r, 搜刮 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob 觅食的灰狼
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step << Warlock
    #optional
    #requires WolfMeatElwynnCooking1
    #completewith WlockRedridge
    .goto 1429,84.448,72.486,0
    .goto 1429,88.611,71.379,0
    .goto 1429,89.657,75.373,0
    .goto 1429,87.250,75.853,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r, 搜刮 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_无需专门刷, 路过时击杀并拾取狼即可|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob 觅食的灰狼
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #optional
    #label WlockRedridge
    #completewith next
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >> 前往赤脊山
step
    .goto Redridge Mountains,17.4,69.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >> 接任务：豺狼人的入侵
    .target 卫兵帕克
step
    #xprate >1.49
    .goto Redridge Mountains,29.31,53.63
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖恩|r交谈
    >>|cRXP_WARN_途中小心高等级怪物|r
    .accept 3741 >> 接任务：希拉里的项链
    .target 肖恩
    .xp <12,1
--XX Done now as you come RR only for p2 on >1.59x
step
    #xprate >1.49
    .goto Redridge Mountains,31.29,54.27,90,0
    .goto Redridge Mountains,27.80,56.05,90,0
    .goto Redridge Mountains,26.56,50.63,90,0
    .goto Redridge Mountains,23.96,55.17,90,0
    .goto Redridge Mountains,19.16,51.75,90,0
    .goto Redridge Mountains,31.12,54.21,90,0
    .goto Redridge Mountains,34.03,55.34,90,0
    .goto Redridge Mountains,38.09,54.49
    >>|cRXP_WARN_潜入水下并检查刷新位置. 共有 8 个地点, 每次同时刷新 2 个目标|r
    >>打开 |cRXP_PICK_闪光的泥浆|r, 获取 |cRXP_LOOT_希拉里的项链|r
    .complete 3741,1 --Hilary's Necklace (1)
    .isOnQuest 3741
step
    #xprate >1.49
    .goto Redridge Mountains,29.24,53.63
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在湖中跳起，与|cRXP_FRIENDLY_希拉里|r交谈
    >>|cRXP_WARN_在湖中站到她正下方，一边跳起一边尝试与她交谈|r
    .turnin 3741 >> 交任务：希拉里的项链
    .target 希拉里
    .isQuestComplete 3741
step
    #xprate >1.49
    .goto Redridge Mountains,30.733,59.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >> 交任务：豺狼人的入侵
    .target 菲尔顿副队长
step
    #xprate <1.49
    .goto Redridge Mountains,30.733,59.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    >>|cRXP_WARN_途中小心高等级怪物|r
    .turnin 244 >> 交任务：豺狼人的入侵
    .target 菲尔顿副队长
step
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >> 获取赤脊山飞行路线
    .fly Stormwind >> 飞往暴风城
    .target 艾蕾娜·斯托姆法瑟
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拍卖师亚克森|r
    >>|cRXP_BUY_购买|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_BUY_和／或|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_BUY_以便稍后提升|r |T133971:0|t[烹饪] |cRXP_BUY_技能|r
    >>|cRXP_WARN_你需要 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以完成之后夜色镇的一个任务|r
    >>|cRXP_WARN_如果你不想或无法完成此步骤，请跳过|r
    >>|cRXP_BUY_购买以下物品，以便稍后在洛克莫丹更快交任务并提升|r |T133971:0|t[烹饪] |cRXP_BUY_技能：|r
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    >>|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (1-50)
    .disablecheckbox
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (1-50)
    .disablecheckbox
    .target 拍卖师亚克森
    .isQuestAvailable 418
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #ah
    #optional
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拍卖师亚克森|r
    >>|cRXP_WARN_如果你不想或无法完成此步骤，请跳过|r
    >>|cRXP_BUY_请先购买以下物品, 以便之后在洛克莫丹快速交任务:|r
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .target 拍卖师亚克森
    .isQuestAvailable 418
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
step
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往 [已宰的羔羊] 术士训练师处并下楼
step
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
step
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .turnin 1688 >> 交任务：苏伦娜·凯尔东
    .accept 1689 >> 接任务：誓缚
    .target 黑暗缚灵者加科因
step
    #optional
    #completewith next
    .goto StormwindClassic,25.2,80.7,18,0
    .goto StormwindClassic,23.2,79.5,18,0
    .goto StormwindClassic,26.3,79.5,18,0
    .goto StormwindClassic,25.154,77.406
    >>|cRXP_WARN_前往已宰的羔羊旅店底层|r
    .cast 7728 >> |cRXP_WARN_使用|r |T133292:0|t[血石颈环] |cRXP_WARN_召唤|r |cRXP_ENEMY_虚空行者|r
    .use 6928
step
    .goto StormwindClassic,25.154,77.406
    >>击杀召唤出的|cRXP_ENEMY_虚空行者|r
    .complete 1689,1 --Kill Summoned Voidwalker (x1)
    .use 6928
    .mob 虚空行者
step
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .turnin 1689 >> 交任务：誓缚
    .target 黑暗缚灵者加科因
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#xprate <1.5
#classic
#tbc
#season 0,1
<< Alliance !Hunter
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 11-12 Elwynn (Dwarf/Gnome)
#version 1
#defaultfor Gnome/Dwarf
#next 12-14 Loch Modan (Dwarf/Gnome)
--#era << !Warlock
#displayname 11-12 艾尔文森林（矮人/侏儒）
step << Warlock
    #softcore
    #optional
    #completewith next
    +反复施放 |T136126:0|t[生命分流]，直到生命值 <10%，同时继续前往 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
step
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fp Stormwind >> 获取暴风城飞行点
    .target 杜加尔·朗德瑞克
step << Warlock
    #softcore
    #optional
    #completewith next
    >>连续施放 |T136126:0|t[生命分流] 降到 10% 血量以下, 然后从飞行管理员旁边的悬崖跳下去自杀 (别掉进水里)
    .deathskip >> 在灵魂医者处复活
    .target 灵魂医者
step
    #optional
    #completewith next
    .subzone 87 >> 前往闪金镇
step
    .goto Elwynn Forest,42.107,65.930
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_治安官杜汉|r
    .target 治安官杜汉
    .accept 62 >> 接任务: 法戈第矿洞
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威廉·匹斯特|r 对话
    .target 威廉·匹斯特
    .goto Elwynn Forest,43.318,65.705
    .accept 60 >> 接任务: 狗头人的蜡烛
step << Mage/Rogue
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >> 前往旅店二楼
step << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r 对话
    .target 扎尔迪玛·维夫希尔特
    .goto Elwynn Forest,43.25,66.19
    .trainer >> 学习职业技能
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科瑞恩·塞尔留斯|r 对话
    >>|cRXP_WARN_优先学习技能:|r |T132147:0|t[双武器]
    .target 科瑞恩·塞尔留斯
    .goto Elwynn Forest,43.872,65.937
    .trainer >> 学习职业技能
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷米|r 对话
    .target 雷米
    .goto Elwynn Forest,42.140,67.254
    .accept 40 >> 接任务: 鱼人的威胁
    .accept 47 >> 接任务: 金砂交易
step << Warlock
    >>点击 [|cRXP_PICK_通缉告示|r]
    .accept 176 >> 接任务: 通缉：霍格
    .goto Elwynn Forest,24.548,74.672
step << Paladin
    #season 2
    >>点击 [|cRXP_PICK_通缉告示|r]
    .accept 176 >> 接任务: 通缉：霍格
    .goto Elwynn Forest,24.548,74.672
step << Warlock
    #completewith next
    >>|cRXP_WARN_这份|r |T134939:0|t[|cRXP_LOOT_采金日程表|r] |cRXP_WARN_掉落非常罕见。如果没有获得，请忽略此步骤|r
    >>|cRXP_ENEMY_格拉夫·疾齿|r |cRXP_WARN_是稀有怪，但该物品的掉落率为 100%|r
    .use 1307 >>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_采金日程表|r] 接取任务|r
    .collect 1307,1,123 --Collect Gold Pickup Schedule (x1)
    .accept 123 >> 接任务: 收货人
    .unitscan 格拉夫·疾齿
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
    >>击杀 |cRXP_ENEMY_霍格|r，拾取他的 |cRXP_LOOT_巨大的豺狼人爪|r
    >>|cRXP_ENEMY_霍格|r |cRXP_WARN_可能在多个地点刷新|r
    >>|cRXP_WARN_施放|r |T136183:0|t[恐惧术] |cRXP_WARN_持续控制 |cRXP_ENEMY_霍格|r，并用常规持续伤害法术击杀他|r
    >>|cRXP_WARN_这个任务较难，必要时组队完成。如果找不到队伍，又无法独自击杀他，就跳过此步|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .unitscan 霍格
step << Paladin
    #season 2
    #completewith next
    >>|cRXP_WARN_这份|r |T134939:0|t[|cRXP_LOOT_采金日程表|r] |cRXP_WARN_掉落非常罕见。如果没有获得，请忽略此步骤|r
    >>|cRXP_ENEMY_格拉夫·疾齿|r |cRXP_WARN_是稀有怪，但该物品的掉落率为 100%|r
    .use 1307 >>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_采金日程表|r] 接取任务|r
    .collect 1307,1,123 --Collect Gold Pickup Schedule (x1)
    .accept 123 >> 接任务: 收货人
    .unitscan 格拉夫·疾齿
step << Paladin
    #season 2
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
    >>击杀 |cRXP_ENEMY_霍格|r，拾取他的 |cRXP_LOOT_巨大的豺狼人爪|r
    >>|cRXP_ENEMY_霍格|r |cRXP_WARN_可能在多个地点刷新|r
    >>|cRXP_WARN_这个任务较难，必要时组队完成。如果找不到队伍，又无法独自击杀他，就跳过此步|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .unitscan 霍格
step << Paladin
    #season 2
    #completewith next
    #label Island
    .goto Duskwood,4.33,28.26,50 >>前往岛上的 |cRXP_FRIENDLY_艾达·盖尔哈特|r 处
    .train 410015,1
    .itemcount 205864,1 --Charred Note (1)
step << Paladin
    #season 2
    #completewith next
    .goto Duskwood,4.33,28.26
    .gossipoption 109610 >>与 |cRXP_FRIENDLY_艾达·盖尔哈特|r 交谈，开始战斗
    .target 艾达·盖尔哈特
    .skipgossip 205153,1
    .train 410015,1
    .itemcount 205864,1 --Charred Note (1)
--XX 109612 "As one candle is snuffed out, another is lit"
--XX 109611 "I've been sent by brother Romulus. Please, Ada, return with me to the Cathedral of Light"
--XX 109610 "I see. I'm sorry it has come to this, sister. (Fight Ada)"
step << Paladin
    #season 2
    #requires Island
    .goto Duskwood,4.33,28.26
    >>击败 |cRXP_ENEMY_艾达·盖尔哈特|r
    >>|cRXP_WARN_记得提前施放|r |T135924:0|t[十字军圣印] |cRXP_WARN_来对付她|r
    >>|cRXP_WARN_小心她施放的|r |T136197:0|t[暗影震击] |cRXP_WARN_（瞬间造成45点暗影伤害，消耗她75点法力值。尽快击杀她，让她最多只能施放3次）|r
    >>|cRXP_WARN_击败 |cRXP_ENEMY_艾达·盖尔哈特|r 后：|r
    >>再次与 |cRXP_FRIENDLY_艾达·盖尔哈特|r 交谈，获得 |T134419:0|t[殉道符文]
    .collect 205897,1 --Rune of Martyrdom (1)
    .target 艾达·盖尔哈特
    .skipgossip 205153,1
    .train 410015,1
    .itemcount 205864,1 --Charred Note (1)
--XX Must have had the Charred Note to unlock the dialogue
step << Paladin
    #season 2
    #sticky
    .destroy 205864 >> 从背包中删除 |T134939:0|t[烧焦的笔记], 已不再需要
step << Paladin
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[殉道符文] |cRXP_WARN_学习|r |T133815:0|t[铭刻胸甲 - 殉道圣印]
    .use 205897
    .itemcount 205897,1 --Rune of Martyrdom (1)
    .train 410015,1
step << Paladin
    #season 2
    .engrave 5 >>|cRXP_WARN_铭刻你的|r |T134596:0|t|cRXP_LOOT_[胸甲]|r，使用|r |T133815:0|t[铭刻胸甲 - 殉道圣印]
    >>|cRXP_WARN_记得将|r |T135961:0|t[殉道圣印] |cRXP_WARN_放到动作条上。它优于|r |T132325:0|t[正义圣印] |cRXP_WARN_和|r |T132347:0|t[命令圣印] |cRXP_WARN_（直到你获得|r |T133815:0|t[铭刻胸甲 - 神圣风暴]|cRXP_WARN_）|r
    .train 410015,3
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_斯通菲尔德妈妈|r 和 |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r
    .accept 88 >> 接任务: 公主必须死！
    .target +斯通菲尔德妈妈
    .goto Elwynn Forest,34.660,84.483
    .accept 85 >> 接任务: 丢失的项链
    .target +波尼斯·斯通菲尔德姑妈
    .goto Elwynn Forest,34.486,84.252
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利·马科伦|r 对话
    .target 比利·马科伦
    .goto Elwynn Forest,43.131,85.722
    .turnin 85 >> 交任务: 丢失的项链
    .accept 86 >> 接任务: 比利的馅饼
step
    #completewith next
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r 和 |cRXP_ENEMY_狗头人矿工|r，拾取他们的 |cRXP_LOOT_蜡烛|r 和 |cRXP_LOOT_金砂|r
    >>|cRXP_WARN_任务进行期间，5级怪物可能会变灰。仍需完成此任务，才能解锁后续任务|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob 狗头人隧道工
    .mob 狗头人矿工
step
    .goto Elwynn Forest,38.677,81.778,50,0
    .goto Elwynn Forest,40.5,82.3
    >>|cRXP_WARN_进入并探索法戈第矿洞|r
    .complete 62,1 --Scout Through the Fargodeep Mine
step
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76,25,0
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76,25,0
    .goto Elwynn Forest,40.5,82.3
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r 和 |cRXP_ENEMY_狗头人矿工|r，拾取他们的 |cRXP_LOOT_蜡烛|r 和 |cRXP_LOOT_金砂|r
    >>|cRXP_WARN_任务进行期间，5级怪物可能会变灰。仍需完成此任务，才能解锁后续任务|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob 狗头人隧道工
    .mob 狗头人矿工
step
    #softcore
    #completewith GoldshireTurnins
    .deathskip >> 死亡后在灵魂医者处复活
    .target 灵魂医者
step
    #hardcore
    #completewith GoldshireTurnins
    .subzone 87 >> 前往闪金镇
step
    #hardcore
    .goto Elwynn Forest,42.140,67.254
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷米|r 对话
    >>|cRXP_WARN_不要把奖励的|r |T133581:0|t[弹子球] |cRXP_WARN_卖给商人。这个物品直到 60 级都非常有用|r
    .turnin 47 >> 交任务: 金砂交易
    .target 雷米
step << Paladin
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_治安官杜汉|r
    .target 治安官杜汉
    .goto Elwynn Forest,42.108,65.928
    .turnin 62 >> 交任务: 法戈第矿洞
    .turnin 40 >> 交任务: 鱼人的威胁
    .accept 35 >> 接任务: 卫兵托马斯
    .turnin 176,2 >> 交任务: 通缉：霍格
    .isQuestComplete 176
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_治安官杜汉|r
    .target 治安官杜汉
    .goto Elwynn Forest,42.108,65.928
    .turnin 62 >> 交任务: 法戈第矿洞
    .turnin 40 >> 交任务: 鱼人的威胁
    .accept 35 >> 接任务: 卫兵托马斯
    .turnin 176,3 >> 交任务: 通缉：霍格
    .isQuestComplete 176
step
    #label GoldshireTurnins
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_治安官杜汉|r
    .target 治安官杜汉
    .goto Elwynn Forest,42.108,65.928
    .turnin 62 >> 交任务: 法戈第矿洞
    .turnin 40 >> 交任务: 鱼人的威胁
    .accept 35 >> 接任务: 卫兵托马斯
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_治安官杜汉|r
    .target 治安官杜汉
    .goto Elwynn Forest,42.105,65.927
    .turnin 123 >> 交任务: 收货人
    .isOnQuest 123
step << Warlock
    .isQuestTurnedIn 123
    .goto Elwynn Forest,42.105,65.927
    .target 治安官杜汉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_治安官杜汉|r
    .accept 147 >> 接任务: 猎杀收货人
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威廉·匹斯特|r 对话
    .target 威廉·匹斯特
    .goto Elwynn Forest,43.318,65.705
    .turnin 60 >> 交任务: 狗头人的蜡烛
    .accept 61 >> 接任务: 送往暴风城的货物
step
    #softcore
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷米|r 对话
    >>|cRXP_WARN_不要把奖励的|r |T133581:0|t[弹子球] |cRXP_WARN_卖给商人。这个物品直到 60 级都非常有用|r
    .target 雷米
    .goto Elwynn Forest,42.140,67.254
    .turnin 47 >> 交任务: 金砂交易
step
    #completewith next
    .goto Elwynn Forest,73.973,72.179,30 >> 向东前往 |cRXP_FRIENDLY_卫兵托马斯|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_卫兵托马斯|r
    .goto Elwynn Forest,73.973,72.179
    .turnin 35 >> 交任务: 卫兵托马斯
    .target 卫兵托马斯
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_卫兵托马斯|r
    .target 卫兵托马斯
    .goto Elwynn Forest,73.973,72.179
    .accept 37 >> 接任务: 失踪的卫兵
    .accept 52 >> 接任务: 保卫边境
step
    #era
    #completewith Prowlers
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r 和 |cRXP_ENEMY_森林熊幼崽|r
    >>|cRXP_WARN_优先击杀看到的所有 |cRXP_ENEMY_森林熊幼崽|r|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +觅食的灰狼
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +森林熊幼崽
step
    #era
    >>点击地面上的 |cRXP_PICK_被吃掉一半的尸体|r
    .goto Elwynn Forest,72.656,60.334
    .turnin 37 >> 交任务: 失踪的卫兵
    .accept 45 >> 接任务: 罗尔夫的下落
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_管理员莱琳|r
    .target 管理员莱琳
    .goto Elwynn Forest,81.382,66.112
    .accept 5545 >> 接任务: 木材危机
step
    #era
    #completewith Bundles
    >>拾取地上的 |cRXP_LOOT_木柴|r。|cRXP_WARN_它们位于树下|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    #era
    #label Prowlers
    .goto Elwynn Forest,79.80,55.50
    >>点击地面上的 |cRXP_PICK_罗尔夫的尸体|r
    >>|cRXP_WARN_小心，附近的|cRXP_ENEMY_鱼人|r可能会在你点击|r |cRXP_PICK_罗尔夫的尸体|r 时被引来
    >>|cRXP_ENEMY_鱼人强盗|r |cRXP_WARN_会施放|r |T135915:0|t[喝下初级药水] |cRXP_WARN_，为自己恢复 61-68 点生命值|r
    .turnin 45 >> 交任务: 罗尔夫的下落
    .accept 71 >> 接任务: 回复托马斯
step
    #era
    #label Bundles
    .goto Elwynn Forest,76.7,75.6,60,0
    .goto Elwynn Forest,79.7,83.7,60,0
    .goto Elwynn Forest,82.0,76.8,60,0
    .goto Elwynn Forest,76.7,75.6,60,0
    .goto Elwynn Forest,79.7,83.7,60,0
    .goto Elwynn Forest,82.0,76.8,60,0
    .goto Elwynn Forest,86.99,64.83
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r 和 |cRXP_ENEMY_森林熊幼崽|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +觅食的灰狼
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +森林熊幼崽
step
    #era
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4
    >>拾取地上的 |cRXP_LOOT_木柴|r。|cRXP_WARN_它们位于树下|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_管理员莱琳|r
    .target 管理员莱琳
    .goto Elwynn Forest,81.382,66.112
    .turnin 5545 >> 交任务: 木材危机
step
    #era
    #label Bears
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_萨拉·迪博雷恩|r
    .target 萨拉·迪博雷恩
    .goto Elwynn Forest,79.457,68.789
    .accept 83 >> 接任务: 红色亚麻布
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_卫兵托马斯|r
    .target 卫兵托马斯
    .goto Elwynn Forest,73.973,72.179
    .turnin 52 >> 交任务: 保卫边境
    .turnin 71 >> 交任务: 回复托马斯
    .accept 39 >> 接任务: 托马斯的报告
    .accept 109 >> 接任务: 向格里安·斯托曼报到
step
    #completewith Deed
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r, 搜刮 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r]
    .use 1972>>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] 开启任务|r
    >>|cRXP_WARN_这个|r |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] |cRXP_WARN_掉率很低；如果没拿到，就忽略这一步|r
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >> 接任务: 法布隆的地契
step << Warlock
    .isOnQuest 147
    .goto Elwynn Forest,71.10,80.66
    >>击杀 |cRXP_ENEMY_苏伦娜·凯尔东|r，拾取她的 |cRXP_LOOT_苏伦娜的项圈|r
    >>击杀 |cRXP_ENEMY_收货人莫根|r，拾取 |cRXP_LOOT_收货人的戒指|r
    >>|cRXP_WARN_集中火力，迅速击杀 |cRXP_ENEMY_苏伦娜·凯尔东|r|r
    >>|cRXP_WARN_施放|r |T136183:0|t[恐惧术] |cRXP_WARN_持续控制 |cRXP_ENEMY_收货人莫根|r|r
    .complete 1688,1 --Surena's Choker (1)
    .mob +苏伦娜·凯尔东
    .complete 147,1 -- The Collector's Ring (1)
    .mob +收货人莫根
step << Warlock
    .goto Elwynn Forest,71.10,80.66
    >>击杀 |cRXP_ENEMY_苏伦娜·凯尔东|r，拾取她的 |cRXP_LOOT_苏伦娜的项圈|r
    >>|cRXP_WARN_集中火力，迅速击杀 |cRXP_ENEMY_苏伦娜·凯尔东|r|r
    >>|cRXP_WARN_施放|r |T136183:0|t[恐惧术] |cRXP_WARN_持续控制 |cRXP_ENEMY_收货人莫根|r|r
    .complete 1688,1 --Surena's Choker (1)
    .mob 苏伦娜·凯尔东
step
    #era
    #completewith next
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r，拾取他们的 |cRXP_LOOT_红色亚麻头巾|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .mob 迪菲亚强盗
    .isOnQuest 83
step
    .goto Elwynn Forest,69.3,79.0
    >>击杀 |cRXP_ENEMY_公主|r，拾取它的 |cRXP_LOOT_黄铜项圈|r
    >>|cRXP_ENEMY_公主|r |cRXP_WARN_会与两只|r |cRXP_ENEMY_公主的随从|r 一起进入战斗
    >>|cRXP_ENEMY_公主|r |cRXP_WARN_还会施放|r |T132368:0|t[急速冲锋] |cRXP_WARN_，造成高额伤害|r
    .complete 88,1
    .mob 公主
step
    #era
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r，拾取他们的 |cRXP_LOOT_红色亚麻头巾|r
    .goto Elwynn Forest,70.5,77.6,60,0
    .goto Elwynn Forest,68.1,77.5,60,0
    .goto Elwynn Forest,68.2,81.4,60,0
    .goto Elwynn Forest,70.8,80.9,60,0
    .goto Elwynn Forest,70.5,77.6,60,0
    .goto Elwynn Forest,68.1,77.5,60,0
    .goto Elwynn Forest,68.2,81.4,60,0
    .goto Elwynn Forest,70.8,80.9,60,0
    .goto Elwynn Forest,70.5,77.6,60,0
    .goto Elwynn Forest,68.1,77.5,60,0
    .goto Elwynn Forest,68.2,81.4,60,0
    .goto Elwynn Forest,70.8,80.9,60,0
    .goto Elwynn Forest,69.3,79.0
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .mob 迪菲亚强盗
    .isOnQuest 83
step
    #era
    #softcore
    #sticky
    #completewith next
    .deathskip >>如果生命值较低，就通过死亡在灵魂医者处复活；否则直接跑回去交任务
    .target 灵魂医者
step
    #label Deed
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_萨拉·迪博雷恩|r
    .target 萨拉·迪博雷恩
    .goto Elwynn Forest,79.457,68.789
    .turnin 83 >> 交任务: 红色亚麻布
    .isQuestComplete 83
step
    #completewith next
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >> 前往赤脊山
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .target 卫兵帕克
    .goto Redridge Mountains,17.4,69.6
    .accept 244 >> 接任务: 豺狼人的入侵
step
    .goto Redridge Mountains,30.733,59.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_菲尔顿副队长|r
    >>|cRXP_WARN_路上小心高等级怪|r
    .turnin 244 >> 交任务: 豺狼人的入侵
    .target 菲尔顿副队长
step
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
    .fp Redridge Mountains >> 获取赤脊山飞行点
    .fly Stormwind >> 飞往暴风城
    .target 艾蕾娜·斯托姆法瑟
step
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_摩根·匹斯特|r
    .turnin 61,1 >> 交任务: 送往暴风城的货物
    >>|cRXP_WARN_选择|r |T132383:0|t[爆破火箭] |cRXP_WARN_作为奖励。它能造成可观伤害，也能用于非常实用的“分开拉怪”技巧|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >> |cRXP_WARN_点击此处观看'分开拉怪'的视频参考. 这是一个简短的视频, 对学习非常有帮助|r
    .target 摩根·匹斯特
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拍卖师亚克森|r 交谈
    >>|cRXP_BUY_购买|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_BUY_和/或|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_BUY_，留着稍后提升|r |T133971:0|t[烹饪] |cRXP_BUY_技能|r
    >>|cRXP_WARN_你需要达到50点|r |T133971:0|t[烹饪] |cRXP_WARN_，才能完成稍后在夜色镇接到的任务|r
    >>|cRXP_WARN_如果不想或无法这样做，就跳过此步|r
    >>|cRXP_BUY_购买以下物品，以便稍后在洛克莫丹更快交任务，并提升|r |T133971:0|t[烹饪] |cRXP_BUY_技能：|r
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    >>|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (1-50)
    .disablecheckbox
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (1-50)
    .disablecheckbox
    .target 拍卖师亚克森
    .isQuestAvailable 418
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #ah
    #optional
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拍卖师亚克森|r 交谈
    >>|cRXP_WARN_如果不想或无法这样做，就跳过此步|r
    >>|cRXP_BUY_购买以下物品，以便稍后在洛克莫丹更快交任务：|r
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .target 拍卖师亚克森
    .isQuestAvailable 418
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往 [已宰的羔羊] 术士训练师处并下楼
step << Warlock
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_厄苏拉·德林|r
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_黑暗缚灵者加科因|r
    .turnin 1688 >> 交任务: 苏伦娜·凯尔东
    .accept 1689 >> 接任务: 誓缚
    .target 黑暗缚灵者加科因
step << Warlock
    #completewith next
    .goto StormwindClassic,25.2,80.7,18,0
    .goto StormwindClassic,23.2,79.5,18,0
    .goto StormwindClassic,26.3,79.5,18,0
    .goto StormwindClassic,25.154,77.406
    >>|cRXP_WARN_前往 [已宰的羔羊] 最底层|r
    .cast 7728 >> |cRXP_WARN_使用|r |T133292:0|t[血石颈环] |cRXP_WARN_召唤|r |cRXP_ENEMY_虚空行者|r
    .use 6928
step << Warlock
    .goto StormwindClassic,25.154,77.406
    .use 6928 >> 击杀召唤出的 |cRXP_ENEMY_虚空行者|r
    .complete 1689,1 --Kill Summoned Voidwalker (x1)
    .mob 虚空行者
step << Warlock
    #softcore
    #completewith next
    +返回楼上途中开始施放 |T136126:0|t[生命分流]，同时前往 |cRXP_FRIENDLY_黑暗缚灵者加科因|r处，因为稍后要通过死亡赶路
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_黑暗缚灵者加科因|r
    .target 黑暗缚灵者加科因
    .goto StormwindClassic,25.25,78.59
    .turnin 1689 >> 交任务: 誓缚
step << Warlock
    #softcore
    .deathskip >> 使用 |T136126:0|t[生命分流] 并站在旁边的篝火上自杀, 然后在灵魂医者处复活
    .target 灵魂医者
step
    .goto Elwynn Forest,42.105,65.927
    .zone Elwynn Forest >> 离开暴风城，前往闪金镇
step << Warlock
    #era
    .isOnQuest 147
    .goto Elwynn Forest,42.105,65.927
    .target 治安官杜汉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 147 >> 交任务: 猎杀收货人
    .turnin 39 >> 交任务: 托马斯的报告
step << Warlock
    .isOnQuest 147
    .goto Elwynn Forest,42.105,65.927
    .target 治安官杜汉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 147 >> 交任务: 猎杀收货人
step
    #era
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 39 >> 交任务: 托马斯的报告
    .target 治安官杜汉
step << Warrior
    .goto Elwynn Forest,41.09,65.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_里瑞亚·杜拉克|r 对话
    .target 里瑞亚·杜拉克
    .trainer >> 学习职业技能
step << Mage/Rogue/Priest
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >> 前往旅店二楼
step << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r 对话
    .target 扎尔迪玛·维夫希尔特
    .goto Elwynn Forest,43.25,66.19
    .trainer >> 学习职业技能
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科瑞恩·塞尔留斯|r 对话
    .target 科瑞恩·塞尔留斯
    .goto Elwynn Forest,43.872,65.937
    .trainer >> 学习职业技能
step << Priest
    .goto Elwynn Forest,43.283,65.719
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_女牧师洁塞塔|r 对话
    .target 女牧师洁塞塔
    .trainer >> 学习职业技能
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_斯通菲尔德妈妈|r
    .target 斯通菲尔德妈妈
    .turnin 88 >> 交任务: 公主必须死！
    .goto Elwynn Forest,34.660,84.483
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r
    >>|cRXP_WARN_如果你没有足够的 [大块野猪肉], 请暂时跳过此步|r
    .target 波尼斯·斯通菲尔德姑妈
    .turnin 86 >> 交任务: 比利的馅饼
    .goto Elwynn Forest,34.486,84.252
    .isQuestComplete 86
step
    #sticky
    .abandon 86 >> 放弃<比利的馅饼>
step << Dwarf Paladin
    >>击杀 |cRXP_ENEMY_矮小的河爪豺狼人|r 和 |cRXP_ENEMY_河爪豺狼人前锋|r，拾取 |T132889:0|t[亚麻布]
    >>|cRXP_WARN_确保备有10块|r |T132889:0|t[亚麻布] |cRXP_WARN_，用于即将进行的圣骑士职业任务|r
    .collect 2589,10,1648,1 -- Linen Cloth (10)
    .mob 矮小的河爪豺狼人
    .mob 河爪豺狼人前锋
step
    #completewith WestEntry
    .goto Westfall,59.95,19.35
    .zone Westfall >> 前往西部荒野
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_农夫法布隆|r
    .target 农夫法布隆
    .goto Westfall,59.95,19.35
    .turnin 184 >> 交任务: 法布隆的地契
    .isOnQuest 184
step
    #label WestEntry
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_农夫法布隆|r 和 |cRXP_FRIENDLY_弗娜·法布隆|r
    .accept 64 >> 接任务: 遗失的怀表
    .target +农夫法布隆
    .goto Westfall,59.95,19.35
    .accept 151 >> 接任务: 老马布兰契
    .accept 36 >> 接任务: 杂味炖肉
    .goto Westfall,59.92,19.42
	.target +弗娜·法布隆
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_农夫萨丁|r
    .target 农夫萨丁
    .goto Westfall,56.04,31.23
    .accept 9 >> 接任务: 清理荒野
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_萨尔玛·萨丁|r
    .target 萨尔玛·萨丁
    .goto Westfall,56.40,30.50
    .turnin 36 >> 交任务: 杂味炖肉
    .accept 38 >> 接任务: 杂味炖肉
    .accept 22 >> 接任务: 猪肝馅饼
step
    #softcore
    #sticky
    #completewith next
    .deathskip >> 死亡后在灵魂医者处复活，或跑向哨兵岭
    .target 灵魂医者
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格里安·斯托曼|r
    .target 格里安·斯托曼
    .goto Westfall,56.33,47.52
    .turnin 109 >> 交任务: 向格里安·斯托曼报到
    .accept 12 >> 接任务: 西部荒野人民军
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格里安·斯托曼|r
    .target 格里安·斯托曼
    .goto Westfall,56.33,47.52
    .accept 12 >> 接任务: 西部荒野人民军
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹努文队长|r 交谈
    .target 丹努文队长
    .goto Westfall,56.42,47.62
    .accept 102 >> 接任务: 西部荒野的豺狼人
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_哨兵加里安|r
    .target 哨兵加里安
    .goto Westfall,54.00,53.00
    .accept 153 >> 接任务: 红色皮质面罩
step
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索尔|r
    .fp Sentinel Hill >> 获取哨兵岭飞行点
    .fly Stormwind >> 飞往暴风城 << Dwarf Paladin
    .target 索尔
step << !Paladin
    .hs >> 炉石回洛克莫丹
step << Dwarf Paladin
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    .zone Ironforge >> 进入矿道地铁，乘坐地铁前往铁炉堡
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#era/som--h
#classic
#tbc
#season 0,1
#version 1
<< Alliance !Hunter
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 12-14 Loch Modan (Dwarf/Gnome)
#next 13-15 Westfall;14-16 Darkshore
#defaultfor Gnome/Dwarf
#displayname 12-15 洛克莫丹 << SoD !Warlock
#displayname 13-15 洛克莫丹 << SoD Warlock
#displayname 12-14 洛克莫丹（矮人/侏儒）
step << Rogue
    #xprate >1.49
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_资金足够时，最多购买 2 把|r |T135343:0|t[战士阔剑]|cRXP_BUY_，或从拍卖行购买更便宜／更好的替代品|r
    .collect 2027,1 --Scimitar
    .target 玛尔达·维勒
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    #xprate >1.49
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_资金足够时，最多购买 2 把|r |T135343:0|t[战士阔剑] |cRXP_BUY_|r
    .collect 2027,1 --Scimitar
    .money <0.3815
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 玛尔达·维勒
step << Rogue
    #xprate >1.49
    #optional
    #label Scimitar1
    #completewith KeenT
    +|cRXP_WARN_将|r |T135343:0|t[战士阔剑]|cRXP_WARN_装备在主手|r
    .use 2027
    .itemcount 2027,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << Rogue
    #xprate >1.49
    #optional
    #requires Scimitar1
    #completewith KeenT
    +|cRXP_WARN_将|r |T135343:0|t[战士阔剑]|cRXP_WARN_装备在副手|r
    .use 2027
    .itemcount 2027,2
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << Rogue
    #xprate >1.49
    #optional
    #ah
    .goto StormwindClassic,57.547,57.076
    .goto 1453,53.615,59.767,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_（向他购买）|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的替代品|r
    .collect 851,1 -- Cutlass (1)
    .target 冈瑟尔·维勒
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step << Rogue
    #xprate >1.49
    #optional
    #ssf
    .goto StormwindClassic,57.547,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_（向他购买）|r
    .collect 851,1 -- Cutlass (1)
    .target 冈瑟尔·维勒
    .money <0.2023
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step << Rogue
    #xprate >1.49
    #optional
    #label CutlassE
    #completewith KeenT
    +|cRXP_WARN_将|r |T135346:0|t[斗士短剑]|cRXP_WARN_装备在主手|r
    .use 851
    .itemcount 851,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step << Rogue
    #xprate >1.49
    #optional
    #requires CutlassE
    #completewith KeenT
    +|cRXP_WARN_将|r |T135346:0|t[工匠匕首]|cRXP_WARN_装备在副手|r
    .use 2218
    .itemcount 2218,1
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step << Rogue
    #xprate >1.49
    #optional
    #completewith next
    .goto 1453,57.764,61.412,6 >> 进入日常百货店大楼
step << Rogue
    #xprate >1.49
    #optional
    #label KeenT
    .goto 1453,58.380,61.683
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔曼·穆比|r交谈
    >>|cRXP_BUY_购买|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]|cRXP_BUY_（向他购买）|r
    .collect 3107,200 << !tbc
    .collect 25873,1 << tbc
    .target 萨尔曼·穆比
    .xp <11,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    #xprate >1.49
    #optional
    .goto 1453,58.380,61.683
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔曼·穆比|r交谈
    >>|cRXP_BUY_购买|r |T135641:0|t[平衡飞刀]|cRXP_BUY_（向他购买）|r
    .collect 2946,200 << !tbc
    .collect 25872,1 << tbc
    .target 萨尔曼·穆比
    .xp >11,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #xprate >1.49
    #optional
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]
    .use 3107 << !tbc
    .use 25873 << tbc
    .itemcount 3107,1 << !tbc
    .itemcount 25873,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Rogue
    #xprate >1.49
    #optional
    +|cRXP_WARN_装备|r |T135641:0|t[平衡飞刀]
    .use 2946 << !tbc
    .use 25872 << tbc
    .itemcount 2946,1 << !tbc
    .itemcount 25872,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #xprate <1.5
    #optional
    #completewith SilverMine
    +将保留的 |T135641:0|t[工匠匕首] 装备在主手
    .use 2218
    .itemcount 2218,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step
    #xprate 1.49-1.59
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fp Stormwind >> 开通暴风城飞行路线
    .target 杜加尔·朗德瑞克
step
    #xprate >1.59
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fp Stormwind >> 开通暴风城飞行路线
    .target 杜加尔·朗德瑞克
    .dungeon !DM
step
    #season 0,1 << Paladin
    #xprate >1.49
    .hs >> 炉石回洛克莫丹
    .cooldown item,6948,>180--wait for cd if <3min
    .zoneskip Loch Modan
    .zoneskip Wetlands
step
    #season 0,1 << Paladin
    #xprate >1.49
    #optional
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    .zone Ironforge >> 进入矿道地铁，乘坐地铁前往铁炉堡
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Wetlands
step
    #season 0,1 << Paladin
    #xprate >1.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格莱斯·瑟登|r
    .goto Ironforge,55.501,47.742
    .fly Loch Modan >> 飞往洛克莫丹
    .target 格莱斯·瑟登
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Wetlands
step << Dwarf Paladin
    #xprate <1.5
    #optional
    #completewith next
    .goto 1455,35.239,32.789,20,0
    .goto 1455,27.208,12.552,20,0
    .goto Ironforge,23.131,6.143,12 >>前往 |cRXP_FRIENDLY_布兰度尔·铁锤|r
step << Dwarf Paladin
    #xprate <1.5
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰度尔·铁锤|r交谈
    .accept 2999 >>接受任务 圣洁之书
    .target 布兰度尔·铁锤
step << Dwarf Paladin
    #xprate <1.5
    #optional
    #completewith next
    .goto 1455,25.400,2.676,10,0
    .goto 1455,23.621,2.544,10,0
    .goto 1455,22.014,4.533,10,0
    .goto 1455,21.831,7.651,10,0
    .goto 1455,23.766,11.636,10,0
    .goto 1455,27.622,12.177,12 >> 前往楼上对话 |cRXP_FRIENDLY_蒂萨·热炉|r
step << Dwarf Paladin
    #xprate <1.5
    .goto 1455,27.622,12.177
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与|cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 2999 >>交任务 圣洁之书
    .accept 1645 >>接受任务 圣洁之书
    .turnin 1645 >>交任务 圣洁之书
    .target 蒂萨·热炉
step << Dwarf Paladin
    #xprate <1.5
    .goto 1455,27.622,12.177
    >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_圣洁之书|r]开始任务|r
    .accept 1646 >>接受任务 圣洁之书
    .use 6916
step << Dwarf Paladin
    #xprate <1.5
    .goto 1455,27.622,12.177
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与|cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 1646 >>交任务 圣洁之书
    .accept 1647 >>接受任务 圣洁之书
    .target 蒂萨·热炉
step << Dwarf Paladin
    #xprate <1.5
    #loop
    .line Ironforge,21.750,51.733,22.015,54.945,23.328,61.865,23.723,63.824,26.021,68.382,27.495,71.320,31.352,77.807,32.405,78.563,37.256,82.159,39.204,83.202,42.944,84.113
    .goto 1455,21.750,51.733,0
    .goto 1455,26.021,68.382,0
    .goto 1455,42.944,84.113,0
    .goto 1455,21.750,51.733,20,0
    .goto 1455,22.015,54.945,20,0
    .goto 1455,23.328,61.865,20,0
    .goto 1455,23.723,63.824,20,0
    .goto 1455,26.021,68.382,20,0
    .goto 1455,27.495,71.320,20,0
    .goto 1455,31.352,77.807,20,0
    .goto 1455,32.405,78.563,20,0
    .goto 1455,37.256,82.159,20,0
    .goto 1455,39.204,83.202,20,0
    .goto 1455,42.944,84.113,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_约翰·特纳|r交谈
    >>|cRXP_FRIENDLY_约翰·特纳|r|cRXP_WARN_在铁炉堡外环巡逻，范围从刚过石火旅店的位置延伸到刚过访客中心的位置|r
    .turnin 1647 >>交任务 圣洁之书
    .accept 1648 >>接受任务 圣洁之书
    .turnin 1648 >>交任务 圣洁之书
    .accept 1778 >>接受任务 圣洁之书
    .unitscan 约翰·特纳
step << Dwarf Paladin
    #xprate <1.5
    #optional
    #label Tiza1
    #completewith Tiza2
    .goto 1455,27.228,12.724,15,0
    .goto 1455,25.400,2.676,12 >> 前往 |cRXP_FRIENDLY_蒂萨·热炉|r 下方的楼梯
step << Dwarf Paladin
    #xprate <1.5
    #optional
    #requires Tiza1
    #completewith Tiza2
    .goto 1455,25.400,2.676,10,0
    .goto 1455,23.621,2.544,10,0
    .goto 1455,22.014,4.533,10,0
    .goto 1455,21.831,7.651,10,0
    .goto 1455,23.766,11.636,10,0
    .goto 1455,27.622,12.177,12 >> 前往楼上对话 |cRXP_FRIENDLY_蒂萨·热炉|r
step << Dwarf Paladin
    #xprate <1.5
    #label Tiza2
    .goto 1455,27.622,12.177
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与|cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 1778 >>交任务 圣洁之书
    .accept 1779 >>接受任务 圣洁之书
    .target 蒂萨·热炉
step << Dwarf Paladin
    #xprate <1.5
    .goto Ironforge,23.539,8.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_穆里顿·热炉|r交谈
    .turnin 1779 >>交任务 圣洁之书
    .accept 1783 >>接受任务 圣洁之书
    .target 穆里顿·热炉
step << Paladin
    #xprate <1.5
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fly Loch Modan >> 飞往洛克莫丹
    .target 格莱斯·瑟登
    .zoneskip Ironforge,1
step
    #optional
    .goto Loch Modan,34.828,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_维德拉·壁炉|r
    .turnin 418 >> 交任务：塞尔萨玛血肠
    .target 维德拉·壁炉
    .isQuestComplete 418
step
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雅尼·铁心|r
    .vendor 1682 >> |cRXP_BUY_向她购买|r |T133634:0|t[棕色小包] |cRXP_BUY_（如有需要）|r
    .target 雅尼·铁心
step << !Hunter
    .goto Loch Modan,35.534,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r
    .vendor 6734 >> |cRXP_BUY_购买一些|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_（如有需要）|r << Warrior/Rogue
    .vendor 6734 >> |cRXP_BUY_向她购买一些|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_和|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_（如有需要）|r << !Warrior !Rogue
    .target 旅店老板纳克罗·壁炉
step << Dwarf/Gnome
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.019,47.806
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布洛克·寻石者|r
    .turnin 6392 >> 交任务：向布洛克回复
    .target 布洛克·寻石者
step
    #optional
    #label BoarMeatLoch3
    #completewith SilverMine
    >>击杀|cRXP_ENEMY_山猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 山猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 146 --Stonewrought Dam
    .subzoneskip 149 --Silver Stream Mine
step
    #optional
    #requires BoarMeatLoch3
    #completewith SilverMine
    >>击杀|cRXP_ENEMY_山猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_无需专门刷怪，路过时击杀野猪，并拾取掉落物即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 山猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 146 --Stonewrought Dam
    .subzoneskip 149 --Silver Stream Mine
step
    #optional
    #completewith SilverMine
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
    .subzoneskip 146 --Stonewrought Dam
    .subzoneskip 149 --Silver Stream Mine
step
    #xprate <1.59
    #completewith Gear
    #optional
    #loop
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    .waypoint Loch Modan,37.71,16.84,50,0
    .waypoint Loch Modan,35.48,16.82,50,0
    .waypoint Loch Modan,25.05,30.19,50,0
    .waypoint Loch Modan,26.06,43.44,50,0
    >>击杀|cRXP_ENEMY_坑道鼠|r，拾取|cRXP_LOOT_耳朵|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob 坑道鼠斥候
    .mob 坑道鼠歹徒
    .mob 坑道鼠征粮官
    .mob 坑道鼠地卜师
    .mob 坑道鼠掘地工
    .mob 坑道鼠勘探员
step
    #xprate >1.59
    #completewith Gear
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    .waypoint Loch Modan,37.71,16.84,50,0
    .waypoint Loch Modan,35.48,16.82,50,0
    .waypoint Loch Modan,25.05,30.19,50,0
    .waypoint Loch Modan,26.06,43.44,50,0
    >>击杀|cRXP_ENEMY_坑道鼠|r，拾取|cRXP_LOOT_耳朵|r
    >>|cRXP_WARN_无需专门做此任务，你之后很可能会跳过它|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob 坑道鼠斥候
    .mob 坑道鼠歹徒
    .mob 坑道鼠征粮官
    .mob 坑道鼠地卜师
    .mob 坑道鼠掘地工
    .mob 坑道鼠勘探员
step
    #optional
    #label SilverMine
    #completewith next
    .goto Loch Modan,35.50,18.97,20 >> 进入银泉矿洞
step << Paladin/Warrior/Priest/Mage
    #xprate >1.49 << Mage
    #season 2 << Priest/Mage
    .goto Loch Modan,35.93,22.55
    >>打开矿井内的|cRXP_PICK_矿工联盟的储物箱|r，获取|cRXP_LOOT_矿工装备|r
    .complete 307,1 --Miners' Gear (4)
step << !Paladin !Warrior
    #season 0,1 << Priest/Mage
    #label Gear
    .goto Loch Modan,35.93,22.55
    >>打开矿井内的|cRXP_PICK_矿工联盟的储物箱|r，获取|cRXP_LOOT_矿工装备|r
    .complete 307,1 --Miners' Gear (4)
--XX Gear label location changes depending on Paladin/Warrior vendor, Priest SoD rune, Mage SoD 1.5x+ Runes
step << Paladin/Warrior
    #ssf
    #label Gear
    .goto Loch Modan,42.867,9.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔伦·安德玛|r交谈
    >>|cRXP_BUY_购买|r |T133476:0|t[重型尖刺钉锤]|cRXP_BUY_或|r |T133053:0|t[铁木槌]|cRXP_BUY_（向他购买，若有货）|r
    >>|cRXP_WARN_如果买不起，就在附近的|cRXP_ENEMY_坑道鼠|r身上刷钱，直到攒够为止|r
    >>|cRXP_WARN_尽快操作，以防被其他玩家抢先买走|r
    >>|cRXP_WARN_如果不打算完成这些内容，就跳过此步骤|r
    .collect 4778,1 --Heavy Spiked Mace (1)
    .collect 4777,1 --Ironwood Maul (1)
    .target 尼尔伦·安德玛
    .itemcount 4778,<1 --Heavy Spiked Mace (<1)
    .itemcount 4777,<1 --Ironwood Maul (<1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Paladin/Warrior
    #ah
    #label Gear
    .goto Loch Modan,42.867,9.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔伦·安德玛|r交谈
    >>|cRXP_BUY_购买|r |T133476:0|t[重型尖刺钉锤]|cRXP_BUY_或|r |T133053:0|t[铁木槌]|cRXP_BUY_（向他购买，若有货）|r
    >>|cRXP_WARN_如果买不起，就在附近的|cRXP_ENEMY_坑道鼠|r身上刷钱，直到攒够为止|r
    >>|cRXP_WARN_尽快操作，以防被其他玩家抢先买走|r
    >>|cRXP_WARN_如果不想这么做，或者想稍后去拍卖行买把更便宜或更好的武器，就跳过此步骤|r
    .collect 4778,1 --Heavy Spiked Mace (1)
    .collect 4777,1 --Ironwood Maul (1)
    .target 尼尔伦·安德玛
    .itemcount 4778,<1 --Heavy Spiked Mace (<1)
    .itemcount 4777,<1 --Ironwood Maul (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Paladin/Warrior
    #optional
    #completewith PawsDelivery
    +|cRXP_WARN_装备|r |T133476:0|t[重型尖刺钉锤]
    .use 4778
    .itemcount 4778,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp <14,1
step << Paladin/Warrior
    #optional
    #completewith PawsDelivery
    +|cRXP_WARN_装备|r |T133053:0|t[铁木槌]
    .use 4777
    .itemcount 4777,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7
    .xp <13,1
step
    #xprate >1.59
    #loop
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82,50,0
    .goto Loch Modan,25.05,30.19,50,0
    .goto Loch Modan,26.06,43.44,50,0
    >>击杀|cRXP_ENEMY_坑道鼠|r，拾取|cRXP_LOOT_耳朵|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob 坑道鼠斥候
    .mob 坑道鼠歹徒
    .mob 坑道鼠征粮官
    .mob 坑道鼠地卜师
    .mob 坑道鼠掘地工
    .mob 坑道鼠勘探员
    .itemcount 3110,8 --Tunnel Rat Ear (8)
step
    #xprate <1.59
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82,50,0
    .goto Loch Modan,25.05,30.19,50,0
    .goto Loch Modan,26.06,43.44,50,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82
    >>击杀|cRXP_ENEMY_坑道鼠|r，拾取|cRXP_LOOT_耳朵|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob 坑道鼠斥候
    .mob 坑道鼠歹徒
    .mob 坑道鼠征粮官
    .mob 坑道鼠地卜师
    .mob 坑道鼠掘地工
    .mob 坑道鼠勘探员
step
    #optional
    #label BoarMeatLoch4
    #completewith PawsDelivery
    >>击杀|cRXP_ENEMY_山猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 山猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 925 --Algaz Station
step
    #optional
    #requires BoarMeatLoch4
    #completewith PawsDelivery
    >>击杀|cRXP_ENEMY_山猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_无需专门刷怪，路过时击杀野猪，并拾取掉落物即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 山猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 925 --Algaz Station
step
    #optional
    #completewith PawsDelivery
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
    .subzoneskip 925 --Algaz Station
step
    #optional
    #completewith next
    .goto 1432,23.490,18.008,15,0
    .goto 1432,24.279,17.959,12 >> 进入掩体
step
    #optional
    #completewith next
    .goto Loch Modan,24.134,18.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高索·布鲁姆|r交谈
    .vendor 1362 >>|cRXP_WARN_如有需要，出售杂物并修理装备|r
    .target 高索·布鲁姆
step
    #label PawsDelivery
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r
    .turnin 307 >> 交任务：肮脏的爪子
    .turnin 353 >> 交任务：雷矛的包裹
    .target 巡山人卡尔·雷矛
step
    #optional
    #label BoarMeatLoch5
    #completewith FlintTinder
    >>击杀|cRXP_ENEMY_山猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 山猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 144 --Thelsamar
    .subzoneskip 925 --Algaz Station
step
    #optional
    #requires BoarMeatLoch5
    #completewith FlintTinder
    >>击杀|cRXP_ENEMY_山猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_无需专门刷怪，路过时击杀野猪，并拾取掉落物即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 山猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 144 --Thelsamar
    .subzoneskip 925 --Algaz Station
step
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3173,3,418,1 --Bear Meat (3)
    .mob +老黑熊
    .goto Loch Modan,26.9,10.7,90,0
    .goto Loch Modan,30.9,10.6,90,0
    .goto Loch Modan,28.6,15.4,90,0
    .goto Loch Modan,30.5,26.6,90,0
    .goto Loch Modan,33.4,30.3,90,0
    .goto Loch Modan,39.4,33.3,90,0
    .goto Loch Modan,26.9,10.7,90,0
    .goto Loch Modan,30.9,10.6,90,0
    .goto Loch Modan,28.6,15.4,90,0
    .goto Loch Modan,30.5,26.6,90,0
    .goto Loch Modan,33.4,30.3,90,0
    .goto Loch Modan,39.4,33.3,90,0
    .goto Loch Modan,26.9,10.7
    .collect 3172,3,418,1 --Boar Intestines (3)
    .mob +山猪
    .goto Loch Modan,38.0,34.9,90,0
    .goto Loch Modan,37.1,39.8,90,0
    .goto Loch Modan,29.8,35.9,90,0
    .goto Loch Modan,27.7,25.3,90,0
    .goto Loch Modan,28.6,22.6,90,0
    .goto Loch Modan,38.0,34.9,90,0
    .goto Loch Modan,37.1,39.8,90,0
    .goto Loch Modan,29.8,35.9,90,0
    .goto Loch Modan,27.7,25.3,90,0
    .goto Loch Modan,28.6,22.6,90,0
    .goto Loch Modan,38.0,34.9
    .collect 3174,3,418,1 --Spider Ichor (3)
    .mob +森林潜伏者
    .goto Loch Modan,31.9,16.4,90,0
    .goto Loch Modan,28.0,20.6,90,0
    .goto Loch Modan,33.8,40.5,90,0
    .goto Loch Modan,36.2,30.9,90,0
    .goto Loch Modan,39.0,32.1,90,0
    .goto Loch Modan,31.9,16.4,90,0
    .goto Loch Modan,28.0,20.6,90,0
    .goto Loch Modan,33.8,40.5,90,0
    .goto Loch Modan,36.2,30.9,90,0
    .goto Loch Modan,39.0,32.1,90,0
    .goto Loch Modan,31.9,16.4
step
    #xprate <1.59
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人卡德雷尔|r
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_沿穿过塞尔萨玛的道路巡逻|r
    .target 巡山人卡德雷尔
    .turnin 416 >> 交任务：狗头人的耳朵
step
    #xprate >1.59
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人卡德雷尔|r
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_沿穿过塞尔萨玛的道路巡逻|r
    .target 巡山人卡德雷尔
    .turnin 416 >> 交任务：狗头人的耳朵
    .isQuestComplete 416
step
    #xprate >1.59
    #optional
    #sticky
    #label RatAbandon
    .abandon 416 >> 放弃任务：狗头人的耳朵
step
    #optional
    #completewith FlintTinder
    .goto 1432,35.273,47.750,10,0
    .goto 1432,35.433,48.243,12 >> 进入烈酒旅店
step
    .goto Loch Modan,34.828,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_维德拉·壁炉|r
    .turnin 418 >> 交任务：塞尔萨玛血肠
    .target 维德拉·壁炉
step << !Dwarf/!Paladin --XX Dwarf palas need to do class q
    #season 0,1 << Warrior/Mage --SoD warriors and mages need to do rune (Quick Strike, Living Bomb)
    #optional
    #sticky
    #label DefenseAbandon
    .abandon 224 >> 放弃<保卫国王的领土>
    .xp <14,1
step << !Dwarf/!Paladin
    #season 0,1 << Warrior/Mage
    #optional
    #sticky
    #label TroggAbandon
    .abandon 267 >> 放弃任务: 穴居人的威胁
    .xp <14,1
step
    #label FlintTinder
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尼·铁心|r交谈
    >>|cRXP_BUY_购买一捆|r |T135435:0|t[普通木柴]|cRXP_BUY_和一块|r |T135237:0|t[燧石和火绒]|cRXP_BUY_（向她购买）|r
    >>|cRXP_WARN_这些材料可用于在船上或地铁上制作|r |T135805:0|t[基础营火]|cRXP_WARN_，借此提升|r |T133971:0|t[烹饪]|cRXP_WARN_技能，不浪费时间|r
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .target 雅尼·铁心
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step << !Dwarf/!Paladin
    #optional
    #requires DefenseAbandon
--XXREQ Placeholder invis step until multiple requires per step
step << !Dwarf/!Paladin
    #optional
    #requires TroggAbandon
--XXREQ Placeholder invis step until multiple requires per step
step
    #season 0,1 << Warrior/Mage
    .goto Loch Modan,26.67,56.94
    >>击杀|cRXP_ENEMY_碎石穴居人|r和|cRXP_ENEMY_碎石怪斥候|r，拾取|cRXP_LOOT_穴居人的石牙|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_碎石怪斥候|r会施放|r |T132222:0|t[射击]|cRXP_WARN_（远程施法：造成14-20点伤害）|r
    >>|cRXP_WARN_这里的怪物刷新很快，应该无需离开此处|r
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .mob +碎石穴居人
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .mob +碎石怪斥候
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob +碎石穴居人
    .mob +碎石怪斥候
    .isOnQuest 224
    .isOnQuest 267
step
    #season 0,1 << Warrior/Mage
    #xprate <1.5
    #optional
    .goto Loch Modan,26.67,56.94
    .xp 13+9600 >> 刷怪至 9600+/11400 经验值
step
    #season 0,1 << Warrior
    #xprate 1.49-1.59
    #optional
    .goto Loch Modan,26.67,56.94
    .xp 13+8700 >> 刷怪至 8700+/11400 经验值
step
    #season 0,1 << Warrior
    #xprate >1.59
    #optional
    .goto Loch Modan,26.67,56.94
    .xp 13+7800 >> 刷怪至 7800+/11400 经验值
step
    #optional
    #completewith next
    .goto Loch Modan,24.78,70.17,10,0
    .goto Loch Modan,23.73,75.52,15 >> 沿着土路跑上去, 然后向下跳进碉堡里
step
    #label TroggEnd
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拉格弗斯上尉|r，在碉堡内
    .turnin 267 >> 交任务：穴居人的威胁
    .target 拉格弗斯上尉
    .isQuestComplete 267 << !Dwarf/!Paladin
step
    .goto Loch Modan,22.071,73.127
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人库伯弗林特|r
    .turnin 224 >> 交任务：保卫国王的领土
    .target 巡山人库伯弗林特
    .isQuestComplete 224 << !Dwarf/!Paladin
step << !Dwarf/!Paladin
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索格拉姆·伯雷森|r
    .fly Ironforge>> 飞往铁炉堡
    .target 索格拉姆·伯雷森
step << Dwarf Paladin
    #optional
    #completewith next
    .goto 1432,21.498,67.840,20,0
    .goto 1432,21.388,66.357,20,0
    .goto 1432,21.106,65.007,20,0
    .goto 1432,20.749,64.326,20,0
    .goto 1432,19.594,62.735,20,0
    .goto 1432,16.342,58.520,20,0
    .goto 1426,84.262,51.367
    .zone Dun Morogh >> 前往丹莫罗
step << Dwarf Paladin
    #completewith next
    .goto Dun Morogh,78.321,58.088
    .cast 8593 >>|cRXP_WARN_使用|r |T133439:0|t[生命符记]|cRXP_WARN_对倒在地上的|cRXP_FRIENDLY_纳姆·法奥克|r施放|r
	.use 6866
	.target 纳姆·法奥克
step << Dwarf Paladin
    .goto Dun Morogh,78.321,58.088
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆·法奥克|r交谈
    .turnin 1783 >>交任务 圣洁之书
    .accept 1784 >>接受任务 圣洁之书
    .use 6866
    .target 纳姆·法奥克
step << Dwarf Paladin
    .goto Dun Morogh,77.3,60.5,20,0
    .goto Dun Morogh,77.83,61.78
    >>击杀|cRXP_ENEMY_黑铁间谍|r，拾取|cRXP_LOOT_黑铁手稿|r
    .complete 1784,1 --Dark Iron Script (1)
    .mob 黑铁间谍
----Start of <1.5x IF->Westfall Section----
step << Mage/Priest/Warlock
    #xprate <1.5
    #ssf
    .goto Ironforge,22.837,17.094,8,0
    .goto Ironforge,21.131,17.276,5,0
    .goto Ironforge,23.135,15.936
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_哈瑞克·石鼓|r交谈
    >>|cRXP_WARN_购买一把|r |T135468:0|t[烟尘魔杖]|cRXP_WARN_（向他购买）|r
    >>|cRXP_WARN_烟尘魔杖需要15级才能装备；尚未15级时先留在背包中|r
    .collect 5208,1 --Smoldering Wand (1)
    .target 哈瑞克·石鼓
    .money <0.3340
    .itemcount 11288,<1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
step << Mage/Priest/Warlock
    #xprate <1.5
    #ssf
    #optional
    #completewith Deeprun
    +装备 |T135468:0|t[烟尘魔杖]
    .use 5208
    .itemcount 5208,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp <15,1
step << Mage
    #xprate <1.5
    .goto Ironforge,27.18,8.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丁克|r
    .trainer >> 学习职业技能
    .target 丁克
step << Priest
    #xprate <1.5
    .goto Ironforge,25.207,10.756
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_托德雷·铁矿|r
    .trainer >> 学习职业技能
    .target 托德雷·铁矿
step << skip --logout skip << Mage/Priest
    #xprate <1.5
    #optional
    #completewith Deeprun
    .goto 1455,27.611,8.074
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳上|cRXP_FRIENDLY_彬克|r上方的柱顶，稍向东走到箭头位置，调整角色直到看起来像在漂浮，然后登出再登入执行登出跳点|r
step << Dwarf Rogue/Gnome Rogue
    #xprate <1.5
    #season 0,1
    #optional
    #sticky
    #label Salvation
    .goto Ironforge,51.958,14.838
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_霍夫丹·黑须|r，在楼下
    .turnin 2218 >> 交任务：救赎之路
    .target 霍夫丹·黑须
    .isOnQuest 2218
step << Rogue
    #xprate <1.5
    .goto Ironforge,51.495,15.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_芬斯维克|r
    .trainer >> 学习职业技能
    .target 芬斯维克
step << Warlock
    #xprate <1.5
    .goto Ironforge,51.1,8.7,15,0
    .goto Ironforge,50.343,5.657
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布瑞尔索恩|r
    .trainer >> 学习职业技能
    .target 布瑞尔索恩
step << Warlock/Rogue
    #xprate <1.5
    #optional
    #label Jubahl
    #requires Salvation << Dwarf Rogue/Gnome Rogue
    #completewith Deeprun
    .goto 1455,53.164,7.037,10 >> 进入 |cRXP_FRIENDLY_寻尸者祖贝尔|r 的房子
step << Warlock
    #xprate <1.5
    .goto Ironforge,52.701,6.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_寻尸者祖贝尔|r
    .vendor 6382 >> |cRXP_BUY_购买|r |T133738:0|t[魔典：吞噬暗影（等级 1）] |cRXP_BUY_和|r |T133738:0|t[魔典：牺牲（等级 1）] |cRXP_BUY_（如果买得起）|r
    .target 寻尸者祖贝尔
step << skip --logout skip << Warlock/Rogue
    #xprate <1.5
    #optional
    #requires Jubahl
    #completewith Deeprun
    .goto 1455,52.825,5.060
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶，然后跳到书架顶。通过退出再重新登录完成登出跳点|r
step << Warrior
    #xprate <1.5
    #optional
    #completewith Deeprun
    .goto 1455,67.400,84.909,15,0
    .goto Ironforge,65.905,88.405,12 >> 前往对话 |cRXP_FRIENDLY_比尔班·飞钳|r
step << Warrior
    #xprate <1.5
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_比尔班·飞钳|r
    .trainer >> 学习职业技能
    .target 比尔班·飞钳
step << skip --logout skip << Warrior
    #xprate <1.5
    #optional
    #completewith Deeprun
    .goto 1455,68.198,89.713
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到武器架顶部，然后登出并重新登录以执行登出跳点|r
-- step << skip --logout skip << Hunter
--  #xprate <1.5
--   #optional
--   #completewith Deeprun
--   .goto 1455,56.207,46.844
--   .goto 1455,76.414,51.226,20 >>|cRXP_WARN_Jump on top of the Gryphon's Head. Perform a Logout Skip by logging out and back in|r
--  .zoneskip Ironforge,1
step << !Paladin
    #xprate <1.5
    #requires Salvation << Dwarf Rogue/Gnome Rogue
    #completewith Fly2WF
    .goto 1455,67.842,42.456
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_考格斯宾|r
    .vendor 5175 >> |cRXP_WARN_购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_（若有货，向他购买）|r
--    >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 考格斯宾
    .subzoneskip 2257
step << !Paladin
    #xprate <1.5
    #optional
    #requires Salvation << Dwarf Rogue/Gnome Rogue
    #label Deeprun
    .goto Ironforge,78.00,51.40
    .subzone 2257 >>进入矿道地铁
    .zoneskip Stormwind City
step << !Paladin
    #xprate <1.5
    #optional
    #label WestfallTramCook1
    #completewith WestfallTramEnd
    >>|cRXP_WARN_矿道地铁抵达后，在车上：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火]|cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Stormwind City
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step << !Paladin
    #xprate <1.5
    #optional
    #requires WestfallTramCook1
    #label WestfallTramCook2
    #completewith WestfallTramEnd
    >>|cRXP_WARN_矿道地铁抵达后，在车上：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火]|cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Stormwind City
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step << !Paladin
    #xprate <1.5
    #optional
    #requires WestfallTramCook2
    #label WestfallTramCook3
    #completewith WestfallTramEnd
    >>|cRXP_WARN_矿道地铁抵达后，在车上：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火]|cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Stormwind City
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step << !Paladin
    #xprate <1.5
    #optional
    #requires WestfallTramCook3
    #label WestfallTramCook4
    #completewith WestfallTramEnd
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_以下物品：|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Stormwind City
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step << !Paladin
    #xprate <1.5
    #optional
    #requires WestfallTramCook4
    #label WestfallTramCook5
    #completewith WestfallTramEnd
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Stormwind City
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step << !Paladin
    #xprate <1.5
    #optional
    #requires WestfallTramCook5
    #label WestfallTramCook6
    #completewith WestfallTramEnd
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    .usespell 2550
    .zoneskip Stormwind City
    .itemcount 769,1 --Chunk of Boar Meat (1)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step << !Paladin
    #xprate <1.5
    #optional
    #label WestfallTramEnd
    >>|cRXP_WARN_提升你的|r |T135966:0|t[急救] |cRXP_WARN_，可在等前往暴风城的地铁时练习（如有需要）|r << Rogue/Warrior/Paladin
    >>|cRXP_WARN_你需要将|r |T135966:0|t[急救] |cRXP_WARN_提升至80点，以便完成24级的一个任务|r << Rogue !Dwarf
    .zone Stormwind City >> 乘坐矿道地铁前往暴风城
step << Dwarf Paladin
    #xprate <1.5
	#completewith PaladinTrainSW
    .hs >> 炉石回暴风城
step << Paladin
    #xprate <1.5
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_BUY_购买|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_BUY_和/或|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_BUY_，用于稍后提升|r |T133971:0|t[烹饪]|cRXP_BUY_技能|r
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以便之后在夜色镇完成一个任务|r
    >>|cRXP_WARN_不打算或无法完成时，可跳过此步骤|r
    >>|cRXP_BUY_请尽快购买以下物品，以便稍后在西部荒野和黑海岸更快交任务：|r
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝]
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    >>|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- Okra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (1-50)
    .disablecheckbox
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (1-50)
    .disablecheckbox
    .target 拍卖师亚克森
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step << Paladin
    #xprate <1.5
    #ah
    #optional
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_WARN_不打算或无法完成时，可跳过此步骤|r
    >>|cRXP_BUY_请尽快购买以下物品，以便稍后在西部荒野和黑海岸更快交任务：|r
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝]
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- Okra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target 拍卖师亚克森
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
step << Paladin
    #xprate <1.5
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >> 前往 [暴风城大教堂]
step << Paladin
    #xprate <1.5
    #label PaladinTrainSW
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_虔诚的亚瑟|r
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
step << Paladin
    #xprate <1.5
    .goto StormwindClassic,49.194,30.284
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r
    .accept 399 >> 接任务：童年的记忆
    .target 巴隆斯·阿历克斯顿
step
    #xprate <1.5
    #completewith Fly2WF
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_比利巴布·旋轮|r
    .vendor 5519 >> |cRXP_WARN_购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_（若有货，向他购买）|r
--    >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 比利巴布·旋轮
step << !Paladin
    #xprate <1.5
    .goto StormwindClassic,49.194,30.284
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r
    .accept 399 >> 接任务：童年的记忆
    .target 巴隆斯·阿历克斯顿
step << Rogue
    #xprate <1.5
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买最多 2 把|r |T135343:0|t[战士阔剑]|cRXP_BUY_（向她购买，如果买得起），或从拍卖行购买更好的武器|r
    .collect 2027,1 --Scimitar
    .target 玛尔达·维勒
    .money <0.3815
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    #xprate <1.5
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买最多 2 把|r |T135343:0|t[战士阔剑]|cRXP_BUY_（向她购买，如果买得起）|r
    .collect 2027,1 --Scimitar
    .money <0.3815
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 玛尔达·维勒
step << Rogue
    #xprate <1.5
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.69
    .xp <14,1
step << Mage/Priest/Warlock
    #xprate <1.5
    #ah
    #sticky
    #label Wand1
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_BUY_资金足够时，购买一把|r |T135144:0|t[强效魔法杖] |cRXP_BUY_|r
    >>|cRXP_WARN_不打算或无法完成时，可跳过此步骤|r
    .collect 11288,1 --Greater Magic Wand (1)
    .target 拍卖师亚克森
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.5
step << !Paladin
    #xprate <1.5
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_BUY_购买|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_BUY_和/或|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_BUY_，用于稍后提升|r |T133971:0|t[烹饪]|cRXP_BUY_技能|r
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以便之后在夜色镇完成一个任务|r
    >>|cRXP_WARN_不打算或无法完成时，可跳过此步骤|r
    >>|cRXP_BUY_请尽快购买以下物品，以便稍后在西部荒野和黑海岸更快交任务：|r
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝]
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    >>|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- Okra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (1-50)
    .disablecheckbox
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (1-50)
    .disablecheckbox
    .target 拍卖师亚克森
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step << !Paladin
    #xprate <1.5
    #ah
    #optional
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_WARN_不打算或无法完成时，可跳过此步骤|r
    >>|cRXP_BUY_请尽快购买以下物品，以便稍后在西部荒野和黑海岸更快交任务：|r
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝]
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- Okra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target 拍卖师亚克森
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
    --XX on <1.5 Gnomes/dwarves dont go back to capital cities to train (can't buy groupers/strider meat some other time)
step << Mage/Priest/Warlock
    #xprate <1.5
    #ah
    #requires Wand1
    #optional
    +|cRXP_WARN_装备|r |T135144:0|t[强效魔法杖]
    .use 11288
    .itemcount 11288,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.49
step << Mage/Priest/Warlock
    #xprate <1.5
    #ah
    #optional
    +|cRXP_WARN_装备|r |T135144:0|t[强效魔法杖]
    .use 11288
    .itemcount 11288,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.49
step << Mage/Priest/Warlock
    #xprate <1.5
    #ah
    #optional
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    >>|cRXP_WARN_购买一把|r |T135468:0|t[烟尘魔杖]|cRXP_WARN_（向她购买）|r
    >>|cRXP_WARN_烟尘魔杖需要15级才能装备；尚未15级时先留在背包中|r
    .collect 5208,1 --Smoldering Wand (1)
    .target 阿德温·凯伦
    .money <0.3340
    .itemcount 11288,<1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
--XX If you didn't buy a Greater Magic when you had the chance (1x only)
step << Mage/Priest/Warlock
    #xprate <1.5
    #ah
    #optional
    +|cRXP_WARN_装备|r |T135468:0|t[烟尘魔杖]
    .use 5208
    .itemcount 5208,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp <15,1
step
    #xprate <1.5
    #label Fly2WF
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克
----End of <1.5x IF->Westfall Section----
----Start of >1.5x+ IF->Darkshore Section----
step << skip --logout skip << Dwarf Paladin
    #xprate >1.49
    .goto Dun Morogh,70.66,56.70,40,0
    .goto Dun Morogh,70.60,54.87
    .zone Ironforge >>在矿洞内登出并重新登录，利用登出跳点返回铁炉堡
    .link https://www.youtube.com/watch?v=kbUSo62CfAM >> 点击此处查看示范
step << Dwarf Paladin
    #xprate >1.49
    .goto Dun Morogh,53.042,35.383,40,0
    .goto Ironforge,14.90,87.10,40,0
    .zone Ironforge >> 返回铁炉堡，交付圣洁之书任务
    .zoneskip Ironforge
step << Dwarf Rogue/Gnome Rogue
    #xprate 1.49-1.59
    #season 0,1
    #optional
    #sticky
    #label Salvation
    .goto Ironforge,51.958,14.838
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_霍夫丹·黑须|r，在楼下
    .turnin 2218 >> 交任务：救赎之路
    .target 霍夫丹·黑须
    .isOnQuest 2218
step << Rogue
    #xprate >1.49
    .goto Ironforge,51.495,15.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_芬斯维克|r
    .trainer >> 学习职业技能
    .target 芬斯维克
step << Rogue
    #xprate >1.49
    #optional
    #requires Salvation
step << Warlock
    #xprate >1.49
    .goto Ironforge,51.1,8.7,15,0
    .goto Ironforge,50.343,5.657
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布瑞尔索恩|r
    .trainer >> 学习职业技能
    .target 布瑞尔索恩
step << Warlock
    #xprate >1.49
    #optional
    #label Jubahl
    #completewith next
    .goto 1455,53.164,7.037,10 >> 进入 |cRXP_FRIENDLY_寻尸者祖贝尔|r 的房子
step << Warlock
    #xprate >1.49
    .goto Ironforge,52.701,6.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_寻尸者祖贝尔|r
    .vendor 6382 >> |cRXP_BUY_购买|r |T133738:0|t[魔典：吞噬暗影（等级 1）] |cRXP_BUY_和|r |T133738:0|t[魔典：牺牲（等级 1）] |cRXP_BUY_（如果买得起）|r
    .target 寻尸者祖贝尔
step << Dwarf Paladin
    #xprate >1.49
    #optional
    #completewith next
    .goto 1455,25.400,2.676,10,0
    .goto 1455,23.621,2.544,10,0
    .goto 1455,22.014,4.533,10,0
    .goto 1455,21.831,7.651,10,0
    .goto 1455,23.766,11.636,10 >> 前往楼上对话 |cRXP_FRIENDLY_穆里顿·热炉|r
step << Dwarf Paladin
    #xprate >1.49
    .goto Ironforge,23.539,8.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_穆里顿·热炉|r交谈
    .turnin 1784 >>交任务 圣洁之书
    .accept 1785 >>接受任务 圣洁之书
    .target 穆里顿·热炉
step << Dwarf Paladin
    #xprate >1.49
    .goto Ironforge,27.63,12.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与|cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 1785 >>交任务 圣洁之书
    .target 蒂萨·热炉
step << Paladin
    #xprate >1.49
    .goto Ironforge,24.55,4.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_贝尔杜克·凝眉|r
    .trainer >> 学习职业技能
    .target 贝尔杜克·凝眉
step << skip --logout skip << Paladin
    #xprate >1.49
    #ssf
    #hardcore << !Human
    #optional
    .goto 1455,25.254,10.981
    .zone Dun Morogh >>|cRXP_WARN_跳到|cRXP_FRIENDLY_托德雷·铁矿|r上方的柱顶，调整站位直到角色看似漂浮，再登出并重新登录以执行登出跳点|r
step << Mage
    #xprate >1.49
    .goto Ironforge,27.18,8.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丁克|r
    .trainer >> 学习职业技能
    .target 丁克
step << Priest
    #xprate >1.49
    .goto Ironforge,25.207,10.756
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_托德雷·铁矿|r
    .trainer >> 学习职业技能
    .target 托德雷·铁矿
step << Mage/Priest/Warlock
    #xprate >1.49
    #ssf
    .goto Ironforge,22.837,17.094,8,0
    .goto Ironforge,21.131,17.276,5,0
    .goto Ironforge,23.135,15.936
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_哈瑞克·石鼓|r交谈
    >>|cRXP_WARN_购买一把|r |T135468:0|t[烟尘魔杖]|cRXP_WARN_（向他购买）|r
    >>|cRXP_WARN_烟尘魔杖需要15级才能装备；尚未15级时先留在背包中|r
    .collect 5208,1 --Smoldering Wand (1)
    .target 哈瑞克·石鼓
    .money <0.3340
    .itemcount 11288,<1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
step << Mage/Priest/Warlock
    #xprate >1.49
    #ssf
    #optional
    #completewith DarkshoreBoat
    +装备 |T135468:0|t[烟尘魔杖]
    .use 5208
    .itemcount 5208,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp <15,1
step << Warrior
    #xprate >1.49
    #optional
    #completewith next
    .goto 1455,67.400,84.909,15,0
    .goto Ironforge,65.905,88.405,12 >> 前往对话 |cRXP_FRIENDLY_比尔班·飞钳|r
step << Warrior
    #xprate >1.49
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_比尔班·飞钳|r
    .trainer >> 学习职业技能
    .target 比尔班·飞钳
step << Warrior
    #xprate >1.49
    #optional
    .goto Ironforge,62.0,89.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克斯|r交谈
    .train 2567 >>学习[投掷]
    .target 比克斯
step << skip --logout skip << Warrior
    #xprate >1.49
    #optional
    #ssf
    #hardcore << !Human
    #completewith next
    .goto 1455,48.046,83.707
    >>|cRXP_WARN_走到航点箭头上方金属地板的边缘|r
    .zone Dun Morogh >>|cRXP_WARN_调整角色位置直到看起来像在漂浮，然后登出再登入执行登出跳点|r
    .zoneskip Ironforge,1
step << Rogue
    #xprate >1.49
    #ah
    .goto 1455,35.969,65.346
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_格雷尼尔·钢怒|r交谈
    >>|cRXP_BUY_购买最多 2 把|r |T135343:0|t[战士阔剑]|cRXP_BUY_（向他购买，如果买得起），或从拍卖行购买更好的武器|r
    .collect 2027,1 --Scimitar
    .target 格雷尼尔·钢怒
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    #xprate >1.49
    #ssf
    .goto 1455,35.969,65.346
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_格雷尼尔·钢怒|r交谈
    >>|cRXP_BUY_购买最多 2 把|r |T135343:0|t[战士阔剑]|cRXP_BUY_（向他购买，如果买得起）|r
    .collect 2027,1 --Scimitar
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 格雷尼尔·钢怒
step << Rogue
    #xprate >1.49
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.69
    .xp <14,1
step << skip --logout skip << Rogue
    #xprate >1.49
    #ssf
    #hardcore << !Human
    #completewith DarkshoreBoat
    .goto 1455,35.959,66.597
    .zone Dun Morogh >>|cRXP_WARN_跳到武器架顶部，然后登出并重新登录以执行登出跳点|r
step << Mage/Priest/Warlock
    #xprate >1.49
    #ah
    #sticky
    #label Wand1
    .goto 1455,33.225,64.648,0
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁炉堡拍卖师|r交谈
    >>|cRXP_BUY_资金足够时，购买一把|r |T135144:0|t[强效魔法杖] |cRXP_BUY_|r
    >>|cRXP_WARN_不打算或无法完成时，可跳过此步骤|r
    .collect 11288,1 --Greater Magic Wand (1)
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.5
step
    #xprate >1.49
    #ah
    .goto 1455,33.225,64.648,0
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁炉堡拍卖师|r交谈
    >>|cRXP_BUY_购买|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_BUY_和/或|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_BUY_，用于稍后提升|r |T133971:0|t[烹饪]|cRXP_BUY_技能|r
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以便之后在夜色镇完成一个任务|r
    >>|cRXP_WARN_不打算或无法完成时，可跳过此步骤|r
    >>|cRXP_BUY_购买以下物品，以便之后在黑海岸快速交任务：|r
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    >>|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (1-50)
    .disablecheckbox
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (1-50)
    .disablecheckbox
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #xprate >1.49
    #ah
    #optional
    .goto 1455,33.225,64.648,0
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁炉堡拍卖师|r交谈
    >>|cRXP_WARN_不打算或无法完成时，可跳过此步骤|r
    >>|cRXP_BUY_购买以下物品，以便之后在黑海岸快速交任务：|r
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
step << Mage/Priest/Warlock
    #xprate >1.49
    #ah
    #requires Wand1
    #optional
    +|cRXP_WARN_装备|r |T135144:0|t[强效魔法杖]
    .use 11288
    .itemcount 11288,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.49
step << skip --logout skip
    #xprate >1.49
    #ah
    #hardcore << !Human
    #optional
    .goto 1455,33.220,64.649
    .zone Dun Morogh >>|cRXP_WARN_跳到|cRXP_PICK_邮箱|r顶部，然后登出并重新登录以执行登出跳点|r
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>17.49 << Mage/Priest/Warlock
step << Mage/Priest/Warlock
    #xprate >1.49
    #ah
    #optional
    .goto Ironforge,22.837,17.094,8,0
    .goto Ironforge,21.131,17.276,5,0
    .goto Ironforge,23.135,15.936
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_哈瑞克·石鼓|r交谈
    >>|cRXP_WARN_购买一把|r |T135468:0|t[烟尘魔杖]|cRXP_WARN_（向他购买）|r
    >>|cRXP_WARN_烟尘魔杖需要15级才能装备；尚未15级时先留在背包中|r
    .collect 5208,1 --Smoldering Wand (1)
    .target 哈瑞克·石鼓
    .itemcount 11288,<1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
step << skip --logout skip << Mage/Priest/Warlock
    #xprate >1.49
    #ah
    #hardcore << !Human
    #optional
    .goto 1455,23.197,16.959
    .zone Dun Morogh >>|cRXP_WARN_跳到衣架顶部，然后登出并重新登录以执行登出跳点|r
    .zoneskip Ironforge,1
step << skip --logout skip << Mage/Priest/Warlock
    #xprate >1.49
    #ssf
    #hardcore << !Human
    .goto 1455,23.197,16.959
    .zone Dun Morogh >>|cRXP_WARN_跳到衣架顶部，然后登出并重新登录以执行登出跳点|r
    .zoneskip Ironforge,1
step << Dwarf/Gnome
    #xprate >1.49
    #softcore
    #completewith DarkshoreBoat
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fly Wetlands>> 飞往湿地
    .target 格莱斯·瑟登
step
    #xprate >1.49
    #optional
    #hardcore << !Human
    .goto 1426,53.042,35.383
    .zone Dun Morogh >> 离开铁炉堡
step
    #xprate >1.49
    #hardcore
    #completewith next
    .goto Dun Morogh,59.43,42.85,150 >> 前往丹莫罗 -> 湿地跳点
step
    #xprate >1.49
    #hardcore
    .goto Dun Morogh,59.5,42.8,40,0
    .goto Dun Morogh,60.4,44.1,40,0
    .goto Dun Morogh,61.1,44.1,40,0
    .goto Dun Morogh,61.2,42.3,40,0
    .goto Dun Morogh,60.8,40.9,40,0
    .goto Dun Morogh,59.0,39.5,40,0
    .goto Dun Morogh,60.3,38.6,40,0
    .goto Dun Morogh,61.7,38.7,40,0
    .goto Dun Morogh,65.7,21.6,40,0
    .goto Dun Morogh,65.8,12.5,40,0
    .goto Dun Morogh,65.6,10.8,40,0
    .goto Dun Morogh,66.5,10.0,40,0
    .goto Dun Morogh,66.9,8.5,40,0
    .goto Wetlands,20.6,67.2,50,0
    .goto Wetlands,17.7,67.7,40,0
    .goto Wetlands,16.8,65.3,40,0
    .goto Wetlands,15.1,64.0,40,0
    .goto Wetlands,12.1,60.3,40,0
    >>|cRXP_WARN_先观看视频，了解如何完成这个跳点！|r
    >>|cRXP_WARN_使用无死亡跳点： 丹莫罗 -> 湿地|r
    >>|cRXP_WARN_避开 |cRXP_ENEMY_湿地鳄鱼|r 和 |cRXP_ENEMY_鱼人|r （穿过水域时）|r
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >> |cRXP_WARN_点击此处查看视频指南|r
    .goto Wetlands,12.1,60.3,80 >> 前往米奈希尔港
    .mob 湿地鳄鱼
    .mob 湿地鳄鱼幼崽
    .mob 蓝腮袭击者
step << Human
    #xprate >1.49
    #softcore
    #label WetlandsDS1
    #completewith next
    .goto 1426,30.741,34.269,15,0
    .goto 1426,30.812,33.548,15,0
    .goto 1426,31.060,32.543,15,0
    .goto 1426,31.439,32.356,15,0
    .goto 1426,31.675,29.636,15,0
    .goto 1426,32.209,28.777,15,0
    .goto 1426,32.645,27.740,15,0
    .goto 1415,44.910,52.022,15,0
    >>|cRXP_WARN_完成丹莫罗至湿地的死亡跳点，密切跟随箭头指示|r
    >>|cRXP_WARN_暂时不要从任何高处跳下|r
    .goto 1415,44.910,52.030,15 >>|cRXP_WARN_爬上山，然后向下走过锯齿状地形，直到子区域变为大海|r
    .zoneskip Wetlands
    .subzoneskip 207 --The Great Sea
--XX neither of these zoneskips/subzoneskips want to work, so using waypoint obj instead
step << Human
    #xprate >1.49
    #softcore
    #requires WetlandsDS1
    #label WetlandsDS2
    #completewith next
    .goto 1415,44.733,51.882,-1
    .goto 1437,11.730,43.304,-1
    >>|cRXP_WARN_朝北或西北方向跳下山|r
    .deathskip >> 死亡，并在巴拉丁海湾的 |cRXP_FRIENDLY_灵魂医者|r处复活
    .isQuestAvailable 984
    .target 灵魂医者
step << Human
    #xprate >1.49
    #softcore
    #optional
    #requires WetlandsDS2
    #completewith next
    .goto Wetlands,11.95,50.24,60 >> 朝米奈希尔港方向游向岸边
    .subzoneskip 150
step
    #xprate >1.49
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto 1437,10.760,56.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_尼尔·奥雷|r，在兵营底层
    .vendor 1448 >> |cRXP_WARN_购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_（若有货，向他购买）|r
	.target 尼尔·奥雷
    .bronzetube
    .money <0.08
step
    #xprate >1.49
    #optional
    #completewith next
    .goto 1437,10.233,56.201,15 >> 离开米奈希尔城堡
    .subzoneskip 2103,1 --Menethil Keep
step
    #xprate >1.49
    #hardcore << !Human
    .goto Wetlands,9.49,59.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r ，在外面
    .fp Wetlands>> 开通湿地飞行路线
    .target 谢尔雷·布隆迪尔
step
    #xprate >1.49
    .goto Wetlands,7.95,56.38
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_德温·晨光|r，在屋内
    .vendor 1453 >> |cRXP_BUY_购买|r |T134831:0|t[治疗药水] |cRXP_BUY_（若有货，向他购买）|r
    .target 德温·晨光
step
    #xprate >1.49
    #optional
    #label DockTravel
    #completewith next
    .goto Wetlands,7.10,57.96,30,0
    .goto Wetlands,4.61,57.26,15 >> 前往奥伯丁船码头
    .zoneskip Darkshore
step
    #xprate >1.49
    #optional
    #requires DockTravel
    #label DarkshoreCook1
    #completewith DarkshoreBoat
    >>|cRXP_WARN_船刚到就在船上执行以下操作；船刚离开，就在码头执行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火]|cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #xprate >1.49
    #optional
    #requires DarkshoreCook1
    #label DarkshoreCook2
    #completewith DarkshoreBoat
    >>|cRXP_WARN_船刚到就在船上执行以下操作；船刚离开，就在码头执行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火]|cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #xprate >1.49
    #optional
    #requires DarkshoreCook2
    #label DarkshoreCook3
    #completewith DarkshoreBoat
    >>|cRXP_WARN_船刚到就在船上执行以下操作；船刚离开，就在码头执行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火]|cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #xprate >1.49
    #optional
    #requires DarkshoreCook3
    #label DarkshoreCook4
    #completewith DarkshoreBoat
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_以下物品：|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #xprate >1.49
    #optional
    #requires DarkshoreCook4
    #label DarkshoreCook5
    #completewith DarkshoreBoat
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #xprate >1.49
    #optional
    #requires DarkshoreCook5
    #label DarkshoreCook6
    #completewith DarkshoreBoat
    >>|cRXP_WARN_需要 50 点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #xprate >1.49
    #label DarkshoreBoat
    .goto 1437,4.370,56.762
    >>|cRXP_WARN_提升你的|r |T135966:0|t[急救] |cRXP_WARN_，可在等前往黑海岸的船时练习（如有需要）|r
    .zone Darkshore >> 乘船前往黑海岸
    ----End of >1.5x+ IF->Darkshore Section----
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#xprate <1.5
#classic
#tbc
#season 0,1
#era/som--h
#version 1
<< Alliance Hunter
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 6-11 Dun Morogh (Hunter)
#next 11-13 Loch Modan (Hunter)
#defaultfor Dwarf Hunter
#displayname 6-11 丹莫罗
step
    #completewith ribs1
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    .collect 769,4,317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
    .mob 大峭壁野猪
step
    #completewith next
    .goto Dun Morogh,46.726,53.826,30 >> 前往卡拉诺斯
step
    .goto Dun Morogh,46.726,53.826
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_森内尔·白须|r
    .turnin 420 >> 交任务: 森内尔的观察站
    .target 森内尔·白须
step
    #label ribs1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拉格纳·雷酒|r
    .target 拉格纳·雷酒
    .goto Dun Morogh,46.825,52.361
    .accept 384 >> 接任务: 啤酒烤猪排
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塔诺克·霜锤|r
    .target 塔诺克·霜锤
    .goto Dun Morogh,47.217,52.195
    .turnin 2160 >> 交任务: 塔诺克的补给品
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .target 旅店老板贝尔姆
    .goto Dun Morogh,47.377,52.523
    .home >> 将你的炉石设置为卡拉诺斯
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_萨雷克·黑石|r
    .target 萨雷克·黑石
    .goto Dun Morogh,46.021,51.676
    .accept 400 >> 接任务: 贝尔丁的工具
step
    .goto Dun Morogh,49.426,48.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r
    >>|cRXP_WARN_途中不要杀掉任何 |cRXP_ENEMY_黑熊幼崽|r|r
    .target 驾驶员贝隆·风箱
    .accept 317 >> 接任务: 贝尔丁的补给
step
#xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员迪恩·石轮|r 交谈
    .target 驾驶员迪恩·石轮
    .goto Dun Morogh,49.622,48.612
    .accept 313 >> 接任务: 灰色洞穴
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_贝尔丁·钢架|r
    .target 贝尔丁·钢架
    .goto Dun Morogh,50.443,49.092
    .turnin 400 >> 交任务: 贝尔丁的工具
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_罗斯洛·鲁治|r 交谈
    .target 罗斯洛·鲁治
    .goto Dun Morogh,50.084,49.420
    .accept 5541 >> 接任务: 海格纳的弹药
step << !Paladin !Warrior !Rogue
    .goto Dun Morogh,52.0,50.1,75,0
    .goto Dun Morogh,51.5,53.9,75,0
    .goto Dun Morogh,50.1,53.9,75,0
    .goto Dun Morogh,49.9,50.9,75,0
    .goto Dun Morogh,48.0,49.5,75,0
    .goto Dun Morogh,48.2,46.9,75,0
    .goto Dun Morogh,43.5,52.5,75,0
    .goto Dun Morogh,52.0,50.1,75,0
    .goto Dun Morogh,51.5,53.9,75,0
    .goto Dun Morogh,50.1,53.9,75,0
    .goto Dun Morogh,49.9,50.9,75,0
    .goto Dun Morogh,48.0,49.5,75,0
    .goto Dun Morogh,48.2,46.9,75,0
    .goto Dun Morogh,43.5,52.5,75,0
    .goto Dun Morogh,52.0,50.1,75,0
    .goto Dun Morogh,51.5,53.9,75,0
    .goto Dun Morogh,50.1,53.9,75,0
    .goto Dun Morogh,49.9,50.9,75,0
    .goto Dun Morogh,48.0,49.5,75,0
    .goto Dun Morogh,48.2,46.9,75,0
    .goto Dun Morogh,43.5,52.5,75,0
    .goto Dun Morogh,52.0,50.1,0
    .goto Dun Morogh,51.5,53.9,0
    .goto Dun Morogh,50.1,53.9,0
    .goto Dun Morogh,49.9,50.9,0
    .goto Dun Morogh,48.0,49.5,0
    .goto Dun Morogh,48.2,46.9,0
    .goto Dun Morogh,43.5,52.5
    >>击杀|cRXP_ENEMY_黑熊幼崽|r，拾取|cRXP_LOOT_皮毛|r
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob +黑熊幼崽
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .mob +峭壁野猪
    .mob +大峭壁野猪
    .collect 2886,6,384,1,1 --Collect Crag Boar Rib (x6)
    .mob +峭壁野猪
    .mob +大峭壁野猪
step
    #completewith BoarRibs2
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取|cRXP_LOOT_峭壁野猪肋排|r
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
    .mob 大峭壁野猪
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r
    .target 驾驶员贝隆·风箱
    .goto Dun Morogh,49.426,48.410
    .turnin 317 >> 交任务: 贝尔丁的补给
    .accept 318 >> 接任务: 艾沃沙酒
step
    .xp 6
step
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格瑞夫|r
    .trainer >> 学习职业技能
    .train 3044 >> 学习奥术射击
    .target 格瑞夫
step
    .goto Dun Morogh,44.13,56.95
    >>打开|cRXP_PICK_弹药箱|r，获取|cRXP_LOOT_海格纳的弹药|r
    .complete 5541,1 --Collect Rumbleshot's Ammo (x1)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_海格纳·重枪|r
    .target 海格纳·重枪
    .goto Dun Morogh,40.6,62.6,50,0
    .goto Dun Morogh,40.682,65.130
    .turnin 5541 >> 交任务: 海格纳的弹药
step << Hunter
    .goto Dun Morogh,40.682,65.130
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海格纳·重枪|r交谈，补足1000枚|T132384:0|t[轻弹丸]
    .collect 2516,1000,287,1
    .target 海格纳·重枪
    .money <0.005
step
    .goto Dun Morogh,40.682,65.130
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海格纳·重枪|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T135611:0|t[精制短枪]|cRXP_BUY_。如果买不起，请跳过此步骤|r
    .collect 2509,1 -- Ornate Blunderbuss (1)
    .money <0.0414
    .target 海格纳·重枪
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.95
step
    #completewith next
    +|cRXP_WARN_装备|r |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.94
step
    #xprate <1.5
    .goto Dun Morogh,42.25,53.68,40,0
    .goto Dun Morogh,41.07,49.04,50,0
    .goto Dun Morogh,42.25,53.68
    >>击杀|cRXP_ENEMY_雪怪|r和|cRXP_ENEMY_雪怪幼崽|r，拾取|cRXP_LOOT_鬃毛|r
    .complete 313,1 --Collect Wendigo Mane (x8)
    .mob 雪怪
    .mob 雪怪幼崽
step
    .xp 7
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_图德拉·马克格拉恩|r
    .target 图德拉·马克格拉恩
    .goto Dun Morogh,43.0,47.4,60,0
    .goto Dun Morogh,39.6,48.9,60,0
    .goto Dun Morogh,34.577,51.652
    .accept 312 >> 接任务: 马克格拉恩的干肉
step
    .goto Dun Morogh,38.517,53.927
    >>打开 |cRXP_PICK_马克格拉恩的储肉柜|r, 获取 |cRXP_LOOT_马克格拉恩的干肉|r
    >>|cRXP_WARN_等待|cRXP_ENEMY_冰须|r巡逻出洞穴。等他离开后，进入洞穴并拾取|r |cRXP_PICK_马克格拉恩的储肉柜|r
    .link https://www.youtube.com/watch?v=o55Y3LjgKoE >> |cRXP_WARN_点击这里查看视频参考|r
    .complete 312,1 --MacGrann's Dried Meats (1)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_图德拉·马克格拉恩|r
    .target 图德拉·马克格拉恩
    .goto Dun Morogh,34.577,51.652
    .turnin 312 >> 交任务: 马克格拉恩的干肉
step
    #completewith next
    .goto Dun Morogh,30.453,46.005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_基格·吉布恩|r
    .vendor >> |cRXP_WARN_卖掉杂物|r
    .target 基格·吉布恩
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷杰德·麦酒|r
    .target 雷杰德·麦酒
    .goto Dun Morogh,30.190,45.726
    .turnin 318 >> 交任务: 艾沃沙酒
    .accept 319 >> 接任务: 艾沃沙酒
    .accept 315 >> 接任务: 完美烈酒
step
    #label BoarRibs2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_马莱斯·麦酒|r
    .target 马莱斯·麦酒
    .goto Dun Morogh,30.186,45.531
    .accept 310 >> 接任务: 针锋相对
step
    #completewith next
    .goto Dun Morogh,31.5,38.9,60,0
    .goto Dun Morogh,28.3,39.9,60,0
    .goto Dun Morogh,28.7,43.7,60,0
    .goto Dun Morogh,25.8,47.2,60,0
    .goto Dun Morogh,25.8,47.2,60,0
    .goto Dun Morogh,30.0,51.8,60,0
    .goto Dun Morogh,31.5,38.9,60,0
    .goto Dun Morogh,28.3,39.9,60,0
    .goto Dun Morogh,28.7,43.7,60,0
    .goto Dun Morogh,25.8,47.2,60,0
    .goto Dun Morogh,25.8,47.2,60,0
    .goto Dun Morogh,30.0,51.8,60,0
    .goto Dun Morogh,28.7,43.7
    >>击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +冰爪熊
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +老峭壁野猪
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +雪豹
step
    #xprate <1.5
    .goto Dun Morogh,28.7,43.7
    >>刷怪收集完所需的野猪肋排
    .complete 384,1
    .xp 8-1400 >>刷怪直到距离 8 级还差 1400 点经验
step
    #xprate >1.49
    .goto Dun Morogh,28.7,43.7
    >>刷怪收集完所需的野猪肋排
    .complete 384,1
    .xp 8-2100 >>刷怪直到距离 8 级还差 2100 点经验
step
    #softcore
    .goto Dun Morogh,30.3,37.5,60 >> 跑到这里, 紧跟箭头指示通过死亡跳点前往湿地
step
    #softcore
    .goto Dun Morogh,30.9,33.1,15 >>向北跑上山
step
    #softcore
    .goto Dun Morogh,32.4,29.1,15 >>继续沿山路向上跑到此处
step
    #softcore
    .goto Dun Morogh,33.0,27.2,15,0
    .goto Dun Morogh,33.0,25.2,15,0
    .goto Wetlands,11.6,43.4,60,0
    .goto Wetlands,11.6,43.4,0
    .deathskip >>一直向北跑，一旦综合频道切换到湿地，就跳下去摔死，然后在米奈希尔港复活
    .target 灵魂医者
step
    #softcore
    #completewith next
    .goto Wetlands,12.7,46.7,30 >> 游向岸边
step
    #softcore
    .goto Wetlands,9.490,59.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r
    .fp Wetlands >> 获取湿地飞行点
    .target 谢尔雷·布隆迪尔
step
    #softcore
	#completewith next
    .hs >> 炉石回卡拉诺斯
step
    #hardcore
    #completewith next
    .goto Dun Morogh,49.622,48.612,60 >> 前往卡拉诺斯
step
#xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员迪恩·石轮|r 交谈
    .target 驾驶员迪恩·石轮
    .goto Dun Morogh,49.622,48.612
    .turnin 313 >> 交任务: 灰色洞穴
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买一杯|r|T132800:0|t[狂想麦酒]|cRXP_BUY_和一杯|r|T132800:0|t[雷霆麦酒]
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .collect 2686,1,311 --Collect Thunder Ale (x1)
    .target 旅店老板贝尔姆
step
    #completewith next
    .goto Dun Morogh,47.779,52.426,6,0
    .goto Dun Morogh,47.644,52.655,3,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话楼下的 |cRXP_FRIENDLY_加文·雷酒|r
    .accept 308 >> 接任务：加文的爱好
    .turnin 308 >> 交任务: 加文的爱好
    .target 加文·雷酒
step
    .goto Dun Morogh,47.716,52.696
    >>点击 |cRXP_PICK_无人守卫的雷酒桶|r
    .turnin 310 >> 交任务: 针锋相对
    .accept 311 >> 接任务: 向马莱斯回报
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋外的 |cRXP_FRIENDLY_拉格纳·雷酒|r
    .target 拉格纳·雷酒
    .goto Dun Morogh,46.825,52.361
    .turnin 384 >> 交任务: 啤酒烤猪排
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_森内尔·白须|r
    .target 森内尔·白须
    .goto Dun Morogh,46.726,53.826
    .accept 287 >> 接任务: 霜鬃巨魔要塞
step << Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格瑞夫|r
    .trainer >> 学习职业技能
    .train 5116>> 学习震荡射击
    .target 格瑞夫
step
#optional
    #completewith FinishShimmerweed
    >>击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +冰爪熊
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +老峭壁野猪
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +雪豹
step
    #completewith Rudra
    #label Dirt
    .goto Dun Morogh,59.84,49.56,40,0
    .goto Dun Morogh,61.36,47.07,40 >>沿土路上行
    .isQuestAvailable 314
step
    #completewith next
    #requires Dirt
    +|cRXP_WARN_风筝|cRXP_ENEMY_瓦加什|r向下至|r |cRXP_FRIENDLY_鲁德拉·冻石|r
    .link https://youtu.be/Zg4FNWw-P5k?t=3815 >>|cRXP_WARN_如果你在当前步骤遇到困难, 请点击此处查看详细说明|r << Mage
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >> |cRXP_WARN_点击这里查看视频参考|r << !Mage
    .mob 瓦加什
step
    #label Rudra
    .goto Dun Morogh,63.082,49.851
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_鲁德拉·冻石|r
    .accept 314 >> 接任务: 保护牲畜
    .target 鲁德拉·冻石
step << Hunter
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_瓦加什|r，拾取 |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r
    .collect 206169,1 --Rune of Explosive Shot (1)
    .train 410123,1
step
    .goto 1426,62.094,47.154,40,0
    .goto 1426,62.434,48.989,40,0
    .goto 1426,62.538,46.195
    >>击杀 |cRXP_ENEMY_瓦加什|r, 获取 |cRXP_LOOT_利牙|r
    >>|cRXP_WARN_把他引到牧场南边的守卫那里. 确保对他造成 51% 以上的伤害|r
    >>|cRXP_WARN_尝试击杀 |cRXP_ENEMY_瓦加什|r 前请先观看下方视频, 任何职业均可单刷|r
    .link https://youtu.be/Zg4FNWw-P5k?t=3815 >> |cRXP_WARN_点击这里查看视频参考|r << Mage
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >> |cRXP_WARN_点击这里查看视频参考|r << !Mage
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob 瓦加什
step << Hunter
    #season 2
    .train 410123 >> |cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 爆炸射击]
    .use 206169
    .itemcount 206169,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_鲁德拉·冻石|r
    .target 鲁德拉·冻石
    .goto Dun Morogh,63.082,49.851
    .turnin 314 >> 交任务: 保护牲畜
step
    .goto Dun Morogh,69.084,56.330
    .target 工头乔尼·石眉
    >>对话 |cRXP_FRIENDLY_工头乔尼·石眉|r
    .accept 432 >> 接任务: 该死的石腭怪！
step
#loop
    .goto Dun Morogh,67.5,59.4,40,0
    .goto Dun Morogh,70.2,57.6,40,0
    .goto Dun Morogh,67.5,59.4,0
    .goto Dun Morogh,70.2,57.6,0
    >>击杀|cRXP_ENEMY_石腭击颅者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob 石腭击颅者
step
    .goto Dun Morogh,69.084,56.330
    .target 工头乔尼·石眉
    >>对话 |cRXP_FRIENDLY_工头乔尼·石眉|r
    .turnin 432 >> 交任务: 该死的石腭怪！
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_驾驶员塞克·锤足|r
    .target 驾驶员塞克·锤足
    .goto Dun Morogh,83.892,39.188
    .accept 419 >> 接任务: 失踪的驾驶员
step
    >>点击 |cRXP_PICK_矮人的尸体|r
    .goto Dun Morogh,79.672,36.171
    .turnin 419 >> 交任务: 失踪的驾驶员
    .accept 417 >> 接任务: 驾驶员的复仇
step
    >>击杀|cRXP_ENEMY_癞爪|r，获取|cRXP_LOOT_爪子|r
    .goto Dun Morogh,78.97,37.14
    .complete 417,1 --Collect Mangy Claw (x1)
    .mob 癞爪
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_驾驶员塞克·锤足|r
    .target 驾驶员塞克·锤足
    .goto Dun Morogh,83.892,39.188
    .turnin 417 >> 交任务: 驾驶员的复仇
step
    #hardcore
    .hs >> 炉石回卡拉诺斯
step
    #softcore
    .goto Dun Morogh,47.11,55.01
    .deathskip >> 死亡后在灵魂医者处复活
    .target 灵魂医者
step
    #xprate >1.49
    .xp 10
step << Hunter
#xprate >1.49
    .goto Dun Morogh,45.810,53.039
    .target 格瑞夫
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .accept 6064 >>接受任务 驯服野兽
step << Hunter
#xprate >1.49
    .goto Dun Morogh,48.3,56.9
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_驯服|r|cRXP_ENEMY_大峭壁野猪|r
    .complete 6064,1 --Tame a Large Crag Boar (1)
    .mob 大峭壁野猪
step << Hunter
#xprate >1.49
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6064 >>交任务 驯服野兽
    .target 格瑞夫
    .accept 6084 >>接受任务 驯服野兽
step << Hunter
#xprate >1.49
    .goto Dun Morogh,49.4,59.4
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_驯服|r|cRXP_ENEMY_雪豹|r
    .complete 6084,1 --Tame a Snow Leopard (1)
    .mob 雪豹
step << Hunter
#xprate >1.49
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6084 >>交任务 驯服野兽
    .target 格瑞夫
    .accept 6085 >>接受任务 驯服野兽
step << Hunter
#xprate >1.49
    .goto Dun Morogh,50.4,59.7
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_驯服|r|cRXP_ENEMY_冰爪熊|r
    .complete 6085,1 --Tame an Ice Claw Bear (1)
    .mob 冰爪熊
step << Hunter
#xprate >1.49
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6085 >>交任务 驯服野兽
    .target 格瑞夫
    .accept 6086 >>接受任务 训练野兽
step
#xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拉兹·滑链|r
    .target 拉兹·滑链
    .goto Dun Morogh,46.005,48.637,10,0
    .goto Dun Morogh,45.846,49.365
    .accept 412 >> 接任务: 自动净化装置
step
    #completewith next
    .goto Dun Morogh,43.1,45.0,20,0
    .goto Dun Morogh,42.1,45.4,20 >> 前往闪光岭, 沿箭头指示跑上山
step
    #label FinishShimmerweed
    .goto Dun Morogh,40.9,45.3,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,42.1,34.3,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,40.9,45.3
    .goto Dun Morogh,39.5,43.0,0
    .goto Dun Morogh,41.5,36.0,0
    >>击杀|cRXP_ENEMY_霜鬃先知|r，拾取|cRXP_LOOT_微光草|r
    >>|cRXP_LOOT_微光草|r也可以从地上的|cRXP_PICK_微光草篮|r中采集
    .complete 315,1 --Collect Shimmerweed (x6)
    .mob 霜鬃先知
step << Hunter
#optional
    #season 2
    #completewith next
    .goto Dun Morogh,28.852,49.859
    >>|cRXP_WARN_施放|r |T132212:0|t[猎人印记]|cRXP_WARN_，目标选中|r|cRXP_ENEMY_沙沙作响的草丛|r
    >>击杀生成的|cRXP_ENEMY_钢鬃偷猎者|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob 沙沙作响的灌木丛
    .mob 钢鬃偷猎者
    .train 410113,1
step
    .goto Dun Morogh,31.5,38.9,60,0
    .goto Dun Morogh,28.3,39.9,60,0
    .goto Dun Morogh,28.7,43.7,60,0
    .goto Dun Morogh,25.8,47.2,60,0
    .goto Dun Morogh,25.8,47.2,60,0
    .goto Dun Morogh,30.0,51.8,60,0
    .goto Dun Morogh,31.5,38.9,60,0
    .goto Dun Morogh,28.3,39.9,60,0
    .goto Dun Morogh,28.7,43.7,60,0
    .goto Dun Morogh,25.8,47.2,60,0
    .goto Dun Morogh,25.8,47.2,60,0
    .goto Dun Morogh,30.0,51.8,60,0
    .goto Dun Morogh,28.7,43.7
    >>击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +冰爪熊
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +老峭壁野猪
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +雪豹
step << Hunter
    #season 2
    .goto Dun Morogh,28.852,49.859
    >>|cRXP_WARN_施放|r |T132212:0|t[猎人印记]|cRXP_WARN_，目标选中|r|cRXP_ENEMY_沙沙作响的草丛|r
    >>击杀生成的|cRXP_ENEMY_钢鬃偷猎者|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob 沙沙作响的灌木丛
    .mob 钢鬃偷猎者
    .train 410113,1
step << Hunter
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]|cRXP_WARN_学习|r |T132177:0|t[神射手]
    .use 206155
    .train 410113,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷杰德·麦酒|r
    .target 雷杰德·麦酒
    .goto Dun Morogh,30.189,45.725
    .turnin 319 >> 交任务: 艾沃沙酒
    .accept 320 >> 接任务: 艾沃沙酒
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷杰德·麦酒|r
    .target 雷杰德·麦酒
    .goto Dun Morogh,30.189,45.725
    .turnin 315 >> 交任务: 完美烈酒
    .accept 413 >> 接任务: 微光酒
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_马莱斯·麦酒|r
    .target 马莱斯·麦酒
    .goto Dun Morogh,30.186,45.531
    .turnin 311 >> 交任务: 向马莱斯回报
step
    #completewith next
    .goto Dun Morogh,24.509,50.831,20 >> 进入霜鬃巨魔要塞
step
#sticky
#label explore
    >>|cRXP_WARN_跳下至此处，探索霜鬃巨魔要塞。若下方有怪物，先按正常路线清理周围，切勿直接跳下|r
    .goto Dun Morogh,22.86,52.16
    .complete 287,2 --Fully explore Frostmane Hold
step
    .goto Dun Morogh,24.5,50.8,40,0
    .goto Dun Morogh,22.1,50.3,40,0
    .goto Dun Morogh,21.3,52.9,40,0
    .goto Dun Morogh,24.5,50.8,0
    .goto Dun Morogh,22.1,50.3,0
    .goto Dun Morogh,21.3,52.9,0
    >>击杀|cRXP_ENEMY_霜鬃猎头者|r
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob 霜鬃猎头者
step
#requires explore
#xprate <1.5
    .goto Dun Morogh,27.2,43.0,60,0
    .goto Dun Morogh,24.8,39.3,60,0
    .goto Dun Morogh,25.6,43.4,60,0
    .goto Dun Morogh,24.3,44.0,60,0
    .goto Dun Morogh,25.4,45.4,60,0
    .goto Dun Morogh,25.00,43.50
    >>击杀|cRXP_ENEMY_麻风侏儒|r，拾取|cRXP_LOOT_多档齿轮|r和|cRXP_LOOT_自适应齿轮|r
    .complete 412,2 --Collect Gyromechanic Gear (x8)
    .complete 412,1 --Collect Restabilization Cog (x8)
    .mob 麻风侏儒
step
    #xprate <1.5
    .xp 10-1470 >> 刷怪直到距离升级还差1470点经验值，目标等级为10级
step
#requires explore
    #hardcore
    #completewith KharanosTurnins
    .goto Dun Morogh,46.7,53.7,200 >> 前往卡拉诺斯, 途中顺路刷怪升级
step
#requires explore
    #completewith next
    #softcore
    .deathskip >> 死亡后在卡拉诺斯复活
step
#requires explore
    #label KharanosTurnins
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_森内尔·白须|r
    .target 森内尔·白须
    .goto Dun Morogh,46.726,53.826
    .turnin 287 >> 交任务: 霜鬃巨魔要塞
    .accept 291 >> 接任务: 森内尔的报告
step
#xprate <1.5
    .goto Dun Morogh,46.005,48.637,8,0
    .goto Dun Morogh,45.846,49.365
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拉兹·滑链|r
    .target 拉兹·滑链
    .turnin 412 >> 交任务: 自动净化装置
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r
    .target 驾驶员贝隆·风箱
    .goto Dun Morogh,49.426,48.410
    .turnin 320 >> 交任务: 艾沃沙酒
    .isOnQuest 320
step << Hunter
#xprate <1.5
    .goto Dun Morogh,45.810,53.039
    .target 格瑞夫
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .accept 6064 >>接受任务 驯服野兽
step << Hunter
#xprate <1.5
    .goto Dun Morogh,48.3,56.9
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_驯服|r|cRXP_ENEMY_大峭壁野猪|r
    .complete 6064,1 --Tame a Large Crag Boar (1)
    .mob 大峭壁野猪
step << Hunter
#xprate <1.5
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6064 >>交任务 驯服野兽
    .target 格瑞夫
    .accept 6084 >>接受任务 驯服野兽
step << Hunter
#xprate <1.5
    .goto Dun Morogh,49.4,59.4
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_驯服|r|cRXP_ENEMY_雪豹|r
    .complete 6084,1 --Tame a Snow Leopard (1)
    .mob 雪豹
step << Hunter
#xprate <1.5
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6084 >>交任务 驯服野兽
    .target 格瑞夫
    .accept 6085 >>接受任务 驯服野兽
step << Hunter
#xprate <1.5
    .goto Dun Morogh,50.4,59.7
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_驯服|r|cRXP_ENEMY_冰爪熊|r
    .complete 6085,1 --Tame an Ice Claw Bear (1)
    .mob 冰爪熊
step << Hunter
#xprate <1.5
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6085 >>交任务 驯服野兽
    .target 格瑞夫
    .accept 6086 >>接受任务 训练野兽
step << Dwarf Hunter
    #xprate <1.5
    #optional
    .goto Dun Morogh,50.4,59.7
    >>|cRXP_WARN_驯兽棒控制的野兽只是临时宠物。若还没有长期宠物，先放弃临时宠物，再用法术书中的|r |T132164:0|t[驯服野兽] |cRXP_WARN_驯服一只|cRXP_ENEMY_冰爪熊|r；已有长期宠物可跳过此步|r
    .tame 1196 >> 驯服一只长期宠物
    .target 冰爪熊
    .train 1515,3
step
    #completewith next
    .goto Dun Morogh,68.5,54.6,60 >> 前往古博拉采掘场
step
    .goto Dun Morogh,68.671,55.969
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_参议员梅尔·圣石|r
    .accept 433 >> 接任务: 公众之仆
    .target 参议员梅尔·圣石
step
    .goto Dun Morogh,70.7,56.4,40,0
    .goto Dun Morogh,70.62,52.39,25,0
    .goto Dun Morogh,70.7,56.4
    >>击杀|cRXP_ENEMY_石腭断骨者|r
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
    .mob +石腭断骨者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_参议员梅尔·圣石|r
    .turnin 433 >> 交任务: 公众之仆
    .target +参议员梅尔·圣石
    .goto Dun Morogh,68.671,55.969
step << skip
    .goto Dun Morogh,68.4,54.5
    .train 2550 >> 向厨师格瑞姆学习烹饪
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人维拉特·麦酒|r
    .target 巡山人维拉特·麦酒
    .goto Dun Morogh,79.6,50.7,50,0
    .goto Dun Morogh,82.3,53.5,25,0
    .goto Dun Morogh,86.278,48.812
    .turnin 413 >> 交任务: 微光酒
    .accept 414 >> 接任务: 卡德雷尔的酒
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
#tbc
#season 0,1
#era/som--h
#version 1
<< Alliance Hunter
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 11-13 Loch Modan (Hunter)
#next 14-16 Darkshore
#defaultfor Dwarf
#displayname 11-13 洛克莫丹（猎人） << !SoD
#displayname 12-15 洛克莫丹（猎人） << SoD
#displayname 11-13 洛克莫丹（猎人）
step
    #completewith next
    .goto Dun Morogh,86.203,51.260,15,0
    .goto Loch Modan,22.071,73.127,20 >> 前往洛克莫丹
    .zoneskip Loch Modan
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .target 巡山人库伯弗林特
    .goto Loch Modan,22.071,73.127
    .accept 224 >> 接任务：保卫国王的领土
step
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与碉堡内的|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .target 拉格弗斯上尉
    .accept 267 >> 接任务：穴居人的威胁
step
    #sticky
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_会沿穿过塞尔萨玛的道路巡逻|r
    .turnin -414 >> 交任务：卡德雷尔的酒
    .accept 416 >> 接任务：狗头人的耳朵
    .accept 1339 >> 接任务：巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .target 维德拉·壁炉
    .goto Loch Modan,34.828,49.283
    .accept 418 >> 接任务：塞尔萨玛血肠
step
    .goto Loch Modan,35.534,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r交谈
    .home >> 将你的炉石设置为塞尔萨玛
    .target 旅店老板纳克罗·壁炉
step
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.019,47.806
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .accept 6387 >> 接任务：荣誉学员
    .target 布洛克·寻石者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .target 索格拉姆·伯雷森
    .goto Loch Modan,33.938,50.954
    .turnin 6387 >> 交任务：荣誉学员
    .accept 6391 >> 接任务：飞往铁炉堡
step
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆|r交谈
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尼尔·石趾|r交谈
    .target 高尼尔·石趾
    .goto Ironforge,51.521,26.311
    .turnin 6391 >> 交任务 飞往铁炉堡
    .accept 6388 >> 接受任务 格莱斯·瑟登
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_参议员巴林·红石|r交谈
    .target 参议员巴林·红石
    .goto Ironforge,43.64,50.63,20,0
    .goto Ironforge,39.550,57.490
    .turnin 291 >> 交任务：森内尔的报告
    .isOnQuest 291
step << Hunter
    .goto Ironforge,70.86,85.83
    .target 贝莉亚·雷岩
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝莉亚·雷岩|r交谈
    .turnin 6086 >> 交任务：训练野兽
    >>|cRXP_WARN_完成后用[喂养宠物]喂饱你的长期宠物，并在[训练野兽]中教它[低吼]。驯兽棒的临时宠物不会保留|r
step << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .target 格莱斯·瑟登
    .goto Ironforge,55.501,47.742
    .turnin 6388 >> 交还任务：格莱斯·瑟登
    .accept 6392 >> 接任务：向布洛克回复
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .goto Ironforge,55.501,47.742
    .fly Loch Modan >> 飞往洛克莫丹
    .target 格莱斯·瑟登
step
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.019,47.806
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .turnin 6392 >> 交任务 向布洛克回复
    .target 布洛克·寻石者
step << Hunter
    .goto Loch Modan,35.828,43.457
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_维罗克·乱枪|r
    >>|cRXP_BUY_购买一把|r |T135613:0|t[猎人火枪] |cRXP_BUY_（如果买得起）|r
    .collect 2511,1
    .money <0.1324
    .target 维罗克·乱枪
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.00
step << Hunter
    #completewith next
    +|cRXP_WARN_装备|r |T135613:0|t[猎人火枪]
    .use 2511
    .itemcount 2511,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.99
step
    #completewith BraveSoul
    >>击杀 |cRXP_ENEMY_老黑熊|r, 搜刮 |cRXP_LOOT_熊肉|r
    >>击杀 |cRXP_ENEMY_山猪|r, 搜刮 |cRXP_LOOT_猪大肠|r
    >>击杀 |cRXP_ENEMY_森林潜伏者|r, 搜刮 |cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    #completewith next
    .goto Loch Modan,23.85,17.92,100 >> 向北前往奥加兹岗哨
step
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与碉堡内的|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务
    .accept 1338 >> 接任务：卡尔·雷矛的订单
    .accept 307 >> 接任务：肮脏的爪子
    .target 巡山人卡尔·雷矛
    .dungeon DM << Human
step << Human
    #xprate <1.59
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与碉堡内的|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务
    .accept 1338 >> 接任务：卡尔·雷矛的订单
    .accept 307 >> 接任务：肮脏的爪子
    .target 巡山人卡尔·雷矛
    .dungeon !DM
step << Human
    #xprate >1.59
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与碉堡内的|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务
    .accept 307 >> 接任务：肮脏的爪子
    .target 巡山人卡尔·雷矛
    .dungeon !DM
step
    #label BraveSoul
    #completewith next
    .goto Loch Modan,35.50,18.97,20 >> 进入银泉矿洞
step
    .goto Loch Modan,35.93,22.55
    >>打开 |cRXP_PICK_矿工联盟的储物箱|r, 搜刮 |cRXP_LOOT_矿工装备|r
    >>|cRXP_WARN_|cRXP_PICK_矿工联盟的储物箱|r 遍布矿井各处|r
    >>|cRXP_WARN_如果你想现在跳过,后续等级高了也可以再回来做|r
    .complete 307,1 -- Miners' Gear (4)
step
    #completewith RatEar
    >>击杀 |cRXP_ENEMY_老黑熊|r, 搜刮 |cRXP_LOOT_熊肉|r
    >>击杀 |cRXP_ENEMY_山猪|r, 搜刮 |cRXP_LOOT_猪大肠|r
    >>击杀 |cRXP_ENEMY_森林潜伏者|r, 搜刮 |cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 307 >> 交任务：肮脏的爪子
    .target 巡山人卡尔·雷矛
    .isQuestComplete 307
step
    #label RatEar
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82,50,0
    .goto Loch Modan,25.05,30.19,50,0
    .goto Loch Modan,26.06,43.44,50,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82
    >>击杀 |cRXP_ENEMY_坑道鼠|r, 搜刮 |cRXP_LOOT_耳朵|r
    >>|cRXP_ENEMY_坑道鼠|r |cRXP_WARN_可在洛克莫丹各地刷新。查看世界地图即可确认位置|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob 坑道鼠斥候
    .mob 坑道鼠歹徒
    .mob 坑道鼠征粮官
    .mob 坑道鼠地卜师
    .mob 坑道鼠掘地工
    .mob 坑道鼠勘探员
step
    >>击杀 |cRXP_ENEMY_老黑熊|r, 搜刮 |cRXP_LOOT_熊肉|r
    >>击杀 |cRXP_ENEMY_山猪|r, 搜刮 |cRXP_LOOT_猪大肠|r
    >>击杀 |cRXP_ENEMY_森林潜伏者|r, 搜刮 |cRXP_LOOT_蜘蛛的毒液|r
    .collect 3173,3,418,1 --Bear Meat (3)
    .mob +老黑熊
    .goto Loch Modan,26.9,10.7,90,0
    .goto Loch Modan,30.9,10.6,90,0
    .goto Loch Modan,28.6,15.4,90,0
    .goto Loch Modan,30.5,26.6,90,0
    .goto Loch Modan,33.4,30.3,90,0
    .goto Loch Modan,39.4,33.3,90,0
    .goto Loch Modan,26.9,10.7,90,0
    .goto Loch Modan,30.9,10.6,90,0
    .goto Loch Modan,28.6,15.4,90,0
    .goto Loch Modan,30.5,26.6,90,0
    .goto Loch Modan,33.4,30.3,90,0
    .goto Loch Modan,39.4,33.3,90,0
    .goto Loch Modan,26.9,10.7
    .collect 3172,3,418,1 --Boar Intestines (3)
    .mob +山猪
    .goto Loch Modan,38.0,34.9,90,0
    .goto Loch Modan,37.1,39.8,90,0
    .goto Loch Modan,29.8,35.9,90,0
    .goto Loch Modan,27.7,25.3,90,0
    .goto Loch Modan,28.6,22.6,90,0
    .goto Loch Modan,38.0,34.9,90,0
    .goto Loch Modan,37.1,39.8,90,0
    .goto Loch Modan,29.8,35.9,90,0
    .goto Loch Modan,27.7,25.3,90,0
    .goto Loch Modan,28.6,22.6,90,0
    .goto Loch Modan,38.0,34.9
    .collect 3174,3,418,1 --Spider Ichor (3)
    .mob +森林潜伏者
    .goto Loch Modan,31.9,16.4,90,0
    .goto Loch Modan,28.0,20.6,90,0
    .goto Loch Modan,33.8,40.5,90,0
    .goto Loch Modan,36.2,30.9,90,0
    .goto Loch Modan,39.0,32.1,90,0
    .goto Loch Modan,31.9,16.4,90,0
    .goto Loch Modan,28.0,20.6,90,0
    .goto Loch Modan,33.8,40.5,90,0
    .goto Loch Modan,36.2,30.9,90,0
    .goto Loch Modan,39.0,32.1,90,0
    .goto Loch Modan,31.9,16.4
step
    #sticky
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_会沿穿过塞尔萨玛的道路巡逻|r
    .target 巡山人卡德雷尔
    .turnin 416 >> 交任务：狗头人的耳朵
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .target 维德拉·壁炉
    .goto Loch Modan,34.828,49.283
    .turnin 418 >> 交任务：塞尔萨玛血肠
step
    .goto Loch Modan,27.01,48.74,0
    .goto Loch Modan,27.68,56.83,0
    .goto Loch Modan,33.35,71.59,0
    .goto Loch Modan,31.54,74.96,0
    .goto Loch Modan,27.01,48.74,40,0
    .goto Loch Modan,27.68,56.83,40,0
    .goto Loch Modan,33.35,71.59,40,0
    .goto Loch Modan,31.54,74.96,40,0
    .goto Loch Modan,33.88,76.58
    >>击杀 |cRXP_ENEMY_碎石穴居人|r 和 |cRXP_ENEMY_碎石怪斥候|r, 搜刮 |cRXP_LOOT_牙齿|r
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .mob +碎石穴居人
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .mob +碎石怪斥候
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob +碎石穴居人
    .mob +碎石怪斥候
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .target 巡山人库伯弗林特
    .goto Loch Modan,22.071,73.127
    .turnin 224 >> 交任务：保卫国王的领土
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .target 拉格弗斯上尉
    .goto Loch Modan,23.233,73.675
    .turnin 267 >> 交任务：穴居人的威胁
step
#xprate <1.5
    #completewith next
    .goto Loch Modan,64.89,66.66,80 >> 前往铁环挖掘场
step
#xprate <1.5
    .goto Loch Modan,65.934,65.622
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员基恩萨·铁环|r交谈
    .accept 298 >> 接受任务 挖掘进度报告
    .target 勘察员基恩萨·铁环
step
#xprate <1.5
    #completewith next
    .goto Loch Modan,82.92,59.37,80,0
    .goto Loch Modan,83.28,62.97,25 >> 前往旅行者营地
step
#xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_年轻的达瑞尔|r交谈
    .accept 257 >> 接任务：自豪的猎人
    .goto Loch Modan,83.49,65.40
    .target 年轻的达瑞尔
step
#xprate <1.5
    .goto Loch Modan,80.09,64.16,60,0
    .goto Loch Modan,77.16,75.57,60,0
    .goto Loch Modan,70.78,72.91,60,0
    .goto Loch Modan,76.65,62.27,60,0
    .goto Loch Modan,76.36,56.05,60,0
    .goto Loch Modan,80.09,64.16,60,0
    .goto Loch Modan,77.16,75.57,60,0
    .goto Loch Modan,70.78,72.91,60,0
    .goto Loch Modan,76.65,62.27,60,0
    .goto Loch Modan,76.36,56.05,60,0
    .goto Loch Modan,80.09,64.16
    >>击杀 |cRXP_ENEMY_山鹫|r
    >>|cRXP_WARN_必须在 15 分钟内完成此任务并返回至 |cRXP_FRIENDLY_年轻的达瑞尔|r. 若任务失败, 请放弃后重新接取|r
    .complete 257,1 -- Mountain Buzzard slain (6)
    .mob 山鹫
step
#xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_年轻的达瑞尔|r交谈
    .goto Loch Modan,83.49,65.40
    .turnin 257 >> 交任务：自豪的猎人
    .target 年轻的达瑞尔
step
    #xprate <1.5
    .goto Loch Modan,82.496,63.369
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_山达·细须|r
    >>|cRXP_BUY_购买一捆|r |T135435:0|t[普通木柴] |cRXP_BUY_和一块|r |T135237:0|t[燧石和火绒] |cRXP_BUY_（向他购买）|r
    >>|cRXP_WARN_这可让你在乘船或坐矿道地铁时制作|r |T135805:0|t[基础营火] |cRXP_WARN_并顺便提升|r |T133971:0|t[烹饪] |cRXP_WARN_技能，节省时间|r
    >>|cRXP_WARN_你需要 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .target 山达·细须
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
#xprate <1.5
    #hardcore
    .hs >> 炉石回塞尔萨玛
step
#xprate <1.5
    #softcore
    #completewith next
    .deathskip >> 死亡后在灵魂医者处复活
    .target 灵魂医者
step
#xprate <1.5
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.24,47.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉恩·角盔|r交谈
    .turnin 298 >> 交任务：挖掘进度报告
    .accept 301 >> 接任务：向铁炉堡报告
    .target 吉恩·角盔
step
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆|r交谈
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
step
    .goto Ironforge,60.072,36.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达瑞尔·瑞克努索|r交谈
    .target 达瑞尔·瑞克努索
    .train 2550 >> 学习 |T133971:0|t[烹饪]
step
#xprate <1.5
    .goto Ironforge,74.645,11.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员塔伯斯·雷矛|r交谈
    .turnin 301 >> 交任务 向铁炉堡报告
    .target 勘察员塔伯斯·雷矛
step
    .goto Ironforge,74.40,51.10,30,0
    .goto Ironforge,74.40,51.10,0
    >>|cRXP_WARN_进入矿道地铁|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与中央站台上的|cRXP_FRIENDLY_蒙提|r交谈
    .target 蒙提
    .accept 6661 >> 接任务：捕捉矿道老鼠
step
    .use 17117 >>|cRXP_WARN_使用|r |T133942:0|t[捕鼠者之笛]|cRXP_WARN_捕捉|r|cRXP_ENEMY_矿道老鼠|r
    .complete 6661,1 --Rats Captured (x5)
    .mob 矿道老鼠
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒙提|r交谈
    .target 蒙提
    .turnin 6661 >> 交任务：捕捉矿道老鼠
    .timer 11,捕捉矿道老鼠剧情
    .accept 6662 >> 接任务：我的兄弟，尼普希
step
    #completewith next
    .zone Stormwind City >> 乘坐地铁前往暴风城
    >>|cRXP_WARN_如有需要，等待地铁时提升|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_你的|r|T135966:0|t[急救]|cRXP_WARN_需达到80点，用于24级时的一个任务|r << Rogue !Dwarf
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下地铁后，与|cRXP_FRIENDLY_尼普希|r交谈
    >>|cRXP_FRIENDLY_尼普希|r|cRXP_WARN_位于中央站台|r
    .turnin 6662 >> 交任务：我的兄弟，尼普希
    .target 尼普希
step
    .zone Stormwind City >> 进入暴风城
step
    #softcore
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞曼德·艾尔默|r交谈
    .target 格瑞曼德·艾尔默
    .goto StormwindClassic,51.757,12.091
    .accept 353 >> 接任务：雷矛的包裹
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗伦·长须|r交谈
    .target 弗伦·长须
    .goto StormwindClassic,58.091,16.552
    .turnin 1338 >> 交任务：卡尔·雷矛的订单
step << Hunter
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .target 吴平
    .goto StormwindClassic,57.129,57.698
    .trainer >>学习 [法杖]
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拍卖师亚克森|r
    >>|cRXP_BUY_购买|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_BUY_和/或|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_BUY_，用于稍后提升|r |T133971:0|t[烹饪] |cRXP_BUY_技能|r
    >>|cRXP_WARN_你需要 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以便之后在夜色镇完成一个任务|r
    >>|cRXP_WARN_如果你不想这样做，或者无法完成，可以跳过此步骤|r
    >>|cRXP_BUY_购买以下物品, 以便之后在黑海岸快速交任务:|r
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    >>|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target 拍卖师亚克森
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #ah
    #optional
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拍卖师亚克森|r
    >>|cRXP_WARN_如果你不想这样做，或者无法完成，可以跳过此步骤|r
    >>|cRXP_BUY_购买以下物品, 以便之后在黑海岸快速交任务:|r
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target 拍卖师亚克森
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
step
    #softcore
    .hs >> 炉石回洛克莫丹
step
    #softcore
    #completewith next
    .goto Loch Modan,23.85,17.92,100 >> 向北前往奥加兹岗哨
step
    #softcore
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 353 >> 交任务：雷矛的包裹
    .target 巡山人卡尔·雷矛
step
    #softcore
    #completewith next
    .deathskip >> 死亡后在灵魂医者处复活
    .target 灵魂医者
step
    #softcore
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆|r交谈
    .fly Wetlands >> 飞往湿地
    .target 索格拉姆·伯雷森
step
    #hardcore
    .goto StormwindClassic,61.149,11.568,25,0
    .zone Ironforge >> 进入矿道地铁，乘坐地铁返回铁炉堡
    .zoneskip Ironforge
step << skip --logout skip
    #hardcore
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    .zone Ironforge >> 进入矿道地铁，乘坐地铁前往铁炉堡
    .link https://www.youtube.com/watch?v=M_tXROi9nMQ >> |cRXP_WARN_在地铁车厢内执行登出跳点. 点击此处查看视频教程|r
step
    #hardcore
    .goto Dun Morogh,53.5,34.9
    .zone Dun Morogh>>离开铁炉堡
step
    #hardcore
    #completewith next
    .goto Dun Morogh,59.43,42.85,150 >> 前往丹莫罗 -> 湿地跳点
step
    #hardcore
    .goto Dun Morogh,59.5,42.8,40,0
    .goto Dun Morogh,60.4,44.1,40,0
    .goto Dun Morogh,61.1,44.1,40,0
    .goto Dun Morogh,61.2,42.3,40,0
    .goto Dun Morogh,60.8,40.9,40,0
    .goto Dun Morogh,59.0,39.5,40,0
    .goto Dun Morogh,60.3,38.6,40,0
    .goto Dun Morogh,61.7,38.7,40,0
    .goto Dun Morogh,65.7,21.6,40,0
    .goto Dun Morogh,65.8,12.5,40,0
    .goto Dun Morogh,65.6,10.8,40,0
    .goto Dun Morogh,66.5,10.0,40,0
    .goto Dun Morogh,66.9,8.5,40,0
    .goto Wetlands,20.6,67.2,50,0
    .goto Wetlands,17.7,67.7,40,0
    .goto Wetlands,16.8,65.3,40,0
    .goto Wetlands,15.1,64.0,40,0
    .goto Wetlands,12.1,60.3,40,0
    >>|cRXP_WARN_先观看视频攻略，了解如何完成跳跃！|r
    >>|cRXP_WARN_完成丹莫罗 -> 湿地的免死跳跃|r
    >>|cRXP_WARN_渡水时避开|cRXP_ENEMY_湿地鳄鱼|r和|cRXP_ENEMY_鱼人|r|r
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >> |cRXP_WARN_点击此处查看视频攻略|r
    .goto Wetlands,12.1,60.3,80 >> 前往米奈希尔港
    .mob 湿地鳄鱼
    .mob 湿地鳄鱼幼崽
    .mob 蓝腮袭击者
step
    .money <0.08
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto Wetlands,10.761,56.737
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔·奥雷|r交谈
    .vendor >> |cRXP_BUY_购买一个|r|T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量出售的物品。若|cRXP_FRIENDLY_尼尔·奥雷|r没有出售，就跳过此步骤|r
	.target 尼尔·奥雷
    .bronzetube
step
    .goto Wetlands,10.43,61.01,10,0
    .goto Wetlands,10.496,60.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_萨莫尔·菲斯蒂沃斯|r交谈
    .vendor >> |cRXP_BUY_尽量买下现有的|r|T134831:0|t[治疗药水]|cRXP_BUY_库存|r
    >>|cRXP_WARN_这是限量出售的物品。若|cRXP_FRIENDLY_萨莫尔·菲斯蒂沃斯|r没有出售，就跳过此步骤|r
    .target 萨莫尔·菲斯蒂沃斯
step
    #hardcore
    .goto Wetlands,9.49,59.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_谢尔雷|r交谈
    .fp Wetlands>> 获取湿地飞行点
    .target 谢尔雷·布隆迪尔
step
    .goto Wetlands,7.95,56.38
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德温·晨光|r交谈
    .vendor >> |cRXP_BUY_尽量买下现有的|r|T134831:0|t[治疗药水]|cRXP_BUY_库存|r
    >>|cRXP_WARN_这是限量出售的物品。若|cRXP_FRIENDLY_德温·晨光|r没有出售，就跳过此步骤|r
    .target 德温·晨光
step
    #optional
    #label DockTravel
    #completewith next
    .goto Wetlands,7.10,57.96,30,0
    .goto Wetlands,4.61,57.26,15 >> 前往奥伯丁船码头
    .zoneskip Darkshore
step
    #optional
    #requires DockTravel
    #label DarkshoreCook1
    #completewith DarkshoreBoat
    >>|cRXP_WARN_船刚到就在船上执行以下操作；船刚离开，就在码头执行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火] |cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #optional
    #requires DarkshoreCook1
    #label DarkshoreCook2
    #completewith DarkshoreBoat
    >>|cRXP_WARN_船刚到就在船上执行以下操作；船刚离开，就在码头执行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火] |cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #optional
    #requires DarkshoreCook2
    #label DarkshoreCook3
    #completewith DarkshoreBoat
    >>|cRXP_WARN_船刚到就在船上执行以下操作；船刚离开，就在码头执行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火] |cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #optional
    #requires DarkshoreCook3
    #label DarkshoreCook4
    #completewith DarkshoreBoat
    >>|cRXP_WARN_你需要 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_以下物品:|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #optional
    #requires DarkshoreCook4
    #label DarkshoreCook5
    #completewith DarkshoreBoat
    >>|cRXP_WARN_你需要 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #optional
    #requires DarkshoreCook5
    #label DarkshoreCook6
    #completewith DarkshoreBoat
    >>|cRXP_WARN_你需要 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #label DarkshoreBoat
    .goto 1437,4.370,56.762
    >>|cRXP_WARN_如有需要，等待前往黑海岸的船时提升|r|T135966:0|t[急救]|cRXP_WARN_技能|r
    .zone Darkshore >> 乘船前往黑海岸
]])
