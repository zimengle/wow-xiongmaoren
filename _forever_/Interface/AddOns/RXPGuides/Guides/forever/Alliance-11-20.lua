local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（联盟）
#subgroupdisplayname 1-20
#forever
#disabledungeons
#version 1
<< Alliance !NightElf
#name 13-15 Westfall
#group RestedXP Forever Guide (A)
#subgroup Speedrun Guide 1-20
--#groupid RXP-SRGCE-A1
#next 14-16 Darkshore
#defaultfor !NightElf !Hunter/!Dwarf !Hunter/!Human !Hunter/!Skyborne !Hunter
--Going to Darkshore if already 15
#displayname 14-15 西部荒野 << Dwarf/Gnome
#displayname 13-15 西部荒野

step
    #optional
    .maxlevel 14,endOfTheGuide

step
    .goto 1453/0,673.58,-8867.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板奥里森|r交谈
    .home >> 将你的炉石设置为暴风城
    .target 旅店老板奥里森
    .bindlocation 16509

step
    #label NEWestfallStart --hidden step for #include

step
    #ah
    .goto 1453/0,660.28,-8814.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_BUY_购买以下物品，以便稍后在西部荒野更快交任务：|r
    >>|cRXP_WARN_（可选） 如果不打算完成此步骤，或所需资源不足，请跳过|r
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝]
    -->>|T4548890:0|t[Golem Isospring]
    -->>|T132995:0|t[Harvester Gyrostabilizer]
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- Okra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    --.collect 255007,14,92909,1 -- Golem Isospring (14)
    --.collect 255010,5,92909,1 -- Harvester Gyrostabilizer (5)

step << Human
    .goto 1453/0,484.200,-8832.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .turnin 6261 >> 交任务：杜加尔·朗德瑞克
    .accept 6285 >> 接任务：返回西部荒野
    .target 杜加尔·朗德瑞克

step << !Skyborne
    .goto 1453/0,484.200,-8832.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >> 飞往西部荒野 << !NightElf
    .fp Stormwind >> 获取暴风城飞行点 << NightElf
    .target 杜加尔·朗德瑞克

step
    #completewith SaldeanVendor
    #optional
    .goto 1429/0,875.96,-9814.400
    .zone Westfall >> 前往西部荒野

step
    .goto 1436/0,918.42,-9851.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r交谈
    .accept 64 >> 接任务：遗失的怀表
    .target 农夫法布隆

step
    .goto 1436/0,919.47,-9853.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .accept 36 >> 接任务：杂味炖肉
    .accept 151 >> 接任务：老马布兰契
    .target 弗娜·法布隆

step
    #completewith SalmaS
    .goto 1436/0,1055.27,-10128.70,65 >> 前往萨丁农场

step
    .goto 1436/0,1055.27,-10128.70
    .target 农夫萨丁
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .accept 9 >> 接任务：清理荒野
    .accept 109 >>接任务：向格里安·斯托曼报到 << !Human

step
    #label SalmaS
    .goto 1436/0,1042.67,-10111.670
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .turnin 36 >> 交任务：杂味炖肉
    .target 萨尔玛·萨丁
    .accept 38 >> 接任务：杂味炖肉
    .accept 22 >> 接任务：猪肝馅饼

step << Human
    #label Lewis
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_军需官刘易斯|r
    .target 军需官刘易斯
    .goto 1436/0,1021.67,-10500.63
    .turnin 6285 >> 交任务：返回西部荒野

step << !Human
    #completewith next
    .goto 1436/0,1045.12,-10508.80
    .target 格里安·斯托曼
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 109 >> 交任务：向格里安·斯托曼报到
    .isOnQuest 109

step
    .goto 1436/0,1045.12,-10508.80
    .target 格里安·斯托曼
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 12 >> 接任务：西部荒野人民军
    .turnin 98021 >>交任务：前往哨兵岭 << Skyborne

step << skip
    .goto 1436/0,1041.97,-10511.13
    .target 丹努文队长
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹努文队长|r交谈
    .accept 102 >> 接任务：西部荒野的豺狼人

step << Human
    #requires Lewis
    .goto 1436/0,1126.67,-10636.670
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target 哨兵加里安
    .accept 153 >> 接任务：红色皮质面罩

step << !Human
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target 哨兵加里安
    .goto 1436/0,1126.67,-10636.670
    .accept 153 >> 接任务：红色皮质面罩

step
    .goto 1436/0,1166.57,-10653.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板希瑟尔|r
    .vendor >>|cRXP_BUY_按需购买食物和饮水|r
    .target 旅店老板希瑟尔

step
    .goto 1436/0,1179.800,-10635.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿尔巴·晴月::253092|r交谈
    .target 阿尔巴·晴月::253092
    .accept 92742 >>接任务：测试水井
    .accept 92744 >>接任务：鱼人的鳃

step
    #completewith bennytime
    >>打开地面上的 |cRXP_PICK_燕麦袋|r, 拾取 |cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_你通常可以在农场围栏或建筑附近找到它们|r
    .complete 151,1 --Handful of Oats (8)

step
    #completewith TravelCompass
    >>击杀 |cRXP_ENEMY_幼年血牙野猪|r 和 |cRXP_ENEMY_小碎尸鸟|r，拾取 |cRXP_LOOT_秃鹫肉条|r、|cRXP_LOOT_血牙野猪的头|r 和 |cRXP_LOOT_血牙野猪的肝|r
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +小碎尸鸟
    .mob +碎尸鸟
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +幼年血牙野猪
    .mob +血牙野猪
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +幼年血牙野猪
    .mob +血牙野猪

step
    #completewith TravelCompass
    >>击杀 |cRXP_ENEMY_迪菲亚捕兽者|r 和 |cRXP_ENEMY_迪菲亚走私者|r, 拾取 |T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +迪菲亚走私者
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者

step
    #label TravelCompass
    .isOnQuest 399
    .goto 1436/0,1602.67,-10629.67,75 >> 前往阿历克斯顿农场
    >>|cRXP_WARN_前往那里时顺路完成其他任务目标|r

step << skip -- quests drop rate is beyond dreadful. over 50 kills to complete
    .goto 1436/0,1213.400,-10153.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兹温·铁齿轮::253395|r（在谷仓里）交谈
    .target 奥兹温·铁齿轮::253395
    .accept 92909 >>接任务：“收割傀儡被收割”

step
    #sticky
    #completewith bennytime
    >>击杀路过田地时遇到的 |cRXP_ENEMY_看守傀儡|r
    >>拾取|cRXP_LOOT_秋葵|r和|cRXP_LOOT_灯油|r
    .mob 看守傀儡
    .complete 9,1 --Havest Watcher slain (20)
    .collect 732,3,38,1 --Okra (3)
    .collect 814,5,103,1 --Flask of Oil (5)

step
    .goto 1436/0,1748.27,-10672.13
    >>打开|cRXP_PICK_阿历克斯顿的箱子|r，获取|cRXP_LOOT_简易罗盘|r
    >>|cRXP_WARN_避开烧毁建筑前的怪物，从后方烟囱旁拾取物品。如有需要，利用烟囱阻挡|r|cRXP_ENEMY_迪菲亚掠夺者|r|cRXP_WARN_的施法视线|r
    .complete 399,1 --A Simple Compass (1)
    .isOnQuest 399

step
    .goto 1436/0,1404.200,-10290.900
    .use 254545 >>|cRXP_WARN_使用|r |T236996:0|t[井水采样工具包] |cRXP_WARN_在摩尔森农场的水井取样|r
    .complete 92742,2 --|1/1 Molsen Farm Water Sample

step
    #completewith bennytime
    >>击杀 |cRXP_ENEMY_幼年血牙野猪|r 和 |cRXP_ENEMY_小碎尸鸟|r，拾取 |cRXP_LOOT_秃鹫肉条|r、|cRXP_LOOT_血牙野猪的头|r 和 |cRXP_LOOT_血牙野猪的肝|r
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +小碎尸鸟
    .mob +碎尸鸟
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +幼年血牙野猪
    .mob +血牙野猪
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +幼年血牙野猪
    .mob +血牙野猪

step
    #completewith bennytime
    >>击杀 |cRXP_ENEMY_迪菲亚捕兽者|r 和 |cRXP_ENEMY_迪菲亚走私者|r, 拾取 |T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +迪菲亚走私者
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者

step
    .goto 1436/0,1266.67,-9927.33,75 >> 前往詹森牧场, |cRXP_WARN_途中继续完成其他任务目标|r

step
    #label bennytime
    .goto 1436/0,1289.77,-9849.63
    >>打开 |cRXP_PICK_法布隆的柜子|r, 获取 |cRXP_LOOT_法布隆的怀表|r
    >>|cRXP_WARN_如果你正确调整镜头角度, 就可以从房子外面摸到 |r|cRXP_PICK_法布隆的衣柜|r
    >>|cRXP_WARN_注意 |r|cRXP_ENEMY_本尼·布兰科|r|cRXP_WARN_, 他伤害很高|r
    .complete 64,1 --Furlbrow's Pocket Watch

step << skip
    #label GnollPaws
    .goto 1436/0,1042.67,-9715.0,60,0
    .goto 1436/0,1517.97,-9743.000,60,0
    .goto 1436/0,1412.62,-9720.83,60,0
    .goto 1436/0,1184.07,-9745.80,60,0
    .goto 1436/0,1026.57,-9715.70,60,0
    .goto 1436/0,1026.57,-9715.70,60,0
    .goto 1436/0,1517.97,-9743.000,60,0
    .goto 1436/0,1184.07,-9745.80,60,0
    .goto 1436/0,1412.62,-9720.83
    .goto 1436/0,1517.97,-9743.000,0
    .goto 1436/0,1184.07,-9745.80,0
    .goto 1436/0,1028.32,-9710.330,0
    >>击杀 |cRXP_ENEMY_河爪豺狼人|r 和 |cRXP_ENEMY_河爪斥候|r, 拾取 |T134297:0|t|cRXP_LOOT_豺狼人的爪子|r
    .complete 102,1 --Gnoll Paw (8)
    .mob 河爪豺狼人
    .mob 河爪斥候

step
    .goto 1436/0,1192.12,-9641.73,60,0
    .goto 1436/0,1042.67,-9619.33,60,0
    .goto 1436/0,1192.12,-9641.73,60,0
    .goto 1436/0,1042.67,-9619.33,60,0
    .goto 1436/0,1192.12,-9641.73
    .goto 1436/0,1042.67,-9619.33,0
    >>击杀|cRXP_ENEMY_鱼人袭击者|r和|cRXP_ENEMY_滩行鱼人|r，拾取他们的|cRXP_LOOT_眼球|r和|cRXP_LOOT_鳃|r
    .collect 730,3,38,1 --Murloc Eye (3)
    .complete 92744,1 -- Longshore Murloc Gills 7/7
    .mob 鱼人袭击者
    .mob 滩行鱼人

step
    .goto 1436/0,1004.87,-9716.87,60,0
    .goto 1436/0,1013.62,-9861.53,60,0
    .goto 1436/0,1192.12,-10175.13,60,0
    .goto 1436/0,1019.57,-10204.30,60,0
    .goto 1436/0,1013.62,-9861.53
    >>打开地面上的 |cRXP_PICK_燕麦袋|r, 拾取 |cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_你通常可以在农场围栏或建筑附近找到它们|r
    .complete 151,1 --Handful of Oats (8)

step
    .goto 1436/0,1035.300,-9835.101
    .use 254545 >>|cRXP_WARN_使用|r |T236996:0|t[井水采样工具包] |cRXP_WARN_在詹森牧场的水井取样|r
    .complete 92742,1 --|1/1 Jansen Stead Water Sample

step << Human Warlock
    #label FurlbrowFarm
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .turnin 64 >> 交任务：遗失的怀表
    .turnin 184 >> 交任务：法布隆的地契
    .target +农夫法布隆
    .goto 1436/0,918.42,-9851.50
    .turnin 151 >> 交任务：老马布兰契
    .goto 1436/0,919.47,-9853.13
    .target +弗娜·法布隆
    .isOnQuest 184

step
    #optional << Human Warlock
    #label FurlbrowFarm << !Human/!Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .turnin 64 >> 交任务：遗失的怀表
    .target +农夫法布隆
    .goto 1436/0,918.42,-9851.50
    .turnin 151 >> 交任务：老马布兰契
    .target +弗娜·法布隆
    .goto 1436/0,919.47,-9853.13

step
    #completewith SaldeanVendor
    .goto 1436/0,1055.27,-10128.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .vendor >> |cRXP_BUY_出售垃圾物品|r
    >>|cRXP_WARN_不要出售|r |T133884:0|t[鱼人的眼球]、|T135997:0|t[血牙野猪的头]、|T134341:0|t[血牙野猪的肝] |cRXP_WARN_或|r |T133972:0|t[秃鹫肉条]
    .target 农夫萨丁

step
    #optional
    .isQuestComplete 9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .target 农夫萨丁
    .goto 1436/0,1055.27,-10128.70
    .turnin 9 >> 交任务：清理荒野

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .goto 1436/0,1042.67,-10111.670
    .turnin 22 >> 交任务：猪肝馅饼
    .turnin 38 >> 交任务：杂味炖肉
    .isQuestComplete 22
    .isQuestComplete 38
    .target 萨尔玛·萨丁

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .goto 1436/0,1042.67,-10111.670
    .turnin 22 >> 交任务：猪肝馅饼
    .isQuestComplete 22
    .target 萨尔玛·萨丁

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .goto 1436/0,1042.67,-10111.670
    .turnin 38 >> 交任务：杂味炖肉
    .isQuestComplete 38
    .target 萨尔玛·萨丁

step
    #optional
    .goto 1436/0,1213.400,-10153.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兹温·铁齿轮::253395|r交谈
    .target 奥兹温·铁齿轮::253395
    .accept 92909 >>接任务：“收割傀儡被收割”
    .turnin 92909 >>交任务：“收割傀儡被收割”
    .itemcount 255007,14 -- Golem Isospring (14)
    .itemcount 255010,5 -- Harvester Gyrostabilizer (5)

step
    .isQuestAvailable 38
    .goto 1436/0,1132.27,-10146.67,60,0
    .goto 1436/0,1238.67,-9907.73,80,0
    .goto 1436/0,1460.22,-10224.83,80,0
    .goto 1436/0,1132.27,-10146.67,80,0
    .goto 1436/0,1238.67,-9907.73,80,0
    .goto 1436/0,1460.22,-10224.83,80,0
    .goto 1436/0,1132.27,-10146.67,60,0
    .goto 1436/0,1460.22,-10224.83,60,0
    .goto 1436/0,1238.67,-9907.73
    >>击杀 |cRXP_ENEMY_看守傀儡|r, 搜刮 |cRXP_LOOT_秋葵|r 和 |cRXP_LOOT_灯油|r
    .complete 9,1 --Harvest Watcher (20)
    .mob 看守傀儡
    .collect 732,3,38,1 --Okra (3)
    .collect 814,5,103,1 --Flask of Oil (5)

step
    .isQuestTurnedIn 38
    #label HarvestW
    .goto 1436/0,1132.27,-10146.67,60,0
    .goto 1436/0,1238.67,-9907.73,80,0
    .goto 1436/0,1460.22,-10224.83,80,0
    .goto 1436/0,1132.27,-10146.67,80,0
    .goto 1436/0,1238.67,-9907.73,80,0
    .goto 1436/0,1460.22,-10224.83,80,0
    .goto 1436/0,1132.27,-10146.67,60,0
    .goto 1436/0,1460.22,-10224.83,60,0
    .goto 1436/0,1238.67,-9907.73
    >>击杀 |cRXP_ENEMY_看守傀儡|r, 搜刮 |cRXP_LOOT_灯油|r
    .mob 看守傀儡
    .complete 9,1 --Harvest Watcher (20)
    .collect 814,5,103,1 --Flask of Oil (5)

step
    #optional
    .isQuestComplete 9
    .subzoneskip 107,1 -- forces early turnin if already at same farm
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .target 农夫萨丁
    .goto 1436/0,1055.27,-10128.70
    .turnin 9 >> 交任务：清理荒野

step
    #optional
    .goto 1436/0,1213.400,-10153.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兹温·铁齿轮::253395|r交谈
    .target 奥兹温·铁齿轮::253395
    .accept 92909 >>接任务：“收割傀儡被收割”
    .turnin 92909 >>交任务：“收割傀儡被收割”
    .itemcount 255007,14 -- Golem Isospring (14)
    .itemcount 255010,5 -- Harvester Gyrostabilizer (5)

step
    .goto 1436/0,1179.52,-10382.57,75,0
    .goto 1436/0,1138.22,-10474.97,75,0
    .goto 1436/0,860.67,-10462.83,75,0
    .goto 1436/0,904.07,-10038.87,75,0
    .goto 1436/0,1104.62,-9848.000,75,0
    .goto 1436/0,1298.52,-10028.13,75,0
    .goto 1436/0,1340.52,-10401.93,75,0
    .goto 1436/0,1111.97,-10342.20
    >>击杀 |cRXP_ENEMY_幼年血牙野猪|r 和 |cRXP_ENEMY_小碎尸鸟|r，拾取 |cRXP_LOOT_秃鹫肉条|r、|cRXP_LOOT_血牙野猪的头|r 和 |cRXP_LOOT_血牙野猪的肝|r
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +小碎尸鸟
    .mob +碎尸鸟
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +幼年血牙野猪
    .mob +血牙野猪
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +幼年血牙野猪
    .mob +血牙野猪

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .target 农夫萨丁
    .goto 1436/0,1055.27,-10128.70
    .turnin 9 >> 交任务：清理荒野

step
    #label SaldeanVendor
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .target 萨尔玛·萨丁
    .goto 1436/0,1042.67,-10111.670
    .turnin 38 >> 交任务：杂味炖肉
    .turnin 22 >> 交任务：猪肝馅饼

step
    #optional
    .goto 1436/0,1213.400,-10153.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兹温·铁齿轮::253395|r交谈
    .target 奥兹温·铁齿轮::253395
    .accept 92909 >>接任务：“收割傀儡被收割”
    .turnin 92909 >>交任务：“收割傀儡被收割”
    .itemcount 255007,14 -- Golem Isospring (14)
    .itemcount 255010,5 -- Harvester Gyrostabilizer (5)

step
    .goto 1436/0,1324.200,-10490.400
    >>击杀 |cRXP_ENEMY_迪菲亚捕兽者|r 和 |cRXP_ENEMY_迪菲亚走私者|r, 拾取 |T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_这里是动态刷新区域；只要击杀足够多，怪物就会不断刷新|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +迪菲亚走私者
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .target 格里安·斯托曼
    .goto 1436/0,1045.12,-10508.80
    .turnin 12 >> 交任务：西部荒野人民军

step
    .xp <14,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .target 格里安·斯托曼
    .goto 1436/0,1045.12,-10508.80
    .accept 65 >> 接任务：迪菲亚兄弟会

step << skip
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹努文队长|r交谈
    .target 丹努文队长
    .goto 1436/0,1041.97,-10511.13
    .turnin 102 >> 交任务：西部荒野的豺狼人

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target 哨兵加里安
    .goto 1436/0,1126.67,-10636.670
    .turnin 153 >> 交任务：红色皮质面罩

step
    .goto 1436/0,1179.800,-10635.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿尔巴·晴月::253092|r交谈
    .target 阿尔巴·晴月::253092
    .turnin 92742 >>交任务：测试水井
    .turnin 92744 >>交任务：鱼人的鳃

step << !Skyborne
    .hs >> 炉石返回暴风城
    .bindlocation 16509,1
    .cooldown item,6948,>2,1
    .zoneskip Stormwind City
    .zoneskip Darkshore

step
    #completewith DarkshoreBoat
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >> 飞往暴风城
    .target 索尔
    .zoneskip Stormwind City
    .zoneskip Darkshore

step
    #optional
    #label endOfTheGuide

step << Human Rogue
    #ah
    .goto 1453/0,609.63,-8787.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    .vendor 1287 >>|cRXP_BUY_向她购买|r |T135343:0|t[战士阔剑]|cRXP_BUY_一把，或在拍卖行买更好的武器，并装备到副手|r
    .money <0.3815
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 玛尔达·维勒

step << Human Rogue
    #ssf
    .goto 1453/0,609.63,-8787.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    .vendor 1287 >>|cRXP_BUY_向她购买|r |T135343:0|t[战士阔剑]|cRXP_BUY_一把|r
    .money <0.3815
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 玛尔达·维勒

step << Skyborne
    #optional
    .goto 1453/0,673.58,-8867.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板奥里森|r交谈
    .home >> 将你的炉石设置为暴风城
    .target 旅店老板奥里森
    .bindlocation 16509

step << Skyborne
    #completewith next
    .goto 1453/0,562.300,-8385.300,20,0
    .goto 1453/0,522.000,-8352.101
    .subzone 2257 >>进入矿道地铁
    .zoneskip Ironforge

step << Skyborne
    #optional
    #label TramEnd
    >>|cRXP_WARN_乘坐矿道地铁前往铁炉堡一侧|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒙提|r交谈（矿道地铁铁炉堡一侧的中央站台）
    .accept 6661 >> 接任务：捕捉矿道老鼠
    .target 蒙提

step << Skyborne
    >>|cRXP_WARN_使用|r |T133942:0|t[捕鼠者之笛] |cRXP_WARN_对矿道地铁内的|r|cRXP_ENEMY_矿道老鼠|r|cRXP_WARN_吹奏|r
    .complete 6661,1 --Rats Captured (x5)
    .macro 捕鼠者之笛,133942 >>/targetexact 矿道老鼠\n/use item:17117
    .mob 矿道老鼠

step << Skyborne
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒙提|r交谈（矿道地铁内）
    .turnin 6661 >> 交任务：捕捉矿道老鼠
    .target 蒙提

step << Skyborne
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fp Ironforge >> 获取铁炉堡的飞行点
    .target 格莱斯·瑟登

step << Skyborne Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克斯|r和|cRXP_FRIENDLY_布里维夫·石手|r交谈
    >>如果之前还没学，就训练投掷武器和2H锤（双手锤）
    .train 2567 >> 学习[投掷]
    .target +比克斯
    .goto 1455/0,-1205.65,-5042.12
    .train 199 >> 学习双手锤（2h）
    .goto 1455/0,-1197.27,-5041.49
    .target +布里维夫·石手

step << Skyborne Warrior
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_向她购买|r |T135425:0|t[锋利的飞刀] |cRXP_BUY_。|r
    .collect 3107,1 --Collect Keen Throwing Knife (200)
    .target 布雷文·寒钢
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3

step << Skyborne Warrior
    #optional
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3

step << Skyborne
    .hs >> 炉石返回暴风城
    .bindlocation 16509,1
    .cooldown item,6948,>2,1
    .zoneskip Stormwind City
    .zoneskip Darkshore

step << Skyborne
    .goto Ironforge,76.61,51.28
    .subzone 2257 >>炉石无法使用时，进入矿道地铁返回暴风城
    .zoneskip Stormwind City
    .zoneskip Darkshore

step << Skyborne
    .zone Stormwind City >>乘坐矿道地铁返回暴风城
    .zoneskip Darkshore

step << !NightElf
    .goto 1453/0,596.400,-8831.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔曼·穆比|r交谈
    >>|cRXP_BUY_向他购买|r |T135435:0|t[普通木柴]|cRXP_BUY_一份和|r |T135237:0|t[燧石和火绒]|cRXP_BUY_一份|r
    >>|cRXP_WARN_这些材料用于乘船时制作|r |T135805:0|t[基础营火]，|cRXP_WARN_可顺便提升|r |T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_需要50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以完成之后暮色森林的任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .target 萨尔曼·穆比
    .skill cooking,50,1 --XX Shows if cooking skill is <50

step << !NightElf
    #ah
    .goto 1453/0,660.28,-8814.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_BUY_购买|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_BUY_和/或|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_BUY_，用于稍后提升|r |T133971:0|t[烹饪]|cRXP_BUY_技能|r
    >>|cRXP_WARN_需要50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以完成之后夜色镇的任务|r
    >>|cRXP_WARN_（可选） 如果不打算完成此步骤，或所需资源不足，请跳过|r
    >>|cRXP_BUY_购买以下物品，以便稍后在西部荒野和黑海岸更快交任务：|r
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
    .target 拍卖师亚克森
    .skill cooking,50,1 --XX Shows if cooking skill is <50

step << !NightElf
    #ah
    #optional
    .goto 1453/0,660.28,-8814.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_WARN_（可选） 如果不打算完成此步骤，或所需资源不足，请跳过|r
    >>|cRXP_BUY_购买以下物品，以便稍后在西部荒野和黑海岸更快交任务：|r
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target 拍卖师亚克森
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+

step << NightElf Hunter
    .goto 1453/0,706.15,-8795.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_向他购买|r|T135489:0|t[重型弯弓]|cRXP_BUY_一把。|r|cRXP_BUY_如果钱够，再购买|r|T135490:0|t[强化弓]|cRXP_BUY_和|r|T134410:0|t[中型箭袋]|cRXP_BUY_各一件|r
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .collect 11362,1 -- Medium Quiver (1)
    .collect 3026,1 --Reinforced Bow (1)
    .disablecheckbox
    .target 弗德瑞克·斯图瓦
    .money <0.7349
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20

step << Rogue
    .goto 1453/0,377.47,-8752.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯伯|r交谈
    .train 1758,1
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯

step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_武神|r或|cRXP_FRIENDLY_伊尔萨·考宾|r交谈
    .goto 1453/0,358.25,-8728.28,15,0
    .goto 1453/0,302.6,-8685.53,15,0
    .goto 1453/0,323.3,-8689.29
    .train 1160,1
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾

step << Hunter
    .goto 1453/0,552.78,-8415.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r（在屋内）交谈
    >>|cRXP_WARN_如果刚才已学习技能，请跳过此步骤|r
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛

step
    .goto 1453/0,719.67,-8550.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r交谈
    .turnin 399 >> 交任务：童年的记忆
    .target 巴隆斯·阿历克斯顿
    .isQuestComplete 399

step << NightElf Druid
    .goto 1453/0,1095.500,-8741.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞德兰|r交谈
    .trainer >>学习职业技能
    .target 塞瑞德兰

step << Warlock
    #optional
    #completewith next
    .goto 1453/0,988.44,-8942.15,20,0
    .goto 1453/0,1015.33,-8978.9,15 >> 前往[已宰的羔羊]并下楼

step << Warlock
    .goto 1453/0,1029.89,-8971.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >> 学习职业技能
    .train 6222,1
    .target 厄苏拉·德林

step << Mage
    #optional
    #completewith next
    .goto 1453/0,874.32,-9014.67,10 >> 前往法师塔

step << Mage
    .goto 1453/0,885.34,-9006.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .train 2137,1
    .trainer >> 学习职业技能
    .target 艾尔莎林

step << Priest/Paladin
    #optional
    #completewith train19742 << Paladin
    #completewith next << Priest
    .goto 1453/0,809.52,-8579.22,20 >> 前往 [暴风城大教堂]

step << Human Paladin
    .isOnQuest 1780
    .goto 1453/0,845.800,-8545.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin 1780 >>交任务：圣洁之书
    .target 达索瑞恩·拉尔

step << Paladin
    #label train19742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .goto 1453/0,859.13,-8559.14,10,0
    .goto 1453/0,861.14,-8573.03
    .trainer >> 学习职业技能
    .train 19742,1
    .target 虔诚的亚瑟

step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒修士|r交谈
    .goto 1453/0,862.89,-8519.61
    .trainer >> 学习职业技能
    .train 8122,1
    .target 乔舒修士

step
    #label NEWestfallEnd --hidden step for #include

step
    .goto 1453/0,765.700,-8804.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯瑟琳·利兰|r交谈
    >>|cRXP_BUY_向她购买一枚|r |T134335:0|t[闪光的小珠] |cRXP_BUY_和三条|r |T134324:0|t[夜色虫] |cRXP_BUY_，用于一个奖励900点经验的任务|r
    .collect 6529,1,95065,1 --|1/1 Shiny Bauble
    .collect 6530,3,95065,1 --|3/3 Nightcrawlers
    .target 凯瑟琳·利兰

step << Shaman -- Shaman accepts now isntead of later due to arriving back from tram, not boat like the rest
    .goto 1453/0,1193.100,-8328.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_货单登记员菲尔莫::268511|r交谈
    .target 货单登记员菲尔莫::268511
    .accept 97220 >>接任务：菲尔莫的请求

step
    .goto 1453/0,1269.100,-8540.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉尔伯特·格雷::267118|r交谈
    .target 吉尔伯特·格雷::267118
    .accept 95065 >>接任务：钓鱼时间
    .turnin 95065 >>交任务：钓鱼时间

step
    #label DockTravel
    .goto 1453/0,1330.100,-8645.400,30 >>前往开往黑海岸的船只码头
    .zoneskip Darkshore

step
    #optional
    #requires DockTravel
    #label DarkshoreCook1
    #completewith DarkshoreBoat
    >>|cRXP_WARN_在码头等船时：|r
    .cast 818 >>|cRXP_WARN_制作一个|r |T135805:0|t[基础营火] |cRXP_WARN_（在专业技能书中）|r
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
    >>|cRXP_WARN_在码头等船时：|r
    .cast 818 >>|cRXP_WARN_制作一个|r |T135805:0|t[基础营火] |cRXP_WARN_（在专业技能书中）|r
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
    >>|cRXP_WARN_在码头等船时：|r
    .cast 818 >>|cRXP_WARN_制作一个|r |T135805:0|t[基础营火] |cRXP_WARN_（在专业技能书中）|r
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
    +|cRXP_WARN_需要50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以完成之后暮色森林的任务|r
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
    #optional
    #requires DarkshoreCook4
    #label DarkshoreCook5
    #completewith DarkshoreBoat
    +|cRXP_WARN_需要50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以完成之后暮色森林的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
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
    +|cRXP_WARN_需要50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，以完成之后暮色森林的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1

step
    #optional
    .goto 1453/0,1330.100,-8645.400
    >>|cRXP_WARN_如有需要，等待前往黑海岸的船时提升|r|T135966:0|t[急救]|cRXP_WARN_技能|r
    .zone Darkshore >> 乘船前往黑海岸
    .skill firstaid,<1,1 -- shows if firstaid is >1

step
    #label DarkshoreBoat
    .goto 1453/0,1330.100,-8645.400
    .zone Darkshore >> 乘船前往黑海岸
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（联盟）
#subgroupdisplayname 1-20
#forever
#disabledungeons
#version 1
<< Alliance
#group RestedXP Forever Guide (A)
#subgroup Speedrun Guide 1-20
--#groupid RXP-SRGCE-A1
#name 14-16 Darkshore
#next 16-19 Darkshore
-- #displayname 11-16 Darkshore << NightElf/Dwarf Hunter !SoD
-- #displayname 15-17 Darkshore << !NightElf !Dwarf/!Hunter !SoD
-- #displayname 13-18 Darkshore << Dwarf Hunter/!NightElf sod
#displayname 11-16 黑海岸/洛克莫丹 << NightElf
#displayname 13-16 黑海岸 << Dwarf Hunter/Human Hunter/Skyborne Hunter
#displayname 15-16 黑海岸 << !NightElf/!Dwarf/!Human/!Skyborne Hunter

step << NightElf
    #label WashedA
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >> 接受任务 搁浅的巨兽
    .target 温尼斯·布莱葛

step << NightElf !Druid
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    .turnin 6342 >> 交任务：飞往奥伯丁
    .target 莱尔德

step << Druid NightElf
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    .turnin 6342 >> 交任务：飞往奥伯丁
    .accept 6343 >> 接任务：飞回泰达希尔
    .target 莱尔德

step << NightElf
    #optional
    #completewith next
    .goto 1439,36.826,44.150,5,0
    .goto 1439,36.688,43.952,8 >> 沿坡道上楼前往 |cRXP_FRIENDLY_维兹班恩·曲针|r

step << !NightElf
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .accept 963 >> 接受任务 永志不渝
    .target 塞瑞利恩·白爪
    .xp <11,1

step << !NightElf
    #optional
    #completewith next
    .goto 1439/1,525.800,6414.800,8 >> 沿坡道上楼前往 |cRXP_FRIENDLY_维兹班恩·曲针|r

step
    .goto 1439,36.976,44.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维兹班恩·曲针|r（楼上）交谈
    .accept 983 >> 接受任务 传声盒827号
    .target 维兹班恩·曲针

step
    .goto 1439/1,515.55,6406.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板莎希因|r（楼下）交谈
    .home >> 将你的炉石设置为奥伯丁
    .target 旅店老板莎希因
    .bindlocation 442

step
    #optional << NightElf
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >> 接受任务 洞中的蘑菇
    .target 巴瑞萨斯·月影
    .xp <12,1

step
    #optional << NightElf
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4811 >> 接受任务 红色水晶
    .target 哨兵戈琳达·纳希恩
    .xp <12,1

step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2118 >> 接受任务 瘟疫蔓延
    .target 萨纳瑞恩·绿树

step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 984 >> 接受任务 熊怪的威胁
    .target 特伦希斯

step
    .goto 1439/1,503.100,6402.100
    >>点击[|cRXP_PICK_通缉告示|r]
    .accept 98025 >>接任务：通缉：贾伊瓦内尔

step
    #ah
    #optional
    .goto 1439/1,577.38,6371.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接受任务 海中的水果 << !sod/Hunter/Druid
    .accept 1141 >> 接任务：钓鱼世家
    .turnin 1141 >> 交任务：钓鱼世家
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target 古博·布拉普
    .xp <15,1

step
    #ah
    .goto 1439/1,577.38,6371.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1141 >> 接任务：钓鱼世家
    .turnin 1141 >> 交任务：钓鱼世家
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target 古博·布拉普

step
    #optional
    .goto 1439/1,577.38,6371.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果
    .target 古博·布拉普
    .xp <15,1

step << !NightElf
    #label WashedA
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >> 接受任务 搁浅的巨兽
    .target 温尼斯·布莱葛

step << !NightElf
    .goto 1439/1,561.66,6343.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fp Auberdine >> 获取奥伯丁飞行点
    .target 凯莱斯·月羽

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    #optional
    #completewith RabidThistle
    #loop
    .goto 1439/1,272.54,5255.27,0
    .goto 1439/1,271.23,4902.88,0
    .goto 1439/1,438.91,5131.69,0
    .goto 1439/1,272.54,5255.27,40,0
    .goto 1439/1,271.23,4902.88,40,0
    .goto 1439/1,438.91,5131.69,40,0
    >>|cRXP_WARN_让宠物去攻击一只|r|cRXP_ENEMY_蓟熊|r|cRXP_WARN_。宠物被|r|cRXP_ENEMY_蓟熊|r|cRXP_WARN_击晕后，放弃宠物并开始驯服它|r
    .train 16828 >>|cRXP_WARN_施放|r |T132164:0|t[驯服野兽]，|cRXP_WARN_对|r|cRXP_ENEMY_蓟熊|r|cRXP_WARN_使用以驯服它|r
    .target 蓟熊
    .train 17255,1 --skips if they also already know bite r2

step
    #optional
    #completewith FirstWashed
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .subzoneskip 442

step
    #sticky
    #label BuzzBox1
    #loop
    .goto 1439,36.051,44.757,0
    .goto 1439,36.280,50.071,0
    .goto 1439,35.275,53.464,0
    .waypoint 1439,36.091,51.501,60,0
    .waypoint 1439,37.115,52.368,60,0
    .waypoint 1439,37.130,53.663,60,0
    .waypoint 1439,36.740,55.221,60,0
    .waypoint 1439,35.655,55.872,60,0
    .waypoint 1439,35.088,55.085,60,0
    .waypoint 1439,35.275,53.464,60,0
    .waypoint 1439,36.091,51.501,60,0
    .waypoint 1439,36.280,50.071,60,0
    .waypoint 1439,36.523,48.554,60,0
    .waypoint 1439,35.977,48.408,60,0
    .waypoint 1439,35.902,47.145,60,0
    .waypoint 1439,35.759,45.455,60,0
    .waypoint 1439,36.051,44.757,60,0
    >>击杀 |cRXP_ENEMY_小潮行蟹|r 和 |cRXP_ENEMY_暗礁蟹幼崽|r, 搜刮 |cRXP_LOOT_蟹腿|r
    >>|cRXP_WARN_你可能需要下水才能接近它们|r
    >>|cRXP_WARN_即使部分怪物已变成灰名，也要完成任务，因为它属于任务链|r << !NightElf
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
    .isOnQuest 983

