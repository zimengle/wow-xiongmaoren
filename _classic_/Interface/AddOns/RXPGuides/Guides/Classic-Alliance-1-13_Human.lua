local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
#season 0,1
<< Alliance
#name 1-6 北郡
#displayname 1-6 北郡 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor Human
#next 6-11 艾尔文森林


step << !Human
    #completewith next
    +您已选择适用于人类的指南. 请确保选择与您起始区域相同的起始地带
step << Mage
    #completewith next
    +请注意, 您已选择单目标法师指南. 单目标模式比AoE(范围攻击)法师更安全, 但速度慢很多
step << !Human Mage
    #season 2
    #completewith next
    +在探索季中, 作为法师你不应该在种族起始区域之外开始游戏, 因为你将无法在这里获得你的第一个符文(|T135844:0|t[寒冰之枪])
step
    #softcore << Warlock
    #optional
    #completewith Within
    .destroy 6948 >>摧毁: |cRXP_ENEMY_炉石|r, 它在你的背包中. 不再需要它了
step << Warlock
    #season 2
    #sticky
    #label WarlockVendor << Human
    .goto Elwynn Forest,50.051,42.689
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹恩·温斯洛|r交谈
    .vendor >>|cRXP_WARN_出售你的身体护甲和衬衫和裤子和靴子, 以及背包中的食物和水. 你需要总共10铜币|r
    .target Dane Winslow
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
    .xp 2 >>升级到2级
    .mob Young Wolf
step << Warlock
    #season 0,1
    #completewith next
    .goto Elwynn Forest,50.051,42.689
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹恩·温斯洛|r交谈
    .vendor >>|cRXP_WARN_出售你的身体护甲和衬衫和裤子和靴子, 以及背包中的食物和水. 你需要总共10铜币|r
    .target Dane Winslow
step << Warlock
    #season 0,1
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .accept 1598 >>接任务: |cRXP_LOOT_失窃的典籍|r
    .train 348 >>训练 |T135817:0|t[献祭]
    .target Drusilla La Salle
step << Warlock
    #season 2
    #requires WarlockVendor << Human
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .accept 1598 >>接任务: |cRXP_LOOT_失窃的典籍|r
    .accept 77621 >>接任务: |cRXP_WARN_失窃的力量|r << Human
    .train 348 >>训练 |T135817:0|t[献祭]
    .target Drusilla La Salle
step << Warlock
    #season 2
    .goto Elwynn Forest,52.544,51.922
    >>|cRXP_WARN_在前往|r|cRXP_PICK_迪菲亚储物箱|r的途中, 请尽量小心避开尽可能多的|cRXP_ENEMY_迪菲亚暴徒|r|r
    >>|cRXP_WARN_杀死|r|cRXP_ENEMY_迪菲亚暴徒|r 周围的|r|cRXP_PICK_迪菲亚宝箱|r|r
    >>|cRXP_WARN_打开地面上的|cRXP_PICK_Defias 储物箱|r. 拾取其中的|r|T134419:0|t|cRXP_LOOT_[鬼影符文]|r
    .collect 205230,1 -- Rune of Haunting (1)
    .train 403919,1
step << Warlock
    #season 2
    #label RoH
    .train 403919 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[幽魂符文]|r|cRXP_WARN_来学习|r|T236298:0|t[缠魂]
    .use 205230
    .itemcount 205230,1
step << Warlock
    #hardcore
--   .goto Elwynn Forest,52.9,44.3,60,0
    .goto Elwynn Forest,56.7,44.0
    >>|cRXP_WARN_进入迪菲亚营地的帐篷|r
    >>打开|cRXP_PICK_被偷走的书|r, 从中获取|cRXP_LOOT_虚空灵能|r
    >>|cRXP_WARN_你可以在帐篷内安全地拾取|cRXP_LOOT_虚空灵能|r！观看视频了解具体操作方法|r
    .link https://youtu.be/3qQwsJhAZIk >>|cRXP_WARN_点击此处查看视频参考|r
    .complete 1598,1 --Collect Powers of the Void (x1)
step << Warlock
    #hardcore
    #completewith next
    .goto Elwynn Forest,56.828,43.734
    >>|cRXP_WARN_待在帐篷里, 这样|cRXP_ENEMY_迪菲亚暴徒|r 就无法攻击到你|r
    .hs >>传送至北郡山谷
step << Warlock
    #softcore
--  .goto Elwynn Forest,52.9,44.3,60,0
    .goto Elwynn Forest,56.7,44.0
    >>|cRXP_WARN_进入迪菲亚营地的帐篷|r
    >>打开|cRXP_PICK_被偷走的书|r, 从中获取|cRXP_LOOT_虚空灵能|r
    >>|cRXP_WARN_你可以在帐篷内安全地拾取|cRXP_LOOT_虚空灵能|r！观看视频了解具体操作方法|r
    .link https://www.youtube.com/watch?v=_-KEke9Yeik >>|cRXP_WARN_点击此处查看视频参考|r
    .complete 1598,1 --Collect Powers of the Void (x1)
step << Warlock
    #softcore
    #completewith next
    .goto 1429,49.527,43.491,0
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
step << Warlock
    #season 0,1
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .turnin 1598 >>交任务: |cRXP_FRIENDLY_失窃的典籍|r
    .target Drusilla La Salle
step << Warlock
    #season 2
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .turnin 1598 >>交任务: |cRXP_FRIENDLY_失窃的典籍|r
    .turnin 77621 >>交任务: |cRXP_FRIENDLY_失窃的力量|r << Human
    .target Drusilla La Salle
step << Human Warlock
    #season 2
    #label GlovesEquip
    #completewith RestandR
    .equip 10,711 >>|cRXP_WARN_装备|r|T132961:0|t[破布手套]
    .use 711
    .itemcount 711,1 --Tattered Cloth Gloves (1)
    .itemStat 10,LEVEL,<5
    .train 403919,3
step << Human Warlock
    #season 2
    #requires GlovesEquip
    #completewith RestandR
    .engrave 10 >>|cRXP_WARN_刻印你的|r|T132961:0|t[破布手套] |cRXP_WARN_附魔|r|T236298:0|t[幽魂]
    .train 403919,3
step << Warlock
    #optional
    #completewith next
    .cast 688 >>|cRXP_WARN_Cast|r|T136218:0|t[召唤地狱火]
    .usespell 688
step
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 783 >>接任务: |cRXP_LOOT_身边的危机|r
    .target Deputy Willem
step << Warrior
    #xprate <1.59
    .goto Elwynn Forest,46.4,40.3,35,0
    >>击杀 |cRXP_ENEMY_幼狼|r, 直到你获得价值10铜币以上的垃圾物品
    >>|cRXP_WARN_你将学习|r|T132333:0|t[战斗怒吼]|cRXP_WARN_这能提升早期升级速度|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    .target +Brother Danil
    .goto Elwynn Forest,47.486,41.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_莱尼·拜舍尔|r交谈
    .train 6673 >>训练 |T132333:0|t[战斗怒吼]
    .target +Llane Beshere
    .goto Elwynn Forest,50.242,42.287
    .mob Young Wolf   
step
    #label Within
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 783 >>交任务: |cRXP_FRIENDLY_身边的危机|r
    .accept 7 >>接任务: |cRXP_LOOT_剿灭狗头人|r
    .target Marshal McBride
step
    .goto Elwynn Forest,48.171,42.943
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 5261 >>接任务: |cRXP_LOOT_伊根·派特斯金纳|r
    .target Deputy Willem
step
    #label EaganWolves
    .goto Elwynn Forest,48.941,40.166
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊根·派特斯金纳|r交谈
    .turnin 5261 >>交任务: |cRXP_FRIENDLY_伊根·派特斯金纳|r
    .accept 33 >>接任务: |cRXP_LOOT_林中的群狼|r
    .target Eagan Peltskinner
step << Priest/Mage/Warlock
    #completewith next
    .goto Elwynn Forest,46.2,40.4,40,0
    .goto Elwynn Forest,47.486,41.566
    >>|cRXP_WARN_一旦你收集到价值50铜币的可出售垃圾:|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    >>出售垃圾
    >>|cRXP_BUY_从他那里购买 10|r|T132794:0|t[清凉的泉水]|r
    .collect 159,10 --Collect Refreshing Spring Water (x10)
    .target Brother Danil
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
    >>击杀|cRXP_ENEMY_幼狼|r和|cRXP_ENEMY_狂暴的冬狼|r. 击杀后可掠夺其|cRXP_LOOT_硬狼肉|r
    .complete 33,1 --Collect Tough Wolf Meat (x8)
	.mob Young Wolf
	.mob Timber Wolf
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
    .mob Kobold Vermin
step
    #xprate >1.59
    #optional
    #completewith next
    .goto 1429,45.718,40.733,0
    .xp 3+720 >>升级至720/1400经验值
    .mob Young Wolf
	.mob Timber Wolf
step
    #requires WolfMeatEnd
    .goto Elwynn Forest,48.941,40.166
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊根·派特斯金纳|r交谈
    .turnin 33,2 >>交任务: |cRXP_FRIENDLY_林中的群狼|r << Warrior/Paladin/Rogue
    .turnin 33,1 >>交任务: |cRXP_FRIENDLY_林中的群狼|r << !Warrior !Paladin !Rogue
    .target Eagan Peltskinner
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
    .xp 3+1060 >>升级至1060/1400经验值
    .mob Young Wolf
	.mob Timber Wolf
step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith CleanupEnd
    +|cRXP_WARN_刷怪并出售垃圾, 直到你有1银35铜|r
    .money >0.0135
    .train 100,1 << Warrior --Charge
    .train 20271,1 << Paladin --Judgement
    .isOnQuest 7
step << Priest/Mage/Warlock
    .goto Elwynn Forest,47.486,41.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    >>出售垃圾
    >>|cRXP_BUY_再买10个|r|T132794:0|t[清凉的泉水]|cRXP_BUY_从他处获得|r
    >>|cRXP_WARN_确保你至少存下10铜币, 留着以后用|r << Priest/Mage
    .collect 159,10 --Collect Refreshing Spring Water (x10)
    .target Brother Danil
step << !Priest !Mage !Warlock !Rogue
    .goto Elwynn Forest,47.691,41.417
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高德瑞克·洛斯迦|r交谈
    .vendor >>出售垃圾
    .target Godric Rothgar
step << Rogue
    #season 0,1
    .goto Elwynn Forest,47.240,41.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚努斯·哈默纳克|r交谈
    .vendor 78 >>|cRXP_BUY_如果你买得起, 就从他那里买一个|r|T135650:0|t[简易匕首]|r
    .collect 2139,1 -- Dirk (1)
    .disablecheckbox
    .target Janos Hammerknuckle
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 7 >>交任务: |cRXP_FRIENDLY_剿灭狗头人|r
    .accept 15 >>接任务: |cRXP_LOOT_回音山调查行动|r
    .accept 3100 >>接任务: |cRXP_LOOT_简要的信件|r << Warrior
    .accept 3101 >>接任务: |cRXP_LOOT_圣洁信件|r << Paladin
    .accept 3102 >>接任务: |cRXP_LOOT_密文信件|r << Rogue
    .accept 3103 >>接任务: |cRXP_LOOT_神圣信件|r << Priest
    .accept 3104 >>接任务: |cRXP_LOOT_雕文信件|r << Mage
    .accept 3105 >>接任务: |cRXP_LOOT_被污染的信件|r << Warlock
    .target Marshal McBride
step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith next
    +|cRXP_WARN_刷怪并出售垃圾, 直到你拥有2银10铜|r
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
    .goto Elwynn Forest,49.661,39.402,12 >>前往凯尔登·布雷门所在的楼上
step << Mage
    #xprate >1.59
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_凯尔登·布雷门|r交谈
    .goto Elwynn Forest,49.661,39.402
    .turnin 3104 >>交任务: |cRXP_FRIENDLY_雕文信件|r
    .trainer >>训练你的职业法术
    .target Khelden Bremen
step << Mage
    #xprate >1.59
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_凯尔登·布雷门|r交谈
    .goto Elwynn Forest,49.661,39.402
    .turnin 3104 >>交任务: |cRXP_FRIENDLY_雕文信件|r
    .accept 77620 >>接受法术研究 << Human Mage
    .trainer >>训练你的职业法术
    .target Khelden Bremen
step << Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto Elwynn Forest,49.3,40.7,15,0
    .goto Elwynn Forest,49.8,40.2,10 >>前往楼下的女牧师安妮塔
step << Priest
    #xprate >1.59
    #season 0,1
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_女牧师安妮塔|r交谈
    .turnin 3103 >>交任务: |cRXP_FRIENDLY_神圣信件|r
    .trainer >>训练你的职业法术
    .target Priestess Anetta
step << Priest
    #xprate >1.59
    #season 2
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_女牧师安妮塔|r交谈
    .turnin 3103 >>交任务: |cRXP_FRIENDLY_神圣信件|r
    .accept 77619 >>接任务: |cRXP_WARN_圣光之思|r << Human Priest
    .trainer >>训练你的职业法术
    .target Priestess Anetta
step << Warrior/Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto Elwynn Forest,48.85,41.76,15,0
    .goto Elwynn Forest,49.6,41.8,15 >>前往楼下找|cRXP_FRIENDLY_莱尼·拜舍尔|r << Warrior
    .goto Elwynn Forest,49.6,41.8,15 >>前往楼下的萨缪尔修士方向 << Paladin
step << Warrior
    #xprate >1.59
    #season 0,1
    .goto Elwynn Forest,50.242,42.287
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_莱尼·拜舍尔|r交谈
    .turnin 3100 >>交任务: |cRXP_FRIENDLY_简要的信件|r
    .trainer >>训练你的职业法术
    .target Llane Beshere
step << Warrior
    #xprate >1.59
    #season 2
    .goto Elwynn Forest,50.242,42.287
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_莱尼·拜舍尔|r交谈
    .turnin 3100 >>交任务: |cRXP_FRIENDLY_简要的信件|r
    .accept 77616 >>接受失落的符文 << Human
    .trainer >>训练你的职业法术
    .target Llane Beshere
step << Paladin
    #xprate >1.59
    #season 0,1
    .goto Elwynn Forest,50.433,42.124
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨缪尔修士|r交谈
    .turnin 3101 >>交任务: |cRXP_FRIENDLY_圣洁信件|r
    .trainer >>训练你的职业法术
    .target Brother Sammuel
step << Human Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto Elwynn Forest,49.3,40.7,15,0
    .goto Elwynn Forest,49.8,40.2,10 >>前往楼下的女牧师安妮塔
step << Warlock
    #xprate >1.59
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .turnin 3105 >>交任务: |cRXP_FRIENDLY_被污染的信件|r
    .train 172 >>训练 |T136118:0|t[腐蚀之触]
    .target Drusilla La Salle



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
    .mob Kobold Worker



----Start of 1x train section----




step
    #xprate <1.59
    #requires Memory << Priest --Season 2
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
    .xp 3+1110 >>升级至1110+/1400经验
step
    #xprate <1.59
    #season 0,1 << Warrior
    #completewith next
    .goto Elwynn Forest,47.691,41.417
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高德瑞克·洛斯迦|r交谈
    .vendor >>|cRXP_WARN_出售垃圾|r
    .target Godric Rothgar
--N need SoM xp note
step
    #xprate <1.59
    #requires xp3
    #label Investigate
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 15 >>交任务: |cRXP_FRIENDLY_回音山调查行动|r
    .accept 21 >>接任务: |cRXP_LOOT_回音山清剿行动|r
    .target Marshal McBride
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
    .goto Elwynn Forest,49.661,39.402,12 >>前往凯尔登·布雷门所在的楼上
step << Mage
    #xprate <1.59
    #season 0,1
    .goto Elwynn Forest,49.661,39.402
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_凯尔登·布雷门|r交谈
    .turnin 3104 >>交任务: |cRXP_FRIENDLY_雕文信件|r
    .trainer >>训练你的职业法术
    .target Khelden Bremen
step << Priest
    #xprate <1.59
    #optional
    #completewith next
    .goto Elwynn Forest,49.3,40.7,15,0
    .goto Elwynn Forest,49.8,40.2,10 >>前往楼下的女牧师安妮塔
step << Priest
    #xprate <1.59
    #season 0,1
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_女牧师安妮塔|r交谈
    .turnin 3103 >>交任务: |cRXP_FRIENDLY_神圣信件|r
    .trainer >>训练你的职业法术
    .target Priestess Anetta
step << Warrior/Paladin
    #xprate <1.59
    #optional
    #completewith next
    .goto Elwynn Forest,48.85,41.76,15,0
    .goto Elwynn Forest,49.6,41.8,15 >>前往楼下找|cRXP_FRIENDLY_莱尼·拜舍尔|r << Warrior
    .goto Elwynn Forest,49.6,41.8,15 >>前往楼下的萨缪尔修士方向 << Paladin
step << Warrior
    #xprate <1.59
    #season 0,1
    .goto Elwynn Forest,50.242,42.287
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_莱尼·拜舍尔|r交谈
    .turnin 3100 >>交任务: |cRXP_FRIENDLY_简要的信件|r
    .trainer >>训练你的职业法术
    .target Llane Beshere
step << Paladin
    #xprate <1.59
    #season 0,1
    .goto Elwynn Forest,50.433,42.124
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨缪尔修士|r交谈
    .turnin 3101 >>交任务: |cRXP_FRIENDLY_圣洁信件|r
    .trainer >>训练你的职业法术
    .target Brother Sammuel
step
    #xprate <1.59
    #season 0,1 << Warrior
    .goto Elwynn Forest,48.171,42.943
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外部的|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 18 >>接任务: |cRXP_LOOT_潜行者兄弟会|r
    .target Deputy Willem
step << Warlock
    #xprate <1.59
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .turnin 3105 >>交任务: |cRXP_FRIENDLY_被污染的信件|r
    .train 172 >>训练 |T136118:0|t[腐蚀之触]
    .target Drusilla La Salle



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
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r. 击败他们后可拾取|cRXP_LOOT_红色粗麻面罩|r
    .complete 18,1 --Collect Red Burlap Bandana (x12)
    .mob Defias Thug
step << Rogue
    #xprate <1.59
    #season 2
    .goto Elwynn Forest,50.314,39.916
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔里克·克里丹|r交谈
    .turnin 3102 >>交任务: |cRXP_FRIENDLY_密文信件|r
    .accept 77618 >>接受“三度被盗” << Human
    .train 1784 >>训练 |T132320:0|t[潜行]
    .train 921 >>训练 |T133644:0|t[扒窃]
    .target Jorik Kerridan
step << Rogue
    #xprate <1.59
    #season 2
    #sticky
    #label Shadowstrike1
    .goto Elwynn Forest,52.544,51.922
    >>|cRXP_WARN_打开地面上的|cRXP_PICK_Defias 储物箱|r. 拾取其中的|r|T134419:0|t|cRXP_LOOT_[暗影打击符文]|r
    .collect 204795,1 -- Rune of Shadowstrike (1)
    .train 400105,1
step << Rogue
    #xprate <1.59
    #season 2
    #sticky
    #requires Shadowstrike1
    #label Shadowstrike2
    .train 400105 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[暗影之击符文]|r|cRXP_WARN_来学习|r|T132291:0|t[暗影之击]
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
    >>击杀|r|cRXP_ENEMY_迪菲亚暴徒|r. 击败他们以获取|T134939:0|t|cRXP_LOOT_[法术笔记:卡勒恩奇]|r
    >>|cRXP_WARN_注意:你将无法在此处学习|r|T135844:0|t[寒冰之枪]|cRXP_WARN_, 因为你只能在你种族的起始区域获得|r|T133736:0|t[理解入门]|r << !Human
    .collect 203751,1,77620,1 -- Spell Notes: CALE ENCI (1)
    .mob Defias Thug
    .train 401760,1
step << Human Mage
    #season 2
    #requires CALEENCI
    #label CALEENCI2
    .train 401760 >>|cRXP_WARN_使用|r|T134939:0|t|cRXP_LOOT_[法术说明: 卡莱·恩奇]|r|cRXP_WARN_来学习|r|T135844:0|t[寒冰之枪]
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
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r. 击败他们后搜刮|T134916:0 |t|cRXP_LOOT_[审判圣典]|r
    .collect 205420,1 -- Libram of Judgement (1)
    .mob Defias Thug
    .train 410002,1
step << Paladin
    #xprate <1.59
    #season 2
    #sticky
    #label Libram2
    #requires Libram1
    .equip 18,205420 >>|cRXP_WARN_装备|r|T134916:0|t|cRXP_LOOT_[审判圣典]|r
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
    .aura 408828 >>|cRXP_WARN_施放|r|T135959:0|t[审判]|cRXP_WARN_10次以获得|r|T136116:0|t[灵感]|cRXP_WARN_buff|r
    .itemStat 18,QUALITY,2
    .train 410002,1
step << Paladin
    #xprate <1.59
    #season 2
    #sticky
    #label Libram4
    #requires Libram3
    .cast 409920 >>|cRXP_WARN_使用|r|T134916:0|t|cRXP_LOOT_[审判圣典]|r|cRXP_WARN_来学习|r|T135891:0|t[十字军打击]
    .use 205420
    .aura -408828
    .train 410002,1
step << Paladin
    #xprate <1.59
    #season 2
    #label Libram5
    #requires Libram4
    #completewith RedBurlapBandana
    .equip 10 >>|cRXP_WARN_装备一副|r|T132938:0|t|cRXP_LOOT_[手套]|r|cRXP_WARN_如果你已有或在拾取时|r
    .train 410002,3
step << Paladin
    #xprate <1.59
    #season 2
    #requires Libram5
    #completewith RedBurlapBandana
    .engrave 10 >>|cRXP_WARN_刻印你的|r|T132938:0|t|cRXP_LOOT_[手套]|r|cRXP_WARN_带有|r|T135891:0|t[十字军打击]
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
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r. 击败他们后可拾取|cRXP_LOOT_红色粗麻面罩|r
    .complete 18,1 --Collect Red Burlap Bandana (x12)
	.mob Defias Thug
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
    .xp 4 >>升级到4级
step << Human Rogue
    #xprate <1.59
    #season 2
    .goto Elwynn Forest,50.314,39.916
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔里克·克里丹|r交谈
    .turnin 77618 >>上交三度被盗的物品 << Human
    .target Jorik Kerridan
step << Human Rogue
    #xprate <1.59
    #season 2
    #label GlovesEquip
    #completewith RestandR
    .equip 10,2125 >>|cRXP_WARN_装备|r |T132952:0|t[破损的皮手套]
    .use 2125
    .itemcount 2125,1 --Cracked Leather Gloves (1)
    .itemStat 10,LEVEL,<5
    .train 400105,3
step << Human Rogue
    #xprate <1.59
    #season 2
    #requires GlovesEquip
    #completewith RestandR
    .engrave 10 >>|cRXP_WARN_镌刻你的|r |T132952:0|t[破损的皮手套] |cRXP_WARN_上|r |T132291:0|t[暗影之击]
    .train 400105,3
step << !Human/!Rogue
    #xprate <1.59
    #season 2
    #softcore
    #completewith next
    #requires CALEENCI2 << Mage
    #requires Libram4 << Paladin
    #requires Shadowstrike2 << Rogue
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
--   .subzoneskip 59,1
step << Human Rogue
    #xprate <1.59
    #season 2
    #requires Shadowstrike2
    .goto Elwynn Forest,50.314,39.916
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔里克·克里丹|r交谈
    .turnin 77618 >>上交三度被盗的物品
    .target Jorik Kerridan
    .isOnQuest 77618
step << !Paladin !Rogue
    #xprate >1.59
    #season 2
    #requires CALEENCI2 << Mage
--   #requires Libram4 << Paladin
--  #requires Shadowstrike2 << Rogue
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 18,1 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Rogue/Warlock
    .turnin 18,2 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Priest
    .turnin 18,3 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Warrior
    .turnin 18,4 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Paladin
    .turnin 18,5 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Mage
    .turnin 18 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << !Warrior !Priest !Mage !Rogue !Warlock !Paladin
--   .accept 3903 >>接任务: |cRXP_LOOT_米莉·奥斯沃斯|r
    .accept 6 >>接任务: |cRXP_LOOT_加瑞克·帕德弗特的赏金|r
    .target Deputy Willem
step
    #xprate <1.59
    #season 2
    #requires CALEENCI2 << Mage
    #requires Libram4 << Paladin
    #requires Shadowstrike2 << Rogue
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 18,1 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Rogue/Warlock
    .turnin 18,2 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Priest
    .turnin 18,3 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Warrior
    .turnin 18,4 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Paladin
    .turnin 18,5 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Mage
    .turnin 18 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << !Warrior !Priest !Mage !Rogue !Warlock !Paladin
    .accept 3903 >>接任务: |cRXP_LOOT_米莉·奥斯沃斯|r
    .accept 6 >>接任务: |cRXP_LOOT_加瑞克·帕德弗特的赏金|r
    .target Deputy Willem
