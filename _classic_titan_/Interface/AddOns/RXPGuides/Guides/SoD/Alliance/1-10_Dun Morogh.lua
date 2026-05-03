local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
#version 1
#season 2
<< Alliance
#group RestedXP 联盟 1-20
#name 1-7 寒脊山谷
#next 6-11 丹莫洛 赛季服
#displayname 1-7 寒脊山谷
#defaultfor Dwarf/Gnome

step << !Gnome !Dwarf
    #completewith next
    +您已选择一本针对侏儒和矮人的指南。您应该选择与您开始的相同的起始区
step << !Gnome Mage
    #season 2
    #completewith next
    +在探索季节，你不应该以法师的身份在你的种族起始区之外开始游戏，因为你将无法在这里获得你的第一个符文 (|T133816:0|t[雕刻手套 - 冰枪])
step
    .goto Dun Morogh,29.927,71.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯登·粗臂|r
    .accept 179 >>接任务: |cRXP_LOOT_矮人的交易|r
    .target Sten Stoutarm
step << Warlock
#sticky
#label wlrune1
    #season 2
    .goto Dun Morogh,26.733,72.552
    >>打开地面上的 |cRXP_PICK_Rockjaw 储物柜|r。拾取其中的 |T134419:0|t|cRXP_LOOT_[鬼影符文]|r
    .collect 205230,1 -- Rune of Haunting (1)
    .train 403919,1
step << Warlock
#requires wlrune1
#sticky
    #season 2
    .train 403919 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[鬼影符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 鬼影]
    .use 205230
    .itemcount 205230,1 -- Rune of Haunting (1)
--XX Era Level 1 Warrior/Warlock training, Era Warlock imp accept start
step << Warrior/Warlock
    #season 0,1
    #completewith next
    .goto 1426,28.533,72.587,50,0
    .goto 1426,28.239,71.707,50,0
    +|cRXP_WARN_杀死并掠夺 |cRXP_ENEMY_Ragged Young Wolves|r 直到你有 10 铜或更多的供应商垃圾|r
    >>|cRXP_WARN_解除你的|r |T132665:0|t[侍僧长袍]|cRXP_WARN_、|r |T135005:0|t[侍僧衬衫]|cRXP_WARN_、|r |T134581:0|t[侍僧裤子]|cRXP_WARN_和|r |T132535:0|t[侍僧鞋子] |cRXP_WARN_装备，这样你就可以将它们卖给 4 铜|r << Warlock
    >>|cRXP_WARN_解除你的|r |T135009:0|t[新兵衬衫]|cRXP_WARN_、|r |T134582:0|t[新兵裤子]|cRXP_WARN_和|r |T132540:0|t[新兵靴子]|cRXP_WARN_装备，这样你就可以将它们卖给 3 铜|r << Warrior
    .complete 179,1 --Tough Wolf Meat (8)
    .disablecheckbox
    .mob Ragged Young Wolf
    .money >0.001
step << Warrior/Warlock
    #season 0,1
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12,0
    .goto 1426,28.939,68.387,12 >>进入安威玛尔
step << Warrior/Warlock
    #season 0,1
    .goto 1426,28.792,67.837
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格伦德尔·哈金|r, 他在里面
    .vendor >>供应商垃圾
    .target Grundel Harkin
    .train 6673,1 << Warrior
    .train 348.1 << Warlock
step << Warrior
    #season 0,1
    .goto 1426,28.831,67.238
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯兰·库尔曼|r, 他在里面
    .train 6673 >>训练 |T132333:0|t[战斗呐喊]
    .target Thran Khorman
step << Warlock
    #season 0,1
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿拉玛尔·格里姆|r, 他在里面
    .train 348 >>列车 |T135817:0|t[献祭]
    .accept 1599 >>接任务: |cRXP_LOOT_开端|r
    .target Alamar Grimm
step << Warrior/Warlock
    #season 0,1
    #softcore << Warlock
    #label WarriorHS
    #completewith WolfMeat
    .hs >>炉石到寒脊山谷
    .subzoneskip 77,1
--XX All era warriors, era softcore warlocks
step << Warrior/Warlock
    #season 0,1
    #softcore << Warlock
    #optional
    #requires WarriorHS
    #completewith WolfMeat
	.destroy 6948 >>摧毁: |cRXP_ENEMY_炉石|r, 它在你的背包中. 不再需要它了
--XX Era Warriors, Era Softcore Warlocks drop HS
step << Warlock
    #season 0,1
    #optional
    #completewith next
    .goto 1426,28.938,68.358,12,0
    .goto 1426,28.831,68.698,12 >>离开安威玛尔
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
    >>杀死 |cRXP_ENEMY_Ragged Young Wolves|r。掠夺他们的 |cRXP_LOOT_Tough Wolf Meat|r
    .complete 179,1 --Collect Tough Wolf Meat (x8)
    .mob Ragged Young Wolf
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
    .xp 2 >>升级至 2 级
    .mob Ragged Young Wolf
step << Priest/Mage/Warlock
    #season 0,1
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾德林·怒流|r
    >>供应商垃圾
    >>|cRXP_BUY_从他那里购买 15|r |T132794:0|t[清凉泉水] |cRXP_BUY_|r
    >>|cRXP_WARN_如果你没有足够的钱，可以额外升级|cRXP_ENEMY_Ragged Young Wolves|r|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target Adlin Pridedrift
    .xp >6,1
step << Mage
    #season 2
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾德林·怒流|r
    >>供应商垃圾
    >>|cRXP_BUY_从他那里购买 15|r |T132794:0|t[清凉泉水] |cRXP_BUY_|r
    >>|cRXP_WARN_如果你没有足够的钱，可以额外升级|cRXP_ENEMY_Ragged Young Wolves|r|r
    >>|cRXP_WARN_确保你节省了 10c 以备后用|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target Adlin Pridedrift
    .xp >6,1
step << !Priest !Mage !Warlock
    #completewith next << !Hunter
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾德林·怒流|r
    >>供应商垃圾 << Hunter
    >>|cRXP_BUY_从他那里购买 600|r |T132384:0|t[Light Shots] |cRXP_BUY_|r << Hunter
    .vendor >>|cRXP_WARN_供应商垃圾|r << !Hunter
    .collect 2516,600 << Hunter --Light Shot (600)
    .target Adlin Pridedrift
    .xp >6,1
step
    .goto Dun Morogh,29.927,71.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯登·粗臂|r
    >>|cRXP_WARN_确保装备你从这个任务中获得的手套，以便你稍后可以雕刻符文|r
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 3106 >>接任务: |cRXP_LOOT_简易符文|r << Dwarf Warrior
    .accept 3107 >>接任务: |cRXP_LOOT_神圣符文|r << Dwarf Paladin
    .accept 3108 >>接任务: |cRXP_LOOT_风蚀符文|r << Dwarf Hunter
    .accept 3109 >>接任务: |cRXP_LOOT_密文符文|r << Dwarf Rogue
    .accept 3110 >>接任务: |cRXP_LOOT_神圣符文|r << Dwarf Priest
    .accept 3112 >>接任务: |cRXP_LOOT_简易备忘录|r << Gnome Warrior
    .accept 3113 >>接任务: |cRXP_LOOT_密文备忘录|r << Gnome Rogue
    .accept 3114 >>接任务: |cRXP_LOOT_雕文备忘录|r << Gnome Mage
    .accept 3115 >>接任务: |cRXP_LOOT_被污染的备忘录|r << Gnome Warlock
    .target Sten Stoutarm
step
    #xprate <1.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴尔林·霜锤|r
    .goto Dun Morogh,29.709,71.255
    .accept 170 >>接任务: |cRXP_LOOT_新的威胁|r
    .target Balir Frosthammer
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
    >>杀死 |cRXP_ENEMY_Rockjaw Troggs|r 和 |cRXP_ENEMY_Burly Rockjaw Troggs|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob Rockjaw Trogg
    .mob Burly Rockjaw Trogg
step << Priest
    #season 2
    .goto Dun Morogh,26.733,72.552
    >>打开地面上的 |cRXP_PICK_Rockjaw 储物柜|r。拾取其中的 |T136222:0|t|cRXP_LOOT_[困扰侍僧的记忆]|r
    .collect 205951,1 -- Memory of a Troubled Acolyte (1)
    .train 402862,1
step << Mage
    #season 2
    .goto Dun Morogh,26.733,72.552
    >>打开地面上的 |cRXP_PICK_Rockjaw 储物柜|r。拾取其中的 |T134939:0|t|cRXP_LOOT_[法术注释：CALE ENCI]|r
    >>|cRXP_WARN_注意：你将无法在此处训练|r |T133816:0|t[雕刻手套 - 冰枪] |cRXP_WARN_，因为你只能在你种族的起始区获得|r |T133736:0|t[理解入门] |cRXP_WARN_|r << !Gnome
    .collect 203751,1,77667,1 -- Spell Notes: CALE ENCI (1)
    .train 401760,1
step << !Paladin !Hunter
    #season 2
    #label EnterAnvilmar
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12,0
    .goto 1426,28.642,68.375,12 >>进入安威玛尔 << Rogue/Warlock/Mage
    .goto 1426,28.939,68.387,12 >>进入安威玛尔 << !Rogue !Warlock !Mage
