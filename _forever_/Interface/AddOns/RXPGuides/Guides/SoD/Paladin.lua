local _, addon = ...
if addon and addon.locale and addon.locale.AddGenericTranslation and GetLocale() == "zhCN" then
    for key, value in pairs({
        Gloves = "手套", Chest = "胸甲", Legs = "腿部", Helmet = "头部",
        Cloak = "披风", Boots = "靴子", Belt = "腰带", Bracers = "护腕",
    }) do
        addon.locale.AddGenericTranslation(key, value)
    end
end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Crusader Strike - 4 (Elwynn Forest)
#title 十字军打击
#next Inspiration Exemplar - 6 (Elwynn Forest)
--VV Not sure if you want to gate CS in Elwynn for humans only/DunM for dwarves only
#displayname 十字军打击 - 4（艾尔文森林）
step
    +|cRXP_WARN_必须至少达到4级才能获取|r |T133816:0|t[铭刻手套 - 十字军打击] |cRXP_WARN_，因为这是学习|r |T135959:0|t[审判] 的等级要求
    >>|cRXP_WARN_需要先提升等级才能尝试获取|r |T133816:0|t[铭刻手套 - 十字军打击]
    .train 410002,1
    .xp >4,1
step
    #completewith LibramS
    #label Elwynn1
    .zone Elwynn Forest >> 前往艾尔文森林
    .train 410002,1
    .xp <4,1
step
    #completewith next
    #requires Elwynn1
    .goto Elwynn Forest,48.35,41.97,15,0
    .goto Elwynn Forest,48.87,41.75,12,0
    .goto Elwynn Forest,49.61,41.87,12,0
    .goto Elwynn Forest,50.433,42.124,10 >>进入建筑寻找 |cRXP_FRIENDLY_萨缪尔修士|r
    .train 410002,1
    .xp <4,1
step
    .goto Elwynn Forest,50.433,42.124
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨缪尔修士|r交谈
    .train 20271 >> 学习|T135959:0|t[审判]
    .target 萨缪尔修士
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
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r，拾取|T134916:0|t|cRXP_LOOT_[审判圣契]|r
    .collect 205420,1 -- Libram of Judgement (1)
    .mob 迪菲亚暴徒
    .train 410002,1
    .xp <4,1
step
    .equip 18,205420 >> |cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[审判圣契] |r
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
    .aura 408828 >>|cRXP_WARN_施放|r|T135959:0|t[审判]|cRXP_WARN_10次，以获得|r|T136116:0|t[灵感勃发]|cRXP_WARN_增益|r
    .itemStat 18,QUALITY,2
    .train 410002,1
    .xp <4,1
step
    .cast 409920 >>|cRXP_WARN_使用|r|T134916:0|t|cRXP_LOOT_[审判圣契]|r|cRXP_WARN_学习|r|T133816:0|t[铭刻手套 - 十字军打击]
    .use 205420
    .aura -408828
    .train 410002,1
    .xp <4,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Crusader Strike - 4 (Dun Morogh)
#title 十字军打击
#next Inspiration Exemplar - 6 (Dun Morogh)
#displayname 十字军打击 - 4（丹莫罗）
step
    +|cRXP_WARN_必须至少达到4级才能获取|r |T133816:0|t[铭刻手套 - 十字军打击] |cRXP_WARN_，因为这是学习|r |T135959:0|t[审判] 的等级要求
    >>|cRXP_WARN_需要先提升等级才能尝试获取|r |T133816:0|t[铭刻手套 - 十字军打击]
    .train 410002,1
    .xp >4,1
step
    #completewith LibramS
    #label Dun1
    .zone Dun Morogh >> 前往丹莫罗
    .train 410002,1
    .xp <4,1
step
    #completewith next
    #requires Dun1
    .goto Dun Morogh,28.83,69.07,12,0
    .goto Dun Morogh,28.83,68.70,10,0
    .goto Dun Morogh,28.93,68.35,10,0
    .goto Dun Morogh,28.833,68.332,10 >>进入建筑寻找 |cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r
    .train 410002,1
    .xp <4,1
step
    .goto Dun Morogh,28.833,68.332
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r交谈
    .train 20271 >> 学习|T135959:0|t[审判]
    .target 布罗莫斯·格鲁诺尔
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
    >>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r，拾取他们掉落的|T134916:0|t|cRXP_LOOT_[审判圣契]|r
    .collect 205420,1 -- Libram of Judgement (1)
    .mob 霜鬃巨魔幼崽
    .train 410002,1
    .xp <4,1
step
    .equip 18,205420 >> |cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[审判圣契] |r
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
    .aura 408828 >>|cRXP_WARN_施放|r|T135959:0|t[审判]|cRXP_WARN_10次，获得|r|T136116:0|t[灵感勃发]|cRXP_WARN_增益|r
    .itemStat 18,QUALITY,2
    .train 410002,1
    .xp <4,1
step
    .cast 409920 >>|cRXP_WARN_使用|r|T134916:0|t|cRXP_LOOT_[审判圣契]|r|cRXP_WARN_学习|r|T133816:0|t[铭刻手套 - 十字军打击]
    .use 205420
    .aura -408828
    .train 410002,1
    .xp <4,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Hand of Reckoning - 14 (Loch Modan)
#title 清算之手
#next Inspiration Exemplar - 6 (Elwynn Forest)
#displayname 清算之手 - 14（洛克莫丹）
step
    +|cRXP_WARN_建议至少达到14级，再独自获取|r |T133816:0|t[铭刻手套 - 清算之手] |cRXP_WARN_（洛克莫丹）|r
    >>|cRXP_WARN_你必须至少达到8级，才能装备|r |T134916:0|t|cRXP_LOOT_[公正圣契]|r
    >>|cRXP_WARN_需要先提升等级才能尝试获取|r |T133816:0|t[铭刻手套 - 清算之手]
    .train 410001,1
    .xp >8,1
step
    +|cRXP_WARN_建议至少达到14级，再独自获取|r |T133816:0|t[铭刻手套 - 清算之手] |cRXP_WARN_（洛克莫丹）|r
    .train 410001,1
    .xp <8,1
    .xp >14,1
step
    #completewith next
    .zone Ironforge >>前往铁炉堡
    .train 410001,1
    .xp <8,1
step
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布兰度尔·铁锤|r 交谈
    .train 853 >> 学习 |T135963:0|t[制裁之锤]
    .target 布兰度尔·铁锤
    .train 410001,1
    .xp <8,1
step
    #completewith LibramS
    #label Loch1
    .zone Loch Modan >> 前往洛克莫丹
    .train 410001,1
    .xp <8,1
step
    #completewith LibramS
    #requires Loch1
    #label Cave1
    .goto Loch Modan,28.75,64.63,40,0
    .goto Loch Modan,35.35,83.51,20,0
    .goto Loch Modan,34.89,84.38,30 >>前往碎石洞穴
    .train 410001,1
    .xp <8,1
step
    #completewith next
    #requires Cave1
    .goto Loch Modan,34.24,85.59,12,0
    .goto Loch Modan,35.90,87.93,12,0
    .goto Loch Modan,37.27,89.56,15,0
    .goto Loch Modan,36.75,91.43,8 >>前往洞穴内水下的 |cRXP_PICK_沉没的圣物箱|r
    .train 410001,1
    .xp <8,1
step
    #label LibramS
    .goto Loch Modan,36.75,91.43
    >>打开水下的 |cRXP_PICK_沉没的圣物箱|r，拾取 |T134916:0|t|cRXP_LOOT_[公正圣契]|r
    .collect 208851,1 --Libram of Justice (1)
    .train 410001,1
    .xp <8,1
step
    .equip 18,208851 >> |cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[公正圣契]|r
    .use 208851
    .itemcount 208851,1 --Libram of Justice (1)
    .train 410001,1
    .xp <8,1
step
    #completewith next
    .aura 408828 >>|cRXP_WARN_先将敌人打至低生命值，再施放|r |T135963:0|t[制裁之锤] |cRXP_WARN_使其昏迷，并在昏迷期间击杀。重复10次即可获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意：必须选择能提供经验值的敌人，才能获得层数|r
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
    .aura 408828 >>|cRXP_WARN_先将敌人打至低生命值，再施放|r |T135963:0|t[制裁之锤] |cRXP_WARN_使其昏迷，并在昏迷期间击杀。重复10次即可获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意：必须选择能提供经验值的敌人，才能获得层数|r
    .mob 碎石穴居人
    .mob 碎石怪斥候
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
    .aura 408828 >>|cRXP_WARN_先将敌人打至低生命值，再施放|r |T135963:0|t[制裁之锤] |cRXP_WARN_使其昏迷，并在昏迷期间击杀。重复10次即可获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意：必须选择能提供经验值的敌人，才能获得层数|r
    .mob 碎石怪击颅者
    .mob 碎石怪先知
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <16,1
    .xp >20,1
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
    .aura 408828 >>|cRXP_WARN_先将敌人打至低生命值，再施放|r |T135963:0|t[制裁之锤] |cRXP_WARN_使其昏迷，并在昏迷期间击杀。重复10次即可获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意：必须选择能提供经验值的敌人，才能获得层数|r
    .mob 碎石怪地卜师
    .mob 碎石怪掘地工
    .mob 狂暴穴居人
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <20,1
    .xp >22,1
step
    #completewith next
    .zone Wetlands >> 前往湿地
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
    .aura 408828 >>|cRXP_WARN_先将敌人打至低生命值，再施放|r |T135963:0|t[制裁之锤] |cRXP_WARN_使其昏迷，并在昏迷期间击杀。重复10次即可获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意：必须选择能提供经验值的敌人，才能获得层数|r
    .mob 湿地鳄鱼幼崽
    .mob 沼泽定居者
    .mob 蓝腮鱼人
    .mob 蓝腮强盗
    .mob 蓝腮污水鱼人
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <22,1
step
    .cast 421508 >>|cRXP_WARN_使用|r |T134916:0|t|cRXP_LOOT_[公正圣契]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 清算之手]
    .aura -408828
    .use 208851
    .train 410001,1
    .xp <8,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Hand of Reckoning - 20 (Westfall)
#title 清算之手
#next Aura Mastery - 24 (Duskwood)
#displayname 清算之手 - 20（西部荒野）
step
    +|cRXP_WARN_建议至少达到20级，再独自在西部荒野获取|r|T133816:0|t[铭刻手套 - 清算之手]|cRXP_WARN_符文|r
    >>|cRXP_WARN_必须至少 8 级才能装备|r |T134916:0|t|cRXP_LOOT_[公正圣契]|r
    >>|cRXP_WARN_需要先提升等级才能尝试获取|r |T133816:0|t[铭刻手套 - 清算之手]
    .train 410001,1
    .xp >8,1
step
    +|cRXP_WARN_建议至少达到20级，再独自在西部荒野获取|r|T133816:0|t[铭刻手套 - 清算之手]|cRXP_WARN_符文|r
-- >>|cRXP_WARN_It is heavily recommended you get it in Loch Modan instead as it is a LOT easier and can be acquired at a lower level|r
    .train 410001,1
    .xp <8,1
    .xp >20,1
step << skip
    #completewith LibramS
    +|cRXP_WARN_强烈建议改在洛克莫丹获取 |T133816:0|t[铭刻手套 - 清算之手], 那里容易得多|r
    .train 410001,1
    .xp <20,1
step
    #completewith next
    .zone Stormwind City >>前往暴风城
    .train 410001,1
    .xp <8,1
step
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 853 >> 学习 |T135963:0|t[制裁之锤]
    .target 虔诚的亚瑟
    .train 410001,1
    .xp <8,1
step
    #completewith next
    .zone Westfall >> 前往西部荒野
    .train 410001,1
    .xp <8,1
step
    #label LibramS
    .goto Westfall,69.71,73.41,30,0
    .goto Westfall,70.96,73.08,30,0
    .goto Duskwood,12.17,74.76,30,0
    .goto Westfall,70.96,73.08
    >>击杀 |cRXP_ENEMY_迪菲亚苦工|r, 拾取 |T134916:0|t|cRXP_LOOT_[公正圣契]|r
    >>|cRXP_WARN_|cRXP_ENEMY_迪菲亚苦工|r 以两人小队巡逻, 要小心|r
    >>|cRXP_WARN_避开 |cRXP_ENEMY_丑陋的迪菲亚懒汉|r, 他伤害极高|r
    .collect 208851,1 --Libram of Justice (1)
    .mob 迪菲亚苦工
    .train 410001,1
    .xp <8,1