step
    #season 0,1
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 18,1 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Rogue/Warlock
    .turnin 18,2 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Priest
    .turnin 18,3 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Warrior
    .turnin 18,4 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Paladin
    .turnin 18,5 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Mage
    .turnin 18 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << !Warrior !Priest !Mage !Rogue !Warlock !Paladin
    .accept 3903 >>接任务: |cRXP_LOOT_米莉·奥斯沃斯|r
    .accept 6 >>接任务: |cRXP_LOOT_加瑞克·帕德弗特的赏金|r
    .target Deputy Willem
step << Paladin
    #season 0,1
    #completewith RestandR
    .equip 16,5579 >>|cRXP_WARN_装备|r|T133052:0|t[民兵战锤]
    .use 5579
    .itemcount 5579,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.6
step << Paladin
    #xprate <1.59
    #season 2
    #completewith RestandR
    .equip 16,5579 >>|cRXP_WARN_装备|r|T133052:0|t[民兵战锤]
    .use 5579
    .itemcount 5579,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.6
step << Rogue
    #xprate <1.59
    #season 2
    #completewith RestandR
    .equip 16,2224 >>装备 |T135641:0|t[民兵匕首]
    .use 2224
    .itemcount 2224,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.0
step << Rogue
    #season 0,1
    #completewith RestandR
    .equip 16,2224 >>装备 |T135641:0|t[民兵匕首]
    .use 2224
    .itemcount 2224,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.0
step << Warrior
    #completewith RestandR
    .equip 16,1161 >>装备 |T135274:0|t[民兵短剑]
    .use 1161
    .itemcount 1161,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.0
step
    #xprate >1.59
    #season 0,1 << Priest/Warrior
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 15 >>交任务: |cRXP_FRIENDLY_回音山调查行动|r
    .accept 21 >>接任务: |cRXP_LOOT_回音山清剿行动|r
    .target Marshal McBride
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
    .goto Elwynn Forest,49.661,39.402,12 >>前往凯尔登·布雷门所在的楼上
    .isQuestComplete 77620
step << Human Mage
    #season 2
    .goto Elwynn Forest,49.661,39.402
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯尔登·布雷门|r对话, 他在里面
    .turnin 77620 >>提交法术研究
    .target Khelden Bremen
    .isQuestComplete 77620
step << Human Mage
    #season 2
    #label GlovesEquip
    #completewith RestandR
    .equip 10,711 >>|cRXP_WARN_装备|r|T132961:0|t[破布手套]
    .use 711
    .itemcount 711,1 --Tattered Cloth Gloves (1)
    .itemStat 10,LEVEL,<5
    .train 401760,3
step << Human Mage
    #xprate <1.59
    #season 2
    #requires GlovesEquip
    #completewith RestandR
    .engrave 10 >>|cRXP_WARN_刻印你的|r|T132961:0|t[破布手套] |cRXP_WARN_上|r|T135844:0|t[寒冰之枪]
    .train 401760,3
step << Warrior/Paladin
    #xprate <1.59
    #season 2
    #optional
    #completewith next
    .goto Elwynn Forest,48.85,41.76,15,0
    .goto Elwynn Forest,49.6,41.8,15 >>前往楼下的萨缪尔修士方向
step << Human Paladin
    #xprate <1.59
    #season 2
    .isQuestComplete 77617
    .goto Elwynn Forest,50.433,42.124
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨缪尔修士|r交谈
    .turnin 77617 >>交还光明圣物
    .target Brother Sammuel
step << Human Paladin
    #xprate <1.59
    #season 2
    #completewith RestandR
    #label GlovesEquip
    .equip 10,2385 >>|cRXP_WARN_装备|r|T132938:0|t|cRXP_LOOT_[无光泽的链甲手套]|r
    .use 2385
    .itemcount 2385,1
    .itemStat 10,LEVEL,<5
    .train 410002,3
step << Human Paladin
    #xprate <1.59
    #season 2
    #completewith RestandR
    #requires GlovesEquip
    .engrave 10 >>|cRXP_WARN_刻印|r|T132938:0|t|cRXP_LOOT_[无光泽的链甲手套]|r|cRXP_WARN_附带|r|T135891:0|t[十字军打击]
    .itemStat 10,LEVEL,<5
    .train 410002,3
step
    #optional
    #completewith next
    .goto Elwynn Forest,47.63,32.07,20 >>进入回声岭矿坑
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
    >>击杀回声岭矿井内的狗头人苦力
    .complete 21,1 --Kill Kobold Laborer (x12)
    .mob Kobold Laborer
step
    #xprate <1.59
    .goto Elwynn Forest,50.692,39.347
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莉·奥斯沃斯|r交谈
    >>|cRXP_WARN_跳过后续任务|r << !Priest !Mage
    .turnin 3903 >>交任务: |cRXP_FRIENDLY_米莉·奥斯沃斯|r
    .accept 3904 >>接任务: |cRXP_LOOT_米莉的葡萄|r << Priest/Mage
    .target Milly Osworth
step << Rogue
    #season 0,1
    .goto Elwynn Forest,50.314,39.916
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔里克·克里丹|r交谈
    .turnin 3102 >>交任务: |cRXP_FRIENDLY_密文信件|r
    .train 1784 >>训练 |T132320:0|t[潜行]
    .train 921 >>训练 |T133644:0|t[扒窃]
    .target Jorik Kerridan
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
    >>战利品|cRXP_PICK_米莉的葡萄|r位于地面
    .complete 3904,1 --Collect Milly's Harvest (x8)
step << Rogue
    #sticky
    #label CuttyNote
    #season 2
    .goto 1429,57.518,48.253
    >>|T133644:0|t[扒窃] |cRXP_ENEMY_加瑞克·帕德弗特|r获取 |T134331:0|t[卡蒂的笔记]
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 203723,1 -- Cutty's Note (1)
    .mob Garrick Padfoot
    .train 400094,1
step
    .goto 1429,57.518,48.253
    >>击杀|cRXP_ENEMY_加瑞克·帕德弗特|r. 击败他后掠夺其|cRXP_LOOT_头|r
    .complete 6,1 --Collect Garrick's Head (x1)
    .mob Garrick Padfoot
step
    #xprate >1.49 << Priest/Mage
    #optional
    #completewith RestandR
    .abandon 3904 >>放弃米莉的葡萄
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
    .xp 5+1735 >>升级至1735/2800经验值 << Paladin/Warrior
    .xp 5+1625 >>升级至1625/2800经验值 << !Paladin !Warrior !Priest !Mage
    .xp 5+1085 >>升级至1085/2800经验值 << Mage
    .xp 5+975 >>升级至975/2800经验值 << Priest
    .mob Defias Thug
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
    .xp 5+1205 >>升级至1205/2800经验值 << Paladin/Warrior
    .xp 5+1040 >>升级至1040+/2800经验值 << !Paladin !Warrior !Priest
    .xp 5+875 >>升级至875/2800经验值 << Priest
    .mob Defias Thug
step
    #optional
    #softcore
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
-- .subzoneskip 59,1
step << Priest/Mage
    #xprate <1.5
    .goto Elwynn Forest,50.692,39.347
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莉·奥斯沃斯|r交谈
    .turnin 3904 >>交任务: |cRXP_FRIENDLY_米莉的葡萄|r
    .accept 3905 >>接任务: |cRXP_LOOT_葡萄出货单|r
    .target Milly Osworth
step
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 6,2 >>交任务: |cRXP_FRIENDLY_加瑞克·帕德弗特的赏金|r << Warrior/Rogue/Paladin
    .turnin 6,1 >>交任务: |cRXP_FRIENDLY_加瑞克·帕德弗特的赏金|r << !Warrior !Rogue !Paladin
    .target Deputy Willem
step
    #label RestandR
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 21,1 >>交任务: |cRXP_FRIENDLY_回音山清剿行动|r << Rogue
    .turnin 21,2 >>交任务: |cRXP_FRIENDLY_回音山清剿行动|r << Warrior/Paladin
    .turnin 21,3 >>交任务: |cRXP_FRIENDLY_回音山清剿行动|r << !Warrior !Paladin !Rogue
    .accept 54 >>接任务: |cRXP_LOOT_去闪金镇报到|r
    .target Marshal McBride
step << Priest/Mage
    #xprate <1.5
    #optional
    #completewith next
    .goto Elwynn Forest,49.6,41.6,15,0
    .goto Elwynn Forest,48.9,41.3,10 >>上楼
step << Priest/Mage
    #xprate <1.5
    .goto Elwynn Forest,49.471,41.586
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_尼尔斯修士|r交谈
    .turnin 3905,1 >>交任务: |cRXP_FRIENDLY_葡萄出货单|r
    .target Brother Neals
step << Priest
    #optional
    #season 2
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_女牧师安妮塔|r 交谈
    .accept 5623 >>接任务: |cRXP_LOOT_圣光的恩赐|r
    .target Priestess Anetta
step << Priest
    #season 0,1
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_女牧师安妮塔|r 交谈
    .accept 5623 >>接任务: |cRXP_LOOT_圣光的恩赐|r
    .target Priestess Anetta
step
    .goto Elwynn Forest,45.563,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法尔坎·伊森斯泰德|r交谈
    .accept 2158 >>接任务: |cRXP_LOOT_休息和放松|r
    .target Falkhaan Isenstrider
step << Rogue
    #season 2
    .goto Elwynn Forest,49.983,52.012
    >>与北境谷墙以南的|cRXP_FRIENDLY_Cutty|r交谈
    >>他会给你|T134419:0|t[|cRXP_FRIENDLY_残害符文|r]
    .collect 203990,1 -- Rune of Mutilation (1)
    .skipgossip
    .target Cutty
    .train 400094,1
step << Rogue
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[毁伤符文]|r|cRXP_WARN_来学习|r|T132304:0|t[毁伤]
    .use 203990 -- Rune of Mutilation (1)
    .target Cutty
    .train 400094,1
step << Rogue
    #season 2
    .goto Elwynn Forest,46.122,62.937,5,0
    .goto Elwynn Forest,46.175,62.124
    >>|cRXP_WARN_利用屋外的木箱, 跳上屋顶, 跑到烟囱后面|r
    >>打开|cRXP_PICK_Rusty Lockbox|r. 从中获取 |T134419:0|t|cRXP_LOOT_[屠杀符文]|r
    .collect 203993,1 -- Rune of Slaughter (1)
    .train 424992,1
step << Rogue
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[屠杀符文]|r|cRXP_WARN_来训练|r|T236280:0|t[暗影屠杀]
    .use 203993
    .itemcount 203993,1
]])


RXPGuides.RegisterGuide([[
#classic
#season 0,1
#version 1
<< Alliance
#group RestedXP 联盟 1-20级
#name 6-11 艾尔文森林
#displayname 6-13 艾尔文森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << SoD
#displayname 6-13 艾尔文森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 11-13 洛克莫丹
#defaultfor Human

step
    #season 0,1 << Rogue
    #hardcore
    #completewith next
    .subzone 87 >>前往闪金镇
step
    #hardcore
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马歇尔·杜根|r交谈
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .target Marshal Dughan
step
    #season 0,1 << Rogue
    #softcore
    #completewith Goldshire
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
    .subzoneskip 87
step << Warrior/Rogue/Paladin
    .goto Elwynn Forest,41.706,65.544
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
    >>|cRXP_WARN_这将使你制作|r|T135248:0|t[劣质磨刀石]|cRXP_WARN_, 提升你的近战伤害2点|r << Warrior/Rogue
    >>|cRXP_WARN_这将让你制作|r|T135255:0|t[劣质平衡石]|cRXP_WARN_, 使你的近战伤害提高2点|r << Paladin
    >>|cRXP_WARN_如果你不想这样做, 请跳过此步骤|r
    .train 2018 >>训练 |T136241:0|t[锻造]
    .target Smith Argus
step << Warrior
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_如果你负担得起, 可以从她那里购买一个|r|T135321:0|t[步兵剑]|r
    .collect 2488,1 --Collect Gladius (1)
    .disablecheckbox
    .target Corina Steele
--  .money <0.0536
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r|T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_如果你买得起, 就从她那里购买|r|T135641:0|t[卷刃的剑]|r
    .collect 2494,1 --Collect Stiletto (1)
    .disablecheckbox
    .target Corina Steele
--  .money <0.0400
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith GSHS
    +|cRXP_WARN_装备|r|T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Paladin
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_WARN_如果你负担得起, 就从她那里买一个|r|T133053:0|t[木槌棒]|r
    .collect 2493,1 --Collect Wooden Mallet (1)
    .disablecheckbox
    .target Corina Steele
--  .money <0.0631
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0
step << Paladin
    #completewith next
    +|cRXP_WARN_装备|r|T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0
step << Mage/Priest/Warlock
    #optional
    #completewith next
    .goto Elwynn Forest,41.706,65.786
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德温·克里顿|r交谈
    .vendor >>出售垃圾
    .target Andrew Krighton
--  .money >1.0
step
    #label Goldshire
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马歇尔·杜根|r交谈
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .target Marshal Dughan
step
    .goto Elwynn Forest,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .accept 60 >>接任务: |cRXP_LOOT_狗头人的蜡烛|r
    .target William Pestle
step
    #label GSHS
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板法雷|r交谈
    .turnin 2158,1 >>交任务: |cRXP_FRIENDLY_休息和放松|r << Rogue/Warrior
    .turnin 2158,2 >>交任务: |cRXP_FRIENDLY_休息和放松|r << !Rogue !Warrior
    .home >>将你的[炉石]设置为闪金镇
    .target Innkeeper Farley
step
    #optional
    .xp 6 >>升级至6级
step << Rogue
    .goto Elwynn Forest,43.96,65.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛葛·哈姆菲斯特|r交谈
    .vendor 151 >>|cRXP_BUY_如果你买得起, 就从他那里买|r |T135641:0|t[破损的平衡飞刀] |r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .disablecheckbox
    .target Brog Hamfist
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #optional
    #sticky
    #label BalancedDaggers1
    +|cRXP_WARN_装备|r|T135641:0|t[破损的平衡飞刀]
    .use 2946
    .itemcount 2946,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #optional
    #sticky
    #requires BalancedDaggers1
    #label DeleteOldDaggers
    .destroy 2947 >>摧毁: |cRXP_ENEMY_破损的小飞刀|r, 它在你的背包中. 不再需要它了
step << Warlock
    #optional
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >>下楼
step << Warlock
    .goto Elwynn Forest,44.392,66.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克西米利安·克洛文|r交谈
    .trainer >>训练你的职业法术
    .target Maximillian Crowe
step << Warlock
    .goto Elwynn Forest,44.397,65.989
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞琳娜·达克哈特|r交谈
    .vendor 6374 >>|cRXP_BUY_如果你买得起, 就从她那里购买|r|T133738:0|t[魔典：血契(等级 1)]|cRXP_BUY_. 如果负担不起, 可以稍后再买|r
    .target Cylina Darkheart
    .money <0.0100
    .itemcount 16321,<1 --Grimoire of Blood Pact (Rank 1)
    .train 20397,1 --Blood Pact (Rank 1)
step << Mage/Rogue/Priest
    #optional
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >>前往旅店二楼
step << Mage
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r交谈
	.target Zaldimar Wefhellt
    .goto Elwynn Forest,43.25,66.19
    .trainer >>训练你的职业法术
step << Priest
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师洁塞塔|r交谈
	.target Priestess Josetta
    .goto Elwynn Forest,43.283,65.721
    .turnin 5623 >>交任务: |cRXP_FRIENDLY_圣光的恩赐|r
    .accept 5624 >>接任务: |cRXP_LOOT_圣光之衣|r
    .trainer >>训练你的职业法术
step << Rogue
    .money <0.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞恩·塞尔留斯|r交谈
    .target Keryn Sylvius
    .goto Elwynn Forest,43.872,65.937
    .trainer >>训练你的职业法术
step << Rogue/Warrior
    .money <0.01
    .goto Elwynn Forest,43.877,66.546,9,0 << Warrior
    .goto Elwynn Forest,43.392,65.550
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_米歇尔·贝利|r交谈
    .target Michelle Belle
    .train 3273 >>训练 |T135966:0|t[急救]
step << Warrior/Rogue
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板法雷|r交谈
    .vendor 295 >>|cRXP_BUY_购买|r|T133995:0|t[达拉然奶酪]|cRXP_BUY_直到你只剩1银|r << Warrior
    .vendor 295 >>|cRXP_BUY_从他那里购买最多 20|r|T133995:0|t[达拉然奶酪]|r << Rogue
    .collect 414,20 --Dalaran Sharp (20)
    .disablecheckbox
    .target Innkeeper Farley
    .itemcount 414,<7 --Dalaran Sharp (<7)
step << Warrior
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里瑞亚·杜拉克|r交谈
    .trainer >>训练你的职业法术
    .target Lyria Du Lac
step << Paladin
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
step
    #requires DeleteOldDaggers << Rogue
    .goto Elwynn Forest,42.140,67.254
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米“两倍”|r交谈
    .accept 47 >>接任务: |cRXP_LOOT_金砂交易|r
    .target Remy "Two Times"
step << Priest
    .goto Elwynn Forest,48.148,68.046
    >>|cRXP_WARN_施放|r|T135929:0|t[治疗术(等级2)]|cRXP_WARN_和|r|T135987:0|t[真言术:坚韧], |cRXP_WARN_目标: |r|cRXP_FRIENDLY_卫兵罗伯兹|r
    .complete 5624,1 --Heal and fortify Guard Roberts
    .target Guard Roberts
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
    >>击杀|cRXP_ENEMY_石牙野猪|r. 击杀后从它们身上获取|T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    .collect 769,4,86,1 --Chunk of Boar Meat (4)
    .mob Stonetusk Boar
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
    >>击杀|cRXP_ENEMY_石牙野猪|r. 击杀后从它们身上获取|T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_这将用于提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_later 等级|r
    >>|cRXP_WARN_你需要 10|r|T133971:0|t[烹饪]|cRXP_WARN_, 稍后在奥伯丁完成任务|r
    .collect 769,10,86,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob Stonetusk Boar
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
    >>击杀|cRXP_ENEMY_石牙野猪|r. 击杀后从它们身上获取|T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_这将用于提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_later 等级|r
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪] |cRXP_WARN_, 稍后在夜色镇有一个任务|r
    >>|cRXP_WARN_现在不用特意去刷这个任务. 只需击杀并拾取你遇到的所有野猪即可|r
    .collect 769,50,86,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob Stonetusk Boar
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r和|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .accept 85 >>接任务: |cRXP_LOOT_丢失的项链|r
    .goto Elwynn Forest,34.486,84.253
    .target +"Auntie" Bernice Stonefield
    .accept 88 >>接任务: |cRXP_LOOT_公主必须死！|r
	.goto Elwynn Forest,34.660,84.482
    .target +Ma Stonefield
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone1
    #completewith NecklaceStart
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
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
    +|T136241:0|t[铁匠]|cRXP_WARN_the|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_into|r|T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[铁匠]|cRXP_WARN_的|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r|T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制成|r|T135255:0|t[劣质平衡石] << Paladin
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
    .cast 2828 >>|cRXP_WARN_在你当前的武器上使用|r|T135248:0|t[劣质磨刀石]|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_在当前武器上使用|r|T135255:0|t[劣质平衡石]|r << Paladin
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
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 击败后搜刮其掉落的|cRXP_LOOT_狗头人的蜡烛|r和|cRXP_LOOT_金砂|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    #label NecklaceStart
    .goto Elwynn Forest,43.131,85.722
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利·马科伦|r交谈
    .turnin 85 >>交任务: |cRXP_FRIENDLY_丢失的项链|r
    .accept 86 >>接任务: |cRXP_LOOT_比利的馅饼|r
    .target Billy Maclure
step
    .goto Elwynn Forest,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅贝尔·马科伦|r交谈
    .accept 106 >>接任务: |cRXP_LOOT_年轻的恋人|r
    .target Maybell Maclure
step
    #optional
    #completewith Lovers
    .goto Elwynn Forest,42.357,89.373
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒·马科伦|r交谈
    .vendor >>|cRXP_BUY_尽可能多地购买|r|T132815:0|t[冰镇牛奶]|cRXP_WARN_你能负担得起|r << Priest/Warlock/Mage
    .vendor >>|cRXP_WARN_出售垃圾|r << !Priest !Warlock !Mage
    .target Joshua Maclure
    .subzoneskip 64,1 --The Maclure Vineyards
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone2
    #completewith Lovers
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
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
    +|T136241:0|t[铁匠]|cRXP_WARN_the|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_into|r|T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[铁匠]|cRXP_WARN_的|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r|T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制成|r|T135255:0|t[劣质平衡石] << Paladin
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
    .cast 2828 >>|cRXP_WARN_在你当前的武器上使用|r|T135248:0|t[劣质磨刀石]|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_在当前武器上使用|r|T135255:0|t[劣质平衡石]|r << Paladin
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
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 击败后搜刮其掉落的|cRXP_LOOT_狗头人的蜡烛|r和|cRXP_LOOT_金砂|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    #label Lovers
    .goto Elwynn Forest,29.840,85.997
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托米·乔·斯通菲尔德|r交谈
    .turnin 106 >>交任务: |cRXP_FRIENDLY_年轻的恋人|r
    .accept 111 >>接任务: |cRXP_LOOT_托米的祖母|r
    .target Tommy Joe Stonefield
step
    #requires BoarMeatQuest
    #label Pie
    .goto Elwynn Forest,34.486,84.253
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    .turnin 86 >>交任务: |cRXP_FRIENDLY_比利的馅饼|r
    .accept 84 >>接任务: |cRXP_LOOT_比利的馅饼|r
    .target "Auntie" Bernice Stonefield
step
    .goto 1429,34.945,83.855
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莱德·斯通菲尔德|r对话, 她在里面
    .turnin 111 >>交任务: |cRXP_FRIENDLY_托米的祖母|r
    .accept 107 >>接任务: |cRXP_LOOT_给威廉·匹斯特的信|r
    .target Gramma Stonefield
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone3
    #completewith Exchange
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
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
    +|T136241:0|t[铁匠]|cRXP_WARN_the|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_into|r|T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[铁匠]|cRXP_WARN_的|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r|T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制成|r|T135255:0|t[劣质平衡石] << Paladin
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
    .cast 2828 >>|cRXP_WARN_在你当前的武器上使用|r|T135248:0|t[劣质磨刀石]|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_在当前武器上使用|r|T135255:0|t[劣质平衡石]|r << Paladin
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
    >>击杀|cRXP_ENEMY_狗头人矿工|r和|cRXP_ENEMY_狗头人隧道工|r. 击败他们后搜刮出 |T134168:0|t|cRXP_LOOT_[被斩首的狗头人头颅]|r
    >>|cRXP_WARN_这是你需要解锁的三件物品之一, 用于稍后到达暴风城时使用 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]|r
    .collect 204476,1 -- Severed Kobold Head (1)
    .mob Kobold Tunneler
    .mob Kobold Miner
    .mob Goldtooth
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
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_狗头人矿工|r和|cRXP_ENEMY_狗头人隧道工|r. 击杀他们以获取|T134327:0|t|cRXP_LOOT_[右上角地图碎片]|r
    >>|cRXP_WARN_你必须|r|T132320:0|t[潜行]|cRXP_WARN_才能使用|r|T133644:0|t[扒窃]
    .collect 203784,1 -- Top-Right Map Piece (1)
    .mob Kobold Miner
    .mob Kobold Tunneler
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
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 击败后搜刮其掉落的|cRXP_LOOT_狗头人的蜡烛|r和|cRXP_LOOT_金砂|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    .goto Elwynn Forest,43.131,85.722
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利·马科伦|r交谈
    .turnin 84 >>交任务: |cRXP_FRIENDLY_比利的馅饼|r
    .accept 87 >>接任务: |cRXP_LOOT_金牙|r
    .target Billy Maclure
step
    .goto Elwynn Forest,39.01,82.20,15,0
    .goto Elwynn Forest,39.92,80.11
    >>进入法戈迪普矿井中较大的开放区域之一
    .complete 62,1 --Scout Through the Fargodeep Mine
step
    #season 0,1
    .goto 1429,41.732,78.024
    >>击杀|cRXP_ENEMY_金牙|r. 击败他后搜刮出|cRXP_LOOT_伯妮丝的项链|r
    >>|cRXP_WARN_注意, 他通常会带着旁边的|cRXP_ENEMY_狗头人矿工|r一起拉怪|r
    .complete 87,1 --Bernice's Necklace (1)
    .mob Goldtooth
step
    #season 2
    .goto 1429,41.732,78.024
    >>击杀|cRXP_ENEMY_金牙|r. 击败他后搜刮出|cRXP_LOOT_伯妮丝的项链|r << !Warrior !Priest
    >>击杀|cRXP_ENEMY_金牙|r. 搜刮其尸体获得|cRXP_LOOT_伯妮丝的项链|r 和 |T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r << Warrior
    >>击杀|cRXP_ENEMY_金牙|r. 击败他后搜刮|cRXP_LOOT_伯妮丝的项链|r 和 |T136222:0|t|cRXP_LOOT_[记忆：黑暗目的]|r << Priest
    >>|cRXP_WARN_注意, 他通常会带着旁边的|cRXP_ENEMY_狗头人矿工|r一起拉怪|r
    .complete 87,1 --Bernice's Necklace (1)
    .collect 204809,1 << Warrior -- Rune of Furious Thunder (1)
    .collect 205940,1 << Priest -- Memory of a Dark Purpose (1)
    .mob Goldtooth
    .train 403476,1 << Warrior
    .train 425216,1 << Priest
step << Warrior
    #season 2
    #sticky
    #label GoldtoothRune
    .train 403476 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r|cRXP_WARN_来学习|r|T136048:0|t[狂暴雷霆]
    .use 204809
    .itemcount 204809,1
step << Priest
    #season 2
    #sticky
    #label GoldtoothRune
    >>|cRXP_WARN_你必须在北郡修道院或暴风城大教堂等神圣区域输入 /kneel, 才能获得[冥想]|r|T135934:0|t|T136057:0|t|cRXP_WARN_buff|r
    .train 425216 >>|cRXP_WARN_使用|r|T136222:0|t|cRXP_LOOT_[黑暗目的的记忆]|r|cRXP_WARN_来学习|r|T237514:0|t[虚空瘟疫]
    .use 205940
step << Warrior
    #optional
    #completewith Exchange
    +|cRXP_WARN_尝试从现在起保存一个|r|T134829:0|t[初级治疗药水]|cRXP_WARN_, 因为你稍后需要用它来处理罗尔夫的尸体|r
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
    .xp 7+1800 >>升级至1800/4500经验值 << !Priest
    .xp 7+1460 >>升级至1460/4500经验值 << Priest
    .mob Kobold Tunneler
    .mob Kobold Miner
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
    .xp 7+1770 >>升级至1770点/4500经验值 << !Priest
    .xp 7+1260 >>升级至1260+/4500经验值 << Priest
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    #xprate <1.5
    #label Goldtooth
    .goto Elwynn Forest,34.486,84.253
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    .turnin 87 >>交任务: |cRXP_FRIENDLY_金牙|r
    .target "Auntie" Bernice Stonefield
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
    .goto Elwynn Forest,39.30,60.48,30 >>|cRXP_WARN_跳到洞穴内的碎纸机和漂浮的原木和箱子或矿车灯上. 通过登出再重新登录的方式完成登出跳过|r
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
    >>击杀|cRXP_ENEMY_石牙野猪|r. 击杀后从它们身上获取|T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob Stonetusk Boar
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
    >>击杀|cRXP_ENEMY_石牙野猪|r. 击杀后从它们身上获取|T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_现在不用特意去刷这个任务. 只需击杀并拾取你遇到的所有野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob Stonetusk Boar
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 57 --Fargodeep Mine
step
    #hardcore
    #optional
    #completewith Exchange
    .goto Elwynn Forest,42.140,67.254,125 >>返回闪金镇
    .subzoneskip 87 --Goldshire
step
    #softcore
    #completewith Exchange
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step
    #label Exchange
    .goto Elwynn Forest,42.140,67.254
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米“两倍”|r交谈
    >>|cRXP_WARN_不要出售|r|T133581:0|t[弹子球]|cRXP_WARN_reward. 这是一个极其珍贵的物品, 一直用到60级都非常有价值|r
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
    .accept 40 >>接任务: |cRXP_LOOT_鱼人的威胁|r
    .target Remy "Two Times"
step << Priest
    #season 2
    #optional
    #completewith GoldshireEnd
    +|cRXP_WARN_如果可能的话, 在闪金镇找一位牧师, 他身上带有其他|r|T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buffs|r
    >>|cRXP_WARN_输入 /kneel, 然后让另一位牧师在你跪下时使用 /pray 指向你, 即可获得他们的|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buffs, 该增益效果稍后可以使用|r
step
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
    .turnin 40 >>交任务: |cRXP_FRIENDLY_鱼人的威胁|r
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
    .target Marshal Dughan
step
    #optional << Warrior/Rogue/Paladin
    #completewith CandlesEnd
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor >>出售垃圾
    .target Corina Steele
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>3.3 << Rogue
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>3.8 << Warrior
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>5.0 << Paladin
step << Warrior
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_如果你负担得起, 可以从她那里购买一个|r|T135321:0|t[步兵剑]|r
    .collect 2488,1 --Collect Gladius (1)
    .disablecheckbox
--  .money <0.0536
    .target Corina Steele
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior
    #completewith CandlesEnd
    +|cRXP_WARN_装备|r|T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_如果你买得起, 就从她那里购买|r|T135641:0|t[卷刃的剑]|r
    .collect 2494,1 --Collect Stiletto (1)
    .disablecheckbox
    .target Corina Steele
--   .money <0.0400
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith CandlesEnd
    +|cRXP_WARN_装备|r|T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Paladin
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_如果你负担得起, 就从她那里买一个|r|T133053:0|t[木槌棒]|r
    .collect 2493,1 --Collect Wooden Mallet (1)
    .disablecheckbox
    .target Corina Steele
--  .money <0.0631
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0
step << Paladin
    #completewith CandlesEnd
    +|cRXP_WARN_装备|r|T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0
step << Paladin
    #season 2
    #xprate >1.59
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    >>|cRXP_WARN_训练|r|T135949:0|t[净化]|cRXP_WARN_以获得|r|T133815:0|t[刻印胸甲 - 神盾]|cRXP_WARN_即将解锁|r
    .train 1152 >>训练 |T135949:0|t[净化]
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
step << Paladin
    #season 0,1
    #xprate >1.59
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
step << Warrior
    #xprate >1.59
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里瑞亚·杜拉克|r交谈
    .trainer >>训练你的职业法术
    .target Lyria Du Lac
step
    #label CandlesEnd
    #requires GoldtoothRune << Warrior/Priest --Season 2
    .goto Elwynn Forest,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .turnin 60 >>交任务: |cRXP_FRIENDLY_狗头人的蜡烛|r
    .accept 61 >>接任务: |cRXP_LOOT_送往暴风城的货物|r
    .turnin 107 >>交任务: |cRXP_FRIENDLY_给威廉·匹斯特的信|r
    .accept 112 >>接任务: |cRXP_LOOT_收集海藻|r
    .target William Pestle
step
    #xprate <1.5
    #optional
    .xp 8 >>升级至8级
step << Warrior
    #xprate <1.59
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里瑞亚·杜拉克|r交谈
    .trainer >>训练你的职业法术
    .target Lyria Du Lac
step << Paladin
    #season 2
    #xprate <1.59
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    >>|cRXP_WARN_训练|r|T135949:0|t[净化]|cRXP_WARN_以获得|r|T133815:0|t[刻印胸甲 - 神盾]|cRXP_WARN_即将解锁|r
    .train 1152 >>训练 |T135949:0|t[净化]
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
step << Paladin
    #season 0,1
    #xprate <1.59
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
step << Warlock
    #optional
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >>前往旅店一楼
step << Warlock
    .goto Elwynn Forest,44.392,66.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克西米利安·克洛文|r交谈
    .target Maximillian Crowe
    .trainer >>训练你的职业法术
step << Warlock
    .goto Elwynn Forest,44.397,65.989
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞琳娜·达克哈特|r交谈
    .vendor >>|cRXP_BUY_如果你买得起, 就从她那里购买|r|T133738:0|t[魔典：火焰箭(等级 2)]|cRXP_BUY_. 如果买不起, 可以稍后再买|r
    .target Cylina Darkheart
    .money <0.100
    .itemcount 16302,<1 --Grimoire of Blood Pact (Rank 1)
    .train 20270,1 --Blood Pact (Rank 1)
step << Mage/Priest/Rogue/Warrior/Paladin
    #optional
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >>前往旅店二楼
step << Mage
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r交谈
	.target Zaldimar Wefhellt
    .goto Elwynn Forest,43.25,66.19
    .trainer >>训练你的职业法术
step << Priest
    .goto Elwynn Forest,43.283,65.721
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师洁塞塔|r交谈
	.target Priestess Josetta
    .turnin 5624 >>交任务: |cRXP_FRIENDLY_圣光之衣|r
    .trainer >>训练你的职业法术
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞恩·塞尔留斯|r交谈
    .target Keryn Sylvius
    .goto Elwynn Forest,43.872,65.937
    .trainer >>训练你的职业法术
step << Rogue/Warrior/Paladin
    .money <0.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米歇尔·贝利|r交谈
    .target Michelle Belle
    .goto Elwynn Forest,43.392,65.550
    .train 3273 >>训练 |T135966:0|t[急救]
step
    #label GoldshireEnd << Priest --Season 2
    .goto Elwynn Forest,43.96,65.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛葛·哈姆菲斯特|r交谈
    .vendor >>|cRXP_WARN_如果需要, 请购买|r |T133634:0|t[棕色小袋] |r
	.target Brog Hamfist
    .money <0.1250
step
    #completewith next
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板法雷|r交谈
    .vendor >>|cRXP_BUY_如果你买得起, 最多可从他那里购买20|r|T132815:0|t[冰镇牛奶]|r << !Warrior !Rogue !Paladin
    .vendor >>|cRXP_BUY_如果你负担得起, 最多可从他那里购买 20|r|T133995:0|t[达拉然奶酪]|r << Warrior/Rogue
    .vendor >>|cRXP_BUY_如果你负担得起, 最多可以从他那里购买10|r |T133995:0|t[达拉然奶酪] |cRXP_BUY_和10|r |T132815:0|t[冰镇牛奶] |r << Paladin
    .target Innkeeper Farley
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
    >>击杀|cRXP_ENEMY_鱼人|r和|cRXP_ENEMY_鱼人士兵|r. 从他们身上搜刮出 |T134169:0|t|cRXP_LOOT_[鱼人的头颅]|r
    >>|cRXP_WARN_这是你需要的三件物品之一, 用于在等级达到10级前往暴风城时解锁|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]|r
    .collect 204477,1 -- Severed Murloc Head (1)
    .mob Murloc Streamrunner
	.mob Murloc
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
    >>|T133644:0|t[劫掠]|cRXP_ENEMY_鱼人蒸汽跑者|r和|cRXP_ENEMY_鱼人|r. 击杀他们以获取 |T134269:0|t|cRXP_LOOT_[右下角地图碎片]|r
    >>|cRXP_WARN_你必须|r|T132320:0|t[潜行]|cRXP_WARN_才能使用|r|T133644:0|t[扒窃]