step << Warlock
    #season 2
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿拉玛尔·格里姆|r, 他在楼上
    .accept 1599 >>接任务: |cRXP_LOOT_开端|r
    .turnin 3115 >>交任务: |cRXP_FRIENDLY_被污染的备忘录|r << Gnome
    .accept 77666 >>接受偷来的电力 << Gnome
    .turnin 77666 >>交出偷来的电力 << Gnome
    .train 348 >>列车 |T135817:0|t[献祭]
    .target Alamar Grimm
step << Warrior
    #season 2
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯兰·库尔曼|r, 他在里面
    .turnin 3106 >>交任务: |cRXP_FRIENDLY_简易符文|r << Dwarf
    .turnin 3112 >>交任务: |cRXP_FRIENDLY_简易备忘录|r << Gnome
    .accept 77655 >>接受失落的符文 << Dwarf
    .accept 77656 >>接受失落的符文 << Gnome
    .train 6673 >>训练 |T132333:0|t[战斗呐喊]
    .trainer >>训练你的职业法术
    .target Thran Khorman
step << Rogue
    #season 2
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索姆·哈格林|r, 他在里面
    .turnin 3109 >>交任务: |cRXP_FRIENDLY_密文符文|r << Dwarf
    .turnin 3113 >>交任务: |cRXP_FRIENDLY_密文备忘录|r << Gnome
    .accept 77658 >>接受“三次被盗” << Dwarf
    .accept 77659 >>接受“三次被盗” << Gnome
    .train 1784 >>列车 |T132320:0|t[隐身]
    .target Solm Hargrin
step << Priest
    #season 2
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布兰斯托克·卡德尔|r, 他在里面
    >>|cRXP_WARN_训练|r |T135987:0|t[真言术：坚毅] |cRXP_WARN_as 你很快就会需要它来完成一个职业任务|r << Dwarf
    .turnin 3110 >>交任务: |cRXP_FRIENDLY_神圣符文|r << Dwarf
    .accept 5626 >>接任务: |cRXP_LOOT_圣光的恩赐|r << Dwarf
    .accept 77661 >>接受光的冥想 << Dwarf
    .train 1243 >>训练 |T135987:0|t[真言术：坚毅]
    .target Branstock Khalder
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
step << Dwarf Priest
    #season 2
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布兰斯托克·卡德尔|r, 他在里面
    .turnin 77661 >>交出光之冥想
    .target Branstock Khalder
    .isQuestComplete 77661
step << Gnome Warlock/Dwarf Priest
    #season 2
    #label GlovesEquip
    #completewith Observations
    .equip 10,711 >>|cRXP_WARN_Equip the|r |T132961:0|t[破烂的布手套]
    .use 711
    .train 402862,3 << Priest
    .train 403919,3 << Warlock
step << Gnome Warlock/Dwarf Priest
    #season 2
    #requires GlovesEquip
    #completewith Observations
    .engrave 10 >>|cRXP_WARN_将你的|r |T132961:0|t[破烂布手套] 雕刻成|r |T133816:0|t[雕刻手套 - 困扰] << Warlock
    .engrave 10 >>|cRXP_WARN_将你的|r |T132961:0|t[破烂布手套] 雕刻成|r |T133816:0|t[雕刻手套 - 忏悔] << Priest
    .train 402862,3 << Priest
    .train 403919,3 << Warlock
step << !Paladin !Hunter
    #season 2 << !Warlock --Only Warlock is inside Anvilmar in Era at this step
    #optional
    #completewith Talin
    .goto 1426,28.792,68.804,12 >>离开安威玛尔
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
    >>杀死 |cRXP_ENEMY_Rockjaw Troggs|r 和 |cRXP_ENEMY_Burly Rockjaw Troggs|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob Rockjaw Trogg
    .mob Burly Rockjaw Trogg
step
#season 0,1
    #label Talin
    .goto Dun Morogh,22.601,71.433
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔林·锐眼|r
    .turnin 233 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
    .accept 183 >>接任务: |cRXP_LOOT_猎杀野猪|r
    .accept 234 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .target Talin Keeneye
step
#season 2
    #label Talin
    .goto Dun Morogh,22.601,71.433
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔林·锐眼|r
    .turnin 233 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
    .accept 234 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .target Talin Keeneye
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
    >>杀死 |cRXP_ENEMY_Small Crag Boars|r
    .complete 183,1 --Kill Small Crag Boar (x12)
    .mob Small Crag Boar
step
#season 0,1
    .goto Dun Morogh,22.601,71.433
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔林·锐眼|r
    .turnin 183 >>交任务: |cRXP_FRIENDLY_猎杀野猪|r
    .target Talin Keeneye
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
    >>杀死 |cRXP_ENEMY_Rockjaw Troggs|r 和 |cRXP_ENEMY_Burly Rockjaw Troggs|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob Rockjaw Trogg
    .mob Burly Rockjaw Trogg
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
    .xp 3+1130 >>升级至 1130+/1400xp
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
    .xp 3+995 >>升级至 995+/1400xp
step
    #label Rockjaw
    .goto 1426,25.077,75.711
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞林·白须|r
    .turnin 234 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
    .accept 182 >>接任务: |cRXP_LOOT_巨魔洞穴|r
    .target 格雷林·白胡子
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
    >>杀死 |cRXP_ENEMY_Frostmane 巨魔幼龙|r
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .mob Frostmane Troll Whelp
step << Hunter
    .goto 1426,25.861,78.197,0
    .goto 1426,23.716,80.257,0
    .goto 1426,20.671,75.838,0
    .xp 4 >>磨练至 4 级
step << Paladin/Warlock/Hunter
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺里斯·激流|r
    >>|cRXP_WARN_这将启动任务的 5 分钟计时器。接下来的 5 分钟内请勿离开或退出|r
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    .target 诺里·普里德瑞夫特
step << Warlock
#season 2
#completewith next
    .goto Dun Morogh,26.85,79.83,20 >>进入巨魔洞穴
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
    >>杀死巨魔洞穴内的 |cRXP_ENEMY_Frostmane Novices|r。掠夺他们的 |cRXP_LOOT_Feather Charms|r
    >>|cRXP_WARN_你正在计时。请勿离开或退出|r
    .complete 1599,1 --Collect Feather Charm (x3)
    .mob Frostmane Novice
step << Warlock/Paladin/Hunter
    #season 2
    #completewith next
    >>|cRXP_WARN_请确保你在出售后至少有一块银子。你需要它来训练|r |T132204:0|t[毒蛇钉刺] << Hunter
    >>|cRXP_WARN_请确保您在贩卖后至少有一块银币。您将需要它来训练|r |T135959:0|t[判断] << Paladin
    .hs >>炉石到安威玛尔
step << Paladin/Warlock/Hunter
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12,0
    >>|cRXP_WARN_你有 5 分钟的时间返回安威玛尔，之后|r |T132791:0|t[邓肯的沸腾晨酒] |cRXP_WARN_expires|r
    .goto 1426,28.939,68.387,20 >>进入安威玛尔
step << Paladin/Warlock/Hunter
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德南·弗卡特|r, 他在里面
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .vendor >>供应商垃圾
    .target 杜南·弗卡特
    .isQuestAvailable 317
step << Hunter
    #season 2
    .goto Dun Morogh,29.175,67.455
    .target Thorgas Grimson
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索加斯·格瑞姆森|r
    .turnin 3108 >>交任务: |cRXP_FRIENDLY_风蚀符文|r << Dwarf
    .accept 77660 >>接受“穿越洞穴”任务 << Dwarf
    .train 1978 >>列车 |T132204:0|t[毒蛇钉刺]
step << Paladin
    #season 2
    .goto Dun Morogh,28.833,68.332
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r, 他在里面
    .turnin 3107 >>交任务: |cRXP_FRIENDLY_神圣符文|r << Dwarf
    .accept 77657 >>接受圣光遗物 << Dwarf
    .train 20271 >>列车 |T135959:0|t[判断]
    .target Bromos Grummner
step << Warlock
    #season 0,1
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿拉玛尔·格里姆|r, 他在楼上
    .turnin 3115 >>交任务: |cRXP_FRIENDLY_被污染的备忘录|r
    .train 172 >>列车 |T136118:0|t[腐败]
    .target Alamar Grimm
step << Warlock
    #season 2
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿拉玛尔·格里姆|r, 他在楼上
    .train 172 >>列车 |T136118:0|t[腐败]
    .turnin 1599 >>交任务: |cRXP_FRIENDLY_开端|r
    .target Alamar Grimm
step << Paladin/Warlock/Hunter
    #hardcore
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12 >>离开安威玛尔
    .subzoneskip 77,1
step << Paladin/Warlock/Hunter
    #xprate <1.1
    .goto Dun Morogh,29.709,71.255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴尔林·霜锤|r
    .turnin 170 >>交任务: |cRXP_FRIENDLY_新的威胁|r
    .target Balir Frosthammer
