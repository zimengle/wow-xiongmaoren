local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupweight 500
#classic
#version 1
#season 2
<< NightElf
#group RestedXP Alliance 1-20
#groupid RXP-SRGCE-A1
#name 13-20 Darkshore SoD
#next 20-22 Darkshore SoD << !sod/Warrior/Rogue/Druid/Hunter
#next RestedXP Alliance 20-30\22-24 Wetlands SoD << sod Priest
-- #displayname 11-16 Darkshore << NightElf/Dwarf Hunter !SoD
-- #displayname 15-17 Darkshore << !NightElf !Dwarf/!Hunter !SoD
-- #displayname 13-18 Darkshore << Dwarf Hunter/!NightElf sod
#displayname 13-20 黑海岸 << NightElf SoD !Priest
#displayname 13-22 黑海岸 << NightElf SoD Priest
#displayname 15-18 黑海岸 << !NightElf SoD

step << NightElf
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6344 >> 交任务：尼莎·影歌
    .accept 6341 >> 接任务：泰达希尔的渔业
    .target 尼莎·影歌

step << NightElf
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .turnin 6341 >> 交任务：泰达希尔的渔业
    .accept 6342 >> 接任务：飞往奥伯丁
    .target 维斯派塔斯

step << NightElf
    #completewith WashedA
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Auberdine >> 飞往黑海岸
    .target 维斯派塔斯

step << NightElf
    #label WashedA
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >> 接任务：搁浅的巨兽
    .target 温尼斯·布莱葛

step << !NightElf
    #optional
    #completewith BigThreat
    .goto Darkshore,37.04,44.13,0
    >>船最靠近奥伯丁海岸时跳船
    .subzone 442 >> 游向奥伯丁

step
    #ah
    #optional
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果 << !sod/Hunter/Druid
    .accept 1141 >> 接任务：钓鱼世家
    .turnin 1141 >> 交任务：钓鱼世家
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target 古博·布拉普
    .xp <15,1

step
    #ah
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1141 >> 接任务：钓鱼世家
    .turnin 1141 >> 交任务：钓鱼世家
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target 古博·布拉普

step
    #optional
    #season 0
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果
    .target 古博·布拉普
    .xp <15,1

step << NightElf
    #optional
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    >>|cRXP_WARN_向他购买至多 40 条|r |T133918:0|t[长嘴泥鳅] |cRXP_WARN_，卖掉其他所有 5 级及以下的食物|r
    .collect 4592,40 --Longjaw Mud Snapper (40)
    .turnin 6342 >> 交任务：飞往奥伯丁
    .accept 6343 >> 接任务：飞回泰达希尔 << Druid sod
    .target 莱尔德
    .xp >15,1 << Warrior/Rogue/Paladin
    .isQuestAvailable 2118

step << NightElf
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    .turnin 6342 >> 交任务：飞往奥伯丁
    .target 莱尔德

step << !NightElf
    #optional
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    >>|cRXP_WARN_向他购买至多 40 条|r |T133918:0|t[长嘴泥鳅] |cRXP_WARN_，卖掉其他所有 5 级及以下的食物|r
    .collect 4592,40 --Longjaw Mud Snapper (40)
    .xp >15,1 << Warrior/Rogue
    .target 莱尔德
    .isQuestAvailable 2118

step
    #completewith BigThreat
    .goto Darkshore,37.04,44.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_旅店老板莎希因|r交谈
    .home >> 将炉石绑定在奥伯丁 << !Druid sod !Priest sod
    .target 旅店老板莎希因

step
    #optional
    #completewith next
    .goto 1439,36.826,44.150
    .goto 1439,36.688,43.952,8 >> 上楼前往|cRXP_FRIENDLY_维兹班恩·曲针|r

step
    #xprate <1.5
    .goto 1439,36.976,44.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >> 接任务：传声盒827号
    .target 维兹班恩·曲针

step
    #xprate >1.49
    .goto 1439,36.976,44.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >> 接任务：传声盒827号
    .target 维兹班恩·曲针
    .xp >15,1 --XX Skip if 15+

step
    #xprate <1.5
    #optional << NightElf
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >> 接任务：洞中的蘑菇
    .target 巴瑞萨斯·月影
    .xp <12,1

step
    #xprate <1.5
    #optional << NightElf
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4811 >> 接任务：红色水晶
    .target 哨兵戈琳达·纳希恩
    .xp <12,1

step
    #xprate >1.49
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >> 接任务：洞中的蘑菇
    .target 巴瑞萨斯·月影

step
    #xprate >1.49
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4811 >> 接任务：红色水晶
    .target 哨兵戈琳达·纳希恩

step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2118 >> 接任务：瘟疫蔓延
    .target 萨纳瑞恩·绿树

step
    #label BigThreat
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 984 >> 接任务：熊怪的威胁
    .target 特伦希斯

step << !NightElf
    #label WashedA
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >> 接任务：搁浅的巨兽
    .target 温尼斯·布莱葛

step << !NightElf
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fp Auberdine >> 解锁奥伯丁的飞行点
    .target 凯莱斯·月羽

step << Dwarf Hunter
    #optional
    #completewith RabidThistle
    #loop
    .goto Darkshore,40.75,70.49,0
    .goto Darkshore,40.77,78.56,0
    .goto Darkshore,38.21,73.32,0
    .goto Darkshore,40.75,70.49,40,0
    .goto Darkshore,40.77,78.56,40,0
    .goto Darkshore,38.21,73.32,40,0
    >>|cRXP_WARN_让宠物攻击一只|r|cRXP_ENEMY_蓟熊|r|cRXP_WARN_。宠物被|r|cRXP_ENEMY_蓟熊|r|cRXP_WARN_击晕后，放弃宠物并开始驯服蓟熊|r
    .tame 2163 >>|cRXP_WARN_施放|r |T132164:0|t[驯服野兽] |cRXP_WARN_，驯服一只 |r|cRXP_ENEMY_蓟熊|r
    .target 蓟熊

step << Warlock
    #season 2
    #label ExplorerImpDarkshore
    #sticky
    #completewith DarkshoreEnd
    >>做任务时，对怪物施放 |T136163:0|t|cRXP_FRIENDLY_[吸取灵魂]|r，直到获得 |T133257:0|t|cRXP_LOOT_探险之魂|r。|cRXP_WARN_用它学习如何召唤|r |T236294:0|t|cRXP_FRIENDLY_[探险小鬼]|r
    .train 445459 >>|cRXP_WARN_使用|r |T133257:0|t|cRXP_LOOT_探险之魂|r |cRXP_WARN_学习如何召唤|r |T236294:0|t[|cRXP_FRIENDLY_探险小鬼|r]
    .train 445459,1 --Skips if you already have Explorer Imp
    .train 1120,3 --Skips if you don't have drain soul
    .use 221978

step << Warlock/Mage
    #season 2
    #requires ExplorerImpDarkshore << Warlock
    #sticky
    #completewith DarkshoreEnd
    #label FelPortalRuneDarkshore
    >>当前区域会出现|cRXP_FRIENDLY_邪能传送门|r。找到后召唤 |T236294:0|t[|cRXP_FRIENDLY_探险小鬼|r]，在传送门旁与它交谈，派它探索。10-20 分钟后它会带着战利品返回，并有几率带回 |T134419:0|t[|cRXP_FRIENDLY_恶魔卫士符文|r] << Warlock
    >>当前区域会出现|cRXP_FRIENDLY_邪能传送门|r。找到后使用 |T134945:0|t[|cRXP_LOOT_空间修复卷轴|r] 将其关闭，即可获得 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：怨火之箭|r] << Mage
    >>|cRXP_WARN_留意邪能传送门，直到获得符文。|r
    .collect 221499,1 << Warlock --rune of the felguard
    .collect 223147,1 << Mage --Spell Notes: Balefire Bolt
    .itemcount 220792,1 << Mage --Skips if you don't have a Scroll of Spatial Mending
    .use 223148 << Warlock --Otherworldy Treasure
    .use 220792 << Mage
    .train 428878,1 << Mage
    .train 427733,1 << Warlock
    .train 1120,3 << Warlock --Skips if you don't have drain soul
    .unitscan 邪能裂片
    .unitscan 邪能崩口
    .unitscan 邪能裂痕
    .unitscan 邪能之疤
    .unitscan 邪能裂隙

step << Warlock/Mage
    #season 2
    #requires FelPortalRuneDarkshore
    #sticky
    #completewith DarkshoreEnd
    .itemcount 221499,1 << Warlock --Rune of the Felguard
    .itemcount 223147,1 << Mage --Spell Notes: Balefire Bolt
    .train 427733 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_恶魔卫士符文|r] |cRXP_WARN_学习|r |T136216:0|t[召唤恶魔卫士] << Warlock
    .train 428878 >> |cRXP_WARN_使用|T134939:0|t[|cRXP_FRIENDLY_法术笔记：怨火之箭|r]学习|T135809:0|t[怨火之箭]。|r << Mage
    .use 221499 << Warlock
    .use 223147 << Mage

step
    #sticky
    #label BuzzBox1
    #loop
    .goto 1439,36.051,44.757,0
    .goto 1439,36.280,50.071,0
    .goto 1439,35.275,53.464,0
    .waypoint 1439,36.091,51.501,60,0
    .waypoint 1439,37.115,52.368,60,0
    .waypoint 1439,37.130,53.663,60,0
    .waypoint 1439,36.740,55.221,60,0
    .waypoint 1439,35.655,55.872,60,0
    .waypoint 1439,35.088,55.085,60,0
    .waypoint 1439,35.275,53.464,60,0
    .waypoint 1439,36.091,51.501,60,0
    .waypoint 1439,36.280,50.071,60,0
    .waypoint 1439,36.523,48.554,60,0
    .waypoint 1439,35.977,48.408,60,0
    .waypoint 1439,35.902,47.145,60,0
    .waypoint 1439,35.759,45.455,60,0
    .waypoint 1439,36.051,44.757,60,0
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r，拾取|cRXP_LOOT_蟹腿|r
    >>|cRXP_WARN_你可能需要下水寻找它们|r
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
    .isOnQuest 983

step
    .goto 1439,36.371,50.920
    >>打开|cRXP_PICK_搁浅的海洋生物|r，拾取|cRXP_LOOT_海洋生物的骸骨|r
    .complete 3524,1 --Sea Creature Bones (1)

step << Druid
    #ah
    #season 0
    #optional
    #completewith CliffspringEnd
    #label GatheringQ
    .skill herbalism,15 >>|cRXP_WARN_将|r |T136065:0|t[草药学] |cRXP_WARN_练到 15，以便采集|r |T134187:0|t[地根草] |cRXP_WARN_，用于即将进行的重要职业任务。之后可遗忘草药学|r
    >>|cRXP_WARN_如果打算稍后从拍卖行购买 5 株|r |T134187:0|t[地根草] |cRXP_WARN_，就跳过此步骤|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox

step << Druid
    #ssf
    #season 0
    #optional
    #completewith CliffspringEnd
    #label GatheringQ
    .skill herbalism,15 >>|cRXP_WARN_将|r |T136065:0|t[草药学] |cRXP_WARN_练到 15，以便采集 5 株|r |T134187:0|t[地根草] |cRXP_WARN_，用于即将进行的重要职业任务。之后可遗忘草药学|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox

step << Druid
    #optional
    #season 0
    #completewith CliffspringEnd
    #requires GatheringQ
    >>|cRXP_WARN_收集5株 |T134187:0|t[地根草]，通过 |T136065:0|t[草药学] 采集，偶尔也能从 |r|cRXP_PICK_破旧宝箱|r|cRXP_WARN_ 中获得，留作后续职业任务材料|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .skill herbalism,<15,1

step
    #sticky
    #label RabidThistle
    #loop
    .goto 1439,38.226,52.780,0
    .goto 1439,39.129,59.176,0
    .goto 1439,38.226,52.780,50,0
    .goto 1439,38.527,54.661,50,0
    .goto 1439,38.037,56.815,50,0
    .goto 1439,38.095,58.395,50,0
    .goto 1439,38.696,57.874,50,0
    .goto 1439,39.129,59.176,50,0
    >>|cRXP_WARN_使用|r |T134335:0|t[萨纳瑞恩的希望] |cRXP_WARN_捕捉一只 |r|cRXP_ENEMY_狂暴蓟熊|r|cRXP_WARN_。使用距离为50码|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .unitscan 狂暴蓟熊
    .use 7586

step << Hunter
    #season 2
    #sticky
    #label Treats1
    #loop
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>击杀|cRXP_ENEMY_黑木探路者|r和|cRXP_ENEMY_黑木风语者|r，拾取 |T237270:0|t[|cRXP_LOOT_螃蟹点心|r]
    .collect 209027,1 -- Crab Treats (1)
    .mob 黑木探路者
    .mob 黑木风语者
    .train 410110,1

step << Hunter
    #season 2
    #sticky
    #label Treats2
    #requires Treats1
    #loop
    .goto 1439,36.091,51.501,0
    .goto 1439,35.088,55.085,0
    .waypoint 1439,36.091,51.501,60,0
    .waypoint 1439,37.115,52.368,60,0
    .waypoint 1439,37.130,53.663,60,0
    .waypoint 1439,36.740,55.221,60,0
    .waypoint 1439,35.655,55.872,60,0
    .waypoint 1439,35.088,55.085,60,0
    .use 209027 >> |cRXP_WARN_使用|r |T237270:0|t[|cRXP_LOOT_螃蟹点心|r] |cRXP_WARN_喂食一只|r|cRXP_ENEMY_暗礁蟹幼崽|r|cRXP_WARN_，即可获得|r |T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r]
    .collect 208701,1 -- Beast Mastery (1)
    .target 暗礁蟹幼崽
    .train 410110,1

step << Hunter
    #season 2
    #sticky
    #label Treats3
    #requires Treats2
    .train 410110 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r] |cRXP_WARN_学习|r |T132270:0|t[野兽控制]
    .use 208701
    .itemcount 208701,1

step << !sod/Warrior/Rogue
    #optional
    #completewith FirstWashed
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们会|r |T132307:0|t[逃跑] |cRXP_WARN_当生命值低于30%时|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .subzoneskip 442

step
    .goto Darkshore,38.90,53.59
    >>跑到熊怪营地边缘
    .complete 984,1 -- Find a corrupt furbolg camp

step << NightElf
    #xprate <1.5
    #loop
    .goto 1439,36.051,44.757,0
    .goto 1439,36.280,50.071,0
    .goto 1439,35.275,53.464,0
    .goto 1439,36.051,44.757,60,0
    .goto 1439,35.759,45.455,60,0
    .goto 1439,35.902,47.145,60,0
    .goto 1439,35.977,48.408,60,0
    .goto 1439,36.523,48.554,60,0
    .goto 1439,36.280,50.071,60,0
    .goto 1439,36.091,51.501,60,0
    .goto 1439,37.115,52.368,60,0
    .goto 1439,37.130,53.663,60,0
    .goto 1439,36.740,55.221,60,0
    .goto 1439,35.655,55.872,60,0
    .goto 1439,35.088,55.085,60,0
    .goto 1439,35.275,53.464,60,0
    .goto 1439,36.091,51.501,60,0
    .xp 11+7300 >> 刷怪使当前经验达到 7300+/8800

step << Hunter
    #season 2
    #optional
    #requires Treats3

step
    #optional
    #requires RabidThistle
    --XXREQ Placeholder invis step until multiple requires per step

step
    #xprate <1.5
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地上的|cRXP_PICK_传声盒827号|r
    .turnin 983 >> 交任务：传声盒827号
    .accept 1001 >> 接任务：传声盒411号

step
    #xprate >1.49
    #optional << !NightElf/Hunter
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地上的|cRXP_PICK_传声盒827号|r
    .turnin 983 >> 交任务：传声盒827号
    .accept 1001 >> 接任务：传声盒411号 << !sod
    .isQuestComplete 983

step << NightElf !Hunter
    #xprate >1.49
    #optional
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地上的|cRXP_PICK_传声盒827号|r
    .accept 1001 >> 接任务：传声盒411号
    .isQuestTurnedIn 983
    --XX so NEs can catch up on xp from those that came via menethil
    --XX Hunters skip this as they will get better xp/hr grinding furbolgs

step
    #label FirstWashed
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 3524 >> 交任务：搁浅的巨兽
    .accept 4681 >> 接任务：搁浅的巨兽
    .target 温尼斯·布莱葛

step
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >> 前往码头上的|cRXP_FRIENDLY_塞瑞利恩·白爪|r处

step << Priest
    #season 2
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    .accept 6343 >> 接任务：飞回泰达希尔
    .target 莱尔德

step
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .accept 963 >> 接任务：永志不渝
    .target 塞瑞利恩·白爪

step
    #season 0,1 << Rogue
    #optional
    #completewith SeaT1
    .goto 1439,32.432,43.744,15 >> 走到码头尽头，然后跳入水中

step << Rogue
    #season 2
    #optional
    #completewith SeaT1
    .goto 1439,32.432,43.744,15 >> 走到码头尽头，然后跳入水中
    .train 424785,3

step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith washed1
    .goto Darkshore,33.59,40.36,0
    .goto Darkshore,30.94,45.79,0
    .goto Darkshore,33.03,48.13,0
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r，拾取|cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
    .isOnQuest 1001

step << Rogue
    #season 2
    #optional << !NightElf
    #completewith next
    .goto Darkshore,32.80,37.72,20 >> 游向有灯塔的小岛
    .train 424785,1

step << Rogue
    #season 2
    #optional << !NightElf
    .goto Darkshore,32.729,37.093
    >>打开树干内的|cRXP_PICK_灯塔藏匿物|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    .collect 208772,1 -- Rune of Saber Slash (1)
    .train 424785,1

step << Rogue
    #season 2
    #optional << !NightElf
    .cast 402265 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .train 424785,1

step
    #label SeaT1
    .goto 1439,31.841,46.304
    >>打开|cRXP_PICK_海龟骨骸|r，拾取|cRXP_LOOT_海龟的残骸|r
    .complete 4681,1 --Sea Turtle Remains (1)

step << Priest
    #season 2
    .goto Darkshore,30.5,47.5
    >>点击小岛上的|cRXP_PICK_遗骸|r，拾取 |T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言|r]
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .train 402849,1

step << Priest
    #season 2
    >>现在需要获得两种 |T135934:0|t|T136057:0|t[冥想] 增益
    >>先在本族的神圣场所输入 /kneel，获得第一种冥想增益：暗夜精灵在月亮井旁；人类或矮人在北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛、铁炉堡秘法区等圣光圣地
    >>要获得第二种 |T135934:0|t|T136057:0|t[冥想] 增益，需要在一名拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前输入 /kneel，并请对方选中你输入 /pray
    .train 402849 >> |cRXP_WARN_拥有两种|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益后，使用|r |T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言]|r |cRXP_WARN_学习|r |T136149:0|t[暗言术：灭]
    >>|cRXP_WARN_如果暂时无法完成，就跳过此步骤，稍后再做|r
    .use 205932
    .itemcount 205932,1

step
    #optional
    #season 0
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果
    .target 古博·布拉普
    .xp <15,1

step
    #label washed1
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4681 >> 交任务：搁浅的巨兽
    .target 温尼斯·布莱葛

step
    #xprate <1.5
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >> 接任务：洞中的蘑菇
    .target 巴瑞萨斯·月影

step
    #xprate <1.5
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4811 >> 接任务：红色水晶
    .target 哨兵戈琳达·纳希恩

step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2118 >> 交任务：瘟疫蔓延
    .accept 2138 >> 接任务：清除疫病
    .target 萨纳瑞恩·绿树

step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 984 >> 交任务：熊怪的威胁
    .accept 985 >> 接任务：熊怪的威胁
    .accept 4761 >> 接任务：桑迪斯·织风
    .target 特伦希斯
    ----Start of Optional Early Level 14 Druid Turnin/train----

step << Druid
    #optional
    #completewith DruidEarlyNessa
    #season 0
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些材料稍后用于将|r |T133971:0|t[烹饪] |cRXP_WARN_练到 10|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-10)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,10,1 --XX Shows if cooking skill is <10

step << Druid
    #optional
    #completewith DruidEarlyNessa
    #season 0
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些材料之后用于提升|r |T133971:0|t[烹饪] |cRXP_WARN_技能，|r |cRXP_WARN_目标为50点|r
    >>|cRXP_WARN_现在不必专门刷这些材料，只需保留小蛋，并留意烹饪达到 50 还需要提升多少点|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,<10,1 --XX Shows if cooking skill is 10-50
    .skill cooking,50,1

step << Druid
    #optional
    #completewith EarlyLunaclaw
    #season 0
    .goto 1439,43.126,45.593,15 >> 进入有|cRXP_PICK_月夜枭兽之石|r的洞穴

step << Druid
    #optional
    #completewith EarlyLunaclaw
    #season 0
    .goto Darkshore,43.50,45.97
    .cast 18974 >>|cRXP_WARN_使用|r |T132857:0|t[塞纳里奥月尘] |cRXP_WARN_，在洞穴内的 |r|cRXP_PICK_月夜枭兽之石|r|cRXP_WARN_ 处召唤 |r|cRXP_ENEMY_月爪枭兽|r|cRXP_WARN_，它会出现在洞口|r
    .timer 4,身心之力任务剧情
    .use 15208
    .isOnQuest 6001

step << Druid
    #season 0
    #optional
    #label EarlyLunaclaw
    .goto Darkshore,43.09,45.55
    >>击败|cRXP_ENEMY_月爪枭兽|r后，与出现的|cRXP_FRIENDLY_月爪枭兽的灵魂|r交谈
    .complete 6001,1 --Defeat Lunaclaw (x1)
    .use 15208
    .mob 月爪枭兽
    .target 月爪枭兽的灵魂
    .xp <13+9500,1

step << Druid
    #optional
    #label DruidEarlyNessa
    #season 0
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    .accept 6343 >> 接任务：飞回泰达希尔
    .target 莱尔德
    .isQuestComplete 6001

step << Druid
    #optional
    #completewith EarlyBody
    #season 0
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fly Teldrassil >> 飞往泰达希尔
    .target 凯莱斯·月羽
    .isQuestComplete 6001

step << Druid
    #optional
    #season 0
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6343 >> 交任务：飞回泰达希尔
    .target 尼莎·影歌
    .isQuestComplete 6001

step << Druid
    #optional
    #completewith next
    #season 0
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯
    .isQuestComplete 6001

step << Druid
    #optional
    #season 0
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 6001 >> 交任务：身心之力
    .accept 6121 >> 接任务：新的课程
    .trainer >> 学习职业技能
    .target 玛斯雷·驭熊者
    .isQuestComplete 6001

step << Druid
    #optional
    #season 0
    #label EarlyBody
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .accept 6121 >> 接任务：新的课程
    .trainer >> 学习职业技能
    .target 玛斯雷·驭熊者
    .isQuestTurnedIn 6001

step << Druid
    #optional
    #season 0
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade
    .isQuestTurnedIn 6001

step << Druid
    #optional
    #season 0
    .goto Moonglade,56.21,30.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 6121 >> 交任务：新的课程
    .accept 6122 >> 接任务：毒水之源
    .target 德迪利特·星焰
    .isQuestTurnedIn 6001

step << Druid
    #optional
    #season 0
    #completewith AmethStart
    .hs >> 使用炉石返回黑海岸
    .isQuestTurnedIn 6001
    ----End of Optional Early Level 14 Druid Turnin/train----

step << NightElf Warrior/NightElf Rogue
    #sticky
    #season 0
    #label DeepOceanStart
    .goto 1439,38.107,41.165,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >> 接任务：深不可测的海洋
    .target 高尔博德·钢手
    .xp <13,1

step << NightElf Warrior/NightElf Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库德拉姆·石锤|r和|cRXP_FRIENDLY_迪尔弗拉姆·火须|r交谈
    .train 2575 >> 学习 |T134708:0|t[采矿]
    .goto Darkshore,38.249,41.008
    .train 2018 >> 学习 |T136241:0|t[锻造]
    .goto Darkshore,38.191,40.935
    >>|cRXP_WARN_这样就能制作|r |T135248:0|t[劣质磨刀石] |cRXP_WARN_，使近战伤害提高 2 点|r << Warrior/Rogue
    >>|cRXP_WARN_如果不打算这样做，就跳过此步骤|r
    .target 库德拉姆·石锤
    .target 迪尔弗拉姆·火须

step << NightElf Warrior/NightElf Rogue
    #optional
    .goto Darkshore,38.142,41.108
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾丽萨·钢拳|r交谈
    >>|cRXP_BUY_向她购买一把|r |T134708:0|t[矿工锄] |cRXP_BUY_。|r
    .target 艾丽萨·钢拳
    .collect 2901,1 -- Mining Pick (1)
    .train 2575,3 --Mining Trained

step << NightElf Warrior/NightElf Rogue
    #optional
    #completewith Bashal1
    .cast 2580 >> |cRXP_WARN_施放|r |T136025:0|t[寻找矿物]
    .usespell 2580
    .train 2575,3 --Mining Trained

step << !NightElf/!Warrior !Rogue
    #xprate <1.5 --<< !NightElf/Hunter --XX Night Elves do it on 2x to catch up on xp EXCEPT Dwarf/NE Hunters (1x only)
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >> 接任务：深不可测的海洋
    .target 高尔博德·钢手
    .xp <13,1

step << !sod/Warrior/Rogue
    #optional
    #requires DeepOceanStart << (NightElf Warrior/NightElf Rogue) !sod
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher

step << NightElf Rogue
    .goto 1439,37.575,40.348
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉姆·长爪|r交谈
    .vendor 4183 >>|cRXP_BUY_如果钱够，向他购买并装备到副手栏|r |T135640:0|t[双刃弯刀] |cRXP_BUY_。|r
    .equip 17,2207 >>将[双刃弯刀]装备到副手栏
    .collect 2207,1 -- Jambiya (1)
    .disablecheckbox
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.10
    --  .money <0.2390
    .target 纳拉姆·长爪

step << !Druid sod
    #optional
    #completewith next
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor 4182 >> |cRXP_BUY_按需向他购买|r |T133634:0|t[棕色小包] |cRXP_BUY_或|r |T133634:0|t[棕色小皮包] |cRXP_BUY_。|r
    >>|cRXP_BUY_购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_或|r |T132384:0|t[重弹丸] |cRXP_BUY_，直到箭袋或弹药袋装满|r << Hunter
    .target 达蒙德

step << !Druid sod
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .accept 954 >> 接任务：巴莎兰
    .accept 958 >> 接任务：上层精灵的工具 << !sod
    .target 桑迪斯·织风
    .xp >16,1
    --XX if 16+, skip Tools

step << !Druid sod
    #optional
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .accept 954 >> 接任务：巴莎兰
    .target 桑迪斯·织风
    .xp >18,1
    --XX if 18+, skip Bashal

step << !Druid sod
    #optional
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河

step << !sod/Warrior/Rogue
    #optional
    #completewith AsterionTravel << era
    #completewith AsterionTravelSoD << sod
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们会|r |T132307:0|t[逃跑] |cRXP_WARN_当生命值低于30%时|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟

step << Warrior/Rogue
    #season 2
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >> 接任务：搁浅的海洋生物

step << !Warrior !Rogue
    #season 2
    #label RedCrystal
    .goto 1439,47.314,48.676
    >>前往 |cRXP_PICK_神秘的红色水晶|r 处
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_狂暴的月夜枭兽|r|cRXP_WARN_：它们在|r|cRXP_PICK_神秘的红色水晶|r|cRXP_WARN_西侧分为两组，每组2只；彼此距离最近的两只会联动仇恨|r
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range

step << Druid
    #season 2
    .xp 14-1600 >>击杀枭兽刷怪，直到距离14级还差1600点经验。

step << skip --logout skip !Warrior !Rogue
    #season 2
    .goto 1439/1,-33.200,6141.300,20 >> 前往附近的洞穴

step << skip --logout skip !Warrior !Rogue
    #optional
    #label OracleLS
    #completewith AsterionTravelSoD
    #season 2
    .goto 1439/1,-79.100,6134.300
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_击杀洞内的月夜枭兽圣者，跳到洞穴深处的大蘑菇上，然后退出并重新登录，利用登出传送离开|r
    ----Start of SoD Druid Starsurge segment----

step << Druid
    #optional
    #season 2
    #completewith next
    .subzone 442 >> 前往奥伯丁

step << Druid
    #season 2
    #optional
    #completewith next
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor 4182 >> |cRXP_BUY_按需向他购买|r |T133634:0|t[棕色小包] |cRXP_BUY_或|r |T133634:0|t[棕色小皮包] |cRXP_BUY_。|r
    >>|cRXP_BUY_购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_或|r |T132384:0|t[重弹丸] |cRXP_BUY_，直到箭袋或弹药袋装满|r << Hunter
    .target 达蒙德

step << Druid
    #season 2
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .accept 954 >> 接任务：巴莎兰
    .target 桑迪斯·织风

step << Druid
    #season 2
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >> 交任务：红色水晶
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩

step << Druid
    #season 2
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_在奥伯丁的月亮井使用|r |T134865:0|t[空水瓶] |cRXP_WARN_取水|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338
    .isQuestTurnedIn 4811

step << Druid
    #season 2
    #softcore
    .goto Darkshore,32.44,43.71
    .zone Wetlands >> |cRXP_WARN_乘船前往米奈希尔港。现在要去湿地获取|r |T135730:0|t[星涌术] |cRXP_WARN_符文，它在当前等级十分强大|r
    >>|cRXP_WARN_途中可能会死亡几次|r
    .train 424718,1

step << Druid
    #season 2
    #softcore
    .goto Wetlands,36.941,15.157
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_古基姆登|r 对话
    >>|cRXP_WARN_他会给你一个|r |T134052:0|t[|cRXP_LOOT_泽菇|r]
    .collect 210499,1 -- Marshroom (1)
    .target 古基姆登
    .train 424718,1
    .link https://youtu.be/fWVaDR-NnKU >> |cRXP_WARN_点击此处查看视频参考|r

step << Druid
    #season 2
    #softcore
    .goto Wetlands,31.187,18.328,15 >> 前往突出湖面的树桩
    .train 424718,1

step << Druid
    #season 2
    #softcore
    #completewith next
    .goto Wetlands,31.187,18.328
    .cast 426019 >>|cRXP_WARN_使用|r |T134052:0|t[|cRXP_LOOT_泽菇|r] |cRXP_WARN_将其吃下|r
    >>|cRXP_WARN_确保安全后再使用。如果死亡，需要重新领取蘑菇|r
    .use 210499
    .train 424718,1

step << Druid
    #season 2
    #softcore
    .goto Wetlands,31.187,18.328
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃德亚诺伊|r交谈
    >>先吃下蘑菇才能看到这个角色
    .collect 210500,1 -- Rune of the Stars (1)
    .skipgossip
    .target 沃德亚诺伊
    .train 424718,1

step << Druid
    #season 2
    #softcore
    .train 424718 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_星辰符文|r] |cRXP_WARN_学习|r |T135730:0|t[星涌术]
    .use 210500
    .itemcount 210500,1

step << Druid
    #season 2
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .usespell 18960
    >>|cRXP_WARN_可以在法术书中找到它|r
    .zoneskip Moonglade

step << Druid
    #season 2
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 5921 >> 交任务：月光林地
    .target 德迪利特·星焰
    .accept 5929 >> 接任务：巨熊之灵

step << Druid
    #season 2
    .goto Moonglade,45.12,26.78,15,0
    .goto Moonglade,39.17,27.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨熊之灵|r交谈
    .complete 5929,1 --Seek out the Great Bear Spirit and learn what it has to share with you about the nature of the bear.
    .skipgossip
    .target 巨熊之灵

step << Druid
    #season 2
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    >>|cRXP_WARN_这样返回会更快|r

step << Druid
    #season 2
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 5929 >> 交任务：巨熊之灵
    .target 德迪利特·星焰
    .accept 5931 >> 接任务：返回达纳苏斯

step << Druid
    #season 2
    .hs >> 使用炉石返回达纳苏斯

