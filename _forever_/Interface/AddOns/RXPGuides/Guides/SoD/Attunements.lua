RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 入场任务
#classic
#season 2
#group RestedXP Endgame Guides
#subgroup Attunements
#name Karazhan Crypts Attunement
#guideKind attunement
#displayname 卡拉赞墓穴入场任务

step
    #completewith next
    .subzone 2268 >> 前往 |cRXP_LOOT_圣光之愿礼拜堂|r，位于 |cRXP_PICK_东瘟疫之地|r

step
    .goto Eastern Plaguelands,81.3,58.75
    >>点击教堂入口右侧标有 |cRXP_FRIENDLY_寻找经验丰富的冒险者|r 的广告牌
    .accept 86964 >> 接任务: 为了财富与荣耀！

step
    .goto Deadwind Pass,43.08,34.22 << Alliance
    .goto Deadwind Pass,51.01,42.19 << Horde
    .zone Deadwind Pass >> 前往 |cRXP_PICK_逆风小径|r
    .isOnQuest 86964

step
    .goto Deadwind Pass,47.36,75.60,100 >> 向南前往 |cRXP_LOOT_卡拉赞|r
    .isOnQuest 86964

step
    .goto Deadwind Pass,39,74
    >>寻找 |cRXP_FRIENDLY_身亡的冒险者|r 的尸体
    .turnin 86964 >> 交任务: 为了财富与荣耀！
    .accept 86965 >> 接受任务：非同寻常的暗影
    .target 身亡的冒险者

step
    .goto Deadwind Pass,51.28,39.91,20,0
    .goto Deadwind Pass,52.09,34.10
    >>向北前往达拉然特工营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_密探金娜|r 交谈
    .turnin 86965 >> 交任务：非同寻常的暗影
    .accept 86966 >> 接受任务：寻找幸存者

step
    .goto Deadwind Pass,59.2,73.4,30 >> 向南前往食人魔洞穴入口
    .isOnQuest 86966

step
    .goto Deadwind Pass,65.0,78.0
    >>进入洞穴, 寻找被关在笼中的 |cRXP_FRIENDLY_受伤的冒险者|r
    .turnin 86966 >> 交任务: 寻找幸存者
    .accept 86967 >> 接受任务：实施营救
    .target 受伤的冒险者

step
    .goto Deadwind Pass,65.0,78.0
    >>击杀任意 |cRXP_ENEMY_食人魔|r 并拾取战利品，直到找到 |cRXP_LOOT_逆风囚笼“钥匙”|r；用钥匙打开笼子完成任务
    >>|cRXP_WARN_附近其他玩家完成此目标时，即使你没有与其组队，也能获得任务进度|r
    .complete 86967,1
    .collect 235785,1 --Deadwind Cage "Key"
    .disablecheckbox
    .mob 逆风术士
    .mob 逆风虐待者
    .mob 逆风食人魔法师
    .mob 逆风蛮兵

step
    .goto Deadwind Pass,51.28,39.91,20,0
    .goto Deadwind Pass,52.32,34.09
    >>返回北方达拉然特工营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈里森·琼斯|r 交谈
    .turnin 86967 >> 交任务：实施营救
    .accept 86968 >> 接受任务：你怕黑吗？
    .target 哈里森·琼斯

step
    .goto Deadwind Pass,52.09,34.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_密探金娜|r 交谈
    .turnin 86968 >> 交任务：你怕黑吗？
    .accept 86969 >> 接任务: 魔法假说
    .target 密探金娜

step
    #optional
    #completewith Hypothesis
    #label Wetlands
    .zone Wetlands >> 前往 |cRXP_PICK_湿地|r 寻找 |T132839:0|t[生命之火]
    .isOnQuest 86969

step
    #optional
    #completewith Hypothesis
    #requires Wetlands
    #label GrimBatol
    .goto 1437/0,-3451.700,-3450.800,40 >> 前往 |cRXP_LOOT_格瑞姆巴托|r 路径起点
    .isOnQuest 86969