step << Warlock
#season 0,1
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾德林·怒流|r
    >>供应商垃圾
    >>|cRXP_BUY_从他那里购买 15|r |T132794:0|t[清凉泉水] |cRXP_BUY_|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target Adlin Pridedrift
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
    >>杀死 |cRXP_ENEMY_Rockjaw Troggs|r 和 |cRXP_ENEMY_Burly Rockjaw Troggs|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob Rockjaw Trogg
    .mob Burly Rockjaw Trogg
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
    >>杀死 |cRXP_ENEMY_Frostmane Troll Whelps|r。掠夺它们以获得 |T134419:0|t|cRXP_LOOT_[胜利冲刺符文]|r << Warrior
    >>杀死 |cRXP_ENEMY_Frostmane Troll Whelps|r。从它们身上拾取 |T134916:0|t|cRXP_LOOT_[审判圣典]|r << Paladin
    .collect 204806,1 << Warrior --Rune of Victory Rush (1)
    .collect 205420,1 << Paladin -- Libram of Judgement (1)
    .mob Frostmane Troll Whelp
    .train 403470,1 << Warrior
    .train 410002,1 << Paladin
step << Warrior
    #season 2
    #completewith Observations
    #label Victory2
    #requires Victory1
    .train 403470 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[胜利冲刺符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 胜利冲刺]
    .use 204806
    .itemcount 204806,1
step << Warrior
    #season 2
    #completewith Observations
    #label Victory3
    #requires Victory2
    .equip 10 >>|cRXP_WARN_装备一双|r |T132938:0|t|cRXP_LOOT_[手套]|r |cRXP_WARN_如果你有一双或者你抢了一双|r
    .train 403470,3
step << Warrior
    #season 2
    #completewith Observations
    #requires Victory3
    .engrave 10 >>|cRXP_WARN_雕刻你的|r |T132938:0|t|cRXP_LOOT_[手套]|r 和|r |T133816:0|t[雕刻手套 - 胜利冲刺]
    .train 403470,3
step << Paladin
    #season 2
    #completewith Observations
    #label Libram2
    #requires Libram1
    .equip 18,205420 >>|cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[审判圣典]|r
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
    .aura 408828 >>|cRXP_WARN_施放|r |T135959:0|t[判断] |cRXP_WARN_10 次以获得|r |T136116:0|t[启发] |cRXP_WARN_buff|r
    .itemStat 18,QUALITY,2
    .train 410002,1
step << Paladin
    #season 2
    #completewith Observations
    #label Libram4
    #requires Libram3
    .cast 409920 >>|cRXP_WARN_使用|r |T134916:0|t|cRXP_LOOT_[审判圣典]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 十字军打击]
    .use 205420
    .aura -408828
    .train 410002,1
step << Paladin
    #season 2
    #completewith Observations
    #label Libram5
    #requires Libram4
    .equip 10 >>|cRXP_WARN_装备一双|r |T132938:0|t|cRXP_LOOT_[手套]|r |cRXP_WARN_如果你有一双或者你抢了一双|r
    .train 410002,3
step << Paladin
    #season 2
    #completewith Observations
    #requires Libram5
    .engrave 10 >>|cRXP_WARN_雕刻你的|r |T132938:0|t|cRXP_LOOT_[手套]|r 和|r |T133816:0|t[雕刻手套 - 十字军打击]
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
    >>杀死 |cRXP_ENEMY_Frostmane 巨魔幼龙|r
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .mob Frostmane Troll Whelp
step << Warrior/Paladin
    #season 2
    #optional
    #requires Victory2 << Warrior
    #requires Libram4 << Paladin
--XXREQ Placeholder invis step until multiple requires per step
step
    #requires TroggEnd << !Paladin !Warlock !Hunter
    .goto Dun Morogh,25.076,75.713
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞林·白须|r
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
    .accept 218 >>接任务: |cRXP_LOOT_被窃取的日记|r
    .target 格雷林·白胡子
step << Paladin/Warlock/Hunter
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺里斯·激流|r
    .turnin 3365 >>交任务: |cRXP_FRIENDLY_归还酒杯|r
    .target 诺里·普里德瑞夫特
