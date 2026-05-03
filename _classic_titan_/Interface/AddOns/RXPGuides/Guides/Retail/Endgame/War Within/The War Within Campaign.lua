--Max Level Campaign

RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.0 战役
#subweight 1000
#name a) 逆流而上
#displayname |cFF00CCFF1|r - 逆水行舟 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ab) 鸟之羁绊

step
    .isOnQuest 84365
    .goto 2339,47.40,44.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布莱恩·铜须|r交谈
    .turnin 84365 >>交任务: |cRXP_FRIENDLY_援军将至|r
    .target Brann Bronzebeard
step
    .isQuestTurnedIn 84365
    .goto 2339,47.40,44.39
    .gossipoption 123770 >>与布兰交谈以跳过后续升级任务
step
    .isQuestTurnedIn 84365
    .goto 2339,47.40,44.39
    .gossipoption 123771 >>与布兰交谈以跳过后续升级任务
step
    .goto 2339,36.12,80.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .accept 79333 >>接任务: |cRXP_WARN_舰队抵达|r
    .target Moira Thaurissan
step
    .goto 2339,35.13,80.28
    >>点击|cRXP_PICK_Telescope|r
    .complete 79333,1 --1/1 Telescope used
step
    .goto 2339,36.12,80.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .complete 79333,2 --1/1 Report back to Moira
    .timer 8,RP
    .skipgossipid 121591
    .target Moira Thaurissan
step << Alliance
    .goto 2339,35.88,81.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r交谈
    .turnin 79333 >>交任务: |cRXP_FRIENDLY_舰队抵达|r
    .target Lady Jaina Proudmoore
    .accept 82153 >>接任务: |cRXP_WARN_大使馆与特使|r
step << Horde
    .goto 2339,36.2,81.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 79333 >>交任务: |cRXP_FRIENDLY_舰队抵达|r
    .target Lady Jaina Proudmoore
    .accept 79328 >>接任务: |cRXP_WARN_大使馆与特使|r
step << Horde
    .goto 2339,30.34,63.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dornogal Steward|r交谈
    .complete 79328,1 --1/1 Horde Embassy steward found in Dornogal
    .skipgossipid 121623
    .target Dornogal Steward
step << Horde
    .goto 2339,30.14,62.79
    >>点击 |cRXP_PICK_部落军旗|r
    .complete 79328,2,1 --2/2 Horde banners placed
step << Horde
    .goto 2339,30.65,63.55
    >>点击 |cRXP_PICK_部落军旗|r
    .complete 79328,2,2 --2/2 Horde banners placed
step << Horde
    .goto 2339,27.35,69.22
    >>点击|cRXP_PICK_Large 部落军旗|r
    .complete 79328,3,1 --5/5 Decorations placed inside
step << Horde
    .goto 2339,26.32,67.67
    >>点击|cRXP_PICK_Large 部落军旗|r
    .complete 79328,3,2 --5/5 Decorations placed inside
step << Horde
    .goto 2339,26.31,67.31
    >>点击|cRXP_PICK_武器架|r
    .complete 79328,3,3 --5/5 Decorations placed inside
step << Horde
    .goto 2339,26.21,67.08
    >>点击|cRXP_PICK_Strongbox|r
    .complete 79328,3,4 --5/5 Decorations placed inside
step << Horde
    .goto 2339,27.02,65.5
    >>点击|cRXP_PICK_小型部落军旗|r
    .complete 79328,3,5 --5/5 Decorations placed inside
step << Horde
    .goto 2339,28.36,66.24
    .skipgossipid 121721
    .skipgossipid 122248
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dornogal Steward|r交谈
    .complete 79328,4 --1/1 Document signed
    .target Dornogal Steward
step << Horde
    #completewith next
    #title Leave House
    .goto 2339,30.58,62.84,10 >>离开房屋
step << Horde
    .goto 2339,31.79,59.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .turnin 79328 >>交任务: |cRXP_FRIENDLY_大使馆与特使|r
    .target Moira Thaurissan
step << Alliance
    .goto 2339,30.33,56.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dornogal Steward|r交谈
    .complete 82153,1 --1/1 Alliance Embassy steward found in Dornogal
    .skipgossipid 122277
    .target Dornogal Steward
step << Alliance
    .goto 2339,30.14,56.49
    >>点击|cRXP_PICK_Alliance 联盟旗帜|r
    .complete 82153,2,1 --2/2 Alliance banners placed
step << Alliance
    .goto 2339,30.66,55.72
    >>点击|cRXP_PICK_Alliance 联盟旗帜|r
    .complete 82153,2,2 --2/2 Alliance banners placed
step << Alliance
    .goto 2339,28.93,53.53,10,0
    .goto 2339,28.86,51.07
    >>点击 |cRXP_PICK_Small Alliance旗帜|r
    .complete 82153,3,1 --5/5 Decorations placed inside
step << Alliance
    .goto 2339,27.86,49.89
    >>点击 |cRXP_PICK_Supplies|r
    .complete 82153,3,2 --5/5 Decorations placed inside
step << Alliance
    .goto 2339,27.6,49.86
    >>点击|cRXP_PICK_Alliance 武器架|r
    .complete 82153,3,3 --5/5 Decorations placed inside
step << Alliance
    .goto 2339,27.39,50.01
    >>点击|cRXP_PICK_联盟旗帜|r
    .complete 82153,3,4 --5/5 Decorations placed inside
step << Alliance
    .goto 2339,26.34,51.58
    >>点击|cRXP_PICK_联盟旗帜|r
    .complete 82153,3,5 --5/5 Decorations placed inside
step << Alliance
    .goto 2339,28.35,53.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dornogal Steward|r交谈
    .complete 82153,4 --1/1 Document signed
    .skipgossipid 121721
    .skipgossipid 122278
    .target Dornogal Steward
step << Alliance
    .goto 2339,31.79,59.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .turnin 82153 >>交任务: |cRXP_FRIENDLY_大使馆与特使|r
    .target Moira Thaurissan
step
    .goto 2339,31.79,59.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .accept 83271 >>接任务: |cRXP_WARN_总有新的秘密等待揭晓|r
step
    .goto 2339,29.76,59.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dagran Thaurissan II|r交谈
    .complete 83271,1 --1/1 Talk to Dagran Thaurissan II
    .skipgossipid 122851
    .target Dagran Thaurissan II
step
    .goto 2339,29.75,59.67
    >>点击|cRXP_PICK_界门|r|cRXP_WARN_[1]|r
    .complete 83271,2 --1/1 Waygate activated
    .skipgossipid 122852
step
    .goto 2339,29.75,59.67
    >>点击|cRXP_PICK_界门|r|cRXP_WARN_[2]|r
    .complete 83271,3 --1/1 Waygate used
step
    .goto 2367,49.79,60.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等发言人布林特|r交谈
    .turnin 83271 >>交任务: |cRXP_FRIENDLY_总有新的秘密等待揭晓|r
    .target High Speaker Brinthe
    .accept 83286 >>接任务: |cRXP_WARN_多恩诺嘉尔深底藏物|r
step
    #completewith next
    .goto 2367,49.63,63.79
    .gossipoption 122926 >>点击|cRXP_PICK_Central Archives Console.|r
step
    .goto 2367,49.63,63.79
    >>以确保任何连线都不相交的方式连接发光的水晶球
    .complete 83286,1 --1/1 Restart the central console
    .skipgossipid 122926
step
    .goto 2367,49.96,60.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等发言人布林特|r交谈
    .turnin 83286 >>交任务: |cRXP_FRIENDLY_多恩诺嘉尔深底藏物|r
    .target High Speaker Brinthe
    .accept 83315 >>接任务: |cRXP_WARN_迎接未知|r
step
    #completewith next
    .goto 2367,49.93,35.87
    .cast 296687 >>点击|cRXP_PICK_界门|r
step
    .goto 2339,31.77,59.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .turnin 83315 >>交任务: |cRXP_FRIENDLY_迎接未知|r
    .target Moira Thaurissan
step
    .goto 2339,31.77,59.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .accept 79344 >>接任务: |cRXP_WARN_城市史诗|r
step
    .goto 2339,47.8,45.83,10,0
    .goto 2339,47.36,44.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布莱恩·铜须|r交谈
    .complete 79344,1 --1/1 Delver's Headquarters found
    .target Brann Bronzebeard
step
    #completewith next
    #title 进入房屋
    .goto 2339,51.44,42.19,10 >>进入房屋
step
    .goto 2339,52.08,42.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与瓦斯卡恩交谈|cRXP_FRIENDLY_Vaskarn|r
    .complete 79344,3 --1/1 Item upgrades and crest exchange vendors found
    .target Vaskarn
step
    #completewith next
    #title Leave House
    .goto 2339,51.09,41.43,10 >>离开房屋
step
    .goto 2339,39.08,24.14
    #title |cFFFCDC00跟随箭头指引|r
    .complete 79344,2 --1/1 Keepers of Renown found
    .goto 2339,39.29,24.1
step
    #completewith next
    .goto 2339,40.72,22.36
    .cast 431519 >>点击|cRXP_PICK_Earthen Teleporter|r
step
    .goto 2339,31.78,59.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .turnin 79344 >>交任务: |cRXP_FRIENDLY_城市史诗|r
    .target Moira Thaurissan
]])

RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.0 战役
#name ab) 鸟之羁绊
#displayname |cFF00CCFF2|r - 灵魂的羁绊 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next AC) 下方传来的消息

step
    .goto 2339,31.54,59.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .accept 79107 >>接任务: |cRXP_WARN_风暴余响|r
    .target Alleria Windrunner
step
    .goto 2339,38.28,70.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风暴骑士 梅兰德|r交谈
    .complete 79107,1,1 --4/4 Stormriders assessed
    .skipgossip
    -- .skipgossipid 121934
    -- .skipgossipid 121930
    .target Stormrider Meirand
step
    .goto 2339,38.28,70.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风暴骑士 Vokmar|r交谈
    .complete 79107,1,2 --4/4 Stormriders assessed
    .skipgossip
    -- .skipgossipid 121935
    -- .skipgossipid 121936
    -- .skipgossipid 121948
    .target Stormrider Vokmar
step
    .goto 2339,38.3,71.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风暴骑士埃德特劳|r交谈
    .complete 79107,1,3 --4/4 Stormriders assessed
    .skipgossip
    -- .skipgossipid 121935
    -- .skipgossipid 121936
    -- .skipgossipid 121943
    .target Stormrider Edeltrau
step
    .goto 2339,38.38,71.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风暴骑士 Hunfrid|r交谈
    .complete 79107,1,4 --4/4 Stormriders assessed
    .skipgossip
    -- .skipgossipid 121937
    -- .skipgossipid 121938
    .target Stormrider Hunfrid
