local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（部落）
#forever
#disabledungeons
<< Horde
#name 1-6 Durotar
#version 11
#group RestedXP Forever Guide (H)
#subgroup Speedrun Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
#defaultfor Troll/Orc
#next 6-10 Durotar
#displayname 1-6 杜隆塔尔
step << !Orc !Troll
    #completewith next
    +|cRXP_WARN_你选择的指南适用于兽人和巨魔。请选择与你实际出生地相同的起始区域指南|r
step
    .goto 1411/1,-4251.46,-607.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔图克|r交谈
    .accept 4641 >>接任务：起点
    .target 卡尔图克
step << Warrior/Shaman/Warlock/Mage/Priest
    #completewith next
    +|cRXP_WARN_击杀 |r|cRXP_ENEMY_杂斑野猪|r|cRXP_WARN_，拾取掉落，直到可出售物品（包括你的护甲）的总价值达到35铜币|r << Warlock
    +|cRXP_WARN_击杀 |r|cRXP_ENEMY_杂斑野猪|r|cRXP_WARN_，拾取掉落，直到可出售物品（包括你的护甲）的总价值达到60铜币|r << Mage
    +|cRXP_WARN_击杀|r|cRXP_ENEMY_杂斑野猪|r|cRXP_WARN_，刷到可出售物品（包括你的护甲）价值达 50 铜|r << Priest
    +|cRXP_WARN_击杀 |r|cRXP_ENEMY_杂斑野猪|r|cRXP_WARN_，拾取掉落，直到可出售物品（包括你的护甲）的总价值达到10铜币|r << Warrior/Shaman
    .goto 1411/1,-4281.07,-720.15,30,0 << Warlock/Mage/Priest
    .goto 1411/1,-4299.05,-494.9,30,0 << Warrior/Shaman
    .mob 杂斑野猪
    .money >0.0035 << Warlock
    .money >0.0060 << Mage
    .money >0.0050 << Priest
    .money >0.0010 << Warrior/Shaman
step << Warlock
    .goto 1411/1,-4214.45,-623.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁赞|r交谈
    .accept 1485 >>接任务：邪灵劣魔
    .target 鲁赞
step << Warrior/Shaman
    .goto 1411/1,-4214.45,-565.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    .vendor >> 出售杂物
    .target 多克纳
    .money >0.01
step
    .goto 1411/1,-4198.05,-605.59,12,0 << !Warrior !Shaman
    .goto 1411/1,-4198.58,-602.41,12,0 << Warrior/Shaman
    .goto 1411/1,-4186.42,-599.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 4641 >>交任务：起点
    .accept 788 >>接任务：小试身手
    --.accept 97279 >>Accept Wayward Weapons
    .target 高内克
    --97279 not worth doing, bad xp loot quest, no followup
step << Warrior/Shaman
    .goto 1411/1,-4198.05,-605.59,10,0
    .goto 1411/1,-4230.31,-639.43 << Warrior
    .goto 1411/1,-4203.87,-623.92 << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈 << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈 << Shaman
    .train 6673 >>学习 |T132333:0|t[战斗怒吼] << Warrior
    .train 8017 >>学习 |T136086:0|t[石化武器] << Shaman
    .target 弗朗恩 << Warrior
    .target 史克里克 << Shaman
step << Warlock
    #softcore
    #completewith Nartok
    .goto 1411/1,-4157.87,-601.36,12,0
    .goto 1411/1,-4143.06,-594.31,12,0
    .goto 1411/1,-4120.86,-589.72,12,0
    .goto 1411/1,-4111.87,-607.00,12 >>前往 |cRXP_FRIENDLY_纳托克|r处
    .money <0.01
step << Warlock
    #softcore
    #completewith next
    .goto 1411/1,-4157.87,-601.36,12,0
    .goto 1411/1,-4143.06,-594.31,12,0
    .goto 1411/1,-4120.86,-589.72,12,0
    .goto 1411/1,-4107.11,-604.18,12 >>前往 |cRXP_FRIENDLY_赫劳格|r处
    .money >0.01
step << Warlock
    #hardcore
    #completewith next
    .goto 1411/1,-4157.87,-601.36,12,0
    .goto 1411/1,-4143.06,-594.31,12,0
    .goto 1411/1,-4120.86,-589.72,12,0
    .goto 1411/1,-4107.11,-604.18,12 >>前往 |cRXP_FRIENDLY_赫劳格|r处
step << Warlock
    #softcore
    .goto 1411/1,-4107.11,-604.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    .vendor >>出售杂物
    .target 赫劳格
    .money >0.01
step << Warlock
    #hardcore
    .goto 1411/1,-4107.11,-604.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    .vendor >>出售杂物
    .target 赫劳格
step << Warlock
    #label Nartok
    .goto 1411/1,-4111.87,-607.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 348 >>学习 |T135817:0|t[献祭]
    .target 纳托克
step << Hunter/Mage/Priest
    .goto 1411/1,-4214.45,-565.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_向她购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_备用|r << !Hunter
    >>|cRXP_BUY_向她购买|r |T132382:0|t[劣质箭] |cRXP_BUY_备用|r << Hunter
    .collect 159,10,6394,1 << !Hunter --Refreshing Spring Water (10)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .target 多克纳
    .money <0.005 << !Hunter
    .money <0.0040 << Hunter
step << Warlock
    .goto 1411/1,-4214.45,-565.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_向她购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_备用|r
    .collect 159,5,6394,1 --Refreshing Spring Water (5)
    .target 多克纳
    .money <0.0025
step << skip
    #completewith Boars
    >>拾取地上的 |cRXP_PICK_遗弃的训练武器|r
    .complete 97279,1 --|6/6 Abandoned Training Weapon
step << Warlock
    #completewith next
    .goto 1411/1,-4266.26,-563.29,25,0
    >>前往火刃集会所途中击杀 |cRXP_ENEMY_杂斑野猪|r
    >>|cRXP_WARN_尽量在抵达之前升到2级|r
    .complete 788,1 --Mottled Boar (10)
    .mob 杂斑野猪
step << Warlock
    .goto 1411/1,-4357.74,-180.47,100 >> 前往火刃集会所
    .isOnQuest 1485
step << Warlock
    #loop
    .goto 1411/1,-4282.13,-250.97,0
    .goto 1411/1,-4282.13,-250.97,40,0
    .goto 1411/1,-4317.02,-258.02,40,0
    .goto 1411/1,-4351.39,-250.97,40,0
    .goto 1411/1,-4385.76,-256.96,40,0
    .goto 1411/1,-4383.65,-216.07,40,0
    .goto 1411/1,-4419.07,-221.01,40,0
    .goto 1411/1,-4457.67,-205.15,40,0
    .goto 1411/1,-4405.85,-189.99,40,0
    .goto 1411/1,-4409.55,-169.54,40,0
    .goto 1411/1,-4376.24,-197.390,40,0
    .goto 1411/1,-4360.38,-176.95,40,0
    .goto 1411/1,-4329.71,-196.33,40,0
    .goto 1411/1,-4319.67,-169.190,40,0
    .goto 1411/1,-4303.28,-186.46,40,0
    .goto 1411/1,-4281.07,-148.75,40,0
    >>击杀 |cRXP_ENEMY_邪灵劣魔|r，拾取 |cRXP_LOOT_邪灵劣魔的头颅|r
    .complete 1485,1 --Vile Familiar Head (6)
    .mob 邪灵劣魔
step
    #completewith Sarkoth
    .goto 1411/1,-4266.26,-563.29,35,0 << !Warlock
    .goto 1411/1,-4283.18,-512.53,45,0 << !Warlock
    >>击杀 |cRXP_ENEMY_杂斑野猪|r
    .complete 788,1 --Mottled Boar (10)
    .mob 杂斑野猪
step
    .goto 1411/1,-4108.70,-397.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳祖|r交谈
    .accept 790 >>接任务：萨科斯
    .target 哈纳祖
step
    #label Sarkoth
    .goto 1411/1,-4109.22,-546.370
    >>击杀 |cRXP_ENEMY_萨科斯|r，拾取 |cRXP_LOOT_萨科斯的爪子|r
    .complete 790,1 --Sarkoth's Mangled Claw (1)
    .mob 萨科斯
step
    .goto 1411/1,-4108.70,-397.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳祖|r交谈
    .turnin 790 >>交任务：萨科斯
    .accept 804 >>接任务：萨科斯
    .target 哈纳祖
step
    #loop
    .goto 1411/1,-4146.24,-483.97,0
    .goto 1411/1,-4146.24,-483.97,40,0
    .goto 1411/1,-4179.02,-473.75,40,0
    .goto 1411/1,-4218.15,-480.10,40,0
    .goto 1411/1,-4252.52,-483.62,40,0
    .goto 1411/1,-4283.71,-516.76,40,0
    .goto 1411/1,-4317.55,-516.76,40,0
    .goto 1411/1,-4350.33,-510.06,40,0
    .goto 1411/1,-4379.94,-515.70,40,0
    .goto 1411/1,-4379.94,-484.33,40,0
    .goto 1411/1,-4352.98,-445.90,40,0
    .goto 1411/1,-4385.76,-412.77,40,0
    .goto 1411/1,-4384.70,-383.16,40,0
    .goto 1411/1,-4383.12,-346.85,40,0
    .goto 1411/1,-4349.81,-313.720,40,0
    .goto 1411/1,-4315.44,-287.28,40,0
    .goto 1411/1,-4281.60,-321.82,40,0
    .goto 1411/1,-4239.83,-315.13,40,0
    .goto 1411/1,-4213.92,-309.84,40,0
    .goto 1411/1,-4184.31,-348.61,40,0
    .goto 1411/1,-4184.31,-382.45,40,0
    .goto 1411/1,-4183.25,-409.6,40,0
    .goto 1411/1,-4182.72,-448.72,40,0
    >>击杀 |cRXP_ENEMY_杂斑野猪|r
    .complete 788,1 --Mottled Boar (10)
    .mob 杂斑野猪
step << Warlock
    #loop
	.goto 1411/1,-4146.24,-483.97,0
    .goto 1411/1,-4146.24,-483.97,40,0
    .goto 1411/1,-4179.02,-473.75,40,0
    .goto 1411/1,-4218.15,-480.10,40,0
    .goto 1411/1,-4252.52,-483.62,40,0
    .goto 1411/1,-4283.71,-516.76,40,0
    .goto 1411/1,-4317.55,-516.76,40,0
    .goto 1411/1,-4350.33,-510.06,40,0
    .goto 1411/1,-4379.94,-515.70,40,0
    .goto 1411/1,-4379.94,-484.33,40,0
    .goto 1411/1,-4352.98,-445.90,40,0
    .goto 1411/1,-4385.76,-412.77,40,0
    .goto 1411/1,-4384.70,-383.16,40,0
    .goto 1411/1,-4383.12,-346.85,40,0
    .goto 1411/1,-4349.81,-313.720,40,0
    .goto 1411/1,-4315.44,-287.28,40,0
    .goto 1411/1,-4281.60,-321.82,40,0
    .goto 1411/1,-4239.83,-315.13,40,0
    .goto 1411/1,-4213.92,-309.84,40,0
    .goto 1411/1,-4184.31,-348.61,40,0
    .goto 1411/1,-4184.31,-382.45,40,0
    .goto 1411/1,-4183.25,-409.6,40,0
    .goto 1411/1,-4182.72,-448.72,40,0
    .xp 3+685 >> 刷怪至685+/1400经验值
    .mob 杂斑野猪
step
    #optional
    #label Boars
step << skip
    .goto 1411/1,-4260.000,-404.200
    >>拾取地上的 |cRXP_PICK_遗弃的训练武器|r
    .complete 97279,1 --|6/6 Abandoned Training Weapon
step << Warlock
    #completewith Ruzan2
	>>|cRXP_WARN_刷 |r|cRXP_ENEMY_杂斑野猪|r|cRXP_WARN_，拾取掉落，直到可出售物品的总价值达到1银币|r
    .mob 杂斑野猪
	.money >0.01
step << Rogue
    #label Duokna2
    .goto 1411/1,-4214.45,-565.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    .vendor >> 出售杂物
    .target 多克纳
step << Warlock
    #label Ruzan2
    .goto 1411/1,-4214.400,-624.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁赞|r交谈
    .turnin 1485 >>交任务：邪灵劣魔
    .accept 1499 >>接任务：邪灵劣魔
    .target 鲁赞
step << Warlock
    #completewith Gornek2
    .cast 688 >>|cRXP_WARN_施放|r |T136218:0|t[召唤小鬼]
step << Warlock
	.goto 1411/1,-4228.19,-629.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 1499 >>交任务：邪灵劣魔
    .accept 794 >>接任务：火刃奖章
    .target 祖雷萨
step
    #label Gornek2
    .goto 1411/1,-4198.05,-605.59,12,0 << Warlock
    .goto 1411/1,-4198.58,-602.41,12,0 << !Warlock
    .goto 1411/1,-4186.42,-599.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 788,2 >>交任务：小试身手 << Shaman
    .turnin 788 >>交任务：小试身手 << !Shaman
    .accept 789 >>接任务：工蝎的尾巴
    .accept 2383 >>接任务：简易羊皮纸 << Orc Warrior
    .accept 3065 >>接任务：普通石板 << Troll Warrior
    .accept 3082 >>接任务：风蚀石板 << Troll Hunter
    .accept 3083 >>接任务：密文石板 << Troll Rogue
    .accept 3084 >>接任务：符文石板 << Troll Shaman
    .accept 3085 >>接任务：神圣石板 << Troll Priest
    .accept 3086 >>接任务：雕文石板 << Troll Mage
    .accept 98575 >>接任务：被污染的石板 << Troll Warlock
    .accept 3087 >>接任务：风蚀羊皮纸 << Orc Hunter
    .accept 3088 >>接任务：密文羊皮纸 << Orc Rogue
    .accept 3089 >>接任务：符文羊皮纸 << Orc Shaman
    .accept 3090 >>接任务：被污染的羊皮纸 << Orc Warlock
    .accept 98576 >>接任务：雕文羊皮纸 << Orc Mage
    .turnin 804,1 >>交任务：萨科斯 << Shaman
    .turnin 804 >>交任务：萨科斯 << !Shaman
    .target 高内克
step << Rogue
    #completewith Rwag
    .goto 1411/1,-4157.87,-601.36,12,0
    .goto 1411/1,-4144.65,-588.67,12 >>前往 |cRXP_FRIENDLY_鲁瓦格|r处
step << Rogue
    .goto 1411/1,-4144.65,-588.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .turnin 3083 >>交任务：密文石板 << Troll Rogue
    .turnin 3088 >>交任务：密文羊皮纸 << Orc Rogue
    .train 53 >> 学习 |T132090:0|t[背刺]
    .target 鲁瓦格
    .money <0.04
    .xp <4,1
step << Rogue
    #label Rwag
    .goto 1411/1,-4144.65,-588.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .turnin 3083 >>交任务：密文石板 << Troll Rogue
    .turnin 3088 >>交任务：密文羊皮纸 << Orc Rogue
    .target 鲁瓦格
step
    #optional
    .goto 1411/1,-4102.400,-588.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与洞穴深处的 |cRXP_FRIENDLY_克赞·荆条|r交谈
    .turnin 97279 >>交任务：遗失的武器
    .target 克赞·荆条
    .isQuestComplete 97279
step
    #optional
    .abandon 97279 >>放弃任务：遗失的武器
step << Shaman
    .goto 1411/1,-4102.600,-588.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克赞·荆条|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135139:0|t[学徒法杖]的钱（97铜币），就把武器也卖掉
    .target 克赞·荆条
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
step << Shaman
    .goto 1411/1,-4102.600,-588.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克赞·荆条|r交谈
    >>|cRXP_BUY_向他购买|r |T135139:0|t[学徒法杖] |cRXP_BUY_备用|r
    .collect 2132,1,5441,1 --Collect Short Staff (1)
    .money <0.0097
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
    .target 克赞·荆条
step << Rogue/Warrior
    .goto 1411/1,-4106.000,-593.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺兹什|r交谈
    >>|cRXP_BUY_向他购买一把|r |T134708:0|t[矿工锄]
    .train 2575 >> 学习 |T136248:0|t[采矿]
    .collect 2901,1,792,1 --Mining Pick (1)
    >>|cRXP_WARN_这样就能从矿点采集到|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r |cRXP_WARN_，用于制作|r |T135248:0|t[磨刀石] |cRXP_WARN_（武器伤害+2，持续30分钟）|r
    .target 诺兹什
step << Warlock
    .goto 1411/1,-4107.11,-604.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    .vendor >>出售杂物
    .target 赫劳格
    .money >0.01
step << Warlock
    #label Nartok2
    .goto 1411/1,-4111.87,-607.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .turnin 3090 >>交任务：被污染的羊皮纸 << Orc Warlock
    .turnin 98575 >>交任务：被污染的石板 << Troll Warlock
    .train 172 >> 学习 |T136118:0|t[腐蚀术]
    .target 纳托克
step
    #label Galgar
    .goto 1411/1,-4221.85,-561.52,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
    .accept 4402 >>接任务：戈加尔的清凉果
    .target 戈加尔
step << !Rogue !Shaman
    .goto 1411/1,-4214.45,-565.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_向她购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_备用|r << !Rogue !Warrior !Hunter !Shaman
    >>|cRXP_BUY_向她购买|r |T132382:0|t[劣质箭] |cRXP_BUY_备用|r << Hunter
    .collect 159,15,6394,1 << !Rogue !Warrior !Hunter !Shaman --Refreshing Spring Water (15)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .vendor >> 出售杂物
    .target 多克纳
    .money >0.1 << Rogue/Warrior
    .itemcount 159,<15 << !Rogue !Warrior !Hunter !Shaman
step << Shaman
    #requires Galgar
    .goto 1411/1,-4203.87,-623.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈
    .turnin 3084 >>交任务：符文石板 << Troll
    .turnin 3089 >>交任务：符文羊皮纸 << Orc
    .target 史克里克
step << Mage
    #requires Galgar
    .goto 1411/1,-4210.22,-625.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .turnin 3086 >>交任务：雕文石板 << Troll Mage
    .turnin 98576 >>交任务：雕文羊皮纸 << Orc Mage
    .train 1459 >> 学习 |T135932:0|t[奥术智慧]
    .target 迈安
step << !Warlock
    #requires Galgar
	.goto 1411/1,-4228.19,-629.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .accept 792 >>接任务：邪灵劣魔
    .target 祖雷萨
step << Hunter
    .goto 1411/1,-4227.66,-635.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>交任务：风蚀石板 << Troll
    .turnin 3087 >>交任务：风蚀羊皮纸 << Orc
    .target 基沙
step << Warrior
    .goto 1411/1,-4230.31,-639.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>交任务：简易羊皮纸 << Orc
    .turnin 3065 >>交任务：普通石板 << Troll
    .target 弗朗恩
step
    #requires Galgar << Warlock
    .goto 1411/1,-4322.31,-611.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头塔兹利尔|r交谈
    .accept 5441 >>接任务：懒惰的苦工
    .target 工头塔兹利尔
step
    #completewith Sting
    >>拾取仙人掌旁的 |cRXP_LOOT_仙人掌果|r
    .complete 4402,1 --Cactus Apple (10)
step
    #completewith Tails
    .goto 1411/1,-4340.82,-628.50,20,0
    .goto 1411/1,-4375.71,-507.590,45,0
    .goto 1411/1,-4467.19,-506.53,45,0
    >>|cRXP_WARN_使用|r |T133486:0|t[工头的木棒] |cRXP_WARN_敲醒熟睡的|r|cRXP_FRIENDLY_懒惰的苦工|r
    .complete 5441,1 --Peons Awoken (5)
    .target 懒惰的苦工
    .use 16114
step << !Warlock
    #completewith Imps
    >>击杀 |cRXP_ENEMY_蝎子|r，拾取 |cRXP_LOOT_工蝎的尾巴|r
    .complete 789,1 --Scorpid Worker Tail (10)
    .mob 蝎子
step << !Warlock
    #label Imps
    #loop
    .goto 1411/1,-4282.13,-250.97,0
    .goto 1411/1,-4282.13,-250.97,40,0
    .goto 1411/1,-4317.02,-258.02,40,0
    .goto 1411/1,-4351.39,-250.97,40,0
    .goto 1411/1,-4385.76,-256.96,40,0
    .goto 1411/1,-4383.65,-216.07,40,0
    .goto 1411/1,-4419.07,-221.01,40,0
    .goto 1411/1,-4457.67,-205.15,40,0
    .goto 1411/1,-4405.85,-189.99,40,0
    .goto 1411/1,-4409.55,-169.54,40,0
    .goto 1411/1,-4376.24,-197.390,40,0
    .goto 1411/1,-4360.38,-176.95,40,0
    .goto 1411/1,-4329.71,-196.33,40,0
    .goto 1411/1,-4319.67,-169.190,40,0
    .goto 1411/1,-4303.28,-186.46,40,0
    .goto 1411/1,-4281.07,-148.75,40,0
    >>击杀 |cRXP_ENEMY_邪灵劣魔|r
    .complete 792,1 --Vile Familiar (12)
    .mob 邪灵劣魔
step
    #label Tails
    #loop
    .goto 1411/1,-4249.87,-246.04,0
    .goto 1411/1,-4249.87,-246.04,40,0
    .goto 1411/1,-4226.08,-250.62,40,0
    .goto 1411/1,-4177.96,-248.5,40,0
    .goto 1411/1,-4181.66,-278.470,40,0
    .goto 1411/1,-4149.41,-319.00,40,0
    .goto 1411/1,-4112.40,-351.43,40,0
    .goto 1411/1,-4081.20,-354.25,40,0
    .goto 1411/1,-4046.83,-352.14,40,0
    .goto 1411/1,-4048.95,-383.16,40,0
    .goto 1411/1,-4053.71,-415.940,40,0
    .goto 1411/1,-4084.37,-449.08,40,0
    .goto 1411/1,-4121.91,-449.78,40,0
    .goto 1411/1,-4116.63,-513.23,40,0
    .goto 1411/1,-4073.80,-519.22,40,0
    .goto 1411/1,-4079.61,-553.06,40,0
    .goto 1411/1,-4082.26,-576.68,40,0
    .goto 1411/1,-4084.37,-606.290,40,0
    .goto 1411/1,-4115.57,-608.05,40,0
    .goto 1411/1,-4146.24,-583.03,40,0
    .goto 1411/1,-4149.94,-543.55,40,0
    .goto 1411/1,-4177.43,-519.93,40,0
    .goto 1411/1,-4144.65,-507.94,40,0
    .goto 1411/1,-4149.41,-450.13,40,0
    .goto 1411/1,-4147.82,-416.65,40,0
    .goto 1411/1,-4148.88,-376.46,40,0
    .goto 1411/1,-4156.28,-350.73,40,0
    .goto 1411/1,-4177.96,-315.13,40,0
    .goto 1411/1,-4210.22,-283.40,40,0
    .goto 1411/1,-4240.35,-293.27,40,0
    .goto 1411/1,-4284.24,-283.05,40,0
    .goto 1411/1,-4349.81,-287.63,40,0
    .goto 1411/1,-4384.70,-281.990,40,0
    .goto 1411/1,-4386.82,-318.65,40,0
    .goto 1411/1,-4419.07,-345.79,40,0
    .goto 1411/1,-4452.38,-385.63,40,0
    .goto 1411/1,-4451.85,-417.70,40,0
    .goto 1411/1,-4455.03,-450.49,40,0
    .goto 1411/1,-4478.29,-449.08,40,0
    .goto 1411/1,-4451.85,-417.70,40,0
    .goto 1411/1,-4452.38,-385.63,40,0
    .goto 1411/1,-4442.34,-347.2,40,0
    .goto 1411/1,-4446.57,-313.01,40,0
    .goto 1411/1,-4451.33,-283.40,40,0
    .goto 1411/1,-4419.60,-246.04,40,0
    .goto 1411/1,-4384.70,-281.990,40,0
    .goto 1411/1,-4349.81,-287.63,40,0
    .goto 1411/1,-4284.24,-283.05,40,0
    >>击杀 |cRXP_ENEMY_蝎子|r，拾取 |cRXP_LOOT_工蝎的尾巴|r
    .complete 789,1 --Scorpid Worker Tail (10)
    .mob 蝎子