step
    #optional
    #completewith Hypothesis
    #requires GrimBatol
    .goto Wetlands,52.55,41.62,0
    .goto Wetlands,88.07,60.72,0
    .goto Wetlands,85.72,69.33,0
    .goto Wetlands,87.04,51.45
    >>击杀该区域的任意 |cRXP_ENEMY_龙人|r，直到拾取 |T132839:0|t[|cRXP_LOOT_生命之火|r]
    .collect 235789,1 --Flame of Life
    .mob 红色刃鳞龙人
    .mob 刃鳞龙人副官
    .mob 烈焰龙族
    .mob 红色龙人
    .mob 刃鳞皇家卫士
    .isOnQuest 86969

step
    #optional
    #completewith Hypothesis
    #label EnterDungeon
    .subzoneskip 2557 --Dire Maul
    .subzoneskip 15475 --Demon Fall Canyon
    .goto Kalimdor,42.98,67.51,0 --Dire Maul Entrance
    .goto Ashenvale,84.5,75.0,0 --Demon Fall Canyon Entrance
    +寻找 |cRXP_LOOT_厄运之槌西区|r 或 |cRXP_LOOT_屠魔峡谷|r 的队伍，然后进入副本
    >>|cRXP_WARN_进入屠魔峡谷前须完成入场任务。如果尚未完成，可选择厄运之槌西区。|r
    .isOnQuest 86969

step
    #optional
    #completewith Hypothesis
    #requires EnterDungeon
    >>击杀副本的第一个首领 |cRXP_ENEMY_特迪斯·扭木|r，拾取其掉落的 |T135139:0|t[远古铁木枝条]
    .complete 86969,2
    .subzoneskip 2557,1 --Only shows in Dire Maul
    .isOnQuest 86969

step
    #optional
    #completewith Hypothesis
    #requires EnterDungeon
    >>击杀副本的第一个首领 |cRXP_ENEMY_晦根|r，拾取其掉落的 |T135139:0|t[远古铁木枝条]
    .complete 86969,2
    .subzoneskip 15475,1 --Only shows in Demon Fall Canyon
    .isOnQuest 86969

step
    #optional
    #completewith Hypothesis
    #label Winterspring
    .zone Winterspring >> 前往 |cRXP_PICK_冬泉谷|r 寻找 |T136116:0|t[热切的小精灵]
    .isOnQuest 86969
    .itemcount 235788,<1

step
    #optional
    #completewith Hypothesis
    #requires Winterspring
    #label Darkwhisper
    .goto Winterspring,60.39,73.95,50 >> 前往 |cRXP_LOOT_暗语峡谷|r
    .isOnQuest 86969
    .itemcount 235788,<1

step
    #optional
    #completewith Hypothesis
    #requires Darkwhisper
    .goto Winterspring,59.78,75.92,20,0
    .goto Winterspring,60.18,78.08,20,0
    .goto Winterspring,60.74,79.11,20,0
    .goto Winterspring,61.16,80.19,20,0
    .goto Winterspring,61.21,82.13,20,0
    .goto Winterspring,59.09,83.57,20,0
    .goto Winterspring,58.93,85.67,20,0
    .goto Winterspring,56.06,84.80,20,0
    .goto Winterspring,55.13,84.21,20,0
    .goto Winterspring,53.88,84.77,20,0
    .goto Winterspring,53.08,86.33,20,0
    .goto Winterspring,52.68,88.38,20,0
    .goto Winterspring,52.2,90.4
    .target 热切的小精灵
    >>向南寻找 |cRXP_FRIENDLY_热切的小精灵|r，与其互动即可拾取
    >>|cRXP_WARN_避免与该区域的精英恶魔战斗，直接从它们身边跑过即可|r
    .complete 86969,3 --Enthusiastic Wisp
    .isOnQuest 86969
    .itemcount 235788,<1

