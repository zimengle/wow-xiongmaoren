RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP 起始区域
#groupweight 8
#name 2Retail-Panda_迷踪岛
#displayname The Wandering Isle
#next RestedXP 联盟 10-60\\1A_艾尔文森林 << Alliance
#next RestedXP 部落 10-60\\1 BfA 简介 << Horde
#defaultfor Pandaren

<< Pandaren !DK

step
    #completewith next
    +欢迎来到 RestedXP 编写的 |cFFfa9602Pandaren 起始区|r 指南。
    *Without consumables or heirlooms, this route is approximately 5 minutes slower than Exile's Reach. For faster leveling, consider recreating your character and selecting Exile's Reach instead.
step
    .goto 378,56.67,18.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Shang Xi|r
    .accept 30034 >>接任务: |cRXP_WARN_武装训练|r << Hunter
    .accept 30027 >>接任务: |cRXP_WARN_武装训练|r << Priest/Monk
    .accept 30033 >>接任务: |cRXP_WARN_武装训练|r << Mage
    .accept 30037 >>接任务: |cRXP_WARN_武装训练|r << Shaman
    .accept 30038 >>接任务: |cRXP_WARN_武装训练|r << Warrior
    .accept 30036 >>接任务: |cRXP_WARN_武装训练|r << Rogue
	.target Master Shang Xi
