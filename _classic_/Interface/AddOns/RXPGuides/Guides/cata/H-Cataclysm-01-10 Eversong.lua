local _,addon = ...
if addon.gameVersion < 40000 or addon.player.faction == 'Alliance' then return end
local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#cata
#mop
<< Horde
#name 1-6 逐日岛
#displayname 1-6 逐日岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 6-10 永歌森林
#version 1
--#group RXP 大地的裂变 (部落) << cata
#defaultfor BloodElf
#group RXP 大地的裂变 1-80 (部落) << cata
#group RestedXP 熊猫人之谜 1-60 (部落) << mop
#subweight 10000


step
    #label SunstriderIsleFirstQuestCheck
    .goto Eversong Woods,38.02,21.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师艾洛娜|r交谈
    .accept 8325 >>接任务: |cRXP_LOOT_夺回逐日岛|r
    .target Magistrix Erona
step
    #loop
    .goto Eversong Woods,37.70,23.26,0
    .goto Eversong Woods,37.70,23.26,30,0
    .goto Eversong Woods,38.21,24.56,30,0
    .goto Eversong Woods,37.62,25.77,30,0
    .goto Eversong Woods,37.30,24.54,30,0
    >>击杀|cRXP_ENEMY_法力浮龙|r
    .complete 8325,1 --6/6 Mana Wyrm slain
    .mob Mana Wyrm
step
    .goto Eversong Woods,38.02,21.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师艾洛娜|r交谈
    .turnin 8325 >>交任务: |cRXP_FRIENDLY_夺回逐日岛|r
    .accept 8326 >>接任务: |cRXP_LOOT_令人遗憾的措施|r
    .target Magistrix Erona
step
    #loop
    .goto Eversong Woods,39.13,19.06,0
    .goto Eversong Woods,39.13,19.06,30,0
    .goto Eversong Woods,40.36,17.88,30,0
    .goto Eversong Woods,40.54,16.43,30,0
    .goto Eversong Woods,40.05,20.44,30,0
    .goto Eversong Woods,39.32,22.18,30,0
    >>击杀|cRXP_ENEMY_魔泉山猫幼崽|r 和|cRXP_ENEMY_魔泉山猫|r , 从它们身上搜刮出|cRXP_LOOT_项圈|r
    .complete 8326,1 --8/8 Lynx Collar
    .mob Springpaw Cub
    .mob Springpaw Lynx
step
    #loop
    .goto Eversong Woods,39.13,19.06,0
    .goto Eversong Woods,39.13,19.06,30,0
    .goto Eversong Woods,40.36,17.88,30,0
    .goto Eversong Woods,40.54,16.43,30,0
    .goto Eversong Woods,40.05,20.44,30,0
    .goto Eversong Woods,39.32,22.18,30,0
    .xp 2+650 >>升级至650/900经验值
step
    .goto Eversong Woods,38.02,21.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师艾洛娜|r交谈
    .turnin 8326 >>交任务: |cRXP_FRIENDLY_令人遗憾的措施|r
    .accept 8327 >>接任务: |cRXP_LOOT_向兰萨恩·派雷隆报到|r
    .accept 31170 >>接受任务：武僧训练 << Monk
    .accept 9393 >>接任务: |cRXP_LOOT_猎人训练|r << Hunter
    .accept 8328 >>接任务: |cRXP_LOOT_法师训练|r << Mage
    .accept 9676 >>接任务: |cRXP_LOOT_圣骑士训练|r << Paladin
    .accept 8564 >>接任务: |cRXP_LOOT_牧师训练|r << Priest
    .accept 9392 >>接任务: |cRXP_LOOT_潜行者训练|r << Rogue
    .accept 8563 >>接任务: |cRXP_LOOT_术士训练|r << Warlock
    .accept 8329 >>接任务: |cRXP_WARN_战士训练|r << Warrior
    .target Magistrix Erona
step << Monk
    .goto 467/0,-3998.000,7978.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿包|r交谈
    .turnin 31170 >>提交武僧训练
    .accept 31171 >>接任务: |cRXP_WARN_猛虎掌|r
    .target Pao
step << Hunter
    .goto Eversong Woods,39.05,20.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠萨琳娜|r交谈
    .turnin 9393 >>交任务: |cRXP_FRIENDLY_猎人训练|r
    .accept 10070 >>接任务: |cRXP_WARN_稳固射击|r
    .train 56641 >>训练 |T132213:0|t[稳固射击] << Cata
    .target Ranger Sallina
step << Mage cata
    .goto Eversong Woods,39.23,21.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_朱莉亚·射日者|r交谈
    .turnin 8328 >>交任务: |cRXP_FRIENDLY_法师训练|r
    .accept 10068 >>接任务: |cRXP_WARN_奥术飞弹|r
    .train 5143 >>训练 |T136096:0|t[奥术飞弹] << Cata
    .target Julia Sunstriker
step << Mage !cata
    .goto Eversong Woods,39.23,21.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_朱莉亚·射日者|r交谈
    .turnin 8328 >>交任务: |cRXP_FRIENDLY_法师训练|r
    .accept 10068 >>接任务: |cRXP_WARN_奥术飞弹|r
    .target Julia Sunstriker
step << Paladin
    .goto Eversong Woods,39.47,20.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶泰尼斯·射日者|r交谈
    .turnin 9676 >>交任务: |cRXP_FRIENDLY_圣骑士训练|r
    .accept 10069 >>接任务: |cRXP_WARN_圣光之道|r
    .train 20271 >>训练 |T135959:0|t[裁决] << Cata
    .train 20154 >>训练 |T135960:0|t[正义之印] << Cata
    .target Jesthenis Sunstriker
step << Priest cata
    .goto Eversong Woods,39.41,20.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_护士长阿蕾娜|r交谈
    .turnin 8564 >>交任务: |cRXP_FRIENDLY_牧师训练|r
    .accept 10072 >>接任务: |cRXP_WARN_治愈伤者|r
    .train 2061 >>训练 |T135907:0|t[治疗之光] << Cata
    .target Matron Arena
step << Priest !cata
    .goto Eversong Woods,39.41,20.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_护士长阿蕾娜|r交谈
    .turnin 8564 >>交任务: |cRXP_FRIENDLY_牧师训练|r
    .accept 10072 >>接任务: |cRXP_WARN_护井者索兰尼亚|r
    .target Matron Arena
step << Rogue
    .goto Eversong Woods,38.93,20.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pathstalker Avoker|r交谈
    .turnin 9392 >>交任务: |cRXP_FRIENDLY_潜行者训练|r
    .accept 10071 >>接任务: |cRXP_WARN_刺骨|r
    .train 2098 >>训练 |T132292:0|t[刺骨] << Cata
    .target Pathstalker Avoker
