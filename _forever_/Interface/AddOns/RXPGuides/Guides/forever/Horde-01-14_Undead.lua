local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（部落）
#forever
#disabledungeons
<< Horde
#version 11
#group RestedXP Forever Guide (H)
#subgroup Speedrun Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
#defaultfor Undead
#name 1-6 Tirisfal Glades
#next 6-12 Tirisfal Glades
#displayname 1-6 提瑞斯法林地
step << !Undead
    #completewith next
    +|cRXP_WARN_你选择的指南适用于亡灵。建议选择与你出生地点一致的起始区域|r
step
    #completewith Zombies
	.destroy 6948 >> 摧毁背包中的|T134414:0|t[炉石]，后续不再需要
step
    #completewith next
    .goto 1420/0,1675.90,1645.00,8,0
    .goto 1420/0,1665.51,1645.00,8,0
    .goto 1420/0,1667.77,1679.04,10 >> 沿台阶离开墓穴，前往|cRXP_FRIENDLY_摩尔多|r处
step
    .goto 1420/0,1667.77,1679.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩尔多|r交谈
    .accept 363 >> 接受任务：突然醒来
    .target 管理员摩尔多
step << Warrior/Warlock/Priest/Mage
    #completewith Vendor
    .goto 1420/0,1646.08,1750.44,0 << Warrior/Warlock
    .goto 1420/0,1681.32,1719.710,40,0
    .goto 1420/0,1646.08,1750.44,40,0
    .goto 1420/0,1714.76,1760.68,40,0 << Priest/Mage
    .goto 1420/0,1718.38,1799.24,40,0 << Priest/Mage
    .goto 1420/0,1669.12,1869.73,40,0 << Priest/Mage
    +|cRXP_WARN_击杀|cRXP_ENEMY_食腐狼幼崽|r和|cRXP_ENEMY_夜行蝙蝠|r并拾取战利品，直到可出售物品（包括身上护甲）总价值达到60铜币|r << Mage
    +|cRXP_WARN_击杀|cRXP_ENEMY_食腐狼幼崽|r和|cRXP_ENEMY_夜行蝙蝠|r并拾取战利品，直到可出售物品（包括身上护甲）总价值达到50铜币|r << Priest
    +|cRXP_WARN_击杀|cRXP_ENEMY_食腐狼幼崽|r和|cRXP_ENEMY_夜行蝙蝠|r并拾取战利品，直到可出售物品（包括身上护甲）总价值达到10铜币|r << Warrior/Warlock
    .mob 食腐狼幼崽
    .mob 夜行蝙蝠
    >>|cRXP_WARN_按预计出售所得估算；达到上述金额后勾选此步骤|r
step << Warrior/Priest/Mage
    #completewith Training1 << Warrior
    #completewith Vendor << Priest/Mage
    .goto 1420/0,1577.39,1860.09,8 >> 进入建筑
step << Priest/Mage
    #label Vendor
    .goto 1420/0,1574.23,1866.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
    .vendor >> 出售杂物
	.collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .target 乔舒·基恩
step << Warlock/Mage
    #sticky
    #label Piercing
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温雅|r和|cRXP_FRIENDLY_萨维斯|r交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨维斯|r交谈 << Mage
    .accept 1470 >>接受任务：控制小鬼 << Warlock
    .goto 1420/0,1633.42,1836.9 << Warlock
    .target +温雅·玛山德 << Warlock
    .turnin 363 >> 交还任务：突然醒来
    .accept 364 >> 接受任务：无脑的僵尸
    .target +暗影牧师萨维斯
    .goto 1420/0,1639.75,1843.220
step << Warlock/Mage
    .goto 1420/0,1616.71,1842.92,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔雷斯|r交谈
    .accept 376 >> 接受任务：被诅咒者
    .goto 1420/0,1638.85,1847.74
    .target 新兵艾尔雷斯
    .xp <2,1
step << Mage
    #requires Piercing
    .goto 1420/0,1635.23,1847.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莎贝拉|r交谈
    .train 1459 >> 学习|T135932:0|t[奥术智慧]
    .target 伊莎贝拉
step << Warlock
    #label Vendor
    .goto 1420/0,1641.11,1836.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉|r交谈
    .vendor >>出售杂物
    .target 凯拉·斯密瑟
    .money >0.1
step << Warlock
    .goto 1420/0,1636.59,1839.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克希米林|r交谈
    .train 348 >>学习|T135817:0|t[献祭]
    .target 马克希米林
step << !Warlock !Mage
    .goto 1420/0,1616.71,1842.92,10,0
    .goto 1420/0,1639.75,1843.220
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨维斯|r交谈
    .turnin 363 >> 交还任务：突然醒来
    .accept 364 >> 接受任务：无脑的僵尸
    .target 暗影牧师萨维斯
step << !Warlock !Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔雷斯|r交谈
    .accept 376 >> 接受任务：被诅咒者
    .goto 1420/0,1638.85,1847.74
    .target 新兵艾尔雷斯
    .xp <2,1
step << Warrior
    #completewith next
    #label Vendor
    .goto 1420/0,1568.35,1859.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基班德|r交谈
    .vendor >> 出售杂物
    .target 阿基班德·卡瓦
    .money >0.1
step << Warrior
    #label Training1
    .goto 1420/0,1556.61,1862.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .train 6673 >>学习|T132333:0|t[战斗怒吼]
    .target 丹纳尔·斯特恩
step << Warlock
    #requires Piercing
    #loop
    .goto 1420/0,1595.47,1985.41,0
    .goto 1420/0,1595.47,1985.41,30,0
    .goto 1420/0,1627.55,2008.61,30,0
    .goto 1420/0,1584.17,2024.88,30,0
    .goto 1420/0,1575.58,2053.8,30,0
    .goto 1420/0,1529.49,2044.16,30,0
    .goto 1420/0,1512.32,2007.1,30,0
    .goto 1420/0,1499.67,1975.47,30,0
    .goto 1420/0,1487.47,1938.12,30,0
    .goto 1420/0,1541.69,1939.32,30,0
    >>击杀|cRXP_ENEMY_断骨骷髅|r，拾取它们掉落的|cRXP_LOOT_断骨骷髅的颅骨|r
    .complete 1470,1 --Rattlecage Skull (3)
    .mob 断骨骷髅
step << Warlock
    #completewith next
    +|cRXP_WARN_击杀|cRXP_ENEMY_无脑的僵尸|r和|cRXP_ENEMY_丑陋的僵尸|r并拾取战利品，直到可出售物品（包括身上护甲）总价值达到25铜币|r
    .mob 无脑的僵尸
    .mob 丑陋的僵尸
    .money >0.0025
step << Warlock
    .goto 1420/0,1576.94,1861.6,8,0
    .goto 1420/0,1574.23,1866.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
	.collect 159,5,383,1 --Collect Refreshing Spring Water (5)
    .target 乔舒·基恩
    .isOnQuest 1470
step << Warlock
    .goto 1420/0,1616.71,1842.92,10,0
    .goto 1420/0,1633.42,1836.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温雅|r交谈
    .turnin 1470 >>交还任务：控制小鬼
    .target 温雅·玛山德
step << Warlock
    #completewith next
    .cast 688 >>|cRXP_WARN_施放|r|T136218:0|t[召唤小鬼]
step << Priest
    #completewith next
    +|cRXP_WARN_保留|r|T132889:0|t[亚麻布]|cRXP_WARN_，稍后可以用来制作魔杖|r
step
    #label Zombies
    #requires Piercing << Warlock/Mage
    #loop
	.goto 1420/0,1599.99,1910.1,0
	.goto 1420/0,1599.99,1910.1,40,0
	.goto 1420/0,1646.53,1913.11,40,0
	.goto 1420/0,1637.04,1963.72,40,0
	.goto 1420/0,1644.72,1979.99,40,0
	.goto 1420/0,1626.19,1987.52,40,0
	.goto 1420/0,1596.37,1974.87,40,0
	.goto 1420/0,1548.92,1939.02,40,0
	.goto 1420/0,1546.66,1923.36,40,0
	.goto 1420/0,1523.62,1937.82,40,0
	.goto 1420/0,1508.26,1943.84,40,0
	.goto 1420/0,1519.1,1914.92,40,0
	.goto 1420/0,1517.29,1892.33,40,0
	.goto 1420/0,1529.04,1880.58,40,0
    >>击杀|cRXP_ENEMY_无脑的僵尸|r和|cRXP_ENEMY_丑陋的僵尸|r
    .complete 364,1 --Kill Mindless Zombie (x8)
    .mob +无脑的僵尸
    .complete 364,2 --Kill Wretched Zombie (x8)
    .mob +丑陋的僵尸
step << Mage/Warlock/Priest
    #completewith Vendor2
    +|cRXP_WARN_击杀|cRXP_ENEMY_无脑的僵尸|r和|cRXP_ENEMY_丑陋的僵尸|r并拾取战利品，直到可出售物品（包括身上护甲）总价值达到33铜币|r
    .mob 无脑的僵尸
    .mob 丑陋的僵尸
    .money >0.0033
step << Mage/Warlock/Priest
    .goto 1420/0,1576.94,1861.6,8,0
    .goto 1420/0,1574.23,1866.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
    .collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .vendor >> 出售杂物
    .target 乔舒·基恩
    .money <0.0050
    .itemcount 159,<10
 step << Mage/Warlock/Priest
    #label Vendor2
    .goto 1420/0,1576.94,1861.6,8,0
    .goto 1420/0,1574.23,1866.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
    .collect 159,5,383,1 --Collect Refreshing Spring Water (5)
    .vendor >> 出售杂物
    .target 乔舒·基恩
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨维斯|r和|cRXP_FRIENDLY_艾尔雷斯|r交谈 << !Warlock !Mage !Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨维斯|r、|cRXP_FRIENDLY_艾尔雷斯|r和|cRXP_FRIENDLY_马克希米林|r交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨维斯|r、|cRXP_FRIENDLY_艾尔雷斯|r和|cRXP_FRIENDLY_伊莎贝拉|r交谈 << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨维斯|r、|cRXP_FRIENDLY_艾尔雷斯|r和|cRXP_FRIENDLY_杜斯滕|r交谈 << Priest
    .turnin 364 >> 交还任务：无脑的僵尸
    .accept 3095 >> 接受任务：简易卷轴 << Warrior
    .accept 3096 >> 接受任务：密文卷轴 << Rogue
    .accept 3097 >> 接受任务：神圣卷轴 << Priest
    .accept 3098 >> 接受任务：雕文卷轴 << Mage
    .accept 3099 >> 接受任务：被污染的卷轴 << Warlock
    .accept 98601 >>接受任务：艰难的道路 << Paladin
    .accept 3901 >> 接受任务：断骨骷髅
    .target +暗影牧师萨维斯
    .goto 1420/0,1616.71,1842.92,10,0
    .goto 1420/0,1639.75,1843.220
    .accept 376 >> 接受任务：被诅咒者
    .target +新兵艾尔雷斯
    .goto 1420/0,1638.85,1847.74
    .turnin 3099 >> 交还任务：被污染的卷轴 << Warlock
    .goto 1420/0,1636.59,1839.01 << Warlock
    .target +马克希米林 << Warlock
    .turnin 3098 >> 交还任务：雕文卷轴 << Mage
    .goto 1420/0,1635.23,1847.44 << Mage
    .target +伊莎贝拉 << Mage
    .turnin 3097 >> 交还任务：神圣卷轴 << Priest
    .target +黑暗牧师杜斯滕 << Priest
    .goto 1420/0,1627.55,1848.65 << Priest
step << Paladin
    .goto 1420/0,1628.400,1837.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉米斯·锤手|r交谈
    .turnin 98601 >>交还任务：艰难的道路
    .accept 90902 >>接受任务：重拾圣光
    .target 阿拉米斯·锤手
    --90902 only 85xp, not worth doing
step << Paladin
    #completewith XPcheck
    >>|cRXP_WARN_施放|r|T135920:0|t[圣光术]|cRXP_WARN_治疗|r|cRXP_FRIENDLY_受伤的亡灵卫兵|r
    .complete 90902,1 --|5/5 Injured Deathguard healed
    .target 受伤的亡灵卫兵
step << Mage/Warlock/Priest
    .goto 1420/0,1576.94,1861.6,8,0
    .goto 1420/0,1574.23,1866.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
    .collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .target 乔舒·基恩
    .isOnQuest 364
step
    #completewith next
    >>击杀|cRXP_ENEMY_断骨骷髅|r
    .complete 3901,1 --Kill Rattlecage Skeleton (12)
    .mob 断骨骷髅
step
    #loop
    .goto 1420/0,1482.50,2126.70,0
    .goto 1420/0,1713.41,1828.76,40,0
    .goto 1420/0,1701.21,1858.290,40,0
    .goto 1420/0,1695.78,1908.29,40,0
    .goto 1420/0,1692.62,1927.88,40,0
    .goto 1420/0,1673.64,1984.51,40,0
    .goto 1420/0,1633.88,2040.24,40,0
    .goto 1420/0,1604.96,2073.08,40,0
    .goto 1420/0,1584.17,2098.08,40,0
    .goto 1420/0,1548.92,2079.71,40,0
    .goto 1420/0,1482.50,2126.70,40,0
    >>击杀|cRXP_ENEMY_食腐狼幼崽|r和|cRXP_ENEMY_蓬毛食腐狼|r，拾取它们掉落的|cRXP_LOOT_食腐狼的爪子|r
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r和|cRXP_ENEMY_癞皮夜行蝙蝠|r，拾取它们掉落的|cRXP_LOOT_夜行蝙蝠翼|r
    >>|cRXP_WARN_尽量避开|cRXP_ENEMY_癞皮夜行蝙蝠|r，它们比|cRXP_ENEMY_夜行蝙蝠|r难杀得多|r
    .complete 376,1 --Collect Scavenger Paw (x6)
    .mob +食腐狼幼崽
    .mob +蓬毛食腐狼
    .complete 376,2 --Collect Duskbat Wing (x6)
    .mob +夜行蝙蝠
    .mob +癞皮夜行蝙蝠
step
    #loop
    .goto 1420/0,1595.47,1985.41,0
    .goto 1420/0,1595.47,1985.41,30,0
    .goto 1420/0,1627.55,2008.61,30,0
    .goto 1420/0,1584.17,2024.88,30,0
    .goto 1420/0,1575.58,2053.8,30,0
    .goto 1420/0,1529.49,2044.16,30,0
    .goto 1420/0,1512.32,2007.1,30,0
    .goto 1420/0,1499.67,1975.47,30,0
    .goto 1420/0,1487.47,1938.12,30,0
    .goto 1420/0,1541.69,1939.32,30,0
    >>击杀|cRXP_ENEMY_断骨骷髅|r
    .complete 3901,1 --Kill Rattlecage Skeleton (12)
    .mob 断骨骷髅
step
    #label XPcheck
    #optional
    #loop
    .goto 1420/0,1595.47,1985.41,30,0
    .goto 1420/0,1627.55,2008.61,30,0
    .goto 1420/0,1584.17,2024.88,30,0
    .goto 1420/0,1575.58,2053.8,30,0
    .goto 1420/0,1529.49,2044.16,30,0
    .goto 1420/0,1512.32,2007.1,30,0
    .goto 1420/0,1499.67,1975.47,30,0
    .goto 1420/0,1487.47,1938.12,30,0
    .goto 1420/0,1541.69,1939.32,30,0
    .xp 3+895 >>刷怪至经验达到895+/1400 << Paladin
    .xp 3+940 >>刷怪至经验达到940+/1400 << Warrior/Rogue
    .xp 3+980 >>刷怪至经验达到980+/1400 << !Warrior !Rogue !Paladin
    .mob 无脑的僵尸
    .mob 丑陋的僵尸
step << Paladin
    .goto 1420/0,1593.500,1876.400
    >>|cRXP_WARN_施放|r|T135920:0|t[圣光术]|cRXP_WARN_治疗|r|cRXP_FRIENDLY_受伤的亡灵卫兵|r
    .complete 90902,1 --|5/5 Injured Deathguard healed
    .target 受伤的亡灵卫兵
step << Mage/Warlock/Priest/Paladin
    .goto 1420/0,1576.04,1861.60,8,0
    .goto 1420/0,1574.23,1866.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r << !Paladin
    >>|cRXP_WARN_至少保留1银币|r << Mage/Warlock/Priest
    .vendor >> 出售杂物
    .target 乔舒·基恩
    .money >0.1
    .isOnQuest 3901
    .itemcount 159,<20
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨维斯|r和|cRXP_FRIENDLY_艾尔雷斯|r交谈
    .turnin 3901 >> 交还任务：断骨骷髅
    .target +暗影牧师萨维斯
    .goto 1420/0,1616.71,1842.92,10,0
    .goto 1420/0,1639.75,1843.220
    .turnin 376 >> 交还任务：被诅咒者
    .accept 6395 >> 接受任务：玛拉的遗愿
    .target +新兵艾尔雷斯
    .goto 1420/0,1638.85,1847.74
step << Paladin
    .goto 1420/0,1568.35,1859.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基班德|r交谈
    .vendor >> 出售杂物
    .target 阿基班德·卡瓦
    .money >0.1
    .isOnQuest 90902
step
    .goto 1420/0,1628.300,1837.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉米斯·锤手|r交谈
    .turnin 90902 >>交还任务：重拾圣光 << Paladin
    .accept 91208 >>接受任务：接受现实 << Paladin
    .accept 91209 >>接受任务：继续训练 << Paladin
    .accept 98389 >>接受任务：黑暗中的一盏灯
    .target 阿拉米斯·锤手
step << Paladin
    .goto 1420/0,1628.300,1837.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉米斯·锤手|r交谈
    .train 20271 >>学习|T135959:0|t[审判]
    .train 19740 >>学习|T135906:0|t[力量祝福]
    .target 阿拉米斯·锤手
    .money <0.02
step << Paladin
    #optional
    .goto 1420/0,1628.300,1837.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉米斯·锤手|r交谈
    .train 20271 >>学习|T135959:0|t[审判]
    .target 阿拉米斯·锤手
    .money <0.01
step << Priest
    .goto 1420/0,1627.55,1848.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜斯滕|r交谈
    .train 589 >> 学习职业技能
    .target 黑暗牧师杜斯滕
    .money <0.021
step << Priest
    .goto 1420/0,1627.55,1848.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜斯滕|r交谈
    .train 2052 >> 学习|T135929:0|t[次级治疗术 等级2]
    .train 589 >> 学习|T136207:0|t[暗言术：痛]
    .target 黑暗牧师杜斯滕
    .money <0.021
step << Priest
    .goto 1420/0,1627.55,1848.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜斯滕|r交谈
    .train 1243 >> 学习|T135987:0|t[真言术：坚韧]
    .train 589 >> 学习|T136207:0|t[暗言术：痛]
    .target 黑暗牧师杜斯滕
    .money <0.011
step << Priest
    #optional
    .goto 1420/0,1627.55,1848.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜斯滕|r交谈
    .train 589 >> 学习|T136207:0|t[暗言术：痛]
    .target 黑暗牧师杜斯滕
    .money <0.01
step << Warlock
    .goto 1420/0,1636.59,1839.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克希米林|r交谈
    .train 172 >> 学习|T136118:0|t[腐蚀术]
    .target 马克希米林
step << Mage
    .goto 1420/0,1635.23,1847.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莎贝拉|r交谈
    .train 116 >> 学习|T135846:0|t[寒冰箭]
    .target 伊莎贝拉
step
    .goto 1420/0,1616.71,1842.92,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵萨尔坦|r和|cRXP_FRIENDLY_执行官阿伦|r交谈
    .accept 3902 >> 接受任务：捡破烂
    .goto 1420/0,1604.96,1860.70
    .target +亡灵卫兵萨尔坦
    .accept 380 >> 接受任务：夜行蜘蛛洞穴
    .goto 1420/0,1580.56,1848.95
    .target +执行官阿伦
step << Rogue/Warrior/Paladin
    .goto 1420/0,1568.35,1859.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基班德|r交谈
    .vendor >> 出售杂物
    .target 阿基班德·卡瓦
    .money >0.1
    .isOnQuest 3095 << Warrior
    .isOnQuest 3096 << Rogue
step << Warrior
    .goto 1420/0,1556.61,1862.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >> 交还任务：简易卷轴
    .train 100 >> 学习|T132337:0|t[冲锋]
    .train 772 >> 学习|T132155:0|t[撕裂]
    .target 丹纳尔·斯特恩
    .money <0.02
 step << Warrior
    #optional
    #label Training2
    .goto 1420/0,1556.61,1862.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >> 交还任务：简易卷轴
    .train 772 >> 学习|T132155:0|t[撕裂]
    .target 丹纳尔·斯特恩
    .money <0.01
step << Rogue
    #optional
    #label Training2
    .goto 1420/0,1563.38,1859.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大卫|r交谈
    .turnin 3096 >> 交还任务：密文卷轴
    .target 大卫·提亚斯
step << Rogue/Warrior/Paladin
    .goto 1420/0,1577.100,1854.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_沃尔特·梅森|r交谈
    >>|cRXP_BUY_向他购买|r|T134708:0|t[矿工锄]
    .train 2575 >> 学习|T136248:0|t[采矿]
    .collect 2901,1,792,1 --Mining Pick (1)
    >>|cRXP_WARN_学习后可以从矿点采集|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_，用于制作|r|T135248:0|t[磨刀石]|cRXP_WARN_（武器伤害+2，持续30分钟）|r
    .target 沃尔特·梅森
step
    #loop
	.goto 1420/0,1570.61,1898.35,0
	.goto 1420/0,1570.61,1898.35,12,0
	.goto 1420/0,1550.73,1897.75,12,0
	.goto 1420/0,1547.12,1891.42,12,0
	.goto 1420/0,1541.69,1867.93,12,0
	.goto 1420/0,1506.45,1892.33,12,0
	.goto 1420/0,1536.27,1937.21,12,0
	.goto 1420/0,1551.64,1936.31,12,0
	.goto 1420/0,1593.66,1985.11,12,0
	.goto 1420/0,1598.63,1970.95,12,0
	.goto 1420/0,1600.89,1953.78,12,0
	.goto 1420/0,1617.16,1956.49,12,0
    >>打开地上的|cRXP_PICK_装备箱|r，拾取其中的|cRXP_LOOT_破烂装备|r
    .complete 3902,1 --Collect Scavenged Goods (x6)
