RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name A_1_AT_开始
#displayname |cRXP_LOOT_1.0|r - Becoming a Champion

step
	#completewith next
	.goto IcecrownGlacier,69.66,22.86,200 >>前往冰冠冰川的|T236690:0|t银色锦标赛场地
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_裁决者玛蕾尔·图哈特|r
	.goto IcecrownGlacier,69.66,22.86
	.accept 13667 >>接任务: |cRXP_WARN_银色锦标赛|r << Alliance
	.accept 13668 >>接任务: |cRXP_WARN_银色锦标赛|r << Horde
	.target Justicar Mariel Trueheart
step
	#completewith next
	.goto IcecrownGlacier,72.59,22.61
	.fp 银色锦标赛 Grounds >>获取银色比武场飞行路线
	.target Helidan Lightwing
step
	>>进入联盟银色盟约馆 << Alliance
	>>进入部落夺日者帐篷 << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥术师泰利斯|r << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师埃迪恩·炎谷|r << Horde
	.goto IcecrownGlacier,76.46,19.41 << Alliance
	.goto IcecrownGlacier,76.27,24.38 << Horde
	.turnin 13667 >>交任务: |cRXP_FRIENDLY_银色锦标赛|r << Alliance
	.turnin 13668 >>交任务: |cRXP_FRIENDLY_银色锦标赛|r << Horde
	.target Arcanist Taelis << Alliance
	.target Magister Edien Sunhollow << Horde
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥术师泰利斯|r, |cRXP_FRIENDLY_阿瓦雷斯·迅击|r, |cRXP_FRIENDLY_斥候沙琳蒂亚|r << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师埃迪恩·炎谷|r, |cRXP_FRIENDLY_阿玛里尔·誓日|r, |cRXP_FRIENDLY_加拉希亚·晨光|r << Horde
	.accept 13828 >>接任务: |cRXP_WARN_近战训练|r << Alliance
	.goto IcecrownGlacier,76.46,19.41 << Alliance
	.accept 13837 >>接任务: |cRXP_WARN_冲锋训练|r << Alliance
	.goto IcecrownGlacier,76.44,19.35 << Alliance
	.accept 13835 >>接任务: |cRXP_WARN_碎盾训练|r << Alliance
	.goto IcecrownGlacier,76.47,19.46 << Alliance
	.accept 13829 >>接任务: |cRXP_WARN_近战训练|r << Horde
	.goto IcecrownGlacier,76.27,24.38 << Horde
	.accept 13839 >>接任务: |cRXP_WARN_冲锋训练|r << Horde
	.goto IcecrownGlacier,76.31,24.38 << Horde
	.accept 13838 >>接任务: |cRXP_WARN_碎盾训练|r << Horde
	.goto IcecrownGlacier,76.24,24.44 << Horde
	.target Arcanist Taelis << Alliance
	.target Avareth Swiftstrike << Alliance
	.target Scout Shalyndria << Alliance
	.target Magister Edien Sunhollow << Horde
	.target Amariel Sunsworn << Horde
	.target Galathia Brightdawn << Horde
step
	#completewith next
	.goto IcecrownGlacier,75.93,20.37 << Alliance
	.goto IcecrownGlacier,75.63,23.66 << Horde
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Alliance Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Quel'dorei Steed|r << Alliance
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Sunreaver Hawkstrider|r << Horde
	.use 46069 << Alliance
	.use 46070 << Horde
	.target Stabled Quel'dorei Steed << Alliance
	.target Stabled Sunreaver Hawkstrider << Horde
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦利斯·逐风者|r
	.goto IcecrownGlacier,76.66,21.13,20,0 << Horde
	.goto IcecrownGlacier,73.20,19.23
	.complete 13835,1 << Alliance -- Valis Windchaser's advice
	.complete 13838,1 << Horde -- Valis Windchaser's advice
	.skipgossip 33974,1,1
	.target Valis Windchaser
step
	.isOnQuest 13835 << Alliance
	.isOnQuest 13838 << Horde
	>>对 |cRXP_ENEMY_Ranged Targets|r 使用 |T132358:0|tShield-Breaker (2) 并移除其 |T132360:0|tDefend 层。一旦 |T132360:0|tDefend 堆叠不再存在，继续对易受攻击的 |cRXP_ENEMY_Ranged Target|r 使用 |T132358:0|tShield-Breaker
	>>使用 |T132358:0|tShield-Breaker 时，你必须距离 |cRXP_ENEMY_Ranged Target|r 至少 5 码
	.goto IcecrownGlacier,73.13,19.01
	.complete 13835,2 << Alliance -- Use Shield-Breaker on vulnerable Ranged Target (2)
	.complete 13838,2 << Horde -- Use Shield-Breaker on vulnerable Ranged Target (2)
	.mob Ranged Target
step
	.isOnQuest 13837 << Alliance
	.isOnQuest 13839 << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卢格安·钢胃|r
	.goto IcecrownGlacier,72.67,18.87
	.complete 13837,1 << Alliance -- Rugan Steelbelly's advice
	.complete 13839,1 << Horde -- Rugan Steelbelly's advice
	.skipgossip 33972,1,1
	.target Rugan Steelbelly
step
	.isOnQuest 13837 << Alliance
	.isOnQuest 13839 << Horde
	>>对 |cRXP_ENEMY_Charge 目标|r 使用 |T132358:0|tShield-Breaker (2) 来移除 |T132360:0|tDefend 层数。一旦没有 |T132360:0|tDefend 层数剩余，使用 |T132226:0|tCharge (3)
	>>使用 |T132226:0|tCharge 时请确保不要距离 |cRXP_ENEMY_Charge 目标|r 太近或太远
	.goto IcecrownGlacier,72.75,18.85
	.complete 13837,2 << Alliance -- Charge vulnerable Charge Target (2)
	.complete 13839,2 << Horde -- Charge vulnerable Charge Target (2)
	.mob Charge Target
step
	.isOnQuest 13828 << Alliance
	.isOnQuest 13829 << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_耶兰·洛克伍德|r
	.goto IcecrownGlacier,72.46,19.30
	.complete 13828,1 << Alliance -- Jeran Lockwood's advice
	.complete 13829,1 << Horde -- Jeran Lockwood's advice
	.skipgossip 33973,1,1
	.target Jeran Lockwood
step
	.isOnQuest 13828 << Alliance
	.isOnQuest 13829 << Horde
	>>在使用 |T135375:0|tThrust (1) 攻击之前，使用 |T132360:0|tDefend (4) |c99ffff99ALWAYS|r。|T132360:0|tDefend 最多可堆叠 3 次。最好始终堆叠 3 层 |T132360:0|tDefend。如果未堆叠至少 1 层 |T132360:0|tDefend，则在使用 |T135375:0|tThrust 时会受到严重伤害，可能会导致被下马
	>>对 |cRXP_ENEMY_Melee Target Dummy|r 使用 |T135375:0|tThrust (1) 5 次
	>>你也可以在非战斗状态下使用 |T134058:0|tRefresh Mount (5) 进行治疗
	.goto IcecrownGlacier,72.28,19.24
	.complete 13828,2 << Alliance -- Use Thrust on Melee Target (5)
	.complete 13829,2 << Horde -- Use Thrust on Melee Target (5)
	.mob Melee Target
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥术师泰利斯|r, |cRXP_FRIENDLY_阿瓦雷斯·迅击|r, |cRXP_FRIENDLY_斥候沙琳蒂亚|r << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师埃迪恩·炎谷|r, |cRXP_FRIENDLY_阿玛里尔·誓日|r, |cRXP_FRIENDLY_加拉希亚·晨光|r << Horde
	.turnin 13828 >>交任务: |cRXP_FRIENDLY_近战训练|r << Alliance
	.goto IcecrownGlacier,76.46,19.41 << Alliance
	.turnin 13837 >>交任务: |cRXP_FRIENDLY_冲锋训练|r << Alliance
	.goto IcecrownGlacier,76.44,19.35 << Alliance
	.turnin 13835 >>交任务: |cRXP_FRIENDLY_碎盾训练|r << Alliance
	.goto IcecrownGlacier,76.47,19.46 << Alliance
	.turnin 13829 >>交任务: |cRXP_FRIENDLY_近战训练|r << Horde
	.goto IcecrownGlacier,76.27,24.38 << Horde
	.turnin 13839 >>交任务: |cRXP_FRIENDLY_冲锋训练|r << Horde
	.goto IcecrownGlacier,76.31,24.38 << Horde
	.turnin 13838 >>交任务: |cRXP_FRIENDLY_碎盾训练|r << Horde
	.goto IcecrownGlacier,76.24,24.44 << Horde
	.target Arcanist Taelis << Alliance
	.target Avareth Swiftstrike << Alliance
	.target Scout Shalyndria << Alliance
	.target Magister Edien Sunhollow << Horde
	.target Amariel Sunsworn << Horde
	.target Galathia Brightdawn << Horde
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥术师泰利斯|r << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师埃迪恩·炎谷|r << Horde
	.accept 13672 >>接任务: |cRXP_WARN_迎接挑战|r << Alliance
	.goto IcecrownGlacier,76.46,19.41 << Alliance
	.accept 13678 >>接任务: |cRXP_WARN_迎接挑战|r << Horde
	.goto IcecrownGlacier,76.27,24.38 << Horde
	.target Arcanist Taelis << Alliance
	.target Magister Edien Sunhollow << Horde
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥术师泰利斯|r << Alliance
	.daily 13669,13670,13666 >>接任务: |cRXP_WARN_珍贵的武器|r << Alliance
	.goto IcecrownGlacier,76.46,19.41 << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师埃迪恩·炎谷|r << Horde
	.daily 13674,13675,13673 >>接任务: |cRXP_WARN_珍贵的武器|r << Horde
	.goto IcecrownGlacier,76.27,24.38 << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿瓦雷斯·迅击|r, |cRXP_FRIENDLY_斥候沙琳蒂亚|r << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿玛里尔·誓日|r, |cRXP_FRIENDLY_加拉希亚·晨光|r << Horde
	.daily 13671 >>接任务: |cRXP_WARN_实战训练|r << Alliance
	.goto IcecrownGlacier,76.44,19.35 << Alliance
	.daily 13676 >>接任务: |cRXP_WARN_实战训练|r << Horde
	.goto IcecrownGlacier,76.31,24.38 << Horde
	.daily 13625 >>接任务: |cRXP_WARN_学习骑战|r << Alliance
	.goto IcecrownGlacier,76.47,19.46 << Alliance
	.daily 13677 >>接任务: |cRXP_WARN_学习骑战|r << Horde
	.goto IcecrownGlacier,76.24,24.44 << Horde
	.target Arcanist Taelis << Alliance
	.target Avareth Swiftstrike << Alliance
	.target Scout Shalyndria << Alliance
	.target Magister Edien Sunhollow << Horde
	.target Amariel Sunsworn << Horde
	.target Galathia Brightdawn << Horde
	.isQuestAvailable 13672 << Alliance
	.isQuestAvailable 13678 << Horde
step
	#completewith next
	.isOnQuest 13625 << Alliance
	.isOnQuest 13677 << Horde
	.goto IcecrownGlacier,75.93,20.37 << Alliance
	.goto IcecrownGlacier,75.63,23.66 << Horde
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Alliance Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Quel'dorei Steed|r << Alliance
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Sunreaver Hawkstrider|r << Horde
	.use 46069 << Alliance
	.use 46070 << Horde
	.target Stabled Quel'dorei Steed << Alliance
	.target Stabled Sunreaver Hawkstrider << Horde
step
	.isOnQuest 13625 << Alliance
	.isOnQuest 13677 << Horde
	>>对 |cRXP_ENEMY_Ranged Targets|r 使用 |T132358:0|tShield-Breaker (2) 并移除其 |T132360:0|tDefend 层。一旦 |T132360:0|tDefend 堆叠不再存在，请继续对易受攻击的 Ranged Target 使用 |T132358:0|tShield-Breaker
	>>使用 |T132358:0|tShield-Breaker 时，你必须距离 |cRXP_ENEMY_Ranged Target|r 至少 5 码
	.goto IcecrownGlacier,76.66,21.13,20,0 << Horde
	.goto IcecrownGlacier,73.13,19.01
	.complete 13625,2 << Alliance -- Use Shield-Breaker on vulnerable Ranged Target (2)
	.complete 13677,2 << Horde -- Use Shield-Breaker on vulnerable Ranged Target (2)
	.mob Ranged Target
step
	.isOnQuest 13625 << Alliance
	.isOnQuest 13677 << Horde
	>>对 |cRXP_ENEMY_Charge 目标|r 使用 |T132358:0|tShield-Breaker (2) 来移除 |T132360:0|tDefend 层数。一旦没有 |T132360:0|tDefend 层数剩余，使用 |T132226:0|tCharge (3)
	>>使用 |T132226:0|tCharge 时请确保不要距离 |cRXP_ENEMY_Charge 目标|r 太近或太远
	.goto IcecrownGlacier,72.75,18.85
	.complete 13625,3 << Alliance -- Use Charge on vulnerable Charge Target (2)
	.complete 13677,3 << Horde -- Use Charge on vulnerable Charge Target (2)
	.mob Charge Target
step
	.isOnQuest 13625 << Alliance
	.isOnQuest 13677 << Horde
	>>在使用 |T135375:0|tThrust (1) 攻击之前，使用 |T132360:0|tDefend (4) |c99ffff99ALWAYS|r。|T132360:0|tDefend 最多可堆叠 3 次。最好始终堆叠 3 层 |T132360:0|tDefend。如果未堆叠至少 1 层 |T132360:0|tDefend，则在使用 |T135375:0|tThrust 时会受到严重伤害，可能会导致被下马
	>>对 |cRXP_ENEMY_Melee Target Dummy|r 使用 |T135375:0|tThrust (1) 5 次
	>>你也可以在非战斗状态下使用 |T134058:0|tRefresh Mount (5) 进行治疗
	.goto IcecrownGlacier,72.28,19.24
	.complete 13625,1 << Alliance -- Use Thrust on Melee Target (5)
	.complete 13677,1 << Horde -- Use Thrust on Melee Target (5)
	.mob Melee Target
step
	.isOnQuest 13671 << Alliance
	.isOnQuest 13676 << Horde
	>>在冰冠冰川中杀死 |cRXP_ENEMY_Hulking Abominations|r、|cRXP_ENEMY_Malefic Necromancers|r 和 |cRXP_ENEMY_Undying Minions|r 或 |cRXP_ENEMY_any Scourge|r
	>>|cRXP_WARN_记得装备你的武器|r。不要毁掉你的|T135128:0|t|c99ffff99Lance|r。你会再次需要它
	.goto IcecrownGlacier,70.79,62.08,40,0
	.goto IcecrownGlacier,69.99,65.26,40,0
	.goto IcecrownGlacier,67.91,69.43,40,0
	.goto IcecrownGlacier,71.42,68.86,40,0
	.goto IcecrownGlacier,70.79,62.08
	.complete 13671,1 << Alliance -- Icecrown Scourge slain (8)
	.complete 13676,1 << Horde -- Icecrown Scourge slain (8)
	.mob Hulking Abomination
	.mob Malefic Necromancer
	.mob Undying Minion
	.mob Risen Alliance Soldier
step
	.isOnQuest 13669 << Alliance
	.isOnQuest 13674 << Horde
	>>在冰冠冰川和晶歌森林边界的铁墙大坝收集|cRXP_PICK_冬风信子|r
	>>它们从岩石中长出来
	.goto IcecrownGlacier,69.25,76.02,15,0
	.goto IcecrownGlacier,70.05,75.19,15,0
	.goto IcecrownGlacier,71.07,73.20,15,0
	.goto IcecrownGlacier,72.07,73.02,15,0
	.goto IcecrownGlacier,73.42,73.59,15,0
	.goto IcecrownGlacier,69.25,76.02
	.collect 45000,4
step
	#completewith next
	.isOnQuest 13669 << Alliance
	.isOnQuest 13674 << Horde
	.goto Dragonblight,93.18,26.00
	.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
step
	.isOnQuest 13669 << Alliance
	.isOnQuest 13674 << Horde
	.goto Dragonblight,93.18,26.00
	.use 45000 >>在德拉克玛湖中心使用背包中的 |T134195:0|t|cFFFFFF99冬风信子|r
	>>等待德拉克玛少女角色扮演然后拾取|cRXP_PICK_德拉克玛之刃|r
	.cast 62629
	.timer 21,Maiden of Drak'Mar Roleplay
	.complete 13669,1 << Alliance -- Blade of Drak'Mar (1)
	.complete 13674,1 << Horde -- Blade of Drak'Mar (1)
step
	#completewith next
	.isOnQuest 13670 << Alliance
	.isOnQuest 13675 << Horde
	.goto CrystalsongForest,55.05,75.04
	.zone CrystalsongForest >>前往晶歌森林
step
	.isOnQuest 13670 << Alliance
	.isOnQuest 13675 << Horde
	.goto CrystalsongForest,55.05,75.04
	>>杀死 |cRXP_ENEMY_Lord Everblaze|r。从他身上搜刮 |cRXP_LOOT_Everburning Ember|r
	.collect 45005,1 -- Everburning Ember
	.mob Lord Everblaze
step
	#completewith next
	.isOnQuest 13670 << Alliance
	.isOnQuest 13675 << Horde
	.goto HowlingFjord,42.18,19.65
	.zone HowlingFjord >>前往嚎风峡湾北部的冬息湖
step
	.isOnQuest 13670 << Alliance
	.isOnQuest 13675 << Horde
	.goto HowlingFjord,42.18,19.65
	.use 45005 >>使用背包中的 |T135488:0|t|c99ffff99Everburning Ember|r 释放冬息湖的少女
	.complete 13670,1 << Alliance -- Winter's Edge (1)
	.complete 13675,1 << Horde -- Winter's Edge (1)
	.target Maiden of Winter's Breath Lake
step
	#completewith next
	.isOnQuest 13666 << Alliance
	.isOnQuest 13673 << Horde
	.goto Grizzly Hills,60.83,51.36
	.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
step
	.isOnQuest 13666 << Alliance
	.isOnQuest 13673 << Horde
	.goto Grizzly Hills,60.83,51.36,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,61.89,48.56,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.89,48.56
	.use 44986 >>在尝试 /亲吻 Lake Frogs 之前，请先 |c99ffff99Warts-B-Gone 润唇膏|r 放在您的包里 |c99ffff99everytime|r
	>>瞄准湖蛙即可自动亲吻它们。如果不起作用，请输入 /kiss
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最终，其中一只湖蛙会变成人类。与它交谈可获得 |cRXP_PICK_Ashwood Brand|r
	.emote KISS,33211
	.emote KISS,33224
	.skipgossip
	.complete 13666,1 << Alliance -- Ashwood Brand (1)
	.complete 13673,1 << Horde -- Ashwood Brand (1)
	.target Lake Frog
	.target Maiden of Ashwood Lake
step
	.goto IcecrownGlacier,76.46,19.41,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地 << Alliance
	.goto IcecrownGlacier,76.27,24.38,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地 << Horde
	.isOnQuest 13666,13673,13675,13670,13674,13669
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥术师泰利斯|r, |cRXP_FRIENDLY_阿瓦雷斯·迅击|r, |cRXP_FRIENDLY_斥候沙琳蒂亚|r << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师埃迪恩·炎谷|r, |cRXP_FRIENDLY_阿玛里尔·誓日|r, |cRXP_FRIENDLY_加拉希亚·晨光|r << Horde
	.turnin 13669 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r << Alliance
	.goto IcecrownGlacier,76.46,19.41 << Alliance
	.turnin 13674 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r << Horde
	.goto IcecrownGlacier,76.27,24.38 << Horde
	.turnin 13671 >>交任务: |cRXP_FRIENDLY_实战训练|r << Alliance
	.goto IcecrownGlacier,76.44,19.35 << Alliance
	.turnin 13676 >>交任务: |cRXP_FRIENDLY_实战训练|r << Horde
	.goto IcecrownGlacier,76.31,24.38 << Horde
	.turnin 13625 >>交任务: |cRXP_FRIENDLY_学习骑战|r << Alliance
	.goto IcecrownGlacier,76.47,19.46 << Alliance
	.turnin 13677 >>交任务: |cRXP_FRIENDLY_学习骑战|r << Horde
	.goto IcecrownGlacier,76.24,24.44 << Horde
	.target Arcanist Taelis << Alliance
	.target Avareth Swiftstrike << Alliance
	.target Scout Shalyndria << Alliance
	.target Magister Edien Sunhollow << Horde
	.target Amariel Sunsworn << Horde
	.target Galathia Brightdawn << Horde
	.isQuestComplete 13669 << Alliance -- A Worthy Weapon
	.isQuestComplete 13674 << Horde -- A Worthy Weapon
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥术师泰利斯|r, |cRXP_FRIENDLY_阿瓦雷斯·迅击|r, |cRXP_FRIENDLY_斥候沙琳蒂亚|r << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师埃迪恩·炎谷|r, |cRXP_FRIENDLY_阿玛里尔·誓日|r, |cRXP_FRIENDLY_加拉希亚·晨光|r << Horde
	.turnin 13670 >>交任务: |cRXP_FRIENDLY_冬之利刃|r << Alliance
	.goto IcecrownGlacier,76.46,19.41 << Alliance
	.turnin 13675 >>交任务: |cRXP_FRIENDLY_冬之利刃|r << Horde
	.goto IcecrownGlacier,76.27,24.38 << Horde
	.turnin 13671 >>交任务: |cRXP_FRIENDLY_实战训练|r << Alliance
	.goto IcecrownGlacier,76.44,19.35 << Alliance
	.turnin 13676 >>交任务: |cRXP_FRIENDLY_实战训练|r << Horde
	.goto IcecrownGlacier,76.31,24.38 << Horde
	.turnin 13625 >>交任务: |cRXP_FRIENDLY_学习骑战|r << Alliance
	.goto IcecrownGlacier,76.47,19.46 << Alliance
	.turnin 13677 >>交任务: |cRXP_FRIENDLY_学习骑战|r << Horde
	.goto IcecrownGlacier,76.24,24.44 << Horde
	.target Arcanist Taelis << Alliance
	.target Avareth Swiftstrike << Alliance
	.target Scout Shalyndria << Alliance
	.target Magister Edien Sunhollow << Horde
	.target Amariel Sunsworn << Horde
	.target Galathia Brightdawn << Horde
	.isQuestComplete 13670 << Alliance -- The Edge Of Winter
	.isQuestComplete 13675 << Horde -- The Edge Of Winter
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥术师泰利斯|r, |cRXP_FRIENDLY_阿瓦雷斯·迅击|r, |cRXP_FRIENDLY_斥候沙琳蒂亚|r << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师埃迪恩·炎谷|r, |cRXP_FRIENDLY_阿玛里尔·誓日|r, |cRXP_FRIENDLY_加拉希亚·晨光|r << Horde
	.turnin 13666 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r << Alliance
	.goto IcecrownGlacier,76.46,19.41 << Alliance
	.turnin 13673 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r << Horde
	.goto IcecrownGlacier,76.27,24.38 << Horde
	.turnin 13671 >>交任务: |cRXP_FRIENDLY_实战训练|r << Alliance
	.goto IcecrownGlacier,76.44,19.35 << Alliance
	.turnin 13676 >>交任务: |cRXP_FRIENDLY_实战训练|r << Horde
	.goto IcecrownGlacier,76.31,24.38 << Horde
	.turnin 13625 >>交任务: |cRXP_FRIENDLY_学习骑战|r << Alliance
	.goto IcecrownGlacier,76.47,19.46 << Alliance
	.turnin 13677 >>交任务: |cRXP_FRIENDLY_学习骑战|r << Horde
	.goto IcecrownGlacier,76.24,24.44 << Horde
	.target Arcanist Taelis << Alliance
	.target Avareth Swiftstrike << Alliance
	.target Scout Shalyndria << Alliance
	.target Magister Edien Sunhollow << Horde
	.target Amariel Sunsworn << Horde
	.target Galathia Brightdawn << Horde
	.isQuestComplete 13666 << Alliance -- A Blade Fit For A Champion
	.isQuestComplete 13673 << Horde -- A Blade Fit For A Champion
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿瓦雷斯·迅击|r, |cRXP_FRIENDLY_斥候沙琳蒂亚|r << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿玛里尔·誓日|r, |cRXP_FRIENDLY_加拉希亚·晨光|r << Horde
	.turnin -13671 >>交任务: |cRXP_FRIENDLY_实战训练|r << Alliance
	.goto IcecrownGlacier,76.44,19.35 << Alliance
	.turnin -13676 >>交任务: |cRXP_FRIENDLY_实战训练|r << Horde
	.goto IcecrownGlacier,76.31,24.38 << Horde
	.turnin -13625 >>交任务: |cRXP_FRIENDLY_学习骑战|r << Alliance
	.goto IcecrownGlacier,76.47,19.46 << Alliance
	.turnin -13677 >>交任务: |cRXP_FRIENDLY_学习骑战|r << Horde
	.goto IcecrownGlacier,76.24,24.44 << Horde
	.target Avareth Swiftstrike << Alliance
	.target Scout Shalyndria << Alliance
	.target Amariel Sunsworn << Horde
	.target Galathia Brightdawn << Horde
step -- Checking if they have 15 Aspirant's Seals after a set of turn ins.
	>>为了完成任务 |cFFffff00迎接挑战|r 并通过 |T236690:0|t银色锦标赛场地，你必须完成每日任务并获得 |T133443:0|t|c99CCFFFFAspirant's Seals|r
	>>您需要 |T133443:0|t|c99CCFFFF15 候选者印章|r。完成 3 个日常任务后，您每天可获得 5 个
	>>|c99ffff99如果您仍然需要完成每日任务，请在第二天重新加载指南，直到您可以完成此任务|r。
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥术师泰利斯|r << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师埃迪恩·炎谷|r << Horde
	.complete 13672,1 << Alliance -- Aspirant's Seal (15)
	.complete 13678,1 << Horde -- Aspirant's Seal (15)
	.turnin 13672 >>交任务: |cRXP_FRIENDLY_迎接挑战|r << Alliance
	.goto IcecrownGlacier,76.46,19.41 << Alliance
	.turnin 13678 >>交任务: |cRXP_FRIENDLY_迎接挑战|r << Horde
	.goto IcecrownGlacier,76.27,24.38 << Horde
	.target Arcanist Taelis << Alliance
	.target Magister Edien Sunhollow << Horde
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥术师泰利斯|r << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师埃迪恩·炎谷|r << Horde
	.accept 13679 >>接任务: |cRXP_WARN_候选者的挑战|r << Alliance
	.accept 13680 >>接任务: |cRXP_WARN_候选者的挑战|r << Horde
	.goto IcecrownGlacier,76.46,19.41 << Alliance
	.goto IcecrownGlacier,76.27,24.38 << Horde
	.target Arcanist Taelis << Alliance
	.target Magister Edien Sunhollow << Horde
	.isQuestTurnedIn 13672 << Alliance
	.isQuestTurnedIn 13678 << Horde
step
	#completewith next
	>>飞到北边的求道者之环
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Alliance Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Quel'dorei Steed|r << Alliance
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Sunreaver Hawkstrider|r << Horde
	>>如果你丢失了 |T135128:0|t|c99ffff99Alliance Lance|r，你可以在展馆内再次领取 << Alliance
	>>如果你丢失了 |T135128:0|t|c99ffff99Horde Lance|r，你可以在亭子里再拿一个 << Horde
	.goto IcecrownGlacier,71.84,19.87 << Alliance
	.goto IcecrownGlacier,71.84,19.98 << Horde
	.use 46069 << Alliance
	.use 46070 << Horde
	.target Stabled Quel'dorei Steed << Alliance
	.target Stabled Sunreaver Hawkstrider << Horde
	.isOnQuest 13679 << Alliance
	.isOnQuest 13680 << Horde
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从大卫|r
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠中的 |cRXP_ENEMY_Valiant|r
	>>一旦 |cRXP_ENEMY_Valiant|r 上没有 |T132360:0|tDefend 的堆叠，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>等待 |cRXP_ENEMY_Argent Valiant|r 到达然后击败它
	.goto IcecrownGlacier,76.66,21.13,20,0 << Horde
	.goto IcecrownGlacier,71.43,19.57
	.complete 13679,1 << Alliance -- Argent Valiant defeated (1)
	.complete 13680,1 << Horde -- Argent Valiant defeated (1)
	.skipgossip 2
	.timer 13,Argent Valiant Arrival
	.mob Argent Valiant
	.isOnQuest 13679 << Alliance
	.isOnQuest 13680 << Horde
step
	>>跳下 |cRXP_FRIENDLY_Quel'dorei Steed|r << Alliance
	>>从 |cRXP_FRIENDLY_Stabled Sunreaver Hawkstrider|r 上跳下来 << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥术师泰利斯|r << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师埃迪恩·炎谷|r << Horde
	.goto IcecrownGlacier,76.46,19.41 << Alliance
	.goto IcecrownGlacier,76.27,24.38 << Horde
	.turnin 13679 >>交任务: |cRXP_FRIENDLY_候选者的挑战|r << Alliance
	.turnin 13680 >>交任务: |cRXP_FRIENDLY_候选者的挑战|r << Horde
	.accept 13690 >>接任务: |cRXP_WARN_埃索达的勇士|r << Draenei
	.accept 13685 >>接任务: |cRXP_WARN_铁炉堡的勇士|r << Dwarf
	.accept 13688 >>接任务: |cRXP_WARN_[A Valiant Of Gnomeregan]|r << Gnome
	.accept 13684 >>接任务: |cRXP_WARN_暴风城的勇士|r	<< Human
	.accept 13689 >>接任务: |cRXP_WARN_达纳苏斯的勇士|r << NightElf
	.accept 13695 >>接任务: |cRXP_WARN_幽暗城的勇士|r << Scourge
	.accept 13691 >>接任务: |cRXP_WARN_奥格瑞玛的勇士|r << Orc
	.accept 13694 >>接任务: |cRXP_WARN_雷霆崖的勇士|r << Tauren
	.accept 13693 >>接任务: |cRXP_WARN_森金的勇士|r << Troll
	.accept 13696 >>接任务: |cRXP_WARN_银月城的勇士|r << BloodElf
	.target Arcanist Taelis << Alliance
	.target Magister Edien Sunhollow << Horde
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r << Draenei
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r << Dwarf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r << Gnome
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r << Human
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r << NightElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r << Scourge
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r << Orc
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r << Tauren
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r << Troll
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r << BloodElf
	.goto IcecrownGlacier,76.10,19.10 << Draenei
	.goto IcecrownGlacier,76.64,19.49 << Dwarf
	.goto IcecrownGlacier,76.55,19.82 << Gnome
	.goto IcecrownGlacier,76.60,19.12 << Human
	.goto IcecrownGlacier,76.34,19.03 << NightElf
	.goto IcecrownGlacier,76.53,24.21 << Scourge
	.goto IcecrownGlacier,76.46,24.60 << Orc
	.goto IcecrownGlacier,76.20,24.63 << Tauren
	.goto IcecrownGlacier,75.95,24.53 << Troll
	.goto IcecrownGlacier,76.45,23.85 << BloodElf
	.turnin 13690 >>交任务: |cRXP_FRIENDLY_埃索达的勇士|r << Draenei
	.turnin 13685 >>交任务: |cRXP_FRIENDLY_铁炉堡的勇士|r << Dwarf
	.turnin 13688 >>交任务: |cRXP_FRIENDLY_[A Valiant Of Gnomeregan]|r << Gnome
	.turnin 13684 >>交任务: |cRXP_FRIENDLY_暴风城的勇士|r	<< Human
	.turnin 13689 >>交任务: |cRXP_FRIENDLY_达纳苏斯的勇士|r << NightElf
	.turnin 13695 >>交任务: |cRXP_FRIENDLY_幽暗城的勇士|r << Scourge
	.turnin 13691 >>交任务: |cRXP_FRIENDLY_奥格瑞玛的勇士|r << Orc
	.turnin 13694 >>交任务: |cRXP_FRIENDLY_雷霆崖的勇士|r << Tauren
	.turnin 13693 >>交任务: |cRXP_FRIENDLY_森金的勇士|r << Troll
	.turnin 13696 >>交任务: |cRXP_FRIENDLY_银月城的勇士|r << BloodElf
	.accept 13716 >>接任务: |cRXP_WARN_勇士之战|r << Draenei
	.accept	13714 >>接任务: |cRXP_WARN_勇士之战|r << Dwarf
	.accept 13715 >>接任务: |cRXP_WARN_勇士之战|r << Gnome
	.accept	13718 >>接任务: |cRXP_WARN_勇士之战|r << Human
	.accept 13717 >>接任务: |cRXP_WARN_勇士之战|r << NightElf
	.accept	13721 >>接任务: |cRXP_WARN_勇士之战|r << Scourge
	.accept 13697 >>接任务: |cRXP_WARN_勇士之战|r << Orc
	.accept 13720 >>接任务: |cRXP_WARN_勇士之战|r << Tauren
	.accept 13719 >>接任务: |cRXP_WARN_勇士之战|r << Troll
	.accept 13722 >>接任务: |cRXP_WARN_勇士之战|r << BloodElf
	.target Colosos << Draenei
	.target Lana Stouthammer << Dwarf
	.target Ambrose Boltspark << Gnome
	.target Marshal Jacob Alerius << Human
	.target Jaelyne Evensong << NightElf
	.target Deathstalker Visceri << Scourge
	.target Mokra the Skullcrusher << Orc
	.target Runok Wildmane << Tauren
	.target Zul'tore << Troll
	.target Eressea Dawnsinger << BloodElf

step << Human
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r
	.daily 13603,13616,13600 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.60,19.12
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马库斯·巴洛爵士|r, |cRXP_FRIENDLY_约瑟夫·霍雷上尉|r
	.daily 13592 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.53,19.08
	.daily 13665 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13847 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.62,19.21
	.target Marshal Jacob Alerius
	.target Sir Marcus Barlowe
	.target Captain Joseph Holley
	.isQuestAvailable 13718

