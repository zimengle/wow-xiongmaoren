local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#hardcore
#classic
#era/som--h
<< Alliance
#name 1-6 寒脊山谷
#displayname 1-6 寒脊山谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 生存指南((联盟)
#subgroup RXP生存指南 1-20
#defaultfor Dwarf/Gnome
#next 6-10 丹莫罗
step << !Gnome !Dwarf
    #sticky
    #completewith next
    .goto Dun Morogh,29.927,71.201
    +您选择的指南适用于侏儒和矮人. 请确保选择与您起始职业相同的初始区域
step << !Warlock
    #completewith next
    .destroy 6948
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .goto Dun Morogh,29.927,71.201
    .accept 179 >>接任务: |cRXP_LOOT_矮人的交易|r
    .target Sten Stoutarm
step << Warrior
    .goto Dun Morogh,29.68,74.20,40,0
    >>击杀|r|cRXP_ENEMY_Ragged Young Wolves|r, 直到你获得价值10铜币以上的垃圾物品
    >>|cRXP_WARN_你将学习|r|T132333:0|t[战斗怒吼]|cRXP_WARN_这能提升早期升级速度|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦德尔·哈金|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    .target +Grundel Harkin
    .goto Dun Morogh,28.793,67.838
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .train 6673 >>训练 |T132333:0|t[战斗怒吼]
    .target +Thran Khorman
    .goto Dun Morogh,28.832,67.242
    .mob Ragged Young Wolf
    .mob Ragged Timber Wolf
step << Warlock
    #completewith next
    .goto Dun Morogh,28.792,68.497,20 >>进入安威玛尔
    >>|cRXP_WARN_在途中卸下你的躯体护甲和衬衫和裤子和靴子, 然后将它们出售|r
step << Warlock
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .vendor >>|cRXP_WARN_出售你的身体护甲和衬衫和裤子和靴子, 以及背包中的食物和水. 你需要总共10铜币|r
    .target Durnan Furcutter
step << Warlock
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r交谈
    .train 348 >>训练 |T135817:0|t[献祭]
    .accept 1599 >>接任务: |cRXP_LOOT_开端|r
    .target Alamar Grimm
step
    .goto Dun Morogh,30.79,74.48,50,0
    .goto Dun Morogh,29.02,76.38,50,0
    .goto Dun Morogh,26.68,75.57
    >>击杀|cRXP_ENEMY_Ragged Young Wolves|r和 |cRXP_ENEMY_Ragged Timber Wolves|r. 击败它们后搜刮出|cRXP_LOOT_硬狼肉|r
    >>|cRXP_WARN_装备你从|r|cRXP_ENEMY_Young Wolves身上掉落的任意一件布甲|r << Warlock
    .complete 179,1 --Collect Tough Wolf Meat (x8)
    .mob Ragged Young Wolf
    .mob Ragged Timber Wolf
step
    .xp 2 >>升级至2级
step << Warlock
    .goto Dun Morogh,29.927,71.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
    .accept 3115 >>接任务: |cRXP_LOOT_被污染的备忘录|r << Gnome Warlock
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .target Sten Stoutarm
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .goto Dun Morogh,29.709,71.255
    .accept 170 >>接任务: |cRXP_LOOT_新的威胁|r
    .target Balir Frosthammer
step << Warlock
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德林·怒流|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    >>|cRXP_BUY_购买 15|r|T132794:0|t[清凉的泉水]|cRXP_BUY_. 如果钱不够, 可以额外击杀|cRXP_ENEMY_破烂幼狼|r获取金币|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target Adlin Pridedrift
step << Warlock
    #completewith next
    .goto Dun Morogh,27.28,81.09,20 >>进入霜鬃洞穴
step << Warlock
    >>击杀洞穴内的霜鬃巨魔新兵. 掠夺他们以获得羽毛咒符
    >>|cRXP_BUY_装备你从|r|cRXP_ENEMY_Frostmanes身上掉落的任意布甲|r
    .goto Dun Morogh,29.0,82.6,50,0
    .goto Dun Morogh,29.0,81.2,60,0
    .goto Dun Morogh,30.1,82.4
    .complete 1599,1 --Collect Feather Charm (x3)
    .mob Frostmane Novice
step << Warlock
    #hardcore
    #completewith next
    .hs >>炉石到寒脊山谷
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r交谈
    .goto Dun Morogh,28.650,66.145
    .turnin 1599 >>交任务: |cRXP_FRIENDLY_开端|r
    .turnin 3115 >>交任务: |cRXP_FRIENDLY_被污染的备忘录|r << Gnome Warlock
    .target Alamar Grimm
step << Priest/Mage
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德林·怒流|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    >>|cRXP_BUY_购买 15|r|T132794:0|t[清凉的泉水]|cRXP_BUY_. 如果钱不够, 可以额外击杀|cRXP_ENEMY_破烂幼狼|r获取金币|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target Adlin Pridedrift
step << Paladin/Warrior
    #completewith next
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德林·怒流|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    .target Adlin Pridedrift
step << !Warlock
    .goto Dun Morogh,29.927,71.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 3106 >>接任务: |cRXP_LOOT_简易符文|r << Dwarf Warrior
    .accept 3107 >>接任务: |cRXP_LOOT_神圣符文|r << Paladin
    .accept 3109 >>接任务: |cRXP_LOOT_密文符文|r << Dwarf Rogue
    .accept 3110 >>接任务: |cRXP_LOOT_神圣符文|r << Priest
    .accept 3112 >>接任务: |cRXP_LOOT_简易备忘录|r << Gnome Warrior
    .accept 3113 >>接任务: |cRXP_LOOT_密文备忘录|r << Gnome Rogue
    .accept 3114 >>接任务: |cRXP_LOOT_雕文备忘录|r << Mage
    .accept 3108 >>接任务: |cRXP_LOOT_风蚀符文|r << Dwarf Hunter
    .target Sten Stoutarm
step << !Warlock
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .goto Dun Morogh,29.709,71.255
    .accept 170 >>接任务: |cRXP_LOOT_新的威胁|r
    .target Balir Frosthammer
step
    #era
    #completewith Rockjaw
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +Rockjaw Trogg
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +Burly Rockjaw Trogg
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .target Talin Keeneye
    .goto Dun Morogh,22.601,71.433
    .turnin 233 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
    .accept 183 >>接任务: |cRXP_LOOT_猎杀野猪|r
    .accept 234 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
step
    .goto Dun Morogh,22.2,72.5,40,0
    .goto Dun Morogh,20.5,71.4,40,0
    .goto Dun Morogh,21.1,69.0,40,0
    .goto Dun Morogh,22.8,69.6,40,0
    .goto Dun Morogh,22.2,72.5,40,0
    .goto Dun Morogh,20.5,71.4,40,0
    .goto Dun Morogh,21.79,71.60
    >>击杀|cRXP_ENEMY_小型峭壁野猪|r
    .complete 183,1 --Kill Small Crag Boar (x12)
    .mob Small Crag Boar
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .target Talin Keeneye
    .goto Dun Morogh,22.601,71.433
    .turnin 183 >>交任务: |cRXP_FRIENDLY_猎杀野猪|r
step << Paladin/Mage/Warlock/Hunter
    #era
    .xp 3+1130 >>升级至1130+/1400经验值
    .goto Dun Morogh,23.0,75.0,50,0
    .goto Dun Morogh,24.2,72.5,50,0
    .goto Dun Morogh,27.7,76.3,50,0
    .goto Dun Morogh,23.0,75.0,50,0
    .goto Dun Morogh,24.2,72.5
step
    #label Rockjaw
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .target Grelin Whitebeard
    .goto Dun Morogh,25.076,75.713
    .turnin 234 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
    .accept 182 >>接任务: |cRXP_LOOT_巨魔洞穴|r
step << Paladin/Mage/Warlock/Hunter
    .xp 4
step << Paladin/Mage/Warlock/Hunter
    #era
    .goto Dun Morogh,31.37,75.63
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +Rockjaw Trogg
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +Burly Rockjaw Trogg
step << Paladin/Mage/Warlock/Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .target Nori Pridedrift
    .goto Dun Morogh,24.980,75.963
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
step << Paladin/Mage/Warlock/Hunter
    #completewith next
    .goto Dun Morogh,28.792,68.497,20 >>前往安威玛尔
step << Paladin/Mage/Warlock/Hunter
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .target Durnan Furcutter
step << Hunter
    .goto Dun Morogh,29.175,67.455
    .target Thorgas Grimson
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索加斯·格瑞姆森|r交谈
    .turnin 3108 >>交任务: |cRXP_FRIENDLY_风蚀符文|r
    .train 1978 >>训练毒蛇钉刺
step << Dwarf Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r交谈
    .target Bromos Grummner
    .goto Dun Morogh,28.833,68.332
    .turnin 3107 >>交任务: |cRXP_FRIENDLY_神圣符文|r
    .trainer >>训练你的职业法术
step << Gnome Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r交谈
    .target Marryk Nurribit
    .goto Dun Morogh,28.709,66.366
    .turnin 3114 >>交任务: |cRXP_FRIENDLY_雕文备忘录|r
    .trainer >>训练你的职业法术
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r交谈
    .target Alamar Grimm
    .goto Dun Morogh,28.650,66.145
    .trainer >>训练你的腐蚀之触技能
step << Paladin/Mage/Warlock/Hunter
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .target Balir Frosthammer
    .goto Dun Morogh,29.709,71.255
    .turnin 170 >>交任务: |cRXP_FRIENDLY_新的威胁|r
step << Hunter
    #completewith next
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德林·怒流|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    >>|cRXP_WARN_购买 2 堆|r|T132384:0|t[轻弹丸]
    .collect 2516,400 -- Light Shot (400)
    .target Adlin Pridedrift
step << Mage/Warlock
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德林·怒流|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    >>|cRXP_BUY_购买 10|r|T132794:0|t[清凉的泉水]|cRXP_BUY_. 如果钱不够, 可以额外击杀|cRXP_ENEMY_破碎幼狼|r获取金币|r
    .collect 159,10 --Collect Refreshing Spring Water (x15)
    .target Adlin Pridedrift
step << !Paladin !Mage !Warlock !Hunter
    #era
    #completewith next
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +Rockjaw Trogg
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +Burly Rockjaw Trogg
step << Paladin/Mage/Warlock/Hunter
    .goto Dun Morogh,26.3,79.2,40,0
    .goto Dun Morogh,22.7,79.3,40,0
    .goto Dun Morogh,20.9,75.7,40,0
    .goto Dun Morogh,22.7,79.3,40,0
    .goto Dun Morogh,20.9,75.7
    >>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .mob Frostmane Troll Whelp
step << !Paladin !Mage !Warlock !Hunter
    .goto Dun Morogh,22.7,79.3,40,0
    .goto Dun Morogh,20.9,75.7,40,0
    .goto Dun Morogh,22.7,79.3,40,0
    .goto Dun Morogh,20.9,75.7,40,0
    .goto Dun Morogh,22.7,79.3,40,0
    .goto Dun Morogh,20.9,75.7,40,0
    .goto Dun Morogh,22.7,79.3
    >>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .mob Frostmane Troll Whelp
step << !Paladin !Mage
    #label TrollTroggs
    .goto Dun Morogh,28.7,77.5
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +Rockjaw Trogg
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +Burly Rockjaw Trogg
step << !Paladin !Mage !Warlock !Hunter
    .xp 4 >>升级至4级
step << !Paladin !Mage !Warlock !Hunter
    #era
    #requires TrollTroggs
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .target Grelin Whitebeard
    .goto Dun Morogh,25.076,75.713
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
    .accept 218 >>接任务: |cRXP_LOOT_被窃取的日记|r
step << !Paladin !Mage !Warlock !Hunter
    #som
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .target Grelin Whitebeard
    .goto Dun Morogh,25.076,75.713
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
    .accept 218 >>接任务: |cRXP_LOOT_被窃取的日记|r
step << Paladin/Mage/Warlock/Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .target Grelin Whitebeard
    .goto Dun Morogh,25.076,75.713
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
    .accept 218 >>接任务: |cRXP_LOOT_被窃取的日记|r
step << Paladin/Mage/Warlock/Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .target Nori Pridedrift
    .goto Dun Morogh,24.980,75.963
    .turnin 3365 >>交任务: |cRXP_FRIENDLY_归还酒杯|r
step
    #completewith next
    .goto Dun Morogh,27.28,81.09,20 >>进入霜鬃洞穴
step
    .goto Dun Morogh,26.8,79.9,30,0
    .goto Dun Morogh,29.0,79.0,15,0
    .goto Dun Morogh,30.6,80.3
    >>击杀|cRXP_ENEMY_Grik'nir the Cold|r. 击败后搜刮他的|cRXP_LOOT_Journal|r
    .complete 218,1 --Collect Grelin Whitebeard's Journal (x1)
    .mob Grik'nir the Cold
step << !Paladin !Mage !Warlock !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .target Nori Pridedrift
    .goto Dun Morogh,24.980,75.963
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
step << !Paladin !Mage !Warlock !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .target Grelin Whitebeard
    .goto Dun Morogh,25.075,75.715
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 282 >>接任务: |cRXP_LOOT_森内尔的观察站|r
step << !Paladin !Mage !Warlock !Hunter
    #completewith next
    .goto Dun Morogh,28.792,68.497,20 >>前往安威玛尔
