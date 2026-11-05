RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（部落）
#hardcore
#classic
#tbc
<< Horde
#name 13-15 Silverpine Forest
#version 1
#group RestedXP Survival Guide (H)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
#next 15-19 The Barrens
#displayname 13-15 银松森林
step << Undead Rogue
    #sticky
    #completewith RotHideCluesTurnIn
    >>|cRXP_WARN_如果遇到|r|cRXP_FRIENDLY_阿斯托·哈德恩|r|cRXP_WARN_，与他交谈后击杀他，并从尸体上拾取阿斯托的介绍信。他会在布瑞尔和瑟伯切尔之间的道路上巡逻。|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan 阿斯托·哈德恩
step
    #label WorgHearts
    #completewith next
    >>击杀 |cRXP_ENEMY_座狼|r，在前往 |cRXP_FRIENDLY_埃兰德|r的途中顺路完成，拾取其 |cRXP_LOOT_心脏|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .mob 座狼
    .mob 杂斑座狼
    .unitscan 血牙狼人
step
    .goto Silverpine Forest,56.18,9.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵哨兵埃兰德|r交谈
    >>|cRXP_WARN_开始此任务前确保生命值和法力值已满|r
    .accept 435 >>接受任务 护送埃兰德
    .target 亡灵哨兵埃兰德
step
    #completewith next
    >>击杀|cRXP_ENEMY_座狼|r，获取|cRXP_LOOT_心脏|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .mob 座狼
    .mob 杂斑座狼
    .unitscan 血牙狼人
step
    .goto Silverpine Forest,56.25,10.27,30,0
    .goto Silverpine Forest,56.25,11.43,30,0
    .goto Silverpine Forest,56.17,12.62,30,0
    .goto Silverpine Forest,53.46,13.45
    >>护送|cRXP_FRIENDLY_埃兰德|r安全抵达|cRXP_FRIENDLY_兰妮·尤瑞克|r处。
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_座狼|r|cRXP_WARN_可能在同一位置重叠刷新，有机会就进食和饮水|r
    .complete 435,1 --Erland must reach Rane Yorick (1)
    .mob 座狼
step
    .goto Silverpine Forest,53.46,13.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .turnin 435 >>交任务 护送埃兰德
    .accept 429 >>接受任务 荒野之心
    .accept 449 >>接受任务 亡灵哨兵的报告
    .target 兰妮·尤瑞克
step
    #loop
    .goto Silverpine Forest,57.72,10.07,0
    .goto Silverpine Forest,55.96,16.18,50,0
    .goto Silverpine Forest,58.37,15.56,50,0
    .goto Silverpine Forest,59.40,13.58,50,0
    .goto Silverpine Forest,60.11,10.51,50,0
    .goto Silverpine Forest,57.72,10.07,50,0
    >>击杀|cRXP_ENEMY_座狼|r，获取|cRXP_LOOT_心脏|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .mob 座狼
    .mob 杂斑座狼
    .unitscan 血牙狼人
step
    #completewith next
    .goto Silverpine Forest,49.77,28.66,50,0
    .goto Silverpine Forest,49.77,33.05,50,0
    .goto Silverpine Forest,49.64,37.84,100,0
    .goto Silverpine Forest,45.51,41.26,100 >> 前往瑟伯切尔
    .subzoneskip 228
step
    .goto Silverpine Forest,44.20,39.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔|r交谈
    .accept 421 >>接受任务 证明你的价值
    .target 达拉尔·道恩维沃尔
step << !Mage !Priest
    .goto Silverpine Forest,44.05,39.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格乌恩|r交谈
    .vendor >> |cRXP_BUY_从他那里购买|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_。|r
    .collect 4605,20,421,1 --Red-speckled Mushroom (20)
    .target 格乌恩·法隆
    .money <0.05
step
    .goto Silverpine Forest,43.98,39.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德温|r交谈
    >>|cRXP_BUY_向他购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_。|r << Mage/Warlock/Priest/Shaman/Druid
    .vendor >> |cRXP_BUY_若有货，从他那里购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_。|r
    .collect 1179,20,421,1 << Mage/Warlock/Priest/Shaman/Druid --Ice Cold Milk (20)
    .target 艾德温·哈里
    .money <0.05 << Mage/Warlock/Priest/Shaman/Druid
step << Undead
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师奥利斯特|r和|cRXP_FRIENDLY_亡灵卫兵博迪瑞格|r交谈。
    .accept 477 >>接受任务 越境
    .target +暗影牧师奥利斯特
    .goto Silverpine Forest,43.98,40.93
    .accept 6321 >>接受任务 瑟伯切尔的补给
    .target +亡灵卫兵博迪瑞格
    .goto Silverpine Forest,43.43,41.67
step
    #label BorderCrossings
    .goto Silverpine Forest,43.98,40.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师奥利斯特|r交谈。
    .accept 477 >>接受任务 越境
    .target 暗影牧师奥利斯特
step
    #completewith next
    .goto Silverpine Forest,43.09,41.33,8,0
    .goto Silverpine Forest,42.75,41.30,8,0
    .goto Silverpine Forest,42.76,40.90,8,0
    .goto Silverpine Forest,43.43,40.87,2 >> 进入墓穴
