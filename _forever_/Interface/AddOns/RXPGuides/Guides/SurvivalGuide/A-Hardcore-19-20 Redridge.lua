RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（联盟）
#hardcore
#classic
#tbc
<< Alliance
#name 19-20 Redridge
#title 赤脊山
#version 1
#group RestedXP Survival Guide (A)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
#next 20-21 Darkshore/Ashenvale
#displayname 19-20 赤脊山
step << Hunter
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_恩瑞斯·锐矛|r 交谈
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛
step << Hunter
    .goto StormwindClassic,61.576,15.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡瑞娜·麦肯达|r 交谈
    .trainer >> 学习宠物技能
    .target 卡瑞娜·麦肯达
step
    #completewith ExitSW
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利巴布·旋轮|r 交谈
    .vendor >> |cRXP_BUY_购买一根|r |T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量商品。如果 |cRXP_FRIENDLY_比利巴布·旋轮|r 没有货，就跳过此步骤|r
--    >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 比利巴布·旋轮
step
	.isOnQuest 1338
    .goto StormwindClassic,58.08,16.52
    .target 弗伦·长须
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗伦·长须|r 交谈
    .turnin 1338 >> 交任务：卡尔·雷矛的订单
    .isOnQuest 1338
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沉默的舒尼|r 和 |cRXP_FRIENDLY_维尔德·蓟草|r 交谈
    .accept 2040 >> 接任务：地底突袭
    .target +沉默的舒尼
    .goto StormwindClassic,55.510,12.504
    .accept 167 >> 接任务：我的兄弟......
    .accept 168 >> 接任务：收集记忆
    .goto StormwindClassic,65.438,21.175
    .target +维尔德·蓟草
step << Hunter
    #ssf
    #completewith ExitSW
    .goto StormwindClassic,49.990,57.641
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_购买一把|r |T135489:0|t[重型弯弓]
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .target 弗德瑞克·斯图瓦
    .money <0.6722
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
step << Hunter
    #ah
    #completewith ExitSW
    .goto StormwindClassic,49.990,57.641
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_购买一把|r |T135489:0|t[重型弯弓]|cRXP_BUY_或从拍卖行购买更好的装备|r
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .target 弗德瑞克·斯图瓦
    .money <0.6722
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
step << Hunter
    .goto StormwindClassic,49.990,57.641
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_购买|r |T132382:0|t[锋利的箭]
    .collect 2515,1800 --Sharp Arrow (1800)
    .target 弗德瑞克·斯图瓦
