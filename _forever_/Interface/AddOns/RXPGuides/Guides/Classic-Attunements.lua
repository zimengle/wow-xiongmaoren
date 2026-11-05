RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 入场任务
#classic
#tbc
<< Alliance
#group RestedXP Endgame Guides
#subgroup Attunements
#name Onyxia Attunement (A)
#title 奥妮克希亚入场任务（联盟）
#guideKind attunement
#guideIcon rxp-icon-ony
#displayname 奥妮克希亚入场任务（联盟）

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    #completewith next
    .zone Burning Steppes>>|cRXP_WARN_前往|r |cFFfa9602燃烧平原|r

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .goto Burning Steppes,85.820,68.948
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫林迪斯·河角|r 交谈
    .accept 4182 >> 接任务: 黑龙的威胁
    .target 赫林迪斯·河角

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    #loop
    .goto Burning Steppes,90.6,43.6,0
    .goto Burning Steppes,81.8,27.8,70,0
    .goto Burning Steppes,91.4,32.6,70,0
    .goto Burning Steppes,89.8,54.6,70,0
    .goto Burning Steppes,81.8,60.0,70,0
    .goto Burning Steppes,89.8,54.6,70,0
    .goto Burning Steppes,91.4,32.6,70,0
    .goto Burning Steppes,81.8,27.8,70,0
    .goto Burning Steppes,90.6,43.6,70,0
    >>击杀 |cRXP_ENEMY_黑色小龙|r、|cRXP_ENEMY_黑色龙人|r、|cRXP_ENEMY_火鳞龙人|r 和一只 |cRXP_ENEMY_黑色幼龙|r
    >>|cRXP_ENEMY_黑色龙人|r|cRXP_WARN_、|r|cRXP_ENEMY_火鳞龙人|r|cRXP_WARN_和|r|cRXP_ENEMY_黑色幼龙|r|cRXP_WARN_都是精英怪。如有需要请组队|r
    .complete 4182,1 -- Black Broodling slain (15)
    .mob +黑色小龙
    .complete 4182,2 -- Black Dragonspawn slain (10)
    .mob +黑色龙人
    .complete 4182,4 -- Black Wyrmkin slain (4)
    .mob +火鳞龙人
    .complete 4182,3 -- Black Drake slain
    .mob +黑色幼龙

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestComplete 4182
    .goto Burning Steppes,85.820,68.948
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫林迪斯·河角|r 交谈
    .turnin 4182 >> 交任务: 黑龙的威胁
    .accept 4183 >> 接任务: 真正的主人
    .target 赫林迪斯·河角

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    .goto Burning Steppes,85.820,68.948
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫林迪斯·河角|r 交谈
    .accept 4183 >> 接任务: 真正的主人
    .target 赫林迪斯·河角

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    #completewith next
    .goto Burning Steppes,84.333,68.328
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_博古斯·粗臂|r 交谈
    .fly Redridge >> 飞往赤脊山
    .target 博古斯·粗臂

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    .goto Redridge Mountains,29.98,44.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_所罗门镇长|r 交谈
    .turnin 4183 >> 交任务: 真正的主人
    .accept 4184 >> 接任务: 真正的主人
    .target 所罗门镇长

step
    .isOnQuest 4184
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
    .fly Stormwind >> 飞往暴风城
    .target 艾蕾娜·斯托姆法瑟
    .zoneskip Redridge Mountains,1

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    .goto Stormwind City,78.213,17.980
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伯瓦尔·弗塔根公爵|r 交谈
    .turnin 4184 >> 交任务: 真正的主人
    .accept 4185 >> 接任务: 真正的主人
    .target 伯瓦尔·弗塔根公爵

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    .goto Stormwind City,78.102,17.750
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_女伯爵卡特拉娜·普瑞斯托|r 交谈
    .complete 4185,1 -- Advice from Lady Prestor
    .skipgossip
    .target 女伯爵卡特拉娜·普瑞斯托

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    .goto Stormwind City,78.213,17.980
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伯瓦尔·弗塔根公爵|r 交谈
    .turnin 4185 >> 交任务: 真正的主人
    .accept 4186 >> 接任务: 真正的主人
    .target 伯瓦尔·弗塔根公爵

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    #completewith next
    .goto Stormwind City,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 交谈
    .fly Redridge>> 飞往赤脊山
    .target 杜加尔·朗德瑞克

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    .goto Redridge Mountains,29.98,44.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_所罗门镇长|r 交谈
    .turnin 4186 >> 交任务: 真正的主人
    .accept 4223 >> 接任务: 真正的主人
    .target 所罗门镇长

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    #completewith next
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
    .fly Burning Steppes >> 飞往燃烧平原
    .target 艾蕾娜·斯托姆法瑟

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    .goto Burning Steppes,84.744,69.015
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦克斯韦尔元帅|r 交谈
    .turnin 4223 >> 交任务: 真正的主人
    .accept 4224 >> 接任务: 真正的主人
    .target 麦克斯韦尔元帅

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    #completewith WindsorPickup
    .goto Burning Steppes,65.236,24.007
    .subzone 251 >> 前往烈焰峰

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    .goto Burning Steppes,65.012,23.757
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_狼狈不堪的约翰|r 交谈
    .complete 4224,1 -- Ragged John's Story (1)
    .skipgossip
    .target 狼狈不堪的约翰

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    #label WindsorPickup
    .isQuestTurnedIn 4182
    .goto Burning Steppes,84.744,69.015
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦克斯韦尔元帅|r 交谈
    .turnin 4224 >> 交任务: 真正的主人
    .accept 4241 >> 接任务: 温德索尔元帅
    .target 麦克斯韦尔元帅

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    #completewith next
    .goto Eastern Kingdoms,48.07,62.42
    .subzone 1584,2 >>进入黑石深渊
    >>|cRXP_WARN_确保已组好队伍|r

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温德索尔元帅|r 交谈
    >>|cRXP_WARN_若队伍没有潜行者，你可能需要击杀|r |cRXP_ENEMY_审讯官格斯塔恩|r |cRXP_WARN_以取得|r |cRXP_LOOT_监狱牢房钥匙|r |cRXP_WARN_来开门|r
    .turnin 4241 >> 交任务: 温德索尔元帅
    .accept 4242 >> 接任务: 被遗弃的希望

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    #completewith next
    .subzone 2418 >>前往 |cFFfa9602燃烧平原|r 的摩根的岗哨

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4182
    .goto Burning Steppes,84.744,69.015
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦克斯韦尔元帅|r 交谈
    >>|cRXP_WARN_任务链会在此暂停，直到你找到|r |T134331:0|t[弄皱的便笺] |cRXP_WARN_，此物品在黑石深渊掉落|r
    .turnin 4242 >> 交任务: 被遗弃的希望
    .target 麦克斯韦尔元帅

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4242
    .goto Eastern Kingdoms,48.07,62.42
    #completewith next
    .subzone 1584,2 >>进入黑石深渊

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4242
    >>在黑石深渊击杀 |cRXP_ENEMY_矮人|r，拾取他们的 |T134331:0|t[弄皱的便笺]
    .use 11446 >> |cRXP_WARN_使用|r |T134331:0|t[弄皱的便笺] |cRXP_WARN_开始任务|r
    >>|cRXP_WARN_务必先完成此操作，再击杀首领 |cRXP_ENEMY_安格弗将军|r 和|r |cRXP_ENEMY_傀儡统帅阿格曼奇|r
    >>|cRXP_WARN_到现在还没找到则清理拘留区周围直到掉落|r
    .collect 11446,1,4264,1 -- A Crumpled Up Note (1)
    .accept 4264 >> 接任务: 弄皱的便笺

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isOnQuest 4264
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温德索尔元帅|r 交谈
    .turnin 4264 >> 交任务: 弄皱的便笺
    .accept 4282 >> 接任务: 一丝希望

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4264
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温德索尔元帅|r 交谈
    .accept 4282 >> 接任务: 一丝希望

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isOnQuest 4282
    >>击杀 |cRXP_ENEMY_安格弗将军|r 和 |cRXP_ENEMY_傀儡统帅阿格曼奇|r，分别拾取他们的 |cRXP_LOOT_温德索尔元帅遗失的情报|r
    .complete 4282,1 -- Marshal Windsor's Lost Information (1)
    .complete 4282,2 -- Marshal Windsor's Lost Information (1)

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4264
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温德索尔元帅|r 交谈
    >>|cRXP_WARN_确保所有队员在此步骤关闭自动接受功能!RestedXP 已在此步骤关闭自动接受|r
    >>|cRXP_WARN_接受此任务会开始冲破牢笼的护送。确保已清理整个拘留区，以便更轻松地护送|r |cRXP_FRIENDLY_温德索尔元帅|r
    .turnin 4282 >> 交任务: 一丝希望
    .accept 4322,1 >> 接任务: 冲破牢笼！

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isOnQuest 4322
    >>护送 |cRXP_FRIENDLY_温德索尔元帅|r 穿过黑石深渊
    .complete 4322,1 -- Jail Break! (1)

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    #completewith Rendezvoes
    .subzone 2418 >>前往 |cFFfa9602燃烧平原|r 的摩根的岗哨

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestComplete 4322
    .goto Burning Steppes,84.744,69.015
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦克斯韦尔元帅|r 交谈
    .turnin 4322 >> 交任务: 冲破牢笼！
    .accept 6402 >> 接任务: 集合在暴风城
    .target 麦克斯韦尔元帅

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4322
    #label Rendezvoes
    .goto Burning Steppes,84.744,69.015
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦克斯韦尔元帅|r 交谈
    .accept 6402 >> 接任务: 集合在暴风城
    .target 麦克斯韦尔元帅

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4322
    .goto StormwindClassic,70.424,85.171,5,0
    .goto StormwindClassic,69.709,86.083
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_侍卫洛文|r 和 |cRXP_FRIENDLY_雷吉纳德·温德索尔|r 交谈
    >>在暴风城大门处与 |cRXP_FRIENDLY_侍卫洛文|r 交谈后，他会召唤 |cRXP_FRIENDLY_雷吉纳德·温德索尔|r 到场
    >>|cRXP_WARN_如果你在队伍中, 请确保没有人自动接受任务“潜藏者”. 此步骤已关闭自动接受功能|r
    .turnin 6402 >> 交任务: 集合在暴风城
    .accept 6403,1 >> 接任务: 潜藏者
    .skipgossip
    .target 侍卫洛文
    .target 雷吉纳德·温德索尔

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 4322
    .goto StormwindClassic,75.955,19.114,-1
    .goto StormwindClassic,76.865,20.830,-1
    >>护送 |cRXP_FRIENDLY_雷吉纳德·温德索尔|r 进入暴风要塞
    >>在要塞内不要协助 |cRXP_FRIENDLY_雷吉纳德·温德索尔|r 战斗，否则很可能会死亡。留在箭头指示的位置，让事件自行结束，这需要几分钟
    .complete 6403,1 -- Reginald's March (1)
    .target 雷吉纳德·温德索尔

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestComplete 6403
    .goto StormwindClassic,77.569,18.864
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伯瓦尔·弗塔根公爵|r 交谈
    .turnin 6403 >> 交任务: 潜藏者
    .accept 6501 >> 接任务: 巨龙之眼
    .target 伯瓦尔·弗塔根公爵

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 6403
    .goto StormwindClassic,77.569,18.864
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伯瓦尔·弗塔根公爵|r 交谈
    .accept 6501 >> 接任务: 巨龙之眼
    .target 伯瓦尔·弗塔根公爵

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    #completewith next
    .zone Winterspring >>前往 |cFFfa9602冬泉谷|r

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 6403
    #completewith next
    .goto Winterspring,56.60,52.78,0
    .goto Winterspring,56.60,52.78,50,0
    .goto Winterspring,56.36,53.60,30,0
    .goto Winterspring,55.31,53.84,20,0
    .goto Winterspring,54.78,53.30,20,0
    .goto Winterspring,54.51,53.44,20,0
    .goto Winterspring,54.14,52.84,10,0
    .goto Winterspring,53.73,52.04,10,0
    .goto Winterspring,54.54,51.21,30 >>执行山地跳跃抵达 |cRXP_FRIENDLY_哈尔琳|r
    >>起始位置已标记在你的地图上. 请仔细跟随导航箭头前进
    >>|cRXP_WARN_如果你有|r |T134863:0|t[诺格弗格药剂]|cRXP_WARN_，可以使用它获得|r |T135992:0|t[缓落术] |cRXP_WARN_，让跳跃更轻松|r << !Priest !Mage
    >>|cRXP_WARN_如果你有|r |T134863:0|t[诺格弗格药剂] |cRXP_WARN_或|r |T132917:0|t[轻羽毛]|cRXP_WARN_，可以用它们获得|r |T135992:0|t[缓落术] |cRXP_WARN_，让跳跃更轻松|r << Mage
    >>|cRXP_WARN_如果你有|r |T134863:0|t[诺格弗格药剂] |cRXP_WARN_或|r |T132917:0|t[轻羽毛]|cRXP_WARN_，可以用它们获得|r |T135992:0|t[缓落术] |cRXP_WARN_或|r |T135928:0|t[漂浮术] |cRXP_WARN_，让跳跃更轻松|r << Priest
    .link https://www.youtube.com/watch?v=qjmkIzbfBbQ&ab_channel=RestedXP >> |cRXP_WARN_点击这里查看视频参考|r

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 6403
    .goto Winterspring,54.54,51.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈尔琳|r 交谈
    .turnin 6501 >>交任务 巨龙之眼
    .accept 6502 >>接受任务 龙火护符
    .target 哈尔琳

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    #completewith next
    .goto Eastern Kingdoms,48.95,63.89
    .subzone 1583 >>进入黑石塔
    >>|cRXP_WARN_这是一个10人副本。你或队伍中的其他人必须持有|r |T133343:0|t[|cRXP_LOOT_晋升印章|r] |cRXP_WARN_才能进入黑石塔上层|r

