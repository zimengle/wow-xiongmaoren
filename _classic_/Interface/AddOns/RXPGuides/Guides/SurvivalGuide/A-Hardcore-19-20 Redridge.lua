
RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Alliance
#name 19-20 赤脊山谷
#displayname 19-20 赤脊山谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 生存指南((联盟)
#subgroup RXP生存指南 1-20
#next 20-21 黑海岸/灰谷

step << Hunter
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
    .trainer >>训练你的职业法术
    .target Einris Brightspear
step << Hunter
    .goto StormwindClassic,61.576,15.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
    .trainer >>训练你的宠物法术
    .target Karrina Mekenda
step
    #completewith BMenace
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利巴布·旋轮|r交谈
    .vendor >>|cRXP_BUY_购买|r|T133024:0|t[青铜管]
    >>|cRXP_WARN_这是一件限量供应物品. 如果|cRXP_FRIENDLY_比利巴布·旋轮|r没有, 請跳過此步驟|r
--    >>你稍后完成任务时需要 2 个青铜管 << Rogue
    .bronzetube
    .target Billibub Cogspinner
step
	.isOnQuest 1338
    .goto StormwindClassic,58.08,16.52
    .target Furen Longbeard
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗伦·长须|r交谈
    .turnin 1338 >>交任务: |cRXP_FRIENDLY_卡尔·雷矛的订单|r
    .isOnQuest 1338
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沉默的舒尼|r和|cRXP_FRIENDLY_维尔德·蓟草|r交谈 
    .accept 2040 >>接任务: |cRXP_WARN_地底突袭|r
    .target +Shoni the Shilent
    .goto StormwindClassic,55.510,12.504
    .accept 167 >>接任务: |cRXP_WARN_我的兄弟……|r
    .accept 168 >>接任务: |cRXP_WARN_收集记忆|r
    .goto StormwindClassic,65.438,21.175
    .target +Wilder Thistlenettle
step << Hunter
    #ssf
    #completewith ExitSW
    .goto StormwindClassic,49.990,57.641
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_购买|r |T135489:0|t[重型弯弓]
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .target Frederick Stover
    .money <0.6722
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
step << Hunter
    #ah
    #completewith ExitSW
    .goto StormwindClassic,49.990,57.641
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_从拍卖行购买一把|r|T135489:0|t[重型弯弓]|cRXP_BUY_, 或购买更好的装备|r
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .target Frederick Stover
    .money <0.6722
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20  
step << Hunter
    .goto StormwindClassic,49.990,57.641
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_购买|r|T132382:0|t[锋利的箭]
    .collect 2515,1800 --Sharp Arrow (1800)
    .target Frederick Stover