step << Druid
    .goto Darnassus,35.38,8.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与中层的|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .trainer >> 学习职业技能
    .turnin 5931 >> 交任务：返回达纳苏斯
    .target 玛斯雷·驭熊者
    .accept 6001 >> 接任务：身心之力

step << Druid
    #season 2
    #completewith FlyAuberdine
    .goto Darnassus,28.52,39.89
    .zone Teldrassil >> 穿过紫色传送门前往鲁瑟兰村
    .zoneskip Darkshore
    .subzoneskip 702

step << Druid
    #optional
    #season 2
    #label FlyAuberdine
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6343 >> 交任务：飞回泰达希尔
    .target 尼莎·影歌

step << Druid
    #season 2
    .goto Teldrassil,58.399,94.016
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >> 飞往黑海岸
    .target 维斯派塔斯

step << Druid
    #optional
    #season 2
    #completewith Lunaclaw
    .goto 1439,43.126,45.593,15 >> 进入有|cRXP_PICK_月夜枭兽之石|r的洞穴

step << Druid
    #optional
    #season 2
    #completewith Lunaclaw
    .goto Darkshore,43.50,45.97
    .cast 18974 >>|cRXP_WARN_使用|r |T132857:0|t[塞纳里奥月尘] |cRXP_WARN_，在洞穴内的 |r|cRXP_PICK_月夜枭兽之石|r|cRXP_WARN_ 处召唤 |r|cRXP_ENEMY_月爪枭兽|r|cRXP_WARN_，它会出现在洞口|r
    .timer 4,身心之力任务剧情
    .use 15208
    .isOnQuest 6001

step << Druid
    #label Lunaclaw
    #season 2
    .goto Darkshore,43.09,45.55
    >>击败|cRXP_ENEMY_月爪枭兽|r后，与出现的|cRXP_FRIENDLY_月爪枭兽的灵魂|r交谈
    .complete 6001,1 --Defeat Lunaclaw (x1)
    .use 15208
    .mob 月爪枭兽
    .target 月爪枭兽的灵魂

step << Druid
    #season 2
    .goto 1439,47.314,48.676
    >>点击|cRXP_PICK_神秘的红色水晶|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_狂暴的月夜枭兽|r|cRXP_WARN_：它们在|r|cRXP_PICK_神秘的红色水晶|r|cRXP_WARN_西侧分为两组，每组2只；彼此距离最近的两只会联动仇恨|r
    .turnin 4812 >> 交任务：清洗水晶
    .accept 4813 >> 接任务：水晶中的碎骨
    .isQuestTurnedIn 4811

step << skip --logout skip Druid
    #season 2
    .goto 1439/1,-33.200,6141.300,20 >> 前往附近的洞穴

step << skip --logout skip Druid
    #optional
    #label OracleLS
    #completewith AsterionTravelSoD
    #season 2
    .goto 1439/1,-79.100,6134.300
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_击杀洞内的月夜枭兽圣者，跳到洞穴深处的大蘑菇上，然后退出并重新登录，利用登出传送离开|r
    ----End of SoD Druid Starsurge segment----

step
    #xprate >1.49
    #optional
    #label AsterionTravelSoD
    #completewith Bashal1
    .goto 1439,44.376,36.754,20,0
    .goto 1439,44.168,36.289,15 >> 前往|cRXP_FRIENDLY_阿斯特利安|r

step
    #label AsterionTravel
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    >>|cRXP_WARN_途中避免击杀|r|cRXP_ENEMY_野生劣魔|r|cRXP_WARN_和|r|cRXP_ENEMY_恶灵劣魔|r
    .turnin 954 >> 交任务：巴莎兰
    .accept 955 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isOnQuest 954
    .xp >16,1
    --XX skip Bashal Aran qline if 16+

step
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    >>|cRXP_WARN_途中避免击杀|r|cRXP_ENEMY_野生劣魔|r|cRXP_WARN_和|r|cRXP_ENEMY_恶灵劣魔|r
    .turnin 954 >> 交任务：巴莎兰
    .target 阿斯特利安
    .isOnQuest 954
    --XX Turn in Breadcrumb if you picked it up earlier before 18

step
    #label Bashal1
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .accept 955 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestTurnedIn 954
    .xp >16,1
    --XX if you ding 16 from turnin, skip Bashal Aran qline

step
    #loop
    .goto 1439,44.528,36.587,0
    .goto 1439,45.334,39.393,0
    .goto 1439,46.096,36.541,0
    .goto 1439,44.528,36.587,50,0
    .goto 1439,44.435,37.404,50,0
    .goto 1439,44.443,38.202,50,0
    .goto 1439,44.493,39.008,50,0
    .goto 1439,44.821,39.711,50,0
    .goto 1439,45.334,39.393,50,0
    .goto 1439,45.167,38.652,50,0
    .goto 1439,45.091,37.865,50,0
    .goto 1439,45.495,37.019,50,0
    .goto 1439,45.831,36.790,50,0
    .goto 1439,46.096,36.541,50,0
    .goto 1439,46.906,36.171,50,0
    .goto 1439,47.431,36.151,50,0
    .goto 1439,47.022,37.083,50,0
    .goto 1439,47.166,37.580,50,0
    .goto 1439,45.827,36.812,50,0
    >>击杀|cRXP_ENEMY_野生劣魔|r和|cRXP_ENEMY_恶灵劣魔|r，拾取|cRXP_LOOT_劣魔耳环|r
    >>|cRXP_WARN_暂时不要击杀|r|cRXP_ENEMY_戴瑟雷萨特|r
    .complete 955,1 --Grell Earring (8)
    .mob 野生劣魔
    .mob 恶灵劣魔
    .isOnQuest 955

step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 955 >> 交任务：巴莎兰
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestComplete 955

step
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestTurnedIn 955

step
    #completewith next
    #optional
    .abandon 955 >> 放弃任务：巴莎兰
    .isQuestAvailable 955

step
    #xprate >1.59
    #loop
    .goto 1439,45.393,36.472,0
    .goto 1439,45.429,39.773,0
    .goto 1439,47.368,36.774,0
    .goto 1439,45.393,36.472,45,0
    .goto 1439,45.938,37.800,45,0
    .goto 1439,45.938,38.040,45,0
    .goto 1439,46.531,39.134,45,0
    .goto 1439,45.429,39.773,45,0
    .goto 1439,47.262,37.674,45,0
    .goto 1439,47.920,37.228,45,0
    .goto 1439,47.368,36.774,45,0
    >>击杀|cRXP_ENEMY_戴瑟雷萨特|r，拾取|cRXP_LOOT_远古月亮石封印|r
    >>|cRXP_WARN_它们不会动态刷新。如果找不到任何怪，就跳过此步骤，目标为|r |cRXP_ENEMY_戴瑟雷萨特|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob 戴瑟雷萨特
    .isQuestTurnedIn 955

step
    #xprate <1.59
    #loop
    .goto 1439,45.393,36.472,0
    .goto 1439,45.429,39.773,0
    .goto 1439,47.368,36.774,0
    .goto 1439,45.393,36.472,45,0
    .goto 1439,45.938,37.800,45,0
    .goto 1439,45.938,38.040,45,0
    .goto 1439,46.531,39.134,45,0
    .goto 1439,45.429,39.773,45,0
    .goto 1439,47.262,37.674,45,0
    .goto 1439,47.920,37.228,45,0
    .goto 1439,47.368,36.774,45,0
    >>击杀|cRXP_ENEMY_戴瑟雷萨特|r，拾取|cRXP_LOOT_远古月亮石封印|r
    >>|cRXP_WARN_注意，它们不会动态刷新|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob 戴瑟雷萨特
    .isQuestTurnedIn 955

step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 956 >> 交任务：巴莎兰
    .target 阿斯特利安
    .isQuestComplete 956

step
    .goto Darkshore,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿斯特利安|r 交谈
    .accept 957 >>接任务：巴莎兰
    .target 阿斯特利安
    .isQuestTurnedIn 956

step << !sod/Warrior/Rogue
    #optional
    #completewith RedCrystal
    #season 2
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们会|r |T132307:0|t[逃跑] |cRXP_WARN_当生命值低于30%时|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟

step << !Warrior !Rogue
    #season 2
    #sticky
    #completewith MushroomCaveSoD
    >>击杀遇到的所有|cRXP_ENEMY_狂暴蓟熊|r。|cRXP_WARN_现在不必完成此任务，但进入纳迦洞穴前最好已击杀约 15+ 只|r << Priest
    >>击杀遇到的所有|cRXP_ENEMY_狂暴蓟熊|r。|cRXP_WARN_现在不必完成此任务|r << !Priest
    >>|cRXP_WARN_如果没能迅速击杀，它们会施放|r |T135914:0|t[狂犬病] |cRXP_WARN_（近战瞬发：所有生命恢复效果降低 50%，持续 10 分钟），请小心|r
    .complete 2138,1 --Rabid Thistle Bears (20)
    .mob 狂暴蓟熊

step << !Warrior !Rogue
    #season 2
    .goto Darkshore,50.81,25.50
    >>|cRXP_WARN_在壁泉河下游使用|r |T134865:0|t[空的水样试管] |cRXP_WARN_取样|r
    .complete 4762,1 --Cliffspring River Sample (1)
    .use 12350

step << !Warrior !Rogue
    #optional
    #completewith next
    #season 2
    #label MushroomCaveSoD
    .goto 1439,54.934,32.721,20,0
    .goto 1439,55.108,33.600,40 >> 前往壁泉河洞穴

step << !Warrior !Rogue
    .goto Darkshore,55.45,36.23,12,0
    .goto Darkshore,55.70,36.30,12,0
    .goto Darkshore,55.89,35.40,12,0
    #season 2
    >>拾取地上的|cRXP_LOOT_粗柄蘑菇|r和一株|cRXP_LOOT_毒帽蘑菇|r
    >>|cRXP_WARN_留在上层。如果上层尽头没有|r|cRXP_LOOT_毒帽蘑菇|r|cRXP_WARN_，就跳到下方南侧的房间拾取一株|r
    >>|cRXP_WARN_小心，|r|cRXP_ENEMY_雷鳞御浪者|r|cRXP_WARN_会施放|r |T135836:0|t[水流喷射] |cRXP_WARN_（远程瞬发：对附近敌人造成伤害并击退）。注意站位，避免被打落到洞穴下层|r
    .complete 947,1 --Scaber Stalk (5)
    .goto Darkshore,55.04,33.34,8,0
    .goto Darkshore,55.28,34.00,8,0
    .goto Darkshore,55.09,34.67,8,0
    .goto Darkshore,55.30,35.58,8,0
    .goto Darkshore,55.04,33.34,8,0
    .goto Darkshore,55.28,34.00,8,0
    .goto Darkshore,55.09,34.67,8,0
    .goto Darkshore,55.30,35.58,8,0
    .goto Darkshore,55.04,33.34
    .complete 947,2 --Death Cap (1)
    .goto Darkshore,55.38,36.34

step << !Warrior !Rogue
    .hs >> 使用炉石返回奥伯丁
    >>|cRXP_BUY_按需购买食物和饮料|r << !Warrior !Rogue
    >>|cRXP_BUY_按需购买食物|r << Warrior/Rogue
    .bindlocation 442,1
    .cooldown item,6948,>0,1

step << skip --logout skip !Warrior !Rogue
    #optional
    #label MushroomLSSoD
    #completewith CavetoAuberSoD
    #season 2
    .goto 1439,54.964,34.536
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_跳上洞穴顶层的岩石，调整站位直到角色看起来悬空，然后退出并重新登录，利用登出传送离开|r

step
    #season 2 << Warrior/Rogue
    #season 0 << Mage/Warlock/Priest/Paladin/Hunter/Druid
    #completewith LateTurtleStart << era
    #completewith RedCrystal << sod
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些材料稍后用于将|r |T133971:0|t[烹饪] |cRXP_WARN_练到 10|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 442 --Auberdine
    .subzoneskip 447 --Ameth'Aran

step << Warrior/Rogue
    #season 2
    #label RedCrystal
    .goto 1439,47.314,48.676
    >>前往 |cRXP_PICK_神秘的红色水晶|r 处
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_狂暴的月夜枭兽|r|cRXP_WARN_：它们在|r|cRXP_PICK_神秘的红色水晶|r|cRXP_WARN_西侧分为两组，每组2只；彼此距离最近的两只会联动仇恨|r
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range

step << skip --logout skip Warrior/Rogue
    #season 2
    .goto 1439/1,-33.200,6141.300,20 >> 前往附近的洞穴

step << skip --logout skip Warrior/Rogue
    #completewith next
    #season 2
    .goto 1439/1,-79.100,6134.300
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_击杀洞内的月夜枭兽圣者，跳到洞穴深处的大蘑菇上，然后退出并重新登录，利用登出传送离开|r

step << !Warrior !Rogue
    #optional
    #season 2
    #label CavetoAuberSoD
    #completewith CliffspringEnd
    .subzone 442 >> 前往奥伯丁

step << !Warrior !Rogue
    #label CliffspringEnd
    #season 2
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4762 >> 交任务：壁泉河
    .accept 4763 >> 接任务：黑木熊怪的堕落
    .target 桑迪斯·织风
    ----Start of Early Red Crystal turnin Section (NE below 14 for xp, Hunters/Druids for staff wep upgrade)/Druid bear q final if not done earlier----

step << NightElf/Hunter/Druid/Warrior
    #season 2 << Warrior/Rogue
    #optional
    #label AuberdineTurnin2
    #completewith Cascade
    .goto 1439,37.703,43.393
    .subzone 442 >> 返回奥伯丁

step << Druid
    #season 2
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >> 接任务：健忘的勘察员
    .target 考古学家霍莉

step << !Warrior !Rogue
    #season 2
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .turnin 947 >> 交任务：洞中的蘑菇
    .accept 948 >> 接任务：安努
    .target 巴瑞萨斯·月影

step << NightElf/Hunter/Druid/Rogue
    #season 2 << Warrior/Rogue
    #optional
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >> 交任务：红色水晶 << !Druid sod
    .accept 4812 >> 接任务：清洗水晶 << !Druid sod
    .turnin 4813 >> 交任务：水晶中的碎骨 << Druid sod
    .target 哨兵戈琳达·纳希恩
    .xp >17,1 << !Warrior
    --XX If Night Elves, Hunters, or Druids are lower than level 14, do questline

step << Hunter/Druid/Warrior
    #season 0,1 << Druid
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >> 交任务：红色水晶
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5 << Hunter/Druid
    .xp >17,1
    --XX If Hunters and Druids (in Era) have a worse weapon than the Oakthrush Staff, do the quest even if 14+

step << NightElf/Hunter/Druid/Warrior
    #optional
    #label Cascade
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .isQuestTurnedIn 4811 --show step if Red Crystal turned in
    .xp >17,1

step << NightElf/Hunter/Druid/Warrior/Rogue
    #optional
    #season 2 << Warrior/Rogue
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_在奥伯丁的月亮井使用|r |T134865:0|t[空水瓶] |cRXP_WARN_取水|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338
    .isQuestTurnedIn 4811
    .isOnQuest 4812

step << !Warrior !Rogue
    #season 2
    .goto Darkshore,37.78,44.06
    >>|cRXP_WARN_使用|r |T133748:0|t[空的净化碗] |cRXP_WARN_在奥伯丁的月亮井取水|r
    .collect 12347,1,4763,1 --Filled Cleansing Bowl (1)
    .use 12346
    .isOnQuest 4763

step << NightElf/Hunter/Druid/Warrior/Rogue
    #season 2 << Warrior/Rogue
    #optional
    #season 0 << Hunter/Druid/Rogue/Priest
    #completewith MysteriousCrystalHuntDruidEnd << era
    #completewith Anaya << sod
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们会|r |T132307:0|t[逃跑] |cRXP_WARN_当生命值低于30%时|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .isQuestTurnedIn 4811

step << NightElf/Hunter/Druid/Warrior/Rogue
    #optional
    #completewith EarlyCrystalEnd
    #season 2 << Warrior/Rogue
    #season 0 << Hunter/Druid/Rogue/Priest
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些材料稍后用于将|r |T133971:0|t[烹饪] |cRXP_WARN_练到 10|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .isQuestTurnedIn 4811

step << NightElf/Hunter/Druid
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith MysteriousCrystalHuntDruidEnd
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isOnQuest 1002
    .isQuestTurnedIn 4811

step << !Druid sod
    #season 2
    .goto 1439,47.314,48.676
    #label EarlyCrystalEnd
    >>点击|cRXP_PICK_神秘的红色水晶|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_狂暴的月夜枭兽|r|cRXP_WARN_：它们在|r|cRXP_PICK_神秘的红色水晶|r|cRXP_WARN_西侧分为两组，每组2只；彼此距离最近的两只会联动仇恨|r
    .turnin 4812 >> 交任务：清洗水晶
    .accept 4813 >> 接任务：水晶中的碎骨
    .isQuestTurnedIn 4811
    .isOnQuest 4812

step << skip --logout skip
    #season 2 << Hunter
    #season 1 << Druid/Warrior/Rogue/Priest
    .goto 1439/1,-33.200,6141.300,20 >> 前往附近的洞穴

step <<  skip --logout skip
    #optional
    #label OracleLSTwo
    #completewith MysteriousCrystalHuntDruidEnd
    #season 2 << Hunter
    #season 1 << Druid/Warrior/Rogue/Priest
    .goto 1439/1,-79.100,6134.300
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_击杀洞内的月夜枭兽圣者，跳到洞穴深处的大蘑菇上，然后退出并重新登录，利用登出传送离开|r

step
    #season 2 << Hunter
    #season 1 << Druid/Warrior/Rogue/Priest
    #optional
    #label MysteriousCrystalHuntDruidEnd
    #completewith next
    .goto 1439,37.703,43.393
    .subzone 442 >> 返回奥伯丁
    .isQuestTurnedIn 4811
    .isOnQuest 4812

step
    #season 2 << Hunter
    #season 1 << Druid/Warrior/Rogue/Priest
    .goto Darkshore,37.70,43.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    >>|cRXP_WARN_选择|r |T135641:0|t[曲木匕首] |cRXP_WARN_作为奖励，尽量保留一把|r |T135641:0|t[匕首] |cRXP_WARN_，用于后续的|r |T132290:0|t[毒药] |cRXP_WARN_职业任务|r << Rogue
    .turnin 4813 >> 交任务：水晶中的碎骨 << !Hunter !Druid
    .turnin 4813,3 >> 交任务：水晶中的碎骨 << Hunter/Druid
    .target 哨兵戈琳达·纳希恩
    .isQuestTurnedIn 4811
    .isOnQuest 4813

step << Hunter/Druid/Warrior
    #completewith Level10CookEnd
    +|cRXP_WARN_装备|r |T135145:0|t[橡木法杖]
    .use 15397
    .itemcount 15397,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
    .isQuestTurnedIn 4811
    ----Start of forced Level 14 Druid Turnin/train----

step << Druid
    #season 0
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    .accept 6343 >> 接任务：飞回泰达希尔
    .target 莱尔德

step << Druid
    #optional
    #xprate <1.5
    #loop
    .goto 1439,36.051,44.757,0
    .goto 1439,36.280,50.071,0
    .goto 1439,35.275,53.464,0
    .goto 1439,36.051,44.757,60,0
    .goto 1439,35.759,45.455,60,0
    .goto 1439,35.902,47.145,60,0
    .goto 1439,35.977,48.408,60,0
    .goto 1439,36.523,48.554,60,0
    .goto 1439,36.280,50.071,60,0
    .goto 1439,36.091,51.501,60,0
    .goto 1439,37.115,52.368,60,0
    .goto 1439,37.130,53.663,60,0
    .goto 1439,36.740,55.221,60,0
    .goto 1439,35.655,55.872,60,0
    .goto 1439,35.088,55.085,60,0
    .goto 1439,35.275,53.464,60,0
    .goto 1439,36.091,51.501,60,0
    .xp 13+9500 >> 刷怪使当前经验达到 9500+/11400

step << Druid
    #season 0
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fly Teldrassil >> 飞往泰达希尔
    .target 凯莱斯·月羽
    .isQuestAvailable 6001

step << Druid
    .goto Teldrassil,56.25,92.44
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6343 >> 交任务：飞回泰达希尔
    .target 尼莎·影歌
    .isQuestAvailable 6001

step << Druid
    #optional
    #completewith next
    #season 0
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯

step << Druid
    .goto Darnassus,35.375,8.405
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 6001 >> 交任务：身心之力
    .accept 6121 >> 接任务：新的课程
    .trainer >> 学习职业技能
    .target 玛斯雷·驭熊者
    .isQuestAvailable 6001

step << Druid
    #optional
    #season 0
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .accept 6121 >> 接任务：新的课程
    .trainer >> 学习职业技能
    .target 玛斯雷·驭熊者
    .isQuestTurnedIn 6001
    .zoneskip Darnassus,1

step << Druid
    #optional
    #season 0
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade

step << Druid
    #season 0
    .goto Moonglade,56.21,30.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 6121 >> 交任务：新的课程
    .accept 6122 >> 接任务：毒水之源
    .target 德迪利特·星焰

step << Druid
    #season 0
    #optional
    #completewith AmethStart
    .hs >> 使用炉石返回黑海岸
    .zoneskip Darkshore
    ----End of forced Level 14 Druid Turnin/train----
    ----End of Early Red Crystal turnin Section (NE for xp, Hunters/Druids for staff)/Druid bear q final if not done earlier----

step
    #season 0
    #optional
    #completewith AmethStart
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们会|r |T132307:0|t[逃跑] |cRXP_WARN_当生命值低于30%时|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .subzoneskip 447
    ----Start of alternate section if early Red Crystal turnin----

step << NightElf/Hunter/Druid
    #xprate <1.5 --<< !NightElf/Hunter
    #completewith EarlyBlackwood
    #optional
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isOnQuest 1002
    .isQuestTurnedIn 4811

step << NightElf/Hunter/Druid
    #optional
    #loop
    #season 0
    #label EarlyBlackwood
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>击杀 |cRXP_ENEMY_黑木探路者|r 和 |cRXP_ENEMY_黑木风语者|r
    .complete 985,1 -- Blackwood Pathfinder (8)
    .complete 985,2 -- Blackwood Windtalker (5)
    .mob 黑木探路者
    .mob 黑木风语者
    .isQuestTurnedIn 4811

step << NightElf/Hunter/Druid
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    --Season 2
    #completewith EarlyTurtleStart
    >>击杀|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎
    .subzoneskip 447
    .isOnQuest 1002
    .isQuestTurnedIn 4811

step << NightElf/Hunter/Druid
    #optional
    #season 0
    #completewith Anaya
    --Season 2
    >>击杀 |cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_如果没能迅速击杀，它们会施放|r |T135914:0|t[狂犬病] |cRXP_WARN_（近战瞬发：所有生命恢复效果降低 50%，持续 10 分钟），请小心|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
    .isQuestTurnedIn 4811
    .subzoneskip 447

step << NightElf/Hunter/Druid
    #optional
    #season 0
    #label EarlyTurtleStart
    --Season 2
    .goto 1439,37.105,62.167
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4722 >> 接任务：搁浅的海龟
    .isQuestTurnedIn 4811

step
    #optional
    #season 0
    #label EarlyAmethStart
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 953 >> 接任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
    .isQuestTurnedIn 4811
    .xp >17,1
    ----End of alternate section if early Red Crystal turnin----
    ----Start of small south loop for ERA and SoD Warrior/Rogue/Priest----

step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith AmethStart
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isQuestTurnedIn 1001
    .isQuestAvailable 4811

step
    #season 0
    #loop
    .goto 1439,46.918,48.630,0
    .goto 1439,45.338,54.337,0
    .goto 1439,45.108,49.184,0
    .goto 1439,45.322,44.756,0
    .goto 1439,46.918,48.630,60,0
    .goto 1439,46.233,49.578,60,0
    .goto 1439,46.110,50.828,60,0
    .goto 1439,45.766,51.560,60,0
    .goto 1439,45.652,52.729,60,0
    .goto 1439,45.338,54.337,60,0
    .goto 1439,44.817,53.601,60,0
    .goto 1439,44.398,52.137,60,0
    .goto 1439,44.424,50.766,60,0
    .goto 1439,45.090,50.415,60,0
    .goto 1439,45.108,49.184,60,0
    .goto 1439,44.578,48.547,60,0
    .goto 1439,44.311,47.903,60,0
    .goto 1439,43.577,46.772,60,0
    .goto 1439,42.237,46.108,60,0
    .goto 1439,42.715,45.372,60,0
    .goto 1439,43.101,44.400,60,0
    .goto 1439,45.322,44.756,60,0
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些材料稍后用于将|r |T133971:0|t[烹饪] |cRXP_WARN_练到 10|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,10,1 --XX Shows if cooking skill is <10

step << !sod/Warrior/Rogue/Priest
    #sticky
    #optional
    #label Anaya
    .goto 1439,42.017,58.866,0 --NE spawn
    .goto 1439,43.222,59.693,0 --NE spawn
    .goto 1439,43.069,62.448,0 --SE spawn
    .goto 1439,42.489,60.677,0 --Middle spawn
    .waypoint 1439,42.017,58.866,50,0 --NE spawn
    .waypoint 1439,42.311,58.645,50,0
    .waypoint 1439,42.448,58.236,50,0
    .waypoint 1439,43.222,59.693,50,0 --NE spawn
    .waypoint 1439,43.447,60.131,50,0
    .waypoint 1439,43.780,60.275,50,0
    .waypoint 1439,43.069,62.448,50,0 --SE spawn
    .waypoint 1439,43.104,62.563,50,0
    .waypoint 1439,42.794,62.166,50,0
    .waypoint 1439,42.489,60.677,50,0 --Middle spawn
    >>击杀 |cRXP_ENEMY_安娜雅·晨路|r，从她身上拾取 |cRXP_LOOT_安娜雅的坠饰|r
    >>|cRXP_WARN_她每 7-8 分钟刷新一次，在亚米萨兰有 4 个刷新点|r
    >>|cRXP_WARN_如果找不到她，想稍后再来，可以跳过此步骤，但之后可能需要多刷一些怪补经验|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
    .solo

step << !sod/Warrior/Rogue/Priest
    #sticky
    #optional
    #label Anaya
    .goto 1439,42.017,58.866,0 --NE spawn
    .goto 1439,43.222,59.693,0 --NE spawn
    .goto 1439,43.069,62.448,0 --SE spawn
    .goto 1439,42.489,60.677,0 --Middle spawn
    .waypoint 1439,42.017,58.866,50,0 --NE spawn
    .waypoint 1439,42.311,58.645,50,0
    .waypoint 1439,42.448,58.236,50,0
    .waypoint 1439,43.222,59.693,50,0 --NE spawn
    .waypoint 1439,43.447,60.131,50,0
    .waypoint 1439,43.780,60.275,50,0
    .waypoint 1439,43.069,62.448,50,0 --SE spawn
    .waypoint 1439,43.104,62.563,50,0
    .waypoint 1439,42.794,62.166,50,0
    .waypoint 1439,42.489,60.677,50,0 --Middle spawn
    >>击杀 |cRXP_ENEMY_安娜雅·晨路|r，从她身上拾取 |cRXP_LOOT_安娜雅的坠饰|r
    >>|cRXP_WARN_她每 7-8 分钟刷新一次，在亚米萨兰有 4 个刷新点|r
    >>|cRXP_WARN_如果找不到她，可以与附近玩家组队。在综合频道（/1）询问，和其他正在寻找她的人一起做|r
    >>|cRXP_WARN_如果找不到她，想稍后再来，可以跳过此步骤，但之后可能需要多刷一些怪补经验|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
    .group

step
    #season 0
    #sticky
    #label Relics
    .goto 1439,42.670,57.390,0
    .goto 1439,41.986,62.462,0
    .goto 1439,44.072,60.507,0
    .waypoint 1439,42.670,57.390,55,0
    .waypoint 1439,41.708,57.888,55,0
    .waypoint 1439,41.597,59.765,55,0
    .waypoint 1439,42.058,61.199,55,0
    .waypoint 1439,41.986,62.462,55,0
    .waypoint 1439,42.773,63.420,55,0
    .waypoint 1439,43.253,63.287,55,0
    .waypoint 1439,43.945,62.188,55,0
    .waypoint 1439,44.072,60.507,55,0
    .waypoint 1439,43.410,59.784,55,0
    .waypoint 1439,43.787,58.959,55,0
    >>击杀 |cRXP_ENEMY_被诅咒的贵族|r、|cRXP_ENEMY_挣扎的贵族|r 和 |cRXP_ENEMY_哀嚎的贵族|r，拾取它们的 |cRXP_LOOT_上层精灵的遗物|r
    .complete 958,1 --Highborne Relic (7)
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
    .mob 哀嚎的贵族
    .isOnQuest 958

step
    #season 0
    #label AmethStart
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 953 >> 接任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
    .isQuestAvailable 4811
    .xp >17,1

step
    #season 0
    .goto 1439,42.652,63.145
    >>点击|cRXP_PICK_亚米萨兰的毁灭|r
    .complete 953,2 --Read The Fall of Ameth'Aran (1)
    .isOnQuest 953

step << !sod/Warrior/Rogue/Priest
    .goto 1439,42.373,61.815
    >>点击 |cRXP_PICK_上古之火|r
    .complete 957,1 --Destroy the seal at the ancient flame (1)
    .isOnQuest 957

step
    #season 0
    #label TheLay
    .goto Darkshore,43.30,58.70
    >>点击|cRXP_PICK_亚米萨兰的建立|r
    .complete 953,1 --Read The Lay of Ameth'Aran (1)
    .isOnQuest 953

step
    #season 0
    #optional
    #requires Relics
    --XXREQ Placeholder invis step until multiple requires per step

step << !sod/Warrior/Rogue/Priest
    #optional
    #requires Anaya
    --XXREQ Placeholder invis step until multiple requires per step

step
    #xprate <1.59
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .turnin 953 >> 交任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃

step << !sod/Warrior/Rogue
    #optional
    #completewith FurbolgGrindEnd
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们会|r |T132307:0|t[逃跑] |cRXP_WARN_当生命值低于30%时|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟雏鸟

step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith FurbolgGrindEnd
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
    .isOnQuest 1002

step
    #optional
    #completewith FurbolgGrindEnd
    #season 0
    >>击杀 |cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_如果没能迅速击杀，它们会施放|r |T135914:0|t[狂犬病] |cRXP_WARN_（近战瞬发：所有生命恢复效果降低 50%，持续 10 分钟），请小心|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step << Warrior/Rogue
    #optional
    #completewith LateTurtleStart
    #season 2
    >>击杀 |cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_如果没能迅速击杀，它们会施放|r |T135914:0|t[狂犬病] |cRXP_WARN_（近战瞬发：所有生命恢复效果降低 50%，持续 10 分钟），请小心|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step << Priest
    #season 2
    .goto Darkshore,42.0,66.6
    .goto Darkshore,42.0,64.5,0
    .goto Darkshore,42.0,68.2,0
    .goto Darkshore,38.7,68.0,0
    .goto Darkshore,38.7,66.3,0
    .goto Darkshore,38.7,64.5,0
    >>完成击杀|cRXP_ENEMY_狂暴蓟熊|r的任务
    >>|cRXP_WARN_如果没能迅速击杀，它们会施放|r |T135914:0|t[狂犬病] |cRXP_WARN_（近战瞬发：所有生命恢复效果降低 50%，持续 10 分钟），请小心|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step << !sod/Warrior/Rogue/Priest
    #label LateTurtleStart
    .goto 1439,37.105,62.167
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4722 >> 接任务：搁浅的海龟

step << !sod/Warrior/Rogue/Priest
    #loop
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>击杀 |cRXP_ENEMY_黑木探路者|r 和 |cRXP_ENEMY_黑木风语者|r
    .complete 985,1 -- Blackwood Pathfinder (8)
    .mob +黑木探路者
    .complete 985,2 -- Blackwood Windtalker (5)
    .mob +黑木风语者

