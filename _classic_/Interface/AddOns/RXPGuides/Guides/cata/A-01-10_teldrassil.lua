local _,addon = ...
if addon.gameVersion < 40000 or addon.player.faction == 'Horde' then return end
RXPGuides.RegisterGuide([[
#version 1
#group RXP 大地的裂变 1-80 (联盟) << cata
#group RestedXP 熊猫人之谜 1-60 (联盟) << mop
#cata
#mop
#name 1-6 幽影谷
#displayname 1-6 幽影谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 6-10 泰达希尔
#defaultfor NightElf
<<Alliance
step
    .goto 460,45.61,74.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .accept 28713 >>接任务: |cRXP_LOOT_自然的平衡|r
	.target Ilthalaine
step
    .goto 460,42.44,76.29,20,0
    .goto 460,46.63,79.57,20,0
    .goto 460,50.63,76.87,20,0
    .goto 460,42.44,76.29
    >>击杀|cRXP_ENEMY_夜刃豹幼崽|r
    .complete 28713,1 --6/6 Young Nightsaber slain
	.mob Young Nightsaber
step
    .goto 460,45.62,74.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .turnin 28713 >>交任务: |cRXP_FRIENDLY_自然的平衡|r
    .accept 28714 >>接任务: |cRXP_WARN_腐化的魔苔|r
	.target Ilthalaine
step
    .goto 460,45.94,72.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦利萨尔·鹿盔|r交谈
    .accept 28715 >>接任务: |cRXP_WARN_恶魔窃贼|r
	.target Melithar Staghelm
step
    #completewith next
    >>击杀|cRXP_ENEMY_小劣魔|r和|cRXP_ENEMY_劣魔|r. 击败它们后可获得其掉落的|cRXP_LOOT_魔苔|r
    .complete 28714,1 --6/6 Fel Moss
	.mob Grell
	.mob Grellkin
step
    .goto 460,36.66,79.84,15,0
    .goto 460,34.82,80.53,15,0
    .goto 460,31.70,74.85,15,0
    .goto 460,30.66,70.55,20,0
    .goto 460,36.66,79.84
    >>战利品|cRXP_LOOT_Melithar's Stolen Bags|r在地面上
    .complete 28715,1 --5/5 Melithar's Stolen Bags
step
    .goto 460,36.66,79.84,15,0
    .goto 460,34.82,80.53,15,0
    .goto 460,31.70,74.85,15,0
    .goto 460,30.66,70.55,20,0
    .goto 460,36.66,79.84
    >>击杀|cRXP_ENEMY_小劣魔|r和|cRXP_ENEMY_劣魔|r. 击败它们后可获得其掉落的|cRXP_LOOT_魔苔|r
    .complete 28714,1 --6/6 Fel Moss
	.mob Grell
	.mob Grellkin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r和|cRXP_FRIENDLY_麦利萨尔·鹿盔|r交谈
    .turnin 28714 >>交任务: |cRXP_FRIENDLY_腐化的魔苔|r
    .target +Ilthalaine
    .goto 460,46.28,73.48
    .turnin 28715 >>交任务: |cRXP_FRIENDLY_恶魔窃贼|r
	.target +Melithar Staghelm
    .goto 460,45.93,72.86
    .accept 3116 >>接任务: |cRXP_LOOT_简易符记|r << Warrior
    .accept 3117 >>接任务: |cRXP_LOOT_风化符记|r << Hunter
    .accept 3118 >>接任务: |cRXP_LOOT_密文符记|r << Rogue
    .accept 3119 >>接任务: |cRXP_LOOT_神圣符记|r << Priest
    .accept 3120 >>接任务: |cRXP_LOOT_绿色符记|r << Druid
    .accept 26841 >>接任务: |cRXP_WARN_禁戒魔符|r << Mage
    --class quests are auto from either npc
step << Priest/Mage
    #completewith next
    .goto 1438/1,761.79999,10415.60059,10 >>沿着坡道向上前往|cRXP_FRIENDLY_珊达|r << Priest
    .goto 1438/1,761.79999,10415.60059,10 >>沿着坡道向上前往|cRXP_FRIENDLY_莱恩达|r << Mage
step << Priest
    .goto 1438/1,801.60004,10458.79980
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊达|r交谈
    .turnin 3119 >>交任务: |cRXP_FRIENDLY_神圣符记|r
    .accept 26949 >>接任务: |cRXP_WARN_治愈伤者|r << cata
    .accept 26949 >>接任务: |cRXP_WARN_护井者索兰尼亚|r << !cata
    .train 2061 >>训练 |T135907:0|t[治疗之光] << cata
    .target Shanda
step << Priest cata
    .goto 1438/1,797.70001,10464.60059
    >>|cRXP_WARN_对你身旁的受伤哨兵施放[快速治疗]共计5次|r
    .complete 26949,1 -- Heal Wounded Sentinel
    .target Wounded Sentinel
step << Priest !cata
    .goto 1438/1,813.50000,10417.29980,-1
    .goto 1438/1,808.29999,10412.70020,-1
    .goto 1438/1,803.90002,10407.60059,-1
    .goto 1438/1,798.60004,10402.70020,-1
    .goto 1438/1,793.29999,10397.10059,-1
    .goto 1438/1,787.40002,10393.00000,-1
    .goto 1438/1,781.90002,10389.90039,-1
    >>|cRXP_WARN_施放|r |T136207:0|t[暗影之言：痛苦] |cRXP_WARN_在|r |cRXP_ENEMY_训练假人上触发5次|r
    .complete 26949,2 -- Heal Wounded Sentinel
    .target Training Dummy
step << Priest
    .goto 1438/1,801.60004,10458.79980
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊达|r交谈
    .turnin 26949 >>交任务: |cRXP_FRIENDLY_治愈伤者|r << cata
    .turnin 26949 >>交任务: |cRXP_FRIENDLY_护井者索兰尼亚|r << !cata
    .accept 28723 >>接任务: |cRXP_WARN_月神女祭司|r
    .target Shanda
step << Mage
    .goto 1438/1,804.79999,10456.29980
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱恩达|r交谈
    .turnin 26841 >>交任务: |cRXP_FRIENDLY_禁戒魔符|r
    .accept 26940 >>接任务: |cRXP_WARN_奥术飞弹|r
    .train 5143 >>训练 |T136096:0|t[奥术飞弹] << cata
    .target Rhyanda
step << Mage
    .goto 1438/1,813.50000,10417.29980,-1
    .goto 1438/1,808.29999,10412.70020,-1
    .goto 1438/1,803.90002,10407.60059,-1
    .goto 1438/1,798.60004,10402.70020,-1
    .goto 1438/1,793.29999,10397.10059,-1
    .goto 1438/1,787.40002,10393.00000,-1
    .goto 1438/1,781.90002,10389.90039,-1
    >>|cRXP_WARN_对|cRXP_ENEMY_训练假人|r施放 |T135812:0|t[火球术]|cRXP_WARN_, 直到触发 |T135731:0|t[奥术飞弹！]|cRXP_WARN_效果, 然后施放 |T136096:0|t[奥术飞弹]|cRXP_WARN_. 重复此过程两次|r
    .complete 26940,1 << cata -- Practice Arcane Missles (1)
    .complete 26940,2 << !cata -- Practice Arcane Missles (1)
    .mob Training Dummy
step << Mage
    #completewith next
    .goto 1438/1,761.79999,10415.60059,10 >>沿着坡道向上前往|cRXP_FRIENDLY_莱恩达|r
step << Mage
    .goto 1438/1,804.79999,10456.29980
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱恩达|r交谈
    .turnin 26940 >>交任务: |cRXP_FRIENDLY_奥术飞弹|r
    .accept 28723 >>接任务: |cRXP_WARN_月神女祭司|r
    .target Rhyanda
step << Warrior/Rogue
    #completewith next
    .goto 1438/1,797.20001,10458.90039,15,0
    .goto 1438/1,794.60004,10506.90039,10 >>前往奥莉希亚所在地 << Warrior
    .goto 1438/1,794.60004,10506.90039,10 >>前往|cRXP_FRIENDLY_弗拉胡恩·影语者|r所在地 << Rogue
step << Warrior
    .goto 1438/1,778.10004,10526.60059
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莉希亚|r交谈
    .turnin 3116 >>交任务: |cRXP_FRIENDLY_简易符记|r
    .accept 26945 >>接任务: |cRXP_WARN_学习新技能|r
	.train 100 >>训练 |T132337:0|t[冲锋] << cata
    .target Alyissia
step << Warrior
    .goto 1438/1,808.79999,10460.79980
    >>|cRXP_WARN_施放|r|T132337:0|t[冲锋]|cRXP_WARN_在|r|cRXP_ENEMY_训练假人|r
    .complete 26945,1 << cata -- Practice Charge (1)
    .complete 26945,2 << !cata -- Practice Charge (1)
    .mob Training Dummy
step << Warrior
    .goto 1438/1,778.10004,10526.60059
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莉希亚|r交谈
    .turnin 26945 >>交任务: |cRXP_FRIENDLY_学习新技能|r
    .accept 28723 >>接任务: |cRXP_WARN_月神女祭司|r
    .target Alyissia
step << Rogue
    .goto 1438/1,778.00000,10519.20020
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗拉胡恩·影语者|r交谈
    .turnin 3118 >>交任务: |cRXP_FRIENDLY_密文符记|r
    .accept 26946 >>接任务: |cRXP_WARN_潜行者的优势|r
	.train 2098 >>训练 |T132292:0|t[刺骨] << cata
    .target Frahun Shadewhisper
step << Rogue
    .goto 1438/1,808.79999,10486.00000,-1
    .goto 1438/1,805.60004,10481.79980,-1
    >>|cRXP_WARN_对|cRXP_ENEMY_训练假人|r施放 |T136189:0|t[邪恶打击]|cRXP_WARN_, 然后连续施放 |T132292:0|t[刺骨]|cRXP_WARN_3 次|r
    .complete 26946,1 << cata -- Practice Eviscerate (1)
    .complete 26946,2 << !cata -- Practice Eviscerate (1)
    .mob Training Dummy
step << Rogue
    .goto 1438/1,778.00000,10519.20020
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗拉胡恩·影语者|r交谈
    .turnin 26946 >>交任务: |cRXP_FRIENDLY_潜行者的优势|r
    .accept 28723 >>接任务: |cRXP_WARN_月神女祭司|r
    .target Frahun Shadewhisper
step << Hunter
    .goto 1438/1,778.00000,10448.10059
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿亚娜·远途|r交谈
    .turnin 3117 >>交任务: |cRXP_FRIENDLY_风化符记|r
    .accept 26947 >>接任务: |cRXP_WARN_林中的训练|r
	.train 56641 >>训练 |T132213:0|t[稳固射击] << cata
    .target Ayanna Everstride
step << Hunter
    .goto 1438/1,801.20001,10454.90039
    >>|cRXP_WARN_对|cRXP_ENEMY_训练假人|r施放|T132213:0 |t[稳固射击]5次|r
    .complete 26947,1 << cata-- Practice Steady Shot (1)
    .complete 26947,2 << !cata -- Practice Steady Shot (1)
    .mob Training Dummy
step << Hunter
    .goto 1438/1,778.00000,10448.10059
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿亚娜·远途|r交谈
    .turnin 26947 >>交任务: |cRXP_FRIENDLY_林中的训练|r
    .accept 28723 >>接任务: |cRXP_WARN_月神女祭司|r
    .target Ayanna Everstride
step << Druid
    #completewith next
    .goto 1438/1,797.20001,10458.90039,15 >>前往|cRXP_FRIENDLY_玛丹特·硬木|r所在地
step << Druid
    .goto 1438/1,816.00000,10485.90039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛丹特·硬木|r交谈
    .turnin 3120 >>交任务: |cRXP_FRIENDLY_绿色符记|r
    .accept 26948 >>接任务: |cRXP_WARN_回春之触|r << cata
    .accept 26948 >>接任务: |cRXP_WARN_回春之触|r << !cata
	.train 774 >>训练 |T136081:0|t[复苏] << cata
    .target Mardant Strongoak
step << Druid cata
    .goto 1438/1,769.79999,10436.29980,-1
    .goto 1438/1,788.29999,10417.90039,-1
    >>|cRXP_WARN_|cRXP_WARN_请选中|r |cRXP_ENEMY_受伤的哨兵|r并使用|r|T136081:0|t[复苏]|r
    .complete 26948,1 -- Heal Wounded Sentinel
    .target Wounded Sentinel
step << !cata Druid
    .goto 460,46.003,56.584
    >>|cRXP_WARN_|cRXP_WARN_请选中|r |cRXP_ENEMY_训练假人|r并使用|r |T136096:0|t[月火术]|r
    .complete 26948,2 -- Heal Wounded Sentinel
    .target Training Dummy
step << Druid
    .goto 1438/1,816.00000,10485.90039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛丹特·硬木|r交谈
    .turnin 26948 >>交任务: |cRXP_FRIENDLY_回春之触|r << cata
    .turnin 26948 >>交任务: |cRXP_FRIENDLY_回春之触|r << !cata
    .accept 28723 >>接任务: |cRXP_WARN_月神女祭司|r
    .target Mardant Strongoak
step
    .goto 460,42.49,50.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .turnin 28723 >>交任务: |cRXP_FRIENDLY_月神女祭司|r
    .accept 28724 >>接任务: |cRXP_LOOT_埃沃隆的解药|r
	.target Dentaria Silverglade
step
    .goto 460,41.87,49.37,5,0
    .goto 460,40.77,47.27,5,0
    .goto 460,39.54,52.27,5,0
    .goto 460,40.18,52.64,5,0
    .goto 460,40.80,53.32,5,0
    .goto 460,42.28,52.68,5,0
    .goto 460,43.60,51.83,5,0
    .goto 460,41.87,49.37
    >>拾取地面上的|cRXP_LOOT_Moonpetal Lilies|r
    .complete 28724,1 -- 7/7 Moonpetal Lily
step
    .goto 460,42.49,50.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .turnin 28724 >>交任务: |cRXP_FRIENDLY_埃沃隆的解药|r
    .accept 28725 >>接任务: |cRXP_LOOT_森林守护者|r
	.target Dentaria Silverglade
step
	#completewith next
	.goto 58,56.34,27.51,5 >>|cRXP_WARN_进入洞穴后等待塔琳德拉出现|r
step
    .goto 58,56.34,27.51
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往箭头位置与|cRXP_FRIENDLY_塔琳德拉|r交谈. 几秒后她会出现
    .turnin 28725 >>交任务: |cRXP_FRIENDLY_森林守护者|r
    .accept 28726 >>接任务: |cRXP_WARN_树林蜘蛛的腐蚀|r
	.target Tarindrella
step
    .goto 58,41.27,33.22,10,0
    .goto 58,34.81,15.50,15,0
    .waypoint 58,46.33,41.34
    >>击杀|cRXP_ENEMY_树林蜘蛛|r
    .complete 28726,1 --12/12 Webwood Spider slain
	.mob Webwood Spider
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与你旁边的|cRXP_FRIENDLY_塔琳德拉|r交谈
    .turnin 28726 >>交任务: |cRXP_FRIENDLY_树林蜘蛛的腐蚀|r
    .accept 28727 >>接任务: |cRXP_WARN_邪恶的触摸|r
	.target Tarindrella
step
    .goto 58,34.56,23.87,0
    .goto 58,42.81,19.50,10,0
    .goto 58,45.02,31.37
    >>击杀|cRXP_ENEMY_邪恶的基塞伊斯|r
    .complete 28727,1 --1/1 Githyiss the Vile slain
	.mob Githyiss the Vile
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与你旁边的|cRXP_FRIENDLY_塔琳德拉|r交谈
    .turnin 28727,1 >>交任务: |cRXP_FRIENDLY_邪恶的触摸|r
    .accept 28728 >>接任务: |cRXP_WARN_未来的征兆|r
	.target Tarindrella
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .goto 460,42.50,50.50
    .turnin 28728 >>交任务: |cRXP_FRIENDLY_未来的征兆|r
    .accept 28729 >>接任务: |cRXP_WARN_泰达希尔：艾泽拉斯之冠|r
	.target Dentaria Silverglade
step
    #completewith next
    +|cRXP_WARN_要为任务物品启用快捷键绑定, 请按照以下步骤操作:|r
    *[1] Press the |cRXP_WARN_Escape key.|r
    *[2] Select |cRXP_WARN_Options.|r
    *[3] Navigate to |cRXP_WARN_Keybindings.|r
    *[4] Within |cRXP_WARN_Keybindings|r, find |cRXP_WARN_RestedXP Guides.|r
    *[5] Select and bind the |cRXP_WARN_Active Buttons.|r
step
    .goto 460,50.13,34.49
    .use 5185 >>|cRXP_WARN_使用|r|T134776:0|t[水晶瓶]|cRXP_WARN_在月亮井|r
    .complete 28729,1 --1/1 Filled Crystal Phial
step
    .goto 460,42.49,50.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .turnin 28729 >>交任务: |cRXP_FRIENDLY_泰达希尔：艾泽拉斯之冠|r
    .accept 28730 >>接任务: |cRXP_WARN_珍贵的水|r
	.target Dentaria Silverglade
step
    .goto 460,41.85,63.54,15,0
    .goto 460,46.45,53.43,15,0
    .goto 460,44.44,56.47,15,0
    .goto 460,45.20,60.69,15,0
    .goto 460,48.01,58.75,15,0
    .goto 460,48.14,54.36,15,0
    .goto 460,47.16,55.95
    >>走上树的坡道
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特纳隆·雷拳|r交谈
    .turnin 28730 >>交任务: |cRXP_FRIENDLY_珍贵的水|r
    .accept 28731 >>接任务: |cRXP_WARN_泰达希尔：传递信息|r
	.target Tenaron Stormgrip
step
    .goto 460,54.57,84.78
	>>|cRXP_WARN_从树上跳下来. 你有缓降效果, 不会摔死|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯萨努斯|r交谈
    .accept 2159 >>接任务: |cRXP_LOOT_多兰纳尔的货物|r
	.target Porthannius
]])

