local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
#season 0,1
<< Alliance
#name 1-6 幽影谷
#displayname 1-7 幽影谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << sod
#displayname 1-6 幽影谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor NightElf
#next 6-11 泰达希尔
step << !NightElf
    #sticky
    #completewith next
    +您已选择适用于暗夜精灵的指南, 请选择与您角色起始区域相同的初始区域
step
    .goto Teldrassil,58.695,44.266
    .target Conservator Ilthalaine
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .accept 456 >>接任务: |cRXP_LOOT_自然的平衡|r
step
    #sticky
    #label balance1
    #completewith GoodProtector
    >>击杀|cRXP_ENEMY_夜刃豹幼崽|r和|cRXP_ENEMY_草刺野猪幼崽|r
    .goto Teldrassil,62.0,42.6,0,0
    .complete 456,1 --Kill Young Nightsaber (x7)
    .mob +Young Nightsaber
    .complete 456,2 --Kill Young Thistle Boar (x4)
    .mob +Young Thistle Boar
step
    >>击杀怪物后掠夺战利品, 确保至少拥有价值10铜的可出售垃圾物品, 这些物品将用于训练 |T132333:0|t[战斗怒吼]<< Warrior
    .xp 2 >>升级到2级
step << !sod/Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪兰妮亚·月光|r和|cRXP_FRIENDLY_麦利萨尔·鹿盔|r交谈
    #label GoodProtector
    .accept 4495 >>接任务: |cRXP_LOOT_好朋友|r
    .target +Dirania Silvershine
    .goto Teldrassil,60.899,41.961
    .accept 458 >>接任务: |cRXP_LOOT_森林守护者|r
	.goto Teldrassil,59.924,42.474
    .target +Melithar Staghelm
step
    >>击杀|cRXP_ENEMY_夜刃豹幼崽|r和|cRXP_ENEMY_草刺野猪幼崽|r
    .goto Teldrassil,62.0,42.6,0,0
    .complete 456,1 --Kill Young Nightsaber (x7)
    .mob +Young Nightsaber
    .complete 456,2 --Kill Young Thistle Boar (x4)
    .mob +Young Thistle Boar
step << Hunter
#xprate >1.99
    #requires balance1
	.goto Teldrassil,58.695,44.266
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .turnin 456,1 >>交任务: |cRXP_FRIENDLY_自然的平衡|r << Hunter
    .target Conservator Ilthalaine
    .accept 457 >>接任务: |cRXP_LOOT_自然的平衡|r
step << Hunter
#xprate >1.99
    .goto Teldrassil,59.8,34.1
    >>击杀 |cRXP_ENEMY_癞皮夜刃豹|r和 |cRXP_ENEMY_草刺野猪|r
    .complete 457,1 --Kill Mangy Nightsaber (x7)
    .mob +Mangy Nightsaber
    .complete 457,2 --Kill Thistle Boar (x7)
    .mob +Thistle Boar
step << Hunter
    #season 0,1
    .goto Teldrassil,59.8,34.1
    .xp 4-610 >>刷怪直到距离4级还差610点经验值(当前790/1400)
step << Hunter
    .goto Teldrassil,54.593,32.992
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃沃隆|r交谈
    .turnin 4495 >>交任务: |cRXP_FRIENDLY_好朋友|r
    .target Iverron
    .accept 3519 >>接任务: |cRXP_LOOT_需要帮助的朋友|r
step << Hunter
    #completewith next
    .hs >>炉石到幽影谷
step << Hunter
    .goto Teldrassil,57.9,45.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r交谈
    .turnin 458 >>交任务: |cRXP_FRIENDLY_森林守护者|r
    .target Tarindrella
    .accept 459 >>接任务: |cRXP_LOOT_森林守护者|r
step << Hunter
#xprate >1.99
    #requires balance1
	.goto Teldrassil,58.695,44.266
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .turnin 457 >>交任务: |cRXP_FRIENDLY_自然的平衡|r
    .target Conservator Ilthalaine
	.accept 3117 >>接任务: |cRXP_LOOT_风化符记|r
step << Druid
    .goto Teldrassil,59.602,40.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德林拉尔|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    >>|cRXP_BUY_购买 15|r|T132794:0|t[清凉的泉水]
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target Dellylah
step
#xprate <1.99 << Hunter/Warrior
    #requires balance1
	.goto Teldrassil,58.695,44.266
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .turnin 456,1 >>交任务: |cRXP_FRIENDLY_自然的平衡|r << Hunter
    .turnin 456 >>交任务: |cRXP_FRIENDLY_自然的平衡|r << !Hunter
    .target Conservator Ilthalaine
    .accept 457 >>接任务: |cRXP_LOOT_自然的平衡|r
	.accept 3116 >>接任务: |cRXP_LOOT_简易符记|r << Warrior
	.accept 3117 >>接任务: |cRXP_LOOT_风化符记|r << Hunter
--	.accept 3118 >>接任务: |cRXP_LOOT_密文符记|r << Rogue
	.accept 3119 >>接任务: |cRXP_LOOT_神圣符记|r << Priest
	.accept 3120 >>接任务: |cRXP_LOOT_绿色符记|r << Druid
step << Warrior
    #season 0
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
	.vendor >>|cRXP_WARN_出售垃圾|r
    .target Keina
step << Warrior
    #season 0
	.goto Teldrassil,59.637,38.442
    .target Alyissia
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莉希亚|r交谈
	.turnin 3116 >>交任务: |cRXP_FRIENDLY_简易符记|r
    .trainer >>训练你的职业法术
step << !Hunter
    #season 0 << Druid
    .goto Teldrassil,59.8,34.1
    >>击杀 |cRXP_ENEMY_癞皮夜刃豹|r和 |cRXP_ENEMY_草刺野猪|r
    .complete 457,1 --Kill Mangy Nightsaber (x7)
    .mob +Mangy Nightsaber
    .complete 457,2 --Kill Thistle Boar (x7)
    .mob +Thistle Boar
step << !Hunter
    #season 0 << Warrior
    .goto Teldrassil,54.593,32.992
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃沃隆|r交谈
    .turnin 4495 >>交任务: |cRXP_FRIENDLY_好朋友|r
    .target Iverron
    .accept 3519 >>接任务: |cRXP_LOOT_需要帮助的朋友|r
step << !Hunter !Warrior
    #season 2
    #completewith next
    .hs >>炉石到幽影谷
step << !Hunter
    #season 0
    #completewith next
    .hs >>炉石到幽影谷
step << !Hunter
    #season 0 << Druid/Warrior
    .goto Teldrassil,57.9,45.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r交谈
    .turnin 458 >>交任务: |cRXP_FRIENDLY_森林守护者|r
    .target Tarindrella
    .accept 459 >>接任务: |cRXP_LOOT_森林守护者|r
step << !Hunter
    #season 0 << Druid
    .goto Teldrassil,58.695,44.266
    .target Conservator Ilthalaine
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .turnin 457 >>交任务: |cRXP_FRIENDLY_自然的平衡|r
step
    .goto Teldrassil,60.899,41.961
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_迪兰妮亚·月光|r
    .turnin 3519 >>交任务: |cRXP_FRIENDLY_需要帮助的朋友|r
    .target Dirania Silvershine
    .accept 3521 >>接任务: |cRXP_LOOT_埃沃隆的解药|r
step << Hunter
    #season 0
    #completewith htraining
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
    >>|cRXP_WARN_ 确保离开商人后还剩下 1 银, 以便能够买得起|r|T132204:0|t[|cRXP_FRIENDLY_毒蛇之刺|r]
	.vendor >>|cRXP_BUY_购买 2 堆|r|T132382:0|t[劣质箭]
    .target Keina
step << Druid
    #season 0,1
    .goto Teldrassil,59.602,40.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德林拉尔|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    >>|cRXP_BUY_购买 20|r |T132794:0|t[清凉的泉水]
    .collect 159,20 --Collect Refreshing Spring Water (x20)
    .target Dellylah
step
    .goto Teldrassil,57.807,41.653
    .target Gilshalan Windwalker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔沙兰·风行者|r交谈
    .accept 916 >>接任务: |cRXP_LOOT_树林蜘蛛的毒囊|r
step << Hunter
    .xp 4-40
step << Hunter
    .goto Teldrassil,57.80,40.97,25,0
    .goto Teldrassil,58.659,40.449
    >>攀上奥达希尔之树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿亚娜·远途|r交谈
    .turnin 3117 >>交任务: |cRXP_FRIENDLY_风化符记|r
    .train 1978 >>训练毒蛇钉刺
    .target Ayanna Everstride
step
    .goto Teldrassil,57.95,38.20,10,0
    .goto Teldrassil,57.76,37.27,10,0
    .goto Teldrassil,58.21,36.40,10,0
    .goto Teldrassil,58.81,37.83,10,0
    .goto Teldrassil,57.95,38.20
    >>拾取地面上的|cRXP_LOOT_Moonpetal Lilies|r
    .complete 3521,2 --Collect Moonpetal Lily (x4)
step << Hunter
#optional
#season 2
#completewith next
    >>击杀|cRXP_ENEMY_树林蜘蛛|r. 击败它们以获取|cRXP_LOOT_毒液|r和|cRXP_LOOT_毒囊|r
    .complete 3521,3 --Collect Webwood Ichor (x1)
    .complete 916,1 --Collect Webwood Venom Sac (x10)
    .mob Webwood Spider
step
    #season 0 << Warrior
    #label IchorVenomSac
    .goto Teldrassil,56.8,31.7
    >>击杀|cRXP_ENEMY_树林蜘蛛|r. 击败它们以获取|cRXP_LOOT_毒液|r和|cRXP_LOOT_毒囊|r
    .complete 3521,3 --Collect Webwood Ichor (x1)
    .complete 916,1 --Collect Webwood Venom Sac (x10)
    .mob Webwood Spider
step << skip --logout skip Warrior
	#hardcore
	#completewith next
    #season 2
	+退出时跳过蛋后面的平台. 移动角色直到看起来像是漂浮状态, 然后退出并重新登录
	>>如果你掉下去了, 就正常跑出洞穴去交任务
	.link https://www.youtube.com/watch?v=TTZZT3jpv1s >>点击此处参考
step << skip --logout skip Hunter
	#hardcore
    #season 2
	#completewith next
	+退出时跳过蛋后面的平台. 移动角色直到看起来像是漂浮状态, 然后退出并重新登录
	>>如果你掉下去了, 就正常跑出洞穴去交任务
	.link https://www.youtube.com/watch?v=TTZZT3jpv1s >>点击此处参考