step << Paladin
    .goto 1420/0,1782.400,1914.700
    >>与|cRXP_FRIENDLY_受惊的圣骑士|r交谈，她变为敌对后将其击杀
    .complete 91208,1 --|1/1 Offer aid to the Frightened Paladin
    .skipgossip
    .mob 受惊的圣骑士
step
    #label NightWebStart
    #loop
	.goto 1420/0,1680.42,2110.43,0
	.goto 1420/0,1680.42,2110.43,40,0
	.goto 1420/0,1685.84,2149.6,40,0
	.goto 1420/0,1711.6,2157.43,40,0
	.goto 1420/0,1750.01,2135.14,40,0
	.goto 1420/0,1782.54,2117.36,40,0
	.goto 1420/0,1754.98,2080.91,40,0
	.goto 1420/0,1756.79,2047.77,40,0
	.goto 1420/0,1731.93,2044.16,40,0
	.goto 1420/0,1709.79,2048.07,40,0
	.goto 1420/0,1692.62,2074.28,40,0
    >>击杀|cRXP_ENEMY_小夜行蜘蛛|r
    .complete 380,1,6 --Kill Young Night Web Spider (10)
    .mob 小夜行蜘蛛
step
    #loop
	.goto 1420/0,1756.79,2082.12,0
	.goto 1420/0,1756.79,2082.12,25,0
	.goto 1420/0,1749.1,2058.02,25,0
	.goto 1420/0,1774.41,2012.83,25,0
	.goto 1420/0,1805.59,2054.7,25,0
	.goto 1420/0,1799.71,2091.15,25,0
	.goto 1420/0,1815.98,2137.85,25,0
	.goto 1420/0,1790.23,2150.5,25,0
    >>击杀洞口附近的|cRXP_ENEMY_小夜行蜘蛛|r
    .complete 380,1 --Kill Young Night Web Spider (10)
    .mob 小夜行蜘蛛
step
    #completewith next
    .goto 1420/0,1822.31,2048.07,15,0
    .goto 1420/0,1844.45,2042.050,30 >>进入洞穴
step
    #completewith next
    >>攻击|cRXP_ENEMY_被网住的被遗忘者|r
    .complete 98389,1 --|6/6 Webbed Forsaken freed
    .mob 被网住的被遗忘者
step
    #loop
    .goto 1420/0,1918.11,2043.86,0
    .goto 1420/0,1844.45,2042.050,30,0
    .goto 1420/0,1876.08,2043.56,20,0
    .goto 1420/0,1898.68,2020.06,20,0
    .goto 1420/0,1940.70,2006.80,20,0
    .goto 1420/0,1983.63,2032.71,20,0
    .goto 1420/0,1953.80,2079.40,20,0
    .goto 1420/0,1918.11,2043.86,20,0
    >>击杀洞内的|cRXP_ENEMY_夜行蜘蛛|r
	.complete 380,2 --Kill Night Web Spider (x8)
    .mob 夜行蜘蛛
step
    .goto 1420/0,1921.500,2046.500
    >>攻击|cRXP_ENEMY_被网住的被遗忘者|r
    .complete 98389,1 --|6/6 Webbed Forsaken freed
    .mob 被网住的被遗忘者
step
    #softcore
    #completewith Scavenging
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target 灵魂医者
step << Warlock
    #softcore
    #completewith ScarletC
    .cast 688 >>|cRXP_WARN_施放|r|T136218:0|t[召唤小鬼]
step << skip
    #hardcore
    #completewith next
    .goto 1420,26.027,60.607,-1
    .goto 1420,24.508,59.360,-1
    .goto 1420,23.572,59.239,-1
    .goto 1420/0,1628.91,1882.99,30 >>|cRXP_WARN_在洞内跳到伐木机、水井或插在墙上的木板顶部，然后退出并重新登录，利用登出跳跃离开洞穴|r
    >>|cRXP_WARN_也可以跑回丧钟镇|r
step
    #label Scavenging
    .goto 1420/0,1604.96,1860.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔坦|r交谈
    .turnin 3902 >> 交还任务：捡破烂
    .target 亡灵卫兵萨尔坦
step
    #label NightWebH
    .goto 1420/0,1580.56,1848.95,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿伦|r交谈
    .turnin 380 >> 交还任务：夜行蜘蛛洞穴
    .accept 381 >> 接受任务：血色十字军
    .target 执行官阿伦
step
    .goto 1420/0,1628.400,1837.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉米斯·锤手|r交谈
    .turnin 91208 >>交还任务：接受现实 << Paladin
    .turnin 98389 >>交还任务：黑暗中的一盏灯
    .target 阿拉米斯·锤手
step << Rogue/Warrior/Paladin
    .goto 1420/0,1568.35,1859.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基班德|r交谈
    .vendor >> 出售杂物
    .target 阿基班德·卡瓦
    .isOnQuest 6395
step << Warlock/Mage/Priest
    .goto 1420/0,1574.23,1866.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
	.collect 159,15,383,1 << Warlock/Mage/Priest --Collect Refreshing Spring Water (15)
    .vendor >> 出售杂物
    .target 乔舒·基恩
    .isOnQuest 6395
    .itemcount 159,<15
step
    #requires NightWebH
    #loop
	.goto 1420/0,1400.71,1766.71,0
	.goto 1420/0,1400.71,1766.71,40,0
	.goto 1420/0,1385.80,1744.11,40,0
	.goto 1420/0,1368.17,1728.15,40,0
	.goto 1420/0,1342.42,1741.40,40,0
	.goto 1420/0,1313.95,1735.08,40,0
	.goto 1420/0,1320.28,1752.25,40,0
	.goto 1420/0,1314.85,1765.80,40,0
	.goto 1420/0,1294.07,1780.56,40,0
	.goto 1420/0,1283.67,1817.02,40,0
	.goto 1420/0,1289.55,1841.72,40,0
	.goto 1420/0,1286.84,1877.27,40,0
	.goto 1420/0,1333.38,1868.53,40,0
	.goto 1420/0,1364.56,1867.93,40,0
	.goto 1420/0,1383.54,1866.72,40,0
	.goto 1420/0,1368.17,1831.48,40,0
	.goto 1420/0,1341.06,1790.51,40,0
	.goto 1420/0,1364.56,1784.18,40,0
    >>击杀|cRXP_ENEMY_血色新兵|r和|cRXP_ENEMY_血色信徒|r，拾取他们掉落的|cRXP_LOOT_血色十字军臂章|r
    >>|cRXP_WARN_暂时不要击杀|cRXP_ENEMY_迈文·考加尔|r|r
    >>|cRXP_WARN_尽量避开|cRXP_ENEMY_血色新兵|r，他们有|r|T135843:0|t[霜甲术]|cRXP_WARN_（降低你的攻击速度）|r << Warrior/Rogue
    .complete 381,1 --Collect Scarlet Armband (12)
    .mob 血色新兵
    .mob 血色信徒
step
    .goto 1420/0,1375.40,1979.69
    >>击杀|cRXP_ENEMY_塞缪尔|r，拾取|cRXP_LOOT_塞缪尔的遗骸|r
    .collect 16333,1,6395,1 --Collect Samuel's Remains
    .mob 塞缪尔·菲普斯
step
    #softcore
    #completewith next
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target 灵魂医者
step
    .goto 1420/0,1624.84,1876.96
	>>点击地上的|cRXP_PICK_玛拉的坟墓|r
    .complete 6395,1 --Collect Samuel's Remains Buried (1)
 step << Warlock
    #softcore
	#completewith ScarletC
	.cast 688 >>|cRXP_WARN_施放|r|T136218:0|t[召唤小鬼]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔雷斯|r交谈 << !Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔雷斯|r和|cRXP_FRIENDLY_杜斯滕|r交谈 << Priest
    .turnin 6395 >> 交还任务：玛拉的遗愿
    .target +新兵艾尔雷斯
    .goto 1420/0,1616.71,1842.92,10,0
    .goto 1420/0,1638.85,1847.74
    .accept 5651 >> 接受任务：黑暗的恩赐 << Priest
    .target +黑暗牧师杜斯滕 << Priest
    .goto 1420/0,1627.55,1848.65 << Priest
step
    #sticky
    #label ScarletC
    .goto 1420/0,1580.56,1848.95,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿伦|r交谈
    .turnin 381 >> 交还任务：血色十字军
    .accept 382 >> 接受任务：十字军信使
    .target 执行官阿伦
step
    .goto 1420/0,1568.35,1859.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基班德|r交谈
    .vendor >> 出售杂物
    .target 阿基班德·卡瓦
step
    #requires ScarletC
    .goto 1420/0,1383.99,1764.30
    >>击杀|cRXP_ENEMY_迈文|r，拾取|cRXP_LOOT_血色十字军文件|r
    .complete 382,1 --Collect Scarlet Crusade Documents (1)
    .mob 迈文·考加尔
step
    .goto 1420/0,1580.56,1848.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿伦|r交谈
    .turnin 382 >> 交还任务：十字军信使
    .accept 383 >> 接受任务：重要情报
    .accept 96656 >> 接受任务：冒险者
    .target 执行官阿伦
step
    #loop
    .goto 1420/0,1493.34,2044.76,50,0
    .goto 1420/0,1436.41,2133.93,50,0
    .goto 1420/0,1369.08,2124.89,50,0
    .goto 1420/0,1327.05,2048.68,50,0
    .goto 1420/0,1338.35,1939.93,50,0
	.goto 1420/0,1400.71,1766.71,50,0
	.goto 1420/0,1385.80,1744.11,50,0
	.goto 1420/0,1368.17,1728.15,50,0
	.goto 1420/0,1342.42,1741.40,50,0
	.goto 1420/0,1313.95,1735.08,50,0
	.goto 1420/0,1320.28,1752.25,50,0
	.goto 1420/0,1314.85,1765.80,50,0
	.goto 1420/0,1294.07,1780.56,50,0
	.goto 1420/0,1283.67,1817.02,50,0
	.goto 1420/0,1289.55,1841.72,50,0
	.goto 1420/0,1286.84,1877.27,50,0
	.goto 1420/0,1333.38,1868.53,50,0
	.goto 1420/0,1364.56,1867.93,50,0
	.goto 1420/0,1383.54,1866.72,50,0
	.goto 1420/0,1368.17,1831.48,50,0
	.goto 1420/0,1341.06,1790.51,50,0
	.goto 1420/0,1364.56,1784.18,50,0
	.goto 1420/0,1400.71,1766.71,50,0
    .xp 5+1940 >>刷怪至经验达到1940+/2800 << !Paladin
    .xp 5+1850 >>刷怪至经验达到1850+/2800 << Paladin
step
    .goto 1420/0,1305.36,2127.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔文|r交谈
    .accept 8 >> 接受任务：潜行者的交易
    .target 卡尔文·蒙泰古
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（部落）
#subgroupdisplayname 1-22
#forever
#disabledungeons
<< Horde
#name 6-12 Tirisfal Glades
#version 11
#group RestedXP Forever Guide (H)
#subgroup Speedrun Guide 1-22
--#groupid RXP-SRGCE-H1
#defaultfor Undead
#next 12-14 Silverpine Forest; 12-17 The Barrens
#displayname 6-13 提瑞斯法林地 << Paladin
#displayname 6-12 提瑞斯法林地

step
    .goto 1420/0,1184.71,2205.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希米尔|r交谈
    .accept 365 >>接任务：悲伤之地
    .target 亡灵卫兵希米尔

step
    #loop
    .goto 1420/0,496.96,2256.54,0
    .goto 1420/0,1191.04,2198.10,0
    .goto 1420/0,1191.04,2198.10,40,0
    .goto 1420/0,1133.65,2177.31,40,0
    .goto 1420/0,1063.61,2201.710,40,0
    .goto 1420/0,945.22,2127.00,40,0
    .goto 1420/0,824.57,2092.36,40,0
    .goto 1420/0,740.97,2112.24,40,0
    .goto 1420/0,660.09,2196.29,40,0
    .goto 1420/0,571.07,2251.42,40,0
    .goto 1420/0,496.96,2256.54,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_葛尔多|r
    >>|cRXP_WARN_他在布瑞尔的大路上巡逻（是个很大的缝合怪）|r
    .accept 5481 >>接任务：葛尔多的任务
    .unitscan 葛尔多

step << Priest
    .goto 1420/0,656.92,2164.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博文|r交谈
    .train 3908 >> 学习 |T136249:0|t[裁缝]。留好你的 |T132889:0|t[亚麻布]，这样之后就能制作魔杖
    .target 博文·布里斯博埃斯

step
    #softcore
    #completewith next
    .deathskip >> 死亡并在|cRXP_FRIENDLY_灵魂医者|r处复活，或跑到布瑞尔。
    .target 灵魂医者

step
    .goto 1420/0,391.400,2289.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵巴塞洛缪|r交谈
    >>|cRXP_WARN_他可能正在墓地周围巡逻|r
    .accept 86784 >>接任务：棍棒和骨头
    .target 亡灵卫兵巴塞洛缪

step
    #completewith next
    >>拾取|cRXP_PICK_干枯的树枝|r（布瑞尔附近树下）
    .complete 86784,1 --|6/6 Dry Branch

step
    .goto 1420/0,403.42,2287.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈
    .accept 404 >>接任务：腐烂的爪子
    .target 亡灵卫兵迪林格尔

step
    #loop
    .goto 1420/0,603.600,2268.300,40,0
    .goto 1420/0,539.700,2220.400,40,0
    .goto 1420/0,305.600,2180.100,40,0
    .goto 1420/0,375.600,2246.400,40,0
    .goto 1420/0,442.800,2259.400,40,0
    >>拾取|cRXP_PICK_干枯的树枝|r（布瑞尔附近树下）
    .complete 86784,1 --|6/6 Dry Branch

step
    .goto 1420/0,445.500,2165.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃莉诺·沙克尔顿|r交谈
    .turnin 86784 >>交任务：棍棒和骨头
    .turnin 96656 >>交任务：冒险者
    .accept 96607 >>接任务：广阔天地
    .target 埃莉诺·沙克尔顿

step
    .goto 1420,57.17,55.55
    >>|cRXP_WARN_在埃莉诺旁的篝火边输入 /sit，等待一分钟，直到获得“露营增益”Buff。|r
    .complete 96607,1 --|1/1 Use the /sit emote near the campfire
    .macro 坐下,134400 >>/sit
    .timer 59, 剧情演出
    .complete 96607,2 --|Gain the Boosted Rest buff

step
    .goto 1420/0,445.400,2166.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃莉诺·沙克尔顿|r交谈
    .turnin 96607 >>交任务：广阔天地
    .target 埃莉诺·沙克尔顿
    .accept 96658 >>接任务：露营基础：烹饪
    --.accept 97959 >>Accept Camping 101: Mining

step
    .goto 1420/0,346.94,2258.950
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .accept 367 >>接任务：新的瘟疫
    .target 药剂师乔汉
    .xp <6,1

step
    .goto 1420/0,296.600,2278.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .turnin 383 >>交任务：重要情报
    .accept 427 >>接任务：与血色十字军的战争
    .accept 99141 >>接任务：耐心耗尽
    .accept 99134 >>接任务：训诫
    .target 执行官塞加德

step
    #completewith Claws
    .use 286176 >>|cRXP_WARN_使用|r |T133490:0|t[执行官的“激励棒”]|cRXP_WARN_在布瑞尔及周边的|cRXP_FRIENDLY_亡灵卫兵|r身上|r
    .complete 99134,1 --|5/5 Deathguards motivated
    --too many .mobs, will cause clutter

step << Rogue
    .goto 1420/0,270.12,2253.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_温特斯夫人|r|cRXP_BUY_交谈，向她购买一把|r |T135421:0|t[增重飞斧]|cRXP_BUY_。|r
    .collect 3131,1 --Weighted Throwing Axe (200)
    .target 温特斯夫人
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
    .money <0.07
    >>无限版只需购买1把投掷武器，不必补足200把；现有武器足够或钱不足时可以跳过

step << Rogue
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135641:0|t[卷刃的剑]的钱（3 银 81 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3

step << Rogue
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135641:0|t[卷刃的剑]|cRXP_BUY_。|r
    .collect 2494,1,404,1 --Collect Stiletto (1)
    .money <0.0381
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3

step << Rogue
    #optional
    #completewith Claws
    +|cRXP_WARN_装备|r |T135421:0|t[增重飞斧]
    .use 3131
    .itemcount 3131,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9

step << Rogue
    #optional
    #completewith Claws
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3

step << Warrior
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135321:0|t[步兵剑]的钱（5 银 10 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
    .train 201,3

step << Warrior
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135321:0|t[步兵剑]|cRXP_BUY_。|r
    .collect 2488,1 --Collect Gladius (1)
    .money <0.0510
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
    .train 201,3

step << Warrior
    #optional
    #completewith Claws
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
    .train 201,3

step << Paladin
    .goto 1420/0,311.600,2250.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎莉·斯迪威尔|r交谈
    .complete 91209,1 --|1/1 Report to Shari Stilwell in Brill
    .turnin 91209 >>交任务：继续训练
    .target 莎莉·斯迪威尔

step << Paladin
    .goto 1420/0,311.600,2250.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎莉·斯迪威尔|r交谈
    .train 679 >>学习|T626003:0|t[神圣打击]
    .target 莎莉·斯迪威尔
    .xp <6,1

step << Paladin
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >> 出售杂物。如果卖掉武器就能凑够购买 |T133053:0|t[木槌棒] 的钱（6银 66铜），就卖掉它；钱还不够则稍后再回来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9

step << Paladin
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈后，向他购买一把|r |T133053:0|t[木槌棒]|cRXP_BUY_。|r
    .collect 2493,1,404,1 --Collect Wooden Mallet (1)
    .money <0.0666
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9

step << Paladin
    #optional
    #completewith Claws
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9

step
    .goto 1420/0,244.81,2269.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    .turnin 8 >>交任务：潜行者的交易
    .home >> 将炉石绑定在布瑞尔
    .target 旅店老板瑞尼
    .bindlocation 2119

step
    #optional
    .goto 1420/0,244.81,2269.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    .turnin 8 >>交任务：潜行者的交易
    .target 旅店老板瑞尼
    .isOnQuest 8

step
    .goto 1420/0,243.200,2288.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉|r交谈
    .train 2550 >>学习烹饪
    .turnin 96658 >>交任务：露营基础：烹饪
    .target 威廉·皮克曼
    .money <0.001

step
    .goto 1420/0,236.68,2249.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    >>|cRXP_FRIENDLY_格莉丝|r|cRXP_WARN_在旅店二楼|r
    .accept 375 >>接任务：死亡之寒
    .target 格莉丝·戴玛
    .xp <7,1

step << Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
    .turnin 5651 >> 交任务：黑暗的恩赐
    .accept 5650 >> 接任务：黑暗之衣
    .train 591 >>学习 |T135924:0|t[惩击]
    .train 17 >>学习 |T135940:0|t[真言术:盾]
    .train 2052 >>学习 |T135929:0|t[次级治疗术(2级)]
    .target 黑暗牧师贝里尔

step << Mage
    .goto 1420/0,233.06,2256.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .train 143 >> 学习 |T135812:0|t[火球术]
    .train 2136 >>学习 |T135807:0|t[火焰冲击]
    .target 凯恩·火歌

step << Warrior
    .goto 1420/0,238.49,2255.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .target 奥斯蒂尔·德·蒙
    .money <0.01

step << Rogue
    .goto 1420/0,243.01,2271.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_马里恩·考尔|r交谈
    .train 1757 >> 学习 |T136189:0|t[邪恶攻击]
    .target 马里恩·考尔
    .money <0.01

step << Warlock
    .goto 1420/0,251.59,2252.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_吉娜·朗恩|r交谈
    >>|cRXP_BUY_购买|r |T133738:0|t[魔典：血契]|cRXP_BUY_（从她那里）|r
    .collect 16321,1,404,1 --Grimoire of Blood Pact
    .vendor >>出售杂物
    .target 吉娜·朗恩
    .train 6307,1 --Blood Pact (Rank 1)

step << Warlock
    .goto 1420/0,250.24,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .train 1454 >> 学习 |T136126:0|t[生命分流]
    .target 鲁伯特·鲍什
    .money <0.02

step << Warlock
    .goto 1420/0,250.24,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .target 鲁伯特·鲍什

step << Priest/Warlock
    .goto 1420/0,242.55,2284.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_范斯|r交谈
    .train 7411 >> 学习|T136244:0|t[附魔]
    >>|cRXP_WARN_配合|r |T136249:0|t[裁缝]|cRXP_WARN_可在稍后制作魔杖|r
    .target 范斯·安德格鲁姆

step
    .goto 1420/0,244.81,2269.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    .vendor >>|cRXP_BUY_尽量多购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（她有售）|r << Mage/Priest/Paladin
    .vendor >>|cRXP_BUY_尽量多购买|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_（她有售）|r << Warrior/Rogue
    .vendor >>|cRXP_BUY_尽量多购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_（她有售）|r << Warlock
    .money <0.0125
    .target 旅店老板瑞尼

step
    .goto 1420/0,84.900,2023.500
    >>与|cRXP_FRIENDLY_亡灵卫兵克里斯托弗|r交谈
    >>|cRXP_WARN_选择“我要一份执行官塞加德的报告”|r
    .complete 99141,2 --|1/1 Kristof's Report
    .skipgossipid 142730
    .target 亡灵卫兵克里斯托弗

step
    .goto 1420/0,77.200,2026.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_舍伦尼·洛巴尔特|r交谈
    .accept 97558 >>接任务：被遗忘者的皮
    .target 舍伦尼·洛巴尔特