--   >>|cRXP_WARN_注意:这也可能来自艾尔文森林中的任何其他|cRXP_ENEMY_鱼人|r|r
    .collect 203786,1 -- Bottom-Right Map Piece (1)
    .mob Murloc Streamrunner
    .mob Murloc
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
    >>击杀|cRXP_ENEMY_恶臭狼|r. 掠夺它们, 获取其掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob Mangy Wolf
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
    >>击杀|cRXP_ENEMY_恶臭狼|r. 掠夺它们, 获取其掉落的 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只需击杀并拾取你遇到的所有狼即可|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob Mangy Wolf
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
    >>击杀|cRXP_ENEMY_鱼人|r和|cRXP_ENEMY_鱼人士兵|r. 击杀后可掠夺出|cRXP_LOOT_水晶藻叶|r
    .complete 112,1 --Collect Crystal Kelp Frond (x4)
	.mob Murloc
	.mob Murloc Streamrunner
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone4
    #completewith JasperlodeExplore
    >>击杀|cRXP_ENEMY_狗头人矿工|r. 打开|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
    .collect 2835,1 --Rough Stone (1+)
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .itemcount 2862,<1 << Rogue/Warrior --Rough Sharpening Stone (<1)
    .itemcount 3239,<1 << Paladin --Rough Weightstone (<1)
    .train 2018,3 --Blacksmithing Trained
    .mob Kobold Miner
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStone4
    #label RoughStoneCraft4
    #completewith JasperlodeExplore
    +|T136241:0|t[铁匠]|cRXP_WARN_the|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_into|r|T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[铁匠]|cRXP_WARN_的|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r|T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制成|r|T135255:0|t[劣质平衡石] << Paladin
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
    .cast 2828 >>|cRXP_WARN_在你当前的武器上使用|r|T135248:0|t[劣质磨刀石]|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_在当前武器上使用|r|T135255:0|t[劣质平衡石]|r << Paladin
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
    .goto Elwynn Forest,61.654,53.608,15 >>进入青金石矿洞
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
    >>击杀|cRXP_ENEMY_狗头人地卜师|r. 从他们身上搜取 |T134939:0|t|cRXP_LOOT_[法术笔记:米尔金·瓦尔夫]|r
    .collect 203752,1
    .mob Kobold Geomancer
    .train 401768,1
step
    #label JasperlodeExplore
    .goto Elwynn Forest,61.20,51.46,15,0
    .goto Elwynn Forest,60.72,50.85,15,0
    .goto Elwynn Forest,60.39,50.16
    >>沿着中间的路径前往贾斯珀洛德矿洞探索
    .complete 76,1 --Scout through the Jasperlode Mine
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone5
    #completewith Find
    >>击杀|cRXP_ENEMY_狗头人矿工|r. 打开|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
    .collect 2835,1 --Rough Stone (1+)
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .itemcount 2862,<1 << Rogue/Warrior --Rough Sharpening Stone (<1)
    .itemcount 3239,<1 << Paladin --Rough Weightstone (<1)
    .train 2018,3 --Blacksmithing Trained
    .mob Kobold Miner
    .subzoneskip 54,1
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStone5
    #label RoughStoneCraft5
    #completewith Find
    +|T136241:0|t[铁匠]|cRXP_WARN_the|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_into|r|T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[铁匠]|cRXP_WARN_的|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r|T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制成|r|T135255:0|t[劣质平衡石] << Paladin
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
    .cast 2828 >>|cRXP_WARN_在你当前的武器上使用|r|T135248:0|t[劣质磨刀石]|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_在当前武器上使用|r|T135255:0|t[劣质平衡石]|r << Paladin
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
    .cast 1152 >>|cRXP_WARN_对里面的|cRXP_FRIENDLY_受伤的冒险者|r施放|r|T135949:0|t[净化]|r
    .target Wounded Adventurer
    .train 425619,1
    .train 1152,3 --Purify Trained
step << Paladin
    #season 2
    .goto Elwynn Forest,61.97,47.31
    >>|cRXP_WARN_与|cRXP_FRIENDLY_受伤的冒险者|r交谈, 并对他施放|r|T135949:0|t[净化]|cRXP_WARN_后, 即可获得|r|T134419:0|t[庇护符文]|r
    .collect 205685,1 --Rune of Aegis (1)
    .target Wounded Adventurer
    .skipgossip
    .train 425619,1
    .train 1152,3 --Purify Trained
--XX gossipoption 109556
step << Paladin
    #season 2
    #completewith Find
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[护盾符文]|cRXP_WARN_来学习|r|T133815:0|t[刻印胸甲 - 护盾]
    .use 205685
    .itemcount 205685,1 --Rune of Aegis (1)
    .train 425619,1
    .train 1152,3 --Purify Trained
step << Mage
    #season 2
    #requires JasperlodeRune
    #completewith Find
    .train 401768 >>|cRXP_WARN_使用|r|T134939:0|t|cRXP_LOOT_[法术笔记:MILEGIN VALF]|r|cRXP_WARN_来学习|r|T135820:0|t[活体之焰]
    .use 203752
step
    #optional
    #label ExitJasperlode
    #completewith Find
    .goto 1429,61.820,53.871,15 >>离开贾斯珀洛德矿井
    .subzoneskip 54,1
step
    #optional
    #requires ExitJasperlode
    #label WolfMeatCooking2
    #completewith Find
    .goto 1429,69.348,67.452,0
    .goto 1429,67.244,63.880,0
    .goto 1429,63.748,64.710,0
    >>击杀|cRXP_ENEMY_Gray Forest Wolves|r. 击败后可获得其掉落物:|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob Gray Forest Wolf
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires WolfMeatCooking2
    #completewith Find
    .goto 1429,69.348,67.452,0
    .goto 1429,67.244,63.880,0
    .goto 1429,63.748,64.710,0
    >>击杀|cRXP_ENEMY_Gray Forest Wolves|r. 击败后可获得其掉落物:|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只需击杀并拾取你遇到的所有狼即可|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob Gray Forest Wolf
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #optional
    #completewith Find
    +|cRXP_WARN_引诱|cRXP_ENEMY_森林熊幼崽|r向|cRXP_FRIENDLY_卫兵托马斯|r方向移动|r
    >>|cRXP_WARN_在|cRXP_ENEMY_森林熊幼崽|r被|cRXP_FRIENDLY_暴风城卫兵|r杀死之前, 尝试与|cRXP_FRIENDLY_卫兵托马斯|r交谈, 以便暴风城卫兵获得任务奖励|r
    >>|cRXP_WARN_确保造成51%以上的伤害才能获得奖励|r
    .mob Young Forest Bear
step
    #label Find
    #requires JasperlodeRune << Mage --Season 2
    .goto Elwynn Forest,73.973,72.179
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵托马斯|r交谈
    .turnin 35 >>交任务: |cRXP_FRIENDLY_卫兵托马斯|r
    .accept 37 >>接任务: |cRXP_LOOT_失踪的卫兵|r
    .accept 52 >>接任务: |cRXP_LOOT_保卫边境|r
    .target Guard Thomas
step << Rogue/Priest
    #season 2
    #completewith LostGuards
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    >>|cRXP_WARN_优先击杀你看到的任何|cRXP_ENEMY_森林熊幼崽|r|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +Prowler
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +Young Forest Bear
step
    #season 0,1 << Rogue/Priest
    #completewith AcceptBundle
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    >>|cRXP_WARN_优先击杀你看到的任何|cRXP_ENEMY_森林熊幼崽|r|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +Prowler
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +Young Forest Bear
step
    #optional
    #label WolfMeatCooking3
    #completewith LostGuards
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀|cRXP_ENEMY_灰林狼|r和|cRXP_ENEMY_觅食的灰狼|r. 击杀后掠夺其 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob Gray Forest Wolf
    .mob Prowler
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires WolfMeatCooking3
    #completewith LostGuards
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀|cRXP_ENEMY_灰林狼|r和|cRXP_ENEMY_觅食的灰狼|r. 击杀后掠夺其 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只需击杀并拾取你遇到的所有狼即可|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob Gray Forest Wolf
    .mob Prowler
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #label LostGuards
    .goto Elwynn Forest,72.656,60.334
    >>点击地面上的|cRXP_PICK_被吃掉一半的尸体|r
    .turnin 37 >>交任务: |cRXP_FRIENDLY_失踪的卫兵|r
    .accept 45 >>接任务: |cRXP_LOOT_罗尔夫的下落|r
step
    #optional
    #label WolfMeatCooking4
    #completewith AcceptBundle
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r. 击败他们后搜刮出 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob Prowler
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 88 --Eastvale Logging Camp
step
    #optional
    #requires WolfMeatCooking4
    #completewith AcceptBundle
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r. 击败他们后搜刮出 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只需击杀并拾取你遇到的所有狼即可|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob Prowler
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 88 --Eastvale Logging Camp
step
    #label AcceptBundle
    .goto Elwynn Forest,81.382,66.112
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员莱琳|r交谈
    .accept 5545 >>接任务: |cRXP_LOOT_木材危机|r
    .target Supervisor Raelen
step
    #season 0,1 << Rogue
    #optional
    .goto Elwynn Forest,83.283,66.089
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉里克·费恩|r交谈
    .vendor >>出售垃圾
    .target Rallic Finn
    .subzoneskip 88,1
step
    #optional
    #label WolfMeatCooking5
    #completewith Prowlers
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r. 击败他们后搜刮出 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只需击杀并拾取你遇到的所有狼即可|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob Prowler
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 86 --Stone Cairn Lake
step
    #optional
    #requires WolfMeatCooking5
    #completewith Prowlers
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r. 击败他们后搜刮出 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只需击杀并拾取你遇到的所有狼即可|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob Prowler
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 86 --Stone Cairn Lake
step
    #completewith Prowlers
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    >>|cRXP_WARN_优先击杀你看到的任何|cRXP_ENEMY_森林熊幼崽|r|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +Prowler
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +Young Forest Bear
    .subzoneskip 86 --Stone Cairn Lake
step
    #completewith next
    .goto Elwynn Forest,80.48,55.18,0
    .goto Elwynn Forest,80.15,60.03,0
    .goto Elwynn Forest,83.48,59.19,0
    >>在树根处的地面上拾取|cRXP_LOOT_木材捆|r
    .complete 5545,1 -- Bundle of Wood (8)
step << Paladin
    #softcore
    #label Prowlers
    .goto Elwynn Forest,79.80,55.50
    >>|cRXP_WARN_跑到|cRXP_PICK_罗尔夫的尸体|r上, 然后施放|T135954:0 |t[神圣庇护]|cRXP_WARN_, 接着立即点击|r|cRXP_PICK_罗尔夫的尸体|r|r
    >>|cRXP_WARN_完成任务后逃跑并重置|cRXP_ENEMY_鱼人|r|r
    .turnin 45 >>交任务: |cRXP_FRIENDLY_罗尔夫的下落|r
    .accept 71 >>接任务: |cRXP_LOOT_回复托马斯|r
step << Paladin
    #hardcore
    #label Prowlers
    .goto Elwynn Forest,79.80,55.50
    >>点击地面上的|cRXP_PICK_罗尔夫的尸体|r
    >>|cRXP_WARN_小心, |cRXP_ENEMY_鱼人强盗|r会施放|r|T135915:0|t[饮用小型药水]|cRXP_WARN_, 为自己恢复61-68点生命值|r
    >>|cRXP_WARN_拉出位于小屋前方的2|r|cRXP_ENEMY_鱼人|r|cRXP_WARN_, 然后后退并快速击杀其中一人. 根据需要使用|r|T135954:0|t[神圣保护]|cRXP_WARN_和治疗技能. 这是使用|r|T133581:0|t[弹子球]|cRXP_WARN_的好机会. 击杀一人后立即撤退并重置|r << Paladin
    >>|cRXP_WARN_记住, 在|r|T135954:0|t[神圣保护]|cRXP_WARN_期间你无法攻击|r << Paladin
    .turnin 45 >>交任务: |cRXP_FRIENDLY_罗尔夫的下落|r
    .accept 71 >>接任务: |cRXP_LOOT_回复托马斯|r
step << !Paladin
    #label Prowlers
    .goto Elwynn Forest,79.80,55.50
    >>点击地面上的|cRXP_PICK_罗尔夫的尸体|r
    >>|cRXP_WARN_小心, |cRXP_ENEMY_鱼人强盗|r会施放|r|T135915:0|t[饮用小型药水]|cRXP_WARN_, 为自己恢复61-68点生命值|r
    >>|cRXP_WARN_施放|r|T135953:0|t[治疗之触] |cRXP_WARN_和|r|T135940:0|t[神圣之言:护盾] |cRXP_WARN_然后补满法力. 将2只|cRXP_ENEMY_鱼人|r拉到小屋前, 拉开距离, 随后对其中一只使用大招. 击杀一只后立即逃跑, 再处理另一只|r << Priest
    >>|cRXP_WARN_拉出位于小屋前的2|r|cRXP_ENEMY_鱼人|r|cRXP_WARN_, 移动到安全位置后, 对其中一个施放|r|T136071:0|t[变形术] |cRXP_WARN_, 同时击杀另一个. 等|r|T136071:0|t[被变形] |cRXP_WARN_的那个敌人被击杀后再处理剩余的一个|r << Mage
    >>|cRXP_WARN_100怒气拉怪. 将2个|r|cRXP_ENEMY_鱼人|r|cRXP_WARN_拉到小屋前, 拉开距离并保持|r|T132316:0|t[断筋]|cRXP_WARN_对其中一个施加控制, 同时击杀另一个. 击杀时对当前目标使用|r|T133581:0|t[弹子球]|cRXP_WARN_. 击杀一个后, 跑开并用|r|T132316:0|t[断筋]|cRXP_WARN_重新拉住被风筝的那个|r << Warrior
    >>|cRXP_WARN_拉出位于小屋前的2|r|cRXP_ENEMY_鱼人|r|cRXP_WARN_, 然后远离并集中击杀其中一只. 当它们都对你发起攻击时, 使用|r|T136205:0|t[闪避]|cRXP_WARN_. 这是使用|r|T133581:0|t[弹子球]|cRXP_WARN_的好机会. 击杀其中一只后, 立即逃跑并重置任务|r << Rogue
    >>|cRXP_WARN_拉出位于小屋前的2|r|cRXP_ENEMY_鱼人|r|cRXP_WARN_, 然后远离并持续对其中一人施放|r|T136183:0|t[恐惧]|cRXP_WARN_, 同时尽量保持对两者都施加Dot伤害|r << Warlock
    .turnin 45 >>交任务: |cRXP_FRIENDLY_罗尔夫的下落|r
    .accept 71 >>接任务: |cRXP_LOOT_回复托马斯|r