step
    .isQuestAvailable 6502
    .isQuestNotComplete 6502
    .isQuestTurnedIn 6403
    >>击杀 |cRXP_ENEMY_达基萨斯将军|r，拾取他的 |cRXP_LOOT_黑龙勇士之血|r
    .complete 6502,1 --Blood of the Black Dragon Champion 1/1
    .mob 达基萨斯将军

step
    .isQuestComplete 6502
    #completewith next
    .zone Winterspring >>前往 |cFFfa9602冬泉谷|r

step
    .isQuestComplete 6502
    #completewith next
    .goto Winterspring,56.60,52.78,0
    .goto Winterspring,56.60,52.78,50,0
    .goto Winterspring,56.36,53.60,30,0
    .goto Winterspring,55.31,53.84,20,0
    .goto Winterspring,54.78,53.30,20,0
    .goto Winterspring,54.51,53.44,20,0
    .goto Winterspring,54.14,52.84,10,0
    .goto Winterspring,53.73,52.04,10,0
    .goto Winterspring,54.54,51.21,30 >>执行山地跳跃抵达 |cRXP_FRIENDLY_哈尔琳|r
    >>起始位置已标记在你的地图上. 请仔细跟随导航箭头前进
    >>|cRXP_WARN_如果你有|r |T134863:0|t[诺格弗格药剂]|cRXP_WARN_，可以使用它获得|r |T135992:0|t[缓落术] |cRXP_WARN_，让跳跃更轻松|r << !Priest !Mage
    >>|cRXP_WARN_如果你有|r |T134863:0|t[诺格弗格药剂] |cRXP_WARN_或|r |T132917:0|t[轻羽毛]|cRXP_WARN_，可以用它们获得|r |T135992:0|t[缓落术] |cRXP_WARN_，让跳跃更轻松|r << Mage
    >>|cRXP_WARN_如果你有|r |T134863:0|t[诺格弗格药剂] |cRXP_WARN_或|r |T132917:0|t[轻羽毛]|cRXP_WARN_，可以用它们获得|r |T135992:0|t[缓落术] |cRXP_WARN_或|r |T135928:0|t[漂浮术] |cRXP_WARN_，让跳跃更轻松|r << Priest
    .link https://www.youtube.com/watch?v=qjmkIzbfBbQ&ab_channel=RestedXP >> |cRXP_WARN_点击这里查看视频参考|r

step
    .isQuestComplete 6502
    #softcore
    .isQuestTurnedIn 6403
    .goto Winterspring,54.54,51.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈尔琳|r 交谈
    >>|cRXP_WARN_小心 |cRXP_FRIENDLY_哈尔琳|r 面前的蓝色圆圈，踩上去会被传送到洞穴内|r
    .turnin 6502 >>交任务 龙火护符
    .target 哈尔琳

step
    .isQuestComplete 6502
    #hardcore
    .isQuestTurnedIn 6403
    .goto Winterspring,54.54,51.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈尔琳|r 交谈
    >>|cRXP_WARN_小心！不要踩上 |cRXP_FRIENDLY_哈尔琳|r 面前的蓝色圆圈，否则会被传送到有精英龙的洞穴内，可能导致死亡|r
    .turnin 6502 >>交任务 龙火护符
    .target 哈尔琳
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 入场任务
#classic
#tbc
<< Horde
#group RestedXP Endgame Guides
#subgroup Attunements
#name Onyxia Attunement (H)
#title 奥妮克希亚入场任务（部落）
#guideKind attunement
#guideIcon rxp-icon-ony
#displayname 奥妮克希亚入场任务（部落）

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .subzone 340 >>前往 |cFFfa9602荒芜之地|r 的卡加斯

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    .goto Badlands,5.81,47.52
    >>与|cRXP_FRIENDLY_军官高图斯|r交谈，获得|T133473:0|t[|cRXP_LOOT_高图斯的命令|r]。使用它接取任务
    .collect 12563,1,4903 --Warlord Goretooth's Command 1/1
    .use 12563
    .accept 4903 >>接受任务 高图斯的命令
    .target 军官高图斯
    .skipgossip 0,1,1,1,1,1

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .goto Eastern Kingdoms,48.95,63.89
    .subzone 1583 >>进入黑石塔
    >>|cRXP_WARN_完成“高图斯的命令”时请使用最多5人的小队，不要转为团队，否则无法完成任务目标|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #sticky
    #label ImportantDocuments
    >>拾取|cRXP_LOOT_重要的黑石文件|r
    >>它可能出现在副本内的4个不同地点：
    >>|cRXP_WARN_在|r|cRXP_ENEMY_维姆萨拉克|r脚下
    >>|cRXP_WARN_在|r|cRXP_ENEMY_指挥官沃恩|r旁边的空角落里
    >>|cRXP_WARN_在|r|cRXP_ENEMY_欧莫克大王|r附近
    >>|cRXP_WARN_在|cRXP_ENEMY_乌洛克|r的贡品堆旁|r
    .complete 4903,4 --Important Blackrock Documents 1/1

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    >>击杀|cRXP_ENEMY_欧莫克大王|r、|cRXP_ENEMY_指挥官沃恩|r和|cRXP_ENEMY_维姆萨拉克|r
    .complete 4903,2 --Highlord Omokk 1/1
    .mob +欧莫克大王
    .complete 4903,3 --War Master Voone 1/1
    .mob +指挥官沃恩
    .complete 4903,1 --Overlord Wyrmthalak 1/1
    .mob +维姆萨拉克

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #requires ImportantDocuments
    #completewith next
    .subzone 340 >>前往 |cFFfa9602荒芜之地|r 的卡加斯

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #requires ImportantDocuments
    .goto Badlands,5.81,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军官高图斯|r交谈
    .turnin 4903 >>交任务 高图斯的命令
    .accept 4941 >>接受任务 伊崔格的智慧
    .target 军官高图斯

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .zone Orgrimmar >>前往|cFFfa9602奥格瑞玛|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    .goto Orgrimmar,34.27,39.35,10,0
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊崔格|r交谈并完成对话，然后与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 4941 >>交任务 伊崔格的智慧
    .accept 4974 >>接受任务 为部落而战！
    .target 伊崔格
    .target 萨尔
    .skipgossip

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .subzone 1583,2 >>进入黑石塔
    >>|cRXP_WARN_这是一个10人副本。你或队伍中的一名成员必须持有|r|T133343:0|t[|cRXP_LOOT_晋升印章|r]|cRXP_WARN_才能进入黑石塔上层|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    >>击杀|cRXP_ENEMY_大酋长雷德·黑手|r，拾取他的|cRXP_LOOT_头颅|r
    .complete 4974,1 --Head of Rend Blackhand 1/1
    .mob 大酋长雷德·黑手

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .zone Orgrimmar >>前往|cFFfa9602奥格瑞玛|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 4974 >>交任务 为部落而战！
    .accept 6566 >>接受任务 风吹来的消息
    .target 萨尔

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    .goto Orgrimmar,31.74,37.82
    >>聆听|cRXP_FRIENDLY_萨尔|r的故事
    .complete 6566,1 --Thrall's Tale
    .target 萨尔
    .skipgossip

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 6566 >>交任务 风吹来的消息
    .accept 6567 >>接受任务 部落的勇士
    .target 萨尔

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .goto Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|r：|cRXP_FRIENDLY_多拉斯|r
    .fly Sun Rock Retreat >> 飞往烈日石居
    .target 多拉斯
    .zoneskip Stonetalon Mountains
    .zoneskip Desolace
    .zoneskip Feralas

step << !tbc
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #loop
    .line Desolace,55.50,0.50,53.37,5.77,54.61,10.71,56.20,13.14,60.42,16.17,62.27,19.48,63.38,26.21,62.14,32.17,60.49,37.07,57.27,38.21,53.34,37.51,50.46,42.48,49.55,48.56,49.10,54.18,52.25,59.36,54.52,63.72,55.63,67.41,52.04,71.54,50.53,75.40,47.03,75.15,39.99,78.28,39.79,81.92,41.79,85.27,40.68,89.43,41.44,93.66,41.95,96.04
    .line Feralas,45.47,2.89,45.91,4.75,44.95,7.04,45.03,8.93,45.75,10.64,45.94,12.52,46.43,15.18,46.34,20.94,48.19,23.23
    .goto Desolace,55.50,0.50,60,0
    .goto Desolace,53.37,5.77,60,0
    .goto Desolace,54.61,10.71,60,0
    .goto Desolace,56.20,13.14,60,0
    .goto Desolace,60.42,16.17,60,0
    .goto Desolace,62.27,19.48,60,0
    .goto Desolace,63.38,26.21,60,0
    .goto Desolace,62.14,32.17,60,0
    .goto Desolace,60.49,37.07,60,0
    .goto Desolace,57.27,38.21,60,0
    .goto Desolace,53.34,37.51,60,0
    .goto Desolace,50.46,42.48,60,0
    .goto Desolace,49.55,48.56,60,0
    .goto Desolace,49.10,54.18,60,0
    .goto Desolace,52.25,59.36,60,0
    .goto Desolace,54.52,63.72,60,0
    .goto Desolace,55.63,67.41,60,0
    .goto Desolace,52.04,71.54,60,0
    .goto Desolace,50.53,75.40,60,0
    .goto Desolace,47.03,75.15,60,0
    .goto Desolace,39.99,78.28,60,0
    .goto Desolace,39.79,81.92,60,0
    .goto Desolace,41.79,85.27,60,0
    .goto Desolace,40.68,89.43,60,0
    .goto Desolace,41.44,93.66,60,0
    .goto Desolace,41.95,96.04,60,0
    .goto Feralas,45.47,2.89,60,0
    .goto Feralas,45.91,4.75,60,0
    .goto Feralas,44.95,7.04,60,0
    .goto Feralas,45.03,8.93,60,0
    .goto Feralas,45.75,10.64,60,0
    .goto Feralas,45.94,12.52,60,0
    .goto Feralas,46.43,15.18,60,0
    .goto Feralas,46.34,20.94,60,0
    .goto Feralas,48.19,23.23,60,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r交谈
    >>|cRXP_FRIENDLY_雷克萨|r|cRXP_WARN_在|cFFfa9602凄凉之地|r由北向南巡逻。地图上已标出他的路线，请沿路点箭头走完整条路线。|r
    >>|cRXP_WARN_他到达|cFFfa9602菲拉斯|r的双塔山后会消失；若途中未找到，可在|cFFfa9602石爪山脉与凄凉之地交界处|r等候他重新出现。
    .turnin 6567 >>交任务 部落的勇士
    .accept 6568 >>接受任务 雷克萨的证明
    .unitscan 雷克萨

