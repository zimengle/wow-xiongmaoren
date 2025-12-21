local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Horde
#name 1-6 莫高雷
#displayname 1-6 莫高雷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 部落 1-30
#defaultfor Tauren
#next 6-10 莫高雷

step << !Tauren
    #completewith next
    +|cRXP_WARN_您已选择适用于牛头人的指南. 由于该区域存在仅限牛头人的种族任务, 我们不建议您在此区域进行任务. 建议您选择与您起始时相同的起始区域|r
step
    .goto Mulgore,44.875,77.074
.target Grull Hawkwind
>>与|cRXP_FRIENDLY_格鲁尔·鹰风|r谈话
    .accept 747 >>接任务: |cRXP_LOOT_开始狩猎|r
step
	>>进入小屋
    .goto Mulgore,44.2,76.1
.target Chief Hawkwind
>>与|cRXP_FRIENDLY_鹰风酋长|r交谈
    .accept 752 >>接任务: |cRXP_LOOT_一件琐事|r
step << Warrior/Shaman
    #sticky
    #completewith next
    +击杀平原陆行鸟, 收集10铜或更多, 出售垃圾, 用来训练你的1级法术
    .goto Mulgore,45.6,74.0,30,0
step << Warrior/Shaman
    .goto Mulgore,45.3,76.5
    .vendor >>出售垃圾
step << Warrior
    .goto Mulgore,44.008,76.132
    .train 6673 >>训练战斗怒吼
step << Shaman
    .goto Mulgore,45.015,75.941
    .train 8017 >>学习[石化武器]
step
    #sticky
    #completewith Plainstrider
    >>途中击杀平原陆行鸟
    .complete 747,1 --Plainstrider Meat (7)
    .complete 747,2 --Plainstrider Feather (7)
step
    .goto Mulgore,50.0,81.1
>>与|cRXP_FRIENDLY_鹰风酋长的母亲|r交谈
    .turnin 752 >>交任务: |cRXP_FRIENDLY_一件琐事|r
.target Greatmother Hawkwind
    .accept 753 >>接任务: |cRXP_LOOT_一件琐事|r
step
    #label Plainstrider
    >>拾取鹰风身后井中的水罐
    .goto Mulgore,50.2,81.4
    .complete 753,1 --Water Pitcher (1)
step
     >>击杀平原陆行鸟
    .goto Mulgore,44.8,77.0
    .complete 747,1 --Plainstrider Meat (7)
    .complete 747,2 --Plainstrider Feather (7)
step
    .goto Mulgore,44.8,77.0
>>与|cRXP_FRIENDLY_格鲁尔·鹰风|r谈话
    .turnin 747 >>交任务: |cRXP_FRIENDLY_开始狩猎|r
.target Grull Hawkwind
    .accept 3091 >>接任务: |cRXP_LOOT_简易便笺|r << Warrior
    .accept 3092 >>接任务: |cRXP_LOOT_风化便笺|r << Hunter
    .accept 3093 >>接任务: |cRXP_LOOT_符文便笺|r << Shaman
    .accept 3094 >>接任务: |cRXP_LOOT_绿色便笺|r << Druid
    .accept 750 >>接任务: |cRXP_LOOT_继续狩猎|r
step << Hunter
    .goto Mulgore,45.3,76.5
    .vendor >>出售垃圾. 购买1000发子弹(5堆)
step
    .goto Mulgore,44.2,76.1
>>与|cRXP_FRIENDLY_鹰风酋长|r交谈
    .turnin 753 >>交任务: |cRXP_FRIENDLY_一件琐事|r
.target Chief Hawkwind
    .accept 755 >>接任务: |cRXP_LOOT_大地之母仪祭|r
step << Warrior
    .goto Mulgore,44.008,76.132
.target Harutt Thunderhorn
>>与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务: |cRXP_FRIENDLY_简易便笺|r
step << Hunter
    .goto Mulgore,44.3,75.7
.target Lanka Farshot
>>与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .turnin 3092 >>交任务: |cRXP_FRIENDLY_风化便笺|r
step << Warrior
    .goto Mulgore,44.7,77.9
    .vendor >>出售垃圾
step << Druid/Shaman
    .goto Mulgore,44.7,77.9
    .vendor >>出售垃圾. 不要购买水
step
    #completewith next
    >>前往下一个任务途中, 击杀怪物练级至3级, 以便升到4级后进行训练
    .xp 3 >>升级到3级
step
    #completewith next
    >>猎杀美洲狮获取毛皮
    .goto Mulgore,47.7,91.9,0
    .complete 750,1 --Mountain Cougar Pelt (10)
step
    >>途中刷怪
    .goto Mulgore,42.573,92.187
>>与|cRXP_FRIENDLY_灰舌先知|r交谈
    .turnin 755 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
.target Seer Graytongue
    .accept 757 >>接任务: |cRXP_LOOT_力量仪祭|r
step
    .goto Mulgore,45.44,90.56
    >>猎杀美洲狮获取毛皮
    .complete 750,1 --Mountain Cougar Pelt (10)
step << !Druid !Shaman
	>>在前往任务交割地点的路上刷怪
    .goto Mulgore,44.9,77.0
    .xp 3+1150 >>升级至1150/1400经验值
step << Druid/Shaman
	>>在前往任务交割地点的路上刷怪
    .goto Mulgore,44.9,77.0
    .xp 3+1110 >>升级至1110+/1400经验
step << Warrior/Hunter
    >>确保你拥有价值1银90铜的可售物品. 如果没有, 就多刷一些
    .goto Mulgore,44.9,77.0
>>与|cRXP_FRIENDLY_格鲁尔·鹰风|r谈话
    .turnin 750 >>交任务: |cRXP_FRIENDLY_继续狩猎|r
.target Grull Hawkwind
    .accept 780 >>接任务: |cRXP_LOOT_斗猪|r
step << Druid
    >>确保你拥有价值约2秒的可出售物品, 如果没有, 就多刷一些
    .goto Mulgore,44.9,77.0
>>与|cRXP_FRIENDLY_格鲁尔·鹰风|r谈话
    .turnin 750 >>交任务: |cRXP_FRIENDLY_继续狩猎|r
.target Grull Hawkwind
    .accept 780 >>接任务: |cRXP_LOOT_斗猪|r
step << Shaman
    .goto Mulgore,44.9,77.0
>>与|cRXP_FRIENDLY_格鲁尔·鹰风|r谈话
    .turnin 750 >>交任务: |cRXP_FRIENDLY_继续狩猎|r
.target Grull Hawkwind
    .accept 780 >>接任务: |cRXP_LOOT_斗猪|r
step
    .goto Mulgore,45.3,76.5
    .vendor >>出售垃圾
step << Druid
    .goto Mulgore,45.090,75.931
.target Gart Mistrunner
>>与|cRXP_FRIENDLY_加尔特·迷雾行者|r交谈
    .turnin 3094 >>交任务: |cRXP_FRIENDLY_绿色便笺|r
    .train 8921 >>学习月火术
step << Shaman
    .goto Mulgore,45.015,75.941
.target Meela Dawnstrider
>>与|cRXP_FRIENDLY_米拉·晨行者|r交谈
    .turnin 3093 >>交任务: |cRXP_FRIENDLY_符文便笺|r
    .trainer >>训练你的职业法术
step << Shaman
    .goto Mulgore,44.7,76.2