step << Draenei
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r
	.daily 13752,13754,13753 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.10,19.10
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨安度斯|r, |cRXP_FRIENDLY_兰妮|r
	.daily 13755 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.08,19.19
	.daily 13756 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13854 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.15,19.08
	.target Colosos
	.target Saandos
	.target Ranii
	.isQuestAvailable 13716

step << NightElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r
	.daily 13757,13759,13758 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.34,19.03
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊蕾丝蒂亚·刃歌|r, |cRXP_FRIENDLY_艾莱·觅星|r
	.daily 13760 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.29,18.99
	.daily 13761 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13855 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.40,19.00
	.target Jaelyne Evensong
	.target Illestria Bladesinger
	.target Airae Starseeker
	.isQuestAvailable 13717

step << Dwarf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r
	.daily 13741,13743,13742 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.64,19.49
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁洛·强击|r, |cRXP_FRIENDLY_克拉拉·沸酒|r
	.daily 13744 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.66,19.41
	.daily 13745 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13851 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.64,19.57
	.target Lana Stouthammer
	.target Rollo Sureshot
	.target Clara Tumblebrew
	.isQuestAvailable 13714

step << Gnome
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r
	.daily 13746,13748,13747 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.55,19.82
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_提克·扳钳|r, |cRXP_FRIENDLY_弗林克·扳钳|r
	.daily 13749 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.60,19.79
	.daily 13750 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13852 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.52,19.89
	.target Ambrose Boltspark
	.target Tickin Gearspanner
	.target Flickin Gearspanner
	.isQuestAvailable 13715

step << BloodElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r
	.daily 13783,13785,13784 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.45,23.85
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克希尔·炎枪|r, |cRXP_FRIENDLY_安妮拉·索隆|r
	.daily 13786 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.41,23.75
	.daily 13787 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13859 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.52,23.93
	.target Eressea Dawnsinger
	.target Kethiel Sunlance
	.target Aneera Thuron
	.isQuestAvailable 13722

step << Scourge
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r
	.daily 13778,13780,13779 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.53,24.21
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎拉·查尔克|r, |cRXP_FRIENDLY_马夫德雷奇|r
	.daily 13781 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.56,24.11
	.daily 13782 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13860 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.55,24.33
	.target Deathstalker Visceri
	.target Sarah Chalke
	.target Handler Dretch
	.isQuestAvailable 13721

step << Orc
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r
	.daily 13762,13764,13763 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.46,24.60
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃基诺斯|r, |cRXP_FRIENDLY_茉拉·狼女|r
	.daily 13765 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.50,24.48
	.daily 13767 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13856 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.40,24.59
	.target Mokra the Skullcrusher
	.target Akinos
	.target Morah Worgsister
	.isQuestAvailable 13697

step << Tauren
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r
	.daily 13773,13775,13774 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.20,24.63
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德恩·暴怒图腾|r, |cRXP_FRIENDLY_安卡·爪蹄|r
	.daily 13776 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.26,24.66
	.daily 13777 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13858 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.14,24.64
	.target Runok Wildmane
	.target Dern Ragetotem
	.target Anka Clawhoof
	.isQuestAvailable 13720

step << Troll
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r
	.daily 13768,13770,13769 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,75.95,24.53
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗影猎手梅兹克雷|r, |cRXP_FRIENDLY_加尔祖|r
	.daily 13771 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.04,24.59
	.daily 13772 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13857 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,75.93,24.41
	.target Zul'tore
	.target Shadow Hunter Mezil-kree
	.target Gahju
	.isQuestAvailable 13719

step -- THE GRAND MELEE
	#completewith next
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上马厩中的埃索达雷象 << Draenei
	.vehicle >>在你的背包中装备|T135128:0|t|c99ffff99联盟长矛|r，然后骑上马厩里的铁炉堡公羊 << Dwarf
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上停在马厩里的诺莫瑞根机械陆行鸟 << Gnome
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上马厩中的暴风城骏马 << Human
	.vehicle >>装备背包中的|T135128:0|t|c99ffff99联盟长枪|r，然后骑上马厩里的达纳苏斯夜刃豹 << NightElf
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上马厩中的被遗忘者战马 << Scourge
	.vehicle >>在你的背包中装备|T135128:0|t|c99ffff99部落枪骑兵|然后骑上马厩里的奥格瑞玛狼 << Orc
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lancer|然后骑上马厩里的雷霆崖科多兽 << Tauren
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上马厩里的暗矛迅猛龙 << Troll
	.vehicle >>装备背包中的|T135128:0|t|c99ffff99部落长枪|r，然后骑上马厩中的银月陆行鸟 << BloodElf
	>>如果你丢失了 |T135128:0|t|c99ffff99Alliance Lance|r，你可以在展馆内再次领取 << Alliance
	>>如果你丢失了 |T135128:0|t|c99ffff99Horde Lance|r，你可以在亭子里再拿一个 << Horde
	.goto IcecrownGlacier,76.36,20.51 << Draenei
	.goto IcecrownGlacier,76.25,20.51 << Dwarf
	.goto IcecrownGlacier,76.17,20.49 << Gnome
	.goto IcecrownGlacier,76.08,20.48 << Human
	.goto IcecrownGlacier,76.00,20.42 << NightElf
	.goto IcecrownGlacier,75.56,23.86 << Scourge
	.goto IcecrownGlacier,75.55,24.00 << Orc
	.goto IcecrownGlacier,75.53,24.26 << Tauren
	.goto IcecrownGlacier,75.58,23.76 << Troll
	.goto IcecrownGlacier,75.54,24.14 << BloodElf
	.use 46069 << Alliance
	.use 46070 << Horde
	.target Stabled Exodar Elekk << Draenei
	.target Stabled Ironforge Ram << Dwarf
	.target Stabled Gnomeregan Mechanostrider << Gnome
	.target Stabled Stormwind Steed << Human
	.target Stabled Darnassian 夜刃豹 << NightElf
	.target Stabled Forsaken Warhorse << Scourge
	.target Stabled Orgrimmar Wolf << Orc
	.target Stabled Thunder Bluff Kodo << Tauren
	.target Stabled Darkspear Raptor << Troll
	.target Stabled Silvermoon Hawkstrider << BloodElf
	.isOnQuest 13665,13745,13750,13756,13761,13767,13772,13777,13782,13787
step -- THE GRAND MELEE
	>>前往联盟勇士之环 << Alliance
	>>前往部落勇士之环 << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Valiant|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠中的 |cRXP_ENEMY_Valiant|r
	>>一旦 |cRXP_ENEMY_Valiant|r 上没有 |T132360:0|tDefend 的堆叠，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Valiant|r 3 次
	.goto IcecrownGlacier,75.31,19.05,10,0 << Alliance
	.goto IcecrownGlacier,75.66,18.72,10,0 << Alliance
	.goto IcecrownGlacier,75.73,18.12,10,0 << Alliance
	.goto IcecrownGlacier,75.08,17.70,10,0 << Alliance
	.goto IcecrownGlacier,74.82,18.39,10,0 << Alliance
	.goto IcecrownGlacier,75.31,19.05,10,0 << Alliance
	.goto IcecrownGlacier,75.66,18.72,10,0 << Alliance
	.goto IcecrownGlacier,75.73,18.12,10,0 << Alliance
	.goto IcecrownGlacier,75.08,17.70,10,0 << Alliance
	.goto IcecrownGlacier,74.82,18.39,10,0 << Alliance
	.goto IcecrownGlacier,75.31,19.05 << Alliance
	.goto IcecrownGlacier,75.48,25.39,10,0 << Horde
	.goto IcecrownGlacier,75.78,26.03,10,0 << Horde
	.goto IcecrownGlacier,75.53,26.69,10,0 << Horde
	.goto IcecrownGlacier,74.99,26.43,10,0 << Horde
	.goto IcecrownGlacier,75.00,25.65,10,0 << Horde
	.goto IcecrownGlacier,75.48,25.39,10,0 << Horde
	.goto IcecrownGlacier,75.78,26.03,10,0 << Horde
	.goto IcecrownGlacier,75.53,26.69,10,0 << Horde
	.goto IcecrownGlacier,74.99,26.43,10,0 << Horde
	.goto IcecrownGlacier,75.00,25.65,10,0 << Horde
	.goto IcecrownGlacier,75.48,25.39 << Horde
	.complete 13665,1 << Human -- Mark of the Valiant (3)
	.complete 13745,1 << Dwarf -- Mark of the Valiant (3)
	.complete 13750,1 << Gnome -- Mark of the Valiant (3)
	.complete 13756,1 << Draenei -- Mark of the Valiant (3)
	.complete 13761,1 << NightElf -- Mark of the Valiant (3)
	.complete 13767,1 << Orc -- Mark of the Valiant (3)
	.complete 13772,1 << Troll -- Mark of the Valiant (3)
	.complete 13777,1 << Tauren -- Mark of the Valiant (3)
	.complete 13782,1 << Scourge -- Mark of the Valiant (3)
	.complete 13787,1 << BloodElf -- Mark of the Valiant (3)
	.isOnQuest 13665,13745,13750,13756,13761,13767,13772,13777,13782,13787
	.skipgossip
	.mob Stormwind Valiant << Alliance
	.mob Ironforge Valiant << Alliance
	.mob Gnomeregan Valiant << Alliance
	.mob Darnassus Valiant << Alliance
	.mob Exodar Valiant << Alliance
	.mob Thunder Bluff Valiant << Horde
	.mob Silvermoon Valiant << Horde
	.mob Sen'jin Valiant << Horde
	.mob Orgrimmar Valiant << Horde
	.mob Undercity Valiant << Horde
step -- A Valiant's Field Training
	>>从坐骑上跳下来。|cRXP_WARN_记得装备你的武器|r。不要毁掉你的|T135128:0|t|c99ffff99Lance|r。你会再次需要它
	>>击杀 |cRXP_ENEMY_Converted Heroes|r
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,46.91,51.72,60,0
	.goto IcecrownGlacier,46.83,54.38,60,0
	.goto IcecrownGlacier,44.82,55.38,60,0
	.goto IcecrownGlacier,42.55,55.28,60,0
	.goto IcecrownGlacier,40.45,53.53,60,0
	.goto IcecrownGlacier,41.50,50.23,60,0
	.goto IcecrownGlacier,44.14,49.89,60,0
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,42.55,55.28
	.complete 13592,1 << Human -- Converted Hero slain (10)
	.complete 13744,1 << Dwarf -- Converted Hero slain (10)
	.complete 13749,1 << Gnome -- Converted Hero slain (10)
	.complete 13755,1 << Draenei -- Converted Hero slain (10)
	.complete 13760,1 << NightElf -- Converted Hero slain (10)
	.complete 13765,1 << Orc -- Converted Hero slain (10)
	.complete 13771,1 << Troll -- Converted Hero slain (10)
	.complete 13776,1 << Tauren -- Converted Hero slain (10)
	.complete 13781,1 << Scourge -- Converted Hero slain (10)
	.complete 13786,1 << BloodElf -- Converted Hero slain (10)
	.isOnQuest 13592,13744,13749,13755,13760,13765,13771,13776,13781,13786
	.mob Converted Hero

step -- At The Enemy's Gates
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Alliance Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r << Alliance
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r << Horde
	>>如果你需要另一个，路障旁边有一个|T135128:0|t|c99ffff99Lance Rack|r
	.goto IcecrownGlacier,48.87,71.78
	.use 46069 << Alliance
	.use 46070 << Horde
	.isOnQuest 13847,13851,13852,13854,13855,13856,13857,13858,13859,13860
	.target Stabled Campaign Warhorse
step
	#completewith next
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.complete 13847,2 << Human -- Boneguard Scout slain (10)
	.complete 13851,2 << Dwarf -- Boneguard Scout slain (10)
	.complete 13852,2 << Gnome -- Boneguard Scout slain (10)
	.complete 13854,2 << Draenei -- Boneguard Scout slain (10)
	.complete 13855,2 << NightElf -- Boneguard Scout slain (10)
	.complete 13856,2 << Orc -- Boneguard Scout slain (10)
	.complete 13857,2 << Troll -- Boneguard Scout slain (10)
	.complete 13858,2 << Tauren -- Boneguard Scout slain (10)
	.complete 13860,2 << Scourge -- Boneguard Scout slain (10)
	.complete 13859,2 << BloodElf -- Boneguard Scout slain (10)
	.isOnQuest 13847,13851,13852,13854,13855,13856,13857,13858,13859,13860
	.mob Boneguard Scout
step
	>>使用你的 |cRXP_FRIENDLY_Warhorse|r 跑过去并立即杀死 |cRXP_ENEMY_Boneguard Footmen|r
	>>杀死 |cRXP_ENEMY_Boneguard Lieutenants|r。获得 |T132360:0|tDefend (4) 的堆叠并维持它。使用 |T132358:0|tShield-Breaker (2) 移除他们的护盾，然后使用 |T132226:0|tCharge (3) 和 |T135375:0|tThrust (1)
	.complete 13847,1 << Human -- Boneguard Footman slain (15)
	.complete 13847,3 << Human -- Boneguard Lieutenant (3)
	.complete 13851,1 << Dwarf -- Boneguard Footman slain (15)
	.complete 13851,3 << Dwarf -- Boneguard Lieutenant slain (3)
	.complete 13852,1 << Gnome -- Boneguard Footman slain (15)
	.complete 13852,3 << Gnome -- Boneguard Lieutenant slain (3)
	.complete 13854,1 << Draenei -- Boneguard Footman slain (15)
	.complete 13854,3 << Draenei -- Boneguard Lieutenant slain (3)
	.complete 13855,1 << NightElf -- Boneguard Footman slain (15)
	.complete 13855,3 << NightElf -- Boneguard Lieutenant slain (3)
	.complete 13856,1 << Orc -- Boneguard Footman slain (15)
	.complete 13856,3 << Orc -- Boneguard Lieutenant slain (3)
	.complete 13857,1 << Troll -- Boneguard Footman slain (15)
	.complete 13857,3 << Troll -- Boneguard Lieutenant slain (3)
	.complete 13858,1 << Tauren -- Boneguard Footman slain (15)
	.complete 13858,3 << Tauren -- Boneguard Lieutenant slain (3)
	.complete 13860,1 << Scourge -- Boneguard Footman slain (15)
	.complete 13860,3 << Scourge -- Boneguard Lieutenant slain (3)
	.complete 13859,1 << BloodElf -- Boneguard Footman slain (15)
	.complete 13859,3 << BloodElf -- Boneguard Lieutenant slain (3)
	.goto IcecrownGlacier,50.42,76.30,40,0
	.goto IcecrownGlacier,50.86,77.73,40,0
	.goto IcecrownGlacier,51.44,79.44,40,0
	.goto IcecrownGlacier,50.42,76.30
	.isOnQuest 13847,13851,13852,13854,13855,13856,13857,13858,13859,13860
	.mob Boneguard Footman
	.mob Boneguard Lieutenant
step
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.goto IcecrownGlacier,51.77,74.97,50,0
	.goto IcecrownGlacier,53.30,73.72,50,0
	.goto IcecrownGlacier,51.75,70.97,50,0
	.goto IcecrownGlacier,49.68,73.21,50,0
	.goto IcecrownGlacier,47.24,73.07,50,0
	.goto IcecrownGlacier,48.80,77.11,50,0
	.goto IcecrownGlacier,50.45,74.34,50,0
	.goto IcecrownGlacier,52.36,73.07,50,0
	.goto IcecrownGlacier,52.36,73.07
	.complete 13847,2 << Human -- Boneguard Scout slain (10)
	.complete 13851,2 << Dwarf -- Boneguard Scout slain (10)
	.complete 13852,2 << Gnome -- Boneguard Scout slain (10)
	.complete 13854,2 << Draenei -- Boneguard Scout slain (10)
	.complete 13855,2 << NightElf -- Boneguard Scout slain (10)
	.complete 13856,2 << Orc -- Boneguard Scout slain (10)
	.complete 13857,2 << Troll -- Boneguard Scout slain (10)
	.complete 13858,2 << Tauren -- Boneguard Scout slain (10)
	.complete 13860,2 << Scourge -- Boneguard Scout slain (10)
	.complete 13859,2 << BloodElf -- Boneguard Scout slain (10)
	.isOnQuest 13847,13851,13852,13854,13855,13856,13857,13858,13859,13860
	.mob Boneguard Scout

step -- A Worthy Weapon v2
	>>|cRXP_WARN_记得装备你的武器|r
	>>在冰冠冰川和晶歌森林边界的铁墙大坝收集|cRXP_PICK_冬风信子|r
	>>它们从岩石中长出来
	.goto IcecrownGlacier,69.25,76.02,15,0
	.goto IcecrownGlacier,70.05,75.19,15,0
	.goto IcecrownGlacier,71.07,73.20,15,0
	.goto IcecrownGlacier,72.07,73.02,15,0
	.goto IcecrownGlacier,73.42,73.59,15,0
	.goto IcecrownGlacier,69.25,76.02
	.collect 45000,4
	.isOnQuest 13600,13742,13747,13753,13758,13763,13769,13774,13779,13784
step
	#completewith next
	.goto Dragonblight,93.18,26.00
	.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
	.isOnQuest 13600,13742,13747,13753,13758,13763,13769,13774,13779,13784
step
	.goto Dragonblight,93.18,26.00
	.use 45000 >>在德拉克玛湖中心使用背包中的 |T134195:0|t|cFFFFFF99冬风信子|r
	>>等待德拉克玛少女角色扮演然后拾取|cRXP_PICK_德拉克玛之刃|r
	.cast 62629
	.timer 21,Maiden of Drak'Mar Roleplay
	.complete 13600,1 << Human -- Blade of Drak'Mar (1)
	.complete 13742,1 << Dwarf -- Blade of Drak'Mar (1)
	.complete 13747,1 << Gnome -- Blade of Drak'Mar (1)
	.complete 13753,1 << Draenei -- Blade of Drak'Mar (1)
	.complete 13758,1 << NightElf -- Blade of Drak'Mar (1)
	.complete 13763,1 << Orc -- Blade of Drak'Mar (1)
	.complete 13769,1 << Troll -- Blade of Drak'Mar (1)
	.complete 13774,1 << Tauren -- Blade of Drak'Mar (1)
	.complete 13779,1 << Scourge -- Blade of Drak'Mar (1)
	.complete 13784,1 << BloodElf -- Blade of Drak'Mar (1)
	.isOnQuest 13600,13742,13747,13753,13758,13763,13769,13774,13779,13784

step -- The Edge Of Winter v2
	#completewith next
	.goto CrystalsongForest,55.05,75.04
	.zone CrystalsongForest >>前往晶歌森林
	.isOnQuest 13616,13743,13748,13754,13759,13764,13770,13775,13780,13785
step
	.goto CrystalsongForest,55.05,75.04
	>>|cRXP_WARN_记得装备你的武器|r
	>>杀死 |cRXP_ENEMY_Lord Everblaze|r。从他身上搜刮 |cRXP_LOOT_Everburning Ember|r
	.collect 45005,1 -- Everburning Ember
	.mob Lord Everblaze
	.isOnQuest 13616,13743,13748,13754,13759,13764,13770,13775,13780,13785
step
	#completewith next
	.goto HowlingFjord,42.18,19.65
	.zone HowlingFjord >>前往嚎风峡湾北部的冬息湖
	.isOnQuest 13616,13743,13748,13754,13759,13764,13770,13775,13780,13785
step
	.goto HowlingFjord,42.18,19.65
	.use 45005 >>使用背包中的 |T135488:0|t|c99ffff99Everburning Ember|r 释放冬息湖的少女
	.complete 13616,1 << Human -- Winter's Edge (1)
	.complete 13743,1 << Dwarf -- Winter's Edge (1)
	.complete 13748,1 << Gnome -- Winter's Edge (1)
	.complete 13754,1 << Draenei -- Winter's Edge (1)
	.complete 13759,1 << NightElf -- Winter's Edge (1)
	.complete 13764,1 << Orc -- Winter's Edge (1)
	.complete 13770,1 << Troll -- Winter's Edge (1)
	.complete 13775,1 << Tauren -- Winter's Edge (1)
	.complete 13780,1 << Scourge -- Winter's Edge (1)
	.complete 13785,1 << BloodElf -- Winter's Edge (1)
	.target Maiden of Winter's Breath Lake
	.isOnQuest 13616,13743,13748,13754,13759,13764,13770,13775,13780,13785

step -- A Blade Fit For A Champion v2
	#completewith next
	.goto Grizzly Hills,60.83,51.36
	.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
	.isOnQuest 13603,13741,13746,13752,13757,13762,13768,13773,13778,13783
step
	.goto Grizzly Hills,60.83,51.36,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,61.89,48.56,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.89,48.56
	.use 44986 >>在尝试 /亲吻 Lake Frogs 之前，请先 |c99ffff99Warts-B-Gone 润唇膏|r 放在您的包里 |c99ffff99everytime|r
	>>瞄准湖蛙即可自动亲吻它们。如果不起作用，请输入 /kiss
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最终，其中一只湖蛙会变成人类。与它交谈可获得 |cRXP_PICK_Ashwood Brand|r
	>>|cRXP_WARN_记得装备你的武器|r
	.emote KISS,33211
	.emote KISS,33224
	.skipgossip
	.complete 13603,1 << Human -- Ashwood Brand (1)
	.complete 13741,1 << Dwarf -- Ashwood Brand (1)
	.complete 13746,1 << Gnome -- Ashwood Brand (1)
	.complete 13752,1 << Draenei -- Ashwood Brand (1)
	.complete 13757,1 << NightElf -- Ashwood Brand (1)
	.complete 13762,1 << Orc -- Ashwood Brand (1)
	.complete 13768,1 << Troll -- Ashwood Brand (1)
	.complete 13773,1 << Tauren -- Ashwood Brand (1)
	.complete 13778,1 << Scourge -- Ashwood Brand (1)
	.complete 13783,1 << BloodElf -- Ashwood Brand (1)
	.target Lake Frog
	.target Maiden of Ashwood Lake
	.isOnQuest 13603,13741,13746,13752,13757,13762,13768,13773,13778,13783
step
	.goto IcecrownGlacier,76.46,19.41,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地 << Alliance
	.goto IcecrownGlacier,76.27,24.38,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地 << Horde
	.isOnQuest 13603,13741,13746,13752,13757,13762,13768,13773,13778,13783,13616,13743,13748,13754,13759,13764,13770,13775,13780,13785,13600,13742,13747,13753,13758,13763,13769,13774,13779,13784
step << Human
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r, |cRXP_FRIENDLY_马库斯·巴洛爵士|r, |cRXP_FRIENDLY_约瑟夫·霍雷上尉|r
	.turnin 13603 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.60,19.12
	.turnin 13592 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.53,19.08
	.turnin 13665 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13847 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.62,19.21
	.target Marshal Jacob Alerius
	.target Sir Marcus Barlowe
	.target Captain Joseph Holley
	.isQuestComplete 13603 -- A Blade Fit For A Champion
step << Human
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r, |cRXP_FRIENDLY_马库斯·巴洛爵士|r, |cRXP_FRIENDLY_约瑟夫·霍雷上尉|r
	.turnin 13616 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.60,19.12
	.turnin 13592 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.53,19.08
	.turnin 13665 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13847 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.62,19.21
	.target Marshal Jacob Alerius
	.target Sir Marcus Barlowe
	.target Captain Joseph Holley
	.isQuestComplete 13616 -- The Edge Of Winter
step << Human
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r, |cRXP_FRIENDLY_马库斯·巴洛爵士|r, |cRXP_FRIENDLY_约瑟夫·霍雷上尉|r
	.turnin 13600 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.60,19.12
	.turnin 13592 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.53,19.08
	.turnin 13665 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13847 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.62,19.21
	.target Marshal Jacob Alerius
	.target Sir Marcus Barlowe
	.target Captain Joseph Holley
	.isQuestComplete 13600 -- A Worthy Weapon
step << Human
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马库斯·巴洛爵士|r, |cRXP_FRIENDLY_约瑟夫·霍雷上尉|r
	.turnin -13592 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.53,19.08
	.turnin -13665 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13847 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.62,19.21
	.target Sir Marcus Barlowe
	.target Captain Joseph Holley

step << Draenei
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r, |cRXP_FRIENDLY_萨安度斯|r, |cRXP_FRIENDLY_兰妮|r
	.turnin 13752 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.10,19.10
	.turnin 13755 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.08,19.19
	.turnin 13756 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13854 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.15,19.08
	.target Colosos
	.target Saandos
	.target Ranii
	.isQuestComplete 13752 -- A Blade Fit For A Champion
step << Draenei
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r, |cRXP_FRIENDLY_萨安度斯|r, |cRXP_FRIENDLY_兰妮|r
	.turnin 13754 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.10,19.10
	.turnin 13755 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.08,19.19
	.turnin 13756 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13854 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.15,19.08
	.target Colosos
	.target Saandos
	.target Ranii
	.isQuestComplete 13754 -- The Edge Of Winter
step << Draenei
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r, |cRXP_FRIENDLY_萨安度斯|r, |cRXP_FRIENDLY_兰妮|r
	.turnin 13753 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.10,19.10
	.turnin 13755 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.08,19.19
	.turnin 13756 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13854 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.15,19.08
	.target Colosos
	.target Saandos
	.target Ranii
	.isQuestComplete 13753 -- A Worthy Weapon
step << Draenei
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨安度斯|r, |cRXP_FRIENDLY_兰妮|r
	.turnin -13755 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.08,19.19
	.turnin -13756 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13854 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.15,19.08
	.target Saandos
	.target Ranii

step << NightElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r, |cRXP_FRIENDLY_伊蕾丝蒂亚·刃歌|r, |cRXP_FRIENDLY_艾莱·觅星|r
	.turnin 13757 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.34,19.03
	.turnin 13760 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.29,18.99
	.turnin 13761 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13855 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,19.00
	.target Jaelyne Evensong
	.target Illestria Bladesinger
	.target Airae Starseeker
	.isQuestComplete 13757 -- A Blade Fit For A Champion
step << NightElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r, |cRXP_FRIENDLY_伊蕾丝蒂亚·刃歌|r, |cRXP_FRIENDLY_艾莱·觅星|r
	.turnin 13759 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.34,19.03
	.turnin 13760 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.29,18.99
	.turnin 13761 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13855 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,19.00
	.target Jaelyne Evensong
	.target Illestria Bladesinger
	.target Airae Starseeker
	.isQuestComplete 13759 -- The Edge Of Winter
step << NightElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r, |cRXP_FRIENDLY_伊蕾丝蒂亚·刃歌|r, |cRXP_FRIENDLY_艾莱·觅星|r
	.turnin 13758 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.34,19.03
	.turnin 13760 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.29,18.99
	.turnin 13761 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13855 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,19.00
	.target Jaelyne Evensong
	.target Illestria Bladesinger
	.target Airae Starseeker
	.isQuestComplete 13758 -- A Worthy Weapon
step << NightElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊蕾丝蒂亚·刃歌|r, |cRXP_FRIENDLY_艾莱·觅星|r
	.turnin -13760 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.29,18.99
	.turnin -13761 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13855 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,19.00
	.target Illestria Bladesinger
	.target Airae Starseeker

step << Dwarf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r, |cRXP_FRIENDLY_鲁洛·强击|r, |cRXP_FRIENDLY_克拉拉·沸酒|r
	.turnin 13741 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.64,19.49
	.turnin 13744 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.66,19.41
	.turnin 13745 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13851 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.64,19.57
	.target Lana Stouthammer
	.target Rollo Sureshot
	.target Clara Tumblebrew
	.isQuestComplete 13741 -- A Blade Fit For A Champion
step << Dwarf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r, |cRXP_FRIENDLY_鲁洛·强击|r, |cRXP_FRIENDLY_克拉拉·沸酒|r
	.turnin 13743 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.64,19.49
	.turnin 13744 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.66,19.41
	.turnin 13745 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13851 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.64,19.57
	.target Lana Stouthammer
	.target Rollo Sureshot
	.target Clara Tumblebrew
	.isQuestComplete 13743 -- The Edge Of Winter
step << Dwarf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r, |cRXP_FRIENDLY_鲁洛·强击|r, |cRXP_FRIENDLY_克拉拉·沸酒|r
	.turnin 13742 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.64,19.49
	.turnin 13744 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.66,19.41
	.turnin 13745 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13851 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.64,19.57
	.target Lana Stouthammer
	.target Rollo Sureshot
	.target Clara Tumblebrew
	.isQuestComplete 13742 -- A Worthy Weapon
step << Dwarf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁洛·强击|r, |cRXP_FRIENDLY_克拉拉·沸酒|r
	.turnin -13744 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.66,19.41
	.turnin -13745 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13851 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.64,19.57
	.target Rollo Sureshot
	.target Clara Tumblebrew

step << Gnome
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r, |cRXP_FRIENDLY_提克·扳钳|r, |cRXP_FRIENDLY_弗林克·扳钳|r
	.turnin 13746 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.55,19.82
	.turnin 13749 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.60,19.79
	.turnin 13750 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13852 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,19.89
	.target Ambrose Boltspark
	.target Tickin Gearspanner
	.target Flickin Gearspanner
	.isQuestComplete 13746 -- A Blade Fit For A Champion
step << Gnome
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r, |cRXP_FRIENDLY_提克·扳钳|r, |cRXP_FRIENDLY_弗林克·扳钳|r
	.turnin 13748 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.55,19.82
	.turnin 13749 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.60,19.79
	.turnin 13750 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13852 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,19.89
	.target Ambrose Boltspark
	.target Tickin Gearspanner
	.target Flickin Gearspanner
	.isQuestComplete 13748 -- The Edge Of Winter
step << Gnome
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r, |cRXP_FRIENDLY_提克·扳钳|r, |cRXP_FRIENDLY_弗林克·扳钳|r
	.turnin 13747 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.55,19.82
	.turnin 13749 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.60,19.79
	.turnin 13750 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13852 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,19.89
	.target Ambrose Boltspark
	.target Tickin Gearspanner
	.target Flickin Gearspanner
	.isQuestComplete 13747 -- A Worthy Weapon
step << Gnome
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_提克·扳钳|r, |cRXP_FRIENDLY_弗林克·扳钳|r
	.turnin -13749 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.60,19.79
	.turnin -13750 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13852 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,19.89
	.target Tickin Gearspanner
	.target Flickin Gearspanner

step << Troll
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r, |cRXP_FRIENDLY_暗影猎手梅兹克雷|r, |cRXP_FRIENDLY_加尔祖|r
	.turnin 13768 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,75.95,24.53
	.turnin 13771 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.04,24.59
	.turnin 13772 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13857 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,75.93,24.41
	.target Zul'tore
	.target Shadow Hunter Mezil-kree
	.target Gahju
	.isQuestComplete 13768 -- A Blade Fit For A Champion
step << Troll
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r, |cRXP_FRIENDLY_暗影猎手梅兹克雷|r, |cRXP_FRIENDLY_加尔祖|r
	.turnin 13770 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,75.95,24.53
	.turnin 13771 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.04,24.59
	.turnin 13772 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13857 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,75.93,24.41
	.target Zul'tore
	.target Shadow Hunter Mezil-kree
	.target Gahju
	.isQuestComplete 13770 -- The Edge Of Winter
step << Troll
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r, |cRXP_FRIENDLY_暗影猎手梅兹克雷|r, |cRXP_FRIENDLY_加尔祖|r
	.turnin 13769 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,75.95,24.53
	.turnin 13771 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.04,24.59
	.turnin 13772 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13857 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,75.93,24.41
	.target Zul'tore
	.target Shadow Hunter Mezil-kree
	.target Gahju
	.isQuestComplete 13769 -- A Worthy Weapon
step << Troll
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗影猎手梅兹克雷|r, |cRXP_FRIENDLY_加尔祖|r
	.turnin -13771 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.04,24.59
	.turnin -13772 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13857 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,75.93,24.41
	.target Shadow Hunter Mezil-kree
	.target Gahju

step << Tauren
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r, |cRXP_FRIENDLY_德恩·暴怒图腾|r, |cRXP_FRIENDLY_安卡·爪蹄|r
	.turnin 13773 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.20,24.63
	.turnin 13776 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.26,24.66
	.turnin 13777 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13858 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.14,24.64
	.target Runok Wildmane
	.target Dern Ragetotem
	.target Anka Clawhoof
	.isQuestComplete 13773 -- A Blade Fit For A Champion
step << Tauren
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r, |cRXP_FRIENDLY_德恩·暴怒图腾|r, |cRXP_FRIENDLY_安卡·爪蹄|r
	.turnin 13775 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.20,24.63
	.turnin 13776 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.26,24.66
	.turnin 13777 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13858 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.14,24.64
	.target Runok Wildmane
	.target Dern Ragetotem
	.target Anka Clawhoof
	.isQuestComplete 13775 -- The Edge Of Winter
step << Tauren
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r, |cRXP_FRIENDLY_德恩·暴怒图腾|r, |cRXP_FRIENDLY_安卡·爪蹄|r
	.turnin 13774 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.20,24.63
	.turnin 13776 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.26,24.66
	.turnin 13777 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13858 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.14,24.64
	.target Runok Wildmane
	.target Dern Ragetotem
	.target Anka Clawhoof
	.isQuestComplete 13774 -- A Worthy Weapon
step << Tauren
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德恩·暴怒图腾|r, |cRXP_FRIENDLY_安卡·爪蹄|r
	.turnin -13776 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.26,24.66
	.turnin -13777 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13858 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.14,24.64
	.target Dern Ragetotem
	.target Anka Clawhoof

step << Orc
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r, |cRXP_FRIENDLY_埃基诺斯|r, |cRXP_FRIENDLY_茉拉·狼女|r
	.turnin 13762 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.46,24.60
	.turnin 13765 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.50,24.48
	.turnin 13767 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13856 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,24.59
	.target Mokra the Skullcrusher
	.target Akinos
	.target Morah Worgsister
	.isQuestComplete 13762 -- A Blade Fit For A Champion
step << Orc
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r, |cRXP_FRIENDLY_埃基诺斯|r, |cRXP_FRIENDLY_茉拉·狼女|r
	.turnin 13764 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.46,24.60
	.turnin 13765 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.50,24.48
	.turnin 13767 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13856 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,24.59
	.target Mokra the Skullcrusher
	.target Akinos
	.target Morah Worgsister
	.isQuestComplete 13764 -- The Edge Of Winter
