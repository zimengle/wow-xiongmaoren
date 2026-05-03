local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Alliance
#name 1-6 北郡
#version 1
#group RestedXP 生存指南（A）
#subgroup RXP 生存指南 1-20
#defaultfor Human
#next 6-11 艾尔文森林; 6-13 艾尔文森林
step << !Human
    #sticky
    #completewith next
    .goto Elwynn Forest,48.171,42.943
    +您已选择适合人类的指南。您应该选择与您开始的相同的起始区
step << Warlock
    #completewith next
    .goto Elwynn Forest,50.051,42.689
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_丹恩·温斯洛|r
    .vendor >>|cRXP_WARN_出售你的防弹衣、衬衫、裤子和靴子以及包里的食物和水。你总共需要 10 美分|r
    .target Dane Winslow
step << Warlock
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜希拉·拉萨雷|r
    .accept 1598 >>接任务: |cRXP_LOOT_失窃的典籍|r
    .train 348 >>列车 |T135817:0|t[献祭]
    .target Drusilla La Salle
step << Warlock
    #hardcore
    .goto Elwynn Forest,52.9,44.3,60,0
    .goto Elwynn Forest,56.7,44.0
    >>|cRXP_WARN_跑进迪菲亚营地的帐篷|r
    >>打开 |cRXP_PICK_Stolen Books|r。从中获取 |cRXP_LOOT_Powers of the Void|r
    >>|cRXP_WARN_你可以在帐篷里安全地掠夺 |cRXP_LOOT_Powers of the Void|r！观看视频了解如何操作|r
    .link https://youtu.be/3qQwsJhAZIk >>|cRXP_WARN_点击此处查看视频参考|r
    .complete 1598,1 --Collect Powers of the Void (x1)
step << Warlock
    #completewith next
    .goto Elwynn Forest,56.828,43.734
    >>|cRXP_WARN_留在帐篷里，这样 |cRXP_ENEMY_Defias Thugs|r 就打不到你|r
    .hs >>炉火至北郡山谷
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜希拉·拉萨雷|r
    .goto Elwynn Forest,49.873,42.649
    .turnin 1598 >>交任务: |cRXP_FRIENDLY_失窃的典籍|r
    .target Drusilla La Salle
step << Warlock
    #completewith next
    .cast 688 >>|cRXP_WARN_Cast|r |T136218:0|t[召唤小鬼]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Willem|r
    .target Deputy Willem
    .goto Elwynn Forest,48.17,42.94
    .accept 783 >>接任务: |cRXP_LOOT_身边的危机|r
step << Warrior
    .goto Elwynn Forest,46.4,40.3,35,0
    >>杀死 |cRXP_ENEMY_Young Wolves|r 直到你有价值 10c+ 的供应商垃圾
    >>|cRXP_WARN_你将训练|r |T132333:0|t[战斗呐喊] |cRXP_WARN_这将提高早期升级速度|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_丹尼尔修士|r
    .vendor >>|cRXP_WARN_供应商垃圾|r
    .goto Elwynn Forest,47.486,41.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莱尼·拜舍尔|r
    .train 6673 >>训练 |T132333:0|t[战斗呐喊]
    .goto Elwynn Forest,50.242,42.287
    .mob Young Wolf
    .target Brother Danil
    .target Llane Beshere
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
    .target 麦克布莱德元帅
    .goto Elwynn Forest,48.923,41.606
    .turnin 783 >>交任务: |cRXP_FRIENDLY_身边的危机|r
    .accept 7 >>接任务: |cRXP_LOOT_剿灭狗头人|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Willem|r
    .target Deputy Willem
    .goto Elwynn Forest,48.171,42.943
    .accept 5261 >>接任务: |cRXP_LOOT_伊根·派特斯金纳|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊根·派特斯金纳|r
    .target Eagan Peltskinner
    .goto Elwynn Forest,48.941,40.166
    .turnin 5261 >>交任务: |cRXP_FRIENDLY_伊根·派特斯金纳|r
    .accept 33 >>接任务: |cRXP_LOOT_林中的群狼|r
step << Priest/Mage/Warlock
    #completewith next
    .goto Elwynn Forest,46.2,40.4,40,0
    .goto Elwynn Forest,47.486,41.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_丹尼尔修士|r
    .vendor >>|cRXP_WARN_一旦你有价值 50c 的供应商垃圾，购买 10|r |T132794:0|t[清爽泉水]
    .target Brother Danil
    .collect 159,10 --Collect Refreshing Spring Water (x10)
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Young Wolves|r 和 |cRXP_ENEMY_Timber Wolves|r。掠夺他们的 |cRXP_LOOT_Meat|r
	.mob Young Wolf
	.mob Timber Wolf
    .complete 33,1 --Collect Tough Wolf Meat (x8)
step
    .goto Elwynn Forest,47.6,35.9,40,0
    .goto Elwynn Forest,49.6,35.8,40,0
    .goto Elwynn Forest,51.6,37.0,40,0
    .goto Elwynn Forest,49.6,35.8
    >>杀死 |cRXP_ENEMY_Kobold Vermins|r
	.mob Kobold Vermin
    .complete 7,1 --Kill Kobold Vermin (x10)
step
    .goto Elwynn Forest,46.41,41.94,40,0
    .goto Elwynn Forest,46.61,35.09,40,0
    .goto Elwynn Forest,51.91,37.85,40,0
    .goto Elwynn Forest,46.61,35.09,40,0
    .goto Elwynn Forest,46.41,41.94
    >>杀死 |cRXP_ENEMY_Young Wolves|r 和 |cRXP_ENEMY_Timber Wolves|r。掠夺他们的 |cRXP_LOOT_Meat|r
	.mob Young Wolf
	.mob Timber Wolf
    .complete 33,1 --Collect Tough Wolf Meat (x8)
step
    .goto Elwynn Forest,48.941,40.166
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊根·派特斯金纳|r
    .target Eagan Peltskinner
    .turnin 33,2 >>交任务: |cRXP_FRIENDLY_林中的群狼|r << Warrior/Paladin/Rogue
    .turnin 33,1 >>交任务: |cRXP_FRIENDLY_林中的群狼|r << !Warrior !Paladin !Rogue
step << Priest/Mage/Warlock
    .goto Elwynn Forest,47.486,41.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_丹尼尔修士|r
    .vendor >>|cRXP_WARN_供应商垃圾|r
    >>|cRXP_WARN_Buy 10|r |T132794:0|t[清爽泉水]
    .target Brother Danil
    .collect 159,10 --Collect Refreshing Spring Water (x10)
step << !Priest !Mage !Warlock !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高德瑞克·洛斯迦|r
    .target Godric Rothgar
    .goto Elwynn Forest,47.691,41.417
    .vendor >>|cRXP_WARN_供应商垃圾|r
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_亚努斯·哈默纳克|r
    .goto Elwynn Forest,47.240,41.900
    .vendor >>|cRXP_BUY_购买 a|r |T135650:0|t[德克]
    .target Janos Hammerknuckle
step << Rogue
    #completewith next
    +|cRXP_WARN_装备|r |T135650:0|t[德克]
    .use 2139
    .itemcount 2139,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.3
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
    .target 麦克布莱德元帅
    .goto Elwynn Forest,48.923,41.606
    .turnin 7 >>交任务: |cRXP_FRIENDLY_剿灭狗头人|r
    .accept 15 >>接任务: |cRXP_LOOT_回音山调查行动|r
    .accept 3100 >>接任务: |cRXP_LOOT_简要的信件|r << Warrior
    .accept 3101 >>接任务: |cRXP_LOOT_圣洁信件|r << Paladin
    .accept 3102 >>接任务: |cRXP_LOOT_密文信件|r << Rogue
    .accept 3103 >>接任务: |cRXP_LOOT_神圣信件|r << Priest
    .accept 3104 >>接任务: |cRXP_LOOT_雕文信件|r << Mage
    .accept 3105 >>接任务: |cRXP_LOOT_被污染的信件|r << Warlock
step
    .xp 3 >>升级至 3
step
    .goto Elwynn Forest,47.2,35.1,40,0
    .goto Elwynn Forest,48.9,32.8,40,0
    .goto Elwynn Forest,51.7,37.7,40,0
    .goto Elwynn Forest,47.2,35.1
    >>杀死 |cRXP_ENEMY_Kobold 工人|r
	.mob Kobold Worker
    .complete 15,1 --Kill Kobold Worker (x10)
step
    #sticky
    #label xp3
    .xp 3+1110 >>回来的路上磨练到 1110+/1400xp
step
    #completewith next
    .goto Elwynn Forest,47.691,41.417
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高德瑞克·洛斯迦|r
    .target Godric Rothgar
    .vendor >>|cRXP_WARN_供应商垃圾|r
--N need SoM xp note
step
    #requires xp3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
    .target 麦克布莱德元帅
    .goto Elwynn Forest,48.923,41.606
    .turnin 15 >>交任务: |cRXP_FRIENDLY_回音山调查行动|r
    .accept 21 >>接任务: |cRXP_LOOT_回音山清剿行动|r
step << Priest/Mage
    #completewith next
    .goto Elwynn Forest,49.52,39.99,10 >>上楼 << Mage
    .goto Elwynn Forest,49.3,40.7,15 >>前往 |cRXP_FRIENDLY_Priestess Anetta|r << Priest
step << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯尔登·布雷门|r
    .target Khelden Bremen
    .goto Elwynn Forest,49.661,39.402
    .turnin 3104 >>交任务: |cRXP_FRIENDLY_雕文信件|r
    .trainer >>训练你的职业法术
    .target Khelden Bremen
step << Priest
    #completewith next
    .goto Elwynn Forest,49.8,40.2,10 >>穿过门口
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女牧师安妮塔|r
    .target Priestess Anetta
    .goto Elwynn Forest,49.808,39.489
    .turnin 3103 >>交任务: |cRXP_FRIENDLY_神圣信件|r
    .trainer >>训练你的职业法术
step << Warrior/Paladin
    #completewith next
    .goto Elwynn Forest,49.6,41.8,15 >>前往 |cRXP_FRIENDLY_Llane Beshere|r << Warrior
    .goto Elwynn Forest,49.6,41.8,15 >>前往 |cRXP_FRIENDLY_Brother Sammuel|r << Paladin
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莱尼·拜舍尔|r
    .target Llane Beshere
    .goto Elwynn Forest,50.242,42.287
    .turnin 3100 >>交任务: |cRXP_FRIENDLY_简要的信件|r
    .trainer >>训练你的职业法术
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨缪尔修士|r
    .target Brother Sammuel
    .goto Elwynn Forest,50.433,42.124
    .turnin 3101 >>交任务: |cRXP_FRIENDLY_圣洁信件|r
    .trainer >>训练你的职业法术
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Willem|r
    .target Deputy Willem
    .goto Elwynn Forest,48.171,42.943
    .accept 18 >>接任务: |cRXP_LOOT_潜行者兄弟会|r
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜希拉·拉萨雷|r
    .target Drusilla La Salle
    .goto Elwynn Forest,49.873,42.649
    .turnin 3105 >>交任务: |cRXP_FRIENDLY_被污染的信件|r
    .xp 4 >>升级至 4
    .trainer >>列车 |T136118:0|t[腐败]
step
    .goto Elwynn Forest,53.9,49.2,50,0
    .goto Elwynn Forest,55.5,42.1,50,0
    .goto Elwynn Forest,53.9,49.2
    .goto Elwynn Forest,54.57,49.03
    >>杀死 |cRXP_ENEMY_Defias Thugs|r。掠夺他们的 |cRXP_LOOT_Bandanas|r
	.mob Defias Thug
    .complete 18,1 --Collect Red Burlap Bandana (x12)
step << Rogue
    .xp 4 >>升级至 4
step
    #completewith next
    #softcore
    .deathskip >>在灵魂治疗师处死亡并重生
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Willem|r
    .target Deputy Willem
    .goto Elwynn Forest,48.17,42.94
    .turnin 18,4 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Paladin
    .turnin 18,1 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Rogue/Warlock
    .turnin 18,5 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Mage
    .turnin 18,2 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Priest
    .turnin 18,3 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Warrior
    .turnin 18 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << !Warrior !Priest !Mage !Rogue !Warlock !Paladin
    .accept 6 >>接任务: |cRXP_LOOT_加瑞克·帕德弗特的赏金|r
    .accept 3903 >>接任务: |cRXP_LOOT_米莉·奥斯沃斯|r
step << Paladin
    #completewith next
    +装备 |T133052:0|t[民兵战锤]
    .use 5579
    .itemcount 5579,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.6
step << skip
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高德瑞克·洛斯迦|r
    .target Godric Rothgar
    .goto Elwynn Forest,47.7,41.4
    .vendor >>供应商垃圾，修复
step
    #completewith next
    .goto Elwynn Forest,47.63,32.07,20 >>进入回声岭矿井
step
    .goto Elwynn Forest,48.61,27.63
    >>杀死 |cRXP_ENEMY_Kobold Laborers|r
	.mob Kobold Laborer
    .complete 21,1 --Kill Kobold Laborer (x12)
step
    .xp 5 >>升级至 5