step
    #loop
	.goto 1411/1,-4340.82,-628.50,0
	.goto 1411/1,-4340.82,-628.50,25,0
	.goto 1411/1,-4375.71,-507.590,25,0
	.goto 1411/1,-4467.19,-506.53,25,0
	.goto 1411/1,-4433.88,-329.93,25,0
	.goto 1411/1,-4452.38,-232.640,25,0
	.goto 1411/1,-4283.71,-228.76,25,0
	.goto 1411/1,-4220.26,-209.73,25,0
	.goto 1411/1,-4144.65,-269.65,25,0
	.goto 1411/1,-4125.62,-321.12,25,0
	.goto 1411/1,-4015.64,-371.53,25,0
    >>|cRXP_WARN_使用|r |T133486:0|t[工头的木棒] |cRXP_WARN_敲醒熟睡的|r|cRXP_FRIENDLY_懒惰的苦工|r
    .complete 5441,1 --Peons Awoken (5)
    .target 懒惰的苦工
    .use 16114
step
    #loop
    .goto 1411/1,-4146.24,-483.97,0
    .goto 1411/1,-4146.24,-483.97,40,0
    .goto 1411/1,-4179.02,-473.75,40,0
    .goto 1411/1,-4218.15,-480.10,40,0
    .goto 1411/1,-4252.52,-483.62,40,0
    .goto 1411/1,-4283.71,-516.76,40,0
    .goto 1411/1,-4317.55,-516.76,40,0
    .goto 1411/1,-4350.33,-510.06,40,0
    .goto 1411/1,-4379.94,-515.70,40,0
    .goto 1411/1,-4379.94,-484.33,40,0
    .goto 1411/1,-4352.98,-445.90,40,0
    .goto 1411/1,-4385.76,-412.77,40,0
    .goto 1411/1,-4384.70,-383.16,40,0
    .goto 1411/1,-4383.12,-346.85,40,0
    .goto 1411/1,-4349.81,-313.720,40,0
    .goto 1411/1,-4315.44,-287.28,40,0
    .goto 1411/1,-4281.60,-321.82,40,0
    .goto 1411/1,-4239.83,-315.13,40,0
    .goto 1411/1,-4213.92,-309.84,40,0
    .goto 1411/1,-4184.31,-348.61,40,0
    .goto 1411/1,-4184.31,-382.45,40,0
    .goto 1411/1,-4183.25,-409.6,40,0
    .goto 1411/1,-4182.72,-448.72,40,0
    .xp 4 >> 刷怪到4级
    .mob 杂斑野猪
    .mob 蝎子
    .mob 邪灵劣魔
step
    .goto 1411/1,-4221.85,-561.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
    .turnin 4402 >>交任务：戈加尔的清凉果
    .target 戈加尔
    .isQuestComplete 4402
step
    .goto 1411/1,-4214.45,-565.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_向她购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_备用|r << !Rogue !Warrior !Hunter !Shaman
    >>|cRXP_BUY_向她购买|r |T132382:0|t[劣质箭] |cRXP_BUY_备用|r << Hunter
    .collect 159,5,6394,1 << !Rogue !Warrior !Hunter !Shaman --Refreshing Spring Water (5)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .vendor >> 出售杂物
    .target 多克纳
    .money >0.1 << Rogue/Warrior
    .itemcount 159,<5 << !Rogue !Warrior !Hunter !Shaman
    .itemcount 2512,<600 << Hunter
step
    #label Sting
    .goto 1411/1,-4198.58,-602.41,12,0
    .goto 1411/1,-4186.42,-599.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 789,2 >>交任务：工蝎的尾巴 << Shaman
    .turnin 789 >>交任务：工蝎的尾巴 << !Shaman
    .target 高内克
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .train 8042 >> 学习 |T136026:0|t[地震术]
    .goto 1411/1,-4203.87,-623.92
    .accept 1516 >>接任务：大地的召唤
    .goto 1411/1,-4204.4,-629.91
    .target 史克里克
    .target 坎纳甘·地鸣
step << Mage
    .goto 1411/1,-4210.22,-625.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .train 116 >> 学习 |T135846:0|t[寒冰箭]
    .target 迈安
step << Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 1243 >> 学习 |T135987:0|t[真言术：韧]
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .money <0.011
    .target 肯杰
step << Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .money <0.01
    .target 肯杰
step << Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 589 >> 学习职业技能
    .turnin 3085 >>交任务：神圣石板
    .money <0.021
    .target 肯杰
step << Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 1243 >> 学习 |T135987:0|t[真言术：韧]
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .turnin 3085 >>交任务：神圣石板
    .money <0.011
    .target 肯杰
step << Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .turnin 3085 >>交任务：神圣石板
    .money <0.01
    .target 肯杰
step << !Warlock
	.goto 1411/1,-4228.19,-629.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 792 >>交任务：邪灵劣魔
    .accept 794 >>接任务：火刃奖章
    .target 祖雷萨
step << Hunter
    .goto 1411/1,-4227.66,-635.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .target 基沙
    .xp <4,1
    .money <0.01
step << Warrior
    .goto 1411/1,-4230.31,-639.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 弗朗恩
    .money <0.02
    .train 772,1
step << Warrior
    .goto 1411/1,-4230.31,-639.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 弗朗恩
step << Warrior
    .goto 1411/1,-4230.31,-639.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .target 弗朗恩
    .money <0.01
step
    .goto 1411/1,-4322.31,-611.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头塔兹利尔|r交谈
    .turnin 5441 >>交任务：懒惰的苦工
    .accept 6394 >>接任务：塔兹利尔的镐
    .target 工头塔兹利尔
step
    #completewith next
    .xp 4+1720 >> 刷怪至1720+/2100经验值
    .mob 杂斑野猪
    .mob 蝎子
    .mob 邪灵劣魔
    .isOnQuest 4402
step
    #loop
	.goto 1411/1,-4324.43,-480.10,0
	.goto 1411/1,-4259.92,-411.01,25,0
	.goto 1411/1,-4279.48,-402.55,25,0
	.goto 1411/1,-4333.94,-360.95,25,0
	.goto 1411/1,-4335.53,-294.68,25,0
	.goto 1411/1,-4321.25,-243.220,25,0
	.goto 1411/1,-4366.20,-253.44,25,0
	.goto 1411/1,-4391.05,-328.52,25,0
	.goto 1411/1,-4440.75,-319.36,25,0
	.goto 1411/1,-4462.43,-405.370,25,0
	.goto 1411/1,-4398.98,-411.71,25,0
	.goto 1411/1,-4324.43,-480.10,25,0
    >>拾取仙人掌旁的 |cRXP_LOOT_仙人掌果|r
    .complete 4402,1 --Cactus Apple (10)
step << !Warrior !Rogue !Shaman
    #optional
    #loop
    .goto 1411/1,-4282.13,-250.97,0
    .goto 1411/1,-4282.13,-250.97,40,0
    .goto 1411/1,-4317.02,-258.02,40,0
    .goto 1411/1,-4351.39,-250.97,40,0
    .goto 1411/1,-4385.76,-256.96,40,0
    .goto 1411/1,-4383.65,-216.07,40,0
    .goto 1411/1,-4419.07,-221.01,40,0
    .goto 1411/1,-4457.67,-205.15,40,0
    .goto 1411/1,-4405.85,-189.99,40,0
    .goto 1411/1,-4409.55,-169.54,40,0
    .goto 1411/1,-4376.24,-197.390,40,0
    .goto 1411/1,-4360.38,-176.95,40,0
    .goto 1411/1,-4329.71,-196.33,40,0
    .goto 1411/1,-4319.67,-169.190,40,0
    .goto 1411/1,-4303.28,-186.46,40,0
    .goto 1411/1,-4281.07,-148.75,40,0
    .xp 4+1720 >> 刷怪至1720+/2100经验值
    .mob 邪灵劣魔
    .isOnQuest 4402
step << !Warrior !Rogue !Shaman
    #optional
    #loop
    .goto 1411/1,-4282.13,-250.97,40,0
    .goto 1411/1,-4317.02,-258.02,40,0
    .goto 1411/1,-4351.39,-250.97,40,0
    .goto 1411/1,-4385.76,-256.96,40,0
    .goto 1411/1,-4383.65,-216.07,40,0
    .goto 1411/1,-4419.07,-221.01,40,0
    .goto 1411/1,-4457.67,-205.15,40,0
    .goto 1411/1,-4405.85,-189.99,40,0
    .goto 1411/1,-4409.55,-169.54,40,0
    .goto 1411/1,-4376.24,-197.390,40,0
    .goto 1411/1,-4360.38,-176.95,40,0
    .goto 1411/1,-4329.71,-196.33,40,0
    .goto 1411/1,-4319.67,-169.190,40,0
    .goto 1411/1,-4303.28,-186.46,40,0
    .goto 1411/1,-4281.07,-148.75,40,0
    .xp 5 >> 刷怪到5级
    .mob 邪灵劣魔
    .isQuestTurnedIn 4402
step
	#completewith Thazz
    #label Cave
    .goto 1411/1,-4360.38,-175.18,30 >>进入洞穴
    .isOnQuest 6394
step
	#completewith Thazz
    #requires Cave
    .goto 1411/1,-4361.44,-144.16,15,0
    .goto 1411/1,-4311.74,-113.14,15,0
    .goto 1411/1,-4274.19,-87.76,10 >>前往 |cRXP_LOOT_塔兹利尔的镐|r处
    .isOnQuest 6394
step << Shaman
    #completewith Yarrog
    #requires Cave
    >>击杀 |cRXP_ENEMY_地狱捕猎者|r，拾取 |cRXP_LOOT_地狱捕猎者的蹄子|r
    .complete 1516,1 --Felstalker Hoof (2)
    .mob 地狱捕猎者
step
    #label Thazz
    .goto 1411/1,-4274.19,-87.76
    >>拾取靠墙放着的 |cRXP_LOOT_塔兹利尔的镐|r
    .complete 6394,1 --Thazz'ril's Pick (1)
step
    #label Yarrog
    .goto 1411/1,-4220.26,-59.56
    >>击杀 |cRXP_ENEMY_亚罗格·刺影|r，拾取 |cRXP_LOOT_火刃奖章|r
    .complete 794,1 --Burning Blade Medallion (1)
	.mob 亚罗格·刺影
step << Shaman
    #loop
	.goto 1411/1,-4220.26,-59.56,0
	.goto 1411/1,-4220.26,-59.56,25,0
	.goto 1411/1,-4234.54,5.65,25,0
	.goto 1411/1,-4265.73,-26.43,25,0
	.goto 1411/1,-4275.25,-47.58,25,0
	.goto 1411/1,-4295.87,-54.63,25,0
	.goto 1411/1,-4332.36,-42.64,25,0
	.goto 1411/1,-4332.89,-74.020,25,0
	.goto 1411/1,-4330.24,-115.26,25,0
	.goto 1411/1,-4349.28,-131.12,25,0
	.goto 1411/1,-4368.84,-138.52,25,0
	.goto 1411/1,-4349.28,-131.12,25,0
	.goto 1411/1,-4315.97,-131.47,25,0
	.goto 1411/1,-4300.10,-99.40,25,0
	.goto 1411/1,-4284.77,-105.740,25,0
	.goto 1411/1,-4282.13,-138.17,25,0
	.goto 1411/1,-4260.45,-150.16,25,0
	.goto 1411/1,-4238.77,-138.88,25,0
	.goto 1411/1,-4203.34,-102.92,25,0
	.goto 1411/1,-4211.27,-76.84,25,0
	.goto 1411/1,-4250.40,-88.82,25,0
    >>击杀 |cRXP_ENEMY_地狱捕猎者|r，拾取 |cRXP_LOOT_地狱捕猎者的蹄子|r
    .complete 1516,1 --Felstalker Hoof (2)
    .mob 地狱捕猎者
step
    #optional
    #loop
	.goto 1411/1,-4220.26,-59.56,25,0
	.goto 1411/1,-4234.54,5.65,25,0
	.goto 1411/1,-4265.73,-26.43,25,0
	.goto 1411/1,-4275.25,-47.58,25,0
	.goto 1411/1,-4295.87,-54.63,25,0
	.goto 1411/1,-4332.36,-42.64,25,0
	.goto 1411/1,-4332.89,-74.020,25,0
	.goto 1411/1,-4330.24,-115.26,25,0
	.goto 1411/1,-4349.28,-131.12,25,0
	.goto 1411/1,-4368.84,-138.52,25,0
	.goto 1411/1,-4349.28,-131.12,25,0
	.goto 1411/1,-4315.97,-131.47,25,0
	.goto 1411/1,-4300.10,-99.40,25,0
	.goto 1411/1,-4284.77,-105.740,25,0
	.goto 1411/1,-4282.13,-138.17,25,0
	.goto 1411/1,-4260.45,-150.16,25,0
	.goto 1411/1,-4238.77,-138.88,25,0
	.goto 1411/1,-4203.34,-102.92,25,0
	.goto 1411/1,-4211.27,-76.84,25,0
	.goto 1411/1,-4250.40,-88.82,25,0
    .xp 5+1680 >> 刷怪至1680+/2800经验值 << !Shaman
    .xp 5+690 >> 刷怪至690+/2800经验值 << Shaman
    .isQuestTurnedIn 4402
step
    #optional
    #loop
	.goto 1411/1,-4220.26,-59.56,25,0
	.goto 1411/1,-4234.54,5.65,25,0
	.goto 1411/1,-4265.73,-26.43,25,0
	.goto 1411/1,-4275.25,-47.58,25,0
	.goto 1411/1,-4295.87,-54.63,25,0
	.goto 1411/1,-4332.36,-42.64,25,0
	.goto 1411/1,-4332.89,-74.020,25,0
	.goto 1411/1,-4330.24,-115.26,25,0
	.goto 1411/1,-4349.28,-131.12,25,0
	.goto 1411/1,-4368.84,-138.52,25,0
	.goto 1411/1,-4349.28,-131.12,25,0
	.goto 1411/1,-4315.97,-131.47,25,0
	.goto 1411/1,-4300.10,-99.40,25,0
	.goto 1411/1,-4284.77,-105.740,25,0
	.goto 1411/1,-4282.13,-138.17,25,0
	.goto 1411/1,-4260.45,-150.16,25,0
	.goto 1411/1,-4238.77,-138.88,25,0
	.goto 1411/1,-4203.34,-102.92,25,0
	.goto 1411/1,-4211.27,-76.84,25,0
	.goto 1411/1,-4250.40,-88.82,25,0
    .xp 5+1300 >> 刷怪至1300+/2800经验值 << !Shaman
    .xp 5+310 >> 刷怪至310+/2800经验值 << Shaman
    .isOnQuest 4402
step << skip
	#completewith next
    .goto 1411/1,-4326.01,-41.23
    .goto 1411/1,-4793.96,233.36,30 >>|cRXP_WARN_站在岩石边缘，直到角色看起来悬在空中，然后登出再登录，完成登出跳跃|r
	.link https://www.youtube.com/watch?v=7vmnvdjbUnM >> 点击此处查看示例
step
    #softcore
    #completewith RazorHill1
    .goto 1411/1,-4326.01,-41.23
    .deathskip >> |cRXP_WARN_死亡后，在箭头附近的 |r|cRXP_FRIENDLY_灵魂医者|r|cRXP_WARN_处复活|r
    .target 灵魂医者
step
    #softcore
    #label Betrayers
    .goto 1411/1,-4709.36,274.960
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加索克|r交谈
    >>|cRXP_WARN_可以在地堡外或地堡顶部与他交谈|r
    .accept 784 >>接任务：背信弃义的人类
    .target 加索克
step
    #softcore
    .goto 1411/1,-4665.400,311.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师托尔卡|r交谈
    .accept 96825 >>接任务：这果子会咬人
    .target 厨师托尔卡
step
    #softcore
    #completewith next
    .goto 1411/1,-4617.88,290.47,12,0
    .goto 1411/1,-4611.01,293.64,8,0
    .goto 1411/1,-4616.82,317.26,12,0
    .goto 1411/1,-4604.13,364.49,12,0
    .goto 1411/1,-4588.80,383.53,10 >>前往高塔
step
    #softcore
    #completewith next
    .goto 1411/1,-4593.03,384.94,6,0
    .goto 1411/1,-4594.09,389.87,6,0
    .goto 1411/1,-4589.86,390.93,6,0
    .goto 1411/1,-4589.33,387.760,6,0
    .goto 1411/1,-4594.62,386.35,6,0
    .goto 1411/1,-4595.15,399.74,6,0
    .goto 1411/1,-4585.1,396.92,8 >>上塔前往弗恩处
step
    #softcore
    .goto 1411/1,-4600.43,384.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
    .accept 791 >>接任务：新的背包
    .target 弗恩·凝眉
step << Warrior/Rogue
    #softcore
    .goto 1411/1,-4701.95,366.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁恩|r交谈
    .train 2575 >> 学习 |T136248:0|t[采矿]
    >>|cRXP_WARN_这样就能从矿点采集到|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r |cRXP_WARN_，用于制作|r |T135248:0|t[磨刀石] |cRXP_WARN_（武器伤害+2，持续30分钟）|r
    .target 克鲁恩
step << Warrior/Rogue
    #softcore
    .goto 1411/1,-4706.71,358.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃克|r交谈
    >>|cRXP_BUY_购买一把|r |T134708:0|t[矿工锄] |cRXP_BUY_，找|r |cRXP_BUY_他购买|r
    .collect 2901,1,784,1 --Mining Pick (1)
    .target 沃克
step << Warrior/Rogue
    #softcore
    .goto 1411/1,-4714.64,372.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜克|r交谈
    .train 2018 >> 学习 |T136241:0|t[锻造]
    .target 杜克
    .skill blacksmithing,1,1
step -- (Barracks)
    #softcore
    #label RazorHill1
    .goto 1411/1,-4815.200,306.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图罗克|r交谈
    .accept 96822 >>接任务：为了荣耀！
    .target 图罗克
step
    #completewith next
    .hs >>炉石返回试炼谷
    .use 6948
step
    .goto 1411/1,-4322.31,-611.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头塔兹利尔|r交谈
    .turnin 6394 >>交任务：塔兹利尔的镐
    .target 工头塔兹利尔
step
    .goto 1411/1,-4221.85,-561.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
    .turnin 4402 >>交任务：戈加尔的清凉果
    .target 戈加尔
step
    .goto 1411/1,-4214.45,-565.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    .vendor >> 出售杂物
    .target 多克纳
    .isOnQuest 794
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .train 332 >>学习 |T136052:0|t[治疗波]
    .target +史克里克
    .goto 1411/1,-4203.87,-623.92
    .turnin 1516 >>交任务：大地的召唤
    .accept 1517 >>接任务：大地的召唤
    .target +坎纳甘·地鸣
    .goto 1411/1,-4204.4,-629.91
    .xp <6,1
step << Shaman
    .goto 1411/1,-4204.4,-629.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .turnin 1516 >>交任务：大地的召唤
    .accept 1517 >>接任务：大地的召唤
    .target 坎纳甘·地鸣
step
    .goto 1411/1,-4228.19,-629.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 794 >>交任务：火刃奖章
    .accept 805 >>接任务：去森金村报到
    .target 祖雷萨
step
    .goto 1411/1,-4223.800,-631.000
    >>点击桶顶的|cRXP_PICK_遗失的日记|r
    .accept 96652 >>接任务：冒险者
    .isQuestTurnedIn 794
step << Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .turnin 3085 >>交任务：神圣石板
	.accept 5649 >> 接任务：部族的传统
	.train 591 >>学习 |T135924:0|t[惩击]
    .train 17 >>学习 |T135940:0|t[真言术：盾]
    .target 肯杰
step << Mage
    .goto 1411/1,-4210.22,-625.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .train 143 >> 学习 |T135812:0|t[火球术]
    .train 2136 >>学习 |T135807:0|t[火焰冲击]
    .target 迈安
step << Hunter
    .goto 1411/1,-4227.66,-635.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .train 1130 >>学习 |T132212:0|t[猎人印记]
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target 基沙
    .money <0.02
step << Hunter
    .goto 1411/1,-4227.66,-635.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target 基沙
step << Warrior
    .goto 1411/1,-4230.31,-639.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .train 6343 >>学习 |T136105:0|t[雷霆一击]
    .target 弗朗恩
    .money <0.02
step << Warrior
    .goto 1411/1,-4230.31,-639.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .target 弗朗恩
step << Rogue
    #completewith RogueTraining
    .goto 1411/1,-4190.12,-603.12,15,0
    .goto 1411/1,-4157.87,-601.36,12,0
    .goto 1411/1,-4144.65,-588.67,12 >>前往 |cRXP_FRIENDLY_鲁瓦格|r处
step << Rogue
    .goto 1411/1,-4144.65,-588.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .train 1757 >> 学习 |T136189:0|t[邪恶攻击]
    .train 1776 >> 学习 |T132155:0|t[凿击]
    .target 鲁瓦格
    .money <0.02
    .xp <6,1
step << Rogue
    #label RogueTraining
    .goto 1411/1,-4144.65,-588.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .train 1757 >> 学习 |T136189:0|t[邪恶攻击]
    .target 鲁瓦格
    .xp <6,1
step << Warlock
    #completewith Hraug3
    .goto 1411/1,-4190.12,-603.12,15,0
    .goto 1411/1,-4157.87,-601.36,12,0
    .goto 1411/1,-4143.06,-594.31,12,0
    .goto 1411/1,-4120.86,-589.72,12,0
    .goto 1411/1,-4107.11,-604.18,12 >>前往 |cRXP_FRIENDLY_赫劳格|r处
step << Warlock
    #label Hraug3
    .goto 1411/1,-4107.11,-604.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    >>|cRXP_BUY_向他购买|r |T133738:0|t[魔典：血契] |cRXP_BUY_备用|r
    .collect 16321,1,817,1 --Grimoire of Blood Pact
    .vendor >>出售杂物
    .target 赫劳格
    .money <0.03
    .train 6307,1 --Blood Pact (Rank 1)
step << Warlock
    .goto 1411/1,-4111.87,-607.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .train 1454 >> 学习 |T136126:0|t[生命分流]
    .target 纳托克
    .money <0.02
