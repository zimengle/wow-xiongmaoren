RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#subgroup 德莱尼起始区域
#name 2零售联盟-德莱尼_阿门谷
#displayname Chapter 1 - Ammen Vale
#next 3零售联盟-德莱尼_秘蓝岛
#defaultfor Draenei !DK

<< Alliance

step
    #completewith next
    +欢迎来到 RestedXP 编写的 |cFFfa9602Draenei 起始区|r 指南。
    *Without consumables or heirlooms, this route is approximately 5 minutes slower than |cFFfa9602Exile's Reach.|r For faster leveling, consider recreating your character and selecting |cFFfa9602Exile's Reach|r instead.
step
    .goto 468,61.21,29.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_麦格伦|r
    .accept 9279 >>接任务: |cRXP_LOOT_你活下来了！|r
	.target Megelon
step
    .goto 468,52.75,35.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_普罗尼图斯|r
    .turnin 9279 >>交任务: |cRXP_FRIENDLY_你活下来了！|r
    .accept 9280 >>接任务: |cRXP_LOOT_补充治疗水晶|r
	.target Proenitus
step
    .goto 468,52.47,31.08,25,0
    .goto 468,50.96,26.54,25,0
    .goto 468,49.20,26.20,25,0
    .goto 468,44.84,30.01,25,0
#loop
	.line 468,52.47,31.08,50.96,26.54,49.20,26.20,44.84,30.01
	.goto 468,52.47,31.08,15,0
	.goto 468,50.96,26.54,15,0
	.goto 468,49.20,26.20,15,0
	.goto 468,44.84,30.01,15,0
    >>杀死 |cRXP_ENEMY_Vale Moths|r 并从它们身上掠夺 |cRXP_LOOT_Vial of Moth Blood。|r
    .complete 9280,1 --6/6 Vial of Moth Blood
	.mob Vale Moth
step
    .goto 468,52.7,35.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_普罗尼图斯|r
    .turnin 9280 >>交任务: |cRXP_FRIENDLY_补充治疗水晶|r
    .accept 9409 >>接任务: |cRXP_LOOT_紧急物资！|r
	.target Proenitus
step
    .goto 468,52.2,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_扎尔杜|r
    .turnin 9409 >>交任务: |cRXP_FRIENDLY_紧急物资！|r
    .accept 9283 >>接任务: |cRXP_LOOT_拯救幸存者！|r
	.target Zalduun
step
    .goto 468,52.67,37.18,10,0
    .goto 468,52.7,35.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_普罗尼图斯|r
    .accept 9371 >>接任务: |cRXP_WARN_植物学家塔蕾克丝|r
	.target Proenitus
step
    .goto 468,49.87,37.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_植物学家塔蕾克丝|r
    .turnin 9371 >>交任务: |cRXP_FRIENDLY_植物学家塔蕾克丝|r
    .accept 10302 >>接任务: |cRXP_LOOT_暴躁的变异体|r
	.target 植物学家泰瑞克斯
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Volatile Mutations。|r
    .complete 10302,1 --8/8 Volatile Mutation slain
	.mob Volatile Mutation
step
    .goto 468,47.05,25.98,20,0
    .goto 468,56.00,29.87
    >>瞄准 |cRXP_FRIENDLY_Draenei Survivor|r，然后远距离对其使用 |T135923:0|t[纳鲁的礼物]。
    .complete 9283,1 --1/1 Draenei Survivors Saved
    .use 370626
    .target Draenei Survivor
step
    .goto 468,52.47,31.08,25,0
	.goto 468,50.96,26.54,25,0
	.goto 468,49.20,26.20,25,0
	.goto 468,44.84,30.01,25,0