step
    #label Hypothesis
    >>收集 |T132839:0|t[生命之火]。它由 |cRXP_ENEMY_精英龙人|r 掉落，出没于 |cRXP_LOOT_格瑞姆巴托|r 附近（|cRXP_PICK_湿地|r）
    >>收集 |T135139:0|t[远古铁木枝条]。它由 |cRXP_ENEMY_晦根|r 掉落，位于 |cRXP_LOOT_屠魔峡谷|r|cRXP_WARN_（副本）|r；或由 |cRXP_ENEMY_特迪斯·扭木|r 掉落，位于 |cRXP_LOOT_厄运之槌西区|r|cRXP_WARN_（副本）|r
    >>收集 |T136116:0|t[热切的小精灵]。它是可互动的 |cRXP_FRIENDLY_友方 NPC|r，位于 |cRXP_LOOT_暗语峡谷|r（|cRXP_PICK_冬泉谷|r）
    >>|cRXP_WARN_这些物品可以按任意顺序收集|r
    .complete 86969,1 --Flame of Life
    .complete 86969,2 --Ancient Ironwood Branch
    .complete 86969,3 --Enthusiastic Wisp
    .mob 晦根
    .mob 特迪斯·扭木
    .isOnQuest 86969

step
    .goto Deadwind Pass,43.08,34.22 << Alliance
    .goto Deadwind Pass,51.01,42.19 << Horde
    .zone Deadwind Pass >> 返回 |cRXP_PICK_逆风小径|r
    .isQuestComplete 86969

step
    .goto Deadwind Pass,51.28,39.91,20,0
    .goto Deadwind Pass,52.09,34.10
    >>前往达拉然特工营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_密探金娜|r 交谈
    .turnin 86969 >> 交任务: 魔法假说
    .accept 86970 >> 接受任务：验证假说

step
    .goto Deadwind Pass,45.10,77.96,20,0
    .goto Deadwind Pass,42.20,77.41,20,0
    .goto Deadwind Pass,39.98,75.36,20,0
    .goto Deadwind Pass,39.93,74.24
    >>前往卡拉赞以西的摩根墓地。|cRXP_WARN_走进那里的巨大暗影球|r
    >>进入后使用 |T135432:0|t[|cRXP_FRIENDLY_魔化火印|r]，等待剧情结束
    .complete 86970,1
    .use 235790 --Enchanted Firebrand

step
    .goto Deadwind Pass,45.10,77.96,20,0
    .goto Deadwind Pass,55.40,78.75,20,0
    .goto Deadwind Pass,51.28,39.91,20,0
    .goto Deadwind Pass,52.09,34.10
    >>返回北方达拉然特工营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_密探金娜|r 交谈
    .turnin 86970 >> 交任务：验证假说
    .target 密探金娜

step
    >>|cRXP_WARN_恭喜，你已完成卡拉赞墓穴的入场任务！|r
    >>你可以 |Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈里森·琼斯|r 对话，接取一个可以在副本内完成的任务
    .accept 86971 >> 接任务: 珍奇卡拉赞珍玩！
    .target 哈里森·琼斯
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 满级指南
#subgroupdisplayname 入场任务
#classic
#season 2
#group RestedXP Endgame Guides
#subgroup Attunements
#name Scarlet Enclave Introduction
#guideKind attunement
#displayname 血色领地引导任务

step
    #completewith next
    .subzone 2268 >> 前往 |cRXP_LOOT_圣光之愿礼拜堂|r（位于 |cRXP_PICK_东瘟疫之地|r）

step
    .goto Eastern Plaguelands,81.73,57.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与礼拜堂内的 |cRXP_FRIENDLY_莱尼德·巴萨罗梅|r 交谈
    .accept 87459 >> 接任务：血色活动
    .target 莱尼德·巴萨罗梅

step
    #optional
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杰希卡·查伯斯|r 交谈
    .home >> 如果愿意，|cRXP_WARN_可以将炉石绑定在这里|r，以便更快地从提瑞斯法林地返回
    .target 杰希卡·查伯斯