step
    .goto 2339,38.31,71.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗克滕德·卢夫塞拉|r交谈
    .complete 79107,2 --1/1 Lufsela questioned
    .skipgossipid 122017
    .target Rooktender Lufsela
step
    #completewith next
    .goto 2248,47.64,52.08,10 >>|cRXP_WARN_跟随箭头指引|r
step
    .goto 2339,37.46,82.17
    >>|cRXP_WARN_从背后接近|RXP_FRIENDLY_Rooktender Lufsela|r, 以避免被眩晕|r
    *|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗克滕德·卢夫塞拉|r交谈
    .turnin 79107 >>交任务: |cRXP_FRIENDLY_风暴余响|r
    .target Rooktender Lufsela
    .accept 81914 >>接任务: |cRXP_WARN_达尔欧兹坦|r
step
    .goto 2248,28.54,61.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔巴里格|r交谈
    .turnin 81914 >>交任务: |cRXP_FRIENDLY_达尔欧兹坦|r
    .target Olbarig
    .accept 79124 >>接任务: |cRXP_WARN_南部风暴导体|r
step
    .goto 2248,28.55,61.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔巴里格|r交谈
    .accept 79124 >>接任务: |cRXP_WARN_南部风暴导体|r
    .target Olbarig
step
    #completewith Conduit of the Southern Storm
    .goto 2248,27.82,59.95,30 >>起飞并登上塔楼
    #title Fly up the Tower
step
    #completewith Conduit of the Southern Storm
    .goto 2248,27.73,59.69,10 >>进入高塔
    #title 进入高塔
step
    #label Conduit of the Southern Storm
    .goto 2248,27.73,59.93,5,0
    .goto 2248,27.73,59.58,5,0
    .goto 2248,27.77,59.69
    >>|cRXP_WARN_小心地从楼梯上跳下, 以降下塔楼|r
    *Click on |cRXP_PICK_Click on the Chest.|r
    .complete 79124,2 --1/1 Conduit of the Southern Storm
    .skipgossipid 122158
step
    #completewith next
    .goto 2248,27.83,59.94,10 >>下到塔内
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗克滕德·卢夫塞拉和奥尔巴里格|r交谈
    .turnin 79124 >>交任务: |cRXP_FRIENDLY_南部风暴导体|r
    .goto 2248,27.65,60.48
    .target +Rooktender Lufsela
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔巴里格|r交谈
    .accept 79475 >>接任务: |cRXP_WARN_登峰之势|r
    .accept 79476 >>接任务: |cRXP_LOOT_响应召唤|r
    .goto 2248,27.65,60.53
    .target +Olbarig
step
    #completewith Stranded Earthen
    >>击杀|cRXP_ENEMY_Stirred Cobblestone|r和|cRXP_ENEMY_Charged Spirecrystal|r和|cRXP_ENEMY_Charged Storm Wolf|r
    .complete 79475,1 --Conduit charged (100%)
    .mob Stirred Cobblestone
    .mob Charged Spirecrystal
    .mob Charged Storm Wolf
step
    .goto 2248,27.27,58.82,15,0
    .goto 2248,28.45,57.91
    >>点击|cRXP_PICK_Stranded Pilgrim|r
    #title Kill enemies along the way
    .complete 79476,1,2 --8/8 Stranded Earthen helped
    .target Stranded Pilgrim
step
    .goto 2248,26.88,56.11
    >>点击|cRXP_PICK_Stranded Pilgrim|r
    #title Kill enemies along the way
    .complete 79476,1,4 --8/8 Stranded Earthen helped
    .target Stranded Pilgrim
step
    .goto 2248,26.78,57.82,15,0
    .goto 2248,26.02,58.7
    >>点击|cRXP_PICK_Stranded Pilgrim|r
    #title Kill enemies along the way
    .complete 79476,1,6 --8/8 Stranded Earthen helped
    .target Stranded Pilgrim
step
    #label Stranded Earthen
    .goto 2248,25.78,57.81
    >>点击|cRXP_PICK_Stranded Pilgrim|r
    #title Kill enemies along the way
    .complete 79476,1,8 --8/8 Stranded Earthen helped
    .target Stranded Pilgrim
step
    #loop
    .goto 2248,25.15,56.92,30,0
    .goto 2248,26.09,58.51,30,0
    .goto 2248,27.09,59.67,30,0
    .goto 2248,28.16,57.57,30,0
    .goto 2248,27.08,56.41,30,0
    .goto 2248,26.49,57.97,30,0
    >>击杀|cRXP_ENEMY_Stirred Cobblestone|r和|cRXP_ENEMY_Charged Spirecrystal|r和|cRXP_ENEMY_Charged Storm Wolf|r
    .complete 79475,1 --Conduit charged (100%)
    .mob Stirred Cobblestone
    .mob Charged Spirecrystal
    .mob Charged Storm Wolf
step
    .goto 2248,25.62,57.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗克滕德·卢夫塞拉|r交谈
    .turnin 79475 >>交任务: |cRXP_FRIENDLY_登峰之势|r
    .target Rooktender Lufsela
    .turnin 79476 >>交任务: |cRXP_FRIENDLY_响应召唤|r
    .accept 79129 >>接任务: |cRXP_WARN_雷鸫集结|r
step
    .goto 2248,25.07,58.12
    >>击杀|cRXP_ENEMY_Rampant Air Elemental|r和|cRXP_ENEMY_Rampant Thunder Elemental|r
    .complete 79129,1 --Ritual safeguarded (100%)
    .mob Rampant Air Elemental
    .mob Rampant Thunder Elemental
step
    .goto 2248,24.90,58.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗克滕德·卢夫塞拉|r交谈
    .complete 79129,2 --1/1 Lufsela encouraged
    .skipgossipid 120784
    .target Rooktender Lufsela
step
    .goto 2248,27.82,60.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 79129 >>交任务: |cRXP_FRIENDLY_雷鸫集结|r
    .target Thrall
    .accept 79146 >>接任务: |cRXP_WARN_撼地勇士|r
step
    .goto 2248,33.32,63.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德尔戈恩|r交谈
    .turnin 79146 >>交任务: |cRXP_FRIENDLY_撼地勇士|r
    .target Adelgonn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级大祭司图拉扬|r和|cRXP_FRIENDLY_霸主盖亚拉|r交谈
    .accept 79145 >>接任务: |cRXP_WARN_金属与顽石|r
    .goto 2248,33.33,63.38
    .target +High Exarch Turalyon
    .accept 79140 >>接任务: |cRXP_WARN_得过且过|r
    .goto 2248,33.29,63.32
    .target +Overlord Geya'rah
step
    #loop
    .goto 2248,33.2,62.4,30,0
    .goto 2248,32.91,62.16,30,0
    .goto 2248,32.93,62.17,30,0
    .goto 2248,33.19,60.97,30,0
    .goto 2248,33.31,60.72,30,0
    .goto 2248,33.74,60.75,30,0
    .goto 2248,33.86,62.28,30,0
    .goto 2248,34.3,62.56,30,0
    .goto 2248,34.89,62.7,30,0
    .goto 2248,35.09,63.15,30,0
    .goto 2248,33.6,63.38,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Undisciplined Earthen|r交谈并击败他们
    .complete 79140,1 --8/8 Undisciplined Earthen sparred
    .target Undisciplined Earthen
    .skipgossip
step
    .goto 2248,34.24,63.79
    >>根据|cRXP_WARN_屏幕上的说明|r点击武器架上
    .complete 79145,1 --10/10 Earthen Trainees armed
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级大祭司图拉扬|r和|cRXP_FRIENDLY_霸主盖亚拉|r交谈
    .turnin 79145 >>交任务: |cRXP_FRIENDLY_金属与顽石|r
    .goto 2248,33.32,63.38
    .target +High Exarch Turalyon
    .turnin 79140 >>交任务: |cRXP_FRIENDLY_得过且过|r
    .goto 2248,33.29,63.32
    .target +Overlord Geya'rah
step
    .goto 2248,33.32,63.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德尔戈恩|r交谈
    .accept 81915 >>接任务: |cRXP_WARN_栖巢为居|r
    .target Adelgonn
step
    .goto 2248,28.98,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗克滕德·卢夫塞拉|r交谈
    .turnin 81915 >>交任务: |cRXP_FRIENDLY_栖巢为居|r
    .target Rooktender Lufsela
    .accept 79477 >>接任务: |cRXP_WARN_失散之人|r
step
    .goto 2248,23.66,67.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风暴骑士格诺特|r交谈
    .complete 79477,1,1 --3/3 Stray recruits found
    .target Stormrider Gurnot
    .skipgossipid 120977
step
    .goto 2248,23.47,51.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风暴骑士 阿达拉|r交谈
    .complete 79477,1,2 --3/3 Stray recruits found
    .target Stormrider Adalar
    .skipgossipid 120968
step
    .goto 2248,31.48,56.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风暴骑士Kothilde|r交谈
    .complete 79477,1,3 --3/3 Stray recruits found
    .skipgossipid 120979
    .target Stormrider Kothilde
step
    .goto 2248,29.06,61.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库德兰·蛮锤|r交谈
    .turnin 79477 >>交任务: |cRXP_FRIENDLY_失散之人|r
    .target Kurdran Wildhammer
    .accept 79147 >>接任务: |cRXP_WARN_飞行训练第一课|r
    .timer 14,Roleplay Duration
step
    .goto 2248,28.94,61.62
    >>等待角色扮演
    .complete 79147,1 --1/1 Rook supercharging witnessed
step
    .goto 2248,28.94,61.62
    >>点击|cRXP_PICK_Shraubendre|r:你可以选择自行飞行以加快行程, 或让NPC带你飞行, |cRXP_WARN_后者速度较慢. |r
    .complete 79147,2 --1/1 Shraubendre mounted
    -- .skipgossipid 122439
    -- .skipgossipid 121165
    .target Shraubendre
step
    .goto 2248,27.96,57.17,10,0
    .goto 2248,30.48,56.86,10,0
    .goto 2248,31.64,53.76,10,0
    .goto 2248,30.76,50.4,10,0
    .goto 2248,27.06,45.84,10,0
    .goto 2248,28.13,43.82,10,0
    .goto 2248,31.67,41.07,10,0
    .goto 2248,36.19,35.78,10,0
    .goto 2248,39.03,34.62,10,0
    .goto 2248,40.84,37.26,10,0
    .goto 2248,41.68,40.84,10,0
    .goto 2248,41.48,43.92,10,0
    .goto 2248,38.88,49.33,10,0
    .goto 2248,40.07,54.56,10,0
    .goto 2248,43.28,57.82,10,0
    .goto 2248,43.14,60.2,10,0
    .goto 2248,41.04,60.4,10,0
    .goto 2248,39.31,60.36,10,0
    .goto 2248,36.21,59.98,10,0
    .goto 2248,31.97,64.32,10,0
    >>|cRXP_WARN_飞越环圈|r
    .complete 79147,3 --1/1 Maneuvering lesson complete
