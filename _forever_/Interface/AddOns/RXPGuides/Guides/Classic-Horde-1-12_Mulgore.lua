local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
#xprate <1.99
--h
<< Horde
#name 1-6 Mulgore
#title 莫高雷
#version 11
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#defaultfor Tauren
#next 6-12 Mulgore
#displayname 1-6 莫高雷
step << !Tauren
    #completewith next
    .goto Mulgore,44.92,77.12
    +|cRXP_WARN_你选择了牛头人专用指南。本区域有一条主要任务线仅限牛头人，其他种族无法接取，因此不适合在此练级。建议选择自己出生地区的指南|r
step
    .goto Mulgore,44.92,77.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .accept 747 >>接受任务 开始狩猎
    .target 格鲁尔·鹰风
step
    .goto Mulgore,44.18,76.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长|r交谈
    .accept 752 >>接受任务 一件琐事
    .target 鹰风酋长
step << Warrior/Shaman
    #completewith next
    .goto Mulgore,46.05,75.32,30,0
    +|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r并拾取掉落物，直到可出售的物品（包括身上的护甲）总价值达到10铜币|r << Warrior/Shaman
    .mob 平原陆行鸟
    .money >0.001
step << Warrior/Shaman
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡文尼|r交谈
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
    >>击杀|cRXP_ENEMY_平原陆行鸟|r，拾取它们的|cRXP_LOOT_肉|r和|cRXP_LOOT_羽毛|r
    .complete 747,1 --Plainstrider Meat (7)
    .complete 747,2 --Plainstrider Feather (7)
    .mob 平原陆行鸟
step
    .goto Mulgore,50.03,81.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长的母亲|r交谈
    .turnin 752 >>交任务 一件琐事
    .accept 753 >>接受任务 一件琐事
    .target 鹰风酋长的母亲
step
    .goto Mulgore,50.22,81.37
    >>拾取|cRXP_LOOT_水罐|r，水井在|cRXP_FRIENDLY_鹰风酋长的母亲|r身后
    .complete 753,1 --Water Pitcher (1)
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
    >>击杀|cRXP_ENEMY_平原陆行鸟|r，拾取它们的|cRXP_LOOT_肉|r和|cRXP_LOOT_羽毛|r
    .complete 747,1 --Plainstrider Meat (7)
    .complete 747,2 --Plainstrider Feather (7)
    .mob 平原陆行鸟
step
    .goto Mulgore,44.92,77.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .turnin 747,1 >>交任务 开始狩猎 << Druid
    .turnin 747 >>交任务 开始狩猎 << !Druid
    .accept 3091 >>接受任务 简易便笺 << Warrior
    .accept 3092 >>接受任务 风化便笺 << Hunter
    .accept 3093 >>接受任务 符文便笺 << Shaman
    .accept 3094 >>接受任务 绿色便笺 << Druid
    .accept 750 >>接受任务 继续狩猎
    .target 格鲁尔·鹰风
step
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡文尼|r交谈
    >>|cRXP_BUY_购买|r |T132384:0|t[轻弹丸] |cRXP_BUY_（向她购买）|r << Hunter
    .collect 2516,1000,750,1 << Hunter --Light Shot (1000)
    .vendor >> 出售垃圾物品
    .target 卡文尼·柔风
step
    .goto Mulgore,44.18,76.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长|r交谈
    .turnin 753 >>交任务 一件琐事
    .accept 755 >>接受任务 大地之母仪祭
    .target 鹰风酋长
step << Shaman
    .goto Mulgore,44.07,77.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_马沙克|r|cRXP_BUY_交谈，购买一根|r |T135139:0|t[学徒法杖] |cRXP_BUY_（向他购买）|r
    .collect 2132,1,750,1 --Collect Short Staff (1)
    .money <0.0102
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
    .target 马沙克·利刃
step << Shaman
    #optional
    #completewith RitesoftheEarthmother
    +|cRXP_WARN_装备|r |T135139:0|t[学徒法杖]
    .use 2132
    .itemcount 2132,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
step
    #completewith next
    >>击杀|cRXP_ENEMY_山狮|r，拾取它们的|cRXP_LOOT_毛皮|r
    .complete 750,1 --Mountain Cougar Pelt (10)
    .mob 山狮
step
    #label RitesoftheEarthmother
    .goto Mulgore,42.58,92.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灰舌先知|r交谈
    >>|cRXP_WARN_沿途刷怪|r
    .turnin 755 >>交任务 大地之母仪祭
    .accept 757 >>接受任务 力量仪祭
    .target 灰舌先知
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
    >>击杀|cRXP_ENEMY_山狮|r，拾取它们的|cRXP_LOOT_毛皮|r
    .complete 750,1 --Mountain Cougar Pelt (10)
    .mob 山狮
step
    #xprate <1.5
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
    .xp 3+1150 >> 刷怪至3级至少1150/1400点经验
    .mob 平原陆行鸟
step
    #xprate >1.49
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
    .xp 3+1025 >> 刷怪至3级至少1025/1400点经验
    .mob 平原陆行鸟
step << Warrior/Druid
    #completewith GrullTurnin2
    +|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r并拾取可售物品，直到总价值达到2银币|r
    .mob 平原陆行鸟
	.money >0.02
step << !Warrior !Druid
    #completewith next
    +|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r并拾取可售物品，直到总价值达到1银币|r
    .mob 平原陆行鸟
    .money >0.01
step
    #label GrullTurnin2
    .goto Mulgore,44.92,77.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .turnin 750 >>交任务 继续狩猎
    .accept 780 >>接受任务 斗猪
    .target 格鲁尔·鹰风
step
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡文尼|r交谈
    .vendor >> 出售垃圾物品
    .target 卡文尼·柔风
step
    .goto Mulgore,44.67,76.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵维萨罗·风羽|r交谈
    .accept 3376 >>接受任务 刺鬃酋长
    .target 卫兵维萨罗·风羽
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务：简易便笺
    .accept 77651 >>接任务：深入荆棘
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 哈鲁特·雷角
    .money <0.02
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务：简易便笺
    .accept 77651 >>接任务：深入荆棘
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 哈鲁特·雷角
step << Warrior
    #season 0,1
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务：简易便笺
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 哈鲁特·雷角
    .money <0.02
step << Warrior
    #season 0,1
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务：简易便笺
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 哈鲁特·雷角
step << Hunter
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡|r交谈
    .turnin 3092 >>交任务：风化便笺
    .accept 77649 >>接任务：猎人的力量
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .target 兰卡·远箭
step << Hunter
    #season 0,1
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡|r交谈
    .turnin 3092 >>交任务：风化便笺
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .target 兰卡·远箭
step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
    .turnin 3094 >>交任务：绿色便笺
    .accept 77648 >>接任务：牛头人的圣物
    .train 8921 >> 学习 |T136096:0|t[月火术]
    .target 加尔特·迷雾行者
step << Druid
    #season 0,1
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
    .turnin 3094 >>交任务：绿色便笺
    .train 8921 >> 学习 |T136096:0|t[月火术]
    .target 加尔特·迷雾行者
step << Shaman
    .goto Mulgore,44.73,76.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鸦羽|r交谈
    .accept 1519 >>接受任务 大地的召唤
    .target 鸦羽先知
step << Shaman
    #season 2
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
    .turnin 3093 >>交任务 符文便笺
    .accept 77652 >>接任务：力量圣像
    .train 8042 >>学习|T136026:0|t[地震术]
    .target 米拉·晨行者
step << Shaman
    #season 0,1
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
    .turnin 3093 >>交任务 符文便笺
    .train 8042 >>学习|T136026:0|t[地震术]
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
    >>击杀|cRXP_ENEMY_斗猪|r，拾取它们的|cRXP_LOOT_肋排|r和|cRXP_LOOT_鼻子|r
    .complete 780,2 --Battleboar Flank (8)
    .complete 780,1 --Battleboar Snout (8)
    .mob 斗猪
step
    #completewith BristlebackBelts
    .goto Mulgore,59.67,83.33,30 >>穿过洞穴
step
    #completewith DirtyMap
    >>击杀|cRXP_ENEMY_刺背野猪人|r，拾取它们的|cRXP_LOOT_腰带|r
    .complete 757,1 --Bristleback Belt (12)
    .mob 刺背野猪人
step << Shaman
    #completewith DirtyMap
    >>击杀|cRXP_ENEMY_刺背萨满祭司|r，拾取它们的|cRXP_LOOT_药膏|r
    .complete 1519,1 --Ritual Salve (2)
    .mob 刺背萨满祭司
step
    .goto Mulgore,60.54,81.04,35,0
    .goto Mulgore,62.35,81.27,35,0
    .goto Mulgore,62.49,78.78,35,0
    .goto Mulgore,64.71,77.67
    >>击杀大屋内的|cRXP_ENEMY_刺鬃酋长|r，拾取他的|cRXP_LOOT_头颅|r
    .complete 3376,1 --Chief Sharptusk Thornmantle's Head (1)
    .mob 刺鬃酋长
step << Warrior
    #season 2
    .isOnQuest 77651
    .goto Mulgore,61.62,76.04
    >>拾取 |cRXP_PICK_刺背野猪人的宝箱|r，获得 |T134419:0|t[|cRXP_LOOT_乘胜追击符文|r]
    .collect 204806,1,77651,1,4
    .train 403470,1
step << Warrior
    #season 2
    .isOnQuest 77651
    .use 204806 >>使用 |T134419:0|t[|cRXP_LOOT_乘胜追击符文|r]，学习 |cRXP_WARN_铭刻手套 - 乘胜追击|r
    .complete 77651,1
    .train 403470,1
step << Hunter
    #season 2
    .isOnQuest 77649
    .goto Mulgore,63.81,76.65,40,0
    .goto Mulgore,62.92,76.91,40,0
    .goto Mulgore,61.31,77.22,40,0
    .goto Mulgore,63.93,78.34
    >>击杀 |cRXP_ENEMY_刺背斗猪|r，拾取 |T134419:0|t[|cRXP_LOOT_奇美拉符文|r]
    .collect 206168,1,77649,1,4
    .train 410121,1
    .mob 刺背斗猪
step << Hunter
    #season 2
    .isOnQuest 77649
    .use 206168 >>使用 |T134419:0|t[|cRXP_LOOT_奇美拉符文|r]，学习 |cRXP_WARN_铭刻手套 - 奇美拉射击|r
    .complete 77649,1
    .train 410121,1
step << Druid
    #season 2
    .isOnQuest 77648
    .goto Mulgore,61.62,76.04
    >>拾取 |cRXP_PICK_刺背野猪人的宝箱|r，获得 |T134903:0|t[|cRXP_LOOT_月光神像|r]
    .collect 208414,1,77648,1,4
    .train 410061,1
step << Druid
    #season 2
    .isOnQuest 77648
    .equip 18,208414 >>装备 |T134903:0|t[|cRXP_LOOT_月光神像|r]
    .use 208414
    .train 410061,1
step << Druid
    #season 2
    #completewith BristlebackBelts
    .isOnQuest 77648
    >>装备神像后，击杀6只受到你的 |T136096:0|t[月火术] 影响的敌人
    .use 208414 >>获得 |cRXP_WARN_灵感勃发|r 后，再次使用 |T134903:0|t[|cRXP_LOOT_月光神像|r]，学习 |cRXP_WARN_铭刻胸甲 - 怒风之怒|r
    .complete 77648,1
    .train 410061,1
step << Shaman
    #season 2
    .isOnQuest 77652
    .goto Mulgore,63.74,81.18,40,0
    .goto Mulgore,65.00,78.60,40,0
    .goto Mulgore,63.86,80.14
    >>击杀 |cRXP_ENEMY_刺背萨满祭司|r，拾取 |T134918:0|t[|cRXP_LOOT_二价圣像|r]
    .collect 206381,1,77652,1,4
    .train 410094,1
    .mob 刺背萨满祭司
step << Shaman
    #season 2
    .isOnQuest 77652
    .equip 18,206381 >>装备 |T134918:0|t[|cRXP_LOOT_二价圣像|r]
    .use 206381
    .train 410094,1
step << Shaman
    #season 2
    #completewith BristlebackBelts
    .isOnQuest 77652
    >>装备圣像后，承受10次自然伤害；可让 |cRXP_ENEMY_刺背萨满祭司|r 对你施放 |T136048:0|t[闪电箭]
    .use 206381 >>获得 |cRXP_WARN_灵感勃发|r 后，再次使用 |T134918:0|t[|cRXP_LOOT_二价圣像|r]，学习 |cRXP_WARN_铭刻胸甲 - 过载|r
    .complete 77652,1
    .train 410094,1
    .mob 刺背萨满祭司

step
    #completewith next
    .goto Mulgore,63.24,82.70,40 >>进入洞穴
step
    #label DirtyMap
    .goto Mulgore,63.24,82.70
    >>拾取地上的|T134269:0|t[|cRXP_LOOT_沾满泥土的地图|r]，使用它接取任务
    .collect 4851,1,781 --Collect Dirt-Stained Map
    .accept 781 >>接受任务 纳拉其营地的危机
    .use 4851
step << Shaman
    #completewith next
    >>击杀|cRXP_ENEMY_刺背萨满祭司|r，拾取它们的|cRXP_LOOT_药膏|r
    .complete 1519,1 --Ritual Salve (2)
    .mob 刺背萨满祭司
step
    #label BristlebackBelts
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
    >>击杀|cRXP_ENEMY_刺背野猪人|r，拾取它们的|cRXP_LOOT_腰带|r
    .complete 757,1 --Bristleback Belt (12)
    .mob 刺背野猪人
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
    >>击杀|cRXP_ENEMY_刺背萨满祭司|r，拾取它们的|cRXP_LOOT_药膏|r
    .complete 1519,1 --Ritual Salve (2)
    .mob 刺背萨满祭司
step << Druid
    #season 2
    .isOnQuest 77648
    .goto Mulgore,63.93,78.34
    >>若尚未学会符文，继续击杀受到你的 |T136096:0|t[月火术] 影响的敌人，累计6次
    .use 208414 >>获得 |cRXP_WARN_灵感勃发|r 后，使用已装备的 |T134903:0|t[|cRXP_LOOT_月光神像|r]
    .complete 77648,1
    .train 410061,1
step << Shaman
    #season 2
    .isOnQuest 77652
    .goto Mulgore,63.86,80.14
    >>若尚未学会符文，继续让 |cRXP_ENEMY_刺背萨满祭司|r 对你施放 |T136048:0|t[闪电箭]，承受的自然伤害累计达到10次
    .use 206381 >>获得 |cRXP_WARN_灵感勃发|r 后，使用已装备的 |T134918:0|t[|cRXP_LOOT_二价圣像|r]
    .complete 77652,1
    .train 410094,1
    .mob 刺背萨满祭司

step
    #xprate <1.5
    #loop
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
    .xp 5+880 >> 刷怪至5级至少880/2800点经验 << !Shaman
    .xp 5 >> 刷怪升至5级 << Shaman
step
    #xprate >1.49
    #loop
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
    .xp 5 >> 刷怪升至5级 << !Shaman
    .xp 4+700 >> 刷怪至4级700/2100点经验 << Shaman
step
    #completewith next
    .hs >> 使用炉石返回纳拉其营地
    .use 6948
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r、|cRXP_FRIENDLY_卫兵维萨罗·风羽|r和|cRXP_FRIENDLY_鹰风|r交谈 << !Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r、|cRXP_FRIENDLY_卫兵维萨罗·风羽|r、|cRXP_FRIENDLY_先知|r和|cRXP_FRIENDLY_鹰风|r交谈 << Shaman
    .turnin 780 >>交任务 斗猪
    .target +格鲁尔·鹰风
    .goto Mulgore,44.92,77.12
    .turnin 3376 >>交任务 刺鬃酋长
    .target +卫兵维萨罗·风羽
    .goto Mulgore,44.67,76.68
    .turnin 1519 >>交任务 大地的召唤 << Shaman
    .accept 1520 >>接受任务 大地的召唤 << Shaman
    .target +鸦羽先知 << Shaman
    .goto Mulgore,44.73,76.18 << Shaman
    .turnin 781 >>交任务 纳拉其营地的危机
    .turnin 757 >>交任务 力量仪祭
    .accept 763 >>接受任务 大地之母仪祭
    .target +鹰风酋长
    .goto Mulgore,44.18,76.07
step << Shaman
    .isOnQuest 1520
    #completewith CallofEarth
    #label Rock
    .goto Mulgore,53.74,80.15,30 >> 前往岩石方向
step << Shaman
    .isOnQuest 1520
    #completewith next
    #requires Rock
    .cast 8202 >>|cRXP_WARN_使用|r |T134743:0|t[大地灵契]
    .use 6635
step << Shaman
    #label CallofEarth
    .goto Mulgore,53.74,80.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大地之魂|r交谈
    .turnin 1520 >>交任务 大地的召唤
    .accept 1521 >>接受任务 大地的召唤
    .target 大地之魂
step << Shaman
    .goto Mulgore,44.73,76.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鸦羽|r交谈
    .turnin 1521 >>交任务 大地的召唤
    .target 鸦羽先知
step << Shaman
    #season 2
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
    .turnin 77652 >>交任务 力量圣像
    .train 332 >>学习 |T136052:0|t[治疗波]
    .target 米拉·晨行者
step << Shaman
    #season 0,1
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
    .train 332 >>学习 |T136052:0|t[治疗波]
    .target 米拉·晨行者
step << Hunter
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡|r交谈
    .train 1130 >>学习 |T132212:0|t[猎人印记]
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .turnin 77649 >>交任务 猎人的力量
    .target 兰卡·远箭
    .money <0.02
step << Hunter
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡|r交谈
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .turnin 77649 >>交任务 猎人的力量
    .target 兰卡·远箭
step << Hunter
    #season 0,1
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡|r交谈
    .train 1130 >>学习 |T132212:0|t[猎人印记]
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target 兰卡·远箭
    .money <0.02
step << Hunter
    #season 0,1
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡|r交谈
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target 兰卡·远箭
step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
    .train 467 >>学习 |T136104:0|t[荆棘术]
    .train 5177 >>学习 |T136006:0|t[愤怒]
    .turnin 77648 >>交任务 牛头人的圣物
    .target 加尔特·迷雾行者
    .money <0.02
step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
    .train 5177 >>学习 |T136006:0|t[愤怒]
    .turnin 77648 >>交任务 牛头人的圣物
    .target 加尔特·迷雾行者
step << Druid
    #season 0,1
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
    .train 467 >>学习 |T136104:0|t[荆棘术]
    .train 5177 >>学习 |T136006:0|t[愤怒]
    .target 加尔特·迷雾行者
    .money <0.02
step << Druid
    #season 0,1
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
    .train 5177 >>学习 |T136006:0|t[愤怒]
    .target 加尔特·迷雾行者
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .train 6343 >>学习 |T136105:0|t[雷霆一击]
    .turnin 77651 >>交任务 深入荆棘
    .target 哈鲁特·雷角
    .money <0.02
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .turnin 77651 >>交任务 深入荆棘
    .target 哈鲁特·雷角
step << Warrior
    #season 0,1
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .train 6343 >>学习 |T136105:0|t[雷霆一击]
    .target 哈鲁特·雷角
    .money <0.02
step << Warrior
    #season 0,1
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .target 哈鲁特·雷角
step
    .goto Mulgore,38.51,81.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安图尔·荒野|r交谈
    .accept 1656 >>接受任务 未完的任务
    .target 安图尔·荒野
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
#xprate <1.99
<< Horde
#name 6-12 Mulgore
#title 莫高雷
#version 11
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#defaultfor Tauren
#next 12-17 The Barrens
#displayname 6-12 莫高雷
step << Druid
    #season 2
    .goto Mulgore,35.72,69.57
    >>|cRXP_WARN_施放|r |T136096:0|t[月火术] |cRXP_WARN_，目标是三块|r |cRXP_ENEMY_月亮石|r|cRXP_WARN_。石头之间会出现一个宝箱|r
    >>打开 |cRXP_PICK_月亮宝箱|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_日灼符文|r]
    .collect 206989,1 --Rune of the Sun (1)
    .mob 月亮石
    .train 416044,1
step << Druid
    #season 2
    .train 416044 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_日灼符文|r] |cRXP_WARN_学习|r |T236216:0|t[阳炎术]
    .use 206989
    .itemcount 206989,1
step
	#completewith BloodhoofHome
	#softcore
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
	#hardcore
	#completewith BloodhoofHome
    .goto Mulgore,47.35,60.70,120 >> 跑到血蹄村
    .subzoneskip 222
step
    #softcore
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_茂尔|r 交谈
    .accept 766 >>接任务：马兹拉纳其
    .target 茂尔·祈雨
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢尔·鹰爪|r 和 |cRXP_FRIENDLY_贝恩·血蹄|r 交谈
    .accept 743 >>接任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.36,62.01
    .turnin -763 >>交任务：大地之母仪祭
    .accept 745 >>接任务：土地之争
    .accept 767 >>接任务：幻象仪祭
    .accept 746 >>接任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
step
    #label BloodhoofHome
    .goto Mulgore,46.63,61.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板考乌斯|r 交谈
    .turnin -1656 >>交任务：未完的任务
    .target 旅店老板考乌斯
step
    .goto Mulgore,46.63,61.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板考乌斯|r 交谈
    .home 222 >>将炉石绑定到血蹄村
    .target 旅店老板考乌斯
    .bindlocation 222
    .subzoneskip 222,1

step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特|r 交谈
    .vendor >> 出售垃圾物品。如果卖掉武器后就有足够的钱购买 |T135145:0|t[学徒短杖]（5银04铜），就卖掉武器。如果钱还不够，稍后再来
    .target 玛诺特·深痕
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_玛诺特|r|cRXP_BUY_交谈，向其购买|r |T135145:0|t[学徒短杖] |cRXP_BUY_。|r
    .collect 2495,1,761,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特|r 交谈
    .vendor >> 出售垃圾物品。如果卖掉武器后就有足够的钱购买 |T133053:0|t[木槌棒]（7银1铜），就卖掉武器。如果钱还不够，稍后再来
    .target 玛诺特·深痕
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_玛诺特|r|cRXP_BUY_交谈，再向他购买|r |T133053:0|t[木槌棒]|cRXP_BUY_。|r
    .collect 2493,1,761,1 --Collect Wooden Mallet (1)
    .money <0.0701
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯纳|r 交谈
    .vendor >> 出售垃圾物品。如果卖掉武器后就有足够的钱购买 |T135611:0|t[精制短枪]（4银14铜），就卖掉武器。如果钱还不够，稍后再来
    .target 肯纳·鹰眼
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_肯纳·鹰眼|r|cRXP_BUY_交谈，再向她购买|r |T135611:0|t[精制短枪]|cRXP_BUY_。|r
    .collect 2509,1,761,1 --Collect Ornate Blunderbuss (1)
    .money <0.0414
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_肯纳|r 交谈
    >>|cRXP_BUY_购买|r |T132384:0|t[轻弹丸] |cRXP_BUY_。|r << Hunter
    .collect 2516,1000,761,1 << Hunter --Light Shot (1000)
    .target 肯纳·鹰眼
step << Shaman/Druid
    #optional
    #completewith Well
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #optional
    #completewith Well
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #optional
    #completewith Well
    +|cRXP_WARN_装备|r |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_茂尔|r、|cRXP_FRIENDLY_扎尔曼·双月|r、|cRXP_FRIENDLY_哈肯·风之图腾|r 和 |cRXP_FRIENDLY_穆尔|r 交谈
    .accept 766 >>接任务：马兹拉纳其
    .target +茂尔·祈雨
    .goto Mulgore,46.97,57.07
    .turnin 767 >>交任务：幻象仪祭
    .accept 771 >>接任务：幻象仪祭
    .target +扎尔曼·双月
    .goto Mulgore,47.76,57.53
    .accept 761 >>接任务：猎捕猛鹫
    .target +哈肯·风之图腾
    .goto Mulgore,48.71,59.32
    .accept 748 >>接任务：毒水
    .target +穆尔·雷角
    .goto Mulgore,48.53,60.40
step << !Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_茂尔|r、|cRXP_FRIENDLY_扎尔曼·双月|r 和 |cRXP_FRIENDLY_哈肯·风之图腾|r 交谈
    .accept 766 >>接任务：马兹拉纳其
    .target +茂尔·祈雨
    .goto Mulgore,46.97,57.07
    .turnin 767 >>交任务：幻象仪祭
    .accept 771 >>接任务：幻象仪祭
    .target +扎尔曼·双月
    .goto Mulgore,47.76,57.53
    .accept 761 >>接任务：猎捕猛鹫
    .target +哈肯·风之图腾
    .goto Mulgore,48.71,59.32
step
    #sticky
    #completewith Well
    >>|cRXP_WARN_在这片区域做任务时顺手收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Tauren
    #completewith Ambercorns
    >>击杀 |cRXP_ENEMY_草原狼|r 和 |cRXP_ENEMY_成年平原陆行鸟|r，拾取它们的 |cRXP_LOOT_狼爪|r 和 |cRXP_LOOT_利爪|r
    .complete 748,1 --Prairie Wolf Paw (6)
    .mob +草原狼
    .complete 748,2 --Plainstrider Talon (4)
    .mob +成年平原陆行鸟