step << !Paladin !Mage !Warlock !Hunter
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .target Durnan Furcutter
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索姆·哈格林|r交谈
    .target Solm Hargrin
    .goto Dun Morogh,28.4,67.5
    .turnin 3113 >>交任务: |cRXP_FRIENDLY_密文备忘录|r << Gnome Rogue
    .turnin 3109 >>交任务: |cRXP_FRIENDLY_密文符文|r << Dwarf Rogue
step << Dwarf Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰斯托克·卡德尔|r交谈
    .target Branstock Khalder
    .goto Dun Morogh,28.600,66.385
    .turnin 3110 >>交任务: |cRXP_FRIENDLY_神圣符文|r
    .trainer >>训练你的职业法术
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .target Thran Khorman
    .goto Dun Morogh,28.832,67.242
    .turnin 3106 >>交任务: |cRXP_FRIENDLY_简易符文|r << Dwarf Warrior
    .turnin 3112 >>交任务: |cRXP_FRIENDLY_简易备忘录|r << Gnome Warrior
    .trainer >>训练你的职业法术
step << !Paladin !Mage !Warlock !Hunter
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .target Balir Frosthammer
    .goto Dun Morogh,29.709,71.255
    .turnin 170 >>交任务: |cRXP_FRIENDLY_新的威胁|r
step << Priest
    .money <0.0025
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德林·怒流|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    >>|cRXP_BUY_购买 10|r|T132794:0|t[清凉的泉水]
    .collect 159,10 --Collect Refreshing Spring Water (x15)
    .target Adlin Pridedrift
step << Paladin/Mage/Warlock/Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .target Grelin Whitebeard
    .goto Dun Morogh,25.075,75.715
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 282 >>接任务: |cRXP_LOOT_森内尔的观察站|r
step << !Paladin !Mage !Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .target Nori Pridedrift
    .goto Dun Morogh,24.980,75.963
    .turnin 3365 >>交任务: |cRXP_FRIENDLY_归还酒杯|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人萨鲁斯|r交谈
    .target Mountaineer Thalos
    .goto Dun Morogh,33.484,71.841
    .turnin 282 >>交任务: |cRXP_FRIENDLY_森内尔的观察站|r
    .accept 420 >>接任务: |cRXP_LOOT_森内尔的观察站|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉兹·跳链|r交谈
    .target Hands Springsprocket
    .goto Dun Morogh,33.847,72.236
    .accept 2160 >>接任务: |cRXP_LOOT_塔诺克的补给品|r
step
    .goto Dun Morogh,34.32,70.95,15,0
    .goto Dun Morogh,35.65,65.79,15 >>穿越寒脊山口
]])