step << Hunter
    +|cRXP_WARN_装备|r|T135489:0|t[重型弯弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.19
    .xp <20,1
step << Mage
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >>前往法师塔
step << Mage
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .trainer >>训练你的职业法术
    .target Elsharin
step << Paladin/Priest
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step << Paladin
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .trainer >>训练你的职业法术
    .target Arthur the Faithful
step << Priest
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒修士|r谈话
    .trainer >>训练你的职业法术
    .target Brother Joshua
step << Warlock/Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    >>|cRXP_BUY_购买 a|r|T135139:0|t[燃烧魔杖]|cRXP_BUY_如果它是升级道具|r
    >>|cRXP_WARN_购买一根非暗影伤害的法杖非常重要, 之后你会遇到对暗影伤害有抗性的怪物|r
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    .collect 5210,1
    .target Ardwyn Cailen
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >>训练你的职业法术
    .target Ursula Deline
step << Rogue
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Osborne|r交谈
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wu|r或|cRXP_FRIENDLY_Ilsa|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >>训练你的职业法术
    .target Wu Shen
    .target Ilsa Corbin
step << Druid
    .goto StormwindClassic,20.898,55.491
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙德拉斯·月树|r谈话
    .trainer >>训练你的职业法术
    .target Sheldras Moontree
step << !Hunter !Priest
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .train 201 >>学习1小时剑术 << Mage/Rogue/Warlock
    .train 1180 >>学习匕首技能 << Mage/Druid
    .train 202 >>学习两小时剑术 << Warrior/Paladin
    .target Woo Ping
step << Rogue
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买|r|T135324:0|t[长剑] |cRXP_BUY_和|r|T135342:0|t[波刃短剑]
    >>|cRXP_WARN_在你的主手装备|r|T135324:0|t[长剑]|cRXP_WARN_, 并在副手装备|r|T135342:0|t[波刃短剑]|r
    .collect 923,1 --Longsword
    .collect 2209,1 --Kris
    .target Marda Weller
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>请尽快在赤脊山购买以下物品, 以便更快地提交任务
    >>这将节省你的时间, 因为你无需到处寻找怪物击杀. 如果你想不购买任何物品, 请跳过此步骤
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    >>|T134572:0|t[瑞斯班矿石]
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .collect 2798,5,347,1 -- Rethban Ore (5)
    .target Auctioneer Jaxon
step << !NightElf
    .goto StormwindClassic,66.27,62.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Redridge >>飞往赤脊山
    .target Dungar Longdrink
step << NightElf
    #label ExitSW
    .goto StormwindClassic,73.2,92.1
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
    .zoneskip Redridge Mountains
step << NightElf
    #completewith GParker
    #label start
    .goto Redridge Mountains,15.27,71.45
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
step << NightElf
    #label GParker
    .goto Redridge Mountains,15.27,71.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
    .target Guard Parker
step << NightElf
    .goto Redridge Mountains,30.73,59.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .target Deputy Feldon
    .accept 246 >>接任务: |cRXP_LOOT_审时度势|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .goto Redridge Mountains,32.13,48.63
    .accept 125 >>接任务: |cRXP_LOOT_丢失的工具|r
    .target Foreman Oslow
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .accept 118 >>接任务: |cRXP_LOOT_马掌|r
step
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_所罗门镇长|r交谈
	.target Magistrate Solomon
    .accept 120 >>接任务: |cRXP_LOOT_送往暴风城的信|r
step
    .goto Redridge Mountains,26.80,44.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达希|r交谈
    >>|cRXP_FRIENDLY_达希|r|cRXP_WARN_在旅店内部来回走动|r
	.target Darcy
    .accept 129 >>接任务: |cRXP_LOOT_免费的午餐|r
step
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_黑衣威利|r交谈
    .turnin 65 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 132 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
	.target Wiley the Black
step
    #era/som
    .goto Redridge Mountains,22.67,43.83
    >>离开旅店
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r交谈
	.target Chef Breanna
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖恩|r交谈
	.target Shawn
    .goto Redridge Mountains,29.31,53.63
    .accept 3741 >>接任务: |cRXP_LOOT_希拉里的项链|r
step
    >>|cRXP_WARN_跳入湖中|r
    >>打开|cRXP_PICK_闪光的泥浆|r, 从中获取|cRXP_LOOT_希拉里的项链|r
    >>|cRXP_WARN_它在湖中有多个刷新点|r
    .goto Redridge Mountains,27.80,56.05,0
    .goto Redridge Mountains,26.56,50.63,0
    .goto Redridge Mountains,23.96,55.17,0
    .goto Redridge Mountains,19.16,51.75,0
    .goto Redridge Mountains,31.12,54.21,0
    .goto Redridge Mountains,34.03,55.34,0
    .goto Redridge Mountains,38.09,54.49,0
    .goto Redridge Mountains,19.16,51.75,70,0
    .goto Redridge Mountains,38.09,54.49,70,0
    .complete 3741,1 --Hilary's Necklace (1)
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希拉里|r交谈
    .goto Redridge Mountains,29.24,53.63
    .turnin 3741 >>交任务: |cRXP_FRIENDLY_希拉里的项链|r
    .target Hilary
step
    .goto Redridge Mountains,30.59,59.42
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
	.target Ariena Stormfeather
    .fly Westfall >>飞往西部荒野
step
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 132 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 135 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
step
    .goto Westfall,56.55,52.64
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >>飞往暴风城
    .target Thor
step
    .goto StormwindClassic,63.982,75.338
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马库斯·乔纳森将军|r 交谈
    .turnin 120 >>交任务: |cRXP_FRIENDLY_送往暴风城的信|r
    .accept 121 >>接任务: |cRXP_LOOT_送往暴风城的信|r
    .target General Marcus Jonathan
step
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,10 >>进入瑞兹尔·铜栓总部, 沿楼梯向上前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r 
step
    .goto StormwindClassic,75.78,59.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .turnin 135 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 141 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Master Mathias Shaw
step
    #completewith next
    .goto StormwindClassic,66.27,62.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >>飞往西部荒野
    .target Dungar Longdrink
step
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 141 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 142 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
step
    #completewith next
    .goto Westfall,44.50,69.62,55 >>前往月溪镇
step
    .goto Westfall,44.50,69.62
    .line Westfall,44.50,69.62,44.50,69.62,45.08,69.40,45.21,69.35,45.63,68.69,45.85,67.73,45.62,66.99,45.52,65.71,45.61,64.95,44.28,63.88,44.26,62.80,43.60,59.89,43.37,58.42,43.26,57.01,43.12,54.24,42.15,52.74,41.74,51.42,41.48,49.89,40.91,48.71,38.93,46.05,38.51,45.46,37.85,45.54,36.60,44.21,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.26,43.77,36.87,42.87,36.95,40.85,37.04,39.79,37.91,36.98,39.06,35.58,40.48,34.31,41.27,32.87,41.76,31.27,42.26,30.26,43.20,28.99,44.29,28.19,44.64,26.85,44.57,24.94,44.64,26.85,44.29,28.19,43.20,28.99,42.26,30.26,41.76,31.27,41.27,32.87,40.48,34.31,39.06,35.58,37.91,36.98,37.04,39.79,36.95,40.85,36.87,42.87,36.26,43.77,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.60,44.21,37.85,45.54,38.51,45.46,38.93,46.05,40.91,48.71,41.48,49.89,41.74,51.42,42.15,52.74,43.12,54.24,43.26,57.01,43.37,58.42,43.60,59.89,44.26,62.80,44.28,63.88,45.61,64.95,45.52,65.71,45.62,66.99,45.85,67.73,45.63,68.69,45.21,69.35,45.08,69.40,44.50,69.62
    >>击杀|cRXP_ENEMY_迪菲亚信使|r, 搜刮出他的|cRXP_LOOT_神秘信息|r
    >>|cRXP_WARN_|cRXP_ENEMY_迪菲亚信使|r 会在月溪镇生成. 他会沿着月溪镇以北的道路, 前往金海岸采石场和江戈洛德矿场. 如果你在路上没有看到他, 请等待他在月溪镇重新出现|r
    >>|cRXP_WARN_他有4到5分钟的刷新时间|r
    .complete 142,1 -- A Mysterious Message (1)
    .unitscan Defias Messenger
step
    #completewith next
    .goto Westfall,30.01,86.02,40 >>前往西部荒野灯塔
step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .accept 104 >>接任务: |cRXP_WARN_海岸上的威胁|r
    .accept 103 >>接任务: |cRXP_WARN_长明的灯塔|r
    .target Captain Grayson
step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈  
    .turnin 103 >>交任务: |cRXP_FRIENDLY_长明的灯塔|r
    .itemcount 814,5 -- Flask of Oil (5)
    .target Captain Grayson
step
    .goto Westfall,34.43,83.93
    .line Westfall,34.43,83.93,34.43,83.93,33.88,83.32,33.08,82.86,32.56,82.71,32.08,82.49,31.91,82.36,31.55,81.88,30.86,81.42,30.63,81.16,30.33,80.81,30.02,80.11,29.68,79.22,29.32,78.19,29.29,77.60,29.27,77.31,29.18,76.26,29.07,75.29,28.95,74.14,28.85,73.29,28.79,72.48,28.37,71.94,27.84,71.29,27.44,70.25,27.29,69.47,27.13,68.65,27.09,67.57,27.07,67.01,26.74,66.09,27.07,67.01,27.09,67.57,27.13,68.65,27.29,69.47,27.44,70.25,27.84,71.29,28.37,71.94,28.79,72.48,28.85,73.29,28.95,74.14,29.07,75.29,29.18,76.26,29.27,77.31,29.29,77.60,29.32,78.19,29.68,79.22,30.02,80.11,30.33,80.81,30.63,81.16,30.86,81.42,31.55,81.88,31.91,82.36,32.08,82.49,32.56,82.71,33.08,82.86,33.88,83.32,34.43,83.93
    >>击杀|cRXP_ENEMY_老瞎眼|r. 击败他后搜刮其掉落的|cRXP_LOOT_Scale|r
    >>|cRXP_ENEMY_老瞎眼|r|cRXP_WARN_在长岸一带巡逻. 如果你在长岸没看到他, 就等他刷新到最南边的|cRXP_ENEMY_鱼人|r营地|r
    .complete 104,1 -- Scale of Old Murk-Eye (1)
    .unitscan Old Murk-Eye
step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈  
    .turnin 104 >>交任务: |cRXP_FRIENDLY_海岸上的威胁|r
    .target Captain Grayson
step
    .abandon 103 >>放弃长明的灯塔
step
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 142 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
step
    .goto Westfall,55.68,47.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪菲亚叛徒|r交谈
    >>|cRXP_WARN_如果他不在那里, 你可能需要等待|cRXP_FRIENDLY_迪菲亚叛徒|r生成|r
    .accept 155 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target The Defias Traitor
step
    .goto Westfall,42.56,71.71
    >>护送|cRXP_FRIENDLY_迪菲亚叛徒|r到死亡矿井
    >>|cRXP_WARN_时刻待在|cRXP_FRIENDLY_迪菲亚叛徒|r身边！抵达月溪镇后, 随时准备对抗|cRXP_ENEMY_迪菲亚|r|r
    .complete 155,1 -- Escort The Defias Traitor to discover where VanCleef is hiding (1)
    .target The Defias Traitor
step
    .goto Westfall,25.90,47.76
    >>|cRXP_WARN_使用 |T134269:0|t[|cRXP_LOOT_桑德船长的珍宝地图|r] 开始任务|r
    .use 1357
    .accept 136 >>接任务: |cRXP_WARN_杉德尔船长的宝藏|r
    .itemcount 1357,1 -- Captain Sanders' Treasure Map (1)
step
    .goto Westfall,25.90,47.76
    >>点击|cRXP_PICK_船长的手提箱|r
    .turnin 136 >>交任务: |cRXP_FRIENDLY_杉德尔船长的宝藏|r
    .itemcount 1357,1 -- Captain Sanders' Treasure Map (1)
step
    .goto Westfall,25.90,47.76
    >>点击|cRXP_PICK_船长的手提箱|r
    .accept 138 >>接任务: |cRXP_WARN_杉德尔船长的宝藏|r
    .isQuestTurnedIn 136
step
    .goto Westfall,40.51,47.80
    >>点击|cRXP_PICK_破损的桶|r
    .turnin 138 >>交任务: |cRXP_FRIENDLY_杉德尔船长的宝藏|r
    .accept 139 >>接任务: |cRXP_WARN_杉德尔船长的宝藏|r
    .isQuestTurnedIn 136 
step
    .goto Westfall,40.63,17.03
    >>点击|cRXP_PICK_旧罐子|r
    .turnin 139 >>交任务: |cRXP_FRIENDLY_杉德尔船长的宝藏|r
    .accept 140 >>接任务: |cRXP_WARN_杉德尔船长的宝藏|r
    .isQuestTurnedIn 138 
step
    #completewith next
    .goto Westfall,25.97,16.90,30 >>游到岛屿上
    .isOnQuest 140
step
    .goto Westfall,25.97,16.90
    >>点击|cRXP_PICK_锁住的箱子|r
    .turnin 140 >>交任务: |cRXP_FRIENDLY_杉德尔船长的宝藏|r
    .isOnQuest 140
step
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 155 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|cRXP_FRIENDLY_格里安·斯托曼和哨兵瑞尔|r交谈
    .accept 166 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target +Gryan Stoutmantle
    .goto Westfall,56.33,47.52
    .accept 214 >>接任务: |cRXP_WARN_红色丝质面罩|r
    .goto Westfall,56.67,47.35
    .target +Scout Riell
step
.dungeon DM
    .goto Westfall,60.4,72.2
    .goto Westfall,40.4,71.6
    .subzone 1581 >>现在你应该寻找一个团队前往死亡矿井
    >>在组建死亡矿井队伍的同时刷豺狼人
step
.dungeon DM
    .goto Westfall,42.55,71.69
    .subzone 1581 >>前往死亡矿井
step
.dungeon DM
    #completewith EnterDM
    >>击杀|cRXP_ENEMY_Defias|r. 搜刮他们的|cRXP_LOOT_Bandanas|r
    >>|cRXP_WARN_你可以在进入地下城后完成此任务|r
    .complete 214,1 -- Red Silk Bandana (10)
step
.dungeon DM
    #completewith next 
    >>击杀|cRXP_ENEMY_骷髅矿工|r和|cRXP_ENEMY_亡灵爆破者|r和|cRXP_ENEMY_亡灵挖掘者|r, 掠夺他们的|cRXP_LOOT_卡片|r
    >>|cRXP_WARN_这是在副本外完成的|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
step
.dungeon DM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_工头希斯耐特|r. 从他身上搜刮|cRXP_LOOT_勋章|r
    >>|cRXP_WARN_这是在副本外完成的|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan Foreman Thistlenettle
step
.dungeon DM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_骷髅矿工|r和|cRXP_ENEMY_亡灵爆破者|r和|cRXP_ENEMY_亡灵挖掘者|r, 掠夺他们的|cRXP_LOOT_卡片|r
    >>|cRXP_WARN_这是在副本外完成的|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
step
.dungeon DM
    #label EnterDM
    .goto 1415,40.94,79.76,25,0
    .goto 1415,40.86,79.62,20,0
    .goto 1415,40.678,79.578
    .subzone 1581,2 >>进入死亡矿井副本
step
.dungeon DM
    #completewith DMend
    >>击杀死亡矿井内的|cRXP_ENEMY_Defias|r, 搜刮他们掉落的|cRXP_LOOT_Bandanas|r
    .complete 214,1 -- Red Silk Bandana (10)
step
.dungeon DM
    >>击杀|cRXP_ENEMY_斯尼德|r. 击败他后搜刮出|cRXP_LOOT_小型高能发动机|r
    .complete 2040,1 -- Gnoam Sprecklesprocket (1)
step
.dungeon DM
    >>击杀|cRXP_ENEMY_艾德温·范克里夫|r, 搜刮他的|cRXP_LOOT_头颅|r和 |T133471:0|t[|cRXP_LOOT_未寄出的信|r]
    >>|cRXP_WARN_使用 |T133471:0|t[|cRXP_LOOT_未寄出的信|r] 开始任务|r
    .collect 2874,1,373 -- An Unsent Letter (1)
    .complete 166,1 -- Head of VanCleef (1)
    .accept 373 >>接任务: |cRXP_WARN_未寄出的信|r
    .use 2874 -- An Unsent Letter
step
.dungeon DM
    #label DMend
    #completewith next
    .goto Westfall,56.33,47.52,100 >>前往哨兵岭
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|cRXP_FRIENDLY_格里安·斯托曼和哨兵瑞尔|r交谈
    .turnin 166 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .target +Gryan Stoutmantle
    .goto Westfall,56.33,47.52
    .turnin 214 >>交任务: |cRXP_FRIENDLY_红色丝质面罩|r
    .goto Westfall,56.67,47.35
    .target +Scout Riell
step
.dungeon DM
    #completewith next
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >>飞往暴风城
    .target Thor
step
.dungeon DM
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿古斯·夜语|r交谈
	.target Argos Nightwhisper
    .goto StormwindClassic,21.40,55.80
    .accept 3765 >>接任务: |cRXP_LOOT_遥远的旅途|r
step
.dungeon DM
    .goto StormwindClassic,45.694,38.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克里斯托弗修士|r交谈
    >>如果你等级还未达到20级, 请跳过此步骤
    .accept 343 >>接任务: |cRXP_WARN_关于坚韧的演讲|r
    .target Brother Kristoff
    .xp <20,1
step
.dungeon DM
    .goto StormwindClassic,48.079,30.913,10,0
    .goto StormwindClassic,49.193,30.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r交谈
    .turnin 373 >>交任务: |cRXP_FRIENDLY_未寄出的信|r
    .accept 389 >>接任务: |cRXP_WARN_巴吉尔·特雷德|r
    .target Baros Alexston
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔德·蓟草|cRXP_FRIENDLY_和|r沉默的舒尼|cRXP_FRIENDLY_交谈
    .turnin 167 >>交任务: |cRXP_FRIENDLY_我的兄弟……|r
    .turnin 168 >>交任务: |cRXP_FRIENDLY_收集记忆|r
    .target +Wilder Thistlenettle
    .goto StormwindClassic,65.438,21.175
    .turnin 2040 >>交任务: |cRXP_FRIENDLY_地底突袭|r
    .goto StormwindClassic,55.510,12.504
    .target +Shoni the Shilent
step -- adding again 2nd time incase hitting 20 after turning in triple DM quests
.dungeon DM
    .goto StormwindClassic,45.694,38.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克里斯托弗修士|r交谈
    >>如果你等级还未达到20级, 请跳过此步骤
    .accept 343 >>接任务: |cRXP_WARN_关于坚韧的演讲|r
    .target Brother Kristoff
    .xp <20,1
step
.dungeon DM
    #completewith next
    .goto StormwindClassic,70.439,27.097,15,0
    .goto StormwindClassic,72.003,21.525,15,0
    .goto StormwindClassic,70.713,10.717,15 >>前往暴风城图书馆找|cRXP_FRIENDLY_米尔顿·西弗|r
    .xp <20,1
step
.dungeon DM
    .goto StormwindClassic,74.182,7.465
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔顿·西弗|r交谈
    >>如果你等级还未达到20级, 请跳过此步骤
    .turnin 343 >>交任务: |cRXP_FRIENDLY_关于坚韧的演讲|r
    .accept 344 >>接任务: |cRXP_WARN_帕克斯顿修士|r
    .target Milton Sheaf
    .xp <20,1
step
.dungeon DM
    .goto StormwindClassic,42.435,59.236,10,0
    .goto StormwindClassic,41.102,58.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_典狱官塞尔沃特|cRXP_FRIENDLY_典狱官塞尔沃特|r交谈
    .turnin 389 >>交任务: |cRXP_FRIENDLY_巴吉尔·特雷德|r
--  .accept 391 >>接任务: |cRXP_WARN_监狱暴动|r
    .target Warden Thelwater
step
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    >>如果你还在西部荒野, 就飞往赤脊山
    .fly Redridge >>飞往赤脊山
    .target Thor
    .zoneskip Westfall,1
step
.dungeon DM
    .isQuestTurnedIn 343
    #completewith next
    .goto Elwynn Forest,32.240,49.723,60 >>前往: |cRXP_PICK_艾尔文森林|r
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 343
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
	.target Smith Argus
    .turnin 118 >>交任务: |cRXP_FRIENDLY_马掌|r
    .accept 119 >>接任务: |cRXP_LOOT_回复弗纳|r
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 343
    #completewith next
    .goto Elwynn Forest,45.81,47.73,20,0
    .goto Elwynn Forest,48.61,41.80,15 >>前往北郡修道院
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 343
    .goto Elwynn Forest,49.60,40.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与帕克斯顿修士交谈|cRXP_FRIENDLY_帕克斯顿修士|r
    .turnin 344 >>交任务: |cRXP_FRIENDLY_帕克斯顿修士|r
    .accept 345 >>接任务: |cRXP_WARN_墨水短缺|r
    .target Brother Paxton
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 343
    #completewith next
    .goto Elwynn Forest,57.518,51.595,25,0
    .goto Elwynn Forest,58.14,52.50,20,0
    .goto Elwynn Forest,65.20,69.80,50 >>前往阿佐拉塔. 登上塔楼. 沿箭头指示, 通过山中的捷径
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 343
    .goto Elwynn Forest,65.22,69.71
    .target Theocritus
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与位于顶部的|cRXP_FRIENDLY_塞欧克瑞图斯|r交谈
    .accept 94 >>接任务: |cRXP_LOOT_法师的眼线|r
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 343
    .goto Elwynn Forest,64.880,69.192
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_当恩·布赖特斯塔|r交谈
    .vendor >>|cRXP_FRIENDLY_当恩·布赖特斯塔|r|cRXP_BUY_拥有有限供应的物品, 例如|r|T134938:0|t|T134937:0|t|T134943:0|t[卷轴] |cRXP_BUY_和|r|T134850:0|t|T134830:0|t[药水] |cRXP_BUY_, 如果 available(可购买), 建议优先购买|r << !Warrior !Rogue
    .vendor >>|cRXP_FRIENDLY_当恩·布赖特斯塔|r|cRXP_BUY_有有限供应的物品, 例如|r|T134938:0|t|T134937:0|t|T134943:0|t[卷轴] |cRXP_BUY_和|r|T134830:0|t[药水] |cRXP_BUY_, 如果 available 就应该购买|r << Warrior/Rogue
    .target Dawn Brightstar
    .subzoneskip 91,1
step
.dungeon DM
    .isQuestTurnedIn 343
    #completewith FlyR
	.goto Redridge Mountains,6.7,72.4
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    .zoneskip Elwynn Forest,1
step
    .goto StormwindClassic,66.27,62.12,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Redridge >>飞往赤脊山
    .target Dungar Longdrink
    .zoneskip Stormwind City,1
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
	.target Guard Parker
    .goto Redridge Mountains,15.30,71.50
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
	.target Guard Parker
    .goto Redridge Mountains,15.27,71.45
    .turnin 129 >>交任务: |cRXP_FRIENDLY_免费的午餐|r
    .accept 130 >>接任务: |cRXP_LOOT_寻访草药师|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
	.target Deputy Feldon
    .goto Redridge Mountains,30.70,60.00
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .accept 246 >>接任务: |cRXP_LOOT_审时度势|r
step
    .isQuestTurnedIn 343
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .goto Redridge Mountains,32.13,48.63
    .turnin 345 >>交任务: |cRXP_FRIENDLY_墨水短缺|r
    .target Foreman Oslow
step
    .isQuestTurnedIn 118
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .turnin 119 >>交任务: |cRXP_FRIENDLY_回复弗纳|r
    .accept 124 >>接任务: |cRXP_LOOT_豺狼人的乱吠|r
    .accept 122 >>接任务: |cRXP_LOOT_雏龙的鳞片|r
step
    #era/som
    #completewith MongrelPoacher
    >>击杀|cRXP_ENEMY_巨型血牙野猪|r. 击败后可获得其|cRXP_LOOT_巨型血牙野猪头|r
    >>击杀|cRXP_ENEMY_狼蛛|r. 击败后可获得其掉落的|cRXP_LOOT_香脆蜘蛛肉|r
    >>击杀|cRXP_ENEMY_恐鹫|r. 击败它们后掠夺|cRXP_LOOT_硬秃鹫肉|r
    >>|cRXP_WARN_在完成“赤脊山炖肉”任务之前, 请勿出售任何这些物品|r
    >>|cRXP_WARN_拾取任何|r |T133970:0|t|cRXP_LOOT_[野猪碎肉]|r |cRXP_WARN_你拾取的越多, 越有助于提升烹饪技能|r |T133971:0|t[烹饪] |cRXP_WARN_至50级, 这是后续进入暮色森林所必需的|r
    .collect 2296,5,92,1
    .mob +Great Goretusk
    .collect 1080,5,92,1
    .mob +Dire Condor
    .collect 1081,5,92,1
    .mob +Tarantula
step
    .isOnQuest 122
    #completewith Toolbox
    >>击杀 |cRXP_ENEMY_黑龙雏龙|r. 击败它们后搜刮其 |cRXP_LOOT_鳞片|r
    >>你现在不必立即完成这个任务
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob Black Dragon Whelp
step
    #label MongrelPoacher
    .goto Redridge Mountains,15.91,62.76,0
    .goto Redridge Mountains,43.44,70.61,0
    .goto Redridge Mountains,29.49,82.80,45,0
    .goto Redridge Mountains,32.52,81.78,45,0
    .goto Redridge Mountains,43.18,72.22,45,0
    .goto Redridge Mountains,31.13,82.18
	>>击杀|cRXP_ENEMY_混血赤脊山豺狼人|r 和|cRXP_ENEMY_赤脊山偷猎者|r
    .complete 246,1 --Redridge Mongrel (10)
    .mob +Redridge Mongrel
    .complete 246,2 --Redridge Poacher (6)
	.mob +Redridge Poacher
step
    #era/som
    #completewith next
    >>击杀|cRXP_ENEMY_巨型血牙野猪|r. 击败后可获得其|cRXP_LOOT_巨型血牙野猪头|r
    >>击杀|cRXP_ENEMY_恐鹫|r. 击败它们后掠夺|cRXP_LOOT_硬秃鹫肉|r
    >>|cRXP_WARN_在完成“赤脊山炖肉”任务之前, 请勿出售任何这些物品|r
    >>|cRXP_WARN_拾取任何|r |T133970:0|t|cRXP_LOOT_[野猪碎肉]|r |cRXP_WARN_你拾取的越多, 越有助于提升烹饪技能|r |T133971:0|t[烹饪] |cRXP_WARN_至50级, 这是后续进入暮色森林所必需的|r
    .collect 2296,5,92,1
    .mob +Great Goretusk
    .collect 1080,5,92,1
    .mob +Dire Condor
step
    #era/som
    .goto Redridge Mountains,21.22,67.77,45,0
    .goto Redridge Mountains,17.70,73.39,45,0
    .goto Redridge Mountains,11.20,76.31,45,0
    .goto Redridge Mountains,13.37,81.48,45,0
    .goto Redridge Mountains,18.86,73.63
    >>击杀|cRXP_ENEMY_狼蛛|r. 击败后可获得其掉落的|cRXP_LOOT_香脆蜘蛛肉|r
    .collect 1081,5,92,1
    .mob Tarantula
step
    #era/som
    >>击杀|cRXP_ENEMY_巨型血牙野猪|r. 击败后可获得其|cRXP_LOOT_巨型血牙野猪头|r
    >>击杀|cRXP_ENEMY_恐鹫|r. 击败它们后掠夺|cRXP_LOOT_硬秃鹫肉|r
    >>|cRXP_WARN_在完成“赤脊山炖肉”任务之前, 请勿出售任何这些物品|r
    >>|cRXP_WARN_拾取任何|r |T133970:0|t|cRXP_LOOT_[野猪碎肉]|r |cRXP_WARN_你拾取的越多, 越有助于提升烹饪技能|r |T133971:0|t[烹饪] |cRXP_WARN_至50级, 这是后续进入暮色森林所必需的|r
    .collect 1080,5,92,1
    .mob +Dire Condor
    .goto Redridge Mountains,66.4,76.6,60,0
    .goto Redridge Mountains,35.6,69.6,60,0
    .goto Redridge Mountains,45.4,76.6
    .goto Redridge Mountains,35.6,69.6,0
    .collect 2296,5,92,1
    .goto Redridge Mountains,15.73,52.83,60,0
    .goto Redridge Mountains,32.25,70.20,60,0
    .goto Redridge Mountains,31.02,72.14,60,0
    .goto Redridge Mountains,15.73,52.83
    .mob +Great Goretusk
step
    #label Toolbox
    >>|cRXP_WARN_跳入湖中. 注意水中巡逻的精英|cRXP_ENEMY_止水湖蛇颈龙|r|r 
    >>打开|cRXP_PICK_沉没的箱子|r, 搜刮出|cRXP_LOOT_奥洛斯的工具箱|r
    .goto Redridge Mountains,41.52,54.68
    .complete 125,1 --Oslow's Toolbox (1)
step
    .goto Redridge Mountains,49.0,70.0
    .xp 20-3000 >>刷怪直到距离20级还差3000点经验值
step
    #completewith next
    .goto Redridge Mountains,30.73,59.99,150 >>前往湖畔镇
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
	.target Foreman Oslow
    .goto Redridge Mountains,32.13,48.63
    .turnin 125 >>交任务: |cRXP_FRIENDLY_丢失的工具|r
    .accept 89 >>接任务: |cRXP_LOOT_止水湖上的桥|r
step
    #era
    .isQuestComplete 122
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    >>如果你尚未完成“雏龙的鳞片”任务, 请跳过此步骤, 稍后将再进行
	.target Verner Osgood
    .goto Redridge Mountains,31.00,47.30
    .turnin 122 >>交任务: |cRXP_FRIENDLY_雏龙的鳞片|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官索拉曼|r交谈
	.target Magistrate Solomon
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    .turnin 121 >>交任务: |cRXP_FRIENDLY_送往暴风城的信|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛蒂·詹罗斯|r交谈
	.target Martie Jainrose
    .goto Redridge Mountains,21.86,46.33
    .turnin 130 >>交任务: |cRXP_FRIENDLY_寻访草药师|r
    .accept 131 >>接任务: |cRXP_LOOT_水仙诉衷情|r
step
    #era/som
    .isQuestComplete 92
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r交谈
	.target Chef Breanna
    .goto Redridge Mountains,22.67,43.83
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达希|r交谈
    >>|cRXP_FRIENDLY_达希|r|cRXP_WARN_在旅店内部来回走动|r
	.target Darcy
    .goto Redridge Mountains,26.80,44.30
    .turnin 131 >>交任务: |cRXP_FRIENDLY_水仙诉衷情|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
	.target Deputy Feldon
    .goto Redridge Mountains,30.73,59.99
    .turnin 246 >>交任务: |cRXP_FRIENDLY_审时度势|r
step
    .xp 20 >>飞行前往暴风城前, 请确保角色等级已达到20级
step
    .goto Redridge Mountains,30.59,59.42
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
	.target Ariena Stormfeather
    .fly Stormwind >>飞往暴风城
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >>训练你的职业法术
    .target Ursula Deline
step << Warlock
    .goto StormwindClassic,25.665,77.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯巴克尔|r交谈
    .vendor >>|cRXP_BUY_购买|r|T133738:0|t[魔典：折磨(等级 2)]
    .target Spackle Thornberry
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .accept 1716 >>接任务: |cRXP_LOOT_噬魂者|r
    .target Gakin the Darkbinder
step << Mage
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >>前往法师塔
step << Mage
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .trainer >>训练你的职业法术
    .target Elsharin
step << Mage
    .goto StormwindClassic,39.68,79.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉瑞麦尼|r交谈
    .train 3561 >>坐火车 |T135763:0|t[传送:暴风城]
	.xp <20,1
    .target Larimaine Purdue
step << Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙德拉斯·月树|r谈话
    .goto StormwindClassic,20.89,55.50
    .trainer >>训练你的职业法术
    .train 768 >>训练 |T132115:0|t[猫形态]
    .target Sheldras Moontree
step << Rogue
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买 a|r|T135324:0|t[长剑]|cRXP_BUY_并在21级时装备它|r
    >>|cRXP_BUY_如果拍卖行有更便宜或更好的物品, 就买一些|r
    >>|cRXP_WARN_如果已有更好的选择, 请跳过此步骤|r
    .collect 923,1 --Longsword (1)
    .target Marda Weller
step << !Dwarf Rogue
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>购买 |T134437:0|t[抗毒药剂], 以备稍后完成 |T132290:0|t[毒药] 任务时使用
    >>这将节省你的时间, 因为你不用到处跑着找怪杀. 如果你想不买, 可以跳过这一步
    .collect 6452,1,2359,1 --Anti-Venom (1)
    .target Auctioneer Jaxon
step << Rogue
    #hardcore
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买 a|r|T135324:0|t[长剑]|cRXP_BUY_并在21级时装备它|r
    >>|cRXP_WARN_如果已有更好的选择, 请跳过此步骤|r
    .collect 923,1 --Longsword (1)
    .target Marda Weller
step << Warrior/Paladin
    #ah
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_如果你有足够的钱, 可以买|r|T135280:0|t[微光重剑]|cRXP_BUY_. 在21级时装备它|r
    >>|cRXP_BUY_如果拍卖行有更便宜或更好的物品, 就买一些|r
    >>|cRXP_WARN_如果已有更好的选择, 请跳过此步骤|r
    .collect 922,1 --Dacian Falx (1)
    .target Gunther Weller
step << Warrior/Paladin
    #hardcore
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_如果你有足够的钱, 可以买|r|T135280:0|t[微光重剑]|cRXP_BUY_. 在21级时装备它|r
    >>|cRXP_WARN_如果已有更好的选择, 请跳过此步骤|r
    .collect 922,1 --Dacian Falx (1)
    .target Gunther Weller
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿古斯·夜语|r交谈
	.target Argos Nightwhisper
    .goto StormwindClassic,21.40,55.80
    .accept 3765 >>接任务: |cRXP_LOOT_遥远的旅途|r
step
    .goto StormwindClassic,45.694,38.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克里斯托弗修士|r交谈
    .accept 343 >>接任务: |cRXP_WARN_关于坚韧的演讲|r
    .target Brother Kristoff
step << Paladin/Priest
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step << Paladin
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈. 他会给你一本|T133739:0|t[|cRXP_LOOT_勇气之书|r]
    .use 6776 >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_勇气之书|r] 开始任务|r
    .collect 6776,1,1649 --Tome of Valor (1)
    .accept 1649 >>接任务: |cRXP_LOOT_勇气之书|r
    .target Duthorian Rall
