local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（部落）
#hardcore
#classic
#tbc
#era/som--h
<< Horde
#name 1-6 Tauren
#version 1
#group RestedXP Survival Guide (H)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
#defaultfor Tauren
#next 6-13 Tauren
#displayname 1-6 牛头人
step << !Tauren
#completewith next
.goto Mulgore,44.92,77.12
+|cRXP_WARN_您选择的指南专为牛头人设计，由于一条主要任务链仅对牛头人开放，该区域不适合你的角色，建议选择与角色起始区域相同的指南|r
step
.goto Mulgore,44.92,77.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
.accept 747 >>接受任务 开始狩猎
.target 格鲁尔·鹰风
.isQuestAvailable 747
.xp <1,1
step
.goto Mulgore,44.18,76.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长|r交谈
.accept 752 >>接受任务 一件琐事
.target 鹰风酋长
.isQuestAvailable 752
.xp <1,1
step << Warrior/Shaman
#completewith next
.goto Mulgore,46.05,75.32,30,0
+|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r，拾取战利品，直到可出售物品（包括你身上的护甲）的价值达到 10 铜|r << Warrior/Shaman
.mob 平原陆行鸟
.money >0.001
step << Warrior/Shaman
.goto Mulgore,45.30,76.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡文尼|r 交谈
.vendor >> 出售垃圾物品
.target 卡文尼·柔风
.money >0.001
step << Warrior
.goto Mulgore,44.02,76.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
.train 6673 >>学习 |T132333:0|t[战斗怒吼]
.target 哈鲁特·雷角
step << Shaman
.goto Mulgore,45.01,75.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
.train 8017 >>学习 |T136086:0|t[石化武器]
.target 米拉·晨行者
step
#completewith next
>>击杀|cRXP_ENEMY_平原陆行鸟|r，拾取|cRXP_LOOT_肉|r和|cRXP_LOOT_羽毛|r
.complete 747,1 --Plainstrider Meat (7)
.complete 747,2 --Plainstrider Feather (7)
.mob 平原陆行鸟
.isOnQuest 747
.isQuestNotComplete 747
step
.goto Mulgore,50.03,81.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长的母亲|r交谈
.turnin 752 >>交任务 一件琐事
.target 鹰风酋长的母亲
.isQuestComplete 752
step
.goto Mulgore,50.03,81.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长的母亲|r交谈
.target 鹰风酋长的母亲
.accept 753 >>接受任务 一件琐事
.isQuestAvailable 753
.xp <1,1
step
.goto Mulgore,50.22,81.37
>>拾取 |cRXP_LOOT_水罐|r，它位于 |cRXP_FRIENDLY_鹰风酋长的母亲|r 身后的水井上
.complete 753,1 --Water Pitcher (1)
.isOnQuest 753
.isQuestNotComplete 753
step
#loop
.goto Mulgore,47.36,83.05,0
.goto Mulgore,50.23,79.38,50,0
.goto Mulgore,51.02,78.68,50,0
.goto Mulgore,50.85,75.68,50,0
.goto Mulgore,48.43,77.18,50,0
.goto Mulgore,47.10,76.54,50,0
.goto Mulgore,45.77,80.39,50,0
.goto Mulgore,45.56,82.39,50,0
.goto Mulgore,47.36,83.05,50,0
>>击杀|cRXP_ENEMY_平原陆行鸟|r，拾取|cRXP_LOOT_肉|r和|cRXP_LOOT_羽毛|r
.complete 747,1 --Plainstrider Meat (7)
.complete 747,2 --Plainstrider Feather (7)
.mob 平原陆行鸟
.isOnQuest 747
.isQuestNotComplete 747
step
.goto Mulgore,44.92,77.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
.turnin 747,1 >>交任务 开始狩猎 << Druid
.turnin 747 >>交任务 开始狩猎 << !Druid
.target 格鲁尔·鹰风
.isQuestComplete 747 << Druid
.isQuestComplete 747 << !Druid
step
.goto Mulgore,44.92,77.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
.target 格鲁尔·鹰风
.accept 3091 >>接受任务 简易便笺 << Warrior
.isQuestAvailable 3091 << Warrior
.xp <1,1 << Warrior
.isQuestTurnedIn 747 << Warrior
step
.goto Mulgore,44.92,77.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
.target 格鲁尔·鹰风
.accept 3092 >>接受任务 风化便笺 << Hunter
.isQuestAvailable 3092 << Hunter
.xp <1,1 << Hunter
.isQuestTurnedIn 747 << Hunter
step
.goto Mulgore,44.92,77.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
.target 格鲁尔·鹰风
.accept 3093 >>接受任务 符文便笺 << Shaman
.isQuestAvailable 3093 << Shaman
.xp <1,1 << Shaman
.isQuestTurnedIn 747 << Shaman
step
.goto Mulgore,44.92,77.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
.target 格鲁尔·鹰风
.accept 3094 >>接受任务 绿色便笺 << Druid
.isQuestAvailable 3094 << Druid
.xp <1,1 << Druid
.isQuestTurnedIn 747 << Druid
step
.goto Mulgore,44.92,77.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
.target 格鲁尔·鹰风
.accept 750 >>接受任务 继续狩猎
.isQuestAvailable 750
.xp <1,1
.isQuestTurnedIn 747
step
.goto Mulgore,45.30,76.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡文尼|r 交谈
>>|cRXP_BUY_向她购买|r |T132384:0|t[轻弹丸] |cRXP_BUY_。|r << Hunter
.collect 2516,1000,750,1 << Hunter --Light Shot (1000)
.vendor >> 出售垃圾物品
.target 卡文尼·柔风
step
.goto Mulgore,44.18,76.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长|r交谈
.turnin 753 >>交任务 一件琐事
.target 鹰风酋长
.isQuestComplete 753
step
.goto Mulgore,44.18,76.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长|r交谈
.target 鹰风酋长
.accept 755 >>接受任务 大地之母仪祭
.isQuestAvailable 755
.xp <1,1
.isQuestTurnedIn 753
step << Shaman
.goto Mulgore,44.07,77.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_马沙克·利刃|r|cRXP_BUY_交谈，向他购买|r |T135139:0|t[学徒法杖]|cRXP_BUY_。|r
.collect 2132,1,750,1 --Collect Short Staff (1)
.money <0.0102
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
.target 马沙克
step << Shaman
#optional
#completewith RitesoftheEarthmother
.equip 16,2132 >>装备 |T135139:0|t[学徒法杖]
.use 2132
.itemcount 2132,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
step
#completewith next
>>击杀|cRXP_ENEMY_山狮|r，拾取|cRXP_LOOT_皮毛|r
.complete 750,1 --Mountain Cougar Pelt (10)
.mob 山狮
.isOnQuest 750
.isQuestNotComplete 750
step
#label RitesoftheEarthmother
.goto Mulgore,42.58,92.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灰舌先知|r交谈
>>|cRXP_WARN_顺路击杀怪物|r
.turnin 755 >>交任务 大地之母仪祭
.target 灰舌先知
.isQuestComplete 755
step
.goto Mulgore,42.58,92.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灰舌先知|r交谈
>>|cRXP_WARN_顺路击杀怪物|r
.target 灰舌先知
.accept 757 >>接受任务 力量仪祭
.isQuestAvailable 757
.xp <1,1
.isQuestTurnedIn 755
step
#loop
.goto Mulgore,44.60,90.86,0
.goto Mulgore,43.21,89.26,50,0
.goto Mulgore,44.64,91.58,50,0
.goto Mulgore,45.82,90.52,50,0
.goto Mulgore,46.35,91.45,50,0
.goto Mulgore,48.05,91.83,50,0
.goto Mulgore,49.25,90.69,50,0
.goto Mulgore,50.98,90.37,50,0
.goto Mulgore,49.10,89.50,50,0
.goto Mulgore,47.06,88.64,50,0
.goto Mulgore,45.06,89.89,50,0
.goto Mulgore,44.60,90.86,50,0
>>击杀|cRXP_ENEMY_山狮|r，拾取|cRXP_LOOT_皮毛|r
.complete 750,1 --Mountain Cougar Pelt (10)
.mob 山狮
.isOnQuest 750
.isQuestNotComplete 750
step
#loop
.goto Mulgore,45.56,87.95,40,0
.goto Mulgore,46.92,87.84,40,0
.goto Mulgore,48.67,86.83,40,0
.goto Mulgore,50.65,85.87,40,0
.goto Mulgore,51.01,83.71,40,0
.goto Mulgore,52.06,81.53,40,0
.goto Mulgore,51.87,79.58,40,0
.goto Mulgore,51.67,77.39,40,0
.goto Mulgore,51.95,75.16,40,0
.goto Mulgore,50.32,76.33,40,0
.goto Mulgore,48.85,75.82,40,0
.goto Mulgore,47.41,75.30,40,0
.goto Mulgore,46.80,78.21,40,0
.goto Mulgore,45.84,80.41,40,0
.goto Mulgore,45.03,82.15,40,0
.goto Mulgore,44.09,83.89,40,0
.goto Mulgore,43.90,86.08,40,0
.xp 3+1150 >> 刷怪至 1150+/1400 经验值
.mob 平原陆行鸟
step << Warrior/Druid
#completewith GrullTurnin2
+|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r，刷到可出售物品价值达 2 银|r
.mob 平原陆行鸟
.money >0.02
step << !Warrior !Druid
#completewith next
+|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r，刷到可出售物品价值达 1 银|r
.mob 平原陆行鸟
.money >0.01
step
#label GrullTurnin2
.goto Mulgore,44.92,77.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
.turnin 750 >>交任务 继续狩猎
.target 格鲁尔·鹰风
.isQuestComplete 750
step
.goto Mulgore,44.92,77.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
.target 格鲁尔·鹰风
.accept 780 >>接受任务 斗猪
.isQuestAvailable 780
.xp <1,1
.isQuestTurnedIn 750
step
.goto Mulgore,45.30,76.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡文尼|r 交谈
.vendor >> 出售垃圾物品
.target 卡文尼·柔风
step
.goto Mulgore,44.67,76.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵维萨罗·风羽|r交谈
.accept 3376 >>接受任务 刺鬃酋长
.target 卫兵维萨罗·风羽
.isQuestAvailable 3376
.xp <3,1
step << Warrior
.goto Mulgore,44.02,76.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
.turnin 3091 >>交任务 简易便笺
.target 哈鲁特·雷角
.isQuestComplete 3091
step << Warrior
.goto Mulgore,44.02,76.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
.train 100 >>学习 |T132337:0|t[冲锋]
.target 哈鲁特·雷角
.money <0.02
step << Warrior
.goto Mulgore,44.02,76.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
.train 772 >>学习 |T132155:0|t[撕裂]
.target 哈鲁特·雷角
step << Hunter
.goto Mulgore,44.26,75.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
.turnin 3092 >>交任务 风化便笺
.target 兰卡·远箭
.isQuestComplete 3092
step << Hunter
.goto Mulgore,44.26,75.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
.train 1978 >>学习 |T132204:0|t[毒蛇钉刺]
.target 兰卡·远箭
step << Druid
.goto Mulgore,45.09,75.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
.turnin 3094 >>交任务 绿色便笺
.target 加尔特·迷雾行者
.isQuestComplete 3094
step << Druid
.goto Mulgore,45.09,75.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
.train 8921 >>学习 |T136096:0|t[月火术]
.target 加尔特·迷雾行者
step << Shaman
.goto Mulgore,44.73,76.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鸦羽先知|r交谈
.accept 1519 >>接受任务 大地的召唤
.target 鸦羽先知
.isQuestAvailable 1519
.xp <4,1
step << Shaman
.goto Mulgore,45.01,75.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
.turnin 3093 >>交任务 符文便笺
.target 米拉·晨行者
.isQuestComplete 3093
step << Shaman
.goto Mulgore,45.01,75.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
.train 8042 >>学习 |T136026:0|t[地震术]
.target 米拉·晨行者
step
#loop
.goto Mulgore,55.99,85.46,0
.goto Mulgore,52.70,79.32,50,0
.goto Mulgore,54.19,79.83,50,0
.goto Mulgore,55.73,80.28,50,0
.goto Mulgore,56.48,81.67,50,0
.goto Mulgore,55.63,83.86,50,0
.goto Mulgore,56.03,85.53,50,0
.goto Mulgore,55.80,87.71,50,0
.goto Mulgore,56.72,89.27,50,0
.goto Mulgore,57.92,89.27,50,0
.goto Mulgore,57.69,86.77,50,0
.goto Mulgore,57.31,85.39,50,0
.goto Mulgore,55.99,85.46,50,0
>>击杀|cRXP_ENEMY_斗猪|r，拾取掉落的|cRXP_LOOT_斗猪肋排|r和|cRXP_LOOT_斗猪头|r
.complete 780,2 --Battleboar Flank (8)
.complete 780,1 --Battleboar Snout (8)
.mob 斗猪
.isOnQuest 780
.isQuestNotComplete 780
step
#completewith next
.goto Mulgore,59.67,83.33,30 >>穿越洞穴
step
#completewith DirtyMap
>>击杀|cRXP_ENEMY_刺背野猪人|r，拾取|cRXP_LOOT_腰带|r
.complete 757,1 --Bristleback Belt (12)
.mob 刺背野猪人
.isOnQuest 757
.isQuestNotComplete 757
step << Shaman
#completewith DirtyMap
>>击杀|cRXP_ENEMY_刺背萨满祭司|r，拾取|cRXP_LOOT_药膏|r
.complete 1519,1 --Ritual Salve (2)
.mob 刺背萨满祭司
.isOnQuest 1519
.isQuestNotComplete 1519
step
.goto Mulgore,60.54,81.04,35,0
.goto Mulgore,62.35,81.27,35,0
.goto Mulgore,62.49,78.78,35,0
.goto Mulgore,64.71,77.67
>>击杀大屋内的|cRXP_ENEMY_刺鬃酋长|r，拾取|cRXP_LOOT_头颅|r
.complete 3376,1 --Chief Sharptusk Thornmantle's Head (1)
.mob 刺鬃酋长
.isOnQuest 3376
.isQuestNotComplete 3376
step
#label DirtyMap
.goto Mulgore,63.24,82.70
>>进入洞穴，拾取地面上的 |T134269:0|t[|cRXP_PICK_沾满泥土的地图|r]，使用它接任务
.collect 4851,1,781 --Collect Dirt-Stained Map
.accept 781 >>接受任务 纳拉其营地的危机
.use 4851
.isNotOnQuest 781
.isQuestAvailable 781
.xp <3,1
step << Shaman
#completewith next
>>击杀|cRXP_ENEMY_刺背萨满祭司|r，拾取|cRXP_LOOT_药膏|r
.complete 1519,1 --Ritual Salve (2)
.mob 刺背萨满祭司
.isOnQuest 1519
.isQuestNotComplete 1519
step
#loop
.goto Mulgore,63.93,78.34,0
.goto Mulgore,63.81,76.65,40,0
.goto Mulgore,62.92,76.91,40,0
.goto Mulgore,61.31,77.22,40,0
.goto Mulgore,61.58,78.89,40,0
.goto Mulgore,62.53,79.52,40,0
.goto Mulgore,64.20,79.01,40,0
.goto Mulgore,65.82,78.13,40,0
.goto Mulgore,63.93,78.34,40,0
>>击杀|cRXP_ENEMY_刺背野猪人|r，拾取|cRXP_LOOT_腰带|r
.complete 757,1 --Bristleback Belt (12)
.mob 刺背野猪人
.isOnQuest 757
.isQuestNotComplete 757
step << Shaman
#loop
.goto Mulgore,63.86,80.14,0
.goto Mulgore,63.74,81.18,40,0
.goto Mulgore,63.86,79.97,40,0
.goto Mulgore,65.00,78.60,40,0
.goto Mulgore,66.05,77.83,40,0
.goto Mulgore,65.93,77.10,40,0
.goto Mulgore,63.57,76.25,40,0
.goto Mulgore,63.86,80.14,40,0
>>击杀|cRXP_ENEMY_刺背萨满祭司|r，拾取|cRXP_LOOT_药膏|r
.complete 1519,1 --Ritual Salve (2)
.mob 刺背萨满祭司
.isOnQuest 1519
.isQuestNotComplete 1519
step
#loop
.goto Mulgore,62.27,82.03,0
.goto Mulgore,63.98,80.08,40,0
.goto Mulgore,64.31,78.29,40,0
.goto Mulgore,63.67,76.18,40,0
.goto Mulgore,62.67,76.10,40,0
.goto Mulgore,61.34,77.13,40,0
.goto Mulgore,61.72,78.98,40,0
.goto Mulgore,62.29,81.53,40,0
.goto Mulgore,60.82,80.81,40,0
.goto Mulgore,60.08,81.93,40,0
.goto Mulgore,61.03,82.32,40,0
.goto Mulgore,62.27,82.03,40,0
.xp 5+880 >> 刷怪至 880+/2800 经验值 << !Shaman
.xp 5 >> 刷到 5 级 << Shaman
step
#completewith next
.hs >> 炉石回纳拉其营地
.use 6948
.bindlocation 221,1
.cooldown item,6948,>0,1
>>仅当炉石绑定在纳拉其营地且冷却完毕时使用；否则沿道路步行返回营地。
step
.goto Mulgore,44.92,77.12
>>与格鲁尔·鹰风交谈。
.turnin 780 >>交任务 斗猪
.target 格鲁尔·鹰风
.isQuestComplete 780
step
.goto Mulgore,44.67,76.68
>>与卫兵维萨罗·风羽交谈。
.turnin 3376 >>交任务 刺鬃酋长
.target 卫兵维萨罗·风羽
.isQuestComplete 3376
step << Shaman
.goto Mulgore,44.73,76.18
>>与鸦羽先知交谈。
.turnin 1519 >>交任务 大地的召唤
.target 鸦羽先知
.isQuestComplete 1519
step << Shaman
.goto Mulgore,44.73,76.18
>>与鸦羽先知交谈。
.accept 1520 >>接受任务 大地的召唤
.target 鸦羽先知
.isQuestAvailable 1520
.xp <4,1
.isQuestTurnedIn 1516,1519
step
.goto Mulgore,44.18,76.07
>>与鹰风酋长交谈。
.turnin 781 >>交任务 纳拉其营地的危机
.target 鹰风酋长
.isQuestComplete 781
step
.goto Mulgore,44.18,76.07
>>与鹰风酋长交谈。
.turnin 757 >>交任务 力量仪祭
.target 鹰风酋长
.isQuestComplete 757
step
.goto Mulgore,44.18,76.07
>>与鹰风酋长交谈。
.accept 763 >>接受任务 大地之母仪祭
.target 鹰风酋长
.isQuestAvailable 763
.xp <1,1
.isQuestTurnedIn 757
step << Shaman
#completewith CallofEarth
#label Rock
.goto Mulgore,53.74,80.15,30 >> 前往岩石方向
.isOnQuest 1520
step << Shaman
#completewith next
#requires Rock
.cast 8202 >>|cRXP_WARN_使用|r |T134743:0|t[大地灵契]
.use 6635
.isOnQuest 1520
.isQuestNotComplete 1520
.itemcount 6635,1
step << Shaman
#label CallofEarth
.goto Mulgore,53.74,80.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大地之魂|r交谈
.turnin 1520 >>交任务 大地的召唤
.target 大地之魂
.isQuestComplete 1520
step << Shaman
.goto Mulgore,53.74,80.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大地之魂|r交谈
.target 大地之魂
.accept 1521 >>接受任务 大地的召唤
.isQuestAvailable 1521
.xp <4,1
.isQuestTurnedIn 1520
step << Shaman
.goto Mulgore,44.73,76.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鸦羽先知|r交谈
.turnin 1521 >>交任务 大地的召唤
.target 鸦羽先知
.isQuestComplete 1521
step << Shaman
.goto Mulgore,45.01,75.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
.train 332 >>学习 |T136052:0|t[治疗波]
.target 米拉·晨行者
step << Hunter
.goto Mulgore,44.26,75.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
.train 1130 >>学习 |T132212:0|t[猎人印记]
.target 兰卡·远箭
.money <0.02
step << Hunter
.goto Mulgore,44.26,75.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
.train 3044 >>学习 |T132218:0|t[奥术射击]
.target 兰卡·远箭
step << Druid
.goto Mulgore,45.09,75.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
.train 467 >>学习 |T136104:0|t[荆棘术]
.target 加尔特·迷雾行者
.money <0.02
step << Druid
.goto Mulgore,45.09,75.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
.train 5177 >>学习 |T136006:0|t[愤怒]
.target 加尔特·迷雾行者
step << Warrior
.goto Mulgore,44.02,76.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
.train 6343 >>学习 |T136105:0|t[雷霆一击]
.target 哈鲁特·雷角
.money <0.02
step << Warrior
.goto Mulgore,44.02,76.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
.train 3127 >>学习 |T132269:0|t[招架]
.target 哈鲁特·雷角
step
.goto Mulgore,38.51,81.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安图尔·荒野|r交谈
.accept 1656 >>接受任务 未完的任务
.target 安图尔·荒野
.isQuestAvailable 1656
.xp <1,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（部落）
#hardcore
#classic
#tbc
#era/som--h
<< Horde
#name 6-13 Tauren
#version 1
#group RestedXP Survival Guide (H)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
#defaultfor Tauren
#next 13-15 Silverpine Forest
#displayname 6-13 牛头人
step
.goto Mulgore,47.35,60.70
>>前往血蹄村，若仍在飞行或传送中，请等到落地；未乘坐航线时沿道路前往。
+确认已抵达血蹄村并已落地
step
.goto Mulgore,47.36,62.01
>>与卢尔·鹰爪交谈。
.target 卢尔·鹰爪
.accept 743 >>接任务：风怒鹰身人
.isQuestAvailable 743
.xp <5,1
step
.goto Mulgore,47.51,60.16
>>与贝恩·血蹄交谈。
.target 贝恩·血蹄
.turnin 763 >>交任务：大地之母仪祭
.isQuestComplete 763
step
.goto Mulgore,47.51,60.16
>>与贝恩·血蹄交谈。
.target 贝恩·血蹄
.accept 745 >>接任务：土地之争
.isQuestAvailable 745
.xp <1,1
step
.goto Mulgore,47.51,60.16
>>与贝恩·血蹄交谈。
.target 贝恩·血蹄
.accept 767 >>接任务：幻象仪祭
.isQuestAvailable 767
.xp <3,1
step
.goto Mulgore,47.51,60.16
>>与贝恩·血蹄交谈。
.target 贝恩·血蹄
.accept 746 >>接任务：矮人的挖掘场
.isQuestAvailable 746
.xp <6,1
step
.goto Mulgore,46.63,61.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
.target 旅店老板考乌斯
.turnin 1656 >>交任务：未完的任务
.isQuestComplete 1656
step
.goto Mulgore,46.63,61.09
>>与旅店老板考乌斯交谈。
.home >>将炉石绑定在血蹄村
.target 旅店老板考乌斯
.bindlocation 222
step << Shaman/Druid
.goto Mulgore,45.66,58.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特·深痕|r 交谈
.vendor >> 出售杂物。如果卖掉武器能让你买得起 |T135145:0|t[学徒短杖]（5银04铜），就把它卖掉；钱仍不够则稍后再回来
.target 玛诺特·深痕
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
.goto Mulgore,45.66,58.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_玛诺特·深痕|r|cRXP_BUY_交谈，向他购买|r |T135145:0|t[学徒短杖]|cRXP_BUY_。|r
.collect 2495,1 --Collect Walking Stick (1)
.money <0.0504
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
.goto Mulgore,45.66,58.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特·深痕|r 交谈
.vendor >> 出售杂物。如果卖掉武器能让你买得起 |T133053:0|t[木槌棒]（7银1铜），就把它卖掉；钱仍不够则稍后再回来
.target 玛诺特·深痕
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
.goto Mulgore,45.66,58.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_玛诺特·深痕|r|cRXP_BUY_交谈，向他购买|r |T133053:0|t[木槌棒]|cRXP_BUY_。|r
.collect 2493,1 --Collect Wooden Mallet (1)
.money <0.0701
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
.goto Mulgore,45.50,58.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯纳·鹰眼|r 交谈
.vendor >> 出售杂物。如果卖掉武器能让你买得起 |T135611:0|t[精制短枪]（4银14铜），就把它卖掉；钱仍不够则稍后再回来
.target 肯纳·鹰眼
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0 << tbc
step << Hunter
.goto Mulgore,45.50,58.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_肯纳·鹰眼|r|cRXP_BUY_交谈，购买|r |T135611:0|t[精制短枪] |cRXP_BUY_。|r
.collect 2509,1
.money <0.0414
.itemStat 18,QUALITY,<7
#optional
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0 << tbc
step << Hunter
.goto Mulgore,45.50,58.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_肯纳·鹰眼|r交谈
>>|cRXP_BUY_向他购买|r |T132384:0|t[轻弹丸]|cRXP_BUY_。|r << Hunter
.collect 2516,1000 << Hunter --Light Shot (1000)
.target 肯纳·鹰眼
#optional
>>按需补足上述弹药数量，并确认已装备与当前枪械或弓匹配的弹丸或箭矢；库存足够时可跳过。
step << Shaman/Druid
#optional
#completewith Well
.equip 16,2495 >>|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
.use 2495
.itemcount 2495,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
#optional
#completewith Well
.equip 16,2493 >>|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
.use 2493
.itemcount 2493,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
#optional
#completewith Well
.use 2509
.itemcount 2509,1
.itemStat 18,QUALITY,<7
.xp <4,1
.equip 18,2509 >>装备精制短枪；已有同等或更强的远程武器时跳过。
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0 << tbc
step << Tauren
.goto Mulgore,46.97,57.07
>>与茂尔·祈雨交谈。
.target 茂尔·祈雨
.accept 766 >>接任务：马兹拉纳其
.isQuestAvailable 766
.xp <5,1
step << Tauren
.goto Mulgore,47.51,60.16
>>与贝恩·血蹄交谈。
.target 贝恩·血蹄
.turnin 767 >>交任务：幻象仪祭
.isQuestComplete 767
step << Tauren
.goto Mulgore,47.76,57.53
>>与扎尔曼·双月交谈。
.target 扎尔曼·双月
.accept 771 >>接任务：幻象仪祭
.isQuestAvailable 771
.xp <3,1
.isQuestTurnedIn 767
step << Tauren
.goto Mulgore,48.71,59.32
>>与哈肯·风之图腾交谈。
.target 哈肯·风之图腾
.accept 761 >>接任务：猎捕猛鹫
.isQuestAvailable 761
.xp <4,1
step << Tauren
.goto Mulgore,48.53,60.40
>>与穆尔·雷角交谈。
.target 穆尔·雷角
.accept 748 >>接任务：毒水
.isQuestAvailable 748
.xp <4,1
step << !Tauren
.goto Mulgore,46.97,57.07
>>与茂尔·祈雨交谈。
.target 茂尔·祈雨
.accept 766 >>接任务：马兹拉纳其
.isQuestAvailable 766
.xp <5,1
step << !Tauren
.goto Mulgore,47.51,60.16
>>与贝恩·血蹄交谈。
.target 贝恩·血蹄
.turnin 767 >>交任务：幻象仪祭
.isQuestComplete 767
step << !Tauren
.goto Mulgore,47.76,57.53
>>与扎尔曼·双月交谈。
.target 扎尔曼·双月
.accept 771 >>接任务：幻象仪祭
.isQuestAvailable 771
.xp <3,1
.isQuestTurnedIn 767
step << !Tauren
.goto Mulgore,48.71,59.32
>>与哈肯·风之图腾交谈。
.target 哈肯·风之图腾
.accept 761 >>接任务：猎捕猛鹫
.isQuestAvailable 761
.xp <4,1
step
#sticky
#completewith Well
>>|cRXP_WARN_在这片区域做任务时顺手收集马兹拉纳其所需的物品|r
.complete 766,1 --Prairie Wolf Heart (1)
.complete 766,2 --Flatland Cougar Femur (1)
.complete 766,3 --Plainstrider Scale (1)
.complete 766,4 --Swoop Gizzard (1)
.isOnQuest 766
.isQuestNotComplete 766
step << Tauren
#completewith next
>>击杀|cRXP_ENEMY_草原狼|r和|cRXP_ENEMY_成年平原陆行鸟|r，拾取掉落的|cRXP_LOOT_草原狼的爪子|r和|cRXP_LOOT_平原陆行鸟的爪子|r
.complete 748,1 --Prairie Wolf Paw (6)
.mob +草原狼
.complete 748,2 --Plainstrider Talon (4)
.mob +成年平原陆行鸟
.isOnQuest 748
.isQuestNotComplete 748
step
#loop
.goto Mulgore,50.36,66.49,0
.goto Mulgore,48.71,64.44,15,0
.goto Mulgore,50.36,66.49,15,0
.goto Mulgore,51.92,63.85,15,0
.goto Mulgore,51.13,71.06,15,0
.goto Mulgore,50.36,66.49,15,0
>>收集 |cRXP_PICK_琥珀颗粒|r. 它们可以在树下的地面上找到
.complete 771,2 --Ambercorn (2)
.isOnQuest 771
.isQuestNotComplete 771
step << Tauren
#loop
.goto Mulgore,50.82,66.66,0
.goto Mulgore,50.82,66.66,50,0
.goto Mulgore,51.06,63.63,50,0
.goto Mulgore,52.79,62.06,50,0
.goto Mulgore,53.98,61.68,50,0
.goto Mulgore,55.67,62.77,50,0
.goto Mulgore,56.46,64.93,50,0
.goto Mulgore,56.02,67.78,50,0
.goto Mulgore,55.02,69.65,50,0
.goto Mulgore,52.33,70.07,50,0
.goto Mulgore,50.40,70.24,50,0
.goto Mulgore,48.60,69.43,50,0
.goto Mulgore,45.98,69.70,50,0
.goto Mulgore,48.58,67.37,50,0
>>击杀|cRXP_ENEMY_草原狼|r和|cRXP_ENEMY_成年平原陆行鸟|r，拾取掉落的|cRXP_LOOT_草原狼的爪子|r和|cRXP_LOOT_平原陆行鸟的爪子|r
.complete 748,1 --Prairie Wolf Paw (6)
.mob +草原狼
.complete 748,2 --Plainstrider Talon (4)
.mob +成年平原陆行鸟
.isOnQuest 748
.isQuestNotComplete 748
step << Tauren
.goto Mulgore,48.53,60.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔·雷角|r交谈
.target 穆尔·雷角
.timer 8,毒水剧情演出
.turnin 748 >>交任务：毒水
.isQuestComplete 748
step << Tauren
.goto Mulgore,48.53,60.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔·雷角|r交谈
.target 穆尔·雷角
.accept 754 >>接任务：净化冰蹄之井
.isQuestAvailable 754
.xp <4,1
.isQuestTurnedIn 748
step << Tauren
#completewith next
>>收集水井周围的|cRXP_PICK_水井石|r
.complete 771,1 --Well Stone (2)
.isOnQuest 771
.isQuestNotComplete 771
step << Tauren
.goto Mulgore,53.68,66.28
>>|cRXP_WARN_在冰蹄之井使用|r |T135139:0|t[冰蹄之井净化图腾]|cRXP_WARN_。|r
.use 5411
.complete 754,1 --Cleanse the Winterhoof Water Well (1)
.isOnQuest 754
.isQuestNotComplete 754
step
#optional
#label Well
step
#label Stones
#loop
.goto Mulgore,54.06,66.40,0
.goto Mulgore,53.35,65.78,10,0
.goto Mulgore,53.70,65.59,10,0
.goto Mulgore,53.98,65.94,10,0
.goto Mulgore,54.06,66.40,10,0
>>收集水井周围的|cRXP_PICK_水井石|r
.complete 771,1 --Well Stone (2)
.isOnQuest 771
.isQuestNotComplete 771
step
#completewith next
>>|cRXP_WARN_在这片区域做任务时顺手收集马兹拉纳其所需的物品|r
.complete 766,1 --Prairie Wolf Heart (1)
.complete 766,2 --Flatland Cougar Femur (1)
.complete 766,3 --Plainstrider Scale (1)
.complete 766,4 --Swoop Gizzard (1)
.isOnQuest 766
.isQuestNotComplete 766
step
#label Gnolls
#loop
.goto Mulgore,53.5,73.0,0
.goto Mulgore,48.3,72.0,0
.goto Mulgore,53.5,73.0,90,0
.goto Mulgore,48.3,72.0,90,0
>>在两个营地之间来回移动。击杀|cRXP_ENEMY_白鬃制革工|r、|cRXP_ENEMY_白鬃剥皮工|r和|cRXP_ENEMY_白鬃偷猎者|r
>>|cRXP_WARN_小心|r |cRXP_ENEMY_断矛|r |cRXP_WARN_（9 级稀有）。他太难对付了|r
.complete 745,1 --Palemane Tanner (10)
.mob +白鬃制革工
.complete 745,2 --Palemane Skinner (8)
.mob +白鬃剥皮工
.complete 745,3 --Palemane Poacher (5)
.mob +白鬃偷猎者
.unitscan 断矛
.isOnQuest 745
.isQuestNotComplete 745
step
.goto Mulgore,47.63,61.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加纳·麦风|r 交谈
>>|cRXP_BUY_从她那里购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_。|r << Shaman/Druid
>>|cRXP_BUY_从她那里购买|r |T133968:0|t[刚出炉的面包]|cRXP_BUY_。|r << Warrior
.vendor >> 出售杂物
.collect 1179,10 << Shaman/Druid --Ice Cold Milk (10)
.collect 4541,10 << Warrior --Freshly Baked Bread (10)
.target 加纳·麦风
#optional
>>仅在资金允许时补足上述食物或饮水数量；资金不足时跳过或稍后补购。
step << Tauren
.goto Mulgore,48.53,60.40
>>与穆尔·雷角交谈。
.target 穆尔·雷角
.turnin 754 >>交任务：净化冰蹄之井
.isQuestComplete 754
step << Tauren
.goto Mulgore,48.53,60.40
>>与穆尔·雷角交谈。
.target 穆尔·雷角
.accept 756 >>接任务：雷角图腾
.isQuestAvailable 756
.xp <5,1
.isQuestTurnedIn 754
step << Tauren
.goto Mulgore,47.51,60.16
>>与贝恩·血蹄交谈。
.target 贝恩·血蹄
.turnin 745 >>交任务：土地之争
.isQuestComplete 745
step << !Tauren
.goto Mulgore,47.51,60.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
.target 贝恩·血蹄
.turnin 745 >>交任务：土地之争
.isQuestComplete 745
step
.goto Mulgore,46.80,60.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔拉·幼蹄|r交谈
.train 3273 >>学习 |T135966:0|t[急救]
.money <0.01
.target 维尔拉·幼蹄
step << Shaman/Druid
.goto Mulgore,45.66,58.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特·深痕|r 交谈
.vendor >> 出售杂物。如果卖掉武器能让你买得起 |T135145:0|t[学徒短杖]（5银04铜），就把它卖掉；钱仍不够则稍后再回来
.target 玛诺特·深痕
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
.goto Mulgore,45.66,58.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_玛诺特·深痕|r|cRXP_BUY_交谈；向他购买|r |T135145:0|t[学徒短杖]|cRXP_BUY_。|r
.collect 2495,1 --Collect Walking Stick (1)
.money <0.0504
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
.goto Mulgore,45.66,58.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特·深痕|r 交谈
.vendor >> 出售杂物。如果卖掉武器能让你买得起 |T133053:0|t[木槌棒]（7银1铜），就把它卖掉；钱仍不够则稍后再回来
.target 玛诺特·深痕
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
.goto Mulgore,45.66,58.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_玛诺特·深痕|r|cRXP_BUY_交谈；向他购买|r |T133053:0|t[木槌棒]|cRXP_BUY_。|r
.collect 2493,1 --Collect Wooden Mallet (1)
.money <0.0701
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
.goto Mulgore,45.50,58.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯纳·鹰眼|r 交谈
.vendor >> 出售杂物。如果卖掉武器能让你买得起 |T135611:0|t[精制短枪]（4银14铜），就把它卖掉；钱仍不够则稍后再回来
.target 肯纳·鹰眼
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0 << tbc
step << Hunter
.goto Mulgore,45.50,58.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_肯纳·鹰眼|r|cRXP_BUY_交谈；向他购买|r |T135611:0|t[精制短枪]|cRXP_BUY_。|r
.collect 2509,1
.money <0.0414
.itemStat 18,QUALITY,<7
#optional
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0 << tbc
step << Shaman/Druid
#optional
#completewith Clawsx
.equip 16,2495 >>|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
.use 2495
.itemcount 2495,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
#optional
#completewith Clawsx
.equip 16,2493 >>|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
.use 2493
.itemcount 2493,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
#optional
#completewith Clawsx
.use 2509
.itemcount 2509,1
.itemStat 18,QUALITY,<7
.xp <4,1
.equip 18,2509 >>装备精制短枪；已有同等或更强的远程武器时跳过。
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0 << tbc
step
.goto Mulgore,47.76,57.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔曼·双月|r交谈
>>|cRXP_WARN_不要跟随刷出的狼|r
.target 扎尔曼·双月
.turnin 771 >>交任务：幻象仪祭
.isQuestComplete 771
step
.goto Mulgore,47.76,57.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔曼·双月|r交谈
>>|cRXP_WARN_不要跟随刷出的狼|r
.target 扎尔曼·双月
.accept 772 >>接任务：幻象仪祭
.isQuestAvailable 772
.xp <3,1
.isQuestTurnedIn 771
step
#optional
#label Vision
step << Hunter
.goto Mulgore,47.81,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文·刺鬃|r 交谈
.train 5116 >> 学习职业技能
.target 雅文·刺鬃
.xp <8,1
step << Druid
.goto Mulgore,48.48,59.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_根妮亚·符文图腾|r 交谈
.train 5186 >>学习职业技能
.target 根妮亚·符文图腾
.xp <8,1
step << Warrior
.goto Mulgore,49.52,60.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克朗·石蹄|r 交谈
.train 284 >> 学习职业技能
.target 克朗·石蹄
.xp <8,1
step << Shaman
.goto Mulgore,48.38,59.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳姆·逐星|r 交谈
.train 8044 >> 学习职业技能
.target 纳姆·逐星
.xp <8,1
step
#loop
.goto Mulgore,55.14,60.65,0
.goto Mulgore,51.50,59.23,50,0
.goto Mulgore,53.00,60.24,50,0
.goto Mulgore,55.14,60.65,50,0
.goto Mulgore,57.47,61.26,50,0
.goto Mulgore,59.65,62.40,50,0
.goto Mulgore,55.14,60.65,50,0
.line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
>>|cRXP_WARN_他在东侧道路上巡逻|r
.unitscan 摩林·云行者
.accept 749 >>接任务：被破坏的货车
.isQuestAvailable 749
.xp <5,1
step
#completewith Clawsx
>>|cRXP_WARN_在这片区域做任务时顺手收集马兹拉纳其所需的物品|r
.complete 766,1 --Prairie Wolf Heart (1)
.complete 766,2 --Flatland Cougar Femur (1)
.complete 766,3 --Plainstrider Scale (1)
.complete 766,4 --Swoop Gizzard (1)
.isOnQuest 766
.isQuestNotComplete 766
step << Tauren
#completewith RavagedCaravan1
>>击杀|cRXP_ENEMY_草原捕食者|r和|cRXP_ENEMY_平原狮|r，拾取掉落的|cRXP_LOOT_爪子|r
.complete 756,1 --Stalker Claws (6)
.mob +草原捕食者
.complete 756,2 --Cougar Claws (6)
.mob +平原狮
.isOnQuest 756
.isQuestNotComplete 756
step
#completewith Clawsx
>>在莫高雷击杀各处的 |cRXP_ENEMY_猛鹫|r, 搜刮 |cRXP_LOOT_羽毛|r
.complete 761,1 --Trophy Swoop Quill (8)
.mob 消瘦的猛鹫
.mob 猛鹫
.isOnQuest 761
.isQuestNotComplete 761
step
.goto Mulgore,53.74,48.17
>>点击|cRXP_PICK_密封的补给箱|r
.turnin 749 >>交任务：被破坏的货车
.isQuestComplete 749
step
.goto Mulgore,53.74,48.17
>>点击|cRXP_PICK_密封的补给箱|r
.accept 751 >>接任务：被破坏的货车
.isQuestAvailable 751
.xp <5,1
.isQuestTurnedIn 749
step
#optional
#label RavagedCaravan1
step << Tauren
#loop
.goto Mulgore,58.1,48.6,0
.goto Mulgore,58.1,48.6,60,0
.goto Mulgore,54.5,40.1,60,0
.goto Mulgore,46.4,50.7,60,0
>>击杀|cRXP_ENEMY_草原捕食者|r和|cRXP_ENEMY_平原狮|r，拾取掉落的|cRXP_LOOT_爪子|r
.complete 756,1 --Stalker Claws (6)
.mob +草原捕食者
.complete 756,2 --Cougar Claws (6)
.mob +平原狮
.isOnQuest 756
.isQuestNotComplete 756
step
#optional
#label Clawsx
step
#completewith Thunderhorn
.goto Mulgore,46.5,55.5,150 >> 返回血蹄村
.subzoneskip 222
step << Hunter
.goto Mulgore,47.81,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文·刺鬃|r 交谈
.train 5116 >> 学习职业技能
.target 雅文·刺鬃
.xp <8,1
step
.goto Mulgore,46.97,57.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茂尔·祈雨|r交谈
.target 茂尔·祈雨
.turnin 766 >>交任务：马兹拉纳其
.isQuestComplete 766
step
#optional
#label Mazzturnin
step << Shaman/Druid
.goto Mulgore,45.66,58.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特·深痕|r 交谈
.vendor >> 出售杂物。如果卖掉武器能让你买得起 |T135145:0|t[学徒短杖]（5银04铜），就把它卖掉；钱仍不够则稍后再回来
.target 玛诺特·深痕
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
.goto Mulgore,45.66,58.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_玛诺特·深痕|r|cRXP_BUY_交谈；向他购买|r |T135145:0|t[学徒短杖]|cRXP_BUY_。|r
.collect 2495,1 --Collect Walking Stick (1)
.money <0.0504
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
.goto Mulgore,45.66,58.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特·深痕|r 交谈
.vendor >> 出售杂物。如果卖掉武器能让你买得起 |T133053:0|t[木槌棒]（7银1铜），就把它卖掉；钱仍不够则稍后再回来
.target 玛诺特·深痕
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
.goto Mulgore,45.66,58.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_玛诺特·深痕|r|cRXP_BUY_交谈；向他购买|r |T133053:0|t[木槌棒]|cRXP_BUY_。|r
.collect 2493,1 --Collect Wooden Mallet (1)
.money <0.0701
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
.goto Mulgore,45.50,58.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯纳·鹰眼|r 交谈
.vendor >> 出售杂物。如果卖掉武器能让你买得起 |T135611:0|t[精制短枪]（4银14铜），就把它卖掉；钱仍不够则稍后再回来
.target 肯纳·鹰眼
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0 << tbc
step << Hunter
.goto Mulgore,45.50,58.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_肯纳·鹰眼|r|cRXP_BUY_交谈；向他购买|r |T135611:0|t[精制短枪]|cRXP_BUY_。|r
.collect 2509,1
.money <0.0414
.itemStat 18,QUALITY,<7
#optional
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0 << tbc
step << Hunter
.goto Mulgore,45.86,57.67
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_姆拉特·远行|r交谈
.collect 2516,1000 << Hunter --Light Shot (1000)
.target 姆拉特·远行
#optional
>>按需补足上述弹药数量，并确认已装备与当前枪械或弓匹配的弹丸或箭矢；库存足够时可跳过。
step << Shaman/Druid
#optional
#completewith ThunderhornCleanse
.equip 16,2495 >>|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
.use 2495
.itemcount 2495,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
#optional
#completewith ThunderhornCleanse
.equip 16,2493 >>|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
.use 2493
.itemcount 2493,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
#optional
#completewith ThunderhornCleanse
.use 2509
.itemcount 2509,1
.itemStat 18,QUALITY,<7
.xp <4,1
.equip 18,2509 >>装备精制短枪；已有同等或更强的远程武器时跳过。
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0 << tbc
step
#completewith Thunderhorn
.goto Mulgore,45.90,58.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈兰特·铁枝|r 交谈
.vendor >> 出售杂物并修理装备
.target 哈兰特·铁枝
step
.goto Mulgore,48.71,59.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈肯·风之图腾|r 交谈
.target 哈肯·风之图腾
.turnin 761 >>交任务：猎捕猛鹫
.isQuestComplete 761
step << Tauren
.goto Mulgore,48.53,60.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔|r交谈
.target 穆尔·雷角
.timer 8,雷角图腾剧情演出
.turnin 756 >>交任务：雷角图腾
.isQuestComplete 756
step << Tauren
.goto Mulgore,48.53,60.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔|r交谈
.target 穆尔·雷角
.accept 758 >>接任务：净化雷角之井
.isQuestAvailable 758
.xp <5,1
.isQuestTurnedIn 756
step
#optional
#label Thunderhorn
step << Shaman
.goto Mulgore,48.38,59.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳姆·逐星|r 交谈
.train 8044 >> 学习职业技能
.target 纳姆·逐星
.xp <8,1
step << Druid
.goto Mulgore,48.48,59.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_根妮亚·符文图腾|r 交谈
.train 5186 >>学习职业技能
.target 根妮亚·符文图腾
.xp <8,1
step << Warrior
.goto Mulgore,49.52,60.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克朗·石蹄|r 交谈
.train 284 >> 学习职业技能
.target 克朗·石蹄
.xp <8,1
step << Hunter
.goto Mulgore,47.81,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文·刺鬃|r 交谈
.train 5116 >> 学习职业技能
.target 雅文·刺鬃
.xp <8,1
step
.goto Mulgore,46.63,61.08
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
>>|cRXP_BUY_向他购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r << Shaman/Druid
>>|cRXP_BUY_向他购买|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_。|r << Warrior
.vendor >> 出售杂物
.collect 1179,10 << Shaman/Druid --Ice Cold Milk (10)
.collect 4541,10 << Warrior --Freshly Baked Bread (10)
.target 旅店老板考乌斯
#optional
>>仅在资金允许时补足上述食物或饮水数量；资金不足时跳过或稍后补购。
step
#completewith Burial
>>|cRXP_WARN_收集齐马兹拉纳其任务所需的物品|r
.complete 766,1 --Prairie Wolf Heart (1)
.complete 766,2 --Flatland Cougar Femur (1)
.complete 766,3 --Plainstrider Scale (1)
.complete 766,4 --Swoop Gizzard (1)
.isOnQuest 766
.isQuestNotComplete 766
step
#completewith Burial
>>击杀|cRXP_ENEMY_猛鹫|r并拾取掉落的|cRXP_LOOT_羽毛|r
.complete 761,1 --Trophy Swoop Quill (8)
.mob 消瘦的猛鹫
.mob 猛鹫
.isOnQuest 761
.isQuestNotComplete 761
step << Tauren
.goto Mulgore,44.49,45.36
>>|cRXP_WARN_在雷角之井使用|r |T135139:0|t[雷角之井净化图腾]|cRXP_WARN_。|r
.use 5415
.complete 758,1 --Cleanse the Thunderhorn Water Well (1)
.isOnQuest 758
.isQuestNotComplete 758
step
#optional
#label ThunderhornCleanse
step
.goto Mulgore,31.27,49.87
>>击杀 |cRXP_ENEMY_巴尔丹掘地工|r 和 |cRXP_ENEMY_巴尔丹鉴定官|r，拾取它们掉落的 |cRXP_LOOT_勘察员的锄头|r
.use 4702 >> |cRXP_WARN_砸碎|r |T134707:0|t[勘察员的锄头] |cRXP_WARN_，需在熔炉旁进行|r
>>|cRXP_WARN_小心 |cRXP_ENEMY_巴尔丹鉴定官|r 施放|r |T135929:0|t[次级治疗术] |cRXP_WARN_（远程施法：自身或附近怪物生命值低于50%时，为其恢复约75点生命值）|r
.complete 746,1 --Broken Tools (5)
.mob 巴尔丹掘地工
.mob 巴尔丹鉴定官
.isOnQuest 746
.isQuestNotComplete 746
step
#loop
.goto Mulgore,31.74,40.31,0
.goto Mulgore,34.08,43.71,50,0
.goto Mulgore,32.98,42.96,50,0
.goto Mulgore,31.72,43.08,50,0
.goto Mulgore,31.08,42.09,50,0
.goto Mulgore,31.12,40.87,50,0
.goto Mulgore,31.74,40.31,50,0
.goto Mulgore,32.44,41.17,50,0
.goto Mulgore,33.57,41.30,50,0
.goto Mulgore,33.82,40.26,50,0
.goto Mulgore,34.48,41.21,50,0
.goto Mulgore,34.50,42.29,50,0
>>击杀|cRXP_ENEMY_风怒唤风者|r和|cRXP_ENEMY_风怒鹰身人|r，拾取掉落的|cRXP_LOOT_风怒鹰身人的爪子|r
.complete 743,1 --Windfury Talon (8)
.mob 风怒唤风者
.mob 风怒鹰身人
.isOnQuest 743
.isQuestNotComplete 743
step
#completewith next
.goto Mulgore,33.37,36.52,50 >> 进入风怒鹰身人北边的洞穴
step
.goto Mulgore,32.72,36.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知奥萨迪·智慧行者|r交谈
.target 先知奥萨迪·智慧行者
.turnin 772 >>交任务：幻象仪祭
.isQuestComplete 772
step
.goto Mulgore,32.72,36.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知奥萨迪·智慧行者|r交谈
.target 先知奥萨迪·智慧行者
.accept 773 >>接任务：智慧仪祭
.isQuestAvailable 773
.xp <4,1
.isQuestTurnedIn 772
step
#optional
#label Burial
step
#completewith SacredBurial
.destroy 4823 >>|cRXP_WARN_摧毁|r |T134712:0|t[先知之水] |cRXP_WARN_因为你不会再用到它|r
step
#completewith SacredBurial
>>|cRXP_WARN_收集齐马兹拉纳其任务所需的物品|r
.complete 766,1 --Prairie Wolf Heart (1)
.complete 766,2 --Flatland Cougar Femur (1)
.complete 766,3 --Plainstrider Scale (1)
.complete 766,4 --Swoop Gizzard (1)
.isOnQuest 766
.isQuestNotComplete 766
step
#completewith next
>>在莫高雷各处击杀|cRXP_ENEMY_猛鹫|r，并拾取掉落的|cRXP_LOOT_羽毛|r
.complete 761,1 --Trophy Swoop Quill (8)
.mob 消瘦的猛鹫
.mob 猛鹫
.mob 长爪猛鹫
.isOnQuest 761
.isQuestNotComplete 761
step
.goto Mulgore,59.85,25.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者诺拉·暴雨图腾|r交谈
.target 博学者诺拉·暴雨图腾
.accept 833 >>接任务：神圣的墓地
.isQuestAvailable 833
.xp <7,1
step
#optional
#label SacredBurial
step
#completewith next
>>击杀|cRXP_ENEMY_刺背干涉者|r
.complete 833,1 --Bristleback Interloper (8)
.mob 刺背干涉者
.isOnQuest 833
.isQuestNotComplete 833
step
.goto Mulgore,61.45,21.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先祖之魂|r交谈
.target 先祖之魂
.turnin 773 >>交任务：智慧仪祭
.isQuestComplete 773
step
.goto Mulgore,61.45,21.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先祖之魂|r交谈
.target 先祖之魂
.accept 775 >>接任务：雷霆崖之旅
.isQuestAvailable 775
.xp <4,1
.isQuestTurnedIn 773
step
#loop
.goto Mulgore,59.85,25.62,0
.goto Mulgore,59.85,25.62,25,0
.goto Mulgore,61.14,22.93,25,0
.goto Mulgore,61.77,22.49,25,0
.goto Mulgore,62.18,22.05,25,0
.goto Mulgore,62.32,20.89,25,0
.goto Mulgore,61.62,19.50,25,0
.goto Mulgore,60.44,19.50,25,0
.goto Mulgore,60.16,21.06,25,0
.goto Mulgore,60.41,21.96,25,0
.goto Mulgore,61.12,22.88,25,0
>>击杀|cRXP_ENEMY_刺背干涉者|r
.complete 833,1 --Bristleback Interloper (8)
.mob 刺背干涉者
.isOnQuest 833
.isQuestNotComplete 833
step
.goto Mulgore,59.85,25.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者诺拉·暴雨图腾|r交谈
.target 博学者诺拉·暴雨图腾
.turnin 833 >>交任务：神圣的墓地
.isQuestComplete 833
step
#completewith next
>>|cRXP_WARN_收集齐马兹拉纳其任务所需的物品|r
.complete 766,1 --Prairie Wolf Heart (1)
.complete 766,2 --Flatland Cougar Femur (1)
.complete 766,3 --Plainstrider Scale (1)
.complete 766,4 --Swoop Gizzard (1)
.isOnQuest 766
.isQuestNotComplete 766
step
#loop
.goto Mulgore,51.00,18.40,0
.goto Mulgore,59.52,23.36,60,0
.goto Mulgore,57.51,19.08,60,0
.goto Mulgore,55.21,18.67,60,0
.goto Mulgore,52.99,17.34,60,0
.goto Mulgore,51.00,18.40,60,0
.goto Mulgore,49.84,20.74,60,0
.goto Mulgore,49.82,23.69,60,0
.goto Mulgore,49.52,26.10,60,0
.goto Mulgore,49.72,28.14,60,0
.goto Mulgore,50.79,29.37,60,0
.goto Mulgore,52.24,30.07,60,0
.goto Mulgore,54.21,30.43,60,0
.goto Mulgore,56.15,30.35,60,0
.goto Mulgore,57.77,30.48,60,0
.goto Mulgore,58.79,28.52,60,0
.goto Mulgore,60.56,25.88,60,0
.goto Mulgore,59.52,23.36,60,0
>>击杀|cRXP_ENEMY_猛鹫|r，拾取掉落的|cRXP_LOOT_羽毛|r
.complete 761,1 --Trophy Swoop Quill (8)
.mob 消瘦的猛鹫
.mob 猛鹫
.mob 长爪猛鹫
.isOnQuest 761
.isQuestNotComplete 761
step
#loop
.goto Mulgore,55.06,32.48,0
.goto Mulgore,55.06,32.48,60,0
.goto Mulgore,53.84,40.80,60,0
.goto Mulgore,53.19,45.16,60,0
.goto Mulgore,57.45,48.86,60,0
.goto Mulgore,59.04,52.79,60,0
.goto Mulgore,59.12,58.09,60,0
.goto Mulgore,48.67,44.84,60,0
>>|cRXP_WARN_收集齐马兹拉纳其任务所需的物品|r
.complete 766,1 --Prairie Wolf Heart (1)
.mob +草原狼前锋
.mob +草原捕食者
.mob +草原狼前锋
.complete 766,2 --Flatland Cougar Femur (1)
.mob +平原狮
.complete 766,3 --Plainstrider Scale (1)
.mob +老平原陆行鸟
.mob +成年平原陆行鸟
.complete 766,4 --Swoop Gizzard (1)
.mob +长爪猛鹫
.mob +猛鹫
.mob +消瘦的猛鹫
.isOnQuest 766
.isQuestNotComplete 766
step
#optional
#loop
.goto Mulgore,59.52,23.36,60,0
.goto Mulgore,57.51,19.08,60,0
.goto Mulgore,55.21,18.67,60,0
.goto Mulgore,52.99,17.34,60,0
.goto Mulgore,51.00,18.40,60,0
.goto Mulgore,49.84,20.74,60,0
.goto Mulgore,49.82,23.69,60,0
.goto Mulgore,49.52,26.10,60,0
.goto Mulgore,49.72,28.14,60,0
.goto Mulgore,50.79,29.37,60,0
.goto Mulgore,52.24,30.07,60,0
.goto Mulgore,54.21,30.43,60,0
.goto Mulgore,56.15,30.35,60,0
.goto Mulgore,57.77,30.48,60,0
.goto Mulgore,58.79,28.52,60,0
.goto Mulgore,60.56,25.88,60,0
.goto Mulgore,59.52,23.36,60,0
.xp 9+3020 >> 刷怪至 3020+/6500 经验值
.isQuestComplete 761
.isQuestComplete 766
step
#optional
#loop
.goto Mulgore,59.52,23.36,60,0
.goto Mulgore,57.51,19.08,60,0
.goto Mulgore,55.21,18.67,60,0
.goto Mulgore,52.99,17.34,60,0
.goto Mulgore,51.00,18.40,60,0
.goto Mulgore,49.84,20.74,60,0
.goto Mulgore,49.82,23.69,60,0
.goto Mulgore,49.52,26.10,60,0
.goto Mulgore,49.72,28.14,60,0
.goto Mulgore,50.79,29.37,60,0
.goto Mulgore,52.24,30.07,60,0
.goto Mulgore,54.21,30.43,60,0
.goto Mulgore,56.15,30.35,60,0
.goto Mulgore,57.77,30.48,60,0
.goto Mulgore,58.79,28.52,60,0
.goto Mulgore,60.56,25.88,60,0
.goto Mulgore,59.52,23.36,60,0
.xp 9+3720 >> 刷怪至 3720+/6500 经验值
.isQuestComplete 761
step
#optional
#loop
.goto Mulgore,59.52,23.36,60,0
.goto Mulgore,57.51,19.08,60,0
.goto Mulgore,55.21,18.67,60,0
.goto Mulgore,52.99,17.34,60,0
.goto Mulgore,51.00,18.40,60,0
.goto Mulgore,49.84,20.74,60,0
.goto Mulgore,49.82,23.69,60,0
.goto Mulgore,49.52,26.10,60,0
.goto Mulgore,49.72,28.14,60,0
.goto Mulgore,50.79,29.37,60,0
.goto Mulgore,52.24,30.07,60,0
.goto Mulgore,54.21,30.43,60,0
.goto Mulgore,56.15,30.35,60,0
.goto Mulgore,57.77,30.48,60,0
.goto Mulgore,58.79,28.52,60,0
.goto Mulgore,60.56,25.88,60,0
.goto Mulgore,59.52,23.36,60,0
.xp 9+3700 >> 刷怪至 3700+/6500 经验值
.isQuestComplete 766
step
#optional
#loop
.goto Mulgore,59.52,23.36,60,0
.goto Mulgore,57.51,19.08,60,0
.goto Mulgore,55.21,18.67,60,0
.goto Mulgore,52.99,17.34,60,0
.goto Mulgore,51.00,18.40,60,0
.goto Mulgore,49.84,20.74,60,0
.goto Mulgore,49.82,23.69,60,0
.goto Mulgore,49.52,26.10,60,0
.goto Mulgore,49.72,28.14,60,0
.goto Mulgore,50.79,29.37,60,0
.goto Mulgore,52.24,30.07,60,0
.goto Mulgore,54.21,30.43,60,0
.goto Mulgore,56.15,30.35,60,0
.goto Mulgore,57.77,30.48,60,0
.goto Mulgore,58.79,28.52,60,0
.goto Mulgore,60.56,25.88,60,0
.goto Mulgore,59.52,23.36,60,0
.xp 9+4400 >> 刷怪至 4400+/6500 经验值
step << !Druid
#completewith Bloodhoofturnins1
.hs >>使用炉石返回血蹄村
.use 6948
.subzoneskip 222
.bindlocation 222,1
.cooldown item,6948,>0,1
>>只有绑定地点与目的地一致且冷却完毕时使用炉石；否则按后面的道路或航线说明返回。
step
.goto Mulgore,47.33,57.17
>>前往血蹄村，若仍在飞行或传送中，请等到落地；若炉石不可用，沿道路步行返回血蹄村。
+确认已抵达血蹄村并已落地
step
.goto Mulgore,46.62,61.08
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
.vendor >> 出售杂物
.target 旅店老板考乌斯
.isQuestAvailable 870
step
.goto Mulgore,47.51,60.16
>>与贝恩·血蹄交谈。
.target 贝恩·血蹄
.turnin 746 >>交任务：矮人的挖掘场
.isQuestComplete 746
step
.goto Mulgore,47.36,62.01
>>与卢尔·鹰爪交谈。
.target 卢尔·鹰爪
.turnin 743 >>交任务：风怒鹰身人
.isQuestComplete 743
step << Tauren
.goto Mulgore,48.53,60.40
>>与穆尔·雷角交谈。
.target 穆尔·雷角
.timer 8,净化雷角之井剧情演出
.turnin 758 >>交任务：净化雷角之井 << Tauren
.isQuestComplete 758 << Tauren
step
.goto Mulgore,48.71,59.32
>>与哈肯·风之图腾交谈。
.target 哈肯·风之图腾
.turnin 761 >>交任务：猎捕猛鹫
.isQuestComplete 761
step
#optional
#label Bloodhoofturnins1
step << Hunter
.goto Mulgore,45.50,58.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_肯纳·鹰眼|r 对话
>>|cRXP_BUY_向他购买|r |T132384:0|t[重弹丸]|cRXP_BUY_。|r << Hunter
.collect 2519,1000 << Hunter --Heavy Shot (1000)
.target 肯纳·鹰眼
#optional
>>按需补足上述弹药数量，并确认已装备与当前枪械或弓匹配的弹丸或箭矢；库存足够时可跳过。
step
.goto Mulgore,46.97,57.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茂尔·祈雨|r交谈
.target 茂尔·祈雨
.turnin 766 >>交任务：马兹拉纳其
.isQuestComplete 766
step << Warrior
.goto Mulgore,49.52,60.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
.train 6546 >>学习职业技能
.target 克朗·石蹄
step << Shaman
.goto Mulgore,48.38,59.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆·逐星|r交谈
.trainer >>学习职业技能
.target 纳姆·逐星
step << Shaman
.goto Mulgore,48.38,59.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆·逐星|r交谈
.target 纳姆·逐星
.accept 2984 >>接任务：火焰的召唤
.isQuestAvailable 2984
.xp <10,1
.isQuestAvailable 1522
.isNotOnQuest 1522
.isQuestAvailable 1523
.isNotOnQuest 1523
.isQuestAvailable 2983
.isNotOnQuest 2983
step << Hunter
.goto Mulgore,47.81,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
.trainer >>学习职业技能
.target 雅文·刺鬃
step << Hunter
.goto Mulgore,47.81,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
.target 雅文·刺鬃
.accept 6061 >>接任务：驯服野兽
.isQuestAvailable 6061
.xp <10,1
step << Druid
.goto Mulgore,48.48,59.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚·符文图腾|r交谈
.trainer >>学习职业技能
.target 根妮亚·符文图腾
step << Druid
.goto Mulgore,48.48,59.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚·符文图腾|r交谈
.target 根妮亚·符文图腾
.accept 5928 >>接任务：响应召唤
.isQuestAvailable 5928
.xp <10,1
.isQuestAvailable 5926
.isNotOnQuest 5926
.isQuestAvailable 5927
.isNotOnQuest 5927
step << Druid
.goto Mulgore,48.48,59.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚·符文图腾|r交谈
.train 8924 >>学习职业技能
.target 根妮亚·符文图腾
step << Hunter
#loop
.goto Mulgore,39.38,57.43,0
.goto Mulgore,42.87,54.88,50,0
.goto Mulgore,40.73,55.60,50,0
.goto Mulgore,39.38,57.43,50,0
.use 15914 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_驯服一只|r |cRXP_ENEMY_成年平原陆行鸟|r |cRXP_WARN_，保持在最大射程处|r
.complete 6061,1 --Tame an Adult Plainstrider (1)
.mob 成年平原陆行鸟
.isOnQuest 6061
.isQuestNotComplete 6061
step << Hunter
.goto Mulgore,47.81,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
.target 雅文·刺鬃
.turnin 6061 >>交任务：驯服野兽
.isQuestComplete 6061
step << Hunter
.goto Mulgore,47.81,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
.target 雅文·刺鬃
.accept 6087 >>接任务：驯服野兽
.isQuestAvailable 6087
.xp <10,1
.isQuestTurnedIn 6061
step << Hunter
#loop
.goto Mulgore,49.49,42.27,0
.goto Mulgore,47.18,50.15,50,0
.goto Mulgore,46.65,47.22,50,0
.goto Mulgore,48.18,45.27,50,0
.goto Mulgore,49.49,42.27,50,0
.use 15915 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_驯服一只|r |cRXP_ENEMY_草原捕食者|r |cRXP_WARN_，保持在最大射程处|r
.complete 6087,1 --Tame a Prairie Stalker (1)
.mob 草原捕食者
.isOnQuest 6087
.isQuestNotComplete 6087
step << Hunter
.goto Mulgore,47.81,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
.target 雅文·刺鬃
.turnin 6087 >>交任务：驯服野兽
.isQuestComplete 6087
step << Hunter
.goto Mulgore,47.81,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
.target 雅文·刺鬃
.accept 6088 >>接任务：驯服野兽
.isQuestAvailable 6088
.xp <10,1
.isQuestTurnedIn 6087
step << Hunter
#loop
.goto Mulgore,47.25,41.33,0
.goto Mulgore,47.25,41.33,80,0
.goto Mulgore,45.41,40.29,80,0
.goto Mulgore,51.57,44.40,80,0
.use 15916 >> |cRXP_WARN_在最大射程处使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_驯服|r |cRXP_ENEMY_猛鹫|r|cRXP_WARN_。如果它把你击倒，请立即再次使用驯兽棒|r
>>|cRXP_WARN_如果失败并用完驯兽棒的充能次数，请放弃任务、重新接取，再回来尝试|r
.complete 6088,1 --Tame a Swoop (1)
.mob 猛鹫
.isOnQuest 6088
.isQuestNotComplete 6088
step << Hunter
.goto Mulgore,47.81,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
.target 雅文·刺鬃
.turnin 6088 >>交任务：驯服野兽
.isQuestComplete 6088
step << Hunter
.goto Mulgore,47.81,55.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
.target 雅文·刺鬃
.accept 6089 >>接任务：训练野兽
.isQuestAvailable 6089
.xp <10,1
.isQuestTurnedIn 6088
step
.goto Mulgore,47.63,61.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加纳·麦风|r交谈
>>|cRXP_BUY_向她购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_。|r << Shaman/Druid
>>|cRXP_BUY_向她购买|r |T133968:0|t[刚出炉的面包]|cRXP_BUY_。|r << Warrior
.collect 1179,20 << Shaman/Druid --Ice Cold Milk (20)
.collect 4541,20 << Warrior --Freshly Baked Bread (20)
.target 加纳·麦风
#optional
>>仅在资金允许时补足上述食物或饮水数量；资金不足时跳过或稍后补购。
step
#loop
.goto Mulgore,55.14,60.65,0
.goto Mulgore,51.50,59.23,50,0
.goto Mulgore,53.00,60.24,50,0
.goto Mulgore,55.14,60.65,50,0
.goto Mulgore,57.47,61.26,50,0
.goto Mulgore,59.65,62.40,50,0
.goto Mulgore,55.14,60.65,50,0
.line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩林·云行者|r 交谈
>>|cRXP_WARN_他在东侧道路上巡逻|r
.unitscan 摩林·云行者
.turnin 751 >> 交任务：被破坏的货车
.isQuestComplete 751
step
#loop
.goto Mulgore,55.14,60.65,0
.goto Mulgore,51.50,59.23,50,0
.goto Mulgore,53.00,60.24,50,0
.goto Mulgore,55.14,60.65,50,0
.goto Mulgore,57.47,61.26,50,0
.goto Mulgore,59.65,62.40,50,0
.goto Mulgore,55.14,60.65,50,0
.line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩林·云行者|r 交谈
>>|cRXP_WARN_他在东侧道路上巡逻|r
.unitscan 摩林·云行者
.group
.accept 764 >> 接任务：风险投资公司
.isQuestAvailable 764
.xp <6,1
.isQuestTurnedIn 751
step
#loop
.goto Mulgore,55.14,60.65,0
.goto Mulgore,51.50,59.23,50,0
.goto Mulgore,53.00,60.24,50,0
.goto Mulgore,55.14,60.65,50,0
.goto Mulgore,57.47,61.26,50,0
.goto Mulgore,59.65,62.40,50,0
.goto Mulgore,55.14,60.65,50,0
.line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩林·云行者|r 交谈
>>|cRXP_WARN_他在东侧道路上巡逻|r
.unitscan 摩林·云行者
.group
.accept 765 >> 接任务：菲兹普罗克主管
.isQuestAvailable 765
.xp <5,1
.isQuestTurnedIn 751
step
#loop
.goto Mulgore,55.14,60.65,0
.goto Mulgore,51.50,59.23,50,0
.goto Mulgore,53.00,60.24,50,0
.goto Mulgore,55.14,60.65,50,0
.goto Mulgore,57.47,61.26,50,0
.goto Mulgore,59.65,62.40,50,0
.goto Mulgore,55.14,60.65,50,0
.line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩林·云行者|r 交谈
>>|cRXP_WARN_他在东侧道路上巡逻|r
.unitscan 摩林·云行者
.turnin 751 >> 交任务：被破坏的货车
.isQuestComplete 751
step
#completewith Fizsprocket
.goto Mulgore,61.51,47.29,20 >> 前往风险投资公司矿井
.group
step
#completewith next
>>击杀|cRXP_ENEMY_风险投资公司工人|r和|cRXP_ENEMY_风险投资公司主官|r
.complete 764,1 --Venture Co. Worker (14)
.mob +风险投资公司工人
.complete 764,2 --Venture Co. Supervisor (6)
.mob +风险投资公司主官
.group 2
.isOnQuest 764
.isQuestNotComplete 764
step
#label Fizsprocket
.goto Mulgore,64.95,43.33
>>击杀|cRXP_ENEMY_菲兹普罗克主管|r，拾取掉落的|cRXP_LOOT_菲兹普罗克的笔记板|r
>>|cRXP_WARN_进入矿洞后，沿右侧（东侧）洞壁前进即可找到他|r
.complete 765,1 --Fizsprocket's Clipboard (1)
.mob 菲兹普罗克主管
.group 2
.isOnQuest 765
.isQuestNotComplete 765
step
#loop
.goto Mulgore,61.35,47.55,0
.goto Mulgore,61.35,47.55,25,0
.goto Mulgore,60.10,47.84,25,0
.goto Mulgore,59.50,48.21,25,0
.goto Mulgore,59.68,48.85,25,0
.goto Mulgore,60.14,49.14,25,0
.goto Mulgore,62.01,48.74,25,0
.goto Mulgore,61.89,47.84,25,0
>>击杀|cRXP_ENEMY_风险投资公司工人|r和|cRXP_ENEMY_风险投资公司主官|r
.complete 764,1 --Venture Co. Worker (14)
.mob +风险投资公司工人
.complete 764,2 --Venture Co. Supervisor (6)
.mob +风险投资公司主官
.group 2
.isOnQuest 764
.isQuestNotComplete 764
step
#loop
.goto Mulgore,55.14,60.65,0
.goto Mulgore,51.50,59.23,50,0
.goto Mulgore,53.00,60.24,50,0
.goto Mulgore,55.14,60.65,50,0
.goto Mulgore,57.47,61.26,50,0
.goto Mulgore,59.65,62.40,50,0
.goto Mulgore,55.14,60.65,50,0
.line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
>>|cRXP_WARN_他在东侧道路上巡逻|r
.unitscan 摩林·云行者
.turnin 764 >>交任务：风险投资公司
.isQuestComplete 764
step
#loop
.goto Mulgore,55.14,60.65,0
.goto Mulgore,51.50,59.23,50,0
.goto Mulgore,53.00,60.24,50,0
.goto Mulgore,55.14,60.65,50,0
.goto Mulgore,57.47,61.26,50,0
.goto Mulgore,59.65,62.40,50,0
.goto Mulgore,55.14,60.65,50,0
.line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
>>|cRXP_WARN_他在东侧道路上巡逻|r
.unitscan 摩林·云行者
.turnin 765 >>交任务：菲兹普罗克主管
.isQuestComplete 765
step << Hunter
#loop
.goto Mulgore,67.19,63.78,0
.goto Mulgore,67.19,63.78,50,0
.goto Mulgore,66.34,67.01,50,0
.goto Mulgore,63.86,66.31,50,0
.goto Mulgore,61.81,65.52,50,0
.goto Mulgore,61.61,61.32,50,0
.goto Mulgore,63.58,60.51,50,0
.goto Mulgore,65.56,59.37,50,0
.goto Mulgore,67.62,59.06,50,0
.goto Mulgore,66.34,67.01,50,0
.cast 1515 >>驯服一只|cRXP_ENEMY_草原狼前锋|r
>>|cRXP_WARN_这样便能学习|r |T132278:0|t[撕咬（等级 2）]
.mob 草原狼前锋
step
#completewith next
.goto Mulgore,69.6,60.4,100,0
.zone The Barrens >> 进入贫瘠之地
step
.goto The Barrens,44.45,59.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r 交谈
.fp Camp Taurajo >> 取得陶拉祖营地飞行点
.target 欧姆萨·雷角
.isQuestAvailable 5922
step << Tauren
.goto The Barrens,44.9,58.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔格·锐角|r交谈
.target 基尔格·锐角
.accept 854 >>接任务：十字路口之旅
.isQuestAvailable 854
.xp <9,1
.isQuestAvailable 844
.isNotOnQuest 844
step
#completewith next
.subzone 380 >>向北前往十字路口
>>|cRXP_WARN_务必沿着道路前进，否则可能会引到高等级怪物的仇恨|r
step
.goto The Barrens,52.26,31.93
>>与图加·符文图腾交谈。
.target 图加·符文图腾
.accept 870 >>接任务：遗忘之池
.isQuestAvailable 870
.xp <10,1
step
.goto The Barrens,52.24,31.00
>>与瑟格拉·黑棘交谈。
.target 瑟格拉·黑棘
.accept 844 >>接任务：平原陆行鸟的威胁
.isQuestAvailable 844
.xp <10,1
step
.goto The Barrens,51.93,30.32
>>与加兹罗格交谈。
.target 加兹罗格
.accept 869 >>接任务：偷钱的迅猛龙
.isQuestAvailable 869
.xp <9,1
step << Tauren
.goto The Barrens,51.50,30.87
>>与索克交谈。
.target 索克
.turnin 854 >>交任务：十字路口之旅 << Tauren
.isQuestComplete 854 << Tauren
step
.goto The Barrens,51.50,30.87
>>与索克交谈。
.target 索克
.accept 871 >>接任务：野猪人的袭击
.isQuestAvailable 871
.xp <9,1
step
.goto The Barrens,51.50,30.87
>>与索克交谈。
.target 索克
.accept 5041 >>接任务：十字路口的补给品
.isQuestAvailable 5041
.xp <9,1
step
.goto The Barrens,51.21,29.05
>>与加翰·鹰翼交谈。
.target 加翰·鹰翼
.accept 6361 >>接任务：一捆兽皮
.isQuestAvailable 6361
.xp <10,1
step
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.target 迪弗拉克
.turnin 6361 >>交任务：一捆兽皮
.isQuestComplete 6361
step
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.target 迪弗拉克
.accept 6362 >>接任务：飞往雷霆崖
.isQuestAvailable 6362
.xp <10,1
.isQuestTurnedIn 6361
step << Hunter/Druid
#completewith next
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.fly Thunder Bluff >>飞往雷霆崖
.target 迪弗拉克
#optional
.zoneskip The Barrens,1
step << Hunter/Druid
.goto Thunder Bluff,47.00,49.82
>>前往雷霆崖飞行平台，若仍在飞行或传送中，请等到落地；未能乘坐航线时，沿道路回莫高雷，乘雷霆崖升降梯入城，再到中央飞行平台。
+确认已抵达雷霆崖飞行平台并已落地
step << Hunter/Druid
.goto Thunder Bluff,45.6,55.9
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安哈努|r交谈
.target 安哈努
.turnin 6362 >>交任务：飞往雷霆崖
.isQuestComplete 6362
step << Hunter/Druid
.goto Thunder Bluff,45.6,55.9
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安哈努|r交谈
.target 安哈努
.accept 6363 >>接任务：双足飞龙管理员塔尔
.isQuestAvailable 6363
.xp <10,1
.isQuestTurnedIn 6362
step << Druid
.goto Thunder Bluff,45.83,64.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
.home >>将炉石绑定在雷霆崖
.target 旅店老板帕拉
.bindlocation 1638
.isQuestAvailable 5932
step << Hunter/Druid
.goto Thunder Bluff,60.0,51.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·血蹄|r交谈
.target 凯恩·血蹄
.turnin 775 >>交任务：雷霆崖之旅
.isQuestComplete 775
step << Hunter
.goto Thunder Bluff,57.4,89.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_浩特·雷角|r 交谈
.target 浩特·雷角
.turnin 6089 >> 交任务：训练野兽
.isQuestComplete 6089
step << Hunter
.goto Thunder Bluff,54.08,84.08
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫苏瓦·雷角|r交谈
.train 24547 >>学习宠物技能
.target 赫苏瓦·雷角
step << Hunter
#completewith ReturntoJahan
+|cRXP_WARN_将|r |T132162:0|t[训练野兽]|cRXP_WARN_拖到动作条上，再用它教宠物学习技能|r
step << Druid
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克·符文图腾|r交谈
.goto Thunder Bluff,76.7,27.3
.target 图拉克·符文图腾
.turnin 5928 >>交任务：响应召唤
.isQuestComplete 5928
step << Druid
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克·符文图腾|r交谈
.goto Thunder Bluff,76.7,27.3
.target 图拉克·符文图腾
.accept 5922 >>接任务：月光林地
.isQuestAvailable 5922
.xp <10,1
step << Druid
.goto Thunder Bluff,76.7,27.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克·符文图腾|r交谈
.target 图拉克·符文图腾
.accept 5922 >>接任务：月光林地
.isQuestAvailable 5922
.xp <10,1
step << Druid
#completewith next
.cast 18960 >>施放 |T135758:0|t[传送：月光林地]
.zoneskip Moonglade
#optional
.train 18960,3
>>若尚未学会传送：月光林地，先向雷霆崖的图拉克接取“月光林地”任务，学会传送后再继续。
step << Druid
.goto Moonglade,56.21,30.64
>>前往永夜港德迪利特处，若仍在飞行或传送中，请等到落地；先使用已学会的传送：月光林地；尚未学会时，回雷霆崖图拉克处接取“月光林地”。
+确认已抵达永夜港德迪利特处并已落地
step << Druid
.goto Moonglade,56.21,30.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
.target 德迪利特·星焰
.turnin 5922 >>交任务：月光林地
.isQuestComplete 5922
step << Druid
.goto Moonglade,56.21,30.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
.target 德迪利特·星焰
.accept 5930 >>接任务：巨熊之灵
.isQuestAvailable 5930
.xp <10,1
.isQuestTurnedIn 5922
step << Druid
.goto Moonglade,39.2,27.5
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨熊之灵|r交谈
.complete 5930,1 --Seek out the Great Bear Spirit and learn what it has to share with you about the nature of the bear. (1)
.target 巨熊之灵
.skipgossip
.isOnQuest 5930
.isQuestNotComplete 5930
step << Druid
#completewith next
.cast 18960 >>施放 |T135758:0|t[传送：月光林地]
#optional
.train 18960,3
>>传送已经学会且本次需要使用时再施放；没有该法术时留在当前路线，稍后补做这次训练。
step << Druid
.goto Moonglade,56.21,30.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
.target 德迪利特·星焰
.turnin 5930 >>交任务：巨熊之灵
.isQuestComplete 5930
step << Druid
.goto Moonglade,56.21,30.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
.target 德迪利特·星焰
.accept 5932 >>接任务：返回雷霆崖
.isQuestAvailable 5932
.xp <10,1
.isQuestTurnedIn 5930
step << Druid
#completewith DruidBearForm
.hs >> 使用炉石返回雷霆崖
.use 6948
.bindlocation 1638,1
.cooldown item,6948,>0,1
>>只有绑定地点与目的地一致且冷却完毕时使用炉石；否则按后面的道路或航线说明返回。
step << Druid
#completewith next
.goto Moonglade,44.29,45.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布瑟恩·草风|r 交谈
.fly Thunder Bluff >> 飞往雷霆崖
.target 布瑟恩·草风
#optional
.zoneskip Moonglade,1
step << Druid
.goto Thunder Bluff,76.70,27.30
>>前往雷霆崖图拉克处，若仍在飞行或传送中，请等到落地；炉石不可用或绑定不符时，向月光林地的布瑟恩·草风乘坐德鲁伊专用航线到雷霆崖，再前往长者高地。
+确认已抵达雷霆崖图拉克处并已落地
step << Druid
.goto Thunder Bluff,76.7,27.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克·符文图腾|r交谈
.target 图拉克·符文图腾
.turnin 5932 >>交任务：返回雷霆崖
.isQuestComplete 5932
step << Druid
.goto Thunder Bluff,76.7,27.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克·符文图腾|r交谈
.target 图拉克·符文图腾
.accept 6002 >>接任务：身心之力
.isQuestAvailable 6002
.xp <10,1
.isQuestTurnedIn 5932
step << Druid
#optional
#label DruidBearForm
step << Druid/Hunter
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
.target 塔尔
.turnin 6363 >>交任务：双足飞龙管理员塔尔
.isQuestComplete 6363
step << Druid/Hunter
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
.target 塔尔
.accept 6364 >>接任务：向加翰回复
.isQuestAvailable 6364
.xp <10,1
.isQuestTurnedIn 6363
step << Druid/Hunter
#ah
.goto Thunder Bluff,44.43,43.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫兰塔|r交谈
>>|cRXP_WARN_这会解锁一个简单任务。如果你已有2个专业，就跳过此步|r
.train 8613 >>学习 |T134366:0|t[剥皮]
.target 莫兰塔
step << Druid/Hunter
#ah
.goto Thunder Bluff,44.39,44.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔伦·陆行者|r 交谈
.target 维尔伦·陆行者
.skill skinning,<1,1
.accept 768 >> 接任务：收集皮革
.isQuestAvailable 768
.xp <4,1
step << Druid/Hunter
#ah
.goto Thunder Bluff,40.39,51.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师斯塔比|r交谈
.collect 2318,12,768,1 >>|cRXP_BUY_购买十二张|r |T134252:0|t[轻皮] |cRXP_BUY_，可从拍卖行购买|r
.target 拍卖师斯塔比
.skill skinning,<1,1
step << Druid/Hunter
.goto Thunder Bluff,44.39,44.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔伦·陆行者|r 交谈
.target 维尔伦·陆行者
.turnin 768 >> 交任务：收集皮革
.isQuestComplete 768
step << Hunter
#completewith ReturntoJahan
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
.fly Crossroads >>飞往十字路口
.target 塔尔
#optional
.zoneskip Thunder Bluff,1
step << Hunter
.goto The Barrens,51.21,29.05
>>前往十字路口，若仍在飞行或传送中，请等到落地；没有可用航线时，从雷霆崖乘升降梯下山，沿莫高雷和贫瘠之地的道路前往十字路口。
+确认已抵达十字路口并已落地
step << Druid
#completewith next
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
.fly Camp Taurajo >>飞往陶拉祖营地
.target 塔尔
#optional
.zoneskip Thunder Bluff,1
.isOnQuest 6002
.isQuestNotComplete 6002
step << Druid
.isOnQuest 6002
.isQuestNotComplete 6002
.goto The Barrens,44.45,59.15
>>前往陶拉祖营地，若仍在飞行或传送中，请等到落地；没有可用航线时，从雷霆崖乘升降梯下山，沿莫高雷道路进入贫瘠之地的陶拉祖营地。
+确认已抵达陶拉祖营地并已落地
step << Druid
.goto The Barrens,42.00,60.86
.use 15710 >>|cRXP_WARN_使用|r |T132857:0|t[赛纳里奥银尘]|cRXP_WARN_，目标为|r |cRXP_PICK_月夜枭兽之石|r
>>击杀刚出现的|cRXP_ENEMY_月爪枭兽|r，随后与|cRXP_FRIENDLY_月爪枭兽的灵魂|r交谈
>>|cRXP_WARN_小心！|cRXP_ENEMY_月爪枭兽|r 会施放|r |T132152:0|t[痛击] |cRXP_WARN_（获得2次额外攻击，每10秒触发一次）|r
>>|cRXP_WARN_避开该区域内的|r|cRXP_ENEMY_电角蜥蜴|r|cRXP_WARN_。|r
.complete 6002,1 --Face Lunaclaw and earn the strength of body and heart it possesses. (1)
.mob 月爪枭兽
.target 月爪枭兽的灵魂
.skipgossip
.isOnQuest 6002
.isQuestNotComplete 6002
step << Druid
#completewith next
.goto The Barrens,44.45,59.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r 交谈
.fly Thunder Bluff >> 飞往雷霆崖
.target 欧姆萨·雷角
#optional
.zoneskip The Barrens,1
.isQuestComplete 6002
step << Druid
.isQuestComplete 6002
.goto Thunder Bluff,76.477,27.221
>>前往雷霆崖图拉克处，若仍在飞行或传送中，请等到落地；未能乘坐航线时，沿道路回莫高雷，乘雷霆崖升降梯入城，前往长者高地。
+确认已抵达雷霆崖图拉克处并已落地
step << Druid
.goto Thunder Bluff,76.477,27.221
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克·符文图腾|r交谈
.target 图拉克·符文图腾
.turnin 6002 >>交任务：身心之力
.isQuestComplete 6002
step << Druid
#completewith next
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
.fly Crossroads >>飞往十字路口
.target 塔尔
#optional
.zoneskip Thunder Bluff,1
step << Druid
.goto The Barrens,51.21,29.05
>>前往十字路口，若仍在飞行或传送中，请等到落地；没有可用航线时，乘雷霆崖升降梯下山，沿道路经莫高雷前往十字路口。
+确认已抵达十字路口并已落地
step << Hunter/Druid
.goto The Barrens,51.21,29.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加翰·鹰翼|r交谈
.target 加翰·鹰翼
.turnin 6364 >>交任务：向加翰回复
.isQuestComplete 6364
step << Hunter/Druid
#optional
#label ReturntoJahan
step << Shaman/Druid
.goto The Barrens,51.24,29.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_纳加尔·死眼|r|cRXP_BUY_交谈；向他购买|r |T135154:0|t[短杖]|cRXP_BUY_。|r
.collect 854,1 --Collect Quarter Staff (1)
.money <0.3022
.target 纳加尔·死眼
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.4
step << Shaman/Druid
#optional
#completewith FurlScornbrow
.equip 16,854 >>|cRXP_WARN_达到 11 级后装备|r |T135154:0|t[短杖]|cRXP_WARN_。|r
.use 854
.itemcount 854,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.4
.xp <11,1
step << Warrior
.goto The Barrens,51.24,29.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_纳加尔·死眼|r|cRXP_BUY_交谈；向他购买|r |T133477:0|t[巨棒]|cRXP_BUY_。|r
.collect 1197,1 --Collect Giant Mace (1)
.money <0.2666
.target 纳加尔·死眼
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Warrior
#optional
#completewith FurlScornbrow
.equip 16,1197 >>|cRXP_WARN_装备|r |T133477:0|t[巨棒]
.use 1197
.itemcount 1197,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Tauren Hunter
.goto The Barrens,51.11,29.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_对话|r |cRXP_FRIENDLY_阿瑟罗克|r
>>|cRXP_BUY_大量购买|r |T132384:0|t[重弹丸] |cRXP_BUY_，向他购买即可|r
>>|cRXP_WARN_短时间内无法再购买！|r
.collect 2519,1600 --Heavy Shot (1600)
.vendor >> 出售杂物
.target 阿瑟罗克
--Tauren Hunter gun not worth? Making them train bows in Org
#optional
>>按需补足上述弹药数量，并确认已装备与当前枪械或弓匹配的弹丸或箭矢；库存足够时可跳过。
step << Shaman
.goto The Barrens,55.86,19.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳尔·菲斯|r交谈
.target 卡纳尔·菲斯
.turnin 2984 >>交任务：火焰的召唤
.isQuestComplete 2984
step << Shaman
.goto The Barrens,55.86,19.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳尔·菲斯|r交谈
.target 卡纳尔·菲斯
.accept 1524 >>接任务：火焰的召唤
.isQuestAvailable 1524
.xp <10,1
step << Shaman
#completewith CallofFire2
.zone Durotar >> 前往杜隆塔尔
.zoneskip Durotar
step << Shaman
#completewith next
.goto Durotar,36.74,57.78,10,0
.goto Durotar,36.63,58.15,8,0
.goto Durotar,36.63,58.15,8,0
.goto Durotar,36.77,58.98,8,0
.goto Durotar,36.85,58.32,8,0
.goto Durotar,37.24,58.13,8,0
.goto Durotar,37.86,58.18,8,0
.goto Durotar,38.05,57.79,8,0
.goto Durotar,38.93,57.54,8,0
.goto Durotar,39.19,57.90,8,0
.goto Durotar,39.16,58.56,10 >> 沿着山路向上，前往 |cRXP_FRIENDLY_泰尔夫·祖拉姆|r
>>|cRXP_WARN_小心别从山上掉下去；山路非常狭窄，掉下去可能会死|r
step << Shaman
.goto Durotar,38.52,58.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰尔夫·祖拉姆|r交谈
.target 泰尔夫·祖拉姆
.turnin 1524 >>交任务：火焰的召唤
.isQuestComplete 1524
step << Shaman
.goto Durotar,38.52,58.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰尔夫·祖拉姆|r交谈
.target 泰尔夫·祖拉姆
.accept 1525 >>接任务：火焰的召唤
.isQuestAvailable 1525
.xp <10,1
.isQuestTurnedIn 1524
step << Shaman
#optional
#label CallofFire2
step << Shaman
#completewith next
.goto Durotar,39.13,58.63,10,0
.goto Durotar,39.17,57.93,10,0
.goto Durotar,38.95,57.58,8,0
.goto Durotar,38.61,57.67,8,0
.goto Durotar,38.06,57.78,8,0
.goto Durotar,37.76,58.19,8,0
.goto Durotar,36.96,58.07,15 >> 沿山路下山
>>|cRXP_WARN_小心别从山上掉下去；山路非常狭窄，掉下去可能会死|r
step << Shaman
#completewith next
.zone The Barrens >> 返回贫瘠之地
.zoneskip The Barrens
step << Shaman
#loop
.goto The Barrens,53.57,25.51,0
.goto The Barrens,54.97,25.23,50,0
.goto The Barrens,54.2,24.60,50,0
.goto The Barrens,53.57,25.51,50,0
>>击杀一只 |cRXP_ENEMY_钢鬃寻水者|r 或 |cRXP_ENEMY_钢鬃织棘者|r, 搜刮 |cRXP_LOOT_火焰焦油|r
.complete 1525,1 --Fire Tar (1)
.mob 钢鬃寻水者
.mob 钢鬃织棘者
.isOnQuest 1525
.isQuestNotComplete 1525
step << Shaman
#completewith FurlScornbrow
.zone Durotar >> 返回杜隆塔尔
step << !Shaman
#completewith FurlScornbrow
.zone Durotar >> 前往杜隆塔尔
step
#optional
.abandon 764 >>放弃任务：风险投资公司
.abandon 765 >>放弃任务：菲兹普罗克主管
step
#completewith next
.goto Durotar,49.75,40.38,6,0
.goto Durotar,49.77,40.24,6,0
.goto Durotar,49.69,40.21,6,0
.goto Durotar,49.68,40.30,6,0
.goto Durotar,49.78,40.34,6,0
.goto Durotar,49.79,39.96,6,0
.goto Durotar,49.60,40.04,8 >>沿塔楼向上前往弗恩·凝眉
step
.goto Durotar,49.89,40.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
.target 弗恩·凝眉
.accept 791 >>接任务：新的背包
.isQuestAvailable 791
.xp <4,1
step
#optional
#label FurlScornbrow
step
.goto Durotar,51.51,41.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板格罗斯克|r
.vendor >> 出售杂物
.home >> 将炉石设在剃刀岭
.bindlocation 362
.isQuestAvailable 815
.group
step
.goto Durotar,51.09,42.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师托尔卡|r 对话
.target 厨师托尔卡
.accept 815 >>接任务：恐龙蛋大餐
.isQuestAvailable 815
.xp <6,1
step
.goto Durotar,51.95,43.50
>>|cRXP_WARN_你可以隔着地堡外墙或者在房顶跟他对话|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加索克|r交谈
.target 加索克
.accept 784 >>接任务：背信弃义的人类
.isQuestAvailable 784
.xp <3,1
step
.goto Durotar,51.95,43.50
>>|cRXP_WARN_你可以隔着地堡外墙或者在房顶跟他对话|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加索克|r交谈
.target 加索克
.accept 837 >>接任务：野猪人的进犯
.isQuestAvailable 837
.xp <6,1
step
#completewith Benedict
.goto Durotar,58.08,57.13,120 >> 前往提拉加德城堡
#label TravelToTiragarde
step
#completewith Benedict
#requires TravelToTiragarde
.goto Durotar,59.81,58.22,8,0
.goto Durotar,59.64,58.44,8,0
.goto Durotar,59.55,57.89,8,0
.goto Durotar,59.29,57.89,8 >> 前往要塞二楼
step
#completewith AgedEnvelope
>>击杀|cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r
.complete 784,1 --Kul Tiras Sailor (10)
.mob +库尔提拉斯水手
.complete 784,2 --Kul Tiras Marine (8)
.mob +库尔提拉斯水兵
.isOnQuest 784
.isQuestNotComplete 784
step
#completewith AgedEnvelope
>>击杀|cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r
.mob +库尔提拉斯水手
.mob +库尔提拉斯水兵
.complete 791,1 --Canvas Scraps (8)
.isOnQuest 791
.isQuestNotComplete 791
step
#label Benedict
.goto Durotar,59.75,58.27
>>击杀 |cRXP_ENEMY_本尼迪克上尉|r, 搜刮 |cRXP_LOOT_钥匙|r
.complete 784,3 --Lieutenant Benedict (1)
.mob 本尼迪克上尉
.isOnQuest 784
.isQuestNotComplete 784
step
.goto Durotar,59.75,58.27
>>击杀 |cRXP_ENEMY_本尼迪克上尉|r, 搜刮 |cRXP_LOOT_钥匙|r
.collect 4882,1,830 --Collect Benedict's Key (1)
.mob 本尼迪克上尉
.isQuestAvailable 830
.isNotOnQuest 830
.itemcount 4881,<1
step
.goto Durotar,59.87,57.87,5,0
.goto Durotar,59.83,57.58,5,0
.goto Durotar,59.80,57.82,5,0
.goto Durotar,59.94,57.82,5,0
.goto Durotar,59.94,57.61,5,0
.goto Durotar,59.27,57.65
>>|cRXP_WARN_沿楼梯继续上楼|r
>>打开 |cRXP_PICK_本尼迪克的箱子|r, 拾取 |T133471:0|t[|cRXP_LOOT_旧信封|r]
>>使用 |T133471:0|t[|cRXP_LOOT_旧信封|r]接取任务
.collect 4881,1,830 --Collect Aged Envelope (1)
.use 4881
.accept 830 >>接任务：将军的命令
.isNotOnQuest 830
.isQuestAvailable 830
.xp <5,1
step
#optional
#label AgedEnvelope
step
#loop
.goto Durotar,58.99,58.30,0
.goto Durotar,57.65,58.52,30,0
.goto Durotar,57.36,56.59,30,0
.goto Durotar,58.10,55.52,30,0
.goto Durotar,58.54,53.68,30,0
.goto Durotar,56.54,54.52,30,0
.goto Durotar,56.37,58.35,30,0
.goto Durotar,58.99,58.30,30,0
>>击杀 |cRXP_ENEMY_库尔提拉斯水手|r 和 |cRXP_ENEMY_库尔提拉斯水兵|r, 搜刮 |cRXP_LOOT_帆布脚料|r
.complete 784,1 --Kul Tiras Sailor (10)
.mob +库尔提拉斯水手
.complete 784,2 --Kul Tiras Marine (8)
.mob +库尔提拉斯水兵
.mob +库尔提拉斯水手
.mob +库尔提拉斯水兵
.isOnQuest 784
.isQuestNotComplete 784
step
#loop
.goto Durotar,58.99,58.30,0
.goto Durotar,57.65,58.52,30,0
.goto Durotar,57.36,56.59,30,0
.goto Durotar,58.10,55.52,30,0
.goto Durotar,58.54,53.68,30,0
.goto Durotar,56.54,54.52,30,0
.goto Durotar,56.37,58.35,30,0
.goto Durotar,58.99,58.30,30,0
>>击杀 |cRXP_ENEMY_库尔提拉斯水手|r 和 |cRXP_ENEMY_库尔提拉斯水兵|r, 搜刮 |cRXP_LOOT_帆布脚料|r
.mob +库尔提拉斯水手
.mob +库尔提拉斯水兵
.complete 791,1 --Canvas Scraps (8)
.mob +库尔提拉斯水手
.mob +库尔提拉斯水兵
.isOnQuest 791
.isQuestNotComplete 791
step
#optional
#loop
.goto Durotar,58.99,58.30,0
.goto Durotar,57.65,58.52,30,0
.goto Durotar,57.36,56.59,30,0
.goto Durotar,58.10,55.52,30,0
.goto Durotar,58.54,53.68,30,0
.goto Durotar,56.54,54.52,30,0
.goto Durotar,56.37,58.35,30,0
.goto Durotar,58.99,58.30,30,0
>>击杀|cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r
.complete 784,1 --Kul Tiras Sailor (10)
.mob +库尔提拉斯水手
.complete 784,2 --Kul Tiras Marine (8)
.mob +库尔提拉斯水兵
.isOnQuest 784
.isQuestNotComplete 784
step
#label ScrapsFinished
#loop
.goto Durotar,58.99,58.30,0
.goto Durotar,57.65,58.52,30,0
.goto Durotar,57.36,56.59,30,0
.goto Durotar,58.10,55.52,30,0
.goto Durotar,58.54,53.68,30,0
.goto Durotar,56.54,54.52,30,0
.goto Durotar,56.37,58.35,30,0
.goto Durotar,58.99,58.30,30,0
>>击杀 |cRXP_ENEMY_库尔提拉斯水手|r 和 |cRXP_ENEMY_库尔提拉斯水兵|r, 搜刮 |cRXP_LOOT_帆布脚料|r
.complete 791,1 --Canvas Scraps (8)
.mob 库尔提拉斯水手
.mob 库尔提拉斯水兵
.isOnQuest 791
.isQuestNotComplete 791
step
#completewith next
.goto Durotar,52.06,68.30,50 >> 前往森金村
.subzoneskip 367
step
.goto Durotar,52.06,68.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌克尔|r交谈
.target 乌克尔
.accept 2161 >>接任务：苦工的重担
.isQuestAvailable 2161
.xp <1,1
step
.goto Durotar,55.95,73.93
>>与维尔林·长牙交谈。
.target 维尔林·长牙
.accept 817 >>接任务：生活所需的虎皮
.isQuestAvailable 817
.xp <5,1
step
.goto Durotar,55.94,74.40
>>与沃纳尔大师交谈。
.target 沃纳尔大师
.accept 818 >>接任务：沃纳尔大师
.isQuestAvailable 818
.xp <5,1
step
.goto Durotar,55.94,74.72
>>与加德林大师交谈。
.target 加德林大师
.accept 808 >>接任务：明希纳的颅骨
.isQuestAvailable 808
.xp <4,1
step
.goto Durotar,55.94,74.72
>>与加德林大师交谈。
.target 加德林大师
.accept 826 >>接任务：扎拉赞恩
.isQuestAvailable 826
.xp <4,1
step
.goto Durotar,55.94,74.72
>>与加德林大师交谈。
.target 加德林大师
.accept 823 >>接任务：向奥戈尼尔报告
.isQuestAvailable 823
.xp <4,1
step
#optional
#label SenjinPickups
step
#completewith TaillasherEggs
>>击杀 |cRXP_ENEMY_小海浪蟹|r 和 |cRXP_ENEMY_海浪蟹|r，拾取 |cRXP_LOOT_蟹胶|r
>>击杀 |cRXP_ENEMY_厚壳龙虾人|r 和 |cRXP_ENEMY_巨钳龙虾人|r, 拾取它们的 |cRXP_LOOT_眼睛|r
.complete 818,2 --Crawler Mucus (8)
.mob +小海浪蟹
.mob +海浪蟹
.complete 818,1 --Intact Makrura Eye (4)
.mob +厚壳龙虾人
.mob +巨钳龙虾人
.isOnQuest 818
.isQuestNotComplete 818
step
#completewith next
>>击杀 |cRXP_ENEMY_老虎|r, 获取 |cRXP_LOOT_毛皮|r, 此任务无需立即完成
.complete 817,1 --Durotar Tiger Fur (4)
.mob 杜隆塔尔猛虎
.isOnQuest 817
.isQuestNotComplete 817
step
#loop
#label TaillasherEggs
.goto Durotar,59.49,83.77,0
.goto Durotar,60.28,80.02,60,0
.goto Durotar,60.28,82.74,60,0
.goto Durotar,59.62,84.76,60,0
.goto Durotar,60.02,87.94,60,0
.goto Durotar,59.06,90.71,60,0
.goto Durotar,61.50,91.55,60,0
.goto Durotar,61.88,95.43,60,0
.goto Durotar,62.69,97.21,60,0
.goto Durotar,63.00,94.40,60,0
.goto Durotar,59.85,89.56,60,0
.goto Durotar,59.49,83.77,60,0
>>拾取地上的 |cRXP_PICK_鞭尾龙的蛋|r
>>|cRXP_WARN_龙蛋通常由一只|r |cRXP_ENEMY_血爪鞭尾龙|r 看守
.complete 815,1 --Taillasher Egg (3)
.mob 血爪鞭尾龙
.isOnQuest 815
.isQuestNotComplete 815
step
#completewith MinshinasSkull
.goto Durotar,67.06,87.21,120 >>游往主岛
step
#completewith MinshinasSkull
>>击杀 |cRXP_ENEMY_小海浪蟹|r 和 |cRXP_ENEMY_海浪蟹|r，拾取 |cRXP_LOOT_蟹胶|r
>>击杀 |cRXP_ENEMY_厚壳龙虾人|r 和 |cRXP_ENEMY_巨钳龙虾人|r, 拾取它们的 |cRXP_LOOT_眼睛|r
.complete 818,2 --Crawler Mucus (8)
.mob +小海浪蟹
.mob +海浪蟹
.complete 818,1 --Intact Makrura Eye (4)
.mob +厚壳龙虾人
.mob +巨钳龙虾人
.isOnQuest 818
.isQuestNotComplete 818
step
#completewith MinshinasSkull
>>击杀 |cRXP_ENEMY_妖术巨魔|r 和 |cRXP_ENEMY_巫毒巨魔|r
>>|cRXP_WARN_小心!|r |cRXP_ENEMY_巫毒巨魔|r |cRXP_WARN_会施放|r |T136052:0|t[治疗波]
.complete 826,1 --Hexed Troll (8)
.mob +妖术巨魔
.complete 826,2 --Voodoo Troll (8)
.mob +巫毒巨魔
.isOnQuest 826
.isQuestNotComplete 826
step
#completewith next
>>击杀 |cRXP_ENEMY_扎拉赞恩|r, 获取 |cRXP_LOOT_头颅|r
>>|cRXP_WARN_留好|r |T136026:0|t[地震术] |cRXP_WARN_，用于打断他施放的|r |T136052:0|t[治疗波] << Shaman
>>|cRXP_WARN_留好|r |T132155:0|t[凿击] |cRXP_WARN_，用于打断他施放的|r |T136052:0|t[治疗波] << Rogue
>>|cRXP_WARN_小心，他会施放|r |T136052:0|t[治疗波]。|cRXP_WARN_必要时用|r |T134829:0|t[药水]|cRXP_WARN_。|r << !Shaman !Rogue
.complete 826,3 --Zalazane's Head (1)
.mob 扎拉赞恩
.isOnQuest 826
.isQuestNotComplete 826
step
#label MinshinasSkull
.goto Durotar,67.4,87.8
>>拾取地上的一个|cRXP_LOOT_头骨|r
.complete 808,1 --Minshina's Skull (1)
.isOnQuest 808
.isQuestNotComplete 808
step
.goto Durotar,67.4,87.8
>>击杀 |cRXP_ENEMY_扎拉赞恩|r, 获取 |cRXP_LOOT_头颅|r
>>|cRXP_WARN_留好|r |T136026:0|t[地震术]|cRXP_WARN_，用于打断他施放的|r |T136052:0|t[治疗波] << Shaman
>>|cRXP_WARN_留好|r |T132155:0|t[凿击]|cRXP_WARN_，用于打断他施放的|r |T136052:0|t[治疗波] << Rogue
>>|cRXP_WARN_小心，他会施放|r |T136052:0|t[治疗波]。|cRXP_WARN_必要时用|r |T134829:0|t[药水]|cRXP_WARN_。|r << !Shaman !Rogue
.complete 826,3 --Zalazane's Head (1)
.mob 扎拉赞恩
.isOnQuest 826
.isQuestNotComplete 826
step
#completewith next
>>击杀 |cRXP_ENEMY_老虎|r, 获取 |cRXP_LOOT_毛皮|r
.complete 817,1 --Durotar Tiger Fur (4)
.mob 杜隆塔尔猛虎
.isOnQuest 817
.isQuestNotComplete 817
step
#label Fur
#loop
.goto Durotar,67.23,88.76,0
.goto Durotar,67.23,88.76,40,0
.goto Durotar,66.52,87.74,40,0
.goto Durotar,65.94,86.72,40,0
.goto Durotar,65.90,84.04,40,0
.goto Durotar,65.88,82.85,40,0
.goto Durotar,67.38,82.61,40,0
.goto Durotar,68.42,82.43,40,0
.goto Durotar,68.50,84.32,40,0
.goto Durotar,68.47,86.77,40,0
.goto Durotar,67.23,88.00,40,0
>>击杀|cRXP_ENEMY_妖术巨魔|r和|cRXP_ENEMY_巫毒巨魔|r
.complete 826,1 --Hexed Troll (8)
.mob +妖术巨魔
.complete 826,2 --Voodoo Troll (8)
.mob +巫毒巨魔
.isOnQuest 826
.isQuestNotComplete 826
step
#completewith next
>>击杀 |cRXP_ENEMY_小海浪蟹|r 和 |cRXP_ENEMY_海浪蟹|r，拾取 |cRXP_LOOT_蟹胶|r
>>击杀 |cRXP_ENEMY_厚壳龙虾人|r 和 |cRXP_ENEMY_巨钳龙虾人|r, 拾取它们的 |cRXP_LOOT_眼睛|r
>>|cRXP_WARN_如果此时任务还差很多，前往南边的岛屿；那里有很多|r |cRXP_ENEMY_海浪蟹|r |cRXP_WARN_和|r |cRXP_ENEMY_龙虾人|r|cRXP_WARN_。|r
.complete 818,2 --Crawler Mucus (8)
.mob +小海浪蟹
.mob +海浪蟹
.complete 818,1 --Intact Makrura Eye (4)
.mob +厚壳龙虾人
.mob +巨钳龙虾人
.isOnQuest 818
.isQuestNotComplete 818
step
#loop
.goto Durotar,59.79,83.44,0
.goto Durotar,65.27,87.86,50,0
.goto Durotar,64.72,88.53,50,0
.goto Durotar,64.70,84.89,50,0
.goto Durotar,64.68,80.80,50,0
.goto Durotar,65.35,80.11,50,0
.goto Durotar,65.87,81.23,50,0
.goto Durotar,60.28,80.04,50,0
.goto Durotar,60.60,82.26,50,0
.goto Durotar,59.88,83.51,50,0
.goto Durotar,59.56,84.86,50,0
.goto Durotar,60.84,88.79,50,0
.goto Durotar,61.41,89.69,50,0
.goto Durotar,61.48,91.37,50,0
.goto Durotar,60.37,91.36,50,0
.goto Durotar,59.04,90.51,50,0
.goto Durotar,59.79,83.44,50,0
>>击杀 |cRXP_ENEMY_老虎|r, 获取 |cRXP_LOOT_毛皮|r
.complete 817,1 --Durotar Tiger Fur (4)
.mob 杜隆塔尔猛虎
.isOnQuest 817
.isQuestNotComplete 817
step
#loop
.goto Durotar,59.64,73.84,0
.goto Durotar,59.64,73.84,60,0
.goto Durotar,58.11,77.30,60,0
.goto Durotar,57.27,79.38,60,0
.goto Durotar,55.66,80.47,60,0
.goto Durotar,53.8,83.14,60,0
>>击杀 |cRXP_ENEMY_小海浪蟹|r 和 |cRXP_ENEMY_海浪蟹|r，拾取 |cRXP_LOOT_蟹胶|r
>>击杀 |cRXP_ENEMY_厚壳龙虾人|r 和 |cRXP_ENEMY_巨钳龙虾人|r, 拾取它们的 |cRXP_LOOT_眼睛|r
.complete 818,2 --Crawler Mucus (8)
.mob +小海浪蟹
.mob +海浪蟹
.complete 818,1 --Intact Makrura Eye (4)
.mob +厚壳龙虾人
.mob +巨钳龙虾人
.isOnQuest 818
.isQuestNotComplete 818
step
#completewith Zalazaneturnin
.goto Durotar,56.06,74.72,150 >> 前往森金村
.subzoneskip 367
step
#completewith next
.goto Durotar,56.48,73.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特莱耶克|r 交谈
>>|cRXP_WARN_你可以在小屋外与他对话|r
.vendor >> 出售杂物并修理装备
.target 特莱耶克
step
.goto Durotar,55.94,74.72
>>与加德林大师交谈。
.target 加德林大师
.turnin 808 >>交任务：明希纳的颅骨
.isQuestComplete 808
step << Shaman/!Shaman
.goto Durotar,55.94,74.72
>>与加德林大师交谈。
.target 加德林大师
.turnin 826,2 >>交任务：扎拉赞恩 << Shaman
.turnin 826 >>交任务：扎拉赞恩 << !Shaman
.isQuestComplete 826 << Shaman
.isQuestComplete 826 << !Shaman
step
.goto Durotar,55.94,74.40
>>与沃纳尔大师交谈。
.target 沃纳尔大师
.turnin 818 >>交任务：沃纳尔大师
.isQuestComplete 818
step
.goto Durotar,55.95,73.93
>>与维尔林·长牙交谈。
.target 维尔林·长牙
.turnin 817 >>交任务：生活所需的虎皮
.isQuestComplete 817
step
#optional
#label Zalazaneturnin
step
#completewith Stolensupplies
+|cRXP_WARN_把|r |T133728:0|t[微光颅骨]|cRXP_WARN_和|r |T134712:0|t[强力胶水]|cRXP_WARN_绑定到快捷键上，以备紧急情况使用|r
step
#loop
.goto Durotar,49.22,48.96,0
.goto Durotar,50.21,50.78,30,0
.goto Durotar,50.18,49.23,30,0
.goto Durotar,49.48,49.14,30,0
.goto Durotar,49.32,48.18,30,0
.goto Durotar,48.81,49.00,30,0
.goto Durotar,48.49,49.29,30,0
.goto Durotar,47.58,49.62,30,0
.goto Durotar,47.06,49.53,30,0
.goto Durotar,46.90,48.11,30,0
.goto Durotar,49.22,48.96,30,0
>>击杀|cRXP_ENEMY_钢鬃野猪人|r和|cRXP_ENEMY_钢鬃斥候|r
.complete 837,1 --Razormane Quilboar (4)
.mob +钢鬃野猪人
.complete 837,2 --Razormane Scout (4)
.mob +钢鬃斥候
.isOnQuest 837
.isQuestNotComplete 837
step
#label Encroachment
#loop
.goto Durotar,44.45,39.74,0
.goto Durotar,44.45,39.74,50,0
.goto Durotar,44.49,37.47,50,0
.goto Durotar,43.30,37.32,50,0
.goto Durotar,41.70,37.09,50,0
.goto Durotar,41.64,38.27,50,0
.goto Durotar,41.94,40.46,50,0
.goto Durotar,43.30,40.40,50,0
>>击杀|cRXP_ENEMY_钢鬃传令兵|r和|cRXP_ENEMY_钢鬃卫兵|r
.complete 837,3 --Razormane Dustrunner (4)
.mob +钢鬃传令兵
.complete 837,4 --Razormane Battleguard (4)
.mob +钢鬃卫兵
.isOnQuest 837
.isQuestNotComplete 837
step
.goto Durotar,51.12,42.46
>>与厨师托尔卡交谈。
.target 厨师托尔卡
.turnin 815 >>交任务：恐龙蛋大餐
.isQuestComplete 815
step
.goto Durotar,52.24,43.15
>>与奥戈尼尔·魂痕交谈。
.target 奥戈尼尔·魂痕
.turnin 823 >>交任务：向奥戈尼尔报告
.isQuestComplete 823
step
.group
.goto Durotar,52.25,43.18
>>与奥戈尼尔·魂痕交谈。
.target 奥戈尼尔·魂痕
.accept 806 >>接任务：黑暗风暴
.isQuestAvailable 806
.xp <4,1
.isQuestTurnedIn 823
step
.goto Durotar,51.95,43.50
>>与加索克交谈。
.target 加索克
.turnin 784 >>交任务：背信弃义的人类
.isQuestComplete 784
step
.goto Durotar,51.95,43.50
>>与加索克交谈。
.target 加索克
.turnin 837 >>交任务：野猪人的进犯
.isQuestComplete 837
step
.goto Durotar,51.95,43.50
>>与加索克交谈。
.target 加索克
.turnin 830 >>交任务：将军的命令
.isQuestComplete 830
step
.group
.goto Durotar,51.95,43.50
>>与加索克交谈。
.target 加索克
.accept 831 >>接任务：将军的命令
.isQuestAvailable 831
.xp <5,1
.isQuestTurnedIn 830
step
.goto Durotar,51.12,42.46
>>与厨师托尔卡交谈。
.target 厨师托尔卡
.turnin 815 >>交任务：恐龙蛋大餐
.isQuestComplete 815
step
.goto Durotar,52.24,43.15
>>与奥戈尼尔·魂痕交谈。
.target 奥戈尼尔·魂痕
.turnin 823 >>交任务：向奥戈尼尔报告
.isQuestComplete 823
step
.goto Durotar,51.95,43.50
>>与加索克交谈。
.target 加索克
.turnin 784 >>交任务：背信弃义的人类
.isQuestComplete 784
step
.goto Durotar,51.95,43.50
>>与加索克交谈。
.target 加索克
.turnin 837 >>交任务：野猪人的进犯
.isQuestComplete 837
step
.goto Durotar,51.95,43.50
>>与加索克交谈。
.target 加索克
.turnin 830 >>交任务：将军的命令
.isQuestComplete 830
step
.goto Durotar,51.95,43.50
>>与加索克交谈。
.target 加索克
.accept 831 >>接任务：将军的命令
.isQuestAvailable 831
.xp <5,1
.isQuestTurnedIn 830
step << Hunter
.goto Durotar,51.85,43.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索塔尔|r 交谈
.train 14281 >> 学习职业技能
.target 索塔尔
.xp <12,1
step
.goto Durotar,51.51,41.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|r |cRXP_FRIENDLY_旅店老板格罗斯克|r
.target 旅店老板格罗斯克
.turnin 2161 >>交任务：苦工的重担
.isQuestComplete 2161
step
.goto Durotar,54.39,42.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔克|r交谈
>>|cRXP_BUY_向他购买|r |T133634:0|t[棕色小包] |cRXP_BUY_，|r |cRXP_BUY_可买一个或多个|r
.collect 4496,1 --Small Brown Pouch (1)
.target 加尔克
.money <0.05
step << Warrior
.goto Durotar,54.18,42.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔绍尔·锯痕|r 交谈
.train 7384 >> 学习职业技能
.target 塔绍尔·锯痕
.xp <12,1
step << Shaman
.goto Durotar,54.42,42.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯瓦特|r 交谈
.train 1535 >> 学习职业技能
.target 斯瓦特
.xp <12,1
step
.goto Durotar,50.8,43.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林·寻路者|r交谈
.target 塔克林·寻路者
.xp <10,1
.accept 840 >>接任务：部落的新兵
.isQuestAvailable 840
step
#completewith next
.goto Durotar,50.22,43.06,12,0
.goto Durotar,50.09,42.97,8,0
.goto Durotar,50.20,42.30,12,0
.goto Durotar,49.96,40.96,12,0
.goto Durotar,49.67,40.42,10 >>朝塔楼方向走
step
#completewith next
.goto Durotar,49.75,40.38,6,0
.goto Durotar,49.77,40.24,6,0
.goto Durotar,49.69,40.21,6,0
.goto Durotar,49.68,40.30,6,0
.goto Durotar,49.78,40.34,6,0
.goto Durotar,49.79,39.96,6,0
.goto Durotar,49.60,40.04,8 >>沿塔楼向上前往弗恩·凝眉
step
.goto Durotar,49.89,40.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
.target 弗恩·凝眉
.turnin 791 >>交任务：新的背包
.isQuestComplete 791
step
.goto Durotar,43.11,30.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莎|r交谈
.target 米莎·托克伦
.accept 816 >>接任务：丢失的孩子
.isQuestAvailable 816
.xp <8,1
step
#completewith next
.goto Durotar,46.37,22.94,50 >> 前往雷兹拉克
step
.goto Durotar,46.37,22.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
.target 雷兹拉克
.accept 834 >>接任务：沙漠之风
.isQuestAvailable 834
.xp <7,1
step
#loop
.goto Durotar,49.70,21.90,0
.goto Durotar,49.70,21.90,40,0
.goto Durotar,49.70,24.33,40,0
.goto Durotar,50.13,25.70,40,0
.goto Durotar,50.85,25.96,40,0
.goto Durotar,51.65,27.67,40,0
.goto Durotar,49.85,27.07,40,0
.goto Durotar,50.68,31.55,40,0
.goto Durotar,48.10,34.36,40,0
.goto Durotar,47.35,33.40,40,0
.goto Durotar,48.49,32.01,40,0
.goto Durotar,47.19,30.87,40,0
>>拾取地上的|cRXP_PICK_被盗的补给袋|r
#label Stolensupplies
.complete 834,1 --Sack of Supplies (5)
.isOnQuest 834
.isQuestNotComplete 834
step
.goto Durotar,46.37,22.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
.target 雷兹拉克
.turnin 834 >>交任务：沙漠之风
.isQuestComplete 834
step
.goto Durotar,46.37,22.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
.target 雷兹拉克
.accept 835 >>接任务：保卫商路
.isQuestAvailable 835
.xp <7,1
.isQuestTurnedIn 834
step
#completewith next
.goto Durotar,53.41,27.81,15 >> 穿越洞穴
step
#loop
.goto Durotar,53.98,23.70,0
.goto Durotar,54.02,27.23,40,0
.goto Durotar,52.82,24.27,40,0
.goto Durotar,51.85,23.95,40,0
.goto Durotar,54.01,23.63,40,0
.goto Durotar,52.13,20.77,40,0
.goto Durotar,51.26,19.19,40,0
.goto Durotar,53.98,23.70,40,0
>>击杀|cRXP_ENEMY_尘风暴徒|r和|cRXP_ENEMY_尘风雷巫|r
>>|cRXP_WARN_这些怪物会逃跑，小心别一次拉两组|r
.complete 835,1 --Dustwind Savage (12)
.mob +尘风暴徒
.complete 835,2 --Dustwind Storm Witch (8)
.mob +尘风雷巫
.isOnQuest 835
.isQuestNotComplete 835
step << Tauren Hunter
#completewith next
+|cRXP_WARN_选择|r |T135493:0|t[桃木短弓]|cRXP_WARN_作为任务奖励并留着，之后在奥格瑞玛学习弓术|r
step
.goto Durotar,46.37,22.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
.target 雷兹拉克
.turnin 835 >>交任务：保卫商路
.isQuestComplete 835
step
.goto Durotar,41.54,18.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林纳格|r交谈
>>|cRXP_WARN_任务会开始45分钟倒计时，接下来的15分钟内不要暂离或登出游戏|r
.target 林纳格
.accept 812 >>接任务：救命如救火
.isQuestAvailable 812
.xp <7,1
step
#completewith next
.goto Durotar,41.66,25.68,20 >>跳入雷霆山脊 << !Hunter !Warlock
.cast 2641 >>|cRXP_WARN_施放|r |T136095:0|t[解散野兽]，|cRXP_WARN_然后跳入雷霆山脊|r << Hunter
+|cRXP_WARN_解散小鬼，然后跳入雷霆山脊|r << Warlock
.group
step
.goto Durotar,42.13,26.67
>>击杀|cRXP_ENEMY_费索·暗雷|r，拾取掉落的|cRXP_LOOT_费索的爪子|r
>>|cRXP_WARN_务必小心：先击杀巡逻的|r|cRXP_ENEMY_火刃狂热者|r|cRXP_WARN_和后方的|r|cRXP_ENEMY_闪电蜥蜴|r|cRXP_WARN_，再拉他|r
>>|cRXP_WARN_将他往后拉到|r|cRXP_ENEMY_闪电蜥蜴|r|cRXP_WARN_刚才所在的位置。否则可能会额外引到燃烧之刃成员|r
>>|cRXP_WARN_先击杀小鬼。使用|r |T132155:0|t[凿击] |cRXP_WARN_打断他施放的|r |T136169:0|t[灵魂虹吸] << Rogue
>>|cRXP_WARN_先击杀小鬼。使用|r |T136026:0|t[地震术] |cRXP_WARN_打断他施放的|r |T136169:0|t[灵魂虹吸] << Shaman
>>|cRXP_WARN_你可以施放|r |T136071:0|t[变形术] |cRXP_WARN_控制|r |cRXP_ENEMY_费索·暗雷|r |cRXP_WARN_，然后先击杀|r |cRXP_ENEMY_小鬼|r |cRXP_WARN_。|r << Mage
>>|cRXP_WARN_先击杀小鬼|r << Warrior/Warlock/Priest
>>|cRXP_WARN_若有，使用|r |T134829:0|t[初级治疗药水]；|cRXP_WARN_需要时使用|r |T133728:0|t[微光颅骨]|cRXP_WARN_。|r << !Warlock
>>|cRXP_WARN_若有，使用|r |T134829:0|t[初级治疗药水]、|T133728:0|t[初级治疗石]；|cRXP_WARN_需要时使用|r |T133728:0|t[微光颅骨]|cRXP_WARN_。|r << Warlock
.complete 806,1 --Fizzle's Claw (1)
.mob 费索·暗雷
.mob 小鬼爪牙
.mob 火刃狂热者
.mob 闪电蜥蜴
.group 2
--VV Add video / description for Druid / tell priest/lock to fear if pulled back and area is clear?
.isOnQuest 806
.isQuestNotComplete 806
step << Druid
#completewith next
.cast 18960 >>施放 |T135758:0|t[传送：月光林地]
.xp <12,1
.isQuestComplete 806
.zoneskip Moonglade
.group
#optional
.train 18960,3
.bindlocation 362,1
.cooldown item,6948,>0,1
>>传送已经学会且本次需要使用时再施放；没有该法术时留在当前路线，稍后补做这次训练。
step << Druid
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
.train 8936 >> 学习职业技能
.target 洛甘纳尔
.xp <12,1
.isQuestComplete 806
.group
.zoneskip Moonglade,1
step
#completewith next
.hs >> 使用炉石返回剃刀岭
.isQuestComplete 806
.use 6948
.group
.bindlocation 362,1
.cooldown item,6948,>0,1
>>只有绑定地点与目的地一致且冷却完毕时使用炉石；否则按后面的道路或航线说明返回。
step << Shaman
#completewith next
.hs >> 使用炉石返回剃刀岭
.use 6948
.solo
.bindlocation 362,1
.cooldown item,6948,>0,1
>>只有绑定地点与目的地一致且冷却完毕时使用炉石；否则按后面的道路或航线说明返回。
step
.goto Durotar,51.51,41.64
>>前往剃刀岭旅店，若仍在飞行或传送中，请等到落地；炉石不可用时从当前区域沿道路返回；若在月光林地，先乘布瑟恩的航线到雷霆崖，再飞奥格瑞玛，步行回剃刀岭。
+确认已抵达剃刀岭旅店并已落地
step
.goto Durotar,51.51,41.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板格罗斯克|r
.vendor >> 出售杂物
>>|cRXP_BUY_向他购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r << Shaman/Druid
>>|cRXP_BUY_购买|r |T133974:0|t[肉排] |cRXP_BUY_，向他购买即可|r << Warrior
.collect 1179,20 << Mage/Warlock/Priest/Shaman/Druid --Ice Cold Milk (20)
.collect 2287,20 << Rogue/Warrior --Haunch of Meat (20)
.target 旅店老板格罗斯克
.group
#optional
>>仅在资金允许时补足上述食物或饮水数量；资金不足时跳过或稍后补购。
step
.goto Durotar,52.24,43.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥戈尼尔·魂痕|r交谈
.target 奥戈尼尔·魂痕
.turnin 806 >>交任务：黑暗风暴
.isQuestComplete 806
step
.goto Durotar,52.24,43.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥戈尼尔·魂痕|r交谈
.target 奥戈尼尔·魂痕
.group
.accept 828 >>接任务：玛高兹
.isQuestAvailable 828
.xp <4,1
.isQuestTurnedIn 806
step
.goto Durotar,52.24,43.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥戈尼尔·魂痕|r交谈
.target 奥戈尼尔·魂痕
.group
.accept 828 >>接任务：玛高兹
.isQuestAvailable 828
.xp <4,1
.isQuestTurnedIn 806
step
.goto Durotar,51.95,43.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加索克|r交谈
.target 加索克
.turnin 837 >>交任务：野猪人的进犯
.isQuestComplete 837
step << Hunter
.goto Durotar,51.85,43.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索塔尔|r 交谈
.train 14281 >> 学习职业技能
.target 索塔尔
.xp <12,1
.group
step << Warrior
.goto Durotar,54.18,42.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔绍尔·锯痕|r 交谈
.train 7384 >> 学习职业技能
.target 塔绍尔·锯痕
.xp <12,1
.group
step << Shaman
.goto Durotar,54.42,42.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯瓦特|r 交谈
.train 1535 >> 学习职业技能
.target 斯瓦特
.xp <12,1
step
#completewith next
.goto Durotar,55.40,36.73,80,0
.goto Durotar,56.07,30.05,80,0
.goto Durotar,56.41,20.04,50 >> 前往玛高兹
.isQuestTurnedIn 806
.group
step
.goto Durotar,56.41,20.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛高兹|r交谈
.target 玛高兹
.turnin 828 >>交任务：玛高兹
.isQuestComplete 828
step
.goto Durotar,56.41,20.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛高兹|r交谈
.target 玛高兹
.group
.accept 827 >>接任务：骷髅石
.isQuestAvailable 827
.xp <4,1
.isQuestTurnedIn 828
step
#optional
#label MargozTurnIn
step << Shaman
#completewith Collars1
.goto Durotar,53.18,29.15,50 >> 前往尘风洞
.solo
step
#completewith next
.goto Durotar,56.49,25.04,50,0
.goto Durotar,56.11,27.94,50,0
.goto Durotar,53.18,29.15,50 >> 前往尘风洞
.isQuestTurnedIn 806
.group
step << Shaman
#loop
.goto Durotar,51.90,25.70,0
.goto Durotar,53.18,29.15,20,0
.goto Durotar,52.70,27.97,12,0
.goto Durotar,53.05,27.87,12,0
.goto Durotar,53.14,27.24,12,0
.goto Durotar,52.84,26.80,12,0
.goto Durotar,52.07,26.85,12,0
.goto Durotar,51.90,25.70,12,0
>>击杀|cRXP_ENEMY_火刃暴徒|r和|cRXP_ENEMY_火刃新兵|r，拾取掉落的|cRXP_LOOT_项圈|r
>>击杀|cRXP_ENEMY_火刃祭司|r，拾取掉落的|cRXP_LOOT_试剂袋|r
.complete 827,1 --Searing Collar (6)
.mob +火刃暴徒
.mob +火刃新兵
.mob +火刃祭司
.isQuestTurnedIn 806
.group
.isOnQuest 827
.isQuestNotComplete 827
step << Shaman
#loop
.goto Durotar,51.90,25.70,0
.goto Durotar,53.18,29.15,20,0
.goto Durotar,52.70,27.97,12,0
.goto Durotar,53.05,27.87,12,0
.goto Durotar,53.14,27.24,12,0
.goto Durotar,52.84,26.80,12,0
.goto Durotar,52.07,26.85,12,0
.goto Durotar,51.90,25.70,12,0
>>击杀|cRXP_ENEMY_火刃暴徒|r和|cRXP_ENEMY_火刃新兵|r，拾取掉落的|cRXP_LOOT_项圈|r
>>击杀|cRXP_ENEMY_火刃祭司|r，拾取掉落的|cRXP_LOOT_试剂袋|r
.mob +火刃暴徒
.mob +火刃新兵
.complete 1525,2 --Reagent Pouch (1)
.mob +火刃祭司
.isQuestTurnedIn 806
.group
.isOnQuest 1525
.isQuestNotComplete 1525
step << !Shaman
#loop
.goto Durotar,51.90,25.70,0
.goto Durotar,53.18,29.15,20,0
.goto Durotar,52.70,27.97,12,0
.goto Durotar,53.05,27.87,12,0
.goto Durotar,53.14,27.24,12,0
.goto Durotar,52.84,26.80,12,0
.goto Durotar,52.07,26.85,12,0
.goto Durotar,51.90,25.70,12,0
>>击杀|cRXP_ENEMY_火刃暴徒|r、|cRXP_ENEMY_火刃新兵|r和|cRXP_ENEMY_火刃祭司|r，拾取掉落的|cRXP_LOOT_项圈|r
.complete 827,1 --Searing Collar (6)
.mob 火刃暴徒
.mob 火刃新兵
.mob 火刃祭司
.isQuestTurnedIn 806
.group
.isOnQuest 827
.isQuestNotComplete 827
step << Shaman
#loop
.goto Durotar,51.90,25.70,0
.goto Durotar,53.18,29.15,20,0
.goto Durotar,52.70,27.97,12,0
.goto Durotar,53.05,27.87,12,0
.goto Durotar,53.14,27.24,12,0
.goto Durotar,52.84,26.80,12,0
.goto Durotar,52.07,26.85,12,0
.goto Durotar,51.90,25.70,12,0
>>击杀|cRXP_ENEMY_火刃祭司|r，拾取掉落的|cRXP_LOOT_试剂袋|r
.complete 1525,2 --Reagent Pouch (1)
.mob 火刃祭司
.solo
.isOnQuest 1525
.isQuestNotComplete 1525
step
#optional
#label Collars1
step << skip --logout skip Shaman
.goto Durotar,53.03,26.82
.goto Durotar,47.31,17.89,30 >>|cRXP_WARN_跳上岩石，调整角色位置直到看起来像在漂浮，然后登出并重新登入以执行登出跳点|r
.link https://www.youtube.com/watch?v=9A6LHcLZeTU&ab >> |cRXP_WARN_点击这里查看示例|r
.solo
step
#completewith next
.goto Durotar,56.30,27.91,80,0
.goto Durotar,56.41,20.04,50 >> 前往玛高兹
.isQuestTurnedIn 806
.group
step
.goto Durotar,56.41,20.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛高兹|r交谈
.target 玛高兹
.turnin 827 >>交任务：骷髅石
.isQuestComplete 827
step
.goto Durotar,56.41,20.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛高兹|r交谈
.target 玛高兹
.group
.accept 829 >>接任务：尼尔鲁·火刃
.isQuestAvailable 829
.xp <4,1
.isQuestTurnedIn 827
step
#completewith Admiralorders1
.goto Orgrimmar,48.97,92.84,50 >> 进入奥格瑞玛
.zoneskip Orgrimmar
step
.goto Orgrimmar,45.13,63.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 交谈
.fp Orgrimmar >> 获取奥格瑞玛飞行点
.target 多拉斯
.isQuestAvailable 809
step
.goto Orgrimmar,32.29,35.81 << !tbc
    .goto Orgrimmar,34.40,36.60 << tbc
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹格雷尔|r交谈 << !tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃金|r交谈 << tbc
.target 纳兹格雷尔 << !tbc
    .target 沃金 << tbc