step << Warlock
    #optional
    .goto 1411/1,-4111.87,-607.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .target 纳托克
step << Shaman
    #completewith CallOE1
    #label Shrine
    .goto 1411/1,-4255.16,-645.07,25,0
    .goto 1411/1,-4245.64,-691.95,25,0
    .goto 1411/1,-4146.77,-787.12,12,0
    .goto 1411/1,-4120.86,-813.21,8,0
    .goto 1411/1,-4220.79,-841.76,10,0
    .goto 1411/1,-4266.26,-853.39,15,0
    .goto 1411/1,-4295.87,-883.36,25 >>前往 |cRXP_PICK_萨满祭坛|r
    .isOnQuest 1517
step << Shaman
    #completewith next
    #requires Shrine
    .cast 8202 >>|cRXP_WARN_使用|r |T134743:0|t[大地灵契]
    .use 6635
step << Shaman
    #label CallOE1
    .goto 1411/1,-4290.59,-878.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大地之魂|r交谈
    .turnin 1517 >>交任务：大地的召唤
    .accept 1518 >>接任务：大地的召唤
    .target 大地之魂
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .goto 1411/1,-4204.4,-629.91
    .turnin 1518 >>交任务：大地的召唤
    .target 坎纳甘·地鸣
step << Shaman
    .goto 1411/1,-4203.87,-623.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈
    .train 332 >>学习 |T136052:0|t[治疗波]
    .target 史克里克
step
    #label Leave
    .goto 1411/1,-4452.38,-631.32,25,0
    .goto 1411/1,-4554.43,-628.50,20,0
    .goto 1411/1,-4600.96,-603.82,25 >>离开试炼谷
    .isOnQuest 805
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（部落）
#forever
#disabledungeons
<< Horde
#name 6-10 Durotar
#version 11
#group RestedXP Forever Guide (H)
#subgroup Speedrun Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
#defaultfor Troll/Orc
#next 10-12 Durotar
#displayname 6-10 杜隆塔尔
step
    .goto 1411/1,-4715.17,-599.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌克尔|r交谈
    .accept 2161 >>接任务：苦工的重担
    .target 乌克尔
step
    #completewith next
    .subzone 367 >>前往森金村
step
    #loop
    .goto 1411/1,-4828.32,-777.61,0
    .goto 1411/1,-4822.51,-881.59,25,0
    .goto 1411/1,-4845.24,-829.42,25,0
    .goto 1411/1,-4828.32,-777.61,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉尔·猎齿|r交谈
    >>|cRXP_WARN_他会在附近稍作巡逻|r
    .accept 786 >>接任务：科卡尔半人马的进攻
    .target 拉尔·猎齿
step
    .goto 1411/1,-4885.200,-852.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克萨尔迪|r交谈
    .accept 97223 >>接任务：血爪族母
    .target 克萨尔迪
step
    #label SenjinPickups
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔林·长牙|r、|cRXP_FRIENDLY_沃纳尔大师|r和|cRXP_FRIENDLY_加德林大师|r交谈
    .accept 817 >>接任务：生活所需的虎皮
    .accept 96821 >>接任务：拔腿就跑
    .target +维尔林·长牙
    .goto 1411/1,-4920.86,-797.70
    .accept 818 >>接任务：沃纳尔大师
    .accept 97225 >>接任务：被遗忘的洛阿神像
    .target +沃纳尔大师
    .goto 1411/1,-4920.33,-814.270
    .turnin 805 >>交任务：去森金村报到
    .accept 808 >>接任务：明希纳的颅骨
    .accept 826 >>接任务：扎拉赞恩
    .accept 823 >>接任务：向奥戈尼尔报告
    .target +加德林大师
    .goto 1411/1,-4920.33,-825.55
step
    #completewith next
    .goto 1411/1,-4931.96,-815.32,8,0
    .goto 1411/1,-4939.89,-793.12,8 >> 进入大屋
step << !Rogue !Warrior
    .goto 1411/1,-4960.000,-791.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕祖拉|r交谈
    >>|cRXP_WARN_这会解锁一个任务。如果已有2个专业，就跳过此步骤|r
    .train 7411 >> 学习 |T136244:0|t[附魔]
    .target 帕祖拉
step << !Rogue !Warrior
    .goto 1411/1,-4960.000,-791.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕祖拉|r交谈
    .accept 96873 >>接任务：脖子上的麻烦
    .target 帕祖拉
    .skill enchanting,<1,1
step << Rogue
    .goto 1411/1,-4938.83,-779.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_克瓦埃|r|cRXP_BUY_交谈，购买|r |T132414:0|t[增重飞斧] |cRXP_BUY_备用|r
    .collect 3131,1,786,1 --Weighted Throwing Axe (200)
    .target 克瓦埃
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
    .money <0.07
step << Warlock/Mage/Priest
    .goto 1411/1,-4938.83,-779.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_交谈对象：|r |cRXP_FRIENDLY_克瓦埃|r
    >>|cRXP_BUY_向她购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_备用|r --Refreshing Spring Water (20)
    .collect 159,20,786,1
    .target 克瓦埃
    .money <0.010
step << Warlock/Mage/Priest
    .goto 1411/1,-4938.83,-779.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_交谈对象：|r |cRXP_FRIENDLY_克瓦埃|r
    >>|cRXP_BUY_向她购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_备用|r --Refreshing Spring Water (10)
    .collect 159,10,786,1
    .target 克瓦埃
    .money <0.0050
step << Shaman
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135145:0|t[学徒短杖]的钱（4 银 79 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买一把|r |T135145:0|t[学徒短杖] |cRXP_BUY_备用|r
    .collect 2495,1,786,1 --Collect Walking Stick (1)
    .money <0.0479
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135641:0|t[卷刃的剑]的钱（3 银 81 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买一把|r |T135641:0|t[卷刃的剑] |cRXP_BUY_备用|r
    .collect 2494,1,786,1 --Collect Stiletto (1)
    .money <0.0381
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。如果卖掉现用武器后能凑够购买 |T132401:0|t[双刃战斧]的费用（4 银 60 铜），就卖掉它；若仍不够，稍后再回来购买。
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Orc Warrior
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，向他购买一把|r |T132401:0|t[双刃战斧]|cRXP_BUY_。|r
    .collect 2491,1,786,1 --Collect Large Axe (1)
    .money <0.0460
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135421:0|t[小手斧]的钱（5 银 13 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Troll Warrior
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买一把|r |T135421:0|t[小手斧] |cRXP_BUY_备用|r
    .collect 2490,1,786,1 --Collect Tomahawk (1)
    .money <0.0513
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135499:0|t[角木弯弓]的费用（2 银 71 铜），就卖掉它；若仍不够，稍后再回来购买。
    .target 特莱耶克
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买|r |T135499:0|t[角木弯弓] |cRXP_BUY_备用|r
    .collect 2506,1,786,1 --Collect Hornwood Recurve Bow (1)
    .money <0.0271
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Rogue
    #optional
    #completewith Bonfire
    +|cRXP_WARN_装备|r |T132414:0|t[增重飞斧]
    .use 3131
    .itemcount 3131,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Shaman
    #optional
    #completewith Bonfire
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    #optional
    #completewith Bonfire
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    #optional
    #completewith Bonfire
    +|cRXP_WARN_装备|r |T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    #optional
    #completewith Bonfire
    +|cRXP_WARN_装备|r |T135421:0|t[小手斧]
    .use 2490
    .itemcount 2490,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    #optional
    #completewith Bonfire
    +|cRXP_WARN_装备|r |T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Mage
    .goto 1411/1,-4939.36,-838.941
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安苏瓦|r交谈
    .train 143 >> 学习 |T135812:0|t[火球术]
    .train 2136 >>学习 |T135807:0|t[火焰冲击]
    .target 安苏瓦
step << Warrior/Rogue
    #softcore
    #completewith TravelToTiragarde
    +|cRXP_WARN_施放|r |T136025:0|t[寻找矿物] |cRXP_WARN_，开采沿途铜矿，收集|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_，然后制作|r |T135248:0|t[磨刀石] |cRXP_WARN_备用|r
    .collect 2862,1,786,1
    .skill blacksmithing,<1,1
    .train 2575,3 --Mining Trained
step
    #completewith next
    .goto 1411/1,-5057.80,-866.79,40,0
    .goto 1411/1,-5014.97,-937.99,40,0
    .goto 1411/1,-4908.69,-998.27,40,0
    .goto 1411/1,-4829.91,-1091.33,40,0
    .goto 1411/1,-4722.57,-1117.42,40,0
    >>沿海滩往下跑，击杀 |cRXP_ENEMY_螃蟹|r和|cRXP_ENEMY_龙虾人|r，拾取它们的 |cRXP_LOOT_粘液|r和|cRXP_LOOT_眼球|r。不必在此完成这一步。
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    .goto 1411/1,-4722.57,-1117.42,75 >> 跑到海滩尽头
    .isOnQuest 818
step
    #completewith Bonfire
    >>击杀 |cRXP_ENEMY_科卡尔苦工|r和|cRXP_ENEMY_科卡尔前锋|r，拾取 |cRXP_LOOT_帆布碎片|r
--   >>|cRXP_WARN_Do not focus on completing this|r
    .complete 791,1 --Canvas Scraps (8)
    .isOnQuest 791
step
    .goto 1411/1,-4653.84,-983.47,30 >>进入科卡尔营地
    .isOnQuest 786
step << Priest
    #sticky
    #softcore
    #label Linen
    >>|cRXP_WARN_在杜隆塔尔做任务时，开始收集3组|r |T132889:0|t[亚麻布] |cRXP_WARN_，之后用来制作魔杖|r
    >>|cRXP_WARN_如果已经买到魔杖，或能从拍卖行便宜买到，就跳过此步骤|r
    .collect 2589,60 --Linen Cloth (60)
step << Priest
    #sticky
    #hardcore
    #label Linen
    >>|cRXP_WARN_在杜隆塔尔做任务时，开始收集3组|r |T132889:0|t[亚麻布] |cRXP_WARN_，之后用来制作魔杖|r
    .collect 2589,60 --Linen Cloth (60)
step
    #sticky
    #completewith Bonfire
    +|cRXP_WARN_如果|r |cRXP_ENEMY_科卡尼斯|r |cRXP_WARN_刷新了，务必小心，他是9级稀有怪。如果有|r |T134829:0|t[初级治疗药水] |cRXP_WARN_，必要时使用|r
    .unitscan 科卡尼斯
step
    .goto 1411/1,-4596.20,-1057.14
    >>烧毁帐篷内地上的 |cRXP_PICK_攻击计划|r
    .complete 786,1 --Attack Plan: Valley of Trials destroyed (1)
step
    >>烧毁地上的 |cRXP_PICK_攻击计划|r
    .goto 1411/1,-4482.52,-917.90
    .complete 786,2 --Attack Plan: Sen'jin Village destroyed (1)
step
    #label Bonfire
    >>烧毁地上的 |cRXP_PICK_攻击计划|r
    .goto 1411/1,-4406.91,-974.30
    .complete 786,3 --Attack Plan: Orgrimmar destroyed (1)
step
    #softcore
    .goto 1411/1,-4410.400,-963.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕尔朱::275811|r交谈
    >>|cRXP_WARN_这会开始一个护送任务|r
    >>|cRXP_WARN_如果 |r|cRXP_FRIENDLY_帕尔朱::275811|r|cRXP_WARN_不在，就跳过这一步，在篝火处死亡并返回森金村复活|r
    .accept 99123,1 >>接任务：迷失暗影
    .target 帕尔朱::275811
step
    #hardcore
    .goto 1411/1,-4410.400,-963.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕尔朱::275811|r交谈
    >>|cRXP_WARN_这会开始一个护送任务|r
    >>|cRXP_WARN_如果 |r|cRXP_FRIENDLY_帕尔朱::275811|r|cRXP_WARN_不在，就跳过这一步|r
    .accept 99123,1 >>接任务：迷失暗影
    .target 帕尔朱::275811
step
    .goto 1411/1,-4681.300,-986.800
    >>护送 |cRXP_FRIENDLY_帕尔朱::275811|r离开科卡尔峭壁
    .complete 99123,1 --
    .target 帕尔朱::275811
    .isOnQuest 99123
step << skip
    #softcore
    .goto 1411/1,-4417.49,-985.23,-1
    .goto 1411/1,-5002.81,-774.08,-1
    .deathskip >> 在篝火处死亡，然后在 |cRXP_FRIENDLY_灵魂医者|r处复活
    .isQuestComplete 786
step << skip
    #hardcore
    #completewith next
    .goto 1411/1,-4656.48,-981.35,30 >>离开科卡尔营地
    .isQuestComplete 786
step
    #loop
    .goto 1411/1,-4828.32,-777.61,0
    .goto 1411/1,-4822.51,-881.59,25,0
    .goto 1411/1,-4845.24,-829.42,25,0
    .goto 1411/1,-4828.32,-777.61,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉尔·猎齿|r交谈
    >>|cRXP_WARN_他会在附近稍作巡逻|r
    .turnin 786,1 >>交任务：科卡尔半人马的进攻 << Shaman
    .turnin 786 >>交任务：科卡尔半人马的进攻 << !Shaman
    .target 拉尔·猎齿
    .isQuestComplete 786
step
    .goto 1411/1,-4920.900,-814.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃纳尔大师|r交谈
    .turnin 99123 >>交任务：迷失暗影
    .target 沃纳尔大师
    .isQuestComplete 99123
step << Shaman
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135145:0|t[学徒短杖]的钱（4 银 79 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买一把|r |T135145:0|t[学徒短杖] |cRXP_BUY_备用|r
    .collect 2495,1,823,1 --Collect Walking Stick (1)
    .money <0.0479
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135641:0|t[卷刃的剑]的钱（3 银 81 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买一把|r |T135641:0|t[卷刃的剑] |cRXP_BUY_备用|r
    .collect 2494,1,823,1 --Collect Stiletto (1)
    .money <0.0381
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T132401:0|t[双刃战斧]的钱（4 银 60 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Orc Warrior
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买一把|r |T132401:0|t[双刃战斧] |cRXP_BUY_备用|r
    .collect 2491,1,823,1 --Collect Large Axe (1)
    .money <0.0460
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135421:0|t[小手斧]的钱（5 银 13 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Troll Warrior
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买一把|r |T135421:0|t[小手斧] |cRXP_BUY_备用|r
    .collect 2490,1,823,1 --Collect Tomahawk (1)
    .money <0.0513
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135499:0|t[角木弯弓]的费用（2 银 71 铜），就卖掉它；若仍不够，稍后再回来购买。
    .target 特莱耶克
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买|r |T135499:0|t[角木弯弓] |cRXP_BUY_备用|r
    .collect 2506,1,823,1 --Collect Hornwood Recurve Bow (1)
    .money <0.0271
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Rogue
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T132414:0|t[增重飞斧]
    .use 3131
    .itemcount 3131,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Shaman
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135421:0|t[小手斧]
    .use 2490
    .itemcount 2490,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step
    #optional
    .goto 1411/1,-4920.86,-813.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃纳尔大师|r交谈
    .turnin 818 >>交任务：沃纳尔大师
    .target 沃纳尔大师
    .isQuestComplete 818
step << Warlock/Mage/Priest
    .goto 1411/1,-4938.83,-779.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_交谈对象：|r |cRXP_FRIENDLY_克瓦埃|r
    >>|cRXP_BUY_向她购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_备用|r --Refreshing Spring Water (20)
    .vendor >> 出售杂物
    .collect 159,20,784,1
    .target 克瓦埃
step << !Warlock !Mage !Priest
    .goto 1411/1,-4903.41,-786.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海赞|r交谈
    >>|cRXP_BUY_购买|r |T133974:0|t[肉排]|cRXP_BUY_，由他出售；前提是你买得起|r << Warrior/Rogue
    .vendor >> 出售杂物
    .target 海赞
step
    #softcore
    #loop
    .goto 1411/1,-4828.32,-777.61,0
    .goto 1411/1,-4822.51,-881.59,25,0
    .goto 1411/1,-4845.24,-829.42,25,0
    .goto 1411/1,-4828.32,-777.61,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉尔·猎齿|r交谈
    >>|cRXP_WARN_他会在附近稍作巡逻|r
    .turnin 786,1 >>交任务：科卡尔半人马的进攻 << Shaman
    .turnin 786 >>交任务：科卡尔半人马的进攻 << !Shaman
    .target 拉尔·猎齿
step
    #completewith next
    >>击杀 |cRXP_ENEMY_脊影潜伏者|r和|cRXP_ENEMY_脊影爬行者|r
    .complete 96821,2 --|6/6 Ridgeshade Lurker slain
    .mob +脊影潜伏者
    .complete 96821,1 --|6/6 Ridgeshade Creeper slain
    .mob +脊影爬行者
step
    .goto 1411/1,-4565.700,-192.300
    >>击杀|cRXP_ENEMY_乌科斯之灾|r（精英），拾取 |T133628:0|t[|cRXP_LOOT_乌克尔遗失的背包|r]
    >>|cRXP_WARN_这个敌人很难对付！尽量组队；如果无法击杀，请跳过此步骤|r
    .collect 275722,1,96876 --Ukor's Lost Pack (x1)
    .accept 96876 >>接任务：乌克尔遗失的背包
    .mob 乌科斯之灾
step
    .goto 1411/1,-4710.400,-209.400
    >>击杀 |cRXP_ENEMY_脊影潜伏者|r和|cRXP_ENEMY_脊影爬行者|r
    .complete 96821,2 --|6/6 Ridgeshade Lurker slain
    .mob +脊影潜伏者
    .complete 96821,1 --|6/6 Ridgeshade Creeper slain
    .mob +脊影爬行者
step --camp quest
    #hardcore
    .goto 1411/1,-4713.000,140.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉克|r交谈
    .turnin 96652 >>交任务：冒险者
    .accept 96604 >>接任务：广阔天地
    .target 布拉克
    .isOnQuest 96652
step --camp quest
    #hardcore
    #optional
    .goto 1411/1,-4713.000,140.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉克|r交谈
    .accept 96604 >>接任务：广阔天地
    .target 布拉克
step
    #hardcore
    .goto 1411/1,-4715.200,140.100
    >>|cRXP_WARN_在营火旁输入 /sit，等一分钟，直到获得“强化休息”Buff|r
    .complete 96604,1 --|1/1 Use the /sit emote near the campfire
    .macro 坐下,134400 >>/sit
    .timer 59, 剧情演出
    .complete 96604,2 --|Gain the Boosted Rest buff
step
    #hardcore
    .goto 1411/1,-4713.000,140.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉克|r交谈
    .turnin 96604 >>交任务：广阔天地
    --.accept 97900 >>Accept Camping 101: Blacksmithing
    .accept 96655 >>接任务：露营入门：烹饪
    --.accept 97907 >>Accept Camping 101: Mining
    .target 布拉克
step
    #hardcore
    #completewith next
    .subzone 362 >>前往剃刀岭
step
    #hardcore
    #label Betrayers
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥戈尼尔·魂痕|r、|cRXP_FRIENDLY_加索克|r和|cRXP_FRIENDLY_厨师托尔卡|r交谈
    .turnin 823 >>交任务：向奥戈尼尔报告
    .accept 806 >>接任务：黑暗风暴
    .target +奥戈尼尔·魂痕
    .goto 1411/1,-4724.69,287.30
    .accept 784 >>接任务：背信弃义的人类
    .accept 837 >>接任务：野猪人的进犯
    .target +加索克
    .goto 1411/1,-4709.36,274.960
    .accept 815 >>接任务：恐龙蛋大餐
    .target +厨师托尔卡
    .goto 1411/1,-4663.88,310.56
step
    #hardcore
    .goto 1411/1,-4663.88,310.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈对象： |cRXP_FRIENDLY_厨师托尔卡|r
    .train 2550 >>学习烹饪
    .turnin 96655 >>交任务：露营入门：烹饪
    .target 厨师托尔卡
step
    #hardcore
    .goto 1411/1,-4665.400,311.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师托尔卡|r交谈
    .accept 96825 >>接任务：这果子会咬人
    .target 厨师托尔卡
step
    #hardcore
    #completewith next
    .goto 1411/1,-4617.88,290.47,12,0
    .goto 1411/1,-4611.01,293.64,8,0
    .goto 1411/1,-4616.82,317.26,12,0
    .goto 1411/1,-4604.13,364.49,12,0
    .goto 1411/1,-4588.80,383.53,10 >>前往高塔
step
    #hardcore
    #completewith next
    .goto 1411/1,-4593.03,384.94,6,0
    .goto 1411/1,-4594.09,389.87,6,0
    .goto 1411/1,-4589.86,390.93,6,0
    .goto 1411/1,-4589.33,387.760,6,0
    .goto 1411/1,-4594.62,386.35,6,0
    .goto 1411/1,-4595.15,399.74,6,0
    .goto 1411/1,-4585.1,396.92,8 >>上塔前往弗恩处
step
    #hardcore
    .goto 1411/1,-4600.43,384.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
    .accept 791 >>接任务：新的背包
    .target 弗恩·凝眉
step << Warrior/Rogue
    #hardcore
    .goto 1411/1,-4701.95,366.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁恩|r交谈
    .train 2575 >> 学习 |T136248:0|t[采矿]
    >>|cRXP_WARN_这样就能从矿点采集到|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r |cRXP_WARN_，用于制作|r |T135248:0|t[磨刀石] |cRXP_WARN_（武器伤害+2，持续30分钟）|r
    .target 克鲁恩
step << Warrior/Rogue
    #hardcore
    .goto 1411/1,-4706.71,358.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃克|r交谈
    >>|cRXP_BUY_购买一把|r |T134708:0|t[矿工锄] |cRXP_BUY_，找|r |cRXP_BUY_他购买|r
    .collect 2901,1,784,1 --Mining Pick (1)
    .target 沃克
step << Warrior/Rogue
    #hardcore
    .goto 1411/1,-4714.64,372.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜克|r交谈
    .train 2018 >> 学习 |T136241:0|t[锻造]
    .target 杜克
    .skill blacksmithing,1,1
step -- (Barracks)
    #hardcore
    #label RazorHill1
    .goto 1411/1,-4815.200,306.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图罗克|r交谈
    .accept 96822 >>接任务：为了荣耀！
    .target 图罗克
step << Warrior/Rogue
    #hardcore
    #completewith TravelToTiragarde
    +|cRXP_WARN_施放|r |T136025:0|t[寻找矿物] |cRXP_WARN_，开采沿途铜矿，收集|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_，然后制作|r |T135248:0|t[磨刀石] |cRXP_WARN_备用|r
    .collect 2862,1,786,1
    .skill blacksmithing,<1,1
    .train 2575,3 --Mining Trained
step
    #softcore
    #label TravelToTiragarde
    .goto 1411/1,-4979.200,-232.800
    .subzone 372 >> 前往提拉加德城堡
    -->>|cRXP_WARN_Grind mobs on the way|r
    .isOnQuest 784
step
    #hardcore
    #label TravelToTiragarde
    .goto 1411/1,-4979.200,-232.800
    .subzone 372 >> 前往提拉加德城堡
    -->>|cRXP_WARN_Grind mobs on the way|r
    .isOnQuest 784