step << Orc
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r, |cRXP_FRIENDLY_埃基诺斯|r, |cRXP_FRIENDLY_茉拉·狼女|r
	.turnin 13763 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.46,24.60
	.turnin 13765 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.50,24.48
	.turnin 13767 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13856 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,24.59
	.target Mokra the Skullcrusher
	.target Akinos
	.target Morah Worgsister
	.isQuestComplete 13763 -- A Worthy Weapon
step << Orc
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃基诺斯|r, |cRXP_FRIENDLY_茉拉·狼女|r
	.turnin -13765 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.50,24.48
	.turnin -13767 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13856 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,24.59
	.target Akinos
	.target Morah Worgsister

step << Scourge
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r, |cRXP_FRIENDLY_莎拉·查尔克|r, |cRXP_FRIENDLY_马夫德雷奇|r
	.turnin 13778 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.53,24.21
	.turnin 13781 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.56,24.11
	.turnin 13782 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13860 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.55,24.33
	.target Deathstalker Visceri
	.target Sarah Chalke
	.target Handler Dretch
	.isQuestComplete 13778 -- A Blade Fit For A Champion
step << Scourge
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r, |cRXP_FRIENDLY_莎拉·查尔克|r, |cRXP_FRIENDLY_马夫德雷奇|r
	.turnin 13780 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.53,24.21
	.turnin 13781 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.56,24.11
	.turnin 13782 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13860 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.55,24.33
	.target Deathstalker Visceri
	.target Sarah Chalke
	.target Handler Dretch
	.isQuestComplete 13780 -- The Edge Of Winter
step << Scourge
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r, |cRXP_FRIENDLY_莎拉·查尔克|r, |cRXP_FRIENDLY_马夫德雷奇|r
	.turnin 13779 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.53,24.21
	.turnin 13781 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.56,24.11
	.turnin 13782 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13860 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.55,24.33
	.target Deathstalker Visceri
	.target Sarah Chalke
	.target Handler Dretch
	.isQuestComplete 13779 -- A Worthy Weapon
step << Scourge
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎拉·查尔克|r, |cRXP_FRIENDLY_马夫德雷奇|r
	.turnin -13781 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.56,24.11
	.turnin -13782 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13860 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.55,24.33
	.target Sarah Chalke
	.target Handler Dretch

step << BloodElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r, |cRXP_FRIENDLY_克希尔·炎枪|r, |cRXP_FRIENDLY_安妮拉·索隆|r
	.turnin 13783 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.45,23.85
	.turnin 13786 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.41,23.75
	.turnin 13787 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13859 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,23.93
	.target Eressea Dawnsinger
	.target Kethiel Sunlance
	.target Aneera Thuron
	.isQuestComplete 13783 -- A Blade Fit For A Champion
step << BloodElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r, |cRXP_FRIENDLY_克希尔·炎枪|r, |cRXP_FRIENDLY_安妮拉·索隆|r
	.turnin 13785 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.45,23.85
	.turnin 13786 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.41,23.75
	.turnin 13787 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13859 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,23.93
	.target Eressea Dawnsinger
	.target Kethiel Sunlance
	.target Aneera Thuron
	.isQuestComplete 13785 -- The Edge Of Winter
step << BloodElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r, |cRXP_FRIENDLY_克希尔·炎枪|r, |cRXP_FRIENDLY_安妮拉·索隆|r
	.turnin 13784 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.45,23.85
	.turnin 13786 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.41,23.75
	.turnin 13787 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13859 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,23.93
	.target Eressea Dawnsinger
	.target Kethiel Sunlance
	.target Aneera Thuron
	.isQuestComplete 13784 -- A Worthy Weapon
step << BloodElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克希尔·炎枪|r, |cRXP_FRIENDLY_安妮拉·索隆|r
	.turnin -13786 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.41,23.75
	.turnin -13787 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13859 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,23.93
	.target Kethiel Sunlance
	.target Aneera Thuron

step -- Checking if they have 25 Valiant's Seals after a set of turn ins.
	>>为了完成任务 |cFFffff00The Valiant's Charge|r 并通过 |T236690:0|t银色锦标赛 Grounds，你必须完成每日任务并获得 |T133441:0|t|c99CCFFFFValiant's Seal|r
	>>您需要 |T133441:0|t|c99CCFFFF25 勇士印章|r。完成 4 个日常任务后，您每天可获得 5 个
	>>|c99ffff99如果您仍然需要完成每日任务，请在第二天重新加载指南，直到您可以完成此任务|r。
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r << Draenei
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r << Dwarf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r << Gnome
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r << Human
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r << NightElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r << Scourge
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r << Orc
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r << Tauren
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r << Troll
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r << BloodElf
	.goto IcecrownGlacier,76.10,19.10 << Draenei
	.goto IcecrownGlacier,76.64,19.49 << Dwarf
	.goto IcecrownGlacier,76.55,19.82 << Gnome
	.goto IcecrownGlacier,76.60,19.12 << Human
	.goto IcecrownGlacier,76.34,19.03 << NightElf
	.goto IcecrownGlacier,76.53,24.21 << Scourge
	.goto IcecrownGlacier,76.46,24.60 << Orc
	.goto IcecrownGlacier,76.20,24.63 << Tauren
	.goto IcecrownGlacier,75.95,24.53 << Troll
	.goto IcecrownGlacier,76.45,23.85 << BloodElf
	.complete 13716,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Draenei -- Valiant's Seal (25)
	.complete 13714,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Dwarf -- Valiant's Seal (25)
	.complete 13715,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Gnome -- Valiant's Seal (25)
	.complete 13718,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Human -- Valiant's Seal (25)
	.complete 13717,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r << NightElf -- Valiant's Seal (25)
	.complete 13721,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Scourge -- Valiant's Seal (25)
	.complete 13697,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Orc -- Valiant's Seal (25)
	.complete 13720,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Tauren -- Valiant's Seal (25)
	.complete 13719,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Troll -- Valiant's Seal (25)
	.complete 13722,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r << BloodElf -- Valiant's Seal (25)
	.turnin 13716 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Draenei
	.turnin 13714 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Dwarf
	.turnin 13715 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Gnome
	.turnin 13718 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Human
	.turnin 13717 >>交任务: |cRXP_FRIENDLY_勇士之战|r << NightElf
	.turnin 13721 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Scourge
	.turnin 13697 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Orc
	.turnin 13720 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Tauren
	.turnin 13719 >>交任务: |cRXP_FRIENDLY_勇士之战|r << Troll
	.turnin 13722 >>交任务: |cRXP_FRIENDLY_勇士之战|r << BloodElf
	.accept 13724 >>接任务: |cRXP_WARN_勇士的挑战|r << Draenei
	.accept	13713 >>接任务: |cRXP_WARN_勇士的挑战|r << Dwarf
	.accept 13723 >>接任务: |cRXP_WARN_勇士的挑战|r << Gnome
	.accept	13699 >>接任务: |cRXP_WARN_勇士的挑战|r << Human
	.accept 13725 >>接任务: |cRXP_WARN_勇士的挑战|r << NightElf
	.accept	13729 >>接任务: |cRXP_WARN_勇士的挑战|r << Scourge
	.accept 13726 >>接任务: |cRXP_WARN_勇士的挑战|r << Orc
	.accept 13728 >>接任务: |cRXP_WARN_勇士的挑战|r << Tauren
	.accept 13727 >>接任务: |cRXP_WARN_勇士的挑战|r << Troll
	.accept 13731 >>接任务: |cRXP_WARN_勇士的挑战|r << BloodElf
	.target Colosos << Draenei
	.target Lana Stouthammer << Dwarf
	.target Ambrose Boltspark << Gnome
	.target Marshal Jacob Alerius << Human
	.target Jaelyne Evensong << NightElf
	.target Deathstalker Visceri << Scourge
	.target Mokra the Skullcrusher << Orc
	.target Runok Wildmane << Tauren
	.target Zul'tore << Troll
	.target Eressea Dawnsinger << BloodElf
step -- The Valiant's Challenge
	#completewith next
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上马厩中的埃索达雷象 << Draenei
	.vehicle >>在你的背包中装备|T135128:0|t|c99ffff99联盟长矛|r，然后骑上马厩里的铁炉堡公羊 << Dwarf
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上停在马厩里的诺莫瑞根机械陆行鸟 << Gnome
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上马厩中的暴风城骏马 << Human
	.vehicle >>装备背包中的|T135128:0|t|c99ffff99联盟长枪|r，然后骑上马厩里的达纳苏斯夜刃豹 << NightElf
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上马厩中的被遗忘者战马 << Scourge
	.vehicle >>在你的背包中装备|T135128:0|t|c99ffff99部落枪骑兵|然后骑上马厩里的奥格瑞玛狼 << Orc
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lancer|然后骑上马厩里的雷霆崖科多兽 << Tauren
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上马厩里的暗矛迅猛龙 << Troll
	.vehicle >>装备背包中的|T135128:0|t|c99ffff99部落长枪|r，然后骑上马厩中的银月陆行鸟 << BloodElf
	>>如果你丢失了 |T135128:0|t|c99ffff99Alliance Lance|r，你可以在展馆内再次领取 << Alliance
	>>如果你丢失了 |T135128:0|t|c99ffff99Horde Lance|r，你可以在亭子里再拿一个 << Horde
	.goto IcecrownGlacier,76.36,20.51 << Draenei
	.goto IcecrownGlacier,76.25,20.51 << Dwarf
	.goto IcecrownGlacier,76.17,20.49 << Gnome
	.goto IcecrownGlacier,76.08,20.48 << Human
	.goto IcecrownGlacier,76.00,20.42 << NightElf
	.goto IcecrownGlacier,75.56,23.86 << Scourge
	.goto IcecrownGlacier,75.55,24.00 << Orc
	.goto IcecrownGlacier,75.53,24.26 << Tauren
	.goto IcecrownGlacier,75.58,23.76 << Troll
	.goto IcecrownGlacier,75.54,24.14 << BloodElf
	.use 46069 << Alliance
	.use 46070 << Horde
	.target Stabled Exodar Elekk << Draenei
	.target Stabled Ironforge Ram << Dwarf
	.target Stabled Gnomeregan Mechanostrider << Gnome
	.target Stabled Stormwind Steed << Human
	.target Stabled Darnassian 夜刃豹 << NightElf
	.target Stabled Forsaken Warhorse << Scourge
	.target Stabled Orgrimmar Wolf << Orc
	.target Stabled Thunder Bluff Kodo << Tauren
	.target Stabled Darkspear Raptor << Troll
	.target Stabled Silvermoon Hawkstrider << BloodElf
	.isOnQuest 13724,13713,13723,13699,13725,13729,13726,13728,13727,13731
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从丹尼|r
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>等待 |cRXP_ENEMY_Argent Champion|r 到达然后击败它
	.goto IcecrownGlacier,68.60,20.99
	.complete 13724,1 << Draenei -- Argent Champion defeated (1)
	.complete 13713,1 << Dwarf -- Argent Champion defeated (1)
	.complete 13723,1 << Gnome -- Argent Champion defeated (1)
	.complete 13699,1 << Human -- Argent Champion defeated (1)
	.complete 13725,1 << NightElf -- Argent Champion defeated (1)
	.complete 13729,1 << Scourge -- Argent Champion defeated (1)
	.complete 13726,1 << Orc -- Argent Champion defeated (1)
	.complete 13728,1 << Tauren -- Argent Champion defeated (1)
	.complete 13727,1 << Troll -- Argent Champion defeated (1)
	.complete 13731,1 << BloodElf -- Argent Champion defeated (1)
	.skipgossip
	.timer 12,Argent Champion Arrival
	.mob Argent Champion
	.isOnQuest 13724,13713,13723,13699,13725,13729,13726,13728,13727,13731
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r << Draenei
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r << Dwarf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r << Gnome
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r << Human
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r << NightElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r << Scourge
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r << Orc
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r << Tauren
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r << Troll
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r << BloodElf
	.goto IcecrownGlacier,76.10,19.10 << Draenei
	.goto IcecrownGlacier,76.64,19.49 << Dwarf
	.goto IcecrownGlacier,76.55,19.82 << Gnome
	.goto IcecrownGlacier,76.60,19.12 << Human
	.goto IcecrownGlacier,76.34,19.03 << NightElf
	.goto IcecrownGlacier,76.53,24.21 << Scourge
	.goto IcecrownGlacier,76.46,24.60 << Orc
	.goto IcecrownGlacier,76.20,24.63 << Tauren
	.goto IcecrownGlacier,75.95,24.53 << Troll
	.goto IcecrownGlacier,76.45,23.85 << BloodElf
	.turnin 13724 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r << Draenei
	.turnin	13713 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r << Dwarf
	.turnin 13723 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r << Gnome
	.turnin	13699 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r << Human
	.turnin 13725 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r << NightElf
	.turnin	13729 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r << Scourge
	.turnin 13726 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r << Orc
	.turnin 13728 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r << Tauren
	.turnin 13727 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r << Troll
	.turnin 13731 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r << BloodElf
	.target Colosos << Draenei
	.target Lana Stouthammer << Dwarf
	.target Ambrose Boltspark << Gnome
	.target Marshal Jacob Alerius << Human
	.target Jaelyne Evensong << NightElf
	.target Deathstalker Visceri << Scourge
	.target Mokra the Skullcrusher << Orc
	.target Runok Wildmane << Tauren
	.target Zul'tore << Troll
	.target Eressea Dawnsinger << BloodElf
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r << Draenei
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r << Dwarf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r << Gnome
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r << Human
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r << NightElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r << Scourge
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r << Orc
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r << Tauren
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r << Troll
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r << BloodElf
	.goto IcecrownGlacier,76.10,19.10 << Draenei
	.goto IcecrownGlacier,76.64,19.49 << Dwarf
	.goto IcecrownGlacier,76.55,19.82 << Gnome
	.goto IcecrownGlacier,76.60,19.12 << Human
	.goto IcecrownGlacier,76.34,19.03 << NightElf
	.goto IcecrownGlacier,76.53,24.21 << Scourge
	.goto IcecrownGlacier,76.46,24.60 << Orc
	.goto IcecrownGlacier,76.20,24.63 << Tauren
	.goto IcecrownGlacier,75.95,24.53 << Troll
	.goto IcecrownGlacier,76.45,23.85 << BloodElf
	.accept 13734 >>接任务: |cRXP_WARN_冠军诞生|r << Draenei
	.accept	13732 >>接任务: |cRXP_WARN_冠军诞生|r << Dwarf
	.accept 13733 >>接任务: |cRXP_WARN_冠军诞生|r << Gnome
	.accept	13702 >>接任务: |cRXP_WARN_冠军诞生|r << Human
	.accept 13735 >>接任务: |cRXP_WARN_冠军诞生|r << NightElf
	.accept	13739 >>接任务: |cRXP_WARN_冠军诞生|r << Scourge
	.accept 13736 >>接任务: |cRXP_WARN_冠军诞生|r << Orc
	.accept 13738 >>接任务: |cRXP_WARN_冠军诞生|r << Tauren
	.accept 13737 >>接任务: |cRXP_WARN_冠军诞生|r << Troll
	.accept 13740 >>接任务: |cRXP_WARN_冠军诞生|r << BloodElf
	.target Colosos << Draenei
	.target Lana Stouthammer << Dwarf
	.target Ambrose Boltspark << Gnome
	.target Marshal Jacob Alerius << Human
	.target Jaelyne Evensong << NightElf
	.target Deathstalker Visceri << Scourge
	.target Mokra the Skullcrusher << Orc
	.target Runok Wildmane << Tauren
	.target Zul'tore << Troll
	.target Eressea Dawnsinger << BloodElf
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_裁决者玛蕾尔·图哈特|r
	.goto IcecrownGlacier,69.66,22.86
	.turnin 13734 >>交任务: |cRXP_FRIENDLY_冠军诞生|r << Draenei
	.turnin	13732 >>交任务: |cRXP_FRIENDLY_冠军诞生|r << Dwarf
	.turnin 13733 >>交任务: |cRXP_FRIENDLY_冠军诞生|r << Gnome
	.turnin	13702 >>交任务: |cRXP_FRIENDLY_冠军诞生|r << Human
	.turnin 13735 >>交任务: |cRXP_FRIENDLY_冠军诞生|r << NightElf
	.turnin	13739 >>交任务: |cRXP_FRIENDLY_冠军诞生|r << Scourge
	.turnin 13736 >>交任务: |cRXP_FRIENDLY_冠军诞生|r << Orc
	.turnin 13738 >>交任务: |cRXP_FRIENDLY_冠军诞生|r << Tauren
	.turnin 13737 >>交任务: |cRXP_FRIENDLY_冠军诞生|r << Troll
	.turnin 13740 >>交任务: |cRXP_FRIENDLY_冠军诞生|r << BloodElf
	.target Justicar Mariel Trueheart
step
	.goto IcecrownGlacier,76.33,19.48 << Alliance
	.goto IcecrownGlacier,76.17,24.21 << Horde
	+|cRXP_WARN_你现在是|T255137:0|t埃索达的勇士！|r << Draenei
	+|cRXP_WARN_你现在是|T255139:0|t诺莫瑞根的勇士！|r << Gnome
	+|cRXP_WARN_你现在是|T255138:0|t铁炉堡的勇士！|r << Dwarf
	+|cRXP_WARN_你现在是|T255141:0|t达纳苏斯的勇士！|r << NightElf
	+|cRXP_WARN_你现在是|T255140:0|t暴风城的勇士！|r << Human
	+|cRXP_WARN_你现在是|T255142:0|t奥格瑞玛的勇士！|r << Orc
	+|cRXP_WARN_你现在是|T255145:0|t森金的勇士！|r << Troll
	+|cRXP_WARN_你现在是|T255136:0|t银月城的勇士！|r << BloodElf
	+|cRXP_WARN_你现在是|T255143:0|t幽暗城的勇士！|r << Scourge
	+|cRXP_WARN_你现在是|T255144:0|t雷霆崖的冠军！|r << Tauren
	>>|cRXP_LOOT_您现在已经完成本入门指南的阅读！|r
	>>|cRXP_LOOT_你现在可以选择成为|r |cRXP_WARN_Champion|r |cRXP_LOOT_of another|r |cRXP_WARN_Race|r|cRXP_LOOT_|r
	>>|cRXP_LOOT_加载 |cRXP_FRIENDLY_2.0|r 指南，了解您选择接下来要追求的|r |cRXP_WARN_Race|r |cRXP_LOOT_！|r
	>>|cRXP_LOOT_OR
	>>|cRXP_LOOT_你可以开始|r |cRXP_ENEMY_3.0|r |cRXP_LOOT_Champion 每日任务|r
	.isQuestTurnedIn 13724 << Draenei
	.isQuestTurnedIn 13713 << Dwarf
	.isQuestTurnedIn 13723 << Gnome
	.isQuestTurnedIn 13699 << Human
	.isQuestTurnedIn 13725 << NightElf
	.isQuestTurnedIn 13729 << Scourge
	.isQuestTurnedIn 13726 << Orc
	.isQuestTurnedIn 13728 << Tauren
	.isQuestTurnedIn 13727 << Troll
	.isQuestTurnedIn 13731 << BloodElf
]])


RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name B_2_AT_埃索达
#displayname |cRXP_FRIENDLY_2.0|r - Exodar Champion
<< Alliance !Draenei

step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r
	.goto IcecrownGlacier,76.10,19.10
	.accept 13705 >>接任务: |cRXP_WARN_埃索达的勇士|r
	.turnin 13705 >>交任务: |cRXP_FRIENDLY_埃索达的勇士|r
	.target Colosos
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r
	.accept 13716 >>接任务: |cRXP_WARN_勇士之战|r
	.daily 13752,13754,13753 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.10,19.10
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨安度斯|r, |cRXP_FRIENDLY_兰妮|r
	.daily 13755 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.08,19.19
	.daily 13756 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13854 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.15,19.08
	.target Colosos
	.target Saandos
	.target Ranii
	.isQuestAvailable 13716
step -- THE GRAND MELEE
	#completewith next
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上马厩中的埃索达雷象
	.goto IcecrownGlacier,76.36,20.51
	.use 46069
	.target Stabled Exodar Elekk
	.isOnQuest 13756
step -- THE GRAND MELEE
	>>前往联盟勇士之环 << Alliance
	>>前往部落勇士之环 << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Valiant|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠中的 |cRXP_ENEMY_Valiant|r
	>>一旦 |cRXP_ENEMY_Valiant|r 上没有 |T132360:0|tDefend 的堆叠，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Valiant|r 3 次
	.goto IcecrownGlacier,75.31,19.05,10,0
	.goto IcecrownGlacier,75.66,18.72,10,0
	.goto IcecrownGlacier,75.73,18.12,10,0
	.goto IcecrownGlacier,75.08,17.70,10,0
	.goto IcecrownGlacier,74.82,18.39,10,0
	.goto IcecrownGlacier,75.31,19.05,10,0
	.goto IcecrownGlacier,75.66,18.72,10,0
	.goto IcecrownGlacier,75.73,18.12,10,0
	.goto IcecrownGlacier,75.08,17.70,10,0
	.goto IcecrownGlacier,74.82,18.39,10,0
	.goto IcecrownGlacier,75.31,19.05
	.complete 13756,1 -- Mark of the Valiant (3)
	.isOnQuest 13756
	.skipgossip
	.mob Stormwind Valiant
	.mob Ironforge Valiant
	.mob Gnomeregan Valiant
	.mob Darnassus Valiant
	.mob Exodar Valiant
step -- A Valiant's Field Training
	>>从坐骑上跳下来。|cRXP_WARN_记得装备你的武器|r。不要毁掉你的|T135128:0|t|c99ffff99Lance|r。你会再次需要它
	>>击杀 |cRXP_ENEMY_Converted Heroes|r
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,46.91,51.72,60,0
	.goto IcecrownGlacier,46.83,54.38,60,0
	.goto IcecrownGlacier,44.82,55.38,60,0
	.goto IcecrownGlacier,42.55,55.28,60,0
	.goto IcecrownGlacier,40.45,53.53,60,0
	.goto IcecrownGlacier,41.50,50.23,60,0
	.goto IcecrownGlacier,44.14,49.89,60,0
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,42.55,55.28
	.complete 13755,1 -- Converted Hero slain (10)
	.isOnQuest 13755
	.mob Converted Hero

step -- At The Enemy's Gates
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Alliance Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r << Alliance
	>>如果你需要另一个，路障旁边有一个|T135128:0|t|c99ffff99Lance Rack|r
	.goto IcecrownGlacier,48.87,71.78
	.use 46069 << Alliance
	.use 46070 << Horde
	.isOnQuest 13854
	.target Stabled Campaign Warhorse
step
	#completewith next
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.complete 13854,2 -- Boneguard Scout slain (10)
	.isOnQuest 13854
	.mob Boneguard Scout
step
	>>使用你的 |cRXP_FRIENDLY_Warhorse|r 跑过去并立即杀死 |cRXP_ENEMY_Boneguard Footmen|r
	>>杀死 |cRXP_ENEMY_Boneguard Lieutenants|r。获得 |T132360:0|tDefend (4) 的堆叠并维持它。使用 |T132358:0|tShield-Breaker (2) 移除他们的护盾，然后使用 |T132226:0|tCharge (3) 和 |T135375:0|tThrust (1)
	.complete 13854,1 -- Boneguard Footman slain (15)
	.complete 13854,3 -- Boneguard Lieutenant slain (3)
	.goto IcecrownGlacier,50.42,76.30,40,0
	.goto IcecrownGlacier,50.86,77.73,40,0
	.goto IcecrownGlacier,51.44,79.44,40,0
	.goto IcecrownGlacier,50.42,76.30
	.isOnQuest 13854
	.mob Boneguard Footman
	.mob Boneguard Lieutenant
step
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.goto IcecrownGlacier,51.77,74.97,50,0
	.goto IcecrownGlacier,53.30,73.72,50,0
	.goto IcecrownGlacier,51.75,70.97,50,0
	.goto IcecrownGlacier,49.68,73.21,50,0
	.goto IcecrownGlacier,47.24,73.07,50,0
	.goto IcecrownGlacier,48.80,77.11,50,0
	.goto IcecrownGlacier,50.45,74.34,50,0
	.goto IcecrownGlacier,52.36,73.07,50,0
	.goto IcecrownGlacier,52.36,73.07
	.complete 13854,2 -- Boneguard Scout slain (10)
	.isOnQuest 13854
	.mob Boneguard Scout

step -- A Worthy Weapon v2
	>>|cRXP_WARN_记得装备你的武器|r
	>>在冰冠冰川和晶歌森林边界的铁墙大坝收集|cRXP_PICK_冬风信子|r
	>>它们从岩石中长出来
	.goto IcecrownGlacier,69.25,76.02,15,0
	.goto IcecrownGlacier,70.05,75.19,15,0
	.goto IcecrownGlacier,71.07,73.20,15,0
	.goto IcecrownGlacier,72.07,73.02,15,0
	.goto IcecrownGlacier,73.42,73.59,15,0
	.goto IcecrownGlacier,69.25,76.02
	.collect 45000,4
	.isOnQuest 13753
step
	#completewith next
	.goto Dragonblight,93.18,26.00
	.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
	.isOnQuest 13753
step
	.goto Dragonblight,93.18,26.00
	.use 45000 >>在德拉克玛湖中心使用背包中的 |T134195:0|t|cFFFFFF99冬风信子|r
	>>等待德拉克玛少女角色扮演然后拾取|cRXP_PICK_德拉克玛之刃|r
	.cast 62629
	.timer 21,Maiden of Drak'Mar Roleplay
	.complete 13753,1 -- Blade of Drak'Mar (1)
	.isOnQuest 13753

step -- The Edge Of Winter v2
	#completewith next
	.goto CrystalsongForest,55.05,75.04
	.zone CrystalsongForest >>前往晶歌森林
	.isOnQuest 13754
step
	.goto CrystalsongForest,55.05,75.04
	>>|cRXP_WARN_记得装备你的武器|r
	>>杀死 |cRXP_ENEMY_Lord Everblaze|r。从他身上搜刮 |cRXP_LOOT_Everburning Ember|r
	.collect 45005,1 -- Everburning Ember
	.mob Lord Everblaze
	.isOnQuest 13754
step
	#completewith next
	.goto HowlingFjord,42.18,19.65
	.zone HowlingFjord >>前往嚎风峡湾北部的冬息湖
	.isOnQuest 13754
step
	.goto HowlingFjord,42.18,19.65
	.use 45005 >>使用背包中的 |T135488:0|t|c99ffff99Everburning Ember|r 释放冬息湖的少女
	.complete 13754,1 -- Winter's Edge (1)
	.target Maiden of Winter's Breath Lake
	.isOnQuest 13754

step -- A Blade Fit For A Champion v2
	#completewith next
	.goto Grizzly Hills,60.83,51.36
	.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
	.isOnQuest 13752
step
	.goto Grizzly Hills,60.83,51.36,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,61.89,48.56,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.89,48.56
	.use 44986 >>在尝试 /亲吻 Lake Frogs 之前，请先 |c99ffff99Warts-B-Gone 润唇膏|r 放在您的包里 |c99ffff99everytime|r
	>>瞄准湖蛙即可自动亲吻它们。如果不起作用，请输入 /kiss
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最终，其中一只湖蛙会变成人类。与它交谈可获得 |cRXP_PICK_Ashwood Brand|r
	>>|cRXP_WARN_记得装备你的武器|r
	.emote KISS,33211
	.emote KISS,33224
	.skipgossip
	.complete 13752,1 -- Ashwood Brand (1)
	.target Lake Frog
	.target Maiden of Ashwood Lake
	.isOnQuest 13752
step
	.goto IcecrownGlacier,76.46,19.41,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地
	.isOnQuest 13752,13754,13753,13755,13756,13854
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r, |cRXP_FRIENDLY_萨安度斯|r, |cRXP_FRIENDLY_兰妮|r
	.turnin 13752 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.10,19.10
	.turnin 13755 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.08,19.19
	.turnin 13756 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13854 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.15,19.08
	.target Colosos
	.target Saandos
	.target Ranii
	.isQuestComplete 13752 -- A Blade Fit For A Champion
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r, |cRXP_FRIENDLY_萨安度斯|r, |cRXP_FRIENDLY_兰妮|r
	.turnin 13754 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.10,19.10
	.turnin 13755 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.08,19.19
	.turnin 13756 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13854 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.15,19.08
	.target Colosos
	.target Saandos
	.target Ranii
	.isQuestComplete 13754 -- The Edge Of Winter
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r, |cRXP_FRIENDLY_萨安度斯|r, |cRXP_FRIENDLY_兰妮|r
	.turnin 13753 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.10,19.10
	.turnin 13755 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.08,19.19
	.turnin 13756 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13854 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.15,19.08
	.target Colosos
	.target Saandos
	.target Ranii
	.isQuestComplete 13753 -- A Worthy Weapon
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨安度斯|r, |cRXP_FRIENDLY_兰妮|r
	.turnin -13755 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.08,19.19
	.turnin -13756 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13854 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.15,19.08
	.target Saandos
	.target Ranii
step -- Checking if they have 25 Valiant's Seals after a set of turn ins.
	>>为了完成任务 |cFFffff00The Valiant's Charge|r 并通过 |T236690:0|t银色锦标赛 Grounds，你必须完成每日任务并获得 |T133441:0|t|c99CCFFFFValiant's Seal|r
	>>您需要 |T133441:0|t|c99CCFFFF25 勇士印章|r。完成 4 个日常任务后，您每天可获得 5 个
	>>|c99ffff99如果您仍然需要完成每日任务，请在第二天重新加载指南，直到您可以完成此任务|r。
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r
	.goto IcecrownGlacier,76.10,19.10
	.complete 13716,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r -- Valiant's Seal (25)
	.turnin 13716 >>交任务: |cRXP_FRIENDLY_勇士之战|r
	.accept 13724 >>接任务: |cRXP_WARN_勇士的挑战|r
	.target Colosos
step -- The Valiant's Challenge
	#completewith next
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上马厩中的埃索达雷象
	>>如果你丢失了 |T135128:0|t|c99ffff99Alliance Lance|r，你可以在展馆内再次领取
	.goto IcecrownGlacier,76.36,20.51
	.use 46069
	.target Stabled Exodar Elekk
	.isOnQuest 13724
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从丹尼|r
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>等待 |cRXP_ENEMY_Argent Champion|r 到达然后击败它
	.goto IcecrownGlacier,68.60,20.99
	.complete 13724,1 -- Argent Champion defeated (1)
	.skipgossip
	.timer 12,Argent Champion Arrival
	.mob Argent Champion
	.isOnQuest 13724
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗索斯|r
	.goto IcecrownGlacier,76.10,19.10
	.turnin 13724 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r
	.target Colosos
step
	.goto IcecrownGlacier,76.33,19.48
	+|cRXP_WARN_你现在是|T255137:0|t埃索达的勇士！|r
	>>|cRXP_LOOT_您现在已经完成了埃索达冠军指南！|r
	>>|cRXP_LOOT_你现在可以选择成为|r |cRXP_WARN_Champion|r |cRXP_LOOT_of another|r |cRXP_WARN_Race|r|cRXP_LOOT_|r
	>>|cRXP_LOOT_加载 |cRXP_FRIENDLY_2.0|r 指南，了解您选择接下来要追求的|r |cRXP_WARN_Race|r |cRXP_LOOT_！|r
	>>|cRXP_LOOT_OR
	>>|cRXP_LOOT_你可以开始|r |cRXP_ENEMY_3.0|r |cRXP_LOOT_Champion 每日任务|r
	.isQuestTurnedIn 13724
]])


RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name C_2_AT_暴风城
#displayname |cRXP_FRIENDLY_2.0|r - Stormwind Champion
<< Alliance !Human

step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r
	.goto IcecrownGlacier,76.60,19.12
	.accept 13593 >>接任务: |cRXP_WARN_暴风城的勇士|r
	.turnin 13593 >>交任务: |cRXP_FRIENDLY_暴风城的勇士|r
	.target Marshal Jacob Alerius
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r
	.accept 13718 >>接任务: |cRXP_WARN_勇士之战|r
	.daily 13603,13616,13600 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.60,19.12
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马库斯·巴洛爵士|r, |cRXP_FRIENDLY_约瑟夫·霍雷上尉|r
	.daily 13592 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.53,19.08
	.daily 13665 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13847 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.62,19.21
	.target Marshal Jacob Alerius
	.target Sir Marcus Barlowe
	.target Captain Joseph Holley
	.isQuestAvailable 13718

step -- THE GRAND MELEE
	#completewith next
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上马厩中的暴风城骏马
	>>如果你丢失了 |T135128:0|t|c99ffff99Alliance Lance|r，你可以在展馆内再次领取
	.goto IcecrownGlacier,76.08,20.48
	.use 46069
	.target Stabled Stormwind Steed
	.isOnQuest 13665
step -- THE GRAND MELEE
	>>前往联盟勇士之环 << Alliance
	>>前往部落勇士之环 << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Valiant|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠中的 |cRXP_ENEMY_Valiant|r
	>>一旦 |cRXP_ENEMY_Valiant|r 上没有 |T132360:0|tDefend 的堆叠，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Valiant|r 3 次
	.goto IcecrownGlacier,75.31,19.05,10,0
	.goto IcecrownGlacier,75.66,18.72,10,0
	.goto IcecrownGlacier,75.73,18.12,10,0
	.goto IcecrownGlacier,75.08,17.70,10,0
	.goto IcecrownGlacier,74.82,18.39,10,0
	.goto IcecrownGlacier,75.31,19.05,10,0
	.goto IcecrownGlacier,75.66,18.72,10,0
	.goto IcecrownGlacier,75.73,18.12,10,0
	.goto IcecrownGlacier,75.08,17.70,10,0
	.goto IcecrownGlacier,74.82,18.39,10,0
	.goto IcecrownGlacier,75.31,19.05
	.complete 13665,1 -- Mark of the Valiant (3)
	.isOnQuest 13665
	.skipgossip
	.mob Stormwind Valiant
	.mob Ironforge Valiant
	.mob Gnomeregan Valiant
	.mob Darnassus Valiant
	.mob Exodar Valiant