step << !Priest !Mage
    .goto Elwynn Forest,50.692,39.347
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米莉·奥斯沃斯|r
    .turnin 3903 >>交任务: |cRXP_FRIENDLY_米莉·奥斯沃斯|r
    >>|cRXP_WARN_跳过后续|r
    .target 米莉·奥斯沃斯
step << Priest/Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米莉·奥斯沃斯|r
    .target 米莉·奥斯沃斯
    .goto Elwynn Forest,50.692,39.347
    .turnin 3903 >>交任务: |cRXP_FRIENDLY_米莉·奥斯沃斯|r
    .accept 3904 >>接任务: |cRXP_LOOT_米莉的葡萄|r
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔里克·克里丹|r
    .target Jorik Kerridan
    .goto Elwynn Forest,50.314,39.916
    .turnin 3102 >>交任务: |cRXP_FRIENDLY_密文信件|r
    >>|cRXP_WARN_你不需要训练任何法术|r
step << Priest/Mage
    >>战利品 |cRXP_PICK_Milly's Harvest|r 在地面上
    .goto Elwynn Forest,54.5,49.4
    .complete 3904,1 --Collect Milly's Harvest (x8)
step
    .goto Elwynn Forest,57.5,48.2
    >>杀死 |cRXP_ENEMY_Garrick Padfoot|r。掠夺他的 |cRXP_LOOT_Head|r
	.mob Garrick Padfoot
    .complete 6,1 --Collect Garrick's Head (x1)
step << !Priest !Mage
    #sticky
    .abandon 3904 >>放弃米莉的收获
step << !Priest !Mage
    .xp 5+1715 >>努力回到 1715+/2800xp
    .goto Elwynn Forest,48.171,42.943
--N SoM xp values
step << Priest/Mage
    .xp 5+1175 >>一路磨练，回到 1175+/2800xp
    .goto Elwynn Forest,50.7,39.2
step
    #completewith next
    #softcore
    .deathskip >>在灵魂治疗师处死亡并重生
step << Priest/Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米莉·奥斯沃斯|r
    .target 米莉·奥斯沃斯
    .goto Elwynn Forest,50.692,39.347
    .turnin 3904 >>交任务: |cRXP_FRIENDLY_米莉的葡萄|r
    .accept 3905 >>接任务: |cRXP_LOOT_葡萄出货单|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Willem|r
    .target Deputy Willem
    .goto Elwynn Forest,48.17,42.94
    .turnin 6,2 >>交任务: |cRXP_FRIENDLY_加瑞克·帕德弗特的赏金|r << Warrior/Rogue/Paladin
    .turnin 6,1 >>交任务: |cRXP_FRIENDLY_加瑞克·帕德弗特的赏金|r << !Warrior !Rogue !Paladin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
    .target 麦克布莱德元帅
    .goto Elwynn Forest,48.923,41.606
    .turnin 21,1 >>交任务: |cRXP_FRIENDLY_回音山清剿行动|r << Rogue
    .turnin 21,2 >>交任务: |cRXP_FRIENDLY_回音山清剿行动|r << Warrior/Paladin
    .turnin 21,3 >>交任务: |cRXP_FRIENDLY_回音山清剿行动|r << !Warrior !Paladin
    .accept 54 >>接任务: |cRXP_LOOT_去闪金镇报到|r
step << Priest/Mage
    #sticky
    #completewith next
    .goto Elwynn Forest,49.6,41.6,15,0
    .goto Elwynn Forest,48.9,41.3,10 >>上楼
step << Priest/Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尼尔斯修士|r, 他在楼上
    .target Brother Neals
    .goto Elwynn Forest,49.471,41.586
    .turnin 3905,1 >>交任务: |cRXP_FRIENDLY_葡萄出货单|r
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女牧师安妮塔|r
    .target Priestess Anetta
    .goto Elwynn Forest,49.808,39.489
    .accept 5623 >>接任务: |cRXP_LOOT_圣光的恩赐|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_法尔坎·伊森斯泰德|r
    .target Falkhaan Isenstrider
    .goto Elwynn Forest,45.563,47.742
    .accept 2158 >>接任务: |cRXP_LOOT_休息和放松|r
]])


