local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
#tbc
#season 0,1
<< Alliance
#name 1-6 Northshire
#version 1
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#defaultfor Human
#next 6-11 Elwynn Forest
#displayname 1-6 北郡
step << !Human
    #completewith next
    +你选择了人类专用指南。请选择与你实际出生区域对应的新手区指南
step << Mage
    #completewith next
    +注意：你选择了法师单体练级指南。单体练级比群体刷怪安全得多，但速度也慢得多
step << !Human Mage
    #season 2
    #completewith next
    +在探索赛季，法师不应从其他种族的新手区开始练级，因为你无法在这里获得第一个符文（|T135844:0|t[冰枪术]）
step
    #softcore << Warlock
    #optional
    #completewith Within
    .destroy 6948 >> 删除背包里的 |T134414:0|t[炉石]，之后不再需要
step << Warlock
    #season 2
    #sticky
    #label WarlockVendor << Human
    .goto Elwynn Forest,50.051,42.689
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹恩·温斯洛|r 对话
    .vendor >> |cRXP_WARN_出售胸甲、衬衣、裤子和靴子，以及背包中的食物和水；总共需要10铜币|r
    .target 丹恩·温斯洛
step << Human Warlock
    #season 2
    #loop
    .goto 1429,49.052,38.270,0
    .goto 1429,45.708,38.720,0
    .goto 1429,47.976,39.422,0
    .goto 1429,46.465,38.272,45,0
    .goto 1429,45.896,38.013,45,0
    .goto 1429,45.708,38.720,45,0
    .goto 1429,46.302,39.994,45,0
    .goto 1429,45.718,40.733,45,0
    .goto 1429,46.399,41.838,45,0
    .goto 1429,46.741,40.987,45,0
    .goto 1429,47.703,40.299,45,0
    .goto 1429,47.976,39.422,45,0
    .goto 1429,49.052,38.270,45,0
    .goto 1429,48.362,37.582,45,0
    .goto 1429,47.136,37.636,45,0
    .goto 1429,46.870,36.906,45,0
    .goto 1429,46.476,37.034,45,0
    .xp 2 >> 刷到2级
    .mob 幼狼
step << Warlock
    #season 0,1
    #completewith next
    .goto Elwynn Forest,50.051,42.689
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹恩·温斯洛|r 对话
    .vendor >> |cRXP_WARN_出售胸甲、衬衣、裤子和靴子，以及背包中的食物和水；总共需要10铜币|r
    .target 丹恩·温斯洛
step << Warlock
    #season 0,1
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜希拉·拉萨雷|r 对话
    .accept 1598 >> 接任务：失窃的典籍
    .train 348 >> 学习 |T135817:0|t[献祭]
    .target 杜希拉·拉萨雷
step << Warlock
    #season 2
    #requires WarlockVendor << Human
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜希拉·拉萨雷|r 对话
    .accept 1598 >> 接任务：失窃的典籍
    .accept 77621 >> 接任务：失窃的力量 << Human
    .train 348 >> 学习 |T135817:0|t[献祭]
    .target 杜希拉·拉萨雷
step << Warlock
    #season 2
    .goto Elwynn Forest,52.544,51.922
    >>|cRXP_WARN_小心避开尽可能多的|cRXP_ENEMY_迪菲亚暴徒|r，前往|r|cRXP_PICK_迪菲亚储藏箱|r
    >>|cRXP_WARN_击杀|cRXP_ENEMY_迪菲亚暴徒|r，它们在|r|cRXP_PICK_迪菲亚储藏箱|r周围
    >>|cRXP_WARN_打开地上的|cRXP_PICK_迪菲亚储藏箱|r，拾取其中的|r|T134419:0|t|cRXP_LOOT_[鬼影缠身符文]|r
    .collect 205230,1 -- Rune of Haunting (1)
    .train 403919,1
step << Warlock
    #season 2
    #label RoH
    .train 403919 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[鬼影缠身符文]|r|cRXP_WARN_学习|r|T236298:0|t[鬼影缠身]
    .use 205230
    .itemcount 205230,1
step << Warlock
    #hardcore
--   .goto Elwynn Forest,52.9,44.3,60,0
    .goto Elwynn Forest,56.7,44.0
    >>|cRXP_WARN_跑进迪菲亚营地的帐篷里|r
    >>打开 |cRXP_PICK_被偷走的书|r, 获取 |cRXP_LOOT_虚空灵能|r
    >>|cRXP_WARN_你可以在帐篷内安全地拾取|cRXP_LOOT_虚空灵能|r！请观看视频了解操作方法|r
    .link https://youtu.be/3qQwsJhAZIk >> |cRXP_WARN_点击这里查看视频参考|r
    .complete 1598,1 --Collect Powers of the Void (x1)
step << Warlock
    #hardcore
    #completewith next
    .goto Elwynn Forest,56.828,43.734
    >>|cRXP_WARN_留在帐篷里,这样 |cRXP_ENEMY_迪菲亚暴徒|r 就打不到你了|r
    .hs >> 炉石回 北郡山谷
step << Warlock
    #softcore
--  .goto Elwynn Forest,52.9,44.3,60,0
    .goto Elwynn Forest,56.7,44.0
    >>|cRXP_WARN_跑进迪菲亚营地的帐篷里|r
    >>打开 |cRXP_PICK_被偷走的书|r, 获取 |cRXP_LOOT_虚空灵能|r
    >>|cRXP_WARN_你可以在帐篷内安全地拾取|cRXP_LOOT_虚空灵能|r！请观看视频了解操作方法|r
    .link https://www.youtube.com/watch?v=_-KEke9Yeik >> |cRXP_WARN_点击这里查看视频参考|r
    .complete 1598,1 --Collect Powers of the Void (x1)
step << Warlock
    #softcore
    #completewith next
    .goto 1429,49.527,43.491,0
    .deathskip >> 死亡后在灵魂医者处复活
    .target 灵魂医者
step << Warlock
    #season 0,1
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜希拉·拉萨雷|r 对话
    .turnin 1598 >> 交任务：失窃的典籍
    .target 杜希拉·拉萨雷
step << Warlock
    #season 2
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜希拉·拉萨雷|r 对话
    .turnin 1598 >> 交任务：失窃的典籍
    .turnin 77621 >> 交任务：失窃的力量 << Human
    .target 杜希拉·拉萨雷
step << Human Warlock
    #season 2
    #label GlovesEquip
    #completewith RestandR
    .equip 10,711 >> |cRXP_WARN_装备|r |T132961:0|t[破布手套]
    .use 711
    .itemcount 711,1 --Tattered Cloth Gloves (1)
    .itemStat 10,LEVEL,<5
    .train 403919,3
step << Human Warlock
    #season 2
    #requires GlovesEquip
    #completewith RestandR
    .engrave 10 >>|cRXP_WARN_在|r|T132961:0|t[破布手套]|cRXP_WARN_上铭刻|r|T236298:0|t[鬼影缠身]
    .train 403919,3
step << Warlock
    #optional
    #completewith next
    .cast 688 >> |cRXP_WARN_施放|r |T136218:0|t[召唤小鬼]
    .usespell 688
step
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 783 >> 接任务：身边的危机
    .target 维里副队长
step << Warrior
    #xprate <1.59
    .goto Elwynn Forest,46.4,40.3,35,0
    >>杀死 |cRXP_ENEMY_幼狼|r,直到你拥有价值 10 铜币以上的杂物
    >>|cRXP_WARN_你会学习|r |T132333:0|t[战斗怒吼] |cRXP_WARN_，这能提高前期升级效率|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹尼尔修士|r 对话
    .vendor >> |cRXP_WARN_卖掉杂物|r
    .target +丹尼尔修士
    .goto Elwynn Forest,47.486,41.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的 |cRXP_FRIENDLY_莱尼·拜舍尔|r 对话
    .train 6673 >>学习 |T132333:0|t[战斗怒吼]
    .target +莱尼·拜舍尔
    .goto Elwynn Forest,50.242,42.287
    .mob 幼狼
step
    #label Within
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官玛克布莱德|r 对话
    .turnin 783 >> 交任务：身边的危机
    .accept 7 >> 接任务：剿灭狗头人
    .target 治安官玛克布莱德
step
    .goto Elwynn Forest,48.171,42.943
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 5261 >> 接任务：伊根·派特斯金纳
    .target 维里副队长
step
    #label EaganWolves
    .goto Elwynn Forest,48.941,40.166
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊根·派特斯金纳|r 对话
    .turnin 5261 >> 交任务：伊根·派特斯金纳
    .accept 33 >> 接任务：林中的群狼
    .target 伊根·派特斯金纳
step << Priest/Mage/Warlock
    #completewith next
    .goto Elwynn Forest,46.2,40.4,40,0
    .goto Elwynn Forest,47.486,41.566
    >>|cRXP_WARN_当你拥有价值50铜币的杂物时：|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    >>卖掉杂物
    >>|cRXP_BUY_向他购买10份|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
    .collect 159,10 --Collect Refreshing Spring Water (x10)
    .target 丹尼尔修士
step
    #sticky
    #label WolfMeatEnd
    .goto 1429,49.052,38.270,0
    .goto 1429,45.708,38.720,0
    .goto 1429,47.976,39.422,0
    .waypoint 1429,49.052,38.270,45,0
    .waypoint 1429,48.362,37.582,45,0
    .waypoint 1429,47.136,37.636,45,0
    .waypoint 1429,46.870,36.906,45,0
    .waypoint 1429,46.476,37.034,45,0
    .waypoint 1429,46.465,38.272,45,0
    .waypoint 1429,45.896,38.013,45,0
    .waypoint 1429,45.708,38.720,45,0
    .waypoint 1429,46.302,39.994,45,0
    .waypoint 1429,45.718,40.733,45,0
    .waypoint 1429,46.399,41.838,45,0
    .waypoint 1429,46.741,40.987,45,0
    .waypoint 1429,47.703,40.299,45,0
    .waypoint 1429,47.976,39.422,45,0
    >>击杀|cRXP_ENEMY_幼狼|r和|cRXP_ENEMY_森林狼|r，拾取它们的|cRXP_LOOT_硬狼肉|r
    .complete 33,1 --Collect Tough Wolf Meat (x8)
	.mob 幼狼
	.mob 森林狼
step
    #loop
    .goto 1429,47.601,36.720,0
    .goto 1429,49.215,37.010,0
    .goto 1429,47.569,34.967,0
    .goto 1429,47.601,36.720,45,0
    .goto 1429,47.381,36.314,45,0
    .goto 1429,47.611,35.863,45,0
    .goto 1429,48.314,36.487,45,0
    .goto 1429,49.070,36.438,45,0
    .goto 1429,49.215,37.010,45,0
    .goto 1429,49.838,36.413,45,0
    .goto 1429,50.105,35.668,45,0
    .goto 1429,49.823,35.161,45,0
    .goto 1429,48.845,35.066,45,0
    .goto 1429,47.569,34.967,45,0
    >>击杀|cRXP_ENEMY_狗头人歹徒|r
    .complete 7,1 --Kill Kobold Vermin (x10)
    .mob 狗头人歹徒
step
    #xprate >1.59
    #optional
    #completewith next
    .goto 1429,45.718,40.733,0
    .xp 3+720 >> 刷怪至 720+/1400 经验值
    .mob 幼狼
	.mob 森林狼
step
    #requires WolfMeatEnd
    .goto Elwynn Forest,48.941,40.166
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊根·派特斯金纳|r 对话
    .turnin 33,2 >> 交任务：林中的群狼 << Warrior/Paladin/Rogue
    .turnin 33,1 >> 交任务：林中的群狼 << !Warrior !Paladin !Rogue
    .target 伊根·派特斯金纳
step
    #xprate >1.59
    #optional
    #loop
    .goto 1429,45.718,40.733,0
    .goto 1429,47.976,39.422,45,0
    .goto 1429,47.703,40.299,45,0
    .goto 1429,46.741,40.987,45,0
    .goto 1429,46.399,41.838,45,0
    .goto 1429,45.718,40.733,45,0
    .goto 1429,46.302,39.994,45,0
    .goto 1429,45.708,38.720,45,0
    .goto 1429,45.896,38.013,45,0
    .xp 3+1060 >> 刷怪至 1060+/1400 经验值
    .mob 幼狼
	.mob 森林狼
step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith CleanupEnd
    +|cRXP_WARN_刷怪并卖掉杂物，直到拥有1银35铜|r
    .money >0.0135
    .train 100,1 << Warrior --Charge
    .train 20271,1 << Paladin --Judgement
    .isOnQuest 7
step << Priest/Mage/Warlock
    .goto Elwynn Forest,47.486,41.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    >>卖掉杂物
    >>|cRXP_BUY_向他再购买10份|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r
    >>|cRXP_WARN_务必留出至少10铜币，供后续使用|r << Priest/Mage
    .collect 159,10 --Collect Refreshing Spring Water (x10)
    .target 丹尼尔修士
step << !Priest !Mage !Warlock !Rogue
    .goto Elwynn Forest,47.691,41.417
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高德瑞克·洛斯迦|r交谈
    .vendor >>卖掉杂物
    .target 高德瑞克·洛斯迦
step << Rogue
    #season 0,1
    .goto Elwynn Forest,47.240,41.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚努斯·哈默纳克|r交谈
    .vendor 78 >>|cRXP_BUY_购买一把|r|T135650:0|t[简易匕首]|cRXP_BUY_（向他购买，前提是你能负担得起）|r
    .collect 2139,1 -- Dirk (1)
    .disablecheckbox
    .target 亚努斯·哈默纳克
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.2
step << Rogue
    #season 0,1
    #completewith next
    +|cRXP_WARN_装备|r|T135650:0|t[简易匕首]
    .use 2139
    .itemcount 2139,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.2
step
    #label CleanupEnd
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官玛克布莱德|r 对话
    .turnin 7 >> 交任务：剿灭狗头人
    .accept 15 >> 接任务：回音山调查行动
    .accept 3100 >> 接任务：简要的信件 << Warrior
    .accept 3101 >> 接任务：圣洁信件 << Paladin
    .accept 3102 >> 接任务：密文信件 << Rogue
    .accept 3103 >> 接任务：神圣信件 << Priest
    .accept 3104 >> 接任务：雕文信件 << Mage
    .accept 3105 >> 接任务：被污染的信件 << Warlock
    .target 治安官玛克布莱德
step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith next
    +|cRXP_WARN_刷怪并卖掉杂物，直到拥有2银10铜|r
    .money >0.0210
    .train 100,1 << Warrior --Charge
    .train 20271,1 << Paladin --Judgement
----Start of 2x level 4 training----
step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .goto 1429,48.79,41.58,12,0
    .goto 1429,48.975,41.146,12,0
    .goto 1429,49.262,40.633,12,0
    .goto 1429,49.510,40.095,6,0
    .goto 1429,49.691,40.230,6,0
    .goto 1429,49.595,40.673,6,0
    .goto 1429,49.324,40.492,6,0
    .goto 1429,49.436,39.881,10,0
    .goto Elwynn Forest,49.661,39.402,12 >>前往楼上的|cRXP_FRIENDLY_凯尔登·布雷门|r处
step << Mage
    #xprate >1.59
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上室内的 |cRXP_FRIENDLY_凯尔登·布雷门|r 对话
    .goto Elwynn Forest,49.661,39.402
    .turnin 3104 >> 交任务：雕文信件
    .trainer >> 学习职业技能
    .target 凯尔登·布雷门
step << Mage
    #xprate >1.59
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上室内的 |cRXP_FRIENDLY_凯尔登·布雷门|r 对话
    .goto Elwynn Forest,49.661,39.402
    .turnin 3104 >> 交任务：雕文信件
    .accept 77620 >> 接任务：法术研究 << Human Mage
    .trainer >> 学习职业技能
    .target 凯尔登·布雷门
step << Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto Elwynn Forest,49.3,40.7,15,0
    .goto Elwynn Forest,49.8,40.2,10 >> 向一楼室内的 |cRXP_FRIENDLY_女牧师安妮塔|r 移动
step << Priest
    #xprate >1.59
    #season 0,1
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与一楼室内的 |cRXP_FRIENDLY_女牧师安妮塔|r 对话
    .turnin 3103 >> 交任务：神圣信件
    .trainer >> 学习职业技能
    .target 女牧师安妮塔
step << Priest
    #xprate >1.59
    #season 2
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与一楼室内的 |cRXP_FRIENDLY_女牧师安妮塔|r 对话
    .turnin 3103 >> 交任务：神圣信件
    .accept 77619 >> 接任务：圣光之思 << Human Priest
    .trainer >> 学习职业技能
    .target 女牧师安妮塔
step << Warrior/Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto Elwynn Forest,48.85,41.76,15,0
    .goto Elwynn Forest,49.6,41.8,15 >> 向一楼室内的 |cRXP_FRIENDLY_莱尼·拜舍尔|r 移动 << Warrior
    .goto Elwynn Forest,49.6,41.8,15 >> 向一楼室内的 |cRXP_FRIENDLY_萨缪尔修士|r 移动 << Paladin
step << Warrior
    #xprate >1.59
    #season 0,1
    .goto Elwynn Forest,50.242,42.287
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的 |cRXP_FRIENDLY_莱尼·拜舍尔|r 对话
    .turnin 3100 >> 交任务：简要的信件
    .trainer >> 学习职业技能
    .target 莱尼·拜舍尔
step << Warrior
    #xprate >1.59
    #season 2
    .goto Elwynn Forest,50.242,42.287
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的 |cRXP_FRIENDLY_莱尼·拜舍尔|r 对话
    .turnin 3100 >> 交任务：简要的信件
    .accept 77616 >> 接任务：失落的符文 << Human
    .trainer >> 学习职业技能
    .target 莱尼·拜舍尔
step << Paladin
    #xprate >1.59
    #season 0,1
    .goto Elwynn Forest,50.433,42.124
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨缪尔修士|r 对话
    .turnin 3101 >> 交任务：圣洁信件
    .trainer >> 学习职业技能
    .target 萨缪尔修士
step << Human Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto Elwynn Forest,49.3,40.7,15,0
    .goto Elwynn Forest,49.8,40.2,10 >> 向一楼室内的 |cRXP_FRIENDLY_女牧师安妮塔|r 移动
step << Warlock
    #xprate >1.59
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜希拉·拉萨雷|r 对话
    .turnin 3105 >> 交任务：被污染的信件
    .train 172 >>学习 |T136118:0|t[腐蚀术]
    .target 杜希拉·拉萨雷
----End of 2x training section----
step
    #season 0,1 << Priest/Warrior
    #loop
    .goto 1429,47.468,36.298,0
    .goto 1429,50.224,34.125,0
    .goto 1429,50.835,38.046,0
    .goto 1429,47.468,36.298,45,0
    .goto 1429,47.247,35.164,45,0
    .goto 1429,47.012,33.828,45,0
    .goto 1429,46.774,33.271,45,0
    .goto 1429,46.271,32.489,45,0
    .goto 1429,47.663,32.058,45,0
    .goto 1429,48.038,33.075,45,0
    .goto 1429,48.795,33.815,45,0
    .goto 1429,49.278,34.610,45,0
    .goto 1429,50.224,34.125,45,0
    .goto 1429,50.245,34.884,45,0
    .goto 1429,51.058,35.582,45,0
    .goto 1429,52.062,35.801,45,0
    .goto 1429,51.505,38.064,45,0
    .goto 1429,50.835,38.046,45,0
    >>击杀|cRXP_ENEMY_狗头人劳工|r
    .complete 15,1 --Kill Kobold Worker (x10)
    .mob 狗头人劳工
----Start of 1x train section----
step
    #xprate <1.59
    #sticky
    #label xp3
    .goto 1429,49.052,38.270,0
    .goto 1429,45.708,38.720,0
    .goto 1429,47.976,39.422,0
    .goto 1429,46.465,38.272,45,0
    .goto 1429,45.896,38.013,45,0
    .goto 1429,45.708,38.720,45,0
    .goto 1429,46.302,39.994,45,0
    .goto 1429,45.718,40.733,45,0
    .goto 1429,46.399,41.838,45,0
    .goto 1429,46.741,40.987,45,0
    .goto 1429,47.703,40.299,45,0
    .goto 1429,47.976,39.422,45,0
    .goto 1429,49.052,38.270,45,0
    .goto 1429,48.362,37.582,45,0
    .goto 1429,47.136,37.636,45,0
    .goto 1429,46.870,36.906,45,0
    .goto 1429,46.476,37.034,45,0
    .xp 3+1110 >>刷怪至1110+/1400经验值
step
    #xprate <1.59
    #season 0,1 << Warrior
    #completewith next
    .goto Elwynn Forest,47.691,41.417
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高德瑞克·洛斯迦|r 对话
    .vendor >> |cRXP_WARN_卖掉杂物|r
    .target 高德瑞克·洛斯迦
--N need SoM xp note
step
    #xprate <1.59
    #requires xp3
    #label Investigate
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官玛克布莱德|r 对话
    .turnin 15 >> 交任务：回音山调查行动
    .accept 21 >> 接任务：回音山清剿行动
    .target 治安官玛克布莱德
step << Mage
    #xprate <1.59
    #optional
    #completewith next
    .goto 1429,48.79,41.58,12,0
    .goto 1429,48.975,41.146,12,0
    .goto 1429,49.262,40.633,12,0
    .goto 1429,49.510,40.095,6,0
    .goto 1429,49.691,40.230,6,0
    .goto 1429,49.595,40.673,6,0
    .goto 1429,49.324,40.492,6,0
    .goto 1429,49.436,39.881,10,0
    .goto Elwynn Forest,49.661,39.402,12 >>前往楼上的|cRXP_FRIENDLY_凯尔登·布雷门|r处
step << Mage
    #xprate <1.59
    #season 0,1
    .goto Elwynn Forest,49.661,39.402
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上室内的 |cRXP_FRIENDLY_凯尔登·布雷门|r 对话
    .turnin 3104 >> 交任务：雕文信件
    .trainer >> 学习职业技能
    .target 凯尔登·布雷门
step << Priest
    #xprate <1.59
    #optional
    #completewith next
    .goto Elwynn Forest,49.3,40.7,15,0
    .goto Elwynn Forest,49.8,40.2,10 >> 向一楼室内的 |cRXP_FRIENDLY_女牧师安妮塔|r 移动
step << Priest
    #xprate <1.59
    #season 0,1
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与一楼室内的 |cRXP_FRIENDLY_女牧师安妮塔|r 对话
    .turnin 3103 >> 交任务：神圣信件
    .trainer >> 学习职业技能
    .target 女牧师安妮塔
step << Warrior/Paladin
    #xprate <1.59
    #optional
    #completewith next
    .goto Elwynn Forest,48.85,41.76,15,0
    .goto Elwynn Forest,49.6,41.8,15 >> 向一楼室内的 |cRXP_FRIENDLY_莱尼·拜舍尔|r 移动 << Warrior
    .goto Elwynn Forest,49.6,41.8,15 >> 向一楼室内的 |cRXP_FRIENDLY_萨缪尔修士|r 移动 << Paladin
step << Warrior
    #xprate <1.59
    #season 0,1
    .goto Elwynn Forest,50.242,42.287
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的 |cRXP_FRIENDLY_莱尼·拜舍尔|r 对话
    .turnin 3100 >> 交任务：简要的信件
    .trainer >> 学习职业技能
    .target 莱尼·拜舍尔
step << Paladin
    #xprate <1.59
    #season 0,1
    .goto Elwynn Forest,50.433,42.124
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨缪尔修士|r 对话
    .turnin 3101 >> 交任务：圣洁信件
    .trainer >> 学习职业技能
    .target 萨缪尔修士
step
    #xprate <1.59
    #season 0,1 << Warrior
    .goto Elwynn Forest,48.171,42.943
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 18 >> 接任务：潜行者兄弟会
    .target 维里副队长
step << Warlock
    #xprate <1.59
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜希拉·拉萨雷|r 对话
    .turnin 3105 >> 交任务：被污染的信件
    .train 172 >>学习 |T136118:0|t[腐蚀术]
    .target 杜希拉·拉萨雷
----End of 1x train section----
step
    #season 0,1
    #loop
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,30,0
    .goto Elwynn Forest,53.89,50.52,30,0
    .goto Elwynn Forest,55.09,49.00,30,0
    .goto Elwynn Forest,55.43,45.87,30,0
    .goto Elwynn Forest,53.86,47.05,30,0
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r，拾取它们的|cRXP_LOOT_红色粗麻面罩|r
    .complete 18,1 --Collect Red Burlap Bandana (x12)
    .mob 迪菲亚暴徒
step << Rogue
    #xprate <1.59
    #season 2
    .goto Elwynn Forest,50.314,39.916
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔里克·克里丹|r 对话
    .turnin 3102 >> 交任务：密文信件
    .accept 77618 >> 接任务：三度失窃 << Human
    .train 1784 >>学习 |T132320:0|t[潜行]
    .train 921 >>学习 |T133644:0|t[搜索]
    .target 乔里克·克里丹
step << Rogue
    #xprate <1.59
    #season 2
    #sticky
    #label Shadowstrike1
    .goto Elwynn Forest,52.544,51.922
    >>|cRXP_WARN_打开地上的|cRXP_PICK_迪菲亚储藏箱|r，拾取其中的|r|T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    .collect 204795,1 -- Rune of Shadowstrike (1)
    .train 400105,1
step << Rogue
    #xprate <1.59
    #season 2
    #sticky
    #requires Shadowstrike1
    #label Shadowstrike2
    .train 400105 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[暗影打击符文]|r|cRXP_WARN_学习|r|T132291:0|t[暗影打击]
    .use 204795
    .itemcount 204795,1
step << Mage
    #season 2
    #loop
    #sticky
    #completewith RedBurlapBandana << !Human
    #label CALEENCI
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .waypoint Elwynn Forest,52.55,48.79,30,0
    .waypoint Elwynn Forest,53.89,50.52,30,0
    .waypoint Elwynn Forest,55.09,49.00,30,0
    .waypoint Elwynn Forest,55.43,45.87,30,0
    .waypoint Elwynn Forest,53.86,47.05,30,0
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r，拾取|T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r
    >>|cRXP_WARN_注意：你无法在这里学习|r|T135844:0|t[冰枪术]|cRXP_WARN_，因为|r|T133736:0|t[理解入门]|cRXP_WARN_只能在你所属种族的新手区获得|r << !Human
    .collect 203751,1,77620,1 -- Spell Notes: CALE ENCI (1)
    .mob 迪菲亚暴徒
    .train 401760,1
step << Human Mage
    #season 2
    #requires CALEENCI
    #label CALEENCI2
    .train 401760 >>|cRXP_WARN_使用|r|T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r|cRXP_WARN_学习|r|T135844:0|t[冰枪术]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
step << Paladin
    #xprate <1.59
    #season 2
    #loop
    #label Libram1
    #sticky
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .waypoint Elwynn Forest,52.55,48.79,30,0
    .waypoint Elwynn Forest,53.89,50.52,30,0
    .waypoint Elwynn Forest,55.09,49.00,30,0
    .waypoint Elwynn Forest,55.43,45.87,30,0
    .waypoint Elwynn Forest,53.86,47.05,30,0
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r，拾取|T134916:0|t|cRXP_LOOT_[审判圣契]|r
    .collect 205420,1 -- Libram of Judgement (1)
    .mob 迪菲亚暴徒
    .train 410002,1
step << Paladin
    #xprate <1.59
    #season 2
    #sticky
    #label Libram2
    #requires Libram1
    .equip 18,205420 >> |cRXP_WARN_装备|r |T134916:0|t|cRXP_LOOT_[审判圣契]|r
    .use 205420
    .itemcount 205420,1 --Libram of Judgement (1)
    .train 410002,1
step << Paladin
    #xprate <1.59
    #season 2
    #loop
    #sticky
    #label Libram3
    #requires Libram2
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .waypoint Elwynn Forest,53.86,47.05,30,0
    .waypoint Elwynn Forest,55.43,45.87,30,0
    .waypoint Elwynn Forest,55.09,49.00,30,0
    .waypoint Elwynn Forest,53.89,50.52,30,0
    .waypoint Elwynn Forest,52.55,48.79,30,0
    .aura 408828 >>|cRXP_WARN_施放|r|T135959:0|t[审判]|cRXP_WARN_10次，获得|r|T136116:0|t[灵感勃发]|cRXP_WARN_增益|r
    .itemStat 18,QUALITY,2
    .train 410002,1
step << Paladin
    #xprate <1.59
    #season 2
    #sticky
    #label Libram4
    #requires Libram3
    .cast 409920 >>|cRXP_WARN_使用|r|T134916:0|t|cRXP_LOOT_[审判圣契]|r|cRXP_WARN_学习|r|T135891:0|t[十字军打击]
    .use 205420
    .aura -408828
    .train 410002,1
step << Paladin
    #xprate <1.59
    #season 2
    #label Libram5
    #requires Libram4
    #completewith RedBurlapBandana
    .equip 10 >>|cRXP_WARN_如果已有一副|r|T132938:0|t|cRXP_LOOT_[手套]|r|cRXP_WARN_，就把它装备上；否则在之后拾取到时装备|r
    .train 410002,3
step << Paladin
    #xprate <1.59
    #season 2
    #requires Libram5
    #completewith RedBurlapBandana
    .engrave 10 >>|cRXP_WARN_在|r|T132938:0|t|cRXP_LOOT_[手套]|r|cRXP_WARN_上铭刻|r|T135891:0|t[十字军打击]
    .train 410002,3
step
    #xprate <1.59 << Paladin/Rogue
    #season 2
    #loop
    #label RedBurlapBandana
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,30,0
    .goto Elwynn Forest,53.89,50.52,30,0
    .goto Elwynn Forest,55.09,49.00,30,0
    .goto Elwynn Forest,55.43,45.87,30,0
    .goto Elwynn Forest,53.86,47.05,30,0
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r，拾取它们的|cRXP_LOOT_红色粗麻面罩|r
    .complete 18,1 --Collect Red Burlap Bandana (x12)
	.mob 迪菲亚暴徒
step << Rogue
    #xprate <1.59
    #optional
    #loop
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,30,0
    .goto Elwynn Forest,53.89,50.52,30,0
    .goto Elwynn Forest,55.09,49.00,30,0
    .goto Elwynn Forest,55.43,45.87,30,0
    .goto Elwynn Forest,53.86,47.05,30,0
    .xp 4 >> 刷到 4 级