step -- A Valiant's Field Training
	>>从坐骑上跳下来。|cRXP_WARN_记得装备你的武器|r。不要毁掉你的|T135128:0|t|c99ffff99Lance|r。你会再次需要它
	>>击杀 |cRXP_ENEMY_Converted Heroes|r
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,46.91,51.72,60,0
	.goto IcecrownGlacier,46.83,54.38,60,0
	.goto IcecrownGlacier,44.82,55.38,60,0
	.goto IcecrownGlacier,42.55,55.28,60,0
	.goto IcecrownGlacier,40.45,53.53,60,0
	.goto IcecrownGlacier,41.50,50.23,60,0
	.goto IcecrownGlacier,44.14,49.89,60,0
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,42.55,55.28
	.complete 13592,1 -- Converted Hero slain (10)
	.isOnQuest 13592
	.mob Converted Hero

step -- At The Enemy's Gates
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Alliance Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r << Alliance
	>>如果你需要另一个，路障旁边有一个|T135128:0|t|c99ffff99Lance Rack|r
	.goto IcecrownGlacier,48.87,71.78
	.use 46069
	.isOnQuest 13847
	.target Stabled Campaign Warhorse
step
	#completewith next
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.complete 13847,2 -- Boneguard Scout slain (10)
	.isOnQuest 13847
	.mob Boneguard Scout
step
	>>使用你的 |cRXP_FRIENDLY_Warhorse|r 跑过去并立即杀死 |cRXP_ENEMY_Boneguard Footmen|r
	>>杀死 |cRXP_ENEMY_Boneguard Lieutenants|r。获得 |T132360:0|tDefend (4) 的堆叠并维持它。使用 |T132358:0|tShield-Breaker (2) 移除他们的护盾，然后使用 |T132226:0|tCharge (3) 和 |T135375:0|tThrust (1)
	.complete 13847,1 -- Boneguard Footman slain (15)
	.complete 13847,3 -- Boneguard Lieutenant (3)
	.goto IcecrownGlacier,50.42,76.30,40,0
	.goto IcecrownGlacier,50.86,77.73,40,0
	.goto IcecrownGlacier,51.44,79.44,40,0
	.goto IcecrownGlacier,50.42,76.30
	.isOnQuest 13847
	.mob Boneguard Footman
	.mob Boneguard Lieutenant
step
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.goto IcecrownGlacier,51.77,74.97,50,0
	.goto IcecrownGlacier,53.30,73.72,50,0
	.goto IcecrownGlacier,51.75,70.97,50,0
	.goto IcecrownGlacier,49.68,73.21,50,0
	.goto IcecrownGlacier,47.24,73.07,50,0
	.goto IcecrownGlacier,48.80,77.11,50,0
	.goto IcecrownGlacier,50.45,74.34,50,0
	.goto IcecrownGlacier,52.36,73.07,50,0
	.goto IcecrownGlacier,52.36,73.07
	.complete 13847,2 -- Boneguard Scout slain (10)
	.isOnQuest 13847
	.mob Boneguard Scout

step -- A Worthy Weapon v2
	>>|cRXP_WARN_记得装备你的武器|r
	>>在冰冠冰川和晶歌森林边界的铁墙大坝收集|cRXP_PICK_冬风信子|r
	>>它们从岩石中长出来
	.goto IcecrownGlacier,69.25,76.02,15,0
	.goto IcecrownGlacier,70.05,75.19,15,0
	.goto IcecrownGlacier,71.07,73.20,15,0
	.goto IcecrownGlacier,72.07,73.02,15,0
	.goto IcecrownGlacier,73.42,73.59,15,0
	.goto IcecrownGlacier,69.25,76.02
	.collect 45000,4
	.isOnQuest 13600
step
	#completewith next
	.goto Dragonblight,93.18,26.00
	.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
	.isOnQuest 13600
step
	.goto Dragonblight,93.18,26.00
	.use 45000 >>在德拉克玛湖中心使用背包中的 |T134195:0|t|cFFFFFF99冬风信子|r
	>>等待德拉克玛少女角色扮演然后拾取|cRXP_PICK_德拉克玛之刃|r
	.cast 62629
	.timer 21,Maiden of Drak'Mar Roleplay
	.complete 13600,1 -- Blade of Drak'Mar (1)
	.isOnQuest 13600

step -- The Edge Of Winter v2
	#completewith next
	.goto CrystalsongForest,55.05,75.04
	.zone CrystalsongForest >>前往晶歌森林
	.isOnQuest 13616
step
	.goto CrystalsongForest,55.05,75.04
	>>|cRXP_WARN_记得装备你的武器|r
	>>杀死 |cRXP_ENEMY_Lord Everblaze|r。从他身上搜刮 |cRXP_LOOT_Everburning Ember|r
	.collect 45005,1 -- Everburning Ember
	.mob Lord Everblaze
	.isOnQuest 13616
step
	#completewith next
	.goto HowlingFjord,42.18,19.65
	.zone HowlingFjord >>前往嚎风峡湾北部的冬息湖
	.isOnQuest 13616
step
	.goto HowlingFjord,42.18,19.65
	.use 45005 >>使用背包中的 |T135488:0|t|c99ffff99Everburning Ember|r 释放冬息湖的少女
	.complete 13616,1 -- Winter's Edge (1)
	.target Maiden of Winter's Breath Lake
	.isOnQuest 13616

step -- A Blade Fit For A Champion v2
	#completewith next
	.goto Grizzly Hills,60.83,51.36
	.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
	.isOnQuest 13603
step
	.goto Grizzly Hills,60.83,51.36,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,61.89,48.56,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.89,48.56
	.use 44986 >>在尝试 /亲吻 Lake Frogs 之前，请先 |c99ffff99Warts-B-Gone 润唇膏|r 放在您的包里 |c99ffff99everytime|r
	>>瞄准湖蛙即可自动亲吻它们。如果不起作用，请输入 /kiss
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最终，其中一只湖蛙会变成人类。与它交谈可获得 |cRXP_PICK_Ashwood Brand|r
	>>|cRXP_WARN_记得装备你的武器|r
	.emote KISS,33211
	.emote KISS,33224
	.skipgossip
	.complete 13603,1 -- Ashwood Brand (1)
	.target Lake Frog
	.target Maiden of Ashwood Lake
	.isOnQuest 13603
step
	.goto IcecrownGlacier,76.46,19.41,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地
	.isOnQuest 13603,13616,13600,13592,13665,13847
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r, |cRXP_FRIENDLY_马库斯·巴洛爵士|r, |cRXP_FRIENDLY_约瑟夫·霍雷上尉|r
	.turnin 13603 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.60,19.12
	.turnin 13592 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.53,19.08
	.turnin 13665 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13847 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.62,19.21
	.target Marshal Jacob Alerius
	.target Sir Marcus Barlowe
	.target Captain Joseph Holley
	.isQuestComplete 13603 -- A Blade Fit For A Champion
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r, |cRXP_FRIENDLY_马库斯·巴洛爵士|r, |cRXP_FRIENDLY_约瑟夫·霍雷上尉|r
	.turnin 13616 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.60,19.12
	.turnin 13592 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.53,19.08
	.turnin 13665 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13847 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.62,19.21
	.target Marshal Jacob Alerius
	.target Sir Marcus Barlowe
	.target Captain Joseph Holley
	.isQuestComplete 13616 -- The Edge Of Winter
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r, |cRXP_FRIENDLY_马库斯·巴洛爵士|r, |cRXP_FRIENDLY_约瑟夫·霍雷上尉|r
	.turnin 13600 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.60,19.12
	.turnin 13592 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.53,19.08
	.turnin 13665 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13847 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.62,19.21
	.target Marshal Jacob Alerius
	.target Sir Marcus Barlowe
	.target Captain Joseph Holley
	.isQuestComplete 13600 -- A Worthy Weapon
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马库斯·巴洛爵士|r, |cRXP_FRIENDLY_约瑟夫·霍雷上尉|r
	.turnin -13592 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.53,19.08
	.turnin -13665 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13847 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.62,19.21
	.target Sir Marcus Barlowe
	.target Captain Joseph Holley
step
	>>为了完成任务 |cFFffff00The Valiant's Charge|r 并通过 |T236690:0|t银色锦标赛 Grounds，你必须完成每日任务并获得 |T133441:0|t|c99CCFFFFValiant's Seal|r
	>>您需要 |T133441:0|t|c99CCFFFF25 勇士印章|r。完成 4 个日常任务后，您每天可获得 5 个
	>>|c99ffff99如果您仍然需要完成每日任务，请在第二天重新加载指南，直到您可以完成此任务|r。
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r
	.complete 13718,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r -- Valiant's Seal (25)
	.turnin 13718 >>交任务: |cRXP_FRIENDLY_勇士之战|r
	.accept	13699 >>接任务: |cRXP_WARN_勇士的挑战|r
	.target Marshal Jacob Alerius
step -- The Valiant's Challenge
	#completewith next
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上马厩中的暴风城骏马
	>>如果你丢失了 |T135128:0|t|c99ffff99Alliance Lance|r，你可以在展馆内再次领取
	.goto IcecrownGlacier,76.08,20.48
	.use 46069
	.target Stabled Stormwind Steed
	.isOnQuest 13699
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从丹尼|r
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>等待 |cRXP_ENEMY_Argent Champion|r 到达然后击败它
	.goto IcecrownGlacier,68.60,20.99
	.complete 13699,1 -- Argent Champion defeated (1)
	.skipgossip
	.timer 12,Argent Champion Arrival
	.mob Argent Champion
	.isOnQuest 13699
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅克布·奥勒留斯元帅|r
	.goto IcecrownGlacier,76.60,19.12
	.turnin	13699 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r
	.target Marshal Jacob Alerius
step
	.goto IcecrownGlacier,76.33,19.48
	+|cRXP_WARN_你现在是|T255140:0|t暴风城的勇士！|r
	>>|cRXP_LOOT_您现在已经完成了暴风城冠军指南！|r
	>>|cRXP_LOOT_你现在可以选择成为|r |cRXP_WARN_Champion|r |cRXP_LOOT_of another|r |cRXP_WARN_Race|r|cRXP_LOOT_|r
	>>|cRXP_LOOT_加载 |cRXP_FRIENDLY_2.0|r 指南，了解您选择接下来要追求的|r |cRXP_WARN_Race|r |cRXP_LOOT_！|r
	>>|cRXP_LOOT_OR
	>>|cRXP_LOOT_你可以开始|r |cRXP_ENEMY_3.0|r |cRXP_LOOT_Champion 每日任务|r
	.isQuestTurnedIn 13699
]])


RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name D_2_AT_铁炉堡
#displayname |cRXP_FRIENDLY_2.0|r - Ironforge Champion
<< Alliance !Dwarf

step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r
	.goto IcecrownGlacier,76.64,19.49
	.accept 13703 >>接任务: |cRXP_WARN_铁炉堡的勇士|r
	.turnin 13703 >>交任务: |cRXP_FRIENDLY_铁炉堡的勇士|r
	.target Lana Stouthammer
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r
	.accept 13714 >>接任务: |cRXP_WARN_勇士之战|r
	.daily 13741,13743,13742 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.64,19.49
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁洛·强击|r, |cRXP_FRIENDLY_克拉拉·沸酒|r
	.daily 13744 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.66,19.41
	.daily 13745 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13851 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.64,19.57
	.target Lana Stouthammer
	.target Rollo Sureshot
	.target Clara Tumblebrew
	.isQuestAvailable 13714


step -- THE GRAND MELEE
	#completewith next
	.vehicle >>在你的背包中装备|T135128:0|t|c99ffff99联盟长矛|r，然后骑上马厩里的铁炉堡公羊
	>>如果你丢失了 |T135128:0|t|c99ffff99Alliance Lance|r，你可以在展馆内再次领取
	.goto IcecrownGlacier,76.25,20.51
	.use 46069
	.target Stabled Ironforge Ram
	.isOnQuest 13745
step -- THE GRAND MELEE
	>>前往联盟勇士之环
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Valiant|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠中的 |cRXP_ENEMY_Valiant|r
	>>一旦 |cRXP_ENEMY_Valiant|r 上没有 |T132360:0|tDefend 的堆叠，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Valiant|r 3 次
	.goto IcecrownGlacier,75.31,19.05,10,0
	.goto IcecrownGlacier,75.66,18.72,10,0
	.goto IcecrownGlacier,75.73,18.12,10,0
	.goto IcecrownGlacier,75.08,17.70,10,0
	.goto IcecrownGlacier,74.82,18.39,10,0
	.goto IcecrownGlacier,75.31,19.05,10,0
	.goto IcecrownGlacier,75.66,18.72,10,0
	.goto IcecrownGlacier,75.73,18.12,10,0
	.goto IcecrownGlacier,75.08,17.70,10,0
	.goto IcecrownGlacier,74.82,18.39,10,0
	.goto IcecrownGlacier,75.31,19.05
	.complete 13745,1 -- Mark of the Valiant (3)
	.isOnQuest 13745
	.skipgossip
	.mob Stormwind Valiant
	.mob Ironforge Valiant
	.mob Gnomeregan Valiant
	.mob Darnassus Valiant
	.mob Exodar Valiant

step -- A Valiant's Field Training
	>>从坐骑上跳下来。|cRXP_WARN_记得装备你的武器|r。不要毁掉你的|T135128:0|t|c99ffff99Lance|r。你会再次需要它
	>>击杀 |cRXP_ENEMY_Converted Heroes|r
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,46.91,51.72,60,0
	.goto IcecrownGlacier,46.83,54.38,60,0
	.goto IcecrownGlacier,44.82,55.38,60,0
	.goto IcecrownGlacier,42.55,55.28,60,0
	.goto IcecrownGlacier,40.45,53.53,60,0
	.goto IcecrownGlacier,41.50,50.23,60,0
	.goto IcecrownGlacier,44.14,49.89,60,0
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,42.55,55.28
	.complete 13744,1 -- Converted Hero slain (10)
	.isOnQuest 13744
	.mob Converted Hero

step -- At The Enemy's Gates
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Alliance Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r
	>>如果你需要另一个，路障旁边有一个|T135128:0|t|c99ffff99Lance Rack|r
	.goto IcecrownGlacier,48.87,71.78
	.use 46069
	.isOnQuest 13851
	.target Stabled Campaign Warhorse
step
	#completewith next
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.complete 13851,2 -- Boneguard Scout slain (10)
	.isOnQuest 13851
	.mob Boneguard Scout
step
	>>使用你的 |cRXP_FRIENDLY_Warhorse|r 跑过去并立即杀死 |cRXP_ENEMY_Boneguard Footmen|r
	>>杀死 |cRXP_ENEMY_Boneguard Lieutenants|r。获得 |T132360:0|tDefend (4) 的堆叠并维持它。使用 |T132358:0|tShield-Breaker (2) 移除他们的护盾，然后使用 |T132226:0|tCharge (3) 和 |T135375:0|tThrust (1)
	.complete 13851,1 -- Boneguard Footman slain (15)
	.complete 13851,3 -- Boneguard Lieutenant slain (3)
	.goto IcecrownGlacier,50.42,76.30,40,0
	.goto IcecrownGlacier,50.86,77.73,40,0
	.goto IcecrownGlacier,51.44,79.44,40,0
	.goto IcecrownGlacier,50.42,76.30
	.isOnQuest 13851
	.mob Boneguard Footman
	.mob Boneguard Lieutenant
step
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.goto IcecrownGlacier,51.77,74.97,50,0
	.goto IcecrownGlacier,53.30,73.72,50,0
	.goto IcecrownGlacier,51.75,70.97,50,0
	.goto IcecrownGlacier,49.68,73.21,50,0
	.goto IcecrownGlacier,47.24,73.07,50,0
	.goto IcecrownGlacier,48.80,77.11,50,0
	.goto IcecrownGlacier,50.45,74.34,50,0
	.goto IcecrownGlacier,52.36,73.07,50,0
	.goto IcecrownGlacier,52.36,73.07
	.complete 13851,2 -- Boneguard Scout slain (10)
	.isOnQuest 13851
	.mob Boneguard Scout

step -- A Worthy Weapon v2
	>>|cRXP_WARN_记得装备你的武器|r
	>>在冰冠冰川和晶歌森林边界的铁墙大坝收集|cRXP_PICK_冬风信子|r
	>>它们从岩石中长出来
	.goto IcecrownGlacier,69.25,76.02,15,0
	.goto IcecrownGlacier,70.05,75.19,15,0
	.goto IcecrownGlacier,71.07,73.20,15,0
	.goto IcecrownGlacier,72.07,73.02,15,0
	.goto IcecrownGlacier,73.42,73.59,15,0
	.goto IcecrownGlacier,69.25,76.02
	.collect 45000,4
	.isOnQuest 13742
step
	#completewith next
	.goto Dragonblight,93.18,26.00
	.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
	.isOnQuest 13742
step
	.goto Dragonblight,93.18,26.00
	.use 45000 >>在德拉克玛湖中心使用背包中的 |T134195:0|t|cFFFFFF99冬风信子|r
	>>等待德拉克玛少女角色扮演然后拾取|cRXP_PICK_德拉克玛之刃|r
	.cast 62629
	.timer 21,Maiden of Drak'Mar Roleplay
	.complete 13742,1 -- Blade of Drak'Mar (1)
	.isOnQuest 13742

step -- The Edge Of Winter v2
	#completewith next
	.goto CrystalsongForest,55.05,75.04
	.zone CrystalsongForest >>前往晶歌森林
	.isOnQuest 13743
step
	.goto CrystalsongForest,55.05,75.04
	>>|cRXP_WARN_记得装备你的武器|r
	>>杀死 |cRXP_ENEMY_Lord Everblaze|r。从他身上搜刮 |cRXP_LOOT_Everburning Ember|r
	.collect 45005,1 -- Everburning Ember
	.mob Lord Everblaze
	.isOnQuest 13743
step
	#completewith next
	.goto HowlingFjord,42.18,19.65
	.zone HowlingFjord >>前往嚎风峡湾北部的冬息湖
	.isOnQuest 13743
step
	.goto HowlingFjord,42.18,19.65
	.use 45005 >>使用背包中的 |T135488:0|t|c99ffff99Everburning Ember|r 释放冬息湖的少女
	.complete 13743,1 -- Winter's Edge (1)
	.target Maiden of Winter's Breath Lake
	.isOnQuest 13743

step -- A Blade Fit For A Champion v2
	#completewith next
	.goto Grizzly Hills,60.83,51.36
	.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
	.isOnQuest 13741
step
	.goto Grizzly Hills,60.83,51.36,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,61.89,48.56,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.89,48.56
	.use 44986 >>在尝试 /亲吻 Lake Frogs 之前，请先 |c99ffff99Warts-B-Gone 润唇膏|r 放在您的包里 |c99ffff99everytime|r
	>>瞄准湖蛙即可自动亲吻它们。如果不起作用，请输入 /kiss
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最终，其中一只湖蛙会变成人类。与它交谈可获得 |cRXP_PICK_Ashwood Brand|r
	>>|cRXP_WARN_记得装备你的武器|r
	.emote KISS,33211
	.emote KISS,33224
	.skipgossip
	.complete 13741,1 -- Ashwood Brand (1)
	.target Lake Frog
	.target Maiden of Ashwood Lake
	.isOnQuest 13741
step
	.goto IcecrownGlacier,76.46,19.41,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地 << Alliance
	.goto IcecrownGlacier,76.27,24.38,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地 << Horde
	.isOnQuest 13741,13743,13742,13744,13745,13851
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r, |cRXP_FRIENDLY_鲁洛·强击|r, |cRXP_FRIENDLY_克拉拉·沸酒|r
	.turnin 13741 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.64,19.49
	.turnin 13744 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.66,19.41
	.turnin 13745 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13851 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.64,19.57
	.target Lana Stouthammer
	.target Rollo Sureshot
	.target Clara Tumblebrew
	.isQuestComplete 13741 -- A Blade Fit For A Champion
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r, |cRXP_FRIENDLY_鲁洛·强击|r, |cRXP_FRIENDLY_克拉拉·沸酒|r
	.turnin 13743 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.64,19.49
	.turnin 13744 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.66,19.41
	.turnin 13745 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13851 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.64,19.57
	.target Lana Stouthammer
	.target Rollo Sureshot
	.target Clara Tumblebrew
	.isQuestComplete 13743 -- The Edge Of Winter
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r, |cRXP_FRIENDLY_鲁洛·强击|r, |cRXP_FRIENDLY_克拉拉·沸酒|r
	.turnin 13742 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.64,19.49
	.turnin 13744 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.66,19.41
	.turnin 13745 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13851 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.64,19.57
	.target Lana Stouthammer
	.target Rollo Sureshot
	.target Clara Tumblebrew
	.isQuestComplete 13742 -- A Worthy Weapon
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁洛·强击|r, |cRXP_FRIENDLY_克拉拉·沸酒|r
	.turnin -13744 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.66,19.41
	.turnin -13745 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13851 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.64,19.57
	.target Rollo Sureshot
	.target Clara Tumblebrew
step
	>>为了完成任务 |cFFffff00The Valiant's Charge|r 并通过 |T236690:0|t银色锦标赛 Grounds，你必须完成每日任务并获得 |T133441:0|t|c99CCFFFFValiant's Seal|r
	>>您需要 |T133441:0|t|c99CCFFFF25 勇士印章|r。完成 4 个日常任务后，您每天可获得 5 个
	>>|c99ffff99如果您仍然需要完成每日任务，请在第二天重新加载指南，直到您可以完成此任务|r。
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r
	.goto IcecrownGlacier,76.64,19.49
	.complete 13714,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r -- Valiant's Seal (25)
	.turnin 13714 >>交任务: |cRXP_FRIENDLY_勇士之战|r
	.accept	13713 >>接任务: |cRXP_WARN_勇士的挑战|r
	.target Lana Stouthammer
step -- The Valiant's Challenge
	#completewith next
	.vehicle >>在你的背包中装备|T135128:0|t|c99ffff99联盟长矛|r，然后骑上马厩里的铁炉堡公羊
	>>如果你丢失了 |T135128:0|t|c99ffff99Alliance Lance|r，你可以在展馆内再次领取
	.goto IcecrownGlacier,76.25,20.51
	.use 46069
	.target Stabled Ironforge Ram
	.isOnQuest 13713
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从丹尼|r
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>等待 |cRXP_ENEMY_Argent Champion|r 到达然后击败它
	.goto IcecrownGlacier,68.60,20.99
	.complete 13713,1 -- Argent Champion defeated (1)
	.skipgossip
	.timer 12,Argent Champion Arrival
	.mob Argent Champion
	.isOnQuest 13713
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉娜·硬锤|r
	.goto IcecrownGlacier,76.64,19.49
	.turnin	13713 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r
	.target Lana Stouthammer
step
	.goto IcecrownGlacier,76.33,19.48
	+|cRXP_WARN_你现在是|T255138:0|t铁炉堡的勇士！|r
	>>|cRXP_LOOT_您现在已经完成了铁炉堡冠军指南！|r
	>>|cRXP_LOOT_你现在可以选择成为|r |cRXP_WARN_Champion|r |cRXP_LOOT_of another|r |cRXP_WARN_Race|r|cRXP_LOOT_|r
	>>|cRXP_LOOT_加载 |cRXP_FRIENDLY_2.0|r 指南，了解您选择接下来要追求的|r |cRXP_WARN_Race|r |cRXP_LOOT_！|r
	>>|cRXP_LOOT_OR
	>>|cRXP_LOOT_你可以开始|r |cRXP_ENEMY_3.0|r |cRXP_LOOT_Champion 每日任务|r
	.isQuestTurnedIn 13713
]])

RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name E_2_AT_诺莫瑞根
#displayname |cRXP_FRIENDLY_2.0|r - Gnomeregan Champion
<< Alliance !Gnome

step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r
	.goto IcecrownGlacier,76.55,19.82
	.accept 13704 >>接任务: |cRXP_WARN_诺莫瑞根的勇士|r
	.turnin 13704 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的勇士|r
	.target Ambrose Boltspark
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r
	.accept 13715 >>接任务: |cRXP_WARN_勇士之战|r
	.daily 13746,13748,13747 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.55,19.82
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_提克·扳钳|r, |cRXP_FRIENDLY_弗林克·扳钳|r
	.daily 13749 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.60,19.79
	.daily 13750 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13852 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.52,19.89
	.target Ambrose Boltspark
	.target Tickin Gearspanner
	.target Flickin Gearspanner
	.isQuestAvailable 13715

step -- THE GRAND MELEE
	#completewith next
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上停在马厩里的诺莫瑞根机械陆行鸟
	>>如果你丢失了 |T135128:0|t|c99ffff99Alliance Lance|r，你可以在展馆内再次领取
	.goto IcecrownGlacier,76.17,20.49
	.use 46069
	.target Stabled Gnomeregan Mechanostrider
	.isOnQuest 13750
step -- THE GRAND MELEE
	>>前往联盟勇士之环
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Valiant|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠中的 |cRXP_ENEMY_Valiant|r
	>>一旦 |cRXP_ENEMY_Valiant|r 上没有 |T132360:0|tDefend 的堆叠，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Valiant|r 3 次
	.goto IcecrownGlacier,75.31,19.05,10,0
	.goto IcecrownGlacier,75.66,18.72,10,0
	.goto IcecrownGlacier,75.73,18.12,10,0
	.goto IcecrownGlacier,75.08,17.70,10,0
	.goto IcecrownGlacier,74.82,18.39,10,0
	.goto IcecrownGlacier,75.31,19.05,10,0
	.goto IcecrownGlacier,75.66,18.72,10,0
	.goto IcecrownGlacier,75.73,18.12,10,0
	.goto IcecrownGlacier,75.08,17.70,10,0
	.goto IcecrownGlacier,74.82,18.39,10,0
	.goto IcecrownGlacier,75.31,19.05
	.complete 13750,1 -- Mark of the Valiant (3)
	.isOnQuest 13750
	.skipgossip
	.mob Stormwind Valiant
	.mob Ironforge Valiant
	.mob Gnomeregan Valiant
	.mob Darnassus Valiant
	.mob Exodar Valiant
step -- A Valiant's Field Training
	>>从坐骑上跳下来。|cRXP_WARN_记得装备你的武器|r。不要毁掉你的|T135128:0|t|c99ffff99Lance|r。你会再次需要它
	>>击杀 |cRXP_ENEMY_Converted Heroes|r
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,46.91,51.72,60,0
	.goto IcecrownGlacier,46.83,54.38,60,0
	.goto IcecrownGlacier,44.82,55.38,60,0
	.goto IcecrownGlacier,42.55,55.28,60,0
	.goto IcecrownGlacier,40.45,53.53,60,0
	.goto IcecrownGlacier,41.50,50.23,60,0
	.goto IcecrownGlacier,44.14,49.89,60,0
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,42.55,55.28
	.complete 13749,1 -- Converted Hero slain (10)
	.isOnQuest 13749
	.mob Converted Hero

step -- At The Enemy's Gates
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Alliance Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r
	>>如果你需要另一个，路障旁边有一个|T135128:0|t|c99ffff99Lance Rack|r
	.goto IcecrownGlacier,48.87,71.78
	.use 46069
	.isOnQuest 13852
	.target Stabled Campaign Warhorse
step
	#completewith next
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.complete 13852,2 -- Boneguard Scout slain (10)
	.isOnQuest 13852
	.mob Boneguard Scout
step
	>>使用你的 |cRXP_FRIENDLY_Warhorse|r 跑过去并立即杀死 |cRXP_ENEMY_Boneguard Footmen|r
	>>杀死 |cRXP_ENEMY_Boneguard Lieutenants|r。获得 |T132360:0|tDefend (4) 的堆叠并维持它。使用 |T132358:0|tShield-Breaker (2) 移除他们的护盾，然后使用 |T132226:0|tCharge (3) 和 |T135375:0|tThrust (1)
	.complete 13852,1 -- Boneguard Footman slain (15)
	.complete 13852,3 -- Boneguard Lieutenant slain (3)
	.goto IcecrownGlacier,50.42,76.30,40,0
	.goto IcecrownGlacier,50.86,77.73,40,0
	.goto IcecrownGlacier,51.44,79.44,40,0
	.goto IcecrownGlacier,50.42,76.30
	.isOnQuest 13852
	.mob Boneguard Footman
	.mob Boneguard Lieutenant
step
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.goto IcecrownGlacier,51.77,74.97,50,0
	.goto IcecrownGlacier,53.30,73.72,50,0
	.goto IcecrownGlacier,51.75,70.97,50,0
	.goto IcecrownGlacier,49.68,73.21,50,0
	.goto IcecrownGlacier,47.24,73.07,50,0
	.goto IcecrownGlacier,48.80,77.11,50,0
	.goto IcecrownGlacier,50.45,74.34,50,0
	.goto IcecrownGlacier,52.36,73.07,50,0
	.goto IcecrownGlacier,52.36,73.07
	.complete 13852,2 -- Boneguard Scout slain (10)
	.isOnQuest 13852
	.mob Boneguard Scout


step -- A Worthy Weapon v2
	>>|cRXP_WARN_记得装备你的武器|r
	>>在冰冠冰川和晶歌森林边界的铁墙大坝收集|cRXP_PICK_冬风信子|r
	>>它们从岩石中长出来
	.goto IcecrownGlacier,69.25,76.02,15,0
	.goto IcecrownGlacier,70.05,75.19,15,0
	.goto IcecrownGlacier,71.07,73.20,15,0
	.goto IcecrownGlacier,72.07,73.02,15,0
	.goto IcecrownGlacier,73.42,73.59,15,0
	.goto IcecrownGlacier,69.25,76.02
	.collect 45000,4
	.isOnQuest 13747
step
	#completewith next
	.goto Dragonblight,93.18,26.00
	.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
	.isOnQuest 13747
step
	.goto Dragonblight,93.18,26.00
	.use 45000 >>在德拉克玛湖中心使用背包中的 |T134195:0|t|cFFFFFF99冬风信子|r
	>>等待德拉克玛少女角色扮演然后拾取|cRXP_PICK_德拉克玛之刃|r
	.cast 62629
	.timer 21,Maiden of Drak'Mar Roleplay
	.complete 13747,1 -- Blade of Drak'Mar (1)
	.isOnQuest 13747

step -- The Edge Of Winter v2
	#completewith next
	.goto CrystalsongForest,55.05,75.04
	.zone CrystalsongForest >>前往晶歌森林
	.isOnQuest 13748
step
	.goto CrystalsongForest,55.05,75.04
	>>|cRXP_WARN_记得装备你的武器|r
	>>杀死 |cRXP_ENEMY_Lord Everblaze|r。从他身上搜刮 |cRXP_LOOT_Everburning Ember|r
	.collect 45005,1 -- Everburning Ember
	.mob Lord Everblaze
	.isOnQuest 13748
step
	#completewith next
	.goto HowlingFjord,42.18,19.65
	.zone HowlingFjord >>前往嚎风峡湾北部的冬息湖
	.isOnQuest 13748
step
	.goto HowlingFjord,42.18,19.65
	.use 45005 >>使用背包中的 |T135488:0|t|c99ffff99Everburning Ember|r 释放冬息湖的少女
	.complete 13748,1 -- Winter's Edge (1)
	.target Maiden of Winter's Breath Lake
	.isOnQuest 13748

step -- A Blade Fit For A Champion v2
	#completewith next
	.goto Grizzly Hills,60.83,51.36
	.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
	.isOnQuest 13746
step
	.goto Grizzly Hills,60.83,51.36,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,61.89,48.56,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.89,48.56
	.use 44986 >>在尝试 /亲吻 Lake Frogs 之前，请先 |c99ffff99Warts-B-Gone 润唇膏|r 放在您的包里 |c99ffff99everytime|r
	>>瞄准湖蛙即可自动亲吻它们。如果不起作用，请输入 /kiss
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最终，其中一只湖蛙会变成人类。与它交谈可获得 |cRXP_PICK_Ashwood Brand|r
	>>|cRXP_WARN_记得装备你的武器|r
	.emote KISS,33211
	.emote KISS,33224
	.skipgossip
	.complete 13746,1 -- Ashwood Brand (1)
	.target Lake Frog
	.target Maiden of Ashwood Lake
	.isOnQuest 13746
step
	.goto IcecrownGlacier,76.46,19.41,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地
	.isOnQuest 13746,13748,13747,13749,13750,13852
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r, |cRXP_FRIENDLY_提克·扳钳|r, |cRXP_FRIENDLY_弗林克·扳钳|r
	.turnin 13746 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.55,19.82
	.turnin 13749 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.60,19.79
	.turnin 13750 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13852 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,19.89
	.target Ambrose Boltspark
	.target Tickin Gearspanner
	.target Flickin Gearspanner
	.isQuestComplete 13746 -- A Blade Fit For A Champion
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r, |cRXP_FRIENDLY_提克·扳钳|r, |cRXP_FRIENDLY_弗林克·扳钳|r
	.turnin 13748 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.55,19.82
	.turnin 13749 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.60,19.79
	.turnin 13750 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13852 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,19.89
	.target Ambrose Boltspark
	.target Tickin Gearspanner
	.target Flickin Gearspanner
	.isQuestComplete 13748 -- The Edge Of Winter
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r, |cRXP_FRIENDLY_提克·扳钳|r, |cRXP_FRIENDLY_弗林克·扳钳|r
	.turnin 13747 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.55,19.82
	.turnin 13749 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.60,19.79
	.turnin 13750 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13852 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,19.89
	.target Ambrose Boltspark
	.target Tickin Gearspanner
	.target Flickin Gearspanner
	.isQuestComplete 13747 -- A Worthy Weapon
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_提克·扳钳|r, |cRXP_FRIENDLY_弗林克·扳钳|r
	.turnin -13749 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.60,19.79
	.turnin -13750 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13852 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,19.89
	.target Tickin Gearspanner
	.target Flickin Gearspanner