step << Hunter
    +|cRXP_WARN_装备|r |T135489:0|t[重型弯弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.19
    .xp <20,1
step << Mage
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >> 前往法师塔
step << Mage
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾尔莎林|r 交谈
    .trainer >> 学习职业技能
    .target 艾尔莎林
step << Paladin/Priest
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >> 前往暴风城大教堂
step << Paladin
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 交谈
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
step << Priest
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔舒修士|r 交谈
    .trainer >> 学习职业技能
    .target 乔舒修士
step << Warlock/Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    >>|cRXP_BUY_购买|r |T135139:0|t[燃烧魔杖]|cRXP_BUY_（若它是装备升级）|r
    >>|cRXP_WARN_购买一根不造成暗影伤害的魔杖很重要。之后你会遇到对暗影伤害有抗性的怪物|r
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    .collect 5210,1
    .target 阿德温·凯伦
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往已宰的羔羊旅店，走下楼梯
step << Warlock
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
step << Rogue
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 交谈
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_武神|r 或 |cRXP_FRIENDLY_伊尔萨|r 交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾
step << Druid
    .goto StormwindClassic,20.898,55.491
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沙德拉斯·月树|r 交谈
    .trainer >> 学习职业技能
    .target 沙德拉斯·月树
step << !Hunter !Priest
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吴平|r 交谈
    .train 201 >> 学习单手剑（1H） << Mage/Rogue/Warlock
    .train 1180 >> 学习匕首 << Mage/Druid
    .train 202 >> 学习双手剑（2H） << Warrior/Paladin
    .target 吴平
step << Rogue
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买一把|r |T135324:0|t[长剑]|cRXP_BUY_和|r |T135342:0|t[波刃短剑]
    >>|cRXP_WARN_达到21级后，将|r |T135324:0|t[长剑]|cRXP_WARN_装备在主手，并将|r |T135342:0|t[波刃短剑]|cRXP_WARN_装备在副手|r
    .collect 923,1 --Longsword
    .collect 2209,1 --Kris
    .target 玛尔达·维勒
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>购买以下物品，稍后在赤脊山可以更快交任务
    >>这样可以省去四处寻找怪物击杀的时间。如果不想购买，就跳过此步骤
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    >>|T134572:0|t[瑞斯班矿石]
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .collect 2798,5,347,1 -- Rethban Ore (5)
    .target 拍卖师亚克森
step << !NightElf
    #label ExitSW
    .goto StormwindClassic,66.27,62.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 交谈
    .fly Redridge >> 飞往赤脊山
    .target 杜加尔·朗德瑞克
step << NightElf
    #label ExitSW
    .goto StormwindClassic,73.2,92.1
    .zone Elwynn Forest >> 离开暴风城
    .zoneskip Redridge Mountains
step << NightElf
    #completewith GParker
    #label start
    .goto Redridge Mountains,15.27,71.45
    .zone Redridge Mountains >> 前往赤脊山
step << NightElf
    #label GParker
    .goto Redridge Mountains,15.27,71.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵帕克|r 交谈
    .accept 244 >> 接任务：豺狼人的入侵
    .target 卫兵帕克
step << NightElf
    .goto Redridge Mountains,30.73,59.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 交谈
    .turnin 244 >> 交任务：豺狼人的入侵
    .target 菲尔顿副队长
    .accept 246 >> 接任务：审时度势
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 交谈
    .goto Redridge Mountains,32.13,48.63
    .accept 125 >> 接任务：丢失的工具
    .target 工头奥斯洛
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 交谈
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .accept 118 >> 接任务：马掌
step
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_所罗门镇长|r 交谈
	.target 所罗门镇长
    .accept 120 >> 接任务：送往暴风城的信
step
    .goto Redridge Mountains,26.80,44.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达希|r 交谈
    >>|cRXP_FRIENDLY_达希|r |cRXP_WARN_在旅店内走动|r
	.target 达希
    .accept 129 >> 接任务：免费的午餐
step
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_黑衣威利|r 交谈
    .turnin 65 >> 交任务：迪菲亚兄弟会
    .accept 132 >> 接任务：迪菲亚兄弟会
	.target 黑衣威利
step
    #era/som
    .goto Redridge Mountains,22.67,43.83
    >>离开旅店
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r 交谈
	.target 厨师布雷纳
    .accept 92 >> 接任务：赤脊山炖肉
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肖恩|r 交谈
	.target 肖恩
    .goto Redridge Mountains,29.31,53.63
    .accept 3741 >> 接任务：希拉里的项链
step
    >>|cRXP_WARN_跳入湖中|r
    >>打开 |cRXP_PICK_闪光的泥浆|r，拾取 |cRXP_LOOT_希拉里的项链|r
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
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希拉里|r 交谈
    .goto Redridge Mountains,29.24,53.63
    .turnin 3741 >> 交任务：希拉里的项链
    .target 希拉里
step
    .goto Redridge Mountains,30.59,59.42
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
	.target 艾蕾娜·斯托姆法瑟
    .fly Westfall >> 飞往西部荒野
step
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 交谈
    .turnin 132 >> 交任务：迪菲亚兄弟会
    .accept 135 >> 接任务：迪菲亚兄弟会
    .target 格里安·斯托曼
step
    .goto Westfall,56.55,52.64
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 交谈
    .fly Stormwind >> 飞往暴风城
    .target 索尔
step
    .goto StormwindClassic,63.982,75.338
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马库斯·乔纳森将军|r 交谈
    .turnin 120 >> 交任务：送往暴风城的信
    .accept 121 >> 接任务：送往暴风城的信
    .target 马库斯·乔纳森将军
step
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,10 >> 进入军情7处总部，上楼前往 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 身边
step
    .goto StormwindClassic,75.78,59.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 交谈
    .turnin 135 >> 交任务：迪菲亚兄弟会
    .accept 141 >> 接任务：迪菲亚兄弟会
    .target 马迪亚斯·肖尔
step
    #completewith next
    .goto StormwindClassic,66.27,62.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 交谈
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克
step
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 交谈
    .turnin 141 >> 交任务：迪菲亚兄弟会
    .accept 142 >> 接任务：迪菲亚兄弟会
    .target 格里安·斯托曼
step
    #completewith next
    .goto Westfall,44.50,69.62,55 >> 前往月溪镇
step
    .goto Westfall,44.50,69.62
    .line Westfall,44.50,69.62,44.50,69.62,45.08,69.40,45.21,69.35,45.63,68.69,45.85,67.73,45.62,66.99,45.52,65.71,45.61,64.95,44.28,63.88,44.26,62.80,43.60,59.89,43.37,58.42,43.26,57.01,43.12,54.24,42.15,52.74,41.74,51.42,41.48,49.89,40.91,48.71,38.93,46.05,38.51,45.46,37.85,45.54,36.60,44.21,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.26,43.77,36.87,42.87,36.95,40.85,37.04,39.79,37.91,36.98,39.06,35.58,40.48,34.31,41.27,32.87,41.76,31.27,42.26,30.26,43.20,28.99,44.29,28.19,44.64,26.85,44.57,24.94,44.64,26.85,44.29,28.19,43.20,28.99,42.26,30.26,41.76,31.27,41.27,32.87,40.48,34.31,39.06,35.58,37.91,36.98,37.04,39.79,36.95,40.85,36.87,42.87,36.26,43.77,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.60,44.21,37.85,45.54,38.51,45.46,38.93,46.05,40.91,48.71,41.48,49.89,41.74,51.42,42.15,52.74,43.12,54.24,43.26,57.01,43.37,58.42,43.60,59.89,44.26,62.80,44.28,63.88,45.61,64.95,45.52,65.71,45.62,66.99,45.85,67.73,45.63,68.69,45.21,69.35,45.08,69.40,44.50,69.62
    >>击杀 |cRXP_ENEMY_迪菲亚信使|r，拾取 |cRXP_LOOT_神秘的信件|r
    >>|cRXP_WARN_|cRXP_ENEMY_迪菲亚信使|r 在月溪镇刷新。他会沿月溪镇北边的道路巡逻，经过金海岸矿洞和詹戈洛德矿洞。如果在道路上没有找到他，就在月溪镇等待刷新|r
    >>|cRXP_WARN_他的刷新时间为 4-5 分钟|r
    .complete 142,1 -- A Mysterious Message (1)
    .unitscan 迪菲亚信使
step
    #completewith next
    .goto Westfall,30.01,86.02,40 >> 前往西部荒野灯塔
step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r 交谈
    .accept 104 >> 接任务：海岸上的威胁
    .accept 103 >> 接任务：长明的灯塔
    .target 葛瑞森船长
step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r 交谈
    .turnin 103 >> 交任务：长明的灯塔
    .itemcount 814,5 -- Flask of Oil (5)
    .target 葛瑞森船长
step
    .goto Westfall,34.43,83.93
    .line Westfall,34.43,83.93,34.43,83.93,33.88,83.32,33.08,82.86,32.56,82.71,32.08,82.49,31.91,82.36,31.55,81.88,30.86,81.42,30.63,81.16,30.33,80.81,30.02,80.11,29.68,79.22,29.32,78.19,29.29,77.60,29.27,77.31,29.18,76.26,29.07,75.29,28.95,74.14,28.85,73.29,28.79,72.48,28.37,71.94,27.84,71.29,27.44,70.25,27.29,69.47,27.13,68.65,27.09,67.57,27.07,67.01,26.74,66.09,27.07,67.01,27.09,67.57,27.13,68.65,27.29,69.47,27.44,70.25,27.84,71.29,28.37,71.94,28.79,72.48,28.85,73.29,28.95,74.14,29.07,75.29,29.18,76.26,29.27,77.31,29.29,77.60,29.32,78.19,29.68,79.22,30.02,80.11,30.33,80.81,30.63,81.16,30.86,81.42,31.55,81.88,31.91,82.36,32.08,82.49,32.56,82.71,33.08,82.86,33.88,83.32,34.43,83.93
    >>击杀 |cRXP_ENEMY_老瞎眼|r，拾取 |cRXP_LOOT_老瞎眼的鳞片|r
    >>|cRXP_ENEMY_老瞎眼|r|cRXP_WARN_会沿着长滩巡逻。若你在长滩没看到他，就等他刷新在最南边的|cRXP_ENEMY_鱼人|r营地|r
    .complete 104,1 -- Scale of Old Murk-Eye (1)
    .unitscan 老瞎眼
step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r 交谈
    .turnin 104 >> 交任务：海岸上的威胁
    .target 葛瑞森船长
step
    .abandon 103 >> 放弃“长明的灯塔”
step
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 交谈
    .turnin 142 >> 交任务：迪菲亚兄弟会
    .target 格里安·斯托曼
step
    .goto Westfall,55.68,47.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪菲亚叛徒|r 交谈
    >>|cRXP_WARN_如果 |cRXP_FRIENDLY_迪菲亚叛徒|r 不在，可能需要等待他刷新|r
    .accept 155 >> 接任务：迪菲亚兄弟会
    .target 迪菲亚叛徒
step
    .goto Westfall,42.56,71.71
    >>护送|cRXP_FRIENDLY_迪菲亚叛徒|r到死亡矿井
    >>|cRXP_WARN_始终待在 |cRXP_FRIENDLY_迪菲亚叛徒|r 身边！抵达月溪镇时，准备好与 |cRXP_ENEMY_迪菲亚|r 战斗|r
    .complete 155,1 -- Escort The Defias Traitor to discover where VanCleef is hiding (1)
    .target 迪菲亚叛徒
step
    .goto Westfall,25.90,47.76
    >>|cRXP_WARN_使用 |T134269:0|t[|cRXP_LOOT_杉德尔船长的藏宝图|r] 接取任务|r
    .use 1357
    .accept 136 >> 接任务：杉德尔船长的宝藏
    .itemcount 1357,1 -- Captain Sanders' Treasure Map (1)
step
    .goto Westfall,25.90,47.76
    >>点击 |cRXP_PICK_船长的手提箱|r
    .turnin 136 >> 交任务：杉德尔船长的宝藏
    .isOnQuest 136
    -- Captain Sanders' Treasure Map (1)
step
    .goto Westfall,25.90,47.76
    >>点击 |cRXP_PICK_船长的手提箱|r
    .accept 138 >> 接任务：杉德尔船长的宝藏
    .isQuestTurnedIn 136
step
    .goto Westfall,40.51,47.80
    >>点击 |cRXP_PICK_破桶|r
    .turnin 138 >> 交任务：杉德尔船长的宝藏
    .accept 139 >> 接任务：杉德尔船长的宝藏
    .isQuestTurnedIn 136
step
    .goto Westfall,40.63,17.03
    >>点击 |cRXP_PICK_旧水罐|r
    .turnin 139 >> 交任务：杉德尔船长的宝藏
    .accept 140 >> 接任务：杉德尔船长的宝藏
    .isQuestTurnedIn 138
step
    #completewith next
    .goto Westfall,25.97,16.90,30 >> 游向岛屿
    .isOnQuest 140
step
    .goto Westfall,25.97,16.90
    >>点击 |cRXP_PICK_锁着的箱子|r
    .turnin 140 >> 交任务：杉德尔船长的宝藏
    .isOnQuest 140
step
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 交谈
    .turnin 155 >> 交任务：迪菲亚兄弟会
    .target 格里安·斯托曼
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 和塔顶的 |cRXP_FRIENDLY_哨兵瑞尔|r 交谈
    .accept 166 >> 接任务：迪菲亚兄弟会
    .target +格里安·斯托曼
    .goto Westfall,56.33,47.52
    .accept 214 >> 接任务：红色丝质面罩
    .goto Westfall,56.67,47.35
    .target +哨兵瑞尔
step
.dungeon DM
    .goto Westfall,60.4,72.2
    .goto Westfall,40.4,71.6
    .subzone 1581 >> 现在开始寻找死亡矿井队伍
    >>组建死亡矿井队伍时，可以击杀豺狼人练级
step
.dungeon DM
    .goto Westfall,42.55,71.69
    .subzone 1581 >> 前往死亡矿井
step
.dungeon DM
    #completewith EnterDM
    >>击杀 |cRXP_ENEMY_迪菲亚|r，拾取 |cRXP_LOOT_红色丝质面罩|r
    >>|cRXP_WARN_进入副本后也可以完成|r
    .complete 214,1 -- Red Silk Bandana (10)
step
.dungeon DM
    #completewith next
    >>击杀 |cRXP_ENEMY_骷髅矿工|r、|cRXP_ENEMY_亡灵爆破者|r 和 |cRXP_ENEMY_亡灵挖掘者|r，拾取 |cRXP_LOOT_矿业工会会员卡|r
    >>|cRXP_WARN_此任务需要在副本外完成|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob 骷髅矿工
    .mob 亡灵爆破者
    .mob 亡灵挖掘者
step
.dungeon DM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀 |cRXP_ENEMY_工头希斯耐特|r，拾取 |cRXP_LOOT_希斯耐特的徽章|r
    >>|cRXP_WARN_此任务需要在副本外完成|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan 工头希斯耐特
step
.dungeon DM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀 |cRXP_ENEMY_骷髅矿工|r、|cRXP_ENEMY_亡灵爆破者|r 和 |cRXP_ENEMY_亡灵挖掘者|r，拾取 |cRXP_LOOT_矿业工会会员卡|r
    >>|cRXP_WARN_此任务需要在副本外完成|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob 骷髅矿工
    .mob 亡灵爆破者
    .mob 亡灵挖掘者
step
.dungeon DM
    #label EnterDM
    .goto 1415,40.94,79.76,25,0
    .goto 1415,40.86,79.62,20,0
    .goto 1415,40.678,79.578
    .subzone 1581,2 >> 进入死亡矿井副本
step
.dungeon DM
    #completewith DMend
    >>在死亡矿井内击杀 |cRXP_ENEMY_迪菲亚|r，拾取 |cRXP_LOOT_红色丝质面罩|r
    .complete 214,1 -- Red Silk Bandana (10)
step
.dungeon DM
    >>击杀 |cRXP_ENEMY_斯尼德|r，拾取 |cRXP_LOOT_小型高能发动机|r
    .complete 2040,1 -- Gnoam Sprecklesprocket (1)
step
.dungeon DM
    >>击杀 |cRXP_ENEMY_艾德温·范克里夫|r，拾取 |cRXP_LOOT_范克里夫的头颅|r 和 |T133471:0|t[|cRXP_LOOT_一封未寄出的信|r]
    >>|cRXP_WARN_使用 |T133471:0|t[|cRXP_LOOT_一封未寄出的信|r] 接取任务|r
    .collect 2874,1,373 -- An Unsent Letter (1)
    .complete 166,1 -- Head of VanCleef (1)
    .accept 373 >> 接任务：未寄出的信
    .use 2874 -- An Unsent Letter
step
.dungeon DM
    #label DMend
    #completewith next
    .goto Westfall,56.33,47.52,100 >> 前往哨兵岭
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 和塔顶的 |cRXP_FRIENDLY_哨兵瑞尔|r 交谈
    .turnin 166 >> 交任务：迪菲亚兄弟会
    .target +格里安·斯托曼
    .goto Westfall,56.33,47.52
    .turnin 214 >> 交任务：红色丝质面罩
    .goto Westfall,56.67,47.35
    .target +哨兵瑞尔
step
.dungeon DM
    #completewith next
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 交谈
    .fly Stormwind >> 飞往暴风城
    .target 索尔
step
.dungeon DM
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿古斯·夜语|r 交谈
	.target 阿古斯·夜语
    .goto StormwindClassic,21.40,55.80
    .accept 3765 >> 接任务：遥远的旅途
step
.dungeon DM
    .goto StormwindClassic,45.694,38.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克里斯托弗修士|r 交谈
    >>如果尚未达到 20 级，就跳过此步骤
    .accept 343 >> 接任务：关于坚韧的演讲
    .target 克里斯托弗修士
    .xp <20,1
step
.dungeon DM
    .goto StormwindClassic,48.079,30.913,10,0
    .goto StormwindClassic,49.193,30.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r 交谈
    .turnin 373 >> 交任务：未寄出的信
    .accept 389 >> 接任务：巴基尔·斯瑞德
    .target 巴隆斯·阿历克斯顿
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔德·蓟草|r 和 |cRXP_FRIENDLY_沉默的舒尼|r 交谈
    .turnin 167 >> 交任务：我的兄弟......
    .turnin 168 >> 交任务：收集记忆
    .target +维尔德·蓟草
    .goto StormwindClassic,65.438,21.175
    .turnin 2040 >> 交任务：地底突袭
    .goto StormwindClassic,55.510,12.504
    .target +沉默的舒尼
step -- adding again 2nd time incase hitting 20 after turning in triple DM quests
.dungeon DM
    .goto StormwindClassic,45.694,38.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克里斯托弗修士|r 交谈
    >>如果尚未达到 20 级，就跳过此步骤
    .accept 343 >> 接任务：关于坚韧的演讲
    .target 克里斯托弗修士
    .xp <20,1
step
.dungeon DM
    #completewith next
    .goto StormwindClassic,70.439,27.097,15,0
    .goto StormwindClassic,72.003,21.525,15,0
    .goto StormwindClassic,70.713,10.717,15 >> 前往暴风城图书馆内的 |cRXP_FRIENDLY_米尔顿·西弗|r 身边
    .xp <20,1
step
.dungeon DM
    .goto StormwindClassic,74.182,7.465
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米尔顿·西弗|r 交谈
    >>如果尚未达到 20 级，就跳过此步骤
    .turnin 343 >> 交任务：关于坚韧的演讲
    .accept 344 >> 接任务：帕克斯顿修士
    .target 米尔顿·西弗
    .xp <20,1
step
.dungeon DM
    .goto StormwindClassic,42.435,59.236,10,0
    .goto StormwindClassic,41.102,58.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_典狱官塞尔沃特|r 交谈
    .turnin 389 >> 交任务：巴基尔·斯瑞德
--  .accept 391 >> Accept The Stockade Riots -- Accept later when going to do Stockades
    .target 典狱官塞尔沃特
step
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 交谈
    >>如果仍在西部荒野，就飞往赤脊山
    .fly Redridge >> 飞往赤脊山
    .target 索尔
    .zoneskip Westfall,1
step
.dungeon DM
    .isQuestTurnedIn 343
    #completewith next
    .goto Elwynn Forest,32.240,49.723,60 >> 离开暴风城，前往闪金镇
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 343
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_铁匠阿古斯|r 交谈
	.target 铁匠阿古斯
    .turnin 118 >> 交任务：马掌
    .accept 119 >> 接任务：回复弗纳
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 343
    #completewith next
    .goto Elwynn Forest,45.81,47.73,20,0
    .goto Elwynn Forest,48.61,41.80,15 >> 前往北郡修道院
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 343
    .goto Elwynn Forest,49.60,40.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_帕克斯顿修士|r 交谈
    .turnin 344 >> 交任务：帕克斯顿修士
    .accept 345 >> 接任务：墨水短缺
    .target 帕克斯顿修士
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 343
    #completewith next
    .goto Elwynn Forest,57.518,51.595,25,0
    .goto Elwynn Forest,58.14,52.50,20,0
    .goto Elwynn Forest,65.20,69.80,50 >> 前往阿祖拉之塔并登上塔顶。跟随箭头穿过山间近路
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 343
    .goto Elwynn Forest,65.22,69.71
    .target 塞欧克瑞图斯
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的 |cRXP_FRIENDLY_塞欧克瑞图斯|r 交谈
    .accept 94 >> 接任务：法师的眼线
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 343
    .goto Elwynn Forest,64.880,69.192
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_当恩·布赖特斯塔|r 交谈
    .vendor >> |cRXP_FRIENDLY_当恩·布赖特斯塔|r |cRXP_BUY_出售限量商品，例如|r |T134938:0|t|T134937:0|t|T134943:0|t[卷轴] |cRXP_BUY_和|r |T134850:0|t|T134830:0|t[药水]，|cRXP_BUY_有货就购买|r << !Warrior !Rogue
    .vendor >> |cRXP_FRIENDLY_当恩·布赖特斯塔|r |cRXP_BUY_出售限量商品，例如|r |T134938:0|t|T134937:0|t|T134943:0|t[卷轴] |cRXP_BUY_和|r |T134830:0|t[药水]，|cRXP_BUY_有货就购买|r << Warrior/Rogue
    .target 当恩·布赖特斯塔
    .subzoneskip 91,1
step
.dungeon DM
    .isQuestTurnedIn 343
    #completewith FlyR
	.goto Redridge Mountains,6.7,72.4
    .zone Redridge Mountains >> 前往赤脊山
    .zoneskip Elwynn Forest,1
step
    #label FlyR
    .goto StormwindClassic,66.27,62.12,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 交谈
    .fly Redridge >> 飞往赤脊山
    .target 杜加尔·朗德瑞克
    .zoneskip Stormwind City,1
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵帕克|r 交谈
	.target 卫兵帕克
    .goto Redridge Mountains,15.30,71.50
    .accept 244 >> 接任务：豺狼人的入侵
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵帕克|r 交谈
	.target 卫兵帕克
    .goto Redridge Mountains,15.27,71.45
    .turnin 129 >> 交任务：免费的午餐
    .accept 130 >> 接任务：寻访草药师
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 交谈
	.target 菲尔顿副队长
    .goto Redridge Mountains,30.70,60.00
    .turnin 244 >> 交任务：豺狼人的入侵
    .accept 246 >> 接任务：审时度势
step
    .isQuestTurnedIn 343
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 交谈
    .goto Redridge Mountains,32.13,48.63
    .turnin 345 >> 交任务：墨水短缺
    .target 工头奥斯洛
step
    .isQuestTurnedIn 118
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 交谈
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .turnin 119 >> 交任务：回复弗纳
    .accept 124 >> 接任务：豺狼人的乱吠
step
    #era
    .isQuestTurnedIn 119
    .goto Redridge Mountains,30.97,47.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 交谈
    .accept 122 >> 接任务：雏龙的鳞片
    .target 弗纳·奥斯古

step
    #era/som
    #completewith MongrelPoacher
    >>击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取 |cRXP_LOOT_巨型血牙野猪头|r
    >>击杀 |cRXP_ENEMY_狼蛛|r，拾取 |cRXP_LOOT_香脆蜘蛛肉|r
    >>击杀 |cRXP_ENEMY_恐鹫|r，拾取 |cRXP_LOOT_硬秃鹫肉|r
    >>|cRXP_WARN_交付“赤脊山炖肉”任务前，不要出售这些物品|r
    >>|cRXP_WARN_保留你拾取到的所有|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，之后可用它们将|r |T133971:0|t[烹饪]|cRXP_WARN_提升到50点，这是稍后暮色森林任务的需要|r
    .collect 2296,5,92,1
    .mob +巨型血牙野猪
    .collect 1080,5,92,1
    .mob +恐鹫
    .collect 1081,5,92,1
    .mob +狼蛛
step
    .isOnQuest 122
    #completewith Toolbox
    >>击杀 |cRXP_ENEMY_黑龙雏龙|r，拾取 |cRXP_LOOT_雏龙的腹鳞|r
    >>现在不必完成此任务
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob 黑龙雏龙
step
    #label MongrelPoacher
    .goto Redridge Mountains,15.91,62.76,0
    .goto Redridge Mountains,43.44,70.61,0
    .goto Redridge Mountains,29.49,82.80,45,0
    .goto Redridge Mountains,32.52,81.78,45,0
    .goto Redridge Mountains,43.18,72.22,45,0
    .goto Redridge Mountains,31.13,82.18
	>>击杀|cRXP_ENEMY_混血赤脊山豺狼人|r和|cRXP_ENEMY_赤脊山偷猎者|r
    .complete 246,1 --Redridge Mongrel (10)
    .mob +混血赤脊山豺狼人
    .complete 246,2 --Redridge Poacher (6)
	.mob +赤脊山偷猎者
step
    #era/som
    #completewith next
    >>击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取 |cRXP_LOOT_巨型血牙野猪头|r
    >>击杀 |cRXP_ENEMY_恐鹫|r，拾取 |cRXP_LOOT_硬秃鹫肉|r
    >>|cRXP_WARN_交付“赤脊山炖肉”任务前，不要出售这些物品|r
    >>|cRXP_WARN_保留你拾取到的所有|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，之后可用它们将|r |T133971:0|t[烹饪]|cRXP_WARN_提升到50点，这是稍后暮色森林任务的需要|r
    .collect 2296,5,92,1
    .mob +巨型血牙野猪
    .collect 1080,5,92,1
    .mob +恐鹫
step
    #era/som
    .goto Redridge Mountains,21.22,67.77,45,0
    .goto Redridge Mountains,17.70,73.39,45,0
    .goto Redridge Mountains,11.20,76.31,45,0
    .goto Redridge Mountains,13.37,81.48,45,0
    .goto Redridge Mountains,18.86,73.63
    >>击杀 |cRXP_ENEMY_狼蛛|r，拾取 |cRXP_LOOT_香脆蜘蛛肉|r
    .collect 1081,5,92,1
    .mob 狼蛛
step
    #era/som
    >>击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取 |cRXP_LOOT_巨型血牙野猪头|r
    >>击杀 |cRXP_ENEMY_恐鹫|r，拾取 |cRXP_LOOT_硬秃鹫肉|r
    >>|cRXP_WARN_交付“赤脊山炖肉”任务前，不要出售这些物品|r
    >>|cRXP_WARN_保留你拾取到的所有|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，之后可用它们将|r |T133971:0|t[烹饪]|cRXP_WARN_提升到50点，这是稍后暮色森林任务的需要|r
    .collect 1080,5,92,1
    .mob +恐鹫
    .goto Redridge Mountains,66.4,76.6,60,0
    .goto Redridge Mountains,35.6,69.6,60,0
    .goto Redridge Mountains,45.4,76.6
    .goto Redridge Mountains,35.6,69.6,0
    .collect 2296,5,92,1
    .goto Redridge Mountains,15.73,52.83,60,0
    .goto Redridge Mountains,32.25,70.20,60,0
    .goto Redridge Mountains,31.02,72.14,60,0
    .goto Redridge Mountains,15.73,52.83
    .mob +巨型血牙野猪
step
    #label Toolbox
    >>|cRXP_WARN_跳入湖中，注意水中巡逻的精英|cRXP_ENEMY_止水湖蛇颈龙|r|r
    >>打开 |cRXP_PICK_沉没的宝箱|r，拾取 |cRXP_LOOT_奥斯洛的工具箱|r
    .goto Redridge Mountains,41.52,54.68
    .complete 125,1 --Oslow's Toolbox (1)
step
    .goto Redridge Mountains,49.0,70.0
    .xp 20-3000 >> 刷怪至距离 20 级还差 3000 经验
step
    #completewith next
    .goto Redridge Mountains,30.73,59.99,150 >> 前往湖畔镇
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 交谈
	.target 工头奥斯洛
    .goto Redridge Mountains,32.13,48.63
    .turnin 125 >> 交任务：丢失的工具
    .accept 89 >> 接任务：止水湖上的桥
step
    #era
    .isQuestComplete 122
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 交谈
    >>如果尚未完成“雏龙的鳞片”，就跳过此步骤，稍后再完成
	.target 弗纳·奥斯古
    .goto Redridge Mountains,31.00,47.30
    .turnin 122 >> 交任务：雏龙的鳞片
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_所罗门镇长|r 交谈
	.target 所罗门镇长
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    .turnin 121 >> 交任务：送往暴风城的信
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛蒂·詹罗斯|r 交谈
	.target 玛蒂·詹罗斯
    .goto Redridge Mountains,21.86,46.33
    .turnin 130 >> 交任务：寻访草药师
    .accept 131 >> 接任务：水仙诉衷情
step
    #era/som
    .isQuestComplete 92
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r 交谈
	.target 厨师布雷纳
    .goto Redridge Mountains,22.67,43.83
    .turnin 92 >> 交任务：赤脊山炖肉
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达希|r 交谈
    >>|cRXP_FRIENDLY_达希|r |cRXP_WARN_在旅店内走动|r
	.target 达希
    .goto Redridge Mountains,26.80,44.30
    .turnin 131 >> 交任务：水仙诉衷情
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 交谈
	.target 菲尔顿副队长
    .goto Redridge Mountains,30.73,59.99
    .turnin 246 >> 交任务：审时度势
step
    .xp 20 >> 飞往暴风城前，确保已达到 20 级
step
    .goto Redridge Mountains,30.59,59.42
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
	.target 艾蕾娜·斯托姆法瑟
    .fly Stormwind >> 飞往暴风城
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往已宰的羔羊旅店，走下楼梯
step << Warlock
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
step << Warlock
    .goto StormwindClassic,25.665,77.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯巴克尔|r 交谈
    .vendor >> |cRXP_BUY_购买|r |T133738:0|t[魔典：折磨（等级 2）]
    .target 斯巴克尔
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 交谈
    .accept 1716 >> 接任务：噬魂者
    .target 黑暗缚灵者加科因
step << Mage
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >> 前往法师塔
step << Mage
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾尔莎林|r 交谈
    .trainer >> 学习职业技能
    .target 艾尔莎林
step << Mage
    .goto StormwindClassic,39.68,79.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉瑞麦尼|r 交谈
    .train 3561 >> 学习 |T135763:0|t[传送：暴风城]
	.xp <20,1
    .target 拉瑞麦尼·普尔度
step << Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沙德拉斯·月树|r 交谈
    .goto StormwindClassic,20.89,55.50
    .trainer >> 学习职业技能
    .train 768 >> 学习 |T132115:0|t[猎豹形态]
    .target 沙德拉斯·月树
step << Rogue
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买一把|r |T135324:0|t[长剑]|cRXP_BUY_，21级时装备上|r
    >>|cRXP_BUY_如果拍卖行有更便宜或更好的装备，就从拍卖行购买|r
    >>|cRXP_WARN_如果已有更好的装备，就跳过此步骤|r
    .collect 923,1 --Longsword (1)
    .target 玛尔达·维勒
step << !Dwarf Rogue
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>购买 |T134437:0|t[抗毒药剂]，后续 |T132290:0|t[毒药]任务会用上
    >>这样可以省去四处寻找怪物击杀的时间。如果不想购买，就跳过此步骤
    .collect 6452,1,2359,1 --Anti-Venom (1)
    .target 拍卖师亚克森
step << Rogue
    #hardcore
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买一把|r |T135324:0|t[长剑]|cRXP_BUY_，21级时装备上|r
    >>|cRXP_WARN_如果已有更好的装备，就跳过此步骤|r
    .collect 923,1 --Longsword (1)
    .target 玛尔达·维勒
step << Warrior/Paladin
    #ah
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_如果金币足够，请购买|r |T135280:0|t[微光重剑]|cRXP_BUY_并在21级时装备|r
    >>|cRXP_BUY_如果拍卖行有更便宜或更好的装备，就从拍卖行购买|r
    >>|cRXP_WARN_如果已有更好的装备，就跳过此步骤|r
    .collect 922,1 --Dacian Falx (1)
    .target 冈瑟尔·维勒
step << Warrior/Paladin
    #hardcore
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_如果金币足够，请购买|r |T135280:0|t[微光重剑]|cRXP_BUY_并在21级时装备|r
    >>|cRXP_WARN_如果已有更好的装备，就跳过此步骤|r
    .collect 922,1 --Dacian Falx (1)
    .target 冈瑟尔·维勒
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿古斯·夜语|r 交谈
	.target 阿古斯·夜语
    .goto StormwindClassic,21.40,55.80
    .accept 3765 >> 接任务：遥远的旅途
step
    .goto StormwindClassic,45.694,38.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克里斯托弗修士|r 交谈
    .accept 343 >> 接任务：关于坚韧的演讲
    .target 克里斯托弗修士
step << Paladin/Priest
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >> 前往暴风城大教堂
step << Paladin
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 交谈，他会给你 |T133739:0|t[|cRXP_LOOT_勇气之书|r]
    .use 6776 >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_勇气之书|r] 接取任务|r
    .collect 6776,1,1649 --Tome of Valor (1)
    .accept 1649 >>接任务：勇气之书
    .target 达索瑞恩·拉尔
