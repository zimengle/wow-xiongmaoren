RXPGuides.RegisterGuide([[
#classic
#season 2
#group RestedXP 终局指南
#subgroup 音调共鸣
#name 卡拉赞地城共鸣
#displayname 卡拉赞地城共鸣 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    #completewith next
    .subzone 2268 >>前往位于 |cRXP_PICK_东瘟疫之地|r的 |cRXP_LOOT_圣光之愿礼拜堂|r
step
    .goto Eastern Plaguelands,81.3,58.75
    >>点击教堂入口右侧标有|cRXP_FRIENDLY_寻找经验丰富的冒险者|r的广告牌
    .accept 86964 >>接任务: |cRXP_WARN_为了财富与荣耀！|r
step
    .goto Deadwind Pass,43.08,34.22 << Alliance
    .goto Deadwind Pass,51.01,42.19 << Horde
    .zone Deadwind Pass >>前往|cRXP_PICK_逆风小径|r
    .isOnQuest 86964
step
    .goto Deadwind Pass,47.36,75.60,100 >>向南前往|cRXP_LOOT_卡拉赞|r
    .isOnQuest 86964
step
    .goto Deadwind Pass,39,74
    >>寻找一名|cRXP_FRIENDLY_已故冒险者|r的尸体
    .turnin 86964 >>交任务: |cRXP_FRIENDLY_为了财富与荣耀！|r
    .accept 86965 >>接受不平凡的阴影
    .target Deceased Adventurer
step
    .goto Deadwind Pass,51.28,39.91,20,0
    .goto Deadwind Pass,52.09,34.10
    >>向北前往达拉然特工营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯安娜·代理|r交谈
    .turnin 86965 >>提交任务“非同寻常的阴影”
    .accept 86966 >>接受任务：寻找幸存者
step
    .goto Deadwind Pass,59.2,73.4,30 >>向南前往食人魔洞穴的入口
    .isOnQuest 86966
step
    .goto Deadwind Pass,65.0,78.0
    >>进入洞穴, 寻找被锁在笼子里的|cRXP_FRIENDLY_受伤的冒险者|r
    .turnin 86966 >>交还寻找幸存者
    .accept 86967 >>接受任务：救援行动
    .target Injured Adventurer
step
    .goto Deadwind Pass,65.0,78.0
    >>击杀任意一个|r|cRXP_ENEMY_Ogres|r, 并搜刮其尸体, 直到找到一个|r|cRXP_LOOT_Deadwind Cage "Key"|r. 使用该钥匙开启笼子以完成任务
    >>|cRXP_WARN_如果你在附近时, 有人完成了这个目标, 即使你没有与他们组队, 也能获得任务奖励|r
    .complete 86967,1
    .collect 235785,1 --Deadwind Cage "Key"
    .disablecheckbox
    .mob Deadwind Warlock
    .mob Deadwind Mauler
    .mob Deadwind Ogre Mage
    .mob Deadwind Brute
step
    .goto Deadwind Pass,51.28,39.91,20,0
    .goto Deadwind Pass,52.32,34.09
    >>返回北方前往达拉然特工营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈里森·琼斯|r交谈
    .turnin 86967 >>交任务:救援行动
    .accept 86968 >>接受任务：你害怕黑暗吗？
    .target Harrison Jones
step
    .goto Deadwind Pass,52.09,34.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯安娜·代理|r交谈
    .turnin 86968 >>交还任务《你害怕黑暗吗？》
    .accept 86969 >>接任务: |cRXP_WARN_魔法假说|r
    .target Agent Keanna
step
    #optional
    #completewith Hypothesis
    #label Wetlands
    .zone Wetlands >>前往|cRXP_PICK_湿地|r寻找 |T132839:0|t[生命之焰]
    .isOnQuest 86969
step
    #optional
    #completewith Hypothesis
    #requires Wetlands
    #label GrimBatol
    .goto 1437/0,-3451.700,-3450.800,40 >>前往格瑞姆巴托路径起点|cRXP_LOOT_Grim Batol|r
    .isOnQuest 86969
step
    #optional
    #completewith Hypothesis
    #requires GrimBatol
    .goto Wetlands,52.55,41.62,0
    .goto Wetlands,88.07,60.72,0
    .goto Wetlands,85.72,69.33,0
    .goto Wetlands,87.04,51.45
    >>击杀该区域内的任意一个|cRXP_ENEMY_Dragonkin|r, 直到你获得物品|T132839:0|t[|cRXP_LOOT_生命之焰|r]
    .collect 235789,1 --Flame of Life
    .mob Red Scalebane
    .mob Scalebane Lieutenant
    .mob Wyrmkin Firebrand
    .mob Red Dragonspawn
    .mob Scalebane Royal Guard
    .isOnQuest 86969
step
    #optional
    #completewith Hypothesis
    #label EnterDungeon
    .subzoneskip 2557 --Dire Maul
    .subzoneskip 15475 --Demon Fall Canyon
    .goto Kalimdor,42.98,67.51,0 --Dire Maul Entrance
    .goto Ashenvale,84.5,75.0,0 --Demon Fall Canyon Entrance
    +寻找一个加入|cRXP_LOOT_恐惧之槌|r或|cRXP_LOOT_恶魔坠落峡谷|r的队伍, 并进入地下城
    >>|cRXP_WARN_请注意, 您需要进行共鸣才能进入恶魔坠落峡谷. |r 您可以在‘最终指南’ > ‘共鸣’章节中找到相关指引
    .isOnQuest 86969
step
    #optional
    #completewith Hypothesis
    #requires EnterDungeon
    >>击杀该副本中的第一个首领|cRXP_ENEMY_特迪斯·扭木|r. 击败他后, 掉落 |T135139:0|t[铁木枝]
    .complete 86969,2
    .subzoneskip 2557,1 --Only shows in Dire Maul
    .isOnQuest 86969
step
    #optional
    #completewith Hypothesis
    #requires EnterDungeon
    >>击杀副本中的首个首领|r|cRXP_ENEMY_Grimroot|r, 从他身上获取掉落物品:|T135139:0|t[铁木枝条]
    .complete 86969,2
    .subzoneskip 15475,1 --Only shows in Demon Fall Canyon
    .isOnQuest 86969
step
    #optional
    #completewith Hypothesis
    #label Winterspring
    .zone Winterspring >>前往|cRXP_PICK_Winterspring|r的冬泉谷寻找|T136116:0|t[热情的微光精灵]
    .isOnQuest 86969
    .itemcount 235788,<1
step
    #optional
    #completewith Hypothesis
    #requires Winterspring
    #label Darkwhisper
    .goto Winterspring,60.39,73.95,50 >>前往|cRXP_LOOT_暗语峡谷|r
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
    .target Enthusiastic Wisp
    >>向南旅行, 寻找|cRXP_FRIENDLY_Enthusiastic Wisp|r. 与之互动即可拾取
    >>|cRXP_WARN_避开该区域的精英恶魔, 直接跑过去即可|r
    .complete 86969,3 --Enthusiastic Wisp
    .isOnQuest 86969
    .itemcount 235788,<1 
step
    #label Hypothesis
    >>收集 |T132839:0|t[生命之焰]. 它会从位于|cRXP_LOOT_格瑞姆巴托|r附近的|cRXP_ENEMY_Elite Dragonkin|r身上掉落, 地点在|cRXP_PICK_湿地|r
    >>收集 |T135139:0|t[铁木枝条]. 它会从以下两个目标之一掉落:  \n-|cRXP_ENEMY_Grimroot|r在|cRXP_LOOT_恶魔坠落峡谷|r|cRXP_WARN_(地下城)|r \n- 或者|cRXP_ENEMY_特迪斯·扭木|r在|cRXP_LOOT_恐惧之槌西部|r|cRXP_WARN_(地下城)|r
    >>收集 |T136116:0|t[热情的微光灵]. 它是一个可互动的|cRXP_FRIENDLY_friendly NPC|r, 位于|cRXP_LOOT_暗语峡谷|r的|cRXP_PICK_冬泉谷|r
    >>|cRXP_WARN_这些物品可按任意顺序收集|r
    .complete 86969,1 --Flame of Life
    .complete 86969,2 --Ancient Ironwood Branch
    .complete 86969,3 --Enthusiastic Wisp
    .mob Grimroot
    .mob Tendris Warpwood
    .isOnQuest 86969
step
    .goto Deadwind Pass,43.08,34.22 << Alliance
    .goto Deadwind Pass,51.01,42.19 << Horde
    .zone Deadwind Pass >>返回至|cRXP_PICK_逆风小径|r
    .isQuestComplete 86969
step
    .goto Deadwind Pass,51.28,39.91,20,0
    .goto Deadwind Pass,52.09,34.10
    >>前往达拉然特工营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯安娜·代理|r交谈
    .turnin 86969 >>交任务: |cRXP_FRIENDLY_魔法假说|r
    .accept 86970 >>接受任务：检验我们的假设
step
    .goto Deadwind Pass,45.10,77.96,20,0
    .goto Deadwind Pass,42.20,77.41,20,0
    .goto Deadwind Pass,39.98,75.36,20,0
    .goto Deadwind Pass,39.93,74.24
    >>前往位于卡拉赞以西的摩根之巢. |cRXP_WARN_走进那里的巨大阴影球|r
    >>进入后使用你的 |T135432:0|t[|cRXP_FRIENDLY_Enchanted Firebrand|r], 并等待RP完成
    .complete 86970,1
    .use 235790 --Enchanted Firebrand
step
    .goto Deadwind Pass,45.10,77.96,20,0
    .goto Deadwind Pass,55.40,78.75,20,0
    .goto Deadwind Pass,51.28,39.91,20,0
    .goto Deadwind Pass,52.32,34.09
    >>返回北方前往达拉然特工营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯安娜·代理|r交谈
    .turnin 86970 >>提交测试我们的假设
    .target Agent Keanna
step
    >>|cRXP_WARN_恭喜你, 你现在已与卡拉赞地穴共鸣了！|r
    >>You can |Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈里森·琼斯|r交谈 to pick up a quest from him that can be completed inside the instance
    .accept 86971 >>接任务: |cRXP_WARN_珍奇卡拉赞珍玩！|r
    .target Harrison Jones
]])