--XX Venture Co. Drones drop it too?
step
    .equip 18,208851 >> |cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[公正圣契]|r
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
    .aura 408828 >>|cRXP_WARN_先将敌人打至低血量，再对其施放|r |T135963:0|t[制裁之锤] |cRXP_WARN_，在其昏迷期间击杀；如此重复10次，以获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益|r
    .mob 矮小的河爪豺狼人
    .mob 河爪豺狼人前锋
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
    .aura 408828 >>|cRXP_WARN_先将敌人打至低血量，再对其施放|r |T135963:0|t[制裁之锤] |cRXP_WARN_，在其昏迷期间击杀；如此重复10次，以获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益|r
    .mob 巨型血牙野猪
    .mob 收割傀儡
    .mob 大碎尸鸟
    .mob 迪菲亚拳匪
    .mob 迪菲亚路霸
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
    .aura 408828 >>|cRXP_WARN_先将敌人打至低血量，再对其施放|r |T135963:0|t[制裁之锤] |cRXP_WARN_，在其昏迷期间击杀；如此重复10次，以获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益|r
    .mob 结网毒蜘蛛
    .mob 小型结网毒蜘蛛
    .mob 饥饿的恐狼
    .mob 疯狂的恐狼
    .mob 绿色独行蛛
    .itemStat 18,QUALITY,2
    .train 410001,1
    .xp <22,1
step
    .cast 421508 >>|cRXP_WARN_使用|r |T134916:0|t|cRXP_LOOT_[公正圣契]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 清算之手]
    .aura -408828
    .use 208851
    .train 410001,1
    .xp <8,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Hallowed Ground - 4 (Loch Modan)
#title 神圣之地
#next Hand of Reckoning - 14 (Loch Modan)
#displayname 神圣之地 - 4（洛克莫丹）
step
    +|cRXP_WARN_必须至少达到4级才能获取|r |T133815:0|t[铭刻胸甲 - 神圣之地] |cRXP_WARN_，因为这是学习|r |T135906:0|t[力量祝福] 的等级要求
    >>|cRXP_WARN_尝试获取|r|T133815:0|t[铭刻胸甲 - 神圣之地]之前，需要先继续升级
--  >>|cRXP_WARN_It is NOT recommended to use|r |T133815:0|t[Engrave Chest - Hallowed Ground] |cRXP_WARN_over|r |T133815:0|t[Engrave Chest - Divine Storm] |cRXP_WARN_or|r |T133815:0|t[Engrave Chest - Seal of Martyrdom]
    .train 425618,1
    .xp >4,1
step
    #completewith next
    .zone Ironforge >>前往铁炉堡
    .train 425618,1
    .xp <4,1
step
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布兰度尔·铁锤|r
    .train 19740 >> 学习|T135906:0|t[力量祝福]
    .target 布兰度尔·铁锤
    .train 425618,1
    .xp <4,1
step
    #completewith next
    #label Loch1
    .zone Loch Modan >> 前往洛克莫丹
    .train 425618,1
    .xp <4,1
step
    #completewith LibramLoot
    #requires Loch1
    #label Inn1
    .goto Loch Modan,35.26,47.76,10 >>进入塞尔萨玛旅店
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
    .goto Loch Modan,35.80,49.57,8 >>前往|T134916:0|t|cRXP_LOOT_[祝福圣契]|r处
    .train 425618,1
    .xp <4,1
step
#label LibramLoot
    .goto Loch Modan,35.80,49.57
    >>拾取桌上的|T134916:0|t|cRXP_LOOT_[祝福圣契]|r
    .collect 208849,1 --Libram of Blessings (1)
    .train 425618,1
    .xp <4,1
step
    .equip 18,208849 >> |cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[祝福圣契]|r
    .use 208849
    .itemcount 208849,1 --Libram of Blessings (1)
    .train 425618,1
    .xp <4,1
step
    .goto Loch Modan,34.90,47.80
    .aura 408828 >>|cRXP_WARN_施放|r |T135906:0|t[力量祝福] |cRXP_WARN_或|r |T135970:0|t[智慧祝福] |cRXP_WARN_，为5名不同的友方玩家（包括自己）添加祝福，以获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益|r
    .itemStat 18,QUALITY,2
    .train 425618,1
    .xp <14,1
--XX Doesn't work on NPCs
step
    .goto Loch Modan,34.90,47.80
    .aura 408828 >>|cRXP_WARN_施放|r |T135906:0|t[力量祝福] |cRXP_WARN_，为5名不同的友方玩家（包括自己）添加祝福，以获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益|r
    .itemStat 18,QUALITY,2
    .train 425618,1
    .xp >14,1
    .xp <4,1
step
    .cast 421508 >>|cRXP_WARN_使用|r|T134916:0|t[祝福圣契]|cRXP_WARN_学习|r|T133815:0|t[铭刻胸甲 - 神圣之地]
    .aura -408828
    .use 208849
    .train 425618,1
    .xp <4,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Horn of Lordaeron - 12 (Westfall)
#title 神圣之地
#next Hand of Reckoning - 20 (Westfall)
#displayname 神圣之地 - 12（西部荒野）
step
    +|cRXP_WARN_建议至少达到12级，再尝试独自在西部荒野获取|r|T133815:0|t[铭刻胸甲 - 神圣之地]|cRXP_WARN_符文|r
    >>|cRXP_WARN_必须至少达到4级，因为这是学习|r|T135906:0|t[力量祝福]的等级要求
    >>|cRXP_WARN_需要先提升等级才能尝试获取|r|T133815:0|t[铭刻胸甲 - 神圣之地]
--  >>|cRXP_WARN_It is NOT recommended to use|r |T133815:0|t[Engrave Chest - Horn of Lordaeron] |cRXP_WARN_over|r |T133815:0|t[Engrave Chest - Divine Storm] |cRXP_WARN_or|r |T133815:0|t[Engrave Chest - Seal of Martyrdom]
    .train 425618,1
    .xp >4,1
step
    +|cRXP_WARN_建议至少达到12级，再尝试独自在西部荒野获取|r|T133815:0|t[铭刻胸甲 - 神圣之地]|cRXP_WARN_符文|r
--  >>|cRXP_WARN_It is heavily recommended you get it in Loch Modan instead as it is a LOT easier|r
--  >>|cRXP_WARN_It is NOT recommended to use|r |T133815:0|t[Engrave Chest - Horn of Lordaeron] |cRXP_WARN_over|r |T133815:0|t[Engrave Chest - Divine Storm] |cRXP_WARN_or|r |T133815:0|t[Engrave Chest - Seal of Martyrdom]
    .train 425618,1
    .xp <4,1
    .xp >12,1
step
    #completewith next
    .zone Stormwind City >>前往暴风城
    .train 425618,1
    .xp <4,1
step
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 20271 >> 学习|T135959:0|t[审判]
    .train 19740 >> 学习|T135906:0|t[力量祝福]
    .target 虔诚的亚瑟
    .train 425618,1
    .xp <4,1
step << skip
    #completewith next
    >>|cRXP_WARN_强烈建议改在洛克莫丹获取|r|T134229:0|t[论述：洛丹伦号角]|cRXP_WARN_，那里容易得多|r
    >>|cRXP_WARN_不建议用|r|T134229:0|t[论述：洛丹伦号角]|cRXP_WARN_替代|r|T236250:0|t[神圣风暴符文]|cRXP_WARN_或|r|T133745:0|t[论述：殉道]
    .train 425618,1
    .xp <12,1
step
    #completewith next
    .zone Westfall >>前往西部荒野
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
    >>|cRXP_WARN_攻击|cRXP_ENEMY_不死的劳工|r。它倒地后用|r|T135920:0|t[神圣伤害]|cRXP_WARN_将其彻底击杀，例如|r|T135959:0|t[审判]|cRXP_WARN_（必须在10秒内完成），然后拾取|r|T134916:0|t|cRXP_LOOT_[祝福圣契]|r
    >>|cRXP_WARN_|cRXP_ENEMY_不死的劳工|r显示为精英，但生命值和伤害与普通怪物相同|r
    >>|cRXP_WARN_|cRXP_ENEMY_不死的劳工|r在金海岸矿洞和詹戈洛德矿洞各处都有共享刷新点。在一处找不到时，可去另一处寻找|r
    .collect 208849,1 --Libram of Blessings (1)
    .unitscan 不死的劳工
    .train 425618,1
    .xp <4,1
step
    .equip 18,208849 >> |cRXP_WARN_装备|r|T134916:0|t|cRXP_LOOT_[祝福圣契]|r
    .use 208849
    .itemcount 208849,1 --Libram of Blessings (1)
    .train 425618,1
    .xp <4,1
step
    .goto Westfall,56.09,47.67,20,0
    .goto Westfall,56.55,52.64
    .aura 408828 >>|cRXP_WARN_施放|r|T135906:0|t[力量祝福]|cRXP_WARN_或|r|T135970:0|t[智慧祝福]|cRXP_WARN_，为5名不同的友方玩家（包括自己）添加祝福，以获得|r|T136116:0|t[灵感勃发]|cRXP_WARN_增益|r
    .itemStat 18,QUALITY,2
    .train 425618,1
    .xp <14,1
--XX Doesn't work on NPCs
step
    .goto Westfall,56.09,47.67,20,0
    .goto Westfall,56.55,52.64
    .aura 408828 >>|cRXP_WARN_施放|r|T135906:0|t[力量祝福]|cRXP_WARN_，为5名不同的友方玩家（包括自己）添加祝福，以获得|r|T136116:0|t[灵感勃发]|cRXP_WARN_增益|r
    .itemStat 18,QUALITY,2
    .train 425618,1
    .xp <4,1
    .xp >14,1
step
    .cast 421508 >>|cRXP_WARN_使用|r|T134916:0|t|cRXP_LOOT_[祝福圣契]|r|cRXP_WARN_学习|r|T133815:0|t[铭刻胸甲 - 神圣之地]
    .use 208849
    .aura -408828
    .train 425618,1
    .xp <4,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Aegis - 8 (Elwynn Forest)
#title 神盾
#next Rebuke - 10 (Stormwind)
#displayname 神盾 - 8（艾尔文森林）
step
    +|cRXP_WARN_必须至少达到8级才能获取|r |T133815:0|t[铭刻胸甲 - 神盾] |cRXP_WARN_，因为这是学习|r |T135949:0|t[纯净术] 的等级要求
    >>|cRXP_WARN_需要先提升等级才能尝试获取|r |T133815:0|t[铭刻胸甲 - 神盾]
    .train 425619,1
    .xp >8,1
step
    #completewith next
    .zone Stormwind City >>前往暴风城
    .train 425619,1
    .xp <8,1
step
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 1152 >> 学习|T135949:0|t[纯净术]
    .target 虔诚的亚瑟
    .train 425619,1
    .xp <8,1
step
    #completewith next
    #label Elwynn1
    .zone Elwynn Forest >> 前往艾尔文森林
    .train 425619,1
    .xp <8,1
step
    #completewith next
    #requires Elwynn1
    #label Cave1
    .goto Elwynn Forest,61.59,53.51,15 >>进入玉石矿洞
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
    .goto Elwynn Forest,61.97,47.31,12 >> 前往洞穴内地面上的 |cRXP_FRIENDLY_受伤的冒险者|r
    .target 受伤的冒险者
    .train 425619,1
    .xp <8,1
--XX no completewith next so people don't brick it by casting Purify accidentally
step
    #completewith next
    .goto Elwynn Forest,61.97,47.31
    .cast 1152 >>|cRXP_WARN_施放|r |T135949:0|t[纯净术] |cRXP_WARN_，目标为|r |cRXP_FRIENDLY_受伤的冒险者|r
    .target 受伤的冒险者
    .train 425619,1
    .xp <8,1
step
    .goto Elwynn Forest,61.97,47.31
    >>|cRXP_WARN_与|cRXP_FRIENDLY_受伤的冒险者|r交谈；须已对他施放|r |T135949:0|t[纯净术]，|cRXP_WARN_即可领取|r |T134419:0|t[神盾符文]
    .collect 205685,1 --Rune of Aegis (1)
    .target 受伤的冒险者
    .skipgossip
    .train 425619,1
    .xp <8,1
--XX gossipoption 109556
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[神盾符文] |cRXP_WARN_学习|r |T133815:0|t[铭刻胸甲 - 神盾]
    .use 205685
    .itemcount 205685,1 --Rune of Aegis (1)
    .train 425619,1
    .xp <8,1
