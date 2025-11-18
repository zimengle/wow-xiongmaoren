RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 十字军打击 - 4（艾尔文森林）
#title Crusader Strike
#next 灵感典范-6（艾尔文森林）

--VV Not sure if you want to gate CS in Elwynn for humans only/DunM for dwarves only

step
    +|cRXP_WARN_你必须至少达到 4 级才能获得|r |T133816:0|t[雕刻手套 - 十字军打击] |cRXP_WARN_因为这是训练的等级要求|r |T135959:0|t[审判]
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133816:0|t[雕刻手套 - 十字军打击]
    .train 410002,1
    .xp >4,1
step
    #completewith LibramS
    #label Elwynn1
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
    .train 410002,1
    .xp <4,1
step
    #completewith next
    #requires Elwynn1
    .goto Elwynn Forest,48.35,41.97,15,0
    .goto Elwynn Forest,48.87,41.75,12,0
    .goto Elwynn Forest,49.61,41.87,12,0
    .goto Elwynn Forest,50.433,42.124,10 >>前往 |cRXP_FRIENDLY_Brother Sammuel|r 内部
    .train 410002,1
    .xp <4,1
step
    .goto Elwynn Forest,50.433,42.124
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨缪尔修士|r
    .train 20271 >>列车 |T135959:0|t[判断]
    .target Brother Sammuel
    .train 410002,1
    .xp <4,1
step
    #label LibramS
    #loop
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,50,0
    .goto Elwynn Forest,53.89,50.52,50,0
    .goto Elwynn Forest,55.09,49.00,50,0
    .goto Elwynn Forest,55.43,45.87,50,0
    .goto Elwynn Forest,53.86,47.05,50,0
    >>杀死 |cRXP_ENEMY_Defias Thugs|r。从他们身上搜刮 |T134916:0|t|cRXP_LOOT_[审判圣典]|r
    .collect 205420,1 -- Libram of Judgement (1)
    .mob Defias Thug
    .train 410002,1
    .xp <4,1
step
    .equip 18,205420 >>|cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[审判圣典]|r
    .use 205420
    .itemcount 205420,1 --Libram of Judgement (1)
--XX  .itemStat 18,QUALITY,<2 would bug it if someone has a Libram in the slot already
    .train 410002,1
    .xp <4,1
step
    #loop
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,50,0
    .goto Elwynn Forest,53.89,50.52,50,0
    .goto Elwynn Forest,55.09,49.00,50,0
    .goto Elwynn Forest,55.43,45.87,50,0
    .goto Elwynn Forest,53.86,47.05,50,0
    .aura 408828 >>|cRXP_WARN_施放|r |T135959:0|t[判断] |cRXP_WARN_10 次以获得|r |T136116:0|t[启发] |cRXP_WARN_buff|r
    .itemStat 18,QUALITY,2
    .train 410002,1
    .xp <4,1
step
    .cast 409920 >>|cRXP_WARN_使用|r |T134916:0|t|cRXP_LOOT_[审判圣典]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 十字军打击]
    .use 205420
    .aura -408828
    .train 410002,1
    .xp <4,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 十字军打击 - 4（丹莫罗）
#title Crusader Strike
#next 灵感范例 - 6（邓莫罗）

step
    +|cRXP_WARN_你必须至少达到 4 级才能获得|r |T133816:0|t[雕刻手套 - 十字军打击] |cRXP_WARN_因为这是训练的等级要求|r |T135959:0|t[审判]
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133816:0|t[雕刻手套 - 十字军打击]
    .train 410002,1
    .xp >4,1
step
    #completewith LibramS
    #label Dun1
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
    .train 410002,1
    .xp <4,1
step
    #completewith next
    #requires Dun1
    .goto Dun Morogh,28.83,69.07,12,0
    .goto Dun Morogh,28.83,68.70,10,0
    .goto Dun Morogh,28.93,68.35,10,0
    .goto Dun Morogh,28.833,68.332,10 >>前往 |cRXP_FRIENDLY_Bromos Grummner|r 内部
    .train 410002,1
    .xp <4,1
step
    .goto Dun Morogh,28.833,68.332
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r
    .train 20271 >>列车 |T135959:0|t[判断]
    .target Bromos Grummner
    .train 410002,1
    .xp <4,1
step
    #label LibramS
    #loop
    .goto Dun Morogh,26.59,79.16,50,0
    .goto Dun Morogh,23.39,80.31,50,0
    .goto Dun Morogh,22.60,79.50,50,0
    .goto Dun Morogh,20.74,75.69,50,0
    .goto Dun Morogh,22.60,79.50,50,0
    .goto Dun Morogh,23.39,80.31,50,0
    >>杀死 |cRXP_ENEMY_Frostmane Troll Whelps|r。从它们身上拾取 |T134916:0|t|cRXP_LOOT_[审判圣典]|r
    .collect 205420,1 -- Libram of Judgement (1)
    .mob Frostmane Troll Whelp
    .train 410002,1
    .xp <4,1
step
    .equip 18,205420 >>|cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[审判圣典]|r
    .use 205420
    .itemcount 205420,1 --Libram of Judgement (1)
    .train 410002,1
    .xp <4,1
step
    #loop
    .goto Dun Morogh,26.59,79.16,50,0
    .goto Dun Morogh,23.39,80.31,50,0
    .goto Dun Morogh,22.60,79.50,50,0
    .goto Dun Morogh,20.74,75.69,50,0
    .goto Dun Morogh,22.60,79.50,50,0
    .goto Dun Morogh,23.39,80.31,50,0
    .aura 408828 >>|cRXP_WARN_施放|r |T135959:0|t[判断] |cRXP_WARN_10 次以获得|r |T136116:0|t[启发] |cRXP_WARN_buff|r
    .itemStat 18,QUALITY,2
    .train 410002,1
    .xp <4,1
step
    .cast 409920 >>|cRXP_WARN_使用|r |T134916:0|t|cRXP_LOOT_[审判圣典]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 十字军打击]
    .use 205420
    .aura -408828
    .train 410002,1
    .xp <4,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 清算之手-14（洛克莫丹）
#title Hand of Reckoning
#next 灵感典范-6（艾尔文森林）


step
    +|cRXP_WARN_你必须至少达到 14 级才能单独获得|r |T133816:0|t[雕刻手套 - 清算之手] |cRXP_WARN_in 洛克莫丹|r
    >>|cRXP_WARN_你必须至少达到 8 级，因为这是装备|r |T134916:0|t|cRXP_LOOT_[正义圣典] 的等级要求|r
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133816:0|t[雕刻手套 - 清算之手]
    .train 410001,1
    .xp >8,1
step
    +|cRXP_WARN_你必须至少达到 14 级才能单独获得|r |T133816:0|t[雕刻手套 - 清算之手] |cRXP_WARN_in 洛克莫丹|r
    .train 410001,1
    .xp <8,1
    .xp >14,1
step
    #completewith next
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .train 410001,1
    .xp <8,1
step
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布兰度尔·铁锤|r
    .train 853 >>列车 |T135963:0|t[正义之锤]
    .target Brandur Ironhammer
    .train 410001,1
    .xp <8,1
step
    #completewith LibramS
    #label Loch1
    .zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r
    .train 410001,1
    .xp <8,1
step
    #completewith LibramS
    #requires Loch1
    #label Cave1
    .goto Loch Modan,28.75,64.63,40,0
    .goto Loch Modan,35.35,83.51,20,0
    .goto Loch Modan,34.89,84.38,30 >>前往 Stonesplinter 洞穴
    .train 410001,1
    .xp <8,1
step
    #completewith next
    #requires Cave1
    .goto Loch Modan,34.24,85.59,12,0
    .goto Loch Modan,35.90,87.93,12,0
    .goto Loch Modan,37.27,89.56,15,0
    .goto Loch Modan,36.75,91.43,8 >>前往水下洞穴内的 |cRXP_PICK_Sunken Reliquary|r
    .train 410001,1
    .xp <8,1
step
    #label LibramS
    .goto Westfall,70.96,73.08
    >>在水下打开 |cRXP_PICK_Sunken Reliquary|r。拾取它以获得 |T134916:0|t|cRXP_LOOT_[正义圣典]|r
    .collect 208851,1 --Libram of Justice (1)
    .train 410001,1
    .xp <8,1
step
    .equip 18,205420 >>|cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[正义圣典]|r
    .use 208851
    .itemcount 208851,1 --Libram of Justice (1)
    .train 410001,1
    .xp <8,1
step
    #completewith next
    .aura 408828 >>|cRXP_WARN_攻击生命值低下的敌人。对他们施放|r |T135963:0|t[正义之锤] |cRXP_WARN_，然后在他们晕眩期间将其击杀 10 次，以获得|r |T136116:0|t[灵感] |cRXP_WARN_buff|r
    >>|cRXP_WARN_注意：你必须对可以提供经验的敌人执行此操作才能获得叠加|r
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <11,1
step
    .goto Loch Modan,37.27,89.56,15,0
    .goto Loch Modan,35.90,87.93,15,0
    .goto Loch Modan,34.24,85.59,15,0
    .goto Loch Modan,34.89,84.38,30 >>离开洞穴
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <8,1
step
    #loop
    .goto Loch Modan,31.93,79.12,40,0
    .goto Loch Modan,31.02,80.64,40,0
    .goto Loch Modan,31.56,76.89,40,0
    .goto Loch Modan,30.90,74.35,40,0
    .goto Loch Modan,29.75,72.57,40,0
    .goto Loch Modan,33.43,70.60,40,0
    .goto Loch Modan,35.36,71.21,40,0
    .goto Loch Modan,32.86,79.70,40,0
    .aura 408828 >>|cRXP_WARN_攻击生命值低下的敌人。对他们施放|r |T135963:0|t[正义之锤] |cRXP_WARN_，然后在他们晕眩期间将其击杀 10 次，以获得|r |T136116:0|t[灵感] |cRXP_WARN_buff|r
    >>|cRXP_WARN_注意：你必须对可以提供经验的敌人执行此操作才能获得叠加|r
    .mob Stonesplinter Trogg
    .mob Stonesplinter Scout
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <8,1
    .xp >16,1
step
    #loop
    .goto Loch Modan,35.66,83.64,30,0
    .goto Loch Modan,36.86,84.93,30,0
    .goto Loch Modan,36.50,80.01,30,0
    .goto Loch Modan,33.96,81.82,30,0
    .aura 408828 >>|cRXP_WARN_攻击生命值低下的敌人。对他们施放|r |T135963:0|t[正义之锤] |cRXP_WARN_，然后在他们晕眩期间将其击杀 10 次，以获得|r |T136116:0|t[灵感] |cRXP_WARN_buff|r
    >>|cRXP_WARN_注意：你必须对可以提供经验的敌人执行此操作才能获得叠加|r
    .mob Stonesplinter Skullthumper
    .mob Stonesplinter Seer
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <16,1
    .xp >19,1
step
    #loop
    .goto Loch Modan,69.61,67.92,40,0
    .goto Loch Modan,72.12,68.29,40,0
    .goto Loch Modan,72.59,61.75,40,0
    .goto Loch Modan,70.33,59.84,40,0
    .goto Loch Modan,67.37,59.88,40,0
    .goto Loch Modan,67.77,62.99,40,0
    .goto Loch Modan,70.41,62.93,40,0
    .goto Loch Modan,69.69,65.52,40,0
    .aura 408828 >>|cRXP_WARN_攻击生命值低下的敌人。对他们施放|r |T135963:0|t[正义之锤] |cRXP_WARN_，然后在他们晕眩期间将其击杀 10 次，以获得|r |T136116:0|t[灵感] |cRXP_WARN_buff|r
    >>|cRXP_WARN_注意：你必须对可以提供经验的敌人执行此操作才能获得叠加|r
    .mob Stonesplinter Geomancer
    .mob Stonesplinter Digger
    .mob Berserk Trogg
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <20,1
    .xp >22,1
step
    #completewith next
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
    .itemStat 18,QUALITY,2
    .aura 408828
    .train 410001,1
    .xp <22,1
step
    #loop
    .goto Wetlands,15.96,47.28,50,0
    .goto Wetlands,13.69,41.37,50,0
    .goto Wetlands,13.59,38.04,50,0
    .goto Wetlands,15.30,38.81,50,0
    .goto Wetlands,18.45,39.37,50,0
    .goto Wetlands,19.24,41.29,50,0
    .goto Wetlands,13.69,41.37,50,0
    .aura 408828 >>|cRXP_WARN_攻击生命值低下的敌人。对他们施放|r |T135963:0|t[正义之锤] |cRXP_WARN_，然后在他们晕眩期间将其击杀 10 次，以获得|r |T136116:0|t[灵感] |cRXP_WARN_buff|r
    >>|cRXP_WARN_注意：你必须对可以提供经验的敌人执行此操作才能获得叠加|r
    .mob Young Wetlands Crocolisk
    .mob Fen Dweller
    .mob Bluegill Murloc
    .mob Bluegill Forager
    .mob Bluegill Puddlejumper
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <22,1
step
    .cast 421508 >>|cRXP_WARN_使用|r |T134916:0|t|cRXP_LOOT_[正义圣典]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 清算之手]
    .aura -408828
    .use 208851
    .train 410001,1
    .xp <8,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 清算之手 - 20（西部荒野）
#title Hand of Reckoning
#next 驱魔人-24（暮色森林）