step << Paladin
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1649 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .target Duthorian Rall
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    .trainer >>训练你的职业法术
    .target Arthur the Faithful
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒修士|r谈话 
    .goto StormwindClassic,38.54,26.86
    .trainer >>训练你的职业法术
    .target Brother Joshua
step
    #completewith next
    .goto StormwindClassic,70.439,27.097,15,0
    .goto StormwindClassic,72.003,21.525,15,0
    .goto StormwindClassic,70.713,10.717,15 >>前往暴风城图书馆找|cRXP_FRIENDLY_米尔顿·西弗|r
step
    .goto StormwindClassic,74.182,7.465
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔顿·西弗|r交谈
    .turnin 343 >>交任务: |cRXP_FRIENDLY_关于坚韧的演讲|r
    .accept 344 >>接任务: |cRXP_WARN_帕克斯顿修士|r
    .target Milton Sheaf
step << Hunter
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
    .trainer >>训练你的职业法术
    .target Einris Brightspear
step << Rogue
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Osborne|r交谈
    .trainer >>训练你的职业法术
    .train 1804 >>学习撬锁技能 |T136058:0|t[撬锁]
    .target Osborne the Night Man
step << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >>进入SI:7总部. 沿着楼梯向上, 前往|cRXP_FRIENDLY_“剃刀”雷吉克|r和|cRXP_FRIENDLY_马迪亚斯·肖尔|r
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“剃刀”雷吉克|r和|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .accept 2281 >>接任务: |cRXP_LOOT_赤脊山的联络员|r
    .target +Renzik "The Shiv"
    .goto StormwindClassic,75.76,60.35
    .accept 2360 >>接任务: |cRXP_LOOT_马迪亚斯和迪菲亚潜行者|r
    .goto StormwindClassic,75.78,59.84
    .target +Master Mathias Shaw
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wu|r或|cRXP_FRIENDLY_Ilsa|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >>训练你的职业法术
    .target Wu Shen
    .target Ilsa Corbin