step -- Checking if they have 25 Valiant's Seals after a set of turn ins.
	>>为了完成任务 |cFFffff00The Valiant's Charge|r 并通过 |T236690:0|t银色锦标赛 Grounds，你必须完成每日任务并获得 |T133441:0|t|c99CCFFFFValiant's Seal|r
	>>您需要 |T133441:0|t|c99CCFFFF25 勇士印章|r。完成 4 个日常任务后，您每天可获得 5 个
	>>|c99ffff99如果您仍然需要完成每日任务，请在第二天重新加载指南，直到您可以完成此任务|r。
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r
	.goto IcecrownGlacier,76.55,19.82
	.complete 13715,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r -- Valiant's Seal (25)
	.turnin 13715 >>交任务: |cRXP_FRIENDLY_勇士之战|r
	.accept 13723 >>接任务: |cRXP_WARN_勇士的挑战|r
	.target Ambrose Boltspark
step -- The Valiant's Challenge
	#completewith next
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上停在马厩里的诺莫瑞根机械陆行鸟
	>>如果你丢失了 |T135128:0|t|c99ffff99Alliance Lance|r，你可以在展馆内再次领取
	.goto IcecrownGlacier,76.17,20.49
	.use 46069
	.target Stabled Gnomeregan Mechanostrider
	.isOnQuest 13723
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从丹尼|r
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>等待 |cRXP_ENEMY_Argent Champion|r 到达然后击败它
	.goto IcecrownGlacier,68.60,20.99
	.complete 13723,1 -- Argent Champion defeated (1)
	.skipgossip
	.timer 12,Argent Champion Arrival
	.mob Argent Champion
	.isOnQuest 13723
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安布罗斯·雷钉|r
	.goto IcecrownGlacier,76.55,19.82
	.turnin 13723 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r
	.target Ambrose Boltspark
step
	.goto IcecrownGlacier,76.33,19.48
	+|cRXP_WARN_你现在是|T255139:0|t诺莫瑞根的勇士！|r
	>>|cRXP_LOOT_您现在已经完成诺莫瑞根冠军指南！|r
	>>|cRXP_LOOT_你现在可以选择成为|r |cRXP_WARN_Champion|r |cRXP_LOOT_of another|r |cRXP_WARN_Race|r|cRXP_LOOT_|r
	>>|cRXP_LOOT_加载 |cRXP_FRIENDLY_2.0|r 指南，了解您选择接下来要追求的|r |cRXP_WARN_Race|r |cRXP_LOOT_！|r
	>>|cRXP_LOOT_OR
	>>|cRXP_LOOT_你可以开始|r |cRXP_ENEMY_3.0|r |cRXP_LOOT_Champion 每日任务|r
	.isQuestTurnedIn 13723
]])

RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name F_2_AT_达纳苏斯
#displayname |cRXP_FRIENDLY_2.0|r - Darnassus Champion
<< Alliance !NightElf

step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r
	.goto IcecrownGlacier,76.34,19.03
	.accept 13706 >>接任务: |cRXP_WARN_达纳苏斯的勇士|r
	.turnin 13706 >>交任务: |cRXP_FRIENDLY_达纳苏斯的勇士|r
	.target Jaelyne Evensong
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r
	.accept 13717 >>接任务: |cRXP_WARN_勇士之战|r
	.daily 13757,13759,13758 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.34,19.03
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊蕾丝蒂亚·刃歌|r, |cRXP_FRIENDLY_艾莱·觅星|r
	.daily 13760 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.29,18.99
	.daily 13761 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13855 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.40,19.00
	.target Jaelyne Evensong
	.target Illestria Bladesinger
	.target Airae Starseeker
	.isQuestAvailable 13717


step -- THE GRAND MELEE
	#completewith next
	.vehicle >>装备背包中的|T135128:0|t|c99ffff99联盟长枪|r，然后骑上马厩里的达纳苏斯夜刃豹
	.goto IcecrownGlacier,76.00,20.42
	.use 46069
	.target Stabled Darnassian 夜刃豹
	.isOnQuest 13761
step -- THE GRAND MELEE
	>>前往联盟勇士之环
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Valiant|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠中的 |cRXP_ENEMY_Valiant|r
	>>一旦 |cRXP_ENEMY_Valiant|r 上没有 |T132360:0|tDefend 的堆叠，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Valiant|r 3 次
	.goto IcecrownGlacier,75.31,19.05,10,0
	.goto IcecrownGlacier,75.66,18.72,10,0
	.goto IcecrownGlacier,75.73,18.12,10,0
	.goto IcecrownGlacier,75.08,17.70,10,0
	.goto IcecrownGlacier,74.82,18.39,10,0
	.goto IcecrownGlacier,75.31,19.05,10,0
	.goto IcecrownGlacier,75.66,18.72,10,0
	.goto IcecrownGlacier,75.73,18.12,10,0
	.goto IcecrownGlacier,75.08,17.70,10,0
	.goto IcecrownGlacier,74.82,18.39,10,0
	.goto IcecrownGlacier,75.31,19.05
	.complete 13761,1 -- Mark of the Valiant (3)
	.isOnQuest 13761
	.skipgossip
	.mob Stormwind Valiant
	.mob Ironforge Valiant
	.mob Gnomeregan Valiant
	.mob Darnassus Valiant
	.mob Exodar Valiant
step -- A Valiant's Field Training
	>>从坐骑上跳下来。|cRXP_WARN_记得装备你的武器|r。不要毁掉你的|T135128:0|t|c99ffff99Lance|r。你会再次需要它
	>>击杀 |cRXP_ENEMY_Converted Heroes|r
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,46.91,51.72,60,0
	.goto IcecrownGlacier,46.83,54.38,60,0
	.goto IcecrownGlacier,44.82,55.38,60,0
	.goto IcecrownGlacier,42.55,55.28,60,0
	.goto IcecrownGlacier,40.45,53.53,60,0
	.goto IcecrownGlacier,41.50,50.23,60,0
	.goto IcecrownGlacier,44.14,49.89,60,0
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,42.55,55.28
	.complete 13760,1 -- Converted Hero slain (10)
	.isOnQuest 13760
	.mob Converted Hero

step -- At The Enemy's Gates
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Alliance Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r
	>>如果你需要另一个，路障旁边有一个|T135128:0|t|c99ffff99Lance Rack|r
	.goto IcecrownGlacier,48.87,71.78
	.use 46069
	.isOnQuest 13855
	.target Stabled Campaign Warhorse
step
	#completewith next
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.complete 13855,2 -- Boneguard Scout slain (10)
	.isOnQuest 13855
	.mob Boneguard Scout
step
	>>使用你的 |cRXP_FRIENDLY_Warhorse|r 跑过去并立即杀死 |cRXP_ENEMY_Boneguard Footmen|r
	>>杀死 |cRXP_ENEMY_Boneguard Lieutenants|r。获得 |T132360:0|tDefend (4) 的堆叠并维持它。使用 |T132358:0|tShield-Breaker (2) 移除他们的护盾，然后使用 |T132226:0|tCharge (3) 和 |T135375:0|tThrust (1)
	.complete 13855,1 -- Boneguard Footman slain (15)
	.complete 13855,3 -- Boneguard Lieutenant slain (3)
	.goto IcecrownGlacier,50.42,76.30,40,0
	.goto IcecrownGlacier,50.86,77.73,40,0
	.goto IcecrownGlacier,51.44,79.44,40,0
	.goto IcecrownGlacier,50.42,76.30
	.isOnQuest 13855
	.mob Boneguard Footman
	.mob Boneguard Lieutenant
step
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.goto IcecrownGlacier,51.77,74.97,50,0
	.goto IcecrownGlacier,53.30,73.72,50,0
	.goto IcecrownGlacier,51.75,70.97,50,0
	.goto IcecrownGlacier,49.68,73.21,50,0
	.goto IcecrownGlacier,47.24,73.07,50,0
	.goto IcecrownGlacier,48.80,77.11,50,0
	.goto IcecrownGlacier,50.45,74.34,50,0
	.goto IcecrownGlacier,52.36,73.07,50,0
	.goto IcecrownGlacier,52.36,73.07
	.complete 13855,2 -- Boneguard Scout slain (10)
	.isOnQuest 13855
	.mob Boneguard Scout

step -- A Worthy Weapon v2
	>>|cRXP_WARN_记得装备你的武器|r
	>>在冰冠冰川和晶歌森林边界的铁墙大坝收集|cRXP_PICK_冬风信子|r
	>>它们从岩石中长出来
	.goto IcecrownGlacier,69.25,76.02,15,0
	.goto IcecrownGlacier,70.05,75.19,15,0
	.goto IcecrownGlacier,71.07,73.20,15,0
	.goto IcecrownGlacier,72.07,73.02,15,0
	.goto IcecrownGlacier,73.42,73.59,15,0
	.goto IcecrownGlacier,69.25,76.02
	.collect 45000,4
	.isOnQuest 13758
step
	#completewith next
	.goto Dragonblight,93.18,26.00
	.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
	.isOnQuest 13758
step
	.goto Dragonblight,93.18,26.00
	.use 45000 >>在德拉克玛湖中心使用背包中的 |T134195:0|t|cFFFFFF99冬风信子|r
	>>等待德拉克玛少女角色扮演然后拾取|cRXP_PICK_德拉克玛之刃|r
	.cast 62629
	.timer 21,Maiden of Drak'Mar Roleplay
	.complete 13758,1 -- Blade of Drak'Mar (1)
	.isOnQuest 13758

step -- The Edge Of Winter v2
	#completewith next
	.goto CrystalsongForest,55.05,75.04
	.zone CrystalsongForest >>前往晶歌森林
	.isOnQuest 13759
step
	.goto CrystalsongForest,55.05,75.04
	>>|cRXP_WARN_记得装备你的武器|r
	>>杀死 |cRXP_ENEMY_Lord Everblaze|r。从他身上搜刮 |cRXP_LOOT_Everburning Ember|r
	.collect 45005,1 -- Everburning Ember
	.mob Lord Everblaze
	.isOnQuest 13759
step
	#completewith next
	.goto HowlingFjord,42.18,19.65
	.zone HowlingFjord >>前往嚎风峡湾北部的冬息湖
	.isOnQuest 13759
step
	.goto HowlingFjord,42.18,19.65
	.use 45005 >>使用背包中的 |T135488:0|t|c99ffff99Everburning Ember|r 释放冬息湖的少女
	.complete 13759,1 -- Winter's Edge (1)
	.target Maiden of Winter's Breath Lake
	.isOnQuest 13759

step -- A Blade Fit For A Champion v2
	#completewith next
	.goto Grizzly Hills,60.83,51.36
	.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
	.isOnQuest 13757
step
	.goto Grizzly Hills,60.83,51.36,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,61.89,48.56,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.89,48.56
	.use 44986 >>在尝试 /亲吻 Lake Frogs 之前，请先 |c99ffff99Warts-B-Gone 润唇膏|r 放在您的包里 |c99ffff99everytime|r
	>>瞄准湖蛙即可自动亲吻它们。如果不起作用，请输入 /kiss
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最终，其中一只湖蛙会变成人类。与它交谈可获得 |cRXP_PICK_Ashwood Brand|r
	>>|cRXP_WARN_记得装备你的武器|r
	.emote KISS,33211
	.emote KISS,33224
	.skipgossip
	.complete 13757,1 -- Ashwood Brand (1)
	.target Lake Frog
	.target Maiden of Ashwood Lake
	.isOnQuest 13757
step
	.goto IcecrownGlacier,76.46,19.41,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地
	.isOnQuest 13757,13759,13758,13760,13761,13855
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r, |cRXP_FRIENDLY_伊蕾丝蒂亚·刃歌|r, |cRXP_FRIENDLY_艾莱·觅星|r
	.turnin 13757 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.34,19.03
	.turnin 13760 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.29,18.99
	.turnin 13761 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13855 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,19.00
	.target Jaelyne Evensong
	.target Illestria Bladesinger
	.target Airae Starseeker
	.isQuestComplete 13757 -- A Blade Fit For A Champion
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r, |cRXP_FRIENDLY_伊蕾丝蒂亚·刃歌|r, |cRXP_FRIENDLY_艾莱·觅星|r
	.turnin 13759 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.34,19.03
	.turnin 13760 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.29,18.99
	.turnin 13761 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13855 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,19.00
	.target Jaelyne Evensong
	.target Illestria Bladesinger
	.target Airae Starseeker
	.isQuestComplete 13759 -- The Edge Of Winter
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r, |cRXP_FRIENDLY_伊蕾丝蒂亚·刃歌|r, |cRXP_FRIENDLY_艾莱·觅星|r
	.turnin 13758 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.34,19.03
	.turnin 13760 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.29,18.99
	.turnin 13761 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13855 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,19.00
	.target Jaelyne Evensong
	.target Illestria Bladesinger
	.target Airae Starseeker
	.isQuestComplete 13758 -- A Worthy Weapon
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊蕾丝蒂亚·刃歌|r, |cRXP_FRIENDLY_艾莱·觅星|r
	.turnin -13760 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.29,18.99
	.turnin -13761 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13855 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,19.00
	.target Illestria Bladesinger
	.target Airae Starseeker
step
	>>为了完成任务 |cFFffff00The Valiant's Charge|r 并通过 |T236690:0|t银色锦标赛 Grounds，你必须完成每日任务并获得 |T133441:0|t|c99CCFFFFValiant's Seal|r
	>>您需要 |T133441:0|t|c99CCFFFF25 勇士印章|r。完成 4 个日常任务后，您每天可获得 5 个
	>>|c99ffff99如果您仍然需要完成每日任务，请在第二天重新加载指南，直到您可以完成此任务|r。
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r
	.goto IcecrownGlacier,76.34,19.03
	.complete 13717,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r -- Valiant's Seal (25)
	.turnin 13717 >>交任务: |cRXP_FRIENDLY_勇士之战|r
	.accept 13725 >>接任务: |cRXP_WARN_勇士的挑战|r
	.target Jaelyne Evensong
step -- The Valiant's Challenge
	#completewith next
	.vehicle >>装备背包中的|T135128:0|t|c99ffff99联盟长枪|r，然后骑上马厩里的达纳苏斯夜刃豹
	>>如果你丢失了 |T135128:0|t|c99ffff99Alliance Lance|r，你可以在展馆内再次领取
	.goto IcecrownGlacier,76.00,20.42
	.use 46069
	.target Stabled Darnassian 夜刃豹
	.isOnQuest 13725
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从丹尼|r
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>等待 |cRXP_ENEMY_Argent Champion|r 到达然后击败它
	.goto IcecrownGlacier,68.60,20.99
	.complete 13725,1 -- Argent Champion defeated (1)
	.skipgossip
	.timer 12,Argent Champion Arrival
	.mob Argent Champion
	.isOnQuest 13725
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娅琳·永歌|r
	.goto IcecrownGlacier,76.34,19.03
	.turnin 13725 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r
	.target Jaelyne Evensong
step
	.goto IcecrownGlacier,76.33,19.48
	+|cRXP_WARN_你现在是|T255141:0|t达纳苏斯的勇士！|r
	>>|cRXP_LOOT_您现在已经完成达纳苏斯勇士指南！|r
	>>|cRXP_LOOT_你现在可以选择成为|r |cRXP_WARN_Champion|r |cRXP_LOOT_of another|r |cRXP_WARN_Race|r|cRXP_LOOT_|r
	>>|cRXP_LOOT_加载 |cRXP_FRIENDLY_2.0|r 指南，了解您选择接下来要追求的|r |cRXP_WARN_Race|r |cRXP_LOOT_！|r
	>>|cRXP_LOOT_OR
	>>|cRXP_LOOT_你可以开始|r |cRXP_ENEMY_3.0|r |cRXP_LOOT_Champion 每日任务|r
	.isQuestTurnedIn 13725
]])

RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name B_2_AT_奥格瑞玛
#displayname |cRXP_FRIENDLY_2.0|r - Orgrimmar Champion
<< Horde !Orc


step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r
	.goto IcecrownGlacier,76.46,24.60
	.accept 13707 >>接任务: |cRXP_WARN_奥格瑞玛的勇士|r
	.turnin 13707 >>交任务: |cRXP_FRIENDLY_奥格瑞玛的勇士|r
	.target Mokra the Skullcrusher
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r
	.accept 13697 >>接任务: |cRXP_WARN_勇士之战|r
	.daily 13762,13764,13763 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.46,24.60
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃基诺斯|r, |cRXP_FRIENDLY_茉拉·狼女|r
	.daily 13765 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.50,24.48
	.daily 13767 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13856 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.40,24.59
	.target Mokra the Skullcrusher
	.target Akinos
	.target Morah Worgsister
	.isQuestAvailable 13697
step
	#completewith next
	.vehicle >>在你的背包中装备|T135128:0|t|c99ffff99部落枪骑兵|然后骑上马厩里的奥格瑞玛狼
	>>如果你丢失了 |T135128:0|t|c99ffff99Horde Lance|r，你可以在亭子里再拿一个
	.goto IcecrownGlacier,75.55,24.00
	.use 46070
	.target Stabled Orgrimmar Wolf
	.isOnQuest 13767
step
	>>前往部落勇士之环
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Valiant|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠中的 |cRXP_ENEMY_Valiant|r
	>>一旦 |cRXP_ENEMY_Valiant|r 上没有 |T132360:0|tDefend 的堆叠，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Valiant|r 3 次
	.goto IcecrownGlacier,75.48,25.39,10,0
	.goto IcecrownGlacier,75.78,26.03,10,0
	.goto IcecrownGlacier,75.53,26.69,10,0
	.goto IcecrownGlacier,74.99,26.43,10,0
	.goto IcecrownGlacier,75.00,25.65,10,0
	.goto IcecrownGlacier,75.48,25.39,10,0
	.goto IcecrownGlacier,75.78,26.03,10,0
	.goto IcecrownGlacier,75.53,26.69,10,0
	.goto IcecrownGlacier,74.99,26.43,10,0
	.goto IcecrownGlacier,75.00,25.65,10,0
	.goto IcecrownGlacier,75.48,25.39
	.complete 13767,1 -- Mark of the Valiant (3)
	.isOnQuest 13767
	.skipgossip
	.mob Thunder Bluff Valiant
	.mob Silvermoon Valiant
	.mob Sen'jin Valiant
	.mob Orgrimmar Valiant
	.mob Undercity Valiant
step -- A Valiant's Field Training
	>>从坐骑上跳下来。|cRXP_WARN_记得装备你的武器|r。不要毁掉你的|T135128:0|t|c99ffff99Lance|r。你会再次需要它
	>>击杀 |cRXP_ENEMY_Converted Heroes|r
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,46.91,51.72,60,0
	.goto IcecrownGlacier,46.83,54.38,60,0
	.goto IcecrownGlacier,44.82,55.38,60,0
	.goto IcecrownGlacier,42.55,55.28,60,0
	.goto IcecrownGlacier,40.45,53.53,60,0
	.goto IcecrownGlacier,41.50,50.23,60,0
	.goto IcecrownGlacier,44.14,49.89,60,0
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,42.55,55.28
	.complete 13765,1 -- Converted Hero slain (10)
	.isOnQuest 13765
	.mob Converted Hero

step -- At The Enemy's Gates
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r
	>>如果你需要另一个，路障旁边有一个|T135128:0|t|c99ffff99Lance Rack|r
	.goto IcecrownGlacier,48.87,71.78
	.use 46070
	.isOnQuest 13856
	.target Stabled Campaign Warhorse
step
	#completewith next
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.complete 13856,2 -- Boneguard Scout slain (10)
	.isOnQuest 13856
	.mob Boneguard Scout
step
	>>使用你的 |cRXP_FRIENDLY_Warhorse|r 跑过去并立即杀死 |cRXP_ENEMY_Boneguard Footmen|r
	>>杀死 |cRXP_ENEMY_Boneguard Lieutenants|r。获得 |T132360:0|tDefend (4) 的堆叠并维持它。使用 |T132358:0|tShield-Breaker (2) 移除他们的护盾，然后使用 |T132226:0|tCharge (3) 和 |T135375:0|tThrust (1)
	.complete 13856,1 -- Boneguard Footman slain (15)
	.complete 13856,3 -- Boneguard Lieutenant slain (3)
	.goto IcecrownGlacier,50.42,76.30,40,0
	.goto IcecrownGlacier,50.86,77.73,40,0
	.goto IcecrownGlacier,51.44,79.44,40,0
	.goto IcecrownGlacier,50.42,76.30
	.isOnQuest 13856
	.mob Boneguard Footman
	.mob Boneguard Lieutenant
step
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.goto IcecrownGlacier,51.77,74.97,50,0
	.goto IcecrownGlacier,53.30,73.72,50,0
	.goto IcecrownGlacier,51.75,70.97,50,0
	.goto IcecrownGlacier,49.68,73.21,50,0
	.goto IcecrownGlacier,47.24,73.07,50,0
	.goto IcecrownGlacier,48.80,77.11,50,0
	.goto IcecrownGlacier,50.45,74.34,50,0
	.goto IcecrownGlacier,52.36,73.07,50,0
	.goto IcecrownGlacier,52.36,73.07
	.complete 13856,2 -- Boneguard Scout slain (10)
	.isOnQuest 13856
	.mob Boneguard Scout

step -- A Worthy Weapon v2
	>>|cRXP_WARN_记得装备你的武器|r
	>>在冰冠冰川和晶歌森林边界的铁墙大坝收集|cRXP_PICK_冬风信子|r
	>>它们从岩石中长出来
	.goto IcecrownGlacier,69.25,76.02,15,0
	.goto IcecrownGlacier,70.05,75.19,15,0
	.goto IcecrownGlacier,71.07,73.20,15,0
	.goto IcecrownGlacier,72.07,73.02,15,0
	.goto IcecrownGlacier,73.42,73.59,15,0
	.goto IcecrownGlacier,69.25,76.02
	.collect 45000,4
	.isOnQuest 13763
step
	#completewith next
	.goto Dragonblight,93.18,26.00
	.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
	.isOnQuest 13763
step
	.goto Dragonblight,93.18,26.00
	.use 45000 >>在德拉克玛湖中心使用背包中的 |T134195:0|t|cFFFFFF99冬风信子|r
	>>等待德拉克玛少女角色扮演然后拾取|cRXP_PICK_德拉克玛之刃|r
	.cast 62629
	.timer 21,Maiden of Drak'Mar Roleplay
	.complete 13763,1 -- Blade of Drak'Mar (1)
	.isOnQuest 13763

step -- The Edge Of Winter v2
	#completewith next
	.goto CrystalsongForest,55.05,75.04
	.zone CrystalsongForest >>前往晶歌森林
	.isOnQuest 13764
step
	.goto CrystalsongForest,55.05,75.04
	>>|cRXP_WARN_记得装备你的武器|r
	>>杀死 |cRXP_ENEMY_Lord Everblaze|r。从他身上搜刮 |cRXP_LOOT_Everburning Ember|r
	.collect 45005,1 -- Everburning Ember
	.mob Lord Everblaze
	.isOnQuest 13764
step
	#completewith next
	.goto HowlingFjord,42.18,19.65
	.zone HowlingFjord >>前往嚎风峡湾北部的冬息湖
	.isOnQuest 13764
step
	.goto HowlingFjord,42.18,19.65
	.use 45005 >>使用背包中的 |T135488:0|t|c99ffff99Everburning Ember|r 释放冬息湖的少女
	.complete 13764,1 -- Winter's Edge (1)
	.target Maiden of Winter's Breath Lake
	.isOnQuest 13764

step -- A Blade Fit For A Champion v2
	#completewith next
	.goto Grizzly Hills,60.83,51.36
	.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
	.isOnQuest 13762
step
	.goto Grizzly Hills,60.83,51.36,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,61.89,48.56,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.89,48.56
	.use 44986 >>在尝试 /亲吻 Lake Frogs 之前，请先 |c99ffff99Warts-B-Gone 润唇膏|r 放在您的包里 |c99ffff99everytime|r
	>>瞄准湖蛙即可自动亲吻它们。如果不起作用，请输入 /kiss
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最终，其中一只湖蛙会变成人类。与它交谈可获得 |cRXP_PICK_Ashwood Brand|r
	>>|cRXP_WARN_记得装备你的武器|r
	.emote KISS,33211
	.emote KISS,33224
	.skipgossip
	.complete 13762,1 -- Ashwood Brand (1)
	.target Lake Frog
	.target Maiden of Ashwood Lake
	.isOnQuest 13762
step
	.goto IcecrownGlacier,76.27,24.38,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地
	.isOnQuest 13762,13764,13763,13765,13767,13856
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r, |cRXP_FRIENDLY_埃基诺斯|r, |cRXP_FRIENDLY_茉拉·狼女|r
	.turnin 13762 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.46,24.60
	.turnin 13765 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.50,24.48
	.turnin 13767 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13856 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,24.59
	.target Mokra the Skullcrusher
	.target Akinos
	.target Morah Worgsister
	.isQuestComplete 13762 -- A Blade Fit For A Champion
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r, |cRXP_FRIENDLY_埃基诺斯|r, |cRXP_FRIENDLY_茉拉·狼女|r
	.turnin 13764 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.46,24.60
	.turnin 13765 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.50,24.48
	.turnin 13767 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13856 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,24.59
	.target Mokra the Skullcrusher
	.target Akinos
	.target Morah Worgsister
	.isQuestComplete 13764 -- The Edge Of Winter
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r, |cRXP_FRIENDLY_埃基诺斯|r, |cRXP_FRIENDLY_茉拉·狼女|r
	.turnin 13763 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.46,24.60
	.turnin 13765 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.50,24.48
	.turnin 13767 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13856 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,24.59
	.target Mokra the Skullcrusher
	.target Akinos
	.target Morah Worgsister
	.isQuestComplete 13763 -- A Worthy Weapon
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃基诺斯|r, |cRXP_FRIENDLY_茉拉·狼女|r
	.turnin -13765 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.50,24.48
	.turnin -13767 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13856 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.40,24.59
	.target Akinos
	.target Morah Worgsister
step
	>>为了完成任务 |cFFffff00The Valiant's Charge|r 并通过 |T236690:0|t银色锦标赛 Grounds，你必须完成每日任务并获得 |T133441:0|t|c99CCFFFFValiant's Seal|r
	>>您需要 |T133441:0|t|c99CCFFFF25 勇士印章|r。完成 4 个日常任务后，您每天可获得 5 个
	>>|c99ffff99如果您仍然需要完成每日任务，请在第二天重新加载指南，直到您可以完成此任务|r。
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r
	.goto IcecrownGlacier,76.46,24.60
	.complete 13697,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r -- Valiant's Seal (25)
	.turnin 13697 >>交任务: |cRXP_FRIENDLY_勇士之战|r
	.accept 13726 >>接任务: |cRXP_WARN_勇士的挑战|r
	.target Mokra the Skullcrusher
step -- The Valiant's Challenge
	#completewith next
	.vehicle >>在你的背包中装备|T135128:0|t|c99ffff99部落枪骑兵|然后骑上马厩里的奥格瑞玛狼
	.goto IcecrownGlacier,75.55,24.00
	.use 46070
	.target Stabled Orgrimmar Wolf
	.isOnQuest 13726
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从丹尼|r
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>等待 |cRXP_ENEMY_Argent Champion|r 到达然后击败它
	.goto IcecrownGlacier,68.60,20.99
	.complete 13726,1 -- Argent Champion defeated (1)
	.skipgossip
	.timer 12,Argent Champion Arrival
	.mob Argent Champion
	.isOnQuest 13726
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r
	.goto IcecrownGlacier,76.46,24.60
	.turnin 13726 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r
	.target Mokra the Skullcrusher
step
	.goto IcecrownGlacier,76.17,24.21
	+|cRXP_WARN_你现在是|T255142:0|t奥格瑞玛的勇士！|r
	>>|cRXP_LOOT_您现在已经完成了奥格瑞玛勇士指南！|r
	>>|cRXP_LOOT_你现在可以选择成为|r |cRXP_WARN_Champion|r |cRXP_LOOT_of another|r |cRXP_WARN_Race|r|cRXP_LOOT_|r
	>>|cRXP_LOOT_加载 |cRXP_FRIENDLY_2.0|r 指南，了解您选择接下来要追求的|r |cRXP_WARN_Race|r |cRXP_LOOT_！|r
	>>|cRXP_LOOT_OR
	>>|cRXP_LOOT_你可以开始|r |cRXP_ENEMY_3.0|r |cRXP_LOOT_Champion 每日任务|r
	.isQuestTurnedIn 13726
]])

RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name C_2_AT_森金
#displayname |cRXP_FRIENDLY_2.0|r - Sen'jin Champion
<< Horde !Troll

step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r
	.goto IcecrownGlacier,75.95,24.53
	.accept 13708 >>接任务: |cRXP_WARN_森金的勇士|r
	.turnin 13708 >>交任务: |cRXP_FRIENDLY_森金的勇士|r
	.target Zul'tore
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r
	.accept 13719 >>接任务: |cRXP_WARN_勇士之战|r
	.daily 13768,13770,13769 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,75.95,24.53
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗影猎手梅兹克雷|r, |cRXP_FRIENDLY_加尔祖|r
	.daily 13771 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.04,24.59
	.daily 13772 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13857 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,75.93,24.41
	.target Zul'tore
	.target Shadow Hunter Mezil-kree
	.target Gahju
	.isQuestAvailable 13719

step
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上马厩里的暗矛迅猛龙
	>>如果你丢失了 |T135128:0|t|c99ffff99Horde Lance|r，你可以在亭子里再拿一个
	.goto IcecrownGlacier,75.58,23.76
	.use 46070
	.target Stabled Darkspear Raptor
	.isOnQuest 13772
step
	>>前往部落勇士之环
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Valiant|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠中的 |cRXP_ENEMY_Valiant|r
	>>一旦 |cRXP_ENEMY_Valiant|r 上没有 |T132360:0|tDefend 的堆叠，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Valiant|r 3 次
	.goto IcecrownGlacier,75.48,25.39,10,0
	.goto IcecrownGlacier,75.78,26.03,10,0
	.goto IcecrownGlacier,75.53,26.69,10,0
	.goto IcecrownGlacier,74.99,26.43,10,0
	.goto IcecrownGlacier,75.00,25.65,10,0
	.goto IcecrownGlacier,75.48,25.39,10,0
	.goto IcecrownGlacier,75.78,26.03,10,0
	.goto IcecrownGlacier,75.53,26.69,10,0
	.goto IcecrownGlacier,74.99,26.43,10,0
	.goto IcecrownGlacier,75.00,25.65,10,0
	.goto IcecrownGlacier,75.48,25.39
	.complete 13772,1 -- Mark of the Valiant (3)
	.isOnQuest 13772
	.skipgossip
	.mob Thunder Bluff Valiant
	.mob Silvermoon Valiant
	.mob Sen'jin Valiant
	.mob Orgrimmar Valiant
	.mob Undercity Valiant
step -- A Valiant's Field Training
	>>从坐骑上跳下来。|cRXP_WARN_记得装备你的武器|r。不要毁掉你的|T135128:0|t|c99ffff99Lance|r。你会再次需要它
	>>击杀 |cRXP_ENEMY_Converted Heroes|r
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,46.91,51.72,60,0
	.goto IcecrownGlacier,46.83,54.38,60,0
	.goto IcecrownGlacier,44.82,55.38,60,0
	.goto IcecrownGlacier,42.55,55.28,60,0
	.goto IcecrownGlacier,40.45,53.53,60,0
	.goto IcecrownGlacier,41.50,50.23,60,0
	.goto IcecrownGlacier,44.14,49.89,60,0
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,42.55,55.28
	.complete 13771,1 -- Converted Hero slain (10)
	.isOnQuest 13771
	.mob Converted Hero

step
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r
	>>如果你需要另一个，路障旁边有一个|T135128:0|t|c99ffff99Lance Rack|r
	.goto IcecrownGlacier,48.87,71.78
	.use 46070
	.isOnQuest 13857
	.target Stabled Campaign Warhorse
step
	#completewith next
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.complete 13857,2 -- Boneguard Scout slain (10)
	.isOnQuest 13857
	.mob Boneguard Scout
step
	>>使用你的 |cRXP_FRIENDLY_Warhorse|r 跑过去并立即杀死 |cRXP_ENEMY_Boneguard Footmen|r
	>>杀死 |cRXP_ENEMY_Boneguard Lieutenants|r。获得 |T132360:0|tDefend (4) 的堆叠并维持它。使用 |T132358:0|tShield-Breaker (2) 移除他们的护盾，然后使用 |T132226:0|tCharge (3) 和 |T135375:0|tThrust (1)
	.complete 13857,1 -- Boneguard Footman slain (15)
	.complete 13857,3 -- Boneguard Lieutenant slain (3)
	.goto IcecrownGlacier,50.42,76.30,40,0
	.goto IcecrownGlacier,50.86,77.73,40,0
	.goto IcecrownGlacier,51.44,79.44,40,0
	.goto IcecrownGlacier,50.42,76.30
	.isOnQuest 13857
	.mob Boneguard Footman
	.mob Boneguard Lieutenant
step
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.goto IcecrownGlacier,51.77,74.97,50,0
	.goto IcecrownGlacier,53.30,73.72,50,0
	.goto IcecrownGlacier,51.75,70.97,50,0
	.goto IcecrownGlacier,49.68,73.21,50,0
	.goto IcecrownGlacier,47.24,73.07,50,0
	.goto IcecrownGlacier,48.80,77.11,50,0
	.goto IcecrownGlacier,50.45,74.34,50,0
	.goto IcecrownGlacier,52.36,73.07,50,0
	.goto IcecrownGlacier,52.36,73.07
	.complete 13857,2 -- Boneguard Scout slain (10)
	.isOnQuest 13857
	.mob Boneguard Scout


step -- A Worthy Weapon v2
	>>|cRXP_WARN_记得装备你的武器|r
	>>在冰冠冰川和晶歌森林边界的铁墙大坝收集|cRXP_PICK_冬风信子|r
	>>它们从岩石中长出来
	.goto IcecrownGlacier,69.25,76.02,15,0
	.goto IcecrownGlacier,70.05,75.19,15,0
	.goto IcecrownGlacier,71.07,73.20,15,0
	.goto IcecrownGlacier,72.07,73.02,15,0
	.goto IcecrownGlacier,73.42,73.59,15,0
	.goto IcecrownGlacier,69.25,76.02
	.collect 45000,4
	.isOnQuest 13769