step << !Paladin !Warlock !Hunter
    #softcore
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺里斯·激流|r
    >>|cRXP_WARN_这将启动任务的 5 分钟计时器。接下来的 5 分钟内请勿离开或退出|r
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    .target 诺里·普里德瑞夫特
step << !Paladin !Warlock !Hunter
    #softcore
    #completewith next
    +|cRXP_WARN_你有 5 分钟的时间获取 |cRXP_LOOT_格雷林·白胡子 的日记|r 并在|r |T132791:0|t[Duncan's Scalding Mornbrew] |cRXP_WARN_expires 之前返回 Anvilmar|r
    >>|cRXP_WARN_如果你失败了，不要担心，因为你可以稍后再次完成任务|r
step
    #optional
    #label FrostMCave1
    #completewith Grelin
    .goto 1426,27.098,80.707,20 >>进入霜鬃洞穴
step
    #optional
    #requires FrostMCave1
    #completewith Grelin
    .goto 1426,28.298,79.836,15,0
    .goto 1426,29.252,79.043,15,0
    .goto 1426,30.489,80.165,50 >>前往 |cRXP_ENEMY_Grik'nir the Cold|r 内部
step
    #sticky << Rogue/Hunter
    #label Grelin
    .goto 1426,30.489,80.165,0,0
    >>杀死里面的 |cRXP_ENEMY_Grik'nir the Cold|r。搜刮他的物品，获得 |cRXP_LOOT_格雷林·白胡子 的日记|r
    >>|cRXP_WARN_尽量确保你在卖东西后有 2 银。你很快就会需要它来训练法术|r << Warrior
    .complete 218,1 --Collect 格雷林·白胡子's Journal (x1)
    .mob Grik'nir the Cold
--XXSOD xpgate for early 6 training?
step << Rogue/Hunter
    #season 2
    .goto Dun Morogh,30.773,80.063
    >>打开里面地面上的 |cRXP_PICK_Frostmane Loot Cache|r。从中获取 |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r << Rogue
    >>打开里面地面上的 |cRXP_PICK_Frostmane Loot Cache|r。从中获取 |T134419:0|t|cRXP_LOOT_[奇美拉符文]|r << Hunter
    >>|cRXP_WARN_小心，|cRXP_ENEMY_Grik'nir the Cold|r 重生得非常快！你可能不得不再次杀死他才能抢走宝箱|r
    .collect 204795,1 << Rogue --Rune of Shadowstrike (1)
    .collect 206168,1 << Hunter -- Rune of the Chimera (1)
    .train 400105,1 << Rogue
    .train 410121,1 << Hunter
step << Rogue
    #season 2
    #hardcore
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 暗影打击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
--XX HC as softcore have timed quest turnin in Anvilmar (softcore rogues do it after turnin)
step << Hunter
    #season 2
    .train 410121 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[奇美拉符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 奇美拉射击]
    .use 206168
    .itemcount 206168,1
step << Rogue
    #season 2
    #hardcore
    #completewith Observations
    #label Shadowstrike1
    .equip 10 >>|cRXP_WARN_装备一双|r |T132952:0|t|cRXP_LOOT_[手套]|r |cRXP_WARN_如果你有一双或者你抢了一双|r
    .train 400105,3
step << Hunter
    #season 2
    #completewith Observations
    #label Chimera1
    .equip 10 >>|cRXP_WARN_装备一双|r |T132952:0|t|cRXP_LOOT_[手套]|r |cRXP_WARN_如果你有一双或者你抢了一双|r
    .train 410121,1
step << Rogue
    #season 2
    #hardcore
    #completewith Observations
    #requires Shadowstrike1
    .engrave 10 >>|cRXP_WARN_雕刻你的|r |T132952:0|t|cRXP_LOOT_[手套]|r 和|r |T133816:0|t[雕刻手套 - 暗影打击]
    .train 400105,3
step << Hunter
    #season 2
    #completewith Observations
    #requires Chimera1
    .engrave 10 >>|cRXP_WARN_雕刻你的|r |T132952:0|t|cRXP_LOOT_[手套]|r 和|r |T133816:0|t[雕刻手套 - 奇美拉射击]
    .train 410121,1
step << !Paladin !Warlock !Hunter
    #softcore
    #requires Grelin << Rogue
    #completewith next
    >|cRXP_WARN_>Make sure you will have two silver after vendoring to be able to train level 4 spells|r << Warrior
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .target Spirit Healer
step
    #hardcore << !Paladin !Warlock !Hunter
    #optional
    #requires Grelin << Rogue/Hunter
    #completewith Stolen
    .goto 1426,29.252,79.043,15,0
    .goto 1426,28.298,79.836,15,0
    .goto 1426,27.098,80.707,20 >>离开霜鬃洞穴
    .subzoneskip 132
--XX HC only unless you're a Paladin, Warlock, or Hunter
step << !Paladin !Warlock !Hunter
    #hardcore
    #requires Grelin << Rogue
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺里斯·激流|r
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    .target 诺里·普里德瑞夫特
step
    #hardcore << !Paladin !Warlock !Hunter
    #requires Grelin << Rogue/Hunter
    #label Stolen
    .goto Dun Morogh,25.075,75.715
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞林·白须|r
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 282 >>接任务: |cRXP_LOOT_森内尔的观察站|r
    .target 格雷林·白胡子
step << !Paladin !Warlock !Hunter
    #softcore
    #requires Grelin << Rogue
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德南·弗卡特|r
    >>|cRXP_WARN_如果任务失败，请跳过此步骤|r
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .vendor >>供应商垃圾
    .target 杜南·弗卡特
    .isOnQuest 3364
step << !Paladin !Warlock !Hunter
    #optional
    #softcore
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德南·弗卡特|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .vendor >>供应商垃圾
    .target 杜南·弗卡特
    .isQuestTurnedIn 3364
    .isQuestAvailable 317
step << !Paladin !Warlock !Hunter
    #softcore
    #requires Grelin << Rogue
    .abandon 3364 >>放弃 Scalding Mornbrew Delivery。你会再次拿起它
step << Rogue
    #season 2
    #softcore
    .train 400105 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[暗影打击符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 暗影打击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
step << Rogue
    #season 2
    #softcore
    #completewith Observations
    #label Shadowstrike1
    .equip 10 >>|cRXP_WARN_装备一双|r |T132952:0|t|cRXP_LOOT_[手套]|r |cRXP_WARN_如果你有一双或者你抢了一双|r
    .train 400105,3
step << Rogue
    #season 2
    #softcore
    #completewith Observations
    #requires Shadowstrike1
    .engrave 10 >>|cRXP_WARN_雕刻你的|r |T132952:0|t|cRXP_LOOT_[手套]|r 和|r |T133816:0|t[雕刻手套 - 暗影打击]
    .train 400105,3
step << !Paladin !Warlock !Hunter
    #softcore
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺里斯·激流|r, |cRXP_FRIENDLY_格瑞林·白须|r
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    .goto Dun Morogh,24.980,75.963
    .target +诺里·普里德瑞夫特
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 282 >>接任务: |cRXP_LOOT_森内尔的观察站|r
    .goto Dun Morogh,25.075,75.715
    .target +格雷林·白胡子
    .isQuestAvailable 3364
step << !Paladin !Warlock !Hunter
    #softcore
    #optional
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德南·弗卡特|r
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .target 杜南·弗卡特
step << !Paladin !Warlock !Hunter
    #hardcore
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德南·弗卡特|r
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
--  .vendor >>供应商垃圾
    .target 杜南·弗卡特
    .isQuestAvailable 317




----Start of >1.59x training section----




step << Mage
    #xprate >1.59
    #season 0,1
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .turnin 3114 >>交任务: |cRXP_FRIENDLY_雕文备忘录|r << Gnome
    .trainer >>训练你的职业法术
    .target 马里克·努里比特
step << Mage
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .turnin 3114 >>交任务: |cRXP_FRIENDLY_雕文备忘录|r << Gnome
    .accept 77667 >>接受法术研究 << Gnome
    .trainer >>训练你的职业法术
    .target 马里克·努里比特
step << Gnome Mage
    #xprate >1.59
    #season 2
    #completewith next
    .train 401760 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_LOOT_[法术说明：CALE ENCI]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 冰枪]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
step << Gnome Mage
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .turnin 77667 >>提交法术研究
    .target 马里克·努里比特
step << Gnome Mage
    #xprate >1.59
    #season 2
    #label GlovesEquip
    #completewith Observations
    .equip 10,711 >>|cRXP_WARN_Equip the|r |T132961:0|t[破烂的布手套]
    .use 711
    .train 401760,3
step << Gnome Mage
    #xprate >1.59
    #season 2
    #requires GlovesEquip
    #completewith Observations
    .engrave 10 >>|cRXP_WARN_将你的|r |T132961:0|t[破烂布手套] 雕刻成|r |T133816:0|t[雕刻手套 - 冰枪]
    .train 401760,3
step << Rogue
    #xprate >1.59
    #season 0,1
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索姆·哈格林|r
    .turnin 3113 >>交任务: |cRXP_FRIENDLY_密文备忘录|r << Gnome
    .turnin 3109 >>交任务: |cRXP_FRIENDLY_密文符文|r << Dwarf
    .train 1784 >>列车 |T132320:0|t[隐身]
    .trainer >>训练你的职业法术
    .target Solm Hargrin
step << Rogue
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索姆·哈格林|r
    .turnin 77658 >>上交三次被盗 << Dwarf
    .turnin 77659 >>上交三次被盗 << Gnome
    .train 921 >>列车 |T133644:0|t[扒窃]
    .trainer >>训练你的职业法术
    .target Solm Hargrin
step << Priest
    #xprate >1.59
    #season 0,1
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布兰斯托克·卡德尔|r
    >>|cRXP_WARN_训练|r |T135987:0|t[真言术：坚毅] |cRXP_WARN_and|r |T135929:0|t[次级治疗术] (等级 2) |cRXP_WARN_因为你很快就会需要它们来完成一个职业任务|r << Dwarf
    .turnin 3110 >>交任务: |cRXP_FRIENDLY_神圣符文|r << Dwarf
    .accept 5626 >>接任务: |cRXP_LOOT_圣光的恩赐|r << Dwarf
    .train 1243 >>训练 |T135987:0|t[真言术：坚毅]
    .train 2052 >>训练 |T135929:0|t[次级治疗] (等级 2) << Dwarf
    .trainer >>训练你的职业法术
    .target Branstock Khalder
step << Priest
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布兰斯托克·卡德尔|r
    >>|cRXP_WARN_训练|r |T135929:0|t[次级治疗术] (等级 2) |cRXP_WARN_as 你很快就会需要它来完成一项职业任务|r << Dwarf
    .accept 5626 >>接任务: |cRXP_LOOT_圣光的恩赐|r << Dwarf
    .train 2052 >>训练 |T135929:0|t[次级治疗] (等级 2) << Dwarf
    .trainer >>训练你的职业法术
    .target Branstock Khalder
step << Warrior
    #xprate >1.59
    #season 0,1
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯兰·库尔曼|r
    .turnin 3106 >>交任务: |cRXP_FRIENDLY_简易符文|r << Dwarf
    .turnin 3112 >>交任务: |cRXP_FRIENDLY_简易备忘录|r << Gnome
    .trainer >>训练你的职业法术
    .target Thran Khorman
step << Warrior
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯兰·库尔曼|r
    .turnin 77655 >>交出失落的符文 << Dwarf
    .turnin 77656 >>交出失落的符文 << Gnome
    .trainer >>训练你的职业法术
    .target Thran Khorman





----End of >1.59x training section----
----Start of <1.59x training section----





step << Mage
    #xprate <1.59
    #season 0,1
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .turnin 3114 >>交任务: |cRXP_FRIENDLY_雕文备忘录|r << Gnome
    .train 1459 >>训练 |T135932:0|t[奥术智慧]
    .train 116 >>训练 |T135846:0|t[冰箭]
    .target 马里克·努里比特
step << Mage
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .turnin 3114 >>交任务: |cRXP_FRIENDLY_雕文备忘录|r << Gnome
    .accept 77667 >>接受法术研究 << Gnome
    .train 1459 >>训练 |T135932:0|t[奥术智慧]
    .train 116 >>训练 |T135846:0|t[冰箭]
    .target 马里克·努里比特
step << Gnome Mage
    #xprate <1.59
    #season 2
    #completewith next
    .train 401760 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_LOOT_[法术说明：CALE ENCI]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 冰枪]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
step << Gnome Mage
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .turnin 77667 >>提交法术研究
    .target 马里克·努里比特
step << Gnome Mage
    #xprate <1.59
    #season 2
    #label GlovesEquip
    #completewith Observations
    .equip 10,711 >>|cRXP_WARN_Equip the|r |T132961:0|t[破烂的布手套]
    .use 711
    .train 401760,3
step << Gnome Mage
    #xprate <1.59
    #season 2
    #requires GlovesEquip
    #completewith Observations
    .engrave 10 >>|cRXP_WARN_将你的|r |T132961:0|t[破烂布手套] 雕刻成|r |T133816:0|t[雕刻手套 - 冰枪]
    .train 401760,3
step << Rogue
    #xprate <1.59
    #season 0,1
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索姆·哈格林|r
    .turnin 3113 >>交任务: |cRXP_FRIENDLY_密文备忘录|r << Gnome
    .turnin 3109 >>交任务: |cRXP_FRIENDLY_密文符文|r << Dwarf
    .train 1784 >>列车 |T132320:0|t[隐身]
    .target Solm Hargrin
step << Rogue
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索姆·哈格林|r
    .turnin 77658 >>上交三次被盗 << Dwarf
    .turnin 77659 >>上交三次被盗 << Gnome
    .target Solm Hargrin
step << Priest
    #xprate <1.59
    #season 0,1
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布兰斯托克·卡德尔|r
    >>|cRXP_WARN_训练|r |T135987:0|t[真言术：坚毅] |cRXP_WARN_and|r |T135929:0|t[次级治疗术] (等级 2) |cRXP_WARN_因为你很快就会需要它们来完成一个职业任务|r << Dwarf
    .turnin 3110 >>交任务: |cRXP_FRIENDLY_神圣符文|r << Dwarf
    .accept 5626 >>接任务: |cRXP_LOOT_圣光的恩赐|r << Dwarf
    .train 1243 >>训练 |T135987:0|t[真言术：坚毅]
    .train 2052 >>训练 |T135929:0|t[次级治疗] (等级 2) << Dwarf
    .trainer >>训练你的职业法术
    .target Branstock Khalder