step
    .goto 1420/0,346.94,2258.950
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .accept 367 >>接任务：新的瘟疫
    .target 药剂师乔汉

step << Priest
    .goto 1420/0,359.14,2436.99
    >>把|T135929:0|t[次级治疗术]和|T135987:0|t[真言术：坚韧]施放给|cRXP_FRIENDLY_亡灵卫兵科尔|r
    >>|cRXP_WARN_需要学会[次级治疗术]（等级 2） 才能完成此任务|r
    .complete 5650,1 --Heal and fortify Deathguard Kel (1)
    .target 亡灵卫兵科尔

step
    #completewith Gordo2
    >>拾取地面上的 |cRXP_PICK_阴暗草|r
    .complete 5481,1 --Gloom Weed (3)

step
    #completewith Pumkpins
    >>击杀|cRXP_ENEMY_黑暗犬|r，拾取|cRXP_LOOT_血液|r和|cRXP_LOOT_毛皮|r
    .complete 367,1 --Darkhound Blood (5)
    .complete 97558,2 --|6/6 Darkhound Hide
    .mob 衰老的黑暗犬

step
    #label Claws
    #loop
    .goto 1420/0,655.12,2120.98,0
    .goto 1420/0,550.28,2315.28,50,0
    .goto 1420/0,622.58,2322.51,50,0
    .goto 1420/0,678.16,2319.80,50,0
    .goto 1420/0,716.12,2282.15,50,0
    .goto 1420/0,682.23,2218.58,50,0
    .goto 1420/0,670.48,2128.81,50,0
    .goto 1420/0,595.47,2134.53,50,0
    .goto 1420/0,613.54,2082.72,50,0
    .goto 1420/0,655.12,2120.98,50,0
    >>击杀|cRXP_ENEMY_腐烂的死者|r和|cRXP_ENEMY_破碎的尸体|r，拾取|cRXP_LOOT_腐烂的爪子|r
    .complete 404,1 --Putrid Claw (7)
    .mob 腐烂的死者
    .mob 破碎的尸体

step
    #label Gordo2
    #loop
    .goto 1420/0,496.96,2256.54,40,0
    .goto 1420/0,571.07,2251.42,40,0
    .goto 1420/0,660.09,2196.29,40,0
    .goto 1420/0,740.97,2112.24,40,0
    .goto 1420/0,824.57,2092.36,40,0
    .goto 1420/0,945.22,2127.00,40,0
    .goto 1420/0,1063.61,2201.710,40,0
    .goto 1420/0,1133.65,2177.31,40,0
    .goto 1420/0,1191.04,2198.10,40,0
    .goto 1420/0,1191.04,2198.10,0
    .goto 1420/0,496.96,2256.54,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_葛尔多|r
    >>|cRXP_WARN_他在布瑞尔的大路上巡逻（是个很大的缝合怪）|r
    >> |cRXP_WARN_选择“我要一份执行官塞加德的报告”|r
    .complete 99141,3 --|1/1 Gordo's Report
    .target 葛尔多
    --.gossipoption 142737

step
    #label GloomWeed
    #loop
    .goto 1420/0,1246.17,2311.97,0
    .goto 1420/0,1025.65,2110.43,0
    .goto 1420/0,1246.17,2311.97,50,0
    .goto 1420/0,1025.65,2110.43,50,0
    >>完成拾取地面上的 |cRXP_PICK_阴暗草|r
    .complete 5481,1 --Gloom Weed (3)

step << Priest
    #ah
    #completewith LesserMagicWand
    >>|cRXP_WARN_开始收集3组|r |T132889:0|t[亚麻布]|cRXP_WARN_，稍后用来制作|r |T135139:0|t[次级魔法杖]|cRXP_WARN_。|r
    >>|cRXP_WARN_如果不打算完成此步骤，或者打算以后去拍卖行买，请跳过此步|r
    .collect 2589,60 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #ssf
    #completewith LesserMagicWand
    >>|cRXP_WARN_开始收集3组|r |T132889:0|t[亚麻布]|cRXP_WARN_，稍后用来制作|r |T135139:0|t[次级魔法杖]|cRXP_WARN_。|r
    .collect 2589,60 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step
    #label Pumkpins
    #loop
    .goto 1420/0,1378.12,2328.54,0
    .goto 1420/0,1352.36,2265.88,50,0
    .goto 1420/0,1377.66,2328.54,50,0
    .goto 1420/0,1402.06,2359.27,50,0
    .goto 1420/0,1448.16,2336.67,50,0
    .goto 1420/0,1438.21,2303.84,50,0
    .goto 1420/0,1471.20,2283.65,50,0
    .goto 1420/0,1378.12,2328.54,50,0
    >>拾取田野中的|cRXP_LOOT_南瓜|r
    .complete 365,1 --Tirisfal Pumpkin (10)

step
    #completewith Tescort
    >>击杀|cRXP_ENEMY_血色战士|r
    >>|cRXP_WARN_小心，它们做出防御姿态动作后，招架几率会提高50%，持续8秒|r << Rogue/Warrior
    .complete 427,1 --Scarlet Warrior (10)
    .mob 血色战士

step
    .goto 1420/0,1587.700,2439.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴雷斯·晨石|r交谈（塔顶）
    >>|cRXP_WARN_这将触发一个护送任务|r
    >>|cRXP_WARN_小心！塔顶很容易同时引到3名|cRXP_ENEMY_血色战士|r|r
    .accept 99144,1 >>接任务：寻求庇护
    .target 巴雷斯·晨石

step
    #label Tescort
    .goto 1420/0,1268.000,2368.200
    >>护送|cRXP_FRIENDLY_巴雷斯·晨石|r离开索利登农场
    .complete 99144,1 --
    .target 巴雷斯·晨石

step
    #loop
    .goto 1420/0,1597.27,2290.28,0
    .goto 1420/0,1509.16,2351.13,50,0
    .goto 1420/0,1512.77,2299.02,50,0
    .goto 1420/0,1597.27,2290.28,50,0
    .goto 1420/0,1676.80,2316.79,50,0
    .goto 1420/0,1681.78,2354.14,50,0
    .goto 1420/0,1649.69,2405.66,50,0
    .goto 1420/0,1632.07,2436.690,50,0
    .goto 1420/0,1580.56,2487.00,50,0
    .goto 1420/0,1509.16,2473.14,50,0
    .goto 1420/0,1492.44,2395.11,50,0
    .goto 1420/0,1509.16,2351.13,50,0
    >>击杀|cRXP_ENEMY_血色战士|r
    >>|cRXP_WARN_小心，它们做出防御姿态动作后，招架几率会提高50%，持续8秒|r << Rogue/Warrior
    .complete 427,1 --Scarlet Warrior (10)
    .mob 血色战士

step
    #loop
    .goto 1420/0,1238.600,2424.900,0
    .goto 1420/0,1238.600,2424.900,60,0
    .goto 1420/0,1204.800,2543.000,60,0
    .goto 1420/0,1122.600,2396.800 ,60,0
    >>击杀|cRXP_ENEMY_黑暗犬|r，拾取|cRXP_LOOT_血液|r和|cRXP_LOOT_毛皮|r
    .complete 367,1 --Darkhound Blood (5)
    .complete 97558,2 --|6/6 Darkhound Hide
    .mob 衰老的黑暗犬

step
    #hardcore
    #completewith BrillTurnin1
    .hs >> 炉石回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,>0,1

step
    #hardcore
    #completewith BrillTurnin1
    .subzone 159 >> 返回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,<0

step
    #softcore
    #completewith BrillTurnin1
    .deathskip >> 死亡并在|cRXP_FRIENDLY_灵魂医者|r处复活

step
    #softcore
    #loop
    .goto 1420/0,425.56,2362.58,0
    .goto 1420/0,399.35,2337.270,30,0
    .goto 1420/0,425.56,2362.58,30,0
    .goto 1420/0,355.52,2429.76,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍兰德|r交谈
    >>|cRXP_WARN_他会在墓地周围巡逻|r
    .turnin 5481 >>交任务：葛尔多的任务
    .accept 5482 >>接任务：末日草
    .target 初级药剂师霍兰德

step
    #optional
    #completewith BrillTurnin1
    .use 286176 >>|cRXP_WARN_使用|r |T133490:0|t[执行官的“激励棒”]|cRXP_WARN_在布瑞尔及周边的|cRXP_FRIENDLY_亡灵卫兵|r身上|r
    .complete 99134,1 --|5/5 Deathguards motivated

step
    .goto 1420/0,403.300,2287.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_亡灵卫兵迪林格尔|r
    >> |cRXP_WARN_选择“我要一份执行官塞加德的报告”|r
    .turnin 404 >>交任务：腐烂的爪子
    .accept 426 >>接任务：磨坊告急
    .complete 99141,1 --|1/1 Dillinger's Report
    .target 亡灵卫兵迪林格尔
    .skipgossipid 142723

step
    .goto 1420/0,346.94,2258.950
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .turnin 367 >>交任务：新的瘟疫
    .turnin 365 >>交任务：悲伤之地
    .accept 368 >>接任务：新的瘟疫
    .accept 407 >>接任务：悲伤之地
    .target +药剂师乔汉

step
    .goto 1420/0,347.600,2265.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗莱·安尼斯|r交谈
    .accept 95314 >>接任务：影谷的绿色饮剂
    .target 卡罗莱·安尼斯
    .xp <7,1

step << Mage
    #label MetaBook
    >>拾取架子上的|cRXP_PICK_书籍|r
    .collect 208185,1 --The Apothecary's Metaphysical Primer (x1

step
    #optional
    #loop
    .goto 1420/0,290.400,2272.900,30,0
    .goto 1420/0,257.200,2239.500,30,0
    .goto 1420/0,313.400,2259.400,30,0
    .use 286176 >>|cRXP_WARN_使用|r |T133490:0|t[执行官的“激励棒”]|cRXP_WARN_在布瑞尔及周边的|cRXP_FRIENDLY_亡灵卫兵|r身上|r
    .complete 99134,1 --|5/5 Deathguards motivated

step
    #label BrillTurnin1
    .goto 1420/0,295.87,2277.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .turnin 427 >>交任务：与血色十字军的战争
    .accept 370 >>接任务：与血色十字军的战争
    .turnin 99141 >>交任务：耐心耗尽
    .turnin 99134 >>交任务：训诫
    .target 执行官塞加德

step
    #completewith Doomweed
    #optional
    .destroy 286176 >>|cRXP_WARN_摧毁|r |T133490:0|t[执行官的“激励棒”]|cRXP_WARN_，之后不再需要它|r

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在建筑内与|cRXP_FRIENDLY_伯吉斯|r交谈、查看|cRXP_FRIENDLY_通缉告示|r，再与|cRXP_FRIENDLY_塞弗伦|r交谈
    .accept 374 >>接任务：死亡证明
    .target +亡灵卫兵伯吉斯
    .goto 1420/0,280.06,2270.70
    .accept 398 >>接任务：悬赏：蛆眼
    .goto 1420/0,288.64,2285.46
    .accept 358 >>接任务：盗墓贼
    .target +执政官塞弗伦
    .goto 1420/0,265.15,2305.94

step << Paladin
    .goto 1420/0,311.600,2251.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎莉·斯迪威尔|r交谈
    .turnin 99144 >>交任务：寻求庇护
    .train 853 >>学习职业技能
    .target 莎莉·斯迪威尔
    .xp <8,1

step
    #optional << Paladin
    .goto 1420/0,311.900,2250.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎莉·斯迪威尔|r交谈
    .turnin 99144 >>交任务：寻求庇护
    .target 莎莉·斯迪威尔

step << Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
    .turnin 5650 >>交任务：黑暗之衣
    .train 591 >>学习 |T135924:0|t[惩击]
    .train 17 >>学习 |T135940:0|t[真言术:盾]
    .target 黑暗牧师贝里尔

step
    .goto 1420/0,236.68,2249.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    >>|cRXP_FRIENDLY_格莉丝|r|cRXP_WARN_在旅店二楼|r
    .accept 375 >>接任务：死亡之寒
    .target 格莉丝·戴玛

step << Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
    .train 139 >> 学习职业技能
    .target 黑暗牧师贝里尔
    .xp <8,1

step << Mage
    .goto 1420/0,233.06,2256.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .train 205 >> 学习职业技能
    .target 凯恩·火歌
    .xp <8,1

step << Warrior
    .goto 1420/0,238.49,2255.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 284 >> 学习职业技能
    .target 奥斯蒂尔·德·蒙
    .xp <8,1

step << Rogue
    .goto 1420/0,243.01,2271.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_马里恩·考尔|r交谈
    .train 6760 >> 学习职业技能
    .target 马里恩·考尔
    .xp <8,1

step << Warlock
    .goto 1420/0,250.24,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈
    .train 980 >> 学习职业技能
    .target 鲁伯特·鲍什
    .xp <8,1

step << Mage/Priest/Warlock
    .goto 1420/0,244.81,2269.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    .vendor >>|cRXP_BUY_尽量多购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（她有售）|r << Mage/Priest
    .vendor >>|cRXP_BUY_尽量多购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_（她有售）|r << Warlock
    .money <0.0125
    .target 旅店老板瑞尼

step
    .goto 1420/0,243.200,2288.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉|r交谈
    .train 2550 >>学习烹饪
    .turnin 96658 >>交任务：露营基础：烹饪
    .target 威廉·皮克曼

step << Rogue/Warrior
    .goto 1420/0,240.29,2246.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_妮拉|r交谈
    >>|cRXP_WARN_尽量利用等待时间（如等飞艇时）来制作这些物品|r
    .train 3273 >>学习 |T135966:0|t[急救]
    .target 妮拉

step << Rogue
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135641:0|t[卷刃的剑]的钱（3 银 81 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3

step << Rogue
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135641:0|t[卷刃的剑]|cRXP_BUY_。|r
    .collect 2494,1,367,1 --Collect Stiletto (1)
    .money <0.0381
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3

step << Rogue
    #optional
    #completewith Doomweed
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3

step << Warrior
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135321:0|t[步兵剑]的钱（5 银 10 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
    .train 201,3

step << Warrior
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135321:0|t[步兵剑]|cRXP_BUY_。|r
    .collect 2488,1 --Collect Gladius (1)
    .money <0.0510
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
    .train 201,3

step << Warrior
    #optional
    #completewith Doomweed
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
    .train 201,3

step << Paladin
    .goto 1420/0,311.600,2250.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎莉·斯迪威尔|r交谈
    .train 679 >>学习|T626003:0|t[神圣打击]
    .target 莎莉·斯迪威尔
    .xp <6,1

step << Paladin
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >> 出售杂物。如果卖掉武器就能凑够购买 |T133053:0|t[木槌棒] 的钱（6银 66铜），就卖掉它；钱还不够则稍后再回来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9

step << Paladin
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈后，向他购买一把|r |T133053:0|t[木槌棒]|cRXP_BUY_。|r
    .collect 2493,1,367,1 --Collect Wooden Mallet (1)
    .money <0.0666
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9

step << Paladin
    #optional
    #completewith Doomweed
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9

step
    .goto 1420/0,270.12,2253.23--c:Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_温特斯夫人|r交谈
    >>|cRXP_BUY_购买一个|r |T133634:0|t[棕色小包]|cRXP_BUY_（从|r|cRXP_FRIENDLY_她|r处）
    .collect 4496,1,5482,1 --Small Brown Pouch (1)
    .target 温特斯夫人
    .money <0.05

step
    #hardcore
    #loop
    .goto 1420/0,425.56,2362.58,0
    .goto 1420/0,399.35,2337.270,30,0
    .goto 1420/0,425.56,2362.58,30,0
    .goto 1420/0,355.52,2429.76,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍兰德|r交谈
    >>|cRXP_WARN_他会在墓地周围巡逻|r
    .turnin 5481 >>交任务：葛尔多的任务
    .accept 5482 >>接任务：末日草
    .target 初级药剂师霍兰德

step << Rogue/Warrior
    #optional
    #loop
    .goto 1420/0,482.50,1951.07,0
    .goto 1420/0,403.42,2085.73,50,0
    .goto 1420/0,413.36,1979.99,50,0
    .goto 1420/0,482.50,1951.07,50,0
    .goto 1420/0,560.22,1901.06,50,0
    .goto 1420/0,645.63,1961.92,50,0
    .goto 1420/0,750.46,1993.55,50,0
    .goto 1420/0,869.76,2003.79,50,0
    .goto 1420/0,950.64,2039.040,50,0
    .goto 1420/0,1068.13,1975.47,50,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_皮毛|r和|cRXP_LOOT_翼膜|r
    .complete 375,1 --Duskbat Pelt (5)
    .complete 97558,1 --|8/8 Duskbat Wing Membrane
    .disablecheckbox
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .xp >7+3960,1

step << Rogue/Warrior
    #optional
    #label DuskbatTrophy1
    #loop
    .goto 1420/0,482.50,1951.07,0
    .goto 1420/0,403.42,2085.73,50,0
    .goto 1420/0,413.36,1979.99,50,0
    .goto 1420/0,482.50,1951.07,50,0
    .goto 1420/0,560.22,1901.06,50,0
    .goto 1420/0,645.63,1961.92,50,0
    .goto 1420/0,750.46,1993.55,50,0
    .goto 1420/0,869.76,2003.79,50,0
    .goto 1420/0,950.64,2039.040,50,0
    .goto 1420/0,1068.13,1975.47,50,0
    .xp 7+3260 >> 刷怪至 3260+/4500 经验值
    --XX 700 (375)+540 (367)

step << Rogue/Warrior
    #optional
    .goto 1420/0,275.54,2260.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔·沙伊尔|r交谈
    >>|cRXP_BUY_购买一卷|r |T132891:0|t[粗线]|cRXP_BUY_（从她那里）|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375

step << Rogue/Warrior
    #optional
    .goto 1420/0,236.68,2249.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375

step << Warrior
    .goto 1420/0,238.49,2255.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 284 >> 学习职业技能
    .target 奥斯蒂尔·德·蒙
    .xp <8,1

step << Rogue
    .goto 1420/0,243.01,2271.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_马里恩·考尔|r交谈
    .train 6760 >> 学习职业技能
    .target 马里恩·考尔
    .xp <8,1

step << Rogue
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135641:0|t[卷刃的剑]的钱（3 银 81 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3

step << Rogue
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135641:0|t[卷刃的剑]|cRXP_BUY_。|r
    .collect 2494,1,398,1 --Collect Stiletto (1)
    .money <0.0381
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3

step << Rogue
    #optional
    #completewith Doomweed
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3

step << Warrior
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135321:0|t[步兵剑]的钱（5 银 10 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
    .train 201,3

step << Warrior
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135321:0|t[步兵剑]|cRXP_BUY_。|r
    .collect 2488,1 --Collect Gladius (1)
    .money <0.0510
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
    .train 201,3

step << Warrior
    #optional
    #completewith Doomweed
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
    .train 201,3

step
    #completewith next
    >>拾取地上的|cRXP_PICK_末日草|r
    >>|cRXP_WARN_它们分布在豺狼人区域的树下|r
    .complete 5482,1 --Doom Weed (10)
    .isOnQuest 5482

step
    #loop
    .goto 1420/0,537.18,2555.98,0
    .goto 1420/0,488.83,2642.44,40,0
    .goto 1420/0,561.13,2596.65,40,0
    .goto 1420/0,597.73,2514.11,40,0
    .goto 1420/0,537.18,2555.98,40,0
    .goto 1420/0,483.40,2514.41,40,0
    >>击杀|cRXP_ENEMY_腐皮盗墓贼|r，拾取|cRXP_LOOT_防腐剂|r
    .complete 358,1 --Rot Hide Graverobber (8)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob 腐皮盗墓贼

step
    #completewith next
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r，拾取|cRXP_LOOT_防腐剂|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob 混血腐皮豺狼人

step
    #label Doomweed
    #loop
    .goto 1420/0,435.96,2754.51,0
    .goto 1420/0,426.92,2802.10,30,0
    .goto 1420/0,437.31,2754.20,30,0
    .goto 1420/0,467.14,2699.08,30,0
    .goto 1420/0,500.57,2669.85,30,0
    .goto 1420/0,543.95,2670.46,30,0
    .goto 1420/0,536.72,2627.68,30,0
    .goto 1420/0,562.48,2568.63,30,0
    .goto 1420/0,534.92,2587.01,30,0
    .goto 1420/0,476.62,2572.55,30,0
    .goto 1420/0,399.35,2544.23,30,0
    .goto 1420/0,374.95,2612.01,30,0
    .goto 1420/0,396.19,2676.18,30,0
    .goto 1420/0,435.96,2754.51,30,0
    >>拾取地上的|cRXP_PICK_末日草|r
    >>|cRXP_WARN_它们分布在豺狼人区域的树下|r
    .complete 5482,1 --Doom Weed (10)
    .isOnQuest 5482

step
    #completewith MaggotEye
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r，拾取|cRXP_LOOT_防腐剂|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob 混血腐皮豺狼人

step
    #label MaggotEye
    .goto 1420/0,382.63,2910.55
    >>击杀|cRXP_ENEMY_蛆眼|r，获取|cRXP_LOOT_蛆眼的爪子|r
    .complete 398,1 --Maggot Eye's Paw (1)
    .mob 蛆眼

step
    #loop
    .goto 1420/0,332.48,2862.35,0
    .goto 1420/0,380.38,2768.97,50,0
    .goto 1420/0,332.48,2862.35,50,0
    .goto 1420/0,401.16,2895.19,50,0
    .goto 1420/0,318.47,2696.36,50,0
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r，拾取|cRXP_LOOT_防腐剂|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob 混血腐皮豺狼人

step
    #loop
    .goto 1420/0,332.48,2862.35,0
    .goto 1420/0,380.38,2768.97,50,0
    .goto 1420/0,332.48,2862.35,50,0
    .goto 1420/0,401.16,2895.19,50,0
    .goto 1420/0,318.47,2696.36,50,0
    >>击杀|cRXP_ENEMY_腐皮豺狼人|r，拾取|cRXP_LOOT_防腐剂|r
    .complete 358,3 --Embalming Ichor (8)
    .mob 混血腐皮豺狼人
    .mob 腐皮豺狼人
    .mob 腐皮盗墓贼