step
    #completewith next
    .goto Elwynn Forest,32.240,49.723,60 >>前往: |cRXP_PICK_艾尔文森林|r
step
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
	.target Smith Argus
    .turnin 118 >>交任务: |cRXP_FRIENDLY_马掌|r
    .accept 119 >>接任务: |cRXP_LOOT_回复弗纳|r
step
    #completewith next
    .goto Elwynn Forest,45.81,47.73,20,0
    .goto Elwynn Forest,48.61,41.80,15 >>前往北郡修道院
step
    .goto Elwynn Forest,49.60,40.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与帕克斯顿修士交谈|cRXP_FRIENDLY_帕克斯顿修士|r
    .turnin 344 >>交任务: |cRXP_FRIENDLY_帕克斯顿修士|r
    .accept 345 >>接任务: |cRXP_WARN_墨水短缺|r
    .target Brother Paxton
step
    #completewith next
    .goto Elwynn Forest,57.518,51.595,25,0
    .goto Elwynn Forest,58.14,52.50,20,0
    .goto Elwynn Forest,65.20,69.80,50 >>前往阿佐拉塔. 登上塔楼. 沿箭头指示, 通过山中的捷径
step
    .goto Elwynn Forest,65.22,69.71
    .target Theocritus
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与位于顶部的|cRXP_FRIENDLY_塞欧克瑞图斯|r交谈
    .accept 94 >>接任务: |cRXP_LOOT_法师的眼线|r
