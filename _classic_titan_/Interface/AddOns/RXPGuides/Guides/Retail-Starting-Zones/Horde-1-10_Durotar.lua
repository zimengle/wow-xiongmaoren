RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#subgroup 兽人起始区域 << Orc
#subgroup 巨魔起始区 << Troll
#subgroup 杜隆塔尔起始区域 << !Orc !Troll
#name 1兽人起始区 << !Troll --Orc
#name 2兽人起始区 << Troll
-- #name 试炼之谷 << !Orc !Troll
#displayname Chapter 2 - 试炼之谷 << Troll
#displayname Chapter 1 - 试炼之谷 << !Troll --Orc
-- #displayname 试炼之谷 (Orc) << !Orc !Troll
#next 2巨魔起始区 << !Troll --Orc
#next RestedXP 部落 10-60\\1 BfA 简介 << Troll
#defaultfor Orc !DK/Troll !DK
    
<< Horde

step << Orc
    .zoneskip 1727
    #completewith DurotarFirstQuestCheck
    +欢迎来到 RestedXP 的 |cfff78300Orc 起始区|r 指南。
    *Without consumables/heirlooms this route is roughly 5 minutes slower than |cfff78300Exiles Reach|r. For faster leveling recreate your character and choose |cfff78300Exiles Reach|r instead.
    *With consumables/heirlooms this route is just as fast or up to 15% faster.
step << Orc
    .zoneskip 1727,1
    +您位于流放区，但当前指南适用于兽人起始区。
    +请选择流放者范围指南。
step << Troll
	#completewith ValleyofTrialsShortcut
	+走捷径前往试炼之谷
step << Troll
	#completewith next
    .goto 1,49.42,70.56,4,0
    .goto 461,68.14,75.44,6 >>到达墙壁时跳跃
step << Troll
	#label ValleyofTrialsShortcut
	#completewith DurotarFirstQuestCheck
    .goto 461,67.83,74.52,6,0
    .goto 461,67.01,74.53,6,0
    .goto 461,64.89,71.70,12 >>抱住左边的墙，爬上山
step << Orc
    #completewith next
    +|cRXP_WARN_如果您想充分利用 RXP；请按 Escape -> 选项 -> 键绑定 -> RestedXP 指南 -> 选择并绑定活动按钮 1、2、3 和 4。您也可以对目标执行此操作。|r
    *This will allow you to press a Keybind to use a Quest Items/target a relevant mob
step
    #label DurotarFirstQuestCheck
    .goto 461,45.20,68.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡尔图克|r
    .accept 25152 >>接任务: |cRXP_LOOT_起点|r
    .target Kaltunk
step
    .goto 461,44.93,66.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高内克|r
    .turnin 25152 >>交任务: |cRXP_FRIENDLY_起点|r
    .accept 25126 >>接任务: |cRXP_LOOT_小试身手|r
    .target Gornek
step
    .goto 461,48.08,54.03,40,0
    .goto 461,46.68,52.16
	>>杀死 |cRXP_ENEMY_Mottled Boars|r
    .complete 25126,1 --6/6 Mottled Boar slain
    .mob Mottles Boar
step
    .goto 461,44.93,66.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高内克|r
    .turnin 25126 >>交任务: |cRXP_FRIENDLY_小试身手|r
    .accept 25172 >>接任务: |cRXP_WARN_家园里的入侵者|r
    .target Gornek
step
    .goto 461,50.69,76.52,40,0
    .goto 461,46.45,87.24,55,0
    .goto 461,42.75,78.98
	>>杀死潜行的|cRXP_ENEMY_Northwatch Scouts|r
    .complete 25172,1 --7/7 Northwatch Scout slain
    .mob Northwatch Scout
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高内克|r
    .goto 461,44.93,66.42
    .turnin 25172 >>交任务: |cRXP_FRIENDLY_家园里的入侵者|r
    .accept 25127 >>接任务: |cRXP_WARN_家园里的入侵者|r
    .target Gornek
step << Warlock
	#completewith ValleyOfTrialsSarkoth
	.cast 688 >>施放 |T136218:0|r[召唤小鬼] 来召唤你的小鬼
	.xp <3,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_戈加尔|r, |cRXP_FRIENDLY_工头塔兹利尔|r
    .accept 25136 >>接任务: |cRXP_LOOT_戈加尔的清凉果|r
    .goto 461,42.98,62.41
    .accept 37446 >>接任务: |cRXP_LOOT_懒惰的苦工|r
    .goto 461,46.16,63.27
    .target Galgar
    .target Foreman Thazz'ril
step
    #completewith ValleyOfTrialsSarkoth
    >>杀死 |cRXP_ENEMY_Scorpid 工人|r。掠夺他们的 |cRXP_LOOT_Tails|r
    .complete 25127,1 --8/8 Scorpid Worker Tail
    .mob Scorpid Worker