step
    #label MurlocVins
    #loop
    .goto 1420/0,342.87,2998.22,0
    .goto 1420/0,350.10,2962.37,50,0
    .goto 1420/0,342.87,2998.22,50,0
    .goto 1420/0,293.16,2974.12,50,0
    .goto 1420/0,254.75,2951.820,50,0
    .goto 1420/0,188.33,2950.02,50,0
    .goto 1420/0,65.42,2927.12,50,0
    .goto 1420/0,-15.92,2964.78,50,0
    .goto 1420/0,-49.36,3040.39,50,0
    >>击杀|cRXP_ENEMY_邪鳍鱼人|r，拾取|cRXP_LOOT_鳞片|r和|cRXP_LOOT_鱼人皮|r
    >>|cRXP_ENEMY_邪鳍污水鱼人|r|cRXP_WARN_不会掉落|r|cRXP_LOOT_邪鳍鱼人皮|r
    .complete 368,1 --Vile Fin Scale (5)
    .complete 97558,3 --|3/3 Vile Fin Murloc Skin
    .mob 邪鳍污水鱼人
    .mob 邪鳍先知
    .mob 邪鳍泥浆鱼人

step
    #loop
    .goto 1420/0,138.300,2829.600,0
    .goto 1420/0,138.300,2829.600,50,0
    .goto 1420/0,121.200,2727.400,50,0
    .goto 1420/0,127.500,2601.800,50,0
    .goto 1420/0,211.400,2545.500,50,0
    .goto 1420/0,146.300,2408.000,50,0
    .goto 1420/0,94.600,2312.100,50,0
    .goto 1420/0,39.900,2248.100,50,0
    .goto 1420/0,-137.100,2206.000,50,0
    .goto 1420/0,-190.800,2387.700,50,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_皮毛|r和|cRXP_LOOT_翼膜|r
    .complete 375,1 --Duskbat Pelt (5)
    .complete 97558,1 --|8/8 Duskbat Wing Membrane
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠

step
    #completewith Brill3
    .hs >> 炉石回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,>0,1

step
    #completewith Brill3
    .subzone 159 >> 返回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,<0

step << skip
    #softcore
    #completewith Brill3
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活

step
    .goto 1420/0,244.36,2262.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼·法席恩|r交谈
    .accept 354 >>接任务：阿加曼德家族
    .accept 362 >>接任务：闹鬼的磨坊
    .target 库勒曼·法席恩

step
    .goto 1420/0,275.54,2260.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔·沙伊尔|r交谈
    >>|cRXP_BUY_购买一卷|r |T132891:0|t[粗线]|cRXP_BUY_（从她那里）|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .isQuestAvailable 375

step
    .goto 1420/0,295.87,2277.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .turnin 398 >>交任务：悬赏：蛆眼
    .target 执行官塞加德

step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .turnin 358 >>交任务：盗墓贼
    .accept 405 >>接任务：流浪的巫妖 << Mage/Warlock
    .accept 359 >>接任务：亡灵卫兵的职责
    .target 执政官塞弗伦

step
    .goto 1420/0,236.68,2249.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375

step << Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
    .train 139 >> 学习职业技能
    .target 黑暗牧师贝里尔
    .xp <8,1

step << Mage
    .goto 1420/0,233.06,2256.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .train 205 >> 学习职业技能
    .target 凯恩·火歌
    .xp <8,1

step << Warrior
    .goto 1420/0,238.49,2255.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 284 >> 学习职业技能
    .target 奥斯蒂尔·德·蒙
    .xp <8,1

step << Rogue
    .goto 1420/0,243.01,2271.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_马里恩·考尔|r交谈
    .train 6760 >> 学习职业技能
    .target 马里恩·考尔
    .xp <8,1

step << Warlock
    .goto 1420/0,250.24,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈
    .train 980 >> 学习职业技能
    .target 鲁伯特·鲍什
    .xp <8,1

step << Rogue/Warrior
    .goto 1420/0,240.29,2246.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_妮拉|r交谈
    >>|cRXP_WARN_尽量利用等待时间（如等飞艇时）来制作这些物品|r
    .train 3273 >>学习 |T135966:0|t[急救]
    .target 妮拉

step
    #label Brill3
    .goto 1420/0,244.81,2269.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（她有售）|r << Mage/Priest/Paladin
    >>|cRXP_BUY_购买|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_（她有售）|r << Warrior/Rogue
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_（她有售）|r << Warlock
    .collect 1179,20,426,1 << Mage/Priest/Paladin --Ice Cold Milk (20)
    .collect 4605,20,426,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,10,426,1 << Warlock --Ice Cold Milk (10)
    .collect 4605,10,426,1 << Warlock --Red-speckled Mushroom (10)
    .money <0.025 << Warrior/Rogue
    .money <0.0375 << Mage/Priest/Warlock/Paladin
    .target 旅店老板瑞尼

step << Paladin
    .goto 1420/0,311.600,2251.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎莉·斯迪威尔|r交谈
    .train 853 >>学习职业技能
    .target 莎莉·斯迪威尔
    .xp <8,1

step << Rogue
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135641:0|t[卷刃的剑]的钱（3 银 81 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3

step << Rogue
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135641:0|t[卷刃的剑]|cRXP_BUY_。|r
    .collect 2494,1,354,1 --Collect Stiletto (1)
    .money <0.0381
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3

step << Rogue
    #optional
    #completewith MillsOverun
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3

step << Warrior
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >> 出售杂物。如果卖掉武器后能凑够购买 |T135321:0|t[步兵剑]的钱（5 银 10 铜），就把武器也卖掉。暂时不够时，稍后再来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
    .train 201,3

step << Warrior
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135321:0|t[步兵剑]|cRXP_BUY_。|r
    .collect 2488,1 --Collect Gladius (1)
    .money <0.0510
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
    .train 201,3

step << Warrior
    #optional
    #completewith MillsOverun
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
    .train 201,3

step << Paladin
    .goto 1420/0,311.600,2250.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎莉·斯迪威尔|r交谈
    .train 679 >>学习|T626003:0|t[神圣打击]
    .target 莎莉·斯迪威尔
    .xp <6,1

step << Paladin
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >> 出售杂物。如果卖掉武器就能凑够购买 |T133053:0|t[木槌棒] 的钱（6银 66铜），就卖掉它；钱还不够则稍后再回来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9

step << Paladin
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈后，向他购买一把|r |T133053:0|t[木槌棒]|cRXP_BUY_。|r
    .collect 2493,1,354,1 --Collect Wooden Mallet (1)
    .money <0.0666
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9

step << Paladin
    #optional
    #completewith MillsOverun
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9

step << skip --Rogue/Warrior
    #softcore
    .goto 1420/0,308.08,2246.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莉莎·考伦|r交谈
    .vendor >>修理武器
    .target 伊莉莎·考伦

step
    .goto 1420/0,76.000,2026.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_舍伦尼·洛巴尔特|r交谈
    .turnin 97558 >>交任务：被遗忘者的皮
    .target 舍伦尼·洛巴尔特

step
    .goto 1420/0,74.00,2022.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵林奈|r交谈
    .turnin 359 >>交任务：亡灵卫兵的职责
    .accept 360 >>接任务：向塞弗伦回报
    .accept 356 >>接任务：巡查后方
    .target 亡灵卫兵林奈

step
    .goto 1420/0,346.94,2258.950
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .turnin 368 >>交任务：新的瘟疫
    .accept 369 >>接任务：新的瘟疫
    .target 药剂师乔汉

step
    #label DoomedWeed
    #loop
    .goto 1420/0,425.56,2362.58,0
    .goto 1420/0,399.35,2337.270,30,0
    .goto 1420/0,425.56,2362.58,30,0
    .goto 1420/0,355.52,2429.76,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍兰德|r交谈
    >>|cRXP_WARN_他会在墓地周围巡逻|r
    .turnin 5482 >>交任务：末日草
    .accept 99142 >>接任务：墓穴杂草
    .target 初级药剂师霍兰德

step
    #label AgamandStart
    .goto 1420/0,882.41,2511.1,100,0
    .goto 1420/0,892.80,2520.74
    .subzone 157 >> 向西北前往阿加曼德磨坊
    .isOnQuest 362

step
    #completewith ThurmanGregor
    >>|T134939:0|t[|cRXP_LOOT_给伊维特的信|r]|cRXP_WARN_可能由这些怪物掉落；若获得，请接取对应任务|r
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >> 接任务：未寄出的信件
    .use 2839

step
    #completewith ThurmanGregor
    >>击杀|cRXP_ENEMY_断骨士兵和碎颅士兵|r和|cRXP_ENEMY_暗眼骷髅法师|r，拾取|cRXP_LOOT_锯齿肋骨|r和|cRXP_LOOT_焦黑的颅骨|r
    .complete 426,1 --Notched Rib (5)
    .mob +断骨士兵
    .mob +碎颅士兵
    .complete 426,2 --Blackened Skull (3)
    .mob +暗眼骷髅法师

step
    #label KillDevlin
    .goto 1420/0,894.16,2609.00
    >>击杀|cRXP_ENEMY_代弗林|r，获取|cRXP_LOOT_代弗林的遗骸|r
    .complete 362,1 --Devlin's Remains (1)
    .mob 代弗林·阿加曼德

step
    .goto 1420/0,803.78,2752.40
    >>击杀|cRXP_ENEMY_妮萨|r，拾取|cRXP_LOOT_妮萨的残骸|r。她可能在建筑物内
    .complete 354,2 --Nissa's Remains (1)
    .mob 妮萨·阿加曼德

step
    #label ThurmanGregor
    #loop
    .goto 1420/0,996.28,2899.11,0
    .goto 1420/0,1058.19,2775.59,60,0
    .goto 1420/0,998.54,2903.93,60,0
    .goto 1420/0,919.01,2939.770,60,0
    .goto 1420/0,1098.40,2875.61,60,0
    .goto 1420/0,1098.40,2875.61,60,0
    .goto 1420/0,996.28,2899.11,60,0
    >>击杀|cRXP_ENEMY_萨尔曼|r和|cRXP_ENEMY_格里高|r，拾取|cRXP_LOOT_遗骸|r
    >>|cRXP_WARN_他们可能会在周围巡逻|r
    .complete 354,3 --Thurman's Remains (1)
    .unitscan +萨尔曼·阿加曼德
    .complete 354,1 --Gregor's Remains (1)
    .unitscan +格里高·阿加曼德

step
    #label MillsOverun
    #loop
    .goto 1420/0,996.28,2899.11,0
    .goto 1420/0,1058.19,2775.59,60,0
    .goto 1420/0,998.54,2903.93,60,0
    .goto 1420/0,919.01,2939.770,60,0
    .goto 1420/0,1098.40,2875.61,60,0
    .goto 1420/0,1098.40,2875.61,60,0
    .goto 1420/0,996.28,2899.11,60,0
    >>击杀|cRXP_ENEMY_断骨士兵和碎颅士兵|r和|cRXP_ENEMY_暗眼骷髅法师|r，拾取|cRXP_LOOT_锯齿肋骨|r和|cRXP_LOOT_焦黑的颅骨|r
    .complete 426,1 --Notched Rib (5)
    .mob +断骨士兵
    .mob +碎颅士兵
    .complete 426,2 --Blackened Skull (3)
    .mob +暗眼骷髅法师

step
    #optional
    #loop
    .goto 1420/0,857.56,2793.97,60,0
    .goto 1420/0,880.15,2884.04,60,0
    .goto 1420/0,953.35,2926.22,60,0
    .goto 1420/0,1025.2,2908.44,60,0
    .goto 1420/0,1040.56,2793.07,60,0
    .goto 1420/0,918.56,2780.11,60,0
    .goto 1420/0,953.35,2926.22,60,0
    .xp 9+3840 >> 刷怪至 3840+/6500 经验值
    .itemcount 2839,<1 --A Letter to Yvette (0)

step
    #optional
    #loop
    .goto 1420/0,857.56,2793.97,60,0
    .goto 1420/0,880.15,2884.04,60,0
    .goto 1420/0,953.35,2926.22,60,0
    .goto 1420/0,1025.2,2908.44,60,0
    .goto 1420/0,1040.56,2793.07,60,0
    .goto 1420/0,918.56,2780.11,60,0
    .goto 1420/0,953.35,2926.22,60,0
    .xp 9+3360 >> 刷怪至3360+/6500经验值
    .itemcount 2839,1 --A Letter to Yvette (1)

step
    #hardcore
    #completewith FoodandWater2
    .subzone 159 >> 返回布瑞尔

step
    #softcore
    #completewith FoodandWater2
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .xp <10,1

step
    #softcore
    #completewith FoodandWater2
    .subzone 159 >> 返回布瑞尔
    .xp >10,1

step
    .goto 1420/0,403.42,2287.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈
    .turnin 426 >>交任务：磨坊告急
    .target 亡灵卫兵迪林格尔

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊维特|r和|cRXP_FRIENDLY_库勒曼|r交谈
    .turnin 361 >>交任务：未寄出的信件
    .target +伊维特·法席恩
    .goto 1420/0,250.69,2252.920
    .turnin 354 >>交任务：阿加曼德家族
    .turnin 362 >>交任务：闹鬼的磨坊
    .accept 355 >>接任务：与塞弗伦交谈
    .target +库勒曼·法席恩
    .goto 1420/0,244.36,2262.26
    .isOnQuest 361

step
    .goto 1420/0,244.36,2262.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼·法席恩|r交谈
    .turnin 354 >>交任务：阿加曼德家族
    .turnin 362 >>交任务：闹鬼的磨坊
    .accept 355 >>接任务：与塞弗伦交谈
    .target 库勒曼·法席恩

step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .turnin 360 >>交任务：向塞弗伦回报
    .turnin 355 >>交任务：与塞弗伦交谈
    .target 执政官塞弗伦
    .xp >10,1 --turnin later if lvl 10 already

step << Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
    .trainer >> 学习职业技能
    .target 黑暗牧师贝里尔

step << Warrior
    #optional
    .abandon 1505 >>放弃任务[老兵犹塞克]
    .isOnQuest 1505

step << Warrior
    #optional
    .abandon 1498 >>放弃任务[防御之道]
    .isOnQuest 1498

step << Warrior
    .goto 1420/0,238.49,2254.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .trainer >> 学习职业技能
    .accept 1818 >> 接任务：迪林格尔
    .target 奥斯蒂尔·德·蒙 << Warrior
    .isQuestAvailable 1498

step << Warlock
    .goto 1420/0,248.88,2251.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_埃格隆|r交谈
    .accept 1478 >> 接任务：哈加尔的召唤
    .target 埃格隆·卡加尔

step << Warlock
    .goto 1420/0,250.24,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈
    .train 707 >> 学习职业技能
    .target 鲁伯特·鲍什

step << Rogue
    .goto 1420/0,243.01,2270.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_马里恩·考尔|r交谈
    .trainer >> 学习职业技能
    .accept 1885 >>接任务：米奈特·卡加德
    .target 马里恩·考尔

step << Mage
    .goto 1420/0,233.52,2256.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .accept 1881 >> 接任务：安娜斯塔西娅
    .target 凯恩·火歌

step
    #label FoodandWater2
    .goto 1420/0,244.81,2269.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（她有售）|r << Mage/Priest/Shaman/Paladin
    >>|cRXP_BUY_购买|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_（她有售）|r <<Warrior/Rogue
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_（她有售）|r << Warlock
    .collect 1179,20,370,1 << Mage/Priest/Shaman/Paladin --Ice Cold Milk (20)
    .collect 4605,20,370,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,15,370,1 << Warlock --Ice Cold Milk (15)
    .collect 4605,15,370,1 << Warlock --Red-speckled Mushroom (15)
    .money <0.075 << Warlock
    .money <0.05 << !Warlock
    .target 旅店老板瑞尼

step << Warrior
    .goto 1420/0,403.87,2287.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈
    .turnin 1818 >> 交任务：迪林格尔
    .accept 1819 >> 接任务：切割者奥拉格
    .target 亡灵卫兵迪林格尔
    .isQuestAvailable 1498

step << Warrior
    .goto 1420/0,360.04,2376.14
    >>|cRXP_WARN_点击地面上的骷髅头，以召唤|r|cRXP_ENEMY_切割者奥拉格|r。|cRXP_WARN_击杀他|r
    .complete 1819,1 --Ulag the Cleaver (1)
    .mob 切割者奥拉格

step << Warrior
    .goto 1420/0,403.87,2287.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈
    .turnin 1819 >> 交任务：切割者奥拉格
    .accept 1820 >> 接任务：库勒曼
    .target 亡灵卫兵迪林格尔

step
    .goto 1420/0,254.600,2225.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵特伦斯|r交谈
    .accept 96895 >>接任务：银色使者
    .target 亡灵卫兵特伦斯

step << Paladin
    .goto 1420/0,311.600,2251.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎莉·斯迪威尔|r交谈
    .accept 91282 >>接任务：第二个家
    .trainer >>学习职业技能
    .target 莎莉·斯迪威尔

step << Warlock
    #completewith next
    .goto 1420/0,240.75,1877.57,20 >> 进入幽暗城
    .zoneskip Undercity

step << Warlock
    #completewith next
    .goto 1458/0,239.14,1749.54,35,0
    .goto 1458/0,255.64,1724.70,35,0
    .goto 1458/0,240.68,1706.97,10,0
    .goto 1458/0,241.06,1660.12,10,0
    .goto 1458/0,257.08,1623.38,10,0
    .goto 1458/0,244.51,1598.73,15 >> 乘坐升降梯下到幽暗城

step << Warlock
    .goto 1458/0,57.05,1711.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_凯伦丁·哈加尔|r交谈
    .turnin 1478 >> 交任务：哈加尔的召唤
    .accept 1473 >> 接任务：虚空中的生物

step << Warlock
    .goto 1458/0,66.74,1766.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区里的|cRXP_FRIENDLY_比索|r交谈
    .turnin 405 >>交任务：流浪的巫妖
    --.accept 357 >>Accept The Lich's Identity
    .target 比索·埃斯沙德

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
    .zone Tirisfal Glades >> 从幽暗城下水道离开
    .zoneskip Tirisfal Glades

step << Warlock
    #completewith next
    .goto 1420/0,726.06,1801.95
    >>打开地上的|cRXP_PICK_派瑞恩的箱子|r，拾取 |T133733:0|t[埃加林的魔典]
    .complete 1473,1 --Egalin's Grimoire (1)

step
    #label ScarletCrusade1
    #loop
    .goto 1420/0,770.80,1762.79,40,0
    .goto 1420/0,763.57,1820.93,40,0
    .goto 1420/0,721.54,1857.38,40,0
    .goto 1420/0,694.88,1848.04,40,0
    .goto 1420/0,641.56,1800.45,40,0
    .goto 1420/0,651.05,1748.93,40,0
    .goto 1420/0,685.39,1741.70,40,0
    .goto 1420/0,727.42,1742.31,40,0
    >>击杀|cRXP_ENEMY_派瑞恩队长|r、|cRXP_ENEMY_血色狂热者|r和|cRXP_ENEMY_血色传教士|r，拾取|cRXP_LOOT_血色十字军徽记之戒|r
    .complete 370,1 --Captain Perrine (1)
    .mob +派瑞恩队长
    .complete 370,2 --Scarlet Zealot (3)
    .mob +血色狂热者
    .complete 370,3 --Scarlet Missionary (3)
    .mob +血色传教士
    .complete 374,1 --Scarlet Insignia Ring (10)
    .disablecheckbox

step << Warlock
    .goto 1420/0,726.06,1801.95
    >>打开地上的|cRXP_PICK_派瑞恩的箱子|r，拾取 |T133733:0|t[埃加林的魔典]
    .complete 1473,1 --Egalin's Grimoire (1)

step << !Priest
    #completewith LogoutSkip1
    .goto 1458/0,714.8,1604.24,35,0
    .goto 1458/0,652.73,1623.44,35,0
    .goto 1458/0,634.02,1669.66,35,0
    .goto 1458/0,539.52,1665.17,10,0
    .goto 1458/0,481.48,1659.8,10,0
    .goto 1458/0,476.49,1632.15,10,0
    .goto 1458/0,439.08,1627.02,10,0
    .goto 1458/0,435.05,1598.86,10,0
    .zone Undercity >> 从下水道进入幽暗城
    .zoneskip Undercity

step << Rogue
    .goto 1458/0,323.57,1668.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与军事区的|cRXP_FRIENDLY_阿基巴德|r交谈
    .train 201 >>学习单手剑（1h）
    .target 阿基巴德

step << Warrior/Rogue
    .goto 1458/0,335.37,1638.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗姆|r交谈
    .train 2575 >> 学习专业技能：|T136248:0|t[采矿]
    >>|cRXP_WARN_可从矿点采集|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_，用于制作|r |T135248:0|t[磨刀石]|cRXP_WARN_（武器伤害提高2点，持续30分钟）|r
    .target 布罗姆·基里安

step << Warrior/Rogue
    .goto 1458/0,329.04,1641.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎拉|r交谈
    >>|cRXP_BUY_购买一把|r |T134708:0|t[矿工锄]|cRXP_BUY_（向|r|cRXP_FRIENDLY_莎拉|r购买）
    .collect 2901,1,371,1 --Mining Pick (1)
    .target 莎拉·基里安
    .train 2575,3 --Mining Trained

step << Warrior/Rogue
    .goto 1458/0,295.94,1691.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴兹尔·弗莱伊|r交谈
    .train 2018 >> 学习|T136241:0|t[锻造]
    .target 巴兹尔·弗莱伊
    .train 2575,3 --Mining Trained

step << Warlock
    .goto 1458/0,57.05,1711.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_凯伦丁·哈加尔|r交谈
    .turnin 1473 >> 交任务：虚空中的生物
    .accept 1471 >> 接任务：誓缚
    .target 凯伦丁·哈加尔