--XX cast 425589
--XX Rune acquirable if someone else purifies him for you?
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Aegis - 8 (Dun Morogh)
#title 神盾
#next Rebuke - 10 (Ironforge)
#displayname 神盾 - 8（丹莫罗）
step
    +|cRXP_WARN_必须至少达到8级才能获取|r |T133815:0|t[铭刻胸甲 - 神盾] |cRXP_WARN_，因为这是学习|r |T135949:0|t[纯净术] 的等级要求
    >>|cRXP_WARN_需要先提升等级才能尝试获取|r |T133815:0|t[铭刻胸甲 - 神盾]
    .train 425619,1
    .xp >8,1
step
    #completewith next
    .zone Ironforge >>前往铁炉堡
    .train 425619,1
    .xp <8,1
step
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布兰度尔·铁锤|r
    .train 1152 >> 学习 |T135949:0|t[纯净术]
    .target 布兰度尔·铁锤
    .train 425619,1
    .xp <8,1
step
    #completewith next
    .zone Dun Morogh >> 前往: 丹莫罗
    .train 425619,1
    .xp <8,1
step
    #label LibramS
    .goto Dun Morogh,25.57,43.37,40 >> 前往地面上的 |cRXP_FRIENDLY_受伤的冒险者|r
    .target 受伤的冒险者
    .train 425619,1
    .xp <8,1
step
    #completewith next
    .goto Dun Morogh,25.57,43.37
    .cast 1152 >>|cRXP_WARN_施放|r |T135949:0|t[纯净术] |cRXP_WARN_，目标为|r |cRXP_FRIENDLY_受伤的冒险者|r
    .target 受伤的冒险者
    .train 425619,1
    .xp <8,1
step
    .goto Dun Morogh,25.57,43.37
    >>|cRXP_WARN_对|cRXP_FRIENDLY_受伤的冒险者|r施放|r |T135949:0|t[纯净术] |cRXP_WARN_后，与他交谈，领取|r |T134419:0|t[神盾符文]
    .collect 205685,1 --Rune of Aegis (1)
    .target 受伤的冒险者
    .skipgossip
    .train 425619,1
    .xp <8,1
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[神盾符文] |cRXP_WARN_学习|r |T133815:0|t[铭刻胸甲 - 神盾]
    .use 205685
    .itemcount 205685,1 --Rune of Aegis (1)
    .train 425619,1
    .xp <8,1
--XX Rune acquirable if someone else purifies him for you?
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Cloak
#subgroupdisplayname 披风
#name Divine Light - 10 (Stormwind)
#title 神圣之光
#next Horn of Lordaeron - 12 (Westfall)
#displayname 神圣之光 - 10（暴风城）
step
    #completewith LibramS
    +|cRXP_WARN_建议至少达到10级再获取|r |T133815:0|t[铭刻披风 - 神圣之光] |cRXP_WARN_，以便在暴风城独自完成|r
    .train 410015,1
    .xp >10,1
step
    #completewith next
    #label Stormwind1
    .zone Stormwind City >>前往暴风城
    .train 410015,1
step
    #completewith next
    #requires Stormwind1
    #label LibramS
    .goto StormwindClassic,42.77,34.32,10,0
    .goto StormwindClassic,41.37,31.53,10,0
    .goto StormwindClassic,38.10,28.10,12 >>前往大教堂内的 |cRXP_FRIENDLY_罗姆鲁斯修士|r
    .train 410015,1
step
    .goto StormwindClassic,38.10,28.10
    .gossipoption 109653 >>与|cRXP_FRIENDLY_罗姆鲁斯修士|r交谈
    .target 罗姆鲁斯修士
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
    >>下楼进入大教堂地下墓穴的西侧
    .goto StormwindClassic,32.86,24.77,8 >>前往墓穴中的 |cRXP_LOOT_烧焦的笔记|r 方向
    .train 410015,1
step
    .goto StormwindClassic,32.86,24.87
    >>拾取蜡烛旁的 |cRXP_LOOT_烧焦的笔记|r
    .collect 205864,1 --Charred Note (1)
    .train 410015,1
step
    #completewith next
    #label Island
    .goto Duskwood,4.33,28.26,50 >>前往岛上的 |cRXP_FRIENDLY_艾达·盖尔哈特|r
    .train 410015,1
step
    #completewith next
    .goto Duskwood,4.33,28.26
    .gossipoption 109610 >>与|cRXP_FRIENDLY_艾达·盖尔哈特|r交谈以开始战斗
    .target 艾达·盖尔哈特
    .skipgossip 205153,1
    .train 410015,1
--XX 109612 "As one candle is snuffed out, another is lit"
--XX 109611 "I've been sent by brother Romulus. Please, Ada, return with me to the Cathedral of Light"
--XX 109610 "I see. I'm sorry it has come to this, sister. (Fight Ada)"
step
    #requires Island
    .goto Duskwood,4.33,28.26
    >>击败 |cRXP_ENEMY_艾达·盖尔哈特|r
    >>|cRXP_WARN_记得在开战前施放|r |T135924:0|t[十字军圣印] |cRXP_WARN_再与她交战|r
    >>|cRXP_WARN_注意她会施放|r |T136197:0|t[暗影震击] |cRXP_WARN_（立即造成45点暗影伤害，消耗她75点法力值。尽快击杀她，让她最多只能施放3次）|r
    >>|cRXP_WARN_在击败 |cRXP_ENEMY_艾达·盖尔哈特|r 后:|r
    >>再次与 |cRXP_FRIENDLY_艾达·盖尔哈特|r 交谈, 获取 |T134419:0|t[神圣之光符文]
    .collect 205897,1 --Rune of Divine Light (1)
    .target 艾达·盖尔哈特
    .skipgossip 205153,1
    .train 410015,1
--XX Must have had the Charred Note to unlock the dialogue
step
    #sticky
    .destroy 205864 >> 从背包中删除 |T134939:0|t[烧焦的笔记], 已不再需要
step
    .train 410015 >>|cRXP_WARN_使用|r |T134419:0|t[神圣之光符文] |cRXP_WARN_学习|r |T133815:0|t[铭刻披风 - 神圣之光]
    .use 205897
    .itemcount 205897,1 --Rune of Divine Light (1)
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Divine Storm - 25 (Darkshore)
#title 神圣风暴
#next Grizzby Runes
#displayname 神圣风暴 - 25（黑海岸）
step
    #completewith LibramS
    +|cRXP_WARN_建议至少达到 25 级再获取|r |T133815:0|t[铭刻胸甲 - 神圣风暴] |cRXP_WARN_，并找至少 2 名其他 25 级圣骑士一同完成|r
    .train 410014,1
--  .xp >25,1
step
    #completewith LibramS
    #label DarkshoreT
    .zone Darkshore >> 前往黑海岸
    .train 410014,1
step
    #completewith next
    #requires DarkshoreT
    .goto Darkshore,56.49,26.44,10 >>前往奥萨拉克斯之塔
    .train 410014,1
step
    #label LibramS
    .goto Darkshore,56.20,26.46
    >>打开奥萨拉克斯塔顶桌子上的 |cRXP_PICK_奇异之球|r, 拾取 |cRXP_LOOT_奥萨拉克斯宝珠|r
    >>|cRXP_WARN_注意, 此塔中的怪物难度较高 (28-31 级)|r
    >>|cRXP_WARN_小心 |cRXP_ENEMY_暗滩唤魔师|r 会施放|r |T136197:0|t[暗影箭] |cRXP_WARN_（远程读条，约175点暗影伤害）。尽量利用障碍物卡视线躲避|r
    .collect 209836,1,78089,1 --Athalaxx Orb (1)
    .train 410014,1
step
    #completewith Delgren1
    #label AshenvaleT1
    .zone Ashenvale >> 前往灰谷
    .train 410014,1
step
    #completewith next
    #requires AshenvaleT1
    .goto Ashenvale,26.19,38.69,10 >>前往 |cRXP_FRIENDLY_净化者德尔格伦|r
    .train 410014,1
step
    .goto Ashenvale,26.19,38.69
    >>与|cRXP_FRIENDLY_净化者德尔格伦|r 对话
    .accept 78088 >>接任务：奇怪的神器
    .turnin 78088 >> 交任务：奇怪的神器
    .accept 78089 >> 接任务：暴风城的建议
    .target 净化者德尔格伦
    .train 410014,1
    .itemcount 209836,1 --Athalaxx Orb (1)
step
    #label Delgren1
    .goto Ashenvale,26.19,38.69
    >>与|cRXP_FRIENDLY_净化者德尔格伦|r 对话
    .accept 78089 >> 接任务：暴风城的建议
    .target 净化者德尔格伦
    .train 410014,1
    .isQuestTurnedIn 78088
step
    #completewith Katherine1
    #label StormwindT1
    .zone Stormwind City >> 前往暴风城
    .train 410014,1
step
    #completewith next
    #requires StormwindT1
    .goto StormwindClassic,42.77,34.32,10,0
    .goto StormwindClassic,41.37,31.53,10,0
    .goto StormwindClassic,39.19,31.03,10,0
    .goto StormwindClassic,37.23,31.87,12 >>前往大教堂内, 找到 |cRXP_FRIENDLY_纯洁的凯瑟琳|r
    .train 410014,1
step
    #label Katherine1
    .goto StormwindClassic,37.23,31.87
    >>与|cRXP_FRIENDLY_纯洁的凯瑟琳|r 对话
    .turnin 78089 >> 交任务：暴风城的建议
    .accept 78090 >> 接任务：第二意见
    .target 纯洁的凯瑟琳
    .train 410014,1
step
    #completewith next
    .goto StormwindClassic,29.04,74.28,10,0
    .goto StormwindClassic,27.40,76.48,10,0
    .goto StormwindClassic,27.14,77.83,5,0
    .goto StormwindClassic,26.12,77.23,8 >>前往屠羊酒馆内找 |cRXP_FRIENDLY_厄苏拉·德林|r
    .train 410014,1
step
    .goto StormwindClassic,26.12,77.23
    >>与|cRXP_FRIENDLY_厄苏拉·德林|r 对话
    .turnin 78090 >> 交任务：第二意见
    .accept 78091 >> 接任务：收集召唤师之盐
    .target 厄苏拉·德林
    .train 410014,1
step
    #completewith theairissalt
    .goto StormwindClassic,66.28,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 对话
    .fly Redridge >> 飞往赤脊山
    .zoneskip Redridge Mountains
    .target 杜加尔·朗德瑞克
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
    >>|cRXP_WARN_若还没学会|r |T134596:0|t[铭刻裤子 - 复仇者之盾] |cRXP_WARN_现在获取很值得；不想做可跳过本步|r
    >>击杀 |cRXP_ENEMY_亵渎者多赞姆|r, 拾取 |T134419:0|t[复仇者符文]|r
    >>|cRXP_WARN_他有 3 个刷新点: 东南 (撕裂者山谷)、中部 (石堡要塞哨塔外的营地) 和北部 (撕裂者营地). 虽是稀有怪但刷新较快|r
    >>|cRXP_WARN_在综合频道 (输入 /1) 询问是否有人见过他, 可缩短搜索时间|r
    .collect 211488,1 --Rune of the Avenger (1)
    .unitscan 亵渎者多赞姆
    .train 410008,1
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[复仇者符文] |cRXP_WARN_学习|r |T134596:0|t[铭刻裤子 - 复仇者之盾]
    .use 211488
    .itemcount 211488,1 --Rune of the Avenger (1)
    .train 410008,1
step
.isOnQuest 78091
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
    >>击杀 |cRXP_ENEMY_黑石召唤师|r、|cRXP_ENEMY_黑石勇士|r 和 |cRXP_ENEMY_黑石追踪者|r, 搜刮 |cRXP_LOOT_召唤师之盐|r
    >>|cRXP_WARN_|cRXP_LOOT_召唤师之盐|r 按个人分配 (每只怪物对队伍中每位玩家都有独立的掉落机会), 可轻松组队完成|r
    .complete 78091,1 --Summoner's Salt (14)
    .mob 黑石召唤师
    .mob 黑石勇士
    .mob 黑石追踪者
    .train 410014,1
step
    #completewith Ursula1
    #label StormwindT2
    .zone Stormwind City >> 前往暴风城
    .train 410014,1
step
    #completewith next
    #requires StormwindT2
    .goto StormwindClassic,29.04,74.28,10,0
    .goto StormwindClassic,27.40,76.48,10,0
    .goto StormwindClassic,27.14,77.83,5,0
    .goto StormwindClassic,26.12,77.23,8 >>前往屠羊酒馆内找 |cRXP_FRIENDLY_厄苏拉·德林|r
    .train 410014,1