step
    #xprate <1.5
    #optional
    #requires Treats3 << Druid --Season 2
    #loop
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    .xp 15+11875 >> 刷怪使当前经验达到 11875+/14400
    .mob 黑木探路者
    .mob 黑木风语者
    .itemcount 5382,<1 --Anaya's Pendant (<1)

step
    #xprate <1.5
    #optional
    #loop
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    .xp 15+11000 >> 刷怪使当前经验达到 11000+/14400
    .mob 黑木探路者
    .mob 黑木风语者
    .itemcount 5382,1 --Anaya's Pendant (1)

step
    #xprate 1.49-1.59
    #optional
    #requires Treats3 << Druid --Season 2
    #loop
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    .xp 15+600 >> 刷怪使当前经验达到 600+/14400
    .mob 黑木探路者
    .mob 黑木风语者
    .itemcount 5382,<1 --Anaya's Pendant (<1)

step
    #xprate 1.49-1.59
    #optional
    #loop
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    .xp 14+12210 >> 刷怪使当前经验达到 12210+/12900
    .mob 黑木探路者
    .mob 黑木风语者
    .itemcount 5382,1 --Anaya's Pendant (1)

step << !sod/Warrior/Rogue/Priest
    #label FurbolgGrindEnd
    #completewith Level10CookEnd
    #optional
    .goto 1439,36.701,45.122
    .subzone 442 >> 返回奥伯丁
    .isOnQuest 4722

step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4722 >> 交任务：搁浅的海龟
    .turnin 4723 >> 交任务：搁浅的海洋生物
    .target 温尼斯·布莱葛
    .isOnQuest 4723

step << !sod/Warrior/Rogue/Priest
    #xprate >1.49
    #optional << NightElf !Hunter
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4722 >> 交任务：搁浅的海龟
    .turnin 4723 >> 交任务：搁浅的海洋生物 << Warrior sod
    .target 温尼斯·布莱葛

step
    #season 0 << !Warrior !Rogue
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果
    .target 古博·布拉普

step << !sod/Warrior/Rogue/Priest
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >> 返回码头上的|cRXP_FRIENDLY_塞瑞利恩·白爪|r处

step << !sod/Warrior/Rogue/Priest
    #optional
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    >>|cRXP_WARN_如果刚有别人交过任务，可能需要等待他的剧情结束|r
    .turnin 963 >> 交任务：永志不渝
    .target 塞瑞利恩·白爪
    .isQuestComplete 963

step
    #season 0
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >> 交任务：红色水晶
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .isOnQuest 4811

step << !sod/Warrior/Rogue/Priest
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4812 >> 交任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .isQuestComplete 4812

step
    #season 0
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_在奥伯丁的月亮井使用|r |T134865:0|t[空水瓶] |cRXP_WARN_取水|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338

step << !sod/Warrior/Rogue/Priest
    #optional
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >> 交任务：清除疫病
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
    .isQuestComplete 2138

step << !sod/Warrior/Rogue/Priest
    #optional
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
    .isQuestTurnedIn 2138

step << !sod/Warrior/Rogue/Priest
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 985 >> 交任务：熊怪的威胁
    .accept 986 >> 接任务：丢失的主人 << !sod
    .target 特伦希斯

step << !sod/Warrior/Rogue/Priest
    #optional
    #completewith next
    .goto 1439,39.280,43.121,6,0
    .goto 1439,39.162,43.194,6 >> 上楼

step << !sod/Warrior/Rogue/Priest
    .goto 1439,39.043,43.555
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_哨兵艾莉萨·星风|r交谈
    .accept 965 >> 接任务：奥萨拉克斯之塔
    .target 哨兵艾莉萨·星风
    ----Start of SoD Priest early level 18 wand quest + meditation quest detour----

step << Priest
    #season 2
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 957 >> 交任务：巴莎兰
    .isOnQuest 957
    .target 阿斯特利安

step << Priest
    #season 2
    #sticky
    #label Blackwood1
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,50.66,34.94
    >>打开 |cRXP_PICK_黑木谷物|r，从中拾取 |T134939:0|t|cRXP_LOOT_[黑木谷物]|r
    >>|cRXP_WARN_拾取物品会刷新2只|r|cRXP_ENEMY_黑木熊怪|r|cRXP_WARN_，它们会对你产生仇恨并冲过来。做好战斗准备，或设法让它们脱离战斗|r
    >>|cRXP_WARN_如果看到|r|cRXP_ENEMY_萨巴克希斯|r|cRXP_WARN_喊话，或有人正在与他战斗，就去帮忙。打开他掉在地上的|r|cRXP_PICK_萨巴克希斯的恶魔之包|r|cRXP_WARN_，拾取|r |cRXP_LOOT_堕落护符|r
    .collect 12342,1,4763,1 -- Blackwood Grain Stores (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)

step << Priest
    #season 2
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>击杀 |cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_蓟熊幼崽|r|cRXP_WARN_，它们能使你昏迷 2 秒|r
    .complete 2139,1 --Den Mother (1)
    .mob 雌蓟熊

step << Priest
    #season 2
    #sticky
    #requires Blackwood1
    #label Blackwood2
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,51.83,33.50
    >>打开 |cRXP_PICK_黑木坚果|r，从中拾取 |T133944:0|t|cRXP_LOOT_[黑木坚果]|r
    >>|cRXP_WARN_拾取物品会刷新2只|r|cRXP_ENEMY_黑木熊怪|r|cRXP_WARN_，它们会对你产生仇恨并冲过来。做好战斗准备，或设法让它们脱离战斗|r
    >>|cRXP_WARN_如果看到|r|cRXP_ENEMY_萨巴克希斯|r|cRXP_WARN_喊话，或有人正在与他战斗，就去帮忙。打开他掉在地上的|r|cRXP_PICK_萨巴克希斯的恶魔之包|r|cRXP_WARN_，拾取|r |cRXP_LOOT_堕落护符|r
    .collect 12343,1,4763,1 -- Blackwood Nut Sample (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)

step << Priest
    #season 2
    #sticky
    #requires Blackwood2
    #label Blackwood3
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,52.86,33.41
    >>打开 |cRXP_PICK_黑木水果|r，从中拾取 |T134013:0|t|cRXP_LOOT_[黑木水果]|r
    >>|cRXP_WARN_拾取物品会刷新2只|r|cRXP_ENEMY_黑木熊怪|r|cRXP_WARN_，它们会对你产生仇恨并冲过来。做好战斗准备，或设法让它们脱离战斗|r
    >>|cRXP_WARN_如果看到|r|cRXP_ENEMY_萨巴克希斯|r|cRXP_WARN_喊话，或有人正在与他战斗，就去帮忙。打开他掉在地上的|r|cRXP_PICK_萨巴克希斯的恶魔之包|r|cRXP_WARN_，拾取|r |cRXP_LOOT_堕落护符|r
    .collect 12341,1,4763,1 -- Blackwood Fruit Sample (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)

step << Priest
    #season 2
    #optional
    #requires Blackwood3
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39
    .cast 16072 >> |cRXP_WARN_在|r |T134712:0|t[装满水的净化碗] |cRXP_WARN_准备好后，到|r|cRXP_PICK_营火|r|cRXP_WARN_旁使用，召唤|r |cRXP_ENEMY_萨巴克希斯|r
    .timer 17,黑木熊怪的堕落剧情
    .use 12347

step << Priest
    #season 2
    #requires Blackwood3
    #label Xabraxxis
    .goto Darkshore,52.38,33.39
    >>击杀|cRXP_ENEMY_萨巴克希斯|r，打开他掉在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r，拾取|cRXP_LOOT_堕落护符|r
    .use 12347
    .complete 4763,1 -- Talisman of Corruption (1)
    .mob 萨巴克希斯

step << Priest
    #season 2
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 965 >> 交任务：奥萨拉克斯之塔
    .accept 966 >> 接任务：奥萨拉克斯之塔
    .target 巴苏尔·影击

step << Priest
    #season 2
    #loop
    .goto 1439,55.231,26.508,0
    .goto 1439,56.194,27.071,0
    .goto 1439,56.047,26.586,0
    .goto 1439,55.231,26.508,50,0
    .goto 1439,55.369,27.025,50,0
    .goto 1439,55.763,26.695,50,0
    .goto 1439,55.815,26.972,50,0
    .goto 1439,56.194,27.071,50,0
    .goto 1439,56.790,27.621,50,0
    .goto 1439,57.278,26.311,50,0
    .goto 1439,57.046,26.234,50,0
    .goto 1439,56.544,26.598,50,0
    .goto 1439,56.047,26.586,50,0
    .goto 1439,55.743,25.915,50,0
    >>击杀|cRXP_ENEMY_暗滩狂热者|r，拾取|cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob 暗滩狂热者

step << Priest
    #season 2
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 966 >> 交任务：奥萨拉克斯之塔
    .accept 967 >> 接任务：奥萨拉克斯之塔
    .target 巴苏尔·影击

step << skip --logout skip Priest
    #season 2
    #loop
    .goto 1439,55.231,26.508,0
    .goto 1439,56.194,27.071,0
    .goto 1439,56.047,26.586,0
    .goto 1439,55.231,26.508,50,0
    .goto 1439,55.369,27.025,50,0
    .goto 1439,55.763,26.695,50,0
    .goto 1439,55.815,26.972,50,0
    .goto 1439,56.194,27.071,50,0
    .goto 1439,56.790,27.621,50,0
    .goto 1439,57.278,26.311,50,0
    .goto 1439,57.046,26.234,50,0
    .goto 1439,56.544,26.598,50,0
    .goto 1439,56.047,26.586,50,0
    .goto 1439,55.743,25.915,50,0
    .xp 18 >> 刷怪升到 18 级。|cRXP_WARN_如果还差很多经验，也可以前往纳迦蘑菇洞穴，利用登出传送返回奥伯丁交任务|r

step << Priest
    #season 2
    #optional
    #completewith next
    .hs >> 使用炉石返回达纳苏斯
    .zoneskip Darnassus

step << Priest
    .goto Darnassus,37.90,82.74
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾德莉亚|r交谈
    .trainer >> 学习职业技能
    .target 贾德莉亚

step << Priest
    .goto Darnassus,38.00,89.00
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦丝拉·炉心|r交谈
    .accept 78192 >> 接任务：圣光的秘密
    .target 麦丝拉·炉心

step << Priest
    #season 2
    #sticky
    #completewith next
    .goto 1457,29.179,41.180
    .zone Teldrassil >> 穿过紫色传送门前往鲁瑟兰村

step << Priest
    #season 2
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6343 >> 交任务：飞回泰达希尔
    .target 尼莎·影歌

step << Priest
    #season 2
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >> 飞往黑海岸
    .target 维斯派塔斯
    .zoneskip Darkshore

step << Priest
    #season 2
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2139 >> 交任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树

step << Priest
    #season 2
    #label BlackwoodSod
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4763,1 >> 交任务：黑木熊怪的堕落
    .target 桑迪斯·织风

step << Priest
    #season 2
    #optional
    #completewith Level10CookEnd
    .destroy 12342 >> 摧毁背包中的 |T134939:0|t|cRXP_LOOT_[黑木谷物]|r，后续已不再需要

step << Priest
    #season 2
    #optional
    #completewith Level10CookEnd
    .destroy 12343 >> 摧毁背包中的 |T133944:0|t|cRXP_LOOT_[黑木坚果]|r，后续已不再需要

step << Priest
    #season 2
    #optional
    #completewith Level10CookEnd
    .destroy 12341 >> 摧毁背包中的 |T134013:0|t|cRXP_LOOT_[黑木水果]|r，后续已不再需要

step << Priest
    #season 2
    #completewith next
    +|cRXP_WARN_装备|r |T135469:0|t[月石魔杖]
    .use 15204
    .itemcount 15204,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.61
    ----End of SoD Priest early level 18 wand quest + meditation quest detour----

step << !Hunter
    #season 0 << Druid/Priest
    #season 2 << Warrior/Rogue
    #optional
    #completewith Level10CookEnd
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .vendor 6301 >>|cRXP_BUY_向他购买|r |T134059:0|t[甜香料] |cRXP_BUY_，直到持有的|r |T134059:0|t[甜香料] |cRXP_BUY_数量不少于当前|r |T132832:0|t[小蛋] |cRXP_BUY_的数量|r
    .collect 2678,50,90,1,0x20,cooking --Mild Spices (1-50)
    .disablecheckbox
    .collect 6889,50,90,1,0x20,cooking --Small Egg (1-50)
    .disablecheckbox
    .target 高尔博德·钢手
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .itemcount 6889,1 -- Small Egg (1+)

step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >> 接任务：深不可测的海洋
    .target 高尔博德·钢手

step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .turnin 982 >> 交任务：深不可测的海洋
    .target 高尔博德·钢手
    .isQuestComplete 982

step
    #label Level10CookEnd
    .goto 1439,37.511,41.670
    >>|cRXP_WARN_前往地上的|r|cRXP_PICK_营火|r|cRXP_WARN_旁|r
    +|cRXP_WARN_开始|r |T133971:0|t[烹饪] |T132834:0|t[草药烘蛋]|cRXP_WARN_，直到|r |T133971:0|t[烹饪] |cRXP_WARN_至少达到 10|r
    >>|cRXP_WARN_继续提升|r |T133971:0|t[烹饪] |cRXP_WARN_，直到用完|r |T132832:0|t[小蛋] << !sod
    >>|cRXP_WARN_后续暮色森林的任务需要|r |T133971:0|t[烹饪] |cRXP_WARN_达到 50 或以上。稍后乘船时也可以继续烹饪|r << !sod
    .skill cooking,50,1
    .itemcount 6889,1 -- Small Egg (1+)

step
    #optional
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher

step << !sod/Rogue
    #label TOTH
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 958 >> 交任务：上层精灵的工具 << !sod
    .turnin 4762 >> 交任务：壁泉河 << sod
    .accept 4763 >> 接任务：黑木熊怪的堕落 << sod
    .target 桑迪斯·织风
    .isQuestComplete 958
    ----End of small south loop for ERA and SoD Warrior/Rogue/Priest----

step
    #season 0 << !Warrior !Rogue
    #label BashalEnd
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 957 >> 交任务：巴莎兰
    .isOnQuest 957
    .target 阿斯特利安

step
    #optional
    #season 0 << !Warrior !Rogue
    #completewith CrabTurtle
    >>击杀 |cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_如果没能迅速击杀，它们会施放|r |T135914:0|t[狂犬病] |cRXP_WARN_（近战瞬发：所有生命恢复效果降低 50%，持续 10 分钟），请小心|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step
    #optional
    #season 0 << !Warrior !Rogue
    #completewith CrabTurtle
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r和|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，|r |cRXP_ENEMY_森林陆行鸟雏鸟|r |T132307:0|t[逃跑] |cRXP_WARN_技能会在生命值低于30%时触发|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .mob 森林陆行鸟

step
    #label CrabTurtle
    #season 0 << !Warrior !Rogue
    .goto Darkshore,44.18,20.60
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4725 >> 接任务：搁浅的海龟

step
    #optional
    #completewith next
    #season 0 << !Warrior !Rogue
    .goto 1439,45.004,21.344,0
    .goto 1439,48.013,21.409,0
    .goto 1439,49.680,22.468,0
    .goto 1439,45.004,21.344,55,0
    .goto 1439,45.468,20.336,55,0
    .goto 1439,47.356,20.559,55,0
    .goto 1439,48.013,21.409,55,0
    .goto 1439,48.612,20.745,55,0
    .goto 1439,49.680,22.468,55,0
    .goto 1439,49.313,24.271,55,0
    >>击杀|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    >>如果掉落顺利，可以少打一些 17 级的螃蟹。|cRXP_WARN_现在不必完成此任务|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 暗礁蟹

step
    .goto Darkshore,50.81,25.50
    #season 0 << !Warrior !Rogue
    >>|cRXP_WARN_在壁泉河下游使用|r |T134865:0|t[空的水样试管] |cRXP_WARN_取样|r
    .complete 4762,1 --Cliffspring River Sample (1)
    .use 12350
    ----Start of Hunter/Druid 1x and SoD Warrior/Rogue early Althalaxx section (for money+xp)----

step << Hunter/Druid/Warrior/Rogue
    #xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    #optional
    #completewith Tower1
    >>击杀 |cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_如果没能迅速击杀，它们会施放|r |T135914:0|t[狂犬病] |cRXP_WARN_（近战瞬发：所有生命恢复效果降低 50%，持续 10 分钟），请小心|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step << Hunter/Druid/Warrior/Rogue
    #xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    #optional
    #completewith Tower1
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟

step << Hunter/Druid/Warrior/Rogue
    #xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    #optional
    #completewith Tower1
    >>击杀|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎
    .isOnQuest 1002

step << Hunter/Druid/Warrior/Rogue
    #xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    #optional
    #completewith Tower1
    .goto 1439,51.118,23.670,20,0
    .goto 1439,51.490,24.368,30,0
    .goto 1439,54.973,24.885,15 >>前往|cRXP_FRIENDLY_巴苏尔·影击|r
    .isQuestAvailable 1002 << !NightElf/Hunter

step << Hunter/Druid/Warrior/Rogue
    #xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    #label Tower1
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 965 >> 交任务：奥萨拉克斯之塔
    .accept 966 >> 接任务：奥萨拉克斯之塔
    .target 巴苏尔·影击

step << Hunter/Druid/Warrior/Rogue
    #xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    #loop
    .goto 1439,55.231,26.508,0
    .goto 1439,56.194,27.071,0
    .goto 1439,56.047,26.586,0
    .goto 1439,55.231,26.508,50,0
    .goto 1439,55.369,27.025,50,0
    .goto 1439,55.763,26.695,50,0
    .goto 1439,55.815,26.972,50,0
    .goto 1439,56.194,27.071,50,0
    .goto 1439,56.790,27.621,50,0
    .goto 1439,57.278,26.311,50,0
    .goto 1439,57.046,26.234,50,0
    .goto 1439,56.544,26.598,50,0
    .goto 1439,56.047,26.586,50,0
    .goto 1439,55.743,25.915,50,0
    >>击杀|cRXP_ENEMY_暗滩狂热者|r，拾取|cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob 暗滩狂热者

step << Hunter/Druid/Warrior/Rogue
    #xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 966 >> 交任务：奥萨拉克斯之塔
    .accept 967 >> 接任务：奥萨拉克斯之塔
    .target 巴苏尔·影击

step << Hunter/Druid/Warrior/Rogue
    #xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    #loop
    .goto 1439,53.629,26.054,0
    .goto 1439,54.204,30.475,0
    .goto 1439,49.775,30.351,0
    .goto 1439,48.894,26.514,0
    .goto 1439,53.629,26.054,60,0
    .goto 1439,52.764,26.312,60,0
    .goto 1439,53.049,27.983,60,0
    .goto 1439,53.899,28.638,60,0
    .goto 1439,54.204,30.475,60,0
    .goto 1439,51.267,32.319,60,0
    .goto 1439,50.689,32.001,60,0
    .goto 1439,50.818,30.486,60,0
    .goto 1439,49.775,30.351,60,0
    .goto 1439,49.776,28.393,60,0
    .goto 1439,49.902,27.511,60,0
    .goto 1439,49.558,26.087,60,0
    .goto 1439,48.894,26.514,60,0
    .goto 1439,48.022,27.199,60,0
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟
    ----End of Hunter/Druid 1x and SoD Warrior early Althalaxx section (for money+xp)----

step
    #optional
    #completewith CliffCave
    #season 0 << !Warrior !Rogue
    >>击杀 |cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_如果没能迅速击杀，它们会施放|r |T135914:0|t[狂犬病] |cRXP_WARN_（近战瞬发：所有生命恢复效果降低 50%，持续 10 分钟），请小心|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith CliffCave
    >>击杀|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎
    .isOnQuest 1002

step
    #optional
    #season 0 << !Warrior !Rogue
    #loop
    .goto 1439,53.629,26.054,0
    .goto 1439,54.204,30.475,0
    .goto 1439,49.775,30.351,0
    .goto 1439,48.894,26.514,0
    .goto 1439,53.629,26.054,60,0
    .goto 1439,52.764,26.312,60,0
    .goto 1439,53.049,27.983,60,0
    .goto 1439,53.899,28.638,60,0
    .goto 1439,54.204,30.475,60,0
    .goto 1439,51.267,32.319,60,0
    .goto 1439,50.689,32.001,60,0
    .goto 1439,50.818,30.486,60,0
    .goto 1439,49.775,30.351,60,0
    .goto 1439,49.776,28.393,60,0
    .goto 1439,49.902,27.511,60,0
    .goto 1439,49.558,26.087,60,0
    .goto 1439,48.894,26.514,60,0
    .goto 1439,48.022,27.199,60,0
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟
    .itemcount 5469,3 --Strider Meat (3+)
    ----XX Start from West Side if 3+

step
    #season 0 << !Warrior !Rogue
    #loop
    .goto 1439,53.629,26.054,0
    .goto 1439,54.204,30.475,0
    .goto 1439,49.775,30.351,0
    .goto 1439,48.894,26.514,0
    .goto 1439,48.022,27.199,60,0
    .goto 1439,48.894,26.514,60,0
    .goto 1439,49.558,26.087,60,0
    .goto 1439,49.902,27.511,60,0
    .goto 1439,49.776,28.393,60,0
    .goto 1439,49.775,30.351,60,0
    .goto 1439,50.818,30.486,60,0
    .goto 1439,50.689,32.001,60,0
    .goto 1439,51.267,32.319,60,0
    .goto 1439,54.204,30.475,60,0
    .goto 1439,53.899,28.638,60,0
    .goto 1439,53.049,27.983,60,0
    .goto 1439,52.764,26.312,60,0
    .goto 1439,53.629,26.054,60,0
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟

step
    #optional
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,51.288,24.554
    >>点击地上的|cRXP_PICK_传声盒323号|r
    .turnin 1002 >> 交任务：传声盒323号
    .accept 1003 >> 接任务：传声盒525号
    .isQuestComplete 1002
    .subzoneskip 456,1 --Only turnin if you're nearby (Cliffspring River)

step
    #optional
    #completewith next
    #season 0 << !Warrior !Rogue
    #label CliffCave
    .goto 1439,54.934,32.721,20,0
    .goto 1439,55.108,33.600,40 >> 前往壁泉河洞穴

step << Druid
    .goto Darkshore,54.99,33.41
    #season 0
    >>|cRXP_WARN_在壁泉河洞穴入口的水中使用|r |T134776:0|t[空的峭壁之泉取样器] |cRXP_WARN_取样|r
    .complete 6122,1 --Filled Cliffspring Falls Sampler (1)

step << Warrior
    #season 1 -- not loading for now
    #optional
    #sticky
    #label EndlessRage
    .goto Darkshore,55.40,36.05,0,0
    >>击杀|cRXP_ENEMY_赛多拉克斯女士|r，拾取 |T132347:0|t[|cRXP_FRIENDLY_无尽怒气符文|r]
    >>|cRXP_ENEMY_赛多拉克斯女士|r |cRXP_WARN_是18级精英，周围还有其他怪物；你也可以去西部荒野获取符文，那里更容易|r
    >>|cRXP_WARN_在综合频道（/1）寻找也要击杀她或愿意帮忙的玩家组队|r
    >>|cRXP_WARN_如果无法完成，就跳过此步骤|r
    .collect 208741,1 -- Rune of Endless Rage (1)
    .unitscan 赛多拉克斯女士
    .train 403489,1
    .group

step << Warrior
    #season 1 -- not loading for now
    #sticky
    #label EndlessRageEnd
    #requires EndlessRage
    #optional
    .train 403489 >>|cRXP_WARN_使用|r |T132347:0|t[|cRXP_FRIENDLY_无尽怒气符文|r] |cRXP_WARN_来学习|r |T132347:0|t[无尽怒气]
    .use 208741
    .itemcount 208741,1

step
    .goto Darkshore,55.45,36.23,12,0
    .goto Darkshore,55.70,36.30,12,0
    .goto Darkshore,55.89,35.40,12,0
    #season 0 << !Warrior !Rogue
    >>拾取地上的|cRXP_LOOT_粗柄蘑菇|r和一株|cRXP_LOOT_毒帽蘑菇|r
    >>|cRXP_WARN_留在上层。如果上层尽头没有|r|cRXP_LOOT_毒帽蘑菇|r|cRXP_WARN_，就跳到下方南侧的房间拾取一株|r
    >>|cRXP_WARN_小心，|r|cRXP_ENEMY_雷鳞御浪者|r|cRXP_WARN_会施放|r |T135836:0|t[水流喷射] |cRXP_WARN_（远程瞬发：对附近敌人造成伤害并击退）。注意站位，避免被打落到洞穴下层|r
    .complete 947,1 --Scaber Stalk (5)
    .goto Darkshore,55.04,33.34,8,0
    .goto Darkshore,55.28,34.00,8,0
    .goto Darkshore,55.09,34.67,8,0
    .goto Darkshore,55.30,35.58,8,0
    .goto Darkshore,55.04,33.34,8,0
    .goto Darkshore,55.28,34.00,8,0
    .goto Darkshore,55.09,34.67,8,0
    .goto Darkshore,55.30,35.58,8,0
    .goto Darkshore,55.04,33.34
    .complete 947,2 --Death Cap (1)
    .goto Darkshore,55.38,36.34

step << skip --logout skip Warrior/Rogue
    #optional
    #label MushroomLS
    #completewith CavetoAuber
    #season 2
    .goto 1439,54.964,34.536
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_跳上洞穴顶层的岩石，调整站位直到角色看起来悬空，然后退出并重新登录，利用登出传送离开|r

step
    #optional
    #season 0 << !Warrior !Rogue
    #label CavetoAuber
    #completewith CliffspringEnd
    .subzone 442 >> 前往奥伯丁
    ----Start of SoD 250% xp buff early southern Darkshore one loop----

step << Warrior/Rogue
    #label CliffspringEnd
    #season 2
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4762 >> 交任务：壁泉河
    .accept 4763 >> 接任务：黑木熊怪的堕落
    .target 桑迪斯·织风

step << Warrior/Rogue
    #season 2
    .goto 1439,37.511,41.670
    >>|cRXP_WARN_前往地上的|r|cRXP_PICK_营火|r|cRXP_WARN_旁|r
    +|cRXP_WARN_开始|r |T133971:0|t[烹饪] |T132834:0|t[草药烘蛋]|cRXP_WARN_，直到|r |T133971:0|t[烹饪] |cRXP_WARN_至少达到 10|r
    >>|cRXP_WARN_继续提升|r |T133971:0|t[烹饪] |cRXP_WARN_，直到用完|r |T132832:0|t[小蛋] << !sod
    >>|cRXP_WARN_后续暮色森林的任务需要|r |T133971:0|t[烹饪] |cRXP_WARN_达到 50 或以上。稍后乘船时也可以继续烹饪|r << !sod
    .skill cooking,50,1
    .itemcount 6889,1 -- Small Egg (1+)
    .isQuestAvailable 2178

step << Warrior/Rogue
    #season 2
    #optional
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
    .isQuestAvailable 2178

step << !Druid
    #season 2
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >> 接任务：健忘的勘察员
    .target 考古学家霍莉

step
    #season 2
    .goto Darkshore,37.70,43.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    >>|cRXP_WARN_选择|r |T135641:0|t[曲木匕首] |cRXP_WARN_作为奖励，尽量保留一把|r |T135641:0|t[匕首] |cRXP_WARN_，用于后续的|r |T132290:0|t[毒药] |cRXP_WARN_职业任务|r << Rogue
    .turnin 4813 >> 交任务：水晶中的碎骨 << !Hunter !Druid
    .turnin 4813,3 >> 交任务：水晶中的碎骨 << Hunter/Druid
    .target 哨兵戈琳达·纳希恩
    .isQuestTurnedIn 4811

step
    #season 2
    .goto Darkshore,37.78,44.06
    >>|cRXP_WARN_使用|r |T133748:0|t[空的净化碗] |cRXP_WARN_在奥伯丁的月亮井取水|r
    .collect 12347,1,4763,1 --Filled Cleansing Bowl (1)
    .use 12346
    .isOnQuest 4763

step << Warrior/Rogue
    #season 2
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .turnin 947 >> 交任务：洞中的蘑菇
    .accept 948 >> 接任务：安努
    .target 巴瑞萨斯·月影

step
    #season 2
    .goto Darkshore,37.21,44.22
    >>点击|cRXP_PICK_通缉告示|r
    .accept 4740 >> 接任务：通缉：莫克迪普！

step << Druid/Priest
    #season 2
    .goto Darkshore,37.04,44.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板莎希因|r交谈
    .home >> 将炉石绑定在奥伯丁
    .target 旅店老板莎希因

step << Warrior/Rogue
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4725 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛
    .isOnQuest 4725

step << Druid/Hunter
    #season 2
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果
    .target 古博·布拉普

step << Druid
    #season 2
    #sticky
    #label Treats1
    #loop
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>击杀|cRXP_ENEMY_黑木探路者|r和|cRXP_ENEMY_黑木风语者|r，拾取 |T237270:0|t[|cRXP_LOOT_螃蟹点心|r]
    .collect 209027,1 -- Crab Treats (1)
    .mob 黑木探路者
    .mob 黑木风语者
    .train 416049,1

step << Druid
    #season 2
    #sticky
    #label Treats2
    #requires Treats1
    #loop
    .goto 1439,36.091,51.501,0
    .goto 1439,35.088,55.085,0
    .waypoint 1439,36.091,51.501,60,0
    .waypoint 1439,37.115,52.368,60,0
    .waypoint 1439,37.130,53.663,60,0
    .waypoint 1439,36.740,55.221,60,0
    .waypoint 1439,35.655,55.872,60,0
    .waypoint 1439,35.088,55.085,60,0
    .use 209027 >> |cRXP_WARN_使用|r |T237270:0|t[|cRXP_LOOT_螃蟹点心|r] |cRXP_WARN_喂食一只|r|cRXP_ENEMY_暗礁蟹幼崽|r|cRXP_WARN_，即可获得|r |T134419:0|t[|cRXP_FRIENDLY_割伤符文|r]
    .collect 208687,1 -- Rune of Lacerate (1)
    .target 暗礁蟹幼崽
    .train 416049,1

step << Druid
    #season 2
    #sticky
    #label Treats3
    #requires Treats2
    .train 416049 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_割伤符文|r] |cRXP_WARN_学习|r |T132131:0|t[割伤]
    .use 208687
    .itemcount 208687,1

step << !Warrior !Rogue !Priest
    #season 2
    #loop
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>击杀 |cRXP_ENEMY_黑木探路者|r 和 |cRXP_ENEMY_黑木风语者|r
    .complete 985,1 -- Blackwood Pathfinder (8)
    .mob +黑木探路者
    .complete 985,2 -- Blackwood Windtalker (5)
    .mob +黑木风语者

step << !Warrior !Rogue !Priest
    #season 2
    #sticky
    #completewith SealSoD
    .goto 1439,42.017,58.866,0 --NE spawn
    .goto 1439,43.222,59.693,0 --NE spawn
    .goto 1439,43.069,62.448,0 --SE spawn
    .goto 1439,42.489,60.677,0 --Middle spawn
    .waypoint 1439,42.017,58.866,50,0 --NE spawn
    .waypoint 1439,42.311,58.645,50,0
    .waypoint 1439,42.448,58.236,50,0
    .waypoint 1439,43.222,59.693,50,0 --NE spawn
    .waypoint 1439,43.447,60.131,50,0
    .waypoint 1439,43.780,60.275,50,0
    .waypoint 1439,43.069,62.448,50,0 --SE spawn
    .waypoint 1439,43.104,62.563,50,0
    .waypoint 1439,42.794,62.166,50,0
    .waypoint 1439,42.489,60.677,50,0 --Middle spawn
    >>击杀 |cRXP_ENEMY_安娜雅·晨路|r，从她身上拾取 |cRXP_LOOT_安娜雅的坠饰|r
    >>|cRXP_WARN_她每 7-8 分钟刷新一次，在亚米萨兰有 4 个刷新点。如果不在，就跳过此任务|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路