RXPGuides.RegisterGuide([[
#hardcore
#era/som--h
#classic
<< Alliance
#name 6-10 丹莫罗
#displayname 6-10 丹莫罗 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 生存指南((联盟)
#subgroup RXP生存指南 1-20
#defaultfor Dwarf/Gnome
#next 10-11 艾尔文森林(矮人/侏儒)
step
    #completewith BoarMeat44 << !Paladin !Warrior !Rogue
    #completewith BearFur << Paladin/Warrior/Rogue
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r. 击败它们后, 从其身上搜刮出 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    .collect 769,4,317,1 --Collect Chunk of Boar Meat (x4)
    .mob Crag Boar
    .mob Large Crag Boar
step
    #completewith BoarMeat44 << !Paladin !Warrior !Rogue
    #completewith BearFur << Paladin/Warrior/Rogue
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r. 击败它们后掠夺其|cRXP_LOOT_峭壁野猪肋排|r
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob Crag Boar
    .mob Large Crag Boar
step
    .goto Dun Morogh,36.4,62.9,45,0
    .goto Dun Morogh,37.7,60.5,45,0
    .goto Dun Morogh,46.726,53.826
    .xp 5+2145 >>前往哈诺斯. 在途中击杀峭壁野猪, 练级至2145/+2800经验 << Priest
    .xp 5+2415 >>前往哈拉诺斯. 在途中击杀峭壁野猪, 练级至2415/+2800经验 << !Priest
    .mob Crag Boar
    .mob Large Crag Boar
step
    #completewith next
    .goto Dun Morogh,46.726,53.826,30 >>前往哈拉诺斯. 途中击杀峭壁野猪
    .mob Crag Boar
    .mob Large Crag Boar
step
    .goto Dun Morogh,46.726,53.826
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .turnin 420 >>交任务: |cRXP_FRIENDLY_森内尔的观察站|r
    .target Senir Whitebeard
step << Warlock
    .goto Dun Morogh,47.329,53.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉姆瑞兹·黑轮|r交谈
    .trainer >>训练你的职业法术
    .target Gimrizz Shadowcog
step << Warlock
    .goto Dun Morogh,47.273,53.684
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼·血泡|r交谈
    .vendor >>|cRXP_BUY_如果你买得起, 就买|r |T133738:0|t[魔典：血契(等级 1)] |cRXP_BUY_. 如果买不起, 稍后再买|r
    .target Dannie Fizzwizzle
step << !Priest
    .goto Dun Morogh,48.3,57.0
    .xp 6 >>升级至6级
step << Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .trainer >>训练你的职业法术
    .train 3044 >>学习奥术射击
    .target Grif Wildheart
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉格纳·雷酒|r交谈
    .target Ragnar Thunderbrew
    .goto Dun Morogh,46.825,52.361
    .accept 384 >>接任务: |cRXP_LOOT_啤酒烤猪排|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔诺克·霜锤|r交谈
    .target Tannok Frosthammer
    .goto Dun Morogh,47.217,52.195
    .turnin 2160 >>交任务: |cRXP_FRIENDLY_塔诺克的补给品|r
step << Rogue
    .goto Dun Morogh,47.189,52.403
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克雷格·比尔姆|r交谈
    .vendor >>|cRXP_BUY_购买并装备一个|r|T135426:0|t[破损的小飞刀]
    .target Kreg Bilmn
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与后室内的|cRXP_FRIENDLY_霍格拉尔·巴坎|r交谈
    .target Hogral Bakkan
    .goto Dun Morogh,47.563,52.608
    .trainer >>训练你的职业法术
step << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_玛济斯·石衣|r交谈
    .target Magis Sparkmantle
    .goto Dun Morogh,47.498,52.076
    .trainer >>训练你的职业法术
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_阿扎尔·战锤|r交谈
    .target Azar Stronghammer
    .goto Dun Morogh,47.597,52.070
    .trainer >>训练你的职业法术
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克萨恩·安沃尔|r交谈
    .target Maxan Anvol
    .goto Dun Morogh,47.342,52.190
    .accept 5625 >>接任务: |cRXP_LOOT_圣光之衣|r
step << Priest
    >>对|cRXP_FRIENDLY_巡山人多尔夫|r使用治疗术(低阶)第2级, 然后施放真言术:坚韧
    .target Mountaineer Dolf
    .goto Dun Morogh,45.805,54.568
    .complete 5625,1 --Heal and fortify Mountaineer Dolf
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克萨恩·安沃尔|r交谈
    .target Maxan Anvol
    .goto Dun Morogh,47.342,52.190
    .turnin 5625 >>交任务: |cRXP_FRIENDLY_圣光之衣|r
    .trainer >>训练你的职业法术
step << Priest
    .xp 6 >>升级至6级
step << Priest/Mage/Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    .target Innkeeper Belm
    .goto Dun Morogh,47.377,52.523
    .home >>将你的[炉石]设置为雷酒酿造厂
    .vendor >>|cRXP_BUY_尽可能多地购买|r|T132815:0|t[冰镇牛奶]|r
step << !Mage !Priest !Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    .target Innkeeper Belm
    .goto Dun Morogh,47.377,52.523
    .home >>将你的[炉石]设置为雷酒酿造厂
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格兰尼斯·快斧|r_交谈
    .target Granis Swiftaxe
    .goto Dun Morogh,47.360,52.646
    .trainer >>训练你的职业法术
step << Paladin/Warrior
    #completewith next
    .goto Dun Morogh,45.8,51.8,20 >>前往铁匠铺
step << Gnome Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r|T135321:0|t[步兵剑]
    .target Grawn Thromwyn
    .money <0.0536
    .goto Dun Morogh,45.290,52.190
    .collect 2488,1 --Collect Gladius (1)
step << Dwarf Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备 a|r |T132401:0|t[双刃战斧]
    .target Grawn Thromwyn
    .money <0.0460
    .goto Dun Morogh,45.290,52.190
    .collect 2491,1 --Collect Large Axe (1)
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r|T135641:0|t[卷刃的剑]
    .target Grawn Thromwyn
    .money <0.0400
    .goto Dun Morogh,45.290,52.190
    .collect 2494,1 --Collect Stiletto (1)
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r|T133053:0|t[木槌棒]
    .target Grawn Thromwyn
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
step << Warrior/Rogue/Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托格努斯·燧火|r交谈
    .target Tognus Flintfire
    .goto Dun Morogh,45.3,51.9
    .trainer >>训练 |T136241:0|t[锻造]
    >>|cRXP_WARN_这将让你制作 |T135248:0|t[劣质磨刀石], 提升近战攻击伤害+2点. 这在游戏早期阶段非常重要|r << Warrior/Rogue
    >>|cRXP_WARN_这将使你能够制作 |T135255:0|t[劣质平衡石], 提升近战攻击伤害+2点. 这在游戏前期非常关键|r << Paladin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨雷克·黑石|r交谈
    .target Tharek Blackstone
    .goto Dun Morogh,46.021,51.676
    .accept 400 >>接任务: |cRXP_LOOT_贝尔丁的工具|r
step
    .goto Dun Morogh,49.426,48.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    >>|cRXP_WARN_途中不要杀死任何黑熊幼崽|cRXP_ENEMY_Young Black Bears|r|r
    .target Pilot Bellowfiz
    .accept 317 >>接任务: |cRXP_LOOT_贝尔丁的补给|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .target Pilot Stonegear
    .goto Dun Morogh,49.622,48.612
    .accept 313 >>接任务: |cRXP_LOOT_灰色洞穴|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔丁·钢架|r交谈
    .target Beldin Steelgrill
    .goto Dun Morogh,50.443,49.092
    .turnin 400 >>交任务: |cRXP_FRIENDLY_贝尔丁的工具|r
step
    #label BoarMeat44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗斯洛·鲁治|r交谈
    .target Loslor Rudge
    .goto Dun Morogh,50.084,49.420
    .accept 5541 >>接任务: |cRXP_LOOT_海格纳的弹药|r
step << Warrior/Paladin/Rogue
    #completewith next
    .money <0.0091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗斯洛·鲁治|r交谈
    .goto Dun Morogh,50.084,49.420
    >>|cRXP_BUY_购买|r|T134708:0|t[矿工锄]|cRXP_BUY_若已掌握|r|T136241:0|t[锻造]
    .collect 2901,1
    .target Loslor Rudge
step << Warrior/Paladin/Rogue
    .goto Dun Morogh,50.01,50.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚尔·锤石|r交谈
    .trainer >>训练 |T134708:0|t[采矿]
    .target Yarr Hammerstone
step << Warrior/Paladin/Rogue
    .cast 2580 >>|cRXP_WARN_Cast|r|T136025:0|t[采集矿物]
step << Paladin/Warrior/Rogue
    #completewith BearFur
    >>击杀|cRXP_ENEMY_黑熊幼崽|r. 击败它们后搜刮其|cRXP_LOOT_Fur|r
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob Young Black Bear
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
    >>击杀|cRXP_ENEMY_黑熊幼崽|r. 击败它们后搜刮其|cRXP_LOOT_Fur|r
    >>击杀|cRXP_ENEMY_Crag Boars|r和|cRXP_ENEMY_Large Crag Boars|r. 击败它们后拾取 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r和|cRXP_LOOT_峭壁野猪肋排|r
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob +Young Black Bear
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .mob +Crag Boar
    .mob +Large Crag Boar
    .collect 2886,6,384,1,1 --Collect Crag Boar Rib (x6)
    .mob +Crag Boar
    .mob +Large Crag Boar
step << !Paladin !Warrior !Rogue
    #completewith Ribs
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r. 击败它们后掠夺其|cRXP_LOOT_峭壁野猪肋排|r
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob Crag Boar
    .mob Large Crag Boar
step << !Paladin !Warrior !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .target Pilot Bellowfiz
    .goto Dun Morogh,49.426,48.410
    .turnin 317 >>交任务: |cRXP_FRIENDLY_贝尔丁的补给|r
    .accept 318 >>接任务: |cRXP_LOOT_艾沃沙酒|r
step << Warrior
    #completewith next
    .goto Dun Morogh,46.9,52.1,20,0
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    .vendor >>|cRXP_BUY_尽可能多地购买|r|T133968:0|t[刚出炉的面包]|r
    .target Innkeeper Belm
step << Priest/Mage/Warlock
    #completewith next
    .goto Dun Morogh,46.9,52.1,20,0
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    .vendor >>|cRXP_BUY_尽可能多地购买|r|T132815:0|t[冰镇牛奶]|r
    .target Innkeeper Belm
step
    #completewith next
    .goto Dun Morogh,42.38,55.28,40 >>前往灰色洞穴
step
    .goto Dun Morogh,42.25,53.68,40,0
    .goto Dun Morogh,41.07,49.04,50,0
    .goto Dun Morogh,42.25,53.68
    >>击杀|cRXP_ENEMY_雪怪|r和|cRXP_ENEMY_雪怪幼崽|r. 击败它们后拾取其掉落的|cRXP_LOOT_鬃毛|r`
    >>|cRXP_WARN_记得留意|r|T134566:0|t[铜矿脉] |cRXP_WARN_会产出|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_用来制作|r|T135248:0|t[劣质磨刀石] << Warrior/Rogue
    >>|cRXP_WARN_记得留意|r|T134566:0|t[铜矿脉] |cRXP_WARN_可产出|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_用来制作|r|T135255:0|t[劣质平衡石] << Paladin
    .complete 313,1 --Collect Wendigo Mane (x8)
    .mob Wendigo
    .mob Young Wendigo
step
    .goto Dun Morogh,44.13,56.95
    >>打开|cRXP_PICK_弹药箱|r. 从中获取|cRXP_LOOT_Rumbleshot's Ammo|r
    .complete 5541,1 --Collect Rumbleshot's Ammo (x1)
step
    #label BearFur
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海格纳·重枪|r交谈
    .target Hegnar Rumbleshot
    .goto Dun Morogh,40.6,62.6,50,0
    .goto Dun Morogh,40.682,65.130
    .turnin 5541 >>交任务: |cRXP_FRIENDLY_海格纳的弹药|r
step << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海格纳·重枪|r交谈
    .goto Dun Morogh,40.682,65.130
    >>|cRXP_BUY_购买并装备 |T135611:0|t[精制短枪]|cRXP_BUY_. 如果负担不起, 请跳过此步骤|r
    .collect 2509,1 -- Ornate Blunderbuss (1)
    .money <0.0414
    .target Hegnar Rumbleshot
step << !Paladin !Warrior !Rogue
    .xp 7 >>升级到7级
step << Paladin/Warrior/Rogue
    .goto Dun Morogh,51.4,50.4
    >>击杀|cRXP_ENEMY_黑熊幼崽|r. 击败它们后搜刮其|cRXP_LOOT_Fur|r
    >>击杀|cRXP_ENEMY_Crag Boars|r和|cRXP_ENEMY_Large Crag Boars|r. 击败它们后拾取 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r和|cRXP_LOOT_峭壁野猪肋排|r
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob +Young Black Bear
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .mob +Crag Boar
    .mob +Large Crag Boar
    .collect 2886,6,384,1,1 --Collect Crag Boar Rib (x6)
    .mob +Crag Boar
    .mob +Large Crag Boar
step << Paladin/Warrior/Rogue
    #completewith Ribs
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r. 击败它们后掠夺其|cRXP_LOOT_峭壁野猪肋排|r
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob Crag Boar
    .mob Large Crag Boar
step << Warrior/Paladin/Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .target Pilot Bellowfiz
    .goto Dun Morogh,49.426,48.410
    .turnin 317 >>交任务: |cRXP_FRIENDLY_贝尔丁的补给|r
    .accept 318 >>接任务: |cRXP_LOOT_艾沃沙酒|r
step << Warrior/Paladin/Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .target Pilot Stonegear
    .goto Dun Morogh,49.622,48.612
    .turnin 313 >>交任务: |cRXP_FRIENDLY_灰色洞穴|r
step << Warrior/Paladin/Rogue
    .goto Dun Morogh,50.084,49.420
    .collect 2901,1 >>购买矿工锄
step << Warrior/Paladin/Rogue
    #era
    .xp 7 >>升级到7级
step << Warrior/Rogue
    #som
    .xp 8 >>击杀附近的怪物直到数量达到8个
step << Rogue
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与后室内的|cRXP_FRIENDLY_霍格拉尔·巴坎|r交谈
    .target Hogral Bakkan
    .goto Dun Morogh,47.563,52.608
    .trainer >>训练你的职业法术
step << Paladin
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_阿扎尔·战锤|r交谈
    .target Azar Stronghammer
    .goto Dun Morogh,47.597,52.070
    .trainer >>训练你的职业法术
step << Warrior
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格兰尼斯·快斧|r_交谈
    .target Granis Swiftaxe
    .goto Dun Morogh,47.360,52.646
    .trainer >>训练你的职业法术
step << Gnome Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r|T135321:0|t[步兵剑]
    .target Grawn Thromwyn
    .money <0.0536
    .goto Dun Morogh,45.290,52.190
    .collect 2488,1 --Collect Gladius (1)
step << Dwarf Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备 a|r |T132401:0|t[双刃战斧]
    .target Grawn Thromwyn
    .money <0.0460
    .goto Dun Morogh,45.290,52.190
    .collect 2491,1 --Collect Large Axe (1)
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r|T135641:0|t[卷刃的剑]
    .target Grawn Thromwyn
    .money <0.0400
    .goto Dun Morogh,45.290,52.190
    .collect 2494,1 --Collect Stiletto (1)
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r|T133053:0|t[木槌棒]
    .target Grawn Thromwyn
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
step << Warrior/Rogue/Paladin
    #completewith next
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    .vendor >>|cRXP_BUY_最多购买20个|r |T133968:0|t[刚出炉的面包] << Warrior/Rogue
    .vendor >>|cRXP_BUY_最多购买10个|r|T133968:0|t[刚出炉的面包] << Paladin
    .target Innkeeper Belm
step << Paladin/Warrior/Rogue
    #completewith next
    .goto Dun Morogh,43.0,47.4,60,0
    .goto Dun Morogh,39.6,48.9,60,0
    .goto Dun Morogh,37.9,50.8,60,0
    .goto Dun Morogh,34.577,51.652,40 >>前往|cRXP_FRIENDLY_图德拉·马克格拉恩|r
    >>途中击杀|cRXP_ENEMY_野猪|r和|cRXP_ENEMY_熊|r和|cRXP_ENEMY_狼|r
step << Paladin/Warrior/Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .target Tundra MacGrann
    .goto Dun Morogh,43.0,47.4,60,0
    .goto Dun Morogh,39.6,48.9,60,0
    .goto Dun Morogh,34.577,51.652
    .accept 312 >>接任务: |cRXP_LOOT_马克格拉恩的干肉|r
step << !Paladin !Warrior !Rogue
    #completewith next
    .goto Dun Morogh,35.2,56.4,60,0
    .goto Dun Morogh,36.0,52.0,60,0
    .goto Dun Morogh,34.577,51.652,40 >>前往|cRXP_FRIENDLY_图德拉·马克格拉恩|r
    >>途中击杀|cRXP_ENEMY_野猪|r和|cRXP_ENEMY_熊|r和|cRXP_ENEMY_狼|r
step << !Paladin !Warrior !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .target Tundra MacGrann
    .goto Dun Morogh,35.2,56.4,100,0
    .goto Dun Morogh,36.0,52.0,100,0
    .goto Dun Morogh,34.577,51.652
    .accept 312 >>接任务: |cRXP_LOOT_马克格拉恩的干肉|r
step
    #completewith next
    .goto Dun Morogh,30.5,46.0,50 >>前往布伦诺村
step << !Mage !Priest
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    .goto Dun Morogh,30.453,46.005
    .vendor >>|cRXP_WARN_出售垃圾|r
    .target Keeg Gibn
step << Priest/Mage/Warlock
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    .goto Dun Morogh,30.453,46.005
    .vendor >>|cRXP_BUY_最多购买 20|r|T132815:0|t[冰镇牛奶]
    .target Keeg Gibn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .target Rejold Barleybrew
    .goto Dun Morogh,30.190,45.726
    .turnin 318 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
    .accept 319 >>接任务: |cRXP_LOOT_艾沃沙酒|r
    .accept 315 >>接任务: |cRXP_LOOT_完美烈酒|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马莱斯·麦酒|r交谈
    .target Marleth Barleybrew
    .goto Dun Morogh,30.186,45.531
    .accept 310 >>接任务: |cRXP_LOOT_针锋相对|r
step
    #label Ribs
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
    >>击杀|cRXP_ENEMY_冰爪熊|r和|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +Ice Claw Bear
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +Elder Crag Boar
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +Snow Leopard
step
    >>击杀|cRXP_ENEMY_老峭壁野猪|r. 掠夺其|cRXP_LOOT_峭壁野猪肋排|r
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
    .complete 384,1 --Collect Crag Boar Rib (x6)
    .mob Elder Crag Boar
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .target Rejold Barleybrew
    .goto Dun Morogh,30.189,45.725
    .turnin 319 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
    .accept 320 >>接任务: |cRXP_LOOT_艾沃沙酒|r
step
    .isQuestTurnedIn 384
    .xp 7+4360 >>如果你已经交了任务“啤酒烤猪排”, 请继续刷怪, 直到获得4360+/4500点经验
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
    .goto Dun Morogh,30.0,51.8
step
    .xp 7+3735 >>刷怪直到3735/4500经验值
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
    .goto Dun Morogh,30.0,51.8
step
    #softcore
    .goto Dun Morogh,30.3,37.5,60 >>跑到这里
step
    #softcore
    .goto Dun Morogh,30.9,33.1,15 >>向北跑上山
step
    #softcore
    .goto Dun Morogh,32.4,29.1,15 >>追踪任务线索到这里
step
    #softcore
    .goto Dun Morogh,33.0,27.2,15,0
    .goto Dun Morogh,33.0,25.2,15,0
    .goto Wetlands,11.6,43.4,60,0
    .goto Wetlands,11.6,43.4,0
    .deathskip >>一直向北跑, 当聊天频道变为“湿地”时跳下去死亡, 然后在米奈希尔港重生
step
    #softcore
    #completewith next
    .goto Wetlands,12.7,46.7,30 >>游向岸边
step
    #softcore
    .goto Wetlands,9.5,59.7
    .fp Wetlands>>获取米奈希尔港的飞行路径
step
	#completewith next
    .hs >>炉石到卡拉诺斯
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买|r|T132800:0|t[狂想麦酒]|cRXP_BUY_和|r|T132800:0|t[雷霆麦酒]
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .collect 2686,1,311 --Collect Thunder Ale (x1)
    .target Innkeeper Belm
step
    #completewith next
    .goto Dun Morogh,47.779,52.426,6,0
    .goto Dun Morogh,47.644,52.655,3,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_加文·雷酒|r交谈
    .turnin 308 >>交任务: |cRXP_FRIENDLY_加文的爱好|r
    .target Jarven Thunderbrew
step
    .goto Dun Morogh,47.716,52.696
    >>点击|cRXP_PICK_无人守卫的雷酒桶|r
    .turnin 310 >>交任务: |cRXP_FRIENDLY_针锋相对|r
    .accept 311 >>接任务: |cRXP_LOOT_向马莱斯回报|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉格纳·雷酒|r外的|r交谈
    .target Ragnar Thunderbrew
    .goto Dun Morogh,46.825,52.361
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
step << !Paladin !Rogue !Warrior
    .xp 8 >>升级至8级
step << Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .trainer >>训练你的职业法术
    .train 5116>>训练震荡射击
    .target Grif Wildheart
step << Warlock
    .goto Dun Morogh,47.327,53.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉姆瑞兹·黑轮|r交谈
    .target Gimrizz Shadowcog
    .trainer >>训练你的职业法术
    .train 5782 >>火车 |T136183:0|t[恐惧]
step << Warlock
    .goto Dun Morogh,47.273,53.658
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉姆瑞兹·黑轮|r交谈
    .vendor >>|cRXP_BUY_如果你买得起, 就买|r|T133738:0|t[魔典：火焰箭(等级 2)]|cRXP_BUY_. 如果负担不起, 稍后再买|r
    .target Gimrizz Shadowcog
step << Rogue
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与后室内的|cRXP_FRIENDLY_霍格拉尔·巴坎|r交谈
    .target Hogral Bakkan
    .goto Dun Morogh,47.563,52.608
    .trainer >>训练你的职业法术
step << Paladin
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_阿扎尔·战锤|r交谈
    .target Azar Stronghammer
    .goto Dun Morogh,47.597,52.070
    .trainer >>训练你的职业法术
step << Warrior
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格兰尼斯·快斧|r_交谈
    .target Granis Swiftaxe
    .goto Dun Morogh,47.360,52.646
    .trainer >>训练你的职业法术
step << Mage
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_玛济斯·石衣|r交谈
    .target Magis Sparkmantle
    .goto Dun Morogh,47.498,52.076
    .trainer >>训练你的职业法术
    .train 118 >>训练 |T136071:0|t[变形术]
step << Priest
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克萨恩·安沃尔|r交谈
    .target Maxan Anvol
    .goto Dun Morogh,47.342,52.190
    .trainer >>训练你的职业法术
step
    .goto Dun Morogh,47.180,52.610
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨姆诺·普尔|r交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Thamner Pol
step << Gnome Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r|T135321:0|t[步兵剑]
    .target Grawn Thromwyn
    .money <0.0536
    .goto Dun Morogh,45.290,52.190
    .collect 2488,1 --Collect Gladius (1)
step << Dwarf Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备 a|r |T132401:0|t[双刃战斧]
    .target Grawn Thromwyn
    .money <0.0460
    .goto Dun Morogh,45.290,52.190
    .collect 2491,1 --Collect Large Axe (1)
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r|T135641:0|t[卷刃的剑]
    .target Grawn Thromwyn
    .money <0.0400
    .goto Dun Morogh,45.290,52.190
    .collect 2494,1 --Collect Stiletto (1)
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备|r|T133053:0|t[木槌棒]
    .target Grawn Thromwyn
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
step << Warrior/Rogue/Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    .goto Dun Morogh,47.377,52.523
    .vendor >>|cRXP_BUY_最多购买30件|r|T133968:0|t[刚出炉的面包] << Warrior/Rogue
    .vendor >>|cRXP_BUY_最多购买15个|r|T133968:0|t[刚出炉的面包] << Paladin
    .target Innkeeper Belm
step << Priest/Mage/Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    .target Innkeeper Belm
    .goto Dun Morogh,47.377,52.523
    .vendor >>|cRXP_BUY_最多购买30件|r|T132815:0|t[冰镇牛奶]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .target Senir Whitebeard
    .goto Dun Morogh,46.726,53.826
    .accept 287 >>接任务: |cRXP_LOOT_霜鬃巨魔要塞|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .target Pilot Stonegear
    .goto Dun Morogh,49.622,48.612
    .turnin 313 >>交任务: |cRXP_FRIENDLY_灰色洞穴|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .target Pilot Bellowfiz
    .goto Dun Morogh,49.426,48.410
    >>|cRXP_WARN_选择|r|T135637:0|t[露营小刀]|cRXP_WARN_reward. 留着以后再用|r << Rogue
    .turnin 320 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
step
    #era << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉兹·滑链|r交谈
    .target Razzle Sprysprocket
    .goto Dun Morogh,46.005,48.637,10,0
    .goto Dun Morogh,45.846,49.365
    .accept 412 >>接任务: |cRXP_LOOT_自动净化装置|r
step
    #completewith next
    .goto Dun Morogh,43.1,45.0,20,0
    .goto Dun Morogh,42.1,45.4,20 >>前往闪耀山脊. 沿箭头指示跑上山去
step
    .goto Dun Morogh,40.9,45.3,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,42.1,34.3,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,40.9,45.3
    .goto Dun Morogh,39.5,43.0,0
    .goto Dun Morogh,41.5,36.0,0
    >>击杀|cRXP_ENEMY_霜鬃先知|r. 击败他们后搜刮掉落的|cRXP_LOOT_微光草|r
    >>|cRXP_LOOT_微光草|r也可以从地面上的|cRXP_PICK_微光草篮|r中获得
    .complete 315,1 --Collect Shimmerweed (x6)
    .mob Frostmane Seer
step << !Mage !Warlock
    .goto Dun Morogh,38.517,53.927
    >>打开|cRXP_PICK_马克格拉恩的储肉柜|r. 将其打开后获得|cRXP_LOOT_马克格拉恩的风干肉|r
    >>|cRXP_WARN_等待|cRXP_ENEMY_冰须|r离开洞穴巡逻. 当他离开洞穴后, 你便可进入并拾取|cRXP_PICK_马克格拉恩的储肉柜|r
    .link https://www.youtube.com/watch?v=o55Y3LjgKoE >>|cRXP_WARN_点击此处查看视频参考|r
    .complete 312,1 --MacGrann's Dried Meats (1)
step << Mage/Warlock
    .goto Dun Morogh,38.517,53.927
    >>|cRXP_WARN_施法|r|T136071:0|t[多形术], |cRXP_WARN_目标: |r|cRXP_ENEMY_冰须|r << Mage
    >>|cRXP_WARN_施法|r|T136183:0|t[恐惧], |cRXP_WARN_目标: |r|cRXP_ENEMY_冰须|r << Warlock
    >>打开|cRXP_PICK_马克格拉恩的储肉柜|r. 将其打开后获得|cRXP_LOOT_马克格拉恩的风干肉|r
    .complete 312,1 --Collect MacGrann's Dried Meats (x1)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .target Tundra MacGrann
    .goto Dun Morogh,34.577,51.652
    .turnin 312 >>交任务: |cRXP_FRIENDLY_马克格拉恩的干肉|r
step << Mage/Priest/Warlock
    #completewith next
    .goto Dun Morogh,30.453,46.005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    .vendor >>|cRXP_BUY_最多再购买10份|r|T132815:0|t[冰镇牛奶]
    .target Keeg Gibn
step << Warrior/Paladin/Rogue
    #completewith next
    .goto Dun Morogh,30.453,46.005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    .target Keeg Gibn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .target Rejold Barleybrew
    .goto Dun Morogh,30.189,45.725
    .turnin 315 >>交任务: |cRXP_FRIENDLY_完美烈酒|r
    .accept 413 >>接任务: |cRXP_LOOT_微光酒|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马莱斯·麦酒|r交谈
    .target Marleth Barleybrew
    .goto Dun Morogh,30.186,45.531
    .turnin 311 >>交任务: |cRXP_FRIENDLY_向马莱斯回报|r
step
    #era << Warlock
    .goto Dun Morogh,27.2,43.0,60,0
    .goto Dun Morogh,24.8,39.3,60,0
    .goto Dun Morogh,25.6,43.4,60,0
    .goto Dun Morogh,24.3,44.0,60,0
    .goto Dun Morogh,25.4,45.4,60,0
    .goto Dun Morogh,25.00,43.50
    >>击杀|r麻疯侏儒|r. 掠夺他们以获得|r齿轮|r和|r齿轮零件|r
    .complete 412,2 --Collect Gyromechanic Gear (x8)
    .complete 412,1 --Collect Restabilization Cog (x8)
    .mob Leper Gnome
step
    #era
    .xp 9 >>升级到9级
step
    #completewith next
    .goto Dun Morogh,24.509,50.831,20 >>进入霜鬃巨魔要塞
step
    #completewith next
    >>击杀|cRXP_ENEMY_霜鬃猎头者|r
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob Frostmane Headhunter
step
    #hardcore
    >>|cRXP_WARN_下降到此位置探索霜鬃要塞. 如果下方有怪物, 请先正常清理周围, 切勿直接跳下|r
    .goto Dun Morogh,22.86,52.16
    .complete 287,2 --Fully explore Frostmane Hold
step << Hunter
    #completewith next
    .xp 10-2325
step
    .goto Dun Morogh,24.5,50.8,40,0
    .goto Dun Morogh,22.1,50.3,40,0
    .goto Dun Morogh,21.3,52.9,40,0
    .goto Dun Morogh,24.5,50.8,0
    .goto Dun Morogh,22.1,50.3,0
    .goto Dun Morogh,21.3,52.9,0
    >>击杀|cRXP_ENEMY_霜鬃猎头者|r
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob Frostmane Headhunter
step << Hunter
    .xp 10-1400
step
    #hardcore
	#completewith next
	.hs >>炉石到卡拉诺斯
	.cooldown item,6948,>0,1
step
    #hardcore
    #completewith next
   .goto Dun Morogh,46.726,53.826,150 >>前往卡拉诺斯
step << Hunter
   .goto Dun Morogh,46.005,48.637,8,0
   .goto Dun Morogh,45.846,49.365
   >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉兹·滑链|r交谈
   .target Razzle Sprysprocket
   .turnin 412 >>交任务: |cRXP_FRIENDLY_自动净化装置|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .target Senir Whitebeard
    .goto Dun Morogh,46.726,53.826
    .turnin 287 >>交任务: |cRXP_FRIENDLY_霜鬃巨魔要塞|r
    .accept 291 >>接任务: |cRXP_LOOT_森内尔的报告|r
step << Rogue
    #level 10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与后室内的|cRXP_FRIENDLY_霍格拉尔·巴坎|r交谈
    .target Hogral Bakkan
    .goto Dun Morogh,47.563,52.608
    .accept 2218 >>接任务: |cRXP_LOOT_救赎之路|r
step
    .goto Dun Morogh,47.180,52.610
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨姆诺·普尔|r交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Thamner Pol
step << !Hunter
    .goto Dun Morogh,46.005,48.637,8,0
    .goto Dun Morogh,45.846,49.365
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉兹·滑链|r交谈
    .target Razzle Sprysprocket
    .turnin 412 >>交任务: |cRXP_FRIENDLY_自动净化装置|r
step << Hunter
    .goto Dun Morogh,45.810,53.039
    .target Grif Wildheart
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .accept 6064 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
    .goto Dun Morogh,48.3,56.9
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_大峭壁野猪|r
    .complete 6064,1 --Tame a Large Crag Boar (1)
    .mob Large Crag Boar
step << Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6064 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Grif Wildheart
    .accept 6084 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
    .goto Dun Morogh,49.4,59.4
    >>|cRXP_WARN_|cRXP_WARN_请选中|r |cRXP_ENEMY_雪豹|r并使用|r|T132164:0|t[驯兽棒]|r
    .complete 6084,1 --Tame a Snow Leopard (1)
    .mob Snow Leopard
step << Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6084 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Grif Wildheart
    .accept 6085 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
    .goto Dun Morogh,50.4,59.7
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒] |cRXP_WARN_对一只|r|cRXP_ENEMY_冰爪熊|r
    .complete 6085,1 --Tame an Ice Claw Bear (1)
    .mob Ice Claw Bear
step << Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6085 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Grif Wildheart
    .accept 6086 >>接任务: |cRXP_LOOT_训练野兽|r
step << Warrior
    #sticky
    #completewith next
    .money >0.1030
    +|cRXP_WARN_刷怪直到你拥有10金币30银币, 然后前往铁炉堡|r
step << Warrior/Hunter
    .goto Dun Morogh,47.58,41.58,40,0
    .goto Dun Morogh,50.19,40.79,20,0
    .goto Ironforge,14.90,87.10,40 >>前往: |cRXP_PICK_铁炉堡|r
step << Hunter
    .goto Ironforge,70.86,85.83
    .target Belia Thundergranite
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝莉亚·雷岩|r交谈
    .turnin 6086 >>交任务: |cRXP_FRIENDLY_训练野兽|r
step << Warrior
    .goto Ironforge,62.237,89.628
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克斯·晃骨|r交谈
    .trainer >>投掷训练
    .target Bixi Wobblebonk
step << Warrior
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r|T135641:0|t[破损的平衡飞刀]并装备它|r
    .target Brenwyn Wintersteel
step << Warrior/Hunter
    #completewith next
	.goto Dun Morogh,53.5,34.9,60,0
    .goto Dun Morogh,52.90,35.62
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .target Rudra Amberstill
    .goto Dun Morogh,60.1,52.6,50,0
    .goto Dun Morogh,63.082,49.851
    .accept 314 >>接任务: |cRXP_LOOT_保护牲畜|r
step
    #completewith next
    .goto Dun Morogh,62.3,50.3,14,0
    .goto Dun Morogh,62.2,49.4,10 >>跑上这座山的这一段坡路
step
    .goto Dun Morogh,62.6,46.1
    >>击杀|cRXP_ENEMY_瓦加什|r. 击败他后搜刮他的|cRXP_LOOT_利牙|r
    >>|cRXP_WARN_这个任务难度较高. 如需协助, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤|r
    >>|cRXP_WARN_在尝试击杀|cRXP_ENEMY_瓦加什|r之前, 请先观看下方视频. 该BOSS可由任何职业单刷|r
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >>|cRXP_WARN_点击此处查看视频参考|r
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob Vagash
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    >>|cRXP_WARN_选择|r|T133052:0|t[|cRXP_FRIENDLY_寒脊之锤|r]|cRXP_WARN_作为奖励. 如果你暂时无法装备它, 别担心, 你很快就会学会使用双手锤！|r << Warrior
    .target Rudra Amberstill
    .goto Dun Morogh,63.082,49.851
    .turnin 314 >>交任务: |cRXP_FRIENDLY_保护牲畜|r
step
    #completewith next
    .goto Dun Morogh,68.5,54.6,60 >>前往古博拉采掘场
step
    .goto Dun Morogh,68.379,54.492
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师格瑞姆|r交谈
    .train 2550 >>学习 |T133971:0|t[烹饪]
    .target Cook Ghilm
step
    .goto Dun Morogh,68.6,54.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡杉·莫格什|r谈话
    .vendor >>|cRXP_BUY_购买|r|T133968:0|t[刚出炉的面包]|cRXP_BUY_如果需要|r << Warrior/Rogue
    .vendor >>|cRXP_BUY_购买|r|T133968:0|t[刚出炉的面包]|cRXP_BUY_和|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_(如需)|r << !Warrior !Rogue
    .target Kazan Mogosh
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_参议员梅尔·圣石|r和|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 433 >>接任务: |cRXP_LOOT_公众之仆|r
    .target +Senator Mehr Stonehallow
    .goto Dun Morogh,68.671,55.969
    .accept 432 >>接任务: |cRXP_LOOT_该死的石腭怪！|r
    .goto Dun Morogh,69.084,56.330
    .target +Foreman Stonebrow
step
    .goto Dun Morogh,70.7,56.4,40,0
    .goto Dun Morogh,70.62,52.39,25,0
    .goto Dun Morogh,70.7,56.4
    >>击杀|cRXP_ENEMY_石腭击颅者|r 和|cRXP_ENEMY_石腭断骨者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob +Rockjaw Skullthumper
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
    .mob +Rockjaw Bonesnapper
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头乔尼·石眉|r和|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .turnin 432 >>交任务: |cRXP_FRIENDLY_该死的石腭怪！|r
    .target +Foreman Stonebrow
    .goto Dun Morogh,69.084,56.330
    .turnin 433 >>交任务: |cRXP_FRIENDLY_公众之仆|r
    .goto Dun Morogh,68.671,55.969
    .target +Senator Mehr Stonehallow
step
    #era
    .goto Dun Morogh,67.1,59.7
    .xp 10 >>升级至10级
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .target Pilot Hammerfoot
    .goto Dun Morogh,83.892,39.188
    .accept 419 >>接任务: |cRXP_LOOT_失踪的驾驶员|r
step
    >>点击|cRXP_PICK_Dwarven Corpse|r
    .goto Dun Morogh,79.672,36.171
    .turnin 419 >>交任务: |cRXP_FRIENDLY_失踪的驾驶员|r
    .accept 417 >>接任务: |cRXP_LOOT_驾驶员的复仇|r
step
    >>击杀|cRXP_ENEMY_癞爪|r. 击败后搜刮其掉落的|cRXP_LOOT_爪|r
    .goto Dun Morogh,78.97,37.14
    .complete 417,1 --Collect Mangy Claw (x1)
    .mob Mangeclaw
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .target Pilot Hammerfoot
    .goto Dun Morogh,83.892,39.188
    .turnin 417 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人维拉特·麦酒|r交谈
    .target Mountaineer Barleybrew
    .goto Dun Morogh,79.6,50.7,50,0
    .goto Dun Morogh,82.3,53.5,25,0
    .goto Dun Morogh,86.278,48.812
    .turnin 413 >>交任务: |cRXP_FRIENDLY_微光酒|r
    .accept 414 >>接任务: |cRXP_LOOT_卡德雷尔的酒|r
step
    #completewith next
    .goto Dun Morogh,86.203,51.260,15,0
    .goto Loch Modan,22.071,73.127,200 >>前往: |cRXP_PICK_洛克莫丹|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .target Mountaineer Cobbleflint
    .goto Loch Modan,22.071,73.127
    .accept 224 >>接任务: |cRXP_LOOT_保卫国王的领土|r
step
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与掩体中的|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .target Captain Rugelfuss
    .accept 267 >>接任务: |cRXP_LOOT_穴居人的威胁|r
step
    #completewith HonorStudents
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .turnin 414 >>交任务: |cRXP_FRIENDLY_卡德雷尔的酒|r
    .accept 416 >>接任务: |cRXP_LOOT_狗头人的耳朵|r
    .accept 1339 >>接任务: |cRXP_LOOT_巡山人卡尔·雷矛的任务|r
    .target Mountaineer Kadrell
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .target Vidra Hearthstove
    .goto Loch Modan,34.828,49.283
    .accept 418 >>接任务: |cRXP_LOOT_塞尔萨玛血肠|r
step
    #completewith next
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尼·铁心|r交谈
    .vendor >>|cRXP_BUY_如果需要, 请购买 a|r|T133634:0|t[棕色小袋]|r
    .target Yanni Stoutheart
step << !Paladin
    .goto Loch Modan,35.534,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r交谈
    .home >>将你的[炉石]设置为塞尔萨玛
    .target Innkeeper Hearthstove
step
    #label HonorStudents
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.019,47.806
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .accept 6387 >>接任务: |cRXP_LOOT_荣誉学员|r
    .target Brock Stoneseeker
step
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .turnin 414 >>交任务: |cRXP_FRIENDLY_卡德雷尔的酒|r
    .accept 416 >>接任务: |cRXP_LOOT_狗头人的耳朵|r
    .accept 1339 >>接任务: |cRXP_LOOT_巡山人卡尔·雷矛的任务|r
    .target Mountaineer Kadrell
step << skip
    #sticky
    #completewith next
    +刷怪直到你至少拥有33银币价值的金钱和可出售物品
--N rogue money gate for cutlass+单手剑
step
    #completewith Thelsamar1
    >>击杀|cRXP_ENEMY_老黑熊|r. 击杀后搜刮其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后从它们身上搜刮|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r. 掠夺他们的|cRXP_LOOT_脓液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +Mountain Boar
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +Elder Black Bear
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +Forest Lurker
    >>|cRXP_WARN_保存任何|r|T133970:0|t|cRXP_LOOT_[野猪肉块]|r|cRXP_WARN_用于升级 |T133971:0|t[烹饪]|cRXP_WARN_稍后使用|r
    >>|cRXP_WARN_现在不必特意去完成这个任务. 你很快就会回到洛克莫丹|r
step
    #completewith next
    .goto Loch Modan,23.85,17.92,100 >>前往北方的阿尔加兹站
step
.group
    .goto Loch Modan,24.764,18.397
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 1339 >>交任务: |cRXP_FRIENDLY_巡山人卡尔·雷矛的任务|r
    .accept 1338 >>接任务: |cRXP_LOOT_卡尔·雷矛的订单|r
    .accept 307 >>接任务: |cRXP_LOOT_肮脏的爪子|r
    .target Mountaineer Stormpike
step
.solo
    .goto Loch Modan,24.764,18.397
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 1339 >>交任务: |cRXP_FRIENDLY_巡山人卡尔·雷矛的任务|r
    .accept 1338 >>接任务: |cRXP_LOOT_卡尔·雷矛的订单|r
    .target Mountaineer Stormpike
step
    #softcore
    #completewith next
    .deathskip >>在塞尔萨玛死亡并重生
step
    .isQuestComplete 418
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .target Vidra Hearthstove
    .goto Loch Modan,34.828,49.283
    .turnin 418 >>交任务: |cRXP_FRIENDLY_塞尔萨玛血肠|r
step
    #label Thelsamar1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .target Thorgrum Borrelson
    .goto Loch Modan,33.938,50.954
    .turnin 6387 >>交任务: |cRXP_FRIENDLY_荣誉学员|r
    .accept 6391 >>接任务: |cRXP_LOOT_飞往铁炉堡|r
step
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .fly Ironforge >>飞往铁炉堡
    .target Thorgrum Borrelson
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尼尔·石趾|r交谈
    .target Golnir Bouldertoe
    .goto Ironforge,51.521,26.311
    .turnin 6391 >>交任务: |cRXP_FRIENDLY_飞往铁炉堡|r
    .accept 6388 >>接任务: |cRXP_LOOT_格莱斯·瑟登|r
step << Hunter
    >>|cRXP_WARN_请勿飞行|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .target Gryth Thurden
    .goto Ironforge,55.501,47.742
    .turnin 6388 >>交任务: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .accept 6392 >>接任务: |cRXP_LOOT_向布洛克回复|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_参议员巴林·红石|r交谈
    .target Senator Barin Redstone
    .goto Ironforge,43.64,50.63,20,0
    .goto Ironforge,39.550,57.490
    .turnin 291 >>交任务: |cRXP_FRIENDLY_森内尔的报告|r
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布里维夫·石拳|r交谈
    >>|cRXP_WARN_如果你之前还没装备|r|T133052:0|t[|cRXP_FRIENDLY_寒脊之锤|r]|cRXP_WARN_现在请装备上|r
    .target Buliwyf Stonehand
    .goto Ironforge,61.181,89.514
    .trainer >>学习2小时锤类武器技能
step << !Hunter
    >>|cRXP_WARN_请勿飞行|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .target Gryth Thurden
    .goto Ironforge,55.501,47.742
    .turnin 6388 >>交任务: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .accept 6392 >>接任务: |cRXP_LOOT_向布洛克回复|r
step << !Hunter skip
    #completewith next
    +通过跳上狮鹫头部之一来执行登出跳过, 然后退出再重新登录
    .link https://www.youtube.com/watch?v=PWMJhodh6Bw >>|cRXP_WARN_点击此处查看视频参考|r
    .zoneskip Ironforge,1
step
    .goto Ironforge,78.00,52.00,5,0
    >>|cRXP_WARN_进入矿道地铁|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与中间平台上的|r蒙提|r交谈
    .target Monty
    .accept 6661 >>接任务: |cRXP_LOOT_捕捉矿道老鼠|r
step
    .use 17117 >>|cRXP_WARN_使用|r|T133942:0|t[捕鼠者长笛], |cRXP_WARN_目标: |r|cRXP_ENEMY_矿道老鼠|r
    .complete 6661,1 --Rats Captured (x5)
    .mob Deeprun Rat
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒙提|r 交谈
    .target Monty
    .turnin 6661 >>交任务: |cRXP_FRIENDLY_捕捉矿道老鼠|r
    .timer 11,Deeprun Rat Roundup RP
    .accept 6662 >>接任务: |cRXP_LOOT_我的兄弟，尼普希|r
step
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    >>|cRXP_WARN_在等待电车时, 如需提升经验, 请先将你的|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_等级提高|r
    >>|cRXP_WARN_你需要|r|T135966:0|t[急救]|cRXP_WARN_达到80级才能接取24级的任务|r << Rogue !Dwarf
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下电车时与 |cRXP_FRIENDLY_尼普希|r交谈
    >>|cRXP_FRIENDLY_尼普希|r|cRXP_WARN_位于中央平台|r
    .turnin 6662 >>交任务: |cRXP_FRIENDLY_我的兄弟，尼普希|r
    .target Nipsy
step
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞曼德·艾尔默|r交谈
    .target Grimand Elmore
    .goto StormwindClassic,51.757,12.091
    .accept 353 >>接任务: |cRXP_LOOT_雷矛的包裹|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗伦·长须|r交谈
    .target Furen Longbeard
    .goto StormwindClassic,58.091,16.552
    .turnin 1338 >>交任务: |cRXP_FRIENDLY_卡尔·雷矛的订单|r
step << Priest
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .target High Priestess Laurena
    .goto StormwindClassic,38.54,26.86
    .trainer >>训练你的职业法术
    .turnin 5634 >>交任务: |cRXP_FRIENDLY_绝望祷言|r
step << Priest
    .goto StormwindClassic,38.62,26.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .train 13908 >>训练绝望祷言
    .target High Priestess Laurena
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊尔莎|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.503,45.712
    .trainer >>训练你的职业法术
    .accept 1638 >>接任务: |cRXP_LOOT_战士的训练|r
    .target Ilsa Corbin
step << Warrior
    #completewith next
    .goto StormwindClassic,72.878,51.582,17,0
    .goto StormwindClassic,71.7,39.9,12 >>进入酒馆
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈里·伯加德|r交谈
    .target Harry Burlguard
    .goto StormwindClassic,74.249,37.244
    .turnin 1638 >>交任务: |cRXP_FRIENDLY_战士的训练|r
    .accept 1639 >>接任务: |cRXP_LOOT_醉鬼巴特莱比|r
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴特莱比|r交谈
    .target Bartleby
    .goto StormwindClassic,73.787,36.323
    .turnin 1639 >>交任务: |cRXP_FRIENDLY_醉鬼巴特莱比|r
    .accept 1640 >>接任务: |cRXP_LOOT_击败巴特莱比|r
step << Warrior
    .goto StormwindClassic,73.787,36.323
    >>攻击|cRXP_ENEMY_巴特莱比|r. 他将在1%血量时投降
    .complete 1640,1 --Beat Bartleby
    .mob Bartleby
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴特莱比|r交谈
    .target Bartleby
    .goto StormwindClassic,73.787,36.323
    .turnin 1640 >>交任务: |cRXP_FRIENDLY_击败巴特莱比|r
    .accept 1665 >>接任务: |cRXP_LOOT_巴特莱比的酒杯|r
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈里·伯加德|r交谈
    .target Harry Burlguard
    .goto StormwindClassic,74.249,37.244
    .turnin 1665 >>交任务: |cRXP_FRIENDLY_巴特莱比的酒杯|r
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >>训练你的职业法术
    .target Ursula Deline
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .accept 1688 >>接任务: |cRXP_LOOT_苏伦娜·凯尔东|r
    .target Gakin the Darkbinder
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .target Woo Ping
    .goto StormwindClassic,57.129,57.698
    .trainer >>学习1小时剑术 << Rogue/Mage
    .trainer >>训练法杖 << Priest
    .trainer >>训练1小时剑与法杖 << Warlock
    .trainer >>学习两小时剑术 << Warrior/Paladin
step << Dwarf Paladin
    .goto StormwindClassic,52.623,65.701
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板奥里森|r交谈
    .home >>将你的炉石设置为暴风城
    .target Innkeeper Allison
step << Rogue
    .money <0.2000
    .goto StormwindClassic,57.547,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    .target Gunther Weller
    .vendor >>|cRXP_WARN_购买一把|r|T135346:0|t[斗士短剑]|cRXP_WARN_并装备在主手. 将之前获得的|r|T135641:0|t[|cRXP_FRIENDLY_工匠匕首|r]|cRXP_WARN_装备在副手|r
step << Rogue
    .goto StormwindClassic,57.32,62.08,20,0
    .goto StormwindClassic,58.362,61.678
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔曼·穆比|r交谈
    .vendor >>|cRXP_BUY_购买|r|T135425:0|t[破损的锋利飞刀]|cRXP_BUY_. 当你达到11级时装备它|r
    .target Thurman Mullby
]])

RXPGuides.RegisterGuide([[
#hardcore
#era/som--h
#classic
<< Alliance
#name 10-11 艾尔文森林(矮人/侏儒)
#displayname 10-11 艾尔文森林(矮人/侏儒) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 生存指南((联盟)
#subgroup RXP生存指南 1-20
#defaultfor Gnome/Dwarf
#next 11-13 洛克莫丹(矮人/侏儒)

step
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fp Stormwind >>获取暴风城飞行点
    .target Dungar Longdrink
step
    #completewith next
    .goto Elwynn Forest,42.107,65.930,100 >>前往闪金镇
step
    .goto Elwynn Forest,42.107,65.930
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .target Marshal Dughan
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .target William Pestle
    .goto Elwynn Forest,43.318,65.705
    .accept 60 >>接任务: |cRXP_LOOT_狗头人的蜡烛|r
step << Mage/Rogue
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >>前往旅店二楼
step << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r交谈
    .target Zaldimar Wefhellt
    .goto Elwynn Forest,43.25,66.19
    .trainer >>训练你的职业法术
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞恩·塞尔留斯|r交谈
    .target Keryn Sylvius
    .goto Elwynn Forest,43.872,65.937
    .trainer >>训练你的职业法术
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米“两倍”|r交谈
    .target Remy "Two Times"
    .goto Elwynn Forest,42.140,67.254
    .accept 40 >>接任务: |cRXP_LOOT_鱼人的威胁|r
    .accept 47 >>接任务: |cRXP_LOOT_金砂交易|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯通菲尔德妈妈|r和|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    .accept 88 >>接任务: |cRXP_LOOT_公主必须死！|r
    .target +Ma Stonefield
    .goto Elwynn Forest,34.660,84.483
    .accept 85 >>接任务: |cRXP_LOOT_丢失的项链|r
    .target +"Auntie" Bernice Stonefield
    .goto Elwynn Forest,34.486,84.252
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利·马科伦|r交谈
    .target Billy Maclure
    .goto Elwynn Forest,43.131,85.722
    .turnin 85 >>交任务: |cRXP_FRIENDLY_丢失的项链|r
    .accept 86 >>接任务: |cRXP_LOOT_比利的馅饼|r
step
    .goto Elwynn Forest,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅贝尔·马科伦|r交谈
    .accept 106 >>接任务: |cRXP_LOOT_年轻的恋人|r
    .target Maybell Maclure
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托米·乔·斯通菲尔德|r交谈
    .goto Elwynn Forest,29.840,85.997
    .turnin 106 >>交任务: |cRXP_FRIENDLY_年轻的恋人|r
    .accept 111 >>接任务: |cRXP_LOOT_托米的祖母|r
    .target Tommy Joe Stonefield
step
    .goto Elwynn Forest,34.486,84.252
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    >>|cRXP_WARN_如果你没有足够的[野猪肉块], 暂时跳过交任务|r
    .turnin 86 >>交任务: |cRXP_FRIENDLY_比利的馅饼|r
    .isQuestComplete 86
    .target "Auntie" Bernice Stonefield
step
    .goto Elwynn Forest,34.943,83.861
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莱德·斯通菲尔德|r交谈
    .turnin 111 >>交任务: |cRXP_FRIENDLY_托米的祖母|r
    .accept 107 >>接任务: |cRXP_LOOT_给威廉·匹斯特的信|r
    .target Gramma Stonefield
step
    #completewith next
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r和 |cRXP_ENEMY_狗头人矿工|r. 击杀后搜刮他们的 |cRXP_LOOT_蜡烛|r和 |cRXP_LOOT_粉尘|r
    >>|cRXP_WARN_在完成此任务期间, 5级怪物可能会变为灰色. 仍需完成该任务, 以解锁后续任务|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    .goto Elwynn Forest,40.5,82.3
    >>|cRXP_WARN_进入并探索法戈迪普矿井|r
    .complete 62,1 --Scout Through the Fargodeep Mine
step
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76,25,0
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76,25,0
    .goto Elwynn Forest,40.5,82.3
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r和 |cRXP_ENEMY_狗头人矿工|r. 击杀后搜刮他们的 |cRXP_LOOT_蜡烛|r和 |cRXP_LOOT_粉尘|r
    >>|cRXP_WARN_在完成此任务期间, 5级怪物可能会变为灰色. 仍需完成该任务, 以解锁后续任务|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    #completewith next
    .goto Elwynn Forest,42.20,66.00,100 >>前往闪金镇
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米“两倍”|r交谈
    >>|cRXP_WARN_不要出售|r|T133581:0|t[弹子球]|cRXP_WARN_reward. 这是一个极其珍贵的物品, 一直用到60级都非常有价值|r
    .target Remy "Two Times"
    .goto Elwynn Forest,42.140,67.254
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .target Marshal Dughan
    .goto Elwynn Forest,42.108,65.928
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
    .turnin 40 >>交任务: |cRXP_FRIENDLY_鱼人的威胁|r
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .target William Pestle
    .goto Elwynn Forest,43.318,65.705
    .turnin 60 >>交任务: |cRXP_FRIENDLY_狗头人的蜡烛|r
    .accept 61 >>接任务: |cRXP_LOOT_送往暴风城的货物|r
    .turnin 107 >>交任务: |cRXP_FRIENDLY_给威廉·匹斯特的信|r
    .accept 112 >>接任务: |cRXP_LOOT_收集海藻|r
step
    >>击杀|cRXP_ENEMY_鱼人|r和|cRXP_ENEMY_鱼人士兵|r. 击败它们后搜刮出|cRXP_LOOT_海藻叶|r`
    .goto Elwynn Forest,47.6,63.3,60,0
    .goto Elwynn Forest,51.4,64.6,60,0
    .goto Elwynn Forest,57.6,62.8,60,0
    .goto Elwynn Forest,56.4,66.6,60,0
    .goto Elwynn Forest,53.8,66.8,60,0
    .goto Elwynn Forest,57.6,62.8
    .complete 112,1 --Collect Crystal Kelp Frond (x4)
	.mob Murloc
	.mob Murloc Streamrunner
step
    #completewith next
    .goto Elwynn Forest,61.654,53.608,15 >>进入青金石矿洞
step
    >>|cRXP_WARN_沿着中间的路径前往贾斯珀洛德矿洞探索|r
    >>|cRXP_WARN_目标完成后立即离开贾斯珀洛德矿井|r
    .goto Elwynn Forest,60.4,50.2
    .complete 76,1 --Scout through the Jasperlode Mine
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵托马斯|r交谈
    .target Guard Thomas
    .goto Elwynn Forest,73.973,72.179
    .turnin 35 >>交任务: |cRXP_FRIENDLY_卫兵托马斯|r
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵托马斯|r交谈
    .target Guard Thomas
    .goto Elwynn Forest,73.973,72.179
    .accept 37 >>接任务: |cRXP_LOOT_失踪的卫兵|r
    .accept 52 >>接任务: |cRXP_LOOT_保卫边境|r
step
    #era
    #completewith Prowlers
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    >>|cRXP_WARN_优先击杀你看到的任何|cRXP_ENEMY_森林熊幼崽|r|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +Prowler
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +Young Forest Bear
step
    #era
    >>点击地面上的|cRXP_PICK_被吃掉一半的尸体|r
    .goto Elwynn Forest,72.656,60.334
    .turnin 37 >>交任务: |cRXP_FRIENDLY_失踪的卫兵|r
    .accept 45 >>接任务: |cRXP_LOOT_罗尔夫的下落|r
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员莱琳|r交谈
    .target Supervisor Raelen
    .goto Elwynn Forest,81.382,66.112
    .accept 5545 >>接任务: |cRXP_LOOT_木材危机|r
step
    #era
    #completewith Bundles
    >>搜刮地面上的|cRXP_LOOT_一捆木柴|r. |cRXP_WARN_它们位于树下|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    #era
    #label Prowlers
    .goto Elwynn Forest,79.80,55.50
    >>点击地面上的|cRXP_PICK_罗尔夫的尸体|r
    >>|cRXP_WARN_请注意, 当你点击|cRXP_PICK_罗尔夫的尸体|时, 附近的|cRXP_ENEMY_鱼人|r可能会触发仇恨|r
    >>|cRXP_ENEMY_鱼人强盗|r|cRXP_WARN_将施放|r|T135915:0|t[饮用小型药水] |cRXP_WARN_, 可为自己恢复61-68点生命值|r
    .turnin 45 >>交任务: |cRXP_FRIENDLY_罗尔夫的下落|r
    .accept 71 >>接任务: |cRXP_LOOT_回复托马斯|r
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
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +Prowler
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob Young Forest Bear
step
    #era
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4
    >>搜刮地面上的|cRXP_LOOT_一捆木柴|r. |cRXP_WARN_它们位于树下|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员莱琳|r交谈
    .target Supervisor Raelen
    .goto Elwynn Forest,81.382,66.112
    .turnin 5545 >>交任务: |cRXP_FRIENDLY_木材危机|r
step
    #era
    #label Bears
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .target Sara Timberlain
    .goto Elwynn Forest,79.457,68.789
    .accept 83 >>接任务: |cRXP_LOOT_红色亚麻布|r
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵托马斯|r交谈
    .target Guard Thomas
    .goto Elwynn Forest,73.973,72.179
    .turnin 52 >>交任务: |cRXP_FRIENDLY_保卫边境|r
    .turnin 71 >>交任务: |cRXP_FRIENDLY_回复托马斯|r
    .accept 39 >>接任务: |cRXP_LOOT_托马斯的报告|r
    .accept 109 >>接任务: |cRXP_LOOT_向格里安·斯托曼报到|r
step << Warlock
    .goto Elwynn Forest,71.10,80.66
    >>击杀|cRXP_ENEMY_苏伦娜·凯尔东|r. 搜刮她的|cRXP_LOOT_项圈|r
    >>|cRXP_WARN_集中精力快速击杀|r苏伦娜·凯尔东|r
    >>|cRXP_WARN_持续施放|r|T136183:0|t[恐惧], |cRXP_WARN_目标: |r|cRXP_ENEMY_收货人莫根|r|r
    .complete 1688,1 --Surena's Choker (1)
    .mob Surena Caledon
step
    #era
    #completewith next
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 掠夺他们以获取|cRXP_LOOT_头巾|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .mob Defias Bandit
step
    .goto Elwynn Forest,69.3,79.0
    >>击杀|cRXP_ENEMY_公主|r. 搜刮她的|cRXP_LOOT_项圈|r
    >>|cRXP_ENEMY_公主|r|cRXP_WARN_将与她的|r|cRXP_ENEMY_公主的随从同时触发仇恨|r
    >>|cRXP_ENEMY_公主|r|cRXP_WARN_也会施放|r|T132368:0|t[冲锋]|cRXP_WARN_, 造成大量伤害|r
    .complete 88,1
    .mob Princess
step
    #completewith next
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 掠夺他们以获得 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r]
    .use 1972>>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] 开始任务|r
    >>|cRXP_WARN_|r|T134939:0|t[|cRXP_LOOT_西部荒野地契|r]|cRXP_WARN_是一个非常稀有的掉落物品. 如果你没有获得它, 请跳过此步骤|r
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >>接任务: |cRXP_LOOT_法布隆的地契|r
step
    #era
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 掠夺他们以获取|cRXP_LOOT_头巾|r
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
    .mob Defias Bandit
step
    #era
    #softcore
    #sticky
    #completewith next
    .goto Elwynn Forest,83.6,69.7,120 >>如果你血量较低, 就去“灵魂医者”处死亡并重生；否则直接跑回去交任务即可
step
    #era
    #label Deed
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .target Sara Timberlain
    .goto Elwynn Forest,79.457,68.789
    .turnin 83 >>交任务: |cRXP_FRIENDLY_红色亚麻布|r
step
    #completewith next
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .target Guard Parker
    .goto Redridge Mountains,17.4,69.6
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
step
    .goto Redridge Mountains,18.581,69.208,15,0
    .goto Redridge Mountains,23.325,71.373,25,0
    .goto Redridge Mountains,29.565,67.930,25,0
    .goto Redridge Mountains,30.733,59.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    >>|cRXP_WARN_沿着主路前进, 沿途避开靠近的敌人|r
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .target Deputy Feldon
step
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >>获取赤脊山飞行点
    .fly Stormwind >>飞往暴风城
    .target Ariena Stormfeather
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>在洛克莫丹快速完成任务时, 请购买以下物品
    >>这将节省你的时间, 因为你无需到处寻找怪物击杀. 如果你想不购买任何物品, 请跳过此步骤
    >>购买额外的 |T134437:0|t[大块野猪肉] 也有助于将 |T133971:0|t[烹饪] 等级提升至 50, 便于日后使用
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    >>|T134437:0|t[大块野猪肉]
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .collect 769,4,86,1 -- Chunk of Boar Meat (4)
    .target Auctioneer Jaxon
step
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩根·匹斯特|r交谈
    .turnin 61,1 >>交任务: |cRXP_FRIENDLY_送往暴风城的货物|r
    >>|cRXP_WARN_我们选择|r|T132383:0|t[爆破火箭]|cRXP_WARN_作为奖励. 它造成可观的伤害, 可用于“分拉”战术, 非常实用|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >>|cRXP_WARN_点击此处观看“分体拉怪”的视频参考. 这是一个简短的视频, 对学习非常有帮助|r
    .target Morgan Pestle
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .trainer >>训练你的职业法术
    .turnin 1688 >>交任务: |cRXP_FRIENDLY_苏伦娜·凯尔东|r
    .accept 1689 >>接任务: |cRXP_LOOT_誓缚|r
    .target Gakin the Darkbinder
step << Warlock
    #completewith next
    .goto StormwindClassic,25.2,80.7,18,0
    .goto StormwindClassic,23.2,79.5,18,0
    .goto StormwindClassic,26.3,79.5,18,0
    .goto StormwindClassic,25.154,77.406
    >>|cRXP_WARN_前往已宰的羔羊底部|r
    .cast 7728 >>|cRXP_WARN_使用|r|T133292:0|t[血石颈环]|cRXP_WARN_召唤|r|cRXP_ENEMY_虚空行者|r
    .use 6928
step << Warlock
    .goto StormwindClassic,25.154,77.406
    .use 6928 >>击杀召唤的虚空行者
    .complete 1689,1 --Kill Summoned Voidwalker (x1)
    .mob Summoned Voidwalker
step << Warlock
     #softcore
    >>生命之流在你返回|cRXP_FRIENDLY_黑暗缚灵者加科因|r的路上
    .target Gakin the Darkbinder
    .goto StormwindClassic,25.2,78.5
    .turnin 1689 >>交任务: |cRXP_FRIENDLY_誓缚|r
step << Warlock
    #hardcore
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .target Gakin the Darkbinder
    .goto StormwindClassic,25.25,78.59
    .turnin 1689 >>交任务: |cRXP_FRIENDLY_誓缚|r
step << Warlock
    #softcore
    #completewith next
    .goto StormwindClassic,25.2,78.5
    .deathskip >>通过使用“生命分流”并站在你旁边的篝火上, 即可在灵魂医者处死亡并重生
step
    #completewith next
    .goto Elwynn Forest,42.20,66.00,100 >>前往闪金镇
step << Warrior
    .goto Elwynn Forest,41.09,65.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里瑞亚·杜拉克|r交谈
    .target Lyria Du Lac
    .trainer >>训练你的职业法术
step
    #era
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 39 >>交任务: |cRXP_FRIENDLY_托马斯的报告|r
    .turnin 76 >>交任务: |cRXP_FRIENDLY_玉石矿洞|r
    .accept 239 >>接任务: |cRXP_LOOT_西泉要塞|r
    .target Marshal Dughan
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .goto Elwynn Forest,43.318,65.705
    .turnin 112 >>交任务: |cRXP_FRIENDLY_收集海藻|r
    .accept 114 >>接任务: |cRXP_LOOT_梅贝尔的隐形水|r
    .target William Pestle
step << Mage/Rogue/Priest
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >>前往旅店二楼
step << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r交谈
    .target Zaldimar Wefhellt
    .goto Elwynn Forest,43.25,66.19
    .trainer >>训练你的职业法术
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞恩·塞尔留斯|r交谈
    .target Keryn Sylvius
    .goto Elwynn Forest,43.872,65.937
    .trainer >>训练你的职业法术
step << Priest
    .goto Elwynn Forest,43.283,65.719
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师洁塞塔|r交谈
    .target Priestess Josetta
    .trainer >>训练你的职业法术
step
    #completewith next
    .goto Elwynn Forest,43.154,89.625,50 >>前往麦克卢尔酒庄
step
    .goto Elwynn Forest,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅贝尔·马科伦|r交谈
    .turnin 114 >>交任务: |cRXP_FRIENDLY_梅贝尔的隐形水|r
    .target Maybell Maclure
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .target Ma Stonefield
    .turnin 88 >>交任务: |cRXP_FRIENDLY_公主必须死！|r
    .goto Elwynn Forest,34.660,84.483
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    >>|cRXP_WARN_如果你没有足够的[野猪肉块], 暂时跳过交任务|r
    .target "Auntie" Bernice Stonefield
    .turnin 86 >>交任务: |cRXP_FRIENDLY_比利的馅饼|r
    .goto Elwynn Forest,34.486,84.252
    .isQuestComplete 86
step
    #sticky
    .abandon 86 >>放弃比利的馅饼给比利
step
    #completewith next
    .goto Elwynn Forest,24.82,76.25,80 >>前往西泉要塞
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 239 >>交任务: |cRXP_FRIENDLY_西泉要塞|r
    .accept 11 >>接任务: |cRXP_LOOT_悬赏河爪豺狼人|r
    .goto Elwynn Forest,24.234,74.450
    >>点击|cRXP_PICK_通缉告示|r
    .accept 176 >>接任务: |cRXP_WARN_通缉：霍格|r
    .goto Elwynn Forest,24.548,74.672
    .target Deputy Rainer
step
    .group
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 239 >>交任务: |cRXP_FRIENDLY_西泉要塞|r
    .accept 11 >>接任务: |cRXP_LOOT_悬赏河爪豺狼人|r
    .goto Elwynn Forest,24.234,74.450
    >>点击|cRXP_PICK_通缉告示|r
    .accept 176 >>接任务: |cRXP_WARN_通缉：霍格|r
    .goto Elwynn Forest,24.548,74.672
    .target Deputy Rainer
step
    .solo
    .goto Elwynn Forest,24.234,74.450
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 239 >>交任务: |cRXP_FRIENDLY_西泉要塞|r
    .accept 11 >>接任务: |cRXP_LOOT_悬赏河爪豺狼人|r
    .target Deputy Rainer
step
    #completewith GnollEnd
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r 和|cRXP_ENEMY_河爪豺狼人前锋|r. 从他们身上搜刮出 |T134939:0|t[|cRXP_LOOT_采金日程表|r ]
    .use 1307 >>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_采金日程表|r] 开始任务|r
    >>|cRXP_WARN_|r |T134939:0|t[|cRXP_LOOT_采金日程表|r] |cRXP_WARN_是一种非常罕见的掉落. 如果你没有获得它, 请忽略此步骤|r
    >>|cRXP_ENEMY_格拉夫·疾齿|r|cRXP_WARN_稀有刷新, 必定掉落|r
    .collect 1307,1,123 --Collect Gold Pickup Schedule (x1)
    .accept 123 >>接任务: |cRXP_LOOT_收货人|r
    .unitscan Gruff Swiftbite