step
    .goto 2248,35.02,72.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库德兰·蛮锤|r交谈
    .turnin 79147 >>交任务: |cRXP_FRIENDLY_飞行训练第一课|r
    .target Kurdran Wildhammer
    .accept 81912 >>接任务: |cRXP_WARN_飞行训练第二课|r
step
    #completewith next
    .gossipoption 122555 >>点击|cRXP_PICK_螺栓|r|cRXP_WARN_如果你还没有骑上他|r
    .target Shraubendre
step
    .goto 2248,38.25,71.25,120,0
    .goto 2248,39.08,75.2,120,0
    .goto 2248,43.22,75.82,120,0
    .goto 2248,45.21,75.79,120,0
    .goto 2248,44.87,73.49,120,0
    .goto 2248,43.78,67.67,120,0
    .goto 2248,46.53,67.46,120,0
    .goto 2248,49.97,72.14,120,0
    .goto 2248,50.79,66.63,120,0
    .goto 2248,53.36,64.03,120,0
    .goto 2248,55.47,63.17,120,0
    .goto 2248,59.23,62.56,120,0
    .goto 2248,61.27,62.94,120,0
    >>使用 |T4640498:0|t[Skwyard Ascent] 从|cRXP_WARN_远处|r位置攻击|cRXP_PICK_目标|r
    --x |cRXP_WARN_even when they disappear; they will still count toward quest credit.|r
    *For additional vigor, fly through the green orbs on your path and use |T4640489:0|t[Second Wind] whenever it's off cooldown.
    .complete 81912,1 --15/15 Targets hit
step
    .goto 2248,61.75,65.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库德兰·蛮锤|r交谈
    .turnin 81912 >>交任务: |cRXP_FRIENDLY_飞行训练第二课|r
    .target Kurdran Wildhammer
    .accept 81913 >>接任务: |cRXP_WARN_飞行训练第三课|r
step
    #completewith next
    .gossipoption 121166 >>点击|cRXP_PICK_螺栓|r|cRXP_WARN_如果你还没有骑上他|r
    .target Shraubendre
step
    .goto 2248,68.96,70.62
    >>使用 |T4640498:0|t[广场之升] 从|cRXP_WARN_远处|r击中|cRXP_PICK_Shalemaws|r
    *For additional vigor, fly through the green orbs on your path and use |T4640489:0|t[Second Wind] whenever it's off cooldown.
    .complete 81913,1 --50/50 Shalemaws blasted
    .mob Tiderusher Shalemaw
step
    .goto 2248,75.97,39.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔巴里格|r交谈
    .turnin 81913 >>交任务: |cRXP_FRIENDLY_飞行训练第三课|r
    .target Olbarig
    .accept 79480 >>接任务: |cRXP_WARN_表达敬意|r
step
    #loop
    .goto 2248,76.57,35.66,40,0
    .goto 2248,75.35,35.92,40,0
    .goto 2248,75.09,37.76,40,0
    .goto 2248,76.05,39.26,40,0
    >>击杀|cRXP_ENEMY_Faithful of Zirix|r
    .complete 79480,1 --8/8 Faithful of Zirix slain
    .mob Faithful of Zirix
step
    .goto 2248,76.56,35.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔巴里格|r交谈
    .turnin 79480 >>交任务: |cRXP_FRIENDLY_表达敬意|r
    .target Olbarig
    .accept 79156 >>接任务: |cRXP_WARN_律令|r
step
    .goto 2248,57.06,50.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅里克斯|r交谈
    .complete 79156,1 --1/1 Report to Merrix
    .skipgossipid 121537
step
    .goto 2248,57.06,50.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅里克斯|r交谈
    .turnin 79156 >>交任务: |cRXP_FRIENDLY_律令|r
    .target Merrix
    .accept 79157 >>接任务: |cRXP_WARN_泰坦安全措施|r
step
    .goto 2248,57.24,50.69
    >>点击|cRXP_PICK_Shraubendre|r
    .complete 79157,1 --1/1 Shraubendre mounted
    .skipgossipid 122477
step
    .goto 2248,60.97,76.58
    >>使用 |T4640498:0|t[斯奎亚德高地] 来击中|cRXP_PICK_巨型泰坦构造体|r
    *Use |T4640490:0|t[Surge Forward] to shield yourself from incoming attacks.
    *For additional vigor, fly through the green orbs on your path and use |T4640489:0|t[Second Wind] whenever it's off cooldown.
    .complete 79157,2 --1/1 Colossal Titan Construct slain
    .mob Colossal Titan Construct
step
    .goto 2339,31.54,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 79157 >>交任务: |cRXP_FRIENDLY_泰坦安全措施|r
    .target Alleria Windrunner
    .accept 79224 >>接任务: |cRXP_WARN_情报收集|r


]])

RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.0 战役
#name AC) 下方传来的消息
#displayname |cFF00CCFF3|r - 下层线报 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ad) 战争机器


step
    .goto 2339,31.54,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .target Alleria Windrunner
    .accept 79224 >>接任务: |cRXP_WARN_情报收集|r
step
    #completewith next
    .goto 2339,63.62,52.36
    .zone 2255 >>前往阿兹-卡赫特的洞穴
step
    .goto 2255,55.76,43.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Widow Arak'nai|r交谈
    .turnin 79224 >>交任务: |cRXP_FRIENDLY_情报收集|r
    .target Widow Arak'nai
    .accept 79227 >>接任务: |cRXP_WARN_蛛眼视角|r
step
    .isOnQuest 79227
    .goto 2213,49.73,20.22
    .cast 423519 >>点击|cRXP_PICK_Vizier's Scouting Shadecaster|r|cRXP_WARN_在小屋上. |r
    .timer 2,RP
step
    .isOnQuest 79227
    .goto 2213,78.72,41.78
    .complete 79227,1 --1/1 Umbral Bazaar scouted
    .cast 423519 >>点击|cRXP_PICK_猎人侦察者|r|cRXP_WARN_在小屋上|r
    .timer 2,RP
step
    .isOnQuest 79227
    .goto 2255,64.18,74.20
    .complete 79227,3 --1/1 Twitching Gorge scouted
    .cast 423519 >>点击|cRXP_PICK_General's Scouting Shadecaster|r|cRXP_WARN_在小屋上. |r
    .timer 2,RP
step
    .goto 2213,69.54,71.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .complete 79227,2 --1/1 Eastern Span scouted
    .turnin 79227 >>交任务: |cRXP_FRIENDLY_蛛眼视角|r
    .target Lilian Voss
    .accept 79230 >>接任务: |cRXP_WARN_长廊潜行|r
step
    .goto 2213,69.47,72.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Y'tekhi|r交谈
    .accept 79233 >>接任务: |cRXP_WARN_实验室通行权|r
    .target Y'tekhi
step
    #completewith Central Warehouse investigated
    >>击杀|cRXP_ENEMY_效忠者诱变技师|r和|cRXP_ENEMY_效忠者生物锻造师|r, 从他们身上搜刮 |T1391773:0|t[|cRXP_LOOT_效忠者分泌物|r]
    *使用你的|cRXP_WARN_ExtraActionButton|r to distract nearby patrolling guards if they are in the way.
    .complete 79233,1 --6/6 Loyalist Secretions
    .mob Loyalist Mutagenician
    .mob Loyalist Bio-smith
step
    #completewith next
    #title 进入房屋
    .goto 2213,68.31,80.63,10 >>进入房屋
step
    .goto 2213,68.63,81.57
    >>点击|cRXP_PICK_Cannister of Vile Ooze.|r
    .complete 79230,1 --1/1 Eastern Stockpile investigated
step
    #completewith next
    #title Leave House
    .goto 2213,67.69,79.65,10 >>离开房屋
step
    #label Central Warehouse investigated
    .goto 2213,61.88,89.53
    >>点击|cRXP_PICK_Suspicious Shipping Container.|r
    *Kill |cRXP_ENEMY_Ascension-Crazed Soldier|r
    .complete 79230,2 --1/1 Central Warehouse investigated
    .mob Ascension-Crazed Soldier
step
    #loop
    .goto 2213,54.52,84.64,40,0
    .goto 2213,63.96,87.09,40,0
    .goto 2213,72.17,78.49,40,0
    .goto 2213,68.07,63.29,40,0
    .goto 2213,57.86,62.09,40,0
    >>击杀|cRXP_ENEMY_效忠者诱变技师|r和|cRXP_ENEMY_效忠者生物锻造师|r, 从他们身上搜刮 |T1391773:0|t[|cRXP_LOOT_效忠者分泌物|r]
    *使用你的|cRXP_WARN_ExtraActionButton|r to distract nearby patrolling guards if they are in the way.
    .complete 79233,1 --6/6 Loyalist Secretions
    .mob Loyalist Mutagenician
    .mob Loyalist Bio-smith
step
    #completewith next
    #title 进入房屋
    .goto 2213,56.89,89.48,10 >>进入房屋
    .timer 20,RP
step
    .goto 2213,57.09,91.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Y'tekhi|r交谈
    .turnin 79233 >>交任务: |cRXP_FRIENDLY_实验室通行权|r
    .target Y'tekhi
step
    .goto 2213,56.99,93.35
    #title |cFFFCDC00跟随箭头指引|r
    .complete 79230,3 --1/1 First Ascended's Prison investigated
step
    .goto 2213,56.68,90.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 79230 >>交任务: |cRXP_FRIENDLY_长廊潜行|r
    .target Lilian Voss
    .accept 79237 >>接任务: |cRXP_WARN_创造怪物|r
step
    .goto 2213,56.99,89.14,10,0
    .goto 2213,62.18,77.06
    >>点击|cRXP_PICK_Air Duct|r
    .complete 79237,1 --1/1 Air Duct accessed
step
    .goto 2213,60.95,79.01
    >>点击|cRXP_PICK_Caustic Alchemical Supplies|r
    .complete 79237,3 --1/1 Caustic Alchemical Supplies examined
step
    .goto 2213,63.41,78.89
    >>点击|cRXP_PICK_实验笔记|r
    .complete 79237,4 --1/1 Experiment Notes examined
step
    .goto 2213,62.69,79.88
    >>点击|cRXP_PICK_Discarded Shadecaster|r
    .complete 79237,5 --1/1 Discarded Shadecaster investigated
