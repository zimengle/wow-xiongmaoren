local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Alliance
#name 1-12 神秘蓝岛
#displayname 1-12 神秘蓝岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor Draenei
#next 11-20 秘血岛(德莱尼)
step
    .goto Azuremyst Isle,82.96,43.88 << tbc
    .goto Azuremyst Isle,84.19,43.03 << wotlk
.target Megelon
>>与|cRXP_FRIENDLY_麦格伦|r交谈
    .accept 9279 >>接任务: |cRXP_LOOT_你活下来了！|r
step << Shaman
	#completewith next
	    .goto Azuremyst Isle,80.0,47.1
	.vendor >>击杀2-3个怪物获取商人垃圾(价值10铜币以上), 然后在商人处出售这些垃圾
step << Shaman
    .goto Azuremyst Isle,79.277,49.123
	.trainer >>学习[石化武器]
step << Warrior
    #completewith next
        .goto Azuremyst Isle,80.0,47.1
	.vendor >>击杀2-3个怪物获取商人垃圾(价值10铜币以上), 然后在商人处出售这些垃圾
step << Warrior
    .goto Azuremyst Isle,79.587,49.446
  .trainer >>训练战斗怒吼
step << Priest/Mage
	#completewith next
	.goto Azuremyst Isle,79.3,50.9
    .vendor >>击杀怪物, 直到获得价值48铜币的垃圾物品. 然后前往商人处, 从罗约什购买10单位水
    .collect 159,10 --Collect Refreshing Spring Water (x10)
step
    .goto Azuremyst Isle,80.419,45.885
>>与|cRXP_FRIENDLY_普罗尼图斯|r交谈
    .turnin 9279 >>交任务: |cRXP_FRIENDLY_你活下来了！|r
.target Proenitus
    .accept 9280 >>接任务: |cRXP_LOOT_补充治疗水晶|r
step
    .goto Azuremyst Isle,79.1,46.5
.target Botanist Taerix
>>与|cRXP_FRIENDLY_植物学家塔蕾克丝|r交谈
    .accept 10302 >>接任务: |cRXP_LOOT_暴躁的变异体|r
step
	#sticky
    #label mothblood
    >>击杀并搜刮峡谷蛾
    .complete 9280,1 --Collect Vial of Moth Blood (x8)
step
    .goto Azuremyst Isle,78.4,44.3
	>>优先处理暴躁的变异体, 交完任务后前往根鞭笞者. 回程时可以顺路完成蛾血任务
    .complete 10302,1 --Kill Volatile Mutation (x8)
step
    .goto Azuremyst Isle,79.1,46.4
>>与|cRXP_FRIENDLY_植物学家塔蕾克丝|r交谈
    .turnin 10302 >>交任务: |cRXP_FRIENDLY_暴躁的变异体|r
.target Botanist Taerix
    .accept 9293 >>接任务: |cRXP_LOOT_必需的措施......|r
.target Apprentice Vishael
>>与|cRXP_FRIENDLY_学徒维莎尔|r交谈
    .accept 9799 >>接任务: |cRXP_LOOT_跑腿采花|r
step
    .goto Azuremyst Isle,74.5,48.5
	>>击杀掠夺者/拾取地上的小花
    .complete 9799,1 --Collect Corrupted Flower (x3)
    .complete 9293,1 --Collect Lasher Sample (x10)
step
    .goto Azuremyst Isle,79.1,46.5
	.xp 4-420 >>刷怪直到距离4级还差420点经验值(当前980/1400)
step
    #requires mothblood
    .goto Azuremyst Isle,79.1,46.5
>>与|cRXP_FRIENDLY_植物学家塔蕾克丝|r交谈
    .turnin 9293 >>交任务: |cRXP_FRIENDLY_必需的措施......|r
.target Botanist Taerix
    .accept 9294 >>接任务: |cRXP_LOOT_净化湖水|r
.target Apprentice Vishael
>>与|cRXP_FRIENDLY_学徒维莎尔|r交谈
    .turnin 9799 >>交任务: |cRXP_FRIENDLY_跑腿采花|r
step
    .goto Azuremyst Isle,80.4,45.8
>>与|cRXP_FRIENDLY_普罗尼图斯|r交谈
    .turnin 9280 >>交任务: |cRXP_FRIENDLY_补充治疗水晶|r
.target Proenitus
    .accept 9409 >>接任务: |cRXP_LOOT_紧急物资！|r
step
	#completewith next
	    .goto Azuremyst Isle,80.0,47.1
	.vendor >>NPC与修理
step << Mage
	#completewith next
	    .goto Azuremyst Isle,79.582,48.762
.target Valaatu
>>与|cRXP_FRIENDLY_瓦拉图|r交谈
	.turnin 9290 >>交任务: |cRXP_FRIENDLY_法师训练|r
	.trainer >>训练你的你的法术
step << Paladin
	#completewith next
.target Aurelon
>>与|cRXP_FRIENDLY_奥雷伦|r交谈
	.turnin 9287 >>交任务: |cRXP_FRIENDLY_圣骑士训练|r
	    .goto Azuremyst Isle,79.695,48.236
	.trainer >>训练你的你的法术
step
    .goto Azuremyst Isle,79.9,49.2
>>与|cRXP_FRIENDLY_扎尔杜|r交谈
    .turnin 9409 >>交任务: |cRXP_FRIENDLY_紧急物资！|r
.target Zalduun
    .accept 9283 >>接任务: |cRXP_LOOT_拯救幸存者！|r
step << Shaman
    .goto Azuremyst Isle,79.277,49.123
.target Firmanvaar
>>与|cRXP_FRIENDLY_费曼瓦尔|r交谈
    .accept 9449 >>接任务: |cRXP_LOOT_大地的召唤|r
	.turnin 9421 >>交任务: |cRXP_FRIENDLY_萨满祭司训练|r
	.trainer >>学习大地震击
step << Shaman
    .goto Azuremyst Isle,71.315,39.097
>>与|cRXP_FRIENDLY_峡谷之灵|r交谈
    .turnin 9449 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
.target Spirit of the Vale
    .accept 9450 >>接任务: |cRXP_LOOT_大地的召唤|r
step << Warrior
    .goto Azuremyst Isle,79.587,49.446
.target Kore
>>与|cRXP_FRIENDLY_库勒|r交谈
	.turnin 9289 >>交任务: |cRXP_FRIENDLY_战士训练|r
	.trainer >>训练你的你的法术
step
    #sticky
    #label survivors
	>>在建筑外的受伤幸存者中使用你的“纳鲁之赐”法术. 这些幸存者分散在起始区域各处
    .complete 9283,1 --Draenei Survivors Saved
step << Shaman
    .goto Azuremyst Isle,70.1,36.6
    .complete 9450,1 --Kill Restless Spirit of Earth (x4)
step << Shaman
    .goto Azuremyst Isle,71.315,39.097
.target Spirit of the Vale
>>与|cRXP_FRIENDLY_峡谷之灵|r交谈
    .accept 9451 >>接任务: |cRXP_LOOT_大地的召唤|r
    .turnin 9450 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
step << Shaman
    .goto Azuremyst Isle,79.277,49.123
.target Firmanvaar
>>与|cRXP_FRIENDLY_费曼瓦尔|r交谈
    .turnin 9451 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
step << Hunter
	.goto Azuremyst Isle,79.86,49.67
.target Keilnei
>>与|cRXP_FRIENDLY_基尔尼|r交谈
	.accept 9288 >>接任务: |cRXP_LOOT_猎人训练|r
	.turnin 9288 >>交任务: |cRXP_FRIENDLY_猎人训练|r
	.train 1978 >>训练毒蛇钉刺
step << Priest
	.goto Azuremyst Isle,79.3,50.9
    .vendor >>从罗约什购买更多的水
    .collect 159,10 --Collect Refreshing Spring Water (x15)
step << Hunter
	#completewith next
	.goto Azuremyst Isle,79.3,50.9
	.vendor >>从姆拉购买6组箭矢 << Hunter
step
	#label spareparts2
    .goto Azuremyst Isle,79.4,51.3
.target Technician Zhanaa
>>与|cRXP_FRIENDLY_技师沙娜安|r交谈
    .accept 9305 >>接任务: |cRXP_LOOT_备用零件|r
step
    .goto Azuremyst Isle,79.5,51.7
.target Vindicator Aldar
>>与|cRXP_FRIENDLY_守备官奥达尔|r交谈
    .accept 9303 >>接任务: |cRXP_LOOT_疫苗|r
step
    .goto Azuremyst Isle,85.3,66.2
	.use 22962 >>使用背包中的接种水晶为巢木猫头鹰进行接种
	>>地面上的战利品发射器, 看起来像旋转的粉红色水晶
    .complete 9303,1 --Nestlewood Owlkin inoculated (x6)
    .complete 9305,1 --Collect Emitter Spare Part (x4)
step
	#sticky
	#completewith next
	.deathskip >>引怪一群猫头鹰并故意死亡. 你也可以站在篝火上. 在坠机地点复活
step
    .goto Azuremyst Isle,79.4,51.3
.target Technician Zhanaa
>>与|cRXP_FRIENDLY_技师沙娜安|r交谈
    .turnin 9305 >>交任务: |cRXP_FRIENDLY_备用零件|r
step
    .goto Azuremyst Isle,79.5,51.5
>>与|cRXP_FRIENDLY_守备官奥达尔|r交谈
    .turnin 9303 >>交任务: |cRXP_FRIENDLY_疫苗|r
.target Vindicator Aldar
    .accept 9309 >>接任务: |cRXP_LOOT_失踪的斥候|r
step
	#completewith next
	.goto Azuremyst Isle,79.3,50.9
	.vendor >>NPC与修理
step
    .goto Azuremyst Isle,77.3,58.7
	>>点击湖中的大水晶
    .complete 9294,1 --Collect Disperse the Neutralizing Agent (x1)
step
    .goto Azuremyst Isle,71.998,60.856
>>与|cRXP_FRIENDLY_图兰|r交谈
    .turnin 9309 >>交任务: |cRXP_FRIENDLY_失踪的斥候|r
.target Tolaan
    .accept 10303 >>接任务: |cRXP_LOOT_血精灵|r
step
    .goto Azuremyst Isle,70.1,63.5
    .complete 10303,1 --Kill Blood Elf Scout (x10)
step
    .goto Azuremyst Isle,72.0,61.0
>>与|cRXP_FRIENDLY_图兰|r交谈
    .turnin 10303 >>交任务: |cRXP_FRIENDLY_血精灵|r
.target Tolaan
    .accept 9311 >>接任务: |cRXP_LOOT_血精灵间谍|r
step
    .goto Azuremyst Isle,69.2,65.5
    .complete 9311,1 --Kill Surveyor Candress (x1)
	.use 24414 >>从测量者身上获取计划, 然后右键点击它
    .accept 9798 >>接任务: |cRXP_LOOT_血精灵计划书|r
step
	#sticky
	#completewith next
    .xp 6-1485 >>刷精灵, 直到距离6级还差1485点经验值(1315/2800). 最后几只怪时故意让自己血量很低, 我们之后会进行死亡跳过
step
	.deathskip >>死亡后与灵魂治疗师交谈, 于墓地复活
    .goto Azuremyst Isle,79.2,46.4
.target Botanist Taerix
>>与|cRXP_FRIENDLY_植物学家塔蕾克丝|r交谈
    .turnin 9294 >>交任务: |cRXP_FRIENDLY_净化湖水|r
step
    #label survivors2
    #requires survivors
    .goto Azuremyst Isle,80.1,49.0
.target Zalduun
>>与|cRXP_FRIENDLY_扎尔杜|r交谈
    .turnin 9283 >>交任务: |cRXP_FRIENDLY_拯救幸存者！|r
step
    .goto Azuremyst Isle,79.488,51.622
>>与|cRXP_FRIENDLY_守备官奥达尔|r交谈
    .turnin 9311 >>交任务: |cRXP_FRIENDLY_血精灵间谍|r
    .turnin 9798 >>交任务: |cRXP_FRIENDLY_血精灵计划书|r
.target Vindicator Aldar
    .accept 9312 >>接任务: |cRXP_LOOT_图像发射器|r
step
    .goto Azuremyst Isle,79.422,51.234
>>与|cRXP_FRIENDLY_技师沙娜安|r交谈
    .turnin 9312 >>交任务: |cRXP_FRIENDLY_图像发射器|r
.target Technician Zhanaa
    .accept 9313 >>接任务: |cRXP_LOOT_前往碧蓝岗哨|r
step
    #requires survivors2
    .goto Azuremyst Isle,64.6,54.2
.target Aeun
>>与|cRXP_FRIENDLY_埃文|r交谈
    .accept 9314 >>接任务: |cRXP_LOOT_碧蓝岗哨的消息|r
step
    .goto Azuremyst Isle,61.1,54.2
.target Diktynna
>>与|cRXP_FRIENDLY_迪泰娜|r交谈
    .accept 9452 >>接任务: |cRXP_LOOT_美味的红钳鱼|r
step
	#completewith end
	>>留意德莱尼幼崽. 这是一次罕见的遭遇. 如果你发现一只, 当它正在与怪物战斗时, 使用你的种族技能“纳鲁之赐”(Gift of the Naaru)施加在它身上. 然后接受任务
.target Draenei Youngling
>>与|cRXP_FRIENDLY_年幼的德莱尼人|r交谈
	.accept 9612 >>接任务: |cRXP_LOOT_非常感谢！|r
	.unitscan Draenei Youngling
step
	#sticky
	#completewith next
	.use 23654 >>沿河向北跑, 用渔网在钓鱼点捕捉鱼类, 到达河尽头后去寻找夜行者. 尽量完成该任务的至少50%, 之后你还有机会继续完成
	.collect 23614,10
step
    .goto Azuremyst Isle,53.9,34.4
    .use 23678 >>沿着西海岸前进, 沿途击杀所有感染的夜行豹幼崽, 直到它们掉落一颗微光水晶
	.collect 23678,1
    .accept 9455 >>接任务: |cRXP_LOOT_奇怪的发现|r
step
	#sticky
	#completewith next
    .goto Azuremyst Isle,56.1,39.3
	.deathskip >>故意死亡并在碧蓝岗哨复活
    >>确保死在靠近山边的池塘附近
step
    #completewith next
    .goto Azuremyst Isle,49.0,51.6,150 >>前往碧蓝岗哨
step
    .goto Azuremyst Isle,48.4,51.6
.target Anchorite Fateema
>>与 |cRXP_FRIENDLY_学者法蒂玛|r交谈
    .accept 9463 >>接任务: |cRXP_LOOT_医疗材料|r
step << Shaman
    #sticky
    .goto Azuremyst Isle,49.6,53.1,0
    >>如果你有5秒的空闲时间, 就去买一根手杖
    .collect 2495,1
step
	.isOnQuest 9612
>>与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
	.turnin 9612 >>交任务: |cRXP_FRIENDLY_非常感谢！|r
    .turnin 9455 >>交任务: |cRXP_FRIENDLY_奇怪的发现|r
.target Exarch Menelaous
    .accept 9456 >>接任务: |cRXP_LOOT_清理夜行豹......|r
step << Warrior/Paladin
    .goto Azuremyst Isle,49.0,51.1
    .trainer >>学习采矿技能并施放“发现矿物”法术. 你正在采集粗矿石, 以备后续使用
step
    .goto Azuremyst Isle,47.2,50.6
>>与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9455 >>交任务: |cRXP_FRIENDLY_奇怪的发现|r
.target Exarch Menelaous
    .accept 9456 >>接任务: |cRXP_LOOT_清理夜行豹......|r
step << Shaman
    .goto Azuremyst Isle,48.05,50.42
    .trainer >>训练你的你的法术
step
    .goto Azuremyst Isle,48.7,50.2
.target Technician Dyvuun
>>与|cRXP_FRIENDLY_技师戴维恩|r交谈
    .turnin 9313 >>交任务: |cRXP_FRIENDLY_前往碧蓝岗哨|r
step
    .goto Azuremyst Isle,48.4,49.3
.target Caregiver Chellan
>>与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .turnin 9314 >>交任务: |cRXP_FRIENDLY_碧蓝岗哨的消息|r
step
	.goto Azuremyst Isle,48.4,49.3
    .home >>将你的炉石设置为碧蓝岗哨
step << Paladin
    .goto Azuremyst Isle,48.4,49.5
    .trainer >>训练你的你的法术
step << Priest
    .goto Azuremyst Isle,48.603,49.285
	 .trainer >>训练你的你的法术
.target Guvan
>>与|cRXP_FRIENDLY_古安|r交谈
    .accept 9586 >>接任务: |cRXP_LOOT_帮助塔瓦拉|r
step << Mage
    .goto Azuremyst Isle,49.9,50.0
    .trainer >>训练你的你的法术
step << Warrior
    .goto Azuremyst Isle,50.023,50.515
    .trainer >>训练你的你的法术
step << Hunter
    .goto Azuremyst Isle,49.780,51.938
    .trainer >>训练你的你的法术
step
	#sticky
	#completewith azuremyst1
    >>在任务过程中击杀并掠夺根部诱捕者/月痕雄鹿, 即使完成任务后也可继续刷怪. 前方有大量经验获取的刷怪步骤
    .complete 9463,1
	.collect 23676,6 --Collect Moongraze Stag Tenderloin (x6)