step << Warlock
    #completewith next
    .cast 9221 >>|cRXP_WARN_使用|r |T134416:0|t[召唤符文]|cRXP_WARN_（在召唤法阵处）|r
    .use 6284

step << Warlock
    .goto 1458/0,41.99,1704.480
    >>击杀召唤出的|cRXP_ENEMY_虚空行者|r
    .complete 1471,1 --Kill Summoned Voidwalker (1)
    .mob 虚空行者
    .use 6284

step << Warlock
    .goto 1458/0,57.34,1711.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_凯伦丁·哈加尔|r交谈
    .turnin 1471 >>交任务：誓缚
    .target 凯伦丁·哈加尔

step << Warrior
    #ssf
    .goto 1458/0,133.71,1561.730
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135350:0|t[优质重剑]|cRXP_BUY_。|r
    .collect 1198,1,371,1 --Collect Claymore (1)
    .money <0.2543
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target 查尔斯·希顿

step << Warrior
    #ah
    .goto 1458/0,133.71,1561.730
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135350:0|t[优质重剑]|cRXP_BUY_。|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的替代品|r
    .collect 1198,1,371,1 --Collect Claymore (1)
    .money <0.2543
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target 查尔斯·希顿

step << Warrior
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_装备|r |T135350:0|t[优质重剑]
    .use 1198
    .itemcount 1198,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0

step << Rogue
    #ssf
    .goto 1458/0,133.71,1561.730
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_（向他购买）|r
    .collect 851,1,371,1 --Collect Cutlass (1)
    .money <0.1922
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 查尔斯·希顿

step << Rogue
    #ah
    .goto 1458/0,133.71,1561.730
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_（向他购买）|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的替代品|r
    .collect 851,1,371,1 --Collect Cutlass (1)
    .money <0.1922
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 查尔斯·希顿

step << Rogue
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_装备|r |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8

step << Rogue
    .goto 1458/0,129.68,1560.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_纳撒尼尔·斯蒂恩维克|r交谈
    >>|cRXP_BUY_向他购买|r |T135425:0|t[锋利的飞刀]|cRXP_BUY_。|r
    .collect 3107,1 --Keen Throwing Knife (200)
    .target 纳撒尼尔·斯蒂恩维克
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .money <0.184
    >>无限版只需购买1把投掷武器，不必补足200把；现有武器足够或钱不足时可以跳过

step << Rogue
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_记得在11级时装备|r |T135425:0|t[锋利的飞刀] |cRXP_WARN_|r
    .use 3107
    .itemcount 3107,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp >11,1

step << Rogue
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1

step << Rogue
    .goto 1458/0,71.92,1435.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特·卡加德|r交谈
    .turnin 1885 >>交任务：米奈特·卡加德
    .accept 1886 >>接任务：亡灵哨兵
    .target 米奈特·卡加德

step << Mage
    .goto 1458/0,168.600,1662.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧文·萨德|r交谈
    .turnin 79095 >>交任务 药剂师的超自然读本
    .target 欧文·萨德
    .itemcount 208185,1

step << Mage
    #optional
    .abandon 1883 >> 放弃任务: [安苏瓦], 否则接不到后面的任务
    .isOnQuest 1883

step << Mage
    .goto 1458/0,56.57,1813.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .turnin 1881 >> 交任务：安娜斯塔西娅
    .accept 1882 >> 接任务：巴尼尔农场
    .target 安娜斯塔西娅·哈特威尔

step << Mage
    .goto 1458/0,66.74,1766.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区里的|cRXP_FRIENDLY_比索|r交谈
    .turnin 405 >>交任务：流浪的巫妖
    --.accept 357 >>Accept The Lich's Identity
    .target 比索·埃斯沙德

step << Paladin
    #label UCHome
    .goto 1458/0,223.31,1634.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺曼|r交谈
    .home >> 将炉石绑定在幽暗城
    .target 旅店老板诺曼
    .bindlocation 1497

step
    #optional
    #label LogoutSkip1

step << skip
    .goto 1458/0,59.07,1747.75
    .goto 1458/0,221.78,1780.14,30 >>|cRXP_WARN_在魔法区进行登出跳点：站在最下层楼梯的顶端，调整位置至角色看起来悬空，然后登出并重新登录|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >> |cRXP_WARN_点击此处观看示范|r
    >>|cRXP_WARN_如果无法完成这次登出跳点，就正常跑出幽暗城|r

step << !Priest
    #completewith AtWarS
    .goto 1420/0,235.32,1883.89
    .zone Tirisfal Glades >> 离开幽暗城
    .zoneskip Tirisfal Glades

step << Undead Rogue
    #sticky
    #completewith ArriveBalnir
    >>|cRXP_WARN_如果看到|r|cRXP_FRIENDLY_阿斯托|r|cRXP_WARN_，就与他交谈并击杀他，从他身上拾取信件。他会在布瑞尔与瑟伯切尔之间的道路上巡逻|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan 阿斯托·哈德恩
    .isOnQuest 1886

step
    #optional
    .goto 1420/0,280.06,2270.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯吉斯|r交谈
    .turnin 374 >>交任务：死亡证明
    .target 亡灵卫兵伯吉斯
    .isQuestComplete 374

step
    #label AtWarS
    .goto 1420/0,295.87,2277.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .turnin 370 >>交任务：与血色十字军的战争
    .accept 371 >>接任务：与血色十字军的战争
    .target 执行官塞加德

step
    .goto 1420/0,270.12,2253.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_温特斯夫人|r交谈
    >>|cRXP_BUY_购买一个|r |T133634:0|t[棕色小包]|cRXP_BUY_（从|r|cRXP_FRIENDLY_她|r处）
    .collect 4496,1,356,1 --Small Brown Pouch (1)
    .target 温特斯夫人
    .money <0.05

step << Warrior
    .goto 1420/0,244.36,2262.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼·法席恩|r交谈
    .turnin 1820 >>交任务：库勒曼
    .target 库勒曼·法席恩

step
    #label Brill33
    .goto 1420/0,244.81,2269.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（她有售）|r << Mage/Priest/Paladin
    >>|cRXP_BUY_购买|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_（她有售）|r << Warrior/Rogue
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_（她有售）|r << Warlock
    .collect 1179,20,96898,1 << Mage/Priest/Paladin --Ice Cold Milk (20)
    .collect 4605,20,96898,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,10,96898,1 << Warlock --Ice Cold Milk (10)
    .collect 4605,10,96898,1 << Warlock --Red-speckled Mushroom (10)
    .money <0.025 << Warrior/Rogue
    .money <0.0375 << Mage/Priest/Warlock/Paladin
    .target 旅店老板瑞尼

step
    .goto 1420/0,54.600,1996.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈德里克·哈尔森|r交谈
    .turnin 96895 >>交任务：银色使者
    .accept 96897 >>接任务：诅咒神教
    .accept 96898 >>接任务：战争的残迹
    .target 哈德里克·哈尔森

step
    .goto 1420/0,-130.500,1907.800
    >>击杀|cRXP_ENEMY_黑暗执行者|r和|cRXP_ENEMY_黑暗新教徒|r，拾取|cRXP_LOOT_死灵水晶碎片|r
    >>|cRXP_LOOT_死灵水晶碎片|r|cRXP_WARN_也可以在地面上拾取|r
    >>|cRXP_WARN_小心！这些怪物攻击很高。|cRXP_ENEMY_黑暗执行者|r还会瞬发施放造成50–70点伤害的技能。|r
    .complete 96897,2 --|8/8 Dark Enforcer slain
    .mob +黑暗执行者
    .complete 96897,1 --|8/8 Dark Neophyte slain
    .mob +黑暗新教徒
    .complete 96898,1 --|12/12 Necrotic Crystal Fragment

step
    .goto 1420/0,54.500,1996.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈德里克·哈尔森|r交谈
    .turnin 96897 >>交任务：诅咒神教
    .turnin 96898 >>交任务：战争的残迹
    .accept 96899 >>接任务：班达里安堡
    .target 哈德里克·哈尔森

step
    #label ArriveBalnir
    .goto 1420/0,-423.96,1976.68
    .subzone 165 >>前往巴尼尔农场
    .isOnQuest 356

step
    #completewith HorrorsandSpirits
    >>拾取地上的|cRXP_PICK_墓穴杂草|r
    .complete 99142,1 --|5/5 Tomb Weed

step << Mage
    #completewith next
    >>击杀|cRXP_ENEMY_可怕的血僵尸|r和|cRXP_ENEMY_游荡的幽灵|r
    .complete 356,1 --Bleeding Horror (8)
    .mob +可怕的血僵尸
    .complete 356,2 --Wandering Spirit (8)
    .mob +游荡的幽灵

step << Mage
    .goto 1420/0,-467.79,1969.75
    >>拾取地面上的任意植物，获得|cRXP_PICK_巴尼尔金鱼草|r
    .complete 1882,1 --Balnir Snapdragons (1)

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
    >>击杀|cRXP_ENEMY_可怕的血僵尸|r和|cRXP_ENEMY_游荡的幽灵|r
    .complete 356,1 --Bleeding Horror (8)
    .mob +可怕的血僵尸
    .complete 356,2 --Wandering Spirit (8)
    .mob +游荡的幽灵

step
    .goto 1420/0,-354.800,2049.000
    >>拾取地上的|cRXP_PICK_墓穴杂草|r
    .complete 99142,1 --|5/5 Tomb Weed

step << Paladin
    #completewith ViciousVenom
    >>|cRXP_WARN_保存10|r |T132889:0|t[亚麻布]|cRXP_WARN_留作后续任务材料，不要卖掉|r
    .collect 2589,10 --Linen Cloth (10)

step
    #sticky
    #label Friars
    #loop
    #optional
    .goto 1420/0,-624.59,2114.05,0
    .goto 1420/0,-452.43,2183.03,0
    .goto 1420/0,-573.53,2138.450,0
    .goto 1420/0,-624.59,2114.05,40,0
    .goto 1420/0,-654.87,2185.44,40,0
    .goto 1420/0,-652.16,2238.77,40,0
    .goto 1420/0,-550.49,2173.09,40,0
    .goto 1420/0,-452.43,2183.03,40,0
    .goto 1420/0,-407.69,2171.590,40,0
    .goto 1420/0,-406.34,2113.75,40,0
    .goto 1420/0,-453.33,2127.91,40,0
    .goto 1420/0,-573.53,2138.450,40,0
    >>击杀|cRXP_ENEMY_血色苦行修士|r和|cRXP_ENEMY_血色狂热者|r，拾取|cRXP_LOOT_血色十字军徽记之戒|r
    .complete 371,2 --Scarlet Friar (5)
    .complete 374,1 --Scarlet Insignia Ring (10)
    .mob 血色苦行修士
    .mob 血色狂热者
    .isOnQuest 374

step
    #loop
    #sticky
    #requires Friars
    #label Friars2
    .goto 1420/0,-624.59,2114.05,0
    .goto 1420/0,-452.43,2183.03,0
    .goto 1420/0,-573.53,2138.450,0
    .goto 1420/0,-624.59,2114.05,40,0
    .goto 1420/0,-654.87,2185.44,40,0
    .goto 1420/0,-652.16,2238.77,40,0
    .goto 1420/0,-550.49,2173.09,40,0
    .goto 1420/0,-452.43,2183.03,40,0
    .goto 1420/0,-407.69,2171.590,40,0
    .goto 1420/0,-406.34,2113.75,40,0
    .goto 1420/0,-453.33,2127.91,40,0
    .goto 1420/0,-573.53,2138.450,40,0
    >>击杀|cRXP_ENEMY_血色苦行修士|r
    .complete 371,2 --Scarlet Friar (5)
    .mob 血色苦行修士
    .isQuestTurnedIn 374

step
    .goto 1420/0,-528.35,2146.28
    >>击杀塔内的|cRXP_ENEMY_瓦松队长|r
    .complete 371,1 --Captain Vachon (1)
    .mob 瓦松队长

step
    #label ViciousVenom
    #requires Friars2
    #loop
    .goto 1420/0,-808.96,2189.06,0
    .goto 1420/0,-739.82,2163.75,30,0
    .goto 1420/0,-808.96,2189.06,30,0
    .goto 1420/0,-878.10,2195.39,30,0
    .goto 1420/0,-945.88,2180.93,30,0
    .goto 1420/0,-985.64,2224.00,30,0
    .goto 1420/0,-1019.99,2274.61,30,0
    .goto 1420/0,-1075.11,2314.38,30,0
    .goto 1420/0,-1072.85,2381.56,30,0
    .goto 1420/0,-1027.67,2432.17,30,0
    .goto 1420/0,-809.41,2431.26,30,0
    .goto 1420/0,-785.91,2352.64,30,0
    .goto 1420/0,-738.02,2268.29,30,0
    >>击杀|cRXP_ENEMY_邪恶的夜行蜘蛛|r，拾取|cRXP_LOOT_邪恶夜行蜘蛛的毒液|r
    .complete 369,1 --Vicious Night Web Spider Venom (4)
    .mob 邪恶的夜行蜘蛛

step << skip
    .goto 1420/0,-38.06,2569.54
    >>在澈水湖的岛上从|cRXP_PICK_冈瑟尔的丛书|r中拾取|cRXP_LOOT_巫妖的法术书|r
    .complete 357,1 --The Lich's Spellbook (1)

step
    --#hardcore
    #completewith ANewPlagueFinal
    .subzone 159 >> 返回布瑞尔
    .subzoneskip 159

step << skip
    #softcore
    #completewith ANewPlagueFinal
    .goto 1420/0,23.85,2483.38
    .deathskip >> 在 |cRXP_WARN_较小岛屿|r 上死亡, 在 |cRXP_FRIENDLY_灵魂医者|r 处重生

step
    .goto 1420/0,346.94,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .turnin 369 >>交任务：新的瘟疫
    .accept 492 >>接任务：新的瘟疫
    .accept 445 >>接任务：给银松森林送信
    .target 药剂师乔汉

step
    .goto 1420/0,295.87,2277.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .turnin 371 >>交任务：与血色十字军的战争
    --.accept 372 >>Accept At War With The Scarlet Crusade
    .target 执行官塞加德

step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .turnin 360 >>交任务：向塞弗伦回报
    .turnin 355 >>交任务：与塞弗伦交谈
    .target 执政官塞弗伦

step
    .goto 1420/0,280.06,2270.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯吉斯|r交谈
    .turnin 374 >>交任务：死亡证明
    .target 亡灵卫兵伯吉斯

step
    .goto 1420/0,244.81,2269.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    .vendor >>|cRXP_BUY_出售杂物，按需补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物，按需补充食物|r << Rogue/Warrior
    .target 旅店老板瑞尼

step
    #label ANewPlagueFinal
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店后方楼下的|cRXP_FRIENDLY_血色十字军俘虏|r和|cRXP_FRIENDLY_被俘的巡山人|r交谈
    .turnin 407 >>交任务：悲伤之地
    .goto 1420/0,233.06,2292.39
    .target +血色十字军俘虏
    .turnin 492 >> 交任务：新的瘟疫
    .goto 1420/0,234.42,2289.070
    .target +被俘虏的巡山人

step << Priest
    .goto 1420/0,251.14,2265.28--c:Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
    .trainer >> 学习职业技能
    .target 黑暗牧师贝里尔
    .xp <12,1

step << Warrior
    .goto 1420/0,238.49,2255.03--c:Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 7384 >>学习职业技能
    .target 奥斯蒂尔·德·蒙
    .xp <12,1

step << Warlock
    .goto 1420/0,250.24,2259.25--c:Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈
    .train 755 >> 学习职业技能
    .target 鲁伯特·鲍什
    .xp <12,1

step << Rogue
    .goto 1420/0,243.01,2270.70--c:Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r交谈
    .train 1766 >> 学习职业技能
    .target 马里恩·考尔
    .xp <12,1

step << Mage
    .goto 1420/0,233.52,2256.84--c:Tirisfal Glades,61.96,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .train 145 >> 学习职业技能
    .target 凯恩·火歌
    .xp <12,1

step << Paladin
    .goto 1420/0,311.600,2251.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎莉·斯迪威尔|r交谈
    .train 678 >> 学习职业技能
    .target 莎莉·斯迪威尔
    .xp <12,1

step
    #loop
    .goto 1420/0,425.56,2362.58,0
    .goto 1420/0,399.35,2337.270,30,0
    .goto 1420/0,425.56,2362.58,30,0
    .goto 1420/0,355.52,2429.76,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍兰德|r交谈
    >>|cRXP_WARN_他会在墓地周围巡逻|r
    .turnin 99142 >>交任务：墓穴杂草
    .target 初级药剂师霍兰德
    --Bandarion Keep section

step << !Paladin
    #optional
    .maxlevel 11,BandarionKeepSkip

step
    #completewith next
    .goto 1420/0,1732.500,2437.900,50,0
    .goto 1420/0,1834.300,2424.000,50,0
    .goto 1420/0,1963.100,2340.600,50,0
    .goto 1420/0,2041.000,2352.500,50,0
    .goto 1420/0,2049.900,2463.200,50 >>前往班达里安堡

step << Paladin
    .goto 1420/0,2045.900,2475.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布雷顿·萨缪尔斯|r交谈
    .turnin 91282 >>交任务：第二个家
    .accept 91285 >>接任务：门口的鱼人
    .target 布雷顿·萨缪尔斯

step
    .goto 1420/0,2038.000,2490.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尊者莱尼德·巴萨罗梅|r交谈（楼上）
    .turnin 96899 >>交任务：班达里安堡
    .accept 96896 >>接任务：正义的事业
    .target 莱尼德·巴萨罗梅

step
    .goto 1420/0,2038.000,2490.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尊者莱尼德·巴萨罗梅|r交谈（楼上）
    .turnin 96896 >>交任务：正义的事业
    .accept 98545 >>接任务：莱尼德的信
    .target 莱尼德·巴萨罗梅

step
    .goto 1420/0,2041.200,2416.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_破坏者希尔达|r交谈（外面）
    .accept 99152 >>接任务：上下皆然
    .target 破坏者希尔达

step
    .goto 1420/0,2122.100,2436.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃弗拉姆·巴巴罗|r交谈（外面）
    .accept 99153 >>接任务：漏网之鱼
    .target 埃弗拉姆·巴巴罗

step << Paladin
    #loop
    .goto 1420/0,2424.200,2151.900,0
    .goto 1420/0,2212.000,2022.600,0
    .goto 1420/0,2424.200,2151.900,50,0
    .goto 1420/0,2212.000,2022.600,50,0
    >>击杀|cRXP_ENEMY_邪鳍先知|r和|cRXP_ENEMY_邪鳍攻击者|r
    .complete 91285,2 --|8/8 Vile Fin Seer slain
    .mob +邪鳍先知
    .complete 91285,1 --|8/8 Vile Fin Attacker slain
    .mob +邪鳍攻击者

step << Paladin
    .goto 1420/0,2045.800,2475.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布雷顿·萨缪尔斯|r交谈
    .turnin 91285 >>交任务：门口的鱼人
    .accept 91294 >>接任务：巡视营地
    .target 布雷顿·萨缪尔斯
    --very good weapon upgrade 8.9 dps (Wooden Mallet 5.0 dps)

step << Paladin -- paladin trainer outside
    .goto 1420/0,2038.800,2415.900
    >>与|cRXP_FRIENDLY_破坏者希尔达|r交谈
    .complete 91294,1 --|1/1 Speak with Hilda the Breaker
    .target 破坏者希尔达

step << Paladin --patrols the road
    .goto 1420/0,1961.100,2334.600
    >>与|cRXP_FRIENDLY_安德尔·索利丹|r交谈
    >>|cRXP_WARN_他沿着道路巡逻|r
    .complete 91294,3 --|1/1 Speak with Ander Solliden
    .target 安德尔·索利丹
    --TODO: Patrol path

step << Paladin --inside keep
    .goto 1420/0,2007.900,2491.200
    >>与|cRXP_FRIENDLY_乔林·克罗格|r交谈
    .complete 91294,2 --|1/1 Speak with Jorin Croge
    .target 乔林·克罗格

step << Paladin --upstairs in keep
    .goto 1420/0,2035.100,2492.200
    >>与|cRXP_FRIENDLY_丹妮莎·莫尔|r交谈
    .complete 91294,4 --|1/1 Speak with Danitha Morr
    .target 丹妮莎·莫尔

step << Paladin
    .goto 1420/0,2035.100,2492.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹妮莎·莫尔|r交谈
    .turnin 91294 >>交任务：巡视营地
    .accept 91317 >>接任务：被玷污者
    .target 丹妮莎·莫尔

step << Paladin
    .goto 1420/0,2007.800,2491.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔林·克罗格|r交谈
    .accept 91316 >>接任务：修缮工作
    .target 乔林·克罗格

step << Paladin
    #completewith next
    >>击杀|cRXP_ENEMY_被玷污的狂热者|r和|cRXP_ENEMY_被玷污的苦工|r
    .complete 91317,3 --|6/6 Tarnished Zealot slain
    .mob +被玷污的狂热者
    .complete 91317,2 --|8/8 Tarnished Drudge slain
    .mob +被玷污的苦工

step << Paladin
    .goto 1420/0,2514.600,1903.600
    >>击杀|cRXP_ENEMY_鲁道夫·盖尔哈特|r（楼上）并拾取其|cRXP_LOOT_头颅|r
    .complete 91317,1 --|1/1 Rudolph Gelhardt's Head
    .mob 鲁道夫·盖尔哈特

step << Paladin
    .goto 1420/0,2487.700,1910.000
    >>击杀|cRXP_ENEMY_被玷污的狂热者|r和|cRXP_ENEMY_被玷污的苦工|r
    .complete 91317,3 --|6/6 Tarnished Zealot slain
    .mob +被玷污的狂热者
    .complete 91317,2 --|8/8 Tarnished Drudge slain
    .mob +被玷污的苦工

step
    #label ShadowValeCrypt
    .goto 1420/0,2449.500,1857.600,10 >>进入影谷墓穴
    .isOnQuest 99152,95314,99153