.target Seer Ravenfeather
>>与|cRXP_FRIENDLY_鸦羽先知|r交谈
    .accept 1519 >>接任务: |cRXP_LOOT_大地的召唤|r
step
    >>与风羽交谈. 她会在营地周围巡逻
    .goto Mulgore,45.0,76.4
.target Brave Windfeather
>>与|cRXP_FRIENDLY_卫兵维萨罗·风羽|r交谈
    .accept 3376 >>接任务: |cRXP_LOOT_刺鬃酋长|r
step << Hunter
    .goto Mulgore,44.3,75.7
    .trainer >>训练你的职业法术
step << Warrior
    .goto Mulgore,44.008,76.132
    .trainer >>训练你的职业法术
step
    #completewith nomoreboar
    .xp 4+1800 >>刷鬃蹄兽直到经验达到1800/2100, 升到6级后前往血蹄村训练
step
    .goto Mulgore,58.2,85.0
    >>击杀洞穴外的斗猪, 收集它们的侧腹和猪鼻
    .complete 780,2 --Battleboar Flank (8)
    .complete 780,1 --Battleboar Snout (8)
step
    .isOnQuest 757
    .goto Mulgore,59.7,83.2,40 >>穿过洞穴
step
    #sticky
	#completewith Sharptusk
    #label Belt
    >>击杀刺背兽获取它们的腰带
    >>击杀刺背萨满祭司并搜刮他们的药膏 << Shaman
    .complete 757,1 --Bristleback Belt (12)
    .unitscan Bristleback Shaman << Shaman
    .complete 1519,1 << Shaman --Ritual Salve(2)
step
    #label Sharptusk
    >>击杀大屋内的尖牙
    .goto Mulgore,64.3,77.9
    .unitscan Chief Sharptusk Thornmantle
    .complete 3376,1 --Chief Sharptusk Thornmantle's Head (1)
step
    #completewith nomoreboar
    >>击杀刺背兽并搜刮它们的腰带
    >>击杀刺背萨满祭司并搜刮他们的药膏 << Shaman
    .goto Mulgore,63.0,77.8
    .complete 757,1 --Bristleback Belt (12)
    .unitscan Bristleback Shaman << Shaman
    .complete 1519,1 << Shaman --Ritual Salve (2)
step
    #requires Belt
    >>进入洞穴, 搜刮中心的攻击计划并接受任务
    .goto Mulgore,63.2,82.7
    .collect 4850,1,24857 --Collect Bristleback Attack Plans.
    .accept 24857 >>接任务: |cRXP_LOOT_纳拉其营地的危机|r
step
	#label nomoreboar
	#completewith next
    .hs >>传送至纳拉其营地
step
    .goto Mulgore,44.9,77.0
.target Grull Hawkwind
>>与|cRXP_FRIENDLY_格鲁尔·鹰风|r谈话
    .turnin 780 >>交任务: |cRXP_FRIENDLY_斗猪|r
step
    #completewith next
    .goto Mulgore,44.65,77.90
    .vendor >>出售垃圾
step << Shaman
    .goto Mulgore,44.7,76.2
>>与|cRXP_FRIENDLY_鸦羽先知|r交谈
    .turnin 1519 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
.target Seer Ravenfeather
    .accept 1520 >>接任务: |cRXP_LOOT_大地的召唤|r
step << Shaman
    .goto Mulgore,53.893,80.538,90 >>前往岩石处
step << Shaman
    >>使用背包中的大地灵契
    .goto Mulgore,53.893,80.538
>>与|cRXP_FRIENDLY_大地之魂|r交谈
    .turnin 1520 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
.target Minor Manifestation of Earth
    .accept 1521 >>接任务: |cRXP_LOOT_大地的召唤|r
step << Shaman
    .goto Mulgore,44.7,76.2
.target Seer Ravenfeather
>>与|cRXP_FRIENDLY_鸦羽先知|r交谈
    .turnin 1521 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
step
    >>与风羽交谈. 她会在营地周围巡逻
    .goto Mulgore,44.526,76.504
.target Brave Windfeather
>>与|cRXP_FRIENDLY_卫兵维萨罗·风羽|r交谈
    .turnin 3376 >>交任务: |cRXP_FRIENDLY_刺鬃酋长|r
step
    .goto Mulgore,44.2,76.1
>>与|cRXP_FRIENDLY_鹰风酋长|r交谈
    .turnin 24857 >>交任务: |cRXP_FRIENDLY_纳拉其营地的危机|r
    .turnin 757 >>交任务: |cRXP_FRIENDLY_力量仪祭|r
.target Chief Hawkwind
    .accept 763 >>接任务: |cRXP_LOOT_大地之母仪祭|r
step
    .goto Mulgore,38.5,81.6
.target Antur Fallow
>>与|cRXP_FRIENDLY_安图尔·荒野|r交谈
    .accept 1656 >>接任务: |cRXP_LOOT_未完的任务|r
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Horde
#name 6-10 莫高雷
#displayname 6-10 莫高雷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 部落 1-30
#defaultfor Tauren
#next 10-12 永歌森林 << !Warrior !Shaman
#next 10-13 莫高雷 << Warrior/Shaman


step
	.goto Mulgore,46.5,55.5
    .xp 5+2395 >>刷怪积累经验值, 直到达到2395/2800, 然后前往城镇
step
    #softcore
	#completewith next
    .goto Mulgore,46.5,55.5,300
    .deathskip >>死亡后在灵魂医者处复活, 或前往血蹄村
step
	#hardcore
	#completewith next
    .goto Mulgore,48.3,53.3,100 >>跑向血蹄村 << !Hunter
    .goto Mulgore,47.3,62.0,100 >>跑向血蹄村 << Hunter
step << !Hunter
    .goto Mulgore,48.3,53.3
.target Ahab Wheathoof
>>与|cRXP_FRIENDLY_阿哈布·麦蹄|r交谈
    .accept 11129 >>接任务: |cRXP_LOOT_凯雷失踪了！|r
step << !Hunter
    .goto Mulgore,47.0,57.0
.target Maur Raincaller
>>与|cRXP_FRIENDLY_茂尔·祈雨|r交谈
    .accept 766 >>接任务: |cRXP_LOOT_马兹拉纳其|r
step << Shaman/Druid
    .goto Mulgore,45.7,58.6
     >>出售垃圾, 如果能赚到足够的钱买一根手杖(4s 80c). 如果没有足够钱, 就跳过这一步
    .collect 2495,1 --Collect Walking Stick
step << Warrior
    .goto Mulgore,45.7,58.6
     >>出售垃圾, 如果能凑够购买一把木槌棒(6s 66c)的钱. 如果不够, 就跳过这一步
    .collect 2493,1 --Collect Wooden Mallet
step << !Hunter
    .goto Mulgore,46.622,61.094
.target Innkeeper Kauth
>>与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
    .turnin 1656 >>交任务: |cRXP_FRIENDLY_未完的任务|r
step << !Hunter
	.goto Mulgore,46.622,61.094
    #completewith next
    .home >>将你的[炉石]设置为血蹄村
step << !Hunter
    .goto Mulgore,47.513,60.164
>>与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .turnin 763 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
.target Baine Bloodhoof
    .accept 745 >>接任务: |cRXP_LOOT_土地之争|r
    .accept 767 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .accept 746 >>接任务: |cRXP_LOOT_矮人的挖掘场|r