step << tbc
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    .goto Desolace,25.60,70.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往葬影村，与|cRXP_FRIENDLY_罗卡鲁|r交谈
    >>|cRXP_WARN_在TBC中，罗卡鲁在这里代替雷克萨处理入场任务，不需要寻找巡逻的雷克萨|r
    .turnin 6567 >>交任务 部落的勇士
    .accept 6568 >>接受任务 雷克萨的证明
    .target 罗卡鲁

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .zone Western Plaguelands >>前往 |cFFfa9602西瘟疫之地|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    .goto Western Plaguelands,50.79,77.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巫女麦兰达|r交谈
    .turnin 6568 >>交任务 雷克萨的证明
    .accept 6569 >>接受任务 黑龙幻象
    .target 巫女麦兰达

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .goto Eastern Kingdoms,48.95,63.89
    .subzone 1583 >>进入黑石塔
    >>|cRXP_WARN_这是一个10人副本。你或队伍中的一名成员必须持有|r|T133343:0|t[|cRXP_LOOT_晋升印章|r]|cRXP_WARN_才能进入黑石塔上层|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    >>击杀任意种类的|cRXP_ENEMY_龙类|r，拾取|cRXP_LOOT_黑色龙人的眼球|r
    >>|cRXP_WARN_只有黑石塔上层的|cRXP_ENEMY_龙类|r会掉落这些|cRXP_LOOT_眼球|r
    .complete 6569,1 --Black Dragonspawn Eye 20/20

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .zone Western Plaguelands >>前往 |cFFfa9602西瘟疫之地|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    .goto Western Plaguelands,50.79,77.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巫女麦兰达|r交谈
    .turnin 6569 >>交任务 黑龙幻象
    .accept 6570 >>接受任务 埃博斯塔夫
    .target 巫女麦兰达

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .zone Dustwallow Marsh >>前往 |cFFfa9602尘泥沼泽|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith Emberstrife1
    .goto Dustwallow Marsh,54.37,84.22
    .subzone 2158 >>进入埃博斯塔夫的巢穴

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #hardcore
    #completewith next
    .cast 19937 >>|cRXP_WARN_小心！一定要先使用|r|T133608:0|t[龙形护符]|cRXP_WARN_，再靠近|cRXP_ENEMY_埃博斯塔夫|r，否则他可能会杀死你|r
    .use 16787

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #label Emberstrife1
    .goto Dustwallow Marsh,56.67,87.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃博斯塔夫|r交谈
    .use 16787 >>|cRXP_WARN_使用|r|T133608:0|t[龙形护符]|cRXP_WARN_进行伪装|r
    .turnin 6570 >>交任务 埃博斯塔夫
    .accept 6582 >>接受任务 龙骨试炼，斯克利尔
    .accept 6583 >>接受任务 龙骨试炼，索姆努斯
    .accept 6584 >>接受任务 龙骨试炼，克鲁纳里斯
    .target 埃博斯塔夫

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #sticky
    #label SkullofDragons
    >>击杀|cRXP_ENEMY_斯克利尔|r，他位于|cFFfa9602冬泉谷|r
    >>击杀|cRXP_ENEMY_索姆努斯|r，他位于|cFFfa9602悲伤沼泽|r
    >>击杀|cRXP_ENEMY_克鲁纳里斯|r，他位于|cFFfa9602塔纳利斯|r
    >>拾取他们的|cRXP_LOOT_颅骨|r
    >>|cRXP_WARN_地图上已标出他们的位置。建议至少5名玩家组队完成|r
    .complete 6582,1 --The Skull of Scryer 1/1
    .goto Winterspring,52.91,55.77,0
    .complete 6583,1 --The Skull of Somnus 1/1
    .goto Swamp of Sorrows,85.85,52.28,0
    .line Swamp of Sorrows,85.85,52.28,84.66,48.44,80.35,45.41,78.44,50.46,79.44,57.58,77.47,62.39,76.08,66.50,76.25,70.23,82.55,72.08,85.42,63.68,86.68,55.89,85.85,52.28
    .complete 6584,1 --The Skull of Chronalis 1/1
    .goto Tanaris,64.85,50.52
    .unitscan 斯克利尔
    .unitscan 索姆努斯
    .unitscan 克鲁纳里斯

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .zone Winterspring >>前往 |cFFfa9602冬泉谷|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .goto Winterspring,57.07,49.97
    .subzone 2245 >>进入麦索瑞尔洞穴

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    .goto Winterspring,52.91,55.77
    >>在洞穴深处击杀|cRXP_ENEMY_斯克利尔|r，拾取他的|cRXP_LOOT_颅骨|r
    >>|cRXP_WARN_小心他的|r|T135848:0|t[冰息术]|cRXP_WARN_技能（对前方范围喷吐）|r
    .complete 6582,1 --The Skull of Scryer 1/1
    .unitscan 斯克利尔

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .zone Swamp of Sorrows >>前往 |cFFfa9602悲伤沼泽|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #loop
    .goto Swamp of Sorrows,85.85,52.28,0
    .line Swamp of Sorrows,85.85,52.28,84.66,48.44,80.35,45.41,78.44,50.46,79.44,57.58,77.47,62.39,76.08,66.50,76.25,70.23,82.55,72.08,85.42,63.68,86.68,55.89,85.85,52.28
    .goto Swamp of Sorrows,85.85,52.28,50,0
    .goto Swamp of Sorrows,84.66,48.44,50,0
    .goto Swamp of Sorrows,80.35,45.41,50,0
    .goto Swamp of Sorrows,78.44,50.46,50,0
    .goto Swamp of Sorrows,79.44,57.58,50,0
    .goto Swamp of Sorrows,77.47,62.39,50,0
    .goto Swamp of Sorrows,76.08,66.50,50,0
    .goto Swamp of Sorrows,76.25,70.23,50,0
    .goto Swamp of Sorrows,82.55,72.08,50,0
    .goto Swamp of Sorrows,85.42,63.68,50,0
    .goto Swamp of Sorrows,86.68,55.89,50,0
    >>击杀|cRXP_ENEMY_索姆努斯|r，拾取他的|cRXP_LOOT_颅骨|r
    >>|cRXP_WARN_小心他的|r|T136007:0|t[腐蚀酸液吐息]|cRXP_WARN_技能（对前方范围喷吐）|r
    >>|cRXP_WARN_他在湖泊南侧和东侧沿一个小圈巡逻|r
    .complete 6583,1 --The Skull of Somnus 1/1
    .unitscan 索姆努斯

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .zone Tanaris >>前往 |cFFfa9602塔纳利斯|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .goto Tanaris,61.55,50.54
    .subzone 1941 >>前往 [时光之穴]

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    .goto Tanaris,64.85,50.52
    >>击杀|cRXP_ENEMY_克鲁纳里斯|r，拾取他的|cRXP_LOOT_颅骨|r
    >>|cRXP_WARN_小心他的|r|T135831:0|t[沙尘之息]|cRXP_WARN_技能（对前方范围喷吐）|r
    .complete 6584,1 --The Skull of Chronalis 1/1
    .unitscan 克鲁纳里斯

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #requires SkullofDragons
    #completewith next
    .zone Dustwallow Marsh >>前往 |cFFfa9602尘泥沼泽|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #requires SkullofDragons
    #completewith Emberstrife2
    .goto Dustwallow Marsh,54.37,84.22
    .subzone 2158 >>进入埃博斯塔夫的巢穴

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #requires SkullofDragons
    #hardcore
    #completewith next
    .cast 19937 >>|cRXP_WARN_小心！一定要先使用|r|T133608:0|t[龙形护符]|cRXP_WARN_，再靠近|cRXP_ENEMY_埃博斯塔夫|r，否则他可能会杀死你|r
    .use 16787

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #label Emberstrife2
    #requires SkullofDragons
    .goto Dustwallow Marsh,56.67,87.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃博斯塔夫|r交谈
    .use 16787 >>|cRXP_WARN_使用|r|T133608:0|t[龙形护符]|cRXP_WARN_进行伪装|r
    .turnin 6582 >>交任务 龙骨试炼，斯克利尔
    .turnin 6583 >>交任务 龙骨试炼，索姆努斯
    .turnin 6584 >>交任务 龙骨试炼，克鲁纳里斯
    .accept 6585 >>接受任务 龙骨试炼，埃克托兹
    .target 埃博斯塔夫

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .zone Wetlands >>前往 |cFFfa9602湿地|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .goto Wetlands,75.44,46.76
    .subzone 1038 >>前往龙喉大门

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #loop
    .goto Wetlands,83.47,48.78,0
    .line Wetlands,81.41,48.41,83.47,48.78,85.61,50.89
    .goto Wetlands,81.41,48.41,30,0
    .goto Wetlands,83.47,48.78,30,0
    .goto Wetlands,85.61,50.89,30,0
    >>击杀|cRXP_ENEMY_埃克托兹|r，拾取他的|cRXP_LOOT_颅骨|r
    >>|cRXP_WARN_小心他的|r|T135831:0|t[火息术]|cRXP_WARN_技能（对前方范围喷吐）|r
    .complete 6585,1 --The Skull of Axtroz 1/1
    .unitscan 埃克托兹

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .zone Dustwallow Marsh >>前往 |cFFfa9602尘泥沼泽|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith Emberstrife3
    .goto Dustwallow Marsh,54.37,84.22
    .subzone 2158 >>进入埃博斯塔夫的巢穴

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #hardcore
    #completewith next
    .cast 19937 >>|cRXP_WARN_小心！一定要先使用|r|T133608:0|t[龙形护符]|cRXP_WARN_，再靠近|cRXP_ENEMY_埃博斯塔夫|r，否则他可能会杀死你|r
    .use 16787

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #label Emberstrife3
    .goto Dustwallow Marsh,56.67,87.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃博斯塔夫|r交谈
    .use 16787 >>|cRXP_WARN_使用|r|T133608:0|t[龙形护符]|cRXP_WARN_进行伪装|r
    .turnin 6585 >>交任务 龙骨试炼，埃克托兹
    .accept 6601 >>接受任务 晋升……
    .target 埃博斯塔夫

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .zone Desolace >>前往 |cFFfa9602凄凉之地|r