step
    .goto Silverpine Forest,43.43,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地穴中的|cRXP_FRIENDLY_高级执行官哈德瑞克|r交谈。
    .turnin 449 >>交任务 亡灵哨兵的报告
    .accept 3221 >>接受任务 与伦弗利尔会面
    .accept 437 >>接受任务 亡者农场
    .target 高级执行官哈德瑞克
step
    .goto Silverpine Forest,42.79,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师伦弗利尔|r交谈
    .turnin 429 >>交任务 荒野之心
    .turnin 445 >>交任务 给银松森林送信
    .turnin 3221 >>交任务 与伦弗利尔会面
    .accept 1359 >>接受任务 给金格的货物
    .accept 447 >>接受任务 致命的配方
    .accept 430 >>接受任务 回到奎恩身旁
    .target 药剂师伦弗利尔
    .addquestitem 3164,429
step
    #loop
    .goto Silverpine Forest,49.12,36.72,0
    .goto Silverpine Forest,50.32,39.22,50,0
    .goto Silverpine Forest,51.86,41.56,50,0
    .goto Silverpine Forest,51.53,43.06,50,0
    .goto Silverpine Forest,51.62,44.85,50,0
    .goto Silverpine Forest,51.80,46.60,50,0
    .goto Silverpine Forest,50.83,47.74,50,0
    .goto Silverpine Forest,49.12,36.72,50,0
    >>击杀|cRXP_ENEMY_月怒白头狼人|r
    .complete 421,1 --Moonrage Whitescalp (5)
    .mob 月怒白头狼人
    .unitscan 阿鲁高之子
step
    .goto Silverpine Forest,44.20,39.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔·道恩维沃尔|r交谈。
    .target 达拉尔·道恩维沃尔
    .turnin 421 >>交任务 证明你的价值
    .accept 422 >>接受任务 阿鲁高的愚行
step
    #completewith Remedy
    .goto Silverpine Forest,52.74,27.70,80 >> 前往瓦尔甘农场
step
    #label Remedy
    .goto Silverpine Forest,52.74,27.70,8,0
    .goto Silverpine Forest,53.13,27.92,8,0
    .goto Silverpine Forest,52.94,27.88,8,0
    .goto Silverpine Forest,52.83,28.56
    >>进入房屋并上到二楼。拾取地上的 |cRXP_PICK_布满灰尘的法术书|r
    .complete 422,1 --Remedy of Arugal (1)
step
    #completewith next
    .goto Silverpine Forest,53.39,13.32,80 >> 前往伊瓦农场
step
    #label QuinnYorick
    .goto Silverpine Forest,53.39,13.32,8,0
    .goto Silverpine Forest,53.08,13.11,8,0
    .goto Silverpine Forest,53.27,13.16,8,0
    .goto Silverpine Forest,53.43,12.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与房子二楼的|cRXP_FRIENDLY_奎恩·尤瑞克|r交谈
    .turnin 430 >>交任务 回到奎恩身旁
    .target 奎恩·尤瑞克
step
    .goto Silverpine Forest,53.46,13.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .accept 425 >>接受任务 邪恶的伊瓦
    .target 兰妮·尤瑞克
step
    .goto Silverpine Forest,52.01,14.02,6,0
    .goto Silverpine Forest,51.89,13.82,6,0
    .goto Silverpine Forest,51.54,13.91
    >>击杀|cRXP_ENEMY_邪恶的伊瓦|r，获取|cRXP_LOOT_头颅|r
    >>|cRXP_WARN_小心！先清理谷仓前方的整个区域，再把|r|cRXP_ENEMY_鸦爪奴隶|r|cRXP_WARN_逐个拉到外面。|r
    >>|cRXP_WARN_伊瓦在谷仓内受到两名|r|cRXP_ENEMY_鸦爪奴隶|r|cRXP_WARN_的保护。趁其中一名向前巡逻时，可以单独把他拉出来。|r
    >>|cRXP_WARN_注意：他们免疫恐惧！|r << Priest/Warlock
    .complete 425,1 --Ivar's Head (1)
    .target 邪恶的伊瓦
    .mob 鸦爪奴隶
step
    .goto Silverpine Forest,53.46,13.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .turnin 425 >>交任务 邪恶的伊瓦
    .target 兰妮·尤瑞克
step
    #completewith ArugalTurnin
    +|cRXP_WARN_小心！附近可能有|r|cRXP_ENEMY_阿鲁高之子|r|cRXP_WARN_出没。这是25级精英怪，务必避开！|r
    .unitscan 阿鲁高之子
step
    #completewith Nightlash
    >>击杀|cRXP_ENEMY_熊|r，获取|cRXP_LOOT_心脏|r
    .complete 447,1 --Grizzled Bear Heart (6)
    .mob 凶猛的灰斑熊
    .mob 巨型灰斑熊
    .unitscan 维斯迦尔
step
    #label Nightlash
    .goto Silverpine Forest,45.44,21.01
    >>在亡者农场周围击杀|cRXP_ENEMY_腐皮豺狼人|r，直到|cRXP_ENEMY_奈塔拉什|r出现。击杀她并拾取掉落的|cRXP_LOOT_奈塔拉什的灵魂|r。
    >>|cRXP_WARN_注意：他们免疫恐惧！|r << Priest/Warlock
    .complete 437,1 --Enter the Dead Fields (1)
    .complete 437,2 --Essence of Nightlash (1)
    .unitscan 奈塔拉什
    .mob 腐皮巡林者
    .mob 腐皮秘法师