step << !Warlock
    .group
    #completewith next
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r 和|cRXP_ENEMY_河爪豺狼人前锋|r . 掠夺他们的|cRXP_LOOT_护腕|r
    >>|cRXP_WARN_请确保你拥有10|r|T132889:0|t[亚麻布]|cRXP_WARN_, 以便完成即将开始的圣骑士职业任务|r << Dwarf Paladin
    .complete 11,1 -- Painted Gnoll Armband (8)
    .collect 2589,10,1648,1,1 << Dwarf Paladin -- Linen Cloth (10)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
step << Warlock
    #completewith next
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r 和|cRXP_ENEMY_河爪豺狼人前锋|r . 掠夺他们的|cRXP_LOOT_护腕|r
    >>|cRXP_WARN_请确保你拥有10|r|T132889:0|t[亚麻布]|cRXP_WARN_, 以便完成即将开始的圣骑士职业任务|r << Dwarf Paladin
    .complete 11,1 -- Painted Gnoll Armband (8)
    .collect 2589,10,1648,1,1 << Dwarf Paladin -- Linen Cloth (10)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
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
    >>击杀|cRXP_ENEMY_霍格|r. 从他身上搜刮|cRXP_LOOT_爪子|r
    >>|cRXP_ENEMY_霍格|r|cRXP_WARN_可在多个位置出现|r
    >>|cRXP_WARN_持续施放|r|T136183:0|t[恐惧], |cRXP_WARN_目标: |r|cRXP_ENEMY_霍格|r, 并用常规的DOT技能击杀他|r
    >>|cRXP_WARN_这个任务难度较高. 如需协助, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .unitscan Hogger