step << !tbc
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #loop
    .line Desolace,55.50,0.50,53.37,5.77,54.61,10.71,56.20,13.14,60.42,16.17,62.27,19.48,63.38,26.21,62.14,32.17,60.49,37.07,57.27,38.21,53.34,37.51,50.46,42.48,49.55,48.56,49.10,54.18,52.25,59.36,54.52,63.72,55.63,67.41,52.04,71.54,50.53,75.40,47.03,75.15,39.99,78.28,39.79,81.92,41.79,85.27,40.68,89.43,41.44,93.66,41.95,96.04
    .line Feralas,45.47,2.89,45.91,4.75,44.95,7.04,45.03,8.93,45.75,10.64,45.94,12.52,46.43,15.18,46.34,20.94,48.19,23.23
    .goto Desolace,55.50,0.50,60,0
    .goto Desolace,53.37,5.77,60,0
    .goto Desolace,54.61,10.71,60,0
    .goto Desolace,56.20,13.14,60,0
    .goto Desolace,60.42,16.17,60,0
    .goto Desolace,62.27,19.48,60,0
    .goto Desolace,63.38,26.21,60,0
    .goto Desolace,62.14,32.17,60,0
    .goto Desolace,60.49,37.07,60,0
    .goto Desolace,57.27,38.21,60,0
    .goto Desolace,53.34,37.51,60,0
    .goto Desolace,50.46,42.48,60,0
    .goto Desolace,49.55,48.56,60,0
    .goto Desolace,49.10,54.18,60,0
    .goto Desolace,52.25,59.36,60,0
    .goto Desolace,54.52,63.72,60,0
    .goto Desolace,55.63,67.41,60,0
    .goto Desolace,52.04,71.54,60,0
    .goto Desolace,50.53,75.40,60,0
    .goto Desolace,47.03,75.15,60,0
    .goto Desolace,39.99,78.28,60,0
    .goto Desolace,39.79,81.92,60,0
    .goto Desolace,41.79,85.27,60,0
    .goto Desolace,40.68,89.43,60,0
    .goto Desolace,41.44,93.66,60,0
    .goto Desolace,41.95,96.04,60,0
    .goto Feralas,45.47,2.89,60,0
    .goto Feralas,45.91,4.75,60,0
    .goto Feralas,44.95,7.04,60,0
    .goto Feralas,45.03,8.93,60,0
    .goto Feralas,45.75,10.64,60,0
    .goto Feralas,45.94,12.52,60,0
    .goto Feralas,46.43,15.18,60,0
    .goto Feralas,46.34,20.94,60,0
    .goto Feralas,48.19,23.23,60,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r交谈
    >>|cRXP_FRIENDLY_雷克萨|r|cRXP_WARN_在|cFFfa9602凄凉之地|r由北向南巡逻。地图上已标出他的路线，请沿路点箭头走完整条路线。|r
    >>|cRXP_WARN_他到达|cFFfa9602菲拉斯|r的双塔山后会消失；若途中未找到，可在|cFFfa9602石爪山脉与凄凉之地交界处|r等候他重新出现。
    .turnin 6601 >>交任务 晋升……
    .accept 6602 >>接受任务 黑龙勇士之血
    .unitscan 雷克萨

step << tbc
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    .goto Desolace,25.60,70.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往葬影村，与|cRXP_FRIENDLY_罗卡鲁|r交谈
    >>|cRXP_WARN_在TBC中，罗卡鲁在这里代替雷克萨处理入场任务，不需要寻找巡逻的雷克萨|r
    .turnin 6601 >>交任务 晋升……
    .accept 6602 >>接受任务 黑龙勇士之血
    .target 罗卡鲁

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    #completewith next
    .goto Eastern Kingdoms,48.95,63.89
    .subzone 1583 >>进入黑石塔
    >>|cRXP_WARN_这是一个10人副本。你或队伍中的一名成员必须持有|r|T133343:0|t[|cRXP_LOOT_晋升印章|r]|cRXP_WARN_才能进入黑石塔上层|r

step
    .isQuestAvailable 6602
    .isQuestNotComplete 6602
    .isQuestTurnedIn 6601
    >>击杀|cRXP_ENEMY_达基萨斯将军|r，拾取|cRXP_LOOT_黑龙勇士之血|r
    .complete 6602,1 --Blood of the Black Dragon Champion 1/1
    .mob 达基萨斯将军

step
    .isQuestComplete 6602
    #completewith next
    .zone Desolace >>前往 |cFFfa9602凄凉之地|r

step << !tbc
    .isQuestComplete 6602
    #loop
    .line Desolace,55.50,0.50,53.37,5.77,54.61,10.71,56.20,13.14,60.42,16.17,62.27,19.48,63.38,26.21,62.14,32.17,60.49,37.07,57.27,38.21,53.34,37.51,50.46,42.48,49.55,48.56,49.10,54.18,52.25,59.36,54.52,63.72,55.63,67.41,52.04,71.54,50.53,75.40,47.03,75.15,39.99,78.28,39.79,81.92,41.79,85.27,40.68,89.43,41.44,93.66,41.95,96.04
    .line Feralas,45.47,2.89,45.91,4.75,44.95,7.04,45.03,8.93,45.75,10.64,45.94,12.52,46.43,15.18,46.34,20.94,48.19,23.23
    .goto Desolace,55.50,0.50,60,0
    .goto Desolace,53.37,5.77,60,0
    .goto Desolace,54.61,10.71,60,0
    .goto Desolace,56.20,13.14,60,0
    .goto Desolace,60.42,16.17,60,0
    .goto Desolace,62.27,19.48,60,0
    .goto Desolace,63.38,26.21,60,0
    .goto Desolace,62.14,32.17,60,0
    .goto Desolace,60.49,37.07,60,0
    .goto Desolace,57.27,38.21,60,0
    .goto Desolace,53.34,37.51,60,0
    .goto Desolace,50.46,42.48,60,0
    .goto Desolace,49.55,48.56,60,0
    .goto Desolace,49.10,54.18,60,0
    .goto Desolace,52.25,59.36,60,0
    .goto Desolace,54.52,63.72,60,0
    .goto Desolace,55.63,67.41,60,0
    .goto Desolace,52.04,71.54,60,0
    .goto Desolace,50.53,75.40,60,0
    .goto Desolace,47.03,75.15,60,0
    .goto Desolace,39.99,78.28,60,0
    .goto Desolace,39.79,81.92,60,0
    .goto Desolace,41.79,85.27,60,0
    .goto Desolace,40.68,89.43,60,0
    .goto Desolace,41.44,93.66,60,0
    .goto Desolace,41.95,96.04,60,0
    .goto Feralas,45.47,2.89,60,0
    .goto Feralas,45.91,4.75,60,0
    .goto Feralas,44.95,7.04,60,0
    .goto Feralas,45.03,8.93,60,0
    .goto Feralas,45.75,10.64,60,0
    .goto Feralas,45.94,12.52,60,0
    .goto Feralas,46.43,15.18,60,0
    .goto Feralas,46.34,20.94,60,0
    .goto Feralas,48.19,23.23,60,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r交谈
    >>|cRXP_FRIENDLY_雷克萨|r|cRXP_WARN_在|cFFfa9602凄凉之地|r由北向南巡逻。地图上已标出他的路线，请沿路点箭头走完整条路线。|r
    >>|cRXP_WARN_他到达|cFFfa9602菲拉斯|r的双塔山后会消失；若途中未找到，可在|cFFfa9602石爪山脉与凄凉之地交界处|r等候他重新出现。
    .turnin 6602 >>交任务 黑龙勇士之血
    .unitscan 雷克萨

step << tbc
    .isQuestComplete 6602
    .goto Desolace,25.60,70.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往葬影村，与|cRXP_FRIENDLY_罗卡鲁|r交谈
    >>|cRXP_WARN_在TBC中，罗卡鲁在这里代替雷克萨处理入场任务，不需要寻找巡逻的雷克萨|r
    .turnin 6602 >>交任务 黑龙勇士之血
    .target 罗卡鲁
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 入场任务
#classic
#tbc
#subgroup Attunements
#group RestedXP Endgame Guides
#name Molten Core Attunement
#title 熔火之心入场任务
#guideKind attunement
#guideIcon rxp-icon-mc
#displayname 熔火之心入场任务

step
    .isQuestAvailable 7848
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .isQuestAvailable 7848
    .goto Eastern Kingdoms,48.41,63.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛索斯·天痕|r交谈
    .accept 7848 >>接受任务 熔火之心的传送门
    .target 洛索斯·天痕

step
    .isQuestAvailable 7848
    #completewith next
    .goto Eastern Kingdoms,48.07,62.42
    .subzone 1584,2 >>进入黑石深渊
    >>|cRXP_WARN_确保已组好队伍|r

step
    .isQuestAvailable 7848
    #softcore
    >>进入讲学厅前先向右转，拾取|cRXP_LOOT_熔火碎片|r；它就在|cFFfa9602熔火之心|r副本传送门外的地上。
    >>|cRXP_WARN_最快的路线是进行“跳熔岩”，起点位于|r |cRXP_ENEMY_伊森迪奥斯|r所在的平台
    --.link >> |cRXP_WARN_Click here for video reference|r
    .complete 7848,1 --Core Fragment 1/1
    --VV TODO: Lava skip video

step
    .isQuestAvailable 7848
    #hardcore
    >>进入讲学厅前先向右转，拾取|cRXP_LOOT_熔火碎片|r；它就在|cFFfa9602熔火之心|r副本传送门外的地上。
    .complete 7848,1 --Core Fragment 1/1

step
    .isQuestAvailable 7848
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .goto Eastern Kingdoms,48.41,63.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛索斯·天痕|r交谈
    .turnin 7848 >>交任务 熔火之心的传送门
    .target 洛索斯·天痕
    .isQuestComplete 7848
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 入场任务
#classic
#tbc
#group RestedXP Endgame Guides
#subgroup Attunements
#name Blackwing Lair Attunement
#title 黑翼之巢入场任务
#guideKind attunement
#guideIcon rxp-icon-bwl
#displayname 黑翼之巢入场任务

step
    .isQuestAvailable 7761
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .isQuestAvailable 7761
    #hardcore
    .goto Eastern Kingdoms,48.94,63.92,10,0
    .goto Eastern Kingdoms,49.01,64.12,10,0
    .goto Eastern Kingdoms,49.12,64.09
    .use 18987 >>击杀|cRXP_ENEMY_裂盾军需官|r，拾取|T133473:0|t[|cRXP_LOOT_黑手的命令|r]，使用它接任务
    >>|cRXP_WARN_这是一个强力的55级精英怪。为安全起见，请组队完成|r
    >>|cRXP_WARN_他位于黑石塔副本入口右侧的走廊里|r
    .collect 18987,1,7761 --Blackhand's Command 1/1
    .accept 7761 >>接受任务 黑手的命令
    .unitscan 裂盾军需官

step
    .isQuestAvailable 7761
    #softcore
    .goto Eastern Kingdoms,48.94,63.92,10,0
    .goto Eastern Kingdoms,49.01,64.12,10,0
    .goto Eastern Kingdoms,49.12,64.09
    .use 18987 >>击杀|cRXP_ENEMY_裂盾军需官|r，拾取|T133473:0|t[|cRXP_LOOT_黑手的命令|r]，使用它接任务
    >>|cRXP_WARN_他位于黑石塔副本入口右侧的走廊里|r
    .collect 18987,1,7761 --Blackhand's Command 1/1
    .accept 7761 >>接受任务 黑手的命令
    .unitscan 裂盾军需官

step
    .isQuestAvailable 7761
    #completewith next
    .goto Eastern Kingdoms,48.95,63.89
    .subzone 1583 >>进入黑石塔
    >>|cRXP_WARN_这是一个10人地下城。你或队伍中的其他成员必须持有|r|T133343:0|t[|cRXP_LOOT_晋升印章|r]|cRXP_WARN_才能进入黑石塔上层|r

step
    >>点击黑石塔上层最后一个房间内的|cRXP_PICK_达基萨斯的烙印|r，它位于|cRXP_ENEMY_达基萨斯将军|r身后
    .turnin 7761 >>交任务 黑手的命令
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 钥匙
#classic
#tbc
#group RestedXP Endgame Guides
#subgroup Keys
#name Upper Blackrock Spire Key
#title 黑石塔上层钥匙
#guideKind key
#guideIcon rxp-icon-ring
#displayname 黑石塔上层钥匙

step
    .isQuestNotComplete 4743
    .isQuestAvailable 4743
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .isQuestNotComplete 4743
    .isQuestAvailable 4743
    #completewith next
    .goto Eastern Kingdoms,48.95,63.89
    .subzone 1583 >>进入黑石塔
    >>|cRXP_WARN_确保已组好队伍|r