step << Alliance
    .goto Eastern Plaguelands,81.64,59.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的 |cRXP_FRIENDLY_凯琳·斯蒂文|r 交谈
    .fly Chillwind >> 飞往西瘟疫之地
    .target 凯琳·斯蒂文
    .isOnQuest 87459

step << Horde
    .goto Eastern Plaguelands,80.23,57.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的 |cRXP_FRIENDLY_乔吉亚|r 交谈
    .target 乔吉亚
    .fly Undercity >> 飞往幽暗城
    .isOnQuest 87459

step << Horde
    .goto Tirisfal Glades,61.85,66.59,60 >> 离开幽暗城
    .isOnQuest 87459

step << Alliance
    #completewith next
    .goto Tirisfal Glades,84.85,70.57
    .zone Tirisfal Glades >> 前往提瑞斯法林地
    .isOnQuest 87459

step
    .goto Tirisfal Glades,81.76,58.06
    >>向北前往血色营地 << Alliance
    >>向东前往血色营地 << Horde
    >>点击小帐篷外的 |cRXP_PICK_铁球与锁链|r，它会召唤一名攻击你的 |cRXP_WARN_精英|r |cRXP_ENEMY_血色渗透者|r
    >>击杀他并 |cRXP_LOOT_拾取|r 他身上的 |T133471:0|t[指挥官的军令]
    .complete 87459,1 --Orders from the Commander
    .mob 血色渗透者
    .isOnQuest 87459

step
    #completewith next
    .subzone 2268 >> 返回 |cRXP_LOOT_圣光之愿礼拜堂|r（位于 |cRXP_PICK_东瘟疫之地|r）
    .isOnQuest 87459

step
    .goto Eastern Plaguelands,81.73,57.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与礼拜堂内的 |cRXP_FRIENDLY_莱尼德·巴萨罗梅|r 交谈
    .turnin 87459 >> 交任务：血色活动
    .accept 87493 >> 接任务：提尔之手的骚乱
    .target 莱尼德·巴萨罗梅

step
    .goto Eastern Plaguelands,67.8,83.2
    >>向南前往血色十字军营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官碧阿崔克丝|r 交谈
    .turnin 87493 >> 交任务：提尔之手的骚乱
    .accept 87497 >> 接任务：分裂
    .target 指挥官碧阿崔克丝

step
    .goto Eastern Plaguelands,67.8,83.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官碧阿崔克丝|r 交谈，并完成全部对话选项
    .complete 87497,1
    .skipgossip
    .target 指挥官碧阿崔克丝

step
    .goto Eastern Plaguelands,81.73,57.84
    >>返回圣光之愿礼拜堂
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_莱尼德·巴萨罗梅|r 交谈
    .turnin 87497 >> 交任务：分裂
    .accept 87498 >> 接任务：血色光复军
    .target 莱尼德·巴萨罗梅

step
    .goto Eastern Plaguelands,67.8,83.2
    >>返回血色十字军营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官碧阿崔克丝|r 交谈
    .turnin 87498 >> 交任务：血色光复军
    .target 指挥官碧阿崔克丝

step
    .goto Eastern Plaguelands,68.25,82.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_血色审判官凯尔多兰|r 交谈
    .accept 87502 >> 接任务：收集情报
    .target 血色审判官凯尔多兰

step
    .goto Eastern Plaguelands,68.18,82.43
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_审判官乔瑟芬妮|r 交谈，|cRXP_WARN_获得临时的血色十字军伪装|r
    .aura 1231929 --Scarlet Illusion
    .skipgossip
    .target 审判官乔瑟芬妮

step
    >>进入提尔之手，前往中央的大教堂
    .goto Eastern Plaguelands,85.27,83.98
    .complete 87502,1 --Scout the Cathedral in Tyr's Hand: 1/1

step
    .goto Eastern Plaguelands,89.76,81.41,30 >>走左侧道路进入新阿瓦隆