step
    .goto 2213,63.17,79.62
    >>点击|cRXP_PICK_Escape Line.|r
    .complete 79237,6 --1/1 Escape Line taken
step
    .goto 2213,56.67,90.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 79237 >>交任务: |cRXP_FRIENDLY_创造怪物|r
    .target Lilian Voss
step
    .goto 2213,57.12,91.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Y'tekhi|r交谈
    .accept 79239 >>接任务: |cRXP_WARN_女王的囚链|r
    .target Y'tekhi
step
    .goto 2213,55.65,92.75
    >>点击|cRXP_PICK_Caustic Chemicals|r
    .complete 79239,1,1 --4/4 Caustic Chemicals
step
    .goto 2213,55.53,93.44
    >>点击|cRXP_PICK_Caustic Chemicals|r
    .complete 79239,1,2 --4/4 Caustic Chemicals
step
    .goto 2213,56.06,94.94
    >>点击|cRXP_PICK_Caustic Chemicals|r
    .complete 79239,1,3 --4/4 Caustic Chemicals
step
    .goto 2213,58.11,92.36
    >>点击|cRXP_PICK_Caustic Chemicals|r
    .complete 79239,1,4 --4/4 Caustic Chemicals
step
    .goto 2213,58.19,93.68
    >>点击|cRXP_PICK_Shackle 船锚|r
    .complete 79239,2 --1/1 Neferess's Right Leg Freed
step
    .goto 2213,55.81,93.70
    >>点击|cRXP_PICK_Shackle 船锚|r
    .complete 79239,4 --1/1 Neferess's Left Leg Freed
step
    .goto 2213,57.45,92.73
    >>点击|cRXP_PICK_Shackle 船锚|r
    .complete 79239,6 --1/1 Neferess's Right Arm Freed
step
    .goto 2213,56.74,92.62
    #title |cFFFCDC00跟随箭头指引|r
    *|cRXP_WARN_Relog if you don't get teleported.|r
    .complete 79239,8 --1/1 Neferess Freed
step
    .goto 2213,78.76,57.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 79239 >>交任务: |cRXP_FRIENDLY_女王的囚链|r
    .target Lilian Voss
    .accept 79240 >>接任务: |cRXP_WARN_暴乱特工|r
step
    .goto 2213,78.09,54.81
    >>击败|cRXP_ENEMY_Y'tekhi|r
    .complete 79240,1 --1/1 Y'tekhi subdued
    .mob Y'tekhi
step
    .goto 2213,78.63,40.17
    #title |cFFFCDC00跟随箭头指引|r
    .complete 79240,2 --1/1 Y'tekhi brought to safety
step
    .goto 2213,78.65,39.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 79240 >>交任务: |cRXP_FRIENDLY_暴乱特工|r
    .target Lilian Voss
    .accept 79241 >>接任务: |cRXP_WARN_大动静|r
    .accept 79243 >>接任务: |cRXP_WARN_生产哗变|r
step
    .goto 2255,59.39,75.07
    >>点击|cRXP_PICK_改造后的蛛魔能量核心|r
    .complete 79241,1,1 --6/6 Charges planted
step
    .goto 2255,61.01,74.61
    >>点击|cRXP_PICK_改造后的蛛魔能量核心|r
    .complete 79241,1,2 --6/6 Charges planted
step
    .goto 2255,61.16,73.49
    >>使用你的|cRXP_WARN_ExtraActionButton|r对准|cRXP_ENEMY_Siege Marshal Tekhzok|r并击杀它
    .complete 79243,1 --1/1 Siege Marshal Tekhzok slain
    .mob Siege Marshal Tekhzok
step
    .goto 2255,61.65,72.52
    >>点击|cRXP_PICK_改造后的蛛魔能量核心|r
    .complete 79241,1,3 --6/6 Charges planted
step
    .goto 2255,63.62,71.47
    >>点击|cRXP_PICK_改造后的蛛魔能量核心|r
    .complete 79241,1,4 --6/6 Charges planted
step
    .goto 2255,66.48,70.6
    >>点击|cRXP_PICK_改造后的蛛魔能量核心|r
    .complete 79241,1,5 --6/6 Charges planted
step
    .goto 2255,66.72,69.38
    >>使用你的|cRXP_WARN_ExtraActionButton|r对准|cRXP_ENEMY_皇家军需官泽里克|r并击杀它
    .complete 79243,2 --1/1 Royal Quartermaster Ze'erik slain
    .mob Royal Quartermaster Ze'erik
step
    .goto 2255,66.61,68.16
    >>点击|cRXP_PICK_改造后的蛛魔能量核心|r
    .complete 79241,1,6 --6/6 Charges planted
step
    .goto 2255,67.57,64.79
    >>点击|cRXP_PICK_Dry Webbing|r
    .complete 79241,2 --1/1 Fuse lit
step
    .goto 2255,55.71,44.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 79243 >>交任务: |cRXP_FRIENDLY_生产哗变|r
    .target Lilian Voss
    .turnin 79241 >>交任务: |cRXP_FRIENDLY_大动静|r
    .accept 79244 >>接任务: |cRXP_WARN_下层线报|r
step
    .goto 2255,55.74,43.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Widow Arak'nai|r交谈
    .complete 79244,1 --1/1 Inform the Weaver
    .skipgossipid 121590
    .target Widow Arak'nai
step
    .goto 2255,57.49,41.62
    .zone 2339 >>通过隧道前往多尔诺加尔
step
    .goto 2339,31.54,59.66
    #title |cFFFCDC00跟随箭头指引|r
    .complete 79244,2 --1/1 Report back to Alleria at the Coreway in Dornogal
step
    .goto 2339,31.54,59.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 79244 >>交任务: |cRXP_FRIENDLY_下层线报|r
    .target Alleria Windrunner
]])

RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.0 战役
#name ad) 战争机器
#displayname |cFF00CCFF4|r - 机械参战 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next AE) 黑暗中的光


step
    .goto 2339,31.54,59.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .target Alleria Windrunner
    .accept 79022 >>接任务: |cRXP_WARN_神秘信号|r
step
    #completewith TravelToRingingDeepsMysteriousSignal
    #label AMysteriousSignalA
    .goto 2214,52.11,74.92,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等发言人布林特|r交谈
    .turnin 79022 >>交任务: |cRXP_FRIENDLY_神秘信号|r
    .target High Speaker Brinthe
    .accept 79023 >>接任务: |cRXP_WARN_小小朋友，惊天计划|r
step
    .isOnQuest 79022
    #label TakePortalAzjkahetMysteriousSignal
    #completewith TravelToRingingDeepsMysteriousSignal
    .goto 2339,63.6,52.7
    .zone 2255 >>前往阿兹-卡赫特的传送门
step
    .isOnQuest 79022
    #requires TakePortalAzjkahetMysteriousSignal
    #label TravelToRingingDeepsMysteriousSignal
    .goto 2255,65.65,20.88,80,0
    .goto 2214,45.99,67.61
    .zone 2214 >>前往回响深渊
step
    #requires AMysteriousSignalA
    .goto 2214,52.11,74.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等发言人布林特|r交谈
    .turnin 79022 >>交任务: |cRXP_FRIENDLY_神秘信号|r
    .target High Speaker Brinthe
    .accept 79023 >>接任务: |cRXP_WARN_小小朋友，惊天计划|r
step
    .goto 2214,52.14,74.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_ZZ-01-47|r交谈
    .complete 79023,1 --1/1 Introduce yourself to ZZ-01-47
    .skipgossipid 120640
    .target ZZ-01-47
step
    .goto 2214,52.11,74.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等发言人布林特|r交谈
    .turnin 79023 >>交任务: |cRXP_FRIENDLY_小小朋友，惊天计划|r
    .target High Speaker Brinthe
    .accept 79024 >>接任务: |cRXP_WARN_侦察工厂|r
step
    .goto 2214,52.14,74.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_ZZ-01-47|r交谈
    .complete 79024,1 --1/1 Command ZZ-01-47 to Scout the Facility
    .skipgossipid 121305
    .target ZZ-01-47
step
    .goto 2214,53.79,75.88
    >>使用 |T135788:0|t[Turbo Boost] 并点击|cRXP_PICK_Pipe Grate|r
    .complete 79024,2 --1/1 Pipe Grate Entered
    .timer 3,Roleplay Duration
step
    .goto 2214,53.86,76.92
    #title |cFFFCDC00跟随箭头指引|r
    >>使用 |T135788:0|t[涡轮加速]
    .complete 79024,3 --Scout the Darkfuse leader
step
    .goto 2214,52.37,77.6
    #title |cFFFCDC00跟随箭头指引|r
    >>使用 |T135788:0|t[涡轮加速]
    .complete 79024,4 --Scout the Manufacturing Bay
step
    .goto 2214,53.06,77.71,15,0
    .goto 2214,53.05,78.36
    >>点击|cRXP_PICK_Sewer Grate|r
    .complete 79024,5 --1/1 Sneak through the pipes
    .timer 3,Roleplay Duration
step
    .goto 2214,53.97,79.78
    #title |cFFFCDC00跟随箭头指引|r
    .complete 79024,6 --Scout the Cargo Bay
step
    .goto 2214,54.16,76.50
    >>使用 |T135788:0|t[Turbo Boost] 并点击|cRXP_PICK_Pipe Grate|r
    .complete 79024,7 --1/1 Exit back through the Pipe
step
    >>|cRXP_WARN_离开载具|r
    .complete 79024,8 --Return to Brinthe
step
    .goto 2214,52.11,74.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等发言人布林特|r交谈
    .turnin 79024 >>交任务: |cRXP_FRIENDLY_侦察工厂|r
    .target High Speaker Brinthe
    .accept 79217 >>接任务: |cRXP_WARN_重返基地|r
step
    #completewith next
    #title 进入房屋
    .goto 2214,42.96,33.83,10 >>进入房屋
step
    .goto 2214,42.94,34.23
    #title |cFFFCDC00跟随箭头指引|r
    .complete 79217,1 --Meet Brinthe at her home in Gundargaz
step
    .goto 2214,42.94,34.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等发言人布林特|r交谈
    .turnin 79217 >>交任务: |cRXP_FRIENDLY_重返基地|r
    .target High Speaker Brinthe
    .accept 79025 >>接任务: |cRXP_WARN_双管齐下|r
step
    .goto 2214,42.92,34.21
    >>点击 |cRXP_PICK_Deactivated 作战傀儡|r
    .complete 79025,1 --1/1 Point out the Golem Factory
step
    .goto 2214,42.92,34.23
    >>点击 |cRXP_PICK_Deactivated 作战傀儡|r
    .complete 79025,2 --1/1 Point out the Waterworks