step
    +|cRXP_WARN_你必须至少达到 20 级才能在西部荒野单独获得|r |T133816:0|t[雕刻手套 - 清算之手] |cRXP_WARN_|r
    >>|cRXP_WARN_你必须至少达到 8 级，因为这是装备|r |T134916:0|t|cRXP_LOOT_[正义圣典] 的等级要求|r
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133816:0|t[雕刻手套 - 清算之手]
    .train 410001,1
    .xp >8,1
step
    +|cRXP_WARN_你必须至少达到 20 级才能在西部荒野单独获得|r |T133816:0|t[雕刻手套 - 清算之手] |cRXP_WARN_|r
-- >>|cRXP_WARN_强烈建议你去洛克莫丹获取它，因为那里更容易，而且可以在较低等级获得|r
    .train 410001,1
    .xp <8,1
    .xp >20,1
step << skip
    #completewith LibramS
    +|cRXP_WARN_强烈建议你去洛克莫丹获取|T133816:0|t[雕刻手套 - 清算之手]，因为它要容易得多|r
    .train 410001,1
    .xp <20,1
step
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 410001,1
    .xp <8,1
step
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_虔诚的亚瑟|r
    .train 853 >>列车 |T135963:0|t[正义之锤]
    .target Arthur the Faithful
    .train 410001,1
    .xp <8,1
step
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
    .train 410001,1
    .xp <8,1
step
    #label LibramS
    .goto Westfall,69.71,73.41,30,0
    .goto Westfall,70.96,73.08,30,0
    .goto Duskwood,12.17,74.76,30,0
    .goto Westfall,70.96,73.08
    >>杀死 |cRXP_ENEMY_Defias 无人机|r。从它们身上搜刮来 |T134916:0|t|cRXP_LOOT_[正义圣契]|r
    >>|cRXP_WARN_要小心 |cRXP_ENEMY_Defias Drones|r 巡逻队成群结队|r
    >>|cRXP_WARN_避开 |cRXP_ENEMY_Malformed Defias Drone|r，因为他的攻击力非常强|r
    .collect 208851,1 --Libram of Justice (1)
    .mob Defias Drone
    .train 410001,1
    .xp <8,1
--XX Venture Co. Drones drop it too?
step
    .equip 18,205420 >>|cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[正义圣典]|r
    .use 208851
    .itemcount 208851,1 --Libram of Justice (1)
    .train 410001,1
    .xp <8,1
step
    #loop
    .goto Elwynn Forest,24.50,93.99,50,0
    .goto Elwynn Forest,26.07,91.92,50,0
    .goto Elwynn Forest,27.85,88.18,50,0
    .goto Elwynn Forest,27.56,86.21,50,0
    .goto Elwynn Forest,26.43,86.81,50,0
    .goto Elwynn Forest,25.18,89.20,50,0
    .aura 408828 >>|cRXP_WARN_攻击生命值低下的敌人。对他们施放|r |T135963:0|t[正义之锤] |cRXP_WARN_，然后在他们晕眩期间将其击杀 10 次，以获得|r |T136116:0|t[灵感] |cRXP_WARN_buff|r
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <8,1
    .xp >15,1
step
    #loop
    .goto Westfall,69.71,73.41,40,0
    .goto Westfall,64.54,60.81,40,0
    .goto Westfall,62.62,58.29,40,0
    .goto Westfall,60.87,58.71,40,0
    .goto Westfall,58.71,61.21,40,0
    .goto Westfall,61.43,62.17,40,0
    .aura 408828 >>|cRXP_WARN_攻击生命值低下的敌人。对他们施放|r |T135963:0|t[正义之锤] |cRXP_WARN_，然后在他们晕眩期间将其击杀 10 次，以获得|r |T136116:0|t[灵感] |cRXP_WARN_buff|r
    .mob 大血牙
    .mob Harvest Reaper
    .mob Greater Fleshripper
    .mob Defias Knuckleduster
    .mob Defias Highwayman
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <15,1
    .xp >22,1
step
    .goto Duskwood,15.76,72.72,50,0
    .goto Duskwood,12.65,69.42,50,0
    .goto Duskwood,10.42,66.27,50,0
    .goto Duskwood,10.30,59.05,50,0
    .goto Duskwood,10.75,52.37,50,0
    .goto Duskwood,8.83,45.35,50,0
    .goto Duskwood,8.75,40.20,50,0
    .goto Duskwood,10.99,34.29,50,0
    .goto Duskwood,11.07,29.40,50,0
    .goto Duskwood,14.69,26.22,50,0
    .goto Duskwood,20.93,25.13,50,0
    .goto Duskwood,15.76,72.72,50,0
    .goto Duskwood,14.69,26.22
    .aura 408828 >>|cRXP_WARN_攻击生命值低下的敌人。对他们施放|r |T135963:0|t[正义之锤] |cRXP_WARN_，然后在他们晕眩期间将其击杀 10 次，以获得|r |T136116:0|t[灵感] |cRXP_WARN_buff|r
    .mob Venom Web Spider
    .mob Pygmy Venom Web Spider
    .mob Starving Dire Wolf
    .mob Rabid Dire Wolf
    .mob Green Recluse
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <22,1
step
    .cast 421508 >>|cRXP_WARN_使用|r |T134916:0|t|cRXP_LOOT_[正义圣典]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 清算之手]
    .aura -408828
    .use 208851
    .train 410001,1
    .xp <8,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 神圣之地 - 4（洛克莫丹）
#title Hallowed Ground
#next 清算之手-14（洛克莫丹）

step
    +|cRXP_WARN_你必须至少达到 4 级才能获得|r |T133815:0|t[雕刻宝箱 - 神圣之地] |cRXP_WARN_因为这是训练的等级要求|r |T135906:0|t[力量祝福]
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133815:0|t[雕刻宝箱 - 神圣之地]
--  >>|cRXP_WARN_不建议使用|r |T133815:0|t[雕刻宝箱 - 神圣之地] |cRXP_WARN_over|r |T133815:0|t[雕刻宝箱 - 神圣风暴] |cRXP_WARN_or|r |T133815:0|t[雕刻宝箱 - 殉难印记]
    .train 425618,1
    .xp >4,1
step
    #completewith next
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .train 425618,1
    .xp <4,1
step
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布兰度尔·铁锤|r
    .train 19740 >>列车 |T135906:0|t[力量祝福]
    .target Brandur Ironhammer
    .train 425618,1
    .xp <4,1
step
    #completewith next
    #label Loch1
    .zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r
    .train 425618,1
    .xp <4,1
step
    #completewith LibramLoot
    #requires Loch1
    #label Inn1
    .goto Loch Modan,35.26,47.76,10 >>进入塞尔萨玛旅馆
    .train 425618,1
    .xp <4,1
step
    #completewith next
    #requires Inn1
    .goto Loch Modan,35.43,48.29,8,0
    .goto Loch Modan,35.12,48.98,8,0
    .goto Loch Modan,35.13,49.34,8,0
    .goto Loch Modan,35.19,49.95,8,0
    .goto Loch Modan,35.52,49.40,8,0
    >>进入底层最东边的房间
    .goto Loch Modan,35.80,49.57,8 >>前往 |T134916:0|t|cRXP_LOOT_[祝福圣典]|r
    .train 425618,1
    .xp <4,1
step
    .goto Loch Modan,35.80,49.57
    >>拾取桌子上的 |T134916:0|t|cRXP_LOOT_[祝福圣典]|r
    .collect 208849,1 --Libram of Blessings (1)
    .train 425618,1
    .xp <4,1
step
    .equip 18,208849 >>|cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[祝福圣典]|r
    .use 208849
    .itemcount 208849,1 --Libram of Blessings (1)
    .train 425618,1
    .xp <4,1
step
    .goto Loch Modan,34.90,47.80
    .aura 408828 >>|cRXP_WARN_对 5 名独特的友方玩家（包括你自己）施放|r |T135906:0|t[力量祝福] |cRXP_WARN_或|r |T135970:0|t[智慧祝福] |cRXP_WARN_on 以获得 |r |T136116:0|t[启发] |cRXP_WARN_buff|r
    .itemStat 18,QUALITY,2
    .train 425618,1
    .xp <14,1
--XX Doesn't work on NPCs
step
    .goto Loch Modan,34.90,47.80
    .aura 408828 >>|cRXP_WARN_对 5 名独特的友方玩家（包括你自己）施放|r |T135906:0|t[力量祝福] |cRXP_WARN_以获得 |r |T136116:0|t[启发] |cRXP_WARN_buff|r
    .itemStat 18,QUALITY,2
    .train 425618,1
    .xp >14,1
    .xp <4,1
step
    .cast 421508 >>|cRXP_WARN_使用|r |T134916:0|t[祝福圣典] |cRXP_WARN_学习|r |T133815:0|t[雕刻宝箱 - 神圣之地]
    .aura -408828
    .use 208849
    .train 425618,1
    .xp <4,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 洛丹伦之角 - 12（西部荒野）
#title Horn of Lordaeron
#next 清算之手 - 20（西部荒野）


step
    +|cRXP_WARN_你必须至少达到 12 级才能在西部荒野单独获得|r |T133815:0|t[雕刻宝箱 - 洛丹伦之角] |cRXP_WARN_|r
    >>|cRXP_WARN_你必须至少达到 4 级，因为这是训练的等级要求|r |T135906:0|t[力量祝福]
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133815:0|t[雕刻胸甲 - 洛丹伦之角]
--  >>|cRXP_WARN_不建议使用|r |T133815:0|t[雕刻胸甲 - 洛丹伦之角] |cRXP_WARN_over|r |T133815:0|t[雕刻胸甲 - 神圣风暴] |cRXP_WARN_or|r |T133815:0|t[雕刻胸甲 - 殉难印记]
    .train 425618,1
    .xp >4,1
step
    +|cRXP_WARN_你必须至少达到 12 级才能在西部荒野单独获得|r |T133815:0|t[雕刻宝箱 - 洛丹伦之角] |cRXP_WARN_|r
--  >>|cRXP_WARN_强烈建议你去洛克莫丹获取，因为那里容易得多|r
--  >>|cRXP_WARN_不建议使用|r |T133815:0|t[雕刻胸甲 - 洛丹伦之角] |cRXP_WARN_over|r |T133815:0|t[雕刻胸甲 - 神圣风暴] |cRXP_WARN_or|r |T133815:0|t[雕刻胸甲 - 殉难印记]
    .train 425618,1
    .xp <4,1
    .xp >12,1
step
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 425618,1
    .xp <4,1
step
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_虔诚的亚瑟|r
    .train 20271 >>列车 |T135959:0|t[判断]
    .train 19740 >>列车 |T135906:0|t[力量祝福]
    .target Arthur the Faithful
    .train 425618,1
    .xp <4,1
step << skip
    #completewith next
    >>|cRXP_WARN_强烈建议你去获取|r |T134229:0|t[洛丹伦之角符文] |cRXP_WARN_in 洛克莫丹，因为它要容易得多|r
    >>|cRXP_WARN_不建议将|r |T134229:0|t[洛丹伦之角符文] |cRXP_WARN_用于|r |T236250:0|t[神圣风暴符文] |cRXP_WARN_或|r |T135961:0|t[殉难印记符文]
    .train 425618,1
    .xp <12,1
step
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
    .train 425618,1
    .xp <4,1
step
    #label LibramS
    .goto Westfall,44.45,25.76,0 --Rough Spawnpoint 1 (Jango Outside)
    .goto Westfall,45.35,21.20,0 --Jango Spawnpoint 2 (Jango Inside)
    .goto Westfall,31.82,43.99,0 --Rough Spawnpoint 4 (Quarry Outside)
    .goto Westfall,29.65,46.18,0 --Quarry Spawnpoint 5 (Quarry Inside)
    .goto Westfall,44.45,25.76,40,0 --Rough Spawnpoint 1 (Jango Outside)
    .goto Westfall,44.72,23.57,12,0 --Travel to Jango Spawnpoint 2 (Jango Inside)
    .goto Westfall,45.39,21.67,12,0 --Travel to Jango Spawnpoint 2 (Jango Inside)
    .goto Westfall,44.98,22.33,12,0 --Travel to Jango Spawnpoint 2 (Jango Inside)
    .goto Westfall,45.35,21.20,12,0 --Jango Spawnpoint 2 (Jango Inside)
    .goto Westfall,44.68,19.94,12,0 --Travel to Jango Spawnpoint 3 (Jango Inside)
    .goto Westfall,45.65,18.24,12,0 --Travel to Jango Spawnpoint 3 (Jango Inside)
    .goto Westfall,46.28,18.86,12,0 --Jango Spawnpoint 3 (Jango Inside)
    .goto Westfall,44.45,25.76,40,0 --Rough Spawnpoint 1 (Jango Outside)
    .goto Westfall,31.82,43.99,40,0 --Rough Spawnpoint 4 (Quarry Outside)
    .goto Westfall,30.42,45.81,12,0 --Travel to Quarry Spawnpoint 5 (Quarry Inside)
    .goto Westfall,29.65,46.18,15,0 --Quarry Spawnpoint 5 (Quarry Inside)