step
    .goto 1439,36.371,50.920
    >>打开 |cRXP_PICK_搁浅的海洋生物|r, 拾取 |cRXP_LOOT_海洋生物的骸骨|r
    .complete 3524,1 --Sea Creature Bones (1)

step << Druid
    #ah
    #optional
    #completewith CliffspringEnd
    #label GatheringQ
    .skill herbalism,15 >>|cRXP_WARN_将|r |T136065:0|t[草药学]|cRXP_WARN_提升至15点，以便采集|r |T134187:0|t[地根草]|cRXP_WARN_，供稍后的重要职业任务使用。之后可以遗忘该专业|r
    >>|cRXP_WARN_如果打算稍后从拍卖行购买5株|r |T134187:0|t[地根草]|cRXP_WARN_，可以跳过此步骤|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox

step << Druid
    #ssf
    #optional
    #completewith CliffspringEnd
    #label GatheringQ
    .skill herbalism,15 >>|cRXP_WARN_将|r |T136065:0|t[草药学]|cRXP_WARN_提升至15点，以便采集5株|r |T134187:0|t[地根草]|cRXP_WARN_，供稍后的重要职业任务使用。之后可以遗忘该专业|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox

step << Druid
    #optional
    #completewith CliffspringEnd
    #requires GatheringQ
    >>|cRXP_WARN_收集5棵|T134187:0|t[地根草]，通过|T136065:0|t[草药学]采集；偶尔也能从|r|cRXP_PICK_破损的箱子|r|cRXP_WARN_中找到，供后续职业任务使用|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .skill herbalism,<15,1

step
    #completewith next
    >>|cRXP_WARN_使用|r |T134335:0|t[萨纳瑞恩的希望]，|cRXP_WARN_目标选择|r |cRXP_ENEMY_狂暴蓟熊|r--|cRXP_WARN_. It can be used from any range as long as you're targeting the|r |cRXP_ENEMY_Bear|r
    -->>|cRXP_WARN_==DO NOT USE THE QUEST ITEM IF THERES NO |cRXP_ENEMY_BEAR|r NEARBY==|r
    >>|cRXP_WARN_陷阱可能会被浪费，导致无法完成任务！如果发生这种情况，需要回到任务给予者处再索取一个陷阱|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .unitscan 狂暴蓟熊
    .use 7586

step
    #label FurlbogCamp
    .goto 1439/1,393.72,5993.24
    >>跑向熊怪营地的边缘
    .complete 984,1 -- Find a corrupt furbolg camp

step
    #sticky
    #label RabidThistle
    #loop
    .goto 1439,38.226,52.780,0
    .goto 1439,39.129,59.176,0
    .goto 1439,38.226,52.780,50,0
    .goto 1439,38.527,54.661,50,0
    .goto 1439,38.037,56.815,50,0
    .goto 1439,38.095,58.395,50,0
    .goto 1439,38.696,57.874,50,0
    .goto 1439,39.129,59.176,50,0
    >>|cRXP_WARN_使用|r |T134335:0|t[萨纳瑞恩的希望]，|cRXP_WARN_目标选择|r |cRXP_ENEMY_狂暴蓟熊|r--|cRXP_WARN_. It can be used from any range as long as you're targeting the bear|r
    -->>|cRXP_WARN_==DO NOT USE THE QUEST ITEM IF THERES NO BEAR NEARBY==|r
    >>|cRXP_WARN_陷阱可能会被浪费，导致无法完成任务！如果发生这种情况，需要回到任务给予者处再索取一个陷阱|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .unitscan 狂暴蓟熊
    .use 7586

step << NightElf
    #loop
    .goto 1439,36.051,44.757,0
    .goto 1439,36.280,50.071,0
    .goto 1439,35.275,53.464,0
    .goto 1439,36.051,44.757,60,0
    .goto 1439,35.759,45.455,60,0
    .goto 1439,35.902,47.145,60,0
    .goto 1439,35.977,48.408,60,0
    .goto 1439,36.523,48.554,60,0
    .goto 1439,36.280,50.071,60,0
    .goto 1439,36.091,51.501,60,0
    .goto 1439,37.115,52.368,60,0
    .goto 1439,37.130,53.663,60,0
    .goto 1439,36.740,55.221,60,0
    .goto 1439,35.655,55.872,60,0
    .goto 1439,35.088,55.085,60,0
    .goto 1439,35.275,53.464,60,0
    .goto 1439,36.091,51.501,60,0
    .xp 12-2500 >> 刷怪至至少6300/8800经验。

step
    #label invisThistle
    #optional
    #requires RabidThistle
    --XXREQ Placeholder invis step until multiple requires per step

step
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地上的|cRXP_PICK_传声盒 827 号|r
    .turnin 983 >> 交任务 传声盒827号
    .accept 1001 >> 接受任务 传声盒411号

step
    #label FirstWashed
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 3524 >> 交任务 搁浅的巨兽
    .accept 4681 >> 接受任务 搁浅的巨兽
    .target 温尼斯·布莱葛

step
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >> 前往码头对话 |cRXP_FRIENDLY_塞瑞利恩·白爪|r

step
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .accept 963 >> 接受任务 永志不渝
    .target 塞瑞利恩·白爪

step
    #optional
    #completewith SeaT1
    .goto 1439,32.432,43.744,15 >> 走到码头尽头，跳进水里

step
    #optional
    #completewith washed1
    .goto 1439/1,741.52,6570.95,0
    .goto 1439/1,915.10,6333.84,0
    .goto 1439/1,778.20,6231.66,0
    >>击杀 |cRXP_ENEMY_黑海岸蛇颈龙|r, 搜刮 |cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
    .isOnQuest 1001

step
    #label SeaT1
    .goto 1439,31.841,46.304
    >>打开 |cRXP_PICK_海龟骨头|r, 拾取 |cRXP_LOOT_海龟的残骸|r
    .complete 4681,1 --Sea Turtle Remains (1)

step
    #optional
    .goto 1439/1,577.38,6371.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果
    .target 古博·布拉普
    .xp <15,1

step
    #label washed1
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4681 >> 交任务 搁浅的巨兽
    .target 温尼斯·布莱葛

step << Druid NightElf
    #optional
    .xp 12 >> 刷到12级

step << Druid NightElf
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4811 >> 接受任务 红色水晶
    .target 哨兵戈琳达·纳希恩

step << Druid NightElf
    #optional
    #completewith Lunaclaw
    .goto 1439,43.126,45.593,15 >> 进入有|cRXP_PICK_月夜枭兽之石|r的洞穴

step << Druid NightElf
    #optional
    #completewith Lunaclaw
    .goto 1439/1,92.42,6325.98
    .cast 18974 >>|cRXP_WARN_使用|r |T132857:0|t[塞纳里奥月尘]|cRXP_WARN_，在洞穴内的|r|cRXP_PICK_月夜枭兽之石|r|cRXP_WARN_上召唤|r|cRXP_ENEMY_月爪枭兽|r|cRXP_WARN_，它会出现在洞口|r
    .timer 4,身心之力剧情
    .use 15208
    .isOnQuest 6001

step << Druid NightElf
    #label Lunaclaw
    .goto 1439/1,119.27,6344.32
    >>击杀|cRXP_ENEMY_月爪枭兽|r
    >>击败后，与出现的|cRXP_FRIENDLY_月爪枭兽的灵魂|r交谈，完成任务目标
    .complete 6001,1 --Defeat Lunaclaw (x1)
    .use 15208
    .mob 月爪枭兽

    .target 月爪枭兽的灵魂
step << Druid NightElf
    #label RedCrystal
    .isOnQuest 4811
    .goto 1439,47.314,48.676
    >>前往|cRXP_PICK_神秘的红水晶|r处
    >>|cRXP_WARN_小心那两组、每组2只的|r|cRXP_ENEMY_狂暴的月夜枭兽|r|cRXP_WARN_，它们位于|r|cRXP_PICK_神秘的红水晶|r|cRXP_WARN_西侧；彼此靠得最近的两只会一起进入战斗|r
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range

step << Druid NightElf
    #optional
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade

step << Druid NightElf
    #completewith next
    .goto 1450/1,-2400.33,7795.33--c:Moonglade,44.148,45.229
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔瓦·菲纳雯斯|r交谈
    .fly Teldrassil >> 飞往达纳苏斯
    .skipgossip
    .timer 153,达纳苏斯
    .target 希尔瓦·菲纳雯斯
    .zoneskip Darnassus
    .zoneskip Teldrassil

step << NightElf Druid
    .goto 1438/1,950.52,8694.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6343 >> 交任务：飞回泰达希尔
    .target 尼莎·影歌

step << NightElf Druid
    #optional
    #completewith next
    .goto 1438/1,965.80,8780.95
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯

step << Druid NightElf
    .goto 1457/1,2563.98,10179.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 6001 >> 交任务：身心之力 << NightElf
    .trainer >> 学习职业技能
    .target 玛斯雷·驭熊者
    .isOnQuest 6001

step << Druid NightElf
    #completewith next
    .goto 1457/1,2636.53,9956.80
    .zone Teldrassil >> 通过紫色传送门前往鲁瑟兰村。
    .zoneskip Darkshore
    .subzoneskip 702

step << Druid NightElf
    .goto 1438/1,841.10,8640.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >> 飞往黑海岸
    .target 维斯派塔斯
    .zoneskip Darkshore

step << Druid NightElf
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >> 交任务：红色水晶
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .isOnQuest 4811

step << Druid NightElf
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .isQuestTurnedIn 4811

step << Druid NightElf
    .isOnQuest 4812
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_使用|r |T134865:0|t[空水瓶]|cRXP_WARN_在奥伯丁的月亮井取水|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338

step
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >> 接受任务 洞中的蘑菇
    .target 巴瑞萨斯·月影

step
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4811 >> 接受任务 红色水晶
    .target 哨兵戈琳达·纳希恩

step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2118 >> 交任务：瘟疫蔓延
    .accept 2138 >> 接任务：清除疫病
    .target 萨纳瑞恩·绿树

step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 984 >> 交任务 熊怪的威胁
    .accept 985 >> 接受任务 熊怪的威胁
    .accept 4761 >> 接任务：桑迪斯·织风
    .target 特伦希斯

step << NightElf Warrior/NightElf Rogue
    #sticky
    #label DeepOceanStart
    .goto 1439,38.107,41.165,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >> 接任务：深不可测的海洋
    .target 高尔博德·钢手
    .xp <13,1

step << NightElf Warrior/NightElf Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库德拉姆·石锤|r和|cRXP_FRIENDLY_迪尔弗拉姆·火须|r交谈
    .train 2575 >> 学习 |T134708:0|t[采矿]
    .target +库德拉姆·石锤
    .goto 1439/1,436.36,6542.65
    .train 2018 >> 学习|T136241:0|t[锻造]
    .target +迪尔弗拉姆·火须
    .goto 1439/1,440.16,6545.84
    >>|cRXP_WARN_这样就可以制作|r|T135248:0|t[劣质磨刀石]|cRXP_WARN_，使近战伤害提高 2 点|r << Warrior/Rogue
    >>|cRXP_WARN_如果你不想做这个,请跳过此步骤|r

step << NightElf Warrior/NightElf Rogue
    #optional
    .goto 1439/1,443.37,6538.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_艾丽萨·钢拳|r
    >>|cRXP_BUY_从她那里购买|r |T134708:0|t[矿工锄] |cRXP_BUY_一把|r
    .target 艾丽萨·钢拳
    .collect 2901,1 -- Mining Pick (1)
    .train 2575,3 --Mining Trained

step << NightElf Warrior/NightElf Rogue
    #optional
    #completewith Bashal1
    .cast 2580 >> |cRXP_WARN_激活技能：|r|T136025:0|t[寻找矿物]
    .usespell 2580
    .train 2575,3 --Mining Trained

step << !NightElf/!Warrior !Rogue
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >> 接任务：深不可测的海洋
    .target 高尔博德·钢手
    .xp <13,1

step
    #optional
    #requires DeepOceanStart << NightElf Warrior/NightElf Rogue
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher

step << NightElf Rogue
    .goto 1439,37.575,40.348
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳拉姆·长爪|r
    .vendor 4183 >>|cRXP_BUY_向他购买|r |T135640:0|t[双刃弯刀]|cRXP_BUY_一把，前提是你买得起|r
    .equip 17,2207 >>将[双刃弯刀]装备到副手栏
    .collect 2207,1 -- Jambiya (1)
    .disablecheckbox
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.10
    --  .money <0.2390
    .target 纳拉姆·长爪

step
    #optional
    #completewith next
    .goto 1439/1,488.69,6564.830
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r（室内）交谈
    .vendor 4182 >> |cRXP_BUY_按需向他购买|r|T133634:0|t[棕色小袋]|cRXP_BUY_或|r|T133634:0|t[棕色小皮包]|cRXP_BUY_，补足所需数量|r
    >>|cRXP_BUY_购买|r|T132382:0|t[锋利的箭]|cRXP_BUY_或|r|T132384:0|t[重弹丸]|cRXP_BUY_，向他购买直到箭袋或弹药袋装满|r << Hunter
    .target 达蒙德

step
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .accept 954 >> 接任务：巴莎兰
    .accept 958 >> 接任务：上层精灵的工具 << !sod
    .target 桑迪斯·织风
    .xp >16,1
    --XX if 16+, skip Tools

step
    #optional
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .accept 954 >> 接任务：巴莎兰
    .target 桑迪斯·织风
    .xp >18,1
    --XX if 18+, skip Bashal

step
    #optional
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    ----Start of NE >1.49x catchup (everyone 1x) Early boat section----

step
    #completewith MistVeil
    .goto 1439/1,620.35,6768.76,0
    .goto 1439/1,602.66,6924.21,0
    .goto 1439/1,537.82,7023.33,0
    .goto 1439/1,404.85,7099.75,0
    .goto 1439/1,310.53,7077.48,0
    .goto 1439/1,620.35,6768.76,55,0
    .goto 1439/1,602.66,6924.21,55,0
    >>击杀 |cRXP_ENEMY_黑海岸蛇颈龙|r, 搜刮 |cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
    .isOnQuest 1001
    .isOnQuest 982

step
    #optional
    #completewith next
    +|cRXP_WARN_按 Esc 键, 进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选 "启用互动按键", 并将 "与目标互动" 选项绑定至一个快捷键|r

step
    .goto 1439,38.213,28.754
    --  .goto 1439,38.234,28.796
    >>|cRXP_WARN_==注意呼吸条 (氧气值)==|r
    >>|cRXP_WARN_从水下潜至船尾外侧|r
    >>|cRXP_WARN_在箭头位置, 按下 "与目标互动" 快捷键来在船体外部拾取 |r|cRXP_LOOT_银色清晨号的保险箱|r
    >>|cRXP_WARN_如果你不想这么做, 也可以潜入船内底层去拾取 |r|cRXP_LOOT_银色清晨号的保险箱|r
    .complete 982,1 --Silver Dawning's Lockbox (1)
    .isOnQuest 982

step
    #label MistVeil
    .goto 1439,39.581,27.487
    --  .goto 1439,39.629,27.462
    >>|cRXP_WARN_==注意呼吸条 (氧气值)==|r
    >>|cRXP_WARN_从水下潜至船尾外侧|r
    >>|cRXP_WARN_在箭头位置, 按下 "与目标互动" 快捷键来在船体外部拾取 |r|cRXP_LOOT_迷雾之纱号的保险箱|r
    >>|cRXP_WARN_如果你不想这么做, 就潜到船底层, 然后拿里面的 |r|cRXP_LOOT_迷雾之纱号的保险箱|r
    .complete 982,2 --Mist Veil Lockbox (1)
    .isOnQuest 982

step
    #loop
    .goto 1439/1,310.53,7077.48,0
    .goto 1439/1,404.85,7099.75,0
    .goto 1439/1,537.82,7023.33,0
    .goto 1439/1,310.53,7077.48,55,0
    .goto 1439/1,404.85,7099.75,55,0
    .goto 1439/1,537.82,7023.33,55,0
    .goto 1439/1,602.66,6924.21,55,0
    .goto 1439/1,620.35,6768.76,55,0
    .goto 1439/1,602.66,6924.21,55,0
    .goto 1439/1,620.35,6768.76,55,0
    >>击杀 |cRXP_ENEMY_黑海岸蛇颈龙|r, 搜刮 |cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
    .isOnQuest 1001

step
    #optional
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >> 接任务：搁浅的海洋生物
    .isOnQuest 1001

step
    #optional
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >> 接任务：搁浅的海洋生物
    .isOnQuest 982

step
    .goto 1439,41.960,28.616
    >>点击地上的|cRXP_PICK_传声盒 411 号|r
    .turnin 1001 >> 交任务：传声盒411号
    .accept 1002 >> 接任务：传声盒323号
    .isQuestComplete 1001

step
    #optional
    .goto 1439,41.960,28.616
    >>点击地上的|cRXP_PICK_传声盒 411 号|r
    .accept 1002 >> 接任务：传声盒323号
    .isQuestTurnedIn 1001

step
    #optional
    #completewith AsterionTravel
    .goto 1439,44.190,33.697,0
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r, 搜刮 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isQuestTurnedIn 1001
    ----End of NE >1.49x catchup (everyone 1x) Early boat section----

step
    #optional
    #completewith AsterionTravel
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟

step
    #optional
    #label AsterionTravel
    #completewith Bashal1
    .goto 1439,44.629,36.316,20,0
    .goto 1439,44.168,36.289,15 >> 前往 |cRXP_FRIENDLY_阿斯特利安|r 处

step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    >>|cRXP_WARN_途中避开|r|cRXP_ENEMY_野生劣魔|r|cRXP_WARN_和|r|cRXP_ENEMY_恶灵劣魔|r|cRXP_WARN_，暂时不要击杀|r
    .turnin 954 >> 交任务 巴莎兰
    .accept 955 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isOnQuest 954
    .xp >16,1
    --XX skip Bashal Aran qline if 16+

step
    #optional
    #label Bashal1
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    >>|cRXP_WARN_途中避开|r|cRXP_ENEMY_野生劣魔|r|cRXP_WARN_和|r|cRXP_ENEMY_恶灵劣魔|r|cRXP_WARN_，暂时不要击杀|r
    .turnin 954 >> 交任务 巴莎兰
    .target 阿斯特利安
    .isOnQuest 954
    --XX Turn in Breadcrumb if you picked it up earlier before 18

step
    #loop
    .goto 1439,44.528,36.587,0
    .goto 1439,45.334,39.393,0
    .goto 1439,46.096,36.541,0
    .goto 1439,44.528,36.587,50,0
    .goto 1439,44.435,37.404,50,0
    .goto 1439,44.443,38.202,50,0
    .goto 1439,44.493,39.008,50,0
    .goto 1439,44.821,39.711,50,0
    .goto 1439,45.334,39.393,50,0
    .goto 1439,45.167,38.652,50,0
    .goto 1439,45.091,37.865,50,0
    .goto 1439,45.495,37.019,50,0
    .goto 1439,45.831,36.790,50,0
    .goto 1439,46.096,36.541,50,0
    .goto 1439,46.906,36.171,50,0
    .goto 1439,47.431,36.151,50,0
    .goto 1439,47.022,37.083,50,0
    .goto 1439,47.166,37.580,50,0
    .goto 1439,45.827,36.812,50,0
    >>击杀 |cRXP_ENEMY_野生劣魔|r 和 |cRXP_ENEMY_恶灵劣魔|r, 搜刮 |cRXP_LOOT_劣魔耳环|r
    >>|cRXP_WARN_暂时不要杀 |r|cRXP_ENEMY_戴瑟雷萨特|r
    .complete 955,1 --Grell Earring (8)
    .mob 野生劣魔
    .mob 恶灵劣魔
    .isOnQuest 955

step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 955 >> 交任务 巴莎兰
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestComplete 955

step
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestTurnedIn 955

step
    #completewith EndFirstMoonstalker
    #optional
    .abandon 955 >> 放弃任务[巴莎兰]
    .isQuestAvailable 955

step
    #loop
    .goto 1439,45.393,36.472,0
    .goto 1439,45.429,39.773,0
    .goto 1439,47.368,36.774,0
    .goto 1439,45.393,36.472,45,0
    .goto 1439,45.938,37.800,45,0
    .goto 1439,45.938,38.040,45,0
    .goto 1439,46.531,39.134,45,0
    .goto 1439,45.429,39.773,45,0
    .goto 1439,47.262,37.674,45,0
    .goto 1439,47.920,37.228,45,0
    .goto 1439,47.368,36.774,45,0
    >>击杀 |cRXP_ENEMY_戴瑟雷萨特|r, 搜刮 |cRXP_LOOT_远古月亮石封印|r
    >>|cRXP_WARN_注意, 这些怪没有动态刷新|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob 戴瑟雷萨特
    .isQuestTurnedIn 955

step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 956 >> 交任务 巴莎兰
    .accept 957 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestComplete 956

step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .accept 957 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestTurnedIn 956

step << NightElf/Dwarf/Human Hunter
    #optional
    .goto 1439,44.528,36.587,0
    .goto 1439,45.334,39.393,0
    .goto 1439,46.096,36.541,0
    .goto 1439,44.528,36.587,50,0
    .goto 1439,44.435,37.404,50,0
    .goto 1439,44.443,38.202,50,0
    .goto 1439,44.493,39.008,50,0
    .goto 1439,44.821,39.711,50,0
    .goto 1439,45.334,39.393,50,0
    .goto 1439,45.167,38.652,50,0
    .goto 1439,45.091,37.865,50,0
    .goto 1439,45.495,37.019,50,0
    .goto 1439,45.831,36.790,50,0
    .goto 1439,46.096,36.541,50,0
    .goto 1439,46.906,36.171,50,0
    .goto 1439,47.431,36.151,50,0
    .goto 1439,47.022,37.083,50,0
    .goto 1439,47.166,37.580,50,0
    .goto 1439,45.827,36.812,50,0
    .xp 13 >> 刷怪升至13级

step
    #optional
    #completewith AuberdineTurnin2 << NightElf/Hunter/Druid/Warrior
    #completewith AmethStart << !NightElf !Hunter !Druid !Warrior
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .subzoneskip 442

step
    #optional
    #completewith AuberdineTurnin2 << NightElf/Hunter/Druid/Warrior
    #completewith EndFirstMoonstalker << !NightElf !Hunter !Druid !Warrior
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r, 搜刮 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isQuestTurnedIn 1001

step
    #completewith RedCrystal
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_练到10点|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,10,1 -- shows if cooking is <10
    .skill cooking,<1,1 -- shows if cooking is >1

step
    #completewith RedCrystal << !NightElf !Hunter !Druid !Warrior
    #completewith AuberdineTurnin2 << NightElf/Hunter/Druid/Warrior
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_练到50点|r
    >>|cRXP_WARN_现在不用特意刷小蛋；记得留好这些蛋，并估算烹饪升到50点还需要提升多少点技能|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,<10,1 --XX Shows if cooking skill is 10-50
    .skill cooking,50,1

step
    #label RedCrystal
    .goto 1439,47.314,48.676
    >>前往|cRXP_PICK_神秘的红水晶|r处
    >>|cRXP_WARN_小心那两组、每组2只的|r|cRXP_ENEMY_狂暴的月夜枭兽|r|cRXP_WARN_，它们位于|r|cRXP_PICK_神秘的红水晶|r|cRXP_WARN_西侧；彼此靠得最近的两只会一起进入战斗|r
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range
    ----Start of Early Red Crystal turnin Section (NE below 14 for xp, Hunters/Druids for staff wep upgrade)/Druid bear q final if not done earlier----

step << NightElf/Hunter/Warrior/Druid
    #optional
    #completewith Cascade
    .hs >> 炉石回奥伯丁
    .cooldown item,6948,>0,1
    .subzoneskip 442
    .isQuestTurnedIn 6001 << Druid

step << NightElf/Hunter/Druid/Warrior
    #optional
    #label AuberdineTurnin2
    #completewith Cascade
    .goto 1439,37.703,43.393
    .subzone 442 >> 返回奥伯丁
    .cooldown item,6948,<0,1 << !Druid

step << NightElf/Hunter/Druid/Warrior
    #optional
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >> 交任务：红色水晶
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .xp >14,1 << Hunter/Druid
    --XX If Night Elves, Hunters, or Druids are lower than level 14, do questline

step << Hunter/Druid/Warrior
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >> 交任务：红色水晶
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5 << Hunter/Druid
    --XX If Hunters and Druids (in Era) have a worse weapon than the Oakthrush Staff, do the quest even if 14+

step << NightElf/Hunter/Druid/Warrior !Hunter
    #optional
    #label Cascade
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .isQuestTurnedIn 4811 --show step if Red Crystal turned in

step << NightElf/Hunter/Druid/Warrior
    #optional
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_使用|r |T134865:0|t[空水瓶]|cRXP_WARN_在奥伯丁的月亮井取水|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338
    .isQuestTurnedIn 4811

step << NightElf/Hunter/Druid/Warrior
    #optional
    #completewith EndFirstMoonstalker
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .isQuestTurnedIn 4811

step << NightElf/Hunter/Druid/Warrior
    #optional
    #completewith EarlyCrystalEnd
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_练到10点|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,10,1 -- shows if cooking is <10
    .skill cooking,<1,1 -- shows if cooking is >1
    .isQuestTurnedIn 4811

step << NightElf/Hunter/Druid/Warrior
    #optional
    #completewith EarlyCrystalEnd
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_练到50点|r
    >>|cRXP_WARN_现在不用特意刷小蛋；记得留好这些蛋，并估算烹饪升到50点还需要提升多少点技能|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,<10,1 --XX Shows if cooking skill is 10-50
    .skill cooking,50,1
    .isQuestTurnedIn 4811

step << NightElf/Hunter/Druid/Warrior
    #optional
    #completewith EndFirstMoonstalker
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r, 搜刮 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isOnQuest 1002
    .isQuestTurnedIn 4811

step << NightElf/Hunter/Druid/Warrior
    .goto 1439,47.314,48.676
    #label EarlyCrystalEnd
    >>点击|cRXP_PICK_神秘的红水晶|r
    >>|cRXP_WARN_小心那两组、每组2只的|r|cRXP_ENEMY_狂暴的月夜枭兽|r|cRXP_WARN_，它们位于|r|cRXP_PICK_神秘的红水晶|r|cRXP_WARN_西侧；彼此靠得最近的两只会一起进入战斗|r
    .turnin 4812 >> 交任务：清洗水晶
    .accept 4813 >> 接任务：水晶中的碎骨
    .isQuestTurnedIn 4811

step << NightElf/Hunter/Druid/Warrior
    #optional
    #loop
    .goto 1439,46.918,48.630,0
    .goto 1439,45.338,54.337,0
    .goto 1439,45.108,49.184,0
    .goto 1439,45.322,44.756,0
    .goto 1439,46.918,48.630,60,0
    .goto 1439,46.233,49.578,60,0
    .goto 1439,46.110,50.828,60,0
    .goto 1439,45.766,51.560,60,0
    .goto 1439,45.652,52.729,60,0
    .goto 1439,45.338,54.337,60,0
    .goto 1439,44.817,53.601,60,0
    .goto 1439,44.398,52.137,60,0
    .goto 1439,44.424,50.766,60,0
    .goto 1439,45.090,50.415,60,0
    .goto 1439,45.108,49.184,60,0
    .goto 1439,44.578,48.547,60,0
    .goto 1439,44.311,47.903,60,0
    .goto 1439,43.577,46.772,60,0
    .goto 1439,42.237,46.108,60,0
    .goto 1439,42.715,45.372,60,0
    .goto 1439,43.101,44.400,60,0
    .goto 1439,45.322,44.756,60,0
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_练到10点|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,10,1 -- shows if cooking is <10
    .skill cooking,<1,1 -- shows if cooking is >1
    .isQuestTurnedIn 4811

step << NightElf !Hunter/Warrior/Druid
    #optional
    #completewith EndFirstMoonstalker
    .hs >> 炉石回奥伯丁
    .cooldown item,6948,>0,1
    .subzoneskip 442
    .isQuestTurnedIn 6001 << Druid
    .isQuestTurnedIn 4811

step << NightElf !Hunter/Druid/Warrior
    #optional
    #completewith next
    .goto 1439,37.703,43.393
    .subzone 442 >> 返回奥伯丁
    .cooldown item,6948,<0,1 << !Druid
    .isQuestTurnedIn 4811

step << NightElf !Hunter/Druid/Warrior
    .goto 1439/1,472.32,6438.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4813,3 >> 交任务：水晶中的碎骨
    .target 哨兵戈琳达·纳希恩
    .isQuestTurnedIn 4811

step << Druid/Warrior
    #optional
    #completewith AmethStart
    +|cRXP_WARN_装备|r |T135145:0|t[橡木法杖]
    .use 15397
    .itemcount 15397,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
    .isQuestTurnedIn 4811
    --reduced DPS now on staff due to it becoming a caster weapon

step << NightElf !Hunter/Druid/Warrior
    #optional
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .turnin 982 >> 交任务：深不可测的海洋
    .target 高尔博德·钢手
    .isQuestComplete 982
    ----Start of forced Level 14 Druid Turnin/train----
    --Removed in wowF
    ----End of forced Level 14 Druid Turnin/train----
    ----End of Early Red Crystal turnin Section (NE for xp, Hunters/Druids for staff)/Druid bear q final if not done earlier----

step << Druid
    #optional
    #completewith AmethStart
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .subzoneskip 447
    ----Start of alternate section if early Red Crystal turnin----

step << NightElf !Hunter/Druid/Warrior
    #optional
    #loop
    #label EarlyBlackwood
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>击杀 |cRXP_ENEMY_黑木探路者|r 和 |cRXP_ENEMY_黑木风语者|r
    .complete 985,1 -- Blackwood Pathfinder (8)
    .mob +黑木探路者
    .complete 985,2 -- Blackwood Windtalker (5)
    .mob +黑木风语者
    .isQuestTurnedIn 4811

step << NightElf !Hunter/Druid/Warrior
    #optional
    #completewith Anaya
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，如果杀得不够快，它们会施放 |r |T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：所有生命恢复降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
    .isQuestTurnedIn 4811
    .subzoneskip 447

step << NightElf !Hunter/Druid/Warrior
    #optional
    #label EarlyTurtleStart
    .goto 1439,37.105,62.167
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4722 >> 接受任务 搁浅的海龟
    .isQuestTurnedIn 4811

step
    #optional
    #label EarlyAmethStart
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 953 >> 接任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
    .isQuestTurnedIn 4811
    .xp >17,1

step
    #label EndFirstMoonstalker
    ----End of alternate section if early Red Crystal turnin----
    ----Start of small south loop for ERA and SoD Warrior/Rogue/Priest----

step
    #optional
    #completewith AmethStart
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
    .isQuestTurnedIn 1001
    .isQuestAvailable 4811

step << !NightElf !Druid !Warrior
    #loop
    .goto 1439,46.918,48.630,0
    .goto 1439,45.338,54.337,0
    .goto 1439,45.108,49.184,0
    .goto 1439,45.322,44.756,0
    .goto 1439,46.918,48.630,60,0
    .goto 1439,46.233,49.578,60,0
    .goto 1439,46.110,50.828,60,0
    .goto 1439,45.766,51.560,60,0
    .goto 1439,45.652,52.729,60,0
    .goto 1439,45.338,54.337,60,0
    .goto 1439,44.817,53.601,60,0
    .goto 1439,44.398,52.137,60,0
    .goto 1439,44.424,50.766,60,0
    .goto 1439,45.090,50.415,60,0
    .goto 1439,45.108,49.184,60,0
    .goto 1439,44.578,48.547,60,0
    .goto 1439,44.311,47.903,60,0
    .goto 1439,43.577,46.772,60,0
    .goto 1439,42.237,46.108,60,0
    .goto 1439,42.715,45.372,60,0
    .goto 1439,43.101,44.400,60,0
    .goto 1439,45.322,44.756,60,0
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_练到10点|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,10,1 -- shows if cooking is <10
    .skill cooking,<1,1 -- shows if cooking is >1

step
    #sticky
    #label Anaya
    .goto 1439,42.017,58.866,0 --NE spawn
    .goto 1439,43.222,59.693,0 --NE spawn
    .goto 1439,43.069,62.448,0 --SE spawn
    .goto 1439,42.489,60.677,0 --Middle spawn
    .waypoint 1439,42.017,58.866,50,0 --NE spawn
    .waypoint 1439,42.311,58.645,50,0
    .waypoint 1439,42.448,58.236,50,0
    .waypoint 1439,43.222,59.693,50,0 --NE spawn
    .waypoint 1439,43.447,60.131,50,0
    .waypoint 1439,43.780,60.275,50,0
    .waypoint 1439,43.069,62.448,50,0 --SE spawn
    .waypoint 1439,43.104,62.563,50,0
    .waypoint 1439,42.794,62.166,50,0
    .waypoint 1439,42.489,60.677,50,0 --Middle spawn
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_项链|r
    -->>|cRXP_WARN_Be aware that she has a 7-8 minute spawn time and 4 different spawnpoints across Ameth'Aran|r
    -->>|cRXP_WARN_You may want to group with others nearby if you can't find her. Ask in General Chat (/1) to group with anyone else that is also looking for her|r
    -->>|cRXP_WARN_If you can't find her and want to try again later at the cost of potentially grinding more mobs soon, skip this step|r
    --much faster spawn time now on forever
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路

step
    #sticky
    #label Relics
    .goto 1439,42.670,57.390,0
    .goto 1439,41.986,62.462,0
    .goto 1439,44.072,60.507,0
    .waypoint 1439,42.670,57.390,55,0
    .waypoint 1439,41.708,57.888,55,0
    .waypoint 1439,41.597,59.765,55,0
    .waypoint 1439,42.058,61.199,55,0
    .waypoint 1439,41.986,62.462,55,0
    .waypoint 1439,42.773,63.420,55,0
    .waypoint 1439,43.253,63.287,55,0
    .waypoint 1439,43.945,62.188,55,0
    .waypoint 1439,44.072,60.507,55,0
    .waypoint 1439,43.410,59.784,55,0
    .waypoint 1439,43.787,58.959,55,0
    >>击杀|cRXP_ENEMY_被诅咒的贵族|r、|cRXP_ENEMY_挣扎的贵族|r和|cRXP_ENEMY_哀嚎的贵族|r，拾取|cRXP_LOOT_遗物|r
    .complete 958,1 --Highborne Relic (7)
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
    .mob 哀嚎的贵族
    .isOnQuest 958

step
    #label AmethStart
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 953 >> 接任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
    .isQuestAvailable 4811
    .xp >17,1

step
    .goto 1439,42.652,63.145
    >>点击|cRXP_PICK_亚米萨兰的沦陷|r（石板）
    .complete 953,2 --Read The Fall of Ameth'Aran (1)
    .isOnQuest 953

step << !sod/Warrior/Rogue/Priest
    .goto 1439,42.373,61.815
    >>点击|cRXP_PICK_远古之火|r
    .complete 957,1 --Destroy the seal at the ancient flame (1)
    .isOnQuest 957

step
    #label TheLay
    .goto 1439/1,105.52,5770.100
    >>点击|cRXP_PICK_亚米萨兰的歌谣|r（石板）
    .complete 953,1 --Read The Lay of Ameth'Aran (1)
    .isOnQuest 953

step
    .isOnQuest 98025
    .waypoint 1439/1,-18.100,5779.800
    >>击杀|cRXP_ENEMY_贾伊瓦内尔|r，拾取|cRXP_LOOT_贾伊瓦内尔之羽|r
    .complete 98025,1 --|1/1 Feather of Jai'vhanel
    .mob 贾伊瓦内尔

step
    #optional
    #requires Relics
    --XXREQ Placeholder invis step until multiple requires per step