RXPGuides.RegisterGuide([[
#hardcore
#classic
#era/som
<< Alliance
#name 6-11 艾尔文森林
#version 1
#group RestedXP 生存指南（A）
#subgroup RXP 生存指南 1-20
#defaultfor Human
#next 11-13 洛克莫丹
step
    #completewith next
    .subzone 87 >>前往闪金郡
step
    #hardcore
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshall Dughan|r
    .target 杜汉元帅
    .goto Elwynn Forest,42.105,65.927
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
step << Warrior/Rogue/Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_铁匠阿古斯|r
    .target Smith Argus
    .goto Elwynn Forest,41.706,65.544
    .trainer >>训练 |T136241:0|t[锻造]
    >>|cRXP_WARN_这将允许你制作 |T135248:0|t[粗糙磨刀石]，增加近战攻击 +2 伤害。这在早期非常重要|r << Warrior/Rogue
    >>|cRXP_WARN_这将允许你制作 |T135255:0|t[粗糙重量石]，增加近战攻击 +2 伤害。这在早期非常重要|r << Paladin
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞娜·斯蒂利|r
    >>|cRXP_WARN_购买并装备 a|r |T135321:0|t[Gladius]
    .target Corina Steele
    .money <0.0536
    .goto Elwynn Forest,41.529,65.900
    .collect 2488,1 --Collect Gladius (1)
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞娜·斯蒂利|r
    >>|cRXP_WARN_购买并装备 a|r |T135641:0|t[Stiletto]
    .target Corina Steele
    .money <0.0400
    .goto Elwynn Forest,41.529,65.900
    .collect 2494,1 --Collect Stiletto (1)
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞娜·斯蒂利|r
    >>|cRXP_WARN_购买并装备 a|r |T133053:0|t[木槌]
    .target Corina Steele
    .money <0.0631
    .goto Elwynn Forest,41.529,65.900
    .collect 2493,1 --Collect Wooden Mallet (1)
step << Mage/Priest/Warlock
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安德温·克里顿|r
    .target Andrew Krighton
    .goto Elwynn Forest,41.706,65.786
    .vendor >>|cRXP_WARN_供应商垃圾|r
step
    #label Goldshire
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshall Dughan|r
    .target 杜汉元帅
    .goto Elwynn Forest,42.105,65.927
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威廉·匹斯特|r
    .target William Pestle
    .goto Elwynn Forest,43.318,65.705
    .accept 60 >>接任务: |cRXP_LOOT_狗头人的蜡烛|r
step
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板法雷|r
    .target Innkeeper Farley
    .turnin 2158,1 >>交任务: |cRXP_FRIENDLY_休息和放松|r << Rogue/Warrior
    .turnin 2158,2 >>交任务: |cRXP_FRIENDLY_休息和放松|r << !Rogue !Warrior
    .home >>将你的炉石设置为闪金郡
step
    .xp 6 >>升级至 6
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布洛葛·哈姆菲斯特|r
    .target Brog Hamfist
    .goto Elwynn Forest,43.96,65.92
    .vendor 151 >>|cRXP_WARN_购买|r|T135641:0|t[平衡投掷匕首]并装备它|r
step << Warlock
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >>下楼
step << Warlock
    .goto Elwynn Forest,44.392,66.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛克西米利安·克洛文|r
    .target 马克西米利安·克罗
    .trainer >>训练你的职业法术
step << Warlock
    .goto Elwynn Forest,44.397,65.989
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞琳娜·达克哈特|r
    .vendor >>|cRXP_WARN_如果你买得起，就买|r |T133738:0|t[血契魔典（等级 1）] |cRXP_WARN_。如果你买不起，你以后再买|r
    .target Cylina Darkheart
step << Mage/Rogue/Priest
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >>在旅馆上楼
step << Mage
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r
	.target Zaldimar Wefhellt
    .goto Elwynn Forest,43.25,66.19
    .trainer >>训练你的职业法术
step << Priest
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女牧师洁塞塔|r
	.target Priestess Josetta
    .goto Elwynn Forest,43.283,65.721
    .turnin 5623 >>交任务: |cRXP_FRIENDLY_圣光的恩赐|r
    .accept 5624 >>接任务: |cRXP_LOOT_圣光之衣|r
    .trainer >>训练你的职业法术
step << Rogue
    .money <0.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞恩·塞尔留斯|r
    .target Keryn Sylvius
    .goto Elwynn Forest,43.872,65.937
    .trainer >>训练你的职业法术
step << Rogue/Warrior
    .money <0.01
    .goto Elwynn Forest,43.877,66.546,9,0 << Warrior
    .goto Elwynn Forest,43.392,65.550
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米歇尔·贝利|r, 他在楼上
    .target Michelle Belle
    .train 3273 >>列车 |T135966:0|t[急救]
step << Warrior/Rogue
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板法雷|r
    .vendor >>|cRXP_BUY_购买|r |T133995:0|t[达拉然锋利] |cRXP_BUY_直到你只剩下 1 银|r << Warrior
    .vendor >>|cRXP_BUY_最多购买 20|r |T133995:0|t[达拉然锋利] << Rogue
    .target Innkeeper Farley
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_里瑞亚·杜拉克|r
    .target Lyria Du Lac
    .goto Elwynn Forest,41.087,65.768
    .trainer >>训练你的职业法术
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威尔海姆修士|r
    .target Brother Wilhelm
    .goto Elwynn Forest,41.096,66.041
    .trainer >>训练你的职业法术
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷米|r
    .target 雷米“两次”
    .goto Elwynn Forest,42.140,67.254
    .accept 47 >>接任务: |cRXP_LOOT_金砂交易|r
step << Priest
    >>|cRXP_WARN_施放|r |T135929:0|t[次级治疗术 (等级 2)] |cRXP_WARN_and|r |T135987:0|t[真言术：坚韧] |cRXP_WARN_on|r |cRXP_FRIENDLY_Guard Roberts|r
    .target Guard Roberts
    .goto Elwynn Forest,48.148,68.046
    .complete 5624,1 --Heal and fortify Guard Roberts
step
    #completewith BoarMeat1
    >>杀死 |cRXP_ENEMY_Stonetusk Boars|r。掠夺它们的 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,4 --Collect Chunk of Boar Meat (x4)
    .mob Stonetusk Boar
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯通菲尔德妈妈|r, |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r
    .target “阿姨”伯妮丝·斯通菲尔德
    .target 马斯通菲尔德
    .accept 85 >>接任务: |cRXP_LOOT_丢失的项链|r
    .goto Elwynn Forest,34.486,84.253
    .accept 88 >>接任务: |cRXP_LOOT_公主必须死！|r
	.goto Elwynn Forest,34.660,84.482
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Kobold Tunnelers|r 和 |cRXP_ENEMY_Kobold Miners|r。掠夺他们的 |cRXP_LOOT_Candles|r 和 |cRXP_LOOT_Dust|r
    >>|cRXP_WARN_如果你掠夺任何|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r |cRXP_WARN_将它们变成|r |T135248:0|t[粗糙的磨刀石] << Warrior/Rogue
    >>|cRXP_WARN_如果你掠夺任何|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r |cRXP_WARN_将它们变成|r |T135255:0|t[粗糙的重量石] << Paladin
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_比利·马科伦|r
    .target Billy Maclure
    .goto Elwynn Forest,43.131,85.722
    .turnin 85 >>交任务: |cRXP_FRIENDLY_丢失的项链|r
    .accept 86 >>接任务: |cRXP_LOOT_比利的馅饼|r
step
    .goto Elwynn Forest,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅贝尔·马科伦|r
    .accept 106 >>接任务: |cRXP_LOOT_年轻的恋人|r
    .target Maybell Maclure
step
    #completewith next
    .goto Elwynn Forest,42.357,89.373
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔舒·马科伦|r
    .target Joshua Maclure
    .vendor >>|cRXP_BUY_尽可能多地购买|r |T132815:0|t[冰镇牛奶] |cRXP_WARN_|r << Priest/Warlock/Mage
    .vendor >>|cRXP_WARN_供应商垃圾|r << !Priest !Warlock !Mage
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Kobold Tunnelers|r 和 |cRXP_ENEMY_Kobold Miners|r。掠夺他们的 |cRXP_LOOT_Candles|r 和 |cRXP_LOOT_Dust|r
    >>|cRXP_WARN_如果你掠夺任何|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r |cRXP_WARN_将它们变成|r |T135248:0|t[粗糙的磨刀石] << Warrior/Rogue
    >>|cRXP_WARN_如果你掠夺任何|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r |cRXP_WARN_将它们变成|r |T135255:0|t[粗糙的重量石] << Paladin
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    #label BoarMeat1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托米·乔·斯通菲尔德|r
    .goto Elwynn Forest,29.840,85.997
    .turnin 106 >>交任务: |cRXP_FRIENDLY_年轻的恋人|r
    .accept 111 >>接任务: |cRXP_LOOT_托米的祖母|r
    .target Tommy Joe Stonefield
step
    .goto Elwynn Forest,32.5,85.5
    >>杀死 |cRXP_ENEMY_Stonetusk Boars|r。掠夺它们的 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .complete 86,1 --Collect Chunk of Boar Meat (x4)
    .mob Stonetusk Boar
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r
    .target “阿姨”伯妮丝·斯通菲尔德
    .goto Elwynn Forest,34.486,84.253
    .turnin 86 >>交任务: |cRXP_FRIENDLY_比利的馅饼|r
    .accept 84 >>接任务: |cRXP_LOOT_比利的馅饼|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米莱德·斯通菲尔德|r
    .target Gramma Stonefield
    .goto 1429,34.945,83.855
    .turnin 111 >>交任务: |cRXP_FRIENDLY_托米的祖母|r
    .accept 107 >>接任务: |cRXP_LOOT_给威廉·匹斯特的信|r
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Kobold Tunnelers|r 和 |cRXP_ENEMY_Kobold Miners|r。掠夺他们的 |cRXP_LOOT_Candles|r 和 |cRXP_LOOT_Dust|r
    >>|cRXP_WARN_如果你掠夺任何|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r |cRXP_WARN_将它们变成|r |T135248:0|t[粗糙的磨刀石] << Warrior/Rogue
    >>|cRXP_WARN_如果你掠夺任何|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r |cRXP_WARN_将它们变成|r |T135255:0|t[粗糙的重量石] << Paladin
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_比利·马科伦|r
    .target Billy Maclure
    .goto Elwynn Forest,43.131,85.722
    .turnin 84 >>交任务: |cRXP_FRIENDLY_比利的馅饼|r
    .accept 87 >>接任务: |cRXP_LOOT_金牙|r
step
    #completewith KillGoldtooth
    >>杀死 |cRXP_ENEMY_Kobold Tunnelers|r 和 |cRXP_ENEMY_Kobold Miners|r。掠夺他们的 |cRXP_LOOT_Candles|r 和 |cRXP_LOOT_Dust|r
    >>|cRXP_WARN_如果你掠夺任何|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r |cRXP_WARN_将它们变成|r |T135248:0|t[粗糙的磨刀石] << Warrior/Rogue
    >>|cRXP_WARN_如果你掠夺任何|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r |cRXP_WARN_将它们变成|r |T135255:0|t[粗糙的重量石] << Paladin
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    #completewith next
    .goto Elwynn Forest,38.677,81.778,50,0
    .goto Elwynn Forest,40.5,82.3
    >>探索 Fargodeep 矿场
    .complete 62,1 --Scout Through the Fargodeep Mine
step
    #label KillGoldtooth
    >>杀死 |cRXP_ENEMY_Goldtooth|r。掠夺他以获取 |cRXP_LOOT_Bernice 的项链|r
    .goto Elwynn Forest,41.7,78.1
    .complete 87,1 --Collect Bernice's Necklace  (x1)
    .unitscan Goldtooth
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Kobold Tunnelers|r 和 |cRXP_ENEMY_Kobold Miners|r。掠夺他们的 |cRXP_LOOT_Candles|r 和 |cRXP_LOOT_Dust|r
    >>|cRXP_WARN_如果你掠夺任何|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r |cRXP_WARN_将它们变成|r |T135248:0|t[粗糙的磨刀石] << Warrior/Rogue
    >>|cRXP_WARN_如果你掠夺任何|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r |cRXP_WARN_将它们变成|r |T135255:0|t[粗糙的重量石] << Paladin
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    .goto Elwynn Forest,40.5,82.3
    >>探索 Fargodeep 矿场
    .complete 62,1 --Scout Through the Fargodeep Mine
step
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76,25,0
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76,25,0
    .goto Elwynn Forest,40.5,82.3
    >>杀死 |cRXP_ENEMY_Kobold Tunnelers|r 和 |cRXP_ENEMY_Kobold Miners|r。掠夺他们的 |cRXP_LOOT_Candles|r 和 |cRXP_LOOT_Dust|r
    >>|cRXP_WARN_如果你掠夺任何|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r |cRXP_WARN_将它们变成|r |T135248:0|t[粗糙的磨刀石] << Warrior/Rogue
    >>|cRXP_WARN_如果你掠夺任何|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r |cRXP_WARN_将它们变成|r |T135255:0|t[粗糙的重量石] << Paladin
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step << Warrior
    #completewith Goldtooth
    +|cRXP_WARN_从现在起，尝试保存一个|r |T134829:0|t[Minor Healing Potion] |cRXP_WARN_因为稍后你将需要它来处理 Rolf's Corpse|r
step << Warrior/Rogue
    >>|cRXP_WARN_请记住，如果你捡起|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]，|r
    .xp 7+1600 >>升级直到 1600+/4500xp
step << Paladin
    >>|cRXP_WARN_请记住，如果你捡起|r |T135232:0|t|cRXP_LOOT_[粗糙的石头]|r
    .xp 7+1600 >>升级直到 1600+/4500xp
step << !Priest !Paladin !Warrior !Rogue
    .xp 7+1600 >>升级直到 1600+/4500xp
step << Priest
    .xp 7+1260 >>升级直到 1260+/4500xp
step
    #label Goldtooth
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r
    .target “阿姨”伯妮丝·斯通菲尔德
    .goto Elwynn Forest,34.486,84.253
    .turnin 87 >>交任务: |cRXP_FRIENDLY_金牙|r
step
    .xp 7+2690 >>升级直到 2690+/4500xp << !Priest
    .xp 7+2350 >>升级直到 2350+/4500xp << Priest
    .goto Elwynn Forest,42.1,67.3
step
    #completewith next
    .goto Elwynn Forest,42.20,66.00,100 >>前往闪金郡
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷米|r
    .target 雷米“两次”
    .goto Elwynn Forest,42.140,67.254
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
    .accept 40 >>接任务: |cRXP_LOOT_鱼人的威胁|r
    >>|cRXP_WARN_不要出售|r |T133581:0|t[Bag of Marbles] |cRXP_WARN_reward。这是一个非常有价值的物品，直到 60 级|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .target 杜汉元帅
    .goto Elwynn Forest,42.105,65.927
    .turnin 40 >>交任务: |cRXP_FRIENDLY_鱼人的威胁|r
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
step
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞娜·斯蒂利|r
    .goto Elwynn Forest,41.529,65.900
    .vendor >>|cRXP_WARN_供应商垃圾|r
    .target Corina Steele
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞娜·斯蒂利|r
    >>|cRXP_WARN_购买并装备 a|r |T135321:0|t[Gladius]
    .target Corina Steele
    .money <0.0536
    .goto Elwynn Forest,41.529,65.900
    .collect 2488,1 --Collect Gladius (1)
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞娜·斯蒂利|r
    >>|cRXP_WARN_购买并装备 a|r |T135641:0|t[Stiletto]
    .target Corina Steele
    .money <0.0400
    .goto Elwynn Forest,41.529,65.900
    .collect 2494,1 --Collect Stiletto (1)
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞娜·斯蒂利|r
    >>|cRXP_WARN_购买并装备 a|r |T133053:0|t[木槌]
    .target Corina Steele
    .money <0.0631
    .goto Elwynn Forest,41.529,65.900
    .collect 2493,1 --Collect Wooden Mallet (1)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威廉·匹斯特|r
    .target William Pestle
    .goto Elwynn Forest,43.318,65.705
    .turnin 60 >>交任务: |cRXP_FRIENDLY_狗头人的蜡烛|r
    .accept 61 >>接任务: |cRXP_LOOT_送往暴风城的货物|r
    .turnin 107 >>交任务: |cRXP_FRIENDLY_给威廉·匹斯特的信|r
    .accept 112 >>接任务: |cRXP_LOOT_收集海藻|r
step
    .xp 8 >>升级至 8
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_里瑞亚·杜拉克|r
    .target Lyria Du Lac
    .goto Elwynn Forest,41.087,65.768
    .trainer >>训练你的职业法术
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威尔海姆修士|r
    .target Brother Wilhelm
    .goto Elwynn Forest,41.096,66.041
    .trainer >>训练你的职业法术
step << Warlock
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >>前往客栈楼下
step << Warlock
    .goto Elwynn Forest,44.392,66.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛克西米利安·克洛文|r
    .target 马克西米利安·克罗
    .trainer >>训练你的职业法术
step << Warlock
    .goto Elwynn Forest,44.397,65.989
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞琳娜·达克哈特|r
    .vendor >>|cRXP_WARN_如果你买得起，就买|r |T133738:0|t[火箭魔法书（等级 2）] |cRXP_WARN_。如果买不起，你以后再买|r
    .target Cylina Darkheart
step << Mage/Priest/Rogue/Warrior/Paladin
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >>在旅馆上楼
step << Mage
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r
	.target Zaldimar Wefhellt
    .goto Elwynn Forest,43.25,66.19
    .trainer >>训练你的职业法术
step << Priest
    .goto Elwynn Forest,43.283,65.721
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女牧师洁塞塔|r
	.target Priestess Josetta
    .turnin 5624 >>交任务: |cRXP_FRIENDLY_圣光之衣|r
    .trainer >>训练你的职业法术
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞恩·塞尔留斯|r
    .target Keryn Sylvius
    .goto Elwynn Forest,43.872,65.937
    .trainer >>训练你的职业法术
step << Rogue/Warrior/Paladin
    .money <0.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米歇尔·贝利|r
    .target Michelle Belle
    .goto Elwynn Forest,43.392,65.550
    .train 3273 >>列车 |T135966:0|t[急救]
step
    .money <0.1250
    .goto Elwynn Forest,43.96,65.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布洛葛·哈姆菲斯特|r
    .vendor >>|cRXP_WARN_如果需要，请购买 a|r |T133634:0|t[小棕色袋] |cRXP_WARN_|r
	.target Brog Hamfist
step
    #completewith next
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板法雷|r
    .vendor >>|cRXP_WARN_最多购买 40|r |T132815:0|t[冰镇牛奶] << !Warrior !Rogue !Paladin
    .vendor >>|cRXP_WARN_最多购买 40|r |T133995:0|t[达拉然锋利] << Warrior/Rogue
    .vendor >>|cRXP_WARN_最多购买 10|r |T133995:0|t[达拉然锋利] |cRXP_WARN_最多购买 10|r |T132815:0|t[冰镇牛奶] << Paladin
    .target Innkeeper Farley
step
    >>杀死 |cRXP_ENEMY_Murlocs|r 和 |cRXP_ENEMY_Murloc Streamrunners|r。掠夺他们以获得 |cRXP_LOOT_Kelp Fronds|r
    .goto Elwynn Forest,47.6,63.3,60,0
    .goto Elwynn Forest,51.4,64.6,60,0
    .goto Elwynn Forest,57.6,62.8,60,0
    .goto Elwynn Forest,56.4,66.6,60,0
    .goto Elwynn Forest,53.8,66.8,60,0
    .goto Elwynn Forest,57.6,62.8
    .complete 112,1 --Collect Crystal Kelp Frond (x4)
	.mob Murloc
	.mob Murloc Streamrunner
step
    #completewith next
    .goto Elwynn Forest,61.654,53.608,15 >>进入 Jasperlode 矿井
step
    >>|cRXP_WARN_沿着中间的路径探索 Jasperlode 矿场|r
    >>|cRXP_WARN_目标完成后立即离开 Jasperlode 矿井|r
    .goto Elwynn Forest,60.4,50.2
    .complete 76,1 --Scout through the Jasperlode Mine
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卫兵托马斯|r
    .target 后卫托马斯
    .goto Elwynn Forest,73.973,72.179
    .turnin 35 >>交任务: |cRXP_FRIENDLY_卫兵托马斯|r
    .accept 37 >>接任务: |cRXP_LOOT_失踪的卫兵|r
    .accept 52 >>接任务: |cRXP_LOOT_保卫边境|r
step
    #completewith AcceptBundle
    >>杀死 |cRXP_ENEMY_Prowlers|r 和 |cRXP_ENEMY_年轻的森林熊s|r
    >>|cRXP_WARN_优先杀死你看到的任何|cRXP_ENEMY_年轻的森林熊s|r|r
    .complete 52,1 --Kill Prowler (x8)
    .complete 52,2 --Kill 年轻的森林熊 (x5)
    .mob Prowler
    .mob 年轻的森林熊
step
    >>点击地面上的 |cRXP_PICK_A 半被吃掉的尸体|r
    .goto Elwynn Forest,72.656,60.334
    .turnin 37 >>交任务: |cRXP_FRIENDLY_失踪的卫兵|r
    .accept 45 >>接任务: |cRXP_LOOT_罗尔夫的下落|r
step
    #label AcceptBundle
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_管理员莱琳|r
    .target Supervisor Raelen
    .goto Elwynn Forest,81.382,66.112
    .accept 5545 >>接任务: |cRXP_LOOT_木材危机|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉里克·费恩|r
    .target Rallic Finn
    .goto Elwynn Forest,83.283,66.089
    .vendor >>|cRXP_WARN_供应商垃圾|r
    .zoneskip Elwynn Forest,1
step
    #completewith Prowlers
    >>杀死 |cRXP_ENEMY_Prowlers|r 和 |cRXP_ENEMY_年轻的森林熊s|r
    >>|cRXP_WARN_优先杀死你看到的任何|cRXP_ENEMY_年轻的森林熊s|r|r
    .complete 52,1 --Kill Prowler (x8)
    .complete 52,2 --Kill 年轻的森林熊 (x5)
    .mob Prowler
    .mob 年轻的森林熊
step
    #completewith Bundles
    >>抢夺地面上的 |cRXP_LOOT_一捆木柴|r。|cRXP_WARN_它们位于树下|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    #label Prowlers
    .goto Elwynn Forest,79.80,55.50
    >>点击地面上的 |cRXP_PICK_Rolf 的尸体|r
    >>|cRXP_ENEMY_鱼人觅食者|r |cRXP_WARN_将施放|r |T135915:0|t[喝下初级药水] |cRXP_WARN_可治愈自身 61-68|r
    >>|cRXP_WARN_施放|r |T135953:0|t[恢复] |cRXP_WARN_和|r |T135940:0|t[真言术：盾] |cRXP_WARN_然后获得满法力。将 2 个 |cRXP_ENEMY_Murlocs|r 拉到小屋前面，移开，然后核爆一个。杀死一个后逃跑，然后杀死另一个|r << Priest
    >>|cRXP_WARN_将 2|r |cRXP_ENEMY_Murlocs|r |cRXP_WARN_拉到小屋前面，走开并|r |T136071:0|t[变形] |cRXP_WARN_其中一个，同时杀死另一个。杀死|r |T136071:0|t变形的 |cRXP_WARN_一个后|r << Mage
    >>|cRXP_WARN_池 100 怒气。将 2 个|r |cRXP_ENEMY_Murlocs|r |cRXP_WARN_拉到小屋前面，走开并|r |T132316:0|t[Hamstring] |cRXP_WARN_对付其中一个，同时杀死另一个。同时对您正在杀死的那个使用|r |T133581:0|t[Bag of Marbles] |cRXP_WARN_。在您杀死一个之后，逃跑并重置被放风筝的那个|r |T132316:0|t[Hamstring] |cRXP_WARN_|r << Warrior
    >>|cRXP_WARN_将 2|r |cRXP_ENEMY_Murlocs|r |cRXP_WARN_拉到小屋前面，走开并集中精力杀死其中一只。一旦它们都攻击你，就使用|r |T136205:0|t[Evasion] |cRXP_WARN_。这是使用|r |T133581:0|t[Bag of Marbles]|cRXP_WARN_的好机会。杀死一只后逃跑并重置|r << Rogue
    >>|cRXP_WARN_将 2|r |cRXP_ENEMY_Murlocs|r |cRXP_WARN_拉到小屋前面，走开并持续对其中一个施放|r |T136183:0|t[恐惧] |cRXP_WARN_，并尝试同时对两个都施加 DoT|r << Warlock
    >>|cRXP_WARN_将 2|r |cRXP_ENEMY_Murlocs|r |cRXP_WARN_拉到小屋前面，走开并快速击倒其中一人。根据需要使用|r |T135954:0|t[Divine Protection] |cRXP_WARN_和你的治疗。这是使用|r |T133581:0|t[Bag of Marbles]|cRXP_WARN_的好机会。杀死一人后逃跑并重置|r << Paladin
    >>|cRXP_WARN_请记住，在|r |T135954:0|t[神圣保护] |cRXP_WARN_你无法攻击|r << Paladin
    .turnin 45 >>交任务: |cRXP_FRIENDLY_罗尔夫的下落|r
    .accept 71 >>接任务: |cRXP_LOOT_回复托马斯|r
step
    #label Bundles
    .goto Elwynn Forest,76.7,75.6,60,0
    .goto Elwynn Forest,79.7,83.7,60,0
    .goto Elwynn Forest,82.0,76.8,60,0
    .goto Elwynn Forest,76.7,75.6,60,0
    .goto Elwynn Forest,79.7,83.7,60,0
    .goto Elwynn Forest,82.0,76.8,60,0
    .goto Elwynn Forest,86.99,64.83
    >>杀死 |cRXP_ENEMY_Prowlers|r 和 |cRXP_ENEMY_年轻的森林熊s|r
    .complete 52,1 --Kill Prowler (x8)
    .complete 52,2 --Kill 年轻的森林熊 (x5)
    .mob Prowler
    .mob 年轻的森林熊
step
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4
    >>抢夺地面上的 |cRXP_LOOT_一捆木柴|r。|cRXP_WARN_它们位于树下|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_管理员莱琳|r
    .target Supervisor Raelen
    .goto Elwynn Forest,81.382,66.112
    .turnin 5545 >>交任务: |cRXP_FRIENDLY_木材危机|r
step
	.goto Elwynn Forest,76.8,62.4,90,0
    .goto Elwynn Forest,83.7,59.4,90,0
    .goto Elwynn Forest,76.8,62.4,90,0
    .goto Elwynn Forest,83.7,59.4,90,0
    .goto Elwynn Forest,76.8,62.4,90,0
    .goto Elwynn Forest,83.7,59.4,90,0
    .goto Elwynn Forest,76.8,62.4
    .xp 9 >>升级至 9
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨拉·迪博雷恩|r
    .target Sara Timberlain
    .goto Elwynn Forest,79.457,68.789
    .accept 83 >>接任务: |cRXP_LOOT_红色亚麻布|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卫兵托马斯|r
    .target 后卫托马斯
    .goto Elwynn Forest,73.973,72.179
    .turnin 52 >>交任务: |cRXP_FRIENDLY_保卫边境|r
    .turnin 71 >>交任务: |cRXP_FRIENDLY_回复托马斯|r
    .accept 39 >>接任务: |cRXP_LOOT_托马斯的报告|r
    .accept 109 >>接任务: |cRXP_LOOT_向格里安·斯托曼报到|r
    .xp <9,1
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卫兵托马斯|r
    .target 后卫托马斯
    .goto Elwynn Forest,73.973,72.179
    .turnin 52 >>交任务: |cRXP_FRIENDLY_保卫边境|r
    .turnin 71 >>交任务: |cRXP_FRIENDLY_回复托马斯|r
    .accept 39 >>接任务: |cRXP_LOOT_托马斯的报告|r
step
    #era
    #completewith next
    >>杀死 |cRXP_ENEMY_Defias 匪徒|r。掠夺他们的 |cRXP_LOOT_头巾|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .mob Defias Bandit
    .isOnQuest 83
step
    .goto Elwynn Forest,69.3,79.0
    >>杀死 |cRXP_ENEMY_Princess|r。掠夺她的 |cRXP_LOOT_Collar|r
    >>|cRXP_ENEMY_公主|r |cRXP_WARN_会与她的|r |cRXP_ENEMY_猪随从发生冲突|r
    >>|cRXP_ENEMY_公主|r |cRXP_WARN_还会施放|r |T132368:0|t[冲锋] |cRXP_WARN_造成重创|r
    >>|cRXP_WARN_交战前积累 100 点怒气|r |cRXP_ENEMY_Princess|r << Warrior
    >>|cRXP_WARN_确保 |T136205:0|t[逃避] |cRXP_WARN_ 已准备就绪。如果您陷入困境，可以使用带有投掷武器的栅栏来滥用路径并争取时间|r << Rogue
    >>|cRXP_WARN_准备使用|r |T134830:0|t[次级治疗药水]
    .link https://www.youtube.com/watch?v=GRrXOV-UvD4 >>|cRXP_WARN_点击此处查看视频参考|r << !Warrior
    .complete 88,1
    .mob Princess
step
    #completewith Level9Grind
    >>杀死 |cRXP_ENEMY_Defias Bandits|r。掠夺他们以获得 |T134939:0|t[|cRXP_LOOT_Westfall Deed|r]
    .use 1972>>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_Westfall Deed|r] 开始任务|r
    >>|cRXP_WARN_|r |T134939:0|t[|cRXP_LOOT_Westfall Deed|r] |cRXP_WARN_ 是一种非常罕见的掉落物。如果你没有得到它，请忽略此步骤|r
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >>接任务: |cRXP_LOOT_法布隆的地契|r
step
    #era
    >>杀死 |cRXP_ENEMY_Defias 匪徒|r。掠夺他们的 |cRXP_LOOT_头巾|r
    .goto Elwynn Forest,70.5,77.6,60,0
    .goto Elwynn Forest,68.1,77.5,60,0
    .goto Elwynn Forest,68.2,81.4,60,0
    .goto Elwynn Forest,70.8,80.9,60,0
    .goto Elwynn Forest,70.5,77.6,60,0
    .goto Elwynn Forest,68.1,77.5,60,0
    .goto Elwynn Forest,68.2,81.4,60,0
    .goto Elwynn Forest,70.8,80.9,60,0
    .goto Elwynn Forest,70.5,77.6,60,0
    .goto Elwynn Forest,68.1,77.5,60,0
    .goto Elwynn Forest,68.2,81.4,60,0
    .goto Elwynn Forest,70.8,80.9,60,0
    .goto Elwynn Forest,69.3,79.0
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .mob Defias Bandit
    .isOnQuest 83
step
    #label Level9Grind
	.goto Elwynn Forest,69.53,79.47
    .xp 9+3400 >>升级至 3400+/6500xp
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨拉·迪博雷恩|r
    .target Sara Timberlain
    .goto Elwynn Forest,79.457,68.789
    .turnin 83 >>交任务: |cRXP_FRIENDLY_红色亚麻布|r
    .isQuestComplete 83
step << !Warlock
    .goto Redridge Mountains,8.5,72.0
    .xp 9+4475 >>升级直到 4475+/6500xp
step << !Warlock
    #completewith next
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
step << !Warlock
    .goto Redridge Mountains,18.581,69.208,15,0
    .goto Redridge Mountains,23.325,71.373,25,0
    .goto Redridge Mountains,29.565,67.930,25,0
    .goto Redridge Mountains,30.590,59.410
    >>|cRXP_WARN_坚持走主干道，避免途中遇到任何近距离人群|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
    .fp Redridge Mountains >>获取赤脊山飞行路线
    .target Ariena Stormfeather
step
    #completewith next
    .hs >>炉石到闪金镇
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威廉·匹斯特|r
    .goto Elwynn Forest,43.318,65.705
    .turnin 112 >>交任务: |cRXP_FRIENDLY_收集海藻|r
    .accept 114 >>接任务: |cRXP_LOOT_梅贝尔的隐形水|r
    .target William Pestle
step
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >>在旅馆上楼
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米歇尔·贝利|r
    .target Michelle Belle
    .goto Elwynn Forest,43.392,65.550
    .train 3273 >>列车 |T135966:0|t[急救]
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .target 杜汉元帅
    .goto Elwynn Forest,42.105,65.927
    .turnin 39 >>交任务: |cRXP_FRIENDLY_托马斯的报告|r
    .turnin 76 >>交任务: |cRXP_FRIENDLY_玉石矿洞|r
    .accept 239 >>接任务: |cRXP_LOOT_西泉要塞|r
    .accept 59 >>接任务: |cRXP_LOOT_布甲和皮甲|r << Warlock
    .accept 109 >>接任务: |cRXP_LOOT_向格里安·斯托曼报到|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_铁匠阿古斯|r
    .target Smith Argus
    .goto Elwynn Forest,41.706,65.544
    .accept 1097 >>接任务: |cRXP_LOOT_艾尔默的任务|r
step
    .xp 10 >>升级至 10
step
    #softcore
    .goto Elwynn Forest,41.7,65.9
    .vendor >>供应商垃圾，修复
step << Warrior
    .goto Elwynn Forest,41.087,65.768
    .target Ilsa Corbin
    .target Lyria Du Lac
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_里瑞亚·杜拉克|r
    -->>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊尔萨·考宾|r
    .accept 1638 >>接任务: |cRXP_LOOT_战士的训练|r
    .trainer >>训练你的职业法术
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威尔海姆修士|r
    .target Brother Wilhelm
    .goto Elwynn Forest,41.096,66.041
    .trainer >>训练你的职业法术
step << Warlock
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >>前往客栈楼下
step << Warlock
    .goto Elwynn Forest,44.392,66.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛克西米利安·克洛文|r
    .target 马克西米利安·克罗
    .trainer >>训练你的职业法术
step << Warlock
    .goto Elwynn Forest,44.485,66.268
    .target 雷门·马尔科特
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷门·玛考特|r
    .accept 1685 >>接任务: |cRXP_LOOT_加科因的召唤|r
step << Mage/Priest/Rogue
    #sticky
    #completewith next
    .goto Elwynn Forest,43.7,66.4,10 >>上楼
step << Priest
    .goto Elwynn Forest,43.283,65.721
    .target Priestess Josetta
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女牧师洁塞塔|r
    .accept 5635 >>接任务: |cRXP_LOOT_绝望祷言|r
    .trainer >>训练你的职业法术
step << Mage
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r
	.target Zaldimar Wefhellt
    .goto Elwynn Forest,43.25,66.19
    .trainer >>训练你的职业法术
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞恩·塞尔留斯|r
    .target Keryn Sylvius
    .goto Elwynn Forest,43.872,65.937
    .trainer >>训练你的职业法术
    >>|cRXP_WARN_训练|r |T132147:0|t[双持] |cRXP_WARN_和|r |T132307:0|t[冲刺] |cRXP_WARN_作为最低限度。不要训练过多的能力。省钱|r
    .train 674 >>训练 |T132147:0|t[双持]
    .train 2983 >>列车 |T132307:0|t[冲刺]
step << Rogue
    #som
    .goto Elwynn Forest,41.7,65.9
    .money >0.3197
    .vendor >>你没有足够的钱，所以为你的副手购买细高跟鞋
step << Rogue
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞娜·斯蒂利|r
    >>|cRXP_WARN_购买并装备a|r |T135641:0|t[Stiletto] |cRXP_WARN_for你的副手|r
    .target Corina Steele
    .money >0.3152
    .goto Elwynn Forest,41.529,65.900
    .collect 2494,1 --Collect Stiletto (1)
step
    #completewith next
    .goto Elwynn Forest,43.154,89.625,50 >>前往麦克卢尔葡萄园
step
    .goto Elwynn Forest,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅贝尔·马科伦|r
    .turnin 114 >>交任务: |cRXP_FRIENDLY_梅贝尔的隐形水|r
    .target Maybell Maclure
step
    .goto Elwynn Forest,34.660,84.482
    .target 马斯通菲尔德
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯通菲尔德妈妈|r
    .turnin 88,1 >>交任务: |cRXP_FRIENDLY_公主必须死！|r << Rogue/Hunter
    .turnin 88,2 >>交任务: |cRXP_FRIENDLY_公主必须死！|r << Warrior/Paladin
    .turnin 88,3 >>交任务: |cRXP_FRIENDLY_公主必须死！|r << !Rogue !Hunter !Warrior !Paladin
step
    #completewith next
    .goto Elwynn Forest,24.82,76.25,80 >>前往威斯布鲁克驻地
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瑞尼尔副队长|r
    .turnin 239 >>交任务: |cRXP_FRIENDLY_西泉要塞|r
    .accept 11 >>接任务: |cRXP_LOOT_悬赏河爪豺狼人|r
    .goto Elwynn Forest,24.234,74.450
    >>点击|cRXP_PICK_通缉海报|r
    .accept 176 >>接任务: |cRXP_WARN_通缉：霍格|r
    .goto Elwynn Forest,24.548,74.672
    .target 副总统雷纳
step
    .group
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瑞尼尔副队长|r
    .turnin 239 >>交任务: |cRXP_FRIENDLY_西泉要塞|r
    .accept 11 >>接任务: |cRXP_LOOT_悬赏河爪豺狼人|r
    .goto Elwynn Forest,24.234,74.450
    >>点击|cRXP_PICK_通缉海报|r
    .accept 176 >>接任务: |cRXP_WARN_通缉：霍格|r
    .goto Elwynn Forest,24.548,74.672
    .target 副总统雷纳
step
    .solo
    .goto Elwynn Forest,24.234,74.450
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瑞尼尔副队长|r
    .turnin 239 >>交任务: |cRXP_FRIENDLY_西泉要塞|r
    .accept 11 >>接任务: |cRXP_LOOT_悬赏河爪豺狼人|r
    .target 副总统雷纳
step
    #completewith GnollEnd
    >>杀死 |cRXP_ENEMY_Riverpaw Runts|r 和 |cRXP_ENEMY_Riverpaw Outrunners|r。从他们身上获取 |T134939:0|t[|cRXP_LOOT_Gold Pickup Schedule|r]
    .use 1307 >>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_Gold Pickup Schedule|r] 开始任务|r
    >>|cRXP_WARN_|r |T134939:0|t[|cRXP_LOOT_金币领取时间表|r] |cRXP_WARN_是一种非常罕见的掉落。如果你没有得到它，请忽略此步骤|r
    >>|cRXP_ENEMY_Gruff Swiftbite|r |cRXP_WARN_罕见，有 100% 的掉落几率|r
    .collect 1307,1,123 --Collect Gold Pickup Schedule (x1)
    .accept 123 >>接任务: |cRXP_LOOT_收货人|r
    .unitscan Gruff Swiftbite