step << Priest
    .goto Azuremyst Isle,56.1,48.9
    .complete 9586,1 --Heal Tavara
step
    .goto Azuremyst Isle,47.0,70.1
.target Admiral Odesyus
>>与|cRXP_FRIENDLY_海军上将奥德修斯|r交谈
    .accept 9506 >>接任务: |cRXP_LOOT_第三类接触|r
step
    .goto Azuremyst Isle,46.687,70.629
.target "Cookie" McWeaksauce
>>对话:|cRXP_FRIENDLY_"曲奇"米维克索斯|r交谈
    .accept 9512 >>接任务: |cRXP_LOOT_曲奇的大餐|r
step
    .goto Azuremyst Isle,46.4,71.2
	.vendor >>NPC与修理
    .trainer >>学习锻造技能, 并从卡里普索处购买一把矿工锄. 这将让你制作出为武器提供+2伤害的锐化石, 效果非常强力. 建议在等级约20级时停止制作此类锐化石 << Warrior
    .trainer >>学习锻造技能, 并从卡吕普索处购买一把矿工锄. 这将让你制作出为武器增加+2伤害的重石, 这些重石非常强力. 建议在等级约20时停止制作此类重石 << Paladin
step
    .goto Azuremyst Isle,58.5,66.3
	>>路上刷怪
	>>搜寻位于其中一个帐篷中的地图
    .complete 9506,2 --Collect Nautical Map (x1)
step
    .goto Azuremyst Isle,59.5,67.6
	>>搜刮位于其中一个帐篷内的指南针
    .complete 9506,1 --Collect Nautical Compass (x1)
step
    .goto Azuremyst Isle,48.8,72.7
	>>沿海岸击杀螃蟹
    .complete 9512,1 --Collect Skittering Crawler Meat (x6)
step
    .goto Azuremyst Isle,46.7,70.5
.target "Cookie" McWeaksauce
>>对话:|cRXP_FRIENDLY_"曲奇"米维克索斯|r交谈
    .turnin 9512 >>交任务: |cRXP_FRIENDLY_曲奇的大餐|r
step
    .goto Azuremyst Isle,47.0,70.3
>>与|cRXP_FRIENDLY_海军上将奥德修斯|r交谈
    .turnin 9506 >>交任务: |cRXP_FRIENDLY_第三类接触|r
.target Admiral Odesyus
    .accept 9530 >>接任务: |cRXP_LOOT_天才的方案！|r
.target Priestess Kyleen Il'dinare
>>与|cRXP_FRIENDLY_女牧师凯琳·伊尔迪纳尔|r交谈
    .accept 9513 >>接任务: |cRXP_LOOT_夺回废墟|r
step
    .goto Azuremyst Isle,47.2,70.1
.target Archaeologist Adamant Ironheart
>>与|cRXP_FRIENDLY_考古学家阿达曼特·铁心|r交谈
    .accept 9523 >>接任务: |cRXP_LOOT_贵重物品，小心轻放|r
step
    #sticky
    .goto Azuremyst Isle,48.1,63.2
	>>在正在伐木的农民附近找到一个空心的树桩
    .complete 9530,1 --Collect Hollowed Out Tree (x1)
step
    .goto Azuremyst Isle,46.9,66.1
	>>在奥德修斯营地外围寻找紫色树叶堆的同时刷怪
    .complete 9530,2 --Collect Pile of Leaves (x5)
step
	#label azuremyst1
    .goto Azuremyst Isle,47.1,70.1
	>>路上刷怪
>>与|cRXP_FRIENDLY_海军上将奥德修斯|r交谈
    .turnin 9530 >>交任务: |cRXP_FRIENDLY_天才的方案！|r
.target Admiral Odesyus
    .accept 9531 >>接任务: |cRXP_LOOT_间谍之树|r
step
    .goto Azuremyst Isle,39.4,73.9
	>>击杀剩余的根须陷阱者/雄鹿
    .complete 9463,1 --Collect Root Trapper Vine (x8)
	.complete 9454,1 --Collect Moongraze Stag Tenderloin (x6)
step
	.xp 8-950 >>刷到距离8级还差950点经验(3550/4500)为止. 如果可能, 尽量在碧蓝岗哨附近完成
step
    .goto Azuremyst Isle,49.780,51.938
    >>死亡后在碧蓝岗哨重生, 或者如果你距离碧蓝岗哨300码以内, 就直接跑过去
step
	.goto Azuremyst Isle,49.780,51.938
.target Acteon
>>与|cRXP_FRIENDLY_艾克提恩|r交谈
	.accept 9454 >>接任务: |cRXP_LOOT_狩猎月痕鹿|r
    .turnin 9454 >>交任务: |cRXP_FRIENDLY_狩猎月痕鹿|r
    .accept 10324 >>接任务: |cRXP_LOOT_狩猎月痕鹿|r
step
    .goto Azuremyst Isle,48.390,51.770
.target Anchorite Fateema
>>与 |cRXP_FRIENDLY_学者法蒂玛|r交谈
    .turnin 9463 >>交任务: |cRXP_FRIENDLY_医疗材料|r
.target Daedal
>>与|cRXP_FRIENDLY_丹达尔|r交谈
    .accept 9473 >>接任务: |cRXP_LOOT_备选方案的备选方案|r
step
    .goto Azuremyst Isle,48.9,51.1
.target Dulvi
>>与|cRXP_FRIENDLY_杜尔维|r交谈
    .accept 10428 >>接任务: |cRXP_LOOT_失踪的渔夫|r
step
    .goto Azuremyst Isle,49.365,51.086
.target Cryptographer Aurren
>>与|cRXP_FRIENDLY_译码者奥鲁恩|r交谈
    .accept 9538 >>接任务: |cRXP_LOOT_学外语......|r
step
	.goto Azuremyst Isle,49.365,51.086
	.use 23818 >>点击背包中的“止松熊怪语言入门”
    .complete 9538,1 --Stillpine Furbolg Language Primer Read
step
    .goto Azuremyst Isle,49.365,51.086
>>与|cRXP_FRIENDLY_阿基达图腾|r交谈
    .turnin 9538 >>交任务: |cRXP_FRIENDLY_学外语......|r
.target Totem of Akida
    .accept 9539 >>接任务: |cRXP_LOOT_库欧图腾|r
step << Shaman
    .goto Azuremyst Isle,48.05,50.41
    .trainer >>训练你的你的法术
step << Hunter
    .goto Azuremyst Isle,49.780,51.938
    .trainer >>训练你的你的法术
step << Priest
    .goto Azuremyst Isle,48.6,49.4
.target Guvan
>>与|cRXP_FRIENDLY_古安|r交谈
    .turnin 9586 >>交任务: |cRXP_FRIENDLY_帮助塔瓦拉|r
	 .trainer >>训练你的你的法术
step << Paladin
    .goto Azuremyst Isle,48.4,49.5
    .trainer >>训练你的你的法术
step << Mage
    .goto Azuremyst Isle,49.9,50.0
    .trainer >>训练你的你的法术
step << Warrior
    .goto Azuremyst Isle,50.023,50.515
    .trainer >>训练你的你的法术
step
	#sticky
	#completewith azuremyst2
	>>在任务过程中击杀夜行者/月痕巨鹿
    .complete 9456,1 --Kill Infected Nightstalker Runt (x8)
	.complete 10324,1
step
	>>路上刷怪
	.goto Azuremyst Isle,49.9,45.9,100,0
    .goto Azuremyst Isle,55.2,41.6
>>与|cRXP_FRIENDLY_库欧图腾|r交谈
    .turnin 9539 >>交任务: |cRXP_FRIENDLY_库欧图腾|r
.target Totem of Coo
    .accept 9540 >>接任务: |cRXP_LOOT_提克提图腾|r
step
	>>跳下悬崖, 或等待灵魂赐予缓慢下落效果
    .goto Azuremyst Isle,53.0,34.0
	>>拾取树干旁边的蓝色小花
    .complete 9473,1 --Collect Azure Snapdragon Bulb (x5)
step
    .goto Azuremyst Isle,64.4,39.8
>>与|cRXP_FRIENDLY_提克提图腾|r交谈
    .turnin 9540 >>交任务: |cRXP_FRIENDLY_提克提图腾|r
.target Totem of Tikti
    .accept 9541 >>接任务: |cRXP_LOOT_尤尔图腾|r
    .timer 30,Swim Speed Buff RP
    >>完成此任务后, 跟随熊怪灵魂前行, 待获得游泳速度加成后再进入水中
step
    .waypoint Azuremyst Isle,61.0,54.2,-29,wptimer,UNIT_AURA
    .waypoint Azuremyst Isle,61.0,54.2,-1
    .waypoint Azuremyst Isle,63.39,40.37,-1
    .goto Azuremyst Isle,61.0,54.2,0
    >>跟随熊怪的灵魂, 在获得游泳速度增益后再进入水中
    .use 23654>>在河边的鱼池上使用渔网, 如果从池中召唤出鱼人, 立即逃跑
    .complete 9452,1 --Collect Red Snapper (x10)
	>>避免与怪物战斗, 任何敌对行为都会让你失去游泳速度
step
    .goto Azuremyst Isle,61.0,54.2
>>与|cRXP_FRIENDLY_迪泰娜|r交谈
    .turnin 9452 >>交任务: |cRXP_FRIENDLY_美味的红钳鱼|r
.target Diktynna
    .accept 9453 >>接任务: |cRXP_LOOT_找到艾克提恩！|r
step
    .goto Azuremyst Isle,63.2,68.0
    >>点击水下的图腾
>>与|cRXP_FRIENDLY_尤尔图腾|r交谈
    .turnin 9541 >>交任务: |cRXP_FRIENDLY_尤尔图腾|r
.target Totem of Yor
    .accept 9542 >>接任务: |cRXP_LOOT_瓦克图腾|r
    .timer 71,Totem of Vark ghostsaber RP
step
	>>跟随熊怪的灵魂, 等待他将你转化成幽灵剑士
    .waypoint Azuremyst Isle,28.1,62.5,-70,wptimer,UNIT_AURA
    .goto Azuremyst Isle,28.1,62.5,0
    .waypoint Azuremyst Isle,28.1,62.5,-1
    .waypoint Azuremyst Isle,60.68,69.21,-1
>>与|cRXP_FRIENDLY_瓦克图腾|r交谈
    .turnin 9542 >>交任务: |cRXP_FRIENDLY_瓦克图腾|r
.target Totem of Vark
    .accept 9544 >>接任务: |cRXP_LOOT_阿基达的预言|r
step
	#label azuremyst2
    .goto Azuremyst Isle,27.3,63.9
	>>取消你的鬼剑增益效果
	>>击杀此区域附近的熊怪, 它们会掉落你需要的笼子钥匙
    .complete 9544,1 --Stillpine Captive Freed (x8)
step
    .goto Azuremyst Isle,28.6,70.0,100,0
	.goto Azuremyst Isle,30.1,72.7
	>>击杀夜行者/月痕巨鹿
	.complete 9456,1 --Kill Infected Nightstalker Runt (x8)
    .complete 10324,1 --Collect Moongraze Buck Hide (x6)
step
	#sticky
	#completewith treesteptime
	>>路上刷怪
    .collect 23759,1,9514 --Collect 写满符文的石板 (x1)
	.use 23759 >>拾取物品后, 请右键点击背包中的该物品
    .accept 9514>>写满符文的石板
step
    .goto Azuremyst Isle,31.4,79.3
	>>击杀纳迦/搜刮地面上发光的灯泡状物品
    .complete 9513,1 --Kill Wrathscale Myrmidon (x5)
    .complete 9513,2 --Kill Wrathscale Naga (x5)
    .complete 9513,3 --Kill Wrathscale Siren (x5)
    .complete 9523,1 --Collect Ancient Relic (x8)
step
    #label treesteptime
    .goto Azuremyst Isle,18.4,84.1
    .use 23792 >>在纳迦旗帜处使用树形伪装
	>>一旦使用伪装, 你就无法移动, 需等待约一分钟才能获得此任务的奖励
    .complete 9531,1
    .cast 30298
    .timer 82,Traitor Uncovered
step
    .goto Azuremyst Isle,16.5,94.4
>>与|cRXP_FRIENDLY_库雷|r交谈
    .turnin 10428 >>交任务: |cRXP_FRIENDLY_失踪的渔夫|r
.target Cowlen
    .accept 9527 >>接任务: |cRXP_LOOT_遗体|r
step
    .goto Azuremyst Isle,15.0,89.4
	>>击杀枭兽
    .complete 9527,1 --Collect Remains of Cowlen's Family (x1)
step
    .goto Azuremyst Isle,16.5,94.3
.target Cowlen
>>与|cRXP_FRIENDLY_库雷|r交谈
    .turnin 9527 >>交任务: |cRXP_FRIENDLY_遗体|r
step
	#sticky
	#completewith next
    .deathskip >>在碧蓝岗哨死亡并重生
step
    .goto Azuremyst Isle,47.0,70.3
.target Priestess Kyleen Il'dinare
>>与|cRXP_FRIENDLY_女牧师凯琳·伊尔迪纳尔|r交谈
    .turnin 9513 >>交任务: |cRXP_FRIENDLY_夺回废墟|r
.target Archaeologist Adamant Ironheart
>>与|cRXP_FRIENDLY_考古学家阿达曼特·铁心|r交谈
    .turnin 9523 >>交任务: |cRXP_FRIENDLY_贵重物品，小心轻放|r
>>与|cRXP_FRIENDLY_海军上将奥德修斯|r交谈
    .turnin 9531 >>交任务: |cRXP_FRIENDLY_间谍之树|r
.target Admiral Odesyus
    .accept 9537 >>接任务: |cRXP_LOOT_绳侏儒以法|r
    >>暂时不要提交符文覆盖的石板, 否则会触发一段较长的剧情序列
step
    .goto Azuremyst Isle,47.0,70.3
.target Priestess Kyleen Il'dinare
>>与|cRXP_FRIENDLY_女牧师凯琳·伊尔迪纳尔|r交谈
    .turnin 9514 >>交任务: |cRXP_FRIENDLY_写满符文的石板|r
step << Hunter
	#sticky
    .goto Azuremyst Isle,48.8,72.7
	>>沿海岸击杀螃蟹
    .complete 9512,1 --Collect Skittering Crawler Meat (x6)
step
    .goto Azuremyst Isle,50.2,70.6,40,0
    .goto Azuremyst Isle,45.7,73.2,40,0
    .goto Azuremyst Isle,50.2,70.6
	>>与在东南方海滩巡逻的工程师欧格林德交谈, 等待其对话序列后将其击杀
    .complete 9537,1 --Collect Traitor's Communication (x1)
    .skipgossip 17243
    .timer 18,Traitor's Communication RP
    .unitscan Engineer "Spark" Overgrind
step << Hunter
    .goto Azuremyst Isle,46.7,70.5
.target "Cookie" McWeaksauce
>>对话:|cRXP_FRIENDLY_"曲奇"米维克索斯|r交谈
    .turnin 9512 >>交任务: |cRXP_FRIENDLY_曲奇的大餐|r
step
    .goto Azuremyst Isle,47.036,70.212
>>与|cRXP_FRIENDLY_海军上将奥德修斯|r交谈
    .turnin 9537 >>交任务: |cRXP_FRIENDLY_绳侏儒以法|r
.target Admiral Odesyus
    .accept 9602 >>接任务: |cRXP_LOOT_邪恶的书信|r
step
    .goto Azuremyst Isle,47.127,70.289
.target Priestess Kyleen Il'dinare
>>与|cRXP_FRIENDLY_女牧师凯琳·伊尔迪纳尔|r交谈
    .accept 9515 >>Warlord Sriss'tiz
    .maxlevel 9
step << !Hunter
    #completewith next
    .goto Azuremyst Isle,27.0,76.7,60 >>The path to Warlord Sriss'tiz starts here
step << !Hunter
    >>Enter the naga cave and kill Warlord Sriss'tiz
    .goto Azuremyst Isle,24.5,74.5
    .complete 9515,1
    .isOnQuest 9515
step
    .goto Azuremyst Isle,49.9,51.9
    .xp 9+3070 >>升级至3070+/6500经验值
step
    #sticky
    #completewith next
    .deathskip >>死亡跳过或跑回碧蓝岗哨
step
    .goto Azuremyst Isle,49.9,51.9
.target Acteon
>>与|cRXP_FRIENDLY_艾克提恩|r交谈
    .turnin 9453 >>交任务: |cRXP_FRIENDLY_找到艾克提恩！|r
    .turnin 10324 >>交任务: |cRXP_FRIENDLY_狩猎月痕鹿|r
step
    .goto Azuremyst Isle,49.5,51.2
>>与|cRXP_FRIENDLY_止松部族的阿鲁古|r交谈
    .turnin 9544 >>交任务: |cRXP_FRIENDLY_阿基达的预言|r
.target Arugoo of the Stillpine
    .accept 9559 >>接任务: |cRXP_LOOT_止松要塞|r
step
    .goto Azuremyst Isle,48.5,51.5
.target Daedal
>>与|cRXP_FRIENDLY_丹达尔|r交谈
    .turnin 9473 >>交任务: |cRXP_FRIENDLY_备选方案的备选方案|r
step
    .goto Azuremyst Isle,47.2,50.7