step
    .goto Elwynn Forest,64.880,69.192
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_当恩·布赖特斯塔|r交谈
    .vendor >>|cRXP_FRIENDLY_当恩·布赖特斯塔|r|cRXP_BUY_拥有有限供应的物品, 例如|r|T134938:0|t|T134937:0|t|T134943:0|t[卷轴] |cRXP_BUY_和|r|T134850:0|t|T134830:0|t[药水] |cRXP_BUY_, 如果 available(可购买), 建议优先购买|r << !Warrior !Rogue
    .vendor >>|cRXP_FRIENDLY_当恩·布赖特斯塔|r|cRXP_BUY_有有限供应的物品, 例如|r|T134938:0|t|T134937:0|t|T134943:0|t[卷轴] |cRXP_BUY_和|r|T134830:0|t[药水] |cRXP_BUY_, 如果 available 就应该购买|r << Warrior/Rogue
    .target Dawn Brightstar
    .subzoneskip 91,1
step
    #completewith TravelRM
	.goto Redridge Mountains,6.7,72.4
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    .zoneskip Elwynn Forest,1
step
    .goto StormwindClassic,66.27,62.12,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    >>如果你在暴风城, 请飞往赤脊山脉
    .fly Redridge >>飞往赤脊山
    .target Dungar Longdrink
    .zoneskip Stormwind City,1
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
	.target Foreman Oslow
    .goto Redridge Mountains,32.13,48.63
    .turnin 345 >>交任务: |cRXP_FRIENDLY_墨水短缺|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .turnin 119 >>交任务: |cRXP_FRIENDLY_回复弗纳|r
    .accept 124 >>接任务: |cRXP_LOOT_豺狼人的乱吠|r