step << !Warlock
    .group
    #completewith next
    >>杀死 |cRXP_ENEMY_Riverpaw Runts|r 和 |cRXP_ENEMY_Riverpaw Outrunners|r。掠夺他们的 |cRXP_LOOT_Armbands|r
    .complete 11,1 -- Painted Gnoll Armband (8)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
step << !Warlock
    .group
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,25.9,93.9
    >>杀死 |cRXP_ENEMY_Hogger|r。抢夺他的 |cRXP_LOOT_Claw|r
    >>|cRXP_ENEMY_Hogger|r |cRXP_WARN_can 在多个位置生成|r
    >>|cRXP_WARN_这个任务很难。如果需要，可以帮他找个小队。如果你找不到小队或者无法单独完成，可以跳过此步骤|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .unitscan Hogger
step << Warlock
    #completewith next
    >>杀死 |cRXP_ENEMY_Riverpaw Runts|r 和 |cRXP_ENEMY_Riverpaw Outrunners|r。掠夺他们的 |cRXP_LOOT_Armbands|r
    .complete 11,1 -- Painted Gnoll Armband (8)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
step << Warlock
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,25.9,93.9
    >>杀死 |cRXP_ENEMY_Hogger|r。抢夺他的 |cRXP_LOOT_Claw|r
    >>|cRXP_ENEMY_Hogger|r |cRXP_WARN_can 在多个位置生成|r
    >>|cRXP_WARN_持续施放|r |T136183:0|t[恐惧] |cRXP_WARN_on |cRXP_ENEMY_Hogger|r 并使用常规 DoT 杀死他|r
    >>|cRXP_WARN_这个任务很难。如果需要，可以帮他找个小队。如果你找不到小队或者无法单独完成，可以跳过此步骤|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .unitscan Hogger