step
    #completewith KillianVendor
    >>击杀|cRXP_ENEMY_熊|r，获取|cRXP_LOOT_心脏|r
    .complete 447,1 --Grizzled Bear Heart (6)
    .mob 凶猛的灰斑熊
    .mob 巨型灰斑熊
    .unitscan 维斯迦尔
    .unitscan 阿鲁高之子
step
    #completewith next
    >>击杀|cRXP_ENEMY_蜘蛛|r，获取|cRXP_LOOT_血液|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯|r|cRXP_WARN_出现时务必避开，她能轻易击杀你！她有一个冷却时间为15秒、造成130点伤害的护盾技能，以及一个造成110点伤害的瞬发冲击技能。|r
    .complete 447,2 --Skittering Blood (6)
    .mob 苔藓阔步者
    .unitscan 克雷希斯
    .unitscan 阿鲁高之子
step
    #label KillianVendor
    .goto Silverpine Forest,33.00,17.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基利恩|r交谈
    .vendor >> 卖掉杂物
    .target 基利恩·萨纳森
    .isOnQuest 447
step
    #loop
	.goto Silverpine Forest,36.33,14.20,0
	.goto Silverpine Forest,37.25,15.99,50,0
	.goto Silverpine Forest,35.67,16.01,50,0
	.goto Silverpine Forest,34.96,16.34,50,0
	.goto Silverpine Forest,33.99,17.24,50,0
	.goto Silverpine Forest,34.14,15.26,50,0
	.goto Silverpine Forest,35.06,14.50,50,0
	.goto Silverpine Forest,35.85,13.83,50,0
	.goto Silverpine Forest,36.33,14.20,50,0
    >>击杀|cRXP_ENEMY_蜘蛛|r，获取|cRXP_LOOT_血液|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯|r|cRXP_WARN_出现时务必避开，她能轻易击杀你！她有一个冷却时间为15秒、造成130点伤害的护盾技能，以及一个造成110点伤害的瞬发冲击技能。|r
    .complete 447,2 --Skittering Blood (6)
    .mob 苔藓阔步者
    .unitscan 克雷希斯
    .unitscan 阿鲁高之子
step
    #loop
    .goto Silverpine Forest,41.60,21.65,0
    .goto Silverpine Forest,41.37,19.64,50,0
    .goto Silverpine Forest,41.60,21.65,50,0
    .goto Silverpine Forest,42.36,23.77,50,0
    .goto Silverpine Forest,44.67,24.84,50,0
    .goto Silverpine Forest,46.08,26.62,50,0
    >>继续击杀|cRXP_ENEMY_熊|r，从尸体上收集齐|cRXP_LOOT_灰熊的心脏|r。
    .complete 447,1 --Grizzled Bear Heart (6)
    .mob 凶猛的灰斑熊
    .mob 巨型灰斑熊
    .unitscan 维斯迦尔
    .unitscan 阿鲁高之子
step
    #completewith next
    .goto Silverpine Forest,45.51,41.26,100 >> 返回瑟伯切尔
    .subzoneskip 228
step
    #label ArugalTurnin
    .goto Silverpine Forest,44.20,39.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔|r交谈
    .turnin 422 >> 交任务 阿鲁高的愚行
    .accept 423 >> 接受任务 阿鲁高的愚行
    .target 达拉尔·道恩维沃尔
step
    #completewith next
    .goto Silverpine Forest,43.09,41.33,8,0
    .goto Silverpine Forest,42.75,41.30,8,0
    .goto Silverpine Forest,42.76,40.90,8,0
    .goto Silverpine Forest,43.43,40.87,2 >> 进入墓穴
step
    .goto Silverpine Forest,43.43,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地下室的|cRXP_FRIENDLY_高级执行官哈德瑞克|r交谈
    .turnin 437 >> 交任务 亡者农场
    .accept 438 >> 接受任务 破旧渡口
    .target 高级执行官哈德瑞克
step << !Mage !Priest
    .goto Silverpine Forest,44.05,39.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格乌恩|r交谈
    >>|cRXP_BUY_向她购买|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_。|r
    .vendor >> 卖掉杂物
    .collect 4605,20,423,1 --Red-speckled Mushroom (20)
    .target 格乌恩·法隆
step
    .goto Silverpine Forest,43.98,39.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德温|r交谈
    >>|cRXP_BUY_向他购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_。|r << Warlock/Priest/Shaman/Druid
    .vendor >> |cRXP_BUY_若有货，从他那里购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_。|r
    .collect 1179,20,423,1 << Warlock/Priest/Shaman/Druid --Ice Cold Milk (20)
    .target 艾德温·哈里
step << Warlock/Mage/Priest
    .goto Silverpine Forest,44.80,39.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德利亚|r交谈
    .vendor >> 若有货，从她那里购买|T132491:0|t[|cRXP_FRIENDLY_智者腰带|r]。
    .target 安德利亚·波恩顿
    .money <0.1400