step << Paladin
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1649 >>交任务：勇气之书
    .target 达索瑞恩·拉尔
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 交谈
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔舒修士|r 交谈
    .goto StormwindClassic,38.54,26.86
    .trainer >> 学习职业技能
    .target 乔舒修士
step
    #completewith next
    .goto StormwindClassic,70.439,27.097,15,0
    .goto StormwindClassic,72.003,21.525,15,0
    .goto StormwindClassic,70.713,10.717,15 >> 前往暴风城图书馆内的 |cRXP_FRIENDLY_米尔顿·西弗|r 身边
step
    .goto StormwindClassic,74.182,7.465
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米尔顿·西弗|r 交谈
    .turnin 343 >> 交任务：关于坚韧的演讲
    .accept 344 >> 接任务：帕克斯顿修士
    .target 米尔顿·西弗
step << Hunter
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_恩瑞斯·锐矛|r 交谈
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛
step << Rogue
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 交谈
    .trainer >> 学习职业技能
    .train 1804 >> 学习 |T136058:0|t[开锁] 技能
    .target 夜行者奥斯伯
step << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >> 进入军情7处总部，上楼前往 |cRXP_FRIENDLY_“剃刀”雷吉克|r 和 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 身边
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_“剃刀”雷吉克|r 和 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 交谈
    .accept 2281 >> 接任务：赤脊山的联络员
    .target +“剃刀”雷吉克
    .goto StormwindClassic,75.76,60.35
    .accept 2360 >> 接任务：马迪亚斯和迪菲亚潜行者
    .goto StormwindClassic,75.78,59.84
    .target +马迪亚斯·肖尔
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_武神|r 或 |cRXP_FRIENDLY_伊尔萨|r 交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾
step
    #completewith next
    .goto Elwynn Forest,32.240,49.723,60 >> 离开暴风城，前往闪金镇