step << Hunter
    #season 2
    .goto Mulgore,59.02,54.36
    >>施放 |T132212:0|t[猎人印记]，目标是 |cRXP_ENEMY_沙沙响的草丛|r
    >>击杀出现的 |cRXP_ENEMY_风险投资公司偷猎者|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob 沙沙响的草丛
    .mob 风险投资公司偷猎者
    .train 410113,1
step << Hunter
    #season 2
    .train 410113 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .use 206155
    .itemcount 206155,1
step
    #label Ambercorns
    #loop
    .goto Mulgore,50.36,66.49,0
    .goto Mulgore,48.71,64.44,15,0
    .goto Mulgore,50.36,66.49,15,0
    .goto Mulgore,51.92,63.85,15,0
    .goto Mulgore,51.13,71.06,15,0
    .goto Mulgore,50.36,66.49,15,0
    >>收集 |cRXP_PICK_琥珀颗粒|r，可以在树下的地面上找到
    .complete 771,2 --Ambercorn (2)
step
	#completewith next
	>>在莫高雷击杀各处的 |cRXP_ENEMY_猛鹫|r, 搜刮 |cRXP_LOOT_羽毛|r
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob 消瘦的猛鹫
    .mob 猛鹫
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
    >>击杀 |cRXP_ENEMY_草原狼|r 和 |cRXP_ENEMY_成年平原陆行鸟|r，拾取它们的 |cRXP_LOOT_狼爪|r 和 |cRXP_LOOT_利爪|r
    .complete 748,1 --Prairie Wolf Paw (6)
    .mob +草原狼
    .complete 748,2 --Plainstrider Talon (4)
    .mob +成年平原陆行鸟
step << Tauren
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_穆尔|r 交谈
    .turnin 748 >>交任务：毒水
    .timer 8,毒水剧情演出
    .accept 754 >>接任务：净化冰蹄之井
    .target 穆尔·雷角
step << Tauren
    #completewith next
    >>收集水井周围的 |cRXP_PICK_水井石|r
    .complete 771,1 --Well Stone (2)
step << Tauren
    .goto Mulgore,53.68,66.28
    >>|cRXP_WARN_使用|r |T135139:0|t[冰蹄之井净化图腾] |cRXP_WARN_，在水井处使用|r
    .complete 754,1 --Cleanse the Winterhoof Water Well (1)
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
    >>收集水井周围的 |cRXP_PICK_水井石|r
    .complete 771,1 --Well Stone (2)
step
    #completewith Gnolls
    >>|cRXP_WARN_在这片区域做任务时顺手收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Warrior
    #season 2
    .itemcount 204690,<1
    .itemcount 204703,<1
    #loop
    .goto Mulgore,53.5,73.0,0
    .goto Mulgore,48.3,72.0,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    >>在两个营地间来回清理。击杀 |cRXP_ENEMY_白鬃制革工|r、|cRXP_ENEMY_白鬃剥皮工|r 和 |cRXP_ENEMY_白鬃偷猎者|r，拾取 |cRXP_LOOT_被砍下的豺狼人的头|r
    >>|cRXP_WARN_小心|r |cRXP_ENEMY_断矛|r|cRXP_WARN_（9级稀有怪），它的难度太高，不宜击杀|r
    .complete 745,1 --Palemane Tanner (10)
    .mob +白鬃制革工
    .complete 745,2 --Palemane Skinner (8)
    .mob +白鬃剥皮工
    .complete 745,3 --Palemane Poacher (5)
    .mob +白鬃偷猎者
    .collect 204478,1 --Severed Gnoll Head (1)
    .unitscan 断矛
    .train 403475,1
step
    #label Gnolls
    #loop
    .goto Mulgore,53.5,73.0,0
    .goto Mulgore,48.3,72.0,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    >>在两个营地之间来回穿梭, 击杀 |cRXP_ENEMY_白鬃制革工|r、|cRXP_ENEMY_白鬃剥皮工|r 和 |cRXP_ENEMY_白鬃偷猎者|r
    >>|cRXP_WARN_小心|r |cRXP_ENEMY_断矛|r|cRXP_WARN_（9级稀有怪），它的难度太高，不宜击杀|r
    .complete 745,1 --Palemane Tanner (10)
    .mob +白鬃制革工
    .complete 745,2 --Palemane Skinner (8)
    .mob +白鬃剥皮工
    .complete 745,3 --Palemane Poacher (5)
    .mob +白鬃偷猎者
    .unitscan 断矛
step
    .goto Mulgore,47.63,61.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加纳|r 交谈
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r << Shaman/Druid
    >>|cRXP_BUY_购买|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_。|r << Warrior
    .vendor >> 出售垃圾物品
    .collect 1179,10,746,1 << Shaman/Druid --Ice Cold Milk (10)
    .collect 4541,10,746,1 << Warrior --Freshly Baked Bread (10)
    .target 加纳·麦风
    .money <0.025
step << Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_穆尔|r 和 |cRXP_FRIENDLY_贝恩·血蹄|r 交谈
    .turnin 754 >>交任务：净化冰蹄之井
    .accept 756 >>接任务：雷角图腾
    .target +穆尔·雷角
    .goto Mulgore,48.53,60.40
    .turnin 745 >>交任务：土地之争
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
step << !Tauren
    .goto Mulgore,47.51,60.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贝恩·血蹄|r 交谈
    .turnin 745 >>交任务：土地之争
    .target 贝恩·血蹄
step << Warrior
    .goto Mulgore,46.80,60.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔拉|r 交谈
    .train 3273 >>学习 |T135966:0|t[急救]
    .money <0.01
    .target 维尔拉·幼蹄
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特|r 交谈
    .vendor >> 出售垃圾物品。如果卖掉武器后就有足够的钱购买 |T135145:0|t[学徒短杖]（5银04铜），就卖掉武器。如果钱还不够，稍后再来
    .target 玛诺特·深痕
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_玛诺特|r|cRXP_BUY_交谈，再向他购买|r |T135145:0|t[学徒短杖]|cRXP_BUY_。|r
    .collect 2495,1,749,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特|r 交谈
    .vendor >> 出售垃圾物品。如果卖掉武器后就有足够的钱购买 |T133053:0|t[木槌棒]（7银1铜），就卖掉武器。如果钱还不够，稍后再来
    .target 玛诺特·深痕
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_玛诺特|r|cRXP_BUY_交谈，再向他购买|r |T133053:0|t[木槌棒]|cRXP_BUY_。|r
    .collect 2493,1,749,1 --Collect Wooden Mallet (1)
    .money <0.0701
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯纳|r 交谈
    .vendor >> 出售垃圾物品。如果卖掉武器后就有足够的钱购买 |T135611:0|t[精制短枪]（4银14铜），就卖掉武器。如果钱还不够，稍后再来
    .target 肯纳·鹰眼
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_肯纳·鹰眼|r|cRXP_BUY_交谈，再向她购买|r |T135611:0|t[精制短枪]|cRXP_BUY_。|r
    .collect 2509,1,749,1 --Collect Ornate Blunderbuss (1)
    .money <0.0414
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Shaman/Druid
    #optional
    #completewith Clawsx
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #optional
    #completewith Clawsx
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #optional
    #completewith Clawsx
    +|cRXP_WARN_装备|r |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step
    #label Vision
    .goto Mulgore,47.76,57.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔曼·双月|r 交谈
    >>|cRXP_WARN_刷出的狼不要跟随|r
    .turnin 771 >>交任务：幻象仪祭
    .accept 772 >>接任务：幻象仪祭
    .target 扎尔曼·双月
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文|r 交谈
    .train 5116 >> 训练职业技能
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克朗|r 交谈
    .train 284 >> 训练职业技能
    .target 克朗·石蹄
    .xp <8,1
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳姆|r 交谈
    .train 8044 >> 训练职业技能
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩林·云行者|r 交谈
    >>|cRXP_WARN_他在东侧道路上巡逻|r
    .accept 749 >>接任务：被破坏的货车
	.unitscan 摩林·云行者
step
    #completewith Clawsx
    >>|cRXP_WARN_在这片区域做任务时顺手收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Tauren
    #completewith RavagedCaravan1
    >>击杀 |cRXP_ENEMY_草原捕食者|r 和 |cRXP_ENEMY_平原狮|r，拾取它们的 |cRXP_LOOT_爪子|r
    .complete 756,1 --Stalker Claws (6)
    .mob +草原捕食者
    .complete 756,2 --Cougar Claws (6)
    .mob +平原狮
step
	#completewith Clawsx
	>>在莫高雷击杀各处的 |cRXP_ENEMY_猛鹫|r, 搜刮 |cRXP_LOOT_羽毛|r
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob 消瘦的猛鹫
    .mob 猛鹫
step
    #label RavagedCaravan1
    .goto Mulgore,53.74,48.17
    >>点击 |cRXP_PICK_密封的补给箱|r
    .turnin 749 >>交任务：被破坏的货车
    .accept 751 >>接任务：被破坏的货车
step << Tauren
    #loop
    .goto Mulgore,58.1,48.6,0
    .goto Mulgore,58.1,48.6,60,0
    .goto Mulgore,54.5,40.1,60,0
    .goto Mulgore,46.4,50.7,60,0
    >>击杀 |cRXP_ENEMY_草原捕食者|r 和 |cRXP_ENEMY_平原狮|r，拾取它们的 |cRXP_LOOT_爪子|r
    .complete 756,1 --Stalker Claws (6)
    .mob +草原捕食者
    .complete 756,2 --Cougar Claws (6)
    .mob +平原狮
step
    #optional
    #label Clawsx
step
    #softcore
	#completewith Thunderhorn
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #hardcore
    #completewith Thunderhorn
    .goto Mulgore,46.5,55.5,150 >> 返回血蹄村
    .subzoneskip 222
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文|r 交谈
    .train 5116 >> 训练职业技能
    .target 雅文·刺鬃
    .xp <8,1
step
    #label Mazzturnin
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_茂尔|r 交谈
    .turnin 766 >>交任务：马兹拉纳其
    .target 茂尔·祈雨
    .isQuestComplete 766
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特|r 交谈
    .vendor >> 出售垃圾物品。如果卖掉武器后就有足够的钱购买 |T135145:0|t[学徒短杖]（5银04铜），就卖掉武器。如果钱还不够，稍后再来
    .target 玛诺特·深痕
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_玛诺特|r|cRXP_BUY_交谈，再向他购买|r |T135145:0|t[学徒短杖]|cRXP_BUY_。|r
    .collect 2495,1,743,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特|r 交谈
    .vendor >> 出售垃圾物品。如果卖掉武器后就有足够的钱购买 |T133053:0|t[木槌棒]（7银1铜），就卖掉武器。如果钱还不够，稍后再来
    .target 玛诺特·深痕
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_玛诺特|r|cRXP_BUY_交谈，再向他购买|r |T133053:0|t[木槌棒]|cRXP_BUY_。|r
    .collect 2493,1,743,1 --Collect Wooden Mallet (1)
    .money <0.0701
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯纳|r 交谈
    .vendor >> 出售垃圾物品。如果卖掉武器后就有足够的钱购买 |T135611:0|t[精制短枪]（4银14铜），就卖掉武器。如果钱还不够，稍后再来
    .target 肯纳·鹰眼
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_肯纳·鹰眼|r|cRXP_BUY_交谈，再向她购买|r |T135611:0|t[精制短枪]|cRXP_BUY_。|r
    .collect 2509,1,743,1 --Collect Ornate Blunderbuss (1)
    .money <0.0414
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.86,57.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_姆拉特|r 交谈
    .collect 2516,1000,743,1 << Hunter --Light Shot (1000)
    .target 姆拉特·远行
    .itemcount 2516,<800 << Hunter
step << Shaman/Druid
    #optional
    #completewith ThunderhornCleanse
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #optional
    #completewith ThunderhornCleanse
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #optional
    #completewith ThunderhornCleanse
    +|cRXP_WARN_装备|r |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step
    #completewith Thunderhorn
    .goto Mulgore,45.90,58.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈兰特|r 交谈
    .vendor >> 出售垃圾物品并修理装备
    .target 哈兰特·铁枝
step
    .goto Mulgore,48.71,59.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈肯·风之图腾|r 交谈
    .turnin 761 >>交任务：猎捕猛鹫
    .target 哈肯·风之图腾
    .isQuestComplete 761
step << Tauren
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_穆尔|r 交谈
    .turnin 756 >>交任务：雷角图腾
    .timer 8,雷角图腾剧情演出
    .accept 758 >>接任务：净化雷角之井
    .target 穆尔·雷角
step
    #optional
    #label Thunderhorn
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳姆|r 交谈
    .train 8044 >> 训练职业技能
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克朗|r 交谈
    .train 284 >> 训练职业技能
    .target 克朗·石蹄
    .xp <8,1
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文|r 交谈
    .train 5116 >> 训练职业技能
    .target 雅文·刺鬃
    .xp <8,1
step
    .goto Mulgore,46.63,61.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板考乌斯|r 交谈
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_，向他购买|r << Shaman/Druid
    >>|cRXP_BUY_购买|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_，向他购买|r << Warrior
    .vendor >> 出售垃圾物品 << !Hunter
    .collect 1179,10,746,1 << Shaman/Druid --Ice Cold Milk (10)
    .collect 4541,10,746,1 << Warrior --Freshly Baked Bread (10)
    .target 旅店老板考乌斯
    .money <0.025
step
    #completewith Burial
    >>|cRXP_WARN_收集齐马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
	#completewith Burial
	>>在莫高雷击杀各处的 |cRXP_ENEMY_猛鹫|r, 搜刮 |cRXP_LOOT_羽毛|r
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob 消瘦的猛鹫
    .mob 猛鹫
step << Tauren
    .goto Mulgore,44.49,45.36
    >>|cRXP_WARN_使用|r |T135139:0|t[雷角之井净化图腾] |cRXP_WARN_，在水井处使用|r
    .complete 758,1 --Cleanse the Thunderhorn Water Well (1)
step
    #optional
    #label ThunderhornCleanse

step << Shaman
    #season 2
    .itemcount 206388,<1
    #completewith next
    >>击杀 |cRXP_ENEMY_巴尔丹掘地工|r 和 |cRXP_ENEMY_巴尔丹鉴定官|r，拾取 |cRXP_LOOT_神器仓库钥匙|r
    .collect 206975,1 --Artifact Storage Key (1)
    .mob 巴尔丹掘地工
    .mob 巴尔丹鉴定官
    .train 425344,1
    .xp <3,1
step
    .goto Mulgore,31.27,49.87
    >>击杀 |cRXP_ENEMY_巴尔丹掘地工|r 和 |cRXP_ENEMY_巴尔丹鉴定官|r，拾取它们的 |cRXP_LOOT_勘察员的锄头|r
    .use 4702 >> |cRXP_WARN_砸碎|r |T134707:0|t[勘察员的锄头] |cRXP_WARN_，在熔炉处操作|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_巴尔丹鉴定官|r 会施放|r |T135929:0|t[次级治疗术] |cRXP_WARN_（远程施法：为自身或附近生命值低于50%的怪物恢复约75点生命值）|r
    .complete 746,1 --Broken Tools (5)
    .mob 巴尔丹掘地工
    .mob 巴尔丹鉴定官
step << Shaman
    #season 2
    .itemcount 206388,<1
    #loop
    .goto Mulgore,34.33,47.54,0
    .goto Mulgore,34.33,47.54,40,0
    .goto Mulgore,33.62,49.61,40,0
    .goto Mulgore,32.58,48.96,40,0
    .goto Mulgore,31.88,50.17,40,0
    .goto Mulgore,31.14,50.08,40,0
    .goto Mulgore,30.98,48.24,40,0
    .goto Mulgore,31.59,48.19,40,0
    .goto Mulgore,33.10,47.69,40,0
    >>击杀 |cRXP_ENEMY_巴尔丹掘地工|r 和 |cRXP_ENEMY_巴尔丹鉴定官|r，拾取 |cRXP_LOOT_神器仓库钥匙|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_巴尔丹鉴定官|r 会施放|r |T135929:0|t[次级治疗术] |cRXP_WARN_（远程施法：为自身或附近生命值低于50%的怪物恢复约75点生命值）|r
    .collect 206975,1 --Artifact Storage Key (1)
    .mob 巴尔丹掘地工
    .mob 巴尔丹鉴定官
    .train 425344,1
    .xp <3,1
step << Shaman
    #season 2
    .goto Mulgore,31.56,49.54
    >>打开 |cRXP_PICK_神器仓库宝箱|r，拾取 |T134918:0|t[|cRXP_LOOT_硫息圣像|r]
    .collect 206388,1 --Sulfurous Icon (1)
    .train 425344,1
    .xp <3,1
step << Shaman
    #season 2
    .equip 18,206388 >> |cRXP_WARN_装备|r |T134918:0|t[|cRXP_LOOT_硫息圣像|r]
    .use 206388
    .itemcount 206388,1 --Sulfurous Icon (1)
    .train 425344,1
    .xp <3,1
step << Shaman
    #season 2
    #label MoltenBlast
    #completewith Burial
    .aura 408828 >>|cRXP_WARN_至少对敌人施放一次|r |T136026:0|t[地震术] |cRXP_WARN_再将其击杀。重复10次以获得|r |T136116:0|t[灵感勃发] |cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意: 必须对能提供经验的敌人使用才能叠加层数|r
    .mob 巴尔丹掘地工
    .mob 巴尔丹鉴定官
    .train 425344,1
    .xp <3,1
    .xp >13,1
step << Warrior
    #season 2
    .itemcount 204689,<1
    .itemcount 204703,<1
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
    >>击杀 |cRXP_ENEMY_风怒唤风者|r 和 |cRXP_ENEMY_风怒鹰身人|r，拾取它们的 |cRXP_LOOT_利爪|r 和 |cRXP_LOOT_被砍下的鹰身人的头|r
    .complete 743,1 --Windfury Talon (8)
    .collect 206995,1 ---Severed Harpy Head (1)
    .mob 风怒唤风者
    .mob 风怒鹰身人
    .train 403475,1
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
    >>击杀 |cRXP_ENEMY_风怒唤风者|r 和 |cRXP_ENEMY_风怒鹰身人|r，拾取它们的 |cRXP_LOOT_利爪|r
    .complete 743,1 --Windfury Talon (8)
    .mob 风怒唤风者
    .mob 风怒鹰身人
step
    #completewith next
    .goto Mulgore,33.37,36.52,50 >> 进入风怒鹰身人北面的洞穴
step
	#label Burial
    .goto Mulgore,32.72,36.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_先知奥萨迪·智慧行者|r 交谈
    .turnin 772 >>交任务：幻象仪祭
    .accept 773 >>接任务：智慧仪祭
    .target 先知奥萨迪·智慧行者
step << Shaman
    #season 2
    #requires MoltenBlast
    >>若尚未获得 |cRXP_WARN_灵感勃发|r，装备圣像，继续击杀受过你的 |T136026:0|t[地震术] 伤害且能提供经验的敌人，累计10次
    .train 425344 >>|cRXP_WARN_使用|r |T134918:0|t|cRXP_LOOT_[硫息圣像]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 熔火爆裂]
    .use 206388
    .train 425344,1
    .xp <3,1
step
    #completewith SacredBurial
    .destroy 4823 >> |cRXP_WARN_可以从背包中摧毁|r |T134712:0|t[先知之水]|cRXP_WARN_，之后不再需要它|r
step
    #completewith SacredBurial
    >>|cRXP_WARN_收集齐马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    #completewith SacredBurial
    >>留意 |cRXP_ENEMY_鬼嚎|r，击杀后拾取它的 |T134358:0|t[|cRXP_LOOT_恶魔之伤|r]，使用它接取任务
    >>|cRXP_WARN_小心，|cRXP_ENEMY_鬼嚎|r 是12级怪物，很难对付|r
    .collect 4854,1,770 --Collect Demon Scarred Cloak
    .accept 770 >>接任务：恶魔之伤
    .use 4854
    .unitscan 鬼嚎
step
	#completewith next
	>>在莫高雷击杀各处的 |cRXP_ENEMY_猛鹫|r, 搜刮 |cRXP_LOOT_羽毛|r
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob 消瘦的猛鹫
    .mob 猛鹫
    .mob 长爪猛鹫
step
    #label SacredBurial
    .goto Mulgore,59.85,25.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_博学者诺拉·暴雨图腾|r 交谈
    .accept 833 >>接任务：神圣的墓地
    .target 博学者诺拉·暴雨图腾
step << Warrior
    #season 2
    .itemcount 204688,<1
    .itemcount 204703,<1
    #completewith RiteofWisdom
    >>击杀 |cRXP_ENEMY_刺背干涉者|r，拾取 |cRXP_LOOT_被砍下的野猪人的头|r
    .collect 206994,1 ---Severed Quilboar Head (1)
    .mob 刺背干涉者
    .train 403475,1
step
    #completewith next
    >>击杀 |cRXP_ENEMY_刺背干涉者|r
    .complete 833,1 --Bristleback Interloper (8)
    .mob 刺背干涉者
step
    #label RiteofWisdom
    .goto Mulgore,61.45,21.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_先祖之魂|r 交谈
    .turnin 773 >>交任务：智慧仪祭
    .accept 775 >>接任务：雷霆崖之旅
    .target 先祖之魂
step << Warrior
    #season 2
    .itemcount 204688,<1
    .itemcount 204703,<1
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
    >>击杀 |cRXP_ENEMY_刺背干涉者|r，拾取 |cRXP_LOOT_被砍下的野猪人的头|r
    .complete 833,1 --Bristleback Interloper (8)
    .collect 206994,1 ---Severed Quilboar Head (1)
    .mob 刺背干涉者
    .train 403475,1
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
    >>击杀 |cRXP_ENEMY_刺背干涉者|r
    .complete 833,1 --Bristleback Interloper (8)
    .mob 刺背干涉者
step
    .goto Mulgore,59.85,25.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_博学者诺拉·暴雨图腾|r 交谈
    .turnin 833 >>交任务：神圣的墓地
    .target 博学者诺拉·暴雨图腾
step
    #completewith next
    >>|cRXP_WARN_收集齐马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
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
	>>击杀 |cRXP_ENEMY_猛鹫|r, 获取 |cRXP_LOOT_羽毛|r
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob 消瘦的猛鹫
    .mob 猛鹫
    .mob 长爪猛鹫
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
    >>|cRXP_WARN_收集齐马兹拉纳其所需的物品|r
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
step
    #xprate <1.5
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
    .xp 9+3020 >>刷怪至9级至少3020/6500点经验
    .isQuestComplete 761
    .isQuestComplete 766
step
    #xprate <1.5
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
    .xp 9+3720 >>刷怪至9级至少3720/6500点经验
    .isQuestComplete 761
    .isQuestNotComplete 766
step
    #xprate <1.5
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
    .xp 9+3700 >>刷怪至9级至少3700/6500点经验
    .isQuestComplete 766
    .isQuestNotComplete 761
step
    .isQuestNotComplete 761
    .isQuestNotComplete 766
    #xprate <1.5
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
    .xp 9+4400 >>刷怪至9级至少4400/6500点经验
step
    #xprate >1.49
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
    .xp 9+1280 >>刷怪至9级至少1280/6500点经验
    .isQuestComplete 761
    .isQuestComplete 766
step
    #xprate >1.49
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
    .xp 9+2330 >>刷怪至9级至少2330/6500点经验
    .isQuestComplete 761
    .isQuestNotComplete 766
step
    #xprate >1.49
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
    .xp 9+2300 >>刷怪至9级至少2300/6500点经验
    .isQuestComplete 766
    .isQuestNotComplete 761
step
    .isQuestNotComplete 761
    .isQuestNotComplete 766
    #xprate >1.49
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
    .xp 9+3350 >>刷怪至9级至少3350/6500点经验
step << !Druid
    #completewith Bloodhoofturnins1
    .hs >>使用炉石返回血蹄村
    .use 6948
    .bindlocation 222,1
    .subzoneskip 222
step << Druid
    #softcore
    #completewith Bloodhoofturnins1
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << Druid
    #hardcore
    #completewith Bloodhoofturnins1
    .goto Mulgore,47.33,57.17,120 >> 返回血蹄村
    .subzoneskip 222
step
    .goto Mulgore,46.62,61.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板考乌斯|r 交谈
    .vendor >> 出售垃圾物品
    .target 旅店老板考乌斯
    .isQuestAvailable 870
step
    .goto Mulgore,46.75,60.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯考恩·白云|r 交谈
    .turnin 770 >>交任务：恶魔之伤
    .target 斯考恩·白云
    .isOnQuest 770
step << Warrior
    #season 2
    .itemcount 204703,<1
    .goto Mulgore,46.29,61.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与血蹄村的 |cRXP_FRIENDLY_瓦泰亚·森蹄|r 交谈
    >>用收集到的 |cRXP_LOOT_头颅|r 兑换 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target 瓦泰亚·森蹄
    .train 403475,1
step << Warrior
    #season 2
    .use 204688 >>使用 |T134455:0|t[符文碎片] 制作 |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step << Warrior
    #season 2
    .train 403475 >>使用 |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .use 204703
    .itemcount 204703,1
step << Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贝恩·血蹄|r、|cRXP_FRIENDLY_卢尔·鹰爪|r、|cRXP_FRIENDLY_穆尔|r 和 |cRXP_FRIENDLY_哈肯|r 交谈
    .turnin 746 >>交任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.35,62.02
    .turnin 758 >>交任务：净化雷角之井
    .timer 8,净化雷角之井剧情演出
    .accept 759 >>接任务：蛮鬃图腾
    .target +穆尔·雷角
    .goto Mulgore,48.54,60.38
    .turnin 761 >>交任务：猎捕猛鹫
    .target +哈肯·风之图腾
    .goto Mulgore,48.71,59.32
    .isQuestComplete 761