step << Hunter
    .goto Silverpine Forest,45.01,39.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳迪亚|r交谈
    >>如果在售, 向她购买 |T135490:0|t[|cRXP_FRIENDLY_精良的长弓|r]
    .collect 11304,1,438,1 --Fine Longbow (1)
    .collect 2515,1200,438,1 << Hunter --Sharp Arrow (1200)
    .target 纳迪亚·沃农
    .money <0.2633
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.5
    .equip 18,11304
step << Hunter/Rogue
    .goto Silverpine Forest,44.61,39.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚历山德勒·雷夫瑞|r交谈
    .vendor >> 若有货，向她购买 |T132539:0|t[|cRXP_FRIENDLY_轻便靴|r]
    .target 亚历山德勒·雷夫瑞
    .money <0.2633
step << Shaman/Warrior/Druid
    .goto Silverpine Forest,44.61,39.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚历山德勒·雷夫瑞|r交谈
    .vendor >> 如果在售, 购买 |T132539:0|t[|cRXP_FRIENDLY_轻便靴|r] 或 |T132537:0|t[|cRXP_FRIENDLY_马靴|r]
    .target 亚历山德勒·雷夫瑞
    .money <0.2000
step << Warlock/Mage/Priest
    #optional
    #completewith Shackles
    +|cRXP_WARN_装备|r |T132491:0|t[|cRXP_FRIENDLY_智者腰带|r]
    .use 4786
    .itemcount 4786,1
    .xp <15,1
    .equip 6,4786
step << Hunter
    #optional
    #completewith Shackles
    +|cRXP_WARN_装备|r |T135490:0|t[|cRXP_FRIENDLY_精良的长弓|r]
    .use 11304
    .itemcount 11304,1
    .xp <14,1
    .equip 18,11304
step << Hunter/Rogue
    #optional
    #completewith Shackles
    +|cRXP_WARN_装备|r |T132539:0|t[|cRXP_FRIENDLY_轻便靴|r]
    .use 4788
    .itemcount 4788,1
    .xp <15,1
    .equip 8,4788
step << Shaman/Warrior/Druid
    #optional
    #completewith Shackles
    +|cRXP_WARN_装备|r |T132539:0|t[|cRXP_FRIENDLY_轻便靴|r]
    .use 4788
    .itemcount 4788,1
    .xp <15,1
    .equip 8,4788
step << Shaman/Warrior/Druid
    #optional
    #completewith Shackles
    +|cRXP_WARN_装备|r |T132537:0|t[|cRXP_FRIENDLY_马靴|r]
    .use 4789
    .itemcount 4789,1
    .equip 8,4789
step
    #completewith Shackles
    .goto Silverpine Forest,44.20,38.17,15,0
    .goto Silverpine Forest,44.46,36.65,15,0
    .goto Silverpine Forest,44.91,33.14,30 >> 沿山坡下行
step
    #completewith DecrepitFerry
    +|cRXP_WARN_小心！附近可能有|r |cRXP_ENEMY_阿鲁高之子|r |cRXP_WARN_出没！这是25级精英，务必远离他！|r
    .unitscan 阿鲁高之子
step
    #label Shackles
    #loop
	.goto Silverpine Forest,43.83,31.00,0
	.goto Silverpine Forest,44.22,31.55,50,0
	.goto Silverpine Forest,43.51,32.38,50,0
	.goto Silverpine Forest,42.61,31.12,50,0
	.goto Silverpine Forest,41.28,30.25,50,0
	.goto Silverpine Forest,39.70,30.24,50,0
	.goto Silverpine Forest,38.96,29.15,50,0
	.goto Silverpine Forest,38.28,27.10,50,0
	.goto Silverpine Forest,37.60,24.16,50,0
	.goto Silverpine Forest,38.07,23.13,50,0
	.goto Silverpine Forest,38.56,21.93,50,0
	.goto Silverpine Forest,39.73,23.26,50,0
	.goto Silverpine Forest,41.49,23.51,50,0
	.goto Silverpine Forest,41.14,25.50,50,0
	.goto Silverpine Forest,41.17,28.26,50,0
	.goto Silverpine Forest,42.01,29.27,50,0
	.goto Silverpine Forest,43.83,31.00,50,0
    >>击杀|cRXP_ENEMY_月怒暴食者|r和|cRXP_ENEMY_月怒魔魂狼人|r，拾取掉落的|cRXP_LOOT_暴食者镣铐和魔魂镣铐|r。
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_月怒魔魂狼人|r|cRXP_WARN_生命值低于25%时会狂暴；它们血量较低时要尽快击杀。|r
    .complete 423,1 --Glutton Shackle (6)
    .mob +月怒暴食者
    .complete 423,2 --Darksoul Shackle (3)
    .mob +月怒魔魂狼人
    .unitscan 阿鲁高之子
step
    #label DecrepitFerry
    .goto Silverpine Forest,58.39,34.79
    >>点击码头边的|cRXP_PICK_小船|r
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_鸦爪之手|r|cRXP_WARN_最高可达16级，拥有近战范围的5秒眩晕技能。|r
    .turnin 438 >>交任务 破旧渡口
    .accept 439 >>接受任务 线索
step
    .goto Silverpine Forest,49.89,60.33
    >>点击营地里的|cRXP_PICK_板条箱|r
    >>|cRXP_WARN_小心！这些小怪会施放|r |T135846:0|t[寒冰箭]|cRXP_WARN_，并在低血量时逃跑。把它们逐个拉回来击杀，直到能安全点击箱子。|r
    .turnin 477 >>交任务 越境
    .accept 478 >>接受任务 地图与符记
    .mob 达拉然学徒