step
    #completewith AgedEnvelope
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r，拾取 |cRXP_LOOT_帆布碎片|r
    .complete 784,1 --Kul Tiras Sailor (10)
    .mob +库尔提拉斯水手
    .complete 784,2 --Kul Tiras Marine (8)
    .mob +库尔提拉斯水兵
    .complete 791,1 --Canvas Scraps (8)
    .mob +库尔提拉斯水兵
    .mob +库尔提拉斯水手
step --south/west of keep
    #completewith next
    .goto 1411/1,-4992.700,-234.400,0
    .goto 1411/1,-5101.700,-178.500,0
    .goto 1411/1,-4992.700,-234.400,25,0
    .goto 1411/1,-5101.700,-178.500,25,0
    >>拾取地上的 |cRXP_PICK_袭击者之弓|r
    >>|cRXP_WARN_有两个不同的刷新位置|r
    .complete 96822,1 --|1/1 Raider's Bow
step --center in keep
    .goto 1411/1,-4994.900,-182.300
    >>拾取地上的 |cRXP_PICK_袭击者战斧|r
    .complete 96822,2 --|1/1 Raider's Battleaxe
step
    #sticky
    #completewith AgedEnvelope
    +|cRXP_WARN_如果|r |cRXP_ENEMY_指挥官萨拉菲尔|r |cRXP_WARN_刷新了，务必小心，他是9级稀有怪。如果有|r |T134829:0|t[初级治疗药水] |cRXP_WARN_，必要时使用|r
    .unitscan 指挥官萨拉菲尔
step
    #completewith Benedict
    #requires TravelToTiragarde
    .goto 1411/1,-5124.95,-243.92,8,0
    .goto 1411/1,-5115.96,-251.68,8,0
    .goto 1411/1,-5111.21,-232.29,8,0
    .goto 1411/1,-5097.46,-232.29,8 >> 前往要塞二楼
step
    #label Benedict
    .goto 1411/1,-5121.78,-245.68
    >>击杀 |cRXP_ENEMY_本尼迪克上尉|r，拾取他的 |cRXP_LOOT_钥匙|r
    .complete 784,3 --Lieutenant Benedict (1)
    .collect 4882,1,830,1 --Collect Benedict's Key (1)
    .mob 本尼迪克上尉
step
    .goto 1411/1,-5128.13,-231.58,5,0
    .goto 1411/1,-5126.01,-221.36,5,0
    .goto 1411/1,-5124.42,-229.82,5,0
    .goto 1411/1,-5131.83,-229.82,5,0
    .goto 1411/1,-5131.83,-222.42,5,0
    .goto 1411/1,-5096.40,-223.83
    >>|cRXP_WARN_走上城堡楼上|r
    >>打开 |cRXP_PICK_本尼迪克的箱子|r，拾取 |T133471:0|t[|cRXP_LOOT_旧信封|r]
    >>使用 |T133471:0|t[|cRXP_LOOT_旧信封|r] 接受任务
    .collect 4881,1,830 --Collect Aged Envelope (1)
    .accept 830 >>接任务：将军的命令
    .use 4881
step --south/west of keep
    #loop
    .goto 1411/1,-4992.700,-234.400,0
    .goto 1411/1,-5101.700,-178.500,0
    .goto 1411/1,-5101.700,-178.500,25,0
    .goto 1411/1,-4992.700,-234.400,25,0
    >>拾取地上的 |cRXP_PICK_袭击者之弓|r
    >>|cRXP_WARN_有两个不同的刷新位置|r
    .complete 96822,1 --|1/1 Raider's Bow
step  --northern tower
    #label AgedEnvelope
    .goto 1411/1,-4951.500,-59.600
    >>拾取地上的 |cRXP_PICK_袭击者之盾|r
    .complete 96822,3 --|1/1 Raider's Shield
step
    #loop
    .goto 1411/1,-5081.60,-246.740,0
    .goto 1411/1,-5010.74,-254.50,30,0
    .goto 1411/1,-4995.41,-186.46,30,0
    .goto 1411/1,-5034.54,-148.75,30,0
    .goto 1411/1,-5057.80,-83.89,30,0
    .goto 1411/1,-4952.05,-113.50,30,0
    .goto 1411/1,-4943.06,-248.50,30,0
    .goto 1411/1,-5081.60,-246.740,30,0
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r，拾取 |cRXP_LOOT_帆布碎片|r
    .complete 784,1 --Kul Tiras Sailor (10)
    .mob +库尔提拉斯水手
    .complete 784,2 --Kul Tiras Marine (8)
    .mob +库尔提拉斯水兵
    .complete 791,1 --Canvas Scraps (8)
    .mob +库尔提拉斯水兵
    .mob +库尔提拉斯水手
    .itemcount 4870,<8 --Canvas Scraps (<8)
step
    #optional
    #loop
    .goto 1411/1,-5081.60,-246.740,0
    .goto 1411/1,-5010.74,-254.50,30,0
    .goto 1411/1,-4995.41,-186.46,30,0
    .goto 1411/1,-5034.54,-148.75,30,0
    .goto 1411/1,-5057.80,-83.89,30,0
    .goto 1411/1,-4952.05,-113.50,30,0
    .goto 1411/1,-4943.06,-248.50,30,0
    .goto 1411/1,-5081.60,-246.740,30,0
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r
    .complete 784,1 --Kul Tiras Sailor (10)
    .mob +库尔提拉斯水手
    .complete 784,2 --Kul Tiras Marine (8)
    .mob +库尔提拉斯水兵
step
    #optional
    #label ScrapsFinished
    #loop
    .goto 1411/1,-5081.60,-246.740,0
    .goto 1411/1,-5010.74,-254.50,30,0
    .goto 1411/1,-4995.41,-186.46,30,0
    .goto 1411/1,-5034.54,-148.75,30,0
    .goto 1411/1,-5057.80,-83.89,30,0
    .goto 1411/1,-4952.05,-113.50,30,0
    .goto 1411/1,-4943.06,-248.50,30,0
    .goto 1411/1,-5081.60,-246.740,30,0
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r，拾取 |cRXP_LOOT_帆布碎片|r
    .complete 791,1 --Canvas Scraps (8)
    .mob 库尔提拉斯水手
    .mob 库尔提拉斯水兵
step << !Priest !Mage
    #optional
    #loop
    .goto 1411/1,-5083.18,37.37,50,0
    .goto 1411/1,-5025.55,126.56,50,0
    .goto 1411/1,-5092.7,246.76,50,0
    .goto 1411/1,-5027.13,311.62,50,0
    .goto 1411/1,-4948.35,276.72,50,0
    .goto 1411/1,-4897.06,82.14,50,0
    .xp 7+2520 >> 刷怪至2520+/4500经验值
    .isNotOnQuest 823
step << !Priest !Mage
    #optional
    #loop
    .goto 1411/1,-5083.18,37.37,50,0
    .goto 1411/1,-5025.55,126.56,50,0
    .goto 1411/1,-5092.7,246.76,50,0
    .goto 1411/1,-5027.13,311.62,50,0
    .goto 1411/1,-4948.35,276.72,50,0
    .goto 1411/1,-4897.06,82.14,50,0
    .xp 7+2200 >> 刷怪至2200+/4500经验值
    .isOnQuest 823
step << Priest
    #optional
    #loop
    .goto 1411/1,-5083.18,37.37,50,0
    .goto 1411/1,-5025.55,126.56,50,0
    .goto 1411/1,-5092.7,246.76,50,0
    .goto 1411/1,-5027.13,311.62,50,0
    .goto 1411/1,-4948.35,276.72,50,0
    .goto 1411/1,-4897.06,82.14,50,0
    .xp 7+2070 >> 刷怪至2070+/4500经验值
    .isNotOnQuest 823
step << Priest
    #optional
    #loop
    .goto 1411/1,-5083.18,37.37,50,0
    .goto 1411/1,-5025.55,126.56,50,0
    .goto 1411/1,-5092.7,246.76,50,0
    .goto 1411/1,-5027.13,311.62,50,0
    .goto 1411/1,-4948.35,276.72,50,0
    .goto 1411/1,-4897.06,82.14,50,0
    .xp 7+1750 >> 刷怪至1750+/4500经验值
    .isOnQuest 823
step << skip
    #softcore
    #completewith RazorTurnins1
    .goto 1411/1,-4992.24,-77.54,120,0
    .deathskip >> 在提拉加德城堡外的北塔处死亡，然后在 |cRXP_FRIENDLY_灵魂医者|r处复活
step --camp quest
    #softcore
    .goto 1411/1,-4713.000,140.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉克|r交谈
    .turnin 96652 >>交任务：冒险者
    .accept 96604 >>接任务：广阔天地
    .target 布拉克
    .isOnQuest 96652
step --camp quest
    #softcore
    #optional
    .goto 1411/1,-4713.000,140.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉克|r交谈
    .accept 96604 >>接任务：广阔天地
    .target 布拉克
step
    #softcore
    .goto 1411/1,-4715.200,140.100
    >>|cRXP_WARN_在营火旁输入 /sit，等一分钟，直到获得“强化休息”Buff|r
    .complete 96604,1 --|1/1 Use the /sit emote near the campfire
    .macro 坐下,134400 >>/sit
    .timer 59, 剧情演出
    .complete 96604,2 --|Gain the Boosted Rest buff
step
    #softcore
    .goto 1411/1,-4713.000,140.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉克|r交谈
    .turnin 96604 >>交任务：广阔天地
    --.accept 97900 >>Accept Camping 101: Blacksmithing
    .accept 96655 >>接任务：露营入门：烹饪
    --.accept 97907 >>Accept Camping 101: Mining
    .target 布拉克
step
    #completewith next
    .subzone 362 >>前往剃刀岭
step
    #softcore
    #label RazorTurnins1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥戈尼尔·魂痕|r、|cRXP_FRIENDLY_加索克|r和|cRXP_FRIENDLY_厨师托尔卡|r交谈
    .turnin 823 >>交任务：向奥戈尼尔报告
    .accept 806 >>接任务：黑暗风暴
    .target +奥戈尼尔·魂痕
    .goto 1411/1,-4724.69,287.30
    .turnin 784 >>交任务：背信弃义的人类
    .turnin 830 >>交任务：将军的命令
    .turnin 96821 >>交任务：拔腿就跑
    .accept 825 >>接任务：海底沉船
    .accept 831 >>接任务：将军的命令
    .accept 837 >>接任务：野猪人的进犯
    .target +加索克
    .goto 1411/1,-4709.36,274.960
    .accept 815 >>接任务：恐龙蛋大餐
    .target +厨师托尔卡
    .goto 1411/1,-4663.88,310.56
step
    #hardcore
    #label RazorTurnins1
    .goto 1411/1,-4709.36,274.960
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈对象： |cRXP_FRIENDLY_加索克|r
    .turnin 784 >>交任务：背信弃义的人类
    .turnin 830 >>交任务：将军的命令
    .turnin 96821 >>交任务：拔腿就跑
    .accept 825 >>接任务：海底沉船
    .accept 831 >>接任务：将军的命令
    .target +加索克
step
    #optional
    .goto 1411/1,-4724.900,287.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥戈尼尔·魂痕|r交谈
    .accept 99048 >>接任务：失踪的帮手
    .target 奥戈尼尔·魂痕
    .xp <9,1
step
    #softcore
    .goto 1411/1,-4663.88,310.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈对象： |cRXP_FRIENDLY_厨师托尔卡|r
    .train 2550 >>学习烹饪
    .turnin 96655 >>交任务：露营入门：烹饪
    .target 厨师托尔卡
step
    #completewith next
    .goto 1411/1,-4617.88,290.47,12,0
    .goto 1411/1,-4611.01,293.64,8,0
    .goto 1411/1,-4616.82,317.26,12,0
    .goto 1411/1,-4604.13,364.49,12,0
    .goto 1411/1,-4588.80,383.53,10 >>前往高塔
step
    #completewith next
    .goto 1411/1,-4593.03,384.94,6,0
    .goto 1411/1,-4594.09,389.87,6,0
    .goto 1411/1,-4589.86,390.93,6,0
    .goto 1411/1,-4589.33,387.760,6,0
    .goto 1411/1,-4594.62,386.35,6,0
    .goto 1411/1,-4595.15,399.74,6,0
    .goto 1411/1,-4585.1,396.92,8 >>上塔前往弗恩处
step
    .goto 1411/1,-4600.43,384.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
    .turnin 791 >>交任务：新的背包
    .target 弗恩·凝眉
step << Warrior/Rogue
    .goto 1411/1,-4701.95,366.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁恩|r交谈
    .train 2575 >> 学习 |T136248:0|t[采矿]
    >>|cRXP_WARN_这样就能从矿点采集到|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r |cRXP_WARN_，用于制作|r |T135248:0|t[磨刀石] |cRXP_WARN_（武器伤害+2，持续30分钟）|r
    .target 克鲁恩
step << Warrior/Rogue
    .goto 1411/1,-4706.71,358.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃克|r交谈
    >>|cRXP_BUY_购买一把|r |T134708:0|t[矿工锄] |cRXP_BUY_，出售者是|r |cRXP_FRIENDLY_沃克|r
    .collect 2901,1,825,1 --Mining Pick (1)
    .target 沃克
step << Warrior/Rogue
    .goto 1411/1,-4714.64,372.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜克|r交谈
    .train 2018 >> 学习 |T136241:0|t[锻造]
    .target 杜克
    .skill blacksmithing,1,1
step << Shaman
    .goto 1411/1,-4713.06,382.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤加尔|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135145:0|t[学徒短杖]的钱（4 银 79 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 尤加尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman
    .goto 1411/1,-4713.06,382.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈，购买一把|r |T135145:0|t[学徒短杖] |cRXP_BUY_备用|r
    .collect 2495,1,825,1 --Collect Walking Stick (1)
    .money <0.0479
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    .goto 1411/1,-4713.06,382.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤加尔|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135641:0|t[卷刃的剑]的钱（3 银 81 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 尤加尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto 1411/1,-4713.06,382.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈，购买一把|r |T135641:0|t[卷刃的剑] |cRXP_BUY_备用|r
    .collect 2494,1,825,1 --Collect Stiletto (1)
    .money <0.0381
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    .goto 1411/1,-4713.06,382.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤加尔|r交谈
    .vendor >> 出售杂物。如果卖掉现用武器后能凑够购买 |T132401:0|t[双刃战斧]的费用（4 银 60 铜），就卖掉它；若仍不够，稍后再回来购买。
    .target 尤加尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Orc Warrior
    .goto 1411/1,-4713.06,382.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈，购买一把|r |T132401:0|t[双刃战斧] |cRXP_BUY_备用|r
    .collect 2491,1,825,1 --Collect Large Axe (1)
    .money <0.0460
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    .goto 1411/1,-4713.06,382.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤加尔|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135421:0|t[小手斧]的钱（5 银 13 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 尤加尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Troll Warrior
    .goto 1411/1,-4713.06,382.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈，购买一把|r |T135421:0|t[小手斧] |cRXP_BUY_备用|r
    .collect 2490,1,825,1 --Collect Tomahawk (1)
    .money <0.0513
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    #optional
    #completewith Toolboxes
    +|cRXP_WARN_装备|r |T132414:0|t[增重飞斧]
    .use 3131
    .itemcount 3131,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Shaman
    #optional
    #completewith Toolboxes
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    #optional
    #completewith Toolboxes
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    #optional
    #completewith Toolboxes
    +|cRXP_WARN_装备|r |T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    #optional
    #completewith Toolboxes
    +|cRXP_WARN_装备|r |T135421:0|t[小手斧]
    .use 2490
    .itemcount 2490,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    .goto 1411/1,-4763.29,361.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳特|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135499:0|t[角木弯弓]的费用（2银83铜），就卖掉它；若仍不够，稍后再回来购买。
    .target 格劳特
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    .goto 1411/1,-4763.29,361.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_格劳特|r|cRXP_BUY_交谈，购买|r |T135499:0|t[角木弯弓] |cRXP_BUY_备用|r
    .collect 2506,1,818,1 --Collect Hornwood Recurve Bow (1)
    .money <0.0283
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    #optional
    #completewith Toolboxes
    +|cRXP_WARN_装备|r |T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    .goto 1411/1,-4763.29,361.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |r|cRXP_FRIENDLY_格劳特|r|cRXP_BUY_交谈，购买|r |T132382:0|t[劣质箭] |cRXP_BUY_备用|r
    .collect 2512,1000,825,1 << Hunter --Rough Arrow (1000)
    .target 格劳特
    .itemcount 2512,<800 << Hunter
step
    .goto 1411/1,-4686.09,340.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    .home >> 将炉石设在剃刀岭
    .bindlocation 362
    .target 旅店老板格罗斯克
step
    .goto 1411/1,-4686.09,340.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    >>|cRXP_BUY_向他购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_备用|r << Mage/Warlock/Priest/Shaman/Druid
    >>|cRXP_BUY_向他购买|r |T133974:0|t[肉排] |cRXP_BUY_备用|r << Rogue/Warrior
    >>|cRXP_WARN_留下4银币学习职业技能！|r << Rogue/Warrior/Shaman/Warlock
    >>|cRXP_WARN_留下2银币学习职业技能！|r << Priest
    .vendor >> 出售杂物
    .turnin 2161 >>交任务：苦工的重担
    .target 旅店老板格罗斯克
    .train 6760,1 << Rogue
    .train 139,1 << Priest
    .train 980,1 << Warlock
    .train 8044,1 << Shaman
    .train 284,1 << Warrior
step << !Mage !Hunter !Druid
    #optional
    .goto 1411/1,-4686.09,340.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    >>|cRXP_BUY_向他购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_备用|r << Mage/Warlock/Priest/Shaman/Druid
    >>|cRXP_BUY_向他购买|r |T133974:0|t[肉排] |cRXP_BUY_备用|r << Rogue/Warrior
    .vendor >> 出售杂物
    .turnin 2161 >>交任务：苦工的重担
    .target 旅店老板格罗斯克
    .train 6760,3 << Rogue
    .train 139,3 << Priest
    .train 980,3 << Warlock
    .train 8044,3 << Shaman
    .train 284,3 << Warrior
step
    .goto 1411/1,-4815.400,306.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图罗克|r交谈
    .turnin 96822 >>交任务：为了荣耀！
    .target 图罗克
step << Warrior
    .goto 1411/1,-4827.27,311.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 284 >> 学习职业技能
    .target 塔绍尔·锯痕
step << Shaman
    .goto 1411/1,-4839.96,307.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯瓦特|r交谈
    .train 8044 >> 学习职业技能
    .target 斯瓦特
step << Warlock
    .goto 1411/1,-4837.31,356.030
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜格鲁·血怒|r交谈
    .train 980 >> 学习职业技能
    .target 杜格鲁·血怒
step << Warlock
    .goto 1411/1,-4854.76,345.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基萨|r交谈，购买 |T133738:0|t[火焰箭（等级2）]
    .collect 16302,1,825,1 --Grimoire of Firebolt (Rank 2) (1)
    .target 基萨
    .money <0.01
    .train 7799,1
step << Hunter
    .goto 1411/1,-4704.07,275.31
    >>进入地堡
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_索塔尔|r交谈
    .train 5116 >> 学习职业技能
    .target 索塔尔
step << Rogue
    .goto 1411/1,-4710.94,268.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 6760 >> 学习职业技能
    .target 卡普拉克
step << Priest
    .goto 1411/1,-4831.5,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .turnin 5649 >> 交任务：部族的传统
    .accept 5648 >> 接任务：灵魂之衣
    .train 2052 >> 学习 |T135929:0|t[次级治疗术（等级2）]
    .target 泰金
step << Priest
    .goto 1411/1,-4770.16,170.62
    >>施放 |T135929:0|t[次级治疗术] 和 |T135987:0|t[真言术：韧]，目标为 |cRXP_FRIENDLY_步兵科雅|r
    .complete 5648,1 --Heal and fortify Grunt Kor'ja
    .target 步兵科雅
step << Priest
    .goto 1411/1,-4831.5,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .turnin 5648 >>交任务：灵魂之衣
    .trainer >> 学习职业技能
    .target 泰金
step << Rogue/Warrior
    .goto 1411/1,-4826.74,330.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉乌克|r交谈
    .train 3273 >>学习 |T135966:0|t[急救]
    .money <0.01
    .target 拉乌克
step
    .goto 1411/1,-4838.37,321.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔克|r交谈
    >>|cRXP_BUY_购买一个|r |T133634:0|t[棕色小包] |cRXP_BUY_，找|r |cRXP_BUY_他购买|r
    .collect 4496,1,825,1 --Small Brown Pouch (1)
    .target 加尔克
    .money <0.05
step
    .goto 1411/1,-4724.900,287.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥戈尼尔·魂痕|r交谈
    .xp <9,1
    .accept 99048 >>接任务：失踪的帮手
    .target 奥戈尼尔·魂痕
step
    .isOnQuest 99048
    .goto 1411/1,-5061.700,201.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t查看|cRXP_FRIENDLY_赫格兰·影眼::275657|r的遗体
    .turnin 99048 >>交任务：失踪的帮手
    .target 赫格兰·影眼::275657
step
    .isQuestTurnedIn 99048
    .goto 1411/1,-5061.700,201.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t查看|cRXP_FRIENDLY_赫格兰·影眼::275657|r的遗体
    .accept 99049 >>接任务：深处的威胁
    .target 赫格兰·影眼::275657
step
    .isOnQuest 99049
    .goto 1411/1,-5073.900,244.700
    >>拾取地面上的|cRXP_PICK_遗弃的匕首|r
    .complete 99049,1 --|1/1 Orcish Dagger
step
    .isOnQuest 99049
    .goto 1411/1,-5140.800,229.100
    >>拾取地面上的|cRXP_PICK_武器碎片|r
    .complete 99049,3 --|1/1 Broken Bone Trident
step
    .isOnQuest 99049
    .goto 1411/1,-5138.000,314.100
    >>拾取地面上的|cRXP_PICK_奇怪的碎片|r
    .complete 99049,2 --|1/1 Banner Scrap
step
    #completewith next
    >>击杀 |cRXP_ENEMY_小海浪蟹|r和|cRXP_ENEMY_海浪蟹|r，拾取它们的 |cRXP_LOOT_粘液|r
    >>击杀 |cRXP_ENEMY_厚壳龙虾人|r和|cRXP_ENEMY_巨钳龙虾人|r，拾取它们的 |cRXP_LOOT_眼球|r
    -->>This does not need to be finished now
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    #label Toolboxes
    #loop
    .goto 1411/1,-5238.63,-146.63,0
    .goto 1411/1,-5238.63,-146.63,20,0
    .goto 1411/1,-5253.97,-177.65,20,0
    .goto 1411/1,-5263.49,-301.03,20,0
    .goto 1411/1,-5245.51,-330.64,20,0
    .goto 1411/1,-5267.72,-326.41,20,0
    .goto 1411/1,-5306.31,-239.690,20,0
    .goto 1411/1,-5253.97,-177.65,20,0
    >>拾取船内及船周围的 |cRXP_PICK_侏儒工具箱|r
    .complete 825,1 --Gnomish Tools (3)
step
    #completewith MartEgg
    .goto 1411/1,-5510.41,-634.14,100 >> 游到岛上