step
    .group
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
    >>击杀|cRXP_ENEMY_霍格|r. 从他身上搜刮|cRXP_LOOT_爪子|r
    >>|cRXP_ENEMY_霍格|r|cRXP_WARN_可在多个位置出现|r
    >>|cRXP_WARN_这个任务难度较高. 如需协助, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .unitscan Hogger
step
    #label GnollEnd
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
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r 和|cRXP_ENEMY_河爪豺狼人前锋|r . 掠夺他们的|cRXP_LOOT_护腕|r
    >>|cRXP_WARN_请确保你拥有10|r|T132889:0|t[亚麻布]|cRXP_WARN_, 以便完成即将开始的圣骑士职业任务|r << Dwarf Paladin
    .complete 11,1 -- Painted Gnoll Armband (8)
    .collect 2589,10,1648,1,1 << Dwarf Paladin -- Linen Cloth (10)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .target Marshal Dughan
    .goto Elwynn Forest,42.105,65.927
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    .isQuestComplete 176
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .target Marshal Dughan
    .goto Elwynn Forest,42.105,65.927
    .turnin 123 >>交任务: |cRXP_FRIENDLY_收货人|r
    .isOnQuest 123
step
    .goto Elwynn Forest,24.234,74.450
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 11 >>交任务: |cRXP_FRIENDLY_悬赏河爪豺狼人|r
    .target Deputy Rainer