--  .goto Westfall,30.54,48.34,15,0 --Travel to Quarry Spawnpoint 6 (Quarry Inside, Unconfirmed)
--  .goto Westfall,30.14,49.51,15,0 --Travel to Quarry Spawnpoint 6 (Quarry Inside, Unconfirmed)
--   .goto Westfall,28.88,48.92,15,0 --Travel to Quarry Spawnpoint 6 (Quarry Inside, Unconfirmed)
    .goto Westfall,29.65,46.18 --Quarry Spawnpoint 5 (Quarry Inside)
    >>|cRXP_WARN_攻击 |cRXP_ENEMY_Undying Laborer|r。当它倒下时，使用|r |T135920:0|t[神圣伤害] |cRXP_WARN_例如|r |T135959:0|t[审判] |cRXP_WARN_将其杀死（您有 10 秒钟的时间这样做）。将其拾取以获得|r |T134916:0|t|cRXP_LOOT_[祝福圣契]|r
    >>|cRXP_WARN_|cRXP_ENEMY_Undying Laborer|r 显示为精英，但具有普通怪物的生命值和伤害力|r
    >>|cRXP_WARN_|cRXP_ENEMY_Undying Laborer|r 在整个黄金海岸采石场和 Jangolode 矿场中共享刷新。如果你在一个地方找不到它，请尝试另一个地方|r
    .collect 208849,1 --Libram of Blessings (1)
    .unitscan Undying Laborer
    .train 425618,1
    .xp <4,1
step
    .equip 18,208849 >>|cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[祝福圣典]|r
    .use 208849
    .itemcount 208849,1 --Libram of Blessings (1)
    .train 425618,1
    .xp <4,1
step
    .goto Westfall,56.09,47.67,20,0
    .goto Westfall,56.55,52.64
    .aura 408828 >>|cRXP_WARN_对 5 名独特的友方玩家（包括你自己）施放|r |T135906:0|t[力量祝福] |cRXP_WARN_或|r |T135970:0|t[智慧祝福] |cRXP_WARN_以获得|r |T136116:0|t[启发] |cRXP_WARN_buff|r
    .itemStat 18,QUALITY,2
    .train 425618,1
    .xp <14,1
--XX Doesn't work on NPCs
step
    .goto Westfall,56.09,47.67,20,0
    .goto Westfall,56.55,52.64
    .aura 408828 >>|cRXP_WARN_对 5 名独特的友方玩家（包括你自己）施放|r |T135906:0|t[力量祝福] |cRXP_WARN_以获得 |r |T136116:0|t[启发] |cRXP_WARN_buff|r
    .itemStat 18,QUALITY,2
    .train 425618,1
    .xp <4,1
    .xp >14,1
step
    .cast 421508 >>|cRXP_WARN_使用|r |T134916:0|t|cRXP_LOOT_[祝福圣典]|r |cRXP_WARN_学习|r |T133815:0|t[雕刻胸甲 - 洛丹伦之角]
    .use 208849
    .aura -408828
    .train 425618,1
    .xp <4,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 守护 - 8（艾尔文森林）
#title Aegis
#next 斥责-10（暴风城）

step
    +|cRXP_WARN_你必须至少达到 8 级才能获得|r |T133815:0|t[雕刻胸甲 - 神盾] |cRXP_WARN_因为这是训练的等级要求|r |T135949:0|t[净化]
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133815:0|t[雕刻胸甲 - 神盾]
    .train 425619,1
    .xp >8,1
step
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 425619,1
    .xp <8,1
step
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_虔诚的亚瑟|r
    .train 1152 >>训练|T135949:0|t[净化]
    .target Arthur the Faithful
    .train 425619,1
    .xp <8,1
step
    #completewith next
    #label Elwynn1
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
    .train 425619,1
    .xp <8,1
step
    #completewith next
    #requires Elwynn1
    #label Cave1
    .goto Elwynn Forest,61.59,53.51,15 >>进入 Jasperlode 矿井
    .train 425619,1
    .xp <8,1
step
    #label LibramS
    .goto Elwynn Forest,61.46,48.17,8,0
    .goto Elwynn Forest,61.31,48.87,8,0
    .goto Elwynn Forest,60.61,49.94,8,0
    .goto Elwynn Forest,60.73,50.83,8,0
    .goto Elwynn Forest,61.22,51.51,8,0
    .goto Elwynn Forest,61.44,52.64,8,0
    .goto Elwynn Forest,61.97,47.31,12 >>前往洞穴内地面上的 |cRXP_FRIENDLY_Wounded Adventurer|r
    .target Wounded Adventurer
    .train 425619,1
    .xp <8,1
--XX no completewith next so people don't brick it by casting Purify accidentally
step
    #completewith next
    .goto Elwynn Forest,61.97,47.31
    .cast 1152 >>|cRXP_WARN_施放|r |T135949:0|t[净化] |cRXP_WARN_对|r |cRXP_FRIENDLY_受伤的冒险者|r
    .target Wounded Adventurer
    .train 425619,1
    .xp <8,1
step
    .goto Elwynn Forest,61.97,47.31
    >>|cRXP_WARN_与 |cRXP_FRIENDLY_受伤的冒险者|r交谈并对他施放|r |T135949:0|t[净化] |cRXP_WARN_以获得|r |T134419:0|t[庇护符文]
    .collect 205685,1 --Rune of Aegis (1)
    .target Wounded Adventurer
    .skipgossip
    .train 425619,1
    .xp <8,1
--XX gossipoption 109556
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[神盾符文] |cRXP_WARN_学习|r |T133815:0|t[雕刻胸甲 - 神盾]
    .use 205685
    .itemcount 205685,1 --Rune of Aegis (1)
    .train 425619,1
    .xp <8,1
--XX cast 425589
--XX Rune acquirable if someone else purifies him for you?
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 守护-8（丹莫洛）
#title Aegis
#next 斥责-10（铁炉堡）

step
    +|cRXP_WARN_你必须至少达到 8 级才能获得|r |T133815:0|t[雕刻胸甲 - 神盾] |cRXP_WARN_因为这是训练的等级要求|r |T135949:0|t[净化]
    >>|cRXP_WARN_你需要先升级才能尝试获取|r |T133815:0|t[雕刻胸甲 - 神盾]
    .train 425619,1
    .xp >8,1
step
    #completewith next
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .train 425619,1
    .xp <8,1
step
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布兰度尔·铁锤|r
    .train 1152 >>训练|T135949:0|t[净化]
    .target Brandur Ironhammer
    .train 425619,1
    .xp <8,1
step
    #completewith next
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
    .train 425619,1
    .xp <8,1
step
    #label LibramS
    .goto Dun Morogh,25.57,43.37,40 >>前往地面上的 |cRXP_FRIENDLY_Wounded Adventurer|r
    .target Wounded Adventurer
    .train 425619,1
    .xp <8,1
step
    #completewith next
    .goto Dun Morogh,25.57,43.37
    .cast 1152 >>|cRXP_WARN_施放|r |T135949:0|t[净化] |cRXP_WARN_对|r |cRXP_FRIENDLY_受伤的冒险者|r
    .target Wounded Adventurer
    .train 425619,1
    .xp <8,1
step
    .goto Dun Morogh,25.57,43.37
    >>|cRXP_WARN_与 |cRXP_FRIENDLY_受伤的冒险者|r交谈并对他施放|r |T135949:0|t[净化] |cRXP_WARN_以获得|r |T134419:0|t[庇护符文]
    .collect 205685,1 --Rune of Aegis (1)
    .target Wounded Adventurer
    .skipgossip
    .train 425619,1
    .xp <8,1
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[神盾符文] |cRXP_WARN_学习|r |T133815:0|t[雕刻胸甲 - 神盾]
    .use 208849
    .itemcount 205685,1 --Rune of Aegis (1)
    .train 425619,1
    .xp <8,1
--XX Rune acquirable if someone else purifies him for you?

]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 神圣之光 - 10（暴风城）
#title Divine Light
#next 洛丹伦之角 - 12（西部荒野）

step
    #completewith LibramS
    +|cRXP_WARN_你必须至少达到 10 级才能在暴风城单独获得|r |T133815:0|t[雕刻宝箱 - 神圣之光] |cRXP_WARN_|r
    .train 410015,1
    .xp >10,1
step
    #completewith next
    #label Stormwind1
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 410015,1
step
    #completewith next
    #requires Stormwind1
    #label LibramS
    .goto StormwindClassic,42.77,34.32,10,0
    .goto StormwindClassic,41.37,31.53,10,0
    .goto StormwindClassic,38.10,28.10,12 >>前往大教堂内的 |cRXP_FRIENDLY_Brother Romulus|r
    .train 410015,1
step
    .goto StormwindClassic,38.10,28.10
    .gossipoption 109653 >>Talk to |cRXP_FRIENDLY_Brother Romulus|r
    .target Brother Romulus
    .skipgossip
    .train 410015,1
step
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
    >>下楼进入大教堂地下室的西侧
    .goto StormwindClassic,32.86,24.77,8 >>前往墓穴中的 |cRXP_LOOT_Charred Note|r
    .train 410015,1
step
    .goto StormwindClassic,32.86,24.87
    >>抢夺蜡烛旁边的 |cRXP_LOOT_Charred Note|r
    .collect 205864,1 --Charred Note (1)
    .train 410015,1
step
    #completewith next
    #label Island
    .goto Duskwood,4.33,28.26,50 >>前往岛上的 |cRXP_FRIENDLY_Ada Gelhardt|r
    .train 410015,1
step
    #completewith next
    .goto Duskwood,4.33,28.26
    .gossipoption 109610 >>Talk to |cRXP_FRIENDLY_Ada Gelhardt|r to start a fight
    .target Ada Gelhardt
    .skipgossip 205153,1
    .train 410015,1
--XX 109612 "As one candle is snuffed out, another is lit"
--XX 109611 "I've been sent by brother Romulus. Please, Ada, return with me to the Cathedral of Light"
--XX 109610 "I see. I'm sorry it has come to this, sister. (Fight Ada)"
step
    #requires Island
    .goto Duskwood,4.33,28.26
    >>击败 |cRXP_ENEMY_Ada Gelhardt|r
    >>|cRXP_WARN_记得预先对她施放|r |T135924:0|t[十字军印记] |cRXP_WARN_|r
    >>|cRXP_WARN_当她施放|r |T136197:0|t[暗影震击] |cRXP_WARN_时要小心（立即造成 45 点暗影伤害。消耗她 75 点法力。你应该尽快杀死她，使她只能施放 3 次）|r
    >>|cRXP_WARN_击败 |cRXP_ENEMY_Ada Gelhardt|r 后：|r
    >>Talk to |cRXP_FRIENDLY_Ada Gelhardt|r again to receive the |T134419:0|t[Rune of Divine Light]
    .collect 205897,1 --Rune of Divine Light (1)
    .target Ada Gelhardt
    .skipgossip 205153,1
    .train 410015,1
--XX Must have had the Charred Note to unlock the dialogue
step
    #sticky
    .destroy 205864 >>从你的包里删除 |T134939:0|t[烧焦的纸条]，因为它不再需要了
step
    .train 410015 >>|cRXP_WARN_使用|r |T134419:0|t[神圣之光符文] |cRXP_WARN_学习|r |T133815:0|t[雕刻胸甲 - 神圣之光]
    .use 205897
    .itemcount 205897,1 --Rune of Divine Light (1)
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 神圣风暴 - 25（黑海岸）
#title Divine Storm
#next 神圣牺牲 - 25（艾泽拉斯）

step
    #completewith LibramS
    +|cRXP_WARN_你应该至少达到 25 级才能获得|r |T133815:0|t[雕刻宝箱 - 神圣风暴] |cRXP_WARN_AND 你应该找到至少 2 个其他 25 级圣骑士来轻松地完成此任务|r
    .train 410014,1
--  .xp >25,1
step
    #completewith LibramS
    #label DarkshoreT
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
    .train 410014,1
step
    #completewith next
    #requires DarkshoreT
    .goto Darkshore,56.49,26.44,10 >>前往阿萨拉克斯之塔
    .train 410014,1
step
    #label LibramS
    .goto Darkshore,56.20,26.46
    >>打开 Althalaxx 之塔顶桌上的 |cRXP_PICK_Strange Orb|r。拾取它以获得 |cRXP_LOOT_Althalaxx Orb|r
    >>|cRXP_WARN_要小心，因为这座塔里的怪物很难对付（28-31 级）|r
    >>|cRXP_WARN_小心 |cRXP_ENEMY_Dark Strand Voidcallers|r 施放|r |T136197:0|t[暗影箭] |cRXP_WARN_(远程施放：造成约 175 点暗影伤害)。确保尽可能地瞄准它们|r
    .collect 209836,1,78089,1 --Athalaxx Orb (1)
    .train 410014,1
step
    #completewith Delgren1
    #label AshenvaleT
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .train 410014,1
step
    #completewith next
    #requires AshenvaleT
    .goto Ashenvale,26.19,38.69,10 >>前往 |cRXP_FRIENDLY_净化者德尔格伦|r
    .train 410014,1
step
    .goto Ashenvale,26.19,38.69
    >>对话: |cRXP_FRIENDLY_净化者德尔格伦|r
    .turnin 78088 >>上交一件奇怪的文物
    .accept 78089 >>接受暴风城的建议
    .target Delgren the Purifier
    .train 410014,1
    .itemcount 209836,1 --Athalaxx Orb (1)
step
    #label Delgren1
    .goto Ashenvale,26.19,38.69
    >>对话: |cRXP_FRIENDLY_净化者德尔格伦|r
    .accept 78089 >>接受暴风城的建议
    .target Delgren the Purifier
    .train 410014,1
    .isQuestTurnedIn 78088