step
    #completewith ValleyOfTrialsBackDen
    >>在睡觉时使用 |T133486:0|t[Foreman's Blackjack] |cRXP_FRIENDLY_Lazy Peons|r
    *|cRXP_WARN_NOTE: You can just Right-Click the Peons.|r
    .complete 37446,1 --4/4 Sleeping Lazy Peons awakened
    .use 16114
    .target Lazy Peon
step
    #completewith ValleyTurnins
    >>掠夺 |cRXP_LOOT_Cactus Apple|r 植物
    .complete 25136,1 --6/6 Cactus Apple
step
	#label Sarkoth
    >>离开小镇向北行驶
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈纳祖|r
    .goto 461,34.62,44.23
    .accept 25129 >>接任务: |cRXP_LOOT_萨科斯|r
    .target Hana'zua
step
    #label ValleyOfTrialsSarkoth
	>>杀死 |cRXP_ENEMY_Sarkoth|r。掠夺他的 |cRXP_LOOT_Claw|r
    .goto 461,32.7,61.9
    .complete 25129,1 --1/1 Sarkoth's Mangled Claw
    .mob Sarkoth
step
    >>杀死 |cRXP_ENEMY_Scorpid 工人|r。掠夺他们的 |cRXP_LOOT_Tails|r
#loop
	.line 461,37.38,65.09,34.90,67.58,32.93,66.72,32.45,61.81,32.11,57.46,34.97,57.14,39.82,56.48,37.38,65.09
	.goto 461,37.38,65.09,40,0
	.goto 461,34.90,67.58,40,0
	.goto 461,32.93,66.72,40,0
	.goto 461,32.45,61.81,40,0
	.goto 461,32.11,57.46,40,0
	.goto 461,34.97,57.14,40,0
	.goto 461,39.82,56.48,40,0
	.goto 461,37.38,65.09,40,0
    .complete 25127,1 --8/8 Scorpid Worker Tail
    .mob Scorpid Worker
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_WARN_跳下返回城镇|r。与 |cRXP_FRIENDLY_Galgar|r、|cRXP_FRIENDLY_Gornek|r、|cRXP_FRIENDLY_Zureetha|r 和 |cRXP_FRIENDLY_Foreman Thazz'ril 交谈|r
    .turnin 25136 >>交任务: |cRXP_FRIENDLY_戈加尔的清凉果|r
    .goto 461,42.95,62.42
    .turnin 25127 >>交任务: |cRXP_FRIENDLY_工蝎的尾巴|r
    .goto 461,44.93,66.42
    .accept 25131 >>接任务: |cRXP_LOOT_邪灵劣魔|r
    .goto 461,45.81,63.42
    .turnin 37446 >>交任务: |cRXP_FRIENDLY_懒惰的苦工|r
    .goto 461,46.15,63.28
	.isQuestComplete 25136
	.isQuestComplete 37446
    .target Galgar
    .target Gornek
    .target Zureetha Fargaze
    .target Foreman Thazz'ril
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跳下返回城镇。与 |cRXP_FRIENDLY_Galgar|r、|cRXP_FRIENDLY_Gornek|r 和 |cRXP_FRIENDLY_Zureetha|r 交谈
    .turnin 25136 >>交任务: |cRXP_FRIENDLY_戈加尔的清凉果|r
    .goto 461,42.95,62.42
    .turnin 25127 >>交任务: |cRXP_FRIENDLY_工蝎的尾巴|r
    .goto 461,44.93,66.42
    .accept 25131 >>接任务: |cRXP_LOOT_邪灵劣魔|r
    .goto 461,45.81,63.42
	.isQuestComplete 25136
    .target Galgar
    .target Gornek
    .target Zureetha Fargaze
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高内克|r, |cRXP_FRIENDLY_祖雷萨|r, |cRXP_FRIENDLY_工头塔兹利尔|r
    .turnin 25127 >>交任务: |cRXP_FRIENDLY_工蝎的尾巴|r
    .goto 461,44.93,66.42
    .accept 25131 >>接任务: |cRXP_LOOT_邪灵劣魔|r
    .goto 461,45.81,63.42
    .turnin 37446 >>交任务: |cRXP_FRIENDLY_懒惰的苦工|r
    .goto 461,46.15,63.28
	.isQuestComplete 37446
    .target Gornek
    .target Zureetha Fargaze
    .target Foreman Thazz'ril
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高内克|r, |cRXP_FRIENDLY_祖雷萨|r
    .turnin 25127 >>交任务: |cRXP_FRIENDLY_工蝎的尾巴|r
    .goto 461,44.91,66.41
    .accept 25131 >>接任务: |cRXP_LOOT_邪灵劣魔|r
    .goto 461,45.81,63.42
    .target Gornek
    .target Zureetha Fargaze
step
    #label ValleyOfTrialsBackDen
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈纳祖|r
    .goto 461,34.62,44.23
    .turnin 25129 >>交任务: |cRXP_FRIENDLY_萨科斯|r
    .accept 25130 >>接任务: |cRXP_WARN_返回大兽穴|r
    .target Hana'zua
step
    #completewith next
    >>在睡觉时使用 |T133486:0|t[Foreman's Blackjack] |cRXP_FRIENDLY_Lazy Peons|r
    .goto 461,36.22,35.30,20,0
    .goto 461,37.20,29.67,20,0
    .complete 37446,1 --4/4 Sleeping Lazy Peons awakened
    .use 16114
    .target Lazy Peon
step
    .goto 461,49.86,25.11,50,0
    .goto 461,56.34,31.92,50,0
    .goto 461,48.90,37.40
	>>杀死 |cRXP_ENEMY_Vile Familiars|r
    .complete 25131,1 --8/8 Vile Familiar slain
    .mob Vile Familiar
step
    .goto 461,58.79,36.66,35,0
    .goto 461,54.42,57.33,20,0
    .goto 461,52.01,69.59,20,0
    .goto 461,48.28,71.90
    >>在睡觉时使用 |T133486:0|t[Foreman's Blackjack] |cRXP_FRIENDLY_Lazy Peons|r
    .complete 37446,1 --4/4 Sleeping Lazy Peons awakened
    .use 16114
    .target Lazy Peon
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖雷萨|r, |cRXP_FRIENDLY_工头塔兹利尔|r
    .turnin 25131 >>交任务: |cRXP_FRIENDLY_邪灵劣魔|r
    .accept 25132 >>接任务: |cRXP_LOOT_火刃奖章|r
    .goto 461,45.81,63.42
    .turnin 37446 >>交任务: |cRXP_FRIENDLY_懒惰的苦工|r
    .accept 25135 >>接任务: |cRXP_LOOT_塔兹利尔的镐|r
    .goto 461,46.15,63.28
	.isOnQuest 37446
    .target Zureetha Fargaze
    .target Foreman Thazz'ril
step
	#label ValleyTurnins
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖雷萨|r, |cRXP_FRIENDLY_工头塔兹利尔|r
    .turnin 25131 >>交任务: |cRXP_FRIENDLY_邪灵劣魔|r
    .accept 25132 >>接任务: |cRXP_LOOT_火刃奖章|r
    .goto 461,45.81,63.42
    .accept 25135 >>接任务: |cRXP_LOOT_塔兹利尔的镐|r
    .goto 461,46.15,63.28
    .target Zureetha Fargaze
    .target Foreman Thazz'ril
step << Hunter
    #completewith next
    .goto 461,52.42,52.84,20,0
    .goto 461,50.50,53.00,20,0
    >>掠夺 |cRXP_LOOT_Cactus Apple|r 植物
    .complete 25136,1 --6/6 Cactus Apple
step << Hunter Orc
    .goto 461,47.61,47.66
    .cast 1515 >>瞄准一头 |cRXP_ENEMY_Mottled Boar|r，施放并引导 |T132164:0|t[Tame Beast] 来驯服它
    .isOnQuest 25135
    .mob Mottled Boar
step
    .goto 461,50.50,53.00,18,0 << !Hunter
    .goto 461,51.34,32.89,18,0
    .goto 461,50.28,27.29,18,0
    .goto 461,53.63,28.29
    >>掠夺 |cRXP_LOOT_Cactus Apple|r 植物
    .complete 25136,1 --6/6 Cactus Apple
step
    #completewith Yarrog
	>>杀死洞穴内的 |cRXP_ENEMY_Felstalkers|r
    .complete 25132,1 --5/5 Felstalker slain
    .mob Felstalker
step
    >>战利品 |cRXP_LOOT_Thazz'ril 的选择|r 在地面上
    .goto 1,45.37,56.22,15,0
    .goto 2,75.04,80.08,15,0
    .goto 2,40.75,52.56
    .complete 25135,1 --1/1 Thazz'ril's Pick
step
	#label Yarrog
    >>杀死 |cRXP_ENEMY_Yarrog Baneshadow|r。掠夺他的 |cRXP_LOOT_Medallion|r
    .goto 2,39.21,88.42,15,0
    .goto 2,14.96,46.80
    .complete 25132,2 --1/1 Bruning Blade Medallion
    .mob Yarrog Baneshadow
step
    .goto 2,39.21,88.42,15,0
    .goto 2,75.04,80.08,15,0
    .goto 1,45.37,56.22
	>>杀死洞穴内的 |cRXP_ENEMY_Felstalkers|r
    .complete 25132,1 --5/5 Felstalker slain
    .mob Felstalker
step
    #completewith next
    .goto 2,14.96,46.80,-1
    .goto 461,48.47,70.89,-1
    .deathskip >>尽可能多地吸引怪物，然后死亡并在灵魂治疗师处重生。在路标附近或洞穴入口附近死亡 << !Hunter !Warlock
    .deathskip >>|cfff78300将宠物设置为被动。|r 尽可能多地吸引怪物，然后死亡并在灵魂治疗师处重生。在路标附近或洞穴入口附近死亡 << Hunter/Warlock
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高内克|r, |cRXP_FRIENDLY_戈加尔|r, |cRXP_FRIENDLY_祖雷萨|r, |cRXP_FRIENDLY_工头塔兹利尔|r
    .turnin 25130 >>交任务: |cRXP_FRIENDLY_返回大兽穴|r
    .goto 461,44.93,66.42
    .turnin 25136 >>交任务: |cRXP_FRIENDLY_戈加尔的清凉果|r
    .goto 461,42.95,62.42
    .turnin 25132 >>交任务: |cRXP_FRIENDLY_火刃奖章|r
    .accept 25133 >>接任务: |cRXP_LOOT_去森金村报到|r << Orc
    .goto 461,45.82,63.42
    .turnin 25135 >>交任务: |cRXP_FRIENDLY_塔兹利尔的镐|r
    .goto 461,46.19,63.29
	.isOnQuest 25136
    .target Galgar
    .target Gornek
    .target Zureetha Fargaze
    .target Foreman Thazz'ril
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高内克|r, |cRXP_FRIENDLY_祖雷萨|r, |cRXP_FRIENDLY_工头塔兹利尔|r
    .turnin 25130 >>交任务: |cRXP_FRIENDLY_返回大兽穴|r
    .goto 461,44.93,66.42
    .turnin 25132 >>交任务: |cRXP_FRIENDLY_火刃奖章|r
    .accept 25133 >>接任务: |cRXP_LOOT_去森金村报到|r << Orc
    .goto 461,45.82,63.42
    .turnin 25135 >>交任务: |cRXP_FRIENDLY_塔兹利尔的镐|r
    .goto 461,46.19,63.29
    .target Gornek
    .target Zureetha Fargaze
    .target Foreman Thazz'ril
step << Troll
    .goto 461,46.68,52.16
    .xp 10
step << Troll
    #completewith next
    .goto 1,45.34,56.40,10,0
    .goto 2,57.97,30.96
    .deathskip >>回到洞穴内。尽可能多地吸引怪物，然后死亡并在灵魂治疗师处重生。在路径点附近死亡 << !Hunter !Warlock
    .deathskip >>回到洞穴内。|cfff78300将你的宠物设置为被动。|r 尽可能多地吸引怪物，然后死亡并在灵魂治疗师处重生。在路径点附近死亡 << Hunter/Warlock
step << Troll
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波洛克|r
    .goto 1,53.10,43.58
    .fly Orgrimmar >>飞往奥格瑞玛
    .target Burok
]])

RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#subgroup 巨魔起始区 << Troll
#subgroup 兽人起始区域 << Orc
#subgroup 杜隆塔尔起始区域 << !Orc !Troll
#name 1巨魔起始区 << Troll
#name 2巨魔起始区 << !Troll --Orc
-- #name 回音群岛 << !Troll !Orc
#displayname Chapter 1 - 回音群岛 << Troll
#displayname Chapter 2 - 回音群岛 << !Troll --Orc
-- #displayname 回音群岛 (Troll) << !Troll !Orc
#next 2兽人起始区 << Troll
#next RestedXP 部落 10-60\\1 BfA 简介 << !Troll --Orc
#defaultfor Orc !DK/Troll !DK

<< Horde

step << Orc
    #completewith next
    .cast 202844 >>使用你的 |T1405809:0|t[枪鞋] 来更快地移动
    .use 132516
    .itemcount 132516,1
step << Troll
    .zoneskip 1727
    #completewith EchoIslesFirstQuestCheck
    +欢迎来到 RestedXP 的 |cfff78300Troll Starting Zone|r 指南。
    *Without consumables/heirlooms this route is roughly 5 minutes slower than |cfff78300Exiles Reach|r. For faster leveling recreate your character and choose |cfff78300Exiles Reach|r instead.
    *With consumbales/heirlooms this route is just as fast or up to 15% faster.