step << Warlock cata
    .goto Eversong Woods,38.94,21.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_召唤师特莉拉蕾|r交谈
    .turnin 8563 >>交任务: |cRXP_FRIENDLY_术士训练|r
    .accept 10073 >>接任务: |cRXP_WARN_献祭|r
    .train 348 >>训练 |T135817:0|t[献祭] << Cata
    .target Summoner Teli'Larien
step << Warlock !cata
    .goto Eversong Woods,38.94,21.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_召唤师特莉拉蕾|r交谈
    .turnin 8563 >>交任务: |cRXP_FRIENDLY_术士训练|r
    .accept 10073 >>接任务: |cRXP_WARN_献祭|r
    .target Summoner Teli'Larien
step << Warrior
    .goto Eversong Woods,39.29,20.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德利奥斯·银刃|r交谈
    .turnin 8329 >>交任务: |cRXP_FRIENDLY_战士训练|r
    .accept 27091 >>接任务: |cRXP_WARN_冲锋！|r
    .train 100 >>训练 |T132337:0|t[冲锋] << Cata
    .target Delios Silverblade
step << Monk
    .goto Eversong Woods,38.34,20.64
	>>施放|T606551:0|t[猛虎掌]于训练假人|r外面
	.complete 31171,2 --Cast Tiger Palm
	.mob Training Dummy
step << Hunter
    .goto Eversong Woods,38.34,20.64
	>>对外面的训练假人施放[稳固射击]
	.complete 10070,2 << !Cata --Cast Steady Shot
	.complete 10070,1 << Cata --Cast Steady Shot
	.mob Training Dummy
step << Mage cata
    .goto Eversong Woods,38.34,20.64
	>>对训练假人外面的敌人施放|T136096:0|t[奥术飞弹]
	.complete 10068,1 << Cata --Cast Arcane Missiles
	.mob Training Dummy
step << Mage !cata
    .goto Eversong Woods,38.34,20.64
	>>施放 |T135848:0|t[冰霜新星]于外面的|cRXP_ENEMY_训练假人|r上
	.complete 10068,2 --Cast Frost Nova
	.mob Training Dummy
step << Paladin cata
    .goto Eversong Woods,38.34,20.64
	>>对自己施放【正义之印】, 然后对场外的训练假人施放【审判】
	.complete 10069,1 << Cata --Cast Judgement
	.mob Training Dummy
step << Paladin !cata
    .goto Eversong Woods,38.34,20.64
	>>施放 |T135961:0|t[命令之印], 然后攻击外面的|cRXP_ENEMY_训练假人|r
	.complete 10069,2
	.mob Training Dummy
step << Priest cata
    .goto Eversong Woods,39.49,20.29
	>>对|cRXP_ENEMY_受伤的信使|r 施放 |T135907:0|t[治疗之光]
	.complete 10072,1 --Cast Flash Heal
	.target Wounded Outrunner
 step << Priest !cata
    .goto Eversong Woods,38.34,20.64
	>>施放 |T136207:0|t[暗影之言:痛苦] 在|cRXP_ENEMY_Training Dummy|r外部的训练假人身上
	.complete 10072,2 --Cast Shadow Word: Pain
	.mob Training Dummy
step << Rogue
    .goto Eversong Woods,38.34,20.64
	>>在训练假人外面施放 |T132292:0|t[刺骨]
	.complete 10071,2 << !Cata --Cast Eviscerate
	.complete 10071,1 << Cata --Cast Eviscerate
	.mob Training Dummy
step << Warlock cata
    .goto Eversong Woods,38.34,20.64
	>>对外面的训练假人施放[献祭]
	.complete 10073,1 --Cast Immolate
	.mob Training Dummy
step << Warlock !cata
    .goto Eversong Woods,38.34,20.64
	>>施放|T136118:0|t[腐蚀之触]在|cRXP_ENEMY_训练假人|r外面
	.complete 10073,2 --Cast Corruption
	.mob Training Dummy
step << Warrior
    .goto Eversong Woods,38.34,20.64
	>>在训练假人外面施放 |T132337:0|t[冲锋]
	.complete 27091,2 << !Cata --Cast Charge
	.complete 27091,1 << Cata --Cast Charge
	.mob Training Dummy
step << Monk
    .goto 467/0,-3998.200,7978.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿包|r交谈
    .turnin 31171 >>交任务: |cRXP_FRIENDLY_猛虎掌|r
    .target Pao
step << Hunter
    .goto Eversong Woods,39.05,20.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠萨琳娜|r交谈
    .turnin 10070 >>交任务: |cRXP_FRIENDLY_稳固射击|r
    .target Ranger Sallina
step << Mage cata
    .goto Eversong Woods,39.23,21.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_朱莉亚·射日者|r交谈
    .turnin 10068 >>交任务: |cRXP_FRIENDLY_奥术飞弹|r
    .target Julia Sunstriker
step << Mage !cata
    .goto Eversong Woods,39.23,21.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_朱莉亚·射日者|r交谈
    .turnin 10068 >>交任务: |cRXP_FRIENDLY_奥术飞弹|r
    .target Julia Sunstriker
step << Paladin
    .goto Eversong Woods,39.47,20.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶泰尼斯·射日者|r交谈
    .turnin 10069 >>交任务: |cRXP_FRIENDLY_圣光之道|r
    .target Jesthenis Sunstriker
step << Priest cata
    .goto Eversong Woods,39.41,20.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_护士长阿蕾娜|r交谈
    .turnin 10072 >>交任务: |cRXP_FRIENDLY_治愈伤者|r
    .target Matron Arena
step << Priest !cata
    .goto Eversong Woods,39.41,20.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_护士长阿蕾娜|r交谈
    .turnin 10072 >>交任务: |cRXP_FRIENDLY_护井者索兰尼亚|r
    .target Matron Arena
step << Rogue
    .goto Eversong Woods,38.93,20.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pathstalker Avoker|r交谈
    .turnin 10071 >>交任务: |cRXP_FRIENDLY_刺骨|r
    .target Pathstalker Avoker
step << Warlock cata
    .goto Eversong Woods,38.94,21.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_召唤师特莉拉蕾|r交谈
    .turnin 10073 >>交任务: |cRXP_FRIENDLY_献祭|r
    .target Summoner Teli'Larien
step << Warlock !cata
    .goto Eversong Woods,38.94,21.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_召唤师特莉拉蕾|r交谈
    .turnin 10073 >>交任务: |cRXP_FRIENDLY_献祭|r
    .target Summoner Teli'Larien