step
    #label Ursula1
    .goto StormwindClassic,26.12,77.23
    >>与|cRXP_FRIENDLY_厄苏拉·德林|r 对话
    .turnin 78091 >> 交任务：收集召唤师之盐
    .accept 78092 >> 接任务：必毁无疑
    .target 厄苏拉·德林
    .train 410014,1
step
    #completewith Motes
    #label AshenvaleT2
    .zone Ashenvale >> 前往灰谷
    .train 410014,1
step
    #completewith next
    #requires AshenvaleT2
    .goto Ashenvale,84.12,72.10,200 >>前往屠魔峡谷
    .train 410014,1
step
.isOnQuest 78092
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
    >>击杀 |cRXP_ENEMY_灼热的地狱火|r、|cRXP_ENEMY_恶魔守卫|r、|cRXP_ENEMY_玛诺洛克鞭笞者|r 和 |cRXP_ENEMY_恶魔指挥官|r, 搜刮 |cRXP_LOOT_玛诺洛斯微粒|r
    >>|cRXP_WARN_|cRXP_LOOT_玛诺洛斯微粒|r 按个人分配 (每只怪物对队伍中每位玩家都有独立的掉落机会), 可轻松组队完成|r
    >>|cRXP_WARN_小心 |cRXP_ENEMY_灼热的地狱火|r 具有|r |T135802:0|t[献祭光环] |cRXP_WARN_（被动近战群伤，造成27–28点火焰伤害，每3秒一次）；|cRXP_ENEMY_恶魔守卫|r 会施放|r |T132154:0|t[击倒] |cRXP_WARN_（近战瞬发，约140点伤害并使你昏迷2秒）；|cRXP_ENEMY_玛诺洛克鞭笞者|r 会施放|r |T135817:0|t[火焰之鞭] |cRXP_WARN_（远程瞬发，约45点火焰伤害，随后造成12–13点火焰伤害，每3秒一次，持续21秒）和|r |T136197:0|t[暗影箭] |cRXP_WARN_（远程读条，约125点暗影伤害）|r
    .complete 78092,1 --Mote of Mannoroth (12)
    .mob 灼热的地狱火
    .mob 恶魔守卫
    .mob 玛诺洛克鞭笞者
    .mob 恶魔指挥官
    .train 410014,1
step
    >>点击空中的 |cRXP_PICK_玛诺洛斯之矛|r，然后点击地上的 |cRXP_PICK_碎裂的宝珠|r
    .turnin 78092 >> 交任务：必毁无疑
    .goto Ashenvale,89.48,77.03
    .accept 78093 >> 接任务：返回德尔格伦
    .goto Ashenvale,89.44,77.01
    .train 410014,1
step
    #completewith next
    .goto Ashenvale,26.19,38.69,10 >>前往 |cRXP_FRIENDLY_净化者德尔格伦|r
    .train 410014,1
step
    .goto Ashenvale,26.19,38.69
    >>与|cRXP_FRIENDLY_净化者德尔格伦|r 对话
    .turnin 78093 >> 交任务：返回德尔格伦
    .train 410014 >> 你将学会 |T133815:0|t[铭刻胸甲 - 神圣风暴]
    .target 净化者德尔格伦
    .train 410014,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Inspiration Exemplar - 6 (Elwynn Forest)
#title 激励典范
#next Aegis - 8 (Elwynn Forest)
#displayname 激励典范 - 6（艾尔文森林）
step
    #completewith LibramS
    +|cRXP_WARN_你应至少达到6级，才能与另一名玩家在艾尔文森林获取|r |T134596:0|t[铭刻裤子 - 激励典范] |cRXP_WARN_符文|r
    .train 410011,1
    .xp >6,1
step
    #completewith next
    #label Elwynn1
    .zone Elwynn Forest >> 前往艾尔文森林
    .train 410011,1
step
    #completewith next
    #requires Elwynn1
    .goto Elwynn Forest,52.28,84.56,40 >>前往 |cRXP_FRIENDLY_冒险者的残骸|r 所在处
    .train 410011,1
step
    #label LibramS
    .goto Elwynn Forest,52.28,84.56
    >>|cRXP_WARN_与站在 |cRXP_FRIENDLY_冒险者的残骸|r 旁的另一名圣骑士、牧师或德鲁伊组队，或在综合频道寻找圣骑士、牧师或德鲁伊帮忙（在聊天框输入 /1）|r
    >>|cRXP_WARN_与地面上的 |cRXP_FRIENDLY_冒险者的残骸|r 交谈以开始仪式，或者点击其他玩家的|r |T136223:0|t[灵魂仪式] |cRXP_WARN_（须在对方队伍中）|r
    >>|cRXP_WARN_仪式完成后，会出现一位 |cRXP_FRIENDLY_冒险者之灵|r，随后死亡。拾取其掉落的|r |T134419:0|t|cRXP_LOOT_[激励符文]|r
    .collect 206264,1 --Rune of Inspiration (1)
    .target 冒险者的残骸
    .target 冒险者之灵
    .skipgossip
    .train 410011,1
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[激励符文]|r |cRXP_WARN_学习|r |T134596:0|t[铭刻裤子 - 激励典范]
    .use 206264
    .itemcount 206264,1 --Rune of Inspiration (1)
    .train 410011,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Inspiration Exemplar - 6 (Dun Morogh)
#title 激励典范
#next Aegis - 8 (Dun Morogh)
#displayname 激励典范 - 6（丹莫罗）
step
    #completewith LibramS
    +|cRXP_WARN_你应至少达到6级，才能与另一名玩家一起在丹莫罗获取|r |T134596:0|t[铭刻裤子 - 激励典范] |cRXP_WARN_|r
    .train 410011,1
    .xp >6,1
step
    #completewith LibramS
    #label Dun1
    .zone Dun Morogh >> 前往丹莫罗
    .train 410011,1
step
    #completewith next
    #requires Dun1
    #label Cave1
    .goto Dun Morogh,42.47,54.22,20,0
    .goto Dun Morogh,42.28,52.82,20 >>进入灰色洞穴
    .train 410011,1
step
    #completewith next
    #label LibramS
    #requires Cave1
    .goto Dun Morogh,42.06,51.86,20,0
    .goto Dun Morogh,41.42,50.97,20,0
    .goto Dun Morogh,41.24,50.28,20,0
    .goto Dun Morogh,41.25,49.68,20,0
    .goto Dun Morogh,43.03,49.63,20 >>前往洞穴内地面上的|cRXP_FRIENDLY_冒险者的残骸|r处
    .train 410011,1
step
    .goto Dun Morogh,43.03,49.63
    >>|cRXP_WARN_与站在|cRXP_FRIENDLY_冒险者的残骸|r旁的另一名圣骑士、牧师或德鲁伊组队，或在综合聊天频道寻求圣骑士、牧师或德鲁伊的帮助（在聊天框输入 /1）|r
    >>|cRXP_WARN_与地面上的 |cRXP_FRIENDLY_冒险者的残骸|r 交谈以开始仪式，或者点击其他玩家的|r |T136223:0|t[灵魂仪式] |cRXP_WARN_（须在对方队伍中）|r
    >>|cRXP_WARN_完成仪式后会出现一名|cRXP_FRIENDLY_冒险者之灵|r并死去。拾取其掉落的|r |T134419:0|t|cRXP_LOOT_[激励符文]|r
    .collect 206264,1 --Rune of Inspiration (1)
    .target 冒险者的残骸
    .target 冒险者之灵
    .skipgossip
    .train 410011,1
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[激励符文]|r |cRXP_WARN_学习|r |T134596:0|t[铭刻裤子 - 激励典范]
    .use 206264
    .itemcount 206264,1 --Rune of Inspiration (1)
    .train 410011,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Rebuke - 10 (Ironforge)
#title 责难
#next Divine Light - 10 (Stormwind)
#displayname 责难 - 10（铁炉堡）
step
    #completewith LibramS
    +|cRXP_WARN_至少达到10级，才能独自在铁炉堡获取|r |T134596:0|t[铭刻裤子 - 责难] |cRXP_WARN_符文|r
    .train 425621,1
    .xp >10,1
step
    #completewith next
    #label Ironforge1
    .zone Ironforge >>前往铁炉堡
    .train 425621,1
step
    #completewith next
    #requires Ironforge1
    #label LibramS
    .goto Ironforge,71.54,73.46,10,0
    .goto Ironforge,72.53,76.94,10 >>前往旅店内的|cRXP_FRIENDLY_布鲁克·麦须|r处
    .train 425621,1
step
    .goto Ironforge,72.53,76.94
    .gossipoption 110791 >>与里面的|cRXP_FRIENDLY_布鲁克·麦须|r交谈
    .target 布鲁克·麦须
    .skipgossip 5570,1,1
    .train 425621,1
--XX 110793 "How's business?"
--XX 110791 "Sounds like you need someone to bounce him for you."
step
    .goto Ironforge,72.40,73.63
    .gossipoption 109084 >>与|cRXP_FRIENDLY_布鲁阿特|r交谈，开始战斗
    >>击败|cRXP_ENEMY_布鲁阿特|r
    >>|cRXP_WARN_小心他施放|r |T132939:0|t[反手一击] |cRXP_WARN_（使你昏迷2秒）|r
    >>|cRXP_WARN_记得在开战前施放|r |T135924:0|t[十字军圣印] |cRXP_WARN_再与他交战|r
    >>|cRXP_WARN_千万不要误将|r |T135906:0|t[力量祝福] |cRXP_WARN_施放到他身上|r
    >>|cRXP_WARN_将他风筝到楼上的阳台，再跳到旅店外；必要时施放|r |T135920:0|t[圣光术] |cRXP_WARN_恢复生命值|r
    .mob 布鲁阿特
    .skipgossip 209004,1
    .train 425621,1
--XX 109084 "Seems you've had a few too many"
--XX Check if another player can skip the "how's business" dialogue for you (paladin, warrior)
step
    .goto Ironforge,72.40,73.63,-1
    .goto Ironforge,72.53,76.94,-1
    >>击败|cRXP_ENEMY_布鲁阿特|r
    >>|cRXP_WARN_小心他施放|r |T132939:0|t[反手一击] |cRXP_WARN_（使你昏迷2秒）|r
    >>|cRXP_WARN_记得在开战前施放|r |T135924:0|t[十字军圣印] |cRXP_WARN_再与他交战|r
    >>|cRXP_WARN_千万不要误将|r |T135906:0|t[力量祝福] |cRXP_WARN_施放到他身上|r
    >>|cRXP_WARN_将他风筝到楼上的阳台，再跳到旅店外，必要时施放|r |T135920:0|t[圣光术] |cRXP_WARN_恢复生命值|r
    >>|cRXP_WARN_击败|cRXP_ENEMY_布鲁阿特|r后：|r
    >>再次与|cRXP_FRIENDLY_布鲁克·麦须|r交谈，领取|T134419:0|t[责难符文]
    >>|cRXP_WARN_如果他没给你|r |T134419:0|t[责难符文]|cRXP_WARN_，你可能需要再次与|cRXP_ENEMY_布鲁阿特|r战斗|r
    .collect 205683,1 --Rune of Rebuke (1)
    .target 布鲁克·麦须
    .skipgossip 5570,2,1
    .skipgossip 209004,1
    .train 425621,1
--XX 109539 "I've taken care of Stuart. He shouldn't be a problem anymore."
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[责难符文] |cRXP_WARN_学习|r |T134596:0|t[铭刻裤子 - 责难]
    .use 205683
    .itemcount 205683,1 --Rune of Rebuke (1)
    .train 425621,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Rebuke - 10 (Stormwind)
#title 责难
#next Divine Light - 10 (Stormwind)
#displayname 责难 - 10（暴风城）
step
    #completewith LibramS
    +|cRXP_WARN_建议至少达到10级，再获取|r |T134596:0|t[铭刻裤子 - 责难] |cRXP_WARN_（在暴风城独自完成）|r
    .train 425621,1
    .xp >10,1
step
    #completewith next
    #label Stormwind1
    .zone Stormwind City >>前往暴风城
    .train 425621,1
step
    #completewith next
    #requires Stormwind1
    #label LibramS
    .goto StormwindClassic,21.56,59.60,10,0
    .goto StormwindClassic,22.60,64.62,10 >>前往花园区旅店内的|cRXP_FRIENDLY_丽芙·布拉德弗|r处
    .train 425621,1