>>与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9456 >>交任务: |cRXP_FRIENDLY_清理夜行豹......|r
    .turnin 9602 >>交任务: |cRXP_FRIENDLY_邪恶的书信|r
.target Exarch Menelaous
    .accept 9623 >>接任务: |cRXP_LOOT_成年|r << Hunter
step
    .goto Azuremyst Isle,47.2,50.7
    .isOnQuest 9612
    .goto Azuremyst Isle,47.2,50.7
.target Exarch Menelaous
>>与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9612 >>交任务: |cRXP_FRIENDLY_非常感谢！|r
step << Shaman
    .goto Azuremyst Isle,48.05,50.41
    .trainer >>训练你的10级法术
step << Hunter
    .goto Azuremyst Isle,49.780,51.938
    .trainer >>训练你的10级法术
step << Priest
    .goto Azuremyst Isle,48.6,49.4
	 .trainer >>训练你的10级法术
step << Paladin
    .goto Azuremyst Isle,48.4,49.5
    .trainer >>训练你的10级法术
step << Mage
    .goto Azuremyst Isle,49.9,50.0
    .trainer >>训练你的10级法术
step << Warrior
    .goto Azuremyst Isle,50.023,50.515
    .trainer >>训练你的10级法术
.target Ruada
>>与|cRXP_FRIENDLY_鲁安达|r交谈
    .accept 9582 >>接任务: |cRXP_LOOT_一人之力|r
step << Shaman
    .goto Azuremyst Isle,48.05,50.41
.target Tuluun
>>与|cRXP_FRIENDLY_图伦|r交谈
    .accept 9464 >>接任务: |cRXP_LOOT_火焰的召唤|r
step << Hunter
    .goto Azuremyst Isle,49.7,51.9
.target Acteon
.target Deremiis
.target Tristane Shadowstone
.target Einris Brightspear
.target Regnus Thundergranite
.target Dorion
.target Jocaste
.target Ayanna Everstride
.target Thorgas Grimson
>>与|cRXP_FRIENDLY_索加斯·格瑞姆森|r交谈
-->>与|cRXP_FRIENDLY_阿亚娜·远途|r交谈
-->>与|cRXP_FRIENDLY_祖卡斯特|r交谈
-->>与|cRXP_FRIENDLY_多利安|r交谈
-->>与|cRXP_FRIENDLY_雷格努斯·雷石|r交谈
-->>与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
-->>与|cRXP_FRIENDLY_提斯坦·影石|r交谈
-->>与|cRXP_FRIENDLY_德雷米斯|r交谈
-->>与|cRXP_FRIENDLY_艾克提恩|r交谈
    .accept 9757 >>接任务: |cRXP_LOOT_寻找女猎手凯拉·夜弓|r
step << Hunter
    .goto Azuremyst Isle,24.182,54.346
>>与|cRXP_FRIENDLY_女猎手凯拉·夜弓|r交谈
    .turnin 9757 >>交任务: |cRXP_FRIENDLY_寻找女猎手凯拉·夜弓|r
.target Huntress Kella Nightbow
    .accept 9591 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
    .goto Azuremyst Isle,20.7,65.1
	.use 23896 >>使用钓竿对付带刺爬行者. 它们出现在海岸更远处, 不要误以为是滑行爬行者
    .complete 9591,1 --Tame a Barbed Crawler
    .unitscan Barbed Crawler
step << Hunter
    #completewith next
    .goto Azuremyst Isle,27.0,76.7,60 >>The path to Warlord Sriss'tiz starts here
step << Hunter
    >>Enter the naga cave and kill Warlord Sriss'tiz
	.goto Azuremyst Isle,25.3,73.1,80,0
	.goto Azuremyst Isle,25.9,71.2,60,0
	.goto Azuremyst Isle,27.5,73.8,60,0
    .goto Azuremyst Isle,24.5,74.5
    .complete 9515,1
    .isOnQuest 9515
step << Hunter
    .goto Azuremyst Isle,24.182,54.346
>>与|cRXP_FRIENDLY_女猎手凯拉·夜弓|r交谈
    .turnin 9591 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
.target Huntress Kella Nightbow
    .accept 9592 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
    .goto The Exodar,81.480,51.428
    .turnin 9623 >>交任务: |cRXP_FRIENDLY_成年|r
    .accept 9625 >>接任务: |cRXP_LOOT_雷象可不是好玩的！|r
    --?
step << Hunter
    .goto Azuremyst Isle,35.4,35.0,80,0
	.goto Azuremyst Isle,39.0,31.2
	.use 23897 >>使用法杖对[巨型林地陆行鸟]施法
    .complete 9592,1 --Tame a Greater Timberstrider
step << Hunter
    .goto Azuremyst Isle,24.182,54.346
>>与|cRXP_FRIENDLY_女猎手凯拉·夜弓|r交谈
    .turnin 9592 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
.target Huntress Kella Nightbow
    .accept 9593 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
    .goto Azuremyst Isle,35.0,33.9
	.use 23898 >>使用法杖对[夜行豹]施法
    .complete 9593,1 --Tame a Nightstalker
step << Hunter
    .goto Azuremyst Isle,24.182,54.346
>>与|cRXP_FRIENDLY_女猎手凯拉·夜弓|r交谈
    .turnin 9593 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
.target Huntress Kella Nightbow
    .accept 9675 >>接任务: |cRXP_LOOT_野兽训练|r
step << Hunter
    #completewith next
    .goto Azuremyst Isle,24.6,49.0,35 >>通过后门进入埃索达
step << Hunter
	.goto The Exodar,42.0,71.4,60,0
	.goto The Exodar,44.6,72.0,60,0
    .goto The Exodar,44.1,86.6
.target Ganaar
>>与|cRXP_FRIENDLY_甘纳尔|r交谈
    .turnin 9675 >>交任务: |cRXP_FRIENDLY_野兽训练|r
	.trainer >>训练你的宠物法术 << tbc
step << Hunter
	#completewith next
    .goto The Exodar,47.9,89.
    >>删除旧箭. 确保装备上你购买的新箭
	.vendor >>购买6组锋利的箭
step << Hunter
	#sticky
	#completewith next
    >>与楼上武器大师交谈
	.goto The Exodar,51.1,80.5,40,0
    .goto The Exodar,53.3,85.7
    .train 202 >>学习双手剑技能
step << Hunter
	#completewith murloc1
	>>前往: |cRXP_PICK_秘蓝岛|r
	.goto The Exodar,57.9,61.5,50,0
	.goto The Exodar,53.0,35.0,80,0
	.goto The Exodar,64.0,36.5,60,0
        .goto Azuremyst Isle,44.7,23.5
	.zone Azuremyst Isle >>前往: |cRXP_PICK_秘蓝岛|r
	>>或者, 你可以在任何火盆上执行登出跳过, 或从城市中的任何边缘漂浮离开
	.link https://www.youtube.com/watch?v=WUWNGyQWJw8 >>点击此处参考
step << Hunter wotlk
	#sticky
	#label pet1
	.cast 1515 >>当你前往下一个任务枢纽时, 在途中对一只8级以上的小猫使用驯服野兽技能
step
    #label murloc1
    .goto Azuremyst Isle,44.7,23.5
.target Gurf
>>与|cRXP_FRIENDLY_古尔弗|r交谈
    .accept 9562 >>接任务: |cRXP_LOOT_鱼人......|r
step
    .goto Azuremyst Isle,44.8,23.8
.target Moordo
>>与|cRXP_FRIENDLY_莫多|r交谈
    .accept 9560 >>接任务: |cRXP_LOOT_末日的野兽！|r
step
    .goto Azuremyst Isle,46.6,20.7
.target High Chief Stillpine
>>与|cRXP_FRIENDLY_止松老酋长|r交谈
    .turnin 9559 >>交任务: |cRXP_FRIENDLY_止松要塞|r
step << Shaman
    #sticky
	#completewith next
	>>击杀掠夺者
    .complete 9560,1 --Collect Ravager Hide (x8)
step << Shaman
    .goto Azuremyst Isle,59.6,18.0
>>与|cRXP_FRIENDLY_坦普|r交谈
    .turnin 9464 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
.target Temper
    .accept 9465 >>接任务: |cRXP_LOOT_火焰的召唤|r
step << Hunter tbc
	#sticky
	#label pet1
    .goto Azuremyst Isle,54.7,18.4
	.cast 1515 >>对成型的掠食者施放驯服野兽, 以驯服它
step
    .goto Azuremyst Isle,54.7,18.4
	>>击杀掠夺者, 搜刮它们的兽皮
    .complete 9560,1 --Collect Ravager Hide (x8)
step << Warrior
    .goto Azuremyst Isle,54.1,9.8
    >>点击掠夺者笼子
    .complete 9582,1 --Kill Death Ravager (x1)
step
	#requires pet1 << Hunter
    .goto Azuremyst Isle,44.8,23.8
.target Moordo
>>与|cRXP_FRIENDLY_莫多|r交谈
    .turnin 9560 >>交任务: |cRXP_FRIENDLY_末日的野兽！|r
step
    .goto Azuremyst Isle,46.8,21.2
.target Stillpine the Younger
>>与|cRXP_FRIENDLY_止松酋长|r交谈
    .accept 9573 >>接任务: |cRXP_LOOT_欧莫鲁酋长|r
step
    .goto Azuremyst Isle,46.6,20.6
.target High Chief Stillpine
>>与|cRXP_FRIENDLY_止松老酋长|r交谈
    .accept 9565 >>接任务: |cRXP_LOOT_搜索止松要塞|r
step
    >>从洞穴尽头开始清理, 一直待在上层区域
	.goto Azuremyst Isle,47.4,14.0
    .complete 9573,1 --Kill Chieftain Oomooroo (x1)
    .complete 9573,2 --Kill Crazed Wildkin (x9)
step << Shaman
    .goto Azuremyst Isle,46.1,16.8
    >>继续击杀枭兽
    .complete 9465,1 --Collect Ritual Torch (x1)
step
    .goto Azuremyst Isle,50.6,11.6
    >>跳下并前往洞穴后方
    .turnin 9565 >>交任务: |cRXP_FRIENDLY_搜索止松要塞|r
    .accept 9566 >>接任务: |cRXP_LOOT_血水晶|r
    >>当你接近红水晶时, 很可能会发现一只名叫“库肯”的双头犬. 切勿击杀它, 此怪物是下一个任务的关键环节
step
    .goto Azuremyst Isle,46.7,20.8
.target High Chief Stillpine
>>与|cRXP_FRIENDLY_止松老酋长|r交谈
    .turnin 9566 >>交任务: |cRXP_FRIENDLY_血水晶|r
step
    .goto Azuremyst Isle,47.0,22.2
.target Kurz the Revelator
>>与|cRXP_FRIENDLY_启示者库尔兹|r交谈
    .accept 9570 >>接任务: |cRXP_LOOT_可怕的库肯|r
step
	#completewith next
	.goto Azuremyst Isle,46.9,22.0
	.vendor >>商人处, 如需可购买6格背包
step
    .goto Azuremyst Isle,46.8,21.2
.target Stillpine the Younger
>>与|cRXP_FRIENDLY_止松酋长|r交谈
    .turnin 9573 >>交任务: |cRXP_FRIENDLY_欧莫鲁酋长|r
step
    .goto Azuremyst Isle,49.9,12.8
	>>击杀库肯
    .complete 9570,1 --Collect The Kurken's Hide (x1)
step
    .goto Azuremyst Isle,47.0,22.2
>>与|cRXP_FRIENDLY_启示者库尔兹|r交谈
    .turnin 9570 >>交任务: |cRXP_FRIENDLY_可怕的库肯|r
.target Kurz the Revelator
    .accept 9571 >>接任务: |cRXP_LOOT_库肯的毛皮|r
step << Shaman
    .goto Azuremyst Isle,46.7,20.8
.target High Chief Stillpine
>>与|cRXP_FRIENDLY_止松老酋长|r交谈
    .accept 9622 >>接任务: |cRXP_LOOT_警告你的人民|r
step
	#label end
    .goto Azuremyst Isle,44.8,23.8
.target Moordo
>>与|cRXP_FRIENDLY_莫多|r交谈
    .turnin 9571 >>交任务: |cRXP_FRIENDLY_库肯的毛皮|r
step << Shaman
    .goto Azuremyst Isle,59.6,17.9
>>与|cRXP_FRIENDLY_坦普|r交谈
    .turnin 9465 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
.target Temper
    .accept 9467 >>接任务: |cRXP_LOOT_火焰的召唤|r
step << Shaman
	.hs >>炉石传送至碧蓝岗哨
step << Shaman
    .goto Azuremyst Isle,47.112,50.604
.target Exarch Menelaous
>>与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9622 >>交任务: |cRXP_FRIENDLY_警告你的人民|r
step << Shaman
    #sticky
	#completewith next
    >>点击背包中的防火背包
    .complete 9467,2 --Collect Ritual Torch (x1)
step << Shaman
    .goto Azuremyst Isle,11.3,82.3
    >>点击柳条人召唤赫图尔
    .complete 9467,1 --Collect Hauteur's Ashes (x1)
step << Shaman
    .goto Azuremyst Isle,59.5,18.0
    .use 24335>>使用背包中的法球传送回灰烬林地
>>与|cRXP_FRIENDLY_坦普|r交谈
    .turnin 9467 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
.target Temper
    .accept 9468 >>接任务: |cRXP_LOOT_火焰的召唤|r
step
	#sticky
	#label SGrain
    .goto Azuremyst Isle,34.1,18.0,0,0
	>>击杀该区域的鱼人. 搜刮他们的谷物
    .complete 9562,1 --Collect Stillpine Grain (x5)
step
    .goto Azuremyst Isle,34.0,25.9,70,0
    .goto Azuremyst Isle,34.9,12.0,60,0
    .goto Azuremyst Isle,34.0,25.9
    >>击杀并掠夺穆尔古鲁加. 他会在海岸区域巡逻, 请小心, 他的伤害非常高
	.unitscan Murgurgula
	.use 23850 >>拾取物品栏中的“古尔弗的尊严”并点击
	.collect 23850,1,9564 --Gurf's Dignity (1)
    .accept 9564 >>接任务: |cRXP_LOOT_古尔弗的尊严|r
step
	#requires SGrain
    .goto Bloodmyst Isle,63.5,88.8
	.zone Bloodmyst Isle >>前往: |cRXP_PICK_秘血岛|r
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Alliance
#name 11-20 秘血岛(德莱尼)
#displayname 11-20 秘血岛(德莱尼) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor Draenei
#next RestedXP 联盟 20-32/20-21 黑海岸(德莱尼)
step
    .goto Bloodmyst Isle,63.5,88.8
.target Aonar
>>与|cRXP_FRIENDLY_奥纳尔|r交谈
    .accept 9624 >>接任务: |cRXP_LOOT_美味的点心|r
step
    #completewith next
    .goto Bloodmyst Isle,63.1,88.0
.target Vorkhan the Elekk Herder
>>与|cRXP_FRIENDLY_雷象管理者沃克汉|r交谈
    .turnin 9625 >>交任务: |cRXP_FRIENDLY_雷象可不是好玩的！|r
step
    .goto Bloodmyst Isle,63.1,88.0
.target Vorkhan the Elekk Herder
>>与|cRXP_FRIENDLY_雷象管理者沃克汉|r交谈
    .accept 9634 >>接任务: |cRXP_LOOT_大战异型掠夺者|r
step
	.goto Bloodmyst Isle,59.7,86.8
    >>在升级时享用外星掠食者/美味的点心
    .xp 12-2000
step
    #completewith next
    .deathskip>>在秘血岗哨死亡并重生
step
    .goto Bloodmyst Isle,55.7,59.7
.target Caregiver Topher Loaal
>>与|cRXP_FRIENDLY_Caregiver 托菲尔·罗阿|r交谈
    .accept 9603 >>接任务: |cRXP_LOOT_床铺，绷带，以及更多|r
step
	#completewith next
	.goto Bloodmyst Isle,55.7,59.7
    .home >>将你的炉石设置为秘血岗哨
step
	#completewith next
	.goto Bloodmyst Isle,55.7,59.7
	.vendor >>购买40瓶冰镇牛奶 << Mage/Priest
	.vendor >>购买40条长嘴泥鳅 << Warrior
	.vendor >>购买5级食物/饮品 << Paladin/Shaman
    .vendor >>为本人及宠物购买水和食物 << Hunter
step
    .goto Bloodmyst Isle,56.421,56.788
.target Jessera of Mac'Aree
>>与|cRXP_FRIENDLY_麦卡瑞的杰瑟拉|r交谈
    .accept 9648 >>接任务: |cRXP_LOOT_玛特帕尔姆蘑菇展|r
step
	#completewith next
    .goto Bloodmyst Isle,57.6,54.0
    .fp Blood Watch>>获取秘血岗哨的飞行路径
step
    .goto Bloodmyst Isle,57.6,54.0
.target Laando
>>与|cRXP_FRIENDLY_兰度|r交谈
    .turnin 9603 >>交任务: |cRXP_FRIENDLY_床铺，绷带，以及更多|r
    >>跳过后续任务
step
    .goto Bloodmyst Isle,52.7,53.3
.target Exarch Admetius
>>与|cRXP_FRIENDLY_主教埃德门图斯|r交谈
    .accept 9693 >>接任务: |cRXP_LOOT_阿古斯的意义|r