step << Warrior
    .goto Eversong Woods,39.29,20.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德利奥斯·银刃|r交谈
    .turnin 27091 >>交任务: |cRXP_FRIENDLY_冲锋！|r
    .target Delios Silverblade
step
    #completewith next
    .goto Eversong Woods,39.44,21.16,10,0
    .goto Eversong Woods,39.44,20.35,10,0
    .goto Eversong Woods,39.10,20.04,10 >>上楼
step
    .goto Eversong Woods,38.97,20.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_护井者索兰尼亚|r交谈
    .accept 8330 >>接任务: |cRXP_LOOT_索兰尼亚的物品|r
    .accept 8345 >>接任务: |cRXP_LOOT_达斯雷玛的神龛|r
    .target Well Watcher Solanian
step
    .goto Eversong Woods,38.27,19.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥术师伊塔纳斯|r交谈
    .accept 8336 >>接任务: |cRXP_LOOT_奥术薄片|r
    .target Arcanist Ithanas
step
    .goto Eversong Woods,37.18,18.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥术师赫里恩|r交谈
    .accept 8346 >>接任务: |cRXP_LOOT_无尽的渴求|r
    .target Arcanist Helion
step
    #completewith Journal
    >>当处于法力浮龙的近战范围内时, 施放奥术洪流
    >>击杀|cRXP_ENEMY_法力浮龙|r和|cRXP_ENEMY_凶猛的树人嫩苗|r. 击败它们获取|cRXP_LOOT_片状物|r
    .complete 8346,1 --Cast Arcane Torrent on Mana Wyrm (x1)
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .mob Mana Wyrm
    .mob Feral Tender
step
    .goto Eversong Woods,35.37,22.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰萨恩·派雷隆|r交谈
    .turnin 8327 >>交任务: |cRXP_FRIENDLY_向兰萨恩·派雷隆报到|r
    .accept 8334 >>接任务: |cRXP_LOOT_攻势|r
    .target Lanthan Perilon
step
    #label Journal
    .goto Eversong Woods,37.70,24.91
    >>拾取地面上的|cRXP_PICK_Journal|r
    .complete 8330,3 --Collect Solanian's Journal (x1)
step
    #completewith next
    >>击杀|cRXP_ENEMY_凶猛的树人嫩苗|r和|cRXP_ENEMY_凶猛的树人嫩苗|r. 击败它们获取|cRXP_LOOT_Slivers|r
    .complete 8334,1 --Kill Tender (x7)
    .complete 8334,2 --Kill Feral Tender (x7)
    .complete 8336,1--Collect Arcane Sliver (x6)
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
    >>击杀|cRXP_ENEMY_凶猛的树人嫩苗|r和|cRXP_ENEMY_凶猛的树人嫩苗|r. 击败它们获取|cRXP_LOOT_Slivers|r
    .complete 8334,1 --Kill Tender (x7)
    .mob +Tender
    .complete 8334,2 --Kill Feral Tender (x7)
    .mob +Feral Tender
    .complete 8336,1--Collect Arcane Sliver (x6)
step
    #label Aggression
    .goto Eversong Woods,35.37,22.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lanthan|r交谈
    .turnin 8334 >>交任务: |cRXP_FRIENDLY_攻势|r
    .accept 8335 >>接任务: |cRXP_LOOT_放逐者菲伦德雷|r
    .target Lanthan Perilon
step
    #completewith RunRamp
    >>击杀|cRXP_ENEMY_凶猛的树人嫩苗|r. 击杀后搜刮其掉落的|cRXP_LOOT_Slivers|r
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .mob Feral Tender
step
    #label Shrine
    .goto Eversong Woods,29.61,19.38
    >>点击|cRXP_PICK_达斯雷玛的神龛|r
    .complete 8345,1 --Collect Shrine of Dath'Remar Read (x1)
step
    .goto Eversong Woods,31.33,22.74
    >>拾取地面上的|cRXP_PICK_卷轴|r
    .complete 8330,2 --Collect Scroll of Scourge Magic (x1)
step
    #label RunRamp
    #completewith next
    .goto Eversong Woods,32.57,25.53,20,0
    .goto Eversong Woods,32.02,26.09,20 >>跑上坡道
step
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
    >>前往学院途中击杀奥术怨灵和被污染的奥术怨灵, 击败它们以获取其碎片
    >>击杀位于上方的|cRXP_ENEMY_放逐者菲伦德雷|c, 从他身上搜刮其|cRXP_LOOT_头颅|c
    .complete 8335,1 --Kill Arcane Wraith (x8)
    .complete 8335,2 --Kill Tainted Arcane Wraith (x2)
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .complete 8335,3 --Collect Felendren's Head (x1)
    .mob Arcane Wraith
    .mob Tainted Arcane Wraith
    .mob Felendren the Banished
step
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
step
    #completewith next
    >>击杀|cRXP_ENEMY_法力浮龙|r. 从它们身上搜刮|cRXP_LOOT_断片|r
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .mob Mana Wyrm
step
    #loop
    .goto Eversong Woods,36.79,19.88,0
    .goto Eversong Woods,36.79,19.88,40,0
    .goto Eversong Woods,34.64,18.82,40,0
    .goto Eversong Woods,33.78,19.46,40,0
    .goto Eversong Woods,34.17,20.59,40,0
    >>当处于法力浮龙的近战范围内时, 施放奥术洪流
    .complete 8346,1 --Cast Arcane Torrent on Mana Wyrm (x1)
    .mob Mana Wyrm
step
    #loop
    .goto Eversong Woods,36.79,19.88,0
    .goto Eversong Woods,36.79,19.88,40,0
    .goto Eversong Woods,34.64,18.82,40,0
    .goto Eversong Woods,33.78,19.46,40,0
    .goto Eversong Woods,34.17,20.59,40,0
    >>击杀|cRXP_ENEMY_法力浮龙|r. 从它们身上搜刮|cRXP_LOOT_断片|r
    .complete 8336,1 --Collect Arcane Sliver (x6)
    .mob Mana Wyrm
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helion|r和|cRXP_FRIENDLY_Ithanas|r交谈
    .turnin 8346 >>交任务: |cRXP_FRIENDLY_无尽的渴求|r
    .turnin 8338 >>交任务: |cRXP_FRIENDLY_被污染的奥术薄片|r
    .target +Arcanist Helion
    .goto Eversong Woods,37.18,18.94
    .turnin 8336 >>交任务: |cRXP_FRIENDLY_奥术薄片|r
    .target +Arcanist Ithanas
    .goto Eversong Woods,38.27,19.13