step << !Hunter
    .goto Mulgore,47.8,57.6
>>与|cRXP_FRIENDLY_扎尔曼·双月|r交谈
    .turnin 767 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
.target Zarlman Two-Moons
    .accept 771 >>接任务: |cRXP_LOOT_幻象仪祭|r
step << Shaman
        #completewith next
    .goto Mulgore,48.4,59.2
    .trainer >>训练你的职业法术
step << !Hunter
    .goto Mulgore,48.715,59.325
.target Harken Windtotem
>>与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .accept 761 >>接任务: |cRXP_LOOT_猎捕猛鹫|r
step << Druid
        #completewith next
    .goto Mulgore,48.5,59.6
    .trainer >>训练你的职业法术
step << !Hunter
    .goto Mulgore,48.6,60.4
.target Mull Thunderhorn
>>与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .accept 748 >>接任务: |cRXP_LOOT_毒水|r
step << Warrior
        #completewith next
    .goto Mulgore,49.515,60.586
    .trainer >>训练你的职业法术
step
    .goto Mulgore,47.3,62.0
.target Ruul Eagletalon
>>与|cRXP_FRIENDLY_卢尔·鹰爪|r交谈
    .accept 743 >>接任务: |cRXP_LOOT_风怒鹰身人|r
step << Hunter
    .goto Mulgore,47.513,60.164
>>与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .turnin 763 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
.target Baine Bloodhoof
    .accept 745 >>接任务: |cRXP_LOOT_土地之争|r
    .accept 767 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .accept 746 >>接任务: |cRXP_LOOT_矮人的挖掘场|r
step << Hunter
    .goto Mulgore,46.622,61.094
.target Innkeeper Kauth
>>与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
    .turnin 1656 >>交任务: |cRXP_FRIENDLY_未完的任务|r
step << Hunter
	.goto Mulgore,46.622,61.094
    .home >>将你的[炉石]设置为血蹄村
step << Hunter
    .goto Mulgore,48.6,60.4
.target Mull Thunderhorn
>>与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .accept 748 >>接任务: |cRXP_LOOT_毒水|r
step << Hunter
    .goto Mulgore,48.715,59.325
.target Harken Windtotem
>>与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .accept 761 >>接任务: |cRXP_LOOT_猎捕猛鹫|r
step << Hunter
    .goto Mulgore,47.8,57.6
>>与|cRXP_FRIENDLY_扎尔曼·双月|r交谈
    .turnin 767 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
.target Zarlman Two-Moons
    .accept 771 >>接任务: |cRXP_LOOT_幻象仪祭|r
step << Hunter
    .goto Mulgore,45.5,58.5
     >>出售垃圾. 如果能凑够足够的金币购买华丽火枪(3银93铜), 就执行此步骤；如果没有足够金币, 请跳过这一步
    .collect 2509,1 --Collect Ornate Blunderbuss
step << Hunter
    .goto Mulgore,47.0,57.0
.target Maur Raincaller
>>与|cRXP_FRIENDLY_茂尔·祈雨|r交谈
    .accept 766 >>接任务: |cRXP_LOOT_马兹拉纳其|r
step << Hunter
    #completewith next
    .goto Mulgore,47.820,55.688
    .trainer >>训练你的职业法术
	.money <0.01
step << Hunter
    .goto Mulgore,48.3,53.3
.target Ahab Wheathoof
>>与|cRXP_FRIENDLY_阿哈布·麦蹄|r交谈
    .accept 11129 >>接任务: |cRXP_LOOT_凯雷失踪了！|r
step
    #sticky
    #completewith Gnolls
    >>在该区域完成任务时, 收集马兹拉纳其所需的物品. 琥珀颗粒可于树下找到
    .complete 771,2 --Ambercorn (2)
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    .goto Mulgore,55.9,63.1,90,0
    .goto Mulgore,51.1,66.5,90,0
    .goto Mulgore,40.7,73.0,90,0
    .goto Mulgore,55.9,63.1
    >>击杀狼获取爪子, 击杀平原陆行鸟获取利爪. 击杀一只平原陆行鸟获得嫩陆行鸟肉
    .complete 748,1 --Prairie Wolf Paw (6)
    .complete 748,2 --Plainstrider Talon (4)
    .collect 33009,1 --Collect Tender Strider Meat (1)
step << Tauren
    #completewith Gnolls
    .itemcount 33009,1
    .use 33009 >>如果你看到疯狂的凯雷, 走近他并使用嫩Stride肉. 现在不用急着完成这个任务
    .complete 11129,1 --Kyle Fed (1)
	.unitscan Kyle the Frenzied
step << Tauren
    .goto Mulgore,48.5,60.4
>>与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .turnin 748 >>交任务: |cRXP_FRIENDLY_毒水|r
.target Mull Thunderhorn
    .accept 754 >>接任务: |cRXP_LOOT_净化冰蹄之井|r
step
    #label Stones
    .goto Mulgore,53.7,66.3
    >>收集井周围的石头
    .complete 771,1 --Well Stone (2)
step << Tauren
    .goto Mulgore,53.7,66.3
    .use 5411 >>在井边使用[冰蹄之井净化图腾]
    .complete 754,1 --Cleanse the Winterhoof Water Well (1)
step
    #label Gnolls
    #requires Stones
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0
    >>在两个营地之间来回穿梭, 击杀豺狼人. 注意断矛, 这是一个等级为9的稀有怪物, 攻击非常强力
    .complete 745,1 --Palemane Tanner (10)
    .complete 745,2 --Palemane Skinner (8)
    .complete 745,3 --Palemane Poacher (5)
    .unitscan Snagglespear
step
    >>从树下收集两颗琥珀颗粒
    .goto Mulgore,49.3,56.2,15,0
    .goto Mulgore,52.0,61.1,15,0
    .goto Mulgore,50.0,66.4,15,0
    .goto Mulgore,50.4,66.5
    .complete 771,2 --Ambercorn (2)
step
    #completewith Vision
    .use 33009 >>如果你看到疯狂的凯雷, 走近他并使用嫩Stride肉. 现在不用急着完成这个任务
    .complete 11129,1 --Kyle Fed (1)
	.unitscan Kyle the Frenzied
step
    .goto Mulgore,47.6,61.5
        #completewith next
    .vendor >>出售垃圾
step << Tauren
    .goto Mulgore,48.5,60.4
>>与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .turnin 754 >>交任务: |cRXP_FRIENDLY_净化冰蹄之井|r
.target Mull Thunderhorn
    .accept 756 >>接任务: |cRXP_LOOT_雷角图腾|r
step << Warrior
    #completewith next
    .goto Mulgore,49.515,60.586
    .trainer >>训练剩余的职业技能
step << Shaman
    #completewith next
    .goto Mulgore,48.4,59.2
    .trainer >>训练剩余的职业技能
step << Druid
    #completewith next
    .goto Mulgore,48.5,59.6
    .trainer >>训练剩余的职业技能
step
    .goto Mulgore,47.513,60.164
.target Baine Bloodhoof
>>与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .turnin 745 >>交任务: |cRXP_FRIENDLY_土地之争|r
step << Warrior
        #completewith next
    .goto Mulgore,46.8,60.8
	.money <0.01
    .trainer >>学习急救技能