.turnin 831 >>交任务：将军的命令
.isQuestComplete 831
step
#optional
#label Admiralorders1
step << Shaman
#label Shaman12training
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 交谈
.train 547 >> 学习职业技能
.target 卡德里斯
.xp <12,1
step
.goto Orgrimmar,47.24,53.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_考格汉|r交谈
.target 考格汉
.accept 813 >>接任务：寻找解毒剂
.isOnQuest 812
.isQuestAvailable 813
.xp <7,1
step
#completewith FindingAntitode
>>|cRXP_WARN_放弃“救命如救火”任务可移除计时器，但之后仍可完成该任务。|r
.abandon 812 >>放弃任务：救命如救火
.isOnQuest 812
step
.goto Orgrimmar,49.49,50.56
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
.target 尼尔鲁·火刃
.turnin 829 >>交任务：尼尔鲁·火刃
.isQuestComplete 829
step
.goto Orgrimmar,49.49,50.56
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
.target 尼尔鲁·火刃
.group
.accept 809 >>接任务：雅克塞罗斯
.isQuestAvailable 809
.xp <4,1
.isQuestTurnedIn 829
step
#optional
#label NeeruFireblade
step << Hunter
#completewith HunterTraining
.goto Orgrimmar,68.02,38.69,30 >> 前往荣誉谷
step << Hunter
.goto Orgrimmar,66.34,14.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖祖|r交谈
.train 24556 >>学习宠物技能
.target 肖祖
.xp <12,1
step << Hunter
.goto Orgrimmar,66.06,18.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥玛克|r 交谈
.train 14281 >> 学习职业技能
.target 奥玛克
.xp <12,1
step << Hunter
.goto Orgrimmar,81.52,19.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
.train 264 >>学习弓术
.target 哈纳什
step << Hunter
.goto Orgrimmar,81.17,18.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_森度吉安|r|cRXP_BUY_交谈。从他那里购买一把|r |T135499:0|t[多层弯弓]|cRXP_BUY_。|r
.collect 2507,1
.money <0.1751
.itemStat 18,QUALITY,<7
#optional
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.5 << tbc
step << Hunter
#label HunterTraining
.goto Orgrimmar,81.17,18.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_森度吉安|r交谈
.collect 2515,1600 << Hunter --Sharp Arrow (1600)
.collect 5439,1 << Hunter --Small Quiver (1)
.target 森度吉安
#optional
>>按需补足上述弹药数量，并确认已装备与当前枪械或弓匹配的弹丸或箭矢；库存足够时可跳过。
>>向森度吉安购买锋利的箭和箭袋，并装备与弓配套的箭矢。
step << Hunter
#optional
#completewith FindingAntitode
.use 2507
.itemcount 2507,1
.itemStat 18,QUALITY,<7
.xp <11,1
.equip 18,2507 >>装备多层弯弓；已有同等或更强的远程武器时跳过。
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.5 << tbc
step << Tauren Warrior
.goto Orgrimmar,47.54,68.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_乌萨罗|r|cRXP_BUY_交谈。向他购买|r |T133477:0|t[巨棒]|cRXP_BUY_。|r
.collect 1197,1 --Collect Giant Mace (1)
.money <0.2666
.target 乌萨罗
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Tauren Warrior
#optional
#completewith FindingAntitode
.equip 16,1197 >>|cRXP_WARN_装备|r |T133477:0|t[巨棒]
.use 1197
.itemcount 1197,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Shaman/Druid
.goto Orgrimmar,47.54,68.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_乌萨罗|r|cRXP_BUY_交谈。向他购买|r |T135154:0|t[短杖]|cRXP_BUY_。|r
.collect 854,1 --Collect Quarter Staff (1)
.money <0.3022
.target 乌萨罗
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.4
step << Shaman/Druid
#optional
#completewith FindingAntitode
.equip 16,854 >>|cRXP_WARN_装备|r |T135154:0|t[短杖]
.use 854
.itemcount 854,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.4
.xp <11,1
step
#label LeaveOrg2
#completewith Conscript
.zone Durotar >> 离开奥格瑞玛
.zoneskip Durotar
step
#label FindingAntitode
#loop
.goto Durotar,38.89,16.91,0
.goto Durotar,42.47,19.99,50,0
.goto Durotar,41.07,19.85,50,0
.goto Durotar,40.21,17.21,50,0
.goto Durotar,38.89,16.91,50,0
.goto Durotar,38.13,19.90,50,0
.goto Durotar,38.67,22.13,50,0
.goto Durotar,36.91,25.63,50,0
.goto Durotar,36.64,28.18,50,0
.goto Durotar,36.40,30.95,50,0
>>击杀 |cRXP_ENEMY_毒尾蝎|r, 搜刮 |cRXP_LOOT_毒囊|r
.complete 813,1 --Venomtail Poison Sac (4)
.mob 毒尾蝎
.isOnQuest 813
.isQuestNotComplete 813
step << !Shaman
.goto Durotar,34.80,32.84,50,0
.goto Durotar,34.81,37.02,50,0
.goto Durotar,34.44,44.53,50,0
.goto Durotar,34.27,47.02,50,0
.goto Durotar,34.71,42.30
>>沿河向南前往前沿哨所
>>击杀途中遇到的 |cRXP_ENEMY_巨齿鳄鱼|r，拾取 |cRXP_LOOT_克鲁恩的护身符|r
>>|cRXP_WARN_如果始终没有掉落，就跳过并放弃此任务。|r
.complete 816,1 --Kron's Amulet (1)
.mob 巨齿鳄鱼
.isOnQuest 816
.isQuestNotComplete 816
step << Shaman
#completewith CallofFire3
.goto Durotar,34.80,32.84,50,0
.goto Durotar,34.81,37.02,50,0
.goto Durotar,34.44,44.53,50,0
.goto Durotar,34.27,47.02,50,0
.goto Durotar,34.51,51.48,50,0
.goto Durotar,35.16,56.43,50,0
>>沿河向南前进，途中击杀 |cRXP_ENEMY_巨齿鳄鱼|r，拾取 |cRXP_LOOT_克鲁恩的护身符|r
.complete 816,1 --Kron's Amulet (1)
.mob 巨齿鳄鱼
.isOnQuest 816
.isQuestNotComplete 816
step << Shaman
#completewith next
.goto Durotar,36.74,57.78,10,0
.goto Durotar,36.63,58.15,8,0
.goto Durotar,36.63,58.15,8,0
.goto Durotar,36.77,58.98,8,0
.goto Durotar,36.85,58.32,8,0
.goto Durotar,37.24,58.13,8,0
.goto Durotar,37.86,58.18,8,0
.goto Durotar,38.05,57.79,8,0
.goto Durotar,38.93,57.54,8,0
.goto Durotar,39.19,57.90,8,0
.goto Durotar,39.16,58.56,10 >> 沿山路向上前往 |cRXP_FRIENDLY_泰尔夫·祖拉姆|r
>>|cRXP_WARN_小心别从山上掉下去；山路非常狭窄，掉下去可能会死|r
step << Shaman
.goto Durotar,38.52,58.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰尔夫·祖拉姆|r交谈
.target 泰尔夫·祖拉姆
.turnin 1525 >>交任务：火焰的召唤
.isQuestComplete 1525
step << Shaman
.goto Durotar,38.52,58.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰尔夫·祖拉姆|r交谈
.target 泰尔夫·祖拉姆
.accept 1526 >>接任务：火焰的召唤
.isQuestAvailable 1526
.xp <10,1
.isQuestTurnedIn 1525
step << Shaman
#optional
#label CallofFire3
step << Shaman
#completewith next
.goto Durotar,38.18,58.58
.cast 8898 >>|cRXP_WARN_使用|r |T134732:0|t[火焰灵契]
.use 6636
.isOnQuest 1526
.isQuestNotComplete 1526
.itemcount 6636,1
step << Shaman
.goto Durotar,38.96,58.22
>>击杀 |cRXP_ENEMY_火焰之魂|r, 搜刮 |cRXP_LOOT_余烬|r
.complete 1526,1 --Glowing Ember (1)
.mob 火焰之魂
.isOnQuest 1526
.isQuestNotComplete 1526
step << Shaman
.goto Durotar,38.96,58.22
>>点击地上的|cRXP_PICK_火盆|r
.turnin 1526 >>交任务：火焰的召唤
.isQuestComplete 1526
step << Shaman
.goto Durotar,38.96,58.22
>>点击地上的|cRXP_PICK_火盆|r
.accept 1527 >>接任务：火焰的召唤
.isQuestAvailable 1527
.xp <10,1
.isQuestTurnedIn 1526
step << Shaman
#completewith next
.goto Durotar,39.13,58.63,10,0
.goto Durotar,39.17,57.93,10,0
.goto Durotar,38.95,57.58,8,0
.goto Durotar,38.61,57.67,8,0
.goto Durotar,38.06,57.78,8,0
.goto Durotar,37.76,58.19,8,0
.goto Durotar,36.96,58.07,15 >> 沿山路下山
>>|cRXP_WARN_小心别从山上掉下去；山路非常狭窄，掉下去可能会死|r
step << Shaman
.goto Durotar,34.92,54.87,50,0
.goto Durotar,34.58,51.64,50,0
.goto Durotar,34.33,48.97,50,0
.goto Durotar,34.31,44.24
>>击杀 |cRXP_ENEMY_巨齿鳄鱼|r，拾取 |cRXP_LOOT_克鲁恩的护身符|r
>>|cRXP_WARN_如果始终没有掉落，就跳过并放弃此任务。|r
.complete 816,1 --Kron's Amulet (1)
.mob 巨齿鳄鱼
.isOnQuest 816
.isQuestNotComplete 816
step
.goto Durotar,43.11,30.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莎·托克伦|r交谈
.target 米莎·托克伦
.turnin 816 >>交任务：丢失的孩子
.isQuestComplete 816
step
#label FarWatchPost
.goto The Barrens,62.26,19.38,40 >> 前往前沿哨所
.zoneskip The Barrens
step
.goto The Barrens,62.27,19.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加尔·战痕|r交谈
.target 卡加尔·战痕
.turnin 840 >>交任务：部落的新兵
.isQuestComplete 840
step
.goto The Barrens,62.27,19.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加尔·战痕|r交谈
.target 卡加尔·战痕
.accept 842 >>接任务：十字路口征兵
.isQuestAvailable 842
.xp <10,1
.isQuestTurnedIn 840
step
#optional
#label Conscript
step
.goto The Barrens,62.34,20.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅克塞罗斯|r交谈
.target 雅克塞罗斯
.turnin 809 >>交任务：雅克塞罗斯
.isQuestComplete 809
step
.goto The Barrens,62.34,20.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅克塞罗斯|r交谈
.target 雅克塞罗斯
.group
.accept 924 >>接任务：恶魔之种
.isQuestAvailable 924
.xp <4,1
.isQuestTurnedIn 809
step
#optional
#label Akzeloth
step
.goto The Barrens,62.34,20.03
.accept 926 >>接取并立即交付有瑕疵的能量石
.turnin 926 >>交任务：有瑕疵的能量石
>>|cRXP_WARN_拾取|r |T134095:0|t[有瑕疵的能量石]|cRXP_WARN_（在|r|cRXP_FRIENDLY_雅克塞罗斯|r旁边）
>>|cRXP_WARN_该物品有30分钟时限，请抓紧完成后续步骤。|r
.isOnQuest 924
.group
.isQuestNotComplete 924
.itemcount 4986,<1
.xp <4,1
step << Shaman
.goto The Barrens,55.86,19.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳尔·菲斯|r交谈
.target 卡纳尔·菲斯
.turnin 1527 >>交任务：火焰的召唤
.isQuestComplete 1527
step << Shaman
.goto The Barrens,55.78,20.00
.use 4926 >> 从地上拾取 |cRXP_PICK_老陈的空酒桶|r 并开始任务。如果该物品尚未刷新，稍后再回来获取。
.collect 4926,1,819 --Collect Chen's Empty Keg
#optional
.accept 819 >> 接任务：老陈的空酒桶
.isNotOnQuest 819
.isQuestAvailable 819
.xp <11,1
step
#completewith DemonSeed
>>击杀 |cRXP_ENEMY_平原陆行鸟|r，拾取 |cRXP_LOOT_陆行鸟的喙|r
.complete 844,1 --Plainstrider Beak (7)
.mob 巨型平原陆行鸟
.mob 敏捷的平原陆行鸟
.isOnQuest 844
.isQuestNotComplete 844
step
.goto The Barrens,51.09,22.68,40,0
.goto The Barrens,50.33,21.85,40,0
.goto The Barrens,49.21,20.42,40,0
.goto The Barrens,47.58,19.38,100 >> 前往山顶
.isOnQuest 924
step
#completewith next
+|cRXP_WARN_若|r |cRXP_ENEMY_拉索利安|r |cRXP_WARN_出现，请小心；他是15级稀有怪。必要时准备使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_和|r |T134712:0|t[强力胶水] |cRXP_WARN_。|r
.unitscan 拉索利安
step
#label DemonSeed
.goto The Barrens,47.98,19.08
>>右键点击|cRXP_PICK_祭坛|r
>>|cRXP_WARN_确保身上带有|r |T134095:0|t[有瑕疵的能量石] |cRXP_WARN_（持续30分钟）|r
.collect 4986,1,924 --Collect Flawed Power Stone
.complete 924,1 --Destroy the Demon Seed (1)
.isOnQuest 924
>>若能量石已因计时到期消失，先回前沿哨所雅克塞罗斯旁重新拾取，再返回祭坛。
.isQuestNotComplete 924
step
#completewith DisruptTheAttacks
.goto The Barrens,47.58,19.38,40,0
.goto The Barrens,49.21,20.42,40,0
.goto The Barrens,50.33,21.85,40,0
.goto The Barrens,51.09,22.68,40 >> 从原路下山
.isOnQuest 924
step
#completewith DisruptTheAttacks
>>击杀 |cRXP_ENEMY_平原陆行鸟|r，拾取 |cRXP_LOOT_陆行鸟的喙|r
.complete 844,1 --Plainstrider Beak (7)
.mob 巨型平原陆行鸟
.mob 敏捷的平原陆行鸟
.isOnQuest 844
.isQuestNotComplete 844
step
#completewith next
>>击杀|cRXP_ENEMY_钢鬃寻水者|r、|cRXP_ENEMY_钢鬃织棘者|r和|cRXP_ENEMY_钢鬃猎手|r
.complete 871,1 --Razormane Water Seeker (8)
.mob +钢鬃寻水者
.complete 871,2 --Razormane Thornweaver (8)
.mob +钢鬃织棘者
.complete 871,3 --Razormane Hunter (3)
.mob +钢鬃猎手
.isOnQuest 871
.isQuestNotComplete 871
step
.goto The Barrens,55.70,27.30
.use 4926 >> 从地上拾取 |cRXP_PICK_老陈的空酒桶|r 并开始任务
>>|cRXP_WARN_如果尚未刷新，稍后再回来获取|r
.collect 4926,1,819 --Collect Chen's Empty Keg
#optional
.accept 819 >> 接任务：老陈的空酒桶
.isNotOnQuest 819
.isQuestAvailable 819
.xp <11,1
step
#label DisruptTheAttacks
#loop
.goto The Barrens,53.63,24.50,0
.goto The Barrens,53.63,24.50,50,0
.goto The Barrens,54.26,24.64,50,0
.goto The Barrens,54.81,25.19,50,0
.goto The Barrens,55.50,25.61,50,0
.goto The Barrens,55.86,26.30,50,0
.goto The Barrens,55.83,27.15,50,0
.goto The Barrens,55.41,27.41,50,0
.goto The Barrens,54.50,26.97,50,0
.goto The Barrens,54.05,26.11,50,0
.goto The Barrens,53.51,25.24,50,0
>>击杀|cRXP_ENEMY_钢鬃寻水者|r、|cRXP_ENEMY_钢鬃织棘者|r和|cRXP_ENEMY_钢鬃猎手|r
.complete 871,1 --Razormane Water Seeker (8)
.mob +钢鬃寻水者
.complete 871,2 --Razormane Thornweaver (8)
.mob +钢鬃织棘者
.complete 871,3 --Razormane Hunter (3)
.mob +钢鬃猎手
.isOnQuest 871
.isQuestNotComplete 871
step
#loop
.goto The Barrens,53.71,29.19,0
.goto The Barrens,53.36,26.28,80,0
.goto The Barrens,53.23,28.41,80,0
.goto The Barrens,53.57,29.58,80,0
.goto The Barrens,52.91,32.90,80,0
.goto The Barrens,51.31,32.91,80,0
.goto The Barrens,50.50,31.05,80,0
.goto The Barrens,50.05,29.77,80,0
.goto The Barrens,50.93,27.72,80,0
.goto The Barrens,52.83,27.91,80,0
.goto The Barrens,53.71,29.19,80,0
>>击杀 |cRXP_ENEMY_平原陆行鸟|r，拾取 |cRXP_LOOT_陆行鸟的喙|r
.complete 844,1 --Plainstrider Beak (7)
.mob 巨型平原陆行鸟
.mob 敏捷的平原陆行鸟
.isOnQuest 844
.isQuestNotComplete 844
step << Tauren
.goto The Barrens,52.24,31.00
>>与瑟格拉·黑棘交谈。
.target 瑟格拉·黑棘
.turnin 844 >>交任务：平原陆行鸟的威胁
.isQuestComplete 844
step << Tauren
.goto The Barrens,52.24,31.00
>>与瑟格拉·黑棘交谈。
.target 瑟格拉·黑棘
.turnin 842 >>交任务：十字路口征兵
.isQuestComplete 842
step << Tauren
.goto The Barrens,52.24,31.00
>>与瑟格拉·黑棘交谈。
.target 瑟格拉·黑棘
.accept 845 >>接任务：斑马的威胁
.isQuestAvailable 845
.xp <10,1
.isQuestTurnedIn 844
step << Tauren
.goto The Barrens,51.50,30.87
>>与索克交谈。
.target 索克
.turnin 871 >>交任务：野猪人的袭击
.isQuestComplete 871
step << Tauren
.goto The Barrens,51.50,30.87
>>与索克交谈。
.target 索克
.accept 872 >>接任务：野猪人的头目
.isQuestAvailable 872
.xp <9,1
.isQuestTurnedIn 871
step
.goto The Barrens,51.99,29.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板伯兰德·草风|r交谈
.home >>将炉石绑定在十字路口
.target 旅店老板伯兰德·草风
.bindlocation 380
step << Druid
#completewith next
.cast 18960 >>施放 |T135758:0|t[传送：月光林地]
.xp <12,1
.zoneskip Moonglade
.solo
#optional
.train 18960,3
.bindlocation 380,1
.cooldown item,6948,>0,1
>>传送已经学会且本次需要使用时再施放；没有该法术时留在当前路线，稍后补做这次训练。
step << Druid
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
.train 8936 >> 学习职业技能
.target 洛甘纳尔
.xp <12,1
.solo
.zoneskip Moonglade,1
step << Druid
#completewith FlytoOrg
.hs >> 使用炉石回到十字路口
.xp <12,1
.use 6948
.solo
.zoneskip The Barrens
.bindlocation 380,1
.cooldown item,6948,>0,1
>>只有绑定地点与目的地一致且冷却完毕时使用炉石；否则按后面的道路或航线说明返回。
step
.goto The Barrens,51.50,30.34
>>前往十字路口飞行管理员处，若仍在飞行或传送中，请等到落地；炉石不可用时沿道路返回；若在月光林地，先乘德鲁伊航线到雷霆崖，再飞十字路口。
+确认已抵达十字路口飞行管理员处并已落地
step << Hunter
.goto The Barrens,51.67,29.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_巴尔格|r交谈
.collect 2515,1200 << Hunter --Sharp Arrow (1200)
.target 巴尔格
#optional
>>按需补足上述弹药数量，并确认已装备与当前枪械或弓匹配的弹丸或箭矢；库存足够时可跳过。
step << Shaman/Warrior
#completewith next
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.fly Thunder Bluff >>飞往雷霆崖
#optional
.zoneskip The Barrens,1
step << Shaman/Warrior
.goto Thunder Bluff,47.00,49.82
>>前往雷霆崖飞行平台，若仍在飞行或传送中，请等到落地；没有可用航线时，沿道路经莫高雷到雷霆崖，乘升降梯入城。
+确认已抵达雷霆崖飞行平台并已落地
step << Shaman/Warrior
.goto Thunder Bluff,45.6,55.9
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安哈努|r交谈
.target 安哈努
.turnin 6362 >>交任务：飞往雷霆崖
.isQuestComplete 6362
step << Shaman/Warrior
.goto Thunder Bluff,45.6,55.9
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安哈努|r交谈
.target 安哈努
.accept 6363 >>接任务：双足飞龙管理员塔尔
.isQuestAvailable 6363
.xp <10,1
.isQuestTurnedIn 6362
step << Shaman/Warrior
.goto Thunder Bluff,60.0,51.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·血蹄|r交谈
.target 凯恩·血蹄
.turnin 775 >>交任务：雷霆崖之旅
.isQuestComplete 775
step << Shaman/Warrior
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
.target 塔尔
.turnin 6363 >>交任务：双足飞龙管理员塔尔
.isQuestComplete 6363
step << Shaman/Warrior
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
.target 塔尔
.accept 6364 >>接任务：向加翰回复
.isQuestAvailable 6364
.xp <10,1
.isQuestTurnedIn 6363
step << Shaman/Warrior
#completewith next
.hs >> 使用炉石回到十字路口
.use 6948
.subzoneskip 380
.bindlocation 380,1
.cooldown item,6948,>0,1
>>只有绑定地点与目的地一致且冷却完毕时使用炉石；否则按后面的道路或航线说明返回。
step << Shaman/Warrior
#completewith ReturntoJahan2
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
.fly Crossroads >>飞往十字路口
.target 塔尔
#optional
.zoneskip Thunder Bluff,1
step << Shaman/Warrior
.goto The Barrens,51.21,29.05
>>前往十字路口，若仍在飞行或传送中，请等到落地；炉石不可用或绑定不符时，乘航线；没有航线则从雷霆崖经莫高雷沿道路返回十字路口。
+确认已抵达十字路口并已落地
step << Shaman/Warrior
.goto The Barrens,51.21,29.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加翰·鹰翼|r交谈
.target 加翰·鹰翼
.turnin 6364 >>交任务：向加翰回复
.isQuestComplete 6364
step << Shaman/Warrior
#optional
#label ReturntoJahan2
step
#label FlytoOrg
#completewith next
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 交谈
.fly Orgrimmar >> 飞往奥格瑞玛
.target 迪弗拉克
#optional
.zoneskip The Barrens,1
step
.goto Orgrimmar,45.13,63.90
>>前往奥格瑞玛飞行平台，若仍在飞行或传送中，请等到落地；未能乘坐航线时，沿贫瘠之地道路经前沿哨所、杜隆塔尔入城，再走到飞行平台。
+确认已抵达奥格瑞玛飞行平台并已落地
step << Shaman
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 交谈
.train 8045 >> 学习职业技能
.target 卡德里斯
.xp <14,1
step
.goto Orgrimmar,47.24,53.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_考格汉|r交谈
.target 考格汉
.turnin 813 >>交任务：寻找解毒剂
.isQuestComplete 813
step
#optional
#label FindingAntidoteTurnin
step << Hunter
.goto Orgrimmar,81.17,18.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_森度吉安|r|cRXP_BUY_交谈。从他那里购买一把|r |T135499:0|t[多层弯弓]|cRXP_BUY_。|r
.collect 2507,1
.money <0.1751
.itemStat 18,QUALITY,<7
#optional
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.5 << tbc
step << Hunter
#optional
#completewith SlumberSandPickup
.use 2507
.itemcount 2507,1
.itemStat 18,QUALITY,<7
.xp <11,1
.equip 18,2507 >>装备多层弯弓；已有同等或更强的远程武器时跳过。
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7 << !tbc
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.5 << tbc
step << Tauren Warrior
.goto Orgrimmar,47.54,68.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_乌萨罗|r|cRXP_BUY_交谈。向他购买|r |T133477:0|t[巨棒]|cRXP_BUY_。|r
.collect 1197,1 --Collect Giant Mace (1)
.money <0.2666
.target 乌萨罗
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Tauren Warrior
#optional
#completewith SlumberSandPickup
.equip 16,1197 >>|cRXP_WARN_装备|r |T133477:0|t[巨棒]
.use 1197
.itemcount 1197,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Shaman/Druid
.goto Orgrimmar,47.54,68.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_乌萨罗|r|cRXP_BUY_交谈。向他购买|r |T135154:0|t[短杖]|cRXP_BUY_。|r
.collect 854,1 --Collect Quarter Staff (1)
.money <0.3022
.target 乌萨罗
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.4
step << Shaman/Druid
#optional
#completewith SlumberSandPickup
.equip 16,854 >>|cRXP_WARN_装备|r |T135154:0|t[短杖]
.use 854
.itemcount 854,1
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.4
.xp <11,1
step
#completewith SlumberSandPickup
#label LeaveOrg3
.zone Durotar >> 离开奥格瑞玛
.zoneskip Durotar
step
.goto Durotar,41.6,18.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林纳格|r交谈
.accept 812 >>接任务：救命如救火
.target 林纳格
.isQuestAvailable 812
.xp <7,1
.itemcount 4904,1
step
.goto Durotar,41.6,18.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林纳格|r交谈
.turnin 812 >>交任务：救命如救火
.target 林纳格
.isQuestComplete 812
step
.goto Durotar,50.8,13.8,40 >>登上飞艇塔
.zone Tirisfal Glades >>乘坐飞艇前往提瑞斯法林地
.zoneskip Tirisfal Glades
step << Warrior
#optional
.abandon 1505 >>放弃任务：老兵犹塞克
.isOnQuest 1505
step << Warrior
#optional
.abandon 1498 >>放弃任务：防御之道
.isOnQuest 1498
step
.goto Tirisfal Glades,60.59,51.77
>>前往布瑞尔，若仍在飞行或传送中，请等到落地；乘飞艇抵达提瑞斯法林地后下塔，沿道路走到布瑞尔。
+确认已抵达布瑞尔并已落地
step << Warrior
.goto Tirisfal Glades,61.85,52.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话旅店内的 |cRXP_FRIENDLY_奥斯蒂尔·德·蒙|r
.target 奥斯蒂尔·德·蒙
.accept 1818 >> 接任务：迪林格尔
.isQuestAvailable 1818
.xp <10,1
.isQuestAvailable 1498
.isNotOnQuest 1498
step
.goto Tirisfal Glades,59.45,52.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
.target 药剂师乔汉
.accept 367 >>接任务：新的瘟疫
.isQuestAvailable 367
.xp <6,1
step
.goto Tirisfal Glades,59.45,52.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
.target 药剂师乔汉
.accept 445 >>接任务：给银松森林送信
.isQuestAvailable 445
.xp <9,1
step
#optional
#label SlumberSandPickup
step << Warrior
.goto Tirisfal Glades,58.19,51.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_亡灵卫兵迪林格尔|r 交谈
.target 亡灵卫兵迪林格尔
.turnin 1818 >> 交任务：迪林格尔
.isQuestComplete 1818
step << Warrior
.goto Tirisfal Glades,58.19,51.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_亡灵卫兵迪林格尔|r 交谈
.target 亡灵卫兵迪林格尔
.accept 1819 >> 接任务：切割者奥拉格
.isQuestAvailable 1819
.xp <10,1
.isQuestAvailable 1498
.isNotOnQuest 1498
step << Warrior
.goto Tirisfal Glades,59.16,48.51
>>|cRXP_WARN_点击地上的骷髅。这会召唤出|r|cRXP_ENEMY_切割者奥拉格|r。|cRXP_WARN_击杀他|r
.complete 1819,1 --Ulag the Cleaver (1)
.mob 切割者奥拉格
.isOnQuest 1819
.isQuestNotComplete 1819
step << Warrior
.goto Tirisfal Glades,58.19,51.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_亡灵卫兵迪林格尔|r 交谈
.target 亡灵卫兵迪林格尔
.turnin 1819 >> 交任务：切割者奥拉格
.isQuestComplete 1819
step << Warrior
.goto Tirisfal Glades,58.19,51.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_亡灵卫兵迪林格尔|r 交谈
.target 亡灵卫兵迪林格尔
.accept 1820 >> 接任务：库勒曼
.isQuestAvailable 1820
.xp <10,1
.isQuestTurnedIn 1498,1819
step
#loop
.goto Tirisfal Glades,43.58,61.39,0
.goto Tirisfal Glades,56.77,59.83,60,0
.goto Tirisfal Glades,57.41,61.92,60,0
.goto Tirisfal Glades,55.03,63.17,60,0
.goto Tirisfal Glades,54.24,65.34,60,0
.goto Tirisfal Glades,50.74,62.38,60,0
.goto Tirisfal Glades,49.92,61.17,60,0
.goto Tirisfal Glades,47.92,60.42,60,0
.goto Tirisfal Glades,46.61,59.75,60,0
.goto Tirisfal Glades,44.02,60.11,60,0
.goto Tirisfal Glades,43.58,61.39,60,0
>>击杀|cRXP_ENEMY_黑暗猎犬|r，拾取|cRXP_LOOT_鲜血|r
>>|cRXP_WARN_后续任务会奖励你|r |T133849:0|t[沉睡之砂]，|cRXP_WARN_如果愿意，可以跳过此任务。|r
.complete 367,1 --Darkhound Blood (5)
.mob 衰老的黑暗犬
.mob 被诅咒的黑暗犬
.isOnQuest 367
.isQuestNotComplete 367
step
.goto Tirisfal Glades,60.59,51.77
>>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_通缉告示|r
.accept 398 >>接任务：悬赏：蛆眼
.isQuestAvailable 398
.xp <4,1
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
.goto Tirisfal Glades,59.45,52.40
.target 药剂师乔汉
.turnin 367 >>交任务：新的瘟疫
.isQuestComplete 367
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
.goto Tirisfal Glades,59.45,52.40
.target 药剂师乔汉
.accept 368 >>接任务：新的瘟疫
.isQuestAvailable 368
.xp <6,1
.isQuestTurnedIn 367
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
.goto Tirisfal Glades,59.45,52.40
.target 药剂师乔汉
.accept 368 >>接任务：新的瘟疫
.isQuestAvailable 368
.xp <6,1
.isQuestTurnedIn 367
step
#completewith next
.goto Tirisfal Glades,58.66,30.77
>>前往海滩途中击杀 |cRXP_ENEMY_蛆眼|r, 获取 |cRXP_LOOT_爪子|r
.complete 398,1 --Maggot Eye's Paw (1)
.mob 蛆眼
.isOnQuest 368
.isOnQuest 398
.isQuestNotComplete 398
step
#loop
.goto Tirisfal Glades,59.54,27.86,0
.goto Tirisfal Glades,59.38,29.05,50,0
.goto Tirisfal Glades,59.54,27.86,50,0
.goto Tirisfal Glades,60.64,28.66,50,0
.goto Tirisfal Glades,61.49,29.40,50,0
.goto Tirisfal Glades,62.96,29.46,50,0
.goto Tirisfal Glades,65.68,30.22,50,0
.goto Tirisfal Glades,67.48,28.97,50,0
.goto Tirisfal Glades,68.22,26.46,50,0
>>在海滩击杀 |cRXP_ENEMY_鱼人|r, 获取 |cRXP_LOOT_鳞片|r
.complete 368,1 --Vile Fin Scale (5)
.mob 邪鳍污水鱼人
.mob 邪鳍先知
.mob 邪鳍泥浆鱼人
.isOnQuest 368
.isQuestNotComplete 368
step
.goto Tirisfal Glades,58.66,30.77
>>击杀 |cRXP_ENEMY_蛆眼|r, 获取 |cRXP_LOOT_爪子|r
.complete 398,1 --Maggot Eye's Paw (1)
.mob 蛆眼
.isOnQuest 368
.isOnQuest 398
.isQuestNotComplete 398
step
#completewith MaggetEyeTurnIn
.goto Tirisfal Glades,59.88,51.58,150 >> 返回布瑞尔
.subzoneskip 159
step
.goto Tirisfal Glades,59.45,52.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
.target 药剂师乔汉
.turnin 368 >>交任务：新的瘟疫
.isQuestComplete 368
step
.goto Tirisfal Glades,60.58,51.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞加德|r交谈
.target 执行官塞加德
.turnin 398 >>交任务：悬赏：蛆眼
.isQuestComplete 398
step
#optional
#label MaggetEyeTurnIn
step
#completewith UCflightpath2
+|cRXP_WARN_将|r |T133849:0|t[沉睡之砂]|cRXP_WARN_绑定到快捷键上，留作紧急情况使用|r
.isQuestTurnedIn 368
step << Warrior
.goto Tirisfal Glades,61.72,52.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼·法席恩|r交谈
.target 库勒曼·法席恩
.turnin 1820 >>交任务：库勒曼
.isQuestComplete 1820
step << Warrior
.goto Tirisfal Glades,61.85,52.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯蒂尔·德·蒙|r 交谈
.train 1160 >> 学习职业技能
.target 奥斯蒂尔·德·蒙
.xp <14,1
step
#completewith UCflightpath2
.goto Tirisfal Glades,61.80,65.06,20 >> 进入幽暗城
.zoneskip Undercity
step
#completewith UCflightpath2
.goto Undercity,66.09,20.06,20,0
.goto Undercity,64.37,23.94,20,0
.goto Undercity,65.93,26.71,10,0
.goto Undercity,65.89,34.03,10,0
.goto Undercity,64.22,39.77,10,0
.goto Undercity,65.53,43.62,15 >> 乘坐升降梯下到幽暗城
step
.goto Undercity,63.25,48.56
>>前往幽暗城飞行平台，若仍在飞行或传送中，请等到落地；从洛丹伦废墟乘升降梯进入地下城，沿内环前往飞行平台。
+确认已抵达幽暗城飞行平台并已落地
step
#label UCflightpath2
.goto Undercity,63.25,48.56
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迈克尔·加勒特|r 交谈
>>|cRXP_WARN_如果你已获得这个飞行点，就跳过此步！|r
.fp Undercity >> 获取幽暗城飞行点
.target 迈克尔·加勒特
step
#optional
#ah
.goto Undercity,64.20,49.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师雷克尔|r交谈
>>|cRXP_BUY_从拍卖行购买六个|r |T134339:0|t[变色的狼心] |cRXP_BUY_|r
>>|cRXP_WARN_可跳过, 仅节省少量时间|r
.collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
.target 拍卖师雷克尔
.zoneskip Undercity,1
step
#optional
.abandon 806 >> 放弃任务：黑暗风暴
.isOnQuest 806
step
#optional
.abandon 408 >> 放弃任务：家族墓穴
.isOnQuest 408
step << Warrior
#optional
.abandon 1821 >> 放弃任务：阿加曼德家传武器
.isOnQuest 1821
step
#label LeaveUndercity3
#completewith Entersilverpine
.goto Undercity,47.25,39.12,50,0
.goto Undercity,46.35,43.86,10,0
.goto Undercity,45.24,39.35,10,0
.goto Undercity,41.32,38.40,10,0
.goto Undercity,40.74,33.95,10,0
.goto Undercity,34.80,33.19,15,0
.goto Undercity,27.39,30.23,35,0
.goto Undercity,21.89,43.35,35,0
.goto Tirisfal Glades,51.10,71.53,50 >> 通过下水道离开幽暗城
.zoneskip Tirisfal Glades
step
#label Entersilverpine
.zone Silverpine Forest >> 前往银松森林
.zoneskip Silverpine Forest
]])