step
    #completewith next
    .goto Eversong Woods,39.44,21.16,10,0
    .goto Eversong Woods,39.44,20.35,10,0
    .goto Eversong Woods,39.10,20.04,10 >>上楼
step
    #label SolanianB
    .goto Eversong Woods,38.97,20.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Solanian|r交谈
    .turnin 8330 >>交任务: |cRXP_FRIENDLY_索兰尼亚的物品|r
    .turnin 8345 >>交任务: |cRXP_FRIENDLY_达斯雷玛的神龛|r
    .target Well Watcher Solanian
step << Hunter Cata
    .goto Eversong Woods,39.05,20.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠萨琳娜|r交谈
    .train 2973 >>训练 |T132223:0|t[猛禽打击]
    .target Ranger Sallina
    .xp <6,1
step << Mage Cata
    .goto Eversong Woods,39.23,21.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_朱莉亚·射日者|r交谈
    .train 2136 >>训练 |T135807:0|t[火焰冲击]
    .target Julia Sunstriker
    .xp <5,1
step << Paladin Cata
    .goto Eversong Woods,39.47,20.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶泰尼斯·射日者|r交谈
    .train 465 >>训练 |T135893:0|t[虔诚光环]
    .target Jesthenis Sunstriker
    .xp <5,1
step << Priest Cata
    .goto Eversong Woods,39.41,20.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_护士长阿蕾娜|r交谈
    .train 17 >>训练 |T135940:0|t[真言术:盾]
    .target Matron Arena
    .xp <5,1
step << Rogue Cata
    .goto Eversong Woods,38.93,20.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pathstalker Avoker|r交谈
    .train 1784 >>训练 |T132320:0|t[潜行]
    .target Pathstalker Avoker
    .xp <5,1
step << Warlock Cata
    .goto Eversong Woods,38.94,21.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_召唤师特莉拉蕾|r交谈
    .train 1454 >>训练 |T136126:0|t[生命偷取]
    .target Summoner Teli'Larien
    .xp <5,1
step << Warrior Cata
    .goto Eversong Woods,39.29,20.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德利奥斯·银刃|r交谈
    .train 34428 >>训练 |T132342:0|t[胜利冲刺]
    .target Delios Silverblade
    .xp <5,1
step
    .goto Eversong Woods,35.37,22.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lanthan|r交谈
    .turnin 8335 >>交任务: |cRXP_FRIENDLY_放逐者菲伦德雷|r
    .accept 8347 >>接任务: |cRXP_LOOT_帮助信使|r
    .target Lanthan Perilon
step
    #completewith next
    .goto Eversong Woods,39.283,30.747,30,0
    .goto Eversong Woods,40.177,31.700,30 >>过桥
step
    .goto Eversong Woods,40.420,32.217
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alarion|r交谈
    .turnin 8347 >>交任务: |cRXP_FRIENDLY_帮助信使|r
    .accept 9704 >>接任务: |cRXP_LOOT_失心者的牺牲品|r
    .target Outrunner Alarion
step
    .goto Eversong Woods,42.020,35.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上的|cRXP_FRIENDLY_斥候尸体|r交谈
    .turnin 9704 >>交任务: |cRXP_FRIENDLY_失心者的牺牲品|r
    .accept 9705 >>接任务: |cRXP_LOOT_找回包裹|r
    .target Slain Outrunner
step
    .goto Eversong Woods,40.420,32.217
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alarion|r交谈
    .turnin 9705 >>交任务: |cRXP_FRIENDLY_找回包裹|r
    .accept 8350 >>接任务: |cRXP_LOOT_送信|r
    .target Outrunner Alarion


]])