step << Shaman/Druid
    .goto Mulgore,45.7,58.6
     >>出售垃圾. 如果能凑够购买手杖(4s 80c)的钱, 就卖掉它；如果没有足够的钱, 就跳过这一步
    .collect 2495,1 --Collect Walking Stick
step << Warrior
    .goto Mulgore,45.7,58.6
     >>出售垃圾. 如果能凑够足够的钱(6s 66c)购买木槌棒, 就卖掉它；如果没有足够的钱, 就跳过这一步
    .collect 2493,1 --Collect Wooden Mallet
step << Hunter
    .goto Mulgore,45.5,58.5
    .money <0.0380
     >>出售垃圾. 如果能凑够购买华丽火枪(3银80铜), 就执行此步骤；否则跳过
    .collect 2509,1 --Collect Ornate Blunderbuss
step
    #label Vision
    >>不要跟随生成的狼
    .goto Mulgore,47.8,57.5
>>与|cRXP_FRIENDLY_扎尔曼·双月|r交谈
    .turnin 771 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
.target Zarlman Two-Moons
    .accept 772 >>接任务: |cRXP_LOOT_幻象仪祭|r
step
    .goto Mulgore,47.3,56.9,60,0
    .goto Mulgore,49.4,63.9,60,0
    .goto Mulgore,50.2,60.2,60,0
    .goto Mulgore,46.8,59.6,60,0
    .goto Mulgore,47.3,56.9
    .use 33009 >>沿逆时针方向寻找狂怒的凯雷, 使用鲜嫩的陆行鸟肉对他
	.complete 11129,1 --Kyle Fed (1)
	.unitscan Kyle the Frenzied
step << Hunter
	#completewith next
    .goto Mulgore,47.820,55.688
    .trainer >>训练剩余的职业技能
step
    .goto Mulgore,48.2,53.3
.target Ahab Wheathoof
>>与|cRXP_FRIENDLY_阿哈布·麦蹄|r交谈
    .turnin 11129 >>交任务: |cRXP_FRIENDLY_凯雷失踪了！|r
step
    >>寻找莫林·云行者. 他沿着东侧道路巡逻
    .goto Mulgore,51.1,58.6,50,0
    .goto Mulgore,59.7,62.5,50,0
    .goto Mulgore,51.1,58.6
.target Morin Cloudstalker
>>与|cRXP_FRIENDLY_摩林·云行者|r交谈
    .accept 749 >>接任务: |cRXP_LOOT_不幸的商队|r
	.unitscan Morin Cloudstalker
step
    #label Mazzranache
    #completewith Clawsx
    >>在该区域完成任务时, 收集马兹拉纳其所需的物品
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    .goto Mulgore,53.8,48.3
	>>途中击杀美洲狮和狼, 然后点击商队中央的箱子
    .turnin 749 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 751 >>接任务: |cRXP_LOOT_不幸的商队|r
step
	#completewith Burial
    .goto Mulgore,54.15,27.81,0
	>>击杀莫高雷各地的猛鹫, 搜刮它们的羽毛
    .complete 761,1 --Trophy Swoop Quill (8)
step
	#label Clawsx
    >>击杀该区域的潜行者和美洲狮, 掠夺它们的利爪
    .goto Mulgore,58.1,48.6,60,0
    .goto Mulgore,54.5,40.1,60,0
    .goto Mulgore,46.4,50.7,60,0
    .goto Mulgore,58.1,48.6
    .complete 756,1 --Stalker Claws (6)
    .complete 756,2 --Cougar Claws (6)
--step
    #softcore
    #completewith TotemW
    .goto Mulgore,46.5,55.5,200
    .deathskip >>死亡后在灵魂医者处复活, 或前往血蹄村
step
    #hardcore
    #completewith TotemW
    .goto Mulgore,46.5,55.5,200 >>跑回血蹄村
step
    .isQuestComplete 766
    .goto Mulgore,47.0,57.2
.target Maur Raincaller
>>与|cRXP_FRIENDLY_茂尔·祈雨|r交谈
    .turnin 766 >>交任务: |cRXP_FRIENDLY_马兹拉纳其|r
step
    #completewith next
    .goto Mulgore,46.2,58.2
    .vendor >>出售垃圾
step
	#label TotemW
    .goto Mulgore,48.5,60.4
>>与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .turnin 756 >>交任务: |cRXP_FRIENDLY_雷角图腾|r
.target Mull Thunderhorn
    .accept 758 >>接任务: |cRXP_LOOT_净化雷角之井|r
step
	.isQuestComplete 761
    .goto Mulgore,48.7,59.4
.target Harken Windtotem
>>与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
step << Shaman
        #completewith next
    .goto Mulgore,48.4,59.2
    .trainer >>训练你的职业法术
step << Druid
        #completewith next
    .goto Mulgore,48.5,59.6
    .trainer >>训练你的职业法术
step << Warrior
        #completewith next
    .goto Mulgore,49.515,60.586
    .trainer >>训练你的职业法术
step << Shaman/Druid
    .goto Mulgore,45.7,58.6
     >>出售垃圾. 如果能凑够购买手杖(4s 80c)的钱, 就卖掉它；如果没有足够的钱, 就跳过这一步
    .collect 2495,1 --Collect Walking Stick
step << Warrior
    .goto Mulgore,45.7,58.6
     >>出售垃圾. 如果能凑够足够的钱(6s 66c)购买木槌棒, 就卖掉它；如果没有足够的钱, 就跳过这一步
    .collect 2493,1 --Collect Wooden Mallet
step << Hunter
    .goto Mulgore,45.5,58.5
     >>出售垃圾. 如果能凑够购买华丽火枪(3银83铜)的钱, 就卖掉它；如果没有足够的钱, 就跳过这一步
    .collect 2509,1 --Collect Ornate Blunderbuss
step << Warrior
    .goto Mulgore,46.7,60.7
    .vendor >>出售垃圾. 尽可能多买些刚出炉的面包
step << Druid/Shaman
    .goto Mulgore,46.7,60.7
    .vendor >>出售垃圾. 尽可能多买冰镇牛奶
step
    .goto Mulgore,44.5,45.3
    .use 5415 >>在井中使用[雷角之井净化图腾]
    .complete 758,1 --Cleanse the Thunderhorn Water Well (1)
step
    #completewith Burial
    >>完成收集马兹拉纳其所需的物品
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    .goto Mulgore,31.3,49.9
   >>击杀矮人怪物以获取勘探者的镐子
	.collect 4702,5 -- Collect Prospector's Pick (5)
step
	.goto Mulgore,31.3,49.9
	.use 4702 >>使用镐头在熔炉上敲击, 直到摧毁全部5个熔炉
    .complete 746,1 --Broken Tools (5)
step
    >>击杀鹰身女妖, 搜刮它们的利爪
    .goto Mulgore,31.9,41.7
    .complete 743,1 --Windfury Talon (8)
step
	#label Burial
    .goto Mulgore,32.714,36.087
>>与|cRXP_FRIENDLY_先知奥萨迪·智慧行者|r交谈
    .turnin 772 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
.target Seer Wiserunner
    .accept 773 >>接任务: |cRXP_LOOT_智慧仪祭|r
step
    #completewith DeleteWater
    .itemcount 4823,1
	.goto Mulgore,54.15,27.81
	.destroy 4823 >>摧毁: |cRXP_ENEMY_先知之水|r