.target Harbinger Mikolaas
>>与|cRXP_FRIENDLY_先行官米库拉斯|r交谈
    .accept 9581 >>接任务: |cRXP_LOOT_研究水晶|r
step
    .goto Bloodmyst Isle,55.421,55.232
>>与|cRXP_FRIENDLY_守备官波鲁斯|r交谈
    .turnin 9693 >>交任务: |cRXP_FRIENDLY_阿古斯的意义|r
.target Vindicator Boros
    .accept 9694 >>接任务: |cRXP_LOOT_秘血岗哨|r
step
	#sticky
	#completewith monument
	>>从秘血岛上的任意怪物身上收集辐射水晶碎片. 不要丢弃这些碎片
	.collect 23984,10 -- Collect Irradiated Crystal Shard (x10)
step
    .goto Bloodmyst Isle,48.4,47.9
	>>注意, 这些怪物在这个等级上很难对付
    .complete 9694,1 --Kill Sunhawk Spy (x10)
step
    .goto Bloodmyst Isle,55.4,55.3
.target Vindicator Boros
>>与|cRXP_FRIENDLY_守备官波鲁斯|r交谈
    .turnin 9694 >>交任务: |cRXP_FRIENDLY_秘血岗哨|r
step
    .goto Bloodmyst Isle,53.3,57.7
.target Morae
>>与|cRXP_FRIENDLY_莫莱|r交谈
    .accept 9629 >>接任务: |cRXP_LOOT_研究鱼人|r
step
	#sticky
	#completewith bloodmyst2
    .goto Bloodmyst Isle,51.1,81.4,0
	>>在秘血岛中寻找小型红蘑菇
    .complete 9648,2 --Collect Blood Mushroom (x1)
step
	#sticky
	#completewith next
    .goto Bloodmyst Isle,58.2,83.4
	>>在水下拾取一个大红蘑菇, 或杀死一条鱼并从中获取水生臭角菇
	.complete 9648,1 -- Loot an Aquatic Stinkhorn (x1)
step
	.goto Bloodmyst Isle,58.2,83.4
	.use 23875 >>使用背包里的镐子收集小红水晶
    .complete 9581,1 --Collect Impact Site Crystal Sample (x1)
step
	#completewith grind3800
    .goto Bloodmyst Isle,59.3,89.1,0
	>>收集地上的小梨. 它们不容易发现, 记得在树周围仔细查找
    .complete 9624,1 --Collect Sand Pear (x10)
step
    .goto Bloodmyst Isle,59.3,89.1
    .complete 9634,1 --Kill Bloodmyst Hatchling (x10)
step
    .isQuestTurnedIn 9515
    .goto Bloodmyst Isle,59.3,89.1
	.xp 12+3300 >>刷怪直到获得3300点经验值, 升到12级(3300+10100)
step
	#label grind3800
	.goto Bloodmyst Isle,59.3,89.1
	.xp 12+4140 >>刷怪直到经验达到4140, 升到12级(4140+/10100)
step
    .goto Bloodmyst Isle,67.9,87.9,50,0
    .goto Bloodmyst Isle,66.9,84.5,50,0
    .goto Bloodmyst Isle,60.1,86.1,50,0
    .goto Bloodmyst Isle,58.6,92.6,50,0
    .goto Bloodmyst Isle,67.9,87.9,50,0
    .goto Bloodmyst Isle,66.9,84.5,50,0
    .goto Bloodmyst Isle,60.1,86.1,50,0
    .goto Bloodmyst Isle,58.6,92.6
	>>收集地上的小梨. 它们不容易发现, 记得在树周围仔细查找
    .complete 9624,1 --Collect Sand Pear (x10)
step
    .goto Bloodmyst Isle,63.4,88.7
.target Aonar
>>与|cRXP_FRIENDLY_奥纳尔|r交谈
    .turnin 9624 >>交任务: |cRXP_FRIENDLY_美味的点心|r
step
    .goto Bloodmyst Isle,63.1,87.9
.target Vorkhan the Elekk Herder
>>与|cRXP_FRIENDLY_雷象管理者沃克汉|r交谈
    .turnin 9634 >>交任务: |cRXP_FRIENDLY_大战异型掠夺者|r
step
    .goto Bloodmyst Isle,63.1,87.6
.target Kessel
>>与|cRXP_FRIENDLY_凯希尔|r交谈
    .accept 9663 >>接任务: |cRXP_LOOT_凯希尔的信使|r
	>>请注意, 这是一个限时任务
step
    .goto Azuremyst Isle,46.6,20.7
	.accept 9622 >>接任务: |cRXP_LOOT_警告你的人民|r << !Shaman
    .complete 9663,1 --High Chief Stillpine Warned
	*IMPORTANT: Do not engage any mobs, attacking or casting spells will dismount you, if you get dazed by getting hit from behind you will also dismount
step
    .goto Azuremyst Isle,44.7,23.5
.target Gurf
>>与|cRXP_FRIENDLY_古尔弗|r交谈
    .turnin 9564 >>交任务: |cRXP_FRIENDLY_古尔弗的尊严|r
    .turnin 9562 >>交任务: |cRXP_FRIENDLY_鱼人......|r
step << Warrior
	#completewith kesselrun
    .goto Azuremyst Isle,50.0,50.6
>>与|cRXP_FRIENDLY_鲁安达|r交谈
    .turnin 9582 >>交任务: |cRXP_FRIENDLY_一人之力|r
.target Ruada
    .accept 10350 >>接任务: |cRXP_LOOT_贝霍玛特|r
	.trainer >>训练你的12级法术
step << !Shaman
	.isOnQuest 9612
    .goto Azuremyst Isle,47.1,50.5
	.turnin 9612 >>交任务: |cRXP_FRIENDLY_非常感谢！|r
    .turnin 9622 >>交任务: |cRXP_FRIENDLY_警告你的人民|r
    .complete 9663,2 --Exarch Menelaous Warned
step << !Shaman
    .goto Azuremyst Isle,47.1,50.5
    .turnin 9622 >>交任务: |cRXP_FRIENDLY_警告你的人民|r
    .complete 9663,2 --Exarch Menelaous Warned
step << Shaman
    .goto Azuremyst Isle,48.05,50.41
>>与|cRXP_FRIENDLY_图伦|r交谈
    .turnin 9468 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
.target Tuluun
    .accept 9461 >>接任务: |cRXP_LOOT_火焰的召唤|r
step << Shaman
	#completewith next
	.isOnQuest 9612
    .goto Azuremyst Isle,47.1,50.5
	.turnin 9612 >>交任务: |cRXP_FRIENDLY_非常感谢！|r
    .complete 9663,2 --Exarch Menelaous Warned
	   .trainer >>训练你的12级法术
step << Shaman
    .goto Azuremyst Isle,47.1,50.5
    .complete 9663,2 --Exarch Menelaous Warned
step << Hunter
	#completewith next
    .goto Azuremyst Isle,49.780,51.938
    .trainer >>训练你的12级法术
step << Priest
	#completewith next
    .goto Azuremyst Isle,48.6,49.4
	 .trainer >>训练你的12级法术
step << Mage
	#completewith next
    .goto Azuremyst Isle,49.9,50.0
    .trainer >>训练你的12级法术
step
	#label kesselrun
    .goto Azuremyst Isle,46.9,70.3
    .complete 9663,3 --Admiral Odesyus Warned
step
    .goto Azuremyst Isle,46.9,70.3
.target Priestess Kyleen Il'dinare
>>与|cRXP_FRIENDLY_女牧师凯琳·伊尔迪纳尔|r交谈
    .turnin 9515 >>Warlord Sriss'tiz
    .isQuestComplete 9515
step << Paladin
    #completewith next
    .goto Azuremyst Isle,24.6,49.4,30 >>通过后门进入埃索达
step << Paladin
	.goto The Exodar,51.0,46.8,80,0
    .goto The Exodar,38.5,82.5
.target Jol
>>与|cRXP_FRIENDLY_约尔|r交谈
    .accept 9598 >>接任务: |cRXP_LOOT_救赎|r
    .turnin 9598 >>交任务: |cRXP_FRIENDLY_救赎|r
    .accept 9600 >>接任务: |cRXP_LOOT_救赎|r
	.trainer >>训练你的12级法术
step << !Shaman
	#completewith next
	.hs >>炉石传送至秘血岗哨
step << Shaman
	#completewith next
	.hs >>前往秘血岗哨. 如果你的传送门仍在冷却中, 请骑乘前往埃索达, 然后飞往秘血岗哨
step
    .goto Bloodmyst Isle,52.7,53.3
>>与|cRXP_FRIENDLY_先行官米库拉斯|r交谈
    .turnin 9581 >>交任务: |cRXP_FRIENDLY_研究水晶|r
.target Harbinger Mikolaas
    .accept 9620 >>接任务: |cRXP_LOOT_失踪的测量小组|r
step
    .goto Bloodmyst Isle,55.081,57.958
.target Vindicator Aalesia
>>与|cRXP_FRIENDLY_守备官艾蕾希亚|r交谈
    .accept 9567 >>接任务: |cRXP_LOOT_知己知彼|r
step << Warrior/Rogue
    .goto Bloodmyst Isle,55.2,58.2
    .collect 25873,1 >>从莫里亚德购买一把破损的锋利飞刀
step
    .goto Bloodmyst Isle,63.1,87.7
>>与|cRXP_FRIENDLY_凯希尔|r交谈
    .turnin 9663 >>交任务: |cRXP_FRIENDLY_凯希尔的信使|r
.target Kessel
    .accept 9666 >>接任务: |cRXP_LOOT_展示力量|r
step
    .goto Bloodmyst Isle,68.2,81.1
.target Princess Stillpine
>>与|cRXP_FRIENDLY_止松公主|r交谈
    .accept 9667 >>接任务: |cRXP_LOOT_拯救止松公主|r
step << Paladin
    .goto Bloodmyst Isle,65.0,77.5
	.use 6866 >>对已死亡的熊怪萨满使用生命符文
    .complete 9600,1 --Young Furbolg Shaman Resurrected (1)
step
	#sticky
	#label Polyspore
	>>在纳迦废墟的树周围拾取一朵蓝色小蘑菇
    .complete 9648,3 --Collect Ruinous Polyspore (x1)
    .goto Bloodmyst Isle,66.5,69.9,0,0
step
    .goto Bloodmyst Isle,66.9,70.2,50,0
    .goto Bloodmyst Isle,67.3,68.0,50,0
    .goto Bloodmyst Isle,68.9,68.0
	.use 24084 >>击杀西兹领主. 将你背包中的德莱尼军旗使用在他的尸体上
    .complete 9666,2 --Kill Lord Xiz (x1)
    .complete 9666,1 --Declaration of Power (1)
step
	#sticky
	#requires Polyspore
	#completewith next
    .goto Bloodmyst Isle,64.2,76.8
    >>击杀熊怪, 直到刺臂酋长现身. 击杀刺臂酋长并从他身上获取钥匙
	.unitscan High Chief Bristlelimb
    .collect 24099,1 --Collect The High Chief's Key (x1)
step
	#requires Polyspore
    .goto Bloodmyst Isle,68.2,81.1
    .complete 9667,1 --Free Saving Princess Stillpine
step
    .goto Bloodmyst Isle,63.0,87.6
>>与|cRXP_FRIENDLY_凯希尔|r交谈
    .turnin 9666 >>交任务: |cRXP_FRIENDLY_展示力量|r
.target Kessel
    .accept 9668 >>接任务: |cRXP_LOOT_向主教埃德门图斯报告|r
step
    .goto Bloodmyst Isle,56.0,79.5
	>>在水下拾取一个大红蘑菇, 或者杀死一条鱼并拾取其掉落物品
    .complete 9648,1 --Collect Aquatic Stinkhorn (x1)
step
	#completewith next
    .goto Bloodmyst Isle,35.6,94.2,0
    .goto Bloodmyst Isle,51.3,93.9,0
	.use 23995 >>使用背包中的黑泥标记器标记侦察兵, 这样它们就不会再对你产生敌意
    .complete 9629,1 --Blacksilt Scouts Tagged (x6)
step
    .goto Bloodmyst Isle,51.1,93.1,70,0
    .goto Bloodmyst Isle,43.0,94.4,70,0
    .goto Bloodmyst Isle,35.1,93.7
	.line Bloodmyst Isle,51.1,93.1,43.0,94.4,35.1,93.7
	.use 23870 >>击杀在鱼人营地附近巡逻的名为克鲁芬的鱼人. 击杀后拾取吊坠, 使用背包中的吊坠
	.collect 23870,1,9576 --Red Crystal Pendant (1)
    .accept 9576 >>接任务: |cRXP_LOOT_克鲁芬的项链|r
	.unitscan Cruelfin
step
    .goto Bloodmyst Isle,35.6,94.2,70,0
    .goto Bloodmyst Isle,51.3,93.9
	.use 23995 >>使用背包中的黑泥标记器标记侦察兵, 这样它们就不会再对你产生敌意
    .complete 9629,1 --Blacksilt Scouts Tagged (x6)
step
	#sticky
	#label greenmushroom
	>>在萨蒂尔区域附近寻找小型绿色蘑菇
    .complete 9648,4 --Collect Fel Cone Fungus (x1)
step
	#sticky
	#label monument
    .goto Bloodmyst Isle,36.5,71.5
	>>点击纪念碑上的小标志
    .complete 9567,1 --Collect Nazzivus Monument Glyph (x1)
step
    .goto Bloodmyst Isle,38.2,81.7,60,0
	.goto Bloodmyst Isle,36.5,71.5,60,0
	.goto Bloodmyst Isle,38.2,81.7
    .use 23900 >>击杀在召唤符文与纪念碑符文之间游荡的命名恶魔守卫瑟拉克(他会在该区域消失, 随后重新出现在召唤符文处). 击败后拾取他的护甲板, 然后在背包中点击使用
	.collect 23900,1,9594 --Tzerak's Armor Plate
    .accept 9594 >>接任务: |cRXP_LOOT_军团的徽记|r
	.unitscan Tzerak
    *Each respawn/despawn cycle takes about 6-7 minutes total
    --TODO: ??? bugged on wotlk beta
step
    .goto Bloodmyst Isle,37.0,78.7
	>>击杀该区域的萨特和魔誓者. 你可能需要击杀潜行者, 以强制刷新你需要的萨特
    .complete 9594,1 --Kill Nazzivus Satyr (x8)
    .complete 9594,2 --Kill Nazzivus Felsworn (x8)
step << Shaman
	#sticky
	#completewith next
	.hs Blood Watch >>如果你的传送点已激活, 就传送到秘血岗哨
step
	#requires greenmushroom
    .goto Bloodmyst Isle,53.3,57.6
>>与|cRXP_FRIENDLY_莫莱|r交谈
    .turnin 9576 >>交任务: |cRXP_FRIENDLY_克鲁芬的项链|r
    .turnin 9629 >>交任务: |cRXP_FRIENDLY_研究鱼人|r
.target Morae
    .accept 9574 >>接任务: |cRXP_LOOT_腐蚀的牺牲品|r
step
    .goto Bloodmyst Isle,50.6,74.4
	>>击杀该区域周围的树人, 收集它们的树皮. 在前往树人途中进行刷怪
    .complete 9574,1 --Collect Crystallized Bark (x6)
step
    .goto Bloodmyst Isle,53.3,57.8
.target Morae
>>与|cRXP_FRIENDLY_莫莱|r交谈
    .turnin 9574 >>交任务: |cRXP_FRIENDLY_腐蚀的牺牲品|r
step
	#completewith next
	.goto Bloodmyst Isle,53.3,56.7
	.vendor >>NPC与修理 << !Hunter
	.vendor >>购买一个中型箭袋并补充箭矢 << Hunter
step
    .goto Bloodmyst Isle,55.1,59.2
    .accept 9646 >>接任务: |cRXP_LOOT_通缉：死爪|r
step
    .goto Bloodmyst Isle,55.0,58.1
.target Vindicator Aalesia
>>与|cRXP_FRIENDLY_守备官艾蕾希亚|r交谈
    .turnin 9594 >>交任务: |cRXP_FRIENDLY_军团的徽记|r
    .turnin 9567 >>交任务: |cRXP_FRIENDLY_知己知彼|r
step
    .goto Bloodmyst Isle,55.2,56.0
.target Stillpine Ambassador Frasaboo
>>与|cRXP_FRIENDLY_止松大使欧罗尔格|r交谈
    .turnin 9667 >>交任务: |cRXP_FRIENDLY_拯救止松公主|r
step
    .goto Bloodmyst Isle,56.4,56.7
.target Jessera of Mac'Aree
>>与|cRXP_FRIENDLY_麦卡瑞的杰瑟拉|r交谈
    .turnin 9648 >>交任务: |cRXP_FRIENDLY_玛特帕尔姆蘑菇展|r
step
    .goto Bloodmyst Isle,55.4,55.3
.target Vindicator Boros
>>与|cRXP_FRIENDLY_守备官波鲁斯|r交谈
    .accept 9641 >>接任务: |cRXP_LOOT_辐射水晶碎片|r
    .accept 9779 >>接任务: |cRXP_LOOT_拦截情报|r
step
	.goto Bloodmyst Isle,55.4,55.4
	.itemcount 23984,10