step
    #requires ShadowValeCrypt
    #completewith GlowingFragment
    >>击杀|cRXP_ENEMY_影谷潜伏者|r和|cRXP_ENEMY_影谷秘法师|r，拾取|cRXP_LOOT_散发微光的骸骨|r
    .complete 99152,1 --|6/6 Faintly Glowing Bone
    .mob 影谷潜伏者
    .mob 影谷秘法师

step
    #requires ShadowValeCrypt
    #completewith GlowingBones
    >>拾取地上的|cRXP_PICK_木料堆|r << Paladin
    >>拾取地上和墙上的|cRXP_PICK_低语饮剂瓶|r
    .complete 91316,1 << Paladin--|12/12 Sturdy Lumber
    .complete 95314,1 --|8/8 Bottle of Whispering Elixir

step
    .goto 1420/0,2648.100,2027.200
    .use 268812 >>击杀精英|cRXP_ENEMY_低语恐魔|r，拾取|T134438:0|t[|cRXP_LOOT_低语恐魔残渣|r]
    >>|cRXP_WARN_此战较难，尽量组队。它有700点生命值，伤害尚可应对；如果无法击杀，请跳过此步骤|r
    .collect 268812,1,95328 --Whispering Horror Residue (x1)
    .accept 95328 >>接任务：低语恐魔残渣
    .mob 低语恐魔

step
    #requires ShadowValeCrypt
    #label GlowingFragment
    .goto 1420/0,2592.400,1748.400
    >>拾取地上的|cRXP_PICK_闪光的水晶碎片|r
    .complete 99153,1 --|1/1 Glowing Crystal Fragment

step
    #requires ShadowValeCrypt
    #label GlowingBones
    .goto 1420/0,2556.100,1868.800
    >>击杀|cRXP_ENEMY_影谷潜伏者|r和|cRXP_ENEMY_影谷秘法师|r，拾取|cRXP_LOOT_散发微光的骸骨|r
    .complete 99152,1 --|6/6 Faintly Glowing Bone
    .mob 影谷潜伏者
    .mob 影谷秘法师

step
    #requires ShadowValeCrypt
    .goto 1420/0,2647.800,1815.500
    >>拾取地上的|cRXP_PICK_木料堆|r << Paladin
    >>拾取地上和墙上的|cRXP_PICK_低语饮剂瓶|r
    .complete 91316,1 << Paladin--|12/12 Sturdy Lumber
    .complete 95314,1 --|8/8 Bottle of Whispering Elixir

step << skip
    #softcore
    #completewith next
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活

step
    .goto 1420/0,2037.100,2416.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_破坏者希尔达|r交谈
    .turnin 99152 >>交任务：上下皆然
    .target 破坏者希尔达

step
    .goto 1420/0,2122.500,2436.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃弗拉姆·巴巴罗|r交谈
    .turnin 99153 >>交任务：漏网之鱼
    .target 埃弗拉姆·巴巴罗

step << Paladin
    .goto 1420/0,2008.000,2491.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔林·克罗格|r交谈
    .turnin 91316 >>交任务：修缮工作
    .target 乔林·克罗格

step << Paladin
    .goto 1420/0,2035.100,2492.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹妮莎·莫尔|r交谈
    .turnin 91317 >>交任务：被玷污者
    .accept 95803 >>接任务：诚意的信物
    .accept 94427 >>接任务：神性一课
    .target 丹妮莎·莫尔

step << !Paladin
    #completewith BrillTurnin2
    .hs >> 炉石回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,>0,1

step << !Paladin
    #completewith BrillTurnin2
    .subzone 159 >> 返回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,<0

step << Priest
    .goto 1420/0,251.14,2265.28--c:Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
    .trainer >> 学习职业技能
    .target 黑暗牧师贝里尔
    .xp <12,1

step << Warrior
    .goto 1420/0,238.49,2255.03--c:Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 7384 >>学习职业技能
    .target 奥斯蒂尔·德·蒙
    .xp <12,1

step << Warlock
    .goto 1420/0,250.24,2259.25--c:Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈
    .train 755 >> 学习职业技能
    .target 鲁伯特·鲍什
    .xp <12,1

step << Rogue
    .goto 1420/0,243.01,2270.70--c:Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r交谈
    .train 1766 >> 学习职业技能
    .target 马里恩·考尔
    .xp <12,1

step << Mage
    .goto 1420/0,233.52,2256.84--c:Tirisfal Glades,61.96,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .train 145 >> 学习职业技能
    .target 凯恩·火歌
    .xp <12,1

step << !Paladin
    .goto 1420/0,347.600,2265.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗莱·安尼斯|r交谈
    .turnin 95314 >>交任务：影谷的绿色饮剂
    .target 卡罗莱·安尼斯

step << Priest
    #optional
    .goto 1420/0,251.14,2265.28--c:Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
    .trainer >> 学习职业技能
    .target 黑暗牧师贝里尔
    .xp <12,1

step << Warrior
    #optional
    .goto 1420/0,238.49,2255.03--c:Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 7384 >>学习职业技能
    .target 奥斯蒂尔·德·蒙
    .xp <12,1

step << Warlock
    #optional
    .goto 1420/0,250.24,2259.25--c:Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈
    .train 755 >> 学习职业技能
    .target 鲁伯特·鲍什
    .xp <12,1

step << Rogue
    #optional
    .goto 1420/0,243.01,2270.70--c:Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r交谈
    .train 1766 >> 学习职业技能
    .target 马里恩·考尔
    .xp <12,1

step << Mage
    #optional
    .goto 1420/0,233.52,2256.84--c:Tirisfal Glades,61.96,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .train 145 >> 学习职业技能
    .target 凯恩·火歌
    .xp <12,1

step
    #optional
    #label BandarionKeepSkip

step << Rogue
    #completewith EnterUC2
    >>|cRXP_WARN_如果看到|r|cRXP_FRIENDLY_阿斯托|r|cRXP_WARN_，就与他交谈并击杀他，从他身上拾取信件。他会在布瑞尔与瑟伯切尔之间的道路上巡逻|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan 阿斯托·哈德恩
    .isOnQuest 1886

step << !Paladin
    #label BrillTurnin2
    .goto 1420/0,74.00,2022.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵林奈|r交谈
    .turnin 356 >>交任务：巡查后方
    .target 亡灵卫兵林奈

step << !Paladin
    #label EnterUC2
    #completewith Glix
    .goto 1420/0,240.75,1877.57,20 >> 进入幽暗城
    .zoneskip Undercity

step << !Paladin
    #completewith Glix
    .goto 1458/0,239.14,1749.54,35,0
    .goto 1458/0,255.64,1724.70,35,0
    .goto 1458/0,240.68,1706.97,10,0
    .goto 1458/0,241.06,1660.12,10,0
    .goto 1458/0,257.08,1623.38,10,0
    .goto 1458/0,244.51,1598.73,15 >> 乘坐升降梯下到幽暗城

step << !Paladin
    .goto 1458/0,223.31,1634.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺曼|r交谈
    .home >> 将炉石绑定在幽暗城
    .target 旅店老板诺曼
    .bindlocation 1497

step << Paladin
    #completewith Glix
    .hs >> 炉石回幽暗城
    .cooldown item,6948,>0,1
    .bindlocation 1497,1
    .zoneskip Undercity

step << Paladin --trade quarter
    .goto 1458/0,245.300,1637.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尼斯·桤木|r交谈
    >>|cRXP_WARN_确保背包里有10块|r |T132889:0|t[亚麻布]|cRXP_WARN_（不要卖掉）|r
    .turnin 94427 >>交任务：神性一课
    .accept 94434 >>接任务：神性一课
    .turnin 94434 >>交任务：神性一课
    .accept 94435 >>接任务：神性一课
    .target 塔尼斯·桤木

step
    #label Glix
    .goto 1458/0,201.400,1575.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格利克斯·希基克斯|r交谈
    .isOnQuest 98545
    .turnin 98545 >>交任务：莱尼德的信
    .target 格利克斯·希基克斯

step << Rogue
    #ssf
    .goto 1458/0,133.71,1561.730
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_（向他购买）|r
    .collect 851,1,372,1 --Collect Cutlass (1)
    .money <0.1922
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 查尔斯·希顿

step << Rogue
    #ah
    .goto 1458/0,133.71,1561.730
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_（向他购买）|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的替代品|r
    .collect 851,1,372,1 --Collect Cutlass (1)
    .money <0.1922
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 查尔斯·希顿

step << Rogue
    #optional
    #completewith Entersilverpine
    +|cRXP_WARN_装备|r |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8

step << Warrior
    #ssf
    .goto 1458/0,133.71,1561.730
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135350:0|t[优质重剑]|cRXP_BUY_。|r
    .collect 1198,1,372,1 --Collect Claymore (1)
    .money <0.2543
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target 查尔斯·希顿

step << Warrior
    #ah
    .goto 1458/0,133.71,1561.730
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135350:0|t[优质重剑]|cRXP_BUY_。|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的替代品|r
    .collect 1198,1,372,1 --Collect Claymore (1)
    .money <0.2543
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target 查尔斯·希顿

step << Warrior
    #optional
    #completewith Entersilverpine
    +|cRXP_WARN_装备|r |T135350:0|t[优质重剑]
    .use 1198
    .itemcount 1198,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0

step
    #ah
    .goto 1458/0,224.300,1648.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师凯恩|r交谈
    >>|cRXP_BUY_购买三个|r |T133884:0|t[鱼人的眼球]|cRXP_BUY_（从拍卖行）|r
    >>|cRXP_WARN_可跳过，仅节省少量时间|r
    .collect 730,3,91920,1 --Collect Murloc Eyes (x3)
    .target 拍卖师凯恩

step << Mage
    .goto 1458/0,56.57,1813.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .turnin 1882 >>交任务：巴尼尔农场
    .target 安娜斯塔西娅·哈特威尔

step << Rogue
    .goto 1458/0,71.92,1435.630
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特·卡加德|r交谈
    .turnin 1886 >>交任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestComplete 1886

step << Rogue
    .goto 1458/0,71.92,1435.630
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特·卡加德|r交谈
    .accept 1898 >>接任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1886

step << Rogue
    .goto 1458/0,347.07,1389.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德隆·甘特|r交谈
    .turnin 1898 >>交任务：亡灵哨兵
    .accept 1899 >>接任务：亡灵哨兵
    .target 安德隆·甘特
    .isQuestTurnedIn 1886

step << Rogue
    .goto 1458/0,341.41,1385.90
    >>搜寻|cRXP_PICK_安德隆的书架|r，拾取其中的物品。书架位于|cRXP_FRIENDLY_安德隆|r身后
    .complete 1899,1 --Andron's Ledger (1)
    .isQuestTurnedIn 1886

step << Rogue
    .goto 1458/0,71.83,1435.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特·卡加德|r交谈
    .turnin 1899 >>交任务：亡灵哨兵
    .accept 1978 >>接任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1886

step << Rogue
    .goto 1420/0,373.60,1464.85,40,0
    .goto 1420/0,333.38,1287.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈（恐惧魔王）
    .turnin 1978 >>交任务：亡灵哨兵
    .target 瓦里玛萨斯
    .isQuestTurnedIn 1886

step
    .goto 1458/0,399.800,1776.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰克斯特神父|r交谈
    .turnin 95328 >>交任务：低语恐魔残渣
    .target 兰克斯特神父
    .isOnQuest 95328

step << Priest
    #ah
    .goto 1458/0,257.27,1560.450
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师雷克尔|r交谈
    >>|cRXP_BUY_从拍卖行购买|r |T135139:0|t[次级魔法杖]|cRXP_BUY_。|r
    >>|cRXP_WARN_如果已经购买了魔杖，且之前收集了|r |T132889:0|t[亚麻布]|cRXP_WARN_，现在可以将|r |T132889:0|t[亚麻布]|cRXP_WARN_在拍卖行出售|r
    >>|cRXP_WARN_如果不打算或无法完成此步骤，请跳过|r
    .collect 11287,1,435,1 --Lesser Magic Wand (1)
    .target 拍卖师雷克尔
    .itemStat 18,QUALITY,<7 << Priest/Mage/Warlock
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3 << Priest/Mage/Warlock

step << Priest
    #optional
    .goto 1458/0,403.29,1760.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r交谈
    .accept 5658 >> 接任务：虚弱之触
    .turnin 5658 >> 交任务：虚弱之触
    .target 艾萨莱斯特
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
    .train 2652,1 --Touch of Weakness not trained

step << Priest
    #optional
    .goto 1458/0,201.05,1686.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维克多·瓦德|r交谈
    .train 3908 >> 学习|T136249:0|t[裁缝]
    .target 维克多·瓦德
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #optional
    .goto 1458/0,194.34,1681.63
    >>|cRXP_WARN_将所有|r |T132889:0|t[亚麻布]|cRXP_WARN_制成|r |T132890:0|t[亚麻布卷]
    .collect 2996,30 --Bolt of Linen Cloth (30)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #optional
    .goto 1458/0,196.16,1684.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米利尔·格里高利|r交谈
    >>|cRXP_BUY_购买|r |T132891:0|t[粗线]|cRXP_BUY_（她有售）|r
    .collect 2320,15 --Coarse Thread (15)
    .target 米利尔·格里高利
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #optional
    .goto 1458/0,201.05,1686.94
    >>向|cRXP_FRIENDLY_维克多·瓦德|r学习亚麻披风。若裁缝尚未达到30，制作少量披风补足技能；亚麻布不足时先补充材料
    .train 2387 >>学习亚麻披风
    .skill tailoring,30 >>将裁缝提升到30，才能学习棕色亚麻长袍
    .target 维克多·瓦德
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #optional
    >>为9件棕色亚麻长袍准备27卷亚麻布卷；不足时收集或购买亚麻布，再制成布卷
    .collect 2996,27
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #optional
    .goto 1458/0,201.05,1686.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维克多·瓦德|r交谈
    .train 7623 >> 学习|T132662:0|t[棕色亚麻长袍]
    .target 维克多·瓦德
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #optional
    >>|cRXP_WARN_制作9件|r |T132662:0|t[棕色亚麻长袍]|cRXP_WARN_，留作分解材料|r
    .collect 6238,9 --Brown Linen Robe(9)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #optional
    .goto 1458/0,273.87,1482.360
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉文尼亚·克洛文|r交谈
    .train 7411 >> 学习|T136244:0|t[附魔]
    .target 拉文尼亚·克洛文
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #optional
    .goto 1458/0,275.02,1487.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_萨德乌斯·韦伯|r|cRXP_BUY_交谈，购买|r |T133942:0|t[铜棒]|cRXP_BUY_和|r |T135435:0|t[普通木材]|cRXP_BUY_（他有售）|r
    >>|cRXP_WARN_分解你制作的所有|r |T132662:0|t[棕色亚麻长袍]|cRXP_WARN_，再制作|r |T135225:0|t[符文铜棒]
    >>|cRXP_WARN_如果还没有|r |T132867:0|t[次级魔法精华]|cRXP_WARN_，请从|r|cRXP_FRIENDLY_萨德乌斯·韦伯|r|cRXP_WARN_处购买（如果有货）。否则稍后再完成这一步|r
    >>符文铜棒和次级魔法杖各需1份次级魔法精华；制作铜棒后，至少再留1份精华给魔杖
    .collect 6218,1 --Runed Copper Rod (1)
    .collect 4470,1 --Simple Wood (1)
    .target 萨德乌斯·韦伯
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #optional
    >>分解制作的棕色亚麻长袍，直到附魔达到10；制作符文铜棒也能提升技能
    .skill enchanting,10 >>将附魔提升到10，才能学习次级魔法杖
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #optional
    .goto 1458/0,273.2,1491.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛考布·维恩|r交谈
    .train 14293 >> 学习|T135139:0|t[次级魔法杖]
    .target 玛考布·维恩
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3

step << Priest
    #optional
    #label LesserMagicWand
    >>|cRXP_WARN_制作一根|r |T135139:0|t[次级魔法杖]
    >>|cRXP_WARN_如果还没有|r |T132867:0|t[次级魔法精华]|cRXP_WARN_，请从|r|cRXP_FRIENDLY_萨德乌斯·韦伯|r|cRXP_WARN_处购买（如果有货）。否则稍后再完成这一步|r
    .collect 11287,1 --Lesser Magic Wand (1)
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

step << Paladin
    #completewith next
    .goto 1458/0,374.41,1464.82,10,0--c:Undercity,51.99,64.54
    .goto 1458/0,429.48,1409.26,10,0--c:Undercity,46.25,73.22
    .goto 1458/0,438.40,1376.62,10,0--c:Undercity,45.32,78.32
    .goto 1458/0,429.39,1340.83,10,0--c:Undercity,46.26,83.91
    .goto 1458/0,402.81,1315.17,10,0--c:Undercity,49.03,87.92
    .goto 1458/0,365.30,1304.41,10 >>进入皇家区--c:Undercity,52.94,89.60

step << Paladin
    .goto 1458/0,316.200,1290.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_希尔瓦娜斯·风行者|r
    .turnin 95803 >>交任务：诚意的信物
    .target 希尔瓦娜斯·风行者
    --Paladin Ressurrect chain route

step << Paladin
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone Tirisfal Glades >> 离开幽暗城
    .zoneskip Tirisfal Glades

step << Paladin
    .goto 1420/0,74.00,2022.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵林奈|r交谈
    .turnin 356 >>交任务：巡查后方
    .target 亡灵卫兵林奈

step << Paladin
    .goto 1420/0,311.600,2251.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎莉·斯迪威尔|r交谈
    .train 678 >> 学习职业技能
    .target 莎莉·斯迪威尔
    .xp <12,1

step << Paladin
    .goto 1420/0,347.600,2265.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗莱·安尼斯|r交谈
    .turnin 95314 >>交任务：影谷的绿色饮剂
    .target 卡罗莱·安尼斯

step << Paladin
    #completewith RessComplete
    +|cRXP_WARN_现在开始做|r|T135955:0|t[救赎]|cRXP_WARN_技能任务链，约需15分钟，经验奖励较少|r
    >>|cRXP_WARN_也可以暂时跳过，稍后再回来完成|r

step << Paladin
    #completewith next
    .goto 1420/0,1732.500,2437.900,50,0
    .goto 1420/0,1834.300,2424.000,50,0
    .goto 1420/0,1963.100,2340.600,50,0
    .goto 1420/0,2041.000,2352.500,50,0
    .goto 1420/0,2049.900,2463.200,50 >>前往班达里安堡

step << Paladin
    .goto 1420/0,2035.100,2492.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹妮莎·莫尔|r交谈
    .turnin 94435 >>交任务：神性一课
    .accept 94436 >>接任务：神性一课
    .target 丹妮莎·莫尔

step << Paladin
    .goto 1420/0,2043.400,2497.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵比尔穆斯|r交谈
    .turnin 94436 >>交任务：神性一课
    .accept 94438 >>接任务：神性一课
    .target 亡灵卫兵比尔穆斯
    .isOnQuest 94436

step << Paladin
    #optional
    .goto 1420/0,2043.400,2497.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵比尔穆斯|r交谈
    .accept 94438 >>接任务：神性一课
    .target 亡灵卫兵比尔穆斯
    .isQuestTurnedIn 94436
    --East Tirisfal south of SM

step << Paladin
    #completewith next
    .goto 1420/0,-885.200,2399.800,50 >>前往提瑞斯法林地东部

step << Paladin
    #completewith next
    .cast 8593 >>|cRXP_WARN_使用|r |T133439:0|t[生命符记]|cRXP_WARN_（目标为）|r |cRXP_FRIENDLY_亡灵卫兵法尔甘|r
    .use 6866
    .target 亡灵卫兵法尔甘

step << Paladin
    .goto 1420/0,-885.200,2399.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵法尔甘|r交谈
    .turnin 94438 >>交任务：神性一课
    .accept 94440 >>接任务：神性一课
    .target 亡灵卫兵法尔甘
    .isQuestTurnedIn 94436

step << Paladin
    .goto 1420/0,-889.700,2531.400
    >>击杀|cRXP_ENEMY_血色苦行修士|r和|cRXP_ENEMY_血色狂热者|r，拾取|cRXP_LOOT_血色十字军的攻击计划|r
    .complete 94440,1 --|1/1 Scarlet Crusade Attack Plans
    .mob 血色苦行修士
    .mob 血色狂热者
    .isQuestTurnedIn 94436
    --Back to Bandarion Keep

step << Paladin
    #completewith next
    .goto 1420/0,1732.500,2437.900,50,0
    .goto 1420/0,1834.300,2424.000,50,0
    .goto 1420/0,1963.100,2340.600,50,0
    .goto 1420/0,2041.000,2352.500,50,0
    .goto 1420/0,2049.900,2463.200,50 >>前往班达里安堡

step << Paladin
    .goto 1420/0,2043.500,2497.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵比尔穆斯|r交谈
    .turnin 94440 >>交任务：神性一课
    .accept 94441 >>接任务：神性一课
    .target 亡灵卫兵比尔穆斯
    .isQuestTurnedIn 94436

step << Paladin
    #label RessComplete
    .goto 1420/0,2034.900,2492.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹妮莎·莫尔|r交谈
    .turnin 94441 >>交任务：神性一课
    .target 丹妮莎·莫尔
    .isQuestTurnedIn 94436

step << !Paladin
    #completewith Entersilverpine
    #optional
    .abandon 96899 >>放弃任务：班达里安堡

step << !Paladin
    #completewith Entersilverpine
    #optional
    .abandon 95314 >>放弃任务：影谷的绿色饮剂

step << !Paladin
    #completewith next
    .goto 1458/0,419.89,1627.54,50,0
    .goto 1458/0,428.52,1597.20,10,0
    .goto 1458/0,439.17,1626.06,10,0
    .goto 1458/0,476.78,1632.150,10,0
    .goto 1458/0,482.34,1660.63,10,0
    .goto 1458/0,539.33,1665.49,15,0
    .goto 1458/0,610.42,1684.44,35,0
    .goto 1458/0,663.19,1600.46,35,0
    .goto 1420/0,724.25,1682.66,50,0
    .zone Tirisfal Glades >> 从幽暗城下水道离开