step
    #optional
    #label WolfMeatCooking6
    #completewith BundleOT
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r. 击败他们后搜刮出 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob Prowler
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires WolfMeatCooking6
    #completewith BundleOT
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r. 击败他们后搜刮出 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只需击杀并拾取你遇到的所有狼即可|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob Prowler
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #completewith BundleOT
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    >>|cRXP_WARN_优先击杀你看到的任何|cRXP_ENEMY_森林熊幼崽|r|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +Prowler
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +Young Forest Bear
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
    >>在树根处的地面上拾取|cRXP_LOOT_木材捆|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    #label BundleOT
    .goto Elwynn Forest,81.382,66.112
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员莱琳|r交谈
    .turnin 5545 >>交任务: |cRXP_FRIENDLY_木材危机|r
    .target Supervisor Raelen
step << skip --Paladin
    #xprate >1.59
    #optional
    .goto Elwynn Forest,79.457,68.789
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .accept 83 >>接任务: |cRXP_LOOT_红色亚麻布|r
    .target Sara Timberlain
    .itemcount 2589,<10 --Linen Cloth (<10)
step
    #xprate <1.5 << !Warlock
    .goto Elwynn Forest,79.457,68.789
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .accept 83 >>接任务: |cRXP_LOOT_红色亚麻布|r
    .target Sara Timberlain
step
    #optional
    #label WolfMeatCooking7
    #completewith DeliverStart
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r. 击败他们后搜刮出 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob Prowler
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires WolfMeatCooking7
    #completewith DeliverStart
    .goto 1429,73.679,67.978,0
    .goto 1429,72.275,65.278,0
    .goto 1429,71.605,61.294,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r. 击败他们后搜刮出 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只需击杀并拾取你遇到的所有狼即可|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob Prowler
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
    .mob +Prowler
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +Young Forest Bear
step
    #label DeliverStart
    .goto Elwynn Forest,73.973,72.179
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵托马斯|r交谈
    .turnin 52 >>交任务: |cRXP_FRIENDLY_保卫边境|r
    .turnin 71 >>交任务: |cRXP_FRIENDLY_回复托马斯|r
    .accept 39 >>接任务: |cRXP_LOOT_托马斯的报告|r
    .target Guard Thomas
step
    #xprate >1.49
    #completewith Level9Grind << Warlock/Warrior/Rogue
    #completewith PrincessC << !Warlock !Warrior !Rogue
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 掠夺他们以获得 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r]
    .use 1972>>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] 开始任务|r
    >>|cRXP_WARN_|r|T134939:0|t[|cRXP_LOOT_西部荒野地契|r]|cRXP_WARN_是一个非常稀有的掉落物品. 如果你没有获得它, 请跳过此步骤|r
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >>接任务: |cRXP_LOOT_法布隆的地契|r
step
    #xprate <1.5
    #completewith Level9Grind << Warlock/Warrior/Rogue
    #completewith DefiasBandits << !Warlock !Warrior !Rogue
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 掠夺他们以获得 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r]
    .use 1972>>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] 开始任务|r
    >>|cRXP_WARN_|r|T134939:0|t[|cRXP_LOOT_西部荒野地契|r]|cRXP_WARN_是一个非常稀有的掉落物品. 如果你没有获得它, 请跳过此步骤|r
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >>接任务: |cRXP_LOOT_法布隆的地契|r
step << skip --Paladin
    #xprate >1.59
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 搜刮他们以获得|cRXP_LOOT_红色亚麻面罩|r和|T132889:0 |t[亚麻布]
    >>|cRXP_WARN_保存|r|T132889:0|t[亚麻布]|cRXP_WARN_以备后续任务使用|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .collect 2589,10,1644,1 --Linen Cloth (10)
    .disablecheckbox
    .mob Defias Bandit
    .isOnQuest 83
step
    #xprate <1.5 << !Warlock
    #completewith next
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 击杀后掠夺他们的|cRXP_LOOT_红色亚麻面罩|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .mob Defias Bandit
    .isOnQuest 83
step
    #label PrincessC
    .goto Elwynn Forest,69.3,79.0
    >>击杀|cRXP_ENEMY_公主|r. 搜刮她的|cRXP_LOOT_项圈|r
    >>|cRXP_ENEMY_公主|r|cRXP_WARN_将与她的|r|cRXP_ENEMY_公主的随从同时触发仇恨|r
    >>|cRXP_ENEMY_公主|r|cRXP_WARN_也会施放|r|T132368:0|t[冲锋]|cRXP_WARN_, 造成大量伤害|r
    >>|cRXP_WARN_交战前积攒100点怒气|r |cRXP_ENEMY_公主|r << Warrior
    >>|cRXP_WARN_请确保 |T136205:0|t[闪避]|cRXP_WARN_已就绪. 如果你遇到困难, 可以使用带有投掷武器的栅栏来利用路径机制并争取时间|r << Rogue
    >>|cRXP_WARN_准备好使用|r|T134830:0|t[次级治疗药水]
    .link https://www.youtube.com/watch?v=GRrXOV-UvD4 >>|cRXP_WARN_点击此处查看视频参考|r << !Warrior
    .complete 88,1 --Collect Brass Collar (x1)
    .mob Princess
step << Rogue
    #season 2
    .goto Elwynn Forest,67.4,78.6,60,0
    .goto Elwynn Forest,70.8,79.8,60,0
    .goto Elwynn Forest,89.2,78.8
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_Defias|r. 击杀后搜刮, 获取 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_WARN_注意:这也可能来自艾尔文森林中的任何其他|cRXP_ENEMY_Defias|r成员|r
    .collect 203785,1 -- Top-Left Map Piece (1)
    .mob Defias Bandit
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
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 击杀后掠夺他们的|cRXP_LOOT_红色亚麻面罩|r
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 搜刮他们以获得|cRXP_LOOT_红色亚麻面罩|r和|T132889:0 |t[亚麻布]
    >>|cRXP_WARN_保存|r|T132889:0|t[亚麻布]|cRXP_WARN_以备后续任务使用|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .collect 2589,10,1644,1 --Linen Cloth (10)
    .disablecheckbox
    .mob Defias Bandit
    .isOnQuest 83
step
    #completewith Level9Grind << Warlock
    #xprate <1.5 << !Warlock
    #label DefiasBandits
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 击杀后掠夺他们的|cRXP_LOOT_红色亚麻面罩|r
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
    .mob Defias Bandit
    .isOnQuest 83
step << Warlock/Warrior/Rogue
    #xprate <1.5
    #label Level9Grind
	.goto Elwynn Forest,69.53,79.47
    .xp 9+3510 >>升级至3510+/6500经验值 << Warlock
    .xp 9+3420 >>升级至3420+/6500经验值 << Warrior/Rogue
step << Warlock/Warrior/Rogue
    #xprate >1.49
    #optional
    #label Level9Grind
	.goto Elwynn Forest,69.53,79.47
    .xp 9+2015 >>升级至2015+/6500经验值 << Warlock
    .xp 9+3050 >>刷到3050+/6500经验值 << Warrior/Rogue
--XX Warlock and Warrior
step << Rogue
    #season 2
    .cast 401847 >>|cRXP_WARN_使用任意|r|T134327:0|t[|cRXP_LOOT_地图碎片]|r|cRXP_WARN_将其合成|r|T134269:0|t[|cRXP_LOOT_艾尔文森林藏宝图|r]
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
    .cast 401617 >>|cRXP_WARN_使用|r|T134269:0|t[|cRXP_LOOT_艾尔文森林藏宝图|r]|cRXP_WARN_在箭头指示的位置. 这将触发一个 |cRXP_PICK_隐藏宝藏|r出现|r
    .use 203750
    .itemcount 203750,1
    .train 398196,1
step << Rogue
    #season 2
    .goto Elwynn Forest,80.365,79.134
    >>打开|cRXP_PICK_Buried Treasure|r. 从中获取 |T134419:0|t[|cRXP_FRIENDLY_迅捷符文|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
step << Rogue
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_迅捷拔枪符文|r]|cRXP_WARN_来训练|r|T134536:0|t[迅捷拔枪]
    .use 203991
    .itemcount 203991,1
step << !Warlock
    #season 0,1 << Rogue
    #softcore
    #label EVDeathskip
    #completewith RedridgeS
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
    .zoneskip Redridge Mountains
--XX not worth deathskipping as a warlock due to having to resumm pet
step << skip --Paladin
    #xprate >1.59
    #optional
    .goto Elwynn Forest,79.457,68.789
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .turnin 83 >>交任务: |cRXP_FRIENDLY_红色亚麻布|r
    .target Sara Timberlain
    .isQuestComplete 83
step
    #xprate <1.5 << !Warlock
    #optional << Warlock
    .goto Elwynn Forest,79.457,68.789
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .turnin 83 >>交任务: |cRXP_FRIENDLY_红色亚麻布|r
    .target Sara Timberlain
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
    >>击杀|cRXP_ENEMY_觅食的灰狼|r. 击败他们后搜刮出 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob Prowler
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step << !Warlock
    #optional
    #requires WolfMeatCooking8
    #completewith RedridgeS
    .goto 1429,84.448,72.486,0
    .goto 1429,88.611,71.379,0
    .goto 1429,89.657,75.373,0
    .goto 1429,87.250,75.853,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r. 击败他们后搜刮出 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只需击杀并拾取你遇到的所有狼即可|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob Prowler
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step << !Warlock
    #label RedridgeS
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
step << !Warlock
    #optional
    .goto Redridge Mountains,17.4,69.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
    .target Guard Parker
    .xp <11,1
step << !Warlock
    #softcore
    #completewith RRFP
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step << !Warlock
    #hardcore
    #optional
    #completewith RRFP
    .goto Redridge Mountains,18.581,69.208,15,0
    .goto Redridge Mountains,23.325,71.373,25,0
    .goto Redridge Mountains,29.565,67.930,25,0
    .goto Redridge Mountains,30.590,59.410,15 >>|cRXP_WARN_注意:沿主路前进, 途中避开所有近距怪物|r
step << !Warlock
    #optional
    .goto Redridge Mountains,30.73,59.99
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .target Deputy Feldon
    .isOnQuest 244
    .xp <11,1
step << !Warlock
    #season 0,1 << Paladin
    #label RRFP
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >>获取赤脊山飞行点
    .target Ariena Stormfeather
step << Paladin
    #xprate <1.5
    #season 2
    #label RRFP
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >>获取赤脊山飞行点
    .target Ariena Stormfeather
step << Paladin
    #xprate >1.49
    #season 2
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >>获取赤脊山飞行点
    .target Ariena Stormfeather
    .train 410015,3
step << Paladin
    #xprate >1.49
    #season 2
    #label RRFP
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >>获取赤脊山飞行点
    .fly Stormwind >>飞往暴风城
    .target Ariena Stormfeather
    .train 410015,1
step << Paladin
    #xprate >1.49
    #season 2
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩根·匹斯特|r交谈
    .turnin 61,1 >>交任务: |cRXP_FRIENDLY_送往暴风城的货物|r
    >>|cRXP_WARN_我们选择|r|T132383:0|t[爆破火箭]|cRXP_WARN_作为奖励. 它造成可观的伤害, 可用于“分拉”战术, 非常实用|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >>|cRXP_WARN_点击此处观看“分体拉怪”的视频参考. 这是一个简短的视频, 对学习非常有帮助|r
    .target Morgan Pestle
    .train 410015,1
step << Paladin
    #season 2
    #xprate >1.59
    #optional
    #completewith Romulus
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
    .train 410015,1
step << skip --Human Paladin
    #season 2
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .accept 1641 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1641 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Duthorian Rall
    .xp <12,1
--XX so you can get the 500xp breadcrumb in goldshire
step << skip --Human Paladin
    #season 2
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_圣洁之书|r] 开始任务|r
    .accept 1642 >>接任务: |cRXP_LOOT_圣洁之书|r
    .use 6775
    .xp <12,1
step << skip --Human Paladin
    #season 2
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1642 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1643 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Duthorian Rall
    .xp <12,1
step << Paladin
    #xprate >1.49
    #season 2
    #label Romulus
    .goto StormwindClassic,38.10,28.10
    .gossipoption 109653 >>与|cRXP_FRIENDLY_罗穆卢斯兄弟|r交谈
    .target Brother Romulus
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
    >>下楼前往大教堂墓穴的西侧
    .goto StormwindClassic,32.86,24.77,8 >>前往墓穴中的|cRXP_LOOT_焦黑的笔记|r
    .train 410015,1
step << Paladin
    #season 2
    #xprate >1.49
    .goto StormwindClassic,32.86,24.87
    >>拾取蜡烛旁边的|cRXP_LOOT_焦黑笔记|r
    .collect 205864,1 --Charred Note (1)
    .train 410015,1
step
    #optional
    #completewith CollectKelp
    .hs >>炉石返回闪金镇
step << Warrior/Rogue
    #xprate <1.5
    #optional
    #completewith Escape
    +|cRXP_WARN_注意节约开支, 尽量攒下32先令8便士, 以备日后前往暴风城之用|r << Rogue
    +|cRXP_WARN_注意节约开支, 因为之后你需要为暴风城和铁炉堡储备31先令85铜币|r << Warrior
    >>|cRXP_WARN_在那之前, 你将从任务交还中获得16先令50铜币|r << Rogue
    >>|cRXP_WARN_在那之前, 你将从任务提交中获得18先令25铜币|r << Warrior
    .money >0.50
--XX 1s 10c flight to SW, 20s 23c cutlass, 10s 1h sword, 30c/75c level 3/11 thrown - Rogue
--XX 1s 10c flight to SW, 10s 2h sword, 10s 2h mace, 10s thrown, 30c/75c level 3/11 thrown, 81c mining pick - Warrior
--XX 7s from 39, 3.5s from 76, 3.5s from 61, 2.5s from 109, 1.75 from 6281 (warrior)
step
    #label CollectKelp
    .goto Elwynn Forest,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .turnin 112 >>交任务: |cRXP_FRIENDLY_收集海藻|r
    .timer 9,接任务: |cRXP_LOOT_收集海藻|r RP
    .accept 114 >>接任务: |cRXP_LOOT_梅贝尔的隐形水|r
    .target William Pestle
step << Warrior/Rogue
    #optional
    #completewith next << Warrior
    #completewith RogueOptTrain << Rogue
    .goto Elwynn Forest,43.877,66.546,9 >>前往旅店二楼
step << Warrior/Rogue
    .goto Elwynn Forest,43.392,65.550
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米歇尔·贝利|r交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Michelle Belle
step << Rogue
    #optional
    #label RogueOptTrain
    .goto Elwynn Forest,43.872,65.937
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞恩·塞尔留斯|r交谈
    >>|cRXP_WARN_仅训练|r|T132147:0|t[双持]|cRXP_WARN_和|r|T132307:0|t[冲刺]|cRXP_WARN_. 不要学习其他技能, 以节省金币留待日后使用|r
    .train 674 >>训练 |T132147:0|t[双武器战斗]
    .train 2983 >>训练 |T132307:0|t[冲刺]
    .target Keryn Sylvius
    .xp <10,1
step
    .goto Elwynn Forest,42.105,65.927
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 39 >>交任务: |cRXP_FRIENDLY_托马斯的报告|r
    .turnin 76 >>交任务: |cRXP_FRIENDLY_玉石矿洞|r
    .accept 239 >>接任务: |cRXP_LOOT_西泉要塞|r
    .accept 59 >>接任务: |cRXP_LOOT_布甲和皮甲|r << Warlock
    .accept 109 >>接任务: |cRXP_LOOT_向格里安·斯托曼报到|r
    .target Marshal Dughan
step
    #sticky
    #label GoldshireVendor
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor >>出售垃圾
    .target Corina Steele
    .money >0.75
step
    .goto Elwynn Forest,41.706,65.544
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
    .accept 1097 >>接任务: |cRXP_LOOT_艾尔默的任务|r
    .target Smith Argus
step << Warlock/Warrior
    #requires GoldshireVendor
    #optional
    .xp 10 >>升级至10级
step << Warrior
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里瑞亚·杜拉克|r交谈
    .accept 1638 >>接任务: |cRXP_LOOT_战士的训练|r
    .trainer >>训练你的职业法术
    .target Lyria Du Lac
    .money <0.5
step << Warrior
    #optional
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里瑞亚·杜拉克|r交谈
    >>|cRXP_WARN_不要训练, 因为你要省下钱留着以后用|r
    .accept 1638 >>接任务: |cRXP_LOOT_战士的训练|r
    .target Lyria Du Lac
step << Paladin
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
    .xp <10,1
    .xp >12,1
step << Paladin
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    .accept 2998 >>接任务: |cRXP_LOOT_圣洁之书|r
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
    .xp <12,1
step << Warlock
    #optional
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >>前往旅店一楼
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克西米利安·克洛文|r和|cRXP_FRIENDLY_雷门·玛考特|r交谈
    .trainer >>训练你的职业法术
    .goto Elwynn Forest,44.392,66.240
    .target +Maximillian Crowe
    .accept 1685 >>接任务: |cRXP_LOOT_加科因的召唤|r
    .goto Elwynn Forest,44.485,66.268
    .target +Remen Marcot
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师洁塞塔|r交谈
    .accept 5635 >>接任务: |cRXP_LOOT_绝望祷言|r
    .trainer >>训练你的职业法术
    .target Priestess Josetta
    .xp <10,1
step << Mage
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,43.25,66.19
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r交谈
    .trainer >>训练你的职业法术
    .target Zaldimar Wefhellt
    .xp <10,1
step << skip --Rogue
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,43.872,65.937
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞恩·塞尔留斯|r交谈
    >>|cRXP_WARN_仅训练|r|T132147:0|t[双持]|cRXP_WARN_和|r|T132307:0|t[冲刺]|cRXP_WARN_. 不要学习其他技能, 以节省金币留待日后使用|r
    .train 674 >>训练 |T132147:0|t[双武器战斗]
    .train 2983 >>训练 |T132307:0|t[冲刺]
    .target Keryn Sylvius
--XX skip quest, not worth going inside for
step << !Warlock
    #completewith PrincessFinish
    #optional
    .abandon 59 >>放弃布甲和皮甲
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
    >>击杀|cRXP_ENEMY_石牙野猪|r. 击杀后从它们身上获取|T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob Stonetusk Boar
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
    >>击杀|cRXP_ENEMY_石牙野猪|r. 击杀后从它们身上获取|T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_现在不用特意去刷这个任务. 只需击杀并拾取你遇到的所有野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob Stonetusk Boar
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #optional
    #requires GoldshireVendor
    #completewith next
    .goto Elwynn Forest,43.154,89.625,50 >>前往麦克卢尔酒庄
step
--  #xprate <1.59
    #label Escape
    #requires GoldshireVendor
    .goto Elwynn Forest,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅贝尔·马科伦|r交谈
    .turnin 114 >>交任务: |cRXP_FRIENDLY_梅贝尔的隐形水|r
    .target Maybell Maclure
step
    #xprate <1.5
    #label PrincessFinish
    .goto Elwynn Forest,34.660,84.482
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .turnin 88,1 >>交任务: |cRXP_FRIENDLY_公主必须死！|r << Rogue/Hunter
    .turnin 88,2 >>交任务: |cRXP_FRIENDLY_公主必须死！|r << Warrior/Paladin
    .turnin 88,3 >>交任务: |cRXP_FRIENDLY_公主必须死！|r << !Rogue !Hunter !Warrior !Paladin
    .target Ma Stonefield
step
    #xprate >1.49
    #label PrincessFinish
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯通菲尔德妈妈|r和|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    .turnin 88,1 >>交任务: |cRXP_FRIENDLY_公主必须死！|r << Rogue/Hunter
    .turnin 88,2 >>交任务: |cRXP_FRIENDLY_公主必须死！|r << Warrior/Paladin
    .turnin 88,3 >>交任务: |cRXP_FRIENDLY_公主必须死！|r << !Rogue !Hunter !Warrior !Paladin
    .goto Elwynn Forest,34.660,84.482
    .target +Ma Stonefield
    .turnin 87 >>交任务: |cRXP_FRIENDLY_金牙|r
    .target +"Auntie" Bernice Stonefield
    .goto Elwynn Forest,34.486,84.253
step << !Warrior !Warlock
    #xprate <1.5
    #optional
    #completewith Garrison
    .xp 9+4510 >>刷怪途中积累至4510+/6500经验值
    .itemcount 1971,1 --Westfall Deed (1)
step << !Warrior !Warlock
    #xprate <1.5
    #optional
    #completewith Garrison
    .xp 9+5110 >>刷怪途中达到5110+/6500经验值
    .itemcount 1971,<1 --Westfall Deed (0)
step
    #optional
    #completewith Garrison
    .goto Elwynn Forest,24.82,76.25,80 >>前往西泉要塞
step
    #label Garrison
    #season 0,1 << Warrior/Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 239 >>交任务: |cRXP_FRIENDLY_西泉要塞|r
    .accept 11 >>接任务: |cRXP_LOOT_悬赏河爪豺狼人|r << Warlock
    .goto Elwynn Forest,24.234,74.450
    .target +Deputy Rainer
    >>点击|cRXP_PICK_通缉告示|r << Warlock
    .accept 176 >>接任务: |cRXP_WARN_通缉：霍格|r << Warlock
    .goto Elwynn Forest,24.548,74.672 << Warlock
step << Warlock
    #completewith GnollEnd
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r 和|cRXP_ENEMY_河爪豺狼人前锋|r. 从他们身上搜刮出 |T134939:0|t[|cRXP_LOOT_采金日程表|r ]
    .use 1307 >>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_采金日程表|r] 开始任务|r
    >>|cRXP_WARN_|r |T134939:0|t[|cRXP_LOOT_采金日程表|r] |cRXP_WARN_是一种非常罕见的掉落. 如果你没有获得它, 请忽略此步骤|r
    >>|cRXP_ENEMY_格拉夫·疾齿|r|cRXP_WARN_稀有刷新, 必定掉落|r
    .collect 1307,1,123 --Collect Gold Pickup Schedule (x1)
    .accept 123 >>接任务: |cRXP_LOOT_收货人|r
    .unitscan Gruff Swiftbite
step << Warlock
    #completewith next
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r 和|cRXP_ENEMY_河爪豺狼人前锋|r . 掠夺他们的|cRXP_LOOT_护腕|r
    .complete 11,1 -- Painted Gnoll Armband (8)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
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
    >>击杀|cRXP_ENEMY_霍格|r. 从他身上搜刮|cRXP_LOOT_爪子|r
    >>|cRXP_ENEMY_霍格|r|cRXP_WARN_可在多个位置出现|r
    >>|cRXP_WARN_持续施放|r|T136183:0|t[恐惧], |cRXP_WARN_目标: |r|cRXP_ENEMY_霍格|r, 并用常规的DOT技能击杀他|r
    >>|cRXP_WARN_如果需要, 风筝引怪回到守卫塔, 并确保对其造成的伤害至少达到50%|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .unitscan Hogger
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
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r 和|cRXP_ENEMY_河爪豺狼人前锋|r . 掠夺他们的|cRXP_LOOT_护腕|r
    .complete 11,1 -- Painted Gnoll Armband (8)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
    .isOnQuest 11
step << Warlock
    .goto Elwynn Forest,24.234,74.450
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 11 >>交任务: |cRXP_FRIENDLY_悬赏河爪豺狼人|r
    .target Deputy Rainer
step << !Warrior !Warlock
    #xprate <1.5
    #optional
    #completewith WestEntry
    .xp 9+4575 >>刷怪途中获取4575+/6500经验值
    .itemcount 1971,1 --Westfall Deed (1)
step << !Warrior !Warlock
    #xprate <1.5
    #optional
    #completewith WestEntry
    .xp 9+5175 >>刷怪途中提升至5175+/6500经验
    .itemcount 1971,<1 --Westfall Deed (0)
step << !Warlock
    #optional
    #completewith WestEntry
    .abandon 123 >>放弃任务：收货人
step
    #completewith WestEntry
    .goto Westfall,59.95,19.35
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
#xprate >1.49
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    >>|cRXP_WARN_不要接受其他任务|r
    .turnin 184 >>交任务: |cRXP_FRIENDLY_法布隆的地契|r
    .goto Westfall,59.95,19.35
    .target +Farmer Furlbrow
    .accept 36 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .goto Westfall,59.92,19.42
	.target +Verna Furlbrow
    .isOnQuest 184