step
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_铁匠阿古斯|r 交谈
	.target 铁匠阿古斯
    .turnin 118 >> 交任务：马掌
    .accept 119 >> 接任务：回复弗纳
step
    #completewith next
    .goto Elwynn Forest,45.81,47.73,20,0
    .goto Elwynn Forest,48.61,41.80,15 >> 前往北郡修道院
step
    .goto Elwynn Forest,49.60,40.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_帕克斯顿修士|r 交谈
    .turnin 344 >> 交任务：帕克斯顿修士
    .accept 345 >> 接任务：墨水短缺
    .target 帕克斯顿修士
step
    #completewith next
    .goto Elwynn Forest,57.518,51.595,25,0
    .goto Elwynn Forest,58.14,52.50,20,0
    .goto Elwynn Forest,65.20,69.80,50 >> 前往阿祖拉之塔并登上塔顶。跟随箭头穿过山间近路
step
    .goto Elwynn Forest,65.22,69.71
    .target 塞欧克瑞图斯
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的 |cRXP_FRIENDLY_塞欧克瑞图斯|r 交谈
    .accept 94 >> 接任务：法师的眼线
step
    .goto Elwynn Forest,64.880,69.192
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_当恩·布赖特斯塔|r 交谈
    .vendor >> |cRXP_FRIENDLY_当恩·布赖特斯塔|r |cRXP_BUY_出售限量商品，例如|r |T134938:0|t|T134937:0|t|T134943:0|t[卷轴] |cRXP_BUY_和|r |T134850:0|t|T134830:0|t[药水]，|cRXP_BUY_有货就购买|r << !Warrior !Rogue
    .vendor >> |cRXP_FRIENDLY_当恩·布赖特斯塔|r |cRXP_BUY_出售限量商品，例如|r |T134938:0|t|T134937:0|t|T134943:0|t[卷轴] |cRXP_BUY_和|r |T134830:0|t[药水]，|cRXP_BUY_有货就购买|r << Warrior/Rogue
    .target 当恩·布赖特斯塔
    .subzoneskip 91,1