step
    .goto StormwindClassic,22.60,64.62
    .gossipoption 109047 >>与屋内的|cRXP_FRIENDLY_丽芙·布拉德弗|r交谈
    .target 丽芙·布拉德弗
    .skipgossip 203475,2,1
    .train 425621,1
--XX 109045 "How's business?"
--XX 109047 "Sounds like you need someone to bounce him for you."
--VV SKIPGOSSIP needs testing, if broken change to 1,1
step
    .goto StormwindClassic,21.21,62.78
    .gossipoption 109084 >>与|cRXP_FRIENDLY_斯图阿特|r交谈，开始战斗
    >>击败 |cRXP_ENEMY_斯图阿特|r
    >>|cRXP_WARN_小心他施放的|r |T132939:0|t[反手一击]，|cRXP_WARN_会使你昏迷2秒|r
    >>|cRXP_WARN_记得在开战前施放|r |T135924:0|t[十字军圣印] |cRXP_WARN_再与他交战|r
    >>|cRXP_WARN_千万不要误将|r |T135906:0|t[力量祝福] |cRXP_WARN_施放到他身上|r
    >>|cRXP_WARN_把他风筝到楼上，然后跳下来施放|r |T135920:0|t[圣光术] |cRXP_WARN_（如有需要）|r
    .mob 斯图阿特
    .skipgossip 203478,1
    .train 425621,1
--XX 109084 "Seems you've had a few too many"
--XX Check if another player can skip the "how's business" dialogue for you (paladin, warrior)
step
    .goto StormwindClassic,21.21,62.78,-1
    .goto StormwindClassic,22.60,64.62,-1
    >>击败 |cRXP_ENEMY_斯图阿特|r
    >>|cRXP_WARN_小心他施放的|r |T132939:0|t[反手一击]，|cRXP_WARN_会使你昏迷2秒|r
    >>|cRXP_WARN_记得在开战前施放|r |T135924:0|t[十字军圣印] |cRXP_WARN_再与他交战|r
    >>|cRXP_WARN_千万不要误将|r |T135906:0|t[力量祝福] |cRXP_WARN_施放到他身上|r
    >>|cRXP_WARN_把他风筝到楼上，然后跳下来施放|r |T135920:0|t[圣光术] |cRXP_WARN_（如有需要）|r
    >>|cRXP_WARN_击败|cRXP_ENEMY_斯图阿特|r后：|r
    >>再次与|cRXP_FRIENDLY_丽芙·布拉德弗|r交谈，领取|T134419:0|t[责难符文]
    >>|cRXP_WARN_如果她没有给你|r |T134419:0|t[责难符文]|cRXP_WARN_，可能需要再次与|cRXP_ENEMY_斯图阿特|r战斗|r
    .collect 205683,1 --Rune of Rebuke (1)
    .target 丽芙·布拉德弗
    .skipgossip 203478,1
    .skipgossip 203475,2,1
    .train 425621,1
--XX 109539 "I've taken care of Stuart. He shouldn't be a problem anymore."
--VV SKIPGOSSIP needs testing, if broken change to 1,1
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[责难符文] |cRXP_WARN_学习|r |T134596:0|t[铭刻裤子 - 责难]
    .use 205683
    .itemcount 205683,1 --Rune of Rebuke (1)
    .train 425621,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Aura Mastery - 24 (Duskwood)
#title 光环掌握
#next Waylaid Runes
#displayname 光环掌握 - 24（暮色森林）
step
    +|cRXP_WARN_你必须至少达到24级才能获取|r |T134596:0|t[铭刻裤子 - 光环掌握] |cRXP_WARN_，因为这是学习|r |T135983:0|t[超度亡灵]所需的等级
    >>|cRXP_WARN_需要先提升等级才能尝试获取|r |T134596:0|t[铭刻裤子 - 光环掌握]
    .train 416037,1
    .xp >24,1
step
    #completewith next
    .zone Stormwind City >>前往暴风城
    .train 416037,1
    .xp <24,1
step
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 879 >>学习|T135903:0|t[驱邪术]
    .train 2878 >> 学习|T135983:0|t[超度亡灵]
    .target 虔诚的亚瑟
    .train 416037,1
    .xp <24,1
step
    #completewith next
    .zone Duskwood >> 前往暮色森林
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
    >>击杀|cRXP_ENEMY_迪菲亚夜行者|r、|cRXP_ENEMY_迪菲亚夜贼|r和|cRXP_ENEMY_迪菲亚附魔师|r，拾取|T134916:0|t|cRXP_LOOT_[逐魔圣契]|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_迪菲亚夜行者|r和|cRXP_ENEMY_迪菲亚夜贼|r会施放|r |T136093:0|t[减速毒药] |cRXP_WARN_（移动速度降低35%，持续25秒）、|r |T132090:0|t[背刺] |cRXP_WARN_（从背后造成双倍伤害）。|cRXP_ENEMY_迪菲亚夜行者|r处于|r |T132320:0|t[潜行]|cRXP_WARN_状态；|cRXP_ENEMY_迪菲亚附魔师|r会施放|r |T135812:0|t[火球术] |cRXP_WARN_（造成约150点火焰伤害），并拥有|r |T135843:0|t[霜甲术] |cRXP_WARN_（被击中时使攻击者的攻击和移动速度降低）|r
    .collect 211472,1 -- Libram of Banishment (1)
    .mob 迪菲亚夜行者
    .mob 迪菲亚夜贼
    .mob 迪菲亚附魔师
    .train 416037,1
    .xp <24,1
step
    .equip 18,211472 >> |cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[逐魔圣契]|r
    .use 211472
    .itemcount 211472,1 -- Libram of Banishment (1)
    .train 416037,1
    .xp <24,1
step
.usespell 2878,879
>>若附近亡灵已变灰，请改选能提供经验值的亡灵
    #loop
    .goto Duskwood,22.49,47.91,50,0
    .goto Duskwood,20.41,47.56,50,0
    .goto Duskwood,14.65,47.37,50,0
    .goto Duskwood,16.31,44.96,50,0
    .goto Duskwood,22.95,40.55,50,0
    >>击杀|cRXP_ENEMY_骸骨魔|r和|cRXP_ENEMY_恐怖骸骨|r
    .aura 408828 >>|cRXP_WARN_先施放|r |T135983:0|t[超度亡灵] |cRXP_WARN_，再用|r |T135903:0|t[驱邪术] |cRXP_WARN_击杀，重复5次以获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益|r
    >>|cRXP_WARN_注意：必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob 骸骨魔
    .mob 恐怖骸骨
    .itemStat 18,QUALITY,2
    .train 416037,1
    .xp <24,1
step
    .cast 421508 >>|cRXP_WARN_使用|r |T134916:0|t|cRXP_LOOT_[逐魔圣契]|r |cRXP_WARN_学习|r |T134596:0|t[铭刻裤子 - 光环掌握]
    .use 211472
    .aura -408828
    .train 416037,1
    .xp <24,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Avenger's Shield - 25 (Redridge Mountains)
#title 复仇者之盾
#next Inspiration Exemplar - 6 (Elwynn Forest)
#displayname 复仇者之盾 - 25（赤脊山）
step
    +|cRXP_WARN_你应至少达到25级，才能在赤脊山独自获取|r |T134596:0|t[铭刻裤子 - 复仇者之盾] |cRXP_WARN_符文|r
    .train 410008,1
    .xp >25,1
step
    #completewith next
    .zone Redridge Mountains >> 前往赤脊山
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
    >>击杀 |cRXP_ENEMY_亵渎者多赞姆|r，拾取 |T134419:0|t[复仇者符文]|r
    >>|cRXP_WARN_他在室外有3个刷新点：东南部（撕裂者山谷）、中部（石堡哨塔外的营地）和北部（撕裂者营地）。虽然是稀有怪，但刷新很快|r
    >>|cRXP_WARN_在综合频道询问是否有人见过他，可缩短搜索时间（在聊天框输入 /1）|r
    .collect 211488,1 --Rune of the Avenger (1)
    .unitscan 亵渎者多赞姆
    .train 410008,1
step
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[复仇者符文] |cRXP_WARN_学习|r |T134596:0|t[铭刻裤子 - 复仇者之盾]
    .use 211488
    .itemcount 211488,1 --Rune of the Avenger (1)
    .train 410008,1
--VV Overall paladin routing can be improved if Divine Sac turnin has items bought before Divine Storm -> Turned in after Divine Storm (run down after accepting Return to Delgren -> Turn in -> Fly to Astranaar -> DS Turnin)
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Belt
#subgroupdisplayname 腰带
#title 灵活防护
#name Malleable Protection - 34 (Arathi Highlands)
#displayname 灵活防护 - 34（阿拉希高地）
step
    #optional
    .train 426175,1
    +|cRXP_WARN_必须至少 34 级才能获得|r |T134419:0|t[|cRXP_FRIENDLY_虔敬符文|r]
    .xp >34,1
step
    .train 426175,1
    #completewith next
    .train 20164,1
    +|cRXP_WARN_必须训练|r |T135971:0|t[公正圣印] |cRXP_WARN_才能获得|r |T134419:0|t[|cRXP_FRIENDLY_虔敬符文|r]
step
    .train 426175,1
    .train 642,1
    .train 1020,1
    +|cRXP_WARN_必须学会|r |T135896:0|t[圣盾术] |cRXP_WARN_才能获得|r |T134419:0|t[|cRXP_FRIENDLY_虔敬符文|r]
step
    .train 426175,1
    #optional
    .train 20164,1
    +|cRXP_WARN_必须训练|r |T135971:0|t[公正圣印] |cRXP_WARN_才能获得|r |T134419:0|t[|cRXP_FRIENDLY_虔敬符文|r]
step
    .train 426175,1
    #completewith next
    .zone Arathi Highlands >>前往阿拉希高地
step
    .train 426175,1
    #completewith BeadSoJ1
    .goto Arathi Highlands,68.8,71.8,0
    .goto Arathi Highlands,35.4,44.8,0
    +|cRXP_WARN_阿拉希高地的巨魔和食人魔也可能掉落任意一种|r |T135261:0|t[|cRXP_LOOT_失去光泽的祈祷念珠|r]
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
    >>击杀 |cRXP_ENEMY_辛迪加雇佣兵|r、|cRXP_ENEMY_辛迪加巡路者|r 和 |cRXP_ENEMY_辛迪加路霸|r, 拾取 |T135261:0|t[|cRXP_LOOT_失去光泽的祈祷念珠 I|r]
    .collect 213444,1 --Tarnished Prayer Bead I
    .mob 辛迪加雇佣兵
    .mob 辛迪加巡路者
    .mob 辛迪加路霸
step
    .train 426175,1
    #requires BeadBoM1
    #label BeadBoM2
    #completewith Rosary
    +|cRXP_WARN_施放|r |T135906:0|t[力量祝福] |cRXP_WARN_，目标为自己|r
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
    >>|cRXP_WARN_继续击杀敌人以获取|r |T135260:0|t[|cRXP_LOOT_神圣祈祷念珠 I|r]
    >>|cRXP_WARN_你必须保持|r |T135906:0|t[力量祝福] |cRXP_WARN_增益生效|r
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
    >>击杀 |cRXP_ENEMY_辛迪加雇佣兵|r、|cRXP_ENEMY_辛迪加巡路者|r 和 |cRXP_ENEMY_辛迪加路霸|r, 拾取 |T135261:0|t[|cRXP_LOOT_失去光泽的祈祷念珠 II|r]
    .collect 213445,1 --Tarnished Prayer Bead II
    .mob 辛迪加雇佣兵
    .mob 辛迪加巡路者
    .mob 辛迪加路霸
step
    .train 426175,1
    #completewith Rosary
    #requires BeadDS1
    #label BeadDS2
    >>|cRXP_WARN_施放|r |T135896:0|t[圣盾术] |cRXP_WARN_（须在战斗中且生命值低于40%），以获得|r |T135260:0|t[|cRXP_LOOT_神圣祈祷念珠 II|r]
    .collect 213449,1 --Divine Prayer Bead II
    .usespell 642
    .usespell 1020
step
    .train 426175,1
    #completewith Rosary
    #label BeadSoJ1
    >>击杀 |cRXP_ENEMY_辛迪加雇佣兵|r、|cRXP_ENEMY_辛迪加巡路者|r 和 |cRXP_ENEMY_辛迪加路霸|r, 拾取 |T135261:0|t[|cRXP_LOOT_失去光泽的祈祷念珠 III|r]
    #loop
    .goto Arathi Highlands,33.26,32.60,50,0
    .goto Arathi Highlands,30.38,30.68,50,0
    .goto Arathi Highlands,31.46,25.36,50,0
    .goto Arathi Highlands,33.87,29.13,50,0
    .goto Arathi Highlands,31.13,29.47,50,0
    .collect 213446,1 --Tarnished Prayer Bead III
    .mob 辛迪加雇佣兵
    .mob 辛迪加巡路者
    .mob 辛迪加路霸