step
    #label GnollEnd
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,25.9,93.9
    >>杀死 |cRXP_ENEMY_Riverpaw Runts|r 和 |cRXP_ENEMY_Riverpaw Outrunners|r。掠夺他们的 |cRXP_LOOT_Armbands|r
    .complete 11,1 -- Painted Gnoll Armband (8)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
step << Warrior
    .money >0.3129
    #era
    >>杀死 |cRXP_ENEMY_Riverpaw Runts|r 和 |cRXP_ENEMY_Riverpaw Outrunners|r
    >>|cRXP_WARN_磨练直到你有 31s 29c+ 的可出售物品和金钱。这是用于投掷、双手锤和双手剑训练。它还用于购买 3 级投掷武器，并很快飞往暴风城|r
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,25.9,93.9
step << !Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .target 杜汉元帅
    .goto Elwynn Forest,42.105,65.927
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    .isQuestComplete 176
step << !Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .target 杜汉元帅
    .goto Elwynn Forest,42.105,65.927
    .turnin 123 >>交任务: |cRXP_FRIENDLY_收货人|r
    .isOnQuest 123
step
    .goto Elwynn Forest,24.234,74.450
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瑞尼尔副队长|r
    .turnin 11 >>交任务: |cRXP_FRIENDLY_悬赏河爪豺狼人|r
    .target 副总统雷纳
step
    #completewith WestEntry
    .goto Westfall,59.95,19.35
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_农夫法布隆|r
    .target 农夫法布罗
    .goto Westfall,59.95,19.35
    .turnin 184 >>交任务: |cRXP_FRIENDLY_法布隆的地契|r
    .isOnQuest 184
step
    #label WestEntry
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_农夫法布隆|r, |cRXP_FRIENDLY_弗娜·法布隆|r
    .accept 64 >>接任务: |cRXP_LOOT_遗失的怀表|r
    .goto Westfall,59.95,19.35
    .accept 151 >>接任务: |cRXP_LOOT_老马布兰契|r
    .accept 36 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .goto Westfall,59.92,19.42
    .target 农夫法布罗
	.target 维尔纳·法布罗
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_农夫萨丁|r
    .target Farmer Saldean
    .goto Westfall,56.04,31.23
    .accept 9 >>接任务: |cRXP_LOOT_清理荒野|r
step
    .goto Westfall,56.416,30.519
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨尔玛·萨丁|r
    .turnin 36 >>交任务: |cRXP_FRIENDLY_杂味炖肉|r
    .target Salma Saldean
    .accept 38 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .accept 22 >>接任务: |cRXP_LOOT_猪肝馅饼|r
step
    #softcore
    #completewith next
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .target Spirit Healer
step
    .goto Westfall,56.327,47.520
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 109 >>交任务: |cRXP_FRIENDLY_向格里安·斯托曼报到|r
    .target 格里安·斯托曼托
    .accept 12 >>接任务: |cRXP_LOOT_西部荒野人民军|r
step
    #era
    .goto Westfall,56.421,47.623
    .target 丹努文船长
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达努温上尉|r
    .accept 102 >>接任务: |cRXP_LOOT_西部荒野的豺狼人|r
step << Human
    .goto Westfall,57.002,47.169
    .target Quartermaster Lewis
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_军需官刘易斯|r
    .accept 6181 >>接任务: |cRXP_LOOT_快递消息|r
    .vendor >>|cRXP_WARN_供应商垃圾|r
step << Rogue
    #era
    .money >0.3152
    +|cRXP_WARN_升级直到你有 31s 52c 的可销售物品/money|r
step << Rogue
    #som
    .money >0.3197
    +升级直到你有 31s 97c 的可销售物品/money
    --Not taking into account Shipment q turnin money so its insurance money
step << Human
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .turnin 6181 >>交任务: |cRXP_FRIENDLY_快递消息|r
    .accept 6281 >>接任务: |cRXP_LOOT_赶赴暴风城|r
    .target Thor
step
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .fly Stormwind >>飞往暴风城
    .target Thor
step << Rogue
    #som
    >>进入大楼
    .goto StormwindClassic,57.32,62.08,20,0
    .goto StormwindClassic,58.37,61.69
    .vendor >>从 Thurman 购买 11 级投掷物。当你达到 11 级时装备它
step << Rogue
    #era
    .goto StormwindClassic,57.32,62.08,20,0
    .goto StormwindClassic,58.362,61.678
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨尔曼·穆比|r
    .vendor >>|cRXP_WARN_购买 a|r |T135641:0|t[平衡投掷匕首]|cRXP_WARN_。装备它|r
    .target Thurman Mullby
step
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_摩根·匹斯特|r
    .turnin 61,1 >>交任务: |cRXP_FRIENDLY_送往暴风城的货物|r
    >>|cRXP_WARN_我们选择|r |T132383:0|t[Explosive Rockets] |cRXP_WARN_作为奖励。它能造成不错的伤害，而且可以用于“分裂拉动”，非常有用|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >>|cRXP_WARN_点击此处查看“分体拉动”的视频参考。这是一个简短的视频，非常值得学习|r
    .target Morgan Pestle
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吴平|r
    .target Woo Ping
    .goto StormwindClassic,57.129,57.698
    .trainer >>训练 1h 剑 << Rogue
    .trainer >>火车五线谱 << Warlock/Priest
    .trainer >>训练 2h 剑 << Warrior/Paladin
    >>|cRXP_WARN_如果你有足够的钱，就训练双手剑。你必须节省 20 秒以备后用|r << Warrior
    >>|cRXP_WARN_如果你还有钱，也可以训练单手剑|r << Mage/Warlock
step << Rogue
    .goto StormwindClassic,57.547,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_冈瑟尔·维勒|r
    .target Gunther Weller
    .vendor >>|cRXP_WARN_购买 a|r |T135346:0|t[弯刀] |cRXP_WARN_并将其装备在你的主手上|r
step
    .goto StormwindClassic,52.623,65.701
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板奥里森|r
    .home >>将你的炉石设置为暴风城
    .target Innkeeper Allison
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往被屠宰的羔羊并下楼
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑暗缚灵者加科因|r
    .turnin 1685 >>交任务: |cRXP_FRIENDLY_加科因的召唤|r
    .target Gakin the Darkbinder
    .accept 1688 >>接任务: |cRXP_LOOT_苏伦娜·凯尔东|r
step << Warlock
    #softcore
    .deathskip >>通过使用生命分流并站在你旁边的篝火上，在灵魂治疗师处死亡并重生
step << Warlock
    .goto Elwynn Forest,42.105,65.927
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
step << Warlock
    .isOnQuest 123
    .goto Elwynn Forest,42.105,65.927
    .target 杜汉元帅
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    >>|cRXP_WARN_选择|r |T135145:0|t[|cRXP_FRIENDLY_Balanced Fighting Stick|r] |cRXP_WARN_作为你的奖励。装备它|r
    .turnin 123 >>交任务: |cRXP_FRIENDLY_收货人|r
    .accept 147 >>接任务: |cRXP_WARN_猎杀收货人|r
step << Warlock
    .goto Elwynn Forest,42.105,65.927
    .target 杜汉元帅
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    >>|cRXP_WARN_选择|r |T135145:0|t[|cRXP_FRIENDLY_Balanced Fighting Stick|r] |cRXP_WARN_作为你的奖励。装备它|r
step << Warlock
    .isQuestTurnedIn 123
    .goto Elwynn Forest,42.105,65.927
    .target 杜汉元帅
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .accept 147 >>接任务: |cRXP_WARN_猎杀收货人|r
step << Warlock
    .xp 11 >>升级至 11
