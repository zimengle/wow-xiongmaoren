local _,addon = ...
if addon.game ~= "CATA" or addon.player.faction ~= 'Horde' then return end
local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#cata
<< Horde
#name 1-6 试炼之谷
#next 6-10 杜隆塔尔
#version 1
--#group RXP 大灾变 (H)
#defaultfor Orc
#group RXP 大灾变 1-80（H）
#sub重量 10000


step << !Orc
    #completewith next
    +您已选择一本针对兽人的指南。您应该选择与您开始的相同起始区域
step
    .goto 1411,43.29,68.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡尔图克|r
    .accept 25152 >>接任务: |cRXP_LOOT_起点|r
    .target Kaltunk
step
    .goto 1411,43.23,68.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高内克|r
    .turnin 25152 >>交任务: |cRXP_FRIENDLY_起点|r
    .accept 25126 >>接任务: |cRXP_LOOT_小试身手|r
    .target Gornek
step
    .goto 1411,44.96,65.65,30,0
    .goto 1411,45.09,64.90,30,0
    .goto 1411,43.62,64.74,30,0
    .goto 1411,43.97,63.57 
    >>杀死 |cRXP_ENEMY_Mottled Boars|r
    .complete 25126,1 --Mottled Boar slaughtered (6)
    .mob Mottled Boar
step
    .goto 1411,43.28,68.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高内克|r
    .turnin 25126 >>交任务: |cRXP_FRIENDLY_小试身手|r
    .accept 25172 >>接任务: |cRXP_WARN_家园里的入侵者|r
    .target Gornek
step
#loop
	.line 1411,44.39,70.04,45.25,70.47,45.31,71.80,45.11,72.80,44.58,73.46,43.82,74.37,42.69,72.72,42.13,72.47,41.38,72.37,40.73,71.02,41.43,70.77,41.96,71.50,42.69,71.41,43.02,71.23,43.43,70.84,44.39,70.04
	.goto 1411,44.39,70.04,30,0
	.goto 1411,45.25,70.47,30,0
	.goto 1411,45.31,71.80,30,0
	.goto 1411,45.11,72.80,30,0
	.goto 1411,44.58,73.46,30,0
	.goto 1411,43.82,74.37,30,0
	.goto 1411,42.69,72.72,30,0
	.goto 1411,42.13,72.47,30,0
	.goto 1411,41.38,72.37,30,0
	.goto 1411,40.73,71.02,30,0
	.goto 1411,41.43,70.77,30,0
	.goto 1411,41.96,71.50,30,0
	.goto 1411,42.69,71.41,30,0
	.goto 1411,43.02,71.23,30,0
	.goto 1411,43.43,70.84,30,0
	.goto 1411,44.39,70.04,30,0
    >>杀死 |cRXP_ENEMY_Northwatch Scouts|r
    >>|cRXP_WARN_他们被隐身了|r
    .complete 25172,1 --Northwatch Scout (7)
    .mob Northwatch Scout 
    --VV Check on yard range for these stealthed mobs
step
#loop
	.line 1411,44.39,70.04,45.25,70.47,45.31,71.80,45.11,72.80,44.58,73.46,43.82,74.37,42.69,72.72,42.13,72.47,41.38,72.37,40.73,71.02,41.43,70.77,41.96,71.50,42.69,71.41,43.02,71.23,43.43,70.84,44.39,70.04
	.goto 1411,44.39,70.04,30,0
	.goto 1411,45.25,70.47,30,0
	.goto 1411,45.31,71.80,30,0
	.goto 1411,45.11,72.80,30,0
	.goto 1411,44.58,73.46,30,0
	.goto 1411,43.82,74.37,30,0
	.goto 1411,42.69,72.72,30,0
	.goto 1411,42.13,72.47,30,0
	.goto 1411,41.38,72.37,30,0
	.goto 1411,40.73,71.02,30,0
	.goto 1411,41.43,70.77,30,0
	.goto 1411,41.96,71.50,30,0
	.goto 1411,42.69,71.41,30,0
	.goto 1411,43.02,71.23,30,0
	.goto 1411,43.43,70.84,30,0
	.goto 1411,44.39,70.04,30,0
    .xp 2+650 >>升级至 650+/900xp
    .mob Northwatch Scout
step
    .goto 1411,43.27,68.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高内克|r
    .turnin 25172 >>交任务: |cRXP_FRIENDLY_家园里的入侵者|r
    .accept 25127 >>接任务: |cRXP_LOOT_工蝎的尾巴|r
    .accept 3088 >>接任务: |cRXP_LOOT_密文羊皮纸|r << Rogue
    .accept 3087 >>接任务: |cRXP_LOOT_风蚀羊皮纸|r << Hunter
    .accept 25138 >>接任务: |cRXP_WARN_雕文羊皮纸|r << Mage
    .accept 3089 >>接任务: |cRXP_LOOT_符文羊皮纸|r << Shaman
    .accept 2383 >>接任务: |cRXP_LOOT_简易羊皮纸|r << Warrior
    .accept 3090 >>接任务: |cRXP_LOOT_被污染的羊皮纸|r << Warlock
    .target Gornek
step << Rogue
    .goto 1411,42.37,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁瓦格|r
    .turnin 3088 >>交任务: |cRXP_FRIENDLY_密文羊皮纸|r
    .accept 25141 >>接任务: |cRXP_WARN_刺骨|r
    .train 2098 >>训练 |T132292:0|t[剔骨]
    .target Rwag
step << Hunter
    .goto 1411,42.84,69.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡朗尼沙|r
    .turnin 3087 >>交任务: |cRXP_FRIENDLY_风蚀羊皮纸|r
    .accept 25139 >>接任务: |cRXP_WARN_稳固射击|r
    .train 56641 >>火车 |T132213:0|t[稳固射击]
    .target Karranisha
step << Mage
    .goto 1411,42.52,69.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥克莱法|r
    .turnin 25138 >>交任务: |cRXP_FRIENDLY_雕文羊皮纸|r
    .accept 25149 >>接任务: |cRXP_WARN_奥术飞弹|r
    .train 5143 >>训练 |T136096:0|t[奥术飞弹]
    .target Acrypha
step << Shaman
    .goto 1411,42.39,68.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_史克里克|r
    .turnin 3089 >>交任务: |cRXP_FRIENDLY_符文羊皮纸|r
    .accept 25143 >>接任务: |cRXP_WARN_根源打击|r
    .train 73899 >>训练 |T460956:0|t[原始打击]
    .target Shikrik
step << Warrior
    .goto 1411,42.88,69.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗朗恩|r
    .turnin 2383 >>交任务: |cRXP_FRIENDLY_简易羊皮纸|r
    .accept 25147 >>接任务: |cRXP_WARN_冲锋|r
    .train 100 >>列车 |T132337:0|t[收费]
    .target Frang
step << Warlock
    .goto 1411,42.38,68.06
    .>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纳托克|r
    .turnin 3090 >>交任务: |cRXP_FRIENDLY_被污染的羊皮纸|r
    .accept 25145 >>接任务: |cRXP_WARN_献祭|r
    .train 348 >>列车 |T135817:0|t[献祭]
    .target Nartok
step << Rogue
    .goto 1411,43.18,69.47
	>>对 |cRXP_ENEMY_Training Dummy|r 施放 |T132292:0|t[Eviscerate]
	.complete 25141,1 --Cast Eviscerate (x3)
	.mob Training Dummy
step << Hunter
    .goto 1411,43.18,69.47
	>>对 |cRXP_ENEMY_Training Dummy|r 施放 |T132213:0|t[稳固射击]
	.complete 25139,1 --Cast Steady Shot (x5)
	.mob Training Dummy
step << Mage
    .goto 1411,43.18,69.47
	>>对 |cRXP_ENEMY_Training Dummy|r 施放 |T136096:0|t[奥术飞弹]
	.complete 25149,1 --Arcane Missiles (x2)
	.mob Training Dummy
step << Shaman
    .goto 1411,43.18,69.47
	>>对 |cRXP_ENEMY_Training Dummy|r 施放 |T460956:0|t[原始打击]
	.complete 25143,1 --Cast Primal Strike (x3)
	.mob Training Dummy
step << Warrior
    .goto 1411,43.18,69.47
	>>对 |cRXP_ENEMY_Training Dummy|r 施放 |T132337:0|t[充电]
	.complete 25147,1 --Cast Charge (x1)
	.mob Training Dummy
step << Warlock
    .goto 1411,43.18,69.47
	>>对 |cRXP_ENEMY_Training Dummy|r 施放 |T135817:0|t[献祭]
	.complete 25145,1 --Cast Immolate (x5)
	.mob Training Dummy
step << Rogue
    .goto 1411,42.37,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁瓦格|r
    .turnin 25141 >>交任务: |cRXP_FRIENDLY_刺骨|r
    .target Rwag
step << Hunter
    .goto 1411,42.84,69.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡朗尼沙|r
    .turnin 25139 >>交任务: |cRXP_FRIENDLY_稳固射击|r
    .target Karranisha
step << Mage
    .goto 1411,42.52,69.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥克莱法|r
    .turnin 25149 >>交任务: |cRXP_FRIENDLY_奥术飞弹|r
    .target Acrypha
step << Shaman
    .goto 1411,42.39,68.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_史克里克|r
    .turnin 25143 >>交任务: |cRXP_FRIENDLY_根源打击|r
    .target Shikrik
step << Warrior
    .goto 1411,42.88,69.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗朗恩|r
    .turnin 25147 >>交任务: |cRXP_FRIENDLY_冲锋|r
    .target Frang
step << Warlock
    .goto 1411,42.38,68.06
    .>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纳托克|r
    .turnin 25145 >>交任务: |cRXP_FRIENDLY_献祭|r
    .target Nartok
step
    .goto 1411,42.67,67.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_戈加尔|r
    .accept 25136 >>接任务: |cRXP_LOOT_戈加尔的清凉果|r
    .target Galgar
step
    .goto 1411,43.46,67.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头塔兹利尔|r
    .accept 25134 >>接任务: |cRXP_LOOT_懒惰的苦工|r
    .target Foreman Thazz'ril