step
#xprate >1.49
    #label WestEntry
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    >>|cRXP_WARN_不要接受其他任务|r
    .accept 36 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .goto Westfall,59.92,19.42
	.target +Verna Furlbrow
step
#xprate <1.50
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .accept 64 >>接任务: |cRXP_LOOT_遗失的怀表|r
    .turnin 184 >>交任务: |cRXP_FRIENDLY_法布隆的地契|r
    .goto Westfall,59.95,19.35
    .target +Farmer Furlbrow
    .accept 151 >>接任务: |cRXP_LOOT_老马布兰契|r
    .accept 36 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .goto Westfall,59.92,19.42
	.target +Verna Furlbrow
    .isOnQuest 184
step
#xprate <1.50
    #label WestEntry
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .accept 64 >>接任务: |cRXP_LOOT_遗失的怀表|r
    .goto Westfall,59.95,19.35
    .target +Farmer Furlbrow
    .accept 151 >>接任务: |cRXP_LOOT_老马布兰契|r
    .accept 36 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .goto Westfall,59.92,19.42
	.target +Verna Furlbrow
step
    #optional
    #completewith next
    +|cRXP_WARN_ 请勿掠夺|r任何 |T134059:0|t[|cRXP_PICK_ 燕麦袋|r], 除非你已给自己寄送了大容量背包, 因为接下来的阶段你需要保留背包空间
    .isOnQuest 151
step
#xprate <1.50
    #sticky
    #label Fields
    .goto Westfall,56.04,31.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .accept 9 >>接任务: |cRXP_LOOT_清理荒野|r
    .target Farmer Saldean
step
#xprate >1.49
    .goto Westfall,56.416,30.519
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    >>|cRXP_WARN_不要接受其他任务|r
    .turnin 36 >>交任务: |cRXP_FRIENDLY_杂味炖肉|r
    .target Salma Saldean
step
#xprate <1.50
    .goto Westfall,56.416,30.519
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .turnin 36 >>交任务: |cRXP_FRIENDLY_杂味炖肉|r
    .accept 38 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .accept 22 >>接任务: |cRXP_LOOT_猪肝馅饼|r
    .target Salma Saldean
step
    #xprate <1.5
    #requires Fields
    .goto Westfall,56.327,47.520
    .xp 9+5775 >>升级至5775+/6500经验值
    .subzoneskip 108
step
    #xprate >1.49 << !Paladin
    #xprate 1.49-1.59 << Paladin
    #optional
    #requires Fields
    .goto Westfall,56.327,47.520
    .xp 9+5410 >>升级至5410+/6500经验值
    .subzoneskip 108
step << Paladin
    #xprate >1.59
    #optional
    .goto 1436,48.249,46.729
    .xp 11+5360 >>升级至5360+/8800经验
--XX 625+210 + 85 + 800 = 1720 × 2 = 3440
step
    #softcore
    #completewith next
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
-- .subzoneskip 108
step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r和|cRXP_FRIENDLY_丹努文队长|r交谈
    .turnin 109 >>交任务: |cRXP_FRIENDLY_向格里安·斯托曼报到|r
    .accept 12 >>接任务: |cRXP_LOOT_西部荒野人民军|r
    .goto Westfall,56.327,47.520
    .target +Gryan Stoutmantle
    .accept 102 >>接任务: |cRXP_LOOT_西部荒野的豺狼人|r
    .goto Westfall,56.421,47.623
    .target +Captain Danuvin
step
    #xprate >1.49
    .goto Westfall,56.327,47.520
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 109 >>交任务: |cRXP_FRIENDLY_向格里安·斯托曼报到|r
    .target Gryan Stoutmantle
step << Human
    #optional
    .goto Westfall,56.04,31.23
    .xp 10 >>升级至10级
step
    .goto Westfall,57.002,47.169
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官刘易斯|r交谈
    .accept 6181 >>接任务: |cRXP_LOOT_快递消息|r << Human
    .target Quartermaster Lewis
    .isQuestAvailable 6181 << Human
step
    .goto Westfall,52.86,53.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_从她那里购买最多 20|r|T133918:0|t[长嘴泥鳅]|cRXP_BUY_. 它们是等级 5 的廉价食物|r
    .collect 4592,20,314,1 --Longjaw Mud Snapper (20)
	.target Innkeeper Heather
step << Human
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .turnin 6181 >>交任务: |cRXP_FRIENDLY_快递消息|r
    .accept 6281 >>接任务: |cRXP_LOOT_赶赴暴风城|r
    .target Thor
step << skip --Rogue
    #season 2
    #completewith FlySW
    #label RoSS
    .goto Westfall,51.540,55.361,30,0
    .goto Westfall,51.093,54.642,30,0
    .goto Westfall,50.81,47.15,50,0
    .goto Westfall,51.093,54.642
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_Defias Scout|r获取 |T134419:0|t[|cRXP_FRIENDLY_碎裂之刃符文|r]
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_WARN_|r|T133644:0|t[扒窃]|cRXP_WARN_很可能会失败, 因为你等级不足. 如果失败, 请跳过此步骤并飞往暴风城, 你将在不久后于洛克莫丹完成该任务|r
    >>|cRXP_WARN_切勿激怒|cRXP_ENEMY_Defias Scout|r, 否则它将|r|T132331:0|t[消失]|cRXP_WARN_并消失3-5分钟. 请务必提前进入|r|T132320:0|t[潜行]|cRXP_WARN_状态！|r
    >>|cRXP_WARN_|cRXP_ENEMY_Defias Scout|r可以在山丘上出现|r
    .collect 208772,1 -- Rune of Saber Slash (1)
    .unitscan Defias Scout
    .train 424785,1
--XX Moved/forced to Loch/Darkshore
step << skip --Rogue
    #season 2
    #completewith next
    #requires RoSS
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .itemcount 208772,1
    .train 424785,1
step
    #label FlySW
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >>飞往暴风城
    .target Thor
step << skip --Human Paladin
    #season 2
    #xprate >1.59
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯蒂芬妮·特纳|r交谈
    .turnin 1643 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1644 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1644 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    --.accept 1780 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Stephanie Turner
    .isQuestTurnedIn 1643
    .xp 12,1
step << Paladin
    #xprate >1.49
    #season 2
    #optional
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩根·匹斯特|r交谈
    .turnin 61,1 >>交任务: |cRXP_FRIENDLY_送往暴风城的货物|r
    >>|cRXP_WARN_我们选择|r|T132383:0|t[爆破火箭]|cRXP_WARN_作为奖励. 它造成可观的伤害, 可用于“分拉”战术, 非常实用|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >>|cRXP_WARN_点击此处观看“分体拉怪”的视频参考. 这是一个简短的视频, 对学习非常有帮助|r
    .target Morgan Pestle
step << Paladin
    #xprate <1.5
    #season 2
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩根·匹斯特|r交谈
    .turnin 61,1 >>交任务: |cRXP_FRIENDLY_送往暴风城的货物|r
    >>|cRXP_WARN_我们选择|r|T132383:0|t[爆破火箭]|cRXP_WARN_作为奖励. 它造成可观的伤害, 可用于“分拉”战术, 非常实用|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >>|cRXP_WARN_点击此处观看“分体拉怪”的视频参考. 这是一个简短的视频, 对学习非常有帮助|r
    .target Morgan Pestle
step
    #season 0,1 << Paladin
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩根·匹斯特|r交谈
    .turnin 61,1 >>交任务: |cRXP_FRIENDLY_送往暴风城的货物|r
    >>|cRXP_WARN_我们选择|r|T132383:0|t[爆破火箭]|cRXP_WARN_作为奖励. 它造成可观的伤害, 可用于“分拉”战术, 非常实用|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >>|cRXP_WARN_点击此处观看“分体拉怪”的视频参考. 这是一个简短的视频, 对学习非常有帮助|r
    .target Morgan Pestle
step << Rogue
    #optional
    #completewith next
    .goto 1453,57.764,61.412,6 >>进入日常百货店大楼
step << Rogue
    #xprate <1.5
    .goto 1453,58.380,61.683
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔曼·穆比|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135425:0|t[锐利投掷匕首]|r
    .collect 3107,200 --Collect Keen Throwing Knife (200)
    .target Thurman Mullby
    .xp <10+5890,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
--XX 420 6281, 110 1097, 900 6661, 85 IF, 65 Gate IF, 65 refuge, 65 Amberstill
--XX (WARR ONLY): 90 1638, 90 1639, 210 1640, 420 1665
step << Rogue
    #xprate <1.5
    .goto 1453,58.380,61.683
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔曼·穆比|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135641:0|t[破损的平衡飞刀]|r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target Thurman Mullby
    .xp >10+5890,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #xprate >1.49
    .goto 1453,58.380,61.683
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔曼·穆比|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135425:0|t[锐利投掷匕首]|r
    .collect 3107,200 --Collect Keen Throwing Knife (200)
    .target Thurman Mullby
    .xp <10+5035,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
--XX 420 6281, 110 1097, 900 6661, 85 IF, 65 Gate IF, 65 refuge, 65 Amberstill
step << Rogue
    #xprate >1.49
    .goto 1453,58.380,61.683
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔曼·穆比|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135641:0|t[破损的平衡飞刀]|r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target Thurman Mullby
    .xp >10+5035,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #optional
    #completewith Continue
    +|cRXP_WARN_装备|r|T135425:0|t[锐利投掷匕首]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Rogue
    #optional
    #completewith Continue
    +|cRXP_WARN_装备|r|T135641:0|t[破损的平衡飞刀]
    .use 2946
    .itemcount 2946,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step
    #optional << Warlock/Mage/Warrior
    .goto StormwindClassic,57.129,57.698
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .trainer >>训练1小时剑与法杖 << Warlock/Mage
    .trainer >>学习1小时剑术 << Rogue
    .trainer >>训练法杖 << Priest
    .trainer >>学习两小时剑术 << Warrior/Paladin
    .target Woo Ping
    .money <0.2 << Warlock/Mage
    .money <0.3 << Warrior
step << Warlock/Mage
    .goto StormwindClassic,57.129,57.698
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .trainer >>训练法杖
    .target Woo Ping
step << Rogue
    #ssf
    #optional
    .goto StormwindClassic,57.547,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    .collect 851,1 -- Cutlass (1)
    .target Gunther Weller
    .money <0.2623
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .train 2983,1 --Sprint not Trained
step << Rogue
    #ssf
    #optional
    .goto StormwindClassic,57.547,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    .collect 851,1 -- Cutlass (1)
    .target Gunther Weller
    .money <0.2023
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .train 2983,3 --Sprint Trained
step << Rogue
    #optional
    #ah
    .goto StormwindClassic,57.547,57.076
    .goto 1453,53.615,59.767,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    >>|cRXP_WARN_确保留出6秒用于后续训练|r
    .collect 851,1 -- Cutlass (1)
    .target Gunther Weller
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
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 851,1 -- Cutlass (1)
    .target Gunther Weller
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .train 2983,3 --Sprint Trained
--XX No money gate factoring cutlass in case something cheaper on AH
step << Rogue
    #optional
    #completewith Continue
    +|cRXP_WARN_装备|r|T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step
    #xprate <1.5
    .goto StormwindClassic,52.623,65.701
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板奥里森|r交谈
    .home >>将你的[炉石]设置为暴风城
    .target Innkeeper Allison
step << skip --Warrior
    #season 2
    .gossipoption 109045 >>与旅店内的|cRXP_FRIENDLY_Liv Bradford|r交谈
    .gossipoption 109047
    .goto Stormwind City,22.608,64.621
    .gossipoption 109084 >>与|cRXP_ENEMY_Stuart|r交谈, 然后击败他. 当他血量降至 0% 时会晕倒
    .goto Stormwind City,21.213,62.781
    >>如果|cRXP_ENEMY_Stuart|r不在, 就等待他刷新
    .gossipoption 109044 >>击败|cRXP_ENEMY_斯图尔特|r后, 再次与|cRXP_FRIENDLY_丽芙·布拉德福德|r交谈, 以获得|T134419:0|t[|cRXP_FRIENDLY_狂暴冲锋符文|r]
    .goto Stormwind City,22.608,64.621
    .train 425447,1 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狂怒冲击符文|r]|cRXP_WARN_来训练|r|T236317:0|t[狂怒冲击]
    >>|cRXP_WARN_注意:在这个等级单独完成此任务可能相当困难. 请寻求帮助, 否则你将在12级时才能顺利通关|r
    .use 204716
    .target Liv Bradford
    .mob Stuart
step << Human Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 2998 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1641 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1641 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Duthorian Rall
    .isOnQuest 2998
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .accept 1641 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1641 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Duthorian Rall
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_圣洁之书|r] 开始任务|r
    .accept 1642 >>接任务: |cRXP_LOOT_圣洁之书|r
    .use 6775
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1642 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1643 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Duthorian Rall
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 19834 >>训练你的职业法术
    .target Arthur the Faithful
    .xp <12,1
    .xp >14,1
step << Human Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 647 >>训练你的职业法术
    .target Arthur the Faithful
    .xp <14,1
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯蒂芬妮·特纳|r交谈
    .turnin 1643 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1644 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1644 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    --.accept 1780 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Stephanie Turner
----XX if ever in the future, add Level 12 xp grind for 1.5x Tome of Divinity




----Warlock Elwynn Voidwalker Section Start----




step << Warlock
    #optional
    #completewith GakinStart
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .train 705 >>训练你的职业法术
    .target Ursula Deline
    .xp <12,1
    .xp >14,1
step << Warlock
    #xprate >1.59
    #optional
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .train 689 >>训练你的职业法术
    .target Ursula Deline
    .xp <14,1
step << Warlock
    #label GakinStart
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .turnin 1685 >>交任务: |cRXP_FRIENDLY_加科因的召唤|r
    .accept 1688 >>接任务: |cRXP_LOOT_苏伦娜·凯尔东|r
    .target Gakin the Darkbinder
step << Warlock
    #softcore
    .deathskip >>死亡后, 使用 |T136126:0|t[生命分流] 并站在你旁边的篝火上, 于|cRXP_FRIENDLY_灵魂医者|r 处复活
    .target Spirit Healer
--  .subzoneskip 87
step << Warlock
    #hardcore
    #completewith WLHoggerEnd
    .goto Elwynn Forest,42.105,65.927
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
step << Warlock
    #completewith WLHoggerEnd
    .goto Elwynn Forest,42.105,65.927
    .subzone 87 >>前往闪金镇
step << Warlock
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    >>|cRXP_WARN_选择|r|T135145:0|t[平衡长棍]
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    .turnin 123 >>交任务: |cRXP_FRIENDLY_收货人|r
    .target Marshal Dughan
    .isOnQuest 123
step << Warlock
    #label WLHoggerEnd
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    >>|cRXP_WARN_选择|r|T135145:0|t[平衡长棍]
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    .target Marshal Dughan
step << Warlock
    #optional
    #completewith WLBandanaEnd
    +|cRXP_WARN_装备|r|T135145:0|t[平衡长棍]
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
    >>击杀|cRXP_ENEMY_石皮野猪|r. 击杀后从它们身上获取 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob Rockhide Boar
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
    >>击杀|cRXP_ENEMY_石皮野猪|r. 击杀后从它们身上获取 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_现在不用特意去刷这个任务. 只需击杀并拾取你遇到的所有野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob Rockhide Boar
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 62 --Brackwell Pumpkin Patch
step << Warlock
    #optional
    >>|cRXP_WARN_途中磨练. 尝试提升你的|r|T135145:0|t[平衡长棍]|cRXP_WARN_skill|r
    .subzone 62 >>前往布拉克韦尔南瓜田
    .isOnQuest 1688
step << Warlock
    #xprate <1.5
    #optional
    #completewith SChoker
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 掠夺他们以获得 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r]
    .use 1972>>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] 开始任务|r
    >>|cRXP_WARN_|r|T134939:0|t[|cRXP_LOOT_西部荒野地契|r]|cRXP_WARN_是一个非常稀有的掉落物品. 如果你没有获得它, 请跳过此步骤|r
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >>接任务: |cRXP_LOOT_法布隆的地契|r
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
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 击杀后掠夺他们的|cRXP_LOOT_红色亚麻面罩|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .mob Defias Bandit
    .isOnQuest 83
step << Warlock
    #label SChoker
    .goto Elwynn Forest,71.10,80.66
    >>击杀|cRXP_ENEMY_苏伦娜·凯尔东|r. 搜刮她的|cRXP_LOOT_项圈|r
    >>|cRXP_WARN_集中精力快速击杀|r苏伦娜·凯尔东|r
    >>|cRXP_WARN_持续施放|r|T136183:0|t[恐惧], |cRXP_WARN_目标: |r|cRXP_ENEMY_收货人莫根|r|r
    .complete 1688,1 --Surena's Choker (1)
    .mob Surena Caledon
step << Warlock
    #optional
    #label WolfMeatCooking9
    #completewith WlockRedridge
    .goto 1429,84.448,72.486,0
    .goto 1429,88.611,71.379,0
    .goto 1429,89.657,75.373,0
    .goto 1429,87.250,75.853,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r. 击败他们后搜刮出 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 2672,10,2178,1,0x20,cooking --Stringy Wolf Meat (1-10)
    .mob Prowler
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step << Warlock
    #optional
    #requires WolfMeatCooking8
    #completewith WlockRedridge
    .goto 1429,84.448,72.486,0
    .goto 1429,88.611,71.379,0
    .goto 1429,89.657,75.373,0
    .goto 1429,87.250,75.853,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r. 击败他们后搜刮出 |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只需击杀并拾取你遇到的所有狼即可|r
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (10-50)
    .mob Prowler
    .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step << Warlock
    #requires WLBandanaEnd
    .goto Elwynn Forest,79.457,68.789
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .turnin 59 >>交任务: |cRXP_FRIENDLY_布甲和皮甲|r
    .turnin 83 >>交任务: |cRXP_FRIENDLY_红色亚麻布|r
    .target Sara Timberlain
    .isOnQuest 83
step << Warlock
    #optional
    #requires WLBandanaEnd
    .goto Elwynn Forest,79.457,68.789
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .turnin 59 >>交任务: |cRXP_FRIENDLY_布甲和皮甲|r
    .target Sara Timberlain
step << Warlock
    #optional
    #completewith Gnolls
    #label SoulShards
    >>|cRXP_WARN_途中刷怪. 确保在到达赤脊山之前至少拥有2|r|T134075:0|t[|cRXP_LOOT_灵魂碎片|r], 方法是在怪物即将死亡时使用|r|T136163:0|t[|cRXP_FRIENDLY_吸取灵魂|r]
    .collect 6265,2 --Soul Shard (2)
step << Warlock
    #optional
    #label WlockRedridge
    #completewith next
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
step << Warlock
    #label Gnolls
    #requires SoulShards
    .goto Redridge Mountains,17.4,69.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
    .target Guard Parker
step << Warlock
    .goto Redridge Mountains,18.581,69.208,15,0
    .goto Redridge Mountains,23.325,71.373,25,0
    .goto Redridge Mountains,29.565,67.930,25,0
    .goto Redridge Mountains,30.733,59.996,25 >>前往湖畔镇
    >>|cRXP_WARN_沿着主路前进, 沿途避开靠近的敌人|r
    .target Deputy Feldon
step << Warlock
    .goto Redridge Mountains,30.733,59.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
step << Warlock
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >>获取赤脊山飞行点
    .fly Stormwind >>飞往暴风城
    .target Ariena Stormfeather
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock
    #optional
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >>训练你的职业法术
    .target Ursula Deline
    .xp <12,1
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .turnin 1688 >>交任务: |cRXP_FRIENDLY_苏伦娜·凯尔东|r
    .accept 1689 >>接任务: |cRXP_LOOT_誓缚|r
    .target Gakin the Darkbinder
step << Warlock
    #completewith next
    .goto StormwindClassic,25.2,80.7,18,0
    .goto StormwindClassic,23.2,79.5,18,0
    .goto StormwindClassic,26.3,79.5,18,0
    .goto StormwindClassic,25.154,77.406
    >>|cRXP_WARN_前往已宰的羔羊底部|r
    .cast 7728 >>|cRXP_WARN_使用|r|T133292:0|t[血石颈环]|cRXP_WARN_召唤|r|cRXP_ENEMY_虚空行者|r
    .use 6928
step << Warlock
    .goto StormwindClassic,25.154,77.406
    .use 6928 >>击杀召唤的虚空行者
    .complete 1689,1 --Kill Summoned Voidwalker (x1)
    .mob Summoned Voidwalker
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .target Gakin the Darkbinder
    .goto StormwindClassic,25.25,78.59
    .turnin 1689 >>交任务: |cRXP_FRIENDLY_誓缚|r


----Warlock Elwynn Voidwalker Section End----

step << Rogue
    #xprate <1.59
    .goto 1453,74.645,52.818
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_仅训练|r|T132147:0|t[双武器专精]|cRXP_WARN_和|r|T132307:0|t[冲刺]
    .train 674 >>训练 |T132147:0|t[双武器战斗]
    .train 2983 >>训练 |T132307:0|t[冲刺]
    .target Osborne the Night Man
step << Rogue
    #xprate >1.59
    .goto 1453,74.645,52.818
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    .train 674 >>训练 |T132147:0|t[双武器战斗]
    .train 2983 >>训练 |T132307:0|t[冲刺]
    .target Osborne the Night Man
    .xp <10,1
    .xp >12,1
step << Rogue
    #xprate >1.59
    .goto 1453,74.645,52.818
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    .train 1766 >>训练你的职业法术
    .target Osborne the Night Man
    .xp <12,1
    .xp >14,1
step << Rogue
    #xprate >1.59
    #optional
    .goto 1453,74.645,52.818
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .xp <14,1
step << Rogue
    #optional
    #label StilettoDW
    #completewith Continue
    +|cRXP_WARN_在你的副手中装备|r |T135346:0|t[卷刃的剑] |r
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>6.7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #optional
    #requires StilettoDW
    #completewith Continue
    +|cRXP_WARN_如果你现在还没有|r|T132147:0|t[双持]|cRXP_WARN_, 不用担心, 以后需要时再购买武器即可|r
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.4
step << Human
    #xprate <1.5
    #label Continue
    .goto StormwindClassic,74.312,47.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯瑞克·斯图恩|r交谈
    .turnin 6281 >>交任务: |cRXP_FRIENDLY_赶赴暴风城|r
    .accept 6261 >>接任务: |cRXP_LOOT_杜加尔·朗德瑞克|r
    .target Osric Strang
step << Human
    #xprate >1.49
    #label Continue
    .goto StormwindClassic,74.312,47.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯瑞克·斯图恩|r交谈
    .turnin 6281 >>交任务: |cRXP_FRIENDLY_赶赴暴风城|r
    .target Osric Strang
step << Warrior
    .goto StormwindClassic,74.249,37.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈里·伯加德|r交谈
    .turnin 1638 >>交任务: |cRXP_FRIENDLY_战士的训练|r
    .accept 1639 >>接任务: |cRXP_LOOT_醉鬼巴特莱比|r
    .target Harry Burlguard
step << Warrior
    .goto StormwindClassic,73.787,36.323
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴特莱比|r交谈
    .turnin 1639 >>交任务: |cRXP_FRIENDLY_醉鬼巴特莱比|r
    .accept 1640 >>接任务: |cRXP_LOOT_击败巴特莱比|r
    .target Bartleby
step << Warrior
    .goto StormwindClassic,73.787,36.323
    >>攻击|cRXP_ENEMY_巴特莱比|r. 他将在1%血量时投降
    .complete 1640,1 --Beat Bartleby
    .mob Bartleby
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴特莱比|r交谈
    .target Bartleby
    .goto StormwindClassic,73.787,36.323
    .turnin 1640 >>交任务: |cRXP_FRIENDLY_击败巴特莱比|r
    .accept 1665 >>接任务: |cRXP_LOOT_巴特莱比的酒杯|r
step << Warrior
    .goto StormwindClassic,74.249,37.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈里·伯加德|r交谈
    .turnin 1665 >>交任务: |cRXP_FRIENDLY_巴特莱比的酒杯|r
    .target Harry Burlguard
step << Priest
    #optional
    #completewith Prayer
    .goto StormwindClassic,42.51,33.51,20 >>进入暴风城大教堂
step << Priest
    #optional
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 5635 >>交任务: |cRXP_FRIENDLY_绝望祷言|r
    .train 8092 >>训练你的职业法术
    .target High Priestess Laurena
    .isOnQuest 5635
step << Priest
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 5634 >>交任务: |cRXP_FRIENDLY_绝望祷言|r
    .train 8092 >>训练你的职业法术
    .target High Priestess Laurena
    .train 13908,1