step
    #completewith next
    .goto Silverpine Forest,45.51,41.26,100 >> 返回瑟伯切尔
    .subzoneskip 228
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师奥利斯特|r和|cRXP_FRIENDLY_达拉尔·道恩维沃尔|r交谈。
    .turnin 478 >>交任务 地图与符记
    .accept 481 >>接受任务 达拉尔的推理
    .target +暗影牧师奥利斯特
    .goto Silverpine Forest,43.98,40.93
    .turnin 423 >>交任务 阿鲁高的愚行
    .turnin 481 >>交任务 达拉尔的推理
    .accept 482 >>接受任务 达拉然的意图
    .accept 424 >>接受任务 阿鲁高的愚行
    .target +达拉尔·道恩维沃尔
    .goto Silverpine Forest,44.20,39.73
    .group
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师奥利斯特|r和|cRXP_FRIENDLY_达拉尔·道恩维沃尔|r交谈。
    .turnin 478 >>交任务 地图与符记
    .accept 481 >>接受任务 达拉尔的推理
    .target +暗影牧师奥利斯特
    .goto Silverpine Forest,43.98,40.93
    .turnin 423 >>交任务 阿鲁高的愚行
    .turnin 481 >>交任务 达拉尔的推理
    .accept 482 >>接受任务 达拉然的意图
    .target +达拉尔·道恩维沃尔
    .goto Silverpine Forest,44.20,39.73
step
    .goto Silverpine Forest,43.98,40.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师奥利斯特|r交谈。
    .turnin 482 >>交任务 达拉然的意图
    .target 暗影牧师奥利斯特
step
    .goto Silverpine Forest,43.98,40.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师奥利斯特|r交谈。
    .accept 479 >>接受任务 调查安伯米尔
    .target 暗影牧师奥利斯特
    .group
step
    .goto Silverpine Forest,43.98,40.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师奥利斯特|r交谈。
    .turnin 482 >>交任务 达拉然的意图
    .target 暗影牧师奥利斯特
step
    #completewith next
    .goto Silverpine Forest,43.09,41.33,8,0
    .goto Silverpine Forest,42.75,41.30,8,0
    .goto Silverpine Forest,42.76,40.90,8,0
    .goto Silverpine Forest,43.43,40.87,2 >> 进入墓穴
step
    #label RotHideCluesTurnIn
    .goto Silverpine Forest,43.43,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地穴中的|cRXP_FRIENDLY_高级执行官哈德瑞克|r交谈。
    .turnin 439 >>交任务 线索
    .accept 440 >>接受任务 黛丽娅的戒指
    .target 高级执行官哈德瑞克
step << Undead
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡洛斯·拉佐克|r交谈
    .turnin 6321 >>交任务 瑟伯切尔的补给
    .accept 6323 >>接受任务 飞往幽暗城
    .target 卡洛斯·拉佐克
step
    #completewith ZingeAndFaranell
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡洛斯|r交谈
    .fp Sepulcher >> 获取瑟伯切尔飞行点 << !Undead
    .fly Undercity >> 飞往幽暗城
    .target 卡洛斯·拉佐克
    .zoneskip Undercity
step << Undead
    .goto Undercity,61.48,41.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高顿·温德哈姆|r交谈
    .turnin 6323 >> 交任务：飞往幽暗城
    .accept 6322 >> 接任务：迈克尔·加勒特
    .target 高顿·温德哈姆
step << Troll Warrior/Undead Warrior
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_刘易斯·瓦伦|r|cRXP_BUY_交谈，并向他购买一把|r |T135147:0|t[法师之杖]|cRXP_BUY_。|r
    .collect 2030,1,479,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target 刘易斯·瓦伦
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Troll Warrior/Undead Warrior
    #completewith PyrewoodAmbush
    +达到15级后装备 |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Orc Warrior
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_刘易斯·瓦伦|r|cRXP_BUY_交谈，并向他购买一把|r |T132394:0|t[芒刺斧]|cRXP_BUY_。|r
    .collect 2025,1,479,1 --Collect Bearded Axe (1)
    .money <0.5304
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Orc Warrior
    #completewith PyrewoodAmbush
    +达到15级后装备 |T132394:0|t[芒刺斧]
    .use 2025
    .itemcount 2025,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Tauren Warrior
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_刘易斯·瓦伦|r|cRXP_BUY_交谈，并向他购买一把|r |T133046:0|t[巨型石锤]|cRXP_BUY_。|r
    .collect 2026,1,479,1 --Collect Rock Hammer (1)
    .money <0.6286
    .target 刘易斯·瓦伦
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << Tauren Warrior
    #optional
    #completewith PyrewoodAmbush
    +|cRXP_WARN_装备|r |T133046:0|t[巨型石锤]|cRXP_WARN_（达到16级时）。|r
    .use 2026
    .itemcount 2026,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << Shaman
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_刘易斯·瓦伦|r|cRXP_BUY_交谈，并向他购买一把|r |T135147:0|t[法师之杖]|cRXP_BUY_。|r
    .collect 2030,1,479,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target 刘易斯·瓦伦
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Shaman
    #optional
    #completewith PyrewoodAmbush
    +|cRXP_WARN_达到15级后装备|r |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Rogue
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_刘易斯·瓦伦|r|cRXP_BUY_交谈，并向他购买一把|r |T135343:0|t[战士阔剑]|cRXP_BUY_。|r
    .collect 2027,1,479,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 刘易斯·瓦伦