step
    #completewith WestEntry
    .goto Westfall,59.95,19.35
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r交谈
    .target Farmer Furlbrow
    .goto Westfall,59.95,19.35
    .turnin 184 >>交任务: |cRXP_FRIENDLY_法布隆的地契|r
    .isOnQuest 184
step
    #label WestEntry
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .accept 64 >>接任务: |cRXP_LOOT_遗失的怀表|r
    .target +Farmer Furlbrow
    .goto Westfall,59.95,19.35
    .accept 151 >>接任务: |cRXP_LOOT_老马布兰契|r
    .accept 36 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .goto Westfall,59.92,19.42
	.target +Verna Furlbrow
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .target Farmer Saldean
    .goto Westfall,56.04,31.23
    .accept 9 >>接任务: |cRXP_LOOT_清理荒野|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .target Salma Saldean
    .goto Westfall,56.40,30.50
    .turnin 36 >>交任务: |cRXP_FRIENDLY_杂味炖肉|r
    .accept 38 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .accept 22 >>接任务: |cRXP_LOOT_猪肝馅饼|r
step
    #softcore
    #sticky
    #completewith next
    .deathskip >>死亡后在灵魂医者处复活, 或跑到哨兵岭
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .target Gryan Stoutmantle
    .goto Westfall,56.33,47.52
    .turnin 109 >>交任务: |cRXP_FRIENDLY_向格里安·斯托曼报到|r
    .accept 12 >>接任务: |cRXP_LOOT_西部荒野人民军|r
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与丹努文队长交谈|cRXP_FRIENDLY_丹努文队长|r
    .target Captain Danuvin
    .goto Westfall,56.42,47.62
    .accept 102 >>接任务: |cRXP_LOOT_西部荒野的豺狼人|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target Scout Galiaan
    .goto Westfall,54.00,53.00
    .accept 153 >>接任务: |cRXP_LOOT_红色皮质面罩|r