step << Human Rogue
    #xprate <1.59
    #season 2
    .goto Elwynn Forest,50.314,39.916
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔里克·克里丹|r 对话
    .turnin 77618 >> 交任务：三度失窃 << Human
    .target 乔里克·克里丹
step << Human Rogue
    #xprate <1.59
    #season 2
    #label GlovesEquip
    #completewith RestandR
    .equip 10,2125 >> |cRXP_WARN_装备|r |T132952:0|t[破损的皮手套]
    .use 2125
    .itemcount 2125,1 --Cracked Leather Gloves (1)
    .itemStat 10,LEVEL,<5
    .train 400105,3
step << Human Rogue
    #xprate <1.59
    #season 2
    #requires GlovesEquip
    #completewith RestandR
    .engrave 10 >>|cRXP_WARN_在|r|T132952:0|t[破损的皮手套]|cRXP_WARN_上铭刻|r|T132291:0|t[暗影打击]
    .train 400105,3
step << !Human/!Rogue
    #xprate <1.59
    #season 2
    #softcore
    #completewith next
    #requires CALEENCI2 << Mage
    #requires Libram4 << Paladin
    #requires Shadowstrike2 << Rogue
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
--   .subzoneskip 59,1
step << Human Rogue
    #xprate <1.59
    #season 2
    #requires Shadowstrike2
    .goto Elwynn Forest,50.314,39.916
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔里克·克里丹|r 对话
    .turnin 77618 >> 交任务：三度失窃
    .target 乔里克·克里丹
    .isOnQuest 77618
step << !Paladin !Rogue
    #xprate >1.59
    #season 2
    #requires CALEENCI2 << Mage
--   #requires Libram4 << Paladin
--  #requires Shadowstrike2 << Rogue
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 18,1 >> 交任务：潜行者兄弟会 << Rogue/Warlock
    .turnin 18,2 >> 交任务：潜行者兄弟会 << Priest
    .turnin 18,3 >> 交任务：潜行者兄弟会 << Warrior
    .turnin 18,4 >> 交任务：潜行者兄弟会 << Paladin
    .turnin 18,5 >> 交任务：潜行者兄弟会 << Mage
    .turnin 18 >> 交任务：潜行者兄弟会 << !Warrior !Priest !Mage !Rogue !Warlock !Paladin
--   .accept 3903 >> Accept Milly Osworth
    .accept 6 >> 接任务：加瑞克·帕德弗特的赏金
    .target 维里副队长
step
    #xprate <1.59
    #season 2
    #requires CALEENCI2 << Mage
    #requires Libram4 << Paladin
    #requires Shadowstrike2 << Rogue
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 18,1 >> 交任务：潜行者兄弟会 << Rogue/Warlock
    .turnin 18,2 >> 交任务：潜行者兄弟会 << Priest
    .turnin 18,3 >> 交任务：潜行者兄弟会 << Warrior
    .turnin 18,4 >> 交任务：潜行者兄弟会 << Paladin
    .turnin 18,5 >> 交任务：潜行者兄弟会 << Mage
    .turnin 18 >> 交任务：潜行者兄弟会 << !Warrior !Priest !Mage !Rogue !Warlock !Paladin
    .accept 3903 >> 接任务：米莉·奥斯沃斯
    .accept 6 >> 接任务：加瑞克·帕德弗特的赏金
    .target 维里副队长
step
    #season 0,1
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 18,1 >> 交任务：潜行者兄弟会 << Rogue/Warlock
    .turnin 18,2 >> 交任务：潜行者兄弟会 << Priest
    .turnin 18,3 >> 交任务：潜行者兄弟会 << Warrior
    .turnin 18,4 >> 交任务：潜行者兄弟会 << Paladin
    .turnin 18,5 >> 交任务：潜行者兄弟会 << Mage
    .turnin 18 >> 交任务：潜行者兄弟会 << !Warrior !Priest !Mage !Rogue !Warlock !Paladin
    .accept 3903 >> 接任务：米莉·奥斯沃斯
    .accept 6 >> 接任务：加瑞克·帕德弗特的赏金
    .target 维里副队长
step << Paladin
    #season 0,1
    #completewith RestandR
    .equip 16,5579 >> |cRXP_WARN_装备|r |T133052:0|t[民兵战锤]
    .use 5579
    .itemcount 5579,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.6
step << Paladin
    #xprate <1.59
    #season 2
    #completewith RestandR
    .equip 16,5579 >> |cRXP_WARN_装备|r |T133052:0|t[民兵战锤]
    .use 5579
    .itemcount 5579,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.6
step << Rogue
    #xprate <1.59
    #season 2
    #completewith RestandR
    .equip 16,2224 >> 装备 |T135641:0|t[民兵匕首]
    .use 2224
    .itemcount 2224,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.0
step << Rogue
    #season 0,1
    #completewith RestandR
    .equip 16,2224 >> 装备 |T135641:0|t[民兵匕首]
    .use 2224
    .itemcount 2224,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.0
step << Warrior
    #completewith RestandR
    .equip 16,1161 >> 装备 |T135274:0|t[民兵短剑]
    .use 1161
    .itemcount 1161,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.0
step
    #xprate >1.59
    #season 0,1 << Priest/Warrior
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官玛克布莱德|r 对话
    .turnin 15 >> 交任务：回音山调查行动
    .accept 21 >> 接任务：回音山清剿行动
    .target 治安官玛克布莱德
step << Human Mage
    #season 2
    #optional
    #completewith next
    .goto 1429,48.79,41.58,12,0
    .goto 1429,48.975,41.146,12,0
    .goto 1429,49.262,40.633,12,0
    .goto 1429,49.510,40.095,6,0
    .goto 1429,49.691,40.230,6,0
    .goto 1429,49.595,40.673,6,0
    .goto 1429,49.324,40.492,6,0
    .goto 1429,49.436,39.881,10,0
    .goto Elwynn Forest,49.661,39.402,12 >>前往楼上的|cRXP_FRIENDLY_凯尔登·布雷门|r处
    .isQuestComplete 77620
step << Human Mage
    #season 2
    .goto Elwynn Forest,49.661,39.402
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与室内的 |cRXP_FRIENDLY_凯尔登·布雷门|r 对话
    .turnin 77620 >> 交任务：法术研究
    .target 凯尔登·布雷门
    .isQuestComplete 77620
step << Human Mage
    #season 2
    #label GlovesEquip
    #completewith RestandR
    .equip 10,711 >> |cRXP_WARN_装备|r |T132961:0|t[破布手套]
    .use 711
    .itemcount 711,1 --Tattered Cloth Gloves (1)
    .itemStat 10,LEVEL,<5
    .train 401760,3
step << Human Mage
    #xprate <1.59
    #season 2
    #requires GlovesEquip
    #completewith RestandR
    .engrave 10 >>|cRXP_WARN_在|r|T132961:0|t[破布手套]|cRXP_WARN_上铭刻|r|T135844:0|t[冰枪术]
    .train 401760,3
step << Warrior/Paladin
    #xprate <1.59
    #season 2
    #optional
    #completewith next
    .goto Elwynn Forest,48.85,41.76,15,0
    .goto Elwynn Forest,49.6,41.8,15 >> 向一楼室内的 |cRXP_FRIENDLY_萨缪尔修士|r 移动
step << Human Paladin
    #xprate <1.59
    #season 2
    .isQuestComplete 77617
    .goto Elwynn Forest,50.433,42.124
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨缪尔修士|r 对话
    .turnin 77617 >> 交任务：圣光的圣物
    .target 萨缪尔修士
step << Human Paladin
    #xprate <1.59
    #season 2
    #completewith RestandR
    #label GlovesEquip
    .equip 10,2385 >> |cRXP_WARN_装备|r |T132938:0|t|cRXP_LOOT_[无光泽的链甲手套]|r
    .use 2385
    .itemcount 2385,1
    .itemStat 10,LEVEL,<5
    .train 410002,3
step << Human Paladin
    #xprate <1.59
    #season 2
    #completewith RestandR
    #requires GlovesEquip
    .engrave 10 >> |cRXP_WARN_在|r |T132938:0|t|cRXP_LOOT_[无光泽的链甲手套]|r |cRXP_WARN_上铭刻|r |T135891:0|t[十字军打击]
    .itemStat 10,LEVEL,<5
    .train 410002,3
step
    #optional
    #completewith next
    .goto Elwynn Forest,47.63,32.07,20 >> 进入回音山矿洞
step
    #loop
    .goto 1429,47.784,31.540,0
    .goto 1429,48.659,29.161,0
    .goto 1429,50.491,26.867,0
    .goto 1429,47.784,31.540,30,0
    .goto 1429,47.909,30.850,30,0
    .goto 1429,48.107,30.271,30,0
    .goto 1429,48.428,30.248,30,0
    .goto 1429,48.398,29.842,30,0
    .goto 1429,48.659,29.161,30,0
    .goto 1429,48.245,28.598,30,0
    .goto 1429,48.637,27.354,30,0
    .goto 1429,48.501,26.700,30,0
    .goto 1429,49.979,25.620,30,0
    .goto 1429,50.491,26.867,30,0
    >>击杀回音山矿洞内的|cRXP_ENEMY_狗头人苦力|r
    .complete 21,1 --Kill Kobold Laborer (x12)
    .mob 狗头人苦力
step
    #xprate <1.59
    .goto Elwynn Forest,50.692,39.347
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米莉·奥斯沃斯|r 对话
    >>|cRXP_WARN_跳过后续任务|r << !Priest !Mage
    .turnin 3903 >> 交任务：米莉·奥斯沃斯
    .accept 3904 >> 接任务：米莉的葡萄 << Priest/Mage
    .target 米莉·奥斯沃斯
step << Rogue
    #season 0,1
    .goto Elwynn Forest,50.314,39.916
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔里克·克里丹|r 对话
    .turnin 3102 >> 交任务：密文信件
    .train 1784 >>学习 |T132320:0|t[潜行]
    .train 921 >>学习 |T133644:0|t[搜索]
    .target 乔里克·克里丹
step << Priest/Mage
    #xprate <1.5
    #loop
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,30,0
    .goto Elwynn Forest,53.89,50.52,30,0
    .goto Elwynn Forest,55.09,49.00,30,0
    .goto Elwynn Forest,55.43,45.87,30,0
    .goto Elwynn Forest,53.86,47.05,30,0
    >>拾取地上的|cRXP_PICK_米莉的葡萄|r
    .complete 3904,1 --Collect Milly's Harvest (x8)
step << Rogue
    #sticky
    #label CuttyNote
    #season 2
    .goto 1429,57.518,48.253
    >>使用|T133644:0|t[搜索]从|cRXP_ENEMY_加瑞克·帕德弗特|r身上偷取|T134331:0|t[阿刨的便条]
    >>|cRXP_WARN_必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[搜索]
    .collect 203723,1 -- Cutty's Note (1)
    .mob 加瑞克·帕德弗特
    .train 400094,1
step
    .goto 1429,57.518,48.253
    >>击杀|cRXP_ENEMY_加瑞克·帕德弗特|r，拾取他的|cRXP_LOOT_头颅|r
    .complete 6,1 --Collect Garrick's Head (x1)
    .mob 加瑞克·帕德弗特
step
    #xprate >1.49 << Priest/Mage
    #optional
    #completewith RestandR
    .abandon 3904 >> 放弃<米莉的葡萄>
step
    #xprate <1.5
    #requires CuttyNote << Rogue --Season 2
    #optional
    #loop
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,30,0
    .goto Elwynn Forest,53.89,50.52,30,0
    .goto Elwynn Forest,55.09,49.00,30,0
    .goto Elwynn Forest,55.43,45.87,30,0
    .goto Elwynn Forest,53.86,47.05,30,0
    .xp 5+1735 >> 刷怪至 1735+/2800 经验值 << Paladin/Warrior
    .xp 5+1625 >> 刷怪至 1625+/2800 经验值 << !Paladin !Warrior !Priest !Mage
    .xp 5+1085 >> 刷怪至 1085+/2800 经验值 << Mage
    .xp 5+975 >> 刷怪至 975+/2800 经验值 << Priest
    .mob 迪菲亚暴徒
step
    #xprate >1.49
    #requires CuttyNote << Rogue --Season 2
    #optional
    #loop
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,30,0
    .goto Elwynn Forest,53.89,50.52,30,0
    .goto Elwynn Forest,55.09,49.00,30,0
    .goto Elwynn Forest,55.43,45.87,30,0
    .goto Elwynn Forest,53.86,47.05,30,0
    .xp 5+1205 >> 刷怪至 1205+/2800 经验值 << Paladin/Warrior
    .xp 5+1040 >> 刷怪至 1040+/2800 经验值 << !Paladin !Warrior !Priest
    .xp 5+875 >> 刷怪至 875+/2800 经验值 << Priest
    .mob 迪菲亚暴徒
step
    #optional
    #softcore
    #completewith next
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
-- .subzoneskip 59,1
step << Priest/Mage
    #xprate <1.5
    .goto Elwynn Forest,50.692,39.347
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莉·奥斯沃斯|r交谈
    .turnin 3904 >>交任务 米莉的葡萄
    .accept 3905 >>接受任务 葡萄出货单
    .target 米莉·奥斯沃斯
step
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 6,2 >> 交任务：加瑞克·帕德弗特的赏金 << Warrior/Rogue/Paladin
    .turnin 6,1 >> 交任务：加瑞克·帕德弗特的赏金 << !Warrior !Rogue !Paladin
    .target 维里副队长
step
    #label RestandR
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与室内的 |cRXP_FRIENDLY_治安官玛克布莱德|r 对话
    .turnin 21,1 >> 交任务：回音山清剿行动 << Rogue
    .turnin 21,2 >> 交任务：回音山清剿行动 << Warrior/Paladin
    .turnin 21,3 >> 交任务：回音山清剿行动 << !Warrior !Paladin !Rogue
    .accept 54 >> 接任务：去闪金镇报到
    .target 治安官玛克布莱德
step << Priest/Mage
    #xprate <1.5
    #optional
    #completewith next
    .goto Elwynn Forest,49.6,41.6,15,0
    .goto Elwynn Forest,48.9,41.3,10 >>上楼
step << Priest/Mage
    #xprate <1.5
    .goto Elwynn Forest,49.471,41.586
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_尼尔斯修士|r交谈
    .turnin 3905,1 >>交任务 葡萄出货单
    .target 尼尔斯修士
step << Priest
    #optional
    #season 2
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与室内的 |cRXP_FRIENDLY_女牧师安妮塔|r 对话
    .accept 5623 >> 接任务：圣光的恩赐
    .target 女牧师安妮塔
step << Priest
    #season 0,1
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与室内的 |cRXP_FRIENDLY_女牧师安妮塔|r 对话
    .accept 5623 >> 接任务：圣光的恩赐
    .target 女牧师安妮塔
step
    .goto Elwynn Forest,45.563,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_法尔坎·伊森斯泰德|r 对话
    .accept 2158 >> 接任务：休息和放松
    .target 法尔坎·伊森斯泰德
step << Rogue
    #season 2
    .goto Elwynn Forest,49.983,52.012
    >>与北郡山谷围墙南侧的|cRXP_FRIENDLY_阿刨|r交谈
    >>他会给你|T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    .collect 203990,1 -- Rune of Mutilation (1)
    .skipgossip
    .target 阿刨
    .train 400094,1
step << Rogue
    #season 2
    .train 400094 >> |cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[毁伤符文]|r |cRXP_WARN_学习|r |T132304:0|t[毁伤]
    .use 203990 -- Rune of Mutilation (1)
    .target 阿刨
    .train 400094,1
step << Rogue
    #season 2
    .goto Elwynn Forest,46.122,62.937,5,0
    .goto Elwynn Forest,46.175,62.124
    >>|cRXP_WARN_利用屋外的箱子跳上屋顶，然后跑到烟囱后方|r
    >>打开|cRXP_PICK_生锈的宝箱|r，拾取其中的|T134419:0|t|cRXP_LOOT_[杀手符文]|r
    .collect 203993,1 -- Rune of Slaughter (1)
    .train 424992,1
step << Rogue
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[杀手符文]|r|cRXP_WARN_学习|r|T236280:0|t[暗影杀手]
    .use 203993
    .itemcount 203993,1
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
#tbc
#season 0,1
#version 1
<< Alliance
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 6-11 Elwynn Forest
#next 11-13 Loch Modan
#defaultfor Human
#displayname 6-13 艾尔文森林 << SoD
#displayname 6-11 艾尔文森林
step
    #season 0,1 << Rogue
    #hardcore
    #completewith next
    .subzone 87 >> 前往闪金镇
step
    #hardcore
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官杜汉|r 交谈
    .turnin 54 >> 交任务：去闪金镇报到
    .accept 62 >> 接任务：法戈第矿洞
    .target 治安官杜汉
step
    #season 0,1 << Rogue
    #softcore
    #completewith Goldshire
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处重生
    .target 灵魂医者
    .subzoneskip 87
step << Warrior/Rogue/Paladin
    .goto Elwynn Forest,41.706,65.544
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_铁匠阿古斯|r 交谈
    >>|cRXP_WARN_这样就能制作|r |T135248:0|t[劣质磨刀石]，|cRXP_WARN_使近战伤害提高 2 点|r << Warrior/Rogue
    >>|cRXP_WARN_这样就能制作|r |T135255:0|t[劣质平衡石]，|cRXP_WARN_使近战伤害提高 2 点|r << Paladin
    >>|cRXP_WARN_如果不想学习，就跳过此步骤|r
    .train 2018 >> 学习 |T136241:0|t[锻造]
    .target 铁匠阿古斯
step << Warrior
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_如果钱够，向她购买一把|r |T135321:0|t[步兵剑]|cRXP_BUY_即可|r
    .collect 2488,1 --Collect Gladius (1)
    .disablecheckbox
    .target 科瑞娜·斯蒂利
--  .money <0.0536
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_购买一把|r |T135641:0|t[卷刃的剑]，|cRXP_BUY_有钱再向她购买|r
    .collect 2494,1 --Collect Stiletto (1)
    .disablecheckbox
    .target 科瑞娜·斯蒂利
--  .money <0.0400
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith GSHS
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Paladin
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科瑞娜·斯蒂利|r 交谈
    .vendor 54 >>|cRXP_WARN_购买一把|r |T133053:0|t[木槌棒]，|cRXP_BUY_有钱再向她购买|r
    .collect 2493,1 --Collect Wooden Mallet (1)
    .disablecheckbox
    .target 科瑞娜·斯蒂利
--  .money <0.0631
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0
step << Paladin
    #completewith next
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0
step << Mage/Priest/Warlock
    #optional
    #completewith next
    .goto Elwynn Forest,41.706,65.786
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安德温·克里顿|r 交谈
    .vendor >> 出售杂物
    .target 安德温·克里顿
--  .money >1.0
step
    #label Goldshire
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官杜汉|r 交谈
    .turnin 54 >> 交任务：去闪金镇报到
    .accept 62 >> 接任务：法戈第矿洞
    .target 治安官杜汉
step
    .goto Elwynn Forest,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威廉·匹斯特|r 交谈
    .accept 60 >> 接任务：狗头人的蜡烛
    .target 威廉·匹斯特
step
    #label GSHS
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板法雷|r 交谈
    .turnin 2158,1 >> 交任务：休息和放松 << Rogue/Warrior
    .turnin 2158,2 >> 交任务：休息和放松 << !Rogue !Warrior
    .home >> 将炉石设置在闪金镇
    .target 旅店老板法雷
step
    #optional
    .xp 6 >> 刷怪升到 6 级
step << Rogue
    .goto Elwynn Forest,43.96,65.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛葛·哈姆菲斯特|r交谈
    .vendor 151 >>|cRXP_BUY_购买|r |T135641:0|t[平衡飞刀]，|cRXP_BUY_有钱再向他购买|r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .disablecheckbox
    .target 布洛葛·哈姆菲斯特
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #optional
    #sticky
    #label BalancedDaggers1
    +|cRXP_WARN_装备|r |T135641:0|t[平衡飞刀]
    .use 2946
    .itemcount 2946,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #optional
    #sticky
    #requires BalancedDaggers1
    #label DeleteOldDaggers
    .destroy 2947 >> 摧毁背包里的 |T135426:0|t[小飞刀]，已经不再需要
step << Warlock
    #optional
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >> 下楼
step << Warlock
    .goto Elwynn Forest,44.392,66.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛克西米利安·克洛文|r 交谈
    .trainer >> 学习职业技能
    .target 玛克西米利安·克洛文
step << Warlock
    .goto Elwynn Forest,44.397,65.989
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞琳娜·达克哈特|r 交谈
    .vendor 6374 >> |cRXP_BUY_购买|r |T133738:0|t[魔典：血契（等级 1）]，|cRXP_BUY_有钱再向她购买，钱不够可稍后再买|r
    .target 塞琳娜·达克哈特
    .money <0.0100
    .itemcount 16321,<1 --Grimoire of Blood Pact (Rank 1)
    .train 20397,1 --Blood Pact (Rank 1)
step << Mage/Rogue/Priest
    #optional
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >> 前往旅店二楼
step << Mage
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r 交谈
	.target 扎尔迪玛·维夫希尔特
    .goto Elwynn Forest,43.25,66.19
    .trainer >> 学习职业技能
step << Priest
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_女牧师洁塞塔|r 交谈
	.target 女牧师洁塞塔
    .goto Elwynn Forest,43.283,65.721
    .turnin 5623 >> 交任务：圣光的恩赐
    .accept 5624 >> 接任务：圣光之衣
    .trainer >> 学习职业技能
step << Rogue
    .money <0.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科瑞恩·塞尔留斯|r 交谈
    .target 科瑞恩·塞尔留斯
    .goto Elwynn Forest,43.872,65.937
    .trainer >> 学习职业技能
step << Rogue/Warrior
    .money <0.01
    .goto Elwynn Forest,43.877,66.546,9,0 << Warrior
    .goto Elwynn Forest,43.392,65.550
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米歇尔·贝利|r交谈（楼上）
    .target 米歇尔·贝利
    .train 3273 >> 学习 |T135966:0|t[急救]
step << Warrior/Rogue
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板法雷|r 交谈
    .vendor 295 >> |cRXP_BUY_购买|r |T133995:0|t[达拉然奶酪]，|cRXP_BUY_向他购买，直到只剩 1 银币|r << Warrior
    .vendor 295 >> |cRXP_BUY_购买至多 20 块|r |T133995:0|t[达拉然奶酪]，|cRXP_BUY_由他出售|r << Rogue
    .collect 414,20 --Dalaran Sharp (20)
    .disablecheckbox
    .target 旅店老板法雷
    .itemcount 414,<7 --Dalaran Sharp (<7)
step << Warrior
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_里瑞亚·杜拉克|r 交谈
    .trainer >> 学习职业技能
    .target 里瑞亚·杜拉克
step << Paladin
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威尔海姆修士|r 交谈
    .trainer >> 学习职业技能
    .target 威尔海姆修士
step
    #requires DeleteOldDaggers << Rogue
    .goto Elwynn Forest,42.140,67.254
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷米|r 交谈
    .accept 47 >> 接任务：金砂交易
    .target 雷米
step << Priest
    .goto Elwynn Forest,48.148,68.046
    >>|cRXP_WARN_施放|r |T135929:0|t[次级治疗术（等级 2）] |cRXP_WARN_和|r |T135987:0|t[真言术：韧]，|cRXP_WARN_目标为|r |cRXP_FRIENDLY_卫兵罗伯兹|r
    .complete 5624,1 --Heal and fortify Guard Roberts
    .target 卫兵罗伯兹
step
    #sticky
    #label BoarMeatQuest
    #loop
    .goto Elwynn Forest,32.516,85.443,0
    .goto Elwynn Forest,31.081,81.488,0
    .goto Elwynn Forest,36.182,87.799,0
    .goto Elwynn Forest,41.733,86.986,0
    .goto Elwynn Forest,37.741,78.265,0
    .goto Elwynn Forest,41.576,69.499,0
    .waypoint Elwynn Forest,31.15,85.36,40,0
    .waypoint Elwynn Forest,33.08,86.64,40,0
    .waypoint Elwynn Forest,33.51,85.22,40,0
    .waypoint Elwynn Forest,32.17,83.88,40,0
    >>击杀 |cRXP_ENEMY_石牙野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,4,86,1 --Chunk of Boar Meat (4)
    .mob 石牙野猪
step
    #optional
    #requires BoarMeatQuest
    #label BoarMeatCooking1
    #completewith Pie
    .goto Elwynn Forest,32.516,85.443,0
    .goto Elwynn Forest,31.081,81.488,0
    .goto Elwynn Forest,36.182,87.799,0
    .goto Elwynn Forest,41.733,86.986,0
    .goto Elwynn Forest,37.741,78.265,0
    .goto Elwynn Forest,41.576,69.499,0
    >>击杀 |cRXP_ENEMY_石牙野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_这些材料用于提升|r |T133971:0|t[烹饪] |cRXP_WARN_技能，稍后会用到|r
    >>|cRXP_WARN_需要达到 10 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，稍后奥伯丁的任务会用到|r
    .collect 769,10,86,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 石牙野猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires BoarMeatCooking1
    #completewith Pie
    .goto Elwynn Forest,32.516,85.443,0
    .goto Elwynn Forest,31.081,81.488,0
    .goto Elwynn Forest,36.182,87.799,0
    .goto Elwynn Forest,41.733,86.986,0
    .goto Elwynn Forest,37.741,78.265,0
    .goto Elwynn Forest,41.576,69.499,0
    >>击杀 |cRXP_ENEMY_石牙野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_这些材料用于提升|r |T133971:0|t[烹饪] |cRXP_WARN_技能，稍后会用到|r
    >>|cRXP_WARN_之后夜色镇的一个任务要求|r |T133971:0|t[烹饪] |cRXP_WARN_达到 50 点。|r
    >>|cRXP_WARN_现在不必专程刷取，只需击杀并拾取沿途的野猪|r
    .collect 769,50,86,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 石牙野猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r 和 |cRXP_FRIENDLY_斯通菲尔德妈妈|r 交谈
    .accept 85 >> 接任务：丢失的项链
    .goto Elwynn Forest,34.486,84.253
    .target +波尼斯·斯通菲尔德姑妈
    .accept 88 >> 接任务：公主必须死！
	.goto Elwynn Forest,34.660,84.482
    .target +斯通菲尔德妈妈
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone1
    #completewith NecklaceStart
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r 和 |cRXP_ENEMY_狗头人矿工|r，打开 |cRXP_PICK_破损的箱子|r，从中拾取 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r 和 |cRXP_ENEMY_狗头人矿工|r，打开 |cRXP_PICK_破损的箱子|r，从中拾取 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r 和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
    .collect 2835,1 --Rough Stone (1+)
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .itemcount 2862,<1 << Rogue/Warrior --Rough Sharpening Stone (<1)
    .itemcount 3239,<1 << Paladin --Rough Weightstone (<1)
    .train 2018,3 --Blacksmithing Trained
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStone1
    #label RoughStoneCraft1
    #completewith NecklaceStart
    +|T136241:0|t[锻造]|cRXP_WARN_将|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_制作成|r |T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[锻造]|cRXP_WARN_将|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r |T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制作成|r |T135255:0|t[劣质平衡石] << Paladin
    .collect 2862,5 << Rogue/Warrior --Rough Sharpening Stone (5)
    .disablecheckbox
    .collect 3239,5 << Paladin --Rough Weightstone (5)
    .disablecheckbox << Paladin
    .collect 2835,5 --Rough Stone (5)
    .disablecheckbox
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .disablecheckbox << Paladin
    .itemcount 2835,1 --Rough Stone (1+)
    .itemcount 2589,1 << Paladin --Linen Cloth (1+)
    .usespell 2018
    .train 2018,3
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStoneCraft1
    #completewith NecklaceStart
    .cast 2828 >>|cRXP_WARN_将|r |T135248:0|t[劣质磨刀石]|cRXP_WARN_用于当前装备的武器|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_将|r |T135255:0|t[劣质平衡石]|cRXP_WARN_用于当前装备的武器|r << Paladin
    .use 2862 << Rogue/Warrior --Rough Sharpening Stone (1)
    .use 3239 << Paladin --Rough Weightstone (1)
    .itemcount 2862,1 << Rogue/Warrior --Rough Sharpening Stone (1)
    .itemcount 3239,1 << Paladin --Rough Weightstone (1)
    .aura 2828 << Warrior/Rogue
    .aura 3112 << Paladin
    .train 2018,3
step
    #optional
    #completewith NecklaceStart
    .goto Elwynn Forest,37.81,85.40,0
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r 和 |cRXP_ENEMY_狗头人矿工|r，拾取它们掉落的 |cRXP_LOOT_大蜡烛|r 和 |cRXP_LOOT_金砂|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob 狗头人隧道工
    .mob 狗头人矿工
step
    #label NecklaceStart
    .goto Elwynn Forest,43.131,85.722
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利·马科伦|r 交谈
    .turnin 85 >> 交任务：丢失的项链
    .accept 86 >> 接任务：比利的馅饼
    .target 比利·马科伦
step
    .goto Elwynn Forest,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_梅贝尔·马科伦|r 交谈
    .accept 106 >> 接任务：年轻的恋人
    .target 梅贝尔·马科伦