#loop
	.line 468,52.47,31.08,50.96,26.54,49.20,26.20,44.84,30.01
	.goto 468,52.47,31.08,15,0
	.goto 468,50.96,26.54,15,0
	.goto 468,49.20,26.20,15,0
	.goto 468,44.84,30.01,15,0
    >>杀死 |cRXP_ENEMY_Volatile Mutations。|r
    .complete 10302,1 --8/8 Volatile Mutation slain
	.mob Volatile Mutation
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_植物学家塔蕾克丝|r, |cRXP_FRIENDLY_学徒维莎尔|r
    .turnin 10302 >>交任务: |cRXP_FRIENDLY_暴躁的变异体|r
    .accept 9293 >>接任务: |cRXP_LOOT_必需的措施......|r
    .goto 468,49.87,37.34
    .accept 9799 >>接任务: |cRXP_LOOT_跑腿采花|r
    .goto 468,49.72,37.51
	.target 植物学家泰瑞克斯
    .target 学徒 Vishael
step
    #completewith next 
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Corrupted Flowers。|r
    .complete 9799,1 --3/3 Corrupted Flower
step
    .goto 468,40.41,42.32,15,0
    .goto 468,33.22,49.4,15,0
    .goto 468,37.59,51.92,15,0
    .goto 468,35.66,52.75,15,0
    .goto 468,39.6,50.1,15,0
#loop
	.line 468,40.41,42.32,37.51,44.62,33.22,49.4,37.59,51.92,35.66,52.75,39.6,50.1
	.goto 468,40.41,42.32,15,0
	.goto 468,37.51,44.62,15,0
	.goto 468,33.22,49.40,15,0
	.goto 468,37.59,51.92,15,0
	.goto 468,35.66,52.75,15,0
	.goto 468,39.60,50.10,15,0
    >>杀死 |cRXP_ENEMY_Mutated Root Lashers|r 并从他们身上夺取 |cRXP_LOOT_Lasher Samples。|r
    .complete 9293,1 --10/10 Lasher Sample
	.mob Root Lasher
step
#loop
	.line 468,40.77,42.25,39,50.27,34.95,37.36,35.24,52.45
	.goto 468,40.77,42.25,15,0
	.goto 468,39.00,50.27,15,0
	.goto 468,34.95,37.36,15,0
	.goto 468,35.24,52.45,15,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Corrupted Flowers。|r
    .complete 9799,1 --3/3 Corrupted Flower
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_学徒维莎尔|r, |cRXP_FRIENDLY_植物学家塔蕾克丝|r
    .turnin 9799 >>交任务: |cRXP_FRIENDLY_跑腿采花|r
    .goto 468,49.72,37.54
    .turnin 9293 >>交任务: |cRXP_FRIENDLY_必需的措施......|r
    .accept 9294 >>接任务: |cRXP_LOOT_净化湖水|r
    .goto 468,49.87,37.34
	.target 学徒 Vishael
    .target 植物学家泰瑞克斯
step
    .goto 468,52.68,37.05,5,0
    .goto 468,51.97,42.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_扎尔杜|r
    .turnin 9283 >>交任务: |cRXP_FRIENDLY_拯救幸存者！|r
	.target Zalduun
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_技师沙娜安|r, |cRXP_FRIENDLY_守备官奥达尔|r
    .accept 37445 >>接任务: |cRXP_LOOT_备用零件|r
    .goto 468,50.52,47.93
    .accept 37444 >>接任务: |cRXP_LOOT_疫苗|r
    .goto 468,50.65,48.76
	.target Technician Zhanaa
    .target Vindicator Aldar
step
    .isOnQuest 9294
    #completewith next
    +|cRXP_WARN_要启用任务物品的键绑定，请按照以下步骤操作：|r
    *[1] Press the |cRXP_WARN_Escape key.|r 
    *[2] Select |cRXP_WARN_Options.|r
    *[3] Navigate to |cRXP_WARN_Keybindings.|r
    *[4] Within |cRXP_WARN_Keybindings|r, find |cRXP_WARN_RestedXP Guides.|r
    *[5] Select and bind the |cRXP_WARN_Active Buttons.|r
step
    .goto 468,46.36,63.99
    >>在水边的辐照能量水晶处使用 |T132858:0|t[中和剂] |cFFfa9602。|r
    .use 22955
    .complete 9294,1 --1/1 Disperse the Neutralizing Agent