step << Troll
    .zoneskip 1727,1
    +您位于流放区，但当前指南适用于巨魔起始区。
    +请选择流放者范围指南。
step << Troll
    #completewith next
    +|cRXP_WARN_如果您想充分利用 RXP；请按 Escape -> 选项 -> 键绑定 -> RestedXP 指南 -> 选择并绑定活动按钮 1、2、3 和 4。您也可以对目标执行此操作。|r
    *This will allow you to press a Keybind to use a Quest Items/target a relevant mob
step
    #label EchoIslesFirstQuestCheck
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_金萨拉|r
    .goto 463,42.82,53.43
    .accept 24607 >>接任务: |cRXP_WARN_暗矛的崛起|r << Warrior
    .accept 24750 >>接任务: |cRXP_WARN_暗矛的崛起|r << Mage
    .accept 24758 >>接任务: |cRXP_WARN_暗矛的崛起|r << Shaman
    .accept 24764 >>接任务: |cRXP_WARN_暗矛的崛起|r << Druid
    .accept 24770 >>接任务: |cRXP_WARN_暗矛的崛起|r << Rogue
    .accept 24776 >>接任务: |cRXP_WARN_暗矛的崛起|r << Hunter
    .accept 24782 >>接任务: |cRXP_WARN_暗矛的崛起|r << Priest
    .accept 26272 >>接任务: |cRXP_WARN_暗矛的崛起|r << Warlock
    .accept 31159 >>接任务: |cRXP_WARN_暗矛的崛起|r << Monk
    .target Jin'thala
step << Warrior
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺泰特|r
    .turnin 24607 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24639 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Nortet
step << Mage
    .goto 463,59.71,52.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索拉萨|r
    .turnin 24750 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24751 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Soratha
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奈卡利|r
    .goto 463,50.06,52.75
    .turnin 24758 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24759 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Nekali
step << Druid
    .goto 463,58.06,54.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岑塔布拉|r
    .turnin 24764 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24765 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Zen'tabra
step << Rogue
    .goto 463,52.90,49.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷加提|r
    .turnin 24770 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24771 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Legati
step << Hunter
    .goto 463,56.4,50.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_欧塔扎|r
    .turnin 24776 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24777 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Ortezza