step << Rogue
    #optional
    #completewith PyrewoodAmbush
    +|cRXP_WARN_达到14级后装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
step
    #completewith ZingeAndFaranell
    .goto Undercity,47.20,59.69,0
    .goto Undercity,47.20,59.69,12,0
    .goto Undercity,43.55,68.11,12,0
    .goto Undercity,45.20,71.67,12 >>前往|cRXP_FRIENDLY_药剂师金格|r和|cRXP_FRIENDLY_大药剂师法拉尼尔|r处。
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在炼金区与|cRXP_FRIENDLY_大药剂师法拉尼尔|r和|cRXP_FRIENDLY_药剂师金格|r交谈。
    .turnin 447 >>交任务 致命的配方
    .target +大药剂师法拉尼尔
    .goto Undercity,48.84,69.25
    .turnin 1359 >>交任务 给金格的货物
    .accept 1358 >>接受任务 给赫布瑞姆的样本
    .target +药剂师金格
    .goto Undercity,50.16,67.97
    .solo
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在炼金区与|cRXP_FRIENDLY_大药剂师法拉尼尔|r和|cRXP_FRIENDLY_药剂师金格|r交谈。
    .turnin 447 >>交任务 致命的配方
    .accept 450 >>接受任务 致命的配方
    .target +大药剂师法拉尼尔
    .goto Undercity,48.84,69.25
    .turnin 1359 >>交任务 给金格的货物
    .accept 1358 >>接受任务 给赫布瑞姆的样本
    .target +药剂师金格
    .goto Undercity,50.16,67.97
    .group
step
    #optional
    #label ZingeAndFaranell
step << Mage
    .goto Undercity,85.14,10.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .train 2137 >> 学习职业技能
    .target 安娜斯塔西娅·哈特威尔
    .xp <14,1
    .xp >16,1
step << Mage
    #optional
    .goto Undercity,85.14,10.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .train 2120 >> 学习职业技能
    .target 安娜斯塔西娅·哈特威尔
    .xp <16,1
step << Rogue
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
    .train 1758 >> 学习职业技能
    .target 卡罗琳·瓦德
    .xp <14,1
    .xp >16,1
 step << Rogue
    #optional
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
    .train 6761 >> 学习职业技能
    .target 卡罗琳·瓦德
    .xp <16,1
step << Warlock
    .goto Undercity,88.93,15.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_理查德|r交谈
    .train 6222 >> 学习职业技能
    .target 理查德·科尔文
    .xp <14,1
    .xp >16,1
    .group
step << Warlock
    #optional
    .goto Undercity,88.93,15.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_理查德|r交谈
    .train 1455 >> 学习职业技能
    .target 理查德·科尔文
    .xp <16,1
    .group
step << Priest/Mage/Warlock
    .goto Undercity,69.54,26.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_赞恩|r|cRXP_BUY_交谈，并向他购买一根|r |T133718:0|t[烟尘魔杖]|cRXP_BUY_。|r
    .collect 5208,1 --Smoldering Wand (1)
    .money <0.3515
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
	.target 赞恩·布拉德弗
 step << Undead Rogue
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特·卡加德|r交谈。
    .turnin 1886 >>交任务亡灵哨兵
    .target 米奈特·卡加德
    .isQuestComplete 1886
step << Undead Rogue
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特·卡加德|r交谈。
    .accept 1898 >>接受任务 亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1886
step << Undead Rogue
    .goto Undercity,54.84,76.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德隆·甘特|r交谈。
    .turnin 1898 >>交任务亡灵哨兵
    .accept 1899 >>接受任务 亡灵哨兵
    .target 安德隆·甘特
    .isQuestTurnedIn 1886
step << Undead Rogue
    .goto Undercity,55.43,76.87
    >>搜查|cRXP_PICK_安德隆的书架|r，它就在|cRXP_FRIENDLY_安德隆·甘特|r身后。
    .complete 1899,1 --Andron's Ledger (1)
    .isQuestTurnedIn 1886
step << Undead Rogue
    .goto Undercity,83.53,69.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特·卡加德|r交谈。
    .turnin 1899 >>交任务亡灵哨兵
    .accept 1978 >>接受任务 亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1886
step << Undead Rogue
    .goto Tirisfal Glades,58.86,78.76,40,0
    .goto Tirisfal Glades,59.75,84.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_瓦里玛萨斯|r (恐惧魔王)
    .turnin 1978 >>交任务亡灵哨兵
    .target 瓦里玛萨斯
    .isQuestTurnedIn 1886
step
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛丽·艾塔斯|r交谈。
    .train 3276 >> 学习 |T133688:0|t[厚亚麻绷带]
    .target 玛丽·艾塔斯
    .skill firstaid,<40,1
step
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛丽·艾塔斯|r交谈。
    .train 3274 >> 学习中级急救
    .target 玛丽·艾塔斯
    .skill firstaid,<50,1