step
    .goto 2214,42.91,34.24
    >>点击 |cRXP_PICK_Deactivated 作战傀儡|r
    .complete 79025,3 --1/1 Point out the Shadowvein Extraction Site
step
    .goto 2214,42.94,34.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等发言人布林特|r交谈
    .turnin 79025 >>交任务: |cRXP_FRIENDLY_双管齐下|r
    .target High Speaker Brinthe
    .accept 79324 >>接任务: |cRXP_WARN_前往水能堡|r
step
    #completewith next
    .isOnQuest 79324
    .goto 2214,42.95,33.86,10 >>离开房屋
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dagran Thaurissan II|r和|cRXP_FRIENDLY_"Zee-Zee"|r交谈
    .turnin 79324 >>交任务: |cRXP_FRIENDLY_前往水能堡|r
    .accept 79026 >>接任务: |cRXP_WARN_水能堡复能|r
    .goto 2214,43.14,42.38
    .target +Dagran Thaurissan II
    .accept 79027 >>接任务: |cRXP_WARN_元素惶恐|r
    .goto 2214,43.12,42.38
    .target +"Zee-Zee"
step
    #completewith 2/2 Waterwheels Activated
    >>击杀 |cRXP_ENEMY_Disturbed 海带|r 和 |cRXP_ENEMY_Disrupted 粘液|r
    .complete 79027,1 --Defeat 元素生物 (100%)
    .mob Disturbed Kelp
    .mob Disrupted Slime
step
    .goto 2214,44.25,46.06
    >>点击|cRXP_PICK_凝结的蜡|r|cRXP_WARN_两次. |r
    .complete 79026,1,1 --2/2 Waterwheels Activated
step
    #label 2/2 Waterwheels Activated
    .goto 2214,41.27,46.33
    >>点击|cRXP_PICK_凝结的蜡|r|cRXP_WARN_两次. |r
    .complete 79026,1,2 --2/2 Waterwheels Activated
step
    #loop
    .goto 2214,42.13,44.06,25,0
    .goto 2214,43.32,43.38,25,0
    .goto 2214,44.15,43.46,25,0
    .goto 2214,43.83,45.61,25,0
    .goto 2214,43.03,46.85,25,0
    >>击杀 |cRXP_ENEMY_Disturbed 海带|r 和 |cRXP_ENEMY_Disrupted 粘液|r
    .complete 79027,1 --Defeat 元素生物 (100%)
    .mob Disturbed Kelp
    .mob Disrupted Slime
step
    .goto 2214,42.07,48.09,10,0
    .goto 2214,42.19,48.68
    >>进入水works区域:|cRXP_WARN_Waterworks|r
    .isOnQuest 79026
    .complete 79026,2 --Delve Entered
step
    #loop
    .goto 2251,47.14,15.59,5,0
    .goto 2251,46.75,15.67,5,0
    .goto 2251,46.38,15.62,5,0
    .isInScenario 2371
    .isOnQuest 79026
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠布鲁克纳|r交谈
    .scenario 6797,1 --1/1 Speak with Foreman Bruknar
    .skipgossipid 120096
step
    .goto 2251,46.76,15.91
    .isInScenario 2371
    .isOnQuest 79026
    >>点击|cRXP_PICK_Chest|r
    .scenario 6798,1 --1/1 Stumping Shoes obtained
step
    .isInScenario 2371
    .isOnQuest 79026
    .goto 2251,46.99,17.89
    >>在|cRXP_FRIENDLY_Air Purifier|r附近使用你的|cRXP_WARN_ExtraActionButton|r
    .scenario 7767,1
step
    .isInScenario 2371
    .isOnQuest 79026
    .goto 2251,46.75,17.28
    >>点击 |cRXP_PICK_空气净化器|r
    .scenario 7767,1
step
    .isInScenario 2371
    .isOnQuest 79026
    #completewith Waxface
    >>如果光环变暗或消失, 请使用|cRXP_WARN_ExtraActionButton|r靠近|cRXP_FRIENDLY_Air Purifier|r来刷新它
step
    .isInScenario 2371
    .isOnQuest 79026
    #hidewindow
    #completewith next
    #loop
    .goto 2251,50.23,21.52,40,0
    .goto 2251,44.1,21.26,40,0
    .goto 2251,46.72,23.48,40,0
    .goto 2251,48.7,25.93,30,0
    .goto 2251,49.73,29.06,30,0
    .goto 2251,46.21,35.97,30,0
    .goto 2251,46.83,51.14,30,0
    .goto 2251,47.8,56.89,30,0
    .goto 2251,47.82,64.32,30,0
    .goto 2251,46.73,68.69,30,0
    .goto 2251,46.79,76.74,30,0
    .goto 2251,46.85,81.64,30,0
    +1
step
    .isInScenario 2371
    .isOnQuest 79026
    >>击杀|cRXP_ENEMY_Kobolds|r小地精, 并使用你的|cRXP_WARN_ExtraActionButton|r(额外动作按钮)在他们的|cRXP_WARN_尸体|r旁. 然后收集齿轮
    .scenario 6799,1
    .scenario 6799,2
    .mob Kobold Mystic
    .mob Kobold Thwacker
    .mob Kobold Taskfinder
    .mob Spitfire Fusetender
    .mob Spitfire Charger
    .mob Cavernous Shrieker
step
    .isInScenario 2371
    .isOnQuest 79026
    .goto 2251,46.88,81.45
    >>击杀|cRXP_ENEMY_Waxface|r
    .scenario 6801,1
    .mob Waxface
step
    .isOnQuest 79026
    .isInScenario 2355
    .goto 2251,50.44,24.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pagsly|r交谈
    .scenario 6776,1
    .skipgossipid 120081
    .target Pagsly
step
    .isOnQuest 79026
    .isInScenario 2355
    .goto 2251,46.76,17.32
    >>点击|cRXP_PICK_空气图腾|r
    .scenario 6776,2
step
    .isOnQuest 79026
    .isInScenario 2355
    .goto 2251,50.28,23.73,10 >>|cRXP_WARN_跟随箭头指引|r
step
    .isOnQuest 79026
    .isInScenario 2355
    .goto 2251,50.28,23.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pagsly|r交谈并保护他
    .skipgossipid 120082
    .scenario 6777,1,1
    .mob Kobold Skullface
    .mob Kobold Mystic
    .target Pagsly
step
    .isOnQuest 79026
    .isInScenario 2355
    .goto 2251,46.73,24.17,20,0
    .goto 2251,49.6,28.99,20,0
    .goto 2251,49.78,34.5,20 >>|cRXP_WARN_跟随箭头指引|r
step
    .isOnQuest 79026
    .isInScenario 2355
    .goto 2251,48.72,40.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pagsly|r交谈并保护他
    .skipgossipid 120082
    .scenario 6777,1,2
    .target Pagsly
    .mob Kobold Thwacker
step
    .isOnQuest 79026
    .isInScenario 2355
    .goto 2251,46.78,44.65,20,0
    .goto 2251,47.72,56.7,20,0
    .goto 2251,46.36,61.56,10 >>|cRXP_WARN_跟随箭头指引|r
step
    .isOnQuest 79026
    .goto 2251,46.36,61.56
    .isInScenario 2355
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pagsly|r交谈并保护他
    .skipgossipid 120082
    .scenario 6777,1,3
    .mob Kobold Skullface
    .mob Kobold Mystic
    .mob Kobold Thwacker
step
    .isOnQuest 79026
    .isInScenario 2355
    .goto 2251,47.76,64.32,20,0
    .goto 2251,48.15,68.73,10 >>|cRXP_WARN_跟随箭头指引|r
step
    .isOnQuest 79026
    .isInScenario 2355
    .goto 2251,48.12,68.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pagsly|r交谈并保护他
    .skipgossipid 120082
    .scenario 6777,1,4
    .mob Kobold Skullface
    .mob Kobold Mystic
    .mob Kobold Thwacker
    .mob Kobold Fusetender
step
    .goto 2251,46.84,70.35,10,0
    .goto 2251,46.85,81.67
    .isInScenario 2355
    .isOnQuest 79026
    >>击杀|cRXP_ENEMY_Waxface|r
    .scenario 6801,1
    .mob Waxface
step
    .isOnQuest 79026
    .goto 2251,46.75,17.29
    >>点击|cRXP_PICK_Air Totem.|r
    .isInScenario 2354,1
    .scenario 6757,2
step
    .isOnQuest 79026
    .goto 2251,47.13,17.98,5,0
    .goto 2251,46.36,17.91,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠布鲁克纳|r交谈
    .isInScenario 2354,2
    .scenario 6757,1
    .skipgossipid 120018
    .target Foreman Bruknar
step
    .isOnQuest 79026
    .goto 2251,47.99,20.68,20,0
    .goto 2251,46.68,24.67,20,0
    .goto 2251,49.67,29.08,20,0
    .goto 2251,49.93,37.05,20,0
    .goto 2251,48.6,41.8,20,0
    .goto 2251,46.81,51.22,20,0
    .goto 2251,47.89,57.11,20,0
    .goto 2251,49.26,60.69,20,0
    .goto 2251,46.94,68.97,20,0
    >>点击|cRXP_PICK_Captured 工人|r
    .isInScenario 2354,2
    .scenario 6758,1
    .target Captured Worker
step
    .goto 2251,46.84,70.35,10,0
    .goto 2251,46.85,81.67
    .isInScenario 2354
    .isOnQuest 79026
    >>击杀|cRXP_ENEMY_Waxface|r
    .scenario 6759,1
    .mob Waxface
step
    .isOnQuest 79026
    .goto 2251,46.08,83.06
    .cast 441550 >>点击 |cRXP_PICK_Obstruction Drain.|r
step
    .goto 2251,46.75,83.5
    >>拉动海带以疏通排水管！击杀|cRXP_ENEMY_Enraged Kelp.|r
    .complete 79026,3 --1/1 Main Drain Restored
    .mob Enraged Kelp
step
    #completewith next
    .zone 2214 >>领取奖励后, 点击你的玩家头像并选择“离开地城”
    .target Leave-O-Bot 7000
step
    .goto 2214,43.08,42.36
    >>点击|cRXP_PICK_Waterworks 主激活装置|r
    .complete 79026,5 --1/1 Main Drain Restored
step
    .goto 2214,43.14,42.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dagran Thaurissan II|r交谈
    .turnin 79027 >>交任务: |cRXP_FRIENDLY_元素惶恐|r
    .turnin 79026 >>交任务: |cRXP_FRIENDLY_水能堡复能|r
    .accept 79325 >>接任务: |cRXP_WARN_影脉采掘|r
    .target Dagran Thaurissan II