step << Priest
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布兰斯托克·卡德尔|r
    .train 589 >>训练 |T136207:0|t[暗言术：痛]
    .target Branstock Khalder
step << Warrior
    #xprate <1.59
    #season 0,1
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯兰·库尔曼|r
    .turnin 3106 >>交任务: |cRXP_FRIENDLY_简易符文|r << Dwarf
    .turnin 3112 >>交任务: |cRXP_FRIENDLY_简易备忘录|r << Gnome
    .train 100 >>列车 |T132337:0|t[收费]
    .train 772 >>列车 |T132155:0|t[Rend]
    .target Thran Khorman
step << Warrior
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯兰·库尔曼|r
    .turnin 77655 >>交出失落的符文 << Dwarf
    .turnin 77656 >>交出失落的符文 << Gnome
    .train 100 >>列车 |T132337:0|t[收费]
    .train 772 >>列车 |T132155:0|t[Rend]
    .target Thran Khorman




----End of <1.59x training section----





step << !Paladin !Warlock !Hunter
    #optional
    #completewith Stolen
    .goto 1426,28.831,68.698,12 >>离开安威玛尔
    .subzoneskip 77,1
step << !Paladin !Warlock !Hunter
    #xprate <1.1
    .goto Dun Morogh,29.709,71.255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴尔林·霜锤|r
    .turnin 170 >>交任务: |cRXP_FRIENDLY_新的威胁|r
    .target Balir Frosthammer
step << Priest/Mage
#season 0,1
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾德林·怒流|r
    >>供应商垃圾
    >>|cRXP_BUY_从他那里购买 5|r |T132794:0|t[清凉泉水] |cRXP_BUY_|r
    .collect 159,5 --Collect Refreshing Spring Water (x5)
    .target Adlin Pridedrift
    .money <0.0025
    .xp >8,1
step << !Paladin !Warlock !Hunter
    #softcore
    #label Stolen
    .goto Dun Morogh,25.075,75.715
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞林·白须|r
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 282 >>接任务: |cRXP_LOOT_森内尔的观察站|r
    .target 格雷林·白胡子
step << !Paladin !Warlock !Hunter
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺里斯·激流|r
    .turnin 3365 >>交任务: |cRXP_FRIENDLY_归还酒杯|r
    .target 诺里·普里德瑞夫特
step << Mage
    #completewith next
    .hs >>使用你的炉石并返回安威玛尔
step << Mage
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .train 143 >>训练 |T135812:0|t[火球] (等级 2)
    .train 2136 >>列车 |T135807:0|t[火焰冲击]
    .target 马里克·努里比特
step << Dwarf Paladin/Dwarf Hunter/Mage
    #season 2
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12,0
    .goto 1426,28.939,68.387,12 >>进入安威玛尔
step << Mage
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾德林·怒流|r
    >>供应商垃圾
    >>|cRXP_BUY_再买一些|r |T132794:0|t[清凉泉水] |cRXP_BUY_从他那里买|r
    .collect 159,5 --Collect Refreshing Spring Water (x5)
    .target Adlin Pridedrift
    .money <0.0025
step << Dwarf Paladin
    #season 2
    #optional
    .goto Dun Morogh,28.833,68.332
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r
    .turnin 77657 >>交出光明圣物
    .target Bromos Grummner
    .isQuestComplete 77657
    .equip 10 --Show step if you don't have gloves
step << Dwarf Hunter
    #season 2
    #optional
    .goto Dun Morogh,29.175,67.455
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索加斯·格瑞姆森|r
    .turnin 77660 >>交出穿越洞穴
    .target Thorgas Grimson
    .isQuestComplete 77660
    .equip 10 --Show step if you don't have gloves
step << Dwarf Paladin/Dwarf Hunter
    #season 2
    #optional
    #completewith ColdridgePass
    .abandon 77657 >>放弃光明遗物，因为你已经装备了一双|T132938:0|t[手套] << Paladin
    .abandon 77660 >>放弃穿越洞穴，因为你已经装备了一双|T132952:0|t[手套] << Hunter
step
    #label Observations
    >>对话: |cRXP_FRIENDLY_巡山人萨鲁斯|r, |cRXP_FRIENDLY_汉兹·跳链|r
    .turnin 282 >>交任务: |cRXP_FRIENDLY_森内尔的观察站|r
    .accept 420 >>接任务: |cRXP_LOOT_森内尔的观察站|r
    .goto Dun Morogh,33.484,71.841
    .target +登山者泰洛斯
    .accept 2160 >>接任务: |cRXP_LOOT_塔诺克的补给品|r
    .goto Dun Morogh,33.85,72.24
    .target +指针 弹簧链轮
step
    #label ColdridgePass
    .goto Dun Morogh,34.32,70.95,15,0
    .goto Dun Morogh,35.65,65.79,15 >>穿越寒脊山口
    .subzoneskip 800,1
    .isOnQuest 2160
]])