step
    #completewith Katherine1
    #label StormwindT1
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 410014,1
step
    #completewith next
    #requires StormwindT1
    .goto StormwindClassic,42.77,34.32,10,0
    .goto StormwindClassic,41.37,31.53,10,0
    .goto StormwindClassic,39.19,31.03,10,0
    .goto StormwindClassic,37.23,31.87,12 >>前往大教堂内的 |cRXP_FRIENDLY_Katherine the Pure|r
    .train 410014,1
step
    #label Katherine1
    .goto StormwindClassic,37.23,31.87
    >>对话: |cRXP_FRIENDLY_纯洁的凯瑟琳|r
    .turnin 78089 >>提交暴风城的建议
    .accept 78090 >>接受第二种意见
    .target Katherine the Pure
    .train 410014,1
step
    #completewith next
    .goto StormwindClassic,29.04,74.28,10,0
    .goto StormwindClassic,27.40,76.48,10,0
    .goto StormwindClassic,27.14,77.83,5,0
    .goto StormwindClassic,26.12,77.23,8 >>前往 The Slaughtered Lamb 内的 |cRXP_FRIENDLY_Ursula Deline|r
    .train 410014,1
step
    .goto StormwindClassic,26.12,77.23
    >>对话: |cRXP_FRIENDLY_厄苏拉·德林|r
    .turnin 78090 >>提交第二意见
    .accept 78091 >>接受赚取盐分
    .target Ursula Deline
    .train 410014,1
step
    #completewith theairissalt
    .goto StormwindClassic,66.28,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Redridge >>飞往赤脊山
    .zoneskip Redridge Mountains
    .target Dungar Longdrink
    .train 410014,1
step
    #loop
    .goto Redridge Mountains,42.26,17.20,0
    .goto Redridge Mountains,35.02,7.66,0
    .goto Redridge Mountains,61.62,43.50,0
    .goto Redridge Mountains,76.15,83.00,0
    .goto Redridge Mountains,76.88,72.15,0
    .goto Redridge Mountains,42.26,17.20,50,0
    .goto Redridge Mountains,35.02,7.66,50,0
    .goto Redridge Mountains,61.62,43.50,50,0
    .goto Redridge Mountains,76.15,83.00,50,0
    .goto Redridge Mountains,76.88,72.15,50,0
    >>|cRXP_WARN_如果你还没有|r |T134596:0|t[雕刻长裤 - 复仇者之盾] |cRXP_WARN_already，那么现在就值得做。如果你不想做，请跳过此步骤|r
    >>杀死 |cRXP_ENEMY_亵渎者德罗泽姆|r。从他身上搜刮 |T134419:0|t[复仇者符文]|r
    >>|cRXP_WARN_他在外面有 3 个刷新点：东南（Render's Valley）、中部（Stonewatch Tower 外的营地）和北部（Render's Camp）。尽管他是一个“稀有”的怪物，但他刷新得很快|r
    >>|cRXP_WARN_在一般聊天中询问是否有人见过他，以减少您的搜索时间（在聊天中输入 /1）|r
    .collect 211488,1 --Rune of the Avenger (1)
    .unitscan Dro'zem the Blasphemous
    .train 410008,1
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[复仇者符文] |cRXP_WARN_学习|r |T134596:0|t[雕刻裤子 - 复仇者之盾]
    .use 211488
    .itemcount 211488,1 --Rune of the Avenger (1)
    .train 410008,1
step
    #label theairissalt
    #loop
    .goto Redridge Mountains,43.59,18.99,30,0
    .goto Redridge Mountains,38.84,14.25,30,0
    .goto Redridge Mountains,35.18,7.91,30,0
    .goto Redridge Mountains,32.58,6.79,15,0
    .goto Redridge Mountains,31.18,6.95,15,0
    .goto Redridge Mountains,30.09,8.63,15,0
    .goto Redridge Mountains,27.10,8.48,15,0
    .goto Redridge Mountains,27.24,11.93,15,0
    .goto Redridge Mountains,25.89,13.45,15,0
    .goto Redridge Mountains,26.30,15.22,15,0
    .goto Redridge Mountains,27.46,15.93,15,0
    .goto Redridge Mountains,31.06,14.99,15,0
    .goto Redridge Mountains,31.29,12.90,15,0
    .goto Redridge Mountains,29.17,11.37,25,0
    >>杀死 |cRXP_ENEMY_Blackrock Summoners|r、|cRXP_ENEMY_Blackrock Champions|r 和 |cRXP_ENEMY_Blackrock Trackers|r。掠夺他们以获得 |cRXP_LOOT_Summoner's Salt|r
    >>|cRXP_WARN_|cRXP_LOOT_Summoner's Salt|r 是按个人分配的（每个怪物都有机会为你的小队中的每个人掉落盐），因此你可以轻松地与其他人组队完成此任务|r
    .complete 78091,1 --Summoner's Salt (14)
    .mob Blackrock Summoner
    .mob Blackrock Champion
    .mob Blackrock Tracker
    .train 410014,1
step
    #completewith Ursula1
    #label StormwindT2
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 410014,1
step
    #completewith next
    #requires StormwindT2
    .goto StormwindClassic,29.04,74.28,10,0
    .goto StormwindClassic,27.40,76.48,10,0
    .goto StormwindClassic,27.14,77.83,5,0
    .goto StormwindClassic,26.12,77.23,8 >>前往 The Slaughtered Lamb 内的 |cRXP_FRIENDLY_Ursula Deline|r
    .train 410014,1
step
    #label Ursula1
    .goto StormwindClassic,26.12,77.23
    >>对话: |cRXP_FRIENDLY_厄苏拉·德林|r
    .turnin 78091 >>交出你的盐
    .accept 78092 >>接受它必须被摧毁
    .target Ursula Deline
    .train 410014,1
step
    #completewith Motes
    #label AshenvaleT
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .train 410014,1
step
    #completewith next
    #requires AshenvaleT
    .goto Ashenvale,84.12,72.10,200 >>前往恶魔坠落峡谷
    .train 410014,1
step
    #label Motes
    #loop
    .goto Ashenvale,83.92,71.16,50,0
    .goto Ashenvale,84.65,74.15,50,0
    .goto Ashenvale,84.18,76.79,50,0
    .goto Ashenvale,82.60,79.15,50,0
    .goto Ashenvale,82.74,77.95,15,0
    .goto Ashenvale,82.02,77.93,15,0
    .goto Ashenvale,81.13,78.57,15,0
    .goto Ashenvale,81.17,79.78,15,0
    .goto Ashenvale,78.59,81.31,50,0
    .goto Ashenvale,84.18,76.79,50,0
    .goto Ashenvale,84.78,77.78,50,0
    .goto Ashenvale,87.28,79.21,50,0
    .goto Ashenvale,89.76,76.69,50,0
    .goto Ashenvale,84.18,76.79,50,0
    >>杀死 |cRXP_ENEMY_Searing Infernals|r、|cRXP_ENEMY_Felguards|r、|cRXP_ENEMY_Mannoroc Lashers|r 和 |cRXP_ENEMY_Legion Hounds|r。拾取它们以获得 |cRXP_LOOT_Motes of Mannoroth|r
    >>|cRXP_WARN_|cRXP_LOOT_Motes of Mannoroth|r 是按个人分配的（每个怪物都有机会为你的小队中的每个人掉落 Motes），因此你可以轻松地与其他人组队完成此任务|r
    >>|cRXP_WARN_要小心，因为 |cRXP_ENEMY_Searing Infernals|r 有|r |T135802:0|t[献祭光环] |cRXP_WARN_(被动近战范围攻击：每 3 秒造成 27-28 点火焰伤害)、|cRXP_ENEMY_Felguards|r 施放|r |T132154:0|t[击倒] |cRXP_WARN_(近战瞬发：造成约 140 点伤害并使人昏迷 2 秒)、|cRXP_ENEMY_Mannoroc Lashers|r 施放|r |T135817:0|t[烈焰鞭笞] |cRXP_WARN_(远程瞬发：造成约 45 点火焰伤害，然后每 3 秒造成 12-13 点火焰伤害，持续 21 秒) 和|r |T136197:0|t[暗影箭] |cRXP_WARN_（远程施法：造成约 125 点暗影伤害）|r
    .complete 78092,1 --Mote of Mannoroth (12)
    .mob Searing Infernal
    .mob Felguard
    .mob Mannoroc Lasher
    .mob Legion Hound
    .train 410014,1
step
    >>点击空中的 |cRXP_PICK_玛诺洛斯之矛|r，然后点击地面上的 |cRXP_PICK_破碎之球|r
    .turnin 78092 >>上交必须销毁
    .goto Ashenvale,89.48,77.03
    .accept 78093 >>接受返回德尔格伦
    .goto Ashenvale,89.44,77.01
    .train 410014,1
step
    #completewith next
    .goto Ashenvale,26.19,38.69,10 >>前往 |cRXP_FRIENDLY_净化者德尔格伦|r
    .train 410014,1
step
    .goto Ashenvale,26.19,38.69
    >>对话: |cRXP_FRIENDLY_净化者德尔格伦|r
    .turnin 78093 >>向德尔格伦回信
    .train 410014 >>这会教你 |T133815:0|t[雕刻胸甲 - 神圣风暴]
    .target Delgren the Purifier
    .train 410014,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 灵感典范-6（艾尔文森林）
#title Inspiration Exemplar
#next 守护 - 8（艾尔文森林）

step
    #completewith LibramS
    +|cRXP_WARN_你必须至少达到 6 级才能与其他玩家一起在艾尔文森林中获得|r |T134596:0|t[雕刻裤子 - 灵感典范] |cRXP_WARN_|r
    .train 410011,1
    .xp >6,1
step
    #completewith next
    #label Elwynn1
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
    .train 410011,1
step
    #completewith next
    #requires Elwynn1
    .goto Elwynn Forest,52.28,84.56,40 >>前往|cRXP_FRIENDLY_冒险者的遗迹|r
    .train 410011,1
step
    #label LibramS
    .goto Elwynn Forest,52.28,84.56
    >>|cRXP_WARN_加入一个有另一位圣骑士、牧师或德鲁伊站在 |cRXP_FRIENDLY_Adventurer's Remains|r 旁边的小组，或者在常规聊天中寻求圣骑士、牧师或德鲁伊的帮助（在聊天中输入 /1）|r
    >>|cRXP_WARN_与地面上的 |cRXP_FRIENDLY_冒险者的遗骸|r 交谈以开始仪式，或点击其他玩家的|r |T136223:0|t[精神仪式] |cRXP_WARN_（在他们的小组中）|r
    >>|cRXP_WARN_仪式完成后，将出现一个 |cRXP_FRIENDLY_冒险者之魂|r，然后死亡。将其拾取以获得|r |T134419:0|t|cRXP_LOOT_[灵感符文]|r
    .collect 206264,1 --Rune of Inspiration (1)
    .target Adventurer's Remains
    .target Adventurer's Spirit
    .skipgossip
    .train 410011,1
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[灵感符文]|r |cRXP_WARN_学习|r |T134596:0|t[雕刻裤子 - 灵感典范]
    .use 206264
    .itemcount 206264,1 --Rune of Inspiration (1)
    .train 410011,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 灵感范例 - 6（邓莫罗）
#title Inspiration Exemplar
#next 守护-8（丹莫洛）

step
    #completewith LibramS
    +|cRXP_WARN_您必须至少达到 6 级才能与其他玩家一起在丹莫洛获得|r |T134596:0|t[雕刻裤子 - 灵感典范] |cRXP_WARN_|r
    .train 410011,1
    .xp >6,1
step
    #completewith LibramS
    #label Dun1
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
    .train 410011,1
step
    #completewith next
    #requires Dun1
    #label Cave1
    .goto Dun Morogh,42.47,54.22,20,0
    .goto Dun Morogh,42.28,52.82,20 >>进入灰白之巢
    .train 410011,1
step
    #completewith next
    #label LibramS
    #requires Cave1
    .goto Dun Morogh,42.06,51.86,20,0
    .goto Dun Morogh,41.42,50.97,20,0
    .goto Dun Morogh,41.24,50.28,20,0
    .goto Dun Morogh,41.25,49.68,20,0
    .goto Dun Morogh,43.03,49.63,20 >>前往洞穴内地面上的 |cRXP_FRIENDLY_Adventurer's Remains|r
    .train 410011,1
step
    .goto Dun Morogh,43.03,49.63
    >>|cRXP_WARN_加入一个有另一位圣骑士、牧师或德鲁伊站在 |cRXP_FRIENDLY_Adventurer's Remains|r 旁边的小组，或者在常规聊天中寻求圣骑士、牧师或德鲁伊的帮助（在聊天中输入 /1）|r
    >>|cRXP_WARN_与地面上的 |cRXP_FRIENDLY_冒险者的遗骸|r 交谈以开始仪式，或点击其他玩家的|r |T136223:0|t[精神仪式] |cRXP_WARN_（在他们的小组中）|r
    >>|cRXP_WARN_仪式完成后，将出现一个 |cRXP_FRIENDLY_冒险者之魂|r，然后死亡。将其拾取以获得|r |T134419:0|t|cRXP_LOOT_[灵感符文]|r
    .collect 206264,1 --Rune of Inspiration (1)
    .target Adventurer's Remains
    .target Adventurer's Spirit
    .skipgossip
    .train 410011,1
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[灵感符文]|r |cRXP_WARN_学习|r |T134596:0|t[雕刻裤子 - 灵感典范]
    .use 206264
    .itemcount 206264,1 --Rune of Inspiration (1)
    .train 410011,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 斥责-10（铁炉堡）