step << Priest
    .goto 463,58.04,49.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图娜尼|r
    .turnin 24782 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24783 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Tunari
step << Warlock
    .goto 463,50.04,49.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃德雷卡|r
    .turnin 26272 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 26273 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Voldreka
--X Currently has phasing issues, need to relog to make him show
step << Monk
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大法师萨布兰希|r
    .turnin 31159 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 31158 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Zabrax
step
    .goto 463,52.20,54.49,15,0 << Warrior
    .goto 463,51.67,53.56 << Warrior
    .goto 463,60.90,52.87,20,0 << Mage
    .goto 463,58.92,53.59 << Mage
    .goto 463,49.82,54.17,20,0 << Shaman
    .goto 463,50.35,48.82,20,0 << Warlock
    .goto 463,58.83,53.72,20,0 << Druid
    .goto 463,57.35,55.29 << Druid
    .goto 463,52.97,49.26,15,0 << Rogue
    .goto 463,52.89,50.69 << Rogue
    .goto 463,56.65,49.54,15,0 << Hunter
    .goto 463,55.92,50.76 << Hunter
    .goto 463,58.78,47.98 << Priest
    .goto 463,49.44,52.23 << Warlock/Shaman
    .goto 463,52.89,50.69,15,0 << Monk
    .goto 463,52.96,53.08 << Monk
    >>杀死|cRXP_ENEMY_Tiki 目标|r
    .complete 24639,1 << Warrior --6/6 Tiki Target slain
    .complete 24751,1 << Mage --6/6 Tiki Target slain
    .complete 24759,1 << Shaman --6/6 Tiki Target slain
    .complete 24765,1 << Druid --6/6 Tiki Target slain
    .complete 24771,1 << Rogue --6/6 Tiki Target slain
    .complete 24777,1 << Hunter --6/6 Tiki Target slain
    .complete 24783,1 << Priest --6/6 Tiki Target slain
    .complete 26273,1 << Warlock --6/6 Tiki Target slain
    .complete 31158,1 << Monk --6/6 Tiki Target slain
    .mob Tiki Target
step << Warrior
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺泰特|r
    .turnin 24639 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24641 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Nortet
step << Mage
    .goto 463,59.71,52.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索拉萨|r
    .turnin 24751 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24753 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Soratha
step << Shaman
    .goto 463,50.06,52.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奈卡利|r
    .turnin 24759 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24761 >>接任务: |cRXP_WARN_粗暴的开始|r
step << Druid
    .goto 463,58.06,54.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岑塔布拉|r
    .turnin 24765 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24767 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Zen'tabra
step << Rogue
    .goto 463,52.90,49.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷加提|r
    .turnin 24771 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24773 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Legati
step << Hunter
    .goto 463,56.4,50.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_欧塔扎|r
    .turnin 24777 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24779 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Ortezza
step << Priest
    .goto 463,58.04,49.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图娜尼|r
    .turnin 24783 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24785 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Tunari
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃德雷卡|r
    .goto 463,50.04,49.93
    .turnin 26273 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 26275 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Voldreka
step << Monk
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大法师萨布兰希|r
    .turnin 31158 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 31160 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Zabrax
step << Warrior
    .goto 463,49.55,59.41,20,0
    .goto 463,52.07,61.40,20,0
    .goto 463,55.33,59.93
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
    .complete 24641,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Mage
    .goto 463,62.91,48.23,10,0
    .goto 463,62.71,56.70
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
    .complete 24753,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Shaman
    .goto 463,47.46,51.74,10,0
    .goto 463,48.06,46.84,10,0
    .goto 463,49.87,41.43,10,0
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
    .complete 24761,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Druid
    .goto 463,63.12,57.25,10,0
    .goto 463,62.68,50.67,10,0
    .goto 463,62.87,47.90
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
    .complete 24767,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Rogue
    .goto 463,48.82,43.95,10,0
    .goto 463,50.89,40.74
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
    .complete 24773,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Hunter
    .goto 463,55.41,41.56
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
    .complete 24779,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Priest
    .goto 463,55.42,41.49
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
    .complete 24785,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Warlock
    .goto 463,49.05,44.40,10,0
    .goto 463,50.84,41.86
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
    .complete 26275,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Monk
    .goto 463,48.82,43.95,10,0
    .goto 463,50.89,40.74
    >>杀死 |cRXP_ENEMY_Wildmane Cats|r。掠夺它们的 |cRXP_LOOT_Pelts|r
    .complete 31160,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Warrior
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺泰特|r
    .turnin 24641 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24642 >>接任务: |cRXP_WARN_试炼场|r
    .target Nortet
step << Mage
    .goto 463,59.71,52.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索拉萨|r
    .turnin 24753 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24754 >>接任务: |cRXP_WARN_试炼场|r
    .target Soratha
step << Shaman
    .goto 463,50.06,52.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奈卡利|r
    .turnin 24761 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24762 >>接任务: |cRXP_WARN_试炼场|r
    .target Nekali
step << Druid
    .goto 463,58.06,54.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岑塔布拉|r
    .turnin 24767 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24768 >>接任务: |cRXP_WARN_试炼场|r
    .target Zen'tabra
step << Rogue
    .goto 463,52.90,49.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷加提|r
    .turnin 24773 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24774 >>接任务: |cRXP_WARN_试炼场|r
    .target Legati