step
    .goto 2214,51.53,41.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_ZZ-01-47|r交谈
    .turnin 79325 >>交任务: |cRXP_FRIENDLY_影脉采掘|r
    .target ZZ-01-47
    .accept 79028 >>接任务: |cRXP_WARN_需要更多晶体矿|r
    .timer 16,Roleplay Duration
step
    .goto 2214,51.53,41.11
    >>等待剧情发展
    .complete 79028,1 --1/1 Listen to Dagran's Report
step
    .isOnQuest 79028
    .goto 2214,52.26,36.99
    .cast 451809 >>点击|cRXP_PICK_Power Substation Console|r
    .timer 19,RP
step
    >>在管道室前方等待
    .complete 79028,2 --1/1
    .goto 2214,51.93,37.23
step
    #completewith next
    .isOnQuest 79028
    .goto 2214,51.51,37.29,10 >>进入管道房间
    .timer 17,RP
step
    #title |cFFFCDC00等待剧情发展|r
    .complete 79028,3 --1/1 Pipe Room Located
    .goto 2214,51.51,37.28
step
    #loop
    .goto 2214,51.51,37.29,8,0
    .goto 2214,51.51,36.95,8,0
    .goto 2214,51.76,36.57,8,0
    .link https://gyazo.com/c13935fb0ec1a58e7a863c7508b45032 >>点击此处查看解决方案
    >>中 -> 下 -> 上
    .complete 79028,4 --1/1 Supply Water to the Shadowvein Boilers
step
    .goto 2214,51.82,37.24,10,0
    .goto 2214,52.26,36.97
    >>点击|cRXP_PICK_Power Substation Console|r
    .complete 79028,5 --1/1 Power Substation Restarted
step
    .isOnQuest 79028
    #title Leave House
    .goto 2214,52.19,38.79,10 >>离开房屋
step
    .goto 2214,51.82,39.28
    >>使用位于|cRXP_FRIENDLY_Cleaned Crusher|r附近的|cRXP_WARN_ExtraActionButton|r
    .complete 79028,6,1 --5/5 Infested Crushers Decontaminated
    .mob Infested Discharge
step
    .goto 2214,52.62,39.42
    >>使用位于|cRXP_FRIENDLY_Cleaned Crusher|r附近的|cRXP_WARN_ExtraActionButton|r
    .complete 79028,6,2 --5/5 Infested Crushers Decontaminated
    .mob Infested Discharge
step
    .goto 2214,54.60,38.19
    >>使用位于|cRXP_FRIENDLY_Cleaned Crusher|r附近的|cRXP_WARN_ExtraActionButton|r
    .complete 79028,6,3 --5/5 Infested Crushers Decontaminated
    .mob Infested Discharge
step
    .goto 2214,55.40,40.27
    >>使用位于|cRXP_FRIENDLY_Cleaned Crusher|r附近的|cRXP_WARN_ExtraActionButton|r
    .complete 79028,6,4 --5/5 Infested Crushers Decontaminated
    .mob Infested Discharge
step
    .goto 2214,55.12,41.01
    >>点击 |cRXP_PICK_采矿小车轨道|r
    .complete 79028,7 --1/1 Mining Cart Track Cleared
step
    .goto 2214,55.12,42.12
    >>使用位于|cRXP_FRIENDLY_Cleaned Crusher|r附近的|cRXP_WARN_ExtraActionButton|r
    .complete 79028,6,5 --5/5 Infested Crushers Decontaminated
    .mob Infested Discharge
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_ZZ-01-47|r|cRXP_WARN_就在你身边. |r
    .turnin 79028 >>交任务: |cRXP_FRIENDLY_需要更多晶体矿|r
    .target ZZ-01-47
    .accept 80145 >>接任务: |cRXP_WARN_主矿脉线|r
step
    .isOnQuest 80145
    #title Enter Mine
    .goto 2214,54.39,35.9,10 >>进入矿坑
step
    .goto 2214,54.41,33.91
    >>点击|cRXP_PICK_Activation Lever|r
    .complete 80145,1 --1/1 Cave Crushers activated
step
    .goto 2214,54.53,33.74
    >>击杀|cRXP_ENEMY_熔岩巨蟒|r
    .complete 80145,2 --1/1 Magma Serpent defeated
    .mob Magma Serpent
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_ZZ-01-47|r|cRXP_WARN_就在你身边. |r
    .complete 80145,3 --1/1 Speak to ZZ-01-47
    .target ZZ
    .skipgossipid 121561
step
    .goto 2214,54.50,33.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_ZZ-01-47|r交谈
    .turnin 80145 >>交任务: |cRXP_FRIENDLY_主矿脉线|r
    .target ZZ-01-47
    .accept 80517 >>接任务: |cRXP_WARN_回到原点|r
step
    #completewith next
    .goto 2214,54.54,33.55
    .deathskip >>在熔岩中死亡, 并在灵魂医者处重生
step
    .goto 2214,52.11,74.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等发言人布林特|r交谈
    .turnin 80517 >>交任务: |cRXP_FRIENDLY_回到原点|r
    .target High Speaker Brinthe
    .accept 79029 >>接任务: |cRXP_WARN_大肆破坏|r
step
    #loop
    .goto 2214,53.47,76.94,30,0
    .goto 2214,54.65,77.07,30,0
    .goto 2214,55.24,78.43,30,0
    .goto 2214,54.79,79.47,30,0
    .goto 2214,54.01,78.71,30,0
    .goto 2214,53.32,77.93,30,0
    >>点击|cRXP_PICK_地精电池|r和|cRXP_PICK_小桶|r和|cRXP_PICK_废弃傀儡|r和|cRXP_PICK_烤肉架|r. 击杀来袭的|cRXP_ENEMY_敌人|r
    .complete 79029,1 --Mayhem Caused (100%)
    .mob Irritated Salvager
    .mob Vindictive Technician
    .mob Foreman-in-Training
    .target Derelict Golem
step
    .isOnQuest 79029
    #title 进入房屋
    .goto 2214,52.72,77.62,10 >>进入房屋
step
    .goto 2214,51.90,77.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布林瑟|r交谈
    .complete 79029,2 --1/1 Speak to Brinthe
    .target Brinthe
    .skipgossipid 121606
step
    .goto 2214,52.12,78.02
    >>击杀|RXP_ENEMY_Supervisor Radlock|r以造成额外伤害, 并将他移动到火激光区域中
    .complete 79029,3 --1/1 Facility Activated and Secured
    .mob Supervisor Radlock
step
    .goto 2214,51.90,77.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等发言人布林特|r交谈
    .turnin 79029 >>交任务: |cRXP_FRIENDLY_大肆破坏|r
    .target High Speaker Brinthe
    .accept 79030 >>接任务: |cRXP_WARN_代言人之声|r
step
    .isOnQuest 79030
    .zone 2339 >>前往多尔诺加尔
step
    .goto 2339,31.54,59.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 79030 >>交任务: |cRXP_FRIENDLY_代言人之声|r
    .target Alleria Windrunner
]])

RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.0 战役
#name AE) 黑暗中的光
#displayname |cFF00CCFF5|r - 黑暗中的一缕明光 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next AF) 挥之不去的阴影


step
    .goto 2339,31.56,59.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .accept 78941 >>接任务: |cRXP_WARN_狂澜在即|r
    .target Alleria Windrunner
step
    #completewith next
    .goto 2339,38.93,59.89,30,0
    .goto 2339,48.18,60.84,30,0
    .goto 2339,49.94,63.8,30,0
    .goto 2339,49.78,71.69,30,0
    .goto 2339,49.78,71.69,30,0
    .goto 2339,37.7,74.39,30,0
    .goto 2214,35.82,32.58,30,0
    .goto 2214,35.54,31.54,30,0
    .goto 2214,35.71,29.79,30,0
    .goto 2214,37.34,28.33,30,0
    .goto 2214,38.12,28.33,30,0
    .goto 2214,36.38,24.36,30 >>前往霍洛fall(黑落)
step
    .goto 2215,71.64,59.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_钢击将军|r交谈
    .turnin 78941 >>交任务: |cRXP_FRIENDLY_狂澜在即|r
    .target General Steelstrike
    .accept 78942 >>接任务: |cRXP_WARN_卡兹阿加之力|r
    .accept 78943 >>接任务: |cRXP_WARN_钢铁与烈焰|r
step
    #hidewindow
    #completewith Algari forces rallied
    #loop
    .goto 2215,72.53,60.03,30,0
    .goto 2215,72.07,60.63,30,0
    .goto 2215,71.53,59.54,30,0
    .goto 2215,71.06,60.23,30,0
    .goto 2215,71.39,60.99,30,0
    .goto 2215,71.71,61.38,30,0
    .goto 2215,72.16,61.81,30,0
    .goto 2215,72.06,62.39,30,0
    .goto 2215,72.21,63.56,30,0
    .goto 2215,71.71,63.92,30,0
    .goto 2215,71.16,61.93,30,0
    .goto 2215,70.74,61.85,30,0
    +1
step
    #completewith next
    >>尽可能同时在多个附近的阿尔加里友军部队旁使用|T134229:0|t[阿拉希战号], 以达到最大效果
    .complete 78943,1 --20/20 Algari forces rallied
    .use 217309
    .target Unbound Stormrider
    .target Unbound Fighter
    .target Hallowfall Lightblade
    .target Veteran Flamecaller
step
    >>击杀|cRXP_ENEMY_蛛魔|r
    .complete 78942,1 --Stem the Nerubian Tide (100%)
    .mob Maddened Hierophant
    .mob Chitin Ravager
    .mob Agitated Chitterer
    .mob Loyal Shadeweaver
    .mob Nerubian Crypt Lord
    .mob Nerubian Hulk
step
    #label Algari forces rallied
    >>尽可能同时在多个附近的阿尔加里友军部队旁使用|T134229:0|t[阿拉希战号], 以达到最大效果
    .complete 78943,1 --20/20 Algari forces rallied
    .use 217309
    .target Unbound Stormrider
    .target Unbound Fighter
    .target Hallowfall Lightblade
    .target Veteran Flamecaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r和|r吉安娜·普罗德摩尔|r交谈
    .turnin 78943 >>交任务: |cRXP_FRIENDLY_钢铁与烈焰|r
    .goto 2215,68.56,64.21
    .target +Thrall
    .accept 78950 >>接任务: |cRXP_WARN_断其臂膀|r
    .goto 2215,68.55,64.16
    .target +Lady Jaina Proudmoore
step
    .goto 2215,66.72,64.89
    >>击杀|cRXP_ENEMY_Nix'k the Wicked|r
    .complete 78950,1 --1/1 Nix'k the Wicked slain
    .mob Nix'k the Wicked