step << Tauren
    #label Bloodhoofturnins1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贝恩·血蹄|r、|cRXP_FRIENDLY_卢尔·鹰爪|r 和 |cRXP_FRIENDLY_穆尔|r 交谈
    .turnin 746 >>交任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.35,62.02
    .turnin 758 >>交任务：净化雷角之井
    .timer 8,净化雷角之井剧情演出
    .accept 759 >>接任务：蛮鬃图腾
    .target +穆尔·雷角
    .goto Mulgore,48.54,60.38
step << !Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贝恩·血蹄|r、|cRXP_FRIENDLY_卢尔·鹰爪|r 和 |cRXP_FRIENDLY_哈肯·风之图腾|r 交谈
    .turnin 746 >>交任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.35,62.02
    .turnin 761 >>交任务：猎捕猛鹫
    .target +哈肯·风之图腾
    .goto Mulgore,48.71,59.32
    .isQuestComplete 761
step << !Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贝恩·血蹄|r 和 |cRXP_FRIENDLY_卢尔·鹰爪|r 交谈
    .turnin 746 >>交任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.35,62.02
step
    #optional
    #label Bloodhoofturnins1
step
    #completewith AlphaTeeth
    .destroy 4702 >> |cRXP_WARN_可以从背包中摧毁|r |T134707:0|t[勘察员的锄头]|cRXP_WARN_，之后不再需要它们|r
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_肯纳|r 交谈
    >>|cRXP_BUY_购买|r |T132384:0|t[重弹丸] |cRXP_BUY_。|r << Hunter
    .collect 2519,1000 << Hunter --Heavy Shot (1000)
    .target 肯纳·鹰眼
step
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_茂尔|r 交谈
    .turnin 766 >>交任务：马兹拉纳其
    .target 茂尔·祈雨
    .isQuestComplete 766
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克朗|r 交谈
    .trainer >> 训练职业技能
    .accept 1505 >>接任务：老兵犹塞克
    .target 克朗·石蹄
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳姆|r 交谈
    .accept 2984 >>接任务：火焰的召唤
    .trainer >> 训练职业技能
    .target 纳姆·逐星
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文|r 交谈
    .accept 6061 >>接任务：驯服野兽 << Tauren
    >>|cRXP_WARN_其他种族的猎人若尚未学会驯服野兽，需要先完成自己出生地区的猎人职业任务|r << !Tauren
    .trainer >> 训练职业技能
    .target 雅文·刺鬃
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_根妮亚·符文图腾|r 交谈
    .trainer >> 训练职业技能
    .accept 5928 >> 接任务：响应召唤
    .target 根妮亚·符文图腾
    .isQuestAvailable 5928
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_根妮亚·符文图腾|r 交谈
    .train 8924 >> 训练职业技能
    .target 根妮亚·符文图腾
step << Hunter Tauren
    #loop
    .goto Mulgore,39.38,57.43,0
    .goto Mulgore,42.87,54.88,50,0
    .goto Mulgore,40.73,55.60,50,0
    .goto Mulgore,39.38,57.43,50,0
    .use 15914 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_，目标是|r |cRXP_ENEMY_成年平原陆行鸟|r|cRXP_WARN_，站在最远施法距离。|r
    .complete 6061,1 --Tame an Adult Plainstrider (1)
    .mob 成年平原陆行鸟
step << Hunter Tauren
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文|r 交谈
    .turnin 6061 >>交任务：驯服野兽
    .accept 6087 >>接任务：驯服野兽
    .target 雅文·刺鬃
step << Hunter Tauren
    #loop
    .goto Mulgore,49.49,42.27,0
    .goto Mulgore,47.18,50.15,50,0
    .goto Mulgore,46.65,47.22,50,0
    .goto Mulgore,48.18,45.27,50,0
    .goto Mulgore,49.49,42.27,50,0
    .use 15915 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_，目标是|r |cRXP_ENEMY_草原捕食者|r|cRXP_WARN_，站在最远施法距离。|r
    .complete 6087,1 --Tame a Prairie Stalker (1)
    .mob 草原捕食者
step << Hunter Tauren
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文|r 交谈
    .turnin 6087 >>交任务：驯服野兽
    .accept 6088 >>接任务：驯服野兽
    .target 雅文·刺鬃
step << Hunter Tauren
    #loop
    .goto Mulgore,47.25,41.33,0
    .goto Mulgore,47.25,41.33,80,0
    .goto Mulgore,45.41,40.29,80,0
    .goto Mulgore,51.57,44.40,80,0
    .use 15916 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_，目标是|r |cRXP_ENEMY_猛鹫|r |cRXP_WARN_，站在最远施法距离。如果它将你击倒，立即重新施放|r
    >>|cRXP_WARN_如果驯服失败且驯兽棒的使用次数耗尽，就放弃任务，重新接取后再回来|r
    .complete 6088,1 --Tame a Swoop (1)
    .mob 猛鹫
step << Hunter Tauren
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文|r 交谈
    .turnin 6088 >>交任务：驯服野兽
    .accept 6089 >>接任务：训练野兽
    .target 雅文·刺鬃
step
    .goto Mulgore,47.63,61.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加纳|r 交谈
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r << Shaman/Druid
    >>|cRXP_BUY_购买|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_。|r << Warrior
    .collect 1179,20,818,1 << Shaman/Druid --Ice Cold Milk (20)
    .collect 4541,20,818,1 << Warrior --Freshly Baked Bread (20)
    .money <0.05
    .target 加纳·麦风
step
    .goto Mulgore,46.75,60.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯考恩·白云|r 交谈
    .accept 861 >>接任务：猎人之道
    .target 斯考恩·白云
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
    .turnin 751 >> 交任务：被破坏的货车
    .accept 764 >> 接任务：风险投资公司
    .accept 765 >> 接任务：菲兹普罗克主管
	.unitscan 摩林·云行者
step
    #completewith AlphaTeeth
    >>击杀 |cRXP_ENEMY_平原徘徊者|r，拾取它们的 |cRXP_LOOT_爪子|r
    .complete 861,1 --Flatland Prowler Claw (4)
    .mob 平原徘徊者
step << Hunter
    .spellmissing 1515
    #completewith next
    .cast 1515 >>驯服一只 |cRXP_ENEMY_草原狼前锋|r
    >>|cRXP_WARN_这样就能训练|r |T132278:0|t[撕咬（等级2）]
    .mob 草原狼前锋
step << Tauren
    #loop
    .goto Mulgore,66.34,67.01,0
    .goto Mulgore,67.19,63.78,50,0
    .goto Mulgore,66.34,67.01,50,0
    .goto Mulgore,63.86,66.31,50,0
    .goto Mulgore,61.81,65.52,50,0
    .goto Mulgore,61.61,61.32,50,0
    .goto Mulgore,63.58,60.51,50,0
    .goto Mulgore,65.56,59.37,50,0
    .goto Mulgore,67.62,59.06,50,0
    >>击杀该区域的 |cRXP_ENEMY_草原狼前锋|r, 搜刮 |cRXP_LOOT_牙齿|r
    .complete 759,1 --Prairie Alpha Tooth (8)
    .mob 草原狼前锋
step
    #optional
    #label AlphaTeeth

step << Tauren
    #softcore
	#completewith Thunderhorn2
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << Tauren
    #hardcore
    #completewith Thunderhorn2
    .goto Mulgore,46.5,55.5,150 >> 返回血蹄村
    .subzoneskip 222
step << Tauren
    #label Thunderhorn2
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_穆尔|r 交谈
    .turnin 759 >>交任务：蛮鬃图腾
    .accept 760 >>接任务：净化蛮鬃之井
    .target 穆尔·雷角
step
    #completewith CampTFP
    .goto Mulgore,69.6,60.4,100,0
    .zone The Barrens >> 前往贫瘠之地
step << !Druid
    .goto The Barrens,44.45,59.15
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r 交谈
    .fp Camp Taurajo >> 开通陶拉祖营地的飞行点
	.target 欧姆萨·雷角
    .isQuestAvailable 848
step << Druid
    .goto The Barrens,44.45,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r 交谈
    .fp Camp Taurajo >> 开通陶拉祖营地的飞行点
    .fly Thunder Bluff >>飞往雷霆崖
    .target 欧姆萨·雷角
    .isQuestAvailable 848
step
    #optional
    #label CampTFP
step << Druid
    .goto Thunder Bluff,45.83,64.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将你的炉石设置为雷霆崖
    .target 旅店老板帕拉
    .bindlocation 1638
    .isQuestAvailable 5932
step << Druid
    .goto Thunder Bluff,78.1,28.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈缪尔·符文图腾|r 交谈
    .accept 886 >>接任务：贫瘠之地的绿洲
    .target 大德鲁伊哈缪尔·符文图腾
step << Druid
    #completewith next
    .goto Thunder Bluff,71.60,30.15,80 >>前往长者高地
step << Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克|r交谈
    .goto Thunder Bluff,76.7,27.3
    .turnin 5928 >>交任务：响应召唤
    .accept 5922 >>接任务：月光林地
    .target 图拉克·符文图腾
    .isOnQuest 5928
step << Druid
    .goto Thunder Bluff,76.7,27.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克|r交谈
    .accept 5922 >>接任务：月光林地
    .target 图拉克·符文图腾
step << Druid
    #completewith next
    .cast 18960 >>|cRXP_WARN_施放|r |T135758:0|t[传送:月光林地]
    .zoneskip Moonglade
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德迪利特|r 交谈
    .turnin 5922 >>交任务：月光林地
    .accept 5930 >>接任务：巨熊之灵
    .target 德迪利特·星焰
step << Druid
    .goto Moonglade,39.2,27.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巨熊之灵|r
    .complete 5930,1 --Seek out the Great Bear Spirit and learn what it has to share with you about the nature of the bear. (1)
    .target 巨熊之灵
    .skipgossip
step << Druid
    #completewith next
    .cast 18960 >>|cRXP_WARN_施放|r |T135758:0|t[传送: 月光林地]
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德迪利特|r 交谈
    .turnin 5930 >>交任务：巨熊之灵
    .accept 5932 >>接任务：返回雷霆崖
    .target 德迪利特·星焰
step << Druid
    #completewith DruidBearForm
    .hs >> 使用炉石返回雷霆崖
    .bindlocation 1638,1
    .zoneskip Thunder Bluff
    .cooldown item,6948,>0
    .use 6948
step << Druid
    #completewith next
    .goto Moonglade,44.29,45.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布瑟恩|r 交谈
    .fly Thunder Bluff >> 飞往雷霆崖
    .target 布瑟恩·草风
    .zoneskip Thunder Bluff
    .cooldown item,6948,<0
step << Druid
    #label DruidBearForm
    .goto Thunder Bluff,76.7,27.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克|r交谈
    .turnin 5932 >>交任务：返回雷霆崖
    .accept 6002 >>接任务：身心之力
    .target 图拉克·符文图腾
step << Druid
    #completewith next
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r 交谈
    .fly Camp Taurajo >>飞往陶拉祖营地
    .target 塔尔
    .zoneskip The Barrens
step << Druid
    .goto The Barrens,42.00,60.86
    .use 15710 >>|cRXP_WARN_使用|r |T132857:0|t[赛纳里奥银尘] |cRXP_WARN_，在|r |cRXP_PICK_枭兽石|r 处使用
    >>击杀刷新出现的 |cRXP_ENEMY_月爪枭兽|r，然后与 |cRXP_FRIENDLY_月爪枭兽的灵魂|r 交谈
    >>|cRXP_WARN_小心！|cRXP_ENEMY_月爪枭兽|r 会施放|r |T132152:0|t[痛击] |cRXP_WARN_（获得2次额外攻击，每10秒一次）|r
    >>|cRXP_WARN_避开该区域的|r |cRXP_ENEMY_电角蜥蜴|r |cRXP_WARN_，不要靠近它们|r
    .complete 6002,1 --Face Lunaclaw and earn the strength of body and heart it possesses. (1)
    .mob 月爪枭兽
    .target 月爪枭兽的灵魂
    .skipgossip
step << Tauren
    .goto The Barrens,44.9,58.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基尔格·锐角|r 交谈
    .accept 854 >>接任务：十字路口之旅
    .target 基尔格·锐角
step
    #completewith next
    .subzone 380 >>向北前往十字路口
step
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加|r 交谈
    .turnin 886 >>交任务：贫瘠之地的绿洲 << Druid
    .accept 870 >>接任务：遗忘之池
    .target 图加·符文图腾
step << Tauren
    .goto The Barrens,51.5,30.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 交谈
    .turnin 854 >>交任务：十字路口之旅
    .target 索克
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫布瑞姆|r 交谈
    .accept 848 >>接任务：菌类孢子
    .target 药剂师赫布瑞姆
step
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 交谈
    .fp The Crossroads >> 开通十字路口的飞行点
    .target 迪弗拉克
    .isQuestAvailable 848
step << Tauren
    .goto The Barrens,51.21,29.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加翰·鹰翼|r 交谈
    .accept 6361 >>接任务：一捆兽皮
    .target 加翰·鹰翼
step
    #completewith next
    >>在遗忘之池周围采集 |cRXP_LOOT_饱满的蘑菇|r
    >>|cRXP_WARN_采集蘑菇时，尽量远离 |cRXP_ENEMY_科卡尔半人马|r |cRXP_WARN_。它们是12-14级|r
    >>|cRXP_WARN_此任务的后续奖励是强力武器 |cRXP_FRIENDLY_锅炉搅拌器|r |cRXP_WARN_。如果不打算使用它，可以暂时跳过此任务|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    .goto The Barrens,45.06,22.54
    >>潜入水下，前往 |cRXP_PICK_气泡裂隙|r
    .complete 870,1 --Explore the waters of the Forgotten Pools
step
    #loop
    .goto The Barrens,45.2,23.3,0
    .goto The Barrens,45.2,23.3,40,0
    .goto The Barrens,45.2,22.0,40,0
    .goto The Barrens,44.6,22.5,40,0
    .goto The Barrens,43.9,24.4,40,0
    >>在遗忘之池周围采集 |cRXP_LOOT_饱满的蘑菇|r
    >>|cRXP_WARN_尽量远离该区域的 |cRXP_ENEMY_科卡尔半人马|r |cRXP_WARN_。它们是12-14级|r
    >>|cRXP_WARN_此任务的后续奖励是强力武器 |cRXP_FRIENDLY_锅炉搅拌器|r |cRXP_WARN_。如果不打算使用它，可以暂时跳过此任务|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    #softcore
	#completewith ZamahPickup
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #hardcore
    #completewith ZamahPickup
    .subzone 380 >> 返回十字路口
step
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加|r 交谈
    .turnin 870 >>交任务：遗忘之池
    .accept 877 >>接任务：死水绿洲
    .target 图加·符文图腾
    .isQuestComplete 870
step
    #optional
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加|r 交谈
    .accept 877 >>接任务：死水绿洲
    .target 图加·符文图腾
    .isQuestTurnedIn 870
step
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德|r 交谈
    .home >>将炉石绑定到十字路口
    .target 旅店老板伯兰德·草风
    .bindlocation 380
    .isQuestAvailable 853
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫布瑞姆|r 交谈
    >>|cRXP_WARN_等待剧情演出结束|r
    >>|cRXP_WARN_接取后会开启45分钟限时任务|r
    .turnin 848 >>交任务：菌类孢子
    .timer 7,菌类孢子剧情演出
    .accept 853 >>接任务：药剂师扎玛
    .target 药剂师赫布瑞姆
    .isQuestComplete 848
step
    #optional
    #label ZamahPickup
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫布瑞姆|r 交谈
    >>|cRXP_WARN_接取后会开启45分钟限时任务|r
    .accept 853 >>接任务：药剂师扎玛
    .target 药剂师赫布瑞姆
    .isQuestTurnedIn 848
step << Tauren
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 交谈
    .turnin 6361 >>交任务：一捆兽皮
    .accept 6362 >>接任务：飞往雷霆崖
    .target 迪弗拉克
step
    #completewith RideToTB
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 交谈
    .fly Thunder Bluff >>飞往雷霆崖
    .target 迪弗拉克
    .zoneskip Thunder Bluff
step
    #sticky
    #completewith CauldronStirrer
    +|cRXP_WARN_这是限时任务，请勿挂机；按本指南路线，预计会在接取后约5–10分钟交任务|r
    .isOnQuest 853
step
    #label RideToTB
    .goto Thunder Bluff,45.6,55.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安哈努|r 交谈 << Tauren
    .turnin 6362 >>交任务：飞往雷霆崖 << Tauren
    .accept 6363 >>接任务：双足飞龙管理员塔尔 << Tauren
    .target 安哈努 << Tauren
    .goto Thunder Bluff,45.60,55.90,15 >>抵达雷霆崖 << !Tauren
step << Hunter
    .goto Thunder Bluff,61.3,80.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_梅洛·石蹄|r 交谈
    .turnin 861 >>交任务：猎人之道
    .accept 860 >>接任务：瑟格拉·黑棘
    .target 梅洛·石蹄
    .isQuestComplete 861
step << Hunter
    .goto Thunder Bluff,61.3,80.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_梅洛·石蹄|r 交谈
    .accept 860 >>接任务：瑟格拉·黑棘
    .target 梅洛·石蹄
    .isQuestTurnedIn 861
step << Hunter Tauren
	.goto Thunder Bluff,57.4,89.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_浩特|r 交谈
	.turnin 6089 >> 交任务：训练野兽
    .target 浩特·雷角
step << Hunter
    .spellmissing 1515
    .goto Thunder Bluff,54.08,84.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫苏瓦|r 交谈
    .train 24547 >>训练宠物技能
    .target 赫苏瓦·雷角
step << Hunter
    .spellmissing 1515
    #completewith CauldronStirrer
    +|cRXP_WARN_将|r |T132162:0|t[野兽训练] |cRXP_WARN_拖到动作条上，再为宠物传授技能|r
step << Druid
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安塞瓦|r 交谈
    .train 199 >>学习双手锤
    .target 安塞瓦
    .money <0.1154
step << Warrior/Hunter
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安塞瓦|r 交谈
    .train 227 >>学习法杖
    .target 安塞瓦
step
    .goto Thunder Bluff,37.8,59.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊恩|r 交谈
    .accept 744 >>接任务：准备典礼
    .target 伊恩·鹰爪
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴通·阴影图腾|r 交谈
    >>|cRXP_WARN_他|r |T132320:0|t[潜行中]
    .accept 76156 >>接任务：大地母亲与匿同在
    .target 巴通·阴影图腾
    .train 410104,1
    .xp <4,1
step
    #completewith next
    .goto Thunder Bluff,28.14,32.97,40,0
    .goto Thunder Bluff,28.51,28.95,10 >> 前往灵魂高地，进入幻视之池
step
    #label CauldronStirrer
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师扎玛|r 交谈
    .turnin 853 >>交任务：药剂师扎玛
    .target 药剂师扎玛
    .isOnQuest 853
step
    #optional
    #completewith ReturntoJahan
    +|cRXP_WARN_装备|r |T135145:0|t[锅炉搅拌器]
    .use 5340
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
    .itemcount 5340,1
step << Warrior
    #season 2
    #completewith next
    .goto Thunder Bluff,28.73,18.00,-1
    .goto Thunder Bluff,26.19,18.65,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奈塔里·傲翼|r 和 |cRXP_FRIENDLY_穆阿特|r 在灵魂高地交谈
    +等 |cRXP_FRIENDLY_穆阿特|r 变为敌对后将其击杀
    .target 奈塔里·傲翼
    .target 穆阿特
    .skipgossip
    --Gossipoption
step << Warrior
    #season 2
    .goto Thunder Bluff,28.73,18.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奈塔里·傲翼|r 交谈
    >>从她那里获得 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target 奈塔里·傲翼
    .train 425447,1
    .skipgossip
step << Warrior
    #season 2
    .train 425447 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .use 204716
    .itemcount 204716,1
step
    #label ReturntoJahan
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r 交谈
    .turnin 6363 >>交任务：双足飞龙管理员塔尔 << Tauren
    .accept 6364 >>接任务：向加翰回复 << Tauren
    .target 塔尔
    .fp Thunder Bluff >>开通雷霆崖的飞行点 << !Tauren
step
    .goto Thunder Bluff,60.0,51.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_凯恩·血蹄|r 交谈
    .turnin 775 >>交任务：雷霆崖之旅
    .accept 776 >>接任务：大地之母仪祭
    .target 凯恩·血蹄
step << Druid
    #completewith next
    .goto Thunder Bluff,71.60,30.15,80 >>前往长者高地
step << Druid
    .goto Thunder Bluff,76.477,27.221
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克|r交谈
    .turnin 6002 >>交任务：身心之力
    .target 图拉克·符文图腾
step
    #ah
    .goto Thunder Bluff,44.43,43.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莫兰塔|r 交谈
    >>|cRXP_WARN_这会解锁一个简单的任务。如果已经有2个专业，就跳过此步骤|r
    .train 8613 >>学习 |T134366:0|t[剥皮]
    .target 莫兰塔
step
    #ah
    .goto Thunder Bluff,44.39,44.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔伦|r 交谈
    .accept 768 >> 接任务：收集皮革
    .target 维尔伦·陆行者
    .skill skinning,<1,1
step
    #ah
    .goto Thunder Bluff,40.39,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拍卖师斯塔比|r 交谈
    >>|cRXP_BUY_购买十二张|r |T134252:0|t[轻皮] |cRXP_BUY_，从拍卖行购买|r
    .collect 2318,12,768,1 --Light Leather (12)
    .target 拍卖师斯塔比
    .skill skinning,<1,1
step
    #ah
    .goto Thunder Bluff,44.39,44.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔伦|r 交谈
    .turnin 768 >> 交任务：收集皮革
    .target 维尔伦·陆行者
    .skill skinning,<1,1
step << Hunter
    .goto Thunder Bluff,52.32,47.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡加|r 交谈
    >>|cRXP_BUY_从她那里购买|r |T133972:0|t[硬肉干] |cRXP_BUY_喂给宠物|r
    .collect 117,5,744,1 --Tough Jerky (5)
    .target 卡加·迷雾行者
step << Shaman
    #season 2
    #loop
    #completewith VentureCoKills
    >>打开矿洞内及另一侧外面的 |cRXP_PICK_冲击补给品货车|r，拾取 |cRXP_LOOT_爆盐采矿炸弹|r
    >>|cRXP_WARN_尽量待在洞穴上层|r
    .complete 76156,1 --Seaforium Mining Charge (5)
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
	#era/som
    #completewith Fizsprocket1
    .goto Mulgore,61.51,47.29,20 >> 前往风险投资公司矿井
step << Shaman
    #season 2
    #completewith next
    >>击杀 |cRXP_ENEMY_风险投资公司工人|r 和 |cRXP_ENEMY_风险投资公司主官|r
    .complete 764,1 --Venture Co. Worker (14)
    .mob +风险投资公司工人
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob +风险投资公司主官
step << Shaman
    #season 2
    #label Fizsprocket1
    .goto Mulgore,64.95,43.33
    >>击杀 |cRXP_ENEMY_菲兹普罗克主管|r，拾取 |cRXP_LOOT_记录板|r
    >>|cRXP_WARN_跑进矿洞，沿右侧（东侧）前进即可找到他|r
    .complete 765,1 --Fizsprocket's Clipboard (1)
    .mob 菲兹普罗克主管
step << Shaman
    #season 2
    #label VentureCoKills
    #loop
	.goto Mulgore,61.35,47.55,0
	.goto Mulgore,61.35,47.55,25,0
	.goto Mulgore,60.10,47.84,25,0
	.goto Mulgore,59.50,48.21,25,0
	.goto Mulgore,59.68,48.85,25,0
	.goto Mulgore,60.14,49.14,25,0
	.goto Mulgore,62.01,48.74,25,0
	.goto Mulgore,61.89,47.84,25,0
    >>击杀 |cRXP_ENEMY_风险投资公司工人|r 和 |cRXP_ENEMY_风险投资公司主官|r
    .complete 764,1 --Venture Co. Worker (14)
    .mob +风险投资公司工人
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob +风险投资公司主官
step << Shaman
    #season 2
    #loop
    .goto Mulgore,63.77,43.97,15,0
    .goto Mulgore,62.81,42.81,15,0
    .goto Mulgore,60.38,42.78,15,0
    .goto Mulgore,61.64,41.33,15,0
    .goto Mulgore,63.51,39.29,15,0
    .goto Mulgore,63.39,40.80,15,0
--  .goto Mulgore,66.53,39.47,15,0 --Very deep inside the top of the mine, skipping
    .goto Mulgore,60.99,37.00,15,0
    .goto Mulgore,59.64,36.05,15,0 --Outside
    .goto Mulgore,61.72,35.15,15,0 --Outside
    >>打开矿洞内及另一侧外面的 |cRXP_PICK_冲击补给品货车|r，拾取 |cRXP_LOOT_爆盐采矿炸弹|r
    >>|cRXP_WARN_尽量待在洞穴上层|r
    .complete 76156,1 --Seaforium Mining Charge (5)
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #completewith next
    .zone Thunder Bluff >> 前往雷霆崖
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴通·阴影图腾|r 交谈
    >>|cRXP_WARN_他|r |T132320:0|t[潜行中]
    .turnin 76156 >>交任务：大地母亲与匿同在
    .accept 76160 >>接任务：大地母亲与匿同在
    .target 巴通·阴影图腾
    .train 410104,1
    .xp <4,1