step
    #optional
    #requires Anaya
    --XXREQ Placeholder invis step until multiple requires per step

step
    .isQuestComplete 953
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .turnin 953 >> 交任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃

step << !sod/Warrior/Rogue
    #optional
    #completewith FurbolgGrind
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟雏鸟

step
    #optional
    #completewith FurbolgGrind
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
    .isOnQuest 1002

step
    #optional
    #completewith FurbolgGrind
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，如果杀得不够快，它们会施放 |r |T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：所有生命恢复降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step
    #label LateTurtleStart
    .goto 1439,37.105,62.167
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4722 >> 接受任务 搁浅的海龟

step
    #loop
    #label FurbolgGrind
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>击杀 |cRXP_ENEMY_黑木探路者|r 和 |cRXP_ENEMY_黑木风语者|r
    .complete 985,1 -- Blackwood Pathfinder (8)
    .mob +黑木探路者
    .complete 985,2 -- Blackwood Windtalker (5)
    .mob +黑木风语者

step
    #optional
    #completewith FurbolgGrindEnd
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .isQuestAvailable 2178

step
    #optional
    #completewith FurbolgGrindEnd
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r, 搜刮 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isOnQuest 1002

step
    #label FurbolgGrindEnd
    #completewith TOTH
    #optional
    .goto 1439,36.701,45.122
    .subzone 442 >> 返回奥伯丁
    .isOnQuest 4722

step
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin -4722 >> 交任务 搁浅的海龟
    .turnin -4723 >> 交任务 搁浅的海洋生物
    .target 温尼斯·布莱葛
    .isOnQuest 4722,4723

step
    #optional
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4722 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛

step
    .goto 1439/1,577.38,6371.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果
    .target 古博·布拉普
    .xp <15,1

step << !NightElf
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >> 回到码头去找|cRXP_FRIENDLY_塞瑞利恩·白爪|r

step << !NightElf
    #optional
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .turnin 963 >> 交任务：永志不渝
    .target 塞瑞利恩·白爪
    .isQuestComplete 963

step
    .isOnQuest 98025
    .goto 1439/1,472.900,6439.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩::2930|r交谈
    .target 哨兵戈琳达·纳希恩::2930
    .turnin 98025 >>交任务：通缉：贾伊瓦内尔
    .turnin 4813,3 >> 交任务：水晶中的碎骨 << NightElf Hunter

step << NightElf Hunter
    #optional
    .goto 1439/1,472.900,6439.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩::2930|r交谈
    .target 哨兵戈琳达·纳希恩::2930
    .turnin 4813,3 >> 交任务：水晶中的碎骨

step << NightElf Hunter
    #optional
    #completewith CliffspringEnd
    +|cRXP_WARN_装备|r |T135145:0|t[橡木法杖]
    .use 15397
    .itemcount 15397,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
    .isQuestTurnedIn 4811
    --reduced DPS now on staff due to it becoming a caster weapon

step
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >> 交任务：红色水晶
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .isOnQuest 4811

step
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4812 >>接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .isQuestTurnedIn 4811

step
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_使用|r |T134865:0|t[空水瓶]|cRXP_WARN_在奥伯丁的月亮井取水|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338

step
    #optional
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >> 交任务：清除疫病
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
    .isQuestComplete 2138

step
    #optional
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
    .isQuestTurnedIn 2138

step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 985 >> 交任务 熊怪的威胁
    .accept 986 >> 接受任务 丢失的主人 << !sod
    .target 特伦希斯

step
    #optional
    #completewith next
    .goto 1439,39.280,43.121,6,0
    .goto 1439,39.162,43.194,6 >> 上楼

step
    .goto 1439,39.043,43.555
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵艾莉萨·星风|r（楼上）交谈
    .accept 965 >> 接受任务 奥萨拉克斯之塔
    .target 哨兵艾莉萨·星风

step
    #optional
    #completewith Level10CookEnd
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .vendor 6301 >>|cRXP_BUY_向他购买|r |T134059:0|t[甜香料]|cRXP_BUY_，直到持有的|r |T134059:0|t[甜香料]|cRXP_BUY_数量等于或超过当前持有的|r |T132832:0|t[小蛋]|cRXP_BUY_数量|r
    .collect 2678,50,90,1,0x20,cooking --Mild Spices (1-50)
    .disablecheckbox
    .collect 6889,50,90,1,0x20,cooking --Small Egg (1-50)
    .disablecheckbox
    .target 高尔博德·钢手
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .itemcount 6889,1 -- Small Egg (1+)

step << NightElf
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .vendor >>|cRXP_BUY_向他购买一个|r[闪光的小珠]|cRXP_BUY_和三份|r|T134324:0|t[夜色虫]|cRXP_BUY_，稍后在暴风城做任务时会用到|r
    .collect 6529,1 --Shiny Bauble (1)
    .collect 6530,3 --Nightcrawlers (3)
    .target 高尔博德·钢手

step
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >> 接任务：深不可测的海洋
    .target 高尔博德·钢手

step
    #optional
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .turnin 982 >> 交任务：深不可测的海洋
    .target 高尔博德·钢手
    .isQuestComplete 982

step
    #label Level10CookEnd
    .goto 1439,37.511,41.670
    >>|cRXP_WARN_前往地上的|r|cRXP_PICK_营火|r
    +|cRXP_WARN_开始用|r |T133971:0|t[烹饪]制作 |T132834:0|t[草药烘蛋]|cRXP_WARN_，重复制作直到你的|r |T133971:0|t[烹饪]|cRXP_WARN_至少达到10点|r
    >>|cRXP_WARN_继续提升|r |T133971:0|t[烹饪]|cRXP_WARN_直到用完|r |T132832:0|t[小蛋] << !sod
    >>|cRXP_WARN_暮色森林稍后有一个任务要求|r |T133971:0|t[烹饪]|cRXP_WARN_达到50点或更高。你也可以在稍后乘船时烹饪|r << !sod
    >>|cRXP_WARN_做好所有|r |T132834:0|t[草药烘蛋]后即可跳过此步骤
    .skill cooking,50,1
    .itemcount 6889,1 -- Small Egg (1+)

step
    #optional
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher

step
    #label TOTH
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 958 >> 交任务：上层精灵的工具
    .accept 97914 >>接任务：拓宽视野 << NightElf
    .target 桑迪斯·织风
    .isQuestComplete 958
    ----End of small south loop for ERA and SoD Warrior/Rogue/Priest----

step << NightElf
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_桑迪斯·织风|r 交谈
    .accept 97914 >>接任务：拓宽视野
    .target 桑迪斯·织风
    .xp <13,1

step << NightElf
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >> 回到码头去找|cRXP_FRIENDLY_塞瑞利恩·白爪|r

step << NightElf
    #optional
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .turnin 963 >> 交任务：永志不渝
    .target 塞瑞利恩·白爪
    .isQuestComplete 963

step
    #label DarkshoreEndNE --hidden step for #include

step  << NightElf
    #include 15-16 Loch Modan

step << NightElf
    .goto 1439/1,577.38,6371.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果
    .target 古博·布拉普

step
    #optional
    #completewith next
    +|cRXP_WARN_按 Esc 键, 进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选 "启用互动按键", 并将 "与目标互动" 选项绑定至一个快捷键|r

step
    .goto 1439,38.213,28.754
    --  .goto 1439,38.234,28.796
    >>|cRXP_WARN_==注意呼吸条 (氧气值)==|r
    >>|cRXP_WARN_从水下潜至船尾外侧|r
    >>|cRXP_WARN_在箭头位置, 按下 "与目标互动" 快捷键来在船体外部拾取 |r|cRXP_LOOT_银色清晨号的保险箱|r
    >>|cRXP_WARN_如果你不想这么做, 也可以潜入船内底层去拾取 |r|cRXP_LOOT_银色清晨号的保险箱|r
    .complete 982,1 --Silver Dawning's Lockbox (1)
    .isOnQuest 982

step
    #label MistVeil
    .goto 1439,39.581,27.487
    --  .goto 1439,39.629,27.462
    >>|cRXP_WARN_==注意呼吸条 (氧气值)==|r
    >>|cRXP_WARN_从水下潜至船尾外侧|r
    >>|cRXP_WARN_在箭头位置, 按下 "与目标互动" 快捷键来在船体外部拾取 |r|cRXP_LOOT_迷雾之纱号的保险箱|r
    >>|cRXP_WARN_如果你不想这么做, 就潜到船底层, 然后拿里面的 |r|cRXP_LOOT_迷雾之纱号的保险箱|r
    .complete 982,2 --Mist Veil Lockbox (1)
    .isOnQuest 982

step
    #optional
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >> 接任务：搁浅的海洋生物
    .isOnQuest 982
    ----End of NE >1.49x catchup (everyone 1x) Final boat section----

step
    #optional
    #completewith BoatSeaCreature
    .goto 1439,44.190,33.697,0
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
    .isOnQuest 1002

step
    #optional
    #completewith BoatSeaCreature
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟

step
    #optional
    #completewith BoatSeaCreature
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_练到50点|r
    >>|cRXP_WARN_现在不用特意刷小蛋；记得留好这些蛋，并估算烹饪升到50点还需要提升多少点技能|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .subzoneskip 446 --BashalAran
    .subzoneskip 452 --Mists Edge
    --   .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 10-50

step
    .goto 1439,47.314,48.676
    >>点击|cRXP_PICK_神秘的红水晶|r
    >>|cRXP_WARN_小心那2组、每组2只的|r|cRXP_ENEMY_狂暴的月夜枭兽|r|cRXP_WARN_，它们位于|r|cRXP_PICK_神秘的红水晶|r|cRXP_WARN_西侧；彼此靠得最近的两只会一起进入战斗|r
    .turnin 4812 >> 交任务：清洗水晶
    .accept 4813 >> 接任务：水晶中的碎骨

step
    #label BashalEnd
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 957 >> 交任务：巴莎兰
    .isOnQuest 957
    .target 阿斯特利安

step
    #optional
    #completewith CrabTurtle
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，如果杀得不够快，它们会施放 |r |T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：所有生命恢复降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step
    #label BoatSeaCreature
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >> 接任务：搁浅的海洋生物

step
    #optional
    #completewith CrabTurtle
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r和|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，|r|cRXP_ENEMY_森林陆行鸟雏鸟|r生命值低于30%时会 |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .mob 森林陆行鸟

step
    #optional
    #completewith CrabTurtle
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
    .isOnQuest 1002

step
    #label CrabTurtle
    .goto 1439/1,47.88,7433.800
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4725 >> 接任务：搁浅的海龟

step
    #optional
    #completewith next
    .goto 1439,45.004,21.344,0
    .goto 1439,48.013,21.409,0
    .goto 1439,49.680,22.468,0
    .goto 1439,45.004,21.344,70,0
    .goto 1439,45.468,20.336,70,0
    .goto 1439,47.356,20.559,70,0
    .goto 1439,48.013,21.409,70,0
    .goto 1439,48.612,20.745,70,0
    .goto 1439,49.680,22.468,70,0
    .goto 1439,49.313,24.271,70,0
    >>击杀|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    >>|cRXP_WARN_如果掉落情况不错，可以考虑跳过一部分17级的|r|cRXP_ENEMY_暗礁蟹|r|cRXP_WARN_。|r|cRXP_WARN_你现在不必完成此任务|r
    >>|cRXP_WARN_小心，它们可以施放|r |T132155:0|t[撕裂肌肉]|cRXP_WARN_，这是造成30-55点伤害的瞬发攻击|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 暗礁蟹

step
    .goto 1439/1,-386.39,7219.830
    >>|cRXP_WARN_使用|r |T134865:0|t[空的水样试管]|cRXP_WARN_在壁泉河下游取样|r
    .complete 4762,1 --Cliffspring River Sample (1)
    .use 12350

step
    #optional
    #completewith next
    .goto 1439,51.118,23.670,20,0
    .goto 1439,51.288,24.554,12 >>沿着坡道向上前往 |cRXP_PICK_传声盒 323 号|r
    .isQuestComplete 1002

step
    #optional
    .goto 1439,51.288,24.554
    >>点击地上的|cRXP_PICK_传声盒 323 号|r
    .turnin 1002 >> 交任务：传声盒323号
    .accept 1003 >> 接任务：传声盒525号
    .isQuestComplete 1002

step
    .goto 1439,51.288,24.554
    >>点击地上的|cRXP_PICK_传声盒 323 号|r
    .accept 1003 >> 接任务：传声盒525号
    .isQuestTurnedIn 1002
    ----Start of Hunter/Druid 1x early Althalaxx section (for money+xp)----

step << Hunter/Druid
    #optional
    #completewith Tower1
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，如果杀得不够快，它们会施放 |r |T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：所有生命恢复降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step << Hunter/Druid
    #optional
    #completewith Tower1
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟

step << Hunter/Druid
    #optional
    #completewith Tower1
    >>击杀 |cRXP_ENEMY_月夜猛虎|r, 搜刮 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎
    .isOnQuest 1002

step << Hunter/Druid
    #optional
    #completewith Tower1
    .goto 1439,51.118,23.670,20,0
    .goto 1439,51.490,24.368,30,0
    .goto 1439,54.973,24.885,15 >>前往 |cRXP_FRIENDLY_巴苏尔·影击|r 处
    .isQuestAvailable 1002 << !NightElf/Hunter

step << Hunter/Druid
    #label Tower1
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 965 >> 交任务 奥萨拉克斯之塔
    .accept 966 >> 接受任务 奥萨拉克斯之塔
    .target 巴苏尔·影击

step << Hunter/Druid
    #loop
    .goto 1439,55.231,26.508,0
    .goto 1439,56.194,27.071,0
    .goto 1439,56.047,26.586,0
    .goto 1439,55.231,26.508,50,0
    .goto 1439,55.369,27.025,50,0
    .goto 1439,55.763,26.695,50,0
    .goto 1439,55.815,26.972,50,0
    .goto 1439,56.194,27.071,50,0
    .goto 1439,56.790,27.621,50,0
    .goto 1439,57.278,26.311,50,0
    .goto 1439,57.046,26.234,50,0
    .goto 1439,56.544,26.598,50,0
    .goto 1439,56.047,26.586,50,0
    .goto 1439,55.743,25.915,50,0
    >>击杀 |cRXP_ENEMY_暗滩狂热者|r, 搜刮 |cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob 暗滩狂热者

step << Hunter/Druid
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 966 >> 交任务 奥萨拉克斯之塔
    .accept 967 >> 接受任务 奥萨拉克斯之塔
    .target 巴苏尔·影击

step << Hunter/Druid
    #loop
    .goto 1439,53.629,26.054,0
    .goto 1439,54.204,30.475,0
    .goto 1439,49.775,30.351,0
    .goto 1439,48.894,26.514,0
    .goto 1439,53.629,26.054,60,0
    .goto 1439,52.764,26.312,60,0
    .goto 1439,53.049,27.983,60,0
    .goto 1439,53.899,28.638,60,0
    .goto 1439,54.204,30.475,60,0
    .goto 1439,51.267,32.319,60,0
    .goto 1439,50.689,32.001,60,0
    .goto 1439,50.818,30.486,60,0
    .goto 1439,49.775,30.351,60,0
    .goto 1439,49.776,28.393,60,0
    .goto 1439,49.902,27.511,60,0
    .goto 1439,49.558,26.087,60,0
    .goto 1439,48.894,26.514,60,0
    .goto 1439,48.022,27.199,60,0
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟
    ----End of Hunter/Druid 1x and SoD Warrior early Althalaxx section (for money+xp)----

step
    #optional
    #completewith CliffCave
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，如果杀得不够快，它们会施放 |r |T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：所有生命恢复降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step
    #optional
    #completewith CliffCave
    >>击杀 |cRXP_ENEMY_月夜猛虎|r, 搜刮 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎
    .isOnQuest 1002

step
    #optional
    #loop
    .goto 1439,53.629,26.054,0
    .goto 1439,54.204,30.475,0
    .goto 1439,49.775,30.351,0
    .goto 1439,48.894,26.514,0
    .goto 1439,53.629,26.054,60,0
    .goto 1439,52.764,26.312,60,0
    .goto 1439,53.049,27.983,60,0
    .goto 1439,53.899,28.638,60,0
    .goto 1439,54.204,30.475,60,0
    .goto 1439,51.267,32.319,60,0
    .goto 1439,50.689,32.001,60,0
    .goto 1439,50.818,30.486,60,0
    .goto 1439,49.775,30.351,60,0
    .goto 1439,49.776,28.393,60,0
    .goto 1439,49.902,27.511,60,0
    .goto 1439,49.558,26.087,60,0
    .goto 1439,48.894,26.514,60,0
    .goto 1439,48.022,27.199,60,0
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟
    .itemcount 5469,3 --Strider Meat (3+)
    ----XX Start from West Side if 3+

step
    #loop
    .goto 1439,53.629,26.054,0
    .goto 1439,54.204,30.475,0
    .goto 1439,49.775,30.351,0
    .goto 1439,48.894,26.514,0
    .goto 1439,48.022,27.199,60,0
    .goto 1439,48.894,26.514,60,0
    .goto 1439,49.558,26.087,60,0
    .goto 1439,49.902,27.511,60,0
    .goto 1439,49.776,28.393,60,0
    .goto 1439,49.775,30.351,60,0
    .goto 1439,50.818,30.486,60,0
    .goto 1439,50.689,32.001,60,0
    .goto 1439,51.267,32.319,60,0
    .goto 1439,54.204,30.475,60,0
    .goto 1439,53.899,28.638,60,0
    .goto 1439,53.049,27.983,60,0
    .goto 1439,52.764,26.312,60,0
    .goto 1439,53.629,26.054,60,0
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟

step
    #optional
    .goto 1439,51.288,24.554
    >>点击地上的|cRXP_PICK_传声盒 323 号|r
    .turnin 1002 >> 交任务：传声盒323号
    .accept 1003 >> 接任务：传声盒525号
    .isQuestComplete 1002
    .subzoneskip 456,1 --Only turnin if you're nearby (Cliffspring River)

step
    #optional
    #completewith next
    #label CliffCave
    .goto 1439,54.934,32.721,20,0
    .goto 1439,55.108,33.600,40 >> 前往壁泉河洞穴

step << Druid
    .goto 1439/1,-660.18,6874.43
    >>|cRXP_WARN_使用|r |T134776:0|t[空的峭壁之泉取样器]|cRXP_WARN_在壁泉河洞穴入口处的水中取样|r
    .complete 6122,1 --Filled Cliffspring Falls Sampler (1)
    .isOnQuest 6122

step
    #label CaveMushrooms
    .goto 1439/1,-690.31,6751.29,12,0
    .goto 1439/1,-706.68,6748.23,12,0
    .goto 1439/1,-719.13,6787.530,12,0
    >>拾取地面上的|cRXP_LOOT_粗柄蘑菇|r和|cRXP_LOOT_毒帽蘑菇|r
    >>|cRXP_WARN_待在上层区域。如果顶部尽头没有|r|cRXP_LOOT_毒帽蘑菇|r|cRXP_WARN_，就跳下去从下方南侧房间获取一个|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_雷鳞御浪者|r|cRXP_WARN_会施放 |r |T135836:0|t[水流喷射]|cRXP_WARN_（远程瞬发：对附近敌人造成伤害并击退），别站在会被打下洞穴上层边缘的位置|r
    .complete 947,1 --Scaber Stalk (5)
    .goto 1439/1,-663.45,6877.49,8,0
    .goto 1439/1,-679.17,6848.67,8,0
    .goto 1439/1,-666.73,6819.41,8,0
    .goto 1439/1,-680.48,6779.67,8,0
    .goto 1439/1,-663.45,6877.49,8,0
    .goto 1439/1,-679.17,6848.67,8,0
    .goto 1439/1,-666.73,6819.41,8,0
    .goto 1439/1,-680.48,6779.67,8,0
    .goto 1439/1,-663.45,6877.49
    .complete 947,2 --Death Cap (1)
    .goto 1439/1,-685.72,6746.49
    -- step << NightElf !Druid
    --     #softcore
    --     #optional
    --     #completewith CavetoAuber
    --     .deathskip >> Die and respawn at the |cRXP_FRIENDLY_Spirit Healer|r
    --     .target Spirit Healer

step << skip --logout skip
    #optional
    #label MushroomLS
    #completewith CavetoAuber
    .goto 1439,54.964,34.536
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_跳上洞穴顶层岩石顶部，调整角色直到看起来像在漂浮，然后登出再登入执行登出跳过|r

step
    #completewith CavetoAuber
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .isQuestAvailable 2178

step
    #completewith CavetoAuber
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
    .isOnQuest 1002

step
    #optional
    #label CavetoAuber
    #completewith CliffspringEnd
    .subzone 442 >> 前往奥伯丁

step
    #label CliffspringEnd
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4762 >> 交任务：壁泉河
    .accept 4763 >> 接任务：黑木熊怪的堕落
    .target 桑迪斯·织风

step
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
    .itemcount 5469,5 -- strider meat (5)

step << Druid
    #optional
    .isOnQuest 6122
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .turnin 6122 >> 交任务：毒水之源
    .accept 6123 >> 接任务：收集解药
    .target 奥兰达利亚·夜歌

step << Druid
    #optional
    .isQuestTurnedIn 6122
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 6123 >> 接任务：收集解药
    .target 奥兰达利亚·夜歌

step << !NightElf
    #optional
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >> 接任务：健忘的勘察员
    .target 考古学家霍莉
    .isQuestComplete 2138

step
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .turnin 982 >> 交任务：深不可测的海洋
    .target 高尔博德·钢手

step << !NightElf
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >> 接任务：健忘的勘察员
    .target 考古学家霍莉

step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >> 交任务：清除疫病
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
    .isQuestComplete 2138

step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
    .isQuestTurnedIn 2138

step
    .goto 1439/1,472.32,6438.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    >>|cRXP_WARN_选择|r |T135641:0|t[曲木匕首]|cRXP_WARN_作为奖励；记得留一把|r |T135641:0|t[匕首]|cRXP_WARN_供之后的|r |T132290:0|t[毒药]|cRXP_WARN_任务使用|r << Rogue
    .turnin 4813 >> 交任务：水晶中的碎骨
    .target 哨兵戈琳达·纳希恩

step
    .goto 1439/1,467.08,6409.38
    >>|cRXP_WARN_使用|r |T133748:0|t[空的净化碗]|cRXP_WARN_在奥伯丁的月亮井取水|r
    .collect 12347,1,4763,1 --Filled Cleansing Bowl (1)
    .use 12346
    .isOnQuest 4763

step
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .turnin 947 >> 交任务：洞中的蘑菇
    .accept 948 >> 接任务：安努
    .target 巴瑞萨斯·月影

step
    .goto 1439/1,504.41,6402.39
    >>点击[|cRXP_PICK_通缉告示|r]
    .accept 4740 >> 接任务：通缉：莫克迪普！
    -- step << NightElf !Druid
    --     .goto 1439,36.767,44.285
    --     #optional
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laird|r
    --     .accept 6343 >> Accept Return to Nessa
    --     .isQuestAvailable 6343
    --     .target Laird

step
    #optional
    .goto 1439/1,577.38,6371.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >> 交任务：海中的水果
    .target 古博·布拉普
    .isQuestComplete 1138

step
    #optional
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4723 >> 交任务：搁浅的海洋生物
    .turnin 4725 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛
    .isOnQuest 4723

step
    #optional
    #label End
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4725 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛
    ----Start of Druid Quest section----

step << Druid
    #optional
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    .xp 16 >> 去刷怪升到 16 级
    .mob 黑木探路者
    .mob 黑木风语者

step << Druid
    #optional
    #completewith DruidLesson
    .goto 1439/1,561.66,6343.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fly Teldrassil >> 飞往泰达希尔
    .target 凯莱斯·月羽

step << NightElf Druid
    #optional
    .goto 1438/1,950.52,8694.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6343 >> 交任务：飞回泰达希尔
    .target 尼莎·影歌

step << Druid
    #optional
    #label DruidLesson
    #completewith next
    .goto 1438/1,965.80,8780.95
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯

step << Druid
    .goto 1457/1,2563.98,10179.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .accept 26 >> 接任务：必修的课程
    .trainer >> 学习职业技能
    .target 玛斯雷·驭熊者

step << Druid
    #optional
    #completewith next
    .abandon 729 >> 放弃任务[健忘的勘察员]，接受任务[黑海岸的麻烦事]

step << NightElf Druid
    .goto 1438/1,2607.86,9641.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .accept 730 >> 接任务：黑海岸的麻烦事
    .target 首席考古学家杜瑟·灰须

step << Druid
    #optional
    #completewith TotL
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade

step << Druid
    .goto 1450/1,-2676.22,8019.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 26 >> 交任务：必修的课程
    .accept 29 >> 接任务：湖中试炼
    .target 德迪利特·星焰

step << Druid
    .goto 1450/1,-2595.43,7697.24
    >>游进月神湖
    >>打开一个|cRXP_PICK_神殿灵珠容器|r，获取 |T134125:0|t[神殿灵珠]
    >>|cRXP_WARN_它可能在水下不同位置刷新|r
    .collect 15877,1,29,1 -- Shrine Bauble (1)

step << Druid
    #optional
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .itemcount 15877,1 -- Shrine Bauble (1)

step << Druid
    .goto 1450/1,-2212.85,7854.68
    >>|cRXP_WARN_使用|r |T134125:0|t[神殿灵珠]|cRXP_WARN_，地点在雷姆洛斯神殿的树旁|r
    .complete 29,1 --Complete the Trial of the Lake.
    .use 15877

step << Druid
    #label TotL
    .goto 1450/1,-2224.18,7874.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔加里|r交谈
    .turnin 29 >> 交任务：湖中试炼
    .accept 272 >> 接任务：海狮试炼
    .target 塔加里

step << Druid
    #optional
    .cooldown item,6948,>2
    .hs >> 炉石回黑海岸
    .zoneskip Darkshore
    ----End of Druid Quest section----

step << Druid
    .goto Moonglade,48.0,67.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_辛德拉尔|r 交谈
    .fly Auberdine >>炉石无法使用时，飞回奥伯丁
    .target 辛德拉尔
    .zoneskip Darkshore
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（联盟）
#subgroupdisplayname 1-20
#forever
#disabledungeons
#version 1
<< Alliance
#defaultfor None
#group RestedXP Forever Guide (A)
#subgroup Speedrun Guide 1-20
--#groupid RXP-SRGCE-A1
#name 15-16 Loch Modan
#displayname 15-16 洛克莫丹

step
    #label SWBoat
    .goto 1439/1,929.100,6543.600
    >>|cRXP_WARN_提升|r |T135966:0|t[急救] |cRXP_WARN_技能，利用等船的时间练习|r << Rogue/Warrior
    .zone Stormwind City >> 乘船前往暴风城
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Ironforge
    .zoneskip Wetlands
    .zoneskip Stormwind City
    .zoneskip Redridge Mountains

step
    .goto 1453/0,1268.800,-8540.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吉尔伯特·格雷|r 交谈
    .accept 95065 >>接任务：钓鱼时间
    .turnin 95065 >>交任务：钓鱼时间
    .target 吉尔伯特·格雷

step << Rogue/Warrior/Hunter
    .goto 1453/0,1194.500,-8332.101
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_货单登记员菲尔莫::268511|r 交谈
    .target 货单登记员菲尔莫::268511
    .accept 97220 >>接任务：菲尔莫的请求

step << Rogue/Warrior/Hunter
    #completewith next
    .goto 1453/0,1194.200,-8360.900,10,0
    .goto 1453/0,1076.300,-8408.500,15,0
    .goto 1453/0,1001.400,-8499.700,10,0
    .goto 1453/0,985.500,-8471.300,15,0
    .goto 1453/0,960.100,-8501.800,15,0
    .goto 1453/0,981.200,-8581.800,15,0
    .goto 1453/0,875.500,-8680.900,10 >> 离开暴风港
    --@TODO add new coords for harbor exit cus no philmor's favor

step << Druid
    .goto 1453/0,1095.500,-8741.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞瑞德兰|r 交谈
    .trainer >>学习职业技能
    .target 塞瑞德兰

step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔舒修士|r 交谈
    .goto 1453/0,862.89,-8519.61
    .trainer >> 学习职业技能
    .target 乔舒修士

step
    .goto 1453/0,719.67,-8550.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r 交谈
    .turnin -97914 >> 交任务：拓宽视野
    .accept 97926 >> 接任务：勉强度日
    --    .accept 399 >> Accept Humble Beginnings
    .target 巴隆斯·阿历克斯顿

step << Rogue/Warrior/Hunter
    .goto 1453/0,613.12,-8795.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吴平|r 交谈
    .train 201 >> 学习单手剑（1h） << Rogue
    .train 202 >> 学习双手剑（2h） << Warrior/Hunter
    .target 吴平

step << Rogue/Warrior/Hunter
    .goto 1453/0,568.700,-8848.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊莱恩·提亚斯::483|r 交谈
    .target 伊莱恩·提亚斯::483
    .turnin 97220 >>交任务：菲尔莫的请求
    .accept 97222 >>接任务：门楼货物

step << Rogue/Warrior/Hunter
    .goto 1453/0,569.400,-8860.300
    >>走到 |cRXP_WARN_楼上|r，使用 |T132762:0|t[|cRXP_LOOT_门楼货物|r]，将其放在 |cRXP_PICK_门楼库房门|r 前
    .use 277198 --Gatehouse Shipment
    .complete 97222,1 --|1/1 Gatehouse Shipment delivered

step << Rogue/Warrior/Hunter
    #label Gatehouse
    .goto 1453/0,566.900,-8847.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊莱恩·提亚斯::483|r 交谈
    .target 伊莱恩·提亚斯::483
    .turnin 97222 >>交任务：门楼货物

step << Rogue
    .goto 1453/0,377.47,-8752.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 交谈
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯

step << Hunter
    .goto 1453/0,552.78,-8415.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_恩瑞斯·锐矛|r 交谈
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛

step << Hunter
    .goto 1453/0,553.22,-8422.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡瑞娜·麦肯达|r 交谈
    .trainer 2879 >> 学习宠物技能
    .target 卡瑞娜·麦肯达

step
    #label DeeprunEnter
    #completewith next
    .goto 1453/0,562.300,-8385.300,20,0
    .goto 1453/0,522.000,-8352.101
    .subzone 2257 >>进入矿道地铁
    .zoneskip Ironforge
    .zoneskip Loch Modan
    .zoneskip Dun Morogh

step
    #completewith next
    .zone Ironforge >> 乘坐地铁前往铁炉堡
    .zoneskip Loch Modan
    .zoneskip Dun Morogh

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒙提|r 交谈，他在矿道地铁中间的站台上，|cRXP_WARN_注意是在铁炉堡这一侧！|r
    .accept 6661 >> 接任务：捕捉矿道老鼠
    .target 蒙提

step
    >>使用 |T133942:0|t[捕鼠者之笛]，对矿道地铁中的 |cRXP_FRIENDLY_矿道老鼠|r 吹奏
    .complete 6661,1 --Rats Captured (x5)
    .macro 捕鼠者之笛,133942 >>/targetexact 矿道老鼠\n/use item:17117
    .mob 矿道老鼠

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒙提|r 交谈，他在矿道地铁中间的站台上
    .turnin 6661 >> 交任务：捕捉矿道老鼠
    .target 蒙提

step
    #completewith next
    .zone Ironforge >> 离开地铁，进入铁炉堡。
    .zoneskip Loch Modan
    .zoneskip Dun Morogh

step
    >> |Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺恩|r交谈
    .accept 2039 >> 接任务：寻找宾格斯
    .target 诺恩
    .goto Ironforge,69.182,50.556

step
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 交谈
    .fp Ironforge >> 开通铁炉堡飞行点
    .target 格莱斯·瑟登

step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比尔班·飞钳|r 交谈
    .goto Ironforge,65.905,88.405
    .trainer >> 学习职业技能
    .target 比尔班·飞钳

step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比克斯|r 和 |cRXP_FRIENDLY_布里维夫·石手|r 交谈
    >>如果之前还没学，就学习投掷武器和双手锤（2h）
    .train 2567 >> 学习投掷武器
    .target +比克斯
    .goto 1455/0,-1205.65,-5042.12
    .train 199 >> 学习双手锤（2h）
    .goto 1455/0,-1197.27,-5041.49
    .target +布里维夫·石手

step << Warrior
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与 |cRXP_FRIENDLY_布雷文·寒钢|r 交谈
    >>|cRXP_BUY_购买|r |T135425:0|t[锋利的飞刀]，|cRXP_BUY_由她出售|r
    .collect 3107,1 --Collect Keen Throwing Knife (200)
    .target 布雷文·寒钢
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3

step << Warrior
    #optional
    #completewith LochEnter
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3

step
    #label IFExit

step
    #completewith next
    .zone Dun Morogh >> 前往丹莫罗

step
    .goto Dun Morogh,59.9,49.5,30,0
    .goto Dun Morogh,61.2,47.2,15,0
    .goto Dun Morogh,62.1,47.3,20 >>沿斜坡上去，前往 |cRXP_ENEMY_瓦加什|r 处

step
    #completewith next
    +将 |cRXP_ENEMY_瓦加什|r 风筝到 |cRXP_FRIENDLY_鲁德拉·冻石|r 处
    >>|cRXP_WARN_尽量避免靠近他，否则他会施放|r |T135848:16|t[冰川咆哮]，|cRXP_WARN_将你击晕 3 秒|r
    .mob 瓦加什

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:16|t与 |cRXP_FRIENDLY_鲁德拉·冻石|r 交谈
    .goto Dun Morogh,63.1,49.8
    .target 鲁德拉·冻石
    .accept 314 >>接任务：保护牲畜

step
    >>将 |cRXP_ENEMY_瓦加什|r 风筝到 |cRXP_FRIENDLY_丹莫罗巡山人|r 处
    >>|cRXP_WARN_确保你对他造成至少 50% 的伤害|r
    .goto Dun Morogh,62.8,54.6,10,0
    .mob 瓦加什
    .target 丹莫罗巡山人
    .complete 314, 1

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:16|t与 |cRXP_FRIENDLY_鲁德拉·冻石|r 交谈
    .goto Dun Morogh, 63.1, 49.8
    .target 鲁德拉·冻石
    .turnin 314 >>交任务：保护牲畜

step
    #label LochEnter
    .goto 1432,16.494,58.424,20,0
    .goto 1432,19.594,62.735,20,0
    .goto 1432,20.749,64.326,20,0
    .goto 1432,21.106,65.007,20,0
    .goto 1432,21.388,66.357,20,0
    .goto 1432,21.498,67.840
    .subzone 924 >> 穿过南门小径，进入洛克莫丹
    .zoneskip Loch Modan

step
    .goto 1432/0,-2602.54,-5832.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人库伯弗林特|r 交谈
    .accept 224 >> 接任务：保卫国王的领土
    .target 巡山人库伯弗林特

step
    #optional
    #completewith next
    .goto 1432/0,-2635.61,-5879.14,12,0
    .goto 1432/0,-2645.27,-5874.91,12,0
    .goto 1432/0,-2631.48,-5847.50,12 >> 进入地堡，前往顶层

step
    .goto 1432/0,-2634.59,-5842.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉格弗斯上尉|r 交谈，他在地堡内
    .accept 267 >> 接任务：穴居人的威胁
    .target 拉格弗斯上尉

step
    .goto 1432/0,-2729.40,-5534.96
    >>击杀 |cRXP_ENEMY_碎石穴居人|r 和 |cRXP_ENEMY_碎石怪斥候|r，拾取 |cRXP_LOOT_穴居人的石牙|r
    >>|cRXP_WARN_小心 |r|cRXP_ENEMY_碎石怪斥候|r|cRXP_WARN_ 施放|r |T132222:0|t[射击]，|cRXP_WARN_远程攻击造成 14-20 点伤害|r
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
    #optional
    #completewith next
    #label Thelsamar
    .subzone 144 >> 前往塞尔萨玛

step
    #completewith next
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡德雷尔|r 交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_沿着穿过塞尔萨玛的道路巡逻|r
    .accept 416 >> 接任务：狗头人的耳朵
    .accept 1339 >> 接任务：巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔

step
    #label ThelsamarFirst