step
    .goto Teldrassil,55.0,43.7
    >>击杀|cRXP_ENEMY_小劣魔|r和|cRXP_ENEMY_劣魔|r. 击败它们后搜刮其掉落的|cRXP_LOOT_魔苔|r和|cRXP_LOOT_魔苔|r
    .complete 3521,1 --Collect Hyacinth Mushroom (x7)
    .complete 459,1 --Collect Fel Moss (x8)
    .mob Grell
    .mob Grellkin
step << Warrior
    #season 2
    .goto Teldrassil,57.807,41.653
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔沙兰·风行者|r交谈
    >>提示:|cRXP_WARN_领取此任务的奖励物品“护甲”并装备上. 稍后你将用它来刻印符文|r << sod Hunter/sod Rogue/sod Druid/sod Warrior
    >>提示:|cRXP_WARN_完成此任务后领取长袍作为奖励并装备上. 稍后你需要用它来刻印符文|r << sod Priest
    .turnin 917 >>交任务: |cRXP_FRIENDLY_树林蜘蛛的卵|r
    .target Gilshalan Windwalker
step
    .goto Teldrassil,57.8,45.1
    .target Tarindrella
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r交谈
    >>提示:|cRXP_WARN_领取护腿作为奖励并保留. 稍后你会用它们来刻印符文|r << sod Hunter/sod Rogue/sod Warrior/sod Druid
    .turnin 459 >>交任务: |cRXP_FRIENDLY_森林守护者|r
step
    .goto Teldrassil,60.899,41.961
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_迪兰妮亚·月光|r
    .turnin 3521 >>交任务: |cRXP_FRIENDLY_埃沃隆的解药|r
    .target Dirania Silvershine
    .accept 3522 >>接任务: |cRXP_LOOT_埃沃隆的解药|r
step << !Priest !Warrior
    #season 0 << Hunter
    .goto Teldrassil,59.306,41.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇娜|r交谈
	.vendor >>|cRXP_WARN_出售垃圾|r << !Hunter
	.vendor >>|cRXP_BUY_购买 3 或 4 堆|r|T132382:0|t[劣质箭] << Hunter
    .target Keina
step << Warrior
    #season 0
    .goto Teldrassil,59.637,38.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莉希亚|r交谈
	.trainer >>训练你的职业法术
    .target Alyissia
step << Priest
    #completewith next
    .goto Teldrassil,59.456,41.050
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_简娜·明月|r交谈
	.vendor >>|cRXP_WARN_出售垃圾|r
    .target Janna Brightmoon
step << Priest
    #season 0,1,2
	.goto Teldrassil,59.174,40.442
    .target Shanda
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_珊达|r交谈
	.turnin 3119 >>交任务: |cRXP_FRIENDLY_神圣符记|r << !sod
    .turnin 77574 >>交任务: |cRXP_FRIENDLY_艾露恩之思|r << sod
	.trainer >>训练你的职业法术
step
    #season 0 << Warrior
    .goto Teldrassil,57.807,41.653
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔沙兰·风行者|r交谈
    .turnin 916 >>交任务: |cRXP_FRIENDLY_树林蜘蛛的毒囊|r
    .target Gilshalan Windwalker
    .accept 917 >>接任务: |cRXP_LOOT_树林蜘蛛的卵|r
step << Hunter/Rogue
    #completewith next
    +|cRXP_WARN_装备|r|T135641:0|t[棘木匕首]
    .use 5392
    .itemcount 5392,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.05
step << Druid
    #season 0,1
    .goto Teldrassil,57.80,40.97,25,0
    .goto Teldrassil,58.626,40.287
    >>攀上奥达希尔之树
    .target Mardant Strongoak
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛丹特·硬木|r交谈
	.turnin 3120 >>交任务: |cRXP_FRIENDLY_绿色符记|r
	.train 8921 >>训练 |T136096:0|t[月火术]
step
    #season 0 << Warrior
    .goto Teldrassil,54.593,32.992
    .target Iverron
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃沃隆|r交谈
    >>提示:|cRXP_WARN_从他那里拿取裤子作为奖励. 稍后你将用它来刻印符文|r << Priest sod
    .turnin 3522 >>交任务: |cRXP_FRIENDLY_埃沃隆的解药|r
step
    #season 0 << Warrior
    #completewith next
    .goto Teldrassil,56.73,31.17,25 >>进入暗影丝洞窟
step
    .goto Teldrassil,57.0,26.4
    #season 0 << Warrior
    >>在洞穴后方地面上拾取一颗|cRXP_LOOT_树林蜘蛛的卵|r
    .complete 917,1 --Collect Webwood Egg (x1)
step
	#softcore
	#completewith next
    #season 0 << Warrior
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
step << skip --logout skip
	#hardcore
	#completewith next
    #season 0 << Warrior
	+退出时跳过蛋后面的平台. 移动角色直到看起来像是漂浮状态, 然后退出并重新登录
	>>如果你掉下去了, 就正常跑出洞穴去交任务
	.link https://www.youtube.com/watch?v=TTZZT3jpv1s >>点击此处参考
step
#xprate <1.99
	.goto Teldrassil,57.807,41.653
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔沙兰·风行者|r交谈
    .turnin 917 >>交任务: |cRXP_FRIENDLY_树林蜘蛛的卵|r
    .target Gilshalan Windwalker
    .accept 920 >>接任务: |cRXP_LOOT_特纳隆的召唤|r
step
#xprate <1.99
    .goto Teldrassil,57.80,40.97,25,0
    .goto Teldrassil,59.062,39.448
    >>攀上奥达希尔之树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特纳隆·雷拳|r交谈
    .turnin 920 >>交任务: |cRXP_FRIENDLY_特纳隆的召唤|r
    .target Tenaron Stormgrip
    .accept 921 >>接任务: |cRXP_LOOT_大地之冠|r
step
#xprate <1.99
    #sticky
    #label vial1
    .goto Teldrassil,59.9,33.0
	.use 5185 >>|cRXP_WARN_使用|r|T134776:0|t[水晶瓶]|cRXP_WARN_在月亮井|r
    .complete 921,1 --Collect Filled Crystal Phial (x1)
step << Hunter
#xprate <1.99
    .goto Teldrassil,59.8,34.1
    >>击杀 |cRXP_ENEMY_癞皮夜刃豹|r和 |cRXP_ENEMY_草刺野猪|r
    .complete 457,1 --Kill Mangy Nightsaber (x7)
    .mob +Mangy Nightsaber
    .complete 457,2 --Kill Thistle Boar (x7)
    .mob +Thistle Boar
step
#xprate <1.99
    #requires vial1
    #completewith next
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
step << Hunter
#xprate <1.99
    #requires vial1
    .goto Teldrassil,58.695,44.266
    .target Conservator Ilthalaine
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .turnin 457,2 >>交任务: |cRXP_FRIENDLY_自然的平衡|r
step << Priest
    #requires vial1
    .goto Teldrassil,59.2,40.5
    .target Shanda
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊达|r交谈
    .accept 5622 >>接任务: |cRXP_LOOT_月神的恩赐|r
step
#xprate <1.99
    #requires vial1
    .goto Teldrassil,57.80,40.97,25,0
    .goto Teldrassil,59.062,39.448
    >>攀上奥达希尔之树
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特纳隆·雷拳|r交谈
    .turnin 921 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Tenaron Stormgrip
    .accept 928 >>接任务: |cRXP_LOOT_大地之冠|r
step
    .goto Teldrassil,61.159,47.644
    .target Porthannius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯萨努斯|r交谈
    .accept 2159 >>接任务: |cRXP_LOOT_多兰纳尔的货物|r
]])

