RXPGuides.RegisterGuide([[
#version 1
#group +RestedXP 诺森德日常任务
#subgroup 阵营日常任务
#wotlk
#cata
#name 冰冠冰川飞行艇日常任务路线
#displayname 冰冠冰川飞行艇日常任务路线 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step << Alliance -- Checking that the actual pre quests that have been completed, not dailies
	+要解锁所有冰冠炮艇日常任务, 您必须先完成前置任务链. 请使用冰冠炮艇日常任务解锁指南来解锁全部日常任务
	.isQuestAvailable 13314,13346,13342,13318,13321,13295,13288,13380,13291,13231,13296

--	 13314  Get the Message
--	 13346  No Rest For The Wicked
--	 13342  Not a Bug
--	 13318  Drag and Drop
--	 13321  Retest Now
--	 13295  Basic Chemistry
--	 13288  That's Abominable!
--	 13380  Leading the Charge
--	 13291  Borrowed Technology
--	 13231  The Broken Front
--	 13296  Get to Ymirheim!

step << Horde -- Checking that the actual quests that have been completed, not dailies
	+要解锁所有冰冠炮艇日常任务, 您必须先完成前置任务链. 请使用冰冠炮艇日常任务解锁指南来解锁全部日常任务
	.isQuestAvailable 13313,13228,13293,13239,13373,13279,13356,13352,13358,13367,13264

--	 13313  接任务: |cRXP_WARN_遮挡天空|r
--	 13228  The Broken Front
--	 13293  Get to Ymirheim!
--	 13239  Volatility
--	 13279  Basic Chemistry
--	 13356  Retest Now
--	 13352  Drag and Drop
--	 13358  Not a Bug
--	 13367  No Rest For The Wicked
--	 13264  That's Abominable!

--Alliance Skybreaker Quests (11)
--	Blood of the Chosen, 13336
--	Slaves to Saronite, 13300
--	No Mercy!, 13233
--	The Solution Solution, 13292
--	That's Abominable!, 13289
--	Neutralizing the Plague, 13297
--	Retest Now, 13322
--	Drag and Drop, 13323
--	Not a Bug, 13344
--	No Rest For The Wicked, 13350
--	Capture More Dispatches, 13333

--Alliance other misc quests nearby included with gunship quest chain (5)
--  King of the Mountain, 13280
--  Assault by Air, 13309
--  Assault by Ground, 13284
--  Static Shock Troops: the Bombardment, 13404
--  Putting the Hertz: The Valley of Lost Hope, 13382 -- not implimented by blizzard

--Horde Orgrim's Hammer Quests (11)
--	Blood of the Chosen, 13330
--	Slaves to Saronite, 13302
--	Make Them Pay!, 13234
--	Volatility, 13261
--	That's Abominable!, 13276
--	Neutralizing the Plague, 13281
--	Retest Now, 13357
--	Drag and Drop, 13353
--	Not a Bug, 13365
--	No Rest For The Wicked, 13368
--	Keeping the Alliance Blind, 13331

--Horde other misc quests nearby included with gunship quest chain (5)
--  King of the Mountain, 13283  -- DONE
--  Assault by Air, 13310 -- DONE
--  Assault by Ground, 13301 -- DONE
--  Riding the Wavelength: The Bombardment, 13406
--  Total Ohmage: The Valley of Lost Hope!, 13376 -- not implimented by blizzard

step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>飞往联盟炮艇“破天号”
	>>与骑士队长德洛斯彻和虔诚的阿布萨兰和高级指挥官加斯汀·巴雷特和首席技师波尔维克以及萨萨里安交谈
	>>请注意, 任务“决不留情！”是一项PvP任务, 要求你在冰冠冰川击杀15名部落玩家. 如需, 可每日放弃或跳过此任务
    .daily 13336 >>接任务: |cRXP_LOOT_伊米亚之血|r
    .daily 13300 >>接任务: |cRXP_LOOT_萨隆邪铁的奴隶|r
	.daily 13233 >>接任务: |cRXP_LOOT_决不留情！|r
    .daily 13292 >>接任务: |cRXP_LOOT_偷来的解决方案|r
    .daily 13289 >>接任务: |cRXP_LOOT_你的憎恶伙伴|r
	.daily 13297 >>接任务: |cRXP_LOOT_中和瘟疫|r
    .daily 13322 >>接任务: |cRXP_LOOT_重新考验|r
    .daily 13323 >>接任务: |cRXP_LOOT_从天而“降”|r
	.daily 13344 >>接任务: |cRXP_LOOT_活动窃听器|r
    .daily 13350 >>接任务: |cRXP_LOOT_片刻不得安宁|r
    .daily 13333 >>接任务: |cRXP_LOOT_抢夺急件|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00,0
	>>飞往部落炮艇“奥格瑞姆之锤”
	>>与战争使者达沃斯·里赫和凯尔坦修士和掠天者考尔姆·黑痕和首席技师考伯克拉和库尔迪拉·织亡者交谈
	>>请注意, 任务“血的代价！”是一项PvP任务, 要求你在冰冠冰川击杀15名联盟玩家. 如需, 可每日放弃或跳过此任务
    .daily 13330 >>接任务: |cRXP_LOOT_伊米亚之血|r
    .daily 13302 >>接任务: |cRXP_LOOT_萨隆邪铁的奴隶|r
	.daily 13234 >>接任务: |cRXP_LOOT_血的代价！|r
    .daily 13261 >>接任务: |cRXP_LOOT_爆炸油|r
    .daily 13276 >>接任务: |cRXP_LOOT_你的憎恶伙伴|r
	.daily 13281 >>接任务: |cRXP_LOOT_中和瘟疫|r
    .daily 13357 >>接任务: |cRXP_LOOT_重新考验|r
    .daily 13353 >>接任务: |cRXP_LOOT_从天而“降”|r
	.daily 13365 >>接任务: |cRXP_LOOT_活动窃听器|r
    .daily 13368 >>接任务: |cRXP_LOOT_片刻不得安宁|r
    .daily 13331 >>接任务: |cRXP_WARN_盲目的联盟|r
step << Alliance
    .goto IcecrownGlacier,62.6,51.3
	>>飞往地面指挥官库普(在地面上, 不在船上)
    .daily 13309 >>接任务: |cRXP_LOOT_空中突袭|r
step << Alliance
    #completewith next
    .goto Icecrown,62.55,50.67
    .vehicle 32227 >>右键点击飞行器顶部的炮塔以开始任务
	.isOnQuest 13309
step << Alliance
	>>飞行时向建筑物上的所有鱼叉枪射击
    .goto Icecrown,52.65,56.93
    .complete 13309,1 --4/4 Skybreaker Infiltrators dropped
	.isOnQuest 13309
step << Alliance
    .goto Icecrown,62.55,51.29
	>>返回库普
    .turnin 13309 >>交任务: |cRXP_FRIENDLY_空中突袭|r
	.isQuestComplete 13309
step << Horde
	>>飞到地面指挥官科特亚(在地面, 不在船上)
    .goto IcecrownGlacier,58.3,46.0
    .daily 13310 >>接任务: |cRXP_LOOT_空中突袭|r
step << Horde
	#completewith next
	.vehicle >>跑到船上位于科克隆压制炮塔处并点击它
    .goto IcecrownGlacier,59.60,45.84
	.isOnQuest 13310
step << Horde
	>>在飞行过程中射击所有看到的炮塔以将其摧毁. 这样会掉落渗透者
    .goto IcecrownGlacier,56.8,64.3
    .complete 13310,1 --Kor'kron Infiltrators dropped (4)
	.isOnQuest 13310
step << Horde
    .goto IcecrownGlacier,58.3,46.0
    .turnin 13310 >>交任务: |cRXP_FRIENDLY_空中突袭|r
	.isQuestComplete 13310
step << Alliance
    .goto IcecrownGlacier,62.5,51.1,15,0
    .goto IcecrownGlacier,62.8,51.6
	>>与小队队长交谈. 如果其他玩家已开始该任务, 他可能不在原地, 且有大约6分钟的重生时间
    .daily 13284 >>接任务: |cRXP_LOOT_地面突袭|r
step << Alliance
    .goto IcecrownGlacier,58.2,55.9,0
    .goto IcecrownGlacier,59.6,59.3,0
    .goto IcecrownGlacier,57.8,62.6,0
	#completewith Mineslave
	>>在伊米海姆各地击杀维库人
	.complete 13336,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13336
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
    .turnin 13280 >>交任务: |cRXP_FRIENDLY_占山为王|r
	.isQuestComplete 13280
step << Alliance
	>>返回地面指挥官库普
    .goto Icecrown,62.60,51.35
    .turnin 13284 >>交任务: |cRXP_FRIENDLY_地面突袭|r
	.isQuestComplete 13284
step << Horde
    .goto IcecrownGlacier,58.3,46.0
	>>与小队队长交谈. 如果其他玩家已开始该任务, 他可能不在原地, 且有大约6分钟的重生时间
    .daily 13301 >>接任务: |cRXP_LOOT_地面突袭|r
step << Horde
    .goto IcecrownGlacier,54.9,52.8,0,0
	#completewith Mineslave
	>>在伊米海姆各地击杀维库人
	.complete 13330,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13330
step << Horde
	>>护送部队. 必要时让部分部队承担怪物仇恨
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
    .goto IcecrownGlacier,58.2,55.9,70,0
    .goto IcecrownGlacier,59.6,59.3,70,0
    .goto IcecrownGlacier,57.8,62.6
	>>在伊米海姆各地击杀维库人
	.complete 13330,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13330
step << Horde
    .goto IcecrownGlacier,51.9,57.6
	>>注意:此任务会使你处于PvP状态, 但难度非常低
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
    .turnin 13283 >>交任务: |cRXP_FRIENDLY_占山为王|r
	.isQuestComplete 13283
step << Horde
	>>返回地面指挥官科特亚
    .goto Icecrown,58.3,46.0
    .turnin 13301 >>交任务: |cRXP_FRIENDLY_地面突袭|r
	.isQuestComplete 13301
step
    .goto IcecrownGlacier,67.2,68.3,70,0
    .goto IcecrownGlacier,68.0,70.9,70,0
    .goto IcecrownGlacier,71.6,61.3,70,0
    .goto IcecrownGlacier,67.2,68.3
	.use 44048 >>在破碎前线周围地面上搜刮散落的废弃装备. 当你集齐每件装备后, 使用背包中的“偷来的液体”(无需等待角色扮演) << Alliance
	.collect 43609,3,13292,1,-1 << Alliance --Pile of Bones (3)
	.collect 43610,3,13292,1,-1 << Alliance --Abandoned Helm (3)
	.collect 43616,3,13292,1,-1  << Alliance --Abandoned Armor (3)
    .complete 13292,1 << Alliance --Field Tests Conducted (3)
	.use 43608 >>在破碎前线周围地面上搜刮散落的废弃装备部件. 当你收集齐每件装备各一件后, 即可使用背包中的铜爪挥发油(无需等待剧情提示) << Horde
	.collect 43609,3,13261,1,-1  << Horde --Pile of Bones (3)
	.collect 43610,3,13261,1,-1 << Horde --Abandoned Helm (3)
	.collect 43616,3,13261,1,-1 << Horde --Abandoned Armor (3)
    .complete 13261,1 << Horde --Field Tests Conducted (3)
	.isOnQuest 13292 << Alliance
	.isOnQuest 13261 << Horde
step
    .goto IcecrownGlacier,68.3,61.5
	>>击杀该区域的笨重的憎恶, 从它们身上获取憎恶零件
	.use 43968 >>使用憎恶复活包与背包中的内脏召唤一只可控制的憎恶. 让憎恶攻击并吸引尽可能多的小怪仇恨, 然后使用“爆裂之缝”击杀所有靠近憎恶且处于战斗状态的小怪(这些小怪必须在战斗中才能获得任务奖励)
	>>如果你的“肠子”用完了, 就去杀更多的巨型憎恶. 你一次只能携带一个“肠子”
	.collect 43966,1,13289,-1,1 << Alliance --Chilled Abomination Guts (3)
    .complete 13289,1 << Alliance  --Icy Ghouls Exploded (15)
    .complete 13289,2 << Alliance  --Vicious Geists Exploded (15)
    .complete 13289,3 << Alliance  --Risen Alliance Soldiers Exploded (15)
	.collect 43966,1,13276,-1,1 << Horde  --Chilled Abomination Guts (3)
    .complete 13276,1 << Horde --Icy Ghouls Exploded (15)
    .complete 13276,2 << Horde --Vicious Geists Exploded (15)
    .complete 13276,3 << Horde --Risen Alliance Soldiers Exploded (15)
	.isOnQuest 13289 << Alliance
	.isOnQuest 13276 << Horde
step
    .goto IcecrownGlacier,65.7,63.0,70,0
    .goto IcecrownGlacier,63.4,56.7,70,0
    .goto IcecrownGlacier,66.8,58.4,70,0
    .goto IcecrownGlacier,69.5,57.3,70,0
    .goto IcecrownGlacier,72.5,59.0,70,0
    .goto IcecrownGlacier,70.1,57.2,70,0
    .goto IcecrownGlacier,65.7,63.0,70,0
    .goto IcecrownGlacier,63.4,56.7
	>>击杀该区域的血肉巨人, 从它们身上搜刮“肉体巨人脊椎”. 此任务非常困难, 建议组队完成；如觉得难度过大, 也可选择放弃或跳过此日常任务
	.collect 44009,1 -- Flesh Giant Spine (1)
	.isOnQuest 13297 << Alliance
	.isOnQuest 13281 << Horde
step
	.goto IcecrownGlacier,62.3,63.4
	.use 44009 >>使用背包中的[血肉巨人的脊骨]来制作[脊骨脓液]
	.collect 44010,1 -- Pustulant Spinal Fluid (1)
	.isOnQuest 13297 << Alliance
	.isOnQuest 13281 << Horde
step
    .goto IcecrownGlacier,62.3,63.4
	.use 44010 >>将背包中的“脊骨脓液”用在冒泡的绿色大锅上. 击杀随之生成的怪物, 并在提示“尽快添加液体”时再次使用脊骨脓液. 此任务非常困难, 建议组队完成, 或可选择放弃/跳过该日常任务
    .complete 13297,1 << Alliance --Batch of Plague Neutralized (1)
    .complete 13281,1 << Horde --Batch of Plague Neutralized (1)
	.isOnQuest 13297 << Alliance
	.isOnQuest 13281 << Horde
step
	>>前往平台, 击杀该区域的苦痛新兵, 搜刮他们的幻象之球
	.use 44246 >>当你脱离战斗时, 对区域内的黑暗压制者使用幻象宝珠
	.collect 44246,3,13353,1,-1 << Horde--Orb of Illusion (3 -1)
	.collect 44246,3,13323,1,-1 << Alliance--Orb of Illusion (3 -1)
    .goto IcecrownGlacier,53.7,46.1
    .complete 13323,1 << Alliance --Dark Subjugator dragged and dropped (3)
    .complete 13353,1 << Horde --Dark Subjugator dragged and dropped (3)
    .goto IcecrownGlacier,54.7,45.9,60,0
    .goto IcecrownGlacier,54.0,46.3,60,0
    .goto IcecrownGlacier,52.2,45.7,60,0
    .goto IcecrownGlacier,54.0,46.3
	.isOnQuest 13323 << Alliance
	.isOnQuest 13353 << Horde
step
    .goto IcecrownGlacier,49.7,34.4
	.use 44307 >>使用背包中的稀释过的诅咒教徒滋补剂, 获得“黑暗洞察”增益效果. 该效果使你在该区域击杀所有类人生物时, 可直接获取被污染的精华
	.collect 44301,10,13322,1 << Alliance
	.collect 44301,10,13357,1 << Horde
	.isOnQuest 13322 << Alliance
	.isOnQuest 13357 << Horde
step
    .goto IcecrownGlacier,49.7,34.4
	.use 44301 -- to combine the 10 tainted essences into a writhing mass
	.use 44304 >>右键点击背包中的被污染的精华, 将其转化为蠕动之物. 然后将其投入坩埚中
	.complete 13322,1 << Alliance
	.complete 13357,1 << Horde
	.isOnQuest 13322 << Alliance
	.isOnQuest 13357 << Horde
step
    .goto IcecrownGlacier,54.1,31.4,70,0
    .goto IcecrownGlacier,54.7,28.0,70,0
    .goto IcecrownGlacier,57.0,28.8,70,0
    .goto IcecrownGlacier,54.1,31.4
	.use 44433 >>击杀5名被奴役的爪牙(虚空行者). 使用虹吸魔杖在它们尸体上获取暗物质
	.collect 44434,5,13344,1 << Alliance --Dark Matter (5)
	.collect 44434,5,13365,1 << Horde --Dark Matter (5)
	.isOnQuest 13344 << Alliance
	.isOnQuest 13365 << Horde
step
    .goto IcecrownGlacier,53.8,33.6
	>>点击召唤石
	.complete 13344,1 << Alliance  --Dark Messenger Summoned (1)
    .complete 13365,1 << Horde --Dark Messenger Summoned (1)
	.isOnQuest 13344 << Alliance
	.isOnQuest 13365 << Horde
step
	#completewith next
    .goto IcecrownGlacier,51.9,32.5,30 >>进入阿尔杜尔塔尔
	.isOnQuest 13350 << Alliance
	.isOnQuest 13368 << Horde
step
	>>这个任务非常困难. 如果需要, 请组队完成, 或者放弃/跳过这个日常任务
	>>打开阿尔杜尔萨尔内的宝箱, 拾取奥鲁麦斯的头骨和心脏和权杖和长袍
	.collect 44476,1 --Alumeth's Skull (1)
    .goto IcecrownGlacier,50.5,30.0
	.collect 44477,1 --Alumeth's Heart (1)
    .goto IcecrownGlacier,52.8,30.7
	.collect 44478,1 --Alumeth's Scepter (1)
    .goto IcecrownGlacier,52.8,29.8
	.collect 44479,1 --Alumeth's Robes (1)
    .goto IcecrownGlacier,53.0,29.0
	.isOnQuest 13350 << Alliance
	.isOnQuest 13368 << Horde
step
    .goto IcecrownGlacier,51.9,29.0
	>>这个任务非常困难. 如果需要, 请组队完成, 或者放弃/跳过这个日常任务
	.use 44476 >>点击背包中的任意物品, 将其合成为阿鲁麦斯的遗骸
	.collect 44480,1 --Alumeth's Remains (1)
	.isOnQuest 13350 << Alliance
	.isOnQuest 13368 << Horde
step
    .goto IcecrownGlacier,51.9,29.0
	>>这个任务非常困难. 如果需要, 请组队完成, 或者放弃/跳过这个日常任务
	.use 44480 >>在发光水晶前使用阿鲁迈斯的遗骸召唤他, 然后击杀他
    .complete 13350,1 << Alliance --Alumeth the Ascended Defeated (1)
    .complete 13368,1 << Horde --Alumeth the Ascended Defeated (1)
	.isOnQuest 13350 << Alliance
	.isOnQuest 13368 << Horde
step << Alliance
    .goto IcecrownGlacier,46.2,52.1,70,0
    .goto IcecrownGlacier,42.4,59.4,0,0
	.use 44222 >>在背包中使用飞镖枪攻击奥格瑞姆之锤侦察兵(可在飞行坐骑上使用). 击杀后, 搜刮他们的尸体以获取密令
    .complete 13333,1 --Orgrim's Hammer Dispatch (6)
	.isOnQuest 13333
step << Horde
	.goto IcecrownGlacier,48.85,40.44
	.use 44212 >>在空中使用背包中的SGM-3对[破天号侦查机]进行攻击
	.complete 13331,1 --Skybreaker Recon Fighters shot down (6)
	.isOnQuest 13331
step << Alliance
	>>飞到空中的小平台上, 与吉普利·基罗赫斯交谈
	.goto IcecrownGlacier,53.96,42.93
	.daily 13404 >>接任务: |cRXP_LOOT_短程行动：轰炸场|r
step << Alliance
	.goto IcecrownGlacier,53.96,43.11
	>>与凯伦交谈以登上轰炸机. 使用冲锋护盾(1)获得100点护盾, 然后切换到轰炸舱(5), 开始轰炸下方的天灾部队, 直到所有步兵和队长被消灭. 切换到防空炮台(4), 开始使用防空火箭(1)攻击空中的石像鬼. 完成后, 按下离开载具按钮, 你将返回平台
	.complete 13404,1 -- Bombardment Infantry slain (50)
	.complete 13404,2 -- Bombardment Captain slain (10)
	.complete 13404,3 -- Gargoyle Ambusher slain (20)
	.skipgossip
step << Alliance
	>>与吉普利·基罗赫斯交谈
    .goto IcecrownGlacier,53.96,42.93
    .turnin 13404 >>交任务: |cRXP_FRIENDLY_短程行动：轰炸场|r
	.isQuestComplete 13404
step << Horde
	>>飞到空中的小平台, 然后与特兹拉交谈
    .goto IcecrownGlacier,53.99,36.87
    .daily 13406 >>接任务: |cRXP_LOOT_短程行动：轰炸场|r
step << Horde
	.goto IcecrownGlacier,54.00,36.70
	>>与Rizzy交谈以登上轰炸机. 使用冲锋护盾(1)获得100点护盾, 然后切换到轰炸舱(5), 开始轰炸下方的天灾部队, 直到所有步兵和指挥官被消灭. 随后切换到防空炮台(4), 使用防空火箭(1)击落空中的石像鬼. 完成后按下离开载具按钮, 你将返回平台
	.complete 13406,1 -- Bombardment Infantry slain (50)
	.complete 13406,2 -- Bombardment Captain slain (10)
	.complete 13406,3 -- Gargoyle Ambusher slain (20)
	.skipgossip
step << Horde
	>>与特兹拉交谈
    .goto IcecrownGlacier,54.00,36.94
    .turnin 13406 >>交任务: |cRXP_FRIENDLY_短程行动：轰炸场|r
	.isQuestComplete 13406
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>返回破天者号. 与骑士队长德洛斯彻和虔诚的阿布萨兰和高级指挥官加斯汀·巴雷特和首席技师波尔维克以及萨萨里安交谈
    .turnin -13336 >>交任务: |cRXP_FRIENDLY_伊米亚之血|r
    .turnin -13300 >>交任务: |cRXP_FRIENDLY_萨隆邪铁的奴隶|r
	.turnin -13233 >>交任务: |cRXP_FRIENDLY_决不留情！|r
    .turnin -13292 >>交任务: |cRXP_FRIENDLY_偷来的解决方案|r
    .turnin -13289 >>交任务: |cRXP_FRIENDLY_你的憎恶伙伴|r
	.turnin -13297 >>交任务: |cRXP_FRIENDLY_中和瘟疫|r
    .turnin -13322 >>交任务: |cRXP_FRIENDLY_重新考验|r
    .turnin -13323 >>交任务: |cRXP_FRIENDLY_从天而“降”|r
	.turnin -13344 >>交任务: |cRXP_FRIENDLY_活动窃听器|r
    .turnin -13350 >>交任务: |cRXP_FRIENDLY_片刻不得安宁|r
    .turnin -13333 >>交任务: |cRXP_FRIENDLY_抢夺急件|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00,0
	>>返回奥格瑞姆之锤. 与战争使者达沃斯·里赫和凯尔坦修士和掠天者考尔姆·黑痕和首席技师考伯克拉和库尔迪拉·织亡者交谈
    .turnin -13330 >>交任务: |cRXP_FRIENDLY_伊米亚之血|r
    .turnin -13302 >>交任务: |cRXP_FRIENDLY_萨隆邪铁的奴隶|r
	.turnin -13234 >>交任务: |cRXP_FRIENDLY_血的代价！|r
    .turnin -13261 >>交任务: |cRXP_FRIENDLY_爆炸油|r
    .turnin -13276 >>交任务: |cRXP_FRIENDLY_你的憎恶伙伴|r
	.turnin -13281 >>交任务: |cRXP_FRIENDLY_中和瘟疫|r
    .turnin -13357 >>交任务: |cRXP_FRIENDLY_重新考验|r
    .turnin -13353 >>交任务: |cRXP_FRIENDLY_从天而“降”|r
	.turnin -13365 >>交任务: |cRXP_FRIENDLY_活动窃听器|r
    .turnin -13368 >>交任务: |cRXP_FRIENDLY_片刻不得安宁|r
    .turnin -13331 >>交任务: |cRXP_FRIENDLY_盲目的联盟|r
step << Alliance
	+你已完成今日所有破天号日常任务 :) 记得尝试完成之前放弃或跳过的任何组队任务！
step << Horde
	+你已完成奥格瑞姆之锤今日所有日常任务 :) 记得如果想完成之前放弃或跳过的组队任务, 可以再尝试一下！
]])