step
    #era
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .accept 122 >>接任务: |cRXP_LOOT_雏龙的鳞片|r
step << Rogue
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢修斯|r交谈
    .turnin 2281 >>交任务: |cRXP_FRIENDLY_赤脊山的联络员|r
    .target Lucius
    .accept 2282 >>接任务: |cRXP_LOOT_奥瑟尔伐木场|r
step
    #era
	#completewith next
	>>击杀 |cRXP_ENEMY_黑龙雏龙|r. 击败它们后搜刮其 |cRXP_LOOT_鳞片|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob Black Dragon Whelp
step
    #label TravelRM
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,22.5,35.7,0
    >>击杀|cRXP_ENEMY_赤脊山蛮兵|r 和|cRXP_ENEMY_赤脊山秘法师|r, 击败他们后搜刮其掉落的|cRXP_LOOT_铁矛|r 和|cRXP_LOOT_铁铆钉|r
    .complete 124,1 --Redridge Brute (10)
	.mob +Redridge Brute
    .complete 124,2 --Redridge Mystic (8)
    .mob +Redridge Mystic
    .complete 89,1 --Iron Pike (5)
    .mob +Redridge Mystic
	.mob +Redridge Brute
    .complete 89,2 --Iron Rivet (5)
	.mob +Redridge Mystic
	.mob +Redridge Brute