#title Rebuke
#next 殉难圣印 - 10（暴风城）

step
    #completewith LibramS
    +|cRXP_WARN_你必须至少达到 10 级才能单独获得|r |T134596:0|t[雕刻裤子 - 斥责] |cRXP_WARN_in 铁炉堡|r
    .train 425621,1
    .xp >10,1
step
    #completewith next
    #label Ironforge1
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .train 425621,1
step
    #completewith next
    #requires Ironforge1
    #label LibramS
    .goto Ironforge,71.54,73.46,10,0
    .goto Ironforge,72.53,76.94,10 >>前往旅馆内的 |cRXP_FRIENDLY_Bruuk Barleybeard|r
    .train 425621,1
step
    .goto Ironforge,72.53,76.94
    .gossipoption 110791 >>对话: |cRXP_FRIENDLY_布鲁克·麦须|r, 他在里面
    .target Bruuk Barleybeard
    .skipgossip 5570,1,1
    .train 425621,1
--XX 110793 "How's business?"
--XX 110791 "Sounds like you need someone to bounce him for you."
step
    .goto Ironforge,72.40,73.63
    .gossipoption 109084 >>Talk to |cRXP_FRIENDLY_Bruart|r to start a fight
    >>击败 |cRXP_ENEMY_Bruart|r
    >>|cRXP_WARN_当他施法时要小心|r |T132939:0|t[反手] |cRXP_WARN_(使你昏迷 2 秒)|r
    >>|cRXP_WARN_记得预先对他施放|r|T135924:0|t[十字军印记]|cRXP_WARN_|r
    >>|cRXP_WARN_切勿意外对他施放|r|T135906:0|t[力量祝福]|cRXP_WARN_|r
    >>|cRXP_WARN_把他放风筝到楼上的阳台上，然后跳到旅馆外面并施放|r |T135920:0|t[圣光] |cRXP_WARN_if necessary|r
    .mob Bruart
    .skipgossip 209004,1
    .train 425621,1
--XX 109084 "Seems you've had a few too many"
--XX Check if another player can skip the "how's business" dialogue for you (paladin, warrior)
step
    .goto Ironforge,72.40,73.63,-1
    .goto Ironforge,72.53,76.94,-1
    >>击败 |cRXP_ENEMY_Bruart|r
    >>|cRXP_WARN_当他施法时要小心|r |T132939:0|t[反手] |cRXP_WARN_(使你昏迷 2 秒)|r
    >>|cRXP_WARN_记得预先对他施放|r|T135924:0|t[十字军印记]|cRXP_WARN_|r
    >>|cRXP_WARN_切勿意外对他施放|r|T135906:0|t[力量祝福]|cRXP_WARN_|r
    >>|cRXP_WARN_把他放风筝到楼上的阳台上，然后跳到旅馆外面并施放|r |T135920:0|t[圣光] |cRXP_WARN_if necessary|r
    >>|cRXP_WARN_击败 |cRXP_ENEMY_Bruart|r 后：|r
    >>对话: |cRXP_FRIENDLY_布鲁克·麦须|r
    >>|cRXP_WARN_如果他不给你|r |T134419:0|t[谴责符文]|cRXP_WARN_，你可能需要再次与|cRXP_ENEMY_Bruart|r 战斗|r
    .collect 205683,1 --Rune of Rebuke (1)
    .target Bruuk Barleybeard
    .skipgossip 5570,2,1
    .skipgossip 209004,1
    .train 425621,1
--XX 109539 "I've taken care of Stuart. He shouldn't be a problem anymore."
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[斥责符文] |cRXP_WARN_学习|r |T134596:0|t[雕刻裤子 - 斥责]
    .use 205683
    .itemcount 205683,1 --Rune of Rebuke (1)
    .train 425621,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 斥责-10（暴风城）
#title Rebuke
#next 殉难圣印 - 10（暴风城）

step
    #completewith LibramS
    +|cRXP_WARN_你必须至少达到 10 级才能在暴风城单独获得|r |T134596:0|t[雕刻裤子 - 斥责] |cRXP_WARN_|r
    .train 425621,1
    .xp >10,1
step
    #completewith next
    #label Stormwind1
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 425621,1
step
    #completewith next
    #requires Stormwind1
    #label LibramS
    .goto StormwindClassic,21.56,59.60,10,0
    .goto StormwindClassic,22.60,64.62,10 >>前往 The Park's Inn 内的 |cRXP_FRIENDLY_Liv Bradford|r
    .train 425621,1
step
    .goto StormwindClassic,22.60,64.62
    .gossipoption 109047 >>Talk to |cRXP_FRIENDLY_Liv Bradford|r inside
    .target Liv Bradford
    .skipgossip 203475,2,1
    .train 425621,1
--XX 109045 "How's business?"
--XX 109047 "Sounds like you need someone to bounce him for you."
--VV SKIPGOSSIP needs testing, if broken change to 1,1
step
    .goto StormwindClassic,21.21,62.78
    .gossipoption 109084 >>Talk to |cRXP_FRIENDLY_Stuart|r to start a fight
    >>击败|cRXP_ENEMY_Stuart|r
    >>|cRXP_WARN_当他施法时要小心|r |T132939:0|t[反手] |cRXP_WARN_(使你昏迷 2 秒)|r
    >>|cRXP_WARN_记得预先对他施放|r|T135924:0|t[十字军印记]|cRXP_WARN_|r
    >>|cRXP_WARN_切勿意外对他施放|r|T135906:0|t[力量祝福]|cRXP_WARN_|r
    >>|cRXP_WARN_把他放风筝到楼上，然后跳下来施放|r |T135920:0|t[圣光] |cRXP_WARN_if necessary|r
    .mob Stuart
    .skipgossip 203478,1
    .train 425621,1
--XX 109084 "Seems you've had a few too many"
--XX Check if another player can skip the "how's business" dialogue for you (paladin, warrior)
step
    .goto StormwindClassic,21.21,62.78,-1
    .goto StormwindClassic,22.60,64.62,-1
    >>击败|cRXP_ENEMY_Stuart|r
    >>|cRXP_WARN_当他施法时要小心|r |T132939:0|t[反手] |cRXP_WARN_(使你昏迷 2 秒)|r
    >>|cRXP_WARN_记得预先对他施放|r|T135924:0|t[十字军印记]|cRXP_WARN_|r
    >>|cRXP_WARN_切勿意外对他施放|r|T135906:0|t[力量祝福]|cRXP_WARN_|r
    >>|cRXP_WARN_把他放风筝到楼上，然后跳下来施放|r |T135920:0|t[圣光] |cRXP_WARN_if necessary|r
    >>|cRXP_WARN_击败 |cRXP_ENEMY_Stuart|r 后：|r
    >>Talk to |cRXP_FRIENDLY_Liv Bradford|r again to receive the |T134419:0|t[Rune of Rebuke]
    >>|cRXP_WARN_如果她没有给你|r |T134419:0|t[谴责符文]|cRXP_WARN_，你可能需要再次与|cRXP_ENEMY_Stuart|r战斗|r
    .collect 205683,1 --Rune of Rebuke (1)
    .target Liv Bradford
    .skipgossip 203478,1
    .skipgossip 203475,2,1
    .train 425621,1
--XX 109539 "I've taken care of Stuart. He shouldn't be a problem anymore."
--VV SKIPGOSSIP needs testing, if broken change to 1,1
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[斥责符文] |cRXP_WARN_学习|r |T134596:0|t[雕刻裤子 - 斥责]
    .use 205683
    .itemcount 205683,1 --Rune of Rebuke (1)
    .train 425621,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 光环掌握 - 24（暮色森林）
#title Aura Mastery
#next 光明灯塔 - 25（声望）

step
    +|cRXP_WARN_你必须至少达到 24 级才能获得|r |T134596:0|t[雕刻裤子 - 光环掌握] |cRXP_WARN_因为这是训练的等级要求|r |T135983:0|t[驱散亡灵]
    >>|cRXP_WARN_你需要先升级才能尝试获得|r |T134596:0|t[雕刻裤子 - 光环掌握]
    .train 416037,1
    .xp >24,1
step
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 416037,1
    .xp <24,1
step
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_虔诚的亚瑟|r
    .train 2878 >>训练 |T135983:0|t[驱散亡灵]
    .target Arthur the Faithful
    .train 416037,1
    .xp <24,1
step
    #completewith next
    .zone Duskwood >>前往: |cRXP_PICK_暮色森林|r
    .train 416037,1
    .xp <24,1
step
    #label LibramS
    #loop
    .goto Duskwood,20.84,63.75,50,0
    .goto Duskwood,20.00,71.10,50,0
    .goto Duskwood,21.58,72.00,50,0
    .goto Duskwood,24.26,71.82,50,0
    .goto Duskwood,22.91,66.62,50,0
    >>杀死 |cRXP_ENEMY_Defias Night Runners|r、|cRXP_ENEMY_Defias Night Blades|r 和 |cRXP_ENEMY_Defias Enchanters|r。拾取他们以获得 |T134916:0|t|cRXP_LOOT_[放逐圣典]|r
    >>|cRXP_WARN_要小心，因为 |cRXP_ENEMY_Defias Night Runners|r 和 |cRXP_ENEMY_Defias Night Blades|r 会施放|r |T136093:0|t[减速毒药] |cRXP_WARN_(降低 35% 移动速度，持续 25 秒)，|r |T132090:0|t[背刺] |cRXP_WARN_(从背后造成双倍伤害。|cRXP_ENEMY_Defias Night Runners|r 是|r |T132320:0|t[潜行]|cRXP_WARN_，而 |cRXP_ENEMY_Defias Enchanters|r 会施放|r |T135812:0|t[火球术] |cRXP_WARN_(造成大约 150 点火焰伤害) 并且有|r |T135843:0|t[冰霜盔甲] |cRXP_WARN_（击中时减慢攻击和移动速度）|r
    .collect 211472,1 -- Libram of Banishment (1)
    .mob Defias Night Runner
    .mob Defias Night Blade
    .mob Defias Enchanter
    .train 416037,1
    .xp <24,1
step
    .equip 18,211472 >>|cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[放逐圣典]|r
    .use 211472
    .itemcount 211472,1 -- Libram of Banishment (1)
    .train 416037,1
    .xp <24,1
step
    #loop
    .goto Duskwood,22.49,47.91,50,0
    .goto Duskwood,20.41,47.56,50,0
    .goto Duskwood,14.65,47.37,50,0
    .goto Duskwood,16.31,44.96,50,0
    .goto Duskwood,22.95,40.55,50,0
    >>杀死 |cRXP_ENEMY_Skeletal Fiends|r 和 |cRXP_ENEMY_Skeletal Horrors|r
    .aura 408828 >>|cRXP_WARN_施放|r |T135983:0|t[驱散亡灵] |cRXP_WARN_然后用|r |T135903:0|t[驱魔] |cRXP_WARN_杀死他们5次以获得|r |T136116:0|t[启发] |cRXP_WARN_buff|r
    >>|cRXP_WARN_注意：你必须对可以提供经验的敌人执行此操作才能获得叠加|r
    .mob Skeletal Fiend
    .mob Skeletal Horror
    .itemStat 18,QUALITY,2
    .train 416037,1
    .xp <24,1
step
    .cast 421508 >>|cRXP_WARN_使用|r |T134916:0|t|cRXP_LOOT_[放逐圣典]|r |cRXP_WARN_学习|r |T134596:0|t[雕刻裤子 - 光环掌握]
    .use 211472
    .aura -408828
    .train 416037,1
    .xp <24,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Paladin SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 复仇者之盾 - 25（赤脊山）
#title Avenger's Shield
#next 灵感典范-6（艾尔文森林）

step
    +|cRXP_WARN_你必须至少达到 25 级才能单独在 Redridge 获得|r |T134596:0|t[雕刻裤子 - 复仇者之盾] |cRXP_WARN_|r
    .train 410008,1
    .xp >25,1
step
    #completewith next
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    .train 410008,1
step
    #label LibramS
    #loop
    .goto Redridge Mountains,42.26,17.20,0
    .goto Redridge Mountains,35.02,7.66,0
    .goto Redridge Mountains,61.62,43.50,0
    .goto Redridge Mountains,76.15,83.00,0
    .goto Redridge Mountains,76.88,72.15,0
    .goto Redridge Mountains,42.26,17.20,50,0
    .goto Redridge Mountains,35.02,7.66,50,0
    .goto Redridge Mountains,61.62,43.50,50,0
    .goto Redridge Mountains,76.15,83.00,50,0
    .goto Redridge Mountains,76.88,72.15,50,0
    >>杀死 |cRXP_ENEMY_亵渎者德罗泽姆|r。从他身上搜刮 |T134419:0|t[复仇者符文]|r
    >>|cRXP_WARN_他在外面有 3 个刷新点：东南（Render's Valley）、中部（Stonewatch Tower 外的营地）和北部（Render's Camp）。尽管他是一个“稀有”的怪物，但他刷新得很快|r
    >>|cRXP_WARN_在一般聊天中询问是否有人见过他，以减少您的搜索时间（在聊天中输入 /1）|r
    .collect 211488,1 --Rune of the Avenger (1)
    .unitscan Dro'zem the Blasphemous
    .train 410008,1
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[复仇者符文] |cRXP_WARN_学习|r |T134596:0|t[雕刻裤子 - 复仇者之盾]
    .use 211488
    .itemcount 211488,1 --Rune of the Avenger (1)
    .train 410008,1
--VV Overall paladin routing can be improved if Divine Sac turnin has items bought before Divine Storm -> Turned in after Divine Storm (run down after accepting Return to Delgren -> Turn in -> 飞往阿斯特兰纳 -> DS Turnin)
]])