step
    .goto 2215,67.82,67.58
    >>击杀|cRXP_ENEMY_Kaz'vik|r
    .complete 78950,2 --1/1 Kaz'vik slain
    .mob Kaz'vik
step
    .goto 2215,64.74,68.40
    >>击杀|cRXP_ENEMY_Anub'ata|r
    .complete 78950,3 --1/1 Anub'ata slain
    .mob Anub'ata
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Faerin Lothar|r和|cRXP_FRIENDLY_安度因·乌瑞恩国王|r交谈
    .turnin 78942 >>交任务: |cRXP_FRIENDLY_卡兹阿加之力|r
    .goto 2215,64.58,61.79
    .target +Faerin Lothar
    .turnin 78950 >>交任务: |cRXP_FRIENDLY_断其臂膀|r
    .accept 78948 >>接任务: |cRXP_WARN_黑暗中的一缕明光|r
    .goto 2215,64.53,61.79
    .target +Anduin Wrynn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安度因·乌瑞恩国王|r交谈
    .complete 78948,1 --1/1 Speak with Anduin to chase down Xal'atath
    .skipgossipid 122377
    .target Anduin Wrynn
-- step
--     #completewith ScenarioXalatah
--     .isOnQuest 78948
--     .complete 78948,2 --Defeat Xal'atath
step
    .goto 2330,78.19,47.28,15,0
    .goto 2330,76.41,38.32,15,0
    .goto 2330,70.21,31.48,15,0
    .goto 2330,64.81,32.97
    .scenario 7008,2 >>点击|cRXP_PICK_North 火盆|r, 然后击杀出现的敌人
    .isOnQuest 78948
    .mob Forming Whispers
    .mob Writhing Shade
    .mob Hazzk the Ascended
step
    .isOnQuest 78948
    .goto 2330,71.32,32.52,15,0
    .goto 2330,76.58,39.5,15,0
    .goto 2330,78.22,56.55,15,0
    .goto 2330,70.22,69.8,15,0
    .goto 2330,62.88,74.36
    .scenario 7008,1 >>点击|cRXP_PICK_South Brazier|r并杀死出现的敌人
    .mob Forming Whispers
    .mob Nightcaller Velys
    .mob Writhing Shade
step
    .isOnQuest 78948
    .goto 2330,71.4,69.61,40,0
    .goto 2330,74.29,63.9,40,0
    .goto 2330,78.88,54.94,40,0
    .goto 2330,67.14,50.03,40,0
    .goto 2330,60.3,50.65,40,0
    .goto 2330,56.57,51.21
    .scenario 7009,1 >>击杀|r|cRXP_ENEMY_Shadesworn 碎石蟹|r, 并点击中间的|r|cRXP_PICK_Fountain|r
    .mob Shadesworn Crusher
    .mob Forming Whispers
    .mob Writhing Shade
    .mob Whispering Monstrosity
step
    .goto 2330,56.57,51.21
    .isOnQuest 78948
    .scenario 7010,1 >>点击|cRXP_PICK_Oil 火盆|r
step
    .goto 2330,47.9,61.65,30,0
    .goto 2330,38.03,54.21,30,0
    .goto 2330,27.49,55.87
    .isOnQuest 78948
    .scenario 7012,1 >>击杀|cRXP_ENEMY_Broken Queen|r
    .mob The Broken Queen
step
    -- #label ScenarioXalatah
    .isOnQuest 78948
    .goto 2330,27.49,55.87
    #title |cFFFCDC00跟随箭头指引|r
    .scenario 7013,1
    .complete 78948,2 --Defeat Xal'atath
step
    .goto 2215,35.93,35.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 78948 >>交任务: |cRXP_FRIENDLY_黑暗中的一缕明光|r
    .target Alleria Windrunner
    .accept 83503 >>接任务: |cRXP_WARN_返回多恩诺嘉尔|r
step
    .goto 2339,39.86,26.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅里克斯|r交谈
    .complete 83503,1 --1/1 Report back to Merrix in Dornogal
    .target Merrix
    .skipgossipid 123407
step
    #title Use |cFFFCDC00Earthen Teleporter|r
    .goto 2339,40.74,22.38
    .cast 431519 >>点击|cRXP_PICK_Earthen Teleporter|r
step
    .goto 2339,25.33,66.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安度因·乌瑞恩国王|r交谈
    .turnin 83503 >>交任务: |cRXP_FRIENDLY_返回多恩诺嘉尔|r
    .target Anduin Wrynn
]])

RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.0 战役
#name AF) 挥之不去的阴影
#displayname |cFF00CCFF6|r - 萦绕暗影 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ag) 塞壬岛战役

step
    .goto 2339,42.36,26.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alleria Windrunner|r交谈, 地点在|cRXP_WARN_Dornogal|r
    .accept 82690 >>接任务: |cRXP_WARN_萦绕暗影|r
    .target Alleria Windrunner
step
    #completewith next
    .gossipoption 124142 >>要快速旅行, 请打开地下城查找器并排队进入追随者地下城“黎明破晓”. 进入后, 与|cRXP_FRIENDLY_General Steelstrike|r交谈
    .target General Steelstrike
step
    .goto 2215,62.98,67.51
    #title 跟随箭头指引
    >>在霍尔法尔找到|cRXP_FRIENDLY_奥维娜|r
    .complete 82690,1 --1/1 Return to where Alleria sensed Black Blood in Hallowfall
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔薇娜和汉南|r交谈
    .turnin 82690 >>交任务: |cRXP_FRIENDLY_萦绕暗影|r
    .accept 82692 >>接任务: |cRXP_WARN_使命的代价|r
    .accept 82693 >>接任务: |cRXP_WARN_拦路虎|r
    .goto 2215,62.98,67.51
    .accept 82691 >>接任务: |cRXP_WARN_无暇喘息|r
    .goto 2215,62.99,67.59
    .target Orweyna
    .target Hannan
step
    #completewith Strange Flower
    >>击杀|cRXP_ENEMY_Fleshmite|r和|cRXP_ENEMY_Jawcrawler|r. 击杀|cRXP_ENEMY_Seeping Crustbreaker|r, |cRXP_WARN_如果它们未被错误影响_|r
    .complete 82691,1 --Seeping creatures culled (100%)
    .mob Seeping Fleshmite
    .mob Seeping Jawcrawler
    .mob Seeping Crustbreaker
step
    .goto 2215,64.42,67.95
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Strange Flower|r
    .complete 82692,1,1 --6/6 Strange Flower examined
step
    .goto 2215,64.47,68.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_On'hiea|r交谈
    .complete 82692,2,1 --3/3 Haranir evacuated
    .skipgossipid 123067
    .mob On'hiea
step
    #completewith next
    >>击杀|cRXP_ENEMY_Bloodcrust巨兽|r
    .complete 82693,1 --1/1 Bloodcrust Behemoth slain
    .mob Bloodcrust Behemoth
step
    .goto 2215,65.98,65.55,40,0
    .goto 2215,66.65,64.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_绿语者纳拉伊罗|r交谈
    .complete 82692,2,2 --3/3 Haranir evacuated
    .skipgossipid 123068
    .mob Greenspeaker Na'layro
step
    .goto 2215,66.63,64.84
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Strange Flower|r
    .complete 82692,1,2 --6/6 Strange Flower examined
step
    .goto 2215,65.95,65.56
    >>击杀|cRXP_ENEMY_Bloodcrust巨兽|r
    .complete 82693,1 --1/1 Bloodcrust Behemoth slain
    .mob Bloodcrust Behemoth
step
    .goto 2215,65.4,65.09
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Strange Flower|r
    .complete 82692,1,3 --6/6 Strange Flower examined
step
    .goto 2215,64.58,64.33
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Strange Flower|r
    .complete 82692,1,4 --6/6 Strange Flower examined
step
    .goto 2215,64.2,64.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈莉娅|r交谈
    .complete 82692,2,3 --3/3 Haranir evacuated
    .skipgossipid 123066
    .mob Ney'leia
step
    .goto 2215,64.16,64.83
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Strange Flower|r
    .complete 82692,1,5 --6/6 Strange Flower examined
step
    #label Strange Flower
    .goto 2215,63.39,67.02
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Strange Flower|r
    .complete 82692,1,6 --6/6 Strange Flower examined
step
    #loop
    .goto 2215,62.94,68.48,40,0
    .goto 2215,64.38,68.9,40,0
    .goto 2215,64.96,67.86,40,0
    .goto 2215,67.05,67.42,40,0
    .goto 2215,66.18,65.54,40,0
    .goto 2215,64.36,64.81,40,0
    .goto 2215,63.97,66.82,40,0
    >>击杀|cRXP_ENEMY_Fleshmite|r和|cRXP_ENEMY_Jawcrawler|r. 击杀|cRXP_ENEMY_Seeping Crustbreaker|r, |cRXP_WARN_如果它们未被错误影响_|r
    .complete 82691,1 --Seeping creatures culled (100%)
    .mob Seeping Fleshmite
    .mob Seeping Jawcrawler
    .mob Seeping Crustbreaker
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hannan|r和|cRXP_FRIENDLY_Orweyna|r交谈
    .turnin 82691 >>交任务: |cRXP_FRIENDLY_无暇喘息|r
    .goto 2215,63,67.58
    .target +Hannan
    .turnin 82692 >>交任务: |cRXP_FRIENDLY_使命的代价|r
    .turnin 82693 >>交任务: |cRXP_FRIENDLY_拦路虎|r
    .accept 82694 >>接任务: |cRXP_WARN_团结与独行|r
    .goto 2215,62.97,67.5
    .target +Orweyna
step
    .goto 2215,58.83,46.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈南|r交谈 
    .complete 82694,1 --1/1 Find Hannan beneath the Fangs in Hallowfall
step
    .goto 2215,58.84,46.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈南|r交谈
    .complete 82694,2 --1/1 Speak to Hannan
    .skipgossipid 123866
    .target Hannan
step
    .goto 2215,24.90,51.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔薇娜|r交谈
    .turnin 82694 >>交任务: |cRXP_FRIENDLY_团结与独行|r
    .target Orweyna
    .accept 82695 >>接任务: |cRXP_WARN_那个声音|r
step
    .goto 2215,24.9,51.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔薇娜|r交谈
    .complete 82695,1 --1/1 Speak to Orweyna to begin (Optional)
    .skipgossipid 124955
    .target Orweyna