step
    >>前往新阿瓦隆的要塞
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_血色血犬|r，|cRXP_WARN_它们能识破你的伪装！|r
    >>可以使用 |T132328:0|t[追踪野兽] 留意血犬的位置 << Hunter
    .goto Eastern Plaguelands,96.66,83.06
    .complete 87502,3 --Scout the Keep in New Avalon: 1/1
    .unitscan 血色血犬

step
    >>前往法师塔
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_血色血犬|r，|cRXP_WARN_它们能识破你的伪装！|r
    >>可以使用 |T132328:0|t[追踪野兽] 留意血犬的位置 << Hunter
    .goto Eastern Plaguelands,98.14,87.88
    .complete 87502,2 --Scout the Mage Tower in New Avalon: 1/1
    .unitscan 血色血犬

step
    >>返回血色十字军营地
    .goto Eastern Plaguelands,68.25,82.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_血色审判官凯尔多兰|r 交谈
    .turnin 87502 >> 交任务：收集情报
    .accept 87506 >> 接任务：瓦解城防
    .target 血色审判官凯尔多兰
    .unitscan 血色血犬

step
    #optional
    #completewith next
    >>|cRXP_WARN_现在可以收集 4 件由专业制作的血色套装，然后使用提供的|r |T134503:0|t[|cFF0070FF血色徽记|r]，解锁永久的血色十字军伪装
    >>这些装备通常可以在拍卖行买到。这并非必需，但能让以后在新阿瓦隆行动轻松许多
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_审判官乔瑟芬妮|r 交谈
    .accept 90510 >> 接任务：新阿瓦隆
    .use 237020 --Scarlet Insignia

step
    >>进入提尔之手，寻找 |cRXP_ENEMY_血色围城指挥官|r
    >>|cRXP_WARN_他们通常出现在攻城武器附近或城墙上|r
    .complete 87506,1 --Scarlet Siege Commander (3)
    .target 血色围城指挥官

step
    .goto Eastern Plaguelands,67.8,83.2
    >>返回血色十字军营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官碧阿崔克丝|r 交谈
    .turnin 87506 >> 交任务：瓦解城防
    .target 指挥官碧阿崔克丝

step
    .goto Eastern Plaguelands,67.8,83.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_银色使者|r 交谈
    .accept 87508 >> 接任务：向泰罗索斯男爵报告

step
    >>返回圣光之愿礼拜堂
    .goto Eastern Plaguelands,81.74,57.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_玛克斯韦尔·泰罗索斯男爵|r 交谈
    .turnin 87508 >> 交任务：向泰罗索斯男爵报告
    .accept 87509 >> 接任务：黎明之怒
    .target 玛克斯韦尔·泰罗索斯男爵

step
    .goto Eastern Plaguelands,67.8,83.2
    >>返回血色十字军营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官碧阿崔克丝|r 交谈
    .skipgossip
    .complete 87509,1 --Report back to Commander Beatrix

step
    .goto Eastern Plaguelands,67.8,83.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_指挥官碧阿崔克丝|r 交谈
    .turnin 87509 >> 交任务：黎明之怒
    .accept 87516 >> 接任务：斩首行动
    .target 指挥官碧阿崔克丝

step
    .goto Eastern Plaguelands,68.36,87.58
    >>此任务需要击杀 |cRXP_ENEMY_巴纳扎尔|r，|cRXP_WARN_他是新团队副本血色领地的首个首领|r
    >>组好团队，祝你战斗顺利！
    .complete 87516,1

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在团队副本中击败巴纳扎尔后，你会被送入监狱，与里面的 |cRXP_FRIENDLY_玛克斯韦尔·泰罗索斯男爵|r 交谈
    .turnin 87516 >> 交任务：斩首行动
    .target 玛克斯韦尔·泰罗索斯男爵

step
    +|cRXP_WARN_恭喜，你已完成血色领地引导任务线！|r
]])