RXPGuides.RegisterGuide([[
#classic
<< Paladin SoD
#group RestedXP 符文书指南
#subgroup Belt
#title Malleable Protection
#name 可塑防护 - 34（阿拉希高地）

step
    #optional
    .train 426175,1
    +|cRXP_WARN_你必须至少达到 34 级才能获得|r |T134419:0|t[|cRXP_FRIENDLY_虔诚符文|r]
    .xp >34,1
step
    .train 426175,1
    #completewith next
    .train 20164,1
    +|cRXP_WARN_你必须训练|r |T135971:0|t[正义印章] |cRXP_WARN_才能获得|r |T134419:0|t[|cRXP_FRIENDLY_虔诚符文|r]
step
    .train 426175,1
    .train 642,1
    .train 1020,1
    +|cRXP_WARN_你必须训练|r |T135896:0|t[圣盾] |cRXP_WARN_才能获得|r |T134419:0|t[|cRXP_FRIENDLY_虔诚符文|r]
step
    .train 426175,1
    #optional
    .train 20164,1
    +|cRXP_WARN_你必须训练|r |T135971:0|t[正义印章] |cRXP_WARN_才能获得|r |T134419:0|t[|cRXP_FRIENDLY_虔诚符文|r]
step
    .train 426175,1
    #completewith next
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    .train 426175,1
    #completewith BeadSoJ1
    .goto Arathi Highlands,68.8,71.8,0
    .goto Arathi Highlands,35.4,44.8,0
    +|cRXP_WARN_阿拉希高地的巨魔和食人魔也会掉落任何|r |T135261:0|t[|cRXP_LOOT_锈蚀的念珠|r]
step
    .train 426175,1
    #completewith Rosary
    #label BeadBoM1
    #loop
    .goto Arathi Highlands,33.26,32.60,50,0
    .goto Arathi Highlands,30.38,30.68,50,0
    .goto Arathi Highlands,31.46,25.36,50,0
    .goto Arathi Highlands,33.87,29.13,50,0
    .goto Arathi Highlands,31.13,29.47,50,0
    >>杀死 |cRXP_ENEMY_Syndicate Mercenaries|r、|cRXP_ENEMY_Syndicate Pathstalkers|r 和 |cRXP_ENEMY_Syndicate Highwaymen|r。从他们身上搜刮物品，获得 |T135261:0|t[|cRXP_LOOT_Tarnished Prayer Bead I|r]
    .collect 213444,1 --Tarnished Prayer Bead I
    .mob Syndicate Mercenary
    .mob Syndicate Pathstalker
    .mob Syndicate Highwayman
step
    .train 426175,1
    #requires BeadBoM1
    #label BeadBoM2
    #completewith Rosary
    +|cRXP_WARN_对自己施放|r |T135906:0|t[力量祝福] |cRXP_WARN_|r
    .aura 19740
    .aura 19834
    .aura 19835
    .aura 19836
    .aura 19837
    .aura 19838
    .aura 25291
    .aura 25782
    .aura 25916
step
    .train 426175,1
    #requires BeadBoM2
    #label BeadBoM3
    #completewith Rosary
    >>|cRXP_WARN_继续杀死敌人以获得|r |T135260:0|t[|cRXP_LOOT_神圣祈祷珠 I|r]
    >>|cRXP_WARN_你必须有一个活动的|r |T135906:0|t[力量祝福] |cRXP_WARN_buff|r
    .collect 213448,1 --Divine Prayer Bead I
step
    .train 426175,1
    #completewith Rosary
    #label BeadDS1
    #loop
    .goto Arathi Highlands,33.26,32.60,50,0
    .goto Arathi Highlands,30.38,30.68,50,0
    .goto Arathi Highlands,31.46,25.36,50,0
    .goto Arathi Highlands,33.87,29.13,50,0
    .goto Arathi Highlands,31.13,29.47,50,0
    >>杀死 |cRXP_ENEMY_Syndicate Mercenaries|r、|cRXP_ENEMY_Syndicate Pathstalkers|r 和 |cRXP_ENEMY_Syndicate Highwaymen|r。从他们身上搜刮物品，获得 |T135261:0|t[|cRXP_LOOT_Tarnished Prayer Bead II|r]
    .collect 213445,1 --Tarnished Prayer Bead II
    .mob Syndicate Mercenary
    .mob Syndicate Pathstalker
    .mob Syndicate Highwayman
step
    .train 426175,1
    #completewith Rosary
    #requires BeadDS1
    #label BeadDS2
    >>|cRXP_WARN_Cast|r |T135896:0|t[神圣之盾] |cRXP_WARN_在战斗中并且生命值低于 40% 时获得|r |T135260:0|t[|cRXP_LOOT_神圣念珠 II|r]
    .collect 213449,1 --Divine Prayer Bead II
    .usespell 642
    .usespell 1020
step
    .train 426175,1
    #completewith Rosary
    #label BeadSoJ1
    >>杀死 |cRXP_ENEMY_Syndicate Mercenaries|r、|cRXP_ENEMY_Syndicate Pathstalkers|r 和 |cRXP_ENEMY_Syndicate Highwaymen|r。从他们身上搜刮物品，获得 |T135261:0|t[|cRXP_LOOT_Tarnished Prayer Bead III|r]
    #loop
    .goto Arathi Highlands,33.26,32.60,50,0
    .goto Arathi Highlands,30.38,30.68,50,0
    .goto Arathi Highlands,31.46,25.36,50,0
    .goto Arathi Highlands,33.87,29.13,50,0
    .goto Arathi Highlands,31.13,29.47,50,0
    .collect 213446,1 --Tarnished Prayer Bead III
    .mob Syndicate Mercenary
    .mob Syndicate Pathstalker
    .mob Syndicate Highwayman
step
    .train 426175,1
    #completewith Rosary
    #requires BeadSoJ1
    #label BeadSoJ2
    >>|cRXP_WARN_Cast|r |T135971:0|t[正义圣印] |cRXP_WARN_随后|r |T135959:0|t[审判] |cRXP_WARN_对逃跑的敌人施放|r |T135260:0|t[|cRXP_LOOT_神圣祈祷珠 III|r]
    .collect 213450,1 --Divine Prayer Bead III
    .usespell 20164
    .usespell 20271
step
    .train 426175,1
    #optional
    #requires BeadBoM3
step
    .train 426175,1
    #optional
    #requires BeadDS2
step
    .train 426175,1
    #optional
    #requires BeadSoJ2
step
    .train 426175,1
    #label Rosary
    >>|cRXP_WARN_使用|r |T135260:0|t[|cRXP_LOOT_神圣祈祷珠|r] |cRXP_WARN_将它们合并成|r |T133289:0|t[|cRXP_LOOT_光之念珠|r]
    .use 213448
    .use 213449
    .use 213450
    .collect 213447,1
step
    .train 426175,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Atticus|r inside Stormgarde Keep to receive the |T134419:0|t[|cRXP_FRIENDLY_Rune of Piety|r]
    .goto Arathi Highlands,26.06,55.75,20,0
    .goto Arathi Highlands,25.71,59.92,20,0
    .goto Arathi Highlands,23.69,60.52,20,0
    .goto Arathi Highlands,23.75,58.89,15,0
    .goto Arathi Highlands,27.81,58.99,15,0
    .goto Arathi Highlands,28.74,58.97,15,0
    .goto Arathi Highlands,28.71,57.37,15,0
    .goto Arathi Highlands,27.01,56.95
    .skipgossip 217387,1
    .collect 213128,1
    .target Brother Atticus
step
    .itemcount 213128,1
    .use 213128
    .train 426175 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_虔诚符文|r] |cRXP_WARN_进行训练|r |T236251:0|t[可塑性保护]
]])


RXPGuides.RegisterGuide([[
#classic
<< Paladin SoD
#group RestedXP 符文书指南
#subgroup Belt
#name 光之鞘 - 40（艾泽拉斯）
#title Sheath of Light

step
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .train 426178,1
    .goto Desolace,52.730,84.761
    >>拾取地面上的 |cRXP_PICK_Broken Warhammer|r 以获得 |T133041:0|t[|cRXP_LOOT_Broken Hammer|r]
    .use 215441 >>|cRXP_WARN_使用 |T133041:0|t[|cRXP_LOOT_Broken Hammer|r] 开始任务|r
    .collect 215441,1
    .accept 79939 >>接受破损的锤子
step
    .train 426178,1
    #loop
    .goto Desolace,52.6,85.6,0
    .goto Desolace,55.6,70.4,0
    .goto Desolace,47,2,75.2,0
    .goto Desolace,52.6,85.6,40,0
    .goto Desolace,55.6,70.4,40,0
    .goto Desolace,47,2,75.2,60,0
    >>杀死 |cRXP_ENEMY_Burning Blade Summoners|r。掠夺他们以获得 |T133471:0|t[|cRXP_LOOT_Torn Letter|r]
    .collect 216956,1,79939,1
    .mob Burning Blade Summoner
step
    #completewith Katherine
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step
    #completewith Katherine
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step
    .train 426178,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纯洁的凯瑟琳|r
    .goto Stormwind City,37.222,31.855
    .turnin 79939 >>交出破损的锤子
    .accept 79940 >>接受“失散的兄弟”
    .target Katherine the Pure
step
    #label Katherine
    .train 426178,1
    .goto Stormwind City,37.222,31.855
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纯洁的凯瑟琳|r
    .skipgossip 5492,1
    .complete 79940,1
    .turnin 79940 >>交出“失踪的兄弟”
    .target Katherine the Pure
step
    #completewith next
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
step
    .isQuestTurnedIn 79940
    .train 426178,1
    .goto Wetlands,8.086,58.592
    .gossip 3179,4 >>对话: |cRXP_FRIENDLY_哈洛德·李格斯|r
    .skipgossip 3179,2
    .target Harold Riggs
step
    #completewith next
    .goto 1415,41.937,58.932,40 >>|cRXP_WARN_向南游，一直游到丹莫洛。你很快就要杀死一名 40 级精英。考虑带上你的朋友一起来！|r
step
    .train 426178,1
    .goto 1415,41.937,58.932
    .gossip 217957 >>Talk to the |cRXP_FRIENDLY_Slain Scarlet Crusader|r inside the building
    >>|cRXP_WARN_这将召唤一名 40 级精英|r |cRXP_ENEMY_Scarlet Crusade Assassin|r
    .target Slain Scarlet Crusader
step
    .train 426178,1
    .goto 1415,41.937,58.932
    >>杀死 |cRXP_ENEMY_血色十字军刺客|r。拾取它以获得 |T133471:0|t[|cRXP_LOOT_大十字军的命令|r]
    .use 215468 >>|cRXP_WARN_使用 |T133471:0|t[|cRXP_LOOT_大十字军的命令|r] 开始任务|r
    .collect 215468,1,79945,1
    .accept 79945 >>接受大远征的命令
    .mob Scarlet Cursade Assassin
step
    #completewith Katherine2
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step
    #completewith Katherine2
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step
    .train 426178,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纯洁的凯瑟琳|r
    .goto Stormwind City,37.222,31.855
    .turnin 79945 >>上交大远征的命令
    .accept 79946 >>接受“患难兄弟”
    .target Katherine the Pure
step
    #label Katherine2
    .train 426178,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纯洁的凯瑟琳|r
    .goto Stormwind City,37.222,31.855
    .skipgossip 5492,3
    .complete 79946,1 --Learn more about Aeonas from Katherine
    .target Katherine the Pure
step
    .train 426178,1
    >>|cRXP_WARN_你现在必须进入血色修道院并完成整个大教堂之旅|r
    >>杀死 |cRXP_ENEMY_Mograine|r 和 |cRXP_ENEMY_Whitemane|r 后，与后面房间的 |cRXP_FRIENDLY_Aeonas|r 交谈
    .complete 79946,2 --Find Aeonas in the Scarlet Monastery
    .turnin 79946 >>交出患难兄弟
    .accept 79963 >>接受圣光的恩赐
    .target Aeonas
step
    .train 426178,1
    >>治愈 |cRXP_FRIENDLY_Aenoas|r 至满 HP
    .complete 79963,1 --Heal Aeonas
    .target Aeonas
step
    .train 426178,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aeonas|r
    .turnin 79963 >>奉圣光之恩上交
    .accept 79970 >>接受 辩护者埃欧纳斯
    .target Aeonas
step
    #completewith Aeonas
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step
    #completewith Aeonas
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step
    #label Aeonas
    .goto Stormwind City,37.355,31.708
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aeonas the Vindicated|r
    .turnin 79970 >>交出辩护者埃欧纳斯
    .train 426178 >>列车 |T236263:0|t[光之鞘]
    .target Aeonas the Vindicated
]])