step << Warrior
    .goto Undercity,48.32,15.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安吉拉|r交谈
    .train 1160 >> 学习职业技能
    .target 安吉拉·科萨斯
    .xp <14,1
    .xp >16,1
step << Warrior
    #optional
    .goto Undercity,48.32,15.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安吉拉|r交谈
    .train 285 >> 学习职业技能
    .target 安吉拉·科萨斯
    .xp <16,1
step << Priest
    .goto Undercity,47.56,18.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉扎鲁斯神父|r交谈
	.train 6074 >> 学习职业技能
    .target 拉扎鲁斯神父
    .xp <14,1
    .xp >16,1
    .group
step << Priest
    #optional
    .goto Undercity,47.56,18.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉扎鲁斯神父|r交谈
	.train 8102 >> 学习职业技能
    .target 拉扎鲁斯神父
    .xp <16,1
    .group
step << Undead Rogue
    #optional
    #completewith GrimsonthePale
    .abandon 1886 >>放弃任务：亡灵哨兵（已没有机会完成此任务）
    .isOnQuest 1886
step
    .goto Undercity,56.2,96.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_瓦里玛萨斯|r (恐惧魔王)
    .accept 5725 >>接任务：毁灭之力
    .target 瓦里玛萨斯
    .dungeon RFC
step << Undead
    .goto Undercity,63.27,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈克尔|r交谈。
    .turnin 6322 >>交任务 迈克尔·加勒特
    .accept 6324 >>接受任务 向博迪瑞格回报
    .target 迈克尔·加勒特
step
    #completewith GrimsonthePale
    .goto Undercity,63.27,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈克尔·加勒特|r交谈
    .fly The Sepulcher >> 飞往瑟伯切尔
    .target 迈克尔·加勒特
    .zoneskip Silverpine Forest
    .group
step << Undead
    #completewith next
    .goto Undercity,63.27,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈克尔·加勒特|r交谈
    .fly The Sepulcher >> 飞往瑟伯切尔
    .target 迈克尔·加勒特
    .zoneskip Silverpine Forest
    .solo
step << Undead
    .goto Silverpine Forest,43.43,41.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵博迪瑞格|r交谈。
    .turnin 6324 >>交任务 向博迪瑞格回报
step
    .goto Silverpine Forest,43.98,39.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德温·哈里|r交谈
    .vendor >> |cRXP_BUY_若有货，从他那里购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_。|r
    .target 艾德温·哈里
    .group
step
    #completewith next
    .goto Silverpine Forest,56.48,45.94,10 >> 进入矿坑
    .group
step
    #label GrimsonthePale
    .goto Silverpine Forest,58.56,44.85
    >>击杀|cRXP_ENEMY_白毛狼人格瑞姆森|r，拾取掉落的|cRXP_LOOT_格瑞姆森的头颅|r。
    .complete 424,1 --Head of Grimson (1)
    .target 白毛狼人格瑞姆森
    .group 2
step << skip
    .goto Silverpine Forest,58.12,45.50
    .goto Silverpine Forest,44.29,41.09,30 >>|cRXP_WARN_跳上木制转轮，登出再重新登录以触发登出跳点。如果失败，就跑回瑟伯切尔。|r
    .link https://www.youtube.com/watch?v=uD2CUb3rdQ0&ab >> |cRXP_WARN_点击这里查看示例|r
    .group
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔|r交谈
    .turnin 424 >>交任务 阿鲁高的愚行
    .accept 99 >> 接受任务：阿鲁高的愚行
    .goto Silverpine Forest,44.20,39.73
    .target 达拉尔·道恩维沃尔
    .group
step
    #completewith next
    .goto Silverpine Forest,57.90,63.10,120,0
    .subzone 233 >> 前往安伯米尔
    .group
step
    #loop
	.goto Silverpine Forest,57.12,63.39,0
	.goto Silverpine Forest,57.91,62.48,50,0
	.goto Silverpine Forest,59.10,61.88,50,0
	.goto Silverpine Forest,59.79,63.08,50,0
	.goto Silverpine Forest,60.79,62.55,50,0
	.goto Silverpine Forest,61.98,62.56,50,0
	.goto Silverpine Forest,61.00,64.89,50,0
	.goto Silverpine Forest,60.10,65.93,50,0
	.goto Silverpine Forest,59.02,67.10,50,0
	.goto Silverpine Forest,57.56,67.57,50,0
	.goto Silverpine Forest,57.62,65.17,50,0
	.goto Silverpine Forest,57.12,63.39,50,0
    >>击杀|cRXP_ENEMY_达拉然保卫者|r和|cRXP_ENEMY_达拉然法师|r，拾取其掉落的|cRXP_LOOT_达拉然坠饰|r。
    .complete 479,1 --Dalaran Pendant (8)
    .mob 达拉然法师
    .mob 达拉然保卫者
    .group 2
step
    #completewith BerardsJournal
    .goto Silverpine Forest,48.20,71.94,50 >> 前往焚木村
    .isOnQuest 99
    .group
step
    #completewith PyrewoodAmbush
    >>击杀|cRXP_ENEMY_焚木村的敌人|r，拾取|cRXP_LOOT_焚木镣铐|r。
    .complete 99,1 -- Pyrewood Shackle (6)
    .mob 焚木村守卫
    .mob 焚木村裁缝
    .mob 焚木村哨兵
    .mob 焚木村制皮工
    .mob 焚木村长者
    .mob 焚木村盔甲师
    .isOnQuest 99
    .group 4