step
    #completewith TigerFur
    >>拾取地上的 |cRXP_PICK_鞭尾龙的蛋|r
    >>|cRXP_WARN_它们通常由一只|r |cRXP_ENEMY_血爪鞭尾龙|r守着
    .complete 815,1 --Taillasher Egg (3)
    .mob 血爪鞭尾龙
step
    #completewith MinshinasSkull
    >>击杀 |cRXP_ENEMY_杜隆塔尔猛虎|r，拾取 |cRXP_LOOT_毛皮|r
    .complete 817,1 --Durotar Tiger Fur (4)
    .mob 杜隆塔尔猛虎
step
    #optional
    #completewith MainIsland
    >>击杀 |cRXP_ENEMY_小海浪蟹|r和|cRXP_ENEMY_海浪蟹|r，拾取它们的 |cRXP_LOOT_粘液|r
    >>击杀 |cRXP_ENEMY_厚壳龙虾人|r和|cRXP_ENEMY_巨钳龙虾人|r，拾取它们的 |cRXP_LOOT_眼球|r
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step --center of first small island
    #label MartEgg
    .goto 1411/1,-5599.500,-716.700
    >>击杀 |cRXP_ENEMY_血爪族母|r，拾取 |cRXP_LOOT_血爪族母的蛋|r
    .complete 97223,1 --|1/1 Bloodtalon Matriarch Eggs
    .mob 血爪族母
step
    #label MainIsland
    .goto 1411/1,-5501.95,-1167.12,150 >>游到主岛上
    .isOnQuest 826
step
    #completewith ZalazaneKill
    >>击杀|cRXP_ENEMY_妖术巨魔|r和|cRXP_ENEMY_巫毒巨魔|r，拾取|cRXP_LOOT_被诅咒的坠饰|r
    >>|cRXP_WARN_使用|r |T135952:0|t[分解]|cRXP_WARN_，目标为|r|cRXP_LOOT_被诅咒的坠饰|r|cRXP_WARN_，以获得|r |T1500915:0|t[|cRXP_LOOT_发光的残渣|r]
    .complete 826,1 --Hexed Troll (8)
    .mob +妖术巨魔
    .complete 826,2 --Voodoo Troll (8)
    .mob +巫毒巨魔
    .complete 96873,1 --Luminous Residue (x3)
    .collect 275724,3,96873,7,3 --Hexed Pendant (x3)
    .mob +妖术巨魔
    .mob +巫毒巨魔
    .isOnQuest 96873
    .skill enchanting,<1,1
step
    #completewith ZalazaneKill
    >>击杀 |cRXP_ENEMY_妖术巨魔|r和|cRXP_ENEMY_巫毒巨魔|r
    .complete 826,1 --Hexed Troll (8)
    .mob +妖术巨魔
    .complete 826,2 --Voodoo Troll (8)
    .mob +巫毒巨魔
    .isNotOnQuest 96873
step
    #completewith VooHexTrolls
    >>拾取地上的 |cRXP_PICK_洛阿神像|r
    >>|cRXP_WARN_它们主要分布在这片区域的石墙附近|r
    .complete 97225,1 --Forgotten Loa Idols (x8)
step
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_扎拉赞恩|r，拾取他的 |cRXP_LOOT_头颅|r
    >>|cRXP_WARN_留着|r |T136026:0|t[地震术] |cRXP_WARN_，等他施放|r |T136052:0|t[治疗波]时再用 << Shaman
    >>|cRXP_WARN_留着|r |T132155:0|t[凿击] |cRXP_WARN_，等他施放|r |T136052:0|t[治疗波]时再用 << Rogue
    .complete 826,3 --Zalazane's Head (1)
    .mob 扎拉赞恩
step
    #label MinshinasSkull
    .goto 1411/1,-5526.27,-1286.62
    >>拾取地上的一颗 |cRXP_LOOT_颅骨|r
    .complete 808,1 --Minshina's Skull (1)
step
    #label ZalazaneKill
    .goto 1411/1,-5526.27,-1286.62
    >>击杀 |cRXP_ENEMY_扎拉赞恩|r，拾取他的 |cRXP_LOOT_头颅|r
    >>|cRXP_WARN_留着|r |T136026:0|t[地震术] |cRXP_WARN_，等他施放|r |T136052:0|t[治疗波]时再用 << Shaman
    >>|cRXP_WARN_留着|r |T132155:0|t[凿击] |cRXP_WARN_，等他施放|r |T136052:0|t[治疗波]时再用 << Rogue
    .complete 826,3 --Zalazane's Head (1)
    .mob 扎拉赞恩
step
    #completewith VooHexTrolls
    >>击杀 |cRXP_ENEMY_杜隆塔尔猛虎|r，拾取 |cRXP_LOOT_毛皮|r
    .complete 817,1 --Durotar Tiger Fur (4)
    .mob 杜隆塔尔猛虎
step
    #loop
    .goto 1411/1,-5517.29,-1320.46,0
    .goto 1411/1,-5517.29,-1320.46,40,0
    .goto 1411/1,-5479.74,-1284.50,40,0
    .goto 1411/1,-5449.08,-1248.55,40,0
    .goto 1411/1,-5446.96,-1154.08,40,0
    .goto 1411/1,-5445.90,-1112.13,40,0
    .goto 1411/1,-5525.22,-1103.67,40,0
    .goto 1411/1,-5580.21,-1097.32,40,0
    .goto 1411/1,-5584.44,-1163.95,40,0
    .goto 1411/1,-5582.85,-1250.31,40,0
    .goto 1411/1,-5517.29,-1293.67,40,0
    >>击杀|cRXP_ENEMY_妖术巨魔|r和|cRXP_ENEMY_巫毒巨魔|r，拾取|cRXP_LOOT_被诅咒的坠饰|r
    >>|cRXP_WARN_使用|r |T135952:0|t[分解]|cRXP_WARN_，目标为|r|cRXP_LOOT_被诅咒的坠饰|r|cRXP_WARN_，以获得|r |T1500915:0|t[|cRXP_LOOT_发光的残渣|r]
    .complete 826,1 --Hexed Troll (8)
    .mob +妖术巨魔
    .complete 826,2 --Voodoo Troll (8)
    .mob +巫毒巨魔
    .complete 96873,1 --Luminous Residue (x3)
    .collect 275724,3,96873,7,3 --Hexed Pendant (x3)
    .mob +妖术巨魔
    .mob +巫毒巨魔
    .isOnQuest 96873
    .skill enchanting,<1,1
step
    #loop
    .goto 1411/1,-5517.29,-1320.46,0
    .goto 1411/1,-5517.29,-1320.46,40,0
    .goto 1411/1,-5479.74,-1284.50,40,0
    .goto 1411/1,-5449.08,-1248.55,40,0
    .goto 1411/1,-5446.96,-1154.08,40,0
    .goto 1411/1,-5445.90,-1112.13,40,0
    .goto 1411/1,-5525.22,-1103.67,40,0
    .goto 1411/1,-5580.21,-1097.32,40,0
    .goto 1411/1,-5584.44,-1163.95,40,0
    .goto 1411/1,-5582.85,-1250.31,40,0
    .goto 1411/1,-5517.29,-1293.67,40,0
    >>击杀 |cRXP_ENEMY_妖术巨魔|r和|cRXP_ENEMY_巫毒巨魔|r
    .complete 826,1 --Hexed Troll (8)
    .mob +妖术巨魔
    .complete 826,2 --Voodoo Troll (8)
    .mob +巫毒巨魔
    .isNotOnQuest 96873
step
    #label VooHexTrolls
    #loop
    .goto 1411/1,-5393.900,-1215.300,0
    .goto 1411/1,-5393.900,-1215.300,30,0
    .goto 1411/1,-5373.300,-1153.000,30,0
    .goto 1411/1,-5427.400,-1114.900,30,0
    .goto 1411/1,-5501.500,-1123.600,30,0
    .goto 1411/1,-5587.600,-1212.000,30,0
    .goto 1411/1,-5479.000,-1212.000,30,0
    >>拾取地上的 |cRXP_PICK_洛阿神像|r
    >>|cRXP_WARN_它们主要分布在这片区域的石墙附近|r
    .complete 97225,1 --Forgotten Loa Idols (x8)
step
    #completewith TaillasherEggs
    >>击杀 |cRXP_ENEMY_小海浪蟹|r和|cRXP_ENEMY_海浪蟹|r，拾取它们的 |cRXP_LOOT_粘液|r
    >>击杀 |cRXP_ENEMY_厚壳龙虾人|r和|cRXP_ENEMY_巨钳龙虾人|r，拾取它们的 |cRXP_LOOT_眼球|r
    -->>This does not need to be finished now
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    #label TigerFur
    #loop
    .goto 1411/1,-5123.90,-1132.93,0
    .goto 1411/1,-5413.65,-1288.73,50,0
    .goto 1411/1,-5384.57,-1312.35,50,0
    .goto 1411/1,-5383.51,-1184.04,50,0
    .goto 1411/1,-5382.45,-1039.870,50,0
    .goto 1411/1,-5417.88,-1015.54,50,0
    .goto 1411/1,-5445.38,-1055.02,50,0
    .goto 1411/1,-5149.80,-1013.08,50,0
    .goto 1411/1,-5166.72,-1091.33,50,0
    .goto 1411/1,-5128.65,-1135.39,50,0
    .goto 1411/1,-5111.73,-1182.98,50,0
    .goto 1411/1,-5179.41,-1321.51,50,0
    .goto 1411/1,-5209.55,-1353.24,50,0
    .goto 1411/1,-5213.25,-1412.46,50,0
    .goto 1411/1,-5154.56,-1412.11,50,0
    .goto 1411/1,-5084.24,-1382.14,50,0
    .goto 1411/1,-5123.90,-1132.93,50,0
    >>击杀 |cRXP_ENEMY_杜隆塔尔猛虎|r，拾取 |cRXP_LOOT_毛皮|r
    .complete 817,1 --Durotar Tiger Fur (4)
    .mob 杜隆塔尔猛虎
step
    #label TaillasherEggs
    #loop
    .goto 1411/1,-5413.65,-1288.73,50,0
    .goto 1411/1,-5384.57,-1312.35,50,0
    .goto 1411/1,-5383.51,-1184.04,50,0
    .goto 1411/1,-5382.45,-1039.870,50,0
    .goto 1411/1,-5417.88,-1015.54,50,0
    .goto 1411/1,-5445.38,-1055.02,50,0
    .goto 1411/1,-5149.80,-1013.08,50,0
    .goto 1411/1,-5166.72,-1091.33,50,0
    .goto 1411/1,-5128.65,-1135.39,50,0
    .goto 1411/1,-5111.73,-1182.98,50,0
    .goto 1411/1,-5179.41,-1321.51,50,0
    .goto 1411/1,-5209.55,-1353.24,50,0
    .goto 1411/1,-5213.25,-1412.46,50,0
    .goto 1411/1,-5154.56,-1412.11,50,0
    .goto 1411/1,-5084.24,-1382.14,50,0
    .goto 1411/1,-5123.90,-1132.93,50,0
    >>拾取地上的 |cRXP_PICK_鞭尾龙的蛋|r
    >>|cRXP_WARN_它们通常由一只|r |cRXP_ENEMY_血爪鞭尾龙|r守着
    .complete 815,1 --Taillasher Egg (3)
    .mob 血爪鞭尾龙
step
    #loop
    .goto 1411/1,-5115.96,-794.53,0
    .goto 1411/1,-5115.96,-794.53,60,0
    .goto 1411/1,-5035.07,-916.490,60,0
    .goto 1411/1,-4990.65,-989.81,60,0
    .goto 1411/1,-4905.52,-1028.23,60,0
    .goto 1411/1,-4807.17,-1122.35,60,0
    >>击杀 |cRXP_ENEMY_小海浪蟹|r和|cRXP_ENEMY_海浪蟹|r，拾取它们的 |cRXP_LOOT_粘液|r
    >>击杀 |cRXP_ENEMY_厚壳龙虾人|r和|cRXP_ENEMY_巨钳龙虾人|r，拾取它们的 |cRXP_LOOT_眼球|r
    -->>This does not need to be finished now
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    #softcore
    #completewith next
    .goto 1411/1,-5002.81,-774.08,50,0
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r处复活，或直接跑回去
step
    #hardcore
    #completewith Zalazaneturnin
    .subzone 367 >>前往森金村
step
    .goto 1411/1,-4948.88,-768.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    >>|cRXP_WARN_跳进小屋|r
    .vendor >> 出售杂物并修理装备
    .target 特莱耶克
    .isOnQuest 808
step
    .goto 1411/1,-4960.100,-791.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕祖拉|r交谈
    .turnin 96873 >>交任务：脖子上的麻烦
    .target 帕祖拉
    .isQuestComplete 96873
    .skill enchanting,<1,1
step << Mage
    .goto 1411/1,-4939.36,-838.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安苏瓦|r交谈
    .train 118 >> 学习职业技能
    .target 安苏瓦
step
    #label Zalazaneturnin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加德林大师|r、|cRXP_FRIENDLY_沃纳尔大师|r和|cRXP_FRIENDLY_维尔林·长牙|r交谈
    .turnin 808 >>交任务：明希纳的颅骨
    .turnin 826,2 >>交任务：扎拉赞恩 << Shaman
    .turnin 826 >>交任务：扎拉赞恩 << !Shaman
    .turnin 97225 >>交任务：被遗忘的洛阿神像
    .target +加德林大师
    .goto 1411/1,-4920.86,-825.90
    .turnin 818 >>交任务：沃纳尔大师
    .target +沃纳尔大师
    .goto 1411/1,-4920.86,-813.91
    .turnin 817 >>交任务：生活所需的虎皮
    .target +维尔林·长牙
    .goto 1411/1,-4920.86,-797.70
step
    .goto 1411/1,-4885.400,-852.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克萨尔迪|r交谈
    .turnin 97223 >>交任务：血爪族母
    .target 克萨尔迪
step
    #completewith QuilboarsScouts
    +|cRXP_WARN_将|r |T133728:0|t[微光颅骨] |cRXP_WARN_和|r |T134712:0|t[强力胶水]|cRXP_WARN_绑定快捷键，留作紧急情况使用|r
step
    .goto 1411/1,-4715.100,-599.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌克尔|r交谈
    .turnin 96876 >>交任务：乌克尔遗失的背包
    .target 乌克尔
    .isOnQuest 96876
step --at low lvl razormanes
    #completewith QuilboarsScouts
    >>拾取地上的 |cRXP_PICK_仙人掌果|r
    .complete 96825,1 --|8/8 Prickly Pear Fruit
step
    #label QuilboarsScouts
    #loop
    .goto 1411/1,-4565.01,82.49,0
    .goto 1411/1,-4617.35,18.34,30,0
    .goto 1411/1,-4615.77,72.98,30,0
    .goto 1411/1,-4578.75,76.15,30,0
    .goto 1411/1,-4570.29,109.99,30,0
    .goto 1411/1,-4543.33,81.08,30,0
    .goto 1411/1,-4526.41,70.86,30,0
    .goto 1411/1,-4478.29,59.23,30,0
    .goto 1411/1,-4450.80,62.40,30,0
    .goto 1411/1,-4442.34,112.46,30,0
    .goto 1411/1,-4565.01,82.49,30,0
    >>击杀 |cRXP_ENEMY_钢鬃野猪人|r和|cRXP_ENEMY_钢鬃斥候|r
    .complete 837,1 --Razormane Quilboar (4)
    .mob +钢鬃野猪人
    .complete 837,2 --Razormane Scout (4)
    .mob +钢鬃斥候
step --at low lvl razormanes
    #loop
    .goto 1411/1,-4543.300,82.500,0
    .goto 1411/1,-4543.300,82.500,40,0
    .goto 1411/1,-4459.000,66.300,40,0
    >>拾取地上的 |cRXP_PICK_仙人掌果|r
    .complete 96825,1 --|8/8 Prickly Pear Fruit
step << Hunter
    #loop
    .goto 1411/1,-4312.79,407.50,0
    .goto 1411/1,-4312.79,407.50,50,0
    .goto 1411/1,-4314.91,487.52,50,0
    .goto 1411/1,-4251.99,492.8,50,0
    .goto 1411/1,-4167.39,500.91,50,0
    .goto 1411/1,-4164.21,459.32,50,0
    .goto 1411/1,-4180.08,382.12,50,0
    .goto 1411/1,-4251.99,384.23,50,0
    >>击杀 |cRXP_ENEMY_钢鬃传令兵|r和|cRXP_ENEMY_钢鬃卫兵|r
    .complete 837,3 --Razormane Dustrunner (4)
    .mob +钢鬃传令兵
    .complete 837,4 --Razormane Battleguard (4)
    .mob +钢鬃卫兵
step << Hunter
    #optional
    #loop
	.goto 1411/1,-4475.12,92.72,0
	.goto 1411/1,-4475.12,92.72,50,0
	.goto 1411/1,-4401.09,205.52,50,0
	.goto 1411/1,-4270.49,260.51,50,0
	.goto 1411/1,-4166.33,233.01,50,0
	.goto 1411/1,-4130.37,182.25,50,0
	.goto 1411/1,-4208.1,98.71,50,0
	.goto 1411/1,-4300.1,57.11,50,0
	.goto 1411/1,-4456.61,65.57,50,0
    .xp 9+4960 >> 刷怪至4960+/6500经验值
step
    .goto 1411/1,-4709.36,274.960
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈对象： |cRXP_FRIENDLY_加索克|r
    .turnin 825 >>交任务：海底沉船
    .turnin 837 >>交任务：野猪人的进犯 << Hunter
    .target 加索克
step
    .isOnQuest 99049
    .goto 1411/1,-4725.000,287.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥戈尼尔·魂痕|r交谈
    .turnin 99049 >>交任务：深处的威胁
    --.accept 99051 >>Accept Threat from Below
    .target 奥戈尼尔·魂痕
step
    .goto 1411/1,-4665.47,311.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈对象： |cRXP_FRIENDLY_厨师托尔卡|r
    .turnin 815 >>交任务：恐龙蛋大餐
    .turnin 96825 >>交任务：这果子会咬人
    .target 厨师托尔卡
step << Hunter
    .goto 1411/1,-4704.07,275.31
    >>进入地堡
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_索塔尔|r交谈
    .accept 6062 >>接任务：驯服野兽
    .trainer >> 学习职业技能
    .target 索塔尔
step << Hunter
    .goto 1411/1,-4763.29,361.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |r|cRXP_FRIENDLY_格劳特|r|cRXP_BUY_交谈，购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_和|r |T134410:0|t[中型箭袋] |cRXP_BUY_备用|r
    .collect 2515,1200,6082,1 --Sharp Arrow (1200)
    --.collect 11362,1,6082,1 --Medium Quiver (1)
    .target 格劳特
    --.money <0.1300
step << Hunter
    .goto 1411/1,-4763.29,361.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |r|cRXP_FRIENDLY_格劳特|r|cRXP_BUY_交谈，购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_备用|r
    .collect 2515,1200,6082,1 --Sharp Arrow (1200)
    .target 格劳特
    .itemcount 2515,<600 --Sharp Arrow (600)
step << Hunter
    #loop
    .goto 1411/1,-4693.49,-183.64,0
    .goto 1411/1,-4699.31,101.88,40,0
    .goto 1411/1,-4696.14,37.73,40,0
    .goto 1411/1,-4693.49,-1.4,40,0
    .goto 1411/1,-4701.42,-66.26,40,0
    .goto 1411/1,-4649.61,-82.83,40,0
    .use 15917 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_，对|r |cRXP_ENEMY_可怕的杂斑野猪|r |cRXP_WARN_在最大距离施放|r
    .complete 6062,1 --Tame a Dire Mottled Boar
    .mob 可怕的杂斑野猪
    .isOnQuest 6062
step << Hunter
    .goto 1411/1,-4704.07,275.31
    >>进入地堡
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_索塔尔|r交谈
    .turnin 6062 >>交任务：驯服野兽
    .accept 6083 >>接任务：驯服野兽
    .target 索塔尔
    .isQuestComplete 6062
step << Hunter
    .goto 1411/1,-4704.07,275.31
    >>进入地堡
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_索塔尔|r交谈
    .accept 6083 >>接任务：驯服野兽
    .target 索塔尔
    .isQuestTurnedIn 6062
step << Hunter
    #completewith next
    +|cRXP_WARN_右键点击 |r|cRXP_ENEMY_可怕的杂斑野猪|r|cRXP_WARN_的头像并选择解散，否则无法驯服|r |cRXP_ENEMY_海浪蟹|r
step << Hunter
    #loop
    .goto 1411/1,-5115.44,984.19,0
    .goto 1411/1,-5091.64,809.0,40,0
    .goto 1411/1,-5129.18,877.03,40,0
    .goto 1411/1,-5137.11,934.49,40,0
    >>|cRXP_WARN_不要击杀看到的|r |cRXP_ENEMY_硬甲蝎|r |cRXP_WARN_，之后会用到|r
    .use 15919 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_，对|r |cRXP_ENEMY_海浪蟹|r |cRXP_WARN_在最大距离施放|r
    .complete 6083,1 --Tame a Surf Crawler
    .mob 海浪蟹
    .isQuestTurnedIn 6062
step << Hunter
    .goto 1411/1,-4704.07,275.31
    >>进入地堡
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_索塔尔|r交谈
    .turnin 6083 >>交任务：驯服野兽
    .accept 6082 >>接任务：驯服野兽
    .target 索塔尔
    .isQuestTurnedIn 6062
step << Hunter
    #completewith next
    +|cRXP_WARN_右键点击 |r|cRXP_ENEMY_海浪蟹|r|cRXP_WARN_的头像并选择解散，否则无法驯服|r |cRXP_ENEMY_硬甲蝎|r
step << Hunter
    #loop
    .goto 1411/1,-4862.16,506.2,0
    .goto 1411/1,-4862.16,506.2,40,0
    .goto 1411/1,-4818.28,616.53,40,0
    .goto 1411/1,-4829.38,733.21,40,0
    .goto 1411/1,-4908.17,727.57,40,0
    .goto 1411/1,-4933.55,776.21,40,0
    .goto 1411/1,-4973.73,846.71,40,0
    .goto 1411/1,-4984.31,906.29,40,0
    .use 15920 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒] |cRXP_WARN_，对|r |cRXP_ENEMY_硬甲蝎|r |cRXP_WARN_在最大距离施放|r
    .complete 6082,1 --Tame an Armored Scorpid
    .mob 硬甲蝎
    .isQuestTurnedIn 6062
step << Hunter
    .goto 1411/1,-4704.07,275.31
    >>进入地堡
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_索塔尔|r交谈
    .turnin 6082 >>交任务：驯服野兽
    .accept 6081 >>接任务：训练野兽
    .target 索塔尔
    .isQuestTurnedIn 6062
step << Hunter
    #completewith Rezlak1
    +|cRXP_WARN_将|r |T132164:0|t[驯服野兽]|cRXP_WARN_、|r |T136095:0|t[解散野兽]|cRXP_WARN_和|r |T132161:0|t[召唤宠物] |cRXP_WARN_放到动作条上|r
step << Hunter
    .goto 1411/1,-4666.0,305.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞姆塔克|r交谈
    >>|cRXP_BUY_向他购买|r |T133972:0|t[硬肉干] |cRXP_BUY_备用|r。|cRXP_BUY_稍后用来喂养宠物|r
    .vendor >> 出售杂物
    .collect 117,5,828,1 --Tough Jerky (5)
    .target 格瑞姆塔克
    .isQuestTurnedIn 6062
    .isQuestAvailable 834 --Winds in the Desert