step
	#completewith next
    .goto Mulgore,54.15,27.81
	>>击杀莫高雷各地的猛鹫, 搜刮它们的羽毛
    .complete 761,1 --Trophy Swoop Quill (8)
step
    .goto Mulgore,54.15,27.81
    >>完成收集马兹拉纳其所需的物品
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
--X waypoints for each item
step
    .goto Mulgore,54.15,27.81
	>>击杀莫高雷各地的猛鹫, 搜刮它们的羽毛
    .complete 761,1 --Trophy Swoop Quill (8)
step
    #label DeleteWater
    .goto Mulgore,59.9,25.6
.target Lorekeeper Raintotem
>>与|cRXP_FRIENDLY_博学者诺拉·暴雨图腾|r交谈
    .accept 833 >>接任务: |cRXP_LOOT_神圣的墓地|r
step
    >>击杀该区域内的刺背干涉者
    .goto Mulgore,61.5,21.9
    .complete 833,1 --Bristleback Interloper (8)
step
    .goto Mulgore,61.5,21.1
>>与|cRXP_FRIENDLY_先祖之魂|r交谈
    .turnin 773 >>交任务: |cRXP_FRIENDLY_智慧仪祭|r
.target Ancestral Spirit
    .accept 775 >>接任务: |cRXP_LOOT_雷霆崖之旅|r
step
    .goto Mulgore,59.8,25.6
.target Lorekeeper Raintotem
>>与|cRXP_FRIENDLY_博学者诺拉·暴雨图腾|r交谈
    .turnin 833 >>交任务: |cRXP_FRIENDLY_神圣的墓地|r
step
    .goto Mulgore,61.5,21.9
    .xp 9+4400 >>升级至4450/6500经验值
step << !Druid
    #completewith hsfailsafe3
    .hs >>传送至血蹄村
--step << Druid
    #completewith next
    .goto Mulgore,54.76,35.10
    .deathskip >>死亡后在灵魂医者处复活, 或前往血蹄村
step << !Hunter
    .goto Mulgore,47.0,57.2
.target Maur Raincaller
>>与|cRXP_FRIENDLY_茂尔·祈雨|r交谈
    .turnin 766 >>交任务: |cRXP_FRIENDLY_马兹拉纳其|r
step
    .goto Mulgore,48.7,59.4
.target Harken Windtotem
>>与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
step
    .goto Mulgore,48.5,60.4
>>与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .turnin 758 >>交任务: |cRXP_FRIENDLY_净化雷角之井|r
.target Mull Thunderhorn
    .accept 759 >>接任务: |cRXP_LOOT_蛮鬃图腾|r << !Hunter !Druid
step << !Hunter
    .goto Mulgore,47.513,60.164
.target Baine Bloodhoof
>>与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .turnin 746 >>交任务: |cRXP_FRIENDLY_矮人的挖掘场|r
step << !Hunter !Druid
    .goto Mulgore,46.9,60.2
.target Skorn Whitecloud
>>与|cRXP_FRIENDLY_斯考恩·白云|r交谈
    .accept 861 >>接任务: |cRXP_LOOT_猎人之道|r
step
    #label hsfailsafe3
    .goto Mulgore,47.4,62.0
.target Ruul Eagletalon
>>与|cRXP_FRIENDLY_卢尔·鹰爪|r交谈
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
step << Druid
    .isOnQuest 759
    .goto Mulgore,48.5,59.6
    .abandon 759 >>放弃蛮鬃图腾
step << Shaman
        #completewith next
    .goto Mulgore,48.4,59.2
.target Narm Skychaser
>>与|cRXP_FRIENDLY_纳姆·逐星|r交谈
    .accept 2984 >>接任务: |cRXP_LOOT_火焰的召唤|r
     .trainer >>训练你的职业法术
step << Druid
     #completewith next
     .goto Mulgore,48.5,59.6
     .trainer >>训练你的职业法术
step << Druid
    .goto Mulgore,48.5,59.6
.target Harene Plainwalker
>>与|cRXP_FRIENDLY_哈雷尼·平原行者|r交谈
    .accept 5928 >>接任务: |cRXP_LOOT_响应召唤|r
step << Warrior
        #completewith next
    .goto Mulgore,49.515,60.586
.target Sorek
.target Tarshaw Jaggedscar
.target Krang Stonehoof
>>与|cRXP_FRIENDLY_克朗·石蹄|r交谈
-->>与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
-->>与|cRXP_FRIENDLY_索瑞克|r交谈
    .accept 1505 >>接任务: |cRXP_LOOT_老兵犹塞克|r
     .trainer >>训练你的职业法术
step << Hunter
    .goto Mulgore,47.513,60.164
.target Baine Bloodhoof
>>与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .turnin 746 >>交任务: |cRXP_FRIENDLY_矮人的挖掘场|r
step << Hunter
    .goto Mulgore,48.5,60.4
.target Mull Thunderhorn
>>与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .turnin 758 >>交任务: |cRXP_FRIENDLY_净化雷角之井|r
step << !Warrior !Shaman
    .goto Mulgore,47.0,57.2
  .abandon 759 >>放弃蛮鬃图腾
step << Hunter
    #requires mazzranache2
    .goto Mulgore,47.0,57.2
.target Maur Raincaller
>>与|cRXP_FRIENDLY_茂尔·祈雨|r交谈
    .turnin 766 >>交任务: |cRXP_FRIENDLY_马兹拉纳其|r
step << Hunter
    #sticky
        #completewith next
    .goto Mulgore,47.7,55.7
     .trainer >>训练你的宠物法术
step << Hunter
        #completewith next
    .goto Mulgore,47.820,55.688
.target Yaw Sharpmane
>>与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .accept 6061 >>接任务: |cRXP_LOOT_驯服野兽|r
     .trainer >>训练你的职业法术
step << Hunter
    .use 15914 >>在你的背包中使用驯兽棒对平原陆行鸟进行捕捉, 尽量在最大距离(30码)处操作
    .goto Mulgore,53.7,62.2
    .complete 6061,1 --Tame an Adult Plainstrider (1)
step << Hunter
    .goto Mulgore,47.820,55.688
>>与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6061 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
.target Yaw Sharpmane
    .accept 6087 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
    .use 15915 >>在背包中使用驯兽棒对潜行者进行驯服, 尽量在最大距离(30码)处操作
    .goto Mulgore,47.1,48.3
    .complete 6087,1 --Tame a Prairie Stalker (1)
step << Hunter
    .goto Mulgore,47.820,55.688
>>与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6087 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
.target Yaw Sharpmane
    .accept 6088 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
    .use 15916 >>在背包中点击驯兽棒, 对掠夺者使用. 尽量在最远距离施放, 并在被击倒时立即重新施放. 如果你失败且驯兽棒的充能次数用尽, 请放弃任务后重新拾取并返回
    .goto Mulgore,43.3,51.4
    .complete 6088,1 --Tame a Swoop (1)
step << Hunter
    .goto Mulgore,47.820,55.688
>>与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6088 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
.target Yaw Sharpmane
    .accept 6089 >>接任务: |cRXP_LOOT_训练野兽|r
step << Warrior/Shaman
    >>寻找莫林·云行者. 他沿着东侧道路巡逻
    .goto Mulgore,51.1,58.6,30,0
    .goto Mulgore,59.7,62.5,30,0
    .goto Mulgore,51.1,58.6,30,0
    .goto Mulgore,59.7,62.5,30,0
    .goto Mulgore,51.1,58.6,30,0
    .goto Mulgore,59.7,62.5