step
    #completewith next
    >>对 |cRXP_ENEMY_Nestlewood 猫头鹰kins 使用 |T22962:0|t[接种晶体]。|r
    .use 22962 
    .complete 37444,1 --6/6 Nestlewood 猫头鹰kin inoculated
	.mob Nestlewood 猫头鹰kin
step
    .goto 468,55.91,66.37,10,0
    .goto 468,58.26,70.67,10,0
    .goto 468,61.21,78.37
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Spare Parts。|r 
    .complete 37445,1 --4/4 Emitter Spare Part
step
    .goto 468,55.91,66.37,10,0
    .goto 468,58.26,70.67,10,0
    .goto 468,62.13,85.75,15,0
    .goto 468,65.01,84.99,15,0
    .goto 468,65.63,77.91,15,0
    .goto 468,71.23,71.71,15,0
    .goto 468,61.21,78.37
    >>对 |cRXP_ENEMY_Nestlewood 猫头鹰kins 使用 |T22962:0|t[接种晶体]。|r
    .use 22962
    .complete 37444,1 --6/6 Nestlewood 猫头鹰kin inoculated
	.mob Nestlewood 猫头鹰kin
step
    .isOnQuest 9294
    >>|cRXP_WARN_RXP 指南经常采用死亡跳跃作为快速到达目标地点的策略。|r
    .deathskip >>在坠机地点死亡并重生
step
    .goto 468,49.86,37.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_植物学家塔蕾克丝|r
    .turnin 9294 >>交任务: |cRXP_FRIENDLY_净化湖水|r
	.target 植物学家泰瑞克斯
step
    .goto 468,50.5,47.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_技师沙娜安|r
    .turnin 37445 >>交任务: |cRXP_FRIENDLY_备用零件|r
	.target Technician Zhanaa
step
    .goto 468,50.6,48.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_守备官奥达尔|r
    .turnin 10304 >>交任务: |cRXP_FRIENDLY_守备官奥达尔|r
    .turnin 37444 >>交任务: |cRXP_FRIENDLY_疫苗|r
    .accept 9309 >>接任务: |cRXP_LOOT_失踪的斥候|r
	.target Vindicator Aldar
step
    .goto 468,33.91,69.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图兰|r
    .turnin 9309 >>交任务: |cRXP_FRIENDLY_失踪的斥候|r
    .accept 10303 >>接任务: |cRXP_LOOT_血精灵|r
	.target Tolaan
step
    .goto 468,33.0,73.9
    >>杀死 |cRXP_ENEMY_血精灵侦察兵|r
    .complete 10303,1 --10/10 Blood Elf Scout slain
	.mob Blood Elf Scout
step
    .goto 468,33.91,69.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图兰|r
    .turnin 10303 >>交任务: |cRXP_FRIENDLY_血精灵|r
    .accept 9311 >>接任务: |cRXP_LOOT_血精灵间谍|r
	.target Tolaan
step
    .goto 468,27.8,80.41
    >>杀死 |cRXP_ENEMY_Surveyor Candress|r 并掠夺她的 |cRXP_LOOT_Blood Elf Plans。|r
    .complete 9311,1 --1/1 Surveyor Candress slain
step
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Blood Elf Plans.|r
    .accept 9798 >>接任务: |cRXP_LOOT_血精灵计划书|r
    .use 24414 
	.target Surveyor Candress
step
    .isOnQuest 9311
    .deathskip >>在坠机地点死亡并重生
step
    .goto 468,50.66,48.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_守备官奥达尔|r
    .turnin 9311 >>交任务: |cRXP_FRIENDLY_血精灵间谍|r 
    .turnin 9798 >>交任务: |cRXP_FRIENDLY_血精灵计划书|r
    .accept 9312 >>接任务: |cRXP_LOOT_图像发射器|r
	.target Vindicator Aldar