step
    #optional
    #completewith Lovers
    .goto Elwynn Forest,42.357,89.373
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒·马科伦|r交谈
    .vendor >>|cRXP_BUY_尽可能多地购买|r |T132815:0|t[冰镇牛奶]，|cRXP_WARN_以你能负担的数量为准|r << Priest/Warlock/Mage
    .vendor >>|cRXP_WARN_出售杂物|r << !Priest !Warlock !Mage
    .target 乔舒·马科伦
    .subzoneskip 64,1 --The Maclure Vineyards
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone2
    #completewith Lovers
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r 和 |cRXP_ENEMY_狗头人矿工|r，打开 |cRXP_PICK_破损的箱子|r，从中拾取 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r 和 |cRXP_ENEMY_狗头人矿工|r，打开 |cRXP_PICK_破损的箱子|r，从中拾取 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r 和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
    .collect 2835,1 --Rough Stone (1+)
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .itemcount 2862,<1 << Rogue/Warrior --Rough Sharpening Stone (<1)
    .itemcount 3239,<1 << Paladin --Rough Weightstone (<1)
    .train 2018,3 --Blacksmithing Trained
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStone2
    #label RoughStoneCraft2
    #completewith Lovers
    +|T136241:0|t[锻造]|cRXP_WARN_将|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_制作成|r |T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[锻造]|cRXP_WARN_将|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r |T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制作成|r |T135255:0|t[劣质平衡石] << Paladin
    .collect 2862,5 << Rogue/Warrior --Rough Sharpening Stone (5)
    .disablecheckbox
    .collect 3239,5 << Paladin --Rough Weightstone (5)
    .disablecheckbox << Paladin
    .collect 2835,5 --Rough Stone (5)
    .disablecheckbox
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .disablecheckbox << Paladin
    .itemcount 2835,1 --Rough Stone (1+)
    .itemcount 2589,1 << Paladin --Linen Cloth (1+)
    .usespell 2018
    .train 2018,3
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStoneCraft2
    #completewith Lovers
    .cast 2828 >>|cRXP_WARN_将|r |T135248:0|t[劣质磨刀石]|cRXP_WARN_用于当前装备的武器|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_将|r |T135255:0|t[劣质平衡石]|cRXP_WARN_用于当前装备的武器|r << Paladin
    .use 2862 << Rogue/Warrior --Rough Sharpening Stone (1)
    .use 3239 << Paladin --Rough Weightstone (1)
    .itemcount 2862,1 << Rogue/Warrior --Rough Sharpening Stone (1)
    .itemcount 3239,1 << Paladin --Rough Weightstone (1)
    .aura 2828 << Warrior/Rogue
    .aura 3112 << Paladin
    .train 2018,3
step
    #optional
    #completewith Lovers
    .goto Elwynn Forest,37.81,85.40,0
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r 和 |cRXP_ENEMY_狗头人矿工|r，拾取它们掉落的 |cRXP_LOOT_大蜡烛|r 和 |cRXP_LOOT_金砂|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob 狗头人隧道工
    .mob 狗头人矿工
step
    #label Lovers
    .goto Elwynn Forest,29.840,85.997
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托米·乔·斯通菲尔德|r 交谈
    .turnin 106 >> 交任务：年轻的恋人
    .accept 111 >> 接任务：托米的祖母
    .target 托米·乔·斯通菲尔德
step
    #requires BoarMeatQuest
    #label Pie
    .goto Elwynn Forest,34.486,84.253
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r 交谈
    .turnin 86 >> 交任务：比利的馅饼
    .accept 84 >> 接任务：比利的馅饼
    .target 波尼斯·斯通菲尔德姑妈
step
    .goto 1429,34.945,83.855
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_米莱德·斯通菲尔德|r 交谈
    .turnin 111 >> 交任务：托米的祖母
    .accept 107 >> 接任务：给威廉·匹斯特的信
    .target 米莱德·斯通菲尔德
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone3
    #completewith Exchange
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r 和 |cRXP_ENEMY_狗头人矿工|r，打开 |cRXP_PICK_破损的箱子|r，从中拾取 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r 和 |cRXP_ENEMY_狗头人矿工|r，打开 |cRXP_PICK_破损的箱子|r，从中拾取 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r 和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
    .collect 2835,1 --Rough Stone (1+)
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .itemcount 2862,<1 << Rogue/Warrior --Rough Sharpening Stone (<1)
    .itemcount 3239,<1 << Paladin --Rough Weightstone (<1)
    .train 2018,3 --Blacksmithing Trained
    .subzoneskip 87 --Goldshire
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStone3
    #label RoughStoneCraft3
    #completewith Exchange
    +|T136241:0|t[锻造]|cRXP_WARN_将|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_制作成|r |T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[锻造]|cRXP_WARN_将|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r |T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制作成|r |T135255:0|t[劣质平衡石] << Paladin
    .collect 2862,5 << Rogue/Warrior --Rough Sharpening Stone (5)
    .disablecheckbox
    .collect 3239,5 << Paladin --Rough Weightstone (5)
    .disablecheckbox << Paladin
    .collect 2835,5 --Rough Stone (5)
    .disablecheckbox
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .disablecheckbox << Paladin
    .itemcount 2835,1 --Rough Stone (1+)
    .itemcount 2589,1 << Paladin --Linen Cloth (1+)
    .usespell 2018
    .train 2018,3
    .subzoneskip 87 --Goldshire
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStoneCraft3
    #completewith Exchange
    .cast 2828 >>|cRXP_WARN_将|r |T135248:0|t[劣质磨刀石]|cRXP_WARN_用于当前装备的武器|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_将|r |T135255:0|t[劣质平衡石]|cRXP_WARN_用于当前装备的武器|r << Paladin
    .use 2862 << Rogue/Warrior --Rough Sharpening Stone (1)
    .use 3239 << Paladin --Rough Weightstone (1)
    .itemcount 2862,1 << Rogue/Warrior --Rough Sharpening Stone (1)
    .itemcount 3239,1 << Paladin --Rough Weightstone (1)
    .aura 2828 << Warrior/Rogue
    .aura 3112 << Paladin
    .train 2018,3
    .subzoneskip 87 --Goldshire
step << Warrior
    #season 2
    #sticky
    #label KoboldRune
    #loop
    .goto Elwynn Forest,37.81,85.40,0
    .waypoint Elwynn Forest,39.14,82.87,35,0
    .waypoint Elwynn Forest,39.16,84.79,35,0
    .waypoint Elwynn Forest,37.81,85.40,35,0
    .waypoint Elwynn Forest,36.76,83.19,35,0
    .waypoint Elwynn Forest,38.02,81.70,35,0
    >>击杀 |cRXP_ENEMY_狗头人矿工|r 和 |cRXP_ENEMY_狗头人隧道工|r，拾取它们掉落的 |T134168:0|t|cRXP_LOOT_[被砍下的狗头人的头]|r
    >>|cRXP_WARN_这是稍后抵达暴风城时，解锁|r |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r] |cRXP_WARN_所需的三件物品之一|r
    .collect 204476,1 -- Severed Kobold Head (1)
    .mob 狗头人隧道工
    .mob 狗头人矿工
    .mob 金牙
    .train 403475,1
step << Rogue
    #season 2
    #sticky
    #label KoboldRune
    #loop
    .goto Elwynn Forest,37.81,85.40,0
    .waypoint Elwynn Forest,39.14,82.87,35,0
    .waypoint Elwynn Forest,39.16,84.79,35,0
    .waypoint Elwynn Forest,37.81,85.40,35,0
    .waypoint Elwynn Forest,36.76,83.19,35,0
    .waypoint Elwynn Forest,38.02,81.70,35,0
    >>|T133644:0|t[搜索] |cRXP_ENEMY_狗头人矿工|r 和 |cRXP_ENEMY_狗头人隧道工|r，取得 |T134327:0|t|cRXP_LOOT_[右上角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    .collect 203784,1 -- Top-Right Map Piece (1)
    .mob 狗头人矿工
    .mob 狗头人隧道工
    .train 398196,1
step
    #sticky
    #label KoboldEnd
    #loop
    .goto Elwynn Forest,37.81,85.40,0
    .waypoint Elwynn Forest,39.14,82.87,35,0
    .waypoint Elwynn Forest,39.16,84.79,35,0
    .waypoint Elwynn Forest,37.81,85.40,35,0
    .waypoint Elwynn Forest,36.76,83.19,35,0
    .waypoint Elwynn Forest,38.02,81.70,35,0
    >>击杀 |cRXP_ENEMY_狗头人隧道工|r 和 |cRXP_ENEMY_狗头人矿工|r，拾取它们掉落的 |cRXP_LOOT_大蜡烛|r 和 |cRXP_LOOT_金砂|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob 狗头人隧道工
    .mob 狗头人矿工
step
    .goto Elwynn Forest,43.131,85.722
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利·马科伦|r 交谈
    .turnin 84 >> 交任务：比利的馅饼
    .accept 87 >> 接任务：金牙
    .target 比利·马科伦
step
    .goto Elwynn Forest,39.01,82.20,15,0
    .goto Elwynn Forest,39.92,80.11
    >>进入法戈第矿洞中一个较大的开阔区域
    .complete 62,1 --Scout Through the Fargodeep Mine
step
    #season 0,1
    .goto 1429,41.732,78.024
    >>击杀 |cRXP_ENEMY_金牙|r，拾取 |cRXP_LOOT_波尼斯的项链|r
    >>|cRXP_WARN_小心，通常会同时引到他旁边的 |cRXP_ENEMY_狗头人矿工|r|r
    .complete 87,1 --Bernice's Necklace (1)
    .mob 金牙
step
    #season 2
    .goto 1429,41.732,78.024
    >>击杀 |cRXP_ENEMY_金牙|r，拾取 |cRXP_LOOT_波尼斯的项链|r << !Warrior !Priest
    >>击杀 |cRXP_ENEMY_金牙|r，拾取他掉落的 |cRXP_LOOT_波尼斯的项链|r 和 |T134419:0|t|cRXP_LOOT_[狂怒雷霆符文]|r << Warrior
    >>击杀 |cRXP_ENEMY_金牙|r，拾取他掉落的 |cRXP_LOOT_波尼斯的项链|r 和 |T136222:0|t|cRXP_LOOT_[黑暗意图的回忆]|r << Priest
    >>|cRXP_WARN_小心，通常会同时引到他旁边的 |cRXP_ENEMY_狗头人矿工|r|r
    .complete 87,1 --Bernice's Necklace (1)
    .collect 204809,1 << Warrior -- Rune of Furious Thunder (1)
    .collect 205940,1 << Priest -- Memory of a Dark Purpose (1)
    .mob 金牙
    .train 403476,1 << Warrior
    .train 425216,1 << Priest
step << Warrior
    #season 2
    #sticky
    #label GoldtoothRune
    .train 403476 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[狂怒雷霆符文]|r|cRXP_WARN_学习|r |T136048:0|t[狂怒雷霆]
    .use 204809
    .itemcount 204809,1
step << Priest
    #season 2
    #sticky
    #label GoldtoothRune
    >>|cRXP_WARN_你必须拥有|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益；在北郡修道院或暴风城大教堂等神圣地点输入 /kneel 即可获得|r
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t|cRXP_LOOT_[黑暗意图的回忆]|r|cRXP_WARN_学习|r |T237514:0|t[虚空疫病]
    .use 205940
step << Warrior
    #optional
    #completewith Exchange
    +|cRXP_WARN_从现在开始尽量保留一瓶|r |T134829:0|t[初级治疗药水]|cRXP_WARN_，因为之后在罗尔夫的尸体任务中会用到|r
    .subzoneskip 87 --Goldshire
step << Warrior
    #season 2
    #optional
    #requires KoboldRune
--XXREQ Placeholder invis step
step
    #xprate <1.5
    #requires KoboldEnd
    #loop
    .goto Elwynn Forest,37.81,85.40,0
    .goto Elwynn Forest,39.14,82.87,35,0
    .goto Elwynn Forest,39.16,84.79,35,0
    .goto Elwynn Forest,37.81,85.40,35,0
    .goto Elwynn Forest,36.76,83.19,35,0
    .goto Elwynn Forest,38.02,81.70,35,0
    .xp 7+1800 >>刷怪至 1800+/4500 经验值 << !Priest
    .xp 7+1460 >>刷怪至 1460+/4500 经验值 << Priest
    .mob 狗头人隧道工
    .mob 狗头人矿工
--XX <1.5x turns in goldtooth early
step
    #xprate >1.49
    #requires KoboldEnd
    #loop
    .goto Elwynn Forest,37.81,85.40,0
    .goto Elwynn Forest,39.14,82.87,35,0
    .goto Elwynn Forest,39.16,84.79,35,0
    .goto Elwynn Forest,37.81,85.40,35,0
    .goto Elwynn Forest,36.76,83.19,35,0
    .goto Elwynn Forest,38.02,81.70,35,0
    .xp 7+1770 >>刷怪至 1770+/4500 经验值 << !Priest
    .xp 7+1260 >>刷怪至 1260+/4500 经验值 << Priest
    .mob 狗头人隧道工
    .mob 狗头人矿工
step
    #xprate <1.5
    #label Goldtooth
    .goto Elwynn Forest,34.486,84.253
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r 交谈
    .turnin 87 >> 交任务：金牙
    .target 波尼斯·斯通菲尔德姑妈
step << skip --logout skip
    #xprate >1.49
    #hardcore
    #optional
    .goto Elwynn Forest,41.29,79.85,-1
    .goto Elwynn Forest,41.75,78.49,-1
    .goto Elwynn Forest,41.91,77.81,-1
    .goto Elwynn Forest,40.15,80.12,-1
    .goto Elwynn Forest,39.90,81.46,-1
    .goto Elwynn Forest,40.86,81.24,-1
    .goto Elwynn Forest,40.32,79.31,-1
    .goto Elwynn Forest,39.30,60.48,30 >>|cRXP_WARN_跳到洞穴内的伐木机、悬空木头、箱子或矿车灯上，然后登出并重新登录，进行登出跳跃|r
    .subzoneskip 57,1 --Fargodeep Mine
    .isOnQuest 47
step
    #optional
    #label BoarMeatCooking2
    #completewith Exchange
    .goto Elwynn Forest,32.516,85.443,0
    .goto Elwynn Forest,31.081,81.488,0
    .goto Elwynn Forest,36.182,87.799,0
    .goto Elwynn Forest,41.733,86.986,0
    .goto Elwynn Forest,37.741,78.265,0
    .goto Elwynn Forest,41.576,69.499,0
    >>击杀 |cRXP_ENEMY_石牙野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 石牙野猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 57 --Fargodeep Mine
step
    #optional
    #requires BoarMeatCooking2
    #completewith Exchange
    .goto Elwynn Forest,32.516,85.443,0
    .goto Elwynn Forest,31.081,81.488,0
    .goto Elwynn Forest,36.182,87.799,0
    .goto Elwynn Forest,41.733,86.986,0
    .goto Elwynn Forest,37.741,78.265,0
    .goto Elwynn Forest,41.576,69.499,0
    >>击杀 |cRXP_ENEMY_石牙野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_现在不必专程刷取，只需击杀并拾取沿途的野猪|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 石牙野猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 57 --Fargodeep Mine
step
    #hardcore
    #optional
    #completewith Exchange
    .goto Elwynn Forest,42.140,67.254,125 >> 返回闪金镇
    .subzoneskip 87 --Goldshire
step
    #softcore
    #completewith Exchange
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处重生
    .target 灵魂医者
step
    #label Exchange
    .goto Elwynn Forest,42.140,67.254
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷米|r 交谈
    >>|cRXP_WARN_不要卖掉任务奖励|r |T133581:0|t[弹子球]。|cRXP_WARN_即使练到 60 级，它也非常有用|r
    .turnin 47 >> 交任务：金砂交易
    .accept 40 >> 接任务：鱼人的威胁
    .target 雷米
step << Priest
    #season 2
    #optional
    #completewith GoldshireEnd
    +|cRXP_WARN_尽可能在闪金镇找到一名拥有其他|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益的牧师|r
    >>|cRXP_WARN_输入 /kneel 跪下，再让对方牧师选中你输入 /pray，这样即可获得对方的|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益，供稍后使用|r
step
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官杜汉|r 交谈
    .turnin 62 >> 交任务：法戈第矿洞
    .accept 76 >> 接任务：玉石矿洞
    .turnin 40 >> 交任务：鱼人的威胁
    .accept 35 >> 接任务：卫兵托马斯
    .target 治安官杜汉
step
    #optional << Warrior/Rogue/Paladin
    #completewith CandlesEnd
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor >>出售杂物
    .target 科瑞娜·斯蒂利
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>3.3 << Rogue
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>3.8 << Warrior
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>5.0 << Paladin
step << Warrior
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_如果钱够，向她购买一把|r |T135321:0|t[步兵剑]|cRXP_BUY_即可|r
    .collect 2488,1 --Collect Gladius (1)
    .disablecheckbox
--  .money <0.0536
    .target 科瑞娜·斯蒂利
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior
    #completewith CandlesEnd
    +|cRXP_WARN_装备|r |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_购买一把|r |T135641:0|t[卷刃的剑]，|cRXP_BUY_有钱再向她购买|r
    .collect 2494,1 --Collect Stiletto (1)
    .disablecheckbox
    .target 科瑞娜·斯蒂利
--   .money <0.0400
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith CandlesEnd
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Paladin
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科瑞娜·斯蒂利|r 交谈
    .vendor 54 >>|cRXP_BUY_购买一把|r |T133053:0|t[木槌棒]，|cRXP_BUY_有钱再向她购买|r
    .collect 2493,1 --Collect Wooden Mallet (1)
    .disablecheckbox
    .target 科瑞娜·斯蒂利
--  .money <0.0631
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0
step << Paladin
    #completewith CandlesEnd
    +|cRXP_WARN_装备|r |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0
step << Paladin
    #season 2
    #xprate >1.59
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威尔海姆修士|r 交谈
    >>|cRXP_WARN_学习|r |T135949:0|t[纯净术]，|cRXP_WARN_以便稍后获得|r |T133815:0|t[铭刻胸甲 - 神盾] |cRXP_WARN_符文|r
    .train 1152 >>学习 |T135949:0|t[纯净术]
    .trainer >> 学习职业技能
    .target 威尔海姆修士
step << Paladin
    #season 0,1
    #xprate >1.59
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威尔海姆修士|r 交谈
    .trainer >> 学习职业技能
    .target 威尔海姆修士
step << Warrior
    #xprate >1.59
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_里瑞亚·杜拉克|r 交谈
    .trainer >> 学习职业技能
    .target 里瑞亚·杜拉克
step
    #label CandlesEnd
    #requires GoldtoothRune << Warrior/Priest --Season 2
    .goto Elwynn Forest,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威廉·匹斯特|r 交谈
    .turnin 60 >> 交任务：狗头人的蜡烛
    .accept 61 >> 接任务：送往暴风城的货物
    .turnin 107 >> 交任务：给威廉·匹斯特的信
    .accept 112 >> 接任务：收集海藻
    .target 威廉·匹斯特
step
    #xprate <1.5
    #optional
    .xp 8 >> 刷怪升到 8 级
step << Warrior
    #xprate <1.59
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_里瑞亚·杜拉克|r 交谈
    .trainer >> 学习职业技能
    .target 里瑞亚·杜拉克
step << Paladin
    #season 2
    #xprate <1.59
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威尔海姆修士|r 交谈
    >>|cRXP_WARN_学习|r |T135949:0|t[纯净术]，|cRXP_WARN_以便稍后获得|r |T133815:0|t[铭刻胸甲 - 神盾] |cRXP_WARN_符文|r
    .train 1152 >>学习 |T135949:0|t[纯净术]
    .trainer >> 学习职业技能
    .target 威尔海姆修士
step << Paladin
    #season 0,1
    #xprate <1.59
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威尔海姆修士|r 交谈
    .trainer >> 学习职业技能
    .target 威尔海姆修士
step << Warlock
    #optional
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >> 下到旅店地下室
step << Warlock
    .goto Elwynn Forest,44.392,66.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛克西米利安·克洛文|r 交谈
    .target 玛克西米利安·克洛文
    .trainer >> 学习职业技能
step << Warlock
    .goto Elwynn Forest,44.397,65.989
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞琳娜·达克哈特|r 交谈
    .vendor >> |cRXP_BUY_购买|r |T133738:0|t[魔典：火焰箭（等级 2）]，|cRXP_BUY_有钱再向她购买，钱不够可稍后再买|r
    .target 塞琳娜·达克哈特
    .money <0.100
    .itemcount 16302,<1 --Grimoire of Firebolt (Rank 2)
    .train 20270,1 --Firebolt (Rank 2)
step << Mage/Priest/Rogue/Warrior/Paladin
    #optional
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >> 前往旅店二楼
step << Mage
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r 交谈
	.target 扎尔迪玛·维夫希尔特
    .goto Elwynn Forest,43.25,66.19
    .trainer >> 学习职业技能
step << Priest
    .goto Elwynn Forest,43.283,65.721
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_女牧师洁塞塔|r 交谈
	.target 女牧师洁塞塔
    .turnin 5624 >> 交任务：圣光之衣
    .trainer >> 学习职业技能
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科瑞恩·塞尔留斯|r 交谈
    .target 科瑞恩·塞尔留斯
    .goto Elwynn Forest,43.872,65.937
    .trainer >> 学习职业技能
step << Rogue/Warrior/Paladin
    .money <0.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米歇尔·贝利|r 交谈
    .target 米歇尔·贝利
    .goto Elwynn Forest,43.392,65.550
    .train 3273 >> 学习 |T135966:0|t[急救]
step
    #label GoldshireEnd << Priest --Season 2
    .goto Elwynn Forest,43.96,65.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布洛葛·哈姆菲斯特|r 交谈
    .vendor >> |cRXP_WARN_按需购买|r |T133634:0|t[棕色小包] |cRXP_WARN_。|r
	.target 布洛葛·哈姆菲斯特
    .money <0.1250
step
    #completewith next
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板法雷|r 交谈
    .vendor >> |cRXP_BUY_购买至多 20 瓶|r |T132815:0|t[冰镇牛奶]，|cRXP_BUY_有钱再向他购买|r << !Warrior !Rogue !Paladin
    .vendor >> |cRXP_BUY_购买至多 20 块|r |T133995:0|t[达拉然奶酪]，|cRXP_BUY_有钱再向他购买|r << Warrior/Rogue
    .vendor >> |cRXP_BUY_购买至多 10 块|r |T133995:0|t[达拉然奶酪] |cRXP_BUY_和 10 瓶|r |T132815:0|t[冰镇牛奶]，|cRXP_BUY_有钱再向他购买|r << Paladin
    .target 旅店老板法雷
step << Warrior
    #season 2
    #sticky
    #label MurlocRune
    #loop
    .goto 1429,50.833,65.453,0
    .goto 1429,57.435,63.662,0
    .goto 1429,54.236,66.888,0
    .waypoint 1429,50.833,65.453,50,0
    .waypoint 1429,52.020,65.177,50,0
    .waypoint 1429,54.144,62.468,50,0
    .waypoint 1429,56.332,63.538,50,0
    .waypoint 1429,57.162,62.157,50,0
    .waypoint 1429,57.435,63.662,50,0
    .waypoint 1429,58.237,64.888,50,0
    .waypoint 1429,56.897,67.017,50,0
    .waypoint 1429,55.523,66.707,50,0
    .waypoint 1429,55.203,66.171,50,0
    .waypoint 1429,54.236,66.888,50,0
    >>击杀 |cRXP_ENEMY_鱼人|r 和 |cRXP_ENEMY_鱼人士兵|r，拾取它们掉落的 |T134169:0|t|cRXP_LOOT_[被砍下的鱼人的头]|r
    >>|cRXP_WARN_这是 10 级抵达暴风城时，解锁|r |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r] |cRXP_WARN_所需的三件物品之一|r
    .collect 204477,1 -- Severed Murloc Head (1)
    .mob 鱼人士兵
	.mob 鱼人
    .train 403475,1