RXPGuides.RegisterGuide([[
#classic
#season 0,1
<< Alliance
#name 6-11 泰达希尔
#displayname 7-13 泰达希尔 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << SoD
#displayname 6-11 泰达希尔 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor NightElf
#next 14-16 黑海岸
step
    .goto Teldrassil,60.5,56.3
    .target Zenn Foulhoof
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .accept 488 >>接任务: |cRXP_LOOT_赛恩的要求|r
step
    #sticky
    #completewith DenlansEarth
    >>击杀|cRXP_ENEMY_夜刃豹|r. 击败它们后搜刮其|cRXP_LOOT_毒牙|r
    >>击杀|r巨翼枭|cRXP_ENEMY_Strigid Owls|r. 掠夺它们获取|r羽毛|cRXP_LOOT_Feathers|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r. 击杀后搜刮其掉落的|cRXP_LOOT_丝线|r
    >>|cRXP_WARN_请注意, |r|cRXP_ENEMY_夜刃豹|r|cRXP_WARN_和|r|cRXP_ENEMY_巨翼枭|r|cRXP_WARN_移动速度非常快！|r|cRXP_ENEMY_巨翼枭|r|cRXP_WARN_在你与其中一只战斗时若从它们身边跑过, 还会对其他|r|cRXP_ENEMY_猫头鹰|r|cRXP_WARN_触发社交仇恨|r
    .complete 488,1 --Collect Nightsaber Fang (x3)
    .mob +Nightsaber
    .complete 488,2 --Collect Strigid Owl Feather (x3)
    .mob +Strigid Owl
    .complete 488,3 --Collect Webwood Spider Silk (x3)
    .mob +Webwood Lurker
step
    #sticky
	#completewith DenlansEarth
    >>击杀|cRXP_ENEMY_树林潜伏者|r 和|cRXP_ENEMY_树林毒蜘蛛|r , 搜刮它们掉落的|cRXP_LOOT_小蜘蛛腿|r
    >>|cRXP_WARN_你需要这些来完成后续任务|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob Webwood Lurker
    .mob Webwood Venomfang
step
    #label DenlansEarth
    .goto Teldrassil,56.08,57.72
    .target Syral Bladeleaf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    >>|cRXP_WARN_接受此任务前请确保你有一个空的背包格子|r
    .accept 997 >>接任务: |cRXP_LOOT_德纳兰的泥土|r
step
    .goto Teldrassil,55.954,57.272
    .target Athridas Bearmantle
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .accept 475 >>接任务: |cRXP_LOOT_烦恼之风|r
step << Priest
    .goto Teldrassil,55.564,56.746
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
    .turnin 5622 >>交任务: |cRXP_FRIENDLY_月神的恩赐|r
    .target Laurna Morninglight
    .accept 5621 >>接任务: |cRXP_LOOT_月光之衣|r
	.trainer >>训练你的职业法术
step << Rogue
    .goto Teldrassil,55.508,57.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥蒂亚|r 上楼
    .vendor >>|cRXP_BUY_购买并装备一个|r|T135426:0|t[破损的小飞刀]
    .target Aldia
step
#xprate <1.99 << Hunter/Warrior/Druid
    .goto Teldrassil,55.574,56.948
    .target Tallonkai Swiftroot
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树上的|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .accept 932 >>接任务: |cRXP_LOOT_扭曲的仇恨|r
    .accept 2438 >>接任务: |cRXP_LOOT_翡翠摄梦符|r
step << Hunter/Warrior/Druid
#xprate >1.99
    .goto Teldrassil,55.574,56.948
    .target Tallonkai Swiftroot
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树上的|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .accept 2438 >>接任务: |cRXP_LOOT_翡翠摄梦符|r
step << Hunter
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    >>|cRXP_BUY_购买并装备 a|r|T135499:0|t[角木弯弓]
    >>|cRXP_BUY_购买|r|T132382:0|t[劣质箭] |cRXP_BUY_直到你的箭袋装满|r
    .collect 2506,1 --Collect Hornwood Recurve Bow
    .target Jeena Featherbow
    .money <0.0285
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.38
step << Hunter
    #season 0
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    .vendor >>|cRXP_BUY_购买|r|T132382:0|t[劣质箭] |cRXP_BUY_直到你的箭袋装满|r
    .target Jeena Featherbow
step << Hunter
    #completewith next
    +|cRXP_WARN_装备|r|T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.37
step << Warrior
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r |T135321:0|t[步兵剑] |cRXP_BUY_(如果负担得起, 价格为5银36铜), 否则跳过此步骤|r
    .collect 2488,1 --Collect Gladius
    .target Shalomon
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r|T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
step << Warrior
    .goto Teldrassil,56.221,59.198
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
	.trainer >>训练你的职业法术
    .target Kyra Windblade
step << Rogue
    .goto Teldrassil,56.381,60.139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
	.trainer >>训练你的职业法术
    .target Jannok Breezesong
step << Rogue
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r|T135641:0|t[卷刃的剑]|cRXP_BUY_(若能负担得起, 花费4秒1铜币), 否则跳过此步骤|r
    .collect 2494,1 --Stiletto (1)
    .target Shalomon
    .money <0.0401
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith next
    +|cRXP_WARN_装备|r|T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Druid
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r|T135145:0|t[手杖] |cRXP_BUY_(若能负担得起, 价格为5银4铜), 否则跳过此步骤|r
    .collect 2495,1 --Walking Stick (1)
    .target Shalomon
    .money <0.0504
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.20
step << Druid
    #completewith next
    +|cRXP_WARN_装备|r|T135145:0|t[手杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.19
step
    .goto Teldrassil,55.619,59.788
    .target Innkeeper Keldamyr
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板凯达米尔|r交谈
    .turnin 2159,2 >>交任务: |cRXP_FRIENDLY_多兰纳尔的货物|r << Hunter
    .turnin 2159 >>交任务: |cRXP_FRIENDLY_多兰纳尔的货物|r << !Hunter
    .vendor >>|cRXP_BUY_购买 10 |T132815:0|t|cRXP_LOOT_冰镇牛奶|r, 或尽可能多的数量 << Priest
    .home >>将你的[炉石]设置为多兰纳尔
step << Hunter
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
	.train 3044 >>学习奥术射击 << era
    .train 5116 >>训练震荡射击 << sod
    .target Dazalar
step << Druid
    #season 0
    .goto Teldrassil,55.945,61.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔|r交谈
	.trainer >>训练你的职业法术
    .target Kal
step
#xprate <1.99
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 928 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Corithras Moonrage
    .accept 929 >>接任务: |cRXP_LOOT_大地之冠|r
step
    #sticky
    #completewith DenlanStart
    >>击杀|cRXP_ENEMY_夜刃豹|r. 击败它们后搜刮其|cRXP_LOOT_毒牙|r
    >>击杀|r巨翼枭|cRXP_ENEMY_Strigid Owls|r. 掠夺它们获取|r羽毛|cRXP_LOOT_Feathers|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r. 击杀后搜刮其掉落的|cRXP_LOOT_丝线|r
    >>|cRXP_WARN_请注意, |r|cRXP_ENEMY_夜刃豹|r|cRXP_WARN_和|r|cRXP_ENEMY_巨翼枭|r|cRXP_WARN_移动速度非常快！|r|cRXP_ENEMY_巨翼枭|r|cRXP_WARN_在你与其中一只战斗时若从它们身边跑过, 还会对其他|r|cRXP_ENEMY_猫头鹰|r|cRXP_WARN_触发社交仇恨|r
    .complete 488,1 --Collect Nightsaber Fang (x3)
    .mob +Nightsaber
    .complete 488,2 --Collect Strigid Owl Feather (x3)
    .mob +Strigid Owl
    .complete 488,3 --Collect Webwood Spider Silk (x3)
    .mob +Webwood Lurker
step
    #sticky
	#completewith DenlanStart
    >>击杀|cRXP_ENEMY_树林潜伏者|r 和|cRXP_ENEMY_树林毒蜘蛛|r , 搜刮它们掉落的|cRXP_LOOT_小蜘蛛腿|r
    >>|cRXP_WARN_你需要这些来完成后续任务|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob Webwood Lurker
    .mob Webwood Venomfang
step << Druid
    #ah
    #season 0
    .goto Teldrassil,57.721,60.641
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛洛尼·刃叶|r交谈
    >>|T136065:0|t[草药学] |cRXP_WARN_需要采集 5|r|T134187:0|t[地根草] |cRXP_WARN_用于一个即将开启的重要职业任务. 完成后可选择遗忘|r
    >>|cRXP_WARN_如果您希望稍后从拍卖行购买 5|r|T134187:0|t[地根草]|cRXP_WARN_, 请跳过此步骤|r
    .train 2366 >>学习 |T136065:0|t[草药学]
    .target Malorne Bladeleaf
    .itemcount 2449,<5 --Earthroot (<5)
step << Druid
    #ssf
    #season 0
    .goto Teldrassil,57.721,60.641
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛洛尼·刃叶|r交谈
    >>|T136065:0|t[草药学] |cRXP_WARN_需要采集 5|r|T134187:0|t[地根草] |cRXP_WARN_用于一个即将开启的重要职业任务. 完成后可选择遗忘|r
    .train 2366 >>学习 |T136065:0|t[草药学]
    .target Malorne Bladeleaf
    .itemcount 2449,<5 --Earthroot (<5)
step << Druid
    #ssf
    #optional
    #completewith end
    #label GatheringQ
    #season 0
    .skill herbalism,15 >>|cRXP_WARN_将你的|r|T136065:0|t[草药学] |cRXP_WARN_等级提升至15级, 以便采集5|r|T134187:0|t[地根草] |cRXP_WARN_用于即将开启的重要职业任务. 完成后可选择遗忘该技能|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox
step << Druid
    #optional
    #completewith end
    #requires GatheringQ
    #season 0
    >>|cRXP_WARN_通过|T136065:0|t[草药学]收集5个|T134187:0|t[地根草], 并偶尔从|r|RXP_PICK_破损的箱子|r中获取, 用于未来的职业任务|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .skill herbalism,<15,1
step << Priest
    .goto Teldrassil,57.242,63.511
    >>目标 |cRXP_FRIENDLY_哨兵莎恩雅|r
    >>|cRXP_WARN_施放|r|T135929:0|t[治疗术(等级2)]|cRXP_WARN_和|r|T135987:0|t[真言术:坚韧], |cRXP_WARN_目标: |r|cRXP_FRIENDLY_哨兵莎恩雅|r
    .complete 5621,1 --Heal and fortify Sentinel Shaya
    .target Sentinel Shaya
step
    #label DenlanStart
    .goto Teldrassil,60.900,68.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .turnin 997 >>交任务: |cRXP_FRIENDLY_德纳兰的泥土|r
    .target Denalan
    .accept 918 >>接任务: |cRXP_LOOT_林精的种子|r
    .accept 919 >>接任务: |cRXP_LOOT_林精的新芽|r
step
    .goto Teldrassil,61.63,68.89,55,0
    .goto Teldrassil,60.52,70.47,55,0
    .goto Teldrassil,59.04,72.52,55,0
    .goto Teldrassil,57.69,69.92,55,0
    .goto Teldrassil,55.33,67.22,55,0
    .goto Teldrassil,57.89,64.84,55,0
    .goto Teldrassil,61.21,66.28
    >>击杀|cRXP_ENEMY_林精|r. 击杀后搜刮其掉落的|cRXP_LOOT_种子|r
    >>拾取地面上的林精的新芽 << !sod
    .complete 918,1 --Collect Timberling Seed (x8)
    .complete 919,1 --Collect Timberling Sprout (x12)
    .mob Timberling
step
    .goto Teldrassil,60.900,68.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .turnin 918 >>交任务: |cRXP_FRIENDLY_林精的种子|r
    .target Denalan
    .accept 922 >>接任务: |cRXP_LOOT_雷利亚·绿树|r
    .turnin 919 >>交任务: |cRXP_FRIENDLY_林精的新芽|r
step
    #sticky
    #completewith Starbreeze
    >>击杀|cRXP_ENEMY_夜刃豹|r. 击败它们后搜刮其|cRXP_LOOT_毒牙|r
    >>击杀|r巨翼枭|cRXP_ENEMY_Strigid Owls|r. 掠夺它们获取|r羽毛|cRXP_LOOT_Feathers|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r. 击杀后搜刮其掉落的|cRXP_LOOT_丝线|r
    >>|cRXP_WARN_请注意, |r|cRXP_ENEMY_夜刃豹|r|cRXP_WARN_和|r|cRXP_ENEMY_巨翼枭|r|cRXP_WARN_移动速度非常快！|r|cRXP_ENEMY_巨翼枭|r|cRXP_WARN_在你与其中一只战斗时若从它们身边跑过, 还会对其他|r|cRXP_ENEMY_猫头鹰|r|cRXP_WARN_触发社交仇恨|r
    .complete 488,1 --Collect Nightsaber Fang (x3)
    .mob +Nightsaber
    .complete 488,2 --Collect Strigid Owl Feather (x3)
    .mob +Strigid Owl
    .complete 488,3 --Collect Webwood Spider Silk (x3)
    .mob +Webwood Lurkerr
step
    #sticky
	#completewith Starbreeze
    >>击杀|cRXP_ENEMY_树林潜伏者|r 和|cRXP_ENEMY_树林毒蜘蛛|r , 搜刮它们掉落的|cRXP_LOOT_小蜘蛛腿|r
    >>|cRXP_WARN_你需要这些来完成后续任务|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob Webwood Lurker
    .mob Webwood Venomfang
step
    #label Starbreeze
    #completewith next
    .goto Teldrassil,68.02,59.66,120 >>前往星风村
step
    .goto Teldrassil,68.02,59.66
    >>打开|cRXP_PICK_塔隆凯的衣柜|r. 从中拾取|cRXP_LOOT_翡翠摄梦符|r
    .complete 2438,1 --Collect Emerald Dreamcatcher (x1)
step
    #label zenn
    .goto Teldrassil,66.26,58.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_盖洛拉斯·塔文斯伦|r交谈
    .turnin 475 >>交任务: |cRXP_FRIENDLY_烦恼之风|r
    .target Gaerolas Talvethren
    .accept 476 >>接任务: |cRXP_LOOT_瘤背熊怪的堕落|r
step
    #xprate <1.99
    .goto Teldrassil,63.38,58.10
    >>|cRXP_WARN_使用|r|T134721:0|t[翡翠瓶] |cRXP_WARN_在 星风村月亮井|r
    .complete 929,1 --Collect Filled Jade Phial (x1)
step
    #sticky
	#completewith SeekRedemption
    >>击杀|cRXP_ENEMY_树林潜伏者|r 和|cRXP_ENEMY_树林毒蜘蛛|r , 搜刮它们掉落的|cRXP_LOOT_小蜘蛛腿|r
    >>|cRXP_WARN_你需要这些来完成后续任务|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob Webwood Lurker
    .mob Webwood Venomfang
step
    >>击杀|cRXP_ENEMY_夜刃豹|r. 击败它们后搜刮其|cRXP_LOOT_毒牙|r
    >>击杀|r巨翼枭|cRXP_ENEMY_Strigid Owls|r. 掠夺它们获取|r羽毛|cRXP_LOOT_Feathers|r
    >>击杀|cRXP_ENEMY_树林潜伏者|r. 击杀后搜刮其掉落的|cRXP_LOOT_丝线|r
    >>|cRXP_WARN_保存任何|r|T132832:0|t[小蛋] |cRXP_WARN_和|r|T134321:0|t[小蜘蛛腿] |cRXP_WARN_用于练级|r|T133971:0|t[烹饪] |cRXP_WARN_稍后使用|r
    .complete 488,1 --Collect Nightsaber Fang (x3)
    .mob +Nightsaber
    .goto Teldrassil,66.10,52.43,60,0
    .goto Teldrassil,61.95,61.07,50,0
    .goto Teldrassil,59.14,60.91
    .complete 488,2 --Collect Strigid Owl Feather (x3)
    .mob +Strigid Owl
    .goto Teldrassil,66.10,52.43,60,0
    .goto Teldrassil,63.39,64.22,50,0
    .goto Teldrassil,59.14,60.91
    .complete 488,3 --Collect Webwood Spider Silk (x3)
    .mob +Webwood Lurker
    .goto Teldrassil,61.06,54.66,50,0
    .goto Teldrassil,60.17,59.62,50,0
    .goto Teldrassil,58.22,56.32
step
    .goto Teldrassil,60.5,56.3
    .target Zenn Foulhoof
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 488 >>交任务: |cRXP_FRIENDLY_赛恩的要求|r
step
    #xprate < 1.5
    .goto Teldrassil,60.7,54.4
	.xp 7+3520 >>升级至7级 +3520经验值
step
    #xprate >1.49
    .xp 7+2350 >>升级至7级 +2350经验值
step
    #label SeekRedemption
	.goto Teldrassil,56.078,57.723
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .accept 489 >>接任务: |cRXP_LOOT_寻求救赎！|r
    .target Syral Bladeleaf
step
    .goto Teldrassil,55.954,57.272
    .target Athridas Bearmantle
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .turnin 476 >>交任务: |cRXP_FRIENDLY_瘤背熊怪的堕落|r
step << Priest
    .goto Teldrassil,55.564,56.746
    .target Laurna Morninglight
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
    .turnin 5621 >>交任务: |cRXP_FRIENDLY_月光之衣|r
	.trainer >>训练你的职业法术
step
    .goto Teldrassil,55.574,56.948
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树上的|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 2438 >>交任务: |cRXP_FRIENDLY_翡翠摄梦符|r
    .target Tallonkai Swiftroot
    .accept 2459 >>接任务: |cRXP_LOOT_噬梦者菲罗斯塔|r
step << Hunter
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
    >>|cRXP_BUY_购买并装备|r|T135499:0|t[角木弯弓]|cRXP_BUY_(若能负担得起, 价格为2银85铜), 否则跳过此步骤|r
    .collect 2506,1 --Collect Hornwood Recurve Bow
    .target Jeena Featherbow
    .money <0.0285
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.38
step << Hunter
    #season 0
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
	.vendor >>|cRXP_BUY_最多购买800|r|T132382:0|t[劣质箭]
    .target Jeena Featherbow
step << Hunter
    #completewith next
    #season 0
    +|cRXP_WARN_装备|r|T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.37
step << Hunter
    #season 0
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
	.trainer >>训练你的职业法术
    .target Dazalar
step << Rogue
    .goto Teldrassil,56.381,60.139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
	.trainer >>训练你的职业法术
    .target Jannok Breezesong
step << Warrior
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r |T135321:0|t[步兵剑] |cRXP_BUY_(如果负担得起, 价格为5银36铜), 否则跳过此步骤|r
    .collect 2488,1 --Collect Gladius
    .target Shalomon
    .money <0.0536
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r|T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
    step << Warrior
    .goto Teldrassil,56.221,59.198
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
	.trainer >>训练你的职业法术
    .target Kyra Windblade
step << Rogue
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r|T135641:0|t[卷刃的剑]|cRXP_BUY_(若能负担得起, 花费4秒1铜币), 否则跳过此步骤|r
    .collect 2494,1 --Stiletto (1)
    .target Shalomon
    .money <0.0401
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith next
    +|cRXP_WARN_装备|r|T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Druid
    .goto Teldrassil,56.308,59.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买并装备|r|T135145:0|t[手杖] |cRXP_BUY_(若能负担得起, 价格为5银4铜), 否则跳过此步骤|r
    .collect 2495,1 --Walking Stick (1)
    .target Shalomon
    .money <0.0504
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.20
step << Druid
    #completewith next
    +|cRXP_WARN_装备|r|T135145:0|t[手杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.19
step << Druid
#xprate 1.49-1.99
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 929 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Corithras Moonrage
step << Druid
#xprate <1.50
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 929 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Corithras Moonrage
    .accept 933 >>接任务: |cRXP_LOOT_大地之冠|r
step << Druid
    #season 0
    .goto Teldrassil,55.945,61.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔|r交谈
	.trainer >>训练你的职业法术
    .target Kal
step
    #sticky
	#completewith jewel
    >>击杀|cRXP_ENEMY_树林潜伏者|r 和|cRXP_ENEMY_树林毒蜘蛛|r , 搜刮它们掉落的|cRXP_LOOT_小蜘蛛腿|r
    >>|cRXP_WARN_你需要这些来完成后续任务|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob Webwood Lurker
    .mob Webwood Venomfang
step
    #loop
    .goto 1438/1,854.400,9952.500,6 >>小树附近
    .goto 1438/1,822.200,9948.500,6 >>在小山丘上
    .goto 1438/1,809.800,9926.400,6 >>在那棵巨大的树旁边
    >>从地图标记位置获取3个邪能锥
    >>|cRXP_WARN_如果其中任何一个目标对象不存在且你无法完成当前目标, 请跳过此步骤|r
    .complete 489,1 --Fel Cone 3/3
    .isOnQuest 489
step
    #label SoDSpiderLegs
    .goto Teldrassil,60.4,56.4
    .target Zenn Foulhoof
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 489 >>交任务: |cRXP_FRIENDLY_寻求救赎！|r
    .itemcount 3418,3
    .isOnQuest 489
step
	#completewith jewel
    >>拾取地面上的魔锥果
    >>|cRXP_WARN_它们通常位于树干附近|r
    .complete 489,1 --Collect Fel Cone (x3)
    .isOnQuest 489
step
    #completewith next
    >>击杀|cRXP_ENEMY_瘤背秘法师|r
    >>|cRXP_WARN_如果没有太多|cRXP_ENEMY_瘤背秘法师|r, 你可能需要击杀|cRXP_ENEMY_瘤背战士|r来促使它们出现|r
    .complete 2459,1 --Kill Gnarlpine Mystic (x7)
    .mob Gnarlpine Mystic
step
	.goto Teldrassil,69.37,53.41
	>>击杀|cRXP_ENEMY_噬梦者菲罗斯塔|r. 击败他后可获得 |T133288:0|t[|cRXP_LOOT_瘤背熊怪的项链|r]. |cRXP_WARN_请注意, 他|r|T132152:0|t[横扫]|cRXP_WARN_一次最多可击中你三次|r
    .use 8049 >>|cRXP_WARN_使用 |T133288:0|t[|cRXP_LOOT_瘤背熊怪的项链|r] 来获取 |cRXP_LOOT_祖维尔|r
    .complete 2459,2 --Collect Tallonkai's Jewel (x1)
    .mob Ferocitas the Dream Eater
step
    #label jewel
    .goto Teldrassil,68.38,52.06,30,0
    .goto Teldrassil,69.37,53.41
    >>击杀|cRXP_ENEMY_瘤背秘法师|r
    >>|cRXP_WARN_如果没有太多|cRXP_ENEMY_瘤背秘法师|r, 你可能需要击杀|cRXP_ENEMY_瘤背战士|r来促使它们出现|r
    .complete 2459,1 --Kill Gnarlpine Mystic (x7)
    .mob Gnarlpine Mystic
step
    #softcore
    #completewith next
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
    .isQuestTurnedIn 489
step
    #softcore
    .goto Teldrassil,56.2,60.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰诺尔·鹰月|r交谈
    .vendor >>|cRXP_BUY_必要时向商人出售物品并修理装备|r
    .target Brannol Eaglemoon
    .isQuestTurnedIn 489
step
    .goto Teldrassil,59.0,56.1,50,0
    .goto Teldrassil,56.5,65.5,50,0
    .goto Teldrassil,53.0,59.5,50,0
    .goto Teldrassil,63.6,62.3,50,0
    .goto Teldrassil,58.7,55.7
    >>拾取地面上的魔锥果
    >>|cRXP_WARN_它们通常位于树干附近|r
    .complete 489,1 --Collect Fel Cone (x3)
    .isOnQuest 489
step
    .goto Teldrassil,60.4,56.4
    .target Zenn Foulhoof
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 489 >>交任务: |cRXP_FRIENDLY_寻求救赎！|r
    .isOnQuest 489
step
    #sticky
	#completewith next
    >>击杀|cRXP_ENEMY_树林潜伏者|r 和|cRXP_ENEMY_树林毒蜘蛛|r , 搜刮它们掉落的|cRXP_LOOT_小蜘蛛腿|r
    >>|cRXP_WARN_你需要这些来完成后续任务|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob Webwood Lurker
    .mob Webwood Venomfang
step
    #completewith next
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >>前往费尔石
step
    .goto Teldrassil,51.2,50.6
    >>击杀|cRXP_ENEMY_迈雷纳斯|r. 击败他后搜刮他的|cRXP_LOOT_头|r
    >>|cRXP_ENEMY_迈雷纳斯|r 可能出现在费尔石块的多个不同刷新点
    .complete 932,1 --Collect Melenas' Head (x1)
    .unitscan Lord Melenas
step
    #softcore
    #completewith next
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
step << !Druid
#xprate <1.99
    .goto Teldrassil,56.142,61.714
    .target Corithras Moonrage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 929 >>交任务: |cRXP_FRIENDLY_大地之冠|r
step
	#xprate <1.5
    .goto Teldrassil,56.142,61.714
    .target Corithras Moonrage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .accept 933 >>接任务: |cRXP_LOOT_大地之冠|r
step
    #sticky
	#completewith spiderLegs
    >>击杀|cRXP_ENEMY_树林潜伏者|r 和|cRXP_ENEMY_树林毒蜘蛛|r , 搜刮它们掉落的|cRXP_LOOT_小蜘蛛腿|r
    >>|cRXP_WARN_你需要这些来完成后续任务|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob Webwood Lurker
    .mob Webwood Venomfang
step
	#xprate <1.5
    #completewith next
    .goto Teldrassil,42.61,76.18,50 >>前往泰达希尔西南部
step
	#xprate <1.5
	.goto Teldrassil,42.61,76.18
	>>点击|cRXP_PICK_奇怪的果树|r
	.accept 930 >>接任务: |cRXP_LOOT_发光的水果|r
step
	#xprate <1.5
    #completewith next
    .goto Teldrassil,42.41,67.07,50 >>前往阿利瑟里恩之池
step
	#xprate <1.5
	#label spiderLegs
	.goto Teldrassil,42.41,67.07
    .use 5621 >>|cRXP_WARN_使用|r|T134765:0|t[红玉瓶] |cRXP_WARN_在阿利瑟恩月井|r
	.complete 933,1
step
	#xprate <1.5
    .goto Teldrassil,44.69,70.52,40,0
    .goto Teldrassil,44.88,73.83
    >>击杀|cRXP_ENEMY_树林潜伏者|r 和|cRXP_ENEMY_树林毒蜘蛛|r , 搜刮它们掉落的|cRXP_LOOT_小蜘蛛腿|r
    .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
    .mob Webwood Lurker
    .mob Webwood Venomfang
step
	#xprate <1.5
    #hardcore
    #completewith next
    .goto Teldrassil,56.142,61.714,90 >>前往多兰纳尔
step
	#xprate <1.5
    #softcore
	#completewith next
    .goto Teldrassil,43.50,68.42
    .deathskip >>在多兰纳尔墓地死亡并重生, 确保死亡位置位于月亮井以东, 否则可能会被传送到达纳苏斯
step
	#xprate <1.5
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 933 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Corithras Moonrage
    .accept 7383 >>接任务: |cRXP_LOOT_大地之冠|r
step
	#xprate <1.5
    #label SpiderLegsEnd
    .goto Teldrassil,57.121,61.296
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞恩|r交谈
    .train 2550 >>学习烹饪技能
    .accept 4161 >>接任务: |cRXP_LOOT_卡多雷的菜谱|r
    .turnin 4161 >>交任务: |cRXP_FRIENDLY_卡多雷的菜谱|r
    .target Zarrin
step << Warrior/Rogue
    .goto Teldrassil,55.29,56.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拜恩希|r交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Byancie
step
    .goto Teldrassil,55.574,56.948
    .target Tallonkai Swiftroot
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树上的|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 932 >>交任务: |cRXP_FRIENDLY_扭曲的仇恨|r
    .turnin 2459 >>交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r
step
#xprate >1.99
    .xp 10
   >>|cRXP_WARN_如果你离完成迈雷纳斯的任务还差得远, 就先去做他的任务|r
step << Priest
#xprate >1.99
    .goto Teldrassil,55.564,56.746
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
	.trainer >>训练你的职业法术
    .accept 5629 >>接任务: |cRXP_WARN_回家|r << sod
    .target Laurna Morninglight
step << Warrior
#xprate >1.99
    .goto Teldrassil,56.221,59.198
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
	.trainer >>训练你的职业法术
    .target Kyra Windblade
step << Rogue
#xprate >1.99
    .goto Teldrassil,56.381,60.139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
	.trainer >>训练你的职业法术
    .train 5171 >>训练 |T132306:0|t[切片与切割] << !sod
    .train 921 >>学习 |T133644:0|t[扒窃]技能, 这也是完成你10级潜行者任务所需的
    .target Jannok Breezesong
step << Hunter
#xprate >1.99
    .goto Teldrassil,56.676,59.489
    .target Dazalar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .accept 6063 >>接任务: |cRXP_LOOT_驯服野兽|r
	.trainer >>训练你的职业法术
step << Hunter
#xprate >1.99
    .goto Teldrassil,59.9,58.8
    .use 15921 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒] |cRXP_WARN_对一只|r|cRXP_ENEMY_树林潜伏者|r
    .complete 6063,1 --Tame a Webwood Lurker
    .mob Webwood Lurker
step << Hunter
#xprate >1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6063 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6101 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
#xprate >1.99
    .goto Teldrassil,62.6,72.2
    .use 15922 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_夜刃捕食者|r
    >>|cRXP_WARN_你必须右键点击宠物界面并解散当前宠物, 才能驯服新的宠物|r
    .complete 6101,1 --Tame a Nightsaber Stalker
    .mob Nightsaber Stalker
step << Hunter
#xprate >1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6101 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6102 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
#xprate >1.99
    .goto Teldrassil,64.7,66.7
    .use 15923 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_巨翼恶枭|r
    >>|cRXP_WARN_你必须右键点击宠物界面并解散当前宠物, 才能驯服新的宠物|r
    .complete 6102,1 --Tame a Strigid Screecher
    .mob Strigid Screecher
step << Hunter
#xprate >1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6102 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6103 >>接任务: |cRXP_LOOT_训练野兽|r
    .train 1130 >>|cRXP_WARN_确保你已学会猎人印记, 稍后需要用它来获取符文|r
step << Warrior
#xprate >1.99
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r|cRXP_WARN_巡逻着多兰纳尔以西的道路. 她也可能正在忙于对抗弗尔博格伏击, 这种情况下你需要等待她完成战斗|r
    .line Teldrassil,50.4,54.2,50.4,55.4,50.4,55.6,50.6,56.2,51.2,56.6,52.2,56.4,52.4,56.6,52.8,57.0,53.4,57.6,54.4,58.4,55.2,58.6,55.4,58.4,55.6,58.4,55.8,58.6
    .accept 1684 >>接任务: |cRXP_LOOT_艾兰娜瑞|r
    .accept 487 >>接任务: |cRXP_LOOT_达纳苏斯之路|r
    .target Moon Priestess Amara
step << Rogue
#xprate >1.99
    .goto Teldrassil,56.381,60.139
    .target Jannok Breezesong
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
    .accept 2241 >>接任务: |cRXP_LOOT_詹诺克的花|r
step
    #season 0
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    .line Teldrassil,50.4,54.2,50.4,55.4,50.4,55.6,50.6,56.2,51.2,56.6,52.2,56.4,52.4,56.6,52.8,57.0,53.4,57.6,54.4,58.4,55.2,58.6,55.4,58.4,55.6,58.4,55.8,58.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r|cRXP_WARN_巡逻着多兰纳尔以西的道路. 她也可能正在忙于对抗弗尔博格伏击, 这种情况下你需要等待她完成战斗|r
    .accept 487 >>接任务: |cRXP_LOOT_达纳苏斯之路|r
    .target Moon Priestess Amara
step
    #season 0
    .goto Teldrassil,46.6,53.0
    >>击杀|cRXP_ENEMY_瘤背伏击者|r
    .complete 487,1 --Kill Gnarlpine Ambusher (x6)
    .mob Gnarlpine Ambusher
step
	#xprate < 1.5
    #completewith next
    .goto Teldrassil,38.32,34.36,50 >>前往神谕林地
step
	#xprate < 1.5
    .goto Teldrassil,38.32,34.36
    .target Sentinel Arynia Cloudsbreak
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .accept 937 >>接任务: |cRXP_LOOT_神谕林地|r
step
	#xprate < 1.5
    .goto Teldrassil,38.43,34.03
    .use 18152 >>|cRXP_WARN_使用|r|T134798:0|t[紫水晶瓶]|cRXP_WARN_在神谕林地月井|r
    .complete 7383,1 --Collect Filled Amethyst Phial (x1)
step
	#xprate < 1.5
    #completewith xp10
	#label harpies
    >>击杀|cRXP_ENEMY_Bloodfeather Harpies|r. 击杀后搜刮它们的|cRXP_LOOT_Belts|r
    >>|cRXP_ENEMY_血羽女族长|r|cRXP_WARN_施法|r|T136052:0|t[治疗波]|cRXP_WARN_和|r|T136048:0|t[闪电箭]|cRXP_WARN_会造成大量伤害. 尽量快速击杀|r
    .complete 937,1 --Collect Bloodfeather Belt (x6)
    .mob Bloodfeather Harpy
    .mob Bloodfeather Rogue
    .mob Bloodfeather Sorceress
    .mob Bloodfeather Fury
    .mob Bloodfeather Wind Witch
    .mob Bloodfeather Matriarch
step
	#xprate < 1.5
    .goto Teldrassil,34.61,28.79
    >>点击|cRXP_PICK_奇怪的树木|r
    .accept 931 >>接任务: |cRXP_LOOT_发光的树叶|r
step << Hunter
	#xprate <1.5
    #completewith xp10
    #label mist1
    .goto Teldrassil,31.54,31.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密斯特|r交谈
    >>|cRXP_WARN_这将触发一个护送任务|r
    .accept 938 >>接任务: |cRXP_LOOT_密斯特|r
    .target Mist
step << Hunter
	#xprate <1.5
    #sticky
    #label xp10
    .xp 10-2670 >>刷怪直到距离10级还差2670点经验值(当前/所需:3830/6500)
    >>|cRXP_WARN_达到此经验断点后, 跳过哈帕/护送任务, 直接前往达纳苏斯. 稍后你将有另一次机会完成这些任务|r
step << Hunter
	#xprate <1.5
    #completewith xp10
    #requires mist1
    .goto Teldrassil,38.32,34.36
    .target Sentinel Arynia Cloudsbreak
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    >>|cRXP_WARN_请记住, 这是一个限时任务, 您需要在接取后10分钟内提交|r
    .turnin 938 >>交任务: |cRXP_FRIENDLY_密斯特|r
step << Hunter
	#xprate <1.5
    #completewith xp10
	#requires harpies
    .goto Teldrassil,38.32,34.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin 937 >>交任务: |cRXP_FRIENDLY_神谕林地|r
    .target Sentinel Arynia Cloudsbreak
    .accept 940 >>接任务: |cRXP_LOOT_泰达希尔|r
step << !Hunter
	#xprate <1.5
    #label mist1
    .goto Teldrassil,31.54,31.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密斯特|r交谈
    >>|cRXP_WARN_这将触发一个护送任务|r
    .accept 938 >>接任务: |cRXP_LOOT_密斯特|r
    .target Mist
step << !Hunter
	#xprate <1.5
    .goto Teldrassil,38.32,34.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    >>|cRXP_WARN_请记住, Mist 是一个限时任务, 你需要在接取后10分钟内提交|r
    .turnin 937 >>交任务: |cRXP_FRIENDLY_神谕林地|r
    .target Sentinel Arynia Cloudsbreak
    .accept 940 >>接任务: |cRXP_LOOT_泰达希尔|r
    .turnin 938 >>交任务: |cRXP_FRIENDLY_密斯特|r
step << Druid
    #xprate <1.5
    #label xp10
    #season 2
    .xp 10
step << Druid
    #xprate <1.5
    #season 0,1
    #label xp10
    .xp 10-750
step << !Hunter !Druid
	#xprate <1.5
    #label xp10
    .xp 10-3110
step
	#xprate 1.49-1.99
   .goto Teldrassil,38.6,58.0
   >>完成收集7条小蜘蛛腿
   .collect 5465,7,4161,1 --Collect Small Spider Leg (x7)
step << Druid
   #xprate 1.49-1.99
   #label xp10
   .xp 10-850
   .goto Teldrassil,38.3,34.4
   >>如果你的经验还落后, 去北方做哈拉帕任务
step << !Druid
    #xprate 1.49-1.99
	#label xp10
	.xp 10-4415
step << !Rogue
    #softcore
    #requires xp10
    #completewith next
    .deathskip >>在达纳苏斯的灵魂医者处死亡并重生
    >>|cRXP_WARN_确保你离达纳苏斯墓地比多尔纳尔墓地更近, 否则可能会跑错方向. 如果不确定, 就一路跑出巢穴, 然后死亡|r << sod Priest
    >>|cRXP_WARN_确保你离达纳苏斯墓地比离多尔纳尔墓地更近, 否则可能会走错方向. 如果不确定, 就跑到河的西岸|r << sod Hunter/sod Warrior/sod Druid
    .target Spirit Healer
step << !Rogue
    #hardcore
	#xprate < 1.5
    #completewith next
    >>在前往达纳苏斯的路上击杀血羽女妖. 从它们身上搜刮腰带. 你无需现在完成此目标
    .complete 937,1 --Collect Bloodfeather Belt (x6)
    .mob Bloodfeather Harpy
    .mob Bloodfeather Rogue
    .mob Bloodfeather Sorceress
    .mob Bloodfeather Fury
    .mob Bloodfeather Wind Witch
    .mob Bloodfeather Matriarch
step << !Rogue
    #hardcore
    #requires xp10
    #completewith next
    .goto Darnassus,82.01,36.70,100 >>前往: |cRXP_PICK_达纳苏斯|r
step << Warrior
#xprate >1.99
    .goto Darnassus,57.305,34.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾兰娜瑞|r交谈
    .turnin 1684 >>交任务: |cRXP_FRIENDLY_艾兰娜瑞|r
    .target Elanaria
    .accept 1683 >>接任务: |cRXP_LOOT_沃鲁斯·邪蹄|r
step << !Rogue !Hunter !Warrior
#xprate >1.99
    .goto Darnassus,67.427,15.655
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板塞琳尼|r交谈
    .home >>将你的[炉石]设置为达纳苏斯 << !Warrior
    .vendor >>|cRXP_BUY_再买一些|r|T132815:0|t|cRXP_LOOT_冰镇牛奶|r << Priest
    .target Innkeeper Saelienne
step << !Rogue
    #requires xp10
    .goto Darnassus,38.18,21.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    .turnin 922 >>交任务: |cRXP_FRIENDLY_雷利亚·绿树|r
    .target Rellian Greenspyre
    .accept 923 >>接任务: |cRXP_LOOT_青苔之瘤|r
step << !Hunter !Rogue
	#xprate <1.5
    .goto Darnassus,34.96,9.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树顶上的|cRXP_FRIENDLY_大德鲁伊范达尔·鹿盔|r交谈
    .turnin 940 >>交任务: |cRXP_FRIENDLY_泰达希尔|r
	.isOnQuest 940
    .target Arch Druid Fandral Staghelm
step << Druid
    .goto Darnassus,35.38,8.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与中层的|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 5925 >>交任务: |cRXP_FRIENDLY_响应召唤|r << sod
    .accept 5921 >>接任务: |cRXP_LOOT_月光林地|r
	.trainer >>训练你的职业法术
    .target Mathrengyl Bearwalker
step << Hunter
#xprate >1.99
    .goto Darnassus,40.377,8.545
    .target Jocaste
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .turnin 6103 >>交任务: |cRXP_FRIENDLY_训练野兽|r
step << !Rogue
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    .target Priestess A'moora
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .accept 2518 >>接任务: |cRXP_LOOT_月神的泪水|r
step
#xprate <1.99
    #requires xp10 << Rogue
    .hs >>炉石传送至多兰纳尔
    .subzoneskip 186
step << Hunter
#xprate <1.99
    .goto Teldrassil,55.890,59.205
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·羽弓|r交谈
	.vendor >>|cRXP_BUY_购买 4 堆|r|T132382:0|t[锋利的箭]|cRXP_BUY_. 达到 10 级后立即装备|r
    .target Jeena Featherbow
step
	#xprate 1.49-1.99
    .goto Teldrassil,57.121,61.296
    .train 2550 >>学习烹饪技能
    .target Zarrin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎瑞恩|r交谈
    .accept 4161 >>接任务: |cRXP_LOOT_卡多雷的菜谱|r
    .turnin 4161 >>交任务: |cRXP_FRIENDLY_卡多雷的菜谱|r
step
	#xprate 1.49-1.99
    .goto Teldrassil,51.9,56.4
    >>找到哨兵阿玛拉·夜行者, 她正在多兰纳尔西方的道路上巡逻
    .target Moon Priestess Amara
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    .turnin 487 >>交任务: |cRXP_FRIENDLY_达纳苏斯之路|r
	.maxlevel 9
step << Hunter
#xprate <1.99
    #optional
    #completewith L10
    #level 10
    #label beast1
    .goto Teldrassil,56.676,59.489
    .target Dazalar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .accept 6063 >>接任务: |cRXP_LOOT_驯服野兽|r
	.train 13165 >>训练你的10级法术
step << Hunter
#xprate <1.99
    #optional
    #completewith L10
    #level 10
    #requires beast1
    #label beast2
    .goto Teldrassil,59.9,58.8
    .use 15921 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒] |cRXP_WARN_对一只|r|cRXP_ENEMY_树林潜伏者|r
    .complete 6063,1 --Tame a Webwood Lurker
    .mob Webwood Lurker
step << Hunter
#xprate <1.99
    #optional
    #completewith L10
    #level 10
    #requires beast2
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6063 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6101 >>接任务: |cRXP_LOOT_驯服野兽|r
step
	#xprate <1.5
    .goto Teldrassil,56.142,61.714
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 7383 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Corithras Moonrage
    .accept 935 >>接任务: |cRXP_LOOT_大地之冠|r
step
	#xprate <1.5
	.goto Teldrassil,60.900,68.489
    .target Denalan
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .turnin 931 >>交任务: |cRXP_FRIENDLY_发光的树叶|r
    .turnin 930 >>交任务: |cRXP_FRIENDLY_发光的水果|r
step
	#xprate <1.5
	.goto Teldrassil,60.900,68.489
    .target Denalan
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
	.turnin 927 >>交任务: |cRXP_FRIENDLY_布满苔藓的心脏|r
    .isOnQuest 927
step
	#xprate <1.5
	.goto Teldrassil,60.78,68.59
	>>点击|cRXP_LOOT_德纳兰的园艺师|r
	.turnin 941 >>交任务: |cRXP_FRIENDLY_培养心脏|r
	.isQuestTurnedIn 927
step << Hunter
	#xprate <1.5
    .goto Teldrassil,62.6,72.2
    .use 15922 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_夜刃捕食者|r
    >>|cRXP_WARN_你必须右键点击宠物界面并解散当前宠物, 才能驯服新的宠物|r
    .complete 6101,1 --Tame a Nightsaber Stalker
	.isOnQuest 6101
    .mob Nightsaber Stalker
step
#xprate <1.99
    #label L10
    .xp 10
step
	#xprate <1.5
    #softcore
	#sticky
    #completewith next
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
step << Priest
#xprate <1.99
    .goto Teldrassil,55.564,56.746
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
	.trainer >>训练你的职业法术
    .target Laurna Morninglight
step << Warrior
#xprate <1.99
    .goto Teldrassil,56.221,59.198
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·风刃|r交谈
	.trainer >>训练你的职业法术
    .target Kyra Windblade
step << Rogue
#xprate <1.99
    .goto Teldrassil,56.381,60.139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
	.trainer >>训练你的职业法术
    .train 5171 >>训练 |T132306:0|t[切片与切割]
    .train 921 >>学习 |T133644:0|t[扒窃]技能, 这也是完成你10级潜行者任务所需的
    .target Jannok Breezesong
step << Hunter
#xprate <1.99
    .goto Teldrassil,56.676,59.489
    .target Dazalar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .accept 6063 >>接任务: |cRXP_LOOT_驯服野兽|r
	.trainer >>训练你的职业法术
step << Hunter
#xprate <1.99
    .goto Teldrassil,59.9,58.8
    .use 15921 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒] |cRXP_WARN_对一只|r|cRXP_ENEMY_树林潜伏者|r
    .complete 6063,1 --Tame a Webwood Lurker
    .mob Webwood Lurker
step << Hunter
#xprate <1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6063 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6101 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
#xprate <1.99
    .goto Teldrassil,62.6,72.2
    .use 15922 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_夜刃捕食者|r
    >>|cRXP_WARN_你必须右键点击宠物界面并解散当前宠物, 才能驯服新的宠物|r
    .complete 6101,1 --Tame a Nightsaber Stalker
    .mob Nightsaber Stalker
step << Hunter
#xprate <1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6101 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6102 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
#xprate <1.99
    .goto Teldrassil,64.7,66.7
    .use 15923 >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_巨翼恶枭|r
    >>|cRXP_WARN_你必须右键点击宠物界面并解散当前宠物, 才能驯服新的宠物|r
    .complete 6102,1 --Tame a Strigid Screecher
    .mob Strigid Screecher
step << Hunter
#xprate <1.99
    .goto Teldrassil,56.676,59.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达扎拉|r交谈
    .turnin 6102 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .target Dazalar
    .accept 6103 >>接任务: |cRXP_LOOT_训练野兽|r
step << Warrior
#xprate <1.99
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_巡逻多兰纳尔以西的道路|r
    .accept 1684 >>接任务: |cRXP_LOOT_艾兰娜瑞|r
    .target Moon Priestess Amara
step << Rogue
#xprate <1.99
    .goto Teldrassil,56.381,60.139
    .target Jannok Breezesong
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹诺克·柔歌|r交谈
    .accept 2241 >>接任务: |cRXP_LOOT_詹诺克的花|r
step << Hunter
	#xprate <1.5--money issues 1.5x
    .goto Teldrassil,56.308,59.488
    .money <0.0504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙洛蒙|r交谈
    >>|cRXP_BUY_购买|r |T135145:0|t[手杖]
    >>|cRXP_WARN_你稍后会装备这个. 如果你恰好找到了另一根法杖, 请跳过此步骤|r
    .collect 2495,1 -- Walking Stick (1)
    .target Shalomon
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.20
step << !Druid
#xprate <1.99
    .goto Teldrassil,55.83,58.31,40,0
    .goto Teldrassil,50.22,53.83
    .goto Teldrassil,55.83,58.31,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r交谈
    >>|cRXP_FRIENDLY_哨兵阿玛拉·夜行者|r |cRXP_WARN_巡逻多兰纳尔以西的道路|r
    .turnin 487 >>交任务: |cRXP_FRIENDLY_达纳苏斯之路|r
    .target Moon Priestess Amara
step << Rogue
#xprate <1.99
    #softcore
    #completewith next
    .goto Teldrassil,44.0,54.6
    .deathskip >>一旦通过熊怪区域, 故意死亡并在达纳苏斯墓地复活
    .target Spirit Healer
step << Rogue
    #hardcore
    #completewith next
    .goto Darnassus,82.01,36.70,100 >>前往: |cRXP_PICK_达纳苏斯|r
step << Rogue
    .goto Darnassus,38.18,21.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    .turnin 922 >>交任务: |cRXP_FRIENDLY_雷利亚·绿树|r
    .target Rellian Greenspyre
    .accept 923 >>接任务: |cRXP_LOOT_青苔之瘤|r
step << Rogue
    #season 0
    .goto Darnassus,34.96,9.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树顶上的|cRXP_FRIENDLY_大德鲁伊范达尔·鹿盔|r交谈
    .turnin -935 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .turnin -940 >>交任务: |cRXP_FRIENDLY_泰达希尔|r
    .target Arch Druid Fandral Staghelm
    .accept 952 >>接任务: |cRXP_LOOT_古树之林|r
step << Rogue
    .goto Darnassus,31.21,17.72,8,0
    .goto Darnassus,36.99,21.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞尤娜|r交谈
    .turnin 2241 >>交任务: |cRXP_FRIENDLY_詹诺克的花|r
    .target Syurna
    .accept 2242 >>接任务: |cRXP_LOOT_命运的召唤|r
step << Rogue
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    .target Priestess A'moora
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .accept 2518 >>接任务: |cRXP_LOOT_月神的泪水|r
step << Warrior
#xprate >1.99
    #sticky
    #completewith next
    .goto Teldrassil,48.7,62.2,18 >>前往|cRXP_ENEMY_沃鲁斯·邪蹄|r
step << Warrior
#xprate >1.99
    .goto Teldrassil,47.2,63.7
    >>击杀 |cRXP_ENEMY_沃鲁斯·邪蹄|r. 击败他后拾取他的 |cRXP_LOOT_Horn|r
    .complete 1683,1 --Collect Horn of Vorlus (x1)
    .mob Vorlus Vilehoof
step << Hunter
    #sticky
	.goto Teldrassil,41.2,44.4,0
	.goto Teldrassil,44.2,39.8,0
	.goto Teldrassil,45.6,31.4,0
	.goto Teldrassil,37.6,28.8,0
    >>|cRXP_WARN_施放|r|T132164:0|t[驯服野兽]|cRXP_WARN_在|r|cRXP_ENEMY_巨翼猎枭|r身上|r -- .tame 1997
    .train 2981 >>|cRXP_WARN_用它攻击怪物来学习|r |T132140:0|t[利爪 (等级 2)]
    .link https://www.wow-petopia.com/classic/training.php >>|cRXP_WARN_点击此处了解更多关于宠物训练的信息|r
	.unitscan Strigid Hunter
step
    #sticky
    #completewith Spinnerets
    .goto Teldrassil,41.7,41.8,0
    .goto Teldrassil,43.80,26.03,0
	>>击杀|cRXP_ENEMY_林精践踏者|r和|cRXP_ENEMY_林精泥泞兽|r和|cRXP_ENEMY_林精长老|r. 击杀后可掠夺其掉落的|cRXP_LOOT_青苔之瘤|r
    .complete 923,1 --Collect Mossy Tumor (x5)
    .mob Elder Timberling
    .mob Timberling Trampler
    .mob Timberling Mire Beast
step
    #label Spinnerets
    #loop
    .goto Teldrassil,41.7,41.8,0
    .goto Teldrassil,48.0,25.2,0
    .goto Teldrassil,42.0,25.6,0
    .goto Teldrassil,39.6,25.6,0
    .line Teldrassil,41.70,41.82,41.97,39.03,42.20,35.71,43.33,33.27,43.79,30.65,44.18,27.80,46.09,26.55,47.72,25.57,46.25,25.62,44.42,26.09,42.83,26.15,42.0,25.6,39.6,25.6
    >>击杀|cRXP_ENEMY_萨丝拉|r. 从她身上搜刮|cRXP_LOOT_纺丝器|r
    >>|cRXP_ENEMY_女爵萨丝拉|r|cRXP_WARN_可在3个不同地点刷新, 请查看地图选择推荐路线前往|r
    >>|cRXP_WARN_沿河向北前进, 先检查最东边的刷新点. 沿途完成|r|T134339:0|t[青苔之瘤]|cRXP_WARN_quest任务|r
    >>|cRXP_WARN_如果她不在河的东边, 请在前往西边之前完成|r|T134339:0|t[青苔之瘤]|cRXP_WARN_quest任务|r
    .complete 2518,1 --Collect Silvery Spinnerets (x1)
    .mob Lady Sathrah
step
    .goto Teldrassil,38.3,34.3
    .target Sentinel Arynia Cloudsbreak
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .accept 937 >>接任务: |cRXP_LOOT_神谕林地|r
step << Rogue
    .goto Teldrassil,38.0,25.2
    >>|cRXP_WARN_对远古的塞希尔施放|r|T133644:0|t[盗贼技能:扒窃]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_ENEMY_远古的塞希尔|r|cRXP_WARN_沿着大树枝行走|r
    >>|cRXP_WARN_避免与|cRXP_ENEMY_远古的塞希尔|r战斗. 让他从你身边走过, 然后|r|T132320:0|t[潜行]|cRXP_WARN_并在|r|T133644:0|t[偷窃]|cRXP_WARN_他身后时|r
    .complete 2242,1
    .mob Sethir the Ancient
step
    #sticky
	#label harpies2
    .goto Teldrassil,33.619,29.819,0,0
    >>击杀|cRXP_ENEMY_Bloodfeather Harpies|r. 击杀后搜刮它们的|cRXP_LOOT_Belts|r
    >>|cRXP_ENEMY_血羽女族长|r|cRXP_WARN_施法|r|T136052:0|t[治疗波]|cRXP_WARN_和|r|T136048:0|t[闪电箭]|cRXP_WARN_会造成大量伤害. 尽量快速击杀|r
    .complete 937,1 --Collect Bloodfeather Belt (x6)
    .mob Bloodfeather Harpy
    .mob Bloodfeather Rogue
    .mob Bloodfeather Sorceress
    .mob Bloodfeather Fury
    .mob Bloodfeather Wind Witch
    .mob Bloodfeather Matriarch
step
    .goto Teldrassil,31.54,31.62
    .target Mist
    #label MistStart
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密斯特|r交谈
    >>|cRXP_WARN_这将触发一个护送任务|r
    >>|cRXP_WARN_如果NPC不在, 请跳过此任务|r
    .accept 938 >>接任务: |cRXP_LOOT_密斯特|r
step
    .goto Teldrassil,38.3,34.4
    .target Sentinel Arynia Cloudsbreak
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    >>|cRXP_WARN_请记住, 这是一个限时任务, 您需要在接取后10分钟内提交|r
    .turnin 938 >>交任务: |cRXP_FRIENDLY_密斯特|r
    .isOnQuest 938
step
    #requires harpies2
    #label TeldrassilEnd
    .goto Teldrassil,38.3,34.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin 937 >>交任务: |cRXP_FRIENDLY_神谕林地|r
    .target Sentinel Arynia Cloudsbreak
    .accept 940 >>接任务: |cRXP_LOOT_泰达希尔|r
step
    #softcore
	#completewith darn << era
    #completewith darnSoD << sod
    .deathskip >>在达纳苏斯墓地死亡并复活
    >>|cRXP_WARN_确保你位于河的西岸, 否则可能会走错方向|r << sod
    .target Spirit Healer
step
    #hardcore
    #completewith next
    .goto Darnassus,82.01,36.70
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step
    #hardcore
    #completewith next
    #season 2
    .goto Darnassus,82.01,36.70
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step
    .goto Darnassus,70.679,45.379
    .target Mydrannul
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈德兰努尔|r交谈
    .accept 6344 >>接任务: |cRXP_LOOT_尼莎·影歌|r
step
    #softcore
    #label darn
    #optional
    .goto Darnassus,82.01,36.70
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step
	.abandon 927 >>放弃苔藓缠绕之心. 你将永远没有机会提交任务
step << Warrior
#xprate <1.99
    .goto Darnassus,57.305,34.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾兰娜瑞|r交谈
    .turnin 1684 >>交任务: |cRXP_FRIENDLY_艾兰娜瑞|r
    .target Elanaria
    .accept 1683 >>接任务: |cRXP_LOOT_沃鲁斯·邪蹄|r
step << Warrior
#xprate <1.99
    #sticky
    #completewith next
    .goto Teldrassil,48.7,62.2,18 >>前往|cRXP_ENEMY_沃鲁斯·邪蹄|r
step << Warrior
#xprate <1.99
    .goto Teldrassil,47.2,63.7
    >>击杀 |cRXP_ENEMY_沃鲁斯·邪蹄|r. 击败他后拾取他的 |cRXP_LOOT_Horn|r
    .complete 1683,1 --Collect Horn of Vorlus (x1)
    .mob Vorlus Vilehoof
step << Warrior
#xprate <1.99
    #softcore
	#sticky
    #completewith next
    .goto Teldrassil,43.6,54.3
    .deathskip >>通过熊怪区域后故意死亡, 并在达纳苏斯复活
step << Warrior
#xprate <1.99
    #hardcore
    #completewith next
    .goto Darnassus,82.01,36.70,100 >>前往: |cRXP_PICK_达纳苏斯|r
step << Warrior
    .goto Darnassus,57.305,34.606
    .target Elanaria
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾兰娜瑞|r交谈
    .turnin 1683 >>交任务: |cRXP_FRIENDLY_沃鲁斯·邪蹄|r
--	.accept 1686 >>接任务: |cRXP_LOOT_艾鲁拉的阴影|r
step << Druid
    #season 0
    .goto Darnassus,35.38,8.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与中层的|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 5931 >>交任务: |cRXP_FRIENDLY_返回达纳苏斯|r
    .target Mathrengyl Bearwalker
    .accept 6001 >>接任务: |cRXP_LOOT_身心之力|r
step
    #season 0
    .goto Darnassus,34.814,9.255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊范达尔·鹿盔|r交谈
    .turnin -935 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .turnin -940 >>交任务: |cRXP_FRIENDLY_泰达希尔|r
    .target Arch Druid Fandral Staghelm
    .accept 952 >>接任务: |cRXP_LOOT_古树之林|r
step << Hunter
#xprate <1.99
    .goto Darnassus,40.377,8.545
    .target Jocaste
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .turnin 6103 >>交任务: |cRXP_FRIENDLY_训练野兽|r
step << Hunter
    >>|cRXP_WARN_沿着|r|cRXP_FRIENDLY_祖卡斯特| 右侧的坡道向上走|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_西尔瓦莉雅|r交谈
    .goto Darnassus,42.2,8.8
    .trainer >>训练宠物技能
    .target Silvaria
step
    #season 0
    .goto Darnassus,38.184,21.639
    .target Rellian Greenspyre
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    .turnin 923 >>交任务: |cRXP_FRIENDLY_青苔之瘤|r
step << Rogue
    .goto Darnassus,31.21,17.72,8,0
    .goto Darnassus,36.99,21.91
    .target Syurna
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞尤娜|r交谈
    .turnin 2242 >>交任务: |cRXP_FRIENDLY_命运的召唤|r
step
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .turnin 2518 >>交任务: |cRXP_FRIENDLY_月神的泪水|r
    .target Priestess A'moora
    .accept 2520 >>接任务: |cRXP_LOOT_萨丝拉的祭品|r
step
    .goto Darnassus,39.7,85.8
	.use 8155 >>|cRXP_WARN_使用|r|T135652:0|t[萨丝拉的祭品]|cRXP_WARN_在喷泉处|r
    .complete 2520,1 --Offer the sacrifice at the fountain
step
    #label end
    .goto Darnassus,39.72,92.68,10,0
    .goto Darnassus,36.65,85.93
    .target Priestess A'moora
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .turnin 2520 >>交任务: |cRXP_FRIENDLY_萨丝拉的祭品|r
step << Druid
#ssf
    #season 0
    .goto Darnassus,47.95,68.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲罗迪恩·唤月|r交谈
    .train 2366 >>学习 |T136065:0|t[草药学]
    >>|T136065:0|t[草药学] |cRXP_WARN_需要采集 5|r|T134187:0|t[地根草] |cRXP_WARN_用于一个即将开启的重要职业任务. 完成后可选择遗忘|r
    .target Firodren Mooncaller
step
    #ah
    .goto Darnassus,56.245,54.039,-1
    .goto Darnassus,56.374,51.820,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达纳苏斯拍卖商|r交谈
    >>请购买以下物品, 以便稍后在黑海岸立即提交
    >>|T134187:0|t[地根草] << Druid era
    >>|T133912:0|t[黑海岸石斑鱼]
    >>|T133972:0|t[陆行鸟肉]
    *Skip this step if you wish to not buy any
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .collect 2449,5,6123,1 << Druid
    .target Auctioneer Tolon
    .target Auctioneer Golothas
step << Hunter
    .goto Darnassus,64.2,63.0
    .line Darnassus,60.65,66.47,61.68,63.73,62.36,58.91,62.32,55.22,65.77,55.75,67.88,57.48,68.35,59.98,65.14,68.14,64.34,71.36,62.28,68.79,60.65,66.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t寻找|cRXP_FRIENDLY_加伊娜|r, 她会在商人露台附近巡逻
    >>|cRXP_BUY_从她那里购买一整堆|r|T133972:0|t[硬肉干]
    >>|cRXP_WARN_你需要它来喂你的猫头鹰, 它们只吃肉, 而暗夜精灵的黑海岸没有卖肉的商人|r
    .collect 117,15
    .target Jaeana
step << Hunter/Warrior/Priest/Sod Rogue
    .goto Darnassus,57.56,46.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊琳尼雅·月火|r交谈
    .train 227 >>训练法杖 << Hunter/Warrior/Priest
    .train 265 >>训练弓箭 << Sod Rogue
    >>如果你的背包里有法杖, 请装备它 << Hunter
    >>如果你的背包里有弓, 请装备它 << Rogue
    .target Ilyenia Moonfire
step << Hunter
    #optional
    #completewith end
    +|cRXP_WARN_装备|r|T135145:0|t[手杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.19
step << Hunter/Sod Rogue
    .goto Darnassus,58.76,44.48
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
    >>|cRXP_BUY_购买并装备 a|r|T135489:0|t[多层弯弓]
    .collect 2507,1
    .target Ariyell Skyshadow
    .money <0.1751
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.77
step << Hunter
    #season 0
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
	.vendor >>|cRXP_BUY_购买|r|T132382:0|t[锋利的箭]
    .target Ariyell Skyshadow
step << Hunter
    #completewith next
    +|cRXP_WARN_装备|r |T135489:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.76
step << Warrior
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
    >>|cRXP_BUY_购买|r|T135147:0|t[法师之杖]|cRXP_BUY_. 在15级时装备它|r
	.collect 2030,1
    .target Ariyell Skyshadow
    .money <0.5022
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Warrior
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
    >>|cRXP_BUY_购买 a|r|T135154:0|t[短杖]|cRXP_BUY_. 在 11 级时装备它|r << era
    >>|cRXP_BUY_购买并装备|r|T135154:0|t[短杖] |cRXP_BUY_如果买不起, 就用|r|T135147:0|t[法师之杖] << sod
	.collect 854,1
    .target Ariyell Skyshadow
    .money <0.3022
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.44
step << Warrior
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿瑞耶尔·天影|r交谈
	>>|cRXP_BUY_购买并装备|r |T135346:0|t[斗士短剑] |cRXP_BUY_如果负担不起, 就用|r |T135154:0|t[短杖]
	.collect 851,1
    .target Ariyell Skyshadow
    .money <0.2023
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.82
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r|T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.81
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r|T135154:0|t[短杖]
    .use 854
    .itemcount 854,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.43
step << Rogue
    #season 0
    .goto Darnassus,62.68,65.58
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_雷利亚·绿树|r交谈
    >>|cRXP_BUY_购买一个|r|T135641:0|t[破损的平衡飞刀]
    .collect 2946,1 -- Balanced Throwing Dagger
    .target Turian
step
    #completewith NessaShadowsong
    .goto Darnassus,28.52,39.89
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
    .zoneskip Darkshore
    .subzoneskip 702
step
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼莎·影歌|r 交谈
    .turnin 6344 >>交任务: |cRXP_FRIENDLY_尼莎·影歌|r
    .target Nessa Shadowsong
    .accept 6341 >>接任务: |cRXP_LOOT_泰达希尔的渔业|r
step
    #label NessaShadowsong
    #optional
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼莎·影歌|r 交谈
    .turnin 6343 >>交任务: |cRXP_FRIENDLY_飞回泰达希尔|r
    .isOnQuest 6343
    .target Nessa Shadowsong
step
    .goto Teldrassil,58.399,94.016
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .turnin 6341 >>交任务: |cRXP_FRIENDLY_泰达希尔的渔业|r
    .target Vesprystus
    .accept 6342 >>接任务: |cRXP_LOOT_飞往奥伯丁|r
step
    .goto Teldrassil,58.399,94.016
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >>飞往黑海岸
    .target Vesprystus
]])