step
	#completewith next
	.goto Dragonblight,93.18,26.00
	.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
	.isOnQuest 13769
step
	.goto Dragonblight,93.18,26.00
	.use 45000 >>在德拉克玛湖中心使用背包中的 |T134195:0|t|cFFFFFF99冬风信子|r
	>>等待德拉克玛少女角色扮演然后拾取|cRXP_PICK_德拉克玛之刃|r
	.cast 62629
	.timer 21,Maiden of Drak'Mar Roleplay
	.complete 13769,1 -- Blade of Drak'Mar (1)
	.isOnQuest 13769

step -- The Edge Of Winter v2
	#completewith next
	.goto CrystalsongForest,55.05,75.04
	.zone CrystalsongForest >>前往晶歌森林
	.isOnQuest 13770
step
	.goto CrystalsongForest,55.05,75.04
	>>|cRXP_WARN_记得装备你的武器|r
	>>杀死 |cRXP_ENEMY_Lord Everblaze|r。从他身上搜刮 |cRXP_LOOT_Everburning Ember|r
	.collect 45005,1 -- Everburning Ember
	.mob Lord Everblaze
	.isOnQuest 13770
step
	#completewith next
	.goto HowlingFjord,42.18,19.65
	.zone HowlingFjord >>前往嚎风峡湾北部的冬息湖
	.isOnQuest 13770
step
	.goto HowlingFjord,42.18,19.65
	.use 45005 >>使用背包中的 |T135488:0|t|c99ffff99Everburning Ember|r 释放冬息湖的少女
	.complete 13770,1 -- Winter's Edge (1)
	.target Maiden of Winter's Breath Lake
	.isOnQuest 13770

step -- A Blade Fit For A Champion v2
	#completewith next
	.goto Grizzly Hills,60.83,51.36
	.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
	.isOnQuest 13768
step
	.goto Grizzly Hills,60.83,51.36,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,61.89,48.56,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.89,48.56
	.use 44986 >>在尝试 /亲吻 Lake Frogs 之前，请先 |c99ffff99Warts-B-Gone 润唇膏|r 放在您的包里 |c99ffff99everytime|r
	>>瞄准湖蛙即可自动亲吻它们。如果不起作用，请输入 /kiss
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最终，其中一只湖蛙会变成人类。与它交谈可获得 |cRXP_PICK_Ashwood Brand|r
	>>|cRXP_WARN_记得装备你的武器|r
	.emote KISS,33211
	.emote KISS,33224
	.skipgossip
	.complete 13768,1 -- Ashwood Brand (1)
	.target Lake Frog
	.target Maiden of Ashwood Lake
	.isOnQuest 13768
step
	.goto IcecrownGlacier,76.27,24.38,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地
	.isOnQuest 13768,13770,13769,13771,13772,13857
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r, |cRXP_FRIENDLY_暗影猎手梅兹克雷|r, |cRXP_FRIENDLY_加尔祖|r
	.turnin 13768 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,75.95,24.53
	.turnin 13771 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.04,24.59
	.turnin 13772 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13857 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,75.93,24.41
	.target Zul'tore
	.target Shadow Hunter Mezil-kree
	.target Gahju
	.isQuestComplete 13768 -- A Blade Fit For A Champion
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r, |cRXP_FRIENDLY_暗影猎手梅兹克雷|r, |cRXP_FRIENDLY_加尔祖|r
	.turnin 13770 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,75.95,24.53
	.turnin 13771 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.04,24.59
	.turnin 13772 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13857 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,75.93,24.41
	.target Zul'tore
	.target Shadow Hunter Mezil-kree
	.target Gahju
	.isQuestComplete 13770 -- The Edge Of Winter
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r, |cRXP_FRIENDLY_暗影猎手梅兹克雷|r, |cRXP_FRIENDLY_加尔祖|r
	.turnin 13769 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,75.95,24.53
	.turnin 13771 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.04,24.59
	.turnin 13772 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13857 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,75.93,24.41
	.target Zul'tore
	.target Shadow Hunter Mezil-kree
	.target Gahju
	.isQuestComplete 13769 -- A Worthy Weapon
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗影猎手梅兹克雷|r, |cRXP_FRIENDLY_加尔祖|r
	.turnin -13771 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.04,24.59
	.turnin -13772 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13857 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,75.93,24.41
	.target Shadow Hunter Mezil-kree
	.target Gahju
step
	>>为了完成任务 |cFFffff00The Valiant's Charge|r 并通过 |T236690:0|t银色锦标赛 Grounds，你必须完成每日任务并获得 |T133441:0|t|c99CCFFFFValiant's Seal|r
	>>您需要 |T133441:0|t|c99CCFFFF25 勇士印章|r。完成 4 个日常任务后，您每天可获得 5 个
	>>|c99ffff99如果您仍然需要完成每日任务，请在第二天重新加载指南，直到您可以完成此任务|r。
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r
	.goto IcecrownGlacier,75.95,24.53
	.complete 13719,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r -- Valiant's Seal (25)
	.turnin 13719 >>交任务: |cRXP_FRIENDLY_勇士之战|r
	.accept 13727 >>接任务: |cRXP_WARN_勇士的挑战|r
	.target Zul'tore
step -- The Valiant's Challenge
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上马厩里的暗矛迅猛龙
	>>如果你丢失了 |T135128:0|t|c99ffff99Horde Lance|r，你可以在亭子里再拿一个
	.goto IcecrownGlacier,75.58,23.76
	.use 46070
	.target Stabled Darkspear Raptor
	.isOnQuest 13727
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从丹尼|r
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>等待 |cRXP_ENEMY_Argent Champion|r 到达然后击败它
	.goto IcecrownGlacier,68.60,20.99
	.complete 13727,1 -- Argent Champion defeated (1)
	.skipgossip
	.timer 12,Argent Champion Arrival
	.mob Argent Champion
	.isOnQuest 13727
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尔托|r
	.goto IcecrownGlacier,75.95,24.53
	.turnin 13727 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r
	.target Zul'tore
step
	.goto IcecrownGlacier,76.17,24.21
	+|cRXP_WARN_你现在是|T255145:0|t森金的勇士！|r
	>>|cRXP_LOOT_您现在已经完成了森金冠军指南！|r
	>>|cRXP_LOOT_你现在可以选择成为|r |cRXP_WARN_Champion|r |cRXP_LOOT_of another|r |cRXP_WARN_Race|r|cRXP_LOOT_|r
	>>|cRXP_LOOT_加载 |cRXP_FRIENDLY_2.0|r 指南，了解您选择接下来要追求的|r |cRXP_WARN_Race|r |cRXP_LOOT_！|r
	>>|cRXP_LOOT_OR
	>>|cRXP_LOOT_你可以开始|r |cRXP_ENEMY_3.0|r |cRXP_LOOT_Champion 每日任务|r
	.isQuestTurnedIn 13727
]])

RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name D_2_AT_雷霆崖
#displayname |cRXP_FRIENDLY_2.0|r - Thunder Bluff Champion
<< Horde !Tauren

step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r
	.goto IcecrownGlacier,76.20,24.63
	.accept 13709 >>接任务: |cRXP_WARN_雷霆崖的勇士|r
	.turnin 13709 >>交任务: |cRXP_FRIENDLY_雷霆崖的勇士|r
	.target Runok Wildmane
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r
	.accept 13720 >>接任务: |cRXP_WARN_勇士之战|r
	.daily 13773,13775,13774 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.20,24.63
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德恩·暴怒图腾|r, |cRXP_FRIENDLY_安卡·爪蹄|r
	.daily 13776 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.26,24.66
	.daily 13777 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13858 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.14,24.64
	.target Runok Wildmane
	.target Dern Ragetotem
	.target Anka Clawhoof
	.isQuestAvailable 13720

step
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lancer|然后骑上马厩里的雷霆崖科多兽
	>>如果你丢失了 |T135128:0|t|c99ffff99Horde Lance|r，你可以在亭子里再拿一个
	.goto IcecrownGlacier,75.53,24.26
	.use 46070
	.target Stabled Thunder Bluff Kodo
	.isOnQuest 13777
step
	>>前往部落勇士之环
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Valiant|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠中的 |cRXP_ENEMY_Valiant|r
	>>一旦 |cRXP_ENEMY_Valiant|r 上没有 |T132360:0|tDefend 的堆叠，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Valiant|r 3 次
	.goto IcecrownGlacier,75.48,25.39,10,0
	.goto IcecrownGlacier,75.78,26.03,10,0
	.goto IcecrownGlacier,75.53,26.69,10,0
	.goto IcecrownGlacier,74.99,26.43,10,0
	.goto IcecrownGlacier,75.00,25.65,10,0
	.goto IcecrownGlacier,75.48,25.39,10,0
	.goto IcecrownGlacier,75.78,26.03,10,0
	.goto IcecrownGlacier,75.53,26.69,10,0
	.goto IcecrownGlacier,74.99,26.43,10,0
	.goto IcecrownGlacier,75.00,25.65,10,0
	.goto IcecrownGlacier,75.48,25.39
	.complete 13777,1 -- Mark of the Valiant (3)
	.isOnQuest 13777
	.skipgossip
	.mob Thunder Bluff Valiant
	.mob Silvermoon Valiant
	.mob Sen'jin Valiant
	.mob Orgrimmar Valiant
	.mob Undercity Valiant

step -- A Valiant's Field Training
	>>从坐骑上跳下来。|cRXP_WARN_记得装备你的武器|r。不要毁掉你的|T135128:0|t|c99ffff99Lance|r。你会再次需要它
	>>击杀 |cRXP_ENEMY_Converted Heroes|r
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,46.91,51.72,60,0
	.goto IcecrownGlacier,46.83,54.38,60,0
	.goto IcecrownGlacier,44.82,55.38,60,0
	.goto IcecrownGlacier,42.55,55.28,60,0
	.goto IcecrownGlacier,40.45,53.53,60,0
	.goto IcecrownGlacier,41.50,50.23,60,0
	.goto IcecrownGlacier,44.14,49.89,60,0
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,42.55,55.28
	.complete 13776,1 -- Converted Hero slain (10)
	.isOnQuest 13776
	.mob Converted Hero

step -- At The Enemy's Gates
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r
	>>如果你需要另一个，路障旁边有一个|T135128:0|t|c99ffff99Lance Rack|r
	.goto IcecrownGlacier,48.87,71.78
	.use 46070
	.isOnQuest 13858
	.target Stabled Campaign Warhorse
step
	#completewith next
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.complete 13858,2 -- Boneguard Scout slain (10)
	.isOnQuest 13858
	.mob Boneguard Scout
step
	>>使用你的 |cRXP_FRIENDLY_Warhorse|r 跑过去并立即杀死 |cRXP_ENEMY_Boneguard Footmen|r
	>>杀死 |cRXP_ENEMY_Boneguard Lieutenants|r。获得 |T132360:0|tDefend (4) 的堆叠并维持它。使用 |T132358:0|tShield-Breaker (2) 移除他们的护盾，然后使用 |T132226:0|tCharge (3) 和 |T135375:0|tThrust (1)
	.complete 13858,1 -- Boneguard Footman slain (15)
	.complete 13858,3 -- Boneguard Lieutenant slain (3)
	.goto IcecrownGlacier,50.42,76.30,40,0
	.goto IcecrownGlacier,50.86,77.73,40,0
	.goto IcecrownGlacier,51.44,79.44,40,0
	.goto IcecrownGlacier,50.42,76.30
	.isOnQuest 13858
	.mob Boneguard Footman
	.mob Boneguard Lieutenant
step
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.goto IcecrownGlacier,51.77,74.97,50,0
	.goto IcecrownGlacier,53.30,73.72,50,0
	.goto IcecrownGlacier,51.75,70.97,50,0
	.goto IcecrownGlacier,49.68,73.21,50,0
	.goto IcecrownGlacier,47.24,73.07,50,0
	.goto IcecrownGlacier,48.80,77.11,50,0
	.goto IcecrownGlacier,50.45,74.34,50,0
	.goto IcecrownGlacier,52.36,73.07,50,0
	.goto IcecrownGlacier,52.36,73.07
	.complete 13858,2 -- Boneguard Scout slain (10)
	.isOnQuest 13858
	.mob Boneguard Scout

step -- A Worthy Weapon v2
	>>|cRXP_WARN_记得装备你的武器|r
	>>在冰冠冰川和晶歌森林边界的铁墙大坝收集|cRXP_PICK_冬风信子|r
	>>它们从岩石中长出来
	.goto IcecrownGlacier,69.25,76.02,15,0
	.goto IcecrownGlacier,70.05,75.19,15,0
	.goto IcecrownGlacier,71.07,73.20,15,0
	.goto IcecrownGlacier,72.07,73.02,15,0
	.goto IcecrownGlacier,73.42,73.59,15,0
	.goto IcecrownGlacier,69.25,76.02
	.collect 45000,4
	.isOnQuest 13774
step
	#completewith next
	.goto Dragonblight,93.18,26.00
	.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
	.isOnQuest 13774
step
	.goto Dragonblight,93.18,26.00
	.use 45000 >>在德拉克玛湖中心使用背包中的 |T134195:0|t|cFFFFFF99冬风信子|r
	>>等待德拉克玛少女角色扮演然后拾取|cRXP_PICK_德拉克玛之刃|r
	.cast 62629
	.timer 21,Maiden of Drak'Mar Roleplay
	.complete 13774,1 -- Blade of Drak'Mar (1)
	.isOnQuest 13774

step -- The Edge Of Winter v2
	#completewith next
	.goto CrystalsongForest,55.05,75.04
	.zone CrystalsongForest >>前往晶歌森林
	.isOnQuest 13775
step
	.goto CrystalsongForest,55.05,75.04
	>>|cRXP_WARN_记得装备你的武器|r
	>>杀死 |cRXP_ENEMY_Lord Everblaze|r。从他身上搜刮 |cRXP_LOOT_Everburning Ember|r
	.collect 45005,1 -- Everburning Ember
	.mob Lord Everblaze
	.isOnQuest 13775
step
	#completewith next
	.goto HowlingFjord,42.18,19.65
	.zone HowlingFjord >>前往嚎风峡湾北部的冬息湖
	.isOnQuest 13775
step
	.goto HowlingFjord,42.18,19.65
	.use 45005 >>使用背包中的 |T135488:0|t|c99ffff99Everburning Ember|r 释放冬息湖的少女
	.complete 13775,1 -- Winter's Edge (1)
	.target Maiden of Winter's Breath Lake
	.isOnQuest 13775

step -- A Blade Fit For A Champion v2
	#completewith next
	.goto Grizzly Hills,60.83,51.36
	.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
	.isOnQuest 13773
step
	.goto Grizzly Hills,60.83,51.36,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,61.89,48.56,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.89,48.56
	.use 44986 >>在尝试 /亲吻 Lake Frogs 之前，请先 |c99ffff99Warts-B-Gone 润唇膏|r 放在您的包里 |c99ffff99everytime|r
	>>瞄准湖蛙即可自动亲吻它们。如果不起作用，请输入 /kiss
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最终，其中一只湖蛙会变成人类。与它交谈可获得 |cRXP_PICK_Ashwood Brand|r
	>>|cRXP_WARN_记得装备你的武器|r
	.emote KISS,33211
	.emote KISS,33224
	.skipgossip
	.complete 13773,1 -- Ashwood Brand (1)
	.target Lake Frog
	.target Maiden of Ashwood Lake
	.isOnQuest 13773
step
	.goto IcecrownGlacier,76.46,19.41,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地 << Alliance
	.goto IcecrownGlacier,76.27,24.38,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地 << Horde
	.isOnQuest 13773,13775,13774,13776,13777,13858
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r, |cRXP_FRIENDLY_德恩·暴怒图腾|r, |cRXP_FRIENDLY_安卡·爪蹄|r
	.turnin 13773 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.20,24.63
	.turnin 13776 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.26,24.66
	.turnin 13777 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13858 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.14,24.64
	.target Runok Wildmane
	.target Dern Ragetotem
	.target Anka Clawhoof
	.isQuestComplete 13773 -- A Blade Fit For A Champion
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r, |cRXP_FRIENDLY_德恩·暴怒图腾|r, |cRXP_FRIENDLY_安卡·爪蹄|r
	.turnin 13775 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.20,24.63
	.turnin 13776 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.26,24.66
	.turnin 13777 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13858 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.14,24.64
	.target Runok Wildmane
	.target Dern Ragetotem
	.target Anka Clawhoof
	.isQuestComplete 13775 -- The Edge Of Winter
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r, |cRXP_FRIENDLY_德恩·暴怒图腾|r, |cRXP_FRIENDLY_安卡·爪蹄|r
	.turnin 13774 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.20,24.63
	.turnin 13776 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.26,24.66
	.turnin 13777 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13858 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.14,24.64
	.target Runok Wildmane
	.target Dern Ragetotem
	.target Anka Clawhoof
	.isQuestComplete 13774 -- A Worthy Weapon
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德恩·暴怒图腾|r, |cRXP_FRIENDLY_安卡·爪蹄|r
	.turnin -13776 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.26,24.66
	.turnin -13777 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13858 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.14,24.64
	.target Dern Ragetotem
	.target Anka Clawhoof
step -- Checking if they have 25 Valiant's Seals after a set of turn ins.
	>>为了完成任务 |cFFffff00The Valiant's Charge|r 并通过 |T236690:0|t银色锦标赛 Grounds，你必须完成每日任务并获得 |T133441:0|t|c99CCFFFFValiant's Seal|r
	>>您需要 |T133441:0|t|c99CCFFFF25 勇士印章|r。完成 4 个日常任务后，您每天可获得 5 个
	>>|c99ffff99如果您仍然需要完成每日任务，请在第二天重新加载指南，直到您可以完成此任务|r。
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r
	.goto IcecrownGlacier,76.20,24.63
	.complete 13720,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r -- Valiant's Seal (25)
	.turnin 13720 >>交任务: |cRXP_FRIENDLY_勇士之战|r
	.accept 13728 >>接任务: |cRXP_WARN_勇士的挑战|r
	.target Runok Wildmane
step -- The Valiant's Challenge
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lancer|然后骑上马厩里的雷霆崖科多兽
	>>如果你丢失了 |T135128:0|t|c99ffff99Horde Lance|r，你可以在亭子里再拿一个
	.goto IcecrownGlacier,75.53,24.26
	.use 46070
	.target Stabled Thunder Bluff Kodo
	.isOnQuest 13728
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从丹尼|r
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>等待 |cRXP_ENEMY_Argent Champion|r 到达然后击败它
	.goto IcecrownGlacier,68.60,20.99
	.complete 13728,1 -- Argent Champion defeated (1)
	.skipgossip
	.timer 12,Argent Champion Arrival
	.mob Argent Champion
	.isOnQuest 13728
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁诺克·蛮鬃|r
	.goto IcecrownGlacier,76.20,24.63
	.turnin 13728 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r
	.target Runok Wildmane
step
	.goto IcecrownGlacier,76.17,24.21
	+|cRXP_WARN_你现在是|T255144:0|t雷霆崖的冠军！|r
	>>|cRXP_LOOT_您现在已经完成了雷霆崖冠军指南！|r
	>>|cRXP_LOOT_你现在可以选择成为|r |cRXP_WARN_Champion|r |cRXP_LOOT_of another|r |cRXP_WARN_Race|r|cRXP_LOOT_|r
	>>|cRXP_LOOT_加载 |cRXP_FRIENDLY_2.0|r 指南，了解您选择接下来要追求的|r |cRXP_WARN_Race|r |cRXP_LOOT_！|r
	>>|cRXP_LOOT_OR
	>>|cRXP_LOOT_你可以开始|r |cRXP_ENEMY_3.0|r |cRXP_LOOT_Champion 每日任务|r
	.isQuestTurnedIn 13728
]])

RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name E_2_AT_幽暗城
#displayname |cRXP_FRIENDLY_2.0|r - Undercity Champion
<< Horde !Scourge

step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r
	.goto IcecrownGlacier,76.53,24.21
	.accept 13710 >>接任务: |cRXP_WARN_幽暗城的勇士|r
	.turnin 13710 >>交任务: |cRXP_FRIENDLY_幽暗城的勇士|r
	.target Deathstalker Visceri
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r
	.accept 13721 >>接任务: |cRXP_WARN_勇士之战|r
	.daily 13778,13780,13779 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.53,24.21
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎拉·查尔克|r, |cRXP_FRIENDLY_马夫德雷奇|r
	.daily 13781 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.56,24.11
	.daily 13782 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13860 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.55,24.33
	.target Deathstalker Visceri
	.target Sarah Chalke
	.target Handler Dretch
	.isQuestAvailable 13721
step
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上马厩中的被遗忘者战马
	>>如果你丢失了 |T135128:0|t|c99ffff99Horde Lance|r，你可以在亭子里再拿一个
	.goto IcecrownGlacier,75.56,23.86
	.use 46070
	.target Stabled Forsaken Warhorse
	.isOnQuest 13782
step
	>>前往部落勇士之环
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Valiant|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠中的 |cRXP_ENEMY_Valiant|r
	>>一旦 |cRXP_ENEMY_Valiant|r 上没有 |T132360:0|tDefend 的堆叠，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Valiant|r 3 次
	.goto IcecrownGlacier,75.48,25.39,10,0
	.goto IcecrownGlacier,75.78,26.03,10,0
	.goto IcecrownGlacier,75.53,26.69,10,0
	.goto IcecrownGlacier,74.99,26.43,10,0
	.goto IcecrownGlacier,75.00,25.65,10,0
	.goto IcecrownGlacier,75.48,25.39,10,0
	.goto IcecrownGlacier,75.78,26.03,10,0
	.goto IcecrownGlacier,75.53,26.69,10,0
	.goto IcecrownGlacier,74.99,26.43,10,0
	.goto IcecrownGlacier,75.00,25.65,10,0
	.goto IcecrownGlacier,75.48,25.39
	.complete 13782,1 -- Mark of the Valiant (3)
	.isOnQuest 13782
	.skipgossip
	.mob Thunder Bluff Valiant
	.mob Silvermoon Valiant
	.mob Sen'jin Valiant
	.mob Orgrimmar Valiant
	.mob Undercity Valiant
step -- A Valiant's Field Training
	>>从坐骑上跳下来。|cRXP_WARN_记得装备你的武器|r。不要毁掉你的|T135128:0|t|c99ffff99Lance|r。你会再次需要它
	>>击杀 |cRXP_ENEMY_Converted Heroes|r
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,46.91,51.72,60,0
	.goto IcecrownGlacier,46.83,54.38,60,0
	.goto IcecrownGlacier,44.82,55.38,60,0
	.goto IcecrownGlacier,42.55,55.28,60,0
	.goto IcecrownGlacier,40.45,53.53,60,0
	.goto IcecrownGlacier,41.50,50.23,60,0
	.goto IcecrownGlacier,44.14,49.89,60,0
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,42.55,55.28
	.complete 13781,1 -- Converted Hero slain (10)
	.isOnQuest 13781
	.mob Converted Hero

step -- At The Enemy's Gates
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r
	>>如果你需要另一个，路障旁边有一个|T135128:0|t|c99ffff99Lance Rack|r
	.goto IcecrownGlacier,48.87,71.78
	.use 46070
	.isOnQuest 13860
	.target Stabled Campaign Warhorse
step
	#completewith next
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.complete 13860,2 -- Boneguard Scout slain (10)
	.isOnQuest 13860
	.mob Boneguard Scout
step
	>>使用你的 |cRXP_FRIENDLY_Warhorse|r 跑过去并立即杀死 |cRXP_ENEMY_Boneguard Footmen|r
	>>杀死 |cRXP_ENEMY_Boneguard Lieutenants|r。获得 |T132360:0|tDefend (4) 的堆叠并维持它。使用 |T132358:0|tShield-Breaker (2) 移除他们的护盾，然后使用 |T132226:0|tCharge (3) 和 |T135375:0|tThrust (1)
	.complete 13860,1 -- Boneguard Footman slain (15)
	.complete 13860,3 -- Boneguard Lieutenant slain (3)
	.goto IcecrownGlacier,50.42,76.30,40,0
	.goto IcecrownGlacier,50.86,77.73,40,0
	.goto IcecrownGlacier,51.44,79.44,40,0
	.goto IcecrownGlacier,50.42,76.30
	.isOnQuest 13860
	.mob Boneguard Footman
	.mob Boneguard Lieutenant
step
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.goto IcecrownGlacier,51.77,74.97,50,0
	.goto IcecrownGlacier,53.30,73.72,50,0
	.goto IcecrownGlacier,51.75,70.97,50,0
	.goto IcecrownGlacier,49.68,73.21,50,0
	.goto IcecrownGlacier,47.24,73.07,50,0
	.goto IcecrownGlacier,48.80,77.11,50,0
	.goto IcecrownGlacier,50.45,74.34,50,0
	.goto IcecrownGlacier,52.36,73.07,50,0
	.goto IcecrownGlacier,52.36,73.07
	.complete 13860,2 -- Boneguard Scout slain (10)
	.isOnQuest 13860
	.mob Boneguard Scout


step -- A Worthy Weapon v2
	>>|cRXP_WARN_记得装备你的武器|r
	>>在冰冠冰川和晶歌森林边界的铁墙大坝收集|cRXP_PICK_冬风信子|r
	>>它们从岩石中长出来
	.goto IcecrownGlacier,69.25,76.02,15,0
	.goto IcecrownGlacier,70.05,75.19,15,0
	.goto IcecrownGlacier,71.07,73.20,15,0
	.goto IcecrownGlacier,72.07,73.02,15,0
	.goto IcecrownGlacier,73.42,73.59,15,0
	.goto IcecrownGlacier,69.25,76.02
	.collect 45000,4
	.isOnQuest 13779
step
	#completewith next
	.goto Dragonblight,93.18,26.00
	.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
	.isOnQuest 13779
step
	.goto Dragonblight,93.18,26.00
	.use 45000 >>在德拉克玛湖中心使用背包中的 |T134195:0|t|cFFFFFF99冬风信子|r
	>>等待德拉克玛少女角色扮演然后拾取|cRXP_PICK_德拉克玛之刃|r
	.cast 62629
	.timer 21,Maiden of Drak'Mar Roleplay
	.complete 13779,1 -- Blade of Drak'Mar (1)
	.isOnQuest 13779

step -- The Edge Of Winter v2
	#completewith next
	.goto CrystalsongForest,55.05,75.04
	.zone CrystalsongForest >>前往晶歌森林
	.isOnQuest 13780
step
	.goto CrystalsongForest,55.05,75.04
	>>|cRXP_WARN_记得装备你的武器|r
	>>杀死 |cRXP_ENEMY_Lord Everblaze|r。从他身上搜刮 |cRXP_LOOT_Everburning Ember|r
	.collect 45005,1 -- Everburning Ember
	.mob Lord Everblaze
	.isOnQuest 13780
step
	#completewith next
	.goto HowlingFjord,42.18,19.65
	.zone HowlingFjord >>前往嚎风峡湾北部的冬息湖
	.isOnQuest 13780
step
	.goto HowlingFjord,42.18,19.65
	.use 45005 >>使用背包中的 |T135488:0|t|c99ffff99Everburning Ember|r 释放冬息湖的少女
	.complete 13780,1 -- Winter's Edge (1)
	.target Maiden of Winter's Breath Lake
	.isOnQuest 13780

step -- A Blade Fit For A Champion v2
	#completewith next
	.goto Grizzly Hills,60.83,51.36
	.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
	.isOnQuest 13778
step
	.goto Grizzly Hills,60.83,51.36,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,61.89,48.56,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.89,48.56
	.use 44986 >>在尝试 /亲吻 Lake Frogs 之前，请先 |c99ffff99Warts-B-Gone 润唇膏|r 放在您的包里 |c99ffff99everytime|r
	>>瞄准湖蛙即可自动亲吻它们。如果不起作用，请输入 /kiss
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最终，其中一只湖蛙会变成人类。与它交谈可获得 |cRXP_PICK_Ashwood Brand|r
	>>|cRXP_WARN_记得装备你的武器|r
	.emote KISS,33211
	.emote KISS,33224
	.skipgossip
	.complete 13778,1 -- Ashwood Brand (1)
	.target Lake Frog
	.target Maiden of Ashwood Lake
	.isOnQuest 13778
step
	.goto IcecrownGlacier,76.46,19.41,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地 << Alliance
	.goto IcecrownGlacier,76.27,24.38,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地 << Horde
	.isOnQuest 13778,13780,13779,13781,13782,13860
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r, |cRXP_FRIENDLY_莎拉·查尔克|r, |cRXP_FRIENDLY_马夫德雷奇|r
	.turnin 13778 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.53,24.21
	.turnin 13781 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.56,24.11
	.turnin 13782 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13860 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.55,24.33
	.target Deathstalker Visceri
	.target Sarah Chalke
	.target Handler Dretch
	.isQuestComplete 13778 -- A Blade Fit For A Champion
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r, |cRXP_FRIENDLY_莎拉·查尔克|r, |cRXP_FRIENDLY_马夫德雷奇|r
	.turnin 13780 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.53,24.21
	.turnin 13781 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.56,24.11
	.turnin 13782 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13860 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.55,24.33
	.target Deathstalker Visceri
	.target Sarah Chalke
	.target Handler Dretch
	.isQuestComplete 13780 -- The Edge Of Winter
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r, |cRXP_FRIENDLY_莎拉·查尔克|r, |cRXP_FRIENDLY_马夫德雷奇|r
	.turnin 13779 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.53,24.21
	.turnin 13781 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.56,24.11
	.turnin 13782 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13860 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.55,24.33
	.target Deathstalker Visceri
	.target Sarah Chalke
	.target Handler Dretch
	.isQuestComplete 13779 -- A Worthy Weapon
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎拉·查尔克|r, |cRXP_FRIENDLY_马夫德雷奇|r
	.turnin -13781 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.56,24.11
	.turnin -13782 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13860 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.55,24.33
	.target Sarah Chalke
	.target Handler Dretch
step -- Checking if they have 25 Valiant's Seals after a set of turn ins.
	>>为了完成任务 |cFFffff00The Valiant's Charge|r 并通过 |T236690:0|t银色锦标赛 Grounds，你必须完成每日任务并获得 |T133441:0|t|c99CCFFFFValiant's Seal|r
	>>您需要 |T133441:0|t|c99CCFFFF25 勇士印章|r。完成 4 个日常任务后，您每天可获得 5 个
	>>|c99ffff99如果您仍然需要完成每日任务，请在第二天重新加载指南，直到您可以完成此任务|r。
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r
	.goto IcecrownGlacier,76.53,24.21
	.complete 13721,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r -- Valiant's Seal (25)
	.turnin 13721 >>交任务: |cRXP_FRIENDLY_勇士之战|r
	.accept	13729 >>接任务: |cRXP_WARN_勇士的挑战|r
	.target Deathstalker Visceri
step -- The Valiant's Challenge
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上马厩中的被遗忘者战马
	>>如果你丢失了 |T135128:0|t|c99ffff99Horde Lance|r，你可以在亭子里再拿一个
	.goto IcecrownGlacier,75.56,23.86
	.use 46070
	.target Stabled Forsaken Warhorse
	.isOnQuest 13729
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从丹尼|r
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>等待 |cRXP_ENEMY_Argent Champion|r 到达然后击败它
	.goto IcecrownGlacier,68.60,20.99
	.complete 13729,1 -- Argent Champion defeated (1)
	.skipgossip
	.timer 12,Argent Champion Arrival
	.mob Argent Champion
	.isOnQuest 13729
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_死亡猎手维赛里|r
	.goto IcecrownGlacier,76.53,24.21
	.turnin	13729 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r
	.target Deathstalker Visceri
step
	.goto IcecrownGlacier,76.17,24.21
	+|cRXP_WARN_你现在是|T255143:0|t幽暗城的勇士！|r
	>>|cRXP_LOOT_您现在已经完成了幽暗城冠军指南！|r
	>>|cRXP_LOOT_你现在可以选择成为|r |cRXP_WARN_Champion|r |cRXP_LOOT_of another|r |cRXP_WARN_Race|r|cRXP_LOOT_|r
	>>|cRXP_LOOT_加载 |cRXP_FRIENDLY_2.0|r 指南，了解您选择接下来要追求的|r |cRXP_WARN_Race|r |cRXP_LOOT_！|r
	>>|cRXP_LOOT_OR
	>>|cRXP_LOOT_你可以开始|r |cRXP_ENEMY_3.0|r |cRXP_LOOT_Champion 每日任务|r
	.isQuestTurnedIn 13729
]])

RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name F_2_AT_银月
#displayname |cRXP_FRIENDLY_2.0|r - Silvermoon Champion
#next 冠军支线任务
<< Horde !BloodElf

step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r
	.goto IcecrownGlacier,76.45,23.85
	.accept 13711 >>接任务: |cRXP_WARN_银月城的勇士|r
	.turnin 13711 >>交任务: |cRXP_FRIENDLY_银月城的勇士|r
	.target Eressea Dawnsinger
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎颅者莫克拉|r
	.accept 13722 >>接任务: |cRXP_WARN_勇士之战|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r
	.daily 13783,13785,13784 >>接任务: |cRXP_WARN_珍贵的武器|r
	.goto IcecrownGlacier,76.45,23.85
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克希尔·炎枪|r, |cRXP_FRIENDLY_安妮拉·索隆|r
	.daily 13786 >>接任务: |cRXP_WARN_勇士的实战训练|r
	.goto IcecrownGlacier,76.41,23.75
	.daily 13787 >>接任务: |cRXP_WARN_总决赛|r
	.daily 13859 >>接任务: |cRXP_WARN_兵临城下|r
	.goto IcecrownGlacier,76.52,23.93
	.target Eressea Dawnsinger
	.target Kethiel Sunlance
	.target Aneera Thuron
	.isQuestAvailable 13722
step
	#completewith next
	.vehicle >>装备背包中的|T135128:0|t|c99ffff99部落长枪|r，然后骑上马厩中的银月陆行鸟
	>>如果你丢失了 |T135128:0|t|c99ffff99Horde Lance|r，你可以在亭子里再拿一个
	.goto IcecrownGlacier,75.54,24.14
	.use 46070
	.target Stabled Silvermoon Hawkstrider
	.isOnQuest 13787