step
    #completewith Sarkoth
    >>杀死 |cRXP_ENEMY_Scorpid 工人|r。掠夺他们的 |cRXP_LOOT_Tails|r
    .complete 25127,1 --Scorpid Worker Tail (8)
    .mob Scorpid Worker
 step
    #completewith ScorpidTails
    >>|cRXP_WARN_使用|r |T133486:0|t[Foreman's Blackjack] |cRXP_WARN_on sleeping |r|cRXP_FRIENDLY_Lazy Peons|r
    .complete 25134,1 --Peons Awoken (4)
    .use 16114
    .target Lazy Peon
step
    #completewith ScorpidTails
    >>掠夺 |cRXP_LOOT_仙人掌苹果|r
    .complete 25136,1 --Cactus Apple (6)
step
    .goto 1411,40.65,62.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈纳祖|r
    .accept 25129 >>接任务: |cRXP_LOOT_萨科斯|r
    .target Hana'zua
step
    #label Sarkoth
    .goto 1411,40.55,67.23
    >>杀死 |cRXP_ENEMY_Sarkoth|r。掠夺他的 |cRXP_LOOT_Claw|r
    .complete 25129,1 --Sarkoth's Mangled Claw (1)
    .mob Sarkoth
step
    #label ScorpidTails
    #loop
    .goto 1411,40.140,67.939,0
    .waypoint 1411,40.081,66.990,30,0
    .waypoint 1411,40.140,67.939,30,0
    .waypoint 1411,40.753,68.579,30,0
    .waypoint 1411,41.270,67.971,30,0
    .waypoint 1411,41.389,65.804,30,0
    .waypoint 1411,40.022,66.103,30,0
    >>杀死 |cRXP_ENEMY_Scorpid 工人|r。掠夺他们的 |cRXP_LOOT_Tails|r
    .complete 25127,1 --Scorpid Worker Tail (8)
    .mob Scorpid Worker
step
    .goto 1411,42.72,67.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_戈加尔|r
    .turnin 25136 >>交任务: |cRXP_FRIENDLY_戈加尔的清凉果|r
    .target Galgar
    .isQuestComplete 25136
step
    .goto 1411,43.23,68.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高内克|r    
    .turnin 25127 >>交任务: |cRXP_FRIENDLY_工蝎的尾巴|r
    .target Gornek
step
    .goto 1411,42.47,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_坎纳甘·地鸣|r
    .accept 25128 >>接任务: |cRXP_WARN_哈纳祖|r
    .target Canaga Earthcaller
step
    .goto 1411,43.45,67.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖雷萨|r   
    .accept 25131 >>接任务: |cRXP_LOOT_邪灵劣魔|r
    .target Zureetha Fargaze
step
    .goto 1411,43.53,67.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头塔兹利尔|r
    .turnin 37446 >>交任务: |cRXP_FRIENDLY_懒惰的苦工|r
    .target Foreman Thazz'ril
	.isQuestComplete 37446
step
    #completewith VileFamiliars
    >>|cRXP_WARN_使用|r |T133486:0|t[Foreman's Blackjack] |cRXP_WARN_on sleeping |r|cRXP_FRIENDLY_Lazy Peons|r
    .complete 25134,1 --Peons Awoken (4)
    .use 16114
    .target Lazy Peon
step
    #completewith WakePeons
    >>掠夺 |cRXP_LOOT_仙人掌苹果|r
    .complete 25136,1 --Cactus Apple (6)
step
    #label VileFamiliars
    #loop
    .goto 1411,45.26,57.37,0
    .goto 1411,46.90,59.59,40,0
    .goto 1411,46.94,58.61,40,0
    .goto 1411,46.25,58.00,40,0
    .goto 1411,46.48,57.25,40,0
    .goto 1411,45.86,57.43,40,0
    .goto 1411,45.82,56.60,40,0
    .goto 1411,45.22,57.51,40,0
    .goto 1411,45.10,56.72,40,0
    .goto 1411,44.55,56.14,40,0
    .goto 1411,44.38,56.79,40,0
    .goto 1411,43.78,57.46,40,0
    .goto 1411,43.95,58.65,40,0
    .goto 1411,43.11,58.25,40,0
    .goto 1411,45.26,57.37,40,0
    >>杀死 |cRXP_ENEMY_Vile Familiars|r
    .complete 25131,1 --Vile Familiar (8)
    .mob Vile Familiar
step
    #completewith next
    .goto 1411,43.90,57.80,20,0
    .goto 1411,42.85,57.27,20,0
    .goto 1411,41.15,58.91,20,0
    .goto 1411,40.91,60.24,20,0
    .goto 1411,40.43,62.93,20,0
    >>|cRXP_WARN_使用|r |T133486:0|t[Foreman's Blackjack] |cRXP_WARN_on sleeping |r|cRXP_FRIENDLY_Lazy Peons|r
    .complete 25134,1 --Peons Awoken (4)
    .use 16114
    .target Lazy Peon
step
    .goto 1411,40.65,62.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈纳祖|r
    .turnin 25128 >>交任务: |cRXP_FRIENDLY_哈纳祖|r
    .turnin 25129 >>交任务: |cRXP_FRIENDLY_萨科斯|r
    .accept 25130 >>接任务: |cRXP_WARN_返回大兽穴|r
    .target Hana'zua
step
    #label WakePeons
    #loop
    .goto 1411,45.53,65.80,0
    .goto 1411,38.84,61.82,20,0
    .goto 1411,39.78,67.17,20,0
    .goto 1411,40.71,68.62,20,0
    .goto 1411,40.42,62.96,20,0
    .goto 1411,46.74,60.65,20,0
    .goto 1411,47.08,57.87,20,0
    .goto 1411,43.90,57.78,20,0
    .goto 1411,42.84,57.25,20,0
    .goto 1411,41.14,58.93,20,0
    .goto 1411,40.89,60.23,20,0
    .goto 1411,45.53,65.80,20,0
    >>|cRXP_WARN_使用|r |T133486:0|t[Foreman's Blackjack] |cRXP_WARN_on sleeping |r|cRXP_FRIENDLY_Lazy Peons|r
    .complete 25134,1 --Peons Awoken (4)
    .use 16114
    .target Lazy Peon
step
    .goto 1411,42.73,67.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_戈加尔|r
    .turnin 25136 >>交任务: |cRXP_FRIENDLY_戈加尔的清凉果|r
    .target Galgar
    .isQuestComplete 25136
step
    .goto 1411,43.45,67.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖雷萨|r
    .turnin 25131 >>交任务: |cRXP_FRIENDLY_邪灵劣魔|r
    .target Zureetha Fargaze
step
    .goto 1411,43.53,67.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头塔兹利尔|r
    .turnin 25134 >>交任务: |cRXP_FRIENDLY_懒惰的苦工|r
    .accept 25135 >>接任务: |cRXP_LOOT_塔兹利尔的镐|r
    .target Foreman Thazz'ril
step
    .goto 1411,43.45,67.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖雷萨|r
    .accept 25132 >>接任务: |cRXP_LOOT_火刃奖章|r
    .target Zureetha Fargaze
step
    #loop
    .goto 1411,44.85,59.65,0
    .goto 1411,40.52,60.35,20,0
    .goto 1411,41.59,58.59,20,0
    .goto 1411,42.60,58.76,20,0
    .goto 1411,44.64,58.22,20,0
    .goto 1411,45.45,58.45,20,0
    .goto 1411,44.85,59.65,20,0
    >>掠夺 |cRXP_LOOT_仙人掌苹果|r
    .complete 25136,1 --6/6 Cactus Apple
step
    #completewith next
    .goto 1411,45.41,55.69,30 >>进入洞穴
step
    #completewith Yarrog
	>>杀死 |cRXP_ENEMY_Felstalkers|r
    .complete 25132,1 --5/5 Felstalker slain
    .mob Felstalker
step
    .goto 1411,45.36,56.44,15,0
    .goto 1411,44.57,54.76,15,0
    .goto 1411,43.73,53.79
    >>战利品 |cRXP_LOOT_Thazz'ril 的选择|r 在地面上
    .complete 25135,1 --1/1 Thazz'ril's Pick
step
	#label Yarrog
    .goto 1411,43.15,55.47,15,0
    .goto 1411,42.43,53.49
    >>杀死 |cRXP_ENEMY_Yarrog Baneshadow|r。掠夺他的 |cRXP_LOOT_Medallion|r
    .complete 25132,2 --1/1 Burning Blade Medallion
    .mob Yarrog Baneshadow
step
    .goto 1411,42.42,54.14,15,0
    .goto 1411,42.98,55.32,15,0
    .goto 1411,44.48,54.98,15,0
    .goto 1411,44.77,54.56,15,0
    .goto 1411,44.81,53.15,15,0
    .goto 1411,44.10,52.94,15,0
    .goto 1411,42.70,52.97
	>>杀死 |cRXP_ENEMY_Felstalkers|r
    .complete 25132,1 --5/5 Felstalker slain
    .mob Felstalker
step
    #completewith next
    .goto 1411,42.50,54.48,-1
    .goto 1411,44.77,54.64,-1
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    >>|cRXP_WARN_确保你死在航点箭头附近|r
    .target Spirit Healer
step
    .goto 1411,43.23,68.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高内克|r
    .turnin 25130 >>交任务: |cRXP_FRIENDLY_返回大兽穴|r
    .target Gornek
step
    .goto 1411,42.74,67.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_戈加尔|r
    .turnin 25136 >>交任务: |cRXP_FRIENDLY_戈加尔的清凉果|r
    .target Galgar
step
    .goto 1411,43.45,67.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖雷萨|r
    .turnin 25132 >>交任务: |cRXP_FRIENDLY_火刃奖章|r
    .accept 25133 >>接任务: |cRXP_LOOT_去森金村报到|r << Orc
    .target Zureetha Fargaze
step
    .goto 1411,43.53,67.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头塔兹利尔|r
    .turnin 25135 >>交任务: |cRXP_FRIENDLY_塔兹利尔的镐|r
    .target Foreman Thazz'ril

    ]])

RXPGuides.RegisterGuide([[
#cata
<< Horde
#name 1-6 暗矛岛
#next 6-10 杜隆塔尔
#version 1
--#group RXP 大灾变 (H)
#defaultfor Troll
#group RXP 大灾变 1-80（H）
#sub重量 10000

step << !Troll
    #completewith next
    +|cRXP_WARN_您已选择一本针对巨魔的指南。您应该选择与您开始的相同的起始区|r
step
    .goto 1411,62.45,84.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_金萨拉|r
	.accept 24770 >>接任务: |cRXP_WARN_暗矛的崛起|r << Rogue
	.accept 24607 >>接任务: |cRXP_WARN_暗矛的崛起|r << Warrior
	.accept 24750 >>接任务: |cRXP_WARN_暗矛的崛起|r << Mage
	.accept 24758 >>接任务: |cRXP_WARN_暗矛的崛起|r << Shaman
	.accept 24764 >>接任务: |cRXP_WARN_暗矛的崛起|r << Druid
	.accept 24776 >>接任务: |cRXP_WARN_暗矛的崛起|r << Hunter
	.accept 24782 >>接任务: |cRXP_WARN_暗矛的崛起|r << Priest
	.accept 26272 >>接任务: |cRXP_WARN_暗矛的崛起|r << Warlock
    .target Jin'thala
step << Rogue
    .goto 1411,65.89,83.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷加提|r
    .turnin 24770 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24771 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Legati
step << Warrior
    .goto 1411,65.79,84.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺泰特|r
    .turnin 24607 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24639 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Nortet
step << Mage
    .goto 1411,68.22,83.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索拉萨|r
    .turnin 24750 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24751 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Soratha
step << Shaman
    .goto 1411,64.94,84.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奈卡利|r
    .turnin 24758 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24759 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Nekali
step << Druid
    .goto 1411,67.67,84.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岑塔布拉|r
    .turnin 24764 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24751 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Zen'tabra
step << Hunter
    .goto 1411,67.09,83.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_欧塔扎|r
    .turnin 24776 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24777 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Ortezza
step << Priest
    .goto 1411,67.59,83.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图娜尼|r
    .turnin 24782 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24783 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Tunari
step << Warlock
    .goto 1411,64.92,83.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃德雷卡|r
    .turnin 26272 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 26273 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Voldreka
step
    .goto 1411,66.912,83.481 << Hunter
    .goto 1411,67.907,84.600 << Druid
    .goto 1411,68.617,84.307 << Mage
    .goto 1411,67.825,82.582 << Priest
    .goto 1411,65.927,83.015 << Rogue
    .goto 1411,65.069,82.878 << Warlock
    .goto 1411,64.732,84.031 << Shaman
    .goto 1411,65.931,84.338 << Warrior
 	>>杀死|cRXP_ENEMY_Tiki 目标|r
	.complete 24771,1 << Rogue --Kill Tiki Target (x6) 
	.complete 24639,1 << Warrior --Kill Tiki Target (x6) 
	.complete 24751,1 << Mage --Kill Tiki Target (x6) 
	.complete 24759,1 << Shaman --Kill Tiki Target (x6) 
	.complete 24751,1 << Druid --Kill Tiki Target (x6) 
	.complete 24777,1 << Hunter --Kill Tiki Target (x6) 
	.complete 24783,1 << Priest --Kill Tiki Target (x6) 
	.complete 26273,1 << Warlock --Kill Tiki Target (x6) 
	.mob Tiki Target
step << Rogue
    .goto 1411,65.89,83.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷加提|r
    .turnin 24771 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24773 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Legati
step << Warrior
    .goto 1411,65.79,84.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺泰特|r
    .turnin 24639 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 211 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Nortet
step << Mage
    .goto 1411,68.22,83.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索拉萨|r
    .turnin 24751 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24753 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Soratha
step << Shaman
    .goto 1411,64.94,84.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奈卡利|r
    .turnin 24759 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24761 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Nekali
step << Druid
    .goto 1411,67.67,84.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岑塔布拉|r
    .turnin 24765 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24767 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Zen'tabra
step << Hunter
    .goto 1411,67.09,83.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_欧塔扎|r
    .turnin 24777 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24779 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Ortezza
step << Priest
    .goto 1411,67.59,83.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图娜尼|r
    .turnin 24783 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24785 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Tunari
step << Warlock
    .goto 1411,64.92,83.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃德雷卡|r
    .turnin 26273 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 26275 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Voldreka
step << Rogue
    #loop
    .goto 1411,65.51,80.26,0
    .goto 1411,64.49,80.21,0
    .goto 1411,65.51,80.26,40,0
    .goto 1411,65.08,79.72,40,0
    .goto 1411,64.49,80.21,40,0
    .goto 1411,64.78,81.23,40,0
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
	.complete 24773,1 --Collect Wildmane Cat Pelt (x6)
	.mob Wildmane Cat
step << Warrior
    #loop
    .goto 1411,64.71,86.19,0
    .goto 1411,66.60,87.54,0
    .goto 1411,64.71,86.19,40,0
    .goto 1411,65.45,86.86,40,0
    .goto 1411,65.38,87.62,40,0
    .goto 1411,66.60,87.54,40,0
    .goto 1411,66.86,86.75,40,0
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
	.complete 24639,1 --Collect Wildmane Cat Pelt (x6) 
	.mob Wildmane Cat
step << Mage
    #loop
    .goto 1411,69.46,86.13,0
    .goto 1411,69.35,82.48,0
    .goto 1411,69.46,86.13,40,0
    .goto 1411,69.45,85.51,40,0
    .goto 1411,69.35,83.72,40,0
    .goto 1411,69.35,82.48,40,0
    .goto 1411,69.25,81.02,40,0
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
	.complete 24753,1 --Collect Wildmane Cat Pelt (x6) 
	.mob Wildmane Cat
step << Shaman
    #loop
    .goto 1411,63.99,83.54,0
    .goto 1411,64.99,79.80,0
    .goto 1411,63.99,83.54,40,0
    .goto 1411,64.73,81.40,40,0
    .goto 1411,64.52,80.28,40,0
    .goto 1411,64.99,79.80,40,0
    .goto 1411,65.55,80.36,40,0
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
	.complete 24761,1 --Collect Wildmane Cat Pelt (x6) 
	.mob Wildmane Cat
step << Druid
    #loop
    .goto 1411,69.46,86.13,0
    .goto 1411,69.35,82.48,0
    .goto 1411,69.46,86.13,40,0
    .goto 1411,69.45,85.51,40,0
    .goto 1411,69.35,83.72,40,0
    .goto 1411,69.35,82.48,40,0
    .goto 1411,69.25,81.02,40,0
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
	.complete 24767,1 --Collect Wildmane Cat Pelt (x6) 
	.mob Wildmane Cat
step << Hunter
    #loop
    .goto 1411,67.19,81.74,0
    .goto 1411,68.81,80.40,0
    .goto 1411,67.19,81.74,40,0
    .goto 1411,66.11,80.56,40,0
    .goto 1411,66.33,80.15,40,0
    .goto 1411,67.11,79.64,40,0
    .goto 1411,68.13,79.69,40,0
    .goto 1411,68.81,80.40,40,0
    .goto 1411,69.02,81.08,40,0
    .goto 1411,68.47,81.43,40,0
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
	.complete 24779,1 --Collect Wildmane Cat Pelt (x6) 
	.mob Wildmane Cat
step << Priest
    #loop
    .goto 1411,67.19,81.74,0
    .goto 1411,69.02,81.08,0
    .goto 1411,67.19,81.74,40,0
    .goto 1411,66.11,80.56,40,0
    .goto 1411,66.33,80.15,40,0
    .goto 1411,67.11,79.64,40,0
    .goto 1411,68.13,79.69,40,0
    .goto 1411,68.81,80.40,40,0
    .goto 1411,69.02,81.08,40,0
    .goto 1411,68.47,81.43,40,0
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
	.complete 24785,1 --Collect Wildmane Cat Pelt (x6) 
	.mob Wildmane Cat
step << Warlock
    #loop
    .goto 1411,65.51,80.26,0
    .goto 1411,64.78,81.23,0
    .goto 1411,65.51,80.26,40,0
    .goto 1411,65.08,79.72,40,0
    .goto 1411,64.49,80.21,40,0
    .goto 1411,64.78,81.23,40,0
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
	.complete 26275,1 --Collect Wildmane Cat Pelt (x6) 
	.mob Wildmane Cat
step << Rogue
    .goto 1411,65.89,83.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷加提|r
    .turnin 24773 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24774 >>接任务: |cRXP_WARN_试炼场|r
    .target Legati
step << Warrior
    .goto 1411,65.79,84.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺泰特|r
    .turnin 211 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 212 >>接任务: |cRXP_WARN_试炼场|r
    .target Nortet
step << Mage
    .goto 1411,68.22,83.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索拉萨|r
    .turnin 24753 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24754 >>接任务: |cRXP_WARN_试炼场|r
    .target Soratha
step << Shaman
    .goto 1411,64.94,84.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奈卡利|r
    .turnin 24761 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24762 >>接任务: |cRXP_WARN_试炼场|r
    .target Nekali
step << Druid
    .goto 1411,67.67,84.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岑塔布拉|r
    .turnin 24767 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24768 >>接任务: |cRXP_WARN_试炼场|r
    .target Zen'tabra
step << Hunter
    .goto 1411,67.09,83.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_欧塔扎|r
    .turnin 24779 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24780 >>接任务: |cRXP_WARN_试炼场|r
    .target Ortezza
step << Priest
    .goto 1411,67.59,83.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图娜尼|r
    .turnin 24785 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24786 >>接任务: |cRXP_WARN_试炼场|r
    .target Tunari
step << Warlock
    .goto 1411,64.92,83.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃德雷卡|r
    .turnin 26275 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 26276 >>接任务: |cRXP_WARN_试炼场|r
    .target Voldreka
step << Rogue
    .goto 1411,65.58,83.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Jailor|r
	.complete 24774,1 --Speak to a Darkspear Jailor (x1)
    .skipgossip
    .target Darkspear Jailor
step << Warrior
    .goto 1411,65.58,83.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
    .complete 212,1 --Speak to a Darkspear Jailor (x1)
    .skipgossip
    .target Darkspear Jailor
step << Mage
    .goto 1411,67.47,84.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
	.complete 24754,1 << Mage --Speak to a Darkspear Jailor (x1)
    .skipgossip
    .target Darkspear Jailor
step << Shaman
    .goto 1411,65.58,83.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
    .complete 24762,1 --Speak to a Darkspear Jailor (x1)
    .skipgossip
    .target Darkspear Jailor
step << Druid
    .goto 1411,67.47,84.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
	.complete 24768,1 --Speak to a Darkspear Jailor (x1)
    .skipgossip
    .target Darkspear Jailor
step << Hunter
    .goto 1411,67.47,84.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
	.complete 24780,1 --Speak to a Darkspear Jailor (x1)
    .skipgossip
    .target Darkspear Jailor
step << Priest
    .goto 1411,67.47,84.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
	.complete 24786,1 --Speak to a Darkspear Jailor (x1)
    .skipgossip
    .target Darkspear Jailor
step << Warlock
    .goto 1411,65.58,83.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
	.complete 26276,1 --Speak to a Darkspear Jailor (x1)
    .skipgossip
    .target Darkspear Jailor
step << Rogue
    .goto 1411,65.29,83.74
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
	.complete 24774,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Warrior
    .goto 1411,65.29,83.74
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
	.complete 212,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Mage
    .goto 1411,67.37,83.94
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
	.complete 24754,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Shaman
    .goto 1411,65.29,83.74
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
	.complete 24762,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Druid
    .goto 1411,67.37,83.94
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
	.complete 24768,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Hunter
    .goto 1411,67.37,83.94
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
	.complete 24780,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Priest
    .goto 1411,67.37,83.94
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
	.complete 24786,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Warlock
    .goto 1411,65.29,83.74
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
	.complete 26276,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Rogue
    .goto 1411,65.89,83.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷加提|r
    .turnin 24774 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24772 >>接任务: |cRXP_WARN_潜行者的技艺|r
    .train 2098 >>训练 |T132292:0|t[剔骨]
    .target Legati
step << Warrior
    .goto 1411,65.79,84.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺泰特|r
    .turnin 212 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 210 >>接任务: |cRXP_WARN_克拉兹克的烹调锅|r
    .train 100 >>|T132337:0|t[充电]
    .target Nortet
step << Mage
    .goto 1411,68.22,83.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索拉萨|r
    .turnin 24754 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24752 >>接任务: |cRXP_WARN_法师的技艺|r
    .train 5143 >>训练 |T136096:0|t[奥术飞弹]
    .target Soratha
step << Shaman
    .goto 1411,64.94,84.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奈卡利|r
    .turnin 24762 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24760 >>接任务: |cRXP_WARN_萨满祭司的技艺|r
    .train 73899 >>训练 |T460956:0|t[原始打击]
    .target Nekali
step << Druid
    .goto 1411,67.67,84.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岑塔布拉|r
    .turnin 24768 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24766 >>接任务: |cRXP_WARN_德鲁伊的技艺|r
    .train 774 >>列车 |T136081:0|t[复兴]
    .target Zen'tabra
step << Hunter
    .goto 1411,67.09,83.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_欧塔扎|r
    .turnin 24780 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24778 >>接任务: |cRXP_WARN_猎人的技艺|r
    .train 56641 >>火车 |T132213:0|t[稳固射击]
    .target Ortezza
step << Priest
    .goto 1411,67.59,83.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图娜尼|r
    .turnin 24786 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24784 >>接任务: |cRXP_WARN_牧师的技艺|r
    .train 2061 >>训练 |T135907:0|t[快速治疗]
    .target Tunari
step << Warlock
    .goto 1411,64.92,83.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃德雷卡|r
    .turnin 26276 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 26274 >>接任务: |cRXP_WARN_术士的技艺|r
    .train 348 >>列车 |T135817:0|t[献祭]
    .target Voldreka
step << Rogue
	.goto 1411,65.91,83.45
	>>对 |cRXP_ENEMY_Tiki 目标|r 施放 |T132292:0|t[Eviscerate]
	.complete 24772,1 --Cast Eviscerate (x3)
	.mob Tiki Target
step << Warrior
	.goto 1411,65.98,84.42
	>>对 |cRXP_ENEMY_Tiki 目标|r 施放 |T132337:0|t[冲锋]
	.complete 210,1 --Cast Charge (x3)
	.mob Tiki Target
step << Mage
	.goto 1411,68.91,84.31
	>>对 |cRXP_ENEMY_Tiki 目标|r 施放 |T136096:0|t[奥术飞弹]
	.complete 24752,1 --Cast Arcane Missiles (x3)
	.mob Tiki Target
step << Shaman
	.goto 1411,64.86,84.69
	>>对 |cRXP_ENEMY_Tiki 目标|r 施放 |T460956:0|t[原始打击]
	.complete 24760,1 --Cast Primal Strike (x3)
	.mob Tiki Target
step << Druid
	.goto 1411,67.91,84.60
	>>对 |cRXP_FRIENDLY_受伤的暗矛守望者|r 施放 |T136081:0|t[复生]
	.complete 24766,1 --Cast Rejuvenation (x1)
	.target Wounded Darkspear Watcher
step << Hunter
	.goto 1411,67.18,83.12
	>>对 |cRXP_ENEMY_Tiki 目标|r 施放 |T132213:0|t[稳固射击]
	.complete 24778,1 --Steady Shot (x3)
	.mob Tiki Target
step << Priest
	.goto 1411,67.35,83.24
	>>对 |cRXP_FRIENDLY_受伤的暗矛守望者|r 施放 |T135907:0|t[快速治疗]
	.complete 24784,1 --Cast Flash Heal (x5)
	.target Wounded Darkspear Watcher
step << Warlock
	.goto 1411,65.07,82.88
	>>对 |cRXP_ENEMY_Tiki 目标|r 施放 |T135817:0|t[献祭]
	.complete 26274,1 --Cast Immolate (x3)
	.mob Tiki Target
step << Rogue
    .goto 1411,65.89,83.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷加提|r
    .turnin 24772 >>交任务: |cRXP_FRIENDLY_潜行者的技艺|r
    .accept 24775 >>接任务: |cRXP_WARN_喜出望外|r
    .target Legati
step << Warrior
    .goto 1411,65.79,84.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺泰特|r
    .turnin 211 >>交任务: |cRXP_FRIENDLY_啊，安多哈尔！|r
    .accept 212 >>接任务: |cRXP_WARN_喜出望外|r
    .target Nortet
step << Mage
    .goto 1411,68.22,83.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索拉萨|r
    .turnin 24752 >>交任务: |cRXP_FRIENDLY_法师的技艺|r
    .accept 24755 >>接任务: |cRXP_WARN_喜出望外|r
    .target Soratha
step << Shaman
    .goto 1411,64.94,84.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奈卡利|r
    .turnin 24760 >>交任务: |cRXP_FRIENDLY_萨满祭司的技艺|r
    .accept 24763 >>接任务: |cRXP_WARN_喜出望外|r
    .target Nekali
step << Druid
    .goto 1411,67.67,84.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岑塔布拉|r
    .turnin 24766 >>交任务: |cRXP_FRIENDLY_德鲁伊的技艺|r
    .accept 24769 >>接任务: |cRXP_WARN_喜出望外|r
    .target Zen'tabra
step << Hunter
    .goto 1411,67.09,83.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_欧塔扎|r
    .turnin 24778 >>交任务: |cRXP_FRIENDLY_猎人的技艺|r
    .accept 24781 >>接任务: |cRXP_WARN_喜出望外|r
    .target Ortezza
step << Priest
    .goto 1411,67.59,83.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图娜尼|r
    .turnin 24784 >>交任务: |cRXP_FRIENDLY_牧师的技艺|r
    .accept 24787 >>接任务: |cRXP_WARN_喜出望外|r
    .target Tunari
step << Warlock
    .goto 1411,64.92,83.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃德雷卡|r
    .turnin 26274 >>交任务: |cRXP_FRIENDLY_术士的技艺|r
    .accept 26277 >>接任务: |cRXP_WARN_喜出望外|r
    .target Voldreka
step
    .goto 1411,68.86,88.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vol'Jin|r
    .turnin 213 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Warrior
    .turnin 24755 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Mage
    .turnin 24763 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Shaman
    .turnin 24769 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Druid
    .turnin 24775 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Rogue
    .turnin 24781 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Hunter
    .turnin 24787 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Priest
    .turnin 26277 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Warlock
    .accept 25064 >>接任务: |cRXP_WARN_莫拉亚|r
    .target Vol'Jin
step
    .goto 1411,68.50,87.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tora'Jin|r
    .accept 25037 >>接任务: |cRXP_WARN_捉螃蟹|r
    .target Tora'Jin
step
    .goto 1411,67.26,87.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莫拉亚|r
    .turnin 25064 >>交任务: |cRXP_FRIENDLY_莫拉亚|r
    .accept 24622 >>接任务: |cRXP_WARN_巨魔的铁杆伙伴|r
    .target Moraya
step
    #label CrossBridge
    #completewith Kijara
    .goto 1411,66.09,89.14,40,0
    .goto 1411,64.94,89.02,40,0 
    .goto 1411,63.42,93.50,40 >>过桥
step
    #require CrossBridge
    #completewith next
    >>杀死 |cRXP_ENEMY_侏儒冲浪爬行者s|r。掠夺他们的 |cRXP_LOOT_Meat|r
    .complete 25037,1 --Collect Fresh Crawler Meat (x5)
    .mob 侏儒冲浪爬行者
step
    #label Kijara
    .goto 1411,63.20,95.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基加拉|r
    .turnin 24622 >>交任务: |cRXP_FRIENDLY_巨魔的铁杆伙伴|r
    .accept 24623 >>接任务: |cRXP_WARN_拯救幼崽|r
    .target Kijara
step
    .goto 1411,63.44,95.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_缇卡什|r
    .accept 24625 >>接任务: |cRXP_WARN_海巫的配偶|r
    .accept 24624 >>接任务: |cRXP_WARN_给迷失者的怜悯|r
    .target Tegashi
step
    #completewith Bloodtalons
    >>杀死 |cRXP_ENEMY_侏儒冲浪爬行者s|r。掠夺他们的 |cRXP_LOOT_Meat|r
    .complete 25037,1 --Collect Fresh Crawler Meat (x5)
    .mob 侏儒冲浪爬行者
step
	#completewith Bloodtalons
	.goto 1411,61.32,91.76,40,0
	>>当你靠近 |cRXP_FRIENDLY_Lost Bloodtalon Hatchling|r 时，使用你的 |T132161:0|t[|cRXP_LOOT_Bloodtalon Whistle|r] 来拯救它们
	.complete 24623,1 --Rescue Bloodtalon Hatchling (x12) 
	.target Bloodtalon Hatchling
	.use 52283
step
    #completewith next
   	.goto 1411,60.89,91.69,40,0
	>>杀死 |cRXP_ENEMY_Corrupted Bloodtalon|r
	.complete 24624,1 --Kill Corrupted Bloodtalon (x8)
	.mob Corrupted Bloodtalon
step
   	.goto 1411,60.39,89.79
	>>杀死 |cRXP_ENEMY_Naj'Tess|r。掠夺他的物品，获得他的 |cRXP_LOOT_Orb|r
	.complete 24625,1 --Collect Naj'Tess' Orb of Corruption (x1)
	.mob Naj'Tess
step
	#label Bloodtalons
#loop
	.line 1411,61.70,91.31,61.58,90.08,61.54,89.48,60.93,88.45,60.78,87.63,59.66,87.65,59.46,88.82,59.13,89.94,58.60,90.66,59.46,90.85,60.21,91.14,60.91,91.69,61.70,91
	.goto 1411,61.70,91.31,30,0
	.goto 1411,61.58,90.08,30,0
	.goto 1411,61.54,89.48,30,0
	.goto 1411,60.93,88.45,30,0
	.goto 1411,60.78,87.63,30,0
	.goto 1411,59.66,87.65,30,0
	.goto 1411,59.46,88.82,30,0
	.goto 1411,59.13,89.94,30,0
	.goto 1411,58.60,90.66,30,0
	.goto 1411,59.46,90.85,30,0
	.goto 1411,60.21,91.14,30,0
	.goto 1411,60.91,91.69,30,0
	.goto 1411,61.70,91.00,30,0
	>>杀死 |cRXP_ENEMY_Corrupted Bloodtalon|r
	.complete 24624,1 --Kill Corrupted Bloodtalon (x8)
	.mob Corrupted Bloodtalon
step
#loop
	.line 1411,61.70,91.31,61.58,90.08,61.54,89.48,60.93,88.45,60.78,87.63,59.66,87.65,59.46,88.82,59.13,89.94,58.60,90.66,59.46,90.85,60.21,91.14,60.91,91.69,61.70,91
	.goto 1411,61.70,91.31,30,0
	.goto 1411,61.58,90.08,30,0
	.goto 1411,61.54,89.48,30,0
	.goto 1411,60.93,88.45,30,0
	.goto 1411,60.78,87.63,30,0
	.goto 1411,59.66,87.65,30,0
	.goto 1411,59.46,88.82,30,0
	.goto 1411,59.13,89.94,30,0
	.goto 1411,58.60,90.66,30,0
	.goto 1411,59.46,90.85,30,0
	.goto 1411,60.21,91.14,30,0
	.goto 1411,60.91,91.69,30,0
	.goto 1411,61.70,91.00,30,0
	>>当你靠近 |cRXP_FRIENDLY_Lost Bloodtalon Hatchling|r 时，使用你的 |T132161:0|t[|cRXP_LOOT_Bloodtalon Whistle|r] 来拯救它们
	.complete 24623,1 --Rescue Bloodtalon Hatchling (x12)
	.target Bloodtalon Hatchling
	.use 52283
step
	#completewith next
    >>杀死 |cRXP_ENEMY_侏儒冲浪爬行者s|r。掠夺他们的 |cRXP_LOOT_Meat|r
    .complete 25037,1 --Collect Fresh Crawler Meat (x5)
    .mob 侏儒冲浪爬行者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_缇卡什|r, |cRXP_FRIENDLY_基加拉|r
    .turnin 24625 >>交任务: |cRXP_FRIENDLY_海巫的配偶|r
    .turnin 24624 >>交任务: |cRXP_FRIENDLY_给迷失者的怜悯|r
    .goto 1411,63.44,95.23
    .turnin 24623 >>交任务: |cRXP_FRIENDLY_拯救幼崽|r
    .accept 24626 >>接任务: |cRXP_WARN_年轻气盛|r
    .goto 1411,63.20,95.52
    .target Tegashi
    .target Kijara
step
    #loop
	.line 463,45.93,86.53,46.15,88.00,43.81,88.49,43.46,91.82,44.25,91.93,45.27,89.85,45.95,89.71,46.91,93.18,47.68,92.85,47.84,88.58,48.45,90.12,47.51,88.96,47.42,86.91,46.21,85.10,46.03,83.83,44.17,82.86,42.43,83.12,41.15,85.98,40.87,88.56,42.30,88.10,43.60,85.27,44.56,85.10,45.93,86.53
    .goto 463,45.93,86.53,30,0
    .goto 463,44.56,85.10,30,0
    .goto 463,43.60,85.27,30,0
    .goto 463,42.30,88.10,30,0
    .goto 463,40.87,88.56,30,0
    .goto 463,41.15,85.98,30,0
    .goto 463,42.43,83.12,30,0
    .goto 463,44.17,82.86,30,0
    .goto 463,46.03,83.83,30,0
    .goto 463,46.21,85.10,30,0
    .goto 463,47.42,86.91,30,0
    .goto 463,47.51,88.96,30,0
    .goto 463,48.45,90.12,30,0
    .goto 463,47.84,88.58,30,0
    .goto 463,47.68,92.85,30,0
    .goto 463,46.91,93.18,30,0
    .goto 463,45.95,89.71,30,0
    .goto 463,45.27,89.85,30,0
    .goto 463,44.25,91.93,30,0
    .goto 463,43.46,91.82,30,0
    .goto 463,43.81,88.49,30,0
    .goto 463,46.15,88.00,30,0
    >>对 |cRXP_FRIENDLY_Swiftclaw|r 使用 |T134326:0|t[血爪套索]
    >>|cRXP_WARN_他出现在你旁边，然后逆时针绕着岛跑|r
    .complete 24626,1 --1/1 Capture Swiftclaw
    .unitscan Swiftclaw
    .use 50053
step
    .goto 1411,63.40,93.52,40,0
    .goto 1411,64.81,89.25,40,0
    .goto 1411,65.80,88.52
    >>骑 |cRXP_FRIENDLY_Swiftclaw|r 回到 Raptor Pen
    .complete 24626,2 --1/1 Return Swiftclaw to the Raptor Pens
step
    .goto 1411,66.65,90.61
    .goto 1411,66.67,91.36
    .goto 1411,67.72,91.16
    .goto 1411,68.07,90.26
    .goto 1411,67.59,90.40
    >>杀死 |cRXP_ENEMY_侏儒冲浪爬行者s|r。掠夺他们的 |cRXP_LOOT_Meat|r
    .complete 25037,1 --Collect Fresh Crawler Meat (x5)
    .mob 侏儒冲浪爬行者
step
    .goto 1411,67.24,87.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莫拉亚|r
    .turnin 24626 >>交任务: |cRXP_FRIENDLY_年轻气盛|r
    .target Moraya
step
    .goto 1411,68.50,87.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托拉金|r
    .turnin 25037 >>交任务: |cRXP_FRIENDLY_捉螃蟹|r
    .target Tora'Jin
step << Troll
    .goto 1411,67.98,89.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托尔图盖|r
    .accept 25035 >>接任务: |cRXP_WARN_突破防线|r
    .target Tortunga << Troll
step << Troll
    .goto 1411,68.02,89.06
    .gossipoption 112038 >>对话: |cRXP_FRIENDLY_佐奴恩|r
    .timer 39,Breaking the Line RP
    .target Jornun
    .isOnQuest 25035
step << Troll
    .goto 1411,67.96,74.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莫拉基|r
    .turnin 25035 >>交任务: |cRXP_FRIENDLY_突破防线|r
    .accept 24812 >>接任务: |cRXP_WARN_不再怜悯|r
    .accept 24813 >>接任务: |cRXP_WARN_领土神像|r
    .target Morakki
step << Troll
    #completewith next
    >>杀死 |cRXP_ENEMY_Spitescale Nagas|r
    .complete 24812,1 --12/12 Spitescale Naga Slain
    .mob Spitescale Wavethrasher
    .mob Spitescale Siren
step << Troll
    #loop
    .goto 1411,69.043,71.780,0
    .goto 1411,68.748,72.676,12,0
    .goto 1411,69.043,71.780,12,0
    .goto 1411,69.219,70.538,12,0
    .goto 1411,68.692,70.474,12,0
    .goto 1411,69.288,69.600,12,0
    .goto 1411,68.760,69.642,12,0
    .goto 1411,68.363,70.769,12,0
    .use 52065>>使用 |cRXP_PICK_Spitescale Flags|r 旁边的 |T132482:0|t[Territorial Fetish]
    .complete 24813,1 --8/8 Territorial Fetish placed
step << Troll
    #loop
    .goto 1411,69.043,71.780,0
    .goto 1411,68.748,72.676,12,0
    .goto 1411,69.043,71.780,12,0
    .goto 1411,69.219,70.538,12,0
    .goto 1411,68.692,70.474,12,0
    .goto 1411,69.288,69.600,12,0
    .goto 1411,68.760,69.642,12,0
    .goto 1411,68.363,70.769,12,0
    >>杀死 |cRXP_ENEMY_Spitescale Nagas|r
    >>|cfff78300别跳下去|r
    .complete 24812,1 --12/12 Spitescale Naga Slain
    .mob Spitescale Wavethrasher
    .mob Spitescale Siren
step << skip
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莫拉基|r
    .goto 1411,67.96,74.08
    .turnin 24812 >>交任务: |cRXP_FRIENDLY_不再怜悯|r
    .turnin 24813 >>交任务: |cRXP_FRIENDLY_领土神像|r
    .accept 24814 >>接任务: |cRXP_WARN_古老的宿敌|r
    .target Morakki
step << Troll
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莫拉基|r
    .goto 1411,67.96,74.08
    .turnin 24812 >>交任务: |cRXP_FRIENDLY_不再怜悯|r
    .turnin 24813 >>交任务: |cRXP_FRIENDLY_领土神像|r
    .target Morakki
step << skip
    .goto 1411,68.60,74.87,10,0
    .goto 1411,69.12,73.99,10,0
    .goto 1411,69.09,72.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃金|r
    .complete 24814,1 --Speak with Vol'jin at Spitescale Cove (1)
    .skipgossip
    .target Vol'jin
step << skip
    .goto 1411,68.47,71.44
    >>专注于杀死小怪，让 |cRXP_FRIENDLY_Vanira|r 和 |cRXP_FRIENDLY_Vol'jin|r 杀死 |cRXP_ENEMY_Zar'jira|r
    .complete 24814,2 --Zar'jira slain (1)
    .mob Zar'jira
    .isQuestTurnedIn 25035
step << skip
    .goto 1411,69.13,72.32
    .gossipoption 37251 >>对话: |cRXP_FRIENDLY_瓦妮拉|r
    .target Vanira
    .isOnQuest 24814
    --VV Add timer in case it's not an instant teleport
step << skip
    .goto 1411,68.86,88.69
    -->>|cRXP_WARN_等待 RP|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vol'Jin|r
    .turnin 24814 >>交任务: |cRXP_FRIENDLY_古老的宿敌|r
    .accept 25073 >>接任务: |cRXP_WARN_森金村|r
    .isQuestTurnedIn 25035
    ]])

RXPGuides.RegisterGuide([[
#cata
<< Horde
#name 6-10 杜隆塔尔
#next 10-22 艾萨拉
#version 1
--#group RXP 大灾变 (H)
#defaultfor Orc/Troll
#group RXP 大灾变 1-80（H）
#sub重量 10000

step << skip
    #completewith BreakingtheChain
    .goto 1411,67.21,86.10,40,0
    .goto 1411,63.67,82.61,40,0
    .goto 1411,60.48,81.45,40,0
    .goto 1411,60.09,79.68,40,0
    .subzone 367 >>前往森金村
step << Troll
    #completewith BreakingtheChain
    .goto 1411,64.10,74.25,40,0
    .subzone 367 >>前往森金村
step << Orc
    #completewith BreakingtheChain
    .goto 1411,48.47,67.93,40,0
    .goto 1411,50.44,68.39,40,0
    .subzone 367 >>前往森金村
step
    #optional << Troll
    .goto 1411,55.95,74.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_加德林大师|r
    .turnin 25073 >>交任务: |cRXP_FRIENDLY_森金村|r << Troll
    .turnin 25133 >>交任务: |cRXP_FRIENDLY_去森金村报到|r << Orc
    .accept 25167 >>接任务: |cRXP_WARN_斩断链条|r
    .target Master Gadrin
    .isQuestTurnedIn 24814 << Troll
step << Troll
    #label BreakingtheChain
    .goto 1411,55.95,74.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_加德林大师|r
    .accept 25167 >>接任务: |cRXP_WARN_斩断链条|r
    .target Master Gadrin
step << Shaman
    .goto 1411,56.27,75.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_寇娜|r
    .train 8042 >>训练你的职业法术
    .target Cona
step << Druid
    .goto 1411,56.18,75.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德恩库露|r
    .train 8921 >>训练你的职业法术
    .target Den'chulu
step << Hunter
    .goto 1411,55.72,73.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_海赞|r
    .train 2973 >>训练你的职业法术
    .target Hai'zan
    .xp <6,1
step
    #completewith next
    .goto 1411,56.13,74.53,10,0
    .goto 1411,56.30,73.89,10 >>进入大屋子
step << Mage/Priest/Warlock/Druid
    #completewith next
    .goto 1411,56.41,73.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_泰塔希|r
    .vendor >>供应商垃圾
    .target Tai'tasi
step << Warrior
    .goto 1411,56.70,73.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_耶尼斯|r
    .train 34428 >>训练你的职业法术
    .target Yeniss
step << Warrior/Shaman/Paladin
    .goto 1411,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_Trayexir交谈|r
    >>|cRXP_BUY_从他那里购买 a|r |T133053:0|t[木槌] |cRXP_BUY_|r
    .collect 2493,1,25168,1 --Collect Wooden Mallet (1)
    .money <0.0665
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Rogue
    .goto 1411,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_Trayexir交谈|r
    >>|cRXP_BUY_从他那里购买 a|r |T135321:0|t[Gladius] |cRXP_BUY_|r
    .collect 2488,1,25168,1 --Collect Gladius (1)
    .target Trayexir
    .money <0.0509
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    .goto 1411,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_Trayexir交谈|r
    >>|cRXP_BUY_从他那里购买一把|r |T135499:0|t[霍恩伍德反曲弓] |cRXP_BUY_|r
    .collect 2506,1,25168,1 --Hornwood Recurve Bow (1)
    .target Trayexir
    .money <0.0270
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior/Shaman/Paladin
    #completewith Bombay
    +装备 |T133053:0|t[木槌]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Rogue
    #completewith Bombay
    +装备 |T135321:0|t[短剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    #completewith Bombay
    +装备 |T135499:0|t[霍恩伍德反曲弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Hunter
    .goto 1411,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_Trayexir交谈|r
    >>|cRXP_BUY_从他那里购买一把|r |T132401:0|t[大斧] |cRXP_BUY_|r
    .collect 2491,1,25168,1 --Large Axe (1)
    .money <0.0459
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Hunter
    #completewith Bombay
    +装备 |T132401:0|t[大斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Mage/Priest/Warlock
    #completewith next
    .goto 1411,56.59,73.25,10,0
    .goto 1411,56.50,72.90,10,0
    .goto 1411,56.33,73.28,10 >>上楼去
step << Mage
    .goto 1411,56.37,73.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波姆山库|r, 他在楼上
    .train 2136 >>训练你的职业法术
    .target Bomsanchu
step << Priest
    .goto 1411,56.41,73.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕拉塔|r, 他在楼上
    .train 589 >>训练你的职业法术
    .target Parata
step << Warlock
    .goto 1411,56.31,73.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_古希尼|r, 他在楼上
    .train 87389 >>训练你的职业法术
    .target Gusini
step << Mage/Priest/Warlock
    #completewith next
    .goto 1411,55.71,75.28,10 >>跳向 |cRXP_FRIENDLY_Bom'bay|r
step
    #label Bombay
    .goto 1411,55.71,75.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波贝|r
    .accept 25170 >>接任务: |cRXP_WARN_清理海岸|r
    .target Bom'bay
step
    #completewith next
    .goto 1411,56.45,78.44,40,0
    .goto 1411,53.52,82.09,40,0
    .goto 1411,52.63,83.01,40,0
    >>杀死 |cRXP_ENEMY_冲浪爬行者s|r。掠夺他们的 |cRXP_LOOT_Mucus|r
    .complete 25170,1 --Collect Crawler Mucus (5)
    .mob 冲浪爬行者
step
    #loop
    .goto 1411,52.32,81.53,0
    .goto 1411,51.14,79.19,0
    .goto 1411,49.67,79.64,0
    .goto 1411,52.32,81.53,30,0
    .goto 1411,51.14,79.19,20,0
    .goto 1411,49.67,79.64,30,0
    >>杀死 |cRXP_ENEMY_Northwatch Supply Crates|r 和 |cRXP_ENEMY_Northwatch Lugs|r
    >>|cRXP_WARN_您可能需要等待更多内容重生|r
    .complete 25167,1 --Northwatch Supply Crates destroyed (3)
    .complete 25167,2 --Northwatch Lug (10)
    .mob Northwatch Lug
    .mob Northwatch Supply Crate
step  
    #loop
    .goto 1411,55.68,78.92,0
    .goto 1411,53.52,82.09,0
    .waypoint 1411,56.59,79.22,40,0
    .waypoint 1411,55.68,78.92,40,0
    .waypoint 1411,55.74,79.45,40,0
    .waypoint 1411,55.79,80.54,40,0
    .waypoint 1411,55.15,80.25,40,0
    .waypoint 1411,54.67,80.47,40,0
    .waypoint 1411,54.48,81.37,40,0
    .waypoint 1411,53.52,82.09,40,0
    .waypoint 1411,52.63,83.01,40,0
    .waypoint 1411,56.45,78.44,40,0
    >>杀死 |cRXP_ENEMY_冲浪爬行者s|r。掠夺他们的 |cRXP_LOOT_Mucus|r
    .complete 25170,1 --Collect Crawler Mucus (5)
    .mob 冲浪爬行者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波贝|r, |cRXP_FRIENDLY_加德林大师|r, Lar
    .turnin 25170 >>交任务: |cRXP_FRIENDLY_清理海岸|r
    .accept 25165 >>接任务: |cRXP_WARN_永远不要相信大蝎刺和微笑|r
    .goto 1411,55.78,75.36
    .turnin 25167 >>交任务: |cRXP_FRIENDLY_斩断链条|r
    .accept 25168 >>接任务: |cRXP_WARN_净化峡谷|r
    .goto 1411,55.91,74.72
    .accept 25169 >>接任务: |cRXP_WARN_北卫军的侵略战争|r
    .goto 1411,55.47,75.06
    .target Bom'bay
    .target Master Gadrin
    .target Lar Prowltusk
step << Shaman
    .goto 1411,56.27,75.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_寇娜|r
    .train 8042 >>训练你的职业法术
    .target Cona
step << Druid
    .goto 1411,56.18,75.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德恩库露|r
    .train 8921 >>训练你的职业法术
    .target Den'chulu
step << Hunter
    .goto 1411,55.72,73.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_海赞|r
    .train 2973 >>训练你的职业法术
    .target Hai'zan
    .xp <6,1
step << Warrior
    .goto 1411,56.70,73.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_耶尼斯|r
    .train 34428 >>训练你的职业法术
    .target Yeniss
step << Warrior/Shaman/Paladin
    .goto 1411,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_Trayexir交谈|r
    >>|cRXP_BUY_从他那里购买 a|r |T133053:0|t[木槌] |cRXP_BUY_|r
    .collect 2493,1,25168,1 --Collect Wooden Mallet (1)
    .money <0.0665
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Rogue
    .goto 1411,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_Trayexir交谈|r
    >>|cRXP_BUY_从他那里购买 a|r |T135321:0|t[Gladius] |cRXP_BUY_|r
    .collect 2488,1,25168,1 --Collect Gladius (1)
    .target Trayexir
    .money <0.0509
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    .goto 1411,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_Trayexir交谈|r
    >>|cRXP_BUY_从他那里购买一把|r |T135499:0|t[霍恩伍德反曲弓] |cRXP_BUY_|r
    .collect 2506,1,25168,1 --Hornwood Recurve Bow (1)
    .target Trayexir
    .money <0.0270
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior/Shaman/Paladin
    #completewith AttackPlans
    +装备 |T133053:0|t[木槌]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Rogue
    #completewith AttackPlans
    +装备 |T135321:0|t[短剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    #completewith AttackPlans
    +装备 |T135499:0|t[霍恩伍德反曲弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Hunter
    .goto 1411,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_Trayexir交谈|r
    >>|cRXP_BUY_从他那里购买一把|r |T132401:0|t[大斧] |cRXP_BUY_|r
    .collect 2491,1,25168,1 --Large Axe (1)
    .money <0.0459
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Hunter
    #completewith AttackPlans
    +装备 |T132401:0|t[大斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Mage
    .goto 1411,56.37,73.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波姆山库|r, 他在楼上
    .train 2136 >>训练你的职业法术
    .target Bomsanchu
step << Priest
    .goto 1411,56.41,73.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕拉塔|r, 他在楼上
    .train 589 >>训练你的职业法术
    .target Parata
step << Warlock
    .goto 1411,56.31,73.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_古希尼|r, 他在楼上
    .train 87389 >>训练你的职业法术
    .target Gusini
step
    #loop
    .goto 1411,52.72,75.35,0
    .waypoint 1411,54.15,74.77,40,0
    .waypoint 1411,53.15,76.15,40,0
    .waypoint 1411,52.72,75.35,40,0
    .waypoint 1411,52.27,74.29,40,0
    .waypoint 1411,51.60,73.68,40,0
    .waypoint 1411,51.40,74.88,40,0
    >>攻击 |cRXP_ENEMY_Clattering Scorpids|r
    >>|cRXP_WARN_使用|r |T136061:0|t[毒液提取图腾] |cRXP_WARN_when|r |cRXP_ENEMY_Clattering Scorpids|r |cRXP_WARN_cast|r |T132287:0|t[毒液]
    >>|cRXP_WARN_这有 15 秒的冷却时间。同时拉动多个|r |cRXP_ENEMY_Clattering Scorpids|r |cRXP_WARN_times 来加快进程|r
    .complete 25165,1 --Sample of Scorpid Venom Collected (6)
    .mob Clattering Scorpid
    .use 52505
step
    #completewith AttackPlans
    .goto 1411,50.83,79.13,15,0
    >>杀死 |cRXP_ENEMY_Northwatch 步兵|r 和 |cRXP_ENEMY_Northwatch 游骑兵|r
    .complete 25168,1 --Northwatch Troop (12)
    .mob Northwatch Infantryman
    .mob Northwatch Ranger
step
    >>摧毁地面上的 |cRXP_PICK_Attack Plans|r
    .goto 1411,49.82,81.43
    .complete 25169,1 --Attack Plan: 试炼之谷 burned (1)
step
    >>摧毁地面上的 |cRXP_PICK_Attack Plans|r
    .goto 1411,47.91,77.56
    .complete 25169,2 --Attack Plan: Sen'jin Village burned (1)
step
    #label AttackPlans
    .goto 1411,46.42,78.77
    >>摧毁地面上的 |cRXP_PICK_Attack Plans|r
    .complete 25169,3 --Attack Plan: Orgrimmar burned (1)
step
    #loop
    .goto 1411,48.36,79.40,0
    .goto 1411,46.63,79.76,40,0
    .goto 1411,47.27,80.88,40,0
    .goto 1411,47.84,79.84,40,0
    .goto 1411,47.79,77.95,40,0
    .goto 1411,49.03,79.33,40,0
    .goto 1411,49.89,79.04,40,0
    .goto 1411,49.97,80.86,40,0
    .goto 1411,48.36,79.40,40,0
    >>杀死 |cRXP_ENEMY_Northwatch 步兵|r 和 |cRXP_ENEMY_Northwatch 游骑兵|r
    .complete 25168,1 --Northwatch Troop (12)
    .mob Northwatch Infantryman
    .mob Northwatch Ranger
step
    #completewith next
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生 
    --VV Beta test needed
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波贝|r, Lar, |cRXP_FRIENDLY_加德林大师|r
    .turnin 25165 >>交任务: |cRXP_FRIENDLY_永远不要相信大蝎刺和微笑|r
    .goto 1411,55.74,75.42
    .turnin 25169 >>交任务: |cRXP_FRIENDLY_北卫军的侵略战争|r
    .goto 1411,55.42,75.11
    .turnin 25168 >>交任务: |cRXP_FRIENDLY_净化峡谷|r
    .accept 25171 >>接任务: |cRXP_WARN_骑狼旅行|r
    .goto 1411,55.91,74.78
    .target Bom'bay
    .target Lar Prowltusk
    .target Master Gadrin
step
    .goto 1411,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特莱耶克|r
    .vendor >>供应商垃圾和修复
    .target Trayexir
step << Rogue
    .goto 1411,56.05,73.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_姆纳尔提|r
    .train 15087 >>训练你的职业法术
    .target Munalti
    .xp <8,1
step << Shaman
    .goto 1411,56.27,75.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_寇娜|r
    .train 324 >>训练你的职业法术
    .target Cona
    .xp <8,1
step << Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德恩库露|r
    .goto 1411,56.18,75.24
    .train 768 >>训练你的职业法术
    .target Den'chulu
    .xp <8,1
step << Hunter
    .goto 1411,55.72,73.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_海赞|r
    .train 2973 >>训练你的职业法术
    .target Hai'zan
    .xp <6,1
    .xp >8,1
step << Hunterw 
    .goto 1411,55.72,73.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_海赞|r
    .train 5116 >>训练你的职业法术
    .target Hai'zan
    .xp <8,1
step << Warrior
    .goto 1411,56.70,73.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_耶尼斯|r
    .train 772 >>训练你的职业法术
    .target Yeniss
    .xp <7,1
step << Mage
    .goto 1411,56.37,73.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波姆山库|r, 他在楼上
    .train 96089 >>训练你的职业法术
    .target Bomsanchu
    .xp <7,1
step << Priest
    .goto 1411,56.41,73.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕拉塔|r, 他在楼上
    .train 588 >>训练你的职业法术
    .target Parata
    .xp <8,1
step << Warlock
    .goto 1411,56.31,73.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_古希尼|r, 他在楼上
    .train 687 >>训练你的职业法术
    .target Gusini
    .xp <8,1
step
    .goto 1411,55.26,74.66
    .gossipoption 112084 >>对话: |cRXP_FRIENDLY_狼骑兵希亚什|r
    >>|cRXP_WARN_乘车前往剃刀岭|r
    .timer 67, Riding on RP
    .target Raider Jhash
    .isOnQuest 25171
step
    .goto 1411,51.51,41.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板格罗斯克|r
    .home >>将炉石设置为剃刀岭
    .target Innkeeper Grosk
step
    .goto 1411,52.04,43.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_加索克|r
    .turnin 25171 >>交任务: |cRXP_FRIENDLY_骑狼旅行|r
    .accept 25173 >>接任务: |cRXP_WARN_越来越糟|r
    .target Gar'Thok
step
    .goto 1411,53.03,43.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉尔·诺兹维格|r
    .accept 25176 >>接任务: |cRXP_WARN_顺手牵羊|r
    .target Gail Nozzywig
step
    #label TravelToTiragarde
    #completewith Palliter
    .subzone 372>>前往提拉加德要塞
step
    #completewith Palliter
    >>杀死 |cRXP_ENEMY_Northwatch 海军陆战队|r 和 |cRXP_ENEMY_Northwatch 神枪手|r
    .complete 25173,1 --北方卫士海军陆战队 (6)
    .mob +北方卫士海军陆战队
    .complete 25173,2 --北方城堡神枪手 (6)
    .mob +北方城堡神枪手
step
    #completewith Palliter
    >>掠夺地面上的 |cRXP_LOOT_Kul Tiras Treasure|r
    .complete 25176,1 --Kul Tiras Treasure (6)
step
    #completewith next
    #requires TravelToTiragarde
    .goto 1411,59.48,58.82,8,0
    .goto 1411,59.81,58.44,8,0
    .goto 1411,59.58,57.88,8,0
    .goto 1411,59.31,57.88,8 >>朝城堡二楼的 |cRXP_ENEMY_Lieutenant Palliter|r 移动
step
    #label Palliter
    .goto 1411,59.75,58.31
    >>杀死 |cRXP_ENEMY_Lieutenant Palliter|r
    .complete 25173,3 --Lieutenant Palliter (1)
    .mob Lieutenant Palliter
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Northwatch 海军陆战队|r 和 |cRXP_ENEMY_Northwatch 神枪手|r
    .complete 25173,1 --北方卫士海军陆战队 (6)
    .mob +北方卫士海军陆战队
    .complete 25173,2 --北方城堡神枪手 (6)
    .mob +北方城堡神枪手
step
    #loop
    .goto 1411,59.84,58.12,0
    .goto 1411,57.93,58.57,15,0
    .goto 1411,57.17,56.21,15,0
    .goto 1411,58.23,55.44,15,0
    .goto 1411,59.44,56.13,15,0
    .goto 1411,59.32,58.03,8,0
    .goto 1411,59.84,58.12,15,0
    >>掠夺地面上的 |cRXP_LOOT_Kul Tiras Treasure|r
    .complete 25176,1 --Kul Tiras Treasure (6)
step
    #loop
    .goto 1411,59.02,57.24,0
    .goto 1411,58.50,58.88,40,0
    .goto 1411,57.67,58.53,40,0
    .goto 1411,57.87,57.50,40,0
    .goto 1411,57.34,56.57,40,0
    .goto 1411,58.41,56.40,40,0
    .goto 1411,59.02,57.24,40,0
    >>杀死 |cRXP_ENEMY_Northwatch 海军陆战队|r 和 |cRXP_ENEMY_Northwatch 神枪手|r
    .complete 25173,1 --北方卫士海军陆战队 (6)
    .mob +北方卫士海军陆战队
    .complete 25173,2 --北方城堡神枪手 (6)
    .mob +北方城堡神枪手
step
    #completewith next
    .goto 1411,58.71,56.76,-1
    .goto 1411,58.56,54.00,-1
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    >>|cRXP_WARN_确保你死在航路点附近或城堡以北更远的地方|r
step
    .goto 1411,52.00,43.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_加索克|r
    .turnin 25173 >>交任务: |cRXP_FRIENDLY_越来越糟|r
    .accept 25177 >>接任务: |cRXP_WARN_突袭海滩|r
    .target Gar'Thok
step << skip
    .goto 1411,50.70,42.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞姆塔克|r
    .accept 6365 >>接任务: |cRXP_LOOT_送往奥格瑞玛的肉|r
    .target Grimtak
step
    .goto 1411,53.05,43.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉尔·诺兹维格|r
    .turnin 25176 >>交任务: |cRXP_FRIENDLY_顺手牵羊|r
    .accept 25178 >>接任务: |cRXP_WARN_搜寻船骸|r
    .target Gail Nozzywig
step << skip
    .goto 1411,53.04,43.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波洛克|r
    .turnin 6365 >>交任务: |cRXP_FRIENDLY_送往奥格瑞玛的肉|r
    .accept 6384 >>接任务: |cRXP_LOOT_飞往奥格瑞玛|r
    .target Burok
step << Rogue
    .goto 1411,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡普拉克|r
    .train 15087 >>训练你的职业法术
    .target Kaplak
    .xp <8,1
step << Shaman
    .goto 1411,54.42,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯瓦特|r, 他在里面
    .train 324 >>训练你的职业法术
    .target Swart
    .xp <8,1
step << Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贾布|r
    .goto 1411,53.10,41.61
    .train 768 >>训练你的职业法术
    .target Jabul
    .xp <8,1
step << Hunter
    .goto 1411,51.86,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索塔尔|r
    .train 5116 >>训练你的职业法术
    .target Thotar
    .xp <8,1
step << Warrior
    .goto 1411,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔绍尔·锯痕|r, 他在里面
    .train 772 >>训练你的职业法术
    .target Tarshaw Jaggedscar
    .xp <7,1
step << Mage
    .goto 1411,53.04,41.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安苏瓦|r
    .train 122 >>训练你的职业法术
    .target Un'Thuwa
    .xp <8,1
step << Priest
    .goto 1411,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕拉塔|r, 他在里面
    .train 588 >>训练你的职业法术
    .target Tai'jin
    .xp <8,1
step << Warlock
    .goto 1411,54.38,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ghugru|r outside
    .train 687 >>训练你的职业法术
    .target Ghugru Gorelust
    .xp <8,1
step
    #loop
    .goto 1411,58.98,46.57,0
    .goto 1411,57.91,45.11,10,0
    .goto 1411,57.91,45.11,10,0
    .goto 1411,58.41,43.50,10,0
    .goto 1411,59.02,43.37,10,0
    .goto 1411,59.84,44.31,10,0
    .goto 1411,59.34,41.92,10,0
    .goto 1411,59.71,41.51,10,0
    .goto 1411,58.98,46.57,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_受伤的剃刀岭步兵|r
    .accept 25179 >>接任务: |cRXP_WARN_减少损失|r
    .target Injured Razor Hill Grunt
step
    #completewith GnomishTools
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Injured Razor Hill Grunts|r
    .complete 25179,1 --Injured Razor Hill Grunt Rescued (4)
    .target Injured Razor Hill Grunt
    .skipgossip
step
    #completewith RazorGrunts
    >>杀死 |cRXP_ENEMY_Foaming Sea 元素|r
    .complete 25177,1 --Foaming Sea Elemental (11)
    .mob Foaming Sea Elemental
step
    #label GnomishTools
    #loop
    .goto 1411,59.850,43.579,0
    .goto 1411,59.522,51.990,0
    .waypoint 1411,57.918,44.936,50,0
    .waypoint 1411,59.850,43.579,50,0
    .waypoint 1411,59.228,47.383,50,0
    .waypoint 1411,59.531,49.920,50,0
    .waypoint 1411,59.522,51.990,50,0
    .waypoint 1411,57.824,49.763,50,0
    .waypoint 1411,57.986,46.174,50,0
    >>拾取地面上的 |cRXP_PICK_Gnomish 工具箱|r
    .complete 25178,1 --Gnomish Tools (4)
step
    #label RazorGrunts
    #loop
    .goto 1411,58.98,46.57,0
    .goto 1411,57.91,45.11,10,0
    .goto 1411,58.41,43.50,10,0
    .goto 1411,59.02,43.37,10,0
    .goto 1411,59.84,44.31,10,0
    .goto 1411,59.34,41.92,10,0
    .goto 1411,59.71,41.51,10,0
    .goto 1411,58.98,46.57,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Injured Razor Hill Grunts|r
    .complete 25179,1 --Injured Razor Hill Grunt Rescued (4)
    .target Injured Razor Hill Grunt
    .skipgossip
step
    #loop
    .goto 1411,59.850,43.579,0
    .goto 1411,59.522,51.990,0
    .waypoint 1411,57.918,44.936,50,0
    .waypoint 1411,59.850,43.579,50,0
    .waypoint 1411,59.228,47.383,50,0
    .waypoint 1411,59.531,49.920,50,0
    .waypoint 1411,59.522,51.990,50,0
    .waypoint 1411,57.824,49.763,50,0
    .waypoint 1411,57.986,46.174,50,0
    >>杀死 |cRXP_ENEMY_Foaming Sea 元素|r
    .complete 25177,1 --Foaming Sea Elemental (11)
    .mob Foaming Sea Elemental
step
    #completewith next
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
step
    .goto 1411,53.08,43.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉尔·诺兹维格|r
    .turnin 25178 >>交任务: |cRXP_FRIENDLY_搜寻船骸|r
    .accept 25227 >>接任务: |cRXP_WARN_索恩克|r
    .target Gail Nozzywig
step
    .goto 1411,51.97,43.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_加索克|r
    .turnin 25177 >>交任务: |cRXP_FRIENDLY_突袭海滩|r
    .turnin 25179 >>交任务: |cRXP_FRIENDLY_减少损失|r
    .target Gar'Thok
step
    #xprate <1.2
    .goto 1411,52.25,43.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥戈尼尔·魂痕|r
    .accept 25232 >>接任务: |cRXP_WARN_火刃兽人|r
    .target Orgnil Soulscar
step << Rogue
    .goto 1411,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡普拉克|r
    .train 15087 >>训练你的职业法术
    .target Kaplak
    .xp <8,1
step << Shaman
    .goto 1411,54.42,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯瓦特|r, 他在里面
    .train 324 >>训练你的职业法术
    .target Swart
    .xp <8,1
step << Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贾布|r
    .goto 1411,53.10,41.61
    .train 768 >>训练你的职业法术
    .target Jabul
    .xp <8,1
step << Hunter
    .goto 1411,51.86,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索塔尔|r
    .train 5116 >>训练你的职业法术
    .target Thotar
    .xp <8,1
step << Warrior
    .goto 1411,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔绍尔·锯痕|r, 他在里面
    .train 772 >>训练你的职业法术
    .target Tarshaw Jaggedscar
    .xp <7,1
step << Mage
    .goto 1411,53.04,41.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安苏瓦|r
    .train 122 >>训练你的职业法术
    .target Un'Thuwa
    .xp <8,1
step << Priest
    .goto 1411,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕拉塔|r, 他在里面
    .train 588 >>训练你的职业法术
    .target Tai'jin
    .xp <8,1
step << Warlock
    .goto 1411,54.38,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ghugru|r outside
    .train 687 >>训练你的职业法术
    .target Ghugru Gorelust
    .xp <8,1
step
    .goto 1411,51.900,41.147
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃克|r
    .vendor >>供应商垃圾和维修
    .target Wuark
step
    #completewith next
    .goto 1411,50.86,42.26,40,0
    .goto 1411,49.58,40.51,12 >>前往瞭望塔
step
    .goto 1411,49.60,40.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索恩克|r
    .turnin 25227 >>交任务: |cRXP_FRIENDLY_索恩克|r
    .accept 25187 >>接任务: |cRXP_WARN_迷失在洪水中|r
    .target Thonk
step
    .goto 1411,49.60,40.17
    >>|cRXP_WARN_使用|r |T134441:0|t[Thonk's Spyglass] |cRXP_WARN_找到|r |cRXP_FRIENDLY_Raggaran|r|cRXP_WARN_、|r |cRXP_FRIENDLY_被水淹没的小屋|r|cRXP_WARN_、|r |cRXP_FRIENDLY_Misha|r|cRXP_WARN_和|r |cRXP_FRIENDLY_Zen'Taji|r
    >>|cRXP_WARN_你不能跳过这部电影|r
    .complete 25187,1 --Find Raggaran (1)
    .complete 25187,2 --Find flooded hut (1)
    .complete 25187,3 --Find Misha (1)
    .complete 25187,4 --Find Zen'Taji (1)
    .use 52514
step
    .goto 1411,49.60,40.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索恩克|r
    .turnin 25187 >>交任务: |cRXP_FRIENDLY_迷失在洪水中|r
    .accept 25188 >>接任务: |cRXP_WARN_巡逻流域盆地|r
    .target Thonk
step
    .goto 1411,43.38,30.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米莎|r
    .accept 25193 >>接任务: |cRXP_LOOT_丢失的孩子|r
    .target Misha Tor'kren
step
    #completewith Screamlash
    >>杀死 |cRXP_ENEMY_Dreadmaw Toothgnashers|r。掠夺他们的 |cRXP_LOOT_Teeth|r
    .complete 25193,1 --Durotar Crocolisk Tooth (250)
    .mob Dreadmaw Toothgnasher
step
    #completewith next
    .goto 1411,35.84,41.38,30 >>前往 |cRXP_FRIENDLY_Zen'Taji|r
step
    .goto 1411,35.84,41.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岑塔基|r
    .accept 25194 >>接任务: |cRXP_WARN_不请自来的访客|r
    .target Zen'Taji
step
    #loop
    .goto 1411,35.26,39.70,0
    .goto 1411,35.26,39.70,50,0
    .goto 1411,34.96,36.71,50,0
    .goto 1411,34.90,35.09,50,0
    .goto 1411,34.96,32.48,50,0
    .goto 1411,35.05,30.18,50,0
    .goto 1411,35.23,28.96,50,0
    .goto 1411,34.79,43.39,50,0
    .goto 1411,34.64,44.87,50,0
    .goto 1411,35.37,46.05,50,0
    .goto 1411,35.26,39.70,50,0
    >>沿河攻击 |cRXP_ENEMY_Wayward Plainstriders|r 迫使他们逃入贫瘠之地
    .complete 25194,1 --Wayward Plainstrider Returned (3)
    .unitscan Wayward Plainstrider
step
    .goto 1411,35.84,41.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岑塔基|r
    .turnin 25194 >>交任务: |cRXP_FRIENDLY_不请自来的访客|r
    .accept 25195 >>接任务: |cRXP_WARN_迅猛龙的末日|r
    .target Zen'Taji
step
    #loop
    .goto 1411,35.819,33.161,0
    .goto 1411,35.643,29.209,0
    .waypoint 1411,35.819,33.161,40,0
    .waypoint 1411,36.019,31.471,40,0
    .waypoint 1411,35.643,29.209,40,0
    >>杀死 |cRXP_ENEMY_Screamslash|r
    .complete 25195,1 --Screamslash (1)
    .unitscan Screamslash
    --VV Coords
step
    #label Screamlash
    .goto 1411,35.83,41.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岑塔基|r
    .turnin 25195 >>交任务: |cRXP_FRIENDLY_迅猛龙的末日|r
    .complete 25188,4 --Help Zen'Taji (1)
    .target Zen'Taji
step
    #loop
    .goto 1411,42.441,35.524,0
    .goto 1411,39.455,34.623,0
    .waypoint 1411,43.839,34.132,40,0
    .waypoint 1411,42.441,35.524,40,0
    .waypoint 1411,41.548,35.852,40,0
    .waypoint 1411,40.731,36.627,40,0
    .waypoint 1411,39.455,34.623,40,0
    >>杀死 |cRXP_ENEMY_Dreadmaw Toothgnashers|r。掠夺他们的 |cRXP_LOOT_Teeth|r
    .complete 25193,1 --Durotar Crocolisk Tooth (250)
    .mob Dreadmaw Toothgnasher
step
    .goto 1411,43.45,30.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米莎|r
    .turnin 25193 >>交任务: |cRXP_FRIENDLY_丢失的孩子|r
    .complete 25188,3 --Help Misha Tor'kren (1)
    .target Misha Tor'kren
step
    .goto 1411,40.49,35.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特克拉主母|r
    .accept 25189 >>接任务: |cRXP_WARN_赞美万灵|r
    .target Grandmatron Tekla
step
    .goto 1411,42.70,49.90
    >>护送 |cRXP_FRIENDLY_Tekla|r 至 |cRXP_FRIENDLY_Raggaran|r
    .complete 25189,1 --Escort Grandmatron Tekla to Raggaran
    .complete 25188,1 --Help Grandmatron Tekla (1)
    .target Grandmatron Tekla
step
    .goto 1411,42.66,49.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格兰|r
    .turnin 25189 >>交任务: |cRXP_FRIENDLY_赞美万灵|r
    .accept 25190 >>接任务: |cRXP_WARN_拉格兰的愤怒|r
    .target Raggaran
step
    #loop
    .goto 1411,43.57,50.27,0
    .goto 1411,43.57,50.27,40,0
    .goto 1411,44.15,49.45,40,0
    .goto 1411,44.54,50.09,40,0
    .goto 1411,46.66,48.37,40,0
    .goto 1411,47.43,48.63,40,0
    .goto 1411,48.53,49.04,40,0
    .goto 1411,49.21,48.60,40,0
    .goto 1411,50.13,49.39,40,0
    .goto 1411,43.57,50.27,40,0
    >>杀死 |cRXP_ENEMY_Razormane 野猪人|r 和 |cRXP_ENEMY_Razormane 侦察兵|r 
    .complete 25190,1 --钢鬃野猪人 (4)
    .mob +钢鬃野猪人 
    .complete 25190,2 --钢鬃斥候 (4)
    .mob +钢鬃斥候
step
    .goto 1411,42.75,49.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格兰|r
    .turnin 25190 >>交任务: |cRXP_FRIENDLY_拉格兰的愤怒|r
    .accept 25192 >>接任务: |cRXP_WARN_拉格兰的怒火|r
    .target Raggaran
step
#loop
	.line 1411,41.83,39.47,41.83,39.47,42.34,40.36,43.09,40.43,43.67,41.35,44.42,40.23,44.34,39.12,44.40,38.38,45.08,37.76,43.88,37.22,43.32,37.02,42.63,36.62,41.98,36.95
	.goto 1411,41.83,39.47,30,0
	.goto 1411,41.83,39.47,30,0
	.goto 1411,42.34,40.36,30,0
	.goto 1411,43.09,40.43,30,0
	.goto 1411,43.67,41.35,30,0
	.goto 1411,44.42,40.23,30,0
	.goto 1411,44.34,39.12,30,0
	.goto 1411,44.40,38.38,30,0
	.goto 1411,45.08,37.76,30,0
	.goto 1411,43.88,37.22,30,0
	.goto 1411,43.32,37.02,30,0
	.goto 1411,42.63,36.62,30,0
	.goto 1411,41.98,36.95,30,0
    >>杀死 |cRXP_ENEMY_钢鬃尘行者s|r 和 |cRXP_ENEMY_钢鬃战斗卫士s|r 
    .complete 25192,1 --钢鬃尘行者 (5)
    .mob +钢鬃尘行者
    .complete 25192,2 --钢鬃战斗卫士 (5)
    .mob +钢鬃战斗卫士
step
    .goto 1411,42.72,49.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格兰|r
    .turnin 25192 >>交任务: |cRXP_FRIENDLY_拉格兰的怒火|r
    .complete 25188,2 --Help Raggaran (1)
    .target Raggaran
step
    #xprate >1.19
    #completewith FlyORG
    .hs >>炉石到剃刀岭
    .cooldown item,6948,>0,1
step
    #xprate >1.19
    #completewith FlyORG
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .cooldown item,6948,<0
step
    #xprate >1.19
    #completewith next
    .goto 1411,50.86,42.26,40,0
    .goto 1411,49.58,40.51,12 >>前往塔楼
step
    #xprate >1.19
    .goto 1411,49.60,40.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索恩克|r
    .turnin 25188 >>交任务: |cRXP_FRIENDLY_巡逻流域盆地|r
    .target Thonk
step
    #xprate <1.2
    #completewith DustwindCave
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
step << Rogue
    .goto 1411,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡普拉克|r
    .train 61922 >>训练你的职业法术
    .target Kaplak
    .xp <10,1
step << Shaman
    .goto 1411,54.42,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯瓦特|r, 他在里面
    .train 3599 >>训练你的职业法术
    .target Swart
    .xp <10,1
step << Druid
    .goto 1411,53.10,41.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贾布|r
    .train 5215 >>训练你的职业法术
    .target Jabul
    .xp <10,1
step << Hunter
    .goto 1411,51.86,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索塔尔|r
    .train 1978 >>训练你的职业法术
    .target Thotar
    .xp <10,1
step << Warrior
    .goto 1411,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔绍尔·锯痕|r, 他在里面
    .train 71 >>训练你的职业法术
    .target Tarshaw Jaggedscar
    .xp <10,1
step << Mage
    .goto 1411,53.04,41.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安苏瓦|r
    .train 2139 >>训练你的职业法术
    .target Un'Thuwa
    .xp <9,1
step << Priest
    .goto 1411,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕拉塔|r, 他在里面
    .train 8092 >>训练你的职业法术
    .target Tai'jin
    .xp <9,1
step << Warlock
    .goto 1411,54.38,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ghugru|r outside
    .train 1120 >>训练你的职业法术
    .target Ghugru Gorelust
    .xp <10,1
step
    #xprate <1.2
    #label DustwindCave
    #completewith next
    .goto 1411,52.82,28.88,40 >>洞穴内旅行
step
    #xprate <1.2
    #loop
    .goto 1411,52.66,29.15,0
    .goto 1411,52.66,29.15,15,0
    .goto 1411,53.04,29.18,15,0
    .goto 1411,52.75,28.40,15,0
    .goto 1411,53.02,27.87,15,0
    .goto 1411,53.14,27.29,15,0
    .goto 1411,53.44,26.94,15,0
    .goto 1411,52.77,26.67,15,0
    .goto 1411,52.20,26.90,15,0
    .goto 1411,51.90,26.06,15,0
    .goto 1411,52.20,24.46,15,0
    .goto 1411,52.66,29.15,15,0
    >>杀死 |cRXP_ENEMY_Burning Blade Neophytes|r 和 |cRXP_ENEMY_Burning Blade Thugs|r。掠夺他们的 |cRXP_LOOT_Spellscrolls|r
    .complete 25232,1 --Burning Blade Spellscroll (6)
    .mob Burning Blade Thug
    .mob Burning Blade Neophyte
step
    #xprate <1.2
    #completewith next
    .goto 1411,54.36,29.18,70,0
    .goto 1411,56.13,28.06,70,0
    .goto 1411,56.30,24.76,70,0
    .goto 1411,56.11,21.96,40,0
    .goto 1411,56.21,20.23 >>前往维克纳格
step
    #xprate <1.2
    .goto 1411,56.21,20.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦克纳格|r
    .accept 25256 >>接任务: |cRXP_WARN_外出求援|r
    .target Vek'nag
step
    #xprate <1.2
    .goto 1411,58.81,23.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_刺牙|r
    .turnin 25256 >>交任务: |cRXP_FRIENDLY_外出求援|r
    .accept 25257 >>接任务: |cRXP_WARN_西瑟兰尼亚|r
    .accept 25258 >>接任务: |cRXP_WARN_格里斯沃德·汉尼登|r
    .accept 25259 >>接任务: |cRXP_WARN_高乌·冰角|r
    .target Spiketooth
step
    #xprate <1.2
    #completewith next
    .goto 1411,59.41,23.47
    +|cRXP_WARN_对话: |cRXP_FRIENDLY_高乌·冰角|r|r
    .target Gaur Icehorn
    .skipgossip
step
    #xprate <1.2
    .goto 1411,59.41,23.47
    >>杀死 |cRXP_ENEMY_Gaur Icehorn|r
    .complete 25259,1 --Gaur defeated (1)
    .mob Gaur Icehorn
step
    #xprate <1.2
    #completewith next
    .goto 1411,59.68,22.63
    +|cRXP_WARN_对话: |cRXP_FRIENDLY_西瑟兰尼亚|r|r
    .target Ghislania
    .skipgossip
step
    #xprate <1.2
    .goto 1411,59.68,22.63
    >>杀死 |cRXP_ENEMY_Ghislania|r
    .complete 25257,1 --Ghislania defeated (1)
    .mob Ghislania
step
    #xprate <1.2
    #completewith next
    .goto 1411,59.06,22.26
    +|cRXP_WARN_对话: |cRXP_FRIENDLY_格里斯沃德·汉尼登|r|r
    .target Griswold
    .skipgossip
step
    #xprate <1.2
    .goto 1411,59.06,22.26
    >>杀死 |cRXP_ENEMY_Griswold|r
    .complete 25258,1 --Griswold defeated (1)
    .mob Griswold
step
    #xprate <1.2
    .goto 1411,58.80,23.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_刺牙|r
    .turnin 25257 >>交任务: |cRXP_FRIENDLY_西瑟兰尼亚|r
    .turnin 25258 >>交任务: |cRXP_FRIENDLY_格里斯沃德·汉尼登|r
    .turnin 25259 >>交任务: |cRXP_FRIENDLY_高乌·冰角|r
    .target Spiketooth
step
    #xprate <1.2
    #completewith Orgnil
    .goto 1411,57.13,27.37,40,0
    .goto 1411,55.79,31.03,40,0
    .goto 1411,53.90,35.53,40,0
    .goto 1411,52.81,39.75,40 >>跑回剃刀岭
    .cooldown item,6948,<0
step
    #xprate <1.2
    #completewith Orgnil
    .hs >>炉石到剃刀岭
    .cooldown item,6948,>0
step
    #xprate <1.2
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥戈尼尔·魂痕|r
    .goto 1411,52.24,43.16
    .turnin 25232 >>交任务: |cRXP_FRIENDLY_火刃兽人|r
    .accept 25196 >>接任务: |cRXP_WARN_德拉诺什尔封锁线|r
    .target Orgnil Soulscar
    .maxlevel 9
step
    #xprate <1.2
    #label Orgnil
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥戈尼尔·魂痕|r
    .goto 1411,52.24,43.16
    .turnin 25232 >>交任务: |cRXP_FRIENDLY_火刃兽人|r
    .target Orgnil Soulscar
step << Rogue
    #xprate <1.2
    .goto 1411,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡普拉克|r
    .train 61922 >>训练你的职业法术
    .target Kaplak
    .xp <10,1
step << Shaman
    #xprate <1.2
    .goto 1411,54.42,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯瓦特|r, 他在里面
    .train 3599 >>训练你的职业法术
    .target Swart
    .xp <10,1
step << Druid
    #xprate <1.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贾布|r
    .goto 1411,53.10,41.61
    .train 5215 >>训练你的职业法术
    .target Jabul
    .xp <10,1
step << Hunter
    #xprate <1.2
    .goto 1411,51.86,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索塔尔|r
    .train 1978 >>训练你的职业法术
    .target Thotar
    .xp <10,1
step << Warrior
    #xprate <1.2
    .goto 1411,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔绍尔·锯痕|r, 他在里面
    .train 71 >>训练你的职业法术
    .target Tarshaw Jaggedscar
    .xp <10,1
step << Mage
    #xprate <1.2
    .goto 1411,53.04,41.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安苏瓦|r
    .train 2139 >>训练你的职业法术
    .target Un'Thuwa
    .xp <9,1
step << Priest
    #xprate <1.2
    .goto 1411,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕拉塔|r, 他在里面
    .train 8092 >>训练你的职业法术
    .target Tai'jin
    .xp <9,1
step << Warlock
    #xprate <1.2
    .goto 1411,54.38,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ghugru|r outside
    .train 1120 >>训练你的职业法术
    .target Ghugru Gorelust
    .xp <10,1
step
    #xprate <1.2
    #completewith next
    .goto 1411,50.86,42.26,40,0
    .goto 1411,49.58,40.51,12 >>前往塔楼
step
    #xprate <1.2
    .goto 1411,49.60,40.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索恩克|r
    .turnin 25188 >>交任务: |cRXP_FRIENDLY_巡逻流域盆地|r
    .target Thonk
step
    #label FlyORG
    .goto 1411,53.04,43.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波洛克|r
    .fly Orgrimmar >>飞往奥格瑞玛
    .target Burok
    .xp <10,1

    --Next section if user isn't lvl 10 yet

step
    #xprate <1.2
    #optional
    #completewith next
    .goto 1411,46.26,30.19
    >>|cRXP_WARN_前往航点。到达那里之前不要死|r
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
step
    #xprate <1.2
    #optional
    .goto 1411,46.371,22.942
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷兹拉克|r
    .accept 834 >>接任务: |cRXP_LOOT_沙漠之风|r
    .target Rezlak
    .maxlevel 9
step
    #xprate <1.2
    #optional
    .goto 1411,48.95,22.34,0
    .goto 1411,48.95,22.34,40,0
    .goto 1411,49.75,21.95,40,0
    .goto 1411,49.62,24.17,40,0
    .goto 1411,50.52,25.32,40,0
    .goto 1411,50.08,25.72,40,0
    .goto 1411,50.87,25.99,40,0
    .goto 1411,51.68,27.75,40,0
    .goto 1411,50.56,27.33,40,0
    .goto 1411,49.89,26.88,40,0
    .goto 1411,49.63,32.13,40,0
    .goto 1411,49.12,33.11,40,0
    .goto 1411,48.53,32.01,40,0
    .goto 1411,48.13,32.02,40,0
    .goto 1411,47.07,30.87,40,0
    .goto 1411,47.16,29.67,40,0
    .goto 1411,48.95,22.34,40,0
    >>掠夺地面上的 |cRXP_LOOT_Kul 补给袋|r  
    .complete 834,1 --Sack of Supplies (5)
    .isOnQuest 834
step
    #xprate <1.2
    #optional
    .goto 1411,46.371,22.942
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷兹拉克|r
    .turnin 834 >>交任务: |cRXP_FRIENDLY_沙漠之风|r
    .accept 835 >>接任务: |cRXP_LOOT_保卫商路|r
    .target Rezlak
    .isQuestComplete 834
step
    #xprate <1.2
    #optional
    .goto 1411,46.371,22.942
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷兹拉克|r
    .accept 835 >>接任务: |cRXP_LOOT_保卫商路|r
    .target Rezlak
    .isQuestTurnedIn 835
step
    #xprate <1.2
    #optional
    .goto 1411,49.76,28.04,0
    .goto 1411,48.86,22.10,40,0
    .goto 1411,49.76,23.27,40,0
    .goto 1411,50.13,25.15,40,0
    .goto 1411,50.76,25.90,40,0
    .goto 1411,51.34,27.16,40,0
    .goto 1411,51.89,27.45,40,0
    .goto 1411,54.08,27.34,40,0
    .goto 1411,54.05,23.47,40,0
    .goto 1411,51.98,20.78,40,0
    .goto 1411,52.88,24.14,40,0
    .goto 1411,51.26,23.79,40,0
    .goto 1411,49.76,28.04,40,0
    >>杀死任意类型的 |cRXP_ENEMY_Dustwind Harpy|r
    .complete 835,1 --Durotar Harpy (12)
    .mob Dustwind Pillager
    .mob Dustwind Harpy
    .mob 尘风野蛮人
    .mob 尘风风暴女巫
    .isQuestTurnedIn 835
step
    #xprate <1.2
    #optional
    .goto 1411,46.371,22.942
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷兹拉克|r
    .turnin 835 >>交任务: |cRXP_FRIENDLY_保卫商路|r
    .target Rezlak
    .isQuestComplete 835
step
    #xprate <1.2
    #optional
    #completewith Fizzled
    .goto 1411,45.11,13.65,30 >>运行到|cRXP_FRIENDLY_Gor|r 
step << skip
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gor|r and |cRXP_FRIENDLY_Shin|r 
    .turnin 25196 >>交任务: |cRXP_FRIENDLY_德拉诺什尔封锁线|r
    --.accept 25206 >>接任务: |cRXP_WARN_无视警告|r
    .accept 25236 >>接任务: |cRXP_WARN_溺死的雷霆蜥蜴|r
    .accept 25260 >>接任务: |cRXP_WARN_费滋尔之球|r
    --.accept 25648 >>接任务: |cRXP_WARN_杜隆塔尔之外|r
    .goto 1411,45.01,14.78
    .accept 25205 >>接任务: |cRXP_WARN_狼和科多兽|r
    .goto 1411,44.90,14.83
    .target Gor the Enforcer
    .target Shin Stonepillar
step
    #xprate <1.2
    #optional
    .goto 1411,45.01,14.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gor|r
    .turnin 25196 >>交任务: |cRXP_FRIENDLY_德拉诺什尔封锁线|r
    --.accept 25206 >>接任务: |cRXP_WARN_无视警告|r
    .accept 25236 >>接任务: |cRXP_WARN_溺死的雷霆蜥蜴|r
    .accept 25260 >>接任务: |cRXP_WARN_费滋尔之球|r
    --.accept 25648 >>接任务: |cRXP_WARN_杜隆塔尔之外|r
    .target Gor the Enforcer
    .maxlevel 9
step
    #xprate <1.2
    #optional
    #label Fizzled
    .goto 1411,45.01,14.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gor|r
    .turnin 25196 >>交任务: |cRXP_FRIENDLY_德拉诺什尔封锁线|r
    --.accept 25206 >>接任务: |cRXP_WARN_无视警告|r
    .accept 25236 >>接任务: |cRXP_WARN_溺死的雷霆蜥蜴|r
    .accept 25260 >>接任务: |cRXP_WARN_费滋尔之球|r
    --.accept 25648 >>接任务: |cRXP_WARN_杜隆塔尔之外|r
    .target Gor the Enforcer
    .maxlevel 9

    --BB Quest 25205 currently bugged on beta

step << skip
    .goto 1411,44.90,14.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shin|r
    .gossipoption 112089 >>Talk to |cRXP_FRIENDLY_Shin|r 
    .target Shin Stonepillar
step << skip
    .goto 1411,52.47,16.47
    >>前往 |cRXP_FRIENDLY_The Kodos|r
    >>|cRXP_WARN_使用|r |T132120:0|t[Dash] |cRXP_WARN_on 冷却|r
    .complete 25205,1 --Listen to the shaman's fable (1)
    .unitscan The Kodo
step << skip
    .goto 1411,44.89,14.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shin|r
    .turnin 25205 >>交任务: |cRXP_FRIENDLY_狼和科多兽|r
    .target Shin Stonepillar
    .skipgossip
step << skip
    #loop
    .goto 1411,38.041,16.299,0
    .waypoint 1411,40.401,15.857,40,0
    .waypoint 1411,38.041,16.299,40,0
    .waypoint 1411,38.738,18.791,40,0
    .waypoint 1411,40.108,17.593,40,0
    >>杀死 |cRXP_ENEMY_Teeming Waterguards|r 和 |cRXP_ENEMY_Furious Earthguards|r
    .complete 25206,1 --Warring Elemental (12)
    .mob Teeming Waterguard
    .mob Furious Earthguard
step
    #xprate <1.2
    #optional
    #completewith next
    >>点击水下的 |cRXP_FRIENDLY_Drowned Thunder Lizards|r
    .complete 25236,1 --Drowned Thunder Lizard removed (8)
    .target Drowned Thunder Lizard
    .isOnQuest 25236
step
    #xprate <1.2
    #optional
    #label Fizzle
    .goto 1411,42.11,26.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_菲兹尔|r, Orb
    .complete 25260,1 --Fizzle's Orb (1)
    .skipgossip 3203,1,1
    .target Fizzle Darkclaw
    .isOnQuest 25260
    --BB Bugged on beta
step
    #xprate <1.2
    #optional
    #loop
    .goto 1411,41.22,24.55,0
    .goto 1411,39.29,28.19,0
    .waypoint 1411,41.65,25.09,40,0
    .waypoint 1411,41.22,24.55,40,0
    .waypoint 1411,40.54,24.19,40,0
    .waypoint 1411,39.57,23.63,40,0
    .waypoint 1411,39.53,24.99,40,0
    .waypoint 1411,38.97,25.05,40,0
    .waypoint 1411,39.01,26.25,40,0
    .waypoint 1411,39.49,26.96,40,0
    .waypoint 1411,38.97,27.69,40,0
    .waypoint 1411,39.29,28.19,40,0
    .waypoint 1411,39.73,27.97,40,0
    .waypoint 1411,40.25,28.09,40,0
    .waypoint 1411,40.52,29.77,40,0
    .waypoint 1411,39.15,29.74,40,0
    .waypoint 1411,41.93,23.95,40,0
    >>点击 |cRXP_FRIENDLY_Drowned Thunder Lizards|r
    .complete 25236,1 --Drowned Thunder Lizard removed (8)
    .target Drowned Thunder Lizard
    .isOnQuest 25236
step
    #xprate <1.2
    #optional
    #completewith FizzledTurnin
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .isQuestComplete 25236
step
    #xprate <1.2
    #optional
    .goto 1411,44.97,14.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gor|r
    --.turnin 25206 >>交任务: |cRXP_FRIENDLY_无视警告|r
    .turnin 25236 >>交任务: |cRXP_FRIENDLY_溺死的雷霆蜥蜴|r
    .turnin 25260 >>交任务: |cRXP_FRIENDLY_费滋尔之球|r
    .target Gor the Enforcer
    .isQuestComplete 25236
    .isQuestComplete 25260
step
    #xprate <1.2
    #optional
    .goto 1411,44.97,14.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gor|r
    --.turnin 25206 >>交任务: |cRXP_FRIENDLY_无视警告|r
    .turnin 25260 >>交任务: |cRXP_FRIENDLY_费滋尔之球|r
    .target Gor the Enforcer
    .isQuestComplete 25260
step
    #xprate <1.2
    #optional
    #label FizzledTurnin
    .goto 1411,44.97,14.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gor|r
    --.turnin 25206 >>交任务: |cRXP_FRIENDLY_无视警告|r
    .turnin 25236 >>交任务: |cRXP_FRIENDLY_溺死的雷霆蜥蜴|r
    .target Gor the Enforcer
    .isQuestComplete 25236
step
    #xprate <1.2
    #optional
    .goto 1411,45.506,11.949,30,0
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .isQuestTurnedIn 25196
step << skip
    .goto 1454,54.083,74.894
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板格雷什卡|r
    .turnin 6384 >>交任务: |cRXP_FRIENDLY_飞往奥格瑞玛|r
    .target Innkeeper Gryshka

    ]])