step << !warrior !Rogue !Priest
    #season 2
    #label SealSoD
    .goto 1439,42.373,61.815
    >>点击 |cRXP_PICK_上古之火|r
    .complete 957,1 --Destroy the seal at the ancient flame (1)
    .isOnQuest 957

step << !Warrior !Rogue !Priest
    #season 2
    .goto 1439,42.017,58.866,0 --NE spawn
    .goto 1439,43.222,59.693,0 --NE spawn
    .goto 1439,43.069,62.448,0 --SE spawn
    .goto 1439,42.489,60.677,0 --Middle spawn
    .waypoint 1439,42.017,58.866,50,0 --NE spawn
    .waypoint 1439,42.311,58.645,50,0
    .waypoint 1439,42.448,58.236,50,0
    .waypoint 1439,43.222,59.693,50,0 --NE spawn
    .waypoint 1439,43.447,60.131,50,0
    .waypoint 1439,43.780,60.275,50,0
    .waypoint 1439,43.069,62.448,50,0 --SE spawn
    .waypoint 1439,43.104,62.563,50,0
    .waypoint 1439,42.794,62.166,50,0
    .waypoint 1439,42.489,60.677,50,0 --Middle spawn
    >>击杀 |cRXP_ENEMY_安娜雅·晨路|r，从她身上拾取 |cRXP_LOOT_安娜雅的坠饰|r
    >>|cRXP_WARN_她每 7-8 分钟刷新一次，在亚米萨兰有 4 个刷新点。如果不在，就跳过此任务|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路

step << !Priest
    #optional
    #season 2
    #completewith OnuSoD
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r。|cRXP_WARN_现在不必完成此任务，但抵达安努处时最好已击杀 15+ 只|r
    >>|cRXP_WARN_如果没能迅速击杀，它们会施放|r |T135914:0|t[狂犬病] |cRXP_WARN_（近战瞬发：所有生命恢复效果降低 50%，持续 10 分钟），请小心|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step
    #season 2
    #completewith OnuSoD
    .goto 1439,43.555,76.293,80 >> 前往古树之林

step
    #season 2
    #label OnuSoD
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 952 >> 交任务：古树之林 << Warrior/Rogue
    .turnin 948 >> 交任务：安努
    .accept 944 >> 接任务：主宰之剑
    .target 安努

step
    #season 2
    #label MasterG
    .goto Darkshore,38.54,86.05,100 >> 前往主宰之剑
    .subzoneskip 449
    .isOnQuest 944

step
    #season 2
    #optional
    #completewith MasterEnd
    >>击杀 |cRXP_ENEMY_暮光信徒|r 和 |cRXP_ENEMY_暮光暴徒|r，拾取它们掉落的 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心，|r|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会对你施放|r |T132343:0|t[缴械]，持续|cRXP_WARN_6秒。|r << Rogue/Paladin/Warrior
    *|cRXP_WARN_小心，|r|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复] |cRXP_WARN_并施放需读条3秒的|r |T135915:0|t[治疗术]
    >>|cRXP_WARN_这件物品的掉率极低，不必专门刷取|r
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .mob 暮光信徒
    .mob 暮光暴徒
    --  .use 13536

step
    #optional
    #season 2
    .goto 1439,38.537,86.050
    >>探索主宰之剑
    .complete 944,1 --Enter the Master's Glaive (1)

step
    #optional
    #season 2
    #completewith next
    .cast 5809 >> |cRXP_WARN_使用|r |T134715:0|t[占卜之水] |cRXP_WARN_，将占卜之碗放在地上|r
    .use 5251

step
    .goto 1439,38.537,86.050
    #season 2
    >>|cRXP_WARN_点击地上的|r|cRXP_PICK_占卜之碗|r
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接任务：暮光之锤的营地
    .use 5251

step
    #label MasterEnd
    #season 2
    .goto 1439,38.537,86.050
    >>点击北侧基座上的|cRXP_PICK_暮光之书|r
    .turnin 949 >> 交任务：暮光之锤的营地
    .accept 950 >> 接任务：向安努回复

step
    #optional
    #sticky
    #season 2
    .isQuestTurnedIn 949
    .destroy 5251 >> 摧毁背包中的 |T134715:0|t[占卜之水]，后续已不再需要

step << !Warrior !Druid !Priest
    .goto 1439,43.555,76.293
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >> 交任务：向安努回复
    .timer 11.5,向安努回复剧情
    --  .timer 14,Return to Onu RP
    .target 安努

step
    #sticky
    #label prospector
    #season 2
    .goto 1439,35.724,83.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    >>|cRXP_WARN_可能需要等待他刷新，或等待其他玩家完成护送|r
    .turnin 729 >> 交任务：健忘的勘察员
    .target 勘察员雷姆塔维尔

step
    #season 2
    .goto Darkshore,35.72,83.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈，开始护送任务
    .accept 731,1 >> 接任务：健忘的勘察员
    >>|cRXP_WARN_这个任务很难。如果失败，就跳过此步骤|r << !Warrior
    >>|cRXP_WARN_你很可能无法独自完成此任务！|r建议找到另一名玩家组队后再尝试 << Warrior
    >>如果失败或找不到队友，就跳过此步骤 << Warrior
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击此处观看视频指南|r << Hunter
    .link https://youtu.be/md926sh3L6U >> |cRXP_WARN_点击此处观看流程视频|r << !Hunter
    .target 勘察员雷姆塔维尔

step
    #requires prospector
    #season 2
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_勘察员雷姆塔维尔|r|cRXP_WARN_穿过挖掘场|r
    >>|cRXP_WARN_这个任务很难。如果失败，就跳过此步骤|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击此处观看视频指南|r << Hunter
    .complete 731,1
    .isOnQuest 731

step << Druid/Hunter/Warrior
    #sticky
    #completewith CompleteThistleBears << Hunter/Druid
    #completewith SodMurk << Warrior
    #season 2
    --  .goto Darkshore,33.85,80.92,45,0
    --  .goto Darkshore,32.17,82.92,45,0
    --  .goto Darkshore,35.41,78.96,45,0
    --  .goto Darkshore,35.68,75.23,45,0
    --  .goto Darkshore,35.03,72.19,45,0
    --  .goto Darkshore,35.68,75.23,45,0
    --  .goto Darkshore,35.41,78.96,45,0
    --  .goto Darkshore,32.17,82.92,45,0
    --  .goto Darkshore,33.85,80.92,45,0
    --  .goto Darkshore,35.03,72.19
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    >>|cRXP_WARN_现在不必完成此任务，但这一段结束时最好至少收集到 4 块|r << !Warrior
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 暗礁蟹
    .mob 硬壳潮行蟹

step << !Warrior
    #season 2
    .goto 1439,31.251,87.419
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >> 接任务：搁浅的海洋生物
    >>|cRXP_WARN_这个任务可能很难。对|r|cRXP_ENEMY_鱼人|r|cRXP_WARN_采用 1 只接 1 只的方式逐个击杀，否则容易同时引到多只|r
    .link https://youtu.be/lfQM3Q-Ag5A >> |cRXP_WARN_点击此处观看视频指南|r << Hunter

step << !Warrior
    #season 2
    .goto 1439,31.229,85.564
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4732 >> 接任务：搁浅的海龟

step << !Warrior
    #season 2
    .goto 1439,31.690,83.700
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4731 >> 接任务：搁浅的海龟

step
    #season 2
    .goto 1439,32.644,80.711
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接任务：搁浅的海洋生物

step
    #season 2
    #label SodMurk
    .goto 1439,35.429,76.566,0
    .goto 1439,35.429,76.566,60,0
    .goto Darkshore,36.64,76.53
    >>|cRXP_WARN_先检查|r|cRXP_ENEMY_莫克迪普|r|cRXP_WARN_是否已在水中出现；如果之前有人挑战失败，或没杀掉与他同一波的|r|cRXP_ENEMY_灰雾猎人|r|cRXP_WARN_，他可能仍留在那里|r
    >>击杀营地里的|cRXP_ENEMY_灰雾战士|r和|cRXP_ENEMY_灰雾猎人|r
    >>|cRXP_WARN_走到营地中央的营火旁，触发|r|cRXP_ENEMY_莫克迪普|r|cRXP_WARN_事件：|r
    >>|cRXP_WARN_水中会陆续出现 3 波敌人，每次击杀上一波后才会出现下一波：第 1 波有 3 只 12-13 级的|r|cRXP_ENEMY_灰雾滩行者|r|cRXP_WARN_，第 2 波有 2 只 15-16 级的|r|cRXP_ENEMY_灰雾战士|r|cRXP_WARN_，第 3 波有一只 19 级的|r|cRXP_ENEMY_莫克迪普|r|cRXP_WARN_和一只 16-17 级的|r|cRXP_ENEMY_灰雾猎人|r|cRXP_WARN_。可远离营火，避免立即引到下一波|r
    .complete 4740,1 -- Murkdeep (1)
    .unitscan 莫克迪普
    .mob 灰雾战士
    .mob 灰雾猎人
    .mob 灰雾滩行者

step << Warrior
    #season 2
    .goto Darkshore,35.7,73.5
    >>继续击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r，完成收集
    >>|cRXP_WARN_如果附近没有螃蟹了，就跳过此步骤|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 暗礁蟹
    .mob 硬壳潮行蟹

step << !Priest
    #season 2
    #label CompleteThistleBears
    .goto 1439,35.968,70.807
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4728 >> 接任务：搁浅的海洋生物

step << !Priest
    #season 2
    .goto Darkshore,38.9,64.9
    >>完成击杀|cRXP_ENEMY_狂暴蓟熊|r的任务。
    >>|cRXP_WARN_如果没能迅速击杀，它们会施放|r |T135914:0|t[狂犬病] |cRXP_WARN_（近战瞬发：所有生命恢复效果降低 50%，持续 10 分钟），请小心|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊

step << !Warrior !Rogue !Priest
    #label LateTurtleStart
    .goto 1439,37.105,62.167
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4722 >> 接任务：搁浅的海龟

step << skip -- Hunter
    .goto Darkshore,39.5,55.5
    .xp 19+800 >> 刷怪到 19 级并获得 800 点当前等级经验。这样交完全部任务后就能达到 20 级，在达纳苏斯学习技能
    ----Start of SoD Priest Ashenvale Meditation quest section----

step << Priest
    .goto 1439,43.555,76.293
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >> 交任务：向安努回复
    .target 安努

step << Priest
    #season 2
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈，开始护送任务
    >>|cRXP_WARN_如果他不在，就跳过此步骤；刷新可能需要最多 25 分钟|r
    .accept 5321 >> 接任务：昏昏欲睡
    .target 克罗尼亚·恒影

step << Priest
    #season 2
    .isOnQuest 5321
    .goto Darkshore,44.38,76.30
    >>打开|cRXP_PICK_克罗尼亚的箱子|r，拾取 |T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)

step << Priest
    #season 2
    #completewith towersod
    .zone Ashenvale >> 向南前往灰谷
    .goto Ashenvale,29.7,13.6

step << Priest
    #season 2
    .goto Ashenvale,27.26,35.58
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_克罗尼亚·恒影|r|cRXP_WARN_前往灰谷的迈斯特拉岗哨|r
    .use 13536 >> |cRXP_WARN_每当他睡着，就使用|r |T134229:0|t[|cRXP_LOOT_唤醒号角|r] |cRXP_WARN_，在|r|cRXP_FRIENDLY_克罗尼亚·恒影|r|cRXP_WARN_身旁吹响它|r
    >>|cRXP_WARN_尽量离开主路行走，只有走在路上时才会刷出敌人|r
    .complete 5321,2
    .isOnQuest 5321

step << Priest
    .isQuestComplete 5321
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利拉迪斯·月河|r交谈
    .target 利拉迪斯·月河
    .goto Ashenvale,27.26,35.58
    >>如果尚未完成任务，就跳过此步骤
    .turnin 5321 >> 交任务：昏昏欲睡

step << Priest
    #season 2
    #label towersod
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .target 净化者德尔格伦
    .goto Ashenvale,26.19,38.69
    .turnin 967 >> 交任务：奥萨拉克斯之塔

step << Priest
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .target 奥雷迪尔·阔叶
    .goto Ashenvale,26.43,38.59
    .accept 1010 >> 接任务：巴斯兰的头发

step << Priest
    #season 2
    #sticky
    #completewith PriestHairSoD
    >>寻找草药包时，击杀|cRXP_ENEMY_亡灵草药师|r和|cRXP_ENEMY_亡灵搜寻者|r
    .complete 78192,1 --Forsaken Herbalist (7)
    .complete 78192,2 --Forsaken Seeker (9)
    .mob 亡灵草药师
    .mob 亡灵搜寻者

step << Priest
    #season 2
    #label PriestHairSoD
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地上的 |cRXP_PICK_草药|r，拾取 |cRXP_LOOT_巴斯兰的头发|r
    >>|cRXP_WARN_它们看起来像棕色小袋，可能不太容易发现|r
    .complete 1010,1
    .isOnQuest 1010

step << Priest
    #season 2
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>完成击杀|cRXP_ENEMY_亡灵草药师|r和|cRXP_ENEMY_亡灵搜寻者|r的任务
    .complete 78192,1 --Forsaken Herbalist (7)
    .complete 78192,2 --Forsaken Seeker (9)
    .mob 亡灵草药师
    .mob 亡灵搜寻者

step << Priest
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .target 奥雷迪尔·阔叶
    .goto Ashenvale,26.43,38.59
    .turnin 1010 >> 交任务：巴斯兰的头发
    .accept 1020 >> 接任务：奥雷迪尔的药剂

step << Priest
    #season 2
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黛琳希亚|r交谈
    .fp Astranaar>> 解锁阿斯特兰纳的飞行点
    .target 黛琳希亚

step << Priest
    #season 2
    .goto Ashenvale,37.36,51.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
    .target 皮尔图拉斯·怀特姆恩
    .turnin 1020 >> 交任务：奥雷迪尔的药剂

step << Priest
    #season 2
    #optional
    #completewith next
    .hs >> 使用炉石返回奥伯丁
    >>|cRXP_WARN_如果炉石还在冷却，就飞回去|r
    .cooldown item,6948,>2
    .zoneskip Darkshore
    .subzoneskip 442

step << Priest
    #season 2
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黛琳希亚|r交谈
    .fly Auberdine >> 飞回奥伯丁
    .zoneskip Darkshore
    .target 黛琳希亚
    ----End of SoD Priest Ashenvale Meditation quest section----

step
    #season 2
    #completewith AuberdineFinalTurnins
    .subzone 442 >> 前往奥伯丁

step
    #label AuberdineFinalTurnins
    .goto 1439,36.621,45.596
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4722 >> 交任务：搁浅的海龟
    .turnin 4728 >> 交任务：搁浅的海洋生物 << !Priest
    .turnin 4730 >> 交任务：搁浅的海洋生物
    .turnin 4731 >> 交任务：搁浅的海龟 << !Warrior
    .turnin 4732 >> 交任务：搁浅的海龟 << !Warrior
    .turnin 4733 >> 交任务：搁浅的海洋生物 << !Warrior
    .target 温尼斯·布莱葛

step << Warrior
    .goto Darkshore,36.096,44.931
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >> 交任务：海中的水果
    .target 古博·布拉普
    .isQuestComplete 1138

step << !Warrior !Rogue !Priest
    #optional
    #completewith next
    #season 2
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >> 返回码头上的|cRXP_FRIENDLY_塞瑞利恩·白爪|r处

step << !Warrior !Rogue !Priest
    #optional
    #season 2
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    >>|cRXP_WARN_如果刚有别人交过任务，可能需要等待他的剧情结束|r
    .turnin 963 >> 交任务：永志不渝
    .target 塞瑞利恩·白爪
    .isQuestComplete 963

step
    .goto 1439,37.703,43.393
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4740 >> 交任务：通缉：莫克迪普！
    .target 哨兵戈琳达·纳希恩

step << !Priest
    #label CleansingTharnariunSod
    #season 2
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >> 交任务：清除疫病
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树

step << !Warrior !Rogue !Priest
    #season 2
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 985 >> 交任务：熊怪的威胁
    .target 特伦希斯

step << !Warrior !Rogue !Priest
    #season 2
    .goto 1439,39.043,43.555
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_哨兵艾莉萨·星风|r交谈
    .accept 965 >> 接任务：奥萨拉克斯之塔
    .target 哨兵艾莉萨·星风

step
    .goto 1439,37.439,41.839
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .turnin 731 >> 交任务：健忘的勘察员
    .accept 741 >> 接任务：健忘的勘察员
    .target 考古学家霍莉
    .isQuestComplete 731

step
    #season 2
    .goto Darkshore,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考古学家霍莉|r 交谈
    .accept 741 >>接任务：健忘的勘察员
    .target 考古学家霍莉
    .isQuestTurnedIn 731

step << Druid
    #season 2
    #optional
    #completewith next
    .abandon 6123 >> 放弃任务：收集解药

step
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    .accept 6343 >> 接任务：飞回泰达希尔
    .target 莱尔德
    .isQuestComplete 741 << Rogue sod

step << NightElf
    #season 2
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fly Teldrassil >> 飞往泰达希尔
    .target 凯莱斯·月羽
    .isQuestComplete 741 << Rogue

step << NightElf
    #season 2 << !sod Priest
    #season 1 << sod Priest
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6343 >> 交任务：飞回泰达希尔
    .target 尼莎·影歌
    .isQuestComplete 741 << Rogue sod

step << !NightElf
    #season 2
    .goto 1439,33.169,40.179,15 >> 前往开往达纳苏斯的船只停靠的码头

step << !NightElf
    #season 2
    .goto 1439,33.213,39.883
    >>|cRXP_WARN_等待开往达纳苏斯的船时，可以按需提升|r |T135966:0|t[急救] |cRXP_WARN_技能|r << Warrior/Paladin/Rogue
    .zone Teldrassil >> 乘船前往达纳苏斯
    .zoneskip Stormwind City << Warrior
    .zoneskip Ironforge << Warrior
    .zoneskip Darnassus
    .dungeon !DM << !Dwarf/!Hunter

step
    #season 2
    .isQuestComplete 741 << Rogue
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯

step << Warrior
    #season 2
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿瑞耶尔·天影|r 对话
    >>|cRXP_BUY_购买并装备一根|r |T135157:0|t[占卜法杖]
    .collect 928,1
    .target 阿瑞耶尔·天影
    .money <0.9860
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.16

step << Warrior
    #season 2
    #completewith next
    +|cRXP_WARN_装备|r |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.16

step << Warrior
    .goto Darnassus,58.72,34.92
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿雷亚斯塔·刃歌|r交谈
    .trainer >> 学习职业技能
    .target 阿雷亚斯塔·刃歌

step << Hunter
    #season 2
    .goto Darnassus,40.38,8.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    >>|cRXP_WARN_学习技能后至少保留 70 银，用于购买弓|r
    .trainer >> 学习职业技能
    .target 祖卡斯特

step << Hunter
    #season 2
    .goto Teldrassil,23.70,64.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .turnin 741 >> 交任务：健忘的勘察员
    .accept 942 >> 接任务：健忘的勘察员
    .target 首席考古学家杜瑟·灰须
    .isQuestTurnedIn 731

step << Hunter
    #completewith HunterBowEquip
    #label RecruveReinforcedSoD
    #season 2
    .goto Darnassus,63.27,66.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰德瑞亚|r交谈
    >>|cRXP_WARN_购买|r |T135489:0|t[重型弯弓]
    >>|cRXP_WARN_补充|r |T132382:0|t[锋利的箭]
    .collect 3027,1
    .target 兰德瑞亚
    .money <0.6683
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.50

step << Hunter
    #label HunterBowEquip
    #requires RecruveReinforcedSoD
    #completewith next
    #season 2
    +|cRXP_WARN_装备|r |T135489:0|t[重型弯弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.19
    .xp <20,1

step << Rogue
    >>进入塞纳里奥区
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞尤娜|r交谈
    .goto Darnassus,31.84,16.69,15,0
    .goto Darnassus,37.00,21.92
    >>|cRXP_WARN_学习技能后至少保留 1 金 50 银，用于购买武器|r
    .trainer >> 学习职业技能
    .target 塞尤娜
    .isQuestComplete 741

step << Rogue
    #season 2
    .goto Darnassus,58.76,44.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿瑞耶尔·天影|r 对话
    >>|cRXP_BUY_购买并装备两把|r |T135342:0|t[波刃短剑]
    .collect 2209,2
    .target 阿瑞耶尔·天影
    .money <1.4230
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .isQuestComplete 741

step << Rogue
    #season 2
    #completewith next
    +|cRXP_WARN_装备两把|r |T135342:0|t[波刃短剑]
    .use 2209
    .itemcount 2209,2
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93

step << Rogue
    #season 2
    .equip 17,2209 >>将第二把[波刃短剑]装备到副手栏
    .itemcount 2209,2
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93

step << !Druid !Hunter
    #season 2
    .goto Teldrassil,23.70,64.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .turnin 741 >> 交任务：健忘的勘察员
    .accept 942 >> 接任务：健忘的勘察员
    .target 首席考古学家杜瑟·灰须
    .isQuestTurnedIn 731

step << Priest
    .goto Darnassus,37.90,82.74
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾德莉亚|r交谈
    .trainer >> 学习职业技能
    .target 贾德莉亚

step << Priest
    .goto Darnassus,38.00,89.00
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦丝拉·炉心|r交谈
    .turnin 78192 >> 交任务：圣光的秘密
    .accept 78193 >> 接任务：圣光的秘密
    .target 麦丝拉·炉心

step << !Druid !Hunter
    #season 2
    .hs >> 使用炉石返回奥伯丁
    >>|cRXP_WARN_如果炉石还在冷却，就飞回去|r
    .zoneskip Darkshore
    .subzoneskip 442
    .isQuestTurnedIn 741 << Rogue
    .cooldown item,6948,>0,1

step << !Druid !Hunter
    #season 2
    #label startSoD
    #sticky
    #completewith next
    .goto 1457,29.179,41.180
    .zone Teldrassil >> 穿过紫色传送门前往鲁瑟兰村
    .isQuestTurnedIn 741 << Rogue

step << !Druid !Hunter
    #season 2
    #label FlyAuberdineSoD
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >> 飞往黑海岸
    .target 维斯派塔斯
    .zoneskip Darkshore
    .isQuestTurnedIn 741 << Rogue
    ----Start of Druid/Hunter Quest+SoD rune section----

step << Druid
    #optional
    #season 2
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 6001 >> 交任务：身心之力
    .accept 26 >> 接任务：必修的课程
    .trainer >> 学习职业技能
    >>你很快会获得许多强大的猎豹形态符文，使用野性猎豹形态练级会更快。如果愿意，可|cRXP_WARN_将天赋从平衡重置为野性战斗|r，并尽早点出提高猎豹形态移动速度的天赋，节省赶路时间。
    .target 玛斯雷·驭熊者
    .isQuestComplete 6001

step << Druid
    #season 2
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛斯雷·驭熊者|r 交谈
    .accept 26 >>接任务：必修的课程
    .target 玛斯雷·驭熊者
    .isQuestTurnedIn 6001

step << Druid
    .isQuestTurnedIn 731
    #season 2
    .goto Teldrassil,23.70,64.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .turnin 741 >> 交任务：健忘的勘察员
    .accept 942 >> 接任务：健忘的勘察员
    .target 首席考古学家杜瑟·灰须

step << Druid/Hunter
    #season 2
    #optional
    #completewith next
    +现在前往泰达希尔获取 |T133816:0|t[铭刻手套 - 割碎] << Druid
    +现在前往泰达希尔获取 |T236178:0|t[爆炸射击] << Hunter
    .train 410025,1 << Druid
    .train 410123,1 << Hunter

step << Druid/Hunter
    #season 2
    #optional
    .goto 1438,40.411,54.076
    .subzone 141 >> 前往泰达希尔
    .subzoneskip 262
    .train 410025,1 << Druid
    .train 410123,1 << Hunter

step << Druid/Hunter
    #season 2
    #optional
    #label Banethil1
    #completewith Rune
    .goto 1438,40.411,54.076,40,0
    .goto 1438,42.225,54.161,40,0
    .goto 1438,44.474,56.354,40,0
    .goto 1438,44.197,58.040
    .subzone 262 >> 进入班奈希尔兽穴
    .train 410025,1 << Druid
    .train 410123,1 << Hunter

step << Druid/Hunter
    #season 2
    #optional
    #requires Banethil1
    #completewith Rune
    .goto 1438,44.064,58.196,15,0
    .goto 1438,43.975,58.537,15,0
    .goto 1438,44.196,58.597,15,0
    .goto 1438,44.167,58.204,15,0
    .goto 1438,43.073,59.123,15,0
    .goto 1438,43.399,59.885,15,0
    .goto 1438,43.602,59.799,15,0
    .goto 1438,44.254,59.083,15,0
    .goto 1438,44.292,58.555,15,0
    .goto 1438,43.944,57.918,15,0
    .goto 1438,43.947,57.297,15,0
    .goto 1438,44.731,57.355,15,0
    .goto 1438,45.118,57.701,20 >> 前往内部的|cRXP_ENEMY_怒爪|r处
    .train 410025,1 << Druid
    .train 410123,1 << Hunter

step << Druid/Hunter
    #season 2
    #loop
    .line 1438,45.055,57.739,45.008,58.055,45.091,58.386,45.256,58.538,45.492,58.609,45.668,58.356,45.702,57.980,45.604,57.699,45.370,57.566,45.161,57.638,45.118,57.701
    .goto 1438,45.055,57.739,12,0
    .goto 1438,45.008,58.055,12,0
    .goto 1438,45.091,58.386,12,0
    .goto 1438,45.256,58.538,12,0
    .goto 1438,45.492,58.609,12,0
    .goto 1438,45.668,58.356,12,0
    .goto 1438,45.702,57.980,12,0
    .goto 1438,45.604,57.699,12,0
    .goto 1438,45.370,57.566,12,0
    .goto 1438,45.161,57.638,12,0
    .goto 1438,45.118,57.701,12,0
    >>在内部最下层击杀|cRXP_ENEMY_怒爪|r，拾取 |T136061:0|t|cRXP_LOOT_[怒熊神像]|r << Druid
    >>在内部最下层击杀|cRXP_ENEMY_怒爪|r，拾取 |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r << Hunter
    .collect 206954,1 << Druid -- Idol of Ursine Rage (1)
    .collect 206169,1 << Hunter -- Rune of Explosive Shot (1)
    .mob 怒爪
    .train 410025,1 << Druid
    .train 410123,1 << Hunter

step << Druid
    #season 2
    .equip 18,206954 >> |cRXP_WARN_装备|r |T136061:0|t|cRXP_LOOT_[怒熊神像]|r
    .use 206954
    .itemcount 206954,1
    .train 410025,1

step << Druid
    #season 2
    #loop
    .goto 1438,44.731,57.355,0
    .goto 1438,44.254,59.083,0
    .goto 1438,44.064,58.196,0
    .goto 1438,44.731,57.355,15,0
    .goto 1438,43.947,57.297,15,0
    .goto 1438,43.944,57.918,15,0
    .goto 1438,44.292,58.555,15,0
    .goto 1438,44.254,59.083,15,0
    .goto 1438,43.602,59.799,15,0
    .goto 1438,43.399,59.885,15,0
    .goto 1438,43.073,59.123,15,0
    .goto 1438,44.167,58.204,15,0
    .goto 1438,44.196,58.597,15,0
    .goto 1438,43.975,58.537,15,0
    .goto 1438,44.064,58.196,15,0
    .aura 414824 >>|cRXP_WARN_处于|r |T132276:0|t[熊形态]|cRXP_WARN_时，将怒气维持在 50 或以上，持续 60 秒|r
    .itemStat 18,QUALITY,2
    .train 410025,1

step << Druid/Hunter
    #season 2
    #label Rune
    .train 410025 >>|cRXP_WARN_使用|r |T136061:0|t|cRXP_LOOT_[怒熊神像]|r |cRXP_WARN_学习|r |T132135:0|t[割碎] << Druid
    .train 410123 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r |cRXP_WARN_来学习|r |T236178:0|t[爆炸射击] << Hunter
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
    .use 206954 << Druid
    .use 206169 << Hunter
    .aura -414824 << Druid

step << Druid
    #optional
    #completewith TotL
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade

step << Druid
    .goto Moonglade,56.1,30.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 26 >> 交任务：必修的课程
    .accept 29 >> 接任务：湖中试炼
    .target 德迪利特·星焰

step << Druid
    .goto Moonglade,52.6,51.6
    >>游入月神湖
    >>打开一个|cRXP_PICK_神殿灵珠容器|r，拾取 |T134125:0|t[神殿灵珠]
    >>|cRXP_WARN_它可能刷新在不同的水下位置|r
    .collect 15877,1,29,1 -- Shrine Bauble (1)

step << Druid
    #optional
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .itemcount 15877,1 -- Shrine Bauble (1)

step << Druid
    .goto Moonglade,36.026,41.374
    >>|cRXP_WARN_使用|r |T134125:0|t[神殿灵珠] |cRXP_WARN_在雷姆洛斯神殿的树旁完成试炼|r
    .complete 29,1 --Complete the Trial of the Lake.
    .use 15877

step << Druid
    #label TotL
    .goto Moonglade,36.517,40.104
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔加里|r交谈
    .turnin 29 >> 交任务：湖中试炼
    .accept 272 >> 接任务：海狮试炼
    .target 塔加里

step << Druid/Hunter
    #optional
    .hs >> 使用炉石返回黑海岸
    .zoneskip Darkshore
    ----End of Druid Quest+SoD rune section----

step << Priest
    #season 2
    #label TravelMenethilNoDMBoat
    #completewith MenethilNoDMBoat
    .goto Darkshore,32.44,43.71,15 >> 前往开往米奈希尔港的船只停靠的码头
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall

step << Priest
    #season 2
    #label MenethilNoDMBoat
    .goto Darkshore,32.29,44.05
    .zone Wetlands >> 乘船前往米奈希尔港
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    ----End of SoD 250% xp buff early southern Darkshore one loop----

step
    #label DarkshoreEnd
]])
----End of Darkshore Part 1----
----Start of Darkshore Part 2----
----Hunters stay in Darkshore/Ashenvale and Grind, 2x skips Redridge----
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupweight 500
#classic
#version 1
#season 2
<< Alliance
<< !sod/Warrior/Rogue/Hunter/Druid
#group RestedXP Alliance 1-20
#groupid RXP-SRGCE-A1
#name 20-22 Darkshore SoD
#next RestedXP Alliance 20-30\22-24 Wetlands SoD
#displayname 20-22 黑海岸 << sod !Warrior
#displayname 20-22 黑海岸/灰谷 << sod Warrior

step
    .goto Darkshore,37.78,44.06
    .use 12346 >>|cRXP_WARN_使用|r |T133748:0|t[空的净化碗] |cRXP_WARN_在|r |cRXP_PICK_奥伯丁月亮井|r 取水
    .collect 12347,1,4763,1
    .isOnQuest 4763

step
    #season 2
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿斯特利安|r 交谈
    .turnin 957 >> 交任务 巴莎兰
    .isOnQuest 957
    .target 阿斯特利安

step << Warlock
    #season 2
    #sticky
    #completewith TravelMenethilNoDMBoat
    #label ExplorerImpDarkshoreTwo
    >>任务过程中，对怪物施放 |T136163:0|t|cRXP_FRIENDLY_[吸取灵魂]|r，直到获得 |T133257:0|t|cRXP_LOOT_探险之魂|r。|cRXP_WARN_使用它来学会召唤|r |T236294:0|t|cRXP_FRIENDLY_[探险小鬼]|r
    .train 445459 >>|cRXP_WARN_使用|r |T133257:0|t|cRXP_LOOT_探险之魂|r |cRXP_WARN_来学会召唤|r |T236294:0|t[|cRXP_FRIENDLY_探险小鬼|r]
    .train 445459,1 --Skips if you already have Explorer Imp
    .train 1120,3 --Skips if you don't have drain soul
    .use 221978

