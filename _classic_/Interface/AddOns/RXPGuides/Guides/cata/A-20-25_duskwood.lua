local _,addon = ...
if addon.gameVersion < 40000 or addon.player.faction == 'Horde' then return end
RXPGuides.RegisterGuide([[

#version 1
#group RXP 大地的裂变 1-80 (联盟) << cata
#group RestedXP 熊猫人之谜 1-60 (联盟) << mop
#cata
#mop
#name 20-25 暮色森林
#displayname 21-26 暮色森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 25-30 北荆棘谷


<<Alliance


step
    .goto 47,93.30,12.00
    .zone 47 >>前往: |cRXP_PICK_暮色森林|r
step
    .goto 47,78.74,44.53,8,0
    .goto 47,79.09,44.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_Tobias|r交谈
    .accept 26666 >>接任务: |cRXP_LOOT_斯塔文的传说|r
	.target Tobias Mistmantle
step
    .goto 47,87.43,35.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚伯克隆比|r交谈
    .accept 26653 >>接任务: |cRXP_LOOT_来自夜色镇的货物|r
	.target Abercrombie
step
    .goto 47,77.48,44.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Felicia|r交谈
    .fp Darkshire >>获取夜色镇飞行路线
	.target Felicia Maline
step
    .goto 47,75.56,45.37,8,0
    .goto 47,75.83,45.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的角色交谈
    .turnin 26653 >>交任务: |cRXP_FRIENDLY_来自夜色镇的货物|r
    .accept 26652 >>接任务: |cRXP_LOOT_幽灵的发丝|r
	.target Madame Eva
step
	#completewith next
    .goto 47,73.82,45.95,8,0
    .goto 47,74.07,45.32,8 >>进入旅店
step
    #completewith Daltry1
    .goto 47,73.87,44.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Trelayne|r交谈
    .home >>将你的炉石设置为拉文酒馆
	.target Innkeeper Trelayne
step
	#label Kabobs
    .goto 47,73.74,43.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Grual|r交谈
    .accept 26620 >>接任务: |cRXP_WARN_干烤狼肉串|r
    .accept 26623 >>接任务: |cRXP_LOOT_黑蟹蛋糕|r
	.target Chef Grual
step
	#completewith Daltry1
    .goto 47,74.07,45.32,8,0
	.goto 47,73.82,45.95,8>>离开旅店
step
	#label Daltry1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_ inside和|r outside交谈
    .turnin 26666 >>交任务: |cRXP_FRIENDLY_斯塔文的传说|r
    .accept 26667 >>接任务: |cRXP_WARN_被偷的信件|r
    .goto 47,72.448,46.909
	.target +Clerk Daltry
    .turnin -26728 >>交任务: |cRXP_FRIENDLY_英雄的召唤：暮色森林！|r
    .accept 26618 >>接任务: |cRXP_LOOT_恶狼成群|r
    .goto 47,73.523,46.925
	.target +Commander Althea Ebonlocke
step
    .goto 47,75.33,48.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡洛尔|r交谈
    .accept 26688 >>接任务: |cRXP_LOOT_森林里的狼人|r
	.target Calor

step
    #optional
    #completewith Letters
    >>击杀|cRXP_ENEMY_结网毒蜘蛛|r. 击杀后搜刮其掉落的|cRXP_LOOT_拉普|r
    .complete 26623,1 --6/6 Dusky Lump
	.mob Venom Web Spider
step
#completewith next
#optional
    .goto 47,64.12,51.62,0,0
    >>击杀|cRXP_ENEMY_Nightbane 夜行狼人|r
    .complete 26688,1 --7/7 Nightbane Worgen slain
	.mob Nightbane Worgen
step
	#label Letters
    .goto 47,61.24,40.50
    >>拾取地面上的 |cRXP_PICK_一堆碎片|r以获得 |cRXP_LOOT_一捆被切碎的信件|r
    .complete 26667,1 --1/1 A Slashed Bundle of Letters
step
#loop
    .goto 47,64.12,51.62,40,0
    .goto 47,60.883,40.830,40,0
    .goto 47,65.304,44.317,40,0
    .goto 47,64.12,51.62,0
    .goto 47,60.883,40.830,0
    .goto 47,65.304,44.317,0
    >>击杀|cRXP_ENEMY_Nightbane 夜行狼人|r
    .complete 26688,1 --7/7 Nightbane Worgen slain
	.mob Nightbane Worgen
step
	#completewith next
    >>击杀|cRXP_ENEMY_恶狼|r. 击杀后搜刮出它们的|cRXP_LOOT_牛排|r
    .complete 26618,1 --12/12 Dire Wolf slain
    .complete 26620,1 --5/5 Wolf Skirt Steak
	.mob Dire Wolf
step
#loop
    .goto 47,65.54,30.32,70,0
    .goto 47,73.29,20.23,70,0
    .goto 47,63.90,19.41,70,0
    .goto 47,68.35,19.48,40,0
    .goto 47,60.93,27.34,40,0
    .goto 47,65.54,30.32,40,0
    .goto 47,73.29,20.23,40,0
    .goto 47,63.90,19.41,40,0
    .goto 47,68.35,19.48,40,0
    .goto 47,60.93,27.34,40,0
    .goto 47,65.54,30.32,40,0
    .goto 47,73.29,20.23,40,0
    .goto 47,63.90,19.41,0
    >>击杀|cRXP_ENEMY_结网毒蜘蛛|r. 击杀后搜刮其掉落的|cRXP_LOOT_拉普|r
    .complete 26623,1 --6/6 Dusky Lump
	.mob Venom Web Spider
step
#loop
    .goto 47,59.00,20.72,40,0
    .goto 47,68.35,19.48,40,0
    .goto 47,60.93,27.34,40,0
    .goto 47,65.54,30.32,40,0
    .goto 47,59.00,20.72,40,0
    .goto 47,63.90,19.41,40,0
    .goto 47,68.35,19.48,40,0
    .goto 47,60.93,27.34,40,0
    .goto 47,65.54,30.32,40,0
    .goto 47,59.00,20.72,0
    >>击杀|cRXP_ENEMY_恶狼|r. 击杀后搜刮出它们的|cRXP_LOOT_牛排|r
    .complete 26618,1 --12/12 Dire Wolf slain
    .complete 26620,1 --5/5 Wolf Skirt Steak
	.mob Dire Wolf
step
    .isOnQuest 26620,26618,26623,26688,26667
    .hs >>炉石传送至夜色镇
    .cooldown item,6948,>2
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_ inside和|r outside交谈
    .turnin 26667 >>交任务: |cRXP_FRIENDLY_被偷的信件|r
    .accept 26669 >>接任务: |cRXP_WARN_黑暗的角落|r
    .target +Clerk Daltry
    .goto 47,72.448,46.909
    .turnin 26618 >>交任务: |cRXP_FRIENDLY_恶狼成群|r
    .accept 26645 >>接任务: |cRXP_LOOT_守夜人|r
    .goto 47,73.523,46.925
	.target +Commander Althea Ebonlocke
step
    .goto 47,75.33,48.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡洛尔|r交谈
    .turnin 26688 >>交任务: |cRXP_FRIENDLY_森林里的狼人|r
    .accept 26689 >>接任务: |cRXP_WARN_烂果园|r
	.target Calor
step
    #optional
    .maxlevel 25,endOfTheGuide
step
    .goto 47,79.53,47.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维克托|r交谈
    .accept 26683 >>接任务: |cRXP_LOOT_仰望星空|r
	.target Viktori Prism'Antras
step
	#completewith next
    >>击杀|cRXP_ENEMY_恐怖骸骨|r
	.complete 26645,1 --8/8 Rotting Horror slain
	.mob Rotting Horror
step
    .goto 47,81.66,59.16,8,0
    .goto 47,81.92,58.98,5,0
    .goto 47,82.05,59.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_Mary|r交谈
    .turnin 26652 >>交任务: |cRXP_FRIENDLY_幽灵的发丝|r
    .accept 26654 >>接任务: |cRXP_LOOT_归还梳子|r
    .turnin 26683 >>交任务: |cRXP_FRIENDLY_眺望群星|r
    .accept 26684 >>接任务: |cRXP_WARN_疯狂的食尸鬼|r
	.target Blind Mary
step
#loop
	.line 47,82.30,61.22,82.45,56.25,80.91,56.65,79.48,60.41,82.30,61.22
	.goto 47,82.30,61.22,30,0
	.goto 47,82.45,56.25,30,0
	.goto 47,80.91,56.65,30,0
	.goto 47,79.48,60.41,30,0
	.goto 47,82.30,61.22,30,0
    >>击杀|cRXP_ENEMY_恐怖骸骨|r
	.complete 26645,1 --8/8 Rotting Horror slain
	.mob Rotting Horror
step
    #completewith next
    .subzone 42 >>返回夜色镇
step
    .goto 47,75.56,45.37,8,0
    .goto 47,75.83,45.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的角色交谈
    .turnin 26654 >>交任务: |cRXP_FRIENDLY_归还梳子|r
    .accept 26655 >>接任务: |cRXP_LOOT_幽灵的发丝|r
	.target Madame Eva
step
    .goto 47,87.43,35.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚伯克隆比|r交谈
    .turnin 26655 >>交任务: |cRXP_FRIENDLY_幽灵的发丝|r
    .accept 26660 >>接任务: |cRXP_LOOT_僵尸|r
	.target Abercrombie
step << skip
    #completewith next
    .goto 47,87.98,33.16,20,0
    .goto 47,88.1,31.33,20,0
    .goto 47,90.98,30.53,30 >>检查是否有|r|cRXP_ENEMY_Unknown Soldier|r(稀有). 如果他在, 就杀掉他
	.unitscan Unknown Soldier
step
	#completewith next
    .goto 47,73.82,45.95,8,0
    .goto 47,74.07,45.32,8 >>进入旅店
step
    .goto 47,74.09,44.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯密茨|r交谈
    .turnin 26660 >>交任务: |cRXP_FRIENDLY_僵尸|r
    .accept 26661 >>接任务: |cRXP_LOOT_收集腐败之花|r
	.target Tavernkeep Smitts
step
	#completewith next
    .goto 47,74.07,45.32,8,0
	.goto 47,73.82,45.95,8 >>离开旅店
step
    .goto 47,73.523,46.925
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Althea|r交谈
    .turnin 26645 >>交任务: |cRXP_FRIENDLY_守夜人|r
    .accept 26686 >>接任务: |cRXP_WARN_说话的骨头|r
	.target Commander Althea Ebonlocke
step
    #optional
    .maxlevel 25,endOfTheGuide
step
#optional
	#completewith next
    >>击杀|cRXP_ENEMY_骷髅战士|r 和|cRXP_ENEMY_骷髅法师|r
	>>拾取地面上的|cRXP_LOOT_腐败之花|r
    .complete 26686,1 --5/5 Skeletal Warrior slain
	.mob +Skeletal Warrior
    .complete 26686,2 --5/5 Skeletal Mage
	.mob +Skeletal Mage
    .complete 26661,1 --5/5 Rot Blossom
step
    .goto 47,80.31,71.10,15,0
    .goto 47,80.88,71.58
    >>击杀墓地内的|cRXP_ENEMY_疯狂的食尸鬼|r, 掉落物品为|cRXP_LOOT_玛丽的镜子|r
    .complete 26684,1 --1/1 Mary's Looking Glass
	.mob Insane Ghoul
step
	.line 47,81.85,68.34,78.33,66.13,77.02,69.85,80.89,74.21,81.85,68.34
    #loop
    .goto 47,81.85,68.34,30,0
    .goto 47,78.33,66.13,30,0
    .goto 47,77.02,69.85,30,0
    .goto 47,80.89,74.21,30,0
    .goto 47,81.85,68.34,30,0
    >>击杀|cRXP_ENEMY_骷髅战士|r 和|cRXP_ENEMY_骷髅法师|r
	>>拾取地面上的|cRXP_LOOT_腐败之花|r
    .complete 26686,1 --5/5 Skeletal Warrior slain
	.mob +Skeletal Warrior
    .complete 26686,2 --5/5 Skeletal Mage
	.mob +Skeletal Mage
    .complete 26661,1 --5/5 Rot Blossom
step
#optional
    #completewith journal1
    >>击杀|cRXP_ENEMY_夜行织影狼人|r
    .complete 26689,1 --10/10 Nightbane Shadow Weaver slain
	.mob Nightbane Shadow Weaver
step
	#completewith next
    .goto 47,66.03,75.79,8,0
    .goto 47,65.98,76.42,8 >>进入谷仓
step
#label journal1
    .goto 47,66.59,76.44
    >>拾取地面上的|cRXP_LOOT_一本被撕破的日记|r
    .complete 26669,1 --1/1 A Torn Journal
step
#loop
    .goto 47,63.50,76.61,40,0
    .goto 47,60.88,73.19,40,0
    .goto 47,64.19,65.03,40,0
    .goto 47,63.50,76.61,40,0
    .goto 47,60.88,73.19,40,0
    .goto 47,64.19,65.03,40,0
    .goto 47,63.50,76.61,0
    >>击杀|cRXP_ENEMY_夜行织影狼人|r
    .complete 26689,1 --10/10 Nightbane Shadow Weaver slain
	.mob Nightbane Shadow Weaver
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_Althea|r交谈, 再与里面的|cRXP_FRIENDLY_Daltry|r交谈
    .turnin 26686 >>交任务: |cRXP_FRIENDLY_说话的骨头|r
    .goto 47,73.523,46.925
	.target +Commander Althea Ebonlocke
    .turnin 26669 >>交任务: |cRXP_FRIENDLY_黑暗的角落|r
    .accept 26670 >>接任务: |cRXP_WARN_罗兰之墓|r
    .goto 47,72.448,46.909
	.target +Clerk Daltry
step
	#completewith next
    .goto 47,73.82,45.95,8,0
    .goto 47,74.07,45.32,8 >>进入旅店
step
    .goto 47,74.09,44.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯密茨|r交谈
    .turnin 26661 >>交任务: |cRXP_FRIENDLY_收集腐败之花|r
    .accept 26676 >>接任务: |cRXP_LOOT_僵尸酒|r
	.target Tavernkeep Smitts
step
	#completewith next
    .goto 47,74.07,45.32,8,0
	.goto 47,73.82,45.95,8 >>离开旅店
step
    .goto 47,75.33,48.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡洛尔|r交谈
    .turnin 26689,1 >>交任务: |cRXP_FRIENDLY_烂果园|r
    .accept 26690 >>接任务: |cRXP_WARN_邪齿和堕落|r
	.target Calor
step
	#label Insane
    .goto 47,79.53,47.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维克托|r交谈
    .turnin 26684 >>交任务: |cRXP_FRIENDLY_疯狂的食尸鬼|r
    .accept 26685 >>接任务: |cRXP_WARN_高级玻璃|r
	.target Viktori Prism'Antras
step
    .goto 47,87.43,35.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚伯克隆比|r交谈
    .turnin 26676 >>交任务: |cRXP_FRIENDLY_僵尸酒|r
    .accept 26680 >>接任务: |cRXP_LOOT_食人魔潜行者|r
	.target Abercrombie
step
    #optional
    .maxlevel 25,endOfTheGuide
step
    #completewith JPages
    >>击杀|cRXP_ENEMY_Nightbane 夜行邪齿狼人|r和 |cRXP_ENEMY_Nightbane 夜行堕落狼人|r
    .complete 26690,1 --8/8 Nightbane Vile Fang slain
    .mob +Nightbane Vile Fang
    .complete 26690,2 --8/8 Nightbane Tainted One slain
    .mob +Nightbane Tainted One
step
	#label JPages
    .goto 47,73.44,76.86,20,0
    .goto 47,74.26,77.92,20,0
    .goto 47,73.62,79.21
    >>拾取地面上的沾满泥污的日记书页
    .complete 26670,1 --1/1 Muddy Journal Pages
step
#loop
    .goto 47,74.84,67.51,40,0
    .goto 47,72.13,67.77,40,0
    .goto 47,72.03,74.77,40,0
    .goto 47,74.25,73.86,40,0
    .goto 47,73.46,73.17,40,0
    .goto 47,74.84,67.51,40,0
    .goto 47,72.13,67.77,40,0
    .goto 47,72.03,74.77,40,0
    .goto 47,74.25,73.86,40,0
    .goto 47,73.46,73.17,0
    >>击杀|cRXP_ENEMY_Nightbane 夜行邪齿狼人|r和 |cRXP_ENEMY_Nightbane 夜行堕落狼人|r
    .complete 26690,1 --8/8 Nightbane Vile Fang slain
    .mob +Nightbane Vile Fang
    .complete 26690,2 --8/8 Nightbane Tainted One slain
    .mob +Nightbane Tainted One
step
    .goto 47,72.448,46.909
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Daltry|r交谈, 他在里面
    .turnin 26670 >>交任务: |cRXP_FRIENDLY_罗兰之墓|r
    .accept 26671 >>接任务: |cRXP_WARN_斯塔文·密斯特曼托的命运|r
	.target Clerk Daltry
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡洛尔|r交谈, 然后进入里面与|cRXP_FRIENDLY_乔纳森|r交谈
    .turnin 26690 >>交任务: |cRXP_FRIENDLY_邪齿和堕落|r
    .accept 26691 >>接任务: |cRXP_LOOT_森林里的狼人|r
    .goto 47,75.33,48.02
	.target +Calor
    .turnin 26691 >>交任务: |cRXP_FRIENDLY_森林里的狼人|r
    .goto 47,75.24,48.23,5,0
    .goto 47,75.39,49.00
	.target +Jonathan Carevin
step
    .goto 47,78.74,44.53,8,0
    .goto 47,79.084,44.173
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_Tobias|r交谈
    .turnin 26671 >>交任务: |cRXP_FRIENDLY_斯塔文·密斯特曼托的命运|r
    .accept 26672 >>接任务: |cRXP_WARN_挖掘真相|r
    .target Tobias Mistmantle
step
	#label Clawing
    .goto 47,75.56,45.37,8,0
    .goto 47,75.83,45.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_伊瓦|r交谈
    .turnin 26672 >>交任务: |cRXP_FRIENDLY_挖掘真相|r
    .accept 26674 >>接任务: |cRXP_WARN_密斯特曼托的复仇|r
	.target Madame Eva
step
    #completewith next
	.cast 82029 >>|cRXP_WARN_使用|r|T133343:0|t[密斯特曼托家族戒指]|cRXP_WARN_召唤|r|cRXP_ENEMY_斯塔文·密斯特曼托|r
	.timer 33,Mistmantle's Revenge RP
step
    .goto 47,77.42,35.85,10,0
    .goto 47,77.33,36.18
    .use 59363 >>击杀|cRXP_ENEMY_斯塔文·密斯特曼托|r
    .complete 26674,1 --1/1 Stalvan Mistmantle slain
	.mob Stalvan Mistmantle
step
    .goto 47,78.74,44.53,8,0
    .goto 47,79.084,44.173
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_Tobias|r交谈
    .turnin 26674 >>交任务: |cRXP_FRIENDLY_密斯特曼托的复仇|r
    .accept 26785 >>接任务: |cRXP_WARN_族群的一部分|r
	.target Tobias Mistmantle
step
	#completewith next
    .goto 47,69.51,48.83,30 >>沿着议政厅后方的小路前往布莱特伍德林地
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dodds|r和|cRXP_FRIENDLY_Fess|r交谈
    .accept 25235 >>接任务: |cRXP_WARN_粗野的沃古尔|r
	.target +Watcher Dodds
    .goto 47,45.12,67.02
    .turnin 26785 >>交任务: |cRXP_FRIENDLY_族群的一部分|r
    .accept 26707 >>接任务: |cRXP_WARN_致命的植物|r
    .accept 26717 >>接任务: |cRXP_WARN_约根狼人|r
    .goto 47,44.92,67.43
	.target +Apprentice Fess
step
    #optional
    .maxlevel 25,endOfTheGuide
step
    #completewith next
    >>击杀|cRXP_ENEMY_乱坟草|r. 击败后掠夺其掉落的|cRXP_LOOT_乱坟草|r
    .complete 26707,1 --5/5 Corpseweed
	.mob Corpseweed
step
    .goto 47,49.86,77.69
    >>点击地面上的|cRXP_PICK_松软的泥土|r
    .complete 26717,1 --1/1 Mound of Loose Dirt
step
    #loop
    .goto 47,51.99,73.61,60,0
    .goto 47,49.04,70.73,60,0
    .goto 47,47.12,73.79,60,0
    .goto 47,49.28,76.56,60,0
    .goto 47,51.99,73.61,60,0
    .goto 47,49.04,70.73,60,0
    .goto 47,47.12,73.79,60,0
    >>击杀|cRXP_ENEMY_乱坟草|r. 击败后掠夺其掉落的|cRXP_LOOT_乱坟草|r
    .complete 26707,1 --5/5 Corpseweed
	.mob Corpseweed
step
    #completewith Zzarc
	>>击杀|cRXP_ENEMY_裂拳食人魔|r和|cRXP_ENEMY_裂拳好战者|r和|cRXP_ENEMY_裂拳战士|r
    .complete 25235,1 --15/15 Splinter Fist Ogre slain
	.mob Splinter Fist Ogre
	.mob Splinter Fist Firemonger
	.mob Splinter Fist Warrior
step
    .goto 47,33.52,75.33
    >>战利品|cRXP_LOOT_亚伯克隆比的箱子|r在地面上
    .complete 26680,1 --1/1 Abercrombie's Crate
step
    #completewith next
    .goto 47,34.23,77.47,15 >>进入裂拳食人魔洞穴
step
	#label Zzarc
    .goto 47,37.87,84.33
    >>击杀|cRXP_ENEMY_Zzarc' Vul|r. 击败他后搜刮他的|cRXP_LOOT_Monocle|r
    .complete 26685,1 --1/1 Ogre's Monocle
	.unitscan Zzarc' Vul
step
	#completewith next
    .goto 47,34.20,77.47,15 >>离开裂拳食人魔洞窟
	.isOnQuest 25235,26685
step
    #loop
    .goto 47,33.32,74.63,60,0
    .goto 47,32.82,68.37,60,0
    .goto 47,39.06,70.59,60,0
    .goto 47,40.66,74.97,60,0
    .goto 47,33.32,74.63,60,0
    .goto 47,32.82,68.37,60,0
    .goto 47,39.06,70.59,60,0
    .goto 47,40.66,74.97,60,0
    .goto 47,34.261,73.014,0
	>>击杀|cRXP_ENEMY_裂拳食人魔|r和|cRXP_ENEMY_裂拳好战者|r和|cRXP_ENEMY_裂拳战士|r
    .complete 25235,1 --15/15 Splinter Fist Ogre slain
	.mob Splinter Fist Ogre
	.mob Splinter Fist Firemonger
	.mob Splinter Fist Warrior
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fess|r和|cRXP_FRIENDLY_Dodds|r交谈
    .turnin 26707 >>交任务: |cRXP_FRIENDLY_致命的植物|r
    .turnin 26717 >>交任务: |cRXP_FRIENDLY_约根狼人|r
    .accept 26719 >>接任务: |cRXP_WARN_给哈里斯大师的货物|r
    .goto 47,44.92,67.43
	.target +Apprentice Fess
    .turnin 25235 >>交任务: |cRXP_FRIENDLY_粗野的沃古尔|r
    .goto 47,45.12,67.02
	.target +Watcher Dodds
step
    .goto 47,20.015,57.884
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾丽辛顿修女|r交谈
    .target Sister Elsington
    .accept 26777 >>接任务: |cRXP_WARN_抚慰灵魂|r
step
    .goto 47,18.628,58.335
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基特斯|r交谈
    .accept 26721 >>接任务: |cRXP_WARN_基特斯的虫子|r
    .target Jitters
step
    .goto 47,18.310,57.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莉芙·哈里斯|r交谈
    .target Oliver Harris
    .turnin 26719 >>交任务: |cRXP_FRIENDLY_给哈里斯大师的货物|r
    .accept 26720 >>接任务: |cRXP_WARN_我们无法解除的诅咒|r
step
#optional
    #completewith LurkingW
    .use 60225 >>|cRXP_WARN_使用|r|T134547:0|t[神圣香炉] |cRXP_WARN_on|r|cRXP_FRIENDLY_弃灵|r
    .complete 26777,1 --5/5 Forlorn Spirit soothed
	.target Forlorn Spirit
step
#optional
	#completewith next
    .goto 47,21.65,72.34,8,0
    .goto 47,21.29,72.73,8 >>|cRXP_WARN_进入谷仓马厩|r
step
    #label LurkingW
    .goto 47,21.61,73.15
	>>|cRXP_WARN_将生成的|cRXP_ENEMY_潜藏狼人|r造成的伤害使其血量降至20%或以下, 然后对其使用 |T134825:0|t[哈里斯的安瓿] |r
    .complete 26720,1 --1/1 Lurking Worgen captured
	.mob Lurking Worgen
    .use 60206
step
    #loop
    .goto 47,19.20,68.25,60,0
    .goto 47,19.95,64.85,60,0
    .goto 47,23.23,66.58,60,0
    .goto 47,25.13,70.24,60,0
    .goto 47,22.85,72.11,60,0
    .goto 47,19.20,68.25,60,0
    .goto 47,19.95,64.85,60,0
    .goto 47,23.23,66.58,60,0
    .goto 47,25.13,70.24,60,0
    .goto 47,22.85,72.11,60,0
    .goto 47,21.695,68.981,0
    .use 60225 >>|cRXP_WARN_使用|r|T134547:0|t[神圣香炉] |cRXP_WARN_on|r|cRXP_FRIENDLY_弃灵|r
    .complete 26777,1 --5/5 Forlorn Spirit soothed
	.target Forlorn Spirit
    .use 60225
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莉芙·哈里斯|r和|cRXP_FRIENDLY_艾丽辛顿修女|r交谈
    .turnin 26720 >>交任务: |cRXP_FRIENDLY_我们无法解除的诅咒|r
    .accept 26760 >>接任务: |cRXP_WARN_异想天开|r
	.timer 58,Cry For The Moon RP
    .goto 47,18.32,57.67
    .turnin 26777 >>交任务: |cRXP_FRIENDLY_抚慰灵魂|r
    .goto 47,20.03,57.82
	.target Oliver Harris
	.target Sister Elsington
step
    >>|cRXP_WARN_等待RP结束|r
    >>|cRXP_WARN_如果计时器结束后你未获得任务奖励, 请放弃“为月而哭”并重新接受该任务|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莉芙·哈里斯|r和|cRXP_FRIENDLY_斯温·约根|r和|cRXP_FRIENDLY_艾丽辛顿修女|r交谈
    .complete 26760,1 --1/1 Worgen cured
    .turnin 26760 >>交任务: |cRXP_FRIENDLY_异想天开|r
    .goto 47,18.32,57.67
    .accept 26723 >>接任务: |cRXP_WARN_摩本特·费尔的命运|r
    .goto 47,18.34,58.06
    .accept 26778 >>接任务: |cRXP_WARN_亡者的哭泣|r
    .goto 47,20.03,57.82
	.target Oliver Harris
	.target Sven Yorgen
	.target Sister Elsington
step
    #optional
    .maxlevel 25,endOfTheGuide
step
    .goto Duskwood,21.08,56.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_约翰·谢尔比|r交谈
    .target John Shelby
    .fp Raven Hill>>获取乌鸦岭的飞行路径
step
    .goto 47,31.66,50.31,50,0
    .goto 47,37.52,25.18,50,0
    .goto 47,30.98,31.14,50,0
    .goto 47,31.66,50.31,50,0
    .goto 47,37.52,25.18,50,0
    .goto 47,30.98,31.14
    >>击杀|cRXP_ENEMY_黑寡妇蜘蛛|r, 掠夺它们以获得|cRXP_LOOT_寡妇蛛毒囊|r
	>>|cRXP_WARN_它们在战斗中有时会消失1-2秒|r
    .complete 26721,1 --8/8 Widow Venom Sac
	.mob Black Widow
step
    .goto 47,17.72,29.05
    >>点击|cRXP_PICK_破旧的坟墓|r
    .accept 26793 >>接任务: |cRXP_LOOT_饱经风霜的墓碑|r
step
    .goto 47,17.49,33.40,8,0
    .goto 47,17.44,34.17,5,0
    .goto 47,16.97,33.42
    >>点击楼上地上那个|cRXP_PICK_Bloodsoaked Hat|r
    .complete 26723,1 --1/1 Remains of Morbent Fel
step
    .isOnQuest 26793,26685,26680
    .hs >>炉石传送至夜色镇
    .cooldown item,6948,>2
step
    .goto 47,72.43,46.80,15,0
    .goto 47,72.605,47.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sirra Von'Indi|r交谈
    .turnin 26793 >>交任务: |cRXP_FRIENDLY_饱经风霜的墓碑|r
    .accept 26794 >>接任务: |cRXP_LOOT_摩根·拉迪莫尔|r
    .target Sirra Von'Indi
step
    .goto 47,73.523,46.925
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿尔泰娅·埃伯洛克|r交谈
    .turnin 26794 >>交任务: |cRXP_FRIENDLY_摩根·拉迪莫尔|r
    .accept 26795 >>接任务: |cRXP_LOOT_摩拉迪姆|r
    .target Commander Althea Ebonlocke
step
	#sticky
    .destroy 2154 >>摧毁: |cRXP_ENEMY_摩根·拉迪莫尔的故事|r
step
    .goto 47,79.53,47.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维克托里·普利斯玛'安特拉斯|r交谈
    .turnin 26685 >>交任务: |cRXP_FRIENDLY_高级玻璃|r
	.target Viktori Prism'Antras
step
    .goto 47,87.43,35.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚伯克隆比|r交谈
    .turnin 26680 >>交任务: |cRXP_FRIENDLY_食人魔潜行者|r
	.target Abercrombie
step
    #optional
    .maxlevel 25,endOfTheGuide
step
    .goto 47,87.43,35.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚伯克隆比|r交谈
    .turnin 26680 >>交任务: |cRXP_FRIENDLY_食人魔潜行者|r
    .accept 26677 >>接任务: |cRXP_LOOT_食尸鬼假人|r
	.target Abercrombie
    .maxlevel 28
step
    .goto 47,77.34,36.27,15,0
    .goto 47,75.08,37.23,40,0
    .goto 47,76.73,30.50,40,0
    .goto 47,81.23,32.15,40,0
    .goto 47,79.79,35.41,40,0
    .goto 47,75.08,37.23,40,0
    .goto 47,76.73,30.50,40,0
    .goto 47,81.23,32.15,40,0
    .goto 47,79.79,35.41,40,0
    .goto 47,77.760,33.889
    >>击杀|cRXP_ENEMY_恶臭的食尸鬼|r. 掠夺其|cRXP_LOOT_食尸鬼的肋骨|r`
	>>|cRXP_WARN_检查房屋内及周围是否有|cRXP_PICK_Chest|r|r
    .complete 26677,1 --7/7 Ghoul Rib
	.mob Fetid Corpse
    .maxlevel 28
step
    .goto 47,87.43,35.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚伯克隆比|r交谈
    .turnin 26677 >>交任务: |cRXP_FRIENDLY_食尸鬼假人|r
    .accept 26681 >>接任务: |cRXP_LOOT_给镇长的信|r
	.target Abercrombie
    .maxlevel 28
step
	#completewith next
	.goto 47,72.86,46.82,10,0
	.goto 47,72.53,47.21,8,0
	.goto 47,72.35,47.75,8 >>|cRXP_WARN_进入议政厅|r
    .maxlevel 28
step
    .goto 47,71.93,46.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔罗·埃伯洛克公爵|r交谈
    .turnin 26681 >>交任务: |cRXP_FRIENDLY_给镇长的信|r
    .accept 26727 >>接任务: |cRXP_WARN_藏尸者的复仇|r
	.target Lord Ello Ebonlocke
    .maxlevel 28
step
	#completewith next
	.goto 47,72.35,47.75,8,0
	.goto 47,72.53,47.21,8,0
	.goto 47,72.86,46.82,10 >>|cRXP_WARN_离开议政厅|r
    .maxlevel 28
step
    .goto 47,74.17,46.47
    >>击杀|cRXP_ENEMY_Stiches.|r
    .complete 26727,1 --1/1 Stitches slain
	.mob Stitches
    .maxlevel 28
step
	#completewith next
	.goto 47,72.86,46.82,10,0
	.goto 47,72.53,47.21,8,0
	.goto 47,72.35,47.75,8 >>|cRXP_WARN_进入议政厅|r
    .maxlevel 28
step
    .goto 47,71.93,46.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾洛·埃伯洛克公爵|r交谈
    .turnin 26727 >>交任务: |cRXP_FRIENDLY_藏尸者的复仇|r
	.target Lord Ello Ebonlocke
    .maxlevel 28
step
	#completewith next
    .goto 47,77.48,44.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲利希亚·玛林|r交谈
    .fly Raven Hill >>飞往乌鸦岭
	.target Felicia Maline
    .subzoneskip 94
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯温·约根|r和|cRXP_FRIENDLY_基特斯|r交谈
    .turnin 26723 >>交任务: |cRXP_FRIENDLY_摩本特·费尔的命运|r
    .accept 26724 >>接任务: |cRXP_WARN_潜藏的巫妖|r
    .goto 47,18.34,58.06
	.target +Sven Yorgen
    .turnin 26721 >>交任务: |cRXP_FRIENDLY_基特斯的虫子|r
    .accept 26787 >>接任务: |cRXP_WARN_熊脑子|r
	.target +Jitters
    .goto 47,18.62,58.36
step
    #optional
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾丽辛顿修女|r交谈
    .turnin 26778 >>交任务: |cRXP_FRIENDLY_亡者的哭泣|r
    .isQuestComplete 26778
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾丽辛顿修女|r交谈
    .turnin 26724 >>交任务: |cRXP_FRIENDLY_潜藏的巫妖|r
    .accept 26725 >>接任务: |cRXP_WARN_在圣光的指引下|r
    .goto 47,20.03,57.82
	.target Sister Elsington
step
#optional
    #completewith LightforgedRod
    >>击杀|cRXP_ENEMY_瘟疫食尸鬼|r和|cRXP_ENEMY_食腐者|r和|cRXP_ENEMY_腐烂者|r和|cRXP_ENEMY_骨啃者|r
    .complete 26778,1 --20/20 Ghoul slain
	.mob Plague Spreader
	.mob Flesh Eater
	.mob Rotted One
	.mob Bone Chewer
step
#optional
    #completewith LightforgedRod
    >>击杀|cRXP_ENEMY_摩拉迪姆|r. 击败他后搜刮他的|cRXP_LOOT_骷髅|r
    >>|cRXP_ENEMY_摩拉迪姆|r|cRXP_WARN_在乌鸦岭墓地巡逻|r
    .complete 26795,1 --Mor'Ladim's Skull (1)
    .unitscan Mor'Ladim
    .isOnQuest 26795
step
    #label LightforgedRod
    .goto 47,23.45,35.41
    >>点击地面上的|cRXP_PICK_Lightforged Rod|r
    .turnin 26725 >>交任务: |cRXP_FRIENDLY_在圣光的指引下|r
    .accept 26753 >>接任务: |cRXP_WARN_亡者的大厅|r
step
	#label CatacombsX
	#completewith next
    .goto 47,23.94,34.80,10,0
    .goto 47,25.68,33.76,15,0
    .goto 47,25.46,31.50,15,0
    .goto 47,23.47,27.99,15,0
    .goto 47,20.37,27.46,20 >>|cRXP_WARN_深入地下墓穴. 注意不要踩到任何坟墓, 否则会召唤出|r |cRXP_ENEMY_被埋葬的尸体|r
step
    .goto 47,20.37,27.46
    >>点击地面上的光铸圣殿
    .turnin 26753 >>交任务: |cRXP_FRIENDLY_亡者的大厅|r
    .accept 26722 >>接任务: |cRXP_WARN_深埋|r
step
	#completewith next
    .goto 47,20.33,26.81,10,0
    .goto 47,19.47,26.81,10,0
    .goto 47,18.53,24.94,10,0
    .goto 47,18.01,25.37,10 >>|cRXP_WARN_穿过墙上的洞|r
step
    .goto 47,18.01,25.37
    >>点击地面上的|cRXP_FRIENDLY_Lightforged徽章|r
    .turnin 26722 >>交任务: |cRXP_FRIENDLY_深埋|r
    .accept 26754 >>接任务: |cRXP_WARN_摩本特的克星|r
step
	#completewith next
    .goto 47,16.53,31.06
    .cast 82130 >>|cRXP_WARN_使用|r|T135142:0|t[摩本特的克星], |cRXP_WARN_目标: |r|cRXP_ENEMY_摩本特·费尔|r|cRXP_WARN_以削弱他|r
	.use 60212
    .mob Morbent Fel
step
    .goto 47,16.53,31.06
    .use 60212 >>击杀|cRXP_ENEMY_摩本特·费尔|r
    .complete 26754,1 --1/1 Morbent Fel slain
	.mob Morbent Fel
step
	#completewith CoalB
    .goto 47,16.18,33.19,15,0
    .goto 47,15.31,38.48,15,0
    .goto 47,16.09,38.78,15,0
    .subzone 2098,1 >>|cRXP_WARN_离开地牢|r
step
#sticky
#label morladim
#loop
    .goto 47,20.72,35.33,40,0
    .goto 47,22.70,32.95,40,0
    .goto 47,16.20,33.17,40,0
    .goto 47,14.27,41.46,40,0
    .goto 47,20.72,35.33,40,0
    .goto 47,22.70,32.95,40,0
    .goto 47,16.20,33.17,40,0
    .goto 47,14.27,41.46,40,0
    .goto 47,22.922,37.687,0
    >>击杀|cRXP_ENEMY_摩拉迪姆|r. 击败他后搜刮他的|cRXP_LOOT_骷髅|r
    >>|cRXP_ENEMY_摩拉迪姆|r|cRXP_WARN_在乌鸦岭墓地巡逻|r
    .complete 26795,1 --Mor'Ladim's Skull (1)
	.unitscan Mor'Ladim
    .isOnQuest 26795
step
#loop
    .goto 47,20.72,35.33,40,0
    .goto 47,22.70,32.95,40,0
    .goto 47,16.20,33.17,40,0
    .goto 47,14.27,41.46,40,0
    .goto 47,20.72,35.33,40,0
    .goto 47,22.70,32.95,40,0
    .goto 47,16.20,33.17,40,0
    .goto 47,14.27,41.46,40,0
    .goto 47,22.922,37.687,0
    >>击杀|cRXP_ENEMY_瘟疫食尸鬼|r和|cRXP_ENEMY_食腐者|r和|cRXP_ENEMY_腐烂者|r和|cRXP_ENEMY_骨啃者|r
	.complete 26778,1 --20/20 Ghoul slain
	.mob Plague Spreader
	.mob Flesh Eater
	.mob Rotted One
	.mob Bone Chewer
step
#requires morladim
	#label CoalB
    #loop
    .goto 47,10.144,41.314,80,0
    .goto 47,11.636,54.060,80,0
    .goto 47,13.663,69.726,80,0
    .goto 47,10.144,41.314,0
    .goto 47,11.636,54.060,0
    .goto 47,13.663,69.726,0
    >>击杀|cRXP_ENEMY_暗色熊|r. 击杀后掠夺其|cRXP_LOOT_黑熊脑|r
    .complete 26787,1 --8/8 Black Bear Brain
	.mob Coalpelt Bear
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯温·约根|r和|cRXP_FRIENDLY_基特斯|r交谈
    .turnin 26754 >>交任务: |cRXP_FRIENDLY_摩本特的克星|r
	.target +Sven Yorgen
    .goto 47,18.34,58.06
    .turnin 26787 >>交任务: |cRXP_FRIENDLY_熊脑子|r
    .goto 47,18.62,58.36
	.target +Jitters
step
    .goto 47,19.929,57.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾丽辛顿修女|r交谈
    .target Sister Elsington
    .turnin 26778 >>交任务: |cRXP_FRIENDLY_亡者的哭泣|r
    .accept 26838 >>接任务: |cRXP_WARN_无果的反叛|r
step
    #optional
    #label endOfTheGuide
step
    .goto 50,51.88,12.10
    .zone 50 >>前往北荆棘谷
]])