step
    .goto 468,50.69,47.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_技师沙娜安|r
    .turnin 9312 >>交任务: |cRXP_FRIENDLY_图像发射器|r
    .accept 9313 >>接任务: |cRXP_LOOT_前往碧蓝岗哨|r
	.target Technician Zhanaa
]])

RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#subgroup 德莱尼起始区域
#name 3零售联盟-德莱尼_秘蓝岛
#displayname Chapter 2 - Azuremyst Isle
#next RestedXP 联盟 10-60\\1A_艾尔文森林
#defaultfor Draenei !DK

<< Alliance

step
    .goto 97,64.5,54.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_埃文|r
    .accept 9314 >>接任务: |cRXP_LOOT_碧蓝岗哨的消息|r
	.target Aeun
step
    #completewith next
    >>杀死 |cRXP_ENEMY_月食雄鹿s|r 和 |cRXP_ENEMY_月食雄鹿|r 并掠夺它们以获得 |cRXP_LOOT_月食雄鹿 Tenderloin。|r
	>>|cRXP_WARN_你不必现在就完成|r
    .collect 23676,3
	.mob 月食雄鹿
	.mob 月食雄鹿
step
    .goto 97,49.78,51.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾克提恩|r
    .accept 9454 >>接任务: |cRXP_LOOT_狩猎月痕鹿|r
	.target Acteon	
step
	#completewith next
    .goto 97,48.68,52.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦伦|r
    .train 2366 >>训练 |T4620675:0|t草药学
	.skipgossip 47431,1,1,1
	.target Valn
step
    .goto 97,48.68,52.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦伦|r
    .train 2575 >>列车 |T4620679:0|tMining
	.skipgossip 47431,2,3,2
	.target Valn
step
    #completewith home
    +|cRXP_WARN_采药和采矿石可获得经验。只有当药草和矿石就在你旁边时才可以这样做。|r