step << Hunter
    .goto 463,56.4,50.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_欧塔扎|r
    .turnin 24779 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24780 >>接任务: |cRXP_WARN_试炼场|r
    .target Ortezza
step << Priest
    .goto 463,58.04,49.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图娜尼|r
    .turnin 24785 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24786 >>接任务: |cRXP_WARN_试炼场|r
    .target Tunari
step << Warlock
    .goto 463,50.04,49.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃德雷卡|r
    .turnin 26275 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 26276 >>接任务: |cRXP_WARN_试炼场|r
    .target Voldreka
step << Monk
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大法师萨布兰希|r
    .turnin 31160 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 31161 >>接任务: |cRXP_WARN_试炼场|r
    .target Zabrax
step << Warrior
    .goto 463,51.94,51.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
    .complete 24642,1 --1/1 Speak to a Darkspear Jailor
    .target Darkspear Jailor
    .skipgossip
step << Mage
    .goto 463,57.50,52.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
    .complete 24754,1 --1/1 Speak to a Darkspear Jailor
    .target Darkspear Jailor
    .skipgossip
step << Shaman
    .goto 463,51.94,51.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
    .complete 24762,1 --1/1 Speak to a Darkspear Jailor
    .target Darkspear Jailor
    .skipgossip
step << Druid
    .goto 463,57.49,52.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
    .complete 24768,1 --1/1 Speak to a Darkspear Jailor
    .target Darkspear Jailor
    .skipgossip
step << Rogue
    .goto 463,51.94,51.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
    .complete 24774,1 --1/1 Speak to a Darkspear Jailor
    .target Darkspear Jailor
    .skipgossip
step << Hunter
    .goto 463,57.49,52.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
    .complete 24780,1 --1/1 Speak to a Darkspear Jailor
    .target Darkspear Jailor
    .skipgossip
step << Priest
    .goto 463,57.47,52.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
    .complete 24786,1 --1/1 Speak to a Darkspear Jailor
    .skipgossip
    .target Darkspear Jailor
step << Troll Warlock
    #completewith next
    .cast 688 >>施展“召唤小鬼”来召唤你的小鬼
step << Warlock
    .goto 463,51.94,51.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
    .complete 26276,1 --1/1 Speak to a Darkspear Jailor
    .skipgossip
    .target Darkspear Jailor
step << Monk
    .goto 463,51.94,51.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗矛狱卒|r
    .complete 31161,1 --1/1 Speak to a Darkspear Jailor
    .skipgossip
    .target Darkspear Jailor
step << Warrior
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
    .goto 463,51.15,51.29
    .complete 24642,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Mage
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
    .goto 463,57.28,51.84,10,0
    .goto 463,58.06,51.54
    .complete 24754,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Shaman
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
    .goto 463,50.68,51.91
    .complete 24762,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Druid
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
    .goto 463,57,28,51.82
    .complete 24768,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Rogue
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
    .goto 463,51.15,51.28
    .complete 24774,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Hunter
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
    .goto 463,57.29,51.80
    .complete 24780,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Priest
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
    .goto 463,57.29,51.82
    .complete 24786,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Warlock
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
    .goto 463,50.69,51.88
    .complete 26276,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Monk
    >>杀死 |cRXP_ENEMY_Captive Spitescale Scout|r
    .goto 463,50.69,51.88
    .complete 26276,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Warrior
    .goto 463,51.45,52.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺泰特|r
    .turnin 24642 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24643 >>接任务: |cRXP_WARN_喜出望外|r
    .target Nortet
step << Mage
    .goto 463,58.20,51.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索拉萨|r
    .turnin 24754 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24755 >>接任务: |cRXP_WARN_喜出望外|r
    .target Soratha
step << Shaman
    .goto 463,50.71,52.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奈卡利|r
    .turnin 24762 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24763 >>接任务: |cRXP_WARN_喜出望外|r
    .target Nekali
step << Druid
    .goto 463,57.66,52.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岑塔布拉|r
    .turnin 24768 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24769 >>接任务: |cRXP_WARN_喜出望外|r
    .target Zen'tabra
step << Rogue
    .goto 463,51.95,51.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷加提|r
    .turnin 24774 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24775 >>接任务: |cRXP_WARN_喜出望外|r
    .target Legati
step << Hunter
    .goto 463,57.22,50.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_欧塔扎|r
    .turnin 24780 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24781 >>接任务: |cRXP_WARN_喜出望外|r
    .target Ortezza
step << Priest
    .goto 463,57.38,50.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图娜尼|r
    .turnin 24786 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24787 >>接任务: |cRXP_WARN_喜出望外|r
    .target Tunari
step << Warlock
    .goto 463,50.69,51.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃德雷卡|r
    .turnin 26276 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 26277 >>接任务: |cRXP_WARN_喜出望外|r
    .target Voldreka
step << Monk
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大法师萨布兰希|r
    .turnin 31161 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 31163 >>接任务: |cRXP_WARN_喜出望外|r
    .target Zabrax