step
    #completewith BerardsJournal
    .goto Silverpine Forest,43.97,73.23,10 >>进入旅馆，上楼梯到二楼
    .isOnQuest 450
    .group
step
    #label BerardsJournal
    .goto Silverpine Forest,42.98,73.22
    >>击杀|cRXP_ENEMY_药剂师博拉尔德|r，拾取书架上的|cRXP_LOOT_伯纳德的日记|r。
    .complete 450,1 --Berard's Journal (1)
    .mob 药剂师博拉尔德
    .isOnQuest 450
    .group 4
step
    #completewith next
    .goto Silverpine Forest,45.89,74.17,10 >> 进入礼拜堂
    .isOnQuest 99
    .group
step
    .goto Silverpine Forest,46.50,74.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_费雷亚|r交谈。
    .accept 452 >>接受任务 焚木村中的伏击
    .mob 亡灵哨兵费雷亚
    .isOnQuest 99
    .group 4
step
    #label PyrewoodAmbush
    .goto Silverpine Forest,46.48,74.10
    >>击杀出现的|cRXP_ENEMY_议员|r和|cRXP_ENEMY_莫瑞森村长|r
    .complete 452,1 --Aid Faerleia in killing the Pyrewood Council
    .mob 议员斯密瑟斯
    .mob 议员亨德瑞克斯
    .mob 议员萨奇尔
    .mob 议员维尔海姆
    .mob 议员哈尔丁
    .mob 议员海加斯
    .mob 议员布伦斯维克
    .mob 议员库珀
    .mob 莫瑞森村长
    .isOnQuest 452
    .group 4
step
    .goto Silverpine Forest,46.50,74.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_费雷亚|r交谈。
    .turnin 452 >>交任务：焚木村中的伏击
    .mob 亡灵哨兵费雷亚
    .isQuestComplete 452
    .group
step
    #loop
    .goto Silverpine Forest,45.48,73.43,0
    .goto Silverpine Forest,45.66,74.90,40,0
    .goto Silverpine Forest,44.11,73.50,40,0
    .goto Silverpine Forest,45.41,72.42,40,0
    .goto Silverpine Forest,46.61,73.00,40,0
    .goto Silverpine Forest,45.48,73.43,40,0
    >>继续击杀|cRXP_ENEMY_焚木村的敌人|r，从尸体上收集齐|cRXP_LOOT_焚木镣铐|r。
    .complete 99,1 -- Pyrewood Shackle (6)
    .mob 焚木村守卫
    .mob 焚木村裁缝
    .mob 焚木村哨兵
    .mob 焚木村制皮工
    .mob 焚木村长者
    .mob 焚木村盔甲师
    .isOnQuest 99
    .group 4
step
    #completewith AmbermillTurnin
    .goto Silverpine Forest,45.51,41.26,100 >> 返回瑟伯切尔
    .subzoneskip 228
    .group
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔|r交谈
    .turnin 99 >> 交任务 阿鲁高的愚行
    .goto Silverpine Forest,44.20,39.73
    .target 达拉尔·道恩维沃尔
    .isQuestComplete 99
    .group
step
    .goto Silverpine Forest,42.79,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师伦弗利尔|r交谈
    .turnin 450 >> 交任务：致命的配方
    .target 药剂师伦弗利尔
    .isQuestComplete 450
    .group
step
    #label AmbermillTurnin
    .goto Silverpine Forest,43.98,40.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师奥利斯特|r交谈。
    .turnin 479 >>交任务 调查安伯米尔
    .target 暗影牧师奥利斯特
    .isQuestComplete 479
    .group
step << Hunter
    .goto Silverpine Forest,45.01,39.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳迪亚|r交谈
    >>如果在售, 向她购买 |T135490:0|t[|cRXP_FRIENDLY_精良的长弓|r]
    .collect 11304,1 --Fine Longbow (1)
    .collect 2515,1200 << Hunter --Sharp Arrow (1200)
    .target 纳迪亚·沃农
    .money <0.2633
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.5
    .equip 18,11304
    .group
step << Druid
    #completewith next
    .cast 18960 >>施放 |T135758:0|t[传送：月光林地]
step << Druid
    .goto Moonglade,52.53,40.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔
step
    #optional
    .abandon 424 >> 放弃任务：阿鲁高的愚行
    .isOnQuest 424
step
    #optional
    .abandon 479 >> 放弃任务：调查安伯米尔
    .isOnQuest 479
step
    #optional
    .abandon 99 >> 放弃任务：阿鲁高的愚行
    .isOnQuest 99
step
    #optional
    .abandon 450 >> 放弃任务：致命的配方
    .isOnQuest 450
step
    #optional
    .abandon 452 >> 放弃任务：焚木村中的伏击
    .isOnQuest 452
step << Tauren/Shaman/Hunter
    .hs >> 使用炉石返回十字路口
    .use 6948
    .bindlocation 380,1
    .subzoneskip 380
step << !Tauren !Shaman !Hunter
    .hs >> 炉石回剃刀岭
    .use 6948
    .bindlocation 362,1
    .subzoneskip 362
    ]])