step
    #label Entersilverpine
    .goto 1420/0,629.36,1553.42
    .zone Silverpine Forest >> 前往银松森林
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 竞速指南（部落）
#subgroupdisplayname 1-22
#group RestedXP Forever Guide (H)
#subgroup Speedrun Guide 1-22
--#groupid RXP-SRGCE-H1
<< Horde
#version 11
#defaultfor !Hunter !Shaman !Tauren
#forever
#disabledungeons
#name 12-14 Silverpine Forest
#next 12-17 The Barrens
#displayname 13-15 银松森林 << Paladin
#displayname 12-14 银松森林

step << Undead Rogue
    #sticky
    #completewith RotHideCluesTurnIn
    >>|cRXP_WARN_如果看到|r|cRXP_FRIENDLY_阿斯托|r|cRXP_WARN_，就与他交谈并击杀他，从他身上拾取信件。他会在布瑞尔与瑟伯切尔之间的道路上巡逻|r
    .isOnQuest 1886
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan 阿斯托·哈德恩

step
    .goto 1421/0,1090.44,1409.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵哨兵埃兰德|r交谈，开始护送任务
    >>|cRXP_WARN_如果他不在那里，暂时跳过此任务|r
    .accept 435,1 >>接任务：护送埃兰德
    .target 亡灵哨兵埃兰德

step
    .goto 1421/0,1087.50,1379.11,30,0
    .goto 1421/0,1087.50,1346.63,30,0
    .goto 1421/0,1090.86,1313.31,30,0
    .goto 1421/0,1204.68,1290.07
    >>护送|cRXP_FRIENDLY_埃兰德|r安全抵达|cRXP_FRIENDLY_兰妮·尤瑞克|r身边
    >>|cRXP_ENEMY_座狼|r|cRXP_WARN_可能会重叠刷新，有机会就吃喝恢复|r
    .complete 435,1 --Erland must reach Rane Yorick (1)
    .mob 座狼
    .isOnQuest 435

step
    .goto 1421/0,1204.68,1290.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .turnin 435 >>交任务：护送埃兰德
    .accept 429 >>接任务：荒野之心
    .accept 449 >>接任务：亡灵哨兵的报告
    .target 兰妮·尤瑞克
    .isQuestComplete 435

step
    #optional
    .goto 1421/0,1204.68,1290.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .accept 429 >>接任务：荒野之心
    .target 兰妮·尤瑞克

step
    #completewith Escort2
    >>击杀|cRXP_ENEMY_座狼|r，获取|cRXP_LOOT_心脏|r
    .collect 3164,3,429,1 --Collect Discolored Worg Heart (x6)
    .mob 座狼
    .mob 杂斑座狼
    .unitscan 血牙狼人

step
    #loop
    .goto 1421/0,941.300,1210.400,0
    .goto 1421/0,706.700,1317.400,0
    .goto 1421/0,941.300,1210.400,50,0
    .goto 1421/0,830.000,1309.400,50,0
    .goto 1421/0,706.700,1317.400,50,0
    >>击杀|cRXP_ENEMY_邪鳍鱼人|r，拾取它们掉落的|T133884:0|t[|cRXP_LOOT_鱼人的眼球|r]。
    .collect 730,3,91920,1 --Collect Murloc Eyes (x3)
    .mob 邪鳍切割者
    .mob 邪鳍潮行者

step
    .goto 1421/0,1090.44,1409.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵哨兵埃兰德|r交谈，开始护送任务
    .accept 435,1 >>接任务：护送埃兰德
    .target 亡灵哨兵埃兰德

step
    #label Escort2
    .goto 1421/0,1087.50,1379.11,30,0
    .goto 1421/0,1087.50,1346.63,30,0
    .goto 1421/0,1090.86,1313.31,30,0
    .goto 1421/0,1204.68,1290.07
    >>护送|cRXP_FRIENDLY_埃兰德|r安全抵达|cRXP_FRIENDLY_兰妮·尤瑞克|r身边
    >>|cRXP_ENEMY_座狼|r|cRXP_WARN_可能会重叠刷新，有机会就吃喝恢复|r
    .complete 435,1 --Erland must reach Rane Yorick (1)
    .mob 座狼
    .isOnQuest 435

step
    #loop
    .goto 1421/0,1025.76,1384.71,0
    .goto 1421/0,1099.68,1213.63,50,0
    .goto 1421/0,998.46,1230.99,50,0
    .goto 1421/0,955.2,1286.43,50,0
    .goto 1421/0,925.38,1372.39,50,0
    .goto 1421/0,1025.76,1384.71,50,0
    >>击杀|cRXP_ENEMY_座狼|r，获取|cRXP_LOOT_心脏|r
    .collect 3164,3,429,1 --Collect Discolored Worg Heart (x6)
    .mob 座狼
    .mob 杂斑座狼
    .unitscan 血牙狼人

step
    .goto 1421/0,1204.68,1290.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .turnin 435 >>交任务：护送埃兰德
    .accept 449 >>接任务：亡灵哨兵的报告
    .target 兰妮·尤瑞克

step << skip
    #softcore
    #completewith ProveyourWorth
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活

step
    --#hardcore
    #completewith next
    .goto 1421/0,1359.66,864.19,50,0
    .goto 1421/0,1359.66,741.27,50,0
    .goto 1421/0,1365.12,607.15,100,0
    .goto 1421/0,1538.58,511.39,100 >> 前往瑟伯切尔
    .subzoneskip 228

step
    #label ProveyourWorth
    .goto 1421/0,1593.6,554.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔|r交谈
    .accept 421 >>接任务：证明你的价值
    .target 达拉尔·道恩维沃尔

step << !Mage !Priest
    .goto 1421/0,1599.90,552.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格乌恩|r交谈
    .vendor >> |cRXP_BUY_从他那里购买|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_。|r
    >>|cRXP_WARN_不要出售|r |T133884:0|t[|cRXP_LOOT_鱼人的眼球|r]
    .collect 4605,20,421,1 --Red-speckled Mushroom (20)
    .target 格乌恩·法隆
    .money <0.05

step
    .goto 1421/0,1602.84,549.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德温|r交谈
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（他有售）|r << Mage/Warlock/Priest/Shaman/Druid/Paladin
    .vendor >> |cRXP_BUY_如果有货，就向他购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_。|r
    >>|cRXP_WARN_不要出售|r |T133884:0|t[|cRXP_LOOT_鱼人的眼球|r]
    .collect 1179,20,421,1 << Mage/Warlock/Priest/Shaman/Druid/Paladin --Ice Cold Milk (20)
    .target 艾德温·哈里
    .money <0.05 << Mage/Warlock/Priest/Shaman/Druid/Paladin

step << Undead
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师奥利斯特|r和|cRXP_FRIENDLY_亡灵卫兵博迪瑞格|r交谈
    .accept 477 >>接任务：越境
    .target +暗影牧师奥利斯特
    .goto 1421/0,1602.84,520.63
    .accept 6321 >>接任务：瑟伯切尔的补给
    .target +亡灵卫兵博迪瑞格
    .goto 1421/0,1625.94,499.91

step
    #label BorderCrossings
    .goto 1421/0,1602.84,520.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利斯特|r交谈
    .accept 477 >>接任务：越境
    .target 暗影牧师奥利斯特

step
    #completewith next
    .goto 1421/0,1640.22,509.43,8,0
    .goto 1421/0,1654.50,510.270,8,0
    .goto 1421/0,1654.08,521.470,8,0
    .goto 1421/0,1625.94,522.31,2 >> 进入墓穴

step
    .goto 1421/0,1625.94,522.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地下室的|cRXP_FRIENDLY_高级执行官哈德瑞克|r交谈
    .turnin 449 >>交任务：亡灵哨兵的报告
    .accept 3221 >>接任务：与伦弗利尔会面
    .accept 437 >>接任务：亡者农场
    .target 高级执行官哈德瑞克

step << Mage/Priest/Warlock
    .goto 1421/0,1626.100,511.500
    >> 拾取地上的|cRXP_PICK_发光的书籍|r。
    .collect 210177,1,79096,1 --Ataeric: On Arcane Curiosities
    --Other classes won't be nearby turnin in UC, probably not worth since it's only 160xp

step
    .goto 1421/0,1652.82,522.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师伦弗利尔|r交谈
    .turnin 429 >>交任务：荒野之心
    .turnin 445 >>交任务：给银松森林送信
    .turnin 3221 >>交任务：与伦弗利尔会面
    .accept 1359 >>接任务：给金格的货物
    .accept 447 >>接任务：致命的配方
    .accept 430 >>接任务：回到奎恩身旁
    .target 药剂师伦弗利尔
    .addquestitem 3164,429
    .isOnQuest 445

step
    #optional
    .goto 1421/0,1652.82,522.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师伦弗利尔|r交谈
    .turnin 429 >>交任务：荒野之心
    .turnin 3221 >>交任务：与伦弗利尔会面
    .accept 1359 >>接任务：给金格的货物
    .accept 447 >>接任务：致命的配方
    .accept 430 >>接任务：回到奎恩身旁
    .target 药剂师伦弗利尔
    .addquestitem 3164,429

step
    #completewith next
    >>击杀|cRXP_ENEMY_熊|r，获取|cRXP_LOOT_心脏|r
    .complete 447,1 --Grizzled Bear Heart (6)
    .mob 凶猛的灰斑熊

step
    #loop
    .goto 1421/0,1386.96,638.51,0
    .goto 1421/0,1336.56,568.51,50,0
    .goto 1421/0,1271.88,502.99,50,0
    .goto 1421/0,1285.74,460.99,50,0
    .goto 1421/0,1281.96,410.87,50,0
    .goto 1421/0,1274.4,361.87,50,0
    .goto 1421/0,1315.14,329.95,50,0
    .goto 1421/0,1386.96,638.51,50,0
    >>击杀|cRXP_ENEMY_月怒白头狼人|r
    .complete 421,1 --Moonrage Whitescalp (5)
    .mob 月怒白头狼人
    .unitscan 阿鲁高之子

step
    .goto 1421/0,1593.6,554.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔|r交谈
    .target 达拉尔·道恩维沃尔
    .turnin 421 >>交任务：证明你的价值
    .accept 422 >>接任务：阿鲁高的愚行

step
    #completewith Remedy
    .goto 1421/0,1234.92,891.070,80 >> 前往瓦尔甘农场

step
    #label Remedy
    .goto 1421/0,1234.92,891.070,8,0
    .goto 1421/0,1218.54,884.91,8,0
    .goto 1421/0,1226.52,886.03,8,0
    .goto 1421/0,1231.14,866.99
    >>进入房屋并上到二楼。拾取地上的|cRXP_PICK_布满灰尘的法术书|r
    .complete 422,1 --Remedy of Arugal (1)

step
    #completewith next
    >>击杀|cRXP_ENEMY_熊|r，获取|cRXP_LOOT_心脏|r
    .complete 447,1 --Grizzled Bear Heart (6)
    .mob 凶猛的灰斑熊

step
    #completewith next
    .goto 1421/0,1207.62,1293.71,80,0
    .subzone 239 >>前往伊瓦农场

step
    #label QuinnYorick
    .goto 1421/0,1207.62,1293.71,8,0
    .goto 1421/0,1220.64,1299.59,8,0
    .goto 1421/0,1212.66,1298.19,8,0
    .goto 1421/0,1205.94,1314.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与房子二楼的|cRXP_FRIENDLY_奎恩·尤瑞克|r交谈
    .turnin 430 >>交任务：回到奎恩身旁
    .accept 91920 >>接任务：鱼人之眼
    .target 奎恩·尤瑞克

step
    #loop
    .goto 1421/0,941.300,1210.400,0
    .goto 1421/0,706.700,1317.400,0
    .goto 1421/0,941.300,1210.400,50,0
    .goto 1421/0,830.000,1309.400,50,0
    .goto 1421/0,706.700,1317.400,50,0
    >>击杀|cRXP_ENEMY_邪鳍鱼人|r，拾取它们掉落的|T133884:0|t[|cRXP_LOOT_鱼人的眼球|r]。
    .collect 730,3,91920,1 --Collect Murloc Eyes (x3)
    .mob 邪鳍切割者
    .mob 邪鳍潮行者

step
    #completewith ArugalTurnin
    +|cRXP_WARN_小心！附近可能有|r|cRXP_ENEMY_阿鲁高之子|r|cRXP_WARN_出没！这是25级精英怪，务必远离他！|r
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
    .goto 1421/0,1541.52,1078.39
    >>在亡者农场附近击杀|cRXP_ENEMY_腐皮豺狼人|r，直到|cRXP_ENEMY_奈塔拉什|r出现。击杀她并拾取|cRXP_LOOT_精华|r
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
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯|r|cRXP_WARN_，她极难击杀！|r << !Mage !Warlock
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯|r|cRXP_WARN_。她虽难以击杀但并非不可能：她有一个造成130点伤害、冷却15秒的护盾，以及一个造成110点伤害的瞬发震击技能|r << Mage/Warlock
    .complete 447,2 --Skittering Blood (6)
    .mob 苔藓阔步者
    .unitscan 克雷希斯
    .unitscan 阿鲁高之子

step
    #label KillianVendor
    .goto 1421/0,2064.0,1167.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基利恩|r交谈
    .vendor >> 卖掉杂物
    .target 基利恩·萨纳森
    .isOnQuest 447

step
    #loop
    .goto 1421/0,1924.14,1269.070,0
    .goto 1421/0,1885.50,1218.95,50,0
    .goto 1421/0,1951.86,1218.39,50,0
    .goto 1421/0,1981.68,1209.15,50,0
    .goto 1421/0,2022.42,1183.95,50,0
    .goto 1421/0,2016.12,1239.39,50,0
    .goto 1421/0,1977.48,1260.670,50,0
    .goto 1421/0,1944.30,1279.43,50,0
    .goto 1421/0,1924.14,1269.070,50,0
    >>击杀|cRXP_ENEMY_蜘蛛|r，获取|cRXP_LOOT_血液|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯|r|cRXP_WARN_，她极难击杀！|r << !Mage !Warlock
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯|r|cRXP_WARN_。她虽难以击杀但并非不可能：她有一个造成130点伤害、冷却15秒的护盾，以及一个造成110点伤害的瞬发震击技能|r << Mage/Warlock
    .complete 447,2 --Skittering Blood (6)
    .mob 苔藓阔步者
    .unitscan 克雷希斯

step
    #loop
    .goto 1421/0,1702.8,1060.47,0
    .goto 1421/0,1712.46,1116.75,50,0
    .goto 1421/0,1702.8,1060.47,50,0
    .goto 1421/0,1670.88,1001.11,50,0
    .goto 1421/0,1573.86,971.15,50,0
    .goto 1421/0,1514.64,921.31,50,0
    >>继续击杀|cRXP_ENEMY_熊|r，拾取|cRXP_LOOT_心脏|r
    .complete 447,1 --Grizzled Bear Heart (6)
    .mob 凶猛的灰斑熊
    .mob 巨型灰斑熊
    .unitscan 维斯迦尔
    .unitscan 阿鲁高之子

step << skip
    #softcore
    #completewith ArugalTurnin
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活

step
    --#hardcore
    #completewith next
    .goto 1421/0,1538.58,511.39,100,0
    .subzone 228 >>返回瑟伯切尔

step
    .goto 1421/0,1593.6,554.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔|r交谈
    .turnin 422 >> 交任务：阿鲁高的愚行
    .accept 423 >> 接任务：阿鲁高的愚行
    .target 达拉尔·道恩维沃尔

step
    #optional
    #label ArugalTurnin

step
    #completewith next
    .goto 1421/0,1640.22,509.43,8,0
    .goto 1421/0,1654.50,510.270,8,0
    .goto 1421/0,1654.08,521.470,8,0
    .goto 1421/0,1625.94,522.31,2 >> 进入墓穴

step
    .goto 1421/0,1625.94,522.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地下室的|cRXP_FRIENDLY_高级执行官哈德瑞克|r交谈
    .turnin 437 >> 交任务：亡者农场
    .accept 438 >> 接任务：破旧渡口
    .target 高级执行官哈德瑞克

step
    .goto 1421/0,1652.600,522.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师伦弗利尔|r交谈
    .turnin 91920 >>交任务：鱼人之眼
    .accept 91921 >>接任务：再次回到奎恩身边
    .target 药剂师伦弗利尔

step << !Mage !Priest
    .goto 1421/0,1599.90,552.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格乌恩|r交谈
    >>|cRXP_BUY_购买|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_（她有售）|r
    .vendor >> 卖掉杂物
    .collect 4605,20,423,1 --Red-speckled Mushroom (20)
    .target 格乌恩·法隆

step
    .goto 1421/0,1602.84,549.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德温|r交谈
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（他有售）|r << Warlock/Priest/Shaman/Druid/Paladin
    .vendor >> |cRXP_BUY_如果有货，就向他购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_。|r
    .collect 1179,20,423,1 << Warlock/Priest/Shaman/Druid/Paladin --Ice Cold Milk (20)
    .target 艾德温·哈里

step << Warlock/Mage/Priest
    .goto 1421/0,1568.4,567.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德利亚|r交谈
    .vendor >> 如果有货，就向她购买|T132491:0|t[|cRXP_FRIENDLY_智者腰带|r]。
    .target 安德利亚·波恩顿
    .money <0.1400

step << Rogue
    .goto 1421/0,1576.38,571.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚历山德勒·雷夫瑞|r交谈
    .vendor >> 如果有货，就向她购买|T132539:0|t[|cRXP_FRIENDLY_轻便靴|r]。
    .target 亚历山德勒·雷夫瑞
    .money <0.2633

step << Warlock/Mage/Priest
    #optional
    #completewith Shackles
    +|cRXP_WARN_装备|r |T132491:0|t[|cRXP_FRIENDLY_智者腰带|r]
    .use 4786
    .itemcount 4786,1
    .xp <15,1
    .equip 6,4786

step << Rogue
    #optional
    #completewith Shackles
    +|cRXP_WARN_装备|r |T132539:0|t[|cRXP_FRIENDLY_轻便靴|r]
    .use 4788
    .itemcount 4788,1
    .xp <15,1
    .equip 8,4788

step
    #completewith Shackles
    .goto 1421/0,1593.60,597.91,15,0--c:Silverpine Forest,44.20,38.17
    .goto 1421/0,1582.68,640.47,15,0--c:Silverpine Forest,44.46,36.65
    .goto 1421/0,1563.78,738.75,30 >> 沿山坡下行--c:Silverpine Forest,44.91,33.14

step
    #completewith Yorick3
    +|cRXP_WARN_小心！附近可能有|r|cRXP_ENEMY_阿鲁高之子|r|cRXP_WARN_出没！这是25级精英怪，务必远离他！|r
    .unitscan 阿鲁高之子

step
    #label Shackles
    #completewith Yorick3
    .goto 1421/0,1609.1399,798.6667,50,0,0
    .goto 1421/0,1609.1399,798.6667,50,0
    .goto 1421/0,1592.7599,783.2667,50,0
    .goto 1421/0,1622.5799,760.0267,50,0
    .goto 1421/0,1660.3799,795.3067,50,0
    .goto 1421/0,1716.2399,819.6667,50,0
    .goto 1421/0,1782.5999,819.9467,50,0
    .goto 1421/0,1813.6799,850.4667,50,0
    .goto 1421/0,1842.2399,907.8667,50,0
    .goto 1421/0,1870.7999,990.1867,50,0
    .goto 1421/0,1851.0599,1019.0267,50,0
    .goto 1421/0,1830.4799,1052.6267,50,0
    .goto 1421/0,1781.3399,1015.3867,50,0
    .goto 1421/0,1707.4199,1008.3867,50,0
    .goto 1421/0,1722.1199,952.6667,50,0
    .goto 1421/0,1720.8599,875.3867,50,0
    .goto 1421/0,1685.5799,847.1067,50,0
    .goto 1421/0,1609.1399,798.6667,50,0
    >>击杀|cRXP_ENEMY_月怒暴食者|r和|cRXP_ENEMY_月怒魔魂狼人|r，拾取|cRXP_LOOT_镣铐|r
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_月怒魔魂狼人|r|cRXP_WARN_在生命值低于25%时会狂暴。当它们血量较低时，请迅速击杀|r
    .complete 423,1 --Glutton Shackle (6)
    .mob +月怒暴食者
    .complete 423,2 --Darksoul Shackle (3)
    .mob +月怒魔魂狼人
    .unitscan 阿鲁高之子

step
    #label Yorick3
    .goto 1421/0,1207.62,1293.71,8,0
    .goto 1421/0,1220.64,1299.59,8,0
    .goto 1421/0,1212.66,1298.19,8,0
    .goto 1421/0,1205.94,1314.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与房子二楼的|cRXP_FRIENDLY_奎恩·尤瑞克|r交谈
    .turnin 91921 >>交任务：再次回到奎恩身边
    .target 奎恩·尤瑞克

step
    .goto 1421/0,1204.68,1290.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .accept 425 >>接任务：邪恶的伊瓦
    .target 兰妮·尤瑞克

step
    .goto 1421/0,1265.58,1274.11,6,0
    .goto 1421/0,1270.62,1279.71,6,0
    .goto 1421/0,1285.32,1277.19
    >>击杀|cRXP_ENEMY_邪恶的伊瓦|r，获取|cRXP_LOOT_头颅|r
    >>|cRXP_WARN_伊瓦受到谷仓内两名|r|cRXP_ENEMY_鸦爪奴隶|r|cRXP_WARN_的保护。可以趁其中一名向前巡逻时单独把他引开|r
    >>|cRXP_WARN_注意：他们免疫恐惧！|r << Priest/Warlock
    .complete 425,1 --Ivar's Head (1)
    .target 邪恶的伊瓦
    .mob 鸦爪奴隶

step
    .goto 1421/0,1204.68,1290.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .turnin 425 >>交任务：邪恶的伊瓦
    .target 兰妮·尤瑞克

step
    #label DecrepitFerry
    .goto 1421/0,997.62,692.55
    >>点击码头边的|cRXP_PICK_小船|r
    .turnin 438 >>交任务：破旧渡口
    .accept 439 >>接任务：线索