step
    .isQuestNotComplete 4743
    .isQuestAvailable 4743
    >>击杀黑石塔中的各种怪物，直到拾取一个|T135725:0|t[|cRXP_LOOT_原始晋升印章|r]
    .collect 12219,1,4742 --Unadorned Seal of Ascension

step
    .isQuestNotComplete 4743
    .isQuestAvailable 4743
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_裂盾渗透者|r交谈
    >>|cRXP_WARN_刚进入副本起点的霍德玛尔城时，他就在左侧的平台上|r
    .accept 4742 >>接受任务 晋升印章
    .target 裂盾渗透者
    .target 维埃兰

step
    .isQuestNotComplete 4743
    .isQuestAvailable 4743
    >>击杀|cRXP_ENEMY_欧莫克大王|r，拾取他掉落的|cRXP_LOOT_尖石宝钻|r
    >>击杀|cRXP_ENEMY_指挥官沃恩|r，拾取他掉落的|cRXP_LOOT_燃棘宝钻|r
    >>击杀|cRXP_ENEMY_维姆萨拉克|r，拾取他掉落的|cRXP_LOOT_血斧宝钻|r
    >>|cRXP_WARN_这些|r|cRXP_LOOT_宝钻|r|cRXP_WARN_不保证每次掉落，可能需要打多次黑石塔下层|r << !tbc
    >>|cRXP_WARN_TBC中三名首领各自必定掉落对应的宝钻，但每颗只能由一名队员拾取；请提前安排分配|r << tbc
    .complete 4742,1 --Gemstone of Spirestone 1/1
    .target +欧莫克大王
    .complete 4742,2 --Gemstone of Smolderthorn 1/1
    .target +指挥官沃恩
    .complete 4742,3 --Gemstone of Bloodaxe 1/1
    .target +维姆萨拉克

step
    .isQuestNotComplete 4743
    .isQuestAvailable 4743
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_裂盾渗透者|r交谈
    >>|cRXP_WARN_刚进入副本起点的霍德玛尔城时，他就在左侧的平台上|r
    .turnin 4742 >>交任务 晋升印章
    .accept 4743 >>接受任务 晋升印章
    .target 裂盾渗透者
    .target 维埃兰

step
    .isQuestNotComplete 4743
    .isQuestAvailable 4743
    #completewith ForgedSeal
    .use 12339 >>|cRXP_WARN_打开|r |T132595:0|t[维埃兰的礼物] |cRXP_WARN_，拾取|r |T133276:0|t[|cRXP_LOOT_未铸造的晋升印章|r] |cRXP_WARN_和|r |T134334:0|t[|cRXP_LOOT_龙力宝珠|r]
    .collect 12323,1,4743,1 --Unforged Seal of Ascension
    .collect 12300,1,4743,1 --Orb of Draconic Energy

step
    .isQuestNotComplete 4743
    .isQuestAvailable 4743
    #completewith next
    .zone Dustwallow Marsh >>前往 |cFFfa9602尘泥沼泽|r

step
    .isQuestNotComplete 4743
    .isQuestAvailable 4743
    #softcore
    .goto Dustwallow Marsh,54.37,84.22
    .subzone 2158 >>进入埃博斯塔夫的巢穴
    >>|cRXP_WARN_接下来的部分至少需要3名玩家组队完成|r

step
    .isQuestNotComplete 4743
    .isQuestAvailable 4743
    #hardcore
    .goto Dustwallow Marsh,54.37,84.22
    .subzone 2158 >>进入埃博斯塔夫的巢穴
    >>|cRXP_WARN_接下来的部分至少需要3名玩家组队；为安全起见，队伍中要有坦克和治疗！|r

step
    .isQuestNotComplete 4743
    .isQuestAvailable 4743
    #completewith next
    .cast 16057 >>|cRXP_WARN_将|r |T133276:0|t[|cRXP_LOOT_未铸造的晋升印章|r] |cRXP_WARN_放到地上后，再拉怪攻击|r |cRXP_ENEMY_埃博斯塔夫|r
    .use 12323

step
    .isQuestNotComplete 4743
    .isQuestAvailable 4743
    #label ForgedSeal
    .goto Dustwallow Marsh,56.67,87.64
    .use 12300 >>|cRXP_WARN_攻击|r |cRXP_ENEMY_埃博斯塔夫|r。|cRXP_WARN_当他的生命值低于10%时，使用|r |T134334:0|t[|cRXP_LOOT_龙力宝珠|r] |cRXP_WARN_控制|r |cRXP_ENEMY_埃博斯塔夫|r
    >>|cRXP_WARN_施放|r |T135824:0|t[黑龙之焰] |cRXP_WARN_来锻造|r |T133276:0|t[|cRXP_LOOT_未铸造的晋升印章|r] |cRXP_WARN_（此前放在地上）|r
    >>完成后，拾取地面上的|cRXP_PICK_铸造好的晋升印章|r
    .complete 4743,1 --Forged Seal of Ascension
    .mob 埃博斯塔夫

step
    .isOnQuest 4743
    .isQuestAvailable 4743
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .isOnQuest 4743
    .isQuestAvailable 4743
    #completewith next
    .goto Eastern Kingdoms,48.95,63.89
    .subzone 1583 >>进入黑石塔

step
    .isQuestComplete 4743
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_裂盾渗透者|r交谈
    >>|cRXP_WARN_刚进入副本起点的霍德玛尔城时，他就在左侧的平台上|r
    .turnin 4743 >>交任务 晋升印章
    .target 裂盾渗透者
    .target 维埃兰
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 钥匙
#classic
#tbc
<< Alliance
#group RestedXP Endgame Guides
#subgroup Keys
#name Scholomance Key (A)
#title 通灵学院钥匙（联盟）
#guideKind key
#guideIcon rxp-icon-key-2
#displayname 通灵学院钥匙（联盟）

step
    .isQuestAvailable 5505
    #sticky
    #label ThoriumBars
    >>|cRXP_WARN_前往任意主城的拍卖行购买 2 个|r |T133221:0|t[瑟银锭]
    .collect 12359,2,5801,1 --Thorium Bar x2

step
    .isQuestAvailable 5505
    #completewith next
    .zone Ironforge >> 前往|cFFfa9602铁炉堡|r

step
    .isQuestAvailable 5505
    #loop
    .goto Ironforge,33.4,20.0,0
    .goto Ironforge,33.4,20.0,70,0
    .goto Ironforge,25.6,61.6,70,0
    .goto Ironforge,64.8,77.8,70,0
    .goto Ironforge,70.6,48.0,70,0
    .goto Ironforge,65.0,22.6,70,0
    .goto Ironforge,50.4,10.4,70,0
    .goto Ironforge,32.6,21.0,70,0
    .goto Ironforge,40.8,39.4,70,0
    .goto Ironforge,51.2,56.6,70,0
    .goto Ironforge,55.8,35.2,70,0
    .goto Ironforge,33.0,22.4,70,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_信使考雷·落锤|r 交谈
    >>|cRXP_FRIENDLY_信使考雷·落锤|r |cRXP_WARN_在整个铁炉堡巡逻|r
    >>|cRXP_WARN_此任务也可在|r |cFFfa9602暴风城|r |cRXP_WARN_或|r |cFFfa9602达纳苏斯|r接取
    .acceptmultiple 5091,5090,5066 >> 接任务：战斗的号角：瘟疫之地！
    .unitscan 信使考雷·落锤 --IF
    .unitscan 赫拉德·月行者 --DARN
    .unitscan 公告员古德曼 --SW
    .isQuestAvailable 5092

step
    .isQuestAvailable 5505
    #requires ThoriumBars
    #completewith ClearTheWayPU
    .subzone 3197 >>前往 |cFFfa9602西瘟疫之地|r 的冰风岗

step
    .isQuestAvailable 5505
    #requires ThoriumBars
    #optional
    .isOnQuest 5066
    .goto Western Plaguelands,42.702,84.031
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官阿什拉姆·瓦罗菲斯特|r 交谈
    .turnin 5066 >> 交任务：战斗的号角：瘟疫之地！
    .accept 5092 >> 接任务：扫清道路
    .target 指挥官阿什拉姆·瓦罗菲斯特

step
    .isQuestAvailable 5505
    #requires ThoriumBars
    #optional
    .isQuestTurnedIn 5066
    .goto Western Plaguelands,42.702,84.031
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官阿什拉姆·瓦罗菲斯特|r 交谈
    .accept 5092 >> 接任务：扫清道路
    .target 指挥官阿什拉姆·瓦罗菲斯特

step
    .isQuestAvailable 5505
    #requires ThoriumBars
    #optional
    .isOnQuest 5091
    .goto Western Plaguelands,42.702,84.031
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官阿什拉姆·瓦罗菲斯特|r 交谈
    .turnin 5091 >> 交任务：战斗的号角：瘟疫之地！
    .accept 5092 >> 接任务：扫清道路
    .target 指挥官阿什拉姆·瓦罗菲斯特

step
    .isQuestAvailable 5505
    #requires ThoriumBars
    #optional
    .isQuestTurnedIn 5091
    .goto Western Plaguelands,42.702,84.031
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官阿什拉姆·瓦罗菲斯特|r 交谈
    .accept 5092 >> 接任务：扫清道路
    .target 指挥官阿什拉姆·瓦罗菲斯特

step
    .isQuestAvailable 5505
    #requires ThoriumBars
    .isOnQuest 5090
    .goto Western Plaguelands,42.702,84.031
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官阿什拉姆·瓦罗菲斯特|r 交谈
    .turnin 5090 >> 交任务：战斗的号角：瘟疫之地！
    .accept 5092 >> 接任务：扫清道路
    .target 指挥官阿什拉姆·瓦罗菲斯特

step
    .isQuestAvailable 5505
    #requires ThoriumBars
    #label ClearTheWayPU
    .isQuestTurnedIn 5090
    .goto Western Plaguelands,42.702,84.031
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官阿什拉姆·瓦罗菲斯特|r 交谈
    .accept 5092 >> 接任务：扫清道路
    .target 指挥官阿什拉姆·瓦罗菲斯特

step
    .isQuestAvailable 5505
    #loop
    .goto Western Plaguelands,49.90,76.54,0
    .goto Western Plaguelands,48.70,80.37,60,0
    .goto Western Plaguelands,49.90,76.54,60,0
    .goto Western Plaguelands,50.88,76.14,60,0
    .goto Western Plaguelands,50.05,80.74,60,0
    >>击杀|cRXP_ENEMY_骷髅剥皮者|r和|cRXP_ENEMY_被奴役的食尸鬼|r
    .complete 5092,1 -- Skeletal Flayer slain (10)
    .mob +骷髅剥皮者
    .complete 5092,2 -- Slavering Ghoul slain (10)
    .mob +被奴役的食尸鬼

step
    .isQuestAvailable 5505
    .goto Western Plaguelands,42.702,84.031
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官阿什拉姆·瓦罗菲斯特|r 交谈
    .turnin 5092 >>交任务：扫清道路
    .accept 5097 >> 接任务：标记哨塔
    .target 指挥官阿什拉姆·瓦罗菲斯特

step
    .isQuestAvailable 5505
    .goto Western Plaguelands,46.681,71.135,-1
    .goto Western Plaguelands,46.558,71.156,-1
    .use 12815 >> |cRXP_WARN_使用|r |T135432:0|t[信号火炬] |cRXP_WARN_标记哨塔入口旁的位置；这样可以避免引到塔内的精英|cRXP_ENEMY_骷髅军阀|r。|r
    .complete 5097,4 --Tower Four marked

step
    .isQuestAvailable 5505
    .goto Western Plaguelands,44.217,63.319,-1
    .goto Western Plaguelands,44.247,63.131,-1
    .use 12815 >> |cRXP_WARN_使用|r |T135432:0|t[信号火炬] |cRXP_WARN_标记哨塔入口旁的位置；这样可以避免引到塔内的精英|cRXP_ENEMY_骷髅军阀|r。|r
    .complete 5097,3 --Tower Three marked