step
    #completewith next
    .vendor >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥图纳布斯|r, (don't sell 月食雄鹿 Tenderloin)
	.target Otonambusi
step
    .goto 97,48.39,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_学者法蒂玛|r
    .accept 9463 >>接任务: |cRXP_LOOT_医疗材料|r
	.target 隐士法蒂玛
step
    .goto 97,48.97,51.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜尔维|r
    .accept 10428 >>接任务: |cRXP_LOOT_失踪的渔夫|r
	.target Dulvi
step
    .goto 97,48.72,50.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_技师戴维恩|r
    .turnin 9313 >>交任务: |cRXP_FRIENDLY_前往碧蓝岗哨|r
	.target Technician Dyvuun
step
    .goto 97,48.34,49.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_看护员谢尔兰|r
    .turnin 9314,1 >>交任务: |cRXP_FRIENDLY_碧蓝岗哨的消息|r
    .accept 9603 >>接任务: |cRXP_WARN_床铺，绷带，以及更多|r
	.target Caregiver Chellan
step
	#label home
    #completewith next
    .goto 97,48.34,49.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_看护员谢尔兰|r
    .home >>将你的 |cFFfa9602炉石 设为碧蓝守望。|r
	.target Caregiver Chellan
step
    #label MiningDraenei
    .goto 97,48.8,49.97,17,0
    .goto 97,49.72,49.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨尔达恩|r
    .turnin 9603 >>交任务: |cRXP_FRIENDLY_床铺，绷带，以及更多|r
    .accept 9604 >>接任务: |cRXP_LOOT_乘坐角鹰兽|r
	.target Zaldaan
step
    #completewith roottenders	
    >>杀死 |cRXP_ENEMY_月食雄鹿s|r 和 |cRXP_ENEMY_月食雄鹿|r 并掠夺它们以获得 |cRXP_LOOT_月食雄鹿 Tenderloin。|r
    .complete 9454,1 --6/6 月食雄鹿 Tenderloin
	.mob 月食雄鹿
	.mob 月食雄鹿
step
    .goto 97,51.64,41.92
    >>杀死 |cRXP_ENEMY_被感染的夜行者幼崽s|r 并从他们身上夺取 |cRXP_LOOT_Faintly Glowing Crystal。|r
	.collect 23678,1,9455
    .accept 9455 >>接任务: |cRXP_LOOT_奇怪的发现|r
    .use 23678
	.mob 被感染的夜行者幼崽
step
    #label roottenders
    .goto 97,57.22,47.12,25,0
	.goto 97,57.79,63.89,25,0
	.goto 97,54.09,65.10,25,0
	.goto 97,50.55,60.29,25,0
	.goto 97,52.40,55.02,25,0
    .goto 97,54.5,58.33
    >>杀死 |cRXP_ENEMY_根部捕手s|r 并掠夺他们的 |cRXP_LOOT_Vine|r
    .complete 9463,1 --8/8 根部捕手 Vine
	.mob 根部捕手
step
    .goto 97,57.22,47.12,25,0
    .goto 97,54.5,58.33
	>>杀死 |cRXP_ENEMY_月食雄鹿s|r 和 |cRXP_ENEMY_月食雄鹿|r 并掠夺它们的 |cRXP_LOOT_月食雄鹿 Tenderloin。|r
    .complete 9454,1 --6/6 月食雄鹿 Tenderloin
	.mob 月食雄鹿
	.mob 月食雄鹿
step
    .goto 97,49.78,51.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾克提恩|r
    .turnin 9454,1 >>交任务: |cRXP_FRIENDLY_狩猎月痕鹿|r
    .accept 10324 >>接任务: |cRXP_LOOT_狩猎月痕鹿|r
	.target Acteon
step
    .goto 97,48.39,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_学者法蒂玛|r
    .turnin 9463,1 >>交任务: |cRXP_FRIENDLY_医疗材料|r
	.target 隐士法蒂玛
step
    .goto 97,48.40,51.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_丹达尔|r
    .accept 9473 >>接任务: |cRXP_LOOT_备选方案的备选方案|r
	.target Daedal
step
    .goto 97,47.12,50.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大主教梅内莱厄斯|r
    .turnin 9455 >>交任务: |cRXP_FRIENDLY_奇怪的发现|r
    .accept 9623 >>接任务: |cRXP_LOOT_成年|r
    .accept 9456 >>接任务: |cRXP_LOOT_清理夜行豹......|r
	.target Exarch Menelaous
step
    .goto 97,46.67,52.77,15,0
    .goto 97,49.32,55.25,15,0
    .goto 97,44.65,57.20,15,0
    .goto 97,49.27,58.63,15,0
    .goto 97,46.67,52.77
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击位于 |cFFfa9602地面上的 |cRXP_PICK_Azure Snapdragon|r。|r
    .complete 9473,1 --5/5 Azure Snapdragon Bulb
step
    .goto 97,46.68,70.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_\"曲奇\"米维克索斯|r
    .accept 9512 >>接任务: |cRXP_LOOT_曲奇的大餐|r
	.target "Cookie" McWeaksauce
step
    .goto 97,47.03,70.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_海军上将奥德修斯|r
    .accept 9506 >>接任务: |cRXP_LOOT_第三类接触|r
	.target 海军上将奥德修斯
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Skittering Crawlers|r 并掠夺他们的 |cRXP_LOOT_Skittering Crawler Meats。|r
	>>|cRXP_WARN_你很快就会杀死更多人。|r
    .complete 9512,1 --6/6 Skittering Crawler Meat
	.mob Skittering Crawler
step
    .goto 97,58.60,66.36
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击小营地里的|cRXP_PICK_Nautical Map|r |cFFfa9602。|r
    .complete 9506,2 --1/1 Nautical Map
step
    .goto 97,59.57,67.65
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击小营地里的 |cRXP_PICK_Nautical Compass|r |cFFfa9602。|r
    .complete 9506,1 --1/1 Nautical Compass
step
    .goto 97,49.35,73.46
    >>杀死 |cRXP_ENEMY_Skittering Crawlers|r 并掠夺他们的 |cRXP_LOOT_Skittering Crawler Meats。|r
    .complete 9512,1 --6/6 Skittering Crawler Meat
	.mob Skittering Crawler
step
    .goto 97,47.03,70.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_海军上将奥德修斯|r
    .turnin 9506 >>交任务: |cRXP_FRIENDLY_第三类接触|r
	.target 海军上将奥德修斯
step
    .goto 97,47.03,70.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_海军上将奥德修斯|r
    .accept 9530 >>接任务: |cRXP_LOOT_天才的方案！|r
	.target 海军上将奥德修斯
step
    .goto 97,47.13,70.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女祭司基琳·伊尔蒂娜|r
    .accept 9513 >>接任务: |cRXP_LOOT_夺回废墟|r
	.target Priestess Kyleen
step
    .goto 97,47.24,70.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_考古学家阿达曼特·铁心|r
    .accept 9523 >>接任务: |cRXP_LOOT_贵重物品，小心轻放|r
	.target Archaeologist Adamant Ironheart
step
    .goto 97,48.34,64.76,40,0
    .goto 97,50.68,64.53,40,0
    .goto 97,52.91,64.36,40,0
    .goto 97,48.34,64.76
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Tree Stump|r 和 |cRXP_PICK_Piles of Leaves。|r
    .complete 9530,2 --5/5 Pile of Leaves
    .complete 9530,1 --1/1 Hollowed Out Tree
step
    .goto 97,47.04,70.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_海军上将奥德修斯|r
    .turnin 9530 >>交任务: |cRXP_FRIENDLY_天才的方案！|r
    .accept 9531 >>接任务: |cRXP_LOOT_间谍之树|r
	.target 海军上将奥德修斯
step
    .goto 97,46.69,70.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_\"曲奇\"米维克索斯|r
    .turnin 9512 >>交任务: |cRXP_FRIENDLY_曲奇的大餐|r
	.target "Cookie" McWeaksauce
step
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击位于 |cFFfa9602地面上|r 的 |cRXP_PICK_Ancient Relics|r
    .complete 9523,1 --8/8 Ancient Relic
step
    .goto 97,39.11,75.21,35,0
    .goto 97,35.21,80.17,35,0
    .goto 97,35.23,77.39,35,0
    .goto 97,30.63,77.71,35,0
    .goto 97,28.33,79.05,35,0
    .goto 97,35.21,80.17
    >>杀死 |cRXP_ENEMY_怒鳞侍从s|r、|cRXP_ENEMY_Nagas|r 和 |cRXP_ENEMY_Sirens|r 并从他们那里夺取 |cRXP_LOOT_符文覆盖石碑。|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_符文覆盖石碑|r
	.collect 23759,1,9514
    .accept 9514 >>接任务: |cRXP_WARN_写满符文的石板|r
    .complete 9513,1 --5/5 怒鳞侍从 slain
    .complete 9513,2 --5/5 怒鳞纳迦 slain
    .complete 9513,3 --5/5 怒鳞海妖 slain
	.mob 怒鳞侍从
	.mob 怒鳞纳迦
	.mob 怒鳞海妖
    .use 23759 
step
    .goto 97,39.11,75.21,35,0
    .goto 97,35.21,80.17,35,0
    .goto 97,35.23,77.39,35,0
    .goto 97,30.63,77.71,35,0
    .goto 97,28.33,79.05,35,0
    .goto 97,35.21,80.17
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击位于 |cFFfa9602地面上|r 的 |cRXP_PICK_Ancient Relics|r
    .complete 9523,1 --8/8 Ancient Relic
step
    #completewith next
    >>杀死 |cRXP_ENEMY_被感染的夜行者幼崽s|r
    .complete 9456,1 --8/8 被感染的夜行者幼崽 slain
	.mob 被感染的夜行者幼崽
step
    .goto 97,32.42,66.36,60,0
    .goto 97,32.71,57.9
    >>杀死 |cRXP_ENEMY_月食雄鹿s|r 并掠夺他们的 |cRXP_LOOT_ 月食雄鹿 Hides。|r
    .complete 10324,1 --6/6 月食雄鹿 Hide
	.mob 月食雄鹿
step
    .goto 97,32.42,66.36,60,0
    .goto 97,32.71,57.9
    >>杀死 |cRXP_ENEMY_被感染的夜行者幼崽s。|r
    .complete 9456,1 --8/8 被感染的夜行者幼崽 slain
	.mob 被感染的夜行者幼崽
step
    #completewith next
    .goto 97,18.8,83.46,10,0
    .goto 97,18.37,86.32,10,0
    .goto 97,16.59,94.46,5,0
    .goto 97,15.26,92.24
    >>使用 |cFFfa9602the Red Flag|r 附近的 |T132288:0|t[树木伪装工具包]，然后点击 Buff off 移除伪装，然后按照路径点
	>>|cRXP_WARN_请勿在旗帜处等候|r
    .complete 9531,1 --1/1 The Traitor Uncovered
    .use 23792
step
    #label QuestKeybindingsDraenei2
    .goto 97,16.59,94.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库雷|r
    .turnin 10428 >>交任务: |cRXP_FRIENDLY_失踪的渔夫|r
    .accept 9527 >>接任务: |cRXP_LOOT_遗体|r
	.target Cowlen
step
    .goto 97,14.58,90.66
    >>杀死|cRXP_ENEMY_|r猫头鹰beasts 并掠夺它们以获得|cRXP_LOOT_Cowlen 家族的遗物。|r
    .complete 9527,1 --1/1 Remains of Cowlen's Family
step
    #sticky
    .goto 97,16.59,94.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库雷|r
    .turnin 9527 >>交任务: |cRXP_FRIENDLY_遗体|r
	.target Cowlen
step
    #completewith next
    .deathskip >>死于 |cRXP_ENEMY_猫头鹰beasts。|r 重生 |cFFfa9602at Azure Watch。|r
step
    .goto 97,47.04,70.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_海军上将奥德修斯|r
    .turnin 9531 >>交任务: |cRXP_FRIENDLY_间谍之树|r
    .accept 9537 >>接任务: |cRXP_LOOT_绳侏儒以法|r
	.target 海军上将奥德修斯
step
    .goto 97,47.13,70.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女祭司基琳·伊尔蒂娜|r
    .turnin 9513 >>交任务: |cRXP_FRIENDLY_夺回废墟|r
	.target 女祭司凯琳·伊迪娜尔
step
    .goto 97,47.14,70.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女祭司基琳·伊尔蒂娜|r
    .turnin 9514 >>交任务: |cRXP_FRIENDLY_写满符文的石板|r
	.target 女祭司凯琳·伊迪娜尔
step
    .goto 97,47.23,69.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_考古学家阿达曼特·铁心|r
    .turnin 9523 >>交任务: |cRXP_FRIENDLY_贵重物品，小心轻放|r
	.target Archaeologist Adamant Ironheart
step
    .goto 97,48.56,71.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工程师欧格林德|r
    >>|cRXP_WARN_等待角色扮演，|r 杀死 |cRXP_ENEMY_Engineer “Spark” Overgrind|r 并从他身上搜刮物品，获得 |cRXP_LOOT_Traitor's Communication|r
    .complete 9537,1 --1/1 Traitor's Communication
    .skipgossip
    .mob Engineer "Spark" Overgrind
step
    .goto 97,47.04,70.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_海军上将奥德修斯|r
    .turnin 9537,1 >>交任务: |cRXP_FRIENDLY_绳侏儒以法|r
    .accept 9602 >>接任务: |cRXP_LOOT_邪恶的书信|r
	.target 海军上将奥德修斯
step
    #completewith next
    .hs >>炉石 |cFFfa9602to 碧蓝守望|r
step
    .goto 97,49.78,51.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾克提恩|r
    .turnin 10324 >>交任务: |cRXP_FRIENDLY_狩猎月痕鹿|r
	.target Acteon
step
    .goto 97,48.39,51.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_丹达尔|r
    .turnin 9473 >>交任务: |cRXP_FRIENDLY_备选方案的备选方案|r
	.target Daedal
step
    .goto 97,47.12,50.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大主教梅内莱厄斯|r
    .turnin 9602 >>交任务: |cRXP_FRIENDLY_邪恶的书信|r
    .turnin 9456 >>交任务: |cRXP_FRIENDLY_清理夜行豹......|r
	.target Exarch Menelaous
step
    .goto 103,81.51,51.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_象群管理者妥拉留斯|r
    .turnin 9623 >>交任务: |cRXP_FRIENDLY_成年|r
	.target Torallius the Pack Handler
step
    .goto 103,75.17,53.85,20,0
    .goto 103,73.55,39.76,20,0
    .goto 103,66.18,33.78,20,0
    .goto 103,62.49,43.7,20,0
    .goto 103,57.03,50.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_努古尼|r
    .turnin 9604 >>交任务: |cRXP_FRIENDLY_乘坐角鹰兽|r
    .accept 9605 >>接任务: |cRXP_LOOT_斯泰法努斯|r
	.target Nurguni
step
    .goto 103,55.07,47.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_英雄传令官|r
    .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
	.target Hero's Herald
step
    .goto 103,54.49,36.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯泰法努斯|r
    .turnin 9605 >>交任务: |cRXP_FRIENDLY_斯泰法努斯|r
	.target Stephanos
step
    .nodmf 
    .goto 103,48.34,62.9,5 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Stormwind 传送门|r
    .zoneskip 84
step
    #completewith next
    .goto 84,49.36,86.76,10,0
    .goto 84,53.58,85.4,15,0
    .goto 84,53.95,79.25,15,0
    .goto 84,55.54,76.05,20,0
    .goto 84,60.00,71.95,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_英雄传令官|r
    .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
	.target Hero's Herald
    .nodmf
step
    .goto 84,49.36,86.76,10,0
    .goto 84,53.58,85.4,15,0
    .goto 84,53.95,79.25,15,0
    .goto 84,55.54,76.05,20,0
    .goto 84,60.00,71.95,20,0
    .goto 84,63.77,73.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷纳多·加林纳|r
    .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
	.target Renato Gallina
    .nodmf
step
    .goto 84,67.49,80.56,20,0
    .goto 84,67.03,83.44,20,0
    .goto 84,69.76,84.87,20,0
    .goto 37,41.71,64.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_勇敢的巴特利|r
    .fp >>获取金郡飞行路线
	.target Bartlett the Brave
    .nodmf
step
    #veteran
    .goto 103,61,52.56,5,0
    .goto 103,63.23,58.75
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r 你需要从拍卖行购买 |cRXP_WARN_特定物品才能充分利用此活动。|r 如有必要，|cRXP_WARN_你可以从其他角色转移金币进行这些购买。|r 但是，如果你发现自己买不起所有东西，|cRXP_WARN_前往暗月马戏团获得临时经验值提升并只购买部分物品仍然是值得的。|r
    >>|cRXP_WARN_建议用其他拥有至少10000金币的角色登录，用这个角色购买物品然后寄过来。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师伊蕾萨|r
    .collect 71715,1
    .collect 71638,1
    .collect 71637,1
    .collect 71636,1
    .collect 71635,1
    .collect 71952,1
    .collect 71951,1
    .collect 71953,1
    .collect 71716,1
    .target Auctioneer Iressa
    .dmf
step
    #fresh
    #completewith DarkMoonFaire
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r
    .dmf
step
    #completewith next
    .link /run AbandonSkill(186); AbandonSkill(182);>>|cRXP_WARN_单击此文本即可接收一个将忘记您的职业的宏。|r
    .dmf
step
    #label DarkMoonFaire
    .goto 103,51.34,42.03
    .zoneskip 37 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗月马戏团秘法师|r
    .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
	.target Darkmoon Faire Mystic Mage
    .dmf
step
    .goto 84,62.10,32.18
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗月马戏团秘法师|r
    .zoneskip 37
    .skipgossip
	.target Darkmoon Faire Mystic Mage
    .dmf
]])
