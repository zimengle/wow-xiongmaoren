RXPGuides.RegisterGuide([[
#version 1
#group +休息经验 诺森德每日任务
#subgroup 派系每日任务
#wotlk
#cata
#name 冰冠炮艇日常任务路线

step << Alliance -- Checking that the actual pre quests that have been completed, not dailies
	+要解锁所有冰冠炮艇日常任务，您必须先完成前置任务链。请使用冰冠炮艇解锁日常任务指南来解锁所有日常任务
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
	+要解锁所有冰冠炮艇日常任务，您必须先完成前置任务链。请使用冰冠炮艇解锁日常任务指南来解锁所有日常任务
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
	>>飞往联盟武装直升机“破天者”号
	>>与骑士队长 Drosche、虔诚者 Absalan、高级队长 Justin Bartlett、首席工程师 Boltwrench 和 Thassarian 交谈
	>>请注意，任务“毫不留情！”是一项 PvP 任务，要求您在冰冠冰川中杀死 15 名部落玩家。如果您愿意，您可以每天放弃/跳过此任务
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
	>>飞往部落武装直升机“奥格瑞姆之锤”
	>>与战争使者戴佛斯·里欧特、凯尔坦兄弟、掠天者科姆·黑痕、首席工程师科珀克劳和织死者科尔蒂拉交谈
	>>请注意，任务“让他们付出代价！”是一项 PvP 任务，要求您在冰冠冰川中杀死 15 名联盟玩家。如果您愿意，您可以每天放弃/跳过此任务
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
	>>飞往地面指挥官 Koup（在地面 - 不在船上）
    .daily 13309 >>接任务: |cRXP_LOOT_空中突袭|r
step << Alliance
    #completewith next
    .goto Icecrown,62.55,50.67
    .vehicle 32227 >>右键点击飞行器顶部的炮塔来开始任务
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
	>>飞到地面指挥官 Xutjja (在地面 - 不在船上)
    .goto IcecrownGlacier,58.3,46.0
    .daily 13310 >>接任务: |cRXP_LOOT_空中突袭|r
step << Horde
	#completewith next
	.vehicle >>跑到船上的库卡隆压制炮塔并点击它。
    .goto IcecrownGlacier,59.60,45.84
	.isOnQuest 13310
step << Horde
	>>飞行时向所有看到的炮塔射击，使其失效。当你这样做时，渗透者就会掉落。
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
	>>与小队队长交谈。如果其他人开始了任务，他可能不在这里，并且重生时间大约为 6 分钟
    .daily 13284 >>接任务: |cRXP_LOOT_地面突袭|r
step << Alliance
    .goto IcecrownGlacier,58.2,55.9,0
    .goto IcecrownGlacier,59.6,59.3,0
    .goto IcecrownGlacier,57.8,62.6,0
	#completewith Mineslave
	>>消灭伊米海姆各地的维库人
	.complete 13336,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13336
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
    .turnin 13280 >>交任务: |cRXP_FRIENDLY_占山为王|r
	.isQuestComplete 13280
step << Alliance
	>>返回地面指挥官库普
    .goto Icecrown,62.60,51.35
    .turnin 13284 >>交任务: |cRXP_FRIENDLY_地面突袭|r
	.isQuestComplete 13284
step << Horde
    .goto IcecrownGlacier,58.3,46.0
	>>与小队队长交谈。如果其他人开始了任务，他可能不在这里，并且重生时间大约为 6 分钟
    .daily 13301 >>接任务: |cRXP_LOOT_地面突袭|r
step << Horde
    .goto IcecrownGlacier,54.9,52.8,0,0
	#completewith Mineslave
	>>消灭伊米海姆各地的维库人
	.complete 13330,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13330
step << Horde
	>>护送部队。必要时让一些部队去对付怪物
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
    .goto IcecrownGlacier,58.2,55.9,70,0
    .goto IcecrownGlacier,59.6,59.3,70,0
    .goto IcecrownGlacier,57.8,62.6
	>>消灭伊米海姆各地的维库人
	.complete 13330,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13330
step << Horde
    .goto IcecrownGlacier,51.9,57.6
	>>注意：此任务会标记您为 PvP。但是它非常简单。
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
    .turnin 13283 >>交任务: |cRXP_FRIENDLY_占山为王|r
	.isQuestComplete 13283
step << Horde
	>>返回地面指挥官 Xutjja
    .goto Icecrown,58.3,46.0
    .turnin 13301 >>交任务: |cRXP_FRIENDLY_地面突袭|r
	.isQuestComplete 13301
step
    .goto IcecrownGlacier,67.2,68.3,70,0
    .goto IcecrownGlacier,68.0,70.9,70,0
    .goto IcecrownGlacier,71.6,61.3,70,0
    .goto IcecrownGlacier,67.2,68.3
	.use 44048 >>搜刮破碎前线周围地面上散落的废弃装备。当你拥有每件装备时，使用背包中的走私溶液（无需等待 RP） << Alliance
	.collect 43609,3,13292,1,-1 << Alliance --Pile of Bones (3)
	.collect 43610,3,13292,1,-1 << Alliance --Abandoned Helm (3)
	.collect 43616,3,13292,1,-1  << Alliance --Abandoned Armor (3)
    .complete 13292,1 << Alliance --Field Tests Conducted (3)
	.use 43608 >>搜刮破碎前线周围地面上散落的废弃装备。当你拥有每件装备时，使用背包中的 Copperclaw 挥发油（无需等待 RP） << Horde
	.collect 43609,3,13261,1,-1  << Horde --Pile of Bones (3)
	.collect 43610,3,13261,1,-1 << Horde --Abandoned Helm (3)
	.collect 43616,3,13261,1,-1 << Horde --Abandoned Armor (3)
    .complete 13261,1 << Horde --Field Tests Conducted (3)
	.isOnQuest 13292 << Alliance
	.isOnQuest 13261 << Horde
step
    .goto IcecrownGlacier,68.3,61.5
	>>杀死该区域的巨型憎恶并从它们身上获取冰冻憎恶内脏
	.use 43968 >>使用憎恶复活包和背包中的一些内脏召唤一只你可以控制的憎恶。让憎恶攻击并激怒尽可能多的怪物，然后使用“爆裂之缝”杀死憎恶附近的所有怪物（怪物必须处于战斗状态才能获得奖励）
	>>如果你的 Guts 用完了，就去杀死更多的巨型怪物。你一次只能携带 1 个 Guts。
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
	>>杀死该区域的脓疱恐怖。从它们身上搜刮出肉体巨人脊柱。这个任务非常难。如果需要，可以组队完成，或者你也可以放弃/跳过这个每日任务
	.collect 44009,1 -- Flesh Giant Spine (1)
	.isOnQuest 13297 << Alliance
	.isOnQuest 13281 << Horde
step
	.goto IcecrownGlacier,62.3,63.4
	.use 44009 >>使用袋子里的肉体巨脊来制造脓疱性脊髓液
	.collect 44010,1 -- Pustulant Spinal Fluid (1)
	.isOnQuest 13297 << Alliance
	.isOnQuest 13281 << Horde
step
    .goto IcecrownGlacier,62.3,63.4
	.use 44010 >>将包中的脓疱性脊髓液用在冒泡的绿色大锅上。杀死生成的怪物，并在提示“尽快添加液体”时再次使用脊髓液。这个任务非常困难。如果需要，可以组队完成，或者你可以放弃/跳过这个每日任务
    .complete 13297,1 << Alliance --Batch of Plague Neutralized (1)
    .complete 13281,1 << Horde --Batch of Plague Neutralized (1)
	.isOnQuest 13297 << Alliance
	.isOnQuest 13281 << Horde
step
	>>前往平台并杀死该区域的苦涩新兵。掠夺他们的幻象之球
	.use 44246 >>当你脱离战斗时，使用幻象之球对付区域内的黑暗征服者。
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
	.use 44307 >>使用包中的稀释邪教补药来获得“黑暗洞察力”增益。这让你可以从你杀死的该区域的所有类人生物身上掠夺污染精华
	.collect 44301,10,13322,1 << Alliance
	.collect 44301,10,13357,1 << Horde
	.isOnQuest 13322 << Alliance
	.isOnQuest 13357 << Horde
step
    .goto IcecrownGlacier,49.7,34.4
	.use 44301 -- to combine the 10 tainted essences into a writhing mass
	.use 44304 >>右键点击包里的污秽精华，将其变成翻滚的物质。将其扔进大锅里
	.complete 13322,1 << Alliance
	.complete 13357,1 << Horde
	.isOnQuest 13322 << Alliance
	.isOnQuest 13357 << Horde
step
    .goto IcecrownGlacier,54.1,31.4,70,0
    .goto IcecrownGlacier,54.7,28.0,70,0
    .goto IcecrownGlacier,57.0,28.8,70,0
    .goto IcecrownGlacier,54.1,31.4
	.use 44433 >>杀死 5 名被奴役的奴仆（虚空行者）。使用虹吸棒在他们的尸体上获取暗物质
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
    .goto IcecrownGlacier,51.9,32.5,30 >>进入阿尔杜萨
	.isOnQuest 13350 << Alliance
	.isOnQuest 13368 << Horde
step
	>>这个任务非常难。如果需要，可以组队完成，或者放弃/跳过这个每日任务
	>>打开 Aldur'thar 里面的箱子，拾取 Alumeth 的头骨、心脏、权杖和长袍
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
	>>这个任务非常难。如果需要，可以组队完成，或者放弃/跳过这个每日任务
	.use 44476 >>点击背包中的任意物品，将其合成为 Alumeth's Remains
	.collect 44480,1 --Alumeth's Remains (1)
	.isOnQuest 13350 << Alliance
	.isOnQuest 13368 << Horde
step
    .goto IcecrownGlacier,51.9,29.0
	>>这个任务非常难。如果需要，可以组队完成，或者放弃/跳过这个每日任务
	.use 44480 >>在发光水晶前使用 Alumeth 的遗骸来召唤他。杀死他
    .complete 13350,1 << Alliance --Alumeth the Ascended Defeated (1)
    .complete 13368,1 << Horde --Alumeth the Ascended Defeated (1)
	.isOnQuest 13350 << Alliance
	.isOnQuest 13368 << Horde
step << Alliance
    .goto IcecrownGlacier,46.2,52.1,70,0
    .goto IcecrownGlacier,42.4,59.4,0,0
	.use 44222 >>使用背包中的飞镖枪对付奥格瑞姆之锤侦察兵（你可以在飞行坐骑上使用它）。搜刮他们的尸体，用于派遣
    .complete 13333,1 --Orgrim's Hammer Dispatch (6)
	.isOnQuest 13333
step << Horde
	.goto IcecrownGlacier,48.85,40.44
	.use 44212 >>使用背包中的 SGM-3 对空中的 Skybreaker 侦察战斗机进行攻击
	.complete 13331,1 --Skybreaker Recon Fighters shot down (6)
	.isOnQuest 13331
step << Alliance
	>>飞到空中的小平台上。和Killohertz交谈
	.goto IcecrownGlacier,53.96,42.93
	.daily 13404 >>接任务: |cRXP_LOOT_短程行动：轰炸场|r
step << Alliance
	.goto IcecrownGlacier,53.96,43.11
	>>与凯伦交谈，登上轰炸机。使用冲锋护盾 (1) 获得 100 个护盾，然后切换到轰炸舱 (5)，开始轰炸下方的天灾，直到所有步兵和上尉都被杀死。切换到防空炮塔 (4)，开始使用防空火箭 (1) 向空中射击石像鬼。完成后，按离开车辆按钮，您将返回平台
	.complete 13404,1 -- Bombardment Infantry slain (50)
	.complete 13404,2 -- Bombardment Captain slain (10)
	.complete 13404,3 -- Gargoyle Ambusher slain (20)
	.skipgossip
step << Alliance
	>>与 Killohertz 交谈
    .goto IcecrownGlacier,53.96,42.93
    .turnin 13404 >>交任务: |cRXP_FRIENDLY_短程行动：轰炸场|r
	.isQuestComplete 13404
step << Horde
	>>飞到空中的小平台上。和Tezzla交谈
    .goto IcecrownGlacier,53.99,36.87
    .daily 13406 >>接任务: |cRXP_LOOT_短程行动：轰炸场|r
step << Horde
	.goto IcecrownGlacier,54.00,36.70
	>>与 Rizzy 交谈，登上轰炸机。使用冲锋护盾 (1) 获得 100 个护盾，然后切换到轰炸舱 (5)，开始轰炸下面的天灾，直到所有步兵和上尉都被杀死。切换到防空炮塔 (4)，开始使用防空火箭 (1) 向空中射击石像鬼。完成后，按离开车辆按钮，您将返回平台
	.complete 13406,1 -- Bombardment Infantry slain (50)
	.complete 13406,2 -- Bombardment Captain slain (10)
	.complete 13406,3 -- Gargoyle Ambusher slain (20)
	.skipgossip
step << Horde
	>>与 Tezzla 交谈
    .goto IcecrownGlacier,54.00,36.94
    .turnin 13406 >>交任务: |cRXP_FRIENDLY_短程行动：轰炸场|r
	.isQuestComplete 13406
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>返回破天者号。与骑士队长德洛什、虔诚者阿布萨兰、高级队长贾斯汀·巴特利特、首席工程师博尔特维伦奇和萨萨里安交谈。
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
	>>返回奥格瑞姆之锤。与战争使者戴佛斯·里欧特、凯尔坦修士、掠天者科姆·黑痕、首席工程师科珀克劳和死亡织者科尔蒂拉交谈
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
	+您已完成今天的所有破天者日常任务 :) 如果愿意的话，请记得尝试完成您放弃/跳过的任何组队任务！
step << Horde
	+您已完成今天的所有奥格瑞姆之锤日常任务 :) 如果愿意的话，请记得尝试完成您放弃/跳过的任何组队任务！
]])