step
    #optional
    #completewith StormpikeO
    .abandon 1338 >> 放弃“卡尔·雷矛的订单”，以便接取“巡山人卡尔·雷矛的任务”，交任务即可获得 550 经验

step
    #label StormpikeO
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto 1432/0,-3006.61,-5259.57,15,0
    .goto 1432/0,-3020.95,-5282.02,15,0
    .goto 1432/0,-3023.44,-5326.90,15,0
    .goto 1432/0,-3007.99,-5337.390,15,0
    .goto 1432/0,-2964.41,-5349.90,15,0
    .goto 1432/0,-2894.90,-5401.96,20,0
    .goto 1432/0,-3007.99,-5337.390
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡德雷尔|r 交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_沿着穿过塞尔萨玛的道路巡逻|r
    .accept 416 >> 接任务：狗头人的耳朵
    .accept 1339 >> 接任务：巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔

step
    .goto 1432/0,-2929.87,-5424.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索格拉姆·伯雷森|r 交谈
    .fp Thelsamar >> 开通塞尔萨玛飞行点
    .target 索格拉姆·伯雷森

step
    #optional
    #completewith KingsLands
    >>击杀 |cRXP_ENEMY_老黑熊|r，拾取 |cRXP_LOOT_熊肉|r
    >>击杀 |cRXP_ENEMY_山猪|r，拾取 |cRXP_LOOT_猪大肠|r
    >>击杀 |cRXP_ENEMY_森林潜伏者|r，拾取 |cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
    >>|cRXP_WARN_保留所有|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r，|cRXP_WARN_用于提升 |T133971:0|t[烹饪] |r|cRXP_WARN_技能，稍后会用到|r
    >>|cRXP_WARN_现在不必专程完成，稍后还会返回洛克莫丹|r

step
    #optional
    #completewith next
    .goto 1432/0,-2677.26,-5778.34,10,0
    .goto 1432/0,-2648.30,-5876.75,15 >> 沿土路上去，再跳进地堡

step
    .goto 1432/0,-2634.59,-5842.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉格弗斯上尉|r 交谈，他在地堡内
    .turnin 267 >> 交任务：穴居人的威胁
    .target 拉格弗斯上尉
    .isQuestComplete 267

step
    #label KingsLands
    .goto 1432/0,-2602.54,-5832.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人库伯弗林特|r 交谈
    .turnin 224 >> 交任务：保卫国王的领土
    .target 巡山人库伯弗林特
    .isQuestComplete 224

step
    #optional
    #completewith Algaz
    >>击杀 |cRXP_ENEMY_老黑熊|r，拾取 |cRXP_LOOT_熊肉|r
    >>击杀 |cRXP_ENEMY_山猪|r，拾取 |cRXP_LOOT_猪大肠|r
    >>击杀 |cRXP_ENEMY_森林潜伏者|r，拾取 |cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
    >>|cRXP_WARN_保留所有|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r，|cRXP_WARN_用于提升 |T133971:0|t[烹饪] |r|cRXP_WARN_技能，稍后会用到|r
    >>|cRXP_WARN_现在不必专程完成，稍后还会返回洛克莫丹|r
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
    .goto 1432,24.279,17.959,12 >> 进入地堡，前往顶层

step
    #label Stormpike1
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r 交谈，他在地堡内
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务
    .accept 307 >> 接任务：肮脏的爪子
    .target 巡山人卡尔·雷矛

step
    #completewith Gear
    #optional
    #loop
    .goto 1432/0,-2684.71,-5042.87,0
    .goto 1432/0,-2712.57,-5286.61,0
    .goto 1432/0,-3033.92,-4797.29,0
    .waypoint 1432/0,-3033.92,-4797.29,50,0
    .waypoint 1432/0,-2972.41,-4796.92,50,0
    .waypoint 1432/0,-2684.71,-5042.87,50,0
    .waypoint 1432/0,-2712.57,-5286.61,50,0
    >>击杀 |cRXP_ENEMY_坑道鼠|r，拾取 |cRXP_LOOT_坑道鼠的耳朵|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob +坑道鼠斥候
    .mob +坑道鼠歹徒
    .mob +坑道鼠征粮官
    .mob +坑道鼠地卜师
    .mob +坑道鼠掘地工
    .mob +坑道鼠勘探员

step
    #optional
    #label SilverMine
    #completewith next
    .goto 1432/0,-2972.96,-4835.187,20 >> 进入银泉矿洞

step
    .goto 1432/0,-2984.82,-4902.33
    >>打开矿洞内的 |cRXP_PICK_矿工联盟的箱子|r，拾取 |cRXP_LOOT_矿工装备|r
    .complete 307,1 --Miners' Gear (4)