step
    #completewith TravelRM
	.goto Redridge Mountains,6.7,72.4
    .zone Redridge Mountains >> 前往赤脊山
    .zoneskip Elwynn Forest,1
step
    .goto StormwindClassic,66.27,62.12,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 交谈
    >>如果在暴风城，就飞往赤脊山
    .fly Redridge >> 飞往赤脊山
    .target 杜加尔·朗德瑞克
    .zoneskip Stormwind City,1
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 交谈
	.target 工头奥斯洛
    .goto Redridge Mountains,32.13,48.63
    .turnin 345 >> 交任务：墨水短缺
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 交谈
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .turnin 119 >> 交任务：回复弗纳
    .accept 124 >> 接任务：豺狼人的乱吠
step
    #era
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 交谈
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .accept 122 >> 接任务：雏龙的鳞片
step << Rogue
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2281 >> 交任务：赤脊山的联络员
    .target 卢修斯
    .accept 2282 >> 接任务：奥瑟尔伐木场
step
    #era
	#completewith next
	>>击杀 |cRXP_ENEMY_黑龙雏龙|r，拾取 |cRXP_LOOT_雏龙的腹鳞|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob 黑龙雏龙
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
    >>击杀 |cRXP_ENEMY_赤脊山蛮兵|r 和 |cRXP_ENEMY_赤脊山秘法师|r，拾取 |cRXP_LOOT_铁矛|r 和 |cRXP_LOOT_铁铆钉|r
    .complete 124,1 --Redridge Brute (10)
	.mob +赤脊山蛮兵
    .complete 124,2 --Redridge Mystic (8)
    .mob +赤脊山秘法师
    .complete 89,1 --Iron Pike (5)
    .mob +赤脊山秘法师
	.mob +赤脊山蛮兵
    .complete 89,2 --Iron Rivet (5)
	.mob +赤脊山秘法师
	.mob +赤脊山蛮兵