step
    #sticky
    #completewith ThunderBluff
    >>留意 |cRXP_ENEMY_鬼嚎|r，击杀后拾取它的 |T134358:0|t[|cRXP_LOOT_恶魔之伤|r]，使用它接取任务
    >>|cRXP_WARN_如果找不到它，就跳过此步骤|r
    .collect 4854,1,770 --Collect Demon Scarred Cloak
    .accept 770 >>接任务：恶魔之伤
    .use 4854
    .unitscan 鬼嚎
step << Druid
    #season 2
    #completewith ProwlerClaws
    >>击杀 |cRXP_ENEMY_平原徘徊者|r 和 |cRXP_ENEMY_草原狼前锋|r，拾取 |T134903:0|t[|cRXP_FRIENDLY_怒熊神像|r]
    .collect 206954,1 --Idol of Ursine Rage (1)
    .mob 平原徘徊者
    .mob 草原狼前锋
    .train 410025,1
step
    #completewith Arrachea
    >>击杀 |cRXP_ENEMY_平原徘徊者|r，拾取它们的 |cRXP_LOOT_爪子|r
    .complete 861,1 --Flatland Prowler Claw (4)
    .mob 平原徘徊者
step << Shaman
    #season 2
    #completewith next
    >>击杀 |cRXP_ENEMY_风怒女巫|r，拾取它们的 |cRXP_LOOT_碧蓝色的羽毛|r
    >>击杀 |cRXP_ENEMY_风怒女族长|r，拾取它们的 |cRXP_LOOT_古铜色的羽毛|r
    .complete 744,1 --Azure Feather (6)
    .mob +风怒女巫
    .complete 744,2 --Bronze Feather (6)
    .mob +风怒女族长
    .train 410104,1
step << Shaman
    #season 2
    #loop
    .goto Mulgore,37.18,12.36,0
    .goto Mulgore,38.80,16.03,10,0
    .goto Mulgore,37.79,10.86,10,0
    .goto Mulgore,38.01,10.21,10,0
    .goto Mulgore,38.55,8.10,10,0
    .goto Mulgore,38.06,7.47,10,0
    .goto Mulgore,37.36,9.99,10,0
    .goto Mulgore,37.31,10.41,10,0
    .goto Mulgore,35.80,11.21,10,0
    .goto Mulgore,36.20,11.41,10,0
    .goto Mulgore,36.21,12.60,10,0
    .goto Mulgore,36.55,12.84,10,0
    .goto Mulgore,36.65,13.26,10,0
    .goto Mulgore,37.18,12.36,10,0
    >>拾取地上的 |cRXP_LOOT_风怒球果|r
    .collect 206170,8,76160,1 --Windfury Cone (8)
    .train 410104,1
step << Shaman
    #season 2
    .isOnQuest 76160
    >>使用 |T134535:0|t[研钵和捣杵] 研磨8个 |cRXP_LOOT_风怒球果|r，制作 |cRXP_LOOT_松树药膏|r
    .use 206176
    .complete 76160,1
    .train 410104,1
    .xp <4,1

step
    #loop
    .goto Mulgore,31.7,28.2,0
    .goto Mulgore,30.2,19.5,0
    .goto Mulgore,31.7,28.2,40,0
    .goto Mulgore,30.2,19.5,40,0
    >>击杀 |cRXP_ENEMY_风怒女巫|r，拾取它们的 |cRXP_LOOT_碧蓝色的羽毛|r
    >>击杀 |cRXP_ENEMY_风怒女族长|r，拾取它们的 |cRXP_LOOT_古铜色的羽毛|r
    .complete 744,1 --Azure Feather (6)
    .mob +风怒女巫
    .complete 744,2 --Bronze Feather (6)
    .mob +风怒女族长
step << Tauren
    .goto Mulgore,42.5,13.8
    .use 5416 >>|cRXP_WARN_使用|r |T135139:0|t[蛮鬃之井净化图腾] |cRXP_WARN_，在水井处使用|r
    .complete 760,1 --Cleanse the Wildmane Well (1)
step << Warrior/Hunter
    #season 2
    #loop
    .goto Mulgore,52.6,12.2,0
    .goto Mulgore,52.6,12.2,90,0
    .goto Mulgore,48.6,16.1,90,0
    .goto Mulgore,51.8,33.8,90,0
    .goto Mulgore,56.2,32.9,90,0
    >>击杀 |cRXP_ENEMY_阿兰其亚|r（大型黑色科多兽），拾取 |cRXP_LOOT_科多兽角|r << !Warrior !Hunter
    >>击杀 |cRXP_ENEMY_阿兰其亚|r（大型黑色科多兽），拾取 |cRXP_LOOT_科多兽角|r 和 |T134419:0|t[|cRXP_FRIENDLY_狂怒雷霆符文|r] << Warrior
    >>击杀 |cRXP_ENEMY_阿兰其亚|r（大型黑色科多兽），拾取 |cRXP_LOOT_科多兽角|r 和 |T134419:0|t[|cRXP_FRIENDLY_爆炸射击符文|r] << Hunter
    >>|cRXP_WARN_它会沿莫高雷北部顺时针巡逻|r
    .complete 776,1 --Horn of Arra'chea (1)
    .collect 204809,1 << Warrior --Rune of Furious Thunder(1)
    .collect 206169,1 << Hunter --Rune of Explosive Shot (1)
    .unitscan 阿兰其亚
    .train 403476,1 << Warrior
    .train 410123,1 << Hunter
    --VV .line
step << Warrior
    #season 2
    .train 403476 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂怒雷霆符文|r]
    .use 204809
    .itemcount 204809,1
step << Hunter
    #season 2
    .train 410123 >>使用 |T134419:0|t[|cRXP_FRIENDLY_爆炸射击符文|r]
    .use 206169
    .itemcount 206169,1
step
    #label Arrachea
    #loop
    .goto Mulgore,52.6,12.2,0
    .goto Mulgore,52.6,12.2,90,0
    .goto Mulgore,48.6,16.1,90,0
    .goto Mulgore,51.8,33.8,90,0
    .goto Mulgore,56.2,32.9,90,0
    >>击杀 |cRXP_ENEMY_阿兰其亚|r（大型黑色科多兽），拾取 |cRXP_LOOT_科多兽角|r
    >>|cRXP_WARN_它会沿莫高雷北部顺时针巡逻|r
    .complete 776,1 --Horn of Arra'chea (1)
    .unitscan 阿兰其亚
    --VV .line
step
    #label ProwlerClaws
    #loop
    .goto Mulgore,43.78,10.96,0
    .goto Mulgore,43.78,10.96,90,0
    .goto Mulgore,39.62,13.35,90,0
    .goto Mulgore,37.12,16.84,90,0
    .goto Mulgore,44.57,17.39,90,0
    .goto Mulgore,48.70,20.85,90,0
    >>击杀 |cRXP_ENEMY_平原徘徊者|r，拾取它们的 |cRXP_LOOT_爪子|r
    .complete 861,1 --Flatland Prowler Claw (4)
    .mob 平原徘徊者
step << Druid
    #season 2
    #loop
    .goto Mulgore,43.78,10.96,0
    .goto Mulgore,43.78,10.96,90,0
    .goto Mulgore,39.62,13.35,90,0
    .goto Mulgore,37.12,16.84,90,0
    .goto Mulgore,44.57,17.39,90,0
    .goto Mulgore,48.70,20.85,90,0
    >>击杀 |cRXP_ENEMY_平原徘徊者|r 和 |cRXP_ENEMY_草原狼前锋|r，拾取 |T134903:0|t[|cRXP_FRIENDLY_怒熊神像|r]
    .collect 206954,1 --Idol of Ursine Rage (1)
    .mob 平原徘徊者
    .mob 草原狼前锋
    .train 410025,1
step << Druid
    #season 2
    .equip 18,206954 >> |cRXP_WARN_装备|r |T134903:0|t[|cRXP_FRIENDLY_怒熊神像|r]
    .use 206954
    .train 410025,1
step << Druid
    #season 2
    #completewith next
    +|cRXP_WARN_将怒气保持在50点或以上，持续至少60秒，才能学习|r |T132135:0|t[割碎]
step << Druid
    #season 2
    .train 410025 >> |cRXP_WARN_使用|r |T134903:0|t[|cRXP_FRIENDLY_怒熊神像|r] |cRXP_WARN_学习|r |T132135:0|t[割碎]
    .use 206954
    .itemcount 206954,1
step
    #label ThunderBluff
    #completewith next
    .zone Thunder Bluff >> 返回雷霆崖
step
    #label RFCPickups1
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .accept 5722 >> 接任务：寻找背包
    .accept 5723 >> 接任务：试探敌人
    .target 拉哈罗
    .dungeon RFC
step
    .goto Thunder Bluff,60.0,51.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_凯恩·血蹄|r 交谈
    .turnin 776 >>交任务：大地之母仪祭
    .target 凯恩·血蹄
    .isQuestComplete 776
step
    .goto Thunder Bluff,37.8,59.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊恩|r 交谈
    .turnin 744 >>交任务：准备典礼
    .target 伊恩·鹰爪
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴通·阴影图腾|r 交谈
    >>|cRXP_WARN_他|r |T132320:0|t[潜行中]
    .turnin 76160 >>交任务：大地母亲与匿同在
    .accept 76240 >>接任务：大地母亲与匿同在
    .target 巴通·阴影图腾
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ah
    .goto Thunder Bluff,45.23,59.40,0
    .goto Thunder Bluff,40.41,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拍卖师斯塔比|r 交谈
    >>|cRXP_BUY_从拍卖行购买|r |T133894:0|t[新鲜的美味小鱼]|cRXP_BUY_。|r
    .collect 6291,1,76240,1 --Raw Brilliant Smallfish (1)
    .target 拍卖师斯塔比
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #completewith Sewa
    .goto Thunder Bluff,46.13,51.59,12,0
    .goto Thunder Bluff,47.09,50.07,4,0
    .goto Thunder Bluff,46.49,49.16,4,0
    .goto Thunder Bluff,46.05,49.74,4,0
    .goto Thunder Bluff,46.34,50.50,4,0
    .goto Thunder Bluff,55.78,47.02,15 >>前往 |cRXP_FRIENDLY_苏瓦·迷雾行者|r 处
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #sticky
    #label Kah
    .goto Thunder Bluff,56.13,46.39,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡尔·迷雾行者|r 交谈
    .train 7734 >>学习 |T136245:0|t[钓鱼]
    .target 卡尔·迷雾行者
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #label Sewa
    .goto Thunder Bluff,55.78,47.02,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_苏瓦·迷雾行者|r 交谈
    >>|cRXP_BUY_向她购买|r |T132932:0|t[鱼竿] |cRXP_BUY_和|r |T134335:0|t[闪光的小珠] |cRXP_BUY_。|r
    .collect 6256,1 --Fishing Pole (1)
    .collect 6529,1 --Shiny Bauble (1)
    .target 苏瓦·迷雾行者
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #completewith Fish
    #requires Kah
    #label Pole
    .equip 16,6256 >> |cRXP_WARN_装备|r |T132932:0|t[鱼竿]
    .use 6256
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #completewith Fish
    #requires Pole
    .cast 8087 >> |cRXP_WARN_将|r |T134335:0|t[闪光的小珠] |cRXP_WARN_挂到|r |T132932:0|t[鱼竿]
    .use 6529
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #label Fish
    #requires Kah
    .goto Thunder Bluff,40.42,58.55
    >>在池塘钓鱼，直到钓到 |T133894:0|t[|cRXP_LOOT_新鲜的美味小鱼|r]
    >>钓到鱼后，换回作战武器
    .collect 6291,1,76240,1 --Raw Brilliant Smallfish (1)
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>在 |cRXP_FRIENDLY_巴通·阴影图腾|r 面前，使用 |T132147:0|t[一套匕首] 制作 |T134007:0|t[鱼块]
    .complete 76240,1 --Fish Chunks (1)
    .use 206344
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴通·阴影图腾|r 交谈
    >>|cRXP_WARN_他|r |T132320:0|t[潜行中]
    .turnin 76240 >>交任务：大地母亲与匿同在
-- .train 410104 >>|cRXP_WARN_You will train|r |T236289:0|t[Lava Lash] |cRXP_WARN_and|r |T132147:0|t[Dual Wield] |cRXP_WARN_upon turnin|r
    .target 巴通·阴影图腾
    .train 410104,1
    .xp <4,1
step
    .goto Thunder Bluff,61.3,80.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_梅洛·石蹄|r 交谈
    .turnin 861 >>交任务：猎人之道
    .accept 860 >>接任务：瑟格拉·黑棘
    .target 梅洛·石蹄
step
    #completewith WildManeTurnIn
    .subzone 222 >>前往血蹄村
step
    .goto Mulgore,46.75,60.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯考恩·白云|r 交谈
    .turnin 770 >>交任务：恶魔之伤
    .target 斯考恩·白云
    .isOnQuest 770
step << Tauren
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_穆尔|r 交谈
    .turnin 760 >>交任务：净化蛮鬃之井
    .target 穆尔·雷角
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳姆|r 交谈
    .train 547 >> 训练职业技能
    .target 纳姆·逐星
    .xp <12,1
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_根妮亚·符文图腾|r 交谈
    .train 8936 >>学习职业技能
    .target 根妮亚·符文图腾
    .xp <12,1
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克朗|r 交谈
    .train 7384 >> 训练职业技能
    .target 克朗·石蹄
    .xp <12,1
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文|r 交谈
    .train 14281 >> 训练职业技能
    .target 雅文·刺鬃
    .xp <12,1
step
    #optional
    #label WildManeTurnIn
step
    #completewith Fizsprocket
    .goto Mulgore,61.51,47.29,20 >> 前往风险投资公司矿井
step
    #completewith next
    >>击杀 |cRXP_ENEMY_风险投资公司工人|r 和 |cRXP_ENEMY_风险投资公司主官|r
    .complete 764,1 --Venture Co. Worker (14)
    .mob +风险投资公司工人
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob +风险投资公司主官
step
    #label Fizsprocket
    .goto Mulgore,64.95,43.33
    >>击杀 |cRXP_ENEMY_菲兹普罗克主管|r，拾取 |cRXP_LOOT_记录板|r
    >>|cRXP_WARN_跑进矿洞，沿右侧（东侧）前进即可找到他|r
    .complete 765,1 --Fizsprocket's Clipboard (1)
    .mob 菲兹普罗克主管
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
    >>击杀 |cRXP_ENEMY_风险投资公司工人|r 和 |cRXP_ENEMY_风险投资公司主官|r
    .complete 764,1 --Venture Co. Worker (14)
    .mob +风险投资公司工人
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob +风险投资公司主官
step
    #xprate <1.5
    #loop
	.goto Mulgore,61.35,47.55,25,0
	.goto Mulgore,60.10,47.84,25,0
	.goto Mulgore,59.50,48.21,25,0
	.goto Mulgore,59.68,48.85,25,0
	.goto Mulgore,60.14,49.14,25,0
	.goto Mulgore,62.01,48.74,25,0
	.goto Mulgore,61.89,47.84,25,0
    .xp 11+7150 >>刷怪至11级至少7150/8700点经验
step
    #xprate >1.49
    #loop
	.goto Mulgore,61.35,47.55,25,0
	.goto Mulgore,60.10,47.84,25,0
	.goto Mulgore,59.50,48.21,25,0
	.goto Mulgore,59.68,48.85,25,0
	.goto Mulgore,60.14,49.14,25,0
	.goto Mulgore,62.01,48.74,25,0
	.goto Mulgore,61.89,47.84,25,0
    .xp 11+6375 >>刷怪至11级至少6375/8700点经验
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
    .turnin 764 >>交任务：风险投资公司
    .turnin 765 >>交任务：菲兹普罗克主管
	.unitscan 摩林·云行者
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳姆|r 交谈
    .train 547 >> 训练职业技能
    .target 纳姆·逐星
    .xp <12,1
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_根妮亚·符文图腾|r 交谈
    .train 8936 >>学习职业技能
    .target 根妮亚·符文图腾
    .xp <12,1
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克朗|r 交谈
    .train 5242 >> 训练职业技能
    .target 克朗·石蹄
    .xp <12,1
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文|r 交谈
    .train 14281 >> 训练职业技能
    .target 雅文·刺鬃
    .xp <12,1
step
    #completewith HidesTurnIn
    .hs >> 使用炉石返回十字路口
    .use 6948
    .bindlocation 380,1
    .subzoneskip 380
    .cooldown item,6948,>0
step
    #completewith next
    .subzone 378 >> 前往陶拉祖营地
    .cooldown item,6948,<0,1
step
    .goto The Barrens,44.45,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r 交谈
    .fly Crossroads >>飞往十字路口
    .target 欧姆萨·雷角
    .cooldown item,6948,<0,1
step
    #label HidesTurnIn
    .goto The Barrens,51.21,29.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加翰·鹰翼|r 交谈 << Tauren
    .turnin 6364 >>交任务：向加翰回复 << Tauren
    .target 加翰·鹰翼 << Tauren
    .goto The Barrens,51.21,29.05,20 >>抵达十字路口 << !Tauren
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫布瑞姆|r 交谈
    .accept 1492 >>接任务：码头管理员迪兹维格
    .target 药剂师赫布瑞姆
step
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 交谈
    .accept 871 >>接任务：野猪人的袭击
    .accept 5041 >>接任务：十字路口的补给品
    .target 索克
step
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克|r 交谈
    >>|cRXP_WARN_他在塔顶|r
    .accept 867 >>接任务：鹰身强盗
    .target 达索克·快刀
step
    .goto The Barrens,52.23,31.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉|r 交谈
    .turnin 860 >>交任务：瑟格拉·黑棘
    .accept 844 >>接任务：平原陆行鸟的威胁
    .target 瑟格拉·黑棘
step
    .goto The Barrens,51.93,30.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r 交谈
    .accept 869 >>接任务：偷钱的迅猛龙
    .target 加兹罗格
step << Shaman
    #completewith next
    >>查看是否有 |cRXP_PICK_老陈的空酒桶|r，就在 |cRXP_FRIENDLY_卡纳尔|r 身旁。拾取并使用它接取任务
    >>|cRXP_WARN_如果那里没有酒桶，可以稍后再来拿|r
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务：老陈的空酒桶
    .use 4926
step << Shaman
    .goto The Barrens,55.86,19.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡纳尔|r 交谈
    .turnin 2984 >>交任务：火焰的召唤
    .accept 1524 >>接任务：火焰的召唤
    .target 卡纳尔·菲斯
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
    .goto Durotar,39.16,58.56,10 >> 沿山路向上前往 |cRXP_FRIENDLY_泰尔夫|r 处
    >>|cRXP_WARN_小心别从山上掉下去，山路很窄。坠落可能会致命|r
step << Shaman
    #label CallofFire2
    .goto Durotar,38.52,58.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泰尔夫|r 交谈
    .turnin 1524 >>交任务：火焰的召唤
    .accept 1525 >>接任务：火焰的召唤
    .target 泰尔夫·祖拉姆
step << Warrior
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_犹塞克|r 交谈
    .turnin 1505 >>交任务：老兵犹塞克
    .accept 1498 >>接任务：防御之道
    .target 犹塞克
step << Warrior
    #loop
    .goto Durotar,39.34,28.25,0
    .goto Durotar,39.11,30.76,40,0
    .goto Durotar,39.34,28.25,40,0
    .goto Durotar,39.11,26.46,40,0
    .goto Durotar,39.39,25.05,40,0
    .goto Durotar,40.00,24.06,40,0
    .goto Durotar,42.51,24.29,40,0
    .goto Durotar,39.34,28.25,40,0
    >>击杀 |cRXP_ENEMY_闪电蜥蜴|r，拾取它们的 |cRXP_ENEMY_鳞片|r
    .complete 1498,1 --Singed Scale (5)
    .mob 闪电蜥蜴
step << Warrior
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_犹塞克|r 交谈
    .turnin 1498 >>交任务：防御之道
    .accept 1502 >>接任务：索恩格瑞姆·火眼
    .target 犹塞克
]])
local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
<< Horde
#xprate >1.99
#version 1
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#name 1-7 Mulgore
#title 莫高雷
#next 7-13 Mulgore
#defaultfor Tauren
#displayname 1-7 莫高雷
step << !Tauren
    #completewith next
    .goto Mulgore,44.92,77.12
    +|cRXP_WARN_你选择的是牛头人专用指南。由于其中一条主要任务线仅限牛头人接取，其他种族不适合在此区域升级。建议选择你出生地对应的新手区域|r
step
    .goto Mulgore,44.92,77.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .accept 747 >>接受任务 开始狩猎
    .target 格鲁尔·鹰风
step
    #season 2
    .goto Mulgore,44.35,76.68
    >> |Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_符文贩子|r 交谈
    >> |cRXP_WARN_千万不要把可装备的物品卖给商人|r
    >> |cRXP_BUY_出售你的|r |T135005:0|t[衬衫] |cRXP_BUY_和一份|r |T133964:0|t[大块面包] |cRXP_WARN_（按住 Shift 点击可拆分堆叠）|r |cRXP_BUY_并向他购买 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r] 和 |T134419:0|t[|cRXP_FRIENDLY_乘胜追击符文|r]|r << Warrior
    >> |cRXP_BUY_出售你的|r |T135005:0|t[衬衫] |cRXP_BUY_和一份|r |T134534:0|t[蘑菇菌盖] |cRXP_WARN_（按住 Shift 点击可拆分堆叠）|r |cRXP_BUY_并向他购买 |T134920:0|t[|cRXP_FRIENDLY_卡亚圣像|r] |cRXP_BUY_和|r |T134918:0|t[|cRXP_FRIENDLY_二价圣像|r] |cRXP_BUY_。|r << Shaman
    >> |cRXP_BUY_出售你的|r |T135005:0|t[衬衫] |cRXP_BUY_和|r |T132794:0|t[饮水] |cRXP_BUY_并向他购买以下符文：|r  << Hunter
    >> |cRXP_BUY_出售你的|r |T133975:0|t[苹果] |cRXP_BUY_并向他购买以下符文：|r << Druid
    >> |cRXP_BUY_出售杂物并购买以下全部符文：|r << Shaman
    .collect 204716,1 << Warrior --Rune of Frenzied Assault
    .collect 204806,1 << Warrior --Rune of Victory Rush
    .collect 209852,1 << Hunter --Rune of Kill Command
    .collect 206168,1 << Hunter --Rune of the Chimera
    .collect 226401,1 << Hunter --Treatise on the Heart of the Lion
    .collect 216770,1 << Hunter --Treatise on Aspect of the Viper
    .collect 206387,1 << Shaman --Kajaric Icon
    .collect 206381,1 << Shaman --Dyadic Icon
    .collect 208414,1 << Druid --Lunar Idol
    .collect 210500,1 << Druid --Rune of the Stars
    .collect 206989,1 << Druid --Rune of the Sun
    .collect 227749,1 << Druid --Rune of the Falling Star
    >>你很快就会获得其余符文
    .target 符文贩子
    .skipgossip
step
    #season 2
    #sticky
    #optional
    .use 204716 << Warrior --Rune of Frenzied Assault
    .use 204806 << Warrior --Rune of Victory Rush
    .use 209852 << Hunter --Rune of Kill Command
    .use 206168 << Hunter --Rune of the Chimera
    .use 226401 << Hunter --Treatise on the Heart of the Lion
    .use 216770 << Hunter --Treatise on Aspect of the Viper
    .use 206387 << Shaman --Kajaric Icon
    .use 208414 << Druid --Lunar Idol
    .use 210500 << Druid --Rune of the Stars
    .use 206989 << Druid --Rune of the Sun
    .use 227749 << Druid --Rune of the Falling Star
    .equip 18,206387 >> 装备 |T134920:0|t[|cRXP_FRIENDLY_卡亚圣像|r], 30 秒后使用学习 |T237582:0|t[熔岩爆裂] << Shaman
    .equip 18,208414 >> 装备 |T134903:0|t[|cRXP_FRIENDLY_月光神像|r], 30 秒后使用学习 |T237472:0|t[怒风之怒] << Druid
    .train 425447 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r] << Warrior
    .train 403470 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_乘胜追击符文|r] 学习 |T132342:0|t[乘胜追击], 稍后刻印 << Warrior
    .train 410111 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_杀戮命令符文|r] 学习 |T236174:0|t[夺命射击] << Hunter
    .train 410121 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r] 学习 |T236176:0|t[奇美拉射击] << Hunter
    .train 409580 >> 使用 |T133739:0|t[|cRXP_FRIENDLY_论述：雄狮之心|r] 学习 |T132185:0|t[雄狮之心] << Hunter
    .train 415423 >> 使用 |T133739:0|t[|cRXP_FRIENDLY_论述：蝰蛇守护|r] 学习 |T132160:0|t[蝰蛇守护] << Hunter
    .train 424718 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_星辰符文|r] 学习 |T135730:0|t[星涌术] << Druid
    .train 416044 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_日灼符文|r] 学习 |T236216:0|t[阳炎术] << Druid
    .train 439770 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_坠落星辰符文|r] 学习 |T236168:0|t[星辰坠落] << Druid
    .engrave 7 >> 在裤子上铭刻|T236174:0|t[夺命射击] << Hunter
    .engrave 7 >> 在裤子上铭刻|T236317:0|t[狂乱攻击] << Warrior
    .engrave 7 >> 在裤子上铭刻|T135730:0|t[星涌术] << Druid
