RXPGuides.RegisterGuide([[
#version 1
#group +RestedXP 诺森德日常任务
#subgroup 阵营日常任务
#wotlk
#cata
#name 冰冠冰川飞艇日常任务解锁
#displayname 冰冠冰川飞艇日常任务解锁 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
	+注意:冰冠冰川中的许多日常任务需要以5人团队任务作为前置条件. 你必须完成这些团队任务才能解锁后续的日常任务. 请按照指南指示, 完成所有团队任务
	>>如果你无法完成这些任务, 请稍后再回来继续
step
    .goto IcecrownGlacier,87.8,78.1
    .fp The Argent Vanguard >>获取银色前线基地的飞行点
step
    .goto IcecrownGlacier,87.5,75.8
	>>飞往银色先锋军. 与提里奥交谈
    .accept 13036 >>接任务: |cRXP_LOOT_无上的荣耀|r
step
    .goto IcecrownGlacier,87.1,75.8
	>>与你下方的恩塔里交谈
    .turnin 13036 >>交任务: |cRXP_FRIENDLY_无上的荣耀|r
    .accept 13008 >>接任务: |cRXP_LOOT_天灾的战术|r
step
    .goto IcecrownGlacier,86.8,76.6
	>>与古斯塔夫对话
    .accept 13040 >>接任务: |cRXP_LOOT_致命的剧毒|r
step
    .goto IcecrownGlacier,86.1,75.8
	>>与达尔弗斯交谈
    .accept 13039 >>接任务: |cRXP_LOOT_保卫前线基地|r
step
	#sticky
	#label webbedfreed
    .goto IcecrownGlacier,83.5,75.1,0,0
	>>击杀该区域的被网住的北伐军士兵以解救他们, 他们还会为你提供增益和治疗 << !Paladin
	>>杀死该区域的被网住的北伐军士兵, 以解救他们. 确保你自身所带的增益效果不是“王者祝福”, 因为NPC会为你施加此效果(并治疗你) << Paladin
    .complete 13008,1 --Webbed Crusader Freed (8)
step
    .goto IcecrownGlacier,84.7,78.8,80,0
    .goto IcecrownGlacier,83.5,75.1,80,0
    .goto IcecrownGlacier,83.1,72.6,80,0
    .goto IcecrownGlacier,84.8,73.0,80,0
    .goto IcecrownGlacier,83.5,75.1
	>>击杀该区域的蛛魔和蜘蛛, 搜刮它们的毒囊
    .complete 13039,1 --Forgotten Depths Nerubians (15)
    .complete 13040,1 --Forgotten Depths Venom Sac (10)
step
	#requires webbedfreed
    .goto IcecrownGlacier,86.1,75.8
	>>返回达夫罗斯
    .turnin 13039 >>交任务: |cRXP_FRIENDLY_保卫前线基地|r
step
    .goto IcecrownGlacier,86.8,76.6
	>>返回古斯塔夫处
    .turnin 13040 >>交任务: |cRXP_FRIENDLY_致命的剧毒|r
step
    .goto IcecrownGlacier,87.1,75.8
	>>返回恩塔里
    .turnin 13008 >>交任务: |cRXP_FRIENDLY_天灾的战术|r
    .accept 13044 >>接任务: |cRXP_LOOT_如果还有幸存者……|r
step
    .goto IcecrownGlacier,87.0,79.0
	>>与本诺比奥斯交谈
    .turnin 13044 >>交任务: |cRXP_FRIENDLY_如果还有幸存者……|r
    .accept 13045 >>接任务: |cRXP_LOOT_空中救兵|r
step
	#completewith next
    .goto IcecrownGlacier,87.1,79.2
	.vehicle 30228 >>右键点击银色天爪龙以骑乘
step
	>>飞往瘟疫之地(Scourgeholme). 使用“营救被俘十字军”(1)解救十字军(每次只能救一名), 然后飞回银色前线基地的古斯塔夫处, 使用“放下被俘十字军”(2)交付他们. 记得在冷却结束后使用“翱翔”(3)以提升飞行速度
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
	>>与小屋内的费齐克交谈
    .turnin 13070 >>交任务: |cRXP_FRIENDLY_冷锋逼近|r
    .accept 13086 >>接任务: |cRXP_LOOT_最后一道防线|r
step
	#completewith next
    .goto IcecrownGlacier,85.3,75.8
	.vehicle >>飞到城墙顶部的其中一个炮塔并进入其中
step
    .goto IcecrownGlacier,84.8,75.8
	--vehicle id 30236
	>>使用“银色大炮”(1)在小范围击杀怪物并恢复法力；使用“清算炸弹”(2)在大范围内击杀怪物, 但会消耗法力
    .complete 13086,1 --Scourge Attackers (100)
    .complete 13086,2 --Frostbrood Destroyer (3)
step
    .goto IcecrownGlacier,85.6,76.0
	>>离开大炮. 返回费兹克那里
    .turnin 13086 >>交任务: |cRXP_FRIENDLY_最后一道防线|r
step
    .goto IcecrownGlacier,86.0,75.8
	>>和你身后的提里奥交谈
    .accept 13104 >>接任务: |cRXP_LOOT_再次前往突破口吧，英雄|r << !DK
    .accept 13105 >>接任务: |cRXP_LOOT_再次前往突破口吧，英雄|r << DK
step
	>>向西北方向前进. 依次与黑锋观察者和西拉斯和斯皮茨帕特里克和屋内的古斯塔夫交谈
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
	>>击杀瘟疫之地的天灾军团. 搜刮他们的天灾石
    .complete 13122,1 --Scourgestone (15)
step
	#completewith Kings
	.use 43153 >>击杀瘟疫之地中的复活的北伐军战士. 使用背包中的圣水洒在他们尸体上, 以释放灵魂
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
	>>击杀天灾城中的被遗忘者地下之王
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
	>>击杀主要位于该地区金字形神塔内的被遗忘者大祭司
    .complete 13118,1 --Forgotten Depths High Priest (3)
step
	#label Kings
    .goto IcecrownGlacier,79.5,68.6,80,0
    .goto IcecrownGlacier,80.8,64.5,80,0
    .goto IcecrownGlacier,77.7,63.2,80,0
    .goto IcecrownGlacier,78.4,65.7
	>>击杀该区域的被遗忘者国王
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
	.use 43153 >>击杀瘟疫之地中的复活的北伐军战士. 使用背包中的圣水洒在他们尸体上, 以释放灵魂
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
	>>击杀瘟疫之地的天灾军团. 搜刮他们的天灾石
    .complete 13122,1 --Scourgestone (15)
step
	#completewith next
    .goto CrystalsongForest,61.1,52.4,0
    .goto CrystalsongForest,58.9,62.8,0
    .goto CrystalsongForest,81.1,72.4,0
    .goto CrystalsongForest,89.2,55.7,0
    .goto CrystalsongForest,61.1,52.4,0
	>>击杀该区域的人形/亡灵/元素生物. 搜刮它们身上的能量
    .complete 13135,1 --Crystallized Energy (8)
step
	>>搜刮该区域地面上的紫色树桩
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
	>>在被摧毁的精灵建筑周围搜寻蓝色小块大理石
step
    .goto CrystalsongForest,61.1,52.4,80,0
    .goto CrystalsongForest,58.9,62.8,80,0
    .goto CrystalsongForest,81.1,72.4,80,0
    .goto CrystalsongForest,89.2,55.7,80,0
    .goto CrystalsongForest,61.1,52.4
	>>击杀该区域的人形/亡灵/元素生物. 搜刮它们身上的能量
    .complete 13135,1 --Crystallized Energy (8)
step
	>>返回黑锋观察者
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
	.use 43206 >>进入建筑内, 使用阿彻鲁斯战争号角召唤一名NPC协助你击杀萨拉纳克斯
    .complete 13125,1 --Salranax the Flesh Render (1)
step
    .goto IcecrownGlacier,80.1,61.2
	.use 43206 >>进入建筑内, 使用阿彻鲁斯战争号角召唤一名NPC协助你击杀亚萨蒙
    .complete 13125,3 --High Priest Yath'amon (1)
step
    .goto IcecrownGlacier,76.5,53.2
	.use 43206 >>使用[阿彻鲁斯战争号角]召唤一名NPC协助你击杀塔洛诺克斯
    .complete 13125,2 --Underking Talonox (1)
step
    .goto IcecrownGlacier,83.0,72.9
	>>返回黑锋观察者
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
	.use 43243 >>在骷髅堆旁使用背包中的北伐军的神圣军旗, 抵御来袭的敌人士兵. 当死亡使者哈洛夫出现时, 集中火力击杀他
    .complete 13141,1 --Battle for Crusaders' Pinnacle (1)
step
    .goto IcecrownGlacier,82.9,72.8
	>>进入小屋
    .turnin 13141 >>交任务: |cRXP_FRIENDLY_北伐军之峰的战斗|r
    .accept 13157 >>接任务: |cRXP_LOOT_北伐军之峰|r
step
    .goto IcecrownGlacier,79.8,71.8
	>>回到你之前守护旗帜的地方, 去找提里奥交谈
    .turnin 13157 >>交任务: |cRXP_FRIENDLY_北伐军之峰|r
    .accept 13068 >>接任务: |cRXP_LOOT_勇气的传说|r
step
    .goto IcecrownGlacier,79.4,72.3
    .fp Crusaders' Pinnacle >>获取北伐军之峰的飞行路径
step << Horde
    .goto IcecrownGlacier,79.5,72.7
	>>进入塔楼, 与底层床上的史东布鲁交谈
    .accept 13224 >>接任务: |cRXP_LOOT_奥格瑞姆之锤|r
step << Alliance
    .goto Icecrown,79.44,72.84
	>>进入塔楼, 与底层床上的伊瓦利乌斯交谈
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
	>>飞到“破天号”, 这艘巨大的联盟飞船正在高空飞行. 进入玛拉德身后的大房间, 与贾斯廷交谈
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
	>>找到虔诚者阿布萨兰. 他会在船尾区域来回走动, 沿着左右两侧的楼梯上下移动
    .daily 13300 >>接任务: |cRXP_LOOT_萨隆邪铁的奴隶|r
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>前往船尾的楼梯, 与骑士队长德洛斯彻交谈
    .daily 13336 >>接任务: |cRXP_LOOT_伊米亚之血|r
    .accept 13341 >>接任务: |cRXP_LOOT_协助突袭|r
step << Alliance
	#requires slaves1
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>沿着船中部的楼梯(位于玛拉德身后)前行, 然后找到第一段楼梯两侧的楼梯, 下到引擎室. 与首席技师波尔维克交谈
    .accept 13296 >>接任务: |cRXP_LOOT_前往伊米海姆！|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤, 那艘在高空中盘旋的巨大部落战舰. 进入船头的大房间, 与掠天者考尔姆·黑痕交谈
    .turnin 13224 >>交任务: |cRXP_FRIENDLY_奥格瑞姆之锤|r
    .accept 13228 >>接任务: |cRXP_LOOT_破碎前线|r
step << Horde
	>>接受战争使者达沃斯·里赫与凯尔坦兄弟的任务. 他们会在楼梯附近和下层甲板区域游荡
    .daily 13302 >>接任务: |cRXP_LOOT_萨隆邪铁的奴隶|r
    .daily 13330 >>接任务: |cRXP_LOOT_伊米亚之血|r
    .accept 13340 >>接任务: |cRXP_LOOT_协助突袭|r
step << Horde
	>>前往船体下层甲板, 与首席技师考伯克拉交谈
    .accept 13293 >>接任务: |cRXP_LOOT_前往伊米海姆！|r
step << Alliance
    .goto IcecrownGlacier,62.6,51.3
	>>飞往地面指挥官库普(在地面上)
    .turnin 13341 >>交任务: |cRXP_FRIENDLY_协助突袭|r
    .daily 13309 >>接任务: |cRXP_LOOT_空中突袭|r
	>>你可以选择跳过日常任务
step << Alliance
    #completewith next
    .goto Icecrown,62.55,50.67
    .vehicle 32227 >>右键点击飞行器顶部的炮塔以开始任务
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
	>>与小队队长交谈. 如果其他玩家已开始此任务, 他可能不在原地, 因为该任务有大约6分钟的刷新时间, 刷新位置位于库普右侧约10码处
	>>你可以跳过这个任务, 它只是一个日常任务, 但与其他日常任务衔接得很好
    .daily 13284 >>接任务: |cRXP_LOOT_地面突袭|r
step << Alliance
    .goto IcecrownGlacier,58.2,55.9,0
    .goto IcecrownGlacier,59.6,59.3,0
    .goto IcecrownGlacier,57.8,62.6,0
	#completewith Mineslave
	>>在伊米海姆各地击杀维库人
	.complete 13336,1 --Ymirheim Vrykul Slain (20)
step << Alliance
    .goto Icecrown,59.89,53.50
	>>护送部队. 必要时让部分部队承担怪物仇恨
    .complete 13284,1 --4/4 Alliance troops escorted to Ymirheim
	.isOnQuest 13284
step << Alliance
	#label Mineslave
    .goto IcecrownGlacier,55.7,57.3,40,0
    .goto IcecrownGlacier,56.2,58.9,40,0
    .goto IcecrownGlacier,55.6,59.7,40,0
    .goto IcecrownGlacier,54.5,60.0,40,0
    .goto IcecrownGlacier,55.7,57.3
	>>进入萨隆邪铁矿井, 与奴隶交谈以解救他们(有时他们可能会攻击你)
    .complete 13300,1 --Saronite Mine Slave rescued (10)
	.skipgossip
	.isOnQuest 13300
step << Alliance
    .goto IcecrownGlacier,58.2,55.9,70,0
    .goto IcecrownGlacier,59.6,59.3,70,0
    .goto IcecrownGlacier,57.8,62.6
	>>在伊米海姆各地击杀维库人
	.complete 13336,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13336
step << Alliance
	#completewith next
    .goto Icecrown,57.01,62.53
	>>飞到地面的弗拉兹尔处
    .turnin 13296 >>交任务: |cRXP_FRIENDLY_前往伊米海姆！|r
step << Alliance
    .goto Icecrown,57.01,62.53
	>>注意:此任务将使你处于PVP状态. 不过, 完成起来非常简单
    .daily 13280 >>接任务: |cRXP_LOOT_占山为王|r
step << Alliance
    #completewith next
    .goto Icecrown,56.99,62.60
    .vehicle 31784 >>右键点击那个看起来像侏儒的机器人
	.isOnQuest 13280
step << Alliance
    .goto Icecrown,54.89,60.12
	>>使用“跳跃喷气机”(3)快速攀爬悬崖(无冷却时间). 到达山顶后, 使用“插置联盟战斗旗帜”(1)放置旗帜. 然后离开载具
    .complete 13280,1 --1/1 Alliance Battle Standard planted
	.isOnQuest 13280
step << Alliance
    .goto Icecrown,56.97,62.55
	>>点击“离开车辆”按钮
    .turnin 13280 >>交任务: |cRXP_FRIENDLY_占山为王|r
	.isQuestComplete 13280
step << Horde
	>>飞到地面指挥官科特亚那里(他在地面上, 不在船上)
    .goto IcecrownGlacier,58.3,46.0
    .turnin 13340 >>交任务: |cRXP_FRIENDLY_协助突袭|r
step << Horde
    .goto IcecrownGlacier,58.3,46.0
    .daily 13310 >>接任务: |cRXP_LOOT_空中突袭|r
	>>你可以选择跳过日常任务
step << Horde
	#completewith next
	.vehicle >>跑到科爾克隆压制炮塔那里并点击它
    .goto IcecrownGlacier,59.5,45.94
	.isOnQuest 13310
step << Horde
	>>飞行时射击建筑物上的所有鱼叉枪, 这样会迫使渗透者掉落
    .goto IcecrownGlacier,56.8,64.3
    .complete 13310,1 --Kor'kron Infiltrators dropped (4)
	.isOnQuest 13310
step << Horde
    .goto IcecrownGlacier,58.3,46.0
    .turnin 13310 >>交任务: |cRXP_FRIENDLY_空中突袭|r
	.isQuestComplete 13310
step << Horde
    .goto IcecrownGlacier,58.3,46.0
	>>与小队队长交谈. 如果其他玩家已开始该任务, 他可能不在原地, 且有大约6分钟的重生时间
    .daily 13301 >>接任务: |cRXP_LOOT_地面突袭|r
	>>你可以跳过这个任务, 它只是一个日常任务, 但与其他日常任务衔接得很好
step << Horde
	#sticky
	#label ymirheimslain
    .goto IcecrownGlacier,58.2,55.9,0
    .goto IcecrownGlacier,59.6,59.3,0
    .goto IcecrownGlacier,57.8,62.6,0
	#completewith Mineslave
	>>在伊米海姆各地击杀维库人
	.complete 13330,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13330
step << Horde
	>>护送部队
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
	>>进入萨隆邪铁矿井, 与奴隶交谈以解救他们(有时他们可能会攻击你)
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
    .vehicle >>右键点击那个看起来像侏儒的机器人
	.isOnQuest 13283
step << Horde
    .goto Icecrown,54.89,60.12
	>>使用“跳跃喷气机”(3)快速攀爬悬崖(无冷却时间). 到达山顶后, 使用“竖立部落战旗”(1)插上旗帜. 然后离开载具
    .complete 13283,1 --1/1 Horde Battle Standard planted
	.isOnQuest 13283
step << Horde
    .goto Icecrown,51.9,57.6
	>>点击“离开车辆”按钮
    .turnin 13283 >>交任务: |cRXP_FRIENDLY_占山为王|r
	.isQuestComplete 13283
step << Alliance
    .goto IcecrownGlacier,66.4,66.5
	>>找到并和一名在破碎前线附近垂死的士兵交谈
    .complete 13231,1 --Dying Soldier Questioned (1)
    .accept 13232 >>接任务: |cRXP_LOOT_让我解脱吧！|r
	.skipgossip
step << Alliance
    .goto IcecrownGlacier,69.1,62.1
	>>在附近找到更多濒死的士兵并将其击杀
	.complete 13232,1
	.skipgossip
step << Horde
    .goto IcecrownGlacier,67.7,68.4
	>>在破碎前线附近找到一名濒死的狂战士并与他交谈
    .complete 13228,1 --Dying Berserker Questioned (1)
    .accept 13230 >>接任务: |cRXP_LOOT_为我复仇！|r
step << Horde
    .goto IcecrownGlacier,68.7,64.2
	>>在附近找到更多濒死的士兵并将其击杀
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
	>>飞到“破天号”, 这是一艘在高空飞行的大型联盟飞船(你可以在地图上看到它). 进入玛拉德身后的大房间, 和贾斯廷交谈
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
	>>找到虔诚者阿布萨兰. 他会在船尾区域来回走动, 沿着左右两侧的楼梯上下移动
    .turnin 13300 >>交任务: |cRXP_FRIENDLY_萨隆邪铁的奴隶|r
	.isQuestComplete 13300
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>前往船尾的楼梯, 与骑士队长德洛斯彻交谈
    .turnin 13336 >>交任务: |cRXP_FRIENDLY_伊米亚之血|r
	.isQuestComplete 13336
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>前往船的左后角, 与萨萨里安交谈
    .turnin 13286 >>交任务: |cRXP_FRIENDLY_……所有可能的帮助|r
    .accept 13287 >>接任务: |cRXP_LOOT_知己知彼|r
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>沿着船中部的楼梯(位于玛拉德身后)前行, 然后找到第一段楼梯两侧的楼梯, 下到引擎室. 与首席技师波尔维克交谈
    .turnin 13290 >>交任务: |cRXP_FRIENDLY_请留意一下……|r
    .accept 13291 >>接任务: |cRXP_LOOT_“借来”的技术|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞往奥格瑞姆之锤, 那艘在高空飞行的大型部落战舰. 前往前舱与掠天者考尔姆·黑痕交谈
    .turnin 13228 >>交任务: |cRXP_FRIENDLY_破碎前线|r
    .turnin 13230 >>交任务: |cRXP_FRIENDLY_为我复仇！|r
    .accept 13238 >>接任务: |cRXP_LOOT_有价值的帮手？|r
    .accept 13260 >>接任务: |cRXP_LOOT_知根知底|r
step << Horde
	>>与你身旁的科尔提拉交谈
    .turnin 13260 >>交任务: |cRXP_FRIENDLY_知根知底|r
    .accept 13237 >>接任务: |cRXP_LOOT_知己知彼|r
step << Horde
	>>与在楼梯附近游荡的凯尔坦修士交谈
    .turnin 13302 >>交任务: |cRXP_FRIENDLY_萨隆邪铁的奴隶|r
	.isQuestComplete 13302
step
	>>与战争使者戴佛斯·里奥特交谈. 他也会在底层甲板巡逻
    .turnin 13330 >>交任务: |cRXP_FRIENDLY_伊米亚之血|r
	.isQuestComplete 13330
step << Horde
	>>前往船体下层甲板, 与首席技师考伯克拉交谈
    .turnin 13238 >>交任务: |cRXP_FRIENDLY_有价值的帮手？|r
    .accept 13239 >>接任务: |cRXP_LOOT_爆炸油|r
step << Alliance
	>>返回地面指挥官库普
    .goto Icecrown,62.60,51.35
    .turnin 13284 >>交任务: |cRXP_FRIENDLY_地面突袭|r
	.isQuestComplete 13284
step << Horde
	>>返回地面指挥官科特亚
    .goto IcecrownGlacier,58.3,46.2
    .turnin 13301 >>交任务: |cRXP_FRIENDLY_地面突袭|r
	.isQuestComplete 13301
step << Alliance
	#completewith next
    .goto IcecrownGlacier,67.2,68.3,70,0
    .goto IcecrownGlacier,68.0,70.9,70,0
    .goto IcecrownGlacier,71.6,61.3,70,0
    .goto IcecrownGlacier,67.2,68.3
	.use 44048 >>在破碎前线周围地面上搜刮散落的废弃装备. 当你集齐每件装备后, 使用背包中的“偷来的液体”(无需等待角色扮演)
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
	.use 43608 >>在破碎前线周围地面上搜刮散落的废弃装备部件. 当你收集齐每件装备各一件后, 即可使用背包中的铜爪挥发油(无需等待剧情提示)
	.collect 43609,3,13239,1,-1 --Pile of Bones (3)
	.collect 43610,3,13239,1,-1 --Abandoned Helm (3)
	.collect 43616,3,13239,1,-1 --Abandoned Armor (3)
    .complete 13239,1 --Field Tests Conducted (3)
step << Alliance
    .goto IcecrownGlacier,67.0,63.3,70,0
    .goto IcecrownGlacier,67.4,70.2,70,0
    .goto IcecrownGlacier,71.6,61.3
	>>杀死该区域的憎恶和法师和亡灵巫师
    .complete 13287,1 --Hulking Abominations Slain (5)
    .complete 13287,3 --Shadow Adepts Slain (5)
    .complete 13287,2 --Malefic Necromancers Slain (5)
step << Horde
    .goto IcecrownGlacier,67.0,63.3,70,0
    .goto IcecrownGlacier,67.4,70.2,70,0
    .goto IcecrownGlacier,71.6,61.3
	>>杀死该区域的憎恶和法师和亡灵巫师
    .complete 13237,1 --Hulking Abominations Slain (5)
    .complete 13237,3 --Shadow Adepts Slain (5)
    .complete 13237,2 --Malefic Necromancers Slain (5)
step << Alliance
    .goto IcecrownGlacier,67.2,68.3,70,0
    .goto IcecrownGlacier,68.0,70.9,70,0
    .goto IcecrownGlacier,71.6,61.3,70,0
    .goto IcecrownGlacier,67.2,68.3
	.use 44048 >>在破碎前线周围地面上搜刮散落的废弃装备. 当你集齐每件装备后, 使用背包中的“偷来的液体”(无需等待角色扮演)
	.collect 43609,3,13291,1,-1 --Pile of Bones (3)
	.collect 43610,3,13291,1,-1 --Abandoned Helm (3)
	.collect 43616,3,13291,1,-1 --Abandoned Armor (3)
    .complete 13291,1 --Field Tests Conducted (3)
step << Horde
    .goto IcecrownGlacier,67.2,68.3,70,0
    .goto IcecrownGlacier,68.0,70.9,70,0
    .goto IcecrownGlacier,71.6,61.3,70,0
    .goto IcecrownGlacier,67.2,68.3
	.use 43608 >>在破碎前线周围地面上搜刮散落的废弃装备部件. 当你收集齐每件装备各一件后, 即可使用背包中的铜爪挥发油(无需等待剧情提示)
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
	>>飞往“破天号”, 这是一艘在高空飞行的大型联盟飞船. 与飞船左后方角落的萨萨里安交谈
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
	>>沿着船中部的楼梯(位于玛拉德身后)前行, 然后找到第一段楼梯两侧的楼梯, 下到引擎室. 与首席技师波尔维克交谈
    .turnin 13291 >>交任务: |cRXP_FRIENDLY_“借来”的技术|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤号, 这是一艘在高空中飞行的大型部落飞船. 前往船体前舱, 与科尔提拉交谈
    .turnin 13237 >>交任务: |cRXP_FRIENDLY_知己知彼|r
    .accept 13264 >>接任务: |cRXP_LOOT_你的憎恶伙伴|r
	.accept 13277 >>接任务: |cRXP_LOOT_对抗巨人|r
step << Horde
	>>前往船体下层甲板, 与首席技师考伯克拉交谈
    .turnin 13239 >>交任务: |cRXP_FRIENDLY_爆炸油|r
step
    .goto IcecrownGlacier,68.3,61.5
	>>击杀该区域的笨重的憎恶, 从它们身上获取憎恶零件
	.use 43968 >>使用憎恶复活包与背包中的内脏召唤一只可控制的憎恶. 让憎恶攻击并吸引尽可能多的小怪仇恨, 然后使用“爆裂之缝”击杀所有靠近憎恶且处于战斗状态的小怪(这些小怪必须在战斗中才能获得任务奖励)
	>>如果你的“肠子”用完了, 就去杀更多的巨型憎恶. 你一次只能携带一个“肠子”
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
	>>返回奥格瑞姆之锤, 与科尔提拉对话
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
	>>返回天裂者号. 与萨萨里安交谈
    .turnin 13288 >>交任务: |cRXP_FRIENDLY_你的憎恶伙伴|r
    .accept 13315 >>接任务: |cRXP_LOOT_预览|r
step << Alliance
	>>在大墙上方平台的航点上空飞行
    .complete 13315,1 --1/1 Aldur'thar South Visited
    .goto Icecrown,55.64,46.73
    .complete 13315,2 --1/1 Aldur'thar Central Visited
    .goto Icecrown,54.10,43.43
    .complete 13315,3 --1/1 Aldur'thar North Visited
    .goto Icecrown,54.09,35.33
    .complete 13315,4 --1/1 Aldur'thar Northwest Visited
    .goto Icecrown,52.06,34.21
step << Horde
	>>在大墙上方平台的航点上空飞行
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
	>>击杀该区域的血肉巨人, 收集它们的脊椎. 此任务非常困难, 如有需要请组队完成
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
	>>击杀该区域的血肉巨人, 收集它们的脊椎. 此任务非常困难, 如有需要请组队完成
    .complete 13277,1 --Pustulant Spine (5)
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤号, 这是一艘在高空中飞行的大型部落飞船. 前往船体前舱, 与科尔提拉交谈
    .turnin 13351 >>交任务: |cRXP_FRIENDLY_预览|r
	.turnin 13277 >>交任务: |cRXP_FRIENDLY_对抗巨人|r
    .accept 13355 >>接任务: |cRXP_LOOT_无法复制|r
    .accept 13354 >>接任务: |cRXP_LOOT_指挥体系|r
    .accept 13352 >>接任务: |cRXP_LOOT_从天而“降”|r
	.accept 13279 >>接任务: |cRXP_LOOT_化学常识|r
    .accept 13278 >>接任务: |cRXP_LOOT_污染者科普洛斯|r
step << Horde
	>>前往船体下层甲板, 与首席技师考伯克拉交谈
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
	>>飞往“破天号”, 这是一艘在高空飞行的大型联盟飞船. 与飞船左后方角落的萨萨里安交谈
    .turnin 13315 >>交任务: |cRXP_FRIENDLY_预览|r
    .turnin 13294 >>交任务: |cRXP_FRIENDLY_对抗巨人|r
    .accept 13318 >>接任务: |cRXP_LOOT_从天而“降”|r
    .accept 13319 >>接任务: |cRXP_LOOT_指挥体系|r
    .accept 13320 >>接任务: |cRXP_LOOT_无法复制|r
    .accept 13295 >>接任务: |cRXP_LOOT_化学常识|r
    .accept 13298 >>接任务: |cRXP_LOOT_污染者科普洛斯|r
step << Alliance
	>>沿着船中部的楼梯(位于玛拉德身后)前行, 然后找到第一段楼梯两侧的楼梯, 下到引擎室. 与首席技师波尔维克交谈
    .accept 13383 >>接任务: |cRXP_LOOT_“借来”的技术|r
step
	#completewith next
    .goto IcecrownGlacier,63.3,62.1,25 >>进入莫德雷萨尔内部的大门. 它位于第二层, 由天灾魔守卫
	.isOnQuest 13295 << Alliance
	.isOnQuest 13279 << Horde
step
    .goto IcecrownGlacier,62.3,63.4
	.use 44010 >>将背包中的脊骨脓液用在冒泡的绿色坩埚上. 击杀由此产生的怪物, 并在提示“尽快添加液体”时再次使用脊骨脓液. 此任务非常困难, 必要时请组队完成
    .complete 13295,1 << Alliance --Batch of Plague Neutralized (1)
    .complete 13279,1 << Horde --Batch of Plague Neutralized (1)
step
    .goto IcecrownGlacier,60.8,62.2
	>>击杀莫德雷萨内的污染者科普鲁斯. 这个任务非常困难, 如有需要, 请组队完成
    .complete 13298,1 << Alliance --Coprous the Defiler Slain (1)
    .complete 13278,1 << Horde --Coprous the Defiler Slain (1)
step
	#sticky
	#label darksub
	>>前往墙顶平台, 击杀该区域内的苦痛新兵, 搜刮他们的幻象之球
	.use 44246 >>当你脱离战斗时, 对区域内的黑暗压制者使用幻象宝珠
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
	>>击杀大帐篷中的工头法埃迪斯
    .complete 13354,1 << Horde --Overseer Faedris Killed (1)
	.complete 13319,1 << Alliance --Overseer Faedris Killed (1)
step
	#requires darksub
	.use 44251 >>在阿尔杜萨尔外面的炼金锅上使用[分离的药瓶]
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
	>>击杀大帐篷下的工头沙维尔和贾克恩. 然后飞升一层前往维尔亚(位于大帐篷下), 并击杀他
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
	>>飞到空中的小平台上, 与吉普利·基罗赫斯交谈
	.goto IcecrownGlacier,53.96,42.93
	.turnin 13383 >>交任务: |cRXP_FRIENDLY_吉普利·基罗赫斯|r
	.accept 13380 >>接任务: |cRXP_LOOT_委以重任|r
step << Alliance
	.goto IcecrownGlacier,53.96,43.11
	>>与凯伦交谈以登上轰炸机. 使用冲锋护盾(1)获得100点护盾, 然后切换到轰炸舱(5), 开始轰炸下方的天灾部队, 直到所有步兵和队长被消灭. 切换到防空炮台(4), 开始使用防空火箭(1)攻击空中的石像鬼. 完成后, 按下离开载具按钮, 你将返回平台
	.complete 13380,1 -- Bombardment Infantry slain (40)
	.complete 13380,2 -- Bombardment Captain slain (8)
	.complete 13380,3 -- Gargoyle Ambusher slain (15)
	.skipgossip
step << Alliance
	>>与吉普利·基罗赫斯交谈
    .goto IcecrownGlacier,53.96,42.93
    .turnin 13380 >>交任务: |cRXP_FRIENDLY_委以重任|r
step << Horde
	>>飞到空中的小平台, 然后与特兹拉交谈
    .goto IcecrownGlacier,53.99,36.87
    .turnin 13379 >>交任务: |cRXP_FRIENDLY_绿色科技|r
    .accept 13373 >>接任务: |cRXP_LOOT_边缘科学的益处|r
step << Horde
	.goto IcecrownGlacier,54.00,36.70
	>>与Rizzy交谈以登上轰炸机. 使用冲锋护盾(1)获得100点护盾, 然后切换到轰炸舱(5), 开始轰炸下方的天灾部队, 直到所有步兵和指挥官被消灭. 随后切换到防空炮台(4), 使用防空火箭(1)击落空中的石像鬼. 完成后按下离开载具按钮, 你将返回平台
	.complete 13373,1 -- Bombardment Infantry slain (40)
	.complete 13373,2 -- Bombardment Captain slain (8)
	.complete 13373,3 -- Gargoyle Ambusher slain (15)
	.skipgossip
step << Horde
	>>与特兹拉交谈
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
	>>飞往“破天号”, 这是一艘在高空飞行的大型联盟飞船. 与飞船左后方角落的萨萨里安交谈
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
	>>沿着船中部的楼梯(位于玛拉德身后)前行, 然后找到第一段楼梯两侧的楼梯, 下到引擎室. 与首席技师波尔维克交谈
    .turnin 13320 >>交任务: |cRXP_FRIENDLY_无法复制|r
    .accept 13321 >>接任务: |cRXP_LOOT_重新考验|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤, 这艘在高空飞行的大型部落战舰. 进入船首的大房间, 与科利特拉交谈
	.turnin 13352 >>交任务: |cRXP_FRIENDLY_从天而“降”|r
    .turnin 13354 >>交任务: |cRXP_FRIENDLY_指挥体系|r
    .turnin 13279 >>交任务: |cRXP_FRIENDLY_化学常识|r
    .turnin 13278 >>交任务: |cRXP_FRIENDLY_污染者科普洛斯|r
    .accept 13358 >>接任务: |cRXP_LOOT_活动窃听器|r
    .accept 13366 >>接任务: |cRXP_LOOT_需要更多情报|r
step << Horde
	>>前往船体下层甲板, 与首席技师考伯克拉交谈
    .turnin 13355 >>交任务: |cRXP_FRIENDLY_无法复制|r
    .accept 13356 >>接任务: |cRXP_LOOT_重新考验|r
step
	#label taintedessence
	#sticky
    .goto IcecrownGlacier,49.7,34.4,0,0
	.use 44307 >>使用背包中的稀释过的诅咒教徒滋补剂, 获得“黑暗洞察”增益效果. 该效果使你在该区域击杀所有类人生物时, 可直接获取被污染的精华
	.collect 44301,10,13356,1 << Horde
	.collect 44301,10,13321,1 << Alliance
step
    .goto IcecrownGlacier,54.1,31.4,70,0
    .goto IcecrownGlacier,54.7,28.0,70,0
    .goto IcecrownGlacier,57.0,28.8,70,0
    .goto IcecrownGlacier,54.1,31.4
	.use 44433 >>击杀5名被奴役的爪牙(虚空行者). 使用虹吸魔杖在它们尸体上获取暗物质
	.collect 44434,5,13342,1 << Alliance --Dark Matter (5)
	.collect 44434,5,13358,1 << Horde --Dark Matter (5)
step
    .goto IcecrownGlacier,53.8,33.6
	>>点击召唤石
	.complete 13342,1 << Alliance  --Dark Messenger Summoned (1)
    .complete 13358,1 << Horde --Dark Messenger Summoned (1)
step
	#completewith next
    .goto IcecrownGlacier,51.9,32.5,30 >>进入阿尔杜尔塔尔内部
	.isOnQuest 13366 << Horde
	.isOnQuest 13345 << Alliance
step
    .goto IcecrownGlacier,53.1,31.1,60,0
    .goto IcecrownGlacier,53.1,29.2,60,0
    .goto IcecrownGlacier,50.9,29.0,60,0
    .goto IcecrownGlacier,50.9,30.4,60,0
    .goto IcecrownGlacier,53.1,31.1
	>>击杀该区域的邪教研究员. 搜刮他们的研究页
	.collect 44459,1 --Cult of the Damned Research - Page 1 (1)
	.collect 44460,1 --Cult of the Damned Research - Page 2 (1)
	.collect 44461,1 --Cult of the Damned Research - Page 3 (1)
	.isOnQuest 13366 << Horde
	.isOnQuest 13345 << Alliance
step
	#sticky
	#label Thesis
    .goto IcecrownGlacier,49.7,34.4
	.use 44459 >>点击背包中的任意一张研究页, 将其合并为论文
    .complete 13366,1 << Horde --Cult of the Damned Thesis (1)
	.complete 13345,1 << Alliance --Cult of the Damned Thesis (1)
step
	#requires taintedessence
    .goto IcecrownGlacier,49.7,34.4
	.use 44301
	.use 44304 >>右键点击背包中的被污染的精华, 将其转化为蠕动之物. 然后将其投入坩埚中
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
	>>飞往“破天号”, 这是一艘在高空飞行的大型联盟飞船. 与飞船左后方角落的萨萨里安交谈
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
	>>沿着船中部的楼梯(位于玛拉德身后)前行, 然后找到第一段楼梯两侧的楼梯, 下到引擎室. 与首席技师波尔维克交谈
    .turnin 13321 >>交任务: |cRXP_FRIENDLY_重新考验|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤, 这艘在高空飞行的大型部落战舰. 进入船首的大房间, 与科利特拉交谈
    .turnin 13358 >>交任务: |cRXP_FRIENDLY_活动窃听器|r
	.turnin 13366 >>交任务: |cRXP_FRIENDLY_需要更多情报|r
    .accept 13367 >>接任务: |cRXP_LOOT_片刻不得安宁|r
    .accept 13306 >>接任务: |cRXP_LOOT_构建路障|r
step << Horde
	>>前往船体下层甲板, 与首席技师考伯克拉交谈
    .turnin 13356 >>交任务: |cRXP_FRIENDLY_重新考验|r
step
    .goto IcecrownGlacier,52.5,42.0,70,0
    .goto IcecrownGlacier,51.3,37.1,70,0
    .goto IcecrownGlacier,47.1,37.4,70,0
    .goto IcecrownGlacier,50.0,44.9,70,0
    .goto IcecrownGlacier,52.5,42.0
	.use 44127 >>在陨落英雄之谷, 使用背包中的路障搭设工具对出现的紫色光点进行放置
    .complete 13332,1 << Alliance --Barricades constructed (8)
	.complete 13306,1 << Horde --Barricades constructed (8)
step
	>>这个任务非常困难, 必要时请组队完成
	>>打开阿尔杜尔萨尔内的宝箱, 拾取奥鲁麦斯的头骨和心脏和权杖和长袍
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
	>>这个任务非常困难, 必要时请组队完成
	.use 44476 >>点击背包中的任意物品, 将其合成为阿鲁麦斯的遗骸
	.collect 44480,1 --Alumeth's Remains (1)
	.isOnQuest 13346 << Alliance
	.isOnQuest 13367 << Horde
step
    .goto IcecrownGlacier,51.9,29.0
	>>这个任务非常困难, 必要时请组队完成
	.use 44480 >>在发光水晶前使用阿鲁迈斯的遗骸召唤他, 然后击杀他
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
	>>飞往“破天号”, 这是一艘在高空飞行的大型联盟飞船. 与飞船左后方角落的萨萨里安交谈
    .turnin 13346 >>交任务: |cRXP_FRIENDLY_片刻不得安宁|r
    .turnin 13332 >>交任务: |cRXP_FRIENDLY_构建路障|r
	.accept 13337 >>接任务: |cRXP_LOOT_铁墙壁垒|r
	.accept 13334 >>接任务: |cRXP_LOOT_溅血的旗帜|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤, 这艘在高空飞行的大型部落战舰. 进入船首的大房间, 与科利特拉交谈
    .turnin 13367 >>交任务: |cRXP_FRIENDLY_片刻不得安宁|r
    .turnin 13306 >>交任务: |cRXP_FRIENDLY_构建路障|r
	.accept 13312 >>接任务: |cRXP_LOOT_铁墙壁垒|r
	.accept 13307 >>接任务: |cRXP_LOOT_溅血的旗帜|r
step
    .goto IcecrownGlacier,51.3,40.3,70,0
    .goto IcecrownGlacier,49.1,43.8
	>>击杀该区域内的天灾转化者
    .complete 13334,3 << Alliance --Scourge Converter (5)
    .complete 13307,3 << Horde --Scourge Converter (5)
step
    .goto IcecrownGlacier,45.5,46.5
	>>这个任务非常困难, 必要时请组队完成
	.use 44186 >>飞到阳台, 然后在格里姆科尔的法球中使用背包里的扭曲符文. 击杀邪恶的格里姆科尔
    .complete 13337,1 << Alliance --Grimkor the Wicked (1)
    .complete 13312,1 << Horde --Grimkor the Wicked (1)
step
    .goto IcecrownGlacier,47.1,48.5,70,0
    .goto IcecrownGlacier,41.9,48.4,70,0
    .goto IcecrownGlacier,41.9,54.3,70,0
    .goto IcecrownGlacier,46.1,53.1
	>>击杀该区域内的天灾旗手和被转化的英雄
    .complete 13334,1 << Alliance --Scourge Banner-Bearer (5)
    .complete 13334,2 << Alliance --Converted Hero (20)
    .complete 13307,1 << Horde --Scourge Banner-Bearer (5)
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
	>>飞往“破天号”, 这是一艘在高空飞行的大型联盟飞船. 与飞船左后方角落的萨萨里安交谈
	.turnin 13334 >>交任务: |cRXP_FRIENDLY_溅血的旗帜|r
	.turnin 13337 >>交任务: |cRXP_FRIENDLY_铁墙壁垒|r
	>>进入破天号上玛尔拉德正面对的大房间, 与贾斯廷交谈
	.accept 13314 >>接任务: |cRXP_LOOT_获取情报|r
step << Alliance
    .goto IcecrownGlacier,46.2,52.1,70,0
    .goto IcecrownGlacier,42.4,59.4,0,0
	.use 44222 >>在背包中使用飞镖枪攻击奥格瑞姆之锤侦察兵(可在飞行坐骑上使用). 击杀后, 搜刮他们的尸体以获取密令
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
	>>进入破天号上玛尔拉德正面对的大房间, 与贾斯廷交谈
	.turnin 13314 >>交任务: |cRXP_FRIENDLY_获取情报|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>飞到奥格瑞姆之锤, 这艘在高空飞行的大型部落战舰. 进入船首的大房间, 与科利特拉交谈
	.turnin 13312 >>交任务: |cRXP_FRIENDLY_铁墙壁垒|r
	.turnin 13307 >>交任务: |cRXP_FRIENDLY_溅血的旗帜|r
step << Horde
	>>与你身旁的克罗姆·黑疤交谈
	.accept 13313 >>接任务: |cRXP_LOOT_遮挡天空|r
step << Horde
	.goto IcecrownGlacier,48.85,40.44
	.use 44212 >>在空中使用背包中的SGM-3对[破天号侦查机]进行攻击
	.complete 13313,1 --Skybreaker Recon Fighters shot down (6)
step << Horde
	>>飞到奥格瑞姆之锤, 那艘在高空中盘旋的巨大部落战舰. 进入船头的大房间, 与克罗姆·布莱克斯卡交谈
	.turnin 13313 >>交任务: |cRXP_FRIENDLY_遮挡天空|r
step
	+如果您跳过了或未完成本指南中的任何任务, 请重新开始指南并完成它们. 为此, 请点击齿轮图标, 导航回“冰冠炮舰解锁日常任务”指南
	>>如果你已全部完成, 即可开始使用冰冠炮艇日常任务路线. 请注意, 部分任务可能当天无法接取, 因为你可能已完成了某些日常任务
]])