.target Vindicator Boros
>>与|cRXP_FRIENDLY_守备官波鲁斯|r交谈
	.turnin 9641,3 >>交任务: |cRXP_FRIENDLY_辐射水晶碎片|r << Warrior/Paladin/Hunter/Rogue/Shaman
    .turnin 9641,2 >>交任务: |cRXP_FRIENDLY_辐射水晶碎片|r << Mage/Priest/Warlock
    .turnin 9641 >>交任务: |cRXP_FRIENDLY_辐射水晶碎片|r << Druid
step
    .itemcount 23984,10
    .goto Bloodmyst Isle,55.421,55.232
.target Vindicator Boros
>>与|cRXP_FRIENDLY_守备官波鲁斯|r交谈
    .turnin 9642,3 >>交任务: |cRXP_FRIENDLY_更多辐射水晶碎片|r << Warrior/Paladin/Hunter/Rogue/Shaman
    .turnin 9642,2 >>交任务: |cRXP_FRIENDLY_更多辐射水晶碎片|r << Warlock/Priest/Mage
    .turnin 9642 >>交任务: |cRXP_FRIENDLY_更多辐射水晶碎片|r << Druid
step
    .goto Bloodmyst Isle,61.1,48.6
>>与|cRXP_FRIENDLY_德莱尼制图师|r交谈
    .turnin 9620 >>交任务: |cRXP_FRIENDLY_失踪的测量小组|r
.target Draenei Cartographer
    .accept 9628 >>接任务: |cRXP_LOOT_夺回数据|r
step
    .goto Bloodmyst Isle,62.7,47.6
	>>击杀纳迦直到获得调查数据水晶
    .complete 9628,1 --Collect Survey Data Crystal (x1)
step
    .goto Bloodmyst Isle,52.7,53.3
>>与|cRXP_FRIENDLY_先行官米库拉斯|r交谈
    .turnin 9628 >>交任务: |cRXP_FRIENDLY_夺回数据|r
.target Harbinger Mikolaas
    .accept 9584 >>接任务: |cRXP_LOOT_第二份样本|r
.target Exarch Admetius
>>与|cRXP_FRIENDLY_主教埃德门图斯|r交谈
    .turnin 9668 >>交任务: |cRXP_FRIENDLY_向主教埃德门图斯报告|r
step
    #sticky
	#label Missive
	#completewith mailbox
	.goto Bloodmyst Isle,48.1,47.6
	>>击杀该区域周围的精灵
    .complete 9779,1 --Collect Sunhawk Missive (x1)
step
    .goto Bloodmyst Isle,45.7,47.8
	.use 23876 >>使用背包里的镐子收集小红水晶
    .complete 9584,1 --Collect Altered Crystal Sample (x1)
step
	.goto Bloodmyst Isle,48.1,47.6
	.xp 15-1200
step
	#sticky
    #level 15
	#requires Missive
	#label mailbox
	.goto Bloodmyst Isle,55.0,59.3,100,0
	.goto Bloodmyst Isle,55.3,55.3,100,0
	.goto Bloodmyst Isle,52.681,53.175,80,0
	.goto Bloodmyst Isle,55.0,59.3
	>>与信使赫米修斯交谈, 他会在秘血岗哨附近巡逻
	.unitscan Messenger Hermesius
.target Messenger Hermesius
>>与|cRXP_FRIENDLY_信使赫米修斯|r交谈
	.turnin 9671
step
    #requires Missive
	.goto Bloodmyst Isle,52.681,53.175
>>与|cRXP_FRIENDLY_先行官米库拉斯|r交谈
    .turnin 9584 >>交任务: |cRXP_FRIENDLY_第二份样本|r
.target Harbinger Mikolaas
    .accept 9585 >>接任务: |cRXP_LOOT_最终的样本|r
step
    .goto Bloodmyst Isle,55.3,55.3
>>与|cRXP_FRIENDLY_守备官波鲁斯|r交谈
    .turnin 9779 >>交任务: |cRXP_FRIENDLY_拦截情报|r
.target Vindicator Boros
    .accept 9696 >>接任务: |cRXP_LOOT_翻译......|r
step << Paladin
	.goto Bloodmyst Isle,55.6,55.3
	.trainer >>在守备官伊索姆处学习职业法术
step
    .goto Bloodmyst Isle,54.5,54.6
    .turnin -9696 >>交任务: |cRXP_FRIENDLY_翻译……|r
.target Interrogator Elysia
>>与|cRXP_FRIENDLY_审讯者埃莉西亚|r交谈
    .accept 9698 >>接任务: |cRXP_LOOT_会见先知|r
step
    .xp 15
step
	#requires mailbox
	.use 24132 >>打开邮箱, 取出纸条并接受任务
    .goto Bloodmyst Isle,55.1,59.1
	.collect 24132,1,9672 --Collect A Letter from the Admiral
    .accept 9672 >>接任务: |cRXP_LOOT_血咒的遗产|r
step
	#sticky
	#completewith next
	.vendor >>进入并从托弗那里购买15级食物 << Warrior/Rogue/Shaman/Paladin
	.vendor >>如果需要, 也可购买冰镇牛奶或果汁 << Priest/Shaman/Paladin
step
    .goto Bloodmyst Isle,55.0,57.8
.target Vindicator Aalesia
>>与|cRXP_FRIENDLY_守备官艾蕾希亚|r交谈
    .accept 9569 >>接任务: |cRXP_LOOT_化解危机|r
step
    .goto Bloodmyst Isle,55.8,57.0
.target Tracker Lyceon
>>与|cRXP_FRIENDLY_追踪者兰塞恩|r交谈
    .accept 9580 >>接任务: |cRXP_LOOT_猎熊|r
    .accept 9643 >>接任务: |cRXP_LOOT_荆棘巨藤|r
step
    .goto Bloodmyst Isle,56.3,56.8
.target Jessera of Mac'Aree
>>与|cRXP_FRIENDLY_麦卡瑞的杰瑟拉|r交谈
    .accept 9649 >>接任务: |cRXP_LOOT_伊瑟拉之泪|r
step
    .goto Bloodmyst Isle,74.7,33.7
	>>路上刷怪
.target Prince Toreth
>>与托雷斯王子交谈|cRXP_FRIENDLY_托雷斯王子|r
    .accept 9687 >>接任务: |cRXP_LOOT_找回尊严|r
step
	#sticky
	#label yserasTear
	>>收集岛上周围的绿色小蘑菇. 尽量避开幼龙怪物
    .complete 9649,1 --Collect Ysera's Tear (x2)
step
    .goto Bloodmyst Isle,79.1,22.6
>>与|cRXP_FRIENDLY_艾德华·汉斯船长|r交谈
    .turnin 9672 >>交任务: |cRXP_FRIENDLY_血咒的遗产|r
.target Captain Edward Hanes
    .accept 9674 >>接任务: |cRXP_LOOT_血咒纳迦|r
step
    .goto Bloodmyst Isle,80.0,16.9
	>>如果你死亡, 请再次找船长交谈以获得另一个水下呼吸效果
    .complete 9674,1 --Kill Bloodcursed Naga (x10)
step
    .goto Bloodmyst Isle,79.1,22.6
.target Captain Edward Hanes
>>与|cRXP_FRIENDLY_艾德华·汉斯船长|r交谈
    .turnin 9674 >>交任务: |cRXP_FRIENDLY_血咒纳迦|r
step
    .goto Bloodmyst Isle,79.1,22.6
.target Captain Edward Hanes
>>与|cRXP_FRIENDLY_艾德华·汉斯船长|r交谈
    .accept 9682 >>接任务: |cRXP_LOOT_绝望者......|r
    .maxlevel 15
step
    .goto Bloodmyst Isle,87.3,16.6
    .complete 9682,1 --Collect Bloodcursed Soul (x4)
    .isOnQuest 9682
step
    .goto Bloodmyst Isle,79.2,22.7
.target Captain Edward Hanes
>>与|cRXP_FRIENDLY_艾德华·汉斯船长|r交谈
    .turnin 9682 >>交任务: |cRXP_FRIENDLY_绝望者......|r
    .isOnQuest 9682
step
    .isOnQuest 9682
    .abandon 9682 >>抛弃绝望者……
step
    .goto Bloodmyst Isle,79.2,22.7
.target Captain Edward Hanes
>>与|cRXP_FRIENDLY_艾德华·汉斯船长|r交谈
    .accept 9683 >>接任务: |cRXP_LOOT_血咒的终结|r
    .isQuestTurnedIn 9682
step
	#requires yserasTear
    .goto Bloodmyst Isle,86.0,54.5
    >>游到南方的岛屿, 爬上山顶, 点击雕像召唤阿托夫
    .complete 9683,1 --Kill Atoph the Bloodcursed (x1)
    *Atoph is level 19, proceed with caution
    .isOnQuest 9683
step << Shaman/Paladin wotlk/Hunter
    .goto Bloodmyst Isle,79.2,22.7
.target Captain Edward Hanes
>>与|cRXP_FRIENDLY_艾德华·汉斯船长|r交谈
    .turnin 9683 >>交任务: |cRXP_FRIENDLY_血咒的终结|r
    .isOnQuest 9683
    .xp 16-2190,1
step << Shaman/Paladin wotlk/Hunter
	.xp 16-2190 --Making sure we get to level 16 before going into exodar for training
step
	#sticky
	#completewith next
	.deathskip >>死亡跳转至秘血岗哨
step
    .goto Bloodmyst Isle,56.4,56.7
.target Jessera of Mac'Aree
>>与|cRXP_FRIENDLY_麦卡瑞的杰瑟拉|r交谈
    .turnin 9649 >>交任务: |cRXP_FRIENDLY_伊瑟拉之泪|r
step
    .goto Bloodmyst Isle,57.6,53.9
.target Laando
>>与|cRXP_FRIENDLY_兰度|r交谈
    .accept 9604 >>接任务: |cRXP_LOOT_乘坐角鹰兽|r
step
    .goto Bloodmyst Isle,57.6,53.9
    .fly The Exodar>>飞往埃索达
step
	.goto The Exodar,75.0,54.8,80,0
	.goto The Exodar,64.4,42.4,80,0
    .goto The Exodar,57.008,50.065
>>与|cRXP_FRIENDLY_努古尼|r交谈
    .turnin 9604 >>交任务: |cRXP_FRIENDLY_乘坐角鹰兽|r
.target Nurguni
    .accept 9605 >>接任务: |cRXP_LOOT_斯泰法努斯|r
step << Warrior
.target Behomat
>>与|cRXP_FRIENDLY_贝霍玛特|r交谈
    .turnin 10350 >>交任务: |cRXP_FRIENDLY_贝霍玛特|r
    .goto The Exodar,55.579,82.269
    >>和楼上的武器大师交谈
    .train 199 >>学习2小时锤类武器技能
    .goto The Exodar,53.3,85.7
step << Shaman
    >>和楼上的武器大师交谈
    .goto The Exodar,53.3,85.7
    .train 199 >>学习2小时锤类武器技能
step << Paladin
    >>和楼上的武器大师交谈
    .goto The Exodar,53.3,85.7
    .train 202 >>学习双手剑技能
step << Shaman
    .goto The Exodar,32.7,54.5
>>与|cRXP_FRIENDLY_先知维伦|r交谈
    .turnin 9461 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
.target Prophet Velen
    .accept 9555 >>接任务: |cRXP_LOOT_火焰的召唤|r
    .turnin -9698 >>交任务: |cRXP_FRIENDLY_会见先知|r
    .accept 9699 >>接任务: |cRXP_LOOT_真相还是谎言|r
step << Paladin
    .goto The Exodar,38.8,82.6
.target Jol
>>与|cRXP_FRIENDLY_约尔|r交谈
    .turnin 9600 >>交任务: |cRXP_FRIENDLY_救赎|r
step << !Shaman
    .goto The Exodar,32.858,54.484
    .turnin -9698 >>交任务: |cRXP_FRIENDLY_会见先知|r
.target Prophet Velen
>>与|cRXP_FRIENDLY_先知维伦|r交谈
    .accept 9699 >>接任务: |cRXP_LOOT_真相还是谎言|r
step << Shaman
	#completewith next
    .goto The Exodar,30.0,33.1
.target Farseer Nobundo
>>与|cRXP_FRIENDLY_预言者努波顿|r交谈
    .turnin 9555 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
	.trainer >>训练你的16级法术
step
	.goto The Exodar,52.3,34.7,80,0
    .goto The Exodar,68.336,63.490
    >>跑回飞行管理员处
>>与|cRXP_FRIENDLY_斯泰法努斯|r交谈
    .turnin 9605 >>交任务: |cRXP_FRIENDLY_斯泰法努斯|r
.target Stephanos
    .accept 9606 >>接任务: |cRXP_LOOT_返回托菲尔·罗阿身边|r
step
	#completewith next
    .goto The Exodar,68.336,63.490
    .fly Bloodmyst Isle>>飞往秘血岛
step
    .goto Bloodmyst Isle,55.844,59.776
.target Caregiver Topher Loaal
>>与|cRXP_FRIENDLY_Caregiver 托菲尔·罗阿|r交谈
    .turnin 9606 >>交任务: |cRXP_FRIENDLY_返回托菲尔·罗阿身边|r
step
    #label exit1
    .goto Bloodmyst Isle,55.5,55.4
    .turnin -9699 >>交任务: |cRXP_FRIENDLY_真相还是谎言|r
.target Vindicator Boros
>>与|cRXP_FRIENDLY_守备官波鲁斯|r交谈
    .accept 9700 >>接任务: |cRXP_LOOT_黑暗中的魔法|r
step
    .goto Bloodmyst Isle,56.2,54.3
.target Prospector Nachlan
>>与|cRXP_FRIENDLY_勘探者纳克兰|r交谈
    .accept 10063 >>接任务: |cRXP_LOOT_探险者协会要为侏儒服务吗？|r
step
	#sticky
    .goto Bloodmyst Isle,41.3,30.6
	.use 23877 >>使用背包里的镐子收集小红水晶
    .complete 9585,1 --Collect Axxarien Crystal Sample (x1)
step
    .goto Bloodmyst Isle,41.9,29.6
    >>收集营地周围的水晶并击杀萨蒂尔
    .complete 9569,1 --Kill Zevrax (x1)
    .complete 9569,2 --Kill Axxarien Shadowstalker (x5)
    .complete 9569,3 --Kill Axxarien Hellcaller (x5)
    .complete 9569,4 --Collect Corrupted Crystal (x5)
step
	#sticky
	#label constrictors
	#completewith gnome
    >>击杀变异缠绕者. 击杀后搜刮其藤蔓
    .complete 9643,1 --Collect Thorny Constrictor Vine (x6)
step
	#sticky
	#completewith bloodmyst2
	>>击杀熊怪, 掠夺它们的熊内脏
	.complete 9580,1 --Elder Brown Bear Flank (8)
step
    .goto Bloodmyst Isle,42.0,21.2
>>与|cRXP_FRIENDLY_克劳伯·维兹班|r交谈
    .turnin 10063 >>交任务: |cRXP_FRIENDLY_探险者协会要为侏儒服务吗？|r
.target Clopper Wizbang
    .accept 9548 >>接任务: |cRXP_LOOT_被偷走的设备|r
    .accept 9549 >>接任务: |cRXP_LOOT_黑沙神器|r
step
    #sticky
    #completewith gnome
    .goto Bloodmyst Isle,42.142,21.174,0
    .vendor >>从克劳伯·维兹班处购买青铜管(数量有限), 如果他没有或你已拥有, 则跳过此步骤
	>>补给箭矢 << Hunter
	>>如果需要, 请补充冰镇牛奶 << Hunter/Priest/Shaman/Paladin
    .collect 4371,1,175,1,1
step
    .goto Bloodmyst Isle,40.4,20.4,60,0
	.goto Bloodmyst Isle,38.5,22.5,30,0
	.goto Bloodmyst Isle,36.0,25.8,30,0
	.goto Bloodmyst Isle,40.4,20.4,30,0
	.goto Bloodmyst Isle,43.8,22.4,30,0
	.goto Bloodmyst Isle,46.4,20.5,30,0
	.goto Bloodmyst Isle,40.4,20.4
    >>抢夺可能出现在任意鱼人营地中的箱子
    .complete 9548,1 --Collect Clopper's Equipment (x1)
step
    .goto Bloodmyst Isle,39.5,20.7
	>>击杀并掠夺鱼人. 偶像由先知和神谕者掉落, 近战鱼人则掉落匕首
    .complete 9549,1 --Collect Crude Murloc Idol (x3)
    .complete 9549,2 --Collect Crude Murloc Knife (x6)
step
    .goto Bloodmyst Isle,42.142,21.174
.target Clopper Wizbang
>>与|cRXP_FRIENDLY_克劳伯·维兹班|r交谈
    .turnin 9548 >>交任务: |cRXP_FRIENDLY_被偷走的设备|r
    .turnin 9549 >>交任务: |cRXP_FRIENDLY_黑沙神器|r
step
    .goto Bloodmyst Isle,42.142,21.174
	.vendor >>从克劳伯·维兹班处购买青铜管(数量有限), 如果他没有或你已拥有, 则跳过此步骤
	.collect 4371,1,175,1,1
	.bronzetube
step
    .goto Bloodmyst Isle,53.1,20.3
    .use 23837 >>点击背包中来自“黑沙神器”任务的风蚀的藏宝图
	.collect 23837,1,9550 --Collect Weathered Treasure Map (x1)
    .accept 9550 >>接任务: |cRXP_LOOT_一张地图？|r