step << Hunter
    #season 2
    #optional
    #sticky
    .aura 409583 >> 记得激活 |T132185:0|t[雄狮之心]
step << Shaman
    #season 2
    #optional
    #label LavaBurst
    #sticky
    .use 206387
    .train 410095 >> 从角色面板使用 |T134920:0|t[|cRXP_FRIENDLY_卡亚圣像|r] 学习 |T237582:0|t[熔岩爆裂]
step << Druid
    #season 2
    #optional
    #sticky
    .use 208414
    .train 410061 >> 从角色面板使用 |T134903:0|t[|cRXP_FRIENDLY_月光神像|r] 学习 |T237472:0|t[怒风之怒]
    .engrave 5 >> 在胸甲上铭刻|T237472:0|t[怒风之怒]
step << Shaman
    #season 2
    #optional
    #requires LavaBurst
    #label Overload
    #sticky
    .equip 18,206381 >> 装备 |T134918:0|t[|cRXP_FRIENDLY_二价圣像|r]
    .train 410094 >> 30秒后使用它来学习 |T136050:0|t[过载]
    .use 206381
step
    .goto Mulgore,44.18,76.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鹰风酋长|r 交谈
    .accept 752 >>接受任务 一件琐事
    .target 鹰风酋长
step << Warrior/Shaman
    #season 0,1
    #completewith next
    .goto Mulgore,46.05,75.32,30,0
    +|cRXP_WARN_击杀 |cRXP_ENEMY_平原陆行鸟|r 并拾取物品，直到可出售的物品（包括身上的护甲）总价值达到10铜币|r << Warrior/Shaman
    .mob 平原陆行鸟
    .money >0.001
step
    #season 2
    .goto Mulgore,46.05,75.32
    .xp 2 >>|cRXP_WARN_击杀4只|cRXP_ENEMY_平原陆行鸟|r升到2级，并拾取可售物品，直到总价值达到10铜币|r << !Shaman !Druid
    .xp 2 >>|cRXP_WARN_击杀4只|cRXP_ENEMY_平原陆行鸟|r升到2级，并拾取可售物品，直到总价值达到42铜币|r << Shaman
    .xp 2 >>|cRXP_WARN_击杀4只|cRXP_ENEMY_平原陆行鸟|r升到2级，并拾取可售物品，直到总价值达到20铜币|r << Druid
    .mob 平原陆行鸟
step << Shaman/Druid
    #season 2
    .goto Mulgore,46.36,75.89,50,0
    #completewith next
    +|cRXP_WARN_继续击杀|cRXP_ENEMY_平原陆行鸟|r，直到可售物品总价值达到42铜币|r << Shaman
    +|cRXP_WARN_继续击杀|cRXP_ENEMY_平原陆行鸟|r，直到可售物品总价值达到20铜币|r << Druid
    .money >0.0042 << Shaman
    .money >0.002 << Druid
step << Druid
    #season 2
    .goto Mulgore,45.08,75.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
    .accept 77648 >>接受任务 牛头人的圣物
    .complete 77648,1 >>学会怒风之怒后，交付教学任务
    .turnin 77648 >>交任务 牛头人的圣物
    .target 加尔特·迷雾行者
step << Warrior/Shaman
    #season 0,1
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡文尼|r 交谈
    .vendor >> 出售杂物
    .target 卡文尼·柔风
    .money >0.001
step << Warrior/Shaman
    #season 2
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡文尼|r 交谈
    >>|cRXP_WARN_不要将可装备的物品卖给商人|r
    .vendor >> 出售杂物
    .target 卡文尼·柔风
    .money >0.001 << Warrior
    .money >0.0042 << Shaman
step << Warrior
    #season 0,1
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 6673 >>学习 |T132333:0|t[战斗怒吼]
    .target 哈鲁特·雷角
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 6673 >>学习 |T132333:0|t[战斗怒吼]
    .accept 77651 >>接受任务 深入荆棘
    .complete 77651,1 >>学会乘胜追击后，交付教学任务
    .turnin 77651 >>交任务 深入荆棘
    .target 哈鲁特·雷角
step << Shaman
    #season 0,1
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
    .train 8017 >>学习 |T136086:0|t[石化武器]
    .target 米拉·晨行者
step << Shaman
    #season 2
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
    .train 8017 >>学习 |T136086:0|t[石化武器]
    .accept 77652 >>接受任务 力量圣像
    .complete 77652,1 >>学会过载后，交付教学任务
    .turnin 77652 >>交任务 力量圣像
    .target 米拉·晨行者
step << Shaman/Druid
    #season 2
    .goto Mulgore,44.15,77.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦利亚|r交谈
    >>|cRXP_BUY_出售杂物|r。|cRXP_WARN_千万不要出售可以装备的物品|r << Druid
    >>|cRXP_BUY_购买一副|r |T132952:0|t[肮脏的皮手套]，|cRXP_BUY_用于铭刻符文|r
    .collect 714,1 -- Dirty Leather Gloves
    .target 瓦利亚·韧皮
step << Hunter
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡|r交谈
    .accept 77649 >>接受任务 猎人的力量
    .complete 77649,1 >>学会奇美拉射击后，交付教学任务
    .turnin 77649 >>交任务 猎人的力量
    .target 兰卡·远箭
step << Warrior/Shaman/Druid
    #season 2
    .equip 10,2385 >> 装备 |T132938:0|t[无光泽的链甲手套] << Warrior
    .equip 10,714 >> 装备 |T132952:0|t[肮脏的皮手套] << Shaman/Druid
    .engrave 10 >> 在手套上铭刻|T132342:0|t[乘胜追击] << Warrior
    .equip 5,2127 >> 装备 |T135010:0|t[破损的皮外衣] << Shaman
    .engrave 5 >> 在胸甲上铭刻|T136050:0|t[过载] << Shaman
    .engrave 10 >> 在手套上铭刻|T237582:0|t[熔岩爆裂] << Shaman
    .engrave 10 >> 在手套上铭刻|T236216:0|t[阳炎术] << Druid
    .use 2127 << Shaman/Druid --Cracked Leather Vest
    .use 2385 << Warrior -- Tarnished Chain Gloves
    .use 714 << Shaman/Druid --Dirty Leather Gloves
step << Hunter
    #season 2
    .goto Mulgore,44.35,76.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_符文贩子|r 交谈
    >>|cRXP_WARN_千万不要出售可以装备的物品|r
    .vendor >>|cRXP_BUY_出售杂物，并购买以下全部符文：|r << Hunter
    .collect 210818,1 << Hunter --Rune of Lone Wolf
    .collect 213124,1 << Hunter --Rune of Close Combat
    .collect 226252,1 << Hunter --Rune of the Guerrilla
    >>|cRXP_WARN_你稍后会获得其余符文|r
    .target 符文贩子
    .skipgossip
step << Hunter
    #season 2
    .train 410122 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_独来独往符文|r] 学习 |T132266:0|t[独来独往] << Hunter
    .train 416086 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_短兵相接符文|r] 学习 |T132394:0|t[近战专家] << Hunter
    .train 440563 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_游击符文|r] 学习 |T132171:0|t[一击脱离] << Hunter
    .use 210818 << Hunter --Rune of Lone Wolf
    .use 213124 << Hunter --Rune of Close Combat
    .use 226252 << Hunter --Rune of the Guerrilla
step << Hunter
    #season 2
    .equip 10,2125 >> 装备 |T132952:0|t[破损的皮手套]
    .engrave 10 >> 在手套上铭刻|T236176:0|t[奇美拉射击]
    .use 2125 --Cracked Leather Gloves
step << Hunter
    #season 2
    #sticky
    #optional
    >> |cRXP_WARN_留意掉落的|r胸甲/腰带/披风|cRXP_WARN_。|r|cRXP_WARN_装备它们，并刻印相应符文。|r
    .engrave 5 >> 将 |T132266:0|t[独来独往] 铭刻到你的 |T132724:0|t[胸甲]上
    .engrave 6 >> 将|T132394:0|t[近战专家]铭刻到|T132513:0|t[腰带]上
    .engrave 15 >> 将 |T132171:0|t[一击脱离] 铭刻到你的 |T133771:0|t[披风]上
step << Druid
    #season 2
    #sticky
    #optional
    >> |cRXP_WARN_留意掉落的|r披风|cRXP_WARN_。|r|cRXP_WARN_装备它，并将|r |T236168:0|t[星辰坠落]|cRXP_WARN_刻印到披风上。|r
    .engrave 15 >> 将 |T236168:0|t[星辰坠落] 铭刻到你的 |T133771:0|t[披风]上
step
    #completewith next
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，拾取它们的 |cRXP_LOOT_肉|r 和 |cRXP_LOOT_羽毛|r
    .complete 747,1 --Plainstrider Meat (7)
    .complete 747,2 --Plainstrider Feather (7)
    .mob 平原陆行鸟
step
    .goto Mulgore,50.03,81.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鹰风酋长的母亲|r 交谈
    .turnin 752 >>交任务 一件琐事
    .accept 753 >>接受任务 一件琐事
    .target 鹰风酋长的母亲
step
    .goto Mulgore,50.22,81.37
    >>拾取 |cRXP_LOOT_水罐|r，它在 |cRXP_FRIENDLY_鹰风酋长的母亲|r 身后的井上
    .complete 753,1 --Water Pitcher (1)
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
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，拾取它们的 |cRXP_LOOT_肉|r 和 |cRXP_LOOT_羽毛|r
    .complete 747,1 --Plainstrider Meat (7)
    .complete 747,2 --Plainstrider Feather (7)
    .mob 平原陆行鸟
step
    .goto Mulgore,44.92,77.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .turnin 747,1 >>交任务 开始狩猎 << Druid
    .turnin 747 >>交任务 开始狩猎 << !Druid
    .accept 3091 >>接受任务 简易便笺 << Warrior
    .accept 3092 >>接受任务 风化便笺 << Hunter
    .accept 3093 >>接受任务 符文便笺 << Shaman
    .accept 3094 >>接受任务 绿色便笺 << Druid
    .accept 750 >>接受任务 继续狩猎
    .target 格鲁尔·鹰风
step
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡文尼|r 交谈
    >>|cRXP_BUY_向她购买|r |T132384:0|t[轻弹丸] |cRXP_BUY_。|r << Hunter
    .collect 2516,1000,750,1 << Hunter --Light Shot (1000)
    .vendor >> 出售杂物
    .target 卡文尼·柔风
step
    .goto Mulgore,44.18,76.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鹰风酋长|r 交谈
    .turnin 753 >>交任务 一件琐事
    .accept 755 >>接受任务 大地之母仪祭
    .target 鹰风酋长
step << Shaman
    .goto Mulgore,44.07,77.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_马沙克|r|cRXP_BUY_交谈，并购买一根|r |T135139:0|t[学徒法杖] |cRXP_BUY_（向他购买）|r
    .collect 2132,1,750,1 --Collect Short Staff (1)
    .money <0.0102
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
    .target 马沙克·利刃
step << Shaman
    #optional
    #completewith RitesoftheEarthmother
    +|cRXP_WARN_装备|r |T135139:0|t[学徒法杖]
    .use 2132
    .itemcount 2132,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
step
    #completewith next
    >>击杀 |cRXP_ENEMY_山狮|r，拾取它们的 |cRXP_LOOT_毛皮|r
    .complete 750,1 --Mountain Cougar Pelt (10)
    .mob 山狮
step
    #label RitesoftheEarthmother
    .goto Mulgore,42.58,92.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灰舌先知|r交谈
    -->>|cRXP_WARN_Grind mobs on the way|r
    .turnin 755 >>交任务 大地之母仪祭
    .accept 757 >>接受任务 力量仪祭
    .target 灰舌先知
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
    >>击杀 |cRXP_ENEMY_山狮|r，拾取它们的 |cRXP_LOOT_毛皮|r
    .complete 750,1 --Mountain Cougar Pelt (10)
    .mob 山狮
step
    #optional
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
    .xp 3+850 >> 刷怪至3级至少850/1400点经验
    .mob 平原陆行鸟
step << Warrior/Druid
    #completewith GrullTurnin2
    +|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r并拾取可售物品，直到总价值达到2银币|r
    .mob 平原陆行鸟
	.money >0.02
step << !Warrior !Druid
    #completewith next
    +|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r并拾取可售物品，直到总价值达到1银币|r
    .mob 平原陆行鸟
    .money >0.01
step
    #label GrullTurnin2
    .goto Mulgore,44.92,77.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .turnin 750 >>交任务 继续狩猎
    .accept 780 >>接受任务 斗猪
    .target 格鲁尔·鹰风
step
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡文尼|r 交谈
    .vendor >> 出售杂物
    .target 卡文尼·柔风
step
    .goto Mulgore,44.67,76.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵维萨罗·风羽|r交谈
    .accept 3376 >>接受任务 刺鬃酋长
    .target 卫兵维萨罗·风羽
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务：简易便笺
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 哈鲁特·雷角
    .money <0.02
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务：简易便笺
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 哈鲁特·雷角
step << Warrior
    #season 0,1
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务：简易便笺
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 哈鲁特·雷角
    .money <0.02
step << Warrior
    #season 0,1
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务：简易便笺
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 哈鲁特·雷角
step << Hunter
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡|r交谈
    .turnin 3092 >>交任务：风化便笺
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .target 兰卡·远箭
step << Hunter
    #season 0,1
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡|r交谈
    .turnin 3092 >>交任务：风化便笺
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .target 兰卡·远箭
step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
    .turnin 3094 >>交任务：绿色便笺
    .train 8921 >> 学习 |T136096:0|t[月火术]
    .target 加尔特·迷雾行者
step << Druid
    #season 0,1
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
    .turnin 3094 >>交任务：绿色便笺
    .train 8921 >> 学习 |T136096:0|t[月火术]
    .target 加尔特·迷雾行者
step << Shaman
    .goto Mulgore,44.73,76.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鸦羽|r交谈
    .accept 1519 >>接受任务 大地的召唤
    .target 鸦羽先知
step << Shaman
    #season 2
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
    .turnin 3093 >>交任务 符文便笺
    .train 8042 >>学习 |T136026:0|t[地震术]
    .target 米拉·晨行者
step << Shaman
    #season 0,1
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
    .turnin 3093 >>交任务 符文便笺
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
    >>击杀 |cRXP_ENEMY_斗猪|r，拾取它们的 |cRXP_LOOT_肋排|r 和 |cRXP_LOOT_头|r
    .complete 780,2 --Battleboar Flank (8)
    .complete 780,1 --Battleboar Snout (8)
    .mob 斗猪
step
    #completewith BristlebackBelts
    .goto Mulgore,59.67,83.33,30 >>穿过洞穴
step
    #completewith DirtyMap
    >>击杀 |cRXP_ENEMY_刺背野猪人|r，拾取它们的 |cRXP_LOOT_腰带|r
    .complete 757,1 --Bristleback Belt (12)
    .mob 刺背野猪人
step << Shaman
    #completewith DirtyMap
    >>击杀 |cRXP_ENEMY_刺背萨满祭司|r，拾取它们的 |cRXP_LOOT_仪式药膏|r
    .complete 1519,1 --Ritual Salve (2)
    .mob 刺背萨满祭司
step
    .goto Mulgore,60.54,81.04,35,0
    .goto Mulgore,62.35,81.27,35,0
    .goto Mulgore,62.49,78.78,35,0
    .goto Mulgore,64.71,77.67
    >>击杀大屋内的 |cRXP_ENEMY_刺鬃酋长|r，拾取他的 |cRXP_LOOT_头颅|r
    .complete 3376,1 --Chief Sharptusk Thornmantle's Head (1)
    .mob 刺鬃酋长
step
    #completewith next
    .goto Mulgore,63.24,82.70,40 >>进入洞穴
step
    #label DirtyMap
    .goto Mulgore,63.24,82.70
    >>拾取地上的 |T134269:0|t[|cRXP_LOOT_沾满泥土的地图|r]，使用它接取任务
    .collect 4851,1,781 --Collect Dirt-Stained Map
    .accept 781 >>接受任务 纳拉其营地的危机
    .use 4851
step << Shaman
    #completewith next
    >>击杀 |cRXP_ENEMY_刺背萨满祭司|r，拾取它们的 |cRXP_LOOT_仪式药膏|r
    .complete 1519,1 --Ritual Salve (2)
    .mob 刺背萨满祭司
step
    #label BristlebackBelts
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
    >>击杀 |cRXP_ENEMY_刺背野猪人|r，拾取它们的 |cRXP_LOOT_腰带|r
    .complete 757,1 --Bristleback Belt (12)
    .mob 刺背野猪人
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
    >>击杀 |cRXP_ENEMY_刺背萨满祭司|r，拾取它们的 |cRXP_LOOT_仪式药膏|r
    .complete 1519,1 --Ritual Salve (2)
    .mob 刺背萨满祭司
step
    #completewith next
    .hs >> 使用炉石返回纳拉其营地
    .use 6948
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r、|cRXP_FRIENDLY_卫兵维萨罗·风羽|r和|cRXP_FRIENDLY_鹰风酋长|r交谈 << !Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r、|cRXP_FRIENDLY_卫兵维萨罗·风羽|r、|cRXP_FRIENDLY_鸦羽先知|r和|cRXP_FRIENDLY_鹰风酋长|r交谈 << Shaman
    .turnin 780 >>交任务 斗猪
    .target +格鲁尔·鹰风
    .goto Mulgore,44.92,77.12
    .turnin 3376 >>交任务 刺鬃酋长
    .target +卫兵维萨罗·风羽
    .goto Mulgore,44.67,76.68
    .turnin 1519 >>交任务 大地的召唤 << Shaman
    .accept 1520 >>接受任务 大地的召唤 << Shaman
    .target +鸦羽先知 << Shaman
    .goto Mulgore,44.73,76.18 << Shaman
    .turnin 781 >>交任务 纳拉其营地的危机
    .turnin 757 >>交任务 力量仪祭
    .accept 763 >>接受任务 大地之母仪祭
    .target +鹰风酋长
    .goto Mulgore,44.18,76.07
step << Shaman
    .isOnQuest 1520
    #completewith CallofEarth
    #label Rock
    .goto Mulgore,53.74,80.15,30 >> 前往岩石方向
step << Shaman
    .isOnQuest 1520
    #completewith next
    #requires Rock
    .cast 8202 >>|cRXP_WARN_使用|r |T134743:0|t[大地灵契]
    .use 6635
step << Shaman
    #label CallofEarth
    .goto Mulgore,53.74,80.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大地之魂|r交谈
    .turnin 1520 >>交任务 大地的召唤
    .accept 1521 >>接受任务 大地的召唤
    .target 大地之魂
step << Shaman
    .goto Mulgore,44.73,76.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鸦羽|r交谈
    .turnin 1521 >>交任务 大地的召唤
    .target 鸦羽先知
step << Shaman
    #season 2
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
    .turnin 77652 >>交任务 力量圣像
    .train 332 >>学习 |T136052:0|t[治疗波]
    .target 米拉·晨行者
step << Shaman
    #season 0,1
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米拉·晨行者|r交谈
    .train 332 >>学习 |T136052:0|t[治疗波]
    .target 米拉·晨行者
step << Hunter
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡|r交谈
    .train 1130 >>学习 |T132212:0|t[猎人印记]
    .target 兰卡·远箭
    .money <0.02
step << Hunter
    #season 0,1
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡|r交谈
    .train 1130 >>学习 |T132212:0|t[猎人印记]
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target 兰卡·远箭
    .money <0.02
step << Hunter
    #season 0,1
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡|r交谈
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target 兰卡·远箭
step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
    .train 467 >>学习 |T136104:0|t[荆棘术]
    .train 5177 >>学习 |T136006:0|t[愤怒]
    .target 加尔特·迷雾行者
    .money <0.02
step << Druid
    #season 0,1
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
    .train 467 >>学习 |T136104:0|t[荆棘术]
    .train 5177 >>学习 |T136006:0|t[愤怒]
    .target 加尔特·迷雾行者
    .money <0.02
step << Druid
    #season 0,1
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔特|r交谈
    .train 5177 >>学习 |T136006:0|t[愤怒]
    .target 加尔特·迷雾行者
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .train 6343 >>学习 |T136105:0|t[雷霆一击]
    .target 哈鲁特·雷角
    .money <0.02
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .target 哈鲁特·雷角
step << Warrior
    #season 0,1
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .train 6343 >>学习 |T136105:0|t[雷霆一击]
    .target 哈鲁特·雷角
    .money <0.02
step << Warrior
    #season 0,1
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .target 哈鲁特·雷角
step
    #season 2
    .goto Mulgore,44.35,76.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_符文贩子|r 交谈
    >>|cRXP_WARN_不要将可装备的物品卖给商人|r
    .vendor >> |cRXP_BUY_出售杂物，并向他购买你需要的全部 |T134419:0|t|cRXP_WARN_[符文]|r。|r
    .target 符文贩子
    .skipgossip
step
    .goto Mulgore,38.51,81.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安图尔·荒野|r交谈
    .accept 1656 >>接受任务 未完的任务
    .target 安图尔·荒野
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
<< Horde
#xprate >1.99
#version 1
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#name 7-13 Mulgore
#title 莫高雷
#next 13-20 The Barrens
#defaultfor Tauren
#displayname 7-13 莫高雷
step << Druid
    #season 2
    .goto Mulgore,35.72,69.57
    >>|cRXP_WARN_施放|r |T136096:0|t[月火术] |cRXP_WARN_，目标分别为三个|r |cRXP_ENEMY_月亮石|r|cRXP_WARN_。石头之间会出现一个宝箱|r
    >>打开|cRXP_PICK_月光宝箱|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_日灼符文|r]
    .collect 206989,1 --Rune of the Sun (1)
    .mob 月亮石
    .train 416044,1
step << Druid
    #season 2
    .train 416044 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_日灼符文|r] |cRXP_WARN_学习|r |T236216:0|t[阳炎术]
    .use 206989
    .itemcount 206989,1
step
	#completewith BloodhoofHome
	#softcore
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
	#hardcore
	#completewith BloodhoofHome
    .goto Mulgore,47.35,60.70,120 >> 跑到血蹄村
    .subzoneskip 222
step
    #softcore
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茂尔|r交谈
    .accept 766 >>接任务：马兹拉纳其
    .target 茂尔·祈雨
step
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢尔·鹰爪|r和|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .accept 743 >>接任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.36,62.01
    .turnin -763 >>交任务 大地之母仪祭
    .accept 745 >>接受任务 土地之争
    .accept 767 >>接任务：幻象仪祭
    .accept 746 >>接任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
step
    #xprate >2.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢尔·鹰爪|r和|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .accept 743 >>接任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.36,62.01
    .turnin -763 >>交任务 大地之母仪祭
    .accept 767 >>接任务：幻象仪祭
    .accept 746 >>接任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
step
    #label BloodhoofHome
    .goto Mulgore,46.63,61.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
    .turnin -1656 >>交任务 未完的任务
    .target 旅店老板考乌斯
step
    .goto Mulgore,46.63,61.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板考乌斯|r 交谈
    .home 222 >>将炉石绑定在血蹄村
    .target 旅店老板考乌斯
    .bindlocation 222
    .subzoneskip 222,1

step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特·深痕|r 交谈
    .vendor >> 卖掉杂物。如果卖掉现有武器后足够购买 |T135145:0|t[学徒短杖]（5银 04铜），就卖掉它。若钱仍不够，稍后再回来
    .target 玛诺特·深痕
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_玛诺特|r|cRXP_BUY_交谈，再向他购买|r |T135145:0|t[学徒短杖]|cRXP_BUY_。|r
    .collect 2495,1,761,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特·深痕|r 交谈
    .vendor >> 卖掉杂物。如果卖掉现有武器后足够购买 |T133053:0|t[木槌棒]（7银 1铜），就卖掉它。若钱仍不够，稍后再回来
    .target 玛诺特·深痕
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_玛诺特|r|cRXP_BUY_交谈，再向他购买|r |T133053:0|t[木槌棒]|cRXP_BUY_。|r
    .collect 2493,1,761,1 --Collect Wooden Mallet (1)
    .money <0.0701
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯纳·鹰眼|r 交谈
    .vendor >> 卖掉杂物。如果卖掉现有武器后足够购买 |T135611:0|t[精制短枪]（4银 14铜），就卖掉它。若钱仍不够，稍后再回来
    .target 肯纳·鹰眼
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_肯纳·鹰眼|r|cRXP_BUY_交谈，再向她购买|r |T135611:0|t[精制短枪]|cRXP_BUY_。|r
    .collect 2509,1,761,1 --Collect Ornate Blunderbuss (1)
    .money <0.0414
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_肯纳·鹰眼|r 交谈
    >>|cRXP_BUY_购买|r |T132384:0|t[轻弹丸]|cRXP_BUY_。|r << Hunter
    .collect 2516,1000,761,1 << Hunter --Light Shot (1000)
    .target 肯纳·鹰眼