step << Warrior
    #ssf
    #label Gear
    .goto 1432/0,-3176.16,-4669.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔伦·安德玛|r 交谈
    >>|cRXP_BUY_购买|r |T133476:0|t[重型尖刺钉锤] |cRXP_BUY_或|r |T133053:0|t[铁木槌]，|cRXP_BUY_向他购买（如果有货）|r
    >>|cRXP_WARN_如果钱不够，就击杀附近的 |r|cRXP_ENEMY_坑道鼠|r|cRXP_WARN_，直到攒够钱|r
    >>|cRXP_WARN_尽快购买，其他玩家可能抢先买走|r
    >>|cRXP_WARN_不想这样做可以跳过此步骤|r
    .collect 4778,1,307,1 --Heavy Spiked Mace (1)
    .collect 4777,1,307,1 --Ironwood Maul (1)
    .target 尼尔伦·安德玛
    .itemcount 4778,<1 --Heavy Spiked Mace (<1)
    .itemcount 4777,<1 --Ironwood Maul (<1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8

step << Warrior
    #ah
    #label Gear
    .goto 1432/0,-3176.16,-4669.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔伦·安德玛|r 交谈
    >>|cRXP_BUY_购买|r |T133476:0|t[重型尖刺钉锤] |cRXP_BUY_或|r |T133053:0|t[铁木槌]，|cRXP_BUY_向他购买（如果有货）|r
    >>|cRXP_WARN_如果钱不够，就击杀附近的 |r|cRXP_ENEMY_坑道鼠|r|cRXP_WARN_，直到攒够钱|r
    >>|cRXP_WARN_尽快购买，其他玩家可能抢先买走|r
    >>|cRXP_WARN_如果不想这样做，或想稍后去拍卖行寻找更便宜或更好的武器，就跳过此步骤|r
    .collect 4778,1,307,1 --Heavy Spiked Mace (1)
    .collect 4777,1,307,1 --Ironwood Maul (1)
    .target 尼尔伦·安德玛
    .itemcount 4778,<1 --Heavy Spiked Mace (<1)
    .itemcount 4777,<1 --Ironwood Maul (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8

step << Warrior
    #optional
    #completewith PawsDelivery
    +|cRXP_WARN_装备|r |T133476:0|t[重型尖刺钉锤]
    .use 4778
    .itemcount 4778,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp <14,1

step << Warrior
    #optional
    #completewith PawsDelivery
    +|cRXP_WARN_装备|r |T133053:0|t[铁木槌]
    .use 4777
    .itemcount 4777,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7
    .xp <13,1

step
    #label Gear

step
    .goto 1432/0,-2684.71,-5042.87,0
    .goto 1432/0,-2712.57,-5286.61,0
    .goto 1432/0,-3033.92,-4797.29,0
    .goto 1432/0,-3033.92,-4797.29,50,0
    .goto 1432/0,-2972.41,-4796.92,50,0
    .goto 1432/0,-2684.71,-5042.87,50,0
    .goto 1432/0,-2712.57,-5286.61,50,0
    .goto 1432/0,-3033.92,-4797.29,50,0
    .goto 1432/0,-2972.41,-4796.92
    >>击杀 |cRXP_ENEMY_坑道鼠|r，拾取 |cRXP_LOOT_坑道鼠的耳朵|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob +坑道鼠斥候
    .mob +坑道鼠歹徒
    .mob +坑道鼠征粮官
    .mob +坑道鼠地卜师
    .mob +坑道鼠掘地工
    .mob +坑道鼠勘探员

step
    #optional
    #completewith PawsDelivery
    >>击杀 |cRXP_ENEMY_老黑熊|r，拾取 |cRXP_LOOT_熊肉|r
    >>击杀 |cRXP_ENEMY_山猪|r，拾取 |cRXP_LOOT_猪大肠|r
    >>击杀 |cRXP_ENEMY_森林潜伏者|r，拾取 |cRXP_LOOT_蜘蛛的毒液|r
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
    .goto 1432,24.279,17.959,15 >> 进入地堡

step
    #optional
    #completewith next
    .goto 1432/0,-2659.45,-4822.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高索·布鲁姆|r 交谈
    .vendor 1362 >>|cRXP_WARN_按需出售杂物并修理装备|r
    .target 高索·布鲁姆

step
    #label PawsDelivery
    .goto 1432/0,-2676.99,-4825.980
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r 交谈
    .turnin 307 >> 交任务：肮脏的爪子
    .accept 1338 >> 接任务：卡尔·雷矛的订单
    .target 巡山人卡尔·雷矛

step
    >>击杀 |cRXP_ENEMY_老黑熊|r，拾取 |cRXP_LOOT_熊肉|r
    >>击杀 |cRXP_ENEMY_山猪|r，拾取 |cRXP_LOOT_猪大肠|r
    >>击杀 |cRXP_ENEMY_森林潜伏者|r，拾取 |cRXP_LOOT_蜘蛛的毒液|r
    .collect 3173,3,418,1 --Bear Meat (3)
    .mob +老黑熊
    .goto 1432/0,-2735.74,-4684.34,90,0
    .goto 1432/0,-2846.07,-4682.50,90,0
    .goto 1432/0,-2782.63,-4770.80,90,0
    .goto 1432/0,-2835.04,-4976.83,90,0
    .goto 1432/0,-2915.03,-5044.89,90,0
    .goto 1432/0,-3080.53,-5100.08,90,0
    .goto 1432/0,-2735.74,-4684.34,90,0
    .goto 1432/0,-2846.07,-4682.50,90,0
    .goto 1432/0,-2782.63,-4770.80,90,0
    .goto 1432/0,-2835.04,-4976.83,90,0
    .goto 1432/0,-2915.03,-5044.89,90,0
    .goto 1432/0,-3080.53,-5100.08,90,0
    .goto 1432/0,-2735.74,-4684.34
    .collect 3172,3,418,1 --Boar Intestines (3)
    .mob +山猪
    .goto 1432/0,-3041.92,-5129.51,90,0
    .goto 1432/0,-3017.09,-5219.65,90,0
    .goto 1432/0,-2815.73,-5147.91,90,0
    .goto 1432/0,-2757.81,-4952.91,90,0
    .goto 1432/0,-2782.63,-4903.25,90,0
    .goto 1432/0,-3041.92,-5129.51,90,0
    .goto 1432/0,-3017.09,-5219.65,90,0
    .goto 1432/0,-2815.73,-5147.91,90,0
    .goto 1432/0,-2757.81,-4952.91,90,0
    .goto 1432/0,-2782.63,-4903.25,90,0
    .goto 1432/0,-3041.92,-5129.51
    .collect 3174,3,418,1 --Spider Ichor (3)
    .mob +森林潜伏者
    .goto 1432/0,-2873.66,-4789.19,90,0
    .goto 1432/0,-2766.08,-4866.45,90,0
    .goto 1432/0,-2926.07,-5232.53,90,0
    .goto 1432/0,-2992.27,-5055.93,90,0
    .goto 1432/0,-3069.5,-5078.01,90,0
    .goto 1432/0,-2873.66,-4789.19,90,0
    .goto 1432/0,-2766.08,-4866.45,90,0
    .goto 1432/0,-2926.07,-5232.53,90,0
    .goto 1432/0,-2992.27,-5055.93,90,0
    .goto 1432/0,-3069.5,-5078.01,90,0
    .goto 1432/0,-2873.66,-4789.19

step
    #completewith FlintTinder
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡德雷尔|r 交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_沿着穿过塞尔萨玛的道路巡逻|r
    .target 巡山人卡德雷尔
    .turnin 416 >> 交任务：狗头人的耳朵

step
    #optional
    #completewith FlintTinder
    .goto 1432,35.273,47.750,10,0
    .goto 1432,35.433,48.243,12 >> 进入烈酒旅店

step
    .goto 1432/0,-2954.42,-5394.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维德拉·壁炉|r 交谈
    .accept 418 >> 接任务：塞尔萨玛血肠
    .turnin 418 >> 交任务：塞尔萨玛血肠
    .target 维德拉·壁炉

step
    #label FlintTinder
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.24,47.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吉恩·角盔|r 交谈
    .accept 436 >> 接任务：铁环挖掘场
    .target 吉恩·角盔

step
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto 1432/0,-3006.61,-5259.57,15,0
    .goto 1432/0,-3020.95,-5282.02,15,0
    .goto 1432/0,-3023.44,-5326.90,15,0
    .goto 1432/0,-3007.99,-5337.390,15,0
    .goto 1432/0,-2964.41,-5349.90,15,0
    .goto 1432/0,-2894.90,-5401.96,20,0
    .goto 1432/0,-3007.99,-5337.390
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡德雷尔|r 交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_沿着穿过塞尔萨玛的道路巡逻|r
    .target 巡山人卡德雷尔
    .turnin 416 >> 交任务：狗头人的耳朵

step
    #loop
    .goto 1432/0,-3319.800,-5217.600,20,0
    .goto 1432/0,-3251.5499,-5285.8790,20,0
    .goto 1432/0,-3342.5748,-5484.5540,20,0
    .goto 1432/0,-3386.7082,-5462.4790,20,0
    .goto 1432/0,-3319.800,-5217.600,0
    .goto 1432/0,-3251.5499,-5285.8790,0
    .goto 1432/0,-3342.5748,-5484.5540,0
    .goto 1432/0,-3386.7082,-5462.4790,0
    >>点击湖底的 |cRXP_PICK_被丢弃的钓鱼工具箱|r
    >>|cRXP_WARN_注意：它可能出现在多个不同地点。在附近游动，直到小地图上出现感叹号|r
    >>|cRXP_WARN_小心等级较高的|r |cRXP_ENEMY_幼年蛇颈龙|r
    .accept 86614 >>接任务：浪中银饰

step
    .goto Loch Modan,64.89,66.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦格玛尔·落斧|r 交谈
    .turnin 436 >> 交任务：铁环挖掘场
    .target 麦格玛尔·落斧

step
    .goto Loch Modan,65.934,65.622
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_勘察员基恩萨·铁环|r 交谈
    .accept 298 >> 接任务：挖掘进度报告
    .target 勘察员基恩萨·铁环

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_年轻的达瑞尔|r 交谈
    .accept 257 >> 接任务：自豪的猎人
    .goto Loch Modan,83.49,65.40
    .target 年轻的达瑞尔

step << Rogue/NightElf Hunter/NightElf Warrior/NightElf Druid
    .goto Loch Modan,82.6,64.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_凯特|r 交谈
    .vendor >> |cRXP_BUY_购买|r |T132539:0|t[轻便靴]，|cRXP_BUY_如果有货就向她购买|r
    .target 凯特·桑普森

step
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
    >>|cRXP_WARN_必须完成任务并返回 |r|cRXP_FRIENDLY_年轻的达瑞尔|r|cRXP_WARN_ 处，时限为 15 分钟。如果失败，就放弃任务后重新接取|r
    .complete 257,1 -- Mountain Buzzard slain (6)
    .mob 山鹫

step
    #completewith next
    .goto Loch Modan,82.92,59.37,80,0
    .goto Loch Modan,83.28,62.97,25 >> 前往 |cRXP_FRIENDLY_年轻的达瑞尔|r 处

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_年轻的达瑞尔|r 交谈
    .goto Loch Modan,83.49,65.40
    .turnin 257 >> 交任务：自豪的猎人
    .target 年轻的达瑞尔

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马雷克·铁心|r 交谈
    .accept 385 >> 接任务：捕猎鳄鱼
    .accept 86758 >>接任务：扭动刀刃
    .goto Loch Modan,81.76,61.66
    .target 马雷克·铁心

step
    #completewith next
    >>击杀 |cRXP_ENEMY_洛克鳄|r，拾取 |cRXP_LOOT_鳄鱼肉|r 和 |cRXP_LOOT_鳄鱼皮|r
    .complete 385,1 -- Crocolisk Meat (5)
    .complete 385,2 -- Crocolisk Skin (6)
    .mob 洛克鳄

step
    .goto Loch Modan,62,44
    >>击杀 |cRXP_ENEMY_刀齿鳄|r，它 |cRXP_WARN_可能沿岸巡逻|r。拾取 |T3736888:0|t[|cRXP_LOOT_马雷克的猎鳄小刀|r]
    .complete 86758,1 --Marek's Croc Hunting Knife (1)
    .mob 刀齿鳄

step
    .goto 48,81.647,64.750
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_宾格斯·雷管|r交谈
    .target 宾格斯·雷管
    .turnin 2039 >> 交任务：寻找宾格斯

step
    #completewith next
    .goto Loch Modan,54.7,38.3,200 >> 前往洛克湖中央的小岛

step
    .goto Loch Modan,58.86,38.32,80,0
    .goto Loch Modan,54.80,40.02,60,0
    .goto Loch Modan,54.16,35.79,60,0
    .goto Loch Modan,54.72,38.15
    >>击杀 |cRXP_ENEMY_洛克鳄|r，拾取 |cRXP_LOOT_鳄鱼肉|r 和 |cRXP_LOOT_鳄鱼皮|r
    .complete 385,1 -- Crocolisk Meat (5)
    .complete 385,2 -- Crocolisk Skin (6)
    .mob 洛克鳄

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马雷克·铁心|r 交谈
    .turnin 385 >>交任务：捕猎鳄鱼
    .turnin 86758 >>交任务：扭动刀刃
    .goto Loch Modan,81.76,61.66
    .target 马雷克·铁心

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_年轻的达瑞尔|r 交谈
    .goto Loch Modan,83.49,65.40
    .accept 258 >> 接任务：猎人的挑战
    .target 年轻的达瑞尔
    .xp >16,1

step
    #optional
    .goto Loch Modan,74.65,49.60,70,0
    .goto Loch Modan,75.80,43.43,70,0
    .goto Loch Modan,71.10,38.98,70,0
    .goto Loch Modan,65.59,41.89,70,0
    .goto Loch Modan,61.66,32.02,70,0
    .goto Loch Modan,72.79,39.86,70,0
    .goto Loch Modan,73.87,51.85,70,0
    .goto Loch Modan,69.45,39.18
    >>击杀 |cRXP_ENEMY_老山猪|r
    >>|cRXP_WARN_必须完成任务并返回 |r|cRXP_FRIENDLY_年轻的达瑞尔|r|cRXP_WARN_ 处，时限为 12 分钟。如果失败，就放弃任务后重新接取|r
    .complete 258,1 -- Elder Mountain Boar slain (5)
    .mob 老山猪
    .isOnQuest 258

step
    #completewith next
    #optional
    .goto Loch Modan,82.92,59.37,80,0
    .goto Loch Modan,83.28,62.97,25 >> 前往 |cRXP_FRIENDLY_年轻的达瑞尔|r 处

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_年轻的达瑞尔|r 交谈
    .goto Loch Modan,83.49,65.40
    .turnin 258 >> 交任务：猎人的挑战
    .target 年轻的达瑞尔
    .isOnQuest 258

step
    #optional
    .xp 16-2360 >> 刷怪至距离 16 级还差 2360 经验（12.040/14.400）

step
    #softcore
    >>从小屋跳出去，让下方的怪物击杀你
    .deathskip >> 死亡后在塞尔萨玛墓地复活

step
    #hardcore
    .goto Loch Modan,37.24,47.38,30 >>沿道路返回塞尔萨玛

step
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.24,47.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吉恩·角盔|r 交谈
    .turnin 298 >> 交任务：挖掘进度报告
    .accept 301 >> 接任务：向铁炉堡报告
    .target 吉恩·角盔

step
    .goto 1432/0,-3104.900,-5210.100,5,0
    .goto 1432/0,-3086.600,-5216.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡拉·深水::1684|r 交谈
    .target 卡拉·深水::1684
    .turnin 86614 >>交任务：浪中银饰

step
    #label LochEnd

step
    #label flyIF
    .goto 1432/0,-2929.87,-5424.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索格拉姆·伯雷森|r 交谈
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
    .zoneskip Ironforge

step
    .goto Ironforge,74.645,11.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_勘察员塔伯斯·雷矛|r 交谈
    .turnin 301 >> 交任务：向铁炉堡报告
    .target 勘察员塔伯斯·雷矛

step << Hunter
    .goto 1455/0,-1266.100,-5006.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷格努斯·雷石|r 交谈
    .trainer >> 学习职业技能
    .target 雷格努斯·雷石

step << Priest
    .goto 1455/0,-897.200,-4607.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高阶牧师洛汉|r 交谈
    .trainer >> 学习职业技能
    .target 高阶牧师洛汉

step << Priest/Druid
    #ah
    #label OilWandFood
    #completewith AHCheck
    .goto 1455/0,-917.57,-4967.58,-1--c:Ironforge,25.800,75.500
    .goto 1455/0,-904.92,-4962.83,-1--c:Ironforge,24.200,74.600
    .goto 1455/0,-901.76,-4948.06,-1--c:Ironforge,23.800,71.800
    >>|cRXP_WARN_资金允许的话，购买以下物品：|r
    >>|T134711:0|t[初级巫师之油] |cRXP_WARN_和|r |T133906:0|t[烤鼠尾鱼]
    >>|cRXP_WARN_也要寻找高 DPS 的|r |T132317:0|t[魔杖] |cRXP_WARN_升级装备，选择现在或很快就能使用的|r << Priest
    >>|cRXP_WARN_这些物品能显著提高前期 DPS。如果不想购买或无法购买，就跳过此步骤|r
    .collect 20744,1 -- Minor Wizard Oil (1)
    .collect 21072,20 -- Smoked Sagefish (20)
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔

step << Rogue
    .goto Ironforge,51.495,15.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_芬斯维克|r 交谈
    .trainer >> 学习职业技能
    .target 芬斯维克

step << Warrior
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比尔班·飞钳|r 交谈
    .trainer >> 学习职业技能
    .target 比尔班·飞钳

step << Druid
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade

step << Druid
    .goto Moonglade,52.53,40.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔

step
    #label AHCheck
    .cooldown item,6948,>2
    .hs >>使用炉石返回奥伯丁
    .zoneskip Darkshore

step << Druid
    .goto Moonglade,48.0,67.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_辛德拉尔|r 交谈
    .fly Auberdine >>炉石无法使用时，飞回奥伯丁
    .target 辛德拉尔
    .zoneskip Darkshore

step << !Druid
    .goto Ironforge,76.61,51.28
    .subzone 2257 >>炉石无法使用时，进入矿道地铁返回暴风城
    .zoneskip Stormwind City
    .zoneskip Darkshore

step << !Druid
    .zone Stormwind City >>乘坐矿道地铁前往暴风城
    .zoneskip Darkshore

step << !Druid
    .goto 1453/0,1330.100,-8645.400
    .zone Darkshore >>在暴风港乘船返回黑海岸
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（联盟）
#subgroupdisplayname 1-20
#forever
#disabledungeons
#version 1
<< Alliance
#group RestedXP Forever Guide (A)
#subgroup Speedrun Guide 1-20
--#groupid RXP-SRGCE-A1
#name 16-19 Darkshore
#next 19-20 Redridge;20-21 Darkshore/Ashenvale << !Hunter
#next 19-21 Darkshore/Ashenvale << Hunter
-- step << NightElf !Druid
--     #optional
--     #completewith PortalDarn
--     .goto 1439/1,561.66,6343.27
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caylais Moonfeather|r
--     .fly Teldrassil >> Fly to Teldrassil
--     .target Caylais Moonfeather
--     .zoneskip Teldrassil
-- step << NightElf !Druid
--     .goto 1438/1,950.52,8694.07
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nessa Shadowsong|r
--     .turnin 6343 >> Turn in Return to Nessa
--     .target Nessa Shadowsong
-- step << NightElf !Druid
--     #completewith next
--     #label PortalDarn
--     .goto 1438/1,965.80,8780.95
--     .zone Darnassus >> Take the purple portal into Darnassus
-- step << NightElf Warrior
--     .goto 1457/1,2316.91,9991.88
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arias'ta Bladesinger|r
--     .trainer >> Train your class spells
--     .target Arias'ta Bladesinger
-- step << NightElf Warrior
--     .goto 1457/1,2329.19,9908.60
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ilyenia Moonfire|r
--     .skipgossipid 96881
--     .train 2567 >> Train Thrown
--     .target Ilyenia Moonfire
-- step << NightElf Hunter
--     #completewith start
--     .goto 1457/1,2511.01,10178.05
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jocaste|r
--     .trainer >> Train your class spells
--     .target Jocaste
-- step << NightElf Hunter
--     #completewith start
--     #label RecruveReinforced
--     .goto 1457/1,2268.76,9770.63
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Landria|r
--     >>|cRXP_WARN_Buy a|r |T135489:0|t[Heavy Recurve Bow] |cRXP_WARN_if you can afford it. If not then buy a|r |T135490:0|t[Reinforced Bow]
--     >>|cRXP_WARN_Stock up on|r |T132382:0|t[Sharp Arrows]
--     .collect 3027,1
--     .target Landria
--     .money <0.3812
--     .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.50
-- step << Hunter
--     #requires RecruveReinforced
--     #completewith next
--     +|cRXP_WARN_Equip the|r |T135489:0|t[Heavy Recurve Bow]
--     .use 3027
--     .itemcount 3027,1
--     .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.19
--     .xp <20,1
-- step << Hunter
--     #requires RecruveReinforced
--     #completewith next
--     +|cRXP_WARN_Equip the|r |T135490:0|t[Reinforced Bow]
--     .use 3026
--     .itemcount 3026,1
--     .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.49
-- step << NightElf Rogue
--     >>Enter the Cenarion Enclave
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Syurna|r
--     .goto 1457/1,2601.39,10120.53,15,0
--     .goto 1457/1,2546.78,10083.62
--     .trainer >> Train your class spells
--     .target Syurna
-- step << NightElf !Druid
--     #optional
--     #completewith next
--     .abandon 729 >> Abandon The Absent Minded Prospector to accept the quest Trouble In Darkshore?
-- step << NightElf !Druid
--     .goto 1438/1,2607.86,9641.94
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Archaeologist Greywhisker|r
--     .accept 730 >> Accept Trouble In Darkshore?
--     .target Chief Archaeologist Greywhisker
-- step << NightElf Priest
--     .goto 1457/1,2537.25,9654.40
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jandria|r
--     .trainer >> Train your class spells
--     .target Jandria
-- step << NightElf !Druid
--     #label start
--     .hs >> Hearth to Auberdine
#displayname 16-19 黑海岸

step
    .goto 1439/1,504.41,6402.39
    >>点击|cRXP_PICK_通缉告示|r
    .accept 4740 >> 接受任务：通缉：莫克迪普！

step << NightElf
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .turnin 730 >> 交任务：黑海岸的麻烦事
    .accept 729 >> 接受任务：健忘的勘察员
    .target 考古学家霍莉
    .isOnQuest 730

step << NightElf
    #optional
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >> 接受任务：健忘的勘察员
    .target 考古学家霍莉

step
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4762 >> 交任务：壁泉河
    .accept 4763 >> 接受任务：黑木熊怪的堕落
    .target 桑迪斯·织风

step
    .goto 1439/1,467.08,6409.38
    .use 12346 >>|cRXP_WARN_使用|r |T133748:0|t[空的净化碗]|cRXP_WARN_在|r |cRXP_PICK_奥伯丁月亮井|r取水
    .collect 12347,1,4763,1
    .isOnQuest 4763

step
    .goto 1439,42.017,58.866,0 --NE spawn
    .goto 1439,43.222,59.693,0 --NE spawn
    .goto 1439,43.069,62.448,0 --SE spawn
    .goto 1439,42.489,60.677,0 --Middle spawn
    .waypoint 1439,42.017,58.866,50,0 --NE spawn
    .waypoint 1439,42.311,58.645,50,0
    .waypoint 1439,42.448,58.236,50,0
    .waypoint 1439,43.222,59.693,50,0 --NE spawn
    .waypoint 1439,43.447,60.131,50,0
    .waypoint 1439,43.780,60.275,50,0
    .waypoint 1439,43.069,62.448,50,0 --SE spawn
    .waypoint 1439,43.104,62.563,50,0
    .waypoint 1439,42.794,62.166,50,0
    .waypoint 1439,42.489,60.677,50,0 --Middle spawn
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取她掉落的|cRXP_LOOT_坠饰|r
    -->>|cRXP_WARN_Be aware that she has a 7-8 minute spawn time and 4 different spawnpoints across Ameth'Aran|r
    --much faster spawn time now on forever
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
    .solo

step
    .goto 1439,42.017,58.866,0 --NE spawn
    .goto 1439,43.222,59.693,0 --NE spawn
    .goto 1439,43.069,62.448,0 --SE spawn
    .goto 1439,42.489,60.677,0 --Middle spawn
    .waypoint 1439,42.017,58.866,50,0 --NE spawn
    .waypoint 1439,42.311,58.645,50,0
    .waypoint 1439,42.448,58.236,50,0
    .waypoint 1439,43.222,59.693,50,0 --NE spawn
    .waypoint 1439,43.447,60.131,50,0
    .waypoint 1439,43.780,60.275,50,0
    .waypoint 1439,43.069,62.448,50,0 --SE spawn
    .waypoint 1439,43.104,62.563,50,0
    .waypoint 1439,42.794,62.166,50,0
    .waypoint 1439,42.489,60.677,50,0 --Middle spawn
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取她掉落的|cRXP_LOOT_坠饰|r
    -->>|cRXP_WARN_Be aware that she has a 7-8 minute spawn time and 4 different spawnpoints across Ameth'Aran|r
    -->>|cRXP_WARN_You may want to group with others nearby if you can't find her. Ask in General Chat (/1) to group with anyone else that is also looking for her|r
    --much faster spawn time now on forever
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
    .group

step
    #optional
    #completewith CompleteFangs
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取它们掉落的|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
    .isOnQuest 1002

step
    #loop
    .waypoint 1439/1,385.20,5393.69,0
    .waypoint 1439/1,155.30,5374.48,0
    .waypoint 1439/1,322.32,4907.25,0
    .waypoint 1439/1,385.20,5393.69,70,0
    .waypoint 1439/1,155.30,5374.48,70,0
    .waypoint 1439/1,322.32,4907.25,70,0
    >>在黑海岸南部击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_如果没有迅速击杀它们，小心它们会施放|r |T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：使所有生命值回复速度降低50%，持续10分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step << Druid
    #sticky
    #label earthroot
    >>做任务时收集5个|T134187:0|t[地根草]
    .complete 6123,1 --Earthroot (5)
    .isOnQuest 6123

step << Druid
    .goto 1439/1,98.97,6329.03,90,0
    .goto 1439/1,105.52,6189.30,90,0
    .goto 1439/1,164.47,6036.47,90,0
    .goto 1439/1,-51.68,6136.90,90,0
    .goto 1439/1,-25.48,6005.90
    .goto 1439/1,98.97,6329.03,0
    .goto 1439/1,105.52,6189.30,0
    .goto 1439/1,164.47,6036.47,0
    .goto 1439/1,-51.68,6136.90,0
    >>拾取各处洞穴地上的|cRXP_LOOT_月亮菇|r
    .complete 6123,2
    .isOnQuest 6123

step
    #completewith OnuGrove
    .goto 1439,43.555,76.293,80 >> 前往古树之林

step
    #label OnuGrove
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 952 >> 交任务：古树之林 << NightElf
    .turnin 948 >> 交任务：安努
    .accept 944 >> 接受任务：主宰之剑
    .target 安努

step
    #completewith MasterG
    >>击杀|cRXP_ENEMY_月夜雄虎|r，拾取它们掉落的|cRXP_LOOT_毛皮|r
    >>小心它们会施放|T132090:0|t[攻击弱点]，这是一种背刺攻击；若你背对它们，会受到20-40点伤害
    .complete 986,1 -- Fine Moonstalker Pelt (5)
    .unitscan 月夜雄虎
    .isOnQuest 986

step
    #completewith MasterG
    #optional
    .goto 1439/1,413.37,4818.17,0
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取它们掉落的|cRXP_LOOT_灰色头皮|r
    >>|cRXP_WARN_小心它们会施放|r |T132152:0|t[毁灭]|cRXP_WARN_，这是造成20-40点伤害并将你击倒2秒的瞬发攻击|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob 灰斑蓟熊

step
    #optional
    .goto 1439,41.390,80.563
    >>点击地上的|cRXP_PICK_传声盒525号|r
    .turnin 1003 >> 交任务：传声盒525号
    .isQuestComplete 1003

step
    #label MasterG
    .goto 1439/1,417.30,4575.82,100 >> 前往主宰之剑
    .subzoneskip 449
    .isOnQuest 944

step
    #optional
    #completewith FunandGames
    >>击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，拾取它们掉落的|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心|r|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会施放|r |T132343:0|t[缴械]|cRXP_WARN_，使你无法使用武器，持续6秒|r << Rogue/Paladin/Warrior/Shaman
    *|cRXP_WARN_小心|r|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_以及施法时间为3秒的|r |T135915:0|t[治疗术]
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .mob 暮光信徒
    .mob 暮光暴徒

step
    #optional
    .goto 1439/1,390.700,4542.700
    >>探索主宰之剑
    .complete 944,1 --Enter the Master's Glaive (1)

step
    #optional
    #completewith next
    .cast 5809 >> |cRXP_WARN_使用|r |T134715:0|t[占卜之水]|cRXP_WARN_，将其放在地上|r
    .use 5251

step
    .goto 1439/1,417.30,4575.82
    >>|cRXP_WARN_点击地上的|r|cRXP_PICK_占卜之碗|r
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接受任务：暮光之锤的营地
    .use 5251

step
    #label FunandGames
    .goto 1439,38.537,86.050
    >>点击北边台座上的|cRXP_PICK_暮光之书|r
    .turnin 949 >> 交任务：暮光之锤的营地
    .accept 950 >> 接受任务：向安努回复
    .accept 98042 >>接受任务：开玩笑也要有个限度……

step
    #completewith TheryluneEnd
    >>击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，拾取它们掉落的|cRXP_LOOT_无双之眼|r和|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心|r|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会施放|r |T132343:0|t[缴械]|cRXP_WARN_，使你无法使用武器，持续6秒|r << Rogue/Paladin/Warrior/Shaman
    *|cRXP_WARN_小心|r|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_以及施法时间为3秒的|r |T135915:0|t[治疗术]
    .complete 98042,1 -- Peerless Eye (1)
    .mob +暮光信徒
    .mob +暮光暴徒
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .disablecheckbox

step
    .goto 1439,38.660,87.305
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟瑞露尼|r交谈，开始护送
    >>|cRXP_WARN_如果她不在，就跳过这一步|r
    .accept 945 >> 接受任务：护送瑟瑞露尼
    .target 瑟瑞露尼

step
    #label TheryluneEnd
    .goto 1439/1,288.26,4530.40
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_瑟瑞露尼|r|cRXP_WARN_离开主宰之剑|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .isOnQuest 945

step
    #loop
    .goto 1439/1,376.800,4608.600,40,0
    .goto 1439/1,453.100,4580.200,40,0
    .goto 1439/1,409.4366,4521.0151,40,0
    >>击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，拾取它们掉落的|cRXP_LOOT_无双之眼|r和|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心|r|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会施放|r |T132343:0|t[缴械]|cRXP_WARN_，使你无法使用武器，持续6秒|r << Rogue/Paladin/Warrior/Shaman
    *|cRXP_WARN_小心|r|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_以及施法时间为3秒的|r |T135915:0|t[治疗术]
    .complete 98042,1 -- Peerless Eye (1)
    .mob +暮光信徒
    .mob +暮光暴徒
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .disablecheckbox

step
    #optional
    #sticky
    .isQuestTurnedIn 949
    .destroy 5251 >> 从背包中摧毁|T134715:0|t[占卜之水]，之后不再需要它

step
    #optional
    #completewith TurtleSouth
    #completewith prospector << Hunter
    >>击杀|cRXP_ENEMY_月夜雄虎|r，拾取它们掉落的|cRXP_LOOT_毛皮|r
    >>小心它们会施放|T132090:0|t[攻击弱点]，这是一种背刺攻击；若你背对它们，会受到20-40点伤害
    .complete 986,1 -- Fine Moonstalker Pelt (5)
    .isOnQuest 986
    .unitscan 月夜雄虎

step
    #optional
    .goto 1439/1,227.35,4575.38,50,0
    .goto 1439/1,205.73,4639.130,50,0
    .goto 1439/1,129.10,4741.75,50,0
    .goto 1439/1,86.52,4839.13,50,0
    .goto 1439/1,338.70,4821.22,50,0
    .goto 1439/1,452.67,4684.98
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取它们掉落的|cRXP_LOOT_灰色头皮|r
    >>|cRXP_WARN_小心它们会施放|r |T132152:0|t[毁灭]|cRXP_WARN_，这是造成20-40点伤害并将你击倒2秒的瞬发攻击|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob 灰斑蓟熊

step
    #label LastBuzz
    .goto 1439,41.390,80.563
    >>点击地上的|cRXP_PICK_传声盒525号|r
    .turnin 1003 >> 交任务：传声盒525号
    .isQuestComplete 1003

step
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >> 交任务：向安努回复
    .timer 11.5,向安努回复剧情
    --  .timer 14,Return to Onu RP
    .accept 951 >> 接受任务：玛塞斯特拉遗物
    .target 安努

step
    #optional
    >>|cRXP_WARN_使用|T133743:0|t[|r|cRXP_LOOT_《深渊之神》|r|cRXP_WARN_]接受任务|r
    .accept 968 >> 接受任务：深渊之神
    .use 5352
    .itemcount 5352,1

step << Hunter
    #optional
    .goto 1439/1,417.30,4575.82
    .xp 17 >> 刷怪升到17级

step << Hunter
    #sticky
    #label prospector
    .goto 1439,35.724,83.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    >>|cRXP_WARN_你可能需要等待他刷新，或等其他人完成护送|r
    .turnin 729 >> 交任务：健忘的勘察员
    .target 勘察员雷姆塔维尔

step << Hunter
    .goto 1439/1,602.01,4678.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈，开始护送
    .accept 731,1 >> 接受任务：健忘的勘察员
    >>|cRXP_WARN_这个任务非常困难，你可以跳过这一步，等到19级再来|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击此处观看视频攻略|r
    .target 勘察员雷姆塔维尔

step << Hunter
    #requires prospector
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_勘察员雷姆塔维尔|r|cRXP_WARN_穿过挖掘场|r
    >>|cRXP_WARN_这个任务非常困难，你可以跳过这一步，等到19级再来|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击此处观看视频攻略|r
    .complete 731,1
    .isOnQuest 731

step << Hunter
    .goto 1439,31.251,87.419
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >> 接受任务：搁浅的海洋生物
    >>|cRXP_WARN_这个任务可能非常困难。与|r|cRXP_ENEMY_鱼人|r|cRXP_WARN_交战时，要1只接1只地引怪，否则可能同时引到多个|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_灰雾智者|r|cRXP_WARN_的|r |T136048:0|t[闪电箭]|cRXP_WARN_伤害，它们还会用|r |T136052:0|t[治疗波]治疗
    .link https://youtu.be/lfQM3Q-Ag5A >> |cRXP_WARN_点击此处观看视频攻略|r

step
    #completewith CompleteThistleBears
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r，拾取它们掉落的|cRXP_LOOT_优质蟹肉|r
    >>小心|cRXP_ENEMY_暗礁蟹|r会施放|T132155:0|t[撕裂肌肉]，这是造成30-55点伤害的瞬发攻击
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 暗礁蟹
    .mob 硬壳潮行蟹

step << Hunter
    .goto 1439,31.229,85.564
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_灰雾智者|r|cRXP_WARN_的|r |T136048:0|t[闪电箭]|cRXP_WARN_伤害，它们还会用|r |T136052:0|t[治疗波]治疗
    >>小心|cRXP_ENEMY_灰雾潮行者|r会在近战时施放|T136016:0|t[|cRXP_FRIENDLY_毒药|r]，使你每3秒受到13点持续伤害，持续30秒
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4732 >> 接受任务：搁浅的海龟

step
    #label TurtleSouth
    .goto 1439,31.690,83.700
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_灰雾智者|r|cRXP_WARN_的|r |T136048:0|t[闪电箭]|cRXP_WARN_伤害，它们还会用|r |T136052:0|t[治疗波]治疗
    >>小心|cRXP_ENEMY_灰雾潮行者|r会在近战时施放|T136016:0|t[|cRXP_FRIENDLY_毒药|r]，使你每3秒受到13点持续伤害，持续30秒
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4731 >> 接受任务：搁浅的海龟

step << !Hunter
    .goto 1439,32.644,80.711
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接受任务：搁浅的海洋生物

step << Hunter
    .goto 1439,32.644,80.711
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接受任务：搁浅的海洋生物

step << Druid
    #optional
    >>|cRXP_WARN_继续收集|T134187:0|t[地根草]，通过|T136065:0|t[草药学]采集，偶尔也能在|r |cRXP_PICK_破损的箱子|r中找到
    >>|cRXP_WARN_如果始终找不够，决定放弃，就跳过这一步|r
    .complete 6123,1 --Earthroot (5)
    .isOnQuest 6123
    .skill herbalism,<15,1
    --XX Add waypoints later

step
    #label Murk
    .goto 1439,35.429,76.566,0
    .goto 1439,35.429,76.566,60,0
    .goto 1439/1,541.75,4991.52
    >>|cRXP_WARN_先检查|r|cRXP_ENEMY_莫克迪普|r|cRXP_WARN_是否已在水中刷新（若之前有人挑战失败，或没有杀死与他同时出现的|r|cRXP_ENEMY_灰雾猎人|r|cRXP_WARN_，他可能已经在水里）|r
    >>击杀营地里的|cRXP_ENEMY_灰雾战士|r和|cRXP_ENEMY_灰雾猎人|r
    >>|cRXP_WARN_走到营地中央的篝火处，开始|r|cRXP_ENEMY_莫克迪普|r|cRXP_WARN_的战斗：|r
    >>|cRXP_WARN_敌人会分3波从水中出现，消灭前一波后才会出现下一波：第1波是3只12-13级的|r|cRXP_ENEMY_灰雾滩行者|r|cRXP_WARN_，第2波是2只15-16级的|r|cRXP_ENEMY_灰雾战士|r|cRXP_WARN_，第3波是19级的|r|cRXP_ENEMY_莫克迪普|r|cRXP_WARN_和一只16-17级的|r|cRXP_ENEMY_灰雾猎人|r|cRXP_WARN_。你可以远离篝火，避免引到下一波敌人|r
    .complete 4740,1 -- Murkdeep (1)
    .unitscan 莫克迪普
    .mob 灰雾战士
    .mob 灰雾猎人
    .mob 灰雾滩行者

step
    #label CompleteThistleBears
    .goto 1439,35.968,70.807
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4728 >> 接受任务：搁浅的海洋生物

step << Druid
    #label Southcrabs
    .xp <18,1
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade

step << Druid
    .goto 1450/1,-2593.82,7867.06
    >>前往月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔
    .xp <18,1

step << Druid
    #label FlyDarkshore
    .goto 1450/1,-2491.79,7454.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛德拉尔|r交谈
    .fly Auberdine >> 飞往黑海岸
    .target 辛德拉尔
    .zoneskip Darkshore

step << NightElf !Druid/Dwarf Hunter/Human Hunter/Skyborne Hunter
    #label Southcrabs
    #completewith CleansingTharnariun
    .subzone 442 >> 前往奥伯丁

step
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >> 返回码头的|cRXP_FRIENDLY_塞瑞利恩·白爪|r处

step
    #optional
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .turnin 963 >> 交任务：永志不渝
    .target 塞瑞利恩·白爪
    .isQuestComplete 963

step
    #optional
    #completewith CleansingTharnariun
    .abandon 963 >> 放弃任务：永志不渝

step
    #label BeachedTurnins
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4728 >> 交任务：搁浅的海洋生物
    .turnin 4730 >> 交任务：搁浅的海洋生物
    .turnin 4731 >> 交任务：搁浅的海龟
    .turnin 4732 >> 交任务：搁浅的海龟 << Hunter
    .turnin 4733 >> 交任务：搁浅的海洋生物 << Hunter
    .target 温尼斯·布莱葛

step
    #optional
    .goto 1439/1,577.38,6371.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >> 交任务：海中的水果
    .isQuestComplete 1138
    .target 古博·布拉普

step
    .goto 1439/1,531.27,6403.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r和|cRXP_FRIENDLY_奥林迪雅|r交谈
    .vendor >> |cRXP_BUY_出售杂物并补充食物和水|r
    .target 莱尔德
    .target 奥林迪雅

step
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4740 >> 交任务：通缉：莫克迪普！
    .target 哨兵戈琳达·纳希恩

step
    .goto 1439/1,492.300,6581.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风::3649|r交谈
    .target 桑迪斯·织风::3649
    .turnin 98042 >>交任务：开玩笑也要有个限度……

step
    #label CleansingTharnariun
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >> 交任务：清除疫病
    .accept 2139 >> 接受任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树

step << Hunter
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .turnin 731 >> 交任务：健忘的勘察员
    .accept 741 >> 接受任务：健忘的勘察员
    .target 考古学家霍莉
    .isQuestComplete 731

step << Hunter
    #optional
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 741 >> 接受任务：健忘的勘察员
    .target 考古学家霍莉
    .isQuestTurnedIn 731

step << Hunter
    #optional
    .goto 1439/1,491.97,6560.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor >>|cRXP_BUY_补充弹药|r
    .target 达蒙德

step << Druid
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .turnin 6123 >> 交任务：收集解药
    .isQuestComplete 6123
    --     .accept 6124 >> Accept Curing the Sick
    -- step << Druid
    --     #optional
    --     .goto 1439/1,472.32,6556.100
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alanndarian Nightsong|r
    --     .accept 6124 >> Accept Curing the Sick
    --     .target Alanndarian Nightsong
    --     .isQuestTurnedIn 6123

step << Druid
    #optional
    #completewith Buzzbox323End
    .abandon 6123 >> 放弃任务：收集解药
    -- step << Druid
    --     #optional
    --     #completewith Buzzbox323End
    --     .goto 1439/1,-313.68,6883.60,0
    --     .goto 1439/1,98.97,7237.30,0
    --     .goto 1439/1,347.87,6813.73,0
    --     >>|cRXP_WARN_Use the|r |T132801:0|t[Curative Animal Salve] |cRXP_WARN_on|r |cRXP_ENEMY_Sickly Deer|r
    --     .complete 6124,1 -- Sickly Deer cured (10)
    --     .mob Sickly Deer
    --     .isQuestAvailable 1138
    -- step << Druid
    --     #sticky
    --     #label SicklyDeers
    --     #loop
    --     .goto 1439/1,-313.68,6883.60,0
    --     .goto 1439/1,98.97,7237.30,0
    --     .goto 1439/1,347.87,6813.73,0
    --     .waypoint 1439/1,-313.68,6883.60,40,0
    --     .waypoint 1439/1,98.97,7237.30,40,0
    --     .waypoint 1439/1,347.87,6813.73,40,0
    --     >>|cRXP_WARN_Use the|r |T132801:0|t[Curative Animal Salve] |cRXP_WARN_on|r |cRXP_ENEMY_Sickly Deer|r
    --     .complete 6124,1 -- Sickly Deer cured (10)
    --     .mob Sickly Deer
    --     .use 15826
    --     .isQuestTurnedIn 1138

step
    #sticky
    #label Blackwood1
    #completewith Xabraxxis
    .goto 1439/1,-489.22,6875.30,0
    .goto 1439/1,-376.56,6807.62
    >>打开|cRXP_PICK_黑木谷物|r，拾取其中的|T134059:0|t|cRXP_LOOT_[黑木谷物]|r
    >>|cRXP_WARN_拾取后会出现2只|r|cRXP_ENEMY_黑木熊怪|r|cRXP_WARN_，它们会立即向你冲来。准备好应战，或脱战让它们重置|r
    >>|cRXP_WARN_如果看到|r|cRXP_ENEMY_萨巴克希斯|r|cRXP_WARN_在聊天中喊话，或有人正在与他战斗，就去帮忙。打开他掉在地上的|r|cRXP_PICK_萨巴克希斯的恶魔之包|r|cRXP_WARN_，拾取其中的|r |cRXP_LOOT_堕落护符|r
    .collect 12342,1,4763,1 -- Blackwood Grain Stores (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)

step
    .goto 1439/1,-503.63,6732.95,45,0
    .goto 1439/1,-430.27,6662.65
    >>击杀|cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_蓟熊幼崽|r|cRXP_WARN_会施放|r |T132152:0|t[毁灭]|cRXP_WARN_，这是会使你昏迷2秒的近战瞬发攻击|r
    .complete 2139,1 --Den Mother (1)
    .mob 雌蓟熊

step
    #sticky
    #requires Blackwood1
    #label Blackwood2
    #completewith Xabraxxis
    .goto 1439/1,-489.22,6875.30,0
    .goto 1439/1,-453.20,6870.500
    >>打开|cRXP_PICK_黑木坚果|r，拾取其中的|T133944:0|t|cRXP_LOOT_[黑木坚果]|r
    >>|cRXP_WARN_拾取后会出现2只|r|cRXP_ENEMY_黑木熊怪|r|cRXP_WARN_，它们会立即向你冲来。准备好应战，或脱战让它们重置|r
    >>|cRXP_WARN_如果看到|r|cRXP_ENEMY_萨巴克希斯|r|cRXP_WARN_在聊天中喊话，或有人正在与他战斗，就去帮忙。打开他掉在地上的|r|cRXP_PICK_萨巴克希斯的恶魔之包|r|cRXP_WARN_，拾取其中的|r |cRXP_LOOT_堕落护符|r
    .collect 12343,1,4763,1 -- Blackwood Nut Sample (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)

step
    #sticky
    #requires Blackwood2
    #label Blackwood3
    #completewith Xabraxxis
    .goto 1439/1,-489.22,6875.30,0
    .goto 1439/1,-520.66,6874.43
    >>打开|cRXP_PICK_黑木水果|r，拾取其中的|T134013:0|t|cRXP_LOOT_[黑木水果]|r
    >>|cRXP_WARN_拾取后会出现2只|r|cRXP_ENEMY_黑木熊怪|r|cRXP_WARN_，它们会立即向你冲来。准备好应战，或脱战让它们重置|r
    >>|cRXP_WARN_如果看到|r|cRXP_ENEMY_萨巴克希斯|r|cRXP_WARN_在聊天中喊话，或有人正在与他战斗，就去帮忙。打开他掉在地上的|r|cRXP_PICK_萨巴克希斯的恶魔之包|r|cRXP_WARN_，拾取其中的|r |cRXP_LOOT_堕落护符|r
    .collect 12341,1,4763,1 -- Blackwood Fruit Sample (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)

step
    #optional
    #requires Blackwood3
    #completewith Xabraxxis
    .goto 1439/1,-489.22,6875.30
    .cast 16072 >> |cRXP_WARN_使用|r |T134712:0|t[装满水的净化碗]|cRXP_WARN_，在|r|cRXP_PICK_篝火|r|cRXP_WARN_旁召唤|r |cRXP_ENEMY_萨巴克希斯|r
    .timer 17,黑木熊怪的堕落剧情
    .use 12347

step
    #requires Blackwood3
    #label Xabraxxis
    .goto 1439/1,-489.22,6875.30
    >>击杀|cRXP_ENEMY_萨巴克希斯|r，打开他掉在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r，拾取其中的|cRXP_LOOT_堕落护符|r
    .use 12347
    .complete 4763,1 -- Talisman of Corruption (1)
    .mob 萨巴克希斯

step << !Hunter
    #label CompleteFangs
    .goto 1439/1,-503.63,6866.13
    .xp 18 >> 刷怪升到18级

step << Hunter
    #label CompleteFangs
    .goto 1439/1,-503.63,6866.13
    .xp 18.75 >> 刷怪到18级又75%经验
    >>确保炉石的冷却时间<10分钟
    >>如果此处玩家太多，就跳过这一步

step
    #label LateStalkerFangs
    #optional
    #loop
    .goto 1439,53.629,26.054,0
    .goto 1439,54.204,30.475,0
    .goto 1439,49.775,30.351,0
    .goto 1439,48.894,26.514,0
    .goto 1439,48.022,27.199,60,0
    .goto 1439,48.894,26.514,60,0
    .goto 1439,49.558,26.087,60,0
    .goto 1439,49.902,27.511,60,0
    .goto 1439,49.776,28.393,60,0
    .goto 1439,49.775,30.351,60,0
    .goto 1439,50.818,30.486,60,0
    .goto 1439,50.689,32.001,60,0
    .goto 1439,51.267,32.319,60,0
    .goto 1439,54.204,30.475,60,0
    .goto 1439,53.899,28.638,60,0
    .goto 1439,53.049,27.983,60,0
    .goto 1439,52.764,26.312,60,0
    .goto 1439,53.629,26.054,60,0
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取它们掉落的|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
    .isOnQuest 1002
    --XX Can do later during Pelts but better if player gets more xp beforehand

step
    .isQuestComplete 1002
    #label Buzzbox323End
    .goto 1439,51.288,24.554
    >>点击地上的|cRXP_PICK_传声盒323号|r
    .turnin 1002 >> 交任务：传声盒323号
    .accept 1003 >> 接受任务：传声盒525号

step
    #optional
    .isQuestTurnedIn 1002
    .goto 1439,51.288,24.554
    >>点击地上的|cRXP_PICK_传声盒323号|r
    .accept 1003 >> 接受任务：传声盒525号

step << !Hunter !Druid
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 965 >> 交任务：奥萨拉克斯之塔
    .accept 966 >> 接受任务：奥萨拉克斯之塔
    .target 巴苏尔·影击

step << !Hunter !Druid
    #loop
    .goto 1439,55.231,26.508,0
    .goto 1439,56.194,27.071,0
    .goto 1439,56.047,26.586,0
    .goto 1439,55.231,26.508,50,0
    .goto 1439,55.369,27.025,50,0
    .goto 1439,55.763,26.695,50,0
    .goto 1439,55.815,26.972,50,0
    .goto 1439,56.194,27.071,50,0
    .goto 1439,56.790,27.621,50,0
    .goto 1439,57.278,26.311,50,0
    .goto 1439,57.046,26.234,50,0
    .goto 1439,56.544,26.598,50,0
    .goto 1439,56.047,26.586,50,0
    .goto 1439,55.743,25.915,50,0
    >>击杀|cRXP_ENEMY_暗滩狂热者|r，拾取它们掉落的|cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob 暗滩狂热者

step << !Hunter !Druid
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 966 >> 交任务：奥萨拉克斯之塔
    .accept 967 >> 接受任务：奥萨拉克斯之塔
    .target 巴苏尔·影击

step
    .goto 1439/1,-800.35,7370.92,55,0
    .goto 1439/1,-855.37,7449.96,55,0
    .goto 1439/1,-880.91,7302.36,55,0
    .goto 1439/1,-950.34,7258.26,55,0
    .goto 1439/1,-1005.36,7383.58
    >>拾取地上的|cRXP_LOOT_黑暗深渊遗物|r
    .complete 951,1 -- Mathystra Relics (6)

step
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .accept 2098 >> 接受任务：基尔卡克的钥匙
    .target 基尔卡克·旋杆

step
    #optional
    #completewith next
    .goto 1439/1,-732.88,7596.24,0
    >>击杀|cRXP_ENEMY_狂暴暗礁蟹|r和|cRXP_ENEMY_硬壳潮行蟹|r，拾取它们掉落的|cRXP_LOOT_基尔卡克钥匙的尾部|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_狂暴暗礁蟹|r|cRXP_WARN_的|r |T132152:0|t[痛击]|cRXP_WARN_技能，它们的近战攻击可能瞬间造成200点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key (1)
    .mob 狂暴暗礁蟹
    .mob 硬壳潮行蟹

step
    .goto 1439/1,-656.25,7801.04
    >>击杀|cRXP_ENEMY_灰雾智者|r和|cRXP_ENEMY_灰雾潮行者|r，拾取它们掉落的|cRXP_LOOT_基尔卡克钥匙的中部|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_灰雾智者|r|cRXP_WARN_的|r |T136048:0|t[闪电箭]|cRXP_WARN_伤害，它们还会用|r |T136052:0|t[治疗波]治疗
    >>小心|cRXP_ENEMY_灰雾潮行者|r会在近战时施放|T136016:0|t[|cRXP_FRIENDLY_毒药|r]，使你每3秒受到13点持续伤害，持续30秒
    >>|cRXP_WARN_你可以绕着沉船卡|r|cRXP_ENEMY_灰雾智者|r|cRXP_WARN_的视野，躲避它们的|r |T136048:0|t[闪电箭]|cRXP_WARN_伤害|r
    .complete 2098,2 -- Middle of Gelkak's Key (1)
    .mob 灰雾潮行者
    .mob 灰雾智者

step
    .goto 1439/1,-699.48,7591.87,45,0
    .goto 1439/1,-579.61,7505.41,45,0
    .goto 1439/1,-421.10,7372.67,45,0
    .goto 1439/1,-767.60,7805.84
    >>击杀|cRXP_ENEMY_狂暴暗礁蟹|r和|cRXP_ENEMY_硬壳潮行蟹|r，拾取它们掉落的|cRXP_LOOT_基尔卡克钥匙的尾部|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_狂暴暗礁蟹|r|cRXP_WARN_的|r |T132152:0|t[痛击]|cRXP_WARN_技能，它们的近战攻击可能瞬间造成200点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key (1)
    .mob 狂暴暗礁蟹
    .mob 硬壳潮行蟹

step
    #sticky
    #label foreststriders
    .goto 1439/1,-941.83,7756.06,55,0
    .goto 1439/1,-1080.03,7922.87,50,0
    .goto 1439/1,-1087.24,7780.51,50,0
    .goto 1439/1,-1069.55,7661.74,50,0
    .goto 1439/1,-1080.03,7922.870
    >>击杀|cRXP_ENEMY_凶猛的森林陆行鸟|r，拾取它们掉落的|cRXP_LOOT_基尔卡克钥匙的头部|r
    .complete 2098,1 -- Top of Gelkak's Key (1)
    .mob 凶猛的森林陆行鸟

step
    #label NorthStalkerPelts
    .goto 1439/1,-1080.03,7922.87,45,0
    .goto 1439/1,-1146.84,7998.41
    >>击杀|cRXP_ENEMY_月夜雄虎|r和|cRXP_ENEMY_月夜雌虎|r，拾取它们掉落的|cRXP_LOOT_毛皮|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_月夜雌虎|r|cRXP_WARN_，它们身边总有一只|r|cRXP_ENEMY_月夜猛虎幼崽|r|cRXP_WARN_一起攻击|r
    >>|cRXP_ENEMY_月夜雄虎|r会施放|T132090:0|t[攻击弱点]，这是一种背刺攻击；若你背对它们，会受到20-40点伤害
    .complete 986,1 -- Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .mob 月夜雌虎
    .mob 月夜猛虎幼崽
    .isOnQuest 986

step << Warrior/Paladin/Rogue/Shaman
    #requires foreststriders
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    >>|cRXP_WARN_开始寻找队伍完成基尔卡克的报复／|r|cRXP_ENEMY_机械打手4100型|r << Warrior/Paladin/Rogue/Shaman
    .turnin 2098 >> 交任务：基尔卡克的钥匙
    .accept 2078 >> 接受任务：基尔卡克的报复
    .target 基尔卡克·旋杆
    .solo

step
    #requires foreststriders
    .group 2 << Warrior/Paladin/Rogue/Shaman
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    >>|cRXP_WARN_开始寻找队伍完成基尔卡克的报复／|r|cRXP_ENEMY_机械打手4100型|r << Warrior/Paladin/Rogue/Shaman
    .turnin 2098 >> 交任务：基尔卡克的钥匙
    .accept 2078 >> 接受任务：基尔卡克的报复
    .target 基尔卡克·旋杆

step
    #optional
    #completewith next
    .goto 1439,55.802,18.290
    .gossipoption 95406 >> 与|cRXP_FRIENDLY_机械打手4100型|r交谈，开始护送
    --  .gossipoption 87696 >> Talk to |cRXP_FRIENDLY_The Threshwackonator 4100|r to start the escort
    >>|cRXP_WARN_这个任务非常困难|r
    .target 机械打手4100型
    .isOnQuest 2078 << Warrior/Paladin/Rogue/Shaman

step
    #label Turtle4727
    .goto 1439,53.113,18.099
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4727 >> 接受任务：搁浅的海龟

step
    .goto 1439,56.654,13.484
    #optional
    >>护送|cRXP_FRIENDLY_机械打手4100型|r前往|cRXP_FRIENDLY_基尔卡克·旋杆|r处
    >>|cRXP_ENEMY_机械打手4100型|r变为敌对后将其击杀
    >>|cRXP_WARN_这个任务非常困难|r
    *逃跑时只使用远程攻击，避免进入它的近战范围 << Druid
    >>|cRXP_WARN_尽量完成这个任务，其奖励的|r |T134797:0|t[水下呼吸饮剂]|cRXP_WARN_能为后续的水下任务节省时间|r << !Druid !Warlock !Shaman
    >>|cRXP_WARN_在它变为敌对时施放|r |T136100:0|t[纠缠根须]|cRXP_WARN_，然后拉开距离，用瞬发法术风筝它|r << Druid
    >>|cRXP_WARN_如果无法击杀|r|cRXP_ENEMY_机械打手4100型|r|cRXP_WARN_，就跳过这一步|r
    .complete 2078,1 --Gyromast's Revenge (1)
    .link https://youtu.be/1WRRmKYBr9s >> |cRXP_WARN_点击此处观看视频攻略|r
    .mob 机械打手4100型
    .isOnQuest 2078 << Warrior/Paladin/Rogue/Shaman
    --XX DRUID: Test if you can root

step
    #optional << Warrior/Paladin/Rogue/Shaman
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .turnin 2078 >> 交任务：基尔卡克的报复
    .target 基尔卡克·旋杆
    .isQuestComplete 2078

step
    #optional
    #completewith BeachedCloak
    .abandon 2078 >> 放弃任务：基尔卡克的报复

step << Druid
    #optional
    #completewith BeachedCloak
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r，拾取它们掉落的|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹

step
    #sticky
    #label DeleteGyromast
    #optional
    .destroy 7442 >> 从背包中摧毁|T134459:0|t[基尔卡克的钥匙]，之后不再需要它

step << !NightElf/!Dwarf Hunter/!Human Hunter/!Druid
    #completewith BeachedCloak
    #map Darkshore
    .goto 1448/1,577.92,6371.65,100 >> 前往奥伯丁
    .cooldown item,6948,<0

step << !NightElf/!Dwarf Hunter/!Human Hunter/!Druid
    .hs >> 使用炉石返回奥伯丁
    .cooldown item,6948,>2,1
    .subzoneskip 442 --auberdine
    .bindlocation 442,1

step << Druid
    #label Turtle4727
    .goto 1439,53.113,18.099
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4727 >> 接受任务：搁浅的海龟
    -- step << Druid
    --     #label DeerComplete
    --     #loop
    --     .goto 1439/1,-313.68,6883.60,0
    --     .goto 1439/1,98.97,7237.30,0
    --     .goto 1439/1,347.87,6813.73,0
    --     .goto 1439/1,-313.68,6883.60,40,0
    --     .goto 1439/1,98.97,7237.30,40,0
    --     .goto 1439/1,347.87,6813.73,40,0
    --     >>|cRXP_WARN_Use the|r |T132801:0|t[Curative Animal Salve] |cRXP_WARN_on|r |cRXP_ENEMY_Sickly Deer|r
    --     .complete 6124,1 -- Sickly Deer cured (10)
    --     .mob Sickly Deer
    --     .use 15826

step << Druid
    .goto 1439/1,-259.32,7839.03
    >>|cRXP_WARN_游到外面的水中|r
    >>打开|cRXP_PICK_奇怪的保险箱|r，拾取其中的|cRXP_LOOT_水兽敏捷坠饰|r
    .collect 15883,1,272,1 --Collect Half Pendant of Aquatic Agility (x1)

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    #softcore
    #optional
    #completewith next
    .deathskip >> 刷怪直到炉石冷却时间<6分钟，然后死亡并在|cRXP_FRIENDLY_灵魂医者|r处复活

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    #hardcore
    #optional
    #completewith next
    +刷怪直到炉石冷却时间<9分钟，然后跑回奥伯丁

step << !NightElf !Hunter
    #softcore
    #optional
    #completewith next
    .deathskip >> 死亡并在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target 灵魂医者

step << !NightElf
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4763 >> 交任务：黑木熊怪的堕落
    .target 桑迪斯·织风

step << !NightElf
    #optional
    #completewith BeachedCloak
    .destroy 12342 >> 从背包中摧毁|T134059:0|t|cRXP_LOOT_[黑木谷物]|r，之后不再需要它

step << !NightElf
    #optional
    #completewith BeachedCloak
    .destroy 12343 >> 从背包中摧毁|T133944:0|t|cRXP_LOOT_[黑木坚果]|r，之后不再需要它

step << !NightElf
    #optional
    #completewith BeachedCloak
    .destroy 12341 >> 从背包中摧毁|T134013:0|t|cRXP_LOOT_[黑木水果]|r，之后不再需要它

step << !NightElf
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2139 >> 交任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树

step << !NightElf
    .isQuestComplete 986
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 986 >> 交任务：丢失的主人
    .accept 993 >> 接受任务：丢失的主人
    .target 特伦希斯

step << !NightElf
    #optional
    .isQuestTurnedIn 986
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 993 >> 接受任务：丢失的主人
    .target 特伦希斯

step << !NightElf
    #optional
    #completewith BeachedCloak
    >>|cRXP_WARN_如果装备了|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_，请保留当前的披风备用，因为|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_会在后续交任务时消失|r
    .equip 15,5387 >>|cRXP_WARN_装备|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_（如果它比当前的披风更好）|r
    .itemcount 5387,1
    .itemStat 15,QUALITY,<7

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    #label TravelDarnDwarfHBoat
    #completewith DarnDwarfHBoat
    .goto 1439,33.169,40.179,15 >> 前往开往达纳苏斯的船只停靠的码头
    .zoneskip Teldrassil
    .zoneskip Darnassus

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    #optional
    #label DarnDwarfHCook1
    #requires TravelDarnDwarfHBoat
    #completewith DarnDwarfHBoat
    >>|cRXP_WARN_在码头等船时：|r
    .cast 818 >>|cRXP_WARN_生起|r |T135805:0|t[基础营火]|cRXP_WARN_（位于法术书的综合页签中）|r
    .usespell 818
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .itemcount 6889,1 --Small Egg (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    #optional
    #requires DarnDwarfHCook1
    #completewith DarnDwarfHBoat
    >>|cRXP_WARN_后续暮色森林的任务需要50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_时，将|r |T132832:0|t|cRXP_LOOT_[小蛋]|r|cRXP_WARN_和|r |T134059:0|t[甜香料]|cRXP_WARN_做成|r |T132834:0|t[草药烘蛋]
    .usespell 2550
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .itemcount 6889,1 --Small Egg (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    #label DarnDwarfHBoat
    .goto 1439,33.213,39.883
    .zone Teldrassil >> 乘船前往达纳苏斯
    .zoneskip Darnassus

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    .goto 1438/1,841.56,8640.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fp Teldrassil >> 开通泰达希尔的飞行路线
    .target 维斯派塔斯

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    #optional
    #completewith next
    .goto 1438/1,965.80,8780.95
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    .goto 1457/1,2511.01,10178.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .trainer >> 学习职业技能
    .target 祖卡斯特

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊琳尼雅·月火|r交谈
    .goto 1457/1,2329.19,9908.60
    .train 264 >> 学习弓
    .train 227 >> 学习法杖
    .target 伊琳尼雅·月火

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    .goto 1457/1,2268.76,9770.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰德瑞亚|r交谈
    >>|cRXP_BUY_向她购买|r |T135489:0|t[重型弯弓]|cRXP_BUY_和|r |T134410:0|t[中型箭袋]|cRXP_BUY_各一件|r
    .collect 3027,1 -- Heavy Recurve Bow
    .collect 11362,1 -- Medium Quiver
    .target 兰德瑞亚
    .money <0.7349
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20

step << Hunter
    #completewith next
    +|cRXP_WARN_装备|r |T135489:0|t[重型弯弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.19
    .xp <20,1

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    .goto 1438/1,2607.86,9641.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .turnin 741 >> 交任务：健忘的勘察员
    .accept 942 >> 接受任务：健忘的勘察员
    .target 首席考古学家杜瑟·灰须
    .isOnQuest 741

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    #optional
    .goto 1438/1,2607.86,9641.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .accept 942 >> 接受任务：健忘的勘察员
    .target 首席考古学家杜瑟·灰须
    .isQuestTurnedIn 741

step << Druid
    #optional
    #completewith MoongladeTrain
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade
    -- step << Druid
    --     .goto 1450/1,-2678.53,8023.63
    --     >>Go to Moonglade
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dendrite Starblaze|r
    --     .turnin 6124 >> Turn in Curing the Sick
    --     .accept 6125 >> Accept Power over Poison
    --     .target Dendrite Starblaze
    --     .isQuestTurnedIn 6123

step << Druid
    #label MoongladeTrain
    .goto 1450/1,-2593.82,7867.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔

step << NightElf !Druid/Dwarf Hunter/Human Hunter/Skyborne Hunter
    #completewith BeachedCloak
    #map Darkshore
    .goto 1448/1,577.92,6371.65,100 >> 前往奥伯丁
    .cooldown item,6948,<0

step << NightElf/Dwarf Hunter/Human Hunter/Skyborne Hunter
    #optional
    #completewith next
    .hs >> 使用炉石返回奥伯丁
    .cooldown item,6948,>0,1

step << Druid
    .goto 1450/1,-2491.79,7454.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_辛德拉尔|r 交谈
    .fly Auberdine >>炉石无法使用时，飞回奥伯丁
    .target 辛德拉尔
    .zoneskip Darkshore

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    .goto 1457/1,2636.53,9956.80
    .zone Teldrassil >>炉石无法使用时，穿过紫色传送门前往鲁瑟兰村
    .zoneskip Teldrassil
    .zoneskip Darkshore

step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    .goto 1438/1,841.56,8640.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维斯派塔斯|r 交谈
    .fly Auberdine >>飞回奥伯丁
    .target 维斯派塔斯
    .zoneskip Darkshore

step
    #label BeachedCloak
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4727 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛

step
    #requires DeleteGyromast
    .goto 1439/1,577.38,6371.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >> 交任务：海中的水果
    .target 古博·布拉普
    .isQuestComplete 1138

step << NightElf
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4763 >> 交任务：黑木熊怪的堕落
    .target 桑迪斯·织风

step << NightElf
    #optional
    #completewith LostMasters
    .destroy 12342 >> 从背包中摧毁|T134059:0|t|cRXP_LOOT_[黑木谷物]|r，之后不再需要它

step << NightElf
    #optional
    #completewith LostMasters
    .destroy 12343 >> 从背包中摧毁|T133944:0|t|cRXP_LOOT_[黑木坚果]|r，之后不再需要它

step << NightElf
    #optional
    #completewith LostMasters
    .destroy 12341 >> 从背包中摧毁|T134013:0|t|cRXP_LOOT_[黑木水果]|r，之后不再需要它

step << NightElf Hunter
    .goto 1439/1,488.69,6564.830
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor >> 补充|T132382:0|t[锋利的箭]
    .target 达蒙德

step << NightElf
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2139 >> 交任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树

step << NightElf
    .isQuestComplete 986
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 986 >> 交任务：丢失的主人
    .accept 993 >> 接受任务：丢失的主人
    .target 特伦希斯

step << NightElf
    #label LostMasters
    .isQuestTurnedIn 986
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 993 >> 接受任务：丢失的主人
    .target 特伦希斯

step << NightElf
    #optional
    >>|cRXP_WARN_如果装备了|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_，请保留当前的披风备用，因为|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_会在后续交任务时消失|r
    .equip 15,5387 >>|cRXP_WARN_装备|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_（如果它比当前的披风更好）|r
    .itemcount 5387,1
    .itemStat 15,QUALITY,<7
    --Hunter stays Darkshore/Ashenvale
    --Shaman to IF for training then SW > Redridge
    --!Hunter !Shaman straight to SW > Redridge

step << !Hunter
    .goto 1439/1,488.69,6564.830
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    >>|cRXP_BUY_向他购买|r |T135237:0|t[燧石和火绒]|cRXP_BUY_和|r |T135435:0|t[普通木柴]|cRXP_BUY_各一份|r
    >>|cRXP_WARN_这些材料供你稍后乘船时提升|r |T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_后续暮色森林的任务需要50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .itemcount 6889,1 -- Small Egg (1+)
    .skill cooking,50,1
    .target 达蒙德

step << !Hunter
    #completewith next
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .vendor 6301 >>|cRXP_BUY_向他购买|r |T134059:0|t[甜香料]|cRXP_BUY_，直到|r |T134059:0|t[甜香料]|cRXP_BUY_的数量不少于背包里的|r |T132832:0|t[小蛋]|cRXP_BUY_数量|r
    .collect 2678,50,90,1,0x20,cooking --Mild Spices (1-50)
    .disablecheckbox
    .collect 6889,50,90,1,0x20,cooking --Small Egg (1-50)
    .disablecheckbox
    .target 高尔博德·钢手
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .itemcount 6889,1 -- Small Egg (1+)

step << !Hunter
    #label TravelMenethilRRBoat
    #completewith MenethilRRBoat
    .goto 1439/1,926.400,6542.900,15 >> 前往开往暴风城的船只停靠的码头 << !Shaman
    .goto 1439,32.432,43.744,15 >> 前往开往米奈希尔港的船只停靠的码头 << Shaman
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Ironforge
    .zoneskip Wetlands
    .zoneskip Stormwind City
    .zoneskip Redridge Mountains

step << !Hunter
    #optional
    #label DarkshoreRRCook1
    #requires TravelMenethilRRBoat
    #completewith MenethilRRBoat
    >>|cRXP_WARN_在码头等船时：|r
    .cast 818 >>|cRXP_WARN_生起|r |T135805:0|t[基础营火]|cRXP_WARN_（位于法术书的综合页签中）|r
    .usespell 818
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Ironforge
    .zoneskip Wetlands
    .zoneskip Stormwind City
    .zoneskip Redridge Mountains
    .itemcount 6889,1 --Small Egg (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50

step << !Hunter
    #optional
    #requires DarkshoreRRCook1
    #completewith MenethilRRBoat
    >>|cRXP_WARN_后续暮色森林的任务需要50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_时，将|r |T132832:0|t|cRXP_LOOT_[小蛋]|r|cRXP_WARN_和|r |T134059:0|t[甜香料]|cRXP_WARN_做成|r |T132834:0|t[草药烘蛋]
    .usespell 2550
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Ironforge
    .zoneskip Wetlands
    .zoneskip Stormwind City
    .zoneskip Redridge Mountains
    .itemcount 6889,1 --Small Egg (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1

step << !Hunter
    #label MenethilRRBoat
    .goto 1439/1,826.67,6409.82 << Shaman
    .goto 1439/1,929.100,6543.600 << !Hunter !Shaman
    >>|cRXP_WARN_等船时提升|r |T135966:0|t[急救]|cRXP_WARN_技能|r << Rogue/Warrior/Paladin
    .zone Stormwind City >> 乘船前往暴风城 << !Shaman
    .zone Wetlands >> 乘船前往米奈希尔港 << Shaman
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Ironforge
    .zoneskip Wetlands
    .zoneskip Stormwind City
    .zoneskip Redridge Mountains

step << Shaman
    .money <0.08
    .goto 1437/0,-819.67,-3691.42,25,0
    .goto 1437/0,-807.26,-3716.22,25,0
    .goto 1437/0,-827.94,-3724.49,25,0
    .goto 1437,10.760,56.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔·奥雷|r交谈
    .vendor >> |cRXP_WARN_购买|r |T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量供应的物品。如果|r|cRXP_FRIENDLY_尼尔·奥雷|r|cRXP_WARN_没有出售，就跳过这一步|r
    .target 尼尔·奥雷
    .bronzetube

step << Shaman
    .goto 1437/0,-782.03,-3793.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_谢尔雷|r交谈
    .fly Ironforge >> 飞往铁炉堡
    .target 谢尔雷·布隆迪尔

step << Shaman
    .goto 1455/0,-1086.500,-4642.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃尔德伦·风暴破坏者::258098|r交谈
    .target 埃尔德伦·风暴破坏者::258098
    .trainer >> 学习职业技能

step << Shaman
    #optional
    .goto 1455/0,-1115.43,-4598.86--c:Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛利·硬骨|r交谈
    .turnin 968 >> 交任务：深渊之神
    .target 葛利·硬骨
    .isOnQuest 968

step << Shaman
    #completewith next
    .goto 1455/0,-1249.95,-4793.470
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考格斯宾|r交谈
    .vendor >> |cRXP_WARN_购买|r |T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量供应的物品。如果|r|cRXP_FRIENDLY_考格斯宾|r|cRXP_WARN_没有出售，就跳过这一步|r
    --  >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 考格斯宾

step << Shaman
    .goto 1455/0,-1330.28,-4843.6,5,0
    .zone Stormwind City >> 进入矿道地铁，乘车前往暴风城
    >>|cRXP_WARN_等地铁时，按需提升|r |T135966:0|t[急救]|cRXP_WARN_技能|r
    >>|cRXP_WARN_你需要把|r |T135966:0|t[急救]|cRXP_WARN_练到80，以便完成24级的任务|r << Rogue !Dwarf
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（联盟）
#subgroupdisplayname 1-20
#forever
#disabledungeons
#version 1
<< Alliance !Hunter
#group RestedXP Forever Guide (A)
#subgroup Speedrun Guide 1-20
--#groupid RXP-SRGCE-A1
#name 19-20 Redridge
#next 20-21 Darkshore/Ashenvale
#displayname 19-20 赤脊山

step << Shaman
    .goto 1453/0,638.8,-8341.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利巴布·旋轮|r 交谈
    .vendor >> |cRXP_WARN_购买一根|r |T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量商品。如果 |r|cRXP_FRIENDLY_比利巴布·旋轮|r|cRXP_WARN_ 没有货，就跳过此步骤|r
    --    >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 比利巴布·旋轮
    .zoneskip Stormwind City,1

step << Shaman
    .goto 1453/0,634.800,-8390.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沉默的舒尼|r 交谈
    .accept 2040 >> 接任务：地底突袭
    .target 沉默的舒尼

step << Shaman
    .goto 1453/0,600.22,-8426.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗伦·长须|r 交谈
    .turnin 1338 >> 交任务：卡尔·雷矛的订单
    .target 弗伦·长须
    .isOnQuest 1338

step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔德·蓟草|r 交谈
    .accept 167 >> 接任务：我的兄弟……
    .accept 168 >> 接任务：收集记忆
    .goto 1453/0,501.200,-8468.601
    .target 维尔德·蓟草

step << !Shaman
    .goto 1453/0,1193.100,-8328.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_货单登记员菲尔莫::268511|r 交谈
    .target 货单登记员菲尔莫::268511
    .accept 97220 >>接任务：菲尔莫的请求

step << Mage
    #completewith next
    .goto 1453/0,874.32,-9014.67,10 >> 前往法师塔

step << Mage
    .goto 1453/0,885.34,-9006.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾尔莎林|r 交谈
    .trainer >> 学习职业技能
    .target 艾尔莎林

step << Warlock
    #completewith next
    .goto 1453/0,988.44,-8942.15,20,0
    .goto 1453/0,1015.33,-8978.9,15 >> 前往已宰的羔羊旅店，走下楼梯

step << Warlock
    .goto 1453/0,1029.98,-8971.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林

step << Warlock/Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿德温·凯伦|r 交谈
    >>|cRXP_WARN_购买一根|r |T135139:0|t[燃烧魔杖]，|cRXP_WARN_如果它能提升你的装备|r
    >>|cRXP_WARN_务必购买不造成暗影伤害的魔杖，之后需要对付抗暗影伤害的怪物|r
    .goto 1453/0,807.64,-8880.84,14,0
    .goto 1453/0,804.55,-8862.47
    .collect 5210,1
    .target 阿德温·凯伦

step << Paladin/Priest
    #completewith next
    .goto 1453/0,809.52,-8579.22,20 >> 前往暴风城大教堂

step << Paladin
    .goto 1453/0,859.13,-8559.14,10,0
    .goto 1453/0,861.14,-8573.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 交谈
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟

step << Human Paladin
    .goto 1453/0,845.800,-8545.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 交谈
    .turnin 1780 >>交任务：圣洁之书
    .accept 1781 >>接任务：圣洁之书
    .target 达索瑞恩·拉尔

step << Human Paladin
    .goto 1453/0,862.400,-8516.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贾森·坦诺姆|r 交谈
    .turnin 1781 >>交任务：圣洁之书
    .accept 1786 >>接任务：圣洁之书
    .target 贾森·坦诺姆

step << Priest
    .goto 1453/0,862.89,-8519.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔舒修士|r 交谈
    .trainer >> 学习职业技能
    .target 乔舒修士

step
    #optional
    .goto 1453/0,719.67,-8550.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r 交谈
    .turnin 399 >> 交任务：童年的记忆
    .target 巴隆斯·阿历克斯顿
    .isQuestComplete 399

step << !Shaman
    .goto 1453/0,600.22,-8426.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗伦·长须|r 交谈
    .turnin 1338 >> 交任务：卡尔·雷矛的订单
    .target 弗伦·长须
    .isOnQuest 1338

step << !Shaman
    .goto 1453/0,634.800,-8390.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沉默的舒尼|r 交谈
    .accept 2040 >> 接任务：地底突袭
    .target 沉默的舒尼

step << !Shaman
    .goto 1453/0,638.8,-8341.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利巴布·旋轮|r 交谈
    .vendor >> |cRXP_WARN_购买一根|r |T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量商品。如果 |r|cRXP_FRIENDLY_比利巴布·旋轮|r|cRXP_WARN_ 没有货，就跳过此步骤|r
    --    >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 比利巴布·旋轮
    .zoneskip Stormwind City,1

step << !Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔德·蓟草|r 交谈
    .accept 167 >> 接任务：我的兄弟……
    .accept 168 >> 接任务：收集记忆
    .goto 1453/0,501.200,-8468.601
    .target 维尔德·蓟草

step << Rogue
    .goto 1453/0,377.61,-8752.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 交谈
    >>|cRXP_WARN_务必同时学习|r |T136058:0|t[开锁]，|cRXP_WARN_稍后的潜行者职业任务会用到|r
    .trainer >> 学习职业技能
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .target 夜行者奥斯伯

step << Rogue
    #completewith next
    .goto 1453/0,374.11,-8762.88,20,0
    .goto 1453/0,326.66,-8818.01,20,0
    .goto 1453/0,323.43,-8817.83,5 >> 进入军情7处总部，上楼前往 |cRXP_FRIENDLY_“剃刀”雷吉克|r 身边

step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_“剃刀”雷吉克|r 交谈
    .accept 2281 >> 接任务：赤脊山的联络员
    .goto 1453/0,362.55,-8819.80
    .target “剃刀”雷吉克

step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_武神|r 或 |cRXP_FRIENDLY_伊尔萨|r 交谈
    .goto 1453/0,358.25,-8728.28,15,0
    .goto 1453/0,302.6,-8685.53,15,0
    .goto 1453/0,323.3,-8689.29
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾

step << Mage/Rogue/Warlock/Druid/Warrior/Paladin
    .goto 1453/0,613.12,-8795.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吴平|r 交谈
    .train 201 >> 学习单手剑（1H） << Mage/Rogue/Warlock
    .train 1180 >> 学习匕首 << Mage/Druid
    .train 202 >> 学习双手剑（2H） << Warrior/Paladin
    .target 吴平

step << Rogue
    #ah
    .goto 1453/0,609.63,-8787.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛尔达·维勒|r 交谈
    >>|cRXP_BUY_购买一把|r |T135342:0|t[波刃短剑]，|cRXP_BUY_也可以从拍卖行购买更好的武器|r
    >>|cRXP_WARN_达到 19 级后装备它|r
    .collect 2209,1 --Kris
    .target 玛尔达·维勒
    .money <0.7115
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.9

step << Rogue
    #ssf
    .goto 1453/0,609.63,-8787.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛尔达·维勒|r 交谈
    >>|cRXP_BUY_购买一把|r |T135342:0|t[波刃短剑]
    >>|cRXP_WARN_达到 19 级后装备它|r
    .collect 2209,1 --Kris
    .money <0.7115
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.9
    .target 玛尔达·维勒

step << Rogue
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135342:0|t[波刃短剑]
    .use 2209
    .itemcount 2209,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.89
    .xp <19,1

step -- must be on quest now to loot Great Goretusk Snout
    #ah
    .goto 1453/0,660.28,-8814.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拍卖师亚克森|r 交谈
    >>购买 |T134437:0|t[抗毒药剂]，为稍后的 |T132290:0|t[毒药] 任务做准备；再购买其余物品，以便稍后在赤脊山更快交任务 << !Dwarf Rogue
    >>购买以下物品，稍后在赤脊山可以更快交任务 << !Rogue/Dwarf Rogue
    >>这样可以省去四处寻找怪物击杀的时间。如果不想购买，就跳过此步骤
    >>|T134437:0|t[抗毒药剂] << !Dwarf Rogue
    -->>|T134172:0|t[Great Goretusk Snout]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    --.collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target 拍卖师亚克森

step
    .goto 1453/0,566.600,-8845.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊莱恩·提亚斯::483|r 交谈
    .target 伊莱恩·提亚斯::483
    .turnin 97220 >>交任务：菲尔莫的请求
    .accept 97222 >>接任务：门楼货物

step
    .goto 1453/0,568.300,-8862.200
    .use 277198 >> |cRXP_WARN_使用|r |T132762:0|t[门楼货物]，|cRXP_WARN_在楼上的 |r|cRXP_PICK_门楼房门|r|cRXP_WARN_ 前交付|r
    .complete 97222,1 --|1/1 Gatehouse Shipment delivered

step
    .goto 1453/0,566.600,-8845.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊莱恩·提亚斯::483|r 交谈
    .target 伊莱恩·提亚斯::483
    .turnin 97222 >>交任务：门楼货物

step << !Skyborne
    #completewith orcs
    .goto 1453/0,484.200,-8832.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 交谈
    .fly Redridge >> 飞往赤脊山 << !NightElf
    .fp Stormwind >> 开通暴风城飞行点 << NightElf/Dwarf Hunter
    .target 杜加尔·朗德瑞克
    .zoneskip Redridge Mountains

step << NightElf/Skyborne/Dwarf Hunter
    #completewith RRFP
    .goto 1429/0,389.800,-9119.900
    .zone Elwynn Forest >> 离开暴风城
    .zoneskip Redridge Mountains

step << NightElf/Skyborne/Dwarf Hunter
    #completewith RRFP
    .goto 1433/0,-1948.56,-9582.75
    .zone Redridge Mountains >> 前往赤脊山

step
    .goto 1433/0,-1906.400,-9606.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵帕克|r 交谈
    .accept 244 >> 接任务：豺狼人的入侵
    .target 卫兵帕克

step
    .goto 1433/0,-2237.93,-9443.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 交谈
    .turnin 244 >> 交任务：豺狼人的入侵
    .accept 246 >> 接任务：审时度势
    .accept 98407 >>接任务：武力展示
    .target 菲尔顿副队长

step << NightElf/Skyborne/Dwarf Hunter
    #label RRFP
    .goto 1433/0,-2234.900,-9435.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
    .fp Redridge Mountains >> 开通赤脊山飞行点
    .target 艾蕾娜·斯托姆法瑟

step
    #label BMenace
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官马瑞斯|r 交谈
    .goto 1433/0,-2298.06,-9284.04
    .accept 20 >> 接任务：黑石氏族的威胁
    .accept 98387 >>接任务：黑石封锁
    .target 治安官马瑞斯

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 交谈
    .goto 1433/0,-2268.32,-9279.12
    .accept 125 >> 接任务：丢失的工具
    .target 工头奥斯洛

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 交谈
    .target 弗纳·奥斯古
    .goto 1433/0,-2243.14,-9259.43
    .accept 118 >> 接任务：马掌

step
    .group
    .goto 1433/0,-2208.600,-9243.500
    >>点击 |cRXP_PICK_通缉告示|r
    .accept 95999 >>接任务：通缉：焚化者加因姆

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_所罗门镇长|r 交谈
    .target 所罗门镇长
    .goto 1433/0,-2221.65,-9218.60
    .accept 120 >> 接任务：送往暴风城的信

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_码头管理员巴伦|r 交谈
    .target 码头管理员巴伦
    .goto 1433/0,-2172.15,-9261.310
    .accept 127 >> 接任务：卖鱼

step
    .goto 1433/0,-2152.62,-9217.870
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达希|r 交谈
    >>|cRXP_FRIENDLY_达希|r |cRXP_WARN_在旅店内走动|r
    .target 达希
    .accept 129 >> 接任务：免费的午餐

step
    .goto 1433/0,-2164.56,-9213.10,8,0
    .goto 1433/0,-2145.67,-9231.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_黑衣威利|r 交谈
    .target 黑衣威利
    .turnin 65 >> 交任务：迪菲亚兄弟会
    .isOnQuest 65

step << skip -- must on quest now to loot Great Goretusk Snout
    #optional
    .goto 1433/0,-2062.96,-9209.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r 交谈
    .accept 92 >> 接任务：赤脊山炖肉
    .turnin 92 >> 交任务：赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target 厨师布雷纳

step
    .goto 1433/0,-2062.96,-9209.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r 交谈
    .accept 92 >> 接任务：赤脊山炖肉
    .target 厨师布雷纳

step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛蒂·詹罗斯|r 交谈
    .target 玛蒂·詹罗斯
    .goto 1433/0,-2045.16,-9245.67
    .accept 34 >> 接任务：不速之客

step << Warlock
    .goto 1433/0,-1911.22,-9288.820
    >>击杀 |cRXP_ENEMY_贝利格拉布|r，拾取 |cRXP_LOOT_贝利格拉布的獠牙|r
    >>|cRXP_WARN_将 |r|cRXP_ENEMY_贝利格拉布|r|cRXP_WARN_ 风筝回湖畔镇，让 |r|cRXP_FRIENDLY_卫兵|r|cRXP_WARN_ 帮忙击杀|r |cRXP_ENEMY_贝利格拉布|r
    >>|cRXP_WARN_此任务很难。可以先跳过，稍后再回来|r
    .complete 34,1 -- Bellygrub's Tusk (1)
    .link https://youtu.be/6JE967OG3CU?t=1845 >> |cRXP_WARN_点击此处观看视频指南|r
    .mob 贝利格拉布

step << Warlock
    .isQuestComplete 34
    .goto 1433/0,-2045.16,-9245.67
    .target 玛蒂·詹罗斯
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛蒂·詹罗斯|r 交谈
    .turnin 34 >> 交任务：不速之客

step << Rogue
    .goto 1433/0,-2180.19,-9328.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2281 >> 交任务：赤脊山的联络员
    .accept 2282 >> 接任务：奥瑟尔伐木场
    .target 卢修斯

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肖恩|r 交谈
    .target 肖恩
    .goto 1433/0,-2207.10,-9351.52
    .accept 3741 >> 接任务：希拉里的项链

step
    >>|cRXP_WARN_跳入湖中|r
    >>打开 |cRXP_PICK_闪光的泥浆|r，拾取 |cRXP_LOOT_希拉里的项链|r
    >>|cRXP_WARN_它在湖中有多个刷新点|r
    .goto 1433/0,-2174.32,-9386.56,0
    .goto 1433/0,-2147.41,-9308.08,0
    .goto 1433/0,-2090.96,-9373.82,0
    .goto 1433/0,-1986.76,-9324.30,0
    .goto 1433/0,-2246.40,-9359.92,0
    .goto 1433/0,-2309.57,-9376.28,0
    .goto 1433/0,-2397.70,-9363.97,0
    .goto 1433/0,-1986.76,-9324.30,70,0
    .goto 1433/0,-2397.70,-9363.97,70,0
    .complete 3741,1 --Hilary's Necklace (1)

step << Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希拉里|r 交谈
    .target 希拉里
    .goto 1433/0,-2205.58,-9351.52
    .turnin 3741 >> 交任务：希拉里的项链

step
    #softcore
    >>打开 |cRXP_PICK_沉没的宝箱|r，拾取 |cRXP_LOOT_奥斯洛的工具箱|r
    .goto 1433/0,-2472.16,-9366.72
    .complete 125,1 --Oslow's Toolbox (1)

step
    #sticky
    #completewith orcs
    >>击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取 |cRXP_LOOT_巨型血牙野猪头|r
    >>击杀 |cRXP_ENEMY_狼蛛|r，拾取 |cRXP_LOOT_香脆蜘蛛肉|r
    >>击杀 |cRXP_ENEMY_恐鹫|r，拾取 |cRXP_LOOT_硬秃鹫肉|r
    >>|cRXP_WARN_交付“赤脊山炖肉”任务前，不要出售这些物品|r
    >>|cRXP_WARN_保留你拾取到的所有|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，之后可用它们将|r |T133971:0|t[烹饪]|cRXP_WARN_提升到50点，这是稍后暮色森林任务的需要|r
    .collect 2296,5,92,1
    .collect 1080,5,92,1
    .collect 1081,5,92,1
    .mob 巨型血牙野猪
    .mob 狼蛛
    .mob 恐鹫

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵帕克|r 交谈
    .target 卫兵帕克
    .goto 1433/0,-1906.400,-9606.800
    .accept 244 >> 接任务：豺狼人的入侵

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵帕克|r 交谈
    .target 卫兵帕克
    .goto 1433/0,-1906.400,-9606.800
    .turnin 129 >> 交任务：免费的午餐
    .accept 130 >> 接任务：寻访草药师

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 交谈
    .target 菲尔顿副队长
    .goto 1433/0,-2237.28,-9443.750
    .turnin 244 >> 交任务：豺狼人的入侵
    .accept 246 >> 接任务：审时度势

step
    #completewith next
    >>击杀|cRXP_ENEMY_混血赤脊山豺狼人|r和|cRXP_ENEMY_赤脊山偷猎者|r
    >>击杀 |cRXP_ENEMY_赤脊山鞭笞者|r，拾取 |cRXP_LOOT_尖刺项圈|r
    .complete 246,1 --Redridge Mongrel (10)
    .mob +混血赤脊山豺狼人
    .complete 246,2 --Redridge Poacher (6)
    .mob +赤脊山偷猎者
    .complete 98407,1 --Spiked Collar (5)
    .mob +赤脊山鞭笞者

step
    .goto 1433/0,-2031.48,-9556.25,45,0
    .goto 1433/0,-1955.07,-9637.63,45,0
    .goto 1433/0,-1813.97,-9679.9,45,0
    .goto 1433/0,-1861.07,-9754.76,45,0
    .goto 1433/0,-1980.25,-9641.10
    >>击杀 |cRXP_ENEMY_狼蛛|r，拾取 |cRXP_LOOT_香脆蜘蛛肉|r
    .collect 1081,5,92,1
    .mob 狼蛛

step
    #loop
    .goto 1433/0,-1913.800,-9490.601,50,0
    .goto 1433/0,-2211.01,-9773.870,45,0
    .goto 1433/0,-2276.79,-9759.11,45,0
    .goto 1433/0,-2508.20,-9620.68,45,0
    .goto 1433/0,-2246.61,-9764.90,45,0
    >>击杀|cRXP_ENEMY_混血赤脊山豺狼人|r和|cRXP_ENEMY_赤脊山偷猎者|r
    >>击杀 |cRXP_ENEMY_赤脊山鞭笞者|r，拾取 |cRXP_LOOT_尖刺项圈|r
    .complete 246,1 --Redridge Mongrel (10)
    .mob +混血赤脊山豺狼人
    .complete 246,2 --Redridge Poacher (6)
    .mob +赤脊山偷猎者
    .complete 98407,1 --Spiked Collar (5)
    .mob +赤脊山鞭笞者

step
    .goto 1433/0,-2634.54,-9588.54
    >>击杀 |cRXP_ENEMY_鱼人巡滩者|r 和 |cRXP_ENEMY_鱼人小招潮者|r，拾取 |cRXP_LOOT_鱼人的鳍|r 和 |cRXP_LOOT_斑点太阳鱼|r
    >>|cRXP_WARN_注意，此区域的 |r|cRXP_ENEMY_鱼人|r|cRXP_WARN_ 刷新速度很快|r
    .complete 127,1
    .collect 1468,8,150,1
    .mob 鱼人巡滩者
    .mob 鱼人小招潮者

step
    .goto 1433/0,-2903.07,-9691.340
    >>击杀 |cRXP_ENEMY_恐鹫|r，拾取 |cRXP_LOOT_硬秃鹫肉|r
    >>|cRXP_WARN_如果没有看到|r |cRXP_ENEMY_恐鹫|r，就跳过此步骤
    .collect 1080,5,92,1
    .mob 恐鹫

step
    .group 4
    .isOnQuest 95999
    #sticky
    #label IncineratorGarim
    .waypoint 1433/0,-3261.400,-9824.700
    >>击杀洞穴内的 |cRXP_ENEMY_焚化者加因姆|r，拾取 |cRXP_LOOT_焚化者加因姆的断裂法杖|r
    >>|cRXP_WARN_如果无法组队击杀，就跳过此步骤|r
    .complete 95999,1 -- Broken Staff of Incinerator Gar'im (1)
    .mob 焚化者加因姆

step
    #completewith next
    >>拾取地上的 |cRXP_PICK_谷物袋|r 和 |cRXP_PICK_肉块|r，获得 |cRXP_LOOT_黑石补给品|r
    >>拾取地上的 |cRXP_PICK_武器架|r 和 |cRXP_PICK_失窃的武器|r
    .complete 98387,1 -- Stolen Supplies (10)
    .complete 98387,2 -- Stolen Weapon (8)

step
    #label orcs
    #loop
    >>击杀 |cRXP_ENEMY_黑石步兵|r 和 |cRXP_ENEMY_黑石前锋|r，拾取 |cRXP_LOOT_破斧|r
    >>|cRXP_WARN_注意，|r|cRXP_ENEMY_黑石前锋|r|cRXP_WARN_ 会对你施放 |T132149:0|t[投网]|r
    .goto 1433/0,-3177.25,-9718.85,60,0
    .goto 1433/0,-3224.57,-9782.42,60,0
    .goto 1433/0,-3259.74,-9566.82,60,0
    .goto 1433/0,-3092.80,-9694.82,60,0
    .goto 1433/0,-3177.25,-9718.85,60,0
    .complete 20,1 --Battleworn Axe (10)
    .mob 黑石步兵
    .mob 黑石前锋

step
    #loop
    .goto 1433/0,-3177.25,-9718.85,60,0
    .goto 1433/0,-3224.57,-9782.42,60,0
    .goto 1433/0,-3259.74,-9566.82,60,0
    .goto 1433/0,-3092.80,-9694.82,60,0
    .goto 1433/0,-3177.25,-9718.85,60,0
    >>拾取地上的 |cRXP_PICK_谷物袋|r 和 |cRXP_PICK_肉块|r，获得 |cRXP_LOOT_黑石补给品|r
    >>拾取地上的 |cRXP_PICK_武器架|r 和 |cRXP_PICK_失窃的武器|r
    .complete 98387,1 -- Stolen Supplies (10)
    .complete 98387,2 -- Stolen Weapon (8)

step
    .group 4
    #requires IncineratorGarim

step
    .goto 1433/0,-2903.07,-9691.340
    >>击杀 |cRXP_ENEMY_恐鹫|r，拾取 |cRXP_LOOT_硬秃鹫肉|r
    .collect 1080,5,92,1
    .mob 恐鹫

step
    #hardcore
    >>|cRXP_WARN_跳入湖中|r
    >>打开 |cRXP_PICK_沉没的宝箱|r，拾取 |cRXP_LOOT_奥斯洛的工具箱|r
    .goto 1433/0,-2472.16,-9366.72
    .complete 125,1 --Oslow's Toolbox (1)

step
    .goto 1433/0,-2634.54,-9588.54
    .xp 20-7687 >> 刷怪至距离 20 级还差 7687 经验 << !Rogue
    .xp 20-10012 >> 刷怪至距离 20 级还差 10012 经验 << Rogue

step << Rogue
    #completewith next
    .subzone 97 >> 前往奥瑟尔伐木场

step << Rogue
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_必须完成此步骤，为稍后的|r |T132290:0|t[毒药] |cRXP_WARN_任务做准备|r
    >>|cRXP_WARN_站在导航点，调整镜头和光标，确保无需移动就能依次点击 3 个 |r|cRXP_PICK_练习用保险箱|r
    .skill lockpicking,80 >>|cRXP_WARN_打开奥瑟尔伐木场地上的 |r|cRXP_PICK_练习用保险箱|r|cRXP_WARN_，直到|r |T136058:0|t[开锁] 技能达到 80

step << Rogue
    .goto 1433/0,-2700.75,-9222.07
    >>打开 |cRXP_PICK_卢修斯的箱子|r，拾取 |cRXP_LOOT_偷窃技能证明物|r
    .complete 2282,1 --Token of Thievery
    .skill lockpicking,<80,1

step
    #completewith next
    .goto 1433/0,-2298.06,-9284.04,150 >> 前往湖畔镇

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官马瑞斯|r 交谈
    .target 治安官马瑞斯
    .goto 1433/0,-2298.06,-9284.04
    .turnin 20 >> 交任务：黑石氏族的威胁
    .turnin 98387 >>交任务：黑石封锁

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 交谈
    .target 工头奥斯洛
    .goto 1433/0,-2268.32,-9279.12
    .turnin 125 >> 交任务：丢失的工具
    .accept 89 >> 接任务：止水湖上的桥

step
    #optional
    .isQuestComplete 95999
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_所罗门镇长|r 交谈
    .target 所罗门镇长
    .goto 1433/0,-2207.10,-9231.34,15,0
    .goto 1433/0,-2221.65,-9218.60
    .turnin 95999 >>交任务：通缉：焚化者加因姆

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_码头管理员巴伦|r 交谈
    .target 码头管理员巴伦
    .goto 1433/0,-2172.59,-9261.02
    .turnin 127 >> 交任务：卖鱼
    .accept 150 >> 接任务：鱼人偷猎者
    .turnin 150 >> 交任务：鱼人偷猎者
    .xp <20,1

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_码头管理员巴伦|r 交谈
    .target 码头管理员巴伦
    .goto 1433/0,-2172.59,-9261.02
    .turnin 127 >> 交任务：卖鱼

step << Druid
    .goto 1433/0,-2152.62,-9223.67--c:Redridge Mountains,26.8,44.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板布瑞安娜|r 交谈
    .home Lakeshire >> 将炉石绑定在湖畔镇
    .target 旅店老板布瑞安娜

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r 交谈
    .target 厨师布雷纳
    .goto 1433/0,-2062.96,-9209.62
    .turnin 92 >> 交任务：赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛蒂·詹罗斯|r 交谈
    .target 玛蒂·詹罗斯
    .goto 1433/0,-2045.38,-9245.82
    .turnin 130 >> 交任务：寻访草药师
    .accept 131 >> 接任务：水仙诉衷情

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达希|r 交谈
    >>|cRXP_FRIENDLY_达希|r |cRXP_WARN_在旅店内走动|r
    .target 达希
    .goto 1433/0,-2152.62,-9216.430
    .turnin 131 >> 交任务：水仙诉衷情

step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .target 卢修斯
    .goto 1433/0,-2180.19,-9328.21
    .turnin 2282 >> 交任务：奥瑟尔伐木场

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希拉里|r 交谈
    .target 希拉里
    .goto 1433/0,-2205.58,-9351.52
    .turnin 3741 >> 交任务：希拉里的项链

step << Rogue
    #optional
    #completewith InRR
    .destroy 7907 >> 摧毁 |T134328:0|t[偷窃技能认证书]，之后不再需要

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 交谈
    .target 菲尔顿副队长
    .goto 1433/0,-2237.93,-9443.60
    .turnin 246 >> 交任务：审时度势
    .turnin 98407 >>交任务：武力展示

step
    .goto 1433/0,-2634.54,-9588.54
    .xp 20 >> 刷怪至 20 级
    -- Druid Cat form quest --

step << Druid
    #completewith catspirit1
    .cast 18960 >> 施放传送：月光林地

step << Druid
    #completewith next
    .goto 1450/1,-2400.33,7795.33--c:Moonglade,44.148,45.229
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希尔瓦·菲纳雯斯|r 交谈
    .fly Teldrassil >> 飞往达纳苏斯
    .skipgossip
    .timer 153,达纳苏斯
    .target 希尔瓦·菲纳雯斯
    .zoneskip Darnassus
    .zoneskip Teldrassil

step << Druid
    #optional
    #completewith next
    .goto 1438/1,965.80,8780.95
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯

step << Druid
    #label catspirit1
    .goto 1457/1,2564.600,10179.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛斯雷·驭熊者::4217|r 交谈
    .target 玛斯雷·驭熊者::4217
    .accept 98393 >>接任务：巨豹之灵

step << Druid
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade

step << Druid
    .goto 1450/1,-2678.900,8020.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德迪利特·星焰::11802|r 交谈
    .target 德迪利特·星焰::11802
    .turnin 98393 >>交任务：巨豹之灵
    .accept 98341 >>接任务：驭风巨豹之灵 << Skyborne
    .accept 98394 >>接任务：巨豹之灵 << !Skyborne

step << Druid !Skyborne
    .goto 1450/1,-2640.000,7338.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巨豹之灵|r 交谈
    .turnin 98394 >>交任务：巨豹之灵
    .accept 98396 >>接任务：巨豹之灵
    .target 巨豹之灵

step << Druid Skyborne
    .goto 1450/1,-2352.700,7375.600,10,0
    .goto 1450/1,-2394.300,7361.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞利楠的化身::272054|r 交谈
    .target 塞利楠的化身::272054
    .turnin 98341 >>交任务：驭风巨豹之灵
    .accept 98404 >>接任务：驭风巨豹之灵

step << Druid
    #completewith next
    .goto 1450/1,-3046.700,7534.400
    --aura 1309054?
    .subzone 2363 >> 前往怒风兽穴

step << Druid
    >>深入洞穴，过桥后在凹室内寻找猎豹雕像，点击雕像旁的小球
    >>拾取 |cRXP_LOOT_利爪圣物|r
    .goto 1450/1,-3117.400,7455.300
    .complete 98404,2 << Skyborne --|1/1 Relic of the Claw
    .complete 98396,2 << !Skyborne --|1/1 Relic of the Claw

step << Druid
    >>点击猎豹雕像旁的小球
    >>拾取 |cRXP_LOOT_静影圣物|r
    .goto 1450/1,-3099.200,7485.700
    .complete 98404,3  << Skyborne --|1/1 Relic of the Silent Shadow
    .complete 98396,3  << !Skyborne --|1/1 Relic of the Silent Shadow

step << Druid
    >>点击猎豹雕像旁的小球
    >>拾取 |cRXP_LOOT_尖牙圣物|r
    .goto 1450/1,-3054.100,7476.800
    .complete 98404,1  << Skyborne --|1/1 Relic of the Fang
    .complete 98396,1  << !Skyborne --|1/1 Relic of the Fang

step << Druid !Skyborne
    .goto 1450/1,-2640.000,7338.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巨豹之灵|r 交谈
    .turnin 98396 >>交任务：巨豹之灵
    .accept 98731 >>接任务：巨豹之灵的祝福
    .target 巨豹之灵

step << Druid Skyborne
    .goto 1450/1,-2395.400,7361.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞利楠的化身::272054|r 交谈
    .target 塞利楠的化身::272054
    .turnin 98404 >>交任务：驭风巨豹之灵
    .accept 98738 >>接任务：驭风巨豹之灵的祝福

step << Druid
    .goto 1450/1,-2678.200,8021.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t传送至月光林地，与 |cRXP_FRIENDLY_德迪利特·星焰::11802|r 交谈
    .target 德迪利特·星焰::11802
    .usespell 18960
    .turnin 98738 >>交任务：驭风巨豹之灵的祝福 << Skyborne
    .turnin 98731 >>交任务：巨豹之灵的祝福 << !Skyborne
    .accept 98397 >>接任务：前往达纳苏斯 --<< Alliance
    --.accept 98362 >>Accept To Thunder Bluff << Horde

step << Druid
    #completewith catspirit2
    .goto 1450/1,-2400.33,7795.33--c:Moonglade,44.148,45.229
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希尔瓦·菲纳雯斯|r 交谈
    .fly Teldrassil >> 飞往达纳苏斯
    .skipgossip
    .timer 153,达纳苏斯
    .target 希尔瓦·菲纳雯斯
    .zoneskip Darnassus
    .zoneskip Teldrassil

step << Druid
    #completewith next
    .goto 1450/1,-2400.33,7795.33--c:Moonglade,44.148,45.229
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希尔瓦·菲纳雯斯|r 交谈
    .fly Teldrassil >> 飞往达纳苏斯
    .skipgossip
    .timer 153,达纳苏斯
    .target 希尔瓦·菲纳雯斯
    .zoneskip Darnassus
    .zoneskip Teldrassil

step << Druid
    .goto 1438/1,965.80,8780.95
    .zone Darnassus >>穿过紫色传送门进入达纳苏斯

step << Druid
    #label catspirit2
    .goto 1457/1,2564.400,10179.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛斯雷·驭熊者::4217|r 交谈
    .target 玛斯雷·驭熊者::4217
    .turnin 98397 >>交任务：前往达纳苏斯

step << Druid
    #completewith next
    .cooldown item,6948,>2
    .hs >> 使用炉石返回湖畔镇
    -- Druid cat form quest end --

step << Druid
    .goto 1457/1,2636.53,9956.80
    .zone Teldrassil >>炉石无法使用时，穿过紫色传送门前往鲁瑟兰村
    .zoneskip Teldrassil
    .zoneskip Darkshore
    .zoneskip Redridge Mountains
    .zoneskip Stormwind City

step << Druid
    .goto 1438/1,841.56,8640.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维斯派塔斯|r 交谈
    .fly Auberdine >>飞往奥伯丁
    .target 维斯派塔斯
    .zoneskip Darkshore
    .zoneskip Redridge Mountains
    .zoneskip Stormwind City

step << Druid
    .goto 1439/1,929.100,6543.600
    .zone Stormwind City >>乘船返回暴风城
    .zoneskip Redridge Mountains

step
    #completewith InRR
    .zoneskip Stormwind City
    .goto 1433/0,-2234.89,-9435.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
    .target 艾蕾娜·斯托姆法瑟
    .fly Stormwind >> 飞往暴风城

step << Rogue
    #ah
    .goto 1453/0,609.63,-8787.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛尔达·维勒|r 交谈
    >>|cRXP_WARN_购买一把|r |T135324:0|t[长剑]，|cRXP_WARN_达到 21 级后装备|r
    >>|cRXP_WARN_如果拍卖行有更便宜或更好的装备，就从拍卖行购买|r
    .collect 923,1 --Longsword (1)
    .target 玛尔达·维勒
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2

step << Rogue
    #ssf
    .goto 1453/0,609.63,-8787.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛尔达·维勒|r 交谈
    >>|cRXP_WARN_购买一把|r |T135324:0|t[长剑]，|cRXP_WARN_达到 21 级后装备|r
    .collect 923,1 --Longsword (1)
    .target 玛尔达·维勒
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2

step << Rogue
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1

step
    #optional
    .isQuestComplete 2040
    .goto 1453/0,634.800,-8390.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沉默的舒尼|r 交谈
    .turnin 2040 >> 交任务：地底突袭
    .target 沉默的舒尼

step
    #optional
    .isQuestComplete 168
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔德·蓟草|r 交谈
    .turnin 168 >> 交任务：收集记忆
    .goto 1453/0,501.200,-8468.601
    .target 维尔德·蓟草

step
    #optional
    .isQuestComplete 167
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔德·蓟草|r 交谈
    .turnin 167 >> 交任务：我的兄弟……
    .goto 1453/0,501.200,-8468.601
    .target 维尔德·蓟草

step << Warrior/Paladin
    #ah
    .goto 1453/0,607.48,-8790.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_冈瑟尔·维勒|r 交谈
    >>|cRXP_WARN_购买一把|r |T135280:0|t[微光重剑]，|cRXP_WARN_如果金币足够。达到 21 级后装备|r
    >>|cRXP_WARN_如果拍卖行有更便宜或更好的装备，就从拍卖行购买|r
    .collect 922,1 --Dacian Falx (1)
    .target 冈瑟尔·维勒
    .money <1.2038
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.0

step << Warrior/Paladin
    #ssf
    .goto 1453/0,607.48,-8790.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_冈瑟尔·维勒|r 交谈
    >>|cRXP_WARN_购买一把|r |T135280:0|t[微光重剑]，|cRXP_WARN_如果金币足够。达到 21 级后装备|r
    .collect 922,1 --Dacian Falx (1)
    .target 冈瑟尔·维勒
    .money <1.2038
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.0

step << Warrior/Paladin
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.89
    .xp <21,1

step << Warlock
    #completewith next
    .goto 1453/0,988.44,-8942.15,20,0
    .goto 1453/0,1015.33,-8978.9,15 >> 前往已宰的羔羊旅店，走下楼梯

step << Warlock
    .goto 1453/0,1029.98,-8971.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林

step << Warlock
    .goto 1453/0,1041.54,-8983.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 交谈
    .accept 1716 >> 接任务：噬魂者
    .target 黑暗缚灵者加科因

step << Mage
    #completewith next
    .goto 1453/0,874.32,-9014.67,10 >> 前往法师塔

step << Mage
    .goto 1453/0,885.34,-9006.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾尔莎林|r 交谈
    .trainer >> 学习职业技能
    .target 艾尔莎林

step << Mage
    .goto 1453/0,847.56,-8991.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉瑞麦尼|r 交谈
    .train 3561 >> 学习 |T135763:0|t[传送：暴风城]
    .xp <20,1
    .target 拉瑞麦尼·普尔度

step
    .goto 1453/0,1093.3,-8779.020
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿古斯·夜语|r 交谈
    .accept 3765 >> 接任务：遥远的旅途
    .target 阿古斯·夜语
    -- step << Druid
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sheldras Moontree|r
    --     .goto 1453/0,1100.15,-8776.330
    --     .trainer >> Train your class spells
    --     .train 768 >> Train |T132115:0|t[Cat Form]
    --     .target Sheldras Moontree

step << Paladin/Priest
    #completewith next
    .goto 1453/0,809.52,-8579.22,20 >> 前往暴风城大教堂

step << Paladin
    .goto 1453/0,845.95,-8545.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 交谈，他会给你 |T133739:0|t[|cRXP_LOOT_勇气之书|r]
    .use 6776 >>|cRXP_WARN_使用 |T133739:0|t[|r|cRXP_LOOT_勇气之书|r|cRXP_WARN_] 接取任务|r
    .collect 6776,1,1649 --Tome of Valor (1)
    .accept 1649 >>接任务：勇气之书
    .target 达索瑞恩·拉尔

step << Paladin
    .goto 1453/0,845.95,-8545.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 交谈
    .turnin 1649 >>交任务：勇气之书
    .accept 1650 >>接任务：勇气之书
    .target 达索瑞恩·拉尔

step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 交谈
    .goto 1453/0,859.13,-8559.14,10,0
    .goto 1453/0,861.14,-8573.03
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟

step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔舒修士|r 交谈
    .goto 1453/0,862.89,-8519.61
    .trainer >> 学习职业技能
    .target 乔舒修士

step << Rogue
    .goto 1453/0,377.61,-8752.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 交谈
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯

step << Rogue
    #completewith next
    .goto 1453/0,374.11,-8762.88,20,0
    .goto 1453/0,326.66,-8818.01,20,0
    .goto 1453/0,323.43,-8817.83,5 >> 进入军情7处总部，上楼前往 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 身边

step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 交谈
    .accept 2360 >> 接任务：马迪亚斯和迪菲亚潜行者
    .goto 1453/0,362.28,-8815.23
    .target 马迪亚斯·肖尔

step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_武神|r 或 |cRXP_FRIENDLY_伊尔萨|r 交谈
    .goto 1453/0,358.25,-8728.28,15,0
    .goto 1453/0,302.6,-8685.53,15,0
    .goto 1453/0,323.3,-8689.29
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾
    ----Start of Rogue 20 Quest <1.59x Section----

step << NightElf Rogue/Skyborne Rogue
    .goto 1436/0,1037.42,-10628.27,5,0
    .zone Westfall >> 前往西部荒野
    >>如果已经开通西部荒野飞行点，就飞过去
    .isOnQuest 2360

step << NightElf Rogue/Skyborne Rogue
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 交谈
    .fp Westfall >> 开通西部荒野飞行点
    .target 索尔
    .isOnQuest 2360

step << Human Rogue/Dwarf Rogue
    .goto 1453/0,484.200,-8832.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 交谈
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克

step << !Dwarf Rogue
    .goto 1431/0,404.03,-11014.47,60,0
    .goto 1431/0,432.11,-10878.75,50,0
    .goto 1431/0,551.72,-10688.13
    >>击杀|cRXP_ENEMY_小型结网毒蜘蛛|r和|cRXP_ENEMY_结网毒蜘蛛|r，拾取|cRXP_LOOT_小毒囊|r和|cRXP_LOOT_粘糊的蜘蛛腿|r
    >>|cRXP_WARN_需要一个|r|cRXP_LOOT_小毒囊|r|cRXP_WARN_来制作|r |T134437:0|t[抗毒药剂]|cRXP_WARN_，之后用它移除|r |T136230:0|t[赞吉尔之触]|cRXP_WARN_的减益效果|r
    >>|cRXP_WARN_把|r|cRXP_LOOT_粘糊的蜘蛛腿|r|cRXP_WARN_留着后面用|r
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r|cRXP_WARN_、|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_或|r |T626006:0|t|cFF0070DD萨满祭司|r |cRXP_WARN_朋友，可以跳过此步骤，请他们帮你移除减益效果|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob 小型结网毒蜘蛛
    .mob 结网毒蜘蛛
    .itemcount 6452,<1 --Anti Venom (<1)

step << Rogue
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==务必仔细阅读接下来的步骤==|r
    >>|cRXP_WARN_按 Escape，然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用交互键”，并为“与目标互动”设置按键|r
    >>|cRXP_WARN_建议开启敌方姓名板（默认键：V），这样可以看到塔内部分转角后方的敌人|r

step << Rogue
    .goto 1436/0,619.17,-11035.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_密探吉尔妮|r 交谈
    >>|cRXP_WARN_必须完成此任务才能学习|r |T132290:0|t[毒药]
    .turnin 2360 >> 交任务：马迪亚斯和迪菲亚潜行者
    .accept 2359 >> 接任务：克拉文之塔
    .target 密探吉尔妮

step << Rogue
    #label TowerKey
    #loop
    .goto 1436/0,514.52,-11114.77,0
    .goto 1436/0,531.32,-11166.80,0
    .goto 1436/0,581.37,-11104.97,0
    .goto 1436/0,514.52,-11114.77,30,0
    .goto 1436/0,531.32,-11166.80,30,0
    .goto 1436/0,581.37,-11104.97,30,0
    >>使用 |T133644:0|t[搜索] 偷取 |cRXP_ENEMY_丑陋的迪菲亚懒汉|r 身上的 |cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    >>|cRXP_ENEMY_丑陋的迪菲亚懒汉|r|cRXP_WARN_ 在塔楼入口刷新，然后在塔外巡逻|r
    >>|cRXP_WARN_小心，他的伤害很高。如果|r |T132320:0|t[潜行] |cRXP_WARN_被打破，立刻使用|r |T132307:0|t[疾跑] |cRXP_WARN_逃离|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处观看视频指南
    .mob 丑陋的迪菲亚懒汉

step << Rogue
    #optional
    #completewith Mortwake
    +|cRXP_WARN_请在此任务中装备|r |T135641:0|t[曲木匕首]|cRXP_WARN_，如果当前没有装备|r |T135641:0|t[匕首]|cRXP_WARN_的话|r
    .use 15396
    .itemcount 15396,1

step << Rogue
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔楼倒数第 2 层。保持|r |T132320:0|t[潜行]，|cRXP_WARN_确认 |r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_ 不在身边后，先跳上椅子，再跳上灯，最后跳上导航点位置上方的书架|r
    >>|cRXP_WARN_手动|r |T132320:0|t[取消潜行]|cRXP_WARN_，然后按“与目标互动”按键打开 |r|cRXP_PICK_暮色森林的箱子|r|cRXP_WARN_，拾取|r |cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_注意：你的|r |T132320:0|t[潜行] |cRXP_WARN_会在拾取|r |cRXP_LOOT_克拉文·摩特维克的日记|r 后暂时失效
    >>|cRXP_WARN_如果没有击杀第 2 层的 |r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_，就准备好逃跑。书架是脱战卡位点，你在上面时，它们很可能一直保持仇恨但无法攻击你|r
    >>|cRXP_WARN_如果背包中有或已装备|r |T135641:0|t[匕首]，|cRXP_WARN_可以使用|r |T132282:0|t[伏击] |cRXP_WARN_秒杀塔内的 |r|cRXP_ENEMY_迪菲亚巡塔员|r|cRXP_WARN_ 和 |r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_。击杀第一个 |r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_ 后准备好逃跑，并记住上层敌人也能攻击你。这种方式较慢，但安全得多|r
    >>|cRXP_WARN_如果需要跑出塔楼，注意入口可能有 |r|cRXP_ENEMY_丑陋的迪菲亚懒汉|r|cRXP_WARN_ 和 |r|cRXP_ENEMY_迪菲亚苦工|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处观看视频指南
    .mob 迪菲亚巡塔员
    .mob 迪菲亚哨兵

step << !Dwarf Rogue
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained

step << !Dwarf Rogue
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437:0|t[抗毒药剂]移除 |T136230:0|t[赞吉尔之触]的减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)

step << Dwarf Rogue
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石像形态]移除 |T136230:0|t[赞吉尔之触]的减益效果|r
    .aura -9991

step << Rogue
    #optional
    #completewith KlavenEnd
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 交谈
    .fly Stormwind >> 飞往暴风城
    .target 索尔

step << !Dwarf Rogue
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >> 前往 |cRXP_FRIENDLY_珊娜·弗勒|r 身边
    .aura -9991

step << !Dwarf Rogue
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊娜·弗勒|r 交谈
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r|cRXP_WARN_、|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_或|r |T626006:0|t|cFF0070DD萨满祭司|r |cRXP_WARN_朋友，可以请他们帮你移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_的减益效果|r
    .skill firstaid,80 >> |cRXP_WARN_将|r |T135966:0|t[急救] |cRXP_WARN_提升至 80|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)

step << !Dwarf Rogue
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊娜·弗勒|r 交谈
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r|cRXP_WARN_、|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_或|r |T626006:0|t|cFF0070DD萨满祭司|r |cRXP_WARN_朋友，可以请他们帮你移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_的减益效果|r
    .train 7934 >> |cRXP_WARN_学习|r |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)

step << !Dwarf Rogue
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained

step << !Dwarf Rogue
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437:0|t[抗毒药剂]移除 |T136230:0|t[赞吉尔之触]的减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)

step << Rogue
    #optional
    #requires AntiVenomEnd2 << Rogue
    #completewith next
    .goto 1453/0,374.11,-8762.88,20,0
    .goto 1453/0,326.66,-8818.01,20,0
    .goto 1453/0,323.43,-8817.83,10 >> 进入军情7处总部，上楼前往 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 身边

step << Rogue
    #label KlavenEnd
    #requires AntiVenomEnd2 << Rogue
    .goto 1453/0,362.28,-8815.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 交谈
    >>|cRXP_WARN_如果之前换用了|r |T135641:0|t[匕首]，|cRXP_WARN_记得换回主武器|r << Rogue
    .turnin 2359 >> 交任务：克拉文之塔
    .target 马迪亚斯·肖尔
    ----End of Rogue 20 Quest <1.59x Section----

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马库斯·乔纳森将军|r 交谈
    .target 马库斯·乔纳森将军
    .goto 1453/0,520.88,-8954.15
    .turnin 120 >> 交任务：送往暴风城的信
    .accept 121 >> 接任务：送往暴风城的信

step
    #completewith next
    .goto 1429/0,84.61,-9457.95,60 >> 前往闪金镇

step
    .goto 1429/0,87.73,-9456.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_铁匠阿古斯|r 交谈
    .target 铁匠阿古斯
    .turnin 118 >> 交任务：马掌
    .accept 119 >> 接任务：回复弗纳

step
    #completewith next
    .goto 1429/0,-727.57,-9555.16,50 >> 前往阿祖拉之塔并登上塔顶

step
    .goto 1429/0,-728.26,-9553.08
    .target 塞欧克瑞图斯
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的 |cRXP_FRIENDLY_塞欧克瑞图斯|r 交谈
    .accept 94 >> 接任务：法师的眼线
    .xp <20,1

step
    #label InRR
    #completewith FlyR
    .goto 1453/0,489.72,-8837.28,-1
    .goto 1433/0,-1716.28,-9623.29,-1
    .zone Redridge Mountains >>前往赤脊山
    .fly Redridge >> 飞往赤脊山
    >>|cRXP_WARN_如果在闪金镇，返回暴风城乘飞行坐骑会更快|r
    >>|cRXP_WARN_如果在阿祖拉之塔，就直接跑到赤脊山|r

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 交谈
    .target 弗纳·奥斯古
    .goto 1433/0,-2243.14,-9259.43
    .turnin 119 >> 交任务：回复弗纳
    .accept 124 >> 接任务：豺狼人的乱吠

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 交谈
    .target 弗纳·奥斯古
    .goto 1433/0,-2243.14,-9259.43
    .accept 122 >> 接任务：雏龙的鳞片

step
    #label FlyR
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_所罗门镇长|r 交谈
    .target 所罗门镇长
    .goto 1433/0,-2207.10,-9231.34,15,0
    .goto 1433/0,-2221.65,-9218.60
    .turnin 121 >> 交任务：送往暴风城的信

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希拉里|r 交谈
    .target 希拉里
    .goto 1433/0,-2205.58,-9351.52
    .turnin 3741 >> 交任务：希拉里的项链

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_码头管理员巴伦|r 交谈
    .target 码头管理员巴伦
    .goto 1433/0,-2172.59,-9261.02
    .turnin 127 >> 交任务：卖鱼
    .accept 150 >> 接任务：鱼人偷猎者
    .turnin 150 >> 交任务：鱼人偷猎者

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r 交谈
    .target 厨师布雷纳
    .goto 1433/0,-2062.96,-9209.62
    .turnin 92 >> 交任务：赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛蒂·詹罗斯|r 交谈
    .target 玛蒂·詹罗斯
    .goto 1433/0,-2045.38,-9245.82
    .turnin 130 >> 交任务：寻访草药师
    .accept 131 >> 接任务：水仙诉衷情

step
    #completewith next
    >>击杀 |cRXP_ENEMY_黑龙雏龙|r，拾取 |cRXP_LOOT_雏龙的腹鳞|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob 黑龙雏龙

step
    .isOnQuest 92
    >>击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取 |cRXP_LOOT_巨型血牙野猪头|r
    >>|cRXP_WARN_保留你拾取到的所有|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，之后可用它们将|r |T133971:0|t[烹饪]|cRXP_WARN_提升到50点，这是稍后暮色森林任务的需要|r
    .goto 1433/0,-1912.31,-9339.93,60,0
    .goto 1433/0,-2270.93,-9591.440,60,0
    .goto 1433/0,-2244.23,-9619.53,60,0
    .goto 1433/0,-1912.31,-9339.93
    .collect 2296,5,92,1
    .mob 巨型血牙野猪

step
    #completewith next
    >>击杀 |cRXP_ENEMY_黑龙雏龙|r，拾取 |cRXP_LOOT_雏龙的腹鳞|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob 黑龙雏龙

step
    .goto 1433/0,-2031.70,-9098.71,60,0
    .goto 1433/0,-2313.26,-9149.82,60,0
    .goto 1433/0,-2430.70,-9030.51,60,0
    .goto 1433/0,-2313.26,-9149.82,60,0
    .goto 1433/0,-2031.70,-9098.71,60,0
    .goto 1433/0,-2313.26,-9149.82,60,0
    .goto 1433/0,-2430.70,-9030.51,60,0
    .goto 1433/0,-2059.27,-9091.91,0
    >>击杀 |cRXP_ENEMY_赤脊山蛮兵|r 和 |cRXP_ENEMY_赤脊山秘法师|r，拾取 |cRXP_LOOT_铁矛|r 和 |cRXP_LOOT_铁铆钉|r
    .complete 124,1 --Redridge Brute (10)
    .mob +赤脊山蛮兵
    .complete 124,2 --Redridge Mystic (8)
    .mob +赤脊山秘法师
    .complete 89,1 --Iron Pike (5)
    .mob +赤脊山秘法师
    .mob +赤脊山蛮兵
    .complete 89,2 --Iron Rivet (5)
    .mob +赤脊山秘法师
    .mob +赤脊山蛮兵

step
    .goto 1433/0,-2514.49,-9033.70,50,0
    .goto 1433/0,-2580.70,-9091.33,50,0
    .goto 1433/0,-2321.07,-9527.58,50,0
    .goto 1433/0,-2364.92,-9645.44
    >>击杀 |cRXP_ENEMY_黑龙雏龙|r，拾取 |cRXP_LOOT_雏龙的腹鳞|r
    .mob 黑龙雏龙
    .complete 122,1 --Underbelly Whelp Scale (6)

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达希|r 交谈
    >>|cRXP_FRIENDLY_达希|r |cRXP_WARN_在旅店内走动|r
    .target 达希
    .goto 1433/0,-2152.62,-9216.430
    .turnin 131 >> 交任务：水仙诉衷情

step
    #completewith next
    .goto 1433/0,-1908.40,-9299.83,0
    .goto 1433/0,-1988.50,-9176.32,0
    .goto 1433/0,-1937.7,-9371.64,0
    .goto 1433/0,-2146.54,-9225.84
    +|cRXP_WARN_使用|r |T133971:0|t[烹饪]|cRXP_WARN_技能烹制之前收集的|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，将技能提升到50点，满足任务对|r |T133971:0|t[烹饪]技能的要求
    +|cRXP_WARN_如果还需要更多|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，就去西边的|r|cRXP_ENEMY_贝利格拉布|r|cRXP_WARN_附近再击杀一些|r|cRXP_ENEMY_巨型血牙野猪|r
    .skill cooking,50,1
    .mob 巨型血牙野猪

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 交谈
    .target 弗纳·奥斯古
    .goto 1433/0,-2243.79,-9259.860
    .turnin 124 >> 交任务：豺狼人的乱吠
    .turnin 122 >> 交任务：雏龙的鳞片

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 交谈
    .target 工头奥斯洛
    .goto 1433/0,-2267.67,-9280.140
    .turnin 89 >> 交任务：止水湖上的桥
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（联盟）
#forever
#disabledungeons
#version 1
<< Alliance Hunter
#group RestedXP Forever Guide (A)
#subgroup Speedrun Guide 1-20
#subgroupdisplayname 1-20
--#groupid RXP-SRGCE-A1
#name 19-21 Darkshore/Ashenvale
#next RestedXP Forever Guide (A)\21-23 Ashenvale/Stonetalon
#displayname 19-21 黑海岸/灰谷
step
    #optional
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 951 >> 交任务：玛塞斯特拉遗物
    .target 安努
    .isQuestTurnedIn 731 --Only shows if Prospector was already escorted
step
    #optional
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈，开始护送
    >>|cRXP_WARN_如果他不在那里，请跳过此步骤。他重生可能需要长达 25 分钟|r
    >>|cRXP_WARN_这是限时任务，请在任务日志规定的时间内完成护送|r
    .accept 5321 >> 接任务：昏昏欲睡
    .target 克罗尼亚·恒影
    .isQuestTurnedIn 731 --Only shows if Prospector was already escorted
step
    #optional
    .isOnQuest 5321
    .goto 1439/1,34.78,5001.570
    >>打开|cRXP_PICK_克罗尼亚的箱子|r，拾取 |T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
    .isQuestTurnedIn 731 --Only shows if Prospector was already escorted
step
    #sticky
    #label prospector
    .goto 1439,35.724,83.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    >>|cRXP_WARN_你可能得等他刷新，或等别人把护送做完|r
    .turnin 729 >> 交任务：健忘的勘察员
    .isOnQuest 729
    .target 勘察员雷姆塔维尔
step
    .goto 1439/1,602.01,4678.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    >>这会开启一个护送任务
    .accept 731,1 >> 接任务：健忘的勘察员
    >>|cRXP_WARN_此任务难度很高。如果既找不到队伍，也无法单人完成，就跳过此步骤|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击查看视频攻略|r
    .target 勘察员雷姆塔维尔
    .isQuestAvailable 731
step
    #requires prospector
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_勘察员雷姆塔维尔|r|cRXP_WARN_走完整个挖掘场|r
    >>|cRXP_WARN_此任务难度很高。如果既找不到队伍，也无法单人完成，就跳过此步骤|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击查看视频攻略|r
    .complete 731,1
    .isOnQuest 731
step
    #optional
    #completewith TheryluneEnd
    >>击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，拾取 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心，|r|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会对你施放|r |T132343:0|t[缴械]|cRXP_WARN_，持续6秒。|r << Rogue/Paladin/Warrior
    *|cRXP_WARN_小心，|r|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_，还会施放需3秒施法的|r |T135915:0|t[治疗术]
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .mob 暮光信徒
    .mob 暮光暴徒
    --  .use 13536
step
    .goto 1439,38.660,87.305
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟瑞露尼|r交谈，开始护送任务
    >>|cRXP_WARN_如果她不在，就跳过此步骤|r
    .accept 945 >> 接任务：护送瑟瑞露尼
    .target 瑟瑞露尼
step
    #label TheryluneEnd
    .goto 1439/1,288.26,4530.40
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_瑟瑞露尼|r|cRXP_WARN_离开主宰之剑|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .isOnQuest 945
step
    #optional
    .goto 1439,31.251,87.419
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >> 接任务：搁浅的海洋生物
    >>|cRXP_WARN_此任务可能非常困难。请按 1 对 1 的方式逐个击杀|r|cRXP_ENEMY_鱼人|r|cRXP_WARN_，否则可能同时引到多个敌人|r
    .link https://youtu.be/lfQM3Q-Ag5A >> |cRXP_WARN_点击查看视频攻略|r
step
    #optional
    .goto 1439,31.229,85.564
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4732 >> 接任务：搁浅的海龟
step
    #optional
    .goto 1439,31.690,83.700
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4731 >> 接任务：搁浅的海龟
step
    #optional
    .goto 1439,32.644,80.711
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接任务：搁浅的海洋生物
step
    #optional
    .goto 1439/1,227.35,4575.38,50,0
    .goto 1439/1,205.73,4639.130,50,0
    .goto 1439/1,129.10,4741.75,50,0
    .goto 1439/1,86.52,4839.13,50,0
    .goto 1439/1,338.70,4821.22,50,0
    .goto 1439/1,452.67,4684.98
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_头皮|r
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[毁灭]|cRXP_WARN_，这是造成 20-40 点伤害并将你击倒 2 秒的瞬发攻击|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob 灰斑蓟熊
step
    .goto 1439/1,230.69,4815.33
    >>点击地面上的|cRXP_PICK_传声盒525号|r
    .turnin 1003 >> 交任务：传声盒525号
    .isOnQuest 1003
step
    .goto 1439/1,-5.83,4608.570
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    >>|cRXP_WARN_交谈前先清理洞口周围的熊怪|r
    .turnin 993 >> 交任务：丢失的主人
    .accept 994 >> 接任务：杀出重围
    .target 沃科尔
    .isOnQuest 993
step
    #optional
    .goto 1439/1,-5.83,4608.570
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    >>|cRXP_WARN_交谈前先清理洞口周围的熊怪|r
    .accept 994 >> 接任务：杀出重围
    .target 沃科尔
    .isQuestTurnedIn 993
step
    .goto 1439,43.594,84.489,0
    .goto 1439,42.576,82.897,0
    .goto 1439,43.594,84.489,15,0
    .goto 1439,42.576,82.897,15,0
    .goto 1439,42.004,81.688
    >>护送|cRXP_FRIENDLY_沃科尔|r
    >>离开洞穴后经过第3个火炬时，两侧各会刷新一只|cRXP_ENEMY_熊怪|r并攻击|cRXP_FRIENDLY_沃科尔|r
    >>从洞穴走向道路的半途中，|cRXP_ENEMY_熊怪|r会从两侧刷新并攻击|cRXP_FRIENDLY_沃科尔|r
    .complete 994,1 --Help Volcor to the road (1)
    .isQuestTurnedIn 993
step
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 951 >> 交任务：玛塞斯特拉遗物
    .target 安努
    .isOnQuest 951
step
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈，开始护送
    >>|cRXP_WARN_如果他不在那里，请跳过此步骤。他重生可能需要长达 25 分钟|r
    >>|cRXP_WARN_这是限时任务，请在任务日志规定的时间内完成护送|r
    .accept 5321 >> 接任务：昏昏欲睡
    .target 克罗尼亚·恒影
    .itemcount 13536,<1 --Horn of Awakening
step
    .isOnQuest 5321
    .goto 1439/1,34.78,5001.570
    >>打开|cRXP_PICK_克罗尼亚的箱子|r，拾取 |T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
    .itemcount 13536,<1 --Horn of Awakening
step
    #label Kerlonian
    .goto 1440/1,128.01,3305.31
    >>|cRXP_WARN_向南护送|r|cRXP_FRIENDLY_克罗尼亚|r|cRXP_WARN_到灰谷的|r|cRXP_FRIENDLY_利拉迪斯·月河|r|cRXP_WARN_处|r
    .use 13536 >> |cRXP_WARN_使用|r |T134229:0|t[|cRXP_LOOT_唤醒号角|r]|cRXP_WARN_，每当|r|cRXP_FRIENDLY_克罗尼亚|r|cRXP_WARN_睡着时，就在他身旁吹响号角|r
    >>|cRXP_WARN_尽量避开主路；在主路上才会触发敌人刷新。|r
    .complete 5321,2
    .isOnQuest 5321
step
    #label AshenStart
    #completewith tower
    .zone Ashenvale >> 向南前往灰谷
    .goto 1440/1,-12.70,4150.17
step
    #sticky
    #completewith next
    >>在任务途中击杀遇到的|cRXP_WARN_幽爪奔跑者|r，并拾取掉落物。保留获得的 |T133970:0|t[|cRXP_LOOT_瘦狼肋排|r]，后续烹饪任务需要10个。
    .collect 1015,10
    .mob 幽爪奔跑者
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利拉迪斯·月河|r交谈
	.target 利拉迪斯·月河
    .goto 1440/1,128.01,3305.31
    .turnin 5321 >> 交任务：昏昏欲睡
    .isQuestComplete 5321
step
    #label tower
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
	.target 净化者德尔格伦
    .goto 1440/1,189.71,3185.77
    .turnin 967 >> 交任务：奥萨拉克斯之塔
    .accept 970 >> 接任务：奥萨拉克斯之塔
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
	.target 奥雷迪尔·阔叶
    .goto 1440/1,175.87,3189.61
    .accept 1010 >> 接任务：巴斯兰的头发
    .xp <20,1
step
    .goto 1440/1,-102.08,3492.890
    >>击杀|cRXP_ENEMY_暗滩祭司|r、|cRXP_ENEMY_暗滩精兵|r、|cRXP_ENEMY_暗滩执行者|r和|cRXP_ENEMY_暗滩挖掘者|r，拾取|cRXP_LOOT_发光的灵魂宝石|r。
    >>请耐心，此物品掉率较低
    .complete 970,1
    .mob 暗滩祭司
    .mob 暗滩精兵
    .mob 暗滩执行者
    .mob 暗滩挖掘者
step
    .goto 1440/1,-203.58,3849.97,50,0
    .goto 1440/1,-2.90,3737.73,40,0
    .goto 1440/1,-138.99,3806.92
    >>点击地上的|cRXP_PICK_草药|r，拾取|cRXP_LOOT_巴斯兰的头发|r。
    >>|cRXP_WARN_它们像棕色的小袋子，不太容易发现。|r
    .complete 1010,1
    .isOnQuest 1010
step
    .goto 1440/1,-102.08,3492.890
    .xp 20-1650 >>持续击杀|cRXP_ENEMY_暗滩怪物|r，直到距离20级还差1650经验；交后续任务后即可升级
    .mob 暗滩祭司
    .mob 暗滩精兵
    .mob 暗滩执行者
    .mob 暗滩挖掘者
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
	.target 净化者德尔格伦
    .goto 1440/1,189.71,3185.77
    .turnin 970 >> 交任务：奥萨拉克斯之塔
step
    .goto 1440/1,-138.99,3806.92
    .xp 20 >> 刷到20级
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
	.target 奥雷迪尔·阔叶
    .goto 1440/1,175.87,3189.61
    .accept 1010 >> 接任务：巴斯兰的头发
step
    .goto 1440/1,-203.58,3849.97,50,0
    .goto 1440/1,-2.90,3737.73,40,0
    .goto 1440/1,-138.99,3806.92
    >>点击地上的|cRXP_PICK_草药|r，拾取|cRXP_LOOT_巴斯兰的头发|r。
    >>|cRXP_WARN_它们像棕色的小袋子，不太容易发现。|r
    .complete 1010,1
    .isOnQuest 1010
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
	.target 奥雷迪尔·阔叶
    .goto 1440/1,175.87,3189.61
    .turnin 1010 >> 交任务：巴斯兰的头发
    .accept 1020 >> 接任务：奥雷迪尔的药剂
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .goto 1440/1,189.71,3185.77
    .turnin 970 >> 交任务：奥萨拉克斯之塔
    .accept 973 >> 接任务：奥萨拉克斯之塔
    .target 净化者德尔格伦
step
    #sticky
    #completewith Astranaar
    >>在任务途中击杀遇到的|cRXP_WARN_幽爪奔跑者|r，并拾取掉落物。保留获得的 |T133970:0|t[|cRXP_LOOT_瘦狼肋排|r]，后续烹饪任务需要10个。
    .collect 1015,10
    .mob 幽爪奔跑者
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟瑞希尔|r交谈
	.target 瑟瑞希尔
    .goto 1440/1,394.43,2677.63
    .turnin 945 >> 交任务：护送瑟瑞露尼
    .isQuestComplete 945
step << Hunter
    .goto 1440/1,522.900,2716.100,30 >> 沿西北方向的坡道向上前进
step
    #completewith Astranaar
    >>最多收集6个|cRXP_LOOT_粘糊的蜘蛛腿|r，留作后用；它们会从本区域的|cRXP_ENEMY_蜘蛛|r身上掉落。
    .collect 2251,6,93,1 -- Gooey Spider Legs
step << Hunter
    #sticky
    .goto 1440/1,663.38,2365.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尔温|r交谈
    .trainer 3698 >> 学习宠物技能
    .target 波尔温
--XX Train in darn at 20 on 2x
step << Hunter
    .goto 1440/1,661.42,2373.12--c:Ashenvale,18.010,59.832
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥林达尔·石鹿|r交谈
    .trainer >> 学习职业技能
    .train 5118 >> 学习 |T132242:0|t[猎豹守护]
    .target 奥林达尔·石鹿
step
    #label Astranaar
    .goto 1440/1,-283.73,2827.920
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黛琳希亚|r交谈
    .fp Astranaar>> 获取阿斯特兰纳飞行点
	.target 黛琳希亚
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛德瑞尔·速火|r交谈
	.target 辛德瑞尔·速火
    .goto 1440/1,-299.30,2796.01
    .accept 1008 >> 接任务：佐拉姆海岸
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵塞恩希尔|r交谈
	.target 哨兵塞恩希尔
    .goto 1440/1,-311.99,2759.11
    .accept 1070 >> 接任务：守卫石爪山
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法德瑞斯·戈森沙尔|r交谈
	.target 法德瑞斯·戈森沙尔
    .goto 1440/1,-362.16,2785.640
    .accept 1056 >> 接任务：石爪峰之旅
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
	.target 莱恩·狼行者
    .goto 1440/1,-411.18,2767.19
    .accept 991 >> 接任务：莱恩的净化
    .accept 1054 >> 接任务：解除威胁
step
    #label HCHunterNoHS --hidden step for #include
step << NightElf Hunter
    .goto 1440/1,-433.09,2781.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板基姆利雅|r交谈
    .home >> 将炉石绑定在阿斯特兰纳
    .target 旅店老板基姆利雅
step
    #label HCHunterNoHSStart --hidden step for #include
step
    .goto 1440/1,-410.60,2758.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛琳|r交谈
    .vendor >> |cRXP_BUY_必要时购买食物和水|r
    .target 玛琳
step
    .goto 1440/1,-454.43,2682.24
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
	.target 皮尔图拉斯·怀特姆恩
    .turnin 1020 >> 交任务：奥雷迪尔的药剂
    .timer 24,奥雷迪尔的药剂剧情演出
    .accept 1033 >> 接任务：月神之泪
step << Hunter
    .goto 1440/1,-306.80,2720.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈尔詹·橡木之心|r交谈
    .vendor >> |cRXP_BUY_必要时补充弹药|r
    .target 哈尔詹·橡木之心
step
    #completewith ElunesTear
    >>最多收集6个|cRXP_LOOT_粘糊的蜘蛛腿|r，留作后续任务使用；它们会从本区域的|cRXP_ENEMY_蜘蛛|r身上掉落。
    .collect 2251,6,93,1 -- Gooey Spider Legs
step
    .goto 1440/1,-974.00,2890.19
    >>拾取地上的|cRXP_LOOT_月神之泪|r
    .complete 1033,1
step
    #label ElunesTear
    .goto 1440/1,-454.43,2682.24
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
	.target 皮尔图拉斯·怀特姆恩
    .turnin 1033 >> 交任务：月神之泪
    .timer 17,月神之泪剧情演出
    .accept 1034 >> 接任务：星尘废墟
step
    .goto 1440/1,-220.3,2067.24
    >>搜寻|cRXP_PICK_星尘覆盖的灌木丛|r，拾取|cRXP_LOOT_一把星尘|r。
    >>|cRXP_WARN_它们的刷新点散布在整座岛上|r
    .complete 1034,1
step
    #completewith next
    .goto 1440/1,-126.30,2203.69,15 >> 去山脚下
    .goto 1440/1,-99.78,2305.170,15 >>爬山时一直向北直行
step
    #completewith next
    .goto 1440/1,114.17,2337.45,8 >> 爬上火痕神龛入口右侧大树旁的小山
    >>跳过树根并贴右前进，以避免吸引怪物仇恨
step
    .goto 1440/1,242.76,2340.53
    >>击杀|cRXP_ENEMY_伊克鲁德·玛格苏尔|r，拾取|cRXP_LOOT_典籍|r
    >>|cRXP_ENEMY_伊克鲁德·玛格苏尔|r|cRXP_WARN_会施放|r |T136221:0|t[伊克鲁德的守护者]|cRXP_WARN_（施法时间为5秒，会召唤2名虚空行者。能打断时请打断。）|r
    >>|cRXP_WARN_如有需要，先清出撤退路线，以便将这些敌人连同|r|cRXP_ENEMY_魅魔|r|cRXP_WARN_一起重置。如愿意，也可以跳过，等到23级再做。|r
    .complete 973,1
    .link https://youtu.be/03nTrdcQiKY >> |cRXP_WARN_点击查看参考视频|r
	.isOnQuest 973
    .mob 伊克鲁德·玛格苏尔
step
    .isQuestComplete 973
    .goto 1440/1,189.71,3185.77
    .target 净化者德尔格伦
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 973 >> 交任务：奥萨拉克斯之塔
step
    #label HCHunterEnd --hidden step for #include
step
    #sticky
    #completewith StatuetteStart
    >>最多收集6个|cRXP_LOOT_粘糊的蜘蛛腿|r，留作后续任务使用；它们会从本区域的|cRXP_ENEMY_蜘蛛|r身上掉落。
    .collect 2251,6,93,1 -- Gooey Spider Legs
step
    #sticky
    #completewith StatuetteStart
    >>在任务途中击杀遇到的|cRXP_WARN_幽爪奔跑者|r，并拾取掉落物。保留获得的 |T133970:0|t[|cRXP_LOOT_瘦狼肋排|r]，后续烹饪任务需要10个。
    .collect 1015,10
    .mob 幽爪奔跑者
step
    #label StatuetteStart
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔伦|r交谈
	.target 塔尔伦
    .goto 1440/1,847.11,3470.21
    .accept 1007 >> 接任务：远古雕像
step
    #completewith nagas
    >>击杀|cRXP_ENEMY_怒尾娜迦|r，拾取|cRXP_LOOT_头颅|r
    >>|cRXP_WARN_现在先别特意绕路去做|r
	.mob 怒尾御浪者
	.mob 怒尾巫师
    .complete 1008,1
step
    .goto 1440/1,881.13,3879.57
    >>拾取地上的|cRXP_LOOT_远古雕像|r
    .complete 1007,1
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔伦|r交谈
	.target 塔尔伦
    .goto 1440/1,847.11,3470.21
    .turnin 1007 >> 交任务：远古雕像
    .timer 22,远古雕像剧情演出
    .accept 1009 >> 接任务：卢泽尔
step
    .goto 1440/1,1323.55,4159.35
    >>击杀|cRXP_ENEMY_卢泽尔|r，拾取|cRXP_LOOT_佐拉姆之戒|r
    >>|cRXP_ENEMY_卢泽尔|r|cRXP_WARN_会与一名|r|cRXP_ENEMY_怒尾侍从|r|cRXP_WARN_和一名|r|cRXP_ENEMY_怒尾海巫|r|cRXP_WARN_一同在岛上巡逻。如有需要，击杀其中一只后再重置战斗|r
    >>|cRXP_WARN_如果有|r |T133717:0|t[炸弹]|cRXP_WARN_/|r[手榴弹]|cRXP_WARN_，也可以用它们单独拉|r|cRXP_ENEMY_卢泽尔|r
    >>|cRXP_ENEMY_薇丝比娅|r|cRXP_WARN_是稀有怪，遇到时可以击杀；她也会掉落|r|cRXP_LOOT_佐拉姆之戒|r|cRXP_WARN_。|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >> |cRXP_WARN_点击查看"分开拉怪"的视频参考|r
	.unitscan 薇丝比娅
	.mob 卢泽尔
    .complete 1009,1
    .skill engineering,<1,1
step
    #label nagas
    .goto 1440/1,1323.55,4159.35
    >>击杀|cRXP_ENEMY_卢泽尔|r，拾取|cRXP_LOOT_佐拉姆之戒|r
    >>|cRXP_ENEMY_卢泽尔|r|cRXP_WARN_会与一名|r|cRXP_ENEMY_怒尾侍从|r|cRXP_WARN_和一名|r|cRXP_ENEMY_怒尾海巫|r|cRXP_WARN_一同在岛上巡逻。如有需要，击杀其中一只后再重置战斗|r
    >>|cRXP_ENEMY_薇丝比娅|r|cRXP_WARN_是稀有怪，遇到时可以击杀；她也会掉落|r|cRXP_LOOT_佐拉姆之戒|r|cRXP_WARN_。|r
	.unitscan 薇丝比娅
	.mob 卢泽尔
    .complete 1009,1
step
    .goto 1440/1,1296.33,4088.67,0
    .goto 1440/1,866.14,4013.71,0
    .goto 1440/1,843.07,3863.42,0
    .goto 1440/1,942.84,3710.83,0
    .goto 1440/1,1072.01,3518.64,0
    .goto 1440/1,1296.33,4088.67,70,0
    .goto 1440/1,866.14,4013.71,70,0
    .goto 1440/1,843.07,3863.42,70,0
    .goto 1440/1,942.84,3710.83,70,0
    .goto 1440/1,1072.01,3518.64,70,0
    .goto 1440/1,942.84,3710.83,70,0
    .goto 1440/1,843.07,3863.42,70,0
    .goto 1440/1,866.14,4013.71,70,0
    >>击杀|cRXP_ENEMY_怒尾娜迦|r，拾取|cRXP_LOOT_头颅|r
	.mob 怒尾御浪者
	.mob 怒尾巫师
    .mob 怒尾侍从
    .mob 怒尾女祭司
    .mob 怒尾纳迦
    .mob 怒尾海巫
    .complete 1008,1
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔伦|r交谈
	.target 塔尔伦
    .goto 1440/1,847.11,3470.21
    .turnin 1009 >> 交任务：卢泽尔
step
    #sticky
    #completewith SoulGemStart
    >>最多收集6个|cRXP_LOOT_粘糊的蜘蛛腿|r，留作后续任务使用；它们会从本区域的|cRXP_ENEMY_蜘蛛|r身上掉落。
    .collect 2251,6,93,1 -- Gooey Spider Legs
step
    #sticky
    #completewith SoulGemStart
    >>在任务途中击杀遇到的|cRXP_WARN_幽爪奔跑者|r，并拾取掉落物。保留获得的 |T133970:0|t[|cRXP_LOOT_瘦狼肋排|r]，后续烹饪任务需要10个。
    .collect 1015,10
    .mob 幽爪奔跑者
step
    #label SoulGemStart
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰洛尼斯的尸体|r交谈
	.target 泰洛尼斯的尸体
    .goto 1440/1,528.79,3045.86
    .turnin 991 >> 交任务：莱恩的净化
    .accept 1023 >> 接任务：莱恩的净化
step
    #sticky
    #completewith GlowingGem
    >>保留你可能拾取到的任何 |T134304:0|t[鱼人的鳍]。完成后续任务时需要 8 个
    .collect 1468,8 --Murloc Fin(8)
step
    #label GlowingGem
    .goto 1440/1,523.02,2988.59,50,0
    .goto 1440/1,579.54,3055.08,50,0
    .goto 1440/1,488.42,3073.53,50,0
    .goto 1440/1,528.79,3045.86
    >>击杀|cRXP_ENEMY_盐沫鱼人|r，拾取|cRXP_LOOT_发光的宝石|r。
    >>|cRXP_WARN_当心，|r|cRXP_ENEMY_盐沫智者|r|cRXP_WARN_会治疗，并且每隔几秒会施放一次造成90点伤害的瞬发震击法术。|r
	.mob 盐沫战士
	.mob 盐沫泥浆鱼人
	.mob 盐沫智者
	.mob 盐沫污水鱼人
    .complete 1023,1
step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    .cooldown item,6948,>2
    .hs >> 炉石回奥伯丁
step << NightElf Hunter
    #softcore
    #completewith next
    .deathskip >> 在湖东边找怪自杀，然后在阿斯特兰纳[灵魂医者]处虚弱复活
step << NightElf Hunter
    #hardcore
    #completewith next
    .goto 1440/1,-283.73,2827.92,200 >> 前往阿斯特兰纳
step << NightElf Hunter
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛德瑞尔·速火|r交谈
	.target 辛德瑞尔·速火
    .goto 1440/1,-299.30,2796.01
    .turnin 1008 >> 交任务：佐拉姆海岸
    .accept 1134 >> 接任务：石爪山的双足飞龙
step
    .zoneskip Darkshore
    .goto 1440/1,-284.31,2828.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黛琳希亚|r交谈
    .fly Darkshore>> 飞往黑海岸
    .target 黛琳希亚
step
    .isQuestComplete 731
    #optional
    .goto 1439/1,489.35,6506.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .turnin 731 >> 交任务：健忘的勘察员
    .accept 741 >> 接任务：健忘的勘察员
    .target 考古学家霍莉
step
    .goto 1439/1,489.35,6506.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考古学家霍莉|r 交谈
    .accept 741 >>接任务：健忘的勘察员
    .target 考古学家霍莉
    .isQuestTurnedIn 731
step
    #completewith end
    .vendor >> 补充物资
step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 995 >> 交任务：偷偷溜走
    .target 特伦希斯
    .isOnQuest 995
step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 994 >> 交任务：杀出重围
    .target 特伦希斯
    .isOnQuest 994
step
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin -4730,1 >> 交任务：搁浅的海洋生物
    .turnin -4731,1 >> 交任务：搁浅的海龟
    .turnin -4732,1 >> 交任务：搁浅的海龟
    .turnin -4733,1 >> 交任务：搁浅的海洋生物
    .target 温尼斯·布莱葛
step
    .goto 1439/1,561.66,6343.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fly Teldrassil >> 飞往泰达希尔
	.target 凯莱斯·月羽
step
    #optional
    .goto 1438/1,968.90,8795.34
    .zone Darnassus >> 通过紫色传送门进入达纳苏斯。
step << Hunter
    .goto 1457/1,2511.04,10178.01
    .target 祖卡斯特
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .trainer >> 学习职业技能
    .xp <22,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加瑞斯|r交谈
    .goto 1457/1,2515.03,9940.50
    .bankdeposit 5996,1468,2251,1015 >> 将以下物品存入银行
    .target 加瑞斯
    >>|T134797:0|t[水下呼吸药剂] --5996
    >>|T134304:0|t[鱼人的鳍] --1468
    >>|T134321:0|t[粘糊的蜘蛛腿] --2251
    >>|T133970:0|t[瘦狼肋排] --1015
step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊琳尼雅·月火|r交谈
    .skipgossipid 96881
    .goto 1457/1,2329.19,9908.60
    .train 264 >> 学习弓
    .train 227 >> 学习法杖
    .target 伊琳尼雅·月火
    .zoneskip Darnassus,1
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
	.target 首席考古学家杜瑟·灰须
    .goto 1438/1,2607.86,9641.94
    .turnin 741 >> 交任务：健忘的勘察员
    .accept 942 >> 接任务：健忘的勘察员
    .isOnQuest 741
step
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
	.target 首席考古学家杜瑟·灰须
    .goto 1438/1,2607.86,9641.94
    .accept 942 >> 接任务：健忘的勘察员
    .isQuestTurnedIn 741
step << NightElf Hunter
    #label end
    .cooldown item,6948,>2
    .hs >> 炉石回阿斯特兰纳
step
    .goto 1457/1,2626.51,9946.11
    .zone Teldrassil >> 穿过紫色传送门前往鲁瑟兰村
    .zoneskip Ashenvale
    .zoneskip Darkshore
step
    #label end
    .goto 1438/1,841.56,8640.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Ashenvale >> 飞往灰谷
    .target 维斯派塔斯
    .zoneskip Ashenvale
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（联盟）
#subgroupdisplayname 1-20
#forever
#disabledungeons
#version 1
<< Alliance !Hunter
#group RestedXP Forever Guide (A)
#subgroup Speedrun Guide 1-20
--#groupid RXP-SRGCE-A1
#name 20-21 Darkshore/Ashenvale
#next RestedXP Forever Guide (A)\21-23 Stonetalon/Ashenvale
#displayname 20-21 黑海岸/灰谷

step << Druid
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade

step << Druid
    .goto 1450/1,-2593.82,7867.06
    >>去月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔

step
    #optional
    .bindlocation 442,1
    .zoneskip Darkshore
    .hs >> 炉石回奥伯丁
    .cooldown item,6948,>2,1

step << Druid
    .goto 1450/1,-2491.79,7454.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛德拉尔|r交谈
    .fly Auberdine >> 飞往黑海岸
    .target 辛德拉尔
    .zoneskip Darkshore

step << !Druid
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
    .fly Stormwind >>炉石无法使用时，飞往暴风城
    .target 艾蕾娜·斯托姆法瑟
    .zoneskip Stormwind City
    .zoneskip Darkshore

step << !Druid
    .goto 1453/0,1330.100,-8645.400
    .zone Darkshore >>在暴风港乘船前往黑海岸

step
    #optional
    #sticky
    .abandon 2040 >> 放弃任务：地底突袭
    .abandon 167 >> 放弃任务：我的兄弟……
    .abandon 168 >> 放弃任务：收集记忆

step
    .goto 1439/1,504.41,6402.39
    >>点击[|cRXP_PICK_通缉告示|r]
    .accept 4740 >> 接任务：通缉：莫克迪普！

step
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 948 >> 接任务：安努
    .target 巴瑞萨斯·月影

step
    .goto 1439/1,489.35,6506.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >> 接任务：健忘的勘察员
    .target 考古学家霍莉

step
    .goto 1439,38.325,43.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈沙拉·夜语|r交谈
    .turnin 3765 >> 交任务：遥远的旅途
    .target 戈沙拉·夜语
    .isOnQuest 3765

step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 993 >> 接任务：丢失的主人
    .target 特伦希斯
    .isQuestTurnedIn 986

step
    #optional
    #completewith OnuGrove
    >>|cRXP_WARN_如果装备了|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_，记得留好当前披风，因为后续交任务时这件|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_会被收回。|r
    .equip 15,5387 >>|cRXP_WARN_如果|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_比你现在的披风更好，就装备它。|r
    .itemcount 5387,1
    .itemStat 15,QUALITY,<7

step
    #completewith TheryluneEnd
    #optional
    .goto 1439/1,306.60,4784.11,0
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_头皮|r
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[毁灭]，|cRXP_WARN_瞬间造成20-40点伤害，并将你击倒2秒|r
    .complete 1003,1
    .isOnQuest 1003
    .mob 灰斑蓟熊
    .subzoneskip 449 -- Master's Glaive

step
    #optional
    #completewith OnuGrove
    .goto 1439,43.555,76.293,80 >> 前往古树之林

step
    #label OnuGrove
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 952 >> 交任务：古树之林 << NightElf
    .turnin 948 >> 交任务：安努
    .accept 944 >> 接任务：主宰之剑
    .target 安努

step
    #label MasterG
    .goto 1439/1,417.30,4575.82,100 >> 前往主宰之剑
    .subzoneskip 449
    .isOnQuest 944

step
    #optional
    #completewith FunandGames
    >>击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，拾取 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心，|r|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会对你施放|r |T132343:0|t[缴械]|cRXP_WARN_，持续6秒。|r << Rogue/Paladin/Warrior/Shaman
    *|cRXP_WARN_小心，|r|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_，还会施放需3秒施法的|r |T135915:0|t[治疗术]
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .mob 暮光信徒
    .mob 暮光暴徒

step
    #optional
    .goto 1439/1,390.700,4542.700
    >>探索主宰之剑区域
    .complete 944,1 --Enter the Master's Glaive (1)

step
    #completewith next
    .cast 5809 >> |cRXP_WARN_使用|r |T134715:0|t[占卜之水]|cRXP_WARN_并将其放在地上。|r
    .use 5251

step
    .goto 1439/1,417.30,4575.82
    >>|cRXP_WARN_点击地上的|r|cRXP_PICK_占卜之碗|r|cRXP_WARN_。|r
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接任务：暮光之锤的营地
    .use 5251

step
    #label FunandGames
    .goto 1439,38.537,86.050
    >>点击北侧基座上的|cRXP_PICK_暮光之书|r
    .turnin 949 >> 交任务：暮光之锤的营地
    .accept 950 >> 接任务：向安努回复
    .accept 98042 >>接任务：开玩笑也要有个限度……

step
    #completewith TheryluneEnd
    >>击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，拾取|cRXP_LOOT_无双之眼|r和 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心，|r|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会对你施放|r |T132343:0|t[缴械]|cRXP_WARN_，持续6秒。|r << Rogue/Paladin/Warrior/Shaman
    *|cRXP_WARN_小心，|r|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_，还会施放需3秒施法的|r |T135915:0|t[治疗术]
    .complete 98042,1 -- Peerless Eye (1)
    .mob +暮光信徒
    .mob +暮光暴徒
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .disablecheckbox

step
    .goto 1439,38.660,87.305
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟瑞露尼|r交谈，开始护送任务
    >>|cRXP_WARN_如果她不在，就跳过此步骤|r
    .accept 945 >> 接任务：护送瑟瑞露尼
    .target 瑟瑞露尼

step
    #label TheryluneEnd
    .goto 1439/1,288.26,4530.40
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_瑟瑞露尼|r|cRXP_WARN_离开主宰之剑|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .isOnQuest 945

step
    #loop
    .goto 1439/1,376.800,4608.600,40,0
    .goto 1439/1,453.100,4580.200,40,0
    .goto 1439/1,409.4366,4521.0151,40,0
    >>击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，拾取|cRXP_LOOT_无双之眼|r和 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心，|r|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会对你施放|r |T132343:0|t[缴械]|cRXP_WARN_，持续6秒。|r << Rogue/Paladin/Warrior/Shaman
    *|cRXP_WARN_小心，|r|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_，还会施放需3秒施法的|r |T135915:0|t[治疗术]
    .complete 98042,1 -- Peerless Eye (1)
    .mob +暮光信徒
    .mob +暮光暴徒
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .disablecheckbox

step
    #optional
    >>|cRXP_WARN_使用 |T133743:0|t[|r|cRXP_LOOT_《深渊之神》|r|cRXP_WARN_] 来开启任务|r
    .accept 968 >> 接任务：深渊之神
    .use 5352
    .itemcount 5352,1

step
    #completewith prospectorEscort
    #optional
    .goto 1439/1,306.60,4784.11,0
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_头皮|r
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[毁灭]，|cRXP_WARN_瞬间造成20-40点伤害，并将你击倒2秒|r
    .complete 1003,1
    .isOnQuest 1003
    .mob 灰斑蓟熊

step
    #sticky
    #label prospector
    .goto 1439,35.724,83.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    >>|cRXP_WARN_你可能得等他刷新，或等别人把护送做完|r
    .turnin 729 >> 交任务：健忘的勘察员
    .target 勘察员雷姆塔维尔
    .isOnQuest 729

step
    #label prospectorEscort
    .goto 1439/1,602.01,4678.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈，开始护送任务
    .accept 731,1 >> 接任务：健忘的勘察员
    >>|cRXP_WARN_此任务难度很高。如果既找不到队伍，也无法单人完成，就跳过此步骤|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击查看视频攻略|r
    .target 勘察员雷姆塔维尔
    .isQuestAvailable 731

step
    #requires prospector
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_勘察员雷姆塔维尔|r|cRXP_WARN_走完整个挖掘场|r
    >>|cRXP_WARN_此任务难度很高。如果既找不到队伍，也无法单人完成，就跳过此步骤|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击查看视频攻略|r
    .complete 731,1
    .isOnQuest 731

step
    #optional
    #completewith Murkdeep
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
    .mob 暗礁蟹

step
    .goto 1439,31.251,87.419
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >> 接任务：搁浅的海洋生物
    >>|cRXP_WARN_此任务可能非常困难。对|r|cRXP_ENEMY_鱼人|r|cRXP_WARN_采取1对1的方式交战，否则可能同时引到多个|r
    .link https://youtu.be/lfQM3Q-Ag5A >> |cRXP_WARN_点击查看视频攻略|r

step
    .goto 1439,31.229,85.564
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4732 >> 接任务：搁浅的海龟

step
    #optional
    .goto 1439,31.690,83.700
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4731 >> 接任务：搁浅的海龟

step
    #optional
    .goto 1439,32.644,80.711
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接任务：搁浅的海洋生物

step
    #optional
    #label Murkdeep
    .goto 1439,35.429,76.566,0
    .goto 1439,35.429,76.566,60,0
    .goto 1439/1,541.75,4991.52
    >>|cRXP_WARN_检查|r|cRXP_ENEMY_莫克迪普|r|cRXP_WARN_是否已经在水里了（如果有玩家之前打输了，或者是没把跟他一起刷出来的|r|cRXP_ENEMY_灰雾猎人|r|cRXP_WARN_杀掉，他可能会一直留在那里）|r
    >>击杀营地里的|cRXP_ENEMY_灰雾战士|r和|cRXP_ENEMY_灰雾猎人|r
    >>|cRXP_WARN_去营地中间的篝火处来触发和|r|cRXP_ENEMY_莫克迪普|r|cRXP_WARN_的战斗：|r
    >>|cRXP_WARN_水中会刷新3波敌人，消灭前一波后才刷新下一波：第1波为3个12-13级的|r|cRXP_ENEMY_灰雾滩行者|r|cRXP_WARN_，第2波为2个15-16级的|r|cRXP_ENEMY_灰雾战士|r|cRXP_WARN_，第3波为19级的|r|cRXP_ENEMY_莫克迪普|r|cRXP_WARN_和16-17级的|r|cRXP_ENEMY_灰雾猎人|r|cRXP_WARN_。可以远离篝火，以免引到下一波|r
    .complete 4740,1 -- Murkdeep (1)
    .unitscan 莫克迪普
    .mob 灰雾战士
    .mob 灰雾猎人
    .mob 灰雾滩行者

step
    #loop
    .goto 1439,32.674,81.752,0
    .goto 1439,36.327,73.408,0
    .goto 1439,35.195,71.864,0
    .goto 1439,32.674,81.752,60,0
    .goto 1439,33.284,80.330,60,0
    .goto 1439,34.174,80.488,60,0
    .goto 1439,35.432,79.052,60,0
    .goto 1439,36.327,73.408,60,0
    .goto 1439,35.412,73.176,60,0
    .goto 1439,35.033,72.432,60,0
    .goto 1439,35.195,71.864,60,0
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
    .mob 暗礁蟹

step
    #optional
    .goto 1439/1,227.35,4575.38,50,0
    .goto 1439/1,205.73,4639.130,50,0
    .goto 1439/1,129.10,4741.75,50,0
    .goto 1439/1,86.52,4839.13,50,0
    .goto 1439/1,338.70,4821.22,50,0
    .goto 1439/1,452.67,4684.98
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_头皮|r
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[毁灭]，|cRXP_WARN_瞬间造成20-40点伤害，并将你击倒2秒|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob 灰斑蓟熊

step
    .goto 1439/1,230.69,4815.33
    >>点击地面上的|cRXP_PICK_传声盒525号|r
    .turnin 1003 >> 交任务：传声盒525号
    .isOnQuest 1003

step
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 951 >> 交任务：玛塞斯特拉遗物
    .target 安努
    .isQuestComplete 951

step
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >> 交任务：向安努回复
    .target 安努

step
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈，开始护送
    >>|cRXP_WARN_如果他不在那里，请跳过此步骤。他重生可能需要长达 25 分钟|r
    >>|cRXP_WARN_这是限时任务，请在任务日志规定的时间内，将他护送到灰谷梅伊瑟娜岗哨的利拉迪斯·月河处|r
    .accept 5321 >> 接任务：昏昏欲睡
    .target 克罗尼亚·恒影

step
    .goto 1439/1,34.78,5001.570
    >>打开|cRXP_PICK_克罗尼亚的箱子|r，拾取 |T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
    .isOnQuest 5321

step
    #completewith volcorEnd
    .goto 1440/1,128.01,3305.31
    +|cRXP_FRIENDLY_克罗尼亚|r会跟随你，偶尔也会协助战斗。|cRXP_WARN_不要把他落下，他睡着时会停下脚步。请留意任务计时，并在限时内完成护送|r
    .use 13536 >> |cRXP_WARN_使用|r|T134229:0|t[|cRXP_LOOT_唤醒号角|r]|cRXP_WARN_来唤醒|r|cRXP_FRIENDLY_克罗尼亚|r|cRXP_WARN_；每当他睡着时，站在他身旁吹响号角|r
    >>|cRXP_WARN_尽量别在主路上奔跑；敌人只会在道路上刷新。|r
    .isOnQuest 5321

step
    #completewith next
    .goto 1439/1,-5.83,4608.57,30 >> 前往洞穴中的|cRXP_FRIENDLY_沃科尔|r处
    .isOnQuest 993

step
    .isOnQuest 993
    .goto 1439/1,-5.83,4608.570
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    .turnin 993 >> 交任务：丢失的主人
    .accept 995 >> 接任务：偷偷溜走
    .timer 20,偷偷溜走剧情演出
    .target 沃科尔

step
    .isQuestTurnedIn 993
    .goto 1439/1,-5.83,4608.570
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    .accept 995 >> 接任务：偷偷溜走
    .target 沃科尔

step
    #label volcorEnd
    .goto 1439/1,30.85,4635.20
    >>|cRXP_WARN_等待剧情演出结束|r
    .complete 995,1
    .isOnQuest 995

step
    #label KerlonianTwo
    .goto 1440/1,128.01,3305.31
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_克罗尼亚|r|cRXP_WARN_到灰谷梅伊瑟娜岗哨的|r|cRXP_FRIENDLY_利拉迪斯·月河|r|cRXP_WARN_处|r
    .use 13536 >> |cRXP_WARN_使用|r|T134229:0|t[|cRXP_LOOT_唤醒号角|r]|cRXP_WARN_，当|r|cRXP_FRIENDLY_克罗尼亚|r|cRXP_WARN_睡着时，站在他身旁吹响号角|r
    >>|cRXP_WARN_尽量别在主路上奔跑；敌人只会在道路上刷新。|r
    .complete 5321,2
    .isOnQuest 5321

step
    #completewith tower
    .zone Ashenvale >> 向南前往灰谷
    .goto 1440/1,-12.70,4150.17

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利拉迪斯·月河|r交谈
    .target 利拉迪斯·月河
    .goto 1440/1,128.01,3305.31
    .turnin 5321 >> 交任务：昏昏欲睡
    .isQuestComplete 5321

step
    #label tower
    .goto 1440/1,189.71,3185.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 967 >> 交任务：奥萨拉克斯之塔
    .accept 970 >> 接任务：奥萨拉克斯之塔
    .target 净化者德尔格伦

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .target 奥雷迪尔·阔叶
    .goto 1440/1,175.87,3189.61
    .accept 1010 >> 接任务：巴斯兰的头发
    .xp <20,1

step
    .goto 1440/1,-102.08,3492.890
    >>击杀|cRXP_ENEMY_暗滩祭司|r和|cRXP_ENEMY_暗滩精兵|r，拾取|cRXP_LOOT_发光的灵魂宝石|r
    .complete 970,1
    .mob 暗滩祭司
    .mob 暗滩精兵

step
    .goto 1440/1,-102.08,3492.890
    .xp 20-1650 >>持续击杀|cRXP_ENEMY_暗滩怪物|r，直到距离20级还差1650经验；交后续任务后即可升级
    .mob 暗滩祭司
    .mob 暗滩精兵
    .mob 暗滩执行者
    .mob 暗滩挖掘者

step
    #optional
    .goto 1440/1,-203.58,3849.97,50,0
    .goto 1440/1,-2.90,3737.73,40,0
    .goto 1440/1,-138.99,3806.92
    >>打开地面的|cRXP_PICK_草药|r，拾取|cRXP_LOOT_巴斯兰的头发|r。
    >>|cRXP_WARN_它们像棕色的小袋子，可能有一部分埋在地里，不太容易发现。|r
    >>|cRXP_WARN_确保已启用|r |T134916:0|t[寻找草药]|cRXP_WARN_，这样才能在小地图上看到这些草药。|r
    .complete 1010,1 --Bathran's Hair (5)
    .isOnQuest 1010
    .skill herbalism,<1,1

step
    #optional
    .goto 1440/1,-203.58,3849.97,50,0
    .goto 1440/1,-2.90,3737.73,40,0
    .goto 1440/1,-138.99,3806.92
    >>打开地面的|cRXP_PICK_草药|r，拾取|cRXP_LOOT_巴斯兰的头发|r。
    >>|cRXP_WARN_它们像棕色的小袋子，可能有一部分埋在地里，不太容易发现。|r
    .complete 1010,1 --Bathran's Hair (5)
    .isOnQuest 1010
    .skill herbalism,1,1

step
    #optional
    .goto 1440/1,175.87,3189.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .turnin 1010 >> 交任务：巴斯兰的头发
    .accept 1020 >> 接任务：奥雷迪尔的药剂
    .target 奥雷迪尔·阔叶
    .isQuestComplete 1010

step
    #optional
    .goto 1440/1,175.87,3189.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .accept 1020 >> 接任务：奥雷迪尔的药剂
    .target 奥雷迪尔·阔叶
    .isQuestTurnedIn 1010

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .target 净化者德尔格伦
    .goto 1440/1,189.71,3185.77
    .turnin 970 >> 交任务：奥萨拉克斯之塔
    .accept 973 >> 接任务：奥萨拉克斯之塔

step
    .goto 1440/1,-138.99,3806.92
    .xp 20 >> 刷到20级

step
    .goto 1440/1,175.87,3189.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .accept 1010 >> 接任务：巴斯兰的头发
    .target 奥雷迪尔·阔叶

step
    #optional
    .goto 1440/1,-203.58,3849.97,50,0
    .goto 1440/1,-2.90,3737.73,40,0
    .goto 1440/1,-138.99,3806.92
    >>打开地面的|cRXP_PICK_草药|r，拾取|cRXP_LOOT_巴斯兰的头发|r。
    >>|cRXP_WARN_它们像棕色的小袋子，可能有一部分埋在地里，不太容易发现。|r
    >>|cRXP_WARN_确保已启用|r |T134916:0|t[寻找草药]|cRXP_WARN_，这样才能在小地图上看到这些草药。|r
    .complete 1010,1 --Bathran's Hair (5)
    .skill herbalism,<1,1

step
    .goto 1440/1,-203.58,3849.97,50,0
    .goto 1440/1,-2.90,3737.73,40,0
    .goto 1440/1,-138.99,3806.92
    >>打开地面的|cRXP_PICK_草药|r，拾取|cRXP_LOOT_巴斯兰的头发|r。
    >>|cRXP_WARN_它们像棕色的小袋子，可能有一部分埋在地里，不太容易发现。|r
    .complete 1010,1 --Bathran's Hair (5)
    .skill herbalism,1,1

step
    .goto 1440/1,175.87,3189.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .turnin 1010 >> 交任务：巴斯兰的头发
    .accept 1020 >> 接任务：奥雷迪尔的药剂
    .target 奥雷迪尔·阔叶

step
    #optional
    #completewith TZS
    .subzone 415 >> 前往阿斯特兰纳

step
    #label AshenvaleEnd
    .goto 1440/1,-283.73,2827.920
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黛琳希亚|r交谈
    .fp Astranaar >> 获取阿斯特兰纳飞行点
    .target 黛琳希亚

step
    #label TZS
    .goto 1440/1,-299.30,2796.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛德瑞尔·速火|r交谈
    .accept 1008 >> 接任务：佐拉姆海岸
    .target 辛德瑞尔·速火

step
    .goto 1440/1,-311.99,2759.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵塞恩希尔|r交谈
    .accept 1070 >> 接任务：守卫石爪山
    .target 哨兵塞恩希尔

step
    .goto 1440/1,-362.16,2785.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法德瑞斯·戈森沙尔|r交谈
    .accept 1056 >> 接任务：石爪峰之旅
    .target 法德瑞斯·戈森沙尔

step
    .goto 1440/1,-411.18,2767.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
    .accept 991 >> 接任务：莱恩的净化
    .accept 1054 >> 接任务：解除威胁
    .target 莱恩·狼行者

step << !Warlock
    .goto 1440/1,-433.09,2781.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板基姆利雅|r交谈
    .home 415 >> 将炉石绑定在阿斯特兰纳
    .target 旅店老板基姆利雅

step
    .goto 1440/1,-454.43,2682.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
    .target 皮尔图拉斯·怀特姆恩
    .turnin 1020 >> 交任务：奥雷迪尔的药剂
    .timer 24,奥雷迪尔的药剂剧情演出
    .accept 1033 >> 接任务：月神之泪
]])