step
	#sticky
	#label Sun Portal Site
    .goto Bloodmyst Isle,53.1,20.3
	>>靠近像建筑一样的宇宙飞船
	.complete 9700,1 --Sun Portal Site Confirmed (1)
step
    #label gnome
    .goto Bloodmyst Isle,52.5,25.2
	>>击杀该区域内的虚空异常
    .complete 9700,2 --Kill Void Anomaly (x5)
step
	.goto Bloodmyst Isle,47.6,24.9,60,0
	.goto Bloodmyst Isle,44.9,26.4,100,0
	.goto Bloodmyst Isle,48.3,33.4,100,0
	.goto Bloodmyst Isle,45.1,37.4,100,0
	.goto Bloodmyst Isle,40.8,41.9,100,0
	.goto Bloodmyst Isle,34.0,44.3,100,0
	.goto Bloodmyst Isle,39.0,48.1,120,0
	.goto Bloodmyst Isle,42.5,49.3,100,0
	.goto Bloodmyst Isle,47.6,24.9
    >>击杀变异的缠绕者并搜集它们的藤蔓
	.complete 9643,1 --Collect Thorny Constrictor Vine (x6)
step
    .goto Bloodmyst Isle,54.0,30.9,60,0
    .goto Bloodmyst Isle,53.9,35.4,60,0
    .goto Bloodmyst Isle,57.0,34.3,60,0
    .goto Bloodmyst Isle,56.1,40.2
	>>在树营地地面搜刮龙骨
    .complete 9687,1 --Collect Dragon Bone (x8)
step
    .goto Bloodmyst Isle,61.1,41.9
    .turnin 9550 >>交任务: |cRXP_FRIENDLY_一张地图？|r
    .accept 9557 >>接任务: |cRXP_LOOT_破译书籍|r
step
    #completewith next
    #requires constrictors
    .hs >>回到城镇或传送回主城
step
   	#requires constrictors
	.goto Bloodmyst Isle,54.7,54.1
.target Anchorite Paetheus
>>与|cRXP_FRIENDLY_学者菲索斯|r交谈
    .turnin 9557 >>交任务: |cRXP_FRIENDLY_破译书籍|r
step
    .goto Bloodmyst Isle,52.6,53.3
>>与|cRXP_FRIENDLY_先行官米库拉斯|r交谈
    .turnin 9585 >>交任务: |cRXP_FRIENDLY_最终的样本|r
.target Harbinger Mikolaas
    .accept 10064 >>接任务: |cRXP_LOOT_阿古斯之手|r
step
    .goto Bloodmyst Isle,54.7,54.0
.target Anchorite Paetheus
>>与|cRXP_FRIENDLY_学者菲索斯|r交谈
    .accept 9561 >>接任务: |cRXP_LOOT_诺尔凯的日记|r
step
	#completewith next
    .goto Bloodmyst Isle,55.421,55.232
.target Vindicator Boros
>>与|cRXP_FRIENDLY_守备官波鲁斯|r交谈
    .turnin 9700 >>交任务: |cRXP_FRIENDLY_黑暗中的魔法|r
.target Vindicator Kuros
>>与|cRXP_FRIENDLY_守备官库卢斯|r交谈
    .accept 9703 >>接任务: |cRXP_LOOT_冷却核心|r
	.trainer >>在守备官伊索姆处学习职业法术 << Paladin
step
    .itemcount 23984,10
    .goto Bloodmyst Isle,55.421,55.232
.target Vindicator Boros
>>与|cRXP_FRIENDLY_守备官波鲁斯|r交谈
    .turnin 9642,3 >>交任务: |cRXP_FRIENDLY_更多辐射水晶碎片|r << Warrior/Paladin/Hunter/Rogue/Shaman
    .turnin 9642,2 >>交任务: |cRXP_FRIENDLY_更多辐射水晶碎片|r << Warlock/Priest/Mage
    .turnin 9642 >>交任务: |cRXP_FRIENDLY_更多辐射水晶碎片|r << Druid
step
    .goto Bloodmyst Isle,55.9,56.9
>>与|cRXP_FRIENDLY_追踪者兰塞恩|r交谈
    .turnin 9643 >>交任务: |cRXP_FRIENDLY_荆棘巨藤|r
.target Tracker Lyceon
    .accept 9647 >>接任务: |cRXP_LOOT_消灭巨蛾|r
step
	.goto Bloodmyst Isle,55.9,56.9
	.isQuestComplete 9580
.target Tracker Lyceon
>>与|cRXP_FRIENDLY_追踪者兰塞恩|r交谈
	.turnin 9580 >>交任务: |cRXP_FRIENDLY_猎熊|r
step
    .goto Bloodmyst Isle,55.0,58.1
.target Vindicator Aalesia
>>与|cRXP_FRIENDLY_守备官艾蕾希亚|r交谈
    .turnin 9569 >>交任务: |cRXP_FRIENDLY_化解危机|r
step
    .goto Bloodmyst Isle,53.242,57.708
.target Morae
>>与|cRXP_FRIENDLY_莫莱|r交谈
    .accept 9578 >>接任务: |cRXP_LOOT_搜寻加莱恩|r
step
	#sticky
	#completewith bloodmyst2
	>>在任务中击杀飞舞者
    .complete 9647,1 --Kill Royal Blue Flutterer (x10)
step
    .goto Bloodmyst Isle,37.5,61.3
	>>优先交任务, 暂时不要刷精灵
>>与|cRXP_FRIENDLY_Galaen's Corpse|r交谈
    .turnin 9578 >>交任务: |cRXP_FRIENDLY_搜寻加莱恩|r
.target Galaen's Corpse
    .accept 9579 >>接任务: |cRXP_LOOT_加莱恩的命运|r
    .accept 9706 >>接任务: |cRXP_LOOT_加莱恩的日记 - 守备官撒鲁安的命运|r
step
    .goto Bloodmyst Isle,37.8,58.9
	>>击杀并掠夺此区域周围的血精灵. 你可以利用该区域的柱子进行视野遮挡(LoS), 以避免受到伤害
    .complete 9579,1 --Collect Galaen's Amulet (x1)
    .complete 9703,1 --Collect Medical Supplies (x12)
step
	.xp 17+12800 >>升级至12800/16400经验值
step
	#requires constrictors
    .goto Bloodmyst Isle,53.3,57.7
.target Morae
>>与|cRXP_FRIENDLY_莫莱|r交谈
    .turnin 9579 >>交任务: |cRXP_FRIENDLY_加莱恩的命运|r
step
    .goto Bloodmyst Isle,53.3,57.2
.target Achelus
>>与|cRXP_FRIENDLY_阿彻鲁斯|r交谈
    .accept 9669 >>接任务: |cRXP_LOOT_覆灭的远征队|r
step
    .goto Bloodmyst Isle,55.6,55.1
>>与|cRXP_FRIENDLY_守备官库卢斯|r交谈
    .turnin 9703 >>交任务: |cRXP_FRIENDLY_冷却核心|r
    .turnin 9706 >>交任务: |cRXP_FRIENDLY_加莱恩的日记 - 守备官撒鲁安的命运|r
.target Vindicator Kuros
    .accept 9711 >>接任务: |cRXP_LOOT_残忍的玛提斯|r
.target Vindicator Aesom
>>与|cRXP_FRIENDLY_守备官伊索姆|r交谈
    .accept 9748 >>接任务: |cRXP_LOOT_毒水|r
    .accept 9753 >>接任务: |cRXP_LOOT_我们所知道的......|r
step
    .goto Bloodmyst Isle,52.6,53.3
>>与|cRXP_FRIENDLY_主教埃德门图斯|r交谈
    .turnin 9753 >>交任务: |cRXP_FRIENDLY_我们所知道的......|r
.target Exarch Admetius
    .accept 9756 >>接任务: |cRXP_LOOT_我们不知道的......|r
step
    >>打开笼子, 然后与囚犯对话
    .skipgossip
    .complete 9756,1
    .goto Bloodmyst Isle,54.36,54.30
>>与|cRXP_FRIENDLY_主教埃德门图斯|r交谈
    .turnin 9756 >>交任务: |cRXP_FRIENDLY_我们不知道的......|r
    .goto Bloodmyst Isle,52.6,53.3
.target Exarch Admetius
    .accept 9760 >>接任务: |cRXP_LOOT_守备官营地|r
step
	#completewith AliveM
    .goto Bloodmyst Isle,43.9,43.7,0
    .goto Bloodmyst Isle,30.1,51.7,0
    .goto Bloodmyst Isle,22.4,54.3,0
	.line Bloodmyst Isle,43.1,43.7,36.5,47.2,33.5,47.1,29.9,51.8,27.7,51.8,25.1,54.1,22.0,54.3
    .use 24278 >>寻找残忍的玛提斯, 他在守备官营地附近的主路上巡逻
    .complete 9711,1 --Capture Matis the Cruel
	*Once you find him, use the flare in your bags to summon a Draenei NPC to assist you
	*The flare gun only have 1 charge, if you fail this quest, you will have to abandon it
	.unitscan Matis the Cruel
step
    .goto Bloodmyst Isle,30.3,45.8
>>与|cRXP_FRIENDLY_斥候约莉|r交谈
    .turnin 10064 >>交任务: |cRXP_FRIENDLY_阿古斯之手|r
.target Scout Jorli
    .accept 10065 >>接任务: |cRXP_LOOT_披荆斩棘|r
.target Scout Loryi
>>与|cRXP_FRIENDLY_斥候洛伊|r交谈
    .accept 9741 >>接任务: |cRXP_LOOT_虚空幼体|r
step
    .goto Bloodmyst Isle,30.8,46.8
.target Defender Sorli
.target Defender Adrielle
.target Vindicator Corin
>>与|cRXP_FRIENDLY_守备官考尔琳|r交谈
-->>与|cRXP_FRIENDLY_防御者艾德利雷|r交谈
-->>与 |cRXP_FRIENDLY_防御者索里|r 交谈
    .accept 10066 >>接任务: |cRXP_LOOT_纠结之网|r
--
--
    .accept 10067 >>接任务: |cRXP_LOOT_污秽的水之魂|r
     .turnin 9760 >>交任务: |cRXP_FRIENDLY_守备官营地|r
step
    #sticky
	#completewith next
    .goto Bloodmyst Isle,30.3,57.2,0
    .complete 10066,1 --Kill Mutated Tangler (x8)
    .complete 10065,1 --Kill Enraged Ravager (x10)
step
    .goto Bloodmyst Isle,19.6,63.2
	>>你必须击杀水中的异常生物, 才能最终召唤出小动物
    .complete 9741,1 --Kill Void Critter (x12)
step
	>>击杀缠结者与劫掠者
    .goto Bloodmyst Isle,30.3,57.2
    .complete 10066,1 --Kill Mutated Tangler (x8)
    .complete 10065,1 --Kill Enraged Ravager (x10)
step
	#label bloodmyst2
.target Vindicator Corin
>>与|cRXP_FRIENDLY_守备官考尔琳|r交谈
    .turnin 10066 >>交任务: |cRXP_FRIENDLY_纠结之网|r
    .goto Bloodmyst Isle,30.7,46.9
.target Scout Jorli
>>与|cRXP_FRIENDLY_斥候约莉|r交谈
    .turnin 10065 >>交任务: |cRXP_FRIENDLY_披荆斩棘|r
    .goto Bloodmyst Isle,30.3,46.0
step
    .goto Bloodmyst Isle,33.4,43.8
	>>击杀熊和扑翼者. 从熊身上获取它们的侧翼作为战利品
	>>完成击杀并掠夺熊和扑翼者
    .complete 9647,1 --Kill Royal Blue Flutterer (10)
	.complete 9580,1 --Elder Brown Bear Flank (8)
step
    .goto Bloodmyst Isle,29.6,39.5
	>>击杀该区域的污秽水之魂
    .complete 10067,1 --Kill Fouled Water Spirit (x6)
step
    .goto Bloodmyst Isle,30.746,46.808
.target Vindicator Corin
>>与|cRXP_FRIENDLY_守备官考尔琳|r交谈
    .turnin 10067 >>交任务: |cRXP_FRIENDLY_污秽的水之魂|r
step
    .goto Bloodmyst Isle,24.872,34.310
.target Researcher Cornelius
>>与研究员考内留斯交谈|cRXP_FRIENDLY_研究员考内留斯|r
    .accept 9670 >>接任务: |cRXP_LOOT_他们还活着！也许......|r
step
	#sticky
	#label Researchers
	>>摧毁该区域周围的卵囊. 如果可能, 请远程击杀, 以免惊动内部的潜在怪物
    .goto Bloodmyst Isle,18.2,38.0,0,0
    .complete 9670,1 --Expedition Researcher Freed (5)
step
    .goto Bloodmyst Isle,21.4,36.0,70,0
    .goto Bloodmyst Isle,17.2,28.4,40,0
    .goto Bloodmyst Isle,18.2,38.0
	>>击杀该区域的秘网吸血者和纺纱者, 然后击杀山顶上的萨拉肯
    .complete 9669,1 --Kill Myst Leecher (x8)
    .complete 9669,2 --Kill Myst Spinner (x8)
    .complete 9669,3 --Kill Zarakh (x1)
step
	#requires Researchers
	#label AliveM
    .goto Bloodmyst Isle,24.9,34.4
.target Researcher Cornelius
>>与研究员考内留斯交谈|cRXP_FRIENDLY_研究员考内留斯|r
    .turnin 9670 >>交任务: |cRXP_FRIENDLY_他们还活着！也许......|r
step
    .goto Bloodmyst Isle,43.9,43.7,70,0
    .goto Bloodmyst Isle,30.1,51.7,70,0
    .goto Bloodmyst Isle,22.4,54.3,70,0
    .goto Bloodmyst Isle,30.1,51.7,70,0
    .goto Bloodmyst Isle,43.9,43.7,70,0
    .goto Bloodmyst Isle,22.4,54.3,70,0
    .goto Bloodmyst Isle,30.1,51.7
	.line Bloodmyst Isle,43.1,43.7,36.5,47.2,33.5,47.1,29.9,51.8,27.7,51.8,25.1,54.1,22.0,54.3
    .use 24278 >>寻找残忍的玛提斯, 他在守备官营地附近的主路上巡逻
    .complete 9711,1 --Capture Matis the Cruel
	*Once you find him, use the flare in your bags to summon a Draenei NPC to assist you
	*The flare gun only have 1 charge, if you fail this quest, you will have to abandon it
	.unitscan Matis the Cruel
step << Hunter/Shaman/Mage
    #label limit1
    #completewith L20
	.xp 19-11,200,1
    .goto Bloodmyst Isle,24.8,51.3
    .complete 9746,1 --Kill Sunhawk Pyromancer (x10)
    .complete 9746,2 --Kill Sunhawk Defender (x10)
step << Hunter/Shaman/Mage
    #label limit2
    #completewith L20
    #requires limit1
    .isOnQuest 9746
    .goto Bloodmyst Isle,55.6,55.3
>>与|cRXP_FRIENDLY_守备官伊索姆|r交谈
    .turnin 9746 >>交任务: |cRXP_FRIENDLY_精疲力尽|r
.target Vindicator Aesom
    .accept 9740 >>接任务: |cRXP_LOOT_太阳之门|r
step << Hunter/Shaman/Mage
    #label sungate
    #completewith L20
    #requires limit2
    .isOnQuest 9740
    .goto Bloodmyst Isle,18.7,64.0
    >>点击湖边的紫色水晶, 然后点击中央的大传送门
    .complete 9740,1
step
    .goto Bloodmyst Isle,34.3,33.6
	.use 24318 >>在瀑布底部使用背包中的取样瓶
    .complete 9748,1 --Collect Bloodmyst Water Sample (x1)
step
    .goto Bloodmyst Isle,37.4,30.1
	>>击杀指定名称的熊. 击杀后从其身上获取爪子
    .complete 9646,1 --Collect Deathclaw's Paw (x1)
step
	#completewith next
    .hs >>炉石传送至秘血岗哨
step
    .goto Bloodmyst Isle,53.4,57.1
.target Achelus
>>与|cRXP_FRIENDLY_阿彻鲁斯|r交谈
    .turnin 9669 >>交任务: |cRXP_FRIENDLY_覆灭的远征队|r
step
    .goto Bloodmyst Isle,52.7,53.3
.target Harbinger Mikolaas
>>与|cRXP_FRIENDLY_先行官米库拉斯|r交谈
    .turnin 9646 >>交任务: |cRXP_FRIENDLY_通缉：死爪|r
step
    .goto Bloodmyst Isle,54.7,54.1
.target Anchorite Paetheus
>>与|cRXP_FRIENDLY_学者菲索斯|r交谈
    .accept 9632 >>接任务: |cRXP_LOOT_新的盟友|r
step
    .goto Bloodmyst Isle,55.6,55.3
>>与|cRXP_FRIENDLY_守备官伊索姆|r交谈
    .turnin 9741 >>交任务: |cRXP_FRIENDLY_虚空幼体|r
    .turnin 9748 >>交任务: |cRXP_FRIENDLY_毒水|r
.target Vindicator Kuros
>>与|cRXP_FRIENDLY_守备官库卢斯|r交谈
    .turnin 9711 >>交任务: |cRXP_FRIENDLY_残忍的玛提斯|r