RXPGuides.RegisterGuide([[
#cata
#mop
<< Horde
#name 6-10 永歌森林
#displayname 6-10 永歌森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 10-22 艾萨拉
#version 1
--#group RXP 大地的裂变 (部落) << cata

#defaultfor BloodElf/Undead
#group RXP 大地的裂变 1-80 (部落) << cata
#group RestedXP 熊猫人之谜 1-60 (部落) << mop
#subweight 10000

step << Undead
    .goto Eversong Woods,50.331,50.770
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠杰拉|r交谈
    .accept 8475 >>接任务: |cRXP_LOOT_死亡之痕|r
    .target Ranger Jaela
step << Undead
    #loop
    .goto Eversong Woods,49.857,55.567,0
    .waypoint Eversong Woods,49.699,53.225,40,0
    .waypoint Eversong Woods,49.857,55.567,40,0
    .waypoint Eversong Woods,49.851,57.816,40,0
    .waypoint Eversong Woods,50.095,59.583,40,0
    .waypoint Eversong Woods,51.072,56.126,40,0
    >>击杀|cRXP_ENEMY_天灾骨骸|r
    .complete 8475,1 --8/8 Plaguebone Pillager slain
    .mob Plaguebone Pillager
step << Undead
    .goto Eversong Woods,50.331,50.770
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠杰拉|r交谈
    .turnin 8475 >>交任务: |cRXP_FRIENDLY_死亡之痕|r
    .target Ranger Jaela
step
    #completewith next
    .subzone 3665 >>前往鹰翼广场
step
    .goto Eversong Woods,47.256,46.314
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾隆迪斯|r交谈
    .accept 8472 >>接任务: |cRXP_LOOT_失效的傀儡|r
    .target Magister Jaronis
step << !Undead
    #completewith next
    .goto Eversong Woods,47.771,47.303,8,0
    .goto Eversong Woods,47.823,47.696,8 >>进入旅店
step << !Undead
    .goto Eversong Woods,48.16,47.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Delaniel|r交谈
    .turnin 8350 >>交任务: |cRXP_FRIENDLY_送信|r << BloodElf
    .home >>将你的[炉石]设置为鹰翼广场
    .target Innkeeper Delaniel
    .isQuestAvailable 8885
step << !Undead
    #completewith next
    .goto Eversong Woods,47.823,47.696,8,0
    .goto Eversong Woods,47.771,47.303,8 >>外出
step
    .goto Eversong Woods,48.166,46.311
    >>点击|cRXP_PICK_通缉告示|r
    .accept 8468 >>接任务: |cRXP_LOOT_通缉：饥饿者泰里斯|r
step
    .goto Eversong Woods,48.165,45.999
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔杜·炙痕|r交谈
    .accept 8463 >>接任务: |cRXP_LOOT_不稳定的法力水晶|r
    .target Aeldon Sunbrand
step << Rogue
    .goto Eversong Woods,48.492,45.905
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够足够的钱买一把 |T135321:0|t[步兵剑](5银9铜). 如果暂时不够, 稍后再回来处理
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    .goto Eversong Woods,48.492,45.905
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135321:0|t[步兵剑]|r
    .collect 2488,1,8468,1 --Gladius (1)
    .target Geron
    .money <0.0509
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior/Paladin
    .goto Eversong Woods,48.492,45.905
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T133053:0|t[木槌棒] (6银66铜) 的钱. 如果暂时不够, 稍后再回来
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Warrior/Paladin
    .goto Eversong Woods,48.492,45.905
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133053:0|t[木槌棒]|r
    .collect 2493,1,8468,1 --Collect Wooden Mallet (1)
    .target Geron
    .money <0.0666
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Rogue
    #completewith Thaelis
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior/Paladin
    #completewith Thaelis
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
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
    #loop
    .goto Eversong Woods,47.22,37.39,0
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
    .goto Eversong Woods,42.17,40.49,40,0
    >>拾取地面上的|cRXP_PICK_不稳定的法力水晶盒|r
    >>击杀|cRXP_ENEMY_奥术巡逻者|r. 从他们身上搜刮|cRXP_LOOT_能量核心|r
    .complete 8463,1 --Collect Unstable Mana Crystal (x6)
    .complete 8472,1 --Collect Arcane Core (x6)
    .mob Arcane Patroller
step
    .goto Eversong Woods,47.256,46.314
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾隆迪斯|r交谈
    .turnin 8472 >>交任务: |cRXP_FRIENDLY_失效的傀儡|r
    .accept 8895 >>接任务: |cRXP_LOOT_送往北部圣殿的信|r
    .target Magister Jaronis
step
    .goto Eversong Woods,47.77,46.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坎伦|r交谈
    .turnin 8468 >>交任务: |cRXP_FRIENDLY_通缉：饥饿者泰里斯|r
    .target Sergeant Kan'ren
step
    .goto Eversong Woods,48.165,45.999
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔杜·炙痕|r交谈
    .turnin 8463 >>交任务: |cRXP_FRIENDLY_不稳定的法力水晶|r
    .accept 9352 >>接任务: |cRXP_LOOT_达纳苏斯的侵扰|r
    .target Aeldon Sunbrand
step << Paladin Cata
    .goto Eversong Woods,48.39,46.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺尔蕾妮|r交谈
    .train 635 >>训练你的职业法术
    .target Noellene
	.xp <7,1
    .xp >9,1
step << Paladin Cata
    #optional
    .goto Eversong Woods,48.39,46.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺尔蕾妮|r交谈
    .train 85673 >>训练你的职业法术
    .target Noellene
    .xp >7,1
	.xp <9,1
step << Warrior Cata
    .goto Eversong Woods,48.29,46.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坦·银刃|r交谈
    .train 772 >>训练你的职业法术
    .target Lothan Silverblade
	.xp <7,1
    .xp >9,1
step << Warrior Cata
    #optional
    .goto Eversong Woods,48.29,46.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坦·银刃|r交谈
    .train 6343 >>训练你的职业法术
    .target Lothan Silverblade
    .xp >7,1
	.xp <9,1
step << Rogue Cata
    .goto Eversong Woods,48.58,46.29,8,0
    .goto Eversong Woods,48.50,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塔娜莉亚|r交谈
    .train 5277 >>训练你的职业法术
    .target Tannaria
	.xp <9,1
step << Hunter Cata
    .goto Eversong Woods,48.27,46.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉诺维亚|r交谈
    .train 2973 >>训练你的职业法术
    .target Hannovia
    .xp <6,1
    .xp >8,1
step << Hunter Cata
    #optional
    .goto Eversong Woods,48.27,46.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉诺维亚|r交谈
    .train 5116 >>训练你的职业法术
    .target Hannovia
	.xp <8,1
step << Mage Cata/Warlock Cata/Priest Cata
    #optional
    #completewith next
    .goto Eversong Woods,47.771,47.303,8,0
    .goto Eversong Woods,47.823,47.696,8 >>进入旅店
step << Mage Cata/Warlock Cata/Priest Cata
    #optional
    #completewith next
    .goto Eversong Woods,48.286,47.097,8,0
    .goto Eversong Woods,48.054,47.130,8,0
    .goto Eversong Woods,48.074,47.354,8 >>上楼
step << Priest Cata
    .goto Eversong Woods,47.85,47.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珀纳瑞斯|r交谈
    .train 588 >>训练你的职业法术
    .target Ponaris
	.xp <7,1
    .xp >9,1
step << Priest Cata
    #optional
    .goto Eversong Woods,47.85,47.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珀纳瑞斯|r交谈
    .train 8092 >>训练你的职业法术
    .target Ponaris
	.xp >7,1
    .xp <9,1
step << Mage Cata
    .goto Eversong Woods,48.04,48.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加琳黛尔|r交谈
    .train 116 >>训练你的职业法术
    .target Garridel
	.xp <7,1
    .xp >8,1
step << Mage Cata
    #optional
    .goto Eversong Woods,48.04,48.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加琳黛尔|r交谈
    .train 122 >>训练你的职业法术
    .target Garridel
	.xp >7,1
    .xp <8,1
step << Warlock Cata
    .goto Eversong Woods,48.23,47.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞罗努斯|r交谈
    .train 689 >>训练你的职业法术
    .target Celoenus
	.xp <6,1
    .xp >8,1
step << Warlock Cata
    #optional
    .goto Eversong Woods,48.23,47.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞罗努斯|r交谈
    .train 697 >>训练你的职业法术
    .target Celoenus
	.xp >6,1
    .xp <8,1
step << Rogue
    .goto Eversong Woods,48.492,45.905
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够足够的钱买一把 |T135321:0|t[步兵剑](5银9铜). 如果暂时不够, 稍后再回来处理
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    .goto Eversong Woods,48.492,45.905
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135321:0|t[步兵剑]|r
    .collect 2488,1,9062,1 --Gladius (1)
    .target Geron
    .money <0.0509
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior/Paladin
    .goto Eversong Woods,48.492,45.905
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T133053:0|t[木槌棒] (6银66铜) 的钱. 如果暂时不够, 稍后再回来
    .target Geron
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Warrior/Paladin
    .goto Eversong Woods,48.492,45.905
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖隆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133053:0|t[木槌棒]|r
    .collect 2493,1,9062,1 --Collect Wooden Mallet (1)
    .target Geron
    .money <0.0666
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step << Rogue
    #completewith Caidanis
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior/Paladin
    #completewith Caidanis
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5
step
    #completewith next
    .goto Eversong Woods,46.68,48.07,30,0
    .goto Eversong Woods,44.63,53.13,30 >>前往|cRXP_FRIENDLY_Caidanis|r
step
    #label Caidanis
    .goto Eversong Woods,44.63,53.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔网监护者凯丹尼斯|r交谈
    .turnin 8895 >>交任务: |cRXP_FRIENDLY_送往北部圣殿的信|r
    .accept 9119 >>接任务: |cRXP_LOOT_西部圣殿的麻烦|r
    .target Ley-Keeper Caidanis
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
    .mob +Manawraith
    .complete 8486,2 --Kill Mana Stalker (x5)
    .mob +Mana Stalker
step
    #loop
    .goto Eversong Woods,36.77,60.99,0
    .goto Eversong Woods,36.77,60.99,30,0
    .goto Eversong Woods,34.65,62.03,30,0
    .goto Eversong Woods,34.04,60.81,30,0
    .goto Eversong Woods,34.19,58.49,30,0
    >>击杀一名|cRXP_ENEMY_达纳苏斯斥候|r. 搜刮其尸体获得 |T133464:0|t[|cRXP_LOOT_秘密文件|r]
    >>|cRXP_WARN_使用 |T133464:0|t[|cRXP_LOOT_秘密文件|r] 开始任务|r
    .complete 9352,1 --Intruder Defeated
    .collect 20765,1,8482 --Incriminating Documents (1)
    .accept 8482 >>接任务: |cRXP_LOOT_秘密文件|r
    .mob Darnassian Scout
    .use 20765
step
    #loop
    .goto Eversong Woods,35.759,60.591,0
    .goto Eversong Woods,35.768,57.544,40,0
    .goto Eversong Woods,34.491,60.834,40,0
    .goto Eversong Woods,35.759,60.591,40,0
    .goto Eversong Woods,35.946,59.096,40,0
    >>击杀|cRXP_ENEMY_法力怨灵|r和|cRXP_ENEMY_法力漫步者|r
    .complete 8486,1 --Kill Manawraith (x5)
    .mob +Manawraith
    .complete 8486,2 --Kill Mana Stalker (x5)
    .mob +Mana Stalker
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
    #loop
    .goto Eversong Woods,25.61,64.29,0
    .goto Eversong Woods,27.47,56.54,40,0
    .goto Eversong Woods,26.45,58.14,40,0
    .goto Eversong Woods,26.35,59.41,40,0
    .goto Eversong Woods,28.20,59.52,40,0
    .goto Eversong Woods,27.96,61.31,40,0
    .goto Eversong Woods,25.70,60.50,40,0
    .goto Eversong Woods,25.36,62.88,40,0
    .goto Eversong Woods,25.61,64.29,40,0
    >>击杀|cRXP_ENEMY_暗鳞抢劫者|r 和|cRXP_ENEMY_暗鳞先知|r. 击败它们后搜刮其掉落的|cRXP_LOOT_鱼人的头颅|r 和 |T134939:0|t[|cRXP_LOOT_凯莉森德拉船长的航海图|r ]
    >>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_凯莉森德拉船长的航海图|r] 开始任务|r
    .complete 8884,1 --Collect Grimscale Murloc Head (x8)
    .collect 21776,1,8887,1 --Captain Kelisendra's Lost Rutters
    .accept 8887 >>接任务: |cRXP_LOOT_凯莉森德拉船长的航海图|r
    .mob Grimscale Forager
    .mob Grimscale Seer
    .use 21776
step
    .goto Eversong Woods,29.90,58.45,10,0
    .goto Eversong Woods,30.23,58.44,10,0
    .goto Eversong Woods,30.22,58.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈斯温里奥|r交谈
    .turnin 8884 >>交任务: |cRXP_FRIENDLY_鱼头......|r
    .accept 8885 >>接任务: |cRXP_LOOT_呜啦哇啦的戒指|r
    .target Hathvelion Sungaze
step
    #completewith next
    .goto Eversong Woods,27.94,59.41,20,0
    .goto Eversong Woods,28.01,61.01,20,0
    .goto Eversong Woods,26.25,60.46
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step
    #xprate <1.2
    .goto Eversong Woods,44.718,69.619
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维兰·布雷托克|r谈话
    .accept 8491 >>接任务: |cRXP_LOOT_收集豹皮|r
    .target Velan Brightoak
step
    #completewith next
    .goto Eversong Woods,43.61,70.66,10 >>上楼
step
    .goto Eversong Woods,43.34,70.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠戴戈利恩|r交谈
    .accept 8892 >>接任务: |cRXP_LOOT_阳帆港|r
    .target Ranger Degolien
step << BloodElf
    .goto Eversong Woods,43.698,71.555
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨希尔|r交谈
    .accept 9130 >>接任务: |cRXP_LOOT_银月城的货物|r
    .target Sathiel
    --VV TODO: See if this quest chain is live on beta
step << BloodElf
    .goto Eversong Woods,43.949,69.989
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行管理员晨光|r交谈
    .turnin 9130 >>交任务: |cRXP_FRIENDLY_银月城的货物|r
    .accept 9133 >>接任务: |cRXP_LOOT_飞往银月城|r
    .target Skymaster Brightdawn
step
    #xprate <1.2
    #completewith next
    .goto Eversong Woods,40.742,70.869,0
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击杀后搜刮他们的|cRXP_LOOT_皮毛|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
step
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
    .mob +Wretched Thug
    .complete 8892,2 --Kill Wretched Hooligan (x5)
    .mob +Wretched Hooligan
step
    #loop
    .goto Eversong Woods,34.66,68.00,0
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
    #loop
    .goto Eversong Woods,31.40,70.90,0
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
    >>击杀|cRXP_ENEMY_失心者暴徒|r 和|cRXP_ENEMY_失心者无赖|r
    .complete 8892,1 --Kill Wretched Thug (x5)
    .mob +Wretched Thug
    .complete 8892,2 --Kill Wretched Hooligan (x5)
    .mob +Wretched Hooligan
step
    #xprate <1.2
    #completewith next
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
    #loop
    .goto Eversong Woods,24.36,72.66,0
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
    .goto Eversong Woods,24.36,72.66,40,0
    >>击杀|cRXP_ENEMY_呜啦哇啦|r. 击败他后可搜刮出|cRXP_LOOT_呜啦哇啦的戒指|r
    >>|cRXP_WARN_他稍作巡逻|r
    >>|cRXP_WARN_使用|r|T136222:0|t[奥术洪流]|cRXP_WARN_打断|r|cRXP_ENEMY_呜啦哇啦|r的 |T136052:0|t[治疗波] << BloodElf
    .complete 8885,1 --Collect Ring of Mmmrrrggglll (x1)
    .unitscan Mmmrrrggglll
step
    #loop
    .goto Eversong Woods,24.36,72.66,0
    .goto Eversong Woods,25.24,65.65,50,0
    .goto Eversong Woods,24.89,66.85,50,0
    .goto Eversong Woods,25.81,68.16,50,0
    .goto Eversong Woods,25.68,68.93,50,0
    .goto Eversong Woods,24.66,68.47,50,0
    .goto Eversong Woods,24.32,69.66,50,0
    .goto Eversong Woods,25.09,71.12,50,0
    .goto Eversong Woods,24.36,72.66,50,0
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
    #xprate <1.2
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
step
    #xprate <1.2
    #loop
    .goto Eversong Woods,36.115,71.876,0
    .goto Eversong Woods,28.840,71.832,0
    .waypoint Eversong Woods,36.115,71.876,60,0
    .waypoint Eversong Woods,34.94,74.229,60,0
    .waypoint Eversong Woods,28.840,71.832,60,0
    .waypoint Eversong Woods,26.134,73.852,60,0
    >>击杀|cRXP_ENEMY_魔泉捕猎者|r. 击败它们获取|cRXP_LOOT_兽皮|r
    .complete 8491,1 --Collect Springpaw Pelt (x6)
    .mob Springpaw Stalker
step
    #completewith SunsailTurnin
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活, 或跑回晴风村
step
    #xprate <1.2
    .goto Eversong Woods,44.72,69.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velan|r交谈
    .turnin 8491 >>交任务: |cRXP_FRIENDLY_收集豹皮|r
    .target Velan Brightoak
step
    #label SunsailTurnin
    .goto Eversong Woods,43.34,70.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠戴戈利恩|r交谈
    .turnin 8892 >>交任务: |cRXP_FRIENDLY_阳帆港|r
    .target Ranger Degolien

    --Section below for users who are not level 10 yet

step
    #xprate <1.2
    .goto Eversong Woods,43.675,71.309
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尼尔·琥珀之光|r交谈
    .accept 9358 >>接任务: |cRXP_LOOT_游侠萨蕾恩|r
    .target Marniel Amberlight
    .maxlevel 9
step
    #xprate <1.2
    .goto Eversong Woods,44.030,70.760
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师兰德拉·晨行者|r交谈
    .accept 9254 >>接任务: |cRXP_LOOT_外出的学徒|r
    .target Magistrix Landra Dawnstrider
    .maxlevel 9
step
    #xprate <1.2
    .goto Eversong Woods,46.93,71.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠萨蕾恩|r交谈
    .turnin 9358 >>交任务: |cRXP_FRIENDLY_游侠萨蕾恩|r
    .accept 9252 >>接任务: |cRXP_LOOT_保卫晴风村|r
    .target Ranger Sareyn
    .isOnQuest 9358
step
    #xprate <1.2
    #optional
    .goto Eversong Woods,46.93,71.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠萨蕾恩|r交谈
    .accept 9252 >>接任务: |cRXP_LOOT_保卫晴风村|r
    .target Ranger Sareyn
    .isQuestTurnedIn 9358
step
    #xprate <1.2
    #completewith Notes
    >>击杀|cRXP_ENEMY_腐肢劫掠者|r
    .complete 9252,1 --Kill Rotlimb Marauder (x4)
    .mob Rotlimb Marauder
    .isOnQuest 9252
step
    #xprate <1.2
    #loop
    .goto Eversong Woods,51.07,76.32,0
    .goto Eversong Woods,50.89,80.74,40,0
    .goto Eversong Woods,50.83,78.68,40,0
    .goto Eversong Woods,50.42,77.39,40,0
    .goto Eversong Woods,51.07,76.32,40,0
    .goto Eversong Woods,50.89,80.74,40,0
    .goto Eversong Woods,50.83,78.68,40,0
    .goto Eversong Woods,50.42,77.39,40,0
    .goto Eversong Woods,51.07,76.32,40,0
    >>击杀|cRXP_ENEMY_黑暗怨灵|r
    >>|cRXP_WARN_要小心, 因为|r|cRXP_ENEMY_黑暗怨灵|r|cRXP_WARN_施法|r|T136224:0|t[狂怒]|cRXP_WARN_(生命值降低时造成更高伤害并提升攻击速度)|r
    .complete 9252,2 --Kill Darkwraith (x4)
    .mob Darkwraith
    .isOnQuest 9252
step
    #xprate <1.2
    .goto Eversong Woods,54.28,70.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mirveda|r交谈
    .turnin 9254 >>交任务: |cRXP_FRIENDLY_外出的学徒|r
    .accept 8487 >>接任务: |cRXP_LOOT_被腐蚀的土地|r
    .target Apprentice Mirveda
    .isOnQuest 9254
step
    #xprate <1.2
    #optional
    .goto Eversong Woods,54.28,70.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mirveda|r交谈
    .accept 8487 >>接任务: |cRXP_LOOT_被腐蚀的土地|r
    .target Apprentice Mirveda
    .isQuestTurnedIn 9254
step
    #xprate <1.2
    #loop
    .goto Eversong Woods,53.88,70.03,0
    .goto Eversong Woods,54.13,71.21,40,0
    .goto Eversong Woods,50.79,72.17,40,0
    .goto Eversong Woods,50.87,71.40,40,0
    .goto Eversong Woods,51.21,69.89,40,0
    .goto Eversong Woods,51.47,69.09,40,0
    .goto Eversong Woods,52.60,68.47,40,0
    .goto Eversong Woods,53.24,69.28,40,0
    .goto Eversong Woods,53.88,70.03,40,0
    >>战利品|cRXP_PICK_污秽土壤堆|r在地面上
    .complete 8487,1 --Collect Tainted Soil Sample (x8)
    .isQuestTurnedIn 9254
step
    #xprate <1.2
    .goto Eversong Woods,54.28,70.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mirveda|r交谈
    >>|cRXP_WARN_等待RP结束|r
    .turnin 8487 >>交任务: |cRXP_FRIENDLY_被腐蚀的土地|r
    .timer 9,Corrupted Soil RP
    .accept 8488 >>接任务: |cRXP_LOOT_出人意料的结果|r
    .target Apprentice Mirveda
    .isQuestTurnedIn 9254
step
    #xprate <1.2
    .goto Eversong Woods,53.66,69.74,20,0
    .goto Eversong Woods,54.28,70.97
    >>击杀 |cRXP_ENEMY_冷酷的加苏尔|r 和 |cRXP_ENEMY_愤怒之影|r , 以保护 |cRXP_FRIENDLY_米尔维达|r
    .complete 8488,1 --Protect Apprentice Mirveda
    .mob Gharsul the Remorseless
    .mob Angershade
    .isQuestTurnedIn 9254
step
    #xprate <1.2
    #label Notes
    .goto Eversong Woods,54.28,70.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mirveda|r交谈
    .turnin 8488 >>交任务: |cRXP_FRIENDLY_出人意料的结果|r
    .accept 9255 >>接任务: |cRXP_LOOT_研究笔记|r
    .target Apprentice Mirveda
    .isQuestTurnedIn 9254
step
    #xprate <1.2
    #loop
    .goto Eversong Woods,54.13,71.21,0
    .goto Eversong Woods,54.13,71.21,40,0
    .goto Eversong Woods,50.79,72.17,40,0
    .goto Eversong Woods,50.87,71.40,40,0
    .goto Eversong Woods,51.21,69.89,40,0
    .goto Eversong Woods,51.47,69.09,40,0
    .goto Eversong Woods,52.60,68.47,40,0
    .goto Eversong Woods,53.24,69.28,40,0
    .goto Eversong Woods,53.88,70.03,40,0
    >>击杀|cRXP_ENEMY_腐肢劫掠者|r
    .complete 9252,1 --Kill Rotlimb Marauder (x4)
    .mob Rotlimb Marauder
    .isOnQuest 9252
step
    #xprate <1.2
    #completewith DefendingFBV
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活, 或跑回晴风村
    .isQuestComplete 9252
step
    #xprate <1.2
    .goto Eversong Woods,44.029,70.765
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师兰德拉·晨行者|r交谈
    .turnin 9255 >>交任务: |cRXP_FRIENDLY_研究笔记|r
    .target Magistrix Landra Dawnstrider
    .isQuestComplete 9255
step
    #xprate <1.2
    #label DefendingFBV
    .goto Eversong Woods,46.93,71.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠萨蕾恩|r交谈
    .turnin 9252 >>交任务: |cRXP_FRIENDLY_保卫晴风村|r
    .target Ranger Sareyn
    .isQuestComplete 9252
step << !Undead
    #completewith IncrDocs
    .hs >>传送至鹰翼广场
    .cooldown item,6948,>2,1
step
    #completewith IncrDocs
    .goto Eversong Woods,43.949,69.989
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行管理员晨光|r交谈
    .fly Falconwing Square >>飞往鹰翼广场
    .target Skymaster Brightdawn
    .cooldown item,6948,<0 << !Undead
step
    #label IncrDocs
    .goto Eversong Woods,48.17,46.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Aeldon|r交谈
    .turnin 8482 >>交任务: |cRXP_FRIENDLY_秘密文件|r
    .target Aeldon Sunbrand
step << Paladin Cata
    .goto Eversong Woods,48.39,46.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺尔蕾妮|r交谈
    .train 20473 >>训练你的职业法术
    .target Noellene
step << Warrior Cata
    .goto Eversong Woods,48.29,46.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坦·银刃|r交谈
    .train 71 >>训练你的职业法术
    .target Lothan Silverblade
step << Rogue Cata
    .goto Eversong Woods,48.58,46.29,8,0
    .goto Eversong Woods,48.50,45.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_塔娜莉亚|r交谈
    .train 5277 >>训练你的职业法术
    .target Tannaria
step << Hunter Cata
    .goto Eversong Woods,48.27,46.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉诺维亚|r交谈
    .train 34026 >>训练你的职业法术
    .target Hannovia
step << Mage Cata/Warlock Cata/Priest Cata
    #optional
    #completewith next
    .goto Eversong Woods,47.771,47.303,8,0
    .goto Eversong Woods,47.823,47.696,8 >>进入旅店
step << Mage Cata/Warlock Cata/Priest Cata
    #optional
    #completewith next
    .goto Eversong Woods,48.286,47.097,8,0
    .goto Eversong Woods,48.054,47.130,8,0
    .goto Eversong Woods,48.074,47.354,8 >>上楼
step << Priest Cata
    .goto Eversong Woods,47.85,47.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珀纳瑞斯|r交谈
    .train 8092 >>训练你的职业法术
    .target Ponaris
step << Mage Cata
    .goto Eversong Woods,48.04,48.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加琳黛尔|r交谈
    .train 2139 >>训练你的职业法术
    .target Garridel
step << Warlock Cata
    .goto Eversong Woods,48.23,47.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞罗努斯|r交谈
    .train 1120 >>训练你的职业法术
    .target Celoenus
step << !Undead
    #completewith next
    .goto Eversong Woods,46.244,46.786
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行管理员斯凯勒斯|r交谈
    .fly Silvermoon >>飞往银月城
    .target Skymaster Skyles
step << !Undead
    .goto Eversong Woods,56.644,49.628,20,0
    .goto Eversong Woods,56.253,49.224,10,0
    .goto 110,70.881,86.623,10,0
    .goto 110,72.396,85.242
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
step << BloodElf
    .goto Silvermoon City,53.92,71.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨斯雷·蓝空|r交谈
    .turnin 9133 >>交任务: |cRXP_FRIENDLY_飞往银月城|r
    .target Sathren Azuredawn
    .isOnQuest 9133
step << !Undead
    #completewith next
    .goto Silvermoon City,57.53,24.56,10,0
    .goto Silvermoon City,51.77,17.86,10,0
    .goto Silvermoon City,49.48,14.80
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
step << !Undead
    #completewith next
    .goto 18,66.17,4.93,10,0
    .goto 18,61.88,64.94,10 >>离开幽暗城
    .zoneskip Tirisfal Glades
step << Undead
    #completewith next
    .hs >>传送回布瑞尔
step << Undead
    .goto 18,60.13,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫里斯|r交谈
    .turnin 6324 >>交任务: |cRXP_FRIENDLY_向博迪瑞格回报|r
    .target Deathguard Morris
step
    .goto 18,61.06,58.86,12,0
    .goto 18,61.51,59.01,10,0
    .goto 18,61.27,59.22,8,0
    .goto 18,61.13,58.84,8,0
    .goto 18,61.38,58.71,8,0
    .goto 18,61.34,59.17,8,0
    .goto 18,60.51,58.69
    >>登上齐柏林飞艇塔
    .zone Orgrimmar >>前往: |cRXP_PICK_杜隆塔尔|r
]])