step
    #loop
    .goto 1421/0,1079.000,375.000,0
    .goto 1421/0,1079.000,375.000,30,0
    .goto 1421/0,1015.900,417.200,20,0
    .goto 1421/0,1134.400,301.200,40,0
    >>击杀|cRXP_ENEMY_月怒暴食者|r和|cRXP_ENEMY_月怒魔魂狼人|r，拾取|cRXP_LOOT_镣铐|r
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_月怒魔魂狼人|r|cRXP_WARN_在生命值低于25%时会狂暴。当它们血量较低时，请迅速击杀|r
    .complete 423,1 --Glutton Shackle (6)
    .mob +月怒暴食者
    .complete 423,2 --Darksoul Shackle (3)
    .mob +月怒魔魂狼人
    .unitscan 阿鲁高之子

step
    #completewith next
    .goto 1421/0,1538.58,511.39,100 >> 返回瑟伯切尔
    .subzoneskip 228

step
    .goto 1421/0,1593.6,554.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔|r交谈
    .turnin 423 >>交任务：阿鲁高的愚行
    .accept 424 >>接任务：阿鲁高的愚行
    .target 达拉尔·道恩维沃尔

step
    #completewith next
    .goto 1421/0,1640.22,509.43,8,0
    .goto 1421/0,1654.50,510.270,8,0
    .goto 1421/0,1654.08,521.470,8,0
    .goto 1421/0,1625.94,522.31,2 >> 进入墓穴

step
    #label RotHideCluesTurnIn
    .goto 1421/0,1625.94,522.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地下室的|cRXP_FRIENDLY_高级执行官哈德瑞克|r交谈
    .turnin 439 >>交任务：线索
    .accept 440 >>接任务：黛丽娅的戒指
    .target 高级执行官哈德瑞克

step
    #completewith next
    .goto 1421/0,1077.84,380.35,10 >> 进入矿坑--c:Silverpine Forest,56.48,45.94

step
    #label GrimsonthePale
    .goto 1421/0,990.48,410.87--c:Silverpine Forest,58.56,44.85
    >>击杀|cRXP_ENEMY_白毛狼人格瑞姆森|r，搜刮以取得|cRXP_LOOT_格瑞姆森的头颅|r。
    .complete 424,1 --Head of Grimson (1)
    .target 白毛狼人格瑞姆森

step
    #hardcore
    .goto 1421/0,1354.62,-22.57
    >>点击营地里的|cRXP_PICK_板条箱|r
    >>|cRXP_WARN_小心！这些小怪会施放|r |T135846:0|t[寒冰箭]|cRXP_WARN_并在低生命值时逃离。把它们拉回来，一个一个击杀，直到你能安全地点击箱子为止|r
    .turnin 477 >>交任务：越境
    .accept 478 >>接任务：地图与符记
    .mob 达拉然学徒

step
    #label BorderCrossings
    #softcore
    .goto 1421/0,1354.62,-22.57
    >>点击营地里的|cRXP_PICK_板条箱|r
    >>|cRXP_WARN_小心，这些怪会施放|r|T135846:0|t[寒冰箭]|r
    .turnin 477 >>交任务：越境
    .accept 478 >>接任务：地图与符记
    .mob 达拉然学徒

step
    #completewith next
    #hardcore
    .goto 1421/0,1538.58,511.39,100 >> 返回瑟伯切尔--c:Silverpine Forest,45.51,41.26
    .subzoneskip 228

step
    #softcore
    #completewith next
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利斯特|r和|cRXP_FRIENDLY_达拉尔|r交谈
    .turnin 478 >>交任务：地图与符记
    .accept 481 >>接任务：达拉尔的推理
    .target +暗影牧师奥利斯特
    .goto 1421/0,1602.84,520.63
    .turnin 424 >>交任务：阿鲁高的愚行
    .turnin 481 >>交任务：达拉尔的推理
    .accept 482 >>接任务：达拉然的意图
    .target +达拉尔·道恩维沃尔
    .goto 1421/0,1593.6,554.23

step
    .goto 1421/0,1602.84,520.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利斯特|r交谈
    .turnin 482 >>交任务：达拉然的意图
    .target 暗影牧师奥利斯特

step
    .goto 1421/0,1579.600,461.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔比莎·织心::250686|r交谈。
    .accept 92401 >>接任务：惊恐的求援
    .target 塔比莎·织心::250686
    .xp <15,1
    .dungeon ROL

step
    .goto 1421/0,1533.96,474.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡洛斯|r交谈
    .turnin 6321 >>交任务：瑟伯切尔的补给 << Undead
    .accept 6323 >>接任务：飞往幽暗城 << Undead
    .fp Sepulcher >> 开通瑟伯切尔飞行点 << !Undead
    .fly Undercity >> 飞往幽暗城 << !Undead
    .target 卡洛斯·拉佐克
    .zoneskip Undercity

step << Undead
    .hs >> 使用炉石前往幽暗城
    .use 6948
    .zoneskip Undercity
    .bindlocation 1497,1

step << Undead
    .goto 1458/0,283.37,1610.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高顿|r交谈
    .turnin 6323 >> 交任务：飞往幽暗城
    .accept 6322 >> 接任务：迈克尔·加勒特
    .target 高顿·温德哈姆

step << Rogue
    #ssf
    .goto 1458/0,286.53,1616.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135343:0|t[战士阔剑]|cRXP_BUY_。|r
    .collect 2027,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 刘易斯·瓦伦

step << Rogue
    #ah
    .goto 1458/0,286.53,1616.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135343:0|t[战士阔剑]|cRXP_BUY_。|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的替代品|r
    .collect 2027,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 刘易斯·瓦伦

step << Rogue
    #optional
    #completewith Conscript
    +|cRXP_WARN_达到14级后装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6

step << Undead
    .goto 1458/0,266.20,1567.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈克尔|r交谈
    .turnin 6322 >>交任务：迈克尔·加勒特
    .target 迈克尔·加勒特

step << Rogue/Warrior
    .goto 1458/0,171.03,1524.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_玛丽|r交谈
    .train 3273 >>学习 |T135966:0|t[急救]
    .target 玛丽·艾塔斯

step << Rogue/Warrior
    #optional
    .goto 1458/0,171.03,1524.80
    .skill firstaid,40 >> 制作 |T133685:0|t[亚麻绷带]，直到急救技能达到40或以上
    .itemcount 2589,1 --Linen Cloth (1+)

step << Rogue/Warrior
    #optional
    .goto 1458/0,171.03,1524.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_玛丽|r交谈
    .train 3276 >> 学习 |T133688:0|t[厚亚麻绷带]
    .target 玛丽·艾塔斯
    .skill firstaid,<40,1

step << Rogue/Warrior
    #optional
    .goto 1458/0,171.03,1524.80
    .skill firstaid,50 >> 制作 |T133688:0|t[厚亚麻绷带]，直到急救技能达到50或以上。
    .itemcount 2589,2 --Linen Cloth (2+)

step << Rogue/Warrior
    .goto 1458/0,171.03,1524.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_玛丽|r交谈
    .train 3274 >> 学习中级急救
    .target 玛丽·艾塔斯
    .skill firstaid,<50,1

step << Undead Rogue
    .goto 1458/0,71.92,1435.630
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特·卡加德|r交谈
    .turnin 1886 >>交任务：亡灵哨兵
    .accept 1898 >>接任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestComplete 1886

step << Undead Rogue
    .goto 1458/0,71.92,1435.630
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特·卡加德|r交谈
    .accept 1898 >>接任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1886

step << Undead Rogue
    #optional
    .goto 1458/0,68.66,1416.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
    .train 1758 >> 学习职业技能
    .target 卡罗琳·瓦德
    .xp <14,1
    .xp >16,1
    .isOnQuest 1898 << Undead
    --XX Only train if you were directed here for class quest as an Undead

step << Undead Rogue
    #optional
    .goto 1458/0,68.66,1416.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
    .train 6761 >> 学习职业技能
    .target 卡罗琳·瓦德
    .xp <16,1
    .isOnQuest 1898 << Undead

step << Undead Rogue
    .goto 1458/0,347.07,1389.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德隆·甘特|r交谈
    .turnin 1898 >>交任务：亡灵哨兵
    .accept 1899 >>接任务：亡灵哨兵
    .target 安德隆·甘特
    .isQuestTurnedIn 1886

step << Undead Rogue
    .goto 1458/0,341.41,1385.90
    >>搜寻|cRXP_PICK_安德隆的书架|r，拾取其中的物品。书架位于|cRXP_FRIENDLY_安德隆|r身后
    .complete 1899,1 --Andron's Ledger (1)
    .isQuestTurnedIn 1886

step
    .goto 1458/0,310.900,1528.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷萨多·卢卡|r交谈
    .accept 97891 >>接任务：争分夺秒送药水
    .target 奥雷萨多·卢卡

step
    #completewith next
    #optional
    .goto 1458,54.383,73.014,50,0 << !Undead/!Rogue
    .goto 1458,52.837,77.725,20,0
    .goto 1458,52.275,79.254,15,0
    .goto 1458,51.279,79.923,15,0
    .goto 1458,49.693,78.903,15,0
    .goto 1458,47.951,76.171,15 >>前往炼金房

step
    .goto 1458/0,426.100,1403.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马丁·费尔本|r交谈
    .complete 97891,1 --|1/1 Speak to Doctor Martin Felben
    .turnin 97891 >>交任务：争分夺秒送药水
    .target 马丁·费尔本

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在炼金房与|cRXP_FRIENDLY_法拉尼尔|r和|cRXP_FRIENDLY_金格|r交谈。
    .turnin 447 >>交任务：致命的配方
    .target +大药剂师法拉尼尔
    .goto 1458/0,404.63,1434.67
    .turnin 1359 >> 交任务：给金格的货物
    .accept 1358 >> 接任务：给赫布瑞姆的样本
    .target +药剂师金格
    .goto 1458/0,391.97,1442.87

step
    .goto Undercity,56.2,96.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈（恐惧魔王）
    .accept 5725 >>接任务：毁灭之力
    .target 瓦里玛萨斯
    .dungeon RFC

step << Undead Rogue
    .goto 1458/0,71.83,1435.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特·卡加德|r交谈
    .turnin 1899 >>交任务：亡灵哨兵
    .accept 1978 >>接任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1886

step << Undead Rogue
    .goto 1420/0,373.60,1464.85,40,0
    .goto 1420/0,333.38,1287.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈（恐惧魔王）
    .turnin 1978 >>交任务：亡灵哨兵
    .target 瓦里玛萨斯
    .isQuestTurnedIn 1886

step << !Rogue !Warrior
    #optional
    .goto 1458/0,171.03,1524.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_玛丽|r交谈
    .train 3273 >> 学习初级急救，然后制作绷带
    .target 玛丽·艾塔斯

step << !Rogue !Warrior
    #optional
    .goto 1458/0,171.03,1524.80
    .skill firstaid,40 >> 制作 |T133685:0|t[亚麻绷带]，直到急救技能达到40或以上
    .itemcount 2589,1 --Linen Cloth (1+)

step << !Rogue !Warrior
    #optional
    .goto 1458/0,171.03,1524.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_玛丽|r交谈
    .train 3276 >> 学习 |T133688:0|t[厚亚麻绷带]
    .target 玛丽·艾塔斯
    .skill firstaid,<40,1

step << !Rogue !Warrior
    #optional
    .goto 1458/0,171.03,1524.80
    .skill firstaid,50 >> 制作 |T133688:0|t[厚亚麻绷带]，直到急救技能达到50或以上。
    .itemcount 2589,2 --Linen Cloth (2+)

step << !Rogue !Warrior
    #optional
    .goto 1458/0,171.03,1524.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|cRXP_FRIENDLY_玛丽|r交谈
    .train 3274 >> 学习中级急救
    .target 玛丽·艾塔斯
    .skill firstaid,<50,1

step << Mage
    .goto 1458/0,56.38,1813.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .train 2137 >> 学习职业技能
    .target 安娜斯塔西娅·哈特威尔
    .xp <14,1
    .xp >16,1
    --XX no dungeon RFC due to close proximity

step << Mage
    #optional
    .goto 1458/0,56.38,1813.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .train 2120 >> 学习职业技能
    .target 安娜斯塔西娅·哈特威尔
    .xp <16,1

step << Undead Warlock
    .goto 1458/0,20.02,1776.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_理查德|r交谈
    .train 6222 >> 学习职业技能
    .target 理查德·科尔文
    .xp <14,1
    .xp >16,1
    --XX no dungeon RFC due to close proximity

step << Undead Warlock
    #optional
    .goto 1458/0,20.02,1776.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_理查德|r交谈
    .train 1455 >> 学习职业技能
    .target 理查德·科尔文
    .xp <16,1

step << Paladin
    .goto 1458/0,418.500,1782.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加伦|r交谈
    .train 647 >>学习职业技能
    .target 加伦·拉戈
    .xp <14,1
    .xp >16,1

step << Paladin
    #optional
    .goto 1458/0,418.500,1782.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加伦|r交谈
    .train 7294 >>学习职业技能
    .target 加伦·拉戈
    .xp <16,1

step << Priest/Mage/Warlock
    .goto 1458/0,168.200,1663.100
    >> |Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧文·萨德::211022|r交谈
    .target 欧文·萨德::211022
    .turnin 79096 >> 交任务：阿塔瑞克：论奥术奇迹
    .itemcount 210177,1

step << Priest/Mage/Warlock
    #ssf
    .goto 1458/0,206.04,1705.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_赞恩·布拉德弗|r交谈
    >>|cRXP_BUY_向他购买一根|r |T135468:0|t[烟尘魔杖]
    .collect 5208,1 --Smoldering Wand (1)
    .money <0.3515
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .target 赞恩·布拉德弗

step << Priest/Mage/Warlock
    #ah
    .goto 1458/0,206.04,1705.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_赞恩·布拉德弗|r交谈
    >>|cRXP_BUY_向他购买一根|r |T135468:0|t[烟尘魔杖]
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的替代品|r
    .collect 5208,1 --Smoldering Wand (1)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .target 赞恩·布拉德弗

step << Priest/Mage/Warlock
    #optional
    #completewith Conscript
    +|cRXP_WARN_达到 15 级时，装备|r |T135468:0|t[烟尘魔杖] |cRXP_WARN_|r
    .use 5208
    .itemcount 5208,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp >15,1

step << Priest/Mage/Warlock
    #optional
    #completewith Conscript
    +|cRXP_WARN_装备|r |T135468:0|t[烟尘魔杖]
    .use 5208
    .itemcount 5208,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp <15,1

step << Undead Rogue
    #optional
    #completewith Conscript
    >>放弃<亡灵哨兵>，已经没机会做了
    .abandon 1886 >> 放弃亡灵哨兵任务
    .isOnQuest 1886

step << Undead
    #completewith next
    .goto 1420/0,235.32,1883.89,50,0
    .zone Tirisfal Glades >> 离开幽暗城
    .zoneskip Tirisfal Glades

step << Undead
    #label ZeptoDurotar
    .goto 1420/0,278.70,2071.27,12,0
    .goto 1420/0,253.85,2059.82,10,0
    .goto 1420/0,264.70,2053.50,8,0
    .goto 1420/0,271.02,2064.94,8,0
    .goto 1420/0,259.72,2068.86,8,0
    .goto 1420/0,261.53,2055.00,8,0
    .goto 1420/0,299.04,2069.46,-1
    .goto 1420/0,279.61,2441.21,-1
    .zone Durotar >>乘坐飞艇前往杜隆塔尔
    >>等待时制作磨刀石和绷带 << Warrior/Rogue
    >>等待时施放造食术和造水术 << Mage
    .zoneskip Durotar

step << Druid
    #completewith DruidTraining1
    .cast 18960 >>|cRXP_WARN_施放|r |T135758:0|t[传送: 月光林地]
    .zoneskip Moonglade

step << Skyborne Druid
    .goto 1450/1,-2678.76,8019.94--c:Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特|r交谈
    .turnin 94913 >>交任务：月光林地
    .target 德迪利特·星焰

step << Druid
    .goto 1450/1,-2593.82,7866.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 5178 >> 学习职业技能
    .target 洛甘纳尔
    .xp <14,1
    .xp >16,1

step << Druid
    #label DruidTraining1
    .goto 1450/1,-2593.82,7866.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 8925 >> 学习职业技能
    .target 洛甘纳尔
    .xp <16,1

step << Skyborne
    .hs >> 炉石传送至奥格瑞玛
    .use 6948
    .zoneskip Orgrimmar
    .bindlocation 1637,1

step << Undead
    #completewith HiddenEnemiesPickup
    .goto 1454/1,-4367.46,1405.44,50,0
    .zone Orgrimmar >> 前往奥格瑞玛
    .dungeon RFC

step << Undead
    .goto 1454/1,-4313.60,1676.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
    >>|cRXP_WARN_不要飞行！|r
    .fp Orgrimmar >> 开通奥格瑞玛飞行点
    .target 多拉斯
    .dungeon RFC

step << Undead/Skyborne
    #label HiddenEnemiesPickup
    .goto 1454/1,-4125.79,1920.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .accept 5726 >>接任务：隐藏的敌人
    .target 萨尔
    .dungeon RFC

step << Undead/Skyborne
    #completewith Gazzuz
    .goto 1454/1,-4367.46,1405.44,50,0
    .zone Durotar >> 离开奥格瑞玛
    .dungeon RFC

step << Undead/Skyborne
    #completewith Gazzuz
    >>击杀 |cRXP_ENEMY_火刃兽人|r，拾取他们掉落的 |cRXP_LOOT_军官的徽章|r
    >> |cRXP_WARN_这是怒焰裂谷的前置任务，任务物品掉率较低。|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob 火刃狂热者
    .mob 火刃学徒
    .dungeon RFC

step << Undead/Skyborne
    #label Gazzuz
    .goto 1411/1,-4701.42,1455.83
    >>击杀|cRXP_ENEMY_加祖兹|r，拾取掉落的 |T134085:0|t[|cRXP_LOOT_燃影之眼|r]
    >>|cRXP_WARN_使用 |T134085:0|t[|cRXP_LOOT_燃影之眼|r]开启任务|r
    >> |cRXP_WARN_利用障碍物卡视野，躲避|cRXP_ENEMY_加祖兹|r的暗影箭。|r
    >>|cRXP_WARN_击杀|r|cRXP_ENEMY_加祖兹|r|cRXP_WARN_后，跑到洞穴内的水域躲避|r|cRXP_ENEMY_虚空行者|r
    >>|cRXP_WARN_小心，加祖兹很难对付；必要时可以跳过此任务|r
    .collect 4903,1,832,1 --Collect Eye of Burning Shadow
    .accept 832 >>接任务: 燃影之眼
    .use 4903
    .unitscan 加祖兹
    .dungeon RFC

step << Undead/Skyborne
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
    >>击杀 |cRXP_ENEMY_火刃兽人|r，拾取他们掉落的 |cRXP_LOOT_军官的徽章|r
    >> |cRXP_WARN_这是怒焰裂谷的前置任务，任务物品掉率较低。|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob 火刃狂热者
    .mob 火刃学徒
    .dungeon RFC

step << Undead/Skyborne
    #completewith Conscript
    .subzone 362 >> 前往 [剃刀岭]

step << !Undead !Skyborne
    .hs >> 炉石回剃刀岭
    .use 6948
    .subzoneskip 362
    .bindlocation 362,1

step << Rogue
    #optional << Undead
    .goto 1411/1,-4710.94,268.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 1758 >> 学习职业技能
    .target 卡普拉克
    .xp <14,1
    .xp >16,1

step << Rogue
    #optional << Undead
    .goto 1411/1,-4710.94,268.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 6761 >> 学习职业技能
    .target 卡普拉克
    .xp <16,1

step << Priest
    #optional << Undead
    .goto 1411/1,-4831.5,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .train 8122 >>学习职业技能
    .target 泰金
    .xp <14,1
    .xp >16,1

step << Priest
    #optional << Undead
    .goto 1411/1,-4831.5,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .train 8102 >>学习职业技能
    .target 泰金
    .xp <16,1

step << Warrior
    #optional << Undead
    .goto 1411/1,-4827.27,311.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 285 >>学习职业技能
    .target 塔绍尔·锯痕
    .xp <16,1

step << Warlock
    #optional << Undead
    .goto 1411/1,-4837.31,356.030
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜格鲁·血怒|r交谈
    .train 6222 >> 学习职业技能
    .target 杜格鲁·血怒
    .xp <14,1
    .xp >16,1

step << Warlock
    #optional << Undead
    .goto 1411/1,-4837.31,356.030
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜格鲁·血怒|r交谈
    .train 1455 >> 学习职业技能
    .target 杜格鲁·血怒
    .xp <16,1

step
    #label Conscript
    .goto 1411/1,-4648.55,271.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林|r交谈
    .accept 840 >>接任务：部落的新兵
    .target 塔克林·寻路者

step
    #completewith next
    .subzone 379 >> 前往 [远望岗哨]

step
    .goto 1413/1,-3687.11,303.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加尔·战痕|r交谈
    .turnin 840 >>交任务：部落的新兵
    .accept 842 >>接任务：十字路口征兵
    .target 卡加尔·战痕

step << !Undead !Skyborne
    .goto 1413/1,-3694.2,256.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅克塞罗斯|r交谈
    .turnin 809 >>交任务：雅克塞罗斯
    .accept 924 >>接任务：恶魔之种
    .target 雅克塞罗斯
    .isQuestTurnedIn 829

step << !Undead !Skyborne
    .goto 1413/1,-3694.2,259.22
    >>|cRXP_WARN_拾取|r |T134095:0|t[有瑕疵的能量石]|cRXP_WARN_，它就在|r|cRXP_FRIENDLY_雅克塞罗斯|r|cRXP_WARN_旁边。该物品有30分钟计时限制，请抓紧|r
    .turnin 926 >>交任务：有瑕疵的能量石
    .isOnQuest 924
]])