step << Rogue
    #season 2
    #sticky
    #label MurlocRune
    #loop
    .goto 1429,50.833,65.453,0
    .goto 1429,57.435,63.662,0
    .goto 1429,54.236,66.888,0
    .waypoint 1429,50.833,65.453,50,0
    .waypoint 1429,52.020,65.177,50,0
    .waypoint 1429,54.144,62.468,50,0
    .waypoint 1429,56.332,63.538,50,0
    .waypoint 1429,57.162,62.157,50,0
    .waypoint 1429,57.435,63.662,50,0
    .waypoint 1429,58.237,64.888,50,0
    .waypoint 1429,56.897,67.017,50,0
    .waypoint 1429,55.523,66.707,50,0
    .waypoint 1429,55.203,66.171,50,0
    .waypoint 1429,54.236,66.888,50,0
    >>|T133644:0|t[搜索] |cRXP_ENEMY_鱼人士兵|r 和 |cRXP_ENEMY_鱼人|r，取得 |T134269:0|t|cRXP_LOOT_[右下角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
--   >>|cRXP_WARN_Note: This can also come from any other |cRXP_ENEMY_Murloc|r in Elwynn Forest|r
    .collect 203786,1 -- Bottom-Right Map Piece (1)
    .mob 鱼人士兵
    .mob 鱼人
--   .mob Murloc Forager
--    .mob Murloc Lurker
    .train 398196,1
step
    #optional
    #label WolfMeatCooking1
    #completewith Jasperlode
    .goto 1429,52.242,62.919,0
    .goto 1429,53.837,60.950,0
    .goto 1429,56.793,60.340,0
    .goto 1429,59.033,60.673,0
    >>击杀 |cRXP_ENEMY_癞皮狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob 癞皮狼
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 54
step
    #optional
    #requires WolfMeatCooking1
    #completewith Jasperlode
    .goto 1429,52.242,62.919,0
    .goto 1429,53.837,60.950,0
    .goto 1429,56.793,60.340,0
    .goto 1429,59.033,60.673,0
    >>击杀 |cRXP_ENEMY_癞皮狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_暂时不用专门刷，只需击杀并拾取沿途遇到的狼|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob 癞皮狼
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 54
step
    #loop
    .goto 1429,50.833,65.453,0
    .goto 1429,57.435,63.662,0
    .goto 1429,54.236,66.888,0
    .goto 1429,50.833,65.453,50,0
    .goto 1429,52.020,65.177,50,0
    .goto 1429,54.144,62.468,50,0
    .goto 1429,56.332,63.538,50,0
    .goto 1429,57.162,62.157,50,0
    .goto 1429,57.435,63.662,50,0
    .goto 1429,58.237,64.888,50,0
    .goto 1429,56.897,67.017,50,0
    .goto 1429,55.523,66.707,50,0
    .goto 1429,55.203,66.171,50,0
    .goto 1429,54.236,66.888,50,0
    >>击杀|cRXP_ENEMY_鱼人|r和|cRXP_ENEMY_鱼人士兵|r，拾取|cRXP_LOOT_水晶藻叶|r
    .complete 112,1 --Collect Crystal Kelp Frond (x4)
	.mob 鱼人
	.mob 鱼人士兵
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone4
    #completewith JasperlodeExplore
    >>击杀 |cRXP_ENEMY_狗头人矿工|r，打开 |cRXP_PICK_破损的箱子|r，从中拾取 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀 |cRXP_ENEMY_狗头人矿工|r，打开 |cRXP_PICK_破损的箱子|r，从中拾取 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r 和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
    .collect 2835,1 --Rough Stone (1+)
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .itemcount 2862,<1 << Rogue/Warrior --Rough Sharpening Stone (<1)
    .itemcount 3239,<1 << Paladin --Rough Weightstone (<1)
    .train 2018,3 --Blacksmithing Trained
    .mob 狗头人矿工
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStone4
    #label RoughStoneCraft4
    #completewith JasperlodeExplore
    +|T136241:0|t[锻造]|cRXP_WARN_将|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_制作成|r |T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[锻造]|cRXP_WARN_将|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r |T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制作成|r |T135255:0|t[劣质平衡石] << Paladin
    .collect 2862,5 << Rogue/Warrior --Rough Sharpening Stone (5)
    .disablecheckbox
    .collect 3239,5 << Paladin --Rough Weightstone (5)
    .disablecheckbox << Paladin
    .collect 2835,5 --Rough Stone (5)
    .disablecheckbox
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .disablecheckbox << Paladin
    .itemcount 2835,1 --Rough Stone (1+)
    .itemcount 2589,1 << Paladin --Linen Cloth (1+)
    .usespell 2018
    .train 2018,3
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStoneCraft4
    #completewith JasperlodeExplore
    .cast 2828 >>|cRXP_WARN_将|r |T135248:0|t[劣质磨刀石]|cRXP_WARN_用于当前装备的武器|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_将|r |T135255:0|t[劣质平衡石]|cRXP_WARN_用于当前装备的武器|r << Paladin
    .use 2862 << Rogue/Warrior --Rough Sharpening Stone (1)
    .use 3239 << Paladin --Rough Weightstone (1)
    .itemcount 2862,1 << Rogue/Warrior --Rough Sharpening Stone (1)
    .itemcount 3239,1 << Paladin --Rough Weightstone (1)
    .aura 2828 << Warrior/Rogue
    .aura 3112 << Paladin
    .train 2018,3
step
    #optional
    #requires MurlocRune << Warrior/Rogue --Season 2
    #label Jasperlode
    #completewith JasperlodeExplore
    .goto Elwynn Forest,61.654,53.608,15 >> 进入玉石矿洞
step << Mage
    #season 2
    #sticky
    #loop
    #label JasperlodeRune
    .goto 1429,60.599,50.811,0
    .goto 1429,60.789,56.641,0
    .goto 1429,64.528,56.678,0
    .waypoint 1429,62.656,54.266,45,0
    .waypoint 1429,62.121,55.579,45,0
    .waypoint 1429,60.789,56.641,45,0
    .waypoint 1429,62.587,57.974,45,0
    .waypoint 1429,63.724,58.199,45,0
    .waypoint 1429,64.528,56.678,45,0
    .waypoint 1429,62.656,54.266,45,0
    .waypoint 1429,60.599,50.811,45,0
    .waypoint 1429,61.296,51.676,45,0
    >>击杀 |cRXP_ENEMY_狗头人地卜师|r，拾取它们掉落的 |T134939:0|t|cRXP_LOOT_[法术笔记：IULAOYIHTEN]|r
    .collect 203752,1
    .mob 狗头人地卜师
    .train 401768,1
step
    #label JasperlodeExplore
    .goto Elwynn Forest,61.20,51.46,15,0
    .goto Elwynn Forest,60.72,50.85,15,0
    .goto Elwynn Forest,60.39,50.16
    >>沿着中间的道路探索玉石矿洞
    .complete 76,1 --Scout through the Jasperlode Mine
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone5
    #completewith Find
    >>击杀 |cRXP_ENEMY_狗头人矿工|r，打开 |cRXP_PICK_破损的箱子|r，从中拾取 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀 |cRXP_ENEMY_狗头人矿工|r，打开 |cRXP_PICK_破损的箱子|r，从中拾取 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r 和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
    .collect 2835,1 --Rough Stone (1+)
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .itemcount 2862,<1 << Rogue/Warrior --Rough Sharpening Stone (<1)
    .itemcount 3239,<1 << Paladin --Rough Weightstone (<1)
    .train 2018,3 --Blacksmithing Trained
    .mob 狗头人矿工
    .subzoneskip 54,1
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStone5
    #label RoughStoneCraft5
    #completewith Find
    +|T136241:0|t[锻造]|cRXP_WARN_将|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_制作成|r |T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[锻造]|cRXP_WARN_将|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r |T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制作成|r |T135255:0|t[劣质平衡石] << Paladin
    .collect 2862,5 << Rogue/Warrior --Rough Sharpening Stone (5)
    .disablecheckbox
    .collect 3239,5 << Paladin --Rough Weightstone (5)
    .disablecheckbox << Paladin
    .collect 2835,5 --Rough Stone (5)
    .disablecheckbox
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .disablecheckbox << Paladin
    .itemcount 2835,1 --Rough Stone (1+)
    .itemcount 2589,1 << Paladin --Linen Cloth (1+)
    .usespell 2018
    .train 2018,3
    .subzoneskip 54,1
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStoneCraft5
    #completewith Find
    .cast 2828 >>|cRXP_WARN_将|r |T135248:0|t[劣质磨刀石]|cRXP_WARN_用于当前装备的武器|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_将|r |T135255:0|t[劣质平衡石]|cRXP_WARN_用于当前装备的武器|r << Paladin
    .use 2862 << Rogue/Warrior --Rough Sharpening Stone (1)
    .use 3239 << Paladin --Rough Weightstone (1)
    .itemcount 2862,1 << Rogue/Warrior --Rough Sharpening Stone (1)
    .itemcount 3239,1 << Paladin --Rough Weightstone (1)
    .aura 2828 << Warrior/Rogue
    .aura 3112 << Paladin
    .train 2018,3
    .subzoneskip 54,1
step << Paladin
    #season 2
    #completewith next
    .goto Elwynn Forest,61.97,47.31
    .cast 1152 >>|cRXP_WARN_施放|r |T135949:0|t[纯净术]，|cRXP_WARN_目标为里面的 |cRXP_FRIENDLY_受伤的冒险者|r|r
    .target 受伤的冒险者
    .train 425619,1
    .train 1152,3 --Purify Trained
step << Paladin
    #season 2
    .goto Elwynn Forest,61.97,47.31
    >>|cRXP_WARN_与|cRXP_FRIENDLY_受伤的冒险者|r交谈，在对他施放|r |T135949:0|t[纯净术]|cRXP_WARN_后，即可获得|r |T134419:0|t[神盾符文]
    .collect 205685,1 --Rune of Aegis (1)
    .target 受伤的冒险者
    .skipgossip
    .train 425619,1
    .train 1152,3 --Purify Trained
--XX gossipoption 109556
step << Paladin
    #season 2
    #completewith Find
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[神盾符文]|cRXP_WARN_学习|r |T133815:0|t[铭刻胸甲 - 神盾]
    .use 205685
    .itemcount 205685,1 --Rune of Aegis (1)
    .train 425619,1
    .train 1152,3 --Purify Trained
step << Mage
    #season 2
    #requires JasperlodeRune
    #completewith Find
    .train 401768 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_LOOT_[法术笔记：IULAOYIHTEN]|r |cRXP_WARN_学习|r |T135820:0|t[活体烈焰]
    .use 203752
step
    #optional
    #label ExitJasperlode
    #completewith Find
    .goto 1429,61.820,53.871,15 >> 离开玉石矿洞
    .subzoneskip 54,1
step
    #optional
    #requires ExitJasperlode
    #label WolfMeatCooking2
    #completewith Find
    .goto 1429,69.348,67.452,0
    .goto 1429,67.244,63.880,0
    .goto 1429,63.748,64.710,0
    >>击杀 |cRXP_ENEMY_森林灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob 森林灰狼
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires WolfMeatCooking2
    #completewith Find
    .goto 1429,69.348,67.452,0
    .goto 1429,67.244,63.880,0
    .goto 1429,63.748,64.710,0
    >>击杀 |cRXP_ENEMY_森林灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_暂时不用专门刷，只需击杀并拾取沿途遇到的狼|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob 森林灰狼
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #optional
    #completewith Find
    +|cRXP_WARN_将一只 |cRXP_ENEMY_森林熊幼崽|r 风筝到|r |cRXP_FRIENDLY_卫兵托马斯|r 身边
    >>|cRXP_WARN_尽量在 |cRXP_FRIENDLY_卫兵托马斯|r 身边的 |cRXP_ENEMY_森林熊幼崽|r 被 |cRXP_FRIENDLY_暴风城卫兵|r 杀死前与托马斯交谈，以计入任务进度|r
    >>|cRXP_WARN_确保对目标造成 51% 以上的伤害，才能获得击杀判定|r
    .mob 森林熊幼崽
step
    #label Find
    #requires JasperlodeRune << Mage --Season 2
    .goto Elwynn Forest,73.973,72.179
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵托马斯|r 交谈
    .turnin 35 >> 交任务：卫兵托马斯
    .accept 37 >> 接任务：失踪的卫兵
    .accept 52 >> 接任务：保卫边境
    .target 卫兵托马斯
step << Rogue/Priest
    #season 2
    #completewith LostGuards
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    >>|cRXP_WARN_优先击杀看到的 |cRXP_ENEMY_森林熊幼崽|r|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +觅食的灰狼
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +森林熊幼崽
step
    #season 0,1 << Rogue/Priest
    #completewith AcceptBundle
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    >>|cRXP_WARN_优先击杀看到的 |cRXP_ENEMY_森林熊幼崽|r|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +觅食的灰狼
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +森林熊幼崽
step
    #optional
    #label WolfMeatCooking3
    #completewith LostGuards
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀 |cRXP_ENEMY_森林灰狼|r 和 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob 森林灰狼
    .mob 觅食的灰狼
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires WolfMeatCooking3
    #completewith LostGuards
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀 |cRXP_ENEMY_森林灰狼|r 和 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_暂时不用专门刷，只需击杀并拾取沿途遇到的狼|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob 森林灰狼
    .mob 觅食的灰狼
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #label LostGuards
    .goto Elwynn Forest,72.656,60.334
    >>点击地上的 |cRXP_PICK_被吃掉一半的尸体|r
    .turnin 37 >> 交任务：失踪的卫兵
    .accept 45 >> 接任务：罗尔夫的下落
step
    #optional
    #label WolfMeatCooking4
    #completewith AcceptBundle
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob 觅食的灰狼
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 88 --Eastvale Logging Camp
step
    #optional
    #requires WolfMeatCooking4
    #completewith AcceptBundle
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_暂时不用专门刷，只需击杀并拾取沿途遇到的狼|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob 觅食的灰狼
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 88 --Eastvale Logging Camp
step
    #label AcceptBundle
    .goto Elwynn Forest,81.382,66.112
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_管理员莱琳|r 交谈
    .accept 5545 >> 接任务：木材危机
    .target 管理员莱琳
step
    #season 0,1 << Rogue
    #optional
    .goto Elwynn Forest,83.283,66.089
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉里克·费恩|r 交谈
    .vendor >> 出售杂物
    .target 拉里克·费恩
    .subzoneskip 88,1
step
    #optional
    #label WolfMeatCooking5
    #completewith Prowlers
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_暂时不用专门刷，只需击杀并拾取沿途遇到的狼|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob 觅食的灰狼
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 86 --Stone Cairn Lake
step
    #optional
    #requires WolfMeatCooking5
    #completewith Prowlers
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_暂时不用专门刷，只需击杀并拾取沿途遇到的狼|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob 觅食的灰狼
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 86 --Stone Cairn Lake
step
    #completewith Prowlers
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    >>|cRXP_WARN_优先击杀看到的 |cRXP_ENEMY_森林熊幼崽|r|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +觅食的灰狼
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +森林熊幼崽
    .subzoneskip 86 --Stone Cairn Lake
step
    #completewith next
    .goto Elwynn Forest,80.48,55.18,0
    .goto Elwynn Forest,80.15,60.03,0
    .goto Elwynn Forest,83.48,59.19,0
    >>拾取地上树根旁的 |cRXP_LOOT_一捆木柴|r
    .complete 5545,1 -- Bundle of Wood (8)
step << Paladin
    #softcore
    #label Prowlers
    .goto Elwynn Forest,79.80,55.50
    >>|cRXP_WARN_跑到 |cRXP_PICK_罗尔夫的尸体|r 上，施放|r |T135954:0|t[圣佑术]，|cRXP_WARN_随后立刻点击|r |cRXP_PICK_罗尔夫的尸体|r
    >>|cRXP_WARN_完成任务后跑开，让 |cRXP_ENEMY_鱼人|r 脱战重置|r
    .turnin 45 >> 交任务：罗尔夫的下落
    .accept 71 >> 接任务：回复托马斯
step << Paladin
    #hardcore
    #label Prowlers
    .goto Elwynn Forest,79.80,55.50
    >>点击地上的 |cRXP_PICK_罗尔夫的尸体|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_鱼人强盗|r 会施放|r |T135915:0|t[喝下初级药水]，|cRXP_WARN_恢复自身 61–68 点生命值|r
    >>|cRXP_WARN_拉小屋前的2只|r |cRXP_ENEMY_鱼人|r |cRXP_WARN_，退到远处，快速击杀一只。按需使用|r |T135954:0|t[圣佑术] |cRXP_WARN_和治疗技能。这时也很适合使用|r |T133581:0|t[弹子球]|cRXP_WARN_。杀死一只后跑开，让另一只重置|r << Paladin
    >>|cRXP_WARN_记住：|r |T135954:0|t[圣佑术] |cRXP_WARN_持续期间无法攻击|r << Paladin
    .turnin 45 >> 交任务：罗尔夫的下落
    .accept 71 >> 接任务：回复托马斯
step << !Paladin
    #label Prowlers
    .goto Elwynn Forest,79.80,55.50
    >>点击地上的 |cRXP_PICK_罗尔夫的尸体|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_鱼人强盗|r 会施放|r |T135915:0|t[喝下初级药水]，|cRXP_WARN_恢复自身 61–68 点生命值|r
    >>|cRXP_WARN_施放|r |T135953:0|t[恢复] |cRXP_WARN_和|r |T135940:0|t[真言术：盾] |cRXP_WARN_后回满法力。拉小屋前的2只 |cRXP_ENEMY_鱼人|r，退到远处，快速击杀其中一只。杀死一只后跑开，再杀另一只|r << Priest
    >>|cRXP_WARN_拉出棚屋前的 2 只|r |cRXP_ENEMY_鱼人|r，|cRXP_WARN_后退，用|r |T136071:0|t[变形术] |cRXP_WARN_控制一只，击杀另一只。随后击杀|r |T136071:0|t[被变形的目标]，|cRXP_WARN_完成战斗|r << Mage
    >>|cRXP_WARN_积攒100怒气。拉小屋前的2只|r |cRXP_ENEMY_鱼人|r |cRXP_WARN_，退到远处，用|r |T132316:0|t[断筋] |cRXP_WARN_持续控制一只并击杀另一只。对正在击杀的那只使用|r |T133581:0|t[弹子球] |cRXP_WARN_。杀死一只后跑开，让被|r |T132316:0|t[断筋] |cRXP_WARN_风筝的另一只重置|r << Warrior
    >>|cRXP_WARN_拉小屋前的2只|r |cRXP_ENEMY_鱼人|r |cRXP_WARN_，退到远处，集中击杀一只。两只都开始攻击你时使用|r |T136205:0|t[闪避] |cRXP_WARN_。这时也很适合使用|r |T133581:0|t[弹子球]|cRXP_WARN_。杀死一只后跑开，让另一只重置|r << Rogue
    >>|cRXP_WARN_拉小屋前的2只|r |cRXP_ENEMY_鱼人|r |cRXP_WARN_，退到远处，对其中一只持续施放|r |T136183:0|t[恐惧术] |cRXP_WARN_，尽量让两只都保持持续伤害效果|r << Warlock
    .turnin 45 >> 交任务：罗尔夫的下落
    .accept 71 >> 接任务：回复托马斯
step
    #optional
    #label WolfMeatCooking6
    #completewith BundleOT
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob 觅食的灰狼
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires WolfMeatCooking6
    #completewith BundleOT
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_暂时不用专门刷，只需击杀并拾取沿途遇到的狼|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob 觅食的灰狼
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #completewith BundleOT
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    >>|cRXP_WARN_优先击杀看到的 |cRXP_ENEMY_森林熊幼崽|r|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +觅食的灰狼
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +森林熊幼崽
step
    #loop
    .goto Elwynn Forest,80.48,55.18,0
    .goto Elwynn Forest,80.15,60.03,0
    .goto Elwynn Forest,83.48,59.19,0
    .goto Elwynn Forest,80.48,55.18,40,0
    .goto Elwynn Forest,80.88,53.88,40,0
    .goto Elwynn Forest,79.68,52.31,40,0
    .goto Elwynn Forest,80.86,52.17,40,0
    .goto Elwynn Forest,80.88,53.88,40,0
    .goto Elwynn Forest,80.48,55.18,40,0
    .goto Elwynn Forest,79.76,56.70,40,0
    .goto Elwynn Forest,80.15,60.03,40,0
    .goto Elwynn Forest,80.24,61.46,40,0
    .goto Elwynn Forest,81.27,61.59,40,0
    .goto Elwynn Forest,81.58,62.64,40,0
    .goto Elwynn Forest,82.79,60.12,40,0
    .goto Elwynn Forest,83.25,61.12,40,0
    .goto Elwynn Forest,83.48,59.19,40,0
    .goto Elwynn Forest,81.77,59.17,40,0
    .goto Elwynn Forest,80.48,55.18,40,0
    .goto Elwynn Forest,83.25,61.12,40,0
    .goto Elwynn Forest,83.48,59.19,40,0
    >>拾取地上树根旁的 |cRXP_LOOT_一捆木柴|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    #label BundleOT
    .goto Elwynn Forest,81.382,66.112
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_管理员莱琳|r 交谈
    .turnin 5545 >> 交任务：木材危机
    .target 管理员莱琳
step << skip --Paladin
    #xprate >1.59
    #optional
    .goto Elwynn Forest,79.457,68.789
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨拉·迪博雷恩|r 交谈
    .accept 83 >> 接任务：红色亚麻布
    .target 萨拉·迪博雷恩
    .itemcount 2589,<10 --Linen Cloth (<10)
step
    #xprate <1.5 << !Warlock
    .goto Elwynn Forest,79.457,68.789
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨拉·迪博雷恩|r 交谈
    .accept 83 >> 接任务：红色亚麻布
    .target 萨拉·迪博雷恩
step
    #optional
    #label WolfMeatCooking7
    #completewith DeliverStart
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob 觅食的灰狼
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires WolfMeatCooking7
    #completewith DeliverStart
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_暂时不用专门刷，只需击杀并拾取沿途遇到的狼|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob 觅食的灰狼
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #loop
    .goto 1429,77.499,74.518,0
    .goto 1429,80.496,78.223,0
    .goto 1429,87.342,63.763,0
    .goto 1429,77.499,74.518,55,0
    .goto 1429,77.222,77.499,55,0
    .goto 1429,78.483,79.323,55,0
    .goto 1429,80.496,78.223,55,0
    .goto 1429,81.434,76.695,55,0
    .goto 1429,87.145,69.922,55,0
    .goto 1429,87.342,63.763,55,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +觅食的灰狼
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +森林熊幼崽
step
    #label DeliverStart
    .goto Elwynn Forest,73.973,72.179
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵托马斯|r 交谈
    .turnin 52 >> 交任务：保卫边境
    .turnin 71 >> 交任务：回复托马斯
    .accept 39 >> 接任务：托马斯的报告
    .target 卫兵托马斯
step
    #xprate >1.49
    #completewith Level9Grind << Warlock/Warrior/Rogue
    #completewith PrincessC << !Warlock !Warrior !Rogue
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r，拾取 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r]
    .use 1972>>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] 接取任务|r
    >>|cRXP_WARN_任务物品|r |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] |cRXP_WARN_掉率很低。若未获得就跳过此步骤|r
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >> 接任务：法布隆的地契
step
    #xprate <1.5
    #completewith Level9Grind << Warlock/Warrior/Rogue
    #completewith DefiasBandits << !Warlock !Warrior !Rogue
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r，拾取 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r]
    .use 1972>>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] 接取任务|r
    >>|cRXP_WARN_任务物品|r |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] |cRXP_WARN_掉率很低。若未获得就跳过此步骤|r
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >> 接任务：法布隆的地契
step << skip --Paladin
    #xprate >1.59
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r，拾取他们掉落的 |cRXP_LOOT_红色亚麻面罩|r 和 |T132889:0|t[亚麻布]
    >>|cRXP_WARN_把|r |T132889:0|t[亚麻布]|cRXP_WARN_留给之后的任务|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .collect 2589,10,1644,1 --Linen Cloth (10)
    .disablecheckbox
    .mob 迪菲亚强盗
    .isOnQuest 83
step
    #xprate <1.5 << !Warlock
    #completewith next
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r，拾取他们掉落的 |cRXP_LOOT_红色亚麻面罩|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .mob 迪菲亚强盗
    .isOnQuest 83
step
    #label PrincessC
    .goto Elwynn Forest,69.3,79.0
    >>击杀 |cRXP_ENEMY_公主|r，拾取她的 |cRXP_LOOT_项圈|r
    >>|cRXP_ENEMY_公主|r |cRXP_WARN_会与她的两只|r |cRXP_ENEMY_公主的随从|r一起进入战斗
    >>|cRXP_ENEMY_公主|r |cRXP_WARN_还会施放|r |T132368:0|t[急速冲锋] |cRXP_WARN_，造成高额伤害|r
    >>|cRXP_WARN_先积攒100怒气，再攻击|r |cRXP_ENEMY_公主|r << Warrior
    >>|cRXP_WARN_确保 |T136205:0|t[闪避] |cRXP_WARN_可用。若打不过，可借助围栏和投掷武器利用怪物寻路争取时间|r << Rogue
    >>|cRXP_WARN_做好使用|r |T134830:0|t[次级治疗药水]的准备
    .link https://www.youtube.com/watch?v=GRrXOV-UvD4 >> |cRXP_WARN_点击这里查看视频参考|r << !Warrior
    .complete 88,1 --Collect Brass Collar (x1)
    .mob 公主
step << Rogue
    #season 2
    .goto Elwynn Forest,67.4,78.6,60,0
    .goto Elwynn Forest,70.8,79.8,60,0
    .goto Elwynn Forest,89.2,78.8
    >>|T133644:0|t[搜索] |cRXP_ENEMY_迪菲亚成员|r，取得 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    >>|cRXP_WARN_注意：艾尔文森林的其他 |cRXP_ENEMY_迪菲亚|r 成员也可能掉落此物|r
    .collect 203785,1 -- Top-Left Map Piece (1)
    .mob 迪菲亚强盗
    .train 398196,1
step << skip --Paladin
    #xprate >1.59
    #label DefiasBandits
    #loop
    .goto Elwynn Forest,70.5,77.6,0
    .goto Elwynn Forest,70.8,80.9,0
    .goto Elwynn Forest,70.5,77.6,60,0
    .goto Elwynn Forest,68.1,77.5,60,0
    .goto Elwynn Forest,68.2,81.4,60,0
    .goto Elwynn Forest,70.8,80.9,60,0
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r，拾取他们掉落的 |cRXP_LOOT_红色亚麻面罩|r
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r，拾取他们掉落的 |cRXP_LOOT_红色亚麻面罩|r 和 |T132889:0|t[亚麻布]
    >>|cRXP_WARN_把|r |T132889:0|t[亚麻布]|cRXP_WARN_留给之后的任务|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .collect 2589,10,1644,1 --Linen Cloth (10)
    .disablecheckbox
    .mob 迪菲亚强盗
    .isOnQuest 83
step
    #completewith Level9Grind << Warlock
    #xprate <1.5 << !Warlock
    #label DefiasBandits
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r，拾取他们掉落的 |cRXP_LOOT_红色亚麻面罩|r
    .goto Elwynn Forest,70.5,77.6,60,0
    .goto Elwynn Forest,68.1,77.5,60,0
    .goto Elwynn Forest,68.2,81.4,60,0
    .goto Elwynn Forest,70.8,80.9,60,0
    .goto Elwynn Forest,70.5,77.6,60,0
    .goto Elwynn Forest,68.1,77.5,60,0
    .goto Elwynn Forest,68.2,81.4,60,0
    .goto Elwynn Forest,70.8,80.9,60,0
    .goto Elwynn Forest,70.5,77.6,60,0
    .goto Elwynn Forest,68.1,77.5,60,0
    .goto Elwynn Forest,68.2,81.4,60,0
    .goto Elwynn Forest,70.8,80.9,60,0
    .goto Elwynn Forest,69.3,79.0
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .mob 迪菲亚强盗
    .isOnQuest 83
step << Human Paladin
    #xprate >1.59
    .goto Elwynn Forest,70.5,77.6,0
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r，留出10块|cRXP_LOOT_亚麻布|r，供之后的“圣洁之书”任务使用。
    .collect 2589,10,1644,1 --Linen Cloth (10)
    .mob 迪菲亚强盗
step << Warlock/Warrior/Rogue
    #xprate <1.5
    #label Level9Grind
	.goto Elwynn Forest,69.53,79.47
    .xp 9+3510 >> 刷怪至 3510+/6500 经验值 << Warlock
    .xp 9+3420 >> 刷怪至 3420+/6500 经验值 << Warrior/Rogue
step << Warlock/Warrior/Rogue
    #xprate >1.49
    #optional
    #label Level9Grind
	.goto Elwynn Forest,69.53,79.47
    .xp 9+2015 >> 刷怪至 2015+/6500 经验值 << Warlock
    .xp 9+3050 >> 刷怪至 3050+/6500 经验值 << Warrior/Rogue
--XX Warlock and Warrior
step << Rogue
    #season 2
    .cast 401847 >>|cRXP_WARN_使用任意一块|r |T134327:0|t[|cRXP_LOOT_地图碎片]|r|cRXP_WARN_将它们合成为|r |T134269:0|t[|cRXP_LOOT_艾尔文藏宝图|r]
    .collect 203750,1
    .itemcount 203787,1
    .itemcount 203784,1
    .itemcount 203785,1
    .itemcount 203786,1
    .use 203787
    .use 203784
    .use 203785
    .use 203786
    .train 398196,1
step << Rogue
    #season 2
    #completewith next
    .goto Elwynn Forest,80.365,79.134
    .cast 401617 >>|cRXP_WARN_在箭头所指处使用|r |T134269:0|t[|cRXP_LOOT_艾尔文藏宝图|r]|cRXP_WARN_召出|cRXP_PICK_埋藏的宝藏|r|r
    .use 203750
    .itemcount 203750,1
    .train 398196,1
step << Rogue
    #season 2
    .goto Elwynn Forest,80.365,79.134
    >>打开 |cRXP_PICK_埋藏的宝藏|r，拾取其中的 |T134419:0|t[|cRXP_FRIENDLY_速射符文|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
step << Rogue
    #season 2
    .train 400095 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_速射符文|r] |cRXP_WARN_学习|r |T134536:0|t[速射]
    .use 203991
    .itemcount 203991,1
step << !Warlock
    #season 0,1 << Rogue
    #softcore
    #label EVDeathskip
    #completewith RedridgeS
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处重生
    .target 灵魂医者
    .zoneskip Redridge Mountains
--XX not worth deathskipping as a warlock due to having to resumm pet
step << skip --Paladin
    #xprate >1.59
    #optional
    .goto Elwynn Forest,79.457,68.789
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨拉·迪博雷恩|r 交谈
    .turnin 83 >> 交任务：红色亚麻布
    .target 萨拉·迪博雷恩
    .isQuestComplete 83
step
    #xprate <1.5 << !Warlock
    #optional << Warlock
    .goto Elwynn Forest,79.457,68.789
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨拉·迪博雷恩|r 交谈
    .turnin 83 >> 交任务：红色亚麻布
    .target 萨拉·迪博雷恩
    .isQuestComplete 83
step << !Warlock
    #optional
    #label WolfMeatCooking8
    #requires EVDeathskip
    #completewith RedridgeS
    .goto 1429,84.448,72.486,0
    .goto 1429,88.611,71.379,0
    .goto 1429,89.657,75.373,0
    .goto 1429,87.250,75.853,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob 觅食的灰狼
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step << !Warlock
    #optional
    #requires WolfMeatCooking8
    #completewith RedridgeS
    .goto 1429,84.448,72.486,0
    .goto 1429,88.611,71.379,0
    .goto 1429,89.657,75.373,0
    .goto 1429,87.250,75.853,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_暂时不用专门刷，只需击杀并拾取沿途遇到的狼|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob 觅食的灰狼
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step << !Warlock
    #label RedridgeS
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >> 前往赤脊山
step << !Warlock
    #optional
    .goto Redridge Mountains,17.4,69.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵帕克|r 交谈
    .accept 244 >> 接任务：豺狼人的入侵
    .target 卫兵帕克
    .xp <11,1
step << !Warlock
    #softcore
    #completewith RRFP
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处重生
    .target 灵魂医者
step << !Warlock
    #hardcore
    #optional
    #completewith RRFP
    .goto Redridge Mountains,18.581,69.208,15,0
    .goto Redridge Mountains,23.325,71.373,25,0
    .goto Redridge Mountains,29.565,67.930,25,0
    .goto Redridge Mountains,30.590,59.410,15 >>|cRXP_WARN_小心：沿着大路走，避开途中附近的怪物|r
step << !Warlock
    #optional
    .goto Redridge Mountains,30.73,59.99
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 交谈
    .turnin 244 >> 交任务：豺狼人的入侵
    .target 菲尔顿副队长
    .isOnQuest 244
    .xp <11,1
step << !Warlock
    #season 0,1 << Paladin
    #label RRFP
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
    .fp Redridge Mountains >> 开通赤脊山飞行点
    .target 艾蕾娜·斯托姆法瑟
step << Paladin
    #xprate <1.5
    #season 2
    #label RRFP
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
    .fp Redridge Mountains >> 开通赤脊山飞行点
    .target 艾蕾娜·斯托姆法瑟
step << Paladin
    #xprate >1.49
    #season 2
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
    .fp Redridge Mountains >> 开通赤脊山飞行点
    .target 艾蕾娜·斯托姆法瑟
    .train 410015,3
step << Paladin
    #xprate >1.49
    #season 2
    #label RRFP
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
    .fp Redridge Mountains >> 开通赤脊山飞行点
    .fly Stormwind >> 飞往暴风城
    .target 艾蕾娜·斯托姆法瑟
    .train 410015,1
step << Paladin
    #xprate >1.49
    #season 2
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩根·匹斯特|r 交谈
    .turnin 61,1 >> 交任务：送往暴风城的货物
    >>|cRXP_WARN_选择|r |T132383:0|t[爆破火箭] |cRXP_WARN_作为奖励。它的伤害不错，还能用于非常实用的分离拉怪|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >> |cRXP_WARN_点击观看分离拉怪的演示视频。视频很短，值得学习|r
    .target 摩根·匹斯特
    .train 410015,1
step << Paladin
    #season 2
    #xprate >1.59
    #optional
    #completewith Romulus
    .goto StormwindClassic,42.51,33.51,20 >> 前往暴风城大教堂
    .train 410015,1
step << skip --Human Paladin
    #season 2
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 交谈
    .accept 1641 >> 接任务：圣洁之书
    .turnin 1641 >> 交任务：圣洁之书
    .target 达索瑞恩·拉尔
    .xp <12,1
--XX so you can get the 500xp breadcrumb in goldshire
step << skip --Human Paladin
    #season 2
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_圣洁之书|r]来开启任务|r
    .accept 1642 >>接任务：圣洁之书
    .use 6775
    .xp <12,1
step << skip --Human Paladin
    #season 2
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1642 >>交任务：圣洁之书
    .accept 1643 >>接任务：圣洁之书
    .target 达索瑞恩·拉尔
    .xp <12,1
step << Paladin
    #xprate >1.49
    #season 2
    #label Romulus
    .goto StormwindClassic,38.10,28.10
    .gossipoption 109653 >>与|cRXP_FRIENDLY_罗姆鲁斯修士|r交谈
    .target 罗姆鲁斯修士
    .skipgossip
    .train 410015,1
step << Paladin
    #xprate >1.49
    #season 2
    #completewith next
    .goto StormwindClassic,37.39,29.76,5,0
    .goto StormwindClassic,37.87,29.10,5,0
    .goto StormwindClassic,36.52,32.67,8,0
    .goto StormwindClassic,36.55,33.45,8,0
    .goto StormwindClassic,35.95,34.05,8,0
    .goto StormwindClassic,35.46,33.03,8,0
    .goto StormwindClassic,35.95,31.54,8,0
    .goto StormwindClassic,34.79,29.31,8,0
    .goto StormwindClassic,33.69,29.69,8,0
    .goto StormwindClassic,32.57,27.49,8,0
    .goto StormwindClassic,33.41,25.61,8,0
    >>下楼进入大教堂地下墓穴的西侧
    .goto StormwindClassic,32.86,24.77,8 >>朝墓穴中的|cRXP_LOOT_烧焦的笔记|r走去
    .train 410015,1
step << Paladin
    #season 2
    #xprate >1.49
    .goto StormwindClassic,32.86,24.87
    >>拾取蜡烛旁的|cRXP_LOOT_烧焦的笔记|r
    .collect 205864,1 --Charred Note (1)
    .train 410015,1
step
    #optional
    #completewith CollectKelp
    .hs >> 使用炉石返回闪金镇
step << Warrior/Rogue
    #xprate <1.5
    #optional
    #completewith Escape
    +|cRXP_WARN_注意节约开支，尽量攒下 32 银 8 铜备用于暴风城|r << Rogue
    +|cRXP_WARN_注意节约开支，需要为稍后的暴风城和铁炉堡之行留出 31 银 85 铜|r << Warrior
    >>|cRXP_WARN_在此之前，交任务会获得 16 银 50 铜|r << Rogue
    >>|cRXP_WARN_在此之前，交任务会获得 18 银 25 铜|r << Warrior
    .money >0.50
--XX 1s 10c flight to SW, 20s 23c cutlass, 10s 1h sword, 30c/75c level 3/11 thrown - Rogue
--XX 1s 10c flight to SW, 10s 2h sword, 10s 2h mace, 10s thrown, 30c/75c level 3/11 thrown, 81c mining pick - Warrior
--XX 7s from 39, 3.5s from 76, 3.5s from 61, 2.5s from 109, 1.75 from 6281 (warrior)
step
    #label CollectKelp
    .goto Elwynn Forest,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威廉·匹斯特|r 交谈
    .turnin 112 >> 交任务：收集海藻
    .timer 9,收集海藻剧情
    .accept 114 >> 接任务：梅贝尔的隐形水
    .target 威廉·匹斯特