step
	>>前往部落勇士之环
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Valiant|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠中的 |cRXP_ENEMY_Valiant|r
	>>一旦 |cRXP_ENEMY_Valiant|r 上没有 |T132360:0|tDefend 的堆叠，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Valiant|r 3 次
	.goto IcecrownGlacier,75.48,25.39,10,0
	.goto IcecrownGlacier,75.78,26.03,10,0
	.goto IcecrownGlacier,75.53,26.69,10,0
	.goto IcecrownGlacier,74.99,26.43,10,0
	.goto IcecrownGlacier,75.00,25.65,10,0
	.goto IcecrownGlacier,75.48,25.39,10,0
	.goto IcecrownGlacier,75.78,26.03,10,0
	.goto IcecrownGlacier,75.53,26.69,10,0
	.goto IcecrownGlacier,74.99,26.43,10,0
	.goto IcecrownGlacier,75.00,25.65,10,0
	.goto IcecrownGlacier,75.48,25.39
	.complete 13787,1 -- Mark of the Valiant (3)
	.isOnQuest 13787
	.skipgossip
	.mob Thunder Bluff Valiant
	.mob Silvermoon Valiant
	.mob Sen'jin Valiant
	.mob Orgrimmar Valiant
	.mob Undercity Valiant
step -- A Valiant's Field Training
	>>从坐骑上跳下来。|cRXP_WARN_记得装备你的武器|r。不要毁掉你的|T135128:0|t|c99ffff99Lance|r。你会再次需要它
	>>击杀 |cRXP_ENEMY_Converted Heroes|r
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,46.91,51.72,60,0
	.goto IcecrownGlacier,46.83,54.38,60,0
	.goto IcecrownGlacier,44.82,55.38,60,0
	.goto IcecrownGlacier,42.55,55.28,60,0
	.goto IcecrownGlacier,40.45,53.53,60,0
	.goto IcecrownGlacier,41.50,50.23,60,0
	.goto IcecrownGlacier,44.14,49.89,60,0
	.goto IcecrownGlacier,45.74,49.88,60,0
	.goto IcecrownGlacier,42.55,55.28
	.complete 13786,1 -- Converted Hero slain (10)
	.isOnQuest 13786
	.mob Converted Hero


step -- At The Enemy's Gates
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Alliance Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r << Alliance
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r << Horde
	>>如果你需要另一个，路障旁边有一个|T135128:0|t|c99ffff99Lance Rack|r
	.goto IcecrownGlacier,48.87,71.78
	.use 46070
	.isOnQuest 13859
	.target Stabled Campaign Warhorse
step
	#completewith next
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.complete 13859,2 -- Boneguard Scout slain (10)
	.isOnQuest 13859
	.mob Boneguard Scout
step
	>>使用你的 |cRXP_FRIENDLY_Warhorse|r 跑过去并立即杀死 |cRXP_ENEMY_Boneguard Footmen|r
	>>杀死 |cRXP_ENEMY_Boneguard Lieutenants|r。获得 |T132360:0|tDefend (4) 的堆叠并维持它。使用 |T132358:0|tShield-Breaker (2) 移除他们的护盾，然后使用 |T132226:0|tCharge (3) 和 |T135375:0|tThrust (1)
	.complete 13859,1 -- Boneguard Footman slain (15)
	.complete 13859,3 -- Boneguard Lieutenant slain (3)
	.goto IcecrownGlacier,50.42,76.30,40,0
	.goto IcecrownGlacier,50.86,77.73,40,0
	.goto IcecrownGlacier,51.44,79.44,40,0
	.goto IcecrownGlacier,50.42,76.30
	.isOnQuest 13859
	.mob Boneguard Footman
	.mob Boneguard Lieutenant
step
	>>使用 |T132358:0|tShield-Breaker (2) 杀死 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r
	.goto IcecrownGlacier,51.77,74.97,50,0
	.goto IcecrownGlacier,53.30,73.72,50,0
	.goto IcecrownGlacier,51.75,70.97,50,0
	.goto IcecrownGlacier,49.68,73.21,50,0
	.goto IcecrownGlacier,47.24,73.07,50,0
	.goto IcecrownGlacier,48.80,77.11,50,0
	.goto IcecrownGlacier,50.45,74.34,50,0
	.goto IcecrownGlacier,52.36,73.07,50,0
	.goto IcecrownGlacier,52.36,73.07
	.complete 13859,2 -- Boneguard Scout slain (10)
	.isOnQuest 13859
	.mob Boneguard Scout


step -- A Worthy Weapon v2
	>>|cRXP_WARN_记得装备你的武器|r
	>>在冰冠冰川和晶歌森林边界的铁墙大坝收集|cRXP_PICK_冬风信子|r
	>>它们从岩石中长出来
	.goto IcecrownGlacier,69.25,76.02,15,0
	.goto IcecrownGlacier,70.05,75.19,15,0
	.goto IcecrownGlacier,71.07,73.20,15,0
	.goto IcecrownGlacier,72.07,73.02,15,0
	.goto IcecrownGlacier,73.42,73.59,15,0
	.goto IcecrownGlacier,69.25,76.02
	.collect 45000,4
	.isOnQuest 13784
step
	#completewith next
	.goto Dragonblight,93.18,26.00
	.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
	.isOnQuest 13784
step
	.goto Dragonblight,93.18,26.00
	.use 45000 >>在德拉克玛湖中心使用背包中的 |T134195:0|t|cFFFFFF99冬风信子|r
	>>等待德拉克玛少女角色扮演然后拾取|cRXP_PICK_德拉克玛之刃|r
	.cast 62629
	.timer 21,Maiden of Drak'Mar Roleplay
	.complete 13784,1 -- Blade of Drak'Mar (1)
	.isOnQuest 13784

step -- The Edge Of Winter v2
	#completewith next
	.goto CrystalsongForest,55.05,75.04
	.zone CrystalsongForest >>前往晶歌森林
	.isOnQuest 13785
step
	.goto CrystalsongForest,55.05,75.04
	>>|cRXP_WARN_记得装备你的武器|r
	>>杀死 |cRXP_ENEMY_Lord Everblaze|r。从他身上搜刮 |cRXP_LOOT_Everburning Ember|r
	.collect 45005,1 -- Everburning Ember
	.mob Lord Everblaze
	.isOnQuest 13785
step
	#completewith next
	.goto HowlingFjord,42.18,19.65
	.zone HowlingFjord >>前往嚎风峡湾北部的冬息湖
	.isOnQuest 13785
step
	.goto HowlingFjord,42.18,19.65
	.use 45005 >>使用背包中的 |T135488:0|t|c99ffff99Everburning Ember|r 释放冬息湖的少女
	.complete 13785,1 -- Winter's Edge (1)
	.target Maiden of Winter's Breath Lake
	.isOnQuest 13785

step -- A Blade Fit For A Champion v2
	#completewith next
	.goto Grizzly Hills,60.83,51.36
	.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
	.isOnQuest 13783
step
	.goto Grizzly Hills,60.83,51.36,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,61.89,48.56,10,0
	.goto Grizzly Hills,61.12,49.52,10,0
	.goto Grizzly Hills,60.75,50.46,10,0
	.goto Grizzly Hills,61.89,48.56
	.use 44986 >>在尝试 /亲吻 Lake Frogs 之前，请先 |c99ffff99Warts-B-Gone 润唇膏|r 放在您的包里 |c99ffff99everytime|r
	>>瞄准湖蛙即可自动亲吻它们。如果不起作用，请输入 /kiss
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t最终，其中一只湖蛙会变成人类。与它交谈可获得 |cRXP_PICK_Ashwood Brand|r
	>>|cRXP_WARN_记得装备你的武器|r
	.emote KISS,33211
	.emote KISS,33224
	.skipgossip
	.complete 13783,1 -- Ashwood Brand (1)
	.target Lake Frog
	.target Maiden of Ashwood Lake
	.isOnQuest 13783
step
	.goto IcecrownGlacier,76.27,24.38,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地
	.isOnQuest 13783,13785,13784,13786,13787,13859
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r, |cRXP_FRIENDLY_克希尔·炎枪|r, |cRXP_FRIENDLY_安妮拉·索隆|r
	.turnin 13783 >>交任务: |cRXP_FRIENDLY_冠军的利剑|r
	.goto IcecrownGlacier,76.45,23.85
	.turnin 13786 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.41,23.75
	.turnin 13787 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13859 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,23.93
	.target Eressea Dawnsinger
	.target Kethiel Sunlance
	.target Aneera Thuron
	.isQuestComplete 13783 -- A Blade Fit For A Champion
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r, |cRXP_FRIENDLY_克希尔·炎枪|r, |cRXP_FRIENDLY_安妮拉·索隆|r
	.turnin 13785 >>交任务: |cRXP_FRIENDLY_冬之利刃|r
	.goto IcecrownGlacier,76.45,23.85
	.turnin 13786 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.41,23.75
	.turnin 13787 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13859 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,23.93
	.target Eressea Dawnsinger
	.target Kethiel Sunlance
	.target Aneera Thuron
	.isQuestComplete 13785 -- The Edge Of Winter
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r, |cRXP_FRIENDLY_克希尔·炎枪|r, |cRXP_FRIENDLY_安妮拉·索隆|r
	.turnin 13784 >>交任务: |cRXP_FRIENDLY_珍贵的武器|r
	.goto IcecrownGlacier,76.45,23.85
	.turnin 13786 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.41,23.75
	.turnin 13787 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin 13859 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,23.93
	.target Eressea Dawnsinger
	.target Kethiel Sunlance
	.target Aneera Thuron
	.isQuestComplete 13784 -- A Worthy Weapon
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克希尔·炎枪|r, |cRXP_FRIENDLY_安妮拉·索隆|r
	.turnin -13786 >>交任务: |cRXP_FRIENDLY_勇士的实战训练|r
	.goto IcecrownGlacier,76.41,23.75
	.turnin -13787 >>交任务: |cRXP_FRIENDLY_总决赛|r
	.turnin -13859 >>交任务: |cRXP_FRIENDLY_兵临城下|r
	.goto IcecrownGlacier,76.52,23.93
	.target Kethiel Sunlance
	.target Aneera Thuron
step -- Checking if they have 25 Valiant's Seals after a set of turn ins.
	>>为了完成任务 |cFFffff00The Valiant's Charge|r 并通过 |T236690:0|t银色锦标赛 Grounds，你必须完成每日任务并获得 |T133441:0|t|c99CCFFFFValiant's Seal|r
	>>您需要 |T133441:0|t|c99CCFFFF25 勇士印章|r。完成 4 个日常任务后，您每天可获得 5 个
	>>|c99ffff99如果您仍然需要完成每日任务，请在第二天重新加载指南，直到您可以完成此任务|r。
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r
	.goto IcecrownGlacier,76.45,23.85
	.complete 13722,1 >>交任务: |cRXP_FRIENDLY_勇士之战|r -- Valiant's Seal (25)
	.turnin 13722 >>交任务: |cRXP_FRIENDLY_勇士之战|r
	.accept 13731 >>接任务: |cRXP_WARN_勇士的挑战|r
	.target Eressea Dawnsinger
step -- The Valiant's Challenge
	#completewith next
	.vehicle >>装备背包中的|T135128:0|t|c99ffff99部落长枪|r，然后骑上马厩中的银月陆行鸟
	>>如果你丢失了 |T135128:0|t|c99ffff99Horde Lance|r，你可以在亭子里再拿一个
	.goto IcecrownGlacier,75.54,24.14
	.use 46070
	.target Stabled Silvermoon Hawkstrider
	.isOnQuest 13731
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从丹尼|r
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>等待 |cRXP_ENEMY_Argent Champion|r 到达然后击败它
	.goto IcecrownGlacier,68.60,20.99
	.complete 13731,1 -- Argent Champion defeated (1)
	.skipgossip
	.timer 12,Argent Champion Arrival
	.mob Argent Champion
	.isOnQuest 13731
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃蕾希·晨歌|r
	.goto IcecrownGlacier,76.45,23.85
	.turnin 13731 >>交任务: |cRXP_FRIENDLY_勇士的挑战|r
	.target Eressea Dawnsinger
step
	.goto IcecrownGlacier,76.17,24.21
	+|cRXP_WARN_你现在是|T255136:0|t银月城的勇士！|r
	>>|cRXP_LOOT_您现在已经完成银月城冠军指南！|r
	>>|cRXP_LOOT_你现在可以选择成为|r |cRXP_WARN_Champion|r |cRXP_LOOT_of another|r |cRXP_WARN_Race|r|cRXP_LOOT_|r
	>>|cRXP_LOOT_加载 |cRXP_FRIENDLY_2.0|r 指南，了解您选择接下来要追求的|r |cRXP_WARN_Race|r |cRXP_LOOT_！|r
	>>|cRXP_LOOT_OR
	>>|cRXP_LOOT_你可以开始|r |cRXP_ENEMY_3.0|r |cRXP_LOOT_Champion 每日任务|r
	.isQuestTurnedIn 13731
]])



RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name G_2.1_AT_黑骑士的任务故事
#displayname |cRXP_PICK_2.1|r - The Black Knight's Quest Story

step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_北伐军战士莱达拉|r
	.goto IcecrownGlacier,69.43,23.02
	.accept 13633 >>接任务: |cRXP_WARN_西部荒野的黑骑士？|r << Alliance
	.accept 13634 >>接任务: |cRXP_WARN_银松森林的黑骑士？|r << Horde
	.target Crusader Rhydalla
step << Mage
	.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r << Alliance
	.zone Undercity >>前往: |cRXP_PICK_幽暗城|r << Horde
	.isOnQuest 13633,13634
step << Alliance !Mage
    .goto Dalaran,40.11,62.81
	.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
	.isOnQuest 13633
step << Alliance
	#completewith next
	.goto StormwindClassic,66.2,62.2
	.fly Westfall >>飞往西部荒野
	.isOnQuest 13633
step << Alliance
	>>前往 Moonbrook。拾取屋内的 |cRXP_PICK_Dusty Journal|r
	.goto Westfall,42.09,69.66
	.complete 13633,1 -- Dusty Journal (1)
	.isOnQuest 13633
step << Horde !Mage
    .goto Dalaran,55.64,23.85
	.zone Undercity >>前往: |cRXP_PICK_幽暗城|r
	.isOnQuest 13634
step << Horde
	#completewith next
	.goto Undercity,63.25,48.56
	.fly Silverpine >>飞往银松森林
	.isOnQuest 13634
step << Horde
	>>前往瓦尔甘的田野。拾取屋内的 |cRXP_PICK_Dusty Journal|r
	.goto Silverpine Forest,52.85,27.92,8,0
	.goto Silverpine Forest,53.17,28.10
	.complete 13634,1 -- Dusty Journal (1)
	.isOnQuest 13634
step << Mage
	#completewith next
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
	.isOnQuest 13633,13634
step
	#completewith next
	.goto IcecrownGlacier,69.43,23.02,500 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地
	.isOnQuest 13633,13634
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_北伐军战士莱达拉|r
	.goto IcecrownGlacier,69.43,23.02
	.turnin 13633 >>交任务: |cRXP_FRIENDLY_西部荒野的黑骑士？|r << Alliance
	.turnin 13634 >>交任务: |cRXP_FRIENDLY_银松森林的黑骑士？|r << Horde
	.accept 13641 >>接任务: |cRXP_WARN_先知的水晶|r
	.target Crusader Rhydalla
step << Mage
	#completewith next
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
	.isOnQuest 13641
step
	#completewith next
	.isOnQuest 13641
	.goto CrystalsongForest,43.90,40.07
	.zone CrystalsongForest >>前往晶歌森林
step
	>>杀死 |cRXP_ENEMY_Unbound Seers|r。掠夺他们以获得 |cRXP_LOOT_Seer's Crystal|r
	.goto CrystalsongForest,43.90,40.07,30,0
	.goto CrystalsongForest,46.04,40.87,30,0
	.goto CrystalsongForest,48.62,39.37,30,0
	.goto CrystalsongForest,42.57,49.12,30,0
	.goto CrystalsongForest,46.04,40.87
	.complete 13641,1 -- Seer's Crystal (1)
	.mob Unbound Seer
step
	#completewith next
	.goto IcecrownGlacier,69.43,23.02,500 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地
	.isOnQuest 13641
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_北伐军战士莱达拉|r
	.goto IcecrownGlacier,69.43,23.02
	.turnin 13641 >>交任务: |cRXP_FRIENDLY_先知的水晶|r
	.accept 13643 >>接任务: |cRXP_WARN_死者讲述的故事|r
	.target Crusader Rhydalla
step
	>>向东前往 |T236690:0|t银色锦标赛场地的墓地
	.use 45070 >>使用 |T132775:0|t|cFFFFFF99预言家水晶|r 放在你的墓穴包里
	.complete 13643,1 -- Sir Wendell Balfour's death investigated
	.goto IcecrownGlacier,79.37,23.09
	.complete 13643,3 -- Conall Irongrip's death investigated
	.goto IcecrownGlacier,79.64,22.85
	.complete 13643,2 -- Lorien Sunblaze's death investigated
	.goto IcecrownGlacier,79.63,23.57
	.isOnQuest 13643
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_北伐军战士莱达拉|r
	.goto IcecrownGlacier,69.43,23.02
	.turnin 13643 >>交任务: |cRXP_FRIENDLY_死者讲述的故事|r
	.accept 13654 >>接任务: |cRXP_WARN_怪异的侍从|r
	.target Crusader Rhydalla
step << Mage
	#completewith next
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
	.isOnQuest 13654
step
	#completewith next
	.isOnQuest 13654
	.goto CrystalsongForest,37.48,57.47
	.zone CrystalsongForest >>前往晶歌森林
step
	>>杀死 |cRXP_ENEMY_Skeletal Woodcutters|r。掠夺他们以获得 |cRXP_LOOT_Large Femur|r
	.goto CrystalsongForest,37.48,57.47,15,0
	.goto CrystalsongForest,36.68,61.93,15,0
	.goto CrystalsongForest,40.81,60.25,15,0
	.goto CrystalsongForest,38.17,57.37,15,0
	.goto CrystalsongForest,36.68,61.93
	.collect 45080,1 -- Large Femur
	.mob Skeletal Woodcutter
	.isOnQuest 13654
step
	>>|cRXP_WARN_站在 MALORIC 后面|r
	.use 45080 >>使用 |T133727:0|t|cFFFFFF99大股骨|r 放在 |cRXP_ENEMY_Maloric|r 上的背包中
	>>当他失去行动能力后，抢夺他的 |cRXP_LOOT_Murderer's Toolkit|r
	.goto CrystalsongForest,38.19,59.49
	.complete 13654,1 -- Murderer's Toolkit (1)
	.isOnQuest 13654
	.mob Maloric
step
	#completewith next
	.goto IcecrownGlacier,69.43,23.02,500 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地
	.isOnQuest 13654
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_北伐军战士莱达拉|r
	.goto IcecrownGlacier,69.43,23.02
	.turnin 13654 >>交任务: |cRXP_FRIENDLY_怪异的侍从|r
	.accept 13663 >>接任务: |cRXP_WARN_黑骑士的命令|r
	.target Crusader Rhydalla
step
	.use 45083 >>使用 |T133331:0|t|cFFFFFF99 附魔缰绳|r 放在你包里，骑上 |cRXP_FRIENDLY_黑骑士的狮鹫|r
	>>Gryphon RP 大约需要 1 分 40 秒
	.goto IcecrownGlacier,77.77,21.61
	.cast 63163
	.timer 100,Black Knight's Gryphon RP
	.complete 13663,1 -- Black Knight's Gryphon taken
	.isOnQuest 13663
	.target Black Knight's Gryphon
step
	>>拾取小屋内的 |cRXP_LOOT_被盗的锦标赛邀请函|r 和 |cRXP_LOOT_黑骑士的命令|r
	.complete 13663,2 -- Stolen Tournament Invitation
	.goto IcecrownGlacier,54.07,8.66
	.complete 13663,3 -- Black Knight's Orders
	.goto IcecrownGlacier,54.10,8.63
	.isOnQuest 13663
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_北伐军战士莱达拉|r
	.goto IcecrownGlacier,69.43,23.02
	.turnin 13663 >>交任务: |cRXP_FRIENDLY_黑骑士的命令|r
	.target Crusader Rhydalla
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_北伐军战士莱达拉|r
	>>注意：接受此任务需要您成为 |cRXP_WARN_Champion|r。如果您无法接受此任务，则必须完成 |cRXP_LOOT_1.0|r 成为冠军指南
	.goto IcecrownGlacier,69.43,23.02
	.accept 13664 >>接任务: |cRXP_WARN_黑骑士之死|r
	.target Crusader Rhydalla
step
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Alliance Lance|r 然后骑上 |cRXP_FRIENDLY_Argent Warhorse|r << Alliance
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上 |cRXP_FRIENDLY_Argent Warhorse|r << Horde
	>>如果你玩错了 |T135128:0|t|c99ffff99Lance|r，马厩里到处都有架子
	.use 46069 << Alliance
	.use 46070 << Horde
	.goto IcecrownGlacier,72.30,22.55
	.target Stabled Argent Warhorse
	.isOnQuest 13664
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_侍从加文|r
	>>记得使用 |T132360:0|tDefend (4)。如果在射程内，请使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1) 和 |T132358:0|tShield-Breaker (2)
	>>|cRXP_ENEMY_黑骑士|r 一旦他的 HP 达到 0，他就会从你身上下来
	>>|cRXP_WARN_记得装备你的武器！|r
	>>杀死 |cRXP_ENEMY_黑骑士|r
	.goto IcecrownGlacier,71.35,23.14
	.complete 13664,1 -- The Black Knight slain
	.skipgossip
	.timer 14,The Black Knight Arrival
	.target Squire Cavin
	.mob The Black Knight
	.isOnQuest 13664
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_北伐军战士莱达拉|r
	.goto IcecrownGlacier,69.43,23.02
	.turnin 13664 >>交任务: |cRXP_FRIENDLY_黑骑士之死|r
	.target Crusader Rhydalla

step -- 14016 and 14017 added in 3.2 - Add in Phase 3
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_北伐军战士莱达拉|r
	.goto IcecrownGlacier,69.43,23.02
	.accept 14016 >>接任务: |cRXP_WARN_黑骑士的诅咒|r
	.target Crusader Rhydalla
step
	>>向东前往 |T236690:0|t银色锦标赛场地的墓地
	>>在短暂的 RP 后杀死 |cRXP_ENEMY_Cult Assassin|r
	.goto IcecrownGlacier,79.50,23.27
	.complete 14016,1 -- Investigate the Black Knight's Grave
	.isOnQuest 14016
	.target Cult Assassin
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_北伐军战士莱达拉|r
	.goto IcecrownGlacier,69.43,23.02
	.turnin 14016 >>交任务: |cRXP_FRIENDLY_黑骑士的诅咒|r
	.accept 14017 >>接任务: |cRXP_WARN_黑骑士的命运|r
	.target Crusader Rhydalla
step
	>>向东飞到亡语者哨站
	>>杀死 |cRXP_ENEMY_Doctor Kolher|r。掠夺他的 |cRXP_LOOT_Orders|r
	>>他在站台上巡逻
	.goto IcecrownGlacier,61.19,22.41
	.complete 14017,1 -- Doctor Kohler's Orders (1)
	.isOnQuest 14017
	.target Doctor Kolher
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_北伐军战士莱达拉|r
	.goto IcecrownGlacier,69.43,23.02
	.turnin 14017 >>交任务: |cRXP_FRIENDLY_黑骑士的诅咒|r
	.target Crusader Rhydalla
step
	+|cRXP_WARN_这是|cRXP_ENEMY_黑骑士|r 故事的结束！
]])

RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name H_3_AT_冠军_每日任务
#displayname |cRXP_ENEMY_3.0|r - Champion Daily Quests

step
	>>要访问冠军每日任务，你必须完成|cRXP_LOOT_1.0|r成为冠军指南
	>>如果你不能接受任何任务，请确保它已经完成
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_裁决者玛蕾尔·图哈特|r
	.goto IcecrownGlacier,69.66,22.86
	.accept 13794 >>接任务: |cRXP_WARN_纯洁者耶德瑞克|r << !DK
	.accept 13795 >>接任务: |cRXP_WARN_科罗克·斩亡者|r << DK
	.target Justicar Mariel Trueheart
step << !DK
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纯洁者耶德瑞克|r
	.goto IcecrownGlacier,69.96,23.44
	.turnin 13794 >>交任务: |cRXP_FRIENDLY_纯洁者耶德瑞克|r
	.target Eadric the Pure
step << DK
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科罗克·斩亡者|r
	.goto IcecrownGlacier,73.80,20.06
	.turnin 13795 >>交任务: |cRXP_FRIENDLY_科罗克·斩亡者|r
	.target Crok Scourgebane
step << !DK
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纯洁者耶德瑞克|r, |cRXP_FRIENDLY_鲁莉|r, |cRXP_FRIENDLY_塞利安·碎日|r
	.daily 13682 >>接任务: |cRXP_WARN_空中的威胁|r << Alliance
	.daily 13809 >>接任务: |cRXP_WARN_空中的威胁|r << Horde
	.daily 13861 >>接任务: |cRXP_WARN_堡垒外的战斗|r << Alliance
	.daily 13862 >>接任务: |cRXP_WARN_堡垒外的战斗|r << Horde
	.goto IcecrownGlacier,69.96,23.44
	.daily 13790 >>接任务: |cRXP_WARN_冠军的比武|r << Alliance
	.daily 13811 >>接任务: |cRXP_WARN_冠军的比武|r << Horde
	.goto IcecrownGlacier,69.93,23.33
	.daily 13789 >>接任务: |cRXP_WARN_攻入敌阵|r << Alliance
	.daily 13810 >>接任务: |cRXP_WARN_攻入敌阵|r << Horde
	.goto IcecrownGlacier,69.92,23.53
	.isQuestTurnedIn 13664 -- Must complete 13664 to accept Threat From Above
	.target Eadric the Pure
	.target Luuri
	.target Cellian Daybreak
step << !DK
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纯洁者耶德瑞克|r, |cRXP_FRIENDLY_鲁莉|r, |cRXP_FRIENDLY_塞利安·碎日|r
	.daily 13861 >>接任务: |cRXP_WARN_堡垒外的战斗|r << Alliance
	.daily 13862 >>接任务: |cRXP_WARN_堡垒外的战斗|r << Horde
	.goto IcecrownGlacier,69.96,23.44
	.daily 13790 >>接任务: |cRXP_WARN_冠军的比武|r << Alliance
	.daily 13811 >>接任务: |cRXP_WARN_冠军的比武|r << Horde
	.goto IcecrownGlacier,69.93,23.33
	.daily 13789 >>接任务: |cRXP_WARN_攻入敌阵|r << Alliance
	.daily 13810 >>接任务: |cRXP_WARN_攻入敌阵|r << Horde
	.goto IcecrownGlacier,69.92,23.53
	.target Eadric the Pure
	.target Luuri
	.target Cellian Daybreak
step << DK
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科罗克·斩亡者|r, |cRXP_FRIENDLY_伊尔蕾·夜幕|r, |cRXP_FRIENDLY_放血者佐尔比|r
	.daily 13788 >>接任务: |cRXP_WARN_空中的威胁|r << Alliance
	.daily 13812 >>接任务: |cRXP_WARN_空中的威胁|r << Horde
	.daily 13864 >>接任务: |cRXP_WARN_堡垒外的战斗|r << Alliance
	.daily 13863 >>接任务: |cRXP_WARN_堡垒外的战斗|r << Horde
	.goto IcecrownGlacier,73.80,20.06
	.daily 13793 >>接任务: |cRXP_WARN_冠军的比武|r << Alliance
	.daily 13814 >>接任务: |cRXP_WARN_冠军的比武|r << Horde
	.goto IcecrownGlacier,73.59,20.08
	.daily 13791 >>接任务: |cRXP_WARN_攻入敌阵|r << Alliance
	.daily 13813 >>接任务: |cRXP_WARN_攻入敌阵|r << Horde
	.goto IcecrownGlacier,73.80,19.45
	.isQuestTurnedIn 13664
	.target Crok Scourgebane
	.target Illyrie Nightfall
	.target Zor'be the Bloodletter
step << DK
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科罗克·斩亡者|r, |cRXP_FRIENDLY_伊尔蕾·夜幕|r, |cRXP_FRIENDLY_放血者佐尔比|r
	.daily 13864 >>接任务: |cRXP_WARN_堡垒外的战斗|r << Alliance
	.daily 13863 >>接任务: |cRXP_WARN_堡垒外的战斗|r << Horde
	.goto IcecrownGlacier,73.80,20.06
	.daily 13793 >>接任务: |cRXP_WARN_冠军的比武|r << Alliance
	.daily 13814 >>接任务: |cRXP_WARN_冠军的比武|r << Horde
	.goto IcecrownGlacier,73.59,20.08
	.daily 13791 >>接任务: |cRXP_WARN_攻入敌阵|r << Alliance
	.daily 13813 >>接任务: |cRXP_WARN_攻入敌阵|r << Horde
	.goto IcecrownGlacier,73.80,19.45
	.target Crok Scourgebane
	.target Illyrie Nightfall
	.target Zor'be the Bloodletter
step << !DK Alliance -- Among the Champions
	#completewith next
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上马厩中的埃索达雷象 << Draenei
	.vehicle >>在你的背包中装备|T135128:0|t|c99ffff99联盟长矛|r，然后骑上马厩里的铁炉堡公羊 << Dwarf
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上停在马厩里的诺莫瑞根机械陆行鸟 << Gnome
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上马厩中的暴风城骏马 << Human
	.vehicle >>装备背包中的|T135128:0|t|c99ffff99联盟长枪|r，然后骑上马厩里的达纳苏斯夜刃豹 << NightElf
	>>如果你玩错了 |T135128:0|t|c99ffff99Alliance Lance|r，马厩里到处都有架子
	.goto IcecrownGlacier,71.56,22.41 << Human
	.goto IcecrownGlacier,71.62,22.50 << NightElf
	.goto IcecrownGlacier,71.68,22.38 << Draenei
	.goto IcecrownGlacier,71.80,22.50 << Dwarf
	.goto IcecrownGlacier,71.93,22.51 << Gnome
	.use 46069
	.target Stabled Exodar Elekk << Draenei
	.target Stabled Ironforge Ram << Dwarf
	.target Stabled Gnomeregan Mechanostrider << Gnome
	.target Stabled Stormwind Steed << Human
	.target Stabled Darnassian 夜刃豹 << NightElf
	.isOnQuest 13790
step << !DK Alliance -- Among the Champions
	>>前往冠军之环
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Champion|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Champion|r 4 次
	.goto IcecrownGlacier,71.67,23.21,10,0
	.goto IcecrownGlacier,72.03,23.22,10,0
	.goto IcecrownGlacier,72.36,23.25,10,0
	.goto IcecrownGlacier,72.52,24.15,10,0
	.goto IcecrownGlacier,72.15,24.49,10,0
	.goto IcecrownGlacier,71.66,24.48,10,0
	.goto IcecrownGlacier,71.22,24.51,10,0
	.goto IcecrownGlacier,70.91,24.39,10,0
	.goto IcecrownGlacier,70.76,23.63,10,0
	.goto IcecrownGlacier,71.00,23.19
	.complete 13790,1 -- Mark of the Champion (4)
	.isOnQuest 13790
	.skipgossip
	.mob Stormwind Champion
	.mob Ironforge Champion
	.mob Gnomeregan Champion
	.mob Darnassus Champion
	.mob Exodar Champion
	.mob Thunder Bluff Champion
	.mob Silvermoon Champion
	.mob Sen'jin Champion
	.mob Orgrimmar Champion
	.mob Undercity Champion
step << !DK Horde -- Among the Champions
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上马厩中的被遗忘者战马 << Scourge
	.vehicle >>在你的背包中装备|T135128:0|t|c99ffff99部落枪骑兵|然后骑上马厩里的奥格瑞玛狼 << Orc
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lancer|然后骑上马厩里的雷霆崖科多兽 << Tauren
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上马厩里的暗矛迅猛龙 << Troll
	.vehicle >>装备背包中的|T135128:0|t|c99ffff99部落长枪|r，然后骑上马厩中的银月陆行鸟 << BloodElf
	>>如果你丢失了你的|T135128:0|t|c99ffff99Horde Lance|r，马厩里有架子
	.goto IcecrownGlacier,72.04,22.54 << Troll
	.goto IcecrownGlacier,72.08,22.45 << Scourge
	.goto IcecrownGlacier,72.17,22.53 << Orc
	.goto IcecrownGlacier,72.20,22.46 << BloodElf
	.goto IcecrownGlacier,71.86,22.39 << Tauren
	.use 46070
	.target Stabled Forsaken Warhorse << Scourge
	.target Stabled Orgrimmar Wolf << Orc
	.target Stabled Thunder Bluff Kodo << Tauren
	.target Stabled Darkspear Raptor << Troll
	.target Stabled Silvermoon Hawkstrider << BloodElf
	.isOnQuest 13811
step << !DK Horde -- Among the Champions
	>>前往冠军之环
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Champion|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Champion|r 4 次
	.goto IcecrownGlacier,71.67,23.21,10,0
	.goto IcecrownGlacier,72.03,23.22,10,0
	.goto IcecrownGlacier,72.36,23.25,10,0
	.goto IcecrownGlacier,72.52,24.15,10,0
	.goto IcecrownGlacier,72.15,24.49,10,0
	.goto IcecrownGlacier,71.66,24.48,10,0
	.goto IcecrownGlacier,71.22,24.51,10,0
	.goto IcecrownGlacier,70.91,24.39,10,0
	.goto IcecrownGlacier,70.76,23.63,10,0
	.goto IcecrownGlacier,71.00,23.19
	.complete 13811,1 -- Mark of the Champion (4)
	.isOnQuest 13811
	.skipgossip
	.mob Stormwind Champion
	.mob Ironforge Champion
	.mob Gnomeregan Champion
	.mob Darnassus Champion
	.mob Exodar Champion
	.mob Thunder Bluff Champion
	.mob Silvermoon Champion
	.mob Sen'jin Champion
	.mob Orgrimmar Champion
	.mob Undercity Champion