step
    .train 426175,1
    #completewith Rosary
    #requires BeadSoJ1
    #label BeadSoJ2
    >>|cRXP_WARN_施放|r |T135971:0|t[公正圣印] |cRXP_WARN_，随后对正在逃跑的敌人施放|r |T135959:0|t[审判] |cRXP_WARN_，以获得|r |T135260:0|t[|cRXP_LOOT_神圣祈祷念珠 III|r]
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
    >>|cRXP_WARN_使用|r |T135260:0|t[|cRXP_LOOT_神圣祈祷念珠|r] |cRXP_WARN_合成|r |T133289:0|t[|cRXP_LOOT_圣光念珠|r]
    .use 213448
    .use 213449
    .use 213450
    .collect 213447,1
step
    .train 426175,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与激流堡内的 |cRXP_FRIENDLY_阿提库斯修士|r交谈，获取|T134419:0|t[|cRXP_FRIENDLY_虔敬符文|r]
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
    .target 阿提库斯修士
step
    .itemcount 213128,1
    .use 213128
    .train 426175 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_虔敬符文|r] |cRXP_WARN_学习|r |T236251:0|t[灵活防护]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Belt
#subgroupdisplayname 腰带
#name Sheath of Light - 40 (Azeroth)
#title 圣光出鞘
#displayname 圣光出鞘 - 40（艾泽拉斯）
step
    #completewith next
    .zone Desolace >>前往凄凉之地
step
    .train 426178,1
    .goto Desolace,52.730,84.761
    >>拾取地上的|cRXP_PICK_破碎的战锤|r，获得|T133041:0|t[|cRXP_LOOT_破碎的锤子|r]
    .use 215441 >>|cRXP_WARN_使用|T133041:0|t[|cRXP_LOOT_破碎的锤子|r]开始任务|r
    .collect 215441,1
    .accept 79939 >>接任务：破碎的锤子
step
    .train 426178,1
    #loop
    .goto Desolace,52.6,85.6,0
    .goto Desolace,55.6,70.4,0
    .goto Desolace,47.2,75.2,0
    .goto Desolace,52.6,85.6,40,0
    .goto Desolace,55.6,70.4,40,0
    .goto Desolace,47.2,75.2,60,0
    >>击杀|cRXP_ENEMY_火刃召唤师|r，拾取|T133471:0|t[|cRXP_LOOT_被撕碎的信|r]
    .collect 216956,1,79939,1
    .mob 火刃召唤师
step
    #completewith Katherine
    .zone Stormwind City >>前往暴风城
step
    #completewith Katherine
    .goto StormwindClassic,42.51,33.51,20 >> 前往 [暴风城大教堂]
step
    .train 426178,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纯洁的凯瑟琳|r交谈
    .goto Stormwind City,37.222,31.855
    .turnin 79939 >>交任务：破碎的锤子
    .accept 79940 >>接任务：迷失的兄弟
    .target 纯洁的凯瑟琳
step
    #label Katherine
    .train 426178,1
    .goto Stormwind City,37.222,31.855
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纯洁的凯瑟琳|r交谈
    .skipgossip 5492,1
    .complete 79940,1
    .turnin 79940 >>交任务：迷失的兄弟
    .target 纯洁的凯瑟琳
step
    #completewith next
    .zone Wetlands >>前往湿地的米奈希尔港
step
    .isQuestTurnedIn 79940
    .train 426178,1
    .goto Wetlands,8.086,58.592
    .gossip 3179,4 >> 与 |cRXP_FRIENDLY_哈洛德·李格斯|r 交谈. 确保完成他所有的对话选项
    .skipgossip 3179,2
    .target 哈洛德·李格斯
step
    #completewith next
    .goto 1415,41.937,58.932,40 >> |cRXP_WARN_向南游泳一路绕行至丹莫罗. 不久后必须击杀一只 40 级精英, 建议带个朋友一起完成|r
step
    .train 426178,1
    .goto 1415,41.937,58.932
    .gossip 217957 >> 与建筑内的 |cRXP_FRIENDLY_被杀死的血色十字军战士|r 交谈
    >>|cRXP_WARN_此操作将召唤一名40级精英|r |cRXP_ENEMY_血色十字军刺客|r
    .target 被杀死的血色十字军战士
step
    .train 426178,1
    .goto 1415,41.937,58.932
    >>击杀|cRXP_ENEMY_血色十字军刺客|r，拾取|T133471:0|t[|cRXP_LOOT_大十字军战士谕令|r]
    .use 215468 >>|cRXP_WARN_使用|T133471:0|t[|cRXP_LOOT_大十字军战士谕令|r]开始任务|r
    .collect 215468,1,79945,1
    .accept 79945 >>接任务：大十字军战士谕令
    .mob 血色十字军刺客
step
    #completewith Katherine2
    .zone Stormwind City >>前往暴风城
step
    #completewith Katherine2
    .goto StormwindClassic,42.51,33.51,20 >> 前往 [暴风城大教堂]
step
    .train 426178,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纯洁的凯瑟琳|r交谈
    .goto Stormwind City,37.222,31.855
    .turnin 79945 >>交任务 大十字军战士谕令
    .accept 79946 >>接任务：需要帮助的兄弟
    .target 纯洁的凯瑟琳
step
    #label Katherine2
    .train 426178,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纯洁的凯瑟琳|r交谈
    .goto Stormwind City,37.222,31.855
    .skipgossip 5492,3
    .complete 79946,1 --Learn more about Aeonas from Katherine
    .target 纯洁的凯瑟琳
step
    .train 426178,1
    >>|cRXP_WARN_现在需要前往血色修道院，完整通关大教堂区|r
    >>击杀|cRXP_ENEMY_莫格莱尼|r和|cRXP_ENEMY_怀特迈恩|r后，与后方房间内的|cRXP_FRIENDLY_艾奥纳斯|r交谈
    .complete 79946,2 --Find Aeonas in the Scarlet Monastery
    .turnin 79946 >>交任务：需要帮助的兄弟
    .accept 79963 >>接任务：圣光的恩赐
    .target 艾奥纳斯
step
    .train 426178,1
    >>将 |cRXP_FRIENDLY_艾奥纳斯|r 治疗至满血
    .complete 79963,1 --Heal Aeonas
    .target 艾奥纳斯
step
    .train 426178,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾奥纳斯|r交谈
    .turnin 79963 >>交任务：圣光的恩赐
    .accept 79970 >>接任务：洗刷冤屈的艾奥纳斯
    .target 艾奥纳斯
step
    #completewith Aeonas
    .zone Stormwind City >>前往暴风城
step
    #completewith Aeonas
    .goto StormwindClassic,42.51,33.51,20 >> 前往 [暴风城大教堂]
step
    #label Aeonas
    .goto Stormwind City,37.355,31.708
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洗冤者艾奥纳斯|r 交谈
    .turnin 79970 >> 交任务: 洗刷冤屈的艾奥纳斯
    .train 426178 >> 学习 |T236263:0|t[圣光出鞘]
    .target 洗冤者艾奥纳斯
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Boots
#subgroupdisplayname 靴子
#name Guarded by the Light - 30 (Alterac Mountains)
#title 圣光守护
#displayname 圣光守护 - 30（奥特兰克山脉）
step
    #optional
    .train 416035,1
    +|cRXP_WARN_至少达到30级后才能获取|r |T134419:0|t[|cRXP_FRIENDLY_守护者符文|r]
    .xp >30,1
step
    .train 416035,1
    .train 19752 >> |cRXP_WARN_必须先学习|r |T136106:0|t[神圣干涉] |cRXP_WARN_，才能获取|r |T134419:0|t[|cRXP_FRIENDLY_守护者符文|r]
step
    .train 416035,1
    .collect 17033,1 >>|cRXP_BUY_向任意施法材料商购买至少一个|r |T135259:0|t[神圣符印] |cRXP_BUY_|r
step
    .train 416035,1
    #completewith FriendRequired
    +|cRXP_WARN_接下来的步骤请务必带上一位|cFFFFFFFF牧师|r，|cFFF58CBA圣骑士|r 或 |cFFFF7D0A德鲁伊|r 队友！因为需要有人复活你，接下来的部分是无法单人完成的！|r
    .subzoneskip 281
step
    .train 416035,1
    .goto Alterac Mountains,39.675,60.675
    .zone Alterac Mountains >>前往奥特兰克山脉
    .itemcount 213452,<1
step
    .train 416035,1
    #label FriendRequired
    >>点击地上的|cRXP_PICK_冰冻残骸|r，拾取|cRXP_LOOT_休眠的神圣符文|r
    .goto Alterac Mountains,39.675,60.675
    .collect 213452,1
step
    .train 416035,1
    .cast 19752 >> |cRXP_WARN_对同行的朋友施放|r |T136106:0|t[神圣干涉] |cRXP_WARN_|r
    .usespell 19752
step
    .train 416035,1
    >>|cRXP_WARN_让你的朋友移除|r |T136106:0|t[神圣干涉] |cRXP_WARN_增益并复活你|r
    >>|cRXP_WARN_你将获得|r |T134419:0|t[|cRXP_FRIENDLY_守护者符文|r]
    .collect 213132,1
step
    .use 213132
    .itemcount 213132,1
    .train 416035 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_守护者符文|r] |cRXP_WARN_学习|r |T237537:0|t[圣光守护]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Boots
#subgroupdisplayname 靴子
#name Sacred Shield - 30 (Desolace)
#title 圣洁护盾
#displayname 圣洁护盾 - 30（凄凉之地）
step
    #optional
    .train 416028,1
    +|cRXP_WARN_你必须至少18级才能获得|r |T236249:0|t[圣洁护盾] |cRXP_WARN_符文|r
    .xp >18,1
step
    .train 416028,1
    .train 1044 >> |cRXP_WARN_你必须学习|r |T135968:0|t[自由祝福] |cRXP_WARN_才能获得|r |T236249:0|t[圣洁护盾] |cRXP_WARN_符文|r
step
    .train 416028,1
    #completewith Deliverance
    +|cRXP_WARN_确保带一位朋友完成以下步骤!接下来的部分无法独自完成!|r
step
    .train 416028,1
    #completewith next
    .zone Desolace >>前往凄凉之地
step
    .train 416028,1
    #label Deliverance
    .goto Desolace,66.532,7.531
    >>拾取桌上的 |T134916:0|t[|cRXP_FRIENDLY_解脱圣契|r]
    .collect 213513,1
step
    .train 416028,1
    .equip 18,213513 >> |cRXP_WARN_装备|r |T134916:0|t[|cRXP_FRIENDLY_解脱圣契|r]
    .use 213513
step
    .train 416028,1
    .goto Desolace,38.21,61.02,50,0
    .goto Desolace,36.44,60.52,60,0
    .goto Desolace,33.44,54.17,60,0
    .goto Desolace,30.33,58.26,60,0
    .goto Desolace,31.79,61.28
    .aura 408828 >> |cRXP_WARN_施放|r |T135968:0|t[自由祝福] |cRXP_WARN_，在其他玩家移动受限时对其施放5次；每次获得一层|r |T237556:0|t[积累灵感] |cRXP_WARN_效果|r
    >>|cRXP_WARN_一旦你有5层|r |T237556:0|t[积累灵感]|cRXP_WARN_，你将获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益|r
    >>|cRXP_WARN_在玛拉顿外完成以上操作。|r |cRXP_ENEMY_玛洛迪争斗者|r |cRXP_WARN_在那里施放|r |T132149:0|t[投网]
    .mob 玛洛迪争斗者