RXPGuides.RegisterGuide([[
#classic
#season 2
#group RestedXP 终局指南
#subgroup 音调共鸣
#name 血色领地简介
#displayname 血色领地简介 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
   #completewith next
   .subzone 2268 >>前往位于 |cRXP_PICK_东瘟疫之地|r的 |cRXP_LOOT_圣光之愿礼拜堂|r
step
   .goto Eastern Plaguelands,81.73,57.84
   >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与教堂内的|r莱尼德·巴萨罗梅|r交谈
   .accept 87459 >>接受任务：绯红
   .target Leonid Barthalomew the Revered
step
    #optional
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰希卡·查伯斯|r交谈
    .home >>如果你想|r设置你的炉石|r, 可以在此处设置. 这将帮助你更快地从提瑞斯法林地返回
    .target Jessica Chambers
step << Alliance
    .goto Eastern Plaguelands,81.64,59.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_外面的|cRXP_FRIENDLY_凯琳·斯蒂文|r交谈
    .fly Chillwind >>飞往西瘟疫之地
    .target Khaelyn Steelwing
    .isOnQuest 87459
step << Horde
    .goto Eastern Plaguelands,80.23,57.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_outside|cRXP_FRIENDLY_乔吉亚|r交谈
    .target Georgia
    .fly Undercity >>飞往幽暗城
    .isOnQuest 87459
step << Horde
    .goto Tirisfal Glades,61.85,66.59,60 >>前往: |cRXP_PICK_提瑞斯法林地|r
    .isOnQuest 87459
step << Alliance
   #completewith next
   .goto Tirisfal Glades,84.85,70.57
   .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
   .isOnQuest 87459
step
   .goto Tirisfal Glades,81.76,58.06
   >>前往北方的猩红营地 << Alliance
   >>向东前往血色营地 << Horde
   >>点击小帐篷外的|cRXP_PICK_链球|r, 它会召唤一名会攻击你的|cRXP_WARN_elite|r|cRXP_ENEMY_猩红潜行者|r
   >>击杀并|cRXP_LOOT_掠夺|r他, 以获得来自|T133471:0|t[高阶将军的命令]
   .complete 87459,1 --Orders from the High General
   .mob Scarlet Infiltrator
   .isOnQuest 87459
step
   #completewith next
   .subzone 2268 >>返回至 |cRXP_LOOT_圣光之愿礼拜堂|r的 |cRXP_PICK_东瘟疫之地|r
   .isOnQuest 87459
step
   .goto Eastern Plaguelands,81.73,57.84
   >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与教堂内的|r莱尼德·巴萨罗梅|r交谈
    .turnin 87459 >>提交猩红活动
    .accept 87493 >>接任务: |cRXP_WARN_提尔之手的骚乱|r
    .target Leonid Barthalomew the Revered
step
    .goto Eastern Plaguelands,67.8,83.2
    >>向南前往猩红军团大本营
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝atrix指挥官|r交谈
    .turnin 87493 >>交任务: |cRXP_FRIENDLY_提尔之手的骚乱|r
    .accept 87497 >>接任务: |cRXP_WARN_分裂|r
    .target Commander Beatrix
step
    .goto Eastern Plaguelands,67.8,83.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官贝atrix交谈并完成她的|r交谈
    .complete 87497,1
    .skipgossip
    .target Commander Beatrix
step
   .goto Eastern Plaguelands,81.73,57.84
   >>返回圣光之愿礼拜堂
   >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尼德·巴萨罗梅|r对话, 他在里面
    .turnin 87497 >>交任务: |cRXP_FRIENDLY_分裂|r
    .accept 87498 >>接任务: |cRXP_WARN_血色光复军|r
    .target Leonid Barthalomew the Revered
step
    .goto Eastern Plaguelands,67.8,83.2
    >>返回猩红要塞营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝atrix指挥官|r交谈
    .turnin 87498 >>交任务: |cRXP_FRIENDLY_血色光复军|r
    .target Commander Beatrix
step
    .goto Eastern Plaguelands,68.25,82.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_血色审查官卡尔多兰|r交谈
    .accept 87502 >>接任务: |cRXP_WARN_收集情报|r
    .target Scarlet Inquisitor Caldoran
step
    .goto Eastern Plaguelands,68.18,82.43
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_仁慈的审问官乔西菲娜|r|cRXP_WARN_|交谈, 以获得一个临时的血色十字军伪装
    .aura 1231929 --Scarlet Illusion
    .skipgossip
    .target Inquisitor Jociphine
step
    >>进入提尔之手, 前往中央的大教堂
    .goto Eastern Plaguelands,85.27,83.98
    .complete 87502,1 --Scout the Cathedral in Tyr's Hand: 1/1 
step
    .goto Eastern Plaguelands,89.76,81.41,30 >>走左边通往新阿瓦隆的道路
step
    >>前往新阿瓦隆的城堡
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_血色猎犬|r|cRXP_WARN_它们能看穿你的伪装！|r
    >>您可以使用 |T132328:0|t[追踪野兽] 来帮助追踪猎犬的位置 << Hunter
    .goto Eastern Plaguelands,96.66,83.06
    .complete 87502,3 --Scout the Keep in New Avalon: 1/1
    .unitscan Sarlet Bloodhound
step
    >>前往法师塔
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_血色猎犬|r|cRXP_WARN_它们能看穿你的伪装！|r
    >>您可以使用 |T132328:0|t[追踪野兽] 来帮助追踪猎犬的位置 << Hunter
    .goto Eastern Plaguelands,98.14,87.88
    .complete 87502,2 --Scout the Mage Tower in New Avalon: 1/1
    .unitscan Sarlet Bloodhound
step
    >>返回猩红要塞营地
    .goto Eastern Plaguelands,68.25,82.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_血色审查官卡尔多兰|r交谈
    .turnin 87502 >>交任务: |cRXP_FRIENDLY_收集情报|r
    .accept 87506 >>接任务: |cRXP_WARN_瓦解城防|r
    .target Scarlet Inquisitor Caldoran
    .unitscan Sarlet Bloodhound
step
    #optional
    #completewith next
    >>|cRXP_WARN_你现在可以通过收集4件可制作的猩红套装部件, 然后使用提供的|r|T134503:0|t[|cFF0070FF猩红徽章|r]来解锁永久的猩红伪装
    >>你应该能在拍卖行找到这些. 虽然不是强制性的, 但将来在新阿瓦隆的探索会更容易
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_审问者乔西芬|r交谈
    .accept 90510 >>接任务: |cRXP_WARN_新阿瓦隆|r
    .use 237020 --Scarlet Insignia
step
    >>进入提尔之手并寻找|r|cRXP_ENEMY_Scarlet Siege Commanders|r 
    >>|cRXP_WARN_它们更常见于攻城武器附近或城墙之上|r
    .complete 87506,1 --Scarlet Siege Commander (3)
    .target Scarlet Siege Commander
step
    .goto Eastern Plaguelands,67.8,83.2
    >>返回猩红要塞营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝atrix指挥官|r交谈
    .turnin 87506 >>交任务: |cRXP_FRIENDLY_瓦解城防|r
    .target Commander Beatrix
step
    .goto Eastern Plaguelands,67.8,83.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_银色特使|r交谈
    .accept 87508 >>接任务: |cRXP_WARN_向泰罗索斯男爵报告|r
step
    >>返回圣光之愿礼拜堂
    .goto Eastern Plaguelands,81.74,57.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与位于内部的|cRXP_FRIENDLY_玛克斯韦尔·泰罗索斯男爵|r交谈
    .turnin 87508 >>交任务: |cRXP_FRIENDLY_向泰罗索斯男爵报告|r
    .accept 87509 >>接任务: |cRXP_WARN_黎明之怒|r
    .target Lord Maxwell Tyrosus
step
    .goto Eastern Plaguelands,67.8,83.2
    >>返回猩红要塞营地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝atrix指挥官|r交谈
    .skipgossip
    .complete 87509,1 --Report back to Commander Beatrix
step
    .goto Eastern Plaguelands,67.8,83.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝atrix指挥官|r交谈
    .turnin 87509 >>交任务: |cRXP_FRIENDLY_黎明之怒|r
    .accept 87516 >>接任务: |cRXP_WARN_斩首行动|r
    .target Commander Beatrix
step
    .goto Eastern Plaguelands,68.36,87.58
    >>此任务要求你击杀|cRXP_ENEMY_巴纳扎尔|r|cRXP_WARN_新血色领地团队副本中的第一个首领|r
    >>组队参与团队副本, 祝你狩猎顺利！
    .complete 87516,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在击败raid中的巴纳扎尔后, 前往你被转移到的监狱内与|cRXP_FRIENDLY_玛克斯韦尔·泰罗索斯男爵|r交谈
    .turnin 87516 >>交任务: |cRXP_FRIENDLY_斩首行动|r
    .target Lord Maxwell Tyrosus
step
    +|cRXP_WARN_恭喜你完成了血色领地的入门任务线！|r
]])