step << DK Alliance -- Among the Champions
	#completewith next
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上马厩中的埃索达雷象 << Draenei
	.vehicle >>在你的背包中装备|T135128:0|t|c99ffff99联盟长矛|r，然后骑上马厩里的铁炉堡公羊 << Dwarf
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上停在马厩里的诺莫瑞根机械陆行鸟 << Gnome
	.vehicle >>装备 |T135128:0|t|c99ffff99Alliance Lance|r 到你的背包中然后骑上马厩中的暴风城骏马 << Human
	.vehicle >>装备背包中的|T135128:0|t|c99ffff99联盟长枪|r，然后骑上马厩里的达纳苏斯夜刃豹 << NightElf
	>>如果你玩错了 |T135128:0|t|c99ffff99Alliance Lance|r，马厩里到处都有架子
	.goto IcecrownGlacier,71.56,22.41 << Human
	.goto IcecrownGlacier,71.62,22.50 << NightElf
	.goto IcecrownGlacier,71.68,22.38 << Draenei
	.goto IcecrownGlacier,71.80,22.50 << Dwarf
	.goto IcecrownGlacier,71.93,22.51 << Gnome
	.use 46069
	.target Stabled Exodar Elekk << Draenei
	.target Stabled Ironforge Ram << Dwarf
	.target Stabled Gnomeregan Mechanostrider << Gnome
	.target Stabled Stormwind Steed << Human
	.target Stabled Darnassian 夜刃豹 << NightElf
	.isOnQuest 13793
step << DK Alliance -- Among the Champions
	>>前往冠军之环
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Champion|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Champion|r 4 次
	.goto IcecrownGlacier,71.67,23.21,10,0
	.goto IcecrownGlacier,72.03,23.22,10,0
	.goto IcecrownGlacier,72.36,23.25,10,0
	.goto IcecrownGlacier,72.52,24.15,10,0
	.goto IcecrownGlacier,72.15,24.49,10,0
	.goto IcecrownGlacier,71.66,24.48,10,0
	.goto IcecrownGlacier,71.22,24.51,10,0
	.goto IcecrownGlacier,70.91,24.39,10,0
	.goto IcecrownGlacier,70.76,23.63,10,0
	.goto IcecrownGlacier,71.00,23.19
	.complete 13793,1 -- Mark of the Champion (4)
	.isOnQuest 13793
	.skipgossip
	.mob Stormwind Champion
	.mob Ironforge Champion
	.mob Gnomeregan Champion
	.mob Darnassus Champion
	.mob Exodar Champion
	.mob Thunder Bluff Champion
	.mob Silvermoon Champion
	.mob Sen'jin Champion
	.mob Orgrimmar Champion
	.mob Undercity Champion
step << DK Horde -- Among the Champions
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上马厩中的被遗忘者战马 << Scourge
	.vehicle >>在你的背包中装备|T135128:0|t|c99ffff99部落枪骑兵|然后骑上马厩里的奥格瑞玛狼 << Orc
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lancer|然后骑上马厩里的雷霆崖科多兽 << Tauren
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上马厩里的暗矛迅猛龙 << Troll
	.vehicle >>装备背包中的|T135128:0|t|c99ffff99部落长枪|r，然后骑上马厩中的银月陆行鸟 << BloodElf
	>>如果你丢失了你的|T135128:0|t|c99ffff99Horde Lance|r，马厩里有架子
	.goto IcecrownGlacier,72.04,22.54 << Troll
	.goto IcecrownGlacier,72.08,22.45 << Scourge
	.goto IcecrownGlacier,72.17,22.53 << Orc
	.goto IcecrownGlacier,72.20,22.46 << BloodElf
	.goto IcecrownGlacier,71.86,22.39 << Tauren
	.use 46070
	.target Stabled Forsaken Warhorse << Scourge
	.target Stabled Orgrimmar Wolf << Orc
	.target Stabled Thunder Bluff Kodo << Tauren
	.target Stabled Darkspear Raptor << Troll
	.target Stabled Silvermoon Hawkstrider << BloodElf
	.isOnQuest 13814
step << DK Horde -- Among the Champions
	>>前往冠军之环
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to any |cRXP_ENEMY_Champion|r. They can all be challenged to a Duel
	>>记得在决斗期间使用 |T132360:0|tDefend (4) 并保持其堆叠
	>>使用 |T132358:0|tShield-Breaker (2) 不断移除 |T132360:0|tDefend 堆叠，避免 |cRXP_ENEMY_Champion|r
	>>一旦 |cRXP_ENEMY_Champion|r 上的 |T132360:0|tDefend 堆叠已用完，请在近战范围内使用 |T132226:0|tCharge (3) 以及 |T135375:0|tThrust (1)
	>>决斗结束时使用 |T134058:0|tRefresh Mount (5) 恢复满血
	>>在决斗中击败不同的|cRXP_ENEMY_Champion|r 4 次
	.goto IcecrownGlacier,71.67,23.21,10,0
	.goto IcecrownGlacier,72.03,23.22,10,0
	.goto IcecrownGlacier,72.36,23.25,10,0
	.goto IcecrownGlacier,72.52,24.15,10,0
	.goto IcecrownGlacier,72.15,24.49,10,0
	.goto IcecrownGlacier,71.66,24.48,10,0
	.goto IcecrownGlacier,71.22,24.51,10,0
	.goto IcecrownGlacier,70.91,24.39,10,0
	.goto IcecrownGlacier,70.76,23.63,10,0
	.goto IcecrownGlacier,71.00,23.19
	.complete 13814,1 -- Mark of the Champion (4)
	.isOnQuest 13814
	.skipgossip
	.mob Stormwind Champion
	.mob Ironforge Champion
	.mob Gnomeregan Champion
	.mob Darnassus Champion
	.mob Exodar Champion
	.mob Thunder Bluff Champion
	.mob Silvermoon Champion
	.mob Sen'jin Champion
	.mob Orgrimmar Champion
	.mob Undercity Champion
step
	#completewith next
	.goto IcecrownGlacier,55.23,32.26,60 >>|cRXP_WARN_记得装备你的武器！|r
	.isOnQuest 13789,13810,13791,13813
step -- Taking Battle To The Enemy
	>>杀死任意 |cRXP_ENEMY_Cult of the Damned|r 成员
	>>其中包括 |cRXP_ENEMY_Blackguards|r、|cRXP_ENEMY_Torturers|r、|cRXP_ENEMY_Alchemists|r 或 |cRXP_ENEMY_Apothecary|r
	.goto IcecrownGlacier,55.23,32.26,60,0
	.goto IcecrownGlacier,53.47,33.10,60,0
	.goto IcecrownGlacier,53.98,35.81,60,0
	.goto IcecrownGlacier,52.25,33.90,60,0
	.goto IcecrownGlacier,50.66,33.76,60,0
	.goto IcecrownGlacier,48.95,34.32,60,0
	.goto IcecrownGlacier,49.22,31.45,60,0
	.goto IcecrownGlacier,55.23,32.26
	.complete 13789,1 << !DK Alliance -- Cult of the Damned member slain (15)
	.complete 13810,1 << !DK Horde -- Cult of the Damned member slain (15)
	.complete 13791,1 << DK Alliance -- Cult of the Damned member slain (15)
	.complete 13813,1 << DK Horde -- Cult of the Damned member slain (15)
	.isOnQuest 13789,13810,13791,13813
	.mob Cult Blackguard
	.mob Overseer Jhaeqon
	.mob Vile Torturer
	.mob Damned Apothecary
	.mob Cult Alchemist
	.mob Overseer Savryn
step -- Threat From Above
	.goto IcecrownGlacier,47.12,33.26,65,0
	.goto IcecrownGlacier,45.72,35.25,65,0
	.goto IcecrownGlacier,43.85,33.47,65,0
	.goto IcecrownGlacier,45.42,31.95,65,0
	.goto IcecrownGlacier,47.12,33.26
    .line IcecrownGlacier,45.11,31.99,45.80,32.16,46.19,32.24,46.58,32.39,46.93,32.75,47.05,33.02,47.23,33.61,46.91,34.13,46.47,35.04,45.98,35.23,45.42,35.43,44.80,34.97,44.09,34.04,43.85,33.00,44.37,32.12,45.11,31.99
	>>寻找在空中飞翔的 |cRXP_ENEMY_Chillmaw|r
	>>杀死 |cRXP_ENEMY_Chillmaw|r 和 |cRXP_ENEMY_Cultist Bombardiers|r。|cRXP_ENEMY_Cultist Bombardiers|r 会在 |cRXP_ENEMY_Chillmaw|r 的生命值减少时跳下来与你战斗
	>>这个任务非常困难。如果需要，可以找一个团队来完成。如果你找不到团队或无法单独完成，可以跳过此步骤。
	.complete 13682,1 << !DK Alliance -- Chillmaw slain (1)
	.complete 13682,2 << !DK Alliance -- Cultist Bombardier slain (3)
	.complete 13809,1 << !DK Horde -- Chillmaw slain (1)
	.complete 13809,2 << !DK Horde -- Cultist Bombardier slain (3)
	.complete 13788,1 << DK Alliance -- Chillmaw slain (1)
	.complete 13788,2 << DK Alliance -- Cultist Bombardier slain (3)
	.complete 13812,1 << DK Horde -- Chillmaw slain (1)
	.complete 13812,2 << DK Horde -- Cultist Bombardier slain (3)
	.isOnQuest 13682,13809,13788,13812
	.unitscan Boneguard Commander
	.mob Cultist Bombardier
step -- Battle Before The Citadel
	#completewith next
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Alliance Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r << Alliance
	.vehicle >>在你的背包中装备 |T135128:0|t|c99ffff99Horde Lance|r 然后骑上 |cRXP_FRIENDLY_Stabled Campaign Warhorse|r << Horde
	>>如果你需要另一个，路障旁边有一个|T135128:0|t|c99ffff99Lance Rack|r
	.goto IcecrownGlacier,48.87,71.78
	.use 46069 << Alliance
	.use 46070 << Horde
	.isOnQuest 13861,13862,13864,13863
	.target Stabled Campaign Warhorse
step -- Battle Before The Citadel
	>>杀死 |cRXP_ENEMY_Boneguard 指挥官|r
	>>获得 |T132360:0|tDefend (4) 的堆叠并维持。使用 |T132358:0|tShield-Breaker (2) 移除其护盾，然后使用 |T132226:0|tCharge (3) 和 |T135375:0|tThrust (1)
	>>你可以使用你的 |cRXP_FRIENDLY_Warhorse|r 碾过并立即杀死令人讨厌的 |cRXP_ENEMY_Footmen|r
	>>使用 |T132358:0|tShield-Breaker (2) 对付任何 |cRXP_ENEMY_Boneguard Scouts (飞行石像鬼)|r 攻击
	.goto IcecrownGlacier,50.42,76.30,40,0
	.goto IcecrownGlacier,50.86,77.73,40,0
	.goto IcecrownGlacier,51.44,79.44,40,0
	.goto IcecrownGlacier,50.42,76.30
	.complete 13861,1 << !DK Alliance -- Boneguard Commander slain (3)
	.complete 13862,1 << !DK Horde -- Boneguard Commander slain (3)
	.complete 13864,1 << DK Alliance -- Boneguard Commander slain (3)
	.complete 13863,1 << DK Horde -- Boneguard Commander slain (3)
	.isOnQuest 13861,13862,13864,13863
	.mob Boneguard Commander
step
	.goto IcecrownGlacier,69.96,23.44,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地 << !DK
	.isOnQuest 13682,13809,13861,13862,13790,13811,13789,13810
step
	.goto IcecrownGlacier,73.80,20.06,300 >>返回冰冠冰川的|T236690:0|t银色锦标赛场地 << DK
	.isOnQuest 13788,13812,13864,13863,13793,13814,13791,13813
step << !DK
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纯洁者耶德瑞克|r, |cRXP_FRIENDLY_鲁莉|r, |cRXP_FRIENDLY_塞利安·碎日|r
	.turnin 13682 >>交任务: |cRXP_FRIENDLY_空中的威胁|r << Alliance
	.turnin 13809 >>交任务: |cRXP_FRIENDLY_空中的威胁|r << Horde
	.turnin 13861 >>交任务: |cRXP_FRIENDLY_堡垒外的战斗|r << Alliance
	.turnin 13862 >>交任务: |cRXP_FRIENDLY_堡垒外的战斗|r << Horde
	.goto IcecrownGlacier,69.96,23.44
	.turnin 13790 >>交任务: |cRXP_FRIENDLY_冠军的比武|r << Alliance
	.turnin 13811 >>交任务: |cRXP_FRIENDLY_冠军的比武|r << Horde
	.goto IcecrownGlacier,69.93,23.33
	.turnin 13789 >>交任务: |cRXP_FRIENDLY_攻入敌阵|r << Alliance
	.turnin 13810 >>交任务: |cRXP_FRIENDLY_攻入敌阵|r << Horde
	.goto IcecrownGlacier,69.92,23.53
	.target Eadric the Pure
	.target Luuri
	.target Cellian Daybreak
	.isQuestComplete 13682 << Alliance
	.isQuestComplete 13809 << Horde
step << !DK
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纯洁者耶德瑞克|r, |cRXP_FRIENDLY_鲁莉|r, |cRXP_FRIENDLY_塞利安·碎日|r
	.turnin 13861 >>交任务: |cRXP_FRIENDLY_堡垒外的战斗|r << Alliance
	.turnin 13862 >>交任务: |cRXP_FRIENDLY_堡垒外的战斗|r << Horde
	.goto IcecrownGlacier,69.96,23.44
	.turnin 13790 >>交任务: |cRXP_FRIENDLY_冠军的比武|r << Alliance
	.turnin 13811 >>交任务: |cRXP_FRIENDLY_冠军的比武|r << Horde
	.goto IcecrownGlacier,69.93,23.33
	.turnin 13789 >>交任务: |cRXP_FRIENDLY_攻入敌阵|r << Alliance
	.turnin 13810 >>交任务: |cRXP_FRIENDLY_攻入敌阵|r << Horde
	.goto IcecrownGlacier,69.92,23.53
	.target Eadric the Pure
	.target Luuri
	.target Cellian Daybreak
step << DK
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科罗克·斩亡者|r, |cRXP_FRIENDLY_伊尔蕾·夜幕|r, |cRXP_FRIENDLY_放血者佐尔比|r
	.turnin 13788 >>交任务: |cRXP_FRIENDLY_空中的威胁|r << Alliance
	.turnin 13812 >>交任务: |cRXP_FRIENDLY_空中的威胁|r << Horde
	.turnin 13864 >>交任务: |cRXP_FRIENDLY_堡垒外的战斗|r << Alliance
	.turnin 13863 >>交任务: |cRXP_FRIENDLY_堡垒外的战斗|r << Horde
	.goto IcecrownGlacier,73.80,20.06
	.turnin 13793 >>交任务: |cRXP_FRIENDLY_冠军的比武|r << Alliance
	.turnin 13814 >>交任务: |cRXP_FRIENDLY_冠军的比武|r << Horde
	.goto IcecrownGlacier,73.59,20.08
	.turnin 13791 >>交任务: |cRXP_FRIENDLY_攻入敌阵|r << Alliance
	.turnin 13813 >>交任务: |cRXP_FRIENDLY_攻入敌阵|r << Horde
	.goto IcecrownGlacier,73.80,19.45
	.target Crok Scourgebane
	.target Illyrie Nightfall
	.target Zor'be the Bloodletter
	.isQuestComplete 13788 << Alliance
	.isQuestComplete 13812 << Horde
step << DK
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科罗克·斩亡者|r, |cRXP_FRIENDLY_伊尔蕾·夜幕|r, |cRXP_FRIENDLY_放血者佐尔比|r
	.turnin 13864 >>交任务: |cRXP_FRIENDLY_堡垒外的战斗|r << Alliance
	.turnin 13863 >>交任务: |cRXP_FRIENDLY_堡垒外的战斗|r << Horde
	.goto IcecrownGlacier,73.80,20.06
	.turnin 13793 >>交任务: |cRXP_FRIENDLY_冠军的比武|r << Alliance
	.turnin 13814 >>交任务: |cRXP_FRIENDLY_冠军的比武|r << Horde
	.goto IcecrownGlacier,73.59,20.08
	.turnin 13791 >>交任务: |cRXP_FRIENDLY_攻入敌阵|r << Alliance
	.turnin 13813 >>交任务: |cRXP_FRIENDLY_攻入敌阵|r << Horde
	.goto IcecrownGlacier,73.80,19.45
	.target Crok Scourgebane
	.target Illyrie Nightfall
	.target Zor'be the Bloodletter
step
	+|cRXP_WARN_您已完成今天的所有冠军每日任务！明天重新加载本指南以继续。|r
]])

-- The following are added in 3.2 - Implement in Phase 3

RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name I_3.1_AT_Crusader_Daily_Quests
#displayname |cRXP_ENEMY_3.1|r - Crusader Daily Quests

step
	#completewith next
	+|cRXP_WARN_第三阶段推出十字军日常任务|r
	>>要访问十字军日常任务，你必须获得以下成就：
	.achievement 2817 << Alliance
	.achievement 2816 << Horde
step
	>>进入银色亭阁
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶十字军艾德拉德|r, |cRXP_FRIENDLY_北伐军战士希瓦多恩|r
	.daily 14105,14101,14102,14104 >>接任务: |cRXP_WARN_亡语者卡罗斯|r
	>>|c99ffff99OR|r Drottinn Hrothgar
	>>|c99ffff99OR|r 唤雾者英瓦
	>>|c99ffff99OR|r 伤痕累累的奥诺尔夫
	.daily 14108,14107 >>接任务: |cRXP_WARN_猎捕海怪！|r
	>>|c99ffff99OR|r 堕落者的命运
	.goto Icecrown,69.51,23.15
	.target High Crusader Adelard
	.target Crusader Silverdawn
step
	.isOnQuest 14105
	>>前往亡语者哨站
	>>杀死 |cRXP_ENEMY_Deathspeaker Kharos|r
	.complete 14105,1
	.goto Icecrown,64.2,21.4
	.target Deathspeaker Kharos
step
	#completewith next
	.isOnQuest 14108
	.goto Icecrown,69.79,22.21,5 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_圈养的银色角鹰兽|r
	.skipgossip
step
	.isOnQuest 14108
	>>向 |cRXP_ENEMY_North Sea Kraken|r 和 |cRXP_ENEMY_Kvaldir Deepcallers|r 投掷 |c99ffff99Flaming Spears|r。
	.complete 14108,1
	.complete 14108,2
	.use 46954
	.mob North Sea Kraken
	.mob Kvaldir Deepcaller
step
	.isOnQuest 14101
	>>前往赫罗斯加登陆点 (Hrothgar's Landing) 的图阿利克纪念碑 (Tualiq Monuments)。
	>>使用 |c99ffff99克瓦迪尔战争号角|r
	>>杀死 |cRXP_ENEMY_Drottinn Hrothgar|r
	.complete 14101,1
	.use 47006
	.goto Hrothgar's Landing,50.4,15.6
	.target Drottinn Hrothgar
step
	.isOnQuest 14102
	>>前往赫罗斯加登陆点的唤雾者洞穴。
	>>使用|c99ffff99唤雾者的符咒|r
	>>杀死 |cRXP_ENEMY_Mistcaller Yngvar|r
	.complete 14102,1
	.use 47009
	.goto Hrothgar's Landing,43.8,24.6
	.target Mistcaller Yngvar
step
	.isOnQuest 14104
	>>前往赫罗斯加登陆点 (Hrothgar's Landing) 的博尔之怒 (Bor's Fury) 甲板。
	>>使用|c99ffff99捕获的克瓦迪尔旗帜|r
	>>杀死 |cRXP_ENEMY_Ornolf The Scarred|r
	.complete 14104,1
	.use 47029
	.goto Hrothgar's Landing,58.6,31.6
step
	.isOnQuest 14107
	>>拾取地面上的 |cRXP_PICK_Discarded Sould Crystals|r。
	>>对堕落英雄的灵魂使用 |c99ffff99光明祝福的遗物|r。
	.collect 47035,6,14107,1,-1
	.complete 14107,1
	.use 47033
	.goto Icecrown,49.19,40.42
	.target Fallen Hero's Spirit
step
	>>重返银色亭阁
	.dailyturnin 14105,14101,14102,14104 >>交出亡语者卡罗斯
	>>|c99ffff99OR|r Drottinn Hrothgar
	>>|c99ffff99OR|r 唤雾者英瓦
	>>|c99ffff99OR|r 伤痕累累的奥诺尔夫
	.dailyturnin 14108,14107 >>交出“获取海妖！”
	>>|c99ffff99OR|r 堕落者的命运
	.goto Icecrown,69.51,23.15
	.target High Crusader Adelard
	.target Crusader Silverdawn
step
	+|cRXP_WARN_您已完成今天的所有银色盟约日常任务！明天重新加载本指南以继续执行任务。|r
]])

RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name J_3.2_AT_Silver_Covenant_Daily_Quests
#displayname |cRXP_ENEMY_3.2|r - Silver Covenant Daily Quests
<< Alliance

step
	#completewith next
	+|cRXP_WARN_第三阶段推出银色盟约日常任务|r
	>>要访问银色盟约每日任务，你必须获得 |cRXP_WARN_Silver Covenant|r 的崇拜并成为 |cRXP_ENEMY_Champion|r，这将获得成就：
	.achievement 3676,1
step
	>>进入联盟银色盟约馆
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纳莱丝·晨雪|r, |cRXP_FRIENDLY_萨雯妮娅·慧歌|r
	.daily 14096 >>接任务: |cRXP_WARN_这次你真的做到了，库尔|r
	.daily 14074,14152,14080,14077 >>接任务: |cRXP_WARN_一腿之力|r
	>>|c99ffff99OR|r 海上救援
	>>|c99ffff99OR|r 制止侵略者
	>>|c99ffff99OR|r 圣光的怜悯
	.daily 14076,14090,14112 >>接任务: |cRXP_WARN_勇士的早餐|r
	>>|c99ffff99OR|r 戈莫克想要他的雪人
	>>|c99ffff99OR|r 你到底给雪人喂什么？
	.goto Icecrown,76.26,19.62
	.target Narasi Snowdawn
	.target Savinia Loresong
step
	.isOnQuest 14074
	>>前往赫罗斯加登陆点
	>>从地面上拾取 |cRXP_LOOT_Stolen Tallstrider Legs|r 或杀死 |cRXP_ENEMY_Kvaldir 怪物|r。
	.complete 14074,1
	.goto Hrothgar's Landing,43.4,29.8
	.mob Kvaldir Reaver
	.mob Kvaldir Mist Binder
step
	.isOnQuest 14152
	>>前往赫罗斯加登陆点的联盟船。
	>>杀死 |cRXP_ENEMY_Kvaldir 狂战士|r 和 |cRXP_ENEMY_Kvaldir 鱼叉手|r。
	.complete 14152,1
	.complete 14152,2
	.goto Hrothgar's Landing,49.97,49.45
	.mob Kvaldir Berserker
	.mob Kvaldir Harpooner
step
	.isOnQuest 14080
	>>前往赫罗斯加登陆点
	>>杀死 |cRXP_ENEMY_Kvaldir Reavers|r 或 |cRXP_ENEMY_Kvaldir Mist Binder|r。
	.complete 14080,1
	.goto Hrothgar's Landing,48.65,32.64
	.mob Kvaldir Reaver
	.mob Kvaldir Mist Binder
step
	.isOnQuest 14077
	>>前往赫罗斯加登陆点
	>>使用 |c99ffff99忏悔者的祈祷书|r 为 |cRXP_FRIENDLY_Slain Tualiq 村民|r 进行最后的仪式。
	.complete 14077,1
	.use 46870
	.goto Hrothgar's Landing,51,30,10,0
	.goto Hrothgar's Landing,50.60,28.28,10,0
	.goto Hrothgar's Landing,51.84,26.61,10,0
	.goto Hrothgar's Landing,54.03,23.98,10,0
	.goto Hrothgar's Landing,55.65,25.20,10,0
	.goto Hrothgar's Landing,57.41,24.37,10,0
	.goto Hrothgar's Landing,57.10,21.39
	.target Slain Tualiq Villager
step
	.isOnQuest 14112
	#completewith next
	>>从联盟船上的桶里获取 |cRXP_PICK_Fresh Chum|r。
	.collect 47036,5
	.goto Icecrown,67.11,7.89
step
	.isOnQuest 14112
	>>跳入水中并使用 |cRXP_PICK_Fresh Chum|r。
	>>杀死 |cRXP_ENEMY_Sharks|r 以获得 |cRXP_LOOT_North Sea Shark Meat|r。
	.complete 14112,1
	.use 47036
step
	.isOnQuest 14096
	>>杀死 |cRXP_ENEMY_Dark Zealots|r 和 |cRXP_ENEMY_Dark Ritualists|r 以获取 |cRXP_PICK_Black Cage 按键|r。
	>>使用钥匙将 |cRXP_FRIENDLY_Captive Aspirants|r 从笼子中释放出来。
	.collect 46895,5,14096,2,-1
    .complete 14096,2
	.goto Icecrown,65.17,22.19,15,0
	.goto Icecrown,64.66,21.74,15,0
	.goto Icecrown,63.04,21.32,15,0
	.goto Icecrown,61.42,20.74,15,0
	.goto Icecrown,60.25,21.08
	.mob Dark Zealot
	.mob Dark Ritualist
step
	.isOnQuest 14096
	>>杀死 |cRXP_ENEMY_Dark Zealots|r 和 |cRXP_ENEMY_Dark Ritualists|r 以获取 |cRXP_PICK_Black Cage 按键|r。
	>>将 |cRXP_FRIENDLY_Kul the Reckless|r 从笼子里释放出来。
    .complete 14096,1
	.goto Icecrown,60.82,23.15
step
	.isOnQuest 14076
	>>前往: |cRXP_PICK_风暴峭壁|r
	>>在雪堆旁边使用 |c99ffff99Earthshaker Drum|r。
	>>杀死 |cRXP_ENEMY_Deep Jormungars|r 以获取 |cRXP_LOOT_Jormungar Egg Sacs|r。
	.complete 14076,1
	.use 46893
	.goto The Storm Peaks,43.33,57.74
	.target Deep Jormungar
step
	.isOnQuest 14090
	>>前往: |cRXP_PICK_风暴峭壁|r
	>>使用 |c99ffff99Weighted Net|r 捕获 |cRXP_ENEMY_Snowblind Followers|r。
	.complete 14090,1
	.use 46885
	.goto The Storm Peaks,43.88,81.60
	.target Snowblind Follower
step
	>>重返联盟银色盟约亭
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纳莱丝·晨雪|r, |cRXP_FRIENDLY_萨雯妮娅·慧歌|r
	.dailyturnin 14096 >>交出库尔，这次你真的做到了
	.dailyturnin 14074,14152,14080,14077 >>获得优势
	>>|c99ffff99OR|r 海上救援
	>>|c99ffff99OR|r 制止侵略者
	>>|c99ffff99OR|r 圣光的怜悯
	.dailyturnin 14076,14090,14112 >>交出冠军早餐
	>>|c99ffff99OR|r 戈莫克想要他的雪人
	>>|c99ffff99OR|r 你到底给雪人喂什么？
	.goto Icecrown,76.26,19.62
	.target Narasi Snowdawn
	.target Savinia Loresong
step
	+|cRXP_WARN_您已完成今天的所有银色盟约日常任务！明天重新加载本指南以继续执行任务。|r
]])

RXPGuides.RegisterGuide([[
#wotlk
#cata
#version 1
#group +银色锦标赛
#name J_3.2AT_夺日者_每日任务
#displayname |cRXP_ENEMY_3.2|r - Sunreavers Daily Quests
<< Horde

step
	#completewith next
	+|cRXP_WARN_第三阶段推出夺日者日常任务|r
	>>要访问夺日者每日任务，你必须获得 |cRXP_WARN_Sunreavers|r 的崇拜并成为 |cRXP_ENEMY_Champion|r，这将获得成就：
	.achievement 3677,1
step
	>>进入夺日者亭
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_身经百战的吉莱娜|r, |cRXP_FRIENDLY_泰罗斯·晨行者|r
	.daily 14142 >>接任务: |cRXP_WARN_这次你真的做到了，库尔|r
	.daily 14143,14136,14140,14144 >>接任务: |cRXP_WARN_一腿之力|r
	>>|c99ffff99OR|r 海上救援
	>>|c99ffff99OR|r 制止侵略者
	>>|c99ffff99OR|r 圣光的怜悯
	.daily 14092,14141,14145 >>接任务: |cRXP_WARN_勇士的早餐|r
	>>|c99ffff99OR|r 戈莫克想要他的雪人
	>>|c99ffff99OR|r 你到底给雪人喂什么？
	.goto Icecrown,76.09,24.08
	.target Girana the Blooded
	.target Tylos Dawnrunner
step
	.isOnQuest 14143
	>>前往赫罗斯加登陆点
	>>从地面上拾取 |cRXP_LOOT_Stolen Tallstrider Legs|r 或杀死 |cRXP_ENEMY_Kvaldir 怪物|r。
	.complete 14143,1
	.goto Hrothgar's Landing,43.4,29.8
	.mob Kvaldir Reaver
	.mob Kvaldir Mist Binder
step
	.isOnQuest 14136
	>>前往赫罗斯加登陆点的部落船只。
	>>杀死 |cRXP_ENEMY_Kvaldir 狂战士|r 和 |cRXP_ENEMY_Kvaldir 鱼叉手|r。
	.complete 14136,1
	.complete 14136,2
	.goto Hrothgar's Landing,44.14,54.22
	.mob Kvaldir Berserker
	.mob Kvaldir Harpooner
step
	.isOnQuest 14080
	>>前往赫罗斯加登陆点
	>>杀死 |cRXP_ENEMY_Kvaldir Reavers|r 或 |cRXP_ENEMY_Kvaldir Mist Binder|r。
	.complete 14080,1
	.goto Hrothgar's Landing,48.65,32.64
	.mob Kvaldir Reaver
	.mob Kvaldir Mist Binder
step
	.isOnQuest 14144
	>>前往赫罗斯加登陆点
	>>使用 |c99ffff99忏悔者的祈祷书|r 为 |cRXP_FRIENDLY_Slain Tualiq 村民|r 进行最后的仪式。
	.complete 14144,1
	.use 46870
	.goto Hrothgar's Landing,51,30,10,0
	.goto Hrothgar's Landing,50.60,28.28,10,0
	.goto Hrothgar's Landing,51.84,26.61,10,0
	.goto Hrothgar's Landing,54.03,23.98,10,0
	.goto Hrothgar's Landing,55.65,25.20,10,0
	.goto Hrothgar's Landing,57.41,24.37,10,0
	.goto Hrothgar's Landing,57.10,21.39
	.target Slain Tualiq Villager
step
	.isOnQuest 14145
	#completewith next
	>>从部落船上的桶里获取 |cRXP_PICK_Fresh Chum|r。
	.collect 47036,5
	.goto Icecrown,73.97,9.42
step
	.isOnQuest 14145
	>>跳入水中并使用 |cRXP_PICK_Fresh Chum|r。
	>>杀死 |cRXP_ENEMY_Sharks|r 以获得 |cRXP_LOOT_North Sea Shark Meat|r。
	.complete 14145,1
	.use 47036
step
	.isOnQuest 14142
	>>杀死 |cRXP_ENEMY_Dark Zealots|r 和 |cRXP_ENEMY_Dark Ritualists|r 以获取 |cRXP_PICK_Black Cage 按键|r。
	>>使用钥匙将 |cRXP_FRIENDLY_Captive Aspirants|r 从笼子中释放出来。
	.collect 46895,5,14142,2,-1
    .complete 14142,2
	.goto Icecrown,65.17,22.19,15,0
	.goto Icecrown,64.66,21.74,15,0
	.goto Icecrown,63.04,21.32,15,0
	.goto Icecrown,61.42,20.74,15,0
	.goto Icecrown,60.25,21.08
	.mob Dark Zealot
	.mob Dark Ritualist
step
	.isOnQuest 14142
	>>杀死 |cRXP_ENEMY_Dark Zealots|r 和 |cRXP_ENEMY_Dark Ritualists|r 以获取 |cRXP_PICK_Black Cage 按键|r。
	>>将 |cRXP_FRIENDLY_Kul the Reckless|r 从笼子里释放出来。
    .complete 14142,1
	.goto Icecrown,60.82,23.15
step
	.isOnQuest 14092
	>>前往: |cRXP_PICK_风暴峭壁|r
	>>在雪堆旁边使用 |c99ffff99Earthshaker Drum|r。
	>>杀死 |cRXP_ENEMY_Deep Jormungars|r 以获取 |cRXP_LOOT_Jormungar Egg Sacs|r。
	.complete 14092,1
	.use 46893
	.goto The Storm Peaks,43.33,57.74
	.target Deep Jormungar
step
	.isOnQuest 14141
	>>前往: |cRXP_PICK_风暴峭壁|r
	>>使用 |c99ffff99Weighted Net|r 捕获 |cRXP_ENEMY_Snowblind Followers|r。
	.complete 14141,1
	.use 46885
	.goto The Storm Peaks,43.88,81.60
	.target Snowblind Follower
step
	>>返回夺日者阁
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_身经百战的吉莱娜|r, |cRXP_FRIENDLY_泰罗斯·晨行者|r
	.dailyturnin 14142 >>交出库尔，这次你真的做到了
	.dailyturnin 14143,14136,14080,14144 >>获得优势
	>>|c99ffff99OR|r 海上救援
	>>|c99ffff99OR|r 制止侵略者
	>>|c99ffff99OR|r 圣光的怜悯
	.dailyturnin 14092,14141,14145 >>交出冠军早餐
	>>|c99ffff99OR|r 戈莫克想要他的雪人
	>>|c99ffff99OR|r 你到底给雪人喂什么？
	.goto Icecrown,76.09,24.08
	.target Girana the Blooded
	.target Tylos Dawnrunner
step
	+|cRXP_WARN_您已完成今天的所有夺日者日常任务！明天重新加载本指南以继续任务。|r
]])