step << Rogue
    .goto Redridge Mountains,52.10,45.24
    +打开 |cRXP_PICK_练习用保险箱|r，将 |T136058:0|t[开锁] 提升至 80
    .skill lockpicking,80,1
step << Rogue
	.goto Redridge Mountains,52.05,44.69
    >>打开 |cRXP_PICK_卢修斯的箱子|r，拾取 |cRXP_LOOT_偷窃技能证明物|r
    .complete 2282,1 --Token of Thievery
    .skill lockpicking,<80,1
step
    #era
    .goto Redridge Mountains,43.47,31.68,50,0
    .goto Redridge Mountains,46.52,35.66,50,0
    .goto Redridge Mountains,34.56,65.79,50,0
    .goto Redridge Mountains,36.58,73.93
	>>击杀 |cRXP_ENEMY_黑龙雏龙|r，拾取 |cRXP_LOOT_雏龙的腹鳞|r
	.mob 黑龙雏龙
    .complete 122,1 --Underbelly Whelp Scale (6)
step
    #era
    #completewith next
    .goto Redridge Mountains,15.55,50.06,0
    .goto Redridge Mountains,19.24,41.53,0
    .goto Redridge Mountains,16.90,55.02,0
    .goto Redridge Mountains,26.52,44.95
    +|cRXP_WARN_使用|r |T133971:0|t[烹饪]|cRXP_WARN_技能烹制之前收集的|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，将技能提升到50点，满足任务对|r |T133971:0|t[烹饪]技能的要求
    +|cRXP_WARN_如果还需要更多|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，就去西边的|r|cRXP_ENEMY_贝利格拉布|r|cRXP_WARN_附近再击杀一些|r|cRXP_ENEMY_巨型血牙野猪|r
    .skill cooking,50,1
    .mob 巨型血牙野猪
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 交谈
	.target 工头奥斯洛
    .goto Redridge Mountains,32.10,48.70
    .turnin 89 >> 交任务：止水湖上的桥