step
    .goto 2215,24.3,51.69,25,0
    .goto 2215,24.36,51.19,25,0
    .goto 2215,24.7,50.98,25,0
    .goto 2215,25.06,50.99,25,0
    .goto 2215,24.62,50.66,25,0
    >>击杀5波敌人, 包括|cRXP_ENEMY_Oozing Visions|r和|cRXP_ENEMY_Terrifying Visions|r
    .complete 82695,2 --1/1 Defend Orweyna during her meditation
    .mob Oozing Vision
    .mob Terrifying Vision
step
    .goto 2215,24.90,51.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔薇娜|r交谈
    .turnin 82695 >>交任务: |cRXP_FRIENDLY_那个声音|r
    .target Orweyna
    .accept 82696 >>接任务: |cRXP_WARN_深窟中的喧鸣|r
--Travel
step
    .goto 2214,54.58,64.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔薇娜(位于回响深渊)|r交谈
    .turnin 82696 >>交任务: |cRXP_FRIENDLY_深窟中的喧鸣|r
    .target Orweyna
step
    .goto 2214,54.30,64.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒙特·加兹鲁维|r交谈
    .accept 82697 >>接任务: |cRXP_WARN_帮手好找|r
    .target Monte Gazlowe
step
    .goto 2214,58.36,75.04
    >>击杀|cRXP_ENEMY_Haxle Drillbit|r. 击败后可获得 |T134939:0|t[|cRXP_LOOT_Opportunity Work Permit|r]
    .complete 82697,1 --1/1 Opportunity Work Permit taken
    .mob Haxle Drillbit
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Monte Gazlowe|r和|cRXP_FRIENDLY_Orweyna|r交谈
    .turnin 82697 >>交任务: |cRXP_FRIENDLY_帮手好找|r
    .accept 82699 >>接任务: |cRXP_WARN_嘿，出什么事儿了？|r
    .goto 2214,60.41,79.77
    .target +Monte Gazlowe
    .accept 82698 >>接任务: |cRXP_WARN_错乱孕育敌意|r
    .goto 2214,60.30,79.77
    .target +Orweyna
step
    #completewith Question Harried Workers
    >>击杀|cRXP_ENEMY_Haywire Excavator|r. |cRXP_WARN_请注意不要跳过它们|r
    .complete 82698,1 --4/4 Haywire Excavator slain
    .mob Haywire Excavator
step
    .goto 2214,58.20,82.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Harried Worker|r交谈
    .complete 82699,1,1 --4/4 Question Harried Workers
    .mob Harried Worker
    .skipgossipid 123125
step
    .goto 2214,57.62,82.4
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_油桶|r. |cRXP_WARN_|cRXP_ENEMY_激活的残余物|r将会出现|r
    .complete 82699,2,1 --6/6 Used Fuel Drum examined
    .mob Activated Remnants
step
    .goto 2214,58.42,83.88
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_油桶|r. |cRXP_WARN_|cRXP_ENEMY_激活的残余物|r将会出现|r
    .complete 82699,2,2 --6/6 Used Fuel Drum examined
    .mob Activated Remnants
step
    .goto 2214,57.30,84.72
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_油桶|r. |cRXP_WARN_|cRXP_ENEMY_激活的残余物|r将会出现|r
    .complete 82699,2,3 --6/6 Used Fuel Drum examined
    .mob Activated Remnants
step
    .goto 2214,57.10,85.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Harried Worker|r交谈
    .complete 82699,1,2 --4/4 Question Harried Workers
    .mob Harried Worker
    .skipgossipid 123125
step
    .goto 2214,57.85,87.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Harried Worker|r交谈
    .complete 82699,1,3 --4/4 Question Harried Workers
    .mob Harried Worker
    .skipgossipid 123125
step
    .goto 2214,58.11,88.25
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_油桶|r. |cRXP_WARN_|cRXP_ENEMY_激活的残余物|r将会出现|r
    .complete 82699,2,4 --6/6 Used Fuel Drum examined
    .mob Activated Remnants
step
    .goto 2214,57.98,89.46
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_油桶|r. |cRXP_WARN_|cRXP_ENEMY_激活的残余物|r将会出现|r
    .complete 82699,2,5 --6/6 Used Fuel Drum examined
    .mob Activated Remnants
step
    #label Question Harried Workers
    .goto 2214,57.47,90.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Harried Worker|r交谈
    .complete 82699,1,4 --4/4 Question Harried Workers
    .mob Harried Worker
    .skipgossipid 123125
step
    #completewith next
    .goto 2214,56.69,90.37,30,0
    .goto 2214,56.89,92.26,40,0
    .goto 2214,55.78,91.3,40,0
    .goto 2214,60.68,88
    >>击杀|cRXP_ENEMY_Haywire Excavator|r. |cRXP_WARN_请注意不要跳过它们|r
    .complete 82698,1 --4/4 Haywire Excavator slain
    .mob Haywire Excavator
step
    .goto 2214,60.68,88
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_油桶|r. |cRXP_WARN_|cRXP_ENEMY_激活的残余物|r将会出现|r
    .complete 82699,2,6 --6/6 Used Fuel Drum examined
    .mob Activated Remnants
step
    #loop
    .goto 2214,56.02,81.9,40,0
    .goto 2214,58.41,84.2,40,0
    .goto 2214,57.64,85.97,40,0
    .goto 2214,57.80,90.34,40,0
    .goto 2214,56.63,90.41,40,0
    .goto 2214,56.90,92.33,40,0
    .goto 2214,55.76,91.43,40,0
    >>击杀|cRXP_ENEMY_Haywire Excavator|r. |cRXP_WARN_请注意不要跳过它们|r
    .complete 82698,1 --4/4 Haywire Excavator slain
    .mob Haywire Excavator
step
    .goto 2214,56.23,87.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“剃刀”雷吉克|r|cRXP_WARN_在屋子里|r交谈
    .turnin 82699 >>交任务: |cRXP_FRIENDLY_嘿，出什么事儿了？|r
    .target Renzik "The Shiv"
    .turnin 82698 >>交任务: |cRXP_FRIENDLY_错乱孕育敌意|r
    .accept 82700 >>接任务: |cRXP_WARN_易毁设计|r
step
    .goto 2214,54.26,86.41
    >>击杀|cRXP_ENEMY_Haywire MEK IV|r
    .complete 82700,1 --1/1 Haywire MEK IV slain
    .mob Haywire MEK IV
step
    .goto 2214,60.30,79.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔薇娜|r交谈
    .turnin 82700 >>交任务: |cRXP_FRIENDLY_易毁设计|r
    .target Orweyna
    .accept 82701 >>接任务: |cRXP_WARN_蝙蝠大战全世界|r
step
    .goto 2214,60.30,79.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔薇娜|r交谈
    .complete 82701,1 --1/1 Speak to Orweyna
    .skipgossipid 123172 
    .target Orweyna
step
    #title Fly to the top of the tower
    .goto 2214,64.27,80
    >>使用 |T135788:0|t[翻转]|cRXP_WARN_获得更高的移动速度|r
    *Use |T252188:0|t[Listen In] |cRXP_WARN_on the Tower near the Circle|r.
    *Use |T132320:0|t[Sneak] |cRXP_WARN_to avoid detection|r
    *|cRXP_WARN_Be aware that goblins will try to kill you|r.
    .complete 82701,2,1 --4/4 "Listen In" to Gather Intel
step
    .goto 2214,58.94,80.78
    >>使用 |T135788:0|t[翻转]|cRXP_WARN_获得更高的移动速度|r 
    *Use |T252188:0|t[Listen In] |cRXP_WARN_on the Bridge near the Circle|r.
    *Use |T132320:0|t[Sneak] |cRXP_WARN_to avoid detection|r
    *|cRXP_WARN_Be aware that goblins will try to kill you|r.
    .complete 82701,2,2 --4/4 "Listen In" to Gather Intel
step
    .goto 2214,59.30,78.82
    >>使用 |T135788:0|t[翻转]|cRXP_WARN_获得更高的移动速度|r 
    *Use |T252188:0|t[Listen In] |cRXP_WARN_near the building near the Circle|r.
    *Use |T132320:0|t[Sneak] |cRXP_WARN_to avoid detection|r
    *|cRXP_WARN_Be aware that goblins will try to kill you|r.
    .complete 82701,2,3 --4/4 "Listen In" to Gather Intel
step
    .goto 2214,61.33,77.27
    >>使用 |T135788:0|t[翻转]|cRXP_WARN_获得更高的移动速度|r 
    *Use |T252188:0|t[Listen In] |cRXP_WARN_near the building near the Circle|r.
    *Use |T132320:0|t[Sneak] |cRXP_WARN_to avoid detection|r
    *|cRXP_WARN_Be aware that goblins will try to kill you|r.
    .complete 82701,2,4 ----4/4 "Listen In" to Gather Intel
step
    .goto 2214,62.52,78.42
    >>使用 |T135788:0|t[翻转]|cRXP_WARN_获得更高的移动速度|r 
    *Use |T252188:0|t[Listen In] |cRXP_WARN_near the Cave Wall|r.
    *Use |T132320:0|t[Sneak] |cRXP_WARN_to avoid detection|r
    *|cRXP_WARN_Be aware that goblins will try to kill you|r.
    .complete 82701,3 --1/1 Listen In at the Cave Wall
step
    .goto 2214,56.83,86.47
    >>使用 |T135788:0|t[翻转]|cRXP_WARN_获得更高的移动速度|r
    *Use |T252188:0|t[Listen In] |cRXP_WARN_on the building near the circle|r.
    *|cRXP_WARN_Dodge the obstacles in the sky to avoid getting stunned|r.
    .complete 82701,4 --1/1 Reach Foreman's Office
    .mob Blinding Glowmite
    .mob Hazardous Heli
step
    .goto 2214,56.48,86.81
    >>使用 |T252188:0|t[|cRXP_WARN_ExtraActionButton|r]
    .complete 82701,5 --1/1 Find Information
step
    .goto 2214,60.30,79.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔薇娜|r交谈
    .turnin 82701 >>交任务: |cRXP_FRIENDLY_蝙蝠大战全世界|r
    .target Orweyna
step
    .goto 2214,60.41,79.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒙特·加兹鲁维|r交谈
    .accept 82702 >>接任务: |cRXP_WARN_朋友便是收获|r
    .target Monte Gazlowe
--Travel
step
    .goto 2339,42.37,26.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈(在多诺加尔)
    .turnin 82702 >>交任务: |cRXP_FRIENDLY_朋友便是收获|r
    .target Alleria Windrunner
step
    .goto 2339,42.29,27.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔薇娜|r交谈
    .accept 84701 >>接任务: |cRXP_WARN_代言人|r
    .target Orweyna
step
    .goto 2339,35.49,81.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格尼·铜须|r交谈
    .turnin 84701 >>交任务: |cRXP_FRIENDLY_代言人|r
    .target Magni Bronzebeard
]])
