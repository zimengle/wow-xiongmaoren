RXPGuides.RegisterGuide([[
#version 1
#group +休息经验 诺森德每日任务
#subgroup 派系每日任务
#wotlk
#cata
#name 冰冠炮艇解锁每日任务

step
	+注意：冰冠冰川中的许多每日任务都需要 5 名玩家组队完成。您必须完成这些任务才能解锁后续的每日任务。按照指南的指示完成所有组队任务
	>>如果你无法完成它们，请稍后再返回
step
    .goto IcecrownGlacier,87.8,78.1
    .fp The Argent Vanguard >>获取银色先锋飞行路线
step
    .goto IcecrownGlacier,87.5,75.8
	>>飞往 银色先锋。与提里奥交谈
    .accept 13036 >>接任务: |cRXP_LOOT_无上的荣耀|r
step
    .goto IcecrownGlacier,87.1,75.8
	>>与你下方的 Entari 交谈
    .turnin 13036 >>交任务: |cRXP_FRIENDLY_无上的荣耀|r
    .accept 13008 >>接任务: |cRXP_LOOT_天灾的战术|r
step
    .goto IcecrownGlacier,86.8,76.6
	>>与古斯塔夫交谈
    .accept 13040 >>接任务: |cRXP_LOOT_致命的剧毒|r
step
    .goto IcecrownGlacier,86.1,75.8
	>>与达尔弗斯交谈
    .accept 13039 >>接任务: |cRXP_LOOT_保卫前线基地|r
step
	#sticky
	#label webbedfreed
    .goto IcecrownGlacier,83.5,75.1,0,0
	>>杀死该区域的蛛网十字军茧以释放它们。它们还会为你提供增益和治疗 << !Paladin
	>>杀死该区域的蛛网十字军茧以释放它们。确保你给自己加点除了国王以外的其他东西，因为 NPC 会用它给你加点（并治愈你） << Paladin
    .complete 13008,1 --Webbed Crusader Freed (8)
step
    .goto IcecrownGlacier,84.7,78.8,80,0
    .goto IcecrownGlacier,83.5,75.1,80,0
    .goto IcecrownGlacier,83.1,72.6,80,0
    .goto IcecrownGlacier,84.8,73.0,80,0
    .goto IcecrownGlacier,83.5,75.1
	>>杀死该区域的尼鲁布人和蜘蛛。掠夺它们的毒囊
    .complete 13039,1 --Forgotten Depths Nerubians (15)
    .complete 13040,1 --Forgotten Depths Venom Sac (10)
step
	#requires webbedfreed
    .goto IcecrownGlacier,86.1,75.8
	>>返回达尔福斯
    .turnin 13039 >>交任务: |cRXP_FRIENDLY_保卫前线基地|r
step
    .goto IcecrownGlacier,86.8,76.6
	>>返回古斯塔夫身边
    .turnin 13040 >>交任务: |cRXP_FRIENDLY_致命的剧毒|r
step
    .goto IcecrownGlacier,87.1,75.8
	>>返回恩塔里
    .turnin 13008 >>交任务: |cRXP_FRIENDLY_天灾的战术|r
    .accept 13044 >>接任务: |cRXP_LOOT_如果还有幸存者……|r
step
    .goto IcecrownGlacier,87.0,79.0
	>>与佩努姆布里乌斯交谈
    .turnin 13044 >>交任务: |cRXP_FRIENDLY_如果还有幸存者……|r
    .accept 13045 >>接任务: |cRXP_LOOT_空中救兵|r
step
	#completewith next
    .goto IcecrownGlacier,87.1,79.2
	.vehicle 30228 >>右键点击银色天爪龙来骑乘它
step
	>>飞到 Scourgeholme。使用“抓住被俘的十字军”(1) 救出十字军（每次只能抓一个），然后飞回银色先锋的古斯塔夫那里，使用“放下被俘的十字军”(2) 放下他们。使用冷却中的“飞翔”(3) 可以加快速度。
	.pin Icecrown,78.7,67.0
    .waypoint IcecrownGlacier,78.7,67.0,0,rescue,VEHICLE_PASSENGERS_CHANGED,VEHICLE_UPDATE
	.goto Icecrown,86.68,76.83
    .complete 13045,1 --Captured Crusader Rescued (3)
step
    .goto IcecrownGlacier,87.5,75.8
	>>飞回提里奥
    .turnin 13045 >>交任务: |cRXP_FRIENDLY_空中救兵|r
    .accept 13070 >>接任务: |cRXP_LOOT_冷锋逼近|r
step
    .goto IcecrownGlacier,85.6,76.0
	>>与小房子里的 Fezzik 交谈
    .turnin 13070 >>交任务: |cRXP_FRIENDLY_冷锋逼近|r
    .accept 13086 >>接任务: |cRXP_LOOT_最后一道防线|r
step
	#completewith next
    .goto IcecrownGlacier,85.3,75.8
	.vehicle >>飞到城墙顶部的其中一个炮塔内
step
    .goto IcecrownGlacier,84.8,75.8
	--vehicle id 30236
	>>大量使用“银色大炮”(1) 来杀死小范围内的怪物并产生法力。使用“清算炸弹”(2) 来杀死大范围内的怪物，但会消耗法力。
    .complete 13086,1 --Scourge Attackers (100)
    .complete 13086,2 --Frostbrood Destroyer (3)
step
    .goto IcecrownGlacier,85.6,76.0
	>>离开大炮。返回菲兹克那里
    .turnin 13086 >>交任务: |cRXP_FRIENDLY_最后一道防线|r
step
    .goto IcecrownGlacier,86.0,75.8
	>>和你身后的提里奥交谈
    .accept 13104 >>接任务: |cRXP_LOOT_再次前往突破口吧，英雄|r << !DK
    .accept 13105 >>接任务: |cRXP_LOOT_再次前往突破口吧，英雄|r << DK
step
	>>向西北走。与屋内的黑檀守望者、西拉斯、斯皮茨帕特里克和古斯塔夫交谈
    .turnin 13104 >>交任务: |cRXP_FRIENDLY_再次前往突破口吧，英雄|r << !DK
    .turnin 13105 >>交任务: |cRXP_FRIENDLY_再次前往突破口吧，英雄|r << DK
    .accept 13118 >>接任务: |cRXP_LOOT_净化天灾城|r
    .accept 13122 >>接任务: |cRXP_LOOT_天灾石|r
    .goto IcecrownGlacier,83.0,73.0
    .accept 13130 >>接任务: |cRXP_LOOT_公正堡的基石|r
    .accept 13135 >>接任务: |cRXP_LOOT_危险的能量|r
    .goto IcecrownGlacier,83.0,73.1
    .accept 13110 >>接任务: |cRXP_LOOT_永不安息的亡者|r
    .goto IcecrownGlacier,82.9,72.8
step
	#completewith Crusaders
	>>杀死天灾堡的天灾军团。掠夺他们的天灾石
    .complete 13122,1 --Scourgestone (15)
step
	#completewith Kings
	.use 43153 >>杀死天灾岛的复活十字军。用你包里的圣水清洗他们的尸体，释放他们的灵魂
    .goto IcecrownGlacier,78.6,69.7,0
    .goto IcecrownGlacier,77.9,66.2,0
    .goto IcecrownGlacier,78.5,64.6,0
    .goto IcecrownGlacier,80.2,65.7,0
    .complete 13110,1 --Restless Soul Freed (10)
    .complete 13118,3 --Reanimated Crusader (8)
step
	#completewith next
    .goto IcecrownGlacier,79.5,68.6,0
    .goto IcecrownGlacier,80.8,64.5,0
    .goto IcecrownGlacier,77.7,63.2,0
    .goto IcecrownGlacier,78.4,65.7,0
	>>消灭天灾岛被遗忘的地下之王
    .complete 13118,2 --Forgotten Depths Underking (3)
step
    .goto IcecrownGlacier,79.2,64.0,20,0
    .goto IcecrownGlacier,79.6,64.1,15,0
    .goto IcecrownGlacier,77.8,65.1,50,0
    .goto IcecrownGlacier,77.3,68.2,20,0
    .goto IcecrownGlacier,77.6,68.7,15,0
    .goto IcecrownGlacier,79.2,64.0,20,0
    .goto IcecrownGlacier,79.6,64.1,15,0
    .goto IcecrownGlacier,77.8,65.1,50,0
    .goto IcecrownGlacier,77.3,68.2,20,0
    .goto IcecrownGlacier,77.6,68.7
	>>杀死主要位于该地区金字形神塔内的被遗忘的大祭司
    .complete 13118,1 --Forgotten Depths High Priest (3)
step
	#label Kings
    .goto IcecrownGlacier,79.5,68.6,80,0
    .goto IcecrownGlacier,80.8,64.5,80,0
    .goto IcecrownGlacier,77.7,63.2,80,0
    .goto IcecrownGlacier,78.4,65.7
	>>杀死该区域内被遗忘的地下之王
    .complete 13118,2 --Forgotten Depths Underking (3)
step
	#label Crusaders
    .goto IcecrownGlacier,78.6,69.7,80,0
    .goto IcecrownGlacier,77.9,66.2,80,0
    .goto IcecrownGlacier,78.5,64.6,80,0
    .goto IcecrownGlacier,80.2,65.7,80,0
    .goto IcecrownGlacier,78.6,69.7,80,0
    .goto IcecrownGlacier,77.9,66.2,80,0
    .goto IcecrownGlacier,78.5,64.6,80,0
    .goto IcecrownGlacier,80.2,65.7
	.use 43153 >>杀死天灾岛的复活十字军。用你包里的圣水清洗他们的尸体，释放他们的灵魂
    .complete 13110,1 --Restless Soul Freed (10)
    .complete 13118,3 --Reanimated Crusader (8)
step
    .goto IcecrownGlacier,78.6,69.7,80,0
    .goto IcecrownGlacier,77.9,66.2,80,0
    .goto IcecrownGlacier,78.5,64.6,80,0
    .goto IcecrownGlacier,80.2,65.7,80,0
    .goto IcecrownGlacier,78.6,69.7,80,0
    .goto IcecrownGlacier,77.9,66.2,80,0
    .goto IcecrownGlacier,78.5,64.6,80,0
    .goto IcecrownGlacier,80.2,65.7
	>>杀死天灾堡的天灾军团。掠夺他们的天灾石
    .complete 13122,1 --Scourgestone (15)
step
	#completewith next
    .goto CrystalsongForest,61.1,52.4,0
    .goto CrystalsongForest,58.9,62.8,0
    .goto CrystalsongForest,81.1,72.4,0
    .goto CrystalsongForest,89.2,55.7,0
    .goto CrystalsongForest,61.1,52.4,0
	>>杀死该区域的人形生物/亡灵生物/元素生物。掠夺它们的能量
    .complete 13135,1 --Crystallized Energy (8)
step
	>>掠夺该区域地面上的紫色树桩
    .complete 13130,1 --Crystalline Heartwood (10)
    .goto CrystalsongForest,65.0,53.5,80,0
    .goto CrystalsongForest,70.6,56.1,80,0
    .goto CrystalsongForest,71.4,67.6,80,0
    .goto CrystalsongForest,63.9,69.0,80,0
    .goto CrystalsongForest,65.0,53.5,80,0
    .goto CrystalsongForest,70.6,56.1,80,0
    .goto CrystalsongForest,71.4,67.6,80,0
    .goto CrystalsongForest,63.9,69.0
    .complete 13130,2 --Ancient Elven Masonry (10)
    .goto CrystalsongForest,73.7,65.4,80,0
    .goto CrystalsongForest,82.6,64.5,80,0
    .goto CrystalsongForest,86.5,59.1,80,0
    .goto CrystalsongForest,73.4,56.9,80,0
    .goto CrystalsongForest,73.7,65.4,80,0
    .goto CrystalsongForest,82.6,64.5,80,0
    .goto CrystalsongForest,86.5,59.1,80,0
    .goto CrystalsongForest,73.4,56.9
	>>掠夺被毁坏的精灵建筑周围的蓝色小大理石块
step
    .goto CrystalsongForest,61.1,52.4,80,0
    .goto CrystalsongForest,58.9,62.8,80,0
    .goto CrystalsongForest,81.1,72.4,80,0
    .goto CrystalsongForest,89.2,55.7,80,0
    .goto CrystalsongForest,61.1,52.4
	>>杀死该区域的人形生物/亡灵生物/元素生物。掠夺它们的能量
    .complete 13135,1 --Crystallized Energy (8)
step
	>>返回黑锋守望者
    .turnin 13130 >>交任务: |cRXP_FRIENDLY_公正堡的基石|r
    .turnin 13135 >>交任务: |cRXP_FRIENDLY_危险的能量|r
    .goto IcecrownGlacier,83.0,73.1
    .turnin 13118 >>交任务: |cRXP_FRIENDLY_净化天灾城|r
    .turnin 13122 >>交任务: |cRXP_FRIENDLY_天灾石|r
    .accept 13125 >>接任务: |cRXP_LOOT_凝固的空气|r
    .goto IcecrownGlacier,83.1,73.0
step
    .goto IcecrownGlacier,82.9,72.8
	>>进入小屋
    .turnin 13110 >>交任务: |cRXP_FRIENDLY_永不安息的亡者|r
step
    .goto IcecrownGlacier,77.3,61.9
	.use 43206 >>进入建筑。使用阿彻鲁斯的战争号角召唤一名NPC来协助你杀死萨拉纳克斯
    .complete 13125,1 --Salranax the Flesh Render (1)
step
    .goto IcecrownGlacier,80.1,61.2
	.use 43206 >>进入建筑。使用阿彻鲁斯战争号角召唤一名 NPC 协助你杀死 Yath'amon
    .complete 13125,3 --High Priest Yath'amon (1)
step
    .goto IcecrownGlacier,76.5,53.2
	.use 43206 >>使用阿彻鲁斯战争号角召唤一名 NPC 来协助你杀死塔洛诺克斯
    .complete 13125,2 --Underking Talonox (1)
step
    .goto IcecrownGlacier,83.0,72.9
	>>返回黑锋守望者
    .turnin 13125 >>交任务: |cRXP_FRIENDLY_凝固的空气|r
step
    .goto IcecrownGlacier,82.9,72.8
	>>进入小屋
    .accept 13139 >>接任务: |cRXP_LOOT_进入诺森德的冰冷腹地|r
step
    .goto IcecrownGlacier,86.0,75.8
	>>返回提里奥
    .turnin 13139 >>交任务: |cRXP_FRIENDLY_进入诺森德的冰冷腹地|r
    .accept 13141 >>接任务: |cRXP_LOOT_北伐军之峰的战斗|r
step
    .goto IcecrownGlacier,80.04,71.94
	.use 43243 >>使用背包中的十字军祝福旗帜，在骷髅堆旁保护它，抵御来袭的海浪。当死亡使者哈洛夫出现时，集中精力杀死他
    .complete 13141,1 --Battle for Crusaders' Pinnacle (1)
step
    .goto IcecrownGlacier,82.9,72.8
	>>进入小屋
    .turnin 13141 >>交任务: |cRXP_FRIENDLY_北伐军之峰的战斗|r
    .accept 13157 >>接任务: |cRXP_LOOT_北伐军之峰|r
step
    .goto IcecrownGlacier,79.8,71.8
	>>回到你保卫旗帜的地方。和提里奥交谈
    .turnin 13157 >>交任务: |cRXP_FRIENDLY_北伐军之峰|r
    .accept 13068 >>接任务: |cRXP_LOOT_勇气的传说|r
step
    .goto IcecrownGlacier,79.4,72.3
    .fp Crusaders' Pinnacle >>获得十字军巅峰飞行路线
step << Horde
    .goto IcecrownGlacier,79.5,72.7
	>>进入塔楼。与底层床上的 Strongbrow 交谈
    .accept 13224 >>接任务: |cRXP_LOOT_奥格瑞姆之锤|r
step << Alliance
    .goto Icecrown,79.44,72.84
	>>进入塔楼。与底层床上的 Ivalius 交谈
    .accept 13225 >>接任务: |cRXP_LOOT_破天号|r
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2
	>>飞向“破天者”号，这是一艘在高空飞行的大型联盟飞船。进入玛尔拉德后面的大房间，与贾斯汀交谈
    .turnin 13225 >>交任务: |cRXP_FRIENDLY_破天号|r
    .accept 13231 >>接任务: |cRXP_LOOT_破碎前线|r
step << Alliance
	#label slaves1
	#sticky
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>找到虔诚者阿布萨兰。他绕着船尾走，沿着左右楼梯上下走
    .daily 13300 >>接任务: |cRXP_LOOT_萨隆邪铁的奴隶|r
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>走上船尾的楼梯，和骑士队长德罗斯切交谈
    .daily 13336 >>接任务: |cRXP_LOOT_伊米亚之血|r
    .accept 13341 >>接任务: |cRXP_LOOT_协助突袭|r
step << Alliance
	#requires slaves1
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>走船中间的楼梯（玛尔拉德后面），然后走第一层楼梯两侧的楼梯，进入引擎室。与总工程师博尔特维伦奇交谈
    .accept 13296 >>接任务: |cRXP_LOOT_前往伊米海姆！|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤，一艘巨大的部落飞船在高空盘旋。进入前面的大房间。与掠天者科姆·布莱克斯卡交谈
    .turnin 13224 >>交任务: |cRXP_FRIENDLY_奥格瑞姆之锤|r
    .accept 13228 >>接任务: |cRXP_LOOT_破碎前线|r
step << Horde
	>>接受战争使者达沃斯·里欧特·凯尔坦兄弟的任务。他们在楼梯和下层甲板附近走动
    .daily 13302 >>接任务: |cRXP_LOOT_萨隆邪铁的奴隶|r
    .daily 13330 >>接任务: |cRXP_LOOT_伊米亚之血|r
    .accept 13340 >>接任务: |cRXP_LOOT_协助突袭|r
step << Horde
	>>前往船的下层甲板。与总工程师 Copperclaw 交谈
    .accept 13293 >>接任务: |cRXP_LOOT_前往伊米海姆！|r
step << Alliance
    .goto IcecrownGlacier,62.6,51.3
	>>飞向地面指挥官 Koup (在地面上)
    .turnin 13341 >>交任务: |cRXP_FRIENDLY_协助突袭|r
    .daily 13309 >>接任务: |cRXP_LOOT_空中突袭|r
	>>如果你愿意，你可以跳过每日任务
step << Alliance
    #completewith next
    .goto Icecrown,62.55,50.67
    .vehicle 32227 >>右键点击飞行器顶部的炮塔来开始任务
	.isOnQuest 13309
step << Alliance
	-- completionist
	>>飞行时向建筑物上的所有鱼叉枪射击
    .goto Icecrown,52.65,56.93
    .complete 13309,1 --4/4 Skybreaker Infiltrators dropped
	.isOnQuest 13309
step << Alliance
    .goto Icecrown,62.55,51.29
	>>返回库普
    .turnin 13309 >>交任务: |cRXP_FRIENDLY_空中突袭|r
	.isQuestComplete 13309
step << Alliance
    .goto IcecrownGlacier,62.5,51.1,15,0
    .goto IcecrownGlacier,62.8,51.6
	>>与小队队长交谈。如果其他人开始了任务，他可能不在这里，重生时间约为 6 分钟，重生地点在 Koup 右侧约 10 码处
	>>你可以跳过这个任务。这只是一个与其他任务紧密相关的日常任务
    .daily 13284 >>接任务: |cRXP_LOOT_地面突袭|r
step << Alliance
    .goto IcecrownGlacier,58.2,55.9,0
    .goto IcecrownGlacier,59.6,59.3,0
    .goto IcecrownGlacier,57.8,62.6,0
	#completewith Mineslave
	>>消灭伊米海姆各地的维库人
	.complete 13336,1 --Ymirheim Vrykul Slain (20)
step << Alliance
    .goto Icecrown,59.89,53.50
	>>护送部队。必要时让一些部队去对付怪物
    .complete 13284,1 --4/4 Alliance troops escorted to Ymirheim
	.isOnQuest 13284
step << Alliance
	#label Mineslave
    .goto IcecrownGlacier,55.7,57.3,40,0
    .goto IcecrownGlacier,56.2,58.9,40,0
    .goto IcecrownGlacier,55.6,59.7,40,0
    .goto IcecrownGlacier,54.5,60.0,40,0
    .goto IcecrownGlacier,55.7,57.3
	>>进入萨隆邪铁矿井。与奴隶交谈以拯救他们（有时他们可能会攻击你）。
    .complete 13300,1 --Saronite Mine Slave rescued (10)
	.skipgossip
	.isOnQuest 13300
step << Alliance
    .goto IcecrownGlacier,58.2,55.9,70,0
    .goto IcecrownGlacier,59.6,59.3,70,0
    .goto IcecrownGlacier,57.8,62.6
	>>消灭伊米海姆各地的维库人
	.complete 13336,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13336
step << Alliance
	#completewith next
    .goto Icecrown,57.01,62.53
	>>飞到地面上的 Frazzle
    .turnin 13296 >>交任务: |cRXP_FRIENDLY_前往伊米海姆！|r
step << Alliance
    .goto Icecrown,57.01,62.53
	>>注意：此任务标记您为 PVP。但是它非常简单。
    .daily 13280 >>接任务: |cRXP_LOOT_占山为王|r
step << Alliance
    #completewith next
    .goto Icecrown,56.99,62.60
    .vehicle 31784 >>右键点击看起来像侏儒的机器人
	.isOnQuest 13280
step << Alliance
    .goto Icecrown,54.89,60.12
	>>垃圾邮件使用“跳跃喷气机”（3）快速攀爬悬崖（没有冷却时间）。到达山顶后，使用“种植联盟战斗旗帜”（1）种植旗帜。然后，离开车辆
    .complete 13280,1 --1/1 Alliance Battle Standard planted
	.isOnQuest 13280
step << Alliance
    .goto Icecrown,56.97,62.55
	>>单击离开车辆按钮
    .turnin 13280 >>交任务: |cRXP_FRIENDLY_占山为王|r
	.isQuestComplete 13280
step << Horde
	>>飞到地面指挥官 Xutjja 那里（他在地面上，不在船上）
    .goto IcecrownGlacier,58.3,46.0
    .turnin 13340 >>交任务: |cRXP_FRIENDLY_协助突袭|r
step << Horde
    .goto IcecrownGlacier,58.3,46.0
    .daily 13310 >>接任务: |cRXP_LOOT_空中突袭|r
	>>如果你愿意，你可以跳过每日任务
step << Horde
	#completewith next
	.vehicle >>跑到库卡隆压制炮塔那里并点击它。
    .goto IcecrownGlacier,59.5,45.94
	.isOnQuest 13310
step << Horde
	>>飞行时向建筑物上的所有鱼叉枪射击。这样做时，渗透者会掉落。
    .goto IcecrownGlacier,56.8,64.3
    .complete 13310,1 --Kor'kron Infiltrators dropped (4)
	.isOnQuest 13310
step << Horde
    .goto IcecrownGlacier,58.3,46.0
    .turnin 13310 >>交任务: |cRXP_FRIENDLY_空中突袭|r
	.isQuestComplete 13310
step << Horde
    .goto IcecrownGlacier,58.3,46.0
	>>与小队队长交谈。如果其他人开始了任务，他可能不在这里，并且重生时间大约为 6 分钟
    .daily 13301 >>接任务: |cRXP_LOOT_地面突袭|r
	>>你可以跳过这个任务。这只是一个与其他任务紧密相关的日常任务
step << Horde
	#sticky
	#label ymirheimslain
    .goto IcecrownGlacier,58.2,55.9,0
    .goto IcecrownGlacier,59.6,59.3,0
    .goto IcecrownGlacier,57.8,62.6,0
	#completewith Mineslave
	>>消灭伊米海姆各地的维库人
	.complete 13330,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13330
step << Horde
	>>护送部队。
    .goto IcecrownGlacier,59.4,52.8
    .complete 13301,1 --Horde troops escorted to Ymirheim (4)
	.isOnQuest 13301
step << Horde
	#label Mineslave
    .goto IcecrownGlacier,55.7,57.3,40,0
    .goto IcecrownGlacier,56.2,58.9,40,0
    .goto IcecrownGlacier,55.6,59.7,40,0
    .goto IcecrownGlacier,54.5,60.0,40,0
    .goto IcecrownGlacier,55.7,57.3
	>>进入萨隆邪铁矿井。与奴隶交谈以拯救他们（有时他们可能会攻击你）。
    .complete 13302,1 --Saronite Mine Slave rescued (10)
	.skipgossip
	.isOnQuest 13302
step << Horde
	#requires ymirheimslain
    .goto IcecrownGlacier,51.9,57.6
    .turnin 13293 >>交任务: |cRXP_FRIENDLY_前往伊米海姆！|r
    .daily 13283 >>接任务: |cRXP_LOOT_占山为王|r
step << Horde
    #completewith next
    .goto Icecrown,51.95,57.62
    .vehicle >>右键点击看起来像侏儒的机器人
	.isOnQuest 13283
step << Horde
    .goto Icecrown,54.89,60.12
	>>垃圾邮件使用“跳跃喷气机”（3）快速攀爬悬崖（没有冷却时间）。到达山顶后，使用“种植部落战旗”（1）种植旗帜。然后，离开车辆
    .complete 13283,1 --1/1 Horde Battle Standard planted
	.isOnQuest 13283
step << Horde
    .goto Icecrown,51.9,57.6
	>>单击离开车辆按钮
    .turnin 13283 >>交任务: |cRXP_FRIENDLY_占山为王|r
	.isQuestComplete 13283
step << Alliance
    .goto IcecrownGlacier,66.4,66.5
	>>找到一名在破碎前线的垂死士兵并与其交谈
    .complete 13231,1 --Dying Soldier Questioned (1)
    .accept 13232 >>接任务: |cRXP_LOOT_让我解脱吧！|r
	.skipgossip
step << Alliance
    .goto IcecrownGlacier,69.1,62.1
	>>在该区域周围找到更多垂死的士兵并消灭他们
	.complete 13232,1
	.skipgossip
step << Horde
    .goto IcecrownGlacier,67.7,68.4
	>>找到破碎前线附近的垂死狂战士并与他交谈
    .complete 13228,1 --Dying Berserker Questioned (1)
    .accept 13230 >>接任务: |cRXP_LOOT_为我复仇！|r
step << Horde
    .goto IcecrownGlacier,68.7,64.2
	>>在该区域周围找到更多垂死的士兵并消灭他们
	.complete 13230,1 --Dying Alliance Soldiers Slain (5)
	.skipgossip
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3
	>>飞到“破天者”号，这是一艘在高空飞行的大型联盟飞船（你可以在地图上看到它）。进入玛尔拉德后面的大房间，和贾斯汀交谈
    .turnin 13231 >>交任务: |cRXP_FRIENDLY_破碎前线|r
    .turnin 13232 >>交任务: |cRXP_FRIENDLY_让我解脱吧！|r
    .accept 13286 >>接任务: |cRXP_LOOT_……所有可能的帮助|r
    .accept 13290 >>接任务: |cRXP_LOOT_请留意一下……|r
step << Alliance
	#label slaves2
	#sticky
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>找到虔诚者阿布萨兰。他绕着船尾走，沿着左右楼梯上下走
    .turnin 13300 >>交任务: |cRXP_FRIENDLY_萨隆邪铁的奴隶|r
	.isQuestComplete 13300
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>走上船尾的楼梯，和骑士队长德罗斯切交谈
    .turnin 13336 >>交任务: |cRXP_FRIENDLY_伊米亚之血|r
	.isQuestComplete 13336
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>与船左后角的萨萨里安交谈
    .turnin 13286 >>交任务: |cRXP_FRIENDLY_……所有可能的帮助|r
    .accept 13287 >>接任务: |cRXP_LOOT_知己知彼|r
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>走船中间的楼梯（玛尔拉德后面），然后走第一层楼梯两侧的楼梯，进入引擎室。与总工程师博尔特维伦奇交谈
    .turnin 13290 >>交任务: |cRXP_FRIENDLY_请留意一下……|r
    .accept 13291 >>接任务: |cRXP_LOOT_“借来”的技术|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞向奥格瑞姆之锤，这是一艘在高空飞行的大型部落飞船。与前室的掠天者科姆·黑痕交谈
    .turnin 13228 >>交任务: |cRXP_FRIENDLY_破碎前线|r
    .turnin 13230 >>交任务: |cRXP_FRIENDLY_为我复仇！|r
    .accept 13238 >>接任务: |cRXP_LOOT_有价值的帮手？|r
    .accept 13260 >>接任务: |cRXP_LOOT_知根知底|r
step << Horde
	>>与你旁边的 Koltira 交谈
    .turnin 13260 >>交任务: |cRXP_FRIENDLY_知根知底|r
    .accept 13237 >>接任务: |cRXP_LOOT_知己知彼|r
step << Horde
	>>与在楼梯附近走动的凯尔坦兄弟交谈
    .turnin 13302 >>交任务: |cRXP_FRIENDLY_萨隆邪铁的奴隶|r
	.isQuestComplete 13302
step
	>>与战争使者戴佛斯·里奥特交谈。他也在底层甲板巡逻
    .turnin 13330 >>交任务: |cRXP_FRIENDLY_伊米亚之血|r
	.isQuestComplete 13330
step << Horde
	>>前往船的下层甲板。与总工程师 Copperclaw 交谈
    .turnin 13238 >>交任务: |cRXP_FRIENDLY_有价值的帮手？|r
    .accept 13239 >>接任务: |cRXP_LOOT_爆炸油|r
step << Alliance
	>>返回地面指挥官库普
    .goto Icecrown,62.60,51.35
    .turnin 13284 >>交任务: |cRXP_FRIENDLY_地面突袭|r
	.isQuestComplete 13284
step << Horde
	>>返回地面指挥官 Xutjja
    .goto IcecrownGlacier,58.3,46.2
    .turnin 13301 >>交任务: |cRXP_FRIENDLY_地面突袭|r
	.isQuestComplete 13301
step << Alliance
	#completewith next
    .goto IcecrownGlacier,67.2,68.3,70,0
    .goto IcecrownGlacier,68.0,70.9,70,0
    .goto IcecrownGlacier,71.6,61.3,70,0
    .goto IcecrownGlacier,67.2,68.3
	.use 44048 >>搜刮破碎前线周围地面上散落的废弃装备。当你拥有每件装备时，使用背包中的走私溶液（无需等待 RP）
	.collect 43609,3,13291,1,-1 --Pile of Bones (3)
	.collect 43610,3,13291,1,-1 --Abandoned Helm (3)
	.collect 43616,3,13291,1,-1 --Abandoned Armor (3)
    .complete 13291,1 --Field Tests Conducted (3)
step << Horde
	#completewith next
    .goto IcecrownGlacier,67.2,68.3,70,0
    .goto IcecrownGlacier,68.0,70.9,70,0
    .goto IcecrownGlacier,71.6,61.3,70,0
    .goto IcecrownGlacier,67.2,68.3
	.use 43608 >>搜刮破碎前线周围地面上散落的废弃装备。当你拥有每件装备时，使用背包中的 Copperclaw 挥发油（无需等待 RP）
	.collect 43609,3,13239,1,-1 --Pile of Bones (3)
	.collect 43610,3,13239,1,-1 --Abandoned Helm (3)
	.collect 43616,3,13239,1,-1 --Abandoned Armor (3)
    .complete 13239,1 --Field Tests Conducted (3)
step << Alliance
    .goto IcecrownGlacier,67.0,63.3,70,0
    .goto IcecrownGlacier,67.4,70.2,70,0
    .goto IcecrownGlacier,71.6,61.3
	>>杀死该区域的憎恶、熟练者和死灵法师
    .complete 13287,1 --Hulking Abominations Slain (5)
    .complete 13287,3 --Shadow Adepts Slain (5)
    .complete 13287,2 --Malefic Necromancers Slain (5)
step << Horde
    .goto IcecrownGlacier,67.0,63.3,70,0
    .goto IcecrownGlacier,67.4,70.2,70,0
    .goto IcecrownGlacier,71.6,61.3
	>>杀死该区域的憎恶、熟练者和死灵法师
    .complete 13237,1 --Hulking Abominations Slain (5)
    .complete 13237,3 --Shadow Adepts Slain (5)
    .complete 13237,2 --Malefic Necromancers Slain (5)
step << Alliance
    .goto IcecrownGlacier,67.2,68.3,70,0
    .goto IcecrownGlacier,68.0,70.9,70,0
    .goto IcecrownGlacier,71.6,61.3,70,0
    .goto IcecrownGlacier,67.2,68.3
	.use 44048 >>搜刮破碎前线周围地面上散落的废弃装备。当你拥有每件装备时，使用背包中的走私溶液（无需等待 RP）
	.collect 43609,3,13291,1,-1 --Pile of Bones (3)
	.collect 43610,3,13291,1,-1 --Abandoned Helm (3)
	.collect 43616,3,13291,1,-1 --Abandoned Armor (3)
    .complete 13291,1 --Field Tests Conducted (3)
step << Horde
    .goto IcecrownGlacier,67.2,68.3,70,0
    .goto IcecrownGlacier,68.0,70.9,70,0
    .goto IcecrownGlacier,71.6,61.3,70,0
    .goto IcecrownGlacier,67.2,68.3
	.use 43608 >>搜刮破碎前线周围地面上散落的废弃装备。当你拥有每件装备时，使用背包中的 Copperclaw 挥发油（无需等待 RP）
	.collect 43609,3,13239,1,-1 --Pile of Bones (3)
	.collect 43610,3,13239,1,-1 --Abandoned Helm (3)
	.collect 43616,3,13239,1,-1 --Abandoned Armor (3)
    .complete 13239,1 --Field Tests Conducted (3)
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3
	>>飞向“破天者”号，这是一艘在高空飞行的大型联盟飞船。与飞船左后角的萨萨里安交谈
    .turnin 13287 >>交任务: |cRXP_FRIENDLY_知己知彼|r
    .accept 13288 >>接任务: |cRXP_LOOT_你的憎恶伙伴|r
    .accept 13294 >>接任务: |cRXP_LOOT_对抗巨人|r
step << Alliance
	#requires notdead
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3
	>>走船中间的楼梯（玛尔拉德后面），然后走第一层楼梯两侧的楼梯，进入引擎室。与总工程师博尔特维伦奇交谈
    .turnin 13291 >>交任务: |cRXP_FRIENDLY_“借来”的技术|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤号，这是一艘在空中飞行的大型部落飞船。与飞船前厅的库尔提拉交谈
    .turnin 13237 >>交任务: |cRXP_FRIENDLY_知己知彼|r
    .accept 13264 >>接任务: |cRXP_LOOT_你的憎恶伙伴|r
	.accept 13277 >>接任务: |cRXP_LOOT_对抗巨人|r
step << Horde
	>>前往船的下层甲板。与总工程师 Copperclaw 交谈
    .turnin 13239 >>交任务: |cRXP_FRIENDLY_爆炸油|r
step
    .goto IcecrownGlacier,68.3,61.5
	>>杀死该区域的巨型憎恶并从它们身上获取冰冻憎恶内脏
	.use 43968 >>使用憎恶复活包和背包中的一些内脏召唤一只你可以控制的憎恶。让憎恶攻击并激怒尽可能多的怪物，然后使用“爆裂之缝”杀死憎恶附近的所有怪物（怪物必须处于战斗状态才能获得奖励）
	>>如果你的 Guts 用完了，就去杀死更多的巨型怪物。你一次只能携带 1 个 Guts。
	.collect 43966,1,13288,-1,1 << Alliance --Chilled Abomination Guts (3)
    .complete 13288,1 << Alliance  --Icy Ghouls Exploded (15)
    .complete 13288,2 << Alliance  --Vicious Geists Exploded (15)
    .complete 13288,3 << Alliance  --Risen Alliance Soldiers Exploded (15)
	.collect 43966,1,13264,-1,1 << Horde  --Chilled Abomination Guts (3)
    .complete 13264,1 << Horde --Icy Ghouls Exploded (15)
    .complete 13264,2 << Horde --Vicious Geists Exploded (15)
    .complete 13264,3 << Horde --Risen Alliance Soldiers Exploded (15)
	.isOnQuest 13288 << Alliance
	.isOnQuest 13264 << Horde
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>回到奥格瑞姆之锤那里。和库尔蒂拉交谈
    .turnin 13264 >>交任务: |cRXP_FRIENDLY_你的憎恶伙伴|r
    .accept 13351 >>接任务: |cRXP_LOOT_预览|r
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3
	>>返回破天者号。与萨萨里安交谈
    .turnin 13288 >>交任务: |cRXP_FRIENDLY_你的憎恶伙伴|r
    .accept 13315 >>接任务: |cRXP_LOOT_预览|r
step << Alliance
	>>飞越大墙上方平台的航点
    .complete 13315,1 --1/1 Aldur'thar South Visited
    .goto Icecrown,55.64,46.73
    .complete 13315,2 --1/1 Aldur'thar Central Visited
    .goto Icecrown,54.10,43.43
    .complete 13315,3 --1/1 Aldur'thar North Visited
    .goto Icecrown,54.09,35.33
    .complete 13315,4 --1/1 Aldur'thar Northwest Visited
    .goto Icecrown,52.06,34.21
step << Horde
	>>飞越大墙上方平台的航点
    .complete 13351,1 --Aldur'thar South Visited (1)
    .goto IcecrownGlacier,55.3,43.9
    .complete 13351,2 --Aldur'thar Central Visited (1)
    .goto IcecrownGlacier,55.1,41.6
    .complete 13351,3 --Aldur'thar North Visited (1)
    .goto IcecrownGlacier,53.7,35.5
    .complete 13351,4 --Aldur'thar Northwest Visited (1)
    .goto IcecrownGlacier,51.9,34.8
step << Alliance
    .goto IcecrownGlacier,65.7,63.0,70,0
    .goto IcecrownGlacier,63.4,56.7,70,0
    .goto IcecrownGlacier,66.8,58.4,70,0
    .goto IcecrownGlacier,69.5,57.3,70,0
    .goto IcecrownGlacier,72.5,59.0,70,0
    .goto IcecrownGlacier,70.1,57.2,70,0
    .goto IcecrownGlacier,65.7,63.0,70,0
    .goto IcecrownGlacier,63.4,56.7
	>>杀死该区域的脓疱恐魔。掠夺它们的脊椎。这个任务非常困难，如果需要，可以组队完成。
    .complete 13294,1 --Pustulant Spine (5)
step << Horde
    .goto IcecrownGlacier,65.7,63.0,70,0
    .goto IcecrownGlacier,63.4,56.7,70,0
    .goto IcecrownGlacier,66.8,58.4,70,0
    .goto IcecrownGlacier,69.5,57.3,70,0
    .goto IcecrownGlacier,72.5,59.0,70,0
    .goto IcecrownGlacier,70.1,57.2,70,0
    .goto IcecrownGlacier,65.7,63.0,70,0
    .goto IcecrownGlacier,63.4,56.7
	>>杀死该区域的脓疱恐魔。掠夺它们的脊椎。这个任务非常困难，如果需要，可以组队完成。
    .complete 13277,1 --Pustulant Spine (5)
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤号，这是一艘在空中飞行的大型部落飞船。与飞船前厅的库尔提拉交谈
    .turnin 13351 >>交任务: |cRXP_FRIENDLY_预览|r
	.turnin 13277 >>交任务: |cRXP_FRIENDLY_对抗巨人|r
    .accept 13355 >>接任务: |cRXP_LOOT_无法复制|r
    .accept 13354 >>接任务: |cRXP_LOOT_指挥体系|r
    .accept 13352 >>接任务: |cRXP_LOOT_从天而“降”|r
	.accept 13279 >>接任务: |cRXP_LOOT_化学常识|r
    .accept 13278 >>接任务: |cRXP_LOOT_污染者科普洛斯|r
step << Horde
	>>前往船的下层甲板。与总工程师 Copperclaw 交谈
    .accept 13379 >>接任务: |cRXP_LOOT_绿色科技|r
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3
	>>飞向“破天者”号，这是一艘在高空飞行的大型联盟飞船。与飞船左后角的萨萨里安交谈
    .turnin 13315 >>交任务: |cRXP_FRIENDLY_预览|r
    .turnin 13294 >>交任务: |cRXP_FRIENDLY_对抗巨人|r
    .accept 13318 >>接任务: |cRXP_LOOT_从天而“降”|r
    .accept 13319 >>接任务: |cRXP_LOOT_指挥体系|r
    .accept 13320 >>接任务: |cRXP_LOOT_无法复制|r
    .accept 13295 >>接任务: |cRXP_LOOT_化学常识|r
    .accept 13298 >>接任务: |cRXP_LOOT_污染者科普洛斯|r
step << Alliance
	>>走船中间的楼梯（玛尔拉德后面），然后走第一层楼梯两侧的楼梯，进入引擎室。与总工程师博尔特维伦奇交谈
    .accept 13383 >>接任务: |cRXP_LOOT_“借来”的技术|r
step
	#completewith next
    .goto IcecrownGlacier,63.3,62.1,25 >>进入莫德雷萨内部的大门。它位于第二层，由瘟疫恶魔守卫
	.isOnQuest 13295 << Alliance
	.isOnQuest 13279 << Horde
step
    .goto IcecrownGlacier,62.3,63.4
	.use 44010 >>将包中的脓疱性脊髓液用在冒泡的绿色大锅上。杀死生成的怪物，并在提示“尽快添加液体”时再次使用脊髓液。这个任务非常困难，如果需要，请组队完成。
    .complete 13295,1 << Alliance --Batch of Plague Neutralized (1)
    .complete 13279,1 << Horde --Batch of Plague Neutralized (1)
step
    .goto IcecrownGlacier,60.8,62.2
	>>杀死莫德雷萨内的污染者科普罗斯。这个任务非常困难，所以如果需要的话，请组队完成。
    .complete 13298,1 << Alliance --Coprous the Defiler Slain (1)
    .complete 13278,1 << Horde --Coprous the Defiler Slain (1)
step
	#sticky
	#label darksub
	>>前往墙壁上方的平台，杀死该区域的苦毒新兵。掠夺他们的幻象之球
	.use 44246 >>当你脱离战斗时，使用幻象之球对付区域内的黑暗征服者。
	.collect 44246,3,13352,1,-1 << Horde --Orb of Illusion (3 -1)
	.collect 44246,3,13318,1,-1 << Alliance --Orb of Illusion (3 -1)
    .goto IcecrownGlacier,53.7,46.1
    .complete 13352,1 << Horde --Dark Subjugator dragged and dropped (3)
    .complete 13318,1 << Alliance --Dark Subjugator dragged and dropped (3)
    .goto IcecrownGlacier,54.7,45.9,60,0
    .goto IcecrownGlacier,54.0,46.3,60,0
    .goto IcecrownGlacier,52.2,45.7,60,0
    .goto IcecrownGlacier,54.0,46.3
--	.unitscan Dark Subjugator
--X too many in the area, unitscan would be awkward
step
    .goto IcecrownGlacier,53.9,46.1
	>>杀死大帐篷里的监工费德里斯
    .complete 13354,1 << Horde --Overseer Faedris Killed (1)
	.complete 13319,1 << Alliance --Overseer Faedris Killed (1)
step
	#requires darksub
	.use 44251 >>在阿尔杜萨外面的炼药锅上使用隔断烧瓶
    .complete 13355,3 << Horde --Dark Sample Collected (1)
	.complete 13320,3 << Alliance --Dark Sample Collected (1)
    .goto IcecrownGlacier,49.7,34.4
    .complete 13355,2 << Horde --Green Sample Collected (1)
	.complete 13320,2 << Alliance --Green Sample Collected (1)
    .goto IcecrownGlacier,49.1,34.2
    .complete 13355,1 << Horde --Blue Sample Collected (1)
    .complete 13320,1 << Alliance --Blue Sample Collected (1)
    .goto IcecrownGlacier,48.9,33.2
step
	>>杀死大帐篷下的监工 Savryn 和 Jhaeqon。然后飞上一层到 Veraj（大帐篷下）并杀死他
    .complete 13354,4 << Horde --Overseer Savryn Killed (1)
	.complete 13319,4 << Alliance --Overseer Savryn Killed (1)
    .goto IcecrownGlacier,49.4,31.2
    .complete 13354,2 << Horde --Overseer Jhaeqon Killed (1)
	.complete 13319,2 << Alliance --Overseer Jhaeqon Killed (1)
    .goto IcecrownGlacier,54.7,32.6
    .complete 13354,3 << Horde --Overseer Veraj Killed (1)
	.complete 13319,3 << Alliance --Overseer Veraj Killed (1)
    .goto IcecrownGlacier,53.7,29.2
step << Alliance
	>>飞到空中的小平台上。和Killohertz交谈
	.goto IcecrownGlacier,53.96,42.93
	.turnin 13383 >>交任务: |cRXP_FRIENDLY_吉普利·基罗赫斯|r
	.accept 13380 >>接任务: |cRXP_LOOT_委以重任|r
step << Alliance
	.goto IcecrownGlacier,53.96,43.11
	>>与凯伦交谈，登上轰炸机。使用冲锋护盾 (1) 获得 100 个护盾，然后切换到轰炸舱 (5)，开始轰炸下方的天灾，直到所有步兵和上尉都被杀死。切换到防空炮塔 (4)，开始使用防空火箭 (1) 向空中射击石像鬼。完成后，按离开车辆按钮，您将返回平台
	.complete 13380,1 -- Bombardment Infantry slain (40)
	.complete 13380,2 -- Bombardment Captain slain (8)
	.complete 13380,3 -- Gargoyle Ambusher slain (15)
	.skipgossip
step << Alliance
	>>与 Killohertz 交谈
    .goto IcecrownGlacier,53.96,42.93
    .turnin 13380 >>交任务: |cRXP_FRIENDLY_委以重任|r
step << Horde
	>>飞到空中的小平台上。和Tezzla交谈
    .goto IcecrownGlacier,53.99,36.87
    .turnin 13379 >>交任务: |cRXP_FRIENDLY_绿色科技|r
    .accept 13373 >>接任务: |cRXP_LOOT_边缘科学的益处|r
step << Horde
	.goto IcecrownGlacier,54.00,36.70
	>>与 Rizzy 交谈，登上轰炸机。使用冲锋护盾 (1) 获得 100 个护盾，然后切换到轰炸舱 (5)，开始轰炸下面的天灾，直到所有步兵和上尉都被杀死。切换到防空炮塔 (4)，开始使用防空火箭 (1) 向空中射击石像鬼。完成后，按离开车辆按钮，您将返回平台
	.complete 13373,1 -- Bombardment Infantry slain (40)
	.complete 13373,2 -- Bombardment Captain slain (8)
	.complete 13373,3 -- Gargoyle Ambusher slain (15)
	.skipgossip
step << Horde
	>>与 Tezzla 交谈
    .goto IcecrownGlacier,54.00,36.94
    .turnin 13373 >>交任务: |cRXP_FRIENDLY_边缘科学的益处|r
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3
	>>飞向“破天者”号，这是一艘在高空飞行的大型联盟飞船。与飞船左后角的萨萨里安交谈
    .turnin 13318 >>交任务: |cRXP_FRIENDLY_从天而“降”|r
    .turnin 13319 >>交任务: |cRXP_FRIENDLY_指挥体系|r
    .turnin 13295 >>交任务: |cRXP_FRIENDLY_化学常识|r
    .turnin 13298 >>交任务: |cRXP_FRIENDLY_污染者科普洛斯|r
    .accept 13342 >>接任务: |cRXP_LOOT_活动窃听器|r
    .accept 13345 >>接任务: |cRXP_LOOT_需要更多情报|r
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3
	>>走船中间的楼梯（玛尔拉德后面），然后走第一层楼梯两侧的楼梯，进入引擎室。与总工程师博尔特维伦奇交谈
    .turnin 13320 >>交任务: |cRXP_FRIENDLY_无法复制|r
    .accept 13321 >>接任务: |cRXP_LOOT_重新考验|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤，这是一艘在高空飞行的大型部落飞船。进入前面的大房间。与科利特拉交谈
	.turnin 13352 >>交任务: |cRXP_FRIENDLY_从天而“降”|r
    .turnin 13354 >>交任务: |cRXP_FRIENDLY_指挥体系|r
    .turnin 13279 >>交任务: |cRXP_FRIENDLY_化学常识|r
    .turnin 13278 >>交任务: |cRXP_FRIENDLY_污染者科普洛斯|r
    .accept 13358 >>接任务: |cRXP_LOOT_活动窃听器|r
    .accept 13366 >>接任务: |cRXP_LOOT_需要更多情报|r
step << Horde
	>>前往船的下层甲板。与总工程师 Copperclaw 交谈
    .turnin 13355 >>交任务: |cRXP_FRIENDLY_无法复制|r
    .accept 13356 >>接任务: |cRXP_LOOT_重新考验|r
step
	#label taintedessence
	#sticky
    .goto IcecrownGlacier,49.7,34.4,0,0
	.use 44307 >>使用包中的稀释邪教补药来获得“黑暗洞察力”增益。这让你可以从你杀死的该区域的所有类人生物身上掠夺污染精华
	.collect 44301,10,13356,1 << Horde
	.collect 44301,10,13321,1 << Alliance
step
    .goto IcecrownGlacier,54.1,31.4,70,0
    .goto IcecrownGlacier,54.7,28.0,70,0
    .goto IcecrownGlacier,57.0,28.8,70,0
    .goto IcecrownGlacier,54.1,31.4
	.use 44433 >>杀死 5 名被奴役的奴仆（虚空行者）。使用虹吸棒在他们的尸体上获取暗物质
	.collect 44434,5,13342,1 << Alliance --Dark Matter (5)
	.collect 44434,5,13358,1 << Horde --Dark Matter (5)
step
    .goto IcecrownGlacier,53.8,33.6
	>>点击召唤石
	.complete 13342,1 << Alliance  --Dark Messenger Summoned (1)
    .complete 13358,1 << Horde --Dark Messenger Summoned (1)
step
	#completewith next
    .goto IcecrownGlacier,51.9,32.5,30 >>进入阿尔杜萨内部
	.isOnQuest 13366 << Horde
	.isOnQuest 13345 << Alliance
step
    .goto IcecrownGlacier,53.1,31.1,60,0
    .goto IcecrownGlacier,53.1,29.2,60,0
    .goto IcecrownGlacier,50.9,29.0,60,0
    .goto IcecrownGlacier,50.9,30.4,60,0
    .goto IcecrownGlacier,53.1,31.1
	>>杀死该区域的邪教研究员。掠夺他们的研究页面
	.collect 44459,1 --Cult of the Damned Research - Page 1 (1)
	.collect 44460,1 --Cult of the Damned Research - Page 2 (1)
	.collect 44461,1 --Cult of the Damned Research - Page 3 (1)
	.isOnQuest 13366 << Horde
	.isOnQuest 13345 << Alliance
step
	#sticky
	#label Thesis
    .goto IcecrownGlacier,49.7,34.4
	.use 44459 >>点击包中的其中一个研究页面，将其合并到论文中
    .complete 13366,1 << Horde --Cult of the Damned Thesis (1)
	.complete 13345,1 << Alliance --Cult of the Damned Thesis (1)
step
	#requires taintedessence
    .goto IcecrownGlacier,49.7,34.4
	.use 44301
	.use 44304 >>右键点击包里的污秽精华，将其变成翻滚的物质。将其扔进大锅里
	.complete 13321,1 << Alliance
	.complete 13356,1 << Horde
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3
	>>飞向“破天者”号，这是一艘在高空飞行的大型联盟飞船。与飞船左后角的萨萨里安交谈
    .turnin 13342 >>交任务: |cRXP_FRIENDLY_活动窃听器|r
    .turnin 13345 >>交任务: |cRXP_FRIENDLY_需要更多情报|r
    .accept 13346 >>接任务: |cRXP_LOOT_片刻不得安宁|r
    .accept 13332 >>接任务: |cRXP_LOOT_构建路障|r
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3
	>>走船中间的楼梯（玛尔拉德后面），然后走第一层楼梯两侧的楼梯，进入引擎室。与总工程师博尔特维伦奇交谈
    .turnin 13321 >>交任务: |cRXP_FRIENDLY_重新考验|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤，这是一艘在高空飞行的大型部落飞船。进入前面的大房间。与科利特拉交谈
    .turnin 13358 >>交任务: |cRXP_FRIENDLY_活动窃听器|r
	.turnin 13366 >>交任务: |cRXP_FRIENDLY_需要更多情报|r
    .accept 13367 >>接任务: |cRXP_LOOT_片刻不得安宁|r
    .accept 13306 >>接任务: |cRXP_LOOT_构建路障|r
step << Horde
	>>前往船的下层甲板。与总工程师 Copperclaw 交谈
    .turnin 13356 >>交任务: |cRXP_FRIENDLY_重新考验|r
step
    .goto IcecrownGlacier,52.5,42.0,70,0
    .goto IcecrownGlacier,51.3,37.1,70,0
    .goto IcecrownGlacier,47.1,37.4,70,0
    .goto IcecrownGlacier,50.0,44.9,70,0
    .goto IcecrownGlacier,52.5,42.0
	.use 44127 >>在英雄陨落之谷，使用背包里的路障建造工具，对出现的紫色光芒进行修建
    .complete 13332,1 << Alliance --Barricades constructed (8)
	.complete 13306,1 << Horde --Barricades constructed (8)
step
	>>这个任务非常困难，如果需要的话可以组队完成
	>>打开 Aldur'thar 里面的箱子，拾取 Alumeth 的头骨、心脏、权杖和长袍
	.collect 44476,1 --Alumeth's Skull (1)
    .goto IcecrownGlacier,50.5,30.0
	.collect 44477,1 --Alumeth's Heart (1)
    .goto IcecrownGlacier,52.8,30.7
	.collect 44478,1 --Alumeth's Scepter (1)
    .goto IcecrownGlacier,52.8,29.8
	.collect 44479,1 --Alumeth's Robes (1)
    .goto IcecrownGlacier,53.0,29.0
	.isOnQuest 13346 << Alliance
	.isOnQuest 13367 << Horde
step
    .goto IcecrownGlacier,51.9,29.0
	>>这个任务非常困难，如果需要的话可以组队完成
	.use 44476 >>点击背包中的任意物品，将其合成为 Alumeth's Remains
	.collect 44480,1 --Alumeth's Remains (1)
	.isOnQuest 13346 << Alliance
	.isOnQuest 13367 << Horde
step
    .goto IcecrownGlacier,51.9,29.0
	>>这个任务非常困难，如果需要的话可以组队完成
	.use 44480 >>在发光水晶前使用 Alumeth 的遗骸来召唤他。杀死他
    .complete 13346,1 << Alliance --Alumeth the Ascended Defeated (1)
    .complete 13367,1 << Horde --Alumeth the Ascended Defeated (1)
	.isOnQuest 13346 << Alliance
	.isOnQuest 13367 << Horde
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3
	>>飞向“破天者”号，这是一艘在高空飞行的大型联盟飞船。与飞船左后角的萨萨里安交谈
    .turnin 13346 >>交任务: |cRXP_FRIENDLY_片刻不得安宁|r
    .turnin 13332 >>交任务: |cRXP_FRIENDLY_构建路障|r
	.accept 13337 >>接任务: |cRXP_LOOT_铁墙壁垒|r
	.accept 13334 >>接任务: |cRXP_LOOT_溅血的旗帜|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤，这是一艘在高空飞行的大型部落飞船。进入前面的大房间。与科利特拉交谈
    .turnin 13367 >>交任务: |cRXP_FRIENDLY_片刻不得安宁|r
    .turnin 13306 >>交任务: |cRXP_FRIENDLY_构建路障|r
	.accept 13312 >>接任务: |cRXP_LOOT_铁墙壁垒|r
	.accept 13307 >>接任务: |cRXP_LOOT_溅血的旗帜|r
step
    .goto IcecrownGlacier,51.3,40.3,70,0
    .goto IcecrownGlacier,49.1,43.8
	>>消灭该区域内的天灾转换器
    .complete 13334,3 << Alliance --Scourge Converter (5)
    .complete 13307,3 << Horde --Scourge Converter (5)
step
    .goto IcecrownGlacier,45.5,46.5
	>>这个任务非常困难，如果需要的话可以组队完成
	.use 44186 >>飞到阳台上，然后使用你包里的扭曲符文，杀死邪恶的格里姆科尔
    .complete 13337,1 << Alliance --Grimkor the Wicked (1)
    .complete 13312,1 << Horde --Grimkor the Wicked (1)
step
    .goto IcecrownGlacier,47.1,48.5,70,0
    .goto IcecrownGlacier,41.9,48.4,70,0
    .goto IcecrownGlacier,41.9,54.3,70,0
    .goto IcecrownGlacier,46.1,53.1
	>>杀死该区域的天灾旗手和皈依的英雄
    .complete 13334,1 << Alliance --Scourge Banner-熊er (5)
    .complete 13334,2 << Alliance --Converted Hero (20)
    .complete 13307,1 << Horde --Scourge Banner-熊er (5)
    .complete 13307,2 << Horde --Converted Hero (20)
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3
	>>飞向“破天者”号，这是一艘在高空飞行的大型联盟飞船。与飞船左后角的萨萨里安交谈
	.turnin 13334 >>交任务: |cRXP_FRIENDLY_溅血的旗帜|r
	.turnin 13337 >>交任务: |cRXP_FRIENDLY_铁墙壁垒|r
	>>进入玛尔拉德在破天者号上面对的大房间，和贾斯汀交谈
	.accept 13314 >>接任务: |cRXP_LOOT_获取情报|r
step << Alliance
    .goto IcecrownGlacier,46.2,52.1,70,0
    .goto IcecrownGlacier,42.4,59.4,0,0
	.use 44222 >>使用背包中的飞镖枪对付奥格瑞姆之锤侦察兵（你可以在飞行坐骑上使用它）。搜刮他们的尸体，用于派遣
    .complete 13314,1 --Orgrim's Hammer Dispatch (6)
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
    .goto IcecrownGlacier,54.7,35.3,200,0
    .goto IcecrownGlacier,65.1,57.2,200,0
    .goto IcecrownGlacier,54.7,35.3
	>>进入玛尔拉德在破天者号上面对的大房间，和贾斯汀交谈
	.turnin 13314 >>交任务: |cRXP_FRIENDLY_获取情报|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤，这是一艘在高空飞行的大型部落飞船。进入前面的大房间。与科利特拉交谈
	.turnin 13312 >>交任务: |cRXP_FRIENDLY_铁墙壁垒|r
	.turnin 13307 >>交任务: |cRXP_FRIENDLY_溅血的旗帜|r
step << Horde
	>>与你身边的 Krom Blackscar 交谈
	.accept 13313 >>接任务: |cRXP_LOOT_遮挡天空|r
step << Horde
	.goto IcecrownGlacier,48.85,40.44
	.use 44212 >>使用背包中的 SGM-3 对空中的 Skybreaker 侦察战斗机进行攻击
	.complete 13313,1 --Skybreaker Recon Fighters shot down (6)
step << Horde
	>>飞到奥格瑞姆之锤，一艘巨大的部落飞船在高空盘旋。进入前面的大房间。与克罗姆·布莱克斯卡交谈
	.turnin 13313 >>交任务: |cRXP_FRIENDLY_遮挡天空|r
step
	+如果您跳过或未完成本指南中的任何任务，请重新开始指南并完成它们。为此，请单击齿轮并导航回冰冠炮艇解锁每日任务指南
	>>如果你已经完成了所有任务，你就可以开始使用冰冠炮艇每日任务路线了。请注意，有些任务今天可能无法使用，因为你可能已经完成了一些每日任务
]])