step << Warrior/Rogue
    #optional
    #completewith next << Warrior
    #completewith RogueOptTrain << Rogue
    .goto Elwynn Forest,43.877,66.546,9 >> 前往旅店二楼
step << Warrior/Rogue
    .goto Elwynn Forest,43.392,65.550
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米歇尔·贝利|r 交谈
    .train 3273 >> 学习 |T135966:0|t[急救]
    .target 米歇尔·贝利
step << Rogue
    #optional
    #label RogueOptTrain
    .goto Elwynn Forest,43.872,65.937
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科瑞恩·塞尔留斯|r 交谈
    >>|cRXP_WARN_只学习|r |T132147:0|t[双武器] |cRXP_WARN_和|r |T132307:0|t[疾跑]|cRXP_WARN_。不要学习其他技能，留钱供稍后使用|r
    .train 674 >> 学习 |T132147:0|t[双武器]
    .train 2983 >> 学习 |T132307:0|t[疾跑]
    .target 科瑞恩·塞尔留斯
    .xp <10,1
step
    .goto Elwynn Forest,42.105,65.927
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官杜汉|r 交谈
    .turnin 39 >> 交任务：托马斯的报告
    .turnin 76 >> 交任务：玉石矿洞
    .accept 239 >> 接任务：西泉要塞
    .accept 59 >> 接任务：布甲和皮甲 << Warlock
    .accept 109 >> 接任务：向格里安·斯托曼报到
    .target 治安官杜汉
step
    #sticky
    #label GoldshireVendor
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科瑞娜·斯蒂利|r 交谈
    .vendor >> 出售杂物
    .target 科瑞娜·斯蒂利
    .money >0.75
step
    .goto Elwynn Forest,41.706,65.544
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_铁匠阿古斯|r 交谈
    .accept 1097 >> 接任务：艾尔默的任务
    .target 铁匠阿古斯
step << Warlock/Warrior
    #requires GoldshireVendor
    #optional
    .xp 10 >> 刷怪升到10级
step << Warrior
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_里瑞亚·杜拉克|r 交谈
    .accept 1638 >> 接任务：战士的训练
    .trainer >> 学习职业技能
    .target 里瑞亚·杜拉克
    .money <0.5
step << Warrior
    #optional
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_里瑞亚·杜拉克|r 交谈
    >>|cRXP_WARN_不要学习技能，留钱供稍后使用|r
    .accept 1638 >> 接任务：战士的训练
    .target 里瑞亚·杜拉克
step << Paladin
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威尔海姆修士|r 交谈
    .trainer >> 学习职业技能
    .target 威尔海姆修士
    .xp <10,1
    .xp >12,1
step << Paladin
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威尔海姆修士|r 交谈
    .accept 2998 >> 接任务：圣洁之书
    .trainer >> 学习职业技能
    .target 威尔海姆修士
    .xp <12,1
step << Warlock
    #optional
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >> 下到旅店地下室
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛克西米利安·克洛文|r 和 |cRXP_FRIENDLY_雷门·玛考特|r 交谈
    .trainer >> 学习职业技能
    .goto Elwynn Forest,44.392,66.240
    .target +玛克西米利安·克洛文
    .accept 1685 >> 接任务：加科因的召唤
    .goto Elwynn Forest,44.485,66.268
    .target +雷门·玛考特
step << Mage/Priest
    #optional
    #requires GoldshireVendor
    #completewith next
    .goto Elwynn Forest,43.7,66.4,10 >>上楼
    .xp <10,1
step << Priest
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,43.283,65.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_女牧师洁塞塔|r 交谈
    .accept 5635 >> 接任务：绝望祷言
    .trainer >> 学习职业技能
    .target 女牧师洁塞塔
    .xp <10,1
step << Mage
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,43.25,66.19
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r 交谈
    .trainer >> 学习职业技能
    .target 扎尔迪玛·维夫希尔特
    .xp <10,1
step << skip --Rogue
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,43.872,65.937
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科瑞恩·塞尔留斯|r 交谈
    >>|cRXP_WARN_只学习|r |T132147:0|t[双武器] |cRXP_WARN_和|r |T132307:0|t[疾跑]|cRXP_WARN_。不要学习其他技能，留钱供稍后使用|r
    .train 674 >> 学习 |T132147:0|t[双武器]
    .train 2983 >> 学习 |T132307:0|t[疾跑]
    .target 科瑞恩·塞尔留斯
--XX skip quest, not worth going inside for
step << !Warlock
    #completewith PrincessFinish
    #optional
    .abandon 59 >> 放弃任务：布甲和皮甲
step
    #optional
    #label BoarMeatCooking3
    #completewith Garrison
    .goto Elwynn Forest,32.516,85.443,0
    .goto Elwynn Forest,31.081,81.488,0
    .goto Elwynn Forest,36.182,87.799,0
    .goto Elwynn Forest,41.733,86.986,0
    .goto Elwynn Forest,37.741,78.265,0
    .goto Elwynn Forest,41.576,69.499,0
    >>击杀 |cRXP_ENEMY_石牙野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 石牙野猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires BoarMeatCooking3
    #completewith Garrison
    .goto Elwynn Forest,32.516,85.443,0
    .goto Elwynn Forest,31.081,81.488,0
    .goto Elwynn Forest,36.182,87.799,0
    .goto Elwynn Forest,41.733,86.986,0
    .goto Elwynn Forest,37.741,78.265,0
    .goto Elwynn Forest,41.576,69.499,0
    >>击杀 |cRXP_ENEMY_石牙野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_现在不必专程刷取，只需击杀并拾取沿途的野猪|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 石牙野猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #optional
    #requires GoldshireVendor
    #completewith next
    .goto Elwynn Forest,43.154,89.625,50 >> 前往马科伦农场
step
--  #xprate <1.59
    #label Escape
    #requires GoldshireVendor
    .goto Elwynn Forest,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_梅贝尔·马科伦|r 交谈
    .turnin 114 >> 交任务：梅贝尔的隐形水
    .target 梅贝尔·马科伦
step
    #xprate <1.5
    #label PrincessFinish
    .goto Elwynn Forest,34.660,84.482
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯通菲尔德妈妈|r 交谈
    .turnin 88,1 >> 交任务：公主必须死！ << Rogue/Hunter
    .turnin 88,2 >> 交任务：公主必须死！ << Warrior/Paladin
    .turnin 88,3 >> 交任务：公主必须死！ << !Rogue !Hunter !Warrior !Paladin
    .target 斯通菲尔德妈妈
step
    #xprate >1.49
    #label PrincessFinish
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯通菲尔德妈妈|r和|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    .turnin 88,1 >> 交任务：公主必须死！ << Rogue/Hunter
    .turnin 88,2 >> 交任务：公主必须死！ << Warrior/Paladin
    .turnin 88,3 >> 交任务：公主必须死！ << !Rogue !Hunter !Warrior !Paladin
    .goto Elwynn Forest,34.660,84.482
    .target +斯通菲尔德妈妈
    .turnin 87 >> 交任务：金牙
    .target +波尼斯·斯通菲尔德姑妈
    .goto Elwynn Forest,34.486,84.253
step << !Warrior !Warlock
    #xprate <1.5
    #optional
    #completewith Garrison
    .xp 9+4510 >> 沿途刷怪至 4510+/6500 经验值
    .itemcount 1971,1 --Westfall Deed (1)
step << !Warrior !Warlock
    #xprate <1.5
    #optional
    #completewith Garrison
    .xp 9+5110 >> 沿途刷怪至 5110+/6500 经验值
    .itemcount 1971,<1 --Westfall Deed (0)
step
    #optional
    #completewith Garrison
    .goto Elwynn Forest,24.82,76.25,80 >> 前往西泉要塞
step
    #label Garrison
    #season 0,1 << Warrior/Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑞尼尔副队长|r 交谈
    .turnin 239 >> 交任务：西泉要塞
    .accept 11 >> 接任务：悬赏河爪豺狼人 << Warlock
    .goto Elwynn Forest,24.234,74.450
    .target +瑞尼尔副队长
    >>点击 |cRXP_PICK_通缉告示|r << Warlock
    .accept 176 >> 接任务：通缉：霍格 << Warlock
    .goto Elwynn Forest,24.548,74.672 << Warlock
step << Warlock
    #completewith GnollEnd
    >>击杀 |cRXP_ENEMY_矮小的河爪豺狼人|r和|cRXP_ENEMY_河爪豺狼人前锋|r，拾取 |T134939:0|t[|cRXP_LOOT_采金日程表|r]
    .use 1307 >>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_采金日程表|r] 接取任务|r
    >>|cRXP_WARN_任务物品|r |T134939:0|t[|cRXP_LOOT_采金日程表|r] |cRXP_WARN_掉率很低。若未获得就跳过此步骤|r
    >>|cRXP_ENEMY_格拉夫·疾齿|r |cRXP_WARN_是稀有怪，但该物品掉率为100%|r
    .collect 1307,1,123 --Collect Gold Pickup Schedule (x1)
    .accept 123 >> 接任务：收货人
    .unitscan 格拉夫·疾齿
step << Warlock
    #completewith next
    >>击杀 |cRXP_ENEMY_矮小的河爪豺狼人|r 和 |cRXP_ENEMY_河爪豺狼人前锋|r，拾取它们的 |cRXP_LOOT_臂章|r
    .complete 11,1 -- Painted Gnoll Armband (8)
    .mob 矮小的河爪豺狼人
    .mob 河爪豺狼人前锋
step << Warlock
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,25.9,93.9
    >>击杀 |cRXP_ENEMY_霍格|r，拾取他的 |cRXP_LOOT_爪子|r
    >>|cRXP_ENEMY_霍格|r |cRXP_WARN_可能在多个位置刷新|r
    >>|cRXP_WARN_持续施放|r |T136183:0|t[恐惧术] |cRXP_WARN_控制 |cRXP_ENEMY_霍格|r，并用常规持续伤害效果击杀他|r
    >>|cRXP_WARN_必要时将他风筝回卫兵塔，确保自己对他造成至少 50% 的伤害|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .unitscan 霍格
step << Warlock
    #label GnollEnd
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,25.9,93.9
    >>击杀 |cRXP_ENEMY_矮小的河爪豺狼人|r 和 |cRXP_ENEMY_河爪豺狼人前锋|r，拾取它们的 |cRXP_LOOT_臂章|r
    .complete 11,1 -- Painted Gnoll Armband (8)
    .mob 矮小的河爪豺狼人
    .mob 河爪豺狼人前锋
    .isOnQuest 11
step << Warlock
    .goto Elwynn Forest,24.234,74.450
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑞尼尔副队长|r 交谈
    .turnin 11 >> 交任务：悬赏河爪豺狼人
    .target 瑞尼尔副队长
step << !Warrior !Warlock
    #xprate <1.5
    #optional
    #completewith WestEntry
    .xp 9+4575 >> 沿途刷怪至 4575+/6500 经验值
    .itemcount 1971,1 --Westfall Deed (1)
step << !Warrior !Warlock
    #xprate <1.5
    #optional
    #completewith WestEntry
    .xp 9+5175 >> 沿途刷怪至 5175+/6500 经验值
    .itemcount 1971,<1 --Westfall Deed (0)
step << !Warlock
    #optional
    #completewith WestEntry
    .abandon 123 >> 放弃任务：收货人
step
    #completewith WestEntry
    .goto Westfall,59.95,19.35
    .zone Westfall >> 前往西部荒野
step
#xprate >1.49
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    >>|cRXP_WARN_不要接取其他任务|r
    .turnin 184 >> 交任务：法布隆的地契
    .goto Westfall,59.95,19.35
    .target +农夫法布隆
    .accept 36 >> 接任务：杂味炖肉
    .goto Westfall,59.92,19.42
	.target +弗娜·法布隆
    .isOnQuest 184
step
#xprate >1.49
    #label WestEntry
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗娜·法布隆|r 交谈
    >>|cRXP_WARN_不要接取其他任务|r
    .accept 36 >> 接任务：杂味炖肉
    .goto Westfall,59.92,19.42
	.target +弗娜·法布隆
step
#xprate <1.50
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .accept 64 >> 接任务：遗失的怀表
    .turnin 184 >> 交任务：法布隆的地契
    .goto Westfall,59.95,19.35
    .target +农夫法布隆
    .accept 151 >> 接任务：老马布兰契
    .accept 36 >> 接任务：杂味炖肉
    .goto Westfall,59.92,19.42
	.target +弗娜·法布隆
    .isOnQuest 184
step
#xprate <1.50
    #label WestEntry
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .accept 64 >> 接任务：遗失的怀表
    .goto Westfall,59.95,19.35
    .target +农夫法布隆
    .accept 151 >> 接任务：老马布兰契
    .accept 36 >> 接任务：杂味炖肉
    .goto Westfall,59.92,19.42
	.target +弗娜·法布隆
step
    #optional
    #completewith next
    +|cRXP_WARN_暂时不要拾取|r任何 |T134059:0|t[|cRXP_PICK_燕麦袋|r]，|cRXP_WARN_除非你给自己邮寄了大容量背包|r；接下来的路线需要留出背包空间
    .isOnQuest 151
step
#xprate <1.50
    #sticky
    #label Fields
    .goto Westfall,56.04,31.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_农夫萨丁|r 交谈
    .accept 9 >> 接任务：清理荒野
    .target 农夫萨丁
step
#xprate >1.49
    .goto Westfall,56.416,30.519
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_萨尔玛·萨丁|r 交谈
    >>|cRXP_WARN_不要接取其他任务|r
    .turnin 36 >> 交任务：杂味炖肉
    .target 萨尔玛·萨丁
step
#xprate <1.50
    .goto Westfall,56.416,30.519
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_萨尔玛·萨丁|r 交谈
    .turnin 36 >> 交任务：杂味炖肉
    .accept 38 >> 接任务：杂味炖肉
    .accept 22 >>接任务：猪肝馅饼
    .target 萨尔玛·萨丁
step
    #xprate <1.5
    #requires Fields
    .goto Westfall,56.327,47.520
    .xp 9+5775 >> 刷怪至 5775+/6500 经验值
    .subzoneskip 108
step
    #xprate >1.49 << !Paladin
    #xprate 1.49-1.59 << Paladin
    #optional
    #requires Fields
    .goto Westfall,56.327,47.520
    .xp 9+5410 >> 刷怪至 5410+/6500 经验值
    .subzoneskip 108
step << Paladin
    #xprate >1.59
    #optional
    .goto 1436,48.249,46.729
    .xp 11+5360 >> 刷怪至 5360+/8800 经验值
--XX 625+210+85+800 = 1720 x2 = 3440
step
    #softcore
    #completewith next
    .deathskip >> 死亡后在灵魂医者处复活
    .target 灵魂医者
-- .subzoneskip 108
step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 和 |cRXP_FRIENDLY_丹努文队长|r 交谈
    .turnin 109 >> 交任务：向格里安·斯托曼报到
    .accept 12 >> 接任务：西部荒野人民军
    .goto Westfall,56.327,47.520
    .target +格里安·斯托曼
    .accept 102 >> 接任务：西部荒野的豺狼人
    .goto Westfall,56.421,47.623
    .target +丹努文队长
step
    #xprate >1.49
    .goto Westfall,56.327,47.520
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 交谈
    .turnin 109 >> 交任务：向格里安·斯托曼报到
    .target 格里安·斯托曼
step << Human
    #optional
    .goto Westfall,56.04,31.23
    .xp 10 >> 刷怪升到 10 级
step
    .goto Westfall,57.002,47.169
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_军需官刘易斯|r 交谈
    .accept 6181 >> 接任务：快递消息 << Human
    .target 军需官刘易斯
    .isQuestAvailable 6181 << Human
step
    .goto Westfall,52.86,53.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_向她购买最多20个|r |T133918:0|t[长嘴泥鳅]|cRXP_BUY_。这是非常便宜的5级食物|r
    .collect 4592,20,314,1 --Longjaw Mud Snapper (20)
	.target 旅店老板希瑟尔
step << Human
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 交谈
    .turnin 6181 >> 交任务：快递消息
    .accept 6281 >> 接任务：赶赴暴风城
    .target 索尔
step << skip --Rogue
    #season 2
    #completewith FlySW
    #label RoSS
    .goto Westfall,51.540,55.361,30,0
    .goto Westfall,51.093,54.642,30,0
    .goto Westfall,50.81,47.15,50,0
    .goto Westfall,51.093,54.642
    >>|T133644:0|t[搜索] |cRXP_ENEMY_迪菲亚斥候|r，取得 |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    >>|cRXP_WARN_由于等级偏低，|r |T133644:0|t[搜索] |cRXP_WARN_很可能失败。如果失败，就跳过此步骤并飞往暴风城，稍后会在洛克莫丹完成|r
    >>|cRXP_WARN_不要引到|cRXP_ENEMY_迪菲亚斥候|r，否则它会施放|r |T132331:0|t[消失]|cRXP_WARN_并消失 3–5 分钟。务必提前进入|r |T132320:0|t[潜行]|cRXP_WARN_状态！|r
    >>|cRXP_WARN_|cRXP_ENEMY_迪菲亚斥候|r可能会在山坡上刷新|r
    .collect 208772,1 -- Rune of Saber Slash (1)
    .unitscan 迪菲亚斥候
    .train 424785,1
--XX Moved/forced to Loch/Darkshore
step << skip --Rogue
    #season 2
    #completewith next
    #requires RoSS
    .cast 402265 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .itemcount 208772,1
    .train 424785,1
step
    #label FlySW
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 交谈
    .fly Stormwind >> 飞往暴风城
    .target 索尔
step << skip --Human Paladin
    #season 2
    #xprate >1.59
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯蒂芬妮·特纳|r 交谈
    .turnin 1643 >> 交任务：圣洁之书
    .accept 1644 >> 接任务：圣洁之书
    .turnin 1644 >> 交任务：圣洁之书
    --.accept 1780 >> Accept The Tome of Divinity
    .target 斯蒂芬妮·特纳
    .isQuestTurnedIn 1643
    .xp 12,1
step << Paladin
    #xprate >1.49
    #season 2
    #optional
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩根·匹斯特|r 交谈
    .turnin 61,1 >> 交任务：送往暴风城的货物
    >>|cRXP_WARN_选择|r |T132383:0|t[爆破火箭] |cRXP_WARN_作为奖励。它的伤害不错，还能用于非常实用的分离拉怪|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >> |cRXP_WARN_点击观看分离拉怪的演示视频。视频很短，值得学习|r
    .target 摩根·匹斯特
step << Paladin
    #xprate <1.5
    #season 2
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩根·匹斯特|r 交谈
    .turnin 61,1 >> 交任务：送往暴风城的货物
    >>|cRXP_WARN_选择|r |T132383:0|t[爆破火箭] |cRXP_WARN_作为奖励。它的伤害不错，还能用于非常实用的分离拉怪|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >> |cRXP_WARN_点击观看分离拉怪的演示视频。视频很短，值得学习|r
    .target 摩根·匹斯特
step
    #season 0,1 << Paladin
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩根·匹斯特|r 交谈
    .turnin 61,1 >> 交任务：送往暴风城的货物
    >>|cRXP_WARN_选择|r |T132383:0|t[爆破火箭] |cRXP_WARN_作为奖励。它的伤害不错，还能用于非常实用的分离拉怪|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >> |cRXP_WARN_点击观看分离拉怪的演示视频。视频很短，值得学习|r
    .target 摩根·匹斯特
step << Rogue
    #optional
    #completewith next
    .goto 1453,57.764,61.412,6 >> 进入日常百货店
step << Rogue
    #xprate <1.5
    .goto 1453,58.380,61.683
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔曼·穆比|r交谈
    >>|cRXP_BUY_向他购买|r |T135425:0|t[锋利的飞刀]|cRXP_BUY_|r
    .collect 3107,200 --Collect Keen Throwing Knife (200)
    .target 萨尔曼·穆比
    .xp <10+5890,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
--XX 420 6281, 110 1097, 900 6661, 85 IF, 65 Gate IF, 65 refuge, 65 Amberstill
--XX (WARR ONLY): 90 1638, 90 1639, 210 1640, 420 1665
step << Rogue
    #xprate <1.5
    .goto 1453,58.380,61.683
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔曼·穆比|r交谈
    >>|cRXP_BUY_向他购买|r |T135641:0|t[平衡飞刀]|cRXP_BUY_|r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target 萨尔曼·穆比
    .xp >10+5890,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #xprate >1.49
    .goto 1453,58.380,61.683
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔曼·穆比|r交谈
    >>|cRXP_BUY_向他购买|r |T135425:0|t[锋利的飞刀]|cRXP_BUY_|r
    .collect 3107,200 --Collect Keen Throwing Knife (200)
    .target 萨尔曼·穆比
    .xp <10+5035,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
--XX 420 6281, 110 1097, 900 6661, 85 IF, 65 Gate IF, 65 refuge, 65 Amberstill
step << Rogue
    #xprate >1.49
    .goto 1453,58.380,61.683
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔曼·穆比|r交谈
    >>|cRXP_BUY_向他购买|r |T135641:0|t[平衡飞刀]|cRXP_BUY_|r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target 萨尔曼·穆比
    .xp >10+5035,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #optional
    #completewith Continue
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Rogue
    #optional
    #completewith Continue
    +|cRXP_WARN_装备|r |T135641:0|t[平衡飞刀]
    .use 2946
    .itemcount 2946,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step
    #optional << Warlock/Mage/Warrior
    .goto StormwindClassic,57.129,57.698
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .trainer >>学习单手剑（1H）和法杖 << Warlock/Mage
    .trainer >>学习单手剑（1h） << Rogue
    .trainer >>学习法杖 << Priest
    .trainer >>学习双手剑（2h） << Warrior/Paladin
    .target 吴平
    .money <0.2 << Warlock/Mage
    .money <0.3 << Warrior
step << Warlock/Mage
    .goto StormwindClassic,57.129,57.698
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .trainer >>学习法杖
    .target 吴平
step << Rogue
    #ssf
    #optional
    .goto StormwindClassic,57.547,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_购买一把|r |T135346:0|t[斗士短剑]，|cRXP_BUY_由他出售|r
    .collect 851,1 -- Cutlass (1)
    .target 冈瑟尔·维勒
    .money <0.2623
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .train 2983,1 --Sprint not Trained
step << Rogue
    #ssf
    #optional
    .goto StormwindClassic,57.547,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_购买一把|r |T135346:0|t[斗士短剑]，|cRXP_BUY_由他出售|r
    .collect 851,1 -- Cutlass (1)
    .target 冈瑟尔·维勒
    .money <0.2023
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .train 2983,3 --Sprint Trained
step << Rogue
    #optional
    #ah
    .goto StormwindClassic,57.547,57.076
    .goto 1453,53.615,59.767,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_购买一把|r |T135346:0|t[斗士短剑]，|cRXP_BUY_由他出售|r
    >>|cRXP_WARN_也可以看看拍卖行有没有更好或更便宜的武器|r
    >>|cRXP_WARN_确保留下 6 银币，供稍后学习技能|r
    .collect 851,1 -- Cutlass (1)
    .target 冈瑟尔·维勒
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .train 2983,1 --Sprint not Trained
    .money <0.06
--XX No money gate factoring cutlass in case something cheaper on AH
step << Rogue
    #optional
    #ah
    .goto StormwindClassic,57.547,57.076
    .goto 1453,53.615,59.767,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_购买一把|r |T135346:0|t[斗士短剑]，|cRXP_BUY_由他出售|r
    >>|cRXP_WARN_也可以看看拍卖行有没有更好或更便宜的武器|r
    .collect 851,1 -- Cutlass (1)
    .target 冈瑟尔·维勒
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .train 2983,3 --Sprint Trained
--XX No money gate factoring cutlass in case something cheaper on AH
step << Rogue
    #optional
    #completewith Continue
    +|cRXP_WARN_装备|r |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step
    #xprate <1.5
    .goto StormwindClassic,52.623,65.701
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板奥里森|r 交谈
    .home >> 将炉石设置在暴风城
    .target 旅店老板奥里森
step << skip --Warrior
    #season 2
    .gossipoption 109045 >> 与花园区旅店内的 |cRXP_FRIENDLY_丽芙·布拉德弗|r 交谈
    .gossipoption 109047
    .goto Stormwind City,22.608,64.621
    .gossipoption 109084 >> 与 |cRXP_ENEMY_斯图阿特|r 交谈，然后击败他。他会在生命值降到 0% 时昏倒
    .goto Stormwind City,21.213,62.781
    >>如果 |cRXP_ENEMY_斯图阿特|r 不在，就等待他刷新
    .gossipoption 109044 >> 与 |cRXP_FRIENDLY_丽芙·布拉德弗|r 再次交谈；打晕 |cRXP_ENEMY_斯图阿特|r 后可领取 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .goto Stormwind City,22.608,64.621
    .train 425447,1 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r] |cRXP_WARN_学习|r |T236317:0|t[狂乱攻击]
    >>|cRXP_WARN_注意：这个等级单人完成较难，可以找人帮忙，也可以稍后到 12 级再完成|r
    .use 204716
    .target 丽芙·布拉德弗
    .mob 斯图阿特
step << Human Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 交谈
    .turnin 2998 >> 交任务：圣洁之书
    .accept 1641 >> 接任务：圣洁之书
    .turnin 1641 >> 交任务：圣洁之书
    .target 达索瑞恩·拉尔
    .isOnQuest 2998
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 交谈
    .accept 1641 >> 接任务：圣洁之书
    .turnin 1641 >> 交任务：圣洁之书
    .target 达索瑞恩·拉尔
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_圣洁之书|r]来开启任务|r
    .accept 1642 >>接任务：圣洁之书
    .use 6775
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1642 >>交任务：圣洁之书
    .accept 1643 >>接任务：圣洁之书
    .target 达索瑞恩·拉尔
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 交谈
    .train 19834 >> 学习职业技能
    .target 虔诚的亚瑟
    .xp <12,1
    .xp >14,1
step << Human Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 交谈
    .train 647 >> 学习职业技能
    .target 虔诚的亚瑟
    .xp <14,1
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯蒂芬妮·特纳|r 交谈
    .turnin 1643 >> 交任务：圣洁之书
    .accept 1644 >> 接任务：圣洁之书
    .turnin 1644 >> 交任务：圣洁之书
    --.accept 1780 >> Accept The Tome of Divinity
    .target 斯蒂芬妮·特纳
----XX if ever in the future, add Level 12 xp grind for 1.5x Tome of Divinity
----Warlock Elwynn Voidwalker Section Start----
step << Warlock
    #optional
    #completewith GakinStart
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往已宰的羔羊旅店并下楼
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 交谈
    .train 705 >> 学习职业技能
    .target 厄苏拉·德林
    .xp <12,1
    .xp >14,1
step << Warlock
    #xprate >1.59
    #optional
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 交谈
    .train 689 >> 学习职业技能
    .target 厄苏拉·德林
    .xp <14,1
step << Warlock
    #label GakinStart
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 交谈
    .turnin 1685 >> 交任务：加科因的召唤
    .accept 1688 >> 接任务：苏伦娜·凯尔东
    .target 黑暗缚灵者加科因
step << Warlock
    #softcore
    .deathskip >> 使用 |cRXP_FRIENDLY_灵魂医者|r 复活；先用 |T136126:0|t[生命分流] 降低生命值，再站到旁边的篝火上死亡
    .target 灵魂医者
--  .subzoneskip 87
step << Warlock
    #hardcore
    #completewith WLHoggerEnd
    .goto Elwynn Forest,42.105,65.927
    .zone Elwynn Forest >> 离开暴风城
step << Warlock
    #completewith WLHoggerEnd
    .goto Elwynn Forest,42.105,65.927
    .subzone 87 >> 前往闪金镇
step << Warlock
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官杜汉|r 交谈
    >>|cRXP_WARN_选择|r |T135145:0|t[平衡长棍]
    .turnin 176 >> 交任务：通缉：霍格
    .turnin 123 >> 交任务：收货人
    .target 治安官杜汉
    .isOnQuest 123
step << Warlock
    #label WLHoggerEnd
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官杜汉|r 交谈
    >>|cRXP_WARN_选择|r |T135145:0|t[平衡长棍]
    .turnin 176 >> 交任务：通缉：霍格
    .target 治安官杜汉
step << Warlock
    #optional
    #completewith WLBandanaEnd
    +|cRXP_WARN_装备|r |T135145:0|t[平衡长棍]
    .use 6215
    .itemcount 6215,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.9
step << Warlock
    #optional
    #label BoarMeatCooking4
    #completewith SChoker
    .goto 1429,49.917,72.959,0
    .goto 1429,54.444,75.879,0
    .goto 1429,57.620,76.213,0
    .goto 1429,61.911,78.274,0
    .goto 1429,65.619,78.388,0
    >>击杀 |cRXP_ENEMY_石皮野猪|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 石皮野猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 62 --Brackwell Pumpkin Patch
step << Warlock
    #optional
    #requires BoarMeatCooking4
    #completewith SChoker
    .goto 1429,49.917,72.959,0
    .goto 1429,54.444,75.879,0
    .goto 1429,57.620,76.213,0
    .goto 1429,61.911,78.274,0
    .goto 1429,65.619,78.388,0
    >>击杀 |cRXP_ENEMY_石皮野猪|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_现在不必专程刷取，只需击杀并拾取沿途的野猪|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 石皮野猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 62 --Brackwell Pumpkin Patch
step << Warlock
    #optional
    >>|cRXP_WARN_沿途刷怪，尽量提升使用|r |T135145:0|t[平衡长棍] |cRXP_WARN_时的武器技能|r
    .subzone 62 >> 前往布莱克威尔南瓜田
    .isOnQuest 1688
step << Warlock
    #xprate <1.5
    #optional
    #completewith SChoker
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r，拾取 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r]
    .use 1972>>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] 接取任务|r
    >>|cRXP_WARN_任务物品|r |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] |cRXP_WARN_掉率很低。若未获得就跳过此步骤|r
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >> 接任务：法布隆的地契
step << Warlock
    #sticky
    #label WLBandanaEnd
    #loop
    .goto Elwynn Forest,70.5,77.6,0
    .goto Elwynn Forest,70.8,80.9,0
    .waypoint Elwynn Forest,70.5,77.6,60,0
    .waypoint Elwynn Forest,68.1,77.5,60,0
    .waypoint Elwynn Forest,68.2,81.4,60,0
    .waypoint Elwynn Forest,70.8,80.9,60,0
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r，拾取他们掉落的 |cRXP_LOOT_红色亚麻面罩|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .mob 迪菲亚强盗
    .isOnQuest 83