step
    #era
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 交谈
	.target 弗纳·奥斯古
    .goto Redridge Mountains,31.00,47.30
    .turnin 124 >> 交任务：豺狼人的乱吠
    .turnin 122 >> 交任务：雏龙的鳞片
step
    #som
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 交谈
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .turnin 124 >> 交任务：豺狼人的乱吠
step << Rogue
    .goto Redridge Mountains,28.07,52.02
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2282 >> 交任务：奥瑟尔伐木场
    .target 卢修斯
step << Rogue
    #sticky
    #optional
    .destroy 7907 >> 删除背包中的 |T134328:0|t[偷窃技能认证书]，之后不再需要
step << NightElf Rogue
    #hardcore
    #optional
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
    .fly Stormwind >> 飞往暴风城
    .target 艾蕾娜·斯托姆法瑟
    .isOnQuest 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << NightElf Rogue
    #hardcore
    #optional
    .goto Westfall,56.55,52.64,5,0
    .zone Westfall >> 前往西部荒野
    .isOnQuest 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << NightElf Rogue
    #hardcore
    #optional
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 交谈
    .fp Westfall >> 开通西部荒野飞行点
    .target 索尔
    .isOnQuest 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << !NightElf Rogue
    #hardcore
    #optional
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
    .fly Westfall >> 飞往西部荒野
    .target 艾蕾娜·斯托姆法瑟
    .isOnQuest 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << !Dwarf Rogue
    #hardcore
    #optional
    .goto Duskwood,15.90,72.10,60,0
    .goto Duskwood,14.86,64.56,50,0
    .goto Duskwood,10.43,53.97
    >>击杀|cRXP_ENEMY_小型结网毒蜘蛛|r和|cRXP_ENEMY_结网毒蜘蛛|r，拾取|cRXP_LOOT_小毒囊|r和|cRXP_LOOT_粘糊的蜘蛛腿|r
    >>|cRXP_WARN_需要一个|cRXP_LOOT_小毒囊|r来制作|r |T134437:0|t[抗毒药剂]|cRXP_WARN_，之后用它移除|r |T136230:0|t[赞吉尔之触]|cRXP_WARN_的减益效果|r
    >>|cRXP_WARN_把|cRXP_LOOT_粘糊的蜘蛛腿|r留着后面用|r
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r|cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r|cRXP_WARN_朋友，可以跳过此步骤，之后请他们帮你移除|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob 小型结网毒蜘蛛
    .mob 结网毒蜘蛛
    .itemcount 6452,<1 --Anti Venom (<1)
    .isOnQuest 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << Rogue
    #hardcore
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==务必仔细阅读接下来的步骤==|r
    >>|cRXP_WARN_按 Escape，然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用交互键”，并为“与目标互动”设置按键|r
    >>|cRXP_WARN_建议开启敌方姓名板（默认键：V），这样可以看到塔内部分转角后方的敌人|r
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << Rogue
    #hardcore
    #optional
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_密探吉尔妮|r 交谈
    >>|cRXP_WARN_必须完成此任务才能学习|r |T132290:0|t[毒药]
    .turnin 2360 >> 交任务：马迪亚斯和迪菲亚潜行者
    .accept 2359 >> 接任务：克拉文之塔
    .target 密探吉尔妮
    .isOnQuest 2360
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << Rogue
    #hardcore
    #optional
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_密探吉尔妮|r 交谈
    >>|cRXP_WARN_必须完成此任务才能学习|r |T132290:0|t[毒药]
    .accept 2359 >> 接任务：克拉文之塔
    .target 密探吉尔妮
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
    >>使用 |T133644:0|t[偷窃] 偷取 |cRXP_ENEMY_丑陋的迪菲亚懒汉|r 身上的 |cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[偷窃]
    >>|cRXP_WARN_|cRXP_ENEMY_丑陋的迪菲亚懒汉|r 在塔楼入口刷新，然后在塔外巡逻|r
    >>|cRXP_WARN_小心，他的伤害很高。如果|r |T132320:0|t[潜行] |cRXP_WARN_被打破，立刻使用|r |T132307:0|t[疾跑] |cRXP_WARN_逃离|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处观看视频指南
    .mob 丑陋的迪菲亚懒汉
    .isOnQuest 2359
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << Rogue
    #hardcore
    #optional
    #completewith Mortwake
    +|cRXP_WARN_请在此任务中装备|r |T135641:0|t[曲木匕首]|cRXP_WARN_，如果当前没有装备|r |T135641:0|t[匕首]|cRXP_WARN_的话|r
    .use 15396
    .itemcount 15396,1
    .isOnQuest 2359
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << Rogue
    #hardcore
    #optional
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔楼倒数第 2 层。保持|r |T132320:0|t[潜行]，|cRXP_WARN_确认 |cRXP_ENEMY_迪菲亚哨兵|r 不在身边后，先跳上椅子，再跳上灯，最后跳上导航点位置上方的书架|r
    >>|cRXP_WARN_手动|r |T132320:0|t[取消潜行]|cRXP_WARN_，然后按“与目标互动”按键打开 |cRXP_PICK_暮色森林的箱子|r，拾取|r |cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_注意：你的|r |T132320:0|t[潜行] |cRXP_WARN_会在拾取|r |cRXP_LOOT_克拉文·摩特维克的日记|r 后暂时失效
    >>|cRXP_WARN_如果没有击杀第 2 层的 |cRXP_ENEMY_迪菲亚哨兵|r，就准备好逃跑。书架是脱战卡位点，你在上面时，它们很可能一直保持仇恨但无法攻击你|r
    >>|cRXP_WARN_如果背包中有或已装备|r |T135641:0|t[匕首]，|cRXP_WARN_可以使用|r |T132282:0|t[伏击] |cRXP_WARN_秒杀塔内的 |cRXP_ENEMY_迪菲亚巡塔员|r 和 |cRXP_ENEMY_迪菲亚哨兵|r。击杀第一个 |cRXP_ENEMY_迪菲亚哨兵|r 后准备好逃跑，并记住上层敌人也能攻击你。这种方式较慢，但安全得多|r
    >>|cRXP_WARN_如果需要跑出塔楼，注意入口可能有 |cRXP_ENEMY_丑陋的迪菲亚懒汉|r 和 |cRXP_ENEMY_迪菲亚苦工|r|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处观看视频指南
    .mob 迪菲亚巡塔员
    .mob 迪菲亚哨兵
    .isOnQuest 2359
    .train 1856,3 -- skips step if not 22/doesnt have Vanish