step << Warlock/Mage
    #season 2
    #requires ExplorerImpDarkshoreTwo << Warlock
    #sticky
    #completewith TravelMenethilNoDMBoat
    #label FelPortalRuneDarkshore
    >>你所在区域存在 |cRXP_FRIENDLY_邪能传送门|r. 若发现一个, 召唤 |T236294:0|t[|cRXP_FRIENDLY_探险小鬼|r] 并站在传送门旁与其交谈, 派遣它探险. 10-20 分钟后它将返回并携带战利品, 还有机会奖励 |T134419:0|t[|cRXP_FRIENDLY_恶魔卫士符文|r] << Warlock
    >>你所在区域存在 |cRXP_FRIENDLY_邪能传送门|r. 若发现一个, 使用 |T134945:0|t[|cRXP_LOOT_空间修复卷轴|r] 将其关闭. 这将奖励 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：怨火之箭|r] << Mage
    >>|cRXP_WARN_留意传送门，直到获得符文|r
    .collect 221499,1 << Warlock --rune of the felguard
    .collect 223147,1 << Mage --Spell Notes: Balefire Bolt
    .itemcount 220792,1 << Mage --Scroll of Spatial Mending
    .use 223148 << Warlock --Otherworldy Treasure
    .use 220792 << Mage
    .train 428878,1 << Mage
    .train 427733,1 << Warlock
    .train 1120,3 << Warlock --Skips if you don't have drain soul
    .unitscan 邪能裂片
    .unitscan 邪能崩口
    .unitscan 邪能裂痕
    .unitscan 邪能之疤
    .unitscan 邪能裂隙

step << Warlock/Mage
    #season 2
    #requires FelPortalRuneDarkshore
    #sticky
    #completewith TravelMenethilNoDMBoat
    .itemcount 221499,1 << Warlock --Rune of the Felguard
    .itemcount 223147,1 << Mage --Spell Notes: Balefire Bolt
    .train 427733 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_恶魔卫士符文|r] |cRXP_WARN_来学习|r |T136216:0|t[召唤恶魔卫士] << Warlock
    .train 428878 >> |cRXP_WARN_使用|T134939:0|t[|cRXP_FRIENDLY_法术笔记：怨火之箭|r]学习|T135809:0|t[怨火之箭]。|r << Mage
    .use 221499 << Warlock
    .use 223147 << Mage

step
    #sticky
    #label Blackwood1
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,50.66,34.94
    >>打开 |cRXP_PICK_黑木谷物|r，拾取 |T134939:0|t|cRXP_LOOT_[黑木谷物]|r
    >>|cRXP_WARN_拾取该物品会刷新 2 只 |r|cRXP_ENEMY_黑木熊怪|r|cRXP_WARN_，它们会立刻仇恨并向你冲来。做好战斗准备，或设法让它们脱离战斗|r
    >>|cRXP_WARN_如果看到 |r|cRXP_ENEMY_萨巴克希斯|r|cRXP_WARN_ 在聊天中喊话，或有人正在与他战斗，请帮忙。打开他掉落在地上的 |r|cRXP_PICK_萨巴克希斯的恶魔之包|r|cRXP_WARN_，拾取其中的|r |cRXP_LOOT_堕落护符|r
    .collect 12342,1,4763,1 -- Blackwood Grain Stores (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)

step << Druid
    #season 2
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>击杀 |cRXP_ENEMY_雌蓟熊|r，拾取 |T132942:0|t[|cRXP_FRIENDLY_野性神像|r]
    >>|cRXP_WARN_注意 |r|cRXP_ENEMY_蓟熊幼崽|r|cRXP_WARN_, 它们会把你击晕 2 秒|r
    .collect 208689,1 -- Ferocious Idol (1)
    .mob 雌蓟熊
    .train 407988,1

step
    #season 0 << Warrior
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>击杀 |cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_注意 |r|cRXP_ENEMY_蓟熊幼崽|r|cRXP_WARN_, 它们会把你击晕 2 秒|r
    .complete 2139,1 --Den Mother (1)
    .mob 雌蓟熊

step
    #sticky
    #requires Blackwood1
    #label Blackwood2
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,51.83,33.50
    >>打开 |cRXP_PICK_黑木坚果|r，拾取 |T133944:0|t|cRXP_LOOT_[黑木坚果]|r
    >>|cRXP_WARN_拾取该物品会刷新 2 只 |r|cRXP_ENEMY_黑木熊怪|r|cRXP_WARN_，它们会立刻仇恨并向你冲来。做好战斗准备，或设法让它们脱离战斗|r
    >>|cRXP_WARN_如果看到 |r|cRXP_ENEMY_萨巴克希斯|r|cRXP_WARN_ 在聊天中喊话，或有人正在与他战斗，请帮忙。打开他掉落在地上的 |r|cRXP_PICK_萨巴克希斯的恶魔之包|r|cRXP_WARN_，拾取其中的|r |cRXP_LOOT_堕落护符|r
    .collect 12343,1,4763,1 -- Blackwood Nut Sample (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)

step
    #sticky
    #requires Blackwood2
    #label Blackwood3
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,52.86,33.41
    >>打开 |cRXP_PICK_黑木水果|r，拾取 |T134013:0|t|cRXP_LOOT_[黑木水果]|r
    >>|cRXP_WARN_拾取该物品会刷新 2 只 |r|cRXP_ENEMY_黑木熊怪|r|cRXP_WARN_，它们会立刻仇恨并向你冲来。做好战斗准备，或设法让它们脱离战斗|r
    >>|cRXP_WARN_如果看到 |r|cRXP_ENEMY_萨巴克希斯|r|cRXP_WARN_ 在聊天中喊话，或有人正在与他战斗，请帮忙。打开他掉落在地上的 |r|cRXP_PICK_萨巴克希斯的恶魔之包|r|cRXP_WARN_，拾取其中的|r |cRXP_LOOT_堕落护符|r
    .collect 12341,1,4763,1 -- Blackwood Fruit Sample (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)

step
    #optional
    #requires Blackwood3
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39
    .cast 16072 >> |cRXP_WARN_使用|r |T134712:0|t[装满水的净化碗] |cRXP_WARN_在 |r|cRXP_PICK_篝火|r|cRXP_WARN_ 旁召唤|r |cRXP_ENEMY_萨巴克希斯|r
    .timer 17,黑木熊怪堕落剧情
    .use 12347

step
    #requires Blackwood3
    #label Xabraxxis
    .goto Darkshore,52.38,33.39
    >>击杀 |cRXP_ENEMY_萨巴克希斯|r. 打开他掉落在地上的 |cRXP_PICK_萨巴克希斯的恶魔之包|r, 拾取 |cRXP_LOOT_堕落护符|r
    .use 12347
    .complete 4763,1 -- Talisman of Corruption (1)
    .mob 萨巴克希斯

step << Warrior
    #season 2
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>击杀 |cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_注意 |r|cRXP_ENEMY_蓟熊幼崽|r|cRXP_WARN_, 它们会把你击晕 2 秒|r
    .complete 2139,1 --Den Mother (1)
    .mob 雌蓟熊

step << skip --logout skip Warrior
    #season 2
    .goto Darkshore,51.48,38.43
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_跳到雌蓟熊洞穴后方的蘑菇上，再在蘑菇上登出以完成登出跳过|r

step << Warrior
    #optional
    #season 2
    #completewith BlackwoodSod
    .subzone 442 >> 前往奥伯丁

step
    #season 0 << Warrior
    #xprate >1.49 << Hunter/Druid
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巴苏尔·影击|r
    .turnin 965 >> 交任务 奥萨拉克斯之塔
    .accept 966 >> 接任务 奥萨拉克斯之塔
    .target 巴苏尔·影击

step << Paladin
    #season 2
    #optional
    #completewith next
    .goto Darkshore,56.20,26.46
    >>|cRXP_WARN_留意进入奥萨拉克斯之塔的队伍。如果有人进去，慢慢跟在他们身后进入，以便在塔顶拾取 |r|cRXP_PICK_奇异宝珠|r
    >>|cRXP_WARN_小心, 这座塔里的怪是 28-31 级, 你基本打不过|r
    >>|cRXP_WARN_如果你不想做这个,请跳过此步骤|r
    >>打开奥萨拉克斯之塔顶桌子上的 |cRXP_PICK_奇异宝珠|r，拾取 |cRXP_LOOT_奥萨拉克斯宝珠|r
    .collect 209836,1,78089,1 --Athalaxx Orb (1)
    .train 410014,1

step << Warlock
    #season 2
    #optional
    #completewith Parchments
    >>|cRXP_WARN_留意进入奥萨拉克斯之塔的队伍。如果有人进去，慢慢跟在他们身后进入，以便在塔顶拾取 |r|cRXP_PICK_阿尔泰克之枝|r|cRXP_WARN_，获得 |T135153:0|t[阿尔泰克之枝]|r
    >>|cRXP_WARN_这是为你稍后获取|r |T237558:0|t[恶魔变形] |cRXP_WARN_符文准备的。如果不想做，可以跳过此步骤|r
    >>|cRXP_WARN_小心, 这座塔里的怪是 28-31 级, 你基本打不过|r
    >>|cRXP_WARN_如果你不想做这个,请跳过此步骤|r
    .collect 210763,1
    .goto Darkshore,56.3,26.5
    .train 403938,1
    .dungeon SFK
    .isQuestAvailable 78680

step << Warlock
    #season 2
    #sticky
    #label Channeling
    #loop
    .goto 1439,55.231,26.508,0
    .goto 1439,56.194,27.071,0
    .goto 1439,56.047,26.586,0
    .waypoint 1439,55.743,25.915,50,0
    .waypoint 1439,56.047,26.586,50,0
    .waypoint 1439,56.544,26.598,50,0
    .waypoint 1439,57.046,26.234,50,0
    .waypoint 1439,57.278,26.311,50,0
    .waypoint 1439,56.790,27.621,50,0
    .waypoint 1439,56.194,27.071,50,0
    .waypoint 1439,55.815,26.972,50,0
    .waypoint 1439,55.763,26.695,50,0
    .waypoint 1439,55.369,27.025,50,0
    .waypoint 1439,55.231,26.508,50,0
    >>击杀 |cRXP_ENEMY_暗滩狂热者|r, 搜刮 |T134419:0|t[|cRXP_FRIENDLY_引导符文|r]
    .collect 208750,1 -- Rune of Channeling (1)
    .mob 暗滩狂热者
    .train 403932,1

step << Warlock
    #season 2
    #sticky
    #label ChannelingEnd
    #requires Channeling
    .train 403932 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_引导符文|r] |cRXP_WARN_来学习|r |T136168:0|t[引导大师]
    .use 208750
    .itemcount 208750,1

step
    #xprate >1.49 << Hunter/Druid
    #season 0 << Warrior
    #label Parchments << Warlock --Season 2 SFK
    #loop
    .goto 1439,55.231,26.508,0
    .goto 1439,56.194,27.071,0
    .goto 1439,56.047,26.586,0
    .goto 1439,55.231,26.508,50,0
    .goto 1439,55.369,27.025,50,0
    .goto 1439,55.763,26.695,50,0
    .goto 1439,55.815,26.972,50,0
    .goto 1439,56.194,27.071,50,0
    .goto 1439,56.790,27.621,50,0
    .goto 1439,57.278,26.311,50,0
    .goto 1439,57.046,26.234,50,0
    .goto 1439,56.544,26.598,50,0
    .goto 1439,56.047,26.586,50,0
    .goto 1439,55.743,25.915,50,0
    >>击杀 |cRXP_ENEMY_暗滩狂热者|r, 搜刮 |cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob 暗滩狂热者

step
    #xprate >1.59
    #season 0 << Warrior
    #loop
    #optional
    .goto 1439,55.231,26.508,0
    .goto 1439,56.194,27.071,0
    .goto 1439,56.047,26.586,0
    .goto 1439,55.743,25.915,50,0
    .goto 1439,56.047,26.586,50,0
    .goto 1439,56.544,26.598,50,0
    .goto 1439,57.046,26.234,50,0
    .goto 1439,57.278,26.311,50,0
    .goto 1439,56.790,27.621,50,0
    .goto 1439,56.194,27.071,50,0
    .goto 1439,55.815,26.972,50,0
    .goto 1439,55.763,26.695,50,0
    .goto 1439,55.369,27.025,50,0
    .goto 1439,55.231,26.508,50,0
    .xp 18+15000 >> 刷怪至 15000+/19400 经验值
    .mob 暗滩狂热者

step
    #xprate >1.49 << Hunter/Druid
    #season 0 << Warrior
    #requires Channeling << Warlock --Season 2
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巴苏尔·影击|r
    .turnin 966 >> 交任务 奥萨拉克斯之塔
    .accept 967 >> 接任务 奥萨拉克斯之塔 << !Hunter
    .target 巴苏尔·影击

step << Priest
    #season 1 -- Skipping this rune cus its useless
    #completewith next
    >>击杀 |cRXP_ENEMY_雷鳞侍从|r、|cRXP_ENEMY_雷鳞战士|r 和 |cRXP_ENEMY_雷鳞巫师|r，拾取 |T236364:0|t[|cRXP_LOOT_碎矛供品|r]
    .collect 211482,1 -- Shatterspear Offering (1)
    .mob 雷鳞侍从
    .mob 雷鳞战士
    .mob 雷鳞巫师
    .train 425215,1

step
    #season 0
    #requires ChannelingEnd << Warlock --Season 2
    .goto Darkshore,57.13,22.04,55,0
    .goto Darkshore,57.97,20.23,55,0
    .goto Darkshore,58.36,23.61,55,0
    .goto Darkshore,59.42,24.62,55,0
    .goto Darkshore,60.26,21.75
    >>拾取地上的 |cRXP_LOOT_玛塞斯特拉遗物|r
    .complete 951,1 -- Mathystra Relics (6)

step << Priest
    #season 1 -- Skipping this rune cus its useless
    .goto Darkshore,59.2,23.4,60,0
    .goto Darkshore,60.0,15.4
    >>击杀 |cRXP_ENEMY_雷鳞侍从|r、|cRXP_ENEMY_雷鳞战士|r 和 |cRXP_ENEMY_雷鳞巫师|r，拾取 |T236364:0|t[|cRXP_LOOT_碎矛供品|r]
    .collect 211482,1 -- Shatterspear Offering (1)
    .mob 雷鳞侍从
    .mob 雷鳞战士
    .mob 雷鳞巫师
    .train 425215,1

step << Priest
    #season 1 -- Skipping this rune cus its useless
    .goto Darkshore,59.2,22.6
    .use 211482 >> |cRXP_WARN_使用|r |T236364:0|t[|cRXP_LOOT_碎矛供品|r] |cRXP_WARN_在水下的碎矛神像处获取|r |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r]
    .collect 205905,1 -- Memory of a Devout Champion (1)
    .train 425215,1

step << Priest
    #season 1 -- Skipping this rune cus its useless
    .train 425215 >> |cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r] |cRXP_WARN_来学习|r |T237566:0|t[扭曲信仰]
    >>|cRXP_WARN_学习回忆前需先获得冥想增益：暗夜精灵在月亮井旁输入 /kneel；人类或矮人在北郡修道院、暴风城大教堂等圣光圣地输入 /kneel。也可请已有增益的牧师传授|r
    .use 205905
    .itemcount 205905,1

step << !sod/Hunter/Druid
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_基尔卡克·旋杆|r
    .accept 2098 >> 接任务 基尔卡克的钥匙
    .target 基尔卡克·旋杆

step << !sod/Hunter/Druid
    #optional
    #completewith next
    .goto Darkshore,56.10,16.88,0
    >>击杀 |cRXP_ENEMY_狂暴暗礁蟹|r 和 |cRXP_ENEMY_硬壳潮行蟹|r, 搜刮 |cRXP_LOOT_基尔卡克钥匙的尾部|r
    >>|cRXP_WARN_注意 |r|cRXP_ENEMY_狂暴暗礁蟹|r|cRXP_WARN_ 的|r |T132152:0|t[痛击] |cRXP_WARN_技能。它们的近战攻击可能瞬间造成200点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key (1)
    .mob 狂暴暗礁蟹
    .mob 硬壳潮行蟹

step << !sod/Hunter/Druid
    .goto Darkshore,54.93,12.19
    >>击杀 |cRXP_ENEMY_灰雾智者|r 和 |cRXP_ENEMY_灰雾潮行者|r, 搜刮 |cRXP_LOOT_基尔卡克钥匙的中部|r
    >>|cRXP_WARN_注意 |r|cRXP_ENEMY_灰雾智者|r|cRXP_WARN_ 的|r |T136048:0|t[闪电箭] |cRXP_WARN_伤害；它们也会使用|r |T136052:0|t[治疗波]
    >>|cRXP_WARN_可以利用沉船遮挡 |r|cRXP_ENEMY_灰雾智者|r|cRXP_WARN_ 的视线，躲避它们的|r |T136048:0|t[闪电箭] |cRXP_WARN_伤害|r
    .complete 2098,2 -- Middle of Gelkak's Key (1)
    .mob 灰雾潮行者
    .mob 灰雾智者

step << !sod/Hunter/Druid
    .goto Darkshore,55.59,16.98,45,0
    .goto Darkshore,53.76,18.96,45,0
    .goto Darkshore,51.34,22.00,45,0
    .goto Darkshore,56.63,12.08
    >>击杀 |cRXP_ENEMY_狂暴暗礁蟹|r 和 |cRXP_ENEMY_硬壳潮行蟹|r, 搜刮 |cRXP_LOOT_基尔卡克钥匙的尾部|r
    >>|cRXP_WARN_注意 |r|cRXP_ENEMY_狂暴暗礁蟹|r|cRXP_WARN_ 的|r |T132152:0|t[痛击] |cRXP_WARN_技能。它们的近战攻击可能瞬间造成200点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key (1)
    .mob 狂暴暗礁蟹
    .mob 硬壳潮行蟹

step << !sod/Hunter/Druid
    #sticky
    #label foreststriders
    .goto Darkshore,59.29,13.22,55,0
    .goto Darkshore,61.40,9.40,50,0
    .goto Darkshore,61.51,12.66,50,0
    .goto Darkshore,61.24,15.38,50,0
    .goto Darkshore,61.40,9.40
    >>击杀 |cRXP_ENEMY_凶猛的森林陆行鸟|r, 搜刮 |cRXP_LOOT_基尔卡克钥匙的头部|r
    .complete 2098,1 -- Top of Gelkak's Key (1)
    .mob 凶猛的森林陆行鸟

step
    #xprate <1.59
    .goto Darkshore,61.40,9.40,45,0
    .goto Darkshore,62.42,7.67
    >>击杀 |cRXP_ENEMY_月夜雄虎|r 和 |cRXP_ENEMY_月夜雌虎|r, 搜刮 |cRXP_LOOT_兽皮|r
    >>|cRXP_WARN_注意 |r|cRXP_ENEMY_月夜雌虎|r|cRXP_WARN_. 她们总是带着一只 |r|cRXP_ENEMY_月夜猛虎幼崽|r|cRXP_WARN_ 一同进攻|r
    .complete 986,1 -- Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .mob 月夜雌虎
    .mob 月夜猛虎幼崽

step << !sod/Hunter/Druid
    #requires foreststriders
    .group 2 << Warrior/Paladin/Rogue
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_基尔卡克·旋杆|r
    >>|cRXP_WARN_开始寻找队伍完成基尔卡克的报复／|r|cRXP_ENEMY_机械打手4100型|r << Warrior/Paladin/Rogue
    .turnin 2098 >> 交任务 基尔卡克的钥匙
    .accept 2078 >> 接任务 基尔卡克的报复
    .target 基尔卡克·旋杆

step << !sod/Hunter/Druid
    #optional
    #completewith next
    .goto 1439,55.802,18.290
    .gossipoption 95406 >> 对话 |cRXP_FRIENDLY_机械打手 4100 型|r 开始护送
    --  .gossipoption 87696 >> Talk to |cRXP_FRIENDLY_The Threshwackonator 4100|r to start the escort
    >>|cRXP_WARN_这个任务 难度非常大|r
    .target 机械打手4100型
    .isOnQuest 2078 << Warrior/Paladin/Rogue

step << !sod/Hunter
    #label Turtle4727
    .goto 1439,53.113,18.099
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4727 >> 接任务 搁浅的海龟

step << !sod/Hunter/Druid
    .goto Darkshore,55.81,18.29,10,0
    .goto 1439,56.654,13.484
    #optional
    >>护送 |cRXP_FRIENDLY_机械打手 4100 型|r 到 |cRXP_FRIENDLY_基尔卡克·旋杆|r 那去
    >>等 |cRXP_ENEMY_机械打手 4100 型|r 变为敌对状态后将其击杀
    >>|cRXP_WARN_这个任务 难度非常大|r
    *逃跑时只使用远程攻击，避免进入它的近战范围 << Druid
    >>|cRXP_WARN_尽量完成此任务，它会奖励|r |T134797:0|t[水下呼吸药剂] |cRXP_WARN_，可为后续水下任务节省时间|r << !Druid !Warlock
    >>|cRXP_WARN_在它变为敌对时使用|r |T136100:0|t[纠缠根须] |cRXP_WARN_，然后拉开距离并用瞬发法术风筝它|r << Druid
    >>|cRXP_WARN_如果打不过 |r|cRXP_ENEMY_机械打手 4100 型|r|cRXP_WARN_, 就跳过这一步|r
    .complete 2078,1 --Gyromast's Revenge (1)
    .link https://youtu.be/1WRRmKYBr9s >> |cRXP_WARN_点击此处查看视频攻略|r
    .mob 机械打手4100型
    .isOnQuest 2078 << Warrior/Paladin/Rogue
    --XX DRUID: Test if you can root

step << !sod/Hunter/Druid
    #optional << Warrior/Paladin/Rogue
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_基尔卡克·旋杆|r
    .turnin 2078 >> 交任务 基尔卡克的报复
    .target 基尔卡克·旋杆
    .isQuestComplete 2078

step
    #optional
    #season 0 << Warrior
    #completewith BeachedCloak
    .abandon 2078 >> 放弃任务 基尔卡克的报复

step << Druid
    #xprate <1.5
    #optional
    #completewith DeerComplete
    >>击杀 |cRXP_ENEMY_硬壳潮行蟹|r, 搜刮 |cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹

step << !sod/Hunter/Druid
    #sticky
    #label DeleteGyromast
    #optional
    .destroy 7442 >> 从背包中删除 |T134459:0|t[基尔卡克的钥匙]，它已不再需要

step << Druid
    #label Turtle4727
    .goto 1439,53.113,18.099
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4727 >> 接任务 搁浅的海龟

step << Druid
    #xprate <1.5
    #label DeerComplete
    #loop
    .goto Darkshore,49.7,33.2,0
    .goto Darkshore,43.4,25.1,0
    .goto Darkshore,39.6,34.8,0
    .goto Darkshore,49.7,33.2,40,0
    .goto Darkshore,43.4,25.1,40,0
    .goto Darkshore,39.6,34.8,40,0
    >>|cRXP_WARN_使用|r |T132801:0|t[动物医疗药膏] |cRXP_WARN_治疗|r |cRXP_ENEMY_生病的鹿|r
    .complete 6124,1 -- Sickly Deer cured (10)
    .mob 生病的鹿
    .use 15826

step << Druid
    .goto Darkshore,48.87,11.32
    >>|cRXP_WARN_游到水中|r
    >>打开 |cRXP_PICK_奇怪的保险箱|r, 获取 |cRXP_LOOT_水兽敏捷坠饰|r
    .collect 15883,1,272,1 --Collect Half Pendant of Aquatic Agility (x1)
    ----Start of Darkshire 2x 20 Turnins & Druid Training----

step << Druid
    #xprate >1.59
    #optional
    #completewith next
    .cast 18960 >> 施放传送:月光林地
    .zoneskip Moonglade
    .xp <20,1

step << Druid
    #xprate >1.59
    #optional
    .goto Moonglade,52.53,40.57
    >>去月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔
    .xp <20,1

step << Druid
    #xprate >1.59
    #optional
    #completewith BlackwoodSod
    .hs >> 炉石回奥伯丁
    .zoneskip Darkshore
    .subzoneskip 442
    .xp <20,1

step << Druid
    #season 2
    #optional
    #completewith BlackwoodSod
    .goto Moonglade,48.0,67.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_辛德拉尔|r 交谈
    .zoneskip Darkshore
    .fly Auberdine >>|cRXP_WARN_如果炉石还没冷却好, 就坐飞机回奥伯丁|r

step << !Warrior
    #season 2
    #optional
    #completewith BlackwoodSod
    .hs >> 炉石回奥伯丁
    .subzoneskip 442
    .cooldown item,6948,>0,1

step << !Druid !Warrior
    #optional
    #season 2
    #completewith next
    .goto 1439,37.703,43.393
    .subzone 442 >> 若炉石无法使用, 跑回奥伯丁

step
    #xprate >1.59
    #label BlackwoodSod
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 4763 >> 交任务 黑木熊怪的堕落
    .target 桑迪斯·织风

step
    #xprate >1.59
    #optional
    #completewith AuberdineNorthernEnd
    .destroy 12342 >> 摧毁背包中的|T134939:0|t|cRXP_LOOT_[黑木谷物]|r，后续不再需要。

step
    #xprate >1.59
    #optional
    #completewith AuberdineNorthernEnd
    .destroy 12343 >> 摧毁背包中的|T133944:0|t|cRXP_LOOT_[黑木坚果]|r，后续不再需要。

step
    #xprate >1.59
    #optional
    #completewith AuberdineNorthernEnd
    .destroy 12341 >> 摧毁背包中的|T134013:0|t|cRXP_LOOT_[黑木水果]|r，后续不再需要。

step
    #season 1
    #xprate >1.59
    #optional
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_达蒙德|r
    >>|cRXP_BUY_购买|r |T135237:0|t[燧石和火绒] |cRXP_BUY_及|r |T135435:0|t[普通木柴] |cRXP_BUY_各一份|r
    >>|cRXP_WARN_这是为稍后在船上提升你的|r |T133971:0|t[烹饪] |cRXP_WARN_技能准备的|r
    >>|cRXP_WARN_之后暮色森林的任务需要50点|r |T133971:0|t[烹饪] |cRXP_WARN_技能|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .itemcount 6889,1 -- Small Egg (1+)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .target 达蒙德

step
    #season 1
    #xprate >1.59
    #optional
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .vendor 6301 >>|cRXP_BUY_购买|r |T134059:0|t[甜香料] |cRXP_BUY_，直到你持有的|r |T134059:0|t[甜香料] |cRXP_BUY_数量等于或多于当前持有的|r |T132832:0|t[小蛋] |cRXP_BUY_数量|r
    .collect 2678,50,90,1,0x20,cooking --Mild Spices (1-50)
    .disablecheckbox
    .collect 6889,50,90,1,0x20,cooking --Small Egg (1-50)
    .disablecheckbox
    .target 高尔博德·钢手
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .itemcount 6889,1 -- Small Egg (1+)

step
    #xprate >1.59
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_萨纳瑞恩·绿树|r
    .turnin 2139 >> 交任务 萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树

step
    #xprate >1.59
    #optional
    #label PeltEnd
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_特伦希斯|r
    .turnin 986 >> 交任务 丢失的主人
    .target 特伦希斯
    .isQuestComplete 986

step
    #xprate >1.59
    #requires DeleteGyromast << !sod/Hunter/Druid
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_古博·布拉普|r
    .turnin 1138 >> 交任务 海中的水果
    .target 古博·布拉普
    .isQuestComplete 1138

step
    #season 1 << Warrior sod -- won't load
    #xprate >1.59
    #label BeachedCloak
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_温尼斯·布莱葛|r
    .turnin 4727 >> 交任务 搁浅的海龟
    .target 温尼斯·布莱葛
    ----Start of SoD Warrior short ashenvale bit to catch up xp----

step
    #label AuberdineNorthernEnd

step << Warrior
    .goto 1439,43.555,76.293
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_安努|r
    .turnin 950 >> 交任务 向安努回复
    .target 安努

step << Warrior
    #season 2
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_克罗尼亚·恒影|r 开始护送
    >>|cRXP_WARN_如果他不在那里, 请跳过此步骤. 他重生可能需要长达 25 分钟|r
    .accept 5321 >> 接任务 昏昏欲睡
    .target 克罗尼亚·恒影

step << Warrior
    #season 2
    .isOnQuest 5321
    .goto Darkshore,44.38,76.30
    >>打开 |cRXP_PICK_克罗尼亚的箱子|r, 拾取 |T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)

step << Warrior
    #season 2
    #sticky
    >>|cRXP_WARN_护送 |r|cRXP_FRIENDLY_克罗尼亚|r|cRXP_WARN_ 去灰谷的迈斯特拉岗哨|r
    .use 13536 >> |cRXP_WARN_使用|r |T134229:0|t[|cRXP_LOOT_唤醒号角|r] |cRXP_WARN_，每当 |r|cRXP_FRIENDLY_克罗尼亚|r|cRXP_WARN_ 睡着时，站在他旁边吹响号角|r
    >>|cRXP_WARN_尽量避免在主路上奔跑, 只有当你走在道路上时，才会刷新敌人|r
    .complete 5321,2
    .isOnQuest 5321

step << Warrior
    #season 2
    .goto Darkshore,45.8,90.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_哨兵阿娜莎|r 接任务
    .accept 5713 >> 接任务 一击必杀
    .target 哨兵阿娜莎

step << Warrior
    #season 2
    .goto Darkshore,45.8,90.2
    >>三波怪物会依次生成, 每波之间有短暂的间隔时间. 你可以在等待下一波时击杀该区域内的其他怪物
    >>|cRXP_WARN_做此任务时别忘了继续唤醒|r |cRXP_FRIENDLY_克罗尼亚|r |cRXP_WARN_，他会帮助你对付怪物|r
    .complete 5713,1

step << Warrior
    #season 2
    #completewith towersod
    .zone Ashenvale >> 向南前往 灰谷
    .goto Ashenvale,29.7,13.6

step << Warrior
    #season 2
    .goto Ashenvale,26.6,36.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_哨兵奥奈雅|r
    .turnin 5713,1 >> 交任务 一击必杀
    .target 哨兵奥奈雅

step << Warrior
    .isQuestComplete 5321
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利拉迪斯·月河|r交谈
    .target 利拉迪斯·月河
    .goto Ashenvale,27.26,35.58
    >>如果你没做完任务, 就跳过这一步
    .turnin 5321 >> 交任务 昏昏欲睡

step << Warrior
    #season 2
    #label towersod
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_净化者德尔格伦|r
    .target 净化者德尔格伦
    .goto Ashenvale,26.19,38.69
    .turnin 967 >> 交任务 奥萨拉克斯之塔

step << Warrior
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_奥雷迪尔·阔叶|r
    .target 奥雷迪尔·阔叶
    .goto Ashenvale,26.43,38.59
    .accept 1010 >> 接任务 巴斯兰的头发

step << Warrior
    #season 2
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地上的 |cRXP_PICK_草药|r，拾取 |cRXP_LOOT_巴斯兰的头发|r
    >>|cRXP_WARN_它们看起来像棕色小袋子, 不容易发现|r
    .complete 1010,1
    .isOnQuest 1010

step << Warrior
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_奥雷迪尔·阔叶|r
    .target 奥雷迪尔·阔叶
    .goto Ashenvale,26.43,38.59
    .turnin 1010 >> 交任务 巴斯兰的头发
    .accept 1020 >> 接任务 奥雷迪尔的药剂

step << Warrior
    #season 2
    .goto Ashenvale,37.36,51.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r
    .target 皮尔图拉斯·怀特姆恩
    .turnin 1020 >> 交任务 奥雷迪尔的药剂

step << Warrior
    #season 2
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_黛琳希亚|r
    .fp Astranaar>> 获取阿斯特兰纳飞行点
    .target 黛琳希亚

