local _,addon = ...
if addon.player.race ~= "Pandaren" then return end

RXPGuides.RegisterGuide([[
#mop
#version 1
#group RXP起始区域(熊猫人)
#name 1-12 流浪岛
#displayname 1-12 流浪岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next RestedXP 大地的裂变 1-80 (联盟)\10-20 洛丹伦；RestedXP 大地的裂变 1-80 (联盟)\10-22 阿兹沙拉；RXP 熊猫人之谜 1-80 (联盟)\10-20 洛丹伦；RestedXP 熊猫人之谜 1-80 (部落)\10-22 阿兹沙拉；跳过


<< Pandaren !DK

step
    .goto 378,56.67,18.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
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
    >>点击|cRXP_PICK_武器架|r获取|T537025:0|t[见习者的十字弓]
    .collect 73211,1 --Trainee's Crossbow (1)
step << Hunter
    .goto 378,57.22,19.22
    >>装备 |T537025:0|t[学徒十字弓]
    .complete 30034,1 --1/1 Loot and Equip a Trainee's Crossbow
    .use 73211 --Trainee's Crossbow
step << Mage
    .isOnQuest 30033
    .goto 378,57.22,19.22
    >>点击|cRXP_PICK_武器架|r获取 |T537771:0|t[学徒法刃] 和 |T654237:0|t[学徒扇].
    .collect 76390,1 --Trainee's Spellblade (1)
    .collect 76392,1, --Trainee's Hand Fan (1)
step << Mage
    .goto 378,57.22,19.22
    >>装备|T537771:0|t[学徒法术之刃]和|T654237:0|t[学徒扇].
    .complete 30033,1 --Loot and Equip a Trainee's Spellblade (1)
    .complete 30033,2 --Loot and Equip a Trainee's Hand Fan (1)
    .use 76390 --Trainee's Spellblade
    .use 76392 --Trainee's Hand Fan
step << Monk/Priest
    .isOnQuest 30027
    .goto 378,57.22,19.22
    >>点击|cRXP_PICK_武器架|r获取 |T537770:0|t[见习者法杖]
    .collect 73209,1 -Trainee's Staff (1)
step << Monk/Priest
    .goto 378,56.67,18.20
    >>装备 |T537770:0|t[学徒法杖]
    .complete 30027,1 --Loot and Equip a Trainee's Staff
    .use 73209
step << Shaman
    .isOnQuest 30037
    .goto 378,57.22,19.22
    >>点击|cRXP_PICK_武器架|r获取 |T537205:0|t[学徒之斧] 和 |T537769:0|t[学徒之盾]
    .collect 76391,1  --Trainee's Axe (1)
    .collect 73213,1 --Trainee's Shield (1)
step << Shaman
    .goto 378,57.22,19.22
    >>装备|T537205:0|t[学徒之斧]和|T537769:0|t[学徒之盾]
    .complete 30037,1 --Loot and Equip a Trainee's Axe
    .complete 30037,2 --Loot and Equip a Trainee's Shield
    .use 76391 --Trainee's Axe
    .use 73213 --Trainee's Shield
step << Warrior
    .isOnQuest 30038
    .goto 378,57.22,19.22
    >>点击|cRXP_PICK_武器架|r获取 |T537205:0|t[学徒之斧] 和 |T537769:0|t[学徒之盾]
    .collect 76391,1  --Trainee's Axe (1)
    .collect 73213,1  --Trainee's Shield (1)
step << Warrior
    .isOnQuest 30038
    .goto 378,57.22,19.22
    >>装备|T537205:0|t[学徒之斧]和|T537769:0|t[学徒之盾]
    .complete 30038,1 --Loot and Equip a Trainee's Axe
    .complete 30038,2 --Loot and Equip a Trainee's Shield
    .use 76391 --Trainee's Axe
    .use 73213 --Trainee's Shield
step << Rogue
    .isOnQuest 30036
    .goto 378,57.22,19.22
    >>点击|cRXP_PICK_武器架|r获取|T537767:0|t[学徒匕首]
    .collect 73208,1,30036,1,1 --Trainee's Dagger (ID 1)
    .collect 73212,1,30036,1,1 --Trainee's Dagger (ID 2)
step << Rogue
    .goto 378,57.22,19.22
    >>装备|T537767:0|t[学徒匕首]
    .complete 30036,1 --Loot and Equip a Trainee's Dagger
    .complete 30036,2 --Loot and Equip a Second Trainee's Dagger
    .use 73208 --Trainee's Dagger (ID 1)
    .use 73212 --Trainee's Dagger (ID 2)
step
    .goto 378,56.67,18.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
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
    >>击杀|cRXP_ENEMY_沙袋|r
    .complete 29406,1 --5/5 Training Targets destroyed
	.mob Training Target
step
    .goto 378,56.67,18.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29406 >>交任务: |cRXP_FRIENDLY_沙袋训练|r
    .accept 29524 >>接任务: |cRXP_WARN_戒骄|r
	.target Master Shang Xi
step
    #completewith next
    --#title |cFFFCDC00进入房屋|r
    .goto 378,59.57,19.05,10 >>进入房屋
step
    .goto 378,60.26,19.35
    >>击败|cRXP_ENEMY_Sparring Trainees|r
    *- |cRXP_WARN_There are more upstairs|r
    .complete 29524,1 --6/6 Sparring Trainees defeated
	.mob Tushui Trainee
	.mob Huojin Trainee
step
    .goto 378,59.67,19.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29524 >>交任务: |cRXP_FRIENDLY_戒骄|r
    .accept 29408 >>接任务: |cRXP_WARN_烧毁卷轴|r
	.target Master Shang Xi
step
    .isOnQuest 29408
    >>|cRXP_WARN_跟着箭头往楼上走|r
    .goto 378,59.97,18.58,8,0
    .goto 378,60.48,18.85,5,0
    .goto 378,60.20,18.89,5,0
    .goto 378,59.98,18.69,5,0
	.goto 378,60.46,19.60,8 >>|cRXP_WARN_T通过跳过第二组楼梯下方的缺口, 走捷径到达顶层|r
step
    .goto 378,59.95,20.39
    >>点击建筑物顶部的旗帜
    .complete 29408,2 --1/1 Burn the Edict of Temperance
step
	#completewith next
    --#title |cFFFCDC00跳下去|r
    .goto 378,60.19,19.35,6 >>|cRXP_WARN_跳下去|r
step
    .goto 378,59.67,19.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29408 >>交任务: |cRXP_FRIENDLY_烧毁卷轴|r
    .accept 29409 >>接任务: |cRXP_WARN_门徒的挑战|r
	.target Master Shang Xi
step
    .goto 378,67.78,22.75
    >>击败|cRXP_ENEMY_洛蛟明|r
    .complete 29409,1 --1/1 Defeat Jaomin Ro
	.mob Jaomin Ro
step << Warrior
	#completewith Lorvo
    +使用 |T132337:0|t充能对小动物施放, 使其移动更快
step
    .goto 378,65.97,22.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29409 >>交任务: |cRXP_FRIENDLY_门徒的挑战|r
    .accept 29410 >>接任务: |cRXP_WARN_土水派的艾莎|r
	.target Master Shang Xi
step
	#label Lorvo
    .goto 378,55.09,32.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_商人罗福|r交谈
    .turnin 29410 >>交任务: |cRXP_FRIENDLY_土水派的艾莎|r
    .accept 29419 >>接任务: |cRXP_WARN_失踪的车夫|r
    .accept 29424 >>接任务: |cRXP_WARN_至关重要的物品|r
	.target Merchant Lorvo
step
    #completewith next
    >>击杀|cRXP_ENEMY_珀叶精怪|r. 击败后可获得 |T132622:0|t[|cRXP_LOOT_被偷的训练物资|r]
    .complete 29424,1 --6/6 Stolen Training Supplies
	.mob Amberleaf Scamp
step
    .goto 378,54.11,20.90
    --#title |cFFFCDC00跟随箭头指引 to |cFF00FF25Min Dimwind|r|r
    >>|cRXP_WARN_跟随箭头|r
    .complete 29419,1 --1/1 Rescue the Cart Driver
	.target Min Dimwind
step
    #loop
    .goto 378,54.03,20.93,15,0
    .goto 378,54.02,17.44,15,0
    .goto 378,53.00,20.17,15,0
    .goto 378,52.89,24.41,20,0
    .goto 378,55.04,24.93,20,0
    .goto 378,53.08,31.58,20,0
    >>击杀|r珀叶精怪|r并从它们身上搜刮出|r|T132622:0|t[|cRXP_LOOT_补给|r]
    .complete 29424,1 --6/6 Stolen Training Supplies
	.target Amberleaf Scamp
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_商人罗福|r和|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 29419,2 >>交任务: |cRXP_FRIENDLY_失踪的车夫|r
    .turnin 29424 >>交任务: |cRXP_FRIENDLY_至关重要的物品|r
    .goto 378,55.11,32.40
    .accept 29414 >>接任务: |cRXP_WARN_土水之道|r
    .goto 378,55.10,32.55
	.target Merchant Lorvo
	.target Aysa Cloudsinger
step
	#completewith next
    --#title |cFFFCDC00进入洞窟|r
    .goto 378,57.21,31.04,30,0
    .goto 378,57.63,35.20,10 >>进入|r
	.timer 87,Cave RP
step
    .goto 378,57.89,36.55
    >>保护|cRXP_FRIENDLY_Aysa|r不受即将到来的|cRXP_ENEMY_珀叶捣蛋鬼|r的攻击
    .complete 29414,1 --1/1 Protect Aysa while she meditates
	.mob Amberleaf Troublemaker
--step
--    #title Advanced
--    .isOnQuest 29414
--    >>|cFFFF0000试试找出|r
--    .goto 378,57.52,34.59,5 >>|cRXP_WARN_ 待在入口附近更快, 但更危险|r.
step
    .goto 378,57.54,34.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29414 >>交任务: |cRXP_FRIENDLY_土水之道|r
    .accept 29522 >>接任务: |cRXP_WARN_火金派的季|r
	.target Master Shang Xi
step
    .goto 378,50.24,21.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29522 >>交任务: |cRXP_FRIENDLY_火金派的季|r
    .accept 29417 >>接任务: |cRXP_WARN_火金之道|r
	.target Ji Firepaw
step
    #loop
    .goto 378,51.18,17.71,30,0
    .goto 378,49.56,18.31,30,0
    .goto 378,49.49,20.13,30,0
    .goto 378,49.23,24.48,30,0
    .goto 378,49.90,23.37,30,0
    .goto 378,46.12,20.46,30,0
    >>击杀|cRXP_ENEMY_猢狲|r
    .complete 29417,1 --8/8 Fe-Feng attackers slain
	.mob Fe-Feng Hozen
    .mob Fe-Feng Brewthief
    .mob Fe-Feng Leaper
step
    .goto 378,50.24,21.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29417 >>交任务: |cRXP_FRIENDLY_火金之道|r
    .accept 29418 >>接任务: |cRXP_WARN_点火|r
    .accept 29523 >>接任务: |cRXP_WARN_煽风|r
	.target Ji Firepaw
step << skip
    .isOnQuest 29523
    #completewith Fluttering Breeze
    +|cRXP_WARN_要为任务物品启用快捷键绑定, 请按照以下步骤操作:|r
    *[1] Press the |cRXP_WARN_Escape key|r.
    *[2] Select |cRXP_WARN_Options|r.
    *[3] Navigate to |cRXP_WARN_Keybindings|r.
    *[4] Within |cRXP_WARN_Keybindings|r,find |cRXP_WARN_RestedXP Guides|r.
    *[5] Select and bind the |cRXP_WARN_Active Buttons|r.
step
#optional
    #completewith next
	>>拾取地面上靠近树木的松散山茱萸根|r
    .complete 29418,1 --5/5 Dry Dogwood Root
step
    .goto 378,47.24,31.32
	>>使用位于祭坛处的 |T519378:0|t[风之石]|cRXP_WARN_召唤|r一个|cRXP_ENEMY_活体之气|r
    >>击杀它并拾取 |T463565:0|t[|cRXP_LOOT_颤动的微风|r]
    .complete 29523,1 --1/1 Fluttering Breeze
    .use 72109
	.mob Living Air
step
    #loop
    .goto 378,47.98,31.97,10,0
    .goto 378,46.07,27.94,10,0
    .goto 378,48.99,30.16,10,0
    .goto 378,46.83,34.88,10,0
    .goto 378,46.04,33.12,10,0
    .goto 378,46.17,27.09,10,0
    .goto 378,48.31,29.58,10,0
    .goto 378,50.06,31.41,10,0
    .goto 378,48.90,33.14,10,0
    .goto 378,49.58,36.46,10,0
    .goto 378,46.86,35.05,10,0
    .goto 378,46.01,33.12,10,0
    >>拾取地面上靠近树木的松散山茱萸根|r
    .complete 29418,1 --5/5 Dry Dogwood Root
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r和|cRXP_FRIENDLY_尚熙|r交谈
    .turnin 29418 >>交任务: |cRXP_FRIENDLY_点火|r
    .turnin 29523 >>交任务: |cRXP_FRIENDLY_煽风|r
    .goto 378,50.24,21.26
    .accept 29420 >>接任务: |cRXP_WARN_元素之灵守护者|r
    .goto 378,50.29,21.47
	.target Ji Firepaw
	.target Master Shang Xi
step
   --#title |cFFFCDC00进入洞窟|r
    .goto 378,41.09,24.83,10 >>进入|r
    .isOnQuest 29420
step
    .goto 378,40.75,23.86,10,0
    .goto 378,40.84,22.19,10,0
    .goto 378,40,22.77,10,0
    .goto 378,38.81,25.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_WARN_避开喷火的间歇泉|r. 与|cRXP_FRIENDLY_李飞大师|r交谈
    .turnin 29420 >>交任务: |cRXP_FRIENDLY_元素之灵守护者|r
    .accept 29664 >>接任务: |cRXP_WARN_挑战者之火|r
	.target Master Li Fei
 step
    >>点击|cRXP_PICK_火盆|r
    .complete 29664,1 --1/1 Challenger Torch lit
    .goto 378,38.71,25.39
    .complete 29664,4 --1/1 Violet Brazier lit
    .goto 378,38.25,24.87
    .complete 29664,2 --1/1 Red Brazier lit
    .goto 378,38.99,23.50
    .complete 29664,3 --1/1 Blue Brazier lit
    .goto 378,39.19,25.41
step
    .goto 378,38.81,25.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_李飞大师|r交谈
    .turnin 29664 >>交任务: |cRXP_FRIENDLY_挑战者之火|r
    .accept 29421 >>接任务: |cRXP_WARN_胜者方能通行|r
	.target Master Li Fei
step
    .goto 378,38.81,25.50
    >>击败|cRXP_ENEMY_李飞大师|r|cRXP_WARN_通过将他的生命值降至20%. |r
    .complete 29421,1 --1/1 Defeat Master Li Fei
	.mob Master Li Fei
step
    .goto 378,38.81,25.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_李飞大师|r交谈
    .turnin 29421,2 >>交任务: |cRXP_FRIENDLY_胜者方能通行|r
    .accept 29422 >>接任务: |cRXP_WARN_上古火灵燧焰|r
	.target Master Li Fei
step
    #completewith next
    #label ReigniteSpiritOfFire
    >>|cRXP_WARN_等待短暂的角色扮演环节, 当计时器归零时将自动完成|r
    .complete 29422,1 --1/1 Reignite the Spirit of Fire
    .use 72583
    .target Huo
step
	#completewith next
    --#title |cFFFCDC00跑上坡道.|r Use |T133662:0|t[Huo's Offerings]
    .goto 378,39.41,29.55
	.cast 102522 >>使用|T133662:0|t[火之献祭]对|cRXP_FRIENDLY_燧焰|r使用
	.timer 11, Huo the Spirit of Fire RP
	.use 72583
    .target Huo
    .isOnQuest 29420
step
    #requires ReigniteSpiritOfFire
    .goto 378,39.41,29.55
    >>|cRXP_WARN_等待短暂的角色扮演环节, 当计时器归零时将自动完成|r
    .complete 29422,1 --1/1 Reignite the Spirit of Fire
    .use 72583
    .target Huo
step
    .goto 378,39.41,29.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_燧焰|r交谈
    .turnin 29422 >>交任务: |cRXP_FRIENDLY_上古火灵燧焰|r
    .accept 29423 >>接任务: |cRXP_WARN_神真子的热情|r
	.target Huo
step
    --#title |cFFFCDC00离开洞穴|r
    .goto 378,40.12,25.50,20,0
    .goto 378,41.48,25.05,20,0
    .goto 378,42.0,25.29
    .subzone 5849,1 >>离开洞穴
step
	#completewith next
    --#title |cFFFCDC00跟随箭头指引|r
    .goto 378,51.04,30.62,20,0
    .goto 378,51.89,35.93,20,0
    .goto 378,50.12,38.94,15,0
    .goto 378,50.32,37.48,20,0
    .goto 378,51.58,40.46
    .subzone 5820 >>前往|cRXP_WARN_五 dawn神殿|r
step
    .goto 378,51.41,46.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29423 >>交任务: |cRXP_FRIENDLY_神真子的热情|r
    .accept 29521 >>接任务: |cRXP_WARN_咏之池|r
	.target Master Shang Xi
step
    .isOnQuest 29521
    .goto 378,51.83,46.08
    .home >>将炉石设置为|cRXP_WARN_五 dawn's Temple|r
	.target Cheng Dawnscrive
step
    .isOnQuest 29521
    .goto 378,53.22,47.45,10,0
    .goto 378,57.12,46.63,10,0
    .goto 378,63.12,41.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_木艺师大伟|r谈话
    .train 2366 >>学习草药学
    .target Whittler Dewei

    .skipgossipid 112959
    .skipgossipid 130364
    .skipgossipid 112911
step
    .isOnQuest 29521
    .goto 378,63.12,41.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_木艺师大伟|r谈话
    .train 2575 >>学习采矿
	.target Whittler Dewei
    .skipgossipid 130364
    .skipgossipid 112912
    .skipgossipid 112975

step
    .goto 378,63.50,41.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔乔·铁眉|r交谈
    .accept 29662 >>接任务: |cRXP_WARN_比芦苇更硬|r
	.target Jojo Ironbrow
step
    #completewith JumpOnPole
    +|cRXP_WARN_采矿/草药学节点在本资料片中提供1个怪物等级的经验值, 请记得采集附近的节点. 无论你的专业技能高低, 都可以采集所有类型的节点|r
step
    #completewith next
    +|cRXP_WARN_在这个区域, 某些水域会让你变成动物形态, 大幅提升移动速度|r
step
    .goto 378,65.59,42.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 29521 >>交任务: |cRXP_FRIENDLY_咏之池|r
    .accept 29661 >>接任务: |cRXP_WARN_戒躁|r
    .accept 29663 >>接任务: |cRXP_WARN_平衡训练|r
	.target Aysa Cloudsinger

step
    #completewith RingTrainingBell
	>>击败杆子上的土水派武僧
    .complete 29663,1 --6/6 Defeat Tushui Monks
	.mob Tushui Monk
step
    .isOnQuest 29663
    .isQuestNotComplete 29663
    #label JumpOnPole
    .goto 378,63.37,45.17
	.vehicle >>点击一个|cRXP_PICK_梅花桩|r|cRXP_WARN_当你不在水中或你是青蛙时|r
step
    #label RingTrainingBell
    .goto 378,61.41,47.81
    >>|cRXP_WARN_点击|cRXP_PICK_梅花桩|r跳向|cRXP_PICK_习武大钟|r|r
    >>点击|cRXP_PICK_习武大钟|r
    .complete 29661,1 --1/1 Ring the Training Bell
step
    #completewith next
    >>点击|cRXP_PICK_结实的泪木芦苇|r
    .complete 29662,1 --8/8 Hard Tearwood Reed
step
    #loop
    .goto 378,63.22,45.17,20,0
    .goto 378,62.25,50,15,0
    .goto 378,60.43,48.97,15,0
    .goto 378,62.22,44.33,15,0
	>>击败杆子上的土水派武僧
    .complete 29663,1 --6/6 Defeat Tushui Monks
	.mob Tushui Monk
step
    #completewith next
    --#title |cFFFCDC00离开载具|r
    .exitvehicle >>|cRXP_WARN_离开载具|r
step
    #loop
    .goto 378,62.85,49.06,20,0
    .goto 378,60.53,49.31,20,0
    .goto 378,60.82,45.70,20,0
    .goto 378,63.15,44.17,20,0
    >>点击|cRXP_PICK_结实的泪木芦苇|r
    *|cRXP_WARN_If you stay at the edge then the |cRXP_ENEMY_Whitefeather Cranes|r won't attack you.|r
    .complete 29662,1 --8/8 Hard Tearwood Reed
step
    .goto 378,63.50,41.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔乔·铁眉|r交谈
    .turnin 29662 >>交任务: |cRXP_FRIENDLY_比芦苇更硬|r
	.target Jojo Ironbrow
step
    .goto 378,65.59,42.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 29661 >>交任务: |cRXP_FRIENDLY_戒躁|r
    .turnin 29663 >>交任务: |cRXP_FRIENDLY_平衡训练|r
    .accept 29676 >>接任务: |cRXP_WARN_寻找老朋友|r
	.target Aysa Cloudsinger
step
    #completewith next
    +|cRXP_WARN_在此区域, 紫色水潭会使你变形为动物形态, 提升移动速度|r
step
    .goto 378,72.15,37.88,13,0
    .goto 378,70.62,38.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梁老先生|r谈话
    .turnin 29676 >>交任务: |cRXP_FRIENDLY_寻找老朋友|r
    .accept 29666 >>接任务: |cRXP_WARN_吃一蛰，长一智|r
    .accept 29677 >>接任务: |cRXP_WARN_炎阳珠|r
	.target Old Man Liang
step
    #loop
    .goto 378,74.94,38.46,30,0
    .goto 378,72.21,46.53,30,0
    .goto 378,71.47,52.26,30,0
    >>击杀|r水钳虫|cRXP_ENEMY_Water Pincers|r
    .complete 29666,1 --6/6 Water Pincer slain
    .mob Water Pincer
step
    .goto 378,76.21,46.87
    >>点击|cRXP_PICK_远古蛤蜊|r|cRXP_WARN_水下|r
    >>|cRXP_WARN_你不需要杀死|r|cRXP_ENEMY_盘蛇|r
    .complete 29677,1 --1/1 Sun Pearl
    .mob Fang-she
step
    .goto 378,78.47,42.85
    .goto 378,70.62,38.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梁老先生|r谈话
    >>|cRXP_WARN_如果因为某些原因找不到任务发布者, 请回到他西边的家中|r
    .turnin 29666 >>交任务: |cRXP_FRIENDLY_吃一蛰，长一智|r
    .turnin 29677 >>交任务: |cRXP_FRIENDLY_炎阳珠|r
    .accept 29678 >>接任务: |cRXP_WARN_上古水灵涓流|r
	.target Old Man Liang
step
	.isOnQuest 29678
    .goto 378,79.66,41.83,4,0
    .goto 378,79.61,38.72
    >>|cRXP_WARN_站在发光的圆圈上|r. 这样就能跳向|cRXP_WARN_水池|r
    .complete 29678,1 --1/1 Cross to the Pool of Reflection
step
    .goto 378,79.59,38.58
    >>使用|T463854:0|t[炎阳珠]在|cRXP_WARN_water's surface|r的水面上
    .complete 29678,2 --1/1 Coax Shu, the Water Spirit
    .use 73791
step
    .goto 378,79.82,39.31
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29678 >>交任务: |cRXP_FRIENDLY_上古水灵涓流|r
step
    .goto 378,79.82,39.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .accept 29679 >>接任务: |cRXP_WARN_新朋友|r
	.target Aysa Cloudsinger
step
    .goto 378,79.11,37.77
    >>跟随|cRXP_FRIENDLY_涓流|r, 注意他的移动. |cRXP_WARN_请站在他旁边喷水区域的上方|r
    .complete 29679,1 --5/5 Play with the Spirit of Water
	.target Shu
step
    .goto 378,79.82,39.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 29679 >>交任务: |cRXP_FRIENDLY_新朋友|r
    .accept 29680 >>接任务: |cRXP_WARN_生计来源|r
	.target Aysa Cloudsinger
step
    .goto 378,76.57,57.36,40,0
    .goto 378,68.89,64.98
	>>|cRXP_WARN_牛车|r比手动跑动慢|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29680 >>交任务: |cRXP_FRIENDLY_生计来源|r
    .accept 29769 >>接任务: |cRXP_WARN_小无赖|r
    .target Ji Firepaw
step
    .goto 378,68.13,66.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高·夏酒|r交谈
    .accept 29770 >>接任务: |cRXP_WARN_还能吃！|r
	.target Gao Summerdraft
step
	#completewith Carrots
    >>击杀|cRXP_ENEMY_肥胖的兔妖|r
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
    >>点击|cRXP_PICK_Turnips|r
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
    >>点击|cRXP_PICK_南瓜|r
    .complete 29770,3 --3/3 Pilfered Pumpkin
step
	.isOnQuest 29770
    .goto 378,77.05,71.02,10 >>进入|cRXP_WARN_洞穴|r
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
    >>击杀|cRXP_ENEMY_Plump Carrotcatchers|r并从他们身上搜刮 [|cRXP_LOOT_Carrots|r]. 你也可以点击地面上的|cRXP_PICK_Carrots|r]
    .complete 29770,2 --3/3 Stolen Carrot
	.mob Plump Carrotcatcher
step
	.isOnQuest 29770
    .goto 378,74.99,69.42,10 >>离开|cRXP_WARN_洞穴|r
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
    >>击杀|cRXP_ENEMY_肥胖的兔妖|r
    .complete 29769,1 --10/10 Plump Virmen slain
	.mob Plump Virmen
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高·夏酒|r和|cRXP_FRIENDLY_季·火掌|r和|cRXP_FRIENDLY_乔乔·铁眉|r交谈
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
	>>点击 |cRXP_PICK_木板|r
    .complete 29771,1 --12/12 Discarded Wood Plank
step
    .goto 378,62.63,77.05
	>>点击桶上的 |cRXP_PICK_Mallet|r
    >>|cRXP_WARN_你不必杀死|cRXP_ENEMY_拉吉斯|r. 如果可以的话, 尽量避免击杀|r
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
	>>点击地面上的|cRXP_PICK_木板|r
    .complete 29771,1 --12/12 Discarded Wood Plank
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔乔·铁眉|r和|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29771 >>交任务: |cRXP_FRIENDLY_比木头更硬|r
    .goto 378,69.16,66.71
    .turnin 29768 >>交任务: |cRXP_FRIENDLY_丢失的槌子|r
    .accept 29772 >>接任务: |cRXP_WARN_锣声震天|r
	.goto 378,68.89,64.98
    .target Jojo Ironbrow
    .target Ji Firepaw
step
    .goto 378,68.95,64.80
    >>点击|cRXP_PICK_铜锣|r
    .complete 29772,1 --1/1 Ring the town gong
step
    .goto 378,68.89,64.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29772 >>交任务: |cRXP_FRIENDLY_锣声震天|r
    .accept 29774 >>接任务: |cRXP_WARN_别泼脸！|r
	.target Ji Firepaw
step
    .goto 378,68.98,62.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_涓流|r交谈
    .complete 29774,1 --1/1 Ask Shu for help
	.timer 15,Roleplay
	.target Shu
    .skipgossipid 39250
step
    .goto 378,68.89,64.98
    >>|cRXP_WARN_等待短暂的角色扮演环节, 当计时器归零时将自动完成|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29774 >>交任务: |cRXP_FRIENDLY_别泼脸！|r
    .accept 29775 >>接任务: |cRXP_WARN_神真子的灵魂和躯体|r
	.target Ji Firepaw
step
	.isOnQuest 29775
    .goto 378,58.86,63.38,40,0
    .goto 378,55.23,58.57,40,0
    .goto 378,51.48,57.40,20 >>前往五 dawn 之庙
	>>|cRXP_WARN_|cRXP_PICK_牛车|r比手动跑动更慢|r
    .subzoneskip 5820--temple of five dawns
step
    .goto 378,51.59,48.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29775 >>交任务: |cRXP_FRIENDLY_神真子的灵魂和躯体|r
    .accept 29776 >>接任务: |cRXP_WARN_晨息村|r
	.timer 20,Morning Breeze Village RP
	.target Master Shang Xi
step
    .isOnQuest 29776
    .goto 378,51.46,48.93,7 >>|cRXP_WARN_等待短暂的角色扮演环节, 当计时器归零时将自动完成|r
step
    #completewith next
    .subzoneskip 5830
	.isOnQuest 29776
    .goto 378,51.01,49.05,10,0
    .goto 378,40.19,50.79,20,0
    .goto 378,34.91,50.73,15,0
    .goto 378,33.1,42.6,15,0
    .goto 378,30.42,37.50,20 >>前往|cRXP_WARN_晨息村|r
step
    .goto 378,30.97,36.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29776 >>交任务: |cRXP_FRIENDLY_晨息村|r
    .accept 29778 >>接任务: |cRXP_WARN_重写智慧|r
	.target Ji Firepaw
step
    .goto 378,29.90,39.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔乔·铁眉|r交谈
    .accept 29783 >>接任务: |cRXP_WARN_比石头更硬|r
	.target Jojo Ironbrow
step
    .goto 378,31.78,39.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邵白长老|r交谈
    .accept 29777 >>接任务: |cRXP_WARN_作案工具|r
	.target Elder Shaopai
step
    .isOnQuest 29777
    #completewith Defaced Scroll of Wisdom burned
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沈·石锲|r交谈
    .vendor >>|cRXP_WARN_ 如果需要, 请出售和修理|r
    .target Shen Stonecarver
step
    #completewith Defaced Scroll of Wisdom burned
    >>击杀|r|cRXP_ENEMY_狒狒村智者|r并从他们身上搜刮出[|cRXP_LOOT_刷子|r]
    .complete 29777,1 --8/8 Paint Soaked Brush
	.mob Fe-Feng Wiseman
step
    #completewith Defaced Scroll of Wisdom burned
    >>点击|cRXP_PICK_石块|r
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
    >>点击纪念碑上的旗帜
    .complete 29778,1 --5/5 Defaced Scroll of Wisdom burned
step
    #completewith next
    >>击杀|r|cRXP_ENEMY_狒狒村智者|r并从他们身上搜刮出[|cRXP_LOOT_刷子|r]
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
    >>点击|cRXP_PICK_石块|r
    .complete 29783,1 --12/12 Abandoned Stone Block
step
#loop
	.line 378,31.18,47.9,32.57,46.43,33.99,50.9,32.16,50.53,31.32,52.22
	.goto 378,31.18,47.90,15,0
	.goto 378,32.57,46.43,15,0
	.goto 378,33.99,50.90,15,0
	.goto 378,32.16,50.53,15,0
	.goto 378,31.32,52.22,15,0
    >>击杀|r|cRXP_ENEMY_狒狒村智者|r并从他们身上搜刮出[|cRXP_LOOT_刷子|r]
    .complete 29777,1 --8/8 Paint Soaked Brush
	.mob Fe-Feng Wiseman
step
    .goto 378,31.751,39.784
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邵白长老|r交谈
    .target Elder Shaopai
    .turnin 29777 >>交任务: |cRXP_FRIENDLY_作案工具|r
step
    .goto 378,29.969,39.757
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔乔·铁眉|r交谈
    .target Jojo Ironbrow
    .turnin 29783 >>交任务: |cRXP_FRIENDLY_比石头更硬|r
step
    .goto 378,30.950,36.774
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .target Ji Firepaw
    .turnin 29778 >>交任务: |cRXP_FRIENDLY_重写智慧|r
    .accept 29779 >>接任务: |cRXP_WARN_以直报怨|r
    .accept 29780 >>接任务: |cRXP_WARN_不作恶|r
    .accept 29781 >>接任务: |cRXP_WARN_警告猴子|r
step
	.isOnQuest 29779
    .goto 378,29.28,39.98,15,0
    .goto 378,27.42,36.25,30,0
    .goto 378,26.42,33.68,30 >>前往|cRXP_WARN_Jade Pillar|r
step
	#completewith next
	>>击杀|cRXP_ENEMY_狒狒村猢狲|r
    .complete 29779,1 --20/20 Fe-Feng Hozen slain
	.mob Fe-Feng Firethief
	.mob Fe-Feng Ruffian
step
    .goto 378,26.42,33.68
    >>点击|cRXP_FRIENDLY_Jade Pillar|r
    .accept 29782 >>接任务: |cRXP_WARN_比骨头更硬|r
step
    #completewith next
	>>点击|cRXP_PICK_Firework Bundles|r
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
	>>击杀|cRXP_ENEMY_狒狒村猢狲|r
    .complete 29779,1 --20/20 Fe-Feng Hozen slain
	.mob Fe-Feng Firethief
	.mob Fe-Feng Ruffian
step
    .goto 378,26.08,35.17,15,0
    .goto 378,20.94,34.43
	>>击杀|cRXP_ENEMY_鲁克鲁克|r
    .complete 29780,1 --1/1 Ruk-Ruk slain
	.mob Ruk-Ruk
step
    #completewith next
	>>点击|cRXP_PICK_Firework Bundles|r
    .complete 29781,1 --8/8 Stolen Firework Bundle
step
    >>击杀|cRXP_ENEMY_狒狒村猢狲|r
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
	>>点击|cRXP_PICK_Firework Bundles|r
    .complete 29781,1 --8/8 Stolen Firework Bundle
step
	#completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与季·火掌交谈, 他应该就在你旁边. |cFFFF0000如果他不在那里, 请跳过此步骤|r
    .turnin 29779 >>交任务: |cRXP_FRIENDLY_以直报怨|r
    .turnin 29780 >>交任务: |cRXP_FRIENDLY_不作恶|r
    .turnin 29781 >>交任务: |cRXP_FRIENDLY_警告猴子|r
    .accept 29784 >>接任务: |cRXP_WARN_平衡之念|r
	.target Ji Firepaw
step
    .goto 378,29.90,39.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔乔·铁眉|r交谈
    .turnin 29782 >>交任务: |cRXP_FRIENDLY_比骨头更硬|r
	.target Jojo Ironbrow
step
    .goto 378,30.97,36.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
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
    .goto 378,32.94,35.61,8 >>|cRXP_WARN_Carefully|r走过绳索
step
	#label BalancedP
    .goto 378,32.94,35.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 29784 >>交任务: |cRXP_FRIENDLY_平衡之念|r
    .accept 29785 >>接任务: |cRXP_WARN_上古风灵大风|r
	.target Aysa Cloudsinger
step
	#sticky
	#label Temple1
    .goto 378,30.21,38.57,20,0
    .goto 378,28.94,62.89,20 >>前往寺庙|r
	.isOnQuest 29785
step
	#sticky
	#label Temple2
	#requires Temple1
    .goto 378,26.64,66.63,10 >>在第一次风势减弱后, 于楼梯间奔跑
	.isOnQuest 29785
step
	#sticky
	#label Temple3
	#requires Temple2
    .goto 378,26.64,66.63,10 >>在下一间房间的风势平息后, 朝|cRXP_FRIENDLY_大风|r奔去
	.isOnQuest 29785
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大风|r和|cRXP_FRIENDLY_Aysa|r交谈
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
	>>当|cRXP_ENEMY_炤壬|r在你上方时, 点击|cRXP_PICK_烟花发射器|r来造成伤害. 他会逆时针绕圈移动. |cRXP_WARN_避开他的闪电水坑|r. 在他落地时攻击他. 第二次落地时将其击杀
    .complete 29786,1 --1/1 Zhao-Ren slain
	.target Zhao-Ren
step
    .goto 378,29.99,60.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29786 >>交任务: |cRXP_FRIENDLY_天空之战|r
    .accept 29787 >>接任务: |cRXP_WARN_传承的价值|r
	.target Master Shang Xi
step
	#completewith next
    .goto 378,26.32,52.83,20,0
    .goto 378,22.70,52.80,40 >>前往长老之路|r
step
    .goto 378,22.70,52.80
	>>击杀长者的卫士|r
    .complete 29787,1 --1/1 Guardian of the Elders slain
	.timer 19,Worthy of Passing RP
	.target Guardian of the Elders
step
    .goto 378,19.45,51.22
	>>等待RP结束
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
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
	>>击杀棘枝恶灵并拾取挂在树上的魔力护符
    .complete 29788,1 --8/8 Thornbranch Scamp slain
    .complete 29789,1 --8/8 Kun-Pai Ritual Charm
	.target Thornbranch Scamp
step
    .goto 378,19.46,51.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29788 >>交任务: |cRXP_FRIENDLY_不受欢迎的生灵|r
    .turnin 29789 >>交任务: |cRXP_FRIENDLY_积跬步，致千里|r
    .accept 29790 >>接任务: |cRXP_WARN_智慧传承|r
	.timer 83,Passing Wisdom RP
	.target Master Shang Xi
step
    .goto 378,17.29,50.78
    >>在箭头指示位置等待RP回合结束
    >>|cRXP_WARN_如果你超过那个位置, 尚曦将会消失|r. 如果发生这种情况, 请放弃任务并重新开始RP
    .complete 29790,1 --1/1 Listen to Master Shang Xi
	.target Master Shang Xi
step
    .goto 378,15.79,49.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 29790 >>交任务: |cRXP_FRIENDLY_智慧传承|r
    .accept 29791 >>接任务: |cRXP_WARN_神真子的苦难|r
	.target Aysa Cloudsinger
step
    .goto 378,15.55,48.91
    >>点击|cRXP_PICK_Air Balloon|r登上气球
    .complete 29791,1 --1/1 Board the Hot Air Balloon
	.timer 231,The Suffering of Shen-zin Su RP
step
    .goto 378,30.8,92.9
	>>|cRXP_WARN_等待RP结束|r
    .complete 29791,2 --1/1 Uncover the source of Shen-zin Su's pain
step
    .goto 378,51.35,57.21,20,0
    .goto 378,51.31,48.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shaopai|r交谈
    .turnin 29791 >>交任务: |cRXP_FRIENDLY_神真子的苦难|r
    .accept 29792 >>接任务: |cRXP_WARN_通往卓越|r
	.target Elder Shaopai
step
    .goto 378,51.60,61.39
    --#title |cFFFCDC00跟随箭头指引|r
    >>|cRXP_WARN_请跟随箭头指示|r
    .complete 29792,1 --1/1 Open the Mandori Village Gate
step
	#completewith next
    .goto 378,50.66,65.62,20,0
    .goto 378,52.28,68.43,30 >>前往佩武门|r
	.timer 28,Pei-Wu Gate RP
step
    .goto 378,52.28,68.43
    >>|cRXP_WARN_跟随箭头|r. 等待RP
    .complete 29792,2 --1/1 Open the Pei-Wu Forest Gate
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wei|r和|cRXP_FRIENDLY_Korga|r交谈
    .turnin 29792 >>交任务: |cRXP_FRIENDLY_通往卓越|r
    .accept 30591 >>接任务: |cRXP_LOOT_猎杀狼群|r
    .goto 378,50.07,76.63
    .accept 29795 >>接任务: |cRXP_WARN_储备竹竿|r
    .goto 378,50.22,76.65
	.target Wei Palerage
	.target Korga Strongmane
step
    #loop
	.line 378,54.51,85.54,45.05,85.81,45.89,71.57,55.62,69.49,54.51,85.54
	.goto 378,54.51,85.54,40,0
	.goto 378,45.05,85.81,40,0
	.goto 378,45.89,71.57,40,0
	.goto 378,55.62,69.49,40,0
	.goto 378,54.51,85.54,40,0
    >>击杀|cRXP_ENEMY_悲雾猛虎|r
    >>点击地面上的|cRXP_PICK_竹竿|r|cRXP_WARN_提示|r
    .complete 30591,1 --9/9 Pei-Wu Tiger slain
    .complete 29795,1 --10/10 Broken Bamboo Stalk
	.mob Pei-Wu Tiger
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wei|r和|cRXP_FRIENDLY_Korga|r交谈
    .turnin 30591 >>交任务: |cRXP_FRIENDLY_猎杀狼群|r
    .goto 378,50.07,76.63
    .turnin 29795 >>交任务: |cRXP_FRIENDLY_储备竹竿|r
    .accept 30589 >>接任务: |cRXP_WARN_炸毁残骸|r
    .goto 378,50.22,76.65
	.target Wei Palerage
	.target Korga Strongmane
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Makael|r和|cRXP_FRIENDLY_Ji|r交谈
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
    >>击杀|cRXP_ENEMY_黑暗骇魔|r和|cRXP_ENEMY_恐怖生物|r. |cRXP_WARN_小心黑暗骇魔的暗影喷泉|r
	>>在地面上的|cRXP_PICK_Explosion Bundles|r
    .complete 29793,1 --8/8 Darkened Horrors or Darkened Terrors slain
    .complete 30590,1 --6/6 Packed Explosion Charge
	.mob Darkened Horror
	.mob Darkened Terror
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈凯尔·贝|r和|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 30590 >>交任务: |cRXP_FRIENDLY_小心运送|r
    .goto 378,36.32,72.36
    .turnin 29793 >>交任务: |cRXP_FRIENDLY_海中的邪恶|r
    .accept 29796 >>接任务: |cRXP_WARN_紧急消息|r
    .goto 378,36.37,72.53
	.target Makael Bay
	.target Ji Firepaw
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德罗娜·莱因哈特|r和|cRXP_FRIENDLY_乔乔·铁眉|r交谈
    .turnin 29796 >>交任务: |cRXP_FRIENDLY_紧急消息|r
    .accept 29794 >>接任务: |cRXP_WARN_一个都不能少|r
    .accept 29797 >>接任务: |cRXP_WARN_医疗物资|r
    .goto 378,42.21,86.54
    .accept 29665 >>接任务: |cRXP_WARN_越来越糟|r
    .goto 378,42.30,86.35
	.target Delora Lionheart
	.target Jojo Ironbrow
step
	#completewith InjuredSailorB
    >>击杀|cRXP_ENEMY_深鳞折磨者|r
    >>点击地面上的|cRXP_PICK_Medical 医疗箱|r
    .complete 29665,1 --8/8 Deepscale Tormentor slain
    .complete 29797,1 --8/8 Alliance Medical Supplies
	.mob Deepscale Tormentor
step
    .waypoint 378,42.27,86.80,-129340,wpbuff,UNIT_AURA--put this WP at the top, this is where to point at once you have the buff
    .waypoint 378,42.27,86.80,-105520,wpbuff,UNIT_AURA--put this WP at the top, this is where to point at once you have the buff
    .waypoint 378,40.18,87.69,10
    .waypoint 378,40.01,84.36,10
    .waypoint 378,38.08,84.73,10
    .waypoint 378,38.41,83.09,10
    .waypoint 378,37.60,81.44,10
    .waypoint 378,35.49,83.80,10
    .waypoint 378,36.17,87.63,10
    .waypoint 378,37.66,87.22,10
    .waypoint 378,38.36,87.43,10
    .goto 378,40.18,87.69
    .complete 29794,1,2>>在地上拾起一名|rC_RXP_FRIENDLY_受伤的船员|c, 并将他带回给任务发布者. 重复此操作至少两次
    .target Injured Sailor
step << skip
    #optional
    #completewith next
    #label InjuredSailorA
    .goto 378,42.27,86.80,0,0
    >>将受伤的船员带回到德尔拉的营地
    .complete 29794,1,1 --3/3 Injured Sailors rescued
step << skip
    #optional
	#completewith InjuredSailorA
    .goto 378,40.18,87.69
	.cast 56685 >>在地上拾起一名受伤的船员|r
	.isOnQuest 29794
	.target Injured Sailor
step << skip
    #optional
    #requires InjuredSailorA
    .goto 378,42.27,86.80
    >>将受伤的船员带回到德尔拉的营地
    .complete 29794,1,1 --3/3 Injured Sailors rescued
step << skip
    #optional
    #completewith next
	#label InjuredSailorB
    .goto 378,42.27,86.80,0,0
    >>将受伤的船员带回到德尔拉的营地
    .complete 29794,1,2 --3/3 Injured Sailors rescued
step << skip
    #optional
	#completewith InjuredSailorB
    .goto 378,39.41,87.98
	.cast 56685 >>拾起受伤的船员|r
	.isOnQuest 29794
	.target Injured Sailor
step << skip
    #optional
    #requires InjuredSailorB
    .goto 378,42.27,86.80
    >>将受伤的船员带回到德尔拉的营地
    .complete 29794,1,2 --3/3 Injured Sailors rescued
step
#optional
#label InjuredSailorB
step
    #optional
    #loop
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
    .goto 378,36.41,85.51,15,0
    .goto 378,36.82,89.24,15,0
    >>击杀|cRXP_ENEMY_深鳞折磨者|r
    >>点击地面上的|cRXP_PICK_Medical 医疗箱|r
	>>|cRXP_WARN_别急着接新的水手任务|r
    .complete 29665,1 --8/8 Deepscale Tormentor slain
    .complete 29797,1 --8/8 Alliance Medical Supplies
	.mob Deepscale Tormentor
step
    #label InjuredSailorC
    #completewith next
    .goto 378,42.27,86.80,0,0
    >>将受伤的船员送回德拉拉·狮心的营地
    .complete 29794,1 --3/3 Injured Sailors rescued
step
	#completewith InjuredSailorC
    .goto 378,38.36,87.43,10,0
    .goto 378,37.66,87.22,10,0
    .goto 378,36.17,87.63,10,0
    .goto 378,35.49,83.80,10,0
    .goto 378,37.60,81.44,10,0
    .goto 378,38.41,83.09,10,0
    .goto 378,38.08,84.73,10,0
    .goto 378,40.01,84.36,10,0
    .goto 378,40.18,87.69
	.cast 56685 >>拾起受伤的船员|r
	.isOnQuest 29794
	.target Injured Sailor
step
    #requires InjuredSailorC
    .goto 378,42.27,86.80
    >>将受伤的船员送回德拉拉·狮心的营地
    .complete 29794,1 --3/3 Injured Sailors rescued
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德罗娜·莱因哈特|r和|cRXP_FRIENDLY_乔乔·铁眉|r交谈
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
    >>击杀 |cRXP_ENEMY_Vordraka, 深海噩梦|r
    *- |cRXP_WARN_Dodge his Deep Sea Smash|r.
    *- Kill |cRXP_ENEMY_Deepscale Aggressors|r when they spawn.
    .complete 29798,1 --1/1 Vordraka, the Deep Sea Nightmare slain
	.mob Vordraka, The Deep Sea Nightmare
    .mob Deepscale Aggressor
step
    .goto 378,36.50,84.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
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
    >>等待 RP 时间(此期间你可以休息)
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .complete 30767,1 --1/1 Shen-zin Su's Thorn Removed
step
    .goto 378,39.30,86.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
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
    >>点击|cRXP_PICK_松散的残骸|r, 并帮助|cRXP_FRIENDLY_联盟牧师|r和|cRXP_FRIENDLY_部落德鲁伊|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_联盟牧师|r和|cRXP_FRIENDLY_部落德鲁伊|r交谈
    *- |cRXP_WARN_Kill |cRXP_ENEMY_Dampscale Fleshrippers|r if they're attacking them.|r
    .complete 29799,1 --1/1 Protect the healers
	.target Alliance Priest
	.target Horde Druid
	.mob Dampscale Fleshripper
step
    .goto 378,39.30,86.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .turnin 29799 >>交任务: |cRXP_FRIENDLY_治疗神真子|r
	.timer 18,The Healing of Shen-zin Su RP
	.target Ji Firepaw
step
    >>|cRXP_WARN_等待RP结束|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .goto 378,38.77,86.32
    .accept 29800 >>接任务: |cRXP_WARN_新的盟友|r
	.target Ji Firepaw
step
    #completewith next
    .hs >>炉石|cRXP_WARN_前往五黎明神殿|r
step
    .goto 378,51.45,48.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚熙之灵|r交谈并选择你的阵营
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .turnin 29800 >>交任务: |cRXP_FRIENDLY_新的盟友|r
    .accept 31450 >>接任务: |cRXP_WARN_新的命运|r
    .complete 31450,1 --1/1 Choose your faction
    .skipgossip
	.target Spirit of Shang Xi
step
    .zoneskip 84
    .goto 1,45.58,12.61
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 31450 >>交任务: |cRXP_FRIENDLY_新的命运|r
    .accept 31012 >>接任务: |cRXP_WARN_加入部落|r
    .target Ji Firepaw
step
    .zoneskip 1
    .zoneskip 85
    .goto 84,74.19,91.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 31450 >>交任务: |cRXP_FRIENDLY_新的命运|r
	.accept 30987 >>接任务: |cRXP_WARN_加入联盟|r
	.target Aysa Cloudsinger
step
#optional
.neutralzonefinished
step <<skip
--TODO: skip this? the whole trip to SW keep is way too long
    .zoneskip 1
    .zoneskip 85
    .goto 84,74.19,91.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里安·乌瑞恩国王|r交谈
	.turnin 30987 >>交任务: |cRXP_FRIENDLY_加入联盟|r
	.target King Varian Wrynn
    .neutralzonefinished
step
    .zoneskip 84
    #completewith next
    .goto 85,49.87,75.52,20 >>前往|cRXP_WARN_inside 格罗玛什要塞|r
step
    .zoneskip 84
    .goto 85,48.76,70.77
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔鲁什·地狱咆哮|r谈话
    .turnin 31012 >>交任务: |cRXP_FRIENDLY_加入部落|r
    .target Garrosh Hellscream
    .neutralzonefinished
step
.zoneskip 84
.zoneskip 1
.zoneskip 85
+恭喜, 您已顺利完成熊猫人起始区域, 请点击RXP窗口下方的齿轮按钮, 并选择相应的后续任务指引
]])