step << Priest
    #optional
    #label Prayer
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .trainer >>训练你的职业法术
    .target High Priestess Laurena
    .train 13908,3
step << Rogue
    #season 2
    #optional
    #completewith next
    .goto Stormwind City,56.93,29.54,8,0
    .goto Stormwind City,58.65,27.56,10 >>进入暴风城矮人区的割喉小巷
    .train 400081,1
step << Rogue
    #season 2
    #optional
    .goto Stormwind City,63.201,29.491,5,0
    .goto Stormwind City,61.728,29.190
    >>|cRXP_WARN_上楼进入房屋|r
    >>打开|cRXP_PICK_Dusty Chest|r. 将其打开后获得 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_这样做会刷新两个等级为10的|cRXP_ENEMY_刀疤劫匪|r, 他们会攻击你|r
    .collect 204174,1 -- Rune of Precision (1)
    .mob Cut-throat Mugger
    .train 400081,1
step << Rogue
    #season 2
    #optional
    .train 400081 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_来训练|r|T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1
step
    .goto StormwindClassic,51.757,12.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞曼德·艾尔默|r交谈
    .turnin 1097 >>交任务: |cRXP_FRIENDLY_艾尔默的任务|r
    .accept 353 >>接任务: |cRXP_LOOT_雷矛的包裹|r
    .target Grimand Elmore
step << Warrior
    #season 0,1
    #optional
    #completewith DeeprunEnter
    +|cRXP_WARN_将|r|T132363:0|t[破甲]|cRXP_WARN_放置在你的快捷栏上, 并持续使用. 它的效果比使用|r|T132282:0|t[英勇打击]更佳
step << Warrior/Paladin/Rogue
    #optional
    .goto StormwindClassic,56.3,17.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯塔·深炉|r交谈
    .collect 2901,1,432,1 >>|cRXP_BUY_从她那里购买 a|r|T134708:0|t[矿工锄]|r
    >>|cRXP_WARN_你将学习|r|T134708:0|t[采矿]|cRXP_WARN_later|r
    .target Kaita Deepforge
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
    >>|cRXP_WARN_电车抵达时:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_电车抵达时:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_电车抵达时:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_以下物品:|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_the|r |T133970:0|t|cRXP_LOOT_[野猪肉块]|r |cRXP_WARN_into|r |T133974:0|t[烤野猪肉]
    >>|T133971:0|t[烹饪]|cRXP_WARN_the|r|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_into|r|T133974:0|t[烧烤狼肉]
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_the|r|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_into|r|T133974:0|t[烧烤狼肉]
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_the|r |T133970:0|t|cRXP_LOOT_[野猪肉块]|r |cRXP_WARN_into|r |T133974:0|t[烤野猪肉]
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
    >>|cRXP_WARN_如果需要, 可在等待前往铁炉堡的电车时升级你的|r|T135966:0|t[急救]|r << Rogue/Warrior/Paladin
    >>|cRXP_WARN_你需要|r|T135966:0|t[急救]|cRXP_WARN_达到80级才能接取24级的任务|r << Rogue !Dwarf
    >>|cRXP_WARN_施放|r|T136221:0|t[召唤虚空行者]|cRXP_WARN_和|r|T135230:0|t[制作治疗石]|cRXP_WARN_(如需等待前往铁炉堡的电车时)|r << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡方向矿道地铁中段站台上的|cRXP_FRIENDLY_蒙提|r交谈
    .accept 6661 >>接任务: |cRXP_LOOT_捕捉矿道老鼠|r
    .target Monty
step
    #xprate <1.59
    >>|cRXP_WARN_在矿道地铁内使用|r|T133942:0|t[捕鼠者长笛], |cRXP_WARN_目标: |r |cRXP_ENEMY_矿道老鼠|r|r
    .complete 6661,1 --Rats Captured (x5)
    .use 17117
    .mob Deeprun Rat
step
    #xprate <1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与矿道地铁内的|cRXP_FRIENDLY_蒙提|r交谈
    .turnin 6661 >>交任务: |cRXP_FRIENDLY_捕捉矿道老鼠|r
    .target Monty
step
    #xprate >1.59
    #optional
    #label TramEnd
    >>|cRXP_WARN_乘坐矿道地铁前往铁炉堡一侧|r
    >>|cRXP_WARN_如果需要, 可在等待前往铁炉堡的电车时升级你的|r|T135966:0|t[急救]|r << Rogue/Warrior/Paladin
    >>|cRXP_WARN_你需要|r|T135966:0|t[急救]|cRXP_WARN_达到80级才能接取24级的任务|r << Rogue !Dwarf
    >>|cRXP_WARN_施放|r|T136221:0|t[召唤虚空行者]|cRXP_WARN_和|r|T135230:0|t[制作治疗石]|cRXP_WARN_(如需等待前往铁炉堡的电车时)|r << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡方向矿道地铁中段站台上的|cRXP_FRIENDLY_蒙提|r交谈
    .accept 6661 >>接任务: |cRXP_LOOT_捕捉矿道老鼠|r
    .target Monty
    .zoneskip Ironforge
step
    #xprate >1.59
    >>|cRXP_WARN_在矿道地铁内使用|r|T133942:0|t[捕鼠者长笛], |cRXP_WARN_目标: |r |cRXP_ENEMY_矿道老鼠|r|r
    .complete 6661,1 --Rats Captured (x5)
    .use 17117
    .mob Deeprun Rat
    .zoneskip Ironforge
step
    #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与矿道地铁内的|cRXP_FRIENDLY_蒙提|r交谈
    .turnin 6661 >>交任务: |cRXP_FRIENDLY_捕捉矿道老鼠|r
    .target Monty
    .zoneskip Ironforge
step
    #completewith next
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    >>|cRXP_WARN_等待电车时, 如需治疗, 请使用|r|T135966:0|t[急救]|r << Rogue/Warrior/Paladin
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
step
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .isQuestAvailable 314
step << Paladin/Warrior
    #season 2
    #optional
    #completewith next
    .goto Ironforge,71.54,73.46,10,0
    .goto Ironforge,72.53,76.94,10 >>前往旅店内部, 找到|cRXP_FRIENDLY_布鲁克·麦须|r
    .train 425621,1 << Paladin
    .train 425447,1 << Warrior
step << Paladin/Warrior
    #season 2
    .goto Ironforge,72.53,76.94
    .gossipoption 110791 >>与|cRXP_FRIENDLY_布鲁克·麦须|r对话, 他在里面
    .target Bruuk Barleybeard
    .skipgossip 5570,1,1
    .train 425621,1 << Paladin
    .train 425447,1 << Warrior
--XX 110793 "How's business?"
--XX 110791 "Sounds like you need someone to bounce him for you."
step << Paladin/Warrior
    #season 2
    .goto Ironforge,72.40,73.63
    .gossipoption 109084 >>与|cRXP_FRIENDLY_Bruart|r谈话以开启战斗
    >>击败|cRXP_ENEMY_Bruart|r
    >>|cRXP_WARN_小心, 他正在施放|r|T132939:0|t[反手击]|cRXP_WARN_(使你眩晕2秒)|r
    >>|cRXP_WARN_记得预先施放|r|T135924:0|t[十字军印记]|cRXP_WARN_给他|r << Paladin
    >>|cRXP_WARN_切勿意外对他施放|r|T135906:0|t[力量祝福]|r << Paladin
    >>|cRXP_WARN_风筝他到楼上的阳台, 然后跳到旅店外并视情况施放|r|T135920:0|t[圣光]|cRXP_WARN_如果需要|r << Paladin
    >>|cRXP_WARN_把他风筝到楼上的阳台上, 然后跳到旅店外并使用|r|T133688:0|t[绷带]|cRXP_WARN_(如果你有且需要的话)|r << Warrior
    .mob Bruart
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
    >>击败|cRXP_ENEMY_Bruart|r
    >>|cRXP_WARN_小心, 他正在施放|r|T132939:0|t[反手击]|cRXP_WARN_(使你眩晕2秒)|r
    >>|cRXP_WARN_记得预先施放|r|T135924:0|t[十字军印记]|cRXP_WARN_给他|r << Paladin
    >>|cRXP_WARN_切勿意外对他施放|r|T135906:0|t[力量祝福]|r << Paladin
    >>|cRXP_WARN_风筝他到楼上的阳台, 然后跳到旅店外并视情况施放|r|T135920:0|t[圣光]|cRXP_WARN_如果需要|r << Paladin
    >>|cRXP_WARN_把他风筝到楼上的阳台上, 然后跳到旅店外并使用|r|T133688:0|t[绷带]|cRXP_WARN_(如果你有且需要的话)|r << Warrior
    >>|cRXP_WARN_击败布鲁亚特后:|r
    >>与|cRXP_FRIENDLY_布鲁克·麦须|r再次对话, 以获得|T134419:0|t[斥责符文] << Paladin
    >>|cRXP_WARN_如果他不给你|r|T134419:0|t[斥责符文]|cRXP_WARN_, 你可能需要再次击败|cRXP_ENEMY_Bruart|r|r << Paladin
    >>与|cRXP_FRIENDLY_布鲁克·麦须|r再次对话, 以获得|T134419:0|t[狂怒冲锋符文] << Warrior
    >>|cRXP_WARN_如果他不给你|r|T134419:0|t[狂暴突袭符文]|cRXP_WARN_, 你可能需要再次与|cRXP_ENEMY_Bruart|r战斗|r << Warrior
    >>|cRXP_WARN_注意:此任务单独完成可能较困难, 请寻求帮助, 否则在指南后续内容中将被提示重新完成|r << Warrior
    .collect 205683,1 << Paladin --Rune of Rebuke (1)
    .collect 204716,1 << Warrior --Rune of Frenzied Assault (1)
    .target Bruuk Barleybeard
    .skipgossip 5570,2,1
    .skipgossip 209004,1
    .train 425621,1 << Paladin
    .train 425447,1 << Warrior
--XX 109539 "I've taken care of Stuart. He shouldn't be a problem anymore."
step << Paladin
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[斥责符文]|cRXP_WARN_来学习|r|T134596:0|t[刻印长裤 - 斥责]
    .use 205683
    .itemcount 205683,1 --Rune of Rebuke (1)
    .train 425621,1
step << Paladin
    #season 2
    #completewith Dirt
    .engrave 7 >>|cRXP_WARN_雕刻你的|r|T134596:0|t|cRXP_LOOT_[裤子]|r|cRXP_WARN_带有|r|T134596:0|t[雕刻裤子 - 斥责]
    >>|cRXP_WARN_记得将|r|T134919:0|t[斥责]|cRXP_WARN_放到你的快捷栏上|r
    .train 425621,3
step << Warrior
    #season 2
    .train 425447 >>|cRXP_WARN_使用|r|T134419:0|t[狂暴突袭符文]|cRXP_WARN_来学习|r|T134596:0|t[雕刻裤 - 狂暴突袭]
    .use 204716
    .itemcount 204716,1 --Rune of Frenzied Assault (1)
step << Warrior
    #season 2
    #completewith Dirt
    .engrave 7 >>|cRXP_WARN_刻印你的|r|T134596:0|t|cRXP_LOOT_[裤子]|r|cRXP_WARN_带有|r|T134596:0|t[刻印裤子 - 狂暴突击]
    .train 425447,3
step << Warrior
    #optional
    #completewith WarriorTrain
    .goto 1455,67.400,84.909,15,0
    .goto Ironforge,65.905,88.405,12 >>前往|cRXP_FRIENDLY_比尔班·飞钳|r
step << Warrior
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比尔班·飞钳|r交谈
    >>|cRXP_WARN_确保你为以后存下20先令70铜币|r
    .train 2687 >>训练你的职业法术
    .target Bilban Tosslespanner
    .xp <10,1
    .xp >12,1
step << Warrior
    #xprate >1.59
    #optional
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比尔班·飞钳|r交谈
    >>|cRXP_WARN_确保你为以后存下20先令70铜币|r
    .train 5242 >>训练你的职业法术
    .target Bilban Tosslespanner
    .xp <12,1
step << Warrior
    #optional
    #completewith next
    .goto 1455,61.552,85.636,10,0
    .goto 1455,61.356,88.398,6 >>进入密林武器店大楼
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克斯|r和|cRXP_FRIENDLY_布里维夫·石拳|r交谈
    .train 2567 >>投掷训练
    .goto Ironforge,62.237,89.628
    .target +Bixi Wobblebonk
    .train 199 >>学习2小时锤类武器技能
    .goto Ironforge,61.177,89.508
    .target +Buliwyf Stonehand
step << Warrior
    #xprate <1.5
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r |T135425:0|t[锐利投掷匕首] |r
    .collect 3107,200 --Collect Keen Throwing Knife (200)
    .target Brenwyn Wintersteel
    .xp <10+7405,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
--XX 420 6281, 110 1097, 900 6661, 85 IF, 65 Gate IF, 65 refuge, 65 Amberstill
--XX (WARR ONLY): 90 1638, 90 1639, 210 1640, 420 1665
step << Warrior
    #xprate <1.5
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135641:0|t[破损的平衡飞刀]|r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target Brenwyn Wintersteel
    .xp >10+7405,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #xprate >1.49
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r |T135425:0|t[锐利投掷匕首] |r
    .collect 3107,200 --Collect Keen Throwing Knife (200)
    .target Brenwyn Wintersteel
    .xp <10+7310,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
--XX 420 6281, 110 1097, 900 6661, 85 IF, 65 Gate IF, 65 refuge, 65 Amberstill
step << Warrior
    #xprate >1.49
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135641:0|t[破损的平衡飞刀]|r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target Brenwyn Wintersteel
    .xp >10+7310,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #optional
    #completewith Rudra
    +|cRXP_WARN_装备|r|T135425:0|t[锐利投掷匕首]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Warrior
    #optional
    #completewith Rudra
    +|cRXP_WARN_装备|r|T135641:0|t[破损的平衡飞刀]
    .use 2946
    .itemcount 2946,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #optional
    #completewith next
    .goto 1455,61.356,88.398,6 >>离开密林武器店大楼
step
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fp Ironforge >>获取铁炉堡的飞行点
    .target Gryth Thurden
step
    #xprate >1.49
    #optional
    #completewith IFHS
    .goto 1455,43.883,59.467,15,0
    .goto 1455,38.497,71.135,15,0
    .goto 1455,25.658,61.707,20,0
    .goto 1455,20.419,53.269,10 >>进入石火酒馆
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
    .goto Ironforge,27.17,8.58,12 >>前往|cRXP_FRIENDLY_丁克|r << Mage
    .goto Ironforge,23.131,6.143,12 >>前往|cRXP_FRIENDLY_布兰度尔·铁锤|r << Paladin
step << Mage
    #xprate >1.49
    .goto Ironforge,27.17,8.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈, 他在里面
    .train 122 >>训练你的职业法术
    .target Dink
    .xp <10,1
    .xp >12,1
step << Mage
    #xprate >1.49
    .goto Ironforge,27.17,8.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈, 他在里面
    .train 145 >>训练你的职业法术
    .target Dink
    .xp <12,1
    .xp >14,1
step << Mage
    #xprate >1.49
    #label MageIFTrain
    .goto Ironforge,27.17,8.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈, 他在里面
    .train 1460 >>训练你的职业法术
    .target Dink
    .xp <14,1
step << Paladin
    #xprate >1.49
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰度尔·铁锤|cRXP_FRIENDLY_布兰度尔·铁锤|r交谈
    .train 633 >>训练你的职业法术
    .target Brandur Ironhammer
    .xp <10,1
    .xp >12,1
step << Paladin
    #xprate >1.49
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 19834 >>训练你的职业法术
    .target Arthur the Faithful
    .xp <12,1
    .xp >14,1
step << Paladin
    #xprate >1.49
    #optional
    #label PaladinIFTrain
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 647 >>训练你的职业法术
    .target Arthur the Faithful
    .xp <14,1
--XX Alternative paladin train if they didn't get 10 in Goldshire
step
    #xprate >1.49
    #label IFHS
    .goto 1455,20.419,53.269,10,0 << Mage/Paladin
    .goto Ironforge,18.14,51.45
    >>与|cRXP_FRIENDLY_旅店老板洛雷·火酒|cRXP_FRIENDLY_交谈|r
    .home >>将你的[炉石]设置为铁炉堡
    .target Innkeeper Firebrew
step << skip --logout skip
    #ssf
    #xprate >1.49
    .goto Ironforge,19.11,52.80
    .zone Dun Morogh >>|cRXP_WARN_前往: |cRXP_PICK_丹莫罗|r, 跳到桌子上的蜡烛上。通过登出并重新登录来跳过登出|r
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
    .goto 1455,38.628,56.436,20 >>进入王座厅
    .zoneskip Dun Morogh
    .isQuestAvailable 314
    .train 122,3 << Mage
    .train 633,3 << Paladin
step << skip --logout skip
    #xprate <1.5
    #ssf
    #optional
    .goto 1455,38.628,56.436
    .zone Dun Morogh >>|cRXP_WARN_前往: |cRXP_PICK_丹莫罗|r, 跳到王座的任一肩膀上，然后通过退出并重新登录来执行“跳过登出”操作|r
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
    .goto Ironforge,27.17,8.58,12 >>前往|cRXP_FRIENDLY_丁克|r << Mage
    .goto Ironforge,23.131,6.143,12 >>前往|cRXP_FRIENDLY_布兰度尔·铁锤|r << Paladin
step << Mage
    #xprate <1.5
    .goto Ironforge,27.17,8.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈, 他在里面
    .train 122 >>训练你的职业法术
    .target Dink
--XX Alternative mage train if they didn't get 10 in Goldshire
step << Paladin
    #xprate <1.5
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰度尔·铁锤|cRXP_FRIENDLY_布兰度尔·铁锤|r交谈
    .train 633 >>训练你的职业法术
    .target Brandur Ironhammer
--XX Alternative paladin train if they didn't get 10 in Goldshire
step << skip --logout skip << Mage/Paladin
    #xprate <1.5
    #ssf
    #optional
    .goto 1455,25.238,10.965,-1
    .goto 1455,24.300,8.708,-1
    .zone Dun Morogh >>|cRXP_WARN_前往: |cRXP_PICK_丹莫罗|r，跳到|cRXP_FRIENDLY_托德雷·铁矿|r或|cRXP_FRIENDLY_布莱纳·火崖|r上方的任意柱子上，将你的角色定位到看起来像是漂浮起来，然后通过注销并重新登录来执行注销跳过|r
    .isQuestAvailable 314
    .train 122,3 << Mage
    .train 633,3 << Paladin
step
    #ah
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡拍卖商交谈|r
    >>|cRXP_BUY_购买|r|T133970:0|t|cRXP_LOOT_[野猪肉块]|r|cRXP_BUY_和/或|r|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_BUY_以提升你的|r|T133971:0|t[烹饪] |cRXP_BUY_等级, 稍后使用|r
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能在夜色镇完成后续任务|r
    >>|cRXP_WARN_如果你不想或无法完成此步骤, 请跳过|r
    >>|cRXP_BUY_请购买以下物品, 以便在洛克莫丹更快完成任务并提升你的|r|T133971:0|t[烹饪]|cRXP_BUY_skill等级:|r
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    >>|T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (1-50)
    .disablecheckbox
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (1-50)
    .disablecheckbox
    .target Auctioneer Lympkin
    .target Auctioneer Redmuse
    .target Auctioneer Buckler
    .zoneskip Dun Morogh
    .isQuestAvailable 418
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #ah
    #optional
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡拍卖商交谈|r
    >>|cRXP_WARN_如果你不想或无法完成此步骤, 请跳过|r
    >>|cRXP_BUY_请在洛克莫丹尽快购买以下物品, 以加快任务提交进度:|r
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .target Auctioneer Lympkin
    .target Auctioneer Redmuse
    .target Auctioneer Buckler
    .zoneskip Dun Morogh
    .isQuestAvailable 418
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
step << skip --logout skip
    #ah
    #optional
    .goto 1455,33.220,64.649
    .zone Dun Morogh >>|cRXP_WARN_前往: |cRXP_PICK_丹莫罗|r, 跳到 |cRXP_PICK_邮箱|r 的顶部，然后通过注销并重新登录执行注销跳过|r
    .isQuestAvailable 314
step
    .goto 1426,53.47,35.02
    >>前往: |cRXP_PICK_丹莫罗|r
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
--logout skip - remove if logout skips re-added
step
    #optional
    #label BoarMeatDunMorogh1
    #completewith Dirt
    .goto 1426,57.936,50.787,0
    >>击杀|cRXP_ENEMY_老峭壁野猪|r. 击败后可掠夺其掉落的 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_这将用于提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_later 等级|r
    >>|cRXP_WARN_你需要 10|r|T133971:0|t[烹饪]|cRXP_WARN_, 稍后在奥伯丁完成任务|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob Elder Crag Boar
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #optional
    #requires BoarMeatDunMorogh1
    #completewith Dirt
    .goto 1426,57.936,50.787,0
    >>击杀|cRXP_ENEMY_老峭壁野猪|r. 击败后可掠夺其掉落的 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_这将用于提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_later 等级|r
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能在夜色镇完成后续任务|r
    >>|cRXP_WARN_现在不用特意去刷这个任务. 只需击杀并拾取你遇到的所有野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob Elder Crag Boar
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    #optional
    #label Dirt
    #completewith Rudra
    .goto Dun Morogh,59.84,49.56,40,0
    .goto Dun Morogh,61.36,47.07,40 >>沿着土路向上走
    .isQuestAvailable 314
step
    #completewith next
    #requires Dirt
    .goto 1426,62.778,54.591,0
    .goto 1426,62.538,46.195,0
    +|cRXP_WARN_风筝|cRXP_ENEMY_瓦加什|r到|cRXP_FRIENDLY_Rudra| 处|r
    .link https://youtu.be/Zg4FNWw-P5k?t=3815 >>|cRXP_WARN_点击此处, 如果你正在遇到困难|r << Mage
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >>|cRXP_WARN_点击此处查看视频参考|r << !Mage
    .mob Vagash
step << Warrior/Rogue
    #optional
    #requires Dirt
    #completewith VagashEnd
    +|cRXP_WARN_装备|r|T135425:0|t[锐利投掷匕首]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step
    #label Rudra
    .goto Dun Morogh,63.082,49.851
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .accept 314 >>接任务: |cRXP_LOOT_保护牲畜|r
    .target Rudra Amberstill
step
    #label VagashEnd
    .goto 1426,62.778,54.591,0
    .goto 1426,62.094,47.154,40,0
    .goto 1426,62.434,48.989,40,0
    .goto 1426,62.538,46.195
    >>击杀|cRXP_ENEMY_瓦加什|r. 击败他后搜刮他的|cRXP_LOOT_利牙|r
    >>|cRXP_WARN_把他引到牧场南边的守卫那里. 确保对他造成51%以上的伤害|r
    >>|cRXP_WARN_在尝试击杀|cRXP_ENEMY_瓦加什|r之前, 请先观看下方视频. 该BOSS可由任何职业单刷|r
    .link https://youtu.be/Zg4FNWw-P5k?t=3815 >>|cRXP_WARN_点击此处查看视频参考|r << Mage
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >>|cRXP_WARN_点击此处查看视频参考|r << !Mage
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob Vagash
step
    .goto Dun Morogh,63.082,49.851
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .turnin 314 >>交任务: |cRXP_FRIENDLY_保护牲畜|r
    .target Rudra Amberstill
step
    #optional
    #label BoarMeatDunMorogh2
    #completewith QuarryStart
    .goto 1426,66.356,51.02,0
    >>击杀|cRXP_ENEMY_大峭壁野猪|r. 击杀后可掠夺其身上的 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob Large Crag Boar
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 134 --Gol'Bolar Quarry
step
    #optional
    #requires BoarMeatDunMorogh2
    #completewith QuarryStart
    .goto 1426,66.356,51.02,0
    >>击杀|cRXP_ENEMY_大峭壁野猪|r. 击杀后可掠夺其身上的 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_现在不用特意去刷这个任务. 只需击杀并拾取你遇到的所有野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob Large Crag Boar
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 134 --Gol'Bolar Quarry
step
    .goto Dun Morogh,68.379,54.492
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师格瑞姆|r交谈
    .train 2550 >>学习 |T133971:0|t[烹饪]
    .target Cook Ghilm
step << !Human
    .goto Dun Morogh,68.614,54.643
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡杉·莫格什|r谈话
    .vendor >>|cRXP_BUY_购买|r|T133968:0|t[刚出炉的面包]|cRXP_BUY_如果需要|r << Warrior/Rogue
    .vendor >>|cRXP_BUY_购买|r|T133968:0|t[刚出炉的面包]|cRXP_BUY_和|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_(如需)|r << !Warrior !Rogue
    .target Kazan Mogosh
    .xp >15,1