step << Warrior
    #season 2
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_黛琳希亚|r
    .fly Auberdine >> 飞回奥伯丁
    .target 黛琳希亚
    ----End of SoD Warrior short ashenvale bit to catch up xp----
    ----Start of Druid SoD Wild Strikes run segment----

step << Druid
    #season 2
    #optional
    #completewith next
    +|cRXP_WARN_现在前去获取|r |T132143:0|t[|cRXP_FRIENDLY_狂野打击|r] |cRXP_WARN_符文。需要前往石爪山脉，路程较长，但此符文在后续升级中非常强大|r

step << Druid
    .goto 1439,43.555,76.293
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_安努|r
    .turnin 950 >> 交任务 向安努回复
    .target 安努

step << Druid
    #season 2
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_克罗尼亚·恒影|r 开始护送
    >>|cRXP_WARN_如果他不在那里, 请跳过此步骤. 他重生可能需要长达 25 分钟|r
    .accept 5321 >> 接任务 昏昏欲睡
    .target 克罗尼亚·恒影

step << Druid
    #season 2
    .isOnQuest 5321
    .goto Darkshore,44.38,76.30
    >>打开 |cRXP_PICK_克罗尼亚的箱子|r, 拾取 |T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)

step << Druid
    #season 2
    #completewith towersod
    .zone Ashenvale >> 向南前往 灰谷
    .goto Ashenvale,29.7,13.6

step << Druid
    #season 2
    .goto Ashenvale,27.26,35.58
    >>|cRXP_WARN_护送 |r|cRXP_FRIENDLY_克罗尼亚|r|cRXP_WARN_ 去灰谷的迈斯特拉岗哨|r
    .use 13536 >> |cRXP_WARN_使用|r |T134229:0|t[|cRXP_LOOT_唤醒号角|r] |cRXP_WARN_，每当 |r|cRXP_FRIENDLY_克罗尼亚|r|cRXP_WARN_ 睡着时，站在他旁边吹响号角|r
    >>|cRXP_WARN_尽量避免在主路上奔跑, 只有当你走在道路上时，才会刷新敌人|r
    .complete 5321,2
    .isOnQuest 5321

step << Druid
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利拉迪斯·月河|r交谈
    .target 利拉迪斯·月河
    .goto Ashenvale,27.26,35.58
    .turnin 5321 >> 交任务 昏昏欲睡
    .isQuestComplete 5321

step << Druid
    #season 2
    #label towersod
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_净化者德尔格伦|r
    .target 净化者德尔格伦
    .goto Ashenvale,26.19,38.69
    .turnin 967 >> 交任务 奥萨拉克斯之塔

step << Druid
    #season 2
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_黛琳希亚|r
    .fp Astranaar>> 获取阿斯特兰纳飞行点
    .target 黛琳希亚

step << Druid
    #season 2
    .goto Ashenvale,34.8,49.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_哨兵塞恩希尔|r
    .target 哨兵塞恩希尔
    .accept 1070 >> 接任务 守卫石爪山

step << Druid
    #season 2
    .goto Ashenvale,42.4,72.3,30 >> 前往通往石爪山脉的石爪小径

step << Druid
    #season 2
    .goto Stonetalon Mountains,78.2,42.6,40 >> 穿过隧道进入石爪山脉

step << Druid
    #season 2
    .goto Stonetalon Mountains,59.8,66.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_凯拉·影矛|r
    .target 凯拉·影矛
    .turnin 1070 >> 交任务 守卫石爪山

step << Druid
    #season 2
    .goto Stonetalon Mountains,71.5,86.5,40 >> 前往地图上标记的恐怖图腾村

step << Druid
    #season 2
    .goto Stonetalon Mountains,80.2,90.6,60,0
    .goto Stonetalon Mountains,83.2,87.0,60,0
    .goto Stonetalon Mountains,71.6,86.6,60,0
    .goto Stonetalon Mountains,76.6,91.0,60,0
    .goto Stonetalon Mountains,80.2,90.6
    >>击杀 |cRXP_ENEMY_恐怖图腾成员|r，拾取 |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]
    .collect 210534,1 -- Idol of the Wild (1)
    .mob 恐怖图腾佣兵
    .mob 恐怖图腾蛮兵
    .mob 恐怖图腾巫师
    .mob 恐怖图腾恶徒
    .train 410021,1

step << Druid
    #season 2
    .equip 18,210534 >> |cRXP_WARN_装备|r |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]
    .use 210534
    .itemcount 210534,1
    .train 410021,1

step << Druid
    #season 2
    #sticky
    #completewith wildStrikesEnd
    >>|cRXP_WARN_施放|r |T136085:0|t[愈合] |cRXP_WARN_或|r |T136041:0|t[治疗之触] |cRXP_WARN_治疗10只不同的友方野兽，例如猎人宠物、熊形态德鲁伊或幽魂之狼形态萨满|r << Horde
    >>|cRXP_WARN_施放|r |T136085:0|t[愈合] |cRXP_WARN_或|r |T136041:0|t[治疗之触] |cRXP_WARN_治疗10只不同的友方野兽，例如猎人宠物或熊／猎豹形态德鲁伊|r << Alliance
    >>这一步可能需要一些时间，具体取决于你找到多少只友善的野兽。|cRXP_WARN_切勿死亡或卸下遗物|r，直到获得 10 层灵感，否则进度会丢失
    .train 410021 >> |cRXP_WARN_使用|r |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r] |cRXP_WARN_来学习|r |T132143:0|t[狂野打击]
    .itemcount 210534,1

step << Druid
    #season 2
    #optional
    #completewith next
    .cast 18960 >> 施放传送:月光林地
    .zoneskip Moonglade

step << Druid
    #season 2
    .goto Moonglade,52.53,40.57
    >>去月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .train 6756 >> 学习职业技能
    .target 洛甘纳尔

step << Druid
    #optional
    #label wildStrikesEnd
    .cooldown item,6948,>2
    .hs >> 炉石回黑海岸
    .zoneskip Darkshore
    ----End of Druid SoD Wild Strikes run segment----
    ----End of Darkshore 2x 20 Turnins & Druid Training----
    ----Start of Rogue Poison Quest Section----

step << Druid
    #season 2
    .cast 18960 >>施放[传送：月光林地]，返回月光林地乘坐角鹰兽
    .zoneskip Moonglade
    .zoneskip Darkshore

step << Druid
    #season 2
    .goto Moonglade,48.0,67.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_辛德拉尔|r 交谈
    .fly Auberdine >>飞往奥伯丁
    .target 辛德拉尔
    .zoneskip Darkshore

step
    #xprate >1.59
    #label TravelMenethilNoDMBoat
    #completewith MenethilNoDMBoat
    .goto Darkshore,32.44,43.71,15 >> 前往开往米奈希尔港的船只停靠的码头
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM

step
    #label MenethilNoDMBoat
    .goto Darkshore,32.29,44.05
    .zone Wetlands >> 乘船前往 米奈希尔港
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM

step << Rogue
    #season 2
    .goto Wetlands,7.95,56.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_德温·晨光|r
    .vendor 1453 >> |cRXP_WARN_购买当前库存中的所有|r |T134831:0|t[治疗药水] |cRXP_WARN_，有多少买多少|r
    >>|cRXP_WARN_这是限量供应的物品. 如果 |r|cRXP_FRIENDLY_德温·晨光|r|cRXP_WARN_ 没有, 可跳过此步骤|r
    .target 德温·晨光

step << Rogue
    #season 2
    .money <0.08
    .goto Wetlands,10.4,56.0,25,0
    .goto Wetlands,10.1,56.9,25,0
    .goto Wetlands,10.6,57.2,25,0
    .goto 1437,10.760,56.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_尼尔·奥雷|r
    .vendor >> |cRXP_WARN_购买:|r |T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量供应的物品. 如果 |r|cRXP_FRIENDLY_尼尔·奥雷|r|cRXP_WARN_ 没有此物品, 请跳过此步骤|r
    .target 尼尔·奥雷
    .bronzetube

step << Rogue
    #season 2
    .goto Wetlands,10.69,60.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板赫布瑞克|r
    .target 旅店老板赫布瑞克
    .home >> 将你的炉石设置为米奈希尔港

step << Rogue
    #season 2
    .goto Wetlands,10.843,60.435
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话楼上的 |cRXP_FRIENDLY_考古学家弗拉冈特|r
    .target 考古学家弗拉冈特
    .turnin 942 >> 交任务 健忘的勘察员
    .accept 943 >> 接任务 健忘的勘察员
    .isQuestComplete 942

step << Rogue
    #season 2
    .goto Wetlands,10.843,60.435
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_考古学家弗拉冈特|r 交谈
    .accept 943 >>接任务：健忘的勘察员
    .target 考古学家弗拉冈特
    .isQuestTurnedIn 942

step << Rogue
    #season 2
    .goto Wetlands,10.496,60.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与 |cRXP_FRIENDLY_萨莫尔·菲斯蒂沃斯|r 交谈
    .vendor >> |cRXP_BUY_购买当前库存中的所有|r |T134831:0|t[治疗药水] |cRXP_BUY_，有多少买多少|r
    >>|cRXP_WARN_这是限量供应的物品. 如果 |r|cRXP_FRIENDLY_萨莫尔·菲斯蒂沃斯|r|cRXP_WARN_ 没有, 请跳过此步骤|r
    .target 萨莫尔·菲斯蒂沃斯

step << Rogue
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r
    .fp Menethil Harbor >> 获取米奈希尔港飞行点
    .target 谢尔雷·布隆迪尔
    .dungeon !DM

step << NightElf Rogue
    #optional
    #completewith next
    .goto Wetlands,5.485,64.156,40 >> 从码头尽头跳进水里, 游向坐标点
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59
    .goto Wetlands,2.433,78.689,-1
    .goto Ironforge,17.089,83.373,-1
    .zone Ironforge >>使用角色卡死自助服务功能直接传送到铁炉堡。先在此处下线，再用另一角色打开帮助菜单（也可将下方的脱困链接粘贴到浏览器），向下滚动至自助服务，选择角色并点击“移动”。如果无法脱困，就跳过此步，沿山脉游泳前往西部荒野。
    .link https://www.youtube.com/watch?v=oVoxsr4zcg4 >> 点击这里查看视频参考
    .link https://us.battle.net/support/en/help/product/wow/197/834/solution >> 点击此处打开角色脱困自助服务链接
    .subzoneskip 809 --IF Gates
    .subzoneskip 2257 --Deeprun Tram
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
    .dungeon !DM
    ----Start of NE Rogue 2x No Deadmines swim to Westfall Alternative section----

step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto 1415,44.720,49.200,60,0 -- Wetlands to Westfall Swim
    .goto 1415,43.162,49.946,60,0
    .goto 1415,42.564,50.884,20,0
    .goto 1415,42.363,50.812,20,0
    .goto 1415,41.682,50.232,20,0
    .goto 1415,40.959,50.142,20,0
    .goto 1415,39.818,51.078,20,0
    .goto 1415,39.778,51.615,30,0
    .goto 1415,39.505,52.636,30,0
    .goto 1415,40.160,54.451,20,0
    .goto 1415,40.505,54.507,20,0
    .goto 1415,41.370,57.126,40,0
    .goto 1415,41.988,59.434,30,0
    .goto 1415,41.342,61.214,30,0
    .goto 1415,41.309,61.938,20,0
    .goto 1415,40.545,64.111,30,0
    .goto 1415,41.066,65.878,20,0
    .goto 1415,41.349,66.265,30,0
    .goto 1415,41.363,66.995,30,0
    .goto 1415,41.625,67.689,30,0
    .goto StormwindClassic,4.493,29.157,20,0
    .goto StormwindClassic,10.336,40.166,10,0
    .goto StormwindClassic,7,45.471,10,0
    .goto StormwindClassic,5.560,50.125,10,0
    .goto StormwindClassic,13.669,74.499,20,0
    .goto Westfall,42.024,70.980
    .zone Westfall >> 如果网站脱困服务不可用，就游泳前往 西部荒野
    .zoneskip Ironforge
    .subzoneskip 809--IF Gates
    .subzoneskip 2257--Deeprun Tram
    .zoneskip Stormwind City
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto Westfall,54.28,9.26,100,0
    .goto Westfall,56.55,52.64,100 >> 上岸后前往哨兵岭
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索尔|r
    .fp Sentinel Hill >> 获取哨兵岭飞行点
    .target 索尔
    .zoneskip Ironforge --Skips if you didn't swim from Wetlands
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格里安·斯托曼|r
    .accept 65 >> 接任务 迪菲亚兄弟会
    .target 格里安·斯托曼
    .zoneskip Westfall,1
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Elwynn Forest,36.809,72.429,100,0
    .goto StormwindClassic,69.961,86.583
    .zone Stormwind City >> 跑步前往 暴风城
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59 << !Hunter
    #label WepTrainNoDM
    #optional << NightElf
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吴平|r 对话
    .train 201 >> 学习单手剑（1h） << Rogue
    .train 202 >> 学习双手剑（2h） << Warrior
    .target 吴平
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Darkshore
    .zoneskip Wetlands
    .zoneskip Ironforge
    .dungeon !DM
    ----End of NE Rogue 2x No Deadmines swim to Westfall Alternative section----

step << NightElf Rogue
    #xprate >1.59
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fp Ironforge >> 获取铁炉堡飞行点
    .target 格莱斯·瑟登
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|r|cRXP_LOOT_《深渊之神》|r|cRXP_WARN_] 来开始任务|r
    .accept 968 >> 接任务 深渊之神
    .use 5352
    .itemcount 5352,1
    .zoneskip Darkshore << Warrior/Paladin
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM

step << Rogue
    #xprate >1.59
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_葛利·硬骨|r
    .turnin 968 >> 交任务 深渊之神
    .target 葛利·硬骨
    .isOnQuest 968
    .zoneskip Darkshore << Warrior/Paladin
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM

step << skip --logout skip Rogue
    #xprate >1.59
    #optional
    #completewith DeeprunNoDM
    .goto 1455,56.207,46.844
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到狮鹫的头部上方, 通过登出再重新登录执行小退跳过|r
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestAvailable 968
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM

step << Rogue
    #xprate >1.59
    .goto 1455,67.842,42.456
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_考格斯宾|r
    .vendor 5175 >> |cRXP_BUY_购买|r |T133024:0|t[青铜管] |cRXP_BUY_，有货时向他购买|r
    --    >>You will need 2 bronze tubes for a quest later << Rogue
    .target 考格斯宾
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .subzoneskip 2257
    .bronzetube
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #label DeeprunNoDM
    .goto Ironforge,78.00,51.40
    .subzone 2257 >>进入矿道地铁
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM

step << Rogue
    #xprate >1.59
    >>|cRXP_WARN_在乘坐电车时, 如果需要, 可提升你的|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_你需要你的|r|T135966:0|t[急救]|cRXP_WARN_达到 80 以上, 才能做后面的任务|r << Rogue !Dwarf
    .zone Stormwind City >> 乘坐矿道地铁前往 暴风城
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Westfall
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM

step << Rogue
    #xprate >1.59
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_比利巴布·旋轮|r
    .vendor 5519 >> |cRXP_BUY_购买|r |T133024:0|t[青铜管] |cRXP_BUY_，有货时向他购买|r
    --    >>You will need 2 bronze tubes for a quest later << Rogue
    .target 比利巴布·旋轮
    .zoneskip Darkshore << Warrior/Paladin
    .bronzetube
    .train 201,1 << NightElf Rogue --1h swords not trained
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith RogueTrainNoDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_学习|r |T132282:0|t[伏击] |cRXP_WARN_，前提是你有余钱，并已装备或在背包中备有|r |T135641:0|t[匕首] |cRXP_WARN_。这能为后续步骤节省时间|r
    .train 8676 >> 学习 |T132282:0|t[伏击]
    .target 夜行者奥斯伯
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保学习|r |T132320:0|t[潜行]|cRXP_WARN_、|r |T133644:0|t[搜索]|cRXP_WARN_和|r |T136058:0|t[开锁] |cRXP_WARN_，后续会用到这些技能|r
    .train 1784 >>学习 |T132320:0|t[潜行]
    .train 921 >>训练 |T133644:0|t[搜索]
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .dungeon !DM
    .train 1784,1
    .train 921,1

step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保学习|r |T133644:0|t[搜索]|cRXP_WARN_和|r |T136058:0|t[开锁] |cRXP_WARN_，后续会用到这些技能|r
    >>|cRXP_WARN_在接下来的步骤中, 请务必小心管理金钱. 只购买必要的法术. 你很快将需要钱来学习消失, 以及 75 银币在返回湿地后获得符文|r
    .train 921 >>训练 |T133644:0|t[搜索]
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .dungeon !DM
    .train 921,1

step << Rogue
    #xprate >1.59
    #label RogueTrainNoDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保学习|r |T136058:0|t[开锁] |cRXP_WARN_，后续会用到|r
    >>|cRXP_WARN_在接下来的步骤中, 请务必小心管理金钱. 只购买必要的法术. 你很快将需要钱来学习消失, 以及 75 银币在返回湿地后获得符文|r
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.799,53.815,15,0
    .goto 1453,77.290,58.138,12,0
    .goto 1453,78.466,60.034,12,0
    .goto 1453,78.560,58.435,6,0
    .goto 1453,75.754,60.369,12 >> 前往军情七处 (SI:7) 楼上找 |cRXP_FRIENDLY_“剃刀”雷吉克|r 和 |cRXP_FRIENDLY_马迪亚斯·肖尔|r
    .dungeon !DM

step << Rogue
    #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_“剃刀”雷吉克|r 和 |cRXP_FRIENDLY_马迪亚斯·肖尔|r
    .accept 2281 >> 接任务 赤脊山的联络员
    .goto StormwindClassic,75.76,60.35
    .target +“剃刀”雷吉克
    .accept 2360 >> 接任务 马迪亚斯和迪菲亚潜行者
    .goto StormwindClassic,75.78,59.84
    .target +马迪亚斯·肖尔
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_玛尔达·维勒|r
    >>|cRXP_BUY_购买一把|r |T135342:0|t[波刃短剑] |cRXP_BUY_，或在拍卖行寻找更好／更便宜的替代品|r
    >>|cRXP_WARN_在接下来的步骤中, 请务必小心管理金钱. 若资金不足，可以只买一把匕首并跳过此步骤。 你很快会需要花钱购买消失, 以及返回湿地后用 75 银币获取符文|r
    .collect 2209,2 --Kris (2)
    .target 玛尔达·维勒
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_玛尔达·维勒|r
    >>|cRXP_WARN_购买一把|r |T135342:0|t[波刃短剑] |cRXP_BUY_，前提是你负担得起|r
    >>|cRXP_WARN_在接下来的步骤中, 请务必小心管理金钱. 若资金不足，可以只买一把匕首并跳过此步骤。 你很快会需要花钱购买消失, 以及返回湿地后用 75 银币获取符文|r
    .collect 2209,1 --Kris (2)
    .target 玛尔达·维勒
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith WileyStart
    .equip 16,2209 >>装备 |T135342:0|t[波刃短剑] 到主手栏
    .use 2209
    .itemcount 2209,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拍卖师亚克森|r
    >>购买 |T134437:0|t[抗毒药剂]，用于稍后的 |T132290:0|t[毒药] 任务；其余物品用于稍后在赤脊山快速交任务 << !Dwarf
    >>买下这些东西, 以后去赤脊山交任务用: << Dwarf
    >>这将节省时间, 因为无需到处寻找怪物击杀. 如果不想购买任何物品, 请跳过此步骤
    >>|T134437:0|t[抗毒药剂] << !Dwarf
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf --Anti-Venom (1)
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target 拍卖师亚克森
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #completewith GryanAll << Human
    #optional << Human
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fp Stormwind >> 获取暴风城飞行点 << !Human
    .fly Westfall >> 飞往西部荒野 << Human
    .target 杜加尔·朗德瑞克
    .zoneskip Westfall << Human
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .zone Westfall >> 前往: 西部荒野
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #label GryanAll << Human
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格里安·斯托曼|r
    .accept 65 >> 接任务 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon !DM

step << Rogue
    #xprate >1.59
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索尔|r
    .fp Sentinel Hill >> 获取哨兵岭飞行点 << !Human
    .fly Redridge >> 飞往赤脊山 << Human
    .target 索尔
    .dungeon !DM

step << Human Rogue
    #xprate >1.59
    #optional
    #completewith WileyStart
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Redridge >> 飞往赤脊山
    .target 杜加尔·朗德瑞克
    .zoneskip Stormwind City,1
    .isOnQuest 65
    .dungeon !DM

step << !Human Rogue
    #xprate >1.59
    .goto Elwynn Forest,65.20,69.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话阿祖拉之塔顶的 |cRXP_FRIENDLY_塞欧克瑞图斯|r
    .accept 94 >> 接任务 法师的眼线
    .target 塞欧克瑞图斯
    .dungeon !DM

step << !Human Rogue
    #xprate >1.59
    #optional
    #completewith WileyStart
    .goto Redridge Mountains,15.27,71.45
    .zone Redridge Mountains >> 前往: 赤脊山
    .dungeon !DM

step << Rogue
    #xprate >1.59 << !Hunter
    #optional
    .goto Redridge Mountains,22.67,43.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_厨师布雷纳|r
    .accept 92 >> 接任务 赤脊山炖肉
    .turnin 92 >> 交任务 赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target 厨师布雷纳
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #label WileyStart
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话楼上的 |cRXP_FRIENDLY_黑衣威利|r
    .turnin 65 >> 交任务 迪菲亚兄弟会
    .accept 132 >> 接任务 迪菲亚兄弟会
    .target 黑衣威利
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #label Rendevous
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2281 >> 交任务 赤脊山的联络员
    .accept 2282 >> 接任务 奥瑟尔伐木场
    .target 卢修斯
    .dungeon !DM

step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,32.2,48.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_工头奥斯洛|r
    .accept 89 >> 接任务 止水湖上的桥
    .target 工头奥斯洛
    .xp 21.4,1
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #sticky
    #completewith next
    .goto Redridge Mountains,39.6,33.2,0
    .goto Redridge Mountains,38.2,35.7,0
    .goto Redridge Mountains,35.2,37.8,0
    .goto Redridge Mountains,31.9,39.5,0
    .goto Redridge Mountains,28.5,38.7,0
    .goto Redridge Mountains,25.1,37.7,0
    >>你可以在前往奥瑟尔伐木场的途中击杀一些豺狼人, 此目标将在返程时完成
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .isOnQuest 89
    .dungeon !DM
    .mob 赤脊山蛮兵
    .mob 赤脊山秘法师
    .mob 赤脊山猛击者

step << Rogue
    #xprate >1.59
    .dungeon !DM
    .goto 1433,51.846,45.116,100 >> 前往奥瑟尔伐木场

step << Rogue
    #xprate >1.59
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_必须完成此步骤，才能进行后续的|r |T132290:0|t[毒药] |cRXP_WARN_任务|r
    >>|cRXP_WARN_站在路径点位置，调整镜头和鼠标，使你无需再移动镜头或鼠标即可点击3个 |r|cRXP_PICK_练习用保险箱|r
    .skill lockpicking,80 >>|cRXP_WARN_打开奥瑟尔伐木场地上的 |r|cRXP_PICK_练习用保险箱|r|cRXP_WARN_，直到你的|r |T136058:0|t[开锁] 技能达到80点
    .dungeon !DM

step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,52.05,44.69
    >>打开 |cRXP_PICK_卢修斯的箱子|r, 获取 |cRXP_LOOT_偷窃技能证明物|r
    .complete 2282,1 --Token of Thievery (1)
    .dungeon !DM

step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,39.6,33.2
    .goto Redridge Mountains,38.2,35.7,0
    .goto Redridge Mountains,35.2,37.8,0
    .goto Redridge Mountains,31.9,39.5,0
    .goto Redridge Mountains,28.5,38.7,0
    .goto Redridge Mountains,25.1,37.7,0
    >>完成击杀 |cRXP_WARN_豺狼人|r 以获取桥部件
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .isOnQuest 89
    .dungeon !DM
    .mob 赤脊山蛮兵
    .mob 赤脊山秘法师
    .mob 赤脊山猛击者

step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,32.2,48.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_工头奥斯洛|r
    .turnin 89 >> 交任务 止水湖上的桥
    .isQuestComplete 89
    .target 工头奥斯洛
    .dungeon !DM

step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2282 >> 交任务 奥瑟尔伐木场
    .target 卢修斯
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith DefiasWestfall2
    .destroy 7907 >> 从背包中删除 |T134328:0|t[偷窃技能认证书]，它已不再需要
    .dungeon !DM

step << Rogue
    #xprate >1.59
    .xp 21+14325 >> 离开赤脊山前，确保已积累至少14k经验（当前为21级）。若还未达到，可考虑完成 |cRXP_ENEMY_希拉里的项链|r（由 |cRXP_FRIENDLY_肖恩|r 提供），或 |cRXP_ENEMY_丢失的工具|r（由 |cRXP_FRIENDLY_工头奥斯洛|r 提供）
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
    .fp Redridge Mountains >> 获取赤脊山飞行点 << !Human
    .fly Westfall >> 飞往西部荒野
    .target 艾蕾娜·斯托姆法瑟
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #label DefiasWestfall2
    .goto Westfall,56.325,47.519
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 132 >> 交任务 迪菲亚兄弟会
    .accept 135 >> 接任务 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith KlavenFinish
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon !DM

step << !Dwarf Rogue
    #xprate >1.59
    .goto Duskwood,15.90,72.10,60,0
    .goto Duskwood,14.86,64.56,50,0
    .goto Duskwood,10.43,53.97
    >>击杀 |cRXP_ENEMY_小型结网毒蜘蛛|r 和 |cRXP_ENEMY_结网毒蜘蛛|r, 搜刮 |cRXP_LOOT_小毒囊|r 和 |cRXP_LOOT_粘糊的蜘蛛腿|r
    >>|cRXP_WARN_需要一个 |r|cRXP_LOOT_小毒囊|r|cRXP_WARN_ 来制作|r |T134437:0|t[抗毒药剂] |cRXP_WARN_，稍后用来移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_减益效果|r
    >>|cRXP_WARN_保留 |r|cRXP_LOOT_粘糊的蜘蛛腿|r|cRXP_WARN_，后续会用到|r
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可以跳过此步骤，之后请他们帮你移除减益效果|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob 小型结网毒蜘蛛
    .mob 结网毒蜘蛛
    .itemcount 6452,<1 --Anti Venom (<1)
    .isQuestAvailable 2359
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==请注意即将出现的章节==|r
    >>|cRXP_WARN_按 Esc 键, 进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选 "启用互动按键", 并将 "与目标互动" 选项绑定至一个快捷键|r
    >>|cRXP_WARN_另外, 建议开启"显示敌方姓名板" (默认快捷键: V), 这样你就能隔墙看到塔内转角处的敌人了|r
    .dungeon !DM

step << Rogue
    #xprate >1.59
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_密探吉尔妮|r
    >>|cRXP_WARN_必须完成此任务来学习|r |T132290:0|t[毒药]
    .turnin 2360 >> 交任务 马迪亚斯和迪菲亚潜行者
    .accept 2359 >> 接任务 克拉文之塔
    .target 密探吉尔妮
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #label TowerKey
    #loop
    .goto Westfall,71.49,73.49,0
    .goto Westfall,71.01,75.72,0
    .goto Westfall,69.58,73.07,0
    .goto Westfall,71.49,73.49,30,0
    .goto Westfall,71.01,75.72,30,0
    .goto Westfall,69.58,73.07,30,0
    >>|T133644:0|t[搜索] |cRXP_ENEMY_丑陋的迪菲亚懒汉|r，从它身上偷取 |cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    >>|cRXP_ENEMY_丑陋的迪菲亚懒汉|r|cRXP_WARN_会在塔楼入口刷新，随后沿塔楼外侧巡逻|r
    >>|cRXP_WARN_小心，他的伤害很高。如果|r |T132320:0|t[潜行] |cRXP_WARN_被打破，立刻使用|r |T132307:0|t[疾跑] |cRXP_WARN_逃离|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频演示
    .mob 丑陋的迪菲亚懒汉
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith Mortwake
    +|cRXP_WARN_为此任务装备|r |T135641:0|t[曲木匕首] |cRXP_WARN_，除非你已经装备了|r |T135641:0|t[匕首]
    .use 15396
    .itemcount 15396,1
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔楼从上往下第2层。在|r |T132320:0|t[潜行] |cRXP_WARN_状态下，趁 |r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_ 不在你身旁时，先跳上椅子，再跳到灯上，最后跳到路径点上方的书架上|r
    >>|cRXP_WARN_手动|r |T132320:0|t[取消潜行]|cRXP_WARN_，然后按下“与目标互动”快捷键来打开 |r|cRXP_PICK_暮色森林的箱子|r|cRXP_WARN_，拾取|r |cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_注意: 你的|r |T132320:0|t[潜行] |cRXP_WARN_在拾取后会暂时失效, 因为你拿到了|r |cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_如果没有击杀 |r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_（位于这一层），请做好逃跑准备。当你站在书架顶部时，它们很可能会持续对你保持仇恨（但不会攻击你），因为那里是一个能让怪物进入闪避状态的位置|r
    >>|cRXP_WARN_如果背包中或身上有|r |T135641:0|t[匕首] |cRXP_WARN_，可以施放|r |T132282:0|t[伏击] |cRXP_WARN_来瞬间击杀塔内的 |r|cRXP_ENEMY_迪菲亚巡塔员|r|cRXP_WARN_ 和 |r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_。击杀第一个 |r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_ 后做好逃跑准备，并记住你可能受到来自上方的攻击。这种方法较慢，但安全得多|r
    >>|cRXP_WARN_小心，如果你必须跑出塔楼，|r|cRXP_ENEMY_丑陋的迪菲亚懒汉|r|cRXP_WARN_ 和 |r|cRXP_ENEMY_迪菲亚苦工|r|cRXP_WARN_ 可能就在入口处|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频演示
    .mob 迪菲亚巡塔员
    .mob 迪菲亚哨兵
    .dungeon !DM

step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon !DM

step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包里的 |T134437:0|t[抗毒药剂] 来移除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .dungeon !DM

step << Dwarf Rogue
    #xprate >1.59
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石像形态] 来移除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .aura -9991
    .dungeon !DM

step << Rogue
    #xprate >1.59
    .dungeon !DM
    .xp 22-8200 >> 刷怪，直到还差8200经验升到22级。你需要在暴风城升到该等级并学习 |T132331:0|t[消失]，后续获取一个极强的符文时会用到。

step << Rogue
    #xprate >1.59
    #optional
    #completewith KlavenFinish
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索尔|r
    .fly Stormwind >> 飞往暴风城
    .target 索尔
    .dungeon !DM

step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >> 前往 |cRXP_FRIENDLY_珊娜·弗勒|r 处
    .aura -9991
    .dungeon !DM

step << !Dwarf Rogue
    #xprate >1.59
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊娜·弗勒|r
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可请他们帮你移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_，作为替代方法|r
    .skill firstaid,80 >> |cRXP_WARN_将你的|r |T135966:0|t[急救] |cRXP_WARN_提升到80点|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon !DM

step << !Dwarf Rogue
    #xprate >1.59
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊娜·弗勒|r
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可请他们帮你移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_，作为替代方法|r
    .train 7934 >> |cRXP_WARN_学习|r |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon !DM

step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon !DM

step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包里的 |T134437:0|t[抗毒药剂] 来移除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .dungeon !DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,10 >> 进入军情七处（SI:7）总部，沿楼梯上楼前往 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 处
    .dungeon !DM

step << Rogue
    #xprate >1.59 << !Hunter
    #label KlavenFinish
    .goto Stormwind City,75.78,59.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_马迪亚斯·肖尔|r
    >>|cRXP_WARN_如果之前换上了|r |T135641:0|t[匕首] |cRXP_WARN_，记得重新装备主武器|r << Rogue !sod
    .turnin 135 >> 交任务 迪菲亚兄弟会
    --  .accept 141 >> Accept The Defias Brotherhood
    .turnin 2359 >> 交任务 克拉文之塔
    .target 马迪亚斯·肖尔
    .dungeon !DM