step
    .use 213513
    .train 416028 >>|cRXP_WARN_使用|r |T134916:0|t[|cRXP_FRIENDLY_解脱圣契|r] |cRXP_WARN_学习|r |T236249:0|t[圣洁护盾]
]])
-- RXPGuides.RegisterGuide([[
-- #classic
-- << Paladin SoD
-- #group RestedXP Rune & Books Guide
-- #subgroup Bracers
-- #name Improved Hammer of Wrath
-- for phase 3
-- Improved Hammer of Wrath
-- ]])
-- RXPGuides.RegisterGuide([[
-- #classic
-- << Paladin SoD
-- #group RestedXP Rune & Books Guide
-- #subgroup Bracers
-- #name Purifying Power
-- for phase 3
-- Purifying Power
-- ]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Helmet
#subgroupdisplayname 头盔
#name Fanaticism - 44 (Azeroth)
#title 狂信
#displayname 狂信 - 44（艾泽拉斯）
step
    #optional
    .train 426178 >>|cRXP_WARN_必须先完成|r|T236263:0|t[圣光出鞘]|cRXP_WARN_任务线并交付“洗刷冤屈的艾奥纳斯”，才能开始此任务线；仅向符文经纪人学习符文不满足此前置|r
    .train 429251,1
step
    #completewith next
    .zone Stormwind City >>前往暴风城
    .train 429251,1
step
.train 429251,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洗冤者艾奥纳斯|r交谈
    .goto Stormwind City,37.355,31.708
    .accept 81762 >>接任务：一些好消息
    .target 洗冤者艾奥纳斯
step
    .train 429251,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纯洁的凯瑟琳|r交谈
    .goto Stormwind City,37.222,31.855
    .turnin 81762 >>交任务 一些好消息
    .accept 81764 >>接任务：神秘的商人
    .target 纯洁的凯瑟琳
step
    #completewith next
    .zone Dustwallow Marsh >>前往尘泥沼泽／塞拉摩岛|cRXP_WARN_（例如从米奈希尔港乘船前往塞拉摩）|r
    .train 429251,1
step
    .train 429251,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_艾尔利克|r交谈
    *|cRXP_WARN_两个45级的敌人将在你接受任务后攻击你|r
    .goto Dustwallow Marsh,66.52,45.41
    .turnin 81764 >>交任务：神秘的商人
    .accept 81765 >>接任务：白银之手圣骑士艾尔利克
    .target 艾尔利克
step
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔利克|r交谈
    .goto Dustwallow Marsh,66.52,45.41
    .gossip 221575,5
    .skipgossip 221575,1
    .train 429251,1
step
    .train 429251,1
    >>击杀|cRXP_ENEMY_艾尔利克|r，拾取|T133471:0|t[|cRXP_LOOT_染血信函|r]
    >>|cRXP_WARN_使用|r |T133471:0|t[|cRXP_LOOT_染血信函|r] |cRXP_WARN_来获得任务|r
    .goto Dustwallow Marsh,66.52,45.41
    >>若未能拾取信函，战斗结束后与旅店老板詹妮交谈，交付“白银之手圣骑士艾尔利克”并索取一份
    .collect 219930,1,81766,1
    .target 艾尔利克
step
    .train 429251,1
    .goto Dustwallow Marsh,66.52,45.41
    .turnin -81765 >>向旅店老板詹妮交任务：白银之手圣骑士艾尔利克
    .target 旅店老板詹妮
    .use 219930
    .accept 81766 >>使用染血信函接任务：染血信函
step
    #completewith next
    .zone Stormwind City >>前往暴风城
    .train 429251,1
step
    .train 429251,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纯洁的凯瑟琳|r交谈，|cRXP_WARN_学习|r|T135905:0|t[狂信]
    .goto Stormwind City,37.222,31.855
    .turnin 81766 >>交任务 染血信函
    .target 纯洁的凯瑟琳
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Bracers
#subgroupdisplayname 护腕
#name Light's Grace - 40 (Feralas)
#title 光之优雅
#displayname 光之优雅 - 40（菲拉斯）
step
.train 429242,1
    #optional
    .train 5599 >>|cRXP_WARN_必须先学会|r|T135964:0|t[保护祝福]|cRXP_WARN_，才能获取|r|T135931:0|t[光之优雅]|cRXP_WARN_符文|r
step
    #optional
    #completewith TeleporterTaken
    .isQuestTurnedIn 79984
    .goto Stranglethorn Vale,27.6,77.4,8 >>使用藏宝海湾的传送器前往菲拉斯
    .train 429242,1
step
    #optional
    .isQuestAvailable 79984
    #completewith TeleporterTaken
    .zone Feralas >>前往菲拉斯
    .goto Feralas,85.27,43.66,8 >>使用 |cRXP_PICK_奇械世界传送器|r
    .train 429242,1
step
    #label TeleporterTaken
    .goto Feralas,84.26,43.81,10 >>到达平台
    .train 429242,1
step
    .train 429242,1
    >>1) |cRXP_WARN_在声望窗口中将加基森阵营设为“交战”|r
    >>2) 前往导航点的确切位置
    >>3) 看向木屋旁的绿色灌木丛
    .goto Feralas,83.93,43.89
    .goto Feralas,85.27,43.66,0
    .aura 436534,1 >>4) |cRXP_WARN_背对对面燃烧的飞行器所在石柱，等待|cRXP_ENEMY_塔防自动机|r恰好位于你与灌木丛之间，然后攻击龙形的塔防自动机，让它将你击退到对面石柱|r
    .mob 塔防自动机
step
>>到达后，在声望窗口取消加基森的“交战”状态；治疗弗力克希后，选择为他施放保护祝福的对话选项
    .train 429242,1
    >>|cRXP_WARN_治疗|r|cRXP_FRIENDLY_弗力克希·希基克斯|r，|cRXP_WARN_直到他站起来|r。
    .gossip 220930,1 >>随后与|cRXP_FRIENDLY_弗力克希·希基克斯|r交谈
    .skipgossip 220930,1
    .goto Feralas,81.45,42.46
    .target 弗力克希·希基克斯
step
    #completewith next
    .zone Stranglethorn Vale >>前往荆棘谷／藏宝海湾
    .train 429242,1
step
    .train 429242,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_力克希·希基克斯|r交谈，购买|T134419:0|t[|cRXP_FRIENDLY_优雅符文|r]
    .goto Stranglethorn Vale,28.4,75.8
    .collect 219147,1
    .target 力克希·希基克斯
step
    .itemcount 219147,1
    .use 219147
    .train 429242 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_优雅符文|r] |cRXP_WARN_学习|r |T236249:0|t[光之优雅]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Helmet
#subgroupdisplayname 头盔
#name Wrath - 43 (The Hinterlands)
#title 愤怒
-- Wrath
#displayname 愤怒 - 43（辛特兰）
step
    #optional
    .train 5502 >>|cRXP_WARN_必须先学会|r |T135974:0|t[感知亡灵] |cRXP_WARN_，才能获取|r |T236260:0|t[愤怒] |cRXP_WARN_符文|r
    .train 429249,1
step
    #completewith RuneLearned
    +|cRXP_WARN_获取|r |T236260:0|t[愤怒] |cRXP_WARN_符文的时间仅限服务器时间晚上9点至早上6点|r
step
    #completewith next
    .zone The Hinterlands >>前往辛特兰
    .train 429249,1
step
    .train 429249,1
    >>|cRXP_WARN_使用|r |T135974:0|t[感知亡灵] |cRXP_WARN_才能看见|r |cRXP_ENEMY_复仇之灵|r
    >>击杀|cRXP_ENEMY_复仇之灵|r，拾取其掉落的|T134419:0|t[|cRXP_FRIENDLY_愤怒符文|r]
    *|cRXP_ENEMY_复仇之灵|r 在湖边游荡
    .goto The Hinterlands,33.0,44.2
    .collect 220165,1
    .mob 复仇之灵
step
    #label RuneLearned
    .itemcount 220165,1
    .use 220165
    .train 429249 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_愤怒符文|r] |cRXP_WARN_学习|r |T236260:0|t[愤怒]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Bracers
#subgroupdisplayname 护腕
#name Hammer of the Righteous - 50 (Azeroth)
#title 正义之锤
--x shiek: needs better coordinates
#displayname 正义之锤 - 50（艾泽拉斯）
step
    #optional
    .train 429251 >>|cRXP_WARN_必须先完成|r |T135905:0|t[狂信] |cRXP_WARN_任务线并交付“染血信函”，才能开始此任务线；仅向符文经纪人学习符文不满足此前置|r
    .train 410013,1
step
    #completewith next
    .zone Felwood >>前往费伍德森林
    .train 410013,1
step
    .goto Felwood,43.2,57.2,12,0
    >>点击绳索攀上悬崖，再前往艾奥纳斯处
    .goto Felwood,45.0,52.0
    .gossip 221587,5 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洗冤者艾奥纳斯|r交谈
    .target 洗冤者艾奥纳斯
    .train 410013,1
step
    .goto Felwood,44.6,52.0
    .gossip 221636,8 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里高利|r交谈
    .target 格里高利
    .train 410013,1
step
    .goto Felwood,44.6,52.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里高利|r交谈
    .accept 81790,1 >>接受任务 关键材料
    .target 格里高利
    .train 410013,1
step
    #loop
    .goto Felwood,44.4,46.8,40,0
    .goto Felwood,40.0,43.6,40,0
    .goto Felwood,41.8,34.8,40,0
    .goto Felwood,48.0,38.8,40,0
    >>击杀|cRXP_ENEMY_地狱火哨兵|r、|cRXP_ENEMY_地狱火保镖|r、|cRXP_ENEMY_热能野兽|r和|cRXP_ENEMY_热能恐兽|r，拾取|cRXP_LOOT_|T136030:0|t炽炎地狱火核心|r
    .complete 81790,1 --3/3 Fiery Infernal Core
    .mob 地狱火哨兵
    .mob 地狱火保镖
    .mob 热能野兽
    .mob 热能恐兽
step
    #completewith next
    #title 玛拉顿
    .zone Desolace >>前往玛拉顿
    .goto Desolace,30,62,20
    .train 410013,1
step
    >>|cRXP_WARN_建议组成5人队伍。|r
    >>击杀玛拉顿的最终首领|cRXP_ENEMY_瑟莱德丝公主|r，随后点击公主身后的|cRXP_PICK_坟堆|r，拾取|cRXP_LOOT_|T134389:0|t幻光墓穴之尘|r。
    .complete 81790,2 --1/1 Shimmering Grave Dust
    .mob 瑟莱德丝公主
    .train 410013,1
step << Alliance
    #completewith next
    #title 黑石深渊
    .zone Searing Gorge >>前往黑石深渊
    .goto 1415,48.09,62.42,20
    .train 410013,1
step << Alliance
    >>|cRXP_WARN_建议组成5人队伍，并准备3金币。|r
    >>穿过黑石深渊，抵达黑铁酒吧。|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普拉格|r交谈，购买|T135262:0|t[三酿熔火窖酒]
    .complete 81790,3 --1/1 Triple-Brewed Molten Lager
    .target 普拉格
    .train 410013,1
step << Alliance
    #completewith next
    .zone Hillsbrad Foothills >>前往希尔斯布莱德丘陵
    .train 410013,1
step << Alliance
.train 410013,1
.isOnQuest 81790
    #loop
    .goto Hillsbrad Foothills,65.8,19.6,20,0
    .goto Hillsbrad Foothills,67.6,15.0,20,0
    .goto Hillsbrad Foothills,68.6,13.8,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵石炬|r交谈
    .target 卫兵石炬
    .accept 81944,1 >>接任务：新发现的目标
    .turnin 81944 >>交任务：新发现的目标
    .complete 81790,4 --1/1 Symbol of Faith
step << Horde
    #completewith next
    .zone Hillsbrad Foothills >>前往希尔斯布莱德丘陵
    .train 410013,1
step << Horde
.train 410013,1
.isOnQuest 81790
    #loop
    .goto Hillsbrad Foothills,65.8,19.6,20,0
    .goto Hillsbrad Foothills,67.6,15.0,20,0
    .goto Hillsbrad Foothills,68.6,13.8,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵石炬|r交谈
    .target 卫兵石炬
    .accept 81944,1 >>接任务：新发现的目标
    .turnin 81944 >>交任务：新发现的目标
    .complete 81790,4 --1/1 Symbol of Faith
step << Horde
    #completewith next
    .zone Searing Gorge >>前往灼热峡谷
    .train 410013,1
step << Horde
    >>|cRXP_WARN_建议组成5人队伍，并准备3金币。|r
    >>穿过黑石深渊，抵达黑铁酒吧。|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普拉格|r交谈，购买|T135262:0|t[三酿熔火窖酒]
    .complete 81790,3 --1/1 Triple-Brewed Molten Lager
    .target 普拉格
    .train 410013,1
step
    #completewith next
    .zone Felwood >>前往费伍德森林
    .train 410013,1
step
    .goto Felwood,43.2,57.2,12,0
    >>点击绳索再次攀上悬崖，返回格里高利处
    .goto Felwood,44.6,52.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里高利|r交谈
    .turnin 81790 >>交任务：关键材料
    .target 格里高利
    .train 410013,1