step << Warlock
    #completewith LockVW
    .goto Elwynn Forest,71.0,80.8,150 >>前往布拉克韦尔南瓜园
    >>|cRXP_WARN_途中磨练。尝试提升你的法杖技能，以便日后使用|r
step << Warlock
    .isOnQuest 147
    .goto Elwynn Forest,71.10,80.66
    >>杀死 |cRXP_ENEMY_Surena Caledon|r。为她搜刮财物 |cRXP_LOOT_Choker|r
    >>杀死 |cRXP_ENEMY_收藏家摩根|r。从他身上搜刮 |cRXP_LOOT_收藏家的戒指|r
    >>|cRXP_WARN_集中精力快速杀死|cRXP_ENEMY_Surena Caledon|r|r
    >>|cRXP_WARN_持续施放|r |T136183:0|t[恐惧] |cRXP_WARN_on |cRXP_ENEMY_Morgan the Collector|r|r
    .complete 1688,1 --Surena's Choker (1)
    .complete 147,1 -- The Collector's 戒指 (1)
    .mob Surena Caledon
    .mob Morgan the Collector
step << Warlock
    #label LockVW
    .goto Elwynn Forest,71.10,80.66
    >>杀死 |cRXP_ENEMY_Surena Caledon|r。为她搜刮财物 |cRXP_LOOT_Choker|r
    >>|cRXP_WARN_集中精力快速杀死|cRXP_ENEMY_Surena Caledon|r|r
    >>|cRXP_WARN_持续施放|r |T136183:0|t[恐惧] |cRXP_WARN_on |cRXP_ENEMY_Morgan the Collector|r|r
    .complete 1688,1 --Surena's Choker (1)
    .mob Surena Caledon
step << Warlock
    .goto Elwynn Forest,79.457,68.789
    .target Sara Timberlain
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨拉·迪博雷恩|r
    .turnin 59 >>交任务: |cRXP_FRIENDLY_布甲和皮甲|r
step << Warlock
    #completewith next
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    >>|cRXP_WARN_Grind 途中。请确保您至少有 2|r |T134075:0|t[灵魂碎片] |cRXP_WARN_通过使用|r |T136163:0|t[吸取灵魂]
    .collect 6265,2 --Soul Shard (2)
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Parker|r
    .target Guard Parker
    .goto Redridge Mountains,17.4,69.6
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
step << Warlock
    .goto Redridge Mountains,18.581,69.208,15,0
    .goto Redridge Mountains,23.325,71.373,25,0
    .goto Redridge Mountains,29.565,67.930,25,0
    .goto Redridge Mountains,30.733,59.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_菲尔顿副队长|r
    >>|cRXP_WARN_坚持走主干道，避免途中遇到任何近距离人群|r
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .target Deputy Feldon
step << Warlock
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
    .fp Redridge Mountains >>获取赤脊山飞行路线
    .fly Stormwind >>飞往暴风城
    .target Ariena Stormfeather
step << Warlock
    .isQuestComplete 147
    #completewith next
    .goto Elwynn Forest,42.105,65.927,100 >>前往: |cRXP_PICK_艾尔文森林|r
step << Warlock
    .isQuestComplete 147
    .goto Elwynn Forest,42.105,65.927
    .target 杜汉元帅
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 147 >>交任务: |cRXP_FRIENDLY_猎杀收货人|r
step << Warlock
    #completewith TravelIF
    .isQuestTurnedIn 147
    .goto StormwindClassic,70.07,86.82
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .zoneskip Elwynn Forest,1
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往被屠宰的羔羊并下楼
step << Warlock
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厄苏拉·德林|r
    .trainer >>训练你的职业法术
    .target Ursula Deline
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑暗缚灵者加科因|r
    .turnin 1688 >>交任务: |cRXP_FRIENDLY_苏伦娜·凯尔东|r
    .accept 1689 >>接任务: |cRXP_LOOT_誓缚|r
    .target Gakin the Darkbinder
step << Warlock
    #completewith next
    .goto StormwindClassic,25.2,80.7,18,0
    .goto StormwindClassic,23.2,79.5,18,0
    .goto StormwindClassic,26.3,79.5,18,0
    .goto StormwindClassic,25.154,77.406
    >>|cRXP_WARN_前往被屠宰的羔羊底部|r
    .cast 7728 >>|cRXP_WARN_使用|r |T133292:0|t[血石颈链] |cRXP_WARN_召唤|r |cRXP_ENEMY_虚空行者|r
    .use 6928
step << Warlock
    .goto StormwindClassic,25.154,77.406
    .use 6928 >>杀死|cRXP_ENEMY_Summoned Voidwalker|r
    .complete 1689,1 --Kill Summoned Voidwalker (x1)
    .mob Summoned Voidwalker
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑暗缚灵者加科因|r
    .target Gakin the Darkbinder
    .goto StormwindClassic,25.25,78.59
    .turnin 1689 >>交任务: |cRXP_FRIENDLY_誓缚|r
step << Human
    .goto StormwindClassic,74.312,47.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥斯瑞克·斯图恩|r
    .turnin 6281 >>交任务: |cRXP_FRIENDLY_赶赴暴风城|r
    .target Osric Strang
    .accept 6261 >>接任务: |cRXP_LOOT_杜加尔·朗德瑞克|r
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈里·伯加德|r
    .target Harry Burlguard
    .goto StormwindClassic,74.249,37.244
    .turnin 1638 >>交任务: |cRXP_FRIENDLY_战士的训练|r
    .accept 1639 >>接任务: |cRXP_LOOT_醉鬼巴特莱比|r
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴特莱比|r
    .target Bartleby
    .goto StormwindClassic,73.787,36.323
    .turnin 1639 >>交任务: |cRXP_FRIENDLY_醉鬼巴特莱比|r
    .accept 1640 >>接任务: |cRXP_LOOT_击败巴特莱比|r
step << Warrior
    .goto StormwindClassic,73.787,36.323
    >>攻击 |cRXP_ENEMY_Bartleby|r。他将在 1% 时投降
    .complete 1640,1 --Beat Bartleby
    .mob Bartleby
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴特莱比|r
    .target Bartleby
    .goto StormwindClassic,73.787,36.323
    .turnin 1640 >>交任务: |cRXP_FRIENDLY_击败巴特莱比|r
    .accept 1665 >>接任务: |cRXP_LOOT_巴特莱比的酒杯|r
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈里·伯加德|r
    .target Harry Burlguard
    .goto StormwindClassic,74.249,37.244
    .turnin 1665 >>交任务: |cRXP_FRIENDLY_巴特莱比的酒杯|r
step << Priest
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .target High Priestess Laurena
    .goto StormwindClassic,38.54,26.86
    .trainer >>训练你的职业法术
    .turnin 5635 >>交任务: |cRXP_FRIENDLY_绝望祷言|r
step << Priest
    .goto StormwindClassic,38.62,26.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .train 13908 >>列车 |T135954:0|t[绝望的祈祷]
    .target High Priestess Laurena
step
    .goto StormwindClassic,51.757,12.091
    .target Grimand Elmore
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞曼德·艾尔默|r
    .turnin 1097 >>交任务: |cRXP_FRIENDLY_艾尔默的任务|r
step
    .goto StormwindClassic,51.757,12.091
    .target Grimand Elmore
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞曼德·艾尔默|r
    .accept 353 >>接任务: |cRXP_LOOT_雷矛的包裹|r
step << Warrior
    #completewith next
    +|cRXP_WARN_将|r |T132363:0|t[破甲] |cRXP_WARN_放在你的动作条上并确保不断使用它。它比使用|r |T132282:0|t[英勇打击]更有效
step << Warrior/Paladin/Rogue
    .goto StormwindClassic,56.3,17.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯塔·深炉|r
    .vendor >>|cRXP_WARN_购买 a|r |T134708:0|t[Mining Pick]|cRXP_WARN_。你很快就会训练|r |T134708:0|t[Mining] |cRXP_WARN_|r
    .target Kaita Deepforge
step
    #label TravelIF
    #completewith next
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    >>|cRXP_WARN_等待电车时，如果需要，请升级您的|r|T135966:0|t[急救]|cRXP_WARN_|r
step
    >>|cRXP_WARN_电车到达后上车。在另一侧下车，在中间站台寻找 |cRXP_FRIENDLY_Monty|r|r
    >>|cRXP_WARN_施放|r |T136221:0|t[召唤虚空行者] |cRXP_WARN_and|r |T135230:0|t[制造生命石] |cRXP_WARN_while 等待|r << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_蒙提|r
    .accept 6661 >>接任务: |cRXP_LOOT_捕捉矿道老鼠|r
    .target Monty
step
    .use 17117 >>|cRXP_WARN_使用|r |T133942:0|t[捕鼠者长笛] |cRXP_WARN_on|r |cRXP_ENEMY_Deeprun Rats|r
    .complete 6661,1 --Rats Captured (x5)
    .mob Deeprun Rat
step
    .target Monty
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_蒙提|r
    .turnin 6661 >>交任务: |cRXP_FRIENDLY_捕捉矿道老鼠|r
step
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
step
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fp Ironforge >>获取铁炉堡飞行路线
    .target Gryth Thurden
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_比克斯|r, |cRXP_FRIENDLY_布里维夫·石拳|r
    .train 2567 >>火车被抛
    .goto Ironforge,62.237,89.628
    .train 199 >>训练 2h Maces
    .goto Ironforge,61.177,89.508
    .target 比西·沃布尔邦克
    .target 布里维夫·石手
step << Warrior
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布雷文·寒钢|r, 他在楼下
    .vendor >>|cRXP_WARN_购买|r|T135641:0|t[平衡投掷匕首]并装备它|r
    .target Brenwyn Wintersteel
step
    #ah
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to an |cRXP_FRIENDLY_Ironforge Auctioneer|r
    >>购买以下物品即可快速在洛克莫丹完成交付
    >>这将节省你的时间，因为你不需要到处寻找怪物来杀死。如果你不想购买任何怪物，请跳过此步骤
    >>|T134342:0|t[野猪肠]
    >>|T134027:0|t[熊肉]
    >>|T134437：0|吨[蜘蛛脓液]
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- 熊 Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .target Auctioneer Lympkin
    .target Auctioneer Redmuse
    .target Auctioneer Buckler

step << skip
    #sticky
    #som
    #completewith next
    .goto Dun Morogh,53.5,34.9,100 >>跑出铁炉堡
    >>装备你的11级投掷 << Warrior
step << skip
    #sticky
    #era
    #completewith next
    .goto Dun Morogh,53.5,34.9,100 >>跑出铁炉堡
    >>装备你的 3 级投掷 << Warrior

step
	.goto Dun Morogh,53.5,34.9,60,0
    .goto Dun Morogh,52.251,37.592,150 >>前往: |cRXP_PICK_丹莫罗|r
step
    #completewith next
    .goto Dun Morogh,46.005,48.637,50 >>前往卡拉诺斯
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉兹·滑链|r
    .target Razzle Sprysprocket
    .goto Dun Morogh,46.005,48.637,10,0
    .goto Dun Morogh,45.846,49.365
    .accept 412 >>接任务: |cRXP_LOOT_自动净化装置|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_森内尔·白须|r
    .target Senir Whitebeard
    .goto Dun Morogh,46.726,53.826
    .accept 287 >>接任务: |cRXP_LOOT_霜鬃巨魔要塞|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图德拉·马克格拉恩|r
    .target Tundra MacGrann
    .goto Dun Morogh,34.578,57.732,100,0
    .goto Dun Morogh,36.654,51.906,40,0
    .goto Dun Morogh,34.577,51.652
    .accept 312 >>接任务: |cRXP_LOOT_马克格拉恩的干肉|r
step << !Mage !Warlock
    .goto Dun Morogh,38.517,53.927
    >>打开 |cRXP_PICK_MacGrann 的肉柜|r。获取 |cRXP_LOOT_MacGrann 的干肉|r
    >>|cRXP_WARN_等待 |cRXP_ENEMY_Old Icebeard|r 从洞穴中巡逻出来。一旦他从洞穴中巡逻出来，你就可以进入并抢劫|r |cRXP_PICK_MacGrann 的肉柜|r
    .link https://www.youtube.com/watch?v=o55Y3LjgKoE >>|cRXP_WARN_点击此处查看视频参考|r
    .complete 312,1 --MacGrann's Dried Meats (1)
step << Mage/Warlock
    .goto Dun Morogh,38.517,53.927
    >>|cRXP_WARN_施法|r |T136071:0|t[变形] |cRXP_WARN_on|r |cRXP_ENEMY_Old Icebeard|r << Mage
    >>|cRXP_WARN_施法|r |T136183:0|t[恐惧] |cRXP_WARN_on|r |cRXP_ENEMY_Old Icebeard|r << Warlock
    >>打开 |cRXP_PICK_MacGrann 的肉柜|r。获取 |cRXP_LOOT_MacGrann 的干肉|r
    .complete 312,1 --Collect MacGrann's Dried Meats (x1)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图德拉·马克格拉恩|r
    .target Tundra MacGrann
    .goto Dun Morogh,34.577,51.652
    .turnin 312 >>交任务: |cRXP_FRIENDLY_马克格拉恩的干肉|r