RXPGuides.RegisterGuide([[
#classic
<< Paladin SoD
#group RestedXP 符文书指南
#subgroup Boots
#name 圣光守护 - 30（奥特兰克山脉）
#title Guarded by the Light

step
    #optional
    .train 416035,1
    +|cRXP_WARN_你必须至少达到 30 级才能获得|r |T134419:0|t[|cRXP_FRIENDLY_守护符文|r]
    .xp >30,1
step
    .train 416035,1
    .train 19752 >>|cRXP_WARN_你必须训练|r |T136106:0|t[神圣干预] |cRXP_WARN_以获得|r |T134419:0|t[|cRXP_FRIENDLY_守护符文|r]
step
    .train 416035,1
    .collect 17033,1 >>|cRXP_BUY_从任意试剂供应商处购买至少一个|r |T135259:0|t[神圣象征] |cRXP_BUY_|r
step
    .train 416035,1
    #completewith FriendRequired
    +|cRXP_WARN_确保带上 |cFFFFFFFFPriest|r、|cFFF58CBAPaladin|r 或 |cFFFF7D0ADruid|r 朋友来执行以下步骤！下一部分无法单独完成，因为必须有人复活你！|r
    .subzoneskip 281
step
    .train 416035,1
    .goto Alterac Mountains,39.675,60.675
    .zone Alterac Mountains >>前往: |cRXP_PICK_奥特兰克山脉|r
    .itemcount 213452,<1
step
    .train 416035,1
    #label FriendRequired
    >>点击地面上的 |cRXP_PICK_Frozen Remains|r。拾取它以获得 |cRXP_LOOT_Dormant Holy Rune|r
    .goto Alterac Mountains,39.675,60.675
    .collect 213452,1
step
    .train 416035,1
    .cast 19752 >>|cRXP_WARN_对陪伴您的朋友施放|r |T136106:0|t[神圣干预] |cRXP_WARN_|r
    .usespell 19752
step
    .train 416035,1
    >>|cRXP_WARN_让你的朋友移除|r |T136106:0|t[神圣干预] |cRXP_WARN_buff 并复活你|r
    >>|cRXP_WARN_您将收到|r |T134419:0|t[|cRXP_FRIENDLY_守护符文|r]
    .collect 213132,1
step
    .use 213132
    .itemcount 213132,1
    .train 416035 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_守护符文|r] |cRXP_WARN_训练|r |T237537:0|t[光明守护]
]])

RXPGuides.RegisterGuide([[
#classic
<< Paladin SoD
#group RestedXP 符文书指南
#subgroup Boots
#name 神圣之盾 - 30（凄凉之地）
#title Sacred Shield

step
    #optional
    .train 416028,1
    +|cRXP_WARN_你必须至少达到 18 级才能获得|r |T236249:0|t[神圣之盾] |cRXP_WARN_enraving|r
    .xp >18,1
step
    .train 416028,1
    .train 1044 >>|cRXP_WARN_你必须训练|r |T135968:0|t[自由祝福] |cRXP_WARN_才能获得|r |T236249:0|t[神圣之盾] |cRXP_WARN_enraving|r
step
    .train 416028,1
    #completewith Deliverance
    +|cRXP_WARN_确保带朋友一起完成以下步骤！接下来的部分无法单独完成！|r
step
    .train 416028,1
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .train 416028,1
    #label Deliverance
    .goto Desolace,66.532,7.531
    >>拾取桌子上的 |T134916:0|t[|cRXP_FRIENDLY_Libram of Deliverance|r]
    .collect 213513,1
step
    .train 416028,1
    .equip 18,213513 >>|cRXP_WARN_装备|r |T134916:0|t[|cRXP_FRIENDLY_救赎圣典|r]
    .use 213513
step
    .train 416028,1
    .goto Desolace,38.21,61.02,50,0
    .goto Desolace,36.44,60.52,60,0
    .goto Desolace,33.44,54.17,60,0
    .goto Desolace,30.33,58.26,60,0
    .goto Desolace,31.79,61.28
    .aura 408828 >>|cRXP_WARN_在其他玩家移动受限时对其施放 |r |T135968:0|t[自由祝福] |cRXP_WARN_5 次。每次执行此操作时，您将获得 |r |T237556:0|t[建筑灵感] |cRXP_WARN_|r
    >>|cRXP_WARN_一旦你拥有 5 叠 |r |T237556:0|t[建筑灵感]|cRXP_WARN_，你将获得 |r |T136116:0|t[灵感] |cRXP_WARN_buff|r
    >>|cRXP_WARN_在玛拉顿外面完成。|r |cRXP_ENEMY_玛拉顿牧人|r |cRXP_WARN_那里施放|r |T132149:0|t[网络]
    .mob Maraudine Wrangler
step
    .use 213513
    .train 416028 >>|cRXP_WARN_使用|r |T134916:0|t[|cRXP_FRIENDLY_解救圣典|r] |cRXP_WARN_训练|r |T236249:0|t[神圣之盾]
]])


-- RXPGuides.RegisterGuide([[
-- #classic
-- << Paladin SoD
-- #group RestedXP 符文书指南
-- #subgroup Bracers
-- #name 强化愤怒之锤
-- for phase 3

-- 强化愤怒之锤


-- ]])

-- RXPGuides.RegisterGuide([[
-- #classic
-- << Paladin SoD
-- #group RestedXP 符文书指南
-- #subgroup Bracers
-- #name 净化力量
-- for phase 3

-- 净化力量


-- ]])
RXPGuides.RegisterGuide([[
#classic
<< Paladin SoD
#group RestedXP 符文书指南
#subgroup Helmet
#name 狂热 - 44（艾泽拉斯）

step
    #optional
    .train 426178 >>|cRXP_WARN_你必须先学习|r |T236263:0|t[Sheath of Light] |cRXP_WARN_first 符文，然后才能获得这个符文。|r
    .train 429251,1
step
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 429251,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aeonas the Vindicated|r
    .goto Stormwind City,37.355,31.708
    .accept 81762 >>接受一些好消息
    .target Aeonas the Vindicated
step
    .train 429251,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纯洁的凯瑟琳|r
    .goto Stormwind City,37.222,31.855
    .turnin 81762 >>提交一些好消息
    .accept 81764 >>接受神秘商人
    .target Katherine the Pure
step
    #completewith next
    .zone Dustwallow Marsh >>前往: |cRXP_PICK_尘泥沼泽|r, 可以从米奈希尔港乘船前往塞拉摩
    .train 429251,1
step
    .train 429251,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elrick|r inside the inn
    *|cRXP_WARN_Two level 45 enemies will attack you after accepting the quest|r
    .goto Dustwallow Marsh,66.52,45.41
    .turnin 81764 >>交出神秘商人
    .accept 81765 >>接受白银之手圣骑士艾尔里克
    .target Elrick
step
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elrick|r
    .goto Dustwallow Marsh,66.52,45.41
    .gossip 221575,5
    .skipgossip 221575,1
    .train 429251,1
step
    .train 429251,1
    >>杀死 |cRXP_ENEMY_Elrick|r。从他身上搜刮物品，获得 |T133471:0|t[|cRXP_LOOT_Bloody Missive|r]
    >>|cRXP_WARN_使用|r |T133471:0|t[|cRXP_LOOT_Bloody Missive|r] |cRXP_WARN_获取任务|r
    .goto Dustwallow Marsh,66.52,45.41
    .collect 219930,1,81766,1
    .accept 81766 >>接受血腥信件
    .use 219930
    .skipgossip 221575,1
    .target Elrick
step
    #completewith next
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .train 429251,1
step
    .train 429251,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纯洁的凯瑟琳|r, to train
    .goto Stormwind City,37.222,31.855
    .turnin 81762 >>交出血腥信件
    .target Katherine the Pure
]])

RXPGuides.RegisterGuide([[
#classic
<< Paladin SoD
#group RestedXP 符文书指南
#subgroup Bracers
#name 圣光之赐 - 40（菲拉斯）

step
    #optional
    .train 5599 >>|cRXP_WARN_你必须接受|r |T135964:0|t[保护祝福] |cRXP_WARN_训练才能获得|r |T135931:0|t[圣光恩赐] |cRXP_WARN_符文|r
step
    #optional
    #completewith TeleporterTaken
    .isQuestTurnedIn 79984
    .goto Stranglethorn Vale,27.6,77.4,8 >>使用传送器前往藏宝海湾的菲拉斯
    .train 429242,1
step
    #optional
    .isQuestAvailable 79984
    #completewith TeleporterTaken
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
    .goto Feralas,85.27,43.66,8 >>使用 |cRXP_PICK_Wondergear Worldporter|r
    .train 429242,1
step
    #label TeleporterTaken
    .goto Feralas,84.26,43.81,10 >>到达平台
    .train 429242,1
step
    .train 429242,1
    >>1) |cRXP_WARN_在你的声望窗口中将加基森阵营设置为“处于战争状态”|r
    >>2）前往准确的航点位置
    >>3）看看木屋旁边的绿色灌木丛
    .goto Feralas,83.93,43.89
    .goto Feralas,85.27,43.66,0
    .aura 436534,1 >>4) |cRXP_WARN_等待 |cRXP_ENEMY_Tower Defense Automaton|r 正好位于你和灌木丛之间并攻击它|r
    .mob Tower Defense Automaton
step
    .train 429242,1
    >>|cRXP_WARN_治愈|r |cRXP_FRIENDLY_Frix Xizzix|r |cRXP_WARN_直到他站起来|r。
    .gossip 220930,1 >>之后与 |cRXP_FRIENDLY_Frix Xizzix|r 交谈
    .skipgossip 220930,1
    .goto Feralas,81.45,42.46
    .target Frix Xizzix
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    .train 429242,1
step
    .train 429242,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rix Xizzix|r and buy the |T134419:0|t[|cRXP_FRIENDLY_Rune of Grace|r]
    .goto Stranglethorn Vale,28.4,75.8
    .collect 219147,1
    .target Rix Xizzix
step
    .itemcount 219147,1
    .use 219147
    .train 429242 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_恩典符文|r] |cRXP_WARN_训练|r |T236249:0|t[神圣之盾]
]])

RXPGuides.RegisterGuide([[
#classic
<< Paladin SoD
#group RestedXP 符文书指南
#subgroup Helmet
#name 巫妖王之怒 - 43（内陆地区）

-- Wrath

step
    #optional
    .train 5502 >>|cRXP_WARN_你必须接受|r |T135974:0|t[Sense Undead] |cRXP_WARN_trained才能获得|r |T236260:0|t[Wrath] |cRXP_WARN_rune|r
    .train 429249,1
step
    #completewith RuneLearned
    +|cRXP_WARN_您只能在晚上 9 点至早上 6 点之间获取|r |T236260:0|t[Wrath] |cRXP_WARN_rune。|r
step
    #completewith next
    .zone The Hinterlands >>前往: |cRXP_PICK_辛特兰|r
    .train 429249,1
step
    .train 429249,1
    >>|cRXP_WARN_使用|r |T135974:0|t[感知亡灵] |cRXP_WARN_能够看到|r |cRXP_ENEMY_复仇之魂|r
    >>杀死 |cRXP_ENEMY_Vengeful Spirit|r。拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Wrath|r]
    *The |cRXP_ENEMY_Vengeful Spirit|r walks around the lake
    .goto The Hinterlands,33.0,44.2
    .collect 220165,1
    .mob Vengeful Spirit
step
    #label RuneLearned
    .itemcount 220165,1
    .use 220165
    .train 429249 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_愤怒符文|r] |cRXP_WARN_进行训练|r |T236260:0|t[愤怒]
]])

