local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
#xprate <1.99
<< Horde
#version 11
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#defaultfor Undead
#name 1-6 Tirisfal Glades
#next 6-11 Tirisfal Glades
#displayname 1-6 提瑞斯法林地
step << !Undead
    #completewith next
    +|cRXP_WARN_您选择的指南适用于亡灵角色，建议选择与角色起始区域相同的指南。|r
step << !Undead Mage
    #season 2
    #completewith next
    +在探索季中, 法师不应在种族起始区域之外开始游戏, 否则无法在此获得第一个符文 (|T133816:0|t[铭刻手套 - 冰枪术])
step
    #completewith Zombies
	.destroy 6948 >> 摧毁背包里的 |T134414:0|t[炉石]，之后不再需要它
step
    #completewith next
    .goto Tirisfal Glades,30.04,72.78,8,0
    .goto Tirisfal Glades,30.27,72.78,8,0
    .goto Tirisfal Glades,30.22,71.65,10 >> 从墓穴里跑出来, 朝着 |cRXP_FRIENDLY_摩尔多|r 跑去
step
    .goto Tirisfal Glades,30.22,71.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_送葬者摩尔多|r 交谈
    .accept 363 >> 接任务：突然醒来
    .target 送葬者摩尔多
step << Warrior/Warlock/Priest/Mage
    #completewith Vendor
    .goto Tirisfal Glades,30.70,69.28,0 << Warrior/Warlock
    .goto Tirisfal Glades,29.92,70.30,40,0
    .goto Tirisfal Glades,30.70,69.28,40,0
    .goto Tirisfal Glades,29.18,68.94,40,0 << Priest/Mage
    .goto Tirisfal Glades,29.10,67.66,40,0 << Priest/Mage
    .goto Tirisfal Glades,30.19,65.32,40,0 << Priest/Mage
    +|cRXP_WARN_击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_夜行蝙蝠|r, 拾取战利品，直到可出售物品（包括你身上的护甲）的总价值达到 60 铜|r << Mage
    +|cRXP_WARN_击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_夜行蝙蝠|r, 拾取战利品，直到可出售物品（包括你身上的护甲）的总价值达到 50 铜|r << Priest
    +|cRXP_WARN_击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_夜行蝙蝠|r, 拾取战利品，直到可出售物品（包括你身上的护甲）的总价值达到 10 铜|r << Warrior/Warlock
    .mob 食腐狼幼崽
    .mob 夜行蝙蝠
    .money >0.006 << Mage
    .money >0.005 << Priest
    .money >0.001 << Warrior/Warlock
step << Warrior/Priest/Mage
    #completewith Vendor
    .goto Tirisfal Glades,32.22,65.64,8 >> 进入建筑
step << Priest/Mage
    #label Vendor
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒·基恩|r
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
    .vendor >> 卖掉杂物
	.collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .target 乔舒·基恩
step << Warlock/Mage
    #sticky
    #label Piercing
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温雅·玛山德|r和|cRXP_FRIENDLY_暗影牧师萨维斯|r交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_暗影牧师萨维斯|r 交谈 << Mage
    .accept 1470 >>接任务：控制小鬼 << Warlock
    .goto Tirisfal Glades,30.98,66.41 << Warlock
    .target +温雅·玛山德 << Warlock
    .turnin 363 >> 交任务：突然醒来
    .accept 364 >> 接任务：无脑的僵尸
    .target +暗影牧师萨维斯
    .goto Tirisfal Glades,30.84,66.20
step << Warlock/Mage
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_新兵艾尔雷斯|r 交谈
    .accept 376 >> 接任务：被诅咒者
    .goto Tirisfal Glades,30.86,66.05
    .target 新兵艾尔雷斯
    .xp <2,1
step << Mage
    #requires Piercing
    .goto Tirisfal Glades,30.94,66.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_伊莎贝拉|r
    .train 1459 >> 学习|T135932:0|t[奥术智慧]
    .target 伊莎贝拉
step << Warlock
    #label Vendor
    .goto Tirisfal Glades,30.81,66.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·斯密瑟|r交谈
    .vendor >>卖掉杂物
    .target 凯拉·斯密瑟
    .money >0.001
step << Warlock
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_马克希米林|r
    .train 348 >>学习 |T135817:0|t[献祭]
    .target 马克希米林
step << !Warlock !Mage
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_暗影牧师萨维斯|r 交谈
    .turnin 363 >> 交任务：突然醒来
    .accept 364 >> 接任务：无脑的僵尸
    .target 暗影牧师萨维斯
step << !Warlock !Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_新兵艾尔雷斯|r 交谈
    .accept 376 >> 接任务：被诅咒者
    .goto Tirisfal Glades,30.86,66.05
    .target 新兵艾尔雷斯
    .xp <2,1
step << Warrior
    #completewith next
    #label Vendor
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_阿基班德|r
    .vendor >> 卖掉杂物
    .target 阿基班德·卡瓦
    .money >0.001
step << Warrior
    #label Training1
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丹纳尔|r
    .train 6673 >>学习 |T132333:0|t[战斗怒吼]
    .target 丹纳尔·斯特恩
step << Warlock
    #requires Piercing
    #loop
    .goto Tirisfal Glades,31.82,61.48,0
    .goto Tirisfal Glades,31.82,61.48,30,0
    .goto Tirisfal Glades,31.11,60.71,30,0
    .goto Tirisfal Glades,32.07,60.17,30,0
    .goto Tirisfal Glades,32.26,59.21,30,0
    .goto Tirisfal Glades,33.28,59.53,30,0
    .goto Tirisfal Glades,33.66,60.76,30,0
    .goto Tirisfal Glades,33.94,61.81,30,0
    .goto Tirisfal Glades,34.21,63.05,30,0
    .goto Tirisfal Glades,33.01,63.01,30,0
    >>击杀 |cRXP_ENEMY_断骨骷髅|r, 搜刮 |cRXP_LOOT_断骨骷髅的颅骨|r
    .complete 1470,1 --Rattlecage Skull (3)
    .mob 断骨骷髅
step << Warlock
    #completewith next
    +|cRXP_WARN_击杀 |cRXP_ENEMY_无脑僵尸|r 和 |cRXP_ENEMY_丑陋的僵尸|r, 拾取战利品，直到可出售物品（包括你身上的护甲）的总价值达到 25 铜|r
    .mob 无脑的僵尸
    .mob 丑陋的僵尸
    .money >0.0025
step << Warlock
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒|r
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
	.collect 159,5,383,1 --Collect Refreshing Spring Water (5)
    .target 乔舒·基恩
    .isOnQuest 1470
step << Warlock
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.98,66.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_温雅|r
    .turnin 1470 >>交任务 控制小鬼
    .target 温雅·玛山德
step << Warlock
    #completewith next
    .cast 688 >>|cRXP_WARN_施放|r |T136218:0|t[召唤小鬼]
step
    #label Zombies
    #requires Piercing << Warlock/Mage
    #loop
	.goto Tirisfal Glades,31.72,63.98,0
	.goto Tirisfal Glades,31.72,63.98,40,0
	.goto Tirisfal Glades,30.69,63.88,40,0
	.goto Tirisfal Glades,30.90,62.20,40,0
	.goto Tirisfal Glades,30.73,61.66,40,0
	.goto Tirisfal Glades,31.14,61.41,40,0
	.goto Tirisfal Glades,31.80,61.83,40,0
	.goto Tirisfal Glades,32.85,63.02,40,0
	.goto Tirisfal Glades,32.90,63.54,40,0
	.goto Tirisfal Glades,33.41,63.06,40,0
	.goto Tirisfal Glades,33.75,62.86,40,0
	.goto Tirisfal Glades,33.51,63.82,40,0
	.goto Tirisfal Glades,33.55,64.57,40,0
	.goto Tirisfal Glades,33.29,64.96,40,0
    >>击杀 |cRXP_ENEMY_无脑僵尸|r 和 |cRXP_ENEMY_丑陋的僵尸|r
    .complete 364,1 --Kill Mindless Zombie (x8)
    .mob +无脑的僵尸
    .complete 364,2 --Kill Wretched Zombie (x8)
    .mob +丑陋的僵尸
step << Mage/Warlock/Priest
    #completewith Vendor2
    +|cRXP_WARN_击杀 |cRXP_ENEMY_无脑僵尸|r 和 |cRXP_ENEMY_丑陋的僵尸|r, 拾取战利品，直到可出售物品（包括你身上的护甲）的总价值达到 33 铜|r
    .mob 无脑的僵尸
    .mob 丑陋的僵尸
    .money >0.0033
step << Mage/Warlock/Priest
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒·基恩|r
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
    .collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .vendor >> 卖掉杂物
    .target 乔舒·基恩
    .isOnQuest 364
    .money <0.0050
    .itemcount 159,<10
 step << Mage/Warlock/Priest
    #label Vendor2
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒·基恩|r
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
    .collect 159,5,383,1 --Collect Refreshing Spring Water (5)
    .vendor >> 卖掉杂物
    .target 乔舒·基恩
    .isOnQuest 364
    .money >0.0050
    .itemcount 159,<5
step
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r和|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈 << !Warlock !Mage !Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r、|cRXP_FRIENDLY_新兵艾尔雷斯|r，以及|cRXP_FRIENDLY_马克希米林|r交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r、|cRXP_FRIENDLY_新兵艾尔雷斯|r，以及|cRXP_FRIENDLY_伊莎贝拉|r交谈 << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r、|cRXP_FRIENDLY_新兵艾尔雷斯|r，以及|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈 << Priest
    .turnin 364 >> 交任务：无脑的僵尸
    .accept 3095 >> 接任务：简易卷轴 << Warrior
    .accept 3096 >> 接任务：密文卷轴 << Rogue
    .accept 3097 >> 接任务：神圣卷轴 << Priest
    .accept 3098 >> 接任务：雕文卷轴 << Mage
    .accept 3099 >> 接任务：被污染的卷轴 << Warlock
    .accept 3901 >> 接任务：断骨骷髅
    .target +暗影牧师萨维斯
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .accept 376 >> 接任务：被诅咒者
    .target +新兵艾尔雷斯
    .goto Tirisfal Glades,30.86,66.05
    .turnin 3099 >> 交任务：被污染的卷轴 << Warlock
    .accept 77672 >>接受失落的符文 << Warlock
    .target +马克希米林 << Warlock
    .goto Tirisfal Glades,30.91,66.34 << Warlock
    .turnin 3098 >> 交任务：雕文卷轴 << Mage
    .accept 77671 >>接受任务：法术研究 << Mage
    .target +伊莎贝拉 << Mage
    .goto Tirisfal Glades,30.94,66.06 << Mage
    .turnin 3097 >> 交任务：神圣卷轴 << Priest
    .target +黑暗牧师杜斯滕 << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
step
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r和|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈 << !Warlock !Mage !Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r、|cRXP_FRIENDLY_新兵艾尔雷斯|r，以及|cRXP_FRIENDLY_马克希米林|r交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r、|cRXP_FRIENDLY_新兵艾尔雷斯|r，以及|cRXP_FRIENDLY_伊莎贝拉|r交谈 << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r、|cRXP_FRIENDLY_新兵艾尔雷斯|r，以及|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈 << Priest
    .turnin 364 >> 交任务：无脑的僵尸
    .accept 3095 >> 接任务：简易卷轴 << Warrior
    .accept 3096 >> 接任务：密文卷轴 << Rogue
    .accept 3097 >> 接任务：神圣卷轴 << Priest
    .accept 3098 >> 接任务：雕文卷轴 << Mage
    .accept 3099 >> 接任务：被污染的卷轴 << Warlock
    .accept 3901 >> 接任务：断骨骷髅
    .target +暗影牧师萨维斯
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .accept 376 >> 接任务：被诅咒者
    .target +新兵艾尔雷斯
    .goto Tirisfal Glades,30.86,66.05
    .turnin 3099 >> 交任务：被污染的卷轴 << Warlock
    .goto Tirisfal Glades,30.91,66.34 << Warlock
    .target +马克希米林 << Warlock
    .turnin 3098 >> 交任务：雕文卷轴 << Mage
    .goto Tirisfal Glades,30.94,66.06 << Mage
    .target +伊莎贝拉 << Mage
    .turnin 3097 >> 交任务：神圣卷轴 << Priest
    .target +黑暗牧师杜斯滕 << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
step << Priest
    #season 2
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黑暗牧师杜斯滕|r 交谈
    .accept 77670 >> 接任务：亡灵冥想
    .target 黑暗牧师杜斯滕
step << Priest
    #season 2
    .goto Tirisfal Glades,31.17,65.08
    .emote KNEEL
    .aura 418459 >> 在教堂旁的墓地中跪下，获得 [亡灵之思] 增益
    .isOnQuest 77670
    .train 402862,1
step << Priest
    #season 2
    .train 402862 >> 使用 |T136222:0|t[忧虑助祭的回忆] 学习 |T237545:0|t[苦修]
    .use 205951
    .itemcount 205951,1
    .isOnQuest 77670
step << Priest
    #season 2
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_黑暗牧师杜斯滕|r
    .turnin 77670 >>交任务: 亡灵冥想
    .target 黑暗牧师杜斯滕
step << Mage/Warlock/Priest
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒|r
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
    .collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .target 乔舒·基恩
    .isQuestTurnedIn 364
step
    #loop
    .goto Tirisfal Glades,34.32,56.79,0
    .goto Tirisfal Glades,29.21,66.68,40,0
    .goto Tirisfal Glades,29.48,65.70,40,0
    .goto Tirisfal Glades,29.60,64.04,40,0
    .goto Tirisfal Glades,29.67,63.39,40,0
    .goto Tirisfal Glades,30.09,61.51,40,0
    .goto Tirisfal Glades,30.97,59.66,40,0
    .goto Tirisfal Glades,31.61,58.57,40,0
    .goto Tirisfal Glades,32.07,57.74,40,0
    .goto Tirisfal Glades,32.85,58.35,40,0
    .goto Tirisfal Glades,34.32,56.79,40,0
    >>击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_蓬毛食腐狼|r, 搜刮 |cRXP_LOOT_食腐狼的爪子|r
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r 和 |cRXP_ENEMY_癞皮夜行蝙蝠|r, 搜刮 |cRXP_LOOT_夜行蝙蝠翼|r
    >>|cRXP_WARN_尽可能避开 |cRXP_ENEMY_癞皮夜行蝙蝠|r, 它们比正常的 |cRXP_ENEMY_夜行蝙蝠|r 难对付得多|r
    .complete 376,1 --Collect Scavenger Paw (x6)
    .mob +食腐狼幼崽
    .mob +蓬毛食腐狼
    .complete 376,2 --Collect Duskbat Wing (x6)
    .mob +夜行蝙蝠
    .mob +癞皮夜行蝙蝠
step
    #loop
    .goto Tirisfal Glades,31.82,61.48,0
    .goto Tirisfal Glades,31.82,61.48,30,0
    .goto Tirisfal Glades,31.11,60.71,30,0
    .goto Tirisfal Glades,32.07,60.17,30,0
    .goto Tirisfal Glades,32.26,59.21,30,0
    .goto Tirisfal Glades,33.28,59.53,30,0
    .goto Tirisfal Glades,33.66,60.76,30,0
    .goto Tirisfal Glades,33.94,61.81,30,0
    .goto Tirisfal Glades,34.21,63.05,30,0
    .goto Tirisfal Glades,33.01,63.01,30,0
    >>击杀 |cRXP_ENEMY_断骨骷髅|r
    .complete 3901,1 --Kill Rattlecage Skeleton (12)
    .mob 断骨骷髅
step
    #som--xpgate
    #optional
    #loop
    .goto Tirisfal Glades,31.82,61.48,30,0
    .goto Tirisfal Glades,31.11,60.71,30,0
    .goto Tirisfal Glades,32.07,60.17,30,0
    .goto Tirisfal Glades,32.26,59.21,30,0
    .goto Tirisfal Glades,33.28,59.53,30,0
    .goto Tirisfal Glades,33.66,60.76,30,0
    .goto Tirisfal Glades,33.94,61.81,30,0
    .goto Tirisfal Glades,34.21,63.05,30,0
    .goto Tirisfal Glades,33.01,63.01,30,0
    .xp 3+480 >>刷怪至 480+/1400 经验值 << Warrior/Rogue
    .xp 3+560 >>刷怪至 560+/1400 经验值 << !Warrior !Rogue
    .mob 无脑的僵尸
    .mob 丑陋的僵尸
step
    #era
    #optional
    #loop
    .goto Tirisfal Glades,31.82,61.48,30,0
    .goto Tirisfal Glades,31.11,60.71,30,0
    .goto Tirisfal Glades,32.07,60.17,30,0
    .goto Tirisfal Glades,32.26,59.21,30,0
    .goto Tirisfal Glades,33.28,59.53,30,0
    .goto Tirisfal Glades,33.66,60.76,30,0
    .goto Tirisfal Glades,33.94,61.81,30,0
    .goto Tirisfal Glades,34.21,63.05,30,0
    .goto Tirisfal Glades,33.01,63.01,30,0
    .xp 3+940 >>刷怪至 940+/1400 经验值 << Warrior/Rogue
    .xp 3+980 >>刷怪至 980+/1400 经验值 << !Warrior !Rogue
    .mob 无脑的僵尸
    .mob 丑陋的僵尸
step << Mage/Warlock/Priest
    .goto Tirisfal Glades,32.25,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒·基恩|r
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
    >>|cRXP_WARN_身上至少保留 1 枚银币|r << Mage/Warlock/Priest
    .vendor >> 卖掉杂物
    .target 乔舒·基恩
    .money >0.01
    .isOnQuest 3901
    .itemcount 159,<20
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r和|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .turnin 3901 >> 交任务：断骨骷髅
    .target +暗影牧师萨维斯
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .turnin 376 >> 交任务：被诅咒者
    .accept 6395 >> 接任务：玛拉的遗愿
    .target +新兵艾尔雷斯
    .goto Tirisfal Glades,30.86,66.05
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_黑暗牧师杜斯滕|r
    .train 589 >> 学习你的职业技能
    .target 黑暗牧师杜斯滕
    .money <0.021
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_黑暗牧师杜斯滕|r
    .train 2052 >> 学习|T135929:0|t[次级治疗术（等级2）]
    .train 589 >> 学习|T136207:0|t[暗言术：痛]
    .target 黑暗牧师杜斯滕
    .money <0.02
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_黑暗牧师杜斯滕|r
    .train 1243 >> 学习|T135987:0|t[真言术：韧]
    .train 589 >> 学习|T136207:0|t[暗言术：痛]
    .target 黑暗牧师杜斯滕
    .money <0.011
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_黑暗牧师杜斯滕|r
    .train 589 >> 学习|T136207:0|t[暗言术：痛]
    .target 黑暗牧师杜斯滕
    .money <0.01
step << Warlock
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_马克希米林|r
    .train 172 >> 学习|T136118:0|t[腐蚀术]
    .target 马克希米林
step << Mage
    .goto Tirisfal Glades,30.94,66.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_伊莎贝拉|r
    .train 116 >> 学习|T135846:0|t[寒冰箭]
    .target 伊莎贝拉
step
    #xprate <1.5
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵萨尔坦|r和|cRXP_FRIENDLY_执行官阿伦|r交谈
    .accept 3902 >> 接任务：捡破烂
    .goto Tirisfal Glades,31.61,65.62
    .target +亡灵卫兵萨尔坦
    .accept 380 >> 接任务：夜行蜘蛛洞穴
    .goto Tirisfal Glades,32.15,66.01
    .target +执行官阿伦
step
    #xprate >1.49
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官阿伦|r交谈
    .accept 380 >> 接任务：夜行蜘蛛洞穴
    .goto Tirisfal Glades,32.15,66.01
    .target 执行官阿伦
step << Rogue/Warrior
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_阿基班德|r
    .vendor >> 卖掉杂物
    .target 阿基班德·卡瓦
    .money >0.1
    .isOnQuest 3095 << Warrior
    .isOnQuest 3096 << Rogue
step << Warrior
    #season 2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丹纳尔·斯特恩|r
    .turnin 3095 >> 交任务：简易卷轴
    .accept 77668 >> 接受失落的符文
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 丹纳尔·斯特恩
    .money <0.02
 step << Warrior
    #season 2
    #label Training2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丹纳尔·斯特恩|r
    .turnin 3095 >> 交任务：简易卷轴
    .accept 77668 >> 接受失落的符文
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 丹纳尔·斯特恩
    .money <0.01
step << Warrior
    #season 0,1
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丹纳尔·斯特恩|r
    .turnin 3095 >> 交任务：简易卷轴
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 丹纳尔·斯特恩
    .money <0.02
 step << Warrior
    #season 0,1
    #label Training2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丹纳尔·斯特恩|r
    .turnin 3095 >> 交任务：简易卷轴
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 丹纳尔·斯特恩
    .money <0.01
step << Warrior
    #season 0,1
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹纳尔·斯特恩|r 交谈
    .turnin 3095 >> 交任务：简易卷轴
    .target 丹纳尔·斯特恩
step << Warrior
    #season 2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹纳尔·斯特恩|r 交谈
    .turnin 3095 >> 交任务：简易卷轴
    .accept 77668 >> 接任务：失落的符文
    .target 丹纳尔·斯特恩
step << Rogue
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大卫·提亚斯|r交谈
    .turnin 3096 >> 交任务：密文卷轴
    .accept 77669 >>接任务：血色符文
    .train 53 >> 学习|T132090:0|t[背刺]
    .money <0.04
    .target 大卫·提亚斯
step << Rogue
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大卫·提亚斯|r交谈
    .turnin 3096 >> 交任务：密文卷轴
    .accept 77669 >>接任务：血色符文
    .target 大卫·提亚斯
    .train 1784 >> 学习 |T132320:0|t[潜行]
step << Rogue
    #season 0,1
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大卫·提亚斯|r交谈
    .turnin 3096 >> 交任务：密文卷轴
    .train 53 >> 学习|T132090:0|t[背刺]
    .money <0.04
    .target 大卫·提亚斯
step << Rogue
    #season 0,1
    #label Training2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大卫·提亚斯|r交谈
    .turnin 3096 >> 交任务：密文卷轴
    .target 大卫·提亚斯
    .train 1784 >> 学习 |T132320:0|t[潜行]
step
    #xprate >1.49
    #optional
    #completewith NightWebStart
    .abandon 3902 >> 放弃任务: [捡破烂]
step
    #xprate <1.5
    #loop
	.goto Tirisfal Glades,32.37,64.37,0
	.goto Tirisfal Glades,32.37,64.37,12,0
	.goto Tirisfal Glades,32.81,64.39,12,0
	.goto Tirisfal Glades,32.89,64.60,12,0
	.goto Tirisfal Glades,33.01,65.38,12,0
	.goto Tirisfal Glades,33.79,64.57,12,0
	.goto Tirisfal Glades,33.13,63.08,12,0
	.goto Tirisfal Glades,32.79,63.11,12,0
	.goto Tirisfal Glades,31.86,61.49,12,0
	.goto Tirisfal Glades,31.75,61.96,12,0
	.goto Tirisfal Glades,31.70,62.53,12,0
	.goto Tirisfal Glades,31.34,62.44,12,0
    >>打开地面上的 |cRXP_PICK_物资箱|r, 搜刮 |cRXP_LOOT_破烂装备|r
    .complete 3902,1 --Collect Scavenged Goods (x6)
step
    #label NightWebStart
    #loop
	.goto Tirisfal Glades,29.94,57.33,0
	.goto Tirisfal Glades,29.94,57.33,40,0
	.goto Tirisfal Glades,29.82,56.03,40,0
	.goto Tirisfal Glades,29.25,55.77,40,0
	.goto Tirisfal Glades,28.40,56.51,40,0
	.goto Tirisfal Glades,27.68,57.10,40,0
	.goto Tirisfal Glades,28.29,58.31,40,0
	.goto Tirisfal Glades,28.25,59.41,40,0
	.goto Tirisfal Glades,28.80,59.53,40,0
	.goto Tirisfal Glades,29.29,59.40,40,0
	.goto Tirisfal Glades,29.67,58.53,40,0
    >>击杀 |cRXP_ENEMY_小夜行蜘蛛|r
    .complete 380,1,6 --Kill Young Night Web Spider (10)
    .mob 小夜行蜘蛛
step
    #loop
	.goto Tirisfal Glades,28.25,58.27,0
	.goto Tirisfal Glades,28.25,58.27,25,0
	.goto Tirisfal Glades,28.42,59.07,25,0
	.goto Tirisfal Glades,27.86,60.57,25,0
	.goto Tirisfal Glades,27.17,59.18,25,0
	.goto Tirisfal Glades,27.30,57.97,25,0
	.goto Tirisfal Glades,26.94,56.42,25,0
	.goto Tirisfal Glades,27.51,56.00,25,0
    >>击杀靠近洞穴入口的 |cRXP_ENEMY_小夜行蜘蛛|r
    .complete 380,1 --Kill Young Night Web Spider (10)
    .mob 小夜行蜘蛛
step
    #completewith next
    .goto Tirisfal Glades,26.80,59.40,15,0
    .goto Tirisfal Glades,26.31,59.60,30 >>进入洞穴
step << Warlock
    #season 2
    #completewith RuneofHaunting
    >>击杀洞穴内的 |cRXP_ENEMY_夜行蜘蛛|r
	.complete 380,2 --Kill Night Web Spider (x8)
    .mob 夜行蜘蛛
step << Warrior
    #season 2
    #completewith RuneofVictoryRush
    >>击杀洞穴内的 |cRXP_ENEMY_夜行蜘蛛|r
	.complete 380,2 --Kill Night Web Spider (x8)
    .mob 夜行蜘蛛
step << Warlock
    #season 2
    .goto Tirisfal Glades,24.70,59.40
    >>打开洞穴内木质平台下的 |cRXP_PICK_箱子|r，拾取 |T134419:0|t[鬼影缠身符文]
    .collect 205230,1
    .isOnQuest 77672
    .train 403919,1
step << Warlock
    #season 2
    #label RuneofHaunting
    .train 403919 >> 使用 |T134419:0|t[鬼影缠身符文] 学习 |T236298:0|t[鬼影缠身]
    .use 205230
    .itemcount 205230,1
    .isOnQuest 77672
step << Warrior
    #season 2
    .goto Tirisfal Glades,24.70,59.40
    >>打开洞穴内木质平台下的 |cRXP_PICK_箱子|r，拾取 |T134419:0|t[乘胜追击符文]
    .collect 204806,1
    .isOnQuest 77668
    .train 403470,1
step << Warrior
    #season 2
    #label RuneofVictoryRush
    .train 403470 >> 使用 |T134419:0|t[乘胜追击符文] 学习 |T132342:0|t[乘胜追击]
    .use 204806
    .itemcount 204806,1
    .isOnQuest 77668
step
    #loop
    .goto Tirisfal Glades,24.68,59.54,0
    .goto Tirisfal Glades,26.31,59.60,30,0
    .goto Tirisfal Glades,25.61,59.55,20,0
    .goto Tirisfal Glades,25.11,60.33,20,0
    .goto Tirisfal Glades,24.18,60.77,20,0
    .goto Tirisfal Glades,23.23,59.91,20,0
    .goto Tirisfal Glades,23.89,58.36,20,0
    .goto Tirisfal Glades,24.68,59.54,20,0
    >>击杀洞穴内的 |cRXP_ENEMY_夜行蜘蛛|r
	.complete 380,2 --Kill Night Web Spider (x8)
    .mob 夜行蜘蛛
step
    #xprate <1.5
    #softcore
    #completewith Scavenging
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
step
    #xprate >1.49
    #softcore
    #completewith NightWebH
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
step << Warlock
    #softcore
    #completewith ScarletC
    .cast 688 >>|cRXP_WARN_施放|r |T136218:0|t[召唤小鬼]
step << skip
    #hardcore
    #completewith next
    .goto 1420,26.027,60.607,-1
    .goto 1420,24.508,59.360,-1
    .goto 1420,23.572,59.239,-1
    .goto Tirisfal Glades,31.08,64.88,30 >>|cRXP_WARN_在洞穴内利用登出跳过：跳到伐木机、水井或卡在墙上的木板上，然后退出并重新登录|r
    >>|cRXP_WARN_或者直接跑回丧钟镇|r
step
    #hardcore
    #completewith NightWebH
    .goto Tirisfal Glades,26.80,59.40,15 >> 从洞穴入口出去，返回丧钟镇
step
    #xprate <1.5
    #label Scavenging
    .goto Tirisfal Glades,31.61,65.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_亡灵卫兵萨尔坦|r 交谈
    .turnin 3902 >> 交任务：捡破烂
    .target 亡灵卫兵萨尔坦
step << Warlock
    #season 2
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_马克希米林|r
    .turnin 77672 >>交任务: 失落的符文
    .target 马克希米林
step
    #label NightWebH
    .goto Tirisfal Glades,32.15,66.01,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_执行官阿伦|r 交谈
    .turnin 380 >> 交任务：夜行蜘蛛洞穴
    .accept 381 >> 接任务：血色十字军
    .target 执行官阿伦
step << Rogue/Warrior
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_阿基班德|r
    .vendor >> 卖掉杂物
    .target 阿基班德·卡瓦
    .isOnQuest 6395
step << Warlock/Mage/Priest
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒·基恩|r
    >>|cRXP_BUY_向他购买|r|T132794:0|t[清凉的泉水]|cRXP_BUY_。|r
	.collect 159,15,383,1 << Warlock/Mage/Priest --Collect Refreshing Spring Water (15)
    .vendor >> 卖掉杂物
    .target 乔舒·基恩
    .isOnQuest 6395
    .itemcount 159,<15
step << Warrior
    #season 2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丹纳尔·斯特恩|r
    .turnin 77668 >>交任务: 失落的符文
    .target 丹纳尔·斯特恩
step
    #requires NightWebH
    #loop
	.goto Tirisfal Glades,36.13,68.74,0
	.goto Tirisfal Glades,36.13,68.74,40,0
	.goto Tirisfal Glades,36.46,69.49,40,0
	.goto Tirisfal Glades,36.85,70.02,40,0
	.goto Tirisfal Glades,37.42,69.58,40,0
	.goto Tirisfal Glades,38.05,69.79,40,0
	.goto Tirisfal Glades,37.91,69.22,40,0
	.goto Tirisfal Glades,38.03,68.77,40,0
	.goto Tirisfal Glades,38.49,68.28,40,0
	.goto Tirisfal Glades,38.72,67.07,40,0
	.goto Tirisfal Glades,38.59,66.25,40,0
	.goto Tirisfal Glades,38.65,65.07,40,0
	.goto Tirisfal Glades,37.62,65.36,40,0
	.goto Tirisfal Glades,36.93,65.38,40,0
	.goto Tirisfal Glades,36.51,65.42,40,0
	.goto Tirisfal Glades,36.85,66.59,40,0
	.goto Tirisfal Glades,37.45,67.95,40,0
	.goto Tirisfal Glades,36.93,68.16,40,0
    >>击杀 |cRXP_ENEMY_血色新兵|r 和 |cRXP_ENEMY_血色信徒|r, 搜刮 |cRXP_LOOT_血色十字军臂章|r
    >>|cRXP_WARN_先不要击杀 |cRXP_ENEMY_迈文·考加尔|r|r
    >>|cRXP_WARN_如果可以的话，尽量避免 |cRXP_ENEMY_血色新兵|r，因为他们会施放 |r|T135843:0|t[霜甲术] |cRXP_WARN_(会降低你的攻击速度)|r << Warrior/Rogue
    .complete 381,1 --Collect Scarlet Armband (12)
    .mob 血色新兵
    .mob 血色信徒
step << Mage
    #season 2
    #loop
    .goto Tirisfal Glades,36.50,68.82,0
    .goto Tirisfal Glades,36.50,68.82,40,0
    .goto Tirisfal Glades,37.60,66.40,40,0
    .goto Tirisfal Glades,38.40,68.20,40,0
    >>击杀 |cRXP_ENEMY_血色新兵|r，拾取 |T134939:0|t[法术笔记：冰枪术]
    .collect 203745,1
    .mob 血色新兵
    .isOnQuest 77671
    .train 401760,1
step << Mage
    #season 2
    .train 401760 >> 使用 |T134939:0|t[法术笔记：冰枪术] 学习 |T135844:0|t[冰枪术]
    .use 203745
    .itemcount 203745,1
    .isOnQuest 77671
step << Rogue
    #season 2
    #loop
    .goto Tirisfal Glades,36.50,68.82,0
    .goto Tirisfal Glades,36.50,68.82,40,0
    .goto Tirisfal Glades,37.60,66.40,40,0
    .goto Tirisfal Glades,38.40,68.20,40,0
    >>击杀 |cRXP_ENEMY_血色信徒|r，拾取 |T134419:0|t[暗影打击符文]；也可对他们使用偷窃
    .collect 204795,1
    .mob 血色信徒
    .isOnQuest 77669
    .train 400105,1
step << Rogue
    #season 2
    .train 400105 >> 使用 |T134419:0|t[暗影打击符文] 学习 |T132323:0|t[暗影打击]
    .use 204795
    .itemcount 204795,1
    .isOnQuest 77669
step
    .goto Tirisfal Glades,36.69,61.67
    >>击杀 |cRXP_ENEMY_塞缪尔|r, 搜刮 |cRXP_LOOT_塞缪尔的遗骸|r
    .collect 16333,1,6395,1 --Collect Samuel's Remains
    .mob 塞缪尔·菲普斯
step
    #softcore
    #completewith next
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
step
    .goto Tirisfal Glades,31.17,65.08
	>>点击地面上的 |cRXP_PICK_玛拉的坟墓|r
    .complete 6395,1 --Collect Samuel's Remains Buried (1)
 step << Warlock
    #softcore
	#completewith ScarletC
	.cast 688 >>|cRXP_WARN_施放|r |T136218:0|t[召唤小鬼]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_新兵艾尔雷斯|r 交谈 << !Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r和|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈 << Priest
    .turnin 6395 >> 交任务：玛拉的遗愿
    .target +新兵艾尔雷斯
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.86,66.05
    .accept 5651 >> 接任务：黑暗的恩赐 << Priest
    .target +黑暗牧师杜斯滕 << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
step << Mage
    #season 2
    .goto Tirisfal Glades,30.94,66.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_伊莎贝拉|r
    .turnin 77671 >>交任务: 法术研究
    .target 伊莎贝拉
    .isQuestComplete 77671
step
    #sticky
    #label ScarletC
    .goto Tirisfal Glades,32.15,66.01,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_执行官阿伦|r 交谈
    .turnin 381 >> 交任务：血色十字军
    .accept 382 >> 接任务：十字军信使
    .target 执行官阿伦
step << Rogue
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大卫·提亚斯|r交谈
    .turnin 77669 >>交任务: 血色符文
    .target 大卫·提亚斯
step
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_阿基班德|r
    .vendor >> 卖掉杂物
    .target 阿基班德·卡瓦
step
    #requires ScarletC
    .goto Tirisfal Glades,36.50,68.82
    >>击杀|cRXP_ENEMY_迈文|r，拾取|cRXP_LOOT_血色十字军文件|r
    .complete 382,1 --Collect Scarlet Crusade Documents (1)
    .mob 迈文·考加尔
step
    .goto Tirisfal Glades,32.15,66.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_执行官阿伦|r 交谈
    .turnin 382 >> 交任务：十字军信使
    .accept 383 >> 接任务：重要情报
    .target 执行官阿伦
step
    #loop
    .goto Tirisfal Glades,34.08,59.51,50,0
    .goto Tirisfal Glades,35.34,56.55,50,0
    .goto Tirisfal Glades,36.83,56.85,50,0
    .goto Tirisfal Glades,37.76,59.38,50,0
    .goto Tirisfal Glades,37.51,62.99,50,0
	.goto Tirisfal Glades,36.13,68.74,50,0
	.goto Tirisfal Glades,36.46,69.49,50,0
	.goto Tirisfal Glades,36.85,70.02,50,0
	.goto Tirisfal Glades,37.42,69.58,50,0
	.goto Tirisfal Glades,38.05,69.79,50,0
	.goto Tirisfal Glades,37.91,69.22,50,0
	.goto Tirisfal Glades,38.03,68.77,50,0
	.goto Tirisfal Glades,38.49,68.28,50,0
	.goto Tirisfal Glades,38.72,67.07,50,0
	.goto Tirisfal Glades,38.59,66.25,50,0
	.goto Tirisfal Glades,38.65,65.07,50,0
	.goto Tirisfal Glades,37.62,65.36,50,0
	.goto Tirisfal Glades,36.93,65.38,50,0
	.goto Tirisfal Glades,36.51,65.42,50,0
	.goto Tirisfal Glades,36.85,66.59,50,0
	.goto Tirisfal Glades,37.45,67.95,50,0
	.goto Tirisfal Glades,36.93,68.16,50,0
	.goto Tirisfal Glades,36.13,68.74,50,0
    .xp 5+2350 >>刷怪至 2350+/2800 经验值
step
    .goto Tirisfal Glades,38.24,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔文·蒙泰古|r交谈
    .accept 8 >> 接任务：潜行者的交易
    .target 卡尔文·蒙泰古
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
#xprate <1.99
<< Horde
#name 6-11 Tirisfal Glades
#version 11
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#defaultfor Undead
#next 12-14 Silverpine Forest; 12-17 The Barrens
#displayname 6-11 提瑞斯法林地
step
    .goto Tirisfal Glades,40.91,54.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_希米尔|r
    .accept 365 >>接任务：悲伤之地
    .target 亡灵卫兵希米尔
step
    #loop
    .goto Tirisfal Glades,56.13,52.48,0
    .goto Tirisfal Glades,40.77,54.42,0
    .goto Tirisfal Glades,40.77,54.42,40,0
    .goto Tirisfal Glades,42.04,55.11,40,0
    .goto Tirisfal Glades,43.59,54.30,40,0
    .goto Tirisfal Glades,46.21,56.78,40,0
    .goto Tirisfal Glades,48.88,57.93,40,0
    .goto Tirisfal Glades,50.73,57.27,40,0
    .goto Tirisfal Glades,52.52,54.48,40,0
    .goto Tirisfal Glades,54.49,52.65,40,0
    .goto Tirisfal Glades,56.13,52.48,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_葛尔多|r
    >>|cRXP_WARN_他在布瑞尔的大路上巡逻 (是个很大的缝合怪)|r
    .accept 5481 >>接任务：葛尔多的任务
    .unitscan 葛尔多
step << Priest
    .goto Tirisfal Glades,52.59,55.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_博文|r 交谈
    .train 3908 >> 学习 |T136249:0|t[裁缝]。留好你的 |T132889:0|t[亚麻布]，这样之后就能制作魔杖
    .target 博文·布里斯博埃斯
step
    #softcore
    #completewith next
    .deathskip >> 死亡并在|cRXP_FRIENDLY_灵魂医者|r处复活，或跑到布瑞尔。
    .target 灵魂医者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_迪林格尔|r 和 |cRXP_FRIENDLY_塞加德|r
    .accept 404 >>接任务：腐烂的爪子
    .target +亡灵卫兵迪林格尔
    .goto Tirisfal Glades,58.20,51.45
    .turnin 383 >>交任务：重要情报
    .accept 427 >>接任务：与血色十字军的战争
    .target +执行官塞加德
    .goto Tirisfal Glades,60.59,51.77
step << Rogue
    .goto Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_温特斯夫人|r|cRXP_BUY_交谈，向她购买一把|r |T135421:0|t[增重飞斧] |cRXP_BUY_。|r
    .collect 3131,200,404,1 << !tbc
    .collect 29007,1,404,1 << tbc
    .target 温特斯夫人
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥利弗|r 交谈
    .vendor >> 卖掉杂物。如果卖掉当前武器后能凑够购买 |T135641:0|t[卷刃的剑] 的钱（4 银 01 铜），就卖掉武器。现在钱不够的话，稍后会再回来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135641:0|t[卷刃的剑] |cRXP_BUY_。|r
    .collect 2494,1,404,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #optional
    #completewith Claws
    +|cRXP_WARN_装备|r |T135421:0|t[增重飞斧]
    .use 3131 << !tbc
    .use 29007 << tbc
    .itemcount 3131,1 << !tbc
    .itemcount 29007,1 << tbc
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
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥利弗|r 交谈
    .vendor >> 卖掉杂物。如果卖掉当前武器后能凑够购买 |T135321:0|t[步兵剑] 的钱（5 银 36 铜），就卖掉武器。现在钱不够的话，稍后会再回来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135321:0|t[步兵剑] |cRXP_BUY_。|r
    .collect 2488,1,404,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #optional
    #completewith Claws
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板瑞尼|r
    .turnin 8 >>交任务：潜行者的交易
    .home >> 将炉石绑定在布瑞尔
    .target 旅店老板瑞尼
step
    #xprate >1.49
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    >>|cRXP_FRIENDLY_格莉丝|r |cRXP_WARN_在旅店二楼|r
    .accept 375 >>接任务：死亡之寒
    .target 格莉丝·戴玛
    .xp <7,1
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_黑暗牧师贝里尔|r交谈
    .turnin 5651 >> 交任务：黑暗的恩赐
    .accept 5650 >> 接任务：黑暗之衣
	.train 591 >>学习 |T135924:0|t[惩击]
    .train 17 >>学习 |T135940:0|t[真言术:盾]
    .train 2052 >>学习 |T135929:0|t[次级治疗术（等级 2）]
    .target 黑暗牧师贝里尔
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_凯恩|r 交谈
    .train 143 >> 学习 |T135812:0|t[火球术]
    .train 2136 >>学习 |T135807:0|t[火焰冲击]
    .target 凯恩·火歌
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_奥斯蒂尔|r
    .train 3127 >>学习 |T132269:0|t[招架]
    .target 奥斯蒂尔·德·蒙
    .money <0.01
step << Rogue
    #season 0,1
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_马里恩|r 交谈
    .train 1757 >> 学习 |T136189:0|t[邪恶攻击]
    .target 马里恩·考尔
    .money <0.01
step << Rogue
    #season 2
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_马里恩|r 交谈
    .train 1757 >> 学习 |T136189:0|t[邪恶攻击]
    .train 921 >> 学习 |T133644:0|t[搜索]
    .target 马里恩·考尔
    .money <0.02
step << Rogue
    #optional
    #season 2
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_马里恩|r 交谈
    .train 921 >> 学习 |T133644:0|t[搜索]
    .target 马里恩·考尔
    .money >0.02
    .money <0.01
step << Warlock
    .goto Tirisfal Glades,61.56,52.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话二楼的 |cRXP_FRIENDLY_吉娜·朗恩|r
    >>|cRXP_BUY_购买|r |T133738:0|t[魔典:血契]|cRXP_BUY_从她那里|r
    .collect 16321,1,404,1 --Grimoire of Blood Pact
    .vendor >>卖掉杂物
    .target 吉娜·朗恩
    .train 6307,1 --Blood Pact (Rank 1)
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特|r 交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .train 1454 >> 学习 |T136126:0|t[生命分流]
    .target 鲁伯特·鲍什
    .money <0.02
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特|r 交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .target 鲁伯特·鲍什
step << Priest/Warlock
    .goto Tirisfal Glades,61.76,51.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_范斯|r 交谈
    .train 7411 >> 学习 |T136244:0|t[附魔]
    >>|cRXP_WARN_学习附魔并配合|r |T136249:0|t[裁缝] |cRXP_WARN_，就能在之后制作魔杖|r
    .target 范斯·安德格鲁姆
step
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板瑞尼|r
    >>|cRXP_BUY_从她那里购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_|r << Mage/Priest
    >>|cRXP_BUY_从她那里购买|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_|r <<Warrior/Rogue
    >>|cRXP_BUY_从她那里购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_|r << Warlock
    .vendor >> 卖掉杂物
    .collect 1179,15,367,1 << Mage/Priest --Ice Cold Milk (15)
    .collect 4605,10,367,1 << Rogue/Warrior --Red-speckled Mushroom (10)
    .collect 1179,10,367,1 << Warlock --Ice Cold Milk (10)
    .collect 4605,5,367,1 << Warlock --Red-speckled Mushroom (5)
    .money <0.025 << Warrior/Rogue
    .money <0.0375 << Mage/Priest/Warlock
    .target 旅店老板瑞尼
 step
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔汉|r
    .accept 367 >>接任务：新的瘟疫
    .target 药剂师乔汉
step << Priest
    .goto Tirisfal Glades,59.18,46.49
    >>把|T135929:0|t[次级治疗术]和|T135987:0|t[真言术：韧]施放给|cRXP_FRIENDLY_亡灵卫兵科尔|r
    >>|cRXP_WARN_你需要学会 [次级治疗术] (等级 2) 才能完成此任务|r
    .complete 5650,1 --Heal and fortify Deathguard Kel (1)
    .target 亡灵卫兵科尔
step
    #completewith Claws
    >>拾取地面上的 |cRXP_LOOT_阴暗草|r
    .complete 5481,1 --Gloom Weed (3)
step
    #xprate <1.5
    #completewith Pumkpins
    >>击杀你见到的任何 |cRXP_ENEMY_衰老的黑暗犬|r, 搜刮 |cRXP_LOOT_血液|r
    .complete 367,1 --Darkhound Blood (5)
    .mob 衰老的黑暗犬
step
    #xprate >1.49
    #completewith GloomWeed
    >>击杀你见到的任何 |cRXP_ENEMY_衰老的黑暗犬|r, 搜刮 |cRXP_LOOT_血液|r
    .complete 367,1 --Darkhound Blood (5)
    .mob 衰老的黑暗犬
step
    #label Claws
    #loop
    .goto Tirisfal Glades,52.63,56.98,0
    .goto Tirisfal Glades,54.95,50.53,50,0
    .goto Tirisfal Glades,53.35,50.29,50,0
    .goto Tirisfal Glades,52.12,50.38,50,0
    .goto Tirisfal Glades,51.28,51.63,50,0
    .goto Tirisfal Glades,52.03,53.74,50,0
    .goto Tirisfal Glades,52.29,56.72,50,0
    .goto Tirisfal Glades,53.95,56.53,50,0
    .goto Tirisfal Glades,53.55,58.25,50,0
    .goto Tirisfal Glades,52.63,56.98,50,0
    >>击杀 |cRXP_ENEMY_腐烂的死者|r 和 |cRXP_ENEMY_破碎的尸体|r, 搜刮 |cRXP_LOOT_腐烂的爪子|r
    .complete 404,1 --Putrid Claw (7)
    .mob 腐烂的死者
    .mob 破碎的尸体
step
    #label GloomWeed
    #loop
    .goto Tirisfal Glades,39.55,50.64,0
    .goto Tirisfal Glades,44.43,57.33,0
    .goto Tirisfal Glades,39.55,50.64,50,0
    .goto Tirisfal Glades,44.43,57.33,50,0
    >>完成拾取地面上的 |cRXP_LOOT_阴暗草|r
    .complete 5481,1 --Gloom Weed (3)
step << Warrior
    #optional
    #season 2
    #xprate >1.49
    #completewith DBlood
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 搜刮 |cRXP_LOOT_被砍下的蝙蝠的头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
    .isOnQuest 375
step
    #optional
    #xprate >1.49
    #completewith next
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 获取 |cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .isOnQuest 375
step
    #xprate >1.49
    #label DBlood
    #loop
    .goto Tirisfal Glades,43.97,57.27,0
    .goto Tirisfal Glades,40.57,47.23,0
    .goto Tirisfal Glades,48.03,53.43,80,0
    .goto Tirisfal Glades,43.97,57.27,80,0
    .goto Tirisfal Glades,41.01,55.94,60,0
    .goto Tirisfal Glades,40.57,47.23,60,0
    .goto Tirisfal Glades,40.89,42.77,60,0
    .goto Tirisfal Glades,39.12,39.85,60,0
    >>继续击杀 |cRXP_ENEMY_黑暗犬|r, 搜刮 |cRXP_LOOT_血液|r
    .complete 367,1 --Darkhound Blood (5)
    .mob 衰老的黑暗犬
    .mob 被诅咒的黑暗犬
step << Priest
    #ah
    #completewith FinishRings
    >>|cRXP_WARN_开始收集3组|r |T132889:0|t[亚麻布] |cRXP_WARN_，稍后可用这些亚麻布制作|r |T135139:0|t[次级魔法杖] |cRXP_WARN_|r
    >>|cRXP_WARN_如果你不想做这个, 或者打算以后去拍卖行买, 请跳过此步|r
    .collect 2589,60 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #ssf
    #completewith FinishRings
    >>|cRXP_WARN_开始收集3组|r |T132889:0|t[亚麻布] |cRXP_WARN_，稍后可用这些亚麻布制作|r |T135139:0|t[次级魔法杖] |cRXP_WARN_|r
    .collect 2589,60 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Rogue
    #season 2
    #completewith next
    >>|T133644:0|t[搜索] 并击杀 |cRXP_ENEMY_提瑞斯法农夫|r 和 |cRXP_ENEMY_提瑞斯法雇农|r, 搜刮 |T134327:0|t[|cRXP_LOOT_左上角地图碎片|r]
    .collect 208036,1 --Top-Left Map Piece (1)
    .mob 提瑞斯法农夫
    .mob 提瑞斯法雇农
    .train 400095,1
step
    #label Pumkpins
    #loop
    .goto Tirisfal Glades,36.63,50.09,0
    .goto Tirisfal Glades,37.20,52.17,50,0
    .goto Tirisfal Glades,36.64,50.09,50,0
    .goto Tirisfal Glades,36.10,49.07,50,0
    .goto Tirisfal Glades,35.08,49.82,50,0
    .goto Tirisfal Glades,35.30,50.91,50,0
    .goto Tirisfal Glades,34.57,51.58,50,0
    .goto Tirisfal Glades,36.63,50.09,50,0
    >>拾取田里的|cRXP_LOOT_南瓜|r
    .complete 365,1 --Tirisfal Pumpkin (10)
step << Rogue
    #season 2
    #loop
    .goto Tirisfal Glades,36.63,50.09,0
    .goto Tirisfal Glades,37.20,52.17,50,0
    .goto Tirisfal Glades,36.64,50.09,50,0
    .goto Tirisfal Glades,36.10,49.07,50,0
    .goto Tirisfal Glades,35.08,49.82,50,0
    .goto Tirisfal Glades,35.30,50.91,50,0
    .goto Tirisfal Glades,34.57,51.58,50,0
    .goto Tirisfal Glades,36.63,50.09,50,0
    >>|T133644:0|t[搜索] 并击杀 |cRXP_ENEMY_提瑞斯法农夫|r 和 |cRXP_ENEMY_提瑞斯法雇农|r, 搜刮 |T134327:0|t[|cRXP_LOOT_左上角地图碎片|r]
    .collect 208036,1 --Top-Left Map Piece (1)
    .mob 提瑞斯法农夫
    .mob 提瑞斯法雇农
    .train 400095,1
step << Rogue/Mage/Priest
    #season 2
    #completewith next
    >>|T133644:0|t[搜索] 并击杀 |cRXP_ENEMY_血色战士|r, 搜刮 |T134327:0|t[|cRXP_LOOT_右上角地图碎片|r] << Rogue
    >>击杀|cRXP_ENEMY_血色战士|r，从他们身上拾取|T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN|r] << Mage
    >>击杀 |cRXP_ENEMY_血色战士|r, 搜刮 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] << Priest
    >>|cRXP_WARN_提瑞斯法林地的任何血色十字军人型怪都有几率掉 [地图碎片]|r << Rogue
    >>|cRXP_WARN_提瑞斯法的任意血色人类生物都有可能掉落法术笔记|r << Mage
    >>|cRXP_WARN_提瑞斯法的所有血色人类生物都有可能掉落预言书|r << Priest
    .collect 208035,1 << Rogue --Top-Right Map Piece (1)
    .collect 203752,1 << Mage --Spell Notes: MILEGIN VALF (1)
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel (1)
    .mob 血色战士
    .train 400095,1 << Rogue
    .train 401768,1 << Mage
    .train 402852,1 << Priest
step
    #loop
    .goto Tirisfal Glades,31.78,51.36,0
    .goto Tirisfal Glades,33.73,49.34,50,0
    .goto Tirisfal Glades,33.65,51.07,50,0
    .goto Tirisfal Glades,31.78,51.36,50,0
    .goto Tirisfal Glades,30.02,50.48,50,0
    .goto Tirisfal Glades,29.91,49.24,50,0
    .goto Tirisfal Glades,30.62,47.53,50,0
    .goto Tirisfal Glades,31.01,46.50,50,0
    .goto Tirisfal Glades,32.15,44.83,50,0
    .goto Tirisfal Glades,33.73,45.29,50,0
    .goto Tirisfal Glades,34.10,47.88,50,0
    .goto Tirisfal Glades,33.73,49.34,50,0
    >>击杀 |cRXP_ENEMY_血色战士|r
    >>|cRXP_WARN_小心：它们做出防御姿态的动作后，招架几率会提高50%，持续8秒|r << Rogue/Warrior
    .complete 427,1 --Scarlet Warrior (10)
    .mob 血色战士
step << Rogue/Mage/Priest
    #season 2
    #loop
    .goto Tirisfal Glades,31.78,51.36,0
    .goto Tirisfal Glades,33.73,49.34,50,0
    .goto Tirisfal Glades,33.65,51.07,50,0
    .goto Tirisfal Glades,31.78,51.36,50,0
    .goto Tirisfal Glades,30.02,50.48,50,0
    .goto Tirisfal Glades,29.91,49.24,50,0
    .goto Tirisfal Glades,30.62,47.53,50,0
    .goto Tirisfal Glades,31.01,46.50,50,0
    .goto Tirisfal Glades,32.15,44.83,50,0
    .goto Tirisfal Glades,33.73,45.29,50,0
    .goto Tirisfal Glades,34.10,47.88,50,0
    .goto Tirisfal Glades,33.73,49.34,50,0
    >>|T133644:0|t[搜索] 并击杀 |cRXP_ENEMY_血色战士|r, 搜刮 |T134327:0|t[|cRXP_LOOT_右上角地图碎片|r] << Rogue
    >>击杀|cRXP_ENEMY_血色战士|r，从他们身上拾取|T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN|r] << Mage
    >>击杀 |cRXP_ENEMY_血色战士|r, 搜刮 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] << Priest
    >>|cRXP_WARN_提瑞斯法林地的任何血色十字军人型怪都有几率掉 [地图碎片]|r << Rogue
    >>|cRXP_WARN_提瑞斯法的任意血色人类生物都有可能掉落法术笔记|r << Mage
    >>|cRXP_WARN_提瑞斯法的所有血色人类生物都有可能掉落预言书|r << Priest
    .collect 208035,1 << Rogue --Top-Right Map Piece (1)
    .collect 203752,1 << Mage --Spell Notes: MILEGIN VALF (1)
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel (1)
    .mob 血色战士
    .train 400095,1 << Rogue
    .train 401768,1 << Mage
    .train 402852,1 << Priest
step << Undead Priest
    #season 2
    #optional
    #sticky
    #completewith Entersilverpine
    >>寻找带有 [洛阿神灵之思] 增益的牧师。在他面前跪下，让他以你为目标使用 /pray（祈祷），传授第二种冥想增益
    >>若已失去 [亡灵之思]，先到布瑞尔墓地跪下重新获得
    .aura 418459
    .aura 417316
    .train 402852 >> 拥有两种冥想增益后，使用 |T135975:0|t[遭渎城堡的预言] 学习 |T237570:0|t[裂魂魔]
    .use 205947
    .itemcount 205947,1
    .train 402852,1
step << Mage
    #optional
    #completewith LogoutSkip1
    #season 2
    .collect 211779,1 >>若已有理解魔符，现在可解读笔记；否则继续路线，稍后在幽暗城向施法材料商购买。
    .train 401768 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN|r] |cRXP_WARN_来学习|r |T135820:0|t[活体烈焰]
    .use 203752
    .itemcount 203752,1
    .train 401768,1
step << Mage/Priest
    #season 2
    .goto Tirisfal Glades,25.6,48.2
    >>击杀|cRXP_ENEMY_Gillgar|r，从他身上拾取|T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI|r] << Mage
    >>击杀 |cRXP_ENEMY_Gillgar|r, 搜刮 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] << Priest
    >>|cRXP_WARN_这是一个 7 级精英, 不容易击杀. 如果太难, 现在可以跳过他|r
    .collect 203753,1 << Mage --Spell Notes: RING SEFF OSTROF (1)
    .collect 205940,1 << Priest --Memory of a Dark Purpose (1)
    .mob Gillgar
    .train 401765,1 << Mage
    .train 425216,1 << Priest
step << Mage
    #optional
    #completewith LogoutSkip1
    #season 2
    .collect 211779,1 >>若已有理解魔符，现在可解读笔记；否则继续路线，稍后在幽暗城向施法材料商购买。
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI|r] |cRXP_WARN_来学习|r |T236227:0|t[寒冰指]
    .use 203753
    .itemcount 203753,1
    .train 401765,1
step
    #hardcore
    #completewith BrillTurnin1
    .hs >> 炉石回布瑞尔
    .subzoneskip 159
    .bindlocation 2119,1
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
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍兰德|r交谈, 他在墓地附近巡逻
    .turnin 5481 >>交任务：葛尔多的任务
    .accept 5482 >>接任务：末日草
    .target 初级药剂师霍兰德
step << Undead Priest
    #season 2
    .goto Tirisfal Glades,57.71,48.96
    .emote KNEEL
    .aura 418459 >> 在布瑞尔墓地跪下，获得 [亡灵之思]
    .itemcount 205940,1
    .train 425216,1
step << Undead Priest
    #season 2
    .train 425216 >> 使用 |T136222:0|t[黑暗意图的回忆] 学习 |T237514:0|t[虚空疫病]
    .use 205940
    .itemcount 205940,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪林格尔|r、|cRXP_FRIENDLY_药剂师乔汉|r和|cRXP_FRIENDLY_塞加德|r交谈
    .turnin 404 >>交任务：腐烂的爪子
    .accept 426 >>接任务：磨坊告急
    .target +亡灵卫兵迪林格尔
    .goto Tirisfal Glades,58.20,51.43
    .turnin 367 >>交任务：新的瘟疫
    .turnin 365 >>交任务：悲伤之地
    .accept 368 >>接任务：新的瘟疫
    .accept 407 >>接任务：悲伤之地
    .target +药剂师乔汉
    .goto Tirisfal Glades,59.45,52.40
    .turnin 427 >>交任务：与血色十字军的战争
    .accept 370 >>接任务：与血色十字军的战争
    .target +执行官塞加德
    .goto Tirisfal Glades,60.58,51.77
    .isQuestComplete 367
step
    #label BrillTurnin1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪林格尔|r、|cRXP_FRIENDLY_药剂师乔汉|r和|cRXP_FRIENDLY_塞加德|r交谈
    .turnin 404 >>交任务：腐烂的爪子
    .accept 426 >>接任务：磨坊告急
    .target +亡灵卫兵迪林格尔
    .goto Tirisfal Glades,58.20,51.43
    .turnin 365 >>交任务：悲伤之地
    .accept 407 >>接任务：悲伤之地
    .target +药剂师乔汉
    .goto Tirisfal Glades,59.45,52.40
    .turnin 427 >>交任务：与血色十字军的战争
    .accept 370 >>接任务：与血色十字军的战争
    .target +执行官塞加德
    .goto Tirisfal Glades,60.58,51.77
 step
    #xprate >1.49
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买一根|r |T132891:0|t[粗线]|cRXP_BUY_|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate >1.49
    .goto Tirisfal Glades,61.97,51.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店后方楼下的|cRXP_FRIENDLY_血色十字军俘虏|r交谈
    .turnin 407 >>交任务：悲伤之地
    .target 血色十字军俘虏
step
    #xprate >1.49
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_黑暗牧师贝里尔|r交谈
    .turnin 5650 >>交任务：黑暗之衣
    .train 591 >>学习 |T135924:0|t[惩击]
    .train 17 >>学习 |T135940:0|t[真言术:盾]
    .target 黑暗牧师贝里尔
step
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    >>|cRXP_FRIENDLY_格莉丝|r |cRXP_WARN_在旅店二楼|r
    .accept 375 >>接任务：死亡之寒
    .target 格莉丝·戴玛
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_黑暗牧师贝里尔|r交谈
	.train 139 >> 学习职业技能
    .target 黑暗牧师贝里尔
    .xp <8,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_凯恩|r 交谈
    .train 205 >> 学习职业技能
    .target 凯恩·火歌
    .xp <8,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_奥斯蒂尔|r
    .train 284 >> 学习职业技能
    .target 奥斯蒂尔·德·蒙
    .xp <8,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_马里恩|r 交谈
    .train 6760 >> 学习职业技能
    .target 马里恩·考尔
    .xp <8,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特|r 交谈
    .train 980 >> 学习职业技能
    .target 鲁伯特·鲍什
    .xp <8,1
step << Rogue/Warrior
    .goto Tirisfal Glades,61.81,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_妮拉|r交谈
    >>|cRXP_WARN_尽量利用等待时间(如等飞艇时)来制作这些物品|r
    .train 3273 >>学习 |T135966:0|t[急救]
    .target 妮拉
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥利弗|r 交谈
    .vendor >> 卖掉杂物。如果卖掉当前武器后能凑够购买 |T135641:0|t[卷刃的剑] 的钱（4 银 01 铜），就卖掉武器。现在钱不够的话，稍后会再回来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135641:0|t[卷刃的剑] |cRXP_BUY_。|r
    .collect 2494,1,426,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #optional
    #completewith NewPlague1
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Warrior
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥利弗|r 交谈
    .vendor >> 卖掉杂物。如果卖掉当前武器后能凑够购买 |T135321:0|t[步兵剑] 的钱（5 银 36 铜），就卖掉武器。现在钱不够的话，稍后会再回来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135321:0|t[步兵剑] |cRXP_BUY_。|r
    .collect 2488,1,426,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #optional
    #completewith NewPlague1
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step
    #hardcore
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍兰德|r交谈, 他在墓地附近巡逻
    .turnin 5481 >>交任务：葛尔多的任务
    .accept 5482 >>接任务：末日草
    .target 初级药剂师霍兰德
step << Warrior
    #season 2
    #xprate <1.5
    #completewith DuskbatTrophy1
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 搜刮 |cRXP_LOOT_被砍下的蝙蝠的头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
step
    #xprate <1.5
    #completewith next
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 获取 |cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step
    #xprate <1.5
    #loop
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    >>击杀 |cRXP_ENEMY_黑暗犬|r, 搜刮 |cRXP_LOOT_血液|r
    .complete 367,1 --Darkhound Blood (5)
    .mob 衰老的黑暗犬
step << Rogue/Warrior
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 获取 |cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .xp >7+3960,1
step << Rogue/Warrior
    #xprate <1.5
    #optional
    #label DuskbatTrophy1
    #loop
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .xp 7+3260 >> 刷怪至 3260+/4500 经验值
--XX 700 (375)+540 (367)
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 获取 |cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .xp >7+3690,1
step
    #xprate >1.49
    #label DuskbatTrophy1
    #loop
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .xp 7+2640 >> 刷怪至 2640+/4500 经验值
--XX 700 (375)+540 (367)
step
    #xprate <1.5
    #hardcore
    #completewith NewPlague1
    .subzone 159 >> 返回布瑞尔
    .subzoneskip 159
step
    #xprate <1.5
    #softcore
    #completewith NewPlague1
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #label NewPlague1
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔汉|r
    .turnin 367 >>交任务：新的瘟疫
    .accept 368 >>接任务：新的瘟疫
    .target 药剂师乔汉
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在建筑内与|cRXP_FRIENDLY_伯吉斯|r交谈、查看|cRXP_PICK_通缉告示|r，再与|cRXP_FRIENDLY_塞弗伦|r交谈
    .accept 374 >>接任务：死亡证明
    .target +亡灵卫兵伯吉斯
    .goto Tirisfal Glades,60.93,52.01
    .accept 398 >>接任务：悬赏：蛆眼
    .goto Tirisfal Glades,60.74,51.52
    .accept 358 >>接任务：盗墓贼
    .target +执政官塞弗伦
    .goto Tirisfal Glades,61.26,50.84
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买一根|r |T132891:0|t[粗线]|cRXP_BUY_|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step << Priest
    #xprate <1.5
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_黑暗牧师贝里尔|r交谈
	.train 139 >> 学习职业技能
    .target 黑暗牧师贝里尔
    .xp <8,1
step << Mage
    #xprate <1.5
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_凯恩|r 交谈
    .train 205 >> 学习职业技能
    .target 凯恩·火歌
    .xp <8,1
step << Warrior
    #xprate <1.5
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_奥斯蒂尔|r
    .train 284 >> 学习职业技能
    .target 奥斯蒂尔·德·蒙
    .xp <8,1
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_马里恩|r 交谈
    .train 6760 >> 学习职业技能
    .target 马里恩·考尔
    .xp <8,1
step << Warlock
    #xprate <1.5
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特|r 交谈
    .train 980 >> 学习职业技能
    .target 鲁伯特·鲍什
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥利弗|r 交谈
    .vendor >> 卖掉杂物。如果卖掉当前武器后能凑够购买 |T135641:0|t[卷刃的剑] 的钱（4 银 01 铜），就卖掉武器。现在钱不够的话，稍后会再回来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135641:0|t[卷刃的剑] |cRXP_BUY_。|r
    .collect 2494,1,398,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #xprate <1.5
    #optional
    #completewith Doomweed
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Warrior
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥利弗|r 交谈
    .vendor >> 卖掉杂物。如果卖掉当前武器后能凑够购买 |T135321:0|t[步兵剑] 的钱（5 银 36 铜），就卖掉武器。现在钱不够的话，稍后会再回来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135321:0|t[步兵剑] |cRXP_BUY_。|r
    .collect 2488,1,398,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #xprate <1.5
    #optional
    #completewith Doomweed
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Rogue
    #season 2
    #completewith MaggotEye
    >>|T133644:0|t[搜索] 并击杀 |cRXP_ENEMY_腐皮豺狼人|r, 搜刮 |T134327:0|t[|cRXP_LOOT_左下角地图碎片|r]
    .collect 208038,1 --Bottom-Left Map Piece (1)
    .mob 混血腐皮豺狼人
    .mob 腐皮豺狼人
    .mob 腐皮盗墓贼
    .train 400095,1
step << Warrior
    #season 2
    #completewith MaggotEye
    >>击杀任意类型的 |cRXP_ENEMY_腐皮豺狼人|r, 搜刮 |cRXP_LOOT_被砍下的豺狼人的头|r
    .collect 204478,1 --Severed Gnoll Head (1)
    .mob 混血腐皮豺狼人
    .mob 腐皮豺狼人
    .mob 腐皮盗墓贼
    .train 403475,1
step
    #completewith next
    >>拾取地上的|cRXP_LOOT_末日草|r
    >>|cRXP_WARN_它们分布在豺狼人区域的树下|r
    .complete 5482,1 --Doom Weed (10)
    .isOnQuest 5482
step
    #loop
    .goto Tirisfal Glades,55.24,42.54,0
    .goto Tirisfal Glades,56.31,39.67,40,0
    .goto Tirisfal Glades,54.71,41.19,40,0
    .goto Tirisfal Glades,53.90,43.93,40,0
    .goto Tirisfal Glades,55.24,42.54,40,0
    .goto Tirisfal Glades,56.43,43.92,40,0
    >>击杀 |cRXP_ENEMY_腐皮盗墓贼|r, 搜刮 |cRXP_LOOT_防腐剂|r
    .complete 358,1 --Rot Hide Graverobber (8)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob 腐皮盗墓贼
step
    #completewith next
    >>击杀 |cRXP_ENEMY_混血腐皮豺狼人|r, 搜刮 |cRXP_LOOT_防腐剂|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob 混血腐皮豺狼人
step
    #label Doomweed
    #loop
    .goto Tirisfal Glades,57.48,35.95,0
    .goto Tirisfal Glades,57.68,34.37,30,0
    .goto Tirisfal Glades,57.45,35.96,30,0
    .goto Tirisfal Glades,56.79,37.79,30,0
    .goto Tirisfal Glades,56.05,38.76,30,0
    .goto Tirisfal Glades,55.09,38.74,30,0
    .goto Tirisfal Glades,55.25,40.16,30,0
    .goto Tirisfal Glades,54.68,42.12,30,0
    .goto Tirisfal Glades,55.29,41.51,30,0
    .goto Tirisfal Glades,56.58,41.99,30,0
    .goto Tirisfal Glades,58.29,42.93,30,0
    .goto Tirisfal Glades,58.83,40.68,30,0
    .goto Tirisfal Glades,58.36,38.55,30,0
    .goto Tirisfal Glades,57.48,35.95,30,0
    >>拾取地上的|cRXP_LOOT_末日草|r
    >>|cRXP_WARN_它们分布在豺狼人区域的树下|r
    .complete 5482,1 --Doom Weed (10)
    .isOnQuest 5482
step << Mage
    #season 2
    #optional
    #completewith MaggotEye
    .goto Tirisfal Glades,59.84,33.17,0
    .goto Tirisfal Glades,58.38,35.28,0
    .goto Tirisfal Glades,60.09,37.01,0
    >>施放|T136071:0|t[变形术]，以|cRXP_ENEMY_古怪的甜瓜|r为目标
    >>拾取地上的|T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob 古怪的甜瓜
    .train 415942,1
    .train 118,3
step
    #completewith MaggotEye
    >>击杀 |cRXP_ENEMY_混血腐皮豺狼人|r, 搜刮 |cRXP_LOOT_防腐剂|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob 混血腐皮豺狼人
step
    #label MaggotEye
    .goto Tirisfal Glades,58.66,30.77
    >>击杀 |cRXP_ENEMY_蛆眼|r, 获取 |cRXP_LOOT_爪子|r
    .complete 398,1 --Maggot Eye's Paw (1)
    .mob 蛆眼
step
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>击杀 |cRXP_ENEMY_混血腐皮豺狼人|r, 搜刮 |cRXP_LOOT_防腐剂|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob 混血腐皮豺狼人
step
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>击杀 |cRXP_ENEMY_腐皮豺狼人|r, 搜刮 |cRXP_LOOT_防腐剂|r
    .complete 358,3 --Embalming Ichor (8)
    .mob 混血腐皮豺狼人
    .mob 腐皮豺狼人
    .mob 腐皮盗墓贼
step << Rogue
    #season 2
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>|T133644:0|t[搜索] 并击杀 |cRXP_ENEMY_腐皮豺狼人|r, 搜刮 |T134327:0|t[|cRXP_LOOT_左下角地图碎片|r]
    .collect 208038,1 --Bottom-Left Map Piece (1)
    .mob 混血腐皮豺狼人
    .mob 腐皮盗墓贼
    .mob 腐皮豺狼人
    .train 400095,1
step << Warrior
    #season 2
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>击杀任意类型的 |cRXP_ENEMY_腐皮豺狼人|r, 搜刮 |cRXP_LOOT_被砍下的豺狼人的头|r
    .collect 204478,1 --Severed Gnoll Head (1)
    .mob 混血腐皮豺狼人
    .mob 腐皮豺狼人
    .mob 腐皮盗墓贼
    .train 403475,1
step << Warrior
    #season 2
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
    >>击杀|cRXP_ENEMY_邪鳍鱼人|r，拾取其|cRXP_LOOT_鳞片|r和|cRXP_LOOT_被砍下的鱼人的头|r
    .complete 368,1 --Vile Fin Scale (5)
    .collect 204477,1 --Severed Murloc Head (1)
    .mob 邪鳍污水鱼人
    .mob 邪鳍先知
    .mob 邪鳍泥浆鱼人
    .train 403475,1
step << Rogue
    #season 2
    #completewith MurlocVins
    >>施放|T133644:0|t[搜索]并击杀|cRXP_ENEMY_邪鳍鱼人|r，以拾取|T134241:0|t[|cRXP_LOOT_船只残骸宝箱钥匙|r]
    .collect 208007,1 --Shipwreck Cache Key (1)
    .train 400081,1
step << Rogue
    #season 2
    #completewith RuneofPrecision
    >>施放|T133644:0|t[搜索]并击杀|cRXP_ENEMY_邪鳍鱼人|r，从它们身上拾取|T134327:0|t[|cRXP_LOOT_右下角地图碎片|r]
    .collect 208037,1 --Bottom-Right Map Piece (1)
    .train 400095,1
step
    #label MurlocVins
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
    >>击杀|cRXP_ENEMY_邪鳍鱼人|r，拾取它们的|cRXP_LOOT_鳞片|r
    .complete 368,1 --Vile Fin Scale (5)
    .mob 邪鳍污水鱼人
    .mob 邪鳍先知
    .mob 邪鳍泥浆鱼人
step << Rogue
    #season 2
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
    >>施放|T133644:0|t[搜索]并击杀|cRXP_ENEMY_邪鳍鱼人|r，以拾取|T134241:0|t[|cRXP_LOOT_船只残骸宝箱钥匙|r]
    .collect 208007,1 --Shipwreck Cache Key (1)
    .mob 邪鳍污水鱼人
    .mob 邪鳍先知
    .mob 邪鳍泥浆鱼人
    .train 400081,1
step << Rogue
    #season 2
    .goto Tirisfal Glades,66.66,24.41
    >>打开|cRXP_PICK_船只残骸宝箱|r，拾取|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 204174,1 --Rune of Precision (1)
    .train 400081,1
step << Rogue
    #season 2
    #label RuneofPrecision
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_来学习|r |T135610:0|t[正中眉心]
    .use 204174
    .itemcount 204174,1
step << Rogue
    #season 2
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
    >>施放|T133644:0|t[搜索]并击杀|cRXP_ENEMY_邪鳍鱼人|r，从它们身上拾取|T134327:0|t[|cRXP_LOOT_右下角地图碎片|r]
    .collect 208037,1 --Bottom-Right Map Piece (1)
    .mob 邪鳍污水鱼人
    .mob 邪鳍先知
    .mob 邪鳍泥浆鱼人
    .train 400095,1
step << Rogue
    #season 2
    .use 208036 >>|cRXP_WARN_使用|r |T134327:0|t[|cRXP_LOOT_地图碎片|r] |cRXP_WARN_合成|r |T134269:0|t[|cRXP_LOOT_提瑞斯法藏宝图|r]
    .collect 208034,1 --Tirisfal Treasure Map (1)
    .train 400095,1
step
    #hardcore
    #completewith Brill3
    .subzone 159 >> 返回布瑞尔
    .subzoneskip 159
step
    #softcore
    #completewith Brill3
    .goto Tirisfal Glades,64.50,29.41
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    >>|cRXP_WARN_确保死在箭头位置，或箭头西侧|r
step
    #label DoomedWeed
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍兰德|r交谈, 他在墓地附近巡逻
    .turnin 5482 >>交任务：末日草
    .target 初级药剂师霍兰德
    .isQuestComplete 5482
step << Rogue
    #season 2
    .goto Tirisfal Glades,52.89,54.03
    .use 208034 >>|cRXP_WARN_使用|r |T134269:0|t[|cRXP_LOOT_提瑞斯法藏宝图|r] |cRXP_WARN_（在桥下操作）|r
    >>打开使用地图后出现的|cRXP_PICK_埋藏的宝物|r宝箱，从中获得|T134419:0|t[|cRXP_FRIENDLY_速射符文|r]
    .collect 203991,1 --Rune of Quick Draw (1s)
    .train 400095,1
step << Rogue
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_速射符文|r] |cRXP_WARN_来学习|r |T134536:0|t[速射]
    .use 203991
    .itemcount 203991,1
step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师乔汉|r、|cRXP_FRIENDLY_塞加德|r和|cRXP_FRIENDLY_塞弗伦|r交谈
    .turnin 368 >>交任务：新的瘟疫
    .accept 369 >>接任务：新的瘟疫
    .target +药剂师乔汉
    .goto Tirisfal Glades,59.45,52.40
    .turnin 398 >>交任务：悬赏：蛆眼
    .target +执行官塞加德
    .goto Tirisfal Glades,60.58,51.77
    .turnin 358 >>交任务：盗墓贼
    .accept 405 >>接任务：流浪的巫妖
    .accept 359 >>接任务：亡灵卫兵的职责
    .target +执政官塞弗伦
    .goto Tirisfal Glades,61.26,50.84
step
    #xprate >1.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师乔汉|r、|cRXP_FRIENDLY_塞加德|r和|cRXP_FRIENDLY_塞弗伦|r交谈
    .turnin 368 >>交任务：新的瘟疫
    .accept 369 >>接任务：新的瘟疫
    .target +药剂师乔汉
    .goto Tirisfal Glades,59.45,52.40
    .turnin 398 >>交任务：悬赏：蛆眼
    .target +执行官塞加德
    .goto Tirisfal Glades,60.58,51.77
    .turnin 358 >>交任务：盗墓贼
    .accept 405 >>接任务：流浪的巫妖 << Mage/Warlock
    .accept 359 >>接任务：亡灵卫兵的职责
    .target +执政官塞弗伦
    .goto Tirisfal Glades,61.26,50.84
step
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买一根|r |T132891:0|t[粗线]|cRXP_BUY_|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_库勒曼|r
    .accept 354 >>接任务：阿加曼德家族
    .accept 362 >>接任务：闹鬼的磨坊
    .target 库勒曼·法席恩
step << !Mage !Warlock
    #xprate >1.49
    #optional
    #completewith AgamandStart
    .abandon 405 >> 放弃任务：流浪的巫妖
step
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_黑暗牧师贝里尔|r交谈
	.train 139 >> 学习职业技能
    .target 黑暗牧师贝里尔
    .xp <8,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_凯恩|r 交谈
    .train 205 >> 学习职业技能
    .target 凯恩·火歌
    .xp <8,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_奥斯蒂尔|r
    .train 284 >> 学习职业技能
    .target 奥斯蒂尔·德·蒙
    .xp <8,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_马里恩|r 交谈
    .train 6760 >> 学习职业技能
    .target 马里恩·考尔
    .xp <8,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特|r 交谈
    .train 980 >> 学习职业技能
    .target 鲁伯特·鲍什
    .xp <8,1
step << Rogue/Warrior
    .goto Tirisfal Glades,61.81,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_妮拉|r交谈
    >>|cRXP_WARN_尽量利用等待时间(如等飞艇时)来制作这些物品|r
    .train 3273 >>学习 |T135966:0|t[急救]
    .target 妮拉
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥利弗|r 交谈
    .vendor >> 卖掉杂物。如果卖掉当前武器后能凑够购买 |T135641:0|t[卷刃的剑] 的钱（4 银 01 铜），就卖掉武器。现在钱不够的话，稍后会再回来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135641:0|t[卷刃的剑] |cRXP_BUY_。|r
    .collect 2494,1,354,1 --Collect Stiletto (1)
    .money <0.0401
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
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥利弗|r 交谈
    .vendor >> 卖掉杂物。如果卖掉当前武器后能凑够购买 |T135321:0|t[步兵剑] 的钱（5 银 36 铜），就卖掉武器。现在钱不够的话，稍后会再回来
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_奥利弗·德沃尔|r|cRXP_BUY_交谈，向他购买一把|r |T135321:0|t[步兵剑] |cRXP_BUY_。|r
    .collect 2488,1,354,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #optional
    #completewith MillsOverun
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step
    #label Brill3
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板瑞尼|r
    >>|cRXP_BUY_从她那里购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_|r << Mage/Priest
    >>|cRXP_BUY_从她那里购买|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_|r <<Warrior/Rogue
    >>|cRXP_BUY_从她那里购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_|r << Warlock
    .vendor >> 卖掉杂物
    .collect 1179,20,426,1 << Mage/Priest --Ice Cold Milk (20)
    .collect 4605,20,426,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,10,426,1 << Warlock --Ice Cold Milk (10)
    .collect 4605,10,426,1 << Warlock --Red-speckled Mushroom (10)
    .money <0.05
    .target 旅店老板瑞尼
step << Rogue/Warrior
    #softcore
    .goto Tirisfal Glades,60.31,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莉莎·考伦|r交谈
    .vendor >>修理武器
    .target 伊莉莎·考伦
step << Warrior
    #season 2
    #completewith AgamandStart
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 搜刮 |cRXP_LOOT_被砍下的蝙蝠的头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
step
    #completewith next
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 获取 |cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step
    #label AgamandStart
    .goto Tirisfal Glades,47.60,44.03,100,0
    .goto Tirisfal Glades,47.37,43.71
    .subzone 157 >> 向西北前往阿加曼德磨坊
    .isOnQuest 362
step
    #completewith ThurmanGregor
    >>|T134939:0|t[|cRXP_LOOT_给伊维特的信|r] |cRXP_WARN_可能从这些怪物身上掉落。获得后接取任务|r
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >> 接任务：未寄出的信件
    .use 2839
step
    #completewith ThurmanGregor
    >>击杀 |cRXP_ENEMY_骷髅士兵|r 和 |cRXP_ENEMY_暗眼骷髅法师|r, 搜刮 |cRXP_LOOT_肋骨|r 和 |cRXP_LOOT_头骨|r
    .complete 426,1 --Notched Rib (5)
    .mob +断骨士兵
    .mob +碎颅士兵
    .complete 426,2 --Blackened Skull (3)
    .mob +暗眼骷髅法师
step
    #label KillDevlin
    .goto Tirisfal Glades,47.34,40.78
    >>击杀 |cRXP_ENEMY_代弗林|r, 获取 |cRXP_LOOT_遗骸|r
    .complete 362,1 --Devlin's Remains (1)
    .mob 代弗林·阿加曼德
step
    .goto Tirisfal Glades,49.34,36.02
    >>击杀 |cRXP_ENEMY_妮萨|r, 搜刮 |cRXP_LOOT_遗骸|r. 她可能在建筑物内
    .complete 354,2 --Nissa's Remains (1)
    .mob 妮萨·阿加曼德
step
    #label ThurmanGregor
    #loop
    .goto Tirisfal Glades,45.08,31.15,0
    .goto Tirisfal Glades,43.71,35.25,60,0
    .goto Tirisfal Glades,45.03,30.99,60,0
    .goto Tirisfal Glades,46.79,29.80,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,45.08,31.15,60,0
    >>击杀 |cRXP_ENEMY_萨尔曼|r 和 |cRXP_ENEMY_格里高|r, 搜刮 |cRXP_LOOT_遗骸|r. 他们会在附近巡逻
    .complete 354,3 --Thurman's Remains (1)
    .unitscan +萨尔曼·阿加曼德
    .complete 354,1 --Gregor's Remains (1)
    .unitscan +格里高·阿加曼德
step
    #label MillsOverun
    #loop
    .goto Tirisfal Glades,45.08,31.15,0
    .goto Tirisfal Glades,43.71,35.25,60,0
    .goto Tirisfal Glades,45.03,30.99,60,0
    .goto Tirisfal Glades,46.79,29.80,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,45.08,31.15,60,0
    >>击杀 |cRXP_ENEMY_骷髅士兵|r 和 |cRXP_ENEMY_暗眼骷髅法师|r, 搜刮 |cRXP_LOOT_肋骨|r 和 |cRXP_LOOT_头骨|r
    .complete 426,1 --Notched Rib (5)
    .mob +断骨士兵
    .mob +碎颅士兵
    .complete 426,2 --Blackened Skull (3)
    .mob +暗眼骷髅法师
step
    #xprate <1.5
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    >>击杀 |cRXP_ENEMY_骷髅士兵|r 和 |cRXP_ENEMY_暗眼骷髅法师|r，拾取其 |T134939:0|t[|cRXP_LOOT_给伊维特的信|r]
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >> 接任务：未寄出的信件
    .use 2839
    .mob 断骨士兵
    .mob 暗眼骷髅法师
    .mob 碎颅士兵
    .xp >9+3620,1
    .isOnQuest 375
--XX 880(426)+480(361, OPT)+880(354)+420(362)+700(375, OPT)
step
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    >>击杀 |cRXP_ENEMY_骷髅士兵|r 和 |cRXP_ENEMY_暗眼骷髅法师|r，拾取其 |T134939:0|t[|cRXP_LOOT_给伊维特的信|r]
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >> 接任务：未寄出的信件
    .use 2839
    .mob 断骨士兵
    .mob 暗眼骷髅法师
    .mob 碎颅士兵
    .xp >9+4320,1
    .isQuestTurnedIn 375
--XX 880(426)+480(361, OPT)+880(354)+420(362)+700(375, OPT)
step
    #xprate >1.49
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    >>击杀 |cRXP_ENEMY_骷髅士兵|r 和 |cRXP_ENEMY_暗眼骷髅法师|r，拾取其 |T134939:0|t[|cRXP_LOOT_给伊维特的信|r]
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >> 接任务：未寄出的信件
    .use 2839
    .mob 断骨士兵
    .mob 暗眼骷髅法师
    .mob 碎颅士兵
    .xp >9+2180,1
    .isOnQuest 375
--XX 880(426)+480(361, OPT)+880(354)+420(362)+700(375, OPT)
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    >>击杀 |cRXP_ENEMY_骷髅士兵|r 和 |cRXP_ENEMY_暗眼骷髅法师|r，拾取其 |T134939:0|t[|cRXP_LOOT_给伊维特的信|r]
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >> 接任务：未寄出的信件
    .use 2839
    .mob 断骨士兵
    .mob 暗眼骷髅法师
    .mob 碎颅士兵
    .xp >9+3230,1
    .isQuestTurnedIn 375
--XX 880(426)+480(361, OPT)+880(354)+420(362)+700(375, OPT)
step
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+3620 >> 刷怪至 3620+/6500 经验值
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isOnQuest 375
step
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+4320 >> 刷怪至 4320+/6500 经验值
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isQuestTurnedIn 375
step
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+3840 >> 刷怪至 3840+/6500 经验值
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isQuestTurnedIn 375
step
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+3140 >> 刷怪至 3140+/6500 经验值
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isOnQuest 375
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+2180 >> 刷怪至 2180+/6500 经验值
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isOnQuest 375
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+3230 >> 刷怪至 3230+/6500 经验值
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isQuestTurnedIn 375
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+2510 >> 刷怪至 2510+/6500 经验值
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isQuestTurnedIn 375
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+1460 >> 刷怪至 1460+/6500 经验值
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isOnQuest 375
step << Mage/Priest
    #season 2
    .goto Tirisfal Glades,25.60,48.20
    >>击杀|cRXP_ENEMY_Gillgar|r，从他身上拾取|T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI|r] << Mage
    >>击杀 |cRXP_ENEMY_Gillgar|r, 搜刮 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] << Priest
    >>|cRXP_WARN_这是一个 7 级精英, 不容易击杀. 如果太难, 现在可以跳过他|r
    .collect 203753,1 << Mage --Spell Notes: RING SEFF OSTROF (1)
    .collect 205940,1 << Priest --Memory of a Dark Purpose (1)
    .mob Gillgar
    .train 401765,1 << Mage
    .train 425216,1 << Priest
step << Mage
    #optional
    #completewith LogoutSkip1
    #season 2
    .collect 211779,1 >>若已有理解魔符，现在可解读笔记；否则继续路线，稍后在幽暗城向施法材料商购买。
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI|r] |cRXP_WARN_来学习|r |T236227:0|t[寒冰指]
    .use 203753
    .itemcount 203753,1
    .train 401765,1
step
    #hardcore
    #completewith FoodandWater2
    .subzone 159 >> 返回布瑞尔
step
    #softcore
    #completewith FoodandWater2
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << Undead Priest
    #season 2
    .goto Tirisfal Glades,57.71,48.96
    .emote KNEEL
    .aura 418459 >> 在布瑞尔墓地跪下，获得 [亡灵之思]
    .itemcount 205940,1
    .train 425216,1
step << Undead Priest
    #season 2
    .train 425216 >> 使用 |T136222:0|t[黑暗意图的回忆] 学习 |T237514:0|t[虚空疫病]
    .use 205940
    .itemcount 205940,1
step
    .goto Tirisfal Glades,58.20,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_迪林格尔|r
    .turnin 426 >>交任务：磨坊告急
    .target 亡灵卫兵迪林格尔
step
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买一根|r |T132891:0|t[粗线]|cRXP_BUY_|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊维特|r和|cRXP_FRIENDLY_库勒曼|r交谈
    .turnin 361 >>交任务：未寄出的信件
    .target +伊维特·法席恩
    .goto Tirisfal Glades,61.58,52.60
    .turnin 354 >>交任务：阿加曼德家族
    .turnin 362 >>交任务：闹鬼的磨坊
    .accept 355 >>接任务：与塞弗伦交谈
    .target +库勒曼·法席恩
    .goto Tirisfal Glades,61.72,52.29
    .isOnQuest 361
step
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_库勒曼|r
    .turnin 354 >>交任务：阿加曼德家族
    .turnin 362 >>交任务：闹鬼的磨坊
    .accept 355 >>接任务：与塞弗伦交谈
    .target 库勒曼·法席恩
step
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_黑暗牧师贝里尔|r交谈
	.trainer >> 学习职业技能
    .target 黑暗牧师贝里尔
step << Warrior
    #optional
    .abandon 1505 >>放弃任务：老兵犹塞克
    .isOnQuest 1505
step << Warrior
    #optional
    .abandon 1498 >>放弃任务：防御之道
    .isOnQuest 1498
step << Warrior
    .goto Tirisfal Glades,61.85,52.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_奥斯蒂尔|r
    .trainer >> 学习职业技能
    .accept 1818 >> 接任务：迪林格尔
    .target 奥斯蒂尔·德·蒙 << Warrior
    .isQuestAvailable 1498
step << Warlock
    .goto Tirisfal Glades,61.62,52.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的 |cRXP_FRIENDLY_埃格隆|r 交谈
    .accept 1478 >> 接任务：哈加尔的召唤
    .target 埃格隆·卡加尔
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特|r 交谈
    .train 707 >> 学习职业技能
    .target 鲁伯特·鲍什
step << Rogue
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的 |cRXP_FRIENDLY_马里恩|r 交谈
    .trainer >> 学习职业技能
    .accept 1885 >>接任务：米奈特·卡加德
    .target 马里恩·考尔
step << Mage
    .goto Tirisfal Glades,61.96,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的 |cRXP_FRIENDLY_凯恩|r 交谈
    .accept 1881 >> 接任务：安娜斯塔西娅
    .target 凯恩·火歌
step
    #label FoodandWater2
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板瑞尼|r
    >>|cRXP_BUY_从她那里购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_|r << Mage/Priest/Shaman
    >>|cRXP_BUY_从她那里购买|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_|r <<Warrior/Rogue
    >>|cRXP_BUY_从她那里购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇]|cRXP_BUY_|r << Warlock
    .vendor >> 卖掉杂物
    .collect 1179,20,370,1 << Mage/Priest/Shaman --Ice Cold Milk (20)
    .collect 4605,20,370,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,15,370,1 << Warlock --Ice Cold Milk (15)
    .collect 4605,15,370,1 << Warlock --Red-speckled Mushroom (15)
    .money <0.075 << Warlock
    .money <0.05 << !Warlock
    .target 旅店老板瑞尼
step << Warrior
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_迪林格尔|r
    .turnin 1818 >> 交任务：迪林格尔
    .accept 1819 >> 接任务：切割者奥拉格
    .target 亡灵卫兵迪林格尔
    .isQuestAvailable 1498
step << Warrior
    .goto Tirisfal Glades,59.16,48.51
    >>|cRXP_WARN_点击地面上的骷髅头。这将召唤出|r |cRXP_ENEMY_奥拉格。|r |cRXP_WARN_击杀他|r
    .complete 1819,1 --Ulag the Cleaver (1)
    .mob 切割者奥拉格
    .isQuestAvailable 1498
step << Warrior
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_迪林格尔|r
    .turnin 1819 >> 交任务：切割者奥拉格
    .accept 1820 >> 接任务：库勒曼
    .target 亡灵卫兵迪林格尔
    .isQuestAvailable 1498
step << Warlock
    #completewith next
    .goto Tirisfal Glades,61.80,65.06,20 >> 进入幽暗城
    .zoneskip Undercity
step << Warlock
    #completewith next
    .goto Undercity,66.09,20.06,35,0
    .goto Undercity,64.37,23.94,35,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >> 乘坐升降梯前往幽暗城
step << Warlock
    .goto Undercity,85.07,25.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的 |cRXP_FRIENDLY_凯伦丁|r 交谈
    .turnin 1478 >> 交任务：哈加尔的召唤
    .accept 1473 >> 接任务：虚空中的生物
    .target 凯伦丁·哈加尔
step << Warlock
    .goto Undercity,47.25,39.12,50,0
    .goto Undercity,46.35,43.86,10,0
    .goto Undercity,45.24,39.35,10,0
    .goto Undercity,41.32,38.40,10,0
    .goto Undercity,40.74,33.95,10,0
    .goto Undercity,34.80,33.19,15,0
    .goto Undercity,27.39,30.23,35,0
    .goto Undercity,21.89,43.35,35,0
    .goto Tirisfal Glades,51.10,71.53,50,0
    .zone Tirisfal Glades >> 从下水道离开幽暗城
    .zoneskip Tirisfal Glades
step << Rogue
    #season 2
    #completewith ScarletCrusade1
    >>施放|T133644:0|t[搜索]，并从|cRXP_ENEMY_派瑞恩队长|r身上拾取|T133385:0|t[|cRXP_LOOT_血色军官玺戒|r]
    .collect 208085,1 --Scarlet Lieutenant Signet Ring (1)
    .mob 派瑞恩队长
    .train 400094,1
step << Warlock
    #completewith next
    .goto Tirisfal Glades,51.06,67.57
    >>拾取|cRXP_PICK_派瑞恩的箱子|r，获取|T133733:0|t[埃加林的魔典]
    .complete 1473,1 --Egalin's Grimoire (1)
step
    #label ScarletCrusade1
    #loop
	.goto Tirisfal Glades,50.07,68.87,40,0
	.goto Tirisfal Glades,50.23,66.94,40,0
	.goto Tirisfal Glades,51.16,65.73,40,0
	.goto Tirisfal Glades,51.75,66.04,40,0
	.goto Tirisfal Glades,52.93,67.62,40,0
	.goto Tirisfal Glades,52.72,69.33,40,0
	.goto Tirisfal Glades,51.96,69.57,40,0
	.goto Tirisfal Glades,51.03,69.55,40,0
    >>击杀 |cRXP_ENEMY_派瑞恩队长|r、|cRXP_ENEMY_血色狂热者|r 和 |cRXP_ENEMY_血色传教士|r, 搜刮 |cRXP_LOOT_血色十字军徽记之戒|r
    .complete 370,1 --Captain Perrine (1)
    .mob +派瑞恩队长
    .complete 370,2 --Scarlet Zealot (3)
    .mob +血色狂热者
    .complete 370,3 --Scarlet Missionary (3)
    .mob +血色传教士
    .complete 374,1 --Scarlet Insignia Ring (10)
    .disablecheckbox
step << Rogue
    #season 2
    .goto Tirisfal Glades,51.17,67.81
    >>施放|T133644:0|t[搜索]，并从|cRXP_ENEMY_派瑞恩队长|r身上拾取|T133385:0|t[|cRXP_LOOT_血色军官玺戒|r]
    .collect 208085,1 --Scarlet Lieutenant Signet Ring (1)
    .mob 派瑞恩队长
    .train 400094,1
step << Warlock
    .goto Tirisfal Glades,51.06,67.57
    >>拾取地面上的|cRXP_PICK_派瑞恩的箱子|r，获取|T133733:0|t[埃加林的魔典]
    .complete 1473,1 --Egalin's Grimoire (1)
step
    #xprate <1.5
    #completewith UCHome
    .goto Undercity,16.51,42.76,35,0
    .goto Undercity,22.98,39.76,35,0
    .goto Undercity,24.93,32.54,35,0
    .goto Undercity,34.78,33.24,10,0
    .goto Undercity,40.83,34.08,10,0
    .goto Undercity,41.35,38.40,10,0
    .goto Undercity,45.25,39.20,10,0
    .goto Undercity,45.67,43.60,10,0
    .zone Undercity >> 从下水道进入幽暗城
    .zoneskip Undercity
step
    #xprate >1.49
    #ah << Priest
    #completewith LogoutSkip1
    .goto Undercity,16.51,42.76,35,0
    .goto Undercity,22.98,39.76,35,0
    .goto Undercity,24.93,32.54,35,0
    .goto Undercity,34.78,33.24,10,0
    .goto Undercity,40.83,34.08,10,0
    .goto Undercity,41.35,38.40,10,0
    .goto Undercity,45.25,39.20,10,0
    .goto Undercity,45.67,43.60,10,0
    .zone Undercity >> 从下水道进入幽暗城
    .zoneskip Undercity
--XX Priest skips on 1.5x unless they go for a Wand. No reason to go Undercity if skipping Lich quest and not setting hearth
step << Rogue
    .goto Undercity,57.29,32.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话军事区的 |cRXP_FRIENDLY_阿基巴德|r
    .train 201 >>学习单手剑（1h）
    .target 阿基巴德
step << Warrior/Rogue
    .goto Undercity,56.06,37.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布罗姆|r 交谈
    .train 2575 >> 学习 |T136248:0|t[采矿]
    >>|cRXP_WARN_这样就能从矿脉中获得|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r |cRXP_WARN_，用来制作|r |T135248:0|t[磨刀石] |cRXP_WARN_（武器伤害 +2，持续 30 分钟）|r
    .target 布罗姆·基里安
step << Warrior/Rogue
    .goto Undercity,56.72,36.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎拉|r交谈
    >>|cRXP_BUY_购买一把|r |T134708:0|t[矿工锄] |cRXP_BUY_（向|r |cRXP_FRIENDLY_莎拉|r购买）
    .collect 2901,1,371,1 --Mining Pick (1)
    .target 莎拉·基里安
    .train 2575,3 --Mining Trained
 step << Warrior/Rogue
    .goto Undercity,60.17,29.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴兹尔·弗莱伊|r 交谈
    .train 2018 >> 学习 |T136241:0|t[锻造]
    .target 巴兹尔·弗莱伊
    .train 2575,3 --Mining Trained
step << Priest/Mage/Warlock
    #xprate >1.49
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拍卖师雷克尔|r
    >>|cRXP_BUY_从拍卖行购买一根|r |T135139:0|t[次级魔法杖] |cRXP_BUY_|r << Priest
    >>|cRXP_BUY_如果需要，可以从拍卖行购买一根|r |T135139:0|t[次级魔法杖] |cRXP_BUY_|r << Mage/Warlock
    >>|cRXP_WARN_如果你这样做，而且之前收集了|r |T132889:0|t[亚麻布] |cRXP_WARN_，可以将这些|r |T132889:0|t[亚麻布] |cRXP_WARN_放到拍卖行出售|r << Priest
    >>|cRXP_WARN_(可选) 如果你不想或由于资源不足无法完成此步骤, 请跳过|r
    .collect 11287,1,435,1 << Priest/Mage/Warlock --Lesser Magic Wand (1)
    .target 拍卖师雷克尔
    .itemStat 18,QUALITY,<7 << Priest/Mage/Warlock
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3 << Priest/Mage/Warlock
--XX Intentional for priests on 1.5x xp to only do this if they don't have a lesser magic wand
step << !Priest
    #xprate >1.49
    #ah
    #optional
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拍卖师雷克尔|r
    >>|cRXP_BUY_从拍卖行购买六个|r |T134339:0|t[变色的狼心] |cRXP_BUY_|r
    >>|cRXP_WARN_可跳过, 仅节省少量时间|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .target 拍卖师雷克尔
step << Warlock
    .goto Undercity,85.07,25.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的 |cRXP_FRIENDLY_凯伦丁|r 交谈
    .turnin 1473 >> 交任务：虚空中的生物
    .accept 1471 >> 接任务：誓缚
    .target 凯伦丁·哈加尔
step << Warlock
    #completewith next
    .cast 9221 >>|cRXP_WARN_使用|r |T134416:0|t[召唤符文] |cRXP_WARN_（在召唤法阵处操作）|r
    .use 6284
step << Warlock
    .goto Undercity,86.64,27.10
    >>击杀 |cRXP_ENEMY_召唤出的虚空行者|r
    .complete 1471,1 --Kill Summoned Voidwalker (1)
    .mob 虚空行者
    .use 6284
step << Warlock
    .goto Undercity,85.04,25.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_凯伦丁|r
    .turnin 1471 >>交任务：誓缚
    .target 凯伦丁·哈加尔
step << Warrior
    #ssf
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者训练区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135350:0|t[优质重剑] |cRXP_BUY_。|r
    .collect 1198,1,371,1 --Collect Claymore (1)
    .money <0.2676
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target 查尔斯·希顿
step << Warrior
    #ah
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者训练区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135350:0|t[优质重剑] |cRXP_BUY_。|r
    >>|cRXP_WARN_或者, 也可以去拍卖行看看有没有更好或更便宜的替代品|r
    .collect 1198,1,371,1 --Collect Claymore (1)
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
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者训练区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_从他那里购买一把|r |T135346:0|t[斗士短剑]|cRXP_BUY_|r
    .collect 851,1,371,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 查尔斯·希顿
step << Rogue
    #ah
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者训练区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_从他那里购买一把|r |T135346:0|t[斗士短剑]|cRXP_BUY_|r
    >>|cRXP_WARN_或者, 也可以去拍卖行看看有没有更好或更便宜的替代品|r
    .collect 851,1,371,1 --Collect Cutlass (1)
    .money <0.2023
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
    .goto Undercity,77.50,49.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者训练区的|cRXP_FRIENDLY_纳撒尼尔·斯蒂恩维克|r交谈
    >>|cRXP_BUY_购买|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）] |cRXP_BUY_从他那里|r
    .collect 3107,200,371,1 << !tbc
    .collect 25873,1,371,1 << tbc
    .target 纳撒尼尔·斯蒂恩维克
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_记得装备|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）] |cRXP_WARN_（需要11级）。|r
    .use 3107 << !tbc
    .use 25873 << tbc
    .itemcount 3107,1 << !tbc
    .itemcount 25873,1 << tbc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp >11,1
step << Rogue
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]
    .use 3107 << !tbc
    .use 25873 << tbc
    .itemcount 3107,1 << !tbc
    .itemcount 25873,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Rogue
    .goto Undercity,83.52,69.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_米奈特|r
    .turnin 1885 >>交任务：米奈特·卡加德
    .accept 1886 >>接任务：亡灵哨兵
    .target 米奈特·卡加德
step << Mage
    #optional
    .abandon 1883 >> 放弃任务：安苏瓦，否则将无法接取后续任务
    .isOnQuest 1883
step << Mage
    .goto Undercity,85.12,10.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话魔法区的 |cRXP_FRIENDLY_安娜斯塔西娅|r
    .turnin 1881 >> 交任务：安娜斯塔西娅
    .accept 1882 >> 接任务：巴尼尔农场
    .target 安娜斯塔西娅·哈特威尔
step
    #xprate <1.5
    .goto Undercity,84.06,17.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话魔法区里的 |cRXP_FRIENDLY_比索|r
    .turnin 405 >>交任务：流浪的巫妖
    .accept 357 >>接任务：巫妖的身份
    .target 比索·埃斯沙德
step << Mage/Warlock
    #xprate >1.49
    .goto Undercity,84.06,17.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话魔法区里的 |cRXP_FRIENDLY_比索|r
    .turnin 405 >>交任务：流浪的巫妖
    .target 比索·埃斯沙德
step << Mage
    #season 2
    #optional
    .goto Undercity,69.40,39.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托马斯·莫丹|r 交谈，购买一个 |T135933:0|t[理解魔符]
    .collect 211779,1
    .train 401768 >> 使用 [法术笔记：IULAOYIHTEN] 学习 [活体烈焰]
    .use 203752
    .target 托马斯·莫丹
    .itemcount 203752,1
    .train 401768,1
    .money <0.075
step << Mage
    #season 2
    #optional
    .goto Undercity,69.40,39.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托马斯·莫丹|r 交谈，购买一个 |T135933:0|t[理解魔符]
    .collect 211779,1
    .train 401765 >> 使用 [法术笔记：IGBHNHZNAI] 学习 [寒冰指]
    .use 203753
    .target 托马斯·莫丹
    .itemcount 203753,1
    .train 401765,1
    .money <0.075
step
    #xprate <1.5
    #label UCHome
    .goto Undercity,67.74,37.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_诺曼|r 交谈
    .home >> 将炉石绑定在幽暗城
    .target 旅店老板诺曼
    .bindlocation 1497
step
    #optional
    #label LogoutSkip1
step << skip
    #xprate <1.5 << !Mage !Warlock
    .goto Undercity,84.86,20.34
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_执行登出跳过：站到最下方那段楼梯的最高处，直到角色看起来悬空，然后登出再登录|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >> |cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果无法完成登出跳过操作, 就正常从幽暗城跑出去|r
step << skip -- !Mage !Warlock
    #xprate >1.49
    #ah << Priest
    .goto Undercity,61.10,54.11 << Priest
    .goto Undercity,78.03,50.36 << Warrior
    .goto Undercity,82.75,65.23 << Rogue
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_执行小退跳过: 跳到木桶堆顶部, 然后登出再上线|r << Priest/Warrior
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_执行小退跳过: 跳到绞肉车的绞肉机顶部, 然后登出再上线|r << Rogue
    >>|cRXP_WARN_如果无法完成登出跳过操作, 就正常从幽暗城跑出去|r
    .zoneskip Undercity,1
step
    #xprate <1.5 << Priest
    #completewith AtWarS
    .goto Tirisfal Glades,61.92,64.85
    .zone Tirisfal Glades >> 离开幽暗城
    .zoneskip Tirisfal Glades
step << Undead Rogue
    #sticky
    #completewith UnluckyRogue
    >>|cRXP_WARN_如果你看到|r |cRXP_FRIENDLY_阿斯托|r|cRXP_WARN_，就与他对话并将其击杀。从他身上拾取信件。他在布瑞尔和瑟伯切尔之间的道路上巡逻。|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan 阿斯托·哈德恩
    .isOnQuest 1886
step << Mage/Warlock
    #xprate >1.49
    #completewith AtWarS
    #optional
    .abandon 357 >>放弃任务：巫妖的身份
step
    #optional
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_伯吉斯|r
    .turnin 374 >>交任务：死亡证明
    .target 亡灵卫兵伯吉斯
    .isQuestComplete 374
step
    #label AtWarS
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塞加德|r
    .turnin 370 >>交任务：与血色十字军的战争
    .accept 371 >>接任务：与血色十字军的战争
    .target 执行官塞加德
step << Rogue
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    .use 208085 >>|cRXP_WARN_使用|r |T133385:0|t[|cRXP_LOOT_血色军官玺戒|r] |cRXP_WARN_制作|r |T134328:0|t[|cRXP_LOOT_伪造的血色备忘录|r]
    .collect 208086,1 --Forged Scarlet Memorandum (1)
    .train 400094,1
step << Rogue
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_加米尔·诺瑞|r, 获取 |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    .collect 203990,1 --Rune of Mutilation (1)
    .target 加米尔·诺瑞
    .skipgossip
    .train 400094,1
step << Rogue
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r] |cRXP_WARN_来学习|r |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1
step
    .goto Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_ 与|r |cRXP_FRIENDLY_温特斯夫人|r 对话
    >>|cRXP_BUY_购买一个|r |T133634:0|t[棕色小包] |cRXP_BUY_从|r |cRXP_FRIENDLY_她那里|r
    .collect 4496,1,356,1 --Small Brown Pouch (1)
    .target 温特斯夫人
    .money <0.05
step << Warrior
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_库勒曼|r
    .turnin 1820 >>交任务：库勒曼
    .target 库勒曼·法席恩
step << Warrior
    #season 2
    #completewith UnluckyRogue
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 搜刮 |cRXP_LOOT_被砍下的蝙蝠的头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
step
    #completewith next
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 获取 |cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step
    #label UnluckyRogue
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_林奈|r
    .turnin 359 >>交任务：亡灵卫兵的职责
    .accept 360 >>接任务：向塞弗伦回报
    .accept 356 >>接任务：巡查后方
    .target 亡灵卫兵林奈
step << Warrior
    #season 2
    #completewith ArriveBalnir
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 搜刮 |cRXP_LOOT_被砍下的蝙蝠的头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
step
    #completewith ArriveBalnir
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 获取 |cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step
    #label ArriveBalnir
    .goto Tirisfal Glades,76.51,61.77
    .subzone 165 >>前往巴尼尔农场
    .isOnQuest 356
step << Mage
    #season 2
    #completewith HorrorsandSpirits
    >>施放|T136071:0|t[变形术]，以|cRXP_ENEMY_古怪的甜瓜|r为目标
    >>拾取地上的|T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob 古怪的甜瓜
    .train 415942,1
    .train 118,3
step << Mage
    #completewith next
    >>击杀 |cRXP_ENEMY_可怕的血僵尸|r 和 |cRXP_ENEMY_游荡的幽灵|r
    .complete 356,1 --Bleeding Horror (8)
    .mob +可怕的血僵尸
    .complete 356,2 --Wandering Spirit (8)
    .mob +游荡的幽灵
step << Mage
    .goto Tirisfal Glades,77.48,62.00
    >>拾取地面上任意植物, 获取 |cRXP_PICK_巴尼尔金鱼草|r
    .complete 1882,1 --Balnir Snapdragons (1)
step
    #label HorrorsandSpirits
    #loop
	.goto Tirisfal Glades,74.31,60.98,0
	.goto Tirisfal Glades,74.31,60.98,50,0
	.goto Tirisfal Glades,74.45,59.64,50,0
	.goto Tirisfal Glades,75.08,58.56,50,0
	.goto Tirisfal Glades,76.45,58.67,50,0
	.goto Tirisfal Glades,77.41,58.66,50,0
	.goto Tirisfal Glades,78.55,60.43,50,0
	.goto Tirisfal Glades,77.45,61.46,50,0
	.goto Tirisfal Glades,76.79,62.60,50,0
	.goto Tirisfal Glades,74.99,61.98,50,0
    >>击杀 |cRXP_ENEMY_可怕的血僵尸|r 和 |cRXP_ENEMY_游荡的幽灵|r
    .complete 356,1 --Bleeding Horror (8)
    .mob +可怕的血僵尸
    .complete 356,2 --Wandering Spirit (8)
    .mob +游荡的幽灵
step << Mage
    #season 2
    #loop
    .goto Tirisfal Glades,76.51,61.77,0
    .goto Tirisfal Glades,75.12,61.49,20,0
    .goto Tirisfal Glades,76.51,61.77,20,0
    .goto Tirisfal Glades,76.04,59.31,20,0
    >>施放|T136071:0|t[变形术]，以|cRXP_ENEMY_古怪的甜瓜|r为目标
    >>拾取地上的|T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob 古怪的甜瓜
    .train 415942,1
    .train 118,3
step << Mage
    #season 2
    >>|cRXP_WARN_使用|r |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r |cRXP_WARN_合成|r |T134332:0|t|cRXP_LOOT_[法术笔记：启迪]|r
    .collect 203749,1 --Spell Notes: Enlightenment (1)
    .use 208183 --Apothecary Notes
    .train 415942,1
    .itemcount 208183,6
step << Mage
    #season 2
    .train 415942 >>|cRXP_WARN_使用|r |T134332:0|t|cRXP_LOOT_[法术笔记: 启迪]|r |cRXP_WARN_学习符文:|r |T133815:0|t[铭刻胸甲 - 启迪]
    .use 203749
    .itemcount 203749,1 --Spell Notes: Enlightenment (1)
step
    #sticky
    #label Friars
    #loop
    #optional
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
    .goto Tirisfal Glades,79.82,56.40,0
    .goto Tirisfal Glades,80.95,57.21,40,0
    .goto Tirisfal Glades,81.62,54.84,40,0
    .goto Tirisfal Glades,81.56,53.07,40,0
    .goto Tirisfal Glades,79.31,55.25,40,0
    .goto Tirisfal Glades,77.14,54.92,40,0
    .goto Tirisfal Glades,76.15,55.30,40,0
    .goto Tirisfal Glades,76.12,57.22,40,0
    .goto Tirisfal Glades,77.16,56.75,40,0
    .goto Tirisfal Glades,79.82,56.40,40,0
    >>击杀 |cRXP_ENEMY_血色苦行修士|r 和 |cRXP_ENEMY_血色狂热者|r, 搜刮 |cRXP_LOOT_血色十字军徽记之戒|r
    .complete 371,2 --Scarlet Friar (5)
    .complete 374,1 --Scarlet Insignia Ring (10)
    .disablecheckbox
    .mob 血色苦行修士
    .mob 血色狂热者
    .isOnQuest 374
step
    #loop
    #sticky
    #requires Friars
    #label Friars2
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
    .goto Tirisfal Glades,79.82,56.40,0
    .goto Tirisfal Glades,80.95,57.21,40,0
    .goto Tirisfal Glades,81.62,54.84,40,0
    .goto Tirisfal Glades,81.56,53.07,40,0
    .goto Tirisfal Glades,79.31,55.25,40,0
    .goto Tirisfal Glades,77.14,54.92,40,0
    .goto Tirisfal Glades,76.15,55.30,40,0
    .goto Tirisfal Glades,76.12,57.22,40,0
    .goto Tirisfal Glades,77.16,56.75,40,0
    .goto Tirisfal Glades,79.82,56.40,40,0
    >>击杀 |cRXP_ENEMY_血色苦行修士|r
    .complete 371,2 --Scarlet Friar (5)
    .mob 血色苦行修士
    .isQuestTurnedIn 374
step
    .goto Tirisfal Glades,78.82,56.14
    >>击杀塔内的|cRXP_ENEMY_瓦松队长|r
    .complete 371,1 --Captain Vachon (1)
    .mob 瓦松队长
step
    #xprate >1.49
    #requires Friars2
    #loop
    #label FinishRings
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
    .goto Tirisfal Glades,79.82,56.40,0
    .goto Tirisfal Glades,80.95,57.21,40,0
    .goto Tirisfal Glades,81.62,54.84,40,0
    .goto Tirisfal Glades,81.56,53.07,40,0
    .goto Tirisfal Glades,79.31,55.25,40,0
    .goto Tirisfal Glades,77.14,54.92,40,0
    .goto Tirisfal Glades,76.15,55.30,40,0
    .goto Tirisfal Glades,76.12,57.22,40,0
    .goto Tirisfal Glades,77.16,56.75,40,0
    .goto Tirisfal Glades,79.82,56.40,40,0
    >>击杀 |cRXP_ENEMY_血色苦行修士|r 和 |cRXP_ENEMY_血色狂热者|r, 搜刮 |cRXP_LOOT_血色十字军徽记之戒|r
    .complete 374,1 --Scarlet Insignia Ring (10)
    .mob 血色苦行修士
    .mob 血色狂热者
    .isOnQuest 374
step << Priest
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
    .goto Tirisfal Glades,79.82,56.40,0
    .goto Tirisfal Glades,80.95,57.21,40,0
    .goto Tirisfal Glades,81.62,54.84,40,0
    .goto Tirisfal Glades,81.56,53.07,40,0
    .goto Tirisfal Glades,79.31,55.25,40,0
    .goto Tirisfal Glades,77.14,54.92,40,0
    .goto Tirisfal Glades,76.15,55.30,40,0
    .goto Tirisfal Glades,76.12,57.22,40,0
    .goto Tirisfal Glades,77.16,56.75,40,0
    .goto Tirisfal Glades,79.82,56.40,40,0
    >>|cRXP_WARN_收集3组|r |T132889:0|t[亚麻布] |cRXP_WARN_用于制作你的次级魔法杖。这是进入银松森林前收集足够数量的最后机会|r
    .collect 2589,60,435,1 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Warrior
    #season 2
    #completewith ViciousVenom
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 搜刮 |cRXP_LOOT_被砍下的蝙蝠的头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
step
    #completewith ViciousVenom
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 获取 |cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step
    #label ViciousVenom
    #requires Friars2
    #loop
    .goto Tirisfal Glades,85.03,54.72,0
    .goto Tirisfal Glades,83.50,55.56,30,0
    .goto Tirisfal Glades,85.03,54.72,30,0
    .goto Tirisfal Glades,86.56,54.51,30,0
    .goto Tirisfal Glades,88.06,54.99,30,0
    .goto Tirisfal Glades,88.94,53.56,30,0
    .goto Tirisfal Glades,89.70,51.88,30,0
    .goto Tirisfal Glades,90.92,50.56,30,0
    .goto Tirisfal Glades,90.87,48.33,30,0
    .goto Tirisfal Glades,89.87,46.65,30,0
    .goto Tirisfal Glades,85.04,46.68,30,0
    .goto Tirisfal Glades,84.52,49.29,30,0
    .goto Tirisfal Glades,83.46,52.09,30,0
    >>击杀 |cRXP_ENEMY_邪恶的夜行蜘蛛|r, 搜刮 |cRXP_LOOT_毒液|r
    .complete 369,1 --Vicious Night Web Spider Venom (4)
    .mob 邪恶的夜行蜘蛛
step << Warrior
    #season 2
    #xprate >1.49
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 搜刮 |cRXP_LOOT_被砍下的蝙蝠的头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
step
    #xprate >1.49
    #loop
    .goto Tirisfal Glades,83.59,43.84,0
    .goto Tirisfal Glades,72.33,33.01,0
    .goto Tirisfal Glades,83.59,43.84,70,0
    .goto Tirisfal Glades,80.77,46.40,70,0
    .goto Tirisfal Glades,75.86,46.02,70,0
    .goto Tirisfal Glades,73.10,40.71,70,0
    .goto Tirisfal Glades,72.33,33.01,70,0
    .goto Tirisfal Glades,68.69,34.33,70,0
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 获取 |cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step << Warrior
    #season 2
    #xprate >1.49
    #loop
    .goto Tirisfal Glades,83.59,43.84,0
    .goto Tirisfal Glades,72.33,33.01,0
    .goto Tirisfal Glades,83.59,43.84,70,0
    .goto Tirisfal Glades,80.77,46.40,70,0
    .goto Tirisfal Glades,75.86,46.02,70,0
    .goto Tirisfal Glades,73.10,40.71,70,0
    .goto Tirisfal Glades,72.33,33.01,70,0
    .goto Tirisfal Glades,68.69,34.33,70,0
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 搜刮 |cRXP_LOOT_被砍下的蝙蝠的头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
step
    #xprate >1.49
    .xp 11+2950 >> 刷怪至 2950+/8800 经验值
    .isOnQuest 374
    .isOnQuest 375
--XX 220 (369)+840 (371)+390 (360)+90 (355)+160 (407)+875 (492) = 2575 -> 3860
--XX +625 (374 OPT)+700 (375 OPT) = 3900 -> 5850
--XX +625 (374 OPT) = 3200 -> 4800
--XX +700 (375 OPT) = 3275 -> 4910
step
    #xprate >1.49
    #optional
    .xp 11+3890 >> 刷怪至 3890+/8800 经验值
    .isQuestTurnedIn 374
    .isOnQuest 375
step
    #xprate >1.49
    #optional
    .xp 11+4000 >> 刷怪至 4000+/8800 经验值
    .isOnQuest 374
    .isQuestTurnedIn 375
step
    #xprate >1.49
    #optional
    .xp 11+4940 >> 刷怪至 4940+/8800 经验值
    .isQuestTurnedIn 374
    .isQuestTurnedIn 375
step
    #xprate >1.49
    #completewith ANewPlagueFinal
    .hs >> 炉石回布瑞尔
    .subzoneskip 159
    .bindlocation 2119,1
    .cooldown item,6948,>0,1
step
    #xprate >1.49
    #completewith ANewPlagueFinal
    .subzone 159 >> 返回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,<0
step
    #xprate <1.5
    .goto Tirisfal Glades,67.97,42.09
    >>在澈水湖的岛上从|cRXP_PICK_冈瑟尔的书籍|r中拾取|cRXP_LOOT_巫妖的法术书|r
    .complete 357,1 --The Lich's Spellbook (1)
step
    #xprate <1.5
    #hardcore
    #completewith ANewPlagueFinal
    .subzone 159 >> 返回布瑞尔
    .subzoneskip 159
step
    #xprate <1.5
    #softcore
    #completewith ANewPlagueFinal
    .goto Tirisfal Glades,66.60,44.95
    .deathskip >> 在 |cRXP_WARN_较小岛屿|r 上死亡, 在 |cRXP_FRIENDLY_灵魂医者|r 处重生
step
    .goto Tirisfal Glades,59.45,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔汉|r
    .turnin 369 >>交任务：新的瘟疫
    .accept 492 >>接任务：新的瘟疫
    .accept 445 >>接任务：给银松森林送信
    .target 药剂师乔汉
step << skip
    #phase 3-6
    .goto Tirisfal Glades,59.45,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔汉|r
    .turnin 369 >>交任务：新的瘟疫
    .accept 492 >>接任务：新的瘟疫
    --.accept 445 >>Accept Delivery to Silverpine Forest
    .target 药剂师乔汉
step
    #xprate <1.5
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塞加德|r
    .turnin 371 >>交任务：与血色十字军的战争
    .accept 372 >>接任务：与血色十字军的战争
    .target 执行官塞加德
step
    #xprate >1.49
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塞加德|r
    .turnin 371 >>交任务：与血色十字军的战争
    .target 执行官塞加德
step
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塞弗伦|r
    .turnin 360 >>交任务：向塞弗伦回报
    .turnin 355 >>交任务：与塞弗伦交谈
    .target 执政官塞弗伦
step
    #xprate >1.49
    #optional
    #completewith ANewPlagueFinal
    .abandon 372 >> 放弃任务：与血色十字军的战争
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_伯吉斯|r
    .turnin 374 >>交任务：死亡证明
    .target 亡灵卫兵伯吉斯
    .isQuestComplete 374
step
    #xprate >1.49
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_伯吉斯|r
    .turnin 374 >>交任务：死亡证明
    .target 亡灵卫兵伯吉斯
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买一根|r |T132891:0|t[粗线]|cRXP_BUY_|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate >1.49
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买一根|r |T132891:0|t[粗线]|cRXP_BUY_|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .isQuestAvailable 375
step
    .goto Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_ 与|r |cRXP_FRIENDLY_温特斯夫人|r 对话
    >>|cRXP_BUY_购买一个|r |T133634:0|t[棕色小包] |cRXP_BUY_从|r |cRXP_FRIENDLY_她那里|r
    .collect 4496,1,372,1 --Small Brown Pouch (1)
    .target 温特斯夫人
    .money <0.05
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step
    #xprate >1.49
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
step
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板瑞尼|r
	.vendor >>|cRXP_BUY_卖掉杂物, 按需补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_卖掉杂物, 按需补充食物|r << Rogue/Warrior
    .target 旅店老板瑞尼
step << Warrior
    #season 2
    .goto Tirisfal Glades,61.73,51.91
    .gossipoption 110750 >>与|cRXP_FRIENDLY_佩妮|r交谈
    .target 佩妮·霍克金斯
    .train 425447,1
step
    #label ANewPlagueFinal
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店后方楼下的 |cRXP_FRIENDLY_血色十字军俘虏|r 和 |cRXP_FRIENDLY_被俘虏的巡山人|r 交谈
    .turnin 407 >>交任务：悲伤之地
    .goto Tirisfal Glades,61.97,51.29
    .target +血色十字军俘虏
    .turnin 492 >> 交任务：新的瘟疫
    .goto Tirisfal Glades,61.94,51.40
    .target +被俘虏的巡山人
step << Warrior
    #season 2
    .goto Tirisfal Glades,61.72,51.72
    .gossipoption 109084 >>与旅店楼下的|cRXP_FRIENDLY_蓝心|r交谈
    .target 蓝心
    .train 425447,1
step << Warrior
    #season 2
    .goto Tirisfal Glades,61.72,51.91
    >>击杀 |cRXP_ENEMY_蓝心|r, 然后与二楼的|cRXP_FRIENDLY_佩妮|r交谈
    .gossipoption 110751 >>从她那里获得|T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target 佩妮·霍克金斯
    .mob 蓝心
    .train 425447,1
    .skipgossip
step << Warrior
    #season 2
    .train 425447 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .use 204716
    .itemcount 204716,1
--XX Start of <1.5x section (undercity hs)
step
    #xprate <1.5
    #completewith UndercityLS2
    .hs >> 炉石回幽暗城
    .cooldown item,6948,>0,1
    .bindlocation 1497,1
    .zoneskip Undercity
step
    #xprate <1.5
    #completewith UndercityLS2
    .zone Undercity >>前往幽暗城
    .cooldown item,6948,<0
step
    #xprate <1.5
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拍卖师雷克尔|r
    >>|cRXP_BUY_从拍卖行购买六个|r |T134339:0|t[变色的狼心] |cRXP_BUY_|r
    >>|cRXP_WARN_可跳过, 仅节省少量时间|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .target 拍卖师雷克尔
step << Mage
    #xprate <1.5
    .goto Undercity,85.12,10.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话魔法区的 |cRXP_FRIENDLY_安娜斯塔西娅|r
    .turnin 1882 >>交任务：巴尼尔农场
    .target 安娜斯塔西娅·哈特威尔
step
    #optional << Rogue
    #xprate <1.5
    .goto Undercity,84.06,17.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比索·埃斯沙德|r交谈
    .turnin 357 >>交任务：巫妖的身份
    .accept 366 >>接任务：归还书籍
    .target 比索·埃斯沙德
step << Rogue
    #ssf
    #xprate <1.5
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者训练区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_从他那里购买一把|r |T135346:0|t[斗士短剑]|cRXP_BUY_|r
    .collect 851,1,372,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 查尔斯·希顿
step << Rogue
    #ah
    #xprate <1.5
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者训练区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_从他那里购买一把|r |T135346:0|t[斗士短剑]|cRXP_BUY_|r
    >>|cRXP_WARN_或者, 也可以去拍卖行看看有没有更好或更便宜的替代品|r
    .collect 851,1,372,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 查尔斯·希顿
step << Rogue
    #xprate <1.5
    #optional
    #completewith CaptainMelrache
    +|cRXP_WARN_装备|r |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Warrior
    #ssf
    #xprate <1.5
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者训练区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135350:0|t[优质重剑] |cRXP_BUY_。|r
    .collect 1198,1,372,1 --Collect Claymore (1)
    .money <0.2950
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target 查尔斯·希顿
step << Warrior
    #ah
    #xprate <1.5
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者训练区的|cRXP_FRIENDLY_查尔斯·希顿|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135350:0|t[优质重剑] |cRXP_BUY_。|r
    >>|cRXP_WARN_或者, 也可以去拍卖行看看有没有更好或更便宜的替代品|r
    .collect 1198,1,372,1 --Collect Claymore (1)
    .money <0.2950
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target 查尔斯·希顿
step << Warrior
    #xprate <1.5
    #optional
    #completewith CaptainMelrache
    +|cRXP_WARN_装备|r |T135350:0|t[优质重剑]
    .use 1198
    .itemcount 1198,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Rogue
    #xprate <1.5
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_米奈特|r
    .turnin 1886 >>交任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestComplete 1886
step << Rogue
    #xprate <1.5
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_米奈特|r
    .accept 1898 >>接任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1886
step << Rogue
    #xprate <1.5
    .goto Undercity,54.84,76.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德隆·甘特|r交谈
    .turnin 1898 >>交任务：亡灵哨兵
    .accept 1899 >>接任务：亡灵哨兵
    .target 安德隆·甘特
    .isQuestTurnedIn 1886
step << Rogue
    #xprate <1.5
    .goto Undercity,55.43,76.87
    >>搜寻|cRXP_PICK_安德隆的书架|r，拾取其中的物品。书架位于|cRXP_FRIENDLY_安德隆|r身后
    .complete 1899,1 --Andron's Ledger (1)
    .isQuestTurnedIn 1886
step << Rogue
    #xprate <1.5
    .goto Undercity,83.53,69.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_米奈特|r
    .turnin 1899 >>交任务：亡灵哨兵
    .accept 1978 >>接任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1886
step << Rogue
    #xprate <1.5
    .goto Undercity,58.86,78.76,40,0
    .goto Undercity,56.2,92.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
    .turnin 1978 >>交任务：亡灵哨兵
    .target 瓦里玛萨斯
    .isQuestTurnedIn 1886
step << skip --Rogue
    #xprate <1.5
    #optional
    .goto Undercity,55.22,90.88
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_站在圆圈边缘，直到角色看起来悬空，然后登出再登录，执行登出跳过|r
	.link https://www.youtube.com/watch?v=jj85AXyF1XE >> |cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果无法完成登出跳过操作, 就正常从幽暗城跑出去|r
    .isQuestTurnedIn 1886
step << Rogue
    #xprate <1.5
    .goto Undercity,84.06,17.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比索·埃斯沙德|r交谈
    .turnin 357 >>交任务：巫妖的身份
    .accept 366 >>接任务：归还书籍
    .target 比索·埃斯沙德
    .isOnQuest 1886
step << skip
    #xprate <1.5
    .goto Undercity,84.86,20.34
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_执行登出跳过：站到最下方那段楼梯的最高处，直到角色看起来悬空，然后登出再登录|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >> |cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果无法完成登出跳过操作, 就正常从幽暗城跑出去|r
    .zoneskip Undercity,1
    .isOnQuest 1886 << Rogue
step
    #xprate <1.5
    #label UndercityLS2
    #completewith next
    .goto Tirisfal Glades,61.92,64.85
    .zone Tirisfal Glades >> 离开幽暗城
    .zoneskip Tirisfal Glades
step
    #xprate <1.5
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_林奈|r
    .turnin 356 >>交任务：巡查后方
    .target 亡灵卫兵林奈
step
    #xprate <1.5
    #label CaptainMelrache
    .goto Tirisfal Glades,79.52,25.14
    >>击杀塔中的 |cRXP_ENEMY_麦拉其队长|r 及其 |cRXP_ENEMY_血色保镖|r, 搜刮 |cRXP_LOOT_血色十字军徽记之戒|r
    >>|cRXP_WARN_路上刷怪|r << Warrior/Mage
    .complete 372,1 --Captain Melrache (1)
    .mob +麦拉其队长
    .complete 372,2 --Scarlet Bodyguard (2)
    .mob +血色保镖
    .complete 374,1 --Scarlet Insignia Ring (10)
    .disablecheckbox
step
    #xprate <1.5
    #label FinishRings
    #loop
    .goto Tirisfal Glades,79.04,28.54,0
    .goto Tirisfal Glades,79.36,26.21,40,0
    .goto Tirisfal Glades,79.04,28.54,40,0
    .goto Tirisfal Glades,78.92,31.42,40,0
    .goto Tirisfal Glades,77.89,35.49,40,0
    .goto Tirisfal Glades,78.65,36.09,40,0
    >>完成收集|cRXP_LOOT_血色十字军徽记之戒|r
    .complete 374,1 --Scarlet Insignia Ring (10)
step << Priest
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,79.04,28.54,0
    .goto Tirisfal Glades,79.36,26.21,40,0
    .goto Tirisfal Glades,79.04,28.54,40,0
    .goto Tirisfal Glades,78.92,31.42,40,0
    .goto Tirisfal Glades,77.89,35.49,40,0
    .goto Tirisfal Glades,78.65,36.09,40,0
    >>|cRXP_WARN_收集3组|r |T132889:0|t[亚麻布] |cRXP_WARN_用于制作你的次级魔法杖。这是进入银松森林前收集足够数量的最后机会|r
    .collect 2589,60,435,1 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Warrior
    #xprate <1.5
    #season 2
    #completewith next
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 搜刮 |cRXP_LOOT_被砍下的蝙蝠的头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
step
    #xprate <1.5
    #loop
    .goto Tirisfal Glades,72.15,33.17,0
    .goto Tirisfal Glades,73.78,32.71,50,0
    .goto Tirisfal Glades,72.15,33.17,50,0
    .goto Tirisfal Glades,70.13,34.46,50,0
    .goto Tirisfal Glades,67.29,34.92,50,0
    .goto Tirisfal Glades,66.71,37.87,50,0
    .goto Tirisfal Glades,73.78,32.71,50,0
    >>继续击杀 |cRXP_ENEMY_夜行蝙蝠|r, 搜刮 |cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step << Warrior
    #xprate <1.5
    #season 2
    #loop
    .goto Tirisfal Glades,72.15,33.17,0
    .goto Tirisfal Glades,73.78,32.71,50,0
    .goto Tirisfal Glades,72.15,33.17,50,0
    .goto Tirisfal Glades,70.13,34.46,50,0
    .goto Tirisfal Glades,67.29,34.92,50,0
    .goto Tirisfal Glades,66.71,37.87,50,0
    .goto Tirisfal Glades,73.78,32.71,50,0
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r, 搜刮 |cRXP_LOOT_被砍下的蝙蝠的头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
step
    #xprate <1.5
    .goto Tirisfal Glades,68.19,41.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔|r交谈
    .turnin 366 >>交任务：归还书籍
    .accept 409 >>接任务：证明忠诚
    .target 冈瑟尔·阿坎努斯
step
    #xprate <1.5
    #optional
    #label CandleBeckoning
    #completewith Nefara
    .goto Tirisfal Glades,68.16,42.01
    >>打开地面上的 |cRXP_PICK_蜡烛箱|r, 拾取 |cRXP_LOOT_诱灵蜡烛|r
    .collect 3080,1,409,1 --Collect Candle of Beckoning (1)
    .isOnQuest 409
step
    #xprate <1.5
    #optional
    #requires CandleBeckoning
    #completewith next
    .goto Tirisfal Glades,66.64,44.89
    +点击|cRXP_PICK_莉莉丝的餐桌|r，召唤|cRXP_ENEMY_奈法拉|r
    .isOnQuest 409
step
    #xprate <1.5
    #label Nefara
    .goto Tirisfal Glades,66.70,45.05
    >>击杀 |cRXP_ENEMY_莉莉丝·奈法拉|r
    .complete 409,1 --Lillith Nefara (1)
    .target 莉莉丝·奈法拉
step
    #xprate <1.5
    .goto Tirisfal Glades,68.20,41.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔|r交谈
    .turnin 409 >>交任务：证明忠诚
    .accept 411 >>接任务：巫妖归顺
    .target 冈瑟尔·阿坎努斯
step
    #xprate <1.5
    .xp 11+4900 >> 刷怪至 4900+/8800 经验值
    .isOnQuest 374
    .isOnQuest 375
--XX 220 (369)+840 (371)+390 (360)+90 (355)+160 (407)+875 (492) = 2575
--XX +625 (374 OPT)+700 (375 OPT) = 3900
--XX +625 (374 OPT) = 3200
--XX +700 (375 OPT) = 3275
--XX moved xpgate to after turnin so people don't turn in whilst grinding
step
    #xprate <1.5
    #optional
    .xp 11+5525 >> 刷怪至 5525+/8800 经验值
    .isQuestTurnedIn 374
    .isOnQuest 375
step
    #xprate <1.5
    #optional
    .xp 11+5600 >> 刷怪至 5600+/8800 经验值
    .isOnQuest 374
    .isQuestTurnedIn 375
step
    #xprate <1.5
    #optional
    .xp 11+6225 >> 刷怪至 6225+/8800 经验值
    .isQuestTurnedIn 374
    .isQuestTurnedIn 375
step
    #xprate <1.5
    #hardcore
    #completewith CrusadewarWon
    .subzone 159 >> 返回布瑞尔
    .subzoneskip 159
step
    #xprate <1.5
    #softcore
    #completewith CrusadewarWon
    .goto Tirisfal Glades,64.40,42.65
    .deathskip >> 向西游泳，让怪物杀死你，再在|cRXP_FRIENDLY_灵魂医者|r处复活。
step
    #xprate <1.5
    #label CrusadewarWon
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塞加德|r
    .turnin 372 >>交任务：与血色十字军的战争
    .target 执行官塞加德
step
    #xprate <1.5
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_伯吉斯|r
    .turnin 374 >>交任务：死亡证明
    .target 亡灵卫兵伯吉斯
step
    #xprate <1.5
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买一根|r |T132891:0|t[粗线]|cRXP_BUY_|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .isQuestAvailable 375
step
    #xprate <1.5
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    --XX End of <1.5x section
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_黑暗牧师贝里尔|r交谈
	.train 588 >>学习 |T135926:0|t[心灵之火]
    .target 黑暗牧师贝里尔
    .xp <12,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_凯恩|r 交谈
    .train 145 >> 学习 |T135812:0|t[火球术（等级 3）]
    .target 凯恩·火歌
    .xp <12,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_奥斯蒂尔|r
    .train 7384 >>学习 |T132223:0|t[压制]
    .target 奥斯蒂尔·德·蒙
    .xp <12,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_马里恩|r 交谈
    .train 1766 >> 学习 |T132219:0|t[脚踢]
    .target 马里恩·考尔
    .xp <12,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特|r 交谈
    .train 755 >> 学习 |T136168:0|t[生命通道]
    .target 鲁伯特·鲍什
    .xp <12,1
step << Rogue
    #completewith Entersilverpine
    >>|cRXP_WARN_如果你看到|r |cRXP_FRIENDLY_阿斯托|r|cRXP_WARN_，就与他对话并将其击杀。从他身上拾取信件。他在布瑞尔和瑟伯切尔之间的道路上巡逻。|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan 阿斯托·哈德恩
step
    #xprate >1.49
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_林奈|r
    .turnin 356 >>交任务：巡查后方
    .target 亡灵卫兵林奈
--XX Optional Undercity Section Start: If Priest needs wand, Rogue/Warrior needs vendor wep
step << Priest/Rogue/Warrior
    #optional
    #completewith LesserMagicWand << Priest
    #completewith RogueCutlass << Rogue
    #completewith WarriorClaymore << Warrior
    .goto Tirisfal Glades,61.80,65.06,20 >> 进入幽暗城
    .zoneskip Undercity
step << Priest/Rogue/Warrior
    #optional
    #completewith LesserMagicWand << Priest
    #completewith RogueCutlass << Rogue
    #completewith WarriorClaymore << Warrior
    .goto Undercity,66.09,20.06,35,0
    .goto Undercity,64.37,23.94,35,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >> 乘坐升降梯前往幽暗城
step << Priest
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拍卖师雷克尔|r
    >>|cRXP_BUY_从拍卖行购买一根|r |T135139:0|t[次级魔法杖] |cRXP_BUY_|r
    >>|cRXP_WARN_如果你这样做，而且之前收集了|r |T132889:0|t[亚麻布] |cRXP_WARN_，可以将这些|r |T132889:0|t[亚麻布] |cRXP_WARN_放到拍卖行出售|r
    >>|cRXP_WARN_(可选) 如果你不想或由于资源不足无法完成此步骤, 请跳过|r
    .collect 11287,1,435,1 --Lesser Magic Wand (1)
    .target 拍卖师雷克尔
    .itemStat 18,QUALITY,<7 << Priest/Mage/Warlock
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3 << Priest/Mage/Warlock
--XX Intentional for priests on 1.5x xp to only do this if they don't have a lesser magic wand
step << Rogue
    #ssf
    #optional
    #label RogueCutlass
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_从他那里购买一把|r |T135346:0|t[斗士短剑]|cRXP_BUY_|r
    .collect 851,1,435,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 刘易斯·瓦伦
step << Rogue
    #ah
    #optional
    #label RogueCutlass
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_从他那里购买一把|r |T135346:0|t[斗士短剑]|cRXP_BUY_|r
    >>|cRXP_WARN_或者, 也可以去拍卖行看看有没有更好或更便宜的替代品|r
    .collect 851,1,435,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 刘易斯·瓦伦
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
    #optional
    #label WarriorClaymore
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135350:0|t[优质重剑] |cRXP_BUY_。|r
    .collect 1198,1,435,1 --Collect Claymore (1)
    .money <0.2950
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target 刘易斯·瓦伦
step << Warrior
    #ah
    #optional
    #label WarriorClaymore
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135350:0|t[优质重剑] |cRXP_BUY_。|r
    >>|cRXP_WARN_或者, 也可以去拍卖行看看有没有更好或更便宜的替代品|r
    .collect 1198,1,435,1 --Collect Claymore (1)
    .money <0.2950
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target 刘易斯·瓦伦
step << Warrior
    #optional
    #completewith Entersilverpine
    +|cRXP_WARN_装备|r |T135350:0|t[优质重剑]
    .use 1198
    .itemcount 1198,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << skip --Warrior/Rogue
    #xprate >1.49
    #season 0,1 << Warrior
    #optional
    #label LogoutSkip3
    .goto Undercity,61.10,54.11
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_执行小退跳过: 跳到木桶堆顶部, 然后登出再上线|r
    >>|cRXP_WARN_如果无法完成登出跳过操作, 就正常从幽暗城跑出去|r
    .zoneskip Undercity,1
    .itemcount 7231,<1 << Rogue --Astor's Letter of Introduction (0)
step << Warrior
    #season 2
    #completewith next
    #optional
    .goto 1458,54.383,73.014,50,0
    .goto 1458,52.837,77.725,20,0
    .goto 1458,52.275,79.254,15,0
    .goto 1458,51.279,79.923,15,0
    .goto 1458,49.693,78.903,15,0
    .goto 1458,47.951,76.171,15,0
    .goto Undercity,48.03,70.30,12 >> 前往炼金房寻找|cRXP_FRIENDLY_多拉克|r
    .train 403475,1
step << Warrior
    #season 2
    .goto Undercity,48.03,70.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与幽暗城的|cRXP_FRIENDLY_多拉克·格瑞乌斯|r交谈
    >>交出收集到的 |cRXP_LOOT_头颅|r 换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target 多拉克·格瑞乌斯
    .train 403475,1
    .zoneskip Undercity,1
step << Warrior
    #season 2
    #optional
    .use 204688 >>|cRXP_WARN_使用|r |T134455:0|t[符文碎片] |cRXP_WARN_制作|r |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
    .zoneskip Undercity,1
step << Warrior
    #season 2
    .train 403475 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .use 204703
    .itemcount 204703,1
    .zoneskip Undercity,1
step << skip --Warrior
    #xprate >1.49
    #season 2
    .goto 1458,48.906,70.156
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_执行"小退跳过": 跳到憎恶的肚皮上, 然后小退上线|r
    >>|cRXP_WARN_如果无法完成登出跳过操作, 就正常从幽暗城跑出去|r
    .zoneskip Undercity,1
step << Priest
    #optional
    .goto Undercity,48.98,18.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾萨莱斯特|r 交谈
    .accept 5658 >> 接任务：虚弱之触
    .turnin 5658 >> 交任务：虚弱之触
    .target 艾萨莱斯特
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
    .train 2652,1 --Touch of Weakness not trained
step << Rogue/Warrior/Priest
    #xprate <1.5
    #optional
    .goto Undercity,84.06,17.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比索·埃斯沙德|r交谈
    .turnin 411 >>交任务：巫妖归顺
    .target 比索·埃斯沙德
    .zoneskip Undercity,1
step << skip --Rogue/Warrior
    #xprate <1.5
    #optional
    #label UndercityLS3
    .goto Undercity,84.86,20.34
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_执行登出跳过：站到最下方那段楼梯的最高处，直到角色看起来悬空，然后登出再登录|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >> |cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果无法完成登出跳过操作, 就正常从幽暗城跑出去|r
    .zoneskip Undercity,1
    .itemcount 7231,<1 << Rogue --Astor's Letter of Introduction (0)
--XX Priests only go Undercity if they need to make/buy a Lesser Magic Wand (still midway through the steps of doing so)
--XX If rogues haven't killed Astor yet, they logout skip early before doing Rogue quest turnins
step << Priest
    #optional
    .goto Undercity,70.06,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维克多|r 交谈
    .train 3908 >> 学习 |T136249:0|t[裁缝]
    .target 维克多·瓦德
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    .goto Undercity,70.76,30.67
    >>|cRXP_WARN_将所有|r |T132889:0|t[亚麻布] |cRXP_WARN_制成|r |T132890:0|t[亚麻布卷]
    .collect 2996,30,435,1 --Bolt of Linen Cloth (30)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    .goto Undercity,70.06,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维克多|r 交谈
    .train 7623 >> 学习制作 |T132662:0|t[棕色亚麻长袍]
    .target 维克多·瓦德
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    .goto Undercity,70.57,30.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米利尔·格里高利|r交谈
    >>|cRXP_BUY_从她那里购买|r |T132891:0|t[粗线] |cRXP_BUY_|r
    .collect 2320,30,435,1 --Coarse Thread (30)
    .target 米利尔·格里高利
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    >>|cRXP_WARN_尽可能多地制作|r |T132662:0|t[棕色亚麻长袍] |cRXP_WARN_|r
    .collect 6238,9,435,1 --Brown Linen Robe(9)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    .goto Undercity,62.47,61.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉文尼亚|r 交谈
    .train 7411 >> 学习 |T136244:0|t[附魔]
    .target 拉文尼亚·克洛文
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    .goto Undercity,62.35,60.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_萨德乌斯|r 对话|cRXP_BUY_从他那里购买|r |T133942:0|t[铜棒] |cRXP_BUY_和|r |T135435:0|t[普通木柴] |cRXP_BUY_|r
    >>|cRXP_WARN_分解你制作的所有|r |T132662:0|t[棕色亚麻长袍] |cRXP_WARN_并制作一根|r |T135225:0|t[符文铜棒]
    >>|cRXP_WARN_如果你还没有|r |T132867:0|t[次级魔法精华] |cRXP_WARN_，可以从|r |cRXP_FRIENDLY_萨德乌斯|r |cRXP_WARN_处购买（如果有货的话）。否则稍后再完成这一步|r
    .collect 6218,1,435,1 --Runed Copper Rod (1)
    .collect 4470,1,435,1 --Simple Wood (1)
    .target 萨德乌斯·韦伯
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    .goto Undercity,62.54,60.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛考布|r 交谈
    .train 14293 >> 学习制作 |T135139:0|t[次级魔法杖]
    .target 玛考布·维恩
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    #label LesserMagicWand
    >>|cRXP_WARN_制作一根|r |T135139:0|t[次级魔法杖]
    >>|cRXP_WARN_如果你还没有|r |T132867:0|t[次级魔法精华] |cRXP_WARN_，可以从|r |cRXP_FRIENDLY_萨德乌斯|r |cRXP_WARN_处购买（如果有货的话）。否则稍后再完成这一步|r
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
step << skip --Priest
    #optional
    #label UndercityLS3
    .goto 1458,61.990,62.272
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_执行小退跳过: 跳到木桶堆顶部, 然后登出再上线|r
    >>|cRXP_WARN_如果无法完成登出跳过操作, 就正常从幽暗城跑出去|r
    .zoneskip Undercity,1
step << Rogue
    #optional
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_米奈特|r
    .turnin 1886 >>交任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestComplete 1886
    .zoneskip Undercity,1
step << Rogue
    #optional
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_米奈特|r
    .accept 1898 >>接任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1886
step << Rogue
    #optional
    .goto Undercity,54.84,76.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德隆·甘特|r交谈
    .turnin 1898 >>交任务：亡灵哨兵
    .accept 1899 >>接任务：亡灵哨兵
    .target 安德隆·甘特
    .isQuestTurnedIn 1886
step << Rogue
    #optional
    .goto Undercity,55.43,76.87
    >>搜寻|cRXP_PICK_安德隆的书架|r，拾取其中的物品。书架位于|cRXP_FRIENDLY_安德隆|r身后
    .complete 1899,1 --Andron's Ledger (1)
    .isQuestTurnedIn 1886
step << Rogue
    #optional
    .goto Undercity,83.53,69.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_米奈特|r
    .turnin 1899 >>交任务：亡灵哨兵
    .accept 1978 >>接任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1886
step << Rogue
    #optional
    .goto Undercity,58.86,78.76,40,0
    .goto Undercity,56.20,92.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
    .turnin 1978 >>交任务：亡灵哨兵
    .target 瓦里玛萨斯
    .isQuestTurnedIn 1886
step << skip --Rogue
    #optional
    .goto Undercity,55.22,90.88
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_站在圆圈边缘，直到角色看起来悬空，然后登出再登录，执行登出跳过|r
	.link https://www.youtube.com/watch?v=jj85AXyF1XE >> |cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果无法完成登出跳过操作, 就正常从幽暗城跑出去|r
    .isQuestTurnedIn 1886
    .zoneskip Undercity,1
step << Rogue
    #optional
    #completewith Entersilverpine
    .goto Tirisfal Glades,61.92,64.85
    .zone Tirisfal Glades >> 离开幽暗城
    .zoneskip Tirisfal Glades
    .isQuestTurnedIn 1886
step << Rogue/Warrior/Priest
    #optional
    .goto Undercity,47.25,39.12,50,0
    .goto Undercity,46.35,43.86,10,0
    .goto Undercity,45.24,39.35,10,0
    .goto Undercity,41.32,38.40,10,0
    .goto Undercity,40.74,33.95,10,0
    .goto Undercity,34.80,33.19,15,0
    .goto Undercity,27.39,30.23,35,0
    .goto Undercity,21.89,43.35,35,0
    .goto Tirisfal Glades,51.10,71.53,50,0
    .zone Tirisfal Glades >> 从下水道离开幽暗城
    .zoneskip Tirisfal Glades
    .isQuestAvailable 1978
--XX Optional Undercity Section End: If Priest needs wand, Rogue/Warrior needs vendor wep
step
    #label Entersilverpine
    .goto Tirisfal Glades,53.20,75.82
    .zone Silverpine Forest >> 前往银松森林
    .zoneskip Silverpine Forest
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#xprate <1.99
<< Horde
#version 11
#defaultfor Undead/Troll Rogue/Orc Rogue/Orc Warlock/Troll Mage/Troll Priest
#classic
#tbc
#era/som--h
#name 12-14 Silverpine Forest
#next 12-17 The Barrens
#displayname 12-14 银松森林
step << Undead Warrior
    #season 2
    #sticky
    #optional
    #completewith RuneOfDevastateUndead
    +不要删除|cRXP_LOOT_被砍下的头颅|r，稍后要上交它们以换取 |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .itemcount 204477,1
    .train 403475,1
step << Undead Rogue
    #sticky
    #completewith Rot HideCluesTurnIn
    >>|cRXP_WARN_如果看到|r|cRXP_FRIENDLY_阿斯托|r|cRXP_WARN_，就与他交谈并击杀他，从他身上拾取信件。他会在布瑞尔与瑟伯切尔之间的道路上巡逻|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵哨兵埃兰德|r交谈，开始护送任务
    >>|cRXP_WARN_开始任务前确保状态（血/蓝）已满|r
    .accept 435,1 >>护送埃兰德
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
    >>护送|cRXP_FRIENDLY_埃兰德|r安全抵达|cRXP_FRIENDLY_兰妮·尤瑞克|r身边
    >>|cRXP_ENEMY_座狼|r|cRXP_WARN_可能会重叠刷新，有机会就吃喝恢复|r
    .complete 435,1 --Erland must reach Rane Yorick (1)
    .mob 座狼
step
    .goto Silverpine Forest,53.46,13.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .turnin 435 >>护送埃兰德
    .accept 429 >>荒野之心
    .accept 449 >>亡灵哨兵的报告
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
    #softcore
    #completewith ProveyourWorth
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #hardcore
    #completewith next
    .goto Silverpine Forest,49.77,28.66,50,0
    .goto Silverpine Forest,49.77,33.05,50,0
    .goto Silverpine Forest,49.64,37.84,100,0
    .goto Silverpine Forest,45.51,41.26,100 >> 前往瑟伯切尔
    .subzoneskip 228
step
    #label ProveyourWorth
    .goto Silverpine Forest,44.20,39.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔|r交谈
    .accept 421 >>证明你的价值
    .target 达拉尔·道恩维沃尔
step << !Mage !Priest
    .goto Silverpine Forest,44.05,39.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格乌恩|r交谈
    .vendor >> |cRXP_BUY_从他那里购买|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_。|r
    .collect 4605,20,421,1 --Red-speckled Mushroom (20)
    .target 格乌恩·法隆
    .money <0.05
step
    .goto Silverpine Forest,43.98,39.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾德温|r交谈
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r << Mage/Warlock/Priest/Shaman/Druid
    .vendor >> |cRXP_BUY_如果有货，就向他购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_。|r
    .collect 1179,20,421,1 << Mage/Warlock/Priest/Shaman/Druid --Ice Cold Milk (20)
    .target 艾德温·哈里
    .money <0.05 << Mage/Warlock/Priest/Shaman/Druid
step << Undead
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师奥利斯特|r和|cRXP_FRIENDLY_亡灵卫兵博迪瑞格|r交谈
    .accept 477 >>越境
    .target +暗影牧师奥利斯特
    .goto Silverpine Forest,43.98,40.93
    .accept 6321 >>瑟伯切尔的补给
    .target +亡灵卫兵博迪瑞格
    .goto Silverpine Forest,43.43,41.67
step
    #label BorderCrossings
    .goto Silverpine Forest,43.98,40.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利斯特|r交谈
    .accept 477 >>越境
    .target 暗影牧师奥利斯特
step
    #completewith next
    .goto Silverpine Forest,43.09,41.33,8,0
    .goto Silverpine Forest,42.75,41.30,8,0
    .goto Silverpine Forest,42.76,40.90,8,0
    .goto Silverpine Forest,43.43,40.87,2 >> 进入墓穴
step
    .goto Silverpine Forest,43.43,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与墓穴内的|cRXP_FRIENDLY_高级执行官哈德瑞克|r交谈
    .turnin 449 >>亡灵哨兵的报告
    .accept 3221 >>与伦弗利尔会面
    .accept 437 >>亡者农场
    .target 高级执行官哈德瑞克
step
    .goto Silverpine Forest,42.79,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师伦弗利尔|r交谈
    .turnin 429 >>荒野之心
    .turnin 445 >>给银松森林送信
    .turnin 3221 >>与伦弗利尔会面
    .accept 1359 >>给金格的货物
    .accept 447 >>致命的配方
    .accept 430 >>回到奎恩身旁
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔|r交谈
    .target 达拉尔·道恩维沃尔
    .turnin 421 >>证明你的价值
    .accept 422 >>阿鲁高的愚行
step
    #completewith Remedy
    .goto Silverpine Forest,52.74,27.70,80 >> 前往瓦尔甘农场
step
    #label Remedy
    .goto Silverpine Forest,52.74,27.70,8,0
    .goto Silverpine Forest,53.13,27.92,8,0
    .goto Silverpine Forest,52.94,27.88,8,0
    .goto Silverpine Forest,52.83,28.56
    >>进入房屋并上到二楼。拾取地上的|cRXP_PICK_布满灰尘的法术书|r
    .complete 422,1 --Remedy of Arugal (1)
step
    #completewith next
    .goto Silverpine Forest,53.39,13.32,80,0
    .subzone 239 >>前往伊瓦农场
step
    #label QuinnYorick
    .goto Silverpine Forest,53.39,13.32,8,0
    .goto Silverpine Forest,53.08,13.11,8,0
    .goto Silverpine Forest,53.27,13.16,8,0
    .goto Silverpine Forest,53.43,12.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与房子二楼的|cRXP_FRIENDLY_奎恩·尤瑞克|r交谈
    .turnin 430 >>回到奎恩身旁
    .target 奎恩·尤瑞克
step
    .goto Silverpine Forest,53.46,13.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .accept 425 >>邪恶的伊瓦
    .target 兰妮·尤瑞克
step
    .goto Silverpine Forest,52.01,14.02,6,0
    .goto Silverpine Forest,51.89,13.82,6,0
    .goto Silverpine Forest,51.54,13.91
    >>击杀|cRXP_ENEMY_邪恶的伊瓦|r，获取|cRXP_LOOT_头颅|r
    >>|cRXP_WARN_伊瓦受到谷仓内两名|r|cRXP_ENEMY_鸦爪奴隶|r|cRXP_WARN_的保护。可以趁其中一名向前巡逻时单独把他引开|r
    >>|cRXP_WARN_注意：他们免疫恐惧！|r << Priest/Warlock
    .complete 425,1 --Ivar's Head (1)
    .target 邪恶的伊瓦
    .mob 鸦爪奴隶
step
    .goto Silverpine Forest,53.46,13.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .turnin 425 >>邪恶的伊瓦
    .target 兰妮·尤瑞克
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
    .goto Silverpine Forest,45.44,21.01
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
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯|r|cRXP_WARN_。她会使用吸收伤害并反伤近战攻击者的护盾，以及高伤害的瞬发暗影震击，谨慎应对|r << Mage/Warlock
    .complete 447,2 --Skittering Blood (6)
    .mob 苔藓阔步者
    .unitscan 克雷希斯
    .unitscan 阿鲁高之子
step
    #label KillianVendor
    .goto Silverpine Forest,33.00,17.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基利恩|r交谈
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
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯|r|cRXP_WARN_，她极难击杀！|r << !Mage !Warlock
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯|r|cRXP_WARN_。她会使用吸收伤害并反伤近战攻击者的护盾，以及高伤害的瞬发暗影震击，谨慎应对|r << Mage/Warlock
    .complete 447,2 --Skittering Blood (6)
    .mob 苔藓阔步者
    .unitscan 克雷希斯
step
    #loop
    .goto Silverpine Forest,41.60,21.65,0
    .goto Silverpine Forest,41.37,19.64,50,0
    .goto Silverpine Forest,41.60,21.65,50,0
    .goto Silverpine Forest,42.36,23.77,50,0
    .goto Silverpine Forest,44.67,24.84,50,0
    .goto Silverpine Forest,46.08,26.62,50,0
    >>继续击杀|cRXP_ENEMY_熊|r，拾取|cRXP_LOOT_心脏|r
    .complete 447,1 --Grizzled Bear Heart (6)
    .mob 凶猛的灰斑熊
    .mob 巨型灰斑熊
    .unitscan 维斯迦尔
    .unitscan 阿鲁高之子
step
    #softcore
    #completewith ArugalTurnin
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #hardcore
    #completewith next
    .goto Silverpine Forest,45.51,41.26,100,0
    .subzone 228 >>返回瑟伯切尔
step
    #xprate <1.5
    .goto Silverpine Forest,44.20,39.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔|r交谈
    .turnin 422 >> 阿鲁高的愚行
    .accept 423 >> 阿鲁高的愚行
    .target 达拉尔·道恩维沃尔
step
    #xprate >1.49
    .goto Silverpine Forest,44.20,39.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉尔|r交谈
    .turnin 422 >> 阿鲁高的愚行
    .target 达拉尔·道恩维沃尔
step
    #optional
    #label ArugalTurnin
step
    #completewith next
    .goto Silverpine Forest,43.09,41.33,8,0
    .goto Silverpine Forest,42.75,41.30,8,0
    .goto Silverpine Forest,42.76,40.90,8,0
    .goto Silverpine Forest,43.43,40.87,2 >> 进入墓穴
step
    .goto Silverpine Forest,43.43,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与墓穴内的|cRXP_FRIENDLY_高级执行官哈德瑞克|r交谈
    .turnin 437 >> 亡者农场
    .accept 438 >> 破旧渡口
    .target 高级执行官哈德瑞克
step << !Mage !Priest
    .goto Silverpine Forest,44.05,39.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格乌恩|r交谈
    >>|cRXP_BUY_向她购买|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_|r
    .vendor >> 卖掉杂物
    .collect 4605,20,423,1 --Red-speckled Mushroom (20)
    .target 格乌恩·法隆
step
    .goto Silverpine Forest,43.98,39.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾德温|r交谈
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r << Warlock/Priest/Shaman/Druid
    .vendor >> |cRXP_BUY_如果有货，就向他购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_。|r
    .collect 1179,20,423,1 << Warlock/Priest/Shaman/Druid --Ice Cold Milk (20)
    .target 艾德温·哈里
step << Warlock/Mage/Priest
    .goto Silverpine Forest,44.80,39.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安德利亚|r交谈
    .vendor >> 如果她有货，购买 |T132491:0|t[|cRXP_FRIENDLY_智者腰带|r]
    .target 安德利亚·波恩顿
    .money <0.1400
step << Rogue
    .goto Silverpine Forest,44.61,39.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_亚历山德勒|r交谈
    .vendor >> 如果她有货，购买 |T132539:0|t[|cRXP_FRIENDLY_轻便靴|r]
    .target 亚历山德勒·雷夫瑞
    .money <0.2633
step << Warlock/Mage/Priest
    #optional
    #completewith Conscript
    +|cRXP_WARN_装备|r |T132491:0|t[|cRXP_FRIENDLY_智者腰带|r]
    .use 4786
    .itemcount 4786,1
    .xp <15,1
    .equip 6,4786
step << Rogue
    #optional
    #completewith Conscript
    +|cRXP_WARN_装备|r |T132539:0|t[|cRXP_FRIENDLY_轻便靴|r]
    .use 4788
    .itemcount 4788,1
    .xp <15,1
    .equip 8,4788
step
    #label DecrepitFerry
    .goto Silverpine Forest,58.39,34.79
    >>点击码头边的|cRXP_PICK_小船|r
    .turnin 438 >>破旧渡口
    .accept 439 >>线索
step
    #xprate <1.5
    #loop
    .goto Silverpine Forest,56.06,45.75,0
    .goto Silverpine Forest,56.06,45.75,40,0
    .goto Silverpine Forest,55.45,49.18,40,0
    .goto Silverpine Forest,56.80,45.86,40,0
    >>击杀|cRXP_ENEMY_月怒暴食者|r和|cRXP_ENEMY_月怒魔魂狼人|r，拾取|cRXP_LOOT_镣铐|r
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_月怒魔魂狼人|r|cRXP_WARN_在生命值低于25%时会狂暴。当它们血量较低时，请迅速击杀|r
    .complete 423,1 --Glutton Shackle (6)
    .mob +月怒暴食者
    .complete 423,2 --Darksoul Shackle (3)
    .mob +月怒魔魂狼人
step << Mage
    #season 2
    #completewith RegenerationNote
    >>击杀|cRXP_ENEMY_达拉然学徒|r，拾取掉落的|cRXP_LOOT_|T134939:0|t[|cRXP_FRIENDLY_法术笔记：NIZHGAES（再生）|r]|r
    .train 401767,1
    .collect 208754,1 --Spell Notes: TENGI RONEERA (1)
    .mob 达拉然学徒
step
    #hardcore
    .goto Silverpine Forest,49.89,60.33
    >>点击营地里的|cRXP_PICK_板条箱|r
    >>|cRXP_WARN_小心！这些小怪会施放|r |T135846:0|t[寒冰箭]|cRXP_WARN_并在低生命值时逃离。把它们拉回来，一个一个击杀，直到你能安全地点击箱子为止|r
    .turnin 477 >>越境
    .accept 478 >>地图与符记
    .mob 达拉然学徒
step
    #label BorderCrossings
    #softcore
    .goto Silverpine Forest,49.89,60.33
    >>点击营地里的|cRXP_PICK_板条箱|r
    >>|cRXP_WARN_小心，这些怪会施放|r|T135846:0|t[寒冰箭]|r
    .turnin 477 >>越境
    .accept 478 >>地图与符记
    .mob 达拉然学徒
step << Mage
    #season 2
    #label RegenerationNote
    #loop
    .goto Silverpine Forest,49.89,60.33,0
    .goto Silverpine Forest,52.6,56.6,20,0
    .goto Silverpine Forest,56.6,62.8,20,0
    .goto Silverpine Forest,55.6,72.8,20,0
    .goto Silverpine Forest,51.6,71.0,20,0
    .goto Silverpine Forest,50.8,61.6,20,0
    >>击杀|cRXP_ENEMY_达拉然学徒|r，拾取掉落的|cRXP_LOOT_|T134939:0|t[|cRXP_FRIENDLY_法术笔记：NIZHGAES（再生）|r]|r
    .train 401767,1
    .collect 208754,1 --Spell Notes: TENGI RONEERA (1)
    .mob 达拉然学徒
step << Mage
    #optional
    #completewith Conscript
    #season 2
    .collect 211779,1 >>若已有理解魔符，现在可解读笔记；否则继续路线，稍后在幽暗城向施法材料商购买。
    .train 401767 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：NIZHGAES（再生）|r] |cRXP_WARN_学习|r |T132871:0|t[再生]
    .use 208754
    .itemcount 208754,1
    .train 401767,1
step << Rogue
    #season 2
    .goto Silverpine Forest,45.25,68.06,20,0
    .goto Silverpine Forest,45.26,67.21
    >>拾取影牙城堡入口旁的|cRXP_PICK_生锈的宝箱|r，以获得 |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    >>|cRXP_WARN_使用|r |T132307:0|t[疾跑]|cRXP_WARN_，然后从桥上跳向宝箱|r
    .collect 208772,1 --Rune of Saber Slash (1)
    .train 424984,1
step << Rogue
    #season 2
    .train 424984 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]|cRXP_WARN_学习|r |T132375:0|t[军刀猛刺]
    .use 208772
    .itemcount 208772,1
step
    #completewith next
    #hardcore
    .goto Silverpine Forest,45.51,41.26,100 >> 返回瑟伯切尔
    .subzoneskip 228
step
    #softcore
    #completewith next
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利斯特|r和|cRXP_FRIENDLY_达拉尔|r交谈
    .turnin 478 >>地图与符记
    .accept 481 >>达拉尔的推理
    .target +暗影牧师奥利斯特
    .goto Silverpine Forest,43.98,40.93
    .turnin 423 >>阿鲁高的愚行
    .turnin 481 >>达拉尔的推理
    .accept 482 >>达拉然的意图
    .target +达拉尔·道恩维沃尔
    .goto Silverpine Forest,44.20,39.73
step
    #xprate >1.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利斯特|r和|cRXP_FRIENDLY_达拉尔|r交谈
    .turnin 478 >>地图与符记
    .accept 481 >>达拉尔的推理
    .target +暗影牧师奥利斯特
    .goto Silverpine Forest,43.98,40.93
    .turnin 481 >>达拉尔的推理
    .accept 482 >>达拉然的意图
    .target +达拉尔·道恩维沃尔
    .goto Silverpine Forest,44.20,39.73
step
    .goto Silverpine Forest,43.98,40.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利斯特|r交谈
    .turnin 482 >>达拉然的意图
    .target 暗影牧师奥利斯特
step
    #completewith next
    .goto Silverpine Forest,43.09,41.33,8,0
    .goto Silverpine Forest,42.75,41.30,8,0
    .goto Silverpine Forest,42.76,40.90,8,0
    .goto Silverpine Forest,43.43,40.87,2 >> 进入墓穴
step
    #label Rot HideCluesTurnIn
    .goto Silverpine Forest,43.43,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与墓穴内的|cRXP_FRIENDLY_高级执行官哈德瑞克|r交谈
    .turnin 439 >>线索
    .target 高级执行官哈德瑞克
step
    #xprate <1.5 << Undead
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡洛斯|r交谈
    .turnin 6321 >>瑟伯切尔的补给 << Undead
    .accept 6323 >>飞往幽暗城 << Undead
    .fp Sepulcher >> 开通瑟伯切尔飞行点 << !Undead
    .fly Undercity >> 飞往幽暗城 << !Undead
    .target 卡洛斯·拉佐克
    .zoneskip Undercity
step << Undead
    #xprate >1.49
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡洛斯|r交谈
    .turnin 6321 >>瑟伯切尔的补给
    .accept 6323 >>飞往幽暗城
    .fly Undercity >> 飞往幽暗城
    .target 卡洛斯·拉佐克
    .zoneskip Undercity
step << Undead
    #xprate <1.5
    .hs >> 炉石返回幽暗城
    .use 6948
    .zoneskip Undercity
    .bindlocation 1497,1
    --XX Start of Undercity clown fiesta section
    .cooldown item,6948,>0,1
step << Undead
    #xprate <1.5
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡洛斯·拉佐克|r 交谈
    .fly Undercity >> 飞往幽暗城
    .target 卡洛斯·拉佐克
    .zoneskip Undercity
step << Undead
    .goto Undercity,61.48,41.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高顿|r交谈
    .turnin 6323 >> 飞往幽暗城
    .accept 6322 >> 迈克尔·加勒特
    .target 高顿·温德哈姆
step << Rogue
    #ssf
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135343:0|t[战士阔剑]|cRXP_BUY_。|r
    .collect 2027,1,809,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 刘易斯·瓦伦
step << Rogue
    #ah
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_向他购买一把|r |T135343:0|t[战士阔剑]|cRXP_BUY_。|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的替代品|r
    .collect 2027,1,809,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 刘易斯·瓦伦
step << Rogue
    #optional
    #completewith Conscript
    +|cRXP_WARN_装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
step << Undead
    .goto Undercity,63.27,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈克尔|r交谈
    .turnin 6322 >>迈克尔·加勒特
    .target 迈克尔·加勒特
step << Undead Warrior
    #xprate <1.5
    #optional
    .goto Undercity,47.41,17.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴尔图斯·弗勒|r交谈
    .train 285 >> 学习职业技能
    .target 巴尔图斯·弗勒
    .dungeon RFC
    .xp <16,1
--XX 16+ Only for Heroic Strike, Undead only as other races train elsewhere more effectively. RFC So warriors have 16 spells for RFC
step << Undead Rogue/Undead Warrior
    #xprate <1.5
    .goto Undercity,84.06,17.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比索·埃斯沙德|r交谈
    .turnin 411 >>巫妖归顺
    .target 比索·埃斯沙德
    .isQuestComplete 411
step << Rogue/Warrior
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛丽|r交谈，她位于盗贼区
    .train 3273 >>学习 |T135966:0|t[急救]
    .target 玛丽·艾塔斯
step << Rogue/Warrior
    #optional
    .goto Undercity,73.19,55.17
    .skill firstaid,40 >> 制作 |T133685:0|t[亚麻绷带]，直到急救技能达到40或以上
    .itemcount 2589,1 --Linen Cloth (1+)
step << Rogue/Warrior
    #optional
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛丽|r交谈，她位于盗贼区
    .train 3276 >> 学习 |T133688:0|t[厚亚麻绷带]
    .target 玛丽·艾塔斯
    .skill firstaid,<40,1
step << Rogue/Warrior
    #optional
    .goto Undercity,73.19,55.17
    .skill firstaid,50 >> 制作 |T133688:0|t[厚亚麻绷带]，直到急救技能达到50或以上。
    .itemcount 2589,2 --Linen Cloth (2+)
step << Rogue/Warrior
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛丽|r交谈，她位于盗贼区
    .train 3274 >> 学习中级急救
    .target 玛丽·艾塔斯
    .skill firstaid,<50,1
step << Undead Rogue
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特|r交谈
    .turnin 1886 >>亡灵哨兵
    .accept 1898 >>亡灵哨兵
    .target 米奈特·卡加德
    .isQuestComplete 1886
step << Undead Rogue
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特|r交谈
    .accept 1898 >>亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1886
step << Undead Rogue
    #optional
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡罗琳|r交谈
    .train 1758 >> 学习职业技能
    .target 卡罗琳·瓦德
    .xp <14,1
    .xp >16,1
    .isOnQuest 1898 << Undead
--XX Only train if you were directed here for class quest as an Undead
step << Undead Rogue
    #optional
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡罗琳|r交谈
    .train 6761 >> 学习职业技能
    .target 卡罗琳·瓦德
    .xp <16,1
    .isOnQuest 1898 << Undead
step << Undead Rogue
    #xprate <1.5
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡罗琳|r交谈
    .train 1758 >> 学习职业技能
    .target 卡罗琳·瓦德
    .xp <14,1
    .xp >16,1
    .dungeon RFC
--XX Force train if hs not in Brill as an undead ONLY + you want to do RFC. Optional left out on purpose
--XX This whole section of training across 3 different areas, 2 different xp rates and RFC is solidly in the top 10 worst experiences of my life and im still not 100% happy with it xd
step << Undead Rogue
    #optional
    #xprate <1.5
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡罗琳|r交谈
    .train 6761 >> 学习职业技能
    .target 卡罗琳·瓦德
    .xp <16,1
    .dungeon RFC
step << Undead Rogue
    .goto Undercity,54.84,76.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德隆·甘特|r交谈
    .turnin 1898 >>亡灵哨兵
    .accept 1899 >>亡灵哨兵
    .target 安德隆·甘特
    .isQuestTurnedIn 1886
step << Undead Rogue
    .goto Undercity,55.43,76.87
    >>搜寻|cRXP_PICK_安德隆的书架|r，拾取其中的物品。书架位于|cRXP_FRIENDLY_安德隆|r身后
    .complete 1899,1 --Andron's Ledger (1)
    .isQuestTurnedIn 1886
step
    #completewith next
    #optional
    .goto 1458,54.383,73.014,50,0 << !Undead/!Rogue
    .goto 1458,52.837,77.725,20,0
    .goto 1458,52.275,79.254,15,0
    .goto 1458,51.279,79.923,15,0
    .goto 1458,49.693,78.903,15,0
    .goto 1458,47.951,76.171,15,0
    .goto Undercity,48.84,69.25,12 >> 前往炼金房寻找|cRXP_FRIENDLY_大药剂师法拉尼尔|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_法拉尼尔|r和|cRXP_FRIENDLY_金格|r交谈，他们位于炼金房
    .turnin 447 >>致命的配方
    .target +大药剂师法拉尼尔
    .goto Undercity,48.84,69.25
    .turnin 1359 >> 给金格的货物
    .accept 1358 >> 给赫布瑞姆的样本
    .target +药剂师金格
    .goto Undercity,50.16,67.97
step << Undead Warrior
    #season 2
    #label RuneOfDevastateUndead
    .goto Undercity,48.03,70.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与幽暗城的|cRXP_FRIENDLY_多拉克·格瑞乌斯|r交谈
    >>交出收集到的|cRXP_LOOT_头颅|r换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target 多拉克·格瑞乌斯
    .train 403475,1
step << Undead Warrior
    #season 2
    .use 204688 >>|cRXP_WARN_使用|r |T134455:0|t[符文碎片]|cRXP_WARN_制作|r |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step << Undead Warrior
    #season 2
    .train 403475 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .use 204703
    .itemcount 204703,1
step << skip --Undead Rogue/Undead Warrior
    #xprate <1.5
    #optional
    .goto 1458,48.906,70.156
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_跳到憎恶的腹部上方，登出后重新登录，即可完成登出跳过|r
    >>|cRXP_WARN_如果无法完成登出跳过操作，就正常从幽暗城跑出去|r
    .zoneskip Undercity,1
    .isQuestTurnedIn 1886 << Rogue
step << Undead Rogue
    .goto Undercity,83.53,69.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特|r交谈
    .turnin 1899 >>亡灵哨兵
    .accept 1978 >>亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1886
step << Undead Rogue
    #xprate <1.5
    #optional
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡罗琳|r交谈
    .train 1758 >> 学习职业技能
    .target 卡罗琳·瓦德
    .xp <14,1
    .xp >16,1
    .dungeon RFC
--XX Force train if hs not in Brill as an undead ONLY + you want to do RFC. Duplicate if you ding from prev optional quests
step << Undead Rogue
    #xprate <1.5
    #optional
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡罗琳|r交谈
    .train 6761 >> 学习职业技能
    .target 卡罗琳·瓦德
    .xp <16,1
    .dungeon RFC
step << Undead Rogue
    .goto Undercity,58.86,78.76,40,0
    .goto Undercity,56.20,92.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
    .turnin 1978 >>亡灵哨兵
    .target 瓦里玛萨斯
    .isQuestTurnedIn 1886
step << skip --Undead Rogue
    #xprate <1.5
    #optional
    .goto Undercity,55.22,90.88
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_站在圆圈边缘，直到角色看起来悬空，然后登出再登录，执行登出跳过|r
	.link https://www.youtube.com/watch?v=jj85AXyF1XE >> |cRXP_WARN_点击此处观看示范|r
    >>|cRXP_WARN_如果无法完成登出跳过操作，就正常从幽暗城跑出去|r
    .zoneskip Undercity,1
    .isQuestTurnedIn 1886
step << !Rogue !Warrior
    #optional
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛丽|r交谈，她位于盗贼区
    .train 3273 >>学习 |T135966:0|t[急救]
    .target 玛丽·艾塔斯
step << !Rogue !Warrior
    #optional
    .goto Undercity,73.19,55.17
    .skill firstaid,40 >> 制作 |T133685:0|t[亚麻绷带]，直到急救技能达到40或以上
    .itemcount 2589,1 --Linen Cloth (1+)
step << !Rogue !Warrior
    #optional
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛丽|r交谈，她位于盗贼区
    .train 3276 >> 学习 |T133688:0|t[厚亚麻绷带]
    .target 玛丽·艾塔斯
    .skill firstaid,<40,1
step << !Rogue !Warrior
    #optional
    .goto Undercity,73.19,55.17
    .skill firstaid,50 >> 制作 |T133688:0|t[厚亚麻绷带]，直到急救技能达到50或以上。
    .itemcount 2589,2 --Linen Cloth (2+)
step << !Rogue !Warrior
    #optional
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛丽|r交谈，她位于盗贼区
    .train 3274 >> 学习中级急救
    .target 玛丽·艾塔斯
    .skill firstaid,<50,1
step << Undead !Rogue !Warrior
    #xprate <1.5
    .goto Undercity,84.06,17.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比索·埃斯沙德|r交谈
    .turnin 411 >>巫妖归顺
    .target 比索·埃斯沙德
    .isQuestComplete 411
step << Undead Mage
    #xprate >1.49
    .goto Undercity,85.12,10.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .turnin 1882 >>巴尼尔农场
    .train 2137 >> 学习职业技能
    .target 安娜斯塔西娅·哈特威尔
    .xp <14,1
    .xp >16,1
step << Undead Mage
    #xprate >1.49
    #optional
    .goto Undercity,85.14,10.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .turnin 1882 >>巴尼尔农场
    .train 2120 >> 学习职业技能
    .target 安娜斯塔西娅·哈特威尔
    .xp <16,1
step << Undead Mage
    #xprate >1.49
    .goto Undercity,85.12,10.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安娜斯塔西娅·哈特威尔|r 交谈
    .turnin 1882 >> 交任务：巴尼尔农场
    .target 安娜斯塔西娅·哈特威尔
    .isQuestComplete 1882
step << Mage
    #xprate <1.5 << Undead
    .goto Undercity,85.14,10.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .train 2137 >> 学习职业技能
    .target 安娜斯塔西娅·哈特威尔
    .xp <14,1
    .xp >16,1
--XX no dungeon RFC due to close proximity
step << Mage
    #xprate <1.5 << Undead
    #optional
    .goto Undercity,85.14,10.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .train 2120 >> 学习职业技能
    .target 安娜斯塔西娅·哈特威尔
    .xp <16,1
step << Mage
    #season 2
    #optional
    .goto Undercity,69.40,39.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托马斯·莫丹|r 交谈，购买一个 |T135933:0|t[理解魔符]
    .collect 211779,1
    .train 401767 >> 使用 [法术笔记：NIZHGAES] 学习 [再生]
    .use 208754
    .target 托马斯·莫丹
    .itemcount 208754,1
    .train 401767,1
    .money <0.075
step << Undead Warlock
    #xprate <1.5
    .goto Undercity,88.93,15.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_理查德|r交谈
    .train 6222 >> 学习职业技能
    .target 理查德·科尔文
    .xp <14,1
    .xp >16,1
--XX no dungeon RFC due to close proximity
step << Undead Warlock
    #xprate <1.5
    #optional
    .goto Undercity,88.93,15.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_理查德|r交谈
    .train 1455 >> 学习职业技能
    .target 理查德·科尔文
    .xp <16,1
step << Priest/Mage/Warlock
    #ssf
    .goto Undercity,69.54,26.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_赞恩·布拉德弗|r交谈
    >>|cRXP_BUY_向他购买一根|r |T135468:0|t[烟尘魔杖] |cRXP_BUY_|r
    .collect 5208,1 --Smoldering Wand (1)
    .money <0.3515
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
	.target 赞恩·布拉德弗
step << Priest/Mage/Warlock
    #ah
    .goto Undercity,69.54,26.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_赞恩·布拉德弗|r交谈
    >>|cRXP_BUY_向他购买一根|r |T135468:0|t[烟尘魔杖] |cRXP_BUY_|r
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
step << Undead Priest
    #xprate <1.5
    #sticky
    #label TouchOW
    .goto Undercity,48.98,18.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r 对话
    .accept 5658 >> 接任务：虚弱之触
    .turnin 5658 >> 虚弱之触
    .target 艾萨莱斯特
    .train 2652,1 --Touch of Weakness not trained
    .dungeon RFC
step << !Undead Priest
    #xprate <1.5
    #sticky
    #label TouchOW
    .goto Undercity,48.98,18.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r 对话
    .turnin 5660 >> 虚弱之触
    .target 艾萨莱斯特
    .train 2652,1 --Touch of Weakness not trained
    .dungeon RFC
    .isOnQuest 5660
--XX Not going out of the way for this outside of this edge case to train for RFC, waste of a gcd
step << Undead Priest
    #xprate <1.5
    .goto Undercity,47.56,18.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉扎鲁斯|r交谈
	.train 6074 >> 学习职业技能
    .target 拉扎鲁斯神父
    .xp <14,1
    .xp >16,1
    .dungeon RFC
step << Undead Priest
    #xprate <1.5
    #optional
    .goto Undercity,47.56,18.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉扎鲁斯|r交谈
	.train 8102 >> 学习职业技能
    .target 拉扎鲁斯神父
    .xp <16,1
    .dungeon RFC
step << Undead Rogue
    #optional
    #completewith Conscript
    >>放弃亡灵哨兵任务，之后已没有完成它的机会
    .abandon 1886 >> 亡灵哨兵
    .isOnQuest 1886
step << skip --Undead !Rogue !Warrior
    #xprate <1.5
    #requires TouchOW << Undead Priest
    .goto Undercity,56.89,16.77 << Priest
    .goto Undercity,69.46,25.85 << Mage/Warlock
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_跳到绞肉车的绞肉机顶部，然后登出并重新登录，以完成登出跳过|r << Priest
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_执行小退跳过：跳到木桶堆顶部，然后登出再上线|r << Mage/Warlock
    >>|cRXP_WARN_如果无法完成登出跳过操作，就正常从幽暗城跑出去|r
    .zoneskip Undercity,1
    .dungeon RFC
step << skip --Undead !Rogue !Warrior
    #xprate <1.5
    .goto Undercity,69.46,25.85 << Priest/Mage/Warlock
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_执行小退跳过：跳到木桶堆顶部，然后登出再上线|r << Priest/Mage/Warlock
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >> |cRXP_WARN_点击此处观看示范|r
    >>|cRXP_WARN_如果无法完成登出跳过操作，就正常从幽暗城跑出去|r
    .zoneskip Undercity,1
    .dungeon !RFC
--XX End of Undercity clown fiesta section
--XX Start of 1.5x Brill Train section
step << Undead
    #xprate >1.49
    #completewith ZeptoDurotar
    .hs >> 炉石回布瑞尔
    .zoneskip Undercity,1
    .bindlocation 2119,1
    .cooldown item,6948,>0,1
step << Undead !Mage
    #xprate >1.49
    #completewith ZeptoDurotar
    .goto Tirisfal Glades,61.92,64.85,50,0
    .subzone 159 >> 返回布瑞尔学习职业技能
    .subzoneskip 159
step << Undead Rogue
    #xprate >1.49
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_马里恩·考尔|r交谈
    .train 1758 >> 学习职业技能
    .target 马里恩·考尔
    .xp <14,1
    .xp >16,1
step << Undead Rogue
    #xprate >1.49
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_马里恩·考尔|r交谈
    .train 6761 >> 学习职业技能
    .target 马里恩·考尔
    .xp <16,1
step << Undead Priest
    #xprate >1.49
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
	.train 8122 >>学习职业技能
    .target 黑暗牧师贝里尔
    .xp <14,1
    .xp >16,1
step << Undead Priest
    #xprate >1.49
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
	.train 8102 >>学习职业技能
    .target 黑暗牧师贝里尔
    .xp <16,1
step << skip --Undead Mage
    #xprate >1.49
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .train 1460 >>学习职业技能
    .target 凯恩·火歌
    .xp <14,1
    .xp >16,1
step << skip --Undead Mage
    #xprate >1.49
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .train 2120 >>学习职业技能
    .target 凯恩·火歌
    .xp <16,1
step << Undead Warrior
    #xprate >1.49
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 285 >>学习职业技能
    .target 奥斯蒂尔·德·蒙
    .xp <16,1
step << Undead Warlock
    #xprate >1.49
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特·鲍什|r 对话
    .train 6222 >> 学习职业技能
    .target 鲁伯特·鲍什
    .xp <14,1
    .xp >16,1
step << Undead Warlock
    #xprate >1.49
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特·鲍什|r 对话
    .train 1455 >> 学习职业技能
    .target 鲁伯特·鲍什
    .xp <16,1
--XX End of 1.5x Brill Train section
step << Undead
    #sticky
    #completewith EnterRFC
    .subzone 2437 >> 现在开始寻找怒焰裂谷队伍
    .dungeon RFC
step << Undead
    #completewith next
    .goto Tirisfal Glades,61.92,64.85,50,0
    .zone Tirisfal Glades >> 离开幽暗城
    .zoneskip Tirisfal Glades
step << Undead
    #label ZeptoDurotar
    .goto Tirisfal Glades,60.96,58.63,12,0
    .goto Tirisfal Glades,61.51,59.01,10,0
    .goto Tirisfal Glades,61.27,59.22,8,0
    .goto Tirisfal Glades,61.13,58.84,8,0
    .goto Tirisfal Glades,61.38,58.71,8,0
    .goto Tirisfal Glades,61.34,59.17,8,0
    .goto Tirisfal Glades,60.51,58.69,-1
    .goto Tirisfal Glades,60.94,46.35,-1
    .zone Durotar >>乘坐飞艇前往杜隆塔尔
    >>在等待时制作磨刀石/绷带 << Warrior/Rogue
    >>在等待时施放造食术/造水术 << Mage
    .zoneskip Durotar
step << Undead
    #completewith HiddenEnemiesPickup
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 前往奥格瑞玛
    .dungeon RFC
step << Undead
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_多拉斯|r
    >>|cRXP_WARN_不要飞往任何地方！|r
    .fp Orgrimmar >> 开通奥格瑞玛飞行点
    .target 多拉斯
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .accept 5726 >>隐藏的敌人
    .target 萨尔
    .dungeon RFC
step << Undead
    .goto Durotar,53.08,9.19,0
    >>在骷髅石击杀|cRXP_ENEMY_火刃氏族|r的怪物，直到掉落|cRXP_LOOT_军官的徽章|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 5726 >> 隐藏的敌人
    .accept 5727 >> 隐藏的敌人
    .target 萨尔
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .accept 5761 >>饥饿者塔拉加曼
    .target 尼尔鲁·火刃
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .complete 5727,1 --Gauge Neeru Fireblade's reaction to you being a member of the Burning Blade
    .skipgossip
    .target 尼尔鲁·火刃
    .dungeon RFC
step << Undead
    #label HiddenEnemiesPickup
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 5727 >> 隐藏的敌人
    .accept 5728 >> 隐藏的敌人
    .target 萨尔
    .dungeon RFC
step << Undead
    #completewith EnterRFC
    .destroy 14544 >>|cRXP_WARN_销毁|r |T134417:0|t[军官的徽章]|cRXP_WARN_因为你不再需要它|r
    .dungeon RFC
step << Undead
    #label EnterRFC
    .goto Orgrimmar,52.77,48.97
    .subzone 2437 >> 进入怒焰裂谷副本传送门
    .dungeon RFC
step << Undead
    >>|cRXP_WARN_如果可以，请让队友分享以下任务|r
    .accept 5722 >> 寻找背包
    .accept 5723 >> 试探敌人
    .disablecheckbox
    .dungeon RFC
step << Undead
    #completewith next
    >>击杀|cRXP_ENEMY_怒焰穴居人|r和|cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +怒焰穴居人
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +怒焰萨满祭司
    .isOnQuest 5723
    .dungeon RFC
step << Undead
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔·恐怖图腾|r交谈
    .turnin 5722 >> 寻找背包
    .accept 5724 >> 归还背包
    .target 玛尔·恐怖图腾
    .isOnQuest 5722
    .dungeon RFC
step << Undead
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔·恐怖图腾|r交谈
    .accept 5724 >> 归还背包
    .target 玛尔·恐怖图腾
    .isQuestTurnedIn 5722
    .dungeon RFC
step << Undead
    #label TroggsShamans
    >>击杀|cRXP_ENEMY_怒焰穴居人|r和|cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +怒焰穴居人
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +怒焰萨满祭司
    .isOnQuest 5723
    .dungeon RFC
step << Undead
    #requires TroggsShamans
    #completewith BazzalanandJergosh
    >>击杀|cRXP_ENEMY_燃刃信徒|r和|cRXP_ENEMY_燃刃术士|r，拾取|cRXP_LOOT_暗影法术研究|r和|cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob 燃刃信徒
    .mob 燃刃术士
    .isOnQuest 5725
    .dungeon RFC
step << Undead
    >>击杀|cRXP_ENEMY_饥饿者塔拉加曼|r，拾取|cRXP_LOOT_心脏|r
    .complete 5761,1 -- Taragaman the Hungerer's Heart
    .mob 饥饿者塔拉加曼
    .isOnQuest 5761
    .dungeon RFC
step << Undead
    #label BazzalanandJergosh
    >>击杀|cRXP_ENEMY_巴扎兰|r和|cRXP_ENEMY_祈求者耶戈什|r
    .complete 5728,1 --Bazzalan (1)
    .mob +巴扎兰
    .complete 5728,2 --Jergosh the Invoker (1)
    .mob +祈求者耶戈什
    .isOnQuest 5728
    .dungeon RFC
step << Undead
    >>击杀|cRXP_ENEMY_燃刃信徒|r和|cRXP_ENEMY_燃刃术士|r，拾取|cRXP_LOOT_暗影法术研究|r和|cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob 燃刃信徒
    .mob 燃刃术士
    .isOnQuest 5725
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 5761 >>饥饿者塔拉加曼
    .target 尼尔鲁·火刃
    .isQuestComplete 5761
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 5728 >> 隐藏的敌人
    .accept 5729 >> 隐藏的敌人
    .target 萨尔
    .isQuestComplete 5728
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .accept 5729 >> 隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5728
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 5729 >> 隐藏的敌人
    .accept 5730 >> 隐藏的敌人
    .target 尼尔鲁·火刃
    .dungeon RFC
    .isQuestTurnedIn 5728
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 5730 >> 隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5728
    .dungeon RFC
step << Undead
    #completewith Conscript
    .subzone 362 >> 前往 [剃刀岭]
step << !Undead
    .hs >> 炉石回剃刀岭
    .use 6948
    .subzoneskip 362
    .bindlocation 362,1
step << Rogue
    #optional << Undead
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡普拉克|r 交谈
    .train 1758 >> 学习职业技能
    .target 卡普拉克
    .xp <14,1
    .xp >16,1
step << Rogue
    #optional << Undead
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡普拉克|r 交谈
    .train 6761 >> 学习职业技能
    .target 卡普拉克
    .xp <16,1
step << Priest
    #optional << Undead
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
	.train 8122 >>学习职业技能
    .target 泰金
    .xp <14,1
    .xp >16,1
step << Priest
    #optional << Undead
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
	.train 8102 >>学习职业技能
    .target 泰金
    .xp <16,1
step << Warrior
    #optional << Undead
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 285 >>学习职业技能
    .target 塔绍尔·锯痕
    .xp <16,1
step << Warlock
    #optional << Undead
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜格鲁·血怒|r交谈
    .train 6222 >> 学习职业技能
    .target 杜格鲁·血怒
    .xp <14,1
    .xp >16,1
step << Warlock
    #optional << Undead
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜格鲁·血怒|r交谈
    .train 1455 >> 学习职业技能
    .target 杜格鲁·血怒
    .xp <16,1
step << !Undead
    #xprate >1.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥戈尼尔|r和|cRXP_FRIENDLY_加索克|r交谈
    .turnin 806 >>黑暗风暴
    .goto Durotar,52.24,43.15
    .turnin 837 >>野猪人的进犯
    .goto Durotar,51.95,43.50
    .target 奥戈尼尔·魂痕
    .target 加索克
step
    #label Conscript
    .goto Durotar,50.8,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林|r交谈
    .accept 840 >>部落的新兵
    .target 塔克林·寻路者
step
    #completewith next
    .subzone 379 >> 前往 [前沿哨所]
step
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加尔·战痕|r交谈
    .turnin 840 >>部落的新兵
    .accept 842 >>十字路口征兵
    .target 卡加尔·战痕
step << !Undead
    #xprate <1.5
    .goto The Barrens,62.34,20.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅克塞罗斯|r交谈
    .turnin 809 >>雅克塞罗斯
    .accept 924 >>恶魔之种
    .target 雅克塞罗斯
    .isQuestTurnedIn 829
step << !Undead
    .goto The Barrens,62.34,20.03
    >>|cRXP_WARN_拾取|r |T134095:0|t[有瑕疵的能量石]|cRXP_WARN_它就在|r|cRXP_FRIENDLY_雅克塞罗斯|r|cRXP_WARN_旁边。该物品有30分钟计时限制，请尽快完成后续步骤|r
    .turnin 926 >>有瑕疵的能量石
    .isOnQuest 924
step << Mage
    +若计划通过 AoE 升级，请手动选择贫瘠之地 AoE 指南，否则完成此步骤
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
#defaultfor Undead
#name 1-7 Tirisfal Glades
#next 7-13 Tirisfal Glades
#displayname 1-7 提瑞斯法林地
step << !Undead
    #completewith next
    +|cRXP_WARN_你选择的是亡灵专用指南，建议选择你出生地对应的新手区域|r
step << !Undead Mage
    #season 2
    #completewith next
    +探索赛季的法师应在本种族的新手区域开始升级，否则无法在此获得第一个符文（|T133816:0|t[铭刻手套 - 冰枪术]）
step
    #completewith Zombies
	.destroy 6948 >> 摧毁背包中的 |T134414:0|t[炉石]，已经不需要它了。
step
    #completewith next
    .goto Tirisfal Glades,30.04,72.78,8,0
    .goto Tirisfal Glades,30.27,72.78,8,0
    .goto Tirisfal Glades,30.22,71.65,10 >> 从墓穴里跑出来, 朝着 |cRXP_FRIENDLY_摩尔多|r 跑去
step
    .goto Tirisfal Glades,30.22,71.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩尔多|r交谈
    .accept 363 >> 接任务：突然醒来
    .target 送葬者摩尔多
step << Warrior/Warlock/Priest/Mage
    #xprate <2.1
    #completewith Vendor
    .goto Tirisfal Glades,30.70,69.28,0 << Warrior/Warlock
    .goto Tirisfal Glades,29.92,70.30,40,0
    .goto Tirisfal Glades,30.70,69.28,40,0
    .goto Tirisfal Glades,29.18,68.94,40,0 << Priest/Mage
    .goto Tirisfal Glades,29.10,67.66,40,0 << Priest/Mage
    .goto Tirisfal Glades,30.19,65.32,40,0 << Priest/Mage
    +|cRXP_WARN_击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_夜行蝙蝠|r 并拾取物品，直到可出售的物品（包括身上的护甲）总价值达到60铜币|r << Mage
    +|cRXP_WARN_击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_夜行蝙蝠|r 并拾取物品，直到可出售的物品（包括身上的护甲）总价值达到50铜币|r << Priest
    +|cRXP_WARN_击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_夜行蝙蝠|r 并拾取物品，直到可出售的物品（包括身上的护甲）总价值达到10铜币|r << Warrior/Warlock
    .mob 食腐狼幼崽
    .mob 夜行蝙蝠
    .money >0.006 << Mage
    .money >0.005 << Priest
    .money >0.001 << Warrior/Warlock
step << Warrior/Warlock/Priest/Mage
    #season 0,1
    #xprate >2.09
    #completewith Vendor
    +|cRXP_WARN_击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_夜行蝙蝠|r 并拾取物品，直到可出售的物品（包括身上的护甲）总价值达到60铜币|r << Mage
    +|cRXP_WARN_击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_夜行蝙蝠|r 并拾取物品，直到可出售的物品（包括身上的护甲）总价值达到50铜币|r << Priest
    +|cRXP_WARN_击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_夜行蝙蝠|r 并拾取物品，直到可出售的物品（包括身上的护甲）总价值达到10铜币|r << Warrior/Warlock
    .mob 食腐狼幼崽
    .mob 夜行蝙蝠
    .money >0.006 << Mage
    .money >0.005 << Priest
    .money >0.001 << Warrior/Warlock
step
    #season 2
    #xprate >2.09
    #completewith Vendor
    +|cRXP_WARN_击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_夜行蝙蝠|r 并拾取物品，直到可出售的物品（包括身上的护甲）总价值达到28铜币|r << Rogue/Priest/Warlock
    +|cRXP_WARN_击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_夜行蝙蝠|r 并拾取物品，直到可出售的物品（包括身上的护甲）总价值达到15铜币|r << Warrior/Mage
    .mob 食腐狼幼崽
    .mob 夜行蝙蝠
    .money >0.0028 << Rogue/Priest/Warlock
    .money >0.0015 << Warrior/Mage
step
    #xprate >2.09
    #loop
    .goto Tirisfal Glades,29.18,68.94,40,0,0
    .goto Tirisfal Glades,29.92,70.30,40,0
    .goto Tirisfal Glades,30.70,69.28,40,0
    .goto Tirisfal Glades,29.18,68.94,40,0
    .goto Tirisfal Glades,29.10,67.66,40,0
    .goto Tirisfal Glades,30.19,65.32,40,0
    .xp 2 >>刷怪升到2级
    .mob 食腐狼幼崽
    .mob 夜行蝙蝠
step << Rogue
    #season 2
    #xprate <2.1
    .goto Tirisfal Glades,30.70,69.28
    .xp 2 >> 击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_夜行蝙蝠|r，升到2级
    >>拾取掉落物，尽量攒够价值28铜币的杂物，用于购买符文和后续装备
    .mob 食腐狼幼崽
    .mob 夜行蝙蝠
step
    #season 2
    .goto Tirisfal Glades,31.36,66.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_符文贩子|r 交谈
    >>|cRXP_WARN_千万不要出售可以装备的物品|r
    >>|cRXP_BUY_出售杂物，并购买|r |T134419:0|t[|cRXP_FRIENDLY_乘胜追击符文|r] |cRXP_BUY_和|r |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r] << Warrior
    >>|cRXP_BUY_出售杂物，并购买所有关键的范围伤害符文|r << Mage
    >>|cRXP_BUY_出售杂物，并购买以下全部符文：|r << Hunter/Warlock/Rogue/Priest
    .collect 204806,1 << Warrior --Rune of Victory Rush
    .collect 204716,1 << Warrior --Rune of Frenzied Assault
    .collect 208799,1 << Mage --Spell Notes: Living Bomb
    .collect 203746,1 << Mage --Spell Notes: Living Flame
    .collect 203748,1 << Mage --Spell Notes: Burnout
    .collect 225690,1 << Mage --Spell Notes: Frozen Orb
    .collect 203745,1 << Mage --Spell Notes: Ice Lance
    .collect 209852,1 << Hunter --Rune of Kill Command
    .collect 226401,1 << Hunter --Treatise on the Heart of the Lion
    .collect 216770,1 << Hunter --Treatise on Aspect of the Viper
    .collect 206168,1 << Hunter --Rune of the Chimera
    .collect 210818,1 << Hunter --Rune of Lone Wolf
    .collect 213124,1 << Hunter --Rune of Close Combat
    .collect 226252,1 << Hunter --Rune of the Guerrilla
    .collect 205215,1 << Warlock --Rune of Tactics
    .collect 210824,1 << Warlock --Rune of the Pact
    .collect 211477,1 << Warlock --Rune of Incinerate
    .collect 205230,1 << Warlock --Rune of Haunting
    .collect 228797,1 << Warlock --Grimoire of Fel Armor
    .collect 210979,1 << Rogue --Rune of Shadowstep
    .collect 221428,1 << Rogue --Rune of Foul Play
    .collect 204795,1 << Rogue --Rune of Shadowstrike
    .collect 208772,1 << Rogue --Rune of Saber Slash
    .collect 227922,1 << Rogue --Rune of the Swashbuckler
    .collect 212552,1 << Priest --Psychosophic Epiphany
    .collect 205940,1 << Priest --Memory of a Dark Purpose
    .collect 205951,1 << Priest --Memory of a Troubled Acolyte
    .collect 205932,1 << Priest --Prophecy of a King's Demise
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel
    >>冰枪术的作用只是让你之后能够交任务 << Mage
    >>|cRXP_WARN_你稍后会获得其余符文|r
    .target 符文贩子
    .skipgossip
step
    #season 2
    .train 403470 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_乘胜追击符文|r] 学习 |T132342:0|t[乘胜追击]<< Warrior
    .train 415936 >> 使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:活动炸弹|r] 学习 |T236220:0|t[活动炸弹] << Mage
    .train 401759 >> 使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:燃尽|r] 学习 |T236207:0|t[燃尽] << Mage
    .train 440858 >> 使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:寒冰宝珠|r] 学习 |T135851:0|t[寒冰宝珠] << Mage
    .train 401760 >> 使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:冰枪术|r] 学习 |T135844:0|t[冰枪术] << Mage
    .train 401768 >> 使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：活体烈焰|r] 学习 |T135820:0|t[活体烈焰] << Mage
    .train 416009 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_战术符文|r] 学习 |T136150:0|t[恶魔战术] << Warlock
    .train 425476 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_契约符文|r] 学习 |T237562:0|t[恶魔契约] << Warlock
    .train 416015 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_烧尽符文|r] 学习 |T135789:0|t[烧尽] << Warlock
    .train 403919 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_鬼影缠身符文|r] 学习 |T236298:0|t[鬼影缠身] << Warlock
    .train 403619 >> 使用 |T133733:0|t[魔典：邪甲术] 学习 |T136156:0|t[邪甲术] |cRXP_WARN_将其设为主要护甲法术|r << Warlock
    .train 402852 >> 使用 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] 学习 |T237570:0|t[裂魂魔] << Priest
    .train 425447 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r] 学习 |T236317:0|t[狂乱攻击] << Warrior
    .train 400101 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_暗影步符文|r] 学习 |T132303:0|t[暗影步] << Rogue
    .train 432301 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_犯禁符文|r] 学习 |T236285:0|t[压倒优势] << Rogue
    .train 400105 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_暗影打击符文|r] 学习 |T132323:0|t[暗影打击] << Rogue
    .train 424984 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r] 学习 |T132375:0|t[军刀猛刺] << Rogue
    .train 415922 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_豪侠符文|r] 学习 |T134538:0|t[短枪射击] << Rogue
    .train 431663 >> 使用 |T135791:0|t[|cRXP_FRIENDLY_灵智顿悟|r] 学习 |T136181:0|t[心灵尖刺]。 << Priest
    .train 425216 >> 使用 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] 学习 |T237514:0|t[虚空疫病] << Priest
    .train 402862 >> 使用 |T136222:0|t[|cRXP_FRIENDLY_忧虑助祭的回忆|r] 学习 |T237545:0|t[苦修] << Priest
    .train 402849 >> 使用 |T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言|r] 学习 |T136149:0|t[暗言术：灭] << Priest
    .use 205947 << Priest --Prophecy of a Desecrated Citadel
    .use 212552 << Priest --Psychosophic Epiphany
    .use 205940 << Priest --Memory of a Dark Purpose
    .use 205951 << Priest --Memory of a Troubled Acolyte
    .use 205932 << Priest --Prophecy of a King's Demise
    .use 204716 << Warrior --Rune of Frenzied Assault
    .use 203746 << Mage --Spell Notes: Living Flame
    .use 209852 << Hunter --Rune of Kill Command
    .use 226401 << Hunter --Treatise on the Heart of the Lion
    .use 208799 << Mage --Spell Notes: Living Bomb
    .use 203748 << Mage --Spell Notes: Burnout
    .use 225690 << Mage --Spell Notes: Frozen Orb
    .use 203746 << Mage --Spell Notes: Living Flame
    .use 203745 << Mage --Spell Notes: Ice Lance
    .use 204716 << Warrior --Rune of Frenzied Assault
    .use 204806 << Warrior --Rune of Victory Rush
    .use 205215 << Warlock --Rune of Tactics
    .use 210824 << Warlock --Rune of the Pact
    .use 211477 << Warlock --Rune of Incinerate
    .use 205230 << Warlock --Rune of Haunting
    .use 228797 << Warlock --Grimoire of Fel Armor
    .use 210979 << Rogue --Rune of Shadowstep
    .use 221428 << Rogue --Rune of Foul Play
    .use 204795 << Rogue --Rune of Shadowstrike
    .use 208772 << Rogue --Rune of Saber Slash
    .use 227922 << Rogue --Rune of the Swashbuckler
step << Warlock
    #season 2
    #optional
    #sticky
    .aura 403619 >> |cRXP_WARN_记得激活|r |T136156:0|t[邪甲术]
step << Warrior
    #season 0,1
    #completewith Training1
    .goto Tirisfal Glades,32.22,65.64,8 >> 进入建筑
step << Priest/Mage
    #season 0,1
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒|r
    >>|cRXP_BUY_从他那里购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
    .vendor >> 卖掉杂物
	.collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .target 乔舒·基恩
step << Priest
    #season 2
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈
    .accept 77670 >> 接任务：亡灵之思
    .turnin 77670 >> 交任务：亡灵之思
    .target 黑暗牧师杜斯滕
step
    #optional
    #label Vendor
step << Warlock/Mage
    #sticky
    #label Piercing
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温雅|r和|cRXP_FRIENDLY_暗影牧师萨维斯|r交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r交谈 << Mage
    .accept 1470 >>接任务：控制小鬼 << Warlock
    .goto Tirisfal Glades,30.98,66.41 << Warlock
    .target +温雅·玛山德 << Warlock
    .turnin 363 >> 交任务：突然醒来
    .accept 364 >> 接任务：无脑的僵尸
    .target +暗影牧师萨维斯
    .goto Tirisfal Glades,30.84,66.20
step << Warlock/Mage
    #xprate <2.1
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .accept 376 >> 接任务：被诅咒者
    .goto Tirisfal Glades,30.86,66.05
    .target 新兵艾尔雷斯
    .xp <2,1
step << Warlock/Mage
    #xprate >2.09
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .accept 376 >> 接任务：被诅咒者
    .goto Tirisfal Glades,30.86,66.05
    .target 新兵艾尔雷斯
step << Warlock
    #season 2
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马克希米林|r 交谈
    .accept 77672 >>接受失落的符文
    .turnin 77672 >>交任务: 失落的符文
    .target 马克希米林
step << Mage
    #season 2
    #requires Piercing
    .goto Tirisfal Glades,30.94,66.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莎贝拉|r交谈
    .train 1459 >> 学习|T135932:0|t[奥术智慧]
    .accept 77671 >>接任务：法术研究
    .turnin 77671 >>交任务：法术研究
    .target 伊莎贝拉
step << Mage
    #season 0,1
    #requires Piercing
    .goto Tirisfal Glades,30.94,66.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊莎贝拉|r 交谈
    .train 1459 >> 学习 |T135932:0|t[奥术智慧]
    .target 伊莎贝拉
step << Mage
    #season 2
    #optional
    .equip 10,711 >> |cRXP_WARN_装备|r |T132961:0|t[破布手套]
    .use 711
    .engrave 10 >>|cRXP_WARN_在|r手套上铭刻|r |T236220:0|t[活动炸弹]
    .engrave 7 >>|cRXP_WARN_在裤子上铭刻|r |T135820:0|t[活体烈焰]
    .engrave 5 >>|cRXP_WARN_在胸甲上铭刻|r |T236207:0|t[燃尽]
step << Mage
    #season 2
    #optional
    #sticky
    .engrave 15 >> 留意披风掉落。拿到披风后，在上面铭刻|T135851:0|t[寒冰宝珠]
    >>|cRXP_WARN_这个法术非常强大|r
step << Warlock
    #season 0,1
    #label Vendor
    .goto Tirisfal Glades,30.81,66.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉|r交谈
    .vendor >>出售杂物
    .target 凯拉·斯密瑟
    .money >0.001
step << Warlock
    #season 0,1
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马克希米林|r 交谈
    .train 348 >>学习 |T135817:0|t[献祭]
    .target 马克希米林
step << !Warlock !Mage
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r交谈
    .turnin 363 >> 交任务：突然醒来
    .accept 364 >> 接任务：无脑的僵尸
    .target 暗影牧师萨维斯
step << !Warlock !Mage
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .accept 376 >> 接任务：被诅咒者
    .goto Tirisfal Glades,30.86,66.05
    .target 新兵艾尔雷斯
    .xp <2,1
step << !Warlock !Mage
    #xprate >2.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .accept 376 >> 接任务：被诅咒者
    .goto Tirisfal Glades,30.86,66.05
    .target 新兵艾尔雷斯
step << Rogue/Priest/Warlock
    #season 2
    .goto Tirisfal Glades,32.41,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿基班德·卡瓦|r 交谈
    >>|cRXP_BUY_购买一条|r |T132513:0|t[破布腰带]，|cRXP_BUY_用于铭刻符文|r << Rogue/Priest
    >>|cRXP_BUY_购买一副|r |T132606:0|t[破布护腕]，|cRXP_BUY_用于铭刻符文|r << Warlock
    .collect 3596,1 << Warlock --Tattered Cloth Bracers
    .collect 3595,1 << Rogue/Priest --Tattered Cloth Belt
    .target 阿基班德·卡瓦
step << Warlock
    #season 2
    .equip 10,711 >> |cRXP_WARN_装备|r |T132961:0|t[破布手套]
    .equip 9,3596 >> |cRXP_ENEMY_装备|r |T132606:0|t[破布护腕]
    .use 711
    .use 3596
    .engrave 10 >>|cRXP_WARN_在手套上铭刻|r |T236298:0|t[鬼影缠身]
    .engrave 9 >> |cRXP_WARN_在护腕上铭刻|r |T135789:0|t[烧尽]
    .engrave 7 >> |cRXP_WARN_在裤子上铭刻|r |T237562:0|t[恶魔契约]
    .engrave 5 >> |cRXP_WARN_在胸甲上铭刻|r |T136150:0|t[恶魔战术]
step << Priest
    #season 2
    .equip 10,711 >> |cRXP_WARN_装备|r |T132961:0|t[破布手套]
    .equip 6,3595 >> |cRXP_WARN_装备|r |T132513:0|t[破布腰带]
    .use 711
    .use 3595
    .engrave 6 >> 在腰带上刻印 |T136181:0|t[心灵尖刺]
    .engrave 10 >> 在手套上刻印 |T136149:0|t[暗言术：灭]
    .engrave 7 >> 在裤子上刻印 |T237570:0|t[裂魂魔]
step << Priest
    #season 2
    #optional
    #sticky
    >>|cRXP_WARN_留意|r靴子|cRXP_WARN_掉落。装备后，铭刻|r |T237514:0|t[虚空疫病] |cRXP_WARN_在靴子上|r
    .engrave 8 >> 在|T132539:0|t[靴子]上铭刻|T237514:0|t[虚空疫病]
step << Rogue
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大卫|r交谈
    .accept 77669 >>接受血色符文
    .turnin 77669 >>交任务: 血色符文
    .target 大卫·提亚斯
    .train 1784 >> 学习 |T132320:0|t[潜行]
step << Rogue
    #season 2
    #optional
    .equip 10 >> 装备 |T132952:0|t[破损的皮手套]
    .equip 6,3595 >> |cRXP_WARN_装备|r |T132513:0|t[破布腰带]
    .engrave 10 >> 在手套上刻印 |T132375:0|t[军刀猛刺]
    .engrave 6 >> 在腰带上刻印 |T132303:0|t[暗影步]
    .use 2125 --Cracked Leather Gloves
    .use 3595 --Tattered Cloth Belt
step << Rogue
    #season 2
    #sticky
    #optional
    >>|cRXP_WARN_留意|r披风/护腕|cRXP_WARN_掉落|r|cRXP_WARN_。装备后，在相应部位铭刻符文|r
    .engrave 15 >> 铭刻|T134538:0|t[短枪射击]在|T133771:0|t[披风]上
    .engrave 9 >> 铭刻|T236285:0|t[压倒优势]在|T133830:0|t[护腕]上
step << Warrior
    #season 0,1
    #completewith next
    #label Vendor
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_阿基班德·卡瓦|r
    .vendor >> 卖掉杂物
    .target 阿基班德·卡瓦
    .money >0.001
step << Warrior
    #season 0,1
    #label Training1
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹纳尔|r 交谈
    .train 6673 >>学习 |T132333:0|t[战斗怒吼]
    .target 丹纳尔·斯特恩
step << Warrior
    #season 2
    #label Training1
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丹纳尔|r
    .train 6673 >>学习 |T132333:0|t[战斗怒吼]
    .accept 77668 >> 接受失落的符文
    .turnin 77668 >> 交任务: 失落的符文
    .target 丹纳尔·斯特恩
step << Warrior
    #season 2
    .equip 10 >> 装备 |T132938:0|t[无光泽的链甲手套]
    .engrave 10 >> 在手套上铭刻 |T132342:0|t[乘胜追击]
    .engrave 7 >> 在裤子上铭刻|T236317:0|t[狂乱攻击]
    >>|cRXP_WARN_你很快会从任务获得一把双手剑|r
    .use 2385 -- Tarnished Chain Gloves
step << Warlock
    #requires Piercing
    #loop
    .goto Tirisfal Glades,31.82,61.48,0
    .goto Tirisfal Glades,31.82,61.48,30,0
    .goto Tirisfal Glades,31.11,60.71,30,0
    .goto Tirisfal Glades,32.07,60.17,30,0
    .goto Tirisfal Glades,32.26,59.21,30,0
    .goto Tirisfal Glades,33.28,59.53,30,0
    .goto Tirisfal Glades,33.66,60.76,30,0
    .goto Tirisfal Glades,33.94,61.81,30,0
    .goto Tirisfal Glades,34.21,63.05,30,0
    .goto Tirisfal Glades,33.01,63.01,30,0
    >>击杀 |cRXP_ENEMY_断骨骷髅|r，拾取它们的 |cRXP_LOOT_断骨骷髅的颅骨|r
    .complete 1470,1 --Rattlecage Skull (3)
    .mob 断骨骷髅
step << Warlock
    #completewith next
    +|cRXP_WARN_击杀 |cRXP_ENEMY_无脑的僵尸|r 和 |cRXP_ENEMY_丑陋的僵尸|r 并拾取物品，直到可出售的物品（包括身上的护甲）总价值达到25铜币|r
    .mob 无脑的僵尸
    .mob 丑陋的僵尸
    .money >0.0025
step << Warlock
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔舒|r 交谈
    >>|cRXP_BUY_向他购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_作为补给|r
	.collect 159,5,383,1 --Collect Refreshing Spring Water (5)
    .target 乔舒·基恩
    .isOnQuest 1470
step << Warlock
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.98,66.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温雅|r 交谈
    .turnin 1470 >>交任务 控制小鬼
    .target 温雅·玛山德
step << Warlock
    #completewith next
    .cast 688 >>|cRXP_WARN_施放|r |T136218:0|t[召唤小鬼]
step
    #xprate >2.09
    #completewith next
    >>击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_蓬毛食腐狼|r，拾取它们的 |cRXP_LOOT_食腐狼的爪子|r
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r 和 |cRXP_ENEMY_癞皮夜行蝙蝠|r，拾取它们的 |cRXP_LOOT_夜行蝙蝠翼|r
    >>|cRXP_WARN_尽量避开 |cRXP_ENEMY_癞皮夜行蝙蝠|r，它们比 |cRXP_ENEMY_夜行蝙蝠|r 难打得多|r
    .complete 376,1 --Collect Scavenger Paw (x6)
    .mob +食腐狼幼崽
    .mob +蓬毛食腐狼
    .complete 376,2 --Collect Duskbat Wing (x6)
    .mob +夜行蝙蝠
    .mob +癞皮夜行蝙蝠
step
    #label Zombies
    #requires Piercing << Warlock/Mage
    #loop
	.goto Tirisfal Glades,31.72,63.98,0
	.goto Tirisfal Glades,31.72,63.98,40,0
	.goto Tirisfal Glades,30.69,63.88,40,0
	.goto Tirisfal Glades,30.90,62.20,40,0
	.goto Tirisfal Glades,30.73,61.66,40,0
	.goto Tirisfal Glades,31.14,61.41,40,0
	.goto Tirisfal Glades,31.80,61.83,40,0
	.goto Tirisfal Glades,32.85,63.02,40,0
	.goto Tirisfal Glades,32.90,63.54,40,0
	.goto Tirisfal Glades,33.41,63.06,40,0
	.goto Tirisfal Glades,33.75,62.86,40,0
	.goto Tirisfal Glades,33.51,63.82,40,0
	.goto Tirisfal Glades,33.55,64.57,40,0
	.goto Tirisfal Glades,33.29,64.96,40,0
    >>击杀 |cRXP_ENEMY_无脑的僵尸|r 和 |cRXP_ENEMY_丑陋的僵尸|r
    .complete 364,1 --Kill Mindless Zombie (x8)
    .mob +无脑的僵尸
    .complete 364,2 --Kill Wretched Zombie (x8)
    .mob +丑陋的僵尸
step << Mage/Warlock/Priest
    #xprate <2.1
    #completewith Vendor2
    +|cRXP_WARN_击杀 |cRXP_ENEMY_无脑的僵尸|r 和 |cRXP_ENEMY_丑陋的僵尸|r 并拾取物品，直到可出售的物品（包括身上的护甲）总价值达到33铜币|r
    .mob 无脑的僵尸
    .mob 丑陋的僵尸
    .money >0.0033
step << Mage/Warlock/Priest
    #xprate <2.1
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒|r
    >>|cRXP_BUY_从他那里购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
    .collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .vendor >> 卖掉杂物
    .target 乔舒·基恩
    .isOnQuest 364
    .money <0.0050
    .itemcount 159,<10
 step << Mage/Warlock/Priest
    #xprate <2.1
    #label Vendor2
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒|r
    >>|cRXP_BUY_从他那里购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
    .collect 159,5,383,1 --Collect Refreshing Spring Water (5)
    .vendor >> 卖掉杂物
    .target 乔舒·基恩
    .isOnQuest 364
    .money >0.0050
    .itemcount 159,<5
step
    #xprate <2.1
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r和|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈 << !Warlock !Mage !Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r, |cRXP_FRIENDLY_新兵艾尔雷斯|r,和|cRXP_FRIENDLY_马克希米林|r交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r, |cRXP_FRIENDLY_新兵艾尔雷斯|r,和|cRXP_FRIENDLY_伊莎贝拉|r交谈 << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r, |cRXP_FRIENDLY_新兵艾尔雷斯|r,和|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈 << Priest
    .turnin 364 >> 交任务：无脑的僵尸
    .accept 3095 >> 接任务：简易卷轴 << Warrior
    .accept 3096 >> 接任务：密文卷轴 << Rogue
    .accept 3097 >> 接任务：神圣卷轴 << Priest
    .accept 3098 >> 接任务：雕文卷轴 << Mage
    .accept 3099 >> 接任务：被污染的卷轴 << Warlock
    .accept 3901 >> 接任务：断骨骷髅
    .target +暗影牧师萨维斯
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .accept 376 >> 接任务：被诅咒者
    .target +新兵艾尔雷斯
    .goto Tirisfal Glades,30.86,66.05
    .turnin 3099 >> 交任务：被污染的卷轴 << Warlock
    .target +马克希米林 << Warlock
    .goto Tirisfal Glades,30.91,66.34 << Warlock
    .turnin 3098 >> 交任务：雕文卷轴 << Mage
    .target +伊莎贝拉 << Mage
    .goto Tirisfal Glades,30.94,66.06 << Mage
    .turnin 3097 >> 交任务：神圣卷轴 << Priest
    .target +黑暗牧师杜斯滕 << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
step
    #xprate <2.1
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r和|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈 << !Warlock !Mage !Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r, |cRXP_FRIENDLY_新兵艾尔雷斯|r,和|cRXP_FRIENDLY_马克希米林|r交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r, |cRXP_FRIENDLY_新兵艾尔雷斯|r,和|cRXP_FRIENDLY_伊莎贝拉|r交谈 << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r, |cRXP_FRIENDLY_新兵艾尔雷斯|r,和|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈 << Priest
    .turnin 364 >> 交任务：无脑的僵尸
    .accept 3095 >> 接任务：简易卷轴 << Warrior
    .accept 3096 >> 接任务：密文卷轴 << Rogue
    .accept 3097 >> 接任务：神圣卷轴 << Priest
    .accept 3098 >> 接任务：雕文卷轴 << Mage
    .accept 3099 >> 接任务：被污染的卷轴 << Warlock
    .accept 3901 >> 接任务：断骨骷髅
    .target +暗影牧师萨维斯
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .accept 376 >> 接任务：被诅咒者
    .target +新兵艾尔雷斯
    .goto Tirisfal Glades,30.86,66.05
    .turnin 3099 >> 交任务：被污染的卷轴 << Warlock
    .goto Tirisfal Glades,30.91,66.34 << Warlock
    .target +马克希米林 << Warlock
    .turnin 3098 >> 交任务：雕文卷轴 << Mage
    .goto Tirisfal Glades,30.94,66.06 << Mage
    .target +伊莎贝拉 << Mage
    .turnin 3097 >> 交任务：神圣卷轴 << Priest
    .target +黑暗牧师杜斯滕 << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
step << Mage/Warlock/Priest
    #xprate <2.1
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔舒|r 交谈
    >>|cRXP_BUY_向他购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_作为补给|r
    .collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .target 乔舒·基恩
    .isQuestTurnedIn 364
step
    #loop
    .goto Tirisfal Glades,34.32,56.79,0
    .goto Tirisfal Glades,29.21,66.68,40,0
    .goto Tirisfal Glades,29.48,65.70,40,0
    .goto Tirisfal Glades,29.60,64.04,40,0
    .goto Tirisfal Glades,29.67,63.39,40,0
    .goto Tirisfal Glades,30.09,61.51,40,0
    .goto Tirisfal Glades,30.97,59.66,40,0
    .goto Tirisfal Glades,31.61,58.57,40,0
    .goto Tirisfal Glades,32.07,57.74,40,0
    .goto Tirisfal Glades,32.85,58.35,40,0
    .goto Tirisfal Glades,34.32,56.79,40,0
    >>击杀 |cRXP_ENEMY_食腐狼幼崽|r 和 |cRXP_ENEMY_蓬毛食腐狼|r，拾取它们的 |cRXP_LOOT_食腐狼的爪子|r
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r 和 |cRXP_ENEMY_癞皮夜行蝙蝠|r，拾取它们的 |cRXP_LOOT_夜行蝙蝠翼|r
    >>|cRXP_WARN_尽量避开 |cRXP_ENEMY_癞皮夜行蝙蝠|r，它们比 |cRXP_ENEMY_夜行蝙蝠|r 难打得多|r
    .complete 376,1 --Collect Scavenger Paw (x6)
    .mob +食腐狼幼崽
    .mob +蓬毛食腐狼
    .complete 376,2 --Collect Duskbat Wing (x6)
    .mob +夜行蝙蝠
    .mob +癞皮夜行蝙蝠
step
    #xprate <2.1
    #loop
    .goto Tirisfal Glades,31.82,61.48,0
    .goto Tirisfal Glades,31.82,61.48,30,0
    .goto Tirisfal Glades,31.11,60.71,30,0
    .goto Tirisfal Glades,32.07,60.17,30,0
    .goto Tirisfal Glades,32.26,59.21,30,0
    .goto Tirisfal Glades,33.28,59.53,30,0
    .goto Tirisfal Glades,33.66,60.76,30,0
    .goto Tirisfal Glades,33.94,61.81,30,0
    .goto Tirisfal Glades,34.21,63.05,30,0
    .goto Tirisfal Glades,33.01,63.01,30,0
    >>击杀 |cRXP_ENEMY_断骨骷髅|r
    .complete 3901,1 --Kill Rattlecage Skeleton (12)
    .mob 断骨骷髅
step << Mage/Warlock/Priest
    #xprate <2.1
    .goto Tirisfal Glades,32.25,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒|r
    >>|cRXP_BUY_从他那里购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
    >>|cRXP_WARN_至少保留1银币|r << Mage/Warlock/Priest
    .vendor >> 卖掉杂物
    .target 乔舒·基恩
    .money >0.01
    .isOnQuest 3901
    .itemcount 159,<20
step
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r和|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .turnin 3901 >> 交任务：断骨骷髅
    .target +暗影牧师萨维斯
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .turnin 376 >> 交任务：被诅咒者
    .accept 6395 >> 接任务：玛拉的遗愿
    .target +新兵艾尔雷斯
    .goto Tirisfal Glades,30.86,66.05
step << Mage/Warlock/Priest
    #xprate >2.09
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒|r
    >>|cRXP_BUY_从他那里购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
    .collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .vendor >> 卖掉杂物
    .target 乔舒·基恩
    .isOnQuest 364
    .money <0.0050
    .itemcount 159,<10
 step << Mage/Warlock/Priest
    #xprate >2.09
    #label Vendor2
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒|r
    >>|cRXP_BUY_从他那里购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
    .collect 159,5,383,1 --Collect Refreshing Spring Water (5)
    .vendor >> 卖掉杂物
    .target 乔舒·基恩
    .isOnQuest 364
    .money >0.0050
    .itemcount 159,<5
step
    #xprate >2.09
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r和|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈 << !Warlock !Mage !Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r, |cRXP_FRIENDLY_新兵艾尔雷斯|r,和|cRXP_FRIENDLY_马克希米林|r交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r, |cRXP_FRIENDLY_新兵艾尔雷斯|r,和|cRXP_FRIENDLY_伊莎贝拉|r交谈 << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r, |cRXP_FRIENDLY_新兵艾尔雷斯|r,和|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈 << Priest
    .turnin 364 >> 交任务：无脑的僵尸
    .accept 3095 >> 接任务：简易卷轴 << Warrior
    .accept 3096 >> 接任务：密文卷轴 << Rogue
    .accept 3097 >> 接任务：神圣卷轴 << Priest
    .accept 3098 >> 接任务：雕文卷轴 << Mage
    .accept 3099 >> 接任务：被污染的卷轴 << Warlock
    .target +暗影牧师萨维斯
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .turnin 376 >> 交任务：被诅咒者
    .accept 6395 >> 接任务：玛拉的遗愿
    .target +新兵艾尔雷斯
    .goto Tirisfal Glades,30.86,66.05
    .turnin 3099 >> 交任务：被污染的卷轴 << Warlock
    .goto Tirisfal Glades,30.91,66.34 << Warlock
    .target +马克希米林 << Warlock
    .turnin 3098 >> 交任务：雕文卷轴 << Mage
    .goto Tirisfal Glades,30.94,66.06 << Mage
    .target +伊莎贝拉 << Mage
    .turnin 3097 >> 交任务：神圣卷轴 << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
    .target +黑暗牧师杜斯滕 << Priest
step
    #xprate >2.09
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r和|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈 << !Warlock !Mage !Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r, |cRXP_FRIENDLY_新兵艾尔雷斯|r,和|cRXP_FRIENDLY_马克希米林|r交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r, |cRXP_FRIENDLY_新兵艾尔雷斯|r,和|cRXP_FRIENDLY_伊莎贝拉|r交谈 << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r, |cRXP_FRIENDLY_新兵艾尔雷斯|r,和|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈 << Priest
    .turnin 364 >> 交任务：无脑的僵尸
    .accept 3095 >> 接任务：简易卷轴 << Warrior
    .accept 3096 >> 接任务：密文卷轴 << Rogue
    .accept 3097 >> 接任务：神圣卷轴 << Priest
    .accept 3098 >> 接任务：雕文卷轴 << Mage
    .accept 3099 >> 接任务：被污染的卷轴 << Warlock
    .target +暗影牧师萨维斯
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .turnin 376 >> 交任务：被诅咒者
    .accept 6395 >> 接任务：玛拉的遗愿
    .target +新兵艾尔雷斯
    .goto Tirisfal Glades,30.86,66.05
    .turnin 3099 >> 交任务：被污染的卷轴 << Warlock
    .goto Tirisfal Glades,30.91,66.34 << Warlock
    .target +马克希米林 << Warlock
    .turnin 3098 >> 交任务：雕文卷轴 << Mage
    .goto Tirisfal Glades,30.94,66.06 << Mage
    .target +伊莎贝拉 << Mage
    .turnin 3097 >> 交任务：神圣卷轴 << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
    .target +黑暗牧师杜斯滕 << Priest
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈
    .train 589 >> 学习职业技能
    .target 黑暗牧师杜斯滕
    .money <0.021
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈
    .train 2052 >> 学习|T135929:0|t[次级治疗术（等级2）]
    .train 589 >> 学习|T136207:0|t[暗言术：痛]
    .target 黑暗牧师杜斯滕
    .money <0.02
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈
    .train 1243 >> 学习|T135987:0|t[真言术：韧]
    .train 589 >> 学习|T136207:0|t[暗言术：痛]
    .target 黑暗牧师杜斯滕
    .money <0.011
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈
    .train 589 >> 学习|T136207:0|t[暗言术：痛]
    .target 黑暗牧师杜斯滕
    .money <0.01
step << Warlock
    #season 0,1
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_马克希米林|r
    .train 172 >> 学习|T136118:0|t[腐蚀术]
    .target 马克希米林
step << Mage
    #season 0,1
    .goto Tirisfal Glades,30.94,66.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莎贝拉|r交谈
    .train 116 >> 学习|T135846:0|t[寒冰箭]
    .target 伊莎贝拉
step
    #xprate <1.5
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵萨尔坦|r和|cRXP_FRIENDLY_执行官阿伦|r交谈
    .accept 3902 >> 接任务：捡破烂
    .goto Tirisfal Glades,31.61,65.62
    .target +亡灵卫兵萨尔坦
    .accept 380 >> 接任务：夜行蜘蛛洞穴
    .goto Tirisfal Glades,32.15,66.01
    .target +执行官阿伦
step
    #xprate >1.49
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官阿伦|r交谈
    .accept 380 >> 接任务：夜行蜘蛛洞穴
    .goto Tirisfal Glades,32.15,66.01
    .target 执行官阿伦
step << Rogue/Warrior
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_阿基班德·卡瓦|r
    .vendor >> 卖掉杂物
    .target 阿基班德·卡瓦
    .money >0.1
    .isOnQuest 3095 << Warrior
    .isOnQuest 3096 << Rogue
step << Warrior
    #season 2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丹纳尔|r
    .turnin 3095 >> 交任务：简易卷轴
    .train 100 >> 学习|T132337:0|t[冲锋]
    .train 772 >> 学习|T132155:0|t[撕裂]
    .target 丹纳尔·斯特恩
    .money <0.02
 step << Warrior
    #season 2
    #label Training2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丹纳尔|r
    .turnin 3095 >> 交任务：简易卷轴
    .train 772 >> 学习|T132155:0|t[撕裂]
    .target 丹纳尔·斯特恩
    .money <0.01
step << Warrior
    #season 0,1
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丹纳尔|r
    .turnin 3095 >> 交任务：简易卷轴
    .train 100 >> 学习|T132337:0|t[冲锋]
    .train 772 >> 学习|T132155:0|t[撕裂]
    .target 丹纳尔·斯特恩
    .money <0.02
 step << Warrior
    #season 0,1
    #label Training2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丹纳尔|r
    .turnin 3095 >> 交任务：简易卷轴
    .train 772 >> 学习|T132155:0|t[撕裂]
    .target 丹纳尔·斯特恩
    .money <0.01
step << Warrior
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹纳尔·斯特恩|r 交谈
    .turnin 3095 >> 交任务：简易卷轴
    .target 丹纳尔·斯特恩
step << Rogue
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大卫|r交谈
    .turnin 3096 >> 交任务：密文卷轴
    .target 大卫·提亚斯
step << Rogue
    #season 0,1
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大卫|r交谈
    .turnin 3096 >> 交任务：密文卷轴
    .train 53 >> 学习|T132090:0|t[背刺]
    .money <0.04
    .target 大卫·提亚斯
step << Rogue
    #season 0,1
    #label Training2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大卫|r交谈
    .turnin 3096 >> 交任务：密文卷轴
    .target 大卫·提亚斯
    .train 1784 >> 学习 |T132320:0|t[潜行]
step
    #xprate >1.49
    #optional
    #completewith NightWebStart
    .abandon 3902 >> 放弃任务: [捡破烂]
step
    #xprate <1.5
    #loop
	.goto Tirisfal Glades,32.37,64.37,0
	.goto Tirisfal Glades,32.37,64.37,12,0
	.goto Tirisfal Glades,32.81,64.39,12,0
	.goto Tirisfal Glades,32.89,64.60,12,0
	.goto Tirisfal Glades,33.01,65.38,12,0
	.goto Tirisfal Glades,33.79,64.57,12,0
	.goto Tirisfal Glades,33.13,63.08,12,0
	.goto Tirisfal Glades,32.79,63.11,12,0
	.goto Tirisfal Glades,31.86,61.49,12,0
	.goto Tirisfal Glades,31.75,61.96,12,0
	.goto Tirisfal Glades,31.70,62.53,12,0
	.goto Tirisfal Glades,31.34,62.44,12,0
    >>打开地上的 |cRXP_PICK_装备箱|r，拾取其中的 |cRXP_LOOT_破烂装备|r
    .complete 3902,1 --Collect Scavenged Goods (x6)
step
    #label NightWebStart
    #loop
	.goto Tirisfal Glades,29.94,57.33,0
	.goto Tirisfal Glades,29.94,57.33,40,0
	.goto Tirisfal Glades,29.82,56.03,40,0
	.goto Tirisfal Glades,29.25,55.77,40,0
	.goto Tirisfal Glades,28.40,56.51,40,0
	.goto Tirisfal Glades,27.68,57.10,40,0
	.goto Tirisfal Glades,28.29,58.31,40,0
	.goto Tirisfal Glades,28.25,59.41,40,0
	.goto Tirisfal Glades,28.80,59.53,40,0
	.goto Tirisfal Glades,29.29,59.40,40,0
	.goto Tirisfal Glades,29.67,58.53,40,0
    >>击杀 |cRXP_ENEMY_小夜行蜘蛛|r
    .complete 380,1,6 --Kill Young Night Web Spider (10)
    .mob 小夜行蜘蛛
step
    #loop
	.goto Tirisfal Glades,28.25,58.27,0
	.goto Tirisfal Glades,28.25,58.27,25,0
	.goto Tirisfal Glades,28.42,59.07,25,0
	.goto Tirisfal Glades,27.86,60.57,25,0
	.goto Tirisfal Glades,27.17,59.18,25,0
	.goto Tirisfal Glades,27.30,57.97,25,0
	.goto Tirisfal Glades,26.94,56.42,25,0
	.goto Tirisfal Glades,27.51,56.00,25,0
    >>击杀洞口附近的 |cRXP_ENEMY_小夜行蜘蛛|r
    .complete 380,1 --Kill Young Night Web Spider (10)
    .mob 小夜行蜘蛛
step
    #completewith next
    .goto Tirisfal Glades,26.80,59.40,15,0
    .goto Tirisfal Glades,26.31,59.60,30 >>进入洞穴
step << Warlock
    #season 2
    #completewith NightWebCaveEnd
    >>击杀洞穴内的 |cRXP_ENEMY_夜行蜘蛛|r
	.complete 380,2 --Kill Night Web Spider (x8)
    .mob 夜行蜘蛛
step << Warrior
    #season 2
    #completewith NightWebCaveEnd
    >>击杀洞穴内的 |cRXP_ENEMY_夜行蜘蛛|r
	.complete 380,2 --Kill Night Web Spider (x8)
    .mob 夜行蜘蛛
step
    #label NightWebCaveEnd
    #loop
    .goto Tirisfal Glades,24.68,59.54,0
    .goto Tirisfal Glades,26.31,59.60,30,0
    .goto Tirisfal Glades,25.61,59.55,20,0
    .goto Tirisfal Glades,25.11,60.33,20,0
    .goto Tirisfal Glades,24.18,60.77,20,0
    .goto Tirisfal Glades,23.23,59.91,20,0
    .goto Tirisfal Glades,23.89,58.36,20,0
    .goto Tirisfal Glades,24.68,59.54,20,0
    >>击杀洞穴内的 |cRXP_ENEMY_夜行蜘蛛|r
	.complete 380,2 --Kill Night Web Spider (x8)
    .mob 夜行蜘蛛
step
    #xprate <1.5
    #softcore
    #completewith Scavenging
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
step
    #xprate >1.49
    #softcore
    #completewith NightWebH
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
step << Warlock
    #softcore
    #completewith ScarletC
    .cast 688 >>|cRXP_WARN_施放|r |T136218:0|t[召唤小鬼]
step << skip
    #hardcore
    #completewith next
    .goto 1420,26.027,60.607,-1
    .goto 1420,24.508,59.360,-1
    .goto 1420,23.572,59.239,-1
    .goto Tirisfal Glades,31.08,64.88,30 >>|cRXP_WARN_在洞穴内跳上伐木机、水井或卡在墙上的木板，然后登出并重新登录，以完成登出跳过|r
    >>|cRXP_WARN_也可以直接跑回丧钟镇|r
step
    #hardcore
    #completewith NightWebH
    .goto Tirisfal Glades,26.80,59.40,15 >> 从洞穴入口出去，返回丧钟镇
step
    #xprate <1.5
    #label Scavenging
    .goto Tirisfal Glades,31.61,65.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵萨尔坦|r交谈
    .turnin 3902 >> 交任务：捡破烂
    .target 亡灵卫兵萨尔坦
step
    #label NightWebH
    .goto Tirisfal Glades,32.15,66.01,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官阿伦|r交谈
    .turnin 380 >> 交任务：夜行蜘蛛洞穴
    .accept 381 >> 接任务：血色十字军
    .target 执行官阿伦
step << Rogue/Warrior
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_阿基班德·卡瓦|r
    .vendor >> 卖掉杂物
    .target 阿基班德·卡瓦
    .isOnQuest 6395
step << Warlock/Mage/Priest
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_乔舒|r
    >>|cRXP_BUY_从他那里购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
	.collect 159,15,383,1 << Warlock/Mage/Priest --Collect Refreshing Spring Water (15)
    .vendor >> 卖掉杂物
    .target 乔舒·基恩
    .isOnQuest 6395
    .itemcount 159,<15
step
    #requires NightWebH
    #loop
	.goto Tirisfal Glades,36.13,68.74,0
	.goto Tirisfal Glades,36.13,68.74,40,0
	.goto Tirisfal Glades,36.46,69.49,40,0
	.goto Tirisfal Glades,36.85,70.02,40,0
	.goto Tirisfal Glades,37.42,69.58,40,0
	.goto Tirisfal Glades,38.05,69.79,40,0
	.goto Tirisfal Glades,37.91,69.22,40,0
	.goto Tirisfal Glades,38.03,68.77,40,0
	.goto Tirisfal Glades,38.49,68.28,40,0
	.goto Tirisfal Glades,38.72,67.07,40,0
	.goto Tirisfal Glades,38.59,66.25,40,0
	.goto Tirisfal Glades,38.65,65.07,40,0
	.goto Tirisfal Glades,37.62,65.36,40,0
	.goto Tirisfal Glades,36.93,65.38,40,0
	.goto Tirisfal Glades,36.51,65.42,40,0
	.goto Tirisfal Glades,36.85,66.59,40,0
	.goto Tirisfal Glades,37.45,67.95,40,0
	.goto Tirisfal Glades,36.93,68.16,40,0
    >>击杀 |cRXP_ENEMY_血色新兵|r 和 |cRXP_ENEMY_血色信徒|r，拾取它们的 |cRXP_LOOT_血色十字军臂章|r
    >>|cRXP_WARN_暂时不要击杀 |cRXP_ENEMY_迈文·考加尔|r|r
    >>|cRXP_WARN_尽量避开 |cRXP_ENEMY_血色新兵|r，因为它们有|r |T135843:0|t[霜甲术] |cRXP_WARN_（会降低你的攻击速度）|r << Warrior/Rogue
    .complete 381,1 --Collect Scarlet Armband (12)
    .mob 血色新兵
    .mob 血色信徒
step
    .goto Tirisfal Glades,36.69,61.67
    >>击杀 |cRXP_ENEMY_塞缪尔|r，拾取 |cRXP_LOOT_塞缪尔的遗骸|r
    .collect 16333,1,6395,1 --Collect Samuel's Remains
    .mob 塞缪尔·菲普斯
step
    #softcore
    #completewith next
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
step
    .goto Tirisfal Glades,31.17,65.08
	>>点击地上的 |cRXP_PICK_玛拉的坟墓|r
    .complete 6395,1 --Collect Samuel's Remains Buried (1)
 step << Warlock
    #softcore
	#completewith ScarletC
	.cast 688 >>|cRXP_WARN_施放|r |T136218:0|t[召唤小鬼]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈 << !Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r和|cRXP_FRIENDLY_黑暗牧师杜斯滕|r交谈 << Priest
    .turnin 6395 >> 交任务：玛拉的遗愿
    .target +新兵艾尔雷斯
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.86,66.05
    .accept 5651 >> 接任务：黑暗的恩赐 << Priest
    .target +黑暗牧师杜斯滕 << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
step
    #sticky
    #label ScarletC
    .goto Tirisfal Glades,32.15,66.01,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官阿伦|r交谈
    .turnin 381 >> 交任务：血色十字军
    .accept 382 >> 接任务：十字军信使
    .target 执行官阿伦
step
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_阿基班德·卡瓦|r
    .vendor >> 卖掉杂物
    .target 阿基班德·卡瓦
step
    #requires ScarletC
    .goto Tirisfal Glades,36.50,68.82
    >>击杀 |cRXP_ENEMY_迈文|r，拾取 |cRXP_LOOT_血色十字军文件|r
    .complete 382,1 --Collect Scarlet Crusade Documents (1)
    .mob 迈文·考加尔
step
    .goto Tirisfal Glades,32.15,66.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官阿伦|r交谈
    .turnin 382 >> 交任务：十字军信使
    .accept 383 >> 接任务：重要情报
    .target 执行官阿伦
step
    #season 2
    .goto Tirisfal Glades,31.36,66.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_符文贩子|r 交谈
    >>|cRXP_WARN_不要将可装备的物品卖给商人|r
    .vendor >> |cRXP_BUY_出售杂物并购买你需要的全部|T134419:0|t|cRXP_WARN_[符文]|r|r
    .target 符文贩子
    .skipgossip
step
    #loop
    .goto Tirisfal Glades,34.08,59.51,50,0
    .goto Tirisfal Glades,35.34,56.55,50,0
    .goto Tirisfal Glades,36.83,56.85,50,0
    .goto Tirisfal Glades,37.76,59.38,50,0
    .goto Tirisfal Glades,37.51,62.99,50,0
	.goto Tirisfal Glades,36.13,68.74,50,0
	.goto Tirisfal Glades,36.46,69.49,50,0
	.goto Tirisfal Glades,36.85,70.02,50,0
	.goto Tirisfal Glades,37.42,69.58,50,0
	.goto Tirisfal Glades,38.05,69.79,50,0
	.goto Tirisfal Glades,37.91,69.22,50,0
	.goto Tirisfal Glades,38.03,68.77,50,0
	.goto Tirisfal Glades,38.49,68.28,50,0
	.goto Tirisfal Glades,38.72,67.07,50,0
	.goto Tirisfal Glades,38.59,66.25,50,0
	.goto Tirisfal Glades,38.65,65.07,50,0
	.goto Tirisfal Glades,37.62,65.36,50,0
	.goto Tirisfal Glades,36.93,65.38,50,0
	.goto Tirisfal Glades,36.51,65.42,50,0
	.goto Tirisfal Glades,36.85,66.59,50,0
	.goto Tirisfal Glades,37.45,67.95,50,0
	.goto Tirisfal Glades,36.93,68.16,50,0
	.goto Tirisfal Glades,36.13,68.74,50,0
    .xp 5+1900 >>刷怪至 1900+/2800 经验值
step
    .goto Tirisfal Glades,38.24,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔文·蒙泰古|r交谈
    .accept 8 >> 接任务：潜行者的交易
    .target 卡尔文·蒙泰古
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
#xprate >1.99
<< Horde
#name 7-13 Tirisfal Glades
#version 1
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#defaultfor Undead
#next 13-20 The Barrens
#displayname 7-13 提瑞斯法林地
step
    .goto Tirisfal Glades,40.91,54.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵希米尔|r交谈。
    .accept 365 >>接受任务 悲伤之地
    .target 亡灵卫兵希米尔
step << skip
    #loop
    .goto Tirisfal Glades,56.13,52.48,0
    .goto Tirisfal Glades,40.77,54.42,0
    .goto Tirisfal Glades,40.77,54.42,40,0
    .goto Tirisfal Glades,42.04,55.11,40,0
    .goto Tirisfal Glades,43.59,54.30,40,0
    .goto Tirisfal Glades,46.21,56.78,40,0
    .goto Tirisfal Glades,48.88,57.93,40,0
    .goto Tirisfal Glades,50.73,57.27,40,0
    .goto Tirisfal Glades,52.52,54.48,40,0
    .goto Tirisfal Glades,54.49,52.65,40,0
    .goto Tirisfal Glades,56.13,52.48,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛尔多|r交谈。
    >>|cRXP_WARN_他是一只沿通往布瑞尔的道路巡逻的憎恶。|r
    .accept 5481 >>接受任务：葛尔多的任务
    .unitscan 葛尔多
step << Priest
    .goto Tirisfal Glades,52.59,55.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博文·布里斯博埃斯|r交谈。
    .train 3908 >> 学习|T136249:0|t[裁缝]，留存|T132889:0|t[亚麻布]，这样稍后便能制作魔杖。
    .target 博文·布里斯博埃斯
step
    #softcore
    #completewith next
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活，或跑回布瑞尔。
    .target 灵魂医者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪林格尔|r和|cRXP_FRIENDLY_塞加德|r交谈
    .accept 404 >>接受任务：腐烂的爪子
    .target +亡灵卫兵迪林格尔
    .goto Tirisfal Glades,58.20,51.45
    .turnin 383 >>交任务：重要情报
    .accept 427 >>接受任务 与血色十字军的战争
    .target +执行官塞加德
    .goto Tirisfal Glades,60.59,51.77
step << Rogue
    .goto Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_温特斯夫人|r|cRXP_BUY_交谈，购买|r|T135421:0|t[增重飞斧]|cRXP_BUY_。|r
    .collect 3131,200,404,1 << !tbc
    .collect 29007,1,404,1 << tbc
    .target 温特斯夫人
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗·德沃尔|r交谈。
    .vendor >> 出售杂物。如果卖掉武器后就能买得起|T135641:0|t[卷刃的剑]（4银01铜），可以卖掉它；钱仍不够就稍后再来。
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗|r|cRXP_BUY_交谈，向他购买|r |T135641:0|t[卷刃的剑]|cRXP_BUY_。|r
    .collect 2494,1,404,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #optional
    #completewith Claws
    +|cRXP_WARN_装备|r |T135421:0|t[增重飞斧]
    .use 3131 << !tbc
    .use 29007 << tbc
    .itemcount 3131,1 << !tbc
    .itemcount 29007,1 << tbc
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
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗·德沃尔|r交谈。
    .vendor >> 出售杂物。如果卖掉武器后就能买得起|T135321:0|t[步兵剑]（5银36铜），可以卖掉它；钱仍不够就稍后再来。
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗|r|cRXP_BUY_交谈，向他购买|r |T135321:0|t[步兵剑]|cRXP_BUY_。|r
    .collect 2488,1,404,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #optional
    #completewith Claws
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈。
    .turnin 8 >>交任务：潜行者的交易
    .home >> 将炉石绑定在布瑞尔。
    .target 旅店老板瑞尼
step
    #xprate >1.49
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    >>|cRXP_FRIENDLY_格莉丝|r|cRXP_WARN_在旅店二楼|r
    .accept 375 >>接受任务：死亡之寒
    .target 格莉丝·戴玛
    .xp <7,1
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师贝里尔|r（二楼）交谈。
    .turnin 5651 >> 交任务：黑暗的恩赐
    .accept 5650 >> 接受任务：黑暗之衣
	.train 591 >>学习|T135924:0|t[惩击]。
    .train 17 >>学习|T135940:0|t[真言术：盾]。
    .train 2052 >>学习|T135929:0|t[次级治疗术（等级 2）]。
    .target 黑暗牧师贝里尔
    .train 1243 >> 学习 |T135987:0|t[真言术：韧]
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·火歌|r（二楼）交谈。
    .train 143 >> 学习|T135812:0|t[火球术]
    .train 2136 >>学习|T135807:0|t[火焰冲击]
    .target 凯恩·火歌
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .target 奥斯蒂尔·德·蒙
    .money <0.01
step << Rogue
    #season 0,1
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r（二楼）交谈。
    .train 1757 >> 学习|T136189:0|t[邪恶攻击]。
    .target 马里恩·考尔
    .money <0.01
step << Rogue
    #season 2
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r（二楼）交谈。
    .train 1757 >> 学习|T136189:0|t[邪恶攻击]。
    .train 921 >> 学习|T133644:0|t[搜索]。
    .target 马里恩·考尔
    .money <0.02
step << Rogue
    #optional
    #season 2
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r（二楼）交谈。
    .train 921 >> 学习|T133644:0|t[搜索]。
    .target 马里恩·考尔
    .money >0.02
    .money <0.01
step << Warlock
    .goto Tirisfal Glades,61.56,52.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉娜·朗恩|r（二楼）交谈。
    >>|cRXP_BUY_购买|r |T133738:0|t[魔典：血契]|cRXP_BUY_（从她那里）|r
    .collect 16321,1,404,1 --Grimoire of Blood Pact
    .vendor >>出售杂物
    .target 吉娜·朗恩
    .train 6307,1 --Blood Pact (Rank 1)
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈。
    .train 695 >> 学习|T136197:0|t[暗影箭]
    .train 1454 >> 学习|T136126:0|t[生命分流]
    .target 鲁伯特·鲍什
    .money <0.02
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈。
    .train 695 >> 学习|T136197:0|t[暗影箭]
    .target 鲁伯特·鲍什
step << Priest/Warlock
    .goto Tirisfal Glades,61.76,51.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_范斯·安德格鲁姆|r交谈。
    .train 7411 >> 学习|T136244:0|t[附魔]，搭配|T136249:0|t[裁缝]，稍后便能制作魔杖。
    .target 范斯·安德格鲁姆
step
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈。
    >>|cRXP_BUY_购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_（向她购买）。|r << Mage/Priest
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_（向她购买）。|r <<Warrior/Rogue
    >>|cRXP_BUY_购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_（向她购买）。|r << Warlock
    .vendor >> 出售杂物。
    .collect 1179,15,367,1 << Mage/Priest --Ice Cold Milk (15)
    .collect 4605,10,367,1 << Rogue/Warrior --Red-speckled Mushroom (10)
    .collect 1179,10,367,1 << Warlock --Ice Cold Milk (10)
    .collect 4605,5,367,1 << Warlock --Red-speckled Mushroom (5)
    .money <0.025 << Warrior/Rogue
    .money <0.0375 << Mage/Priest/Warlock
    .target 旅店老板瑞尼
 step
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .accept 367 >>接受任务 新的瘟疫
    .target 药剂师乔汉
step << Priest
    .goto Tirisfal Glades,59.18,46.49
    >>施放 |T135929:0|t[次级治疗术]和 |T135987:0|t[真言术：韧]，目标是|cRXP_FRIENDLY_亡灵卫兵科尔|r
    >>|cRXP_WARN_此任务需要2级次级治疗术。|r
    .complete 5650,1 --Heal and fortify Deathguard Kel (1)
    .target 亡灵卫兵科尔
step << skip
    #completewith Claws
    >>拾取地上的|cRXP_LOOT_阴暗草|r。
    .complete 5481,1 --Gloom Weed (3)
step
    #completewith next
    >>击杀|cRXP_ENEMY_衰老的黑暗犬|r（沿途遇到的），拾取|cRXP_LOOT_血液|r。
    .complete 367,1 --Darkhound Blood (5)
    .mob 衰老的黑暗犬
step
    #label Claws
    #loop
    .goto Tirisfal Glades,52.63,56.98,0
    .goto Tirisfal Glades,54.95,50.53,50,0
    .goto Tirisfal Glades,53.35,50.29,50,0
    .goto Tirisfal Glades,52.12,50.38,50,0
    .goto Tirisfal Glades,51.28,51.63,50,0
    .goto Tirisfal Glades,52.03,53.74,50,0
    .goto Tirisfal Glades,52.29,56.72,50,0
    .goto Tirisfal Glades,53.95,56.53,50,0
    .goto Tirisfal Glades,53.55,58.25,50,0
    .goto Tirisfal Glades,52.63,56.98,50,0
    >>击杀|cRXP_ENEMY_腐烂的死者|r和|cRXP_ENEMY_破碎的尸体|r，拾取|cRXP_LOOT_爪子|r。
    .complete 404,1 --Putrid Claw (7)
    .mob 腐烂的死者
    .mob 破碎的尸体
step << skip
    #label GloomWeed
    #loop
    .goto Tirisfal Glades,39.55,50.64,0
    .goto Tirisfal Glades,44.43,57.33,0
    .goto Tirisfal Glades,39.55,50.64,50,0
    .goto Tirisfal Glades,44.43,57.33,50,0
    >>继续拾取地上的|cRXP_LOOT_阴暗草|r，直到收集齐全。
    .complete 5481,1 --Gloom Weed (3)
step << Warrior
    #optional
    #season 2
    #xprate >1.49
    #completewith DBlood
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_被砍下的蝙蝠的头|r。
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
    .isOnQuest 375
step
    #optional
    #xprate >1.49
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_毛皮|r。
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .isOnQuest 375
step
    #xprate >1.49
    #label DBlood
    #loop
    .goto Tirisfal Glades,43.97,57.27,0
    .goto Tirisfal Glades,40.57,47.23,0
    .goto Tirisfal Glades,48.03,53.43,80,0
    .goto Tirisfal Glades,43.97,57.27,80,0
    .goto Tirisfal Glades,41.01,55.94,60,0
    .goto Tirisfal Glades,40.57,47.23,60,0
    .goto Tirisfal Glades,40.89,42.77,60,0
    .goto Tirisfal Glades,39.12,39.85,60,0
    >>继续击杀|cRXP_ENEMY_黑暗犬|r，拾取|cRXP_LOOT_血液|r，直到收集齐全。
    .complete 367,1 --Darkhound Blood (5)
    .mob 衰老的黑暗犬
    .mob 被诅咒的黑暗犬
step << Priest
    #ah
    #completewith FinishRings
    >>|cRXP_WARN_开始收集3组|r |T132889:0|t[亚麻布]|cRXP_WARN_，稍后用来制作|r |T135139:0|t[次级魔法杖]|cRXP_WARN_。|r
    >>|cRXP_WARN_如果不想制作，或更愿意稍后从拍卖行购买，则跳过此步骤。|r
    .collect 2589,60 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #ssf
    #completewith FinishRings
    >>|cRXP_WARN_开始收集3组|r |T132889:0|t[亚麻布]|cRXP_WARN_，稍后用来制作|r |T135139:0|t[次级魔法杖]|cRXP_WARN_。|r
    .collect 2589,60 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Rogue
    #season 2
    #completewith next
    >>施放|T133644:0|t[搜索]并击杀|cRXP_ENEMY_提瑞斯法农夫|r和|cRXP_ENEMY_提瑞斯法雇农|r，拾取|T134327:0|t[|cRXP_LOOT_左上角地图碎片|r]。
    .collect 208036,1 --Top-Left Map Piece (1)
    .mob 提瑞斯法农夫
    .mob 提瑞斯法雇农
    .train 400095,1
step
    #loop
    .goto Tirisfal Glades,36.63,50.09,0
    .goto Tirisfal Glades,37.20,52.17,50,0
    .goto Tirisfal Glades,36.64,50.09,50,0
    .goto Tirisfal Glades,36.10,49.07,50,0
    .goto Tirisfal Glades,35.08,49.82,50,0
    .goto Tirisfal Glades,35.30,50.91,50,0
    .goto Tirisfal Glades,34.57,51.58,50,0
    .goto Tirisfal Glades,36.63,50.09,50,0
    >>拾取田地中的|cRXP_LOOT_南瓜|r。
    .complete 365,1 --Tirisfal Pumpkin (10)
step << Rogue
    #season 2
    #loop
    .goto Tirisfal Glades,36.63,50.09,0
    .goto Tirisfal Glades,37.20,52.17,50,0
    .goto Tirisfal Glades,36.64,50.09,50,0
    .goto Tirisfal Glades,36.10,49.07,50,0
    .goto Tirisfal Glades,35.08,49.82,50,0
    .goto Tirisfal Glades,35.30,50.91,50,0
    .goto Tirisfal Glades,34.57,51.58,50,0
    .goto Tirisfal Glades,36.63,50.09,50,0
    >>施放|T133644:0|t[搜索]并击杀|cRXP_ENEMY_提瑞斯法农夫|r和|cRXP_ENEMY_提瑞斯法雇农|r，拾取|T134327:0|t[|cRXP_LOOT_左上角地图碎片|r]。
    .collect 208036,1 --Top-Left Map Piece (1)
    .mob 提瑞斯法农夫
    .mob 提瑞斯法雇农
    .train 400095,1
step << Rogue/Mage/Priest
    #season 2
    #completewith next
    >>施放|T133644:0|t[搜索]并击杀|cRXP_ENEMY_血色战士|r，拾取|T134327:0|t[|cRXP_LOOT_右上角地图碎片|r]。 << Rogue
    >>击杀|cRXP_ENEMY_血色战士|r，拾取 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN（活体烈焰）|r] << Mage
    >>击杀|cRXP_ENEMY_血色战士|r，拾取 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] << Priest
    >>|cRXP_WARN_提瑞斯法林地的所有血色十字军人型敌人都可能掉落地图碎片。|r << Rogue
    >>|cRXP_WARN_提瑞斯法林地的所有血色十字军人型敌人都可能掉落法术笔记。|r << Mage
    >>|cRXP_WARN_提瑞斯法林地的所有血色十字军人型敌人都可能掉落预言。|r << Priest
    .collect 208035,1 << Rogue --Top-Right Map Piece (1)
    .collect 203752,1 << Mage --Spell Notes: MILEGIN VALF (1)
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel (1)
    .mob 血色战士
    .train 400095,1 << Rogue
    .train 401768,1 << Mage
    .train 402852,1 << Priest
step
    #loop
    .goto Tirisfal Glades,31.78,51.36,0
    .goto Tirisfal Glades,33.73,49.34,50,0
    .goto Tirisfal Glades,33.65,51.07,50,0
    .goto Tirisfal Glades,31.78,51.36,50,0
    .goto Tirisfal Glades,30.02,50.48,50,0
    .goto Tirisfal Glades,29.91,49.24,50,0
    .goto Tirisfal Glades,30.62,47.53,50,0
    .goto Tirisfal Glades,31.01,46.50,50,0
    .goto Tirisfal Glades,32.15,44.83,50,0
    .goto Tirisfal Glades,33.73,45.29,50,0
    .goto Tirisfal Glades,34.10,47.88,50,0
    .goto Tirisfal Glades,33.73,49.34,50,0
    >>击杀|cRXP_ENEMY_血色战士|r
    >>|cRXP_WARN_小心，他们做出防御姿态动作后，招架几率会提高50%，持续8秒。|r << Rogue/Warrior
    .complete 427,1 --Scarlet Warrior (10)
    .mob 血色战士
step << Rogue/Mage/Priest
    #season 2
    #loop
    .goto Tirisfal Glades,31.78,51.36,0
    .goto Tirisfal Glades,33.73,49.34,50,0
    .goto Tirisfal Glades,33.65,51.07,50,0
    .goto Tirisfal Glades,31.78,51.36,50,0
    .goto Tirisfal Glades,30.02,50.48,50,0
    .goto Tirisfal Glades,29.91,49.24,50,0
    .goto Tirisfal Glades,30.62,47.53,50,0
    .goto Tirisfal Glades,31.01,46.50,50,0
    .goto Tirisfal Glades,32.15,44.83,50,0
    .goto Tirisfal Glades,33.73,45.29,50,0
    .goto Tirisfal Glades,34.10,47.88,50,0
    .goto Tirisfal Glades,33.73,49.34,50,0
    >>施放|T133644:0|t[搜索]并击杀|cRXP_ENEMY_血色战士|r，拾取|T134327:0|t[|cRXP_LOOT_右上角地图碎片|r]。 << Rogue
    >>击杀|cRXP_ENEMY_血色战士|r，拾取 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN（活体烈焰）|r] << Mage
    >>击杀|cRXP_ENEMY_血色战士|r，拾取 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] << Priest
    >>|cRXP_WARN_提瑞斯法林地的所有血色十字军人型敌人都可能掉落地图碎片。|r << Rogue
    >>|cRXP_WARN_提瑞斯法林地的所有血色十字军人型敌人都可能掉落法术笔记。|r << Mage
    >>|cRXP_WARN_提瑞斯法林地的所有血色十字军人型敌人都可能掉落预言。|r << Priest
    .collect 208035,1 << Rogue --Top-Right Map Piece (1)
    .collect 203752,1 << Mage --Spell Notes: MILEGIN VALF (1)
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel (1)
    .mob 血色战士
    .train 400095,1 << Rogue
    .train 401768,1 << Mage
    .train 402852,1 << Priest
step << Undead Priest
    #season 2
    #optional
    #sticky
    #completewith ZeptoDurotar
    >>寻找带有 [洛阿神灵之思] 增益的牧师。在他面前跪下，让他以你为目标使用 /pray（祈祷），传授第二种冥想增益
    >>若已失去 [亡灵之思]，先到布瑞尔墓地跪下重新获得
    .aura 418459
    .aura 417316
    .train 402852 >> 拥有两种冥想增益后，使用 |T135975:0|t[遭渎城堡的预言] 学习 |T237570:0|t[裂魂魔]
    .use 205947
    .itemcount 205947,1
    .train 402852,1
step << Mage
    #optional
    #completewith Conscript
    #season 2
    .collect 211779,1 >>若持有理解魔符，现在可解读笔记；否则继续路线，稍后在奥格瑞玛向施法材料商购买。
    .train 401768 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN（活体烈焰）|r] |cRXP_WARN_学习|r |T135820:0|t[活体烈焰]
    .use 203752
    .itemcount 203752,1
    .train 401768,1
step << Mage/Priest
    #season 2
    .goto Tirisfal Glades,25.6,48.2
    >>击杀|cRXP_ENEMY_Gillgar|r，拾取 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI（寒冰指）|r] << Mage
    >>击杀|cRXP_ENEMY_Gillgar|r，拾取 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] << Priest
    >>|cRXP_WARN_这是7级精英，较难击败。太难则先跳过。|r
    .collect 203753,1 << Mage --Spell Notes: RING SEFF OSTROF (1)
    .collect 205940,1 << Priest --Memory of a Dark Purpose (1)
    .mob Gillgar
    .train 401765,1 << Mage
    .train 425216,1 << Priest
step << Mage
    #optional
    #completewith Conscript
    #season 2
    .collect 211779,1 >>若持有理解魔符，现在可解读笔记；否则继续路线，稍后在奥格瑞玛向施法材料商购买。
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI（寒冰指）|r] |cRXP_WARN_学习|r |T236227:0|t[寒冰指]
    .use 203753
    .itemcount 203753,1
    .train 401765,1
step
    #hardcore
    #completewith BrillTurnin1
    .hs >> 炉石回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,>0,1
    .bindlocation 2119,1
step
    #hardcore
    #completewith BrillTurnin1
    .subzone 159 >> 返回布瑞尔。
    .subzoneskip 159
step
    #softcore
    #completewith BrillTurnin1
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活。
step << skip
    #softcore
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_初级药剂师霍兰德|r（在墓地附近巡逻）交谈。
    .turnin 5481 >>交任务：葛尔多的任务
    .accept 5482 >>接受任务：末日草
    .target 初级药剂师霍兰德
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪林格尔|r、|cRXP_FRIENDLY_乔汉|r和|cRXP_FRIENDLY_塞加德|r交谈
    .turnin 404 >>交任务：腐烂的爪子
    .accept 426 >>接受任务：磨坊告急
    .target +亡灵卫兵迪林格尔
    .goto Tirisfal Glades,58.20,51.43
    .turnin 367 >>交任务：新的瘟疫
    .turnin 365 >>交任务：悲伤之地
    .accept 368 >>接受任务 新的瘟疫
    .accept 407 >>接受任务 悲伤之地
    .target +药剂师乔汉
    .goto Tirisfal Glades,59.45,52.40
    .turnin 427 >>交任务：与血色十字军的战争
    .accept 370 >>接受任务 与血色十字军的战争
    .target +执行官塞加德
    .goto Tirisfal Glades,60.58,51.77
    .isQuestComplete 367
step
    #label BrillTurnin1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪林格尔|r、|cRXP_FRIENDLY_乔汉|r和|cRXP_FRIENDLY_塞加德|r交谈
    .turnin 404 >>交任务：腐烂的爪子
    .accept 426 >>接受任务：磨坊告急
    .target +亡灵卫兵迪林格尔
    .goto Tirisfal Glades,58.20,51.43
    .turnin 365 >>交任务：悲伤之地
    .accept 407 >>接受任务 悲伤之地
    .target +药剂师乔汉
    .goto Tirisfal Glades,59.45,52.40
    .turnin 427 >>交任务：与血色十字军的战争
    .accept 370 >>接受任务 与血色十字军的战争
    .target +执行官塞加德
    .goto Tirisfal Glades,60.58,51.77
step << Undead Priest
    #season 2
    .goto Tirisfal Glades,57.71,48.96
    .emote KNEEL
    .aura 418459 >> 在布瑞尔墓地跪下，获得 [亡灵之思]
    .itemcount 205940,1
    .train 425216,1
step << Undead Priest
    #season 2
    .train 425216 >> 使用 |T136222:0|t[黑暗意图的回忆] 学习 |T237514:0|t[虚空疫病]
    .use 205940
    .itemcount 205940,1
step
    #xprate >1.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵伯吉斯|r交谈，查看|cRXP_PICK_通缉告示|r，并与建筑内的|cRXP_FRIENDLY_执政官塞弗伦|r交谈。
    .accept 374 >>接受任务：死亡证明
    .target +亡灵卫兵伯吉斯
    .goto Tirisfal Glades,60.93,52.01
    .accept 398 >>接受任务：悬赏：蛆眼
    .goto Tirisfal Glades,60.74,51.52
    .accept 358 >>接受任务：盗墓贼
    .target +执政官塞弗伦
    .goto Tirisfal Glades,61.26,50.84
 step
    #xprate >1.49
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_购买一卷|r |T132891:0|t[粗线]|cRXP_BUY_（从她那里）|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate >1.49
    .goto Tirisfal Glades,61.97,51.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店后部楼下的|cRXP_FRIENDLY_血色十字军俘虏|r交谈。
    .turnin 407 >>交任务：悲伤之地
    .target 血色十字军俘虏
step
    #xprate >1.49
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师贝里尔|r（二楼）交谈。
    .turnin 5650 >>交任务：黑暗之衣
    .train 591 >>学习 |T135924:0|t[惩击]
    .train 17 >>学习 |T135940:0|t[真言术：盾]
    .target 黑暗牧师贝里尔
step
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    >>|cRXP_FRIENDLY_格莉丝|r|cRXP_WARN_在旅店二楼|r
    .accept 375 >>接受任务：死亡之寒
    .target 格莉丝·戴玛
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师贝里尔|r（二楼）交谈。
	.train 139 >> 学习职业技能。
    .target 黑暗牧师贝里尔
    .xp <8,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·火歌|r（二楼）交谈。
    .train 205 >> 学习职业技能。
    .target 凯恩·火歌
    .xp <8,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔·德·蒙|r交谈。
    .train 284 >> 学习职业技能。
    .target 奥斯蒂尔·德·蒙
    .xp <8,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r（二楼）交谈。
    .train 6760 >> 学习职业技能。
    .target 马里恩·考尔
    .xp <8,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈。
    .train 980 >> 学习职业技能。
    .target 鲁伯特·鲍什
    .xp <8,1
step << Rogue/Warrior
    .goto Tirisfal Glades,61.81,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_妮拉|r交谈
    >>|cRXP_WARN_尽量趁等待飞艇等事项的空档制作这些物品|r
    .train 3273 >>学习 |T135966:0|t[急救]
    .target 妮拉
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗·德沃尔|r交谈。
    .vendor >> 出售杂物。如果卖掉武器后就能买得起|T135641:0|t[卷刃的剑]（4银01铜），可以卖掉它；钱仍不够就稍后再来。
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗|r|cRXP_BUY_交谈，向他购买|r |T135641:0|t[卷刃的剑]|cRXP_BUY_。|r
    .collect 2494,1,426,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #optional
    #completewith NewPlague1
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Warrior
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗·德沃尔|r交谈。
    .vendor >> 出售杂物。如果卖掉武器后就能买得起|T135321:0|t[步兵剑]（5银36铜），可以卖掉它；钱仍不够就稍后再来。
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗|r|cRXP_BUY_交谈，向他购买|r |T135321:0|t[步兵剑]|cRXP_BUY_。|r
    .collect 2488,1,426,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #optional
    #completewith NewPlague1
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << skip
    #hardcore
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_初级药剂师霍兰德|r（在墓地附近巡逻）交谈。
    .turnin 5481 >>交任务：葛尔多的任务
    .accept 5482 >>接受任务：末日草
    .target 初级药剂师霍兰德
step << Warrior
    #season 2
    #xprate <1.5
    #completewith DuskbatTrophy1
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_被砍下的蝙蝠的头|r。
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
step
    #xprate <1.5
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_毛皮|r。
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step
    #xprate <1.5
    #loop
    .goto Tirisfal Glades,58.20,58.15,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    >>击杀|cRXP_ENEMY_黑暗犬|r，拾取|cRXP_LOOT_血液|r。
    .complete 367,1 --Darkhound Blood (5)
    .mob 衰老的黑暗犬
step << Rogue/Warrior
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_毛皮|r。
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .xp >7+3960,1
step << Rogue/Warrior
    #xprate <1.5
    #optional
    #label DuskbatTrophy1
    #loop
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .xp 7+3260 >> 刷怪至3260+/4500。
--XX 700 (375)+540 (367)
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_毛皮|r。
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .xp >7+3690,1
step
    #xprate >1.49
    #optional
    #label DuskbatTrophy1
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .xp 7+2640 >> 刷怪至2640+/4500。
--XX 700 (375)+540 (367)
step
    #xprate <1.5
    #hardcore
    #completewith NewPlague1
    .subzone 159 >> 返回布瑞尔。
    .subzoneskip 159
step
    #xprate <1.5
    #softcore
    #completewith NewPlague1
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #label NewPlague1
    #optional
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .turnin 367 >>交任务：新的瘟疫
    .accept 368 >>接受任务 新的瘟疫
    .target 药剂师乔汉
step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵伯吉斯|r交谈，查看|cRXP_PICK_通缉告示|r，并与建筑内的|cRXP_FRIENDLY_执政官塞弗伦|r交谈。
    .accept 374 >>接受任务：死亡证明
    .target +亡灵卫兵伯吉斯
    .goto Tirisfal Glades,60.93,52.01
    .accept 398 >>接受任务：悬赏：蛆眼
    .goto Tirisfal Glades,60.74,51.52
    .accept 358 >>接受任务：盗墓贼
    .target +执政官塞弗伦
    .goto Tirisfal Glades,61.26,50.84
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_购买一卷|r |T132891:0|t[粗线]|cRXP_BUY_（从她那里）|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step << Priest
    #xprate <1.5
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师贝里尔|r（二楼）交谈。
	.train 139 >> 学习职业技能。
    .target 黑暗牧师贝里尔
    .xp <8,1
step << Mage
    #xprate <1.5
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·火歌|r（二楼）交谈。
    .train 205 >> 学习职业技能。
    .target 凯恩·火歌
    .xp <8,1
step << Warrior
    #xprate <1.5
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔·德·蒙|r交谈。
    .train 284 >> 学习职业技能。
    .target 奥斯蒂尔·德·蒙
    .xp <8,1
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r（二楼）交谈。
    .train 6760 >> 学习职业技能。
    .target 马里恩·考尔
    .xp <8,1
step << Warlock
    #xprate <1.5
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈。
    .train 980 >> 学习职业技能。
    .target 鲁伯特·鲍什::2127
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗·德沃尔|r交谈。
    .vendor >> 出售杂物。如果卖掉武器后就能买得起|T135641:0|t[卷刃的剑]（4银01铜），可以卖掉它；钱仍不够就稍后再来。
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗|r|cRXP_BUY_交谈，向他购买|r |T135641:0|t[卷刃的剑]|cRXP_BUY_。|r
    .collect 2494,1,398,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #xprate <1.5
    #optional
    #completewith Doomweed
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Warrior
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗·德沃尔|r交谈。
    .vendor >> 出售杂物。如果卖掉武器后就能买得起|T135321:0|t[步兵剑]（5银36铜），可以卖掉它；钱仍不够就稍后再来。
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗|r|cRXP_BUY_交谈，向他购买|r |T135321:0|t[步兵剑]|cRXP_BUY_。|r
    .collect 2488,1,398,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #xprate <1.5
    #optional
    #completewith Doomweed
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Rogue
    #season 2
    #completewith MaggotEye
    >>施放|T133644:0|t[搜索]并击杀|cRXP_ENEMY_腐皮豺狼人|r，拾取|T134327:0|t[|cRXP_LOOT_左下角地图碎片|r]。
    .collect 208038,1 --Bottom-Left Map Piece (1)
    .mob 混血腐皮豺狼人
    .mob 腐皮豺狼人
    .mob 腐皮盗墓贼
    .train 400095,1
step << Warrior
    #season 2
    #completewith MaggotEye
    >>击杀任意类型的|cRXP_ENEMY_腐皮豺狼人|r，拾取|cRXP_LOOT_被砍下的豺狼人头|r
    .collect 204478,1 --Severed Gnoll Head (1)
    .mob 混血腐皮豺狼人
    .mob 腐皮豺狼人
    .mob 腐皮盗墓贼
    .train 403475,1
step << skip
    #completewith next
    >>拾取地上的|cRXP_LOOT_末日草|r
    >>|cRXP_WARN_它们位于豺狼人区域的树木附近。|r
    .complete 5482,1 --Doom Weed (10)
    .isOnQuest 5482
step
    #loop
    .goto Tirisfal Glades,55.24,42.54,0
    .goto Tirisfal Glades,56.31,39.67,40,0
    .goto Tirisfal Glades,54.71,41.19,40,0
    .goto Tirisfal Glades,53.90,43.93,40,0
    .goto Tirisfal Glades,55.24,42.54,40,0
    .goto Tirisfal Glades,56.43,43.92,40,0
    >>击杀|cRXP_ENEMY_腐皮盗墓贼|r，拾取|cRXP_LOOT_防腐剂|r。
    .complete 358,1 --Rot Hide Graverobber (8)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob 腐皮盗墓贼
step
    #completewith next
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r，拾取|cRXP_LOOT_防腐剂|r。
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob 混血腐皮豺狼人
step << skip
    #label Doomweed
    #loop
    .goto Tirisfal Glades,57.48,35.95,0
    .goto Tirisfal Glades,57.68,34.37,30,0
    .goto Tirisfal Glades,57.45,35.96,30,0
    .goto Tirisfal Glades,56.79,37.79,30,0
    .goto Tirisfal Glades,56.05,38.76,30,0
    .goto Tirisfal Glades,55.09,38.74,30,0
    .goto Tirisfal Glades,55.25,40.16,30,0
    .goto Tirisfal Glades,54.68,42.12,30,0
    .goto Tirisfal Glades,55.29,41.51,30,0
    .goto Tirisfal Glades,56.58,41.99,30,0
    .goto Tirisfal Glades,58.29,42.93,30,0
    .goto Tirisfal Glades,58.83,40.68,30,0
    .goto Tirisfal Glades,58.36,38.55,30,0
    .goto Tirisfal Glades,57.48,35.95,30,0
    >>拾取地上的|cRXP_LOOT_末日草|r
    >>|cRXP_WARN_它们位于豺狼人区域的树木附近。|r
    .complete 5482,1 --Doom Weed (10)
    .isOnQuest 5482
step
    #optional
    #label Doomweed
step << Mage
    #season 2
    #optional
    #completewith MaggotEye
    .goto Tirisfal Glades,59.84,33.17,0
    .goto Tirisfal Glades,58.38,35.28,0
    .goto Tirisfal Glades,60.09,37.01,0
    >>施放|T136071:0|t[变形术]，目标为|cRXP_ENEMY_古怪的甜瓜|r。
    >>拾取地上的 |T134332:0|t[|cRXP_LOOT_药剂师笔记|r]
    .collect 208183,6 --Apothecary Notes (6)
    .mob 古怪的甜瓜
    .train 415942,1
    .train 118,3
step
    #completewith MaggotEye
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r，拾取|cRXP_LOOT_防腐剂|r。
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob 混血腐皮豺狼人
step
    #label MaggotEye
    .goto Tirisfal Glades,58.66,30.77
    >>击杀|cRXP_ENEMY_蛆眼|r，拾取|cRXP_LOOT_爪子|r。
    .complete 398,1 --Maggot Eye's Paw (1)
    .mob 蛆眼
step
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r，拾取|cRXP_LOOT_防腐剂|r。
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob 混血腐皮豺狼人
step
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>击杀|cRXP_ENEMY_腐皮豺狼人|r，拾取|cRXP_LOOT_防腐剂|r。
    .complete 358,3 --Embalming Ichor (8)
    .mob 混血腐皮豺狼人
    .mob 腐皮豺狼人
    .mob 腐皮盗墓贼
step << Rogue
    #season 2
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>施放|T133644:0|t[搜索]并击杀|cRXP_ENEMY_腐皮豺狼人|r，拾取|T134327:0|t[|cRXP_LOOT_左下角地图碎片|r]。
    .collect 208038,1 --Bottom-Left Map Piece (1)
    .mob 混血腐皮豺狼人
    .mob 腐皮盗墓贼
    .mob 腐皮豺狼人
    .train 400095,1
step << Warrior
    #season 2
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>击杀任意类型的|cRXP_ENEMY_腐皮豺狼人|r，拾取|cRXP_LOOT_被砍下的豺狼人头|r
    .collect 204478,1 --Severed Gnoll Head (1)
    .mob 混血腐皮豺狼人
    .mob 腐皮豺狼人
    .mob 腐皮盗墓贼
    .train 403475,1
step << Mage
    #xprate >2.09
    #season 2
    #loop
    .goto Tirisfal Glades,59.84,33.17,0
    .goto Tirisfal Glades,58.38,35.28,0
    .goto Tirisfal Glades,60.09,37.01,0
    .goto Tirisfal Glades,59.84,33.17,40,0
    .goto Tirisfal Glades,58.38,35.28,40,0
    .goto Tirisfal Glades,60.09,37.01,40,0
    >>施放|T136071:0|t[变形术]，目标为|cRXP_ENEMY_古怪的甜瓜|r。
    >>拾取地上的 |T134332:0|t[|cRXP_LOOT_药剂师笔记|r]
    .collect 208183,6 --Apothecary Notes (6)
    .mob 古怪的甜瓜
    .train 415942,1
    .train 118,3
step << Mage
    #xprate >2.09
    #season 2
    >>|cRXP_WARN_使用|r |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r|cRXP_WARN_制作|r |T134332:0|t|cRXP_LOOT_[法术笔记：启迪]|r
    .collect 203749,1 --Spell Notes: Enlightenment (1)
    .use 208183 --Apothecary Notes
    .train 415942,1
    .itemcount 208183,6
step << Mage
    #xprate >2.09
    #season 2
    .train 415942 >>|cRXP_WARN_使用|r |T134332:0|t|cRXP_LOOT_[法术笔记：启迪]|r|cRXP_WARN_学习|r |T133815:0|t[铭刻胸甲：启迪]
    .use 203749
    .itemcount 203749,1 --Spell Notes: Enlightenment (1)
step << Warrior
    #season 2
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
    >>击杀|cRXP_ENEMY_邪鳍鱼人|r，拾取|cRXP_LOOT_鳞片|r和一颗|cRXP_LOOT_被砍下的鱼人的头|r。
    .complete 368,1 --Vile Fin Scale (5)
    .collect 204477,1 --Severed Murloc Head (1)
    .mob 邪鳍污水鱼人
    .mob 邪鳍先知
    .mob 邪鳍泥浆鱼人
    .train 403475,1
step << Rogue
    #season 2
    #completewith MurlocVins
    >>施放 |T133644:0|t[搜索]并击杀|cRXP_ENEMY_邪鳍鱼人|r，以获取 |T134241:0|t[|cRXP_LOOT_船只残骸宝箱钥匙|r]
    .collect 208007,1 --Shipwreck Cache Key (1)
    .train 400081,1
step << Rogue
    #season 2
    #completewith RuneofPrecision
    >>施放 |T133644:0|t[搜索]并击杀|cRXP_ENEMY_邪鳍鱼人|r，拾取掉落的 |T134327:0|t[|cRXP_LOOT_右下角地图碎片|r]
    .collect 208037,1 --Bottom-Right Map Piece (1)
    .train 400095,1
step
    #label MurlocVins
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
    >>击杀|cRXP_ENEMY_邪鳍鱼人|r，拾取掉落的|cRXP_LOOT_鳞片|r
    .complete 368,1 --Vile Fin Scale (5)
    .mob 邪鳍污水鱼人
    .mob 邪鳍先知
    .mob 邪鳍泥浆鱼人
step << Rogue
    #season 2
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
    >>施放 |T133644:0|t[搜索]并击杀|cRXP_ENEMY_邪鳍鱼人|r，以获取 |T134241:0|t[|cRXP_LOOT_船只残骸宝箱钥匙|r]
    .collect 208007,1 --Shipwreck Cache Key (1)
    .mob 邪鳍污水鱼人
    .mob 邪鳍先知
    .mob 邪鳍泥浆鱼人
    .train 400081,1
step << Rogue
    #season 2
    .goto Tirisfal Glades,66.66,24.41
    >>开启|cRXP_PICK_沉船宝箱|r，获得 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 204174,1 --Rune of Precision (1)
    .train 400081,1
step << Rogue
    #season 2
    #label RuneofPrecision
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_学习|r |T135610:0|t[正中眉心]
    .use 204174
    .itemcount 204174,1
step << Rogue
    #season 2
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
    >>施放 |T133644:0|t[搜索]并击杀|cRXP_ENEMY_邪鳍鱼人|r，拾取掉落的 |T134327:0|t[|cRXP_LOOT_右下角地图碎片|r]
    .collect 208037,1 --Bottom-Right Map Piece (1)
    .mob 邪鳍污水鱼人
    .mob 邪鳍先知
    .mob 邪鳍泥浆鱼人
    .train 400095,1
step << Rogue
    #season 2
    .use 208036 >>|cRXP_WARN_使用|r |T134327:0|t[|cRXP_LOOT_地图碎片|r]|cRXP_WARN_合成|r |T134269:0|t[|cRXP_LOOT_提瑞斯法藏宝图|r]
    .collect 208034,1 --Tirisfal Treasure Map (1)
    .train 400095,1
step
    #hardcore
    #completewith MurlocTurnins
    .subzone 159 >> 返回布瑞尔。
    .subzoneskip 159
step
    #softcore
    #completewith MurlocTurnins
    .goto Tirisfal Glades,64.50,29.41
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    >>|cRXP_WARN_确保死在箭头所指位置，或其西侧。|r
step << skip
    #label DoomedWeed
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_初级药剂师霍兰德|r（在墓地附近巡逻）交谈。
    .turnin 5482 >>交任务：末日草
    .target 初级药剂师霍兰德
step << Rogue
    #season 2
    .goto Tirisfal Glades,52.89,54.03
    .use 208034 >>|cRXP_WARN_在桥下使用|r |T134269:0|t[|cRXP_LOOT_提瑞斯法藏宝图|r]|cRXP_WARN_。|r
    >>打开出现的|cRXP_PICK_埋藏的宝藏|r宝箱，获得 |T134419:0|t[|cRXP_FRIENDLY_速射符文|r]
    .collect 203991,1 --Rune of Quick Draw (1s)
    .train 400095,1
step << Rogue
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_速射符文|r]|cRXP_WARN_学习|r |T134536:0|t[速射]
    .use 203991
    .itemcount 203991,1
step
    #label MurlocTurnins
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r、|cRXP_FRIENDLY_塞加德|r和|cRXP_FRIENDLY_塞弗伦|r交谈
    .turnin 368 >>交任务：新的瘟疫
    .accept 369 >>接受任务 新的瘟疫
    .target +药剂师乔汉
    .goto Tirisfal Glades,59.45,52.40
    .turnin 398 >>交任务：悬赏：蛆眼
    .target +执行官塞加德
    .goto Tirisfal Glades,60.58,51.77
    .turnin 358 >>交任务：盗墓贼
    .accept 405 >>接受任务：流浪的巫妖 << Warlock
    .accept 359 >>接受任务：亡灵卫兵的职责
    .target +执政官塞弗伦
    .goto Tirisfal Glades,61.26,50.84
step
    #label MurlocTurnins
    #xprate >2.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r、|cRXP_FRIENDLY_塞加德|r和|cRXP_FRIENDLY_塞弗伦|r交谈
    .turnin 368 >>交任务：新的瘟疫
    .target +药剂师乔汉
    .goto Tirisfal Glades,59.45,52.40
    .turnin 398 >>交任务：悬赏：蛆眼
    .target +执行官塞加德
    .goto Tirisfal Glades,60.58,51.77
    .turnin 358 >>交任务：盗墓贼
    .accept 405 >>接受任务：流浪的巫妖 << Warlock
    .target +执政官塞弗伦
    .goto Tirisfal Glades,61.26,50.84
step
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_购买一卷|r |T132891:0|t[粗线]|cRXP_BUY_（从她那里）|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼|r交谈
    .accept 354 >>接受任务：阿加曼德家族
    .accept 362 >>接受任务：闹鬼的磨坊
    .target 库勒曼·法席恩
step << !Warlock
    #xprate >1.49
    #optional
    #completewith AgamandStart
    .abandon 405 >> 放弃任务：流浪的巫妖
step
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师贝里尔|r（二楼）交谈。
	.train 139 >> 学习职业技能。
    .target 黑暗牧师贝里尔
    .xp <8,1
    .xp >10,1
step << Priest
    #optional
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师贝里尔|r（二楼）交谈。
	.train 8092 >> 学习职业技能。
    .target 黑暗牧师贝里尔
    .xp <10,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·火歌|r（二楼）交谈。
    .train 205 >> 学习职业技能。
    .target 凯恩·火歌
    .xp <8,1
    .xp >10,1
step << Mage
    #optional
    .goto Tirisfal Glades,61.96,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·火歌|r交谈。
    --.accept 1881 >> Accept Speak with Anastasia
    .train 122 >> 学习职业技能。
    .target 凯恩·火歌
    .xp <10,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔·德·蒙|r交谈。
    .train 284 >> 学习职业技能。
    .target 奥斯蒂尔·德·蒙
    .xp <8,1
    .xp >10,1
step << Warrior
    #optional
    .abandon 1505 >>放弃任务：老兵犹塞克
    .isOnQuest 1505
step << Warrior
    #optional
    .abandon 1498 >>放弃任务：防御之道
    .isOnQuest 1498
step << Warrior
    #optional
    .goto Tirisfal Glades,61.85,52.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔·德·蒙|r交谈。
    .trainer >> 学习职业技能。
    .accept 1818 >> 接受任务：迪林格尔
    .target 奥斯蒂尔·德·蒙
    .xp <10,1
    .isQuestAvailable 1498
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r（二楼）交谈。
    .train 6760 >> 学习职业技能。
    .target 马里恩·考尔
    .xp <8,1
    .xp >10,1
step << Rogue
    #optional
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r交谈。
    .train 674 >> 学习职业技能。
    --.accept 1885 >> Accept Mennet Carkad
    .target 马里恩·考尔
    .xp <10,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r（二楼）交谈。
    .train 980 >> 学习职业技能。
    .target 鲁伯特·鲍什
    .xp <8,1
    .xp >10,1
step << Warlock
    #optional
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈。
    .train 707 >> 学习职业技能。
    .target 鲁伯特·鲍什
    .xp <10,1
step << Warlock
    #optional
    .goto Tirisfal Glades,61.62,52.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃格隆·卡加尔|r（二楼）交谈。
    .accept 1478 >> 接受任务：哈加尔的召唤
    .target 埃格隆·卡加尔
    .xp <10,1
step << Warlock
    #xprate >2.09
    .goto Tirisfal Glades,61.62,52.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃格隆·卡加尔|r（二楼）交谈。
    .accept 1478 >> 接受任务：哈加尔的召唤
    .target 埃格隆·卡加尔
step << Rogue/Warrior
    .goto Tirisfal Glades,61.81,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_妮拉|r交谈
    >>|cRXP_WARN_尽量趁等待飞艇等事项的空档制作这些物品|r
    .train 3273 >>学习 |T135966:0|t[急救]
    .target 妮拉
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗·德沃尔|r交谈。
    .vendor >> 出售杂物。如果卖掉武器后就能买得起|T135641:0|t[卷刃的剑]（4银01铜），可以卖掉它；钱仍不够就稍后再来。
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗|r|cRXP_BUY_交谈，向他购买|r |T135641:0|t[卷刃的剑]|cRXP_BUY_。|r
    .collect 2494,1,354,1 --Collect Stiletto (1)
    .money <0.0401
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
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗·德沃尔|r交谈。
    .vendor >> 出售杂物。如果卖掉武器后就能买得起|T135321:0|t[步兵剑]（5银36铜），可以卖掉它；钱仍不够就稍后再来。
    .target 奥利弗·德沃尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗|r|cRXP_BUY_交谈，向他购买|r |T135321:0|t[步兵剑]|cRXP_BUY_。|r
    .collect 2488,1,354,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #optional
    #completewith MillsOverun
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈。
    >>|cRXP_BUY_购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_（向她购买）。|r << Mage/Priest
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_（向她购买）。|r <<Warrior/Rogue
    >>|cRXP_BUY_购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_（向她购买）。|r << Warlock
    .vendor >> 出售杂物。
    .collect 1179,20,426,1 << Mage/Priest --Ice Cold Milk (20)
    .collect 4605,20,426,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,10,426,1 << Warlock --Ice Cold Milk (10)
    .collect 4605,10,426,1 << Warlock --Red-speckled Mushroom (10)
    .money <0.05
    .target 旅店老板瑞尼
step << Rogue/Warrior
    #softcore
    .goto Tirisfal Glades,60.31,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莉莎·考伦|r交谈。
    .vendor >>修理武器。
    .target 伊莉莎·考伦
step << Warrior
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈。
    .turnin 1818 >> 交任务：迪林格尔
    .accept 1819 >> 接受任务：切割者奥拉格
    .target 亡灵卫兵迪林格尔
    .isOnQuest 1818
step << Warrior
    #optional
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈。
    .accept 1819 >> 接受任务：切割者奥拉格
    .target 亡灵卫兵迪林格尔
    .isQuestTurnedIn 1818
    .isQuestAvailable 1498
step << Warrior
    .goto Tirisfal Glades,59.16,48.51
    >>|cRXP_WARN_点击地面上的骷髅头，以召唤|r|cRXP_ENEMY_切割者奥拉格|r。|cRXP_WARN_击杀他|r
    .complete 1819,1 --Ulag the Cleaver (1)
    .mob 切割者奥拉格
    .isQuestTurnedIn 1818
    .isQuestAvailable 1498
step << Warrior
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈。
    .turnin 1819 >> 交任务：切割者奥拉格
    .accept 1820 >> 接受任务：库勒曼
    .target 亡灵卫兵迪林格尔
    .isQuestTurnedIn 1818
    .isQuestAvailable 1498
step
    #optional
    #label Brill3
    --150% route does Agamand Mills after UC
step << Warrior
    #xprate <2.1
    #season 2
    #completewith AgamandStart
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_被砍下的蝙蝠的头|r。
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
step
    #xprate <2.1
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_毛皮|r。
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step
    #xprate <2.1
    #label AgamandStart
    .goto Tirisfal Glades,47.60,44.03,100,0
    .goto Tirisfal Glades,47.37,43.71
    .subzone 157 >> 向西北方前往阿加曼德磨坊。
    .isOnQuest 362
step
    #xprate <2.1
    #completewith ThurmanGregor
    >>|T134939:0|t[|cRXP_LOOT_给伊维特的信|r]|cRXP_WARN_可能从这些敌人身上掉落。掉落后便接取任务。|r
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >> 接受任务：未寄出的信件
    .use 2839
step
    #xprate <2.1
    #completewith ThurmanGregor
    #label MillsOverun
    >>击杀|cRXP_ENEMY_士兵|r和|cRXP_ENEMY_骷髅法师|r，拾取|cRXP_LOOT_肋骨|r和|cRXP_LOOT_颅骨|r。
    .complete 426,1 --Notched Rib (5)
    .mob +断骨士兵
    .mob +碎颅士兵
    .complete 426,2 --Blackened Skull (3)
    .mob +暗眼骷髅法师
step
    #xprate <2.1
    #label KillDevlin
    .goto Tirisfal Glades,47.34,40.78
    >>击杀|cRXP_ENEMY_代弗林·阿加曼德|r，拾取|cRXP_LOOT_遗骸|r。
    .complete 362,1 --Devlin's Remains (1)
    .mob 代弗林·阿加曼德
step
    #xprate <2.1
    .goto Tirisfal Glades,49.34,36.02
    >>击杀|cRXP_ENEMY_妮萨·阿加曼德|r，拾取她的|cRXP_LOOT_遗骸|r。她可能在建筑内。
    .complete 354,2 --Nissa's Remains (1)
    .mob 妮萨·阿加曼德
step
    #xprate <2.1
    #label ThurmanGregor
    #loop
    .goto Tirisfal Glades,45.08,31.15,0
    .goto Tirisfal Glades,43.71,35.25,60,0
    .goto Tirisfal Glades,45.03,30.99,60,0
    .goto Tirisfal Glades,46.79,29.80,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,45.08,31.15,60,0
    >>击杀|cRXP_ENEMY_萨尔曼·阿加曼德|r和|cRXP_ENEMY_格里高·阿加曼德|r，拾取他们的|cRXP_LOOT_遗骸|r。他们会四处巡逻。
    .complete 354,3 --Thurman's Remains (1)
    .unitscan +萨尔曼·阿加曼德
    .complete 354,1 --Gregor's Remains (1)
    .unitscan +格里高·阿加曼德
step
    #xprate <2.1
    #loop
    .goto Tirisfal Glades,45.08,31.15,0
    .goto Tirisfal Glades,43.71,35.25,60,0
    .goto Tirisfal Glades,45.03,30.99,60,0
    .goto Tirisfal Glades,46.79,29.80,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,45.08,31.15,60,0
    >>击杀|cRXP_ENEMY_士兵|r和|cRXP_ENEMY_骷髅法师|r，拾取|cRXP_LOOT_肋骨|r和|cRXP_LOOT_颅骨|r。
    .complete 426,1 --Notched Rib (5)
    .mob +断骨士兵
    .mob +碎颅士兵
    .complete 426,2 --Blackened Skull (3)
    .mob +暗眼骷髅法师
step << skip
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    >>击杀|cRXP_ENEMY_士兵|r和|cRXP_ENEMY_骷髅法师|r，拾取|T134939:0|t[|cRXP_LOOT_给伊维特的信|r]。
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >> 接受任务：未寄出的信件
    .use 2839
    .mob 断骨士兵
    .mob 暗眼骷髅法师
    .mob 碎颅士兵
    .xp >9+4320,1
    .isQuestTurnedIn 375
--XX 880(426)+480(361, OPT)+880(354)+420(362)+700(375, OPT)
step << skip
    #xprate >1.49
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    >>击杀|cRXP_ENEMY_士兵|r和|cRXP_ENEMY_骷髅法师|r，拾取|T134939:0|t[|cRXP_LOOT_给伊维特的信|r]。
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >> 接受任务：未寄出的信件
    .use 2839
    .mob 断骨士兵
    .mob 暗眼骷髅法师
    .mob 碎颅士兵
    .xp >9+2180,1
    .isOnQuest 375
--XX 880(426)+480(361, OPT)+880(354)+420(362)+700(375, OPT)
step << skip
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    >>击杀|cRXP_ENEMY_士兵|r和|cRXP_ENEMY_骷髅法师|r，拾取|T134939:0|t[|cRXP_LOOT_给伊维特的信|r]。
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >> 接受任务：未寄出的信件
    .use 2839
    .mob 断骨士兵
    .mob 暗眼骷髅法师
    .mob 碎颅士兵
    .xp >9+3230,1
    .isQuestTurnedIn 375
--XX 880(426)+480(361, OPT)+880(354)+420(362)+700(375, OPT)
step << skip
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+3620 >> 刷怪至3620+/6500经验。
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isOnQuest 375
step << skip
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+4320 >> 刷怪至4320+/6500经验。
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isQuestTurnedIn 375
step << skip
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+3840 >> 刷怪至3840+/6500经验。
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isQuestTurnedIn 375
step << skip
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+3140 >> 刷怪至3140+/6500经验。
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isOnQuest 375
step << skip
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+2180 >> 刷怪至2180+/6500经验。
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isOnQuest 375
step << skip
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+3230 >> 刷怪至3230+/6500经验。
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isQuestTurnedIn 375
step << skip
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+2510 >> 刷怪至2510+/6500经验。
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isQuestTurnedIn 375
step << skip
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+1460 >> 刷怪至1460+/6500经验。
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isOnQuest 375
step << Mage/Priest
    #xprate <2.1
    #season 2
    >>击杀|cRXP_ENEMY_Gillgar|r，拾取 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI（寒冰指）|r] << Mage
    >>击杀|cRXP_ENEMY_Gillgar|r，拾取 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] << Priest
    .collect 203753,1 << Mage --Spell Notes: RING SEFF OSTROF (1)
    .collect 205940,1 << Priest --Memory of a Dark Purpose (1)
    .mob Gillgar
    .train 401765,1 << Mage
    .train 425216,1 << Priest
    .goto Tirisfal Glades,25.60,48.20
step << Mage
    #optional
    #completewith Conscript
    #xprate <2.1
    #season 2
    .collect 211779,1 >>若持有理解魔符，现在可解读笔记；否则继续路线，稍后在奥格瑞玛向施法材料商购买。
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI（寒冰指）|r] |cRXP_WARN_学习|r |T236227:0|t[寒冰指]
    .use 203753
    .itemcount 203753,1
    .train 401765,1
step << skip
    #xprate <1.5
    #hardcore
    #completewith FoodandWater2
    .hs >> 炉石回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,>0,1
    .bindlocation 2119,1
step << skip
    #xprate <1.5
    #hardcore
    #completewith FoodandWater2
    .subzone 159 >> 返回布瑞尔。
    .subzoneskip 159
    .cooldown item,6948,<0
step
    #xprate <2.1
    #hardcore
    #completewith FoodandWater2
    .subzone 159 >> 返回布瑞尔。
    .subzoneskip 159
step
    #xprate <2.1
    #softcore
    #completewith FoodandWater2
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #xprate <2.1
    .goto Tirisfal Glades,58.20,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪林格尔|r交谈
    .turnin 426 >>交任务：磨坊告急
    .target 亡灵卫兵迪林格尔
step
    #xprate <2.1
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_购买一卷|r |T132891:0|t[粗线]|cRXP_BUY_（从她那里）|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊维特|r和|cRXP_FRIENDLY_库勒曼|r交谈
    .turnin 361 >>交任务：未寄出的信件
    .target +伊维特·法席恩
    .goto Tirisfal Glades,61.58,52.60
    .turnin 354 >>交任务：阿加曼德家族
    .turnin 362 >>交任务：闹鬼的磨坊
    .accept 355 >>接受任务：与塞弗伦交谈
    .target +库勒曼·法席恩
    .goto Tirisfal Glades,61.72,52.29
    .isOnQuest 361
step
    #xprate <2.1
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼|r交谈
    .turnin 354 >>交任务：阿加曼德家族
    .turnin 362 >>交任务：闹鬼的磨坊
    .turnin 1820 >>交任务：库勒曼 << Warrior
    .accept 355 >>接受任务：与塞弗伦交谈
    .target 库勒曼·法席恩
    .isQuestTurnedIn 1819 << Warrior
step << Warrior
    #xprate <2.1
    #optional
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼|r交谈
    .turnin 354 >>交任务：阿加曼德家族
    .turnin 362 >>交任务：闹鬼的磨坊
    .accept 355 >>接受任务：与塞弗伦交谈
    .target 库勒曼·法席恩
step
    #xprate <2.1
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step << Priest
    #xprate <2.1
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师贝里尔|r（二楼）交谈。
	.trainer >> 学习职业技能。
    .target 黑暗牧师贝里尔
step << Warrior
    #xprate <2.1
    #optional
    .abandon 1505 >>放弃任务：老兵犹塞克
    .isOnQuest 1505
step << Warrior
    #xprate <2.1
    #optional
    .abandon 1498 >>放弃任务：防御之道
    .isOnQuest 1498
step << Warrior
    #xprate <2.1
    .goto Tirisfal Glades,61.85,52.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔·德·蒙|r交谈。
    .train 2687 >> 学习职业技能。
    .accept 1818 >> 接受任务：迪林格尔
    .target 奥斯蒂尔·德·蒙 << Warrior
    .xp >12,1
step << Warrior
    #xprate <2.1
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔·德·蒙|r交谈。
    .train 7384 >>学习|T132223:0|t[压制]。
    .accept 1818 >> 接受任务：迪林格尔
    .target 奥斯蒂尔·德·蒙
    .xp <12,1
step << Warlock
    #xprate <2.1
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈。
    .train 707 >> 学习职业技能。
    .target 鲁伯特·鲍什
    .xp <10,1
    .xp >12,1
step << Warlock
    #xprate <2.1
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈。
    .train 755 >> 学习职业技能。
    .target 鲁伯特·鲍什
    .xp <12,1
step << Warlock
    #xprate <2.1
    .goto Tirisfal Glades,61.62,52.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃格隆·卡加尔|r（旅店内）交谈。
    .accept 1478 >> 接受任务：哈加尔的召唤
    .target 埃格隆·卡加尔
step << Rogue
    #xprate <2.1
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r交谈。
    .train 674 >> 学习职业技能。
    --.accept 1885 >> Accept Mennet Carkad
    .target 马里恩·考尔
    .xp <10,1
    .xp >12,1
step << Rogue
    #xprate <2.1
    #optional
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r交谈。
    .train 1766 >> 学习职业技能。
    --.accept 1885 >> Accept Mennet Carkad
    .target 马里恩·考尔
    .xp <12,1
step << Mage
    #xprate <2.1
    .goto Tirisfal Glades,61.96,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·火歌|r（旅店内）交谈。
    .accept 1881 >> 接受任务：安娜斯塔西娅
    .target 凯恩·火歌
step
    #xprate <2.1
    #label FoodandWater2
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈。
    >>|cRXP_BUY_购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_（向她购买）。|r << Mage/Priest/Shaman
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_（向她购买）。|r <<Warrior/Rogue
    >>|cRXP_BUY_购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_（向她购买）。|r << Warlock
    .vendor >> 出售杂物。
    .collect 1179,20,370,1 << Mage/Priest/Shaman --Ice Cold Milk (20)
    .collect 4605,20,370,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,15,370,1 << Warlock --Ice Cold Milk (15)
    .collect 4605,15,370,1 << Warlock --Red-speckled Mushroom (15)
    .money <0.075 << Warlock
    .money <0.05 << !Warlock
    .target 旅店老板瑞尼
step << Warrior
    #xprate <2.1
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈。
    .turnin 1818 >> 交任务：迪林格尔
    .accept 1819 >> 接受任务：切割者奥拉格
    .target 亡灵卫兵迪林格尔
step << Warrior
    #xprate <2.1
    .goto Tirisfal Glades,59.16,48.51
    >>|cRXP_WARN_点击地面上的骷髅头，以召唤|r|cRXP_ENEMY_切割者奥拉格|r。|cRXP_WARN_击杀他|r
    .complete 1819,1 --Ulag the Cleaver (1)
    .mob 切割者奥拉格
step << Warrior
    #xprate <2.1
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈。
    .turnin 1819 >> 交任务：切割者奥拉格
    .accept 1820 >> 接受任务：库勒曼
    .target 亡灵卫兵迪林格尔
step << Warlock
    #completewith next
    .goto Tirisfal Glades,61.80,65.06,20 >> 进入幽暗城。
    .zoneskip Undercity
step << Warlock
    #completewith next
    .goto Undercity,66.09,20.06,35,0
    .goto Undercity,64.37,23.94,35,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >> 乘升降梯下到幽暗城。
step << Warlock
    .goto Undercity,85.07,25.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯伦丁·哈加尔|r（魔法区）交谈。
    .turnin 1478 >> 交任务：哈加尔的召唤
    .accept 1473 >> 接任务: 虚空中的生物
    .target 凯伦丁·哈加尔
step << Warlock
    .goto Undercity,47.25,39.12,50,0
    .goto Undercity,46.35,43.86,10,0
    .goto Undercity,45.24,39.35,10,0
    .goto Undercity,41.32,38.40,10,0
    .goto Undercity,40.74,33.95,10,0
    .goto Undercity,34.80,33.19,15,0
    .goto Undercity,27.39,30.23,35,0
    .goto Undercity,21.89,43.35,35,0
    .goto Tirisfal Glades,51.10,71.53,50,0
    .zone Tirisfal Glades >> 从下水道离开幽暗城。
    .zoneskip Tirisfal Glades
step << Warrior
    #season 2
    #loop
    .goto Tirisfal Glades,55.14,62.01,0
    .goto Tirisfal Glades,56.90,58.25,60,0
    .goto Tirisfal Glades,55.14,62.01,60,0
    .goto Tirisfal Glades,52.36,62.93,60,0
    .goto Tirisfal Glades,48.94,63.72,60,0
    .goto Tirisfal Glades,45.17,62.11,60,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_被砍下的蝙蝠的头|r。
    .collect 207975,1 --Severed Bat Head (1)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .train 403475,1
step << Rogue
    #season 2
    #completewith ScarletCrusade1
    >>使用 |T133644:0|t[搜索]对付|cRXP_ENEMY_派瑞恩队长|r，从他身上偷取 |T133385:0|t[|cRXP_LOOT_血色军官玺戒|r]
    .collect 208085,1 --Scarlet Lieutenant Signet Ring (1)
    .mob 派瑞恩队长
    .train 400094,1
step << Warlock
    #completewith next
    .goto Tirisfal Glades,51.06,67.57
    >>打开|cRXP_PICK_佩林的箱子|r，取出|T133733:0|t[埃加林的魔典]。
    .complete 1473,1 --Egalin's Grimoire (1)
step
    #label ScarletCrusade1
    #loop
	.goto Tirisfal Glades,50.07,68.87,40,0
	.goto Tirisfal Glades,50.23,66.94,40,0
	.goto Tirisfal Glades,51.16,65.73,40,0
	.goto Tirisfal Glades,51.75,66.04,40,0
	.goto Tirisfal Glades,52.93,67.62,40,0
	.goto Tirisfal Glades,52.72,69.33,40,0
	.goto Tirisfal Glades,51.96,69.57,40,0
	.goto Tirisfal Glades,51.03,69.55,40,0
    >>击杀|cRXP_ENEMY_派瑞恩队长|r、|cRXP_ENEMY_血色狂热者|r和|cRXP_ENEMY_血色传教士|r，拾取掉落的|cRXP_LOOT_血色十字军徽记之戒|r
    .complete 370,1 --Captain Perrine (1)
    .mob +派瑞恩队长
    .complete 370,2 --Scarlet Zealot (3)
    .mob +血色狂热者
    .complete 370,3 --Scarlet Missionary (3)
    .mob +血色传教士
    .complete 374,1 --Scarlet Insignia Ring (10)
    .disablecheckbox
step << Rogue
    #season 2
    .goto Tirisfal Glades,51.17,67.81
    >>使用 |T133644:0|t[搜索]对付|cRXP_ENEMY_派瑞恩队长|r，从他身上偷取 |T133385:0|t[|cRXP_LOOT_血色军官玺戒|r]
    .collect 208085,1 --Scarlet Lieutenant Signet Ring (1)
    .mob 派瑞恩队长
    .train 400094,1
step << Warlock
    .goto Tirisfal Glades,51.06,67.57
    >>打开地上的|cRXP_PICK_佩林的箱子|r，取出|T133733:0|t[埃加林的魔典]。
    .complete 1473,1 --Egalin's Grimoire (1)
step
    #xprate <1.5
    #completewith UCHome
    .goto Undercity,16.51,42.76,35,0
    .goto Undercity,22.98,39.76,35,0
    .goto Undercity,24.93,32.54,35,0
    .goto Undercity,34.78,33.24,10,0
    .goto Undercity,40.83,34.08,10,0
    .goto Undercity,41.35,38.40,10,0
    .goto Undercity,45.25,39.20,10,0
    .goto Undercity,45.67,43.60,10,0
    .zone Undercity >> 从下水道进入幽暗城。
    .zoneskip Undercity
step << !Mage
    #xprate >1.49
    #completewith LogoutSkip1
    .goto Undercity,16.51,42.76,35,0
    .goto Undercity,22.98,39.76,35,0
    .goto Undercity,24.93,32.54,35,0
    .goto Undercity,34.78,33.24,10,0
    .goto Undercity,40.83,34.08,10,0
    .goto Undercity,41.35,38.40,10,0
    .goto Undercity,45.25,39.20,10,0
    .goto Undercity,45.67,43.60,10,0
    .zone Undercity >> 从下水道进入幽暗城。
    .zoneskip Undercity
step << Priest
    .goto Undercity,48.98,18.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r交谈。
    .accept 5658 >> 接任务：虚弱之触
    .turnin 5658 >> 交任务：虚弱之触
    .target 艾萨莱斯特
    .train 2652,1 --Touch of Weakness not trained
step << Rogue
    .goto Undercity,57.29,32.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与军事区的|r|cRXP_FRIENDLY_阿基巴德|r交谈
    .train 201 >>学习单手剑（1h）技能。
    .target 阿基巴德
step << Warrior/Rogue
    .goto Undercity,56.06,37.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗姆·基里安|r交谈。
    .train 2575 >> 学习|T136248:0|t[采矿]。
    >>|cRXP_WARN_这能让你获得|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_（从矿脉中采集），用于制作|r|T135248:0|t[劣质磨刀石]|cRXP_WARN_（+2武器伤害，持续30分钟）。|r
    .target 布罗姆·基里安
step << Warrior/Rogue
    .goto Undercity,56.72,36.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎拉|r交谈
    >>|cRXP_BUY_购买|r|T134708:0|t[矿工锄]|cRXP_BUY_，商人为|r|cRXP_FRIENDLY_莎拉·基里安|r。
    .collect 2901,1,371,1 --Mining Pick (1)
    .target 莎拉·基里安
    .train 2575,3 --Mining Trained
 step << Warrior/Rogue
    .goto Undercity,60.17,29.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴兹尔·弗莱伊|r交谈。
    .train 2018 >> 学习|T136241:0|t[锻造]。
    .target 巴兹尔·弗莱伊
    .train 2575,3 --Mining Trained
step << Warrior
    #season 2
    .goto Undercity,48.03,70.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与幽暗城的|cRXP_FRIENDLY_多拉克·格瑞乌斯|r交谈
    >>交出收集到的|cRXP_LOOT_头颅|r，换取|T134455:0|t[符文碎片]。
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target 多拉克·格瑞乌斯
    .train 403475,1
step << Warrior
    #season 2
    #optional
    .use 204688 >>|cRXP_WARN_使用|r |T134455:0|t[符文碎片]|cRXP_WARN_制作|r |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step << Warrior
    #season 2
    .train 403475 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .use 204703
    .itemcount 204703,1
step << Priest/Warlock
    #xprate >1.49
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师雷克尔|r交谈
    >>|cRXP_BUY_购买|r|T135139:0|t[次级魔法杖]|cRXP_BUY_（在拍卖行购买）。|r << Priest
    >>|cRXP_BUY_购买|r|T135139:0|t[次级魔法杖]|cRXP_BUY_（可按需在拍卖行购买）。|r << Mage/Warlock
    >>|cRXP_WARN_若已购买魔杖，并且之前一直在收集|r |T132889:0|t[亚麻布]|cRXP_WARN_，现在可以在拍卖行出售|r |T132889:0|t[亚麻布]|cRXP_WARN_。|r << Priest
    >>|cRXP_WARN_如果不想购买或无法购买，跳过此步|r
    .collect 11287,1,435,1 << Priest/Mage/Warlock --Lesser Magic Wand (1)
    .target 拍卖师雷克尔
    .itemStat 18,QUALITY,<7 << Priest/Mage/Warlock
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3 << Priest/Mage/Warlock
--XX Intentional for priests on 1.5x xp to only do this if they don't have a lesser magic wand
step << skip
    #xprate >1.49
    #ah
    #optional
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师雷克尔|r交谈
    >>|cRXP_BUY_购买6颗|r|T134339:0|t[变色的狼心]|cRXP_BUY_（在拍卖行购买）。|r
    >>|cRXP_WARN_如果不想购买或无法购买，跳过此步|r
    .collect 3164,6,429,1 --Discolored Worg Heart (6)
    .target 拍卖师雷克尔
step << !Warlock
    #xprate <1.5
    .goto Undercity,67.74,37.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板诺曼|r交谈。
    .home >> 将炉石绑定在幽暗城。
    .target 旅店老板诺曼
    .bindlocation 1497
step
    #optional
    #label UCHome
step << Warlock
    .goto Undercity,85.07,25.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯伦丁·哈加尔|r（魔法区）交谈。
    .turnin 1473 >> 交任务: 虚空中的生物
    .accept 1471 >> 接任务: 誓缚
    .target 凯伦丁·哈加尔
step << Warlock
    #completewith next
    .cast 9221 >>|cRXP_WARN_在召唤法阵处使用|r |T134416:0|t[召唤符文]|cRXP_WARN_。|r
    .use 6284
step << Warlock
    .goto Undercity,86.64,27.10
    >>击杀召唤出的|cRXP_ENEMY_虚空行者|r。
    .complete 1471,1 --Kill Summoned Voidwalker (1)
    .mob 虚空行者
    .use 6284
step << Warlock
    .goto Undercity,85.04,25.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯伦丁|r交谈
    .turnin 1471 >>交任务: 誓缚
    .target 凯伦丁·哈加尔
step << Warrior
    #ssf
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_查尔斯·希顿|r（盗贼区）交谈。
    >>|cRXP_BUY_购买|r|T135350:0|t[优质重剑]|cRXP_BUY_（向他购买）。|r
    .collect 1198,1,371,1 --Collect Claymore (1)
    .money <0.2676
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target 查尔斯·希顿
step << Warrior
    #ah
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_查尔斯·希顿|r（盗贼区）交谈。
    >>|cRXP_BUY_购买|r|T135350:0|t[优质重剑]|cRXP_BUY_（向他购买）。|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的武器。|r
    .collect 1198,1,371,1 --Collect Claymore (1)
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
    #season 0,1
    #ssf
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_查尔斯·希顿|r（盗贼区）交谈。
    >>|cRXP_BUY_向他购买一把|r |T135346:0|t[斗士短剑]|cRXP_BUY_。|r
    .collect 851,1,371,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 查尔斯·希顿
step << Rogue
    #season 0,1
    #ah
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_查尔斯·希顿|r（盗贼区）交谈。
    >>|cRXP_BUY_向他购买一把|r |T135346:0|t[斗士短剑]|cRXP_BUY_。|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的武器。|r
    .collect 851,1,371,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 查尔斯·希顿
step << Rogue
    #season 2
    #ssf
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_查尔斯·希顿|r（盗贼区）交谈。
    .vendor >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_或|r |T135640:0|t[双刃弯刀]|cRXP_BUY_（从他那里）|r
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 查尔斯·希顿
step << Rogue
    #season 2
    #ah
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_查尔斯·希顿|r（盗贼区）交谈。
    .vendor >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_或|r |T135640:0|t[双刃弯刀]|cRXP_BUY_（从他那里）|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的武器。|r
    .money <0.2023
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
    #season 2
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_装备|r |T135640:0|t[双刃弯刀]
    .use 2207
    .itemcount 2207,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
step << Rogue
    .goto Undercity,77.50,49.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳撒尼尔·斯蒂恩维克|r（盗贼区）交谈。
    >>|cRXP_BUY_购买|r|T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]|cRXP_BUY_（向他购买）。|r
    .collect 3107,200,371,1 << !tbc
    .collect 25873,1,371,1 << tbc
    .target 纳撒尼尔·斯蒂恩维克
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    .goto Undercity,77.50,49.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳撒尼尔·斯蒂恩维克|r（盗贼区）交谈。
    >>|cRXP_BUY_购买|r|T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]|cRXP_BUY_（向他购买）。|r
    .collect 3107,200,371,1 << !tbc
    .collect 25873,1,371,1 << tbc
    .target 纳撒尼尔·斯蒂恩维克
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_记得在11级时装备|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]|cRXP_WARN_。|r
    .use 3107 << !tbc
    .use 25873 << tbc
    .itemcount 3107,1 << !tbc
    .itemcount 25873,1 << tbc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp >11,1
step << Rogue
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]
    .use 3107 << !tbc
    .use 25873 << tbc
    .itemcount 3107,1 << !tbc
    .itemcount 25873,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << skip
    --Rogue class q
    .goto Undercity,83.52,69.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特|r交谈
    .turnin 1885 >>交任务：米奈特·卡加德
    .accept 1886 >>接受任务：亡灵哨兵
    .target 米奈特·卡加德
step << skip
    #optional
    .abandon 1883 >> 放弃任务：安苏瓦，否则将无法接取接下来的任务。
    .isOnQuest 1883
step << skip
    .goto Undercity,85.12,10.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅·哈特威尔|r（魔法区）交谈。
    .turnin 1881 >> 交任务：安娜斯塔西娅
    .accept 1882 >> 接受任务：巴尼尔农场
    .target 安娜斯塔西娅·哈特威尔
step
    #xprate <1.5
    .goto Undercity,84.06,17.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比索·埃斯沙德|r（魔法区）交谈。
    .turnin 405 >>交任务：流浪的巫妖
    .accept 357 >>接受任务：巫妖的身份
    .target 比索·埃斯沙德
step << Warlock
    #xprate >1.49
    .goto Undercity,84.06,17.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比索·埃斯沙德|r（魔法区）交谈。
    .turnin 405 >>交任务：流浪的巫妖
    .target 比索·埃斯沙德
step << skip --Warlock
    #xprate <2.1
    .goto Undercity,84.86,20.34
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_将角色移到最下层楼梯的最高处，直到看起来悬在空中，然后退出登录并重新登录，利用卡登跳过路程|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >> |cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果做不到，就按正常路线跑出幽暗城|r
step << skip --!Mage !Warlock
    #xprate <2.1
    .goto Undercity,61.10,54.11 << Priest
    .goto Undercity,78.03,50.36 << Warrior
    .goto Undercity,82.75,65.23 << Rogue
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_跳到堆叠的桶上，登出再登录，利用登出跳跃离开。|r << Priest/Warrior
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_跳到绞肉车的绞肉机上，登出再登录，利用登出跳跃离开。|r << Rogue
    >>|cRXP_WARN_如果做不到，就按正常路线跑出幽暗城|r
    .zoneskip Undercity,1
step
    #optional
    #label LogoutSkip1
step
    #xprate <2.1
    #completewith AtWarS
    .goto Tirisfal Glades,61.92,64.85
    .zone Tirisfal Glades >> 离开幽暗城
    .zoneskip Tirisfal Glades
step << skip
    #sticky
    #completewith UnluckyRogue
    >>|cRXP_WARN_如果遇到|r|cRXP_FRIENDLY_阿斯托·哈德恩|r|cRXP_WARN_，先与他交谈，再击杀他，拾取信件。他在布瑞尔与瑟伯切尔之间的道路上巡逻。|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan 阿斯托·哈德恩
    .isOnQuest 1886
step << Mage/Warlock
    #xprate >1.49
    #completewith AtWarS
    #optional
    .abandon 357 >>放弃任务：巫妖的身份
step << Mage
    #xprate <2.1
    #softcore
    #completewith AtWarS
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #completewith AgamandStart
    #xprate >2.09
    .hs >>炉石回布瑞尔
    .bindlocation 2119,1
    .subzoneskip 159
    .cooldown item,6948,>0,1
step
    #xprate >2.09
    #completewith AgamandStart
    .goto Tirisfal Glades,61.92,64.85,40,0
    .subzone 159 >> 若无法使用炉石，步行返回布瑞尔
    .subzoneskip 159
step
    #optional
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯吉斯|r交谈
    .turnin 374 >>交任务：死亡证明
    .target 亡灵卫兵伯吉斯
    .isQuestComplete 374
step
    #xprate <2.1
    #label AtWarS
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞加德|r交谈
    .turnin 370 >>交任务：与血色十字军的战争
    .accept 371 >>接受任务 与血色十字军的战争
    .target 执行官塞加德
step
    #xprate >2.09
    #label AtWarS
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞加德|r交谈
    .turnin 370 >>交任务：与血色十字军的战争
    .target 执行官塞加德
step << Rogue
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    .use 208085 >>|cRXP_WARN_使用|r |T133385:0|t[|cRXP_LOOT_血色军官玺戒|r]|cRXP_WARN_制作|r |T134328:0|t[|cRXP_LOOT_伪造的血色备忘录|r]
    .collect 208086,1 --Forged Scarlet Memorandum (1)
    .train 400094,1
step << Rogue
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加米尔·诺瑞|r交谈，从她那里获得|T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]。
    .collect 203990,1 --Rune of Mutilation (1)
    .target 加米尔·诺瑞
    .skipgossip
    .train 400094,1
step << Rogue
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]|cRXP_WARN_学习|r |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1
step
    .goto Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_温特斯夫人|r交谈。
    >>|cRXP_BUY_购买|r|T133634:0|t[棕色小包]|cRXP_BUY_，商人为|r|cRXP_FRIENDLY_她|r。
    .collect 4496,1,372,1 --Small Brown Pouch (1)
    .target 温特斯夫人
    .money <0.05
step << Warrior
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼|r交谈
    .turnin 1820 >>交任务：库勒曼
    .target 库勒曼·法席恩
    --150% route Agamand Mills here
step
    #xprate >2.09
    #label AgamandStart
    .goto Tirisfal Glades,47.60,44.03,100,0
    .goto Tirisfal Glades,47.37,43.71
    .subzone 157 >> 向西北方前往阿加曼德磨坊。
    .isOnQuest 362
step
    #xprate >2.09
    #completewith ThurmanGregor
    >>|T134939:0|t[|cRXP_LOOT_给伊维特的信|r]|cRXP_WARN_可能从这些敌人身上掉落。掉落后便接取任务。|r
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >> 接受任务：未寄出的信件
    .use 2839
step
    #xprate >2.09
    #completewith ThurmanGregor
    #label MillsOverun
    >>击杀|cRXP_ENEMY_士兵|r和|cRXP_ENEMY_骷髅法师|r，拾取|cRXP_LOOT_肋骨|r和|cRXP_LOOT_颅骨|r。
    .complete 426,1 --Notched Rib (5)
    .mob +断骨士兵
    .mob +碎颅士兵
    .complete 426,2 --Blackened Skull (3)
    .mob +暗眼骷髅法师
step
    #xprate >2.09
    #label KillDevlin
    .goto Tirisfal Glades,47.34,40.78
    >>击杀|cRXP_ENEMY_代弗林·阿加曼德|r，拾取|cRXP_LOOT_遗骸|r。
    .complete 362,1 --Devlin's Remains (1)
    .mob 代弗林·阿加曼德
step
    #xprate >2.09
    .goto Tirisfal Glades,49.34,36.02
    >>击杀|cRXP_ENEMY_妮萨·阿加曼德|r，拾取她的|cRXP_LOOT_遗骸|r。她可能在建筑内。
    .complete 354,2 --Nissa's Remains (1)
    .mob 妮萨·阿加曼德
step
    #xprate >2.09
    #label ThurmanGregor
    #loop
    .goto Tirisfal Glades,45.08,31.15,0
    .goto Tirisfal Glades,43.71,35.25,60,0
    .goto Tirisfal Glades,45.03,30.99,60,0
    .goto Tirisfal Glades,46.79,29.80,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,45.08,31.15,60,0
    >>击杀|cRXP_ENEMY_萨尔曼·阿加曼德|r和|cRXP_ENEMY_格里高·阿加曼德|r，拾取他们的|cRXP_LOOT_遗骸|r。他们会四处巡逻。
    .complete 354,3 --Thurman's Remains (1)
    .unitscan +萨尔曼·阿加曼德
    .complete 354,1 --Gregor's Remains (1)
    .unitscan +格里高·阿加曼德
step
    #xprate >2.09
    #loop
    .goto Tirisfal Glades,45.08,31.15,0
    .goto Tirisfal Glades,43.71,35.25,60,0
    .goto Tirisfal Glades,45.03,30.99,60,0
    .goto Tirisfal Glades,46.79,29.80,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,45.08,31.15,60,0
    >>击杀|cRXP_ENEMY_士兵|r和|cRXP_ENEMY_骷髅法师|r，拾取|cRXP_LOOT_肋骨|r和|cRXP_LOOT_颅骨|r。
    .complete 426,1 --Notched Rib (5)
    .mob +断骨士兵
    .mob +碎颅士兵
    .complete 426,2 --Blackened Skull (3)
    .mob +暗眼骷髅法师
step << Mage/Priest
    #xprate >2.09
    #season 2
    >>击杀|cRXP_ENEMY_Gillgar|r，拾取 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI（寒冰指）|r] << Mage
    >>击杀|cRXP_ENEMY_Gillgar|r，拾取 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] << Priest
    .collect 203753,1 << Mage --Spell Notes: RING SEFF OSTROF (1)
    .collect 205940,1 << Priest --Memory of a Dark Purpose (1)
    .mob Gillgar
    .train 401765,1 << Mage
    .train 425216,1 << Priest
    .goto Tirisfal Glades,25.60,48.20
step << Mage
    #optional
    #completewith Conscript
    #xprate >2.09
    #season 2
    .collect 211779,1 >>若持有理解魔符，现在可解读笔记；否则继续路线，稍后在奥格瑞玛向施法材料商购买。
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI（寒冰指）|r] |cRXP_WARN_学习|r |T236227:0|t[寒冰指]
    .use 203753
    .itemcount 203753,1
    .train 401765,1
step
    #xprate >2.09
    #hardcore
    #completewith FoodandWater2
    .subzone 159 >> 返回布瑞尔。
    .subzoneskip 159
step
    #xprate >2.09
    #softcore
    #completewith FoodandWater2
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #label FinishRings
    #xprate >2.09
    .goto Tirisfal Glades,58.20,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪林格尔|r交谈
    .turnin 426 >>交任务：磨坊告急
    .target 亡灵卫兵迪林格尔
step
    #xprate >2.09
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_购买一卷|r |T132891:0|t[粗线]|cRXP_BUY_（从她那里）|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate >2.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊维特|r和|cRXP_FRIENDLY_库勒曼|r交谈
    .turnin 361 >>交任务：未寄出的信件
    .target +伊维特·法席恩
    .goto Tirisfal Glades,61.58,52.60
    .turnin 354 >>交任务：阿加曼德家族
    .turnin 362 >>交任务：闹鬼的磨坊
    .target +库勒曼·法席恩
    .goto Tirisfal Glades,61.72,52.29
    .isOnQuest 361
step
    #xprate >2.09
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼|r交谈
    .turnin 354 >>交任务：阿加曼德家族
    .turnin 362 >>交任务：闹鬼的磨坊
    .turnin 1820 >>交任务：库勒曼 << Warrior
    .target 库勒曼·法席恩
    .isQuestTurnedIn 1819 << Warrior
step << Warrior
    #xprate >2.09
    #optional
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼|r交谈
    .turnin 354 >>交任务：阿加曼德家族
    .turnin 362 >>交任务：闹鬼的磨坊
    .target 库勒曼·法席恩
step
    #xprate >2.09
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step << Undead Priest
    #season 2
    .goto Tirisfal Glades,57.71,48.96
    .emote KNEEL
    .aura 418459 >> 在布瑞尔墓地跪下，获得 [亡灵之思]
    .itemcount 205940,1
    .train 425216,1
step << Undead Priest
    #season 2
    .train 425216 >> 使用 |T136222:0|t[黑暗意图的回忆] 学习 |T237514:0|t[虚空疫病]
    .use 205940
    .itemcount 205940,1
step << Priest
    #xprate >2.09
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师贝里尔|r（二楼）交谈。
	.trainer >> 学习职业技能。
    .target 黑暗牧师贝里尔
step << Warrior
    #xprate >2.09
    .goto Tirisfal Glades,61.85,52.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔·德·蒙|r交谈。
    .train 2687 >> 学习职业技能。
    .target 奥斯蒂尔·德·蒙
    .xp >12,1
step << Warrior
    #xprate >2.09
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 7384 >>学习 |T132223:0|t[压制]
    .target 奥斯蒂尔·德·蒙
    .xp <12,1
step << Warlock
    #xprate >2.09
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈。
    .train 707 >> 学习职业技能。
    .target 鲁伯特·鲍什
    .xp <10,1
    .xp >12,1
step << Warlock
    #xprate >2.09
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈。
    .train 755 >> 学习职业技能。
    .target 鲁伯特·鲍什
    .xp <12,1
step << Rogue
    #xprate >2.09
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r交谈。
    .train 674 >> 学习职业技能。
    --.accept 1885 >> Accept Mennet Carkad
    .target 马里恩·考尔
    .xp <10,1
    .xp >12,1
step << Rogue
    #xprate >2.09
    #optional
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r交谈。
    .train 1766 >> 学习职业技能。
    --.accept 1885 >> Accept Mennet Carkad
    .target 马里恩·考尔
    .xp <12,1
step
    #xprate >2.09
    #label FoodandWater2
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈。
    >>|cRXP_BUY_购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_（向她购买）。|r << Mage/Priest/Shaman
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_（向她购买）。|r <<Warrior/Rogue
    >>|cRXP_BUY_购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_（向她购买）。|r << Warlock
    .vendor >> 出售杂物。
    .collect 1179,20,372,1 << Mage/Priest/Shaman --Ice Cold Milk (20)
    .collect 4605,20,370,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,15,370,1 << Warlock --Ice Cold Milk (15)
    .collect 4605,15,370,1 << Warlock --Red-speckled Mushroom (15)
    .money <0.075 << Warlock
    .money <0.05 << !Warlock
    .target 旅店老板瑞尼
step
    #xprate <2.1
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_毛皮|r。
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step
    #xprate <2.1
    #label UnluckyRogue
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林奈|r交谈
    .turnin 359 >>交任务：亡灵卫兵的职责
    .accept 360 >>接受任务：向塞弗伦回报
    .accept 356 >>接受任务：巡查后方
    .target 亡灵卫兵林奈
step
    #xprate <2.1
    #completewith ArriveBalnir
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_毛皮|r。
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step
    #xprate <2.1
    #label ArriveBalnir
    .goto Tirisfal Glades,76.51,61.77
    .subzone 165 >>前往巴尼尔农场。
    .isOnQuest 356
step << Mage
    #xprate <2.1
    #season 2
    #completewith HorrorsandSpirits
    >>施放|T136071:0|t[变形术]，目标为|cRXP_ENEMY_古怪的甜瓜|r。
    >>拾取地上的 |T134332:0|t[|cRXP_LOOT_药剂师笔记|r]
    .collect 208183,6 --Apothecary Notes (6)
    .mob 古怪的甜瓜
    .train 415942,1
    .train 118,3
step << skip
    #completewith next
    >>击杀|cRXP_ENEMY_可怕的血僵尸|r和|cRXP_ENEMY_游荡的幽灵|r
    .complete 356,1 --Bleeding Horror (8)
    .mob +可怕的血僵尸
    .complete 356,2 --Wandering Spirit (8)
    .mob +游荡的幽灵
step << skip
    .goto Tirisfal Glades,77.48,62.00
    >>拾取地上任意一株植物，取得|cRXP_PICK_巴尼尔金鱼草|r。
    .complete 1882,1 --Balnir Snapdragons (1)
step
    #xprate <2.1
    #optional
    #label HorrorsandSpirits
    #loop
	.goto Tirisfal Glades,74.31,60.98,0
	.goto Tirisfal Glades,74.31,60.98,50,0
	.goto Tirisfal Glades,74.45,59.64,50,0
	.goto Tirisfal Glades,75.08,58.56,50,0
	.goto Tirisfal Glades,76.45,58.67,50,0
	.goto Tirisfal Glades,77.41,58.66,50,0
	.goto Tirisfal Glades,78.55,60.43,50,0
	.goto Tirisfal Glades,77.45,61.46,50,0
	.goto Tirisfal Glades,76.79,62.60,50,0
	.goto Tirisfal Glades,74.99,61.98,50,0
    >>击杀|cRXP_ENEMY_可怕的血僵尸|r和|cRXP_ENEMY_游荡的幽灵|r
    .complete 356,1 --Bleeding Horror (8)
    .mob +可怕的血僵尸
    .complete 356,2 --Wandering Spirit (8)
    .mob +游荡的幽灵
step << Mage
    #xprate <2.1
    #season 2
    #loop
    .goto Tirisfal Glades,76.51,61.77,0
    .goto Tirisfal Glades,75.12,61.49,20,0
    .goto Tirisfal Glades,76.51,61.77,20,0
    .goto Tirisfal Glades,76.04,59.31,20,0
    >>施放|T136071:0|t[变形术]，目标为|cRXP_ENEMY_古怪的甜瓜|r。
    >>拾取地上的 |T134332:0|t[|cRXP_LOOT_药剂师笔记|r]
    .collect 208183,6 --Apothecary Notes (6)
    .mob 古怪的甜瓜
    .train 415942,1
    .train 118,3
step << Mage
    #xprate <2.1
    #season 2
    >>|cRXP_WARN_使用|r |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r|cRXP_WARN_制作|r |T134332:0|t|cRXP_LOOT_[法术笔记：启迪]|r
    .collect 203749,1 --Spell Notes: Enlightenment (1)
    .use 208183 --Apothecary Notes
    .train 415942,1
    .itemcount 208183,6
step << Mage
    #xprate <2.1
    #season 2
    .train 415942 >>|cRXP_WARN_使用|r |T134332:0|t|cRXP_LOOT_[法术笔记：启迪]|r|cRXP_WARN_学习|r |T133815:0|t[铭刻胸甲：启迪]
    .use 203749
    .itemcount 203749,1 --Spell Notes: Enlightenment (1)
step
    #xprate <2.1
    #sticky
    #label Friars
    #loop
    #optional
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
    .goto Tirisfal Glades,79.82,56.40,0
    .goto Tirisfal Glades,80.95,57.21,40,0
    .goto Tirisfal Glades,81.62,54.84,40,0
    .goto Tirisfal Glades,81.56,53.07,40,0
    .goto Tirisfal Glades,79.31,55.25,40,0
    .goto Tirisfal Glades,77.14,54.92,40,0
    .goto Tirisfal Glades,76.15,55.30,40,0
    .goto Tirisfal Glades,76.12,57.22,40,0
    .goto Tirisfal Glades,77.16,56.75,40,0
    .goto Tirisfal Glades,79.82,56.40,40,0
    >>击杀|cRXP_ENEMY_血色苦行修士|r和|cRXP_ENEMY_血色狂热者|r，拾取|cRXP_LOOT_血色十字军徽记之戒|r。
    .complete 371,2 --Scarlet Friar (5)
    .complete 374,1 --Scarlet Insignia Ring (10)
    .disablecheckbox
    .mob 血色苦行修士
    .mob 血色狂热者
    .isOnQuest 374
step
    #xprate <2.1
    #loop
    #sticky
    #requires Friars
    #label Friars2
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
    .goto Tirisfal Glades,79.82,56.40,0
    .goto Tirisfal Glades,80.95,57.21,40,0
    .goto Tirisfal Glades,81.62,54.84,40,0
    .goto Tirisfal Glades,81.56,53.07,40,0
    .goto Tirisfal Glades,79.31,55.25,40,0
    .goto Tirisfal Glades,77.14,54.92,40,0
    .goto Tirisfal Glades,76.15,55.30,40,0
    .goto Tirisfal Glades,76.12,57.22,40,0
    .goto Tirisfal Glades,77.16,56.75,40,0
    .goto Tirisfal Glades,79.82,56.40,40,0
    >>击杀|cRXP_ENEMY_血色苦行修士|r
    .complete 371,2 --Scarlet Friar (5)
    .mob 血色苦行修士
    .isQuestTurnedIn 374
step
    #xprate <2.1
    .goto Tirisfal Glades,78.82,56.14
    >>击杀塔内的|cRXP_ENEMY_瓦松队长|r
    .complete 371,1 --Captain Vachon (1)
    .mob 瓦松队长
step
    #xprate <2.1
    #requires Friars2
    #loop
    #label FinishRings
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
    .goto Tirisfal Glades,79.82,56.40,0
    .goto Tirisfal Glades,80.95,57.21,40,0
    .goto Tirisfal Glades,81.62,54.84,40,0
    .goto Tirisfal Glades,81.56,53.07,40,0
    .goto Tirisfal Glades,79.31,55.25,40,0
    .goto Tirisfal Glades,77.14,54.92,40,0
    .goto Tirisfal Glades,76.15,55.30,40,0
    .goto Tirisfal Glades,76.12,57.22,40,0
    .goto Tirisfal Glades,77.16,56.75,40,0
    .goto Tirisfal Glades,79.82,56.40,40,0
    >>击杀|cRXP_ENEMY_血色苦行修士|r和|cRXP_ENEMY_血色狂热者|r，拾取|cRXP_LOOT_血色十字军徽记之戒|r。
    .complete 374,1 --Scarlet Insignia Ring (10)
    .mob 血色苦行修士
    .mob 血色狂热者
    .isOnQuest 374
step << skip
    #xprate <2.1
    #optional
    #loop
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
    .goto Tirisfal Glades,79.82,56.40,0
    .goto Tirisfal Glades,80.95,57.21,40,0
    .goto Tirisfal Glades,81.62,54.84,40,0
    .goto Tirisfal Glades,81.56,53.07,40,0
    .goto Tirisfal Glades,79.31,55.25,40,0
    .goto Tirisfal Glades,77.14,54.92,40,0
    .goto Tirisfal Glades,76.15,55.30,40,0
    .goto Tirisfal Glades,76.12,57.22,40,0
    .goto Tirisfal Glades,77.16,56.75,40,0
    .goto Tirisfal Glades,79.82,56.40,40,0
    >>|cRXP_WARN_收集3组|r|T132889:0|t[亚麻布]|cRXP_WARN_，用于制作次级魔法杖。这是进入银松森林前最后的收集机会。|r
    .collect 2589,60,435,1 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step
    #xprate <2.1
    #completewith ViciousVenom
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_毛皮|r。
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step
    #xprate <2.1
    #label ViciousVenom
    #loop
    #requires Friars2
    .goto Tirisfal Glades,85.03,54.72,0
    .goto Tirisfal Glades,83.50,55.56,30,0
    .goto Tirisfal Glades,85.03,54.72,30,0
    .goto Tirisfal Glades,86.56,54.51,30,0
    .goto Tirisfal Glades,88.06,54.99,30,0
    .goto Tirisfal Glades,88.94,53.56,30,0
    .goto Tirisfal Glades,89.70,51.88,30,0
    .goto Tirisfal Glades,90.92,50.56,30,0
    .goto Tirisfal Glades,90.87,48.33,30,0
    .goto Tirisfal Glades,89.87,46.65,30,0
    .goto Tirisfal Glades,85.04,46.68,30,0
    .goto Tirisfal Glades,84.52,49.29,30,0
    .goto Tirisfal Glades,83.46,52.09,30,0
    >>击杀|cRXP_ENEMY_邪恶的夜行蜘蛛|r，拾取|cRXP_LOOT_毒液|r。
    .complete 369,1 --Vicious Night Web Spider Venom (4)
    .mob 邪恶的夜行蜘蛛
step
    #xprate <2.1
    #loop
    .goto Tirisfal Glades,83.59,43.84,0
    .goto Tirisfal Glades,72.33,33.01,0
    .goto Tirisfal Glades,83.59,43.84,70,0
    .goto Tirisfal Glades,80.77,46.40,70,0
    .goto Tirisfal Glades,75.86,46.02,70,0
    .goto Tirisfal Glades,73.10,40.71,70,0
    .goto Tirisfal Glades,72.33,33.01,70,0
    .goto Tirisfal Glades,68.69,34.33,70,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_毛皮|r。
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
step << skip
    #xprate >1.49
    .xp 11+2950 >> 刷怪至2950+/8800经验。
    .isOnQuest 374
    .isOnQuest 375
--XX 220 (369)+840 (371)+390 (360)+90 (355)+160 (407)+875 (492) = 2575 -> 3860
--XX +625 (374 OPT)+700 (375 OPT) = 3900 -> 5850
--XX +625 (374 OPT) = 3200 -> 4800
--XX +700 (375 OPT) = 3275 -> 4910
step << skip
    #xprate >1.49
    #optional
    .xp 11+3890 >> 刷怪至3890+/8800经验。
    .isQuestTurnedIn 374
    .isOnQuest 375
step << skip
    #xprate >1.49
    #optional
    .xp 11+4000 >> 刷怪至4000+/8800经验。
    .isOnQuest 374
    .isQuestTurnedIn 375
step << skip
    #xprate >1.49
    #optional
    .xp 11+4940 >> 刷怪至4940+/8800经验。
    .isQuestTurnedIn 374
    .isQuestTurnedIn 375
step
    #xprate <2.1
    #completewith ANewPlagueFinal
    .hs >> 炉石回布瑞尔
    .subzoneskip 159
    .bindlocation 2119,1
    .cooldown item,6948,>0,1
step
    #xprate <2.1
    #completewith ANewPlagueFinal
    .subzone 159 >> 返回布瑞尔。
    .subzoneskip 159
step
    #xprate <1.5
    .goto Tirisfal Glades,67.97,42.09
    >>拾取澈水湖岛上的|cRXP_PICK_冈瑟尔的书籍|r，取得|cRXP_LOOT_巫妖的法术书|r。
    .complete 357,1 --The Lich's Spellbook (1)
step
    #xprate <1.5
    #hardcore
    #completewith ANewPlagueFinal
    .subzone 159 >> 返回布瑞尔。
    .subzoneskip 159
step
    #xprate <1.5
    #softcore
    #completewith ANewPlagueFinal
    .goto Tirisfal Glades,66.60,44.95
    .deathskip >> 在|cRXP_WARN_较小的岛上|r死亡，然后在|cRXP_FRIENDLY_灵魂医者|r处复活。
step
    #xprate <2.1
    .goto Tirisfal Glades,59.45,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .turnin 369 >>交任务：新的瘟疫
    .accept 492 >>接受任务 新的瘟疫
    --.accept 445 >>Accept Delivery to Silverpine Forest
    .target 药剂师乔汉
step << skip
    #phase 3-6
    .goto Tirisfal Glades,59.45,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .turnin 369 >>交任务：新的瘟疫
    .accept 492 >>接受任务 新的瘟疫
    --.accept 445 >>Accept Delivery to Silverpine Forest
    .target 药剂师乔汉
step
    #xprate <1.5
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞加德|r交谈
    .turnin 371 >>交任务：与血色十字军的战争
    .accept 372 >>接受任务 与血色十字军的战争
    .target 执行官塞加德
step
    #optional
    #xprate <2.1
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞加德|r交谈
    .turnin 371 >>交任务：与血色十字军的战争
    .target 执行官塞加德
step
    #xprate <2.1
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执政官塞弗伦|r交谈。
    .turnin 360 >>交任务：向塞弗伦回报
    .turnin 355 >>交任务：与塞弗伦交谈
    .target 执政官塞弗伦
step
    #xprate >1.49
    #optional
    #completewith ANewPlagueFinal
    .abandon 372 >> 放弃任务：与血色十字军的战争
step
    #xprate <2.1
    #optional
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯吉斯|r交谈
    .turnin 374 >>交任务：死亡证明
    .target 亡灵卫兵伯吉斯
    .isQuestComplete 374
step
    #xprate <2.1
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_购买一卷|r |T132891:0|t[粗线]|cRXP_BUY_（从她那里）|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate <2.1
    .goto Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_温特斯夫人|r交谈。
    >>|cRXP_BUY_购买|r|T133634:0|t[棕色小包]|cRXP_BUY_，商人为|r|cRXP_FRIENDLY_她|r。
    .collect 4496,1,356,1 --Small Brown Pouch (1)
    .target 温特斯夫人
    .money <0.05
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step
    #xprate <2.1
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莉丝|r交谈
    .turnin 375 >>交任务：死亡之寒
    .target 格莉丝·戴玛
step
    #xprate <2.1
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
	.vendor >>|cRXP_BUY_出售杂物，并按需补充食物和水。|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物，并按需补充食物。|r << Rogue/Warrior
    .target 旅店老板瑞尼
step << Warrior
    #season 2
    .goto Tirisfal Glades,61.73,51.91
    .gossipoption 110750 >>与|cRXP_FRIENDLY_佩妮|r交谈
    .target 佩妮·霍克金斯
    .train 425447,1
step
    #xprate <1.5
    #label ANewPlagueFinal
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店后部楼下的|cRXP_FRIENDLY_血色十字军俘虏|r和|cRXP_FRIENDLY_被俘虏的巡山人|r交谈。
    .turnin 407 >>交任务：悲伤之地
    .goto Tirisfal Glades,61.97,51.29
    .target +血色十字军俘虏
    .turnin 492 >> 交任务：新的瘟疫
    .goto Tirisfal Glades,61.94,51.40
    .target +被俘虏的巡山人
step
    #xprate <2.1
    .goto Tirisfal Glades,61.94,51.40
    #label ANewPlagueFinal
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店后部楼下的|cRXP_FRIENDLY_被俘虏的巡山人|r交谈。
    .turnin 492 >> 交任务：新的瘟疫
    .target +被俘虏的巡山人
step << Warrior
    #season 2
    .goto Tirisfal Glades,61.72,51.72
    .gossipoption 109084 >>与旅店内楼下的|cRXP_FRIENDLY_蓝心|r交谈。
    .target 蓝心
    .train 425447,1
step << Warrior
    #season 2
    .goto Tirisfal Glades,61.72,51.91
    >>击杀|cRXP_ENEMY_蓝心|r，然后上楼与|cRXP_FRIENDLY_佩妮·霍克金斯|r交谈。
    .gossipoption 110751 >>从她那里获得 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target 佩妮·霍克金斯
    .mob 蓝心
    .train 425447,1
    .skipgossip
step << Warrior
    #season 2
    .train 425447 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .use 204716
    .itemcount 204716,1
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师贝里尔|r（二楼）交谈。
	.train 588 >>学习 |T135926:0|t[心灵之火]
    .target 黑暗牧师贝里尔
    .xp <12,1
    .xp >14,1
step << Priest
    #optional
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗牧师贝里尔|r（二楼）交谈。
	.train 6074 >>学习职业技能
    .target 黑暗牧师贝里尔
    .xp <14,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·火歌|r（二楼）交谈。
    .train 145 >> 学习|T135812:0|t[火球术（等级 3）]。
    .target 凯恩·火歌
    .xp <12,1
    .xp >14,1
step << Mage
    #optional
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·火歌|r（二楼）交谈。
    .train 1449 >> 学习职业技能。
    .target 凯恩·火歌
    .xp <12,1
    .xp >14,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 7384 >>学习 |T132223:0|t[压制]
    .target 奥斯蒂尔·德·蒙
    .xp <12,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r（二楼）交谈。
    .train 1766 >> 学习|T132219:0|t[脚踢]。
    .target 马里恩·考尔
    .xp <12,1
    .xp >14,1
step << Rogue
    #optional
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马里恩·考尔|r（二楼）交谈。
    .train 1758 >> 学习职业技能。
    .target 马里恩·考尔
    .xp <14,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈。
    .train 755 >> 学习|T136168:0|t[生命通道]。
    .target 鲁伯特·鲍什
    .xp <12,1
    .xp >14,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁伯特·鲍什|r交谈。
    .train 6222 >> 学习职业技能。
    .target 鲁伯特·鲍什
    .xp <14,1
step << skip
    #completewith Conscript
    >>|cRXP_WARN_如果遇到|r|cRXP_FRIENDLY_阿斯托·哈德恩|r|cRXP_WARN_，先与他交谈，再击杀他，拾取信件。他在布瑞尔与瑟伯切尔之间的道路上巡逻。|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan 阿斯托·哈德恩
step
    #xprate <2.1
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林奈|r交谈
    .turnin 356 >>交任务：巡查后方
    .target 亡灵卫兵林奈
step << Undead
    #sticky
    #completewith EnterRFC
    .subzone 2437 >> 现在开始为怒焰裂谷寻找队伍。
    .dungeon RFC
step
    #optional
    #completewith ZeptoDurotar
    .abandon 374 >>放弃任务：死亡证明
step
    #optional
    #completewith ZeptoDurotar
    .abandon 375 >>放弃任务：死亡之寒
step << Undead
    #label ZeptoDurotar
    .goto Tirisfal Glades,60.96,58.63,12,0
    .goto Tirisfal Glades,61.51,59.01,10,0
    .goto Tirisfal Glades,61.27,59.22,8,0
    .goto Tirisfal Glades,61.13,58.84,8,0
    .goto Tirisfal Glades,61.38,58.71,8,0
    .goto Tirisfal Glades,61.34,59.17,8,0
    .goto Tirisfal Glades,60.51,58.69,-1
    .goto Tirisfal Glades,60.94,46.35,-1
    .zone Durotar >>乘飞艇前往杜隆塔尔。
    >>等待时制作磨刀石和绷带。 << Warrior/Rogue
    >>等待时制造食物和水。 << Mage
    .zoneskip Durotar
step << Undead
    #completewith HiddenEnemiesPickup
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 前往奥格瑞玛。
    .dungeon RFC
step << Undead
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_多拉斯|r
    >>|cRXP_WARN_不要飞往任何地方！|r
    .fp Orgrimmar >> 获取奥格瑞玛飞行点
    .target 多拉斯
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .accept 5726 >>接受任务：隐藏的敌人
    .target 萨尔
    .dungeon RFC
step << Undead
    .goto Durotar,53.08,9.19,0
    >>击杀骷髅石中的|cRXP_ENEMY_火刃|r敌人，直到掉落|cRXP_LOOT_军官的徽章|r。
    .complete 5726,1 --Lieutenant's Insignia (1)
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈。
    .turnin 5726 >> 交任务：隐藏的敌人
    .accept 5727 >> 接受任务：隐藏的敌人
    .target 萨尔
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .accept 5761 >>接受任务：饥饿者塔拉加曼
    .target 尼尔鲁·火刃
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .complete 5727,1 --Gauge Neeru Fireblade's reaction to you being a member of the Burning Blade
    .skipgossip
    .target 尼尔鲁·火刃
    .dungeon RFC
step << Undead
    #label HiddenEnemiesPickup
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈。
    .turnin 5727 >> 交任务：隐藏的敌人
    .accept 5728 >> 接受任务：隐藏的敌人
    .target 萨尔
    .dungeon RFC
step << Undead
    #completewith EnterRFC
    .destroy 14544 >>|cRXP_WARN_摧毁|r|T134417:0|t[军官的徽章]|cRXP_WARN_，后续不再需要。|r
    .dungeon RFC
step << Undead
    #label EnterRFC
    .goto Orgrimmar,52.77,48.97
    .subzone 2437 >> 进入怒焰裂谷的副本传送门。
    .dungeon RFC
step << Undead
    >>|cRXP_WARN_尽量让队友共享以下任务。|r
    .accept 5722 >> 接受任务：寻找背包
    .accept 5723 >> 接受任务：试探敌人
    .disablecheckbox
    .dungeon RFC
step << Undead
    #completewith next
    >>击杀|cRXP_ENEMY_怒焰穴居人|r和|cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +怒焰穴居人
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +怒焰萨满祭司
    .isOnQuest 5723
    .dungeon RFC
step << Undead
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔·恐怖图腾|r交谈。
    .turnin 5722 >> 交任务：寻找背包
    .accept 5724 >> 接受任务：归还背包
    .target 玛尔·恐怖图腾
    .isOnQuest 5722
    .dungeon RFC
step << Undead
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔·恐怖图腾|r交谈。
    .accept 5724 >> 接受任务：归还背包
    .target 玛尔·恐怖图腾
    .isQuestTurnedIn 5722
    .dungeon RFC
step << Undead
    #label TroggsShamans
    >>击杀|cRXP_ENEMY_怒焰穴居人|r和|cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +怒焰穴居人
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +怒焰萨满祭司
    .isOnQuest 5723
    .dungeon RFC
step << Undead
    #requires TroggsShamans
    #completewith BazzalanandJergosh
    >>击杀|cRXP_ENEMY_燃刃信徒|r和|cRXP_ENEMY_燃刃术士|r，拾取|cRXP_LOOT_暗影法术研究|r和|cRXP_LOOT_扭曲虚空的魔法|r。
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob 燃刃信徒
    .mob 燃刃术士
    .isOnQuest 5725
    .dungeon RFC
step << Undead
    >>击杀|cRXP_ENEMY_饥饿者塔拉加曼|r，拾取|cRXP_LOOT_心脏|r。
    .complete 5761,1 -- Taragaman the Hungerer's Heart
    .mob 饥饿者塔拉加曼
    .isOnQuest 5761
    .dungeon RFC
step << Undead
    #label BazzalanandJergosh
    >>击杀|cRXP_ENEMY_巴扎兰|r和|cRXP_ENEMY_祈求者耶戈什|r
    .complete 5728,1 --Bazzalan (1)
    .mob +巴扎兰
    .complete 5728,2 --Jergosh the Invoker (1)
    .mob +祈求者耶戈什
    .isOnQuest 5728
    .dungeon RFC
step << Undead
    >>击杀|cRXP_ENEMY_燃刃信徒|r和|cRXP_ENEMY_燃刃术士|r，拾取|cRXP_LOOT_暗影法术研究|r和|cRXP_LOOT_扭曲虚空的魔法|r。
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob 燃刃信徒
    .mob 燃刃术士
    .isOnQuest 5725
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 5761 >>交任务：饥饿者塔拉加曼
    .target 尼尔鲁·火刃
    .isQuestComplete 5761
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈。
    .turnin 5728 >> 交任务：隐藏的敌人
    .accept 5729 >> 接受任务：隐藏的敌人
    .target 萨尔
    .isQuestComplete 5728
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈。
    .accept 5729 >> 接受任务：隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5728
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈。
    .turnin 5729 >> 交任务：隐藏的敌人
    .accept 5730 >> 接受任务：隐藏的敌人
    .target 尼尔鲁·火刃
    .dungeon RFC
    .isQuestTurnedIn 5728
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈。
    .turnin 5730 >> 交任务：隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5728
    .dungeon RFC
step << Mage
    #season 2
    #optional
    #completewith FingersOfFrostSupplies
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 进入奥格瑞玛，向试剂商购买理解魔符以解读笔记
    .zoneskip Orgrimmar
    .itemcount 203753,1
    .train 401765,1
    .money <0.075
step << Mage
    #season 2
    #optional
    #label FingersOfFrostSupplies
    .goto Orgrimmar,45.60,56.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_霍苏斯|r 交谈，购买一个 |T135933:0|t[理解魔符]
    .collect 211779,1
    .train 401765 >> 使用 [法术笔记：IGBHNHZNAI] 学习 [寒冰指]
    .use 203753
    .target 霍苏斯
    .itemcount 203753,1
    .train 401765,1
    .money <0.075
step << Mage
    #season 2
    #optional
    #completewith LivingFlameSupplies
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 进入奥格瑞玛，向试剂商购买理解魔符以解读笔记
    .zoneskip Orgrimmar
    .itemcount 203752,1
    .train 401768,1
    .money <0.075
step << Mage
    #season 2
    #optional
    #label LivingFlameSupplies
    .goto Orgrimmar,45.60,56.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_霍苏斯|r 交谈，购买一个 |T135933:0|t[理解魔符]
    .collect 211779,1
    .train 401768 >> 使用 [法术笔记：IULAOYIHTEN] 学习 [活体烈焰]
    .use 203752
    .target 霍苏斯
    .itemcount 203752,1
    .train 401768,1
    .money <0.075
step << Undead
    #completewith Conscript
    .subzone 362 >> 前往剃刀岭。
step << !Undead
    .hs >> 炉石回剃刀岭
    .use 6948
    .subzoneskip 362
    .bindlocation 362,1
step << Rogue
    #optional << Undead
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈。
    .train 1758 >> 学习职业技能。
    .target 卡普拉克
    .xp <14,1
    .xp >16,1
step << Rogue
    #optional << Undead
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈。
    .train 6761 >> 学习职业技能。
    .target 卡普拉克
    .xp <16,1
step << Priest
    #optional << Undead
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
	.train 8122 >>学习职业技能
    .target 泰金
    .xp <14,1
    .xp >16,1
step << Priest
    #optional << Undead
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
	.train 8102 >>学习职业技能
    .target 泰金
    .xp <16,1
step << Warrior
    #optional << Undead
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 285 >>学习职业技能
    .target 塔绍尔·锯痕
    .xp <16,1
step << Warlock
    #optional << Undead
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜格鲁·血怒|r交谈。
    .train 6222 >> 学习职业技能。
    .target 杜格鲁·血怒
    .xp <14,1
    .xp >16,1
step << Warlock
    #optional << Undead
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜格鲁·血怒|r交谈。
    .train 1455 >> 学习职业技能。
    .target 杜格鲁·血怒
    .xp <16,1
step
    #label Conscript
    .goto Durotar,50.8,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林·寻路者|r交谈
    .accept 840 >>接受任务：部落的新兵
    .target 塔克林·寻路者
step
    #completewith next
    .subzone 379 >> 前往前沿哨所。
step
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加尔|r交谈
    .turnin 840 >>交任务：部落的新兵
    .accept 842 >>接受任务：十字路口征兵
    .target 卡加尔·战痕
]])