RXPGuides.RegisterGuide([[
#season 2
#classic
#version 1
<< Alliance --!Hunter
#group RestedXP 联盟 1-20
#name 6-11 丹莫洛 赛季服
#displayname 7-12 Dun Morogh
#next 12-13 丹莫洛 赛季服
#defaultfor Dwarf/Gnome

step
    #optional
    #label BoarMeatQuest
    #completewith SenirEnd
    >>前往卡拉诺斯途中杀死 |cRXP_ENEMY_Crag Boars|r。拾取它们可获得 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r 和 |cRXP_LOOT_Crag Boar Ribs|r
    >>|cRXP_WARN_保存所有|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_WARN_你从库存喷气蒸汽中获得的，然后保存升级你的|r |T133971:0|t[烹饪] |cRXP_WARN_later|r
    .collect 769,4,317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob Crag Boar
    .subzoneskip 131 --Kharanos
--XX 270 from priest quest
--XX 340 from quest, 45 from explore
step
    #label SenirEnd
    .goto Dun Morogh,46.726,53.826
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_森内尔·白须|r
    .turnin 420 >>交任务: |cRXP_FRIENDLY_森内尔的观察站|r
    .accept 287 >>接任务: |cRXP_WARN_霜鬃巨魔要塞|r
    .target Senir Whitebeard
step << Warlock
    .goto Dun Morogh,47.329,53.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉姆瑞兹·黑轮|r
    .trainer >>训练你的职业法术
    .target Gimrizz Shadowcog
step
    .goto Dun Morogh,46.825,52.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格纳·雷酒|r
    .accept 384 >>接任务: |cRXP_LOOT_啤酒烤猪排|r
    .target Ragnar Thunderbrew
step
    #optional
    #completewith next
    .goto 1426,46.952,52.050,8,0
    .goto 1426,47.153,51.939,8 >>进入 Thunderbrew 酿酒厂
step
    .goto Dun Morogh,47.217,52.195
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔诺克·霜锤|r
    .turnin 2160,1 >>交任务: |cRXP_FRIENDLY_塔诺克的补给品|r << Warrior/Rogue
    .turnin 2160,2 >>交任务: |cRXP_FRIENDLY_塔诺克的补给品|r << !Warrior !Rogue
    .target Tannok Frosthammer
step << Rogue
    .goto Dun Morogh,47.189,52.403
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克雷格·比尔姆|r
    >>|cRXP_WARN_购买|r |T135641:0|t[平衡投掷匕首]
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target Kreg Bilmn
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #optional
    #sticky
    #label BalancedDaggers1
    +|cRXP_WARN_Equip the|r |T135641:0|t[平衡投掷匕首]
    .use 2946
    .itemcount 2946,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #optional
    #sticky
    #requires BalancedDaggers1
    #label DeleteOldDaggers
    .destroy 2947 >>摧毁: |cRXP_ENEMY_破损的小飞刀|r, 它在你的背包中. 不再需要它了
step << Rogue
    .goto Dun Morogh,47.563,52.608
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍格拉尔·巴坎|r
    .trainer >>训练你的职业法术
    .train 921 >>确保训练 |T133644:0|t|cRXP_PICK_Pick Pocket|r，稍后你将需要它来获得符文
    .target Hogral Bakkan
step << Mage
    .goto Dun Morogh,47.498,52.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛济斯·石衣|r, 他在楼上
    .trainer >>训练你的职业法术
    .target Magis Sparkmantle
step << Paladin
    .goto Dun Morogh,47.597,52.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿扎尔·战锤|r, 他在楼上
    .trainer >>训练你的职业法术
    .target Azar Stronghammer
step << Priest
    .goto Dun Morogh,47.342,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马克萨恩·安沃尔|r, 他在里面
    .accept 5625 >>接任务: |cRXP_LOOT_圣光之衣|r
    .target Maxan Anvol
step << Priest
    .goto Dun Morogh,45.805,54.568
    >>对 |cRXP_FRIENDLY_Mountaineer Dolf|r 施放 |T135929:0|t[次级治疗术] (等级 2) 然后 |T135987:0|t[真言术：坚韧]
    .complete 5625,1 --Heal and fortify Mountaineer Dolf
    .target Mountaineer Dolf
step << Priest
    .goto Dun Morogh,47.342,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马克萨恩·安沃尔|r, 他在里面
    .turnin 5625 >>交任务: |cRXP_FRIENDLY_圣光之衣|r
    .trainer >>训练你的职业法术
    .target Maxan Anvol
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板贝尔姆|r, 他在里面
    .home >>将你的炉石设置为雷酒酿酒厂
    .vendor >>|cRXP_BUY_尽可能多地购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_|r << Mage
    .target Innkeeper Belm
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板贝尔姆|r
    >>从他那里购买一瓶 |T132800:0|t[|cRXP_LOOT_Rhapsody Malt|r]
    .collect 2894,1 --Rhapsody Malt (1)
    .itemcount 2886,6 --Crag Boar Ribs (6)
step
    .goto Dun Morogh,46.825,52.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格纳·雷酒|r
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
    .target Ragnar Thunderbrew
    .isQuestComplete 384
step << Warrior
    .goto Dun Morogh,47.360,52.646
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格兰尼斯·快斧|r, 他在里面
    .trainer >>训练你的职业法术
    .target Granis Swiftaxe
step << Paladin/Warrior/Rogue
    #optional
    #completewith Blacksmithing1
    .goto 1426,45.695,51.911,20 >>进入铁匠铺
step << Gnome Warrior
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格劳恩·索姆温|r
    >>|cRXP_BUY_购买 a|r |T135321:0|t[Gladius]
    .target Grawn Thromwyn
    .money <0.0536
    .collect 2488,1 --Collect Gladius (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Gnome Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T135321:0|t[Gladius]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
step << Dwarf Warrior
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格劳恩·索姆温|r
    >>|cRXP_BUY_购买 a|r |T132401:0|t[大斧]
    .target Grawn Thromwyn
    .money <0.0460
    .collect 2491,1 --Collect Large Axe (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.30
step << Dwarf Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T132401:0|t[大斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.29
step << Rogue
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格劳恩·索姆温|r
    >>|cRXP_BUY_购买 a|r |T135641:0|t[细高跟鞋]
    .target Grawn Thromwyn
    .money <0.0400
    .collect 2494,1 --Collect Stiletto (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith next
    +|cRXP_WARN_装备|r |T135641:0|t[细高跟鞋]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Paladin
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格劳恩·索姆温|r
    >>|cRXP_BUY_购买 a|r |T133053:0|t[木槌]
    .target Grawn Thromwyn
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.00
step << Paladin
    #completewith next
    +|cRXP_WARN_装备|r |T133053:0|t[木槌]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.99
step << Warrior/Rogue/Paladin
    #label Blacksmithing1
    .goto 1426,45.344,51.936
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托格努斯·燧火|r
    >>|cRXP_WARN_这将允许你制作|r |T135248:0|t[粗糙磨刀石] |cRXP_WARN_这将使你的近战伤害增加 2|r << Warrior/Rogue
    >>|cRXP_WARN_这将允许你制作|r |T135255:0|t[粗糙的重量石] |cRXP_WARN_这将使你的近战伤害增加 2|r << Paladin
    >>|cRXP_WARN_如果你不想这样做，请跳过此步骤|r
    .train 2018 >>训练 |T136241:0|t[锻造]
    .target Tognus Flintfire
step
    #requires DeleteOldDaggers << Rogue
    .goto Dun Morogh,46.021,51.676
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨雷克·黑石|r
    .accept 400 >>接任务: |cRXP_LOOT_贝尔丁的工具|r
    .target Tharek Blackstone
step << Rogue
    #season 2
    .goto Dun Morogh,47.658,51.706,5,0
    .goto Dun Morogh,47.160,52.335,5,0
    .goto Dun Morogh,46.917,51.995
    >>|cRXP_WARN_爬上卡拉诺斯旅馆的屋顶，然后跳到巨大的酒桶上。跟着箭头走|r
    >>打开 |cRXP_PICK_Rusty Lockbox|r。从中获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Slaughter|r]
    .collect 203993,1 -- Rune of Slaughter (1)
    .train 424992,1
step << Rogue
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r] |cRXP_WARN_训练|r |T236280:0|t[暗影屠杀]
    .use 203993
    .itemcount 203993,1
step
    #optional
    #completewith next
    >>杀死 |cRXP_ENEMY_Crag Boars|r。拾取它们以获得 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r 和 |cRXP_LOOT_Crag Boar Ribs|r
    .collect 769,4,317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob Crag Boar
    .subzoneskip 131 --Kharanos
step
    #label StartStocking
    .goto Dun Morogh,49.426,48.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_驾驶员贝隆·风箱|r
    >>|cRXP_WARN_不要在途中杀死任何|cRXP_ENEMY_年轻的黑熊s|r|r
    .accept 317 >>接任务: |cRXP_LOOT_贝尔丁的补给|r
    .target 飞行员 Bellowfiz
step
    .goto Dun Morogh,49.622,48.612
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_驾驶员迪恩·石轮|r
    .accept 313 >>接任务: |cRXP_LOOT_灰色洞穴|r
    .target +飞行员石甲
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贝尔丁·钢架|r, |cRXP_FRIENDLY_罗斯洛·鲁治|r
    .turnin 400 >>交任务: |cRXP_FRIENDLY_贝尔丁的工具|r
    .goto Dun Morogh,50.443,49.092
    .target +Beldin 钢烤架
    .accept 5541 >>接任务: |cRXP_LOOT_海格纳的弹药|r
    .goto Dun Morogh,50.084,49.420
    .target +洛斯洛·拉奇
step << Warrior/Paladin/Rogue
    #optional
    .goto Dun Morogh,50.01,50.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_亚尔·锤石|r, 他在楼下
    >>|cRXP_WARN_如果你负担不起，请跳过此步骤|r
    .train 2575 >>列车 |T134708:0|t[采矿]
    .target Yarr Hammerstone
    .train 2018,3 --Blacksmithing
step << Warrior/Paladin/Rogue
    #optional
    #completewith QuarryEnd
    .cast 2580 >>|cRXP_WARN_Cast|r |T136025:0|t[寻找矿物]
    .usespell 2580
    .train 2575,3 --Mining
step << Hunter
    #season 2
    #sticky
    #label pigmeat
    >>杀死 |cRXP_ENEMY_Boars|r。拾取它们以获得 |T134026:0|t[丹莫洛猪肉]
    .collect 208192,1
    .mob Crag Boar
    .mob 老峭壁野猪
    .mob Large Crag Boar
    .mob Scarred Crag Boar
    .train 425762,1
step
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
    >>杀死 |cRXP_ENEMY_年轻黑熊|r。掠夺它们的 |cRXP_LOOT_厚熊皮|r
    >>杀死 |cRXP_ENEMY_Large Crag Boars|r 和 |cRXP_ENEMY_Crag Boars|r。拾取它们的 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r 和 |cRXP_LOOT_Crag Boar Ribs|r
    .complete 317,2 --Collect Thick 熊 Fur (x2)
    .mob +年轻的黑熊
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .disablecheckbox
    .mob Large Crag Boar
    .mob Crag Boar
step
    #optional
    #completewith EvershineEnd
    >>杀死 |cRXP_ENEMY_Large Crag Boars|r 和 |cRXP_ENEMY_Crag Boars|r。掠夺他们的 |cRXP_LOOT_Crag Boar Ribs|r
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob Large Crag Boar
    .mob Crag Boar
step
    .goto Dun Morogh,49.426,48.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_驾驶员贝隆·风箱|r
    .turnin 317 >>交任务: |cRXP_FRIENDLY_贝尔丁的补给|r
    .accept 318 >>接任务: |cRXP_LOOT_艾沃沙酒|r
    .target 飞行员 Bellowfiz
step << Mage
    #optional
    #completewith next
    .goto 1426,46.952,52.050,8,0
    .goto 1426,47.153,51.939,8 >>进入 Thunderbrew 酿酒厂
step << Mage
    #completewith next
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板贝尔姆|r, 他在里面
    .vendor 1247 >>|cRXP_BUY_只要你负担得起，就可以从他那里购买尽可能多的|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_|r
    .target Innkeeper Belm
    .money <0.0125
    .itemcount 1179,<1 --Ice Cold Milk (1)
    .xp >10,1
step << Warlock
    .xp 8
    --should be 8.5 here with 2.5x
step << Warlock
    .goto Dun Morogh,47.327,53.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉姆瑞兹·黑轮|r
    .trainer >>训练你的职业法术
    .target Gimrizz Shadowcog
step << Warlock
    .goto Dun Morogh,47.273,53.658
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_丹尼·血泡|r
    .vendor 6328 >>|cRXP_BUY_如果你买得起，就买|r |T133738:0|t[火箭魔法书（等级 2）] |cRXP_BUY_。如果买不起，可以稍后再买|r
    .target Gimrizz Shadowcog
    .money <0.100
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
    >>杀死 |cRXP_ENEMY_霜鬃先知s|r。掠夺他们以获得 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of a Desecrated Citadel|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob 霜鬃先知
    .train 402852,1
    --410935
step << Priest !NightElf
    #season 2
    #completewith end
    .train 402852 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_被亵渎城堡的预言|r]
    >>|cRXP_WARN_你必须通过在暴风城大教堂、洛克莫丹或铁炉堡的神秘结界的圣光祭坛旁输入 /pray 来获得 2|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buffs|r
    >>|cRXP_WARN_|T136057:0|t|cRXP_PICK_Meidtation on Elune|r 增益必须来自另一个牧师玩家，通过在你用 /kneel 跪下时对你使用 /pray 表情，如果你看到另一个牧师有另一个冥想增益，请向他们索要|r
    --.use 205947
    .target Altar of Light
    .itemcount 205947,1
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
    >>杀死 |cRXP_ENEMY_霜鬃先知s|r。从他们身上搜刮 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: MILEGIN VALF]|r
    .collect 203752,1
    .mob 霜鬃先知
    .train 401768,1
step << Mage
    #completewith end
    #season 2
    .collect 211779,1 >>您需要从 |cRXP_FRIENDLY_Reagent Vendor|r 处获得 |T135933:0|t[Comprehension Charm] 才能使用 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: MILEGIN VALF]|r
    .train 401768 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_咒语注释：MILEGIN VALF]|r |cRXP_WARN_进行训练|r |T135820:0|t[活火焰]
    .use 203752
step << Warrior/Paladin/Rogue
    #optional
    .goto Dun Morogh,50.084,49.420
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_罗斯洛·鲁治|r
    >>|cRXP_BUY_从他那里购买 a|r |T134708:0|t[采矿镐] |cRXP_BUY_|r
    .collect 2901,1 --Mining Pick (1)
    .target 洛斯洛·拉奇
    .train 2018,3 --Blacksmithing
step << Warrior/Paladin/Rogue
    #optional
    .goto Dun Morogh,50.01,50.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_亚尔·锤石|r, 他在楼下
    .train 2575 >>列车 |T134708:0|t[采矿]
    .target Yarr Hammerstone
    .train 2018,3 --Blacksmithing
step
    #optional
    #completewith next
    .goto 1426,46.952,52.050,8,0
    .goto 1426,47.153,51.939,8 >>进入 Thunderbrew 酿酒厂
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板贝尔姆|r, 他在里面
    >>|cRXP_BUY_从他那里购买 a|r |T132800:0|t[Rhapsody Malt] |cRXP_BUY_|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .target Innkeeper Belm
    .itemcount 2886,6 --Crag Boar Rib (6)
step
    .goto Dun Morogh,46.825,52.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格纳·雷酒|r, 他在外面
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
    .target Ragnar Thunderbrew
    .isQuestComplete 384
step << Paladin/Warrior/Rogue
    #optional
    #completewith Blacksmithing1
    .goto 1426,45.695,51.911,20 >>进入铁匠铺
step << Gnome Warrior
#optional
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格劳恩·索姆温|r
    >>|cRXP_BUY_购买 a|r |T135321:0|t[Gladius]
    .target Grawn Thromwyn
    .money <0.0536
    .collect 2488,1 --Collect Gladius (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Gnome Warrior
#optional
    #completewith next
    +|cRXP_WARN_装备|r |T135321:0|t[Gladius]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
step << Dwarf Warrior
#optional
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格劳恩·索姆温|r
    >>|cRXP_BUY_购买 a|r |T132401:0|t[大斧]
    .target Grawn Thromwyn
    .money <0.0460
    .collect 2491,1 --Collect Large Axe (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.30
step << Dwarf Warrior
#optional
    #completewith next
    +|cRXP_WARN_装备|r |T132401:0|t[大斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.29
step << Rogue
#optional
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格劳恩·索姆温|r
    >>|cRXP_BUY_购买 a|r |T135641:0|t[细高跟鞋]
    .target Grawn Thromwyn
    .money <0.0400
    .collect 2494,1 --Collect Stiletto (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
#optional
    #completewith next
    +|cRXP_WARN_装备|r |T135641:0|t[细高跟鞋]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Paladin
#optional
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格劳恩·索姆温|r
    >>|cRXP_BUY_购买 a|r |T133053:0|t[木槌]
    .target Grawn Thromwyn
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.00
step << Paladin
#optional
    #completewith next
    +|cRXP_WARN_装备|r |T133053:0|t[木槌]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.99
step << Hunter
    #optional
    .xp 6 >>磨练至 6 级
step << Hunter
    #season 2
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞夫|r
    .train 1130 >>训练 |T132212:0|t[猎人印记]
    >>|cRXP_WARN_如果你没有足够的钱，那就在卡拉诺斯周围种地。你稍后会需要这个咒语来获得符文|r
    .target Grif Wildheart

step
    #optional
    #completewith next
    .goto 1426,42.982,54.755
    .subzone 136 >>前往灰白之巢
    .isOnQuest 313
step
    #loop
    .goto 1426,42.982,54.755,0
    .goto 1426,41.918,54.053,0
    .goto 1426,41.100,48.927,0
    .goto 1426,42.982,54.755,40,0
    .goto 1426,41.901,55.217,40,0
    .goto 1426,41.918,54.053,40,0
    .goto 1426,42.177,53.274,40,0
    .goto 1426,41.100,48.927,40,0
    >>杀死 |cRXP_ENEMY_Wendigos|r 和 |cRXP_ENEMY_Young Wendigos|r。掠夺他们的 |cRXP_LOOT_Wendigo Manes|r
    .complete 313,1 --Collect Wendigo Mane (x8)
    .mob Wendigo
    .mob Young Wendigo
step
    .goto Dun Morogh,44.13,56.95
    >>打开 |cRXP_PICK_Ammo Crate|r。从中获取 |cRXP_LOOT_Rumbleshot's Ammo|r
    .complete 5541,1 --Collect Rumbleshot's Ammo (x1)
step
    #optional
    #completewith next
    .goto 1426,40.632,62.794,40,0
    .goto Dun Morogh,40.682,65.130,15 >>前往 |cRXP_FRIENDLY_Hegnar Rumbleshot|r
step << Hunter
    #optional
    .goto Dun Morogh,40.682,65.130
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_海格纳·重枪|r
    >>|cRXP_BUY_从他那里购买 a|r |T135611:0|t[华丽火枪]|cRXP_BUY_|r
    >>|cRXP_WARN_如果你负担不起，请跳过此步骤|r
    .turnin 5541 >>交任务: |cRXP_FRIENDLY_海格纳的弹药|r
    .collect 2509,1 -- Ornate Blunderbuss (1)
    .target Hegnar Rumbleshot
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.95
step
    #label 熊Fur
    .goto Dun Morogh,40.682,65.130
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_海格纳·重枪|r
    .turnin 5541 >>交任务: |cRXP_FRIENDLY_海格纳的弹药|r
    .target Hegnar Rumbleshot
step
    #label Tundra
    .goto Dun Morogh,34.577,51.652
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图德拉·马克格拉恩|r
    .accept 312 >>接任务: |cRXP_LOOT_马克格拉恩的干肉|r
    .target Tundra MacGrann
step
    .goto Dun Morogh,38.517,53.927
    >>打开 |cRXP_PICK_MacGrann 的肉柜|r。获取 |cRXP_LOOT_MacGrann 的干肉|r
    >>|cRXP_WARN_等待 |cRXP_ENEMY_Old Icebeard|r 从洞穴中巡逻出来。一旦他从洞穴中巡逻出来，你就可以进入并抢劫|r |cRXP_PICK_MacGrann 的肉柜|r
    .link https://www.youtube.com/watch?v=o55Y3LjgKoE >>|cRXP_WARN_点击此处查看视频参考|r
    .complete 312,1 --MacGrann's Dried Meats (1)
step
    .goto Dun Morogh,36.4,52.8
    >>尝试从洞穴外的野猪身上完成抢劫 |T133972:0|t[|cRXP_LOOT_Crag Boar Ribs|r]。|cRXP_WARN_如果没有，请跳过此步骤|r
    >>|cRXP_WARN_确保你已经拾取了|T134026:0|t[丹莫洛猪肉]。|cRXP_WARN_你现在需要它来获得符文|r << Hunter
    .collect 2886,6 --Crag Boar Rib (6)
    .collect 208192,1 << Hunter --Dun Morogh Pig Meat (1)
step
    .goto Dun Morogh,34.577,51.652
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图德拉·马克格拉恩|r
    .turnin 312 >>交任务: |cRXP_FRIENDLY_马克格拉恩的干肉|r
    .target Tundra MacGrann
step << Hunter
    #season 2
    #requires pigmeat
    .train 425762,1
    .goto Dun Morogh,37.78,42.55
    >>在洞穴内的尸体附近使用 |T134026:0|t[丹莫洛猪肉] 召唤 |cRXP_ENEMY_Jorul|r
    >>杀死 |cRXP_ENEMY_Jorul|r。从他身上搜刮 |T134419:0|t|cRXP_LOOT_[侧翼符文]|r
    .collect 205979,1
    .use 208192
    .mob Jorul
step << Hunter
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[侧翼符文]|r |cRXP_WARN_进行训练|r |T132175:0|t[侧翼打击]
    .use 205979
    .itemcount 205979,1
step
    #completewith next
    .goto Dun Morogh,30.453,46.005
    .subzone 137 >>前往布鲁纳尔村
step << Mage
    #completewith next
    .goto Dun Morogh,30.453,46.005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基格·吉布恩|r
    >>|cRXP_BUY_从他那里购买最多 20|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_|r
    .collect 1179,20
    .target Keeg Gibn
    .isOnQuest 318
step
    #label EvershineEnd
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷杰德·麦酒|r
    .turnin 318 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
    .goto Dun Morogh,30.190,45.726
    .target +Rejold 大麦啤酒
step << Hunter
    #season 2
    #sticky
    #label Marksmanship1
    .goto Dun Morogh,28.852,49.859
    >>对 |cRXP_ENEMY_Rustling Bush|r 施放 |T132212:0|t[猎人印记]
    >>杀死生成的 |cRXP_ENEMY_Razormane Poacher|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_Rune of Marksmanship|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Razormane Poacher
    .train 410113,1
step << Hunter
    #season 2
    #sticky
    #label Marksmanship2
    #requires Marksmanship1
    .cast 402265 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神射符文|r]
    .use 206155
    .train 410113,1
step << Priest
    #season 2
    >>杀死 |cRXP_ENEMY_Leper Gnomes|r。掠夺他们以获得 |T136222:0|t[|cRXP_FRIENDLY_Memory of a Dark Purpose|r]
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .mob Leper Gnome
    .train 425216,1
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
    >>杀死 |cRXP_ENEMY_Leper Gnomes|r。掠夺他们以获得 |T136222:0|t[|cRXP_FRIENDLY_Memory of a Dark Purpose|r]
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .mob Leper Gnome
    .train 425216,1
step << Priest
    #season 2
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗目的的记忆|r] |cRXP_WARN_训练|r |T237514:0|t[虚空瘟疫]
    >>|cRXP_WARN_你必须通过输入 /kneel 在圣地获得|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buff，例如北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘守卫|r
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
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_麻风侏儒|r. 掠夺他们以获得 |T134269:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 208218,1 -- Bottom-Right Map Piece (1)
    .mob Leper Gnome
    .train 398196,1
step
    #optional
    #requires ForceFavorRibYes
step
    #optional
    .goto 1426,24.975,50.473,20,0
    .goto 1426,24.682,50.836,20 >>沿着洞穴入口的一侧跑上去。跳进霜鬃堡垒
    .isOnQuest 287
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
    >>杀死洞穴内的 |cRXP_ENEMY_Frostmane Headhunters|r
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob Frostmane Headhunter
step << Rogue
    #season 2
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
    #completewith ShimmerweedCollect
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_Frostmane Trolls|r. 掠夺它们以获得 |T134327:0|t[|cRXP_LOOT_右上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    .collect 208213,1 -- Top-Right Map Piece (1)
    .mob 霜鬃先知
    .mob Frostmane Headhunter
    .mob 霜鬃雪行者
    .train 398196,1
step
    #requires Headhunters
    .goto Dun Morogh,22.86,52.16
    >>|cRXP_WARN_掉进洞穴里的小死胡同房间|r
    .complete 287,2 --Fully explore Frostmane Hold
step
    #completewith dm10end
    .deathskip >>在卡拉诺斯死亡并重生
    .subzoneskip 131
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板贝尔姆|r, 他在里面
    >>|cRXP_BUY_从他那里购买 a|r |T132800:0|t[Rhapsody Malt] |cRXP_BUY_和 a|r |T132800:0|t[Thunder Ale] |cRXP_BUY_|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .itemcount 2886,6 --Crag Boar Rib (6)
    .target Innkeeper Belm
step
    .goto Dun Morogh,46.825,52.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格纳·雷酒|r, 他在外面
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
    .target Ragnar Thunderbrew
    .isQuestComplete 384
step
    #label dm10end
    .goto Dun Morogh,46.726,53.826
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_森内尔·白须|r
    .turnin 287 >>交任务: |cRXP_FRIENDLY_霜鬃巨魔要塞|r
    .accept 291 >>接任务: |cRXP_LOOT_森内尔的报告|r
    .target Senir Whitebeard
step << Hunter
    #label dm10end
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞夫|r
    .trainer >>训练你的职业法术
    .accept 6064 >>接任务: |cRXP_LOOT_驯服野兽|r << Dwarf
    .target Grif Wildheart
step << Dwarf Hunter
    .goto Dun Morogh,48.3,56.9
    >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_on a|r |cRXP_ENEMY_Large Crag Boar|r
    .complete 6064,1 --Tame a Large Crag Boar (1)
    .use 15911
    .mob Large Crag Boar
step << Dwarf Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞夫|r
    .turnin 6064 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6084 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Grif Wildheart
step << Dwarf Hunter
    .goto Dun Morogh,49.4,59.4
    >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_on a|r |cRXP_ENEMY_雪豹|r
    .complete 6084,1 --Tame a 雪豹 (1)
    .use 15913
    .mob 雪豹
step << Dwarf Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞夫|r
    .turnin 6084 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6085 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Grif Wildheart
step << Dwarf Hunter
    .goto Dun Morogh,50.4,59.7
    >>|cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_on a|r |cRXP_ENEMY_冰爪熊|r
    .complete 6085,1 --Tame an 冰爪熊 (1)
    .use 15908
    .mob 冰爪熊
step << Dwarf Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞夫|r
    .turnin 6085 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6086 >>接任务: |cRXP_LOOT_训练野兽|r
    .target Grif Wildheart
step << Rogue
    .goto Dun Morogh,47.563,52.608
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍格拉尔·巴坎|r
    >>|cRXP_WARN_仅训练|r |T132147:0|t[双持] |cRXP_WARN_和|r |T132307:0|t[冲刺]|cRXP_WARN_。不要训练其他法术以节省资金以备后用|r
    .train 674 >>训练 |T132147:0|t[双持]
    .train 2983 >>列车 |T132307:0|t[冲刺]
    .accept 2218 >>接任务: |cRXP_LOOT_救赎之路|r
    .target Hogral Bakkan
step << Paladin
    .goto Dun Morogh,47.597,52.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿扎尔·战锤|r, 他在楼上
    .trainer >>训练你的职业法术
    .target Azar Stronghammer
step << Warrior
    .goto Dun Morogh,47.360,52.646
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格兰尼斯·快斧|r, 他在里面
    .trainer >>训练你的职业法术
    .target Granis Swiftaxe
step << Mage
    .goto Dun Morogh,47.498,52.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛济斯·石衣|r, 他在楼上
    .train 118 >>列车 |T136071:0|t[变形术]
    .target Magis Sparkmantle
step << Priest
    .goto Dun Morogh,47.342,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马克萨恩·安沃尔|r, 他在里面
    .trainer >>训练你的职业法术
    .target Maxan Anvol
step << Warrior/Rogue/Paladin
    .goto Dun Morogh,47.180,52.610
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨姆诺·普尔|r
    .train 3273 >>列车 |T135966:0|t[急救]
    .target Thamner Pol
    .money <0.01
step
    .goto Dun Morogh,49.622,48.612
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_驾驶员迪恩·石轮|r
    .turnin 313 >>交任务: |cRXP_FRIENDLY_灰色洞穴|r
    .target 飞行员石甲
step << Warrior
    #optional
    #completewith next
    +|cRXP_WARN_升级直到你有价值 10s30c 的可销售物品|r
    .money >0.1030
step << Warrior
    .goto Dun Morogh,47.58,41.58,40,0
    .goto Dun Morogh,50.19,40.79,20,0
    .goto Ironforge,14.90,87.10,40 >>前往: |cRXP_PICK_铁炉堡|r
step << Warrior
    .goto Ironforge,62.237,89.628
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_比克斯|r, |cRXP_FRIENDLY_布里维夫·石拳|r
    .trainer >>如果你现在在队伍中或有人帮你杀死 |cRXP_ENEMY_Vagash|r，请从 |cRXP_FRIENDLY_布里维夫·石手|r 训练双手锤，否则请从 |cRXP_FRIENDLY_比西·沃布尔邦克|r 训练投掷武器。如果你不确定要训练哪个，请只训练投掷武器
    .target 比西·沃布尔邦克
    .target 布里维夫·石手
step << Warrior
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布雷文·寒钢|r, 他在楼下
    >>|cRXP_BUY_从她那里购买|r |T135425:0|t[Keen Throwing Knives] |cRXP_BUY_|r
    .collect 3107,200 --Collect Keen Throwing Knife (200)
    .target Brenwyn Wintersteel
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Warrior
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布雷文·寒钢|r, 他在楼下
    >>|cRXP_BUY_从她那里购买|r |T135641:0|t[平衡投掷匕首] |cRXP_BUY_|r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target Brenwyn Wintersteel
    .xp >11,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #optional
    #completewith Dirt
    +|cRXP_WARN_Equip the|r |T135425:0|t[敏锐的投掷刀具]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Warrior
    #optional
    #completewith Dirt
    +|cRXP_WARN_Equip the|r |T135641:0|t[平衡投掷匕首]
    .use 2946
    .itemcount 2946,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0

]])