step << Hunter
    #optional
    .goto 1411/1,-4648.55,271.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林·寻路者|r交谈
    .accept 840 >>接任务：部落的新兵
    .target 塔克林·寻路者
    .xp <10,1
step << Hunter/Shaman
    .goto 1411/1,-4241.94,742.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莎·托克伦|r交谈
    .accept 816 >>接任务：丢失的孩子
    .target 米莎·托克伦
step << Warrior
    .goto 1411/1,-4827.27,311.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 6546 >> 学习职业技能
    --.accept 1505 >>Accept Veteran Uzzek
    .target 塔绍尔·锯痕
    .xp <10,1
step << Shaman
    .goto 1411/1,-4839.96,307.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯瓦特|r交谈
    .train 8050 >> 学习职业技能
    .accept 2983 >>接任务：火焰的召唤
    .target 斯瓦特
    .isNotOnQuest 1522
    .xp <10,1
step << Shaman
    .goto 1411/1,-4839.96,307.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯瓦特|r交谈
    .train 8050 >> 学习职业技能
    .target 斯瓦特
    .xp <10,1
step << Warlock
    .goto 1411/1,-4837.31,356.030
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜格鲁·血怒|r交谈
    .train 1120 >> 学习职业技能
    .target 杜格鲁·血怒
    .xp <10,1
step << Warlock
    .goto 1411/1,-4854.76,345.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基萨|r交谈，购买 |T133738:0|t[火焰箭（等级2）]
    .collect 16302,1,837,1 --Grimoire of Firebolt (Rank 2) (1)
    .target 基萨
    .money <0.01
    .train 7799,1
    .xp <10,1
step << Priest
    .goto 1411/1,-4831.5,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .accept 5654 >> 接任务：虚弱妖术 << Troll
    .accept 5660 >> 接任务：虚弱之触 << Undead
    .trainer >> 学习职业技能
    .target 泰金
    .xp <10,1
step << Rogue
    .goto 1411/1,-4710.94,268.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 674 >> 学习职业技能
    .target 卡普拉克
    .xp <10,1
step << !Hunter
    #loop
    .goto 1411/1,-4312.79,407.50,0
    .goto 1411/1,-4312.79,407.50,50,0
    .goto 1411/1,-4314.91,487.52,50,0
    .goto 1411/1,-4251.99,492.8,50,0
    .goto 1411/1,-4167.39,500.91,50,0
    .goto 1411/1,-4164.21,459.32,50,0
    .goto 1411/1,-4180.08,382.12,50,0
    .goto 1411/1,-4251.99,384.23,50,0
    >>击杀 |cRXP_ENEMY_钢鬃传令兵|r和|cRXP_ENEMY_钢鬃卫兵|r
    .complete 837,3 --Razormane Dustrunner (4)
    .mob +钢鬃传令兵
    .complete 837,4 --Razormane Battleguard (4)
    .mob +钢鬃卫兵
step
    #completewith next
    .goto 1411/1,-4414.31,999.70,50 >> 前往雷兹拉克
step
    #label Rezlak1
    .goto 1411/1,-4414.31,999.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .accept 834 >>接任务：沙漠之风
    .target 雷兹拉克
step
    #loop
    .goto 1411/1,-4590.39,1036.36,0
    .goto 1411/1,-4590.39,1036.36,40,0
    .goto 1411/1,-4590.39,950.7,40,0
    .goto 1411/1,-4613.12,902.410,40,0
    .goto 1411/1,-4651.19,893.24,40,0
    .goto 1411/1,-4693.49,832.97,40,0
    .goto 1411/1,-4598.32,854.12,40,0
    .goto 1411/1,-4642.20,696.20,40,0
    .goto 1411/1,-4505.79,597.14,40,0
    .goto 1411/1,-4466.13,630.980,40,0
    .goto 1411/1,-4526.41,679.98,40,0
    .goto 1411/1,-4457.67,720.17,40,0
    >>拾取地面上的|cRXP_PICK_被盗的补给袋|r
    .complete 834,1 --Sack of Supplies (5)
step
    .goto 1411/1,-4414.31,999.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 834 >>交任务：沙漠之风
    .accept 835 >>接任务：保卫商路
    .target 雷兹拉克
step
    #completewith next
    .goto 1411/1,-4327.07,932.02,40,0
    .goto 1411/1,-4198.05,911.22,30,0
    .goto 1411/1,-4165.27,903.11,20 >>跳进雷霆山 << !Hunter !Warlock
    .goto 1411/1,-4165.27,903.11,20 >>|cRXP_WARN_右键点击|r |T136218:0|t[小鬼] |cRXP_WARN_头像并选择解散|r << Warlock
    .cast 2641 >>|cRXP_WARN_施放|r |T136095:0|t[解散野兽] |cRXP_WARN_，然后跳进雷霆山|r << Hunter
step
    #softcore
    .goto 1411/1,-4190.12,868.22
    >>击杀 |cRXP_ENEMY_费索·暗雷|r，拾取他的 |cRXP_LOOT_爪子|r
    >>|cRXP_WARN_小心。在引他之前，先击杀巡逻的|r |cRXP_ENEMY_火刃狂热者|r |cRXP_WARN_以及后面的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_，清出安全区域|r
    >>|cRXP_WARN_将他向后引到刚才击杀|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_的位置，否则可能靠近而引到更多火刃怪物|r
    >>|cRXP_WARN_为了拿到 |r|cRXP_LOOT_爪子|r|cRXP_WARN_可以冒险死亡，之后本就要在 |r|cRXP_FRIENDLY_灵魂医者|r|cRXP_WARN_处复活|r
    >>|cRXP_WARN_先击杀小鬼，使用|r |T132155:0|t[凿击] |cRXP_WARN_打断他施放的|r |T136169:0|t[灵魂虹吸] << Rogue
    >>|cRXP_WARN_先击杀小鬼，留着|r |T136026:0|t[地震术] |cRXP_WARN_等他施放|r |T136169:0|t[灵魂虹吸]时再用 << Shaman
    >>|cRXP_WARN_可以施放|r |T136071:0|t[变形术] |cRXP_WARN_控制|r |cRXP_ENEMY_费索|r |cRXP_WARN_，然后先击杀|r |cRXP_ENEMY_小鬼|r |cRXP_WARN_再处理他|r << Mage
    >>|cRXP_WARN_先击杀小鬼|r << Warrior/Warlock/Priest
    >>|cRXP_WARN_如果有，就使用|r |T134829:0|t[初级治疗药水] |cRXP_WARN_，必要时再用|r |T133728:0|t[微光颅骨] |cRXP_WARN_应急|r << !Warlock
    >>|cRXP_WARN_如果有，就使用|r |T134829:0|t[初级治疗药水]、|T133728:0|t[初级治疗石] |cRXP_WARN_，必要时再用|r |T133728:0|t[微光颅骨] |cRXP_WARN_应急|r << Warlock
    .complete 806,1 --Fizzle's Claw (1)
    .mob 费索·暗雷
    .mob 小鬼爪牙
    .mob 火刃狂热者
    .mob 闪电蜥蜴
step
    #hardcore
    .goto 1411/1,-4190.12,868.22
    >>击杀 |cRXP_ENEMY_费索·暗雷|r，拾取他的 |cRXP_LOOT_爪子|r
    >>|cRXP_WARN_小心。在引他之前，先击杀巡逻的|r |cRXP_ENEMY_火刃狂热者|r |cRXP_WARN_以及后面的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_，清出安全区域|r
    >>|cRXP_WARN_将他向后引到刚才击杀|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_的位置，否则可能靠近而引到更多火刃怪物|r
    >>|cRXP_WARN_先击杀小鬼，使用|r |T132155:0|t[凿击] |cRXP_WARN_打断他施放的|r |T136169:0|t[灵魂虹吸] << Rogue
    >>|cRXP_WARN_先击杀小鬼，留着|r |T136026:0|t[地震术] |cRXP_WARN_等他施放|r |T136169:0|t[灵魂虹吸]时再用 << Shaman
    >>|cRXP_WARN_可以施放|r |T136071:0|t[变形术] |cRXP_WARN_控制|r |cRXP_ENEMY_费索|r |cRXP_WARN_，然后先击杀|r |cRXP_ENEMY_小鬼|r |cRXP_WARN_再处理他|r << Mage
    >>|cRXP_WARN_先击杀小鬼|r << Warrior/Warlock/Priest
    >>|cRXP_WARN_如果有，就使用|r |T134829:0|t[初级治疗药水] |cRXP_WARN_，必要时再用|r |T133728:0|t[微光颅骨] |cRXP_WARN_应急|r << !Warlock
    >>|cRXP_WARN_如果有，就使用|r |T134829:0|t[初级治疗药水]、|T133728:0|t[初级治疗石] |cRXP_WARN_，必要时再用|r |T133728:0|t[微光颅骨] |cRXP_WARN_应急|r << Warlock
    .complete 806,1 --Fizzle's Claw (1)
    .mob 费索·暗雷
    .mob 小鬼爪牙
    .mob 火刃狂热者
    .mob 闪电蜥蜴
step << Hunter/Shaman
    #softcore
    .goto 1411/1,-4449.74,1188.64
    .deathskip >> 死亡后，在 |cRXP_FRIENDLY_灵魂医者|r处复活
    .isQuestComplete 806
    .xp >10,1
step << Hunter/Shaman
    #softcore
    .goto 1411/1,-4035.2,679.63,60 >> 一路战斗，离开雷霆山
    .isQuestComplete 806
    .xp <10,1
step << Hunter/Shaman
    #hardcore
    .goto 1411/1,-4035.2,679.63,60 >> 一路战斗，离开雷霆山
    .isQuestComplete 806
step << Hunter/Shaman
    .goto 1411/1,-4158.93,1153.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林纳格|r交谈
    >>|cRXP_WARN_任务会开始45分钟倒计时，接下来的5分钟不要离开游戏或登出|r
    .accept 812 >>接任务：救命如救火
    .target 林纳格
step << Shaman
    #optional
    #loop
    .goto 1411/1,-4265.73,1276.76,0--c:Durotar,43.56,15.08
    .goto 1411/1,-4297.46,1131.89,60,0--c:Durotar,44.16,19.19
    .goto 1411/1,-4295.87,1208.38,60,0--c:Durotar,44.13,17.02
    .goto 1411/1,-4265.73,1276.76,60,0--c:Durotar,43.56,15.08
    .xp 9+2520 >>刷怪，直到 9 级经验达到 2520+/6500
step << Shaman
    #optional
    #loop
    .goto 1411/1,-4265.73,1276.76,0--c:Durotar,43.56,15.08
    .goto 1411/1,-4297.46,1131.89,60,0--c:Durotar,44.16,19.19
    .goto 1411/1,-4295.87,1208.38,60,0--c:Durotar,44.13,17.02
    .goto 1411/1,-4265.73,1276.76,60,0--c:Durotar,43.56,15.08
    +继续刷怪，直到炉石冷却时间<5分钟
    .cooldown item,6948,<5m
step << Hunter/Shaman
    #label EnterOrg
    #completewith next
    .goto 1454/1,-4367.46,1405.44,50,0
    .zone Orgrimmar >> 进入奥格瑞玛
step << Hunter/Shaman
    .goto 1454/1,-4460.600,1584.300,10,0
    .goto 1454/1,-4460.000,1598.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨托格|r交谈
    >>|cRXP_WARN_他在建筑的楼上|r
    .accept 97246 >>接任务：午餐诱惑
    .target 萨托格
step << Hunter/Shaman
    .goto 1454/1,-4482.600,1775.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博斯坦|r交谈
    .turnin 97246 >>交任务：午餐诱惑
    .accept 97249 >>接任务：最爱的食物
    .target 博斯坦
step << Hunter/Shaman
    .goto 1454/1,-4568.100,1855.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡玛瑞|r交谈
    .turnin 96877 >>交任务：哈利科尔的蹄子
    .target 卡玛瑞
    .isOnQuest 96877
step << Hunter/Shaman
    .goto 1454/1,-4466.800,1954.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考吉尔德|r交谈
    .accept 97242 >>接任务：耶尔玛克的混合配方
    .target 考吉尔德
step << Hunter/Shaman
    #completewith next
    .goto 1454/1,-4560.000,1908.500,15,0
    .goto 1454/1,-4587.000,1918.300,15,0
    .goto 1454/1,-4608.000,1897.400,15,0
    .goto 1454/1,-4632.300,1911.600,15 >>前往荣誉谷
step << Hunter/Shaman
    #loop
    .goto 1454/1,-4653.900,1950.300,0
    .goto 1454/1,-4653.900,1950.300,20,0
    .goto 1454/1,-4677.700,1971.600,20,0
    .goto 1454/1,-4667.400,1997.000,20,0
    .goto 1454/1,-4609.800,2013.500,20,0
    .goto 1454/1,-4630.600,1968.100,20,0
    >>拾取水中的 |cRXP_PICK_一把香蒲|r和|cRXP_PICK_矛草插条|r
    .complete 97242,1 --|2/2 Handful of Cattails
    .complete 97242,2 --|4/4 Speargrass Cuttings
step << Hunter
    .goto 1454/1,-4607.02,2100.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .turnin 6081 >>交任务：训练野兽
    .target 奥玛克
step << Hunter
    .goto 1454/1,-4611.09,2135.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖祖|r交谈
    .trainer 10088 >>学习宠物技能
    .target 肖祖
step << Hunter
    #completewith FindAntidote
    +|cRXP_WARN_将|r |T132162:0|t[训练野兽]|cRXP_WARN_（常规标签下）、|r |T132163:0|t[复活宠物]|cRXP_WARN_和|r |T132165:0|t[喂养宠物] |cRXP_WARN_放到动作条上|r
    >>|cRXP_WARN_宠物获得训练点数后，记得使用|r |T132162:0|t[训练野兽]进行训练
step << Hunter
    .goto 1454/1,-4819.1,2099.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_森度吉安|r|cRXP_BUY_交谈，购买|r |T135499:0|t[多层弯弓] |cRXP_BUY_备用|r
    .collect 2507,1,835,1 --Collect Laminated Recurve Bow (1)
    .money <0.1751
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .target 森度吉安
step << Hunter
    #optional
    #completewith FindAntidote
    +|cRXP_WARN_装备|r |T135499:0|t[多层弯弓] |cRXP_WARN_，需要达到11级|r
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .xp <11,1
step << Hunter
    #optional
    #completewith FindAntidote
    +|cRXP_WARN_装备|r |T135499:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .xp >11,1
step << Hunter/Shaman
    .goto 1454/1,-4466.900,1954.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考吉尔德|r交谈
    .turnin 97242 >>交任务：耶尔玛克的混合配方
    .target 考吉尔德
step << Hunter/Shaman
    .goto 1454/1,-4477.900,1964.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶尔玛克|r交谈
    >>|cRXP_WARN_可能需要等待约 10 秒才能接取此任务|r
    .accept 97275 >>接任务：伍特急什么
    .target 耶尔玛克
step << Hunter/Shaman
    .goto 1454/1,-4463.000,1966.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伍特|r交谈
    .turnin 97275 >>交任务：伍特急什么
    .target 伍特
step << Hunter/Shaman
    .goto 1454/1,-4193.400,2001.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米吉|r交谈
    .turnin 97249 >>交任务：最爱的食物
    .target 米吉
step << Hunter/Shaman
    .goto 1454/1,-4205.800,2007.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯拉|r交谈
    .accept 97326 >>接任务：以石为座
    .target 斯拉
step << Hunter/Shaman
    .goto 1454/1,-4293.600,1949.900
    >>拾取地上的橙色|cRXP_PICK_石块|r
    >>|cRXP_WARN_如果争抢的人很多，请跳过此任务！|r|cRXP_PICK_石块|r|cRXP_WARN_数量不多，刷新也不快|r
    .complete 97326,1 --|8/8 Smooth Boulder
    .isOnQuest 97326
step << Hunter/Shaman
    .goto 1454/1,-4205.900,2007.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯拉|r交谈
    .turnin 97326 >>交任务：以石为座
    .target 斯拉
    .isQuestComplete 97326
step << Hunter/Shaman
    .goto 1454/1,-4133.36,1939.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹格雷尔|r交谈
    .turnin 831 >>交任务：将军的命令
    .target 纳兹格雷尔
step << Hunter/Shaman
    .goto 1454/1,-4125.79,1920.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .accept 5726 >>接任务：隐藏的敌人
    .target 萨尔
step << Hunter/Shaman
    #label FindAntidote
    .goto 1454/1,-4343.19,1772.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暗影裂口的 |cRXP_FRIENDLY_考格汉|r交谈
    .accept 813 >>接任务：寻找解毒剂
    .target 考格汉
    .isOnQuest 812
step << Hunter/Shaman
    #completewith RazorTurnins2
    #label NeedACure
    >>|cRXP_WARN_放弃“救命如救火”。这样可移除任务计时，但仍能继续完成任务链|r
    .abandon 812 >>放弃任务：救命如救火
    .isOnQuest 812
step << Priest
    #optional
    #loop
    .goto 1411/1,-4162.63,943.30,40,0--c:Durotar,41.61,24.54
    .goto 1411/1,-4073.80,953.87,40,0--c:Durotar,39.93,24.24
    .goto 1411/1,-4026.21,866.10,40,0--c:Durotar,39.03,26.73
    .goto 1411/1,-4035.20,687.38--c:Durotar,39.20,31.80
    .xp 9+3150 >>刷怪，直到 9 级经验达到 3150+/6500
step
    #completewith RazorTurnins2
    .hs >> 炉石返回剃刀岭
    .isQuestComplete 806
    .use 6948
    .subzoneskip 362
    .bindlocation 362,1
    .cooldown item,6948,>0,1
step
    #completewith RazorTurnins2
    .subzone 362 >>前往剃刀岭
    .isQuestComplete 806
    .cooldown item,6948,<0
step
    #requires NeedACure << Hunter/Shaman
    .goto 1411/1,-4686.09,340.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    .vendor >> 出售杂物
    >>|cRXP_BUY_向他购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_备用|r << Mage/Warlock/Priest/Shaman
    >>|cRXP_BUY_向他购买|r |T133974:0|t[肉排] |cRXP_BUY_备用|r << Rogue/Warrior
    .collect 1179,15,828,1 << Mage/Warlock/Priest/Shaman --Ice Cold Milk (15)
    .collect 2287,15,828,1 << Rogue/Warrior --Haunch of Meat (15)
    .target 旅店老板格罗斯克
    .money <0.0375
step
#label RazorTurnins2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥戈尼尔·魂痕|r和|cRXP_FRIENDLY_加索克|r交谈
    .turnin 806 >>交任务：黑暗风暴
    .accept 828 >>接任务：玛高兹
    .target +奥戈尼尔·魂痕
    .goto 1411/1,-4724.69,287.30
    .turnin 837 >>交任务：野猪人的进犯
    .target +加索克
    .goto 1411/1,-4709.36,274.960
step << Warrior
    .goto 1411/1,-4827.27,311.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 6546 >> 学习职业技能
    --.accept 1505 >>Accept Veteran Uzzek
    .target 塔绍尔·锯痕
step << Shaman
    .goto 1411/1,-4839.96,307.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯瓦特|r交谈
    .train 8050 >> 学习职业技能
    .accept 2983 >>接任务：火焰的召唤
    .target 斯瓦特
    .isNotOnQuest 1522
step << Shaman
    .goto 1411/1,-4839.96,307.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯瓦特|r交谈
    .train 8050 >> 学习职业技能
    .target 斯瓦特
step << Warlock
    .goto 1411/1,-4837.31,356.030
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜格鲁·血怒|r交谈
    .train 1120 >> 学习职业技能
    .target 杜格鲁·血怒
step << Warlock
    .goto 1411/1,-4854.76,345.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基萨|r交谈，购买 |T133738:0|t[火焰箭（等级2）]
    .collect 16302,1,837,1 --Grimoire of Firebolt (Rank 2) (1)
    .target 基萨
    .money <0.01
    .train 7799,1
step << Priest
    .goto 1411/1,-4831.5,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .accept 5654 >> 接任务：虚弱妖术 << Troll
    .accept 5660 >> 接任务：虚弱之触 << Undead
    .trainer >> 学习职业技能
    .target 泰金
step << Hunter
    .goto 1411/1,-4704.07,275.31
    >>进入地堡
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_索塔尔|r交谈
    .train 13549 >> 学习职业技能
    .target 索塔尔
step << Rogue
    .goto 1411/1,-4710.94,268.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 674 >> 学习职业技能
    .target 卡普拉克
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（部落）
#subgroupdisplayname 1-22
#forever
#disabledungeons
<< Horde
#name 10-12 Durotar
#version 11
#group RestedXP Forever Guide (H)
#subgroup Speedrun Guide 1-22
--#groupid RXP-SRGCE-H1
#defaultfor Troll/Orc
#next 10-12 Tirisfal (Orc/Troll) << !Hunter !Shaman !Tauren !Skyborne
#next 12-17 The Barrens << Orc Hunter/Troll Hunter/Orc Shaman/Troll Shaman
#displayname 10-12 杜隆塔尔

step << Shaman/Hunter
    .goto 1411/1,-4648.55,271.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林|r交谈
    .accept 840 >>接任务：部落的新兵
    .target 塔克林·寻路者

step << Shaman
    #label FarWatchPost
    .goto 1413/1,-3686.10,303.14,40 >> 前往前沿哨所
    .zoneskip The Barrens
    .isOnQuest 840,2983,1522,2984,1523

step << Shaman
    .goto 1413/1,-3687.11,303.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加尔|r交谈
    .turnin 840 >>交任务：部落的新兵
    .accept 842 >>接任务：十字路口征兵
    .target 卡加尔·战痕

step << Shaman
    .goto 1413/1,-3037.56,264.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳尔|r交谈
    .turnin 2983 >>交任务：火焰的召唤
    .accept 1524 >>接任务：火焰的召唤
    .target 卡纳尔·菲斯

step << Shaman
    #completewith next
    >>沿途击杀|cRXP_ENEMY_巨齿鳄鱼|r，拾取|cRXP_LOOT_克鲁恩的护身符|r
    .complete 816,1 --Kron's Amulet (1)
    .mob 巨齿鳄鱼

step << Shaman
    #completewith next
    .goto 1411/1,-3905.13,-228.41,10,0
    .goto 1411/1,-3899.31,-241.45,8,0
    .goto 1411/1,-3899.31,-241.45,8,0
    .goto 1411/1,-3906.71,-270.71,8,0
    .goto 1411/1,-3910.94,-247.45,8,0
    .goto 1411/1,-3931.56,-240.75,8,0
    .goto 1411/1,-3964.35,-242.51,8,0
    .goto 1411/1,-3974.39,-228.76,8,0
    .goto 1411/1,-4020.92,-219.95,8,0
    .goto 1411/1,-4034.67,-232.64,8,0
    .goto 1411/1,-4033.08,-255.91,10 >> 沿山路上行，前往|cRXP_FRIENDLY_泰尔夫|r处
    >>|cRXP_WARN_山路非常狭窄，小心不要坠崖，摔下去可能会死亡|r