.target Vindicator Aesom
    .accept 9746 >>接任务: |cRXP_LOOT_精疲力尽|r << Hunter/Shaman/Mage
	.isQuestComplete 9711
step
    .goto Bloodmyst Isle,55.6,55.3
>>与|cRXP_FRIENDLY_守备官伊索姆|r交谈
    .turnin 9741 >>交任务: |cRXP_FRIENDLY_虚空幼体|r
    .turnin 9748 >>交任务: |cRXP_FRIENDLY_毒水|r
.target Vindicator Aesom
    .accept 9746 >>接任务: |cRXP_LOOT_精疲力尽|r << Hunter/Shaman/Mage
step
	.goto Bloodmyst Isle,55.6,55.3
	.abandon 9711 >>放弃任务：残忍的玛提斯
step
	#requires sungate
	.goto Bloodmyst Isle,55.6,55.3
.target Vindicator Aesom
>>与|cRXP_FRIENDLY_守备官伊索姆|r交谈
	.turnin 9740 >>交任务: |cRXP_FRIENDLY_太阳之门|r
step
	#label bearend
    .goto Bloodmyst Isle,55.9,56.9
.target Tracker Lyceon
>>与|cRXP_FRIENDLY_追踪者兰塞恩|r交谈
    .turnin 9647 >>交任务: |cRXP_FRIENDLY_消灭巨蛾|r
    .turnin 9580 >>交任务: |cRXP_FRIENDLY_猎熊|r
step
    .goto Bloodmyst Isle,61.4,49.6
    .turnin 9561 >>交任务: |cRXP_FRIENDLY_诺尔凯的日记|r
step
    .goto Bloodmyst Isle,74.6,33.6
>>与托雷斯王子交谈|cRXP_FRIENDLY_托雷斯王子|r
    .turnin 9687 >>交任务: |cRXP_FRIENDLY_找回尊严|r
.target Prince Toreth
    .accept 9688 >>接任务: |cRXP_LOOT_进入梦境|r
step
	#sticky
	#label Veridian
    .goto Bloodmyst Isle,71.5,27.8,0
    .complete 9688,1 --Kill Veridian Whelp (x5)
    .complete 9688,2 --Kill Veridian Broodling (x5)
step
    .goto Bloodmyst Isle,79.1,22.7
.target Captain Edward Hanes
>>与|cRXP_FRIENDLY_艾德华·汉斯船长|r交谈
    .turnin 9683 >>交任务: |cRXP_FRIENDLY_血咒的终结|r
    .isOnQuest 9683
step
    #requires Veridian
	.goto Bloodmyst Isle,74.3,33.4
>>与托雷斯王子交谈|cRXP_FRIENDLY_托雷斯王子|r
    .turnin 9688 >>交任务: |cRXP_FRIENDLY_进入梦境|r
.target Prince Toreth
    .accept 9689 >>接任务: |cRXP_LOOT_刺喉|r
step
    .goto Bloodmyst Isle,73.0,21.0
	>>爬上山顶, 点击篝火召唤拉佐姆. 他需要一点时间才能飞下来
    .complete 9689,1 --Kill Razormaw (x1)
	>>这是一个精英任务, 如果你无法击杀刺喉, 请跳过此步骤
step
    .goto Bloodmyst Isle,74.3,33.4
.target Prince Toreth
>>与托雷斯王子交谈|cRXP_FRIENDLY_托雷斯王子|r
    .turnin 9689 >>交任务: |cRXP_FRIENDLY_刺喉|r
	.isQuestComplete 9689
step << Hunter/Shaman/Mage
    #label L20
    .xp 20
    >>你需要先升到20级才能离开秘血岛
step << !Shaman
    #completewith flighttoexodar2
    .deathskip >>死亡跳回秘血岗哨
step
    .itemcount 23984,10
    .goto Bloodmyst Isle,55.421,55.232
    >>离开秘血岛之前, 请上交剩余的辐射水晶碎片！
.target Vindicator Boros
>>与|cRXP_FRIENDLY_守备官波鲁斯|r交谈
    .turnin 9642,3 >>交任务: |cRXP_FRIENDLY_更多辐射水晶碎片|r << Warrior/Paladin/Hunter/Rogue/Shaman
    .turnin 9642,2 >>交任务: |cRXP_FRIENDLY_更多辐射水晶碎片|r << Warlock/Priest/Mage
    .turnin 9642 >>交任务: |cRXP_FRIENDLY_更多辐射水晶碎片|r << Druid
step << Paladin
	#completewith next
	#level20
	.goto Bloodmyst Isle,55.6,55.3
	>>在守备官伊索姆处训练
step
    #label flighttoexodar2
	#completewith next
    .goto Bloodmyst Isle,57.7,53.9
    .fly the Exodar>>飞往埃索达
step << Shaman
    .goto The Exodar,32.4,24.0
.target Farseer Javad
>>与先知亚瓦德交谈|cRXP_FRIENDLY_先知亚瓦德|r
    .accept 9502 >>接任务: |cRXP_LOOT_水之召唤|r
step << Shaman
    .goto The Exodar,31.3,30.7
>>与|cRXP_FRIENDLY_预言者努波顿|r交谈
    .turnin 9502 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.target Farseer Nobundo
    .accept 9501 >>接任务: |cRXP_LOOT_水之召唤|r
	.trainer >>训练你的20级技能
step << Shaman
    .goto The Exodar,68.336,63.490
    .fly Blood Watch>>飞往秘血岗哨
step << Shaman
    .goto Bloodmyst Isle,32.300,16.132
>>与|cRXP_FRIENDLY_阿奎欧斯|r交谈
    .turnin 9501 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.target Aqueous
    .accept 9503 >>接任务: |cRXP_LOOT_水之召唤|r
step << Shaman
    .goto Bloodmyst Isle,24.8,51.3
    .complete 9746,1 --Kill Sunhawk Pyromancer (x10)
    .complete 9746,2 --Kill Sunhawk Defender (x10)
step << Shaman
    .goto Bloodmyst Isle,30.2,37.8
    .complete 9503,1 --Collect Foul Essence (x6)
step << Shaman
    .goto Bloodmyst Isle,32.4,16.2
>>与|cRXP_FRIENDLY_阿奎欧斯|r交谈
    .turnin 9503 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.target Aqueous
    .accept 9504 >>接任务: |cRXP_LOOT_水之召唤|r
step << Shaman
    .goto Bloodmyst Isle,30.4,45.8,120 >>故意死亡, 复活后前往秘血岗哨
step << Shaman
    .goto Bloodmyst Isle,55.5,55.4
.target Vindicator Aesom
>>与|cRXP_FRIENDLY_守备官伊索姆|r交谈
    .turnin 9746 >>交任务: |cRXP_FRIENDLY_精疲力尽|r
step << Shaman
    .goto Bloodmyst Isle,57.7,53.9
    .fly The Exodar>>飞往埃索达
step << Draenei !Paladin wotlk
	.goto The Exodar,81.18,52.56
    .money <5.00
    .skill riding,75 >>前往: |cRXP_PICK_埃索达|r, buy and train your mount
step << Hunter
	.goto The Exodar,42.0,71.4,60,0
	.goto The Exodar,54.5,85.6,60,0
	.goto The Exodar,47.6,88.3
	.trainer >>在埃索达学习法术
	.train 15147 >>从宠物训练师处学习咆哮技能第3级 << tbc
step << Priest
    >>进入埃索达, 从商人处购买一根燃烧魔杖
    .collect 5210,1
    .goto The Exodar,46.4,61.4
    .trainer >>训练你的职业法术
    .goto The Exodar,39.2,51.3
step << Mage
	.goto The Exodar,51.0,46.8,80,0
	.goto The Exodar,47.2,62.3,20,0
	    .goto The Exodar,46.0,62.7
    .trainer >>训练法术与传送门:埃索达在埃索达
step << Mage
    >>购买1个传送符文
    .collect 17031,1 --Rune of Teleportation (1)
    .goto The Exodar,44.8,63.2
step << Warrior
	.goto The Exodar,42,71.4,60,0
	.goto The Exodar,54.5,85.6,60,0
	.goto The Exodar,55.579,82.269
	.trainer >>在埃索达学习法术
step
	.goto The Exodar,33.8,73.7,10,0
    .goto Azuremyst Isle,24.182,54.346
	>>与埃索达后门外的夜精灵交谈
>>与|cRXP_FRIENDLY_女猎手凯拉·夜弓|r交谈
    .turnin 9632 >>交任务: |cRXP_FRIENDLY_新的盟友|r
.target Huntress Kella Nightbow
    .accept 9633 >>接任务: |cRXP_LOOT_前往奥伯丁|r
step
	#sticky
	#completewith next
	.goto Azuremyst Isle,21.4,54.0,20 >>前往码头
step
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
	>>先学急救技能, 或在等待时制作磨刀石 << Warrior/Paladin
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Alliance
#name 20-21 黑海岸(德莱尼)
#displayname 20-21 黑海岸(德莱尼) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 20-32级
#defaultfor Draenei
#next 21-23 灰谷(德莱尼)
step
    #xprate <1.2
    .goto Darkshore,36.096,44.931
.target Gubber Blump
>>与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >>接任务: |cRXP_LOOT_海中的水果|r
    .maxlevel 20
step
	.goto Darkshore,36.35,45.57
	.fp Darkshore >>获取黑海岸的飞行路径
step
    .goto Darkshore,37.0,44.0
    .home >>将炉石设置为奥伯丁
step
    #xprate <1.2
    .goto Darkshore,37.3,44.3
    .accept 4740 >>接任务: |cRXP_LOOT_通缉：莫克迪普！|r
step
    #xprate <1.2
    .goto Darkshore,37.4,43.7
.target Barithras Moonshade
>>与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >>接任务: |cRXP_LOOT_洞中的蘑菇|r
    .maxlevel 20
step
    .goto Darkshore,38.37,43.05
.target Gershala Nightwhisper
>>与|cRXP_FRIENDLY_戈沙拉·夜语|r交谈
    .accept 1275 >>接任务: |cRXP_LOOT_研究堕落|r
step
    #xprate <1.2
    .goto Darkshore,39.1,43.5
.target Sentinel Elissa Starbreeze
>>与|cRXP_FRIENDLY_哨兵艾莉萨·星风|r交谈
    .accept 965 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .maxlevel 20
step
#xprate <1.2
    .goto Darkshore,38.1,41.2
.target Gorbold Steelhand
>>与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >>接任务: |cRXP_LOOT_深不可测的海洋|r
    .maxlevel 20
step
    .goto Darkshore,37.4,40.2
	.turnin -9633 >>交任务: |cRXP_FRIENDLY_前往奥伯丁|r
.target Thundris Windweaver
>>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .accept 10752 >>接任务: |cRXP_LOOT_前往灰谷|r
step
#xprate <1.2
    .goto Darkshore,38.2,28.8
	>>通过船体上的洞进入沉船, 并在底层搜索宝箱
    .complete 982,1 --Collect Silver Dawning's Lockbox (x1)
    .isOnQuest 982
step
#xprate <1.2
    .goto Darkshore,39.6,27.5
	>>通过船体上的洞进入沉船, 并在底层搜索宝箱
    .complete 982,2 --Collect Mist Veil's Lockbox (x1)
    .isOnQuest 982
step
#xprate <1.2
	#sticky
	>>击杀海岸边的暗礁蟹和硬壳潮行蟹
    .complete 1138,1 --Collect Fine Crab Chunks (x6)
    .isOnQuest 1138
step
#xprate <1.2
	>>一边沿着海岸击杀螃蟹, 一边向北前进
    .goto Darkshore,56.7,13.5
.target Gelkak Gyromast
>>与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .accept 2098 >>接任务: |cRXP_LOOT_基尔卡克的钥匙|r
    .isOnQuest 1138
step
#xprate <1.2
	#completewith q2098
    #label crawlers
    >>击杀狂暴礁石爬行者. 注意它们会猛烈挥击(大约每10秒发动一次多段攻击)
    .complete 2098,3 --Collect Bottom of Gelkak's Key (x1)
    .isOnQuest 2098
step
#xprate <1.2
    .goto Darkshore,59.5,12.6
	>>击杀凶猛的森林陆行鸟
    .complete 2098,1 --Collect Top of Gelkak's Key (x1)
    .isOnQuest 2098
step
#xprate <1.2
    .goto Darkshore,55.4,12.6
	>>击杀沉船附近的鱼人. 你可以在沉船前方区域看到神谕者(视野范围内)
    .complete 2098,2 --Collect Middle of Gelkak's Key (x1)
    .isOnQuest 2098
step
#xprate <1.2
    #label q2098
    #requires crawlers
    .goto Darkshore,56.7,13.5
.target Gelkak Gyromast
>>与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .turnin 2098 >>交任务: |cRXP_FRIENDLY_基尔卡克的钥匙|r
    .isOnQuest 2098
step
#xprate <1.2
    .goto Darkshore,56.7,13.5
    #requires crawlers
.target Gelkak Gyromast
>>与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .accept 2078 >>接任务: |cRXP_LOOT_基尔卡克的报复|r
    .isQuestTurnedIn 2098
step
#xprate <1.2
    .goto Darkshore,55.8,18.2
	>>与大机器人交谈, 护送它返回任务发布者处, 待其变为敌对状态后将其击杀
    .complete 2078,1 --Gelkak's First Mate
    .isQuestTurnedIn 2098
step
#xprate <1.2
    .goto Darkshore,56.7,13.5
.target Gelkak Gyromast
>>与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .turnin 2078 >>交任务: |cRXP_FRIENDLY_基尔卡克的报复|r
    .isQuestTurnedIn 2098
step
#xprate <1.2
	#sticky
	#completewith deletekey
	.destroy 7442 >>摧毁: |cRXP_ENEMY_基尔卡克的钥匙|r, 它在你的钥匙中. 不再需要它了
    .isQuestTurnedIn 2098
step << !Druid !Shaman !Warlock
#xprate <1.2
    .isQuestTurnedIn 2098
	#sticky
	#completewith deletekey
	+确保保留你的水下呼吸药水, 稍后在30到40级之间会遇到几个水下区域需要用到它们
step
#xprate <1.2
    .goto Darkshore,55.0,24.9
.target Balthule Shadowstrike
>>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 965 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .isOnQuest 965
step
#xprate <1.2
    .goto Darkshore,55.0,24.9
.target Balthule Shadowstrike
>>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .accept 966 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .isQuestTurnedIn 965
step
#xprate <1.2
	#label deletekey
    .goto Darkshore,55.3,26.7
    .complete 966,1 --Collect Worn Parchment (x4)
    .isOnQuest 966
step
#xprate <1.2
    .goto Darkshore,55.0,24.9
>>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 966 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
.target Balthule Shadowstrike
    .accept 967 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .isQuestTurnedIn 965
step
#xprate <1.2
    .goto Darkshore,55.3,34.0
    .complete 947,1 --Collect Scaber Stalk (x5)
	>>进入洞穴后向右转, 查看上方是否有死亡帽. 如果没有, 就得往下走到下面去
    .complete 947,2 --Collect Death Cap (x1)
    .isOnQuest 947
step
#xprate <1.2
	.goto Darkshore,55.3,34.0
    .xp 20-3900	>>升级到19级, 获得16900+/20800点经验值
step
#xprate <1.2
	#sticky
	#completewith next
	.deathskip >>死亡跳转至奥伯丁 << Hunter
    .hs >>传送至奥伯丁 << !Hunter
step
#xprate <1.2
    .goto Darkshore,38.1,41.3
.target Gorbold Steelhand
>>与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .turnin 982 >>交任务: |cRXP_FRIENDLY_深不可测的海洋|r
    .isQuestComplete 982
step
#xprate <1.2
    .goto Darkshore,37.5,41.9
.target Archaeologist Hollee
>>与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >>接任务: |cRXP_LOOT_健忘的勘察员|r
step
#xprate <1.2
    .goto Darkshore,37.4,43.7
.target Barithras Moonshade
>>与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .turnin 947 >>交任务: |cRXP_FRIENDLY_洞中的蘑菇|r
    .isQuestComplete 947
step
#xprate <1.2
    .goto Darkshore,37.4,43.7
.target Barithras Moonshade
>>与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 948 >>接任务: |cRXP_LOOT_安努|r
    .isQuestTurnedIn 947
step
#xprate <1.2
    .goto Darkshore,36.096,44.931
.target Gubber Blump
>>与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >>交任务: |cRXP_FRIENDLY_海中的水果|r
    .isQuestComplete 1138
step << Hunter
    #completewith Trainer
    .goto Darkshore,33.1,39.9,30,0
    .goto Darkshore,33.1,39.9,0
    .zone Teldrassil>>前往: |cRXP_PICK_泰达希尔|r
    .zoneskip Darnassus
step << Hunter
    #completewith Trainer
    .goto Teldrassil,58.399,94.016
    .fp Rut'theran >>获取鲁瑟兰村的飞行路径
step << Hunter
    #label Trainer
	.goto Teldrassil,29.2,56.7
	.train 264 >>训练弓箭
    .train 227 >>训练法杖 << tbc
step << Hunter
    .goto Darnassus,63.3,66.3
    >>在达纳苏斯购买20级武器升级
    >>如果已有传家宝武器, 请跳过此步骤 << wotlk
    .collect 3027,1
    .itemStat 18,QUALITY,<7 << wotlk