step << Rogue
    .goto Redridge Mountains,52.10,45.24
    +打开|cRXP_PICK_Practice Lockboxes|r, 直到你在 |T136058:0|t[开锁] 技能中达到80级
    .skill lockpicking,80,1
step << Rogue
	.goto Redridge Mountains,52.05,44.69
    >>打开|cRXP_PICK_卢修斯的箱子|r. 从中获取|cRXP_LOOT_偷窃技能证明物|r
    .complete 2282,1 --Token of Thievery
    .skill lockpicking,<80,1
step
    #era
    .goto Redridge Mountains,43.47,31.68,50,0
    .goto Redridge Mountains,46.52,35.66,50,0
    .goto Redridge Mountains,34.56,65.79,50,0
    .goto Redridge Mountains,36.58,73.93
	>>击杀 |cRXP_ENEMY_黑龙雏龙|r. 击败它们后搜刮其 |cRXP_LOOT_鳞片|r
	.mob Black Dragon Whelp
    .complete 122,1 --Underbelly Whelp Scale (6)
step
    #era
    #completewith next
    .goto Redridge Mountains,15.55,50.06,0
    .goto Redridge Mountains,19.24,41.53,0
    .goto Redridge Mountains,16.90,55.02,0
    .goto Redridge Mountains,26.52,44.95
    +|cRXP_WARN_升级你的|r |T133971:0|t[烹饪] |cRXP_WARN_使用之前你采集的|r |T133970:0|t|cRXP_LOOT_[野猪肉块]|r |cRXP_WARN_你需要等级达到50|r |T133971:0|t[烹饪]
    +|cRXP_WARN_如果你需要更多|r|T133970:0|t|cRXP_LOOT_[野猪肉块]|r|cRXP_WARN_前往西方附近|r|cRXP_ENEMY_贝利格拉布|r|cRXP_WARN_并击杀更多|r|cRXP_ENEMY_巨型血牙野猪|r|r
    .skill cooking,50,1
    .mob Great Goretusk
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
	.target Foreman Oslow
    .goto Redridge Mountains,32.10,48.70
    .turnin 89 >>交任务: |cRXP_FRIENDLY_止水湖上的桥|r
step
    #era
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,31.00,47.30
    .turnin 124 >>交任务: |cRXP_FRIENDLY_豺狼人的乱吠|r
    .turnin 122 >>交任务: |cRXP_FRIENDLY_雏龙的鳞片|r
step
    #som
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .turnin 124 >>交任务: |cRXP_FRIENDLY_豺狼人的乱吠|r
step << Rogue
    .goto Redridge Mountains,28.07,52.02
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢修斯|r交谈
    .turnin 2282 >>交任务: |cRXP_FRIENDLY_奥瑟尔伐木场|r
    .target Lucius
step << Rogue
    #sticky
    #optional
    .destroy 7907 >>摧毁: |cRXP_ENEMY_偷窃技能认证书|r, 它在你的背包中. 不再需要它了