step
    .goto Dun Morogh,27.2,43.0,60,0
    .goto Dun Morogh,24.8,39.3,60,0
    .goto Dun Morogh,25.6,43.4,60,0
    .goto Dun Morogh,24.3,44.0,60,0
    .goto Dun Morogh,25.4,45.4,60,0
    .goto Dun Morogh,25.00,43.50
    >>杀死 |cRXP_ENEMY_Leper Gnomes|r。掠夺他们的 |cRXP_LOOT_Gears|r 和 |cRXP_LOOT_Cogs|r
    .complete 412,2 --Collect Gyromechanic Gear (x8)
    .complete 412,1 --Collect Restabilization Cog (x8)
    .mob Leper Gnome
step
    #completewith next
    .goto Dun Morogh,24.509,50.831,20 >>进入霜鬃要塞
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Frostmane Headhunters|r
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob Frostmane Headhunter
step
    >>|cRXP_WARN_跳到这个位置探索霜鬃要塞。如果下面有怪物，正常清理周围，不要跳下去|r
    .goto Dun Morogh,22.86,52.16
    .complete 287,2 --Fully explore Frostmane Hold
step
    .goto Dun Morogh,24.5,50.8,40,0
    .goto Dun Morogh,22.1,50.3,40,0
    .goto Dun Morogh,21.3,52.9,40,0
    .goto Dun Morogh,24.5,50.8,0
    .goto Dun Morogh,22.1,50.3,0
    .goto Dun Morogh,21.3,52.9,0
    >>杀死 |cRXP_ENEMY_Frostmane Headhunters|r
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob Frostmane Headhunter
step
    #completewith next
    .goto Dun Morogh,45.846,49.365,150 >>前往卡拉诺斯
step
    .goto Dun Morogh,46.005,48.637,8,0
    .goto Dun Morogh,45.846,49.365
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉兹·滑链|r
    .target Razzle Sprysprocket
    .turnin 412 >>交任务: |cRXP_FRIENDLY_自动净化装置|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_森内尔·白须|r
    .target Senir Whitebeard
    .goto Dun Morogh,46.726,53.826
    .turnin 287 >>交任务: |cRXP_FRIENDLY_霜鬃巨魔要塞|r
    .accept 291 >>接任务: |cRXP_LOOT_森内尔的报告|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁德拉·冻石|r
    .target Rudra Amberstill
    .goto Dun Morogh,60.1,52.6,50,0
    .goto Dun Morogh,63.082,49.851
    .accept 314 >>接任务: |cRXP_LOOT_保护牲畜|r
step
    #completewith next
    .goto Dun Morogh,62.3,50.3,14,0
    .goto Dun Morogh,62.2,49.4,10 >>跑上这一段山路
step
    .goto Dun Morogh,62.6,46.1
    >>杀死 |cRXP_ENEMY_Vagash|r。夺取他的 |cRXP_LOOT_Fang|r
    >>|cRXP_WARN_这个任务很难。如果需要，可以帮他找个小队。如果你找不到小队或者无法单独完成，可以跳过此步骤|r
    >>|cRXP_WARN_在你尝试杀死 |cRXP_ENEMY_Vagash|r 之前，请观看下面的视频。它可以在任何班级单独完成|r
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >>|cRXP_WARN_点击此处查看视频参考|r
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob Vagash
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁德拉·冻石|r
    .target Rudra Amberstill
    .goto Dun Morogh,63.082,49.851
    .turnin 314 >>交任务: |cRXP_FRIENDLY_保护牲畜|r
step
    .goto Dun Morogh,68.379,54.492
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厨师格瑞姆|r
    .train 2550 >>训练 |T133971:0|t[烹饪]
    .target Cook Ghilm
step
    .goto Dun Morogh,68.614,54.643
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡杉·莫格什|r
    .vendor >>|cRXP_BUY_购买|r |T133968:0|t[新鲜出炉的面包] |cRXP_BUY_如果需要|r << Warrior/Rogue
    .vendor >>|cRXP_BUY_购买|r |T133968:0|t[新鲜出炉的面包] |cRXP_BUY_和|r |T132815:0|t[冰牛奶] |cRXP_BUY_如果需要|r << !Warrior !Rogue
    .target Kazan Mogosh
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_参议员梅尔·圣石|r, |cRXP_FRIENDLY_工头乔尼·石眉|r
    .accept 433 >>接任务: |cRXP_LOOT_公众之仆|r
    .goto Dun Morogh,68.671,55.969
    .accept 432 >>接任务: |cRXP_LOOT_该死的石腭怪！|r
    .goto Dun Morogh,69.084,56.330
    .target 参议员梅尔·斯通哈洛
    .target 工头石眉
step << Warrior/Paladin/Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_丹克·利刃|r
    .goto Dun Morogh,69.324,55.456
    .train 2575 >>列车 |T134708:0|t[采矿]
step << Warrior/Paladin/Rogue
    .cast 2580 >>|cRXP_WARN_Cast|r |T136025:0|t[寻找矿物]
step
    .goto Dun Morogh,70.7,56.4,40,0
    .goto Dun Morogh,70.62,52.39,25,0
    .goto Dun Morogh,70.7,56.4
    >>杀死 |cRXP_ENEMY_Rockjaw Skullthumpers|r 和 |cRXP_ENEMY_岩颚骨撕咬者s|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .complete 433,1 --Kill 岩颚骨撕咬者 (x10)
    .mob Rockjaw Skullthumper
    .mob 岩颚骨撕咬者
step << !Warlock
    .xp 10+6350 >>升级至 6350+/7600
step << Warlock
    .xp 12
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头乔尼·石眉|r, |cRXP_FRIENDLY_参议员梅尔·圣石|r
    .turnin 432 >>交任务: |cRXP_FRIENDLY_该死的石腭怪！|r
    .goto Dun Morogh,69.084,56.330
    .turnin 433 >>交任务: |cRXP_FRIENDLY_公众之仆|r
    .goto Dun Morogh,68.671,55.969
    .target 参议员梅尔·斯通哈洛
    .target 工头石眉
step
    .goto Dun Morogh,68.614,54.643
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡杉·莫格什|r
    .vendor >>|cRXP_WARN_供应商垃圾|r << !Priest !Warlock !Mage
    .vendor >>|cRXP_BUY_购买 20|r |T132815:0|t[冰镇牛奶] << Priest/Warlock/Mage
    .target Kazan Mogosh
step << !Warlock
    .xp 11
step
    .goto Dun Morogh,81.2,42.7,45,0
    .goto Dun Morogh,83.892,39.188
    .target Pilot Hammerfoot
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_驾驶员塞克·锤足|r
    .accept 419 >>接任务: |cRXP_LOOT_失踪的驾驶员|r
step
    >>点击|cRXP_PICK_Dwarven Corpse|r
    .goto Dun Morogh,79.672,36.171
    .turnin 419 >>交任务: |cRXP_FRIENDLY_失踪的驾驶员|r
    .accept 417 >>接任务: |cRXP_LOOT_驾驶员的复仇|r
step
    >>杀死 |cRXP_ENEMY_Mangeclaw|r。掠夺他的 |cRXP_LOOT_Claw|r
    .goto Dun Morogh,78.97,37.14
    .complete 417,1 --Collect Mangy Claw (x1)
    .unitscan Mangeclaw
step
    #som
    .goto Dun Morogh,83.892,39.188
    >>选择匕首，将其用作副手，直到获得一把供应商剑 << Rogue
    .target Pilot Hammerfoot
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_驾驶员塞克·锤足|r
    .turnin 417 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_驾驶员塞克·锤足|r
    >>|cRXP_WARN_选择|r |T135641:0|t[|cRXP_FRIENDLY_工匠匕首|r] |cRXP_WARN_作为奖励。将其装备在你的副手中|r << Rogue
    .target Pilot Hammerfoot
    .goto Dun Morogh,83.892,39.188
    .turnin 417 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r
step
    .goto Dun Morogh,84.4,31.1,25 >>前往: |cRXP_PICK_洛克莫丹|r
]])