step << Warlock
    #label SChoker
    .goto Elwynn Forest,71.10,80.66
    >>击杀 |cRXP_ENEMY_苏伦娜·凯尔东|r，拾取她的 |cRXP_LOOT_项圈|r
    >>|cRXP_WARN_集中火力，迅速击杀 |cRXP_ENEMY_苏伦娜·凯尔东|r|r
    >>|cRXP_WARN_持续施放|r |T136183:0|t[恐惧术]|cRXP_WARN_在|cRXP_ENEMY_收货人莫根|r身上|r
    .complete 1688,1 --Surena's Choker (1)
    .mob 苏伦娜·凯尔东
step << Warlock
    #optional
    #label WolfMeatCooking9
    #completewith WlockRedridge
    .goto 1429,84.448,72.486,0
    .goto 1429,88.611,71.379,0
    .goto 1429,89.657,75.373,0
    .goto 1429,87.250,75.853,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob 觅食的灰狼
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step << Warlock
    #optional
    #requires WolfMeatCooking9
    #completewith WlockRedridge
    .goto 1429,84.448,72.486,0
    .goto 1429,88.611,71.379,0
    .goto 1429,89.657,75.373,0
    .goto 1429,87.250,75.853,0
    >>击杀 |cRXP_ENEMY_觅食的灰狼|r，拾取它们掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_暂时不用专门刷，只需击杀并拾取沿途遇到的狼|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob 觅食的灰狼
    .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step << Warlock
    #requires WLBandanaEnd
    .goto Elwynn Forest,79.457,68.789
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨拉·迪博雷恩|r 交谈
    .turnin 59 >> 交任务：布甲和皮甲
    .turnin 83 >> 交任务：红色亚麻布
    .target 萨拉·迪博雷恩
    .isOnQuest 83
step << Warlock
    #optional
    #requires WLBandanaEnd
    .goto Elwynn Forest,79.457,68.789
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨拉·迪博雷恩|r 交谈
    .turnin 59 >> 交任务：布甲和皮甲
    .target 萨拉·迪博雷恩
step << Warlock
    #optional
    #completewith Gnolls
    #label SoulShards
    >>|cRXP_WARN_沿途刷怪。在抵达赤脊山前，确保至少有2个|r |T134075:0|t[|cRXP_LOOT_灵魂碎片|r]，|cRXP_WARN_通过|r |T136163:0|t[|cRXP_FRIENDLY_吸取灵魂|r]在怪物即将死亡时施放来获取
    .collect 6265,2 --Soul Shard (2)
step << Warlock
    #optional
    #label WlockRedridge
    #completewith next
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >> 前往赤脊山
step << Warlock
    #label Gnolls
    #requires SoulShards
    .goto Redridge Mountains,17.4,69.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵帕克|r 交谈
    .accept 244 >> 接任务：豺狼人的入侵
    .target 卫兵帕克
step << Warlock
    .goto Redridge Mountains,18.581,69.208,15,0
    .goto Redridge Mountains,23.325,71.373,25,0
    .goto Redridge Mountains,29.565,67.930,25,0
    .goto Redridge Mountains,30.733,59.996,25 >> 朝湖畔镇前进
    >>|cRXP_WARN_沿主路前进，避开沿途靠近道路的怪物|r
    .target 菲尔顿副队长
step << Warlock
    .goto Redridge Mountains,30.733,59.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 交谈
    .turnin 244 >> 交任务：豺狼人的入侵
step << Warlock
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 交谈
    .fp Redridge Mountains >> 开通赤脊山飞行点
    .fly Stormwind >> 飞往暴风城
    .target 艾蕾娜·斯托姆法瑟
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往已宰的羔羊旅店并下楼
step << Warlock
    #optional
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
    .xp <12,1
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 交谈
    .turnin 1688 >> 交任务：苏伦娜·凯尔东
    .accept 1689 >> 接任务：誓缚
    .target 黑暗缚灵者加科因
step << Warlock
    #completewith next
    .goto StormwindClassic,25.2,80.7,18,0
    .goto StormwindClassic,23.2,79.5,18,0
    .goto StormwindClassic,26.3,79.5,18,0
    .goto StormwindClassic,25.154,77.406
    >>|cRXP_WARN_前往已宰的羔羊最底层|r
    .cast 7728 >> |cRXP_WARN_使用|r |T133292:0|t[血石颈环] |cRXP_WARN_召唤|r |cRXP_ENEMY_虚空行者|r
    .use 6928
step << Warlock
    .goto StormwindClassic,25.154,77.406
    .use 6928 >> 击杀|cRXP_ENEMY_虚空行者|r
    .complete 1689,1 --Kill Summoned Voidwalker (x1)
    .mob 虚空行者
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 交谈
    .target 黑暗缚灵者加科因
    .goto StormwindClassic,25.25,78.59
    .turnin 1689 >> 交任务：誓缚
----Warlock Elwynn Voidwalker Section End----
step << Rogue
    #xprate <1.59
    .goto 1453,74.645,52.818
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 交谈
    >>|cRXP_WARN_只学习|r |T132147:0|t[双武器] |cRXP_WARN_和|r |T132307:0|t[疾跑]
    .train 674 >> 学习 |T132147:0|t[双武器]
    .train 2983 >> 学习 |T132307:0|t[疾跑]
    .target 夜行者奥斯伯
step << Rogue
    #xprate >1.59
    .goto 1453,74.645,52.818
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 交谈
    .train 674 >> 学习 |T132147:0|t[双武器]
    .train 2983 >> 学习 |T132307:0|t[疾跑]
    .target 夜行者奥斯伯
    .xp <10,1
    .xp >12,1
step << Rogue
    #xprate >1.59
    .goto 1453,74.645,52.818
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 交谈
    .train 1766 >> 学习职业技能
    .target 夜行者奥斯伯
    .xp <12,1
    .xp >14,1
step << Rogue
    #xprate >1.59
    #optional
    .goto 1453,74.645,52.818
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 交谈
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .xp <14,1
step << Rogue
    #optional
    #label StilettoDW
    #completewith Continue
    +|cRXP_WARN_装备|r |T135346:0|t[卷刃的剑]|cRXP_WARN_在你的副手|r
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>6.7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #optional
    #requires StilettoDW
    #completewith Continue
    +|cRXP_WARN_如果现在还不能|r |T132147:0|t[双持武器] |cRXP_WARN_也不用担心，之后需要时会购买武器|r
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.4
step << Human
    #xprate <1.5
    #label Continue
    .goto StormwindClassic,74.312,47.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯瑞克·斯图恩|r 交谈
    .turnin 6281 >> 交任务：赶赴暴风城
    .accept 6261 >> 接任务：杜加尔·朗德瑞克
    .target 奥斯瑞克·斯图恩
step << Human
    #xprate >1.49
    #label Continue
    .goto StormwindClassic,74.312,47.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯瑞克·斯图恩|r 交谈
    .turnin 6281 >> 交任务：赶赴暴风城
    .target 奥斯瑞克·斯图恩
step << Warrior
    .goto StormwindClassic,74.249,37.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈里·伯加德|r 交谈
    .turnin 1638 >> 交任务：战士的训练
    .accept 1639 >> 接任务：醉鬼巴特莱比
    .target 哈里·伯加德
step << Warrior
    .goto StormwindClassic,73.787,36.323
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴特莱比|r 交谈
    .turnin 1639 >> 交任务：醉鬼巴特莱比
    .accept 1640 >> 接任务：击败巴特莱比
    .target 巴特莱比
step << Warrior
    .goto StormwindClassic,73.787,36.323
    >>攻击 |cRXP_ENEMY_巴特莱比|r。他会在生命值降至 1% 时认输
    .complete 1640,1 --Beat Bartleby
    .mob 巴特莱比
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴特莱比|r 交谈
    .target 巴特莱比
    .goto StormwindClassic,73.787,36.323
    .turnin 1640 >> 交任务：击败巴特莱比
    .accept 1665 >> 接任务：巴特莱比的酒杯
step << Warrior
    .goto StormwindClassic,74.249,37.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈里·伯加德|r 交谈
    .turnin 1665 >> 交任务：巴特莱比的酒杯
    .target 哈里·伯加德
step << Priest
    #optional
    #completewith Prayer
    .goto StormwindClassic,42.51,33.51,20 >> 进入暴风城大教堂
step << Priest
    #optional
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 交谈
    .turnin 5635 >> 交任务：绝望祷言
    .train 8092 >> 学习职业技能
    .target 高阶牧师劳瑞娜
    .isOnQuest 5635
step << Priest
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 交谈
    .turnin 5634 >> 交任务：绝望祷言
    .train 8092 >> 学习职业技能
    .target 高阶牧师劳瑞娜
    .train 13908,1
step << Priest
    #optional
    #label Prayer
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 交谈
    .trainer >> 学习职业技能
    .target 高阶牧师劳瑞娜
    .train 13908,3
step << Rogue
    #season 2
    #optional
    #completewith next
    .goto Stormwind City,56.93,29.54,8,0
    .goto Stormwind City,58.65,27.56,10 >> 进入暴风城矮人区的割喉小巷
    .train 400081,1
step << Rogue
    #season 2
    #optional
    .goto Stormwind City,63.201,29.491,5,0
    .goto Stormwind City,61.728,29.190
    >>|cRXP_WARN_进入屋内楼上|r
    >>打开 |cRXP_PICK_布满灰尘的箱子|r，拾取其中的 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_此举会召出两名 10 级 |cRXP_ENEMY_割喉劫匪|r，他们会攻击你|r
    .collect 204174,1 -- Rune of Precision (1)
    .mob 割喉劫匪
    .train 400081,1
step << Rogue
    #season 2
    #optional
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_以学习|r |T135610:0|t[正中眉心]
    .use 204174
    .itemcount 204174,1
step
    .goto StormwindClassic,51.757,12.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格瑞曼德·艾尔默|r 交谈
    .turnin 1097 >> 交任务：艾尔默的任务
    .accept 353 >> 接任务：雷矛的包裹
    .target 格瑞曼德·艾尔默
step << Warrior
    #season 0,1
    #optional
    #completewith DeeprunEnter
    +|cRXP_WARN_将|r |T132363:0|t[破甲攻击]|cRXP_WARN_放到快捷栏并持续使用，效果优于|r |T132282:0|t[英勇打击]
step << Warrior/Paladin/Rogue
    #optional
    .goto StormwindClassic,56.3,17.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_凯塔·深炉|r 交谈
    .collect 2901,1,432,1 >>|cRXP_BUY_向她购买一把|r |T134708:0|t[矿工锄]|cRXP_BUY_|r
    >>|cRXP_WARN_稍后还会学习|r |T134708:0|t[采矿]|cRXP_WARN_技能|r
    .target 凯塔·深炉
    .train 2018,3 --Blacksmithing
--XX 81c, 1s 75c from 6281
step
    #label DeeprunEnter
    .goto 1453,60.972,11.690,30,0
    .goto 1453,65.933,5.771
    .subzone 2257 >>进入矿道地铁
    .zoneskip Ironforge
step
    #optional
    #label TramCook1
    #completewith TramEnd
    >>|cRXP_WARN_地铁到站后，在车上进行以下操作：|r
    .cast 818 >>|cRXP_WARN_制作一个|r |T135805:0|t[基础营火]|cRXP_WARN_（在法术书的通用技能标签页中）|r
    .usespell 818
    .zoneskip Ironforge
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #optional
    #requires TramCook1
    #label TramCook2
    #completewith TramEnd
    >>|cRXP_WARN_地铁到站后，在车上进行以下操作：|r
    .cast 818 >>|cRXP_WARN_制作一个|r |T135805:0|t[基础营火]|cRXP_WARN_（在法术书的通用技能标签页中）|r
    .usespell 818
    .zoneskip Ironforge
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #optional
    #requires TramCook2
    #label TramCook3
    #completewith TramEnd
    >>|cRXP_WARN_地铁到站后，在车上进行以下操作：|r
    .cast 818 >>|cRXP_WARN_制作一个|r |T135805:0|t[基础营火]|cRXP_WARN_（在法术书的通用技能标签页中）|r
    .usespell 818
    .zoneskip Ironforge
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #optional
    #requires TramCook3
    #label TramCook4
    #completewith TramEnd
    >>|cRXP_WARN_需要达到 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，稍后暮色森林的任务会用到|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_以下物品：|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_材料|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r，|cRXP_WARN_制成|r |T133974:0|t[烤野猪肉]
    >>|T133971:0|t[烹饪] |cRXP_WARN_材料|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r，|cRXP_WARN_制成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Ironforge
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #optional
    #requires TramCook4
    #label TramCook5
    #completewith TramEnd
    >>|cRXP_WARN_需要达到 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，稍后暮色森林的任务会用到|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_材料|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r，|cRXP_WARN_制成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Ironforge
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #optional
    #requires TramCook5
    #label TramCook6
    #completewith TramEnd
    >>|cRXP_WARN_需要达到 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，稍后暮色森林的任务会用到|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_材料|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r，|cRXP_WARN_制成|r |T133974:0|t[烤野猪肉]
    .usespell 2550
    .zoneskip Ironforge
    .itemcount 769,1 --Chunk of Boar Meat (1)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #xprate <1.59
    #optional
    #label TramEnd
    >>|cRXP_WARN_乘坐矿道地铁前往铁炉堡一侧|r
    >>|cRXP_WARN_等待前往铁炉堡的地铁时，可以按需提升|r |T135966:0|t[急救] |cRXP_WARN_技能|r << Rogue/Warrior/Paladin
    >>|cRXP_WARN_24 级的一个任务需要|r |T135966:0|t[急救] |cRXP_WARN_技能达到 80|r << Rogue !Dwarf
    >>|cRXP_WARN_施放|r |T136221:0|t[召唤虚空行者] |cRXP_WARN_和|r |T135230:0|t[制造治疗石]，|cRXP_WARN_可在等待前往铁炉堡的地铁时按需准备|r << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与矿道地铁铁炉堡一侧中间站台上的 |cRXP_FRIENDLY_蒙提|r 交谈
    .accept 6661 >> 接任务：捕捉矿道老鼠
    .target 蒙提
step
    #xprate <1.59
    >>|cRXP_WARN_使用|r |T133942:0|t[捕鼠者之笛]，|cRXP_WARN_目标为矿道地铁内的 |cRXP_ENEMY_矿道老鼠|r|r
    .complete 6661,1 --Rats Captured (x5)
    .use 17117
    .mob 矿道老鼠
step
    #xprate <1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与矿道地铁内的 |cRXP_FRIENDLY_蒙提|r 交谈
    .turnin 6661 >> 交任务：捕捉矿道老鼠
    .target 蒙提
step
    #xprate >1.59
    #optional
    #label TramEnd
    >>|cRXP_WARN_乘坐矿道地铁前往铁炉堡一侧|r
    >>|cRXP_WARN_等待前往铁炉堡的地铁时，可以按需提升|r |T135966:0|t[急救] |cRXP_WARN_技能|r << Rogue/Warrior/Paladin
    >>|cRXP_WARN_24 级的一个任务需要|r |T135966:0|t[急救] |cRXP_WARN_技能达到 80|r << Rogue !Dwarf
    >>|cRXP_WARN_施放|r |T136221:0|t[召唤虚空行者] |cRXP_WARN_和|r |T135230:0|t[制造治疗石]，|cRXP_WARN_可在等待前往铁炉堡的地铁时按需准备|r << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与矿道地铁铁炉堡一侧中间站台上的 |cRXP_FRIENDLY_蒙提|r 交谈
    .accept 6661 >> 接任务：捕捉矿道老鼠
    .target 蒙提
    .zoneskip Ironforge
step
    #xprate >1.59
    >>|cRXP_WARN_使用|r |T133942:0|t[捕鼠者之笛]，|cRXP_WARN_目标为矿道地铁内的 |cRXP_ENEMY_矿道老鼠|r|r
    .complete 6661,1 --Rats Captured (x5)
    .use 17117
    .mob 矿道老鼠
    .zoneskip Ironforge
step
    #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与矿道地铁内的 |cRXP_FRIENDLY_蒙提|r 交谈
    .turnin 6661 >> 交任务：捕捉矿道老鼠
    .target 蒙提
    .zoneskip Ironforge
step
    #completewith next
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    >>|cRXP_WARN_如果需要，利用等地铁的时间提升|r |T135966:0|t[急救] |cRXP_WARN_|r << Rogue/Warrior/Paladin
    .zone Ironforge >>乘坐地铁前往铁炉堡
step
    .zone Ironforge >>进入铁炉堡
    .isQuestAvailable 314
step << Paladin/Warrior
    #season 2
    #optional
    #completewith next
    .goto Ironforge,71.54,73.46,10,0
    .goto Ironforge,72.53,76.94,10 >>朝旅店内的|cRXP_FRIENDLY_布鲁克·麦须|r走去
    .train 425621,1 << Paladin
    .train 425447,1 << Warrior
step << Paladin/Warrior
    #season 2
    .goto Ironforge,72.53,76.94
    .gossipoption 110791 >>与屋内的 |cRXP_FRIENDLY_布鲁克·麦须|r 交谈
    .target 布鲁克·麦须
    .skipgossip 5570,1,1
    .train 425621,1 << Paladin
    .train 425447,1 << Warrior
--XX 110793 "How's business?"
--XX 110791 "Sounds like you need someone to bounce him for you."
step << Paladin/Warrior
    #season 2
    .goto Ironforge,72.40,73.63
    .gossipoption 109084 >>与 |cRXP_FRIENDLY_布鲁阿特|r 交谈，开始战斗
    >>击败|cRXP_ENEMY_布鲁阿特|r
    >>|cRXP_WARN_小心，他会施放|r |T132939:0|t[反手一击] |cRXP_WARN_（使你昏迷 2 秒）|r
    >>|cRXP_WARN_记得提前施放|r |T135924:0|t[十字军圣印]，|cRXP_WARN_用来对付他|r << Paladin
    >>|cRXP_WARN_不要误将|r |T135906:0|t[力量祝福] |cRXP_WARN_施放给他|r << Paladin
    >>|cRXP_WARN_将他风筝到楼上的阳台，再跳到旅店外并施放|r |T135920:0|t[圣光术]|cRXP_WARN_（如有需要）|r << Paladin
    >>|cRXP_WARN_将他风筝到楼上的阳台，再跳到旅店外并使用|r |T133688:0|t[绷带]|cRXP_WARN_（如有绷带且需要）|r << Warrior
    .mob 布鲁阿特
    .skipgossip 209004,1
    .train 425621,1 << Paladin
    .train 425447,1 << Warrior
--XX 109084 "Seems you've had a few too many"
--XX Check if another player can skip the "how's business" dialogue for you (paladin, warrior)
step << Paladin/Warrior
    #season 2
    #optional
    .goto Ironforge,72.40,73.63,-1
    .goto Ironforge,72.53,76.94,-1
    >>击败|cRXP_ENEMY_布鲁阿特|r
    >>|cRXP_WARN_小心，他会施放|r |T132939:0|t[反手一击] |cRXP_WARN_（使你昏迷 2 秒）|r
    >>|cRXP_WARN_记得提前施放|r |T135924:0|t[十字军圣印]，|cRXP_WARN_用来对付他|r << Paladin
    >>|cRXP_WARN_不要误将|r |T135906:0|t[力量祝福] |cRXP_WARN_施放给他|r << Paladin
    >>|cRXP_WARN_将他风筝到楼上的阳台，再跳到旅店外并施放|r |T135920:0|t[圣光术]|cRXP_WARN_（如有需要）|r << Paladin
    >>|cRXP_WARN_将他风筝到楼上的阳台，再跳到旅店外并使用|r |T133688:0|t[绷带]|cRXP_WARN_（如有绷带且需要）|r << Warrior
    >>|cRXP_WARN_击败|cRXP_ENEMY_布鲁阿特|r后：|r
    >>再次与|cRXP_FRIENDLY_布鲁克·麦须|r交谈，领取|T134419:0|t[责难符文] << Paladin
    >>|cRXP_WARN_如果他不给你|r |T134419:0|t[责难符文]|cRXP_WARN_，你可能需要再次与|cRXP_ENEMY_布鲁阿特|r战斗|r << Paladin
    >>再次与|cRXP_FRIENDLY_布鲁克·麦须|r交谈，领取|T134419:0|t[狂乱攻击符文] << Warrior
    >>|cRXP_WARN_如果他不给你|r |T134419:0|t[狂乱攻击符文]，|cRXP_WARN_可能需要再次与 |cRXP_ENEMY_布鲁阿特|r 战斗|r << Warrior
    >>|cRXP_WARN_注意：单人完成较难，可以找人帮忙，或等指南稍后再次提示时再做|r << Warrior
    .collect 205683,1 << Paladin --Rune of Rebuke (1)
    .collect 204716,1 << Warrior --Rune of Frenzied Assault (1)
    .target 布鲁克·麦须
    .skipgossip 5570,2,1
    .skipgossip 209004,1
    .train 425621,1 << Paladin
    .train 425447,1 << Warrior
--XX 109539 "I've taken care of Stuart. He shouldn't be a problem anymore."
step << Paladin
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[责难符文]|cRXP_WARN_以学习|r |T134596:0|t[铭刻裤子-责难]
    .use 205683
    .itemcount 205683,1 --Rune of Rebuke (1)
    .train 425621,1
step << Paladin
    #season 2
    #completewith Dirt
    .engrave 7 >>|cRXP_WARN_为|r |T134596:0|t|cRXP_LOOT_[裤子]|r|cRXP_WARN_铭刻|r |T134596:0|t[铭刻裤子-责难]
    >>|cRXP_WARN_记得把|r |T134919:0|t[责难] |cRXP_WARN_放到动作栏上|r
    .train 425621,3
step << Warrior
    #season 2
    .train 425447 >>|cRXP_WARN_使用|r |T134419:0|t[狂乱攻击符文]|cRXP_WARN_以学习|r |T134596:0|t[铭刻裤子-狂乱攻击]
    .use 204716
    .itemcount 204716,1 --Rune of Frenzied Assault (1)
step << Warrior
    #season 2
    #completewith Dirt
    .engrave 7 >>|cRXP_WARN_为|r |T134596:0|t|cRXP_LOOT_[裤子]|r|cRXP_WARN_铭刻|r |T134596:0|t[铭刻裤子-狂乱攻击]
    .train 425447,3
step << Warrior
    #optional
    #completewith next
    .goto 1455,67.400,84.909,15,0
    .goto Ironforge,65.905,88.405,12 >> 前往 |cRXP_FRIENDLY_比尔班·飞钳|r 身边
step << Warrior
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比尔班·飞钳|r 交谈
    >>|cRXP_WARN_确保留出 20 银 70 铜备用|r
    .train 2687 >> 学习职业技能
    .target 比尔班·飞钳
    .xp <10,1
    .xp >12,1
step << Warrior
    #xprate >1.59
    #optional
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比尔班·飞钳|r 交谈
    >>|cRXP_WARN_确保留出 20 银 70 铜备用|r
    .train 5242 >> 学习职业技能
    .target 比尔班·飞钳
    .xp <12,1
step << Warrior
    #optional
    #completewith next
    .goto 1455,61.552,85.636,10,0
    .goto 1455,61.356,88.398,6 >> 进入密林武器店
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比克斯|r 和 |cRXP_FRIENDLY_布里维夫·石手|r 交谈
    .train 2567 >> 学习投掷武器
    .goto Ironforge,62.237,89.628
    .target +比克斯
    .train 199 >> 学习双手锤（2h）
    .goto Ironforge,61.177,89.508
    .target +布里维夫·石手
step << Warrior
    #xprate <1.5
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与 |cRXP_FRIENDLY_布雷文·寒钢|r 交谈
    >>|cRXP_BUY_向她购买|r |T135425:0|t[锋利的飞刀]|cRXP_BUY_|r
    .collect 3107,200 --Collect Keen Throwing Knife (200)
    .target 布雷文·寒钢
    .xp <10+7405,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
--XX 420 6281, 110 1097, 900 6661, 85 IF, 65 Gate IF, 65 refuge, 65 Amberstill
--XX (WARR ONLY): 90 1638, 90 1639, 210 1640, 420 1665
step << Warrior
    #xprate <1.5
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与 |cRXP_FRIENDLY_布雷文·寒钢|r 交谈
    >>|cRXP_BUY_向她购买|r |T135641:0|t[平衡飞刀]|cRXP_BUY_|r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target 布雷文·寒钢
    .xp >10+7405,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #xprate >1.49
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与 |cRXP_FRIENDLY_布雷文·寒钢|r 交谈
    >>|cRXP_BUY_向她购买|r |T135425:0|t[锋利的飞刀]|cRXP_BUY_|r
    .collect 3107,200 --Collect Keen Throwing Knife (200)
    .target 布雷文·寒钢
    .xp <10+7310,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
--XX 420 6281, 110 1097, 900 6661, 85 IF, 65 Gate IF, 65 refuge, 65 Amberstill
step << Warrior
    #xprate >1.49
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与 |cRXP_FRIENDLY_布雷文·寒钢|r 交谈
    >>|cRXP_BUY_向她购买|r |T135641:0|t[平衡飞刀]|cRXP_BUY_|r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target 布雷文·寒钢
    .xp >10+7310,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #optional
    #completewith Rudra
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Warrior
    #optional
    #completewith Rudra
    +|cRXP_WARN_装备|r |T135641:0|t[平衡飞刀]
    .use 2946
    .itemcount 2946,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #optional
    #completewith next
    .goto 1455,61.356,88.398,6 >> 离开密林武器店
step
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 交谈
    .fp Ironforge >> 开通铁炉堡飞行点
    .target 格莱斯·瑟登
step
    #xprate >1.49
    #optional
    #completewith IFHS
    .goto 1455,43.883,59.467,15,0
    .goto 1455,38.497,71.135,15,0
    .goto 1455,25.658,61.707,20,0
    .goto 1455,20.419,53.269,10 >> 进入石火旅店
    .train 122,3 << Mage
    .train 633,3 << Paladin
step << Mage/Paladin
    #xprate >1.49
    #optional
    #completewith MageIFTrain << Mage
    #completewith PaladinIFTrain << Paladin
    .goto Ironforge,49.11,56.02,30,0
    .goto Ironforge,44.08,46.60,20,0
    .goto Ironforge,40.84,44.59,20,0
    .goto Ironforge,35.30,32.76,20,0
    .goto Ironforge,27.17,12.58,20,0 << Paladin
    .goto Ironforge,27.60,11.06,20,0 << Mage
    .goto Ironforge,27.17,8.58,12 >>前去找|cRXP_FRIENDLY_丁克|r << Mage
    .goto Ironforge,23.131,6.143,12 >>前往 |cRXP_FRIENDLY_布兰度尔·铁锤|r 身边 << Paladin
step << Mage
    #xprate >1.49
    .goto Ironforge,27.17,8.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_丁克|r 交谈
    .train 122 >> 学习职业技能
    .target 丁克
    .xp <10,1
    .xp >12,1
step << Mage
    #xprate >1.49
    .goto Ironforge,27.17,8.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_丁克|r 交谈
    .train 145 >> 学习职业技能
    .target 丁克
    .xp <12,1
    .xp >14,1
step << Mage
    #xprate >1.49
    #label MageIFTrain
    .goto Ironforge,27.17,8.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_丁克|r 交谈
    .train 1460 >> 学习职业技能
    .target 丁克
    .xp <14,1
step << Paladin
    #xprate >1.49
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_布兰度尔·铁锤|r 交谈
    .train 633 >> 学习职业技能
    .target 布兰度尔·铁锤
    .xp <10,1
    .xp >12,1
step << Paladin
    #xprate >1.49
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布兰度尔·铁锤|r 交谈
    .train 19834 >> 学习职业技能
    .target 布兰度尔·铁锤
    .xp <12,1
    .xp >14,1
step << Paladin
    #xprate >1.49
    #optional
    #label PaladinIFTrain
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布兰度尔·铁锤|r 交谈
    .train 647 >> 学习职业技能
    .target 布兰度尔·铁锤
    .xp <14,1
--XX Alternative paladin train if they didn't get 10 in Goldshire
step
    #xprate >1.49
    #label IFHS
    .goto 1455,20.419,53.269,10,0 << Mage/Paladin
    .goto Ironforge,18.14,51.45
    >>与屋内的 |cRXP_FRIENDLY_旅店老板洛雷·火酒|r 交谈
    .home >> 将炉石绑定在铁炉堡
    .target 旅店老板洛雷·火酒
step << skip --logout skip
    #ssf
    #xprate >1.49
    .goto Ironforge,19.11,52.80
    .zone Dun Morogh >>|cRXP_WARN_跳到桌上的蜡烛顶端，然后登出并重新登录，进行登出跳跃|r
    .isQuestAvailable 314
step << skip --logout skip
    #xprate <1.5
    #ssf
    #optional
    #completewith next
    .goto 1455,48.773,55.875,20,0
    .goto 1455,48.257,55.177,20,0
    .goto 1455,46.648,50.482,20,0
    .goto 1455,44.781,49.811,20,0
    .goto 1455,38.628,56.436,20 >>进入至高王座
    .zoneskip Dun Morogh
    .isQuestAvailable 314
    .train 122,3 << Mage
    .train 633,3 << Paladin
step << skip --logout skip
    #xprate <1.5
    #ssf
    #optional
    .goto 1455,38.628,56.436
    .zone Dun Morogh >>|cRXP_WARN_跳到王座任意一侧的肩部位置，然后登出并重新登录，进行登出跳跃|r
    .isQuestAvailable 314
    .train 122,3 << Mage
    .train 633,3 << Paladin
step << Mage/Paladin
    #xprate <1.5
    #optional
    #completewith next
    .goto Ironforge,49.11,56.02,30,0
    .goto Ironforge,44.08,46.60,20,0
    .goto Ironforge,40.84,44.59,20,0
    .goto Ironforge,35.30,32.76,20,0
    .goto Ironforge,27.17,12.58,20,0 << Paladin
    .goto Ironforge,27.60,11.06,20,0 << Mage
    .goto Ironforge,27.17,8.58,12 >>前去找|cRXP_FRIENDLY_丁克|r << Mage
    .goto Ironforge,23.131,6.143,12 >>前往 |cRXP_FRIENDLY_布兰度尔·铁锤|r 身边 << Paladin
step << Mage
    #xprate <1.5
    .goto Ironforge,27.17,8.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_丁克|r 交谈
    .train 122 >> 学习职业技能
    .target 丁克