>>与|cRXP_FRIENDLY_摩林·云行者|r交谈
    .turnin 751 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
.target Morin Cloudstalker
    .accept 764 >>接任务: |cRXP_LOOT_风险投资公司|r
    .accept 765 >>接任务: |cRXP_LOOT_菲兹普罗克主管|r
    .unitscan Morin Cloudstalker
--X WIP
step << Druid/Hunter
    >>寻找莫林·云行者. 他沿着东侧道路巡逻. 跳过后续任务
    .goto Mulgore,51.1,58.6,30,0
    .goto Mulgore,59.7,62.5,30,0
    .goto Mulgore,51.1,58.6,30,0
    .goto Mulgore,59.7,62.5,30,0
    .goto Mulgore,51.1,58.6,30,0
    .goto Mulgore,59.7,62.5
.target Morin Cloudstalker
>>与|cRXP_FRIENDLY_摩林·云行者|r交谈
    .turnin 751 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
	.unitscan Morin Cloudstalker
step << Tauren Warrior/Tauren Shaman
    >>击杀该区域的狼, 搜刮它们的牙齿
    .goto Mulgore,62.48,66.93,80,0
    .goto Mulgore,66.9,67.2,80,0
    .goto Mulgore,66.66,58.40,80,0
    .goto Mulgore,62.38,57.56,80,0
    .complete 759,1 --Prairie Alpha Tooth (8)
step << Warrior tbc/Shaman tbc
    #sticky
    #completewith next
    .goto Mulgore,46.5,55.5,200 >>死亡后在灵魂医者处复活, 或前往血蹄村
step << Tauren Warrior/Tauren Shaman
    >>跑回血蹄村 << wotlk
    .goto Mulgore,48.5,60.4
>>与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .turnin 759 >>交任务: |cRXP_FRIENDLY_蛮鬃图腾|r
.target Mull Thunderhorn
    .accept 760 >>接任务: |cRXP_LOOT_净化蛮鬃之井|r
step
    .goto Mulgore,69.6,60.4,100 >>前往: |cRXP_PICK_贫瘠之地|r
step << Druid/Hunter
    .abandon 765 >>Abandon Supervisor Fizsprocket
    .abandon 764 >>Abandon 接任务: |cRXP_WARN_风险投资公司|r.
step << !Druid
    .goto The Barrens,44.5,59.1
    .fp Camp Taurajo >>获取陶拉祖营地飞行路径
step << Druid
	#completewith next
    .goto The Barrens,44.5,59.1
    .fp Camp Taurajo >>获取陶拉祖营地飞行路径
step << Druid
    .goto The Barrens,44.5,59.1
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
step << Druid
        #completewith next
    .goto Thunder Bluff,45.8,64.4
    .home >>将你的炉石设置为雷霆崖
step << Druid
    .goto Thunder Bluff,78.1,28.6
.target Arch Druid Hamuul Runetotem
>>与|cRXP_FRIENDLY_大德鲁伊哈缪尔·符文图腾|r交谈
    .accept 886 >>接任务: |cRXP_LOOT_贫瘠之地的绿洲|r
step << Druid
    .goto Thunder Bluff,76.7,27.3
.target Turak Runetotem
>>与|cRXP_FRIENDLY_图拉克·符文图腾|r谈话
    .turnin 5928 >>交任务: |cRXP_FRIENDLY_响应召唤|r
step << Druid
    .goto Thunder Bluff,77.0,27.5
.target Turak Runetotem
>>与|cRXP_FRIENDLY_图拉克·符文图腾|r谈话
    .accept 5922 >>接任务: |cRXP_LOOT_月光林地|r
step << Druid
    .cast 18960 >>使用你的新法术传送至月光林地
>>与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 5922 >>交任务: |cRXP_FRIENDLY_月光林地|r
    .goto Moonglade,56.209,30.636
.target Dendrite Starblaze
    .accept 5930 >>接任务: |cRXP_LOOT_巨熊之灵|r
step << Druid
    .goto Moonglade,39.2,27.5
    .complete 5930,1 --Seek out the Great Bear Spirit and learn what it has to share with you about the nature of the bear. (1)
    .skipgossip
step << Druid
    .cast 18960 >>传送回月光林地
>>与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 5930 >>交任务: |cRXP_FRIENDLY_巨熊之灵|r
    .goto Moonglade,56.209,30.636
.target Dendrite Starblaze
    .accept 5932 >>接任务: |cRXP_LOOT_返回雷霆崖|r
step << Druid
	#completewith next
    .hs >>炉石传送至雷霆崖
step << Druid
    .goto Thunder Bluff,76.477,27.221
>>与|cRXP_FRIENDLY_图拉克·符文图腾|r谈话
    .turnin 5932 >>交任务: |cRXP_FRIENDLY_返回雷霆崖|r
.target Turak Runetotem
    .accept 6002 >>接任务: |cRXP_LOOT_身心之力|r
step << Druid
    .goto Thunder Bluff,47.003,49.832
    .fly Camp Taurajo >>飞往陶拉霍营地
step << Druid
    .use 15710 >>跑到月夜枭兽之石处, 使用塞纳里奥月尘. 击杀月爪枭兽后, 再与她交谈
    .goto The Barrens,42.0,60.9
    .complete 6002,1 --Face Lunaclaw and earn the strength of body and heart it possesses.
    .skipgossip
--This complete has been added manually, might be scuffed
step << Tauren
    .goto The Barrens,44.9,58.6
.target Kirge Sternhorn
>>与|cRXP_FRIENDLY_基尔格·锐角|r交谈
    .accept 854 >>接任务: |cRXP_LOOT_十字路口之旅|r
step << Druid
    .goto The Barrens,52.2,31.9
>>与|cRXP_FRIENDLY_图加·符文图腾|r谈话
    .turnin 886 >>交任务: |cRXP_FRIENDLY_贫瘠之地的绿洲|r
.target Tonga Runetotem
    .accept 870 >>接任务: |cRXP_LOOT_遗忘之池|r
step << !Druid
    .goto The Barrens,52.2,31.9
.target Tonga Runetotem
>>与|cRXP_FRIENDLY_图加·符文图腾|r谈话
    .accept 870 >>接任务: |cRXP_LOOT_遗忘之池|r
step << Tauren
    .goto The Barrens,51.5,30.8
.target Thork
>>与|cRXP_FRIENDLY_索克|r交谈
    .turnin 854 >>交任务: |cRXP_FRIENDLY_十字路口之旅|r
step
    .goto The Barrens,51.5,30.4
    .fp The Crossroads >>获取十字路口飞行路径
step
    .goto The Barrens,51.5,30.1
.target Apothecary Helbrim
>>与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    .accept 848 >>接任务: |cRXP_LOOT_菌类孢子|r
step
    .goto The Barrens,51.1,29.0
.target Jahan Hawkwing
>>与|cRXP_FRIENDLY_加翰·鹰翼|r交谈
    .accept 6361 >>接任务: |cRXP_LOOT_一捆兽皮|r
step
    #sticky
    #completewith next
    >>在遗忘之池周围采集白色蘑菇