RXPGuides.RegisterGuide([[
#hardcore
#classic
#era/som--h
<< Alliance
#name 11-13 洛克莫丹
#version 1
#group RestedXP 生存指南（A）
#subgroup RXP 生存指南 1-20
#defaultfor Human
#next 13-15 西部荒野

step
    #completewith next
    .goto Loch Modan,24.134,18.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高索·布鲁姆|r
    .vendor >>|cRXP_WARN_如果需要，请联系供应商并进行维修|r
    .target Gothor Brumn
step
.group
    .goto Loch Modan,24.764,18.397
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巡山人雷矛|r
    .turnin 353 >>交任务: |cRXP_FRIENDLY_雷矛的包裹|r
    .target 巡山人雷矛
    .accept 307 >>接任务: |cRXP_LOOT_肮脏的爪子|r
    >>|cRXP_WARN_暂时不接受 Stormpike 的命令|r
step
.solo
    .goto Loch Modan,24.764,18.397
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巡山人雷矛|r
    .turnin 353 >>交任务: |cRXP_FRIENDLY_雷矛的包裹|r
    .target 巡山人雷矛
    >>|cRXP_WARN_暂时不接受 Stormpike 的命令|r
step
    #completewith ThelsamarFirst
    >>杀死 |cRXP_ENEMY_黑熊长老s|r。掠夺他们的 |cRXP_LOOT_熊 Meat|r
    >>杀死 |cRXP_ENEMY_山野猪s|r。掠夺它们的 |cRXP_LOOT_Boar Intestines|r
    >>杀死 |cRXP_ENEMY_森林潜伏者s|r。掠夺他们的 |cRXP_LOOT_Ichor|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .collect 3173,3,418,1 --Collect 熊 Meat (x3)
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    >>|cRXP_WARN_保存任何|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_WARN_用于升级|T133971:0|t[烹饪] |cRXP_WARN_later|r
    .mob 黑熊长老
    .mob 山野猪
    .mob 森林潜伏者
step
    #completewith next
    .goto Loch Modan,34.828,49.283,130 >>前往塞尔萨玛
step
    #label ThelsamarFirst
    .goto Loch Modan,34.828,49.283
    .target 维德拉炉灶
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维德拉·壁炉|r
    .accept 418 >>接任务: |cRXP_LOOT_塞尔萨玛血肠|r
step
    #competewith StormpikeO
    .abandon 1338 >>放弃 Stormpike 的命令。这将解锁登山者 Stormpike 的任务，这将在
step
    #completewith next
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅尼·铁心|r
    .vendor >>|cRXP_WARN_购买 1 或 2|r |T133634:0|t[小棕色袋] |cRXP_WARN_如果需要|r
    .target Yanni Stoutheart
step
    #label StormpikeO
    .goto Loch Modan,35.534,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r
    .vendor 6734 >>|cRXP_BUY_购买|r |T133968:0|t[新鲜出炉的面包]|cRXP_BUY_。目标是拥有大约 20 个|r << Warrior/Rogue
    .vendor 6734 >>|cRXP_BUY_Buy|r |T133968:0|t[新鲜出炉的面包] |cRXP_BUY_and|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_。目标是拥有大约 10|r |T133968:0|t[新鲜出炉的面包] |cRXP_BUY_and 20|r |T132815:0|t[冰镇牛奶] << !Warrior !Rogue
    .target Innkeeper Hearthstove
step
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巡山人卡德雷尔|r
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_巡逻塞尔萨玛的道路|r
    .accept 416 >>接任务: |cRXP_LOOT_狗头人的耳朵|r
    .accept 1339 >>接任务: |cRXP_LOOT_巡山人卡尔·雷矛的任务|r
    .target Mountaineer Kadrell
step
    .group
    #completewith BraveSoul
    >>杀死 |cRXP_ENEMY_黑熊长老s|r。掠夺他们的 |cRXP_LOOT_熊 Meat|r
    >>杀死 |cRXP_ENEMY_山野猪s|r。掠夺它们的 |cRXP_LOOT_Boar Intestines|r
    >>杀死 |cRXP_ENEMY_森林潜伏者s|r。掠夺他们的 |cRXP_LOOT_Ichor|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .collect 3173,3,418,1 --Collect 熊 Meat (x3)
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob 黑熊长老
    .mob 山野猪
    .mob 森林潜伏者
step
    .solo
    #completewith StormpikeStop
    >>杀死 |cRXP_ENEMY_黑熊长老s|r。掠夺他们的 |cRXP_LOOT_熊 Meat|r
    >>杀死 |cRXP_ENEMY_山野猪s|r。掠夺它们的 |cRXP_LOOT_Boar Intestines|r
    >>杀死 |cRXP_ENEMY_森林潜伏者s|r。掠夺他们的 |cRXP_LOOT_Ichor|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .collect 3173,3,418,1 --Collect 熊 Meat (x3)
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob 黑熊长老
    .mob 山野猪
    .mob 森林潜伏者
step
    .group
    #completewith MinerGear
    >>杀死 |cRXP_ENEMY_Tunnel Rats|r。掠夺他们的 |cRXP_LOOT_Ears|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Vermin
    .mob 隧道鼠觅食器
    .mob 隧道鼠风水师
    .mob Tunnel Rat Digger
    .mob 隧道鼠勘测员
step
    .group
    #label BraveSoul
    #completewith next
    .goto Loch Modan,35.50,18.97,20 >>进入银溪矿井
step
    .group
    #label MinerGear
    .goto Loch Modan,35.93,22.55
    >>打开 |cRXP_PICK_Miners' League Crates|r。从中获取 |cRXP_LOOT_Miners' Gear|r
    >>|cRXP_WARN_|cRXP_PICK_Miners' League Crates|r 可以在整个矿井中找到|r
    >>|cRXP_WARN_如果你现在想跳过这个任务，你可以在更高的等级上完成它|r
    .complete 307,1 -- Miners' Gear (4)
step
    .group
    #completewith StormpikeStop
    >>杀死 |cRXP_ENEMY_黑熊长老s|r。掠夺他们的 |cRXP_LOOT_熊 Meat|r
    >>杀死 |cRXP_ENEMY_山野猪s|r。掠夺它们的 |cRXP_LOOT_Boar Intestines|r
    >>杀死 |cRXP_ENEMY_森林潜伏者s|r。掠夺他们的 |cRXP_LOOT_Ichor|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .collect 3173,3,418,1 --Collect 熊 Meat (x3)
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob 黑熊长老
    .mob 山野猪
    .mob 森林潜伏者
step << Paladin/Warrior
    .goto Loch Modan,42.867,9.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尼尔伦·安德玛|r
    .vendor >>|cRXP_FRIENDLY_Nillen Andemar|r |cRXP_WARN_销售|r |T133476:0|t[|cRXP_FRIENDLY_重型尖刺狼牙棒|r] |cRXP_WARN_这是限量供应商品|r
    >>|cRXP_WARN_检查是否有货，如果可以的话就买。如果你买不起，就从附近的|cRXP_ENEMY_Tunnel Rats|r 那里赚钱，直到你有足够的钱|r
    >>|cRXP_WARN_尽快完成此操作，因为其他玩家可能会先于你购买|r
    .target Nillen Andemar
step
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82,50,0
    .goto Loch Modan,25.05,30.19,50,0
    .goto Loch Modan,26.06,43.44,50,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82
    >>杀死 |cRXP_ENEMY_Tunnel Rats|r。掠夺他们的 |cRXP_LOOT_Ears|r
    >>|cRXP_WARN_确保你有 10|r |T132889:0|t[亚麻布] |cRXP_WARN_for 即将进行的圣骑士职业任务|r << Paladin
    >>|cRXP_ENEMY_隧道鼠|r |cRXP_WARN_可以在整个洛克莫丹生成。查看你的世界地图以了解它们的位置|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .collect 2589,10,1644,1,1 << Paladin -- Linen Cloth (10)
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Vermin
    .mob 隧道鼠觅食器
    .mob 隧道鼠风水师
    .mob Tunnel Rat Digger
    .mob 隧道鼠勘测员
step
    #completewith StormpikeDelivery
    #label StormpikeStop
    .goto Loch Modan,24.134,18.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高索·布鲁姆|r
    .vendor >>|cRXP_WARN_如果需要，请联系供应商并进行维修|r
    .target Gothor Brumn
step
.group
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巡山人雷矛|r
    .turnin 307 >>交任务: |cRXP_FRIENDLY_肮脏的爪子|r
    .target 巡山人雷矛
step
    #label StormpikeDelivery
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巡山人雷矛|r
    .turnin 1339 >>交任务: |cRXP_FRIENDLY_巡山人卡尔·雷矛的任务|r
    .accept 1338 >>接任务: |cRXP_LOOT_卡尔·雷矛的订单|r
    .target 巡山人雷矛
step
    >>杀死 |cRXP_ENEMY_黑熊长老s|r。掠夺他们的 |cRXP_LOOT_熊 Meat|r
    >>杀死 |cRXP_ENEMY_山野猪s|r。掠夺它们的 |cRXP_LOOT_Boar Intestines|r
    >>杀死 |cRXP_ENEMY_森林潜伏者s|r。掠夺他们的 |cRXP_LOOT_Ichor|r
    .collect 3173,3,418,1 --熊 Meat (3)
    .goto Loch Modan,26.9,10.7,90,0
    .goto Loch Modan,30.9,10.6,90,0
    .goto Loch Modan,28.6,15.4,90,0
    .goto Loch Modan,30.5,26.6,90,0
    .goto Loch Modan,33.4,30.3,90,0
    .goto Loch Modan,39.4,33.3,90,0
    .goto Loch Modan,26.9,10.7,90,0
    .goto Loch Modan,30.9,10.6,90,0
    .goto Loch Modan,28.6,15.4,90,0
    .goto Loch Modan,30.5,26.6,90,0
    .goto Loch Modan,33.4,30.3,90,0
    .goto Loch Modan,39.4,33.3,90,0
    .goto Loch Modan,26.9,10.7
    .collect 3172,3,418,1 --Boar Intestines (3)
    .goto Loch Modan,38.0,34.9,90,0
    .goto Loch Modan,37.1,39.8,90,0
    .goto Loch Modan,29.8,35.9,90,0
    .goto Loch Modan,27.7,25.3,90,0
    .goto Loch Modan,28.6,22.6,90,0
    .goto Loch Modan,38.0,34.9,90,0
    .goto Loch Modan,37.1,39.8,90,0
    .goto Loch Modan,29.8,35.9,90,0
    .goto Loch Modan,27.7,25.3,90,0
    .goto Loch Modan,28.6,22.6,90,0
    .goto Loch Modan,38.0,34.9
    .collect 3174,3,418,1 --Spider Ichor (3)
    .goto Loch Modan,31.9,16.4,90,0
    .goto Loch Modan,28.0,20.6,90,0
    .goto Loch Modan,33.8,40.5,90,0
    .goto Loch Modan,36.2,30.9,90,0
    .goto Loch Modan,39.0,32.1,90,0
    .goto Loch Modan,31.9,16.4,90,0
    .goto Loch Modan,28.0,20.6,90,0
    .goto Loch Modan,33.8,40.5,90,0
    .goto Loch Modan,36.2,30.9,90,0
    .goto Loch Modan,39.0,32.1,90,0
    .goto Loch Modan,31.9,16.4
    .mob 黑熊长老
    .mob 山野猪
    .mob 森林潜伏者
step
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巡山人卡德雷尔|r
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_巡逻塞尔萨玛的道路|r
    .target Mountaineer Kadrell
    .turnin 416 >>交任务: |cRXP_FRIENDLY_狗头人的耳朵|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维德拉·壁炉|r
    .target 维德拉炉灶
    .goto Loch Modan,34.828,49.283
    .turnin 418 >>交任务: |cRXP_FRIENDLY_塞尔萨玛血肠|r
step
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅尼·铁心|r
    >>|cRXP_WARN_购买一|r |T135237:0|t[燧石和火绒] |cRXP_WARN_以及 2|r |T135435:0|t[简易木材]|cRXP_WARN_。如果需要，购买任意|r|T133634:0|t[棕色小袋] |cRXP_WARN_|r
    .collect 4470,2 --Simple Wood (2)
    .collect 4471,1 --Flint and Tinder (1)
    .target Yanni Stoutheart
step
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索格拉姆·伯雷森|r
    .fp Thelsamar >>获取塞尔萨玛飞行路线
    .target Thorgrum Borrelson
step
    .goto Loch Modan,22.071,73.127
    .target 登山者科布尔弗林特
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巡山人库伯弗林特|r
    .accept 224 >>接任务: |cRXP_LOOT_保卫国王的领土|r
step
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格弗斯上尉|r
    .target 鲁格尔福斯上尉
    .accept 267 >>接任务: |cRXP_LOOT_穴居人的威胁|r
step
    #completewith next
    .goto Loch Modan,29.9,68.2,45,0
    .goto Loch Modan,30.76,69.97,20 >>前往 Stonesplinter Valley
step
    .goto Loch Modan,27.01,48.74,0
    .goto Loch Modan,27.68,56.83,0
    .goto Loch Modan,33.35,71.59,0
    .goto Loch Modan,31.54,74.96,0
    .goto Loch Modan,33.35,71.59,50,0
    .goto Loch Modan,31.54,74.96,45,0
    .goto Loch Modan,33.88,76.58,45,0
    .goto Loch Modan,27.01,48.74,40,0
    .goto Loch Modan,27.68,56.83,40,0
    .goto Loch Modan,33.35,71.59,50,0
    .goto Loch Modan,31.54,74.96,45,0
    .goto Loch Modan,33.88,76.58
    >>杀死 |cRXP_ENEMY_Stonesplinter Troggs|r 和 |cRXP_ENEMY_Stonesplinter Scouts|r。掠夺他们的 |cRXP_LOOT_Teeth|r
    >>|cRXP_WARN_确保你有 10|r |T132889:0|t[亚麻布] |cRXP_WARN_for 即将进行的圣骑士职业任务|r << Paladin
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .collect 2589,10,1644,1,1 << Paladin -- Linen Cloth (10)
    .mob Stonesplinter Trogg
    .mob Stonesplinter Scout
step << Warlock
    #completewith TroggT
    .money >0.7579
    .goto Loch Modan,32.7,76.5,0
    +升级 |cRXP_ENEMY_Troggs|r 直到你有价值 75s 79c 的供应商垃圾/money
step << Warlock
    #era
    .goto Loch Modan,32.7,76.5,0
    .xp 13+9600 >>升级直到 9600+/11400xp
step << Warlock
    #som--xpgate
    .xp 14-2520 >>努力学习直到你达到 8880xp 并进入第 13 级
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巡山人库伯弗林特|r
    .target 登山者科布尔弗林特
    .goto Loch Modan,22.071,73.127
    .turnin 224 >>交任务: |cRXP_FRIENDLY_保卫国王的领土|r
step
    #label TroggT
    .goto Loch Modan,23.233,73.675
    .target 鲁格尔福斯上尉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格弗斯上尉|r
    .turnin 267 >>交任务: |cRXP_FRIENDLY_穴居人的威胁|r
step << Warlock
    .xp 14 >>升级至 14
step
    #completewith next
    .hs >>炉火之城
step << Warlock/Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿德温·凯伦|r
    >>|cRXP_BUY_购买 a|r |T135468:0|t[Smoldering Wand]|cRXP_BUY_。15 级时装备它|r
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    .collect 5208,1 --Smoldering Wand (1)
    .target Ardwyn Cailen
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往被屠宰的羔羊并下楼
step << Warlock
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厄苏拉·德林|r
    .trainer >>训练你的职业法术
    .target Ursula Deline
step << Warlock
    .goto StormwindClassic,25.665,77.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯巴克尔|r
    .vendor >>|cRXP_BUY_购买|r |T133738:0|t[魔典：吞噬阴影（等级 1）] |cRXP_BUY_并且|r |T133738:0|t[魔典：牺牲（等级 1）] |cRXP_BUY_如果你能负担得起|r
    .target Spackle Thornberry
step << Mage
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >>前往法师塔
step << Mage
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾尔莎林|r
    .trainer >>训练你的职业法术
    .target Elsharin
step << Priest/Paladin
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step << Human Paladin
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .accept 1641 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1641 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Duthorian Rall
step << Human Paladin
    .goto StormwindClassic,39.80,29.77
    .use 6775>>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_The Tome of Divinity|r] 开始任务|r
    .accept 1642 >>接任务: |cRXP_LOOT_圣洁之书|r
step << Human Paladin
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin 1642 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1643 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Duthorian Rall
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_虔诚的亚瑟|r
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    .trainer >>训练你的职业法术
    .target Arthur the Faithful
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔舒修士|r
    .goto StormwindClassic,38.54,26.86
    .trainer >>训练你的职业法术
    .target Brother Joshua
step
    .goto StormwindClassic,58.091,16.552
    .target Furen Longbeard
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗伦·长须|r
    .turnin 1338 >>交任务: |cRXP_FRIENDLY_卡尔·雷矛的订单|r
step << Rogue
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wu|r or |cRXP_FRIENDLY_Ilsa|r
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >>训练你的职业法术
    .target Wu Shen
    .target Ilsa Corbin
step << Human Paladin
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯蒂芬妮·特纳|r
    .turnin 1643 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Stephanie Turner
    .accept 1644 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1644 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    --.accept 1780 >>接任务: |cRXP_LOOT_圣洁之书|r
step
    .goto StormwindClassic,66.28,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .turnin 6261 >>交任务: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .target Dungar Longdrink
    .accept 6285 >>接任务: |cRXP_LOOT_返回西部荒野|r
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师亚克森|r
    >>购买以下物品可快速在西部荒野上交
    >>这将节省你的时间，因为你不需要到处寻找怪物来杀死。如果你不想购买任何怪物，请跳过此步骤
    >>|T133972:0|t[细长的秃鹫肉]
    >>|T133884:0|t[鱼人之眼]
    >>|T135997:0|t[血牙獠牙]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙肝]
    >>|T132794:0|t[一瓶油]
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- 好的ra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    .collect 814,5,103,1 -- Flask of Oil (5)
    .target Auctioneer Jaxon
step
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Westfall >>飞往西部荒野
    .target Dungar Longdrink
]])