step
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fp Sentinel Hill >>获取哨兵岭的飞行点
    .fly Stormwind >>飞往暴风城 << Dwarf Paladin
    .target Thor
step << !Paladin
    .hs >>炉石前往洛克莫丹
step << Dwarf Paladin
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    --.link https://www.youtube.com/watch?v=M_tXROi9nMQ >>|cRXP_WARN_在电车内部跳过登出. 点击此处查看视频参考|r
]])

RXPGuides.RegisterGuide([[
#hardcore
#era/som--h
#classic
<< Alliance
#name 11-13 洛克莫丹(矮人/侏儒)
#displayname 11-13 洛克莫丹(矮人/侏儒) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 生存指南((联盟)
#subgroup RXP生存指南 1-20
#defaultfor Gnome/Dwarf
#next 13-15 西部荒野

step << Dwarf Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰度尔·铁锤|r交谈
    .target Brandur Ironhammer
    .goto Ironforge,23.131,6.143
    .accept 2999 >>接任务: |cRXP_LOOT_圣洁之书|r
step << Dwarf Paladin
    #completewith next
    .goto Ironforge,25.27,1.53,9,0
    .goto Ironforge,24.35,11.90,10 >>前往楼上的|cRXP_FRIENDLY_蒂萨·热炉|r
step << Dwarf Paladin
    .goto Ironforge,27.628,12.183
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 2999 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1645 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1645 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Tiza Battleforge
step << Dwarf Paladin
    .goto Ironforge,27.628,12.183
    .use 6916>>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_圣洁之书|r] 开始任务|r
    .accept 1646 >>接任务: |cRXP_LOOT_圣洁之书|r
step << Dwarf Paladin
    .goto Ironforge,27.628,12.183
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 1646 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1647 >>接任务: |cRXP_LOOT_圣洁之书|r
step << Dwarf Paladin
    .goto Ironforge,21.643,36.199,20,0
    .goto Ironforge,23.401,62.898,20,0
    .goto Ironforge,32.057,78.286,20,0
    .goto Ironforge,47.132,84.932,20,0
    .goto Ironforge,26.719,69.884
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_约翰·特纳|r交谈
    >>|cRXP_FRIENDLY_约翰·特纳|r|cRXP_WARN_在铁炉堡拍卖行附近的外环区域巡逻|r
    .turnin 1647 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1648 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1648 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1778 >>接任务: |cRXP_LOOT_圣洁之书|r
    .unitscan John Turner
step << Dwarf Paladin
    .goto Ironforge,25.27,1.53,9,0
    .goto Ironforge,24.35,11.90,10,0
    .goto Ironforge,27.628,12.183
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒂萨·热炉|r交谈, 她在楼上
    .target Tiza Battleforge
    .turnin 1778 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1779 >>接任务: |cRXP_LOOT_圣洁之书|r
step << Dwarf Paladin
    .goto Ironforge,23.539,8.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆里顿·热炉|r谈话
    .target Muiredon Battleforge
    .turnin 1779 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1783 >>接任务: |cRXP_LOOT_圣洁之书|r
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .goto Ironforge,55.501,47.742
    .fly Loch Modan >>飞往洛克莫丹
    .target Gryth Thurden
    .zoneskip Ironforge,1
step
    #optional
    .isQuestComplete 418
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .target Vidra Hearthstove
    .goto Loch Modan,34.828,49.283
    .turnin 418 >>交任务: |cRXP_FRIENDLY_塞尔萨玛血肠|r
step
    #completewith RTB
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尼·铁心|r交谈
    .vendor 1682 >>|cRXP_BUY_购买|r|T133634:0|t[小棕色袋子]|cRXP_BUY_如需使用|r
    .target Yanni Stoutheart
step
    #completewith RTB
    .goto Loch Modan,35.534,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r交谈
    .vendor 6734 >>|cRXP_BUY_如果需要, 购买一些|r|T133968:0|t[刚出炉的面包]|r << Warrior/Rogue
    .vendor 6734 >>|cRXP_BUY_购买一些|r|T133968:0|t[刚出炉的面包] |cRXP_BUY_和|r|T132815:0|t[冰镇牛奶] |cRXP_BUY_(如需)|r << !Warrior !Rogue
    .target Innkeeper Hearthstove
step
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.019,47.806
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .turnin 6392 >>交任务: |cRXP_FRIENDLY_向布洛克回复|r
    .target Brock Stoneseeker
step << Hunter
    .goto Loch Modan,35.828,43.457
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维罗克·乱枪|r交谈
    >>|cRXP_BUY_如果你负担得起, 就买 a|r|T135613:0|t[猎人的火枪]|r
    .collect 2511,1
    .money <0.1300
    .target Vrok Blunderblast
step
    .group
    #completewith BraveSoul
    >>击杀|cRXP_ENEMY_老黑熊|r. 击杀后搜刮其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后从它们身上搜刮|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r. 掠夺他们的|cRXP_LOOT_脓液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +Mountain Boar
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +Elder Black Bear
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +Forest Lurker
step
    .solo
    #completewith StormpikeStop
    >>击杀|cRXP_ENEMY_老黑熊|r. 击杀后搜刮其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后从它们身上搜刮|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r. 掠夺他们的|cRXP_LOOT_脓液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +Mountain Boar
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +Elder Black Bear
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +Forest Lurker
step
    .group
    #completewith MinerGear
    >>击杀|cRXP_ENEMY_Tunnel Rats|r. 击杀后搜刮其|cRXP_LOOT_Ears|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Vermin
    .mob Tunnel Rat Forager
    .mob Tunnel Rat Geomancer
    .mob Tunnel Rat Digger
    .mob Tunnel Rat Surveyor
step
    .group
    #label BraveSoul
    #completewith next
    .goto Loch Modan,35.50,18.97,20 >>进入银溪矿井
step
    .group
    #label MinerGear
    .goto Loch Modan,35.93,22.55
    >>打开|cRXP_PICK_矿工联盟的储物箱|r. 搜刮其中的|cRXP_LOOT_矿工联盟装备|r
    >>|cRXP_WARN_|cRXP_PICK_矿工联盟的储物箱|r 可在矿井各处找到|r
    >>|cRXP_WARN_如果你现在想跳过这个任务, 可以等到更高等级时再来完成|r
    .complete 307,1 -- Miners' Gear (4)
step
    .group
    #completewith StormpikeStop
    >>击杀|cRXP_ENEMY_老黑熊|r. 击杀后搜刮其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后从它们身上搜刮|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r. 掠夺他们的|cRXP_LOOT_脓液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +Mountain Boar
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +Elder Black Bear
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +Forest Lurker
step << Paladin/Warrior
    .goto Loch Modan,42.867,9.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔伦·安德玛|r交谈
    .vendor >>|cRXP_FRIENDLY_尼尔伦·安德玛|r|cRXP_WARN_出售|r|T133476:0|t[|cRXP_FRIENDLY_重型尖刺钉锤|r] |cRXP_WARN_此物品为限量供应|r
    >>|cRXP_WARN_检查是否可购买, 如果买得起就直接入手. 如果负担不起, 就去附近的“隧道老鼠”那里刷钱, 直到攒够足够的金币|r
    >>|cRXP_WARN_请尽快完成此操作, 因为其他玩家可能会先于你购买|r
    .target Nillen Andemar
step
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82,50,0
    .goto Loch Modan,25.05,30.19,50,0
    .goto Loch Modan,26.06,43.44,50,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82
    >>击杀|cRXP_ENEMY_Tunnel Rats|r. 击杀后搜刮其|cRXP_LOOT_Ears|r
    >>|cRXP_ENEMY_隧道鼠|r|cRXP_WARN_可在洛克莫丹各地刷新. 请查看你的世界地图以确定它们的位置|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Vermin
    .mob Tunnel Rat Forager
    .mob Tunnel Rat Geomancer
    .mob Tunnel Rat Digger
    .mob Tunnel Rat Surveyor
step
    #completewith StormpikeDelivery
    #label StormpikeStop
    .goto Loch Modan,24.134,18.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高索·布鲁姆|r交谈
    .vendor >>|cRXP_WARN_如果需要, 请向商人购买物品并修理装备|r
    .target Gothor Brumn
step
.group
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 307 >>交任务: |cRXP_FRIENDLY_肮脏的爪子|r
    .target Mountaineer Stormpike
step
    #label StormpikeDelivery
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 353 >>交任务: |cRXP_FRIENDLY_雷矛的包裹|r
    .target Mountaineer Stormpike
step
    >>击杀|cRXP_ENEMY_老黑熊|r. 击杀后搜刮其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后从它们身上搜刮|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r. 掠夺他们的|cRXP_LOOT_脓液|r
    .collect 3173,3,418,1 --Bear Meat (3)
    .mob +Elder Black Bear
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
    .mob +Mountain Boar
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
    .mob +Forest Lurker
step
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .target Mountaineer Kadrell
    .turnin 416 >>交任务: |cRXP_FRIENDLY_狗头人的耳朵|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .target Vidra Hearthstove
    .goto Loch Modan,34.828,49.283
    .turnin 418 >>交任务: |cRXP_FRIENDLY_塞尔萨玛血肠|r
step
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尼·铁心|r交谈
    >>|cRXP_BUY_购买1|r|T135237:0|t[燧石和火绒]|cRXP_BUY_以及2|r|T135435:0|t[普通木柴]|cRXP_BUY_. 如需, 再购买任意|r|T133634:0|t[小棕色口袋]|r
    .collect 4470,2 --Simple Wood (2)
    .collect 4471,1 --Flint and Tinder (1)
    .target Yanni Stoutheart
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
    >>击杀|cRXP_ENEMY_碎石穴居人|r 和|cRXP_ENEMY_碎石怪斥候|r . 击杀后搜刮他们的|cRXP_LOOT_牙齿|r
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .mob +Stonesplinter Trogg
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .mob +Stonesplinter Scout
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob +Stonesplinter Trogg
    .mob +Stonesplinter Scout
step
    #era
    .goto Loch Modan,27.4,48.4
    .xp 13+9600 >>刷怪直到经验达到9600/11400
step
    #som--xpgate
    .goto Loch Modan,27.4,48.4
    .xp 14-2300 >>刷怪直到距离14级还差2300点经验(当前9100/11400)
step
    #completewith next
    .goto Loch Modan,24.78,70.17,10,0
    .goto Loch Modan,23.73,75.52,15 >>沿着泥土小路跑上去, 然后跳进掩体中
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .target Captain Rugelfuss
    .goto Loch Modan,23.233,73.675
    .turnin 267 >>交任务: |cRXP_FRIENDLY_穴居人的威胁|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .target Mountaineer Cobbleflint
    .goto Loch Modan,22.071,73.127
    .turnin 224 >>交任务: |cRXP_FRIENDLY_保卫国王的领土|r
step << !Dwarf/!Paladin
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .fly Ironforge>>飞往铁炉堡
    .target Thorgrum Borrelson
step << Dwarf Paladin
    #completewith next
    .goto Dun Morogh,86.09,51.15
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
step << Dwarf Paladin
    #completewith next
    .goto Dun Morogh,78.321,58.088
    .cast 8593 >>|cRXP_WARN_使用|r|T133439:0|t[生命符记], |cRXP_WARN_目标: |r|cRXP_FRIENDLY_纳姆·法奥克|r
	.use 6866
	.target Narm Faulk
step << Dwarf Paladin
    .goto Dun Morogh,78.321,58.088
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆·法奥克|r交谈
    .use 6866
    .turnin 1783 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1784 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Narm Faulk
step << Dwarf Paladin
    .goto Dun Morogh,77.3,60.5,20,0
    .goto Dun Morogh,77.83,61.78
    >>击杀 |cRXP_ENEMY_黑铁间谍|r. 搜刮他们以获得 |cRXP_LOOT_黑铁手稿|r
    .complete 1784,1 --Dark Iron Script (1)
    .mob Dark Iron Spy
step << Dwarf Paladin
	#completewith next
    .hs >>炉石传送至暴风城
step << Paladin
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step << Paladin
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .trainer >>训练你的职业法术
    .target Arthur the Faithful
step << Hunter
    .goto Ironforge,69.872,82.890
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷格努斯·雷石|r交谈
    .trainer >>训练你的职业法术
    .target Regnus Thundergranite
step << Warrior
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比尔班·飞钳|r交谈
    .trainer >>训练你的职业法术
    .target Bilban Tosslespanner
step << Mage
    .goto Ironforge,27.18,8.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈
    .trainer >>训练你的职业法术
    .target Dink
step << Mage/Priest/Warlock
    #ah
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡拍卖商交谈|r
    >>|cRXP_BUY_购买|r|T135144:0|t[强效魔法杖]|cRXP_BUY_如果价格低于33s 40c|r
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    .collect 11288,1 --Greater Magic Wand (1)
    .target Auctioneer Lympkin
    .target Auctioneer Redmuse
    .target Auctioneer Buckler
step << Mage/Priest/Warlock
    .goto Ironforge,22.837,17.094,8,0
    .goto Ironforge,21.131,17.276,5,0
    .goto Ironforge,23.135,15.936
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_哈瑞克·石鼓|r交谈
    >>|cRXP_WARN_如果你无法获得|r|T135144:0|t[强效魔法杖]|cRXP_WARN_购买|r|T135468:0|t[烟尘魔杖]|cRXP_WARN_并在15级时装备它|r
    .collect 5208,1 --Smoldering Wand (1)
    .target Harick Boulderdrum
step << Warlock
    #softcore
    #requires Wand2
    .goto Ironforge,51.1,8.7,15,0 >>进入建筑
    .goto Ironforge,50.4,6.3
    .trainer >>训练你的职业法术
step << Warlock
    #hardcore
    .goto Ironforge,51.1,8.7,15,0
    .goto Ironforge,50.343,5.657
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞尔索恩|r交谈
    .trainer >>训练你的职业法术
    .target Briarthorn
step << Warlock
    .goto Ironforge,53.2,7.8,15,0
    .goto Ironforge,52.701,6.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_寻尸者祖贝尔|r交谈
    .vendor >>|cRXP_BUY_购买|r|T133738:0|t[魔典：吞噬暗影(等级 1)]|cRXP_BUY_和|r|T133738:0|t[魔典：牺牲(等级 1)]|cRXP_BUY_, 如果你负担得起的话|r
    .target Jubahl Corpseseeker
step << Rogue
    #optional
    .goto Ironforge,51.958,14.838
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下 |cRXP_FRIENDLY_霍夫丹·黑须|r 交谈
    .turnin -2218 >>交任务: |cRXP_FRIENDLY_救赎之路|r
    .target Hulfdan Blackbeard
step << Rogue
    .goto Ironforge,51.495,15.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_芬斯维克|r交谈
    .trainer >>训练你的职业法术
    .target Fenthwick
step << Priest
    .goto Ironforge,25.207,10.756
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托德雷·铁矿|r交谈
    .trainer >>训练你的职业法术
    .target Toldren Deepiron
step << !Paladin !Warrior !Hunter !Warlock skip
    #completewith next
    +通过跳上狮鹫头部之一来执行登出跳过, 然后退出再重新登录
    .link https://www.youtube.com/watch?v=PWMJhodh6Bw >>|cRXP_WARN_点击此处查看视频参考|r
    .zoneskip Ironforge,1
step << !Paladin
    .goto Ironforge,78.00,52.00,5,0
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    >>|cRXP_WARN_在等待电车时, 如有需要, 请先将|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_提升至当前等级|r
    >>|cRXP_WARN_你需要|r|T135966:0|t[急救]|cRXP_WARN_达到80级才能接取24级的任务|r << Rogue !Dwarf
step
    #completewith Fly2WF
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利巴布·旋轮|r交谈
    .vendor 5519 >>|cRXP_BUY_从他那里购买 a|r|T133024:0|t[青铜管]|cRXP_BUY_(如果可用)|r
    >>|cRXP_WARN_这是一件限量供应物品. 如果|cRXP_FRIENDLY_比利巴布·旋轮|r没有, 請跳過此步驟|r
--    >>你稍后完成任务时需要 2 个青铜管 << Rogue
    .bronzetube
    .target Billibub Cogspinner
step << Rogue
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买 1 或 2|r|T135343:0|t[战士阔剑]|cRXP_BUY_如果你负担得起, 或者从拍卖行购买更好的装备|r
    .collect 2027,2 --Scimitar
    .target Marda Weller
    .money <0.3815
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买 1 或 2|r|T135343:0|t[战士阔剑]|cRXP_BUY_如果你买得起|r
    .collect 2027,2 --Scimitar
    .money <0.3815
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target Marda Weller
step << Rogue
    #optional
    #completewith next
    +|cRXP_WARN_装备|r|T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.69
    .xp <14,1
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>请在西部荒野尽快购买以下物品, 以加快任务提交速度
    >>这将节省你的时间, 因为你无需到处寻找怪物击杀. 如果你想不购买任何物品, 请跳过此步骤
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝脏]
    >>|T132794:0|t[灯油]
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- Okra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    .collect 814,5,103,1 -- Flask of Oil (5)
    .target Auctioneer Jaxon
step
    #label Fly2WF
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >>飞往西部荒野
    .target Dungar Longdrink
]])