step << Rogue
    #completewith QuarryEnd
    #label RogueWep
    .goto 1426,68.866,55.958,8,0
    .goto 1426,69.002,55.896
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗拉斯特·多克南|r交谈
    >>|cRXP_WARN_从他那里购买一个|r|T135321:0|t[步兵剑]|r
    .collect 2488,1 --Collect Gladius (1)
    .target Frast Dokner
    .money <0.0482
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.4
--XX Shows if you didn't get a cutlass or better wep earlier
step << Rogue
    #optional
    #completewith QuarryEnd
    #requires RogueWep
    #label Gladius
    .equip 16,2488 >>|cRXP_WARN_在你的主手装备|r|T135321:0|t[步兵剑]|r
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.4
step << Rogue
    #optional
    #completewith QuarryEnd
    #requires Gladius
    .equip 17,2494 >>|cRXP_WARN_在你的副手中装备|r |T135641:0|t[卷刃的剑] |r
    .use 2494
    .itemcount 2494,1
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step
    #xprate <1.5
    #label QuarryStart
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_参议员梅尔·圣石|r和|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 433 >>接任务: |cRXP_LOOT_公众之仆|r
    .goto Dun Morogh,68.671,55.969
    .target +Senator Mehr Stonehallow
    .accept 432 >>接任务: |cRXP_LOOT_该死的石腭怪！|r
    .goto Dun Morogh,69.084,56.330
    .target +Foreman Stonebrow
step
    #xprate >1.49
    #label QuarryStart
    .goto Dun Morogh,69.084,56.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 432 >>接任务: |cRXP_LOOT_该死的石腭怪！|r
    .target Foreman Stonebrow
    .xp >14,1
step << Warrior/Paladin/Rogue
    .goto Dun Morogh,69.324,55.456
    #requires RogueWep << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹克·利刃|r交谈
    .train 2575 >>训练 |T134708:0|t[采矿]
    >>|cRXP_WARN_此物品与|r|T136241:0|t[锻造]|cRXP_WARN_配合使用, 用于制作|r|T135248:0|t[劣质磨刀石]|cRXP_WARN_和|r|T135255:0|t[劣质平衡石]|cRXP_WARN_, 以提升你的武器伤害|r
    >>|cRXP_WARN_如果你不想这样做, 请跳过此步骤|r
    .target Dank Drizzlecut
    .train 2018,3 --Blacksmithing
step << Warrior/Paladin/Rogue
    #optional
    #completewith QuarryEnd
    .cast 2580 >>|cRXP_WARN_Cast|r|T136025:0|t[采集矿物]
    .usespell 2580
    .train 2575,3 --Mining Trained
step
    #xprate <1.5
    .goto Dun Morogh,70.7,56.4,40,0
    .goto Dun Morogh,70.62,52.39,25,0
    .goto Dun Morogh,70.7,56.4
    >>击杀洞穴内的|cRXP_ENEMY_石腭击颅者|r 和|cRXP_ENEMY_石腭断骨者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob +Rockjaw Skullthumper
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
    .mob +Rockjaw Bonesnapper
step
    #xprate >1.49
    .goto Dun Morogh,70.49,58.35,50,0
    .goto Dun Morogh,68.23,59.37,50,0
    .goto Dun Morogh,70.49,58.35
    >>击杀|cRXP_ENEMY_石腭击颅者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob Rockjaw Skullthumper
    .isOnQuest 432
step
    #xprate <1.5
    #label QuarryEnd
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头乔尼·石眉|r和|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .turnin 432 >>交任务: |cRXP_FRIENDLY_该死的石腭怪！|r
    .goto Dun Morogh,69.084,56.330
    .target +Foreman Stonebrow
    .turnin 433 >>交任务: |cRXP_FRIENDLY_公众之仆|r
    .goto Dun Morogh,68.671,55.969
    .target +Senator Mehr Stonehallow
step
    #xprate >1.49
    #label QuarryEnd
    .goto Dun Morogh,69.084,56.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .turnin 432 >>交任务: |cRXP_FRIENDLY_该死的石腭怪！|r
    .target Foreman Stonebrow
    .isQuestComplete 432
step << !Warrior !Rogue !Paladin
    .goto Dun Morogh,68.614,54.643
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡杉·莫格什|r谈话
    .vendor >>|cRXP_BUY_从他那里购买最多 20|r|T132815:0|t[冰镇牛奶]|r
    .target Kazan Mogosh
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
    >>击杀|cRXP_ENEMY_有伤疤的峭壁野猪|r 和|cRXP_ENEMY_老峭壁野猪|r . 击败它们后拾取 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob Scarred Crag Boar
    .mob Elder Crag Boar
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
    >>击杀|cRXP_ENEMY_有伤疤的峭壁野猪|r 和|cRXP_ENEMY_老峭壁野猪|r . 击败它们后拾取 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_现在不用特意去刷这个任务. 只需击杀并拾取你遇到的所有野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob Scarred Crag Boar
    .mob Elder Crag Boar
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
step
    .goto Dun Morogh,81.2,42.7,45,0
    .goto Dun Morogh,83.892,39.188
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .accept 419 >>接任务: |cRXP_LOOT_失踪的驾驶员|r
    .target Pilot Hammerfoot
step
    .goto Dun Morogh,79.672,36.171
    >>点击地面上的|cRXP_PICK_Dwarven Corpse|r
    .turnin 419 >>交任务: |cRXP_FRIENDLY_失踪的驾驶员|r
    .accept 417 >>接任务: |cRXP_LOOT_驾驶员的复仇|r
step << Mage
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_癞爪|r. 击败他后搜刮出 |T134939:0|t[|cRXP_FRIENDLY_法术注释: RING SEFF OSTROF|r]
    .collect 203753,1 -- Spell Notes: RING SEFF OSTROF (1)
    .train 401765,1
step
    .goto Dun Morogh,78.97,37.14
    >>击杀|cRXP_ENEMY_癞爪|r. 击败后搜刮其掉落的|cRXP_LOOT_爪|r
    .complete 417,1 --Collect Mangy Claw (x1)
    .mob Mangeclaw
step << Mage
    #season 2
    #completewith enterloch
    .collect 211779,1 >>你需要从一个|cRXP_FRIENDLY_试剂商|r处获得 |T135933:0|t[理解之魅], 才能使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:RING SEFF OSTROF|r]
    .train 401765 >>|cRXP_WARN_请使用|r|T134939:0|t[|cRXP_FRIENDLY_ 法术备注:林格·塞夫·奥斯特罗夫|r]|cRXP_WARN_来训练|r|T236227:0|t[冰霜之指]
    .use 203753
step
    #label Revenge
    .goto Dun Morogh,83.892,39.188
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .turnin 417,1 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r << Rogue
    .turnin 417 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r << !Rogue
    .target Pilot Hammerfoot
step << Rogue
    #optional
    #completewith next
    +|cRXP_WARN_在你的副手装备|r|T135641:0|t[工匠匕首]|r
    .use 2218
    .itemcount 2218,1
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step
    #label enterloch
    .goto Dun Morogh,84.4,31.1,25 >>穿过隧道前往洛克莫丹
    .zoneskip Loch Modan
]])

RXPGuides.RegisterGuide([[
#classic
#season 0,1
#version 1
<< Alliance
#group RestedXP 联盟 1-20级
#name 11-13 洛克莫丹
#displayname 13-15 洛克莫丹 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << SoD
#displayname 11-13 洛克莫丹 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 13-15 西部荒野；14-16 黑海岸
#defaultfor Human

step
    #optional
    #completewith next
    .goto Loch Modan,24.134,18.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高索·布鲁姆|r交谈
    .vendor >>NPC与修理
    .target Gothor Brumn
step
    .goto Loch Modan,24.764,18.397
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    >>|cRXP_WARN_暂时不要接受卡尔·雷矛的订单|r
    .turnin 353 >>交任务: |cRXP_FRIENDLY_雷矛的包裹|r
    .accept 307 >>接任务: |cRXP_LOOT_肮脏的爪子|r
    .target Mountaineer Stormpike
step
    #optional
    #label BoarMeatLoch1
    #completewith ThelsamarFirst
    .goto 1426,70.845,51.784,0
    .goto 1426,73.533,50.850,0
    .goto 1426,75.353,48.533,0
    .goto 1426,79.881,46.805,0
    .goto 1426,81.040,43.456,0
    .goto 1426,80.583,36.040,0
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后搜刮其掉落的 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_这将用于提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_later 等级|r
    >>|cRXP_WARN_你需要 10|r|T133971:0|t[烹饪]|cRXP_WARN_, 稍后在奥伯丁完成任务|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob Mountain Boar
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 144 --Thelsamar
step
    #optional
    #requires BoarMeatLoch1
    #completewith ThelsamarFirst
    .goto 1426,70.845,51.784,0
    .goto 1426,73.533,50.850,0
    .goto 1426,75.353,48.533,0
    .goto 1426,79.881,46.805,0
    .goto 1426,81.040,43.456,0
    .goto 1426,80.583,36.040,0
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后搜刮其掉落的 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_这将用于提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_later 等级|r
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能在夜色镇完成后续任务|r
    >>|cRXP_WARN_现在不用特意去刷这个任务. 只需击杀并拾取你遇到的所有野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob Mountain Boar
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 144
step
    #optional
    #completewith ThelsamarFirst
    >>击杀|cRXP_ENEMY_老黑熊|r. 从他们身上获取 |T134027:0|t|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r. 击败后可获得其掉落的 |T134342:0|t|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r. 从他们身上搜刮出 |T134437:0|t|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +Elder Black Bear
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +Mountain Boar
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +Forest Lurker
    .subzoneskip 144
step
    #optional
    #completewith next
    #label Thelsamar
    .subzone 144 >>前往塞尔萨玛
step
    #requires Thelsamar
    #completewith next
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .accept 416 >>接任务: |cRXP_LOOT_狗头人的耳朵|r
    .accept 1339 >>接任务: |cRXP_LOOT_巡山人卡尔·雷矛的任务|r
    .target Mountaineer Kadrell
step
    #label ThelsamarFirst
    .goto Loch Modan,34.828,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .accept 418 >>接任务: |cRXP_LOOT_塞尔萨玛血肠|r
    .target Vidra Hearthstove
step
    #optional
    .goto Loch Modan,34.828,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .turnin 418 >>交任务: |cRXP_FRIENDLY_塞尔萨玛血肠|r
    .target Vidra Hearthstove
    .isQuestComplete 418
step
    #optional
    #competewith StormpikeO
    .abandon 1338 >>放弃风暴峰的命令. 这将解锁巡山人卡尔·雷矛的任务, 完成后可获得550点免费经验
step
    #completewith next
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尼·铁心|r交谈
    .vendor 1682 >>|cRXP_BUY_如果需要, 最多从她那里购买 2|r |T133634:0|t[小棕色袋] |r
    .target Yanni Stoutheart
step
    .goto Loch Modan,35.534,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r交谈
    .vendor 6734 >>|cRXP_BUY_购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_. 目标是拥有大约20个|r << !Warrior !Rogue
    .target Innkeeper Hearthstove
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
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .accept 416 >>接任务: |cRXP_LOOT_狗头人的耳朵|r
    .accept 1339 >>接任务: |cRXP_LOOT_巡山人卡尔·雷矛的任务|r
    .target Mountaineer Kadrell
step
    #optional
    #label BoarMeatLoch2
    #completewith SilverStream
    .goto 1426,70.845,51.784,0
    .goto 1426,73.533,50.850,0
    .goto 1426,75.353,48.533,0
    .goto 1426,79.881,46.805,0
    .goto 1426,81.040,43.456,0
    .goto 1426,80.583,36.040,0
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后搜刮其掉落的 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob Mountain Boar
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 146 --Stonewrought Dam
    .subzoneskip 149 --Silver Stream Mine
step
    #optional
    #requires BoarMeatLoch2
    #completewith SilverStream
    .goto 1426,70.845,51.784,0
    .goto 1426,73.533,50.850,0
    .goto 1426,75.353,48.533,0
    .goto 1426,79.881,46.805,0
    .goto 1426,81.040,43.456,0
    .goto 1426,80.583,36.040,0
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后搜刮其掉落的 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_现在不用特意去刷这个任务. 只需击杀并拾取你遇到的所有野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob Mountain Boar
--  .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 146 --Stonewrought Dam
    .subzoneskip 149 --Silver Stream Mine
step
    #optional
    #completewith SilverStream
    >>击杀|cRXP_ENEMY_老黑熊|r. 从他们身上获取 |T134027:0|t|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r. 击败后可获得其掉落的 |T134342:0|t|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r. 从他们身上搜刮出 |T134437:0|t|cRXP_LOOT_蜘蛛的毒液|r
    .mob +Elder Black Bear
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +Mountain Boar
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +Forest Lurker
    .subzoneskip 146 --Stonewrought Dam
    .subzoneskip 149 --Silver Stream Mine
step
    #xprate <1.59
    #completewith MinerGear
    >>击杀|cRXP_ENEMY_坑道鼠|r. 击杀后搜刮出他们的 |T133854:0|t|cRXP_LOOT_坑道鼠的耳朵|r|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Vermin
    .mob Tunnel Rat Forager
    .mob Tunnel Rat Geomancer
    .mob Tunnel Rat Digger
    .mob Tunnel Rat Surveyor
step
    #optional
    #label SilverStream
    #completewith MinerGear
    .goto Loch Modan,35.50,18.97,20 >>前往银溪矿场, 途中击杀|cRXP_ENEMY_Kobolds|r以获得|T133854:0|t[|cRXP_LOOT_Ears|r]
step
    #xprate >1.59
    #completewith BuyMace << Paladin/Warrior
    #completewith MinerGear << !Paladin !Warrior
    >>击杀|cRXP_ENEMY_坑道鼠|r. 击杀后搜刮出他们的 |T133854:0|t|cRXP_LOOT_坑道鼠的耳朵|r|r
    >>|cRXP_WARN_不要特意去接这个任务, 因为你很可能会跳过它|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Vermin
    .mob Tunnel Rat Forager
    .mob Tunnel Rat Geomancer
    .mob Tunnel Rat Digger
    .mob Tunnel Rat Surveyor
step
    #requires SilverStream
    #label MinerGear
    .goto Loch Modan,35.93,22.55
    >>打开|cRXP_PICK_矿工联盟的储物箱|r. 搜刮其中的|cRXP_LOOT_矿工联盟装备|r
    >>|cRXP_WARN_|cRXP_PICK_矿工联盟的储物箱|r 可在矿井各处找到|r
    >>|cRXP_WARN_如果你现在想跳过这个任务, 可以等到更高等级时再来完成|r
    .complete 307,1 -- Miners' Gear (4)
step << Paladin/Warrior
    #label BuyMace
    .goto Loch Modan,42.867,9.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔伦·安德玛|r交谈
    >>|cRXP_BUY_购买|r |T133476:0|t[重型尖刺钉锤] |cRXP_BUY_或|r |T133053:0|t[铁木槌] |cRXP_BUY_(如果有的话)|r
    >>|cRXP_WARN_如果你负担不起, 就去附近的|r|cRXP_ENEMY_隧道老鼠|r那里刷钱, 直到凑够足够的金额|r
    >>|cRXP_WARN_请尽快完成此操作, 因为其他玩家可能会先于你购买|r
    >>|cRXP_WARN_如果你不想这样做, 请跳过此步骤|r
    .collect 4778,1,307,1 --Heavy Spiked Mace (1)
    .collect 4777,1,307,1 --Ironwood Maul (1)
    .target Nillen Andemar
    .itemcount 4778,<1 --Heavy Spiked Mace (<1)
    .itemcount 4777,<1 --Ironwood Maul (<1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Paladin/Warrior
    #optional
    #completewith StormpikeDelivery
    +|cRXP_WARN_装备|r|T133476:0|t[重型尖刺钉锤]
    .use 4778
    .itemcount 4778,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp <14,1
step << Paladin/Warrior
    #optional
    #completewith StormpikeDelivery
    +|cRXP_WARN_装备|r|T133053:0|t[铁木槌]
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
    >>击杀|r|cRXP_ENEMY_Tunnel Rats|r. 击杀后搜刮出他们的|r|T133854:0|t|cRXP_LOOT_Ears|r
    >>|cRXP_WARN_请确保你拥有10|r|T132889:0|t[亚麻布]|cRXP_WARN_, 以便完成即将开始的圣骑士职业任务|r << Paladin
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .collect 2589,10,1644,1,1 << Human Paladin -- Linen Cloth (10)
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Vermin
    .mob Tunnel Rat Forager
    .mob Tunnel Rat Geomancer
    .mob Tunnel Rat Digger
    .mob Tunnel Rat Surveyor
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
    >>击杀|r|cRXP_ENEMY_Tunnel Rats|r. 击杀后搜刮出他们的|r|T133854:0|t|cRXP_LOOT_Ears|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Vermin
    .mob Tunnel Rat Forager
    .mob Tunnel Rat Geomancer
    .mob Tunnel Rat Digger
    .mob Tunnel Rat Surveyor
    .itemcount 3110,6 --Tunnel Rat Ear
step
    #optional
    #label BoarMeatLoch3
    #completewith ThelsamarTwo
    .goto 1426,70.845,51.784,0
    .goto 1426,73.533,50.850,0
    .goto 1426,75.353,48.533,0
    .goto 1426,79.881,46.805,0
    .goto 1426,81.040,43.456,0
    .goto 1426,80.583,36.040,0
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后搜刮其掉落的 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    .collect 769,10,2178,1,0x20,cooking --Chunk of Boar Meat (1-10)
    .mob Mountain Boar
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 144 --Thelsamar
    .subzoneskip 925 --Algaz Station
step
    #optional
    #requires BoarMeatLoch3
    #completewith ThelsamarTwo
    .goto 1426,70.845,51.784,0
    .goto 1426,73.533,50.850,0
    .goto 1426,75.353,48.533,0
    .goto 1426,79.881,46.805,0
    .goto 1426,81.040,43.456,0
    .goto 1426,80.583,36.040,0
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后搜刮其掉落的 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|cRXP_WARN_现在不用特意去刷这个任务. 只需击杀并拾取你遇到的所有野猪即可|r
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (10-50)
    .mob Mountain Boar
    .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 1-50
    .subzoneskip 144 --Thelsamar
    .subzoneskip 925 --Algaz Station
step
    #sticky
    #label CookingQEnd
    #loop
    >>击杀|cRXP_ENEMY_老黑熊|r. 从他们身上获取 |T134027:0|t|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r. 击败后可获得其掉落的 |T134342:0|t|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r. 从他们身上搜刮出 |T134437:0|t|cRXP_LOOT_蜘蛛的毒液|r
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
    .mob +Elder Black Bear
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .goto Loch Modan,38.0,34.9,0
    .goto Loch Modan,29.8,35.9,0
    .goto Loch Modan,28.6,22.6,0
    .waypoint Loch Modan,38.0,34.9,90,0
    .waypoint Loch Modan,37.1,39.8,90,0
    .waypoint Loch Modan,29.8,35.9,90,0
    .waypoint Loch Modan,27.7,25.3,90,0
    .waypoint Loch Modan,28.6,22.6,90,0
    .mob +Mountain Boar
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .goto Loch Modan,31.9,16.4,0
    .goto Loch Modan,33.8,40.5,0
    .goto Loch Modan,39.0,32.1,0
    .waypoint Loch Modan,31.9,16.4,90,0
    .waypoint Loch Modan,28.0,20.6,90,0
    .waypoint Loch Modan,33.8,40.5,90,0
    .waypoint Loch Modan,36.2,30.9,90,0
    .waypoint Loch Modan,39.0,32.1,90,0
    .mob +Forest Lurker
step
    #completewith StormpikeDelivery
    #label StormpikeStop
    .goto Loch Modan,24.134,18.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高索·布鲁姆|r交谈
    .vendor >>|cRXP_WARN_如果需要, 请向商人购买物品并修理装备|r
    .target Gothor Brumn
step << Human
    #xprate <1.59
    #label StormpikeDelivery
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 307 >>交任务: |cRXP_FRIENDLY_肮脏的爪子|r
    .turnin 1339 >>交任务: |cRXP_FRIENDLY_巡山人卡尔·雷矛的任务|r
    .accept 1338 >>接任务: |cRXP_LOOT_卡尔·雷矛的订单|r
    .target Mountaineer Stormpike
    .dungeon !DM
step << Human
    #xprate >1.59
    #label StormpikeDelivery
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 307 >>交任务: |cRXP_FRIENDLY_肮脏的爪子|r
    .turnin 1339 >>交任务: |cRXP_FRIENDLY_巡山人卡尔·雷矛的任务|r
    .accept 1338 >>接任务: |cRXP_LOOT_卡尔·雷矛的订单|r << Mage/Warlock/Rogue
    .target Mountaineer Stormpike
    .dungeon !DM
step
    #label ThelsamarTwo
    .subzone 144 >>前往塞尔萨玛
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
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .target Mountaineer Kadrell
    .turnin 416 >>交任务: |cRXP_FRIENDLY_狗头人的耳朵|r
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
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .target Mountaineer Kadrell
    .turnin 416 >>交任务: |cRXP_FRIENDLY_狗头人的耳朵|r
    .isQuestComplete 416
step
    #xprate >1.59
    #optional
    #sticky
    #label RatAbandon
    .abandon 416 >>放弃收集狗头人耳朵任务
step
    #optional
    #completewith FlintTinder
    .goto 1432,35.273,47.750,10,0
    .goto 1432,35.433,48.243,12 >>进入豪饮旅店
step
    .goto Loch Modan,34.828,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .turnin 418 >>交任务: |cRXP_FRIENDLY_塞尔萨玛血肠|r
    .target Vidra Hearthstove
step
    #label FlintTinder
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尼·铁心|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T135435:0|t[普通木柴]|cRXP_BUY_和 a|r|T135237:0|t[燧石和火绒]|r
    >>|cRXP_WARN_此功能用于在船上或电车上制作|r|T135805:0|t[基础营火]|cRXP_WARN_, 以提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_技能, 而无需浪费时间|r
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .target Yanni Stoutheart
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈, 他在外面
    .fp Thelsamar >>获取塞尔萨玛的飞行路径
    .target Thorgrum Borrelson
step
    #optional
    #completewith next
    .goto Loch Modan,24.78,70.17,10,0
    .goto Loch Modan,23.73,75.52,15 >>沿着泥土小路跑上去, 然后跳进掩体中
step
    #xprate <1.59
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与掩体中的|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .accept 267 >>接任务: |cRXP_LOOT_穴居人的威胁|r
    .target Captain Rugelfuss
step
    #xprate <1.59
    #label DefenseStart
    .goto Loch Modan,22.071,73.127
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >>接任务: |cRXP_LOOT_保卫国王的领土|r
    .target Mountaineer Cobbleflint
step
    #xprate >1.59
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与掩体中的|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .accept 267 >>接任务: |cRXP_LOOT_穴居人的威胁|r
    .target Captain Rugelfuss
    .xp >14,1 << !Warrior
step
    #xprate >1.59
    #label DefenseStart
    .goto Loch Modan,22.071,73.127
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >>接任务: |cRXP_LOOT_保卫国王的领土|r
    .target Mountaineer Cobbleflint
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
    >>击杀|cRXP_ENEMY_Troggs|r. 击杀后搜刮出|cRXP_LOOT_Skull-Shaped Geode|r
    .collect 208847,1 -- Skull-Shaped Geode (1)
    .mob Stonesplinter Scout
    .mob Stonesplinter Trogg
    .train 425443,1
step
    #xprate <1.5
    .goto Loch Modan,27.33,56.70
    >>击杀|cRXP_ENEMY_碎石穴居人|r 和|cRXP_ENEMY_碎石怪斥候|r . 击杀后搜刮他们的|cRXP_LOOT_牙齿|r
    >>|cRXP_WARN_请确保你拥有10|r|T132889:0|t[亚麻布]|cRXP_WARN_, 以便完成即将开始的圣骑士职业任务|r << Paladin
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .mob +Stonesplinter Trogg
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .mob +Stonesplinter Scout
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob +Stonesplinter Trogg
    .mob +Stonesplinter Scout
    .collect 2589,10,1644,1,1 << Human Paladin -- Linen Cloth (10)
    .mob +Stonesplinter Trogg
    .mob +Stonesplinter Scout
step
    #xprate >1.49
    .goto Loch Modan,27.33,56.70
    >>击杀|cRXP_ENEMY_碎石穴居人|r 和|cRXP_ENEMY_碎石怪斥候|r . 击杀后搜刮他们的|cRXP_LOOT_牙齿|r
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .mob +Stonesplinter Trogg
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .mob +Stonesplinter Scout
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob +Stonesplinter Trogg
    .mob +Stonesplinter Scout
    .isOnQuest 224
    .isOnQuest 267
step << Warlock
    #xprate <1.5
    #optional
    #completewith TroggT
    .goto Loch Modan,27.33,56.70,0
    +击杀|cRXP_ENEMY_Troggs|r直到你获得价值75银79铜的商人垃圾/金钱
    .money >0.7579
step << Warlock
    #xprate >1.49
    #optional
    #completewith TroggT
    .goto Loch Modan,27.33,56.70,0
    +击杀|cRXP_ENEMY_Troggs|r直到你获得价值 42银39铜的商人垃圾/金钱
    .money >0.4239
step << Warlock
    #xprate <1.5
    #optional
    .goto Loch Modan,27.33,56.70
    .xp 13+9600 >>刷怪直到经验达到9600/11400
step
    #optional
    #xprate 1.49-1.59
    .goto Loch Modan,27.33,56.70
    .xp 13+8700 >>升级至8700/11400经验值
step
    #optional
    #xprate >1.59
    .goto Loch Modan,27.33,56.70
    .xp 13+7800 >>升级至7800/11400经验
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
    >>击杀|cRXP_ENEMY_碎石怪先知|r. 击败他们后可掉落 |T134939:0|t[|cRXP_FRIENDLY_咀嚼过的法术笔记]|r
    .collect 208854,1
    .mob Stonesplinter Seer
    .train 415936,1
step << Mage
    #xprate <1.5
    #season 2
    #completewith HumbleBeginnings
    .collect 211779,1 >>你需要从一个|cRXP_FRIENDLY_试剂商|r处获得一个|T135933:0|t[理解之魅]|r, 才能使用|T134939:0|t[|cRXP_FRIENDLY_咀嚼过的法术笔记]|r
    .train 415936 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_咀嚼过的咒语笔记|r]|cRXP_WARN_来训练|r|T236220:0|t[活体炸弹]
    .use 208854
step << Warrior
    #season 2
    #requires Geode
    .goto Loch Modan,30.47,79.71
    >>击杀碎石怪击颅者
    >>|cRXP_WARN_在战斗中它会击中你, 将|cRXP_LOOT_骷髅形晶石|r变成|r|T236489:0|t[|cRXP_LOOT_碎裂的骷髅形晶石|r]
    .collect 208848,1 -- Cracked Skull-Shaped Geode (1)
    .mob Stonesplinter Skullthumper
    .train 425443,1
step << Warrior
    #season 2
    .use 208848 >>|cRXP_WARN_使用|r|T236489:0|t[|cRXP_LOOT_裂开的骷髅形矿石|r]|cRXP_WARN_来获取|r|T134419:0|t[|cRXP_FRIENDLY_迅击符文|r]
    .collect 208778,1 -- Rune of Quick Strike (1)
    .train 425443,1
step << Warrior
    #season 2
    .train 425443 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_快速打击符文|r]|cRXP_WARN_来训练|r|T132394:0|t[快速打击]
    .use 208778
    .itemcount 208778,1
step
    #xprate <1.5
    #optional
    .goto Loch Modan,27.33,56.70
    +继续击杀|cRXP_ENEMY_Troggs|r, 直到你的 |T134414:0|t[炉石] 剩余时间少于 1 分钟
    .cooldown item,6948,<60
step
    #optional
    #completewith next
    .goto Loch Modan,24.78,70.17,10,0
    .goto Loch Modan,23.73,75.52,15 >>沿着泥土小路跑上去, 然后跳进掩体中
step
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .turnin 267 >>交任务: |cRXP_FRIENDLY_穴居人的威胁|r
    .target Captain Rugelfuss
    .isQuestComplete 267
step
    #label TroggT
    .goto Loch Modan,22.071,73.127
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .turnin 224 >>交任务: |cRXP_FRIENDLY_保卫国王的领土|r
    .target Mountaineer Cobbleflint
    .isQuestComplete 224
step
    #xprate >1.49
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .fly Ironforge >>飞往铁炉堡
    .target Thorgrum Borrelson
    .zoneskip Ironforge
    .cooldown item,6948,<0
step
    #xprate >1.49
    .hs >>前往: |cRXP_PICK_铁炉堡|r
    .zoneskip Ironforge
    .cooldown item,6948,>0,1
step
    #xprate <1.5
    #completewith HumbleBeginnings
    .hs >>返回暴风城
    .zoneskip Stormwind City
--XX Start of <1.5x section
step << Warlock/Priest
    #xprate <1.5
    #ssf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135468:0|t[烟尘魔杖]|r
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    .collect 5208,1 --Smoldering Wand (1)
    .target Ardwyn Cailen
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
step << Warlock/Priest
    #xprate <1.5
    #ah
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    >>|cRXP_BUY_购买|r|T135468:0|t[烟尘魔杖] |cRXP_BUY_或从她处购买, 或前往拍卖行获取|r|T135144:0|t[强效魔法杖]
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    .collect 5208,1 --Smoldering Wand (1)
    .target Ardwyn Cailen
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    --not adding .money tag to this step. user could have less silver than vendor wand but cheaper ones may exist on the AH
step << Warlock/Priest
    #xprate <1.5
    #optional
    #completewith next
    +|cRXP_WARN_装备|r|T135468:0|t[烟尘魔杖]
    .use 5208
    .itemcount 5208,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp <15,1
step << Warlock/Priest
    #xprate <1.5
    #optional
    #completewith next
    +|cRXP_WARN_记得在达到15级时装备|r|T135468:0|t[烟尘魔杖]|cRXP_WARN_later|r
    .use 5208
    .itemcount 5208,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp >15,1
step << Warlock
    #xprate <1.5
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock
    #xprate <1.5
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >>训练你的职业法术
    .target Ursula Deline
step << Warlock
    #xprate <1.5
    .goto StormwindClassic,25.665,77.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯巴克尔|r交谈
    .vendor >>|cRXP_BUY_购买|r|T133738:0|t[魔典：吞噬暗影(等级 1)]|cRXP_BUY_和|r|T133738:0|t[魔典：牺牲(等级 1)]|cRXP_BUY_, 如果你负担得起的话. 如果暂时无法购买, 可以稍后再买|r
    .target Spackle Thornberry
step << Mage
    #xprate <1.5
    #optional
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >>前往法师塔
step << Mage
    #xprate <1.5
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .trainer >>训练你的职业法术
    .target Elsharin
step << Priest/Paladin
    #xprate <1.5
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step << Human Paladin
    #xprate <1.5
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .accept 1641 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1641 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Duthorian Rall
step << Human Paladin
    #xprate <1.5
    .goto StormwindClassic,39.80,29.77
    >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_圣洁之书|r] 开始任务|r
    .accept 1642 >>接任务: |cRXP_LOOT_圣洁之书|r
    .use 6775
step << Human Paladin
    #xprate <1.5
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1642 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1643 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Duthorian Rall
step << Paladin
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    .trainer >>训练你的职业法术
    .target Arthur the Faithful
step << Paladin
    #xprate <1.5
    #season 2
    .goto StormwindClassic,38.10,28.10
    .gossipoption 109653 >>与|cRXP_FRIENDLY_罗穆卢斯兄弟|r交谈
    .target Brother Romulus
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
    >>下楼前往大教堂墓穴的西侧
    .goto StormwindClassic,32.86,24.77,8 >>前往墓穴中的|cRXP_LOOT_焦黑的笔记|r
    .train 410015,1
step << Paladin
    #xprate <1.5
    #season 2
    .goto StormwindClassic,32.86,24.87
    >>拾取蜡烛旁边的|cRXP_LOOT_焦黑笔记|r
    .collect 205864,1 --Charred Note (1)
    .train 410015,1
step << Priest
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒修士|r谈话
    .goto StormwindClassic,38.54,26.86
    .trainer >>训练你的职业法术
    .target Brother Joshua
step << Warrior
    #xprate <1.5
    #season 2
    .gossipoption 109045 >>与旅店内的|cRXP_FRIENDLY_Liv Bradford|r交谈
    .gossipoption 109047
    .goto Stormwind City,22.608,64.621
    .gossipoption 109084 >>与|cRXP_ENEMY_Stuart|r交谈, 然后击败他. 当他血量降至 0% 时会晕倒
    .goto Stormwind City,21.213,62.781
    >>如果|cRXP_ENEMY_Stuart|r不在, 就等待他刷新
    .gossipoption 109044 >>击败|cRXP_ENEMY_斯图尔特|r后, 再次与|cRXP_FRIENDLY_丽芙·布拉德福德|r交谈, 以获得|T134419:0|t[|cRXP_FRIENDLY_狂暴冲锋符文|r]
    .goto Stormwind City,22.608,64.621
    .train 425447,1 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狂怒冲击符文|r]|cRXP_WARN_来训练|r|T236317:0|t[狂怒冲击]
    .use 204716
    .target Liv Bradford
    .mob Stuart