step
    .isQuestAvailable 5505
    .goto Western Plaguelands,42.326,66.105,-1
    .goto Western Plaguelands,42.422,66.222,-1
    .use 12815 >> |cRXP_WARN_使用|r |T135432:0|t[信号火炬] |cRXP_WARN_标记哨塔入口旁的位置；这样可以避免引到塔内的精英|cRXP_ENEMY_骷髅军阀|r。|r
    .complete 5097,2 --Tower Two marked

step
    .isQuestAvailable 5505
    .goto Western Plaguelands,40.116,71.561,-1
    .goto Western Plaguelands,40.038,71.713,-1
    .use 12815 >> |cRXP_WARN_使用|r |T135432:0|t[信号火炬] |cRXP_WARN_标记哨塔入口旁的位置；这样可以避免引到塔内的精英|cRXP_ENEMY_骷髅军阀|r。|r
    .complete 5097,1 --Tower One marked

step
    .isQuestAvailable 5505
    .goto Western Plaguelands,42.702,84.031
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官阿什拉姆·瓦罗菲斯特|r 交谈
    .turnin 5097 >> 交任务：标记哨塔
    .accept 5533 >> 接任务：通灵学院
    .target 指挥官阿什拉姆·瓦罗菲斯特

step
    .isQuestAvailable 5505
    #completewith SkeletalFragments
    .isQuestTurnedIn 5097
    .destroy 12815 >> 删除|T135432:0|t[信号火炬]

step
    .isQuestAvailable 5505
    .goto Western Plaguelands,42.665,83.774
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_化学家阿尔比顿|r交谈
    .turnin 5533 >>交任务 通灵学院
    .accept 5537 >>接受任务 骸骨碎片
    .target 化学家阿尔比顿

step
    .isQuestAvailable 5505
    #label SkeletalFragments
    #loop
    .line Western Plaguelands,46.4,70.0,45.6,72.2,42.6,71.4,41.6,73.2,38.8,71.0,38.8,68.2,40.4,66.4,42.6,70.0,43.4,64.4,45.8,65.8,46.4,70.0
    .goto Western Plaguelands,46.40,70.00,60,0
    .goto Western Plaguelands,45.60,72.20,60,0
    .goto Western Plaguelands,42.60,71.40,60,0
    .goto Western Plaguelands,41.60,73.20,60,0
    .goto Western Plaguelands,38.80,71.00,60,0
    .goto Western Plaguelands,38.80,68.20,60,0
    .goto Western Plaguelands,40.40,66.40,60,0
    .goto Western Plaguelands,42.60,70.00,60,0
    .goto Western Plaguelands,43.40,64.40,60,0
    .goto Western Plaguelands,45.80,65.80,60,0
    .goto Western Plaguelands,46.40,70.00,60,0
    >>击杀|cRXP_ENEMY_骷髅刽子手|r和|cRXP_ENEMY_骷髅侍僧|r，拾取它们的|cRXP_LOOT_骸骨碎片|r
    .complete 5537,1 -- Collect Skeletal Fragments (x15)
    .mob 骷髅刽子手
    .mob 骷髅侍僧

step
    .isQuestAvailable 5505
    .goto Western Plaguelands,42.665,83.774
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_化学家阿尔比顿|r交谈
    .turnin 5537 >>交任务 骸骨碎片
    .accept 5538 >>接受任务 昂贵的模具
    .target 化学家阿尔比顿

step
    .isQuestAvailable 5505
    #completewith next
    .subzone 976 >>前往|cFFfa9602塔纳利斯|r的加基森

step
    .isQuestAvailable 5505
    .goto Tanaris,51.46,28.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克林科·古德斯迪尔|r交谈
    >>|cRXP_WARN_交付此任务需要支付15金币|r
    .turnin 5538 >>交任务 昂贵的模具
    .accept 5801 >>接受任务 火羽山
    .target 克林科·古德斯迪尔

step
    .isQuestAvailable 5505
    >>|cRXP_WARN_如果你之前没有购买, 请前往任意主城的拍卖行购买 2 个|r |T133221:0|t[瑟银锭]
    .collect 12359,2,5801,1 --Thorium Bar x2

step
    .zoneskip Tanaris,1
    .isQuestAvailable 5505
    #completewith next
    .goto Tanaris,51.006,29.345
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_博拉·石锤|r 交谈
    .fly Un'Goro >> 飞往安戈洛环形山
    .target 博拉·石锤
    .zoneskip Un'Goro Crater

step
    .isQuestAvailable 5505
    #completewith next
    .goto Un'Goro Crater,49.62,47.56,100 >>前往火羽山山顶

step
    .isQuestAvailable 5505
    .goto Un'Goro Crater,49.28,47.04
    .use 14644 >>|cRXP_WARN_在熔岩池处使用|r |T134457:0|t[骷髅钥匙模具] |cRXP_WARN_，制作|r |cRXP_LOOT_未完工的骷髅钥匙|r
    .complete 5801,1 --Unfinished Skeleton Key (1)

step
    .isQuestAvailable 5505
    #completewith next
    .subzone 3197 >>前往 |cFFfa9602西瘟疫之地|r 的冰风岗

step
    .isQuestAvailable 5505
    .goto Western Plaguelands,42.665,83.774
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_化学家阿尔比顿|r交谈
    .turnin 5801 >>交任务 火羽山
    .accept 5803 >>接受任务 阿拉基的圣甲虫
    .target 化学家阿尔比顿

step
    .isQuestAvailable 5505
    #completewith ArajTheSummoner
    .goto Western Plaguelands,45.60,69.28,100 >>前往安多哈尔废墟中心

step
    .isQuestAvailable 5505
    #softcore
    .goto Western Plaguelands,45.60,69.28
    >>击杀|cRXP_ENEMY_召唤者阿拉基|r，拾取地上的|cRXP_PICK_阿拉基的护命匣|r，获得|cRXP_LOOT_阿拉基的圣甲虫|r
    >>|cRXP_ENEMY_阿拉基|r|cRXP_WARN_是强大的精英，建议至少3人组队击杀|r
    .use 12650 >>|cRXP_WARN_如果有，请对阿拉基使用|r |T134961:0|t[瘟疫中和器]|cRXP_WARN_。|r
    .complete 5803,1 --Araj's Scarab (1x)
    .mob 召唤者阿拉基
    .itemcount 12650,1 --Attuned Dampener

step
    .isQuestAvailable 5505
    #softcore
    #label ArajTheSummoner
    .goto Western Plaguelands,45.60,69.28
    >>击杀|cRXP_ENEMY_召唤者阿拉基|r，拾取地上的|cRXP_PICK_阿拉基的护命匣|r，获得|cRXP_LOOT_阿拉基的圣甲虫|r
    >>|cRXP_ENEMY_阿拉基|r|cRXP_WARN_是强大的精英，建议至少3人组队击杀|r
    .complete 5803,1 --Araj's Scarab (1x)
    .mob 召唤者阿拉基

step
    .isQuestAvailable 5505
    #hardcore
    .goto Western Plaguelands,45.60,69.28
    >>击杀|cRXP_ENEMY_召唤者阿拉基|r，拾取地上的|cRXP_PICK_阿拉基的护命匣|r，获得|cRXP_LOOT_阿拉基的圣甲虫|r
    >>|cRXP_ENEMY_阿拉基|r|cRXP_WARN_是强大的精英，周围还有许多怪物，请小心清理。建议至少4人组队击杀|r
    .use 12650 >>|cRXP_WARN_如果有，请对阿拉基使用|r |T134961:0|t[瘟疫中和器]|cRXP_WARN_。|r
    .complete 5803,1 --Araj's Scarab (1x)
    .mob 召唤者阿拉基
    .itemcount 12650,1 --Attuned Dampener

step
    .isQuestAvailable 5505
    #hardcore
    #label ArajTheSummoner
    .goto Western Plaguelands,45.60,69.28
    >>击杀|cRXP_ENEMY_召唤者阿拉基|r，拾取地上的|cRXP_PICK_阿拉基的护命匣|r，获得|cRXP_LOOT_阿拉基的圣甲虫|r
    >>|cRXP_ENEMY_阿拉基|r|cRXP_WARN_是强大的精英，周围还有许多怪物，请小心清理。建议至少4人组队击杀|r
    .complete 5803,1 --Araj's Scarab (1x)
    .mob 召唤者阿拉基

step
    .isQuestAvailable 5505
    .goto Western Plaguelands,42.665,83.774
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_化学家阿尔比顿|r交谈
    .turnin 5803 >>交任务 阿拉基的圣甲虫
    .target 化学家阿尔比顿

step
    .isQuestAvailable 5505
    .goto Western Plaguelands,42.665,83.774
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_化学家阿尔比顿|r交谈
    .accept 5505 >>接任务：通灵学院的钥匙
    .turnin 5505 >>交任务 通灵学院的钥匙
    .target 化学家阿尔比顿
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 钥匙
#classic
#tbc
<< Horde
#group RestedXP Endgame Guides
#subgroup Keys
#name Scholomance Key (H)
#title 通灵学院钥匙（部落）
#guideKind key
#guideIcon rxp-icon-key-2
#displayname 通灵学院钥匙（部落）

step
    .isQuestAvailable 5511
    #sticky
    #label ThoriumBars
    >>|cRXP_WARN_前往任意主城的拍卖行购买 2 个|r |T133221:0|t[瑟银锭]
    .collect 12359,2,5802,1 --Thorium Bar x2

step
    .isQuestAvailable 5511
    #completewith next
    .zone Undercity >>前往 |cFFfa9602幽暗城|r

step
    .isQuestAvailable 5511
    #loop
    .goto Undercity,67.43,46.15,0
    .goto Undercity,67.43,46.15,50,0
    .goto Undercity,71.23,51.64,50,0
    .goto Undercity,72.99,44.19,50,0
    .goto Undercity,70.91,36.25,50,0
    .goto Undercity,65.84,33.54,50,0
    .goto Undercity,60.90,36.56,50,0
    .goto Undercity,58.89,44.30,50,0
    .goto Undercity,60.98,51.69,50,0
    .goto Undercity,66.07,54.64,50,0
    .goto Undercity,70.81,51.49,50,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_预言者巴萨扎德|r交谈
    .acceptmultiple 5093,5094,5095 >>接受任务战斗的号角：瘟疫之地！
    >>|cRXP_WARN_也可以在|r|cFFfa9602奥格瑞玛|r|cRXP_WARN_或|r|cFFfa9602雷霆崖|r接到此任务
    .unitscan 公告员高拉克 --ORG
    .unitscan 预言者巴萨扎德 --UC
    .unitscan 雷霆崖信使斯塔德尔 --TB
    .isQuestAvailable 5096
    --VV TODO: Patrol paths

step
    .isQuestAvailable 5511
    #requires ThoriumBars
    #completewith ScarletDiversionsPU
    .subzone 152 >> 前往 |cFFfa9602提瑞斯法林地|r 的壁垒

step
    .isQuestAvailable 5511
    #optional
    #requires ThoriumBars
    .goto Tirisfal Glades,83.15,68.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德灵顿|r交谈
    .turnin 5093 >>交任务战斗的号角：瘟疫之地！
    .accept 5096 >>接受任务 误导血色十字军
    .target 高级执行官德灵顿
    .isOnQuest 5093

step
    .isQuestAvailable 5511
    #optional
    #requires ThoriumBars
    .goto Tirisfal Glades,83.15,68.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德灵顿|r交谈
    .accept 5096 >>接受任务 误导血色十字军
    .target 高级执行官德灵顿
    .isQuestTurnedIn 5093

step
    .isQuestAvailable 5511
    #optional
    #requires ThoriumBars
    .goto Tirisfal Glades,83.15,68.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德灵顿|r交谈
    .turnin 5094 >>交任务战斗的号角：瘟疫之地！
    .accept 5096 >>接受任务 误导血色十字军
    .target 高级执行官德灵顿
    .isOnQuest 5094