RXPGuides.RegisterGuide([[

#version 1
#group RXP 大地的裂变 1-80 (联盟) << cata
#group RestedXP 熊猫人之谜 1-60 (联盟) << mop
#cata
#mop
#name 6-10 泰达希尔
#displayname 6-10 泰达希尔 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 10-18 黑海岸
#defaultfor NightElf

<<Alliance

step
    .goto 57,59.56,49.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .accept 488 >>接任务: |cRXP_LOOT_赛恩的要求|r
	.target Zenn Foulhoof
step
    #completewith next
    >>击杀|cRXP_ENEMY_树林潜伏者|r. 掠夺他们以获取|cRXP_LOOT_树林蜘蛛丝|r
    >>击杀|cRXP_ENEMY_夜刃豹|r. 击败它们后可获得其|cRXP_LOOT_夜刃豹的牙齿|r
    >>击杀 |cRXP_ENEMY_巨翼枭|r. 从它们身上获取 |cRXP_LOOT_巨翼枭的羽毛|r
    >>|cRXP_WARN_稍后您将有更多机会完成此任务|r
    .complete 488,3 --2/2 Webwood Spider Silk
    .mob +Webwood Lurker
    .complete 488,1 --2/2 Nightsaber Fang
    .mob +Nightsaber
    .complete 488,2 --2/2 Strigid Owl Feather
    .mob +Strigid Owl
step
    .goto 57,55.56,49.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .accept 2438 >>接任务: |cRXP_LOOT_翡翠摄梦符|r
	.target Tallonkai Swiftroot
step << !NightElf
    #completewith next
    .goto 57,55.48,50.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲德利奥|r交谈
    .fp Dolanaar >>获取多兰纳尔的飞行路径
	.target Fidelio
step
    .goto 57,55.70,51.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .accept 475 >>接任务: |cRXP_LOOT_烦恼之风|r
	.target Athridas Bearmantle
step
    .goto 57,55.37,52.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板凯达米尔|r交谈
    .turnin 2159,1 >>交任务: |cRXP_FRIENDLY_多兰纳尔的货物|r
	.target Innkeeper Keldamyr
step
    #completewith next
    .goto 57,55.36,52.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板凯达米尔|r交谈
    .home >>将你的[炉石]设置为多兰纳尔
	.target Innkeeper Keldamyr
step
	#completewith next
    .goto 57,56.00,52.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊兰尼斯·影花|r交谈
    .train 2366 >>学习 |T136065:0|t[草药学]
	.skipgossip 47420,1,1,1
	.target Iranis Shadebloom
step
    .goto 57,56.00,52.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊兰尼斯·影花|r交谈
    .train 2575 >>训练 |T136248:0|t[采矿]
	.skipgossip 47420,2,3,2
	.target Iranis Shadebloom
step << Warrior cata
    .goto 57,55.887,51.720
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
    .trainer >>训练你的职业法术
    .target Kyra Windblade
step << Mage cata
    .goto 57,55.816,51.389
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉恩蒂|r交谈
    .trainer >>训练你的职业法术
    .target Irriende
step << Priest cata
    .goto 57,55.319,49.594
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
    .trainer >>训练你的职业法术
    .target Laurna Morninglight
step << Rogue cata
    .goto 57,56.027,52.534
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
    .trainer >>训练你的职业法术
    .target Jannok Breezesong
step << Hunter cata
    .goto 57,56.284,51.973
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
    .trainer >>训练你的职业法术
    .target Jannok Breezesong
step
    .goto 57,55.82,53.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 28731 >>交任务: |cRXP_FRIENDLY_泰达希尔：传递信息|r
    .accept 929 >>接任务: |cRXP_WARN_大地之冠|r
	.target Corithras Moonrage
step << Druid cata
    .goto 57,55.650,53.771
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔|r交谈
    .trainer >>训练你的职业法术
    .target Kal
step
    #completewith TeldrassilEmeraldDreamcatcher
    >>击杀|cRXP_ENEMY_树林潜伏者|r. 掠夺他们以获取|cRXP_LOOT_树林蜘蛛丝|r
    >>击杀|cRXP_ENEMY_夜刃豹|r. 击败它们后可获得其|cRXP_LOOT_夜刃豹的牙齿|r
    >>击杀 |cRXP_ENEMY_巨翼枭|r. 从它们身上获取 |cRXP_LOOT_巨翼枭的羽毛|r
    .complete 488,3 --2/2 Webwood Spider Silk
    .mob +Webwood Lurker
    .complete 488,1 --2/2 Nightsaber Fang
    .mob +Nightsaber
    .complete 488,2 --2/2 Strigid Owl Feather
    .mob +Strigid Owl
step
    .goto 57,61.92,50.69
    .use 5619 >>|cRXP_WARN_使用|r|T134721:0|t[翡翠瓶] |cRXP_WARN_在月亮井|r
    .complete 929,1 --1/1 Filled Jade Phial
step
    .goto 57,64.73,51.70,5,0
    .goto 57,64.90,51.61,5,0
    .goto 57,64.59,51.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖洛拉斯·塔文斯伦|r交谈
    .turnin 475 >>交任务: |cRXP_FRIENDLY_烦恼之风|r
    .accept 476 >>接任务: |cRXP_LOOT_瘤背熊怪的堕落|r
	.target Gaerolas Talvethren
step
    #label TeldrassilEmeraldDreamcatcher
    .goto 57,66.10,52.10
    >>打开|cRXP_PICK_Tailonkai's Dresser|r. 从其中拾取|cRXP_LOOT_翡翠摄梦符|r
    .complete 2438,1 --1/1 Emerald Dreamcatcher
step
    #completewith next
    .deathskip >>在灵魂医者处死亡并重生
    .subzoneskip 186
step
    .goto 57,55.82,53.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 929 >>交任务: |cRXP_FRIENDLY_大地之冠|r
	.target Corithras Moonrage
step
    .goto 57,55.69,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .turnin 476 >>交任务: |cRXP_FRIENDLY_瘤背熊怪的堕落|r
	.target Athridas Bearmantle
step
    .goto 57,55.56,50.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tallonkai|r交谈
    .turnin 2438 >>交任务: |cRXP_FRIENDLY_翡翠摄梦符|r
    .accept 2459 >>接任务: |cRXP_LOOT_噬梦者菲罗斯塔|r
	.target Tallonkai
step
    #xprate >1.59
    #optional
    .maxlevel 10,Teldskip
step
    #loop
    .goto 57,57.48,48.54,50,0
    .goto 57,58.21,49.79,50,0
    .goto 57,58.23,52.16,50,0
    .goto 57,59.97,53.47,50,0
    .goto 57,61.28,51.69,50,0
    .goto 57,60.21,50.03,50,0
    .goto 57,57.48,48.54,50,0
    >>击杀|cRXP_ENEMY_树林潜伏者|r. 掠夺他们以获取|cRXP_LOOT_树林蜘蛛丝|r
    >>击杀|cRXP_ENEMY_夜刃豹|r. 击败它们后可获得其|cRXP_LOOT_夜刃豹的牙齿|r
    >>击杀 |cRXP_ENEMY_巨翼枭|r. 从它们身上获取 |cRXP_LOOT_巨翼枭的羽毛|r
    .complete 488,3 --2/2 Webwood Spider Silk
    .mob +Webwood Lurker
    .complete 488,1 --2/2 Nightsaber Fang
    .mob +Nightsaber
    .complete 488,2 --2/2 Strigid Owl Feather
    .mob +Strigid Owl
step
    .isQuestComplete 488
    .goto 57,59.52,49.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 488 >>交任务: |cRXP_FRIENDLY_赛恩的要求|r
	.target Zenn Foulhoof
step
    #completewith next
    >>击杀|cRXP_ENEMY_瘤背秘法师|r
    .complete 2459,1 --7/7 Gnarlpine Mystic slain
	.mob Gnarlpine Mystic
step
    .goto 57,67.26,46.83
    >>击杀|cRXP_ENEMY_噬梦者菲罗斯塔|r. 从他身上搜刮|cRXP_LOOT_塔隆凯的宝石|r
    .complete 2459,2 --1/1 Tallonkai's Jewel
	.mob Ferocitas the Dream Eater
step
    .goto 57,66.88,46.87,40,0
    .goto 57,65.76,46.40,40,0
    .goto 57,65.75,44.83,40,0
    .goto 57,67.26,46.83
    >>击杀|cRXP_ENEMY_瘤背秘法师|r
    >>|cRXP_WARN_几乎完成时将生命值降至很低, 之后你将死亡跳过|r
    .complete 2459,1 --7/7 Gnarlpine Mystic slain
	.mob Gnarlpine Mystic
step
    #completewith next
    .goto 57,66.13,45.25,25,0
    .deathskip >>在灵魂医者处死亡并重生
step
    .goto 57,55.55,49.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 2459 >>交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r
	.target Tallonkai Swiftroot
step << Priest cata
    .goto 57,55.319,49.594
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
    .trainer >>训练你的职业法术
    .target Laurna Morninglight
step
    .goto 57,55.72,50.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .accept 489 >>接任务: |cRXP_LOOT_寻求救赎！|r
	.target Syral Bladeleaf
step << Warrior cata
    .goto 57,55.887,51.720
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
    .trainer >>训练你的职业法术
    .target Kyra Windblade
step << Mage cata
    .goto 57,55.816,51.389
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉恩蒂|r交谈
    .trainer >>训练你的职业法术
    .target Irriende
step << Rogue cata
    .goto 57,56.027,52.534
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
    .trainer >>训练你的职业法术
    .target Jannok Breezesong
step << Hunter cata
    .goto 57,56.284,51.973
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
    .trainer >>训练你的职业法术
    .target Jannok Breezesong
step << Druid cata
    .goto 57,55.650,53.771
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔|r交谈
    .trainer >>训练你的职业法术
    .target Kal
step
#loop
    .goto 57,55.94,55.82,20,0
    .goto 57,55.30,56.98,20,0
    .goto 57,55.32,57.04,20,0
    .goto 57,54.22,53.89,20,0
    .goto 57,56.51,55.80,20,0
    .goto 57,57.18,55.55,20,0
    .goto 57,55.94,55.82,20,0
    .goto 57,55.94,55.82,0
    >>拾取地面上的魔锥果
    .complete 489,1 --3/3 Fel Cone
step
    .goto 57,59.51,49.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 489 >>交任务: |cRXP_FRIENDLY_寻求救赎！|r
	.target Zenn Foulhoof
step
    .goto Teldrassil,55.77,50.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .target Syral Bladeleaf
    .accept 13946 >>接任务: |cRXP_WARN_自然的报复|r
step
    .goto 57,55.55,49.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .accept 932 >>接任务: |cRXP_LOOT_扭曲的仇恨|r
	.target Tallonkai Swiftroot
step
#completewith melenas
    .goto 57,54.45,45.43,40 >>向北前往洞穴
    .subzoneskip 258--Fel Rock
step
    #label ireroot
    #sticky
    .goto 57,51.82,43.85
    .use 46716 >>|cRXP_WARN_使用|r|T134217:0|t[怒根之种]|cRXP_WARN_来击杀洞穴内的|cRXP_ENEMY_劣魔|r|r
    .complete 13946,1 --12/12 Fel Rock grellkin killed with Ireroot Seeds
step
#label melenas
    .goto 57,51.82,43.85
    >>击杀|cRXP_ENEMY_迈雷纳斯|r. 击败他后搜刮他的|cRXP_LOOT_头|r
    .complete 932,1 --Collect Melenas' Head (x1)
    .mob Lord Melenas
step
    #requires ireroot
    #completewith next
    .hs >>炉石传送至多兰纳尔
    .cooldown item,6948,>2,1
step
    .goto 57,55.77,50.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .target Syral Bladeleaf
    .turnin 13946 >>交任务: |cRXP_FRIENDLY_自然的报复|r
step
    .goto 57,55.55,49.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 932 >>交任务: |cRXP_FRIENDLY_扭曲的仇恨|r
	.target Tallonkai Swiftroot
step
    #xprate >1.59
    #optional
    .maxlevel 10,Teldskip
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r和|cRXP_FRIENDLY_哨兵凯拉·星歌|r交谈
    .accept 483 >>接任务: |cRXP_WARN_唤醒圣物|r
    .target +Athridas Bearmantle
    .goto 57,55.70,51.99
    .accept 13945 >>接任务: |cRXP_WARN_常驻的危险|r
    .target +Sentinel Kyra Starsong
    .goto 57,55.656,51.991
step
    #completewith sleepingd
    >>|cRXP_WARN_击杀路上遇到的任意类型|r|cRXP_ENEMY_熊怪|r, 前往|r|cRXP_FRIENDLY_奥本·怒爪|r
    .complete 13945,1
    .mob Gnarlpine Shaman
	.mob Gnarlpine Defender
	.mob Gnarlpine Augur
step
    #completewith next
    .goto 57,48.61,47.92,100,0
    .goto 57,46.03,47.99,100,0
    .goto 57,45.488,50.760,25 >>进入树屋内的隧道
    .subzoneskip 262
step
    #label sleepingd
    .goto 57,45.038,53.480
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥本·怒爪|r交谈
    .target Oben Rageclaw
    .accept 2541 >>接任务: |cRXP_WARN_沉睡的德鲁伊|r
step
    #label shamans
    #sticky
    >>击杀|cRXP_ENEMY_瘤背萨满祭司|r. 掠夺他们以获取|cRXP_LOOT_萨满巫毒符咒|r
    .complete 2541,1 --|1/1 Shaman Voodoo Charm
    .mob Gnarlpine Shaman
step
    #sticky
    #requires shamans
    #label furbolgs
    >>击杀|cRXP_ENEMY_熊怪|r
    .complete 13945,1
    .mob Gnarlpine Shaman
	.mob Gnarlpine Defender
	.mob Gnarlpine Augur
--Gossip Ids:
--exit 37751
--raven claw 37753
--black feather quill 37754
--Sapphire of the sky 37755
--Rune of nesting 37756
--TODO: check on beta if gossip id match
step
    .goto 61,54.999,75.209
    >>|cRXP_WARN_沿着小路深入班尼希尔墓穴. 跑过上层的桥|r
    >>打开|r|cRXP_PICK_巢穴之箱|r. 从中获取|r|cRXP_LOOT_筑巢符文|r
    >>|cRXP_WARN_你也可以与|cRXP_FRIENDLY_女猎手哨兵|r同伴交谈, 她会为你指引方向|r
    .complete 483,4 --|1/1 Rune of Nesting
    .target Sentinel Huntress
    .skipgossipid 37756
step
    .goto 61,51.956,86.565
    >>|cRXP_WARN_前往最底层|r
    >>打开|cRXP_PICK_黑羽之箱|r, 从中获取|cRXP_LOOT_黑色羽毛笔|r
    >>|cRXP_WARN_你也可以与|cRXP_FRIENDLY_女猎手哨兵|r同伴交谈, 她会为你指引方向|r
    .complete 483,2 --|1/1 Black Feather Quill
step
    .goto 61,49.887,36.749
    >>|cRXP_WARN_前往中央大殿|r
    >>打开|cRXP_PICK_天空之箱|r, 从中获取|cRXP_LOOT_天蓝宝石|r
    >>|cRXP_WARN_你也可以与|cRXP_FRIENDLY_女猎手哨兵|r同伴交谈, 她会为你指引方向|r
    .complete 483,3 --|1/1 Sapphire of Sky
step
    .goto 61,64.380,19.281
    >>|cRXP_WARN_上到中央平台, 向东跑过桥|r
    >>打开|cRXP_PICK_鸦爪之箱|r. 从中拾取|cRXP_LOOT_鸦爪神符|r
    >>|cRXP_WARN_你也可以与|cRXP_FRIENDLY_女猎手哨兵|r同伴交谈, 她会为你指引方向|r
    .complete 483,1 --|1/1 Raven Claw Talisman
step
    .goto 57,45.053,53.464
    >>前往隧道出口
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥本·怒爪|r交谈
    .target Oben Rageclaw
    .turnin 2541 >>交任务: |cRXP_FRIENDLY_沉睡的德鲁伊|r
    .accept 2561 >>接任务: |cRXP_WARN_利爪德鲁伊|r
    .skipgossipid 37751
step
    .goto 57,45.581,52.704
    >>|cRXP_WARN_跑过另一边的桥, 等待锁着的门自动开启|r
    >>击杀|cRXP_ENEMY_怒爪|r
    .use 8149 >>|cRXP_WARN_使用|r|T132502:0|t[巫毒咒符], |cRXP_WARN_目标: |rRXP_ENEMY_怒爪|r的尸体|r
    .complete 2561,1 --|
    .mob Rageclaw
step
    .goto 57,45.053,53.464
    >>前往隧道出口
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥本·怒爪|r交谈
    .target Oben Rageclaw
    .turnin 2561 >>交任务: |cRXP_FRIENDLY_利爪德鲁伊|r
step
    .isQuestComplete 483
    #completewith next
    .hs >>炉石传送至多兰纳尔
    .cooldown item,6948,>2,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r和|cRXP_FRIENDLY_哨兵凯拉·星歌|r交谈
    .turnin 483 >>交任务: |cRXP_FRIENDLY_唤醒圣物|r
    .accept 486 >>接任务: |cRXP_WARN_大槌乌萨尔|r
    .target +Athridas Bearmantle
    .goto 57,55.70,51.99
    .turnin 13945 >>交任务: |cRXP_FRIENDLY_常驻的危险|r
    .target +Sentinel Kyra Starsong
    .goto 57,55.656,51.991
step << Warrior cata
    .goto 57,55.887,51.720
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
    .trainer >>训练你的职业法术
    .target Kyra Windblade
step << Mage cata
    .goto 57,55.816,51.389
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉恩蒂|r交谈
    .trainer >>训练你的职业法术
    .target Irriende
step << Priest cata
    .goto 57,55.319,49.594
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
    .trainer >>训练你的职业法术
    .target Laurna Morninglight
step << Rogue cata
    .goto 57,56.027,52.534
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
    .trainer >>训练你的职业法术
    .target Jannok Breezesong
step << Hunter cata
    .goto 57,56.284,51.973
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
    .trainer >>训练你的职业法术
    .target Jannok Breezesong
step << Druid cata
    .goto 57,55.650,53.771
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔|r交谈
    .trainer >>训练你的职业法术
    .target Kal
step
    .goto 57,49.351,44.672
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    .target Moon Priestess Amara
    .accept 487 >>接任务: |cRXP_LOOT_达纳苏斯之路|r
step
    #sticky
    #label ambushers
    .goto 57,50.578,36.548,0,0
    >>在穿越山路时击杀|cRXP_ENEMY_瘤背伏击者|r
    .complete 487,1 --|8/8 Gnarlpine Ambusher slain
    .mob Gnarlpine Ambusher
step
    .goto 57,51.693,39.805
    >>|cRXP_WARN_沿着坡道向上走, 到达山顶的洞穴|r
    >>击杀|cRXP_ENEMY_大槌乌萨尔|r
    .complete 486,1 --|1/1 Ursal the Mauler slain
    .mob Ursal the Mauler
step
    .goto 57,49.359,44.663
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    .target Moon Priestess Amara
    .turnin 487 >>交任务: |cRXP_FRIENDLY_达纳苏斯之路|r
step
    #completewith next
    #requires ambushers
    .deathskip >>在多兰纳尔死亡并重生
step
    #requires ambushers
    .goto 57,55.715,51.981
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .target Athridas Bearmantle
    .turnin 486 >>交任务: |cRXP_FRIENDLY_大槌乌萨尔|r
step
    #optional
    .maxlevel 10,Teldskip
step
    .goto 57,55.759,50.467
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .target Syral Bladeleaf
    .accept 997 >>接任务: |cRXP_LOOT_德纳兰的泥土|r
step
    .goto 57,59.929,59.738
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .target Denalan
    .turnin 997 >>交任务: |cRXP_FRIENDLY_德纳兰的泥土|r
    .accept 918 >>接任务: |cRXP_LOOT_林精的种子|r
    .accept 919 >>接任务: |cRXP_LOOT_林精的新芽|r
step
    #sticky
    #label fruit1
    .goto 57,57.689,63.063
	>>点击|cRXP_PICK_奇怪的果树|r
    .accept 930 >>接任务: |cRXP_LOOT_发光的水果|r
step
    #loop
    .goto 57,57.689,63.063,55,0
    .goto 57,57.249,56.903,55,0
    .goto 57,60.263,58.219,55,0
    .goto 57,57.249,56.903,0
    .goto 57,60.263,58.219,0
    .goto 57,57.689,63.063,0
    >>击杀|cRXP_ENEMY_林精|r. 击杀后搜刮其掉落的|cRXP_LOOT_种子|r
    >>拾取地面上的林精的新芽
    .complete 918,1 --Collect Timberling Seed (x8)
    .complete 919,1 --Collect Timberling Sprout (x12)
    .mob Timberling
step
    #requires fruit1
    .goto 57,59.929,59.738
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .target Denalan
    .turnin 918 >>交任务: |cRXP_FRIENDLY_林精的种子|r
    .turnin 919 >>交任务: |cRXP_FRIENDLY_林精的新芽|r
    .accept 922 >>接任务: |cRXP_LOOT_雷利亚·绿树|r
step
    .goto 57,59.929,59.738
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .target Denalan
    .turnin 930 >>交任务: |cRXP_FRIENDLY_发光的水果|r
step
    .goto 57,56.74,53.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈欧玛|r交谈
    .accept 6344 >>接任务: |cRXP_WARN_尼莎·影歌|r
	.target Nyoma
step
    #optional
    .maxlevel 10,Teldskip
step
    .goto 57,55.871,53.901
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .target Corithras Moonrage
    .accept 7383 >>接任务: |cRXP_WARN_大地之冠|r
step
    .goto 57,55.47,50.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲德利奥|r交谈
    .turnin 6344 >>交任务: |cRXP_FRIENDLY_尼莎·影歌|r
    .accept 6341 >>接任务: |cRXP_WARN_泰达希尔的渔业|r
	.target Fidelio
--TODO: should be level 10 here, skip the rest of teldrassil?
step
    .goto 57,43.956,44.178
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    .target Rellian Greenspyre
    .turnin 922 >>交任务: |cRXP_FRIENDLY_雷利亚·绿树|r
    .accept 923 >>接任务: |cRXP_WARN_青苔之瘤|r
step << skip
    .goto 57,39.482,29.844
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .target Sentinel Arynia Cloudsbreak
    .accept 937 >>接任务: |cRXP_LOOT_神谕林地|r
step
    .goto 57,39.199,29.871,5,0
    .goto 57,39.174,29.898
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .target Priestess A'moora
    .accept 2518 >>接任务: |cRXP_LOOT_月神的泪水|r
step
    #loop
    .goto 57,45.297,23.695,40,0
    .goto 57,44.446,30.394,40,0
    .goto 57,45.297,23.695,0
    .goto 57,44.446,30.394,0
    >>击杀|cRXP_ENEMY_林精践踏者|r和|cRXP_ENEMY_林精泥泞兽|r和|cRXP_ENEMY_林精长老|r. 击杀后可掠夺其掉落的|cRXP_LOOT_青苔之瘤|r
    .complete 923,1 --|5/5 Mossy Tumor
    .mob Timberling Mire Beast
    .mob Timberling Bark Ripper
    .mob Timberling Trampler
step
    >>击杀|cRXP_ENEMY_萨丝拉|r. 击败她后可获得|cRXP_LOOT_银色丝囊|r
    .goto 57,40.754,22.233
    .complete 2518,1 --|1/1 Silvery Spinnerets
    .mob Lady Sathrah
step
    #label frond2
    #sticky
    .goto 57,37.131,25.434
    >>点击|cRXP_PICK_奇怪的树木|r
    .accept 931 >>接任务: |cRXP_LOOT_发光的树叶|r
step
    #loop
    >>击杀|cRXP_ENEMY_Bloodfeather Harpies|r. 击杀后搜刮它们的|cRXP_LOOT_Belts|r
    .goto 57,36.775,24.398,30,0
    .goto 57,35.843,26.095,30,0
    .goto 57,35.063,28.517,30,0
    .goto 57,35.793,26.151,30,0
    .goto 57,35.793,26.151,0
    .mob Bloodfeather Harpy
    .mob Bloodfeather Rogue
    .mob Bloodfeather Sorceress
    .mob Bloodfeather Fury
    .mob Bloodfeather Wind Witch
    .mob Bloodfeather Matriarch
step
#requires frond2
    .goto 57,34.487,27.811
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密斯特|r交谈
    >>|cRXP_WARN_这将触发一个护送任务|r
    .target Mist
    .accept 938 >>接任务: |cRXP_LOOT_密斯特|r
step
    .goto 57,39.199,29.871,5,0
    .goto 57,39.174,29.898
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .target Priestess A'moora
    .turnin 2518 >>交任务: |cRXP_FRIENDLY_月神的泪水|r
step
    .goto 57,39.448,29.823
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .target Sentinel Arynia Cloudsbreak
    .turnin 937 >>交任务: |cRXP_FRIENDLY_神谕林地|r << skip
    .turnin -938 >>交任务: |cRXP_FRIENDLY_密斯特|r
step
    .goto 57,40.471,29.942
    .use 18152 >>|cRXP_WARN_使用|r|T134798:0|t[紫水晶瓶]|cRXP_WARN_在神谕林地月井|r
    .complete 7383,1 --|1/1 Filled Amethyst Phial
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r和|cRXP_FRIENDLY_德纳兰|r交谈
    .turnin 923 >>交任务: |cRXP_FRIENDLY_青苔之瘤|r
    .target +Rellian Greenspyre
    .goto 57,43.960,44.161
    .turnin 931 >>交任务: |cRXP_FRIENDLY_发光的树叶|r
    .accept 2499 >>接任务: |cRXP_WARN_奥肯斯古尔|r
    .target +Denalan
    .goto 57,43.936,44.196
step
    .goto 57,47.403,35.829,40,0
    .goto 57,47.39,34.47
    >>击杀|cRXP_ENEMY_奥肯斯古尔|r. 击败后搜刮其掉落的|cRXP_LOOT_巨大的瘤|r
    >>|cRXP_ENEMY_奥肯斯古尔|r|cRXP_WARN_巡逻略显轻微|r
    .complete 2499,1 --|1/1 Gargantuan Tumor
    .mob Oakenscowl
step
    .goto 57,43.936,44.196
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .target Denalan
    .turnin 2499 >>交任务: |cRXP_FRIENDLY_奥肯斯古尔|r
step
    .goto 57,40.999,45.531
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .target Corithras Moonrage
    .turnin 7383 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .accept 933 >>接任务: |cRXP_WARN_大地之冠|r << skip

--skipping following chain. very long rp / bad xphr
step << skip
    .goto 57,43.939,58.534
    .use 5621 >>|cRXP_WARN_使用|r|T134765:0|t[红玉瓶] |cRXP_WARN_在阿利瑟恩月井|r
	.complete 933,1
step << skip
    .goto 57,42.525,58.213
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r交谈
    .target Tarindrella
    .turnin 933 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .accept 14005 >>接任务: |cRXP_WARN_艾露恩的复仇|r
step << skip
--TODO: Big RP quest, might be a huge waste of time, test on beta
    .goto 57,40.909,69.647
    .complete 14005,1 --|1/1 Bough of Corruption slain
step << skip
    .goto 57,42.507,58.184
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r交谈
    .target Tarindrella
    .turnin 14005 >>交任务: |cRXP_FRIENDLY_艾露恩的复仇|r
    .accept 935 >>接任务: |cRXP_WARN_大地之冠|r
step << skip
    .goto 57,41.007,45.528
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .target Corithras Moonrage
    .turnin 935 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .accept 14039 >>接任务: |cRXP_WARN_卡多雷的家|r
step
    .goto 89,35.993,50.342
    .zone 89 >>前往: |cRXP_PICK_达纳苏斯|r
    .isOnQuest 6341
step
    #optional
    #label Teldskip
step
    .goto 57,56.74,53.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈欧玛|r交谈
    .accept 6344 >>接任务: |cRXP_WARN_尼莎·影歌|r
	.target Nyoma
step
    .goto 57,55.47,50.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲德利奥|r交谈
    .turnin 6344 >>交任务: |cRXP_FRIENDLY_尼莎·影歌|r
    .accept 6341 >>接任务: |cRXP_WARN_泰达希尔的渔业|r
	.target Fidelio
step
    #completewith end
    .goto 57,55.47,50.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲德利奥|r交谈
    .fly Darnassus >>飞往达纳苏斯
	.target Fidelio
    .zoneskip 89
step << Warrior
    .goto 89,56.327,52.547
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T135350:0|t[优质重剑]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 1198,1 -- Claymore (1)
    .money <0.2142
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target Ariyell Skyshadow
step << Rogue
    .goto 89,56.327,52.547
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
    >>|cRXP_BUY_购买|r|T135346:0|t[斗士短剑]|cRXP_BUY_从她|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 851,1 -- Cutlass (1)
    .money <0.1618
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
    .target Ariyell Skyshadow
    .xp >11,1
    .xp <10,1
step << Rogue
    .goto 89,56.327,52.547
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132402:0|t[短柄斧]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 853,1 -- Hatchet (1)
    .money <0.1927
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
    .target Ariyell Skyshadow
    .xp >12,1
    .xp <11,1
step << Hunter
    .goto 89,56.327,52.547
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135499:0|t[多层弯弓]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 2507,1 --Collect Laminated Recurve Bow (1)
    .money <0.1402
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
    .target Ariyell Skyshadow
step << Warrior
    #optional
    #completewith end
    +|cRXP_WARN_装备|r|T135350:0|t[优质重剑]
    .use 1198
    .itemcount 1198,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Rogue
    #optional
    #completewith end
    +|cRXP_WARN_在你的主手中装备|r|T135346:0|t[斗士短剑]|r
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step << Rogue
    #optional
    #completewith end
    +|cRXP_WARN_在你的主手装备|r|T132402:0|t[短柄斧]|r
    .use 853
    .itemcount 853,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
step << Hunter
    #optional
    #completewith end
    +|cRXP_WARN_装备|r |T135499:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
step
    .goto 80,43.46,85.58,10,0
    .goto 89,43.913,76.149
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话楼上|cRXP_FRIENDLY_哨兵柯德蕾莎·楠弓|r
    .target Sentinel Cordressa Briarbow
    .accept 26383 >>接任务: |cRXP_WARN_乘风破浪|r
step
    .isQuestComplete 14039
    .goto 89,43.062,77.971
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰兰德·语风|r交谈
    .target Tyrande Whisperwind
    .turnin 14039 >>交任务: |cRXP_FRIENDLY_卡多雷的家|r
    .isQuestComplete 14039
step
    .isOnQuest 6341
    .goto 89,36.090,53.496
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾奎恩妮|r交谈
    .target Sister Aquinne
    .turnin 6341 >>交任务: |cRXP_FRIENDLY_泰达希尔的渔业|r
    .accept 6342 >>接任务: |cRXP_WARN_飞往奥伯丁|r
step
    .isQuestTurnedIn 6341
    .goto 89,36.090,53.496
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾奎恩妮|r交谈
    .target Sister Aquinne
    .accept 6342 >>接任务: |cRXP_WARN_飞往奥伯丁|r
step
    .isOnQuest 6342
    .goto 89,36.641,48.036
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利奥拉|r交谈
    .target Leora
    .turnin 6342 >>交任务: |cRXP_FRIENDLY_飞往奥伯丁|r
step
    .goto 89,35.993,50.342
    .subzone 702 >>走进飞行管理员旁边的紫色传送门
    .zoneskip Darkshore
step
    #label end
    .goto 57,55.406,88.415
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Lor'danel >>飞往洛丹伦
    .zoneskip Darkshore
    .target Vesprystus
]])