step << Shaman/Druid
    #optional
    #completewith Well
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #optional
    #completewith Well
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #optional
    #completewith Well
    +|cRXP_WARN_装备|r |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茂尔|r、|cRXP_FRIENDLY_扎尔曼·双月|r、|cRXP_FRIENDLY_哈肯·风之图腾|r和|cRXP_FRIENDLY_穆尔|r交谈
    .accept 766 >>接任务：马兹拉纳其
    .target +茂尔·祈雨
    .goto Mulgore,46.97,57.07
    .turnin 767 >>交任务：幻象仪祭
    .accept 771 >>接任务：幻象仪祭
    .target +扎尔曼·双月
    .goto Mulgore,47.76,57.53
    .accept 761 >>接任务：猎捕猛鹫
    .target +哈肯·风之图腾
    .goto Mulgore,48.71,59.32
    .accept 748 >>接受任务 毒水
    .target +穆尔·雷角
    .goto Mulgore,48.53,60.40
step << !Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茂尔|r、|cRXP_FRIENDLY_扎尔曼·双月|r和|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .accept 766 >>接任务：马兹拉纳其
    .target +茂尔·祈雨
    .goto Mulgore,46.97,57.07
    .turnin 767 >>交任务：幻象仪祭
    .accept 771 >>接任务：幻象仪祭
    .target +扎尔曼·双月
    .goto Mulgore,47.76,57.53
    .accept 761 >>接任务：猎捕猛鹫
    .target +哈肯·风之图腾
    .goto Mulgore,48.71,59.32
step
    #sticky
    #completewith Well
    >>|cRXP_WARN_在这片区域做任务时顺手收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Tauren
    #completewith Ambercorns
    >>击杀|cRXP_ENEMY_草原狼|r和|cRXP_ENEMY_成年平原陆行鸟|r，拾取掉落的|cRXP_LOOT_爪子|r和|cRXP_LOOT_利爪|r
    .complete 748,1 --Prairie Wolf Paw (6)
    .mob +草原狼
    .complete 748,2 --Plainstrider Talon (4)
    .mob +成年平原陆行鸟
step << Hunter
    #season 2
    .goto Mulgore,59.02,54.36
    >>施放 |T132212:0|t[猎人印记]，目标为 |cRXP_ENEMY_沙沙响的草丛|r
    >>击杀出现的|cRXP_ENEMY_风险投资公司偷猎者|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob 沙沙响的草丛
    .mob 风险投资公司偷猎者
    .train 410113,1
step << Hunter
    #season 2
    .train 410113 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .use 206155
    .itemcount 206155,1
step
    #label Ambercorns
    #loop
    .goto Mulgore,50.36,66.49,0
    .goto Mulgore,48.71,64.44,15,0
    .goto Mulgore,50.36,66.49,15,0
    .goto Mulgore,51.92,63.85,15,0
    .goto Mulgore,51.13,71.06,15,0
    .goto Mulgore,50.36,66.49,15,0
    >>收集|cRXP_PICK_琥珀颗粒|r。它们散落在树下
    .complete 771,2 --Ambercorn (2)
step
	#completewith next
	>>在莫高雷各处击杀|cRXP_ENEMY_猛鹫|r，拾取掉落的|cRXP_LOOT_羽毛|r
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob 消瘦的猛鹫
    .mob 猛鹫
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
    >>击杀|cRXP_ENEMY_草原狼|r和|cRXP_ENEMY_成年平原陆行鸟|r，拾取掉落的|cRXP_LOOT_爪子|r和|cRXP_LOOT_利爪|r
    .complete 748,1 --Prairie Wolf Paw (6)
    .mob +草原狼
    .complete 748,2 --Plainstrider Talon (4)
    .mob +成年平原陆行鸟
step << Tauren
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔|r交谈
    .turnin 748 >>交任务：毒水
    .timer 8,毒水剧情演出
    .accept 754 >>接受任务 净化冰蹄之井
    .target 穆尔·雷角
step << Tauren
    #completewith next
    >>收集水井周围的|cRXP_PICK_水井石|r
    .complete 771,1 --Well Stone (2)
step << Tauren
    .goto Mulgore,53.68,66.28
    >>|cRXP_WARN_在井边使用|r |T135139:0|t[冰蹄之井净化图腾]|cRXP_WARN_净化水井|r
    .complete 754,1 --Cleanse the Winterhoof Water Well (1)
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
step
    #xprate <2.1
    #completewith Gnolls
    >>|cRXP_WARN_在这片区域做任务时顺手收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Warrior
    #xprate <2.1
    #season 2
    .itemcount 204690,<1
    .itemcount 204703,<1
    #loop
    .goto Mulgore,53.5,73.0,0
    .goto Mulgore,48.3,72.0,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    >>在两个营地之间来回清理。击杀|cRXP_ENEMY_白鬃制革工|r、|cRXP_ENEMY_白鬃剥皮工|r和|cRXP_ENEMY_白鬃偷猎者|r，拾取|cRXP_LOOT_被砍下的豺狼人的头|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_断矛|r|cRXP_WARN_（9级稀有怪），它的难度太高，不宜击杀|r
    .complete 745,1 --Palemane Tanner (10)
    .mob +白鬃制革工
    .complete 745,2 --Palemane Skinner (8)
    .mob +白鬃剥皮工
    .complete 745,3 --Palemane Poacher (5)
    .mob +白鬃偷猎者
    .collect 204478,1 --Severed Gnoll Head (1)
    .unitscan 断矛
    .train 403475,1
step
    #xprate <2.1
    #label Gnolls
    #loop
    .goto Mulgore,53.5,73.0,0
    .goto Mulgore,48.3,72.0,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    >>在两个营地之间来回清理。击杀|cRXP_ENEMY_白鬃制革工|r、|cRXP_ENEMY_白鬃剥皮工|r和|cRXP_ENEMY_白鬃偷猎者|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_断矛|r|cRXP_WARN_（9级稀有怪），它的难度太高，不宜击杀|r
    .complete 745,1 --Palemane Tanner (10)
    .mob +白鬃制革工
    .complete 745,2 --Palemane Skinner (8)
    .mob +白鬃剥皮工
    .complete 745,3 --Palemane Poacher (5)
    .mob +白鬃偷猎者
    .unitscan 断矛
step
    .goto Mulgore,47.63,61.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加纳|r 交谈
    >>|cRXP_BUY_向她购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r << Shaman/Druid
    >>|cRXP_BUY_向她购买|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_。|r << Warrior
    .vendor >> 卖掉杂物
    .collect 1179,10,746,1 << Shaman/Druid --Ice Cold Milk (10)
    .collect 4541,10,746,1 << Warrior --Freshly Baked Bread (10)
    .target 加纳·麦风
    .money <0.025
step << Tauren
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔|r和|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .turnin 754 >>交任务：净化冰蹄之井
    .accept 756 >>接受任务 雷角图腾
    .target +穆尔·雷角
    .goto Mulgore,48.53,60.40
    .turnin 745 >>交任务：土地之争
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
step << !Tauren
    #xprate <2.1
    .goto Mulgore,47.51,60.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .turnin 745 >>交任务：土地之争
    .target 贝恩·血蹄
step << Tauren
    #xprate >2.09
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔|r交谈
    .turnin 754 >>交任务：净化冰蹄之井
    .target 穆尔·雷角
step << Warrior
    .goto Mulgore,46.80,60.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔拉|r交谈
    .train 3273 >>学习 |T135966:0|t[急救]
    .money <0.01
    .target 维尔拉·幼蹄
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特·深痕|r 交谈
    .vendor >> 卖掉杂物。如果卖掉现有武器后足够购买 |T135145:0|t[学徒短杖]（5银 04铜），就卖掉它。若钱仍不够，稍后再回来
    .target 玛诺特·深痕
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_玛诺特|r|cRXP_BUY_交谈，再向他购买|r |T135145:0|t[学徒短杖]|cRXP_BUY_。|r
    .collect 2495,1,749,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特·深痕|r 交谈
    .vendor >> 卖掉杂物。如果卖掉现有武器后足够购买 |T133053:0|t[木槌棒]（7银 1铜），就卖掉它。若钱仍不够，稍后再回来
    .target 玛诺特·深痕
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_玛诺特|r|cRXP_BUY_交谈，再向他购买|r |T133053:0|t[木槌棒]|cRXP_BUY_。|r
    .collect 2493,1,749,1 --Collect Wooden Mallet (1)
    .money <0.0701
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯纳·鹰眼|r 交谈
    .vendor >> 卖掉杂物。如果卖掉现有武器后足够购买 |T135611:0|t[精制短枪]（4银 14铜），就卖掉它。若钱仍不够，稍后再回来
    .target 肯纳·鹰眼
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_肯纳·鹰眼|r|cRXP_BUY_交谈，再向她购买|r |T135611:0|t[精制短枪]|cRXP_BUY_。|r
    .collect 2509,1,749,1 --Collect Ornate Blunderbuss (1)
    .money <0.0414
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Shaman/Druid
    #optional
    #completewith Clawsx
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #optional
    #completewith Clawsx
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #optional
    #completewith Clawsx
    +|cRXP_WARN_装备|r |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step
    #label Vision
    .goto Mulgore,47.76,57.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔曼·双月|r交谈
    >>|cRXP_WARN_刷出的狼不要跟随|r
    .turnin 771 >>交任务：幻象仪祭
    .accept 772 >>接任务：幻象仪祭
    .target 扎尔曼·双月
step << Hunter
    #xprate <2.1
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文·刺鬃|r 交谈
    .train 5116 >> 学习职业技能
    .target 雅文·刺鬃
    .xp <8,1
step << Druid
    #xprate <2.1
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚·符文图腾|r交谈
    .train 5186 >>学习职业技能
    .target 根妮亚·符文图腾
    .xp <8,1
step << Warrior
    #xprate <2.1
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克朗·石蹄|r 交谈
    .train 284 >> 学习职业技能
    .target 克朗·石蹄
    .xp <8,1
step << Shaman
    #xprate <2.1
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳姆|r 交谈
    .train 8044 >> 学习职业技能
    .target 纳姆·逐星
    .xp <8,1
step
    #xprate <2.1
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
    .accept 749 >>接任务：被破坏的货车
	.unitscan 摩林·云行者
step
    #xprate <2.1
    #completewith Clawsx
    >>|cRXP_WARN_在这片区域做任务时顺手收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    #xprate <2.1
	#completewith Clawsx
	>>在莫高雷各处击杀|cRXP_ENEMY_猛鹫|r，拾取掉落的|cRXP_LOOT_羽毛|r
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob 消瘦的猛鹫
    .mob 猛鹫
step << Tauren
    #xprate <2.1
    #completewith next
    >>击杀|cRXP_ENEMY_草原捕食者|r和|cRXP_ENEMY_平原狮|r，拾取掉落的|cRXP_LOOT_爪子|r
    .complete 756,1 --Stalker Claws (6)
    .mob +草原捕食者
    .complete 756,2 --Cougar Claws (6)
    .mob +平原狮
step
    #xprate <2.1
    .goto Mulgore,53.74,48.17
    >>点击|cRXP_PICK_密封的补给箱|r
    .turnin 749 >>交任务：被破坏的货车
    .accept 751 >>接任务：被破坏的货车
step << Tauren
    #xprate <2.1
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
step
    #optional
    #label Clawsx

step
    #xprate <2.1
    #softcore
	#completewith Thunderhorn
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #xprate <2.1
    #hardcore
    #completewith Thunderhorn
    .goto Mulgore,46.5,55.5,150 >> 返回血蹄村
    .subzoneskip 222
step << Hunter
    #xprate <2.1
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文·刺鬃|r 交谈
    .train 5116 >> 学习职业技能
    .target 雅文·刺鬃
    .xp <8,1
step
    #xprate <2.1
    #label Mazzturnin
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茂尔|r交谈
    .turnin 766 >>交任务：马兹拉纳其
    .target 茂尔·祈雨
    .isQuestComplete 766
step << Shaman/Druid
    #xprate <2.1
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特·深痕|r 交谈
    .vendor >> 卖掉杂物。如果卖掉现有武器后足够购买 |T135145:0|t[学徒短杖]（5银 04铜），就卖掉它。若钱仍不够，稍后再回来
    .target 玛诺特·深痕
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
    #xprate <2.1
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_玛诺特|r|cRXP_BUY_交谈，再向他购买|r |T135145:0|t[学徒短杖]|cRXP_BUY_。|r
    .collect 2495,1,743,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #xprate <2.1
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛诺特·深痕|r 交谈
    .vendor >> 卖掉杂物。如果卖掉现有武器后足够购买 |T133053:0|t[木槌棒]（7银 1铜），就卖掉它。若钱仍不够，稍后再回来
    .target 玛诺特·深痕
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
    #xprate <2.1
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_玛诺特|r|cRXP_BUY_交谈，再向他购买|r |T133053:0|t[木槌棒]|cRXP_BUY_。|r
    .collect 2493,1,743,1 --Collect Wooden Mallet (1)
    .money <0.0701
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #xprate <2.1
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯纳·鹰眼|r 交谈
    .vendor >> 卖掉杂物。如果卖掉现有武器后足够购买 |T135611:0|t[精制短枪]（4银 14铜），就卖掉它。若钱仍不够，稍后再回来
    .target 肯纳·鹰眼
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    #xprate <2.1
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_肯纳·鹰眼|r|cRXP_BUY_交谈，再向她购买|r |T135611:0|t[精制短枪]|cRXP_BUY_。|r
    .collect 2509,1,743,1 --Collect Ornate Blunderbuss (1)
    .money <0.0414
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    #xprate <2.1
    .goto Mulgore,45.86,57.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_姆拉特·远行|r交谈
    .collect 2516,1000,743,1 << Hunter --Light Shot (1000)
    .target 姆拉特·远行
    .itemcount 2516,<800 << Hunter
step << Shaman/Druid
    #xprate <2.1
    #optional
    #completewith ThunderhornCleanse
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #xprate <2.1
    #optional
    #completewith ThunderhornCleanse
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #xprate <2.1
    #optional
    #completewith ThunderhornCleanse
    +|cRXP_WARN_装备|r |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step
    #xprate <2.1
    #completewith Thunderhorn
    .goto Mulgore,45.90,58.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈兰特·铁枝|r 交谈
    .vendor >> 卖掉杂物并修理装备
    .target 哈兰特·铁枝
step
    #xprate <2.1
    .goto Mulgore,48.71,59.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .turnin 761 >>交任务：猎捕猛鹫
    .target 哈肯·风之图腾
    .isQuestComplete 761
step << Tauren
    #xprate <2.1
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔|r交谈
    .turnin 756 >>交任务：雷角图腾
    .timer 8,雷角图腾剧情演出
    .accept 758 >>接受任务 净化雷角之井
    .target 穆尔·雷角
step
    #optional
    #label Thunderhorn
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳姆|r 交谈
    .train 8044 >> 学习职业技能
    .target 纳姆·逐星
    .xp <8,1
    .xp >10,1
step << Shaman
    #optional
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳姆|r 交谈
    .accept 2984 >>接任务：火焰的召唤
    .trainer >> 学习职业技能
    .target 纳姆·逐星
    .xp <10,1
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚·符文图腾|r交谈
    .train 5186 >>学习职业技能
    .target 根妮亚·符文图腾
    .xp <8,1
    .xp >10,1
step << Druid
    #optional
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_根妮亚·符文图腾|r 交谈
    .trainer >> 学习职业技能
    .accept 5928 >> 接受任务 响应召唤
    .target 根妮亚·符文图腾
    .isQuestAvailable 5928
    .xp <10,1
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克朗·石蹄|r 交谈
    .train 284 >> 学习职业技能
    .target 克朗·石蹄
    .xp <8,1
    .xp >10,1
step << Warrior
    #optional
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克朗·石蹄|r 交谈
    .trainer >> 学习职业技能
    .accept 1505 >>接受任务: 老兵犹塞克
    .target 克朗·石蹄
    .xp <10,1
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文·刺鬃|r 交谈
    .train 5116 >> 学习职业技能
    .target 雅文·刺鬃
    .xp <8,1
    .xp >10,1
step << Hunter
    #optional
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文·刺鬃|r 交谈
    .accept 6061 >>接任务：驯服野兽 << Tauren
    .trainer >> 学习职业技能
    .target 雅文·刺鬃
    .xp <10,1
step << Hunter Tauren
    #optional
    #loop
    .goto Mulgore,39.38,57.43,0
    .goto Mulgore,42.87,54.88,50,0
    .goto Mulgore,40.73,55.60,50,0
    .goto Mulgore,39.38,57.43,50,0
    .use 15914 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_，目标是|r |cRXP_ENEMY_成年平原陆行鸟|r|cRXP_WARN_，站在最远施法距离。|r
    .complete 6061,1 --Tame an Adult Plainstrider (1)
    .mob 成年平原陆行鸟
    .isOnQuest 6061
step << Hunter Tauren
    #optional
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6061 >>交任务：驯服野兽
    .accept 6087 >>接任务：驯服野兽
    .target 雅文·刺鬃
    .isQuestComplete 6061
step << Hunter Tauren
    #optional
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .accept 6087 >>接任务：驯服野兽
    .target 雅文·刺鬃
    .isQuestTurnedIn 6061
step << Hunter Tauren
    #optional
    #loop
    .goto Mulgore,49.49,42.27,0
    .goto Mulgore,47.18,50.15,50,0
    .goto Mulgore,46.65,47.22,50,0
    .goto Mulgore,48.18,45.27,50,0
    .goto Mulgore,49.49,42.27,50,0
    .use 15915 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_，目标是|r |cRXP_ENEMY_草原捕食者|r|cRXP_WARN_，站在最远施法距离。|r
    .complete 6087,1 --Tame a Prairie Stalker (1)
    .mob 草原捕食者
    .isQuestTurnedIn 6061
step << Hunter Tauren
    #optional
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6087 >>交任务：驯服野兽
    .accept 6088 >>接任务：驯服野兽
    .target 雅文·刺鬃
    .isQuestTurnedIn 6061
step << Hunter Tauren
    #optional
    #loop
    .goto Mulgore,47.25,41.33,0
    .goto Mulgore,47.25,41.33,80,0
    .goto Mulgore,45.41,40.29,80,0
    .goto Mulgore,51.57,44.40,80,0
    .use 15916 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_，目标为|r |cRXP_ENEMY_猛鹫|r |cRXP_WARN_，站在最远施法距离；若被击倒，立刻再次施放|r
    >>|cRXP_WARN_如果驯服失败且驯兽棒使用次数耗尽，就放弃任务，再重新接取并返回这里|r
    .complete 6088,1 --Tame a Swoop (1)
    .mob 猛鹫
    .isQuestTurnedIn 6061
step << Hunter Tauren
    #optional
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6088 >>交任务：驯服野兽
    .accept 6089 >>接任务：训练野兽
    .target 雅文·刺鬃
    .isQuestTurnedIn 6061
step
    .goto Mulgore,46.63,61.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板考乌斯|r 交谈
    >>|cRXP_BUY_向他购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r << Shaman/Druid
    >>|cRXP_BUY_向他购买|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_。|r << Warrior
    .vendor >> 卖掉杂物 << !Hunter
    .collect 1179,10,746,1 << Shaman/Druid --Ice Cold Milk (10)
    .collect 4541,10,746,1 << Warrior --Freshly Baked Bread (10)
    .target 旅店老板考乌斯
    .money <0.025
step
    #completewith Burial
    >>|cRXP_WARN_收集齐马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
	#completewith Burial
	>>在莫高雷各处击杀|cRXP_ENEMY_猛鹫|r，拾取掉落的|cRXP_LOOT_羽毛|r
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob 消瘦的猛鹫
    .mob 猛鹫
step << Tauren
    #xprate <2.1
    .goto Mulgore,44.49,45.36
    >>|cRXP_WARN_在雷角之井使用|r |T135139:0|t[雷角之井净化图腾]|cRXP_WARN_。|r
    .complete 758,1 --Cleanse the Thunderhorn Water Well (1)
step
    #optional
    #label ThunderhornCleanse

step << Shaman
    #season 2
    .itemcount 206388,<1
    #completewith next
    >>击杀|cRXP_ENEMY_巴尔丹掘地工|r和|cRXP_ENEMY_巴尔丹鉴定官|r，拾取|cRXP_LOOT_神器仓库钥匙|r
    .collect 206975,1 --Artifact Storage Key (1)
    .mob 巴尔丹掘地工
    .mob 巴尔丹鉴定官
    .train 425344,1
step
    .goto Mulgore,31.27,49.87
    >>击杀 |cRXP_ENEMY_巴尔丹掘地工|r 和 |cRXP_ENEMY_巴尔丹鉴定官|r，拾取其 |cRXP_LOOT_勘察员的锄头|r
    >>|cRXP_WARN_当心 |cRXP_ENEMY_巴尔丹鉴定官|r 会施放|r |T135929:0|t[次级治疗术] |cRXP_WARN_(远程施法: 为自身或附近血量低于 50% 的敌人回复约 75 点生命)|r
    .use 4702 >> 在熔炉旁砸碎 |T134707:0|t[勘察员的锄头]
    .complete 746,1 --Broken Tools (5)
    .mob 巴尔丹掘地工
    .mob 巴尔丹鉴定官
step << Shaman
    #season 2
    .itemcount 206388,<1
    #loop
    .goto Mulgore,34.33,47.54,0
    .goto Mulgore,34.33,47.54,40,0
    .goto Mulgore,33.62,49.61,40,0
    .goto Mulgore,32.58,48.96,40,0
    .goto Mulgore,31.88,50.17,40,0
    .goto Mulgore,31.14,50.08,40,0
    .goto Mulgore,30.98,48.24,40,0
    .goto Mulgore,31.59,48.19,40,0
    .goto Mulgore,33.10,47.69,40,0
    >>击杀|cRXP_ENEMY_巴尔丹掘地工|r和|cRXP_ENEMY_巴尔丹鉴定官|r，拾取|cRXP_LOOT_神器仓库钥匙|r
    >>|cRXP_WARN_当心 |cRXP_ENEMY_巴尔丹鉴定官|r 会施放|r |T135929:0|t[次级治疗术] |cRXP_WARN_(远程施法: 为自身或附近血量低于 50% 的敌人回复约 75 点生命)|r
    .collect 206975,1 --Artifact Storage Key (1)
    .mob 巴尔丹掘地工
    .mob 巴尔丹鉴定官
    .train 425344,1
step << Shaman
    #season 2
    .goto Mulgore,31.56,49.54
    >>打开|cRXP_PICK_神器仓库宝箱|r，拾取 |T134918:0|t|cRXP_LOOT_[硫息圣像]|r
    .collect 206388,1 --Sulfurous Icon (1)
    .train 425344,1
step << Shaman
    #season 2
    .equip 18,206388 >> |cRXP_WARN_装备|r |T134918:0|t|cRXP_LOOT_[硫息圣像]|r
    .use 206388
    .itemcount 206388,1 --Sulfurous Icon (1)
    .train 425344,1
step << Shaman
    #season 2
    #label MoltenBlast
    #completewith Burial
    .aura 408828 >>|cRXP_WARN_至少用|r |T136026:0|t[地震术]|cRXP_WARN_对敌人造成一次伤害，再将其击杀。重复10次，获得|r |T136116:0|t[灵感勃发]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意：只有能提供经验值的敌人才会计入层数|r
    .mob 巴尔丹掘地工
    .mob 巴尔丹鉴定官
    .train 425344,1
step << Warrior
    #xprate <2.1
    #season 2
    .itemcount 204689,<1
    .itemcount 204703,<1
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
    >>击杀|cRXP_ENEMY_风怒唤风者|r和|cRXP_ENEMY_风怒鹰身人|r，拾取掉落的|cRXP_LOOT_利爪|r和|cRXP_LOOT_被砍下的鹰身人的头|r
    .complete 743,1 --Windfury Talon (8)
    .collect 206995,1 ---Severed Harpy Head (1)
    .mob 风怒唤风者
    .mob 风怒鹰身人
    .train 403475,1
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
    >>击杀|cRXP_ENEMY_风怒唤风者|r和|cRXP_ENEMY_风怒鹰身人|r，拾取掉落的|cRXP_LOOT_利爪|r
    .complete 743,1 --Windfury Talon (8)
    .mob 风怒唤风者
    .mob 风怒鹰身人
step
    #completewith next
    .goto Mulgore,33.37,36.52,50 >> 进入风怒鹰身人北面的洞穴
step
    #xprate <2.1
	#label Burial
    .goto Mulgore,32.72,36.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知奥萨迪·智慧行者|r交谈
    .turnin 772 >>交任务：幻象仪祭
    .accept 773 >>接任务：智慧仪祭
    .target 先知奥萨迪·智慧行者
step
    #xprate >2.09
	#label Burial
    .goto Mulgore,32.72,36.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知奥萨迪·智慧行者|r交谈
    .turnin 772 >>交任务：幻象仪祭
    .target 先知奥萨迪·智慧行者
step << Shaman
    #season 2
    #requires MoltenBlast
    >>若尚未获得 |cRXP_WARN_灵感勃发|r，装备圣像，继续击杀受过你的 |T136026:0|t[地震术] 伤害且能提供经验的敌人，累计10次
    .train 425344 >>|cRXP_WARN_使用|r |T134918:0|t|cRXP_LOOT_[硫息圣像]|r|cRXP_WARN_学习|r |T133816:0|t[铭刻手套：熔火爆裂]
    .use 206388
    .train 425344,1
    .xp <3,1