step
    .goto Felwood,45.0,52.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洗冤者艾奥纳斯|r交谈
    .accept 81885,1 >>接受任务 仪式
    .target 洗冤者艾奥纳斯
    .train 410013,1
step
    .goto Felwood,44.6,52.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里高利|r交谈
    .complete 81885,1 --1/1 Complete the Ritual
    .target 格里高利
    .train 410013,1
step
.train 410013 >>交付后学会铭刻护腕 - 正义之锤
    .goto Felwood,45.0,52.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洗冤者艾奥纳斯|r交谈
    .turnin 81885 >>交任务 仪式
    .target 洗冤者艾奥纳斯
    .train 410013,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#subgroupdisplayname 披风
#classic
<< Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Cloak
#name Shield of Righteousness - 60 (Eastern Plaguelands)
#title 正义盾击
--There wasn't very precise info for this available, might need confirmation if it works properly
#displayname 正义盾击 - 60（东瘟疫之地）

step
    .train 440788,1
    #completewith next
    >>|cRXP_WARN_至少达到50级才能接取任务；解锁此符文需要击杀斯坦索姆亡灵区的一名首领。如有意获取，现在可以开始组队|r
    .zone Eastern Plaguelands >> 前往东瘟疫之地

step
    .train 440788,1
    .line Eastern Plaguelands,28.6,84.2,33.2,83.0,35.30,82.55,41.19,81.68,45.42,80.68,48.8,79.9,51.5,78.3,55.1,76.4
    >>寻找并击杀|cRXP_ENEMY_错颚的食尸鬼|r，然后|Tinterface/worldmap/chatbubble_64grey.blp:20|t与出现的矮人灵魂|cRXP_FRIENDLY_奥尔塔兹|r交谈，接受他的任务
    >> |cRXP_WARN_|cRXP_ENEMY_错颚的食尸鬼|r在墓室与考林路口之间道路南侧的区域巡逻。|r
    .accept 84318 >> 接任务：喂！
    .unitscan 错颚的食尸鬼
    .target 奥尔塔兹

step
    .train 440788,1
    .goto Eastern Plaguelands,61.3,69.3 --Not sure if this is the house or the other one, need more info
    >> 进入考林路口的房屋，到二楼拾取|T133040:0|t[|cRXP_PICK_华丽的战锤|r]。
    .complete 84318,1

step
    .train 440788,1
    .goto Eastern Plaguelands,61.3,69.3
    >>使用|T134566:0|t[奥尔塔兹最爱的金牙]再次召唤|cRXP_FRIENDLY_奥尔塔兹|r，与他交谈，交任务并接受后续任务
    .turnin 84318 >> 交任务：喂！
    .accept 84319 >> 接任务：想都别想
    .use 227687

step
    .train 440788,1
    .goto Eastern Plaguelands,59.7,68.7
    >>击杀任意|cRXP_ENEMY_缝合憎恶|r，拾取|T133823:0|t[|cRXP_LOOT_消化一半的板甲|r]
    .complete 84319,1
    .mob 缝合憎恶

step
    .train 440788,1
    .use 227687
    >>使用|T134566:0|t[奥尔塔兹最爱的金牙]再次召唤|cRXP_FRIENDLY_奥尔塔兹|r，与他交谈，交任务并接受后续任务
    .turnin 84319 >> 交任务：想都别想
    .accept 84330 >> 接任务：一点点通灵术

step
    .train 440788,1
    >>组队前往斯坦索姆亡灵区
    >>击杀斯坦索姆亡灵区首领之一|cRXP_ENEMY_苍白的玛勒基|r，拾取|T134415:0|t[通灵符石]
    .complete 84330,1 --Necrotic Runestone
    .mob 苍白的玛勒基

step
    .train 440788,1
    .goto Eastern Plaguelands,27.6,85.4
    >>返回地下墓室，寻找|cRXP_FRIENDLY_腐败的矮人遗骨|r，与其互动交任务
    .turnin 84330 >> 交任务：一点点通灵术
    .accept 84414 >>接任务：送我上路！

step
    .train 440788,1
    .isOnQuest 84414
    .goto Eastern Plaguelands,27.6,85.4
    >>等待奥尔塔兹的剧情结束，随后会留下神秘宝箱
    .complete 84414,1

step
    >>点击|cRXP_PICK_神秘宝箱|r，交付“送我上路！”；再接取并交付可立即完成的“领主的感激”，学会铭刻|T236265:0|t[|cRXP_FRIENDLY_正义盾击|r]
    .goto Eastern Plaguelands,27.5,85.8
    .turnin 84414 >>交任务：送我上路！
    .accept 84332 >> 接任务：领主的感激
    .turnin 84332 >> 交任务：领主的感激
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Cloak
#subgroupdisplayname 披风
#name Righteous Vengeance - 55 (Western Plaguelands)
#title 正义复仇
#next Shock and Awe - 60 (Western and Eastern Plaguelands)
#displayname 正义复仇 - 55（西瘟疫之地）
step
.train 440792,1
    #completewith next
    .zone Western Plaguelands >> 前往西瘟疫之地
step
.train 440792,1
    .goto Western Plaguelands,44.6,46.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_陨落的骑士|r交谈
    .gossip 227519,1 >> 完成他的对话
    .target 陨落的骑士
--Not entirely sure if you even need to talk to him or if you do how deep the dialogue is
step
.train 440792,1
    .goto Western Plaguelands,47.5,50.4
    >>进入|cRXP_FRIENDLY_陨落的骑士|r旁边的谷仓，|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_侍从库斯伯特|r交谈
    .accept 83808 >> 接任务：陷入困境
    .target 侍从库斯伯特
step
.train 440792,1
    .goto Western Plaguelands,47.5,50.4
    .goto Western Plaguelands,45.7,53.9
    >>拾取附近田野上的 [|cRXP_PICK_侍从库斯伯特之剑|r]
    .complete 83808,1
step
.train 440792,1
.goto Western Plaguelands,47.5,50.4
    >>返回谷仓，|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_侍从库斯伯特|r交谈
    .turnin 83808 >> 交任务：陷入困境
    .accept 83935 >> 接任务：扫清道路
    .target 侍从库斯伯特
step
.train 440792,1
    .goto Western Plaguelands,45.7,53.9
    >>击杀 |cRXP_ENEMY_坏死的僵尸|r、|cRXP_ENEMY_恐惧骸骨|r 和 |cRXP_ENEMY_腐烂的死尸|r
    .complete 83935,1 --Blighted Zombie(5)
    .complete 83935,2 --Skeletal Terror(10)
    .complete 83935,3 --Rotting Cadaver(10)
    .mob 坏死的僵尸
    .mob 恐惧骸骨
    .mob 腐烂的死尸
step
.train 440792,1
    .goto Western Plaguelands,47.5,50.4
    >>返回谷仓，|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_侍从库斯伯特|r交谈
    .turnin 83935 >> 交任务：扫清道路
    .accept 83822,1 >> 接任务：陨落的骑士
    >>|cRXP_WARN_这是一个护送任务|r
    .target 侍从库斯伯特
step
.train 440792,1
    .goto Western Plaguelands,44.6,46.6
    >>护送 |cRXP_FRIENDLY_侍从库斯伯特|r 回到陨落的骑士处，并帮他焚烧尸体
    .complete 83822,1
step
.train 440792,1
    .goto Western Plaguelands,44.6,46.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_侍从库斯伯特|r交谈
    .turnin 83822 >> 交任务：陨落的骑士
    .accept 83936 >> 接任务：达尔顿的任务
    .target 侍从库斯伯特
step
.train 440792,1
    .goto Western Plaguelands,44.6,46.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_侍从库斯伯特|r交谈并完成他的对话
    .complete 83936,1
    .target 侍从库斯伯特
step
.train 440792,1
    .goto Western Plaguelands,44.6,46.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_侍从库斯伯特|r交谈并完成他的对话。提交此任务后即可学会铭刻|T236260:0|t[|cRXP_FRIENDLY_正义复仇|r]
    >>你还将获得|T237377:0|t[|cFF0070FF达尔顿的号角|r]，解锁|T252188:0|t[|cRXP_FRIENDLY_震慑|r]符文时需要用到
    .turnin 83936 >> 交任务：达尔顿的任务
    .target 侍从库斯伯特
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Cloak
#subgroupdisplayname 披风
#name Shock and Awe - 60 (Western and Eastern Plaguelands)
#title 震慑与复仇之怒
#displayname 震慑 - 60（西瘟疫之地与东瘟疫之地）
step
    #completewith next
    +|cRXP_WARN_开始此符文任务前需先完成|r |T236260:0|t[|cRXP_FRIENDLY_正义复仇|r] |cRXP_WARN_任务线，交付“达尔顿的任务”并取得达尔顿的号角；仅向符文经纪人学习符文不满足此前置。请前往正义复仇指南完成任务线|r
    .isQuestAvailable 83936 --Righteous Vengeance
step
.train 440790,1
    .goto Eastern Plaguelands,78.6,47.6
    >>|cRXP_WARN_使用|r |T237377:0|t[|cFF0070FF达尔顿的号角|r] |cRXP_WARN_来召唤|r |cRXP_FRIENDLY_侍从库斯伯特|r |cRXP_WARN_并击杀小怪直到他升级。升级后他会给你一个可立即交付的任务|r
    .accept 83823 >> 接受「暴力一课」任务
    .turnin 83823 >> 交任务: 暴力一课
    .use 226122
step
.train 440790,1
    .goto Eastern Plaguelands,78.6,47.6
    >>|cRXP_WARN_使用|r |T237377:0|t[|cFF0070FF达尔顿的号角|r] |cRXP_WARN_召唤|r |cRXP_FRIENDLY_侍从库斯伯特|r |cRXP_WARN_，继续击杀怪物直到他再次升级。他会给你一个可以立即交付的任务，以及另一个寻找巫妖的任务，目标是|r |cRXP_ENEMY_承诅者阿寇诺斯|r
    .accept 84008 >> 接受「优雅一课」任务
    .turnin 84008 >> 交任务: 优雅一课
    .accept 84017 >> 接受「杀戮时刻」任务
    .use 226523
step
.train 440790,1
    .goto Eastern Plaguelands,86.8,39.4
    >>|cRXP_WARN_前往圣光之愿礼拜堂以北的毒雾林, 到达后再次召唤侍从, 寻找阿寇诺斯的任务应该会完成，随后会接到新任务, 接受它|r
    .turnin 84017 >> 交任务: 杀戮时刻
    .accept 84125 >> 接任务: 触手可及
    .use 226545
step
.train 440790,1
    .goto Eastern Plaguelands,83.7,41.9
    >>在毒雾林击杀 |cRXP_ENEMY_暗影法师|r 和 |cRXP_ENEMY_恐怖编织者|r, 拾取 |T135482:0|t[|cRXP_LOOT_天灾暗影解剖刀|r]
    .complete 84125,1
    .mob 暗影法师
    .mob 恐怖编织者
step
.train 440790,1
    >>如果侍从不在身边，先使用 |T237377:0|t[|cFF0070FF达尔顿的号角|r] 重新召唤 |cRXP_FRIENDLY_侍从库斯伯特|r，再与他交谈
    .turnin 84125 >> 交任务: 触手可及
    .accept 84126 >> 接受「结束战斗」任务
    .use 226545
    .target 侍从库斯伯特
step
.train 440790,1
    .goto Eastern Plaguelands,86.6,39.8
    >>使用 |T237490:0|t[|cRXP_LOOT_改造的暗影解剖刀|r] 驱散 |cRXP_ENEMY_阿寇诺斯|r 的护盾, 击杀他完成任务
    .complete 84126,1 --Arkonos the cursed slain
    .use 227685
step
.train 440790,1
    >>如果侍从不在身边，先使用 |T237377:0|t[|cFF0070FF达尔顿的号角|r] 重新召唤 |cRXP_FRIENDLY_侍从库斯伯特|r，再与他交谈
    >>提交此任务将使你学会铭刻 |T252188:0|t[震慑], 并奖励 |T133745:0|t[|cRXP_FRIENDLY_论述：复仇之怒|r] 教授 |T135875:0|t[复仇之怒]
    .turnin 84126 >> 交任务: 结束战斗
    .use 226545
    .target 侍从库斯伯特
step
    .train 407788 >> 使用 |T133745:0|t[|cRXP_FRIENDLY_论述：复仇之怒|r] 学习 |T135875:0|t[复仇之怒]
    .use 226399
]])