step << Hunter
    .hs >>回到奥伯丁, 如果你的回城技能仍在冷却, 请飞回去
    .zoneskip Darkshore
step
#xprate <1.2
    .goto Darkshore,43.5,76.2
>>与|cRXP_FRIENDLY_安努|r交谈
    .turnin 948 >>交任务: |cRXP_FRIENDLY_安努|r
.target Onu
    .accept 944 >>接任务: |cRXP_LOOT_主宰之剑|r
    .isQuestTurnedIn 947
step
#xprate <1.2
    .goto Darkshore,36.6,76.6
	>>靠近火堆以触发事件(建议先击杀周围的怪物)
    .complete 4740,1 --Kill Murkdeep (x1)
    .isOnQuest 4740
step
    .isOnQuest 729
    .goto Darkshore,35.7,83.7
.target Prospector Remtravel
>>与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    .turnin 729 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
step
#xprate <1.7
    .goto Darkshore,35.7,83.7
    >>开始护送任务
.target Prospector Remtravel
>>与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    .accept 731,1 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .isQuestTurnedIn 729
step
#xprate <1.7
    .isOnQuest 729
	>>Remtravel不会激怒那些不攻击他的怪物, 或者你先激怒的怪物. 请注意, 他的生命值和护甲较低
    .complete 731,1 --护送勘察员雷姆塔维尔
step
#xprate <1.2
    .goto Darkshore,39.0,86.4
	.use 5251 >>在该区域任意位置使用[占卜之水]
    .turnin 944 >>交任务: |cRXP_FRIENDLY_主宰之剑|r
    .accept 949 >>接任务: |cRXP_LOOT_暮光之锤的营地|r
    .isQuestTurnedIn 948
step
#xprate <1.2
    .goto Darkshore,38.6,86.1
    .turnin 949 >>交任务: |cRXP_FRIENDLY_暮光之锤的营地|r
    >>跳过后续任务
    .isQuestTurnedIn 948
step
#xprate <1.2
	#sticky
	#completewith darkshoreend
	.destroy 5251>>你现在可以从物品栏中删除“占卜之瓶”, 因为它已不再需要
step
#xprate <1.2
    .goto Darkshore,38.7,87.3
.target Therylune
>>与|cRXP_FRIENDLY_瑟瑞露尼|r交谈
    .accept 945 >>接任务: |cRXP_LOOT_护送瑟瑞露尼|r, 如果她不在这里，请等待其他人完成此任务。
    .maxlevel 21
step
#xprate <1.2
	#label darkshoreend
    .complete 945,1 --护送瑟瑞露尼
    .isOnQuest 945
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Alliance
#name 21-23 灰谷(德莱尼)
#displayname 21-23 灰谷(德莱尼) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 20-32级
#defaultfor Draenei
#next RestedXP 联盟 20-32\23-24 湿地；RestedXP 联盟 20-32\24-27 赤脊山/暮色森林
step
#xprate <1.2
    .goto Ashenvale,26.2,38.6
.target Delgren the Purifier
>>与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 967 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .isOnQuest 967
step
#xprate <1.2
    .goto Ashenvale,26.2,38.6
.target Delgren the Purifier
>>与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .accept 970 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .maxlevel 21
step
    >>这个任务会衔接一连串的主线任务, 即使过程有些繁琐, 也值得完成
    .goto Ashenvale,26.4,38.6
.target Orendil Broadleaf
>>与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .accept 1010 >>接任务: |cRXP_LOOT_巴斯兰的头发|r
step
    .goto Ashenvale,31.3,23.2
	>>寻找地面上的小包裹, 它们可能部分嵌入地形中
    .complete 1010,1 --Collect 草药巴桑兰的头发 (x5)
step
#xprate <1.2
    .goto Ashenvale,31.4,31.0
    .complete 970,1 --Collect Glowing Soul Gem (x1)
    .isOnQuest 970
step
    .goto Ashenvale,26.4,38.6
>>与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .turnin 1010 >>交任务: |cRXP_FRIENDLY_巴斯兰的头发|r
.target Orendil Broadleaf
    .accept 1020 >>接任务: |cRXP_LOOT_奥雷迪尔的药剂|r
step
#xprate <1.2
    .goto Ashenvale,26.2,38.6
.target Delgren the Purifier
>>与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 970 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .isOnQuest 970
step
#xprate <1.2
    .goto Ashenvale,26.2,38.6
.target Delgren the Purifier
>>与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .accept 973 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .maxlevel 21
    .isQuestTurnedIn 970
step
    .goto Ashenvale,34.7,48.8
.target Shindrell Swiftfire
>>与|cRXP_FRIENDLY_辛德瑞尔·速火|r交谈
    .accept 1008 >>接任务: |cRXP_LOOT_佐拉姆海岸|r
step
    .goto Ashenvale,36.618,49.581
.target Raene Wolfrunner
>>与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
    .accept 1054 >>接任务: |cRXP_LOOT_解除威胁|r
    .turnin 10752 >>交任务: |cRXP_FRIENDLY_前往灰谷|r
step
    #xprate <1.7
    .goto Ashenvale,36.618,49.581
.target Raene Wolfrunner
>>与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
    .accept 991 >>接任务: |cRXP_LOOT_莱恩的净化|r
step
    .goto Ashenvale,37.0,49.2
    .home >>上楼. 将你的[炉石]设置为阿斯特兰纳
step
    .goto Ashenvale,37.3,51.8
.target Pelturas Whitemoon
>>与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
    .turnin 1020 >>交任务: |cRXP_FRIENDLY_奥雷迪尔的药剂|r
    .timer 26,Orendil's Cure RP
step << Warrior tbc/Paladin
	#sticky
	.goto Ashenvale,35.8,52.0
	>>购买21级武器升级
	.collect 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.97
step
	.goto Ashenvale,37.3,51.8
.target Pelturas Whitemoon
>>与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
    .accept 1033 >>接任务: |cRXP_LOOT_月神之泪|r
step
    .goto Ashenvale,46.2,45.9
    >>在湖中央的小岛上寻找珍珠状小物品
    .complete 1033,1 --Collect Elune's Tear (x1)
step
    .goto Ashenvale,37.8,34.7
	>>他是一个灰色的熊怪, 负责巡逻营地的大片区域
	.unitscan Dal Bloodclaw
    .complete 1054,1 --Collect Dal Bloodclaw's Skull (x1)
step
    .goto Ashenvale,36.618,49.581
.target Raene Wolfrunner
>>与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
    .turnin 1054 >>交任务: |cRXP_FRIENDLY_解除威胁|r
step
    .goto Ashenvale,37.3,51.8
>>与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
    .turnin 1033 >>交任务: |cRXP_FRIENDLY_月神之泪|r
.target Pelturas Whitemoon
    .accept 1034 >>接任务: |cRXP_LOOT_星尘废墟|r
step << Shaman
    .goto Ashenvale,33.6,67.4
    .complete 9504,1 --Collect Filled Bota Bag (x1)
step
    .goto Ashenvale,33.3,67.4
    .complete 1034,1 --Collect Handful of Stardust (x5)
step
#xprate <1.2
    .goto Ashenvale,25.3,60.8
	>>尝试在他召唤守护者之前将其击杀(该技能可被击晕, 但无法被中断)
    .complete 973,1 --Collect Ilkrud Magthrull's Tome (x1)
    .isOnQuest 973
step
	.goto Ashenvale,27.4,61.7,80,0
	.goto Ashenvale,28.1,55.1,80,0
    .goto Ashenvale,22.7,51.9
.target Therysil
>>与|cRXP_FRIENDLY_瑟瑞希尔|r交谈
    .turnin 945 >>交任务: |cRXP_FRIENDLY_护送瑟瑞露尼|r
    .isQuestComplete 945
step
#xprate <1.2
    .goto Ashenvale,26.196,38.698
.target Delgren the Purifier
>>与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 973 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .isOnQuest 973
step
#xprate <1.7
    .goto Ashenvale,20.3,42.4
>>与|cRXP_FRIENDLY_Teronis的尸体|r交谈
    .turnin 991 >>交任务: |cRXP_FRIENDLY_莱恩的净化|r
.target Teronis' Corpse
    .accept 1023 >>接任务: |cRXP_LOOT_莱恩的净化|r
step
#xprate <1.7
    #sticky
    #completewith GlowGem
    +请注意这里的神谕者, 他们拥有高伤害的瞬发冲击法术(110点伤害), 并且能恢复至满血
step
#xprate <1.7
	#label GlowGem
    .goto Ashenvale,20.3,42.4
    .complete 1023,1 --Collect Glowing Gem (x1)
step
    .goto Ashenvale,14.7,31.3
.target Talen
>>与|cRXP_FRIENDLY_塔尔伦|r交谈
    .accept 1007 >>接任务: |cRXP_LOOT_远古雕像|r
step
    .goto Ashenvale,14.2,20.6
    >>寻找地面上的小雕像
	>>途中击杀娜迦即可, 无需特意绕路, 我们稍后再杀更多
    .collect 5490,20,1008,1,1
    .complete 1007,1 --Collect Ancient Statuette (x1)
step
    .goto Ashenvale,14.790,31.294
	>>直接击杀你路径上的纳迦
>>与|cRXP_FRIENDLY_塔尔伦|r交谈
    .turnin 1007 >>交任务: |cRXP_FRIENDLY_远古雕像|r
    .timer 25,The Ancient Statuette RP
.target Talen
    .accept 1009 >>接任务: |cRXP_LOOT_卢泽尔|r
step
	.goto Ashenvale,13.5,19.7,60,0
    .goto Ashenvale,7.0,13.4
    >>前往北方的岛屿并击杀卢泽尔
	>>这场战斗可能很艰难, 先集中火力击杀她的一两个小怪, 必要时重新开始
    .complete 1009,1 --Collect Ring of Zoram (x1)
step
    .goto 1414,43.97,35.31,20,0
    .goto 1414,43.80,35.18,20,0
	.goto 1414,43.94,34.89,20,0
	.goto 1414,43.91,34.58,20,0
	.goto 1414,44.02,34.58,20,0
	.goto 1414,44.16,34.85
    >>进入类似寺庙的建筑, 前往BFD洞穴并击杀纳迦和萨蒂尔
    .complete 1275,1
step
    #sticky
    #label naga2
    .goto Ashenvale,13.8,29.1,0,0
	>>完成击杀纳迦
    .complete 1008,1 --Collect Wrathtail Head (x20)
step
    .goto Ashenvale,14.790,31.294
.target Talen
>>与|cRXP_FRIENDLY_塔尔伦|r交谈
    .turnin 1009 >>交任务: |cRXP_FRIENDLY_卢泽尔|r
step
    #requires naga2
    #completewith next
    .hs >>炉石传送至阿斯特兰纳
step
    #requires naga2
    .goto Ashenvale,36.618,49.581
.target Raene Wolfrunner
>>与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
    .turnin 1023 >>交任务: |cRXP_FRIENDLY_莱恩的净化|r
step
	#completewith next
	.destroy 5505>>从你的物品栏中删除特罗尼斯的日记. 它已不再需要
step
#xprate <1.5
    .goto Ashenvale,36.618,49.581
.target Raene Wolfrunner
>>与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
    .accept 1025 >>接任务: |cRXP_LOOT_先发制人|r
step
    .goto Ashenvale,37.3,51.8
.target Pelturas Whitemoon
>>与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
    .turnin 1034 >>交任务: |cRXP_FRIENDLY_星尘废墟|r
step
    .goto Ashenvale,34.7,48.9
.target Shindrell Swiftfire
>>与|cRXP_FRIENDLY_辛德瑞尔·速火|r交谈
    .turnin 1008 >>交任务: |cRXP_FRIENDLY_佐拉姆海岸|r
step
#xprate <1.5
    >>完成任务：击杀怪物以发动先发制人
    .goto Ashenvale,49.9,60.8
    .goto Ashenvale,56.9,63.7
    .complete 1025,1 --Kill Foulweald Den Watcher (x1)
    .complete 1025,2 --Kill Foulweald Ursa (x2)
    .complete 1025,3 --Kill Foulweald Totemic (x10)
    .complete 1025,4 --Kill Foulweald Warrior (x12)
step
#xprate <1.5
    .goto Ashenvale,49.796,67.211
.target Sentinel Velene Starstrike
>>与|cRXP_FRIENDLY_哨兵维尔莉妮·星坠|r交谈
    .accept 1016 >>接任务: |cRXP_LOOT_元素护腕|r
step
#xprate <1.5
    .use 5456 >>击杀岛上或水域中的所有水元素, 以获得完整的元素护腕. 集齐5个后, 右键点击占卜卷轴
    .goto Ashenvale,48.0,69.9
    .complete 1016,1 --Collect Divined Scroll (x1)
step
#xprate <1.5
    .goto Ashenvale,49.796,67.211
.target Sentinel Velene Starstrike
>>与|cRXP_FRIENDLY_哨兵维尔莉妮·星坠|r交谈
    .turnin 1016 >>交任务: |cRXP_FRIENDLY_元素护腕|r
step
#xprate <1.5
    .goto Ashenvale,36.618,49.581
.target Raene Wolfrunner
>>与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
    .turnin 1025 >>交任务: |cRXP_FRIENDLY_先发制人|r
    .isQuestComplete 1025
step
	.goto Ashenvale,34.4,48.0
    .fly Auberdine>>飞往奥伯丁
step
    .goto Darkshore,37.706,43.390
.target Sentinel Glynda Nal'Shea
>>与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .turnin 4740 >>交任务: |cRXP_FRIENDLY_通缉：莫克迪普！|r
    .isQuestComplete 4740
step
    .goto Darkshore,38.36,43.07
.target Gershala Nightwhisper
>>与|cRXP_FRIENDLY_戈沙拉·夜语|r交谈
    .turnin 1275 >>交任务: |cRXP_FRIENDLY_研究堕落|r
step
#xprate <1.7
    .isOnQuest 731
    .goto Darkshore,37.5,41.9
>>与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .turnin 731 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
.target Archaeologist Hollee
	.accept 741 >>接任务: |cRXP_LOOT_健忘的勘察员|r << !Hunter
step << !Hunter
#xprate <1.7
    .isOnQuest 741
    .goto Darkshore,33.1,39.9,30
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
step << !Hunter
#xprate <1.7
    .isOnQuest 741
    #completewith next
    .goto Teldrassil,55.9,89.8
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << !Hunter
#xprate <1.7
    .isOnQuest 741
	.goto Teldrassil,23.703,64.511
>>与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
	.turnin 741 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
.target Chief Archaeologist Greywhisker
	.accept 942 >>接任务: |cRXP_LOOT_健忘的勘察员|r
step << Warrior tbc/Mage
#xprate <1.7
	.goto Teldrassil,29.2,56.7
    .train 227 >>训练法杖
    .isOnQuest 942
step << !Hunter
#xprate <1.7
	.goto Darnassus,30.7,41.3,50 >>前往: |cRXP_PICK_泰达希尔|r
    .zoneskip Darkshore
    .zoneskip Teldrassil
step << !Hunter
#xprate <1.7
    .goto Teldrassil,58.399,94.016
    .fp Rut'theran >>获取鲁瑟兰村的飞行路径
    .zoneskip Darkshore
step << !Hunter
#xprate <1.7
    .fly Auberdine >>飞回奥伯丁
    .zoneskip Darkshore
step << !Paladin wotlk
    >>现在是购买60%坐骑的好时机, 价格约为4金币
    .zone Azuremyst Isle >>前往: |cRXP_PICK_秘蓝岛|r
    .goto Darkshore,30.8,41.0
    .skill riding,1 >>在埃索达学习骑术并购买坐骑
    .goto The Exodar,81.6,51.8
    .skill riding,1,1
step
    .goto Darkshore,32.4,43.8
    >>返回黑海岸码头
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r << wotlk
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r << tbc
step << Draenei tbc/NightElf tbc
#xprate >1.499
    .goto Wetlands,9.5,59.7
    .fp Menethil >>获取米奈希尔港的飞行路径
step << Draenei tbc/NightElf tbc
#xprate >1.499
    #completewith next
    .goto Wetlands,63.9,78.6
    .zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r, 在洞穴后面的蘑菇上注销。当你重新登录时，这会将你传送到塞尔萨玛。
    >>确保登录时尽可能靠近洞穴后方退出. 如果在靠近洞穴入口和离蘑菇较近的位置退出, 这个技巧将失效
    .link https://www.youtube.com/watch?v=21CuGto26Mk >>点击此处查看参考
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
step << NightElf tbc/Draenei tbc
#xprate >1.499
    .goto Loch Modan,33.938,50.954
    .fp Thelsamar >>获取塞尔萨玛的飞行路径
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
step << NightElf tbc/Draenei tbc
#xprate >1.499
    #completewith next
    .goto Loch Modan,21.30,68.60,40,0
    .zone Dun Morogh>>前往丹莫罗
step << NightElf tbc/Draenei tbc
#xprate >1.499
    >>进入东南部的巨魔洞穴. 执行登出跳过
    .goto Dun Morogh,70.63,56.70,60,0
    .goto Dun Morogh,70.60,54.86
    .link https://www.youtube.com/watch?v=yQBW3KyguCM >>点击这里
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
step << NightElf tbc/Draenei tbc
#xprate >1.499
    .goto Ironforge,76.03,50.98,30,0
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
]])