step
    .goto 463,61.57,65.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃金|r
    .turnin 24643 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Warrior
    .turnin 24755 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Mage
    .turnin 24763 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Shaman
    .turnin 24769 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Druid
    .turnin 24775 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Rogue
    .turnin 24781 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Hunter
    .turnin 24787 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Priest
    .turnin 26277 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Warlock
    .turnin 31163 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Monk
    .accept 25064 >>接任务: |cRXP_WARN_莫拉亚|r
    .target Vol'jin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托拉金|r, |cRXP_FRIENDLY_莫拉亚|r
    .accept 25037 >>接任务: |cRXP_WARN_捉螃蟹|r
    .goto 463,60.52,62.87
    .turnin 25064 >>交任务: |cRXP_FRIENDLY_莫拉亚|r
    .accept 24622 >>接任务: |cRXP_WARN_巨魔的铁杆伙伴|r
    .goto 463,56.82,63.69
    .target Tora'jin
    .target Moraya
step
    .itemcount 132516,1
    #completewith next
    .cast 202844 >>使用 |T1405809:0|t[Gunshoes]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基加拉|r, |cRXP_FRIENDLY_缇卡什|r
    .turnin 24622 >>交任务: |cRXP_FRIENDLY_巨魔的铁杆伙伴|r
    .accept 24623 >>接任务: |cRXP_WARN_拯救幼崽|r
    .goto 463,50.42,66.82,30,0
    .goto 463,45.27,85.38
    .accept 24624 >>接任务: |cRXP_WARN_给迷失者的怜悯|r
    .accept 24625 >>接任务: |cRXP_WARN_海巫的配偶|r
    .goto 463,45.73,85.00
    .target Kijara
    .target Tegashi
step
    #completewith Bloodtalons
    #label EchoIslesBloodtalonsRescued
    .goto 463,38.01,67.58,25,0
    >>使用 |T132161:0|t[血爪哨子] 在血爪幼崽附近拯救它们
    .complete 24623,1 --12/12 Bloodtalon Hatchlings rescued
    .use 52283
step
	#completewith next
    .goto 463,38.82,72.57,0
    >>杀死 |cRXP_ENEMY_Corrupted Bloodtalons|r
    .complete 24624,1 --8/8 Corrupted Bloodtalon slain
    .mob Corrupted Bloodtalon
step
    .goto 463,36.72,69.04
    >>杀死 |cRXP_ENEMY_Naj'tess|r。掠夺他的 |cRXP_LOOT_Orb|r
    .complete 24625,1 --1/1 Naj'tess' Orb of Corruption
    .mob Naj'tess
step
	#label Bloodtalons
#loop
	.line 463,34.04,70.60,36.60,69.56,38.51,66.20,40.18,69.15,40.05,71.23,39.37,74.83,38.41,73.07,36.67,73.48,35.14,73.49,36.60,69.56
	.goto 463,34.04,70.60,30,0
	.goto 463,36.60,69.56,30,0
	.goto 463,38.51,66.20,30,0
	.goto 463,40.18,69.15,30,0
	.goto 463,40.05,71.23,30,0
	.goto 463,39.37,74.83,30,0
	.goto 463,38.41,73.07,30,0
	.goto 463,36.67,73.48,30,0
	.goto 463,35.14,73.49,30,0
	.goto 463,36.60,69.56,30,0
    >>杀死 |cRXP_ENEMY_Corrupted Bloodtalons|r
    .complete 24624,1 --8/8 Corrupted Bloodtalon slain
    .mob Corrupted Bloodtalon
step
#loop
	.line 463,36.60,69.56,38.51,66.20,40.18,69.15,40.05,71.23,39.37,74.83,38.41,73.07,36.67,73.48,35.14,73.49,36.60,69.56
	.goto 463,36.60,69.56,30,0
	.goto 463,38.51,66.20,30,0
	.goto 463,40.18,69.15,30,0
	.goto 463,40.05,71.23,30,0
	.goto 463,39.37,74.83,30,0
	.goto 463,38.41,73.07,30,0
	.goto 463,36.67,73.48,30,0
	.goto 463,35.14,73.49,30,0
	.goto 463,36.60,69.56,30,0
    >>使用 |T132161:0|t[血爪哨子] 在血爪幼崽附近拯救它们
    .complete 24623,1 --12/12 Bloodtalon Hatchlings rescued
    .use 52283
step
	#completewith next
    >>回去的路上杀死 |cRXP_ENEMY_侏儒冲浪爬行者s|r。掠夺他们的 |cRXP_LOOT_Meat|r
    .complete 25037,1 --5/5 Fresh Crawler Meat
    .mob 侏儒冲浪爬行者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_缇卡什|r, |cRXP_FRIENDLY_基加拉|r
    .turnin 24625 >>交任务: |cRXP_FRIENDLY_海巫的配偶|r
    .turnin 24624 >>交任务: |cRXP_FRIENDLY_给迷失者的怜悯|r
    .goto 463,45.73,85.00
    .turnin 24623 >>交任务: |cRXP_FRIENDLY_拯救幼崽|r
    .accept 24626 >>接任务: |cRXP_WARN_年轻气盛|r
    .goto 463,45.27,85.38
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
    >>对 |cRXP_FRIENDLY_Swiftclaw|r 使用 |T134326:0|t[Bloodtalon Lasso]。他会在你旁边刷新，然后逆时针绕着小岛跑
    .complete 24626,1 --1/1 Capture Swiftclaw
	.unitscan Swiftclaw
    .use 50053