step
    #completewith SacredBurial
    .destroy 4823 >> |cRXP_WARN_可以从背包中摧毁|r |T134712:0|t[先知之水] |cRXP_WARN_，之后不再需要|r
step << Druid/Hunter/Shaman
    #completewith next
    .goto Thunder Bluff,32.00,66.69
    .zone Thunder Bluff >>前往雷霆崖
    .isOnQuest 6089 << Hunter
    .xp <10,1 << Druid
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴通·阴影图腾|r交谈
    >>|cRXP_WARN_他处于|r |T132320:0|t[潜行中]
    .accept 76156 >>接任务：大地母亲与匿同在
    .target 巴通·阴影图腾
    .train 410104,1
step << Druid
    .goto Thunder Bluff,45.83,64.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将炉石绑定在雷霆崖
    .target 旅店老板帕拉
    .bindlocation 1638
    .isQuestAvailable 5932
    .xp <10,1
step << Druid
    .goto Thunder Bluff,78.1,28.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈缪尔·符文图腾|r交谈
    .accept 886 >>接任务：贫瘠之地的绿洲
    .target 大德鲁伊哈缪尔·符文图腾
    .xp <10,1
step << Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克|r交谈
    .goto Thunder Bluff,76.7,27.3
    .turnin 5928 >>交任务：响应召唤
    .accept 5922 >>接任务：月光林地
    .target 图拉克·符文图腾
    .isOnQuest 5928
step << Druid
    .goto Thunder Bluff,76.7,27.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克|r交谈
    .accept 5922 >>接任务：月光林地
    .target 图拉克·符文图腾
    .xp <10,1
step << Druid
    .isOnQuest 5922,5930
    #completewith GreatBearS
    .cast 18960 >>施放 |T135758:0|t[传送：月光林地]
    .zoneskip Moonglade
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 5922 >>交任务：月光林地
    .accept 5930 >>接任务：巨熊之灵
    .target 德迪利特·星焰
    .isOnQuest 5922
step << Druid
    #label GreatBearS
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .accept 5930 >>接任务：巨熊之灵
    .target 德迪利特·星焰
    .isQuestTurnedIn 5922
step << Druid
    .goto Moonglade,39.2,27.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨熊之灵|r交谈
    .complete 5930,1 --Seek out the Great Bear Spirit and learn what it has to share with you about the nature of the bear. (1)
    .target 巨熊之灵
    .skipgossip
    .isQuestTurnedIn 5922
step << Druid
    .isOnQuest 5930
    #completewith next
    .cast 18960 >>施放 |T135758:0|t[传送：月光林地]
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 5930 >>交任务：巨熊之灵
    .accept 5932 >>接任务：返回雷霆崖
    .target 德迪利特·星焰
    .isQuestTurnedIn 5922
step << Druid
    .isOnQuest 5932
    #completewith DruidBearForm
    .hs >> 使用炉石返回雷霆崖
    .cooldown item,6948,>0
    .use 6948
    .bindlocation 1638,1
    .zoneskip Thunder Bluff
    .isQuestTurnedIn 5922
step << Druid
    .isOnQuest 5932
    #completewith next
    .goto Moonglade,44.29,45.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布瑟恩·草风|r 交谈
    .fly Thunder Bluff >> 飞往雷霆崖
    .target 布瑟恩·草风
    .cooldown item,6948,<0
step << Druid
    #label DruidBearForm
    .goto Thunder Bluff,76.7,27.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克|r交谈
    .turnin 5932 >>交任务：返回雷霆崖
    .accept 6002 >>接任务：身心之力
    .target 图拉克·符文图腾
    .isQuestTurnedIn 5922
step << Hunter Tauren
	.goto Thunder Bluff,57.4,89.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_浩特·雷角|r 交谈
	.turnin 6089 >> 交任务：训练野兽
    .target 浩特·雷角
    .isOnQuest 6089
step << Hunter
    .spellmissing 1515
    .goto Thunder Bluff,54.08,84.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫苏瓦·雷角|r交谈
    .train 24547 >>学习宠物技能
    .target 赫苏瓦·雷角
    .isQuestTurnedIn 6089
step << Hunter
    .spellmissing 1515
    #completewith SacredBurial
    +|cRXP_WARN_将|r |T132162:0|t[训练野兽]|cRXP_WARN_拖到动作条上，再教宠物学习技能|r
    .isQuestTurnedIn 6089
step << Druid/Hunter/Shaman
    #xprate <2.1
    .goto Thunder Bluff,53.81,27.82,30,0
    .goto Mulgore,59.85,25.62
    .zone Mulgore >>乘坐北侧升降梯离开雷霆崖，前往莫高雷
    .zoneskip Thunder Bluff,1
    .isQuestTurnedIn 6089 << Hunter
    .isQuestTurnedIn 5932 << Druid
step << Hunter
    .spellmissing 1515
    #xprate <2.1
    #completewith SacredBurial
    .cast 1515 >>驯服一只 |cRXP_ENEMY_草原狼前锋|r
    >>|cRXP_WARN_这样就能学习|r |T132278:0|t[撕咬（等级2）]
    .mob 草原狼前锋
step
    #xprate <2.1
    #completewith SacredBurial
    >>|cRXP_WARN_收集齐马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    #xprate <2.1
    #completewith SacredBurial
    >>留意 |cRXP_ENEMY_鬼嚎|r。击败它并拾取掉落的 |T134358:0|t[|cRXP_LOOT_恶魔之伤|r]，可使用该物品接取任务。
    >>|cRXP_WARN_小心，|cRXP_ENEMY_鬼嚎|r 是 12 级怪，难度较高|r
    .collect 4854,1,770 --Collect Demon Scarred Cloak
    .accept 770 >>接受任务: 恶魔之伤
    .use 4854
    .unitscan 鬼嚎
step
    #xprate <2.1
	#completewith next
	>>在莫高雷各处击杀|cRXP_ENEMY_猛鹫|r，拾取掉落的|cRXP_LOOT_羽毛|r
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob 消瘦的猛鹫
    .mob 猛鹫
    .mob 长爪猛鹫
step
    #xprate <2.1
    .goto Mulgore,59.85,25.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者诺拉·暴雨图腾|r交谈
    .accept 833 >>接任务：神圣的墓地
    .target 博学者诺拉·暴雨图腾
step
    #optional
    #label SacredBurial
step << Warrior
    #xprate <2.1
    #season 2
    .itemcount 204688,<1
    .itemcount 204703,<1
    #completewith RiteofWisdom
    >>击杀|cRXP_ENEMY_刺背干涉者|r，拾取|cRXP_LOOT_被砍下的野猪人的头|r
    .collect 206994,1 ---Severed Quilboar Head (1)
    .mob 刺背干涉者
    .train 403475,1
step
    #xprate <2.1
    #completewith next
    >>击杀|cRXP_ENEMY_刺背干涉者|r
    .complete 833,1 --Bristleback Interloper (8)
    .mob 刺背干涉者
step
    #xprate <2.1
    #label RiteofWisdom
    .goto Mulgore,61.45,21.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先祖之魂|r交谈
    .turnin 773 >>交任务：智慧仪祭
    .accept 775 >>接受任务 雷霆崖之旅
    .target 先祖之魂
step << Warrior
    #xprate <2.1
    #season 2
    .itemcount 204688,<1
    .itemcount 204703,<1
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
    >>击杀|cRXP_ENEMY_刺背干涉者|r，拾取|cRXP_LOOT_被砍下的野猪人的头|r
    .complete 833,1 --Bristleback Interloper (8)
    .collect 206994,1 ---Severed Quilboar Head (1)
    .mob 刺背干涉者
    .train 403475,1
step
    #xprate <2.1
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
step
    #xprate <2.1
    .goto Mulgore,59.85,25.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者诺拉·暴雨图腾|r交谈
    .turnin 833 >>交任务：神圣的墓地
    .target 博学者诺拉·暴雨图腾
step
    #xprate <2.1
    #completewith next
    >>|cRXP_WARN_收集齐马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    #xprate <2.1
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
step
    #xprate <2.1
    #loop
    .goto Mulgore,55.06,32.48,0
    .goto Mulgore,55.06,32.48,60,0
    .goto Mulgore,53.84,40.80,60,0
    .goto Mulgore,53.19,45.16,60,0
    .goto Mulgore,57.45,48.86,60,0
    .goto Mulgore,59.04,52.79,60,0
    .goto Mulgore,59.12,58.09,60,0
    .goto Mulgore,48.67,44.84,60,0
    >>|cRXP_WARN_收集齐马兹拉纳其所需的物品|r
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
step << skip --Cannon removed from game
    #season 2
    #softcore
    #completewith Bloodhoofturnins1
    .goto Thunder Bluff,41.17,67.66
    +点击|cRXP_PICK_超级大炮|r，把自己发射回血蹄村
    >>|cRXP_WARN_抵达时你会死亡，但可以立即复活|r
    >>|cRXP_WARN_移除|r |T135992:0|t[魔法之翼] |cRXP_WARN_增益，需在剩余 2 秒时移除，尝试落入河中以免死亡
    .zoneskip Thunder Bluff,1
step
    #completewith Bloodhoofturnins1
    .zone Mulgore >>离开雷霆崖
    .zoneskip Thunder Bluff,1
step
    #softcore
    #completewith Bloodhoofturnins1
    .goto Mulgore,48.22,38.85
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    >>|cRXP_WARN_确保在路线箭头位置或更南边的位置死亡|r
    .zoneskip Thunder Bluff
step
    #hardcore
    #completewith Bloodhoofturnins1
    .goto Mulgore,47.33,57.17,120 >> 返回血蹄村
    .subzoneskip 222
step
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茂尔|r交谈
    .turnin 766 >>交任务：马兹拉纳其
    .target 茂尔·祈雨
    .isQuestComplete 766
step
    .goto Mulgore,46.75,60.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯考恩·白云|r交谈
    .turnin 770 >>交任务: 恶魔之伤
    .target 斯考恩·白云
    .isOnQuest 770
step << Warrior
    #xprate <2.1
    #season 2
    .itemcount 204703,<1
    .goto Mulgore,46.29,61.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与血蹄村的|cRXP_FRIENDLY_瓦泰亚·森蹄|r交谈
    >>交出收集到的|cRXP_LOOT_头颅|r，换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target 瓦泰亚·森蹄
    .train 403475,1
step << Warrior
    #xprate <2.1
    #season 2
    .use 204688 >>使用 |T134455:0|t[符文碎片] 合成 |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step << Warrior
    #xprate <2.1
    #season 2
    .train 403475 >>使用 |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .use 204703
    .itemcount 204703,1
step << Tauren
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r、|cRXP_FRIENDLY_卢尔·鹰爪|r、|cRXP_FRIENDLY_穆尔|r和|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .turnin 746 >>交任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.35,62.02
    .turnin 758 >>交任务：净化雷角之井
    --.accept 759 >>Accept Wildmane Totem
    .target +穆尔·雷角
    .goto Mulgore,48.54,60.38
    .turnin 761 >>交任务：猎捕猛鹫
    .target +哈肯·风之图腾
    .goto Mulgore,48.71,59.32
    .isQuestComplete 761
step << !Tauren
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r、|cRXP_FRIENDLY_卢尔·鹰爪|r和|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .turnin 746 >>交任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.35,62.02
    .turnin 761 >>交任务：猎捕猛鹫
    .target +哈肯·风之图腾
    .goto Mulgore,48.71,59.32
    .isQuestComplete 761
step << Tauren
    #xprate <2.1
    #label Bloodhoofturnins1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r、|cRXP_FRIENDLY_卢尔·鹰爪|r和|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .turnin 746 >>交任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.35,62.02
    .turnin 758 >>交任务：净化雷角之井
    --.accept 759 >>Accept Wildmane Totem
    .target +穆尔·雷角
    .goto Mulgore,48.54,60.38
step << !Tauren
    #xprate <2.1
    #label Bloodhoofturnins1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r和|cRXP_FRIENDLY_卢尔·鹰爪|r交谈
    .turnin 746 >>交任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.35,62.02
step
    #xprate >2.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r、|cRXP_FRIENDLY_卢尔·鹰爪|r和|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .turnin 746 >>交任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.35,62.02
    .turnin 761 >>交任务：猎捕猛鹫
    .target +哈肯·风之图腾
    .goto Mulgore,48.71,59.32
    .isQuestComplete 761
step
    #xprate >2.09
    #label Bloodhoofturnins1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r和|cRXP_FRIENDLY_卢尔·鹰爪|r交谈
    .turnin 746 >>交任务：矮人的挖掘场
    .target +贝恩·血蹄
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务：风怒鹰身人
    .target +卢尔·鹰爪
    .goto Mulgore,47.35,62.02
step
    #completewith AlphaTeeth
    .destroy 4702 >> |cRXP_WARN_可以从背包中摧毁|r |T134707:0|t[勘察员的锄头] |cRXP_WARN_，之后不再需要|r
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_肯纳·鹰眼|r交谈
    >>|cRXP_BUY_购买|r |T132384:0|t[重弹丸]|cRXP_BUY_。|r << Hunter
    .collect 2519,1000 << Hunter --Heavy Shot (1000)
    .target 肯纳·鹰眼
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 2687 >>学习职业技能
    .accept 1505 >>接受任务: 老兵犹塞克
    .target 克朗·石蹄
step << Warrior
    #optional
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 7384 >>学习职业技能
    .target 克朗·石蹄
    .xp <12,1
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .train 8050 >>学习职业技能
    .accept 2984 >>接任务：火焰的召唤
    .target 纳姆·逐星
step << Shaman
    #optional
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .train 547 >>学习职业技能
    .target 纳姆·逐星
    .xp <12,1
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .accept 6061 >>接任务：驯服野兽 << Tauren
    >>|cRXP_WARN_其他种族的猎人若尚未学会驯服野兽，需要先完成自己出生地区的猎人职业任务|r << !Tauren
    .train 13165 >>学习职业技能
    .target 雅文·刺鬃
    .isQuestAvailable 6061 << Tauren
step << Hunter
    #optional
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅文·刺鬃|r 交谈
    .train 14281 >> 学习职业技能
    .target 雅文·刺鬃
    .xp <12,1
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_根妮亚·符文图腾|r 交谈
    .train 8924 >> 学习职业技能
    .accept 5928 >> 接受任务 响应召唤
    .target 根妮亚·符文图腾
    .isQuestAvailable 5928
step << Druid
    #optional
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_根妮亚·符文图腾|r 交谈
    .train 8936 >> 学习职业技能
    .target 根妮亚·符文图腾
    .xp <12,1
step << Hunter Tauren
    #loop
    .goto Mulgore,39.38,57.43,0
    .goto Mulgore,42.87,54.88,50,0
    .goto Mulgore,40.73,55.60,50,0
    .goto Mulgore,39.38,57.43,50,0
    .use 15914 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_，目标是|r |cRXP_ENEMY_成年平原陆行鸟|r|cRXP_WARN_，站在最远施法距离。|r
    .complete 6061,1 --Tame an Adult Plainstrider (1)
    .mob 成年平原陆行鸟
step << Hunter Tauren
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6061 >>交任务：驯服野兽
    .accept 6087 >>接任务：驯服野兽
    .target 雅文·刺鬃
step << Hunter Tauren
    #loop
    .goto Mulgore,49.49,42.27,0
    .goto Mulgore,47.18,50.15,50,0
    .goto Mulgore,46.65,47.22,50,0
    .goto Mulgore,48.18,45.27,50,0
    .goto Mulgore,49.49,42.27,50,0
    .use 15915 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_，目标是|r |cRXP_ENEMY_草原捕食者|r|cRXP_WARN_，站在最远施法距离。|r
    .complete 6087,1 --Tame a Prairie Stalker (1)
    .mob 草原捕食者
step << Hunter Tauren
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6087 >>交任务：驯服野兽
    .accept 6088 >>接任务：驯服野兽
    .target 雅文·刺鬃
step << Hunter Tauren
    #loop
    .goto Mulgore,47.25,41.33,0
    .goto Mulgore,47.25,41.33,80,0
    .goto Mulgore,45.41,40.29,80,0
    .goto Mulgore,51.57,44.40,80,0
    .use 15916 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_，目标为|r |cRXP_ENEMY_猛鹫|r |cRXP_WARN_，站在最远施法距离；若被击倒，立刻再次施放|r
    >>|cRXP_WARN_如果驯服失败且驯兽棒使用次数耗尽，就放弃任务，再重新接取并返回这里|r
    .complete 6088,1 --Tame a Swoop (1)
    .mob 猛鹫
step << Hunter Tauren
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6088 >>交任务：驯服野兽
    .accept 6089 >>接任务：训练野兽
    .target 雅文·刺鬃
step
    .goto Mulgore,47.63,61.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加纳|r交谈
    >>|cRXP_BUY_向她购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_。|r << Shaman/Druid
    >>|cRXP_BUY_向她购买|r |T133968:0|t[刚出炉的面包]|cRXP_BUY_。|r << Warrior
    .collect 1179,20,818,1 << Shaman/Druid --Ice Cold Milk (20)
    .collect 4541,20,818,1 << Warrior --Freshly Baked Bread (20)

    .money <0.05
    .target 加纳·麦风
step << skip
    .goto Mulgore,46.75,60.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯考恩·白云|r交谈
    .accept 861 >>接任务：猎人之道
    .target 斯考恩·白云
step
    #xprate >2.09
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
    .accept 749 >>接任务：被破坏的货车
	.unitscan 摩林·云行者
step << Hunter
    .spellmissing 1515
    #xprate >2.09
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
    .train 17255 >>|cRXP_WARN_施放|r |T132164:0|t[驯服野兽] |cRXP_WARN_，目标为|r |cRXP_ENEMY_草原狼前锋|r|cRXP_WARN_。让它攻击怪物，学会|r |T132278:0|t[撕咬（等级 2）]
    .link https://www.wow-petopia.com/classic/training.php >> |cRXP_WARN_点击这里查看宠物训练的更多信息|r
    .mob 草原狼前锋
step
    #xprate >2.09
    .goto Mulgore,53.74,48.17
    >>点击|cRXP_PICK_密封的补给箱|r
    .turnin 749 >>交任务：被破坏的货车
    .accept 751 >>接任务：被破坏的货车
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
    .turnin 751 >> 交任务：被破坏的货车
    .accept 764 >> 接任务：风险投资公司
    .accept 765 >> 接任务：菲兹普罗克主管
	.unitscan 摩林·云行者
step
    #season 2
    #completewith Fizsprocket1
    .goto Mulgore,61.51,47.29,20 >> 前往风险投资公司矿洞
step << Shaman
    #season 2
    #completewith VentureCoKills
    >>打开矿洞内和矿洞另一侧外面的|cRXP_PICK_冲击补给品货车|r，拾取|cRXP_LOOT_爆盐采矿炸弹|r
    >>|cRXP_WARN_尽量待在洞穴上层|r
    .complete 76156,1 --Seaforium Mining Charge (5)
    .train 410104,1
step
    #completewith next
    >>击杀|cRXP_ENEMY_风险投资公司工人|r和|cRXP_ENEMY_风险投资公司主官|r
    .complete 764,1 --Venture Co. Worker (14)
    .mob +风险投资公司工人
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob +风险投资公司主官
step
    #label Fizsprocket1
    .goto Mulgore,64.95,43.33
    >>击杀|cRXP_ENEMY_菲兹普罗克主管|r，拾取掉落的|cRXP_LOOT_菲兹普罗克的笔记板|r
    >>|cRXP_WARN_进入矿洞后沿右侧（东侧）前进即可找到他|r
    .complete 765,1 --Fizsprocket's Clipboard (1)
    .mob 菲兹普罗克主管
step
    #label VentureCoKills
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
step << Shaman
    #season 2
    #loop
    .goto Mulgore,63.77,43.97,15,0
    .goto Mulgore,62.81,42.81,15,0
    .goto Mulgore,60.38,42.78,15,0
    .goto Mulgore,61.64,41.33,15,0
    .goto Mulgore,63.51,39.29,15,0
    .goto Mulgore,63.39,40.80,15,0
--  .goto Mulgore,66.53,39.47,15,0 --Very deep inside the top of the mine, skipping
    .goto Mulgore,60.99,37.00,15,0
    .goto Mulgore,59.64,36.05,15,0 --Outside
    .goto Mulgore,61.72,35.15,15,0 --Outside
    >>打开矿洞内以及矿洞另一侧外面的|cRXP_PICK_冲击补给品货车|r，拾取|cRXP_LOOT_爆盐采矿炸弹|r
    >>|cRXP_WARN_尽量待在洞穴上层|r
    .complete 76156,1 --Seaforium Mining Charge (5)
    .train 410104,1
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
    .turnin 764 >>交任务：风险投资公司
    .turnin 765 >>交任务：菲兹普罗克主管
	.unitscan 摩林·云行者
step << Druid
    #season 2
    #loop
    .goto Mulgore,66.34,67.01,0
    .goto Mulgore,67.19,63.78,50,0
    .goto Mulgore,66.34,67.01,50,0
    .goto Mulgore,63.86,66.31,50,0
    .goto Mulgore,61.81,65.52,50,0
    .goto Mulgore,61.61,61.32,50,0
    .goto Mulgore,63.58,60.51,50,0
    .goto Mulgore,65.56,59.37,50,0
    .goto Mulgore,67.62,59.06,50,0
    >>击杀|cRXP_ENEMY_平原徘徊者|r和|cRXP_ENEMY_草原狼前锋|r，拾取 |T134903:0|t[|cRXP_FRIENDLY_怒熊神像|r]
    .collect 206954,1 --Idol of Ursine Rage (1)
    .mob 平原徘徊者
    .mob 草原狼前锋
    .train 410025,1
step << Druid
    #season 2
    .equip 18,206954 >> |cRXP_WARN_装备|r |T134903:0|t[|cRXP_FRIENDLY_怒熊神像|r]
    .use 206954
    .train 410025,1
    .itemcount 206954,1
step << skip
    #label AlphaTeeth
    .goto Mulgore,67.19,63.78,50,0
    .goto Mulgore,66.34,67.01,50,0
    .goto Mulgore,63.86,66.31,50,0
    .goto Mulgore,61.81,65.52,50,0
    .goto Mulgore,61.61,61.32,50,0
    .goto Mulgore,63.58,60.51,50,0
    .goto Mulgore,65.56,59.37,50,0
    .goto Mulgore,67.62,59.06,50,0
    .goto Mulgore,66.34,67.01
    >>击杀该区域的|cRXP_ENEMY_草原狼前锋|r，拾取掉落的|cRXP_LOOT_牙齿|r
    .complete 759,1 --Prairie Alpha Tooth (8)
    .mob 草原狼前锋
step
    #optional
    #label AlphaTeeth

step << skip
    #softcore
	#completewith Thunderhorn2
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << skip
    #hardcore
    #completewith Thunderhorn2
    .goto Mulgore,46.5,55.5,150 >> 返回血蹄村
step << skip
    #label Thunderhorn2
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔|r交谈
    .turnin 759 >>交任务：蛮鬃图腾
    .accept 760 >>接任务：净化蛮鬃之井
    .target 穆尔·雷角
step
    .goto Mulgore,69.6,60.4,100,0
    .zone The Barrens >> 前往贫瘠之地
step << Druid
    .goto The Barrens,44.45,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r 交谈
    .fp Camp Taurajo >>开通陶拉祖营地飞行点
    .target 欧姆萨·雷角

step << Druid
    .goto The Barrens,44.45,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r 交谈
    .fp Camp Taurajo >> 开通陶拉祖营地飞行点
    .fly Thunder Bluff >>飞往雷霆崖
    .target 欧姆萨·雷角
    .isQuestAvailable 5922
step << Druid
    .goto Thunder Bluff,45.83,64.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将炉石绑定在雷霆崖
    .target 旅店老板帕拉
    .bindlocation 1638
    .isQuestAvailable 5922
step << Druid
    .goto Thunder Bluff,78.1,28.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈缪尔·符文图腾|r交谈
    .accept 886 >>接任务：贫瘠之地的绿洲
    .target 大德鲁伊哈缪尔·符文图腾
    .isQuestAvailable 5922
step << Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克|r交谈
    .goto Thunder Bluff,76.7,27.3
    .turnin 5928 >>交任务：响应召唤
    .accept 5922 >>接任务：月光林地
    .target 图拉克·符文图腾
    .isOnQuest 5928
step << Druid
    .goto Thunder Bluff,76.7,27.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克|r交谈
    .accept 5922 >>接任务：月光林地
    .target 图拉克·符文图腾
step << Druid
    .isOnQuest 5922
    #completewith next
    .cast 18960 >>施放 |T135758:0|t[传送：月光林地]
    .zoneskip Moonglade
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 5922 >>交任务：月光林地
    .accept 5930 >>接任务：巨熊之灵
    .target 德迪利特·星焰
step << Druid
    .goto Moonglade,39.2,27.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨熊之灵|r交谈
    .complete 5930,1 --Seek out the Great Bear Spirit and learn what it has to share with you about the nature of the bear. (1)
    .target 巨熊之灵
    .skipgossip
step << Druid
    .isOnQuest 5930
    #completewith next
    .cast 18960 >>施放 |T135758:0|t[传送：月光林地]
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 5930 >>交任务：巨熊之灵
    .accept 5932 >>接任务：返回雷霆崖
    .target 德迪利特·星焰