.complete 848,1 --Collect Fungal Spores (x4)
step
    >>潜入水下, 抵达气泡裂隙
    .goto The Barrens,45.1,22.5
    .complete 870,1 --Explore the waters of the Forgotten Pools
step
>>完成收集遗忘之池周围的白色蘑菇
    .goto The Barrens,45.2,23.3,40,0
    .goto The Barrens,45.2,22.0,40,0
    .goto The Barrens,44.6,22.5,40,0
    .goto The Barrens,43.9,24.4,40,0
    .goto The Barrens,45.2,23.3,40,0
    .goto The Barrens,45.2,22.0,40,0
    .goto The Barrens,44.6,22.5,40,0
    .goto The Barrens,43.9,24.4
    .complete 848,1 --Collect Fungal Spores (x4)
step << tbc
    .goto The Barrens,52.0,30.6,150 >>死亡后在灵魂医者处复活, 或跑回去
step
    .goto The Barrens,52.3,31.9
    >>返回十字路口
>>与|cRXP_FRIENDLY_图加·符文图腾|r谈话
    .turnin 870 >>交任务: |cRXP_FRIENDLY_遗忘之池|r
.target Tonga Runetotem
    .accept 877 >>接任务: |cRXP_LOOT_死水绿洲|r
step
    .goto The Barrens,52.0,29.9
    .home >>将你的炉石设置为十字路口
step
    >>这将启动一个限时任务
    .goto The Barrens,51.4,30.2
>>与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
.turnin 848 >>交任务: |cRXP_FRIENDLY_菌类孢子|r
.target Apothecary Helbrim
    .accept 853 >>接任务: |cRXP_LOOT_药剂师扎玛|r
step
    .goto The Barrens,51.5,30.3
>>与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .turnin 6361 >>交任务: |cRXP_FRIENDLY_一捆兽皮|r
.target Devrak
    .accept 6362 >>接任务: |cRXP_LOOT_飞往雷霆崖|r
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
step
    .goto Thunder Bluff,45.6,55.9
>>与 |cRXP_FRIENDLY_安哈努|r 交谈
    .turnin 6362 >>交任务: |cRXP_FRIENDLY_飞往雷霆崖|r
.target Ahanu
    .accept 6363 >>接任务: |cRXP_LOOT_双足飞龙管理员塔尔|r
step << Warrior/Shaman
    .goto Thunder Bluff,37.8,59.4
.target Eyahn Eagletalon
>>与|cRXP_FRIENDLY_伊恩·鹰爪|r交谈
    .accept 744 >>接任务: |cRXP_LOOT_准备典礼|r
step
    .goto Thunder Bluff,29.6,29.7,25 >>进入洞穴
step << Druid
    >>装备你从任务中获得的法杖
    .goto Thunder Bluff,23.0,21.0
.target Apothecary Zamah
>>与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 853 >>交任务: |cRXP_FRIENDLY_药剂师扎玛|r
step << !Druid
    >>你很快就能装备这根法杖了. 一定要保管好它
    .goto Thunder Bluff,23.0,21.0
.target Apothecary Zamah
>>与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 853 >>交任务: |cRXP_FRIENDLY_药剂师扎玛|r
step
    .goto Thunder Bluff,46.8,49.7
>>与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .turnin 6363 >>交任务: |cRXP_FRIENDLY_双足飞龙管理员塔尔|r
.target Tal
    .accept 6364 >>接任务: |cRXP_LOOT_向加翰回复|r
step << !Warrior !Shaman
    .goto Thunder Bluff,60.0,51.7
.target Cairne Bloodhoof
>>与|cRXP_FRIENDLY_凯恩·血蹄|r交谈
    .turnin 775 >>交任务: |cRXP_FRIENDLY_雷霆崖之旅|r
step << Warrior/Shaman
    .goto Thunder Bluff,60.0,51.7
>>与|cRXP_FRIENDLY_凯恩·血蹄|r交谈
    .turnin 775 >>交任务: |cRXP_FRIENDLY_雷霆崖之旅|r
.target Cairne Bloodhoof
    .accept 776 >>接任务: |cRXP_LOOT_大地之母仪祭|r
step << Druid
    .money <0.1054
    .goto Thunder Bluff,40.9,62.7
    .train 199 >>学习2小时锤类武器技能
step << Warrior/Hunter
    .goto Thunder Bluff,40.9,62.7
    .train 227 >>训练法杖
step << Druid
    .goto Thunder Bluff,76.477,27.221
.target Turak Runetotem
>>与|cRXP_FRIENDLY_图拉克·符文图腾|r谈话
    .turnin 6002 >>交任务: |cRXP_FRIENDLY_身心之力|r
step << Druid/Hunter
    #sticky
    #completewith next
.goto The Barrens,52.0,29.9,100 >>回到十字路口或飞行返回
step << Druid/Hunter
    .goto The Barrens,51.2,29.1
.target Jahan Hawkwing
>>与|cRXP_FRIENDLY_加翰·鹰翼|r交谈
    .turnin 6364 >>交任务: |cRXP_FRIENDLY_向加翰回复|r
step << Druid/Hunter
    #sticky
    #completewith next
    +一路跑到齐柏林飞艇塔. 乘坐齐柏林飞艇前往幽暗城. 放弃所有任务
    .goto Durotar,50.8,13.8
step << Druid/Hunter
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step << Druid/Hunter
    .goto Undercity,66.2,1.1,25 >>前往幽暗城
step << Druid/Hunter
    .goto Undercity,62.0,11.3,20 >>往上走楼梯
step << Druid/Hunter
    .goto Undercity,54.9,11.3,20 >>使用[传送宝珠]
step << Druid/Hunter
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Horde
#name 10-13 莫高雷
#displayname 10-13 莫高雷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 部落 1-30
#defaultfor Tauren
#next 13-23 贫瘠之地
step
    #sticky
    #completewith ThunderBluff
    >>留意鬼嚎(白狼稀有). 击败他后可获得恶魔伤痕斗篷. 如果找不到他, 可以跳过此步骤
    .collect 4854,1,770 --Collect Demon Scarred Cloak
    .accept 770 >>接任务: |cRXP_LOOT_恶魔之伤|r
    .unitscan Ghost Howl
step
    .goto Mulgore,31.7,28.2,40,0
    .goto Mulgore,30.2,19.5,40,0
    .goto Mulgore,31.7,28.2,40,0
    .goto Mulgore,30.2,19.5,40,0
    .goto Mulgore,31.7,28.2,40,0
    .goto Mulgore,30.2,19.5
    >>击杀鹰身女妖, 搜刮它们的羽毛
    .complete 744,1 --Azure Feather (6)
    .complete 744,2 --Bronze Feather (6)
step
    #sticky
    #label Prowlers
    >>击杀平原掠食者, 搜刮它们的利爪
    .complete 861,1 --Flatland Prowler Claw (4)
step << Tauren Warrior/Tauren Shaman
    .goto Mulgore,42.5,13.8
    .use 5416 >>在井边使用[蛮鬃之井净化图腾]
    .complete 760,1 --Cleanse the Wildmane Well (1)
step
.goto Mulgore,52.6,12.2,40,0
    .goto Mulgore,48.6,16.1,40,0
    .goto Mulgore,51.8,33.8,40,0
    .goto Mulgore,56.2,32.9,40,0
.goto Mulgore,52.6,12.2,40,0
    .goto Mulgore,48.6,16.1,40,0
    .goto Mulgore,51.8,33.8,40,0
    .goto Mulgore,56.2,32.9