step << Rogue
    #xprate >1.59
    .dungeon !DM
    .goto Stormwind City,78.2,58.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑一楼的 |cRXP_FRIENDLY_贾斯伯·菲尔|r 交谈
    >>从他那里购买制作 |T132273:0|t[|cRXP_FRIENDLY_速效毒药|r] 和施放 |T132331:0|t[|cRXP_FRIENDLY_消失|r] 所需的材料
    .collect 3371,20 --Empty Vial (20)
    .collect 2928,20 >>购买20份[蚀骨灰]
    .collect 5140,20 --Flash Powder (20)
    .target 贾斯伯·菲尔

step << Rogue
    #xprate >1.59
    .dungeon !DM
    >>打开法术书, 在通用选项卡中找到 |T136242:0|t[|cRXP_FRIENDLY_毒药|r] 技能. 打开该技能并制作 20 个速效毒药. |cRXP_WARN_记得在战斗中将它们施加到两把武器上|r
    .collect 6947,20 --Instant Poison (20)

step << Rogue
    #xprate >1.59
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_在接下来的步骤中, 请务必谨慎管理金钱. 只购买必要的法术. 完成湿地中的几个任务后, 你将需要 75 银币来获得一枚符文|r
    >>|cRXP_WARN_学习|r |T132331:0|t[消失] 和 |T132320:0|t[潜行] (等级 2), 很快需要用它们解锁 |T236270:0|t[致命毒酿]
    .train 1856 >> 学习 |T132331:0|t[消失]
    .train 1785 >> 学习 |T132320:0|t[潜行] (等级 2)
    .target 夜行者奥斯伯
    .dungeon !DM
    ----End of 2x Non-Deadmines Rogue Class q section----

step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .hs >> 使用炉石返回米奈希尔港。|cRXP_WARN_若炉石仍在冷却，可改用暴风城监狱的退队传送方法|r

step << Rogue
    #xprate >1.59
    .goto StormwindClassic,39.834,54.360
    >>|cRXP_WARN_进入副本: 暴风城监狱|r
    >>|cRXP_WARN_进入后:|r
    .link /run InviteUnit("aa");C_Timer.After(1,function() LeaveParty() end) >> |cRXP_WARN_点击此处将宏复制并粘贴到聊天框，以退队传送方式返回米奈希尔港|r
    .zone Wetlands >>|cRXP_WARN_若无法执行此操作，请自行返回米奈希尔港|r
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Ironforge
    .zoneskip Wetlands
    .cooldown item,6948,<0
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59
    #optional
    #completewith NEWarRogNoDMIFPP
    .goto 1453,60.972,11.690,30,0
    .goto 1453,65.933,5.771
    .subzone 2257 >>进入矿道地铁
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Ironforge
    .zoneskip Wetlands
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59
    #optional
    #label NEWarRogNoDMNoFP1
    #completewith NEWarRogNoDMIFPP
    >>|cRXP_WARN_在乘坐电车时, 如果需要, 可提升你的|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_技能|r
    .zone Ironforge >> 乘坐矿道地铁前往铁炉堡
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Wetlands
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59
    #optional
    #requires NEWarRogNoDMNoFP1
    #label NEWarRogNoDMNoFP2
    #completewith NEWarRogNoDMIFPP
    .goto 1455,67.842,42.456
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_考格斯宾|r
    .vendor 5175 >> |cRXP_BUY_购买|r |T133024:0|t[青铜管] |cRXP_BUY_，有货时向他购买|r
    --    >>You will need 2 bronze tubes for a quest later << Rogue
    .target 考格斯宾
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Wetlands
    .bronzetube
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59
    #label NEWarRogNoDMIFPP
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fp Ironforge >> 获取铁炉堡飞行点
    .target 格莱斯·瑟登
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Wetlands
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|r|cRXP_LOOT_《深渊之神》|r|cRXP_WARN_] 来开始任务|r
    .accept 968 >> 接任务 深渊之神
    .use 5352
    .itemcount 5352,1
    .zoneskip Ironforge,1
    .zoneskip Wetlands
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_葛利·硬骨|r
    .turnin 968 >> 交任务 深渊之神
    .target 葛利·硬骨
    .zoneskip Ironforge,1
    .zoneskip Wetlands
    .isOnQuest 968
    .dungeon !DM
    ----End of 2x Non-Deadmines Training/Class q section----
    ----Start of 2x Non-Deadmines (Darnassus) training section----

step << NightElf Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fly Menethil >> 飞往湿地
    .zoneskip Ironforge,1
    .cooldown item,6948,<0
    .dungeon !DM

step << NightElf Rogue
    #xprate >1.59
    #optional
    .zone Wetlands >> 前往米奈希尔港
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Darkshore
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .cooldown item,6948,<0
    .dungeon !DM
    ----End of 2x no DM Return to Darkshore Steps----
    ----End of 2x Non-Deadmines (Darnassus) training section----
    ----Start of Hunter Deadmines/All 2x Deadmines Section----

step
    #xprate >1.59 << !Hunter
    #optional
    #label DarnDMBoat
    .goto Darkshore,32.29,44.05
    >>|cRXP_WARN_现在准备出发去"死亡矿井"副本|r
    >>|cRXP_WARN_如有需要，在等候前往米奈希尔港的船时提升你的|r |T135966:0|t[急救] |cRXP_WARN_技能|r << Warrior/Paladin/Rogue
    .zone Wetlands >> 乘船前往 米奈希尔港
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step << !NightElf
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r
    .fly Ironforge >> 飞往铁炉堡
    .target 谢尔雷·布隆迪尔
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r
    .fp Menethil Harbor >> 获取米奈希尔港飞行点
    .target 谢尔雷·布隆迪尔
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto Wetlands,5.485,64.156,40 >> 从码头尽头跳进水里, 游向坐标点
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    .goto Wetlands,2.433,78.689,-1
    .goto Ironforge,17.089,83.373,-1
    .zone Ironforge >>使用角色卡死自助服务功能直接传送到铁炉堡。先在此处下线，再用另一角色打开帮助菜单（也可将下方的脱困链接粘贴到浏览器），向下滚动至自助服务，选择角色并点击“移动”。如果无法脱困，就跳过此步，沿山脉游泳前往西部荒野。
    .link https://www.youtube.com/watch?v=oVoxsr4zcg4 >> 点击这里查看视频参考
    .link https://us.battle.net/support/en/help/product/wow/197/834/solution >> 点击此处打开角色脱困自助服务链接
    .subzoneskip 809 --IF Gates
    .subzoneskip 2257 --Deeprun Tram
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
    .dungeon DM
    ----Start of Hunter/All Night Elves 2x Deadmines swim to Westfall Alternative section----

step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto 1415,44.720,49.200,60,0 -- Wetlands to Westfall Swim
    .goto 1415,43.162,49.946,60,0
    .goto 1415,42.564,50.884,20,0
    .goto 1415,42.363,50.812,20,0
    .goto 1415,41.682,50.232,20,0
    .goto 1415,40.959,50.142,20,0
    .goto 1415,39.818,51.078,20,0
    .goto 1415,39.778,51.615,30,0
    .goto 1415,39.505,52.636,30,0
    .goto 1415,40.160,54.451,20,0
    .goto 1415,40.505,54.507,20,0
    .goto 1415,41.370,57.126,40,0
    .goto 1415,41.988,59.434,30,0
    .goto 1415,41.342,61.214,30,0
    .goto 1415,41.309,61.938,20,0
    .goto 1415,40.545,64.111,30,0
    .goto 1415,41.066,65.878,20,0
    .goto 1415,41.349,66.265,30,0
    .goto 1415,41.363,66.995,30,0
    .goto 1415,41.625,67.689,30,0
    .goto StormwindClassic,4.493,29.157,20,0
    .goto StormwindClassic,10.336,40.166,10,0
    .goto StormwindClassic,7,45.471,10,0
    .goto StormwindClassic,5.560,50.125,10,0
    .goto StormwindClassic,13.669,74.499,20,0
    .goto Westfall,42.024,70.980
    .zone Westfall >> 如果网站脱困服务不可用，就游泳前往 西部荒野
    .zoneskip Ironforge
    .subzoneskip 809--IF Gates
    .subzoneskip 2257--Deeprun Tram
    .zoneskip Stormwind City
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto Westfall,54.28,9.26,100,0
    .goto Westfall,56.55,52.64,100 >> 上岸后前往哨兵岭
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索尔|r
    .fp Sentinel Hill >> 获取哨兵岭飞行点
    .target 索尔
    .zoneskip Ironforge --Skips if you didn't swim from Wetlands
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格里安·斯托曼|r
    .accept 65 >> 接任务 迪菲亚兄弟会
    .target 格里安·斯托曼
    .zoneskip Westfall,1
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Elwynn Forest,36.809,72.429,100,0
    .goto StormwindClassic,69.961,86.583
    .zone Stormwind City >> 跑步前往 暴风城
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .dungeon DM

step << NightElf Priest
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20,0
    .goto StormwindClassic,38.54,26.86,20 >> 前往暴风城大教堂内的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 处
    .zoneskip Stormwind City,1
    .dungeon DM

step << NightElf Priest
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .trainer >> 学习职业技能
    .target 高阶牧师劳瑞娜
    .zoneskip Stormwind City,1
    .dungeon DM
    --XX Alt if NE priest cant website unstuck
    ----End of Hunter/All Night Elves 2x Deadmines swim to Westfall Alternative (and Alt NE Priest Training) section----

step << NightElf Warrior/NightElf Hunter
    #xprate >1.59 << !Hunter
    #optional
    .goto Ironforge,61.177,89.508
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_布里维夫·石手|r
    .train 197 >> 学习双手斧（2h） << Warrior
    .train 199 >> 学习双手锤（2h） << Warrior
    .train 266 >> 学习枪械 << Hunter
    .target 布里维夫·石手
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step << NightElf Warrior
    #xprate >1.59
    #optional
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与 |cRXP_FRIENDLY_布雷文·寒钢|r 交谈
    >>|cRXP_BUY_从她那里购买|r |T135425:0|t[锋利的飞刀]
    .collect 3107,1 --Collect Keen Throwing Knife (200)
    .target 布雷文·寒钢
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step << NightElf Warrior
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fp Ironforge >> 获取铁炉堡飞行点
    .target 格莱斯·瑟登
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|r|cRXP_LOOT_《深渊之神》|r|cRXP_WARN_] 来开始任务|r
    .accept 968 >> 接任务 深渊之神
    .use 5352
    .itemcount 5352,1
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional << NightElf
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_葛利·硬骨|r
    .turnin 968 >> 交任务 深渊之神
    .target 葛利·硬骨
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isOnQuest 968
    .dungeon DM

step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .goto Ironforge,28.70,25.58,12,0
    .goto Ironforge,29.60,26.62,10,0
    .goto Ironforge,30.50,26.58,10,0
    .goto Ironforge,31.32,27.80,12 >>前往里面的 |cRXP_FRIENDLY_吉恩|r 处
    .dungeon DM

step << Mage
    #xprate >1.59
    .goto Ironforge,31.32,27.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_吉恩|r
    >>|cRXP_BUY_从她那里最多购买4个|r |T134419:0|t[传送符文]
    .collect 17031,4 --Rune of Teleportation (4)
    .target 吉恩
    .dungeon DM

step << Mage
    #xprate >1.59
    #label MilstaffDM
    .goto Ironforge,25.50,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_贝尔斯塔弗·风暴之眼|r
    .train 3562 >> 学习 |T135757:0|t[传送：铁炉堡]
    .target 贝尔斯塔弗·风暴之眼
    .dungeon DM

step << Mage
    #xprate >1.59
    .goto Ironforge,27.18,8.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丁克|r
    .trainer >> 学习职业技能
    .target 丁克
    .dungeon DM

step << Priest
    #xprate >1.59
    #optional << NightElf
    .goto Ironforge,25.207,10.756
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_托德雷·铁矿|r
    .trainer >> 学习职业技能
    .target 托德雷·铁矿
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step << skip --logout skip Mage/Priest
    #xprate >1.59
    #optional
    #requires MilstaffDM << Mage
    #completewith DeeprunDM
    .goto 1455,27.611,8.074
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳上 |r|cRXP_FRIENDLY_彬克|r|cRXP_WARN_ 上方的柱顶, 稍向东走到箭头位置, 调整角色直到看起来像在漂浮, 然后登出再登入执行登出跳过|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step << skip --Warlock
    #xprate >1.59
    .goto Ironforge,51.1,8.7,15,0
    .goto Ironforge,50.343,5.657
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布瑞尔索恩|r 交谈
    .trainer >> 学习职业技能
    .target 布瑞尔索恩
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step << skip --Warlock
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    .goto 1455,53.164,7.037,10 >> 进入 |cRXP_FRIENDLY_寻尸者祖贝尔|r 的房子
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall

step << skip --Warlock
    #xprate >1.59
    .goto Ironforge,52.701,6.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_寻尸者祖贝尔|r
    .vendor 6382 >> |cRXP_BUY_如有需要，为宠物购买|r |T133738:0|t[魔典]
    .target 寻尸者祖贝尔
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step << skip --Warlock
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    .goto 1455,52.825,5.060
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶, 然后跳到书架顶. 通过退出再重新登录完成登出跳过|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step << !Mage !Priest
    #xprate >1.59 << !Hunter
    #completewith DeeprunDM
    #optional
    .goto 1455,53.164,7.037,10 >> 进入 |cRXP_FRIENDLY_寻尸者祖贝尔|r 的房子
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestTurnedIn 968
    .dungeon DM

step << skip --logout skip !Mage !Priest
    #xprate >1.59 << !Hunter
    #completewith DeeprunDM
    #optional
    .goto 1455,52.825,5.060
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶, 然后跳到书架顶. 通过退出再重新登录完成登出跳过|r
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestTurnedIn 968
    .dungeon DM

step << skip --NightElf Hunter/NightElf Warrior
    #xprate >1.59 << !Hunter
    #optional
    #completewith DeeprunDM
    .goto 1455,60.975,90.479
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到箭头所示位置、|r|cRXP_FRIENDLY_布里维夫·石手|r|cRXP_WARN_旁的栏杆上。调整角色位置，直到看起来像悬空，然后退出并重新登录，执行登出跳点|r
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestAvailable 968
    .dungeon DM

step << skip --logout skip !Mage !Priest
    #xprate >1.59 << !Hunter
    #completewith DeeprunDM
    #optional
    .goto 1455,56.207,46.844
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到狮鹫的头部上方, 通过登出再重新登录执行小退跳过|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestAvailable 968
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional
    #requires MilstaffDM << Mage
    .goto 1455,67.842,42.456
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_考格斯宾|r
    .vendor 5175 >> |cRXP_BUY_购买|r |T133024:0|t[青铜管] |cRXP_BUY_，有货时向他购买|r
    --    >>You will need 2 bronze tubes for a quest later << Rogue
    .target 考格斯宾
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .subzoneskip 2257
    .bronzetube
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional
    #requires MilstaffDM << Mage
    #label DeeprunDM
    .goto Ironforge,78.00,51.40
    .subzone 2257 >>进入矿道地铁
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional << NightElf
    #completewith ShoniAccept
    >>|cRXP_WARN_在乘坐电车时, 如果需要, 可提升你的|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_你需要你的|r|T135966:0|t[急救]|cRXP_WARN_达到 80 以上, 才能做后面的任务|r << Rogue !Dwarf
    .zone Stormwind City >> 乘坐矿道地铁前往 暴风城
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Westfall
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_比利巴布·旋轮|r
    .vendor 5519 >> |cRXP_BUY_购买|r |T133024:0|t[青铜管] |cRXP_BUY_，有货时向他购买|r
    --    >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 比利巴布·旋轮
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #label ShoniAccept
    .goto StormwindClassic,55.510,12.504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_沉默的舒尼|r
    .accept 2040 >> 接任务 地底突袭
    .target 沉默的舒尼
    .dungeon DM

step << Human
    #xprate >1.59
    .goto StormwindClassic,58.08,16.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_弗伦·长须|r
    .turnin 1338 >> 交任务 卡尔·雷矛的订单
    .target 弗伦·长须
    .isOnQuest 1338
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .accept 167 >> 接任务 我的兄弟……
    .accept 168 >> 接任务 收集记忆
    .goto StormwindClassic,65.438,21.175
    .target 维尔德·蓟草
    .dungeon DM

step << Hunter
    --   #xprate >1.59
    #sticky
    #label DMPetTrain
    .goto 1453,61.576,15.998
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_卡瑞娜·麦肯达|r
    .trainer 2879 >> 学习宠物技能
    .target 卡瑞娜·麦肯达
    .dungeon DM

step << Hunter
    --   #xprate >1.59
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进去与 |cRXP_FRIENDLY_恩瑞斯·锐矛|r 交谈
    .trainer 5515 >> 学习职业技能
    .target 恩瑞斯·锐矛
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #requires DMPetTrain << Hunter
    .goto StormwindClassic,65.438,21.175
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_维尔德·蓟草|r
    .accept 167 >> 接任务 我的兄弟……
    .accept 168 >> 接任务 收集记忆
    .target 维尔德·蓟草
    .dungeon DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith RogueTrainDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_学习|r |T132282:0|t[伏击] |cRXP_WARN_，前提是你有余钱，并已装备或在背包中备有|r |T135641:0|t[匕首] |cRXP_WARN_。这能为后续步骤节省时间|r
    .train 8676 >> 学习 |T132282:0|t[伏击]
    .target 夜行者奥斯伯
    .dungeon DM

step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保学习|r |T132320:0|t[潜行]|cRXP_WARN_、|r |T133644:0|t[搜索]|cRXP_WARN_和|r |T136058:0|t[开锁] |cRXP_WARN_，后续会用到这些技能|r
    .train 1784 >>学习 |T132320:0|t[潜行]
    .train 921 >>训练 |T133644:0|t[搜索]
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .dungeon DM
    .train 1784,1
    .train 921,1

step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保学习|r |T133644:0|t[搜索]|cRXP_WARN_和|r |T136058:0|t[开锁] |cRXP_WARN_，后续会用到这些技能|r
    .train 921 >>训练 |T133644:0|t[搜索]
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .dungeon DM
    .train 921,1

step << Rogue
    #xprate >1.59
    #label RogueTrainDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保学习|r |T136058:0|t[开锁] |cRXP_WARN_，后续会用到|r
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .dungeon DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.799,53.815,15,0
    .goto 1453,77.290,58.138,12,0
    .goto 1453,78.466,60.034,12,0
    .goto 1453,78.560,58.435,6,0
    .goto 1453,75.754,60.369,12 >> 前往军情七处 (SI:7) 楼上找 |cRXP_FRIENDLY_“剃刀”雷吉克|r 和 |cRXP_FRIENDLY_马迪亚斯·肖尔|r
    .dungeon DM

step << Rogue
    #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_“剃刀”雷吉克|r 和 |cRXP_FRIENDLY_马迪亚斯·肖尔|r
    .accept 2281 >> 接任务 赤脊山的联络员
    .goto StormwindClassic,75.76,60.35
    .target +“剃刀”雷吉克
    .accept 2360 >> 接任务 马迪亚斯和迪菲亚潜行者
    .goto StormwindClassic,75.78,59.84
    .target +马迪亚斯·肖尔
    .dungeon DM

step << Warrior
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >> 前往旧城区指挥中心内的 |cRXP_FRIENDLY_武神|r 处
    .dungeon DM

step << Warrior
    #xprate >1.59
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与 |cRXP_FRIENDLY_武神|r 交谈
    .trainer >> 学习职业技能
    .target 武神
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吴平|r 对话
    .train 201 >> 学习单手剑（1h） << Mage/Rogue/Warlock
    .train 1180 >> 学习匕首技能 << Mage/Druid/Priest
    .train 202 >> 学习双手剑（2h） << Warrior/Paladin/Hunter
    .target 吴平
    .dungeon DM

step << NightElf Warrior
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r |T135329:0|t[刽子手之剑]
    .use 4818
    .itemcount 4818,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon DM

step << Rogue
    #xprate >1.59
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_玛尔达·维勒|r
    >>|cRXP_BUY_从她那里购买|r |T135324:0|t[长剑] |cRXP_BUY_，或在拍卖行寻找更好／更便宜的替代品|r
    .collect 923,1 --Longsword (1)
    .target 玛尔达·维勒
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
    .dungeon DM

step << Rogue
    #xprate >1.59
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_玛尔达·维勒|r
    >>|cRXP_WARN_从她那里购买|r |T135324:0|t[长剑] |cRXP_BUY_，前提是你负担得起|r
    .collect 923,1 --Longsword (1)
    .target 玛尔达·维勒
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
    .dungeon DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM

step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,42.917,34.221,15,0
    .goto 1453,41.385,31.547,15,0
    .goto 1453,39.810,29.788,15
    .goto StormwindClassic,42.51,33.51,20 >> 前往暴风城大教堂内的 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 处
    .dungeon DM

step << Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 交谈. 他会给你一本 |T133739:0|t[|cRXP_LOOT_勇气之书|r]
    .use 6776 >>|cRXP_WARN_使用 |T133739:0|t[|r|cRXP_LOOT_勇气之书|r|cRXP_WARN_] 来开始任务|r
    .collect 6776,1,1649 --Tome of Valor (1)
    .accept 1649 >>接任务 勇气之书
    .target 达索瑞恩·拉尔
    .dungeon DM

step << Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin 1649 >>交任务 勇气之书
    .accept 1650 >>接任务 勇气之书
    .target 达索瑞恩·拉尔
    .dungeon DM

step << Paladin
    #xprate >1.59
    .goto StormwindClassic,38.58,32.00,12,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_虔诚的亚瑟|r
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
    .dungeon DM

step << Paladin
    #xprate >1.59
    .goto StormwindClassic,21.40,55.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_阿古斯·夜语|r
    .accept 3765 >> 接任务 遥远的旅途
    .target 阿古斯·夜语
    .dungeon DM

step << Paladin/Warrior
    #xprate >1.59
    #ah
    #optional
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_玛尔达·维勒|r
    >>|cRXP_BUY_从她那里购买|r |T135280:0|t[微光重剑] |cRXP_BUY_，或在拍卖行寻找更好／更便宜的替代品|r
    .collect 922,1,2040,1 --Collect Dacian Falx (1)
    .target 玛尔达·维勒
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.0 --Arbitrary number lower than Falx/Exe
    .dungeon DM

step << Paladin/Warrior
    #xprate >1.59
    #optional
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .xp <21,1
    .dungeon DM

step << Warlock/Priest
    #xprate >1.59
    #ah
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_阿德温·凯伦|r
    .vendor 1312 >>|cRXP_BUY_从她那里购买|r |T135469:0|t[黄昏魔杖] |cRXP_BUY_，前提是你负担得起|r
    >>|cRXP_BUY_也可从拍卖行购买|r |T135144:0|t[强效魔法杖] |cRXP_BUY_，前提是价格低于52银47铜|r
    .collect 5211,1 --Dusk Wand (1)
    .disablecheckbox
    .target 阿德温·凯伦
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
    .dungeon DM

step << Warlock/Priest
    #xprate >1.59
    #ssf
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_阿德温·凯伦|r
    >>|cRXP_BUY_从她那里购买|r |T135469:0|t[黄昏魔杖]
    .collect 5211,1 --Dusk Wand (1)
    .target 阿德温·凯伦
    .money <0.5247
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
    .dungeon DM

step << Warlock/Priest
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r |T135469:0|t[黄昏魔杖]
    .use 5211
    .itemcount 5211,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .dungeon DM

step << Warlock/Priest
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r |T135144:0|t[强效魔法杖]
    .use 11288
    .itemcount 11288,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .dungeon DM

step << Warlock
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 进入“已宰的羔羊旅店”，下楼
    .dungeon DM

step << Warlock
    #xprate >1.59
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 对话
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
    .dungeon DM

step << Warlock
    #xprate >1.59
    #sticky
    #label Torment2DM
    .goto StormwindClassic,25.665,77.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_斯巴克尔|r
    .vendor >>|cRXP_BUY_从她那里购买|r |T133738:0|t[魔典：折磨（等级 2）]
    .target 斯巴克尔
    .itemcount 16346,<1 --Grimoire of Torment (<1)
    .train 20317,1
    .dungeon DM

step << Warlock
    #xprate >1.59
    #sticky
    #label Torment2DMEnd
    #requires Torment2DM
    .train 20317 >>|cRXP_WARN_使用|r |T133738:0|t[魔典：折磨（等级 2）]
    .target 斯巴克尔
    .use 16346
    .itemcount 16346,1 --Grimoire of Torment (<1)
    .train 20317,1
    .dungeon DM

step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,38.589,81.879,20,0
    .goto 1453,37.278,81.918,12,0
    .goto 1453,36.715,80.265,12,0
    .goto 1453,37.267,78.871,12,0
    .goto 1453,38.051,78.664,12,0
    .goto 1453,38.562,79.269,12,0
    .goto 1453,38.324,80.965,12,0
    .goto 1453,37.550,81.405,8,0
    .goto 1453,38.035,81.729,6,0
    .goto 1453,37.550,82.500,10,0
    >>登上法师塔, 通过绿色传送门
    .goto Stormwind City,39.681,79.538,15 >>前往 |cRXP_FRIENDLY_拉瑞麦尼·普尔度|r 处
    .dungeon DM

step << Mage
    #xprate >1.59
    .goto Stormwind City,39.681,79.538
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拉瑞麦尼·普尔度|r
    .train 3561 >> 学习 |T135763:0|t[传送：暴风城]
    .target 拉瑞麦尼·普尔度
    .dungeon DM

step << !Paladin
    #xprate >1.59
    .goto StormwindClassic,21.40,55.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_阿古斯·夜语|r
    .accept 3765 >> 接任务 遥远的旅途
    .target 阿古斯·夜语
    .dungeon DM

step << Druid
    #xprate >1.59
    .goto 1453,20.883,55.505
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_沙德拉斯·月树|r
    .train 6756 >> 学习职业技能
    .target 沙德拉斯·月树
    .dungeon DM

step << Hunter
    --  #xprate >1.59
    #optional
    #completewith next
    .goto 1453,50.929,57.781,10 >>进入贸易区中环的"空箭袋"武器店
    .dungeon DM

step << Hunter
    --  #xprate >1.59
    #ssf
    .goto 1453,49.962,57.638
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_弗德瑞克·斯图瓦|r
    >>|cRXP_BUY_从他那里购买|r |T135489:0|t[重型弯弓] |cRXP_BUY_和|r |T134410:0|t[中型箭袋]
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .collect 11362,1 -- Medium Quiver (1)
    .target 弗德瑞克·斯图瓦
    .money <0.7349
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
    .dungeon DM

step << Hunter
    --  #xprate >1.59
    #ah
    .goto 1453,49.962,57.638
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_弗德瑞克·斯图瓦|r
    >>|cRXP_BUY_从他那里购买|r |T135489:0|t[重型弯弓] |cRXP_BUY_和|r |T134410:0|t[中型箭袋] |cRXP_BUY_，或在拍卖行寻找更好／更便宜的替代品|r
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .collect 11362,1 -- Medium Quiver (1)
    .target 弗德瑞克·斯图瓦
    .money <0.7349
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
    .dungeon DM

step
    #xprate >1.59
    #ah
    #softcore
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拍卖师亚克森|r
    >>购买 |T134437:0|t[抗毒药剂]，用于稍后的 |T132290:0|t[毒药] 任务；其余物品用于稍后在赤脊山快速交任务 << !Dwarf Rogue
    >>购买以下物品，以便稍后在赤脊山和西部荒野快速交任务 << Paladin
    >>购买以下物品，以便稍后在赤脊山快速交任务 << !Paladin !Rogue/Dwarf Rogue
    >>这将节省时间, 因为无需到处寻找怪物击杀. 如果不想购买任何物品, 请跳过此步骤
    >>|T134437:0|t[抗毒药剂] << !Dwarf Rogue
    >>|T132794:0|t[灯油] << Paladin
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    .collect 814,5,103,1 << Paladin -- Flask of Oil (5)
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target 拍卖师亚克森
    .dungeon DM

step
    #xprate >1.59
    #ah
    #hardcore
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拍卖师亚克森|r
    >>购买 |T134437:0|t[抗毒药剂]，用于稍后的 |T132290:0|t[毒药] 任务；其余物品用于稍后在赤脊山和西部荒野快速交任务 << !Dwarf Rogue
    >>购买以下物品，以便稍后在赤脊山和西部荒野快速交任务 << !Rogue/Dwarf Rogue
    >>这将节省时间, 因为无需到处寻找怪物击杀. 如果不想购买任何物品, 请跳过此步骤
    >>|T134437:0|t[抗毒药剂] << !Dwarf Rogue
    >>|T132794:0|t[灯油]
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    .collect 814,5,103,1 -- Flask of Oil (5)
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target 拍卖师亚克森
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #completewith GryanAll << Human
    #optional << Human
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fp Stormwind >> 获取暴风城飞行点 << !Human
    .fly Westfall >> 飞往西部荒野 << Human
    .target 杜加尔·朗德瑞克
    .zoneskip Westfall << Human
    .dungeon DM

step << !Human
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .zone Westfall >> 前往: 西部荒野
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #label GryanAll << Human
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格里安·斯托曼|r
    .accept 65 >> 接任务 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional << Human/Warlock
    #requires Torment2DMEnd << Warlock
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索尔|r
    .fp Sentinel Hill >> 获取哨兵岭飞行点 << !Human
    .fly Redridge >> 飞往赤脊山 << Human/Warlock
    .target 索尔
    .zoneskip Westfall,1
    .dungeon DM

step << Human
    #xprate >1.59
    #optional
    #completewith WileyStart
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Redridge >> 飞往赤脊山
    .target 杜加尔·朗德瑞克
    .zoneskip Stormwind City,1
    .dungeon DM
    .isOnQuest 65

step << !Human !Warlock
    #xprate >1.59 << !Hunter
    .goto Elwynn Forest,65.20,69.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话阿祖拉之塔顶的 |cRXP_FRIENDLY_塞欧克瑞图斯|r
    .accept 94 >> 接任务 法师的眼线
    .target 塞欧克瑞图斯
    .dungeon DM

step << !Human !Warlock
    #xprate >1.59 << !Hunter
    #optional
    #completewith WileyStart
    .goto Redridge Mountains,15.27,71.45
    .zone Redridge Mountains >> 前往: 赤脊山
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional
    .goto Redridge Mountains,22.67,43.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_厨师布雷纳|r
    .accept 92 >> 接任务 赤脊山炖肉
    .turnin 92 >> 交任务 赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target 厨师布雷纳
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #label WileyStart
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话楼上的 |cRXP_FRIENDLY_黑衣威利|r
    .turnin 65 >> 交任务 迪菲亚兄弟会
    .accept 132 >> 接任务 迪菲亚兄弟会
    .target 黑衣威利
    .dungeon DM

step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2281 >> 交任务 赤脊山的联络员
    .accept 2282 >> 接任务 奥瑟尔伐木场
    .target 卢修斯
    .dungeon DM

step << Rogue
    #xprate >1.59
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_必须完成此步骤，才能进行后续的|r |T132290:0|t[毒药] |cRXP_WARN_任务|r
    >>|cRXP_WARN_站在路径点位置，调整镜头和鼠标，使你无需再移动镜头或鼠标即可点击3个 |r|cRXP_PICK_练习用保险箱|r
    .skill lockpicking,80 >>|cRXP_WARN_打开奥瑟尔伐木场地上的 |r|cRXP_PICK_练习用保险箱|r|cRXP_WARN_，直到你的|r |T136058:0|t[开锁] 技能达到80点
    .dungeon DM

step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,52.05,44.69
    >>打开 |cRXP_PICK_卢修斯的箱子|r, 获取 |cRXP_LOOT_偷窃技能证明物|r
    .complete 2282,1 --Token of Thievery (1)
    .dungeon DM