step
    #xprate <1.5
    #label HumbleBeginnings
    .goto StormwindClassic,49.194,30.284
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r交谈
    .accept 399 >>接任务: |cRXP_WARN_童年的记忆|r
    .target Baros Alexston
step
    #xprate <1.5
    .goto StormwindClassic,58.091,16.552
    .target Furen Longbeard
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗伦·长须|r交谈
    .turnin 1338 >>交任务: |cRXP_FRIENDLY_卡尔·雷矛的订单|r
    .dungeon !DM
step << Rogue
    #xprate <1.5
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Osborne|r交谈
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
step << Warrior
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wu|r或|cRXP_FRIENDLY_Ilsa|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >>训练你的职业法术
    .target Wu Shen
    .target Ilsa Corbin
step << Human Paladin
    #xprate <1.5
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯蒂芬妮·特纳|r交谈
    .turnin 1643 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Stephanie Turner
    .accept 1644 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1644 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    --.accept 1780 >>接任务: |cRXP_LOOT_圣洁之书|r
step << Rogue
    #xprate <1.5
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_如果你负担得起, 最多可以向她购买 2|r|T135343:0|t[战士阔剑]|cRXP_BUY_, 或者你也可以从拍卖行购买更优质或更便宜的装备|r
    >>|cRXP_WARN_达到14级后装备这两件物品|r
    .collect 2027,2 --Scimitar
    .target Marda Weller
    .money <0.3815
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    #xprate <1.5
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_如果你负担得起, 最多可以从她那里购买 2|r|T135343:0|t[战士阔剑]|r
    >>|cRXP_WARN_达到14级后装备这两件物品|r
    .collect 2027,2 --Scimitar
    .money <0.3815
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target Marda Weller
step << Rogue
    #xprate <1.5
    #optional
    #completewith next
    +|cRXP_WARN_装备|r|T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .xp <14,1
step
    #xprate <1.5
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_BUY_购买|r|T133970:0|t|cRXP_LOOT_[野猪肉块]|r|cRXP_BUY_和/或|r|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_BUY_以提升你的|r|T133971:0|t[烹饪] |cRXP_BUY_等级, 稍后使用|r
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能在夜色镇完成后续任务|r
    >>|cRXP_WARN_如果你不想或无法完成此步骤, 请跳过|r
    >>|cRXP_BUY_请尽快在西部荒野和黑海岸购买以下物品, 以加快任务提交速度:|r
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝脏]
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    >>|T133970:0|t|cRXP_LOOT_[野猪肉块]|r
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
    .target Auctioneer Jaxon
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #xprate <1.5
    #ah
    #optional
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_WARN_如果你不想或无法完成此步骤, 请跳过|r
    >>|cRXP_BUY_请尽快在西部荒野和黑海岸购买以下物品, 以加快任务提交速度:|r
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝脏]
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- Okra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target Auctioneer Jaxon
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
step
    #xprate <1.5
    .goto StormwindClassic,66.28,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .turnin 6261 >>交任务: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .accept 6285 >>接任务: |cRXP_LOOT_返回西部荒野|r
    .target Dungar Longdrink
step
    #xprate <1.5
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >>飞往西部荒野
    .target Dungar Longdrink



--XX End of <1.5x section
----Darkshore transit (>1.49x)----




step << Mage
    #xprate >1.49
    .goto Ironforge,27.18,8.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈
    .trainer >>训练你的职业法术
    .target Dink
step << Mage/Priest/Warlock
    #xprate >1.49
    #ah
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡拍卖商交谈|r
    >>|cRXP_BUY_购买|r|T135144:0|t[强效魔法杖]|cRXP_BUY_如果价格低于33s 40c|r
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    .collect 11288,1 --Greater Magic Wand (1)
    .target Auctioneer Lympkin
    .target Auctioneer Redmuse
    .target Auctioneer Buckler
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.5
    .money <0.7579 << Warlock/Mage
step << Mage/Priest/Warlock
    #xprate >1.49
    #ah
    #optional
    +|cRXP_WARN_装备|r|T135144:0|t[强效魔法杖]
    .use 11288
    .itemcount 11288,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.5
step << Priest/Warlock
    #xprate >1.49
    #optional
    .goto Ironforge,22.837,17.094,8,0
    .goto Ironforge,21.131,17.276,5,0
    .goto Ironforge,23.135,15.936
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_哈瑞克·石鼓|r交谈
    >>|cRXP_BUY_从他那里购买一把|r|T135468:0|t[烟尘魔杖]|r
    .collect 5208,1 --Smoldering Wand (1)
    .target Harick Boulderdrum
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .money <0.7579 << Warlock
step << Priest/Warlock
    #xprate >1.49
    #optional
    #completewith next
    +|cRXP_WARN_装备|r|T135468:0|t[烟尘魔杖]
    .use 5208
    .itemcount 5208,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp <15,1
step << Priest/Warlock
    #xprate >1.49
    #optional
    #completewith next
    +|cRXP_WARN_记得在达到15级时装备|r|T135468:0|t[烟尘魔杖]|cRXP_WARN_later|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡拍卖商交谈|r
    >>|cRXP_BUY_购买|r|T133970:0|t|cRXP_LOOT_[野猪肉块]|r|cRXP_BUY_和/或|r|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_BUY_以提升你的|r|T133971:0|t[烹饪] |cRXP_BUY_等级, 稍后使用|r
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能在夜色镇完成后续任务|r
    >>|cRXP_WARN_如果你不想或无法完成此步骤, 请跳过|r
    >>|cRXP_BUY_请购买以下物品, 以便在黑海岸快速提交任务:|r
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    >>|T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    >>|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .collect 769,50,2178,1,0x20,cooking --Chunk of Boar Meat (1-50)
    .disablecheckbox
    .collect 2672,50,2178,1,0x20,cooking --Stringy Wolf Meat (1-50)
    .disablecheckbox
    .target Auctioneer Lympkin
    .target Auctioneer Redmuse
    .target Auctioneer Buckler
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #xprate >1.49
    #ah
    #optional
    .goto 1455,33.225,64.648,0
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡拍卖商交谈|r
    >>|cRXP_WARN_如果你不想或无法完成此步骤, 请跳过|r
    >>|cRXP_BUY_请购买以下物品, 以便在黑海岸快速提交任务:|r
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target Auctioneer Lympkin
    .target Auctioneer Redmuse
    .target Auctioneer Buckler
    .skill cooking,<50,1 --XX Shows if cooking skill is 50+
step << skip --logout skip << Mage
    #xprate >1.49
    #ah
    #hardcore << !Human
    #optional
    #completewith next
    .goto 1455,33.220,64.649
    .zone Dun Morogh >>|cRXP_WARN_前往: |cRXP_PICK_丹莫罗|r, 跳到 |cRXP_PICK_邮箱|r 的顶部，然后通过注销并重新登录执行注销跳过|r
step << Rogue
    #xprate >1.49
    #ah
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    .vendor 5120 >>|cRXP_BUY_如果你负担得起, 可以向她购买一把|r|T135343:0|t[战士阔剑]|cRXP_BUY_, 否则也可以去拍卖行看看是否有更划算的替代品|r
    .target Brenwyn Wintersteel
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Rogue
    #xprate >1.49
    #ssf
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    .vendor 5120 >>|cRXP_BUY_如果你负担得起, 可以从她那里购买一把|r|T135343:0|t[战士阔剑]|r
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target Brenwyn Wintersteel
step << Rogue
    #xprate >1.49
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r|T135425:0|t[锐利投掷匕首]|cRXP_BUY_从她那里|r
    .collect 3107,100 -- Keen Throwing Dagger
    .target Brenwyn Wintersteel
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    #xprate >1.49
    #optional
    #completewith next
    +|cRXP_WARN_装备|r|T135425:0|t[锐利投掷匕首]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Warrior
    #xprate >1.49
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比尔班·飞钳|r交谈
    .trainer >>训练你的职业法术
    .target Bilban Tosslespanner
step << skip --logout skip << Warrior
    #xprate >1.49
    #hardcore << !Human
    #optional
    #completewith next
    .goto 1455,68.198,89.713
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_前往: |cRXP_PICK_丹莫罗|r, 跳到武器架顶部。通过登出并重新登录来执行登出跳过|r
step << Warlock
    #xprate >1.49
    .goto Ironforge,51.1,8.7,15,0
    .goto Ironforge,50.343,5.657
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞尔索恩|r交谈
    .trainer >>训练你的职业法术
    .target Briarthorn
step << Gnome Rogue/Dwarf Rogue
    #xprate 1.49-1.59
    #optional
    .goto Ironforge,51.958,14.838
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下 |cRXP_FRIENDLY_霍夫丹·黑须|r 交谈
    .turnin 2218 >>交任务: |cRXP_FRIENDLY_救赎之路|r
    .target Hulfdan Blackbeard
    .isOnQuest 2218
step << Rogue
    #xprate >1.49
    .goto Ironforge,51.495,15.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_芬斯维克|r交谈
    .trainer >>训练你的职业法术
    .target Fenthwick
step << Warlock/Rogue
    #xprate >1.49
    #hardcore << !Human Rogue
    #optional
    #label Jubahl
    #completewith next
    .goto 1455,53.164,7.037,10 >>进入|cRXP_FRIENDLY_寻尸者祖贝尔|r的房子
step << Warlock
    #xprate >1.49
    .goto Ironforge,53.2,7.8,15,0
    .goto Ironforge,52.701,6.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_寻尸者祖贝尔|r交谈
    .vendor >>|cRXP_BUY_购买|r|T133738:0|t[魔典：吞噬暗影(等级 1)]|cRXP_BUY_和|r|T133738:0|t[魔典：牺牲(等级 1)]|cRXP_BUY_, 如果你负担得起的话|r
    .target Jubahl Corpseseeker
step << skip --logout skip << Warlock/Rogue
    #xprate >1.49
    #hardcore << !Human
    #optional
    #requires Jubahl
    #completewith next
    .goto 1455,52.825,5.060
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶, 然后跳到书架顶. 通过退出再重新登录来完成登出跳过(Logout Skip)|r
step << Priest
    #xprate >1.49
    .goto Ironforge,25.207,10.756
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托德雷·铁矿|r交谈
    .trainer >>训练你的职业法术
    .target Toldren Deepiron
step << Paladin
    #xprate >1.49
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰度尔·铁锤|cRXP_FRIENDLY_布兰度尔·铁锤|r交谈
    .trainer >>训练你的职业法术
    .target Brandur Ironhammer
step << skip --logout skip << Priest/Paladin/Mage
    #xprate >1.49
    #ssf << Mage
    #hardcore << !Human
    #optional
    .goto 1455,25.254,10.981
    .zone Dun Morogh >>|cRXP_WARN_前往: |cRXP_PICK_丹莫罗|r，跳到|cRXP_FRIENDLY_托德雷·铁矿|r上方的柱子顶部，将你的角色定位到看起来像是漂浮起来，然后通过注销并重新登录来执行注销跳过|r
step << Dwarf/Gnome
    #xprate >1.49
    #softcore
    #completewith DarkshoreBoat
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fly Wetlands>>飞往湿地
    .target Gryth Thurden
step
    #xprate >1.49
    #optional
    #hardcore << !Human
    .goto 1426,53.042,35.383
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
step
    #xprate >1.49
    #hardcore
    #completewith next
    .goto Dun Morogh,59.43,42.85,150 >>前往丹莫罗 -> 湿地传送点
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
    >>|cRXP_WARN_观看视频指南, 了解如何跳过第一个！|r
    >>|cRXP_WARN_完成不死者任务：丹莫罗 -> 湿地 跳过|r
    >>|cRXP_WARN_穿越水域时避开 |cRXP_ENEMY_湿地鳄鱼|r 和 |cRXP_ENEMY_鱼人|r|r
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >>|cRXP_WARN_点击此处查看视频攻略|r
    .goto Wetlands,12.1,60.3,80 >>前往: |cRXP_PICK_湿地|r
    .mob Wetlands Crocolisk
    .mob Young Wetlands Crocolisk
    .mob Bluegill Raider
step << Human
    #xprate >1.49
    #season 2
    #softcore
    #completewith next
    .goto Dun Morogh,59.43,42.85,150 >>前往丹莫罗 -> 湿地传送点
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
    >>|cRXP_WARN_观看视频指南, 了解如何跳过第一个！|r
    >>|cRXP_WARN_完成不死者任务：丹莫罗 -> 湿地 跳过|r
    >>|cRXP_WARN_穿越水域时避开 |cRXP_ENEMY_湿地鳄鱼|r 和 |cRXP_ENEMY_鱼人|r|r
    >>|cRXP_WARN_注意:你正在进行较慢的不死跳跃, 因为你拥有|r|T134916:0|t[灵感火花]|cRXP_WARN_world增益效果|r
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >>|cRXP_WARN_点击此处查看视频攻略|r
    .subzone 150 >>前往: |cRXP_PICK_湿地|r
    .mob Wetlands Crocolisk
    .mob Young Wetlands Crocolisk
    .mob Bluegill Raider
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
    >>|cRXP_WARN_完成丹莫罗至湿地的死亡跳跃. 请密切跟随箭头指示|r
    >>|cRXP_WARN_请勿从任何高处跳下|r
    .goto 1415,44.910,52.030,15 >>|cRXP_WARN_爬上山, 然后沿着锯齿状的路径往下走, 直到子区域变为“大海”|r
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
    >>|cRXP_WARN_从山上向北或西北方向跳下|r
    .deathskip >>在巴拉丁湾死亡并重生|cRXP_FRIENDLY_灵魂医者|r
    .target Spirit Healer
    .subzoneskip 150 --Menethil Harbor
    .isQuestAvailable 984
step << Human
    #xprate >1.49
    #softcore
    #optional
    #requires WetlandsDS2
    #completewith next
    .goto Wetlands,11.95,50.24,60 >>游向米奈希尔港方向的岸边
    .subzoneskip 150 --Menethil Harbor
step
    #xprate >1.49
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto 1437,10.760,56.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在军营底层与|cRXP_FRIENDLY_尼尔·奥雷|r交谈
    .vendor 1448 >>|cRXP_WARN_从他那里购买 a|r|T133024:0|t[青铜管]|cRXP_BUY_(如果可用)|r
	.target Neal Allen
    .bronzetube
    .money <0.08
step
    #xprate >1.49
    #optional
    #completewith next
    .goto 1437,10.233,56.201,15 >>离开米奈希尔要塞
    .subzoneskip 2103,1 --Menethil Keep
step
    #xprate >1.49
    #hardcore << !Human
    .goto Wetlands,9.49,59.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_暴风城|r outside
    .fp Wetlands >>获取湿地飞行路线
    .target Shellei Brondir
step
    #xprate >1.49
    .goto Wetlands,7.95,56.38
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_内|cRXP_FRIENDLY_德温·晨光|r交谈
    .vendor 1453 >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_从他那里购买(如果他有货)|r
    .target Dewin Shimmerdawn
step
    #xprate >1.49
    #optional
    #label DockTravel
    #completewith next
    .goto Wetlands,7.10,57.96,30,0
    .goto Wetlands,4.61,57.26,15 >>前往奥伯丁码头的船只
    .zoneskip Darkshore
step
    #xprate >1.49
    #optional
    #requires DockTravel
    #label DarkshoreCook1
    #completewith DarkshoreBoat
    >>|cRXP_WARN_如果船刚抵达, 则在船上；如果船刚离开, 则在码头上:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_如果船刚抵达, 则在船上；如果船刚离开, 则在码头上:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_如果船刚抵达, 则在船上；如果船刚离开, 则在码头上:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_以下物品:|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_the|r |T133970:0|t|cRXP_LOOT_[野猪肉块]|r |cRXP_WARN_into|r |T133974:0|t[烤野猪肉]
    >>|T133971:0|t[烹饪]|cRXP_WARN_the|r|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_into|r|T133974:0|t[烧烤狼肉]
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_the|r|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_into|r|T133974:0|t[烧烤狼肉]
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_the|r |T133970:0|t|cRXP_LOOT_[野猪肉块]|r |cRXP_WARN_into|r |T133974:0|t[烤野猪肉]
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
    >>|cRXP_WARN_如果需要, 请在等待前往黑海岸的船时升级你的|r|T135966:0|t[急救]|r
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
]])