step << Shaman
    #label CallofFire3
    .goto 1411/1,-3999.24,-268.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰尔夫|r交谈
    .turnin 1524 >>交任务：火焰的召唤
    .accept 1525 >>接任务：火焰的召唤
    .target 泰尔夫·祖拉姆

step << skip --Shaman
    #completewith MargozTurnIn
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活

step << Hunter
    #completewith MargozTurnIn
    +驯服一只|cRXP_ENEMY_毒尾蝎|r
    .mob 毒尾蝎
    .train 16828,1 --Claw rank 2

step << Shaman
    #completewith next
    .subzone 371 >>前往尘风洞穴

step << Shaman
    #loop
    .goto 1411/1,-4774.39,780.80,0
    .goto 1411/1,-4774.39,780.80,20,0
    .goto 1411/1,-4749.01,822.39,12,0
    .goto 1411/1,-4767.52,825.92,12,0
    .goto 1411/1,-4772.28,848.12,12,0
    .goto 1411/1,-4756.41,863.630,12,0
    .goto 1411/1,-4715.70,861.87,12,0
    .goto 1411/1,-4706.71,902.41,12,0
    >>击杀|cRXP_ENEMY_火刃祭司|r，拾取|cRXP_LOOT_试剂袋|r
    .complete 1525,2 --Reagent Pouch (1)
    .mob 火刃祭司

step << !Shaman !Hunter
    #completewith next
    .goto 1411/1,-4939.36,824.51,80,0
    .goto 1411/1,-4945.18,1101.92,50 >> 前往|cRXP_FRIENDLY_玛高兹|r处
    .isQuestTurnedIn 806

step << !Shaman !Hunter
    #label MargozTurnIn
    .goto 1411/1,-4945.18,1101.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛高兹|r交谈
    .turnin 828 >>交任务：玛高兹
    .accept 827 >>接任务：骷髅石
    .target 玛高兹
    .isQuestTurnedIn 806

step << !Shaman !Hunter
    #completewith next
    .goto 1411/1,-4949.41,925.67,50,0
    .goto 1411/1,-4929.32,823.45,50,0
    .goto 1411/1,-4774.39,780.80,50 >> 前往尘风洞穴
    .isQuestTurnedIn 828

step << !Shaman !Hunter
    #loop
    .goto 1411/1,-4774.39,780.80,0
    .goto 1411/1,-4774.39,780.80,20,0
    .goto 1411/1,-4749.01,822.39,12,0
    .goto 1411/1,-4767.52,825.92,12,0
    .goto 1411/1,-4772.28,848.12,12,0
    .goto 1411/1,-4756.41,863.630,12,0
    .goto 1411/1,-4715.70,861.87,12,0
    .goto 1411/1,-4749.01,822.39,12,0
    >>击杀|cRXP_ENEMY_火刃兽人|r，拾取它们的|cRXP_LOOT_灼热项圈|r
    .complete 827,1 --Searing Collar (6)
    .mob 火刃暴徒
    .mob 火刃新兵
    .mob 火刃祭司
    .isQuestTurnedIn 828

step
    #label Ravine
    #completewith next
    .subzone 370 >> 跳下进入枯水谷

step
    #loop
    .goto 1411/1,-4816.69,972.910,0
    .goto 1411/1,-4818.81,848.48,40,0
    .goto 1411/1,-4755.36,952.82,40,0
    .goto 1411/1,-4704.07,964.10,40,0
    .goto 1411/1,-4818.28,975.38,40,0
    .goto 1411/1,-4718.87,1076.19,40,0
    .goto 1411/1,-4672.87,1131.89,40,0
    .goto 1411/1,-4816.69,972.910,40,0
    >>击杀|cRXP_ENEMY_尘风暴徒|r和|cRXP_ENEMY_尘风雷巫|r
    .use 277661 >>从|cRXP_ENEMY_尘风雷巫|r身上拾取|T134336:0|t[|cRXP_LOOT_黯淡的风暴宝珠|r]，使用它接取任务
    .complete 835,1 --Dustwind Savage (12)
    .mob +尘风暴徒
    .complete 835,2 --Dustwind Storm Witch (8)
    .mob +尘风雷巫
    .collect 277661,1,97281 --Dull Storm Orb (x1)
    .accept 97281 >>接任务：酝酿中的风暴

step << skip
    #softcore
    #completewith SecuringLinesTurnIn
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活

step
    #hardcore
    #completewith next
    .goto 1411/1,-4804.53,830.5,60,0
    .goto 1411/1,-4698.78,842.48,60,0
    .goto 1411/1,-4414.31,999.70,60 >> 穿过洞穴，前往|cRXP_FRIENDLY_雷兹拉克|r处

step
    #label SecuringLinesTurnIn
    .goto 1411/1,-4414.31,999.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 835 >>交任务：保卫商路
    .turnin 97281 >>交任务：酝酿中的风暴
    .accept 97282 >>接任务：风暴潜能
    .target 雷兹拉克

step << Shaman/Hunter
    #loop
    .goto 1411/1,-4010.35,1031.42,0
    .goto 1411/1,-4217.09,1087.47,60,0
    .goto 1411/1,-4100.24,1113.2,60,0
    .goto 1411/1,-4108.7,1229.88,60,0
    .goto 1411/1,-4013.52,1209.08,60,0
    .goto 1411/1,-4010.35,1031.42,60,0
    >>继续击杀|cRXP_ENEMY_毒尾蝎|r，拾取|cRXP_LOOT_毒囊|r，完成任务
    .complete 813,1 --Venomtail Poison Sac (4)
    .mob 毒尾蝎
    .itemcount 4904,<1 --Venomtail Antidote

step
    #completewith next
    >>击杀|cRXP_ENEMY_雷霆蜥蜴|r和|cRXP_ENEMY_闪电蜥蜴|r，拾取|cRXP_LOOT_带电的雷霆蜥蜴器官|r
    .complete 97282,1 --|5/5 Charged Thunder Lizard Organ
    .mob 闪电蜥蜴
    .mob 雷霆蜥蜴

step
    #loop
    .goto 1411/1,-4248.400,972.300,0
    .goto 1411/1,-4117.500,747.200,0
    .goto 1411/1,-4248.400,972.300,40,0
    .goto 1411/1,-4117.500,747.200,40,0
    >>击杀精英|cRXP_ENEMY_哈利科尔|r，拾取|T134061:0|t[|cRXP_LOOT_哈利科尔的蹄子|r]
    >>|cRXP_WARN_这场战斗很难！尽量组队。他有800点生命值，但伤害尚可应付。如果无法击杀，就跳过这一步|r
    >>|cRXP_WARN_他在雷霆山内至少有两处不同的刷新点|r
    .collect 275723,1,96877 --Halikor's Hoof (x1)
    .accept 96877 >>接任务：哈利科尔的蹄子
    .mob 哈利科尔

step
    .goto 1411/1,-4047.300,918.400
    >>击杀|cRXP_ENEMY_雷霆蜥蜴|r和|cRXP_ENEMY_闪电蜥蜴|r，拾取|cRXP_LOOT_带电的雷霆蜥蜴器官|r
    .complete 97282,1 --|5/5 Charged Thunder Lizard Organ
    .mob 闪电蜥蜴
    .mob 雷霆蜥蜴

step << skip
    #softcore
    #completewith next
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活

step
    .goto 1411/1,-4414.500,999.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 97282 >>交任务：风暴潜能
    .target 雷兹拉克

step << Shaman/Hunter
    #completewith next
    .goto 1411/1,-4945.18,1101.92,50 >> 前往|cRXP_FRIENDLY_玛高兹|r处
    .isQuestTurnedIn 806

step << Shaman/Hunter
    #label MargozTurnIn
    .goto 1411/1,-4945.18,1101.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛高兹|r交谈
    .turnin 828 >>交任务：玛高兹
    .accept 827 >>接任务：骷髅石
    .target 玛高兹
    .isQuestTurnedIn 806

step << Shaman/Hunter
    #completewith Gazzuz
    .goto 1411/1,-4876.97,1452.310,60 >> 前往骷髅石

step << Shaman/Hunter
    #completewith Gazzuz
    >>击杀|cRXP_ENEMY_毒尾蝎|r，拾取它们的|cRXP_LOOT_毒囊|r
    .complete 813,1 --Venomtail Poison Sac (4)
    .mob 毒尾蝎
    .itemcount 4904,<1 --Venomtail Antidote

step << Shaman/Hunter
    #completewith Gazzuz
    .goto 1411/1,-4855.82,1498.84,15,0
    .goto 1411/1,-4833.08,1494.96,15,0
    .goto 1411/1,-4805.59,1495.67,15,0
    .goto 1411/1,-4784.44,1535.85,15,0
    .goto 1411/1,-4750.60,1531.62,15,0
    .goto 1411/1,-4734.21,1505.54,15,0
    .goto 1411/1,-4693.49,1519.64,15,0
    .goto 1411/1,-4679.75,1501.31,15,0
    .goto 1411/1,-4684.50,1466.06,15,0
    >>击杀|cRXP_ENEMY_火刃兽人|r，拾取它们的|cRXP_LOOT_灼热项圈|r和|cRXP_LOOT_军官的徽章|r
    .complete 827,1 --Searing Collar (6)
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob 火刃狂热者
    .mob 火刃学徒

step << Shaman/Hunter
    #label Gazzuz
    .goto 1411/1,-4701.42,1455.83
    >>击杀|cRXP_ENEMY_加祖兹|r，拾取|T134085:0|t[|cRXP_LOOT_燃影之眼|r]
    >>|cRXP_WARN_使用|T134085:0|t[|r|cRXP_LOOT_燃影之眼|r|cRXP_WARN_]接取任务|r
    >>|cRXP_WARN_使用|r|T134712:0|t[强力胶水]|cRXP_WARN_黏住|r|cRXP_ENEMY_虚空行者|r|cRXP_WARN_以免被攻击，并使用|r|T134829:0|t[治疗药水]|cRXP_WARN_恢复生命值。利用视野遮挡躲避|r|cRXP_ENEMY_加祖兹|r|cRXP_WARN_的暗影箭|r
    >>|cRXP_WARN_利用洞内的水域可以甩掉|r|cRXP_ENEMY_虚空行者|r|cRXP_WARN_，但要先击杀|r|cRXP_ENEMY_加祖兹|r
    >>|cRXP_WARN_小心，他非常难对付。必要时可以跳过这个任务|r
    .collect 4903,1,832,1 --Collect Eye of Burning Shadow
    .accept 832 >>接任务：燃影之眼
    .use 4903
    .unitscan 加祖兹

step << Shaman/Hunter
    #loop
    .goto 1411/1,-4805.59,1495.67,0
    .goto 1411/1,-4855.82,1498.84,15,0
    .goto 1411/1,-4833.08,1494.96,15,0
    .goto 1411/1,-4805.59,1495.67,15,0
    .goto 1411/1,-4784.44,1535.85,15,0
    .goto 1411/1,-4750.60,1531.62,15,0
    .goto 1411/1,-4734.21,1505.54,15,0
    .goto 1411/1,-4693.49,1519.64,15,0
    .goto 1411/1,-4679.75,1501.31,15,0
    .goto 1411/1,-4684.50,1466.06,15,0
    .goto 1411/1,-4805.59,1495.67,15,0
    >>击杀|cRXP_ENEMY_火刃兽人|r，拾取它们的|cRXP_LOOT_灼热项圈|r和|cRXP_LOOT_军官的徽章|r
    >>|cRXP_WARN_若迟迟不掉落，就跳过|r|cRXP_LOOT_军官的徽章|r|cRXP_WARN_的收集|r
    .complete 827,1 --Searing Collar (6)
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob 火刃狂热者
    .mob 火刃学徒

step << Shaman/Hunter
    #completewith next
    >>击杀|cRXP_ENEMY_毒尾蝎|r，拾取它们的|cRXP_LOOT_毒囊|r
    .complete 813,1 --Venomtail Poison Sac (4)
    .mob 毒尾蝎
    .itemcount 4904,<1 --Venomtail Antidote

step
    .goto 1411/1,-4945.18,1101.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛高兹|r交谈
    .turnin 827 >>交任务：骷髅石
    .accept 829 >>接任务：尼尔鲁·火刃
    .target 玛高兹
    .isQuestTurnedIn 806

step
    #completewith Admiralorders1 << !Warrior !Shaman !Hunter
    #completewith NeeruFireblade << Warrior/Shaman/Hunter
    .goto 1454/1,-4367.46,1405.44,50,0
    .zone Orgrimmar >> 进入奥格瑞玛

step << !Rogue
    .goto 1454/1,-4355.53,1520.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特拉克根|r交谈
    .vendor >> 出售杂物
    .target 特拉克根
    .isQuestAvailable 97246

step << Rogue
    .goto 1454/1,-4355.53,1520.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_特拉克根|r|cRXP_BUY_交谈，向他购买|r|T135419:0|t[锋利的飞斧]|cRXP_BUY_。|r
    .collect 3135,1,354,1 --Sharp Throwing Axe (200)
    .vendor >> 出售杂物
    .target 特拉克根
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .money <0.03

step << Rogue
    #optional
    #completewith ZeptoUC1
    +|cRXP_WARN_装备|r|T135421:0|t[锋利的飞斧]|cRXP_WARN_（11级时）|r
    .use 3135
    .itemcount 3135,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3

step << Troll Priest
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔库|r交谈
    .turnin 5654 >> 交任务：虚弱妖术
    .trainer >> 学习职业技能
    .target 乌尔库
    .isOnQuest 5654

step << Troll Priest
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔库|r交谈
    .turnin 5652 >> 交任务：虚弱妖术
    .trainer >> 学习职业技能
    .target 乌尔库

step
    .goto 1454/1,-4460.000,1598.600
    .goto 1454/1,-4460.600,1584.300,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨托格|r交谈
    >>|cRXP_WARN_他在楼上|r
    .accept 97246 >>接任务：午餐诱惑
    .target 萨托格

step << Shaman
    .goto 1454/1,-4347.54,1634.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_乌萨罗|r|cRXP_BUY_交谈，向他购买|r|T135154:0|t[短杖]|cRXP_BUY_。|r
    .collect 854,1,924,1 --Collect Quarter Staff (1)
    .money <0.2871
    .target 乌萨罗
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0

step << Shaman
    #optional
    #completewith NeeruFireblade
    +|cRXP_WARN_装备|r|T135154:0|t[短杖]
    .use 854
    .itemcount 854,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0

step
    .goto 1454/1,-4482.600,1775.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博斯坦|r交谈
    .turnin 97246 >>交任务：午餐诱惑
    .accept 97249 >>接任务：最爱的食物
    .target 博斯坦

step
    .goto 1454/1,-4568.100,1855.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡玛瑞|r交谈
    .turnin 96877 >>交任务：哈利科尔的蹄子
    .target 卡玛瑞
    .isOnQuest 96877

step
    .goto 1454/1,-4466.800,1954.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考吉尔德|r交谈
    .accept 97242 >>接任务：耶尔玛克的混合配方
    .target 考吉尔德

step
    #completewith next
    .goto 1454/1,-4560.000,1908.500,15,0
    .goto 1454/1,-4587.000,1918.300,15,0
    .goto 1454/1,-4608.000,1897.400,15,0
    .goto 1454/1,-4632.300,1911.600,15 >>前往荣誉谷

step
    #loop
    .goto 1454/1,-4653.900,1950.300,0
    .goto 1454/1,-4653.900,1950.300,20,0
    .goto 1454/1,-4677.700,1971.600,20,0
    .goto 1454/1,-4667.400,1997.000,20,0
    .goto 1454/1,-4609.800,2013.500,20,0
    .goto 1454/1,-4630.600,1968.100,20,0
    >>拾取水中的|cRXP_PICK_一把香蒲|r和|cRXP_PICK_矛草插条|r
    .complete 97242,1 --|2/2 Handful of Cattails
    .complete 97242,2 --|4/4 Speargrass Cuttings

step << Hunter
    .goto 1454/1,-4607.02,2100.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 14281 >> 学习职业技能
    .target 奥玛克
    .xp <12,1

step << Hunter
    .goto 1454/1,-4611.09,2135.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖祖|r交谈
    .trainer 10088 >> 训练宠物技能
    .target 肖祖
    .xp <12,1

step
    .goto 1454/1,-4466.900,1954.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考吉尔德|r交谈
    .turnin 97242 >>交任务：耶尔玛克的混合配方
    .target 考吉尔德

step
    .goto 1454/1,-4477.900,1964.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶尔玛克|r交谈
    >>|cRXP_WARN_你可能需要等待约10秒才能接取这个任务|r
    .accept 97275 >>接任务：伍特急什么
    .target 耶尔玛克

step
    .goto 1454/1,-4463.000,1966.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伍特|r交谈
    .turnin 97275 >>交任务：伍特急什么
    .target 伍特

step
    .goto 1454/1,-4193.400,2001.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米吉|r交谈
    .turnin 97249 >>交任务：最爱的食物
    .target 米吉

step
    .goto 1454/1,-4205.800,2007.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯拉|r交谈
    .accept 97326 >>接任务：以石为座
    .target 斯拉

step
    .goto 1454/1,-4293.600,1949.900
    >>拾取地上橙色的|cRXP_PICK_石块|r
    .complete 97326,1 --|8/8 Smooth Boulder
    .isOnQuest 97326

step
    .goto 1454/1,-4205.900,2007.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯拉|r交谈
    .turnin 97326 >>交任务：以石为座
    .target 斯拉
    .isQuestComplete 97326

step << !Shaman !Hunter
    #label Admiralorders1
    .goto 1454/1,-4133.36,1939.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹格雷尔|r交谈
    .turnin 831 >>交任务：将军的命令
    .target 纳兹格雷尔

step << !Shaman !Hunter
    .goto 1454/1,-4125.79,1920.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .accept 5726 >>接任务：隐藏的敌人
    .target 萨尔
    .dungeon RFC

step << Shaman/Hunter
    .goto 1454/1,-4125.79,1920.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 5726 >>交任务：隐藏的敌人
    .accept 5727 >>接任务：隐藏的敌人
    .target 萨尔
    .isQuestComplete 5726
    .dungeon RFC

step << Shaman/Hunter
    .goto 1454/1,-4125.79,1920.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 5726 >>交任务：隐藏的敌人
    .target 萨尔
    .isQuestComplete 5726
    .dungeon !RFC

step << Shaman
    .goto 1454/1,-4225.09,1933.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8050 >> 学习职业技能
    .target 卡德里斯

step
    .goto 1454/1,-4320.700,1750.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡雷斯|r交谈
    .vendor >>修理装备
    .target 卡雷斯
    .isOnQuest 829

step << Rogue
    .goto 1454/1,-4280.21,1773.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟祖克|r交谈
    .accept 1963 >> 接任务：碎手氏族 << Orc Rogue/Troll Rogue
    .target 瑟祖克

step << Shaman/Hunter
    .goto 1454/1,-4343.19,1772.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考格汉|r交谈
    .turnin 813 >>交任务：寻找解毒剂
    .target 考格汉
    .itemcount 4904,<1 --Venomtail Antidote

step << Warlock
    .goto 1454/1,-4362.13,1834.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
    .train 1120 >> 学习职业技能
    .target 米尔科特

step << Shaman/Hunter
    .goto 1454/1,-4374.75,1800.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁|r交谈
    .turnin 829 >>交任务：尼尔鲁·火刃
    .turnin 832 >>交任务：燃影之眼
    .accept 809 >>接任务：雅克塞罗斯
    .target 尼尔鲁·火刃
    .isQuestTurnedIn 827
    .isOnQuest 832

step
    #label NeeruFireblade
    .goto 1454/1,-4374.75,1800.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁|r交谈
    .turnin 829 >>交任务：尼尔鲁·火刃
    .accept 809 >>接任务：雅克塞罗斯
    .target 尼尔鲁·火刃
    .isQuestTurnedIn 827

step << skip --!Shaman !Hunter
    #softcore
    #completewith ZeptoUC1
    .goto 1454/1,-4424.40,1817.58
    .subzone 2437 >> 进入怒焰裂谷

step << skip --!Shaman !Hunter
    #softcore
    #completewith ZeptoUC1
    .goto 1411/1,-4450.27,1188.64
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活

step << !Shaman !Hunter
    --#hardcore
    #completewith ZeptoUC1
    .zone Durotar >> 离开奥格瑞玛
    .zoneskip Durotar

step << skip --Shaman/Hunter
    #softcore
    #completewith FoundtheCure
    .goto 1454/1,-4424.40,1817.58
    .subzone 2437 >> 进入怒焰裂谷

step << skip --Shaman/Hunter
    #softcore
    #completewith FoundtheCure
    .goto 1411/1,-4450.27,1188.64
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活

step << Shaman/Hunter
    --#hardcore
    #completewith FoundtheCure
    .zone Durotar >> 离开奥格瑞玛
    .zoneskip Durotar

step << Shaman/Hunter
    #label FoundtheCure
    .goto 1411/1,-4158.93,1153.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林纳格|r交谈
    .accept 812 >>接任务：救命如救火
    .turnin 812 >>交任务：救命如救火
    .target 林纳格

step << Shaman/Hunter
    .goto 1411/1,-3802.55,650.72,50,0
    .goto 1411/1,-3803.08,503.38,50,0
    .goto 1411/1,-3783.51,238.65,50,0
    .goto 1411/1,-3774.53,150.88,50,0
    .goto 1411/1,-3797.79,317.260
    >>沿河向南前往前沿哨所
    >>沿途击杀|cRXP_ENEMY_巨齿鳄鱼|r，拾取|cRXP_LOOT_克鲁恩的护身符|r
    >>|cRXP_WARN_若迟迟不掉落，就跳过并放弃这个任务|r
    .complete 816,1 --Kron's Amulet (1)
    .mob 巨齿鳄鱼

step << Shaman/Hunter
    .goto 1411/1,-4241.94,742.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莎|r交谈
    .turnin 816 >>交任务：丢失的孩子
    .target 米莎·托克伦
    .isQuestComplete 816

step << Shaman/Hunter
    #label FarWatchPost
    .goto 1413/1,-3686.10,303.14,40 >> 前往前沿哨所
    .zoneskip The Barrens

step << Hunter
    .goto 1413/1,-3687.11,303.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加尔|r交谈
    .turnin 840 >>交任务：部落的新兵
    .accept 842 >>接任务：十字路口征兵
    .target 卡加尔·战痕

step << Shaman/Hunter
    #label Akzeloth
    .goto 1413/1,-3694.2,256.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅克塞罗斯|r交谈
    .turnin 809 >>交任务：雅克塞罗斯
    .accept 924 >>接任务：恶魔之种
    .target 雅克塞罗斯
    .isQuestTurnedIn 829

step << Shaman/Hunter
    .goto 1413/1,-3694.2,259.22
    >>|cRXP_WARN_拾取|r|T134095:0|t[有瑕疵的能量石]|cRXP_WARN_，就在|r|cRXP_FRIENDLY_雅克塞罗斯|r|cRXP_WARN_旁边。该物品仅能保留30分钟，务必抓紧时间|r
    .turnin 926 >>交任务：有瑕疵的能量石
    .isOnQuest 924