--XX Alternative mage train if they didn't get 10 in Goldshire
step << Paladin
    #xprate <1.5
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的 |cRXP_FRIENDLY_布兰度尔·铁锤|r 交谈
    .train 633 >> 学习职业技能
    .target 布兰度尔·铁锤
--XX Alternative paladin train if they didn't get 10 in Goldshire
step << skip --logout skip << Mage/Paladin
    #xprate <1.5
    #ssf
    #optional
    .goto 1455,25.238,10.965,-1
    .goto 1455,24.300,8.708,-1
    .zone Dun Morogh >>|cRXP_WARN_跳到 |cRXP_FRIENDLY_托德雷·铁矿|r 或 |cRXP_FRIENDLY_布莱纳·火崖|r 上方的任意柱子顶端，调整位置直到角色看似悬空，再登出并重新登录，进行登出跳跃|r
    .isQuestAvailable 314
    .train 122,3 << Mage
    .train 633,3 << Paladin
step
    #ah
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁炉堡拍卖师|r交谈
    >>|cRXP_BUY_购买|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_BUY_和/或|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r，|cRXP_BUY_用于提升|r |T133971:0|t[烹饪] |cRXP_BUY_技能，稍后会用到|r
    >>|cRXP_WARN_需要达到 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，稍后夜色镇的任务会用到|r
    >>|cRXP_WARN_如果不想购买或无法购买，就跳过此步骤|r
    >>|cRXP_BUY_购买以下物品，以便稍后在洛克莫丹快速交任务并提升|r |T133971:0|t[烹饪]|cRXP_BUY_技能：|r
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    >>|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (1-50)
    .disablecheckbox
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (1-50)
    .disablecheckbox
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
    .zoneskip Dun Morogh
    .isQuestAvailable 418
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #ah
    #optional
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁炉堡拍卖师|r交谈
    >>|cRXP_WARN_如果不想购买或无法购买，就跳过此步骤|r
    >>|cRXP_BUY_购买以下物品，以便稍后在洛克莫丹快速交任务：|r
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
    .zoneskip Dun Morogh
    .isQuestAvailable 418
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
step << skip --logout skip
    #ah
    #optional
    .goto 1455,33.220,64.649
    .zone Dun Morogh >>|cRXP_WARN_跳到 |cRXP_PICK_邮箱|r 的最顶端，然后登出并重新登录，进行登出跳跃|r
    .isQuestAvailable 314
step
    .goto 1426,53.47,35.02
    >>离开铁炉堡
    .zone Dun Morogh >> 前往丹莫罗
--logout skip - remove if logout skips re-added
step
    #optional
    #label BoarMeatDunMorogh1
    #completewith Dirt
    .goto 1426,57.936,50.787,0
    >>击杀|cRXP_ENEMY_老峭壁野猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_这些肉之后可用于提升|r |T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_你之后在奥伯丁有个任务需要|r |T133971:0|t[烹饪]|cRXP_WARN_达到10点|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 老峭壁野猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires BoarMeatDunMorogh1
    #completewith Dirt
    .goto 1426,57.936,50.787,0
    >>击杀|cRXP_ENEMY_老峭壁野猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_这些肉之后可用于提升|r |T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_你之后在夜色镇有个任务需要|r |T133971:0|t[烹饪]|cRXP_WARN_达到50点|r
    >>|cRXP_WARN_现在不必专程刷取，只需击杀并拾取沿途的野猪|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 老峭壁野猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #optional
    #label Dirt
    #completewith Rudra
    .goto Dun Morogh,59.84,49.56,40,0
    .goto Dun Morogh,61.36,47.07,40 >>沿土路上行
    .isQuestAvailable 314
step
    #completewith VagashEnd
    #requires Dirt
    .goto 1426,62.778,54.591,0
    .goto 1426,62.538,46.195,0
    +|cRXP_WARN_将 |cRXP_ENEMY_瓦加什|r 风筝下山，引到|r |cRXP_FRIENDLY_鲁德拉|r 身边
    .link https://youtu.be/Zg4FNWw-P5k?t=3815 >>|cRXP_WARN_如果操作困难，点击此处查看视频|r << Mage
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >> |cRXP_WARN_点击这里查看视频参考|r << !Mage
    .mob 瓦加什
step << Warrior/Rogue
    #optional
    #requires Dirt
    #completewith VagashEnd
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step
    #label Rudra
    .goto Dun Morogh,63.082,49.851
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁德拉·冻石|r 交谈
    .accept 314 >> 接任务：保护牲畜
    .target 鲁德拉·冻石
step
    #label VagashEnd
    .goto 1426,62.778,54.591,0
    .goto 1426,62.094,47.154,40,0
    .goto 1426,62.434,48.989,40,0
    .goto 1426,62.538,46.195
    >>击杀 |cRXP_ENEMY_瓦加什|r，拾取他的 |cRXP_LOOT_牙|r
    >>|cRXP_WARN_将他风筝到牧场南侧的卫兵处，确保自己造成至少 51% 的伤害|r
    >>|cRXP_WARN_尝试击杀 |cRXP_ENEMY_瓦加什|r 前请先观看下方视频。所有职业都能单独完成|r
    .link https://youtu.be/Zg4FNWw-P5k?t=3815 >> |cRXP_WARN_点击这里查看视频参考|r << Mage
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >> |cRXP_WARN_点击这里查看视频参考|r << !Mage
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob 瓦加什
step
    .goto Dun Morogh,63.082,49.851
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁德拉·冻石|r 交谈
    .turnin 314 >> 交任务：保护牲畜
    .target 鲁德拉·冻石
step
    #optional
    #label BoarMeatDunMorogh2
    #completewith QuarryStart
    .goto 1426,66.356,51.02,0
    >>击杀|cRXP_ENEMY_大峭壁野猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 大峭壁野猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 134 --Gol'Bolar Quarry
step
    #optional
    #requires BoarMeatDunMorogh2
    #completewith QuarryStart
    .goto 1426,66.356,51.02,0
    >>击杀|cRXP_ENEMY_大峭壁野猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_现在不必专程刷取，只需击杀并拾取沿途的野猪|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 大峭壁野猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 134 --Gol'Bolar Quarry
step
    .goto Dun Morogh,68.379,54.492
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师格瑞姆|r 交谈
    .train 2550 >> 学习 |T133971:0|t[烹饪]
    .target 厨师格瑞姆
step << !Human
    .goto Dun Morogh,68.614,54.643
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡杉·莫格什|r 交谈
    .vendor >> |cRXP_BUY_购买|r |T133968:0|t[新鲜出炉的面包] |cRXP_BUY_（按需）|r << Warrior/Rogue
    .vendor >> |cRXP_BUY_购买|r |T133968:0|t[新鲜出炉的面包] |cRXP_BUY_和|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_（按需）|r << !Warrior !Rogue
    .target 卡杉·莫格什
    .xp >15,1
step << Rogue
    #completewith QuarryEnd
    #label RogueWep
    .goto 1426,68.866,55.958,8,0
    .goto 1426,69.002,55.896
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗拉斯特·多克南|r 交谈
    >>|cRXP_WARN_购买一把|r |T135321:0|t[步兵剑]，|cRXP_WARN_由他出售|r
    .collect 2488,1 --Collect Gladius (1)
    .target 弗拉斯特·多克南
    .money <0.0482
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.4
--XX Shows if you didn't get a cutlass or better wep earlier
step << Rogue
    #optional
    #completewith QuarryEnd
    #requires RogueWep
    #label Gladius
    .equip 16,2488 >> |cRXP_WARN_装备|r |T135321:0|t[步兵剑]，|cRXP_WARN_放在主手栏位|r
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.4
step << Rogue
    #optional
    #completewith QuarryEnd
    #requires Gladius
    .equip 17,2494 >> |cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]，|cRXP_WARN_放在副手栏位|r
    .use 2494
    .itemcount 2494,1
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step
    #xprate <1.5
    #label QuarryStart
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_参议员梅尔·圣石|r和|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 433 >> 接任务：公众之仆
    .goto Dun Morogh,68.671,55.969
    .target +参议员梅尔·圣石
    .accept 432 >> 接任务：该死的石腭怪！
    .goto Dun Morogh,69.084,56.330
    .target +工头乔尼·石眉
step
    #xprate >1.49
    #label QuarryStart
    .goto Dun Morogh,69.084,56.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头乔尼·石眉|r 交谈
    .accept 432 >> 接任务：该死的石腭怪！
    .target 工头乔尼·石眉
    .xp >14,1
step << Warrior/Paladin/Rogue
    .goto Dun Morogh,69.324,55.456
    #requires RogueWep << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹克·利刃|r 交谈
    .train 2575 >>学习 |T134708:0|t[采矿]
    >>|cRXP_WARN_采矿通常与|r |T136241:0|t[锻造]|cRXP_WARN_搭配；锻造可制作|r |T135248:0|t[劣质磨刀石]|cRXP_WARN_和|r |T135255:0|t[劣质平衡石]|cRXP_WARN_来提高武器伤害|r
    >>|cRXP_WARN_如果不想学习，就跳过此步骤|r
    .target 丹克·利刃
    .train 2018,3 --Blacksmithing
step << Warrior/Paladin/Rogue
    #optional
    #completewith QuarryEnd
    .cast 2580 >> |cRXP_WARN_施放|r |T136025:0|t[寻找矿物]
    .usespell 2580
    .train 2575,3 --Mining Trained
step
    #xprate <1.5
    .goto Dun Morogh,70.7,56.4,40,0
    .goto Dun Morogh,70.62,52.39,25,0
    .goto Dun Morogh,70.7,56.4
    >>击杀洞穴内的|cRXP_ENEMY_石腭击颅者|r和|cRXP_ENEMY_石腭断骨者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob +石腭击颅者
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
    .mob +石腭断骨者
step
    #xprate >1.49
    .goto Dun Morogh,70.49,58.35,50,0
    .goto Dun Morogh,68.23,59.37,50,0
    .goto Dun Morogh,70.49,58.35
    >>击杀|cRXP_ENEMY_石腭击颅者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob 石腭击颅者
    .isOnQuest 432
step
    #xprate <1.5
    #label QuarryEnd
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头乔尼·石眉|r和|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .turnin 432 >> 交任务：该死的石腭怪！
    .goto Dun Morogh,69.084,56.330
    .target +工头乔尼·石眉
    .turnin 433 >> 交任务：公众之仆
    .goto Dun Morogh,68.671,55.969
    .target +参议员梅尔·圣石
step
    #xprate >1.49
    #label QuarryEnd
    .goto Dun Morogh,69.084,56.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头乔尼·石眉|r 交谈
    .turnin 432 >> 交任务：该死的石腭怪！
    .target 工头乔尼·石眉
    .isQuestComplete 432
step << !Warrior !Rogue !Paladin
    .goto Dun Morogh,68.614,54.643
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡杉·莫格什|r 交谈
    .vendor >> |cRXP_BUY_购买至多 20 瓶|r |T132815:0|t[冰镇牛奶]，|cRXP_BUY_由他出售|r
    .target 卡杉·莫格什
    .xp >15,1
step
    #optional
    #label BoarMeatDunMorogh3
    #completewith Revenge
    .goto 1426,70.845,51.784,0
    .goto 1426,73.533,50.850,0
    .goto 1426,75.353,48.533,0
    .goto 1426,79.881,46.805,0
    .goto 1426,81.040,43.456,0
    .goto 1426,80.583,36.040,0
    >>击杀|cRXP_ENEMY_有伤疤的峭壁野猪|r和|cRXP_ENEMY_老峭壁野猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 有伤疤的峭壁野猪
    .mob 老峭壁野猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires BoarMeatDunMorogh3
    #completewith Revenge
    .goto 1426,70.845,51.784,0
    .goto 1426,73.533,50.850,0
    .goto 1426,75.353,48.533,0
    .goto 1426,79.881,46.805,0
    .goto 1426,81.040,43.456,0
    .goto 1426,80.583,36.040,0
    >>击杀|cRXP_ENEMY_有伤疤的峭壁野猪|r和|cRXP_ENEMY_老峭壁野猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_现在不必专程刷取，只需击杀并拾取沿途的野猪|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 有伤疤的峭壁野猪
    .mob 老峭壁野猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    .goto Dun Morogh,81.2,42.7,45,0
    .goto Dun Morogh,83.892,39.188
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员塞克·锤足|r 交谈
    .accept 419 >> 接任务：失踪的驾驶员
    .target 驾驶员塞克·锤足
step
    .goto Dun Morogh,79.672,36.171
    >>点击地上的 |cRXP_PICK_矮人尸体|r
    .turnin 419 >> 交任务：失踪的驾驶员
    .accept 417 >> 接任务：驾驶员的复仇
step << Mage
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_癞爪|r，拾取|T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI|r]
    .collect 203753,1 -- Spell Notes: RING SEFF OSTROF (1)
    .train 401765,1
step
    .goto Dun Morogh,78.97,37.14
    >>击杀|cRXP_ENEMY_癞爪|r，拾取掉落的|cRXP_LOOT_肮脏的爪子|r
    .complete 417,1 --Collect Mangy Claw (x1)
    .mob 癞爪
step << Mage
    #season 2
    #completewith enterloch
    .collect 211779,1 >>需要一枚 |T135933:0|t[理解魔符]，可向 |cRXP_FRIENDLY_施法材料商|r 购买，用于解译 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI|r]
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI|r] |cRXP_WARN_学习|r |T236227:0|t[寒冰指]
    .use 203753
step
    #label Revenge
    .goto Dun Morogh,83.892,39.188
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员塞克·锤足|r 交谈
    .turnin 417,1 >> 交任务：驾驶员的复仇 << Rogue
    .turnin 417 >> 交任务：驾驶员的复仇 << !Rogue
    .target 驾驶员塞克·锤足
step << Rogue
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135641:0|t[工匠匕首]，|cRXP_WARN_放在副手栏位|r
    .use 2218
    .itemcount 2218,1
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step
    #label enterloch
    .goto Dun Morogh,84.4,31.1,25 >>穿过隧道去洛克莫丹
    .zoneskip Loch Modan
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
#tbc
#season 0,1
#version 1
<< Alliance
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 11-13 Loch Modan
#next 13-15 Westfall; 14-16 Darkshore
#defaultfor Human
#displayname 13-15 洛克莫丹 << SoD
#displayname 11-13 洛克莫丹
step
    #optional
    #completewith next
    .goto Loch Modan,24.134,18.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高索·布鲁姆|r交谈
    .vendor >>出售杂物并修理装备
    .target 高索·布鲁姆
step
    .goto Loch Modan,24.764,18.397
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    >>|cRXP_WARN_暂时不要接取“卡尔·雷矛的订单”任务|r
    .turnin 353 >> 交任务: 雷矛的包裹
    .accept 307 >> 接任务: 肮脏的爪子
    .target 巡山人卡尔·雷矛
step
    #optional
    #label BoarMeatLoch1
    #completewith ThelsamarFirst
    .goto Loch Modan,38.18,34.24,0
    .goto Loch Modan,29.91,36.48,0
    .goto Loch Modan,28.62,23.23,0
    >>击杀|cRXP_ENEMY_山猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_这些材料稍后用于提升|r |T133971:0|t[烹饪] |cRXP_WARN_技能|r
    >>|cRXP_WARN_你需要10点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，才能完成之后奥伯丁的一个任务|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 山猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 144 --Thelsamar
step
    #optional
    #requires BoarMeatLoch1
    #completewith ThelsamarFirst
    .goto Loch Modan,38.18,34.24,0
    .goto Loch Modan,29.91,36.48,0
    .goto Loch Modan,28.62,23.23,0
    >>击杀|cRXP_ENEMY_山猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_这些材料稍后用于提升|r |T133971:0|t[烹饪] |cRXP_WARN_技能|r
    >>|cRXP_WARN_你需要50点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，才能完成之后夜色镇的一个任务|r
    >>|cRXP_WARN_现在不用特意收集，沿途击杀并拾取遇到的野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 山猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 144
step
    #optional
    #completewith ThelsamarFirst
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|T134027:0|t|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取|T134342:0|t|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|T134437:0|t|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
    .subzoneskip 144
step
    #optional
    #completewith next
    #label Thelsamar
    .subzone 144 >> 前往塞尔萨玛
step
    #requires Thelsamar
    #completewith next
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_沿着塞尔萨玛的道路巡逻|r
    .accept 416 >> 接任务：狗头人的耳朵
    .accept 1339 >> 接任务：巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔
step
    #label ThelsamarFirst
    .goto Loch Modan,34.828,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .accept 418 >> 接任务: 塞尔萨玛血肠
    .target 维德拉·壁炉
step
    #optional
    .goto Loch Modan,34.828,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .turnin 418 >> 交任务: 塞尔萨玛血肠
    .target 维德拉·壁炉
    .isQuestComplete 418
step
    #optional
    #completewith StormpikeO
    .abandon 1338 >> 放弃“卡尔·雷矛的订单”，以解锁“巡山人卡尔·雷矛的任务”；完成后可获得550点经验值
step
    #completewith next
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尼·铁心|r对话
    .vendor 1682 >> |cRXP_BUY_如有需要，向她购买最多2个|r |T133634:0|t[棕色小包] |cRXP_BUY_|r
    .target 雅尼·铁心
step
    .goto Loch Modan,35.534,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r对话
    .vendor 6734 >> |cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_，尽量备有约20瓶|r << !Warrior !Rogue
    .target 旅店老板纳克罗·壁炉
    .xp >15,1
step
    #label StormpikeO
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_沿着塞尔萨玛的道路巡逻|r
    .accept 416 >> 接任务：狗头人的耳朵
    .accept 1339 >> 接任务：巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔
step
    #optional
    #label BoarMeatLoch2
    #completewith SilverStream
    .goto Loch Modan,38.18,34.24,0
    .goto Loch Modan,29.91,36.48,0
    .goto Loch Modan,28.62,23.23,0
    >>击杀|cRXP_ENEMY_山猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 山猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 146 --Stonewrought Dam
    .subzoneskip 149 --Silver Stream Mine
step
    #optional
    #requires BoarMeatLoch2
    #completewith SilverStream
    .goto Loch Modan,38.18,34.24,0
    .goto Loch Modan,29.91,36.48,0
    .goto Loch Modan,28.62,23.23,0
    >>击杀|cRXP_ENEMY_山猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_现在不用特意收集，沿途击杀并拾取遇到的野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 山猪
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 146 --Stonewrought Dam
    .subzoneskip 149 --Silver Stream Mine
step
    #optional
    #completewith SilverStream
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|T134027:0|t|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取|T134342:0|t|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|T134437:0|t|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
    .subzoneskip 146 --Stonewrought Dam
    .subzoneskip 149 --Silver Stream Mine
step
    #xprate <1.59
    #completewith MinerGear
    >>击杀|cRXP_ENEMY_坑道鼠|r，拾取|T133854:0|t|cRXP_LOOT_坑道鼠的耳朵|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob 坑道鼠斥候
    .mob 坑道鼠歹徒
    .mob 坑道鼠征粮官
    .mob 坑道鼠地卜师
    .mob 坑道鼠掘地工
    .mob 坑道鼠勘探员
step
    #optional
    #label SilverStream
    #completewith MinerGear
    .goto Loch Modan,35.50,18.97,20 >> 前往银溪矿场，沿途击杀|cRXP_ENEMY_狗头人|r并收集|T133854:0|t|cRXP_LOOT_[耳朵]|r
step
    #xprate >1.59
    #completewith BuyMace << Paladin/Warrior
    #completewith MinerGear << !Paladin !Warrior
    >>击杀|cRXP_ENEMY_坑道鼠|r，拾取|T133854:0|t|cRXP_LOOT_坑道鼠的耳朵|r
    >>|cRXP_WARN_不用特意花时间做这项任务；你之后很可能会跳过它|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob 坑道鼠斥候
    .mob 坑道鼠歹徒
    .mob 坑道鼠征粮官
    .mob 坑道鼠地卜师
    .mob 坑道鼠掘地工
    .mob 坑道鼠勘探员
step
    #requires SilverStream
    #label MinerGear
    .goto Loch Modan,35.93,22.55
    >>打开|cRXP_PICK_矿工联盟的储物箱|r，拾取|cRXP_LOOT_矿工装备|r
    >>|cRXP_WARN_矿洞各处都有|cRXP_PICK_矿工联盟的储物箱|r|r
    >>|cRXP_WARN_如果想暂时跳过，可以等级更高时再来完成这个任务|r
    .complete 307,1 -- Miners' Gear (4)
step << Paladin/Warrior
    #label BuyMace
    .goto Loch Modan,42.867,9.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔伦·安德玛|r交谈
    >>|cRXP_BUY_购买|r |T133476:0|t[重型尖刺钉锤] |cRXP_BUY_或|r |T133053:0|t[铁木槌] |cRXP_BUY_，向他购买（如果有货）|r
    >>|cRXP_WARN_如果买不起，就击杀附近的 |cRXP_ENEMY_坑道鼠|r 攒钱，直到足够购买|r
    >>|cRXP_WARN_尽快购买，其他玩家可能抢先买走|r
    >>|cRXP_WARN_如果不想购买，就跳过这一步|r
    .collect 4778,1,307,1 --Heavy Spiked Mace (1)
    .collect 4777,1,307,1 --Ironwood Maul (1)
    .target 尼尔伦·安德玛
    .itemcount 4778,<1 --Heavy Spiked Mace (<1)
    .itemcount 4777,<1 --Ironwood Maul (<1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Paladin/Warrior
    #optional
    #completewith StormpikeDelivery
    +|cRXP_WARN_装备|r |T133476:0|t[重型尖刺钉锤]
    .use 4778
    .itemcount 4778,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp <14,1
step << Paladin/Warrior
    #optional
    #completewith StormpikeDelivery
    +|cRXP_WARN_装备|r |T133053:0|t[铁木槌]
    .use 4777
    .itemcount 4777,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7
    .xp <13,1
step
    #xprate <1.59
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82,50,0
    .goto Loch Modan,25.05,30.19,50,0
    .goto Loch Modan,26.06,43.44,50,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82
    >>击杀|cRXP_ENEMY_坑道鼠|r，拾取|T133854:0|t|cRXP_LOOT_坑道鼠的耳朵|r
    >>|cRXP_WARN_确保留有10块|r |T132889:0|t[亚麻布] |cRXP_WARN_，稍后的圣骑士职业任务会用到|r << Paladin
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .collect 2589,10,1644,1,1 << Human Paladin -- Linen Cloth (10)
    .mob 坑道鼠斥候
    .mob 坑道鼠歹徒
    .mob 坑道鼠征粮官
    .mob 坑道鼠地卜师
    .mob 坑道鼠掘地工
    .mob 坑道鼠勘探员
step
    #xprate >1.59
    #loop
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82,50,0
    .goto Loch Modan,25.05,30.19,50,0
    .goto Loch Modan,26.06,43.44,50,0
    >>击杀|cRXP_ENEMY_坑道鼠|r，拾取|T133854:0|t|cRXP_LOOT_坑道鼠的耳朵|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob 坑道鼠斥候
    .mob 坑道鼠歹徒
    .mob 坑道鼠征粮官
    .mob 坑道鼠地卜师
    .mob 坑道鼠掘地工
    .mob 坑道鼠勘探员
    .itemcount 3110,6 --Tunnel Rat Ear
step
    #optional
    #label BoarMeatLoch3
    #completewith ThelsamarTwo
    .goto Loch Modan,38.18,34.24,0
    .goto Loch Modan,29.91,36.48,0
    .goto Loch Modan,28.62,23.23,0
    >>击杀|cRXP_ENEMY_山猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob 山猪
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 144 --Thelsamar
    .subzoneskip 925 --Algaz Station
step
    #optional
    #requires BoarMeatLoch3
    #completewith ThelsamarTwo
    .goto Loch Modan,38.18,34.24,0
    .goto Loch Modan,29.91,36.48,0
    .goto Loch Modan,28.62,23.23,0
    >>击杀|cRXP_ENEMY_山猪|r，拾取掉落的|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|cRXP_WARN_现在不用特意收集，沿途击杀并拾取遇到的野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob 山猪
    .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 144 --Thelsamar
    .subzoneskip 925 --Algaz Station
step
    #sticky
    #label CookingQEnd
    #loop
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|T134027:0|t|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取|T134342:0|t|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|T134437:0|t|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .goto Loch Modan,26.9,10.7,0
    .goto Loch Modan,28.6,15.4,0
    .goto Loch Modan,39.4,33.3,0
    .waypoint Loch Modan,26.9,10.7,90,0
    .waypoint Loch Modan,30.9,10.6,90,0
    .waypoint Loch Modan,28.6,15.4,90,0
    .waypoint Loch Modan,30.5,26.6,90,0
    .waypoint Loch Modan,33.4,30.3,90,0
    .waypoint Loch Modan,39.4,33.3,90,0
    .mob +老黑熊
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .goto Loch Modan,38.0,34.9,0
    .goto Loch Modan,29.8,35.9,0
    .goto Loch Modan,28.6,22.6,0
    .waypoint Loch Modan,38.0,34.9,90,0
    .waypoint Loch Modan,37.1,39.8,90,0
    .waypoint Loch Modan,29.8,35.9,90,0
    .waypoint Loch Modan,27.7,25.3,90,0
    .waypoint Loch Modan,28.6,22.6,90,0
    .mob +山猪
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .goto Loch Modan,31.9,16.4,0
    .goto Loch Modan,33.8,40.5,0
    .goto Loch Modan,39.0,32.1,0
    .waypoint Loch Modan,31.9,16.4,90,0
    .waypoint Loch Modan,28.0,20.6,90,0
    .waypoint Loch Modan,33.8,40.5,90,0
    .waypoint Loch Modan,36.2,30.9,90,0
    .waypoint Loch Modan,39.0,32.1,90,0
    .mob +森林潜伏者
step
    #completewith StormpikeDelivery
    #label StormpikeStop
    .goto Loch Modan,24.134,18.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高索·布鲁姆|r交谈
    .vendor >>|cRXP_WARN_如有需要，出售杂物并修理装备|r
    .target 高索·布鲁姆
step << Human
    #xprate <1.59
    #label StormpikeDelivery
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 307 >> 交任务: 肮脏的爪子
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务
    .accept 1338 >> 接任务：卡尔·雷矛的订单
    .target 巡山人卡尔·雷矛
    .dungeon !DM
step << Human
    #xprate >1.59
    #label StormpikeDelivery
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 307 >> 交任务: 肮脏的爪子
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务
    .accept 1338 >> 接任务：卡尔·雷矛的订单 << Mage/Warlock/Rogue
    .target 巡山人卡尔·雷矛
    .dungeon !DM
step
    #label ThelsamarTwo
    .subzone 144 >> 前往塞尔萨玛
step
    #requires CookingQEnd
    #xprate <1.59
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_沿着塞尔萨玛的道路巡逻|r
    .target 巡山人卡德雷尔
    .turnin 416 >> 交任务：狗头人的耳朵
step
    #requires CookingQEnd
    #xprate >1.59
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_沿着塞尔萨玛的道路巡逻|r
    .target 巡山人卡德雷尔
    .turnin 416 >> 交任务：狗头人的耳朵
    .isQuestComplete 416
step
    #xprate >1.59
    #optional
    #sticky
    #label RatAbandon
    .abandon 416 >> 放弃“狗头人的耳朵”任务
step
    #optional
    #completewith FlintTinder
    .goto 1432,35.273,47.750,10,0
    .goto 1432,35.433,48.243,12 >> 进入烈酒旅店
step
    .goto Loch Modan,34.828,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .turnin 418 >> 交任务: 塞尔萨玛血肠
    .target 维德拉·壁炉
step
    #label FlintTinder
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尼·铁心|r交谈
    >>|cRXP_BUY_向她购买一份|r |T135435:0|t[普通木柴] |cRXP_BUY_和一份|r |T135237:0|t[燧石和火绒] |cRXP_BUY_|r
    >>|cRXP_WARN_这些材料用于制作|r |T135805:0|t[基础营火] |cRXP_WARN_，可在乘船或乘坐地铁时提升|r |T133971:0|t[烹饪] |cRXP_WARN_技能，节省时间|r
    >>|cRXP_WARN_你需要50点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，才能完成之后暮色森林的一个任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .target 雅尼·铁心
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的 |cRXP_FRIENDLY_索格拉姆·伯雷森|r 交谈
    .fp Thelsamar >> 获取塞尔萨玛飞行点
    .target 索格拉姆·伯雷森
step
    #optional
    #completewith next
    .goto Loch Modan,24.78,70.17,10,0
    .goto Loch Modan,23.73,75.52,15 >> 沿着土路跑上去, 然后跳进碉堡里
step
    #xprate <1.59
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与碉堡内的 |cRXP_FRIENDLY_拉格弗斯上尉|r 交谈
    .accept 267 >> 接任务: 穴居人的威胁
    .target 拉格弗斯上尉
step
    #xprate <1.59
    #label DefenseStart
    .goto Loch Modan,22.071,73.127
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >> 接受任务：保卫国王的领土
    .target 巡山人库伯弗林特
step
    #xprate >1.59
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与碉堡内的 |cRXP_FRIENDLY_拉格弗斯上尉|r 交谈
    .accept 267 >> 接任务: 穴居人的威胁
    .target 拉格弗斯上尉
    .xp >14,1 << !Warrior
step
    #xprate >1.59
    #label DefenseStart
    .goto Loch Modan,22.071,73.127
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >> 接受任务：保卫国王的领土
    .target 巡山人库伯弗林特
    .xp >14,1 << !Warrior
step << Warrior
    #season 2
    #sticky
    #label Geode
    #loop
    .goto Loch Modan,27.01,48.74,0
    .goto Loch Modan,27.68,56.83,0
    .goto Loch Modan,33.35,71.59,0
    .goto Loch Modan,31.54,74.96,0
    .waypoint Loch Modan,27.01,48.74,50,0
    .waypoint Loch Modan,27.68,56.83,50,0
    .waypoint Loch Modan,33.35,71.59,50,0
    .waypoint Loch Modan,31.54,74.96,50,0
    .waypoint Loch Modan,33.88,76.58,50,0
    >>击杀|cRXP_ENEMY_穴居人|r，拾取|cRXP_LOOT_头骨形晶簇|r
    .collect 208847,1 -- Skull-Shaped Geode (1)
    .mob 碎石怪斥候
    .mob 碎石穴居人
    .train 425443,1
step
    #xprate <1.5
    .goto Loch Modan,27.33,56.70
    >>击杀|cRXP_ENEMY_碎石穴居人|r和|cRXP_ENEMY_碎石怪斥候|r，拾取|cRXP_LOOT_穴居人的石牙|r
    >>|cRXP_WARN_确保留有10块|r |T132889:0|t[亚麻布] |cRXP_WARN_，稍后的圣骑士职业任务会用到|r << Paladin
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .mob +碎石穴居人
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .mob +碎石怪斥候
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob +碎石穴居人
    .mob +碎石怪斥候
    .collect 2589,10,1644,1,1 << Human Paladin -- Linen Cloth (10)
    .mob +碎石穴居人
    .mob +碎石怪斥候
step
    #xprate >1.49
    .goto Loch Modan,27.33,56.70
    >>击杀|cRXP_ENEMY_碎石穴居人|r和|cRXP_ENEMY_碎石怪斥候|r，拾取|cRXP_LOOT_穴居人的石牙|r
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .mob +碎石穴居人
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .mob +碎石怪斥候
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob +碎石穴居人
    .mob +碎石怪斥候
    .isOnQuest 224
    .isOnQuest 267
step << Warlock
    #xprate <1.5
    #optional
    #completewith TroggT
    .goto Loch Modan,27.33,56.70,0
    +击杀|cRXP_ENEMY_穴居人|r，直到你有价值75银79铜的可出售杂物或金币
    .money >0.7579
step << Warlock
    #xprate >1.49
    #optional
    #completewith TroggT
    .goto Loch Modan,27.33,56.70,0
    +击杀|cRXP_ENEMY_穴居人|r，直到你有价值42银39铜的可出售杂物或金币
    .money >0.4239
step << Warlock
    #xprate <1.5
    #optional
    .goto Loch Modan,27.33,56.70
    .xp 13+9600 >>刷怪至当前经验达到9600+/11400
step
    #optional
    #xprate 1.49-1.59
    .goto Loch Modan,27.33,56.70
    .xp 13+8700 >>刷怪至当前经验达到8700+/11400
step
    #optional
    #xprate >1.59
    .goto Loch Modan,27.33,56.70
    .xp 13+7800 >>刷怪至当前经验达到7800+/11400
step << Mage
    #xprate <1.5
    #season 2
    .goto Loch Modan,29.2,81.2,50,0
    .goto Loch Modan,28.8,83.4,50,0
    .goto Loch Modan,30.0,83.8,50,0
    .goto Loch Modan,32.2,87.2,50,0
    .goto Loch Modan,33.8,88.6,50,0
    .goto Loch Modan,36.0,88.0,50,0
    .goto Loch Modan,36.6,81.2,50,0
    .goto Loch Modan,36.6,79.6
    >>击杀|cRXP_ENEMY_碎石怪先知|r，拾取|T134939:0|t[|cRXP_FRIENDLY_嚼过的法术笔记|r]
    .collect 208854,1
    .mob 碎石怪先知
    .train 415936,1
step << Mage
    #xprate <1.5
    #season 2
    #completewith HumbleBeginnings
    .collect 211779,1 >>你需要一枚 |T135933:0|t[理解魔符]，可向 |cRXP_FRIENDLY_施法材料商|r 购买，才能使用 |T134939:0|t[|cRXP_FRIENDLY_嚼过的法术笔记]|r
    .train 415936 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_嚼过的法术笔记|r] |cRXP_WARN_学习|r |T236220:0|t[活动炸弹]
    .use 208854