step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2282 >> 交任务 奥瑟尔伐木场
    .target 卢修斯
    .dungeon DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith DefiasWestfall2
    .destroy 7907 >> 从背包中删除 |T134328:0|t[偷窃技能认证书]，它已不再需要
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional << Human/Warlock
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
    .fp Redridge Mountains >> 获取赤脊山飞行点 << !Human !Warlock
    .fly Westfall >> 飞往西部荒野
    .target 艾蕾娜·斯托姆法瑟
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #label DefiasWestfall2
    .goto Westfall,56.325,47.519
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 132 >> 交任务 迪菲亚兄弟会
    .accept 135 >> 接任务 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith KlavenFinish
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM

step << !Dwarf Rogue
    #xprate >1.59
    .goto Duskwood,15.90,72.10,60,0
    .goto Duskwood,14.86,64.56,50,0
    .goto Duskwood,10.43,53.97
    >>击杀 |cRXP_ENEMY_小型结网毒蜘蛛|r 和 |cRXP_ENEMY_结网毒蜘蛛|r, 搜刮 |cRXP_LOOT_小毒囊|r 和 |cRXP_LOOT_粘糊的蜘蛛腿|r
    >>|cRXP_WARN_需要一个 |r|cRXP_LOOT_小毒囊|r|cRXP_WARN_ 来制作|r |T134437:0|t[抗毒药剂] |cRXP_WARN_，稍后用来移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_减益效果|r
    >>|cRXP_WARN_保留 |r|cRXP_LOOT_粘糊的蜘蛛腿|r|cRXP_WARN_，后续会用到|r
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可以跳过此步骤，之后请他们帮你移除减益效果|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob 小型结网毒蜘蛛
    .mob 结网毒蜘蛛
    .itemcount 6452,<1 --Anti Venom (<1)
    .isQuestAvailable 2359
    .dungeon DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==请注意即将出现的章节==|r
    >>|cRXP_WARN_按 Esc 键, 进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选 "启用互动按键", 并将 "与目标互动" 选项绑定至一个快捷键|r
    >>|cRXP_WARN_另外, 建议开启"显示敌方姓名板" (默认快捷键: V), 这样你就能隔墙看到塔内转角处的敌人了|r
    .dungeon DM

step << Rogue
    #xprate >1.59
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_密探吉尔妮|r
    >>|cRXP_WARN_必须完成此任务来学习|r |T132290:0|t[毒药]
    .turnin 2360 >> 交任务 马迪亚斯和迪菲亚潜行者
    .accept 2359 >> 接任务 克拉文之塔
    .target 密探吉尔妮
    .dungeon DM

step << Rogue
    #xprate >1.59
    #label TowerKey
    #loop
    .goto Westfall,71.49,73.49,0
    .goto Westfall,71.01,75.72,0
    .goto Westfall,69.58,73.07,0
    .goto Westfall,71.49,73.49,30,0
    .goto Westfall,71.01,75.72,30,0
    .goto Westfall,69.58,73.07,30,0
    >>|T133644:0|t[搜索] |cRXP_ENEMY_丑陋的迪菲亚懒汉|r，从它身上偷取 |cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    >>|cRXP_ENEMY_丑陋的迪菲亚懒汉|r|cRXP_WARN_会在塔楼入口刷新，随后沿塔楼外侧巡逻|r
    >>|cRXP_WARN_小心，他的伤害很高。如果|r |T132320:0|t[潜行] |cRXP_WARN_被打破，立刻使用|r |T132307:0|t[疾跑] |cRXP_WARN_逃离|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频演示
    .mob 丑陋的迪菲亚懒汉
    .dungeon DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith Mortwake
    +|cRXP_WARN_为此任务装备|r |T135641:0|t[曲木匕首] |cRXP_WARN_，除非你已经装备了|r |T135641:0|t[匕首]
    .use 15396
    .itemcount 15396,1
    .dungeon DM

step << Rogue
    #xprate >1.59
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔楼从上往下第2层。在|r |T132320:0|t[潜行] |cRXP_WARN_状态下，趁 |r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_ 不在你身旁时，先跳上椅子，再跳到灯上，最后跳到路径点上方的书架上|r
    >>|cRXP_WARN_手动|r |T132320:0|t[取消潜行]|cRXP_WARN_，然后按下“与目标互动”快捷键来打开 |r|cRXP_PICK_暮色森林的箱子|r|cRXP_WARN_，拾取|r |cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_注意: 你的|r |T132320:0|t[潜行] |cRXP_WARN_在拾取后会暂时失效, 因为你拿到了|r |cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_如果没有击杀 |r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_（位于这一层），请做好逃跑准备。当你站在书架顶部时，它们很可能会持续对你保持仇恨（但不会攻击你），因为那里是一个能让怪物进入闪避状态的位置|r
    >>|cRXP_WARN_如果背包中或身上有|r |T135641:0|t[匕首] |cRXP_WARN_，可以施放|r |T132282:0|t[伏击] |cRXP_WARN_来瞬间击杀塔内的 |r|cRXP_ENEMY_迪菲亚巡塔员|r|cRXP_WARN_ 和 |r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_。击杀第一个 |r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_ 后做好逃跑准备，并记住你可能受到来自上方的攻击。这种方法较慢，但安全得多|r
    >>|cRXP_WARN_小心，如果你必须跑出塔楼，|r|cRXP_ENEMY_丑陋的迪菲亚懒汉|r|cRXP_WARN_ 和 |r|cRXP_ENEMY_迪菲亚苦工|r|cRXP_WARN_ 可能就在入口处|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频演示
    .mob 迪菲亚巡塔员
    .mob 迪菲亚哨兵
    .dungeon DM

step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon DM

step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包里的 |T134437:0|t[抗毒药剂] 来移除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .dungeon DM

step << Dwarf Rogue
    #xprate >1.59
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石像形态] 来移除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .aura -9991
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional
    #completewith KlavenFinish
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索尔|r
    .fly Stormwind >> 飞往暴风城
    .target 索尔
    .dungeon DM

step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >> 前往 |cRXP_FRIENDLY_珊娜·弗勒|r 处
    .aura -9991
    .dungeon DM

step << !Dwarf Rogue
    #xprate >1.59
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊娜·弗勒|r
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可请他们帮你移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_，作为替代方法|r
    .skill firstaid,80 >> |cRXP_WARN_将你的|r |T135966:0|t[急救] |cRXP_WARN_提升到80点|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon DM

step << !Dwarf Rogue
    #xprate >1.59
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊娜·弗勒|r
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可请他们帮你移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_，作为替代方法|r
    .train 7934 >> |cRXP_WARN_学习|r |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon DM

step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon DM

step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包里的 |T134437:0|t[抗毒药剂] 来移除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .dungeon DM

step
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,10 >> 进入军情七处（SI:7）总部，沿楼梯上楼前往 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 处
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #label KlavenFinish
    .goto Stormwind City,75.78,59.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_马迪亚斯·肖尔|r
    >>|cRXP_WARN_如果之前换上了|r |T135641:0|t[匕首] |cRXP_WARN_，记得重新装备主武器|r << Rogue
    .turnin 135 >> 交任务 迪菲亚兄弟会
    .accept 141 >> 接任务 迪菲亚兄弟会
    .turnin 2359 >> 交任务 克拉文之塔 << Rogue
    .target 马迪亚斯·肖尔
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional
    #completewith BandanaStart
    +开始为死亡矿井组建队伍
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.325,47.519
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 141 >> 交任务 迪菲亚兄弟会
    .accept 142 >> 接任务 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon DM

step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto Westfall,44.50,69.62,55 >> 前往月溪镇
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto Westfall,44.50,69.62
    .line Westfall,44.50,69.62,44.50,69.62,45.08,69.40,45.21,69.35,45.63,68.69,45.85,67.73,45.62,66.99,45.52,65.71,45.61,64.95,44.28,63.88,44.26,62.80,43.60,59.89,43.37,58.42,43.26,57.01,43.12,54.24,42.15,52.74,41.74,51.42,41.48,49.89,40.91,48.71,38.93,46.05,38.51,45.46,37.85,45.54,36.60,44.21,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.26,43.77,36.87,42.87,36.95,40.85,37.04,39.79,37.91,36.98,39.06,35.58,40.48,34.31,41.27,32.87,41.76,31.27,42.26,30.26,43.20,28.99,44.29,28.19,44.64,26.85,44.57,24.94,44.64,26.85,44.29,28.19,43.20,28.99,42.26,30.26,41.76,31.27,41.27,32.87,40.48,34.31,39.06,35.58,37.91,36.98,37.04,39.79,36.95,40.85,36.87,42.87,36.26,43.77,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.60,44.21,37.85,45.54,38.51,45.46,38.93,46.05,40.91,48.71,41.48,49.89,41.74,51.42,42.15,52.74,43.12,54.24,43.26,57.01,43.37,58.42,43.60,59.89,44.26,62.80,44.28,63.88,45.61,64.95,45.52,65.71,45.62,66.99,45.85,67.73,45.63,68.69,45.21,69.35,45.08,69.40,44.50,69.62
    >>击杀 |cRXP_ENEMY_迪菲亚信使|r, 搜刮 |cRXP_LOOT_神秘的信件|r
    >>|cRXP_ENEMY_迪菲亚信使|r|cRXP_WARN_ 会在月溪镇生成. 他会沿着月溪镇以北的道路前往金海岸矿洞和詹戈洛德矿洞. 如果在路上没有看到他, 请等待他在月溪镇重新出现|r
    >>|cRXP_WARN_他的刷新时间大约是 4 到 5 分钟|r
    .complete 142,1 -- A Mysterious Message (1)
    .unitscan 迪菲亚信使
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 142 >> 交任务 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto Westfall,55.68,47.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_迪菲亚叛徒|r
    >>|cRXP_WARN_如果他不在, 你可能得等一下 |r|cRXP_FRIENDLY_迪菲亚叛徒|r|cRXP_WARN_ 刷新|r
    >>|cRXP_WARN_如果你已经组好队了, 确保所有队友都交了前一步任务后再开启护送|r
    .accept 155 >> 接任务 迪菲亚兄弟会
    .target 迪菲亚叛徒
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto Westfall,42.56,71.71
    >>护送 |cRXP_FRIENDLY_迪菲亚叛徒|r 前往死亡矿井
    >>|cRXP_WARN_始终待在|r|cRXP_FRIENDLY_迪菲亚叛徒|r|cRXP_WARN_身边。抵达月溪镇后，准备好对付|r|cRXP_ENEMY_迪菲亚抢劫者|r|cRXP_WARN_和|r|cRXP_ENEMY_迪菲亚强夺者|r
    .complete 155,1 -- Escort The Defias Traitor to discover where VanCleef is hiding (1)
    .target 迪菲亚叛徒
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 155 >> 交任务 迪菲亚兄弟会
    .accept 166 >> 接任务 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #label BandanaStart
    .goto Westfall,56.67,47.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话塔顶的 |cRXP_FRIENDLY_哨兵瑞尔|r
    .accept 214 >> 接任务 红色丝质面罩
    .target 哨兵瑞尔
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto 1436,56.454,69.982,0
    .goto 1436,56.434,74.339,0
    .goto 1436,59.384,74.184,0
    .goto 1436,60.871,74.362,0
    .goto 1436,60.902,77.640,0
    .goto 1436,63.442,77.339,0
    .goto 1436,65.203,75.286,0
    .goto 1436,63.594,72.862,0
    .goto 1436,63.825,70.125,0
    .goto 1436,42.649,71.376
    >>|cRXP_WARN_在哨兵岭南边刷 |r|cRXP_ENEMY_豺狼人|r|cRXP_WARN_，同时组建死亡矿井队伍|r
    .subzone 20 >>组好人后, 前往月溪镇
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto Westfall,42.55,71.69
    .subzone 1581 >> 和你的队伍一起进入迪菲亚藏身处
    .dungeon DM

step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith EnterDM
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon DM
    .xp <21,1

step << Rogue
    #xprate >1.59
    #optional
    #completewith EnterDM
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #completewith EnterDM
    >>击杀 |cRXP_ENEMY_迪菲亚|r, 搜刮 |cRXP_LOOT_红色丝质面罩|r
    >>|cRXP_WARN_这一部分也可以在死亡矿井副本里面做|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #completewith next
    >>击杀 |cRXP_ENEMY_骷髅矿工|r、|cRXP_ENEMY_亡灵爆破者|r 和 |cRXP_ENEMY_亡灵挖掘者|r, 搜刮 |cRXP_LOOT_矿业工会会员卡|r
    >>|cRXP_WARN_这一步要在副本外完成|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob 骷髅矿工
    .mob 亡灵爆破者
    .mob 亡灵挖掘者
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀 |cRXP_ENEMY_工头希斯耐特|r, 搜刮 |cRXP_LOOT_希斯耐特的徽章|r
    >>|cRXP_WARN_这一步要在副本外完成|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan 工头希斯耐特
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀 |cRXP_ENEMY_骷髅矿工|r、|cRXP_ENEMY_亡灵爆破者|r 和 |cRXP_ENEMY_亡灵挖掘者|r, 搜刮 |cRXP_LOOT_矿业工会会员卡|r
    >>|cRXP_WARN_这一步要在副本外完成|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob 骷髅矿工
    .mob 亡灵爆破者
    .mob 亡灵挖掘者
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #label EnterDM
    .goto 1415,40.94,79.76,25,0
    .goto 1415,40.86,79.62,20,0
    .goto 1415,40.678,79.578
    .subzone 1581,2 >> 进入"死亡矿井"副本
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #softcore
    #optional
    #completewith VanCleef << !Paladin
    #completewith DeadminesBackdoor << Paladin
    >>击杀死亡矿井内的 |cRXP_ENEMY_迪菲亚|r, 搜刮 |cRXP_LOOT_红色丝质面罩|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #hardcore
    #optional
    #completewith DeadminesBackdoor
    >>击杀死亡矿井内的 |cRXP_ENEMY_迪菲亚|r, 搜刮 |cRXP_LOOT_红色丝质面罩|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    >>击杀 |cRXP_ENEMY_斯尼德|r, 搜刮 |cRXP_LOOT_小型高能发动机|r
    .complete 2040,1 -- Gnoam Sprecklesprocket (1)
    .dungeon DM

step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith VanCleef
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon DM
    .xp <21,1

step << Rogue
    #xprate >1.59
    #optional
    #completewith VanCleef
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #label VanCleef
    >>击杀 |cRXP_ENEMY_艾德温·范克里夫|r, 搜刮 |cRXP_LOOT_头颅|r 和 |T133471:0|t[|cRXP_LOOT_未寄出的信|r]
    .collect 2874,1,373,1 -- An Unsent Letter (1)
    .complete 166,1 -- Head of VanCleef (1)
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #hardcore << !Paladin
    #optional
    #label DeadminesBackdoor
    #completewith DeadminesEnd
    .goto 1436,38.909,84.014
    >>|cRXP_WARN_如有可能，请队友留下来，稍后帮你完成圣骑士专属的 |r|cRXP_FRIENDLY_达芙妮·斯迪威尔|r|cRXP_WARN_ 护送任务|r << Paladin
    .subzone 920 >>从 |cRXP_ENEMY_艾德温·范克里夫|r 东侧的后门离开死亡矿井
    .dungeon DM

step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1436,39.444,85.755
    .goto 1436,40.010,86.514,20 >> 前往 |cRXP_FRIENDLY_达芙妮·斯迪威尔|r 的田地
    .dungeon DM

step << Paladin
    #xprate >1.59
    #loop
    .goto 1436,41.645,88.729,0
    .goto 1436,41.196,89.173,10,0
    .goto 1436,41.696,89.244,10,0
    .goto 1436,41.645,88.729,10,0
    .goto 1436,41.461,88.498,10,0
    .goto 1436,41.311,88.506,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话田地里的 |cRXP_FRIENDLY_达芙妮·斯迪威尔|r, 开始护送任务
    >>|cRXP_WARN_她会在田里附近小范围巡逻|r
    >>|cRXP_WARN_小心，这里有一定难度。共有3波敌人，数量依次为3个、4个、5个，均为17-18级的 |r|cRXP_ENEMY_迪菲亚袭击者|r
    .turnin 1650 >>交任务 勇气之书
    .accept 1651,1 >>接任务 勇气之书
    .link https://youtu.be/1-nnLcqIIlQ?si=kZi41eXT8ZQmSBY2&t=10 >> 点击此处查看视频演示
    .target 达芙妮·斯迪威尔
    .dungeon DM

step << Paladin
    #xprate >1.59
    .goto 1436,41.311,88.506
    >>保护 |cRXP_FRIENDLY_达芙妮·斯迪威尔|r
    >>|cRXP_WARN_如果你或 |r|cRXP_FRIENDLY_达芙妮·斯迪威尔|r|cRXP_WARN_ 挂了, 任务就失败了, 得重来|r
    >>|cRXP_WARN_小心，这里有一定难度。共有3波敌人，数量依次为3个、4个、5个，均为17-18级的 |r|cRXP_ENEMY_迪菲亚袭击者|r
    .complete 1651,1 --Protect Daphne Stilwell (1)
    .dungeon DM

step << Paladin
    #xprate >1.59
    #loop
    .goto 1436,41.645,88.729,0
    .goto 1436,41.196,89.173,10,0
    .goto 1436,41.696,89.244,10,0
    .goto 1436,41.645,88.729,10,0
    .goto 1436,41.461,88.498,10,0
    .goto 1436,41.311,88.506,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_达芙妮·斯迪威尔|r
    >>|cRXP_WARN_她会在田里附近小范围巡逻|r
    .turnin 1651 >>交任务 勇气之书
    .accept 1652 >>接任务 勇气之书
    .target 达芙妮·斯迪威尔
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #hardcore << !Paladin
    #optional
    #completewith next
    .goto Westfall,30.01,86.02,40 >> 前往西部荒野灯塔
    .dungeon DM

step
    #xprate >1.59
    #ah
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_葛瑞森船长|r
    .accept 104 >> 接任务 海岸上的威胁
    .accept 103 >> 接任务 长明的灯塔
    .turnin 103 >> 交任务 长明的灯塔
    .target 葛瑞森船长
    .itemcount 814,5 -- Flask of Oil (5)
    .dungeon DM

step
    #xprate >1.59
    #ssf
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_葛瑞森船长|r
    .accept 104 >> 接任务 海岸上的威胁
    .target 葛瑞森船长
    .dungeon DM

step
    #xprate >1.59
    #ah
    #optional
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_葛瑞森船长|r
    .accept 104 >> 接任务 海岸上的威胁
    .target 葛瑞森船长
    .dungeon DM

step
    #xprate >1.59
    #hardcore << !Paladin
    .goto Westfall,34.43,83.93
    .line Westfall,34.43,83.93,34.43,83.93,33.88,83.32,33.08,82.86,32.56,82.71,32.08,82.49,31.91,82.36,31.55,81.88,30.86,81.42,30.63,81.16,30.33,80.81,30.02,80.11,29.68,79.22,29.32,78.19,29.29,77.60,29.27,77.31,29.18,76.26,29.07,75.29,28.95,74.14,28.85,73.29,28.79,72.48,28.37,71.94,27.84,71.29,27.44,70.25,27.29,69.47,27.13,68.65,27.09,67.57,27.07,67.01,26.74,66.09,27.07,67.01,27.09,67.57,27.13,68.65,27.29,69.47,27.44,70.25,27.84,71.29,28.37,71.94,28.79,72.48,28.85,73.29,28.95,74.14,29.07,75.29,29.18,76.26,29.27,77.31,29.29,77.60,29.32,78.19,29.68,79.22,30.02,80.11,30.33,80.81,30.63,81.16,30.86,81.42,31.55,81.88,31.91,82.36,32.08,82.49,32.56,82.71,33.08,82.86,33.88,83.32,34.43,83.93
    >>击杀 |cRXP_ENEMY_老瞎眼|r, 获取 |cRXP_LOOT_鳞片|r
    >>|cRXP_ENEMY_老瞎眼|r |cRXP_WARN_在长滩来回巡逻。如果找不到他，就跳过此步骤|r
    .complete 104,1 -- Scale of Old Murk-Eye (1)
    .unitscan 老瞎眼
    .dungeon DM

step
    #xprate >1.59
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_葛瑞森船长|r
    .turnin 104 >> 交任务 海岸上的威胁
    .target 葛瑞森船长
    .isQuestComplete 104
    .dungeon DM

step
    #xprate >1.59
    #optional
    #hardcore << !Paladin
    #completewith DeadminesEnd
    .abandon 103 >> 放弃任务 长明的灯塔
    .dungeon DM

step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto Westfall,42.55,71.69
    .subzone 1581 >> 独自进入迪菲亚藏身处
    .dungeon DM

step << Paladin
    #xprate >1.59
    .goto 1415,40.678,79.578
    >>击杀死亡矿井副本外的 |cRXP_ENEMY_迪菲亚|r, 搜刮 |cRXP_LOOT_红色丝质面罩|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM

step << !Paladin
    #xprate >1.59 << !Hunter
    >>击杀死亡矿井内的 |cRXP_ENEMY_迪菲亚|r, 搜刮 |cRXP_LOOT_红色丝质面罩|r
    >>|cRXP_WARN_如果死亡矿井内已经没有 |r|cRXP_ENEMY_迪菲亚|r|cRXP_WARN_，就改在副本外击杀|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #softcore
    #completewith DeadminesEnd
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
    .dungeon DM

step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith DeadminesEnd
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon DM
    .xp <21,1

step << Rogue
    #xprate >1.59
    #optional
    #completewith DeadminesEnd
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #label DeadminesEnd
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 166 >> 交任务 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.67,47.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话塔顶的 |cRXP_FRIENDLY_哨兵瑞尔|r
    .turnin 214 >> 交任务 红色丝质面罩
    .target 哨兵瑞尔
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional
    #sticky
    #label LetterLater
    .abandon 373 >> 放弃任务 未寄出的信。稍后会做这个任务
    .dungeon DM

step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .cast 3561 >>施放 |T135763:0|t[传送：暴风城]
    .zoneskip Stormwind City
    .dungeon DM

step << Mage
    #xprate >1.59
    #optional
    .goto 1453,36.863,81.132
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾尔莎林|r 对话
    .train 2138 >> 学习职业技能
    .target 艾尔莎林
    .xp <22,1
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #optional << Mage
    #completewith ShoniEnd
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索尔|r
    .fly Stormwind >> 飞往暴风城
    .zoneskip Stormwind City
    .target 索尔
    .dungeon DM

step << Warlock
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 进入“已宰的羔羊旅店”，下楼
    .xp <22,1
    .dungeon DM

step << Warlock
    #xprate >1.59
    #optional
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 对话
    .train 6202 >> 学习职业技能
    .target 厄苏拉·德林
    .xp <22,1
    .dungeon DM
    --XX Not adding one to check xp after turnins, waste of time to do that/take tram and train etc

step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,42.917,34.221,15,0
    .goto 1453,41.385,31.547,15,0
    .goto 1453,39.810,29.788,15
    .goto StormwindClassic,42.51,33.51,20 >> 前往暴风城大教堂内的 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 处
    .xp <22,1
    .dungeon DM

step << Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin 1652 >>交任务 勇气之书
    .accept 1653 >>接受任务 正义试炼
    .target 达索瑞恩·拉尔
    .xp <22,1
    .dungeon DM

step << Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,38.58,32.00,12,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_虔诚的亚瑟|r
    .train 19835 >> 学习职业技能
    .target 虔诚的亚瑟
    .xp <22,1
    .dungeon DM

step << Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20,0
    .goto StormwindClassic,38.54,26.86,20 >> 前往暴风城大教堂内的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 处
    .xp <22,1
    .dungeon DM

step << Priest
    #xprate >1.59
    #optional
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .train 8103 >> 学习职业技能
    .target 高阶牧师劳瑞娜
    .xp <22,1
    .dungeon DM

step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_夜行者奥斯伯|r
    .train 1856 >> 学习职业技能
    .target 夜行者奥斯伯
    .xp <22,1
    .dungeon DM

step << Warrior
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >> 前往旧城区指挥中心内的 |cRXP_FRIENDLY_武神|r 处
    .xp <22,1
    .dungeon DM

step << Warrior
    #xprate >1.59
    #optional
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与 |cRXP_FRIENDLY_武神|r 交谈
    .train 6192 >> 学习职业技能
    .target 武神
    .xp <22,1
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,65.438,21.175
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_维尔德·蓟草|r
    .turnin 167 >> 交任务 我的兄弟……
    .turnin 168 >> 交任务 收集记忆
    .target 维尔德·蓟草
    .dungeon DM

step << skip --Hunter - nothing good to train at 22
    #xprate >1.59
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进去与 |cRXP_FRIENDLY_恩瑞斯·锐矛|r 交谈
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛
    .xp <22,1
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #label ShoniEnd
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_沉默的舒尼|r
    .turnin 2040 >> 交任务 地底突袭
    .goto StormwindClassic,55.510,12.504
    .target 沉默的舒尼
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_比利巴布·旋轮|r
    .vendor 5519 >> |cRXP_BUY_购买|r |T133024:0|t[青铜管] |cRXP_BUY_，有货时向他购买|r
    --    >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 比利巴布·旋轮
    .dungeon DM

step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,42.917,34.221,15,0
    .goto 1453,41.385,31.547,15,0
    .goto 1453,39.810,29.788,15
    .goto StormwindClassic,42.51,33.51,20 >> 前往暴风城大教堂内的 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 处
    .dungeon DM

step << Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin 1652 >>交任务 勇气之书
    .accept 1653 >>接受任务 正义试炼
    .target 达索瑞恩·拉尔
    .dungeon DM

step << Paladin
    #xprate >1.59
    .goto StormwindClassic,38.58,32.00,12,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_虔诚的亚瑟|r
    .train 19835 >> 学习职业技能
    .target 虔诚的亚瑟
    .xp <22,1
    .dungeon DM

step << Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20,0
    .goto StormwindClassic,38.54,26.86,20 >> 前往暴风城大教堂内的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 处
    .xp <22,1
    .dungeon DM

step << Priest
    #xprate >1.59
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .train 8103 >> 学习职业技能
    .target 高阶牧师劳瑞娜
    .xp <22,1
    .dungeon DM

step << Rogue
    #xprate >1.59
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_夜行者奥斯伯|r
    .train 1856 >> 学习职业技能
    .target 夜行者奥斯伯
    .xp <22,1
    .dungeon DM

step << Warrior
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >> 前往旧城区指挥中心内的 |cRXP_FRIENDLY_武神|r 处
    .xp <22,1
    .dungeon DM

step << Warrior
    #xprate >1.59
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与 |cRXP_FRIENDLY_武神|r 交谈
    .train 6192 >> 学习职业技能
    .target 武神
    .xp <22,1
    .dungeon DM
    --XX No way to check if the user has the ironforge FP, if they don't, send them to the trainer there instead

step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .cast 3561 >>施放 |T135763:0|t[传送：暴风城]
    .dungeon DM

step << Mage
    #xprate >1.59
    #optional
    .goto 1453,36.863,81.132
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的 |cRXP_FRIENDLY_艾尔莎林|r 交谈
    .train 2138 >> 学习职业技能
    .target 艾尔莎林
    .xp <22,1
    .dungeon DM

step << Druid
    #xprate >1.59
    .dungeon !DM
    .xp <22,1
    #optional
    #completewith next
    .cast 18960 >> 施放传送:月光林地
    .zoneskip Moonglade

step << Druid
    #xprate >1.59
    #optional
    .dungeon !DM
    .goto Moonglade,52.53,40.57
    >>去月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .train 8926 >> 学习职业技能
    .target 洛甘纳尔
    .xp <22,1

step << Druid
    .dungeon !DM
    .xp <22,1
    .zoneskip Moonglade,1
    .cooldown item,6948,>2
    .hs >>炉石回奥伯丁

step << Druid
    .dungeon !DM
    .xp <22,1
    .zoneskip Moonglade,1
    .goto Moonglade,48.0,67.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_辛德拉尔|r 交谈
    .fly Auberdine >>炉石冷却时飞往奥伯丁
    .target 辛德拉尔

step << Druid
    .dungeon DM
    .xp <22,1
    .goto 1453,20.883,55.505
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沙德拉斯·月树|r 交谈
    .train 8926 >>学习22级职业技能
    .target 沙德拉斯·月树

step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #completewith NEIFFP
    .goto 1453,60.972,11.690,30,0
    .goto 1453,65.933,5.771
    .subzone 2257 >>进入矿道地铁
    .zoneskip Ironforge
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #label DeeprunDMNoFP1
    #completewith NEIFFP
    >>|cRXP_WARN_在乘坐电车时, 如果需要, 可提升你的|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_技能|r
    .zone Ironforge >> 乘坐矿道地铁前往铁炉堡
    .zoneskip Ironforge
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #requires DeeprunDMNoFP1
    #label DeeprunDMNoFP2
    #completewith NEIFFP
    .goto 1455,67.842,42.456
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_考格斯宾|r
    .vendor 5175 >> |cRXP_BUY_购买|r |T133024:0|t[青铜管] |cRXP_BUY_，有货时向他购买|r
    --    >>You will need 2 bronze tubes for a quest later << Rogue
    .target 考格斯宾
    .bronzetube
    .dungeon DM

step << NightElf Warrior/NightElf Hunter
    #xprate >1.59 << !Hunter
    #requires DeeprunDMNoFP2
    #label DeeprunDMNoFP3
    #completewith NEIFFP
    .goto Ironforge,61.177,89.508
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_布里维夫·石手|r
    .train 197 >> 学习双手斧（2h） << Warrior
    .train 199 >> 学习双手锤（2h） << Warrior
    .train 266 >> 学习枪械 << Hunter
    .target 布里维夫·石手
    .dungeon DM

step << NightElf Warrior
    #xprate >1.59
    #requires DeeprunDMNoFP3
    #label DeeprunDMNoFP4
    #completewith NEIFFP
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与 |cRXP_FRIENDLY_布雷文·寒钢|r 交谈
    >>|cRXP_BUY_购买|r |T135427:0|t[重型飞刀] |cRXP_BUY_（从她这里）|r
    .collect 3108,200 --Collect Heavy Throwing Knife (200)
    .target 布雷文·寒钢
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7
    .dungeon DM

step << NightElf Warrior
    #xprate >1.59
    #requires DeeprunDMNoFP4
    #label DeeprunDMNoFP5
    #completewith NEIFFP
    +|cRXP_WARN_装备|r |T135427:0|t[重型飞刀]
    .use 3108
    .itemcount 3108,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    #label NEIFFP
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fp Ironforge >> 获取铁炉堡飞行点
    .target 格莱斯·瑟登
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|r|cRXP_LOOT_《深渊之神》|r|cRXP_WARN_] 来开始任务|r
    .accept 968 >> 接任务 深渊之神
    .use 5352
    .itemcount 5352,1
    .zoneskip Ironforge,1
    .dungeon DM

step << NightElf
    #xprate >1.59 << !Hunter
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_葛利·硬骨|r
    .turnin 968 >> 交任务 深渊之神
    .target 葛利·硬骨
    .zoneskip Ironforge,1
    .isOnQuest 968
    .dungeon DM

step
    #xprate >1.59 << !Hunter
    #requires LetterLater
    #optional
    .cooldown item,6948,>2
    .hs >>炉石回米奈希尔港 << Rogue
    .hs >>炉石回奥伯丁 << !Rogue
    .zoneskip Darkshore << !Rogue
    .zoneskip Wetlands << Rogue
    .dungeon DM
    ----End of Hunter/All 2x Deadmines section----

step
    .dungeon DM
    .zoneskip Ironforge,1
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 交谈
    .fly Menethil >>炉石无法使用时，飞往米奈希尔港
    .target 格莱斯·瑟登

step
    .goto Darkshore,32.29,44.05
    .zone Wetlands >>乘船前往米奈希尔港，衔接湿地路线
]])