step << Hunter
    .isOnQuest 30034
    .goto 378,57.22,19.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Weapon Rack|r 获取 |T537025:0|t[Trainee's Crossbow]。
    .collect 73211,1 --Trainee's Crossbow (1)
step << Hunter
    .goto 378,57.22,19.22
    >>装备 |T537025:0|t[学员之弩]。
    .complete 30034,1 --1/1 Loot and Equip a Trainee's Crossbow
    .use 73211 --Trainee's Crossbow
step << Mage
    .isOnQuest 30033
    .goto 378,57.22,19.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Weapon Rack|r 获取 |T537771:0|t[Trainee's Spellblade] 和 |T654237:0|t[Trainee's Hand Fan]。
    .collect 76390,1 --Trainee's Spellblade (1)
    .collect 76392,1, --Trainee's Hand Fan (1)
step << Mage
    .goto 378,57.22,19.22
    >>装备|T537771:0|t[学员的法术之刃]和|T654237:0|t[学员的手扇]。
    .complete 30033,1 --Loot and Equip a Trainee's Spellblade (1)
    .complete 30033,2 --Loot and Equip a Trainee's Hand Fan (1)
    .use 76390 --Trainee's Spellblade
    .use 76392 --Trainee's Hand Fan
step << Monk/Priest
    .isOnQuest 30027
    .goto 378,57.22,19.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Weapon Rack|r 获取 |T537770:0|t[Trainee's Staff]。
    .collect 73209,1 -Trainee's Staff (1)
step << Monk/Priest
    .goto 378,56.67,18.20
    >>装备 |T537770:0|t[实习法杖]。
    .complete 30027,1 --Loot and Equip a Trainee's Staff
    .use 73209
step << Shaman
    .isOnQuest 30037
    .goto 378,57.22,19.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Weapon Rack|r 获取 |T537205:0|t[Trainee's Axe] 和 |T537769:0|t[Trainee's Shield]。
    .collect 76391,1  --Trainee's Axe (1)
    .collect 73213,1 --Trainee's Shield (1)
step << Shaman
    .goto 378,57.22,19.22
    >>装备|T537205:0|t[学员之斧]和|T537769:0|t[学员之盾]。
    .complete 30037,1 --Loot and Equip a Trainee's Axe
    .complete 30037,2 --Loot and Equip a Trainee's Shield
    .use 76391 --Trainee's Axe
    .use 73213 --Trainee's Shield
step << Warrior
    .isOnQuest 30038
    .goto 378,57.22,19.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Weapon Rack|r 获取 |T537205:0|t[Trainee's Axe] 和 |T537769:0|t[Trainee's Shield]。
    .collect 76391,1  --Trainee's Axe (1)
    .collect 73213,1  --Trainee's Shield (1)
step << Warrior
    .isOnQuest 30038
    .goto 378,57.22,19.22
    >>装备|T537205:0|t[学员之斧]和|T537769:0|t[学员之盾]。
    .complete 30038,1 --Loot and Equip a Trainee's Axe
    .complete 30038,2 --Loot and Equip a Trainee's Shield
    .use 76391 --Trainee's Axe
    .use 73213 --Trainee's Shield
step << Rogue
    .isOnQuest 30036
    .goto 378,57.22,19.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Weapon Rack|r 获取 |T537767:0|t[Trainee's Daggers]。
    .collect 73208,1,30036,1,1 --Trainee's Dagger (ID 1)
    .collect 73212,1,30036,1,1 --Trainee's Dagger (ID 2)
step << Rogue
    .goto 378,57.22,19.22
    >>装备|T537767:0|t[学员匕首]。
    .complete 30036,1 --Loot and Equip a Trainee's Dagger
    .complete 30036,2 --Loot and Equip a Second Trainee's Dagger
    .use 73208 --Trainee's Dagger (ID 1)
    .use 73212 --Trainee's Dagger (ID 2)
step
    .goto 378,56.67,18.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Shang Xi|r
    .turnin 30034 >>交任务: |cRXP_FRIENDLY_武装训练|r << Hunter
    .turnin 30033 >>交任务: |cRXP_FRIENDLY_武装训练|r << Mage
    .turnin 30027 >>交任务: |cRXP_FRIENDLY_武装训练|r << Priest/Monk
    .turnin 30037 >>交任务: |cRXP_FRIENDLY_武装训练|r << Shaman
    .turnin 30038 >>交任务: |cRXP_FRIENDLY_武装训练|r << Warrior
    .turnin 30036 >>交任务: |cRXP_FRIENDLY_武装训练|r << Rogue
    .accept 29406 >>接任务: |cRXP_WARN_沙袋训练|r
	.target Master Shang Xi
step
    .goto 378,57.49,18.64,10,0
    .goto 378,57.12,19.43,10,0
    .goto 378,57.49,18.64,10,0
    .goto 378,57.12,19.43,10,0
    .goto 378,57.31,18.97
    >>杀死|cRXP_ENEMY_Training 目标|r
    .complete 29406,1 --5/5 Training Targets destroyed
	.mob Training Target
step
    .goto 378,56.67,18.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Shang Xi|r
    .turnin 29406 >>交任务: |cRXP_FRIENDLY_沙袋训练|r
    .accept 29524 >>接任务: |cRXP_WARN_戒骄|r
	.target Master Shang Xi
step
    .goto 378,59.53,19.03,15,0
    .goto 378,60.30,19.00,10,0
    .goto 378,60.13,19.77,10,0
    .goto 378,60.44,19.47
    >>进入 |cFFfa9602building|r 并击败 |cRXP_ENEMY_Sparring Trainees。|r
    .complete 29524,1 --6/6 Sparring Trainees defeated
	.mob Tushui Trainee
	.mob Huojin Trainee
step
    .goto 378,59.67,19.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Shang Xi|r
    .turnin 29524 >>交任务: |cRXP_FRIENDLY_戒骄|r
    .accept 29408 >>接任务: |cRXP_WARN_烧毁卷轴|r
	.target Master Shang Xi
step
    .isOnQuest 29408
    .goto 378,59.97,18.58,8,0
    .goto 378,60.48,18.85,5,0
    .goto 378,60.20,18.89,5,0
    .goto 378,59.98,18.69,5,0
	.goto 378,60.46,19.60,8 >>|cRXP_WARN_通过第二组楼梯下面的缝隙跳过，走捷径到达顶层。|r
step
    .goto 378,59.95,20.39
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Banner|r 进行刻录。
    .complete 29408,2 --1/1 Burn the Edict of Temperance
step
	#completewith next
    .goto 378,60.19,19.35,6 >>|cRXP_WARN_跳下楼|r
step
    .goto 378,59.67,19.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Shang Xi|r
    .turnin 29408 >>交任务: |cRXP_FRIENDLY_烧毁卷轴|r
    .accept 29409 >>接任务: |cRXP_WARN_门徒的挑战|r
	.target Master Shang Xi
step
    .goto 378,67.78,22.75
    >>击败|cRXP_ENEMY_Jaomin。|r
    .complete 29409,1 --1/1 Defeat Jaomin Ro
	.mob Jaomin Ro
step << Warrior
	#completewith Lorvo
    +使用 |T132337:0|tCharge 对小动物进行加速
step
    .goto 378,65.97,22.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Shang Xi|r
    .turnin 29409 >>交任务: |cRXP_FRIENDLY_门徒的挑战|r
    .accept 29410 >>接任务: |cRXP_WARN_土水派的艾莎|r
	.target Master Shang Xi
step
	#label Lorvo
    .goto 378,55.09,32.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Merchant Lorvo|r
    .turnin 29410 >>交任务: |cRXP_FRIENDLY_土水派的艾莎|r
    .accept 29419 >>接任务: |cRXP_WARN_失踪的车夫|r
    .accept 29424 >>接任务: |cRXP_WARN_至关重要的物品|r
	.target Merchant Lorvo
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Amberleaf Scamps|r 并掠夺他们的 |T132622:0|t|cRXP_LOOT_Supplies。|r
    .complete 29424,1 --6/6 Stolen Training Supplies
	.mob Amberleaf Scamp
step
    .goto 378,54.11,20.90
    >>|cRXP_WARN_按照箭头的方向。|r
    .complete 29419,1 --1/1 Rescue the Cart Driver
	.target Min Dimwind
step
    .goto 378,54.03,20.93,15,0
    .goto 378,54.02,17.44,15,0
    .goto 378,53.00,20.17,15,0
    .goto 378,54.03,20.93,15,0
    .goto 378,54.02,17.44
    >>杀死 |cRXP_ENEMY_Amberleaf Scamps|r 并掠夺他们的 |T132622:0|t|cRXP_LOOT_Supplies。|r
    .complete 29424,1 --6/6 Stolen Training Supplies
	.target Amberleaf Scamp
step
    .isOnQuest 29424
    .goto 378,54.03,20.93,15,0
    .goto 378,54.02,17.44,15,0
    .goto 378,53.00,20.17,15,0
    .goto 378,54.03,20.93
    >>|cRXP_WARN_1./sit 增加你受到的伤害。|r
    >>|cRXP_WARN_2. 卸下你的装备会增加你受到的伤害。|r
    .deathskip >>死亡并重生|cFFfa9602在灵魂治疗师处。|r
	.target Spirit Healer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Merchant Lorvo|r and |cRXP_FRIENDLY_Aysa Cloudsinger.|r
    .turnin 29419,2 >>交任务: |cRXP_FRIENDLY_失踪的车夫|r
    .turnin 29424 >>交任务: |cRXP_FRIENDLY_至关重要的物品|r
    .goto 378,55.11,32.40
    .accept 29414 >>接任务: |cRXP_WARN_土水之道|r
    .goto 378,55.10,32.55
	.target Merchant Lorvo
	.target Aysa Cloudsinger
step << Hunter
    .isOnQuest 29414
    .goto 378,56.25,30.34,30,0
    .goto 378,57.97,30.62
    .tame 57797 >>|cRXP_WARN_驯服一只沙狐|r
	.target Corsac Fox
step
	.isOnQuest 29414
    .goto 378,55.61,30.90,15,0 << !Hunter
    .goto 378,55.94,30.96,10,0
    .goto 378,56.58,31.98,10,0
    .goto 378,57.89,36.55,15 >>进入|cFFfa9602cave。|r
	.timer 87,Cave RP
step
    #sticky
    .goto 378,57.89,36.55,10,0
    >>保卫 |cRXP_FRIENDLY_Aysa|r 免受 |cRXP_ENEMY_Amberleaf 麻烦制造者的侵扰。|r
    .complete 29414,1 --1/1 Protect Aysa while she meditates
	.mob Amberleaf Troublemaker
step
    #title Advanced
    .isOnQuest 29414
    >>|cFFFF0000尝试找出答案。|r
    .goto 378,57.52,34.59,5 >>|cRXP_WARN_呆在入口附近比较快，但也更危险。|r
step
    .goto 378,57.54,34.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Shang Xi|r
    .turnin 29414 >>交任务: |cRXP_FRIENDLY_土水之道|r
    .accept 29522 >>接任务: |cRXP_WARN_火金派的季|r
	.target Master Shang Xi
step << Hunter
    .isOnQuest 29522
    .hs >>炉边|cFFfa9602前往尚熙训练场。|r
step
    .goto 378,50.24,21.26
    >>走到树根处，然后脱离束缚，爬到你左边的墙上 << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 29522 >>交任务: |cRXP_FRIENDLY_火金派的季|r
    .accept 29417 >>接任务: |cRXP_WARN_火金之道|r
	.target Ji Firepaw
step
    .goto 378,51.18,17.71,20,0
    .goto 378,49.56,18.31,20,0
    .goto 378,49.49,20.13,20,0
    .goto 378,48.27,22.97,20,0
    .goto 378,49.23,24.48,20,0
    .goto 378,49.90,23.37,20,0
    .goto 378,51.18,17.71,20,0
    .goto 378,49.56,18.31,20,0
    .goto 378,49.49,20.13,20,0
    .goto 378,48.27,22.97,20,0
    .goto 378,49.23,24.48,20,0
    .goto 378,49.90,23.37
    >>杀死 |cRXP_ENEMY_Hozen|r
    .complete 29417,1 --8/8 Fe-Feng attackers slain
	.mob Fe-Feng Hozen
    .mob Fe-Feng Brewthief
    .mob Fe-Feng Leaper
step
    .goto 378,50.24,21.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 29417 >>交任务: |cRXP_FRIENDLY_火金之道|r
    .accept 29418 >>接任务: |cRXP_WARN_点火|r
    .accept 29523 >>接任务: |cRXP_WARN_煽风|r
	.target Ji Firepaw
step
    .isOnQuest 29523
    #completewith Fluttering Breeze
    +|cRXP_WARN_要启用任务物品的键绑定，请按照以下步骤操作：|r
    *[1] Press the |cRXP_WARN_Escape key.|r
    *[2] Select |cRXP_WARN_Options.|r
    *[3] Navigate to |cRXP_WARN_Keybindings.|r
    *[4] Within |cRXP_WARN_Keybindings|r, find |cRXP_WARN_RestedXP Guides.|r
    *[5] Select and bind the |cRXP_WARN_Active Buttons.|r
step
    #completewith Fluttering Breeze
	>>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Roots|r
    .complete 29418,1 --5/5 Dry Dogwood Root
step
    .isOnQuest 29523
    .goto 378,48.63,29.43,10,0
    .goto 378,47.98,31.94,10,0
    .goto 378,47.29,31.43
	.cast 106299 >>在神社使用|T519378:0|t[风之石]|cFFfa9602。|r
    .use 72109
step
    #label Fluttering Breeze
    .goto 378,46.73,30.32,10,0
    >>杀死 |cRXP_ENEMY_Living Air|r 并从他身上夺取 |T463565:0|t|cRXP_LOOT_Fluttering Breeze。|r
    .complete 29523,1 --1/1 Fluttering Breeze
    .use 72109
	.mob Living Air
step
    .goto 378,46.07,27.94,10,0
    .goto 378,48.99,30.16,10,0
    .goto 378,46.83,34.88,10,0
    .goto 378,46.04,33.12,10,0
    .goto 378,47.39,29.11
	>>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Roots|r
    .complete 29418,1 --5/5 Dry Dogwood Root
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r and |cRXP_FRIENDLY_Shang Xi.|r
    .turnin 29418 >>交任务: |cRXP_FRIENDLY_点火|r
    .turnin 29523 >>交任务: |cRXP_FRIENDLY_煽风|r
    .goto 378,50.24,21.26
    .accept 29420 >>接任务: |cRXP_WARN_元素之灵守护者|r
    .goto 378,50.29,21.47
	.target Ji Firepaw
	.target Master Shang Xi
step
	.isOnQuest 29420
    .goto 378,41.09,24.83,10 >>进入|cFFfa9602cave。|r
step
    .goto 378,40.75,23.86,10,0
    .goto 378,40.84,22.19,10,0
    .goto 378,40,22.77,10,0
    .goto 378,38.81,25.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Li Fei.|r
    .turnin 29420 >>交任务: |cRXP_FRIENDLY_元素之灵守护者|r
    .accept 29664 >>接任务: |cRXP_WARN_挑战者之火|r
	.target Master Li Fei
step
    .goto 378,38.71,25.39
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Brazier。|r
    .complete 29664,1 --1/1 Challenger Torch lit
 step
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Braziers。|r
    .complete 29664,4 --1/1 Violet Brazier lit
    .goto 378,38.25,24.87
    .complete 29664,2 --1/1 Red Brazier lit
    .goto 378,38.99,23.50
    .complete 29664,3 --1/1 Blue Brazier lit
    .goto 378,39.19,25.41
step
    .goto 378,38.81,25.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Li Fei.|r
    .turnin 29664 >>交任务: |cRXP_FRIENDLY_挑战者之火|r
    .accept 29421 >>接任务: |cRXP_WARN_胜者方能通行|r
	.target Master Li Fei
step
    .goto 378,38.88,24.64,10,0
    .goto 378,38.81,25.51
    >>击败 |cRXP_FRIENDLY_Master Li Fei|r，将他的生命值降至 20%。
    .complete 29421,1 --1/1 Defeat Master Li Fei
	.mob Master Li Fei
step
    .goto 378,38.81,25.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Li Fei.|r
    .turnin 29421,2 >>交任务: |cRXP_FRIENDLY_胜者方能通行|r
    .accept 29422 >>接任务: |cRXP_WARN_上古火灵燧焰|r
	.target Master Li Fei
step
	.isOnQuest 29422
    .goto 378,39.45,29.65
	.cast 102522 >>对 |cRXP_FRIENDLY_Huo 使用 |T133662:0|t[Huo's Offerings]。|r
	.timer 11, Huo the Spirit of Fire RP
	.use 72583
    .target Huo
step
    .goto 378,39.45,29.65
    >>|cRXP_WARN_等待简短的角色扮演，当计时器用完时将完成。|r
    .complete 29422,1 --1/1 Reignite the Spirit of Fire
    .use 72583
    .target Huo
step
    .goto 378,39.41,29.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huo|r
    .turnin 29422 >>交任务: |cRXP_FRIENDLY_上古火灵燧焰|r
    .accept 29423 >>接任务: |cRXP_WARN_神真子的热情|r
	.target Huo
step
	.isOnQuest 29423
    .goto 378,40.12,25.50,20,0
    .goto 378,41.48,25.05,20,0
    .goto 378,51.04,30.62,20,0
    .goto 378,51.89,35.93,20,0
    .goto 378,50.32,37.48,20,0
    .goto 378,51.58,40.46,20 >>旅行|cFFfa9602前往五晓神庙。|r
step
    .goto 378,51.41,46.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Shang Xi|r
    .turnin 29423 >>交任务: |cRXP_FRIENDLY_神真子的热情|r
    .accept 29521 >>接任务: |cRXP_WARN_咏之池|r
	.target Master Shang Xi
step
    .isOnQuest 29521
    .goto 378,51.83,46.08
    .home >>将炉石设置为|cFFfa9602五黎明神殿。|r
	.target Cheng Dawnscrive
step
    .isOnQuest 29521
    .goto 378,53.22,47.45,10,0
    .goto 378,57.12,46.63,10,0
    .goto 378,63.12,41.44
    .skipgossip 57620,1,1
    .gossipoption 38919 >>草药学窗口
    .train 2366 >>从 |cRXP_FRIENDLY_Dewei|r 处学习草药学
    .target Whittler Dewei
step
    .isOnQuest 29521
    .goto 378,63.12,41.44
    .skipgossip 57620,2,3
    .gossipoption 38872 >>采矿窗口
    .train 2575 >>来自 |cRXP_FRIENDLY_Dewei|r 的火车挖矿
	.target Whittler Dewei
step
    #completewith next
    +|cRXP_WARN_在这个区域，一些水会把你变成动物，从而提高你的移动速度。|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jojo Ironbrow|r and |cRXP_FRIENDLY_Aysa Cloudsinger.|r
    .accept 29662 >>接任务: |cRXP_WARN_比芦苇更硬|r
    .goto 378,63.50,41.93
    .turnin 29521 >>交任务: |cRXP_FRIENDLY_咏之池|r
    .accept 29661 >>接任务: |cRXP_WARN_戒躁|r
    .accept 29663 >>接任务: |cRXP_WARN_平衡训练|r
    .goto 378,65.59,42.61
	.target Jojo Ironbrow
	.target Aysa Cloudsinger
step
    .isOnQuest 29663
    #completewith next
    +|cRXP_WARN_在这个区域，一些水会把你变成动物，从而提高你的移动速度。|r
step
    .isOnQuest 29663
	#completewith Shrine
    .goto 378,63.37,45.17
	.vehicle >>当您不在水中时，单击 |cRXP_FRIENDLY_Balance Pole|r。
step
    #completewith Shrine
	>>击败杆子上的 |cRXP_ENEMY_Tushui Monks|r。
    .complete 29663,1 --6/6 Defeat Tushui Monks
	.mob Tushui Monk
step
    .isOnQuest 29661
	#label Shrine
    .goto 378,61.39,47.87,5 >>跳到距离 |cFFfa9602Shrine|r 最近的杆子上，向它导航。
step
    .goto 378,61.41,47.81
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Bell。|r
    .complete 29661,1 --1/1 戒指 the Training Bell
step
    #completewith next
	>>击败杆子上的 |cRXP_ENEMY_Tushui Monks|r。
    .complete 29663,1 --6/6 Defeat Tushui Monks
	.mob Tushui Monk
step
    .goto 378,61.08,46.43,15,0
    .goto 378,61.16,45.27,15,0
    .goto 378,61.94,44.44,15,0
    .goto 378,62.77,44.86,15,0
    .goto 378,62.76,46.36,15,0
    .goto 378,62.68,48.46,15,0
    .goto 378,62.25,50,15,0
    .goto 378,60.43,48.97
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Hard Tearwood Reed|r
    .complete 29662,1 --8/8 Hard Tearwood Reed
step
    .goto 378,62.77,44.86,15,0
    .goto 378,62.76,46.36,15,0
    .goto 378,62.68,48.46,15,0
    .goto 378,62.25,50,15,0
    .goto 378,60.43,48.97,15,0
    .goto 378,62.22,44.33
	>>击败杆子上的 |cRXP_ENEMY_Tushui Monks|r。
    .complete 29663,1 --6/6 Defeat Tushui Monks
	.mob Tushui Monk
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jojo Ironbrow|r and |cRXP_FRIENDLY_Aysa Cloudsinger.|r
    .turnin 29662 >>交任务: |cRXP_FRIENDLY_比芦苇更硬|r
    .goto 378,63.50,41.93
    .turnin 29661 >>交任务: |cRXP_FRIENDLY_戒躁|r
    .turnin 29663 >>交任务: |cRXP_FRIENDLY_平衡训练|r
    .accept 29676 >>接任务: |cRXP_WARN_寻找老朋友|r
    .goto 378,65.59,42.61
	.target Jojo Ironbrow
	.target Aysa Cloudsinger
step
    #completewith next
    +|cRXP_WARN_在这个区域，一些水会把你变成动物，从而提高你的移动速度。|r
step
    .goto 378,72.15,37.88,13,0
    .goto 378,70.62,38.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Old Man Liang|r
    .turnin 29676 >>交任务: |cRXP_FRIENDLY_寻找老朋友|r
    .accept 29666 >>接任务: |cRXP_WARN_吃一蛰，长一智|r
    .accept 29677 >>接任务: |cRXP_WARN_炎阳珠|r
	.target Old Man Liang
step
    .goto 378,73.86,40.37,30,0
    .goto 378,72.67,42.89,30,0
    .goto 378,75.41,37.59,30,0
    .goto 378,73.86,40.37,30,0
    .goto 378,72.67,42.89,30,0
    .goto 378,75.41,37.59
    >>杀死 |cRXP_ENEMY_Water Pincers|r
    .complete 29666,1 --6/6 Water Pincer slain
    .mob Water Pincer
step
    .goto 378,76.21,46.87
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Ancient Clam|r |cFFfa9602underwater。|r
    >>|cRXP_WARN_你不需要杀死|r|cRXP_ENEMY_Fang-she。|r
    .complete 29677,1 --1/1 Sun Pearl
    .mob Fang-she
step
    .goto 378,78.48,42.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Old Man Liang|r
    .turnin 29666 >>交任务: |cRXP_FRIENDLY_吃一蛰，长一智|r
    .turnin 29677 >>交任务: |cRXP_FRIENDLY_炎阳珠|r
    .accept 29678 >>接任务: |cRXP_WARN_上古水灵涓流|r
	.target Old Man Liang
step
	.isOnQuest 29678
    .goto 378,79.66,41.83,4,0
    .goto 378,79.61,38.72
    >>将自己定位在|cFFfa9602蓝色圆圈上。|r 这样您就可以|cFFfa9602跳向泳池。|r
    .complete 29678,1 --1/1 Cross to the Pool of Reflection
step
    .goto 378,79.59,38.58
    >>在 |cFFfa9602水面上使用 |T463854:0|t[太阳珍珠]。|r
    .complete 29678,2 --1/1 Coax Shu, the Water Spirit
    .use 73791
step
    .goto 378,79.82,39.31
    >>单击任务日志中的任务提交弹出窗口。
    .turnin 29678 >>交任务: |cRXP_FRIENDLY_上古水灵涓流|r
step
    .goto 378,79.82,39.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger|r
    .accept 29679 >>接任务: |cRXP_WARN_新朋友|r
	.target Aysa Cloudsinger
step
    --x shiek : no go to here, as i think it would only be confusing here.
    >>密切跟随 |cRXP_FRIENDLY_Shu|r 移动。他会在附近的水中投掷喷水柱 |cFFfa9602。|r 确保将自己置于喷水柱 |cFFfa9602 上方。|r
    >>被弹到空中后使用脱离进行最后一次喷射  << Hunter
    >>被弹到空中后使用闪现进行最后一次喷射 << Mage
    .complete 29679,1 --5/5 Play with the Spirit of Water
	.target Shu
step
    .goto 378,79.82,39.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger|r
    .turnin 29679 >>交任务: |cRXP_FRIENDLY_新朋友|r
    .accept 29680 >>接任务: |cRXP_WARN_生计来源|r
	.target Aysa Cloudsinger
step
    .goto 378,76.57,57.36,40,0
    .goto 378,68.89,64.98
	>>|cRXP_WARN_忽略|r |cRXP_FRIENDLY_送货车|r；|cRXP_WARN_步行可以让您更快到达目的地。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 29680 >>交任务: |cRXP_FRIENDLY_生计来源|r
    .accept 29769 >>接任务: |cRXP_WARN_小无赖|r
    .target Ji Firepaw
step
    .goto 378,68.13,66.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gao Summerdraft|r
    .accept 29770 >>接任务: |cRXP_WARN_还能吃！|r
	.target Gao Summerdraft
step
	#completewith Carrots
    >>杀死 |cRXP_ENEMY_Plump Virmens|r
    .complete 29769,1 --10/10 Plump Virmen slain
	.mob Plump Virmen
    .mob Plump Carrotcatcher
step
    .goto 378,70.11,77.63,15,0
    .goto 378,69.55,79.23,15,0
    .goto 378,70.84,80.41,15,0
    .goto 378,71.46,78.11,15,0
#loop
	.line 378,70.11,77.63,69.55,79.23,70.84,80.41,71.46,78.11
	.goto 378,70.11,77.63,10,0
	.goto 378,69.55,79.23,10,0
	.goto 378,70.84,80.41,10,0
	.goto 378,71.46,78.11,10,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Turnips|r
    .complete 29770,1 --3/3 Uprooted Turnip
step
    .goto 378,75.54,72.25,20,0
    .goto 378,77.79,71.81,20,0
    .goto 378,78.01,72.56,15,0
    .goto 378,78.85,70.76,20,0
    .goto 378,78.6,69.74,20,0
#loop
	.line 378,77.35,70.51,78.12,72.61,78.82,70.88,78.6,69.75
	.goto 378,77.35,70.51,10,0
	.goto 378,78.12,72.61,10,0
	.goto 378,78.82,70.88,10,0
	.goto 378,78.60,69.75,10,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Pumpkin|r
    .complete 29770,3 --3/3 Pilfered Pumpkin
step
	.isOnQuest 29770
    .goto 378,77.05,71.02,10 >>进入|cFFfa9602洞穴|r
step
	#label Carrots
    .goto 378,76.1,71.26,15,0
    .goto 378,75.57,72.94,15,0
    .goto 378,73.97,72.58,15,0
    .goto 378,73.94,70.86,15,0
    .goto 378,74.7,74.76,15,0
#loop
	.line 378,73.97,72.58,73.94,70.86,74.7,74.76
	.goto 378,73.97,72.58,5,0
	.goto 378,73.94,70.86,5,0
	.goto 378,74.70,74.76,5,0
    >>Kill |cRXP_ENEMY_Plump Carrotcatchers|r and loot them for their |cRXP_LOOT_Carrots|r. You can also |TInterface/cursor/crosshair/interact.blp:20|tclick the |cRXP_PICK_Carrots|r on the ground.
    .complete 29770,2 --3/3 Stolen Carrot
	.mob Plump Carrotcatcher
step
	.isOnQuest 29770
    .goto 378,74.99,69.42,10 >>离开|cFFfa9602洞穴|r
step
    .goto 378,74.73,67.2,15,0
    .goto 378,72.67,69.48,15,0
    .goto 378,70.75,71.61,15,0
    .goto 378,69.4,69.74,15,0
#loop
	.line 378,77.89,70.13,77.36,70.49,77.85,71.75
	.goto 378,77.89,70.13,10,0
	.goto 378,77.36,70.49,10,0
	.goto 378,77.85,71.75,10,0
    >>杀死 |cRXP_ENEMY_Plump Virmens|r
    .complete 29769,1 --10/10 Plump Virmen slain
	.mob Plump Virmen
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gao Summerdraft|r, |cRXP_FRIENDLY_Ji Firepaw|r, and |cRXP_FRIENDLY_Jojo Ironbrow|r
    .turnin 29770 >>交任务: |cRXP_FRIENDLY_还能吃！|r
    .goto 378,68.13,66.40
    .turnin 29769 >>交任务: |cRXP_FRIENDLY_小无赖|r
    .accept 29768 >>接任务: |cRXP_WARN_丢失的槌子|r
	.goto 378,68.89,64.98
    .accept 29771 >>接任务: |cRXP_WARN_比木头更硬|r
    .goto 378,69.16,66.71
	.target Gao Summerdraft
	.target Ji Firepaw
	.target Jojo Ironbrow
step
	#completewith next
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Wood Planks|r
    .complete 29771,1 --12/12 Discarded Wood Plank
step
    .goto 378,62.63,77.05
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击桶上的 |cRXP_PICK_Mallet|r |cFFfa9602。|r
    >>|cRXP_WARN_如果可以避免的话，您不必杀死 |cRXP_ENEMY_Raggis|r。|r
    .complete 29768,1 --1/1 Dai-Lo Recess Mallet
step
    .goto 378,63.77,77.19,15,0
    .goto 378,63.27,79.16,15,0
    .goto 378,62.94,79.04,15,0
    .goto 378,62.19,81.08,15,0
    .goto 378,63.77,77.19,15,0
    .goto 378,63.27,79.16,15,0
    .goto 378,62.94,79.04,15,0
    .goto 378,62.19,81.08
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击地板上的 |cRXP_PICK_Wood Planks|r |cFFfa9602。|r
    .complete 29771,1 --12/12 Discarded Wood Plank
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jojo Ironbrow|r and |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 29771 >>交任务: |cRXP_FRIENDLY_比木头更硬|r
    .goto 378,69.16,66.71
    .turnin 29768 >>交任务: |cRXP_FRIENDLY_丢失的槌子|r
    .accept 29772 >>接任务: |cRXP_WARN_锣声震天|r
	.goto 378,68.89,64.98
    .target Jojo Ironbrow
    .target Ji Firepaw
step
    .goto 378,68.95,64.80
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Gong。|r
    .complete 29772,1 --1/1 戒指 the town gong
step
    .goto 378,68.89,64.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 29772 >>交任务: |cRXP_FRIENDLY_锣声震天|r
    .accept 29774 >>接任务: |cRXP_WARN_别泼脸！|r
	.target Ji Firepaw
step
    .goto 378,68.98,62.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shu|r
    .complete 29774,1 --1/1 Ask Shu for help
    .skipgossip
	.timer 15,Not In the Face! RP
	.target Shu
step
    .goto 378,68.89,64.98
    >>|cRXP_WARN_等待简短的角色扮演，当计时器用完时将完成。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 29774 >>交任务: |cRXP_FRIENDLY_别泼脸！|r
    .accept 29775 >>接任务: |cRXP_WARN_神真子的灵魂和躯体|r
	.target Ji Firepaw
step
	.isOnQuest 29775
    .goto 378,58.86,63.38,40,0
    .goto 378,55.23,58.57,40,0
    .goto 378,51.48,57.40,20 >>前往五黎明神庙
	>>|cRXP_WARN_忽略|r |cRXP_FRIENDLY_送货车|r；|cRXP_WARN_步行可以让您更快到达目的地。|r
step
    .goto 378,51.59,48.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Shang Xi|r
    .turnin 29775 >>交任务: |cRXP_FRIENDLY_神真子的灵魂和躯体|r
    .accept 29776 >>接任务: |cRXP_WARN_晨息村|r
	.timer 20,Morning Breeze Village RP
	.target Master Shang Xi
step
    .isOnQuest 29776
    .goto 378,51.46,48.93,7 >>|cRXP_WARN_等待简短的角色扮演，当计时器用完时将完成。|r
step
	.isOnQuest 29776
    .goto 378,51.01,49.05,10,0
    .goto 378,40.19,50.79,20,0
    .goto 378,34.91,50.73,15,0
    .goto 378,33.1,42.6,15,0
    .goto 378,30.42,37.50,20 >>前往|cFFfa9602晨风村|r
step
    .goto 378,30.97,36.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 29776 >>交任务: |cRXP_FRIENDLY_晨息村|r
    .accept 29778 >>接任务: |cRXP_WARN_重写智慧|r
	.target Ji Firepaw
step
    .goto 378,30.17,39.01,15,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elder Shaopai|r and |cRXP_FRIENDLY_Jojo Ironbrow.|r
    .accept 29777 >>接任务: |cRXP_WARN_作案工具|r
    .goto 378,31.78,39.71
    .accept 29783 >>接任务: |cRXP_WARN_比石头更硬|r
    .goto 378,29.90,39.76
	.target Elder Shaopai
	.target Jojo Ironbrow
step
    .isOnQuest 29777
    #completewith Defaced Scroll of Wisdom burned
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shen Stonecarver|r
    .vendor >>|cRXP_WARN_如果需要的话，可以出售和修理。|r
    .target Shen Stonecarver
step
    #completewith Defaced Scroll of Wisdom burned
    >>杀死 |cRXP_ENEMY_Fe-Feng Wisemans|r 并掠夺他们的 |cRXP_LOOT_Brushes。|r
    .complete 29777,1 --8/8 Paint Soaked Brush
	.mob Fe-Feng Wiseman
step
    #completewith Defaced Scroll of Wisdom burned
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Stone Blocks。|r
    .complete 29783,1 --12/12 Abandoned Stone Block
step
    .goto 378,30.3,42.95,15,0
    .goto 378,29.49,45.36,15,0
    .goto 378,29.11,47.53,15,0
    .goto 378,29.78,47.67,15,0
    .goto 378,29.21,48.57,15,0
    .goto 378,28.37,49.37,15,0
    .goto 378,27.16,49.67,15,0
    .goto 378,28.54,49.93,15,0
    .goto 378,29.12,51.09,15,0
    .goto 378,31.19,47.97,15,0
    .goto 378,32.49,46.63,15,0
    .goto 378,33.13,46.32,15,0
#loop
	.line 378,33.42,50.88,32.57,53.31,28.71,50.23
	.goto 378,33.42,50.88,15,0
	.goto 378,32.57,53.31,15,0
	.goto 378,28.71,50.23,15,0
    #label Defaced Scroll of Wisdom burned
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击纪念碑上的 |cRXP_PICK_Banners|r。
    .complete 29778,1 --5/5 Defaced Scroll of Wisdom burned
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Fe-Feng Wisemans|r 并掠夺他们的 |cRXP_LOOT_Brushes。|r
    .complete 29777,1 --8/8 Paint Soaked Brush
	.mob Fe-Feng Wiseman
step
    .goto 378,31.18,47.97,15,0
    .goto 378,32.57,46.43,15,0
    .goto 378,33.66,47.21,15,0
    .goto 378,33.99,50.9,15,0
    .goto 378,33.06,52.27,15,0
    .goto 378,32.16,50.53,15,0
    .goto 378,31.32,52.22,15,0
#loop
	.line 378,31.18,47.9,32.57,46.43,33.99,50.9,32.16,50.53,31.32,52.22
	.goto 378,31.18,47.90,15,0
	.goto 378,32.57,46.43,15,0
	.goto 378,33.99,50.90,15,0
	.goto 378,32.16,50.53,15,0
	.goto 378,31.32,52.22,15,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Stone Blocks。|r
    .complete 29783,1 --12/12 Abandoned Stone Block
step
#loop
	.line 378,31.18,47.9,32.57,46.43,33.99,50.9,32.16,50.53,31.32,52.22
	.goto 378,31.18,47.90,15,0
	.goto 378,32.57,46.43,15,0
	.goto 378,33.99,50.90,15,0
	.goto 378,32.16,50.53,15,0
	.goto 378,31.32,52.22,15,0
    >>杀死 |cRXP_ENEMY_Fe-Feng Wisemans|r 并掠夺他们的 |cRXP_LOOT_Brushes。|r
    .complete 29777,1 --8/8 Paint Soaked Brush
	.mob Fe-Feng Wiseman
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elder Shaopai|r, |cRXP_FRIENDLY_Jojo Ironbrow|r, and |cRXP_FRIENDLY_Ji Firepaw.|r
    .turnin 29777 >>交任务: |cRXP_FRIENDLY_作案工具|r
    .goto 378,31.78,39.71
    .turnin 29783 >>交任务: |cRXP_FRIENDLY_比石头更硬|r
    .goto 378,29.90,39.76
    .turnin 29778 >>交任务: |cRXP_FRIENDLY_重写智慧|r
    .accept 29779 >>接任务: |cRXP_WARN_以直报怨|r
    .accept 29780 >>接任务: |cRXP_WARN_不作恶|r
    .accept 29781 >>接任务: |cRXP_WARN_警告猴子|r
    .goto 378,30.97,36.74
	.target Elder Shaopai
	.target Jojo Ironbrow
	.target Ji Firepaw
step
	.isOnQuest 29779
    .goto 378,29.28,39.98,15,0
    .goto 378,27.42,36.25,30,0
    .goto 378,26.42,33.68,30 >>前往|cFFfa9602玉柱。|r
step
	#completewith next
	>>杀死 |cRXP_ENEMY_Fe-Feng Hozen|r
    .complete 29779,1 --20/20 Fe-Feng Hozen slain
	.mob Fe-Feng Firethief
	.mob Fe-Feng Ruffian
step
    .goto 378,26.42,33.68
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_Jade Pillar|r
    .accept 29782 >>接任务: |cRXP_WARN_比骨头更硬|r
step
    #completewith next
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Firework Bundles|r
    .complete 29781,1 --8/8 Stolen Firework Bundle
step
    .goto 378,26.75,31.86,15,0
    .goto 378,27.49,29.61,15,0
    .goto 378,25.72,29.91,15,0
    .goto 378,24.24,30.84,15,0
    .goto 378,20.52,34.6,10,0
#loop
	.line 378,24.24,30.84,25.72,29.91,27.49,29.61,26.75,31.86
	.goto 378,24.24,30.84,10,0
	.goto 378,25.72,29.91,10,0
	.goto 378,27.49,29.61,10,0
	.goto 378,26.75,31.86,10,0
	>>杀死 |cRXP_ENEMY_Fe-Feng Hozen|r
    .complete 29779,1 --20/20 Fe-Feng Hozen slain
	.mob Fe-Feng Firethief
	.mob Fe-Feng Ruffian
step
    .goto 378,26.08,35.17,15,0
    .goto 378,20.94,34.43
	>>杀死 |cRXP_ENEMY_Ruk-Ruk|r
    .complete 29780,1 --1/1 Ruk-Ruk slain
	.mob Ruk-Ruk
step
    #completewith next
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Firework Bundles|r
    .complete 29781,1 --8/8 Stolen Firework Bundle
step
    >>杀死 |cRXP_ENEMY_Fe-Feng Hozen|r
    .complete 29779,1 --20/20 Fe-Feng Hozen slain
	.mob Fe-Feng Firethief
	.mob Fe-Feng Ruffian
step
#loop
	.line 378,24.24,30.84,25.72,29.91,27.49,29.61,26.75,31.86
	.goto 378,24.24,30.84,10,0
	.goto 378,25.72,29.91,10,0
	.goto 378,27.49,29.61,10,0
	.goto 378,26.75,31.86,10,0
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Firework Bundles|r
    .complete 29781,1 --8/8 Stolen Firework Bundle
step
	#completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 Ji Firepaw 交谈，他应该在你旁边。|cFFFF0000如果他不在，请跳过此步骤。|r
    .turnin 29779 >>交任务: |cRXP_FRIENDLY_以直报怨|r
    .turnin 29780 >>交任务: |cRXP_FRIENDLY_不作恶|r
    .turnin 29781 >>交任务: |cRXP_FRIENDLY_警告猴子|r
    .accept 29784 >>接任务: |cRXP_WARN_平衡之念|r
	.target Ji Firepaw
step
    .goto 378,29.90,39.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jojo Ironbrow|r
    .turnin 29782 >>交任务: |cRXP_FRIENDLY_比骨头更硬|r
	.target Jojo Ironbrow
step
    .goto 378,30.97,36.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 29779 >>交任务: |cRXP_FRIENDLY_以直报怨|r
    .turnin 29780 >>交任务: |cRXP_FRIENDLY_不作恶|r
    .turnin 29781 >>交任务: |cRXP_FRIENDLY_警告猴子|r
    .accept 29784 >>接任务: |cRXP_WARN_平衡之念|r
	.target Ji Firepaw
step
	#completewith next
    .goto 378,31.14,36.79,5,0
    .goto 378,32.17,36.36,8,0
    .goto 378,32.88,37.16,8,0
    .goto 378,32.94,35.61,8 >>|cRXP_WARN_Carefully|r 走过绳子
step
	#label BalancedP
    .goto 378,32.94,35.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger|r
    .turnin 29784 >>交任务: |cRXP_FRIENDLY_平衡之念|r
    .accept 29785 >>接任务: |cRXP_WARN_上古风灵大风|r
	.target Aysa Cloudsinger
step
	#sticky
	#label Temple1
    .goto 378,30.21,38.57,20,0
    .goto 378,28.94,62.89,20 >>前往|cFFfa9602寺庙。|r
	.isOnQuest 29785
step
	#sticky
	#label Temple2
	#requires Temple1
    .goto 378,26.64,66.63,10 >>风第一次减弱后，在楼梯间奔跑
	.isOnQuest 29785
step
	#sticky
	#label Temple3
	#requires Temple2
    .goto 378,26.64,66.63,10 >>等隔壁房间的风平息后，跑向|cRXP_FRIENDLY_Dafeng|r
	.isOnQuest 29785
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dafeng|r and |cRXP_FRIENDLY_Aysa|r
    .turnin 29785 >>交任务: |cRXP_FRIENDLY_上古风灵大风|r
    .goto 378,24.65,69.80
    .accept 29786 >>接任务: |cRXP_WARN_天空之战|r
    .goto 378,24.78,69.78
	.target Dafeng
	.target Aysa Cloudsinger
step
    .goto 378,29.54,60.74,5,0
    .goto 378,30.18,61.88,5,0
    .goto 378,30.93,61.59,5,0
    .goto 378,31.37,60.05,5,0
    .goto 378,29.78,58.93,5,0
    .goto 378,29.54,60.74,5,0
    .goto 378,30.18,61.88,5,0
    .goto 378,30.93,61.59,5,0
    .goto 378,31.37,60.05,5,0
    .goto 378,29.78,58.93,5,0
    .goto 378,30.52,59.72
	>>|TInterface/cursor/crosshair/interact.blp:20|t当 |cRXP_ENEMY_Zhao-Ren|r 在他们上方时，点击 |cRXP_PICK_Firework Launchers|r 来伤害他。他会逆时针旋转。|cRXP_WARN_Avoid 他的闪电水坑|r。在他落地时对他造成伤害。在他第二次落地时杀死他
    .complete 29786,1 --1/1 Zhao-Ren slain
	.target Zhao-Ren
step
    .goto 378,29.99,60.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Shang Xi|r
    .turnin 29786 >>交任务: |cRXP_FRIENDLY_天空之战|r
    .accept 29787 >>接任务: |cRXP_WARN_传承的价值|r
	.target Master Shang Xi
step
	#completewith next
    .goto 378,26.32,52.83,20,0
    .goto 378,22.70,52.80,40 >>旅行 |cFFfa9602前往长老之路。|r
step
    .goto 378,22.70,52.80
	>>杀死|cRXP_ENEMY_长老守护者|r
    .complete 29787,1 --1/1 Guardian of the Elders slain
	.timer 19,Worthy of Passing RP
	.target Guardian of the Elders
step
    .goto 378,19.45,51.22
	>>等待 RP
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Shang Xi|r
    .turnin 29787 >>交任务: |cRXP_FRIENDLY_传承的价值|r
    .accept 29788 >>接任务: |cRXP_WARN_不受欢迎的生灵|r
    .accept 29789 >>接任务: |cRXP_WARN_积跬步，致千里|r
	.target Master Shang Xi
step
    .goto 378,18.84,51.88,15,0
    .goto 378,18.43,49.88,15,0
    .goto 378,18.37,48.13,15,0
    .goto 378,21.57,49.29,15,0
    .goto 378,22.50,48.95,15,0
    .goto 378,24.22,45.72,30,0
    .goto 378,18.18,44.52,30,0
    .goto 378,24.22,45.72,30,0
    .goto 378,18.18,44.52
	>>杀死 |cRXP_ENEMY_Thornbranch Scamps|r 并掠夺挂在树上的 |cRXP_PICK_Charms|r。
    .complete 29788,1 --8/8 Thornbranch Scamp slain
    .complete 29789,1 --8/8 Kun-Pai Ritual Charm
	.target Thornbranch Scamp
step
    .goto 378,19.46,51.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Shang Xi|r
    .turnin 29788 >>交任务: |cRXP_FRIENDLY_不受欢迎的生灵|r
    .turnin 29789 >>交任务: |cRXP_FRIENDLY_积跬步，致千里|r
    .accept 29790 >>接任务: |cRXP_WARN_智慧传承|r
	.timer 83,Passing Wisdom RP
	.target Master Shang Xi
step
	#completewith next
	.cast 108034 >>吃掉|T571818:0|t[小甘蔗茎] 10 秒可获得增益
    .use 77272
	.itemcount 77272,1
step
    .goto 378,17.29,50.78
    >>|cRXP_WARN_在箭头位置等待 RP|r
    .complete 29790,1 --1/1 Listen to Master Shang Xi
step
    .goto 378,15.79,49.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger|r
    .turnin 29790 >>交任务: |cRXP_FRIENDLY_智慧传承|r
    .accept 29791 >>接任务: |cRXP_WARN_神真子的苦难|r
	.target Aysa Cloudsinger
step
    .goto 378,15.55,48.91
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_Air Balloon|r 登上它
    .complete 29791,1 --1/1 Board the Hot Air Balloon
	.timer 191,The Suffering of Shen-zin Su RP
step
    .goto 378,30.8,92.9
	>>|cRXP_WARN_等待 RP|r
    .complete 29791,2 --1/1 Uncover the source of Shen-zin Su's pain
step
    .goto 378,51.31,48.28
    >>从气球上掉下来时，脱离到东北方向的楼梯以节省时间 << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shaopai|r
    .turnin 29791 >>交任务: |cRXP_FRIENDLY_神真子的苦难|r
    .accept 29792 >>接任务: |cRXP_WARN_通往卓越|r
	.target Elder Shaopai
step
    .goto 378,51.60,61.39
    >>跑到大门打开它。等待 RP
    .complete 29792,1 --1/1 Open the Mandori Village Gate
step
	#completewith next
    .goto 378,50.66,65.62,20,0
    .goto 378,52.28,68.43,30 >>旅行 |cFFfa9602前往北武门|r
	.timer 28,Pei-Wu Gate RP
step
    .goto 378,52.28,68.43
    >>跑到大门打开它。等待 RP
    .complete 29792,2 --1/1 Open the Pei-Wu Forest Gate
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wei|r and |cRXP_FRIENDLY_Korga|r
    .turnin 29792 >>交任务: |cRXP_FRIENDLY_通往卓越|r
    .accept 30591 >>接任务: |cRXP_LOOT_猎杀狼群|r
    .goto 378,50.07,76.63
    .accept 29795 >>接任务: |cRXP_WARN_储备竹竿|r
    .goto 378,50.22,76.65
	.target Wei Palerage
	.target Korga Strongmane
step
    .goto 378,50.62,78.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Provisioner Drog|r
    .vendor 67186 >>卖掉垃圾并进行修理
	.target Provisioner Drog
	.isOnQuest 29795
step
#loop
	.line 378,54.51,85.54,45.05,85.81,45.89,71.57,55.62,69.49,54.51,85.54
	.goto 378,54.51,85.54,40,0
	.goto 378,45.05,85.81,40,0
	.goto 378,45.89,71.57,40,0
	.goto 378,55.62,69.49,40,0
	.goto 378,54.51,85.54,40,0
    >>杀死 |cRXP_ENEMY_Pei-Wu Tigers|r。拾取地面上的 |cRXP_PICK_竹竿|r |cFFfa9602。|r
    .complete 30591,1 --9/9 Pei-Wu Tiger slain
    .complete 29795,1 --10/10 Broken Bamboo Stalk
	.mob Pei-Wu Tiger
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wei|r and |cRXP_FRIENDLY_Korga|r
    .turnin 30591 >>交任务: |cRXP_FRIENDLY_猎杀狼群|r
    .goto 378,50.07,76.63
    .turnin 29795 >>交任务: |cRXP_FRIENDLY_储备竹竿|r
    .accept 30589 >>接任务: |cRXP_WARN_炸毁残骸|r
    .goto 378,50.22,76.65
	.target Wei Palerage
	.target Korga Strongmane
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Makael|r and |cRXP_FRIENDLY_Ji|r
    .turnin 30589 >>交任务: |cRXP_FRIENDLY_炸毁残骸|r
    .accept 30590 >>接任务: |cRXP_LOOT_小心运送|r
    .goto 378,36.32,72.36
    .accept 29793 >>接任务: |cRXP_WARN_海中的邪恶|r
    .goto 378,36.37,72.53
	.target Makael Bay
	.target Ji Firepaw
step
    .goto 378,36.06,76.73,40,0
    .goto 378,35.41,79.00,40,0
    .goto 378,40.14,78.79,40,0
    .goto 378,38.29,74.01,40,0
    .goto 378,36.06,76.73,40,0
    .goto 378,35.41,79.00,40,0
    .goto 378,40.14,78.79,40,0
    .goto 378,38.29,74.01
    >>杀死 |cRXP_ENEMY_Darkened Horrors|r 和 |cRXP_ENEMY_Terrors|r。|cRXP_WARN_小心恐怖的暗影喷泉|r
	>>抢夺地面上的爆炸物
    .complete 29793,1 --8/8 Darkened Horrors or Darkened Terrors slain
    .complete 30590,1 --6/6 Packed Explosion Charge
	.mob Darkened Horror
	.mob Darkened Terror
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Makael Bay|r and |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 30590 >>交任务: |cRXP_FRIENDLY_小心运送|r
    .goto 378,36.32,72.36
    .turnin 29793 >>交任务: |cRXP_FRIENDLY_海中的邪恶|r
    .accept 29796 >>接任务: |cRXP_WARN_紧急消息|r
    .goto 378,36.37,72.53
	.target Makael Bay
	.target Ji Firepaw
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delora Lionheart|r and |cRXP_FRIENDLY_Jojo Ironbrow|r
    .turnin 29796 >>交任务: |cRXP_FRIENDLY_紧急消息|r
    .accept 29794 >>接任务: |cRXP_WARN_一个都不能少|r
    .accept 29797 >>接任务: |cRXP_WARN_医疗物资|r
    .goto 378,42.21,86.54
    .accept 29665 >>接任务: |cRXP_WARN_越来越糟|r
    .goto 378,42.30,86.35
	.target Delora Lionheart
	.target Jojo Ironbrow
step
	#completewith Sailor2
    >>杀死 |cRXP_ENEMY_Deepscale Tormentors|r。拾取地面上的 |cRXP_PICK_Medical Supplies|r
    .complete 29665,1 --8/8 Deepscale Tormentor slain
    .complete 29797,1 --8/8 Alliance Medical Supplies
	.mob Deepscale Tormentor
step
    #optional
	#completewith next
    .goto 378,40.18,87.69
	.cast 56685 >>拿起|cRXP_FRIENDLY_受伤的水手|r
	.isOnQuest 29794
	.target Injured Sailor
--XXZ Zarant Function
step
    #optional
    .goto 378,42.27,86.80
    >>将 |cRXP_FRIENDLY_受伤的水手|r 抬回 |cRXP_FRIENDLY_Delora|r 的营地
    .complete 29794,1,1 --3/3 Injured Sailors rescued
step
    #optional
	#completewith next
    .goto 378,39.41,87.98
	.cast 56685 >>拿起|cRXP_FRIENDLY_受伤的水手|r
	.isOnQuest 29794
	.target Injured Sailor
step
    #optional
	#label Sailor2
    .goto 378,42.27,86.80
    >>将 |cRXP_FRIENDLY_受伤的水手|r 抬回 |cRXP_FRIENDLY_Delora|r 的营地
    .complete 29794,1,2 --3/3 Injured Sailors rescued
step
    #optional
    .goto 378,38.36,87.60,20,0
    .goto 378,37.04,87.93,20,0
    .goto 378,35.77,86.77,20,0
    .goto 378,36.40,83.30,20,0
    .goto 378,37.92,81.39,20,0
    .goto 378,37.86,83.22,20,0
    .goto 378,36.41,85.51,10,0
    .goto 378,36.82,89.24,20,0
    .goto 378,38.36,87.60,20,0
    .goto 378,37.04,87.93,20,0
    .goto 378,35.77,86.77,20,0
    .goto 378,36.40,83.30,20,0
    .goto 378,37.92,81.39,20,0
    .goto 378,37.86,83.22,20,0
    .goto 378,36.41,85.51,10,0
    .goto 378,36.82,89.24
	>>|cRXP_WARN_暂时不要选择新的水手|r
    >>杀死 |cRXP_ENEMY_Deepscale Tormentors|r。拾取地面上的 |cRXP_PICK_Medical Supplies|r
    .complete 29665,1 --8/8 Deepscale Tormentor slain
    .complete 29797,1 --8/8 Alliance Medical Supplies
	.mob Deepscale Tormentor
step
	#completewith next
    .goto 378,38.36,87.43,-1
    .goto 378,37.66,87.22,-1
    .goto 378,36.17,87.63,-1
    .goto 378,35.49,83.80,-1
    .goto 378,37.60,81.44,-1
    .goto 378,38.41,83.09,-1
    .goto 378,38.08,84.73,-1
    .goto 378,40.01,84.36,-1
	.cast 56685 >>拿起|cRXP_FRIENDLY_受伤的水手|r
	.isOnQuest 29794
	.target Injured Sailor
step
    .goto 378,42.27,86.80
    >>将 |cRXP_FRIENDLY_Injured Sailor|r 抬回 |cRXP_FRIENDLY_Delora Lionheart|r 的营地
    .complete 29794,1 --3/3 Injured Sailors rescued
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delora Lionheart|r and |cRXP_FRIENDLY_Jojo Ironbrow|r
    .turnin 29794 >>交任务: |cRXP_FRIENDLY_一个都不能少|r
    .turnin 29797 >>交任务: |cRXP_FRIENDLY_医疗物资|r
    .goto 378,42.21,86.54
    .turnin 29665 >>交任务: |cRXP_FRIENDLY_越来越糟|r
    .accept 29798 >>接任务: |cRXP_WARN_远古的邪恶|r
    .goto 378,42.30,86.35
	.target Delora Lionheart
	.target Jojo Ironbrow
step
    .goto 378,36.50,84.23
    >>杀死 |cRXP_ENEMY_Vordraka，深海梦魇|r
    >>|cRXP_WARN_躲避他的深海猛击|r。在 |cRXP_ENEMY_深鳞侵略者|r 出现时将其击杀。
    .complete 29798,1 --1/1 Vordraka, the Deep Sea Nightmare slain
	.mob Vordraka, The Deep Sea Nightmare
    .mob Deepscale Aggressor
step
    .goto 378,36.50,84.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger|r
    .turnin 29798 >>交任务: |cRXP_FRIENDLY_远古的邪恶|r
    .accept 30767 >>接任务: |cRXP_WARN_孤注一掷|r
    .timer 77,Risking It All RP
	.target Aysa Cloudsinger
	.skipgossip
step
    .goto 378,36.35,86.08,10,0 << skip
    .goto 378,36.27,86.99,10,0 << skip
    .goto 378,36.90,85.50,5,0 << skip
    .goto 378,36.36,87.2,10,0 << skip
    .goto 378,36.38,87.12 << skip
    >>等待 RP（此时你可以休息一下）
	>>|cRXP_WARN_按键盘上的“Esc”键跳过电影|r
    .complete 30767,1 --1/1 Shen-zin Su's Thorn Removed
step
    .goto 378,39.30,86.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 30767 >>交任务: |cRXP_FRIENDLY_孤注一掷|r
    .accept 29799 >>接任务: |cRXP_WARN_治疗神真子|r
	.target Ji Firepaw
step
    .goto 378,39.08,88.32,5,0
    .goto 378,39.04,88.87,5,0
    .goto 378,39.89,88.62,5,0
    .goto 378,42.92,87.31,5,0
    .goto 378,42.85,85.16,5,0
    .goto 378,42.01,84.89,5,0
    .goto 378,42.31,83.89,5,0
    .goto 378,41.21,83.78,5,0
    .goto 378,40.55,82.45,5,0
    .goto 378,40.26,83.35,5,0
    .goto 378,40.12,84.37,5,0
    .goto 378,38.44,86.07
    >>从残骸中解救 |cRXP_FRIENDLY_Alliance Priests|r 和 |cRXP_FRIENDLY_Horde Druids|r，然后与他们交谈。如果他们攻击他们，则杀死 |cRXP_ENEMY_Dampscale Fleshrippers|r
    .complete 29799,1 --1/1 Protect the healers
	.target Alliance Priest
	.target Horde Druid
	.mob Dampscale Fleshripper
step
    .goto 378,39.30,86.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
	>>|cRXP_WARN_按下键盘上的“Esc”键即可跳过电影。|r
    .turnin 29799 >>交任务: |cRXP_FRIENDLY_治疗神真子|r
	.timer 18,The Healing of Shen-zin Su RP
	.target Ji Firepaw
step
    >>|cRXP_WARN_等待 RP|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .goto 378,38.77,86.32
    .accept 29800 >>接任务: |cRXP_WARN_新的盟友|r
	.target Ji Firepaw
step
    #completewith next
    .hs >>炉石 |cFFfa9602前往五黎明神殿。|r
step
    .goto 378,51.45,48.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Spirit of Shang Xi|r. Select your Faction
	>>|cRXP_WARN_按键盘上的“Esc”键跳过电影|r
    .turnin 29800 >>交任务: |cRXP_FRIENDLY_新的盟友|r
    .accept 31450 >>接任务: |cRXP_WARN_新的命运|r
    .complete 31450,1 --1/1 Choose your faction
    .skipgossip
	.target Spirit of Shang Xi
step << Alliance
    .goto 84,74.19,91.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger|r
    .turnin 31450 >>交任务: |cRXP_FRIENDLY_新的命运|r
	.accept 30987 >>接任务: |cRXP_WARN_加入联盟|r
	.target Aysa Cloudsinger
step << Alliance
    .goto 84,63.77,73.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷纳多·加林纳|r
    .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
    .target Renato Gallina
step << Alliance
    .goto 84,62.81,71.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_英雄传令官|r
    .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
    .target Hero's Herald
step << Alliance
    #veteran
	>>将下面的链接复制粘贴到聊天中，忘记你的职业
    .link /run AbandonSkill(186); AbandonSkill(182);>>点击这里
	.train 2366,1 >>忘记草药学
	.train 2575,1 >>忘记采矿
    .dmf
step
    #veteran
    .goto 84,61.11,70.6
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r 你需要从拍卖行购买 |cRXP_WARN_特定物品才能充分利用此活动。|r 如有必要，|cRXP_WARN_你可以从其他角色转移金币进行这些购买。|r 但是，如果你发现自己买不起所有东西，|cRXP_WARN_前往暗月马戏团获得临时经验值提升并只购买部分物品仍然是值得的。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Auctioneer|r
    .collect 71715,1
    .collect 71638,1
    .collect 71637,1
    .collect 71636,1
    .collect 71635,1
    .collect 71952,1
    .collect 71951,1
    .collect 71953,1
    .collect 71716,1
    .target Auctioneer Fitch
    .target Auctioneer Jaxon
    .target Auctioneer Chilton
    .dmf
step
    #fresh
    #completewith DarkMoonFaire
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r
step
    #completewith next
    .link /run AbandonSkill(186); AbandonSkill(182);>>|cRXP_WARN_单击此文本即可接收一个将忘记您的职业的宏。|r
    .dmf
step << Alliance
    #label DarkMoonFaire
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗月马戏团秘法师|r
    .goto 84,62.25,72.96
    .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
	.zone 407 >>前往暗月马戏团
	.target Darkmoon Faire Mystic Mage
	.skipgossip
    .dmf
step << Horde
    .dmf
	>>将下面的链接复制粘贴到聊天中，忘记你的职业
    .link /run AbandonSkill(186); AbandonSkill(182);>>点击这里
	.train 2366,1 >>忘记草药学
	.train 2575,1 >>忘记采矿
step << Horde
    .goto 1,45.58,12.61
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 31450 >>交任务: |cRXP_FRIENDLY_新的命运|r
    .accept 31012 >>接任务: |cRXP_WARN_加入部落|r
    .target Ji Firepaw
step << Horde
    #completewith next
    .goto 85,49.87,75.52,20 >>前往 |cFFfa9602格罗玛什要塞内部。|r
step << Horde
    .goto 85,48.76,70.77
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_加尔鲁什·地狱咆哮|r
    .turnin 31012 >>交任务: |cRXP_FRIENDLY_加入部落|r
    .target 加尔鲁什·地狱咆哮
]])