step << !Dwarf Rogue
    #hardcore
    #optional
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .isQuestComplete 2359
step << !Dwarf Rogue
    #hardcore
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437:0|t[抗毒药剂]移除 |T136230:0|t[赞吉尔之触]的减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .isQuestComplete 2359
step << Dwarf Rogue
    #hardcore
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石像形态]移除 |T136230:0|t[赞吉尔之触]的减益效果|r
    .aura -9991
    .isQuestComplete 2359
step << Rogue
    #hardcore
    #optional
    #completewith KlavenEnd
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 交谈
    .fly Stormwind >> 飞往暴风城
    .target 索尔
    .isQuestComplete 2359
step << !Dwarf Rogue
    #hardcore
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >> 前往 |cRXP_FRIENDLY_珊娜·弗勒|r 身边
    .aura -9991
    .isQuestComplete 2359
step << !Dwarf Rogue
    #hardcore
    #optional
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊娜·弗勒|r 交谈
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可以请他们帮你移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_的减益效果|r
    .skill firstaid,80 >> |cRXP_WARN_将|r |T135966:0|t[急救] |cRXP_WARN_提升至 80|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .isQuestComplete 2359
step << !Dwarf Rogue
    #hardcore
    #optional
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊娜·弗勒|r 交谈
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可以请他们帮你移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_的减益效果|r
    .train 7934 >> |cRXP_WARN_学习|r |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .isQuestComplete 2359
step << !Dwarf Rogue
    #hardcore
    #optional
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
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
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437:0|t[抗毒药剂]移除 |T136230:0|t[赞吉尔之触]的减益效果|r
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
    .goto StormwindClassic,78.67,60.13,5 >> 进入军情7处总部，上楼前往 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 身边
    .isQuestComplete 2359
step << Rogue
    #hardcore
    #optional
    #label KlavenEnd
    #requires AntiVenomEnd2 << Rogue
    .goto StormwindClassic,75.78,59.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 交谈
    >>|cRXP_WARN_如果之前换用了|r |T135641:0|t[匕首]，|cRXP_WARN_记得换回主武器|r << Rogue
    .turnin 2359 >> 交任务：克拉文之塔
    .target 马迪亚斯·肖尔
    .isQuestComplete 2359
]])