>>四处寻找 Arra'Chea(大黑科多兽). 他沿顺时针方向移动. 击杀后搜刮其角
    .complete 776,1 --Horn of Arra'chea (1)
    .unitscan Arra'Chea
step
    #requires Prowlers
    #label ThunderBluff
    >>返回雷霆崖
.goto Thunder Bluff,60.1,51.7
.target Cairne Bloodhoof
>>与|cRXP_FRIENDLY_凯恩·血蹄|r交谈
    .turnin 776 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
step
    .goto Thunder Bluff,37.9,59.6
.target Eyahn Eagletalon
>>与|cRXP_FRIENDLY_伊恩·鹰爪|r交谈
    .turnin 744 >>交任务: |cRXP_FRIENDLY_准备典礼|r
step
    .goto Thunder Bluff,61.3,80.9
.target Melor Stonehoof
>>与|cRXP_FRIENDLY_梅洛·石蹄|r交谈
    .turnin 861 >>交任务: |cRXP_FRIENDLY_猎人之道|r
step
    .goto Thunder Bluff,61.2,81.2
.target Melor Stonehoof
>>与|cRXP_FRIENDLY_梅洛·石蹄|r交谈
    .accept 860 >>接任务: |cRXP_LOOT_瑟格拉·黑棘|r
step
    .isOnQuest 770
    >>跑向血蹄村
    .goto Mulgore,46.8,60.2
.target Skorn Whitecloud
>>与|cRXP_FRIENDLY_斯考恩·白云|r交谈
    .turnin 770 >>交任务: |cRXP_FRIENDLY_恶魔之伤|r
step << Tauren Warrior/Shaman
    .goto Mulgore,48.6,60.4
.target Mull Thunderhorn
>>与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .turnin 760 >>交任务: |cRXP_FRIENDLY_净化蛮鬃之井|r
step
    .goto Mulgore,61.5,47.2,110 >>前往矿井
step
    #sticky
    #label Workers
    >>击杀通缉公司的小怪
    .goto Mulgore,63.0,44.3
    .complete 764,1 --Venture Co. Worker (14)
    .complete 764,2 --Venture Co. Supervisor (6)
step
    >>Run into the mine, then hug the right/east side. Kill Supervisor Fizsprocket for his Clipboard
    .goto Mulgore,64.9,43.3
    .complete 765,1 --Fizsprocket's Clipboard (1)
    .unitscan Supervisor Fizsprocket
step
    #requires Workers
    .xp 11+7150 >>升级至7150+/8700经验值
step
    #sticky
    #completewith next
    >>寻找莫林·云行者. 他沿着东侧道路巡逻
    .goto Mulgore,51.1,58.6,30,0
    .goto Mulgore,59.7,62.5,30,0
    .goto Mulgore,51.1,58.6,30,0
    .goto Mulgore,59.7,62.5,30,0
    .goto Mulgore,51.1,58.6,30,0
    .goto Mulgore,59.7,62.5,30,0
    .goto Mulgore,51.1,58.6,30,0
    .goto Mulgore,59.7,62.5
.target Morin Cloudstalker
>>与|cRXP_FRIENDLY_摩林·云行者|r交谈
    .turnin 764 >>交任务: |cRXP_FRIENDLY_风险投资公司|r
    .turnin 765 >>交任务: |cRXP_FRIENDLY_菲兹普罗克主管|r
    .unitscan Morin Cloudstalker
step << Shaman
    .goto Mulgore,48.4,59.2
    .train 1535 >>学习[火焰新星图腾]
    .train 547 >>学习治疗波(等级3)
step << Warrior
    .goto Mulgore,49.515,60.586
    .train 5242 >>训练战斗怒吼(等级2)
    .train 7384 >>训练压制
step
    #completewith next
    .hs >>回到十字路口或飞行返回
step
    .goto The Barrens,52.0,30.3
.target Gazrog
>>与 |cRXP_FRIENDLY_加兹罗格|r交谈
    .accept 869 >>接任务: |cRXP_LOOT_偷钱的迅猛龙|r
step
    .goto The Barrens,51.2,29.1
.target Jahan Hawkwing
>>与|cRXP_FRIENDLY_加翰·鹰翼|r交谈
    .turnin 6364 >>交任务: |cRXP_FRIENDLY_向加翰回复|r
step
    .goto The Barrens,51.5,30.9
.target Thork
>>与|cRXP_FRIENDLY_索克|r交谈
    .accept 871 >>接任务: |cRXP_LOOT_野猪人的袭击|r
    .accept 5041 >>接任务: |cRXP_LOOT_十字路口的补给品|r
step
    .goto The Barrens,51.6,30.9
    >>向上跑楼梯
.target Darsok Swiftdagger
>>与|cRXP_FRIENDLY_达索克·快刀|r交谈
    .accept 867 >>接任务: |cRXP_LOOT_鹰身强盗|r
step
    .goto The Barrens,52.2,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 860 >>交任务: |cRXP_FRIENDLY_瑟格拉·黑棘|r
.target Sergra Darkthorn
    .accept 844 >>接任务: |cRXP_LOOT_平原陆行鸟的威胁|r
step << Shaman
    .goto The Barrens,55.9,19.9
>>与|cRXP_FRIENDLY_卡纳尔·菲斯|r交谈
    .turnin 2984 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
.target Kranal Fiss
    .accept 1524 >>接任务: |cRXP_LOOT_火焰的召唤|r
step << Shaman
.goto Durotar,36.6,58.0,25 >>沿着山路跑上山
step << Shaman
    .goto Durotar,38.5,58.9
>>与|cRXP_FRIENDLY_泰尔夫·祖拉姆|r交谈
    .turnin 1524 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
.target Telf Joolam
    .accept 1525 >>接任务: |cRXP_LOOT_火焰的召唤|r
step << Warrior
    .goto The Barrens,61.4,21.1
>>与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1505 >>交任务: |cRXP_FRIENDLY_老兵犹塞克|r
.target Uzzek
    .accept 1498 >>接任务: |cRXP_LOOT_防御之道|r
step << Warrior
    .goto Durotar,39.2,32.3,40,0
    .goto Durotar,39.62,28.10,40,0
    .goto Durotar,40.20,24.13,40,0
    .goto Durotar,43.33,24.32,40,0
    .goto Durotar,39.2,32.3
    >>击杀雷霆岭的雷霆蜥蜴和闪电蜥蜴, 收集它们的鳞片
    .complete 1498,1 --Singed Scale (5)
step << Warrior
    .isQuestComplete 1498
    #completewith next
.goto Durotar,39.2,32.3,30 >>离开雷霆岭
step << Warrior
    .goto The Barrens,61.4,21.1
>>与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1498 >>交任务: |cRXP_FRIENDLY_防御之道|r
.target Uzzek
    .accept 1502 >>接任务: |cRXP_LOOT_索恩格瑞姆·火眼|r
step << Warrior
    >>击杀闪电蜥蜴获取烧焦的鳞片
    .complete 1498,1 --Singed Scale (5)
step << Warrior
    .goto The Barrens,61.4,21.1
>>与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1498 >>交任务: |cRXP_FRIENDLY_防御之道|r
.target Uzzek
    .accept 1502 >>接任务: |cRXP_LOOT_索恩格瑞姆·火眼|r
]])