step
    .goto 463,50.42,66.82,40,0
    .goto 463,53.21,65.40
    >>乘坐 |cRXP_FRIENDLY_Swiftclaw|r 返回 |cRXP_PICK_Raptor Pen|r
    .complete 24626,2 --1/1 Return Swiftclaw to the Raptor Pens
step << Hunter Troll
    #completewith TrollBreakingtheLine
    .goto 463,53.03,65.42
    .cast 1515 >>|cRXP_WARN_使用你的 |T132164:0|t[驯服野兽] 能力驯服一只 |cRXP_ENEMY_Bloodtalon Raptor|r|r
    .mob Bloodtalon Raptor
step
    .goto 463,52.87,71.28,40,0
    .goto 463,58.36,70.75
    >>杀死 |cRXP_ENEMY_侏儒冲浪爬行者s|r。掠夺他们的 |cRXP_LOOT_Meat|r
    .complete 25037,1 --5/5 Fresh Crawler Meat
    .mob 侏儒冲浪爬行者
step << Troll
    #label TrollBreakingtheLine
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莫拉亚|r, |cRXP_FRIENDLY_托尔图盖|r, |cRXP_FRIENDLY_托拉金|r
    .turnin 24626 >>交任务: |cRXP_FRIENDLY_年轻气盛|r
    .goto 463,56.82,63.69
    .accept 25035 >>接任务: |cRXP_WARN_突破防线|r
    .goto 463,58.97,66.85
    .turnin 25037 >>交任务: |cRXP_FRIENDLY_捉螃蟹|r
    .goto 463,60.52,62.87
    .xp >10-1400,1
    .target Moraya
    .target Tortunga
    .target Tora'jin
--XX was 1600
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莫拉亚|r, |cRXP_FRIENDLY_托拉金|r
    .turnin 24626 >>交任务: |cRXP_FRIENDLY_年轻气盛|r
    .goto 463,56.82,63.69
    .accept 25035 >>接任务: |cRXP_WARN_突破防线|r << Orc
    .goto 463,58.97,66.85 << Orc
    .turnin 25037 >>交任务: |cRXP_FRIENDLY_捉螃蟹|r
    .goto 463,60.52,62.87
    .target Moraya
    .target Tora'jin
step
    .goto 463,58.90,23.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莫拉基|r
    .turnin 25035 >>交任务: |cRXP_FRIENDLY_突破防线|r
    .accept 24812 >>接任务: |cRXP_WARN_不再怜悯|r
    .accept 24813 >>接任务: |cRXP_WARN_领土神像|r
	.isOnQuest 25035
    .xp 10,1
    .target Morakki
step
    .goto 463,58.90,23.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莫拉基|r
    .accept 24812 >>接任务: |cRXP_WARN_不再怜悯|r
    .accept 24813 >>接任务: |cRXP_WARN_领土神像|r
	.isQuestTurnedIn 25035
    .target Morakki
step
    #sticky
    #label EchoingIslesSpitescaleNagas
    >>杀死 |cRXP_ENEMY_Spitescale Nagas|r 并放置 |cRXP_LOOT_fetishes|r
    >>|cfff78300别跳下去|r
    .goto 464,58.0,46.3,0,0
    .complete 24812,1 --12/12 Spitescale Naga
	.isQuestTurnedIn 25035
step
    >>使用 |cRXP_PICK_Spitescale Flags|r 旁边的 |T132482:0|t[领土神像]。神像会在一段时间后消失，你可以再次放置它们
    .goto 464,61.97,71.50,6,0
    .goto 464,66.21,58.45,6,0
    .goto 464,68.96,40.94,6,0
    .goto 464,61.30,39.97,6,0
    .goto 464,56.63,44.08,6,0
    .goto 464,61.97,71.50,6,0
    .use 52065
    .complete 24813,1 --8/8 Territorial Fetish placed
	.isQuestTurnedIn 25035
step
    #requires EchoingIslesSpitescaleNagas
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莫拉基|r
    .goto 463,58.90,23.08
    .turnin 24812 >>交任务: |cRXP_FRIENDLY_不再怜悯|r
    .turnin 24813 >>交任务: |cRXP_FRIENDLY_领土神像|r
	.isQuestTurnedIn 25035
    .target Morakki
step << Orc
    .nodmf
    #completewith next
    .hs >>从炉边到试炼之谷
step << Orc
    .nodmf
    #completewith next
    .goto 1,45.37,56.22,20,0
    .goto 2,61.50,65.13,20,0
    .goto 2,57.97,30.96,-1
    .goto 1,53.50,44.43,-1
    >>跑到洞穴的尽头
    .deathskip >>尽可能多地吸引怪物，然后在灵魂治疗师处死亡并重生 << !Hunter !Warlock
    .deathskip >>|cRXP_WARN_将你的宠物设置为被动|r。尽可能多地吸引怪物，然后死亡并在灵魂治疗师处重生 << Hunter/Warlock
step << Orc
    #completewith next
    .goto 1,53.10,43.58,-1
    .goto 1,55.38,63.34,-1
    .fly Orgrimmar >>飞往奥格瑞玛
]])