step
    .isQuestAvailable 5511
    #optional
    #requires ThoriumBars
    .goto Tirisfal Glades,83.15,68.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德灵顿|r交谈
    .accept 5096 >>接受任务 误导血色十字军
    .target 高级执行官德灵顿
    .isQuestTurnedIn 5094

step
    .isQuestAvailable 5511
    #requires ThoriumBars
    .goto Tirisfal Glades,83.15,68.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德灵顿|r交谈
    .turnin 5095 >>交任务战斗的号角：瘟疫之地！
    .accept 5096 >>接受任务 误导血色十字军
    .target 高级执行官德灵顿
    .isOnQuest 5095

step
    .isQuestAvailable 5511
    #label ScarletDiversionsPU
    #requires ThoriumBars
    .goto Tirisfal Glades,83.15,68.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德灵顿|r交谈
    .accept 5096 >>接受任务 误导血色十字军
    .target 高级执行官德灵顿
    .isQuestTurnedIn 5095

step
    .isQuestNotComplete 5096
    .isQuestAvailable 5511
    .goto Western Plaguelands,26.55,56.18
    >>点击火堆旁的|cRXP_PICK_燃烧弹箱|r
    .collect 12814,1,5096,1 --Flame in a Bottle (1)
    .isOnQuest 5096

step
    .isQuestAvailable 5511
    .goto Western Plaguelands,40.5,51.8
    .use 12807 >>点击|cRXP_PICK_指挥帐篷|r，然后使用|T132484:0|t[天灾战旗]
    >>|cRXP_WARN_这些怪物比较难打，而且可能互相连锁引怪，请小心|r
    .complete 5096,1 --Destroy the command tent and plant the Scourge banner in the camp (1)

step
    .isQuestAvailable 5511
    .goto Tirisfal Glades,83.15,68.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德灵顿|r交谈
    .turnin 5096 >>交任务 误导血色十字军
    .accept 5098 >>接受任务 标记哨塔
    .target 高级执行官德灵顿

step
    .isQuestAvailable 5511
    .goto Western Plaguelands,46.681,71.135,-1
    .goto Western Plaguelands,46.558,71.156,-1
    .use 12815 >> |cRXP_WARN_使用|r |T135432:0|t[信号火炬] |cRXP_WARN_标记哨塔入口旁的位置；这样可以避免引到塔内的精英|cRXP_ENEMY_骷髅军阀|r。|r
    .complete 5098,4 --Tower Four marked

step
    .isQuestAvailable 5511
    .goto Western Plaguelands,44.217,63.319,-1
    .goto Western Plaguelands,44.247,63.131,-1
    .use 12815 >> |cRXP_WARN_使用|r |T135432:0|t[信号火炬] |cRXP_WARN_标记哨塔入口旁的位置；这样可以避免引到塔内的精英|cRXP_ENEMY_骷髅军阀|r。|r
    .complete 5098,3 --Tower Three marked

step
    .isQuestAvailable 5511
    .goto Western Plaguelands,42.326,66.105,-1
    .goto Western Plaguelands,42.422,66.222,-1
    .use 12815 >> |cRXP_WARN_使用|r |T135432:0|t[信号火炬] |cRXP_WARN_标记哨塔入口旁的位置；这样可以避免引到塔内的精英|cRXP_ENEMY_骷髅军阀|r。|r
    .complete 5098,2 --Tower Two marked

step
    .isQuestAvailable 5511
    .goto Western Plaguelands,40.116,71.561,-1
    .goto Western Plaguelands,40.038,71.713,-1
    .use 12815 >> |cRXP_WARN_使用|r |T135432:0|t[信号火炬] |cRXP_WARN_标记哨塔入口旁的位置；这样可以避免引到塔内的精英|cRXP_ENEMY_骷髅军阀|r。|r
    .complete 5098,1 --Tower One marked

step
    .isQuestAvailable 5511
    .goto Tirisfal Glades,83.15,68.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德灵顿|r交谈
    .turnin 5098 >>交任务 标记哨塔
    .accept 838 >>接受任务 通灵学院
    .target 高级执行官德灵顿

step
    .isQuestAvailable 5511
    #completewith SkeletalFragments
    .isQuestTurnedIn 5098
    .destroy 12815 >> 删除|T135432:0|t[信号火炬]

step
    .isQuestAvailable 5511
    .goto Tirisfal Glades,83.28,69.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师迪瑟斯|r交谈
    .turnin 838 >>交任务 通灵学院
    .accept 964 >>接受任务 骸骨碎片
    .target 药剂师迪瑟斯

step
    .isQuestAvailable 5511
    #label SkeletalFragments
    #loop
    .line Western Plaguelands,46.4,70.0,45.6,72.2,42.6,71.4,41.6,73.2,38.8,71.0,38.8,68.2,40.4,66.4,42.6,70.0,43.4,64.4,45.8,65.8,46.4,70.0
    .goto Western Plaguelands,46.40,70.00,60,0
    .goto Western Plaguelands,45.60,72.20,60,0
    .goto Western Plaguelands,42.60,71.40,60,0
    .goto Western Plaguelands,41.60,73.20,60,0
    .goto Western Plaguelands,38.80,71.00,60,0
    .goto Western Plaguelands,38.80,68.20,60,0
    .goto Western Plaguelands,40.40,66.40,60,0
    .goto Western Plaguelands,42.60,70.00,60,0
    .goto Western Plaguelands,43.40,64.40,60,0
    .goto Western Plaguelands,45.80,65.80,60,0
    .goto Western Plaguelands,46.40,70.00,60,0
    >>击杀|cRXP_ENEMY_骷髅刽子手|r和|cRXP_ENEMY_骷髅侍僧|r，拾取|cRXP_LOOT_骸骨碎片|r
    .complete 964,1 -- Collect Skeletal Fragments (x15)
    .mob 骷髅刽子手
    .mob 骷髅侍僧

step
    .isQuestAvailable 5511
    .goto Tirisfal Glades,83.28,69.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师迪瑟斯|r交谈
    .turnin 964 >>交任务 骸骨碎片
    .accept 5514 >>接受任务 昂贵的模具
    .target 药剂师迪瑟斯

step
    .isQuestAvailable 5511
    #completewith next
    .subzone 976 >>前往|cFFfa9602塔纳利斯|r的加基森

step
    .isQuestAvailable 5511
    .goto Tanaris,51.46,28.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克林科·古德斯迪尔|r交谈
    >>|cRXP_WARN_交此任务需要支付15金币|r
    .turnin 5514 >>交任务 昂贵的模具
    .accept 5802 >>接受任务 火羽山
    .target 克林科·古德斯迪尔

step
    .isQuestAvailable 5511
    >>|cRXP_WARN_如果你之前没有购买, 请前往任意主城的拍卖行购买 2 个|r |T133221:0|t[瑟银锭]
    .collect 12359,2,5802,1 --Thorium Bar x2

step
    .zoneskip Tanaris,1
    .isQuestAvailable 5511
    #completewith next
    .goto Tanaris,51.60,25.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布科雷克·怒拳|r交谈
    .fly Un'Goro >>飞往安戈洛环形山
    .target 布科雷克·怒拳
    .zoneskip Un'Goro Crater

step
    .isQuestAvailable 5511
    #completewith next
    .goto Un'Goro Crater,49.62,47.56,100 >>前往火羽山山顶

step
    .isQuestAvailable 5511
    .goto Un'Goro Crater,49.28,47.04
    .use 14644 >>|cRXP_WARN_使用|r|T134457:0|t[骷髅钥匙模具]，|cRXP_WARN_在熔岩池边制作|r|cRXP_LOOT_未完工的骷髅钥匙|r
    .complete 5802,1 --Unfinished Skeleton Key (1)

step
    .isQuestAvailable 5511
    #completewith next
    .subzone 152 >> 前往 |cFFfa9602提瑞斯法林地|r 的壁垒

step
    .isQuestAvailable 5511
    .goto Tirisfal Glades,83.28,69.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师迪瑟斯|r交谈
    .turnin 5802 >>交任务 火羽山
    .accept 5804 >>接受任务 阿拉基的圣甲虫
    .target 药剂师迪瑟斯

step
    .isQuestAvailable 5511
    #completewith ArajTheSummoner
    .goto Western Plaguelands,45.60,69.28,100 >>前往安多哈尔废墟中心

step
    .isQuestAvailable 5511
    #softcore
    .goto Western Plaguelands,45.60,69.28
    >>击杀|cRXP_ENEMY_召唤者阿拉基|r，拾取地上的|cRXP_PICK_阿拉基的护命匣|r，获得|cRXP_LOOT_阿拉基的圣甲虫|r
    >>|cRXP_ENEMY_阿拉基|r|cRXP_WARN_是个强力精英，建议至少3人组队击杀|r
    .use 12650 >>|cRXP_WARN_如果有，请对阿拉基使用|r |T134961:0|t[瘟疫中和器]|cRXP_WARN_。|r
    .complete 5804,1 --Araj's Scarab (1x)
    .mob 召唤者阿拉基
    .itemcount 12650,1 --Attuned Dampener

step
    .isQuestAvailable 5511
    #softcore
    #label ArajTheSummoner
    .goto Western Plaguelands,45.60,69.28
    >>击杀|cRXP_ENEMY_召唤者阿拉基|r，拾取地上的|cRXP_PICK_阿拉基的护命匣|r，获得|cRXP_LOOT_阿拉基的圣甲虫|r
    >>|cRXP_ENEMY_阿拉基|r|cRXP_WARN_是个强力精英，建议至少3人组队击杀|r
    .complete 5804,1 --Araj's Scarab (1x)
    .mob 召唤者阿拉基

step
    .isQuestAvailable 5511
    #hardcore
    .goto Western Plaguelands,45.60,69.28
    >>击杀|cRXP_ENEMY_召唤者阿拉基|r，拾取地上的|cRXP_PICK_阿拉基的护命匣|r，获得|cRXP_LOOT_阿拉基的圣甲虫|r
    >>|cRXP_ENEMY_阿拉基|r|cRXP_WARN_是个强力精英，周围还有很多怪物，请小心清理。建议至少4人组队击杀|r
    .use 12650 >>|cRXP_WARN_如果有，请对阿拉基使用|r |T134961:0|t[瘟疫中和器]|cRXP_WARN_。|r
    .complete 5804,1 --Araj's Scarab (1x)
    .mob 召唤者阿拉基
    .itemcount 12650,1 --Attuned Dampener

step
    .isQuestAvailable 5511
    #hardcore
    #label ArajTheSummoner
    .goto Western Plaguelands,45.60,69.28
    >>击杀|cRXP_ENEMY_召唤者阿拉基|r，拾取地上的|cRXP_PICK_阿拉基的护命匣|r，获得|cRXP_LOOT_阿拉基的圣甲虫|r
    >>|cRXP_ENEMY_阿拉基|r|cRXP_WARN_是个强力精英，周围还有很多怪物，请小心清理。建议至少4人组队击杀|r
    .complete 5804,1 --Araj's Scarab (1x)
    .mob 召唤者阿拉基

step
    .isQuestAvailable 5511
    .goto Tirisfal Glades,83.28,69.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师迪瑟斯|r交谈
    .turnin 5804 >>交任务 阿拉基的圣甲虫
    .target 药剂师迪瑟斯

step
    .isQuestAvailable 5511
    .goto Tirisfal Glades,83.15,68.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级执行官德灵顿|r交谈
    .accept 5511 >>接任务：通灵学院的钥匙
    .turnin 5511 >>交任务 通灵学院的钥匙
    .target 高级执行官德灵顿
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 钥匙
#classic
#tbc
#group RestedXP Endgame Guides
#subgroup Keys
#name Blackrock Depths Key
#title 黑石深渊钥匙
#guideKind key
#guideIcon rxp-icon-key-3
#displayname 黑石深渊钥匙