step << !Shaman !Hunter
    #completewith Gazzuz
    >>击杀|cRXP_ENEMY_火刃兽人|r，拾取|cRXP_LOOT_军官的徽章|r
    >> |cRXP_WARN_这是怒焰裂谷的前置任务，任务物品掉率较低。|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob 火刃狂热者
    .mob 火刃学徒
    .dungeon RFC

step << !Shaman !Hunter
    #label Gazzuz
    .goto 1411/1,-4701.42,1455.83
    >>击杀|cRXP_ENEMY_加祖兹|r，拾取|T134085:0|t[|cRXP_LOOT_燃影之眼|r]
    >> |cRXP_WARN_小心，他非常难打；如果无法组队或单独击败，可以跳过这个任务。|r
    >>|cRXP_WARN_使用|T134085:0|t[|r|cRXP_LOOT_燃影之眼|r|cRXP_WARN_]接取任务|r
    >> |cRXP_WARN_利用障碍物卡视野，躲避|cRXP_ENEMY_加祖兹|r的暗影箭。|r
    >>|cRXP_WARN_利用洞内的水域可以甩掉|r|cRXP_ENEMY_虚空行者|r|cRXP_WARN_，但要先击杀|r|cRXP_ENEMY_加祖兹|r
    .collect 4903,1,832,1 --Collect Eye of Burning Shadow
    .accept 832 >>接任务：燃影之眼
    .use 4903
    .unitscan 加祖兹
    .dungeon RFC

step << !Shaman !Hunter
    #loop
    .goto 1411/1,-4805.59,1495.67,0
    .goto 1411/1,-4855.82,1498.84,15,0
    .goto 1411/1,-4833.08,1494.96,15,0
    .goto 1411/1,-4805.59,1495.67,15,0
    .goto 1411/1,-4784.44,1535.85,15,0
    .goto 1411/1,-4750.60,1531.62,15,0
    .goto 1411/1,-4734.21,1505.54,15,0
    .goto 1411/1,-4693.49,1519.64,15,0
    .goto 1411/1,-4679.75,1501.31,15,0
    .goto 1411/1,-4684.50,1466.06,15,0
    .goto 1411/1,-4805.59,1495.67,15,0
    >>击杀|cRXP_ENEMY_火刃兽人|r，拾取|cRXP_LOOT_军官的徽章|r
    >> |cRXP_WARN_这是怒焰裂谷的前置任务，任务物品掉率较低。|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob 火刃狂热者
    .mob 火刃学徒
    .dungeon RFC

step << !Shaman !Hunter
    #label ZeptoUC1
    .goto 1411/1,-4648.55,1321.88,40 >>登上飞艇塔
    .zone Tirisfal Glades >>乘飞艇前往提瑞斯法林地
    >>|cRXP_WARN_等待时制造饮水|r << Mage
    .zoneskip Tirisfal Glades

step
    #optional
    .abandon 816 >>放弃任务：丢失的孩子
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（部落）
#subgroupdisplayname 1-22
#forever
#disabledungeons
<< Horde
#name 10-12 Tirisfal (Orc/Troll)
#version 11
#group RestedXP Forever Guide (H)
#subgroup Speedrun Guide 1-22
--#groupid RXP-SRGCE-H1
#defaultfor !Hunter !Shaman !Tauren !Skyborne !Undead
#next 12-14 Silverpine Forest << !Hunter !Shaman !Tauren !Skyborne !Undead
#displayname 10-12 提瑞斯法林地（兽人/巨魔）

step
    #completewith DeliverytoSPF
    .goto 1420/0,253.4,2234.85,80 >> 前往布瑞尔

step
    .goto 1420/0,254.600,2225.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_亡灵卫兵特伦斯|r 交谈。
    .accept 96895 >>接任务：银色使者
    .target 亡灵卫兵特伦斯

step << Warrior
    #optional
    .abandon 1505 >>放弃任务：老兵犹塞克
    .isOnQuest 1505

step << Warrior
    #optional
    .abandon 1498 >>放弃任务：防御之道
    .isOnQuest 1498

step << Warrior
    .goto 1420/0,238.49,2254.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯蒂尔|r 交谈。
    .accept 1818 >> 接任务：迪林格尔
    .target 奥斯蒂尔·德·蒙
    .isQuestAvailable 1498

step << Warlock
    .goto 1420/0,248.88,2251.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的 |cRXP_FRIENDLY_埃格隆|r 交谈。
    .accept 1478 >> 接任务：哈加尔的召唤
    .target 埃格隆·卡加尔
    .isQuestAvailable 1504

step << Undead Rogue
    .goto 1420/0,243.01,2270.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的 |cRXP_FRIENDLY_马里恩|r 交谈。
    .accept 1885 >>接任务：米奈特·卡加德
    .target 马里恩·考尔

step << Warrior
    .goto 1420/0,403.87,2287.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪林格尔|r 交谈。
    .turnin 1818 >> 交任务：迪林格尔
    .accept 1819 >> 接任务：切割者奥拉格
    .target 亡灵卫兵迪林格尔
    .isQuestAvailable 1498

step << Warrior
    .goto 1420/0,360.04,2376.14
    >>|cRXP_WARN_点击地上的|r |cRXP_WARN_陵墓机关|r，|cRXP_WARN_这会召唤出|r |cRXP_ENEMY_奥拉格。|r |cRXP_WARN_击杀他。|r
    .complete 1819,1 --Ulag the Cleaver (1)
    .mob 切割者奥拉格
    .isQuestAvailable 1498

step << Warrior
    .goto 1420/0,403.87,2287.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪林格尔|r 交谈。
    .turnin 1819 >> 交任务：切割者奥拉格
    .accept 1820 >> 接任务：库勒曼
    .target 亡灵卫兵迪林格尔
    .isQuestAvailable 1498

step
    #label DeliverytoSPF
    .goto 1420/0,346.94,2258.950
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔汉|r 交谈。
    .accept 445 >>接任务：给银松森林送信
    .target 药剂师乔汉

step << Warrior
    .goto 1420/0,244.36,2262.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_库勒曼|r 交谈。
    .turnin 1820 >>交任务：库勒曼
    .target 库勒曼·法席恩

step << Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_贝里尔|r 交谈。
    .train 588 >>学习 |T135926:0|t[心灵之火]
    .target 黑暗牧师贝里尔
    .xp <12,1

step << Mage
    .goto 1420/0,233.06,2256.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_凯恩|r 交谈。
    .train 145 >> 学习 |T135812:0|t[火球术 等级3]
    .target 凯恩·火歌
    .xp <12,1

step << Warrior
    .goto 1420/0,238.49,2255.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯蒂尔|r 交谈。
    .train 7384 >>学习 |T132223:0|t[压制]
    .target 奥斯蒂尔·德·蒙
    .xp <12,1

step << Rogue
    .goto 1420/0,243.01,2271.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_马里恩|r 交谈。
    .train 1766 >> 学习 |T132219:0|t[脚踢]
    .target 马里恩·考尔
    .money <0.08
    .xp <12,1

step << Warlock
    .goto 1420/0,250.24,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特|r 交谈。
    .train 755 >> 学习 |T136168:0|t[生命通道]
    .target 鲁伯特·鲍什
    .xp <12,1

step << !Mage
    .goto 1420/0,244.81,2269.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板瑞尼|r 交谈。
    >>|cRXP_BUY_向她购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r << Mage/Priest/Shaman
    >>|cRXP_BUY_向她购买|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_。|r << Warrior/Rogue
    >>|cRXP_BUY_向她购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_。|r << Warlock/Hunter
    .vendor >> 出售垃圾物品
    .collect 1179,20,96897,1 << Mage/Priest/Shaman --Ice Cold Milk (20)
    .collect 4605,20,96897,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,15,96897,1 << Warlock/Hunter --Ice Cold Milk (15)
    .collect 4605,15,96897,1 << Warlock/Hunter --Red-speckled Mushroom (15)
    .money <0.050 << !Warlock !Hunter
    .money <0.075 << Warlock/Hunter
    .target 旅店老板瑞尼

step
    .goto 1420/0,74.00,2022.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_林奈|r 交谈。
    .accept 356 >>接任务：巡查后方
    .target 亡灵卫兵林奈
    .maxlevel 11

step
    .goto 1420/0,54.600,1996.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈德里克·哈尔森|r 交谈。
    .turnin 96895 >>交任务：银色使者
    .accept 96897 >>接任务：诅咒教派
    .accept 96898 >>接任务：战争残迹
    .target 哈德里克·哈尔森
    .maxlevel 11

step
    .goto 1420/0,-130.500,1907.800
    >>击杀 |cRXP_ENEMY_黑暗执行者|r 和 |cRXP_ENEMY_黑暗新兵|r，拾取它们掉落的 |cRXP_LOOT_死灵水晶碎片|r。
    >>|cRXP_LOOT_死灵水晶碎片|r |cRXP_WARN_也可在地上拾取。|r
    >>|cRXP_WARN_小心！这些怪物伤害很高。|r|cRXP_ENEMY_黑暗执行者|r|cRXP_WARN_ 还有造成50-70点伤害的瞬发技能。|r
    .complete 96897,2 --|8/8 Dark Enforcer slain
    .mob +黑暗执行者
    .complete 96897,1 --|8/8 Dark Neophyte slain
    .mob +黑暗新兵
    .complete 96898,1 --|12/12 Necrotic Crystal Fragment
    .isOnQuest 96897,96898

step
    #label HorrorsandSpirits
    #loop
    .goto 1420/0,-324.55,2000.48,0
    .goto 1420/0,-324.55,2000.48,50,0
    .goto 1420/0,-330.88,2040.84,50,0
    .goto 1420/0,-359.34,2073.38,50,0
    .goto 1420/0,-421.25,2070.07,50,0
    .goto 1420/0,-464.63,2070.37,50,0
    .goto 1420/0,-516.14,2017.05,50,0
    .goto 1420/0,-466.44,1986.02,50,0
    .goto 1420/0,-436.61,1951.670,50,0
    .goto 1420/0,-355.28,1970.35,50,0
    >>击杀 |cRXP_ENEMY_可怕的血僵尸|r 和 |cRXP_ENEMY_游荡的幽灵|r。
    .complete 356,1 --Bleeding Horror (8)
    .mob +可怕的血僵尸
    .complete 356,2 --Wandering Spirit (8)
    .mob +游荡的幽灵
    .isOnQuest 356

step
    .goto 1420/0,54.500,1996.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈德里克·哈尔森|r 交谈。
    .turnin 96897 >>交任务：诅咒教派
    .turnin 96898 >>交任务：战争残迹
    .target 哈德里克·哈尔森
    .isQuestComplete 96897
    .isQuestComplete 96898

step
    #optional
    .goto 1420/0,54.500,1996.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈德里克·哈尔森|r 交谈。
    .turnin 96897 >>交任务：诅咒教派
    .target 哈德里克·哈尔森
    .isQuestComplete 96897

step
    #optional
    .goto 1420/0,54.500,1996.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈德里克·哈尔森|r 交谈。
    .turnin 96898 >>交任务：战争残迹
    .target 哈德里克·哈尔森
    .isQuestComplete 96898

step
    #label LinneaTurnin
    .goto 1420/0,74.00,2022.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_林奈|r 交谈。
    .turnin 356 >>交任务：巡查后方
    .target 亡灵卫兵林奈
    .isQuestComplete 356

step
    #completewith UCflightpath1
    .goto 1420/0,240.75,1877.57,20,0
    .zone Undercity >> 进入幽暗城
    .zoneskip Undercity

step
    #completewith UCflightpath1
    .goto 1458/0,239.14,1749.54,35,0
    .goto 1458/0,255.64,1724.70,35,0
    .goto 1458/0,240.68,1706.97,10,0
    .goto 1458/0,241.06,1660.12,10,0
    .goto 1458/0,257.08,1623.38,10,0
    .goto 1458/0,244.51,1598.73,15 >> 乘电梯下到幽暗城

step
    #label UCflightpath1
    .goto 1458/0,266.39,1567.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迈克尔|r 交谈。
    .fp Undercity >> 获取幽暗城飞行点
    .target 迈克尔·加勒特

step << Orc Rogue/Troll Rogue
    #ssf
    #optional
    #label RogueCutlass3
    .goto 1458/0,286.53,1616.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的 |cRXP_FRIENDLY_刘易斯·瓦伦|r 交谈。
    >>|cRXP_BUY_向他购买|r |T135346:0|t[斗士短剑] |cRXP_BUY_。|r
    .collect 851,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 刘易斯·瓦伦
    .zoneskip Undercity,1

step << Orc Rogue/Troll Rogue
    #ah
    #optional
    #label RogueCutlass3
    .goto 1458/0,286.53,1616.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的 |cRXP_FRIENDLY_刘易斯·瓦伦|r 交谈。
    >>|cRXP_BUY_向他购买|r |T135346:0|t[斗士短剑] |cRXP_BUY_。|r
    >>|cRXP_WARN_也可去拍卖行看看有没有更好或更便宜的武器。|r
    .collect 851,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 刘易斯·瓦伦
    .zoneskip Undercity,1

step << Undead Rogue
    .goto 1458/0,71.92,1435.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米奈特|r 交谈。
    .turnin 1885 >>交任务：米奈特·卡加德
    .accept 1886 >>接任务：亡灵哨兵
    .target 米奈特·卡加德
    .isOnQuest 1885

step << Rogue
    #label Swordtraining3
    .goto 1458/0,323.57,1668.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿基巴德|r 在军事区交谈。
    .train 201 >>学习单手剑（1h）
    .target 阿基巴德
    .money <0.1

step << Rogue
    #optional
    #completewith Entersilverpine
    +|cRXP_WARN_装备|r |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .train 201,3

step << Troll Warrior/Undead Warrior/Tauren Shaman/Troll Shaman/Orc Shaman
    .goto 1458/0,308.89,1667.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_本尼亚|r|cRXP_BUY_交谈，向他购买|r |T135154:0|t[短杖] |cRXP_BUY_。|r
    .collect 854,1,435,1 --Collect Quarter Staff (1)
    .money <0.3022
    .target 本尼亚·芬奈尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0

step << Troll Warrior/Undead Warrior/Tauren Shaman/Troll Shaman/Orc Shaman
    #optional
    #completewith Entersilverpine
    +|cRXP_WARN_装备|r |T135154:0|t[短杖]
    .use 854
    .itemcount 854,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0

step
    #ah
    .goto 1458/0,224.300,1648.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拍卖师凯恩|r 交谈。
    >>|cRXP_BUY_在拍卖行购买三只|r |T133884:0|t[鱼人的眼球] |cRXP_BUY_。|r
    >>|cRXP_WARN_可以跳过此步，这只会节省少量时间。|r
    .collect 730,3,91920,1 --Collect Murloc Eyes (x3)
    .target 拍卖师凯恩
    .zoneskip Undercity,1

step << Warlock
    .goto 1458/0,57.05,1711.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的 |cRXP_FRIENDLY_凯伦丁|r 交谈。
    .turnin 1478 >> 交任务：哈加尔的召唤
    .accept 1473 >> 接任务：虚空中的生物
    .isQuestAvailable 1504

step << Warlock
    .goto 1458/0,419.89,1627.54,50,0
    .goto 1458/0,428.52,1597.20,10,0
    .goto 1458/0,439.17,1626.06,10,0
    .goto 1458/0,476.78,1632.150,10,0
    .goto 1458/0,482.34,1660.63,10,0
    .goto 1458/0,539.33,1665.49,15,0
    .goto 1458/0,610.42,1684.44,35,0
    .goto 1458/0,663.19,1600.46,35,0
    .goto 1420/0,724.25,1682.66,50,0
    .zone Tirisfal Glades >> 从下水道离开幽暗城
    .zoneskip Tirisfal Glades

step << Warlock
    #optional
    #completewith next
    .goto 1420/0,726.06,1801.95
    >>打开 |cRXP_PICK_派瑞恩的箱子|r，拾取 |T133733:0|t[埃加林的魔典]。
    .complete 1473,1 --Egalin's Grimoire (1)
    .isQuestAvailable 1504

step << Warlock
    .goto 1420/0,726.06,1801.95
    >>打开地上的 |cRXP_PICK_派瑞恩的箱子|r，拾取 |T133733:0|t[埃加林的魔典]。
    .complete 1473,1 --Egalin's Grimoire (1)
    .isQuestAvailable 1504

step << Warlock
    #completewith next
    .goto 1458/0,714.8,1604.24,35,0
    .goto 1458/0,652.73,1623.44,35,0
    .goto 1458/0,634.02,1669.66,35,0
    .goto 1458/0,539.52,1665.17,10,0
    .goto 1458/0,481.48,1659.8,10,0
    .goto 1458/0,476.49,1632.15,10,0
    .goto 1458/0,439.08,1627.02,10,0
    .goto 1458/0,435.05,1598.86,10,0
    .zone Undercity >> 从下水道返回幽暗城

step << Warlock
    .goto 1458/0,57.05,1711.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的 |cRXP_FRIENDLY_凯伦丁|r 交谈。
    .turnin 1473 >> 交任务：虚空中的生物
    .accept 1471 >> 接任务：誓缚
    .target 凯伦丁·哈加尔
    .isQuestAvailable 1504

step << Warlock
    #completewith next
    .goto 1458/0,41.99,1704.480
    .cast 9221 >>|cRXP_WARN_在召唤法阵使用|r |T134416:0|t[召唤符文] |cRXP_WARN_。|r
    .use 6284

step << Warlock
    .goto 1458/0,41.99,1704.480
    >>击杀 |cRXP_ENEMY_虚空行者|r。
    .complete 1471,1 --Kill Summoned Voidwalker (1)
    .mob 虚空行者
    .use 6284
    .isQuestAvailable 1504

step << Warlock
    .goto 1458/0,57.34,1711.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_凯伦丁|r 交谈。
    .turnin 1471 >>交任务：誓缚
    .target 凯伦丁·哈加尔
    .isQuestAvailable 1504

step << Priest
    .goto 1458/0,273.87,1482.360
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉文尼亚|r 交谈。
    .train 7411 >> 学习 |T136244:0|t[附魔]
    .target 拉文尼亚·克洛文
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    .goto 1458/0,194.24,1681.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔瑟夫|r 交谈。
    .train 3908 >> 学习 |T136249:0|t[裁缝]
    .target 乔瑟夫·格里高利
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    .goto 1458/0,194.34,1681.63
    >>|cRXP_WARN_将所有|r |T132889:0|t[亚麻布] |cRXP_WARN_制成|r |T132890:0|t[亚麻布卷]
    .collect 2996,30,435,1 --Bolt of Linen Cloth (30)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    .goto 1458/0,194.34,1681.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔瑟夫|r 交谈。
    .train 7623 >> 学习制作 |T132662:0|t[棕色亚麻长袍]
    .target 乔瑟夫·格里高利
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    .goto 1458/0,196.16,1684.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米利尔|r 交谈。
    >>|cRXP_BUY_向她购买|r |T132891:0|t[粗线] |cRXP_BUY_。|r
    .collect 2320,30,435,1 --Coarse Thread (30)
    .target 米利尔·格里高利
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    >>|cRXP_WARN_尽可能多地制作|r |T132662:0|t[棕色亚麻长袍] |cRXP_WARN_。|r
    .collect 6238,9,398,1 --Brown Linen Robe(9)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    .goto 1458/0,275.02,1487.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_萨德乌斯|r|cRXP_BUY_交谈，向他购买|r |T133942:0|t[铜棒] |cRXP_BUY_和|r |T135435:0|t[普通木柴] |cRXP_BUY_。|r
    >>|cRXP_WARN_分解所有制作好的|r |T132662:0|t[棕色亚麻长袍] |cRXP_WARN_，并制作一根|r |T135225:0|t[符文铜棒]
    >>|cRXP_WARN_如果没有获得|r |T132867:0|t[次级魔法精华] |cRXP_WARN_，就向|r |cRXP_FRIENDLY_萨德乌斯|r |cRXP_WARN_购买一份（若有货）；否则稍后再完成此步。|r
    .collect 6218,1,435,1 --Runed Copper Rod (1)
    .collect 4470,1,435,1 --Simple Wood (1)
    .target 萨德乌斯·韦伯
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    .goto 1458/0,273.2,1491.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛考布|r 交谈。
    .train 14293 >> 学习制作 |T135139:0|t[次级魔法杖]
    .target 玛考布·维恩
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    >>|cRXP_WARN_制作一根|r |T135139:0|t[次级魔法杖]
    >>|cRXP_WARN_如果没有获得|r |T132867:0|t[次级魔法精华] |cRXP_WARN_，就向|r |cRXP_FRIENDLY_萨德乌斯|r |cRXP_WARN_购买一份（若有货）；否则稍后再完成此步。|r
    .collect 11287,1,435,1 --Lesser Magic Wand (1)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #optional
    #completewith Entersilverpine
    +|cRXP_WARN_装备|r |T135139:0|t[次级魔法杖]
    .use 11287
    .itemcount 11287,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Rogue
    .goto 1458/0,68.66,1416.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡罗琳|r 交谈。
    .train 1766 >> 学习 |T132219:0|t[脚踢]
    .target 卡罗琳·瓦德
    .xp <12,1
    .money <0.08

step << Mage
    .goto 1458/0,56.38,1813.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安娜斯塔西娅|r 交谈。
    .train 145 >> 学习 |T135812:0|t[火球术 等级3]
    .target 安娜斯塔西娅·哈特威尔
    .xp <12,1
    .money <0.08

step << Warlock
    .goto 1458/0,20.02,1776.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_理查德|r 交谈。
    .train 755 >> 学习 |T136168:0|t[生命通道]
    .target 理查德·科尔文
    .xp <12,1
    .money <0.08

step << Priest
    .goto 1458/0,416.91,1757.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉扎鲁斯|r 交谈。
    .train 588 >>学习 |T135926:0|t[心灵之火]
    .target 拉扎鲁斯神父
    .xp <12,1
    .money <0.08

step << Warrior
    .goto 1458/0,418.35,1767.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴尔图斯·弗勒|r 交谈。
    .train 7384 >>学习 |T132223:0|t[压制]
    .target 巴尔图斯·弗勒
    .xp <12,1
    .money <0.08

step
    #optional
    .abandon 806 >> 放弃任务：黑暗风暴

step
    #optional
    .abandon 408 >> 放弃任务：家族墓穴

step << Warrior
    #optional
    .abandon 1821 >> 放弃任务：阿加曼德家传武器

step
    #optional
    .abandon 375 >>放弃任务：死亡之寒

step
    #label LeaveUndercity3
    .goto 1458/0,419.89,1627.54,50,0
    .goto 1458/0,428.52,1597.20,10,0
    .goto 1458/0,439.17,1626.06,10,0
    .goto 1458/0,476.78,1632.150,10,0
    .goto 1458/0,482.34,1660.63,10,0
    .goto 1458/0,539.33,1665.49,15,0
    .goto 1458/0,610.42,1684.44,35,0
    .goto 1458/0,663.19,1600.46,35,0
    .goto 1420/0,724.25,1682.66,50,0
    .zone Tirisfal Glades >> 从下水道离开幽暗城
    .zoneskip Silverpine Forest

step
    #label Entersilverpine
    .goto 1420/0,629.36,1553.42
    .zone Silverpine Forest >> 前往银松森林
    .zoneskip Silverpine Forest
]])