step << Warrior
    #season 2
    #requires Geode
    .goto Loch Modan,30.47,79.71
    >>击杀一只|cRXP_ENEMY_碎石怪击颅者|r
    >>|cRXP_WARN_战斗中受到击颅者攻击后，|cRXP_LOOT_头骨形晶簇|r会变成|r |T236489:0|t[|cRXP_LOOT_开裂的头骨形晶簇|r]
    .collect 208848,1 -- Cracked Skull-Shaped Geode (1)
    .mob 碎石怪击颅者
    .train 425443,1
step << Warrior
    #season 2
    .use 208848 >>|cRXP_WARN_使用|r |T236489:0|t[|cRXP_LOOT_开裂的头骨形晶簇|r] |cRXP_WARN_获得|r |T134419:0|t[|cRXP_FRIENDLY_迅捷打击符文|r]
    .collect 208778,1 -- Rune of Quick Strike (1)
    .train 425443,1
step << Warrior
    #season 2
    .train 425443 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_迅捷打击符文|r] |cRXP_WARN_学习|r |T132394:0|t[迅捷打击]
    .use 208778
    .itemcount 208778,1
step
    #xprate <1.5
    #optional
    .goto Loch Modan,27.33,56.70
    +继续击杀|cRXP_ENEMY_穴居人|r，直到|T134414:0|t[炉石]的剩余冷却时间<1分钟
    .cooldown item,6948,<60
step
    #optional
    #completewith next
    .goto Loch Modan,24.78,70.17,10,0
    .goto Loch Modan,23.73,75.52,15 >> 沿着土路跑上去, 然后跳进碉堡里
step
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .turnin 267 >> 交任务: 穴居人的威胁
    .target 拉格弗斯上尉
    .isQuestComplete 267
step
    #label TroggT
    .goto Loch Modan,22.071,73.127
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .turnin 224 >> 交任务: 保卫国王的领土
    .target 巡山人库伯弗林特
    .isQuestComplete 224
step
    #xprate >1.49
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .fly Ironforge >>飞往铁炉堡
    .target 索格拉姆·伯雷森
    .zoneskip Ironforge
    .cooldown item,6948,<0
step
    #xprate >1.49
    .hs >> 炉石回铁炉堡
    .zoneskip Ironforge
    .cooldown item,6948,>0,1
step
    #xprate <1.5
    #completewith HumbleBeginnings
    .hs >> 炉石回暴风城
    .zoneskip Stormwind City
--XX Start of <1.5x section
step << Warlock/Priest
    #xprate <1.5
    #ssf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    >>|cRXP_BUY_向她购买一根|r |T135468:0|t[烟尘魔杖] |cRXP_BUY_|r
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    .collect 5208,1 --Smoldering Wand (1)
    .target 阿德温·凯伦
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
step << Warlock/Priest
    #xprate <1.5
    #ah
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    >>|cRXP_BUY_购买一根|r |T135468:0|t[烟尘魔杖] |cRXP_BUY_，向她购买，或去拍卖行寻找一根|r |T135144:0|t[强效魔法杖]
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    .collect 5208,1 --Smoldering Wand (1)
    .target 阿德温·凯伦
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    --not adding .money tag to this step. user could have less silver than vendor wand but cheaper ones may exist on the AH
step << Warlock/Priest
    #xprate <1.5
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135468:0|t[烟尘魔杖]
    .use 5208
    .itemcount 5208,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp <15,1
step << Warlock/Priest
    #xprate <1.5
    #optional
    #completewith next
    +|cRXP_WARN_记得装备|r |T135468:0|t[烟尘魔杖] |cRXP_WARN_（达到15级后）|r
    .use 5208
    .itemcount 5208,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp >15,1
step << Warlock
    #xprate <1.5
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往“已宰的羔羊”旅店并下楼
step << Warlock
    #xprate <1.5
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r对话
    .trainer >> 学习本职业技能
    .target 厄苏拉·德林
step << Warlock
    #xprate <1.5
    .goto StormwindClassic,25.665,77.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯巴克尔|r对话
    .vendor >> |cRXP_BUY_购买|r |T133738:0|t[魔典：吞噬暗影（等级1）] |cRXP_BUY_和|r |T133738:0|t[魔典：牺牲（等级1）] |cRXP_BUY_；如果买不起，可以之后再买|r
    .target 斯巴克尔
step << Mage
    #xprate <1.5
    #optional
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >> 前往法师塔
step << Mage
    #xprate <1.5
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .trainer >> 学习本职业技能
    .target 艾尔莎林
step << Priest/Paladin
    #xprate <1.5
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >> 前往暴风城大教堂
step << Human Paladin
    #xprate <1.5
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .accept 1641 >> 接任务：圣洁之书
    .turnin 1641 >> 交任务：圣洁之书
    .target 达索瑞恩·拉尔
step << Human Paladin
    #xprate <1.5
    .goto StormwindClassic,39.80,29.77
    >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_圣洁之书|r] 开始任务|r
    .accept 1642 >>接受任务圣洁之书
    .use 6775
step << Human Paladin
    #xprate <1.5
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1642 >>交任务圣洁之书
    .accept 1643 >>接受任务圣洁之书
    .target 达索瑞恩·拉尔
step << Paladin
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    .trainer >> 学习本职业技能
    .target 虔诚的亚瑟
step << Paladin
    #xprate <1.5
    #season 2
    .goto StormwindClassic,38.10,28.10
    .gossipoption 109653 >>与|cRXP_FRIENDLY_罗姆鲁斯修士|r交谈
    .target 罗姆鲁斯修士
    .skipgossip
    .train 410015,1
step << Paladin
    #xprate <1.5
    #season 2
    #optional
    #completewith next
    .goto StormwindClassic,37.39,29.76,5,0
    .goto StormwindClassic,37.87,29.10,5,0
    .goto StormwindClassic,36.52,32.67,8,0
    .goto StormwindClassic,36.55,33.45,8,0
    .goto StormwindClassic,35.95,34.05,8,0
    .goto StormwindClassic,35.46,33.03,8,0
    .goto StormwindClassic,35.95,31.54,8,0
    .goto StormwindClassic,34.79,29.31,8,0
    .goto StormwindClassic,33.69,29.69,8,0
    .goto StormwindClassic,32.57,27.49,8,0
    .goto StormwindClassic,33.41,25.61,8,0
    >>下楼进入大教堂地下墓穴的西侧
    .goto StormwindClassic,32.86,24.77,8 >>前往地下墓穴中|cRXP_LOOT_烧焦的笔记|r所在处
    .train 410015,1
step << Paladin
    #xprate <1.5
    #season 2
    .goto StormwindClassic,32.86,24.87
    >>拾取蜡烛旁的|cRXP_LOOT_烧焦的笔记|r
    .collect 205864,1 --Charred Note (1)
    .train 410015,1
step << Priest
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒修士|r交谈
    .goto StormwindClassic,38.54,26.86
    .trainer >> 学习本职业技能
    .target 乔舒修士
step << Warrior
    #xprate <1.5
    #season 2
    .gossipoption 109045 >> 与花园区旅店内的 |cRXP_FRIENDLY_丽芙·布拉德弗|r 交谈
    .gossipoption 109047
    .goto Stormwind City,22.608,64.621
    .gossipoption 109084 >> 与|cRXP_ENEMY_斯图阿特|r交谈，然后击败他；他的生命值降至0%时会昏倒
    .goto Stormwind City,21.213,62.781
    >>如果|cRXP_ENEMY_斯图阿特|r不在，请等待他刷新
    .gossipoption 109044 >> 再次与 |cRXP_FRIENDLY_丽芙·布拉德弗|r 交谈（须已击倒 |cRXP_ENEMY_斯图阿特|r），领取 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .goto Stormwind City,22.608,64.621
    .train 425447,1 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r] |cRXP_WARN_学习|r |T236317:0|t[狂乱攻击]
    .use 204716
    .target 丽芙·布拉德弗
    .mob 斯图阿特
step
    #xprate <1.5
    #label HumbleBeginnings
    .goto StormwindClassic,49.194,30.284
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r交谈
    .accept 399 >> 接任务: 童年的记忆
    .target 巴隆斯·阿历克斯顿
step
    #xprate <1.5
    .goto StormwindClassic,58.091,16.552
    .target 弗伦·长须
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗伦·长须|r交谈
    .turnin 1338 >> 交任务：卡尔·雷矛的订单
    .dungeon !DM
step << Rogue
    #xprate <1.5
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 交谈
    .trainer >> 学习本职业技能
    .target 夜行者奥斯伯
step << Warrior
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_武神|r 或 |cRXP_FRIENDLY_伊尔萨·考宾|r 交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >> 学习本职业技能
    .target 武神
    .target 伊尔萨·考宾
step << Human Paladin
    #xprate <1.5
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯蒂芬妮·特纳|r交谈
    .turnin 1643 >> 交任务：圣洁之书
    .target 斯蒂芬妮·特纳
    .accept 1644 >> 接任务：圣洁之书
    .turnin 1644 >> 交任务：圣洁之书
    --.accept 1780 >> Accept The Tome of Divinity
step << Rogue
    #xprate <1.5
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买最多2把|r |T135343:0|t[战士阔剑] |cRXP_BUY_，若买得起就向她购买；也可去拍卖行寻找更好或更便宜的武器|r
    >>|cRXP_WARN_达到14级后同时装备这两把武器|r
    .collect 2027,2 --Scimitar
    .target 玛尔达·维勒
    .money <0.3815
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    #xprate <1.5
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_若买得起，向她购买最多2把|r |T135343:0|t[战士阔剑] |cRXP_BUY_|r
    >>|cRXP_WARN_达到14级时，同时装备这两把武器|r
    .collect 2027,2 --Scimitar
    .money <0.3815
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 玛尔达·维勒
step << Rogue
    #xprate <1.5
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step
    #xprate <1.5
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_BUY_购买|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_BUY_和／或|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_BUY_，稍后用于提升|r |T133971:0|t[烹饪] |cRXP_BUY_技能|r
    >>|cRXP_WARN_你需要50点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，才能完成之后夜色镇的一个任务|r
    >>|cRXP_WARN_如果不想或无法购买，就跳过这一步|r
    >>|cRXP_BUY_购买以下物品，稍后可在西部荒野和黑海岸更快交付任务：|r
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝]
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    >>|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- Okra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (1-50)
    .disablecheckbox
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (1-50)
    .disablecheckbox
    .target 拍卖师亚克森
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #xprate <1.5
    #ah
    #optional
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_WARN_如果不想或无法购买，就跳过这一步|r
    >>|cRXP_BUY_购买以下物品，稍后可在西部荒野和黑海岸更快交付任务：|r
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝]
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- Okra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target 拍卖师亚克森
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
step
    #xprate <1.5
    .goto StormwindClassic,66.28,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .turnin 6261 >> 交任务: 杜加尔·朗德瑞克
    .accept 6285 >> 接受任务：返回西部荒野
    .target 杜加尔·朗德瑞克
step
    #xprate <1.5
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克
--XX End of <1.5x section
----Darkshore transit (>1.49x)----
step << Mage
    #xprate >1.49
    .goto Ironforge,27.18,8.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈
    .trainer >> 学习本职业技能
    .target 丁克
step << Mage/Priest/Warlock
    #xprate >1.49
    #ah
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁炉堡拍卖师|r交谈
    >>|cRXP_BUY_购买一根|r |T135144:0|t[强效魔法杖] |cRXP_BUY_，前提是价格低于33银40铜|r
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    .collect 11288,1 --Greater Magic Wand (1)
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.5
    .money <0.7579 << Warlock/Mage
step << Mage/Priest/Warlock
    #xprate >1.49
    #ah
    #optional
    +|cRXP_WARN_装备|r |T135144:0|t[强效魔法杖]
    .use 11288
    .itemcount 11288,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.5
step << Priest/Warlock
    #xprate >1.49
    #optional
    .goto Ironforge,22.837,17.094,8,0
    .goto Ironforge,21.131,17.276,5,0
    .goto Ironforge,23.135,15.936
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_哈瑞克·石鼓|r交谈
    >>|cRXP_BUY_向他购买一根|r |T135468:0|t[烟尘魔杖] |cRXP_BUY_|r
    .collect 5208,1 --Smoldering Wand (1)
    .target 哈瑞克·石鼓
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .money <0.7579 << Warlock
step << Priest/Warlock
    #xprate >1.49
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135468:0|t[烟尘魔杖]
    .use 5208
    .itemcount 5208,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp <15,1
step << Priest/Warlock
    #xprate >1.49
    #optional
    #completewith next
    +|cRXP_WARN_记得装备|r |T135468:0|t[烟尘魔杖] |cRXP_WARN_（达到15级后）|r
    .use 5208
    .itemcount 5208,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp >15,1
step
    #xprate >1.49
    #ah
    .goto 1455,33.225,64.648,0
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁炉堡拍卖师|r交谈
    >>|cRXP_BUY_购买|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_BUY_和／或|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_BUY_，稍后用于提升|r |T133971:0|t[烹饪] |cRXP_BUY_技能|r
    >>|cRXP_WARN_你需要50点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，才能完成之后夜色镇的一个任务|r
    >>|cRXP_WARN_如果不想或无法购买，就跳过这一步|r
    >>|cRXP_BUY_购买以下物品，稍后可在黑海岸更快交付任务：|r
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    >>|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    >>|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (1-50)
    .disablecheckbox
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (1-50)
    .disablecheckbox
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #xprate >1.49
    #ah
    #optional
    .goto 1455,33.225,64.648,0
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁炉堡拍卖师|r交谈
    >>|cRXP_WARN_如果不想或无法购买，就跳过这一步|r
    >>|cRXP_BUY_购买以下物品，稍后可在黑海岸更快交付任务：|r
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
step << skip --logout skip << Mage
    #xprate >1.49
    #ah
    #hardcore << !Human
    #optional
    #completewith next
    .goto 1455,33.220,64.649
    .zone Dun Morogh >>|cRXP_WARN_跳到 |cRXP_PICK_邮箱|r 的最顶部，然后登出并重新登录以执行登出跳点|r
step << Rogue
    #xprate >1.49
    #ah
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    .vendor 5120 >>|cRXP_BUY_购买一把|r |T135343:0|t[战士阔剑] |cRXP_BUY_，若买得起就向她购买；也可去拍卖行寻找更好或更便宜的武器|r
    .target 布雷文·寒钢
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    #xprate >1.49
    #ssf
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    .vendor 5120 >>|cRXP_BUY_购买一把|r |T135343:0|t[战士阔剑] |cRXP_BUY_，若买得起就向她购买|r
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 布雷文·寒钢
step << Rogue
    #xprate >1.49
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_向她购买|r |T135425:0|t[锋利的飞刀] |cRXP_BUY_|r
    .collect 3107,100 -- Keen Throwing Knife
    .target 布雷文·寒钢
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    #xprate >1.49
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Warrior
    #xprate >1.49
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比尔班·飞钳|r交谈
    .trainer >> 学习本职业技能
    .target 比尔班·飞钳
step << skip --logout skip << Warrior
    #xprate >1.49
    #hardcore << !Human
    #optional
    #completewith next
    .goto 1455,68.198,89.713
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到武器架顶部，然后登出并重新登录以执行登出跳点|r
step << Warlock
    #xprate >1.49
    .goto Ironforge,51.1,8.7,15,0
    .goto Ironforge,50.343,5.657
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞尔索恩|r交谈
    .trainer >> 学习本职业技能
    .target 布瑞尔索恩
step << Gnome Rogue/Dwarf Rogue
    #xprate 1.49-1.59
    #optional
    .goto Ironforge,51.958,14.838
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的 |cRXP_FRIENDLY_霍夫丹·黑须|r 交谈
    .turnin 2218 >> 交任务: 救赎之路
    .target 霍夫丹·黑须
    .isOnQuest 2218
step << Rogue
    #xprate >1.49
    .goto Ironforge,51.495,15.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_芬斯维克|r交谈
    .trainer >> 学习本职业技能
    .target 芬斯维克
step << Warlock/Rogue
    #xprate >1.49
    #hardcore << !Human Rogue
    #optional
    #label Jubahl
    #completewith next
    .goto 1455,53.164,7.037,10 >> 进入 |cRXP_FRIENDLY_寻尸者祖贝尔|r 的房子
step << Warlock
    #xprate >1.49
    .goto Ironforge,53.2,7.8,15,0
    .goto Ironforge,52.701,6.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_寻尸者祖贝尔|r交谈
    .vendor >> |cRXP_BUY_购买|r |T133738:0|t[魔典：吞噬暗影（等级1）] |cRXP_BUY_和|r |T133738:0|t[魔典：牺牲（等级1）] |cRXP_BUY_，前提是买得起|r
    .target 寻尸者祖贝尔
step << skip --logout skip << Warlock/Rogue
    #xprate >1.49
    #hardcore << !Human
    #optional
    #requires Jubahl
    #completewith next
    .goto 1455,52.825,5.060
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶，然后跳到书架顶部。登出并重新登录，以执行登出跳点|r
step << Priest
    #xprate >1.49
    .goto Ironforge,25.207,10.756
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托德雷·铁矿|r交谈
    .trainer >> 学习本职业技能
    .target 托德雷·铁矿
step << Paladin
    #xprate >1.49
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_布兰度尔·铁锤|r 交谈
    .trainer >> 学习本职业技能
    .target 布兰度尔·铁锤
step << skip --logout skip << Priest/Paladin/Mage
    #xprate >1.49
    #ssf << Mage
    #hardcore << !Human
    #optional
    .goto 1455,25.254,10.981
    .zone Dun Morogh >>|cRXP_WARN_跳到 |cRXP_FRIENDLY_托德雷·铁矿|r 上方的柱子顶部，调整位置，直到角色看起来悬空，然后登出并重新登录以执行登出跳点|r
step << Dwarf/Gnome
    #xprate >1.49
    #softcore
    #completewith DarkshoreBoat
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fly Wetlands>> 飞往湿地
    .target 格莱斯·瑟登
step
    #xprate >1.49
    #optional
    #hardcore << !Human
    .goto 1426,53.042,35.383
    .zone Dun Morogh >> 离开铁炉堡
step
    #xprate >1.49
    #hardcore
    #completewith next
    .goto Dun Morogh,59.43,42.85,150 >> 前往丹莫罗至湿地跳点
step
    #xprate >1.49
    #hardcore
    .goto Dun Morogh,59.5,42.8,40,0
    .goto Dun Morogh,60.4,44.1,40,0
    .goto Dun Morogh,61.1,44.1,20,0
    .goto Dun Morogh,61.2,42.3,40,0
    .goto Dun Morogh,60.8,40.9,40,0
    .goto Dun Morogh,59.0,39.5,40,0
    .goto Dun Morogh,60.3,38.6,40,0
    .goto Dun Morogh,61.7,38.7,40,0
    .goto Dun Morogh,65.7,21.6,40,0
    .goto Dun Morogh,65.8,12.5,40,0
    .goto Dun Morogh,65.6,10.8,40,0
    .goto Dun Morogh,66.5,10.0,40,0
    .goto Dun Morogh,66.9,8.5,40,0
    .goto Wetlands,20.6,67.2,50,0
    .goto Wetlands,17.7,67.7,40,0
    .goto Wetlands,16.8,65.3,40,0
    .goto Wetlands,15.1,64.0,40,0
    .goto Wetlands,12.1,60.3,40,0
    >>|cRXP_WARN_先观看视频攻略，了解跳点的操作方法！|r
    >>|cRXP_WARN_完成丹莫罗 -> 湿地的无死亡跳点路线|r
    >>|cRXP_WARN_穿过水域时注意避开 |cRXP_ENEMY_湿地鳄鱼|r 和 |cRXP_ENEMY_鱼人|r|r
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >> |cRXP_WARN_点击此处查看视频攻略|r
    .goto Wetlands,12.1,60.3,80 >> 前往米奈希尔港
    .mob 湿地鳄鱼
    .mob 湿地鳄鱼幼崽
    .mob 蓝腮袭击者
step << Human
    #xprate >1.49
    #season 2
    #softcore
    #completewith next
    .goto Dun Morogh,59.43,42.85,150 >> 前往丹莫罗至湿地跳点
    .aura -438536 --Player has Spark of Inspiration (Alliance)
step << Human
    #xprate >1.49
    #season 2
    #softcore
    .goto Dun Morogh,59.5,42.8,40,0
    .goto Dun Morogh,60.4,44.1,40,0
    .goto Dun Morogh,61.1,44.1,20,0
    .goto Dun Morogh,61.2,42.3,40,0
    .goto Dun Morogh,60.8,40.9,40,0
    .goto Dun Morogh,59.0,39.5,40,0
    .goto Dun Morogh,60.3,38.6,40,0
    .goto Dun Morogh,61.7,38.7,40,0
    .goto Dun Morogh,65.7,21.6,40,0
    .goto Dun Morogh,65.8,12.5,40,0
    .goto Dun Morogh,65.6,10.8,40,0
    .goto Dun Morogh,66.5,10.0,40,0
    .goto Dun Morogh,66.9,8.5,40,0
    .goto Wetlands,20.6,67.2,50,0
    .goto Wetlands,17.7,67.7,40,0
    .goto Wetlands,16.8,65.3,40,0
    .goto Wetlands,15.1,64.0,40,0
    .goto Wetlands,12.1,60.3
    >>|cRXP_WARN_先观看视频攻略，了解跳点的操作方法！|r
    >>|cRXP_WARN_完成丹莫罗 -> 湿地的无死亡跳点路线|r
    >>|cRXP_WARN_穿过水域时注意避开 |cRXP_ENEMY_湿地鳄鱼|r 和 |cRXP_ENEMY_鱼人|r|r
    >>|cRXP_WARN_注意：由于你有|r |T134916:0|t[灵感火花] |cRXP_WARN_世界增益，因此采用较慢的无死亡跳点路线|r
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >> |cRXP_WARN_点击此处查看视频攻略|r
    .subzone 150 >> 前往米奈希尔港
    .mob 湿地鳄鱼
    .mob 湿地鳄鱼幼崽
    .mob 蓝腮袭击者
    .aura -438536 --Player has Spark of Inspiration (Alliance)
step << Human
    #xprate >1.49
    #softcore
    #label WetlandsDS1
    #completewith next
    .goto 1426,30.741,34.269,15,0
    .goto 1426,30.812,33.548,15,0
    .goto 1426,31.060,32.543,15,0
    .goto 1426,31.439,32.356,15,0
    .goto 1426,31.675,29.636,15,0
    .goto 1426,32.209,28.777,15,0
    .goto 1426,32.645,27.740,15,0
    .goto 1415,44.910,52.022,15,0
    >>|cRXP_WARN_按照丹莫罗 -> 湿地的死亡赶路路线前进，紧跟箭头|r
    >>|cRXP_WARN_现在还不要从高处跳下|r
    .goto 1415,44.910,52.030,15 >>|cRXP_WARN_爬上山，再向下走过锯齿状地形，直到子区域变为无尽之海|r
    .zoneskip Wetlands
    .subzoneskip 207 --The Great Sea
--XX neither of these zoneskips/subzoneskips want to work, so using waypoint obj instead
step << Human
    #xprate >1.49
    #softcore
    #requires WetlandsDS1
    #label WetlandsDS2
    .goto 1415,44.733,51.882,-1
    .goto 1437,11.730,43.304,-1
    >>|cRXP_WARN_朝北方或西北方跳下山|r
    .deathskip >> 死亡后在巴拉丁海湾的 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
    .subzoneskip 150 --Menethil Harbor
    .isQuestAvailable 984
step << Human
    #xprate >1.49
    #softcore
    #optional
    #requires WetlandsDS2
    #completewith next
    .goto Wetlands,11.95,50.24,60 >> 朝米奈希尔港方向游向岸边
    .subzoneskip 150 --Menethil Harbor
step
    #xprate >1.49
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto 1437,10.760,56.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与兵营底层的 |cRXP_FRIENDLY_尼尔·奥雷|r 交谈
    .vendor 1448 >> |cRXP_WARN_向他购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_（如果有货）|r
	.target 尼尔·奥雷
    .bronzetube
    .money <0.08
step
    #xprate >1.49
    #optional
    #completewith next
    .goto 1437,10.233,56.201,15 >> 离开米奈希尔城堡
    .subzoneskip 2103,1 --Menethil Keep
step
    #xprate >1.49
    #hardcore << !Human
    .goto Wetlands,9.49,59.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r 交谈
    .fp Wetlands >> 获取湿地飞行点
    .target 谢尔雷·布隆迪尔
step
    #xprate >1.49
    .goto Wetlands,7.95,56.38
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_德温·晨光|r 交谈
    .vendor 1453 >> |cRXP_BUY_向他购买|r |T134831:0|t[治疗药水] |cRXP_BUY_（如果有货）|r
    .target 德温·晨光
step
    #xprate >1.49
    #optional
    #label DockTravel
    #completewith next
    .goto Wetlands,7.10,57.96,30,0
    .goto Wetlands,4.61,57.26,15 >> 前往奥伯丁船码头
    .zoneskip Darkshore
step
    #xprate >1.49
    #optional
    #requires DockTravel
    #label DarkshoreCook1
    #completewith DarkshoreBoat
    >>|cRXP_WARN_船刚到时，在船上进行以下操作；船刚离开时，则在码头上进行：|r
    .cast 818 >>|cRXP_WARN_制作一个|r |T135805:0|t[基础营火] |cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #xprate >1.49
    #optional
    #requires DarkshoreCook1
    #label DarkshoreCook2
    #completewith DarkshoreBoat
    >>|cRXP_WARN_船刚到时，在船上进行以下操作；船刚离开时，则在码头上进行：|r
    .cast 818 >>|cRXP_WARN_制作一个|r |T135805:0|t[基础营火] |cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #xprate >1.49
    #optional
    #requires DarkshoreCook2
    #label DarkshoreCook3
    #completewith DarkshoreBoat
    >>|cRXP_WARN_船刚到时，在船上进行以下操作；船刚离开时，则在码头上进行：|r
    .cast 818 >>|cRXP_WARN_制作一个|r |T135805:0|t[基础营火] |cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #xprate >1.49
    #optional
    #requires DarkshoreCook3
    #label DarkshoreCook4
    #completewith DarkshoreBoat
    >>|cRXP_WARN_你需要50点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，才能完成之后暮色森林的一个任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_以下食材：|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #xprate >1.49
    #optional
    #requires DarkshoreCook4
    #label DarkshoreCook5
    #completewith DarkshoreBoat
    >>|cRXP_WARN_你需要50点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，才能完成之后暮色森林的一个任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #xprate >1.49
    #optional
    #requires DarkshoreCook5
    #label DarkshoreCook6
    #completewith DarkshoreBoat
    >>|cRXP_WARN_你需要50点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，才能完成之后暮色森林的一个任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #xprate >1.49
    #label DarkshoreBoat
    .goto 1437,4.370,56.762
    >>|cRXP_WARN_如有需要，可在等待前往黑海岸的船时提升|r |T135966:0|t[急救] |cRXP_WARN_技能|r
    .zone Darkshore >> 乘船前往 黑海岸
]])