step << NightElf Rogue
    #hardcore
    #optional
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fly Stormwind >>飞往暴风城
    .target Ariena Stormfeather
    .isOnQuest 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << NightElf Rogue
    #hardcore
    #optional
    .goto Westfall,56.55,52.64,5,0
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
    .isOnQuest 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << NightElf Rogue
    #hardcore
    #optional
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fp Westfall >>获取西部荒野的飞行路径
    .target Thor
    .isOnQuest 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << !NightElf Rogue
    #hardcore
    #optional
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fly Westfall >>飞往西部荒野
    .target Ariena Stormfeather
    .isOnQuest 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << !Dwarf Rogue
    #hardcore
    #optional
    .goto Duskwood,15.90,72.10,60,0
    .goto Duskwood,14.86,64.56,50,0
    .goto Duskwood,10.43,53.97
    >>击杀|cRXP_ENEMY_小型结网毒蜘蛛|r和|cRXP_ENEMY_结网毒蜘蛛|r. 击败它们可获得|cRXP_LOOT_小毒囊|r和它们的|cRXP_LOOT_粘糊的蜘蛛腿|r
    >>|cRXP_WARN_你需要一个|cRXP_LOOT_小毒囊|r来制作|T134437:0 |t[抗毒药剂], 稍后用于移除|T136230:0 |t[赞吉尔之触]的负面效果|r
    >>|cRXP_WARN_稍后保存粘糊的蜘蛛腿|r|r
    >>|cRXP_WARN_如果你有一个|r|T626003:0|t|cFFF48CBAS圣骑士|r |cRXP_WARN_或|r|T625999:0|t|cFFFF7C0AD德鲁伊|r |cRXP_WARN_的朋友, 可以跳过此步骤, 稍后再请他们帮你移除|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob Pygmy Venom Web Spider
    .mob Venom Web Spider
    .itemcount 6452,<1 --Anti Venom (<1)
    .isOnQuest 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << Rogue
    #hardcore
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==请注意即将出现的章节==|r
    >>|cRXP_WARN_按 Esc 键, 然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用互动键”, 并将“与目标互动”选项绑定到一个按键|r
    >>|cRXP_WARN_此外, 建议你启用敌人姓名板(默认键:V), 这样可以让你看到塔内某些角落后方的敌人|r
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << Rogue
    #hardcore
    #optional
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密探吉尔妮|r交谈
    >>|cRXP_WARN_你必须完成这个任务|r|T132290:0|t[毒药]
    .turnin 2360 >>交任务: |cRXP_FRIENDLY_马迪亚斯和迪菲亚潜行者|r
    .accept 2359 >>接任务: |cRXP_LOOT_克拉文之塔|r
    .target Agent Kearnen
    .isOnQuest 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << Rogue
    #hardcore
    #optional
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密探吉尔妮|r交谈
    >>|cRXP_WARN_你必须完成这个任务|r|T132290:0|t[毒药]
    .accept 2359 >>接任务: |cRXP_LOOT_克拉文之塔|r
    .target Agent Kearnen
    .isQuestTurnedIn 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << Rogue
    #hardcore
    #optional
    #label TowerKey
    #loop
    .goto Westfall,71.49,73.49,0
    .goto Westfall,71.01,75.72,0
    .goto Westfall,69.58,73.07,0
    .goto Westfall,71.49,73.49,30,0
    .goto Westfall,71.01,75.72,30,0
    .goto Westfall,69.58,73.07,30,0
    >>|T133644:0|t[劫掠]|cRXP_ENEMY_丑陋的迪菲亚懒汉|r. 将其击杀后获取|cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_WARN_|cRXP_ENEMY_丑陋的迪菲亚懒汉|r会在塔楼入口处生成, 然后在塔楼外围巡逻|r
    >>|cRXP_WARN_注意, 他会造成大量伤害. 如果你的|r|T132320:0|t[潜行]|cRXP_WARN_效果中断, 请迅速使用|r|T132307:0|t[冲刺]|cRXP_WARN_并逃离|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频攻略
    .mob Malformed Defias Drone
    .isOnQuest 2359
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << Rogue
    #hardcore
    #optional
    #completewith Mortwake
    +|cRXP_WARN_如果你尚未装备|r|T135641:0|t[曲木匕首]|cRXP_WARN_, 请为完成此任务装备|r|T135641:0|t[匕首]|r
    .use 15396
    .itemcount 15396,1
    .isOnQuest 2359
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << Rogue
    #hardcore
    #optional
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔楼的第二层顶层. 在处于|r|T132320:0|t[潜行]|cRXP_WARN_且|cRXP_ENEMY_Defias 塔哨兵|r不在你身边时, 跳上椅子, 再跳到灯上, 最后跳到路径点位置上方的书架上|r
    >>|cRXP_WARN_手动|r|T132320:0|t[解除隐身]|cRXP_WARN_, 然后按下你的“与目标互动”键绑定以开启|r|cRXP_PICK_暮色森林的箱子|r. 拾取其中的|r|cRXP_LOOT_克莱文·莫特韦克的日志|r|r
    >>|cRXP_WARN_注意:你的|r|T132320:0|t[潜行]|cRXP_WARN_在拾取物品后将暂时失效|r|cRXP_LOOT_克拉文·莫特韦克的日记|r 
    >>|cRXP_WARN_如果你未能击杀二楼的|cRXP_ENEMY_Defias Tower Sentries|r, 要做好逃跑的准备. 当你站在书架顶部时(这是一个躲避点), 它们很可能会永久性地对你产生仇恨(但不会攻击你)|r
    >>|cRXP_WARN_如果你的背包里或装备中有|r|T135641:0|t[匕首]|cRXP_WARN_, 你可以对位于塔内的|cRXP_ENEMY_迪菲亚巡塔员|r和|cRXP_ENEMY_迪菲亚哨兵|r施放|r|T132282:0|t[伏击]|cRXP_WARN_, 立即击杀他们. 击杀第一个|cRXP_ENEMY_迪菲亚哨兵|r后, 请立刻准备逃跑, 并记住你可能会受到来自上方的攻击. 这种方法虽然较慢, 但安全得多|r
    >>|cRXP_WARN_请注意, 如果你必须从塔楼中跑出来, |cRXP_ENEMY_丑陋的迪菲亚懒汉|r 和 |cRXP_ENEMY_迪菲亚苦工|r 可能会出现在塔楼入口处|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频攻略
    .mob Defias Tower Patroller
    .mob Defias Tower Sentry
    .isOnQuest 2359
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << !Dwarf Rogue
    #hardcore
    #optional
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >>制作 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .isQuestComplete 2359
step << !Dwarf Rogue
    #hardcore
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437:0|t[抗毒药剂] 来移除 |T136230:0|t[赞吉尔之触] 的负面效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .isQuestComplete 2359
step << Dwarf Rogue
    #hardcore
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石肤术] 以移除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .aura -9991
    .isQuestComplete 2359
step << Rogue
    #hardcore
    #optional
    #completewith KlavenEnd
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >>飞往暴风城
    .target Thor
    .isQuestComplete 2359
step << !Dwarf Rogue
    #hardcore
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >>前往|cRXP_FRIENDLY_珊娜·弗勒|r
    .aura -9991
    .isQuestComplete 2359
step << !Dwarf Rogue
    #hardcore
    #optional
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>|cRXP_WARN_如果你有|r|T626003:0|t|cFFF48CBAS圣骑士|r |cRXP_WARN_或|r|T625999:0|t|cFFFF7C0AD德鲁伊|r |cRXP_WARN_好友, 请他们帮你移除|r|T136230:0|t[赞吉尔之触]|r
    .skill firstaid,80 >>|cRXP_WARN_将你的|r|T135966:0|t[急救]|cRXP_WARN_提升至80级|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .isQuestComplete 2359
step << !Dwarf Rogue
    #hardcore
    #optional
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>|cRXP_WARN_如果你有|r|T626003:0|t|cFFF48CBAS圣骑士|r |cRXP_WARN_或|r|T625999:0|t|cFFFF7C0AD德鲁伊|r |cRXP_WARN_好友, 请他们帮你移除|r|T136230:0|t[赞吉尔之触]|r
    .train 7934 >>|cRXP_WARN_Train|r|T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .isQuestComplete 2359
step << !Dwarf Rogue
    #hardcore
    #optional
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >>制作 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .isQuestComplete 2359
step << !Dwarf Rogue
    #hardcore
    #optional
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437:0|t[抗毒药剂] 来移除 |T136230:0|t[赞吉尔之触] 的负面效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .isQuestComplete 2359
step << Rogue
    #hardcore
    #optional
    #requires AntiVenomEnd2 << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >>进入瑞兹尔·铜栓总部, 沿楼梯向上前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r
    .isQuestComplete 2359
step << Rogue
    #hardcore
    #optional
    #label KlavenEnd
    #requires AntiVenomEnd2 << Rogue
    .goto StormwindClassic,75.78,59.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    >>|cRXP_WARN_记得在切换到|r|T135641:0|t[匕首]|cRXP_WARN_earlier后, 重新装备你的主武器|r << Rogue
    .turnin 2359 >>交任务: |cRXP_FRIENDLY_克拉文之塔|r
    .target Master Mathias Shaw
    .isQuestComplete 2359
]])