step << Druid
    .isOnQuest 5932
    #completewith DruidBearForm
    .hs >> 使用炉石返回雷霆崖
    .cooldown item,6948,>0
    .use 6948
    .bindlocation 1638,1
    .zoneskip Thunder Bluff
step << Druid
    .isOnQuest 5932
    #completewith next
    .goto Moonglade,44.29,45.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布瑟恩·草风|r 交谈
    .fly Thunder Bluff >> 飞往雷霆崖
    .target 布瑟恩·草风
    .zoneskip Thunder Bluff
    .cooldown item,6948,<0
step << Druid
    #label DruidBearForm
    .goto Thunder Bluff,76.7,27.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克|r交谈
    .turnin 5932 >>交任务：返回雷霆崖
    .accept 6002 >>接任务：身心之力
    .target 图拉克·符文图腾
step << Druid
    .isOnQuest 6002
    .isQuestNotComplete 6002
    #completewith next
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
    .fly Camp Taurajo >>飞往陶拉祖营地
    .target 塔尔
    .zoneskip Thunder Bluff,1
step << Druid
    .goto The Barrens,42.00,60.86
    .use 15710 >>前往月夜枭兽之石，使用 |T132857:0|t[赛纳里奥银尘]，然后击杀 |cRXP_ENEMY_月爪枭兽|r
    >>击杀后与 |cRXP_FRIENDLY_月爪枭兽的灵魂|r 交谈，完成考验
    .target 月爪枭兽的灵魂
    .skipgossip
    >>|cRXP_WARN_避开该区域的|r |cRXP_ENEMY_电角蜥蜴|r|cRXP_WARN_。|r
    .complete 6002,1 --Face Lunaclaw and earn the strength of body and heart it possesses. (1)
    .use 15710
    .mob 月爪枭兽
step << !Druid
    .goto The Barrens,44.45,59.15
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r 交谈
    .fp Camp Taurajo >> 开通陶拉祖营地飞行点
	.target 欧姆萨·雷角
    .isQuestAvailable 5922
step << Tauren
    .goto The Barrens,44.9,58.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔格·锐角|r交谈
    .accept 854 >>接任务：十字路口之旅
    .target 基尔格·锐角
step
    #completewith next
    .subzone 380 >>向北前往十字路口
step
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图加·符文图腾|r交谈
    .turnin 886 >>交任务：贫瘠之地的绿洲 << Druid
    .accept 870 >>接任务：遗忘之池
    .target 图加·符文图腾
step
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板伯兰德·草风|r交谈
    .home 380 >>将炉石绑定在十字路口
    .target 旅店老板伯兰德·草风
    .bindlocation 380
    .subzoneskip 380,1
step << Tauren
    .goto The Barrens,51.5,30.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .turnin 854 >>交任务：十字路口之旅
    .target 索克
step << Tauren
    .goto The Barrens,51.21,29.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加翰·鹰翼|r交谈
    .accept 6361 >>接任务：一捆兽皮
    .target 加翰·鹰翼
step
    #xprate <2.1
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    .accept 848 >>接任务：菌类孢子
    .accept 1492 >>接任务：码头管理员迪兹维格
    .target 药剂师赫布瑞姆
step
    #xprate <2.1
    #completewith next
    >>在遗忘之池周围收集|cRXP_LOOT_丰满的蘑菇|r
    >>|cRXP_WARN_采集蘑菇时, 请与 |cRXP_ENEMY_科卡尔|r |cRXP_WARN_保持最大距离. 它们的等级为 12-14 级|r
    >>|cRXP_WARN_此任务后续奖励为强力的 |cRXP_FRIENDLY_锅炉搅拌器|r |cRXP_WARN_。如果你暂时不打算使用它，可以先跳过此任务|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    #xprate <2.1
    .goto The Barrens,45.06,22.54
    >>潜入水下，前往|cRXP_PICK_冒泡的裂隙|r
    .complete 870,1 --Explore the waters of the Forgotten Pools
step
    #xprate <2.1
    #loop
    .goto The Barrens,45.2,23.3,0
    .goto The Barrens,45.2,23.3,40,0
    .goto The Barrens,45.2,22.0,40,0
    .goto The Barrens,44.6,22.5,40,0
    .goto The Barrens,43.9,24.4,40,0
    >>在遗忘之池周围收集|cRXP_LOOT_丰满的蘑菇|r
    >>|cRXP_WARN_与该区域内的 |cRXP_ENEMY_科卡尔|r |cRXP_WARN_保持最大距离. 它们等级为 12-14 级|r
    >>|cRXP_WARN_此任务后续奖励为强力的 |cRXP_FRIENDLY_锅炉搅拌器|r |cRXP_WARN_。如果你暂时不打算使用它，可以先跳过此任务|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    #xprate <2.1
    #softcore
	#completewith ZamahPickup
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #xprate <2.1
    #hardcore
    #completewith ZamahPickup
    .subzone 380 >> 返回十字路口
step
    #xprate <2.1
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图加·符文图腾|r交谈
    .turnin 870 >>交任务  遗忘之池
    .accept 877 >>接受任务死水绿洲
    .target 图加·符文图腾
    .isQuestComplete 870
step
    #xprate <2.1
    #optional
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图加·符文图腾|r交谈
    .turnin 870 >>交任务  遗忘之池
    .accept 877 >>接受任务死水绿洲
    .target 图加·符文图腾
    .isQuestTurnedIn 870
step
    #xprate <2.1
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    >>|cRXP_WARN_等待剧情演出结束|r
    >>|cRXP_WARN_接取后会开启45分钟限时任务|r
    .turnin 848 >>交任务 菌类孢子
    .timer 7,菌类孢子剧情演出
    .accept 853 >>接受任务药剂师扎玛
    .target 药剂师赫布瑞姆
    .isQuestComplete 848
step
    #xprate <2.1
    #optional
    #label ZamahPickup
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    >>|cRXP_WARN_接取后将开启 45 分钟限时任务|r
    .accept 853 >>接受任务药剂师扎玛
    .target 药剂师赫布瑞姆
    .isQuestTurnedIn 848
step
    #xprate <2.1
    #sticky
    #completewith CauldronStirrer
    +|cRXP_WARN_这是限时任务，不要挂机；按本指南路线，预计会在接取后约5–10分钟交任务|r
    .isOnQuest 853
step << Tauren
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .turnin 6361 >>交任务：一捆兽皮
    .accept 6362 >>接任务：飞往雷霆崖
    .target 迪弗拉克
step
    #completewith RideToTB
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Thunder Bluff >>飞往雷霆崖
    .target 迪弗拉克
    .zoneskip Thunder Bluff
step
    #label RideToTB
    .goto Thunder Bluff,45.6,55.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安哈努|r交谈 << Tauren
    .turnin 6362 >>交任务：飞往雷霆崖 << Tauren
    .accept 6363 >>接受任务：双足飞龙管理员塔尔 << Tauren
    .target 安哈努 << Tauren
    .goto Thunder Bluff,45.60,55.90,15 >>抵达雷霆崖 << !Tauren
step
    .goto Thunder Bluff,61.3,80.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅洛·石蹄|r交谈
    .turnin 861 >>交任务：猎人之道
    .accept 860 >>接任务：瑟格拉·黑棘
    .target 梅洛·石蹄
    .isQuestComplete 861
step
    .goto Thunder Bluff,61.3,80.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅洛·石蹄|r交谈
    .accept 860 >>接任务：瑟格拉·黑棘
    .target 梅洛·石蹄
    .isQuestTurnedIn 861
step << Hunter Tauren
	.goto Thunder Bluff,57.4,89.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_浩特·雷角|r 交谈
	.turnin 6089 >> 交任务：训练野兽
    .target 浩特·雷角
step << Hunter
    #optional
	.goto Thunder Bluff,57.4,89.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_浩特·雷角|r 交谈
    .train 14281 >> 学习职业技能
    .target 浩特·雷角
    .xp <12,1
step << Hunter
    .spellmissing 1515
    .goto Thunder Bluff,54.08,84.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫苏瓦·雷角|r交谈
    >>|cRXP_WARN_将|r |T132162:0|t[训练野兽]|cRXP_WARN_拖到动作栏上，再教宠物学习技能|r
    .train 24547 >>学习宠物技能
    .target 赫苏瓦·雷角
step << Warrior
    #optional
    .goto Thunder Bluff,57.59,85.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科尔·狂暴图腾|r 交谈
    .train 7384 >> 学习职业技能
    .target 科尔·狂暴图腾
    .xp <12,1
step << Druid
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 199 >>学习双手锤
    .target 安塞瓦
    .money <0.1154
step << Warrior/Hunter
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 227 >>学习使用法杖
    .target 安塞瓦
step << Shaman
    #season 2
    .goto Thunder Bluff,37.8,59.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊恩·鹰爪|r交谈
    .accept 744 >>接受任务: 准备典礼
    .target 伊恩·鹰爪
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴通·阴影图腾|r交谈
    >>|cRXP_WARN_他处于|r |T132320:0|t[潜行中]
    .turnin 76156 >>交任务：大地母亲与匿同在
    .accept 76160 >>接任务：大地母亲与匿同在
    .target 巴通·阴影图腾
    .train 410104,1
step
    #xprate <2.1
    #completewith next
    .goto Thunder Bluff,28.14,32.97,40,0
    .goto Thunder Bluff,28.51,28.95,10 >> 前往灵魂高地，进入预见之池
step
    #xprate <2.1
    #label CauldronStirrer
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎玛|r交谈
    .turnin 853 >>交任务：药剂师扎玛
    .target 药剂师扎玛
    .isOnQuest 853
step
    #xprate <2.1
    #optional
    #completewith ReturntoJahan
    +|cRXP_WARN_装备|r |T135145:0|t[锅炉搅拌器]
    .use 5340
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
    .itemcount 5340,1
step << Shaman
    #optional
    .goto Thunder Bluff,23.64,18.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_提戈尔·逐星|r 交谈
    .train 547 >> 学习职业技能
    .target 提戈尔·逐星
    .xp <12,1
step << Warrior
    #season 2
    #completewith next
    .goto Thunder Bluff,28.73,18.00,-1
    .goto Thunder Bluff,26.19,18.65,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与灵魂高地上的|cRXP_FRIENDLY_奈塔里·傲翼|r和|cRXP_FRIENDLY_穆阿特|r交谈
    +等|cRXP_FRIENDLY_穆阿特|r变为敌对后将其击杀
    .target 奈塔里·傲翼
    .target 穆阿特
    .skipgossip
    --Gossipoption
step << Warrior
    #season 2
    .goto Thunder Bluff,28.73,18.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈塔里·傲翼|r交谈
    >>从她那里获得 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target 奈塔里·傲翼
    .train 425447,1
    .skipgossip
step << Warrior
    #season 2
    .train 425447 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .use 204716
    .itemcount 204716,1
step
    #label ReturntoJahan
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
    .turnin 6363 >>交任务：双足飞龙管理员塔尔 << Tauren
    .accept 6364 >>接受任务：向加翰回复 << Tauren
    .target 塔尔
    .fp Thunder Bluff >>开通雷霆崖飞行点 << !Tauren
step
    #xprate <2.1
    .goto Thunder Bluff,60.0,51.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·血蹄|r交谈
    .turnin 775 >>交任务：雷霆崖之旅
    --.accept 776 >>Accept Rites of the Earthmother
    .target 凯恩·血蹄
step << Druid
    .goto Thunder Bluff,76.477,27.221
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克|r交谈
    .turnin 6002 >>交任务：身心之力
    .target 图拉克·符文图腾
step << Druid
    #optional
    .goto Thunder Bluff,76.477,27.221
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图拉克|r 交谈
    .train 8936 >> 学习职业技能
    .target 图拉克·符文图腾
    .xp <12,1
step
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .accept 5722 >> 接任务：寻找背包
    .accept 5723 >> 接任务：试探敌人
    .target 拉哈罗
    .dungeon RFC
step
    #ah
    .goto Thunder Bluff,44.43,43.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫兰塔|r交谈
    >>|cRXP_WARN_这会解锁一个简单任务。如果已经学了 2 个专业，就跳过此步骤|r
    .train 8613 >>学习专业技能：|T134366:0|t[剥皮]
    .target 莫兰塔
step
    #optional
    #ah
    .goto Thunder Bluff,44.39,44.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔伦·陆行者|r 交谈
    .accept 768 >> 接任务：收集皮革
    .target 维尔伦·陆行者
    .skill skinning,<1,1
step
    #optional
    #ah
    .goto Thunder Bluff,40.39,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师斯塔比|r交谈
    >>|cRXP_BUY_从拍卖行购买十二张|r |T134252:0|t[轻皮] |cRXP_BUY_。|r
    .collect 2318,12,768,1 --Light Leather (12)
    .target 拍卖师斯塔比
    .skill skinning,<1,1
step
    #optional
    #ah
    .goto Thunder Bluff,44.39,44.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔伦·陆行者|r 交谈
    .turnin 768 >> 交任务：收集皮革
    .target 维尔伦·陆行者
    .skill skinning,<1,1
step << Hunter
    .spellmissing 1515
    .goto Thunder Bluff,52.32,47.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加|r交谈
    >>|cRXP_BUY_向她购买|r |T133972:0|t[硬肉干]|cRXP_BUY_，用来喂宠物|r
    .collect 117,5,744,1 --Tough Jerky (5)
    .target 卡加·迷雾行者
step << Shaman
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_风怒女巫|r，拾取掉落的|cRXP_LOOT_碧蓝色的羽毛|r
    >>击杀|cRXP_ENEMY_风怒女族长|r，拾取掉落的|cRXP_LOOT_古铜色的羽毛|r
    .complete 744,1 --Azure Feather (6)
    .mob +风怒女巫
    .complete 744,2 --Bronze Feather (6)
    .mob +风怒女族长
    .train 410104,1
step << Shaman
    #season 2
    #loop
    .goto Mulgore,37.18,12.36,0
    .goto Mulgore,38.80,16.03,10,0
    .goto Mulgore,37.79,10.86,10,0
    .goto Mulgore,38.01,10.21,10,0
    .goto Mulgore,38.55,8.10,10,0
    .goto Mulgore,38.06,7.47,10,0
    .goto Mulgore,37.36,9.99,10,0
    .goto Mulgore,37.31,10.41,10,0
    .goto Mulgore,35.80,11.21,10,0
    .goto Mulgore,36.20,11.41,10,0
    .goto Mulgore,36.21,12.60,10,0
    .goto Mulgore,36.55,12.84,10,0
    .goto Mulgore,36.65,13.26,10,0
    .goto Mulgore,37.18,12.36,10,0
    >>拾取地面上的|cRXP_LOOT_风怒球果|r
    .collect 206170,8,76160,1 --Windfury Cone (8)
    .train 410104,1
step << Shaman
    #season 2
    .isOnQuest 76160
    >>使用 |T134535:0|t[研钵和捣杵] 研磨8个 |cRXP_LOOT_风怒球果|r，制作 |cRXP_LOOT_松树药膏|r
    .use 206176
    .complete 76160,1
    .train 410104,1

step << Shaman
    #season 2
    #loop
    .goto Mulgore,31.7,28.2,0
    .goto Mulgore,30.2,19.5,0
    .goto Mulgore,31.7,28.2,40,0
    .goto Mulgore,30.2,19.5,40,0
    >>击杀|cRXP_ENEMY_风怒女巫|r，拾取掉落的|cRXP_LOOT_碧蓝色的羽毛|r
    >>击杀|cRXP_ENEMY_风怒女族长|r，拾取掉落的|cRXP_LOOT_古铜色的羽毛|r
    .complete 744,1 --Azure Feather (6)
    .mob +风怒女巫
    .complete 744,2 --Bronze Feather (6)
    .mob +风怒女族长
step << Shaman
    #season 2
    #completewith next
    .zone Thunder Bluff >> 返回雷霆崖
step << Shaman
    #season 2
    .goto Thunder Bluff,37.8,59.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊恩·鹰爪|r交谈
    .turnin 744 >>交任务: 准备典礼
    .target 伊恩·鹰爪
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴通·阴影图腾|r交谈
    >>|cRXP_WARN_他处于|r |T132320:0|t[潜行中]
    .turnin 76160 >>交任务：大地母亲与匿同在
    .accept 76240 >>接任务：大地母亲与匿同在
    .target 巴通·阴影图腾
    .train 410104,1
step << Shaman
    #season 2
    #ah
    .goto Thunder Bluff,45.23,59.40,0
    .goto Thunder Bluff,40.41,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师斯塔比|r交谈
    >>|cRXP_BUY_从拍卖行购买|r |T133894:0|t[新鲜的美味小鱼] |cRXP_BUY_|r
    .collect 6291,1,76240,1 --Raw Brilliant Smallfish (1)
    .target 拍卖师斯塔比
    .train 410104,1
step << Shaman
    #season 2
    #ssf
    #completewith Sewa
    .goto Thunder Bluff,46.13,51.59,12,0
    .goto Thunder Bluff,47.09,50.07,4,0
    .goto Thunder Bluff,46.49,49.16,4,0
    .goto Thunder Bluff,46.05,49.74,4,0
    .goto Thunder Bluff,46.34,50.50,4,0
    .goto Thunder Bluff,55.78,47.02,15 >>前往 |cRXP_FRIENDLY_苏瓦·迷雾行者|r 所在处
    .train 410104,1
step << Shaman
    #season 2
    #ssf
    #sticky
    #label Kah
    .goto Thunder Bluff,56.13,46.39,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔·迷雾行者|r交谈
    .train 7734 >>学习专业技能：|T136245:0|t[钓鱼]
    .target 卡尔·迷雾行者
    .train 410104,1
step << Shaman
    #season 2
    #ssf
    #label Sewa
    .goto Thunder Bluff,55.78,47.02,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏瓦·迷雾行者|r交谈
    >>|cRXP_BUY_向她购买|r |T132932:0|t[鱼竿]|cRXP_BUY_和|r |T134335:0|t[闪光的小珠] |cRXP_BUY_|r
    .collect 6256,1 --Fishing Pole (1)
    .collect 6529,1 --Shiny Bauble (1)
    .target 苏瓦·迷雾行者
    .train 410104,1
step << Shaman
    #season 2
    #ssf
    #completewith Fish
    #requires Kah
    #label Pole
    .equip 16,6256 >> |cRXP_WARN_装备|r |T132932:0|t[鱼竿]
    .use 6256
    .train 410104,1
step << Shaman
    #season 2
    #ssf
    #completewith Fish
    #requires Pole
    .cast 8087 >> |cRXP_WARN_使用|r |T134335:0|t[闪光的小珠] |cRXP_WARN_，将其附在|r |T132932:0|t[鱼竿]上
    .use 6529
    .train 410104,1
step << Shaman
    #season 2
    #ssf
    #label Fish
    #requires Kah
    .goto Thunder Bluff,40.42,58.55
    >>在池塘钓鱼，直到钓到 |T133894:0|t[|cRXP_LOOT_新鲜的美味小鱼|r]
    >>钓到鱼后，换回作战武器
    .collect 6291,1,76240,1 --Raw Brilliant Smallfish (1)
    .train 410104,1
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>在 |cRXP_FRIENDLY_巴通·阴影图腾|r 面前，使用 |T132147:0|t[一套匕首]制作 |T134007:0|t[鱼块]
    .complete 76240,1 --Fish Chunks (1)
    .use 206344
    .train 410104,1
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴通·阴影图腾|r交谈
    >>|cRXP_WARN_他处于|r |T132320:0|t[潜行中]
    .turnin 76240 >>交任务：大地母亲与匿同在
-- .train 410104 >>|cRXP_WARN_You will train|r |T236289:0|t[Lava Lash] |cRXP_WARN_and|r |T132147:0|t[Dual Wield] |cRXP_WARN_upon turnin|r
    .target 巴通·阴影图腾
    .train 410104,1
step
    #completewith HidesTurnIn
    .hs >> 使用炉石回到 [十字路口]
    .cooldown item,6948,>0
    .use 6948
    .bindlocation 380,1
    .subzoneskip 380
step
    #completewith next
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
    .fly Crossroads >>飞往十字路口
    .target 塔尔
    .zoneskip The Barrens
    .cooldown item,6948,<0
step
    #label HidesTurnIn
    .goto The Barrens,51.21,29.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加翰·鹰翼|r交谈 << Tauren
    .turnin 6364 >>交任务：向加翰回复 << Tauren
    .target 加翰·鹰翼 << Tauren
    .goto The Barrens,51.21,29.05,20 >>抵达十字路口 << !Tauren
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    .accept 1492 >>接任务：码头管理员迪兹维格
    .target 药剂师赫布瑞姆
step
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .accept 871 >>接任务：野猪人的袭击
    .accept 5041 >>接任务：十字路口的补给品
    .target 索克
step
    #xprate <2.1
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索克·快刀|r交谈
    >>|cRXP_WARN_他在塔顶|r
    .accept 867 >>接受任务 鹰身强盗
    .target 达索克·快刀
step
    #optional
    .goto The Barrens,52.23,31.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 860 >>交任务：瑟格拉·黑棘
    .accept 844 >>接任务：平原陆行鸟的威胁
    .target 瑟格拉·黑棘
    .isOnQuest 860
step
    .goto The Barrens,52.23,31.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .accept 844 >>接任务：平原陆行鸟的威胁
    .target 瑟格拉·黑棘
step
    .goto The Barrens,51.93,30.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹罗格|r交谈
    .accept 869 >>接任务：偷钱的迅猛龙
    .target 加兹罗格
step << Druid
    #season 2
    .train 410025,1
    #completewith next
    +|cRXP_WARN_前往十字路口外，变为熊形态与敌人作战。将怒气保持在50点或以上，持续至少60秒，才能学会|r |T132135:0|t[割碎]
step << Druid
    #season 2
    .train 410025 >> |cRXP_WARN_使用|r |T134903:0|t[|cRXP_FRIENDLY_怒熊神像|r] |cRXP_WARN_学习|r |T132135:0|t[割碎]
    .use 206954
    .itemcount 206954,1
step << Tauren Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_阿瑟罗克|r|cRXP_BUY_交谈，并向他购买|r |T135613:0|t[猎人火枪]|cRXP_BUY_|r
    .collect 2511,1,871,1 --Collect Hunter's Boomstick (1)
    .money <0.1324
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
    .target 阿瑟罗克
step << Tauren Hunter
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135613:0|t[猎人火枪]
    .use 2511
    .itemcount 2511,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Shaman
    #completewith next
    >>检查 |cRXP_PICK_老陈的空酒桶|r 是否在 |cRXP_FRIENDLY_卡纳尔·菲斯|r 旁边。拾取并使用它接取任务
    >>|cRXP_WARN_如果没有找到，可以稍后再来拿|r
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接受任务 老陈的空酒桶
    .use 4926
step << Shaman
    .goto The Barrens,55.86,19.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳尔·菲斯|r交谈
    .turnin 2984 >>交任务：火焰的召唤
    .accept 1524 >>接任务：火焰的召唤
    .target 卡纳尔·菲斯
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
    .goto Durotar,39.16,58.56,10 >> 沿山路向上前往 |cRXP_FRIENDLY_泰尔夫·祖拉姆|r 所在处
    >>|cRXP_WARN_小心不要掉下山，山路很窄。掉下去可能会死亡|r
step << Shaman
    #label CallofFire2
    .goto Durotar,38.52,58.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰尔夫·祖拉姆|r交谈
    .turnin 1524 >>交任务：火焰的召唤
    .accept 1525 >>接任务：火焰的召唤
    .target 泰尔夫·祖拉姆
step << Shaman
    .goto Durotar,50.8,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林|r交谈
    .accept 840 >>接任务：部落的新兵
    .target 塔克林·寻路者
step << Shaman
    #completewith next
    .goto Durotar,54.31,39.44,30,0
    .goto Durotar,52.8,28.7,20 >> 进入尘风洞窟
step << Shaman
    #loop
    .goto Durotar,53.18,29.15,0
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
step << Shaman
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加尔·战痕|r交谈
    .turnin 840 >>交任务：部落的新兵
    .accept 842 >>接任务：十字路口征兵
    .target 卡加尔·战痕
step << Warrior
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1505 >>交任务：老兵犹塞克
    .accept 1498 >>接任务：防御之道
    .target 犹塞克
step << Warrior
    #loop
    .goto Durotar,39.34,28.25,0
    .goto Durotar,39.11,30.76,40,0
    .goto Durotar,39.34,28.25,40,0
    .goto Durotar,39.11,26.46,40,0
    .goto Durotar,39.39,25.05,40,0
    .goto Durotar,40.00,24.06,40,0
    .goto Durotar,42.51,24.29,40,0
    .goto Durotar,39.34,28.25,40,0
    >>击杀 |cRXP_ENEMY_闪电蜥蜴|r，拾取其 |cRXP_ENEMY_鳞片|r
    .complete 1498,1 --Singed Scale (5)
    .mob 闪电蜥蜴
step << Warrior
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1498 >>交任务：防御之道
    .accept 1502 >>接任务：索恩格瑞姆·火眼
    .target 犹塞克
step
    #optional
    .abandon 761 >>放弃任务：猎捕猛鹫
step
    #optional
    .abandon 766 >>放弃任务 [马兹拉纳其]
]])