RXPGuides.RegisterGuide([[
#classic
<< Paladin SoD
#group RestedXP 符文书指南
#subgroup Bracers
#name 正义之锤 - 50（艾泽拉斯）

--x shiek: needs better coordinates
step
    #optional
    .train 410013 >>|cRXP_WARN_你必须先学习|r |T236253:0|t[正义之锤] |cRXP_WARN_first 符文，然后才能获得这个符文。|r
    .train 410013,1
step
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
    .train 410013,1
step
    .goto Felwood,45.0,52.0
    .gossip 217996,5 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aoenas the Vindicated|r
    .target Aoenas the Vindicated
    .train 410013,1
step
    .goto Felwood,44.6,52.0
    .gossip 221636,8 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gregory|r
    .target Gregory
    .train 410013,1
step
    .goto Felwood,44.6,52.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gregory|r
    .accept 81790,1 >>接受重要材料
    .target Gregory
    .train 410013,1
step
    #loop
    .goto Felwood,44.4,46.8,40,0
    .goto Felwood,40.0,43.6,40,0
    .goto Felwood,41.8,34.8,40,0
    .goto Felwood,48.0,38.8,40,0
    >>杀死 |cRXP_ENEMY_Infernal Sentry|r、|cRXP_ENEMY_Infernal Bodyguard|r、|cRXP_ENEMY_Entropic Beast|r 和 |cRXP_ENEMY_Entropic Horror|r。拾取它们可获得 |cRXP_LOOT_|T136030:0|tFiery Infernal Core|r
    .complete 81790,1 --3/3 Fiery Infernal Core
    .mob Infernal Sentry
    .mob Infernal Bodyguard
    .mob Entropic Beast
    .mob Entropic Horror
step
    #completewith next
    #title Maraudon
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
    .goto Desolace,30,62,20
    .train 410013,1
step
    >>|cRXP_WARN_建议组成 5 人小组。|r
    >>杀死 |cRXP_ENEMY_Princess Theradras.|r 玛拉顿的终极首领。搜刮她可获得 |cRXP_LOOT_|T134389:0|t闪烁的墓尘。|r
    .complete 81790,2 --1/1 Shimmering Grave Dust
    .mob Princess Theradras
    .train 410013,1
step << Alliance
    #completewith next
    #title Blackrock Depths
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
    .goto 1415,48.09,62.42,20
    .train 410013,1
step << Alliance
    >>|cRXP_WARN_建议组成 5 人小组，需要 3 枚金币。|r
    >>Venture through Blackrock Depths until you reach the Grim Guzzler Bar. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Plugger Spazzring|r and buy |T135262:0|t[Triple-Brewed Molten Lager]
    .complete 81790,3 --1/1 Triple-Brewed Molten Lager
    .target Plugger Spazzring
    .train 410013,1
step << Alliance
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
    .train 410013,1
step << Alliance
    #loop
    .goto Felwood,65.8,19.6,20,0
    .goto Felwood,67.6,15.0,20,0
    .goto Felwood,68.6,13.8,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brave Stonetorch|r
    .target Brave Stonetorch
    .accept 81944,1 >>接受新发现的目的
    .complete 81970,4 --1/1 Symbol of Faith
step << Horde
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
    .train 410013,1
step << Horde
    #loop
    .goto Felwood,65.8,19.6,20,0
    .goto Felwood,67.6,15.0,20,0
    .goto Felwood,68.6,13.8,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brave Stonetorch|r
    .target Brave Stonetorch
    .accept 81944,1 >>接受新发现的目的
    .complete 81970,4 --1/1 Symbol of Faith
step << Horde
    #completewith next
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
    .train 410013,1
step << Horde
    >>|cRXP_WARN_建议组成 5 人小组，需要 3 枚金币。|r
    >>Venture through Blackrock Depths until you reach the Grim Guzzler Bar. |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Plugger Spazzring|r and buy |T135262:0|t[Triple-Brewed Molten Lager]
    .complete 81790,3 --1/1 Triple-Brewed Molten Lager
    .target Plugger Spazzring
    .train 410013,1
step
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
    .train 410013,1
step
    .goto Felwood,44.6,52.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gregory|r
    .turnin 81790 >>接受重要材料
    .target Gregory
    .train 410013,1
step
    .goto Felwood,45.0,52.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aoenas the Vindicated|r
    .accept 81885,1 >>接任务: |cRXP_WARN_仪式|r
    .target Aoenas the Vindicated
    .train 410013,1
step
    .goto Felwood,44.6,52.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gregory|r
    .complete 81885,1 --1/1 Complete the Ritual
    .target Gregory
    .train 410013,1
step
    .goto Felwood,45.0,52.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aoenas the Vindicated|r
    .turnin 81885 >>交任务: |cRXP_FRIENDLY_仪式|r
    .target Aoenas the Vindicated
    .train 410013,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Paladin SoD
#group RestedXP 符文书指南
#subgroup 披风
#name 正义之盾 - 60（东瘟疫之地）

--There wasn't very precise info for this available, might need confirmation if it works properly

step
    #completewith next
    >>|cRXP_WARN_解锁此符文需要杀死斯坦索姆（亡灵）的一名首领。如果您愿意，请开始寻找一个团队。|r
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step
    .line Eastern Plaguelands,28.6,84.2,33.2,83.0,35.30,82.55,41.19,81.68,45.42,80.68,48.8,79.9,51.5,78.3,55.1,76.4
    >>Look for a |cRXP_ENEMY_Slack-Jawed Ghoul|r. Kill him and |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orthas|r a dwarf spirit that will appear. Accept his quest
    >>|cRXP_WARN_|r |cRXP_ENEMY_Slack-Jawed Ghoul|r |cRXP_WARN_在地下室和 Corrin's Crossing 之间的道路南侧区域巡逻|r
    .accept 84318 >>接受Oi！
    .unitscan Slack-Jawed Ghoul
    .target Orthas
step
    .goto Eastern Plaguelands,59.8,70.8 --Not sure if this is the house or the other one, need more info
    >>进入 Corrin's Crossing 的房子。抢劫二楼的 |T133040:0|t[|cRXP_PICK_Ornate Warhammer|r] |cRXP_WARN_|r
    .complete 84318,1
step
    .goto Eastern Plaguelands,59.8,70.8
    >>使用 |T134566:0|t[Orthas 最喜欢的金牙] 再次召唤 |cRXP_FRIENDLY_Orthas|r。与他交谈以完成任务并获得后续任务
    .turnin 84318 >>交出来吧！
    .accept 84319 >>接受哦不不要
    .use 227687
step
    .goto Eastern Plaguelands,59.7,68.7
    >>杀死任意 |cRXP_ENEMY_Stitched Horror|r 并拾取它以获得 |T133823:0|t[|cRXP_LOOT_Partially-Digested Plate Armor|r]
    .complete 84319,1
    .mob Stitched Horror
step
    >>使用 |T134566:0|t[Orthas 最喜欢的金牙] 再次召唤 |cRXP_FRIENDLY_Orthas|r。与他交谈以完成任务并获得后续任务
    .turnin 84319 >>交出哦不，不要
    .accept 84330 >>接受一点亡灵法术
step
    >>寻找斯坦索姆（亡灵）的队伍
    >>杀死 |cRXP_ENEMY_Maleki the Pallid|r 地下城亡灵区中的一个首领，并从他身上获取 |T134415:0|t[Necrotic Runestone]
    .complete 84330,1 --Necrotic Runestone
    .mob Maleki the Pallid
step
    .goto Eastern Plaguelands,22.7,86.1
    >>返回地下室，寻找 |cRXP_FRIENDLY_腐烂的矮人尸体|r。与其互动以完成任务
    .turnin 84330 >>交出一点点亡灵法术
step
    >>接受尸体的后续任务。这是一项即时上交的任务，它将教你如何雕刻 |T236265:0|t[|cRXP_FRIENDLY_正义之盾|r]
    .goto Eastern Plaguelands,22.7,86.1
    .accept 84332 >>接受领主的感激
    .turnin 84332 >>表达领主的感激之情

]])

RXPGuides.RegisterGuide([[
#classic
<< Paladin SoD
#group RestedXP 符文书指南
#subgroup 披风
#name 正义复仇 - 55（西瘟疫之地）
#title Righteous Vengeance
#next 震慑与敬畏 - 55（西瘟疫之地和东瘟疫之地）

step
    #completewith next
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    .goto Western Plaguelands,44.6,46.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Fallen Knight|r
    .gossip 227519,1 >>回顾他的对话
    .target Fallen Knight
--Not entirely sure if you even need to talk to him or if you do how deep the dialogue is
step
    .goto Western Plaguelands,47.5,50.4
    >>Enter the barn next to the |cRXP_FRIENDLY_Fallen Knight|r and |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Squire Cuthbert|r
    .accept 83808 >>陷入困境时接受
    .target Squire Cuthbert
step
    .goto Western Plaguelands,47.5,50.4
    .goto Western Plaguelands,45.7,53.9
    >>拾取附近的田野上的 [|cRXP_PICK_Squire Cuthbert's Sword|r]
    .complete 83808,1
step
    >>Go back to the barn and |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Squire Cuthbert|r
    .turnin 83808 >>交出 陷入困境
    .accept 83935 >>接受清除道路
    .target Squire Cuthbert
step
    .goto Western Plaguelands,45.7,53.9
    >>杀死 |cRXP_ENEMY_Blighted Zombies|r、|cRXP_ENEMY_Skeletal Terrors|r 和 |cRXP_ENEMY_Rotting Cadavers|r
    .complete 83935,1 --Blighted Zombie(5)
    .complete 83935,2 --Skeletal Terror(10)
    .complete 83935,3 --Rotting Cadaver(10)
    .mob Blighted Zombie
    .mob Skeletal Terror
    .mob Rotting Cadaver
step
    .goto Western Plaguelands,47.5,50.4
    >>Go back to the barn and |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Squire Cuthbert|r
    .turnin 83935 >>交任务“清除道路”
    .accept 83822,1 >>接受堕落骑士，|cRXP_WARN_这是护送任务|r
    .target Squire Cuthbert
step
    .goto Western Plaguelands,44.6,46.6
    >>护送 |cRXP_FRIENDLY_Squire Cuthbert|r 回到堕落骑士身边并帮助他焚烧尸体
    .complete 83822,1
step
    .goto Western Plaguelands,44.6,46.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Squire Cuthbert|r
    .turnin 83822 >>交出堕落骑士
    .accept 83936 >>接受道尔顿的任务
    .target Squire Cuthbert
step
    .goto Western Plaguelands,44.6,46.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Squire Cuthbert|r and go through his dialogue
    .complete 83936,1
    .target Squire Cuthbert
step
    .goto Western Plaguelands,44.6,46.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Squire Cuthbert|r and go through his dialogue. Turning in this quest will train you on how to engrave |T236260:0|t[|cRXP_FRIENDLY_Righteous Vengeance|r]
    >>您还将收到 |T237377:0|t[|cFF0070FFDalton's Horn|r]，您需要它来解锁 |T252188:0|t[|cRXP_FRIENDLY_Shock and Awe|r] 符文
    .turnin 83936 >>交出道尔顿的任务
    .target Squire Cuthbert
]])

RXPGuides.RegisterGuide([[
#classic
<< Paladin SoD
#group RestedXP 符文书指南
#subgroup 披风
#name 震慑与敬畏 - 60（西瘟疫之地和东瘟疫之地）
#title Shock and Awe & Avenging Wrath

step
    #completewith next
    +|cRXP_WARN_为了开始这个符文的任务，你需要解锁|r |T236260:0|t[|cRXP_FRIENDLY_Righteous Vengeance|r]的符文。|cRXP_WARN_转到正义复仇指南开始|r
    .train 440792,1 --Righteous Vengeance
step
    .goto Eastern Plaguelands,78.6,47.6
    >>|cRXP_WARN_使用|r |T237377:0|t[|cFF0070FFDalton's Horn|r] |cRXP_WARN_召唤|r |cRXP_FRIENDLY_Squire Cuthbert|r |cRXP_WARN_并杀死怪物直到他升级。一旦他升级，他就会给你一个免费的上交任务|r
    .accept 83823 >>接受暴力教训
    .turnin 83823 >>上交暴力教训
    .use 226122
step
    .goto Eastern Plaguelands,78.6,47.6
    >>|cRXP_WARN_使用|r |T237377:0|t[|cFF0070FFDalton's Horn|r] |cRXP_WARN_召唤|r |cRXP_FRIENDLY_Squire Cuthbert|r |cRXP_WARN_并继续杀死怪物直到他再次升级。一旦他升级，他会给你另一个免费的提交任务和另一个寻找名为|r |cRXP_ENEMY_Arkonos the Cursed 的巫妖的任务|r
    .accept 84008 >>接受恩典的教训
    .turnin 84008 >>上交优雅课程
    .accept 84017 >>接受“杀戮时刻”
    .use 226523
step
    .goto Eastern Plaguelands,78.6,47.6
    >>|cRXP_WARN_前往毒林地，位于光明之愿教堂以北。到达那里后，再次召唤你的侍从。寻找阿科诺斯的任务应该已经完成​​，你会得到另一个任务，接受它|r
    .turnin 84017 >>交出杀戮时刻
    .accept 84125 >>接受足够近可以触摸
    .use 226545
step
    .goto Eastern Plaguelands,83.7,41.9
    >>在 Noxious Glade 中杀死 |cRXP_ENEMY_暗影法师s|r 和 |cRXP_ENEMY_Dread Weavers|r。拾取他们以获得 |T135482:0|t[|cRXP_LOOT_Scourge Shadow Scalpel|r]
    .complete 84125,1
    .mob 暗影法师
    .mob Dread Weaver
step
    >>如果你失去了 |T237377:0|t[|cFF0070FFDalton's Horn|r] ，请使用 |cRXP_FRIENDLY_Squire Cuthbert|r 召唤他。与他交谈
    .turnin 84125 >>转至足够近以触摸
    .accept 84126 >>接受“结束战斗”
    .use 226122
    .target Squire Cuthbert
step
    .goto Eastern Plaguelands,86.6,39.8
    >>使用你获得的 |T237490:0|t[|cRXP_LOOT_Modified Shadow Scalpel|r] 驱散 |cRXP_ENEMY_Arkonos's|r 护盾。杀死他即可完成任务
    .complete 84126,1 --Arkonos the cursed slain
    .use 227685
step
    >>如果你失去了 |T237377:0|t[|cFF0070FFDalton's Horn|r] ，请使用 |cRXP_FRIENDLY_Squire Cuthbert|r 召唤他。与他交谈
    >>交出这个任务会教你如何雕刻|T252188:0|t[震慑与敬畏]，还会给你|T133745:0|t[|cRXP_FRIENDLY_复仇之怒的证明|r]，它会教你|T135875:0|t[复仇之怒]
    .turnin 84126 >>交出“完成战斗”
    .use 226122
    .target Squire Cuthbert
step
    .train 407788 >>使用 |T133745:0|t[|cRXP_FRIENDLY_Testament of Avenging Wrath|r] 来训练 |T135875:0|t[Avenging Wrath]
    .use 226399
]])