step
    #optional
    #hardcore
    #softcoreserver
    .isQuestAvailable 3802
    +普通服务器上的这条钥匙任务需要灵魂状态。如果按硬核规则游玩，请跳过这条钥匙路线，由持有钥匙的队友开门

step
    .isQuestAvailable 3802
    #completewith next
    .subzone 254 >>前往 |cFFfa9602黑石山|r

step
    .isQuestAvailable 3802
    #softcoreserver
    #softcore
    .goto 1415,48.624,64.186
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗兰克罗恩·铸铁|r交谈
    >>|cRXP_WARN_你必须处于|r |T132331:0|t[灵魂状态] |cRXP_WARN_才能与|r |cRXP_FRIENDLY_弗兰克罗恩·铸铁|r 对话
    >>|cRXP_WARN_主动在黑石山熔岩中死亡，最好在熔火之心入口附近|r
    .accept 3801 >> 接任务：黑铁的遗产
    .turnin 3801 >> 交任务：黑铁的遗产
    .accept 3802 >> 接任务：黑铁的遗产
    .target 弗兰克罗恩·铸铁

step
    .isQuestAvailable 3802
    #hardcoreserver
    #completewith next
    .goto 1415,48.656,64.134
    .cast 417803 >>|cRXP_WARN_点击|r|cRXP_PICK_烬视火盆|r|cRXP_WARN_，获得|r|T136215:0|t[烬辉视界]|cRXP_WARN_减益|r

step
    .isQuestAvailable 3802
    #hardcoreserver
    .goto 1415,48.624,64.186
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗兰克罗恩·铸铁|r交谈
    >>|cRXP_WARN_你必须拥有|r |T136215:0|t[烬辉视界] |cRXP_WARN_减益效果才能看到他|r
    .accept 3801 >> 接任务：黑铁的遗产
    .turnin 3801 >> 交任务：黑铁的遗产
    .accept 3802 >> 接任务：黑铁的遗产
    .target 弗兰克罗恩·铸铁

step
    .isQuestAvailable 3802
    #softcore
    #completewith next
    .goto Eastern Kingdoms,48.07,62.42
    .subzone 1584,2 >>在尸体旁复活并进入黑石深渊
    >>|cRXP_WARN_确保队伍已准备就绪|r

step
    .isQuestAvailable 3802
    #hardcoreserver
    #completewith next
    .goto Eastern Kingdoms,48.07,62.42
    .subzone 1584,2 >>进入黑石深渊
    >>|cRXP_WARN_确保队伍已准备就绪|r

step
    .isQuestAvailable 3802
    >>击杀|cRXP_ENEMY_弗诺斯·达克维尔|r，拾取|cRXP_LOOT_铁胆之锤|r
    >>|cRXP_WARN_他在伊森迪奥斯房间外的采石场巡逻|r
    .complete 3802,1 -- Ironfel (1)
    .target 弗诺斯·达克维尔
    .isOnQuest 3802

step
    >>跑回秩序竞技场上方附近
    >>点击 |cRXP_PICK_弗兰克罗恩·铸铁的雕像|r
    .turnin 3802 >> 交任务：黑铁的遗产
    .isQuestComplete 3802
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 钥匙
#classic
#tbc
#group RestedXP Endgame Guides
#subgroup Keys
#name Dire Maul Key
#title 厄运之槌钥匙
#guideKind key
#displayname 厄运之槌钥匙

step
    .itemcount 18249,<1
    #completewith next
    .zone Feralas >>前往 |cFFfa9602菲拉斯|r
    .subzoneskip 2557

step
    .itemcount 18249,<1
    #completewith next
    .goto Kalimdor,43.84,67.41,20 >>从厄运之槌东侧入口进入
    >>|cRXP_WARN_确保已组好队伍|r

step
    .itemcount 18249,<1
    #completewith next
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普希林|r交谈
    >>|cRXP_WARN_他是副本起点的一只绿色|cRXP_FRIENDLY_小鬼|r，交谈后会逃跑。你必须多次追上他并交谈，直到他在隐秘小室中变为敌对|r
    .skipgossip
    .unitscan 普希林

step
    >>|cRXP_ENEMY_普希林|r变为敌对后，击杀他并拾取|T134244:0|t[|cRXP_LOOT_月牙钥匙|r]
    .collect 18249,1 --Crescent Key
    .unitscan 普希林
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 入场任务
#classic
#tbc
#group RestedXP Endgame Guides
#name Naxxramas Attunement
#title 纳克萨玛斯入场任务
#guideKind attunement
#subgroup Attunements
#displayname 纳克萨玛斯入场任务

step
    .isQuestAvailable 9122
    .isQuestAvailable 9123
    >>|cRXP_BUY_收集以下物品|r：
    >>五个|T134135:0|t[|cRXP_FRIENDLY_奥术水晶|r]
    >>两个 |T132880:0|t[|cRXP_PICK_连结水晶|r]
    >>一个 |T134122:0|t[|cRXP_FRIENDLY_正义宝珠|r]
    >>|cRXP_WARN_如果可以，请从拍卖行购买|r
    >>|cRXP_WARN_提交纳克萨玛斯入场任务时需要这些材料。银色黎明声望越高，所需材料和金币就越少！|r
    .collect 12363,5 --Arcane Crystal (x5)
    .collect 20725,2 --Nexus Crystal (x2)
    .collect 12811,1 --Righteous Orb (x1)
    .reputation 529,revered,0,1 --Below Revered AD
    .isQuestAvailable 9121 --The Dread Citadel - Naxxramas

step
    .isQuestAvailable 9121
    .isQuestAvailable 9123
    >>|cRXP_BUY_收集以下物品|r：
    >>两个 |T134135:0|t[|cRXP_FRIENDLY_奥术水晶|r]
    >>一个 |T132880:0|t[|cRXP_PICK_连结水晶|r]
    >>|cRXP_WARN_如果可以，请从拍卖行购买|r
    >>|cRXP_WARN_提交纳克萨玛斯入场任务时需要这些材料。银色黎明声望越高，所需材料和金币就越少！|r
    .collect 12363,2 --Arcane Crystal (x2)
    .collect 20725,1 --Nexus Crystal (x1)
    .reputation 529,exalted,0,1 --Below Exalted AD
    .reputation 529,revered,<0,1 --Revered AD
    .isQuestAvailable 9122 --The Dread Citadel - Naxxramas

step
    .isQuestAvailable 9121
    .isQuestAvailable 9122
    .isQuestAvailable 9123
    #completewith AttuneComplete
    .zone Eastern Plaguelands >>前往 |cFFfa9602东瘟疫之地|r

step
    .isQuestAvailable 9121
    .isQuestAvailable 9122
    .isQuestAvailable 9123
    #optional
    .reputation 529,honored >>将银色黎明声望提升至尊敬
    >>|cRXP_WARN_在东瘟疫之地或西瘟疫之地刷|cRXP_ENEMY_亡灵怪|r，或下副本时，装备|r |T133440:0|t[银色黎明委任徽章] |cRXP_WARN_来收集并上交|r |T133447:0|t[天灾石]

step
    .isQuestAvailable 9122
    .isQuestAvailable 9123
    .goto Eastern Plaguelands,81.523,58.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师安吉拉·杜萨图斯|r交谈
    >>|cRXP_WARN_声望必须达到尊敬才能接取此任务|r
    >>|cRXP_WARN_交任务时还需支付|r |cRXP_WARN_60 金币|r |cRXP_WARN_才能完成任务|r
    .accept 9121 >>接受任务 恐怖之城，纳克萨玛斯
    .turnin 9121 >>交任务 恐怖之城，纳克萨玛斯
    .target 大法师安吉拉·杜萨图斯
    .reputation 529,revered,0,1 --Below Revered AD
    .isQuestAvailable 9121 --The Dread Citadel - Naxxramas

step
    .isQuestAvailable 9121
    .isQuestAvailable 9123
    .goto Eastern Plaguelands,81.523,58.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师安吉拉·杜萨图斯|r交谈
    >>|cRXP_WARN_声望必须达到崇敬才能接取此任务|r
    >>|cRXP_WARN_交任务时还需支付|r |cRXP_WARN_30 金币|r |cRXP_WARN_才能完成任务|r
    .accept 9122 >>接受任务 恐怖之城，纳克萨玛斯
    .turnin 9122 >>交任务 恐怖之城，纳克萨玛斯
    .target 大法师安吉拉·杜萨图斯
    .reputation 529,exalted,0,1 --Below Exalted AD
    .reputation 529,revered,<0,1 --Revered AD
    .isQuestAvailable 9122 --The Dread Citadel - Naxxramas

step
    .isQuestAvailable 9121
    .isQuestAvailable 9122
    #label AttuneComplete
    .goto Eastern Plaguelands,81.523,58.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师安吉拉·杜萨图斯|r交谈
    >>|cRXP_WARN_声望必须达到崇拜才能接取此任务|r
    .accept 9123 >>接受任务 恐怖之城，纳克萨玛斯
    .turnin 9123 >>交任务 恐怖之城，纳克萨玛斯
    .target 大法师安吉拉·杜萨图斯
    .reputation 529,exalted,<0,1 --Exalted AD
    .isQuestAvailable 9123 --The Dread Citadel - Naxxramas
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 入场任务
#classic
#tbc
#group RestedXP Endgame Guides
#name Demon Fall Canyon Attunement
#title 屠魔峡谷入场任务
#guideKind attunement
#subgroup Attunements
<<sod
#displayname 屠魔峡谷入场任务

step
    .isQuestNotComplete 84384
    .isQuestAvailable 84384
    #completewith next
    .subzone 2479 >>前往 |cFFfa9602费伍德森林|r 的翡翠圣地
    .itemcount 228172,<1 --Only shows if you don't have the trinket

step
    .isQuestNotComplete 84384
    .isQuestAvailable 84384
    .goto Felwood,51.4,82.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_影齿大使|r 交谈
    .accept 84384 >> 接任务：恶魔骗术
    .target 影齿大使
    .itemcount 228172,<1 --Only shows if you don't have the trinket

step
    .isQuestNotComplete 84384
    .isQuestAvailable 84384
    #completewith next
    .zone Winterspring >> 前往|cFFfa9602冬泉谷|r
    .itemcount 228172,<1 --Only shows if you don't have the trinket

step
    .isQuestNotComplete 84384
    .isQuestAvailable 84384
    .line Winterspring,64.0,22.6,65.6,23.2,67.6,22.6,65.6,19.6,63.6,16.2,65.6,19.6,64.0,20.8,64.0,22.6
    .goto Winterspring,64.00,22.60,25,0
    .goto Winterspring,65.60,23.20,25,0
    .goto Winterspring,67.60,22.60,25,0
    .goto Winterspring,65.60,19.60,25,0
    .goto Winterspring,63.60,16.20,25,0
    .goto Winterspring,65.60,19.60,25,0
    .goto Winterspring,64.00,20.80,25,0
    .goto Winterspring,64.00,22.60,25,0
    >>击杀|cRXP_ENEMY_狂暴枭兽|r，拾取它们掉落的|T237413:0|t[|cRXP_LOOT_枭兽的松果腺|r]
    .complete 84384,1
    .mob 狂暴枭兽
    .itemcount 228172,<1 --Only shows if you don't have the trinket

step
    .isQuestAvailable 84384
    #completewith next
    .subzone 2479 >>前往 |cFFfa9602费伍德森林|r 的翡翠圣地
    .itemcount 228172,<1 --Only shows if you don't have the trinket

step
    .isQuestAvailable 84384
    .goto Felwood,51.4,82.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_影齿大使|r 交谈
    .turnin 84384 >> 交任务：恶魔骗术
    .target 影齿大使
    .itemcount 228172,<1 --Only shows if you don't have the trinket

step
    .itemcount 228172,1
    +将|TInterface/Icons/Spell_Totem_WardOfDraining:0|t[影齿幻象结界]装备到任意饰品栏。进入屠魔峡谷时需要佩戴它
    .equip 13,228172
    .equip 14,228172
]])
