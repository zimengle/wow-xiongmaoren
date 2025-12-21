local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< BloodElf
#name 1-6 永歌森林
#displayname 1-6 永歌森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 部落 1-30
#defaultfor BloodElf
#next 6-10 永歌森林


step << !BloodElf
    #completewith next
    +|cRXP_WARN_您选择的是一份专为血精灵设计的指南. 我们不建议前往1-6级区域, 因为那里没有适合非血精灵的任务. 请您选择与您起始时相同的初始区域|r
step
    .goto Eversong Woods,38.2,20.8 << tbc
    .goto Eversong Woods,38.02,21.01 << wotlk
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃罗娜|r交谈
    .accept 8325 >>接任务: |cRXP_LOOT_夺回逐日岛|r
    .target Magistrix Erona
--VV need to update waypoint for tbc
step << Warlock wotlk
    #completewith Reclaim
    +|cRXP_WARN_击杀 |cRXP_ENEMY_法力浮龙|r. 刷怪直到你获得价值75铜的商人可售物品. 你也可以把装备卖掉, 赚取13铜|r << Warlock wotlk
    .money >0.0075
--VV other classes in other expansions should not need to go out of their way to grind for money
step
    .goto Eversong Woods,37.70,23.26,30,0
    .goto Eversong Woods,38.21,24.56,30,0
    .goto Eversong Woods,37.62,25.77,30,0
    .goto Eversong Woods,37.30,24.54,30,0
    .goto Eversong Woods,37.70,23.26,30,0
    .goto Eversong Woods,38.21,24.56,30,0
    .goto Eversong Woods,37.62,25.77,30,0
    .goto Eversong Woods,37.30,24.54
    >>击杀|cRXP_ENEMY_法力浮龙|r
    .complete 8325,1 --Kill Mana Wyrm (x8)
    .mob Mana Wyrm
--VV Vendorable item value command
step
    #label Reclaim
    .goto Eversong Woods,38.2,20.8 << tbc
	.goto Eversong Woods,38.02,21.01 << wotlk
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃罗娜|r交谈
    .turnin 8325 >>交任务: |cRXP_FRIENDLY_夺回逐日岛|r
    .accept 8326 >>接任务: |cRXP_LOOT_令人遗憾的措施|r
    .accept 8328 >>接任务: |cRXP_LOOT_法师训练|r << Mage
    .accept 8563 >>接任务: |cRXP_LOOT_术士训练|r << Warlock
    .accept 8564 >>接任务: |cRXP_LOOT_牧师训练|r << Priest
    .accept 9392 >>接任务: |cRXP_LOOT_潜行者训练|r << Rogue
	.accept 9393 >>接任务: |cRXP_LOOT_猎人训练|r << Hunter
    .accept 9676 >>接任务: |cRXP_LOOT_圣骑士训练|r << Paladin
    .target Magistrix Erona
step
    #completewith next
    .goto Eversong Woods,38.56,20.98,10,0
    .goto Eversong Woods,38.66,20.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shara|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132382:0|t[劣质箭]|cRXP_BUY_, 直到你的|r|T134409:0|t[箭袋]|cRXP_BUY_已满|r << Hunter
    >>|cRXP_BUY_购买|r|T132794:0|t[清凉的泉水] |cRXP_BUY_从她处获得|r << Warlock TBC/Mage TBC/Priest TBC
    .vendor >>出售垃圾
    .collect 159,10,8336,1 << Priest TBC/Warlock TBC/Mage TBC --Collect Refreshing Spring Water (x10)
    .target Shara Sunwing
    .money >0.1 << WOTLK !Hunter/!Hunter !Priest !Warlock !Mage TBC
--VV skip vendoring if you have 10s (character likely has additional bags)
step << Mage
    .goto Eversong Woods,39.23,21.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Julia|r交谈
    .turnin 8328 >>交任务: |cRXP_FRIENDLY_法师训练|r
    .accept 10068 >>接任务: |cRXP_LOOT_护井者索兰尼亚|r
    .train 1459 >>训练你的职业法术
    .target Julia Sunstriker
step << Warlock
    .goto Eversong Woods,38.93,21.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Teli'Larien|r 交谈
    .turnin 8563 >>交任务: |cRXP_FRIENDLY_术士训练|r
    .accept 10073 >>接任务: |cRXP_LOOT_护井者索兰尼亚|r
    .accept 8344 >>接任务: |cRXP_WARN_[Windows to the Source]|r << tbc
    .train 688 >>训练你的职业法术
    .target Summoner Teli'Larien
step << Priest
    .goto Eversong Woods,39.42,20.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_竞技场|r交谈
    .turnin 8564 >>交任务: |cRXP_FRIENDLY_牧师训练|r
    .accept 10072 >>接任务: |cRXP_LOOT_护井者索兰尼亚|r
    .train 1243 >>训练你的职业法术
    .target Matron Arena
step << Rogue
    .goto Eversong Woods,38.93,20.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Avokor|r交谈
    .turnin 9392 >>交任务: |cRXP_FRIENDLY_潜行者训练|r
    .accept 10071 >>接任务: |cRXP_LOOT_护井者索兰尼亚|r
    .target Pathstalker Avokor
step << Hunter
    .goto Eversong Woods,39.05,20.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与游侠萨琳娜交谈|cRXP_FRIENDLY_Sallina|r
    .turnin 9393 >>交任务: |cRXP_FRIENDLY_猎人训练|r
    .accept 10070 >>接任务: |cRXP_LOOT_护井者索兰尼亚|r
    .target Ranger Sallina
step << Paladin
    .goto Eversong Woods,39.47,20.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶泰尼斯·射日者|r交谈
    .turnin 9676 >>交任务: |cRXP_FRIENDLY_圣骑士训练|r
    .accept 10069 >>接任务: |cRXP_LOOT_护井者索兰尼亚|r
    .target Jesthenis Sunstriker
step << Warlock wotlk
	#completewith Collars
	.cast 688 >>|cRXP_WARN_Cast|r|T136218:0|t[召唤地狱火]
step
    #completewith next
    .goto Eversong Woods,39.43,21.06,10,0
    .goto Eversong Woods,39.48,20.58,10,0
    .goto Eversong Woods,39.31,20.23,10,0
    .goto Eversong Woods,38.93,19.93,10,0
    .goto Eversong Woods,38.76,19.36,10 >>上楼
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Solanian|r和|cRXP_FRIENDLY_Ithanas|r和|cRXP_FRIENDLY_Helion|r交谈
    .turnin 10068 >>交任务: |cRXP_FRIENDLY_护井者索兰尼亚|r << Mage
    .turnin 10069 >>交任务: |cRXP_FRIENDLY_护井者索兰尼亚|r << Paladin
    .turnin 10070 >>交任务: |cRXP_FRIENDLY_护井者索兰尼亚|r << Hunter
    .turnin 10071 >>交任务: |cRXP_FRIENDLY_护井者索兰尼亚|r << Rogue
    .turnin 10072 >>交任务: |cRXP_FRIENDLY_护井者索兰尼亚|r << Priest
    .turnin 10073 >>交任务: |cRXP_FRIENDLY_护井者索兰尼亚|r << Warlock
    .accept 8330 >>接任务: |cRXP_LOOT_索兰尼亚的物品|r
    .accept 8345 >>接任务: |cRXP_LOOT_达斯雷玛的神龛|r
    .goto Eversong Woods,38.76,19.36
    .accept 8336 >>接任务: |cRXP_LOOT_奥术薄片|r
    .goto Eversong Woods,38.27,19.13
    .accept 8346 >>接任务: |cRXP_LOOT_无尽的渴求|r
    .goto Eversong Woods,37.18,18.94
    .target Well Watcher Solanian
    .target Arcanist Ithanas
    .target Arcanist Helion
step << Warlock tbc
    #completewith next
    >>施放 |T135738:0|t[法力汲取] 并击杀 |cRXP_ENEMY_法力浮龙|r和 |cRXP_ENEMY_凶猛的树人嫩苗|r. 从它们身上掠夺 |cRXP_LOOT_碎片|r
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .complete 8346,1 --Mana Tap creature (x6)
    .mob Mana Wyrm
    .mob Feral Tender
step << Warlock tbc
    #completewith next
    >>击杀|cRXP_ENEMY_魔泉山猫幼崽|r 和|cRXP_ENEMY_魔泉山猫幼崽|r . 掠夺它们以获得|cRXP_LOOT_项圈|r
    .complete 8326,1 --Lynx Collar (8)
    .mob Springpaw Lynx
    .mob Springpaw Cub
step << Warlock tbc
    #label RunRamp
    #completewith next
    .goto Eversong Woods,32.57,25.53,20,0
    .goto Eversong Woods,32.02,26.09,20 >>跑上坡道
step << Warlock tbc
    #requires RunRamp
    #completewith next
    >>施放 |T135738:0|t[法力汲取], 击杀|cRXP_ENEMY_奥术怨灵|r和|cRXP_ENEMY_被污染的奥术怨灵|r. 从|cRXP_ENEMY_奥术怨灵|r身上获取其|cRXP_LOOT_奥术精华|r, 并从两者身上获取其|cRXP_LOOT_碎屑|r
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .complete 8346,1 --Mana Tap creature (x6)
    .complete 8344,1 --Wraith Essence (4)
    .mob Arcane Wraith
    .mob Tainted Arcane Wraith
step << Warlock tbc
	#label ArcaneSliver
    .goto Eversong Woods,31.57,29.31,30,0
    .goto Eversong Woods,31.25,27.07,30,0
    .goto Eversong Woods,30.90,27.66,30,0
    .goto Eversong Woods,30.55,26.98,30,0
    .goto Eversong Woods,31.10,26.83
    >>击杀一个|cRXP_ENEMY_被污染的奥术怨灵|r. 击败后拾取其|cRXP_LOOT_精华|r和 |T132884:0|t[|cRXP_LOOT_被污染的奥术薄片|r]
    >>|cRXP_WARN_使用 |T132884:0|t[|cRXP_LOOT_被污染的奥术薄片|r] 开始任务|r
    .complete 8344,2 --Tainted Wraith Essence (1)
    .collect 20483,1,8338,1 --Tainted Arcane Sliver (1)
    .accept 8338 >>接任务: |cRXP_LOOT_被污染的奥术薄片|r
    .mob Tainted Arcane Wraith
    .use 20483
step << Warlock tbc
    .goto Eversong Woods,30.45,29.10,30,0
    .goto Eversong Woods,30.01,26.67,30,0
    .goto Eversong Woods,30.43,24.94,30,0
    .goto Eversong Woods,31.70,26.46,30,0
    .goto Eversong Woods,31.98,27.94,30,0
    .goto Eversong Woods,31.54,29.52,30,0
    .goto Eversong Woods,30.45,29.10,30,0
    .goto Eversong Woods,30.01,26.67,30,0
    .goto Eversong Woods,30.43,24.94,30,0
    .goto Eversong Woods,31.70,26.46,30,0
    .goto Eversong Woods,31.98,27.94,30,0
    .goto Eversong Woods,31.54,29.52
    >>施放 |T135738:0|t[法力汲取], 击杀|cRXP_ENEMY_奥术怨灵|r和|cRXP_ENEMY_被污染的奥术怨灵|r. 从|cRXP_ENEMY_奥术怨灵|r身上获取其|cRXP_LOOT_奥术精华|r, 并从两者身上获取其|cRXP_LOOT_碎屑|r
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .complete 8346,1 --Mana Tap creature (x6)
    .complete 8344,1 --Wraith Essence (4)
    .mob Arcane Wraith
    .mob Tainted Arcane Wraith
step << Warlock tbc
    .goto Eversong Woods,30.45,29.10,30,0
    .goto Eversong Woods,30.01,26.67,30,0
    .goto Eversong Woods,30.43,24.94,30,0
    .goto Eversong Woods,31.70,26.46,30,0
    .goto Eversong Woods,31.98,27.94,30,0
    .goto Eversong Woods,31.54,29.52,30,0
    .goto Eversong Woods,30.45,29.10,30,0
    .goto Eversong Woods,30.01,26.67,30,0
    .goto Eversong Woods,30.43,24.94,30,0
    .goto Eversong Woods,31.70,26.46,30,0
    .goto Eversong Woods,31.98,27.94,30,0
    .goto Eversong Woods,31.54,29.52
    .xp 3+200 >>升级至200+/1400经验值
step << Warlock tbc
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step << Warlock tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helion|r和|cRXP_FRIENDLY_Ithanas|r交谈
    .turnin 8346 >>交任务: |cRXP_FRIENDLY_无尽的渴求|r
    .turnin 8338 >>交任务: |cRXP_FRIENDLY_被污染的奥术薄片|r
    .goto Eversong Woods,37.18,18.94
    .turnin 8336 >>交任务: |cRXP_FRIENDLY_奥术薄片|r
    .goto Eversong Woods,38.27,19.13
    .target Arcanist Helion
    .target Arcanist Ithanas
step << Warlock tbc
    #completewith next
    .goto Eversong Woods,38.56,20.98,10,0
    .goto Eversong Woods,38.66,20.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shara|r交谈
    >>|cRXP_BUY_购买|r|T132794:0|t[清凉的泉水] |cRXP_BUY_从她处获得|r
    .vendor >>出售垃圾
    .collect 159,10,8336,1 --Collect Refreshing Spring Water (10)
    .target Shara Sunwing
step << Warlock tbc
    .xp 4 >>升级至4级
--VV Needs to be changed to a properly calculated xp gate when TBC rolls back around
step << Warlock tbc
    .goto Eversong Woods,38.93,21.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Teli'Larien|r 交谈
    .turnin 8344 >>交任务: |cRXP_FRIENDLY_[Windows to the Source]|r
    .train 172 >>训练你的职业法术
    .target Summoner Teli'Larien
step << Warlock tbc
	#completewith Measures
	.cast 688 >>|cRXP_WARN_Cast|r|T136218:0|t[召唤地狱火]
step << Warlock tbc
    .goto Eversong Woods,38.86,21.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚斯米|r交谈
    >>|cRXP_BUY_从她那里购买|r|T133738:0|t[血契法典]|r
    .collect 16321,1,8327,1 --Grimoire of Blood Pact (1)
    .target Yasmine Teli'Larien
step << Warlock tbc
    #completewith Measures
	.cast 20397 >>使用你的 |T133738:0|t[血契法典]
	.use 16321
step << wotlk
    #completewith RedOrb
    >>当处于法力浮龙的近战范围内时, 施放奥术洪流
    .complete 8346,1 --Mana Tap creature (1)
step
    #label Collars
    >>击杀|cRXP_ENEMY_魔泉山猫幼崽|r 和|cRXP_ENEMY_魔泉山猫幼崽|r . 掠夺它们以获得|cRXP_LOOT_项圈|r
    .goto Eversong Woods,37.37,18.31,35,0
    .goto Eversong Woods,39.36,18.83,35,0
    .goto Eversong Woods,39.85,16.63,35,0
    .goto Eversong Woods,40.61,16.24,35,0
    .goto Eversong Woods,40.37,18.80,35,0
    .goto Eversong Woods,40.48,20.38,35,0
    .goto Eversong Woods,39.42,22.28,35,0
    .goto Eversong Woods,35.98,24.22,35,0
    .goto Eversong Woods,37.37,18.31,35,0
    .goto Eversong Woods,39.36,18.83,35,0
    .goto Eversong Woods,39.85,16.63,35,0
    .goto Eversong Woods,40.61,16.24,35,0
    .goto Eversong Woods,40.37,18.80,35,0
    .goto Eversong Woods,40.48,20.38,35,0
    .goto Eversong Woods,39.42,22.28,35,0
    .goto Eversong Woods,35.98,24.22
    .complete 8326,1 --Collect Lynx Collar (x8)
    .mob Springpaw Lynx
    .mob Springpaw Cub
step
    #label Measures
    .goto Eversong Woods,38.2,20.8 << tbc
	.goto Eversong Woods,38.02,21.01 << wotlk
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃罗娜|r交谈
    .turnin 8326 >>交任务: |cRXP_FRIENDLY_令人遗憾的措施|r
    .accept 8327 >>接任务: |cRXP_LOOT_向兰萨恩·派雷隆报到|r
    .target Magistrix Erona
step << !Warlock tbc
    #completewith Journal
    >>施放 |T135738:0|t[法力汲取] 并击杀 |cRXP_ENEMY_法力浮龙|r和 |cRXP_ENEMY_凶猛的树人嫩苗|r. 从它们身上掠夺 |cRXP_LOOT_碎片|r
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .complete 8346,1 --Mana Tap creature (x6)
    .mob Mana Wyrm
    .mob Feral Tender
step << wotlk
    #completewith Journal
    >>击杀|cRXP_ENEMY_法力浮龙|r和|cRXP_ENEMY_凶猛的树人嫩苗|r. 击败它们获取|cRXP_LOOT_片状物|r
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .mob Mana Wyrm
    .mob Feral Tender
step
    #label Report
    .goto Eversong Woods,35.37,22.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lanthan|r交谈
    .turnin 8327 >>交任务: |cRXP_FRIENDLY_向兰萨恩·派雷隆报到|r
    .accept 8334 >>接任务: |cRXP_LOOT_攻势|r
    .target Lanthan Perilon
step
    #label Journal
    .goto Eversong Woods,37.70,24.91
    >>拾取地面上的|cRXP_PICK_Journal|r
    .complete 8330,3 --Collect Solanian's Journal (x1)
step << wotlk/!Warlock tbc
    #completewith next
    >>击杀|cRXP_ENEMY_法力浮龙|r. 从它们身上搜刮|cRXP_LOOT_断片|r << wotlk
    >>施放 |T135738:0|t[法力汲取] 并击杀|cRXP_ENEMY_法力浮龙|r. 掠夺它们以获得其|cRXP_LOOT_碎片|r << tbc
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .complete 8346,1 << tbc --Mana Tap creature (x6)
    .mob Mana Wyrm
step
    #completewith next
    >>击杀|cRXP_ENEMY_树人嫩苗|r和|cRXP_ENEMY_凶猛的树人嫩苗|r << Warlock tbc
    >>击杀|cRXP_ENEMY_Tenders|r和|cRXP_ENEMY_凶猛的树人嫩苗|r. 从|cRXP_ENEMY_凶猛的树人嫩苗|r身上搜刮出其|cRXP_LOOT_Slivers|r << wotlk
    >>击杀|cRXP_ENEMY_Tenders|r和|cRXP_ENEMY_凶猛的树人嫩苗|r. 对|cRXP_ENEMY_凶猛的树人嫩苗|r施放 |T135738:0|t[法力吸取]. 击败后搜刮其掉落的|cRXP_LOOT_Slivers|r << !Warlock tbc
    .complete 8334,1 --Kill Tender (x7)
    .complete 8334,2 --Kill Feral Tender (x7)
    .complete 8336,1,1 << wotlk/!Warlock tbc --Collect Arcane Sliver (x6)
    .complete 8346,1 << !Warlock tbc --Mana Tap creature (x6)
    .mob Tender
    .mob Feral Tender
step
    #label RedOrb
    .goto Eversong Woods,35.14,28.89
    >>拾取平台上|cRXP_PICK_占卜宝珠|r的占卜宝珠
    .complete 8330,1 --Collect Solanian's Scrying Orb (x1)
step
#loop
	.line Eversong Woods,33.92,26.49,33.97,28.55,35.15,29.78,36.52,29.35,35.58,27.42,33.92,26.49
	.goto Eversong Woods,33.92,26.49,40,0
	.goto Eversong Woods,33.97,28.55,40,0
	.goto Eversong Woods,35.15,29.78,40,0
	.goto Eversong Woods,36.52,29.35,40,0
	.goto Eversong Woods,35.58,27.42,40,0
	.goto Eversong Woods,33.92,26.49,40,0
    >>击杀|cRXP_ENEMY_树人嫩苗|r和|cRXP_ENEMY_凶猛的树人嫩苗|r << Warlock tbc
    >>击杀|cRXP_ENEMY_Tenders|r和|cRXP_ENEMY_凶猛的树人嫩苗|r. 从|cRXP_ENEMY_凶猛的树人嫩苗|r身上搜刮出其|cRXP_LOOT_Slivers|r << wotlk
    >>击杀|cRXP_ENEMY_Tenders|r和|cRXP_ENEMY_凶猛的树人嫩苗|r. 对|cRXP_ENEMY_凶猛的树人嫩苗|r施放 |T135738:0|t[法力吸取]. 击败后搜刮其掉落的|cRXP_LOOT_Slivers|r << !Warlock tbc
    .complete 8334,1 --Kill Tender (x7)
    .complete 8334,2 --Kill Feral Tender (x7)
    .complete 8336,1,1 << wotlk/!Warlock tbc --Collect Arcane Sliver (x6)
    .complete 8346,1,1 << !Warlock tbc --Mana Tap creature (x6)
step << !Warlock tbc/wotlk
    #completewith next
    >>击杀|cRXP_ENEMY_凶猛的树人嫩苗|r. 击杀后搜刮其掉落的|cRXP_LOOT_Slivers|r << wotlk
    >>施放 |T135738:0|t[吸取魔力] 并击杀 |cRXP_ENEMY_凶猛的树人嫩苗|r. 掠夺其掉落的 |cRXP_LOOT_片屑|r << tbc
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .complete 8346,1,1 << !Warlock tbc --Mana Tap creature (x6)
    .mob Mana Wyrm
    .mob Feral Tender
step
    #label Aggression
    .goto Eversong Woods,35.37,22.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lanthan|r交谈
    .turnin 8334 >>交任务: |cRXP_FRIENDLY_攻势|r
    .accept 8335 >>接任务: |cRXP_LOOT_放逐者菲伦德雷|r
    .target Lanthan Perilon
step << !Warlock tbc
    .goto Eversong Woods,36.79,19.88,40,0
    .goto Eversong Woods,34.64,18.82,40,0
    .goto Eversong Woods,33.78,19.46,40,0
    .goto Eversong Woods,34.17,20.59,40,0
    .goto Eversong Woods,36.79,19.88,40,0
    .goto Eversong Woods,34.64,18.82,40,0
    .goto Eversong Woods,33.78,19.46,40,0
    .goto Eversong Woods,34.17,20.59
    >>击杀|cRXP_ENEMY_法力浮龙|r. 从它们身上搜刮|cRXP_LOOT_断片|r << wotlk
    >>施放 |T135738:0|t[法力汲取] 并击杀|cRXP_ENEMY_法力浮龙|r. 掠夺它们以获得其|cRXP_LOOT_碎片|r << tbc
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .complete 8346,1,1 << !Warlock tbc --Mana Tap creature (x6)
    .mob Mana Wyrm
step << !Warlock tbc
    .goto Eversong Woods,36.79,19.88,40,0
    .goto Eversong Woods,34.64,18.82,40,0
    .goto Eversong Woods,33.78,19.46,40,0
    .goto Eversong Woods,34.17,20.59,40,0
    .goto Eversong Woods,36.79,19.88,40,0
    .goto Eversong Woods,34.64,18.82,40,0
    .goto Eversong Woods,33.78,19.46,40,0
    .goto Eversong Woods,34.17,20.59
    .xp 4-360 >>升级至1740/2100点经验值 << !Warlock tbc
    .xp 4-610 >>升级至1490/2100经验值 << wotlk
step << !Warlock !Mage !Priest tbc
    #completewith next
    .vendor >>出售垃圾
step << !Warlock tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helion|r和|cRXP_FRIENDLY_Ithanas|r交谈
    .turnin 8346 >>交任务: |cRXP_FRIENDLY_无尽的渴求|r
    .goto Eversong Woods,37.18,18.94
    .turnin 8336 >>交任务: |cRXP_FRIENDLY_奥术薄片|r
    .goto Eversong Woods,38.27,19.13
    .target Arcanist Helion
    .target Arcanist Ithanas
step << Mage tbc/Priest tbc
    #completewith next
    .goto Eversong Woods,38.56,20.98,10,0
    .goto Eversong Woods,38.66,20.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shara|r交谈
    >>|cRXP_BUY_购买|r|T132794:0|t[清凉的泉水] |cRXP_BUY_从她处获得|r
    .vendor >>出售垃圾
    .collect 159,10,8336,1 --Collect Refreshing Spring Water (10)
    .target Shara Sunwing
step << !Mage tbc/!Priest tbc/!Warlock tbc/Paladin
    #completewith next
    .goto Eversong Woods,38.56,20.98,10,0
    .goto Eversong Woods,38.66,20.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shara|r交谈
    .vendor >>出售垃圾
    .target Shara Sunwing
    .money >0.1 << !Mage tbc/!Priest tbc/!Warlock tbc/Paladin
step << Mage tbc
    .goto Eversong Woods,38.56,20.98,10,0 << wotlk
    .goto Eversong Woods,39.23,21.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Julia|r交谈
    .train 116 >>训练你的职业法术
    .target Julia Sunstriker
step << skip
    .goto Eversong Woods,38.56,20.98,10,0
    .goto Eversong Woods,38.93,21.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Teli'Larien|r 交谈
    .train 172 >>训练你的职业法术
    .target Summoner Teli'Larien
--Warlock WOTLK
step << Priest tbc
    .goto Eversong Woods,38.56,20.98,10,0 << wotlk
    .goto Eversong Woods,39.42,20.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_竞技场|r交谈
    .train 589 >>训练你的职业法术
    .target Matron Arena
step << Hunter tbc
    .goto Eversong Woods,38.56,20.98,10,0 << wotlk
    .goto Eversong Woods,39.05,20.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与游侠萨琳娜交谈|cRXP_FRIENDLY_Sallina|r
    .train 1978 >>训练你的职业法术
    .target Ranger Sallina
step << Paladin
    .goto Eversong Woods,39.47,20.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶泰尼斯·射日者|r交谈
    .train 20271 >>训练你的职业法术
    .target Jesthenis Sunstriker
--VV Training is all tbc, since the only class that really benefits from sacrificing an extra 400 yards of running to be able to kill 11+ 圣骑士能更快地击杀怪物
step << wotlk
    #completewith Shrine
    >>击杀|cRXP_ENEMY_法力浮龙|r和|cRXP_ENEMY_凶猛的树人嫩苗|r. 击败它们获取|cRXP_LOOT_片状物|r
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .mob Mana Wyrm
    .mob Feral Tender
step << wotlk
    .goto Eversong Woods,34.05,18.96
    >>当处于法力浮龙的近战范围内时, 施放奥术洪流
    .complete 8346,1 --Mana Tap creature (1)
step
    #label Shrine
    .goto Eversong Woods,29.61,19.38
    >>点击|cRXP_PICK_达斯雷玛的神龛|r
    .complete 8345,1 --Collect Shrine of Dath'Remar Read (x1)
step << wotlk
    #completewith RunRamp
    >>击杀|cRXP_ENEMY_凶猛的树人嫩苗|r. 击杀后搜刮其掉落的|cRXP_LOOT_Slivers|r
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .mob Feral Tender
step
    .goto Eversong Woods,31.33,22.74
    >>拾取地面上的|cRXP_PICK_卷轴|r
    .complete 8330,2 --Collect Scroll of Scourge Magic (x1)
step
    #label RunRamp
    #completewith next
    .goto Eversong Woods,32.57,25.53,20,0
    .goto Eversong Woods,32.02,26.09,20 >>跑上坡道
step << wotlk/!Warlock tbc
    #completewith Academy
    >>击杀一个|r被污染的奥术怨灵|cRXP_ENEMY_. 击败后可拾取其掉落物:|T132884:0|t[|cRXP_LOOT_被污染的奥术薄片|r]
    >>|cRXP_WARN_使用 |T132884:0|t[|cRXP_LOOT_被污染的奥术薄片|r] 开始任务|r
    .collect 20483,1,8338,1 --Tainted Arcane Sliver (1)
    .accept 8338 >>接任务: |cRXP_LOOT_被污染的奥术薄片|r
    .mob Tainted Arcane Wraith
    .use 20483
step
    #label Academy
    .goto Eversong Woods,30.79,25.37,20,0
    .goto Eversong Woods,29.35,24.44,20,0
    .goto Eversong Woods,29.32,26.24,20,0
    .goto Eversong Woods,30.75,26.30,10,0
    .goto Eversong Woods,30.13,26.42,10,0
    .goto Eversong Woods,30.09,27.41,10,0
    .goto Eversong Woods,30.48,27.90,10,0
    .goto Eversong Woods,30.84,27.13
    >>前往学院途中击杀奥术怨灵和被污染的奥术怨灵, 击败它们以获取其碎片 << wotlk
    >>前往学院途中击杀奥术怨灵和被污染的奥术怨灵 << tbc
    >>击杀位于上方的|cRXP_ENEMY_放逐者菲伦德雷|c, 从他身上搜刮其|cRXP_LOOT_头颅|c
    .complete 8335,1 --Kill Arcane Wraith (x8)
    .complete 8335,2 --Kill Tainted Arcane Wraith (x2)
    .complete 8336,1 << wotlk--Collect Arcane Sliver (x6)
    .complete 8335,3 --Collect Felendren's Head (x1)
    .mob Arcane Wraith
    .mob Tainted Arcane Wraith
    .mob Felendren the Banished
step << wotlk/!Warlock tbc
    .goto Eversong Woods,30.84,27.13
    >>击杀一个|r被污染的奥术怨灵|cRXP_ENEMY_. 击败后可拾取其掉落物:|T132884:0|t[|cRXP_LOOT_被污染的奥术薄片|r]
    >>|cRXP_WARN_使用 |T132884:0|t[|cRXP_LOOT_被污染的奥术薄片|r] 开始任务|r
    .collect 20483,1,8338,1 --Tainted Arcane Sliver (1)
    .accept 8338 >>接任务: |cRXP_LOOT_被污染的奥术薄片|r
    .mob Tainted Arcane Wraith
    .use 20483
step
    #completewith SolanianB
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step << wotlk
    #completewith next
    >>击杀|cRXP_ENEMY_法力浮龙|r. 从它们身上搜刮|cRXP_LOOT_断片|r
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .mob Mana Wyrm
step << wotlk
    .goto Eversong Woods,36.79,19.88,40,0
    .goto Eversong Woods,34.64,18.82,40,0
    .goto Eversong Woods,33.78,19.46,40,0
    .goto Eversong Woods,34.17,20.59,40,0
    .goto Eversong Woods,36.79,19.88,40,0
    .goto Eversong Woods,34.64,18.82,40,0
    .goto Eversong Woods,33.78,19.46,40,0
    .goto Eversong Woods,34.17,20.59
    >>当处于法力浮龙的近战范围内时, 施放奥术洪流
    .complete 8346,1 --Mana Tap creature (1)
    .mob Mana Wyrm
step << wotlk
    .goto Eversong Woods,36.79,19.88,40,0
    .goto Eversong Woods,34.64,18.82,40,0
    .goto Eversong Woods,33.78,19.46,40,0
    .goto Eversong Woods,34.17,20.59,40,0
    .goto Eversong Woods,36.79,19.88,40,0
    .goto Eversong Woods,34.64,18.82,40,0
    .goto Eversong Woods,33.78,19.46,40,0
    .goto Eversong Woods,34.17,20.59
    >>击杀|cRXP_ENEMY_法力浮龙|r. 从它们身上搜刮|cRXP_LOOT_断片|r << wotlk
    >>施放 |T135738:0|t[法力汲取] 并击杀|cRXP_ENEMY_法力浮龙|r. 掠夺它们以获得其|cRXP_LOOT_碎片|r << tbc
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .complete 8346,1,1 << !Warlock tbc --Mana Tap creature (x6)
    .mob Mana Wyrm
step << wotlk
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helion|r和|cRXP_FRIENDLY_Ithanas|r交谈
    .turnin 8346 >>交任务: |cRXP_FRIENDLY_无尽的渴求|r
    .turnin 8338 >>交任务: |cRXP_FRIENDLY_被污染的奥术薄片|r
    .goto Eversong Woods,37.18,18.94
    .turnin 8336 >>交任务: |cRXP_FRIENDLY_奥术薄片|r
    .goto Eversong Woods,38.27,19.13
    .target Arcanist Helion
    .target Arcanist Ithanas
step
    #completewith next
    .goto Eversong Woods,38.56,20.98,10,0
    .goto Eversong Woods,39.43,21.06,10,0
    .goto Eversong Woods,39.48,20.58,10,0
    .goto Eversong Woods,39.31,20.23,10,0
    .goto Eversong Woods,38.93,19.93,10,0
    .goto Eversong Woods,38.76,19.36,10 >>上楼
step
    #label SolanianB
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Solanian|r和|cRXP_FRIENDLY_Helion|r交谈 << !Warlock tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Solanian|r交谈 << Warlock tbc/wotlk
    .turnin 8330 >>交任务: |cRXP_FRIENDLY_索兰尼亚的物品|r
    .turnin 8345 >>交任务: |cRXP_FRIENDLY_达斯雷玛的神龛|r
    .goto Eversong Woods,38.76,19.36
    .turnin 8338 >>交任务: |cRXP_FRIENDLY_被污染的奥术薄片|r << !Warlock tbc
    .goto Eversong Woods,37.18,18.94 << !Warlock tbc
    .target Well Watcher Solanian
    .target Arcanist Helion << !Warlock tbc
step
    .goto Eversong Woods,35.37,22.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lanthan|r交谈
    .turnin 8335 >>交任务: |cRXP_FRIENDLY_放逐者菲伦德雷|r
    .accept 8347 >>接任务: |cRXP_LOOT_帮助信使|r
    .target Lanthan Perilon
step
#loop
	.line Eversong Woods,33.92,26.49,33.97,28.55,35.15,29.78,36.52,29.35,35.58,27.42,33.92,26.49
	.goto Eversong Woods,33.92,26.49,40,0
	.goto Eversong Woods,33.97,28.55,40,0
	.goto Eversong Woods,35.15,29.78,40,0
	.goto Eversong Woods,36.52,29.35,40,0
	.goto Eversong Woods,35.58,27.42,40,0
	.goto Eversong Woods,33.92,26.49,40,0
    .xp 5+1800 >>升级至1800/2800经验值
step
    #completewith next
    .goto Eversong Woods,38.91,30.27,30,0
    .goto Eversong Woods,40.41,32.21,30 >>过桥
step
    .goto Eversong Woods,40.41,32.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alarion|r交谈
    .turnin 8347 >>交任务: |cRXP_FRIENDLY_帮助信使|r
    .accept 9704 >>接任务: |cRXP_LOOT_失心者的牺牲品|r
    .target Outrunner Alarion
step
    #xprate >1.4999
    .goto Eversong Woods,42.02,35.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上的|cRXP_FRIENDLY_斥候尸体|r交谈
    .turnin 9704 >>交任务: |cRXP_FRIENDLY_失心者的牺牲品|r
    .target Slain Outrunner
step
    #xprate <1.5
    .goto Eversong Woods,42.02,35.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上的|cRXP_FRIENDLY_斥候尸体|r交谈
    .turnin 9704 >>交任务: |cRXP_FRIENDLY_失心者的牺牲品|r
    .accept 9705 >>接任务: |cRXP_LOOT_找回包裹|r
    .target Slain Outrunner
step
    #xprate <1.5
    .goto Eversong Woods,40.41,32.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alarion|r交谈
    .turnin 9705 >>交任务: |cRXP_FRIENDLY_找回包裹|r
    .accept 8350 >>接任务: |cRXP_LOOT_送信|r
    .target Outrunner Alarion
step
    .goto Eversong Woods,45.97,43.35,40,0
    .goto Eversong Woods,46.57,35.10,40,0
    .goto Eversong Woods,43.62,34.88,40,0
    .goto Eversong Woods,45.97,43.35,40,0
    .goto Eversong Woods,46.57,35.10,40,0
    .goto Eversong Woods,43.62,34.88,40,0
    .xp 5+2690 >>升级至2690/2800经验值
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< BloodElf/Undead
#name 6-10 永歌森林
#displayname 6-10 永歌森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 部落 1-30
#next 10-12 永歌森林 << !Warrior
#next 10-13 杜隆塔尔 << Warrior

step
    .goto Eversong Woods,47.26,46.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾隆迪斯|r交谈
    .accept 8472 >>接任务: |cRXP_LOOT_失效的傀儡|r
    .target Magister Jaronis
step
    #completewith FalconHS
    .goto Eversong Woods,47.79,47.35,8,0
    .goto Eversong Woods,47.86,47.76,8 >>进入旅店
step << BloodElf
    #xprate <1.5
    .goto Eversong Woods,48.16,47.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Delaniel|r交谈
    .turnin 8350 >>交任务: |cRXP_FRIENDLY_送信|r
    .home >>将你的[炉石]设置为鹰翼广场
    .target Innkeeper Delaniel
step << BloodElf
    #xprate >1.4999
    #label FalconHS
    .goto Eversong Woods,48.16,47.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Delaniel|r交谈
    .home >>将你的[炉石]设置为鹰翼广场
    .target Innkeeper Delaniel
step << !BloodElf
    #label FalconHS
    .goto Eversong Woods,48.16,47.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Delaniel|r交谈
    .home >>将你的[炉石]设置为鹰翼广场
    .target Innkeeper Delaniel
step << Priest/Mage/Warlock/Warrior tbc/Rogue tbc
    #completewith next
    .goto Eversong Woods,48.27,47.05,8,0
    .goto Eversong Woods,48.06,47.11,8 >>上楼
step << Priest
    .goto Eversong Woods,47.85,47.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_珀纳瑞斯|r交谈
    .accept 9489 >>接任务: |cRXP_LOOT_清理死亡之痕|r << BloodElf
    .train 591 >>训练你的职业法术
    .target Ponaris
step << Mage
    .goto Eversong Woods,48.04,48.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_加琳黛尔|r交谈
    .train 143 >>训练你的职业法术
    .target Garridel
step << Warlock
    .goto Eversong Woods,48.23,47.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塞罗努斯|r谈话
    .train 695 >>训练你的职业法术
    .target Celoenus
step << Warrior tbc/Rogue tbc
    .goto Eversong Woods,48.58,47.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_卡娜莉亚|r谈话
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Kanaria
step << Mage/Warlock/Priest
    .goto Eversong Woods,48.16,47.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Delaniel|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r
    .collect 1179,5,8468,1 --Ice Cold Milk (5)
    .money <0.0119
    .target Innkeeper Delaniel
step
    #completewith next
    .goto Eversong Woods,47.86,47.76,8,0
    .goto Eversong Woods,47.79,47.35,8 >>外出
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_通缉告示|r和|cRXP_FRIENDLY_Aeldon|r交谈
    .accept 8468 >>接任务: |cRXP_LOOT_通缉：饥饿者泰里斯|r
    .goto Eversong Woods,48.18,46.31
    .accept 8463 >>接任务: |cRXP_LOOT_不稳定的法力水晶|r
    .goto Eversong Woods,48.17,46.00
    .target Aeldon Sunbrand
step << Paladin
    .goto Eversong Woods,48.39,46.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺尔蕾妮|r交谈
    .train 639 >>训练你的职业法术
    .target Noellene
step << Rogue
    .goto Eversong Woods,48.58,46.29,8,0
    .goto Eversong Woods,48.50,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塔娜莉亚|r交谈
    .train 1757 >>训练你的职业法术
    .target Tannaria
step << Hunter
    .goto Eversong Woods,48.27,46.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉诺维亚|r交谈
    .train 3044 >>训练你的职业法术
    .target Hannovia
step << Undead Warrior tbc/Rogue
    .goto Eversong Woods,48.34,45.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斗技者拉雷尼斯|r交谈
    .train 201 >>学习1小时剑术 << Rogue
    .train 202 >>学习两小时剑术 << Undead Warrior tbc
    .target Duelist Larenis
    .money <0.11
step << Warrior tbc/Paladin tbc/Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够足够的钱买一把 |T135321:0|t[步兵剑](5银9铜). 如果暂时不够, 稍后再回来处理
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
    .train 201,3 << Rogue
step << Warrior tbc/Paladin tbc/Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135321:0|t[步兵剑]|r
    .collect 2488,1,8476,1 --Gladius (1)
    .target Geron
    .money <0.0509
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
    .train 201,3 << Rogue
step << Warrior wotlk/Paladin wotlk
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T133053:0|t[木槌棒] (6银66铜) 的钱. 如果暂时不够, 稍后再回来
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Warrior wotlk/Paladin wotlk
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133053:0|t[木槌棒]|r
    .collect 2493,1,8476,1 --Collect Wooden Mallet (1)
    .money <0.0666
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T135641:0|t[卷刃的剑] (3s 82c) 的钱. 如果暂时不够, 稍后再回来处理
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
    .train 201,1
step << Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135641:0|t[卷刃的剑]|r
    .collect 2494,1,8476,1 --Collect Stiletto
    .money <0.0382
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
    .train 201,1
step << Warrior tbc/Paladin tbc/Rogue
    #completewith Thaelis
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior wotlk/Paladin wotlk
    #completewith Thaelis
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Rogue
    #completewith Thaelis
    +装备 |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step
    #completewith next
    .goto Eversong Woods,46.96,43.56,40,0
    .goto Eversong Woods,47.09,39.00,40,0
    >>拾取地面上的|cRXP_PICK_不稳定的法力水晶盒|r
    >>击杀|cRXP_ENEMY_奥术巡逻者|r. 从他们身上搜刮|cRXP_LOOT_能量核心|r
    .complete 8463,1 --Collect Unstable Mana Crystal (x6)
    .complete 8472,1 --Collect Arcane Core (x6)
    .mob Arcane Patroller
step
    #label Thaelis
    .goto Eversong Woods,45.02,37.68
    >>击杀|cRXP_ENEMY_饥饿者泰里斯|r. 击败他后拾取|cRXP_LOOT_饥饿者泰里斯的头颅|r
    .complete 8468,1 --Collect Thaelis's Head (x1)
    .mob Thaelis the Hungerer
step
    .goto Eversong Woods,47.22,37.39,40,0
    .goto Eversong Woods,46.67,35.11,40,0
    .goto Eversong Woods,43.96,34.90,40,0
    .goto Eversong Woods,42.41,38.04,40,0
    .goto Eversong Woods,42.17,40.49,40,0
    .goto Eversong Woods,40.70,41.12,40,0
    .goto Eversong Woods,40.77,43.15,40,0
    .goto Eversong Woods,43.03,42.97,40,0
    .goto Eversong Woods,44.23,45.21,40,0
    .goto Eversong Woods,46.96,43.56,40,0
    .goto Eversong Woods,47.09,39.00,40,0
    .goto Eversong Woods,47.22,37.39,40,0
    .goto Eversong Woods,46.67,35.11,40,0
    .goto Eversong Woods,43.96,34.90,40,0
    .goto Eversong Woods,42.41,38.04,40,0
    .goto Eversong Woods,42.17,40.49
    >>拾取地面上的|cRXP_PICK_不稳定的法力水晶盒|r
    >>击杀|cRXP_ENEMY_奥术巡逻者|r. 从他们身上搜刮|cRXP_LOOT_能量核心|r
    .complete 8463,1 --Collect Unstable Mana Crystal (x6)
    .complete 8472,1 --Collect Arcane Core (x6)
    .mob Arcane Patroller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jarondis|r和|cRXP_FRIENDLY_Kan'ren|r和|cRXP_FRIENDLY_Aeldon|r交谈
    .turnin 8472 >>交任务: |cRXP_FRIENDLY_失效的傀儡|r
    .accept 8895 >>接任务: |cRXP_LOOT_送往北部圣殿的信|r
    .goto Eversong Woods,47.26,46.31
    .turnin 8468 >>交任务: |cRXP_FRIENDLY_通缉：饥饿者泰里斯|r
    .goto Eversong Woods,47.77,46.58
    .turnin 8463 >>交任务: |cRXP_FRIENDLY_不稳定的法力水晶|r
    .accept 9352 >>接任务: |cRXP_LOOT_达纳苏斯的侵扰|r
    .goto Eversong Woods,48.17,46.00
    .target Magister Jaronis
    .target Sergeant Kan'ren
    .target Aeldon Sunbrand
step << Paladin
    .goto Eversong Woods,48.39,46.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺尔蕾妮|r交谈
    .train 853 >>训练你的职业法术
    .target Noellene
	.xp <8,1
step << Rogue
    .goto Eversong Woods,48.58,46.29,8,0
    .goto Eversong Woods,48.50,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塔娜莉亚|r交谈
    .train 6760 >>训练你的职业法术
    .target Tannaria
	.xp <8,1
step << Hunter
    .goto Eversong Woods,48.27,46.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉诺维亚|r交谈
    .train 5116 >>训练你的职业法术
    .target Hannovia
	.xp <8,1
step << Mage/Warlock
    #completewith next
    .goto Eversong Woods,47.79,47.35,8,0
    .goto Eversong Woods,47.86,47.76,8 >>进入旅店
	.xp <8,1
step << Mage/Warlock
    #completewith next
    .goto Eversong Woods,48.27,47.05,8,0
    .goto Eversong Woods,48.06,47.11,8 >>上楼
	.xp <8,1
step << skip
    .goto Eversong Woods,47.85,47.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_珀纳瑞斯|r交谈
    .train 139 >>训练你的职业法术
    .target Ponaris
	.xp <8,1
--VV Priest not needed. add Priest to other travel steps
step << Mage
    .goto Eversong Woods,48.04,48.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_加琳黛尔|r交谈
    .train 5143 >>训练你的职业法术
    .target Garridel
	.xp <8,1
step << Warlock
    .goto Eversong Woods,48.23,47.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塞罗努斯|r谈话
    .train 980 >>训练你的职业法术
    .target Celoenus
	.xp <8,1
step << Warlock tbc
    .goto Eversong Woods,48.34,47.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_戴丝特拉|r交谈
    >>|cRXP_BUY_从她那里购买|r|T133738:0|t[魔典：火焰箭(等级 2)]|r
    .collect 16302,1,8476,1 --Grimoire of Firebolt Rank 2
    .target Daestra
	.xp <8,1
step << Undead Warrior tbc/Rogue
    .goto Eversong Woods,48.34,45.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斗技者拉雷尼斯|r交谈
    .train 201 >>学习1小时剑术 << Rogue
    .train 202 >>学习两小时剑术 << Undead Warrior tbc
    .target Duelist Larenis
    .money <0.11
step << Warrior tbc/Paladin tbc/Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够足够的钱买一把 |T135321:0|t[步兵剑](5银9铜). 如果暂时不够, 稍后再回来处理
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
    .train 201,3 << Rogue
step << Warrior tbc/Paladin tbc/Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135321:0|t[步兵剑]|r
    .collect 2488,1,8476,1 --Gladius (1)
    .target Geron
    .money <0.0509
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
    .train 201,3 << Rogue
step << Warrior wotlk/Paladin wotlk
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T133053:0|t[木槌棒] (6银66铜) 的钱. 如果暂时不够, 稍后再回来
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Warrior wotlk/Paladin wotlk
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133053:0|t[木槌棒]|r
    .collect 2493,1,8476,1 --Collect Wooden Mallet (1)
    .money <0.0666
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T135641:0|t[卷刃的剑] (3s 82c) 的钱. 如果暂时不够, 稍后再回来处理
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
    .train 201,1
step << Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135641:0|t[卷刃的剑]|r
    .collect 2494,1,8476,1 --Collect Stiletto
    .money <0.0382
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
    .train 201,1
step << Warrior tbc/Paladin tbc/Rogue
    #completewith Thaelis
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior wotlk/Paladin wotlk
    #completewith Caidanis
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Rogue
    #completewith Caidanis
    +装备 |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step
    #completewith BuyFood1
    .goto Eversong Woods,47.79,47.35,8,0
    .goto Eversong Woods,47.86,47.76,8 >>进入旅店
step
    .goto Eversong Woods,48.16,47.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Delaniel|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从她那里购买|r|T133968:0|t[刚出炉的面包]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r|T133968:0|t[刚出炉的面包]|r << Paladin
    .collect 1179,20,8491,1 << Priest/Mage/Warlock/Druid/Paladin --Ice Cold Milk (20)
    .collect 4541,20,8491,1 << !Priest !Mage !Warlock !Druid !Paladin --Freshly Baked Bread (20)
    .collect 4541,10,8491,1 << Paladin --Freshly Baked Bread (10)
    .money <0.0476 << !Priest !Mage !Warlock !Druid !Paladin
    .money <0.0714 << Paladin
    .target Innkeeper Delaniel
step
    #label BuyFood1
    .goto Eversong Woods,48.16,47.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Delaniel|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从她那里购买|r|T133968:0|t[刚出炉的面包]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r|T133968:0|t[刚出炉的面包]|r << Paladin
    .collect 1179,10,8491,1 << Priest/Mage/Warlock/Druid/Paladin --Ice Cold Milk (10)
    .collect 4541,10,8491,1 << !Priest !Mage !Warlock !Druid !Paladin --Freshly Baked Bread (10)
    .collect 4541,5,8491,1 << Paladin --Freshly Baked Bread (10)
    .money <0.0238 << !Priest !Mage !Warlock !Druid !Paladin
    .money <0.0357 << Paladin
    .target Innkeeper Delaniel
step
    #completewith next
    .goto Eversong Woods,46.68,48.07,30,0
    .goto Eversong Woods,44.63,53.13,30 >>前往凯丹尼斯
step
    #label Caidanis
    .goto Eversong Woods,44.63,53.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔网监护者凯丹尼斯|r交谈
    .turnin 8895 >>交任务: |cRXP_FRIENDLY_送往北部圣殿的信|r
    .accept 9119 >>接任务: |cRXP_LOOT_西部圣殿的麻烦|r
    .target Ley-Keeper Caidanis
step
    #xprate <1.5
    .goto Eversong Woods,45.19,56.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒拉尔雷|r交谈
    .accept 9035 >>接任务: |cRXP_LOOT_打探匪情|r
    .target Apprentice Ralen
step
    #xprate <1.5
    .goto Eversong Woods,44.88,61.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Meledor|r 交谈
    .turnin 9035 >>交任务: |cRXP_FRIENDLY_打探匪情|r
    .accept 9062 >>接任务: |cRXP_LOOT_浸水的书页|r
    .target Apprentice Meledor
step
    #xprate <1.5
    .goto Eversong Woods,44.34,62.00
    >>在水下拾取|cRXP_PICK_Grimoire|r
    .complete 9062,1 --Collect Antheol's Elemental Grimoire (x1)
step
    #xprate <1.5
    .goto Eversong Woods,44.88,61.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Meledor|r 交谈
    .turnin 9062 >>交任务: |cRXP_FRIENDLY_浸水的书页|r
    .accept 9064 >>接任务: |cRXP_LOOT_学徒的欺瞒|r
    .target Apprentice Meledor
step << !Warrior/Undead !Warlock/Undead !Hunter/Undead !Rogue/Undead
    #xprate >1.4999
    .goto Eversong Woods,45.19,56.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒拉尔雷|r交谈
    .accept 9035 >>接任务: |cRXP_LOOT_打探匪情|r
    .target Apprentice Ralen
step << !Warrior/Undead !Warlock/Undead !Hunter/Undead !Rogue/Undead
    #xprate >1.4999
    .goto Eversong Woods,44.88,61.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Meledor|r 交谈
    .turnin 9035 >>交任务: |cRXP_FRIENDLY_打探匪情|r
    .accept 9062 >>接任务: |cRXP_LOOT_浸水的书页|r
    .target Apprentice Meledor
step << !Warrior/Undead !Warlock/Undead !Hunter/Undead !Rogue/Undead
    #xprate >1.4999
    .goto Eversong Woods,44.34,62.00
    >>在水下拾取|cRXP_PICK_Grimoire|r
    .complete 9062,1 --Collect Antheol's Elemental Grimoire (x1)
step << !Warrior/Undead !Warlock/Undead !Hunter/Undead !Rogue/Undead
    #xprate >1.4999
    .goto Eversong Woods,44.88,61.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Meledor|r 交谈
    .turnin 9062 >>交任务: |cRXP_FRIENDLY_浸水的书页|r
    .accept 9064 >>接任务: |cRXP_LOOT_学徒的欺瞒|r
    .target Apprentice Meledor
step << BloodElf Priest
    #completewith next
    >>|cRXP_WARN_对|cRXP_FRIENDLY_永歌游侠 施放|r|T135987:0|t[真言术:坚韧]|r
    .complete 9489,1 --Eversong Ranger Blessed (6)
    .target Eversong Ranger
    .isOnQuest 9489
step
    #xprate <1.5
    .goto Eversong Woods,50.34,50.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尔拉|r交谈
    .accept 8475 >>接任务: |cRXP_LOOT_死亡之痕|r
    .target Ranger Jaela
step << BloodElf Priest
    #xprate >1.4999
    .goto Eversong Woods,50.34,50.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尔拉|r交谈
    .accept 8475 >>接任务: |cRXP_LOOT_死亡之痕|r
    .target Ranger Jaela
step << BloodElf Priest
    .goto Eversong Woods,50.19,50.88,-1
    .goto Eversong Woods,50.24,50.96,-1
    .goto Eversong Woods,50.29,51.02,-1
    .goto Eversong Woods,50.34,51.04,-1
    .goto Eversong Woods,50.41,51.00,-1
    .goto Eversong Woods,50.46,50.91,-1
    >>|cRXP_WARN_对|cRXP_FRIENDLY_永歌游侠 施放|r|T135987:0|t[真言术:坚韧]|r
    .complete 9489,1 --Eversong Ranger Blessed (6)
    .target Eversong Ranger
    .isOnQuest 9489
step
    #xprate <1.5
    #completewith next
    >>击杀|cRXP_ENEMY_天灾骨骸|r
    .complete 8475,1 --Kill Plaguebone Pillager (x8)
    .mob Plaguebone Pillager
step << BloodElf Priest/Undead
    #xprate >1.4999
    #completewith next
    >>击杀|cRXP_ENEMY_天灾骨骸|r
    .complete 8475,1 --Kill Plaguebone Pillager (x8)
    .mob Plaguebone Pillager
step
    #xprate <1.5
    .goto Eversong Woods,55.70,54.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Antheol|r交谈
    .turnin 9064 >>交任务: |cRXP_FRIENDLY_学徒的欺瞒|r
    .accept 9066 >>接任务: |cRXP_LOOT_导师的训诫|r
    .target Instructor Antheol
step << BloodElf Priest/Undead
    #xprate >1.4999
    .goto Eversong Woods,55.70,54.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Antheol|r交谈
    .turnin 9064 >>交任务: |cRXP_FRIENDLY_学徒的欺瞒|r
    .accept 9066 >>接任务: |cRXP_LOOT_导师的训诫|r
    .target Instructor Antheol
step
    #xprate <1.5
    .goto Eversong Woods,50.82,56.49,40,0
    .goto Eversong Woods,49.72,56.96,40,0
    .goto Eversong Woods,49.48,53.13,40,0
    .goto Eversong Woods,50.95,52.96,40,0
    .goto Eversong Woods,50.82,56.49,40,0
    .goto Eversong Woods,49.72,56.96,40,0
    .goto Eversong Woods,49.48,53.13,40,0
    .goto Eversong Woods,50.95,52.96
    >>击杀|cRXP_ENEMY_天灾骨骸|r
    .complete 8475,1 --Kill Plaguebone Pillager (x8)
    .mob Plaguebone Pillager
step << BloodElf Priest/Undead
    #xprate >1.4999
    .goto Eversong Woods,50.82,56.49,40,0
    .goto Eversong Woods,49.72,56.96,40,0
    .goto Eversong Woods,49.48,53.13,40,0
    .goto Eversong Woods,50.95,52.96,40,0
    .goto Eversong Woods,50.82,56.49,40,0
    .goto Eversong Woods,49.72,56.96,40,0
    .goto Eversong Woods,49.48,53.13,40,0
    .goto Eversong Woods,50.95,52.96
    >>击杀|cRXP_ENEMY_天灾骨骸|r
    .complete 8475,1 --Kill Plaguebone Pillager (x8)
    .mob Plaguebone Pillager
step
    #xprate <1.5
    .goto Eversong Woods,50.34,50.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尔拉|r交谈
    .turnin 8475 >>交任务: |cRXP_FRIENDLY_死亡之痕|r
    .target Ranger Jaela
step << BloodElf Priest/Undead
    #xprate >1.4999
    .goto Eversong Woods,50.34,50.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尔拉|r交谈
    .turnin 8475 >>交任务: |cRXP_FRIENDLY_死亡之痕|r
    .target Ranger Jaela
step << Paladin/Priest/Mage
    #xprate <1.5
    .goto Eversong Woods,45.19,56.43
    >>对|cRXP_FRIENDLY_Ralen|r使用 |T135147:0|t[惩戒之杖]
    .complete 9066,2 --Apprentice Ralen Disciplined
    .target Apprentice Ralen
    .use 22473
step << BloodElf Priest/Undead
    #xprate >1.4999
    .goto Eversong Woods,45.19,56.43
    >>对|cRXP_FRIENDLY_Ralen|r使用 |T135147:0|t[惩戒之杖]
    .complete 9066,2 --Apprentice Ralen Disciplined
    .target Apprentice Ralen
    .use 22473
step << Paladin/Priest/Mage
    #xprate <1.5
    .goto Eversong Woods,44.88,61.03
    >>对|cRXP_FRIENDLY_Meledor|r使用 |T135147:0|t[惩戒之杖]
    .complete 9066,1 --Apprentice Meledor Disciplined
    .target Apprentice Meledor
    .use 22473
step << BloodElf Priest/Undead Mage/Undead Priest
    #xprate >1.4999
    .goto Eversong Woods,44.88,61.03
    >>对|cRXP_FRIENDLY_Meledor|r使用 |T135147:0|t[惩戒之杖]
    .complete 9066,1 --Apprentice Meledor Disciplined
    .target Apprentice Meledor
    .use 22473
step
    .goto Eversong Woods,36.70,57.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔网监护者薇兰妮亚|r交谈
    .turnin 9119 >>交任务: |cRXP_FRIENDLY_西部圣殿的麻烦|r
    .accept 8486 >>接任务: |cRXP_LOOT_不稳定的奥术|r
    .target Ley-Keeper Velania
step
    #completewith next
    >>击杀|cRXP_ENEMY_法力怨灵|r和|cRXP_ENEMY_法力漫步者|r
    .complete 8486,1 --Kill Manawraith (x5)
    .complete 8486,2 --Kill Mana Stalker (x5)
    .mob Manawraith
    .mob Mana Stalker
step
    .goto Eversong Woods,36.77,60.99,30,0
    .goto Eversong Woods,34.65,62.03,30,0
    .goto Eversong Woods,34.04,60.81,30,0
    .goto Eversong Woods,34.19,58.49,30,0
    .goto Eversong Woods,36.77,60.99,30,0
    .goto Eversong Woods,34.65,62.03,30,0
    .goto Eversong Woods,34.04,60.81,30,0
    .goto Eversong Woods,34.19,58.49
    >>击杀一名|cRXP_ENEMY_达纳苏斯斥候|r. 搜刮其尸体获得 |T133464:0|t[|cRXP_LOOT_秘密文件|r]
    >>|cRXP_WARN_使用 |T133464:0|t[|cRXP_LOOT_秘密文件|r] 开始任务|r
    .complete 9352,1 --Intruder Defeated
    .collect 20765,1,8482,1 --Incriminating Documents (1)
    .accept 8482 >>接任务: |cRXP_LOOT_秘密文件|r
    .mob Darnassian Scout
    .use 20765
step
#loop
	.line Eversong Woods,35.57,61.41,34.41,60.64,35.02,56.58,35.82,58.36,36.20,60.28,35.57,61.41
	.goto Eversong Woods,35.57,61.41,40,0
	.goto Eversong Woods,34.41,60.64,40,0
	.goto Eversong Woods,35.02,56.58,40,0
	.goto Eversong Woods,35.82,58.36,40,0
	.goto Eversong Woods,36.20,60.28,40,0
	.goto Eversong Woods,35.57,61.41,40,0
    >>击杀|cRXP_ENEMY_法力怨灵|r和|cRXP_ENEMY_法力漫步者|r
    .complete 8486,1 --Kill Manawraith (x5)
    .complete 8486,2 --Kill Mana Stalker (x5)
    .mob Manawraith
    .mob Mana Stalker
step
    .goto Eversong Woods,36.70,57.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔网监护者薇兰妮亚|r交谈
    .turnin 8486 >>交任务: |cRXP_FRIENDLY_不稳定的奥术|r
    .turnin 9352 >>交任务: |cRXP_FRIENDLY_达纳苏斯的侵扰|r
    .target Ley-Keeper Velania
step
    .goto Eversong Woods,30.22,58.35,10,0
    .goto Eversong Woods,30.23,58.44,10,0
    .goto Eversong Woods,29.90,58.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈斯温里奥|r交谈
    .accept 8884 >>接任务: |cRXP_LOOT_鱼头......|r
    .target Hathvelion Sungaze
step
    .goto Eversong Woods,27.47,56.54,40,0
    .goto Eversong Woods,26.45,58.14,40,0
    .goto Eversong Woods,26.35,59.41,40,0
    .goto Eversong Woods,28.20,59.52,40,0
    .goto Eversong Woods,27.96,61.31,40,0
    .goto Eversong Woods,25.70,60.50,40,0
    .goto Eversong Woods,25.36,62.88,40,0
    .goto Eversong Woods,25.61,64.29
    >>击杀|cRXP_ENEMY_暗鳞抢劫者|r 和|cRXP_ENEMY_暗鳞先知|r. 击败它们后搜刮其掉落的|cRXP_LOOT_鱼人的头颅|r 和 |T134939:0|t[|cRXP_LOOT_凯莉森德拉船长的航海图|r ]
    >>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_凯莉森德拉船长的航海图|r] 开始任务|r
    .complete 8884,1 --Collect Grimscale Murloc Head (x8)
    .collect 21776,1,8887,1 --Captain Kelisendra's Lost Rutters
    .accept 8887 >>接任务: |cRXP_LOOT_凯莉森德拉船长的航海图|r
    .mob Grimscale Forager
    .mob Grimscale Seer
    .use 21776
step << Warrior/Warlock/Hunter/Rogue
    .goto Eversong Woods,27.47,56.54,40,0
    .goto Eversong Woods,26.45,58.14,40,0
    .goto Eversong Woods,26.35,59.41,40,0
    .goto Eversong Woods,28.20,59.52,40,0
    .goto Eversong Woods,27.96,61.31,40,0
    .goto Eversong Woods,25.70,60.50,40,0
    .goto Eversong Woods,25.36,62.88,40,0
    .goto Eversong Woods,25.61,64.29
    .xp 7+3195 >>升级至3195/4500经验值
step
    .goto Eversong Woods,29.90,58.45,10,0
    .goto Eversong Woods,30.23,58.44,10,0
    .goto Eversong Woods,30.22,58.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈斯温里奥|r交谈
    .turnin 8884 >>交任务: |cRXP_FRIENDLY_鱼头......|r
    .accept 8885 >>接任务: |cRXP_LOOT_呜啦哇啦的戒指|r
    .target Hathvelion Sungaze
step << Paladin/Priest/Mage
    #completewith next
    .goto Eversong Woods,27.94,59.41,20,0
    .goto Eversong Woods,28.01,61.01,20,0
    .goto Eversong Woods,26.25,60.46
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step << Warrior/Warlock/Hunter/Rogue
    .goto Eversong Woods,35.50,55.70,30 >>跑向西部圣殿以北区域
    .isOnQuest 8885
step << Warrior/Warlock/Hunter/Rogue
    .goto Eversong Woods,35.50,55.70
    .deathskip >>死亡后在|r灵魂医者|r处复活(确保你的子区域是永歌森林, 而不是西部圣所)
    .target Spirit Healer
    .isOnQuest 8885
step << Warrior/Warlock/Hunter/Rogue
    #completewith next
    .goto Eversong Woods,46.70,49.09,20,0
    .goto Eversong Woods,46.69,48.02,20 >>前往艾尔登的方向
step << Warrior/Warlock/Hunter/Rogue
    .goto Eversong Woods,48.17,46.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Aeldon|r交谈
    .turnin 8482 >>交任务: |cRXP_FRIENDLY_秘密文件|r
    .accept 8483 >>接任务: |cRXP_LOOT_矮人间谍|r
    .target Aeldon Sunbrand
step << Undead Warrior tbc/Rogue
    .goto Eversong Woods,48.34,45.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斗技者拉雷尼斯|r交谈
    .train 201 >>学习1小时剑术 << Rogue
    .train 202 >>学习两小时剑术 << Undead Warrior tbc
    .target Duelist Larenis
step << Rogue
    .goto Eversong Woods,48.58,46.29,8,0
    .goto Eversong Woods,48.50,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塔娜莉亚|r交谈
    .train 6760 >>训练你的职业法术
    .target Tannaria
step << Hunter
    .goto Eversong Woods,48.27,46.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉诺维亚|r交谈
    .train 5116 >>训练你的职业法术
    .target Hannovia
step << Warlock
    #completewith next
    .goto Eversong Woods,47.79,47.35,8,0
    .goto Eversong Woods,47.86,47.76,8 >>进入旅店
step << Warlock
    #completewith next
    .goto Eversong Woods,48.27,47.05,8,0
    .goto Eversong Woods,48.06,47.11,8 >>上楼
step << Warlock
    .goto Eversong Woods,48.23,47.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塞罗努斯|r谈话
    .train 980 >>训练你的职业法术
    .target Celoenus
step << Warlock tbc
    .goto Eversong Woods,48.34,47.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_戴丝特拉|r交谈
    >>|cRXP_BUY_从她那里购买|r|T133738:0|t[魔典：火焰箭(等级 2)]|r
    .collect 16302,1,8475,1 --Grimoire of Firebolt Rank 2
    .target Daestra
step << Warrior tbc/Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够足够的钱买一把 |T135321:0|t[步兵剑](5银9铜). 如果暂时不够, 稍后再回来处理
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior tbc/Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135321:0|t[步兵剑]|r
    .collect 2488,1,8476,1 --Gladius (1)
    .target Geron
    .money <0.0509
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior wotlk
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T133053:0|t[木槌棒] (6银66铜) 的钱. 如果暂时不够, 稍后再回来
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Warrior wotlk
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133053:0|t[木槌棒]|r
    .collect 2493,1,8476,1 --Collect Wooden Mallet (1)
    .money <0.0666
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T135641:0|t[卷刃的剑] (3s 82c) 的钱. 如果暂时不够, 稍后再回来处理
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
    .train 201,1
step << Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135641:0|t[卷刃的剑]|r
    .collect 2494,1,8476,1 --Collect Stiletto
    .money <0.0382
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
    .train 201,1
step << Warrior tbc/Rogue
    #completewith Caidanis
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior wotlk
    #completewith Caidanis
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Rogue
    #completewith Caidanis
    +装备 |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Warrior/Warlock/Hunter/Rogue
    .goto Eversong Woods,44.57,53.30
    .gossipoption 91301 >>与|cRXP_FRIENDLY_Anvilward|r交谈
    .timer 28,Prospector Anvilward RP
    .target Prospector Anvilward
    .skipgossip 15420,1
    .isOnQuest 8483
step << Warrior/Warlock/Hunter/Rogue
    .goto Eversong Woods,44.57,53.11,10,0
    .goto Eversong Woods,44.01,52.83,10,0
    .goto Eversong Woods,43.91,53.12,10,0
    .goto Eversong Woods,44.07,53.33
    >>|cRXP_WARN_等待RP结束|r
    >>击杀|cRXP_ENEMY_勘测员安威瓦尔德|r. 击败他后掠夺他的|cRXP_LOOT_头|r
    .complete 8483,1 --Collect Prospector Anvilward's Head (x1)
    .mob Prospector Anvilward
step << Warrior/Warlock/Hunter/Rogue
    #xprate <1.5
    .goto Eversong Woods,45.19,56.43
    >>对|cRXP_FRIENDLY_Ralen|r使用 |T135147:0|t[惩戒之杖]
    .complete 9066,2 --Apprentice Ralen Disciplined
    .target Apprentice Ralen
    .use 22473
step << Warrior/Warlock/Hunter/Rogue
    #xprate <1.5
    .goto Eversong Woods,44.88,61.03
    >>对|cRXP_FRIENDLY_Meledor|r使用 |T135147:0|t[惩戒之杖]
    .complete 9066,1 --Apprentice Meledor Disciplined
    .target Apprentice Meledor
    .use 22473
step << !Undead Warrior/!Undead Warlock/!Undead Hunter/!Undead Rogue
    #xprate >1.4999
    .goto Eversong Woods,45.19,56.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒拉尔雷|r交谈
    .accept 9035 >>接任务: |cRXP_LOOT_打探匪情|r
    .target Apprentice Ralen
step << !Undead Warrior/!Undead Warlock/!Undead Hunter/!Undead Rogue
    #xprate >1.4999
    .goto Eversong Woods,44.88,61.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Meledor|r 交谈
    .turnin 9035 >>交任务: |cRXP_FRIENDLY_打探匪情|r
    .accept 9062 >>接任务: |cRXP_LOOT_浸水的书页|r
    .target Apprentice Meledor
step << !Undead Warrior/!Undead Warlock/!Undead Hunter/!Undead Rogue
    #xprate >1.4999
    .goto Eversong Woods,44.34,62.00
    >>在水下拾取|cRXP_PICK_Grimoire|r
    .complete 9062,1 --Collect Antheol's Elemental Grimoire (x1)
step << !Undead Warrior/!Undead Warlock/!Undead Hunter/!Undead Rogue
    #xprate >1.4999
    .goto Eversong Woods,44.88,61.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Meledor|r 交谈
    .turnin 9062 >>交任务: |cRXP_FRIENDLY_浸水的书页|r
    .accept 9064 >>接任务: |cRXP_LOOT_学徒的欺瞒|r
    .target Apprentice Meledor
step << Undead !Mage !Priest
    #xprate >1.4999
    .goto Eversong Woods,44.88,61.03
    >>对|cRXP_FRIENDLY_Meledor|r使用 |T135147:0|t[惩戒之杖]
    .complete 9066,1 --Apprentice Meledor Disciplined
    .target Apprentice Meledor
    .use 22473
step
    #completewith next
    .goto Eversong Woods,44.04,70.35,0
    >>|cRXP_BUY_购买|r|T133634:0|t[小棕色背包]|cRXP_BUY_来自|r|cRXP_FRIENDLY_Halis|r|cRXP_BUY_如果你需要背包|r
    .vendor >>出售垃圾
    .target Halis Dawnstrider
--VV Bag check command
step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velan|r和|cRXP_FRIENDLY_Landra|r交谈
    .accept 8491 >>接任务: |cRXP_LOOT_收集豹皮|r
    .goto Eversong Woods,44.72,69.63
    .accept 9395 >>接任务: |cRXP_LOOT_萨瑟利尔庄园|r
    .accept 9254 >>接任务: |cRXP_LOOT_外出的学徒|r
    .goto Eversong Woods,44.03,70.76
    .target Velan Brightoak
    .target Magistrix Landra Dawnstrider
--VV     .accept 9395 >>接任务: |cRXP_LOOT_萨瑟利尔庄园|r << !BloodElf/!Hunter
step
    #xprate >1.4999
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velan|r和|cRXP_FRIENDLY_Landra|r交谈
    .accept 8491 >>接任务: |cRXP_LOOT_收集豹皮|r
    .goto Eversong Woods,44.72,69.63
    .accept 9395 >>接任务: |cRXP_LOOT_萨瑟利尔庄园|r
    .accept 9254 >>接任务: |cRXP_LOOT_外出的学徒|r
    .goto Eversong Woods,44.03,70.76
    .target Velan Brightoak
    .target Magistrix Landra Dawnstrider
step
    #completewith next
    .goto Eversong Woods,43.61,70.66,10 >>上楼
step
    .goto Eversong Woods,43.34,70.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠戴戈利恩|r交谈
    .accept 8892 >>接任务: |cRXP_LOOT_阳帆港|r
    .target Ranger Degolien
step
    #completewith next
    .goto Eversong Woods,43.67,71.31,8 >>下楼
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Marniel|r和|cRXP_FRIENDLY_Ardeyn|r交谈
    .accept 9358 >>接任务: |cRXP_LOOT_游侠萨蕾恩|r
    .goto Eversong Woods,43.67,71.31
    .accept 9258 >>接任务: |cRXP_LOOT_焦痕谷|r
    .goto Eversong Woods,43.58,71.20
    .target Marniel Amberlight
    .target Ardeyn Riverwind
--VV .isOnQuest 8885 << BloodElf Hunter
--VV     .home >>将你的[炉石]设置为晴风村 << BloodElf Hunter
step
    #xprate <1.5
    #completewith Sunsail
    .goto Eversong Woods,42.28,72.62,40,0
    .goto Eversong Woods,40.90,72.87,40,0
    .goto Eversong Woods,39.59,73.65,40,0
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击杀后搜刮他们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
--VV !BloodElf/!Hunter on coords
step
    #xprate >1.4999
    #completewith Sunsail
    .goto Eversong Woods,42.28,72.62,40,0
    .goto Eversong Woods,40.90,72.87,40,0
    .goto Eversong Woods,39.59,73.65,40,0
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击杀后搜刮他们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
step
    #xprate <1.5
    .goto Eversong Woods,38.14,73.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨瑟利尔|r交谈
    .turnin 9395 >>交任务: |cRXP_FRIENDLY_萨瑟利尔庄园|r
    .accept 9067 >>接任务: |cRXP_LOOT_无尽的宴会|r
    .target Lord Saltheril
    --VV !BloodElf/!Hunter (Need to test BE route)
step
    #xprate >1.4999
    .goto Eversong Woods,38.14,73.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨瑟利尔|r交谈
    .turnin 9395 >>交任务: |cRXP_FRIENDLY_萨瑟利尔庄园|r
    .accept 9067 >>接任务: |cRXP_LOOT_无尽的宴会|r
    .target Lord Saltheril
step
    #label Sunsail
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莉森德拉|r和|cRXP_FRIENDLY_维雷迪斯|r交谈
    .turnin 8887 >>交任务: |cRXP_FRIENDLY_凯莉森德拉船长的航海图|r
    .accept 8886 >>接任务: |cRXP_LOOT_暗鳞强盗！|r
    .goto Eversong Woods,36.36,66.62
    .accept 8480 >>接任务: |cRXP_LOOT_失落的军备|r
    .goto Eversong Woods,36.36,66.78
    .target Captain Kelisendra
    .target Velendris Whitemorn
step
    #completewith Aldaron
    >>击杀|cRXP_ENEMY_失心者暴徒|r 和|cRXP_ENEMY_失心者无赖|r
    .complete 8892,1 --Kill Wretched Thug (x5)
    .complete 8892,2 --Kill Wretched Hooligan (x5)
    .mob Wretched Thug
    .mob Wretched Hooligan
step
    .goto Eversong Woods,34.66,68.00,25,0
    .goto Eversong Woods,34.11,69.20,25,0
    .goto Eversong Woods,33.01,71.10,25,0
    .goto Eversong Woods,32.39,69.80,25,0
    .goto Eversong Woods,32.76,68.51,10,0
    .goto Eversong Woods,32.21,69.07,10,0
    .goto Eversong Woods,32.40,70.26,10,0
    .goto Eversong Woods,32.77,70.15,10,0
    .goto Eversong Woods,32.74,68.77,10,0
    .goto Eversong Woods,31.71,68.95,25,0
    .goto Eversong Woods,30.54,69.24,25,0
    .goto Eversong Woods,31.40,70.90,25,0
    .goto Eversong Woods,34.66,68.00,25,0
    .goto Eversong Woods,34.11,69.20,25,0
    .goto Eversong Woods,33.01,71.10,25,0
    .goto Eversong Woods,32.39,69.80,25,0
    .goto Eversong Woods,32.76,68.51
    >>在|cRXP_ENEMY_Wretched|r附近地面上和建筑物内的|cRXP_PICK_Armament Boxes|r中拾取战利品
    .complete 8480,1 --Collect Sin'dorei Armaments (x8)
step
    .goto Eversong Woods,36.36,66.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维雷迪斯|r 交谈
    .turnin 8480 >>交任务: |cRXP_FRIENDLY_失落的军备|r
    .accept 9076 >>接任务: |cRXP_LOOT_失心者的领袖|r
    .target Velendris Whitemorn
step
    #completewith next
    .goto Eversong Woods,32.80,69.49,40,0
    .goto Eversong Woods,32.77,68.65,10,0
    .goto Eversong Woods,32.24,68.98,10,0
    .goto Eversong Woods,32.30,70.03,10,0
    .goto Eversong Woods,32.78,70.17,10,0
    .goto Eversong Woods,32.82,68.80,10,0
    .goto Eversong Woods,33.19,69.21,10 >>爬上建筑顶端
step
    #label Aldaron
    .goto Eversong Woods,32.80,69.40
    >>击杀位于顶部的|r鲁莽的奥尔达隆|r, 从他身上搜刮|r奥尔达隆的头颅|r
    .complete 9076,1 --Collect Aldaron's Head (x1)
    .mob Aldaron the Reckless
step
    .goto Eversong Woods,34.66,68.00,30,0
    .goto Eversong Woods,34.11,69.20,30,0
    .goto Eversong Woods,33.01,71.10,30,0
    .goto Eversong Woods,32.39,69.80,30,0
    .goto Eversong Woods,32.76,68.51,10,0
    .goto Eversong Woods,32.21,69.07,10,0
    .goto Eversong Woods,32.40,70.26,10,0
    .goto Eversong Woods,32.77,70.15,10,0
    .goto Eversong Woods,32.74,68.77,10,0
    .goto Eversong Woods,31.71,68.95,30,0
    .goto Eversong Woods,30.54,69.24,30,0
    .goto Eversong Woods,31.40,70.90,30,0
    .goto Eversong Woods,34.66,68.00,30,0
    .goto Eversong Woods,34.11,69.20,30,0
    .goto Eversong Woods,33.01,71.10,30,0
    .goto Eversong Woods,32.39,69.80,30,0
    .goto Eversong Woods,32.76,68.51
    >>击杀|cRXP_ENEMY_失心者暴徒|r 和|cRXP_ENEMY_失心者无赖|r
    .complete 8892,1 --Kill Wretched Thug (x5)
    .complete 8892,2 --Kill Wretched Hooligan (x5)
    .mob Wretched Thug
    .mob Wretched Hooligan
step
    #completewith next
    .goto Eversong Woods,29.53,72.32,40,0
    .goto Eversong Woods,27.73,71.83,40,0
    .goto Eversong Woods,26.53,74.16,40,0
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击杀后搜刮他们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
step
    #completewith next
    .goto Eversong Woods,24.32,74.07,40,0
    >>击杀|cRXP_ENEMY_暗鳞鱼人|r 和|cRXP_ENEMY_暗鳞先知|r , 搜刮他们的|cRXP_LOOT_货物|r
    >>搜刮地面上的|cRXP_PICK_Cargo Barrels|r
    >>|cRXP_WARN_使用|r|T136222:0|t[奥术洪流]|cRXP_WARN_打断|r|cRXP_ENEMY_暗鳞先知|r的 |T135907:0|t[快速治疗] << BloodElf
    .complete 8886,1 --Collect Captain Kelisendra's Cargo (x6)
    .mob Grimscale Murloc
    .mob Grimscale Oracle
step
    .goto Eversong Woods,24.36,72.66,40,0
    .goto Eversong Woods,25.09,71.12,40,0
    .goto Eversong Woods,24.32,69.66,40,0
    .goto Eversong Woods,24.66,68.47,40,0
    .goto Eversong Woods,25.68,68.93,40,0
    .goto Eversong Woods,25.81,68.16,40,0
    .goto Eversong Woods,24.89,66.85,40,0
    .goto Eversong Woods,25.24,65.65,40,0
    .goto Eversong Woods,24.89,66.85,40,0
    .goto Eversong Woods,25.81,68.16,40,0
    .goto Eversong Woods,25.68,68.93,40,0
    .goto Eversong Woods,24.66,68.47,40,0
    .goto Eversong Woods,24.32,69.66,40,0
    .goto Eversong Woods,25.09,71.12,40,0
    .goto Eversong Woods,24.36,72.66
    >>击杀|cRXP_ENEMY_呜啦哇啦|r. 击败他后可搜刮出|cRXP_LOOT_呜啦哇啦的戒指|r
    >>|cRXP_WARN_他稍作巡逻|r
    >>|cRXP_WARN_使用|r|T136222:0|t[奥术洪流]|cRXP_WARN_打断|r|cRXP_ENEMY_呜啦哇啦|r的 |T136052:0|t[治疗波] << BloodElf
    .complete 8885,1 --Collect Ring of Mmmrrrggglll (x1)
    .unitscan Mmmrrrggglll
step
    .goto Eversong Woods,25.24,65.65,50,0
    .goto Eversong Woods,24.89,66.85,50,0
    .goto Eversong Woods,25.81,68.16,50,0
    .goto Eversong Woods,25.68,68.93,50,0
    .goto Eversong Woods,24.66,68.47,50,0
    .goto Eversong Woods,24.32,69.66,50,0
    .goto Eversong Woods,25.09,71.12,50,0
    .goto Eversong Woods,24.36,72.66
    >>击杀|cRXP_ENEMY_暗鳞鱼人|r 和|cRXP_ENEMY_暗鳞先知|r , 搜刮他们的|cRXP_LOOT_货物|r
    >>搜刮地面上的|cRXP_PICK_Cargo Barrels|r
    >>|cRXP_WARN_使用|r|T136222:0|t[奥术洪流]|cRXP_WARN_打断|r|cRXP_ENEMY_暗鳞先知|r的 |T135907:0|t[快速治疗] << BloodElf
    .complete 8886,1 --Collect Captain Kelisendra's Cargo (x6)
    .mob Grimscale Murloc
    .mob Grimscale Oracle
step
    .goto Eversong Woods,29.90,58.45,10,0
    .goto Eversong Woods,30.23,58.44,10,0
    .goto Eversong Woods,30.22,58.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈斯温里奥|r交谈
    .turnin 8885 >>交任务: |cRXP_FRIENDLY_呜啦哇啦的戒指|r
    .target Hathvelion Sungaze
step
    #completewith next
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击杀后搜刮他们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莉森德拉|r和|cRXP_FRIENDLY_维雷迪斯|r交谈
    .turnin 8886 >>交任务: |cRXP_FRIENDLY_暗鳞强盗！|r
    .goto Eversong Woods,36.36,66.62
    .turnin 9076 >>交任务: |cRXP_FRIENDLY_失心者的领袖|r
    .goto Eversong Woods,36.36,66.78
    .target Captain Kelisendra
    .target Velendris Whitemorn
step << skip
    #xprate <1.5
    #completewith next
    .goto Eversong Woods,35.94,72.10,40,0
    .goto Eversong Woods,34.61,74.85,40,0
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击杀后搜刮他们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .target Springpaw Stalker
--VV BloodElf Hunter
step << skip
    #xprate <1.5
    .goto Eversong Woods,34.06,80.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉莉亚娜|r交谈
    .turnin 9258 >>交任务: |cRXP_FRIENDLY_焦痕谷|r
    .accept 8473 >>接任务: |cRXP_LOOT_痛苦的抉择|r
    .target Larianna Riverwind
    --VV BloodElf Hunter
step << skip
    #completewith next
    #xprate <1.5
    >>击杀|cRXP_ENEMY_枯萎的护卫者|r
    >>|cRXP_WARN_请注意, 施放|r|T132282:0|t[打击]时, |cRXP_WARN_会立即造成双倍伤害|r
    .complete 8473,1 --Kill Withered Green Keeper (x10)
    .mob Withered Green Keeper
    --VV BloodElf Hunter
step << skip
    #xprate <1.5
    .goto Eversong Woods,35.10,84.05,10,0
    .goto Eversong Woods,34.91,84.34
    .use 8474 >>击杀|cRXP_ENEMY_怀特巴克|r. 击败后搜刮其掉落的 |T133280:0|t[|cRXP_LOOT_怀特巴克的坠饰|r]. |cRXP_WARN_使用该物品开启任务|r
    >>|cRXP_ENEMY_怀特巴克|r|cRXP_WARN_刷新时间为7分30秒|r
    .collect 23228,1,8474,1 --Collect Old Whitebark's Pendant (x1)
    .accept 8474 >>接任务: |cRXP_LOOT_怀特巴克的坠饰|r
    .mob Old Whitebark
    --VV BloodElf Hunter
step << skip
    #xprate <1.5
#loop
	.line Eversong Woods,36.07,83.10,36.21,85.47,33.24,87.69,32.05,87.25,32.63,83.57,33.46,81.99,34.47,83.08,36.07,83.10
	.goto Eversong Woods,36.07,83.10,40,0
	.goto Eversong Woods,36.21,85.47,40,0
	.goto Eversong Woods,33.24,87.69,40,0
	.goto Eversong Woods,32.05,87.25,40,0
	.goto Eversong Woods,32.63,83.57,40,0
	.goto Eversong Woods,33.46,81.99,40,0
	.goto Eversong Woods,34.47,83.08,40,0
	.goto Eversong Woods,36.07,83.10,40,0
    >>击杀|cRXP_ENEMY_枯萎的护卫者|r
    >>|cRXP_WARN_请注意, 施放|r|T132282:0|t[打击]时, |cRXP_WARN_会立即造成双倍伤害|r
    .complete 8473,1 --Kill Withered Green Keeper (x10)
    .mob Withered Green Keeper
    --VV BloodElf Hunter
step << skip
    #xprate <1.5
    .goto Eversong Woods,34.06,80.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉莉亚娜|r交谈
    .turnin 8473 >>交任务: |cRXP_FRIENDLY_痛苦的抉择|r
    .turnin 8474 >>交任务: |cRXP_FRIENDLY_怀特巴克的坠饰|r
    .accept 10166 >>接任务: |cRXP_LOOT_怀特巴克的记忆|r
    .target Larianna Riverwind
    --VV BloodElf Hunter
step << skip
    #xprate <1.5
    #completewith next
    .goto Eversong Woods,37.73,86.30
    .cast 33980 >>使用 |T133280:0|t[|cRXP_LOOT_Pendant|r] 召唤|cRXP_ENEMY_Whitebark's Spirit|r
    .use 28209
    .isOnQuest 10166
    --VV BloodElf Hunter
step << skip
    #xprate <1.5
    .goto Eversong Woods,37.73,86.30
    >>击败|cRXP_ENEMY_Whitebark的幽灵|r
    >>击败他后与|cRXP_FRIENDLY_白松之灵|r交谈
    .turnin 10166 >>交任务: |cRXP_FRIENDLY_怀特巴克的记忆|r
    .target Whitebark's Spirit
    .use 28209
    --VV BloodElf Hunter
step << skip
    #xprate <1.5
    #completewith Sareyn
#loop
	.line Eversong Woods,36.07,83.10,36.21,85.47,33.24,87.69,32.05,87.25,32.63,83.57,33.46,81.99,34.47,83.08,36.07,83.10
	.goto Eversong Woods,36.07,83.10,40,0
	.goto Eversong Woods,36.21,85.47,40,0
	.goto Eversong Woods,33.24,87.69,40,0
	.goto Eversong Woods,32.05,87.25,40,0
	.goto Eversong Woods,32.63,83.57,40,0
	.goto Eversong Woods,33.46,81.99,40,0
	.goto Eversong Woods,34.47,83.08,40,0
	.goto Eversong Woods,36.07,83.10,40,0
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
    --VV BloodElf Hunter
step << skip
    #xprate >1.4999
    #completewith Sareyn
    .goto Eversong Woods,34.71,68.09,20,0
    .goto Eversong Woods,32.79,70.56
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
    --VV BloodElf Hunter
step
    #completewith Sareyn
    .goto Eversong Woods,34.71,68.09,20,0
    .goto Eversong Woods,32.79,70.56
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step << skip
    .goto Eversong Woods,37.84,66.61,40,0
    .goto Eversong Woods,37.45,65.60,40,0
    .goto Eversong Woods,39.71,63.80,40,0
    .goto Eversong Woods,40.64,66.89,40,0
    .goto Eversong Woods,41.94,66.65,40,0
    .goto Eversong Woods,42.83,66.14,40,0
    .goto Eversong Woods,43.38,64.67,40,0
    .goto Eversong Woods,43.86,65.58,40,0
    .goto Eversong Woods,45.33,65.92,40,0
    .goto Eversong Woods,45.44,67.76,40,0
    .goto Eversong Woods,46.07,67.01,40,0
    .goto Eversong Woods,46.69,67.31,40,0
    .goto Eversong Woods,47.12,68.81,40,0
    .goto Eversong Woods,37.84,66.61
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击杀后搜刮他们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
--VV !BloodElf/!Hunter
step << skip
    #xprate >1.4999
    .goto Eversong Woods,37.84,66.61,40,0
    .goto Eversong Woods,37.45,65.60,40,0
    .goto Eversong Woods,39.71,63.80,40,0
    .goto Eversong Woods,40.64,66.89,40,0
    .goto Eversong Woods,41.94,66.65,40,0
    .goto Eversong Woods,42.83,66.14,40,0
    .goto Eversong Woods,43.38,64.67,40,0
    .goto Eversong Woods,43.86,65.58,40,0
    .goto Eversong Woods,45.33,65.92,40,0
    .goto Eversong Woods,45.44,67.76,40,0
    .goto Eversong Woods,46.07,67.01,40,0
    .goto Eversong Woods,46.69,67.31,40,0
    .goto Eversong Woods,47.12,68.81,40,0
    .goto Eversong Woods,37.84,66.61
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击杀后搜刮他们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
--VV BloodElf Hunter
step << Hunter
    .goto Eversong Woods,44.04,70.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈利斯|r交谈
    >>|cRXP_BUY_购买|r|T132382:0|t[劣质箭] |cRXP_BUY_和|r|T132382:0|t[锋利的箭] |cRXP_BUY_从他那里|r. |cRXP_BUY_购买|r|T133634:0|t[小棕色布袋] |cRXP_BUY_从她那里|r|cRXP_BUY_如果你需要背包|r
    .collect 2512,200,9252,1 << Hunter --Rough Arrow (200)
    .collect 2515,1000,9252,1 << Hunter --Sharp Arrow (1000)
    .target Halis Dawnstrider
    .itemcount 2512,<200
	.xp >10,1
--VV Bag check command
step << Hunter
    .goto Eversong Woods,44.04,70.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈利斯|r交谈
    >>|cRXP_BUY_购买|r|T132382:0|t[锋利的箭] |cRXP_BUY_从她那里|r. |cRXP_BUY_购买|r|T133634:0|t[棕色小包] |cRXP_BUY_从他那里|r|cRXP_BUY_如果你需要背包|r
    .collect 2515,1000,9252,1 << Hunter --Sharp Arrow (1000)
    .target Halis Dawnstrider
--VV Bag check command
step << !Hunter
    #completewith Sareyn
    .goto Eversong Woods,44.04,70.35,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈利斯|r交谈
    >>|cRXP_BUY_如果你需要袋子, 可以向他购买|r |T133634:0|t[小棕色袋子] |r
    .vendor >>出售垃圾
    .target Halis Dawnstrider
--VV Bag check command
--VV !BloodElf/!Hunter
step
    #xprate >1.4999
    .goto Eversong Woods,44.03,70.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Landra|r交谈
    .accept 9144 >>接任务: |cRXP_LOOT_迷失在幽魂之地|r
    .target Magistrix Landra Dawnstrider
    .xp <10,1
step
    #completewith next
    .goto Eversong Woods,43.61,70.66,10 >>上楼
    --VV !Hunter
step
    .goto Eversong Woods,43.34,70.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠戴戈利恩|r交谈
    .turnin 8892 >>交任务: |cRXP_FRIENDLY_阳帆港|r
    .accept 9359 >>接任务: |cRXP_LOOT_远行者居所|r
    .target Ranger Degolien
    --VV !Hunter
step
    #completewith next
    .goto Eversong Woods,43.70,71.56,8 >>下楼
    --VV !Hunter
step
    .goto Eversong Woods,43.70,71.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨希尔|r交谈
    .vendor 16261 >>NPC与修理
    .target Sathiel
    .isOnQuest 9358
    .money >1.00
    --VV !Hunter
step
    .goto Eversong Woods,44.72,69.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velan|r交谈
    .turnin 8491 >>交任务: |cRXP_FRIENDLY_收集豹皮|r
    .target Velan Brightoak
    .isQuestComplete 8491
--VV !Hunter
step
    #label Sareyn
    .goto Eversong Woods,46.93,71.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠萨蕾恩|r交谈
    .turnin 9358 >>交任务: |cRXP_FRIENDLY_游侠萨蕾恩|r
    .accept 9252 >>接任务: |cRXP_LOOT_保卫晴风村|r
    .target Ranger Sareyn
step
    #completewith Notes
    >>击杀|cRXP_ENEMY_腐肢劫掠者|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_腐肢劫掠者|r|cRXP_WARN_施放|r|T136128:0|t[疾病之触] (|cRXP_WARN_15点伤害, 瞬发法术|r)
    .complete 9252,1 --Kill Rotlimb Marauder (x4)
    .mob Rotlimb Marauder
step
    .goto Eversong Woods,50.89,80.74,40,0
    .goto Eversong Woods,50.83,78.68,40,0
    .goto Eversong Woods,50.42,77.39,40,0
    .goto Eversong Woods,51.07,76.32,40,0
    .goto Eversong Woods,50.89,80.74,40,0
    .goto Eversong Woods,50.83,78.68,40,0
    .goto Eversong Woods,50.42,77.39,40,0
    .goto Eversong Woods,51.07,76.32
    >>击杀|cRXP_ENEMY_黑暗怨灵|r
    >>|cRXP_WARN_要小心, 因为|r|cRXP_ENEMY_黑暗怨灵|r|cRXP_WARN_施法|r|T136224:0|t[狂怒]|cRXP_WARN_(生命值降低时造成更高伤害并提升攻击速度)|r
    .complete 9252,2 --Kill Darkwraith (x4)
    .mob Darkwraith
step
    .goto Eversong Woods,54.28,70.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mirveda|r交谈
    .turnin 9254 >>交任务: |cRXP_FRIENDLY_外出的学徒|r
    .accept 8487 >>接任务: |cRXP_LOOT_被腐蚀的土地|r
    .target Apprentice Mirveda
step
    .goto Eversong Woods,54.13,71.21,40,0
    .goto Eversong Woods,50.79,72.17,40,0
    .goto Eversong Woods,50.87,71.40,40,0
    .goto Eversong Woods,51.21,69.89,40,0
    .goto Eversong Woods,51.47,69.09,40,0
    .goto Eversong Woods,52.60,68.47,40,0
    .goto Eversong Woods,53.24,69.28,40,0
    .goto Eversong Woods,53.88,70.03,40,0
    .goto Eversong Woods,54.13,71.21,40,0
    .goto Eversong Woods,50.79,72.17,40,0
    .goto Eversong Woods,50.87,71.40,40,0
    .goto Eversong Woods,51.21,69.89,40,0
    .goto Eversong Woods,51.47,69.09,40,0
    .goto Eversong Woods,52.60,68.47,40,0
    .goto Eversong Woods,53.24,69.28,40,0
    .goto Eversong Woods,53.88,70.03
    >>战利品|cRXP_PICK_污秽土壤堆|r在地面上
    .complete 8487,1 --Collect Tainted Soil Sample (x8)
step
    .goto Eversong Woods,54.28,70.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mirveda|r交谈
    >>|cRXP_WARN_等待RP结束|r
    .turnin 8487 >>交任务: |cRXP_FRIENDLY_被腐蚀的土地|r
    .timer 9,Corrupted Soil RP
    .accept 8488 >>接任务: |cRXP_LOOT_出人意料的结果|r
    .target Apprentice Mirveda
step
    .goto Eversong Woods,53.66,69.74,20,0
    .goto Eversong Woods,54.28,70.97
    >>击杀 |cRXP_ENEMY_冷酷的加苏尔|r 和 |cRXP_ENEMY_愤怒之影|r , 以保护 |cRXP_FRIENDLY_米尔维达|r
    .complete 8488,1 --Protect Apprentice Mirveda
    .mob Gharsul the Remorseless
    .mob Angershade
step
    #label Notes
    .goto Eversong Woods,54.28,70.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mirveda|r交谈
    .turnin 8488 >>交任务: |cRXP_FRIENDLY_出人意料的结果|r
    .accept 9255 >>接任务: |cRXP_LOOT_研究笔记|r
    .target Apprentice Mirveda
step
    .goto Eversong Woods,54.13,71.21,40,0
    .goto Eversong Woods,50.79,72.17,40,0
    .goto Eversong Woods,50.87,71.40,40,0
    .goto Eversong Woods,51.21,69.89,40,0
    .goto Eversong Woods,51.47,69.09,40,0
    .goto Eversong Woods,52.60,68.47,40,0
    .goto Eversong Woods,53.24,69.28,40,0
    .goto Eversong Woods,53.88,70.03,40,0
    .goto Eversong Woods,54.13,71.21,40,0
    .goto Eversong Woods,50.79,72.17,40,0
    .goto Eversong Woods,50.87,71.40,40,0
    .goto Eversong Woods,51.21,69.89,40,0
    .goto Eversong Woods,51.47,69.09,40,0
    .goto Eversong Woods,52.60,68.47,40,0
    .goto Eversong Woods,53.24,69.28,40,0
    .goto Eversong Woods,53.88,70.03
    >>击杀|cRXP_ENEMY_腐肢劫掠者|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_腐肢劫掠者|r|cRXP_WARN_施放|r|T136128:0|t[疾病之触] (|cRXP_WARN_15点伤害, 瞬发法术|r)
    .complete 9252,1 --Kill Rotlimb Marauder (x4)
    .mob Rotlimb Marauder
step << Paladin/Priest/Mage/Hunter
    .goto Eversong Woods,54.13,71.21,40,0
    .goto Eversong Woods,50.79,72.17,40,0
    .goto Eversong Woods,50.87,71.40,40,0
    .goto Eversong Woods,51.21,69.89,40,0
    .goto Eversong Woods,51.47,69.09,40,0
    .goto Eversong Woods,52.60,68.47,40,0
    .goto Eversong Woods,53.24,69.28,40,0
    .goto Eversong Woods,53.88,70.03,40,0
    .goto Eversong Woods,54.13,71.21,40,0
    .goto Eversong Woods,50.79,72.17,40,0
    .goto Eversong Woods,50.87,71.40,40,0
    .goto Eversong Woods,51.21,69.89,40,0
    .goto Eversong Woods,51.47,69.09,40,0
    .goto Eversong Woods,52.60,68.47,40,0
    .goto Eversong Woods,53.24,69.28,40,0
    .goto Eversong Woods,53.88,70.03
    .xp 9+5875 >>升级至5875/6500经验值
step << Warrior/Warlock/Rogue !Undead/!Warlock !Paladin !Priest !Mage
    .goto Eversong Woods,54.13,71.21,40,0
    .goto Eversong Woods,50.79,72.17,40,0
    .goto Eversong Woods,50.87,71.40,40,0
    .goto Eversong Woods,51.21,69.89,40,0
    .goto Eversong Woods,51.47,69.09,40,0
    .goto Eversong Woods,52.60,68.47,40,0
    .goto Eversong Woods,53.24,69.28,40,0
    .goto Eversong Woods,53.88,70.03,40,0
    .goto Eversong Woods,54.13,71.21,40,0
    .goto Eversong Woods,50.79,72.17,40,0
    .goto Eversong Woods,50.87,71.40,40,0
    .goto Eversong Woods,51.21,69.89,40,0
    .goto Eversong Woods,51.47,69.09,40,0
    .goto Eversong Woods,52.60,68.47,40,0
    .goto Eversong Woods,53.24,69.28,40,0
    .goto Eversong Woods,53.88,70.03
    .xp 9+5700 >>升级至5700+/6500经验值
step << Undead Warlock
    .goto Eversong Woods,54.13,71.21,40,0
    .goto Eversong Woods,50.79,72.17,40,0
    .goto Eversong Woods,50.87,71.40,40,0
    .goto Eversong Woods,51.21,69.89,40,0
    .goto Eversong Woods,51.47,69.09,40,0
    .goto Eversong Woods,52.60,68.47,40,0
    .goto Eversong Woods,53.24,69.28,40,0
    .goto Eversong Woods,53.88,70.03,40,0
    .goto Eversong Woods,54.13,71.21,40,0
    .goto Eversong Woods,50.79,72.17,40,0
    .goto Eversong Woods,50.87,71.40,40,0
    .goto Eversong Woods,51.21,69.89,40,0
    .goto Eversong Woods,51.47,69.09,40,0
    .goto Eversong Woods,52.60,68.47,40,0
    .goto Eversong Woods,53.24,69.28,40,0
    .goto Eversong Woods,53.88,70.03
    .xp 9+5950 >>升级至5950+/6500经验值
step << !Warlock/!Undead
    #completewith ExitFalcon
    .hs >>传送至鹰翼广场
--VV !Hunter x2
step << Undead Warlock
    #xprate <1.5
    .goto Eversong Woods,55.70,54.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Antheol|r交谈
    .turnin 9066 >>交任务: |cRXP_FRIENDLY_导师的训诫|r
    .target Instructor Antheol
step << Undead Warlock
    #completewith next
    .goto Eversong Woods,56.51,49.61,25,0
    .goto Silvermoon City,73.39,59.65
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
step << Undead Warlock
    #completewith next
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,78.28,59.34,8,0
    .goto Silvermoon City,78.36,60.14,8 >>进入旅店
step << Undead Warlock
    .goto Silvermoon City,79.50,58.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Suntouched|r交谈
    >>|cRXP_BUY_从他那里购买 a|r|T132798:0|t[日光陈酿]|r
    .collect 22775,1,9067,1 --Suntouched Special Reserve (1)
    .target Vinemaster Suntouched
step << Undead Warlock
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,62.89,31.26,30,0
    .goto Silvermoon City,51.83,17.91,30,0
    .goto Silvermoon City,49.45,15.00
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .isQuestAvailable 1473
step << Undead Warlock
    #completewith next
    .goto Undercity,59.81,11.33,20,0
    .goto Undercity,66.08,18.24,30,0
    .goto Undercity,66.04,32.97,30,0
    .goto Undercity,65.97,44.08,30,0
    .goto Undercity,71.31,44.16,10,0
    .goto Undercity,72.99,44.19,10 >>乘坐升降梯前往幽暗城
    .isQuestAvailable 1473
step << Undead Warlock
    #completewith next
    .goto Undercity,71.90,40.45,15,0
    .goto Undercity,68.15,40.83,10,0
    .goto Undercity,74.53,43.72,30,0
    .goto Undercity,79.60,42.63,30,0
    .goto Undercity,85.04,25.97,40 >>前往|cRXP_FRIENDLY_Carendin|r
    .isQuestAvailable 1473
step << Undead Warlock
    .goto Undercity,85.04,25.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Carendin|r交谈
    .accept 1473 >>接任务: |cRXP_LOOT_虚空中的生物|r
    .target Carendin Halgar
step << Undead Warlock
    .goto Undercity,88.91,15.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richard|r交谈
    .train 707 >>训练你的职业法术
    .target Richard Kerwin
    .xp <10,1
    .xp >12,1
step << Undead Warlock
    .goto Undercity,88.91,15.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richard|r交谈
    .train 705 >>训练你的职业法术
    .target Richard Kerwin
    .xp <12,1
step << skip --Logout skip Undead Warlock
    #completewith next
    .goto Undercity,82.36,15.31
    .goto Undercity,67.90,15.29,30 >>|cRXP_WARN_前往你右侧的试剂商, 将角色站到最低层楼梯的最高处, 直到看起来像是漂浮一样, 然后退出游戏再重新登录(此为“跳过登出”操作)|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >>|cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .isOnQuest 1473
step << Undead Warlock
    #completewith next
    .goto Tirisfal Glades,61.75,64.96
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .isOnQuest 1473
step << Undead Warlock
    .goto Tirisfal Glades,51.44,67.69,15,0
    .goto Tirisfal Glades,51.06,67.57
    >>拾取地面上的|cRXP_PICK_虚空中的生物宝箱|r
    .complete 1473,1 --Creature of the Void (1)
step << Undead Warlock
    #completewith next
    .goto Undercity,66.16,1.05,20,0
    .goto Undercity,66.08,18.24,30,0
    .goto Undercity,66.04,32.97,30,0
    .goto Undercity,65.97,44.08,30,0
    .goto Undercity,71.31,44.16,10,0
    .goto Undercity,72.99,44.19,10 >>向左下前往幽暗城
    .isOnQuest 1473
step << Undead Warlock
    #completewith next
    .goto Undercity,71.90,40.45,15,0
    .goto Undercity,68.15,40.83,10,0
    .goto Undercity,74.53,43.72,30,0
    .goto Undercity,79.60,42.63,30,0
    .goto Undercity,85.04,25.97,40 >>前往|cRXP_FRIENDLY_Carendin|r
    .isOnQuest 1473
step << Undead Warlock
    .goto Undercity,85.04,25.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Carendin|r交谈
    .turnin 1473 >>交任务: |cRXP_FRIENDLY_虚空中的生物|r
    .accept 1471 >>接任务: |cRXP_LOOT_誓缚|r
    .target Carendin Halgar
step << Undead Warlock
    #completewith next
    .goto Undercity,86.64,27.10
    .cast 9221 >>在召唤法阵中使用 |T134416:0|t[召唤符文]
    .use 6284
step << Undead Warlock
    .goto Undercity,86.64,27.10
    >>击杀召唤的虚空行者
    .complete 1471,1 --Kill Summoned Voidwalker (1)
    .mob Summoned Voidwalker
    .use 6284
step << Undead Warlock
    .goto Undercity,85.04,25.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Carendin|r交谈
    .turnin 1471 >>交任务: |cRXP_FRIENDLY_誓缚|r
    .target Carendin Halgar
step << Undead Warlock
    #completewith ExitFalcon
    .hs >>传送至鹰翼广场
step
    .goto Eversong Woods,48.16,47.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Delaniel|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从她那里购买|r|T133968:0|t[刚出炉的面包]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r|T133968:0|t[刚出炉的面包]|r << Paladin
    .collect 1179,20,8491,1 << Priest/Mage/Warlock/Druid/Paladin --Ice Cold Milk (20)
    .collect 4541,20,8491,1 << !Priest !Mage !Warlock !Druid !Paladin --Freshly Baked Bread (20)
    .collect 4541,10,8491,1 << Paladin --Freshly Baked Bread (10)
    .money <0.0476 << !Priest !Mage !Warlock !Druid !Paladin
    .money <0.0714 << Paladin
    .target Innkeeper Delaniel
step
    #label Buyfood1
    .goto Eversong Woods,48.16,47.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Delaniel|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从她那里购买|r|T133968:0|t[刚出炉的面包]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r|T133968:0|t[刚出炉的面包]|r << Paladin
    .collect 1179,10,8491,1 << Priest/Mage/Warlock/Druid/Paladin --Ice Cold Milk (10)
    .collect 4541,10,8491,1 << !Priest !Mage !Warlock !Druid !Paladin --Freshly Baked Bread (10)
    .collect 4541,5,8491,1 << Paladin --Freshly Baked Bread (10)
    .money <0.0238 << !Priest !Mage !Warlock !Druid !Paladin
    .money <0.0357 << Paladin
    .target Innkeeper Delaniel
step << Paladin/Priest/Mage
    #xprate <1.5
    .goto Eversong Woods,48.17,46.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Aeldon|r交谈
    .turnin 8482 >>交任务: |cRXP_FRIENDLY_秘密文件|r
    .accept 8483 >>接任务: |cRXP_LOOT_矮人间谍|r
    .target Aeldon Sunbrand
step << Paladin/Priest/Mage
    #xprate >1.4999
    .goto Eversong Woods,48.17,46.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Aeldon|r交谈
    .turnin 8482 >>交任务: |cRXP_FRIENDLY_秘密文件|r
    .target Aeldon Sunbrand
step << Paladin/Priest/Mage
    #xprate <1.5
    .goto Eversong Woods,44.57,53.30
    .gossipoption 91301 >>与|cRXP_FRIENDLY_Anvilward|r交谈
    .timer 28,Prospector Anvilward RP
    .target Prospector Anvilward
    .skipgossip 15420,1
    .isOnQuest 8483
step << Paladin/Priest/Mage
    #xprate <1.5
    .goto Eversong Woods,44.57,53.11,10,0
    .goto Eversong Woods,44.01,52.83,10,0
    .goto Eversong Woods,43.91,53.12,10,0
    .goto Eversong Woods,44.07,53.33
    >>|cRXP_WARN_等待RP结束|r
    >>击杀|cRXP_ENEMY_勘测员安威瓦尔德|r. 击败他后掠夺他的|cRXP_LOOT_头|r
    .complete 8483,1 --Collect Prospector Anvilward's Head (x1)
    .mob Prospector Anvilward
step
    #xprate <1.5
    .goto Eversong Woods,48.17,46.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Aeldon|r交谈
    .turnin 8483 >>交任务: |cRXP_FRIENDLY_矮人间谍|r
    .target Aeldon Sunbrand
--VV !Hunter
step
    .goto Eversong Woods,45.02,37.68
    .xp 10 >>升级至10级
    --VV !Hunter
step << !Paladin !Priest !Mage
    #xprate >1.4999
    .goto Eversong Woods,48.17,46.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Aeldon|r交谈
    .turnin 8483 >>交任务: |cRXP_FRIENDLY_矮人间谍|r
    .target Aeldon Sunbrand
step << Warrior tbc/Rogue
    +装备 |T135274:0|t[略带磨损的游侠之刃]
    .use 23396
    .itemcount 23396,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Paladin
    #xprate <1.5
    +装备 |T135274:0|t[略带磨损的游侠之刃]
    .use 23396
    .itemcount 23396,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Undead Warrior tbc/Rogue
    .goto Eversong Woods,48.34,45.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斗技者拉雷尼斯|r交谈
    .train 201 >>学习1小时剑术 << Rogue
    .train 202 >>学习两小时剑术 << Undead Warrior tbc
    .target Duelist Larenis
    .money <0.11
step << Warrior tbc/Paladin tbc/Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够足够的钱买一把 |T135321:0|t[步兵剑](5银9铜). 如果暂时不够, 稍后再回来处理
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior tbc/Paladin tbc/Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135321:0|t[步兵剑]|r
    .collect 2488,1,8476,1 --Gladius (1)
    .target Geron
    .money <0.0509
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior wotlk/Paladin wotlk
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T133053:0|t[木槌棒] (6银66铜) 的钱. 如果暂时不够, 稍后再回来
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Warrior wotlk/Paladin wotlk
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133053:0|t[木槌棒]|r
    .collect 2493,1,8476,1 --Collect Wooden Mallet (1)
    .money <0.0666
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T135641:0|t[卷刃的剑] (3s 82c) 的钱. 如果暂时不够, 稍后再回来处理
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
    .train 201,1
step << Rogue
    .goto Eversong Woods,48.49,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135641:0|t[卷刃的剑]|r
    .collect 2494,1,8476,1 --Collect Stiletto
    .money <0.0382
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
    .train 201,1
step << Warrior tbc/Paladin tbc/Rogue
    #completewith Antheol2
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior wotlk/Paladin wotlk
    #completewith Antheol2
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Rogue
    #completewith Antheol2
    +装备 |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Paladin
    .goto Eversong Woods,48.39,46.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺尔蕾妮|r交谈
    .train 633 >>训练你的职业法术
    .target Noellene
	.xp <10,1
    .xp >12,1
step << Paladin
    .goto Eversong Woods,48.39,46.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺尔蕾妮|r交谈
    .accept 9677 >>接任务: |cRXP_LOOT_骑士领主布拉德瓦罗的召唤|r
    .train 19834 >>训练你的职业法术
    .target Noellene
	.xp <12,1
step << Rogue
    .goto Eversong Woods,48.58,46.29,8,0
    .goto Eversong Woods,48.50,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塔娜莉亚|r交谈
    .train 2983 >>训练你的职业法术
    .target Tannaria
	.xp <10,1
step << Hunter
    .goto Eversong Woods,48.27,46.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉诺维亚|r交谈
    .train 13165 >>训练你的职业法术
    .target Hannovia
	.xp <10,1
	.xp >12,1
step << Hunter
    .goto Eversong Woods,48.27,46.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉诺维亚|r交谈
    .train 14281 >>训练你的职业法术
    .target Hannovia
	.xp <12,1
step << Mage/Priest/Warlock
    #completewith next
    .goto Eversong Woods,47.79,47.35,8,0
    .goto Eversong Woods,47.86,47.76,8 >>进入旅店
	.xp <10,1
step << Mage/Priest/Warlock
    #completewith MaPrWaTrain2
    .goto Eversong Woods,48.27,47.05,8,0
    .goto Eversong Woods,48.06,47.11,8 >>上楼
	.xp <10,1
step << Priest
    .goto Eversong Woods,47.85,47.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_珀纳瑞斯|r交谈
    .turnin 9489 >>接任务: |cRXP_LOOT_清理死亡之痕|r << BloodElf
    .train 8092 >>训练你的职业法术
    .target Ponaris
	.xp <10,1
    .xp >12,1
step << Priest
    #label MaPrWaTrain2
    .goto Eversong Woods,47.85,47.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_珀纳瑞斯|r交谈
    .turnin 9489 >>接任务: |cRXP_LOOT_清理死亡之痕|r << BloodElf
    .train 592 >>训练你的职业法术
    .target Ponaris
	.xp <12,1
step << Mage
    .goto Eversong Woods,48.04,48.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_加琳黛尔|r交谈
    .train 7300 >>训练你的职业法术
    .target Garridel
	.xp <10,1
    .xp >12,1
step << Mage
    #label MaPrWaTrain2
    .goto Eversong Woods,48.04,48.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_加琳黛尔|r交谈
    .train 145 >>训练你的职业法术
    .target Garridel
	.xp <12,1
step << Undead Warlock
    .goto Eversong Woods,48.23,47.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塞罗努斯|r谈话
    .train 707 >>训练你的职业法术
    .target Celoenus
    .xp <10,1
    .xp >12,1
step << Undead Warlock
    #label MaPrWaTrain2
    .goto Eversong Woods,48.23,47.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塞罗努斯|r谈话
    .train 705 >>训练你的职业法术
    .target Celoenus
    .xp <12,1
step
    #label ExitFalcon
    #completewith Antheol2
    .goto Eversong Woods,46.65,49.13,40 >>离开鹰翼广场
step << !Undead !BloodElf/!Priest
    #xprate >1.4999
    .goto Eversong Woods,50.34,50.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尔拉|r交谈
    .accept 8475 >>接任务: |cRXP_LOOT_死亡之痕|r
    .target Ranger Jaela
    .xp >11,1
step << !Undead !BloodElf/!Priest
    #xprate >1.4999
    .goto Eversong Woods,50.82,56.49,40,0
    .goto Eversong Woods,49.72,56.96,40,0
    .goto Eversong Woods,49.48,53.13,40,0
    .goto Eversong Woods,50.95,52.96,40,0
    .goto Eversong Woods,50.82,56.49,40,0
    .goto Eversong Woods,49.72,56.96,40,0
    .goto Eversong Woods,49.48,53.13,40,0
    .goto Eversong Woods,50.95,52.96
    >>击杀|cRXP_ENEMY_天灾骨骸|r
    .complete 8475,1 --Kill Plaguebone Pillager (x8)
    .mob Plaguebone Pillager
    .isOnQuest 8475
step << !Undead !BloodElf/!Priest
    #xprate >1.4999
    .goto Eversong Woods,50.34,50.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尔拉|r交谈
    .turnin 8475 >>交任务: |cRXP_FRIENDLY_死亡之痕|r
    .target Ranger Jaela
    .isQuestComplete 8475
step << BloodElf Warlock
    #completewith next
    .goto Eversong Woods,56.51,49.61,25,0
    .goto Silvermoon City,73.39,59.65
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .isQuestAvailable 9529
step << BloodElf Warlock
    #completewith next
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,78.28,59.34,8,0
    .goto Silvermoon City,78.36,60.14,8 >>进入旅店
step << BloodElf Warlock
    .goto Silvermoon City,79.50,58.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Suntouched|r交谈
    >>|cRXP_BUY_从他那里购买 a|r|T132798:0|t[日光陈酿]|r
    .collect 22775,1,9067,1 --Suntouched Special Reserve (1)
    .target Vinemaster Suntouched
step << BloodElf Warlock
    #completewith TheStone
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,75.65,45.04,15,0
    .goto Silvermoon City,76.33,43.33,12 >>进入建筑后, 沿楼梯下行
    .isQuestAvailable 9529
step << BloodElf Warlock
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .accept 9529 >>接任务: |cRXP_LOOT_虚空石|r
    .train 707 >>训练你的职业法术
    .target Talionia
    .xp <10,1
    .xp >12,1
step << BloodElf Warlock
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .accept 9529 >>接任务: |cRXP_LOOT_虚空石|r
    .train 705 >>训练你的职业法术
    .target Talionia
    .xp <12,1
step << BloodElf Warlock
    #label TheStone
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .accept 9529 >>接任务: |cRXP_LOOT_虚空石|r
    .target Talionia
    .isQuestAvailable 9529
step << BloodElf Warlock
    #completewith next
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Eversong Woods,56.66,50.11
    .zone Eversong Woods >>前往: |cRXP_PICK_永歌森林|r
step
    #xprate <1.5
    #label Antheol2
    .goto Eversong Woods,55.70,54.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Antheol|r交谈
    .turnin 9066 >>交任务: |cRXP_FRIENDLY_导师的训诫|r
    .accept 9402 >>接任务: |cRXP_LOOT_捞瓶子|r << Mage
step
    #xprate >1.4999
    #label Antheol2
    .goto Eversong Woods,55.70,54.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Antheol|r交谈
    .turnin 9064 >>交任务: |cRXP_FRIENDLY_学徒的欺瞒|r << !Undead !BloodElf/!Priest !Undead
    .turnin 9066 >>交任务: |cRXP_FRIENDLY_导师的训诫|r << BloodElf Priest/Undead
    .accept 9402 >>接任务: |cRXP_LOOT_捞瓶子|r << Mage
    .target Instructor Antheol
step << Mage
    .goto Eversong Woods,54.69,56.23
    >>在水下拾取|cRXP_PICK_碧蓝瓶|r
    .complete 9402,1 --Azure Phial (1)
step << Mage
    .goto Eversong Woods,55.70,54.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Antheol|r交谈
    .turnin 9402 >>交任务: |cRXP_FRIENDLY_捞瓶子|r
    .accept 9403 >>接任务: |cRXP_LOOT_最纯净的水|r
    .target Instructor Antheol
step << Warrior
    #completewith next
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,62.89,31.26,30,0
    .goto Silvermoon City,51.83,17.91,30,0
    .goto Silvermoon City,49.45,15.00
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
step << Warrior
    .goto Tirisfal Glades,61.75,64.96
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .isQuestAvailable 834
step << Warrior
    #completewith WarrTraining2
    .goto Tirisfal Glades,61.58,52.99,8,0
    .goto Tirisfal Glades,61.74,52.77,8 >>进入旅店
step << Warrior
    .goto Tirisfal Glades,61.85,52.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 2687 >>训练你的职业法术
    .target Austil de Mon
    .xp <10,1
    .xp >12,1
step << Warrior
    #label WarrTraining2
    .goto Tirisfal Glades,61.85,52.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 5242 >>训练你的职业法术
    .target Austil de Mon
    .xp <12,1
step << Warrior
    #completewith Winds
    .abandon 1818 >>放弃与迪林格尔交谈
step << Warrior
    #completewith Winds
    .goto Tirisfal Glades,61.06,58.86,12,0
    .goto Tirisfal Glades,61.51,59.01,10,0
    .goto Tirisfal Glades,61.27,59.22,8,0
    .goto Tirisfal Glades,61.13,58.84,8,0
    .goto Tirisfal Glades,61.38,58.71,8,0
    .goto Tirisfal Glades,61.34,59.17,8,0
    .goto Tirisfal Glades,60.51,58.69,-1
    .goto Tirisfal Glades,60.94,46.35,-1
    >>登上齐柏林飞艇塔
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Warrior
    #label Winds
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .accept 834 >>接任务: |cRXP_LOOT_沙漠之风|r
    .target Rezlak
step << Warrior
    .goto Durotar,49.10,22.59,20,0
    .goto Durotar,49.71,21.89,20,0
    .goto Durotar,50.10,24.51,20,0
    .goto Durotar,50.85,25.92,20,0
    .goto Durotar,49.86,26.87,20,0
    .goto Durotar,50.51,31.82,30,0
    .goto Durotar,49.63,32.12,20,0
    .goto Durotar,49.42,33.74,20,0
    .goto Durotar,48.09,34.38,20,0
    .goto Durotar,47.91,33.08,20,0
    .goto Durotar,47.18,29.67,20,0
    .goto Durotar,49.10,22.59,20,0
    .goto Durotar,49.71,21.89,20,0
    .goto Durotar,50.10,24.51,20,0
    .goto Durotar,50.85,25.92,20,0
    .goto Durotar,49.86,26.87,20,0
    .goto Durotar,50.51,31.82,30,0
    .goto Durotar,49.63,32.12,20,0
    .goto Durotar,49.42,33.74,20,0
    .goto Durotar,48.09,34.38,20,0
    .goto Durotar,47.91,33.08,20,0
    .goto Durotar,47.18,29.67,20,0
    >>搜刮地面上的|cRXP_PICK_补给袋|r
    .complete 834,1 --Sack of Supplies (5)
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Horde !Warrior !Shaman
#name 10-12 永歌森林
#displayname 10-12 永歌森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 12-16 幽魂之地
#version 1
#group RestedXP 部落 1-30

step << Orc Hunter/Troll Hunter
    #completewith next
    .goto Silvermoon City,62.89,31.20,20,0
    .goto Silvermoon City,74.82,36.86,20,0
    .goto Silvermoon City,91.23,38.75,20 >>前往|cRXP_FRIENDLY_伊蕾达|r
step << Orc Hunter/Troll Hunter
    .goto Silvermoon City,91.23,38.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊蕾达|r交谈
    .train 202 >>学习两小时剑术
    .target Ileda
    .money <0.1000
step << Orc/Troll/Tauren
    #completewith next
    .goto Silvermoon City,62.89,31.20,20,0 << !Orc/!Hunter !Troll/!Hunter
    .goto Silvermoon City,75.63,58.34,20,0 << !Orc/!Hunter !Troll/!Hunter
    .goto Silvermoon City,73.22,59.91,20,0 << !Orc/!Hunter !Troll/!Hunter
    .goto Eversong Woods,56.43,49.91
    .zone Eversong Woods >>前往: |cRXP_PICK_永歌森林|r
step << Orc/Troll/Tauren
    .goto Eversong Woods,54.37,50.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛拉米|r交谈
    .fp Silvermoon >>获取银月城飞行路径
    .target Skymistress Gloaming
step << Troll Mage
    .goto Eversong Woods,55.70,54.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Antheol|r交谈
    .accept 9403 >>接任务: |cRXP_LOOT_最纯净的水|r
    .target Instructor Antheol
step << Troll Mage
    .goto Eversong Woods,54.69,56.23
    >>在水下拾取|cRXP_PICK_碧蓝瓶|r
    .complete 9402,1 --Azure Phial (1)
step << Troll Mage
    .goto Eversong Woods,55.70,54.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Antheol|r交谈
    .turnin 9402 >>交任务: |cRXP_FRIENDLY_捞瓶子|r
    .accept 9403 >>接任务: |cRXP_LOOT_最纯净的水|r
    .target Instructor Antheol
step << Undead/BloodElf
    #completewith next
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击杀后搜刮他们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
step << Undead/BloodElf
    .goto Eversong Woods,60.41,62.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨蕾妮·晨光|r交谈
    >>|cRXP_BUY_从她那里购买|r |T133974:0|t[魔泉美味] |r
    .collect 22776,1,9067,1 --Collect Springpaw Appetizers
    .target Zalene Firstlight
step
    .goto Eversong Woods,60.32,62.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawnrunner|r交谈
    .turnin 9359 >>交任务: |cRXP_FRIENDLY_远行者居所|r << !Tauren !Troll !Orc
    .accept 8476 >>接任务: |cRXP_LOOT_阿曼尼的进犯|r
    .accept 9484 >>接任务: |cRXP_LOOT_驯服野兽|r << BloodElf Hunter
    .target Lieutenant Dawnrunner
step << !Troll Hunter
    .goto Eversong Woods,60.32,62.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_派尔拉林|r交谈
    >>|cRXP_BUY_从他那里购买一把|r|T135489:0|t[多层弯弓]|cRXP_BUY_和|r|T132382:0|t[锋利的箭]|r
    .collect 2507,1,9144,1 --Laminated Recurve Bow (1)
    .collect 2515,2000,9144,1 --Sharp Arrow (2000)
    .target Paelarin
    .money <0.2252 << Orc/Troll
    .money <0.2144 << BloodElf
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.5
--VV Paelarin doesn't talk to Trolls
step << !Troll Hunter
    .goto Eversong Woods,60.32,62.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_派尔拉林|r交谈
    >>|cRXP_BUY_从他那里购买|r |T132382:0|t[锋利的箭] |r
    .collect 2515,2000,9252,1 << Hunter --Sharp Arrow (2000)
    .target Paelarin
    .money <0.0500 << Orc/Troll
    .money <0.0480 << BloodElf
step << !Troll Hunter
    #completewith Otembe
    +装备 |T135489:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.5
step
    .goto Eversong Woods,59.52,62.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arathel|r交谈
    .train 2018 >>学习 |T136241:0|t[锻造]. 稍后你会获得 |T136248:0|t[采矿], 这将让你制作 |T135248:0|t[锐化石](使武器伤害+2, 持续1小时) << Paladin/BloodElf Rogue/Undead Rogue
    >>|cRXP_WARN_你可以跳过|r|T136241:0|t[锻造]|cRXP_WARN_(如你愿意)|r << Paladin/BloodElf Rogue/Undead Rogue
    .accept 8477 >>接任务: |cRXP_LOOT_制矛师之锤|r
    .target Arathel Sunforge
step << BloodElf Hunter
    .goto Eversong Woods,61.65,65.46,40,0
    .goto Eversong Woods,64.19,68.21,40,0
    .goto Eversong Woods,63.75,66.40,40,0
    .goto Eversong Woods,64.06,61.14,40,0
    .goto Eversong Woods,63.90,60.17,40,0
    .goto Eversong Woods,62.62,60.38,40,0
    .goto Eversong Woods,60.48,58.86,40,0
    .goto Eversong Woods,61.65,65.46,40,0
    .goto Eversong Woods,64.19,68.21,40,0
    .goto Eversong Woods,63.75,66.40,40,0
    .goto Eversong Woods,64.06,61.14,40,0
    .goto Eversong Woods,63.90,60.17,40,0
    .goto Eversong Woods,62.62,60.38,40,0
    .goto Eversong Woods,60.48,58.86
    >>从最远距离使用 |T132164:0|t[驯兽棒] 对准 |cRXP_ENEMY_疯狂的龙鹰|r
    >>|cRXP_WARN_不要杀死任何|r|cRXP_ENEMY_老魔泉豹|r
    .complete 9484,1 --Tame a Crazed Dragonhawk
    .mob Crazed Dragonhawk
    .use 23702
step << BloodElf Hunter
    .goto Eversong Woods,60.32,62.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawnrunner|r交谈
    .turnin 9484 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 9486 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Lieutenant Dawnrunner
step << BloodElf Hunter
    .goto Eversong Woods,60.08,66.06,40,0
    .goto Eversong Woods,63.21,64.35,40,0
    .goto Eversong Woods,64.00,63.93,40,0
    .goto Eversong Woods,64.54,61.08,40,0
    .goto Eversong Woods,62.92,61.12,40,0
    .goto Eversong Woods,61.72,58.56,40,0
    .goto Eversong Woods,63.25,58.12,40,0
    .goto Eversong Woods,59.62,57.24,40,0
    .goto Eversong Woods,60.08,66.06,40,0
    .goto Eversong Woods,63.21,64.35,40,0
    .goto Eversong Woods,64.00,63.93,40,0
    .goto Eversong Woods,64.54,61.08,40,0
    .goto Eversong Woods,62.92,61.12,40,0
    .goto Eversong Woods,61.72,58.56,40,0
    .goto Eversong Woods,63.25,58.12,40,0
    .goto Eversong Woods,59.62,57.24
    >>从最远距离使用 |T132164:0|t[驯兽棒] 对准|cRXP_ENEMY_老魔泉豹|r
    .complete 9486,1 --Tame an Elder Springpaw
    .mob Elder Springpaw
    .use 23702
step << BloodElf Hunter
    .goto Eversong Woods,60.32,62.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawnrunner|r交谈
    .turnin 9486 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 9485 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Lieutenant Dawnrunner
step << Undead/BloodElf
    #completewith Otembe
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击杀后搜刮他们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
step << Mage
    .goto Eversong Woods,64.16,72.62
    >>在瀑布下使用|T134776:0|t[碧蓝瓶]
    .complete 9403,1 --Filled Azure Phial (1)
    .use 23566
step << Orc Hunter wotlk / Troll Hunter wotlk
    .goto Eversong Woods,68.15,68.11,40,0
    .goto Eversong Woods,65.72,69.53,40,0
    .goto Eversong Woods,60.08,66.06,40,0
    .goto Eversong Woods,63.21,64.35,40,0
    .goto Eversong Woods,64.00,63.93,40,0
    .goto Eversong Woods,64.54,61.08,40,0
    .goto Eversong Woods,62.92,61.12,40,0
    .goto Eversong Woods,61.72,58.56,40,0
    .goto Eversong Woods,63.25,58.12,40,0
    .goto Eversong Woods,59.62,57.24
    .tame 15652 >>驯服|cRXP_ENEMY_老魔泉豹|r
    .mob Elder Springpaw
step
    #completewith Marosh
    >>击杀|cRXP_ENEMY_阿曼尼狂战士|r 和|cRXP_ENEMY_阿曼尼掷斧者|r
    >>|cRXP_WARN_要注意|r|cRXP_ENEMY_阿曼尼狂战士|r|cRXP_WARN_cast|r|T136224:0|t[狂怒] |cRXP_WARN_(生命值较低时伤害与攻击速度提升)|r
    .complete 8476,1 --Kill Amani Berserker (x5)
    .complete 8476,2 --Kill Amani Axe Thrower (x5)
    .mob Amani Berserker
    .mob Amani Axe Thrower
step
    .goto Eversong Woods,70.10,72.28
    >>击杀|cRXP_ENEMY_制矛师奥特姆比|r. 抢夺他的|cRXP_LOOT_重型钉锤|r
    >>|cRXP_ENEMY_制矛师奥特姆比|r|cRXP_WARN_有100%的几率掉落白色或绿色装备|r << Paladin/Rogue/Warrior
    .complete 8477,1 --Collect Otembe's Hammer (x1)
    .mob Spearcrafter Otembe
    .itemStat 16,QUALITY,<7 << Paladin/Rogue/Warrior
step
    #label Otembe
    .goto Eversong Woods,70.10,72.28
    >>击杀|cRXP_ENEMY_制矛师奥特姆比|r. 抢夺他的|cRXP_LOOT_重型钉锤|r
    .complete 8477,1 --Collect Otembe's Hammer (x1)
    .mob Spearcrafter Otembe
step
    .goto Eversong Woods,70.53,72.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与笼中的|cRXP_FRIENDLY_Ven'jashi|r交谈
    .accept 8479 >>接任务: |cRXP_LOOT_祖玛洛什|r
    .target Ven'jashi
step
    #completewith next
    .goto Eversong Woods,62.57,79.72,15,0
    .goto Eversong Woods,62.25,80.08,8,0
    .goto Eversong Woods,61.83,79.89,8,0
    .goto Eversong Woods,61.90,79.63,8 >>爬上小屋, 朝|cRXP_ENEMY_祖玛洛什|r前进
step
    .goto Eversong Woods,62.51,79.68
    >>击杀|cRXP_ENEMY_祖玛洛什|r. 搜刮其|cRXP_LOOT_头|r和|T134946:0|t[|cRXP_LOOT_阿曼尼入侵计划|r ]
    >>|cRXP_WARN_使用 |T134946:0|t[|cRXP_LOOT_阿曼尼入侵计划|r] 开始任务|r
    >>|cRXP_ENEMY_酋长祖玛洛什|r|cRXP_WARN_有100%的几率掉落白装或绿装|r << Paladin/Rogue/Warrior
    .complete 8479,1 --Collect Chieftain Zul'Marosh's Head (x1)
    .collect 23249,1,9360,1 --Collect Amani Invasion Plans (x1)
    .accept 9360 >>接任务: |cRXP_LOOT_阿曼尼的入侵|r
    .mob Chieftain Zul'Marosh
    .use 23249
    .itemStat 16,QUALITY,<7
step
    .goto Eversong Woods,62.51,79.68
    >>击杀 |cRXP_ENEMY_祖玛洛什|r. 击败他后拾取其 |cRXP_LOOT_头颅|r 以及 |T134946:0|t[|cRXP_LOOT_阿曼尼入侵计划|r ]
    >>|cRXP_WARN_使用 |T134946:0|t[|cRXP_LOOT_阿曼尼入侵计划|r] 开始任务|r
    .complete 8479,1 --Collect Chieftain Zul'Marosh's Head (x1)
    .collect 23249,1,9360,1 --Collect Amani Invasion Plans (x1)
    .accept 9360 >>接任务: |cRXP_LOOT_阿曼尼的入侵|r
    .mob Chieftain Zul'Marosh
    .use 23249
step
    .goto Eversong Woods,70.53,72.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与笼中的|cRXP_FRIENDLY_Ven'jashi|r交谈
    >>|cRXP_WARN_如果你想, 可以击杀|cRXP_ENEMY_制矛师奥特姆比|r. 他有100%的几率掉落一件白色或绿色品质的物品|r << Paladin/Rogue/Warrior
    .turnin 8479 >>交任务: |cRXP_FRIENDLY_祖玛洛什|r
    .mob Spearcrafter Otembe
    .target Ven'jashi
    .itemStat 16,QUALITY,<7
step
    #label Marosh
    .goto Eversong Woods,70.53,72.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与笼中的|cRXP_FRIENDLY_Ven'jashi|r交谈
    .turnin 8479 >>交任务: |cRXP_FRIENDLY_祖玛洛什|r
    .target Ven'jashi
step
    .goto Eversong Woods,70.90,71.63,40,0
    .goto Eversong Woods,68.12,70.88,40,0
    .goto Eversong Woods,68.54,73.15,40,0
    .goto Eversong Woods,69.23,74.08,40,0
    .goto Eversong Woods,69.39,76.51,40,0
    .goto Eversong Woods,71.65,76.95,40,0
    .goto Eversong Woods,71.45,78.94,40,0
    .goto Eversong Woods,70.49,81.45,40,0
    .goto Eversong Woods,70.43,82.60,40,0
    .goto Eversong Woods,68.82,83.40,40,0
    .goto Eversong Woods,68.89,80.37,40,0
    .goto Eversong Woods,70.90,71.63,40,0
    .goto Eversong Woods,68.12,70.88,40,0
    .goto Eversong Woods,68.54,73.15
    >>击杀|cRXP_ENEMY_阿曼尼狂战士|r 和|cRXP_ENEMY_阿曼尼掷斧者|r
    >>|cRXP_WARN_要注意|r|cRXP_ENEMY_阿曼尼狂战士|r|cRXP_WARN_cast|r|T136224:0|t[狂怒] |cRXP_WARN_(生命值较低时伤害与攻击速度提升)|r
    .complete 8476,1 --Kill Amani Berserker (x5)
    .complete 8476,2 --Kill Amani Axe Thrower (x5)
    .mob Amani Berserker
    .mob Amani Axe Thrower
step << skip
    .use 30105
    .goto Ghostlands,45.6,21.1
    .complete 9485,1 --Tame a Mistbat
--VV BloodElf Hunter
step << skip
    .goto Ghostlands,46.3,28.8
    .accept 9327 >>接任务: |cRXP_LOOT_被遗忘者|r
    --VV BloodElf Hunter
step << skip
    .goto Ghostlands,44.774,32.450
    .turnin 9327 >>交任务: |cRXP_FRIENDLY_被遗忘者|r
    .accept 9758 >>接任务: |cRXP_LOOT_返回奥术师范迪瑞尔身边|r
    --VV BloodElf Hunter
step << skip
    .goto Ghostlands,47.3,28.9
    .accept 9130 >>接任务: |cRXP_LOOT_银月城的货物|r
    --VV BloodElf Hunter
step << skip
    .goto Ghostlands,47.0,28.5
    .accept 9152 >>接任务: |cRXP_LOOT_托博尔的补给品|r
    --VV BloodElf Hunter
step << skip
    .goto Ghostlands,46.3,28.4
    .turnin 9758 >>交任务: |cRXP_FRIENDLY_返回奥术师范迪瑞尔身边|r
    --VV BloodElf Hunter
step << skip
    .goto Ghostlands,46.3,28.6
    .accept 9138 >>接任务: |cRXP_LOOT_日冕村|r
    --VV BloodElf Hunter
step << skip
    #completewith next
    .goto Ghostlands,45.5,30.5
    .fp Tranquillien >>获取塔奎林的飞行点
    --VV BloodElf Hunter
step << skip
    >>不要飞往银月城
    .goto Ghostlands,45.5,30.6
    .turnin 9130 >>交任务: |cRXP_FRIENDLY_银月城的货物|r
    .accept 9133 >>接任务: |cRXP_LOOT_飞往银月城|r
    --VV BloodElf Hunter
step << skip
    #completewith next
    .goto Eversong Woods,44.0,70.7
    .hs >>传送至晴风村
    --VV BloodElf Hunter
step << skip
    .goto Eversong Woods,44.0,70.7
    .turnin 9255 >>交任务: |cRXP_FRIENDLY_研究笔记|r
    .accept 9144 >>接任务: |cRXP_LOOT_迷失在幽魂之地|r
    --VV BloodElf Hunter
step << skip
    .goto Eversong Woods,44.7,69.7
    .turnin 8491 >>交任务: |cRXP_FRIENDLY_收集豹皮|r
    --VV BloodElf Hunter
step << skip
    .goto Eversong Woods,46.928,71.789
    .turnin 9252 >>交任务: |cRXP_FRIENDLY_保卫晴风村|r
    --VV BloodElf Hunter
step << skip
    .goto Eversong Woods,46.9,71.6
    .accept 9253 >>接任务: |cRXP_LOOT_符文看守者德尔雅|r
    --VV BloodElf Hunter
step << skip
    .use 22473 >>在你的背包中使用惩戒之杖对准梅勒多尔
.goto Eversong Woods,44.9,61.0
    .complete 9066,1 --Apprentice Meledor Disciplined
    --VV BloodElf Hunter
step << skip
    .use 22473 >>在拉伦身上使用背包中的惩戒之杖
.goto Eversong Woods,45.2,57.0
    .complete 9066,2 --Apprentice Ralen Disciplined
    --VV BloodElf Hunter
step << skip
    .goto Eversong Woods,48.2,46.0
    .turnin 8482 >>交任务: |cRXP_FRIENDLY_秘密文件|r
    .accept 8483 >>接任务: |cRXP_LOOT_矮人间谍|r
    --VV BloodElf Hunter
step << skip
    .goto Eversong Woods,48.3,46.1
    .trainer >>训练你的职业法术
step << skip
    .goto Eversong Woods,44.8,53.1
    >>与勘测员安威瓦尔德交谈, 等待剧情事件结束, 随后击杀并搜刮他的物品
    .complete 8483,1 --Collect Prospector Anvilward's Head (x1)
    .skipgossip
    .timer 28,Prospector Anvilward RP
step << skip
    .goto Eversong Woods,48.2,46.0
.target Aeldon Sunbrand
>>与|cRXP_FRIENDLY_艾尔杜·炙痕|r交谈
    .turnin 8483 >>交任务: |cRXP_FRIENDLY_矮人间谍|r
step << skip
    .goto Eversong Woods,55.700,54.509
.target Instructor Antheol
>>与|cRXP_FRIENDLY_指导者安瑟隆|r交谈
    .turnin 9066 >>交任务: |cRXP_FRIENDLY_导师的训诫|r
step << Undead/BloodElf
    #completewith next
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击杀后搜刮他们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
step
    .goto Eversong Woods,60.32,62.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawnrunner|r交谈
    .turnin 8476 >>交任务: |cRXP_FRIENDLY_阿曼尼的进犯|r
    .turnin 9360 >>交任务: |cRXP_FRIENDLY_阿曼尼的入侵|r
    .accept 9363 >>接任务: |cRXP_LOOT_警告晴风村|r
    .turnin 9485 >>交任务: |cRXP_FRIENDLY_驯服野兽|r << BloodElf Hunter
    .accept 9673 >>接任务: |cRXP_LOOT_野兽训练|r << BloodElf Hunter
    .target Lieutenant Dawnrunner
step << Undead/BloodElf
    #completewith MagiApp
    +|cRXP_WARN_请记住不要出售你的|r|T133974:0|t[魔泉美味] |cRXP_WARN_和|r|T132798:0|t[日光陈酿] << Warlock
    +|cRXP_WARN_记得不要出售你的|r|T133974:0|t[魔泉美味] << !Warlock
step << !Troll Hunter
    .goto Eversong Woods,60.32,62.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_派尔拉林|r交谈
    >>|cRXP_BUY_购买|r|T135489:0|t[多层弯弓]|cRXP_BUY_从|r|cRXP_FRIENDLY_派尔拉林|r
    .collect 2507,1,9144,1 --Laminated Recurve Bow (1)
    .target Paelarin
    .money <0.1752 << Orc/Troll
    .money <0.1664 << BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.5
step << !Troll Hunter
    #completewith HunterTrain
    +装备 |T135489:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.5
step
    .goto Eversong Woods,59.52,62.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arathel|r交谈
    .turnin 8477 >>交任务: |cRXP_FRIENDLY_制矛师之锤|r
    .target Arathel Sunforge
step << Rogue
    +装备 |T135274:0|t[游侠匕首]
    .use 22963
    .itemcount 22963,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.3
step
    #completewith next
    .goto Eversong Woods,59.53,62.16,12,0
    .goto Eversong Woods,59.82,61.91,12,0
    .goto Eversong Woods,59.82,61.91,10 >>沿着坡道向上前往|cRXP_FRIENDLY_Duskwither|r
step
    #label MagiApp
    .goto Eversong Woods,60.31,61.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Duskwither|r交谈
    .accept 8888 >>接任务: |cRXP_LOOT_魔导师的学徒|r
    .target Magister Duskwither
step << BloodElf/Undead
    #completewith next
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r和|cRXP_ENEMY_老魔泉豹|r, 掠夺它们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
    .mob Elder Springpaw
step
    .goto Eversong Woods,67.80,56.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Loralthalis|r交谈
    .turnin 8888 >>交任务: |cRXP_FRIENDLY_魔导师的学徒|r
    .accept 8889 >>接任务: |cRXP_LOOT_关闭高塔|r
    .accept 9394 >>接任务: |cRXP_LOOT_维林森去哪了？|r
    .target Apprentice Loralthalis
step
    .goto Eversong Woods,68.71,46.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_看守者维林森|r交谈
    .turnin 9394 >>交任务: |cRXP_FRIENDLY_维林森去哪了？|r
    .accept 8894 >>接任务: |cRXP_LOOT_清理广场|r
    .target Groundskeeper Wyllithen
step
#loop
	.line Eversong Woods,69.15,50.56,70.02,50.62,70.58,48.16,69.97,46.28,69.50,44.69,68.29,43.31,67.61,45.28,67.13,48.48,69.01,48.22,69.15,50.56
	.goto Eversong Woods,69.15,50.56,40,0
	.goto Eversong Woods,70.02,50.62,40,0
	.goto Eversong Woods,70.58,48.16,40,0
	.goto Eversong Woods,69.97,46.28,40,0
	.goto Eversong Woods,69.50,44.69,40,0
	.goto Eversong Woods,68.29,43.31,40,0
	.goto Eversong Woods,67.61,45.28,40,0
	.goto Eversong Woods,67.13,48.48,40,0
	.goto Eversong Woods,69.01,48.22,40,0
	.goto Eversong Woods,69.15,50.56,40,0
    >>击杀|cRXP_ENEMY_法力蛇|r和|cRXP_ENEMY_以太魔|r
    .complete 8894,1 --Kill Mana Serpent (x6)
    .complete 8894,2 --Kill Ether Fiend (x6)
    .mob Mana Serpent
    .mob Ether Fiend
step
    .goto Eversong Woods,68.71,46.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_看守者维林森|r交谈
    .turnin 8894 >>交任务: |cRXP_FRIENDLY_清理广场|r
    .target Groundskeeper Wyllithen
step
    #completewith next
    .goto Eversong Woods,68.95,51.95
    .cast 26566 >>点击楼梯顶部的传送宝珠
step
    .goto Eversong Woods,68.24,51.56,15,0
    .goto Eversong Woods,68.57,51.61,15,0
    .goto Eversong Woods,68.96,51.95
    >>点击|cRXP_PICK_Floating Green Crystal|r
    .complete 8889,1 --First Power Source Deactivated (x1)
step
    #completewith next
    .goto Eversong Woods,69.16,52.01,8,0
    .goto Eversong Woods,69.09,51.74,8,0
    .goto Eversong Woods,68.93,51.69,8 >>上楼
step
    #sticky
    #label Journalt
    .goto Eversong Woods,69.24,52.11,0,0
    >>点击桌上的|cRXP_PICK_Journal|r
    .accept 8891 >>接任务: |cRXP_LOOT_被放弃的研究|r
step
    >>点击|cRXP_PICK_Floating Green Crystal|r
    .complete 8889,2 --Second Power Source Deactivated (x1)
    .goto Eversong Woods,68.80,52.00,8,0
    .goto Eversong Woods,68.96,51.94
step
    #requires Journalt
    #completewith next
    .goto Eversong Woods,69.57,52.12,12,0
    .goto Eversong Woods,69.82,52.50,12,0
    .goto Eversong Woods,69.76,52.98,12,0
    .goto Eversong Woods,69.64,53.35,15 >>上楼
step
    #requires Journalt
    .goto Eversong Woods,69.64,53.35
    >>点击|cRXP_PICK_Floating Green Crystal|r
    >>|cRXP_WARN_请勿点击传送宝珠|r
    .complete 8889,3 --Third Power Source Deactivated (x1)
step
    .goto Eversong Woods,69.61,53.47
    .cast 26572 >>点击传送宝珠以传送到下方
    .isOnQuest 8889
step << !BloodElf/!Warlock
#loop
	.line Eversong Woods,69.15,50.56,70.02,50.62,70.58,48.16,69.97,46.28,69.50,44.69,68.29,43.31,67.61,45.28,67.13,48.48,69.01,48.22,69.15,50.56
	.goto Eversong Woods,69.15,50.56,40,0
	.goto Eversong Woods,70.02,50.62,40,0
	.goto Eversong Woods,70.58,48.16,40,0
	.goto Eversong Woods,69.97,46.28,40,0
	.goto Eversong Woods,69.50,44.69,40,0
	.goto Eversong Woods,68.29,43.31,40,0
	.goto Eversong Woods,67.61,45.28,40,0
	.goto Eversong Woods,67.13,48.48,40,0
	.goto Eversong Woods,69.01,48.22,40,0
	.goto Eversong Woods,69.15,50.56,40,0
    .xp 11+6375 >>升级至6375/8700经验值
step
    .goto Eversong Woods,67.80,56.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Loralthalis|r交谈
    .turnin 8889 >>交任务: |cRXP_FRIENDLY_关闭高塔|r
    .accept 8890 >>接任务: |cRXP_LOOT_塔中的消息|r
    .target Apprentice Loralthalis
step << BloodElf/Undead
    .goto Eversong Woods,66.28,57.66,40,0
    .goto Eversong Woods,64.60,61.15,40,0
    .goto Eversong Woods,63.72,64.26,40,0
    .goto Eversong Woods,62.22,65.24,40,0
    .goto Eversong Woods,60.20,65.87,40,0
    .goto Eversong Woods,68.15,68.11,40,0
    .goto Eversong Woods,65.72,69.53,40,0
    .goto Eversong Woods,60.08,66.06,40,0
    .goto Eversong Woods,63.21,64.35,40,0
    .goto Eversong Woods,64.00,63.93,40,0
    .goto Eversong Woods,64.54,61.08,40,0
    .goto Eversong Woods,62.92,61.12,40,0
    .goto Eversong Woods,61.72,58.56,40,0
    .goto Eversong Woods,63.25,58.12,40,0
    .goto Eversong Woods,59.62,57.24
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r和|cRXP_ENEMY_老魔泉豹|r, 掠夺它们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
    .mob Elder Springpaw
step << Undead/BloodElf
    #completewith Spire
    +|cRXP_WARN_请记住不要出售你的|r|T133974:0|t[魔泉美味] |cRXP_WARN_和|r|T132798:0|t[日光陈酿] << Warlock
    +|cRXP_WARN_记得不要出售你的|r|T133974:0|t[魔泉美味] << !Warlock
step << !Troll Hunter
    .goto Eversong Woods,60.32,62.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_派尔拉林|r交谈
    >>|cRXP_BUY_购买|r|T135489:0|t[多层弯弓]|cRXP_BUY_从|r|cRXP_FRIENDLY_派尔拉林|r
    .collect 2507,1,9144,1 --Laminated Recurve Bow (1)
    .target Paelarin
    .money <0.1752 << Orc/Troll
    .money <0.1664 << BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.5
step << !Troll Hunter
    #completewith HunterTrain
    +装备 |T135489:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.5
step
    #completewith next
    .goto Eversong Woods,59.53,62.16,12,0
    .goto Eversong Woods,59.82,61.91,12,0
    .goto Eversong Woods,59.82,61.91,10 >>沿着坡道向上前往|cRXP_FRIENDLY_Duskwither|r
step
    #label Spire
    .goto Eversong Woods,60.31,61.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Duskwither|r交谈
    .turnin 8890 >>交任务: |cRXP_FRIENDLY_塔中的消息|r
    .turnin 8891 >>交任务: |cRXP_FRIENDLY_被放弃的研究|r
    .target Magister Duskwither
step << Mage
    .goto Eversong Woods,55.70,54.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Antheol|r交谈
    .turnin 9403 >>交任务: |cRXP_FRIENDLY_最纯净的水|r
    .accept 9404 >>接任务: |cRXP_LOOT_活动的树木|r
    .target Instructor Antheol
step << !Warlock
    #completewith SMtraining01
    .goto Eversong Woods,56.51,49.61,25,0
    .goto Silvermoon City,73.39,59.65
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
step << Druid
    .goto Silvermoon City,72.53,56.24,10,0
    .goto Silvermoon City,71.55,55.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈雷尼|r交谈
    .train 8936 >>训练你的职业法术
    .target Harene Plainwalker
	.xp <12,1
	.xp >14,1
step << Druid
    #label SMtraining01
    .goto Silvermoon City,72.53,56.24,10,0
    .goto Silvermoon City,71.55,55.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈雷尼|r交谈
    .train 782 >>训练你的职业法术
    .target Harene Plainwalker
	.xp <14,1
step << !Orc !Troll !Tauren !Warlock !Rogue
    #completewith next
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,78.28,59.34,8,0
    .goto Silvermoon City,78.36,60.14,8 >>进入旅店
step << !Orc !Troll !Tauren !Warlock !Rogue
    .goto Silvermoon City,79.50,58.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Suntouched|r交谈
    >>|cRXP_BUY_从他那里购买|r |T132798:0|t[日光陈酿] |r
    .collect 22775,1,9067,1 --Suntouched Special Reserve (1)
    .target Vinemaster Suntouched
step << !BloodElf Hunter
    #completewith next
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,78.28,59.34,8,0
    .goto Silvermoon City,78.36,60.14,8 >>进入酒馆. 从另一侧出去
step << BloodElf Hunter
    #completewith next
    .goto Silvermoon City,80.90,57.53,8,0
    .goto Silvermoon City,82.04,58.31,8 >>从旅店另一侧离开
step << Priest/Mage
    #completewith SMtraining01
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,62.89,31.26,30,0
    .goto Silvermoon City,57.45,24.46,15,0
    .goto Silvermoon City,55.31,24.96,15,0 << Priest
    .goto Silvermoon City,57.21,21.25,15,0 << Mage
    .goto Silvermoon City,55.38,26.76,12 >>前往|cRXP_FRIENDLY_洛塞兰|r << Priest
    .goto Silvermoon City,57.16,18.85,12 >>前往|cRXP_FRIENDLY_塞伊丹纳|r << Mage
    .cooldown item,6948,<0
step << Priest
    .goto Silvermoon City,55.38,26.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛塞兰|r交谈
    .train 1244 >>训练你的职业法术
    .target Lotheolan
    .cooldown item,6948,<0
	.xp <12,1
	.xp >14,1
step << Priest
    #label SMtraining01
    .goto Silvermoon City,55.38,26.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛塞兰|r交谈
    .train 8122 >>训练你的职业法术
    .target Lotheolan
    .cooldown item,6948,<0
	.xp <14,1
step << Mage
    .goto Silvermoon City,57.16,18.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞伊丹纳|r交谈
    .train 145 >>训练你的职业法术
    .cooldown item,6948,<0
	.xp <12,1
	.xp >14,1
step << Mage
    #label SMtraining01
    .goto Silvermoon City,57.16,18.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞伊丹纳|r交谈
    .train 1460 >>训练你的职业法术
    .cooldown item,6948,<0
	.xp <14,1
step << Rogue
    #completewith Zelanis
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,76.55,52.05,20,0
    .goto Silvermoon City,79.70,52.16,20 >>前往|cRXP_FRIENDLY_瑟兰尼斯|r
step << BloodElf Rogue
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    >>|cRXP_WARN_确保你已训练|r|T133644:0|t[扒窃]|cRXP_WARN_和|r|T132320:0|t[潜行]|cRXP_WARN_, 以便完成后续任务|r
    .accept 9532 >>接任务: |cRXP_LOOT_找到克尔图斯·暗叶|r
    .train 2983 >>训练你的职业法术
    .target Zelanis
    .train 2983,1
    .xp <10,1
    .xp >14,1
step << BloodElf Rogue
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    >>|cRXP_WARN_确保你已训练|r|T133644:0|t[扒窃]|cRXP_WARN_和|r|T132320:0|t[潜行]|cRXP_WARN_, 以便完成后续任务|r
    .accept 9532 >>接任务: |cRXP_LOOT_找到克尔图斯·暗叶|r
    .train 1758 >>训练你的职业法术
    .target Zelanis
    .train 1758,1
    .xp <14,1
step << BloodElf Rogue
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    >>|cRXP_WARN_确保你已训练|r|T133644:0|t[扒窃]|cRXP_WARN_和|r|T132320:0|t[潜行]|cRXP_WARN_, 以便完成后续任务|r
    .accept 9532 >>接任务: |cRXP_LOOT_找到克尔图斯·暗叶|r
    .target Zelanis
step << BloodElf Rogue
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    .train 921 >>学习 |T133644:0|t[扒窃] 技能, 用于后续任务
    .train 1784 >>学习 |T132320:0|t[潜行] 技能以完成后续任务
    .train 921,1
    .train 1784,1
    .target Zelanis
step << BloodElf Rogue
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    .train 1784 >>学习 |T132320:0|t[潜行] 技能以完成后续任务
    .target Zelanis
step << BloodElf Rogue
    #label Zelanis
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    .train 921 >>学习 |T133644:0|t[扒窃] 技能, 用于后续任务
    .target Zelanis
step << !BloodElf Rogue
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    .train 2983 >>训练你的职业法术
    .target Zelanis
    .xp <10,1
    .xp >14,1
step << !BloodElf Rogue
    #label Zelanis
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    .train 1758 >>训练你的职业法术
    .target Zelanis
    .xp <14,1
step << Rogue
    #completewith next
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,78.28,59.34,8,0
    .goto Silvermoon City,78.36,60.14,8 >>进入旅店
step << Rogue
    #label SMtraining01
    .goto Silvermoon City,79.50,58.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Suntouched|r交谈
    >>|cRXP_BUY_从他那里购买 a|r|T132798:0|t[日光陈酿]|r
    .collect 22775,1,9067,1 --Suntouched Special Reserve (1)
    .target Vinemaster Suntouched
step << Rogue
    #completewith next
    .goto Silvermoon City,80.90,57.53,8,0
    .goto Silvermoon City,82.04,58.31,8 >>从旅店另一侧离开
step << Paladin/Rogue
    #completewith next
    .goto Silvermoon City,83.52,48.68,30,0
    .goto Silvermoon City,83.50,43.40,20,0
    .goto Silvermoon City,78.90,43.25,20 >>前往|cRXP_FRIENDLY_比利尔|r
step << Paladin/Rogue
    .goto Silvermoon City,78.90,43.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利尔|r交谈
    .train 2580 >>训练 |T136248:0|t[采矿]. 这将使你能够从矿点中找到 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r, 用于制作 |T135248:0|t[磨刀石](+2 武器伤害, 持续 1 小时) << Paladin/BloodElf Rogue/Undead Rogue
    .target Belil
    .skill blacksmithing,1
step << Paladin/Rogue
    .goto Silvermoon City,78.41,42.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泽兰|r交谈
    >>|cRXP_BUY_购买一个|r|T134708:0|t[矿工锄]|cRXP_BUY_从|r|cRXP_FRIENDLY_泽兰|r
    .collect 2901,1,9144,1 --Mining Pick (1)
    .target Zelan
    .skill blacksmithing,1
    .skill mining,1
step << Paladin/Rogue
    #completewith Defending
    .cast 2580 >>使用 |T136025:0|t[寻找矿物]
step << Paladin
    #completewith FirstTrialB
    .goto Silvermoon City,89.02,37.03,12,0
    .goto Silvermoon City,89.26,35.20,15 >>前往|cRXP_FRIENDLY_Bloodvalor|r
step << Paladin
    .goto Silvermoon City,89.26,35.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bloodvalor|r交谈
    .turnin 9677 >>交任务: |cRXP_FRIENDLY_骑士领主布拉德瓦罗的召唤|r
    .accept 9678 >>接任务: |cRXP_LOOT_第一项试炼|r
    .target Knight-Lord Bloodvalor
    .isOnQuest 9677
step << Paladin
    #label FirstTrialB
    .goto Silvermoon City,89.26,35.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bloodvalor|r交谈
    .accept 9678 >>接任务: |cRXP_LOOT_第一项试炼|r
    .target Knight-Lord Bloodvalor
step << Paladin
    #label SMtraining01
    .goto Silvermoon City,91.19,36.94,-1
    .goto Silvermoon City,91.14,38.10,-1
	>>|cRXP_WARN_跳到下方的长凳上, 以免走上楼梯|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟里斯|r 或 |cRXP_FRIENDLY_欧塞兰|r 交谈
    .train 19834 >>训练你的职业法术
	.target Ithelis
	.target Osselan
	.xp <12,1
	.xp >14,1
step << Paladin
    .goto Silvermoon City,91.19,36.94,-1
    .goto Silvermoon City,91.14,38.10,-1
	>>|cRXP_WARN_跳到下方的长凳上, 以免走上楼梯|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟里斯|r 或 |cRXP_FRIENDLY_欧塞兰|r 交谈
    .train 647 >>训练你的职业法术
	.target Ithelis
	.target Osselan
	.xp <14,1
step << Hunter
    #completewith next
    .goto Silvermoon City,83.52,48.68,30,0
    .goto Silvermoon City,83.50,43.40,20,0
    .goto Silvermoon City,82.20,28.06,15 >>前往|cRXP_FRIENDLY_塞兰娜|r
step << Hunter
    .goto Silvermoon City,86.24,35.45
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞兰娜|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135346:0|t[强化弓]|r
    .collect 3026,1,9144,1 --Reinforced Bow (1)
    .target Celana
    .money <0.3621 << BloodElf
    .money <0.3812 << Troll/Orc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.7
step << Hunter
    #completewith SMtraining01
    .goto Silvermoon City,83.45,30.13,15,0
    .goto Silvermoon City,83.45,28.56,15,0
    .goto Silvermoon City,82.20,28.06,15 >>前往|cRXP_FRIENDLY_哈森尼斯|r << BloodElf
    .goto Silvermoon City,84.71,28.05,15 >>前往|cRXP_FRIENDLY_桑迪恩|r << !BloodElf
    .itemcount 3026,1
step << Hunter
    #completewith next
    .goto Silvermoon City,83.52,48.68,30,0
    .goto Silvermoon City,83.50,43.40,20,0
    .goto Silvermoon City,83.45,30.13,15,0
    .goto Silvermoon City,83.45,28.56,15,0
    .goto Silvermoon City,82.20,28.06,15 >>前往|cRXP_FRIENDLY_哈森尼斯|r << BloodElf
    .goto Silvermoon City,84.71,28.05,15 >>前往|cRXP_FRIENDLY_桑迪恩|r << !BloodElf
    .itemcount 3026,<1
step << BloodElf Hunter
    .goto Silvermoon City,82.20,28.06
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与哈森尼斯交谈|cRXP_FRIENDLY_Halthenis|r
    .turnin 9673 >>交任务: |cRXP_FRIENDLY_野兽训练|r
    .train 4187 >>训练你的宠物法术 << tbc
    .target Halthenis
step << Hunter
    #label SMtraining01
    .goto Silvermoon City,82.39,26.09 << BloodElf
    .goto Silvermoon City,84.71,28.05 << !BloodElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔纳交谈|cRXP_FRIENDLY_塔纳|r << BloodElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪恩|r交谈 << !BloodElf
    >>|cRXP_WARN_将|r|T132162:0|t[训练野兽]|cRXP_WARN_拖到你的动作栏上. 为你的宠物传授技能|r << BloodElf tbc
    .train 14281 >>训练你的职业法术
    .target Tana << BloodElf
    .target Zandine << !BloodElf
	.xp <12,1
step << Hunter
    .goto Silvermoon City,86.24,35.45
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞兰娜|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135346:0|t[强化弓]|r
    .collect 3026,1,9144,1 --Reinforced Bow (1)
    .target Celana
    .money <0.3621 << BloodElf
    .money <0.3812 << Troll/Orc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.7
step << Rogue
    #completewith Louis
    .goto Silvermoon City,62.89,31.26,30,0
    .goto Silvermoon City,51.83,17.91,30,0
    .goto Silvermoon City,49.45,15.00
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    #completewith Louis
    .goto Undercity,59.81,11.33,20,0
    .goto Undercity,66.08,18.24,30,0
    .goto Undercity,66.04,32.97,30,0
    .goto Undercity,65.97,44.08,30,0
    .goto Undercity,60.52,44.02,10,0
    .goto Undercity,60.07,47.70,10 >>乘坐升降梯前往幽暗城
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << !Undead Rogue
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fp Undercity >>获取幽暗城飞行路径
    .target Michael Garrett
    .itemcount 851,<2
    .money <0.4046 << Troll/Orc
    .money <0.3844 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << !Undead Rogue
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fp Undercity >>获取幽暗城飞行路径
    .target Michael Garrett
    .itemcount 851,<1
    .money <0.2023 << Troll/Orc
    .money <0.1922 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << !Undead Rogue
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fp Undercity >>获取幽暗城飞行路径
    .target Michael Garrett
    .itemcount 2027,<2
    .money <0.7632 << Troll/Orc
    .money <0.7250 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << !Undead Rogue
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fp Undercity >>获取幽暗城飞行路径
    .target Michael Garrett
    .itemcount 2027,<1
    .money <0.3816 << Troll/Orc
    .money <0.3625 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    .goto Undercity,61.15,40.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_路易斯|r交谈
    >>|cRXP_BUY_从他那里购买两把|r|T135346:0|t[弯刀]|r
    .collect 851,2,9144,1 --Cutlass (2)
    .target Louis Warren
    .itemcount 851,<2
    .money <0.4046 << Troll/Orc
    .money <0.3844 << Undead/BloodElf
    .xp >12,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    .goto Undercity,61.15,40.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_路易斯|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    .collect 851,1,9144,1 --Cutlass (1)
    .target Louis Warren
    .itemcount 851,<1
    .money <0.2023 << Troll/Orc
    .money <0.1922 << Undead/BloodElf
    .xp >12,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    .goto Undercity,61.15,40.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_路易斯|r交谈
    >>|cRXP_BUY_从他那里购买两把|r|T135343:0|t[战士阔剑]|r
    .collect 2027,2,9144,1 --Scimitar (2)
    .target Louis Warren
    .itemcount 2027,<2
    .money <0.7632 << Troll/Orc
    .money <0.7250 << Undead/BloodElf
    .xp <12,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    .goto Undercity,61.15,40.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_路易斯|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135343:0|t[战士阔剑]|r
    .collect 2027,1,9144,1 --Scimitar (1)
    .target Louis Warren
    .itemcount 2027,<1
    .money <0.3816 << Troll/Orc
    .money <0.3625 << Undead/BloodElf
    .xp <12,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    .goto Undercity,61.15,40.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_路易斯|r交谈
    >>|cRXP_BUY_从他那里购买两把|r|T135346:0|t[弯刀]|r
    .collect 851,2,9144,1 --Cutlass (2)
    .target Louis Warren
    .itemcount 2027,<2 --Scimitar (2)
    .money <0.4046 << Troll/Orc
    .money <0.3844 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    #label Louis
    .goto Undercity,61.15,40.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_路易斯|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    .collect 851,1,9144,1 --Cutlass (1)
    .target Louis Warren
    .itemcount 2027,<1 --Scimitar (1)
    .money <0.2023 << Troll/Orc
    .money <0.1922 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    +在你的主手和副手中装备 |T135346:0|t[弯刀]
    .use 851
    .itemcount 851,2
    .itemStat 16,QUALITY,<7
    .itemStat 17,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    +在主手装备 |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << skip
    +在你的副手装备 |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
--VV WIP
step << Rogue
    +在你的主手和副手中装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,2
    .itemStat 16,QUALITY,<7
    .itemStat 17,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << Rogue
    +在主手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << skip
    +在你的副手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
--VV WIP
step << Rogue
    #completewith Defending
    .hs >>传送至鹰翼广场
    .cooldown item,6948,>0
step << Rogue
    #completewith next
    .goto Undercity,60.07,47.70,10,0
    .goto Undercity,60.52,44.02,10,0
    .goto Undercity,65.97,44.08,30,0
    .goto Undercity,66.04,32.97,30,0
    .goto Undercity,66.08,18.24,30,0
    .goto Undercity,59.81,11.33,20 >>乘坐升降梯返回银月城
    .cooldown item,6948,<0
    .zoneskip Silvermoon City
    .zoneskip Eversong Woods
    .zoneskip Ghostlands
step << Rogue
    .goto Undercity,59,91,11.32,20,0
    .goto Undercity,54.67,11.25
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .cooldown item,6948,<0
    .zoneskip Eversong Woods
    .zoneskip Ghostlands
step << BloodElf Hunter skip
    .goto Silvermoon City,53.926,71.029
    >>建筑内部
    .turnin 9133 >>交任务: |cRXP_FRIENDLY_飞往银月城|r
    .accept 9134 >>接任务: |cRXP_LOOT_葛拉米|r
step << BloodElf Hunter skip
    .goto Eversong Woods,54.4,50.8
    >>前往: |cRXP_PICK_永歌森林|r
    .turnin 9134 >>交任务: |cRXP_FRIENDLY_葛拉米|r
    .accept 9135 >>接任务: |cRXP_LOOT_返回军需官雷米尔身边|r
step << BloodElf Hunter skip
    #completewith next
    .goto Eversong Woods,54.4,50.8
    .fly Tranquillien >>飞往塔奎林
step << BloodElf Hunter skip
    .goto Ghostlands,47.3,29.1
    .turnin 9135 >>交任务: |cRXP_FRIENDLY_返回军需官雷米尔身边|r
step << !Orc !Troll !Tauren !Rogue/!BloodElf Warlock
    #completewith SGrove
    .hs >>传送至鹰翼广场
    .cooldown item,6948,>0
step << !Warlock
    #completewith SGrove
    .goto Eversong Woods,56.43,49.91
    .zone Eversong Woods >>前往: |cRXP_PICK_永歌森林|r
    .cooldown item,6948,<0 << Undead/BloodElf
step << Mage/Priest/Undead Warlock
    #completewith next
    .goto Eversong Woods,47.79,47.35,8,0
    .goto Eversong Woods,47.86,47.76,8 >>进入旅店
    .cooldown item,6948,>0
	.xp <12,1
step << Mage/Priest/Undead Warlock
    #completewith FalconPMTrain2
    .goto Eversong Woods,48.27,47.05,8,0
    .goto Eversong Woods,48.06,47.11,8 >>上楼
    .cooldown item,6948,>0
	.xp <12,1
step << Priest
    .goto Eversong Woods,47.85,47.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_珀纳瑞斯|r交谈
    .train 1244 >>训练你的职业法术
    .target Ponaris
    .cooldown item,6948,>0
	.xp <12,1
    .xp >14,1
step << Priest
    #label FalconPMTrain2
    .goto Eversong Woods,47.85,47.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_珀纳瑞斯|r交谈
    .train 8122 >>训练你的职业法术
    .target Ponaris
    .cooldown item,6948,>0
	.xp <14,1
step << Mage
    .goto Eversong Woods,48.04,48.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_加琳黛尔|r交谈
    .train 7300 >>训练你的职业法术
    .target Garridel
    .cooldown item,6948,>0
	.xp <12,1
    .xp >14,1
step << Mage
    #label FalconPMTrain2
    .goto Eversong Woods,48.04,48.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_加琳黛尔|r交谈
    .train 145 >>训练你的职业法术
    .target Garridel
    .cooldown item,6948,>0
	.xp <14,1
step << Undead Warlock
    .goto Eversong Woods,48.23,47.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塞罗努斯|r谈话
    .train 705 >>训练你的职业法术
    .target Celoenus
    .cooldown item,6948,>0
    .xp <12,1
    .xp >14,1
step << Undead Warlock
    #completewith FalconPMTrain2
    .goto Eversong Woods,48.23,47.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塞罗努斯|r谈话
    .train 6222 >>训练你的职业法术
    .target Celoenus
    .cooldown item,6948,>0
    .xp <14,1
step << BloodElf/Undead
    .goto Eversong Woods,46.63,63.83,40,0
    .goto Eversong Woods,45.04,65.51,40,0
    .goto Eversong Woods,46.57,65.84,40,0
    .goto Eversong Woods,45.24,67.85,40,0
    .goto Eversong Woods,46.66,67.71,40,0
    .goto Eversong Woods,47.05,68.83,40,0
    .goto Eversong Woods,42.89,65.47,40,0
    .goto Eversong Woods,38.45,65.63
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击杀后搜刮他们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .target Springpaw Stalker
step << Undead/BloodElf
    #label Defending
    .goto Eversong Woods,46.93,71.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠萨蕾恩|r交谈
    .turnin 9252 >>交任务: |cRXP_FRIENDLY_保卫晴风村|r
    .accept 9253 >>接任务: |cRXP_LOOT_符文看守者德尔雅|r
    .target Ranger Sareyn
--VV BloodElf !Hunter
step << Undead/BloodElf
    .goto Eversong Woods,44.72,69.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velan|r交谈
    .turnin 8491 >>交任务: |cRXP_FRIENDLY_收集豹皮|r
    .target Velan Brightoak
--VV !Hunter
step << Undead/BloodElf
    .goto Eversong Woods,44.0,70.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈利斯|r交谈
    >>|cRXP_BUY_从他那里购买|r|T134285:0|t[一捆烟花]|r
    .collect 22777,1 --Bundle of Fireworks (1)
    .target Halis Dawnstrider
--VV !Hunter
step << Undead/BloodElf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_Landra|r和|cRXP_FRIENDLY_Degolien|r交谈, 以及与楼下的|cRXP_FRIENDLY_Ardeyn|r交谈
    .accept 9144 >>接任务: |cRXP_LOOT_迷失在幽魂之地|r
    .turnin 9255 >>交任务: |cRXP_FRIENDLY_研究笔记|r
    .goto Eversong Woods,44.03,70.76
    .turnin 9363 >>交任务: |cRXP_FRIENDLY_警告晴风村|r
    .goto Eversong Woods,43.61,70.66,10,0
    .goto Eversong Woods,43.34,70.82
    .accept 9258 >>接任务: |cRXP_LOOT_焦痕谷|r
    .goto Eversong Woods,43.58,71.20
    .target Magistrix Landra Dawnstrider
    .target Ranger Degolien
    .target Ardeyn Riverwind
    .isQuestAvailable 9144
    --VV !Hunter
    --VV 9144 and 9258 need to hide if in qlog
step << Undead/BloodElf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_Landra|r和|cRXP_FRIENDLY_Degolien|r交谈, 以及与楼下的|cRXP_FRIENDLY_Ardeyn|r交谈
    .turnin 9255 >>交任务: |cRXP_FRIENDLY_研究笔记|r
    .goto Eversong Woods,44.03,70.76
    .turnin 9363 >>交任务: |cRXP_FRIENDLY_警告晴风村|r
    .goto Eversong Woods,43.61,70.66,10,0
    .goto Eversong Woods,43.34,70.82
    .accept 9258 >>接任务: |cRXP_LOOT_焦痕谷|r
    .goto Eversong Woods,43.58,71.20
    .target Magistrix Landra Dawnstrider
    .target Ranger Degolien
    .target Ardeyn Riverwind
    --VV !Hunter
    --VV 9258 needs to hide if in qlog
step << !Undead !BloodElf
    #label Defending
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_Landra|r和|cRXP_FRIENDLY_Degolien|r交谈, 以及与楼下的|cRXP_FRIENDLY_Ardeyn|r交谈
    .accept 9144 >>接任务: |cRXP_LOOT_迷失在幽魂之地|r
    .goto Eversong Woods,44.03,70.76
    .turnin 9363 >>交任务: |cRXP_FRIENDLY_警告晴风村|r
    .goto Eversong Woods,43.61,70.66,10,0
    .goto Eversong Woods,43.34,70.82
    .accept 9258 >>接任务: |cRXP_LOOT_焦痕谷|r
    .goto Eversong Woods,43.58,71.20
    .target Magistrix Landra Dawnstrider
    .target Ranger Degolien
    .target Ardeyn Riverwind
step << Undead/BloodElf
    .goto Eversong Woods,38.14,73.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨瑟利尔|r交谈
    .turnin 9067 >>交任务: |cRXP_FRIENDLY_无尽的宴会|r
    .target Lord Saltheril
step << Undead/BloodElf
    #completewith next
    .destroy 23500 >>摧毁: |cRXP_ENEMY_萨瑟利尔庄园的宴会邀请函|r, 它在你的背包中. 不再需要它了
step
    #label SGrove
    .goto Eversong Woods,34.06,80.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉莉亚娜|r交谈
    .turnin 9258 >>交任务: |cRXP_FRIENDLY_焦痕谷|r
    .accept 8473 >>接任务: |cRXP_LOOT_痛苦的抉择|r
    .target Larianna Riverwind
    --VV !BloodElf/!Hunter
step
    #completewith next
    >>击杀|cRXP_ENEMY_枯萎的护卫者|r
    >>|cRXP_WARN_请注意, 他们拥有|r |T132282:0|t[突袭] |cRXP_WARN_, 造成的伤害是正常值的两倍|r
    .complete 8473,1 --Kill Withered Green Keeper (x10)
    .mob Withered Green Keeper
    --VV !BloodElf/!Hunter
step
    .goto Eversong Woods,35.10,84.05,10,0
    .goto Eversong Woods,34.91,84.34
    >>击杀|cRXP_ENEMY_怀特巴克|r. 击败他后搜刮出 |T133280:0|t[|cRXP_LOOT_怀特巴克的坠饰|r]
    >>|cRXP_WARN_使用 |T133280:0|t[|cRXP_LOOT_怀特巴克的坠饰|r] 开始任务|r
    >>|cRXP_ENEMY_怀特巴克|r|cRXP_WARN_刷新时间为7分30秒|r
    .collect 23228,1,8474,1 --Collect Old Whitebark's Pendant (x1)
    .accept 8474 >>接任务: |cRXP_LOOT_怀特巴克的坠饰|r
    .mob Old Whitebark
    .use 23228
    --VV !BloodElf/!Hunter
step
#loop
	.line Eversong Woods,36.07,83.10,36.21,85.47,33.24,87.69,32.05,87.25,32.63,83.57,33.46,81.99,34.47,83.08,36.07,83.10
	.goto Eversong Woods,36.07,83.10,40,0
	.goto Eversong Woods,36.21,85.47,40,0
	.goto Eversong Woods,33.24,87.69,40,0
	.goto Eversong Woods,32.05,87.25,40,0
	.goto Eversong Woods,32.63,83.57,40,0
	.goto Eversong Woods,33.46,81.99,40,0
	.goto Eversong Woods,34.47,83.08,40,0
	.goto Eversong Woods,36.07,83.10,40,0
    >>击杀|cRXP_ENEMY_枯萎的护卫者|r
    >>|cRXP_WARN_请注意, 他们拥有|r |T132282:0|t[突袭] |cRXP_WARN_, 造成的伤害是正常值的两倍|r
    .complete 8473,1 --Kill Withered Green Keeper (x10)
    .mob Withered Green Keeper
    --VV !BloodElf/!Hunter
step
    .goto Eversong Woods,34.06,80.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉莉亚娜|r交谈
    .turnin 8473 >>交任务: |cRXP_FRIENDLY_痛苦的抉择|r
    .turnin 8474 >>交任务: |cRXP_FRIENDLY_怀特巴克的坠饰|r
    .accept 10166 >>接任务: |cRXP_LOOT_怀特巴克的记忆|r
    .target Larianna Riverwind
    --VV !BloodElf/!Hunter
step << Rogue
    +在你的主手和副手中装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,2
    .itemStat 16,QUALITY,<7
    .itemStat 17,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << Rogue
    +在主手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << skip
    +在你的副手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
--VV WIP
step
    #completewith next
    .goto Eversong Woods,37.79,86.25
    .cast 33980 >>使用 |T133280:0|t[|cRXP_LOOT_怀特巴克的坠饰|r] 召唤 |cRXP_ENEMY_白松之灵|r
    .use 28209
    .isOnQuest 10166
    --VV !BloodElf/!Hunter
step
    .goto Eversong Woods,37.79,86.25
    >>击败|cRXP_ENEMY_Whitebark的幽灵|r
    >>击败他后与|cRXP_FRIENDLY_白松之灵|r交谈
    .turnin 10166 >>交任务: |cRXP_FRIENDLY_怀特巴克的记忆|r
    .target Whitebark's Spirit
    .use 28209
step << Undead/BloodElf
    .goto Eversong Woods,44.19,85.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文看守者德尔雅|r交谈
    .turnin 9253 >>交任务: |cRXP_FRIENDLY_符文看守者德尔雅|r
    .target Runewarden Deryan
step << Mage
    .goto Eversong Woods,53.02,82.14,40,0
    .goto Eversong Woods,53.85,80.72,40,0
    .goto Eversong Woods,53.58,78.32,40,0
    .goto Eversong Woods,53.51,77.64,40,0
    .goto Eversong Woods,55.14,76.10,40,0
    .goto Eversong Woods,55.63,74.22,40,0
    .goto Eversong Woods,53.02,82.14,40,0
    .goto Eversong Woods,53.85,80.72,40,0
    .goto Eversong Woods,53.58,78.32,40,0
    .goto Eversong Woods,53.51,77.64,40,0
    .goto Eversong Woods,55.14,76.10,40,0
    .goto Eversong Woods,55.63,74.22
    >>击杀 |cRXP_ENEMY_永歌护卫者|r. 击败他们后可获得 |cRXP_LOOT_生命绿枝|r
    .complete 9404,1 --Living Branch (x1)
    .mob Eversong Green Keeper
step << Undead/BloodElf
    .abandon 8490 >>增强防御设施
    --VV Undead/BloodElf !Hunter
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Horde !Warrior !Shaman
#name 12-16 幽魂之地
#displayname 12-16 幽魂之地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 16-20 幽魂之地
#version 1
#group RestedXP 部落 1-30

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawnstrider|r和|cRXP_FRIENDLY_Thedra|r交谈
    .turnin 9144 >>交任务: |cRXP_FRIENDLY_迷失在幽魂之地|r
    .goto Eversong Woods,48.98,88.99
    .accept 9147 >>接任务: |cRXP_LOOT_倒下的信使|r
    .goto Eversong Woods,49.02,89.05
    .target Courier Dawnstrider
    .target Apothecary Thedra
step << Rogue
    +在你的主手和副手中装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,2
    .itemStat 16,QUALITY,<7
    .itemStat 17,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << Rogue
    +在主手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << skip
    +在你的副手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
--VV WIP
step << BloodElf Warlock
    #completewith next
    >>击杀|cRXP_ENEMY_饥饿的鬼爪山猫|r 和|cRXP_ENEMY_迷雾蝠|r . 击败它们获取|cRXP_LOOT_血液样本|r
    .complete 9147,1 --Collect Plagued Blood Sample (x4)
    .mob Starving Ghostclaw
    .mob Mistbat
step << BloodElf Warlock
    .goto Ghostlands,43.66,15.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地上的|cRXP_FRIENDLY_紫色碎片|r交谈
    .accept 9619 >>接任务: |cRXP_LOOT_召唤符文|r
step << BloodElf Warlock
    #completewith next
    .goto Ghostlands,27.51,15.75,10,0
    .goto Ghostlands,27.35,15.01,8,0
    .goto Ghostlands,26.17,15.61,8,0
    .goto Ghostlands,26.09,14.56,8,0
    .goto Ghostlands,26.44,14.24,8,0
    .goto Ghostlands,26.74,14.38,8 >>上楼
step << BloodElf Warlock
    #completewith next
    .goto Ghostlands,26.99,15.24
    .cast 30208 >>使用 |T134078:0|t[虚空石] 召唤一只|cRXP_ENEMY_Summoned 虚空行者|r
    .use 23732
step << BloodElf Warlock
    .goto Ghostlands,26.99,15.24
    >>击杀召唤的虚空行者
    .complete 9619,1 --Summoned Voidwalker (1)
    .mob Summoned Voidwalker
    .use 23732
step
    .goto Ghostlands,50.01,13.00,40,0
    .goto Ghostlands,49.45,13.55,40,0
    .goto Ghostlands,49.12,15.08,40,0
    .goto Ghostlands,48.42,15.77,40,0
    .goto Ghostlands,47.81,12.66,40,0
    .goto Ghostlands,46.75,13.42,40,0
    .goto Ghostlands,45.74,14.35,40,0
    .goto Ghostlands,44.94,16.92,40,0
    .goto Ghostlands,44.84,18.84,40,0
    .goto Ghostlands,45.36,19.92,40,0
    .goto Ghostlands,47.43,20.19,40,0
    .goto Ghostlands,48.56,19.02,40,0
    .goto Ghostlands,49.52,17.34,40,0
    .goto Ghostlands,51.08,16.71,40,0
    .goto Ghostlands,52.00,18.05,40,0
    .goto Ghostlands,55.22,14.72,40,0
    .goto Ghostlands,50.01,13.00,40,0
    .goto Ghostlands,49.45,13.55,40,0
    .goto Ghostlands,49.12,15.08,40,0
    .goto Ghostlands,48.42,15.77,40,0
    .goto Ghostlands,47.81,12.66
    >>击杀|cRXP_ENEMY_饥饿的鬼爪山猫|r 和|cRXP_ENEMY_迷雾蝠|r . 击败它们获取|cRXP_LOOT_血液样本|r
    .complete 9147,1 --Collect Plagued Blood Sample (x4)
    .mob Starving Ghostclaw
    .mob Mistbat
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thedra|r和|cRXP_FRIENDLY_Dawnstrider|r交谈
    .turnin 9147 >>交任务: |cRXP_FRIENDLY_倒下的信使|r
    .goto Eversong Woods,49.02,89.05
    .accept 9148 >>接任务: |cRXP_LOOT_送往塔奎林的信件|r
    .goto Eversong Woods,48.98,88.99
    .target Apothecary Thedra
    .target Courier Dawnstrider
step << Rogue
    +在你的主手和副手中装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,2
    .itemStat 16,QUALITY,<7
    .itemStat 17,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << Rogue
    +在主手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << skip
    +在你的副手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
--VV WIP
step
    .goto Ghostlands,46.55,28.38,10,0
    .goto Ghostlands,46.08,28.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥术师范迪瑞尔|r交谈
    .turnin 9148 >>交任务: |cRXP_FRIENDLY_送往塔奎林的信件|r
    .accept 9327 >>接任务: |cRXP_LOOT_被遗忘者|r << BloodElf
    .accept 9329 >>接任务: |cRXP_LOOT_被遗忘者|r << !BloodElf
    .target Arcanist Vandril
step << skip
    .goto Ghostlands,45.42,30.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阳翼|r交谈
    .fp Tranquillien >>获取塔奎林的飞行点
    .target Skymaster Sunwing
--VV !BloodElf/!Hunter
step << !BloodElf/!Warlock
    #xprate <1.5
    .goto Ghostlands,45.17,32.37,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mavren|r和|cRXP_FRIENDLY_Lymel|r和|cRXP_FRIENDLY_Rathis|r和 |cRXP_FRIENDLY_Vandril|r交谈 << BloodElf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mavren|r和|cRXP_FRIENDLY_Rathis|r和|cRXP_FRIENDLY_Vandril|r交谈 << !BloodElf
    .turnin 9327 >>交任务: |cRXP_FRIENDLY_被遗忘者|r << BloodElf
    .turnin 9329 >>交任务: |cRXP_FRIENDLY_被遗忘者|r << !BloodElf
    .accept 9758 >>接任务: |cRXP_LOOT_返回奥术师范迪瑞尔身边|r
    .goto Ghostlands,44.77,32.44
    .accept 9130 >>接任务: |cRXP_LOOT_银月城的货物|r << BloodElf
    .goto Ghostlands,47.34,29.26 << BloodElf
    .accept 9152 >>接任务: |cRXP_LOOT_托博尔的补给品|r
    .goto Ghostlands,47.27,28.59,10,0
    .goto Ghostlands,47.14,28.30
    .turnin 9758 >>交任务: |cRXP_FRIENDLY_返回奥术师范迪瑞尔身边|r
    .accept 9138 >>接任务: |cRXP_LOOT_日冕村|r
    .goto Ghostlands,46.55,28.38,10,0
    .goto Ghostlands,46.08,28.33
    .target High Executor Mavren
    .target Quartermaster Lymel
    .target Rathis Tomber
    .target Arcanist Vandril
step << BloodElf Warlock
    #xprate <1.5
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.77,32.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mavren|r交谈
    .turnin 9327 >>交任务: |cRXP_FRIENDLY_被遗忘者|r << BloodElf
    .turnin 9329 >>交任务: |cRXP_FRIENDLY_被遗忘者|r << !BloodElf
    .accept 9758 >>接任务: |cRXP_LOOT_返回奥术师范迪瑞尔身边|r
    .target High Executor Mavren
step << BloodElf Warlock
    #xprate >1.4999
    .goto Ghostlands,45.17,32.37,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵哨兵玛尔特迪斯|r和|cRXP_FRIENDLY_高级执行官玛尔伦|r和|cRXP_FRIENDLY_顾问瓦尔文|r交谈
    .accept 9199 >>接任务: |cRXP_LOOT_巨魔的邪符|r
    .goto Ghostlands,44.74,32.28
    .turnin 9327 >>交任务: |cRXP_FRIENDLY_被遗忘者|r << BloodElf
    .turnin 9329 >>交任务: |cRXP_FRIENDLY_被遗忘者|r << !BloodElf
    .accept 9758 >>接任务: |cRXP_LOOT_返回奥术师范迪瑞尔身边|r
    .goto Ghostlands,44.77,32.44
    .accept 9193 >>接任务: |cRXP_LOOT_调查阿曼尼墓穴|r
    .goto Ghostlands,44.84,32.81
    .target Deathstalker Maltendis
    .target High Executor Mavren
    .target Advisor Valwyn
step << !BloodElf/!Warlock
    #xprate >1.4999
    .goto Ghostlands,45.17,32.37,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵哨兵玛尔特迪斯|r和|cRXP_FRIENDLY_高级执行官玛尔伦|r和|cRXP_FRIENDLY_顾问瓦尔文|r和|cRXP_FRIENDLY_军需官雷米尔|r和|cRXP_FRIENDLY_拉提斯·托博尔|r和 |cRXP_FRIENDLY_奥术师范迪瑞尔|r交谈 << BloodElf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵哨兵玛尔特迪斯|r和|cRXP_FRIENDLY_高级执行官玛尔伦|r和|cRXP_FRIENDLY_顾问瓦尔文|r和|cRXP_FRIENDLY_拉提斯·托博尔|r和|cRXP_FRIENDLY_奥术师范迪瑞尔|r交谈 << !BloodElf
    .accept 9199 >>接任务: |cRXP_LOOT_巨魔的邪符|r
    .goto Ghostlands,44.74,32.28
    .turnin 9327 >>交任务: |cRXP_FRIENDLY_被遗忘者|r << BloodElf
    .turnin 9329 >>交任务: |cRXP_FRIENDLY_被遗忘者|r << !BloodElf
    .accept 9758 >>接任务: |cRXP_LOOT_返回奥术师范迪瑞尔身边|r
    .goto Ghostlands,44.77,32.44
    .accept 9193 >>接任务: |cRXP_LOOT_调查阿曼尼墓穴|r
    .goto Ghostlands,44.84,32.81
    .accept 9130 >>接任务: |cRXP_LOOT_银月城的货物|r << BloodElf
    .goto Ghostlands,47.34,29.26 << BloodElf
    .accept 9152 >>接任务: |cRXP_LOOT_托博尔的补给品|r
    .goto Ghostlands,47.27,28.59,10,0
    .goto Ghostlands,47.14,28.30
    .turnin 9758 >>交任务: |cRXP_FRIENDLY_返回奥术师范迪瑞尔身边|r
    .accept 9138 >>接任务: |cRXP_LOOT_日冕村|r
    .goto Ghostlands,46.55,28.38,10,0
    .goto Ghostlands,46.08,28.33
    .target Deathstalker Maltendis
    .target High Executor Mavren
    .target Advisor Valwyn
    .target Quartermaster Lymel << !BloodElf
    .target Rathis Tomber
    .target Arcanist Vandril
step << BloodElf Warlock
    #sticky
    #label WPoster
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_通缉告示|r交谈
    .accept 9156 >>接任务: |cRXP_LOOT_通缉：纳克雷洛特和卢兹兰|r
    .goto Ghostlands,48.35,31.67
step << BloodElf Warlock
    #completewith next
    .goto Ghostlands,48.34,31.99,8,0
    .goto Ghostlands,48.91,32.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板卡拉林|r交谈
    .home >>将你的炉石设置为塔奎林
    .target Innkeeper Kalarin
step << BloodElf Warlock
    #requires WPoster
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lymel|r和|cRXP_FRIENDLY_Rathis|r和|cRXP_FRIENDLY_Vandril|r交谈
    .accept 9130 >>接任务: |cRXP_LOOT_银月城的货物|r
    .goto Ghostlands,47.34,29.26
    .accept 9152 >>接任务: |cRXP_LOOT_托博尔的补给品|r
    .goto Ghostlands,47.27,28.59,10,0
    .goto Ghostlands,47.14,28.30
    .turnin 9758 >>交任务: |cRXP_FRIENDLY_返回奥术师范迪瑞尔身边|r
    .accept 9138 >>接任务: |cRXP_LOOT_日冕村|r
    .goto Ghostlands,46.55,28.38,10,0
    .goto Ghostlands,46.08,28.33
    .target Quartermaster Lymel
    .target Rathis Tomber
    .target Arcanist Vandril
step << BloodElf Warlock
    #requires WPoster
    #xprate >1.4999
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lymel|r和|cRXP_FRIENDLY_Rathis|r和|cRXP_FRIENDLY_Vandril|r交谈 << BloodElf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉提斯|r和|r|cRXP_FRIENDLY_范迪瑞尔|r交谈 << !BloodElf
    .accept 9130 >>接任务: |cRXP_LOOT_银月城的货物|r << BloodElf
    .goto Ghostlands,47.34,29.26 << BloodElf
    .accept 9152 >>接任务: |cRXP_LOOT_托博尔的补给品|r
    .goto Ghostlands,47.27,28.59,10,0
    .goto Ghostlands,47.14,28.30
    .turnin 9758 >>交任务: |cRXP_FRIENDLY_返回奥术师范迪瑞尔身边|r
    .accept 9138 >>接任务: |cRXP_LOOT_日冕村|r
    .goto Ghostlands,46.55,28.38,10,0
    .goto Ghostlands,46.08,28.33
    .target Quartermaster Lymel
    .target Rathis Tomber
    .target Arcanist Vandril
step << skip
    >>不要飞往银月城. 请与飞行管理员交谈
    .goto Ghostlands,45.5,30.6
    .turnin 9130 >>交任务: |cRXP_FRIENDLY_银月城的货物|r
    .accept 9133 >>接任务: |cRXP_LOOT_飞往银月城|r
--BloodElf !Hunter !Warlock
step << BloodElf
    #xprate <1.5
    .goto Ghostlands,45.42,30.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阳翼|r交谈
    .turnin 9130 >>交任务: |cRXP_FRIENDLY_银月城的货物|r
    .accept 9133 >>接任务: |cRXP_LOOT_飞往银月城|r << Warlock/Priest
    .target Skymaster Sunwing
step << BloodElf
    #xprate >1.4999
    .goto Ghostlands,45.42,30.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阳翼|r交谈
    .turnin 9130 >>交任务: |cRXP_FRIENDLY_银月城的货物|r
    .accept 9133 >>接任务: |cRXP_LOOT_飞往银月城|r << Priest
    .target Skymaster Sunwing
step << BloodElf Warlock
    #completewith RuneOS
    .goto Ghostlands,45.42,30.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阳翼|r交谈
    .fly Silvermoon >>飞往银月城
    .target Skymaster Sunwing
step << BloodElf Warlock
    #completewith RuneOS
    .goto Eversong Woods,56.51,49.61,25,0
    .goto Silvermoon City,73.39,59.65
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
step << BloodElf Warlock
    #xprate <1.5
    .goto Silvermoon City,69.27,77.00,8,0
    .goto Silvermoon City,68.13,74.07,8,0
    .goto Silvermoon City,66.56,73.29,8,0
    .goto Silvermoon City,65.53,72.60,8,0
    .goto Silvermoon City,72.4,85.7,40,0
    .goto Silvermoon City,53.93,71.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨斯雷|r交谈
    .turnin 9133 >>交任务: |cRXP_FRIENDLY_飞往银月城|r
    .accept 9134 >>接任务: |cRXP_LOOT_葛拉米|r
    .target Sathren Azuredawn
step << BloodElf Warlock
    #xprate <1.5
    #completewith RuneOS
    .goto Silvermoon City,66.92,59.84,30,0
    .goto Silvermoon City,69.32,59.09,20,0
    .goto Silvermoon City,73.50,58.21,30,0
    .goto Silvermoon City,75.62,58.31,20,0
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,75.65,45.04,15,0
    .goto Silvermoon City,76.33,43.33,12 >>进入建筑内, 然后下楼梯
step << BloodElf Warlock
    #xprate >1.4999
    #completewith RuneOS
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,75.62,58.31,20,0
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,75.65,45.04,15,0
    .goto Silvermoon City,76.33,43.33,12 >>进入建筑内, 然后下楼梯
step << BloodElf Warlock
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .turnin 9619 >>交任务: |cRXP_FRIENDLY_召唤符文|r
    .train 705 >>训练你的职业法术
    .target Talionia
    .xp <12,1
    .xp >14,1
    .train 705,1
step << BloodElf Warlock
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .turnin 9619 >>交任务: |cRXP_FRIENDLY_召唤符文|r
    .train 6222 >>训练你的职业法术
    .target Talionia
    .xp <14,1
    .xp >16,1
    .train 6222,1
step << BloodElf Warlock
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .turnin 9619 >>交任务: |cRXP_FRIENDLY_召唤符文|r
    .train 1455 >>训练你的职业法术
    .target Talionia
    .xp <16,1
    .train 1455,1
step << BloodElf Warlock
    #label RuneOS
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .turnin 9619 >>交任务: |cRXP_FRIENDLY_召唤符文|r
    .target Talionia
step << BloodElf Warlock
    #completewith next
    .hs >>传送至塔奎林
step << Rogue
    +在你的主手和副手中装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,2
    .itemStat 16,QUALITY,<7
    .itemStat 17,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << Rogue
    +在主手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << skip
    +在你的副手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
--VV WIP
step
    .goto Ghostlands,57.54,14.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上的|cRXP_FRIENDLY_濒死的血精灵|r交谈
    .accept 9315 >>接任务: |cRXP_LOOT_阿诺克苏塔|r
    .target Dying Blood Elf
step << !Paladin
    #completewith next
    >>击杀|cRXP_ENEMY_蛛怪卫兵|r
    .complete 9138,1 --Kill Nerubis Guard (x10)
    .mob Nerubis Guard
step << Paladin
    #completewith FirstT
    >>击杀|cRXP_ENEMY_蛛怪卫兵|r
    .complete 9138,1 --Kill Nerubis Guard (x10)
    .mob Nerubis Guard
step
    .goto Ghostlands,59.47,12.43,20,0
    .goto Ghostlands,59.83,10.22,20,0
    .goto Ghostlands,58.92,9.19,20,0
    .goto Ghostlands,60.72,9.46,20,0
    .goto Ghostlands,61.74,9.63,20,0
    .goto Ghostlands,62.86,11.04,20,0
    .goto Ghostlands,63.26,9.50,20,0
    .goto Ghostlands,62.76,12.68,20,0
    .goto Ghostlands,63.52,13.39,20,0
    .goto Ghostlands,62.00,14.21,20,0
    .goto Ghostlands,60.70,14.39,20,0
    .goto Ghostlands,60.34,16.13,20,0
    .goto Ghostlands,59.92,13.83,20,0
    .goto Ghostlands,62.86,11.04
    >>击杀|cRXP_ENEMY_阿诺克苏塔|r. 他沿着城镇道路逆时针巡逻, 并进入建筑物
    >>|cRXP_WARN_他在生命值低于50%时, 会以60码范围召唤|r|cRXP_ENEMY_蛛怪卫兵|r|cRXP_WARN_求援|r
    >>|cRXP_WARN_如果需要, 为他找一个队伍|r
    .complete 9315,1 --Kill Anok'suten (x1)
    .unitscan Anok'suten
step << !Paladin
#loop
	.line Ghostlands,59.47,12.43,59.83,10.22,58.92,9.19,60.72,9.46,61.74,9.63,62.86,11.04,63.26,9.50,62.76,12.68,63.52,13.39,62.00,14.21,60.70,14.39,60.34,16.13,59.92,13.83,62.86,11.04,59.47,12.43
	.goto Ghostlands,59.47,12.43,30,0
	.goto Ghostlands,59.83,10.22,30,0
	.goto Ghostlands,58.92,9.19,30,0
	.goto Ghostlands,60.72,9.46,30,0
	.goto Ghostlands,61.74,9.63,30,0
	.goto Ghostlands,62.86,11.04,30,0
	.goto Ghostlands,63.26,9.50,30,0
	.goto Ghostlands,62.76,12.68,30,0
	.goto Ghostlands,63.52,13.39,30,0
	.goto Ghostlands,62.00,14.21,30,0
	.goto Ghostlands,60.70,14.39,30,0
	.goto Ghostlands,60.34,16.13,30,0
	.goto Ghostlands,59.92,13.83,30,0
	.goto Ghostlands,62.86,11.04,30,0
	.goto Ghostlands,59.47,12.43,30,0
    >>击杀|cRXP_ENEMY_蛛怪卫兵|r
    .complete 9138,1 --Kill Nerubis Guard (x10)
    .mob Nerubis Guard
step << Paladin
    #completewith next
    >>游到岛屿上
    .goto Ghostlands,68.53,8.66,20 >>进入洞穴内部
step << Paladin
    #completewith next
    .goto Ghostlands,68.41,7.42
    .cast 3365 >>点击|cRXP_PICK_镀金火盆|r以召唤|cRXP_ENEMY_桑利亚斯·静刃|r
step << Paladin
    #label FirstT
    .goto Ghostlands,68.50,9.77
    >>击杀|cRXP_ENEMY_桑利亚斯·静刃|r
    .complete 9678,1 --Undergo the First Trial
    .mob Sangrias Stillblade
step << Paladin
#loop
	.line Ghostlands,68.61,10.24,69.93,9.00,70.52,5.81,69.54,4.65,68.63,4.93,66.76,5.54,66.70,6.58,67.41,9.70,68.61,10.24
	.goto Ghostlands,68.61,10.24,30,0
	.goto Ghostlands,69.93,9.00,30,0
	.goto Ghostlands,70.52,5.81,30,0
	.goto Ghostlands,69.54,4.65,30,0
	.goto Ghostlands,68.63,4.93,30,0
	.goto Ghostlands,66.76,5.54,30,0
	.goto Ghostlands,66.70,6.58,30,0
	.goto Ghostlands,67.41,9.70,30,0
	.goto Ghostlands,68.61,10.24,30,0
    >>击杀|cRXP_ENEMY_蛛怪卫兵|r
    .complete 9138,1 --Kill Nerubis Guard (x10)
    .mob Nerubis Guard
step
    .goto Ghostlands,69.40,15.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠瓦兰娜|r交谈
    .accept 9143 >>接任务: |cRXP_LOOT_塞布索雷的巨魔|r
    .target Ranger Valanna
step
    .goto Ghostlands,72.29,19.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格兰尼斯·月晨|r交谈
    .accept 9157 >>接任务: |cRXP_LOOT_被遗忘的仪祭|r
    .target Geranis Whitemorn
step
#loop
	.line Ghostlands,73.64,14.43,73.77,11.83,74.70,11.89,74.75,9.70,75.89,8.49,76.87,8.54,78.20,9.68,77.70,12.61,75.88,10.23,76.00,13.71,73.64,14.43
	.goto Ghostlands,73.64,14.43,30,0
	.goto Ghostlands,73.77,11.83,30,0
	.goto Ghostlands,74.70,11.89,30,0
	.goto Ghostlands,74.75,9.70,30,0
	.goto Ghostlands,75.89,8.49,30,0
	.goto Ghostlands,76.87,8.54,30,0
	.goto Ghostlands,78.20,9.68,30,0
	.goto Ghostlands,77.70,12.61,30,0
	.goto Ghostlands,75.88,10.23,30,0
	.goto Ghostlands,76.00,13.71,30,0
	.goto Ghostlands,73.64,14.43,30,0
    >>击杀|cRXP_ENEMY_暗松撕裂者|r和|cRXP_ENEMY_暗松女巫|r, 击败后可掠夺其|cRXP_LOOT_翻译者：暗松耳朵|r
    .complete 9143,1 --Collect Zeb'Sora Troll Ear (x6)
    .mob Shadowpine Ripper
    .mob Shadowpine Witch
step
    .goto Ghostlands,73.48,32.15,15,0
    .goto Ghostlands,72.50,32.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_远行者塞蒂娜|r交谈
    .accept 9158 >>接任务: |cRXP_LOOT_瘟疫的使者|r
    .target Farstrider Sedina
step
    .goto Ghostlands,72.29,32.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫罗恩|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132815:0|t[冰镇牛奶]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133918:0|t[长嘴泥鳅]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r|T133918:0|t[长嘴泥鳅]|r << Paladin
    .collect 1179,20,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Ice Cold Milk (20)
    .collect 4592,20,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Longjaw Mud Snapper (20)
    .collect 4592,10,9281,1 << Paladin --Longjaw Mud Snapper (10)
    .target Heron Skygaze
    .money <0.0080 << !Priest !Mage !Warlock !Druid !Paladin
    .money <0.0500 << Priest/Mage/Warlock/Druid
    .money <0.0540 << Paladin
    .isOnQuest 9158
    .xp >15,1
step
    .goto Ghostlands,72.29,32.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫罗恩|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132815:0|t[冰镇牛奶]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133918:0|t[长嘴泥鳅]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r|T133918:0|t[长嘴泥鳅]|r << Paladin
    .collect 1179,10,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Ice Cold Milk (10)
    .collect 4592,20,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Longjaw Mud Snapper (20)
    .collect 4592,10,9281,1 << Paladin --Longjaw Mud Snapper (10)
    .target Heron Skygaze
    .money <0.0080 << !Priest !Mage !Warlock !Druid !Paladin
    .money <0.0250 << Priest/Mage/Warlock/Druid
    .money <0.0290 << Paladin
    .isOnQuest 9158
    .xp >15,1
step
    .goto Ghostlands,72.29,32.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫罗恩|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133970:0|t[羊排]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133970:0|t[羊排]|r << Paladin
    .collect 1205,20,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (20)
    .collect 3770,20,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Mutton Chop (20)
    .collect 3770,10,9281,1 << Paladin --Mutton Chop (10)
    .target Heron Skygaze
    .money <1.000
    .isOnQuest 9158
    .xp <15,1
    .xp >30,1
-- .money <0.2000 << !Paladin
-- .money <0.3000 << Paladin
--VV Would cause too many potential money issues
step
    .goto Ghostlands,72.29,32.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫罗恩|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133970:0|t[羊排]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133970:0|t[羊排]|r << Paladin
    .collect 1205,10,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (10)
    .collect 3770,10,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Mutton Chop (10)
    .collect 3770,10,9281,1 << Paladin --Mutton Chop (10)
    .target Heron Skygaze
    .money <1.000
    .isOnQuest 9158
    .xp <15,1
    .xp >30,1
-- .money <0.1000 << !Paladin
-- .money <0.2000 << Paladin
--VV Would cause too many potential money issues
step
    .goto Ghostlands,69.61,31.21,40,0
    .goto Ghostlands,66.93,35.04,40,0
    .goto Ghostlands,69.21,36.19,40,0
    .goto Ghostlands,68.34,39.28,40,0
    .goto Ghostlands,66.16,42.71,40,0
    .goto Ghostlands,68.48,46.50,40,0
    .goto Ghostlands,71.08,44.62,40,0
    .goto Ghostlands,72.68,41.63,40,0
    .goto Ghostlands,73.06,39.68,40,0
    .goto Ghostlands,74.79,39.15,40,0
    .goto Ghostlands,73.82,36.71,40,0
    .goto Ghostlands,76.03,36.52,40,0
    .goto Ghostlands,76.39,34.86,40,0
    .goto Ghostlands,74.79,39.15,40,0
    .goto Ghostlands,77.29,31.89,40,0
    .goto Ghostlands,77.16,27.58,40,0
    .goto Ghostlands,76.07,25.13,40,0
    .goto Ghostlands,74.82,29.77,40,0
    .goto Ghostlands,72.68,41.63
    >>击杀|cRXP_ENEMY_幽灵爪猞猁|r
    .complete 9158,1 --Kill Ghostclaw Lynx (x10)
    .mob Ghostclaw Lynx
step
    #xprate >1.6999
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sedina|r和|cRXP_FRIENDLY_Solanna|r和|cRXP_FRIENDLY_通缉告示|r以及|cRXP_FRIENDLY_赫利俄斯|r谈话
    .turnin 9158 >>交任务: |cRXP_FRIENDLY_瘟疫的使者|r
    .accept 9159 >>接任务: |cRXP_LOOT_控制瘟疫|r
    .goto Ghostlands,72.50,32.14
    .accept 9276 >>接任务: |cRXP_LOOT_进攻塞布提拉|r
    .goto Ghostlands,72.33,31.24
    .accept 9215 >>接任务: |cRXP_LOOT_克尔加什的徽记！|r
    .goto Ghostlands,72.24,31.14
    .accept 9214 >>接任务: |cRXP_LOOT_暗松巨魔的武器|r
    .goto Ghostlands,72.37,29.64
    .target Farstrider Sedina
    .target Farstrider Solanna
    .target Ranger Krenn'an
    .target Captain Helios
    .xp <15,1
step
    #xprate <1.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sedina|r和|cRXP_FRIENDLY_Solanna|r和通缉告示和|cRXP_FRIENDLY_Krenn'an|r以及|cRXP_FRIENDLY_赫利俄斯|r交谈
    .turnin 9158 >>交任务: |cRXP_FRIENDLY_瘟疫的使者|r
    .accept 9159 >>接任务: |cRXP_LOOT_控制瘟疫|r
    .goto Ghostlands,72.50,32.14
    .accept 9276 >>接任务: |cRXP_LOOT_进攻塞布提拉|r
    .goto Ghostlands,72.33,31.24
    .accept 9215 >>接任务: |cRXP_LOOT_克尔加什的徽记！|r
    .goto Ghostlands,72.24,31.14
    .accept 9274 >>接任务: |cRXP_LOOT_水中鬼魂|r
    .goto Ghostlands,72.21,29.78
    .accept 9214 >>接任务: |cRXP_LOOT_暗松巨魔的武器|r
    .goto Ghostlands,72.37,29.64
    .target Farstrider Sedina
    .target Farstrider Solanna
    .target Ranger Krenn'an
    .target Captain Helios
    .xp <15,1
step
    #xprate <1.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_远行者塞蒂娜|r和|cRXP_FRIENDLY_通缉告示|r以及|cRXP_FRIENDLY_克伦纳|r交谈
    .turnin 9158 >>交任务: |cRXP_FRIENDLY_瘟疫的使者|r
    .accept 9159 >>接任务: |cRXP_LOOT_控制瘟疫|r
    .goto Ghostlands,72.50,32.14
    .accept 9215 >>接任务: |cRXP_LOOT_克尔加什的徽记！|r
    .goto Ghostlands,72.24,31.14
    .accept 9274 >>接任务: |cRXP_LOOT_水中鬼魂|r
    .goto Ghostlands,72.21,29.78
    .target Farstrider Sedina
    .target Ranger Krenn'an
step
    .goto Ghostlands,72.29,32.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫罗恩|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133970:0|t[羊排]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133970:0|t[羊排]|r << Paladin
    .collect 1205,20,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (20)
    .collect 3770,20,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Mutton Chop (20)
    .collect 3770,10,9281,1 << Paladin --Mutton Chop (10)
    .target Heron Skygaze
    .money <1.000
    .isOnQuest 9158
    .xp <15,1
    .xp >30,1
-- .money <0.2000 << !Paladin
-- .money <0.3000 << Paladin
--VV Would cause too many potential money issues
step
    .goto Ghostlands,72.29,32.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫罗恩|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133970:0|t[羊排]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133970:0|t[羊排]|r << Paladin
    .collect 1205,10,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (10)
    .collect 3770,10,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Mutton Chop (10)
    .collect 3770,10,9281,1 << Paladin --Mutton Chop (10)
    .target Heron Skygaze
    .money <1.000
    .isOnQuest 9158
    .xp <15,1
    .xp >30,1
-- .money <0.1000 << !Paladin
-- .money <0.2000 << Paladin
--VV Would cause too many potential money issues
step << Rogue
    +在你的主手和副手中装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,2
    .itemStat 16,QUALITY,<7
    .itemStat 17,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << Rogue
    +在主手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << skip
    +在你的副手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
--VV WIP
step
    #xprate <1.7
    #completewith Aquantion
    >>击杀|cRXP_ENEMY_贪婪的幽灵|r和|cRXP_ENEMY_复仇的幽灵|r
    .complete 9274,1 --Kill Ravening Apparition (x8)
    .complete 9274,2 --Kill Vengeful Apparition (x8)
    .mob Ravening Apparition
    .mob Vengeful Apparition
step
    .goto Ghostlands,71.99,28.39,30,0
    .goto Ghostlands,72.55,27.63,30,0
    .goto Ghostlands,72.79,26.45,30,0
    .goto Ghostlands,73.42,22.88,30,0
    .goto Ghostlands,73.69,22.23,30,0
    .goto Ghostlands,73.70,21.53,30,0
    .goto Ghostlands,73.51,21.12,30,0
    .goto Ghostlands,73.49,18.45,30,0
    .goto Ghostlands,71.31,15.24,30,0
    .goto Ghostlands,71.11,15.38,30,0
    .goto Ghostlands,71.16,13.76,30,0
    .goto Ghostlands,70.65,13.67,30,0
    .goto Ghostlands,70.46,17.19,30,0
    .goto Ghostlands,69.58,18.80,30,0
    .goto Ghostlands,70.16,21.99,30,0
    .goto Ghostlands,71.99,28.39,30,0
    .goto Ghostlands,72.55,27.63,30,0
    .goto Ghostlands,72.79,26.45,30,0
    .goto Ghostlands,73.42,22.88
    >>在水下的|cRXP_PICK_闪光的泥浆堆|r中获取|cRXP_PICK_波浪勋章|r
    .complete 9157,1 --Collect Wavefront Medallion (x8)
step
    .goto Ghostlands,72.29,19.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格兰尼斯·月晨|r交谈
    .turnin 9157 >>交任务: |cRXP_FRIENDLY_被遗忘的仪祭|r
    .accept 9174 >>接任务: |cRXP_LOOT_消灭阿奎艾森|r
    .target Geranis Whitemorn
step
    #completewith next
    .goto Ghostlands,71.32,14.93
    .cast 28226 >>点击|cRXP_PICK_Altar|r以召唤|cRXP_ENEMY_阿奎艾森|r
step
    .goto Ghostlands,71.31,14.58
    >>击杀|cRXP_ENEMY_阿奎艾森|r
    >>|cRXP_WARN_他拥有精英级别的生命值, 并造成冰霜伤害|r
    >>|cRXP_WARN_他免疫|r|T136222:0|t[奥术洪流]|cRXP_WARN_和|r|T135963:0|t[审判之锤] << BloodElf Paladin
    >>|cRXP_WARN_他免疫|r|T135963:0|t[正义之锤] << !BloodElf Paladin
    >>|cRXP_WARN_他免疫|r|T136222:0|t[奥术洪流]|cRXP_WARN_和|r|T136183:0|t[恐惧] << BloodElf Warlock
    >>|cRXP_WARN_他对|r|T136183:0|t[恐惧]免疫 << !BloodElf Warlock
    >>|cRXP_WARN_他免疫|r|T136222:0|t[奥术洪流]|cRXP_WARN_和|r|T136184:0|t[心灵尖啸] << BloodElf Priest
    >>|cRXP_WARN_他对|r|T136184:0|t[心灵尖啸]免疫 << !BloodElf Priest
    >>|cRXP_WARN_他免疫|r|T136222:0|t[奥术洪流]和|T135846:0|t[寒冰箭]和|T135848:0|t[寒冰新星]和|cRXP_WARN_以及|r|T135843:0|t[寒冰护甲] << BloodElf Mage
    >>|cRXP_WARN_他免疫|r|T135846:0|t[冰霜箭]和|T135848:0|t[冰霜新星]和|cRXP_WARN_和|r|T135843:0|t[冰霜护甲] << !BloodElf Mage
    >>|cRXP_WARN_在召唤他之前, 务必使用|r|T136006:0|t[削弱魔法]|cRXP_WARN_为自己加持buff|r << Mage
    >>|cRXP_WARN_他免疫|r|T136222:0|t[奥术洪流]|cRXP_WARN_和|r|T132155:0|t[割裂] << BloodElf Rogue
    >>|cRXP_WARN_他免疫|r|T132155:0|t[撕裂] << !BloodElf Rogue
    >>|cRXP_WARN_他免疫|r|T136222:0|t[奥术洪流] << BloodElf Hunter
    >>|cRXP_WARN_如果需要, 为他找一个队伍|r << !Hunter !Warlock
    .complete 9174,1 --Kill Aquantion (x1)
    .mob Aquantion
    .train 8122,3 << Priest
    .train 604,3 << Mage
step << Priest/Mage
    .goto Ghostlands,71.31,14.58
    >>击杀|cRXP_ENEMY_阿奎艾森|r
    >>|cRXP_WARN_他拥有精英级别的生命值, 并造成冰霜伤害|r
    >>|cRXP_WARN_他免疫|r|T136222:0|t[奥术洪流] << BloodElf Priest
    >>|cRXP_WARN_他免疫|r|T136222:0|t[奥术洪流]和|T135846:0|t[寒冰箭]和|T135848:0|t[寒冰新星]和|cRXP_WARN_以及|r|T135843:0|t[寒冰护甲] << BloodElf Mage
    >>|cRXP_WARN_他免疫|r|T135846:0|t[冰霜箭]和|T135848:0|t[冰霜新星]和|cRXP_WARN_和|r|T135843:0|t[冰霜护甲] << !BloodElf Mage
    .complete 9174,1 --Kill Aquantion (x1)
    .mob Aquantion
step
    #label Aquantion
    .goto Ghostlands,72.29,19.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格兰尼斯·月晨|r交谈
    .turnin 9174 >>交任务: |cRXP_FRIENDLY_消灭阿奎艾森|r
    .target Geranis Whitemorn
step
    #xprate <1.7
    .goto Ghostlands,71.99,28.39,30,0
    .goto Ghostlands,72.55,27.63,30,0
    .goto Ghostlands,72.79,26.45,30,0
    .goto Ghostlands,73.42,22.88,30,0
    .goto Ghostlands,73.69,22.23,30,0
    .goto Ghostlands,73.70,21.53,30,0
    .goto Ghostlands,73.51,21.12,30,0
    .goto Ghostlands,73.49,18.45,30,0
    .goto Ghostlands,70.46,17.19,30,0
    .goto Ghostlands,69.58,18.80,30,0
    .goto Ghostlands,70.16,21.99,30,0
    .goto Ghostlands,71.99,28.39,30,0
    .goto Ghostlands,72.55,27.63,30,0
    .goto Ghostlands,72.79,26.45,30,0
    .goto Ghostlands,73.42,22.88
    >>击杀|cRXP_ENEMY_贪婪的幽灵|r和|cRXP_ENEMY_复仇的幽灵|r
    .complete 9274,1 --Kill Ravening Apparition (x8)
    .complete 9274,2 --Kill Vengeful Apparition (x8)
    .mob Ravening Apparition
    .mob Vengeful Apparition
step
    .goto Ghostlands,69.40,15.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠瓦兰娜|r交谈
    .turnin 9143 >>交任务: |cRXP_FRIENDLY_塞布索雷的巨魔|r
    .accept 9146 >>接任务: |cRXP_LOOT_向赫里奥斯中尉报到|r
    .target Ranger Valanna
step
    #xprate <1.5
#loop
	.line Ghostlands,59.47,12.43,59.83,10.22,58.92,9.19,60.72,9.46,61.74,9.63,62.86,11.04,63.26,9.50,62.76,12.68,63.52,13.39,62.00,14.21,60.70,14.39,60.34,16.13,59.92,13.83,62.86,11.04,59.47,12.43
	.goto Ghostlands,59.47,12.43,30,0
	.goto Ghostlands,59.83,10.22,30,0
	.goto Ghostlands,58.92,9.19,30,0
	.goto Ghostlands,60.72,9.46,30,0
	.goto Ghostlands,61.74,9.63,30,0
	.goto Ghostlands,62.86,11.04,30,0
	.goto Ghostlands,63.26,9.50,30,0
	.goto Ghostlands,62.76,12.68,30,0
	.goto Ghostlands,63.52,13.39,30,0
	.goto Ghostlands,62.00,14.21,30,0
	.goto Ghostlands,60.70,14.39,30,0
	.goto Ghostlands,60.34,16.13,30,0
	.goto Ghostlands,59.92,13.83,30,0
	.goto Ghostlands,62.86,11.04,30,0
	.goto Ghostlands,59.47,12.43,30,0
    .xp 13+10150 >>升级至9275/11000经验值
step << Paladin
    #xprate 1.49-1.58
#loop
	.line Ghostlands,73.64,14.43,73.77,11.83,74.70,11.89,74.75,9.70,75.89,8.49,76.87,8.54,78.20,9.68,77.70,12.61,75.88,10.23,76.00,13.71,73.64,14.43
	.goto Ghostlands,73.64,14.43,30,0
	.goto Ghostlands,73.77,11.83,30,0
	.goto Ghostlands,74.70,11.89,30,0
	.goto Ghostlands,74.75,9.70,30,0
	.goto Ghostlands,75.89,8.49,30,0
	.goto Ghostlands,76.87,8.54,30,0
	.goto Ghostlands,78.20,9.68,30,0
	.goto Ghostlands,77.70,12.61,30,0
	.goto Ghostlands,75.88,10.23,30,0
	.goto Ghostlands,76.00,13.71,30,0
	.goto Ghostlands,73.64,14.43,30,0
    .xp 15+8267 >>升级至8267/13600经验值
step << !Rogue
    #xprate 1.59-1.68
#loop
	.line Ghostlands,73.64,14.43,73.77,11.83,74.70,11.89,74.75,9.70,75.89,8.49,76.87,8.54,78.20,9.68,77.70,12.61,75.88,10.23,76.00,13.71,73.64,14.43
	.goto Ghostlands,73.64,14.43,30,0
	.goto Ghostlands,73.77,11.83,30,0
	.goto Ghostlands,74.70,11.89,30,0
	.goto Ghostlands,74.75,9.70,30,0
	.goto Ghostlands,75.89,8.49,30,0
	.goto Ghostlands,76.87,8.54,30,0
	.goto Ghostlands,78.20,9.68,30,0
	.goto Ghostlands,77.70,12.61,30,0
	.goto Ghostlands,75.88,10.23,30,0
	.goto Ghostlands,76.00,13.71,30,0
	.goto Ghostlands,73.64,14.43,30,0
    .xp 15+10840 >>升级至10840/13600经验值 << !Paladin
    .xp 15+7912 >>升级至7912/13600经验值 << Paladin
    .train 1460,1 << Mage
    .train 6222,1 << Warlock
step << !Rogue
    #xprate >1.6999
#loop
	.line Ghostlands,73.64,14.43,73.77,11.83,74.70,11.89,74.75,9.70,75.89,8.49,76.87,8.54,78.20,9.68,77.70,12.61,75.88,10.23,76.00,13.71,73.64,14.43
	.goto Ghostlands,73.64,14.43,30,0
	.goto Ghostlands,73.77,11.83,30,0
	.goto Ghostlands,74.70,11.89,30,0
	.goto Ghostlands,74.75,9.70,30,0
	.goto Ghostlands,75.89,8.49,30,0
	.goto Ghostlands,76.87,8.54,30,0
	.goto Ghostlands,78.20,9.68,30,0
	.goto Ghostlands,77.70,12.61,30,0
	.goto Ghostlands,75.88,10.23,30,0
	.goto Ghostlands,76.00,13.71,30,0
	.goto Ghostlands,73.64,14.43,30,0
    .xp 15+10668 >>升级至10668/13600经验值 << !Paladin
    .xp 15+7557 >>升级至7557+/13600经验值 << Paladin
    .train 1460,1 << Mage
    .train 6222,1 << Warlock
step << Priest/Mage/Warlock/Rogue/Druid
    #xprate <1.5
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step << !Rogue
    #xprate >1.4999
    #completewith next
    .goto Ghostlands,73.65,10.38,1,0
    .goto Ghostlands,69.46,10.04
    >>|cRXP_WARN_确保你死亡位置在巨魔镇最西北侧, 或在岛上|r
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
    .train 1460,1 << Mage
    .train 6222,1 << Warlock
step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vandril|r和|r|cRXP_FRIENDLY_通缉告示|r交谈 << !BloodElf/!Warlock
    .turnin 9315 >>交任务: |cRXP_FRIENDLY_阿诺克苏塔|r
    .turnin 9138 >>交任务: |cRXP_FRIENDLY_日冕村|r
    .accept 9139 >>接任务: |cRXP_LOOT_金雾村|r
    .goto Ghostlands,46.55,28.38,10,0 << !Priest !Mage !Warlock !Rogue !Druid
    .goto Ghostlands,46.08,28.33 << !Priest !Mage !Warlock !Rogue !Druid
    .goto Ghostlands,46.08,28.33,10,0 << Priest/Mage/Warlock/Rogue/Druid
    .goto Ghostlands,46.55,28.38 << Priest/Mage/Warlock/Rogue/Druid
    .accept 9156 >>接任务: |cRXP_LOOT_通缉：纳克雷洛特和卢兹兰|r << !BloodElf/!Warlock
    .goto Ghostlands,48.35,31.67 << !BloodElf/!Warlock
    .target Arcanist Vandril
    .isQuestComplete 9315
step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vandril|r和|r|cRXP_FRIENDLY_通缉告示|r交谈 << !BloodElf/!Warlock
    .turnin 9138 >>交任务: |cRXP_FRIENDLY_日冕村|r
    .accept 9139 >>接任务: |cRXP_LOOT_金雾村|r
    .goto Ghostlands,46.55,28.38,10,0 << !Priest !Mage !Warlock !Rogue !Druid
    .goto Ghostlands,46.08,28.33 << !Priest !Mage !Warlock !Rogue !Druid
    .goto Ghostlands,46.08,28.33,10,0 << Priest/Mage/Warlock/Rogue/Druid
    .goto Ghostlands,46.55,28.38 << Priest/Mage/Warlock/Rogue/Druid
    .accept 9156 >>接任务: |cRXP_LOOT_通缉：纳克雷洛特和卢兹兰|r << !BloodElf/!Warlock
    .goto Ghostlands,48.35,31.67 << !BloodElf/!Warlock
    .target Arcanist Vandril
step
    #xprate >1.4999
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vandril|r和|r|cRXP_FRIENDLY_通缉告示|r交谈 << !BloodElf/!Warlock
    .turnin 9315 >>交任务: |cRXP_FRIENDLY_阿诺克苏塔|r
    .turnin 9138 >>交任务: |cRXP_FRIENDLY_日冕村|r
    .accept 9139 >>接任务: |cRXP_LOOT_金雾村|r
    .goto Ghostlands,46.55,28.38,10,0 << Rogue
    .goto Ghostlands,46.08,28.33 << Rogue
    .goto Ghostlands,46.08,28.33,10,0 << !Rogue
    .goto Ghostlands,46.55,28.38 << !Rogue
    .accept 9156 >>接任务: |cRXP_LOOT_通缉：纳克雷洛特和卢兹兰|r << !BloodElf/!Warlock
    .goto Ghostlands,48.35,31.67 << !BloodElf/!Warlock
    .target Arcanist Vandril
    .isQuestComplete 9315
step
    #xprate >1.4999
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vandril|r和|r|cRXP_FRIENDLY_通缉告示|r交谈 << !BloodElf/!Warlock
    .turnin 9138 >>交任务: |cRXP_FRIENDLY_日冕村|r
    .accept 9139 >>接任务: |cRXP_LOOT_金雾村|r
    .goto Ghostlands,46.55,28.38,10,0 << Rogue
    .goto Ghostlands,46.08,28.33 << Rogue
    .goto Ghostlands,46.08,28.33,10,0 << !Rogue
    .goto Ghostlands,46.55,28.38 << !Rogue
    .accept 9156 >>接任务: |cRXP_LOOT_通缉：纳克雷洛特和卢兹兰|r << !BloodElf/!Warlock
    .goto Ghostlands,48.35,31.67 << !BloodElf/!Warlock
    .target Arcanist Vandril
step << Rogue
    #xprate <1.5
    +在你的主手和副手中装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,2
    .itemStat 16,QUALITY,<7
    .itemStat 17,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << Rogue
    #xprate <1.5
    +在主手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step << skip
    #xprate <1.5
    +在你的副手装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
--VV WIP
step << skip
    >>与大厨师莫迪尔交谈
>>与|cRXP_FRIENDLY_大厨师莫迪尔|r交谈
    .accept 9171 >>接任务: |cRXP_LOOT_松脆蜘蛛腿|r
    .goto Ghostlands,48.43,30.93
    .target Master Chef Mouldier
step << !BloodElf/!Warlock
    .goto Ghostlands,48.34,31.99,8,0
    .goto Ghostlands,48.91,32.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板卡拉林|r交谈
    .home >>将你的炉石设置为塔奎林
    .target Innkeeper Kalarin
step << Mage/Priest/Warlock
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132562:0|t[徒工长靴]|r
    .collect 22991,1,9281,1 --Collect Apprentice Boots (1)
    .target Provisioner Vredigar
    .itemStat 8,LEVEL,<15
step << Rogue/Shaman/Hunter wotlk
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132538:0|t[泥沼行者长靴]|r
    .collect 22992,1,9281,1 --Collect Bogwalker Boots (1)
    .target Provisioner Vredigar
    .itemStat 8,LEVEL,<15
step << Hunter tbc
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132538:0|t[泥沼行者长靴]|cRXP_BUY_和|r|T135277:0|t[塔奎林巨剑]|r
    .collect 22992,1,9281,1 --Collect Bogwalker Boots (1)
    .collect 28164,1,9281,1 << Hunter tbc --Tranquillien Flamberge (1)
    .target Provisioner Vredigar
    .itemStat 8,LEVEL,<15
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
step << Hunter TBC
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132538:0|t[泥沼行者长靴]|r
    .collect 22992,1,9281,1 --Collect Bogwalker Boots (1)
    .target Provisioner Vredigar
    .itemStat 8,LEVEL,<15
step << Hunter tbc
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135277:0|t[塔奎林巨剑]|r
    .collect 28164,1,9281,1 << Hunter tbc --Tranquillien Flamberge (1)
    .target Provisioner Vredigar
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
step << skip
    #sticky
    #completewith Poster13
    .money <0.1300
    >>如果你之前无法负担剑术训练, 现在可以飞往银月城接受武器训练
    .goto Silvermoon City,91.2,38.7
    .train 202 >>学习两小时剑术
step << Paladin
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132535:0|t[志愿兵护胫]|cRXP_BUY_和|r|T135277:0|t[塔奎林巨剑]|r
    .collect 22993,1,9281,1 --Collect Volunteer's Greaves (1)
    .collect 28164,1,9281,1 --Collect Tranquillien Flamberge (1)
    .target Provisioner Vredigar
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
    .itemStat 8,LEVEL,<15
step << Paladin
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r |T132535:0|t[志愿者护胫] |r
    .collect 22993,1,9281,1 --Collect Volunteer's Greaves (1)
    .target Provisioner Vredigar
    .itemStat 8,LEVEL,<15
step << Paladin
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135277:0|t[塔奎林巨剑]|r
    .collect 28164,1,9281,1 --Collect Tranquillien Flamberge (1)
    .target Provisioner Vredigar
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
step << Mage/Priest/Warlock
    #completewith ManaEssence
    +装备 |T132562:0|t[徒工长靴]
    .use 22991
    .itemcount 22991,1
    .itemStat 8,LEVEL,<15
step << Rogue/Shaman/Hunter wotlk
    #completewith ManaEssence
    +装备 |T132538:0|t[泥沼行者长靴]
    .use 22992
    .itemcount 22992,1
    .itemStat 8,LEVEL,<15
step << Hunter tbc
    #label Huntertbc1
    #completewith ManaEssence
    +装备 |T132538:0|t[泥沼行者长靴] 和 |T135277:0|t[塔奎林巨剑]
    .use 22992
    .use 28164
    .itemcount 22992,1
    .itemcount 28164,1
    .itemStat 8,LEVEL,<15
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
step << Hunter tbc
    #label Huntertbc2
    #requires Huntertbc1
    #completewith ManaEssence
    +装备 |T132538:0|t[泥沼行者长靴]
    .use 22992
    .itemcount 22992,1
    .itemStat 8,LEVEL,<15
step << Hunter tbc
    #requires Huntertbc2
    #completewith ManaEssence
    +装备 |T135277:0|t[塔奎林巨剑]
    .use 28164
    .itemcount 28164,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
step << Paladin
    #label Paladinwep1
    #completewith ManaEssence
    +装备 |T132535:0|t[志愿者护胫] 和 |T135277:0|t[塔奎林巨剑]
    .use 22993
    .use 28164
    .itemcount 22993,1
    .itemcount 28164,1
    .itemStat 8,LEVEL,<15
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
step << Paladin
    #label Paladinwep2
    #requires Paladinwep1
    #completewith ManaEssence
    +装备 |T132535:0|t[志愿兵胫甲]
    .use 22993
    .itemcount 22993,1
    .itemStat 8,LEVEL,<15
step << Paladin
    #requires Paladinwep2
    #completewith ManaEssence
    +装备 |T135277:0|t[塔奎林巨剑]
    .use 28164
    .itemcount 28164,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
step
    #completewith ManaEssence
    .abandon 9315 >>放弃阿诺克苏塔
step << Rogue
    .goto Ghostlands,47.67,34.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Renzithen|r交谈
    .accept 9149 >>接任务: |cRXP_LOOT_瘟疫海岸|r
    .target Apothecary Renzithen
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135427:0|t[穿喉者]|cRXP_BUY_和|r|T135344:0|t[邪恶军刀]|cRXP_BUY_, 如果它们在售的话|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.7517 << BloodElf/Undead
    .money <0.7893 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果价格合适, 请从她那里购买|r|T135344:0|t[邪恶军刀]|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.6947 << BloodElf/Undead
    .money <0.7294 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,>7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果有的话, 从她那里购买|r|T135427:0|t[穿喉者]|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.0570 << BloodElf/Undead
    .money <0.0599 << Orc/Troll
    .itemStat 16,QUALITY,>7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #label Eralan01
    #completewith ManaEssence
    +装备 |T135427:0|t[穿喉者] 和 |T135344:0|t[邪恶军刀]
    .use 29584
    .use 29583
    .itemcount 29584,1
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #requires Eralan01
    #completewith ManaEssence
    +装备 |T135344:0|t[邪恶军刀]
    .use 29583
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
step << Rogue
    #requires Eralan01
    #completewith ManaEssence
    +装备 |T135427:0|t[穿喉者]
    .use 29584
    .itemcount 29584,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Renzithen|r和|cRXP_FRIENDLY_Rathiel|r和|cRXP_FRIENDLY_Valwyn|r和|cRXP_FRIENDLY_Dame|r和|cRXP_FRIENDLY_Maltendis|r和|cRXP_FRIENDLY_Darenis|r交谈
    .accept 9149 >>接任务: |cRXP_LOOT_瘟疫海岸|r
    .goto Ghostlands,47.67,34.87
    .accept 9155 >>接任务: |cRXP_LOOT_前往死亡之痕|r
    .goto Ghostlands,46.02,33.58
    .accept 9193 >>接任务: |cRXP_LOOT_调查阿曼尼墓穴|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.84,32.81
    .accept 9160 >>接任务: |cRXP_LOOT_调查安达洛斯|r
    .goto Ghostlands,44.88,32.51
    .accept 9199 >>接任务: |cRXP_LOOT_巨魔的邪符|r
    .accept 9192 >>接任务: |cRXP_LOOT_幽光矿洞的麻烦|r
    .goto Ghostlands,44.74,32.28
    .accept 9150 >>接任务: |cRXP_LOOT_重建历史|r
    .goto Ghostlands,46.02,31.95
    .target Apothecary Renzithen
    .target Deathstalker Rathiel
    .target Advisor Valwyn
    .target Dame Auriferous
    .target Deathstalker Maltendis
    .target Magister Darenis
--VV 9193 and 9199 need to hide if in qlog
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉提尔|r和|cRXP_FRIENDLY_瓦尔温|r和|cRXP_FRIENDLY_达梅|r和|cRXP_FRIENDLY_玛尔特迪斯|r和|cRXP_FRIENDLY_戴伦尼斯|r谈话
    .accept 9155 >>接任务: |cRXP_LOOT_前往死亡之痕|r
    .goto Ghostlands,46.02,33.58
    .accept 9193 >>接任务: |cRXP_LOOT_调查阿曼尼墓穴|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.84,32.81
    .accept 9160 >>接任务: |cRXP_LOOT_调查安达洛斯|r
    .goto Ghostlands,44.88,32.51
    .accept 9199 >>接任务: |cRXP_LOOT_巨魔的邪符|r
    .accept 9192 >>接任务: |cRXP_LOOT_幽光矿洞的麻烦|r
    .goto Ghostlands,44.74,32.28
    .accept 9150 >>接任务: |cRXP_LOOT_重建历史|r
    .goto Ghostlands,46.02,31.95
    .target Deathstalker Rathiel
    .target Advisor Valwyn
    .target Dame Auriferous
    .target Deathstalker Maltendis
    .target Magister Darenis
    --VV 9193 and 9199 need to hide if in qlog
step << Druid
	#completewith DruidTrain1
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
	.xp <14,1
step << Druid
    .goto Moonglade,52.53,40.57
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 782 >>训练你的职业法术
	.target Loganaar
    .cooldown item,6948,>0
	.xp <14,1
    .xp >16,1
step << Druid
    #label DruidTrain1
    .goto Moonglade,52.53,40.57
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 783 >>训练你的职业法术 << wotlk
    .train 8925 >>训练你的职业法术 << TBC
	.target Loganaar
    .cooldown item,6948,>0
	.xp <16,1
step << !Shaman !Warrior !Druid !BloodElf/!Warlock !Paladin !Rogue
    #xprate <1.5
    #completewith SMTraining2
    .goto Ghostlands,45.42,30.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阳翼|r交谈
    .fly Silvermoon >>飞往银月城
    .target Skymaster Sunwing
step << !Shaman !Warrior !Druid !BloodElf/!Warlock
    #xprate >1.4999
    #completewith SMTraining2
    .goto Ghostlands,45.42,30.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阳翼|r交谈
    .fly Silvermoon >>飞往银月城
    .target Skymaster Sunwing
    .xp <16,1 << Rogue
step << !Shaman !Warrior !Druid !Mage !BloodElf/!Warlock !Paladin
    #xprate <1.5
    #completewith SMTraining2
    .goto Eversong Woods,56.51,49.61,25,0
    .goto Silvermoon City,73.39,59.65
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
step << !Shaman !Warrior !Druid !Mage !BloodElf/!Warlock
    #xprate >1.4999
    #completewith SMTraining2
    .goto Eversong Woods,56.51,49.61,25,0
    .goto Silvermoon City,73.39,59.65
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .xp <16,1 << Rogue
step << Rogue
    .abandon 9491 >>放弃贪婪
step << Rogue
    #completewith next
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,76.55,52.05,20,0
    .goto Silvermoon City,79.70,52.16,20 >>前往|cRXP_FRIENDLY_瑟兰尼斯|r
    .xp <16,1
step << Rogue
    #label SMTraining2
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    .accept 10372 >>接任务: |cRXP_LOOT_谨慎的询问|r
    .train 6761 >>训练你的职业法术
    .target Zelanis
    .xp <16,1
step << Rogue
    #completewith Scimitars
    .goto Silvermoon City,62.89,31.26,30,0
    .goto Silvermoon City,51.83,17.91,30,0
    .goto Silvermoon City,49.45,15.00
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <16,1
step << Rogue
    #completewith Scimitars
    .goto Undercity,59.81,11.33,20,0
    .goto Undercity,66.08,18.24,30,0
    .goto Undercity,66.04,32.97,30,0
    .goto Undercity,65.97,44.08,30,0
    .goto Undercity,60.52,44.02,10,0
    .goto Undercity,60.07,47.70,10 >>乘坐升降梯前往幽暗城
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <16,1
step << !Undead Rogue
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fp Undercity >>获取幽暗城飞行路径
    .target Michael Garrett
    .itemcount 2027,<2
    .money <0.7632 << Troll/Orc
    .money <0.7250 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <16,1
step << !Undead Rogue
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fp Undercity >>获取幽暗城飞行路径
    .target Michael Garrett
    .itemcount 2027,<1
    .money <0.3816 << Troll/Orc
    .money <0.3625 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <16,1
step << Rogue
    .goto Undercity,61.15,40.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_路易斯|r交谈
    >>|cRXP_BUY_从他那里购买两把|r|T135343:0|t[战士阔剑]|r
    .collect 2027,2,9144,1 --Scimitar (2)
    .target Louis Warren
    .itemcount 2027,<2
    .money <0.7632 << Troll/Orc
    .money <0.7250 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <16,1
step << Rogue
    #label Scimitars
    .goto Undercity,61.15,40.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_路易斯|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135343:0|t[战士阔剑]|r
    .collect 2027,1,9144,1 --Scimitar (1)
    .target Louis Warren
    .itemcount 2027,<1
    .money <0.3816 << Troll/Orc
    .money <0.3625 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <16,1
step << Rogue
    #completewith Clearing
    .hs >>传送至塔奎林
    .zoneskip Ghostlands
    .cooldown item,6948,>0
    .xp <16,1
step << Rogue
    #completewith next
    .goto Undercity,60.07,47.70,10,0
    .goto Undercity,60.52,44.02,10,0
    .goto Undercity,65.97,44.08,30,0
    .goto Undercity,66.04,32.97,30,0
    .goto Undercity,66.08,18.24,30,0
    .goto Undercity,59.81,11.33,20,0 >>乘坐升降梯返回银月城
    .cooldown item,6948,<0
    .zoneskip Silvermoon City
    .zoneskip Eversong Woods
    .zoneskip Ghostlands
    .xp <16,1
step << Rogue
    .goto Undercity,59,91,11.32,20,0
    .goto Undercity,54.67,11.25
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .cooldown item,6948,<0
    .zoneskip Eversong Woods
    .zoneskip Ghostlands
    .xp <16,1
step << Paladin
    #xprate >1.4999
    #completewith next
    .goto Silvermoon City,82.03,68.36,25,0
    .goto Silvermoon City,84.63,48.65,25,0
    .goto Silvermoon City,84.65,43.43,25,0
    .goto Silvermoon City,89.00,36.95,15,0
    .goto Silvermoon City,89.26,35.20,15 >>前往|cRXP_FRIENDLY_Bloodvalor|r
step << Paladin
    #xprate >1.4999
    .goto Silvermoon City,89.26,35.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bloodvalor|r交谈
    .turnin 9678 >>交任务: |cRXP_FRIENDLY_第一项试炼|r
    .accept 9681 >>接任务: |cRXP_LOOT_掌握力量|r
    .target Knight-Lord Bloodvalor
step << Paladin
    #xprate >1.4999
    .goto Silvermoon City,91.74,35.35,12,0
    .goto Silvermoon City,92.20,37.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bachi|r交谈
    .train 647 >>训练你的职业法术 << wotlk
    .target Champion Bachi
    .xp <14,1
    .xp >16,1
step << Paladin
    #xprate >1.4999
    .goto Silvermoon City,91.74,35.35,12,0
    .goto Silvermoon City,92.20,37.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bachi|r交谈
    .train 7294 >>训练你的职业法术 << tbc
    .train 62124 >>训练你的职业法术 << wotlk
    .target Champion Bachi
	.xp <16,1
step << Paladin
    #xprate >1.4999
    .goto Silvermoon City,92.62,37.53,4,0
    .goto Silvermoon City,92.06,36.23
    >>|cRXP_WARN_跳下后面的洞|r|cRXP_FRIENDLY_Bachi|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_魔导师阿斯塔洛·血誓|r交谈
    .turnin 9681 >>交任务: |cRXP_FRIENDLY_掌握力量|r
    .accept 9684 >>接任务: |cRXP_LOOT_驾驭圣光|r << wotlk
    .accept 63866 >>接任务: |cRXP_LOOT_驾驭圣光|r << tbc
    .target Magister Astalor Bloodsworn
-- This changes in sunwell plataeu, but im not sure if we'd have a phase system instead of just tbc
step << Paladin wotlk
    #xprate >1.4999
    .goto Silvermoon City,92.61,36.80
    >>在|cRXP_FRIENDLY_Magister|r上使用 |T134867:0|t[微光容器]
    .complete 9684,1 --Collect Filled Shimmering Vessel
    .target Blood Elf Magister
    .use 24157
step << Paladin tbc
    #xprate >1.4999
    .goto Silvermoon City,92.61,36.80
    >>在|cRXP_FRIENDLY_M'uru|r上使用 |T134867:0|t[微光容器]
    .complete 63866,1 --Collect Filled Shimmering Vessel
    .target M'uru
    .use 185956
step << Paladin
    #xprate >1.4999
    #completewith next
    .goto Silvermoon City,90.82,37.55,12,0
    .goto Silvermoon City,87.41,36.85,12,0
    .goto Silvermoon City,87.30,31.73,10,0
    .goto Silvermoon City,87.11,29.92,8,0
    .goto Silvermoon City,86.36,30.72,8,0
    .goto Silvermoon City,89.00,36.95,10,0
    .goto Silvermoon City,89.26,35.20,8 >>跑回|cRXP_FRIENDLY_Bloodvalor|r方向
step << Paladin
    #xprate >1.4999
    .goto Silvermoon City,89.26,35.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bloodvalor|r交谈
    .turnin 9684 >>交任务: |cRXP_FRIENDLY_驾驭圣光|r << wotlk
    .turnin 63866 >>交任务: |cRXP_FRIENDLY_驾驭圣光|r << tbc
    .accept 9685 >>接任务: |cRXP_LOOT_救赎死者|r
    .target Knight-Lord Bloodvalor
step << Paladin
    #xprate >1.4999
    .goto Silvermoon City,91.19,36.94,-1
    .goto Silvermoon City,91.14,38.10,-1
	>>|cRXP_WARN_跳到下方的长凳上, 以免走上楼梯|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟里斯|r 或 |cRXP_FRIENDLY_欧塞兰|r 交谈
    .train 647 >>训练你的职业法术
	.target Ithelis
	.target Osselan
    .xp <14,1
    .xp >16,1
step << Paladin
    #xprate >1.4999
    #label SMTraining2
    .goto Silvermoon City,91.19,36.94,-1
    .goto Silvermoon City,91.14,38.10,-1
	>>|cRXP_WARN_跳到下方的长凳上, 以免走上楼梯|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟里斯|r 或 |cRXP_FRIENDLY_欧塞兰|r 交谈
    .train 7294 >>训练你的职业法术 << tbc
    .train 62124 >>训练你的职业法术 << wotlk
	.target Ithelis
	.target Osselan
	.xp <16,1
step << Paladin
    #xprate >1.4999
    #completewith next
    .goto Silvermoon City,82.04,58.31,8,0
    .goto Silvermoon City,80.90,57.53,8 >>进入旅店
step << Paladin
    #xprate >1.4999
    #completewith next
    .goto Silvermoon City,79.61,56.25,8,0
    .goto Silvermoon City,80.09,55.56,8,0
    .goto Silvermoon City,80.61,56.51,8,0
    .goto Silvermoon City,80.16,60.24,8 >>前往|cRXP_FRIENDLY_Stillblade|r
step << Paladin
    #xprate >1.4999
    .goto Silvermoon City,80.16,60.24
    >>在|cRXP_FRIENDLY_Stillblade|r身上使用 |T134723:0|t[装满的微光容器]
    .complete 9685,1 --Resurrect Sangrias Stillblade (1)
    .target Blood Knight Stillblade
    .use 24184
step << Mage
    .goto Eversong Woods,55.70,54.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Antheol|r交谈
    .turnin 9404 >>交任务: |cRXP_FRIENDLY_活动的树木|r
    .train 1460,1
    .target Instructor Antheol
 step << Mage
    #completewith SMTraining2
    .goto Eversong Woods,56.51,49.61,25,0
    .goto Silvermoon City,73.39,59.65
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .train 1460,1
step << BloodElf Priest
    .goto Silvermoon City,69.27,77.00,8,0
    .goto Silvermoon City,68.13,74.07,8,0
    .goto Silvermoon City,66.56,73.29,8,0
    .goto Silvermoon City,65.53,72.60,8,0
    .goto Silvermoon City,72.4,85.7,40,0
    .goto Silvermoon City,53.93,71.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨斯雷|r交谈
    .turnin 9133 >>交任务: |cRXP_FRIENDLY_飞往银月城|r
    .accept 9134 >>接任务: |cRXP_LOOT_葛拉米|r
    .target Sathren Azuredawn
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.5
step << Priest
    .goto Silvermoon City,60.65,63.45,15,0
    .goto Silvermoon City,65.92,53.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维纳|r交谈
    >>|cRXP_BUY_如果价格便宜, 从拍卖行购买|r |T135144:0|t[强效魔法杖] |r
    >>|cRXP_WARN_如果它们都太贵, 就跳过这一步|r
    .collect 11288,1,9281,1 --Greater Magic Wand
    .target Vynna
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.5
step << BloodElf Priest
    .abandon 9133 >>放弃飞往银月城
step << Priest/Mage
    #completewith SMTraining2
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,62.89,31.26,30,0
    .goto Silvermoon City,57.45,24.46,15,0
    .goto Silvermoon City,55.31,24.96,15,0 << Priest
    .goto Silvermoon City,57.21,21.25,15,0 << Mage
    .goto Silvermoon City,55.38,26.76,12 >>前往|cRXP_FRIENDLY_洛塞兰|r << Priest
    .goto Silvermoon City,57.16,18.85,12 >>前往|cRXP_FRIENDLY_塞伊丹纳|r << Mage
step << Priest
    .goto Silvermoon City,55.38,26.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛塞兰|r交谈
    .train 8122 >>训练你的职业法术
    .target Lotheolan
	.xp <14,1
	.xp >16,1
step << Priest
    #label SMTraining2
    .goto Silvermoon City,55.38,26.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛塞兰|r交谈
    .train 8102 >>训练你的职业法术
    .target Lotheolan
	.xp <16,1
step << Mage
    #label SMtraining2
    .goto Silvermoon City,57.16,18.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞伊丹纳|r交谈
    .train 1460 >>训练你的职业法术
	.xp <14,1
step << !BloodElf Warlock
    #completewith SMTraining2
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,75.62,58.31,20,0
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,75.65,45.04,15,0
    .goto Silvermoon City,76.33,43.33,12 >>进入建筑内, 然后下楼梯
step << !BloodElf Warlock
    #label SMTraining2
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .train 6222 >>训练你的职业法术
    .target Talionia
    .xp <14,1
step << !Shaman !Warrior !BloodElf/!Warlock !Paladin !Rogue
    #xprate <1.5
    #completewith ManaEssence
    .hs >>传送至塔奎林
    .zoneskip Ghostlands
    .cooldown item,6948,>0 << !Druid
    .itemStat 16,QUALITY,<7 << Rogue
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8 << Rogue
step << !Shaman !Warrior !Druid !BloodElf/!Warlock !Paladin !Rogue
    #xprate <1.5
    #completewith next
    .goto Eversong Woods,56.52,49.83
    .zone Eversong Woods >>前往: |cRXP_PICK_永歌森林|r
    .zoneskip Ghostlands
    .cooldown item,6948,<0
    .itemStat 16,QUALITY,<7 << Rogue
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8 << Rogue
step << !Shaman !Warrior !Druid !BloodElf/!Warlock !Paladin
    #xprate <1.5
    #completewith next
    .goto Eversong Woods,54.37,50.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛拉米|r交谈
    .fly Tranquillien >>飞往塔奎林
    .target Skymistress Gloaming
    .cooldown item,6948,<0
    .zoneskip Ghostlands
    .itemStat 16,QUALITY,<7 << Rogue
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8 << Rogue
step << !Rogue !Shaman !Warrior !BloodElf/!Warlock
    #xprate >1.4999
    #completewith ManaEssence
    .hs >>传送至塔奎林
    .zoneskip Ghostlands
    .cooldown item,6948,>0 << !Druid
step << !Shaman !Warrior !Druid !BloodElf/!Warlock
    #xprate >1.4999
    #completewith next
    .goto Eversong Woods,56.52,49.83
    .zone Eversong Woods >>前往: |cRXP_PICK_永歌森林|r
    .zoneskip Ghostlands
    .cooldown item,6948,<0
    .xp <16,1 << Rogue
step << BloodElf Priest
    .goto Eversong Woods,54.37,50.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛拉米|r交谈
    .turnin 9134 >>交任务: |cRXP_FRIENDLY_葛拉米|r
    .accept 9135 >>接任务: |cRXP_LOOT_返回军需官雷米尔身边|r
    .target Skymistress Gloaming
    .cooldown item,6948,<0
    .zoneskip Ghostlands
step << !Shaman !Warrior !Druid !BloodElf/!Warlock
    #xprate >1.4999
    #completewith SanctumOTM
    .goto Eversong Woods,54.37,50.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛拉米|r交谈
    .fly Tranquillien >>飞往塔奎林
    .target Skymistress Gloaming
    .cooldown item,6948,<0
    .zoneskip Ghostlands
    .xp <16,1 << Rogue
step
    .goto Ghostlands,48.91,32.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板卡拉林|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133978:0|t[多汁的西瓜]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133978:0|t[多汁的西瓜]|r << Paladin
    .collect 1205,30,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (30)
    .collect 4538,20,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Snapvine Watermelon (20)
    .collect 4538,10,9281,1 << Paladin --Snapvine Watermelon (10)
    .target Innkeeper Kalarin
    .money <0.3000 << Priest/Mage/Warlock/Druid/Paladin
    .money <0.2000 << !Priest !Mage !Warlock !Druid !Paladin
    .money <0.4000 << Paladin
    .xp <15,1
    .xp >30,1
step
    .goto Ghostlands,48.91,32.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板卡拉林|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133978:0|t[多汁的西瓜]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133978:0|t[多汁的西瓜]|r << Paladin
    .collect 1205,20,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (20)
    .collect 4538,20,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Snapvine Watermelon (20)
    .collect 4538,10,9281,1 << Paladin --Snapvine Watermelon (10)
    .target Innkeeper Kalarin
    .money <0.2000 << !Paladin
    .money <0.3000 << Paladin
    .xp <15,1
    .xp >30,1
step
    .goto Ghostlands,48.91,32.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板卡拉林|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133978:0|t[多汁的西瓜]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133978:0|t[多汁的西瓜]|r << Paladin
    .collect 1205,10,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (10)
    .collect 4538,10,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Snapvine Watermelon (10)
    .collect 4538,10,9281,1 << Paladin --Snapvine Watermelon (10)
    .target Innkeeper Kalarin
    .money <0.1000 << !Paladin
    .money <0.2000 << Paladin
    .xp <15,1
    .xp >30,1
step << BloodElf Priest
    .goto Ghostlands,47.34,29.26
>>与|cRXP_FRIENDLY_军需官雷米尔|cRXP_FRIENDLY_军需官雷米尔|r交谈
    .turnin 9135 >>交任务: |cRXP_FRIENDLY_返回军需官雷米尔身边|r
    .target Quartermaster Lymel
    .isQuestComplete 9135
step << BloodElf Priest
    .abandon 9134 >>放弃葛拉米
step
    #completewith SanctumOTM
    >>击杀|cRXP_ENEMY_卢兹兰|r|cRXP_WARN_如果你能找到队伍来带你|r. 从他身上搜刮他的|cRXP_LOOT_头颅|r
    .complete 9156,2 --Luzran's Head (1)
    .mob Luzran
step
    #completewith next
    >>击杀|cRXP_ENEMY_笨拙的食尸者|r和|cRXP_ENEMY_复生的饥饿者|r. 击败|cRXP_ENEMY_复生的饥饿者|r可获得其|cRXP_LOOT_腐烂精华|r
    >>|cRXP_WARN_要小心|r|cRXP_ENEMY_笨拙的食尸者|r|cRXP_WARN_施法|r|T136224:0|t[狂怒]|cRXP_WARN_(生命值降低时造成更多伤害并提高攻击速度)|r
    >>|cRXP_WARN_请小心|r|cRXP_ENEMY_复生的饥饿者|r|cRXP_WARN_施法|r|T132278:0|t[吸血] |cRXP_WARN_(造成10点伤害并吸取生命)|r
    .complete 9155,1 --Kill Risen Hungerer (x10)
    .complete 9155,2 --Kill Gangled Cannibal (x10)
    .collect 22641,10,9216,1,-1 --Rotting Hearts (10)
    .mob Risen Hungerer
    .mob Gangled Cannibal
step
    #label SanctumOTM
    .goto Ghostlands,35.18,32.85,100 >>前往月亮圣殿
    .isOnQuest 9150
step
    #label ManaEssence
    .goto Ghostlands,35.18,32.85,40,0
    .goto Ghostlands,34.58,31.04,40,0
    .goto Ghostlands,33.15,30.13,40,0
    .goto Ghostlands,31.39,29.83,40,0
    .goto Ghostlands,30.52,31.32,40,0
    .goto Ghostlands,30.24,33.02,40,0
    .goto Ghostlands,32.08,34.65,40,0
    .goto Ghostlands,32.53,35.72,40,0
    .goto Ghostlands,33.63,36.13,40,0
    .goto Ghostlands,34.11,34.93,40,0
    .goto Ghostlands,35.18,32.85,40,0
    .goto Ghostlands,34.58,31.04,40,0
    .goto Ghostlands,33.15,30.13,40,0
    .goto Ghostlands,31.39,29.83,40,0
    .goto Ghostlands,30.52,31.32,40,0
    .goto Ghostlands,30.24,33.02,40,0
    .goto Ghostlands,32.08,34.65,40,0
    .goto Ghostlands,32.53,35.72,40,0
    .goto Ghostlands,33.63,36.13,40,0
    .goto Ghostlands,34.11,34.93
    >>击杀|cRXP_ENEMY_奥术吞噬者|r 和|cRXP_ENEMY_法力流窜者|r , 击败后拾取他们的|cRXP_LOOT_法力精华|r
    .complete 9150,1 --Collect Crystallized Mana Essence (x8)
    .mob Arcane Devourer
    .mob Mana Shifter
step
    .goto Ghostlands,33.55,26.55
    >>在商队中掠夺|cRXP_PICK_一箱补给品|r
    .complete 9152,1 --Collect Rathis Tomber's Supplies (x1)
step << !BloodElf/!Rogue
    #completewith Andaroth
    .goto Ghostlands,37.69,20.68,40,0
    >>击杀|cRXP_ENEMY_纺丝蜘蛛|r. 击杀后可掠夺其|cRXP_LOOT_蜘蛛腿|r`
    .collect 22644,5,9171,1 --Collect Crunchy Spider Leg (x5)
    .mob Spindleweb Spider
step << BloodElf Rogue
    #completewith KeltusD
    .goto Ghostlands,37.69,20.68,40,0
    >>击杀|cRXP_ENEMY_纺丝蜘蛛|r. 击杀后可掠夺其|cRXP_LOOT_蜘蛛腿|r`
    .collect 22644,5,9171,1 --Collect Crunchy Spider Leg (x5)
    .mob Spindleweb Spider
step
    #completewith Andaroth
    >>击杀|cRXP_ENEMY_Sentinel 间谍|r
    .complete 9160,1 --Kill Sentinel Spy (x12)
    .mob Sentinel Spy
step << BloodElf Rogue
    #label KeltusD
    .goto Ghostlands,32.97,11.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克尔图斯·暗叶|r交谈
    >>|cRXP_WARN_不要杀死|r|cRXP_ENEMY_哨兵队长|r
    >>|cRXP_FRIENDLY_Keltus|r|cRXP_WARN_ 的阶段机制可能出现异常. 如果他不在那里, 请游到永歌森林再返回|r
    .turnin 9532 >>交任务: |cRXP_FRIENDLY_找到克尔图斯·暗叶|r
    .accept 9460 >>接任务: |cRXP_LOOT_窃取情报|r
    .target Keltus Darkleaf
step << BloodElf Rogue
    #completewith next
    >>前往|cRXP_PICK_Shrine|r
    .complete 9160,2 --Investigate An'daroth
step << BloodElf Rogue
    .goto Ghostlands,37.05,14.03,30,0
    .goto Ghostlands,38.45,13.16,30,0
    .goto Ghostlands,37.33,13.50,30,0
    .goto Ghostlands,35.87,11.73,30,0
    .goto Ghostlands,35.41,11.93,30,0
    .goto Ghostlands,36.33,13.66,30,0
    .goto Ghostlands,35.98,14.48,30,0
    .goto Ghostlands,37.05,14.03,30,0
    .goto Ghostlands,38.45,13.16,30,0
    .goto Ghostlands,37.33,13.50,30,0
    .goto Ghostlands,35.87,11.73,30,0
    .goto Ghostlands,35.41,11.93,30,0
    .goto Ghostlands,36.33,13.66,30,0
    .goto Ghostlands,35.98,14.48
    >>|T132320:0|t[潜行] |cRXP_WARN_然后|r |T133644:0|t[扒窃] |cRXP_WARN_这个|r |cRXP_ENEMY_哨兵队长|r |cRXP_WARN_为她|r |cRXP_LOOT_花边手帕|r
    >>|cRXP_WARN_如果你激怒了她, 就跑开并重置她的仇恨|r
    .complete 9460,1 --Lacy Handkerchief (x1)
    .mob Sentinel Leader
step
    #label Andaroth
    .goto Ghostlands,36.94,15.73
    >>前往|cRXP_PICK_Shrine|r
    .complete 9160,2 --Investigate An'daroth
step
#loop
	.line Ghostlands,38.21,17.44,36.67,17.00,35.87,14.42,34.77,12.01,35.94,11.58,38.51,13.19,37.50,14.67,38.21,17.44
	.goto Ghostlands,38.21,17.44,35,0
	.goto Ghostlands,36.67,17.00,35,0
	.goto Ghostlands,35.87,14.42,35,0
	.goto Ghostlands,34.77,12.01,35,0
	.goto Ghostlands,35.94,11.58,35,0
	.goto Ghostlands,38.51,13.19,35,0
	.goto Ghostlands,37.50,14.67,35,0
	.goto Ghostlands,38.21,17.44,35,0
    >>击杀|cRXP_ENEMY_Sentinel 间谍|r
    .complete 9160,1 --Kill Sentinel Spy (x12)
    .mob Sentinel Spy
step
    #xprate <1.5
#loop
	.line Ghostlands,38.21,17.44,36.67,17.00,35.87,14.42,34.77,12.01,35.94,11.58,38.51,13.19,37.50,14.67,38.21,17.44
	.goto Ghostlands,38.21,17.44,35,0
	.goto Ghostlands,36.67,17.00,35,0
	.goto Ghostlands,35.87,14.42,35,0
	.goto Ghostlands,34.77,12.01,35,0
	.goto Ghostlands,35.94,11.58,35,0
	.goto Ghostlands,38.51,13.19,35,0
	.goto Ghostlands,37.50,14.67,35,0
	.goto Ghostlands,38.21,17.44,35,0
    .xp 14+5200 >>升级至5200+/12300经验值
step << BloodElf Rogue
    .goto Ghostlands,32.97,11.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克尔图斯·暗叶|r交谈
    .turnin 9460 >>交任务: |cRXP_FRIENDLY_窃取情报|r
    .accept 9618 >>接任务: |cRXP_LOOT_交回报告|r
    >>|cRXP_FRIENDLY_Keltus|r|cRXP_WARN_ 的阶段机制可能出现异常. 如果他不在那里, 请游到永歌森林再返回|r
    .target Keltus Darkleaf
step
    #completewith next
    >>击杀|cRXP_ENEMY_纳克雷洛特|r|cRXP_WARN_如果你能找到队伍带飞|r. 击败他后, 获取他的|cRXP_LOOT_头颅|r
    .complete 9156,1 --Knucklerot's Head (1)
    .mob Knucklerot
step
    .goto Ghostlands,29.08,15.17,30,0
    .goto Ghostlands,27.21,12.88,30,0
    .goto Ghostlands,25.83,14.98,30,0
    .goto Ghostlands,24.14,14.29,30,0
    .goto Ghostlands,23.41,16.01,30,0
    .goto Ghostlands,24.71,16.39,30,0
    .goto Ghostlands,26.35,17.43,30,0
    .goto Ghostlands,27.08,15.48,30,0
    .goto Ghostlands,29.08,15.17,30,0
    .goto Ghostlands,27.21,12.88,30,0
    .goto Ghostlands,25.83,14.98,30,0
    .goto Ghostlands,24.14,14.29,30,0
    .goto Ghostlands,23.41,16.01,30,0
    .goto Ghostlands,24.71,16.39,30,0
    .goto Ghostlands,26.35,17.43,30,0
    .goto Ghostlands,27.08,15.48
    >>击杀|cRXP_ENEMY_魔导师鬼魂|r和|cRXP_ENEMY_魔导师幽灵|r
    >>|cRXP_WARN_当他们的生命值低于50%时, 他们会施放|r|T136205:0|t[闪避]|cRXP_WARN_(增加躲闪几率), 请小心应对|r << Rogue/Paladin
    .complete 9139,1 --Kill Quel'dorei Ghost (x6)
    .complete 9139,2 --Kill Quel'dorei Wraith (x4)
    .mob Quel'dorei Ghost
    .mob Quel'dorei Wraith
step
    #completewith next
    >>击杀|cRXP_ENEMY_纺丝蜘蛛|r. 击杀后可掠夺其|cRXP_LOOT_蜘蛛腿|r`
    .collect 22644,5,9171,1 --Collect Crunchy Spider Leg (x5)
    .mob Spindleweb Spider
step
    #completewith next
    .goto Ghostlands,18.88,13.73,80 >>前往海岸
step
    .goto Ghostlands,18.88,13.73,40,0
    .goto Ghostlands,18.53,18.37,40,0
    .goto Ghostlands,19.44,20.80,40,0
    .goto Ghostlands,18.99,21.71,40,0
    .goto Ghostlands,19.93,23.83,40,0
    .goto Ghostlands,17.38,27.32,40,0
    .goto Ghostlands,18.16,10.60,40,0
    .goto Ghostlands,18.43,8.30,40,0
    .goto Ghostlands,18.54,6.17,40,0
    .goto Ghostlands,18.88,13.73,40,0
    .goto Ghostlands,18.53,18.37,40,0
    .goto Ghostlands,19.44,20.80,40,0
    .goto Ghostlands,18.99,21.71,40,0
    .goto Ghostlands,19.93,23.83,40,0
    .goto Ghostlands,17.38,27.32,40,0
    .goto Ghostlands,18.16,10.60,40,0
    .goto Ghostlands,18.43,8.30,40,0
    .goto Ghostlands,18.54,6.17
    >>击杀|cRXP_ENEMY_暗鳞僵尸|r 和|cRXP_ENEMY_衰老的暗鳞鱼人|r . 从它们身上搜刮出|cRXP_LOOT_染疫鱼人脊骨|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_暗鳞僵尸|r的 |T136066:0|t[发烧疲劳]|cRXP_WARN_(降低智力和精神各6点, 持续10分钟)|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_衰老的暗鳞鱼人|r 's|r|T135914:0|t[腐朽敏捷]|cRXP_WARN_(减少敏捷18点, 持续5分钟)|r  << !Mage !Priest !Warlock
    >>|cRXP_WARN_移出它们的近战范围以避免受到攻击|r
    .complete 9149,1 --Collect Plagued Murloc Spine (x6)
    .mob Zombified Grimscale
    .mob Withered Grimscale
step
    #completewith SLurker
    >>击杀|cRXP_ENEMY_纳克雷洛特|r|cRXP_WARN_如果你能找到队伍带飞|r. 击败他后, 获取他的|cRXP_LOOT_头颅|r
    .complete 9156,1 --Knucklerot's Head (1)
    .mob Knucklerot
step
    #completewith next
    >>击杀|cRXP_ENEMY_纺丝蜘蛛|r. 击杀后可掠夺其|cRXP_LOOT_蜘蛛腿|r`
    .collect 22644,5,9171,1 --Collect Crunchy Spider Leg (x5)
    .mob Spindleweb Spider
step
    .goto Ghostlands,27.40,38.73,100 >>穿过河流, 前往|cRXP_ENEMY_Spindleweb 纺丝潜伏者|r
    .isOnQuest 9159
step
    #completewith SLurker
    >>击杀|cRXP_ENEMY_吸血迷雾蝠|r
    >>|cRXP_WARN_小心他们的|r|T136130:0|t[吸血之触]|cRXP_WARN_吸血法术|r
    .complete 9159,1 --Kill Vampiric Mistbat (x10)
    .mob Vampiric Mistbat
step
#loop
	.line Ghostlands,26.17,37.11,24.52,39.78,25.64,42.73,25.18,44.78,27.23,44.19,27.81,42.02,29.30,41.97,31.41,42.20,32.04,43.60,34.11,42.43,35.24,41.73,35.69,38.63,32.27,39.40,29.89,36.61,26.17,37.11
	.goto Ghostlands,26.17,37.11,40,0
	.goto Ghostlands,24.52,39.78,40,0
	.goto Ghostlands,25.64,42.73,40,0
	.goto Ghostlands,25.18,44.78,40,0
	.goto Ghostlands,27.23,44.19,40,0
	.goto Ghostlands,27.81,42.02,40,0
	.goto Ghostlands,29.30,41.97,40,0
	.goto Ghostlands,31.41,42.20,40,0
	.goto Ghostlands,32.04,43.60,40,0
	.goto Ghostlands,34.11,42.43,40,0
	.goto Ghostlands,35.24,41.73,40,0
	.goto Ghostlands,35.69,38.63,40,0
	.goto Ghostlands,32.27,39.40,40,0
	.goto Ghostlands,29.89,36.61,40,0
	.goto Ghostlands,26.17,37.11,40,0
    >>击杀|cRXP_ENEMY_纺丝潜伏者|r. 掠夺其|cRXP_LOOT_蜘蛛腿|r
    >>|cRXP_WARN_小心他们的|r|T136016:0|t[毒液]
    .complete 9159,2 --Kill Spindleweb Lurker (x8)
    .collect 22644,5,9171,1,-1 --Collect Crunchy Spider Leg (x5)
    .mob Spindleweb Lurker
    .itemcount 22644,<5
step
    #label SLurker
#loop
	.line Ghostlands,26.17,37.11,24.52,39.78,25.64,42.73,25.18,44.78,27.23,44.19,27.81,42.02,29.30,41.97,31.41,42.20,32.04,43.60,34.11,42.43,35.24,41.73,35.69,38.63,32.27,39.40,29.89,36.61,26.17,37.11
	.goto Ghostlands,26.17,37.11,40,0
	.goto Ghostlands,24.52,39.78,40,0
	.goto Ghostlands,25.64,42.73,40,0
	.goto Ghostlands,25.18,44.78,40,0
	.goto Ghostlands,27.23,44.19,40,0
	.goto Ghostlands,27.81,42.02,40,0
	.goto Ghostlands,29.30,41.97,40,0
	.goto Ghostlands,31.41,42.20,40,0
	.goto Ghostlands,32.04,43.60,40,0
	.goto Ghostlands,34.11,42.43,40,0
	.goto Ghostlands,35.24,41.73,40,0
	.goto Ghostlands,35.69,38.63,40,0
	.goto Ghostlands,32.27,39.40,40,0
	.goto Ghostlands,29.89,36.61,40,0
	.goto Ghostlands,26.17,37.11,40,0
    >>击杀 |cRXP_ENEMY_纺丝潜伏者|r
    >>|cRXP_WARN_小心他们的|r|T136016:0|t[毒液]
    .complete 9159,2 --Kill Spindleweb Lurker (x8)
    .mob Spindleweb Lurker
    .itemcount 22644,5
step
    #completewith next
    >>击杀|cRXP_ENEMY_黑爪豺狼人|r和|cRXP_ENEMY_黑爪食腐者|r和|cRXP_ENEMY_黑爪萨满祭司|r
    >>|cRXP_WARN_暂时不要关注这个|r
    .complete 9192,1 --Kill Blackpaw Gnoll (x8)
    .complete 9192,2 --Kill Blackpaw Scavenger (x6)
    .complete 9192,3 --Kill Blackpaw Shaman (x4)
    .mob Blackpaw Gnoll
    .mob Blackpaw Scavenger
    .mob Blackpaw Shaman
step
    .goto Ghostlands,31.44,48.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shatharia|r交谈
    .accept 9207 >>接任务: |cRXP_LOOT_幽光矿石样本|r
    .target Apprentice Shatharia
step
    .goto Ghostlands,30.72,46.23,30,0
    .goto Ghostlands,30.26,45.12,30,0
    .goto Ghostlands,29.33,44.62,30,0
    .goto Ghostlands,28.56,46.32,30,0
    .goto Ghostlands,27.87,47.13,30,0
    .goto Ghostlands,26.97,47.44,30,0
    .goto Ghostlands,25.76,47.44,30,0
    .goto Ghostlands,25.24,49.18,30,0
    .goto Ghostlands,27.39,50.88,30,0
    .goto Ghostlands,29.01,50.36,30,0
    .goto Ghostlands,29.09,48.09,30,0
    .goto Ghostlands,31.27,48.98,30,0
    .goto Ghostlands,30.07,51.93,30,0
    .goto Ghostlands,28.68,52.86,30,0
    .goto Ghostlands,27.27,52.20,30,0
    .goto Ghostlands,26.85,46.23,30,0
    .goto Ghostlands,29.22,42.42,30,0
    .goto Ghostlands,31.60,44.47,30,0
    .goto Ghostlands,30.72,46.23
    >>击杀|cRXP_ENEMY_黑爪豺狼人|r和|cRXP_ENEMY_黑爪食腐者|r和|cRXP_ENEMY_黑爪萨满祭司|r, 掠夺他们的|cRXP_LOOT_幽光矿石|r
    >>|cRXP_WARN_你也可以在|r|cRXP_PICK_幽光矿石|r|cRXP_WARN_幽光矿洞| 中的矿脉上采集|r
    .complete 9192,1 --Kill Blackpaw Gnoll (x8)
    .complete 9192,2 --Kill Blackpaw Scavenger (x6)
    .complete 9192,3 --Kill Blackpaw Shaman (x4)
    .complete 9207,1 --Collect Underlight Ore (x6)
    .mob Blackpaw Gnoll
    .mob Blackpaw Scavenger
    .mob Blackpaw Shaman
    .skill mining,1
step
    .goto Ghostlands,30.72,46.23,30,0
    .goto Ghostlands,30.26,45.12,30,0
    .goto Ghostlands,29.33,44.62,30,0
    .goto Ghostlands,28.56,46.32,30,0
    .goto Ghostlands,27.87,47.13,30,0
    .goto Ghostlands,26.97,47.44,30,0
    .goto Ghostlands,25.76,47.44,30,0
    .goto Ghostlands,25.24,49.18,30,0
    .goto Ghostlands,27.39,50.88,30,0
    .goto Ghostlands,29.01,50.36,30,0
    .goto Ghostlands,29.09,48.09,30,0
    .goto Ghostlands,31.27,48.98,30,0
    .goto Ghostlands,30.07,51.93,30,0
    .goto Ghostlands,28.68,52.86,30,0
    .goto Ghostlands,27.27,52.20,30,0
    .goto Ghostlands,26.85,46.23,30,0
    .goto Ghostlands,29.22,42.42,30,0
    .goto Ghostlands,31.60,44.47,30,0
    .goto Ghostlands,30.72,46.23
    >>击杀|cRXP_ENEMY_黑爪豺狼人|r和|cRXP_ENEMY_黑爪食腐者|r和|cRXP_ENEMY_黑爪萨满祭司|r, 掠夺他们的|cRXP_LOOT_幽光矿石|r
    .complete 9192,1 --Kill Blackpaw Gnoll (x8)
    .complete 9192,2 --Kill Blackpaw Scavenger (x6)
    .complete 9192,3 --Kill Blackpaw Shaman (x4)
    .complete 9207,1 --Collect Underlight Ore (x6)
    .mob Blackpaw Gnoll
    .mob Blackpaw Scavenger
    .mob Blackpaw Shaman
step
    #completewith Hungerers
    >>击杀|cRXP_ENEMY_纳克雷洛特|r|cRXP_WARN_如果你能找到队伍带飞|r. 击败他后, 获取他的|cRXP_LOOT_头颅|r
    .complete 9156,1 --Knucklerot's Head (1)
    .mob Knucklerot
step
    #completewith Hungerers
    >>击杀|cRXP_ENEMY_卢兹兰|r|cRXP_WARN_如果你能找到队伍来带你|r. 从他身上搜刮他的|cRXP_LOOT_头颅|r
    .complete 9156,2 --Luzran's Head (1)
    .mob Luzran
step
    #label Hungerers
    .goto Ghostlands,37.13,48.38,40,0
    .goto Ghostlands,37.63,45.56,40,0
    .goto Ghostlands,39.64,43.05,40,0
    .goto Ghostlands,37.56,41.68,40,0
    .goto Ghostlands,39.82,39.35,40,0
    .goto Ghostlands,37.78,38.23,40,0
    .goto Ghostlands,39.66,35.69,40,0
    .goto Ghostlands,38.29,33.03,40,0
    .goto Ghostlands,40.23,31.75,40,0
    .goto Ghostlands,38.77,29.82,40,0
    .goto Ghostlands,40.76,28.98,40,0
    .goto Ghostlands,37.13,48.38,40,0
    .goto Ghostlands,37.63,45.56,40,0
    .goto Ghostlands,39.64,43.05,40,0
    .goto Ghostlands,37.56,41.68,40,0
    .goto Ghostlands,39.82,39.35,40,0
    .goto Ghostlands,37.78,38.23,40,0
    .goto Ghostlands,39.66,35.69,40,0
    .goto Ghostlands,38.29,33.03,40,0
    .goto Ghostlands,40.23,31.75,40,0
    .goto Ghostlands,38.77,29.82,40,0
    .goto Ghostlands,40.76,28.98
    >>击杀|cRXP_ENEMY_笨拙的食尸者|r和|cRXP_ENEMY_复生的饥饿者|r. 击败|cRXP_ENEMY_复生的饥饿者|r以获取其掉落的|cRXP_LOOT_腐烂精华|r
    >>|cRXP_WARN_要小心|r|cRXP_ENEMY_笨拙的食尸者|r|cRXP_WARN_施法|r|T136224:0|t[狂怒]|cRXP_WARN_(生命值降低时造成更多伤害并提高攻击速度)|r
    >>|cRXP_WARN_请小心|r|cRXP_ENEMY_复生的饥饿者|r|cRXP_WARN_施法|r|T132278:0|t[吸血] |cRXP_WARN_(造成10点伤害并吸取生命)|r
    >>|cRXP_ENEMY_笨拙的食尸者|r|cRXP_WARN_和 |cRXP_ENEMY_复生的饥饿者|r会共享刷新点. 击杀两者即可触发你需要的怪物刷新|r
    .complete 9155,1 --Kill Risen Hungerer (x10)
    .complete 9155,2 --Kill Gangled Cannibal (x10)
    .collect 22641,10,9216,1,-1 --Rotting Hearts (10)
    .mob Risen Hungerer
    .mob Gangled Cannibal
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vandril|r和|cRXP_FRIENDLY_Rathis|r和|cRXP_FRIENDLY_Mouldier|r交谈
    .turnin 9139 >>交任务: |cRXP_FRIENDLY_金雾村|r
    .goto Ghostlands,46.08,28.33,10,0
    .goto Ghostlands,46.55,28.38
    .accept 9140 >>接任务: |cRXP_LOOT_风行村|r
    .turnin 9152 >>交任务: |cRXP_FRIENDLY_托博尔的补给品|r
    .goto Ghostlands,47.14,28.30,10,0
    .goto Ghostlands,47.27,28.59
    .accept 9171 >>接任务: |cRXP_LOOT_松脆蜘蛛腿|r
    .turnin 9171 >>交任务: |cRXP_FRIENDLY_松脆蜘蛛腿|r
    .goto Ghostlands,48.43,30.93
    .target Arcanist Vandril
    .target Rathis Tomber
    .target Master Chef Mouldier
    .itemcount 22644,5
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vandril|r和|cRXP_FRIENDLY_Rathis|r交谈
    .turnin 9139 >>交任务: |cRXP_FRIENDLY_金雾村|r
    .goto Ghostlands,46.08,28.33,10,0
    .goto Ghostlands,46.55,28.38
    .accept 9140 >>接任务: |cRXP_LOOT_风行村|r
    .turnin 9152 >>交任务: |cRXP_FRIENDLY_托博尔的补给品|r
    .goto Ghostlands,47.14,28.30,10,0
    .goto Ghostlands,47.27,28.59
    .target Arcanist Vandril
    .target Rathis Tomber
    .itemcount 22644,<5
step
    .goto Ghostlands,48.91,32.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板卡拉林|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133978:0|t[多汁的西瓜]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133978:0|t[多汁的西瓜]|r << Paladin
    .collect 1205,30,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (30)
    .collect 4538,20,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Snapvine Watermelon (20)
    .collect 4538,10,9281,1 << Paladin --Snapvine Watermelon (10)
    .target Innkeeper Kalarin
    .money <0.3000 << Priest/Mage/Warlock/Druid/Paladin
    .money <0.2000 << !Priest !Mage !Warlock !Druid !Paladin
    .money <0.4000 << Paladin
    .xp <15,1
    .xp >30,1
step
    .goto Ghostlands,48.91,32.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板卡拉林|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133978:0|t[多汁的西瓜]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133978:0|t[多汁的西瓜]|r << Paladin
    .collect 1205,20,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (20)
    .collect 4538,20,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Snapvine Watermelon (20)
    .collect 4538,10,9281,1 << Paladin --Snapvine Watermelon (10)
    .target Innkeeper Kalarin
    .money <0.2000 << !Paladin
    .money <0.3000 << Paladin
    .xp <15,1
    .xp >30,1
step
    .goto Ghostlands,48.91,32.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板卡拉林|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133978:0|t[多汁的西瓜]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133978:0|t[多汁的西瓜]|r << Paladin
    .collect 1205,10,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (10)
    .collect 4538,10,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Snapvine Watermelon (10)
    .collect 4538,10,9281,1 << Paladin --Snapvine Watermelon (10)
    .target Innkeeper Kalarin
    .money <0.1000 << !Paladin
    .money <0.2000 << Paladin
    .xp <15,1
    .xp >30,1
step << Paladin
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132492:0|t[宁静防御者腰带]|r
    .collect 28162,1,9281,1 --Collect Tranquillien Defender's Girdle (1)
    .target Provisioner Vredigar
    .reputation 922,honored,<0,1
    .itemStat 6,LEVEL,<17
step << Paladin
    #completewith Clearing
    +装备 |T132492:0|t[塔奎林防御者腰带]
    .use 28162
    .itemcount 28162,1
    .itemStat 6,LEVEL,<17
step << Rogue/Hunter/Druid/Shaman
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r |T132498:0|t[蝙蝠皮腰带] |r
    .collect 28158,1,9281,1 --Collect Batskin Belt (1)
    .target Provisioner Vredigar
    .reputation 922,honored,<0,1
    .itemStat 6,LEVEL,<17
step << Rogue/Hunter/Druid/Shaman
    #completewith Clearing
    +装备 |T132498:0|t[蝙蝠皮腰带]
    .use 28158
    .itemcount 28158,1
    .itemStat 6,LEVEL_SHORT,<5
step << Rogue
    .goto Ghostlands,47.67,34.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Renzithen|r交谈
    .turnin 9149 >>交任务: |cRXP_FRIENDLY_瘟疫海岸|r
    .target Apothecary Renzithen
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135427:0|t[穿喉者]|cRXP_BUY_和|r|T135344:0|t[邪恶军刀]|cRXP_BUY_, 如果它们在售的话|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.7517 << BloodElf/Undead
    .money <0.7893 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果价格合适, 请从她那里购买|r|T135344:0|t[邪恶军刀]|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.6947 << BloodElf/Undead
    .money <0.7294 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,>7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果有的话, 从她那里购买|r|T135427:0|t[穿喉者]|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.0570 << BloodElf/Undead
    .money <0.0599 << Orc/Troll
    .itemStat 16,QUALITY,>7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #label Eralan1
    #completewith Clearing
    +装备 |T135427:0|t[穿喉者] 和 |T135344:0|t[邪恶军刀]
    .use 29584
    .use 29583
    .itemcount 29584,1
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #requires Eralan1
    #completewith Clearing
    +装备 |T135344:0|t[邪恶军刀]
    .use 29583
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
step << Rogue
    #requires Eralan1
    #completewith Clearing
    +装备 |T135427:0|t[穿喉者]
    .use 29584
    .itemcount 29584,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Renzithen|r和|cRXP_FRIENDLY_Rathiel|r和Dame和|cRXP_FRIENDLY_Mavren|r和|cRXP_FRIENDLY_Maltendis|r和|cRXP_FRIENDLY_Darenis|r交谈
    .turnin 9149 >>交任务: |cRXP_FRIENDLY_瘟疫海岸|r
    .goto Ghostlands,47.67,34.87
    .turnin 9155 >>交任务: |cRXP_FRIENDLY_前往死亡之痕|r
    .turnin 9156 >>交任务: |cRXP_FRIENDLY_通缉：纳克雷洛特和卢兹兰|r
    .goto Ghostlands,46.02,33.58
    .turnin 9160 >>交任务: |cRXP_FRIENDLY_调查安达洛斯|r
    .accept 9163 >>接任务: |cRXP_LOOT_深入敌境|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.88,32.51
    .accept 9173 >>接任务: |cRXP_LOOT_夺回风行者之塔|r
    .goto Ghostlands,44.77,32.44
    .turnin 9192 >>交任务: |cRXP_FRIENDLY_幽光矿洞的麻烦|r
    .goto Ghostlands,44.74,32.28
    .turnin 9150 >>交任务: |cRXP_FRIENDLY_重建历史|r
    .accept 9151 >>接任务: |cRXP_LOOT_太阳圣殿|r
    .goto Ghostlands,46.02,31.95
    .target Apothecary Renzithen
    .target Deathstalker Rathiel
    .target Dame Auriferous
    .target High Executor Mavren
    .target Deathstalker Maltendis
    .target Magister Darenis
    .isQuestComplete 9156
    .xp <17,1
 step << !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Renzithen|r和|cRXP_FRIENDLY_Rathiel|r和Dame和|cRXP_FRIENDLY_Mavren|r和|cRXP_FRIENDLY_Maltendis|r和|cRXP_FRIENDLY_Darenis|r交谈
    .turnin 9149 >>交任务: |cRXP_FRIENDLY_瘟疫海岸|r
    .goto Ghostlands,47.67,34.87
    .turnin 9155 >>交任务: |cRXP_FRIENDLY_前往死亡之痕|r
    .goto Ghostlands,46.02,33.58
    .turnin 9160 >>交任务: |cRXP_FRIENDLY_调查安达洛斯|r
    .accept 9163 >>接任务: |cRXP_LOOT_深入敌境|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.88,32.51
    .accept 9173 >>接任务: |cRXP_LOOT_夺回风行者之塔|r
    .goto Ghostlands,44.77,32.44
    .turnin 9192 >>交任务: |cRXP_FRIENDLY_幽光矿洞的麻烦|r
    .goto Ghostlands,44.74,32.28
    .turnin 9150 >>交任务: |cRXP_FRIENDLY_重建历史|r
    .accept 9151 >>接任务: |cRXP_LOOT_太阳圣殿|r
    .goto Ghostlands,46.02,31.95
    .target Apothecary Renzithen
    .target Deathstalker Rathiel
    .target Dame Auriferous
    .target High Executor Mavren
    .target Deathstalker Maltendis
    .target Magister Darenis
    .xp <17,1
step << !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Renzithen|r和|cRXP_FRIENDLY_Rathiel|r和Dame和|cRXP_FRIENDLY_Mavren|r和|cRXP_FRIENDLY_Maltendis|r和|cRXP_FRIENDLY_Darenis|r交谈
    .turnin 9149 >>交任务: |cRXP_FRIENDLY_瘟疫海岸|r
    .goto Ghostlands,47.67,34.87
    .turnin 9155 >>交任务: |cRXP_FRIENDLY_前往死亡之痕|r
    .turnin 9156 >>交任务: |cRXP_FRIENDLY_通缉：纳克雷洛特和卢兹兰|r
    .goto Ghostlands,46.02,33.58
    .turnin 9160 >>交任务: |cRXP_FRIENDLY_调查安达洛斯|r
    .accept 9163 >>接任务: |cRXP_LOOT_深入敌境|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.88,32.51
    .accept 9173 >>接任务: |cRXP_LOOT_夺回风行者之塔|r
    .goto Ghostlands,44.77,32.44
    .turnin 9192 >>交任务: |cRXP_FRIENDLY_幽光矿洞的麻烦|r
    .goto Ghostlands,44.74,32.28
    .turnin 9150 >>交任务: |cRXP_FRIENDLY_重建历史|r
    .goto Ghostlands,46.02,31.95
    .target Apothecary Renzithen
    .target Deathstalker Rathiel
    .target Dame Auriferous
    .target High Executor Mavren
    .target Deathstalker Maltendis
    .target Magister Darenis
    .isQuestComplete 9156
step << !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Renzithen|r和|cRXP_FRIENDLY_Rathiel|r和Dame和|cRXP_FRIENDLY_Mavren|r和|cRXP_FRIENDLY_Maltendis|r和|cRXP_FRIENDLY_Darenis|r交谈
    .turnin 9149 >>交任务: |cRXP_FRIENDLY_瘟疫海岸|r
    .goto Ghostlands,47.67,34.87
    .turnin 9155 >>交任务: |cRXP_FRIENDLY_前往死亡之痕|r
    .goto Ghostlands,46.02,33.58
    .turnin 9160 >>交任务: |cRXP_FRIENDLY_调查安达洛斯|r
    .accept 9163 >>接任务: |cRXP_LOOT_深入敌境|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.88,32.51
    .accept 9173 >>接任务: |cRXP_LOOT_夺回风行者之塔|r
    .goto Ghostlands,44.77,32.44
    .turnin 9192 >>交任务: |cRXP_FRIENDLY_幽光矿洞的麻烦|r
    .goto Ghostlands,44.74,32.28
    .turnin 9150 >>交任务: |cRXP_FRIENDLY_重建历史|r
    .goto Ghostlands,46.02,31.95
    .target Apothecary Renzithen
    .target Deathstalker Rathiel
    .target Dame Auriferous
    .target High Executor Mavren
    .target Deathstalker Maltendis
    .target Magister Darenis
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rathiel|r和|cRXP_FRIENDLY_Dame|r和|cRXP_FRIENDLY_Mavren|r和|cRXP_FRIENDLY_Maltendis|r和|cRXP_FRIENDLY_Darenis|r交谈
    .turnin 9155 >>交任务: |cRXP_FRIENDLY_前往死亡之痕|r
    .turnin 9156 >>交任务: |cRXP_FRIENDLY_通缉：纳克雷洛特和卢兹兰|r
    .goto Ghostlands,46.02,33.58
    .turnin 9160 >>交任务: |cRXP_FRIENDLY_调查安达洛斯|r
    .accept 9163 >>接任务: |cRXP_LOOT_深入敌境|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.88,32.51
    .accept 9173 >>接任务: |cRXP_LOOT_夺回风行者之塔|r
    .goto Ghostlands,44.77,32.44
    .turnin 9192 >>交任务: |cRXP_FRIENDLY_幽光矿洞的麻烦|r
    .goto Ghostlands,44.74,32.28
    .turnin 9150 >>交任务: |cRXP_FRIENDLY_重建历史|r
    .accept 9151 >>接任务: |cRXP_LOOT_太阳圣殿|r
    .goto Ghostlands,46.02,31.95
    .target Deathstalker Rathiel
    .target Dame Auriferous
    .target High Executor Mavren
    .target Deathstalker Maltendis
    .target Magister Darenis
    .isQuestComplete 9156
    .xp <17,1
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rathiel|r和|cRXP_FRIENDLY_Dame|r和|cRXP_FRIENDLY_Mavren|r和|cRXP_FRIENDLY_Maltendis|r和|cRXP_FRIENDLY_Darenis|r交谈
    .turnin 9155 >>交任务: |cRXP_FRIENDLY_前往死亡之痕|r
    .goto Ghostlands,46.02,33.58
    .turnin 9160 >>交任务: |cRXP_FRIENDLY_调查安达洛斯|r
    .accept 9163 >>接任务: |cRXP_LOOT_深入敌境|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.88,32.51
    .accept 9173 >>接任务: |cRXP_LOOT_夺回风行者之塔|r
    .goto Ghostlands,44.77,32.44
    .turnin 9192 >>交任务: |cRXP_FRIENDLY_幽光矿洞的麻烦|r
    .goto Ghostlands,44.74,32.28
    .turnin 9150 >>交任务: |cRXP_FRIENDLY_重建历史|r
    .accept 9151 >>接任务: |cRXP_LOOT_太阳圣殿|r
    .goto Ghostlands,46.02,31.95
    .target Deathstalker Rathiel
    .target Dame Auriferous
    .target High Executor Mavren
    .target Deathstalker Maltendis
    .target Magister Darenis
    .xp <17,1
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rathiel|r和|cRXP_FRIENDLY_Dame|r和|cRXP_FRIENDLY_Mavren|r和|cRXP_FRIENDLY_Maltendis|r和|cRXP_FRIENDLY_Darenis|r交谈
    .turnin 9155 >>交任务: |cRXP_FRIENDLY_前往死亡之痕|r
    .turnin 9156 >>交任务: |cRXP_FRIENDLY_通缉：纳克雷洛特和卢兹兰|r
    .goto Ghostlands,46.02,33.58
    .turnin 9160 >>交任务: |cRXP_FRIENDLY_调查安达洛斯|r
    .accept 9163 >>接任务: |cRXP_LOOT_深入敌境|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.88,32.51
    .accept 9173 >>接任务: |cRXP_LOOT_夺回风行者之塔|r
    .goto Ghostlands,44.77,32.44
    .turnin 9192 >>交任务: |cRXP_FRIENDLY_幽光矿洞的麻烦|r
    .goto Ghostlands,44.74,32.28
    .turnin 9150 >>交任务: |cRXP_FRIENDLY_重建历史|r
    .goto Ghostlands,46.02,31.95
    .target Deathstalker Rathiel
    .target Dame Auriferous
    .target High Executor Mavren
    .target Deathstalker Maltendis
    .target Magister Darenis
    .isQuestComplete 9156
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rathiel|r和|cRXP_FRIENDLY_Dame|r和|cRXP_FRIENDLY_Mavren|r和|cRXP_FRIENDLY_Maltendis|r和|cRXP_FRIENDLY_Darenis|r交谈
    .turnin 9155 >>交任务: |cRXP_FRIENDLY_前往死亡之痕|r
    .goto Ghostlands,46.02,33.58
    .turnin 9160 >>交任务: |cRXP_FRIENDLY_调查安达洛斯|r
    .accept 9163 >>接任务: |cRXP_LOOT_深入敌境|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.88,32.51
    .accept 9173 >>接任务: |cRXP_LOOT_夺回风行者之塔|r
    .goto Ghostlands,44.77,32.44
    .turnin 9192 >>交任务: |cRXP_FRIENDLY_幽光矿洞的麻烦|r
    .goto Ghostlands,44.74,32.28
    .turnin 9150 >>交任务: |cRXP_FRIENDLY_重建历史|r
    .goto Ghostlands,46.02,31.95
    .target Deathstalker Rathiel
    .target Dame Auriferous
    .target High Executor Mavren
    .target Deathstalker Maltendis
    .target Magister Darenis
step
    .goto Ghostlands,46.02,31.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师戴伦尼斯|r交谈
    .accept 9151 >>接任务: |cRXP_LOOT_太阳圣殿|r
    .target Apothecary Renzithen
    .target Magister Darenis
    .xp <17,1
step << Druid
	#completewith DruidTrain2
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
	.xp <16,1
step << Druid
    .goto Moonglade,52.53,40.57
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 783 >>训练你的职业法术 << wotlk
    .train 8925 >>训练你的职业法术 << TBC
	.target Loganaar
    .cooldown item,6948,>0
	.xp <16,1
    .xp >18,1
step << Druid
    #label DruidTrain2
    .goto Moonglade,52.53,40.57
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 8938 >>训练你的职业法术
	.target Loganaar
    .cooldown item,6948,>0
	.xp <18,1
step << !Druid !Shaman !Warrior !Paladin
    #xprate >1.4999
    #completewith SMTraining3
    .goto Ghostlands,45.42,30.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阳翼|r交谈
    .fly Silvermoon >>飞往银月城
    .target Skymaster Sunwing
    .train 6761,1 << Rogue
step << !Druid !Shaman !Warrior
    #xprate <1.5
    #completewith SMTraining3
    .goto Ghostlands,45.42,30.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阳翼|r交谈
    .fly Silvermoon >>飞往银月城
    .target Skymaster Sunwing
    .train 6761,1 << Rogue
step << Mage
    .goto Eversong Woods,55.70,54.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Antheol|r交谈
    .turnin 9404 >>交任务: |cRXP_FRIENDLY_活动的树木|r
    .train 3140,1
    .target Instructor Antheol
step << !Druid !Shaman !Warrior !Paladin
    #xprate >1.4999
    #completewith SMTraining3
    .goto Eversong Woods,56.51,49.61,25,0
    .goto Silvermoon City,73.39,59.65
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .train 6761,1 << Rogue
step << !Druid !Shaman !Warrior
    #xprate <1.5
    #completewith SMTraining3
    .goto Eversong Woods,56.51,49.61,25,0
    .goto Silvermoon City,73.39,59.65
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .train 6761,1 << Rogue
step << Rogue
    #completewith SMTraining3
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,76.55,52.05,20,0
    .goto Silvermoon City,79.70,52.16,20 >>前往|cRXP_FRIENDLY_瑟兰尼斯|r
    .train 6761,1 << Rogue
step << Rogue
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    .turnin 9618 >>交任务: |cRXP_FRIENDLY_交回报告|r << BloodElf
    .accept 10372 >>接任务: |cRXP_LOOT_谨慎的询问|r
    .train 6761 >>训练你的职业法术
    .target Zelanis
    .train 6761,1
step << Rogue
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    >>|cRXP_WARN_确保你已训练过|r|T136058:0|t[开锁]|cRXP_WARN_, 以便完成后续任务|r
    .turnin 9618 >>交任务: |cRXP_FRIENDLY_交回报告|r << BloodElf
    .accept 10372 >>接任务: |cRXP_LOOT_谨慎的询问|r
    .train 1804 >>训练你的职业法术
    .target Zelanis
    .train 1804,1
step << Rogue
    #label SMTraining3
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    .turnin 9618 >>交任务: |cRXP_FRIENDLY_交回报告|r << BloodElf
    .accept 10372 >>接任务: |cRXP_LOOT_谨慎的询问|r
    .target Zelanis
step << Rogue
    #completewith Scimitars
    .goto Silvermoon City,62.89,31.26,30,0
    .goto Silvermoon City,51.83,17.91,30,0
    .goto Silvermoon City,49.45,15.00
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    #completewith Scimitars
    .goto Undercity,59.81,11.33,20,0
    .goto Undercity,66.08,18.24,30,0
    .goto Undercity,66.04,32.97,30,0
    .goto Undercity,65.97,44.08,30,0
    .goto Undercity,60.52,44.02,10,0
    .goto Undercity,60.07,47.70,10 >>乘坐升降梯前往幽暗城
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << !Undead Rogue
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fp Undercity >>获取幽暗城飞行路径
    .target Michael Garrett
    .itemcount 2027,<2
    .money <0.7632 << Troll/Orc
    .money <0.7250 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << !Undead Rogue
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fp Undercity >>获取幽暗城飞行路径
    .target Michael Garrett
    .itemcount 2027,<1
    .money <0.3816 << Troll/Orc
    .money <0.3625 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    .goto Undercity,61.15,40.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_路易斯|r交谈
    >>|cRXP_BUY_从他那里购买两把|r|T135343:0|t[战士阔剑]|r
    .collect 2027,2,9144,1 --Scimitar (2)
    .target Louis Warren
    .itemcount 2027,<2
    .money <0.7632 << Troll/Orc
    .money <0.7250 << Undead/BloodElf
    .xp <12,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    #label Scimitars
    .goto Undercity,61.15,40.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_路易斯|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135343:0|t[战士阔剑]|r
    .collect 2027,1,9144,1 --Scimitar (1)
    .target Louis Warren
    .itemcount 2027,<1
    .money <0.3816 << Troll/Orc
    .money <0.3625 << Undead/BloodElf
    .xp <12,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    #completewith Clearing
    .hs >>传送至塔奎林
    .zoneskip Ghostlands
    .cooldown item,6948,>0
step << Rogue
    #completewith next
    .goto Undercity,60.07,47.70,10,0
    .goto Undercity,60.52,44.02,10,0
    .goto Undercity,65.97,44.08,30,0
    .goto Undercity,66.04,32.97,30,0
    .goto Undercity,66.08,18.24,30,0
    .goto Undercity,59.81,11.33,20,0 >>乘坐升降梯返回银月城
    .cooldown item,6948,<0
    .zoneskip Silvermoon City
    .zoneskip Eversong Woods
    .zoneskip Ghostlands
step << Rogue
    .goto Undercity,59,91,11.32,20,0
    .goto Undercity,54.67,11.25
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .cooldown item,6948,<0
    .zoneskip Eversong Woods
    .zoneskip Ghostlands
step << Priest/Mage
    #completewith SMTraining3
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,62.89,31.26,30,0
    .goto Silvermoon City,57.45,24.46,15,0
    .goto Silvermoon City,55.31,24.96,15,0 << Priest
    .goto Silvermoon City,57.21,21.25,15,0 << Mage
    .goto Silvermoon City,55.38,26.76,12 >>前往|cRXP_FRIENDLY_洛塞兰|r << Priest
    .goto Silvermoon City,57.16,18.85,12 >>前往|cRXP_FRIENDLY_塞伊丹纳|r << Mage
step << Priest
    .goto Silvermoon City,55.38,26.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛塞兰|r交谈
    .train 8102 >>训练你的职业法术
    .target Lotheolan
	.xp <16,1
	.xp >18,1
step << Priest
    #label SMTraining3
    .goto Silvermoon City,55.38,26.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛塞兰|r交谈
    .train 970 >>训练你的职业法术
    .target Lotheolan
    .train 8102,1
	.xp <18,1
step << Mage
    #label SMTraining3
    .goto Silvermoon City,57.16,18.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞伊丹纳|r交谈
    .train 3140 >>训练你的职业法术
    .target Zaedana
	.xp <18,1
step << Hunter
    #completewith next
    .goto Silvermoon City,83.52,48.68,30,0
    .goto Silvermoon City,83.50,43.40,20,0
    .goto Silvermoon City,82.20,28.06,15 >>前往|cRXP_FRIENDLY_塞兰娜|r
step << Hunter
    .goto Silvermoon City,86.24,35.45
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞兰娜|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135346:0|t[强化弓]|r
    .collect 3026,1,9181,1 --Reinforced Bow (1)
    .target Celana
    .money <0.3621 << BloodElf
    .money <0.3812 << Troll/Orc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.7
step << Hunter
    #completewith SMTraining3
    .goto Silvermoon City,83.45,30.13,15,0
    .goto Silvermoon City,83.45,28.56,15,0
    .goto Silvermoon City,84.71,28.05,15 >>前往|cRXP_FRIENDLY_桑迪恩|r
    .itemcount 3026,1
step << Hunter
    #completewith SMTraining3
    .goto Silvermoon City,83.52,48.68,30,0
    .goto Silvermoon City,83.50,43.40,20,0
    .goto Silvermoon City,83.45,30.13,15,0
    .goto Silvermoon City,83.45,28.56,15,0
    .goto Silvermoon City,84.71,28.05,15 >>前往|cRXP_FRIENDLY_桑迪恩|r
    .itemcount 3026,<1
step << Hunter
    .goto Silvermoon City,84.71,28.05
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪恩|r交谈
    .train 13795 >>训练你的职业法术 << tbc
    .train 5118 >>训练你的职业法术 << wotlk
    .target Zandine
	.xp <16,1
	.xp >18,1
step << Hunter
    #label SMTraining3
    .goto Silvermoon City,84.71,28.05
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪恩|r交谈
    .train 14318 >>训练你的职业法术
    .target Zandine
	.xp <18,1
step << Hunter
    .goto Silvermoon City,86.24,35.45
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞兰娜|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135346:0|t[强化弓]|r
    .collect 3026,1,9181,1 --Reinforced Bow (1)
    .target Celana
    .money <0.3621 << BloodElf
    .money <0.3812 << Troll/Orc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.7
step << Warlock
    #completewith SMTraining3
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,75.62,58.31,20,0
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,75.65,45.04,15,0
    .goto Silvermoon City,76.33,43.33,12 >>进入建筑内, 然后下楼梯
step << Warlock
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .train 6222 >>训练你的职业法术
    .target Talionia
    .xp <14,1
    .xp >18,1
step << Warlock
    #label SMTraining3
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .train 1014 >>训练你的职业法术
    .target Talionia
    .xp <18,1
step << Paladin
    #xprate <1.5
    #completewith next
    .goto Silvermoon City,82.03,68.36,25,0
    .goto Silvermoon City,84.63,48.65,25,0
    .goto Silvermoon City,84.65,43.43,25,0
    .goto Silvermoon City,89.00,36.95,15,0
    .goto Silvermoon City,89.26,35.20,15 >>前往|cRXP_FRIENDLY_Bloodvalor|r
step << Paladin
    #xprate <1.5
    .goto Silvermoon City,89.26,35.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bloodvalor|r交谈
    .turnin 9678 >>交任务: |cRXP_FRIENDLY_第一项试炼|r
    .accept 9681 >>接任务: |cRXP_LOOT_掌握力量|r
    .target Knight-Lord Bloodvalor
step << Paladin
    #xprate <1.5
    .goto Silvermoon City,91.74,35.35,12,0
    .goto Silvermoon City,92.20,37.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bachi|r交谈
    .train 647 >>训练你的职业法术
    .target Champion Bachi
    .xp <14,1
    .xp >16,1
step << Paladin
    #xprate <1.5
    #label SMTraining3
    .goto Silvermoon City,91.74,35.35,12,0
    .goto Silvermoon City,92.20,37.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bachi|r交谈
    .train 7294 >>训练你的职业法术 << tbc
    .train 62124 >>训练你的职业法术 << wotlk
    .target Champion Bachi
	.xp <16,1
step << Paladin
    #xprate <1.5
    .goto Silvermoon City,92.62,37.53,4,0
    .goto Silvermoon City,92.06,36.23
    >>|cRXP_WARN_跳下后面的洞|r|cRXP_FRIENDLY_Bachi|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_魔导师阿斯塔洛·血誓|r交谈
    .turnin 9681 >>交任务: |cRXP_FRIENDLY_掌握力量|r
    .accept 9684 >>接任务: |cRXP_LOOT_驾驭圣光|r << wotlk
    .accept 63866 >>接任务: |cRXP_LOOT_驾驭圣光|r << tbc
    .target Magister Astalor Bloodsworn
-- This changes in sunwell plataeu, but im not sure if we'd have a phase system instead of just tbc
step << Paladin wotlk
    #xprate <1.5
    .goto Silvermoon City,92.61,36.80
    >>在|cRXP_FRIENDLY_Magister|r上使用 |T134867:0|t[微光容器]
    .complete 9684,1 --Collect Filled Shimmering Vessel
    .target Blood Elf Magister
    .use 24157
step << Paladin tbc
    #xprate <1.5
    .goto Silvermoon City,92.61,36.80
    >>在|cRXP_FRIENDLY_M'uru|r身上使用 |T134867:0|t[微光容器]
    .complete 63866,1 --Collect Filled Shimmering Vessel
    .target M'uru
    .use 185956
step << Paladin
    #xprate <1.5
    #completewith next
    .goto Silvermoon City,90.82,37.55,12,0
    .goto Silvermoon City,87.41,36.85,12,0
    .goto Silvermoon City,87.30,31.73,10,0
    .goto Silvermoon City,87.11,29.92,8,0
    .goto Silvermoon City,86.36,30.72,8,0
    .goto Silvermoon City,89.00,36.95,10,0
    .goto Silvermoon City,89.26,35.20,8 >>跑回|cRXP_FRIENDLY_Bloodvalor|r方向
step << Paladin
    #xprate <1.5
    .goto Silvermoon City,89.26,35.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bloodvalor|r交谈
    .turnin 9684 >>交任务: |cRXP_FRIENDLY_驾驭圣光|r << wotlk
    .turnin 63866 >>交任务: |cRXP_FRIENDLY_驾驭圣光|r << tbc
    .accept 9685 >>接任务: |cRXP_LOOT_救赎死者|r
    .target Knight-Lord Bloodvalor
step << Paladin
    #xprate <1.5
    .goto Silvermoon City,91.19,36.94,-1
    .goto Silvermoon City,91.14,38.10,-1
	>>|cRXP_WARN_跳到下方的长凳上, 以免走上楼梯|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟里斯|r 或 |cRXP_FRIENDLY_欧塞兰|r 交谈
    .train 647 >>训练你的职业法术
	.target Ithelis
	.target Osselan
    .xp <14,1
    .xp >16,1
step << Paladin
    #xprate <1.5
    #label SMTraining3
    .goto Silvermoon City,91.19,36.94,-1
    .goto Silvermoon City,91.14,38.10,-1
	>>|cRXP_WARN_跳到下方的长凳上, 以免走上楼梯|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟里斯|r 或 |cRXP_FRIENDLY_欧塞兰|r 交谈
    .train 7294 >>训练你的职业法术 << tbc
    .train 62124 >>训练你的职业法术 << wotlk
	.target Ithelis
	.target Osselan
	.xp <16,1
 step << Paladin
    #xprate <1.5
    #completewith next
    .goto Silvermoon City,82.04,58.31,8,0
    .goto Silvermoon City,80.90,57.53,8 >>进入旅店
step << Paladin
    #xprate <1.5
    #completewith next
    .goto Silvermoon City,79.61,56.25,8,0
    .goto Silvermoon City,80.09,55.56,8,0
    .goto Silvermoon City,80.61,56.51,8,0
    .goto Silvermoon City,80.16,60.24,8 >>前往|cRXP_FRIENDLY_Stillblade|r
step << Paladin
    #xprate <1.5
    .goto Silvermoon City,80.16,60.24
    >>在|cRXP_FRIENDLY_Stillblade|r身上使用 |T134723:0|t[装满的微光容器]
    .complete 9685,1 --Resurrect Sangrias Stillblade (1)
    .target Blood Knight Stillblade
    .use 24184
step << !Shaman !Warrior !Rogue
    #completewith Clearing
    .hs >>传送至塔奎林
    .zoneskip Ghostlands
    .cooldown item,6948,>0 << !Druid
step << !Shaman !Warrior !Druid
    #completewith Clearing
    .goto Eversong Woods,56.52,49.83
    .zone Eversong Woods >>前往: |cRXP_PICK_永歌森林|r
    .zoneskip Ghostlands
    .cooldown item,6948,<0
step << !Shaman !Warrior !Druid
    #completewith Clearing
    .goto Eversong Woods,54.37,50.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛拉米|r交谈
    .fly Tranquillien >>飞往塔奎林
    .target Skymistress Gloaming
    .cooldown item,6948,<0
    .zoneskip Ghostlands
step << Paladin
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132492:0|t[宁静防御者腰带]|r
    .collect 28162,1,9281,1 --Collect Tranquillien Defender's Girdle (1)
    .target Provisioner Vredigar
    .reputation 922,honored,<0,1
    .itemStat 6,LEVEL,<17
step << Paladin
    #completewith Clearing
    +装备 |T132492:0|t[塔奎林防御者腰带]
    .use 28162
    .itemcount 28162,1
    .itemStat 6,LEVEL,<17
step << Rogue/Hunter/Druid/Shaman
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r |T132498:0|t[蝙蝠皮腰带] |r
    .collect 28158,1,9281,1 --Collect Batskin Belt (1)
    .target Provisioner Vredigar
    .reputation 922,honored,<0,1
    .itemStat 6,LEVEL,<17
step << Rogue/Hunter/Druid/Shaman
    #completewith Clearing
    +装备 |T132498:0|t[蝙蝠皮腰带]
    .use 28158
    .itemcount 28158,1
    .itemStat 6,LEVEL,<17
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    .turnin 10372 >>交任务: |cRXP_FRIENDLY_谨慎的询问|r
    .accept 9491 >>接任务: |cRXP_LOOT_贪婪|r
    .target Eralan
    .isOnQuest 10372
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    .accept 9491 >>接任务: |cRXP_LOOT_贪婪|r
    .target Eralan
    .isQuestTurnedIn 10372
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135427:0|t[穿喉者]|cRXP_BUY_和|r|T135344:0|t[邪恶军刀]|cRXP_BUY_, 如果它们在售的话|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.7517 << BloodElf/Undead
    .money <0.7893 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果价格合适, 请从她那里购买|r|T135344:0|t[邪恶军刀]|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.6947 << BloodElf/Undead
    .money <0.7294 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,>7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果有的话, 从她那里购买|r|T135427:0|t[穿喉者]|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.0570 << BloodElf/Undead
    .money <0.0599 << Orc/Troll
    .itemStat 16,QUALITY,>7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
--VV Eralan steps need reviewing (doesn't work if you don't have either weapon+钱不够, 只能买战士阔剑或喉咙P
step << Rogue
    #label Eralan2
    #completewith Clearing
    +装备 |T135427:0|t[穿喉者] 和 |T135344:0|t[邪恶军刀]
    .use 29584
    .use 29583
    .itemcount 29584,1
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #requires Eralan2
    #completewith Clearing
    +装备 |T135344:0|t[邪恶军刀]
    .use 29583
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
step << Rogue
    #requires Eralan2
    #completewith Clearing
    +装备 |T135427:0|t[穿喉者]
    .use 29584
    .itemcount 29584,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step
    #completewith SpireT01
    .cast 29348 >>使用 |T134721:0|t[金雾特酿] 获得生命值增益
    .use 23444
step
    .goto Ghostlands,46.71,40.79,40,0
    .goto Ghostlands,46.90,42.95,40,0
    .goto Ghostlands,45.96,43.99,40,0
    .goto Ghostlands,44.32,47.56,40,0
    .goto Ghostlands,45.56,52.25,40,0
    .goto Ghostlands,48.41,53.36,40,0
    .goto Ghostlands,48.63,56.38,40,0
    .goto Ghostlands,52.05,51.17,40,0
    .goto Ghostlands,51.57,46.46,40,0
    .goto Ghostlands,52.85,44.28,40,0
    .goto Ghostlands,46.71,40.79,40,0
    .goto Ghostlands,46.90,42.95,40,0
    .goto Ghostlands,45.96,43.99,40,0
    .goto Ghostlands,44.32,47.56,40,0
    .goto Ghostlands,45.56,52.25,40,0
    .goto Ghostlands,48.41,53.36,40,0
    .goto Ghostlands,48.63,56.38,40,0
    .goto Ghostlands,52.05,51.17,40,0
    .goto Ghostlands,51.57,46.46,40,0
    .goto Ghostlands,52.85,44.28
    >>击杀|cRXP_ENEMY_吸血迷雾蝠|r
    >>|cRXP_WARN_小心他们的|r|T136130:0|t[吸血之触]|cRXP_WARN_吸血法术|r
    .complete 9159,1 --Kill Vampiric Mistbat (x10)
    .mob Vampiric Mistbat
step
    #label Clearing
    .goto Ghostlands,46.40,56.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vor'el|r交谈
    .accept 9281 >>接任务: |cRXP_LOOT_清理道路|r
    .target Apprentice Vor'el
step
    #xprate <1.5
    #completewith SpireT01
    >>击杀|cRXP_ENEMY_巨型纺丝蜘蛛|r 和|cRXP_ENEMY_鬼爪破坏者|r . 从|cRXP_ENEMY_巨型纺丝蜘蛛|r 身上搜刮出|cRXP_LOOT_蜘蛛长腿|r
    >>|cRXP_WARN_请小心, 这些怪物可能因等级差异而难以应对|r << Rogue
    .complete 9281,1 --Kill Greater Spindleweb (x10)
    .complete 9281,2 --Kill Ghostclaw Ravager (x10)
    .collect 22644,5,9171,1 --Collect Crunchy Spider Leg (x5)
    .mob Greater Spindleweb
    .mob Ghostclaw Ravager
    .isQuestAvailable 9171
step
    #xprate <1.5
    #completewith SpireT01
    >>击杀|cRXP_ENEMY_巨型纺丝蜘蛛|r和|cRXP_ENEMY_鬼爪破坏者|r
    >>|cRXP_WARN_请小心, 这些怪物可能因等级差异而难以应对|r << Rogue
    .complete 9281,1 --Kill Greater Spindleweb (x10)
    .complete 9281,2 --Kill Ghostclaw Ravager (x10)
    .mob Greater Spindleweb
    .mob Ghostclaw Ravager
    .isQuestTurnedIn 9171
step << Druid/Shaman/Warrior/Paladin
    #xprate >1.4999
    #completewith SpireT01
    >>击杀|cRXP_ENEMY_巨型纺丝蜘蛛|r 和|cRXP_ENEMY_鬼爪破坏者|r . 从|cRXP_ENEMY_巨型纺丝蜘蛛|r 身上搜刮出|cRXP_LOOT_蜘蛛长腿|r
    .complete 9281,1 --Kill Greater Spindleweb (x10)
    .complete 9281,2 --Kill Ghostclaw Ravager (x10)
    .collect 22644,5,9171,1 --Collect Crunchy Spider Leg (x5)
    .mob Greater Spindleweb
    .mob Ghostclaw Ravager
    .isQuestAvailable 9171
step << Druid/Shaman/Warrior/Paladin
    #xprate >1.4999
    #completewith SpireT01
    >>击杀|cRXP_ENEMY_巨型纺丝蜘蛛|r和|cRXP_ENEMY_鬼爪破坏者|r
    .complete 9281,1 --Kill Greater Spindleweb (x10)
    .complete 9281,2 --Kill Ghostclaw Ravager (x10)
    .mob Greater Spindleweb
    .mob Ghostclaw Ravager
    .isQuestTurnedIn 9171
step << !Druid !Shaman !Warrior !Paladin
    #xprate >1.4999
    #completewith SpireT01
    >>击杀|cRXP_ENEMY_巨型纺丝蜘蛛|r和|cRXP_ENEMY_鬼爪破坏者|r
    .complete 9281,1 --Kill Greater Spindleweb (x10)
    .complete 9281,2 --Kill Ghostclaw Ravager (x10)
    .mob Greater Spindleweb
    .mob Ghostclaw Ravager
step
    #completewith SpireT01
    >>击杀|cRXP_ENEMY_卢兹兰|r|cRXP_WARN_如果你能找到队伍来带你|r. 从他身上搜刮他的|cRXP_LOOT_头颅|r
    .complete 9156,2 --Luzran's Head (1)
    .mob Luzran
step
    #xprate <1.7
    #completewith SpireT01
    >>击杀 |cRXP_ENEMY_复生的游荡者|r. 从他们身上获取 |cRXP_LOOT_腐烂精华|r
    >>击杀|cRXP_ENEMY_凶骨哨兵|r和|cRXP_ENEMY_亡骨巫师|r, 击败后搜刮他们的|cRXP_LOOT_脊骨之尘|r
    >>|cRXP_WARN_小心, 凶骨哨兵会施放[盾击](需打断)|r
    .collect 22641,10,9216,1 --Collect Rotting Heart (x10)
    .collect 22642,10,9218,1 --Collect Spinal Dust (x10)
    .mob Risen Stalker
    .mob Dreadbone Sentinel
    .mob Deathcage Sorcerer
step
    #xprate >1.4999
    #completewith SpireT01
    >>击杀 |cRXP_ENEMY_复生的游荡者|r. 从他们身上获取 |cRXP_LOOT_腐烂精华|r
    .collect 22641,10,9216,1 --Collect Rotting Heart (x10)
    .mob Risen Stalker
step
    #label SpireT01
    .goto Ghostlands,34.06,57.57,80 >>穿越死亡伤痕
    .isOnQuest 9173
step
    #completewith SpireT
    >>击杀|cRXP_ENEMY_纳克雷洛特|r|cRXP_WARN_如果你能找到队伍带飞|r. 击败他后, 获取他的|cRXP_LOOT_头颅|r
    .complete 9156,1 --Knucklerot's Head (1)
    .mob Knucklerot
step
    #xprate <1.5
    #completewith SpireT
    .goto Ghostlands,34.06,57.57,50,0
    .goto Ghostlands,30.77,60.23,50,0
    .goto Ghostlands,28.23,58.65,50,0
    .goto Ghostlands,23.38,59.90,50,0
    .goto Ghostlands,18.75,60.74,50,0
    >>击杀|cRXP_ENEMY_巨型纺丝蜘蛛|r 和|cRXP_ENEMY_鬼爪破坏者|r . 从|cRXP_ENEMY_巨型纺丝蜘蛛|r 身上搜刮出|cRXP_LOOT_蜘蛛长腿|r
    >>|cRXP_WARN_请小心, 这些怪物可能因等级差异而难以应对|r << Rogue
    .complete 9281,1 --Kill Greater Spindleweb (x10)
    .complete 9281,2 --Kill Ghostclaw Ravager (x10)
    .collect 22644,5,9171,1 --Collect Crunchy Spider Leg (x5)
    .mob Greater Spindleweb
    .mob Ghostclaw Ravager
    .isQuestAvailable 9171
step
    #xprate <1.5
    #completewith SpireT
    .goto Ghostlands,34.06,57.57,50,0
    .goto Ghostlands,30.77,60.23,50,0
    .goto Ghostlands,28.23,58.65,50,0
    .goto Ghostlands,23.38,59.90,50,0
    .goto Ghostlands,18.75,60.74,50,0
    >>击杀|cRXP_ENEMY_巨型纺丝蜘蛛|r和|cRXP_ENEMY_鬼爪破坏者|r
    >>|cRXP_WARN_请小心, 这些怪物可能因等级差异而难以应对|r << Rogue
    .complete 9281,1 --Kill Greater Spindleweb (x10)
    .complete 9281,2 --Kill Ghostclaw Ravager (x10)
    .mob Greater Spindleweb
    .mob Ghostclaw Ravager
    .isQuestTurnedIn 9171
 step
    #xprate >1.4999
    .goto Ghostlands,34.06,57.57,50,0
    .goto Ghostlands,30.77,60.23,50,0
    .goto Ghostlands,28.23,58.65,50,0
    .goto Ghostlands,23.38,59.90,50,0
    .goto Ghostlands,18.75,60.74,50,0
    >>击杀|cRXP_ENEMY_巨型纺丝蜘蛛|r 和|cRXP_ENEMY_鬼爪破坏者|r . 从|cRXP_ENEMY_巨型纺丝蜘蛛|r 身上搜刮出|cRXP_LOOT_蜘蛛长腿|r
    .complete 9281,1 --Kill Greater Spindleweb (x10)
    .complete 9281,2 --Kill Ghostclaw Ravager (x10)
    .collect 22644,5,9171,1 --Collect Crunchy Spider Leg (x5)
    .mob Greater Spindleweb
    .mob Ghostclaw Ravager
    .isQuestAvailable 9171
step
    #xprate >1.4999
    .goto Ghostlands,34.06,57.57,50,0
    .goto Ghostlands,30.77,60.23,50,0
    .goto Ghostlands,28.23,58.65,50,0
    .goto Ghostlands,23.38,59.90,50,0
    .goto Ghostlands,18.75,60.74,50,0
    .goto Ghostlands,23.38,59.90,50,0
    .goto Ghostlands,28.23,58.65,50,0
    .goto Ghostlands,30.77,60.23,50,0
    .goto Ghostlands,34.06,57.57,50,0
    .goto Ghostlands,18.75,60.74,50,0
    .goto Ghostlands,23.38,59.90,50,0
    .goto Ghostlands,28.23,58.65,50,0
    .goto Ghostlands,30.77,60.23,50,0
    .goto Ghostlands,34.06,57.57
    >>击杀|cRXP_ENEMY_巨型纺丝蜘蛛|r和|cRXP_ENEMY_鬼爪破坏者|r
    .complete 9281,1 --Kill Greater Spindleweb (x10)
    .complete 9281,2 --Kill Ghostclaw Ravager (x10)
    .mob Greater Spindleweb
    .mob Ghostclaw Ravager
    .isQuestTurnedIn 9171
step
    #label SpireT
    .goto Ghostlands,17.21,58.09,80 >>前往风行者之塔
    .isOnQuest 9173
step
    #completewith next
    >>击杀|cRXP_ENEMY_堕落游侠|r 和|cRXP_ENEMY_戴索姆侍僧|r 可获得 |T133303:0|t[|cRXP_LOOT_女王的项链|r ]
    >>|cRXP_WARN_使用 |T133303:0|t[|cRXP_LOOT_女王的项链|r] 开始任务|r
    .collect 22597,1,9175,1 --Collect The Lady's Necklace (x1)
    .accept 9175 >>接任务: |cRXP_LOOT_女王的项链|r
    .use 22597
step
    .goto Ghostlands,17.21,58.09,40,0
    .goto Ghostlands,15.17,56.58,30,0
    .goto Ghostlands,12.45,56.89,15,0
    .goto Ghostlands,13.26,54.85,20,0
    .goto Ghostlands,11.58,55.88,15,0
    .goto Ghostlands,11.29,57.15,20,0
    .goto Ghostlands,11.93,57.05,15,0
    .goto Ghostlands,12.13,58.44,15,0
    .goto Ghostlands,13.69,58.59,20,0
    .goto Ghostlands,12.66,58.98,15,0
    .goto Ghostlands,12.24,57.47,15,0
    .goto Ghostlands,17.21,58.09,40,0
    .goto Ghostlands,15.17,56.58,30,0
    .goto Ghostlands,13.26,54.85,20,0
    .goto Ghostlands,11.58,55.88,15,0
    .goto Ghostlands,11.29,57.15,20,0
    .goto Ghostlands,11.93,57.05,15,0
    .goto Ghostlands,12.13,58.44,15,0
    .goto Ghostlands,13.69,58.59,20,0
    .goto Ghostlands,12.66,58.98,15,0
    .goto Ghostlands,12.24,57.47
    >>击杀|cRXP_ENEMY_堕落游侠|r和|cRXP_ENEMY_戴索姆侍僧|r
    >>|cRXP_WARN_要小心, 这些怪物很难打|r
    .complete 9173,1 --Deatholme Acolyte (8)
    .complete 9173,2 --Fallen Ranger (10)
    .mob Deatholme Acolyte
    .mob Fallen Ranger
step
    .goto Ghostlands,17.21,58.09,40,0
    .goto Ghostlands,15.17,56.58,30,0
    .goto Ghostlands,12.45,56.89,15,0
    .goto Ghostlands,13.26,54.85,20,0
    .goto Ghostlands,11.58,55.88,15,0
    .goto Ghostlands,11.29,57.15,20,0
    .goto Ghostlands,11.93,57.05,15,0
    .goto Ghostlands,12.13,58.44,15,0
    .goto Ghostlands,13.69,58.59,20,0
    .goto Ghostlands,12.66,58.98,15,0
    .goto Ghostlands,12.24,57.47,15,0
    .goto Ghostlands,17.21,58.09,40,0
    .goto Ghostlands,15.17,56.58,30,0
    .goto Ghostlands,13.26,54.85,20,0
    .goto Ghostlands,11.58,55.88,15,0
    .goto Ghostlands,11.29,57.15,20,0
    .goto Ghostlands,11.93,57.05,15,0
    .goto Ghostlands,12.13,58.44,15,0
    .goto Ghostlands,13.69,58.59,20,0
    .goto Ghostlands,12.66,58.98,15,0
    .goto Ghostlands,12.24,57.47
    >>击杀|cRXP_ENEMY_堕落游侠|r 和|cRXP_ENEMY_戴索姆侍僧|r. 击败他们后搜刮出 |T133303:0|t[|cRXP_LOOT_女王的项链|r ]
    >>|cRXP_WARN_使用 |T133303:0|t[|cRXP_LOOT_女王的项链|r] 开始任务|r
    .collect 22597,1,9175,1 --Collect The Lady's Necklace (x1)
    .accept 9175 >>接任务: |cRXP_LOOT_女王的项链|r
    .use 22597
step
    #xprate <1.5
    .goto Ghostlands,18.75,60.74,50,0
    .goto Ghostlands,23.38,59.90,50,0
    .goto Ghostlands,28.23,58.65,50,0
    .goto Ghostlands,30.77,60.23,50,0
    .goto Ghostlands,34.06,57.57,50,0
    .goto Ghostlands,18.75,60.74,50,0
    .goto Ghostlands,23.38,59.90,50,0
    .goto Ghostlands,28.23,58.65,50,0
    .goto Ghostlands,30.77,60.23,50,0
    .goto Ghostlands,34.06,57.57
    >>击杀|cRXP_ENEMY_巨型纺丝蜘蛛|r 和|cRXP_ENEMY_鬼爪破坏者|r . 从|cRXP_ENEMY_巨型纺丝蜘蛛|r 身上搜刮出|cRXP_LOOT_蜘蛛长腿|r
    >>|cRXP_WARN_请小心, 这些怪物可能因等级差异而难以应对|r << Rogue
    .complete 9281,1 --Kill Greater Spindleweb (x10)
    .complete 9281,2 --Kill Ghostclaw Ravager (x10)
    .collect 22644,5,9171,1 --Collect Crunchy Spider Leg (x5)
    .mob Greater Spindleweb
    .mob Ghostclaw Ravager
    .isQuestAvailable 9171
step
    #xprate <1.5
    .goto Ghostlands,18.75,60.74,50,0
    .goto Ghostlands,23.38,59.90,50,0
    .goto Ghostlands,28.23,58.65,50,0
    .goto Ghostlands,30.77,60.23,50,0
    .goto Ghostlands,34.06,57.57,50,0
    .goto Ghostlands,18.75,60.74,50,0
    .goto Ghostlands,23.38,59.90,50,0
    .goto Ghostlands,28.23,58.65,50,0
    .goto Ghostlands,30.77,60.23,50,0
    .goto Ghostlands,34.06,57.57
    >>击杀|cRXP_ENEMY_巨型纺丝蜘蛛|r和|cRXP_ENEMY_鬼爪破坏者|r
    >>|cRXP_WARN_请小心, 这些怪物可能因等级差异而难以应对|r << Rogue
    .complete 9281,1 --Kill Greater Spindleweb (x10)
    .complete 9281,2 --Kill Ghostclaw Ravager (x10)
    .mob Greater Spindleweb
    .mob Ghostclaw Ravager
    .isQuestTurnedIn 9171
step
    #completewith next
    >>击杀|cRXP_ENEMY_纳克雷洛特|r|cRXP_WARN_如果你能找到队伍带飞|r. 击败他后, 获取他的|cRXP_LOOT_头颅|r
    .complete 9156,1 --Knucklerot's Head (1)
    .mob Knucklerot
step
    .goto Ghostlands,16.38,52.92,30,0
    .goto Ghostlands,17.45,48.83,30,0
    .goto Ghostlands,20.23,47.83,30,0
    .goto Ghostlands,20.37,48.76,30,0
    .goto Ghostlands,21.10,47.74,30,0
    .goto Ghostlands,19.58,45.15,45,0
    .goto Ghostlands,21.99,43.70,30,0
    .goto Ghostlands,20.01,40.51,30,0
    .goto Ghostlands,18.38,42.74,30,0
    .goto Ghostlands,15.89,42.54,30,0
    .goto Ghostlands,16.93,46.43,30,0
    .goto Ghostlands,16.46,48.48,30,0
    .goto Ghostlands,18.20,53.81,30,0
    .goto Ghostlands,16.38,52.92,30,0
    .goto Ghostlands,17.45,48.83,30,0
    .goto Ghostlands,20.23,47.83,30,0
    .goto Ghostlands,20.37,48.76
    >>击杀|cRXP_ENEMY_幻影搜寻者|r和|cRXP_ENEMY_石翼屠杀者|r. 击败它们后拾取其掉落的|cRXP_LOOT_幻影物质|r和|cRXP_LOOT_石像鬼碎片|r
    .complete 9140,1 --Collect Phantasmal Substance (x6)
    .complete 9140,2 --Collect Gargoyle Fragment (x4)
    .mob Phantasmal Seeker
    .mob Stonewing Slayer
step
    #completewith next
    .cast 7840 >>在水中使用 |T134754:0|t[速游药水], 可以更快地游过水域
    .use 6372
    .itemcount 6372,1
step
    >>在地面上和帐篷内或桌子上的 |cRXP_PICK_暗夜精灵计划表|r处拾取
    .complete 9163,2 --Collect Night Elf Plans: An'owyn (x1)
    .goto Ghostlands,12.80,25.09,8,0
    .goto Ghostlands,12.54,24.81,8,0
    .goto Ghostlands,12.85,23.93
    .complete 9163,1 --Collect Night Elf Plans: An'daroth (x1)
    .goto Ghostlands,14.77,26.61,8,0
    .goto Ghostlands,13.70,26.83,8,0
    .goto Ghostlands,12.53,26.51
step
    #completewith next
    .goto Ghostlands,10.13,23.77,12,0
    .goto Ghostlands,10.12,23.04,12,0
    .goto Ghostlands,10.44,22.58,12 >>跑到船顶
step
    .goto Ghostlands,10.44,22.58
    >>拾取桌子上的|cRXP_PICK_暗夜精灵计划表|r
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_Darnassian Huntresses|r会施放|r|T132282:0|t[突袭]|cRXP_WARN_(瞬发攻击, 造成双倍伤害)|r
    .complete 9163,3 --Collect Night Elf Plans: Scrying on the Sin'dorei (x1)
step << Priest/Druid/Rogue/Paladin
#loop
	.line Ghostlands,14.71,26.66,13.06,26.15,11.63,26.63,12.51,24.81,9.43,23.77,10.47,22.51,14.71,26.66
	.goto Ghostlands,14.71,26.66,30,0
	.goto Ghostlands,13.06,26.15,30,0
	.goto Ghostlands,11.63,26.63,30,0
	.goto Ghostlands,12.51,24.81,30,0
	.goto Ghostlands,9.43,23.77,30,0
	.goto Ghostlands,10.47,22.51,30,0
	.goto Ghostlands,14.71,26.66,30,0
    .xp 15+10600 >>升级至10600/13600
step
    #completewith WindrunnerV
    .deathskip >>在灵魂医者处死亡并重生
    .train 1758,1 << !BloodElf Rogue
    .train 1460,1 << Mage
    .train 5118,1 << Hunter wotlk
    .train 13795,1 << Hunter tbc
    .train 8122,1 << Priest
    .train 6222,1 << Warlock
    .train 647,1 << Paladin tbc
    .train 62124,1 << Paladin wotlk
    .isOnQuest 9461 << BloodElf Rogue
step
    #completewith WindrunnerV
    .hs >>传送至塔奎林
    .cooldown item,6948,>0
    .train 1758,3 << !BloodElf Rogue
    .train 1460,3 << Mage
    .train 5118,3 << Hunter wotlk
    .train 13795,3 << Hunter tbc
    .train 8122,3 << Priest
    .train 6222,3 << Warlock
    .train 647,3 << Paladin tbc
    .train 62124,3 << Paladin wotlk
    .isOnQuest 10372 << BloodElf Rogue
step
    #completewith WindrunnerV
    .cast 7840 >>在水中使用 |T134754:0|t[速游药水] 可以更快地游回去
    .use 6372
    .itemcount 6372,1
    .cooldown item,6948,<0
    .train 1758,3 << !BloodElf Rogue
    .train 1460,3 << Mage
    .train 5118,3 << Hunter wotlk
    .train 13795,3 << Hunter tbc
    .train 8122,3 << Priest
    .train 6222,3 << Warlock
    .train 647,3 << Paladin tbc
    .train 62124,3 << Paladin wotlk
    .isOnQuest 10372 << BloodElf Rogue
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mouldier|r和|cRXP_FRIENDLY_Vandril|r交谈
    .accept 9171 >>接任务: |cRXP_LOOT_松脆蜘蛛腿|r
    .turnin 9171 >>交任务: |cRXP_FRIENDLY_松脆蜘蛛腿|r
    .goto Ghostlands,48.43,30.93
    .turnin 9140 >>交任务: |cRXP_FRIENDLY_风行村|r
    .goto Ghostlands,46.08,28.33,10,0
    .goto Ghostlands,46.55,28.38
    .target Master Chef Mouldier
    .target Arcanist Vandril
    .itemcount 22644,5
    .isQuestAvailable 9171
    .cooldown item,6948,>0
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vandril|r和|cRXP_FRIENDLY_Mouldier|r交谈
    .turnin 9140 >>交任务: |cRXP_FRIENDLY_风行村|r
    .goto Ghostlands,46.08,28.33,10,0
    .goto Ghostlands,46.55,28.38
    .accept 9171 >>接任务: |cRXP_LOOT_松脆蜘蛛腿|r
    .turnin 9171 >>交任务: |cRXP_FRIENDLY_松脆蜘蛛腿|r
    .goto Ghostlands,48.43,30.93
    .target Arcanist Vandril
    .target Master Chef Mouldier
    .itemcount 22644,5
    .isQuestAvailable 9171
    .cooldown item,6948,<0
step
    #label WindrunnerV
    .goto Ghostlands,46.08,28.33,10,0
    .goto Ghostlands,46.55,28.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥术师范迪瑞尔|r交谈
    .turnin 9140 >>交任务: |cRXP_FRIENDLY_风行村|r
    .target Arcanist Vandril
step
    .goto Ghostlands,46.02,31.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师戴伦尼斯|r交谈
    .accept 9151 >>接任务: |cRXP_LOOT_太阳圣殿|r
    .target Magister Darenis
    .xp <17,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Dame|r 和 |cRXP_FRIENDLY_Mavren|r 交谈
    .turnin 9163 >>交任务: |cRXP_FRIENDLY_深入敌境|r
    .accept 9166 >>接任务: |cRXP_LOOT_返回安泰拉斯|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.88,32.51
    .turnin 9173 >>交任务: |cRXP_FRIENDLY_夺回风行者之塔|r
    .turnin 9175 >>交任务: |cRXP_FRIENDLY_女王的项链|r
    .accept 9177 >>接任务: |cRXP_LOOT_幽暗城之旅|r << !BloodElf
    .accept 9180 >>接任务: |cRXP_LOOT_幽暗城之旅|r << BloodElf
    .goto Ghostlands,44.77,32.44
    .target Dame Auriferous
    .target High Executor Mavren
step << Druid
	#completewith DruidTrain3
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
	.xp <16,1
step << Druid
    .goto Moonglade,52.53,40.57
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 783 >>训练你的职业法术 << wotlk
    .train 8925 >>训练你的职业法术 << TBC
	.target Loganaar
    .cooldown item,6948,>0
	.xp <16,1
    .xp >18,1
step << Druid
    #label DruidTrain3
    .goto Moonglade,52.53,40.57
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 8938 >>训练你的职业法术
	.target Loganaar
    .cooldown item,6948,>0
	.xp <18,1
step << Rogue/Mage/Hunter/Priest/Warlock/Paladin
    #completewith next
    .goto Ghostlands,45.42,30.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阳翼|r交谈
    .fly Silvermoon >>飞往银月城
    .target Skymaster Sunwing
    .train 1460,1 << Mage
    .train 5118,1 << Hunter wotlk
    .train 13795,1 << Hunter tbc
    .train 8122,1 << Priest
    .train 6222,1 << Warlock
    .train 647,1 << Paladin tbc
    .train 62124,1 << Paladin wotlk
step << skip
    >>前往银月城
    .goto Silvermoon City,72.4,85.7,40,0
    .goto Silvermoon City,53.926,71.029
    .turnin 9133 >>交任务: |cRXP_FRIENDLY_飞往银月城|r
--VV BloodElf Paladin/BloodElf Rogue
step << skip
    #xprate <1.5
    .goto Silvermoon City,53.926,71.029
    .accept 9134 >>接任务: |cRXP_LOOT_葛拉米|r
    --VV BloodElf Paladin/BloodElf Rogue
step << skip
    >>不要从飞行管理员处飞往任何地方. 返回银月城外
    .goto Eversong Woods,54.4,50.7
    .turnin 9134 >>交任务: |cRXP_FRIENDLY_葛拉米|r
    .accept 9135 >>接任务: |cRXP_LOOT_返回军需官雷米尔身边|r
    .isOnQuest 9134
    --VV BloodElf Priest/BloodElf Rogue/BloodElf Paladin
step << Rogue/Mage/Hunter/Priest/Warlock/Paladin
    #completewith SMTraining4
    .goto Eversong Woods,56.51,49.61,25,0
    .goto Silvermoon City,73.39,59.65
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .train 1460,1 << Mage
    .train 5118,1 << Hunter wotlk
    .train 13795,1 << Hunter tbc
    .train 8122,1 << Priest
    .train 6222,1 << Warlock
    .train 647,1 << Paladin tbc
    .train 62124,1 << Paladin wotlk
step << Rogue
    .abandon 9491 >>放弃贪婪
    .isQuestAvailable 10372
step << Rogue
    #completewith SMTraining4
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,76.55,52.05,20,0
    .goto Silvermoon City,79.70,52.16,20 >>前往|cRXP_FRIENDLY_瑟兰尼斯|r
step << Rogue
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    >>|cRXP_WARN_确保你已训练过|r|T136058:0|t[开锁]|cRXP_WARN_, 以便完成后续任务|r
    .turnin 9618 >>交任务: |cRXP_FRIENDLY_交回报告|r << BloodElf
    .accept 10372 >>接任务: |cRXP_LOOT_谨慎的询问|r
    .train 1804 >>训练你的职业法术
    .target Zelanis
    .train 1804,1
    .xp <16,1
step << Rogue
    #label SMTraining4
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    .turnin 9618 >>交任务: |cRXP_FRIENDLY_交回报告|r << BloodElf
    .accept 10372 >>接任务: |cRXP_LOOT_谨慎的询问|r
    .target Zelanis
step << Rogue
    #completewith Scimitars2
    .goto Silvermoon City,62.89,31.26,30,0
    .goto Silvermoon City,51.83,17.91,30,0
    .goto Silvermoon City,49.45,15.00
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    #completewith Scimitars2
    .goto Undercity,59.81,11.33,20,0
    .goto Undercity,66.08,18.24,30,0
    .goto Undercity,66.04,32.97,30,0
    .goto Undercity,65.97,44.08,30,0
    .goto Undercity,60.52,44.02,10,0
    .goto Undercity,60.07,47.70,10 >>乘坐升降梯前往幽暗城
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << !Undead Rogue
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fp Undercity >>获取幽暗城飞行路径
    .target Michael Garrett
    .itemcount 2027,<2
    .money <0.7632 << Troll/Orc
    .money <0.7250 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << !Undead Rogue
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fp Undercity >>获取幽暗城飞行路径
    .target Michael Garrett
    .itemcount 2027,<1
    .money <0.3816 << Troll/Orc
    .money <0.3625 << Undead/BloodElf
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    .goto Undercity,61.15,40.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_路易斯|r交谈
    >>|cRXP_BUY_从他那里购买两把|r|T135343:0|t[战士阔剑]|r
    .collect 2027,2,9144,1 --Scimitar (2)
    .target Louis Warren
    .itemcount 2027,<2
    .money <0.7632 << Troll/Orc
    .money <0.7250 << Undead/BloodElf
    .xp <12,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    #label Scimitars2
    .goto Undercity,61.15,40.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_路易斯|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135343:0|t[战士阔剑]|r
    .collect 2027,1,9144,1 --Scimitar (1)
    .target Louis Warren
    .itemcount 2027,<1
    .money <0.3816 << Troll/Orc
    .money <0.3625 << Undead/BloodElf
    .xp <12,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    .hs >>传送至塔奎林
    .zoneskip Ghostlands
    .cooldown item,6948,>0
step << Rogue
    #completewith next
    .goto Undercity,60.07,47.70,10,0
    .goto Undercity,60.52,44.02,10,0
    .goto Undercity,65.97,44.08,30,0
    .goto Undercity,66.04,32.97,30,0
    .goto Undercity,66.08,18.24,30,0
    .goto Undercity,59.81,11.33,20,0 >>乘坐升降梯返回银月城
    .cooldown item,6948,<0
    .zoneskip Silvermoon City
    .zoneskip Eversong Woods
    .zoneskip Ghostlands
step << Rogue
    .goto Undercity,59,91,11.32,20,0
    .goto Undercity,54.67,11.25
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .cooldown item,6948,<0
    .zoneskip Eversong Woods
    .zoneskip Ghostlands
step << Priest
    .goto Silvermoon City,60.65,63.45,15,0
    .goto Silvermoon City,65.92,53.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维纳|r交谈
    >>|cRXP_BUY_如果价格便宜, 从拍卖行购买|r |T135144:0|t[强效魔法杖] |r
    >>|cRXP_WARN_如果它们都太贵, 就跳过这一步|r
    .collect 11288,1,9281,1 --Greater Magic Wand
    .target Vynna
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.5
    .train 8122,1
step << Priest/Mage
    #completewith SMTraining4
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,62.89,31.26,30,0
    .goto Silvermoon City,57.45,24.46,15,0
    .goto Silvermoon City,55.31,24.96,15,0 << Priest
    .goto Silvermoon City,57.21,21.25,15,0 << Mage
    .goto Silvermoon City,55.38,26.76,12 >>前往|cRXP_FRIENDLY_洛塞兰|r << Priest
    .goto Silvermoon City,57.16,18.85,12 >>前往|cRXP_FRIENDLY_塞伊丹纳|r << Mage
step << Priest
    .goto Silvermoon City,55.38,26.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛塞兰|r交谈
    .train 8102 >>训练你的职业法术
    .target Lotheolan
	.xp <16,1
	.xp >18,1
step << Priest
    #label SMTraining4
    .goto Silvermoon City,55.38,26.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛塞兰|r交谈
    .train 970 >>训练你的职业法术
    .target Lotheolan
    .train 8102,1
	.xp <18,1
step << Mage
    #label SMTraining4
    .goto Silvermoon City,57.16,18.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞伊丹纳|r交谈
    .train 3140 >>训练你的职业法术
    .target Zaedana
	.xp <18,1
step << Hunter
    #completewith next
    .goto Silvermoon City,83.52,48.68,30,0
    .goto Silvermoon City,83.50,43.40,20,0
    .goto Silvermoon City,82.20,28.06,15 >>前往|cRXP_FRIENDLY_塞兰娜|r
step << Hunter
    .goto Silvermoon City,86.24,35.45
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞兰娜|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135346:0|t[强化弓]|r
    .collect 3026,1,9181,1 --Reinforced Bow (1)
    .target Celana
    .money <0.3621 << BloodElf
    .money <0.3812 << Troll/Orc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.7
step << Hunter
    #completewith SMTraining4
    .goto Silvermoon City,83.45,30.13,15,0
    .goto Silvermoon City,83.45,28.56,15,0
    .goto Silvermoon City,84.71,28.05,15 >>前往|cRXP_FRIENDLY_桑迪恩|r
step << Hunter
    #completewith SMTraining4
    .goto Silvermoon City,83.52,48.68,30,0
    .goto Silvermoon City,83.50,43.40,20,0
    .goto Silvermoon City,83.45,30.13,15,0
    .goto Silvermoon City,83.45,28.56,15,0
    .goto Silvermoon City,84.71,28.05,15 >>前往|cRXP_FRIENDLY_桑迪恩|r
    .itemcount 3026,<1
step << Hunter
    .goto Silvermoon City,84.71,28.05
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪恩|r交谈
    .train 13795 >>训练你的职业法术 << tbc
    .train 5118 >>训练你的职业法术 << wotlk
    .target Zandine
	.xp <16,1
	.xp >18,1
step << Hunter
    #label SMTraining4
    .goto Silvermoon City,84.71,28.05
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪恩|r交谈
    .train 14318 >>训练你的职业法术
    .target Zandine
	.xp <18,1
step << Hunter
    .goto Silvermoon City,86.24,35.45
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞兰娜|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135346:0|t[强化弓]|r
    .collect 3026,1,9181,1 --Reinforced Bow (1)
    .target Celana
    .money <0.3621 << BloodElf
    .money <0.3812 << Troll/Orc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.7
step << Warlock
    #completewith SMTraining4
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,75.62,58.31,20,0
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,75.65,45.04,15,0
    .goto Silvermoon City,76.33,43.33,12 >>进入建筑内, 然后下楼梯
step << Warlock TBC
    .goto Silvermoon City,73.97,44.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托利安|r交谈
    >>|cRXP_BUY_从他那里购买|r |T133738:0|t[献祭魔典] |cRXP_BUY_和|r |T133738:0|t[吞噬暗影魔典] |r
    .collect 16351,1,9220,1 --Collect Grimoire of Sacrifice (x1)
    .collect 16357,1,9220,1 --Collect Grimoire of Consume Shadows (x1)
    .target Torian
    .train 20381,1
    .train 17767,1
step << Warlock TBC
    .goto Silvermoon City,73.97,44.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托利安|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133738:0|t[魔典:吞噬暗影]|r
    .collect 16357,1,9220,1 --Collect Grimoire of Consume Shadows (x1)
    .target Torian
    .train 17767,1
step << Warlock TBC
    .goto Silvermoon City,73.97,44.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托利安|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133738:0|t[牺牲之书]|r
    .collect 16351,1,9220,1 --Collect Grimoire of Sacrifice (x1)
    .target Torian
    .train 20381,1
step << Warlock TBC
    +使用 |T133738:0|t[献祭之书] 和 |T133738:0|t[吞噬暗影之书]
    .collect 16351,1,9220,1 --Collect Grimoire of Sacrifice (x1)
    .collect 16357,1,9220,1 --Collect Grimoire of Consume Shadows (x1)
    .use 16351
    .use 16357
    .itemcount 16351,1
    .itemcount 16357,1
    .train 20381,1
    .train 17767,1
    .xp <18,1
step << Warlock TBC
    +使用 |T133738:0|t[献祭法典]
    .use 16351
    .itemcount 16351,1
    .train 20381,1
    .xp <16,1
step << Warlock TBC
    +使用 |T133738:0|t[吞噬暗影法典]
    .use 16357
    .itemcount 16357,1
    .train 17767,1
    .xp <18,1
step << Warlock
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .train 6222 >>训练你的职业法术
    .target Talionia
    .xp <14,1
    .xp >18,1
step << Warlock
    #label SMTraining4
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .train 1014 >>训练你的职业法术
    .target Talionia
    .xp <18,1
step << Paladin
    #completewith next
    .goto Silvermoon City,82.03,68.36,25,0
    .goto Silvermoon City,84.63,48.65,25,0
    .goto Silvermoon City,84.65,43.43,25,0
    .goto Silvermoon City,89.00,36.95,15,0
    .goto Silvermoon City,89.26,35.20,15 >>前往|cRXP_FRIENDLY_Bloodvalor|r
    .train 647,1 << Paladin tbc
    .train 62124,1 << Paladin wotlk
step << Paladin
    .goto Silvermoon City,89.26,35.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bloodvalor|r交谈
    .turnin 9685 >>交任务: |cRXP_FRIENDLY_救赎死者|r
    .train 647,1 << Paladin tbc
    .train 62124,1 << Paladin wotlk
    .target Knight-Lord Bloodvalor
step << Paladin
    .goto Silvermoon City,91.19,36.94,-1
    .goto Silvermoon City,91.14,38.10,-1
	>>|cRXP_WARN_跳到下方的长凳上, 以免走上楼梯|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟里斯|r 或 |cRXP_FRIENDLY_欧塞兰|r 交谈
    .train 647 >>训练你的职业法术
	.target Ithelis
	.target Osselan
    .xp <14,1
    .xp >16,1
step << Paladin
    #label SMTraining4
    .goto Silvermoon City,91.19,36.94,-1
    .goto Silvermoon City,91.14,38.10,-1
	>>|cRXP_WARN_跳到下方的长凳上, 以免走上楼梯|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟里斯|r 或 |cRXP_FRIENDLY_欧塞兰|r 交谈
    .train 7294 >>训练你的职业法术 << tbc
    .train 62124 >>训练你的职业法术 << wotlk
	.target Ithelis
	.target Osselan
	.xp <16,1
step << !Rogue
    .hs >>传送至塔奎林
    .cooldown item,6948,>0
    .zoneskip Ghostlands
step
    .goto Ghostlands,48.91,32.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板卡拉林|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133978:0|t[多汁的西瓜]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133978:0|t[多汁的西瓜]|r << Paladin
    .collect 1205,30,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (30)
    .collect 4538,20,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Snapvine Watermelon (20)
    .collect 4538,10,9281,1 << Paladin --Snapvine Watermelon (10)
    .target Innkeeper Kalarin
    .money <0.3000 << Priest/Mage/Warlock/Druid/Paladin
    .money <0.2000 << !Priest !Mage !Warlock !Druid !Paladin
    .money <0.4000 << Paladin
    .xp <15,1
    .xp >30,1
step
    .goto Ghostlands,48.91,32.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板卡拉林|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133978:0|t[多汁的西瓜]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133978:0|t[多汁的西瓜]|r << Paladin
    .collect 1205,20,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (20)
    .collect 4538,20,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Snapvine Watermelon (20)
    .collect 4538,10,9281,1 << Paladin --Snapvine Watermelon (10)
    .target Innkeeper Kalarin
    .money <0.2000 << !Paladin
    .money <0.3000 << Paladin
    .xp <15,1
    .xp >30,1
step
    .goto Ghostlands,48.91,32.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板卡拉林|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133978:0|t[多汁的西瓜]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133978:0|t[多汁的西瓜]|r << Paladin
    .collect 1205,10,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (10)
    .collect 4538,10,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Snapvine Watermelon (10)
    .collect 4538,10,9281,1 << Paladin --Snapvine Watermelon (10)
    .target Innkeeper Kalarin
    .money <0.1000 << !Paladin
    .money <0.2000 << Paladin
    .xp <15,1
    .xp >30,1
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Horde !Warrior !Shaman
#name 16-20 幽魂之地
#displayname 16-20 幽魂之地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 22-26 希尔斯布莱德丘陵 JJ；20-23 石爪山 / 贫瘠之地
#version 1
#group RestedXP 部落 1-30

step << skip
    .goto Ghostlands,47.3,29.3
    .turnin -9135 >>交任务: |cRXP_FRIENDLY_返回军需官雷米尔身边|r
--VV BloodElf Priest/BloodElf Rogue/BloodElf Paladin
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    .turnin 10372 >>交任务: |cRXP_FRIENDLY_谨慎的询问|r
    .accept 9491 >>接任务: |cRXP_LOOT_贪婪|r
    .target Eralan
    .isOnQuest 10372
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    .accept 9491 >>接任务: |cRXP_LOOT_贪婪|r
    .target Eralan
    .isQuestTurnedIn 10372
step << Rogue wotlk
    #completewith Clearing
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132273:0|t[速效药膏]|r
    .collect 6947,10,496,1 --Instant Poison (10)
    .target Eralan
    .xp <19,1
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135427:0|t[穿喉者]|cRXP_BUY_和|r|T135344:0|t[邪恶军刀]|cRXP_BUY_, 如果它们在售的话|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.7517 << BloodElf/Undead
    .money <0.7893 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果价格合适, 请从她那里购买|r|T135344:0|t[邪恶军刀]|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.6947 << BloodElf/Undead
    .money <0.7294 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,>7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果有的话, 从她那里购买|r|T135427:0|t[穿喉者]|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.0570 << BloodElf/Undead
    .money <0.0599 << Orc/Troll
    .itemStat 16,QUALITY,>7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #label Eralan3
    #completewith Clearing
    +装备 |T135427:0|t[穿喉者] 和 |T135344:0|t[邪恶军刀]
    .use 29584
    .use 29583
    .itemcount 29584,1
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #requires Eralan3
    #completewith Clearing
    +装备 |T135344:0|t[邪恶军刀]
    .use 29583
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
step << Rogue
    #requires Eralan3
    #completewith Clearing
    +装备 |T135427:0|t[穿喉者]
    .use 29584
    .itemcount 29584,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step
    .goto Ghostlands,54.84,49.30,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Quallestis|r和|cRXP_FRIENDLY_Kaendris|r交谈
    .turnin 9207 >>交任务: |cRXP_FRIENDLY_幽光矿石样本|r
    .goto Ghostlands,54.95,48.49
    .accept 9282 >>接任务: |cRXP_LOOT_远行者营地|r
    .goto Ghostlands,55.07,48.83
    .target Magister Quallestis
    .target Magister Kaendris
step
    #completewith next
    .goto Ghostlands,55.42,48.70,10,0
    .goto Ghostlands,55.32,48.35,10,0
    .goto Ghostlands,55.17,48.21,10 >>上楼
    .isOnQuest 9151
step
    .goto Ghostlands,54.87,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_魔导师伊东尼斯|r 交谈
    .turnin 9151 >>交任务: |cRXP_FRIENDLY_太阳圣殿|r
    .accept 9220 >>接任务: |cRXP_LOOT_戴索姆之战|r
    .target Magister Idonis
    .isOnQuest 9151
step
    .goto Ghostlands,54.87,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_魔导师伊东尼斯|r 交谈
    .accept 9220 >>接任务: |cRXP_LOOT_戴索姆之战|r
    .target Magister Idonis
    .isQuestTurnedIn 9151
step
    #completewith next
    .goto Ghostlands,54.84,49.30,10,0
    .goto Ghostlands,57.04,45.01,40,0
    .goto Ghostlands,60.07,42.43,40,0
    .goto Ghostlands,60.29,35.63,40 >>前往|cRXP_FRIENDLY_Sylastor|r
step
    .goto Ghostlands,60.29,35.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师塞拉斯托|r交谈
    .turnin 9166 >>交任务: |cRXP_FRIENDLY_返回安泰拉斯|r
    .accept 9169 >>接任务: |cRXP_LOOT_关闭安欧维恩|r
    .target Magister Sylastor
step << Hunter
    .goto Ghostlands,72.13,32.03
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳瑞娜|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135346:0|t[强化弓]|cRXP_BUY_和|r|T132382:0|t[锋利的箭]|r
    .collect 3026,1,9181,1 --Reinforced Bow (1)
    .collect 2515,2000,9252,1 << Hunter --Sharp Arrow (2000)
    .target Narina
    .money <0.4101 << BloodElf
    .money <0.4312 << Troll/Orc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.7
step << Hunter
    .goto Ghostlands,72.13,32.03
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳瑞娜|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135346:0|t[强化弓]|r
    .collect 3026,1,9181,1 --Reinforced Bow (1)
    .target Narina
    .money <0.3621 << BloodElf
    .money <0.3812 << Troll/Orc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.7
step << Hunter
    .goto Ghostlands,72.13,32.03
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳瑞娜|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132382:0|t[锋利的箭]|r
    .collect 2515,2000,9252,1 << Hunter --Sharp Arrow (2000)
    .target Narina
    .money <0.0480 << BloodElf
    .money <0.0500 << Troll/Orc
step
    #xprate <1.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞迪娜|r和|cRXP_FRIENDLY_索兰娜|r和|cRXP_FRIENDLY_克伦恩安|r和|cRXP_FRIENDLY_赫利俄斯|r谈话
    .turnin 9159 >>交任务: |cRXP_FRIENDLY_控制瘟疫|r
    .goto Ghostlands,72.50,32.14
    .accept 9276 >>接任务: |cRXP_LOOT_进攻塞布提拉|r
    .goto Ghostlands,72.33,31.24
    .turnin 9274 >>交任务: |cRXP_FRIENDLY_水中鬼魂|r
    .goto Ghostlands,72.21,29.78
    .turnin 9146 >>交任务: |cRXP_FRIENDLY_向赫里奥斯中尉报到|r
    .goto Ghostlands,72.37,29.64
    .accept 9214 >>接任务: |cRXP_LOOT_暗松巨魔的武器|r
    .goto Ghostlands,72.37,29.64
    .target Farstrider Sedina
    .target Farstrider Solanna
    .target Ranger Krenn'an
    .target Captain Helios
step
    #xprate >1.6999
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞蒂娜|r和|cRXP_FRIENDLY_索兰娜|r和|cRXP_FRIENDLY_赫利俄斯|r交谈
    .turnin 9159 >>交任务: |cRXP_FRIENDLY_控制瘟疫|r
    .goto Ghostlands,72.50,32.14
    .accept 9276 >>接任务: |cRXP_LOOT_进攻塞布提拉|r
    .goto Ghostlands,72.33,31.24
    .turnin 9146 >>交任务: |cRXP_FRIENDLY_向赫里奥斯中尉报到|r
    .goto Ghostlands,72.37,29.64
    .accept 9214 >>接任务: |cRXP_LOOT_暗松巨魔的武器|r
    .goto Ghostlands,72.37,29.64
    .target Farstrider Sedina
    .target Farstrider Solanna
    .target Ranger Krenn'an
    .target Captain Helios
--VV 9276 and 9214 need to hide if in qlog. remove extra coords in this step and above once possible
step
    .abandon 9274 >>抛弃水中鬼魂
step
    #completewith next
    .goto Ghostlands,72.80,30.17,10,0
    .goto Ghostlands,73.07,30.67,10,0
    .goto Ghostlands,73.06,31.36,10,0
    .goto Ghostlands,72.81,31.56,8 >>沿着东侧坡道向上前进
step
    .goto Ghostlands,72.61,31.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Venustus|r交谈
    .accept 9275 >>接任务: |cRXP_LOOT_香料|r
    .target Apothecary Venustus
step
    #completewith next
    .goto Ghostlands,71.88,30.11,10,0
    .goto Ghostlands,71.74,30.47,10,0
    .goto Ghostlands,71.41,31.28,10,0
    .goto Ghostlands,71.19,32.34,10,0
    .goto Ghostlands,71.78,32.63,8 >>沿西侧坡道向上走
step
    .goto Ghostlands,71.96,32.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维纳|r交谈
    .turnin 9282 >>交任务: |cRXP_FRIENDLY_远行者营地|r
    .accept 9161 >>接任务: |cRXP_LOOT_叛徒之影|r
    .target Ranger Vynna
step
    #completewith TrollR1
    >>击杀|cRXP_ENEMY_木乃伊猎头者|r和|cRXP_ENEMY_暗松先知|r, 击败后可掉落|cRXP_LOOT_巨魔的邪符|r
    .complete 9199,1,6 --Collect Troll Juju (x8)
    .mob Mummified Headhunter
    .mob Shadowpine Oracle
    .isOnQuest 9199
step
    .goto Ghostlands,68.08,29.39,50,0
    .goto Ghostlands,66.24,28.55,12 >>进入墓穴
    .isOnQuest 9199
step << Rogue
    .goto Ghostlands,65.89,28.58,15,0
    .goto Ghostlands,63.64,28.64,15,0
    .goto Ghostlands,63.35,29.57,15,0
    .goto Ghostlands,62.40,29.46,15,0
    .goto Ghostlands,62.71,27.83,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,61.69,27.50,15,0
    .goto Ghostlands,61.84,29.43,15,0
    .goto Ghostlands,61.15,30.86,15,0
    .goto Ghostlands,59.31,30.79,15,0
    .goto Ghostlands,59.31,27.71,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,65.89,28.58,15,0
    .goto Ghostlands,63.64,28.64,15,0
    .goto Ghostlands,63.35,29.57,15,0
    .goto Ghostlands,62.40,29.46,15,0
    .goto Ghostlands,62.71,27.83,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,61.69,27.50,15,0
    .goto Ghostlands,61.84,29.43,15,0
    .goto Ghostlands,61.15,30.86,15,0
    .goto Ghostlands,59.31,30.79,15,0
    .goto Ghostlands,59.31,27.71,15,0
    .goto Ghostlands,61.68,28.58
    >>|T136058:0|t[撬锁] 打开墓穴内地面的埋起来的箱子. 将其打开可获得金戒指
    >>点击地面上的|cRXP_PICK_巨魔木乃伊残骸|r来焚烧它们
    .skill lockpicking,18 >>将你的 |T136058:0|t[开锁] 技能提升至18级
    .complete 9491,1 --Pitted Gold Band (1)
    .complete 9193,1,6 --Mummified Troll Remains Burned (x10)
    .skill lockpicking,18,1
step << !Rogue
    #completewith next
    .goto Ghostlands,65.89,28.58,15,0
    .goto Ghostlands,63.64,28.64,15,0
    .goto Ghostlands,62.91,30.75,12,0
    >>点击地面上的|cRXP_PICK_巨魔木乃伊残骸|r来焚烧它们
    .complete 9193,1,6 --Mummified Troll Remains Burned (x10)
step
    .goto Ghostlands,62.91,31.77
    >>跑进篝火房间
    .complete 9193,2 --Investigate the Amani Catacombs
step
    #label TrollR1
#loop
	.line Ghostlands,62.60,31.00,62.41,31.34,62.32,31.81,62.41,32.23,62.63,32.56,63.22,32.55,63.44,32.18,63.50,31.74,63.43,31.29,63.21,30.98,62.60,31.00
	.goto Ghostlands,62.60,31.00,12,0
	.goto Ghostlands,62.41,31.34,12,0
	.goto Ghostlands,62.32,31.81,12,0
	.goto Ghostlands,62.41,32.23,12,0
	.goto Ghostlands,62.63,32.56,12,0
	.goto Ghostlands,63.22,32.55,12,0
	.goto Ghostlands,63.44,32.18,12,0
	.goto Ghostlands,63.50,31.74,12,0
	.goto Ghostlands,63.43,31.29,12,0
	.goto Ghostlands,63.21,30.98,12,0
	.goto Ghostlands,62.60,31.00,12,0
    >>点击地面上的|cRXP_PICK_巨魔木乃伊残骸|r来焚烧它们
    >>|cRXP_WARN_请勿与|r |cRXP_FRIENDLY_Lilatha|r |cRXP_WARN_yet交谈|r
    >>|cRXP_WARN_如果篝火房间中已无残留物, 请检查主房间|r
    .complete 9193,1,8 --Mummified Troll Remains Burned (x10)
step
    .goto Ghostlands,63.35,29.57,15,0
    .goto Ghostlands,62.40,29.46,15,0
    .goto Ghostlands,62.71,27.83,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,61.69,27.50,15,0
    .goto Ghostlands,61.84,29.43,15,0
    .goto Ghostlands,61.15,30.86,15,0
    .goto Ghostlands,59.31,30.79,15,0
    .goto Ghostlands,59.31,27.71,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,65.89,28.58,15,0
    .goto Ghostlands,63.64,28.64,15,0
    .goto Ghostlands,63.35,29.57,15,0
    .goto Ghostlands,62.40,29.46,15,0
    .goto Ghostlands,62.71,27.83,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,61.69,27.50,15,0
    .goto Ghostlands,61.84,29.43,15,0
    .goto Ghostlands,61.15,30.86,15,0
    .goto Ghostlands,59.31,30.79,15,0
    .goto Ghostlands,59.31,27.71,15,0
    .goto Ghostlands,61.68,28.58
    >>击杀|cRXP_ENEMY_木乃伊猎头者|r和|cRXP_ENEMY_暗松先知|r, 击败后可掉落|cRXP_LOOT_巨魔的邪符|r
    .complete 9199,1,6 --Collect Troll Juju (x8)
    .mob Mummified Headhunter
    .mob Shadowpine Oracle
    .isOnQuest 9199
step
    .goto Ghostlands,62.93,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_游侠莉拉恩萨|r开始护送任务
    .accept 9212 >>接任务: |cRXP_LOOT_逃离墓穴|r
    .target Ranger Lilatha
step
    #completewith TrollR
    >>击杀|cRXP_ENEMY_木乃伊猎头者|r和|cRXP_ENEMY_暗松先知|r. 击败它们后搜刮出|cRXP_LOOT_巨魔的邪符|r
    .complete 9199,1 --Collect Troll Juju (x8)
    .mob Mummified Headhunter
    .mob Shadowpine Oracle
step << Rogue
    #label PittedG
    #completewith Lilatha
    >>|T136058:0|t[撬锁] 拾取墓穴内地面的|cRXP_PICK_埋起来的箱子|r, 打开后获得|cRXP_LOOT_陪葬的金戒指|r
    >>点击地面上的|cRXP_PICK_巨魔木乃伊残骸|r来焚烧它们
    >>|cRXP_WARN_确保在离开地下墓穴前完成此任务|r
    .skill lockpicking,20 >>将你的 |T136058:0|t[开锁] 技能提升至20级
    .complete 9491,1 --Pitted Gold Band (1)
    .complete 9193,1 --Collect Mummified Troll Remains Burned (x10)
step << Rogue
    #requires PittedG
    #completewith Lilatha
    >>|T136058:0|t[撬锁] 墓穴地面上的 |cRXP_PICK_埋起来的箱子|r(等待 |cRXP_FRIENDLY_Lilatha|r时), 这些箱子可能包含食物和药水和投掷匕首
step << !Rogue
    #completewith Lilatha
    >>点击地面上的|cRXP_PICK_巨魔木乃伊残骸|r来焚烧它们
    >>|cRXP_WARN_确保在离开地下墓穴前完成此任务|r
    .complete 9193,1 --Collect Mummified Troll Remains Burned (x10)
step << Paladin/Druid/Priest
    #completewith Lilatha
    .cast 19834 >>增益|cRXP_FRIENDLY_Lilatha|r带有 |T135906:0|t[力量祝福] << Paladin
    .cast 5232 >>增益|cRXP_FRIENDLY_Lilatha|r带有 |T136078:0|t[野性印记] << Druid
    .cast 1244 >>增益|cRXP_FRIENDLY_Lilatha|r带有 |T135987:0|t[真言术:坚韧] << Priest
    .target Ranger Lilatha
step
    #label Lilatha
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_Lilatha|r
    >>|cRXP_WARN_离开地下墓穴后约60码处, 一个|cRXP_ENEMY_暗松先知|r 和一个|cRXP_ENEMY_木乃伊猎头者|r 将在|cRXP_FRIENDLY_Lilatha|r 附近生成|r
    .goto Ghostlands,67.93,28.98,40,0
    .goto Ghostlands,71.09,32.01,40,0
    .goto Ghostlands,72.24,30.10
    .complete 9212,1 --Escort Ranger Lilatha back to the Farstrider Enclave
step << Rogue
    #label TrollR
    .goto Ghostlands,65.89,28.58,15,0
    .goto Ghostlands,63.64,28.64,15,0
    .goto Ghostlands,63.35,29.57,15,0
    .goto Ghostlands,62.40,29.46,15,0
    .goto Ghostlands,62.71,27.83,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,61.69,27.50,15,0
    .goto Ghostlands,61.84,29.43,15,0
    .goto Ghostlands,61.15,30.86,15,0
    .goto Ghostlands,59.31,30.79,15,0
    .goto Ghostlands,59.31,27.71,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,65.89,28.58,15,0
    .goto Ghostlands,63.64,28.64,15,0
    .goto Ghostlands,63.35,29.57,15,0
    .goto Ghostlands,62.40,29.46,15,0
    .goto Ghostlands,62.71,27.83,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,61.69,27.50,15,0
    .goto Ghostlands,61.84,29.43,15,0
    .goto Ghostlands,61.15,30.86,15,0
    .goto Ghostlands,59.31,30.79,15,0
    .goto Ghostlands,59.31,27.71,15,0
    .goto Ghostlands,61.68,28.58
    >>|T136058:0|t[撬锁] 拾取墓穴内地面的|cRXP_PICK_埋起来的箱子|r, 打开后获得|cRXP_LOOT_陪葬的金戒指|r
    >>点击地面上的|cRXP_PICK_巨魔木乃伊残骸|r来焚烧它们
    .skill lockpicking,20 >>将你的 |T136058:0|t[开锁] 技能提升至20级
    .complete 9491,1 --Pitted Gold Band (1)
    .complete 9193,1 --Mummified Troll Remains Burned (x10)
step << !Rogue
    #label TrollR
    .goto Ghostlands,65.89,28.58,15,0
    .goto Ghostlands,63.64,28.64,15,0
    .goto Ghostlands,63.35,29.57,15,0
    .goto Ghostlands,62.40,29.46,15,0
    .goto Ghostlands,62.71,27.83,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,61.69,27.50,15,0
    .goto Ghostlands,61.84,29.43,15,0
    .goto Ghostlands,61.15,30.86,15,0
    .goto Ghostlands,59.31,30.79,15,0
    .goto Ghostlands,59.31,27.71,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,65.89,28.58,15,0
    .goto Ghostlands,63.64,28.64,15,0
    .goto Ghostlands,63.35,29.57,15,0
    .goto Ghostlands,62.40,29.46,15,0
    .goto Ghostlands,62.71,27.83,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,61.69,27.50,15,0
    .goto Ghostlands,61.84,29.43,15,0
    .goto Ghostlands,61.15,30.86,15,0
    .goto Ghostlands,59.31,30.79,15,0
    .goto Ghostlands,59.31,27.71,15,0
    .goto Ghostlands,61.68,28.58
    >>点击地面上的|cRXP_PICK_巨魔木乃伊残骸|r来焚烧它们
    .complete 9193,1 --Mummified Troll Remains Burned (x10)
step
    .goto Ghostlands,65.89,28.58,15,0
    .goto Ghostlands,63.64,28.64,15,0
    .goto Ghostlands,63.35,29.57,15,0
    .goto Ghostlands,62.40,29.46,15,0
    .goto Ghostlands,62.71,27.83,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,61.69,27.50,15,0
    .goto Ghostlands,61.84,29.43,15,0
    .goto Ghostlands,61.15,30.86,15,0
    .goto Ghostlands,59.31,30.79,15,0
    .goto Ghostlands,59.31,27.71,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,65.89,28.58,15,0
    .goto Ghostlands,63.64,28.64,15,0
    .goto Ghostlands,63.35,29.57,15,0
    .goto Ghostlands,62.40,29.46,15,0
    .goto Ghostlands,62.71,27.83,15,0
    .goto Ghostlands,61.68,28.58,15,0
    .goto Ghostlands,61.69,27.50,15,0
    .goto Ghostlands,61.84,29.43,15,0
    .goto Ghostlands,61.15,30.86,15,0
    .goto Ghostlands,59.31,30.79,15,0
    .goto Ghostlands,59.31,27.71,15,0
    .goto Ghostlands,61.68,28.58
    >>击杀|cRXP_ENEMY_木乃伊猎头者|r和|cRXP_ENEMY_暗松先知|r, 击败后可掉落|cRXP_LOOT_巨魔的邪符|r
    .complete 9199,1 --Collect Troll Juju (x8)
    .mob Mummified Headhunter
    .mob Shadowpine Oracle
step << Rogue
    #completewith SadT
    +装备 |T135427:0|t[大飞刀]
    .use 25874
    .itemcount 25874,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.2 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.0 << wotlk
step
    .goto Ghostlands,72.37,29.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫利俄斯|r交谈
    .turnin 9212 >>交任务: |cRXP_FRIENDLY_逃离墓穴|r
    .target Captain Helios
step << Warlock TBC
    +使用 |T133738:0|t[献祭之书] 和 |T133738:0|t[吞噬暗影之书]
    .collect 16351,1,9220,1 --Collect Grimoire of Sacrifice (x1)
    .collect 16357,1,9220,1 --Collect Grimoire of Consume Shadows (x1)
    .use 16351
    .use 16357
    .itemcount 16351,1
    .itemcount 16357,1
    .train 20381,1
    .train 17767,1
    .xp <18,1
step << Warlock TBC
    +使用 |T133738:0|t[献祭法典]
    .use 16351
    .itemcount 16351,1
    .train 20381,1
    .xp <16,1
step << Warlock TBC
    +使用 |T133738:0|t[吞噬暗影法典]
    .use 16357
    .itemcount 16357,1
    .train 17767,1
    .xp <18,1
step << Rogue
    #completewith SadT
    .hs >>传送至塔奎林
    .cooldown item,6948,>0
step << Rogue wotlk
    #completewith Truth
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132273:0|t[速效药膏]|r
    .collect 6947,10,496,1 --Instant Poison (10)
    .target Eralan
    .xp <19,1
step << Rogue
    #label SadT
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    .turnin 9491 >>交任务: |cRXP_FRIENDLY_贪婪|r
    .accept 10548 >>接任务: |cRXP_LOOT_悲伤的事实|r
    .target Eralan
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    .accept 10548 >>接任务: |cRXP_LOOT_悲伤的事实|r
    .target Eralan
    .isQuestTurnedIn 9491
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135427:0|t[穿喉者]|cRXP_BUY_和|r|T135344:0|t[邪恶军刀]|cRXP_BUY_, 如果它们在售的话|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.7517 << BloodElf/Undead
    .money <0.7893 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果价格合适, 请从她那里购买|r|T135344:0|t[邪恶军刀]|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.6947 << BloodElf/Undead
    .money <0.7294 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,>7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果有的话, 从她那里购买|r|T135427:0|t[穿喉者]|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.0570 << BloodElf/Undead
    .money <0.0599 << Orc/Troll
    .itemStat 16,QUALITY,>7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #label Eralan4
    #completewith Clearing
    +装备 |T135427:0|t[穿喉者] 和 |T135344:0|t[邪恶军刀]
    .use 29584
    .use 29583
    .itemcount 29584,1
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #requires Eralan4
    #completewith Clearing
    +装备 |T135344:0|t[邪恶军刀]
    .use 29583
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
step << Rogue
    #requires Eralan4
    #completewith Clearing
    +装备 |T135427:0|t[穿喉者]
    .use 29584
    .itemcount 29584,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step
    #completewith next
    .goto Ghostlands,78.82,19.81,15,0
    .goto Ghostlands,80.04,20.58,10,0
    .goto Ghostlands,80.27,19.82,10,0
    .goto Ghostlands,79.88,18.97,10,0
    .goto Ghostlands,79.63,18.58,10,0
    .goto Ghostlands,79.63,17.57,10 >>前往大楼顶层
step
    .goto Ghostlands,79.63,17.57
    >>点击地面上的|cRXP_PICK_Book|r
    .turnin 9161 >>交任务: |cRXP_FRIENDLY_叛徒之影|r
    .accept 9162 >>接任务: |cRXP_LOOT_往日的线索|r
step << Rogue
    #completewith next
    >>|T136058:0|t[撬锁] 废墟附近地面上的|cRXP_PICK_粗糙的箱子|r. 打开后获取|cRXP_LOOT_考古学家的皱缩头颅|r
    .complete 10548,1 --Archaeologist's Shrunken Head (1)
step
    .goto Ghostlands,76.95,34.45,40,0
    .goto Ghostlands,79.55,35.99,40,0
    .goto Ghostlands,81.57,39.31,40,0
    .goto Ghostlands,78.58,38.63,40,0
    .goto Ghostlands,75.89,38.65,40,0
    .goto Ghostlands,77.00,42.39,40,0
    .goto Ghostlands,77.04,44.69,40,0
    .goto Ghostlands,75.12,45.29,40,0
    .goto Ghostlands,74.73,43.27,40,0
    .goto Ghostlands,76.95,34.45,40,0
    .goto Ghostlands,79.55,35.99,40,0
    .goto Ghostlands,81.57,39.31,40,0
    .goto Ghostlands,78.58,38.63,40,0
    .goto Ghostlands,75.89,38.65,40,0
    .goto Ghostlands,77.00,42.39,40,0
    .goto Ghostlands,77.04,44.69,40,0
    .goto Ghostlands,75.12,45.29,40,0
    .goto Ghostlands,74.73,43.27
    >>击杀|cRXP_ENEMY_暗松影法师|r 和|cRXP_ENEMY_暗松猎头者|r . 击败他们后可获得其掉落的|cRXP_LOOT_暗影施法者钉锤|r 和|cRXP_LOOT_猎头者战斧|r
    .complete 9276,1 --Kill Shadowpine Shadowcaster (x8)
    .complete 9276,2 --Kill Shadowpine Headhunter (x8)
    .complete 9214,2 --Collect Shadowcaster Mace (x3)
    .complete 9214,1 --Collect Headhunter Axe (x3)
    .mob Shadowpine Shadowcaster
    .mob Shadowpine Headhunter
step
    .goto Ghostlands,72.29,32.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫罗恩|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133970:0|t[羊排]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133970:0|t[羊排]|r << Paladin
    .collect 1205,20,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (20)
    .collect 3770,20,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Mutton Chop (20)
    .collect 3770,10,9281,1 << Paladin --Mutton Chop (10)
    .target Heron Skygaze
    .isOnQuest 9276
    .money <0.2000 << !Paladin
    .money <0.3000 << Paladin
    .xp <15,1
    .xp >30,1
step
    .goto Ghostlands,72.29,32.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫罗恩|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133970:0|t[羊排]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133970:0|t[羊排]|r << Paladin
    .collect 1205,10,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (10)
    .collect 3770,10,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Mutton Chop (10)
    .collect 3770,10,9281,1 << Paladin --Mutton Chop (10)
    .target Heron Skygaze
    .money <0.1000 << !Paladin
    .money <0.2000 << Paladin
    .isOnQuest 9276
    .xp <15,1
    .xp >30,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索兰娜|r交谈
    .turnin 9276 >>交任务: |cRXP_FRIENDLY_进攻塞布提拉|r
    .accept 9277 >>接任务: |cRXP_LOOT_突袭塞布努瓦|r
    .goto Ghostlands,72.33,31.24
    .target Farstrider Solanna
step
    #completewith next
    .goto Ghostlands,71.88,30.11,10,0
    .goto Ghostlands,71.74,30.47,10,0
    .goto Ghostlands,71.41,31.28,10,0
    .goto Ghostlands,71.19,32.34,10,0
    .goto Ghostlands,71.78,32.63,8 >>沿西侧坡道向上走
step
    .goto Ghostlands,71.96,32.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维纳|r交谈
    .turnin 9162 >>交任务: |cRXP_FRIENDLY_往日的线索|r
    .accept 9172 >>接任务: |cRXP_LOOT_向魔导师坎迪瑞斯报到|r
    .target Ranger Vynna
step << Rogue
    #completewith KelGash
    >>|T136058:0|t[撬锁] 地面上的|cRXP_PICK_粗糙的箱子|r. 打开后拾取|cRXP_LOOT_考古学家的皱缩头颅|r
    .complete 10548,1 --Archaeologist's Shrunken Head (1)
step
    #completewith KelGash
    .goto Ghostlands,69.63,50.08,50,0
    .goto Ghostlands,69.64,51.43,50,0
    .goto Ghostlands,69.63,52.41,50,0
    .goto Ghostlands,67.54,50.89,50,0
    .goto Ghostlands,65.73,53.82,50,0
    .goto Ghostlands,68.41,54.61,50,0
    >>击杀|cRXP_ENEMY_暗松驭豹者|r和|cRXP_ENEMY_暗松妖术师|r. 击败他们后拾取|cRXP_LOOT_驭豹者之爪|r和|cRXP_LOOT_妖术师法杖|r
    .complete 9277,1 --Kill Shadowpine Catlord (x10)
    .complete 9277,2 --Kill Shadowpine Hexxer (x10)
    .complete 9214,3 --Collect Catlord Claws (x3)
    .complete 9214,4 --Collect Hexxer Stave (x3)
    .mob Shadowpine Catlord
    .mob Shadowpine Hexxer
step
    .goto Ghostlands,67.60,57.98,12,0
    .goto Ghostlands,68.25,57.78
    >>点击|cRXP_PICK_新鲜鱼架|r
    .complete 9275,3 --Poison the Fresh Fish Rack (x1)
step
    .goto Ghostlands,65.11,66.74
    >>点击|cRXP_PICK_生肉架|r
    .complete 9275,1 --Poison the Raw Meat Rack (x1)
step
    .goto Ghostlands,63.04,74.99
    >>点击|cRXP_PICK_熏肉架|r
    .complete 9275,2 --Poison the Smoked Meat Rack (x1)
step
    #xprate <1.5
#loop
	.line Ghostlands,61.16,75.58,60.28,73.66,61.68,71.27,61.81,71.16,61.46,68.82,64.27,73.63,64.34,73.03,61.46,73.38,64.22,73.82,63.93,73.70,63.90,72.99,64.87,70.28,65.31,70.32,64.70,67.70,65.42,66.39,64.66,64.07,61.16,75.58
	.goto Ghostlands,61.16,75.58,50,0
	.goto Ghostlands,60.28,73.66,50,0
	.goto Ghostlands,61.68,71.27,50,0
	.goto Ghostlands,61.81,71.16,50,0
	.goto Ghostlands,61.46,68.82,50,0
	.goto Ghostlands,64.27,73.63,50,0
	.goto Ghostlands,64.34,73.03,50,0
	.goto Ghostlands,61.46,73.38,50,0
	.goto Ghostlands,64.22,73.82,50,0
	.goto Ghostlands,63.93,73.70,50,0
	.goto Ghostlands,63.90,72.99,50,0
	.goto Ghostlands,64.87,70.28,50,0
	.goto Ghostlands,65.31,70.32,50,0
	.goto Ghostlands,64.70,67.70,50,0
	.goto Ghostlands,65.42,66.39,50,0
	.goto Ghostlands,64.66,64.07,50,0
	.goto Ghostlands,61.16,75.58,50,0
    .xp 18 >>刷到18级
step
    #completewith next
    .goto Ghostlands,65.29,79.31,12,0
    .goto Ghostlands,65.77,79.73,8,0
    .goto Ghostlands,65.93,80.68,8,0
    .goto Ghostlands,65.59,80.72,8 >>上楼
step
    .goto Ghostlands,65.29,79.46
    >>击杀|cRXP_ENEMY_Kel'gash the Wicked|r. 击败他后搜刮其|cRXP_LOOT_Head|r
    >>躲避|cRXP_ENEMY_Kel'gash the Wicked|r的 |T136048:0|t[闪电箭] 和 |T136121:0|t[缩小术], 通过绕柱子走位(LoSing, 即遮挡视线)使他取消每个法术
    >>|cRXP_WARN_确保你的冷却技能可用, 并在需要时使用|r|T134831:0|t[治疗药水]|r
    >>|cRXP_WARN_如果需要, 为他找一个队伍|r << !Hunter !Warlock
    .complete 9215,1 --Collect Head of Kel'gash the Wicked (x1)
    .mob Kel'gash the Wicked
    .use 858
    .use 929
    .itemcount 929,1
    .isOnQuest 9215
step
    .goto Ghostlands,65.29,79.46
    >>击杀|cRXP_ENEMY_Kel'gash the Wicked|r. 击败他后搜刮其|cRXP_LOOT_Head|r
    >>躲避|cRXP_ENEMY_Kel'gash the Wicked|r的 |T136048:0|t[闪电箭] 和 |T136121:0|t[缩小术], 通过绕柱子走位(LoSing, 即遮挡视线)使他取消每个法术
    >>|cRXP_WARN_确保你有可用的冷却技能, 并在需要时使用|r|T134830:0|t[次级治疗药水]|r
    >>|cRXP_WARN_如果需要, 为他找一个队伍|r << !Hunter !Warlock
    .complete 9215,1 --Collect Head of Kel'gash the Wicked (x1)
    .mob Kel'gash the Wicked
    .use 858
    .use 929
    .itemcount 858,1
    .isOnQuest 9215
step
    #label KelGash
    .goto Ghostlands,65.29,79.46
    >>击杀|cRXP_ENEMY_Kel'gash the Wicked|r. 击败他后搜刮其|cRXP_LOOT_Head|r
    >>躲避|cRXP_ENEMY_Kel'gash the Wicked|r的 |T136048:0|t[闪电箭] 和 |T136121:0|t[缩小术], 通过绕柱子调整你的视角(视线)让其取消每个法术. 确保你已准备好可用的冷却技能
    >>|cRXP_WARN_如果需要, 为他找一个队伍|r << !Hunter !Warlock
    .complete 9215,1 --Collect Head of Kel'gash the Wicked (x1)
    .mob Kel'gash the Wicked
    .use 858
    .use 929
    .isOnQuest 9215
step << Rogue
    #completewith next
    .goto Ghostlands,69.63,50.08,40,0
    .goto Ghostlands,69.64,51.43,40,0
    .goto Ghostlands,69.63,52.41,40,0
    .goto Ghostlands,67.54,50.89,40,0
    .goto Ghostlands,65.73,53.82,40,0
    .goto Ghostlands,68.41,54.61,40,0
    >>击杀|cRXP_ENEMY_暗松驭豹者|r和|cRXP_ENEMY_暗松妖术师|r. 击败他们后拾取|cRXP_LOOT_驭豹者之爪|r和|cRXP_LOOT_妖术师法杖|r
    .complete 9277,1 --Kill Shadowpine Catlord (x10)
    .complete 9277,2 --Kill Shadowpine Hexxer (x10)
    .complete 9214,3 --Collect Catlord Claws (x3)
    .complete 9214,4 --Collect Hexxer Stave (x3)
    .mob Shadowpine Catlord
    .mob Shadowpine Hexxer
step << Rogue
    .goto Ghostlands,61.16,75.58,10,0
    .goto Ghostlands,60.28,73.66,10,0
    .goto Ghostlands,61.68,71.27,10,0
    .goto Ghostlands,61.81,71.16,10,0
    .goto Ghostlands,61.46,68.82,10,0
    .goto Ghostlands,64.27,73.63,10,0
    .goto Ghostlands,64.34,73.03,8,0
    .goto Ghostlands,61.46,73.38,10,0
    .goto Ghostlands,64.22,73.82,8,0
    .goto Ghostlands,63.93,73.70,8,0
    .goto Ghostlands,63.90,72.99,10,0
    .goto Ghostlands,64.87,70.28,10,0
    .goto Ghostlands,65.31,70.32,10,0
    .goto Ghostlands,64.70,67.70,10,0
    .goto Ghostlands,65.42,66.39,10,0
    .goto Ghostlands,64.66,64.07,10,0
    .goto Ghostlands,61.16,75.58
    >>|T136058:0|t[撬锁] 废墟附近地面上的|cRXP_PICK_粗糙的箱子|r. 打开后获取|cRXP_LOOT_考古学家的皱缩头颅|r
    .complete 10548,1 --Archaeologist's Shrunken Head (1)
step
    .goto Ghostlands,61.23,75.22,40,0
    .goto Ghostlands,61.50,71.88,40,0
    .goto Ghostlands,61.76,67.88,40,0
    .goto Ghostlands,63.70,64.30,40,0
    .goto Ghostlands,65.33,66.10,40,0
    .goto Ghostlands,64.67,67.30,40,0
    .goto Ghostlands,65.10,70.20,40,0
    .goto Ghostlands,63.84,73.07,40,0
    .goto Ghostlands,63.04,74.16,40,0
    .goto Ghostlands,64.51,77.99,40,0
    .goto Ghostlands,61.23,75.22
    >>击杀|cRXP_ENEMY_暗松驭豹者|r和|cRXP_ENEMY_暗松妖术师|r. 击败他们后拾取|cRXP_LOOT_驭豹者之爪|r和|cRXP_LOOT_妖术师法杖|r
    .complete 9277,1 --Kill Shadowpine Catlord (x10)
    .complete 9277,2 --Kill Shadowpine Hexxer (x10)
    .complete 9214,3 --Collect Catlord Claws (x3)
    .complete 9214,4 --Collect Hexxer Stave (x3)
    .mob Shadowpine Catlord
    .mob Shadowpine Hexxer
step
#loop
	.line Ghostlands,57.70,67.55,58.19,67.07,58.89,65.55,58.37,62.88,57.24,63.00,56.35,65.01,56.49,68.12,57.70,67.55
	.goto Ghostlands,57.70,67.55,30,0
	.goto Ghostlands,58.19,67.07,30,0
	.goto Ghostlands,58.89,65.55,30,0
	.goto Ghostlands,58.37,62.88,30,0
	.goto Ghostlands,57.24,63.00,30,0
	.goto Ghostlands,56.35,65.01,30,0
	.goto Ghostlands,56.49,68.12,30,0
	.goto Ghostlands,57.70,67.55,30,0
    >>击杀 |cRXP_ENEMY_哨兵部队渗透者|r. 掠夺他们以获取 |cRXP_LOOT_控制之球|r
    .collect 23191,1,9169,1 --Collect Crystal Controlling Orb (x1)
    .mob Sentinel Infiltrator
step
    .goto Ghostlands,58.18,65.14
    >>点击|cRXP_PICK_月亮水晶|r
    .complete 9169,1 --Collect Night Elf Moon Crystal Deactivated (x1)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Solanna|r和|cRXP_FRIENDLY_赫利俄斯|r交谈
    .turnin 9277 >>交任务: |cRXP_FRIENDLY_突袭塞布努瓦|r
    .goto Ghostlands,72.33,31.24
    .turnin 9214 >>交任务: |cRXP_FRIENDLY_暗松巨魔的武器|r
    .turnin 9215 >>交任务: |cRXP_FRIENDLY_克尔加什的徽记！|r
    .goto Ghostlands,72.37,29.64
    .target Farstrider Solanna
    .target Captain Helios
    .isQuestComplete 9215
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Solanna|r和|cRXP_FRIENDLY_赫利俄斯|r交谈
    .turnin 9277 >>交任务: |cRXP_FRIENDLY_突袭塞布努瓦|r
    .goto Ghostlands,72.33,31.24
    .turnin 9214 >>交任务: |cRXP_FRIENDLY_暗松巨魔的武器|r
    .goto Ghostlands,72.37,29.64
    .target Farstrider Solanna
    .target Captain Helios
step
    .abandon 9215 >>放弃克尔加什的徽记！
step << Paladin/Rogue/Warrior
    #completewith StoneOL
    +装备 |T135275:0|t[精制轻剑]
    .use 23410
    .itemcount 23410,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.2
step
    #completewith next
    .goto Ghostlands,72.80,30.17,10,0
    .goto Ghostlands,73.07,30.67,10,0
    .goto Ghostlands,73.06,31.36,10,0
    .goto Ghostlands,72.81,31.56,8 >>沿着东侧坡道向上前进
step
    .goto Ghostlands,72.61,31.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Venustus|r交谈
    .turnin 9275 >>交任务: |cRXP_FRIENDLY_香料|r
    .target Apothecary Venustus
step
    #completewith next
    .goto Ghostlands,65.22,38.14,15,0
    .goto Ghostlands,63.85,38.10,15,0
    .goto Ghostlands,60.29,35.63,40 >>前往|cRXP_FRIENDLY_Sylastor|r
step
    .goto Ghostlands,60.29,35.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师塞拉斯托|r交谈
    .turnin 9169 >>交任务: |cRXP_FRIENDLY_关闭安欧维恩|r
    .target Magister Sylastor
step << !Rogue
    #completewith Truth
    .goto Ghostlands,56.64,45.14,40,0
    .goto Ghostlands,54.68,41.88,20,0
    .goto Ghostlands,51.07,38.21,20,0
    .goto Ghostlands,48.58,35.52,20,0
    .goto Ghostlands,45.17,32.37,50 >>返回塔奎林
    .isQuestAvailable 9151 << !Paladin/!wotlk
step << Rogue
    #completewith Truth
    .goto Ghostlands,56.64,45.14,40,0
    .goto Ghostlands,54.68,41.88,20,0
    .goto Ghostlands,51.07,38.21,20,0
    .goto Ghostlands,48.58,35.52,20,0
    .goto Ghostlands,47.67,34.87,40 >>返回塔奎林
    .isQuestAvailable 9151
step << Rogue wotlk
    #completewith Truth
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132273:0|t[速效药膏]|r
    .collect 6947,10,496,1 --Instant Poison (10)
    .target Eralan
    .xp <19,1
    .isQuestAvailable 9151
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135427:0|t[穿喉者]|cRXP_BUY_和|r|T135344:0|t[邪恶军刀]|cRXP_BUY_, 如果它们在售的话|r
    >>|cRXP_WARN_保留|r|T135662:0|t[柳叶刀]|cRXP_WARN_稍后完成任务时会用到|r << tbc
    .turnin 10548,1 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << tbc
    .turnin 10548 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << wotlk
    .vendor >>出售垃圾
    .target Eralan
    .money <0.7517 << BloodElf/Undead
    .money <0.7893 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
    .isQuestAvailable 9151
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果价格合适, 请从她那里购买|r|T135344:0|t[邪恶军刀]|r
    >>|cRXP_WARN_保留|r|T135662:0|t[柳叶刀]|cRXP_WARN_稍后完成任务时会用到|r << tbc
    .turnin 10548,1 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << tbc
    .turnin 10548 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << wotlk
    .vendor >>出售垃圾
    .target Eralan
    .money <0.6947 << BloodElf/Undead
    .money <0.7294 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,>7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>12.5 << wotlk
    .isQuestAvailable 9151
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果有的话, 从她那里购买|r|T135427:0|t[穿喉者]|r
    >>|cRXP_WARN_保留|r|T135662:0|t[柳叶刀]|cRXP_WARN_稍后完成任务时会用到|r << tbc
    .turnin 10548,1 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << tbc
    .turnin 10548 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << wotlk
    .vendor >>出售垃圾
    .target Eralan
    .money <0.0570 << BloodElf/Undead
    .money <0.0599 << Orc/Troll
    .itemStat 16,QUALITY,>7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
    .isQuestAvailable 9151
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_WARN_保留|r|T135662:0|t[柳叶刀]|cRXP_WARN_稍后完成任务时会用到|r << tbc
    .turnin 10548,1 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << tbc
    .turnin 10548 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << wotlk
    .target Eralan
    .isQuestAvailable 9151
step << Rogue
    #label Eralan5
    #completewith Truth
    +装备 |T135427:0|t[穿喉者] 和 |T135344:0|t[邪恶军刀]
    .use 29584
    .use 29583
    .itemcount 29584,1
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #requires Eralan5
    #completewith Truth
    +装备 |T135344:0|t[邪恶军刀]
    .use 29583
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
step << Rogue
    #requires Eralan5
    #completewith Truth
    +装备 |T135427:0|t[穿喉者]
    .use 29584
    .itemcount 29584,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达伦尼斯|r和|cRXP_FRIENDLY_瓦尔温|r和|cRXP_FRIENDLY_马尔滕迪斯|r交谈
    .accept 9151 >>接任务: |cRXP_LOOT_太阳圣殿|r
    .goto Ghostlands,46.02,31.95
    .turnin 9193 >>交任务: |cRXP_FRIENDLY_调查阿曼尼墓穴|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.84,32.81
    .turnin 9199 >>交任务: |cRXP_FRIENDLY_巨魔的邪符|r
    .goto Ghostlands,44.74,32.28
    .target Magister Darenis
    .target Advisor Valwyn
    .target Deathstalker Maltendis
    .isQuestAvailable 9151 << !Paladin/!wotlk
step
    #label Truth
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Valwyn|r和|cRXP_FRIENDLY_Maltendis|r交谈
    .turnin 9193 >>交任务: |cRXP_FRIENDLY_调查阿曼尼墓穴|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.84,32.81
    .turnin 9199 >>交任务: |cRXP_FRIENDLY_巨魔的邪符|r
    .goto Ghostlands,44.74,32.28
    .target Advisor Valwyn
    .target Deathstalker Maltendis
    .isQuestAvailable 9151 << !Paladin/!wotlk
step << Paladin wotlk
    #completewith next
    .goto Ghostlands,45.42,30.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阳翼|r交谈
    .fly Silvermoon >>飞往银月城
    .target Skymaster Sunwing
    .xp <20,1
step << Paladin wotlk
    #completewith SMTraining44
    .goto Eversong Woods,56.51,49.61,25,0
    .goto Silvermoon City,73.39,59.65
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .xp <20,1
step << Paladin wotlk
    #completewith next
    .goto Silvermoon City,82.03,68.36,25,0
    .goto Silvermoon City,84.63,48.65,25,0
    .goto Silvermoon City,84.65,43.43,25,0
    .goto Silvermoon City,89.00,36.95,15,0
    .goto Silvermoon City,89.26,35.20,15 >>前往|cRXP_FRIENDLY_Bloodvalor|r
    .xp <20,1
step << Paladin wotlk
    .goto Silvermoon City,89.26,35.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bloodvalor|r交谈
    .turnin 9685 >>交任务: |cRXP_FRIENDLY_救赎死者|r
    .target Knight-Lord Bloodvalor
    .xp <20,1
step << Paladin wotlk
    #label SMTraining44
    .goto Silvermoon City,91.19,36.94,-1
    .goto Silvermoon City,91.14,38.10,-1
	>>|cRXP_WARN_跳到下方的长凳上, 以免走上楼梯|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟里斯|r 或 |cRXP_FRIENDLY_欧塞兰|r 交谈
    .train 34769 >>训练 |T136103:0|t[召唤战马]
	.target Ithelis
	.target Osselan
    .xp <20,1
step << Warlock TBC
    +使用 |T133738:0|t[献祭之书] 和 |T133738:0|t[吞噬暗影之书]
    .collect 16351,1,9220,1 --Collect Grimoire of Sacrifice (x1)
    .collect 16357,1,9220,1 --Collect Grimoire of Consume Shadows (x1)
    .use 16351
    .use 16357
    .itemcount 16351,1
    .itemcount 16357,1
    .train 20381,1
    .train 17767,1
    .xp <18,1
step << Warlock TBC
    +使用 |T133738:0|t[献祭法典]
    .use 16351
    .itemcount 16351,1
    .train 20381,1
    .xp <16,1
step << Warlock TBC
    +使用 |T133738:0|t[吞噬暗影法典]
    .use 16357
    .itemcount 16357,1
    .train 17767,1
    .xp <18,1
step << Druid
	#completewith DruidTrain5
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
	.xp <16,1
step << Druid
    .goto Moonglade,52.53,40.57
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 783 >>训练你的职业法术 << wotlk
    .train 8925 >>训练你的职业法术 << TBC
	.target Loganaar
    .cooldown item,6948,>0
	.xp <16,1
    .xp >18,1
step << Druid
    .goto Moonglade,52.53,40.57
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 8938 >>训练你的职业法术
	.target Loganaar
    .cooldown item,6948,>0
	.xp <18,1
    .xp >20,1
step << Druid
    #label DruidTrain5
    .goto Moonglade,52.53,40.57
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 6756 >>训练你的职业法术
	.target Loganaar
    .cooldown item,6948,>0
	.xp <20,1
step << Druid/Paladin wotlk
    #completewith ReportMK
    .hs >>传送至塔奎林
    .zoneskip Ghostlands
    .cooldown item,6948,>0
step << Paladin wotlk
    #completewith ReportMK
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T136103:0|t[奎尔萨拉斯军马]|cRXP_WARN_拖到你的技能栏上|r
    .cast 34769 >>骑上你的 |T136103:0|t[奎尔萨拉斯军马]
    .train 34769,3
step << Mage/Warlock/Priest
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132660:0|t[药剂师长袍]|r
    .collect 22986,1,9220,1 --Collect Apothecary's Robe (1)
    .target Provisioner Vredigar
    .itemStat 5,QUALITY,<7
    .itemStat 5,LEVEL,<15
    .isQuestAvailable 9151 << !Paladin/!wotlk
step << Rogue/Hunter/Druid/Shaman
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132716:0|t[死亡猎手背心]|r
    .collect 22987,1,9220,1 --Collect Deathstalker's Vest (1)
    .target Provisioner Vredigar
    .itemStat 5,QUALITY,<7
    .itemStat 5,LEVEL,<15
    .isQuestAvailable 9151 << !Paladin/!wotlk
step << Mage/Warlock/Priest
    #completewith StoneOL
    +装备 |T132660:0|t[药剂师长袍]
    .use 22986
    .itemcount 22986,1
    .itemStat 5,QUALITY,<7
    .itemStat 5,LEVEL,<15
    .isQuestAvailable 9151 << !Paladin/!wotlk
step << Rogue/Hunter/Druid/Shaman
    #completewith StoneOL
    +装备 |T132716:0|t[死亡猎手之背心]
    .use 22987
    .itemcount 22987,1
    .itemStat 5,QUALITY,<7
    .itemStat 5,LEVEL,<15
    .isQuestAvailable 9151 << !Paladin/!wotlk
step << skip
    .goto Ghostlands,47.3,29.3
    .turnin 9135 >>交任务: |cRXP_FRIENDLY_返回军需官雷米尔身边|r
--VV BloodElf Mage
step
    #label ReportMK
    .goto Ghostlands,54.84,49.30,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师坎迪瑞斯|r交谈
    .turnin 9172 >>交任务: |cRXP_FRIENDLY_向魔导师坎迪瑞斯报到|r
    .accept 9176 >>接任务: |cRXP_LOOT_通灵双塔|r
    .goto Ghostlands,55.07,48.83
    .target Magister Kaendris
step
    #completewith next
    .goto Ghostlands,55.42,48.70,10,0
    .goto Ghostlands,55.32,48.35,10,0
    .goto Ghostlands,55.17,48.21,10 >>上楼
    .isOnQuest 9151
step
    .goto Ghostlands,54.87,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_魔导师伊东尼斯|r 交谈
    .turnin 9151 >>交任务: |cRXP_FRIENDLY_太阳圣殿|r
    .accept 9220 >>接任务: |cRXP_LOOT_戴索姆之战|r
    .target Magister Idonis
    .isOnQuest 9151
step
    .goto Ghostlands,54.87,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_魔导师伊东尼斯|r 交谈
    .accept 9220 >>接任务: |cRXP_LOOT_戴索姆之战|r
    .target Magister Idonis
    .isQuestTurnedIn 9151
step
    #completewith Hearts
    >>击杀|cRXP_ENEMY_纳克雷洛特|r. 击败他后搜刮其掉落的|cRXP_LOOT_头颅|r
    >>|cRXP_WARN_如果需要, 为他找一个队伍. 如果你无法组队或选择单刷, 可跳过此步骤|r
    .complete 9156,1 --Knucklerot's Head (1)
    .unitscan Knucklerot
step
    #completewith Deatholme1
    >>击杀|cRXP_ENEMY_卢兹兰|r. 击败他后搜刮他的|cRXP_LOOT_头|r
    >>|cRXP_WARN_如果需要, 为他找一个队伍. 如果你无法组队或选择单刷, 可跳过此步骤|r
    .complete 9156,2 --Luzran's Head (1)
    .unitscan Luzran
step
    #completewith next
    .goto Ghostlands,40.57,48.56,12,0
    .goto Ghostlands,40.42,49.40,10 >>进入金字形神庙
step
    .goto Ghostlands,40.37,49.75
    >>从里面的旧箱子中搜刮出石块
    .complete 9176,1 --Collect Stone of Flame (x1)
step
    #completewith next
    .goto Ghostlands,34.34,48.77,12,0
    .goto Ghostlands,34.31,48.03,10 >>进入金字形神庙
step
    #label StoneOL
    .goto Ghostlands,34.30,47.67
    >>从里面的旧箱子中搜刮出石块
    .complete 9176,2 --Collect Stone of Light (x1)
step
    #xprate <1.7
    #label Hearts
    .goto Ghostlands,37.82,52.20,50,0
    .goto Ghostlands,38.11,56.94,50,0
    .goto Ghostlands,37.73,61.43,50,0
    .goto Ghostlands,37.06,65.52,50,0
    .goto Ghostlands,36.25,70.35,50,0
    .goto Ghostlands,37.82,52.20,50,0
    .goto Ghostlands,38.11,56.94,50,0
    .goto Ghostlands,37.73,61.43,50,0
    .goto Ghostlands,37.06,65.52,50,0
    .goto Ghostlands,36.25,70.35,50,0
    .goto Ghostlands,37.82,52.20,50,0
    .goto Ghostlands,38.11,56.94,50,0
    .goto Ghostlands,37.73,61.43,50,0
    .goto Ghostlands,37.06,65.52,50,0
    .goto Ghostlands,36.25,70.35
    >>击杀 |cRXP_ENEMY_复生的游荡者|r. 从他们身上获取 |cRXP_LOOT_腐烂精华|r
    >>击杀|cRXP_ENEMY_凶骨哨兵|r和|cRXP_ENEMY_亡骨巫师|r, 击败后搜刮他们的|cRXP_LOOT_脊骨之尘|r
    >>|cRXP_WARN_小心, 凶骨哨兵会施放[盾击](需打断)|r
    .collect 22641,10,9216,1 --Collect Rotting Heart (x10)
    .collect 22642,10,9218,1 --Collect Spinal Dust (x10)
    .mob Risen Stalker
    .mob Dreadbone Sentinel
    .mob Deathcage Sorcerer
step
    #xprate >1.6999
    #label Hearts
    .goto Ghostlands,37.82,52.20,50,0
    .goto Ghostlands,38.11,56.94,50,0
    .goto Ghostlands,37.73,61.43,50,0
    .goto Ghostlands,37.06,65.52,50,0
    .goto Ghostlands,36.25,70.35,50,0
    .goto Ghostlands,37.82,52.20,50,0
    .goto Ghostlands,38.11,56.94,50,0
    .goto Ghostlands,37.73,61.43,50,0
    .goto Ghostlands,37.06,65.52,50,0
    .goto Ghostlands,36.25,70.35,50,0
    .goto Ghostlands,37.82,52.20,50,0
    .goto Ghostlands,38.11,56.94,50,0
    .goto Ghostlands,37.73,61.43,50,0
    .goto Ghostlands,37.06,65.52,50,0
    .goto Ghostlands,36.25,70.35
    >>击杀 |cRXP_ENEMY_复生的游荡者|r. 从他们身上获取 |cRXP_LOOT_腐烂精华|r
    .collect 22641,10,9216,1 --Collect Rotting Heart (x10)
    .mob Risen Stalker
    .itemcount 22641,4
step
    #label Deatholme1
    #completewith next
    .goto Ghostlands,35.17,74.71,40 >>前往戴索姆
    .isOnQuest 9220
step << Paladin/Druid/Shaman
    .goto Ghostlands,31.66,74.11,40,0
    .goto Ghostlands,31.53,76.48,40,0
    .goto Ghostlands,32.66,77.91,40,0
    .goto Ghostlands,37.19,75.45,40,0
    .goto Ghostlands,37.18,77.49,40,0
    .goto Ghostlands,38.66,76.98,40,0
    .goto Ghostlands,39.61,79.82,40,0
    .goto Ghostlands,36.41,87.05,40,0
    .goto Ghostlands,31.66,74.11,40,0
    .goto Ghostlands,31.53,76.48,40,0
    .goto Ghostlands,32.66,77.91,40,0
    .goto Ghostlands,37.19,75.45,40,0
    .goto Ghostlands,37.18,77.49,40,0
    .goto Ghostlands,38.66,76.98,40,0
    .goto Ghostlands,39.61,79.82,40,0
    .goto Ghostlands,36.41,87.05
    >>击杀|cRXP_ENEMY_Eyes of Dar'Khan|r和|cRXP_ENEMY_蛛怪百夫长|r和|cRXP_ENEMY_恸哭者|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_蛛怪百夫长|r的 |T136067:0|t[致命药膏] |cRXP_WARN_, 它每5秒造成31点伤害(可叠加). 施放|r|T135949:0|t[净化] |cRXP_WARN_以移除该效果|r << Paladin
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_蛛怪百夫长|r的 |T136067:0|t[致命药膏]|cRXP_WARN_, 它每5秒造成31点伤害(可叠加). 施放|r|T136067:0|t[解毒术]|cRXP_WARN_以清除该效果|r << Druid
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_蛛怪百夫长|r的 |T136067:0|t[致命药膏] |cRXP_WARN_, 它每5秒造成31点伤害(可叠加). 施放|r|T136067:0|t[解毒术] |cRXP_WARN_以移除该效果|r << Shaman
    .complete 9220,1 --Kill Eye of Dar'Khan (x5)
    .complete 9220,2 --Kill Nerubis Centurion (x6)
    .complete 9220,3 --Kill Wailer (x6)
    .mob Eye of Dar'Khan
    .mob Nerubis Centurion
    .mob Wailer
    .train 1152,3 << Paladin
    .train 8946,3 << Druid
    .train 526,3 << Shaman
step
    .goto Ghostlands,31.66,74.11,40,0
    .goto Ghostlands,31.53,76.48,40,0
    .goto Ghostlands,32.66,77.91,40,0
    .goto Ghostlands,37.19,75.45,40,0
    .goto Ghostlands,37.18,77.49,40,0
    .goto Ghostlands,38.66,76.98,40,0
    .goto Ghostlands,39.61,79.82,40,0
    .goto Ghostlands,36.41,87.05,40,0
    .goto Ghostlands,31.66,74.11,40,0
    .goto Ghostlands,31.53,76.48,40,0
    .goto Ghostlands,32.66,77.91,40,0
    .goto Ghostlands,37.19,75.45,40,0
    .goto Ghostlands,37.18,77.49,40,0
    .goto Ghostlands,38.66,76.98,40,0
    .goto Ghostlands,39.61,79.82,40,0
    .goto Ghostlands,36.41,87.05
    >>击杀|cRXP_ENEMY_Eyes of Dar'Khan|r和|cRXP_ENEMY_蛛怪百夫长|r和|cRXP_ENEMY_恸哭者|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_蛛怪百夫长|r的 |T136067:0|t[致命药膏]|cRXP_WARN_, 它每5秒造成31点伤害(可叠加)|r
    .complete 9220,1 --Kill Eye of Dar'Khan (x5)
    .complete 9220,2 --Kill Nerubis Centurion (x6)
    .complete 9220,3 --Kill Wailer (x6)
    .mob Eye of Dar'Khan
    .mob Nerubis Centurion
    .mob Wailer
step
    #completewith RDraught
    .hs >>传送至塔奎林
    .cooldown item,6948,>0
step
    .goto Ghostlands,48.91,32.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板卡拉林|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Priest/Mage/Warlock/Druid
    >>|cRXP_BUY_从他那里购买|r|T133978:0|t[多汁的西瓜]|r << !Priest !Mage !Warlock !Druid !Paladin
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|cRXP_BUY_和|r|T133978:0|t[多汁的西瓜]|r << Paladin
    .collect 1205,10,9281,1 << Priest/Mage/Warlock/Druid/Paladin --Melon Juice (10)
    .collect 4538,10,9281,1 << !Priest !Mage !Warlock !Druid !Paladin --Snapvine Watermelon (10)
    .collect 4538,10,9281,1 << Paladin --Snapvine Watermelon (10)
    .target Innkeeper Kalarin
    .money <0.1000 << !Paladin
    .money <0.2000 << Paladin
    .cooldown item,6948,>0
    .xp <15,1
    .xp >30,1
step
    #xprate <1.7
    #completewith Aminel
    .goto Ghostlands,48.91,31.13,12,0
    .goto Ghostlands,49.36,31.74,12,0
    .goto Ghostlands,49.36,31.74,10 >>上楼
step
    #xprate <1.7
    .goto Ghostlands,48.91,31.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师艾米妮尔|r交谈
    .accept 9216 >>接任务: |cRXP_LOOT_腐烂精华|r
    .turnin 9216 >>交任务: |cRXP_FRIENDLY_腐烂精华|r
    .accept 9218 >>接任务: |cRXP_LOOT_脊骨之尘|r
    .turnin 9218 >>交任务: |cRXP_FRIENDLY_脊骨之尘|r
    .target Magistrix Aminel
    .itemcount 22641,10
    .itemcount 22642,10
step
    #xprate <1.7
    .goto Ghostlands,48.91,31.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师艾米妮尔|r交谈
    .accept 9218 >>接任务: |cRXP_LOOT_脊骨之尘|r
    .turnin 9218 >>交任务: |cRXP_FRIENDLY_脊骨之尘|r
    .target Magistrix Aminel
    .itemcount 22642,10
step
    #label Aminel
    .goto Ghostlands,48.91,31.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师艾米妮尔|r交谈
    .accept 9216 >>接任务: |cRXP_LOOT_腐烂精华|r
    .turnin 9216 >>交任务: |cRXP_FRIENDLY_腐烂精华|r
    .target Magistrix Aminel
    .itemcount 22641,10
step << Mage/Warlock/Priest
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132660:0|t[药剂师长袍]|r
    .collect 22986,1,9220,1 --Collect Apothecary's Robe (1)
    .target Provisioner Vredigar
    .itemStat 5,QUALITY,<7
    .itemStat 5,LEVEL,<15
step << Rogue/Hunter/Druid/Shaman
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132716:0|t[死亡猎手背心]|r
    .collect 22987,1,9220,1 --Collect Deathstalker's Vest (1)
    .target Provisioner Vredigar
    .itemStat 5,QUALITY,<7
    .itemStat 5,LEVEL,<15
step << Mage/Warlock/Priest
    #completewith StoneOL
    +装备 |T132660:0|t[药剂师长袍]
    .use 22986
    .itemcount 22986,1
    .itemStat 5,QUALITY,<7
    .itemStat 5,LEVEL,<15
step << Rogue/Hunter/Druid/Shaman
    #completewith StoneOL
    +装备 |T132716:0|t[死亡猎手之背心]
    .use 22987
    .itemcount 22987,1
    .itemStat 5,QUALITY,<7
    .itemStat 5,LEVEL,<15
step
    #label Truth2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Valwyn|r和|cRXP_FRIENDLY_Maltendis|r交谈
    .turnin 9193 >>交任务: |cRXP_FRIENDLY_调查阿曼尼墓穴|r
    .goto Ghostlands,45.17,32.37,10,0
    .goto Ghostlands,44.84,32.81
    .turnin 9199 >>交任务: |cRXP_FRIENDLY_巨魔的邪符|r
    .goto Ghostlands,44.74,32.28
    .target Advisor Valwyn
    .target Deathstalker Maltendis
step
    .goto Ghostlands,46.02,33.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rathiel|r交谈
    .turnin 9156 >>交任务: |cRXP_FRIENDLY_通缉：纳克雷洛特和卢兹兰|r
    .target Deathstalker Rathiel
    .isQuestComplete 9156
step << Rogue wotlk
    #completewith Eralan6
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132273:0|t[速效药膏]|r
    .collect 6947,10,496,1 --Instant Poison (10)
    .target Eralan
    .xp <19,1
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135427:0|t[穿喉者]|cRXP_BUY_和|r|T135344:0|t[邪恶军刀]|cRXP_BUY_, 如果它们在售的话|r
    >>|cRXP_WARN_保留|r|T135662:0|t[柳叶刀]|cRXP_WARN_稍后完成任务时会用到|r << tbc
    .turnin 10548,1 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << tbc
    .turnin 10548 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << wotlk
    .vendor >>出售垃圾
    .target Eralan
    .money <0.7517 << BloodElf/Undead
    .money <0.7893 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果价格合适, 请从她那里购买|r|T135344:0|t[邪恶军刀]|r
    >>|cRXP_WARN_保留|r|T135662:0|t[柳叶刀]|cRXP_WARN_稍后完成任务时会用到|r << tbc
    .turnin 10548,1 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << tbc
    .turnin 10548 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << wotlk
    .vendor >>出售垃圾
    .target Eralan
    .money <0.6947 << BloodElf/Undead
    .money <0.7294 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,>7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果有的话, 从她那里购买|r|T135427:0|t[穿喉者]|r
    >>|cRXP_WARN_保留|r|T135662:0|t[柳叶刀]|cRXP_WARN_稍后完成任务时会用到|r << tbc
    .turnin 10548,1 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << tbc
    .turnin 10548 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << wotlk
    .vendor >>出售垃圾
    .target Eralan
    .money <0.0570 << BloodElf/Undead
    .money <0.0599 << Orc/Troll
    .itemStat 16,QUALITY,>7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_WARN_保留|r|T135662:0|t[柳叶刀]|cRXP_WARN_稍后完成任务时会用到|r << tbc
    .turnin 10548,1 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << tbc
    .turnin 10548 >>交任务: |cRXP_FRIENDLY_[The Sad Truth]|r << wotlk
    .target Eralan
    .isQuestAvailable 9151
step << Rogue
    #label Eralan6
    #completewith Jurion
    +装备 |T135427:0|t[穿喉者] 和 |T135344:0|t[邪恶军刀]
    .use 29584
    .use 29583
    .itemcount 29584,1
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #requires Eralan6
    #completewith Jurion
    +装备 |T135344:0|t[邪恶军刀]
    .use 29583
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
step << Rogue
    #requires Eralan6
    #completewith Jurion
    +装备 |T135427:0|t[穿喉者]
    .use 29584
    .itemcount 29584,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step
    #label TwinZ
    .goto Ghostlands,54.84,49.30,10,0
    .goto Ghostlands,55.07,48.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师坎迪瑞斯|r交谈
    .turnin 9176 >>交任务: |cRXP_FRIENDLY_通灵双塔|r
    .accept 9167 >>接任务: |cRXP_LOOT_叛徒的毁灭|r
    .target Magister Kaendris
step
    #completewith next
    .goto Ghostlands,55.42,48.70,10,0
    .goto Ghostlands,55.32,48.35,10,0
    .goto Ghostlands,55.17,48.21,10 >>上楼
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Idonis|r和|cRXP_FRIENDLY_Janeda|r交谈
    .turnin 9220 >>交任务: |cRXP_FRIENDLY_戴索姆之战|r
    .accept 9170 >>接任务: |cRXP_LOOT_达尔坎的军官|r
    .goto Ghostlands,54.87,48.55
    .accept 9877 >>接任务: |cRXP_LOOT_疗伤药膏|r
    .goto Ghostlands,54.82,48.35
    .target Magister Idonis
    .target Arcanist Janeda
step
    #label RDraught
    .goto Ghostlands,47.67,34.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Renzithen|r交谈
    .turnin 9877 >>交任务: |cRXP_FRIENDLY_疗伤药膏|r
    .accept 9164 >>接任务: |cRXP_LOOT_戴索姆的俘虏|r
    .target Apothecary Renzithen
step
    .goto Ghostlands,46.40,56.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vor'el|r交谈
    .turnin 9281 >>交任务: |cRXP_FRIENDLY_清理道路|r
    .target Apprentice Vor'el
step
    #completewith Varnis
    .cast 28486 >>使用|T134754:0|t[天灾驱散药膏]
    .use 22779
    .itemcount 22779,1
step
    #completewith next
    >>击杀|cRXP_ENEMY_卢兹兰|r. 击败他后搜刮他的|cRXP_LOOT_头|r
    >>|cRXP_ENEMY_卢兹兰|r|cRXP_WARN_会在流血(西部)通灵塔生成, 沿死亡之痕巡逻, 然后返回直至抵达河边|r
    >>|cRXP_WARN_如果需要, 为他找一个队伍|r << !Hunter !Warlock|r
    .complete 9156,2 --Luzran's Head (1)
    .unitscan Luzran
step
    .line Ghostlands,40.58,48.42,40.76,47.73,41.84,46.91,41.49,45.52,39.69,46.64,39.27,47.41,37.53,49.81,36.15,51.63,35.26,52.16,33.69,52.57,31.89,54.85,30.16,55.32,27.71,55.36,25.79,55.11,24.53,53.16,23.79,51.34,22.22,48.11,21.93,46.53,22.05,44.27,22.14,42.83,22.10,40.09,22.66,38.42,23.67,37.62,26.79,37.49,27.94,38.01,29.05,37.85,30.25,36.63,29.87,34.81,28.71,32.15,27.57,29.23,27.23,27.55,27.12,26.04,29.25,24.14,29.70,23.11,29.26,21.07,28.41,19.25,27.56,17.58,25.60,16.40,25.31,15.03
    .goto Ghostlands,40.58,48.42,50,0
    .goto Ghostlands,40.76,47.73,50,0
    .goto Ghostlands,41.84,46.91,50,0
    .goto Ghostlands,41.49,45.52,50,0
    .goto Ghostlands,39.69,46.64,50,0
    .goto Ghostlands,39.27,47.41,50,0
    .goto Ghostlands,37.53,49.81,50,0
    .goto Ghostlands,36.15,51.63,50,0
    .goto Ghostlands,35.26,52.16,50,0
    .goto Ghostlands,33.69,52.57,50,0
    .goto Ghostlands,31.89,54.85,50,0
    .goto Ghostlands,30.16,55.32,50,0
    .goto Ghostlands,27.71,55.36,50,0
    .goto Ghostlands,25.79,55.11,50,0
    .goto Ghostlands,24.53,53.16,50,0
    .goto Ghostlands,23.79,51.34,50,0
    .goto Ghostlands,22.22,48.11,50,0
    .goto Ghostlands,21.93,46.53,50,0
    .goto Ghostlands,22.05,44.27,50,0
    .goto Ghostlands,22.14,42.83,50,0
    .goto Ghostlands,22.10,40.09,50,0
    .goto Ghostlands,22.66,38.42,50,0
    .goto Ghostlands,23.67,37.62,50,0
    .goto Ghostlands,26.79,37.49,50,0
    .goto Ghostlands,27.94,38.01,50,0
    .goto Ghostlands,29.05,37.85,50,0
    .goto Ghostlands,30.25,36.63,50,0
    .goto Ghostlands,29.87,34.81,50,0
    .goto Ghostlands,27.12,26.04,50,0
    .goto Ghostlands,25.31,15.03,50,0
    .goto Ghostlands,40.58,48.42
    >>击杀|cRXP_ENEMY_纳克雷洛特|r. 击败他后搜刮其掉落的|cRXP_LOOT_头颅|r
    >>|cRXP_ENEMY_纳克雷洛特|r|cRXP_WARN_会在嚎叫(东部)通灵塔和通往风行者村落的道路沿线和靠近月亮圣殿的河对岸生成, 随后进入金雾村|r
    >>|cRXP_WARN_避免|r|cRXP_ENEMY_纳克雷洛特|r|cRXP_WARN_的|r|T136016:0|t[腐蚀毒药], 可通过使用|r|T135963:0|t[圣光之锤]打断 << Paladin
    >>|cRXP_WARN_避免|r|cRXP_ENEMY_纳克雷洛特|r|cRXP_WARN_的|r|T136016:0|t[腐蚀毒药]|r, 可通过|r|T132219:0|t[踢击]|r打断 << Rogue
    >>|cRXP_WARN_如果需要, 为他找一个队伍|r << !Hunter !Warlock|r
    .complete 9156,1 --Knucklerot's Head (1)
    .unitscan Knucklerot
--VV 28.71,32.15,27.57,29.23,27.23,27.55,27.12,26.04,29.25,24.14,29.70,23.11,29.26,21.07,28.41,19.25,27.56,17.58,25.60,16.40,25.31,15.03
step
    .line Ghostlands,34.35,49.33,34.18,50.75,34.27,52.13,35.59,52.11,36.15,51.60,37.01,52.90,37.70,59.57,37.30,63.89,36.97,68.06,36.39,68.31,36.77,65.23,37.87,60.95,38.12,57.42,38.20,53.38,37.93,49.52,37.65,48.77,37.57,44.63,37.95,41.65,38.66,38.08,39.29,33.57,39.64,31.98
    .goto Ghostlands,34.35,49.33,50,0
    .goto Ghostlands,34.18,50.75,50,0
    .goto Ghostlands,34.27,52.13,50,0
    .goto Ghostlands,35.59,52.11,50,0
    .goto Ghostlands,36.15,51.60,50,0
    .goto Ghostlands,37.01,52.90,50,0
    .goto Ghostlands,37.70,59.57,50,0
    .goto Ghostlands,37.30,63.89,50,0
    .goto Ghostlands,36.97,68.06,50,0
    .goto Ghostlands,36.39,68.31,50,0
    .goto Ghostlands,36.77,65.23,50,0
    .goto Ghostlands,37.87,60.95,50,0
    .goto Ghostlands,38.12,57.42,50,0
    .goto Ghostlands,38.20,53.38,50,0
    .goto Ghostlands,37.93,49.52,50,0
    .goto Ghostlands,37.65,48.77,50,0
    .goto Ghostlands,37.57,44.63,50,0
    .goto Ghostlands,37.95,41.65,50,0
    .goto Ghostlands,38.66,38.08,50,0
    .goto Ghostlands,39.29,33.57,50,0
    .goto Ghostlands,39.64,31.98,50,0
    .goto Ghostlands,34.35,49.33
    >>击杀|cRXP_ENEMY_卢兹兰|r. 击败他后搜刮他的|cRXP_LOOT_头|r
    >>|cRXP_ENEMY_卢兹兰|r|cRXP_WARN_会在流血(西部)通灵塔生成, 沿死亡之痕巡逻, 然后返回直至抵达河边|r
    >>|cRXP_WARN_如果需要, 为他找一个队伍|r << !Hunter !Warlock|r
    .complete 9156,2 --Luzran's Head (1)
    .unitscan Luzran
step
    #completewith next
    .goto Ghostlands,35.17,74.71,40 >>前往戴索姆
    .isOnQuest 9164
step
    #completewith next
    .goto Ghostlands,31.70,73.64,10,0
    .goto Ghostlands,31.78,72.91,10 >>进入墓穴
step
    #label Jurion
    .goto Ghostlands,32.19,73.08,8,0
    >>击杀|cRXP_ENEMY_欺诈者尤瑞恩|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上的|cRXP_FRIENDLY_恩尼斯|r交谈
    .complete 9170,3 --Kill Jurion the Deceiver (x1)
    .goto Ghostlands,32.10,74.45,-1
    .complete 9164,1 --Apothecary Enith Rescued
    .goto Ghostlands,32.15,73.95,-1
    .mob Jurion the Deceiver
    .target Apothecary Enith
    .skipgossip
step
    #completewith next
    .goto Ghostlands,32.19,73.08,8,0
    .goto Ghostlands,31.78,72.91,10,0
    .goto Ghostlands,31.70,73.64,10 >>离开墓穴
step
    .goto Ghostlands,37.36,79.33
    >>击杀|cRXP_ENEMY_堕落者米尔杜兰|r
    .complete 9170,1 --Kill Mirdoran the Fallen (x1)
    .mob Mirdoran the Fallen
step
    #completewith Varnis
    .goto Ghostlands,37.51,84.18,30,0
    .goto Ghostlands,40.09,83.34,10,0
    .goto Ghostlands,40.98,83.22,15 >>前往|cRXP_FRIENDLY_Varnis|r
step
    #completewith next
    .goto Ghostlands,41.24,83.04,15,0
    >>击杀|cRXP_ENEMY_放血者鲍尔古斯|r, 如果他站在|cRXP_FRIENDLY_Varnis|r旁边
    .complete 9170,2 --Kill Borgoth the Bloodletter (x1)
    .mob Borgoth the Bloodletter
step
    #label Varnis
    .goto Ghostlands,40.98,83.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与桌上的|cRXP_FRIENDLY_Varnis|r交谈
    .complete 9164,2 --Apprentice Varnis Rescued
    .target Apprentice Varnis
    .skipgossip
step
    #completewith next
    .goto Ghostlands,35.24,88.23,15,0
    .goto Ghostlands,35.77,89.13,15,0
    >>在第一座金字形神塔内寻找|cRXP_ENEMY_黑衣玛索菲特|r, 如果他出现就击杀他
    .complete 9170,4 --Kill Masophet the Black (x1)
    .mob Masophet the Black
step
    #completewith Vedoran
    .goto Ghostlands,32.84,88.21,10,0
    .goto Ghostlands,32.80,88.53,10,0
    .goto Ghostlands,32.79,89.93,15 >>前往|cRXP_FRIENDLY_Vedoran|r方向
 step
    #completewith next
    >>击杀放血者鲍尔古斯, 如果他站在维多兰附近
    .complete 9170,2 --Kill Borgoth the Bloodletter (x1)
    .mob Borgoth the Bloodletter
step
    #label Vedoran
    .goto Ghostlands,32.79,89.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与桌上的|r游侠维多兰|r交谈
    .complete 9164,3 --Ranger Vedoran Rescued
    .target Ranger Vedoran
    .skipgossip
step
    .goto Ghostlands,29.81,87.99,10,0
    .goto Ghostlands,29.28,88.89,8,0
    .goto Ghostlands,35.24,88.23,10,0
    .goto Ghostlands,35.77,89.13,8,0
    .goto Ghostlands,29.81,87.99,10,0
    .goto Ghostlands,29.28,88.89,8,0
    .goto Ghostlands,35.24,88.23,10,0
    .goto Ghostlands,35.77,89.13,8,0
    .goto Ghostlands,29.81,87.99,10,0
    .goto Ghostlands,29.28,88.89,8,0
    .goto Ghostlands,35.24,88.23,10,0
    .goto Ghostlands,35.77,89.13
    >>杀死黑衣玛索菲特|cRXP_ENEMY_Masophet the Black|r, 地点在任一神庙内
    .complete 9170,4 --Kill Masophet the Black (x1)
    .mob Masophet the Black
step
    .goto Ghostlands,32.84,88.21,10,0
    .goto Ghostlands,32.80,88.53,10,0
    .goto Ghostlands,32.67,90.30,8,0
    .goto Ghostlands,40.09,83.34,10,0
    .goto Ghostlands,41.24,83.04,8,0
    .goto Ghostlands,32.84,88.21,10,0
    .goto Ghostlands,32.80,88.53,10,0
    .goto Ghostlands,32.67,90.30,8,0
    .goto Ghostlands,40.09,83.34,10,0
    .goto Ghostlands,41.24,83.04,8,0
    .goto Ghostlands,32.84,88.21,10,0
    .goto Ghostlands,32.80,88.53,10,0
    .goto Ghostlands,32.67,90.30,8,0
    .goto Ghostlands,40.09,83.34,10,0
    .goto Ghostlands,41.24,83.04
    >>击杀任一屠宰场内的放血者鲍尔古斯
    .complete 9170,2 --Kill Borgoth the Bloodletter (x1)
    .mob Borgoth the Bloodletter
step
    .goto Ghostlands,32.25,82.18,10,0
    .goto Ghostlands,32.80,82.45,10,0
    .goto Ghostlands,32.65,83.15,8 >>进入中央的金字形神塔, 杀死里面所有的达坎之眼和戴索姆通灵师
    .mob Eye of Dar'Khan
    .mob Deatholme Necromancer
    .isOnQuest 9167
step
    .goto Ghostlands,32.80,82.39,10,0
    .goto Ghostlands,33.04,81.25
    >>击杀位于神塔底部的|cRXP_ENEMY_Dar'Khan Drathir|r
    >>|cRXP_WARN_LoS 他|r|T136118:0|t[腐蚀之触]|cRXP_WARN_和|r|T136197:0|t[暗影箭], 通过绕着通灵塔放风筝来
    >>|cRXP_WARN_确保在他对你施放|r|T136183:0|t[恐惧]|cRXP_WARN_时, 周围没有其他怪物|r
    >>|cRXP_WARN_使用|r|T135738:0|t[法力汲取] |cRXP_WARN_将|r|cRXP_ENEMY_亡灵巫师|r|cRXP_WARN_拉出房间|r << BloodElf Paladin tbc/BloodElf Rogue tbc
    >>|cRXP_WARN_如果需要, 为他找一个队伍|r << !Hunter !Warlock
    .complete 9167,1 --Collect Dar'Khan's Head (x1)
    .mob Dar'Khan Drathir
step
    #xprate 1.49-1.58
    .goto Ghostlands,32.80,82.45
    .xp 21+14900 >>升级至14900/22400经验值
    .isOnQuest 9156
step
    #xprate 1.49-1.58
    .goto Ghostlands,32.80,82.45
    .xp 21+18650 >>升级至18650/22400经验值
    .isQuestTurnedIn 9156
step
    #xprate 1.58-1.68
    .goto Ghostlands,32.80,82.45
    .xp 21+14400 >>升级至14400/22400经验值
    .isOnQuest 9156
step
    #xprate 1.58-1.68
    .goto Ghostlands,32.80,82.45
    .xp 21+18400 >>升级至18400/22400经验值
    .isQuestTurnedIn 9156
step
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step
    .goto Ghostlands,54.84,49.30,10,0
    .goto Ghostlands,55.07,48.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师坎迪瑞斯|r交谈
    .turnin 9167 >>交任务: |cRXP_FRIENDLY_叛徒的毁灭|r
    .accept 9328 >>接任务: |cRXP_LOOT_辛多雷的英雄|r << BloodElf
    .accept 9811 >>接任务: |cRXP_LOOT_辛多雷的朋友|r << !BloodElf
    .target Magister Kaendris
    .isQuestComplete 9167
step
    .goto Ghostlands,54.84,49.30,10,0
    .goto Ghostlands,55.07,48.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师坎迪瑞斯|r交谈
    .accept 9328 >>接任务: |cRXP_LOOT_辛多雷的英雄|r << BloodElf
    .accept 9811 >>接任务: |cRXP_LOOT_辛多雷的朋友|r << !BloodElf
    .target Magister Kaendris
    .isQuestTurnedIn 9167
step
    #completewith next
    .goto Ghostlands,55.42,48.70,10,0
    .goto Ghostlands,55.32,48.35,10,0
    .goto Ghostlands,55.17,48.21,10 >>上楼
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Idonis|r和|cRXP_FRIENDLY_Janeda|r交谈
    .turnin 9170 >>交任务: |cRXP_FRIENDLY_达尔坎的军官|r
    .goto Ghostlands,54.87,48.55
    .turnin 9164 >>交任务: |cRXP_FRIENDLY_戴索姆的俘虏|r
    .goto Ghostlands,54.82,48.35
    .target Magister Idonis
    .target Arcanist Janeda
step << !Troll/!wotlk !Orc/!wotlk
    #completewith KnuLuz
    .hs >>传送至塔奎林
    .cooldown item,6948,>0
step
    .goto Ghostlands,47.71,32.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vredigar|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133759:0|t[塔奎林冠军斗篷]|r
    .collect 22990,1,496,1 --Collect Tranquillien Champion's Cloak (1)
    .target Provisioner Vredigar
    .itemStat 15,LEVEL,<21
    .isQuestTurnedIn 9167
step << Rogue wotlk
    #completewith SMTraining5
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132273:0|t[速效药膏]|r
    .collect 6947,10,496,1 --Instant Poison (10)
    .target Eralan
    .xp <19,1
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135427:0|t[穿喉者]|cRXP_BUY_和|r|T135344:0|t[邪恶军刀]|cRXP_BUY_, 如果它们在售的话|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.7517 << BloodElf/Undead
    .money <0.7893 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果价格合适, 请从她那里购买|r|T135344:0|t[邪恶军刀]|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.6947 << BloodElf/Undead
    .money <0.7294 << Orc/Troll
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,>7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>12.5 << wotlk
step << Rogue
    .goto Ghostlands,47.20,34.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉兰|r交谈
    >>|cRXP_BUY_如果有的话, 从她那里购买|r|T135427:0|t[穿喉者]|r
    .vendor 16268 >>出售垃圾
    .target Eralan
    .money <0.0570 << BloodElf/Undead
    .money <0.0599 << Orc/Troll
    .itemStat 16,QUALITY,>7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #label Eralan7
    #completewith SMTraining5
    +装备 |T135427:0|t[穿喉者] 和 |T135344:0|t[邪恶军刀]
    .use 29584
    .use 29583
    .itemcount 29584,1
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step << Rogue
    #requires Eralan7
    #completewith SMTraining5
    +装备 |T135344:0|t[邪恶军刀]
    .use 29583
    .itemcount 29583,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.0
step << Rogue
    #requires Eralan7
    #completewith SMTraining5
    +装备 |T135427:0|t[穿喉者]
    .use 29584
    .itemcount 29584,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5 << wotlk
step
    #label KnuLuz
    .goto Ghostlands,46.02,33.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rathiel|r交谈
    .turnin 9156 >>交任务: |cRXP_FRIENDLY_通缉：纳克雷洛特和卢兹兰|r
    .target Deathstalker Rathiel
    .isQuestComplete 9156
step
    #xprate <1.5
    .goto Ghostlands,37.82,52.20,50,0
    .goto Ghostlands,38.11,56.94,50,0
    .goto Ghostlands,37.73,61.43,50,0
    .goto Ghostlands,37.06,65.52,50,0
    .goto Ghostlands,36.25,70.35,50,0
    .goto Ghostlands,37.82,52.20,50,0
    .goto Ghostlands,38.11,56.94,50,0
    .goto Ghostlands,37.73,61.43,50,0
    .goto Ghostlands,37.06,65.52,50,0
    .goto Ghostlands,36.25,70.35,50,0
    .goto Ghostlands,37.82,52.20,50,0
    .goto Ghostlands,38.11,56.94,50,0
    .goto Ghostlands,37.73,61.43,50,0
    .goto Ghostlands,37.06,65.52,50,0
    .goto Ghostlands,36.25,70.35
    .xp 20 >>升级至20级
step
    #completewith SMTraining5
    .goto Ghostlands,45.42,30.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阳翼|r交谈
    .fly Silvermoon >>飞往银月城
    .target Skymaster Sunwing
step << Mage
    .goto Eversong Woods,55.70,54.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Antheol|r交谈
    .turnin 9404 >>交任务: |cRXP_FRIENDLY_活动的树木|r
    .target Instructor Antheol
step << BloodElf !Warlock !Paladin wotlk
    .goto Eversong Woods,61.08,54.15,12,0
    .goto Eversong Woods,61.38,53.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佩拉斯卡米|r交谈
    .skill riding,75 >>从他那里学习|T136103:0|t[学徒骑术]
	.target Perascamin
    .money <4.5 << Rogue
    .money <4.693 << !Rogue
step << BloodElf !Warlock !Paladin wotlk
    .goto Eversong Woods,61.08,54.15,12,0
    .goto Eversong Woods,61.09,54.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维奈丝特拉|r交谈
    +|cRXP_BUY_从她那里购买任意|r|T132228:0|t[鹰击者]|cRXP_BUY_你喜欢的坐骑|r
	.target Winaestra
    .itemcount 28927,<1 --Red Hawkstrider
    .itemcount 29220,<1 --Blue Hawkstrider
    .itemcount 29221,<1 --Black Hawkstrider
    .itemcount 29222,<1 --Purple Hawkstrider
    .money <0.9025 << Rogue
    .money <1.083 << !Rogue
    .skill riding,<75,1
step << BloodElf !Warlock !Paladin wotlk
    .cast 55884 >>使用 |T132227:0|t[杜隆塔尔, 北杜隆塔尔] 来学习它
    .use 28927
    .itemcount 28927,1
step << BloodElf !Warlock !Paladin wotlk
    .cast 55884 >>使用 |T132229:0|t[蓝色陆行鸟] 来学习它
    .use 29220
    .itemcount 29220,1
step << BloodElf !Warlock !Paladin wotlk
    .cast 55884 >>使用 |T132228:0|t[黑色陆行鸟] 学习它
    .use 29221
    .itemcount 29221,1
step << BloodElf !Warlock !Paladin wotlk
    .cast 55884 >>使用 |T132231:0|t[紫色陆行鸟] 来学习它
    .use 29222
    .itemcount 29222,1
step << BloodElf !Warlock !Paladin wotlk
    #completewith LorThemar
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132227:0|t[杜隆塔尔, 北杜隆塔尔]|cRXP_WARN_拖到你的快捷栏上|r
    .cast 34795 >>骑上你的 |T132227:0|t[北杜隆塔尔红鹰兽]
    .train 34795,3
step << BloodElf !Warlock !Paladin wotlk
    #completewith LorThemar
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132229:0|t[蓝色陆行鸟]|cRXP_WARN_拖拽到你的动作条上|r
    .cast 35020 >>骑上你的 |T132229:0|t[蓝色陆行鸟]
    .train 35020,3
step << BloodElf !Warlock !Paladin wotlk
    #completewith LorThemar
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132228:0|t[黑色陆行鸟]|cRXP_WARN_拖到你的动作条上|r
    .cast 29221 >>骑上你的 |T132228:0|t[黑色陆行鸟]
    .train 29221,3
step << BloodElf !Warlock !Paladin wotlk
    #completewith LorThemar
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132231:0|t[紫色陆行鸟]|cRXP_WARN_拖到你的快捷栏上|r
    .cast 29222 >>骑上你的 |T132231:0|t[紫色陆行鸟]
    .train 29222,3
step << Mage/Priest/Warlock/Hunter/Paladin
    #completewith SMTraining5
    .goto Eversong Woods,56.51,49.61,25,0
    .goto Silvermoon City,73.39,59.65
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
step << Priest
    .goto Silvermoon City,60.65,63.45,15,0
    .goto Silvermoon City,65.92,53.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维纳|r交谈
    >>|cRXP_BUY_如果价格便宜, 从拍卖行购买|r |T135144:0|t[强效魔法杖] |r
    >>|cRXP_WARN_如果它们都太贵, 就跳过这一步|r
    .collect 11288,1,496,1 --Greater Magic Wand
    .target Vynna
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.5
step << Priest/Mage
    #completewith SMTraining5
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,62.89,31.26,30,0
    .goto Silvermoon City,57.45,24.46,15,0
    .goto Silvermoon City,55.31,24.96,15,0 << Priest
    .goto Silvermoon City,57.21,21.25,15,0 << Mage
    .goto Silvermoon City,55.38,26.76,12 >>前往|cRXP_FRIENDLY_洛塞兰|r << Priest
    .goto Silvermoon City,57.16,18.85,12 >>前往|cRXP_FRIENDLY_塞伊丹纳|r << Mage
step << Priest
    #label SMTraining5
    .goto Silvermoon City,55.38,26.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛塞兰|r交谈
    .train 7128 >>训练你的职业法术
    .target Lotheolan
step << Mage
    .goto Silvermoon City,57.16,18.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞伊丹纳|r交谈
    .train 1953 >>训练你的职业法术
step << Mage
    #label SMTraining5
    .goto Silvermoon City,58.07,20.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳林斯|r交谈
    .train 32272 >>坐骑 |T135761:0|t[传送:银月城]
    .target Narinth
    .money <0.5000
step << Hunter
    #completewith SMTraining5
    .goto Silvermoon City,83.52,48.68,30,0
    .goto Silvermoon City,83.50,43.40,20,0
    .goto Silvermoon City,83.45,30.13,15,0
    .goto Silvermoon City,83.45,28.56,15,0
    .goto Silvermoon City,84.71,28.05,15 >>前往|cRXP_FRIENDLY_桑迪恩|r
step << Hunter
    #label SMTraining5
    .goto Silvermoon City,84.71,28.05
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪恩|r交谈
    .train 14282 >>训练你的职业法术
    .target Zandine
 step << Hunter
    .goto Silvermoon City,86.24,35.45
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞兰娜|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135489:0|t[重型弯弓]|r
    .collect 3027,1,496,1 --Reinforced Bow (1)
    .target Celana
    .money <0.6032 << BloodElf
    .money <0.6336 << Troll/Orc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.7
step << Warlock
    #completewith SMTraining5
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,75.62,58.31,20,0
    .goto Silvermoon City,75.95,52.92,30,0
    .goto Silvermoon City,75.65,45.04,15,0
    .goto Silvermoon City,76.33,43.33,12 >>进入建筑内, 然后下楼梯
step << Warlock TBC
    .goto Silvermoon City,73.97,44.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托利安|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133738:0|t[魔典：折磨(等级 2)]|r
    .collect 16346,1,496,1 --Grimoire of Torment Rank 2
    .target Torian
    .train 20317,1
step << Warlock TBC
    +使用 |T133738:0|t[魔典：折磨(等级 2)]
    .use 16346
    .itemcount 16346,1
    .train 20317,1
step << Warlock
    #label SMTraining5
    .goto Silvermoon City,74.39,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莱尼娅|r交谈
    .train 5784 >>训练 |T136103:0|t[召唤地狱战马] << wotlk
    .train 706 >>训练你的职业法术 << tbc
    .target Talionia
step << Warlock wotlk
    #completewith LorThemar
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T136103:0|t[骑乘用马] |cRXP_WARN_拖到你的动作条上|r
    .cast 5784 >>骑上你的 |T136103:0|t[魔化战马]
    .train 5784,3
step << Paladin wotlk
    #completewith SMTraining5
    .goto Silvermoon City,82.03,68.36,25,0
    .goto Silvermoon City,84.63,48.65,25,0
    .goto Silvermoon City,84.65,43.43,25,0
    .goto Silvermoon City,89.00,36.95,20 >>前往|cRXP_FRIENDLY_伊瑟里斯|r和|cRXP_FRIENDLY_欧塞兰|r
    .isQuestTurnedIn 9685
step << Paladin
    #completewith next
    .goto Silvermoon City,82.03,68.36,25,0
    .goto Silvermoon City,84.63,48.65,25,0
    .goto Silvermoon City,84.65,43.43,25,0
    .goto Silvermoon City,89.00,36.95,15,0
    .goto Silvermoon City,89.26,35.20,15 >>前往|cRXP_FRIENDLY_Bloodvalor|r
--   .train 647,1 << Paladin tbc
--  .train 62124,1 << Paladin wotlk
step << Paladin
    .goto Silvermoon City,89.26,35.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bloodvalor|r交谈
    .turnin 9685 >>交任务: |cRXP_FRIENDLY_救赎死者|r
    .target Knight-Lord Bloodvalor
step << Paladin wotlk
    .goto Silvermoon City,91.19,36.94,-1
    .goto Silvermoon City,91.14,38.10,-1
	>>|cRXP_WARN_跳到下方的长凳上, 以免走上楼梯|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟里斯|r 或 |cRXP_FRIENDLY_欧塞兰|r 交谈
    .train 34769 >>训练 |T136103:0|t[召唤战马]
	.target Ithelis
	.target Osselan
    .train 34769,1
step << Paladin
    #completewith LorThemar
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T136103:0|t[奎尔萨拉斯军马]|cRXP_WARN_拖到你的技能栏上|r
    .cast 34769 >>骑上你的 |T136103:0|t[奎尔萨拉斯军马]
    .train 34769,3
step << Rogue
    #completewith SMTraining5
    .goto Silvermoon City,73.39,59.65,30,0
    .goto Silvermoon City,76.55,52.05,20,0
    .goto Silvermoon City,79.70,52.16,20 >>前往|cRXP_FRIENDLY_瑟兰尼斯|r
step << Rogue
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    >>|cRXP_WARN_确保你已训练|r|T132282:0|t[伏击]|cRXP_WARN_和|r|T132302:0|t[割裂]|cRXP_WARN_, 以便完成后续任务|r << tbc
    .accept 10794 >>接任务: |cRXP_LOOT_碎手盗贼|r
    .train 8676 >>训练 |T132282:0|t[伏击] << tbc
    .train 1943 >>训练 |T132302:0|t[割裂] << tbc
    .train 1943 >>训练你的职业法术 << wotlk
    .target Zelanis
    .xp <20,1
    .xp >22,1
step << Rogue
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    >>|cRXP_WARN_确保你已训练|r|T132282:0|t[伏击]|cRXP_WARN_和|r|T132302:0|t[割裂]|cRXP_WARN_, 以便完成后续任务|r << tbc
    .accept 10794 >>接任务: |cRXP_LOOT_碎手盗贼|r
    .train 8676 >>训练 |T132282:0|t[伏击] << tbc
    .train 1943 >>训练 |T132302:0|t[割裂] << tbc
    .train 1759 >>训练你的职业法术
    .target Zelanis
    .xp <22,1
    .xp >24,1
step << Rogue
    #label SMTraining5
    .goto Silvermoon City,79.70,52.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟兰尼斯|r交谈
    >>|cRXP_WARN_确保你已训练|r|T132282:0|t[伏击]|cRXP_WARN_和|r|T132302:0|t[割裂]|cRXP_WARN_, 以便完成后续任务|r << tbc
    .accept 10794 >>接任务: |cRXP_LOOT_碎手盗贼|r
    .train 8676 >>训练 |T132282:0|t[伏击] << tbc
    .train 1943 >>训练 |T132302:0|t[割裂] << tbc
    .train 6762 >>训练你的职业法术 << wotlk
    .target Zelanis
    .xp <24,1
step << Rogue wotlk
    .goto Silvermoon City,80.47,51.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达尔莉亚|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132273:0|t[速效药膏]|r
    .collect 6947,10,496,1 --Instant Poison (10)
    .target Darlia
step << Druid
    .goto Silvermoon City,72.53,56.24,10,0
    .goto Silvermoon City,71.55,55.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈雷尼|r交谈
    .train 8938 >>训练你的职业法术
    .target Harene Plainwalker
	.xp <18,1
	.xp >20,1
step << Druid
    .goto Silvermoon City,72.53,56.24,10,0
    .goto Silvermoon City,71.55,55.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈雷尼|r交谈
    .train 6756 >>训练你的职业法术
    .target Harene Plainwalker
	.xp <20,1
	.xp >22,1
step << Druid
    .goto Silvermoon City,72.53,56.24,10,0
    .goto Silvermoon City,71.55,55.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈雷尼|r交谈
    .train 8926 >>训练你的职业法术
    .target Harene Plainwalker
	.xp <22,1
step << skip
    .goto Silvermoon City,53.926,71.029
    .turnin 9134 >>交任务: |cRXP_FRIENDLY_葛拉米|r
--VV BloodElf Paladin
step << Warlock
    .abandon 10605 >>放弃凯伦丁的召唤
step
    #completewith UndercitySM
    .goto Silvermoon City,75.76,58.26,20,0 << Druid
    .goto Silvermoon City,75.35,51.78,30,0 << Druid
    .goto Silvermoon City,79.93,33.54,30,0 << Paladin wotlk
    .goto Silvermoon City,77.32,33.43,20,0 << Hunter/Paladin wotlk
    .goto Silvermoon City,74.47,36.83,20,0 << Hunter/Paladin wotlk
    .goto Silvermoon City,63.47,31.98,20,0
    .goto Silvermoon City,57.48,24.49,20,0
    .goto Silvermoon City,53.80,20.23,50 >>前往|cRXP_FRIENDLY_Lor'themar|r
step
    .goto Silvermoon City,53.80,20.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛瑟玛·多里安|r交谈
    .turnin 9328 >>交任务: |cRXP_FRIENDLY_辛多雷的英雄|r << BloodElf
    .accept 9621 >>接任务: |cRXP_LOOT_部落的特使|r << BloodElf
    .turnin 9811 >>交任务: |cRXP_FRIENDLY_辛多雷的朋友|r << !BloodElf
    .accept 9812 >>接任务: |cRXP_LOOT_部落的特使|r << !BloodElf
    .target Lor'themar Theron
    .isOnQuest 9328 << BloodElf
    .isOnQuest 9811 << !BloodElf
step
    #label LorThemar
    .goto Silvermoon City,53.80,20.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛瑟玛·多里安|r交谈
    .accept 9621 >>接任务: |cRXP_LOOT_部落的特使|r << BloodElf
    .accept 9812 >>接任务: |cRXP_LOOT_部落的特使|r << !BloodElf
    .target Lor'themar Theron
    .isQuestTurnedIn 9328 << BloodElf
    .isQuestTurnedIn 9811 << !BloodElf
step
    #completewith UndercitySM
    .goto Silvermoon City,51.83,17.91,30,0
    .goto Silvermoon City,49.45,15.00
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
step
    #completewith UndercitySM
    .goto Undercity,59.81,11.33,20,0
    .goto Undercity,66.08,18.24,30,0
    .goto Undercity,66.04,32.97,30,0
    .goto Undercity,65.97,44.08,30,0
    .goto Undercity,60.52,44.02,10,0 << !Undead/!Mage
    .goto Undercity,71.33,44.14,10,0 << Undead Mage
    .goto Undercity,60.07,47.70,10 >>乘坐升降梯前往幽暗城 << !Undead/!Mage
    .goto Undercity,71.88,40.45,10 >>乘坐升降梯前往幽暗城 << Undead Mage
step << !Undead
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .fp Undercity >>获取幽暗城飞行路径
    .target Michael Garrett
step
    #xprate >1.4999
    .goto Undercity,67.73,37.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺曼|r交谈
    .home >>将你的[炉石]设置为幽暗城
    .target Innkeeper Norman
step << Mage
    #completewith next
    .goto Undercity,68.25,40.67,15,0
    .goto Undercity,66.06,30.63,20,0
    .goto Undercity,67.27,23.68,20,0
    .goto Undercity,82.77,15.85,20 >>前往|cRXP_FRIENDLY_汉娜|r
step << Mage
    .goto Undercity,82.77,15.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉娜|r交谈
    >>|cRXP_BUY_从她那里购买|r|T134419:0|t[传送符文]|r
    .collect 17031,1,496,1 --Rune of Teleportation (1)
    .money <0.3000 << Troll
    .money <0.2850 << !Troll
    .target Hannah Akeley
step << Mage
    .goto Undercity,84.19,15.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_Mortaim|r交谈
    .train 3563 >>坐骑 |T135766:0|t[传送:幽暗城]
    .money <0.2000 << Troll
    .money <0.1900 << !Troll
    .target Lexington Mortaim
step << Rogue
    .goto Undercity,77.49,49.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳撒尼尔|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135423:0|t[破损的致命飞斧]|r
    .collect 25875,1,496,1 --Deadly Throwing Axe (1)
    .target Nathaniel Steenwick
    .itemStat 18,QUALITY,<2
    .isQuestAvailable 496
step << Rogue
    #completewith next
    +装备 |T135423:0|t[破损的致命飞斧]
    .use 25875
    .itemcount 25875,1
    .itemStat 18,QUALITY,<2
step
    #completewith UndercitySM
    .goto Undercity,63.84,47.17,5,0 << !Mage
    .goto Undercity,65.50,56.75,20,0 << !Mage
    .goto Undercity,64.42,64.62,20,0 << !Mage
    .goto Undercity,51.88,64.84,20,0
    .goto Undercity,46.28,73.10,15,0
    .goto Undercity,45.31,78.24,15,0
    .goto Undercity,46.18,83.63,15,0
    .goto Undercity,48.80,87.63,15,0
    .goto Undercity,52.45,89.49,15,0
    .goto Undercity,58.06,91.79,20 >>前往皇家区内的|cRXP_FRIENDLY_Sylvanas|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sylvanas|r和|cRXP_FRIENDLY_Sunsorrow|r交谈
    .turnin 9621 >>交任务: |cRXP_FRIENDLY_部落的特使|r << BloodElf
    .accept 9626 >>接任务: |cRXP_LOOT_觐见酋长|r << BloodElf
    .turnin 9180 >>交任务: |cRXP_FRIENDLY_幽暗城之旅|r << BloodElf
    .turnin 9812 >>交任务: |cRXP_FRIENDLY_部落的特使|r << !BloodElf
    .accept 9813 >>接任务: |cRXP_LOOT_觐见酋长|r << !BloodElf
    .turnin 9177 >>交任务: |cRXP_FRIENDLY_幽暗城之旅|r << !BloodElf
    .goto Undercity,58.06,91.79
    .accept 9425 >>接任务: |cRXP_LOOT_前往塔伦米尔|r << BloodElf
    .goto Undercity,57.77,90.57 << BloodElf
    .target Lady Sylvanas Windrunner
    .target Ambassador Sunsorrow << BloodElf
    .isOnQuest 9621 << BloodElf
    .isOnQuest 9812 << !BloodElf
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sylvanas|r和|cRXP_FRIENDLY_Sunsorrow|r交谈
    .accept 9626 >>接任务: |cRXP_LOOT_觐见酋长|r << BloodElf
    .turnin 9180 >>交任务: |cRXP_FRIENDLY_幽暗城之旅|r << BloodElf
    .accept 9813 >>接任务: |cRXP_LOOT_觐见酋长|r << !BloodElf
    .turnin 9177 >>交任务: |cRXP_FRIENDLY_幽暗城之旅|r << !BloodElf
    .goto Undercity,58.06,91.79
    .accept 9425 >>接任务: |cRXP_LOOT_前往塔伦米尔|r << BloodElf
    .goto Undercity,57.77,90.57 << BloodElf
    .target Lady Sylvanas Windrunner
    .target Ambassador Sunsorrow << BloodElf
    .isQuestTurnedIn 9621 << BloodElf
    .isQuestTurnedIn 9812 << !BloodElf
step
    #label UndercitySM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sylvanas|r和|cRXP_FRIENDLY_Sunsorrow|r交谈
    .turnin 9177 >>交任务: |cRXP_FRIENDLY_幽暗城之旅|r << !BloodElf
    .turnin 9180 >>交任务: |cRXP_FRIENDLY_幽暗城之旅|r << BloodElf
    .goto Undercity,58.06,91.79
    .accept 9425 >>接任务: |cRXP_LOOT_前往塔伦米尔|r << BloodElf
    .goto Undercity,57.77,90.57 << BloodElf
    .target Lady Sylvanas Windrunner
    .target Ambassador Sunsorrow << BloodElf
step << Paladin
    .goto Undercity,58.00,90.46
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞希娅·黎明玫瑰|r交谈
    .train 879 >>训练你的职业法术
	.target Champion Cyssa Dawnrose
    .xp <20,1
    .xp >22,1
step << Paladin
    .goto Undercity,58.00,90.46
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞希娅·黎明玫瑰|r交谈
    .train 19835 >>训练你的职业法术
	.target Champion Cyssa Dawnrose
    .xp <22,1
    .xp >24,1
step << Paladin
    #label SMTraining5
    .goto Undercity,58.00,90.46
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞希娅·黎明玫瑰|r交谈
    .train 5588 >>训练你的职业法术
	.target Champion Cyssa Dawnrose
    .xp <24,1
step << skip --logout skip
    #completewith ExitUC
    .goto Undercity,55.20,90.91
    .goto Undercity,67.88,14.97,30 >>|cRXP_WARN_前往皇家区主平台的边缘, 通过调整角色位置使其看起来像是漂浮状态, 然后执行登出再重新登录, 完成一次“登出跳过”|r
    .link https://www.youtube.com/watch?v=jj85AXyF1XE >>|cRXP_WARN_点击这里|r
step
    .abandon 9156 >>通缉：克努克罗特与卢兹兰
    .abandon 9167 >>放弃叛徒的毁灭
    .isOnQuest 9156
    .isOnQuest 9167
step
    .abandon 9156 >>通缉：克努克罗特与卢兹兰
    .isOnQuest 9156
step
    .abandon 9167 >>放弃叛徒的毁灭
    .isOnQuest 9167
step
    #label ExitUC
    .goto Undercity,66.21,4.90,15,0
    .goto Tirisfal Glades,61.73,64.87
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .isQuestAvailable 496
step << !Warlock Undead wotlk
    .goto Tirisfal Glades,60.08,52.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velma|r交谈
    .skill riding,75 >>学习 |T136103:0|t[学徒骑术] 从她那里
    .target Velma Warnam
    .money <4.5
step << !Warlock Undead wotlk
    .goto Tirisfal Glades,59.87,52.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_撒迦利亚·普斯特|r交谈
    +|cRXP_BUY_从他那里购买任何你喜欢的|r|T132264:0|t[骸骨战马]|r
	.target Zachariah Post
    .itemcount 13331,<1 --Red Skeletal Horse
    .itemcount 13332,<1 --Blue Skeletal Horse
    .itemcount 13333,<1 --Brown Skeletal Horse
    .itemcount 46308,<1 --Brown Skeletal Horse
    .money <0.9025
    .skill riding,<75,1
step << !Warlock Undead wotlk
    .cast 55884 >>使用|T132264:0|t[红色骸骨军马]来学习它
    .use 13331
    .itemcount 13331,1
step << !Warlock Undead wotlk
    .cast 55884 >>使用|T132264:0|t[蓝色骸骨军马]来学习它
    .use 13332
    .itemcount 13332,1
step << !Warlock Undead wotlk
    .cast 55884 >>使用 |T132264:0|t[棕色骸骨军马] 来学习它
    .use 13333
    .itemcount 13333,1
step << !Warlock Undead wotlk
    .cast 55884 >>使用|T132264:0|t[骑乘用骸骨战马(黑色)]来学习它
    .use 46308
    .itemcount 46308,1
step << !Warlock Undead wotlk
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132264:0|t[红色骸骨军马]|cRXP_WARN_拖到你的快捷栏上|r
    .cast 17462 >>骑上你的 |T132264:0|t[红色骸骨军马]
    .train 17462,3
step << !Warlock Undead wotlk
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132264:0|t[蓝色骸骨军马] |cRXP_WARN_拖到你的动作条上|r
    .cast 17463 >>骑上你的 |T132264:0|t[蓝色骸骨军马]
    .train 17463,3
step << !Warlock Undead wotlk
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132264:0|t[棕色骸骨军马] |cRXP_WARN_拖拽到你的动作条上|r
    .cast 17464 >>骑上你的 |T132264:0|t[棕色骸骨军马]
    .train 17464,3
step << !Warlock Undead wotlk
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132264:0|t[骑乘用骸骨战马] |cRXP_WARN_拖到你的动作条上|r
    .cast 64977 >>骑上你的 |T132264:0|t[骑乘用骸骨战马]
    .train 64977,3
step
    #xprate <1.5
    #label Durotar
    .goto Tirisfal Glades,61.06,58.86,12,0
    .goto Tirisfal Glades,61.51,59.01,10,0
    .goto Tirisfal Glades,61.27,59.22,8,0
    .goto Tirisfal Glades,61.13,58.84,8,0
    .goto Tirisfal Glades,61.38,58.71,8,0
    .goto Tirisfal Glades,61.34,59.17,8,0
    .goto Tirisfal Glades,60.51,58.69,-1
    .goto Tirisfal Glades,60.94,46.35,-1
    >>登上齐柏林飞艇塔
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Troll wotlk/Orc wotlk !Warlock
    #xprate >1.4999
    .goto Tirisfal Glades,61.06,58.86,12,0
    .goto Tirisfal Glades,61.51,59.01,10,0
    .goto Tirisfal Glades,61.27,59.22,8,0
    .goto Tirisfal Glades,61.13,58.84,8,0
    .goto Tirisfal Glades,61.38,58.71,8,0
    .goto Tirisfal Glades,61.34,59.17,8,0
    .goto Tirisfal Glades,60.51,58.69,-1
    .goto Tirisfal Glades,60.94,46.35,-1
    >>登上齐柏林飞艇塔
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    .money <4.5
step << !Warlock Orc wotlk
    #xprate >1.4999
    #completewith next
    .goto Orgrimmar,49.59,94.74,30,0
    .goto Orgrimmar,49.42,90.90,30,0
    .goto Orgrimmar,52.26,88.65,30,0
    .goto Orgrimmar,50.73,60.94,30,0
    .goto Orgrimmar,52.15,58.31,30,0
    .goto Orgrimmar,63.08,39.25,30,0
    .goto Orgrimmar,64.31,38.12,30,0
    .goto Orgrimmar,66.07,40.04,30,0
    .goto Orgrimmar,72.25,21.42,30,0
    .goto Orgrimmar,69.41,13.11,20 >>前往|cRXP_FRIENDLY_基尔达|r
    .money <4.5
step << !Warlock Orc wotlk
    #xprate >1.4999
    .goto Orgrimmar,69.41,13.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔达|r交谈
    .skill riding,75 >>从他那里学习|T136103:0|t[学徒骑术]
    .target Kildar
    .money <4.5
step << !Warlock Orc wotlk
    #xprate >1.4999
    .goto Orgrimmar,69.38,12.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ogunaro|r交谈
    +|cRXP_BUY_从他那里购买任何|r|T132224:0|t[狼]|r
	.target Ogunaro Wolfrunner
    .itemcount 1132,<1 --Horn of the Timber Wolf
    .itemcount 5665,<1 --Horn of the Dire Wolf
    .itemcount 5668,<1 --Horn of the Brown Wolf
    .itemcount 46099,<1 --Horn of the Black Wolf
    .money <0.9025
    .skill riding,<75,1
step << !Warlock Orc wotlk
    #xprate >1.4999
    .cast 55884 >>使用 |T132224:0|t[棕狼号角] 来学习它
    .use 1132
    .itemcount 1132,1
step << !Warlock Orc wotlk
    #xprate >1.4999
    .cast 55884 >>使用 |T132266:0|t[暗灰狼号角] 来学习它
    .use 5665
    .itemcount 5665,1
step << !Warlock Orc wotlk
    #xprate >1.4999
    .cast 55884 >>使用 |T132224:0|t[暗棕狼号角] 来学习它
    .use 5668
    .itemcount 5668,1
step << !Warlock Orc wotlk
    #xprate >1.4999
    .cast 55884 >>使用|T132224:0|t[黑狼号角]来学习它
    .use 46099
    .itemcount 46099,1
step << Troll Mage wotlk
    #xprate >1.4999
    #completewith next
    .goto Orgrimmar,49.59,94.74,30,0
    .goto Orgrimmar,49.42,90.90,30,0
    .goto Orgrimmar,52.26,88.65,30,0
    .goto Orgrimmar,51.01,68.03,30,0
    .goto Orgrimmar,49.72,66.08,30,0
    .goto Orgrimmar,46.59,64.54,6,0
    .goto Orgrimmar,46.75,63.84,6,0
    .goto Orgrimmar,46.59,64.54,6,0
    .goto Orgrimmar,46.75,63.84,6,0
    .goto Orgrimmar,46.59,64.54,6,0
    .goto Orgrimmar,46.75,63.84,6,0
    .goto Orgrimmar,41.94,64.39,15,0
    .goto Orgrimmar,38.78,77.83,15,0
    .goto Orgrimmar,38.72,83.38,12,0
    .goto Orgrimmar,37.22,87.73,8,0
    .goto Orgrimmar,37.74,88.56,8,0
    .goto Orgrimmar,38.64,85.42,10 >>前往|cRXP_FRIENDLY_索乌|r
    .money <4.7125
step << Troll Mage wotlk
    #xprate >1.4999
    .goto Orgrimmar,38.64,85.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索乌|r交谈
    .train 3567 >>坐火车 |T135759:0|t[传送:奥格瑞玛]
    .target Thuul
    .money <4.7125
step << Troll Mage wotlk
    #xprate >1.4999
    #completewith next
    .goto Orgrimmar,42.49,73.39,40,0
    .goto Orgrimmar,52.03,85.17,30,0
    .goto Orgrimmar,52.20,88.80,30,0
    .goto Orgrimmar,49.32,91.05,30,0
    .goto Durotar,52.26,34.68,35,0
    .goto Durotar,55.28,75.48,50 >>前往|cRXP_FRIENDLY_Xar'Ti|r
    .train 3567,3
    .money <4.5
step << Troll wotlk
    #xprate >1.4999
    #completewith next
    .goto Durotar,49.41,20.97,35,0
    .goto Durotar,50.21,26.30,35,0
    .goto Durotar,49.93,28.80,35,0
    .goto Durotar,52.26,34.68,35,0
    .goto Durotar,55.28,75.48,50 >>前往|cRXP_FRIENDLY_Xar'Ti|r
    .money <4.5
step << Troll wotlk
    #xprate >1.4999
    .goto Durotar,55.28,75.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xar'Ti|r交谈
    .skill riding,75 >>学习 |T136103:0|t[学徒骑术] 从她那里
    .target Xar'Ti
    .money <4.5
step << Troll wotlk
    #xprate >1.4999
    .goto Durotar,55.23,75.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_祖尼尔|r 交谈
    +|cRXP_BUY_从他那里购买任意你喜欢的|r|T132253:0|t[迅猛龙哨笛]|r
	.target Zjolnir
    .itemcount 8588,<1 --Whistle of the Emerald Raptor
    .itemcount 8591,<1 --Whistle of the Turquoise Raptor
    .itemcount 8592,<1 --Whistle of the Violet Raptor
    .money <0.9025
    .skill riding,<75,1
step << Troll wotlk
    #xprate >1.4999
    .cast 55884 >>使用 |T132253:0|t[绿色迅猛龙之哨] 来学习它
    .use 8588
    .itemcount 8588,1
step << Troll wotlk
    #xprate >1.4999
    .cast 55884 >>使用 |T132253:0|t[青色迅猛龙之哨] 来学习它
    .use 8591
    .itemcount 8591,1
step << Troll wotlk
    #xprate >1.4999
    .cast 55884 >>使用 |T132253:0|t[紫色迅猛龙之哨] 来学习它
    .use 8592
    .itemcount 8592,1
---
step << Troll wotlk/Orc wotlk !Warlock
    #xprate >1.4999
    .hs >>传送至幽暗城
    .zoneskip Undercity
    .zoneskip Tirisfal Glades
    .zoneskip Silverpine Forest
    .zoneskip Hillsbrad Foothills
step << Orc wotlk !Warlock
    #xprate >1.4999
    #completewith Lift
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132224:0|t[森林狼]|cRXP_WARN_拖动到你的动作条上|r
    .cast 580 >>骑上你的 |T132224:0|t[森林狼]
    .train 580,3
step << Orc wotlk !Warlock
    #xprate >1.4999
    #completewith Lift
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132266:0|t[骑乘用狼(暗灰色)]|cRXP_WARN_拖到你的动作条上|r
    .cast 6653 >>骑上你的 |T132266:0|t[恐怖狼]
    .train 6653,3
step << Orc wotlk !Warlock
    #xprate >1.4999
    #completewith Lift
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132224:0|t[骑乘用狼(暗棕色)]|cRXP_WARN_拖到你的动作条上|r
    .cast 6654 >>骑上你的|T132224:0|t[骑乘用狼]
    .train 6654,3
step << Orc wotlk !Warlock
    #xprate >1.4999
    #completewith Lift
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132224:0|t[骑乘用狼(黑色)]|cRXP_WARN_拖到你的动作条上|r
    .cast 64658 >>骑上你的|T132224:0|t[骑乘用狼]
    .train 64658,3
step << Troll wotlk
    #xprate >1.4999
    #completewith Lift
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132253:0|t[骑乘用迅猛龙(绿色)]|cRXP_WARN_拖到你的动作条上|r
    .cast 8395 >>骑上你的 |T132253:0|t[骑乘用迅猛龙]
    .train 8395,3
step << Troll wotlk
    #xprate >1.4999
    #completewith Lift
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132253:0|t[骑乘用迅猛龙(绿色)]|cRXP_WARN_拖到你的动作条上|r
    .cast 10796 >>骑上你的 |T132253:0|t[骑乘用迅猛龙]
    .train 10796,3
step << Troll wotlk
    #xprate >1.4999
    #completewith Lift
    >>|cRXP_WARN_按“Shift+P”打开坐骑选项卡|r
    >>|cRXP_WARN_将|r|T132253:0|t[骑乘用迅猛龙(紫色)]|cRXP_WARN_拖到你的快捷栏上|r
    .cast 10799 >>骑上你的 |T132253:0|t[骑乘用迅猛龙]
    .train 10799,3
step << Troll wotlk/Orc wotlk !Warlock
    #xprate >1.4999
    #label Lift
    #completewith next
    .goto Undercity,60.07,47.70,10,0
    .goto Undercity,60.52,44.02,10,0
    .goto Undercity,65.97,44.08,30,0
    .goto Undercity,66.04,32.97,30,0
    .goto Undercity,66.08,18.24,30 >>乘坐电梯返回提瑞斯法谷
    .zoneskip Tirisfal Glades
step << Troll wotlk/Orc wotlk !Warlock
    #xprate >1.4999
    .goto Undercity,66.21,4.90,15,0
    .goto Tirisfal Glades,61.73,64.87
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
]])
