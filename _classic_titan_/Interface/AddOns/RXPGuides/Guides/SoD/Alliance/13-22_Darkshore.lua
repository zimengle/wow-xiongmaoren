local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
#version 1
#season 2
<< NightElf
#group RestedXP 联盟 1-20
#name 13-20 黑海岸 赛季服
#displayname 13-20 Darkshore << NightElf SoD !Priest
#displayname 13-22 Darkshore << NightElf SoD Priest
#displayname 15-18 黑海岸 << !NightElf SoD
#next 20-22 黑海岸 赛季服 << !sod/Warrior/Rogue/Druid/Hunter
#next 22-24 RestedXP 联盟 20-30\\湿地 赛季服 << sod Priest

-- #displayname 11-16 黑海岸 << NightElf/Dwarf Hunter !SoD
-- #displayname 15-17 Darkshore << !NightElf !Dwarf/!Hunter !SoD
-- #displayname 13-18 Darkshore << Dwarf Hunter/!NightElf sod
step << NightElf
    .goto Teldrassil,56.25,92.44
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尼莎·影歌|r
    .turnin 6344 >>交任务: |cRXP_FRIENDLY_尼莎·影歌|r
    .accept 6341 >>接任务: |cRXP_LOOT_泰达希尔的渔业|r
    .target Nessa Shadowsong
step << NightElf
	.goto Teldrassil,58.39,94.01
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维斯派塔斯|r
    .turnin 6341 >>交任务: |cRXP_FRIENDLY_泰达希尔的渔业|r
    .accept 6342 >>接任务: |cRXP_LOOT_飞往奥伯丁|r
    .target Vesprystus
step << NightElf
    #completewith WashedA
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维斯派塔斯|r
    .fly Auberdine >>飞往黑海岸
    .target Vesprystus
step << NightElf
    #label WashedA
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_温尼斯·布莱葛|r
    .accept 3524 >>接任务: |cRXP_LOOT_搁浅的巨兽|r
    .target Gwennyth Bly'Leggonde
step << !NightElf
    #optional
    #completewith BigThreat
    .goto Darkshore,37.04,44.13,0
    >>当船最接近奥伯丁海岸时跳下船
    .subzone 442 >>游向奥伯丁
step
    #ah
    #optional
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_古博·布拉普|r
    .accept 1138 >>接任务: |cRXP_LOOT_海中的水果|r << !sod/Hunter/Druid
    .accept 1141 >>接任务: |cRXP_WARN_钓鱼世家|r
    .turnin 1141 >>交任务: |cRXP_FRIENDLY_钓鱼世家|r
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target Gubber Blump
    .xp <15,1
step
    #ah
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_古博·布拉普|r
    .accept 1141 >>接任务: |cRXP_WARN_钓鱼世家|r
    .turnin 1141 >>交任务: |cRXP_FRIENDLY_钓鱼世家|r
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target Gubber Blump
step
    #optional
    #season 0
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_古博·布拉普|r
    .accept 1138 >>接任务: |cRXP_LOOT_海中的水果|r
    .target Gubber Blump
    .xp <15,1
step << NightElf
    #optional
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莱尔德|r
    >>|cRXP_WARN_从他那里购买最多 40|r |T133918:0|t[Longjaw Mud Snappers] |cRXP_WARN_。卖掉你所有其他 5 级或以下的食物|r
    .collect 4592,40 --Longjaw Mud Snapper (40)
    .turnin 6342 >>交任务: |cRXP_FRIENDLY_飞往奥伯丁|r
    .accept 6343 >>接任务: |cRXP_LOOT_飞回泰达希尔|r << Druid sod
    .target Laird
    .xp >15,1 << Warrior/Rogue/Paladin
    .isQuestAvailable 2118
step << NightElf
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莱尔德|r
    .turnin 6342 >>交任务: |cRXP_FRIENDLY_飞往奥伯丁|r
    .target Laird
step << !NightElf
    #optional
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莱尔德|r
    >>|cRXP_WARN_从他那里购买最多 40|r |T133918:0|t[Longjaw Mud Snappers] |cRXP_WARN_。卖掉你所有其他 5 级或以下的食物|r
    .collect 4592,40 --Longjaw Mud Snapper (40)
    .xp >15,1 << Warrior/Rogue
    .target Laird
    .isQuestAvailable 2118
step
    #completewith BigThreat
    .goto Darkshore,37.04,44.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板莎希因|r, 他在楼下
    .home >>将你的炉石设为奥伯丁 << !Druid sod !Priest sod
    .target Innkeeper Shaussiy
step
    #optional
    #completewith next
    .goto 1439,36.826,44.150
    .goto 1439,36.688,43.952,8 >>走上楼梯前往 |cRXP_FRIENDLY_Wizbang Cranktoggle|r
step
    #xprate <1.5
    .goto 1439,36.976,44.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维兹班恩·曲针|r, 他在楼上
    .accept 983 >>接任务: |cRXP_LOOT_传声盒827号|r
    .target Wizbang Cranktoggle
step
    #xprate >1.49
    .goto 1439,36.976,44.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维兹班恩·曲针|r, 他在楼上
    .accept 983 >>接任务: |cRXP_LOOT_传声盒827号|r
    .target Wizbang Cranktoggle
    .xp >15,1 --XX Skip if 15+
step
    #xprate <1.5
    #optional << NightElf
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴瑞萨斯·月影|r
    .accept 947 >>接任务: |cRXP_LOOT_洞中的蘑菇|r
    .target Barithras Moonshade
    .xp <12,1
step
    #xprate <1.5
    #optional << NightElf
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    .accept 4811 >>接任务: |cRXP_LOOT_红色水晶|r
    .target Sentinel Glynda Nal'Shea
    .xp <12,1
step
    #xprate >1.49
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴瑞萨斯·月影|r
    .accept 947 >>接任务: |cRXP_LOOT_洞中的蘑菇|r
    .target Barithras Moonshade
step
    #xprate >1.49
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    .accept 4811 >>接任务: |cRXP_LOOT_红色水晶|r
    .target Sentinel Glynda Nal'Shea
step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨纳瑞恩·绿树|r
    .accept 2118 >>接任务: |cRXP_LOOT_瘟疫蔓延|r
    .target 萨纳利恩护树人
step
    #label BigThreat
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特伦希斯|r
    .accept 984 >>接任务: |cRXP_LOOT_熊怪的威胁|r
    .target Terenthis
step << !NightElf
    #label WashedA
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_温尼斯·布莱葛|r
    .accept 3524 >>接任务: |cRXP_LOOT_搁浅的巨兽|r
    .target Gwennyth Bly'Leggonde
step << !NightElf
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯莱斯·月羽|r
    .fp Auberdine >>获取奥伯丁飞行路线
    .target Caylais Moonfeather
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
    >>|cRXP_WARN_派你的宠物去攻击 |cRXP_ENEMY_Thistle 熊|r。一旦你的宠物被 |cRXP_ENEMY_Thistle 熊|r 击晕，就放弃你的宠物并开始驯服它|r
    .tame 2163 >>|cRXP_WARN_对 |cRXP_ENEMY_Thistle 熊|r 施放|r |T132164:0|t[驯服野兽] |cRXP_WARN_来驯服它|r
    .target Thistle 熊
step << Warlock
    #season 2
    #label ExplorerImpDarkshore
    #sticky
    #completewith DarkshoreEnd
    >>在执行任务时对怪物施放 |T136163:0|t|cRXP_FRIENDLY_[吸取灵魂]|r 直到你收到 |T133257:0|t|cRXP_LOOT_探险者的灵魂|r。|cRXP_WARN_使用它来学习如何召唤|r |T236294:0|t|cRXP_FRIENDLY_[探险者小鬼]|r
    .train 445459 >>|cRXP_WARN_使用|r |T133257:0|t|cRXP_LOOT_Explorer's Soul|r |cRXP_WARN_学习如何召唤|r |T236294:0|t[|cRXP_FRIENDLY_Explorer Imp|r]
    .train 445459,1 --Skips if you already have Explorer Imp
    .train 1120,3 --Skips if you don't have drain soul
    .use 221978
step << Warlock/Mage
    #season 2
    #requires ExplorerImpDarkshore << Warlock
    #sticky
    #completewith DarkshoreEnd
    #label FelPortalRuneDarkshore
    >>您所在的区域有 |cRXP_FRIENDLY_Fel Portals|r。如果您发现一个，请召唤您的 |T236294:0|t[|cRXP_FRIENDLY_Explorer Imp|r] 并在传送门旁边与其交谈，以将其送去探险。10-20 分钟后，它将带着战利品回来，并有机会奖励您 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Felguard|r] << Warlock
    >>您所在的区域有 |cRXP_FRIENDLY_Fel Portals|r。如果您发现一个，请使用 |T134945:0|t[|cRXP_LOOT_Scroll of Spatial Mending|r] 关闭它。这将奖励您 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Balefire Bolt|r] << Mage
    >>|cRXP_WARN_留意传送门，直到你得到符文|r
    .collect 221499,1 << Warlock --rune of the felguard
    .collect 223147,1 << Mage --Spell Notes: Balefire Bolt
    .itemcount 220792,1 << Mage --Skips if you don't have a Scroll of Spatial Mending
    .use 223148 << Warlock --Otherworldy Treasure
    .use 220792 << Mage 
    .train 428878,1 << Mage
    .train 427733,1 << Warlock
    .train 1120,3 << Warlock --Skips if you don't have drain soul
    .unitscan Fel Sliver
    .unitscan Fel Crack
    .unitscan Fel Tear
    .unitscan Fel Scar
    .unitscan Fel Rift
step << Warlock/Mage
    #season 2
    #requires FelPortalRuneDarkshore
    #sticky
    #completewith DarkshoreEnd
    .itemcount 221499,1 << Warlock --Rune of the Felguard
    .itemcount 223147,1 << Mage --Spell Notes: Balefire Bolt
    .train 427733 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_恶魔守卫符文|r] |cRXP_WARN_学习|r |T136216:0|t[召唤恶魔守卫] << Warlock
    .train 428878 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：Balefire Bolt|r |cRXP_WARN_训练|r |T135809:0|t[Balefire Bolt] << Mage
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
    >>杀死 |cRXP_ENEMY_Pygmy Tide Crawlers|r 和 |cRXP_ENEMY_Young Reef Crawlers|r。掠夺他们的 |cRXP_LOOT_Crawler Legs|r
    >>|cRXP_WARN_你可能需要下水才能看到它们|r
    .complete 983,1 --Crawler Leg (6)
    .mob Pygmy Tide Crawler
    .mob Young Reef Crawler
    .isOnQuest 983
step
    .goto 1439,36.371,50.920
    >>打开 |cRXP_PICK_Beached Sea Creature|r。拾取其中的 |cRXP_LOOT_Sea Creature Bones|r
    .complete 3524,1 --Sea Creature Bones (1)
step << Druid
    #ah
    #season 0
    #optional
    #completewith CliffspringEnd
    #label GatheringQ
    .skill herbalism,15 >>|cRXP_WARN_将你的|r |T136065:0|t[草药学] |cRXP_WARN_等级提升至 15 级，以便能够很快完成|r |T134187:0|t[地根] |cRXP_WARN_草药学的重要职业任务。之后你可以忘记它|r
    >>|cRXP_WARN_如果你希望稍后从拍卖行购买 5|r |T134187:0|t[地根] |cRXP_WARN_，请跳过此步骤|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox
step << Druid
    #ssf
    #season 0
    #optional
    #completewith CliffspringEnd
    #label GatheringQ
    .skill herbalism,15 >>|cRXP_WARN_将你的|r |T136065:0|t[草药学] |cRXP_WARN_等级提升至 15 级，以便能够很快收集 5|r |T134187:0|t[地根] |cRXP_WARN_用于重要的职业任务。之后你可以忘记它|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox
step << Druid
    #optional
    #season 0
    #completewith CliffspringEnd
    #requires GatheringQ
    >>|cRXP_WARN_通过 |T136065:0|t[草药学] 收集 5 |T134187:0|t[地根] 和罕见的 |cRXP_PICK_Battered Chests|r 用于未来的职业任务|r
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
    >>|cRXP_WARN_使用|r |T134335:0|t[Tharnariun's Hope] |cRXP_WARN_on |cRXP_ENEMY_Rabid Thistle 熊|r。它有 50 码范围|r
    .complete 2118,1 --Rabid Thistle 熊 Captured (1)
    .unitscan Rabid Thistle 熊
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
    >>杀死 |cRXP_ENEMY_黑木探路者s|r 和 |cRXP_ENEMY_黑木风语者s|r。掠夺他们的 |T237270:0|t[|cRXP_LOOT_Crab Treats|r]
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
    .use 209027 >>|cRXP_WARN_对 |cRXP_ENEMY_幼年礁石爬行者|r 使用|r |T237270:0|t[|cRXP_LOOT_蟹肉零食|r] |cRXP_WARN_以获得|r |T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r]
    .collect 208701,1 -- Beast Mastery (1)
    .target Young Reef Crawler
    .train 410110,1
step << Hunter
    #season 2
    #sticky
    #label Treats3
    #requires Treats2
    .train 410110 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_兽王符文|r] |cRXP_WARN_进行训练|r |T132270:0|t[兽王]
    .use 208701
    .itemcount 208701,1
step << !sod/Warrior/Rogue
    #optional
    #completewith FirstWashed
    .goto 1439,43.509,33.207,0
    >>杀死 |cRXP_ENEMY_Foreststrider Fledglings|r。掠夺它们的 |cRXP_LOOT_Strider Meat|r
    >>|cRXP_WARN_小心他们|r |T132307:0|t[逃跑] |cRXP_WARN_at <30% 的健康|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob Foreststrider Fledgling
    .subzoneskip 442
step
    .goto Darkshore,38.90,53.59
    >>跑向熊怪营地的边缘
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
    .xp 11+7300 >>升级至 7300+/8800xp
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
    >>点击地面上的 |cRXP_PICK_Buzzbox 827|r
    .turnin 983 >>交任务: |cRXP_FRIENDLY_传声盒827号|r
    .accept 1001 >>接任务: |cRXP_LOOT_传声盒411号|r
step
    #xprate >1.49
    #optional << !NightElf/Hunter
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地面上的 |cRXP_PICK_Buzzbox 827|r
    .turnin 983 >>交任务: |cRXP_FRIENDLY_传声盒827号|r
    .accept 1001 >>接任务: |cRXP_LOOT_传声盒411号|r << !sod
    .isQuestComplete 983
step << NightElf !Hunter
    #xprate >1.49
    #optional
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地面上的 |cRXP_PICK_Buzzbox 827|r
    .accept 1001 >>接任务: |cRXP_LOOT_传声盒411号|r
    .isQuestTurnedIn 983
--XX so NEs can catch up on xp from those that came via menethil
--XX Hunters skip this as they will get better xp/hr grinding furbolgs
step
    #label FirstWashed
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_温尼斯·布莱葛|r
    .turnin 3524 >>交任务: |cRXP_FRIENDLY_搁浅的巨兽|r
    .accept 4681 >>接任务: |cRXP_LOOT_搁浅的巨兽|r
    .target Gwennyth Bly'Leggonde
step
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >>前往码头上的 |cRXP_FRIENDLY_Cerellean Whiteclaw|r
step << Priest
    #season 2
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莱尔德|r
    .accept 6343 >>接任务: |cRXP_LOOT_飞回泰达希尔|r
    .target Laird
step
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞瑞利恩·白爪|r
    .accept 963 >>接任务: |cRXP_LOOT_永志不渝|r
    .target Cerellean Whiteclaw
step
    #season 0,1 << Rogue
    #optional
    #completewith SeaT1
    .goto 1439,32.432,43.744,15 >>走到码头尽头，然后跳入水中
step << Rogue
    #season 2
    #optional
    #completewith SeaT1
    .goto 1439,32.432,43.744,15 >>走到码头尽头，然后跳入水中
    .train 424785,3
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith washed1
    .goto Darkshore,33.59,40.36,0
    .goto Darkshore,30.94,45.79,0
    .goto Darkshore,33.03,48.13,0
    >>杀死 |cRXP_ENEMY_Darkshore Threshers|r。掠夺他们的 |cRXP_LOOT_Thresher Eyes|r
    .complete 1001,1 --Thresher Eye (3)
    .mob Darkshore Thresher
    .isOnQuest 1001
step << Rogue
    #season 2
    #optional << !NightElf
    #completewith next
    .goto Darkshore,32.80,37.72,20 >>游到有灯塔的小岛
    .train 424785,1
step << Rogue
    #season 2
    #optional << !NightElf
    .goto Darkshore,32.729,37.093
    >>打开树干内的 |cRXP_PICK_Lighthouse Stash|r。从中获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Saber Slash|r]
    .collect 208772,1 -- Rune of Saber Slash (1)
    .train 424785,1
step << Rogue
    #season 2
    #optional << !NightElf
    .cast 402265 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .train 424785,1
step
    #label SeaT1
    .goto 1439,31.841,46.304
    >>打开 |cRXP_PICK_Skeletal Sea Turtle|r。拾取它以获得 |cRXP_LOOT_Sea Turtle Remains|r
    .complete 4681,1 --Sea Turtle Remains (1)
step << Priest
    #season 2
    .goto Darkshore,30.5,47.5
    >>点击小岛上的 |cRXP_PICK_Remnant|r。拾取它以获得 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of a King's Demise|r]
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .train 402849,1
step << Priest
    #season 2
    >>你现在必须获得两个|T135934:0|t|T136057:0|t[冥想]增益
    >>你必须跪在下列地点之一内：月亮井、北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘区
    >>为了获得你的第二个 |T135934:0|t|T136057:0|t[冥想] 增益，你需要 /跪在一个与你拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前，并且他们必须 /在瞄准你时祈祷
    .train 402849 >>|cRXP_WARN_一旦你同时拥有|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益，使用|r |T135975:0|t[|cRXP_FRIENDLY_国王灭亡的预言]|r |cRXP_WARN_学习|r |T136149:0|t[暗言术：灭]
    >>|cRXP_WARN_如果你现在无法完成此操作，请跳过此步骤并稍后完成|r
    .use 205932
    .itemcount 205932,1
step
    #optional
    #season 0
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_古博·布拉普|r
    .accept 1138 >>接任务: |cRXP_LOOT_海中的水果|r
    .target Gubber Blump
    .xp <15,1
step
    #label washed1
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_温尼斯·布莱葛|r
    .turnin 4681 >>交任务: |cRXP_FRIENDLY_搁浅的巨兽|r
    .target Gwennyth Bly'Leggonde
step
    #xprate <1.5
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴瑞萨斯·月影|r
    .accept 947 >>接任务: |cRXP_LOOT_洞中的蘑菇|r
    .target Barithras Moonshade
step
    #xprate <1.5
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    .accept 4811 >>接任务: |cRXP_LOOT_红色水晶|r
    .target Sentinel Glynda Nal'Shea
step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨纳瑞恩·绿树|r
    .turnin 2118 >>交任务: |cRXP_FRIENDLY_瘟疫蔓延|r
    .accept 2138 >>接任务: |cRXP_LOOT_清除疫病|r
    .target 萨纳利恩护树人
step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特伦希斯|r
    .turnin 984 >>交任务: |cRXP_FRIENDLY_熊怪的威胁|r
    .accept 985 >>接任务: |cRXP_LOOT_熊怪的威胁|r
    .accept 4761 >>接任务: |cRXP_LOOT_桑迪斯·织风|r
    .target Terenthis


----Start of Optional Early Level 14 Druid Turnin/train----


step << Druid
    #optional
    #completewith DruidEarlyNessa
    #season 0
    >>杀死 |cRXP_ENEMY_Moonkin|r。掠夺他们的 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于将你的|r |T133971:0|t[烹饪] |cRXP_WARN_later|r |cRXP_WARN_to 升级到 10 级|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-10)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step << Druid
    #optional
    #completewith DruidEarlyNessa
    #season 0
    >>杀死 |cRXP_ENEMY_Moonkin|r。掠夺他们的 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于在 50 之后升级你的|r |T133971:0|t[烹饪] |cRXP_WARN_later|r |cRXP_WARN_to|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
    .skill cooking,<10,1 --XX Shows if cooking skill is 10-50
    .skill cooking,50,1
step << Druid
    #optional
    #completewith EarlyLunaclaw
    #season 0
    .goto 1439,43.126,45.593,15 >>进入 |cRXP_PICK_Moonkin Stone|r 洞穴
step << Druid
    #optional
    #completewith EarlyLunaclaw
    #season 0
    .goto Darkshore,43.50,45.97
    .cast 18974 >>|cRXP_WARN_使用 |r |T132857:0|t[塞纳里奥月尘] |cRXP_WARN_at 洞穴内的 |cRXP_PICK_枭兽石|r 在洞穴入口处召唤 |cRXP_ENEMY_Lunaclaw|r|r
    .timer 4,Body and Heart RP
    .use 15208
    .isOnQuest 6001
step << Druid
    #season 0
    #optional
    #label EarlyLunaclaw
    .goto Darkshore,43.09,45.55
    >>杀死 |cRXP_ENEMY_Lunaclaw|r
    .complete 6001,1 --Defeat Lunaclaw (x1)
    .use 15208
    .mob Lunaclaw
    .xp <13+9500,1
step << Druid
    #optional
    #label DruidEarlyNessa
    #season 0
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莱尔德|r
    .accept 6343 >>接任务: |cRXP_LOOT_飞回泰达希尔|r
    .target Laird
    .isQuestComplete 6001
step << Druid
    #optional
    #completewith EarlyBody
    #season 0
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯莱斯·月羽|r
    .fly Teldrassil >>飞往泰达希尔
    .target Caylais Moonfeather
    .isQuestComplete 6001
step << Druid
    #optional
    #season 0
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尼莎·影歌|r
    .turnin 6343 >>交任务: |cRXP_FRIENDLY_飞回泰达希尔|r
    .target Nessa Shadowsong
    .isQuestComplete 6001
step << Druid
    #optional
    #completewith next
    #season 0
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
    .isQuestComplete 6001
step << Druid
    #optional
    #season 0
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛斯雷·驭熊者|r
    .turnin 6001 >>交任务: |cRXP_FRIENDLY_身心之力|r
    .accept 6121 >>接任务: |cRXP_LOOT_新的课程|r
    .trainer >>训练你的职业法术
    .target Mathrengyl 熊walker
    .isQuestComplete 6001
step << Druid
    #optional
    #season 0
    #label EarlyBody
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛斯雷·驭熊者|r
    .accept 6121 >>接任务: |cRXP_LOOT_新的课程|r
    .trainer >>训练你的职业法术
    .target Mathrengyl 熊walker
    .isQuestTurnedIn 6001
step << Druid
    #optional
    #season 0
	#completewith next
	.cast 18960 >>施法传送：月光林地
	.zoneskip Moonglade
    .isQuestTurnedIn 6001
step << Druid
    #optional
    #season 0
    .goto Moonglade,56.21,30.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德迪利特·星焰|r, 他在楼上
    .turnin 6121 >>交任务: |cRXP_FRIENDLY_新的课程|r
    .accept 6122 >>接任务: |cRXP_LOOT_毒水之源|r
    .target Dendrite Starblaze
    .isQuestTurnedIn 6001
step << Druid
    #optional
    #season 0
    #completewith AmethStart
    .hs >>从炉边到黑海岸
    .isQuestTurnedIn 6001



----End of Optional Early Level 14 Druid Turnin/train----



step << NightElf Warrior/NightElf Rogue
    #sticky
    #season 0
    #label DeepOceanStart
    .goto 1439,38.107,41.165,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高尔博德·钢手|r
    .accept 982 >>接任务: |cRXP_LOOT_深不可测的海洋|r
    .target Gorbold Steelhand
    .xp <13,1
step << NightElf Warrior/NightElf Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库德拉姆·石锤|r, |cRXP_FRIENDLY_迪尔弗拉姆·火须|r
    .train 2575 >>列车 |T134708:0|t[采矿]
    .goto Darkshore,38.249,41.008
    .train 2018 >>训练 |T136241:0|t[锻造]
    .goto Darkshore,38.191,40.935
    >>|cRXP_WARN_这将允许你制作|r |T135248:0|t[粗糙磨刀石] |cRXP_WARN_这将使你的近战伤害增加 2|r << Warrior/Rogue
    >>|cRXP_WARN_如果你不想这样做，请跳过此步骤|r
    .target Kurdram Stonehammer
    .target Delfrum Flintbeard
step << NightElf Warrior/NightElf Rogue
    #optional
    .goto Darkshore,38.142,41.108
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾丽萨·钢拳|r
    >>|cRXP_BUY_从她那里购买 a|r |T134708:0|t[采矿镐] |cRXP_BUY_|r
    .target Elisa Steelhand
    .collect 2901,1 -- Mining Pick (1)
    .train 2575,3 --Mining Trained
step << NightElf Warrior/NightElf Rogue
    #optional
    #completewith Bashal1
    .cast 2580 >>|cRXP_WARN_Cast|r |T136025:0|t[寻找矿物]
    .usespell 2580
    .train 2575,3 --Mining Trained
step << !NightElf/!Warrior !Rogue
    #xprate <1.5 --<< !NightElf/Hunter --XX Night Elves do it on 2x to catch up on xp EXCEPT Dwarf/NE Hunters (1x only)
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高尔博德·钢手|r
    .accept 982 >>接任务: |cRXP_LOOT_深不可测的海洋|r
    .target Gorbold Steelhand
    .xp <13,1
step << !sod/Warrior/Rogue
    #optional
    #requires DeepOceanStart << NightElf Warrior/NightElf Rogue
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥兰达利亚·夜歌|r
    .accept 2178 >>接任务: |cRXP_LOOT_炖陆行鸟|r
    .turnin 2178 >>交任务: |cRXP_FRIENDLY_炖陆行鸟|r
    .target Alanndarian Nightsong
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
step << NightElf Rogue
    .goto 1439,37.575,40.348
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_纳拉姆·长爪|r
    .vendor 4183 >>|cRXP_BUY_如果你能负担得起的话，从他那里买一个|r |T135640:0|t[Jambiya] |cRXP_BUY_|r
    .collect 2207,1 -- Jambiya (1)
    .disablecheckbox
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.10
--  .money <0.2390
    .target Naram Longclaw
step << !Druid sod
    #optional
    #completewith next
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达蒙德|r, 他在里面
    .vendor 4182 >>|cRXP_BUY_从他那里购买任意数量的|r |T133634:0|t[棕色小袋] |cRXP_BUY_或|r |T133634:0|t[棕色皮革挎包] |cRXP_BUY_|r
    >>|cRXP_BUY_从他那里购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_或|r |T132384:0|t[重击] |cRXP_BUY_直到你的箭筒/弹药袋满了|r << Hunter
    .target Dalmond
step << !Druid sod
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 4761 >>交任务: |cRXP_FRIENDLY_桑迪斯·织风|r
    .accept 4762 >>接任务: |cRXP_LOOT_壁泉河|r
    .accept 954 >>接任务: |cRXP_LOOT_巴莎兰|r
    .accept 958 >>接任务: |cRXP_LOOT_上层精灵的工具|r << !sod
    .target Thundris Windweaver
    .xp >16,1
--XX if 16+，跳过工具
step << !Druid sod
    #optional
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 4761 >>交任务: |cRXP_FRIENDLY_桑迪斯·织风|r
    .accept 4762 >>接任务: |cRXP_LOOT_壁泉河|r
    .accept 954 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Thundris Windweaver
    .xp >18,1
--XX if 18+，跳过 Bashal
step << !Druid sod
    #optional
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 4761 >>交任务: |cRXP_FRIENDLY_桑迪斯·织风|r
    .accept 4762 >>接任务: |cRXP_LOOT_壁泉河|r
 step << !sod/Warrior/Rogue
    #optional
    #completewith AsterionTravel << era
    #completewith AsterionTravelSoD << sod
    .goto 1439,43.509,33.207,0
    >>杀死 |cRXP_ENEMY_Foreststrider Fledglings|r。掠夺它们的 |cRXP_LOOT_Strider Meat|r
    >>|cRXP_WARN_小心他们|r |T132307:0|t[逃跑] |cRXP_WARN_at <30% 的健康|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob Foreststrider Fledgling
step << Warrior/Rogue
    #season 2
    .goto 1439,41.901,31.339
    >>点击 |cRXP_PICK_Beached Sea Creature|r
    .accept 4723 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step << !Warrior !Rogue
    #season 2
    #label RedCrystal
    .goto 1439,47.314,48.676
    >>前往|cRXP_PICK_神秘的红水晶|r
    >>|cRXP_WARN_小心 |cRXP_ENEMY_Raging Moonkins|r 西边的两组 |cRXP_PICK_Mysterious Red Crystal|r，因为彼此最接近的两组被拴在一起|r
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range
step << Druid
    #season 2
    .xp 14-1600 >>磨练枭兽直到你距离 14 级还有 1600 经验值
step << skip --logout skip !Warrior !Rogue
    #season 2
    .goto 1439/1,-33.200,6141.300,20 >>前往附近的洞穴
step << skip --logout skip !Warrior !Rogue
    #optional
    #label OracleLS
    #completewith AsterionTravelSoD
    #season 2
    .goto 1439/1,-79.100,6134.300
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_杀死里面的枭兽先知，然后跳到洞穴后面的大蘑菇上，通过登出并重新登录来执行“跳过登出”操作|r


----Start of SoD Druid Starsurge segment----    

step << Druid
    #optional
    #season 2
    #completewith next
    .subzone 442 >>前往奥伯丁
step << Druid
    #season 2
    #optional
    #completewith next
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达蒙德|r, 他在里面
    .vendor 4182 >>|cRXP_BUY_从他那里购买任意数量的|r |T133634:0|t[棕色小袋] |cRXP_BUY_或|r |T133634:0|t[棕色皮革挎包] |cRXP_BUY_|r
    >>|cRXP_BUY_从他那里购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_或|r |T132384:0|t[重击] |cRXP_BUY_直到你的箭筒/弹药袋满了|r << Hunter
    .target Dalmond
step << Druid
    #season 2
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 4761 >>交任务: |cRXP_FRIENDLY_桑迪斯·织风|r
    .accept 4762 >>接任务: |cRXP_LOOT_壁泉河|r
    .accept 954 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Thundris Windweaver
step << Druid
    #season 2
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    .turnin 4811 >>交任务: |cRXP_FRIENDLY_红色水晶|r
    .accept 4812 >>接任务: |cRXP_LOOT_清洗水晶|r
    .target Sentinel Glynda Nal'Shea
step << Druid
    #season 2
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_使用|r |T134865:0|t[空水管]|cRXP_WARN_at Auberdine 月亮井|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338
    .isQuestTurnedIn 4811
step << Druid
    #season 2
    #softcore
    .goto Darkshore,32.44,43.71
    .zone Wetlands >>|cRXP_WARN_前往: |cRXP_PICK_湿地|r，乘船前往米奈希尔港。你现在将前往湿地获取|r |T135730:0|t[星涌术] |cRXP_WARN_符文，它在这个级别上非常强大|r
    >>|cRXP_WARN_在此过程中你可能会死几次|r
    .train 424718,1
step << Druid
    #season 2
    #softcore
    .goto Wetlands,36.941,15.157
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grugimdern|r
    >>|cRXP_WARN_他会给你一个|r |T134052:0|t[|cRXP_LOOT_Marshroom|r]
    .collect 210499,1 -- Marshroom (1)
    .target Grugimdern
    .train 424718,1
    .link https://youtu.be/fWVaDR-NnKU >>|cRXP_WARN_点击此处查看视频参考|r
step << Druid
    #season 2
    #softcore
    .goto Wetlands,31.187,18.328,15 >>前往湖面露出的树桩
    .train 424718,1
step << Druid
    #season 2
    #softcore
    #completewith next
    .goto Wetlands,31.187,18.328
    .cast 426019 >>|cRXP_WARN_使用|r |T134052:0|t[|cRXP_LOOT_Marshroom|r] |cRXP_WARN_吃掉它|r
    >>|cRXP_WARN_使用前请确保你是安全的，如果你死了，你就必须再次获得蘑菇|r
    .use 210499
    .train 424718,1
step << Druid
    #season 2
    #softcore
    .goto Wetlands,31.187,18.328
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vodyanoi|r
    >>你只有先吃蘑菇才能看到这个NPC
    .collect 210500,1 -- Rune of the Stars (1)
    .skipgossip
    .target Vodyanoi
    .train 424718,1
step << Druid
    #season 2
    #softcore
    .train 424718 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_星之符文|r] |cRXP_WARN_进行训练|r |T135730:0|t[星涌]
    .use 210500
    .itemcount 210500,1
step << Druid
    #season 2
	#completewith next
	.cast 18960 >>施法传送：月光林地
    .usespell 18960
    >>|cRXP_WARN_它将在你的法术书中|r
	.zoneskip Moonglade
step << Druid
    #season 2
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德迪利特·星焰|r, 他在楼上
    .turnin 5921 >>交任务: |cRXP_FRIENDLY_月光林地|r
    .target Dendrite Starblaze
    .accept 5929 >>接任务: |cRXP_LOOT_巨熊之灵|r
step << Druid
    #season 2
    .goto Moonglade,45.12,26.78,15,0
    .goto Moonglade,39.17,27.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巨熊之灵|r
    .complete 5929,1 --Seek out the Great 熊 Spirit and learn what it has to share with you about the nature of the bear.
    .skipgossip
    .target Great 熊 Spirit
step << Druid
    #season 2
	#completewith next
	.cast 18960 >>施法传送：月光林地
    >>|cRXP_WARN_这将使你返回得更快|r
step << Druid
    #season 2
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德迪利特·星焰|r, 他在楼上
    .turnin 5929 >>交任务: |cRXP_FRIENDLY_巨熊之灵|r
    .target Dendrite Starblaze
    .accept 5931 >>接任务: |cRXP_LOOT_返回达纳苏斯|r
step << Druid
    #season 2
    .hs >>炉石到达纳苏斯
step << Druid
    .goto Darnassus,35.38,8.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛斯雷·驭熊者|r, 他在中层
    .trainer >>训练你的职业法术
    .turnin 5931 >>交任务: |cRXP_FRIENDLY_返回达纳苏斯|r
    .target Mathrengyl 熊walker
    .accept 6001 >>接任务: |cRXP_LOOT_身心之力|r
step << Druid
    #season 2
    #completewith FlyAuberdine
    .goto Darnassus,28.52,39.89
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
    .zoneskip Darkshore
    .subzoneskip 702
step << Druid
    #optional
    #season 2
    #label FlyAuberdine
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尼莎·影歌|r
    .turnin 6343 >>交任务: |cRXP_FRIENDLY_飞回泰达希尔|r
    .target Nessa Shadowsong
step << Druid
    #season 2
    .goto Teldrassil,58.399,94.016
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维斯派塔斯|r
    .fly Darkshore >>飞往黑海岸
    .target Vesprystus
step << Druid
    #optional
    #season 2
    #completewith Lunaclaw
    .goto 1439,43.126,45.593,15 >>进入 |cRXP_PICK_Moonkin Stone|r 洞穴
step << Druid
    #optional
    #season 2
    #completewith Lunaclaw
    .goto Darkshore,43.50,45.97
    .cast 18974 >>|cRXP_WARN_使用 |r |T132857:0|t[塞纳里奥月尘] |cRXP_WARN_at 洞穴内的 |cRXP_PICK_枭兽石|r 在洞穴入口处召唤 |cRXP_ENEMY_Lunaclaw|r|r
    .timer 4,Body and Heart RP
    .use 15208
    .isOnQuest 6001
step << Druid
    #label Lunaclaw
    #season 2
    .goto Darkshore,43.09,45.55
    >>杀死 |cRXP_ENEMY_Lunaclaw|r
    .complete 6001,1 --Defeat Lunaclaw (x1)
    .use 15208
    .mob Lunaclaw
step << Druid
    #season 2
    .goto 1439,47.314,48.676
    >>点击|cRXP_PICK_神秘红水晶|r
    >>|cRXP_WARN_小心 |cRXP_ENEMY_Raging Moonkins|r 西边的两组 |cRXP_PICK_Mysterious Red Crystal|r，因为彼此最接近的两组被拴在一起|r
    .turnin 4812 >>交任务: |cRXP_FRIENDLY_清洗水晶|r
    .accept 4813 >>接任务: |cRXP_LOOT_水晶中的碎骨|r
    .isQuestTurnedIn 4811
step << skip --logout skip Druid
    #season 2
    .goto 1439/1,-33.200,6141.300,20 >>前往附近的洞穴
step << skip --logout skip Druid
    #optional
    #label OracleLS
    #completewith AsterionTravelSoD
    #season 2
    .goto 1439/1,-79.100,6134.300
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_杀死里面的枭兽先知，然后跳到洞穴后面的大蘑菇上，通过登出并重新登录来执行“跳过登出”操作|r


----End of SoD Druid Starsurge segment----

step
    #xprate >1.49
    #optional
    #label AsterionTravelSoD
    #completewith Bashal1
    .goto 1439,44.376,36.754,20,0
    .goto 1439,44.168,36.289,15 >>前往 |cRXP_FRIENDLY_Asterion|r
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿斯特利安|r
    >>|cRXP_WARN_避免在途中杀死 |cRXP_ENEMY_Wild Grells|r 和 |cRXP_ENEMY_Vile Sprites|r|r
    .turnin 954 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .accept 955 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
    .isOnQuest 954
    .xp >16,1
--XX skip Bashal Aran qline if 16+
step
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿斯特利安|r
    >>|cRXP_WARN_避免在途中杀死 |cRXP_ENEMY_Wild Grells|r 和 |cRXP_ENEMY_Vile Sprites|r|r
    .turnin 954 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .target Asterion
    .isOnQuest 954
--XX Turn in Breadcrumb if you picked it up earlier before 18
step
    #label Bashal1
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿斯特利安|r
    .accept 955 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
    .isQuestTurnedIn 954
    .xp >16,1
--XX if you ding 16 from turnin，跳过 Bashal Aran qline
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
    >>杀死 |cRXP_ENEMY_Wild Grells|r 和 |cRXP_ENEMY_Vile Sprites|r。掠夺他们的 |cRXP_LOOT_Grell Earrings|r
    >>|cRXP_WARN_暂时避免杀死 |cRXP_ENEMY_Deth'ryll Satyrs|r|r
    .complete 955,1 --Grell Earring (8)
    .mob Wild Grell
    .mob Vile Sprite
    .isOnQuest 955
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿斯特利安|r
    .turnin 955 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .accept 956 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
    .isQuestComplete 955
step
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿斯特利安|r
    .accept 956 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
    .isQuestTurnedIn 955
step
    #completewith MeatFangEgg1
    #optional
    .abandon 955 >>抛弃巴莎兰
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
    >>杀死 |cRXP_ENEMY_Deth'ryll Satyrs|r。掠夺他们以获得 |cRXP_LOOT_Ancient Moonstone Seal|r
    >>|cRXP_WARN_它们没有动态重生。如果你找不到任何|r |cRXP_ENEMY_Deth'ryll Satyrs，请跳过此步骤|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob Deth'ryll Satyr
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
    >>杀死 |cRXP_ENEMY_Deth'ryll Satyrs|r。掠夺他们以获得 |cRXP_LOOT_Ancient Moonstone Seal|r
    >>|cRXP_WARN_请注意，它们没有动态重生|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob Deth'ryll Satyr
    .isQuestTurnedIn 955
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿斯特利安|r
    .turnin 956 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .accept 957 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
    .isQuestComplete 956
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿斯特利安|r
    .accept 957 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
    .isQuestTurnedIn 956
step << !sod/Warrior/Rogue
    #optional
    #completewith RedCrystal
    #season 2
    >>杀死 |cRXP_ENEMY_Foreststrider Fledglings|r。掠夺它们的 |cRXP_LOOT_Strider Meat|r
    >>|cRXP_WARN_小心他们|r |T132307:0|t[逃跑] |cRXP_WARN_at <30% 的健康|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob Foreststrider Fledgling
step << !Warrior !Rogue
    #season 2
    #sticky
    #completewith MushroomCaveSoD
    >>杀死所有|cRXP_ENEMY_狂暴的蓟熊|r 你瞧。|cRXP_WARN_你不必现在完成这个任务，但理想情况下，当你进入纳迦洞穴时，你应该已经杀死了大约 15 只以上的纳迦熊|r << Priest
    >>杀死所有|cRXP_ENEMY_狂暴的蓟熊|r 你知道的。|cRXP_WARN_你不必现在完成这个任务|r << !Priest
    >>|cRXP_WARN_当他们施放|r |T135914:0|t[狂犬病] |cRXP_WARN_如果你没有足够快地杀死他们时要小心（即时近战：在 10 分钟内将所有生命值恢复降低 50%）|r
    .complete 2138,1 --Rabid Thistle 熊s (20)
    .mob Rabid Thistle 熊
step << !Warrior !Rogue
    #season 2
    .goto Darkshore,50.81,25.50
    >>|cRXP_WARN_使用|r |T134865:0|t[空采样管]|cRXP_WARN_位于 Cliffspring 河底部|r
    .complete 4762,1 --Cliffspring River Sample (1)
    .use 12350
step << !Warrior !Rogue
    #optional
    #completewith next
    #season 2
    #label MushroomCaveSoD
    .goto 1439,54.934,32.721,20,0
    .goto 1439,55.108,33.600,40 >>前往悬崖泉河洞穴
step << !Warrior !Rogue
    .goto Darkshore,55.45,36.23,12,0
    .goto Darkshore,55.70,36.30,12,0
    .goto Darkshore,55.89,35.40,12,0
    #season 2
    >>拾取地面上的 |cRXP_LOOT_Scaber Stalks|r 和 |cRXP_LOOT_Death Cap|r
    >>|cRXP_WARN_留在上部。如果顶部末端没有 |cRXP_LOOT_Death Cap|r，请跳下去并从下面的南房间拿一个|r
    >>|cRXP_WARN_要小心，因为 |cRXP_ENEMY_Stormscale Wave Riders|r 施放|r |T135836:0|t[Aqua Jet] |cRXP_WARN_（远程瞬发：对附近的敌人造成伤害并将其击退） - 确保您不会被撞下洞穴的上层|r
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
    .hs >>炉石到奥伯丁
    >>|cRXP_BUY_如有需要，请购买食物和水|r << !Warrior !Rogue
	>>|cRXP_BUY_如果需要的话购买食物|r << Warrior/Rogue
    .cooldown item,6948,>0,1
step << skip --logout skip !Warrior !Rogue
    #optional
    #label MushroomLSSoD
    #completewith CavetoAuberSoD
    #season 2
    .goto 1439,54.964,34.536
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_Jump on top of the rock on the top floor inside the cave. 前往: |cRXP_PICK_丹莫罗|r, 调整你的角色，直到它们看起来像是漂浮起来，然后通过退出并重新登录来执行跳过操作|r
step
    #season 2 << Warrior/Rogue
    #season 0 << Mage/Warlock/Priest/Paladin/Hunter/Druid
    #completewith LateTurtleStart << era
    #completewith RedCrystal << sod
    >>杀死 |cRXP_ENEMY_Moonkin|r。掠夺他们的 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于将你的|r |T133971:0|t[烹饪] |cRXP_WARN_later|r |cRXP_WARN_to 升级到 10 级|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .subzoneskip 442 --Auberdine
    .subzoneskip 447 --Ameth'Aran
step << Warrior/Rogue
    #season 2
    #label RedCrystal
    .goto 1439,47.314,48.676
    >>前往|cRXP_PICK_神秘的红水晶|r
    >>|cRXP_WARN_小心 |cRXP_ENEMY_Raging Moonkins|r 西边的两组 |cRXP_PICK_Mysterious Red Crystal|r，因为彼此最接近的两组被拴在一起|r
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range
step << skip --logout skip Warrior/Rogue
    #season 2
    .goto 1439/1,-33.200,6141.300,20 >>前往附近的洞穴
step << skip --logout skip Warrior/Rogue
    #completewith next
    #season 2
    .goto 1439/1,-79.100,6134.300
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_杀死里面的枭兽先知，然后跳到洞穴后面的大蘑菇上，通过登出并重新登录来执行“跳过登出”操作|r
step << !Warrior !Rogue
    #optional
    #season 2
    #label CavetoAuberSoD
    #completewith CliffspringEnd
    .subzone 442 >>前往奥伯丁
step << !Warrior !Rogue
    #label CliffspringEnd
    #season 2
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 4762 >>交任务: |cRXP_FRIENDLY_壁泉河|r
    .accept 4763 >>接任务: |cRXP_LOOT_黑木熊怪的堕落|r
    .target Thundris Windweaver

----Start of Early Red Crystal turnin Section (NE below 14 for xp, Hunters/Druids for staff wep upgrade)/Druid bear q final if not done earlier----


step << NightElf/Hunter/Druid/Warrior
    #season 2 << Warrior/Rogue
    #optional
    #label AuberdineTurnin2
    #completewith Cascade
    .goto 1439,37.703,43.393
    .subzone 442 >>返回奥伯丁
step << Druid
    #season 2
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_考古学家霍莉|r
    .accept 729 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Archaeologist Hollee
step << !Warrior !Rogue
    #season 2
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴瑞萨斯·月影|r
    .turnin 947 >>交任务: |cRXP_FRIENDLY_洞中的蘑菇|r
    .accept 948 >>接任务: |cRXP_LOOT_安努|r
    .target Barithras Moonshade
step << NightElf/Hunter/Druid/Warrior/Rogue
    #season 2 << Warrior/Rogue
    #optional
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    .turnin 4811 >>交任务: |cRXP_FRIENDLY_红色水晶|r << !Druid sod
    .accept 4812 >>接任务: |cRXP_LOOT_清洗水晶|r << !Druid sod
    .turnin 4813 >>交任务: |cRXP_FRIENDLY_水晶中的碎骨|r << Druid sod
    .target Sentinel Glynda Nal'Shea
    .xp >14,1 << Hunter/Druid << !sod
--XX If Night Elves, Hunters, or Druids are lower than level 14, do questline
step << Hunter/Druid
    #season 0,1 << Druid
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    .turnin 4811 >>交任务: |cRXP_FRIENDLY_红色水晶|r
    .accept 4812 >>接任务: |cRXP_LOOT_清洗水晶|r
    .target Sentinel Glynda Nal'Shea
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5 << Hunter/Druid
--XX If Hunters and Druids (in Era) have a worse weapon than the Oakthrush Staff, do the quest even if 14+
step << NightElf/Hunter/Druid
    #optional
    #label Cascade
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    .accept 4812 >>接任务: |cRXP_LOOT_清洗水晶|r
    .target Sentinel Glynda Nal'Shea
    .isQuestTurnedIn 4811 --show step if Red Crystal turned in
step << NightElf/Hunter/Druid
    #optional
    #season 0
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莱尔德|r
    >>|cRXP_WARN_从他那里购买最多 40|r |T133918:0|t[Longjaw Mud Snappers] |cRXP_WARN_。卖掉你所有其他 5 级或以下的食物|r
    .collect 4592,40 --Longjaw Mud Snapper (40)
    .target Laird
    .subzoneskip 442,1 --skip if you leave Auber
    .xp >15,1 << Warrior/Rogue
    .isQuestTurnedIn 4811 --show step if you turned in red crystal
step << NightElf/Hunter/Druid/Warrior/Rogue
    #optional
    #season 2 << Warrior/Rogue
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_使用|r |T134865:0|t[空水管]|cRXP_WARN_at Auberdine 月亮井|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338
    .isQuestTurnedIn 4811
step << !Warrior !Rogue
    #season 2
    .goto Darkshore,37.78,44.06
    >>|cRXP_WARN_使用|r |T133748:0|t[空的清洁碗]|cRXP_WARN_at奥伯丁月亮井|r
    .collect 12347,1,4763,1 --Filled Cleansing Bowl (1)
    .use 12346
    .isOnQuest 4763
step << NightElf/Hunter/Druid/Warrior/Rogue
    #season 2 << Warrior/Rogue
    #optional
    #season 0 << Hunter/Druid/Rogue/Priest
    #completewith MysteriousCrystalHuntDruidEnd << era
    #completewith Anaya << sod
    >>杀死 |cRXP_ENEMY_Foreststrider Fledglings|r。掠夺它们的 |cRXP_LOOT_Strider Meat|r
    >>|cRXP_WARN_小心他们|r |T132307:0|t[逃跑] |cRXP_WARN_at <30% 的健康|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob Foreststrider Fledgling
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior/Rogue
    #optional
    #completewith EarlyCrystalEnd
    #season 2 << Warrior/Rogue
    #season 0 << Hunter/Druid/Rogue/Priest
    >>杀死 |cRXP_ENEMY_Moonkin|r。掠夺他们的 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于将你的|r |T133971:0|t[烹饪] |cRXP_WARN_later|r |cRXP_WARN_to 升级到 10 级|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid
    #optional
    #completewith EarlyCrystalEnd
    #season 0
    >>杀死 |cRXP_ENEMY_Moonkin|r。掠夺他们的 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于在 50 之后升级你的|r |T133971:0|t[烹饪] |cRXP_WARN_later|r |cRXP_WARN_to|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
    .skill cooking,<10,1 --XX Shows if cooking skill is 10-50
    .skill cooking,50,1
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith MysteriousCrystalHuntDruidEnd
    >>杀死 |cRXP_ENEMY_月夜猎者 Runts|r。掠夺他们的 |cRXP_LOOT_月夜猎者 Fangs|r
    .complete 1002,1 -- 月夜猎者 Fang (6)
    .mob 月夜猎者 Runt
    .isOnQuest 1002
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid
    #season 0
    .goto 1439,47.314,48.676
    #label EarlyCrystalEnd
    >>点击|cRXP_PICK_神秘红水晶|r
    >>|cRXP_WARN_小心 |cRXP_ENEMY_Raging Moonkins|r 西边的两组 |cRXP_PICK_Mysterious Red Crystal|r，因为彼此最接近的两组被拴在一起|r
    .turnin 4812 >>交任务: |cRXP_FRIENDLY_清洗水晶|r
    .accept 4813 >>接任务: |cRXP_LOOT_水晶中的碎骨|r
    .isQuestTurnedIn 4811
step << !Druid sod
    #season 2
    .goto 1439,47.314,48.676
    #label EarlyCrystalEnd
    >>点击|cRXP_PICK_神秘红水晶|r
    >>|cRXP_WARN_小心 |cRXP_ENEMY_Raging Moonkins|r 西边的两组 |cRXP_PICK_Mysterious Red Crystal|r，因为彼此最接近的两组被拴在一起|r
    .turnin 4812 >>交任务: |cRXP_FRIENDLY_清洗水晶|r
    .accept 4813 >>接任务: |cRXP_LOOT_水晶中的碎骨|r
    .isQuestTurnedIn 4811
step << skip --logout skip
    #season 2 << Hunter
    #season 1 << Druid/Warrior/Rogue/Priest
    .goto 1439/1,-33.200,6141.300,20 >>前往附近的洞穴
step <<  skip --logout skip
    #optional
    #label OracleLSTwo
    #completewith MysteriousCrystalHuntDruidEnd
    #season 2 << Hunter
    #season 1 << Druid/Warrior/Rogue/Priest
    .goto 1439/1,-79.100,6134.300
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_杀死里面的枭兽先知，然后跳到洞穴后面的大蘑菇上，通过登出并重新登录来执行“跳过登出”操作|r
step
    #season 2 << Hunter
    #season 1 << Druid/Warrior/Rogue/Priest
    #optional
    #label MysteriousCrystalHuntDruidEnd
    #completewith next
    .goto 1439,37.703,43.393
    .subzone 442 >>返回奥伯丁
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #season 0
    .goto Darkshore,37.70,43.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    >>|cRXP_WARN_选择|r |T135641:0|t[Curvewood Dagger] |cRXP_WARN_因为您应该尝试保存|r |T135641:0|t[Dagger] |cRXP_WARN_以供|r |T132290:0|t[Poisons] |cRXP_WARN_稍后完成任务|r << Rogue
    .turnin 4813 >>交任务: |cRXP_FRIENDLY_水晶中的碎骨|r << !Hunter !Druid
    .turnin 4813,3 >>交任务: |cRXP_FRIENDLY_水晶中的碎骨|r << Hunter/Druid
    .target Sentinel Glynda Nal'Shea
    .isQuestTurnedIn 4811
step
    #season 2 << Hunter
    #season 1 << Druid/Warrior/Rogue/Priest
    .goto Darkshore,37.70,43.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    >>|cRXP_WARN_选择|r |T135641:0|t[Curvewood Dagger] |cRXP_WARN_因为您应该尝试保存|r |T135641:0|t[Dagger] |cRXP_WARN_以供|r |T132290:0|t[Poisons] |cRXP_WARN_稍后完成任务|r << Rogue
    .turnin 4813 >>交任务: |cRXP_FRIENDLY_水晶中的碎骨|r << !Hunter !Druid
    .turnin 4813,3 >>交任务: |cRXP_FRIENDLY_水晶中的碎骨|r << Hunter/Druid
    .target Sentinel Glynda Nal'Shea
    .isQuestTurnedIn 4811
step << Hunter/Druid/Warrior
    #completewith AmethStart
    +|cRXP_WARN_装备|r |T135145:0|t[橡树鸫法杖]
    .use 15397
    .itemcount 15397,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
    .isQuestTurnedIn 4811


----Start of forced Level 14 Druid Turnin/train----


step << Druid
    #season 0
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莱尔德|r
    .accept 6343 >>接任务: |cRXP_LOOT_飞回泰达希尔|r
    .target Laird
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
    .xp 13+9500 >>升级至 9500+/11400xp
step << Druid
    #season 0
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯莱斯·月羽|r
    .fly Teldrassil >>飞往泰达希尔
    .target Caylais Moonfeather
    .isQuestAvailable 6001
step << Druid
    .goto Teldrassil,56.25,92.44
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尼莎·影歌|r
    .turnin 6343 >>交任务: |cRXP_FRIENDLY_飞回泰达希尔|r
    .target Nessa Shadowsong
    .isQuestAvailable 6001
step << Druid
    #optional
    #completewith next
    #season 0
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Druid
    .goto Darnassus,35.375,8.405
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛斯雷·驭熊者|r
    .turnin 6001 >>交任务: |cRXP_FRIENDLY_身心之力|r
    .accept 6121 >>接任务: |cRXP_LOOT_新的课程|r
    .trainer >>训练你的职业法术
    .target Mathrengyl 熊walker
    .isQuestAvailable 6001
step << Druid
    #optional
    #season 0
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛斯雷·驭熊者|r
    .accept 6121 >>接任务: |cRXP_LOOT_新的课程|r
    .trainer >>训练你的职业法术
    .target Mathrengyl 熊walker
    .isQuestTurnedIn 6001
    .zoneskip Darnassus,1
step << Druid
    #optional
    #season 0
	#completewith next
	.cast 18960 >>施法传送：月光林地
	.zoneskip Moonglade
step << Druid
    #season 0
    .goto Moonglade,56.21,30.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德迪利特·星焰|r, 他在楼上
    .turnin 6121 >>交任务: |cRXP_FRIENDLY_新的课程|r
    .accept 6122 >>接任务: |cRXP_LOOT_毒水之源|r
    .target Dendrite Starblaze
step << Druid
    #season 0
    #optional
    #completewith AmethStart
    .hs >>从炉边到黑海岸
    .zoneskip Darkshore

----End of forced Level 14 Druid Turnin/train----
----End of Early Red Crystal turnin Section (NE for xp, Hunters/Druids for staff)/Druid bear q final if not done earlier----


step
    #season 0
    #optional
    #completewith AmethStart
    >>杀死 |cRXP_ENEMY_Foreststrider Fledglings|r。掠夺它们的 |cRXP_LOOT_Strider Meat|r
    >>|cRXP_WARN_小心他们|r |T132307:0|t[逃跑] |cRXP_WARN_at <30% 的健康|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider Fledgling
    .subzoneskip 447


----Start of alternate section if early Red Crystal turnin----


step << NightElf/Hunter/Druid
    #xprate <1.5 --<< !NightElf/Hunter
    #completewith EarlyBlackwood
    #optional
    >>杀死 |cRXP_ENEMY_月夜猎者 Runts|r。掠夺他们的 |cRXP_LOOT_月夜猎者 Fangs|r
    .complete 1002,1 -- 月夜猎者 Fang (6)
    .mob 月夜猎者 Runt
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
    >>杀死 |cRXP_ENEMY_黑木探路者s|r 和 |cRXP_ENEMY_黑木风语者s|r
    .complete 985,1 -- 黑木探路者 (8)
    .complete 985,2 -- 黑木风语者 (5)
    .mob 黑木探路者
    .mob 黑木风语者
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #requires EarlyTreats3 << Druid --Season 2
    #completewith EarlyTurtleStart
    >>杀死 |cRXP_ENEMY_月夜猎者s|r。掠夺他们的 |cRXP_LOOT_月夜猎者 Fangs|r
    .complete 1002,1 -- 月夜猎者 Fang (6)
    .mob 月夜猎者
    .subzoneskip 447
    .isOnQuest 1002
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid
    #optional
    #season 0
    #completewith Anaya
    #requires EarlyTreats3 << Druid --Season 2
    >>杀死 |cRXP_ENEMY_Rabid Thistle 熊s|r
    >>|cRXP_WARN_当他们施放|r |T135914:0|t[狂犬病] |cRXP_WARN_如果你没有足够快地杀死他们时要小心（即时近战：在 10 分钟内将所有生命值恢复降低 50%）|r
    .complete 2138,1 -- Rabid Thistle 熊 slain (20)
    .mob Rabid Thistle 熊
    .isQuestTurnedIn 4811
    .subzoneskip 447
step << NightElf/Hunter/Druid
    #optional
    #season 0
    #label EarlyTurtleStart
    #requires EarlyTreats3 << Druid --Season 2
    .goto 1439,37.105,62.167
    >>点击 |cRXP_PICK_Beached Sea Turtle|r
    .accept 4722 >>接任务: |cRXP_LOOT_搁浅的海龟|r
    .isQuestTurnedIn 4811
step
    #optional
    #season 0
    #label EarlyAmethStart
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵坦莎·月刃|r
    .accept 953 >>接任务: |cRXP_LOOT_亚米萨兰的毁灭|r
    .target Sentinel Tysha Moonblade
    .isQuestTurnedIn 4811
    .xp >17,1

----End of alternate section if early Red Crystal turnin----

----Start of small south loop for ERA and SoD Warrior/Rogue/Priest----

step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith AmethStart
    >>杀死 |cRXP_ENEMY_月夜猎者 Runts|r。掠夺他们的 |cRXP_LOOT_月夜猎者 Fangs|r
    .complete 1002,1 -- 月夜猎者 Fang (6)
    .mob 月夜猎者 Runt
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
    >>杀死 |cRXP_ENEMY_Moonkin|r。掠夺他们的 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于将你的|r |T133971:0|t[烹饪] |cRXP_WARN_later|r |cRXP_WARN_to 升级到 10 级|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
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
    >>杀死 |cRXP_ENEMY_Anaya Dawnrunner|r。掠夺她的财物 |cRXP_LOOT_Pendant|r 
    >>|cRXP_WARN_请注意，她的刷新时间为 7-8 分钟，刷新点位于 Ameth'Aran 的 4 个不同位置|r
    >>|cRXP_WARN_如果你找不到她，并且想稍后再试一次，但可能会很快遇到更多怪物，请跳过此步骤|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan Anaya Dawnrunner
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
    >>杀死 |cRXP_ENEMY_Anaya Dawnrunner|r。掠夺她的财物 |cRXP_LOOT_Pendant|r
    >>|cRXP_WARN_请注意，她的刷新时间为 7-8 分钟，刷新点位于 Ameth'Aran 的 4 个不同位置|r
    >>|cRXP_WARN_如果找不到她，您可能想与附近的其他人组队。在常规聊天 (/1) 中请求与其他也在寻找她的人组队|r
    >>|cRXP_WARN_如果你找不到她，并且想稍后再试一次，但可能会很快遇到更多怪物，请跳过此步骤|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan Anaya Dawnrunner
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
    >>杀死 |cRXP_ENEMY_被诅咒的上层精灵s|r、|cRXP_ENEMY_痛苦挣扎的上层精灵s|r 和 |cRXP_ENEMY_Wailing Highbornes|r。掠夺他们的 |cRXP_LOOT_Relics|r
    .complete 958,1 --Highborne Relic (7)
    .mob 被诅咒的上层精灵
    .mob 痛苦挣扎的上层精灵
    .mob Wailing Highborne
    .isOnQuest 958
step
    #season 0
    #label AmethStart
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵坦莎·月刃|r
    .accept 953 >>接任务: |cRXP_LOOT_亚米萨兰的毁灭|r
    .target Sentinel Tysha Moonblade
    .isQuestAvailable 4811
    .xp >17,1
step
    #season 0
    .goto 1439,42.652,63.145
    >>点击 |cRXP_PICK_The Fall of Ameth'Aran|r
    .complete 953,2 --Read The Fall of Ameth'Aran (1)
    .isOnQuest 953
step << !sod/Warrior/Rogue/Priest
    .goto 1439,42.373,61.815
    >>点击|cRXP_PICK_Ancient Flame|r
    .complete 957,1 --Destroy the seal at the ancient flame (1)
    .isOnQuest 957
step
    #season 0
    #label TheLay
    .goto Darkshore,43.30,58.70
    >>点击 |cRXP_PICK_The Lay of Ameth'Aran|r
    .complete 953,1 --Read The Lay of Ameth'Aran (1)
    .isOnQuest 953
step
    #optional
    #requires Relics
--XXREQ Placeholder invis step until multiple requires per step
step
    #optional
    #requires Anaya
--XXREQ Placeholder invis step until multiple requires per step
step
    #xprate <1.59
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵坦莎·月刃|r
    .turnin 953 >>交任务: |cRXP_FRIENDLY_亚米萨兰的毁灭|r
    .target Sentinel Tysha Moonblade
step << !sod/Warrior/Rogue
    #optional
    #completewith FurbolgGrindEnd
    >>杀死 |cRXP_ENEMY_Foreststrider Fledglings|r。掠夺它们的 |cRXP_LOOT_Strider Meat|r
    >>|cRXP_WARN_小心他们|r |T132307:0|t[逃跑] |cRXP_WARN_at <30% 的健康|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider Fledgling
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith FurbolgGrindEnd
    >>杀死 |cRXP_ENEMY_月夜猎者 Runts|r 和 |cRXP_ENEMY_月夜猎者s|r。掠夺他们的 |cRXP_LOOT_月夜猎者 Fangs|r
    .complete 1002,1 -- 月夜猎者 Fang (6)
    .mob 月夜猎者 Runt
    .mob 月夜猎者
    .isOnQuest 1002
step
    #optional
    #completewith FurbolgGrindEnd
    #season 0
    >>杀死 |cRXP_ENEMY_Rabid Thistle 熊s|r
    >>|cRXP_WARN_当他们施放|r |T135914:0|t[狂犬病] |cRXP_WARN_如果你没有足够快地杀死他们时要小心（即时近战：在 10 分钟内将所有生命值恢复降低 50%）|r
    .complete 2138,1 -- Rabid Thistle 熊 slain (20)
    .mob Rabid Thistle 熊
step << Warrior/Rogue
    #optional
    #completewith LateTurtleStart
    #season 2
    >>杀死 |cRXP_ENEMY_Rabid Thistle 熊s|r
    >>|cRXP_WARN_当他们施放|r |T135914:0|t[狂犬病] |cRXP_WARN_如果你没有足够快地杀死他们时要小心（即时近战：在 10 分钟内将所有生命值恢复降低 50%）|r
    .complete 2138,1 -- Rabid Thistle 熊 slain (20)
    .mob Rabid Thistle 熊
step << Priest
    #season 2
    .goto Darkshore,42.0,66.6
    .goto Darkshore,42.0,64.5,0
    .goto Darkshore,42.0,68.2,0
    .goto Darkshore,38.7,68.0,0
    .goto Darkshore,38.7,66.3,0
    .goto Darkshore,38.7,64.5,0
    >>完成击杀 |cRXP_ENEMY_Rabid Thistle 熊s|r
    >>|cRXP_WARN_当他们施放|r |T135914:0|t[狂犬病] |cRXP_WARN_如果你没有足够快地杀死他们时要小心（即时近战：在 10 分钟内将所有生命值恢复降低 50%）|r
    .complete 2138,1 -- Rabid Thistle 熊 slain (20)
    .mob Rabid Thistle 熊
step << !sod/Warrior/Rogue/Priest
    #label LateTurtleStart
    .goto 1439,37.105,62.167
    >>点击 |cRXP_PICK_Beached Sea Turtle|r
    .accept 4722 >>接任务: |cRXP_LOOT_搁浅的海龟|r
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
    >>杀死 |cRXP_ENEMY_黑木探路者s|r 和 |cRXP_ENEMY_黑木风语者s|r
    .complete 985,1 -- 黑木探路者 (8)
    .mob +黑木探路者
    .complete 985,2 -- 黑木风语者 (5)
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
    .xp 15+11875 >>升级至 11875+/14400xp
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
    .xp 15+11000 >>升级至 11000+/14400xp
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
    .xp 15+600 >>升级至 600+/14400xp
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
    .xp 14+12210 >>升级至 12210+/12900xp
    .mob 黑木探路者
    .mob 黑木风语者
    .itemcount 5382,1 --Anaya's Pendant (1)
step << !sod/Warrior/Rogue/Priest
    #label FurbolgGrindEnd
    #completewith TOTH
    #optional
    .goto 1439,36.701,45.122
    .subzone 442 >>返回奥伯丁
    .isOnQuest 4722
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_温尼斯·布莱葛|r
    .turnin 4722 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .turnin 4723 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .target Gwennyth Bly'Leggonde
    .isOnQuest 4723
step << !sod/Warrior/Rogue/Priest
    #xprate >1.49
    #optional << NightElf !Hunter
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_温尼斯·布莱葛|r
    .turnin 4722 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .turnin 4723 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r << Warrior sod
    .target Gwennyth Bly'Leggonde
step
    #season 0 << !Warrior !Rogue
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_古博·布拉普|r
    .accept 1138 >>接任务: |cRXP_LOOT_海中的水果|r
    .target Gubber Blump
step << !sod/Warrior/Rogue/Priest
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >>返回码头上的 |cRXP_FRIENDLY_Cerellean Whiteclaw|r
step << !sod/Warrior/Rogue/Priest
    #optional
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞瑞利恩·白爪|r
    >>|cRXP_WARN_如果有人刚刚提交，你可能需要等待他的 RP|r
    .turnin 963 >>交任务: |cRXP_FRIENDLY_永志不渝|r
    .target Cerellean Whiteclaw
    .isQuestComplete 963
step
    #season 0
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    .turnin 4811 >>交任务: |cRXP_FRIENDLY_红色水晶|r
    .accept 4812 >>接任务: |cRXP_LOOT_清洗水晶|r
    .target Sentinel Glynda Nal'Shea
    .isOnQuest 4811
step << !sod/Warrior/Rogue/Priest
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    .turnin 4812 >>交任务: |cRXP_FRIENDLY_清洗水晶|r
    .target Sentinel Glynda Nal'Shea
    .isQuestComplete 4812
step
    #season 0
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_使用|r |T134865:0|t[空水管]|cRXP_WARN_at Auberdine 月亮井|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338
step << !sod/Warrior/Rogue/Priest
    #optional
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨纳瑞恩·绿树|r
    .turnin 2138 >>交任务: |cRXP_FRIENDLY_清除疫病|r
    .accept 2139 >>接任务: |cRXP_LOOT_萨纳瑞恩的希望|r
    .target 萨纳利恩护树人
    .isQuestComplete 2138
step << !sod/Warrior/Rogue/Priest
    #optional
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨纳瑞恩·绿树|r
    .accept 2139 >>接任务: |cRXP_LOOT_萨纳瑞恩的希望|r
    .target 萨纳利恩护树人
    .isQuestTurnedIn 2138
step << !sod/Warrior/Rogue/Priest
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特伦希斯|r
    .turnin 985 >>交任务: |cRXP_FRIENDLY_熊怪的威胁|r
    .accept 986 >>接任务: |cRXP_LOOT_丢失的主人|r << !sod
    .target Terenthis
step << !sod/Warrior/Rogue/Priest
    #optional
    #completewith next
    .goto 1439,39.280,43.121,6,0
    .goto 1439,39.162,43.194,6 >>上楼去
step << !sod/Warrior/Rogue/Priest
    .goto 1439,39.043,43.555
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵艾莉萨·星风|r, 他在楼上
    .accept 965 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Sentinel Elissa Starbreeze


----Start of SoD Priest early level 18 wand quest + 冥想探索绕行----

step << Priest
    #season 2
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿斯特利安|r
    .turnin 957 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .isOnQuest 957
    .target Asterion
step << Priest
    #season 2
    #sticky
    #label Blackwood1
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,50.66,34.94
    >>打开 |cRXP_PICK_黑木谷物商店|r。获取 |T134939:0|t|cRXP_LOOT_[黑木谷物样本]|r
    >>|cRXP_WARN_抢劫此物品会生成 2 个 |cRXP_ENEMY_Blackwood Furbolgs|r，它们会愤怒地向你跑来。准备好与它们战斗或重置它们|r
    >>|cRXP_WARN_如果您看到 |cRXP_ENEMY_Xabraxxis|r 在聊天中大喊大叫或看到有人与他战斗，请帮助他们。打开 |cRXP_PICK_Xabraxxis 的恶魔包|r 他掉在地上。将其拾取以获得|r |cRXP_LOOT_腐化护身符|r
    .collect 12342,1,4763,1 -- Blackwood Grain Stores (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)
step << Priest
    #season 2
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>杀死 |cRXP_ENEMY_Den Mother|r
    >>|cRXP_WARN_请注意 |cRXP_ENEMY_Thistle Cubs|r 可以让你昏迷 2 秒|r
    .complete 2139,1 --Den Mother (1)
    .mob Den Mother
step << Priest
    #season 2
    #sticky
    #requires Blackwood1
    #label Blackwood2
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,51.83,33.50
    >>打开|cRXP_PICK_黑木坚果商店|r。获取|T133944:0|t|cRXP_LOOT_[黑木坚果样本]|r
    >>|cRXP_WARN_抢劫此物品会生成 2 个 |cRXP_ENEMY_Blackwood Furbolgs|r，它们会愤怒地向你跑来。准备好与它们战斗或重置它们|r
    >>|cRXP_WARN_如果您看到 |cRXP_ENEMY_Xabraxxis|r 在聊天中大喊大叫或看到有人与他战斗，请帮助他们。打开 |cRXP_PICK_Xabraxxis 的恶魔包|r 他掉在地上。将其拾取以获得|r |cRXP_LOOT_腐化护身符|r
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
    >>打开 |cRXP_PICK_黑木水果店|r。获取 |T134013:0|t|cRXP_LOOT_[黑木水果样本]|r
    >>|cRXP_WARN_抢劫此物品会生成 2 个 |cRXP_ENEMY_Blackwood Furbolgs|r，它们会愤怒地向你跑来。准备好与它们战斗或重置它们|r
    >>|cRXP_WARN_如果您看到 |cRXP_ENEMY_Xabraxxis|r 在聊天中大喊大叫或看到有人与他战斗，请帮助他们。打开 |cRXP_PICK_Xabraxxis 的恶魔包|r 他掉在地上。将其拾取以获得|r |cRXP_LOOT_腐化护身符|r
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
    .cast 16072 >>|cRXP_WARN_使用|r |T134712:0|t[装满的清洁碗] |cRXP_WARN_at |cRXP_PICK_Bonfire|r召唤|r |cRXP_ENEMY_Xabraxxis|r
    .timer 17,The Blackwood Corrupted RP
    .use 12347
step << Priest
    #season 2
    #requires Blackwood3
    #label Xabraxxis
    .goto Darkshore,52.38,33.39
    >>杀死 |cRXP_ENEMY_Xabraxxis|r。打开 |cRXP_PICK_Xabraxxis 的恶魔包|r，他掉落在地上。拾取它以获得 |cRXP_LOOT_腐化护身符|r
    .use 12347
    .complete 4763,1 -- Talisman of Corruption (1)
    .mob Xabraxxis
step << Priest
    #season 2
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴苏尔·影击|r
    .turnin 965 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 966 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Balthule Shadowstrike
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
    >>杀死 |cRXP_ENEMY_Dark Strand Fanatics|r。掠夺他们的 |cRXP_LOOT_Worn Parchments|r
    .complete 966,1 --Worn Parchment (4)
    .mob Dark Strand Fanatic
step << Priest
    #season 2
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴苏尔·影击|r
    .turnin 966 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 967 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Balthule Shadowstrike
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
    .xp 18 >>升级到 18 级。|cRXP_WARN_如果你离它很远，你可以使用纳迦蘑菇洞穴注销并跳转到奥伯丁并提交任务|r
step << Priest
    #season 2
    #optional
    #completewith next
    .hs >>达纳苏斯之炉
    .zoneskip Darnassus
step << Priest
    .goto Darnassus,37.90,82.74
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贾德莉亚|r
    .trainer >>训练你的职业法术
    .target Jandria
step << Priest
    .goto Darnassus,37.90,82.74
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maethra Slagheart|r
    .accept 78192 >>接受光的秘密
    .target Maethra Slagheart
step << Priest
    #season 2
    #sticky
    #completewith next
    .goto 1457,29.179,41.180
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
step << Priest
    #season 2
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尼莎·影歌|r
    .turnin 6343 >>交任务: |cRXP_FRIENDLY_飞回泰达希尔|r
    .target Nessa Shadowsong
step << Priest
    #season 2
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维斯派塔斯|r
    .fly Darkshore >>飞往黑海岸
    .target Vesprystus
    .zoneskip Darkshore
step << Priest
    #season 2
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨纳瑞恩·绿树|r
    .turnin 2139 >>交任务: |cRXP_FRIENDLY_萨纳瑞恩的希望|r
    .target 萨纳利恩护树人
step << Priest
    #season 2
    #label BlackwoodSod
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 4763,1 >>交任务: |cRXP_FRIENDLY_黑木熊怪的堕落|r
    .target Thundris Windweaver
step << Priest
    #season 2
    #optional
    #completewith Beached披风
    .destroy 12342 >>摧毁: |cRXP_ENEMY_黑木谷物|r, 它在你的背包中. 不再需要它了
step << Priest
    #season 2
    #optional
    #completewith Beached披风
    .destroy 12343 >>摧毁: |cRXP_ENEMY_黑木坚果|r, 它在你的背包中. 不再需要它了
step << Priest
    #season 2
    #optional
    #completewith Beached披风
    .destroy 12341 >>摧毁: |cRXP_ENEMY_黑木水果|r, 它在你的背包中. 不再需要它了
step << Priest
    #season 2
    #completewith next
    +|cRXP_WARN_装备|r |T135469:0|t[月光石魔杖]
    .use 15204
    .itemcount 15204,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.61

----End of SoD Priest early level 18 wand quest + 冥想探索绕行----


step << !Hunter
    #season 0 << Druid/Priest
    #season 2 << Warrior/Rogue
    #optional
    #completewith Level10CookEnd
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高尔博德·钢手|r
    .vendor 6301 >>|cRXP_BUY_从他那里购买|r |T134059:0|t[温和香料] |cRXP_BUY_直到你拥有|r |T134059:0|t[温和香料] |cRXP_BUY_等于或大于|r |T132832:0|t[小鸡蛋] |cRXP_BUY_你目前拥有的数量|r
    .collect 2678,50,90,1,0x20,cooking --Mild Spices (1-50)
    .disablecheckbox
    .collect 6889,50,90,1,0x20,cooking --Small Egg (1-50)
    .disablecheckbox
    .target Gorbold Steelhand
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .itemcount 6889,1 -- Small Egg (1+)
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高尔博德·钢手|r
    .accept 982 >>接任务: |cRXP_LOOT_深不可测的海洋|r
    .target Gorbold Steelhand
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高尔博德·钢手|r
    .turnin 982 >>交任务: |cRXP_FRIENDLY_深不可测的海洋|r
    .target Gorbold Steelhand
    .isQuestComplete 982
step
    #label Level10CookEnd
    .goto 1439,37.511,41.670
    >>|cRXP_WARN_前往地面上的 |cRXP_PICK_Campfire|r|r
    +|cRXP_WARN_开始|r |T133971:0|t[烹饪] |T132834:0|t[香草烤鸡蛋]|cRXP_WARN_。一直这样做，直到你的|r |T133971:0|t[烹饪] |cRXP_WARN_达到至少 10 级|r
    >>|cRXP_WARN_继续升级你的|r |T133971:0|t[烹饪] |cRXP_WARN_直到你用完|r |T132832:0|t[小鸡蛋] << !sod
    >>|cRXP_WARN_稍后暮色森林有一个任务，要求你的|r |T133971:0|t[烹饪] |cRXP_WARN_达到 50 或更高。你很快上船时也可以烹饪这个|r << !sod
    .skill cooking,50,1
    .itemcount 6889,1 -- Small Egg (1+)
step
    #optional
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥兰达利亚·夜歌|r
    .accept 2178 >>接任务: |cRXP_LOOT_炖陆行鸟|r
    .turnin 2178 >>交任务: |cRXP_FRIENDLY_炖陆行鸟|r
    .target Alanndarian Nightsong
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
step << !sod/Rogue
    #label TOTH
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 958 >>交任务: |cRXP_FRIENDLY_上层精灵的工具|r << !sod
    .turnin 4762 >>交任务: |cRXP_FRIENDLY_壁泉河|r << sod
    .accept 4763 >>接任务: |cRXP_LOOT_黑木熊怪的堕落|r << sod
    .target Thundris Windweaver
    .isQuestComplete 958

----End of small south loop for ERA and SoD Warrior/Rogue/Priest----


step
    #season 0 << !Warrior !Rogue
    #label BashalEnd
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿斯特利安|r
    .turnin 957 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .isOnQuest 957
    .target Asterion
step
    #optional
    #season 0 << !Warrior !Rogue
    #completewith CrabTurtle
    >>杀死 |cRXP_ENEMY_Rabid Thistle 熊s|r
    >>|cRXP_WARN_当他们施放|r |T135914:0|t[狂犬病] |cRXP_WARN_如果你没有足够快地杀死他们时要小心（即时近战：在 10 分钟内将所有生命值恢复降低 50%）|r
    .complete 2138,1 -- Rabid Thistle 熊 slain (20)
    .mob Rabid Thistle 熊
step
    #optional
    #season 0 << !Warrior !Rogue
    #completewith CrabTurtle
    >>杀死 |cRXP_ENEMY_Foreststrider Fledglings|r 和 |cRXP_ENEMY_Foreststriders|r。掠夺他们的 |cRXP_LOOT_Strider Meat|r
    >>|cRXP_WARN_小心|r |cRXP_ENEMY_Foreststrider Fledglings|r |T132307:0|t[逃跑] |cRXP_WARN_at <30% 生命值|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider Fledgling
    .mob Foreststrider
step
    #label CrabTurtle
    #season 0 << !Warrior !Rogue
    .goto Darkshore,44.18,20.60
    >>点击 |cRXP_PICK_Beached Sea Turtle|r
    .accept 4725 >>接任务: |cRXP_LOOT_搁浅的海龟|r
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
    >>杀死 |cRXP_ENEMY_Reef Crawlers|r。掠夺他们的 |cRXP_LOOT_Fine Crab Chunks|r
    >>如果你得到了不错的掉落，可以考虑跳过一些 17 级的任务。|cRXP_WARN_你不必现在完成这个任务|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob Reef Crawler
step
    .goto Darkshore,50.81,25.50
    #season 0 << !Warrior !Rogue
    >>|cRXP_WARN_使用|r |T134865:0|t[空采样管]|cRXP_WARN_位于 Cliffspring 河底部|r
    .complete 4762,1 --Cliffspring River Sample (1)
    .use 12350
----Start of Hunter/Druid 1x and SoD Warrior/Rogue early Althalaxx section (for money+xp）----


step << Hunter/Druid/Warrior/Rogue
	#xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    #optional
    #completewith Tower1
    >>杀死 |cRXP_ENEMY_Rabid Thistle 熊s|r
    >>|cRXP_WARN_当他们施放|r |T135914:0|t[狂犬病] |cRXP_WARN_如果你没有足够快地杀死他们时要小心（即时近战：在 10 分钟内将所有生命值恢复降低 50%）|r
    .complete 2138,1 -- Rabid Thistle 熊 slain (20)
    .mob Rabid Thistle 熊
step << Hunter/Druid/Warrior/Rogue
	#xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    #optional
    #completewith Tower1
    >>杀死 |cRXP_ENEMY_Foreststriders|r。掠夺他们的 |cRXP_LOOT_Strider Meat|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider
step << Hunter/Druid/Warrior/Rogue
#xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    #optional
    #completewith Tower1
    >>杀死 |cRXP_ENEMY_月夜猎者s|r。掠夺他们的 |cRXP_LOOT_月夜猎者 Fangs|r
    .complete 1002,1 -- 月夜猎者 Fang (6)
    .mob 月夜猎者
    .isOnQuest 1002
step << Hunter/Druid/Warrior/Rogue
#xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    #optional
    #completewith Tower1
    .goto 1439,51.118,23.670,20,0
    .goto 1439,51.490,24.368,30,0
    .goto 1439,54.973,24.885,15 >>前往 |cRXP_FRIENDLY_Balthule Shadowstrike|r
    .isQuestAvailable 1002 << !NightElf/Hunter
step << Hunter/Druid/Warrior/Rogue
#xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    #label Tower1
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴苏尔·影击|r
    .turnin 965 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 966 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Balthule Shadowstrike
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
    >>杀死 |cRXP_ENEMY_Dark Strand Fanatics|r。掠夺他们的 |cRXP_LOOT_Worn Parchments|r
    .complete 966,1 --Worn Parchment (4)
    .mob Dark Strand Fanatic
step << Hunter/Druid/Warrior/Rogue
#xprate <1.5 << Hunter/Druid
    #season 2 << Warrior/Rogue
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴苏尔·影击|r
    .turnin 966 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 967 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Balthule Shadowstrike
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
    >>杀死 |cRXP_ENEMY_Foreststriders|r。掠夺他们的 |cRXP_LOOT_Strider Meat|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider

----End of Hunter/Druid 1x and SoD Warrior early Althalaxx section (for money+xp）----

step
    #optional
    #completewith CliffCave
    #season 0 << !Warrior !Rogue
    >>杀死 |cRXP_ENEMY_Rabid Thistle 熊s|r
    >>|cRXP_WARN_当他们施放|r |T135914:0|t[狂犬病] |cRXP_WARN_如果你没有足够快地杀死他们时要小心（即时近战：在 10 分钟内将所有生命值恢复降低 50%）|r
    .complete 2138,1 -- Rabid Thistle 熊 slain (20)
    .mob Rabid Thistle 熊
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith CliffCave
    >>杀死 |cRXP_ENEMY_月夜猎者s|r。掠夺他们的 |cRXP_LOOT_月夜猎者 Fangs|r
    .complete 1002,1 -- 月夜猎者 Fang (6)
    .mob 月夜猎者
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
    >>杀死 |cRXP_ENEMY_Foreststriders|r。掠夺他们的 |cRXP_LOOT_Strider Meat|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider
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
    >>杀死 |cRXP_ENEMY_Foreststriders|r。掠夺他们的 |cRXP_LOOT_Strider Meat|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider
step
    #optional
	#xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,51.288,24.554
    >>点击地面上的 |cRXP_PICK_Buzzbox 323|r
    .turnin 1002 >>交任务: |cRXP_FRIENDLY_传声盒323号|r
    .accept 1003 >>接任务: |cRXP_LOOT_传声盒525号|r
    .isQuestComplete 1002
    .subzoneskip 456,1 --Only turnin if you're nearby (Cliffspring River)
step
    #optional
    #completewith next
    #season 0 << !Warrior !Rogue
    #label CliffCave
    .goto 1439,54.934,32.721,20,0
    .goto 1439,55.108,33.600,40 >>前往悬崖泉河洞穴
step << Druid
    .goto Darkshore,54.99,33.41
    #season 0
    >>|cRXP_WARN_使用|r |T134776:0|t[空的 Cliffspring Falls Sampler] |cRXP_WARN_在 Cliffspring River Cave 入口处的水中|r
    .complete 6122,1 --Filled Cliffspring Falls Sampler (1)
step << Warrior
    #season 1 -- not loading for now
    #optional
    #sticky
    #label EndlessRage
    .goto Darkshore,55.40,36.05,0,0
    >>杀死 |cRXP_ENEMY_Lady Sedorax|r。掠夺她以获得 |T132347:0|t[|cRXP_FRIENDLY_无尽愤怒符文|r]
    >>|cRXP_ENEMY_Lady Sedorax|r |cRXP_WARN_是 18 级精英怪，周围还有其他怪物。你也可以选择从 Westfall 那里获取它，这要容易得多|r
    >>|cRXP_WARN_在一般聊天 (/1) 中请求与其他想要杀死她或可能帮助你的人组队|r
    >>|cRXP_WARN_如果你做不到，请跳过此步骤|r
    .collect 208741,1 -- Rune of Endless Rage (1)
    .unitscan Lady Sedorax
    .train 403489,1
    .group
step << Warrior
    #season 1 -- not loading for now
    #sticky
    #label EndlessRageEnd
    #requires EndlessRage
    #optional
    .train 403489 >>|cRXP_WARN_使用|r |T132347:0|t[|cRXP_FRIENDLY_无尽愤怒符文|r] |cRXP_WARN_进行训练|r |T132347:0|t[无尽愤怒]
    .use 208741
    .itemcount 208741,1
step
    .goto Darkshore,55.45,36.23,12,0
    .goto Darkshore,55.70,36.30,12,0
    .goto Darkshore,55.89,35.40,12,0
    #season 0 << !Warrior !Rogue
    >>拾取地面上的 |cRXP_LOOT_Scaber Stalks|r 和 |cRXP_LOOT_Death Cap|r
    >>|cRXP_WARN_留在上部。如果顶部末端没有 |cRXP_LOOT_Death Cap|r，请跳下去并从下面的南房间拿一个|r
    >>|cRXP_WARN_要小心，因为 |cRXP_ENEMY_Stormscale Wave Riders|r 施放|r |T135836:0|t[Aqua Jet] |cRXP_WARN_（远程瞬发：对附近的敌人造成伤害并将其击退） - 确保您不会被撞下洞穴的上层|r
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
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_Jump on top of the rock on the top floor inside the cave. 前往: |cRXP_PICK_丹莫罗|r, 调整你的角色，直到它们看起来像是漂浮起来，然后通过退出并重新登录来执行跳过操作|r
step
    #optional
    #season 0 << !Warrior !Rogue
    #label CavetoAuber
    #completewith CliffspringEnd
    .subzone 442 >>前往奥伯丁

----Start of SoD 250% xp buff early southern Darkshore one loop----

step << Warrior/Rogue
    #label CliffspringEnd
    #season 2
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 4762 >>交任务: |cRXP_FRIENDLY_壁泉河|r
    .accept 4763 >>接任务: |cRXP_LOOT_黑木熊怪的堕落|r
    .target Thundris Windweaver
step << Warrior/Rogue
    #season 2
    .goto 1439,37.511,41.670
    >>|cRXP_WARN_前往地面上的 |cRXP_PICK_Campfire|r|r
    +|cRXP_WARN_开始|r |T133971:0|t[烹饪] |T132834:0|t[香草烤鸡蛋]|cRXP_WARN_。一直这样做，直到你的|r |T133971:0|t[烹饪] |cRXP_WARN_达到至少 10 级|r
    >>|cRXP_WARN_继续升级你的|r |T133971:0|t[烹饪] |cRXP_WARN_直到你用完|r |T132832:0|t[小鸡蛋] << !sod
    >>|cRXP_WARN_稍后暮色森林有一个任务，要求你的|r |T133971:0|t[烹饪] |cRXP_WARN_达到 50 或更高。你很快上船时也可以烹饪这个|r << !sod
    .skill cooking,50,1
    .itemcount 6889,1 -- Small Egg (1+)
    .isQuestAvailable 2178
step << Warrior/Rogue
    #season 2
    #optional
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥兰达利亚·夜歌|r
    .accept 2178 >>接任务: |cRXP_LOOT_炖陆行鸟|r
    .turnin 2178 >>交任务: |cRXP_FRIENDLY_炖陆行鸟|r
    .target Alanndarian Nightsong
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
    .isQuestAvailable 2178
step << !Druid
    #season 2
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_考古学家霍莉|r
    .accept 729 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Archaeologist Hollee
step
    #season 2
    .goto Darkshore,37.70,43.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    >>|cRXP_WARN_选择|r |T135641:0|t[Curvewood Dagger] |cRXP_WARN_因为您应该尝试保存|r |T135641:0|t[Dagger] |cRXP_WARN_以供|r |T132290:0|t[Poisons] |cRXP_WARN_稍后完成任务|r << Rogue
    .turnin 4813 >>交任务: |cRXP_FRIENDLY_水晶中的碎骨|r << !Hunter !Druid
    .turnin 4813,3 >>交任务: |cRXP_FRIENDLY_水晶中的碎骨|r << Hunter/Druid
    .target Sentinel Glynda Nal'Shea
    .isQuestTurnedIn 4811
step
    #season 2
    .goto Darkshore,37.78,44.06
    >>|cRXP_WARN_使用|r |T133748:0|t[空的清洁碗]|cRXP_WARN_at奥伯丁月亮井|r
    .collect 12347,1,4763,1 --Filled Cleansing Bowl (1)
    .use 12346
    .isOnQuest 4763
step << Warrior/Rogue
    #season 2
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴瑞萨斯·月影|r
    .turnin 947 >>交任务: |cRXP_FRIENDLY_洞中的蘑菇|r
    .accept 948 >>接任务: |cRXP_LOOT_安努|r
    .target Barithras Moonshade
step
    #season 2
    .goto Darkshore,37.21,44.22
    >>点击|cRXP_PICK_通缉海报|r
    .accept 4740 >>接任务: |cRXP_LOOT_通缉：莫克迪普！|r
step << Druid/Priest
    #season 2
    .goto Ashenvale,36.99,49.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板基姆利雅|r
    .home >>将你的炉石设置为阿斯特兰纳
    .target Innkeeper Kimlya
step << Warrior/Rogue
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_温尼斯·布莱葛|r
    .turnin 4725 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .target Gwennyth Bly'Leggonde
    .isOnQuest 4725
step << Druid/Hunter
    #season 2
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_古博·布拉普|r
    .accept 1138 >>接任务: |cRXP_LOOT_海中的水果|r
    .target Gubber Blump
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
    >>杀死 |cRXP_ENEMY_黑木探路者s|r 和 |cRXP_ENEMY_黑木风语者s|r。掠夺他们的 |T237270:0|t[|cRXP_LOOT_Crab Treats|r]
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
    .use 209027 >>|cRXP_WARN_对 |cRXP_ENEMY_Young Reef Crawler|r 使用|r |T237270:0|t[|cRXP_LOOT_Crab Treats|r] |cRXP_WARN_来获得|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Lacerate|r]
    .collect 208687,1 -- Rune of Lacerate (1)
    .target Young Reef Crawler
    .train 416049,1
step << Druid
    #season 2
    #sticky
    #label Treats3
    #requires Treats2
    .train 416049 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r] |cRXP_WARN_训练|r |T132131:0|t[撕裂]
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
    >>杀死 |cRXP_ENEMY_黑木探路者s|r 和 |cRXP_ENEMY_黑木风语者s|r
    .complete 985,1 -- 黑木探路者 (8)
    .mob +黑木探路者
    .complete 985,2 -- 黑木风语者 (5)
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
    >>杀死 |cRXP_ENEMY_Anaya Dawnrunner|r。掠夺她的财物 |cRXP_LOOT_Pendant|r
    >>|cRXP_WARN_请注意，她的刷新时间为 7-8 分钟，在 Ameth'Aran 有 4 个不同的刷新点。如果她不在那里，请跳过此任务|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan Anaya Dawnrunner
step << !warrior !Rogue !Priest
    #season 2
    #label SealSoD
    .goto 1439,42.373,61.815
    >>点击|cRXP_PICK_Ancient Flame|r
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
    >>杀死 |cRXP_ENEMY_Anaya Dawnrunner|r。掠夺她的财物 |cRXP_LOOT_Pendant|r
    >>|cRXP_WARN_请注意，她的刷新时间为 7-8 分钟，在 Ameth'Aran 有 4 个不同的刷新点。如果她不在那里，请跳过此任务|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan Anaya Dawnrunner
step << !Priest
    #optional
    #season 2
    #completewith OnuSoD
    >>杀死 |cRXP_ENEMY_狂暴的蓟熊|r。|cRXP_WARN_你不必现在完成这个任务，但理想情况下，当你到达 Onu 时，你应该已经杀死了 15 个以上|r
    >>|cRXP_WARN_当他们施放|r |T135914:0|t[狂犬病] |cRXP_WARN_如果你没有足够快地杀死他们时要小心（即时近战：在 10 分钟内将所有生命值恢复降低 50%）|r
    .complete 2138,1 -- Rabid Thistle 熊 slain (20)
    .mob Rabid Thistle 熊
step
    #season 2   
    #completewith OnuSoD
    .goto 1439,43.555,76.293,80 >>前往古树丛林
step    
    #season 2
    #label OnuSoD
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安努|r
    .turnin 952 >>交任务: |cRXP_FRIENDLY_古树之林|r << Warrior/Rogue
    .turnin 948 >>交任务: |cRXP_FRIENDLY_安努|r
    .accept 944 >>接任务: |cRXP_LOOT_主宰之剑|r
    .target Onu
step
    #season 2
    #label MasterG
    .goto Darkshore,38.54,86.05,100 >>前往主宰者之刃
    .subzoneskip 449
    .isOnQuest 944
step
    #season 2
    #optional
    #completewith MasterEnd
    >>杀死 |cRXP_ENEMY_Twilight Disciples|r 和 |cRXP_ENEMY_Twilight Thugs|r。从他们身上搜刮来 |T133743:0|t[|cRXP_LOOT_Book: The Powers Below|r]
    *|cRXP_WARN_Be careful as |cRXP_ENEMY_Twilight Thugs|r can|r |T132343:0|t[Disarm] |cRXP_WARN_you for 6 seconds|r << Rogue/Paladin/Warrior
    *|cRXP_WARN_Be careful as |cRXP_ENEMY_Twilight Disciples|r cast|r |T135953:0|t[Renew] |cRXP_WARN_and a 3 second|r |T135915:0|t[Heal]
    >>|cRXP_WARN_此物品掉落几率极低。不要费尽心思去收集它|r
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .mob Twilight Disciple
    .mob Twilight Thug
--  .use 13536
step
    #optional
    #season 2
    .goto 1439,38.537,86.050
    >>发现大师之刃
    .complete 944,1 --Enter the Master's Glaive (1)
step
    #optional
    #season 2
    #completewith next
    .cast 5809 >>|cRXP_WARN_使用|r |T134715:0|t[占卜之瓶] |cRXP_WARN_并将其放在地上|r
    .use 5251
step
    .goto 1439,38.537,86.050
    #season 2
    >>|cRXP_WARN_点击地面上的 |cRXP_PICK_Scrying Bowl|r|r
    .turnin 944 >>交任务: |cRXP_FRIENDLY_主宰之剑|r
    .accept 949 >>接任务: |cRXP_LOOT_暮光之锤的营地|r
    .use 5251
step
    #label MasterEnd
    #season 2
    .goto 1439,38.537,86.050
    >>点击北基座上的 |cRXP_PICK_Twilight Tome|r
    .turnin 949 >>交任务: |cRXP_FRIENDLY_暮光之锤的营地|r
    .accept 950 >>接任务: |cRXP_LOOT_向安努回复|r
step
    #optional
    #sticky
    #season 2
    .isQuestTurnedIn 949
    .destroy 5251 >>摧毁: |cRXP_ENEMY_占卜之水|r, 它在你的背包中. 不再需要它了
step << !Warrior !Druid !Priest
    .goto 1439,43.555,76.293
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安努|r
    .turnin 950 >>交任务: |cRXP_FRIENDLY_向安努回复|r
    .timer 11.5,Return to Onu RP
--  .timer 14,Return to Onu RP
    .target Onu
step
    #sticky
    #label prospector
    #season 2
    .goto 1439,35.724,83.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_勘察员雷塔维|r
    >>|cRXP_WARN_你可能必须等待他重生或等待其他人完成护送|r
    .turnin 729 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .target Prospector Remtravel
step
    #season 2
    .goto Darkshore,35.72,83.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_勘察员雷塔维|r
    .accept 731,1 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    >>|cRXP_WARN_这个任务非常困难。如果失败，请跳过此步骤|r << !Warrior
    >>|cRXP_WARN_您很可能无法单独完成此任务！|r 我建议不要尝试，除非您可以找到另一个玩家组队 << Warrior
    >>如果失败或无人组队，请跳过此步骤 << Warrior
    .link https://www.twitch.tv/videos/1182180918 >>|cRXP_WARN_点击此处查看视频指南|r << Hunter
    .link https://youtu.be/md926sh3L6U >>|cRXP_WARN_单击此处查看视频演示|r << !Hunter
    .target Prospector Remtravel
step
    #requires prospector
    #season 2
    >>|cRXP_WARN_护送 |cRXP_FRIENDLY_Prospector Remtravel|r 穿过挖掘现场|r
    >>|cRXP_WARN_这个任务非常困难。如果失败，请跳过此步骤|r
    .link https://www.twitch.tv/videos/1182180918 >>|cRXP_WARN_点击此处查看视频指南|r << Hunter
    .complete 731,1
    .isOnQuest 731
step << Druid/Hunter/Warrior
    #sticky
    #completewith CompleteThistle熊s << Hunter/Druid
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
    >>杀死 |cRXP_ENEMY_Encrusted Tide Crawlers|r 和 |cRXP_ENEMY_Reef Crawlers|r。掠夺他们的 |cRXP_LOOT_Fine Crab Chunks|r
    >>|cRXP_WARN_你不必现在就完成这个任务，但理想情况下，你应该在本节结束时至少完成 4 个|r << !Warrior
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Reef Crawler
    .mob Encrusted Tide Crawler
step << !Warrior
    #season 2
    .goto 1439,31.251,87.419
    >>点击 |cRXP_PICK_Beached Sea Creature|r
    .accept 4733 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_这个任务非常困难。逐个攻击 |cRXP_ENEMY_Murlocs|r，否则你可能会同时激怒多个|r
    .link https://www.twitch.tv/videos/992307825?t=05h48m36s >>|cRXP_WARN_点击此处查看视频指南|r << Hunter
step << !Warrior
	#season 2
    .goto 1439,31.229,85.564
    >>点击 |cRXP_PICK_Beached Sea Turtle|r
    .accept 4732 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step << !Warrior
	#season 2
    .goto 1439,31.690,83.700
    >>点击 |cRXP_PICK_Beached Sea Turtle|r
    .accept 4731 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
	#season 2
    .goto 1439,32.644,80.711
    >>点击 |cRXP_PICK_Beached Sea Creature|r
    .accept 4730 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step
    #season 2
    #label SodMurk
    .goto 1439,35.429,76.566,0
    .goto 1439,35.429,76.566,60,0
    .goto Darkshore,36.64,76.53
    >>|cRXP_WARN_确保检查 |cRXP_ENEMY_Murkdeep|r 是否已在水中（如果有人先前遭遇失败或将 |cRXP_ENEMY_Greymist Hunter|r 留在了他一起生成的波浪中并活着）|r
    >>杀死营地中的 |cRXP_ENEMY_Greymist Warriors|r 和 |cRXP_ENEMY_Greymist Hunters|r
    >>|cRXP_WARN_移动到营地中心的篝火处开始 |cRXP_ENEMY_Murkdeep|r 遭遇战：|r
    >>|cRXP_WARN_水中会生成 3 波敌人，每波敌人杀死前一波后生成：第 1 波有 3 个 12-13 级 |cRXP_ENEMY_Greymist Coastrunners|r，第 2 波有 2 个 15-16 级 |cRXP_ENEMY_Greymist Warriors|r，第 3 波有 1 个 19 级 |cRXP_ENEMY_Murkdeep|r 和 1 个 16-17 级 |cRXP_ENEMY_Greymist Hunter|r。你可以远离篝火，以免激怒下一波敌人|r
    .complete 4740,1 -- Murkdeep (1)
    .unitscan Murkdeep
    .mob Greymist Warrior
    .mob Greymist Hunter
    .mob Greymist Coastrunner
step << Warrior
    #season 2
    .goto Darkshore,35.7,73.5
    >>杀死 |cRXP_ENEMY_Encrusted Tide Crawlers|r 和 |cRXP_ENEMY_Reef Crawlers|r。掠夺他们的 |cRXP_LOOT_Fine Crab Chunks|r
    >>|cRXP_WARN_如果附近没有螃蟹，请跳过此步骤|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Reef Crawler
    .mob Encrusted Tide Crawler
step << !Priest
    #season 2
    #label CompleteThistle熊s
    .goto 1439,35.968,70.807
    >>点击 |cRXP_PICK_Beached Sea Creature|r
    .accept 4728 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step << !Priest
    #season 2
    .goto Darkshore,38.9,64.9
    >>完成杀死|cRXP_ENEMY_Rabid Thistle 熊s|r。
    >>|cRXP_WARN_当他们施放|r |T135914:0|t[狂犬病] |cRXP_WARN_如果你没有足够快地杀死他们时要小心（即时近战：在 10 分钟内将所有生命值恢复降低 50%）|r
    .complete 2138,1 -- Rabid Thistle 熊 slain (20)
    .mob Rabid Thistle 熊
step << !Warrior !Rogue !Priest
    #label LateTurtleStart
    .goto 1439,37.105,62.167
    >>点击 |cRXP_PICK_Beached Sea Turtle|r
    .accept 4722 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step << skip -- Hunter
    .goto Darkshore,39.5,55.5
    .xp 19+800 >>一直磨练到 800 经验值，达到 19 级。这样，在完成所有任务后，你将拥有 20 级经验值，可以在达纳苏斯进行训练

----Start of SoD Priest Ashenvale Meditation quest section----


step << Priest
    .goto 1439,43.555,76.293
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安努|r
    .turnin 950 >>交任务: |cRXP_FRIENDLY_向安努回复|r
    .target Onu
step << Priest
    #season 2
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗尼亚·恒影|r
    >>|cRXP_WARN_如果他不在，请跳过此步骤。他可能需要最多 25 分钟才能重生|r
    .accept 5321 >>接任务: |cRXP_LOOT_昏昏欲睡|r
    .target Kerlonian Evershade
step << Priest
    #season 2
    .isOnQuest 5321
    .goto Darkshore,44.38,76.30
    >>打开 |cRXP_PICK_Kerlonian 的宝箱|r。拾取其中的 |T134229:0|t[|cRXP_LOOT_觉醒之角|r]
    .complete 5321,1 -- Horn of Awakening (1)
step << Priest
    #season 2
    #completewith towersod
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .goto Ashenvale,29.7,13.6
step << Priest
    #season 2
    .goto Ashenvale,27.26,35.58
    >>|cRXP_WARN_护送 |cRXP_FRIENDLY_Kerlonian|r 到灰谷的梅斯特拉哨所|r
    .use 13536 >>|cRXP_WARN_每当 |cRXP_FRIENDLY_Kerlonian|r 在他旁边睡着时使用|r |T134229:0|t[|cRXP_LOOT_觉醒号角|r] |cRXP_WARN_|r
    >>|cRXP_WARN_尽量避免在主干道上奔跑。只有当你在路上时才会出现敌人|r
    .complete 5321,2
    .isOnQuest 5321
step << Priest
    #season 2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Liadris Moonriver|r
	.target Liladris Moonriver
    .goto Ashenvale,27.26,35.58
    >>如果你还没有完成任务，请跳过此步骤
    .turnin 5321 >>交任务: |cRXP_FRIENDLY_昏昏欲睡|r
step << Priest
    #season 2
    #label towersod
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_净化者德尔格伦|r
	.target Delgren the Purifier
    .goto Ashenvale,26.19,38.69
    .turnin 967 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
step << Priest
    #season 2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥雷迪尔·阔叶|r
	.target Orendil Broadleaf
    .goto Ashenvale,26.43,38.59
    .accept 1010 >>接任务: |cRXP_LOOT_巴斯兰的头发|r
step << Priest
    #season 2
    #sticky
    #completewith PriestHairSoD
    >>寻找植物包时，杀死 |cRXP_ENEMY_Forsaken Herbalists|r 和 |cRXP_ENEMY_Forsaken Seekers|r
    .complete 78192,1 --Forsaken Herbalist (7)
    .complete 78192,2 --Forsaken Seeker (9)
    .mob Forsaken Herbalist
    .mob Forsaken Seeker
step << Priest
    #season 2
    #label PriestHairSoD
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地面上的 |cRXP_PICK_植物包|r。拾取其中的 |cRXP_LOOT_Bathran 的头发|r
    >>|cRXP_WARN_它们看起来像棕色的小袋子。它们可能很难被发现|r
    .complete 1010,1
    .isOnQuest 1010
step << Priest
    #season 2
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>完成杀死 |cRXP_ENEMY_Forsaken Herbalists|r 和 |cRXP_ENEMY_Forsaken Seekers|r
    .complete 78192,1 --Forsaken Herbalist (7)
    .complete 78192,2 --Forsaken Seeker (9)
    .mob Forsaken Herbalist
    .mob Forsaken Seeker
step << Priest
    #season 2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥雷迪尔·阔叶|r
	.target Orendil Broadleaf
    .goto Ashenvale,26.43,38.59
    .turnin 1010 >>交任务: |cRXP_FRIENDLY_巴斯兰的头发|r
    .accept 1020 >>接任务: |cRXP_LOOT_奥雷迪尔的药剂|r
step << Priest
    #season 2
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黛琳希亚|r
    .fp Astranaar>>获取阿斯特兰纳飞行路线
	.target Daelyshia
step << Priest
    #season 2
    .goto Ashenvale,37.36,51.79
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r
	.target Pelturas Whitemoon
    .turnin 1020 >>交任务: |cRXP_FRIENDLY_奥雷迪尔的药剂|r
step << Priest
    #season 2
    #optional
    #completewith next
    .hs >>哈思至奥伯丁
    >>|cRXP_WARN_如果你的炉石正在冷却，请飞回来|r
    .zoneskip Darkshore
    .subzoneskip 442
step << Priest
    #season 2
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黛琳希亚|r
    .fly Auberdine >>飞回奥伯丁
	.target Daelyshia


----End of SoD Priest Ashenvale Meditation quest section----


step
    #season 2
    #completewith CleansingTharnariunSod
    .subzone 442 >>前往奥伯丁
step
    .goto 1439,36.621,45.596
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_温尼斯·布莱葛|r
    .turnin 4722 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .turnin 4728 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r << !Priest
    .turnin 4730 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .turnin 4731 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r << !Warrior
    .turnin 4732 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r << !Warrior
    .turnin 4733 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r << !Warrior
    .target Gwennyth Bly'Leggonde
step << Warrior
    .goto Darkshore,36.096,44.931
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_古博·布拉普|r
    .turnin 1138 >>交任务: |cRXP_FRIENDLY_海中的水果|r
    .target Gubber Blump
    .isQuestComplete 1138
step << !Warrior !Rogue !Priest
    #optional
    #completewith next
    #season 2
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >>返回码头上的 |cRXP_FRIENDLY_Cerellean Whiteclaw|r
step << !Warrior !Rogue !Priest
    #optional
    #season 2
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞瑞利恩·白爪|r
    >>|cRXP_WARN_如果有人刚刚提交，你可能需要等待他的 RP|r
    .turnin 963 >>交任务: |cRXP_FRIENDLY_永志不渝|r
    .target Cerellean Whiteclaw
    .isQuestComplete 963
step
    .goto 1439,37.703,43.393
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r
    .turnin 4740 >>交任务: |cRXP_FRIENDLY_通缉：莫克迪普！|r
    .target Sentinel Glynda Nal'Shea
step << !Priest
    #label CleansingTharnariunSod
    #season 2
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨纳瑞恩·绿树|r
    .turnin 2138 >>交任务: |cRXP_FRIENDLY_清除疫病|r
    .accept 2139 >>接任务: |cRXP_LOOT_萨纳瑞恩的希望|r
    .target 萨纳利恩护树人
step << !Warrior !Rogue !Priest
    #season 2
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特伦希斯|r
    .turnin 985 >>交任务: |cRXP_FRIENDLY_熊怪的威胁|r
    .target Terenthis
step << !Warrior !Rogue !Priest
    #season 2
    .goto 1439,39.043,43.555
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵艾莉萨·星风|r, 他在楼上
    .accept 965 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Sentinel Elissa Starbreeze
step
    .goto 1439,37.439,41.839
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_考古学家霍莉|r
    .turnin 731 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .accept 741 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Archaeologist Hollee
    .isQuestComplete 731
step << Druid
    #season 2
    #optional
    #completewith Buzzbox323End
    .abandon 6123 >>放弃采集解药
step
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莱尔德|r
    .accept 6343 >>接任务: |cRXP_LOOT_飞回泰达希尔|r
    .target Laird
    .isQuestComplete 741 << Rogue sod
step << NightElf
    #season 2
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯莱斯·月羽|r
    .fly Teldrassil >>飞往泰达希尔
    .target Caylais Moonfeather
    .isQuestComplete 741 << Rogue
step << NightElf
    #season 2 << !sod Priest
    #season 1 << sod Priest
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尼莎·影歌|r
    .turnin 6343 >>交任务: |cRXP_FRIENDLY_飞回泰达希尔|r
    .target Nessa Shadowsong
    .isQuestComplete 741 << Rogue sod
step << !NightElf
    #season 2
    .goto 1439,33.169,40.179,15 >>前往达纳苏斯船的码头
step << !NightElf
    #season 2
    .goto 1439,33.213,39.883
    >>|cRXP_WARN_如果需要，请在等待前往米奈希尔港的船时升级你的|r |T135966:0|t[急救] |cRXP_WARN_|r << Warrior/Paladin/Rogue
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
    .zoneskip Stormwind City << Warrior
    .zoneskip Ironforge << Warrior
    .zoneskip Darnassus
    .dungeon !DM << !Dwarf/!Hunter
step << !Druid
    #completewith next
    #season 2
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Warrior
    #season 2
    .goto Darnassus,58.76,44.48
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿瑞耶尔·天影|r
    >>|cRXP_BUY_购买并装备 a|r |T135157:0|t[长杖]
    .collect 928,1
    .target Ariyell Skyshadow
    .money <0.9860
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.16 
step << Warrior
    #season 2
    #completewith next
    +|cRXP_WARN_装备|r |T135157:0|t[长杖]
    .use 928
    .itemcount 928,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.16
step << Warrior
    .goto Darnassus,58.72,34.92
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿雷亚斯塔·刃歌|r
    .trainer >>训练你的职业法术
    .target Arias'ta Bladesinger
step << Hunter
    #season 2
    .goto Darnassus,40.38,8.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖卡斯特|r
    >>|cRXP_WARN_确保训练后你还剩下 70 银币。你需要它来买弓|r
    .trainer >>训练你的职业法术
    .target Jocaste
step << Hunter
    #season 2
    .goto Teldrassil,23.70,64.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_首席考古学家杜瑟·灰胡|r
    .turnin 741 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .accept 942 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Chief Archaeologist Greywhisker
    .isQuestComplete 741
step << Hunter
    #completewith startSoD
    #label RecruveReinforcedSoD
    #season 2
    .goto Darnassus,63.27,66.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_兰德瑞亚|r
    >>|cRXP_WARN_购买 a|r |T135489:0|t[重型反曲弓]
    >>|cRXP_WARN_库存增加|r |T132382:0|t[锐箭]
    .collect 3027,1
    .target Landria
    .money <0.3812
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.50
step << Hunter
    #requires RecruveReinforcedSoD
    #completewith next
    #season 2
    +|cRXP_WARN_装备|r |T135489:0|t[重型反曲弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.19
    .xp <20,1
step << Rogue
    >>进入塞纳里奥飞地
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞尤娜|r
    .goto Darnassus,31.84,16.69,15,0
    .goto Darnassus,37.00,21.92
    >>|cRXP_WARN_确保训练后你至少还剩下 1 金 30 银。你需要它来购买武器|r
    .trainer >>训练你的职业法术
    .target Syurna
    .isQuestComplete 741
step << Rogue
    #season 2
    .goto Darnassus,58.76,44.48
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿瑞耶尔·天影|r
    >>|cRXP_BUY_购买并装备两把|r |T135342:0|t[Kris] 匕首
    .collect 2209,2
    .target Ariyell Skyshadow
    .money <0.9860
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93 
    .isQuestComplete 741
step << Rogue
    #season 2
    #completewith next
    +|cRXP_WARN_装备两把|r |T135342:0|t[Kris] 匕首
    .use 2209
    .itemcount 2209,2
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
step << !Druid !Hunter
    #season 2
    .goto Teldrassil,23.70,64.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_首席考古学家杜瑟·灰胡|r
    .turnin 741 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .accept 942 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Chief Archaeologist Greywhisker
    .isQuestComplete 741
step << Priest
    .goto Darnassus,37.90,82.74
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贾德莉亚|r
    .trainer >>训练你的职业法术
    .target Jandria
step << Priest
    .goto Darnassus,37.90,82.74
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maethra Slagheart|r
    .turnin 78192 >>交出光之秘密
    .accept 78193 >>接受光的秘密 
    .target Maethra Slagheart
step << !Druid !Hunter
    #season 2
    .hs >>哈思至奥伯丁
    >>|cRXP_WARN_如果你的炉石正在冷却，请飞回来|r
    .zoneskip Darkshore
    .subzoneskip 442
    .isQuestComplete 741 << Rogue
    .cooldown item,6948,>0,1
step << !Druid !Hunter
    #season 2
    #label startSoD
    #sticky
    #completewith next
    .goto 1457,29.179,41.180
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
    .isQuestComplete 741 << Rogue
step << !Druid !Hunter
    #season 2
    #label FlyAuberdineSoD
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维斯派塔斯|r
    .fly Darkshore >>飞往黑海岸
    .target Vesprystus
    .zoneskip Darkshore
    .isQuestComplete 741 << Rogue

----Start of Druid/Hunter Quest+赛季服符文部分----


step << Druid
    #optional
    #season 2
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛斯雷·驭熊者|r
    .turnin 6001 >>交任务: |cRXP_FRIENDLY_身心之力|r
    .accept 26 >>接任务: |cRXP_LOOT_必修的课程|r
    .trainer >>训练你的职业法术
    >>您很快就会获得大量强大的猫符文，让猫野性成为更快的升级方法 |cRXP_WARN_Respec 您的天赋从平衡到野性|r（如果您愿意）。如果您尽快获得猫形态的移动速度天赋，它将为您节省大量奔跑时间。
    .target Mathrengyl 熊walker
    .isQuestComplete 6001
step << Druid
    #season 2
    .goto Teldrassil,23.70,64.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_首席考古学家杜瑟·灰胡|r
    .turnin 741 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .accept 942 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Chief Archaeologist Greywhisker
step << Druid/Hunter
    #season 2
    #optional
    #completewith next
    +你现在将前往泰达希尔获取|T133816:0|t[雕刻手套 - 裂伤] << Druid
    +你现在将前往泰达希尔获取|T236178:0|t[爆炸射击] << Hunter
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
step << Druid/Hunter
    #season 2
    #optional
    .goto 1438,40.411,54.076
    .subzone 141 >>前往: |cRXP_PICK_泰达希尔|r
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
    .subzone 262 >>进入班奈希尔古墓
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
    .goto 1438,45.118,57.701,20 >>前往 |cRXP_ENEMY_Rageclaw|r 内部
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
    >>在最底层杀死 |cRXP_ENEMY_Rageclaw|r。从他身上搜刮 |T136061:0|t|cRXP_LOOT_[熊之怒偶像]|r << Druid
    >>在最底层杀死 |cRXP_ENEMY_Rageclaw|r。从他身上搜刮 |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r << Hunter
    .collect 206954,1 << Druid -- Idol of Ursine Rage (1)
    .collect 206169,1 << Hunter -- Rune of Explosive Shot (1)
    .mob Rageclaw
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
step << Druid
    #season 2
    .equip 18,206954 >>|cRXP_WARN_装备|r |T136061:0|t|cRXP_LOOT_[熊之怒雕像]|r
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
    .aura 414824 >>|cRXP_WARN_处于|r |T132276:0|t[熊形态]|cRXP_WARN_时，保持 50 点或更多怒气，持续 60 秒|r
    .itemStat 18,QUALITY,2
    .train 410025,1
step << Druid/Hunter
    #season 2
    #label Rune
    .train 410025 >>|cRXP_WARN_使用|r |T136061:0|t|cRXP_LOOT_[熊之怒偶像]|r |cRXP_WARN_来学习|r |T132135:0|t[Mangle] << Druid
    .train 410123 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r |cRXP_WARN_学习|r |T236178:0|t[爆炸射击] << Hunter
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
    .use 206954 << Druid
    .use 206169 << Hunter
    .aura -414824 << Druid
step << Druid
    #optional
    #completewith TotL
    .cast 18960 >>施法传送：月光林地
    .zoneskip Moonglade
    step << Druid
    .goto Moonglade,56.1,30.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德迪利特·星焰|r
    .turnin 26 >>交任务: |cRXP_FRIENDLY_必修的课程|r
    .accept 29 >>接任务: |cRXP_LOOT_湖中试炼|r
    .target Dendrite Starblaze
step << Druid
    .goto Moonglade,52.6,51.6
    >>游进艾露恩阿拉湖
    >>打开一个 |cRXP_PICK_Bauble 容器|r。从中获取 |T134125:0|t[神社饰品]
    >>|cRXP_WARN_它可能在水下不同位置产卵|r
    .collect 15877,1,29,1 -- Shrine Bauble (1)
step << Druid
    #optional
    #completewith next
    .cast 18960 >>施法传送：月光林地
    .itemcount 15877,1 -- Shrine Bauble (1)
step << Druid
    .goto Moonglade,36.026,41.374
    >>|cRXP_WARN_使用|r |T134125:0|t[神殿饰品] |cRXP_WARN_at 雷姆洛斯神殿树|r
    .complete 29,1 --Complete the Trial of the Lake.
    .use 15877
step << Druid
    #label TotL
    .goto Moonglade,36.517,40.104
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔加里|r
    .turnin 29 >>交任务: |cRXP_FRIENDLY_湖中试炼|r
    .accept 272 >>接任务: |cRXP_LOOT_海狮试炼|r
    .target Tajarri
step << Druid/Hunter
    #optional
    .hs >>从炉边到黑海岸
    .zoneskip Darkshore
    
    
----End of Druid Quest+赛季服符文部分----


step << Priest
    #season 2
    #label TravelMenethilNoDMBoat
    #completewith MenethilNoDMBoat
    .goto Darkshore,32.44,43.71,15 >>前往米奈希尔港船的码头
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << Priest
    #season 2
    #label MenethilNoDMBoat
    .goto Darkshore,32.29,44.05
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM

    
----End of SoD 250% xp buff early southern Darkshore one loop----    

]])

----End of Darkshore Part 1----
----Start of Darkshore Part 2----
----Hunters stay in Darkshore/Ashenvale and Grind, 2x skips Redridge----

RXPGuides.RegisterGuide([[
#classic
#version 1
#season 2
<< Alliance
<< !sod/Warrior/Rogue/Hunter/Druid
#group RestedXP 联盟 1-20
#name 20-22 黑海岸 赛季服
#displayname 20-22 Darkshore << sod !Warrior
#displayname 20-22 Darkshore/Ashenvale << sod Warrior
#next RestedXP 联盟 20-30\\22-24 湿地 赛季服

step
    .goto Darkshore,37.78,44.06
    .use 12346 >>|cRXP_WARN_使用|r |T133748:0|t[空清洁碗]|cRXP_WARN_at the|r |cRXP_PICK_Auberdine Moonwell|r
    .collect 12347,1,4763,1
    .isOnQuest 4763
step
    #season 2
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿斯特利安|r
    .turnin 957 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .isOnQuest 957
    .target Asterion
step << Warlock
    #season 2
    #sticky
    #completewith TravelMenethilNoDMBoat
    #label ExplorerImpDarkshoreTwo
    >>在执行任务时对怪物施放 |T136163:0|t|cRXP_FRIENDLY_[吸取灵魂]|r 直到你收到 |T133257:0|t|cRXP_LOOT_探险者的灵魂|r。|cRXP_WARN_使用它来学习如何召唤|r |T236294:0|t|cRXP_FRIENDLY_[探险者小鬼]|r
    .train 445459 >>|cRXP_WARN_使用|r |T133257:0|t|cRXP_LOOT_Explorer's Soul|r |cRXP_WARN_学习如何召唤|r |T236294:0|t[|cRXP_FRIENDLY_Explorer Imp|r]
    .train 445459,1 --Skips if you already have Explorer Imp
    .train 1120,3 --Skips if you don't have drain soul
    .use 221978
step << Warlock/Mage
    #season 2
    #requires ExplorerImpDarkshoreTwo << Warlock
    #sticky
    #completewith TravelMenethilNoDMBoat
    #label FelPortalRuneDarkshore
    >>您所在的区域有 |cRXP_FRIENDLY_Fel Portals|r。如果您发现一个，请召唤您的 |T236294:0|t[|cRXP_FRIENDLY_Explorer Imp|r] 并在传送门旁边与其交谈，以将其送去探险。10-20 分钟后，它将带着战利品回来，并有机会奖励您 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Felguard|r] << Warlock
    >>您所在的区域有 |cRXP_FRIENDLY_Fel Portals|r。如果您发现一个，请使用 |T134945:0|t[|cRXP_LOOT_Scroll of Spatial Mending|r] 关闭它。这将奖励您 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Balefire Bolt|r] << Mage
    >>|cRXP_WARN_留意传送门，直到你得到符文|r
    .collect 221499,1 << Warlock --rune of the felguard
    .collect 223147,1 << Mage --Spell Notes: Balefire Bolt
    .itemcount 220792,1 << Mage --Scroll of Spatial Mending
    .use 223148 << Warlock --Otherworldy Treasure
    .use 220792 << Mage
    .train 428878,1 << Mage
    .train 427733,1 << Warlock
    .train 1120,3 << Warlock --Skips if you don't have drain soul
    .unitscan Fel Sliver
    .unitscan Fel Crack
    .unitscan Fel Tear
    .unitscan Fel Scar
    .unitscan Fel Rift
step << Warlock/Mage
    #season 2
    #requires FelPortalRuneDarkshore
    #sticky
    #completewith TravelMenethilNoDMBoat
    .itemcount 221499,1 << Warlock --Rune of the Felguard
    .itemcount 223147,1 << Mage --Spell Notes: Balefire Bolt
    .train 427733 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_恶魔守卫符文|r] |cRXP_WARN_学习|r |T136216:0|t[召唤恶魔守卫] << Warlock
    .train 428878 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：Balefire Bolt|r |cRXP_WARN_训练|r |T135809:0|t[Balefire Bolt] << Mage
    .use 221499 << Warlock
    .use 223147 << Mage
step
    #sticky
    #label Blackwood1
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,50.66,34.94
    >>打开 |cRXP_PICK_黑木谷物商店|r。获取 |T134939:0|t|cRXP_LOOT_[黑木谷物样本]|r
    >>|cRXP_WARN_抢劫此物品会生成 2 个 |cRXP_ENEMY_Blackwood Furbolgs|r，它们会愤怒地向你跑来。准备好与它们战斗或重置它们|r
    >>|cRXP_WARN_如果您看到 |cRXP_ENEMY_Xabraxxis|r 在聊天中大喊大叫或看到有人与他战斗，请帮助他们。打开 |cRXP_PICK_Xabraxxis 的恶魔包|r 他掉在地上。将其拾取以获得|r |cRXP_LOOT_腐化护身符|r
    .collect 12342,1,4763,1 -- Blackwood Grain Stores (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)
step << Druid
    #season 2
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>杀死 |cRXP_ENEMY_Den Mother|r。掠夺她以获得 |T132942:0|t[|cRXP_FRIENDLY_Ferocious Idol|r]
    >>|cRXP_WARN_请注意 |cRXP_ENEMY_Thistle Cubs|r 可以让你昏迷 2 秒|r
    .collect 208689,1 -- Ferocious Idol (1)
    .mob Den Mother
    .train 407988,1
step
    #season 0 << Warrior
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>杀死 |cRXP_ENEMY_Den Mother|r
    >>|cRXP_WARN_请注意 |cRXP_ENEMY_Thistle Cubs|r 可以让你昏迷 2 秒|r
    .complete 2139,1 --Den Mother (1)
    .mob Den Mother
step
    #sticky
    #requires Blackwood1
    #label Blackwood2
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,51.83,33.50
    >>打开|cRXP_PICK_黑木坚果商店|r。获取|T133944:0|t|cRXP_LOOT_[黑木坚果样本]|r
    >>|cRXP_WARN_抢劫此物品会生成 2 个 |cRXP_ENEMY_Blackwood Furbolgs|r，它们会愤怒地向你跑来。准备好与它们战斗或重置它们|r
    >>|cRXP_WARN_如果您看到 |cRXP_ENEMY_Xabraxxis|r 在聊天中大喊大叫或看到有人与他战斗，请帮助他们。打开 |cRXP_PICK_Xabraxxis 的恶魔包|r 他掉在地上。将其拾取以获得|r |cRXP_LOOT_腐化护身符|r
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
    >>打开 |cRXP_PICK_黑木水果店|r。获取 |T134013:0|t|cRXP_LOOT_[黑木水果样本]|r
    >>|cRXP_WARN_抢劫此物品会生成 2 个 |cRXP_ENEMY_Blackwood Furbolgs|r，它们会愤怒地向你跑来。准备好与它们战斗或重置它们|r
    >>|cRXP_WARN_如果您看到 |cRXP_ENEMY_Xabraxxis|r 在聊天中大喊大叫或看到有人与他战斗，请帮助他们。打开 |cRXP_PICK_Xabraxxis 的恶魔包|r 他掉在地上。将其拾取以获得|r |cRXP_LOOT_腐化护身符|r
    .collect 12341,1,4763,1 -- Blackwood Fruit Sample (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)
step
    #optional
    #requires Blackwood3
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39
    .cast 16072 >>|cRXP_WARN_使用|r |T134712:0|t[装满的清洁碗] |cRXP_WARN_at |cRXP_PICK_Bonfire|r召唤|r |cRXP_ENEMY_Xabraxxis|r
    .timer 17,The Blackwood Corrupted RP
    .use 12347
step
    #requires Blackwood3
    #label Xabraxxis
    .goto Darkshore,52.38,33.39
    >>杀死 |cRXP_ENEMY_Xabraxxis|r。打开 |cRXP_PICK_Xabraxxis 的恶魔包|r，他掉落在地上。拾取它以获得 |cRXP_LOOT_腐化护身符|r
    .use 12347
    .complete 4763,1 -- Talisman of Corruption (1)
    .mob Xabraxxis
step << Warrior
    #season 2
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>杀死 |cRXP_ENEMY_Den Mother|r
    >>|cRXP_WARN_请注意 |cRXP_ENEMY_Thistle Cubs|r 可以让你昏迷 2 秒|r
    .complete 2139,1 --Den Mother (1)
    .mob Den Mother
step << skip --logout skip Warrior
    #season 2
    .goto Darkshore,51.48,38.43
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_跳到巢穴母亲洞穴后面的蘑菇上，然后通过从蘑菇上退出来执行退出跳过|r
step << Warrior
    #optional
    #season 2
    #completewith BlackwoodSod
    .subzone 442 >>前往奥伯丁
step
    #season 0 << Warrior
	#xprate >1.49 << Hunter/Druid
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴苏尔·影击|r
    .turnin 965 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 966 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Balthule Shadowstrike
step << Paladin
    #season 2
    #optional
    #completewith next
    .goto Darkshore,56.20,26.46
    >>|cRXP_WARN_留意进入 Althalaxx 之塔的队伍。如果你看到任何人，请慢慢跟在他们后面进去，这样你就可以抢劫顶部的 |cRXP_PICK_Strange Orb|r
    >>|cRXP_WARN_要小心，因为你不可能杀死这座塔中的怪物（28-31 级）|r
    >>|cRXP_WARN_如果你不想这样做，请跳过此步骤|r
    >>打开 Althalaxx 之塔顶桌上的 |cRXP_PICK_Strange Orb|r。拾取它以获得 |cRXP_LOOT_Althalaxx Orb|r
    .collect 209836,1,78089,1 --Athalaxx Orb (1)
    .train 410014,1
step << Warlock
    #season 2
    #optional
    #completewith Parchments
    >>|cRXP_WARN_留意进入 Althalaxx 之塔的队伍。如果你看到任何人，请慢慢跟在他们后面进去，这样你就可以掠夺顶部的 |cRXP_PICK_Altek 之树枝|r，获得 |T135153:0|t[Altek 之树枝]
    >>|cRXP_WARN_这是给你的|r |T237558:0|t[Metamorphosis] |cRXP_WARN_rune 稍后使用的。如果你不想这样做，请跳过此步骤|r
    >>|cRXP_WARN_要小心，因为你不可能杀死这座塔中的怪物（28-31 级）|r
    >>|cRXP_WARN_如果你不想这样做，请跳过此步骤|r
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
    >>杀死 |cRXP_ENEMY_Dark Strand Fanatics|r。从他们身上夺取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Channeling|r]
    .collect 208750,1 -- Rune of Channeling (1)
    .mob Dark Strand Fanatic
    .train 403932,1
step << Warlock
    #season 2
    #sticky
    #label ChannelingEnd
    #requires Channeling
    .train 403932 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_通灵符文|r] |cRXP_WARN_进行训练|r |T136168:0|t[通灵大师]
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
    >>杀死 |cRXP_ENEMY_Dark Strand Fanatics|r。掠夺他们的 |cRXP_LOOT_Worn Parchments|r
    .complete 966,1 --Worn Parchment (4)
    .mob Dark Strand Fanatic
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
    .xp 18+15000 >>升级至 15000+/19400xp
    .mob Dark Strand Fanatic
step
	#xprate >1.49 << Hunter/Druid
    #season 0 << Warrior
    #requires Channeling << Warlock --Season 2
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴苏尔·影击|r
    .turnin 966 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 967 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Balthule Shadowstrike
step << Priest
    #season 1 -- Skipping this rune cus its useless
    #completewith next
    >>杀死 |cRXP_ENEMY_Stormscale Myrmidons|r、|cRXP_ENEMY_Stormscale Warriors|r 和 |cRXP_ENEMY_Stormscale Sorceresses|r。掠夺他们以获得 |T236364:0|t[|cRXP_LOOT_Shatterspear Offering|r]
    .collect 211482,1 -- Shatterspear Offering (1)
    .mob Stormscale Myrmidon
    .mob Stormscale Warrior
    .mob Stormscale Sorceress
    .train 425215,1
step
    #season 0
    #requires ChannelingEnd << Warlock --Season 2
    .goto Darkshore,57.13,22.04,55,0
    .goto Darkshore,57.97,20.23,55,0
    .goto Darkshore,58.36,23.61,55,0
    .goto Darkshore,59.42,24.62,55,0
    .goto Darkshore,60.26,21.75
    >>拾取地面上的 |cRXP_LOOT_Mathystra 遗物|r
    .complete 951,1 -- Mathystra Relics (6)
step << Priest
    #season 1 -- Skipping this rune cus its useless
    .goto Darkshore,59.2,23.4,60,0
    .goto Darkshore,60.0,15.4
    >>杀死 |cRXP_ENEMY_Stormscale Myrmidons|r、|cRXP_ENEMY_Stormscale Warriors|r 和 |cRXP_ENEMY_Stormscale Sorceresses|r。掠夺他们以获得 |T236364:0|t[|cRXP_LOOT_Shatterspear Offering|r]
    .collect 211482,1 -- Shatterspear Offering (1)
    .mob Stormscale Myrmidon
    .mob Stormscale Warrior
    .mob Stormscale Sorceress
    .train 425215,1
step << Priest
    #season 1 -- Skipping this rune cus its useless
    .goto Darkshore,59.2,22.6
    .use 211482 >>|cRXP_WARN_使用|r |T236364:0|t[|cRXP_LOOT_碎矛祭品|r] |cRXP_WARN_对着水下的碎矛雕像领取|r |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r]
    .collect 205905,1 -- Memory of a Devout Champion (1)
    .train 425215,1
step << Priest
    #season 1 -- Skipping this rune cus its useless
    .train 425215 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_虔诚冠军的回忆|r] |cRXP_WARN_训练|r |T237566:0|t[扭曲的信仰]
    >>|cRXP_WARN_你必须通过输入 /kneel 在圣地获得|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buff，例如北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘守卫|r
    .use 205905
    .itemcount 205905,1
step << !sod/Hunter/Druid
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基尔卡克·旋杆|r
    .accept 2098 >>接任务: |cRXP_LOOT_基尔卡克的钥匙|r
    .target Gelkak Gyromast
step << !sod/Hunter/Druid
    #optional
    #completewith next
    .goto Darkshore,56.10,16.88,0
    >>杀死 |cRXP_ENEMY_Raging Reef Crawlers|r 和 |cRXP_ENEMY_Encrusted Tide Crawlers|r。从他们身上拾取 |cRXP_LOOT_Bottom of Gelkak's Key|r
    >>|cRXP_WARN_注意 |cRXP_ENEMY_Raging Reef Crawlers|r'|r |T132152:0|t[Thrash] |cRXP_WARN_ability。他们的近战攻击会立即对你造成 200 点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key (1)
    .mob Raging Reef Crawler
    .mob Encrusted Tide Crawler
step << !sod/Hunter/Druid
    .goto Darkshore,54.93,12.19
    >>杀死 |cRXP_ENEMY_Greymist 神谕者|r 和 |cRXP_ENEMY_Greymist 潮汐猎人|r。从他们身上搜刮 |cRXP_LOOT_Gelkak 钥匙的中​​间|r
    >>|cRXP_WARN_注意 |cRXP_ENEMY_Greymist Oracles|r'|r |T136048:0|t[闪电] |cRXP_WARN_damage 他们也可以用|r |T136052:0|t[治疗波] 进行治疗|r
    >>|cRXP_WARN_你可以通过 LoS（视线）观察沉船周围的 |cRXP_ENEMY_Greymist Oracles|r'|r |T136048:0|t[闪电] |cRXP_WARN_以避免受到伤害|r
    .complete 2098,2 -- Middle of Gelkak's Key (1)
    .mob Greymist Tidehunter
    .mob Greymist Oracle
step << !sod/Hunter/Druid
    .goto Darkshore,55.59,16.98,45,0
    .goto Darkshore,53.76,18.96,45,0
    .goto Darkshore,51.34,22.00,45,0
    .goto Darkshore,56.63,12.08
    >>杀死 |cRXP_ENEMY_Raging Reef Crawlers|r 和 |cRXP_ENEMY_Encrusted Tide Crawlers|r。从他们身上拾取 |cRXP_LOOT_Bottom of Gelkak's Key|r
    >>|cRXP_WARN_注意 |cRXP_ENEMY_Raging Reef Crawlers|r'|r |T132152:0|t[Thrash] |cRXP_WARN_ability。他们的近战攻击会立即对你造成 200 点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key (1)
    .mob Raging Reef Crawler
    .mob Encrusted Tide Crawler
step << !sod/Hunter/Druid
    #sticky
    #label foreststriders
    .goto Darkshore,59.29,13.22,55,0
    .goto Darkshore,61.40,9.40,50,0
    .goto Darkshore,61.51,12.66,50,0
    .goto Darkshore,61.24,15.38,50,0
    .goto Darkshore,61.40,9.40
    >>杀死 |cRXP_ENEMY_Giant Foreststriders|r。掠夺他们以获得 |cRXP_LOOT_Gelkak's Key 的顶部|r
    .complete 2098,1 -- Top of Gelkak's Key (1)
    .mob Giant Foreststrider
step
    #xprate <1.59
    .goto Darkshore,61.40,9.40,45,0
    .goto Darkshore,62.42,7.67
    >>杀死 |cRXP_ENEMY_月夜猎者 Sires|r 和 |cRXP_ENEMY_月夜猎者 Matriarchs|r。掠夺他们的 |cRXP_LOOT_Pelts|r
    >>|cRXP_WARN_小心 |cRXP_ENEMY_月夜猎者 Matriarchs|r。他们总是带着 |cRXP_ENEMY_月夜猎者 Runt|r 一起进攻|r
    .complete 986,1 -- Fine 月夜猎者 Pelt (5)
    .mob 月夜猎者 Sire
    .mob 月夜猎者 Matriarch
    .mob 月夜猎者 Runt
step << Warrior/Paladin/Rogue
    #season 0
    #requires foreststriders
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基尔卡克·旋杆|r
    >>|cRXP_WARN_开始寻找 Gyromast's Revenge 的团队/|r|cRXP_ENEMY_The Threshwackonator 4100|r << Warrior/Paladin/Rogue
    .turnin 2098 >>交任务: |cRXP_FRIENDLY_基尔卡克的钥匙|r
    .accept 2078 >>接任务: |cRXP_LOOT_基尔卡克的报复|r
    .target Gelkak Gyromast
    .solo
step << !sod/Hunter/Druid
    #requires foreststriders
    .group 2 << Warrior/Paladin/Rogue
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基尔卡克·旋杆|r
    >>|cRXP_WARN_开始寻找 Gyromast's Revenge 的团队/|r|cRXP_ENEMY_The Threshwackonator 4100|r << Warrior/Paladin/Rogue
    .turnin 2098 >>交任务: |cRXP_FRIENDLY_基尔卡克的钥匙|r
    .accept 2078 >>接任务: |cRXP_LOOT_基尔卡克的报复|r
    .target Gelkak Gyromast
step << !sod/Hunter/Druid
    #optional
    #completewith next
    .goto 1439,55.802,18.290
    .gossipoption 95406 >>对话: |cRXP_FRIENDLY_机械打手4100型|r
--  .gossipoption 87696 >>对话: |cRXP_FRIENDLY_机械打手4100型|r
    >>|cRXP_WARN_这个任务非常困难|r
    .target The Threshwackonator 4100
    .isOnQuest 2078 << Warrior/Paladin/Rogue
step << !sod/Hunter
    #label Turtle4727
    .goto 1439,53.113,18.099
    >>点击 |cRXP_PICK_Beached Sea Turtle|r
    .accept 4727 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step << !sod/Hunter/Druid
    .goto 1439,56.654,13.484
    #optional
    >>护送 |cRXP_FRIENDLY_The Threshwackonator 4100|r 至 |cRXP_FRIENDLY_Gelkak Gyromast|r
    >>一旦 |cRXP_ENEMY_The Threshwackonator 4100|r 变得具有敌意，就将其杀死
    >>|cRXP_WARN_这个任务非常困难|r
    *Only use ranged attacks while running from it, avoid being at melee range << Druid
    >>|cRXP_WARN_如果可以的话，尝试完成这个任务，因为它会为你节省时间，因为它会奖励|r |T134797:0|t[水下呼吸药剂] |cRXP_WARN_for 以后的水下任务|r << !Druid !Warlock
    >>|cRXP_WARN_当他转为敌对时，使用|r |T136100:0|t[Entangling Roots] |cRXP_WARN_on 他然后拉开距离，使用瞬发法术放风筝|r << Druid
    >>|cRXP_WARN_如果你无法杀死|cRXP_ENEMY_The Threshwackonator 4100|r，请跳过此步骤|r
    .complete 2078,1 --Gyromast's Revenge (1)
    .link https://clips.twitch.tv/VainAmorphousMacaroniPRChase-iGvhTnz0ked6LO0A >>|cRXP_WARN_点击此处查看视频指南|r
    .mob The Threshwackonator 4100
    .isOnQuest 2078 << Warrior/Paladin/Rogue
--XX DRUID: Test if you can root
step << !sod/Hunter/Druid
    #optional << Warrior/Paladin/Rogue
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基尔卡克·旋杆|r
    .turnin 2078 >>交任务: |cRXP_FRIENDLY_基尔卡克的报复|r
    .target Gelkak Gyromast
    .isQuestComplete 2078
step
    #optional
    #season 0 << Warrior
    #completewith Beached披风
    .abandon 2078 >>抛弃陀螺桅杆的复仇
step << Druid
    #xprate <1.5
    #optional
    #completewith DeerComplete
    >>杀死 |cRXP_ENEMY_Encrusted Tide Crawlers|r。掠夺他们的 |cRXP_LOOT_Fine Crab Chunks|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
step << !sod/Hunter/Druid
    #sticky
    #label DeleteGyromast
    #optional
    .destroy 7442 >>摧毁: |cRXP_ENEMY_基尔卡克的钥匙|r, 它在你的背包中. 不再需要它了
step << Druid
    #label Turtle4727
    .goto 1439,53.113,18.099
    >>点击 |cRXP_PICK_Beached Sea Turtle|r
    .accept 4727 >>接任务: |cRXP_LOOT_搁浅的海龟|r
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
    >>|cRXP_WARN_使用|r |T132801:0|t[治疗动物药膏] |cRXP_WARN_on|r |cRXP_ENEMY_Sickly Deer|r
    .complete 6124,1 -- Sickly Deer cured (10)
    .mob Sickly Deer
    .use 15826
step << Druid
    .goto Darkshore,48.87,11.32
    >>|cRXP_WARN_在水中游泳|r
    >>打开 |cRXP_PICK_奇怪的锁箱|r。从中获取 |cRXP_LOOT_半个水生敏捷吊坠|r
    .collect 15883,1,272,1 --Collect Half Pendant of Aquatic Agility (x1)


----Start of Darkshire 2x 20 Turnins & Druid Training----


step << Druid
    #xprate >1.59
    #optional
	#completewith next
	.cast 18960 >>施法传送：月光林地
	.zoneskip Moonglade
    .xp <20,1
step << Druid
    #xprate >1.59
    #optional
    .goto Moonglade,52.53,40.57
	>>前往月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_洛甘纳尔|r
    .trainer >>训练你的职业法术
    .target Loganaar
    .xp <20,1
step << Druid
    #xprate >1.59
    #optional
    #completewith BlackwoodSod
    .hs >>哈思至奥伯丁
    .zoneskip Darkshore
    .subzoneskip 442
    .xp <20,1
step << Druid
    #season 2
    #optional
    #completewith BlackwoodSod
    .goto Moonglade,48.0,67.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_辛德拉尔|r
    .fly Auberdine >>|cRXP_WARN_如果你的炉石还在冷却中，请飞往奥伯丁|r
step << !Warrior
    #season 2
    #optional
    #completewith BlackwoodSod
    .hs >>哈思至奥伯丁
    .subzoneskip 442
step << !Druid !Warrior
    #optional
    #season 2
    #completewith next
    .goto 1439,37.703,43.393
    .subzone 442 >>如果你的炉石不可用，请跑回奥伯丁
step
    #xprate >1.59
    #label BlackwoodSod
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 4763 >>交任务: |cRXP_FRIENDLY_黑木熊怪的堕落|r
    .target Thundris Windweaver
step
    #xprate >1.59
    #optional
    #completewith Beached披风
    .destroy 12342 >>摧毁: |cRXP_ENEMY_黑木谷物|r, 它在你的背包中. 不再需要它了
step
    #xprate >1.59
    #optional
    #completewith Beached披风
    .destroy 12343 >>摧毁: |cRXP_ENEMY_黑木坚果|r, 它在你的背包中. 不再需要它了
step
    #xprate >1.59
    #optional
    #completewith Beached披风
    .destroy 12341 >>摧毁: |cRXP_ENEMY_黑木水果|r, 它在你的背包中. 不再需要它了
step
    #season 1
    #xprate >1.59
    #optional
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达蒙德|r
    >>|cRXP_BUY_从他那里购买 a|r |T135237:0|t[燧石和火绒] |cRXP_BUY_和 a|r |T135435:0|t[简易木材] |cRXP_BUY_|r
    >>|cRXP_WARN_这是为了升级你的|r |T133971:0|t[烹饪] |cRXP_WARN_while 在船上很快|r
    >>|cRXP_WARN_你需要 50|r |T133971:0|t[烹饪] |cRXP_WARN_才能稍后在暮色森林完成任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .itemcount 6889,1 -- Small Egg (1+)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .target Dalmond
step
    #season 1
    #xprate >1.59
    #optional
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高尔博德·钢手|r
    .vendor 6301 >>|cRXP_BUY_从他那里购买|r |T134059:0|t[温和香料] |cRXP_BUY_直到你拥有|r |T134059:0|t[温和香料] |cRXP_BUY_等于或大于|r |T132832:0|t[小鸡蛋] |cRXP_BUY_你目前拥有的数量|r
    .collect 2678,50,90,1,0x20,cooking --Mild Spices (1-50)
    .disablecheckbox
    .collect 6889,50,90,1,0x20,cooking --Small Egg (1-50)
    .disablecheckbox
    .target Gorbold Steelhand
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .itemcount 6889,1 -- Small Egg (1+)
step
    #xprate >1.59
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨纳瑞恩·绿树|r
    .turnin 2139 >>交任务: |cRXP_FRIENDLY_萨纳瑞恩的希望|r
    .target 萨纳利恩护树人
step
    #xprate >1.59
    #optional
    #label PeltEnd
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特伦希斯|r
    .turnin 986 >>交任务: |cRXP_FRIENDLY_丢失的主人|r
    .target Terenthis
    .isQuestTurnedIn 986
step
    #xprate >1.59
    #requires DeleteGyromast
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_古博·布拉普|r
    .turnin 1138 >>交任务: |cRXP_FRIENDLY_海中的水果|r
    .target Gubber Blump
    .isQuestComplete 1138
step
    #season 1 << Warrior sod -- won't load
    #xprate >1.59
    #label Beached披风
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_温尼斯·布莱葛|r
    .turnin 4727 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .target Gwennyth Bly'Leggonde


----Start of SoD Warrior short ashenvale bit to catch up xp----


step << Warrior
    .goto 1439,43.555,76.293
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安努|r
    .turnin 950 >>交任务: |cRXP_FRIENDLY_向安努回复|r
    .target Onu
step << Warrior
    #season 2
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗尼亚·恒影|r
    >>|cRXP_WARN_如果他不在，请跳过此步骤。他可能需要最多 25 分钟才能重生|r
    .accept 5321 >>接任务: |cRXP_LOOT_昏昏欲睡|r
    .target Kerlonian Evershade
step << Warrior
    #season 2
    .isOnQuest 5321
    .goto Darkshore,44.38,76.30
    >>打开 |cRXP_PICK_Kerlonian 的宝箱|r。拾取其中的 |T134229:0|t[|cRXP_LOOT_觉醒之角|r]
    .complete 5321,1 -- Horn of Awakening (1)
step << Warrior
    #season 2
    #sticky
    >>|cRXP_WARN_护送 |cRXP_FRIENDLY_Kerlonian|r 到灰谷的梅斯特拉哨所|r
    .use 13536 >>|cRXP_WARN_每当 |cRXP_FRIENDLY_Kerlonian|r 在他旁边睡着时使用|r |T134229:0|t[|cRXP_LOOT_觉醒号角|r] |cRXP_WARN_|r
    >>|cRXP_WARN_尽量避免在主干道上奔跑。只有当你在路上时才会出现敌人|r
    .complete 5321,2
    .isOnQuest 5321
step << Warrior
    #season 2
    .goto Darkshore,45.8,90.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵阿娜莎|r
    .accept 5713 >>接任务: |cRXP_WARN_一击必杀|r
    .target Sentinel Aynasha
step << Warrior
    #season 2
    .goto Darkshore,45.8,90.2
    >>三波怪物会以一定的时间间隔生成。你可以在等待下一波怪物生成的同时杀死该区域的其他怪物
    >>|cRXP_WARN_别忘了在执行此任务时保持清醒|r |cRXP_FRIENDLY_Kerlonian|r |cRXP_WARN_。他会帮助你对付怪物|r
    .complete 5713,1
step << Warrior
    #season 2
    #completewith towersod
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .goto Ashenvale,29.7,13.6
step << Warrior
    #season 2
    .goto Ashenvale,26.6,36.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵奥奈雅|r
    .turnin 5713,1 >>交任务: |cRXP_FRIENDLY_一击必杀|r
    .target Sentinel Onaeya
step << Warrior
    #season 2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Liadris Moonriver|r
	.target Liladris Moonriver
    .goto Ashenvale,27.26,35.58
    >>如果你还没有完成任务，请跳过此步骤
    .turnin 5321 >>交任务: |cRXP_FRIENDLY_昏昏欲睡|r
step << Warrior
    #season 2
    #label towersod
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_净化者德尔格伦|r
	.target Delgren the Purifier
    .goto Ashenvale,26.19,38.69
    .turnin 967 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
step << Warrior
    #season 2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥雷迪尔·阔叶|r
	.target Orendil Broadleaf
    .goto Ashenvale,26.43,38.59
    .accept 1010 >>接任务: |cRXP_LOOT_巴斯兰的头发|r
step << Warrior
    #season 2
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地面上的 |cRXP_PICK_植物包|r。拾取其中的 |cRXP_LOOT_Bathran 的头发|r
    >>|cRXP_WARN_它们看起来像棕色的小袋子。它们可能很难被发现|r
    .complete 1010,1
    .isOnQuest 1010
step << Warrior
    #season 2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥雷迪尔·阔叶|r
	.target Orendil Broadleaf
    .goto Ashenvale,26.43,38.59
    .turnin 1010 >>交任务: |cRXP_FRIENDLY_巴斯兰的头发|r
    .accept 1020 >>接任务: |cRXP_LOOT_奥雷迪尔的药剂|r
step << Warrior
    #season 2
    .goto Ashenvale,37.36,51.79
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r
	.target Pelturas Whitemoon
    .turnin 1020 >>交任务: |cRXP_FRIENDLY_奥雷迪尔的药剂|r
step << Warrior
    #season 2
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黛琳希亚|r
    .fp Astranaar>>获取阿斯特兰纳飞行路线
	.target Daelyshia
step << Warrior
    #season 2
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黛琳希亚|r
    .fly Auberdine >>飞回奥伯丁
	.target Daelyshia


----End of SoD Warrior short ashenvale bit to catch up xp----


----Start of Druid SoD Wild Strikes run segment----

step << Druid
    #season 2
    #optional
    #completewith next
    +|cRXP_WARN_你现在将获得|r |T132143:0|t[|cRXP_FRIENDLY_Wild Strikes|r] |cRXP_WARN_rune。这将带你前往石爪山，虽然需要一段时间，但符文对于其余的升级来说极其强大|r
step << Druid
    .goto 1439,43.555,76.293
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安努|r
    .turnin 950 >>交任务: |cRXP_FRIENDLY_向安努回复|r
    .target Onu
step << Druid
    #season 2
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗尼亚·恒影|r
    >>|cRXP_WARN_如果他不在，请跳过此步骤。他可能需要最多 25 分钟才能重生|r
    .accept 5321 >>接任务: |cRXP_LOOT_昏昏欲睡|r
    .target Kerlonian Evershade
step << Druid
#season 
    .isOnQuest 5321
    .goto Darkshore,44.38,76.30
    >>打开 |cRXP_PICK_Kerlonian 的宝箱|r。拾取其中的 |T134229:0|t[|cRXP_LOOT_觉醒之角|r]
    .complete 5321,1 -- Horn of Awakening (1)
step << Druid
#season 
    #completewith towersod
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .goto Ashenvale,29.7,13.6
step << Druid
#season 
    .goto Ashenvale,27.26,35.58
    >>|cRXP_WARN_护送 |cRXP_FRIENDLY_Kerlonian|r 到灰谷的梅斯特拉哨所|r
    .use 13536 >>|cRXP_WARN_每当 |cRXP_FRIENDLY_Kerlonian|r 在他旁边睡着时使用|r |T134229:0|t[|cRXP_LOOT_觉醒号角|r] |cRXP_WARN_|r
    >>|cRXP_WARN_尽量避免在主干道上奔跑。只有当你在路上时才会出现敌人|r
    .complete 5321,2
    .isOnQuest 5321
step << Druid
#season 
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Liadris Moonriver|r
	.target Liladris Moonriver
    .goto Ashenvale,27.26,35.58
    .turnin 5321 >>交任务: |cRXP_FRIENDLY_昏昏欲睡|r
    .isQuestComplete 5321
step << Druid
#season 
    #label towersod
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_净化者德尔格伦|r
	.target Delgren the Purifier
    .goto Ashenvale,26.19,38.69
    .turnin 967 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
step << Druid
    #season 2
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黛琳希亚|r
    .fp Astranaar>>获取阿斯特兰纳飞行路线
	.target Daelyshia
step << Druid
    #season 2
    .goto Ashenvale,42.4,72.3,30 >>前往通往石爪山脉的塔隆深渊小路
step << Druid
    #season 2
    .goto Stonetalon Mountains,78.2,42.6,40 >>穿过隧道进入石爪山脉
step << Druid
    #season 2
    .goto Stonetalon Mountains,59.6,67.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_加克西姆·拉斯特菲兹|r 交谈
    .accept 1075 >>接任务: |cRXP_WARN_马伦的卷轴|r
step << Druid
    #season 2
    .goto Stonetalon Mountains,71.5,86.5,40 >>前往地图上标记的恐怖图腾村庄
step << Druid
    #season 2
    .goto Stonetalon Mountains,80.2,90.6,60,0
    .goto Stonetalon Mountains,83.2,87.0,60,0
    .goto Stonetalon Mountains,71.6,86.6,60,0
    .goto Stonetalon Mountains,76.6,91.0,60,0
    .goto Stonetalon Mountains,80.2,90.6
    >>击杀 |cRXP_ENEMY_Grimtotems|r。拾取它们以获得 |T134233:0|t[|cRXP_FRIENDLY_Idol of the Wild|r]
    .collect 210534,1 -- Idol of the Wild (1)
    .mob Grimtotem Mercenary
    .mob Grimtotem Brute
    .mob Grimtotem Sorcerer
    .mob Grimtotem Ruffian
    .train 410021,1
step << Druid
    #season 2
    .equip 18,210534 >>|cRXP_WARN_装备|r |T134233:0|t[|cRXP_FRIENDLY_野性偶像|r]
    .use 210534
    .itemcount 210534,1
    .train 410021,1
step << Druid
    #season 2
    #sticky
    #completewith wildStrikesEnd
    >>|cRXP_WARN_对 10 种不同的友方野兽施放|r |T136085:0|t[再生] |cRXP_WARN_或|r |T136041:0|t[治疗之触] |cRXP_WARN_on 包括猎人宠物/熊形态的德鲁伊/幽灵狼形态的萨满|r << Horde
    >>|cRXP_WARN_对 10 种不同的友方野兽施放|r |T136085:0|t[再生] |cRXP_WARN_或|r |T136041:0|t[治疗之触] |cRXP_WARN_on ，例如猎人宠物或熊/猫形态的德鲁伊|r << Alliance
    >>这可能需要一段时间才能完成，具体取决于你找到多少友善的野兽。|cRXP_WARN_DO NOT DIE OR UNEQUIP THE RELIC|r 直到你获得 10 叠灵感，否则你的进度将会丢失
    .train 410021 >>|cRXP_WARN_使用|r |T134233:0|t[|cRXP_FRIENDLY_野性偶像|r] |cRXP_WARN_训练|r |T132143:0|t[狂野打击]
    .itemcount 210534,1
step << Druid
    #season 2
    #optional
	#completewith next
	.cast 18960 >>施法传送：月光林地
	.zoneskip Moonglade
step << Druid
    #season 2
    .goto Moonglade,52.53,40.57
	>>前往月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_洛甘纳尔|r
    .train 6756 >>训练你的职业法术
    .target Loganaar
step << Druid
    #optional
    .hs >>从炉边到黑海岸
    .zoneskip Darkshore

----End of Druid SoD Wild Strikes run segment----



----End of Darkshore 2x 20 Turnins & Druid Training----
----Start of Rogue Poison Quest Section----



step
    #xprate >1.59
    #label TravelMenethilNoDMBoat
    #completewith MenethilNoDMBoat
    .goto Darkshore,32.44,43.71,15 >>前往米奈希尔港船的码头
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step
    #label MenethilNoDMBoat
    .goto Darkshore,32.29,44.05
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
 step << Rogue
    #season 2
    .goto Wetlands,7.95,56.38
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德温·晨光|r
    .vendor 1453 >>|cRXP_WARN_购买尽可能多的|r |T134831:0|t[治疗药水] |cRXP_WARN_可用|r
    >>|cRXP_WARN_这是限量供应商品。如果 |cRXP_FRIENDLY_Dewin Shimmerdawn|r 没有，请跳过此步骤|r
    .target Dewin Shimmerdawn
step << Rogue
    #season 2
    .money <0.08
    .goto Wetlands,10.4,56.0,25,0
    .goto Wetlands,10.1,56.9,25,0
    .goto Wetlands,10.6,57.2,25,0
    .goto 1437,10.760,56.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尼尔·奥雷|r
    .vendor >>|cRXP_WARN_购买 a|r |T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量供应商品。如果 |cRXP_FRIENDLY_Neal Allen|r 没有，请跳过此步骤|r
	.target Neal Allen
    .bronzetube
step << Rogue
    #season 2
    .goto Wetlands,10.69,60.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板赫布瑞克|r
    .target Innkeeper Helbrek
    .home >>将你的炉石设置为米奈希尔港
step << Rogue
    #season 2
    .goto Wetlands,10.843,60.435
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_考古学家弗拉冈特|r, 他在楼上
    .target Archaeologist Flagongut
    .turnin 942 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .accept 943 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .isQuestComplete 942
step << Rogue
    #season 2
    .goto Wetlands,10.496,60.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨莫尔·菲斯蒂沃斯|r, 他在楼上
    .vendor >>|cRXP_BUY_购买尽可能多的|r |T134831:0|t[治疗药水] |cRXP_BUY_可用|r
    >>|cRXP_WARN_这是限量供应的商品。如果 |cRXP_FRIENDLY_Samor Festivus|r 没有，请跳过此步骤|r
    .target Samor Festivus
step << Rogue
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r
    .fp Menethil Harbor >>获取米奈希尔港飞行路线
    .target Shellei Brondir
    .dungeon !DM
step << NightElf Rogue
    #optional
    #completewith next
    .goto Wetlands,5.485,64.156,40 >>从码头末端跳下，游向航点
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    .goto Wetlands,2.433,78.689,-1
    .goto Ironforge,17.089,83.373,-1
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r，使用角色解困自助服务功能传送到铁炉堡。您必须在该位置注销并登录另一个角色并呼出帮助菜单，然后向下滚动到自助​​服务。如果您无法解困，请跳过此步骤。
    .link https://www.youtube.com/watch?v=oVoxsr4zcg4 >>点击此处查看视频参考
    .link https://us.battle.net/support/en/help/product/wow/197/834/solution >>点击此处查看未卡住的链接
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
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
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
    .goto Westfall,56.55,52.64,100 >>沿着海岸跑，前往哨兵岭
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .fp Sentinel Hill >>获取哨兵岭飞行路线
    .target Thor
    .zoneskip Ironforge --Skips if you didn't swim from Wetlands
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Westfall,56.33,47.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
    .zoneskip Westfall,1
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Elwynn Forest,36.809,72.429,100,0
    .goto StormwindClassic,69.961,86.583
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59 << !Hunter
    #label WepTrainNoDM
    #optional << NightElf
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吴平|r
    .train 201 >>训练 1h 剑 << Rogue
    .train 202 >>训练 2h 剑 << Warrior
    .target Woo Ping
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fp Ironforge >>获取铁炉堡飞行路线
    .target Gryth Thurden
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_Book: The Powers Below|r] 开始任务|r
    .accept 968 >>接任务: |cRXP_LOOT_深渊之神|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_葛利·硬骨|r, 他在里面
    .turnin 968 >>交任务: |cRXP_FRIENDLY_深渊之神|r
    .target Gerrig Bonegrip
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
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到狮鹫的头顶。通过登出并重新登录来跳过登出|r
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestAvailable 968
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #requires MilstaffNoDM << Mage
    .goto 1455,67.842,42.456
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_考格斯宾|r
    .vendor 5175 >>|cRXP_BUY_从他那里购买 a|r |T133024:0|t[青铜管] |cRXP_BUY_ （如果它上涨的话）|r
--    >>你稍后需要 2 个青铜管来完成任务 << Rogue
    .target Gearcutter Cogspinner
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
    #requires MilstaffNoDM << Mage
    #label DeeprunNoDM
    .goto Ironforge,78.00,51.40
    .subzone 2257 >>进入 Deeprun 有轨电车
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #completewith WepTrainNoDM << !Warrior
    >>|cRXP_WARN_升级你的|r |T135966:0|t[急救] |cRXP_WARN_和|r |T133971:0|t[烹饪] |cRXP_WARN_如果需要在电车上|r
    >>|cRXP_WARN_你需要你的|r |T135966:0|t[急救] |cRXP_WARN_达到 80 以上才能完成稍后的任务|r << Rogue !Dwarf
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Westfall
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_比利巴布·旋轮|r
    .vendor 5519 >>|cRXP_BUY_从他那里购买 a|r |T133024:0|t[青铜管] |cRXP_BUY_（如果价格上涨）|r
--    >>你稍后需要 2 个青铜管来完成任务 << Rogue
    .target Billibub Cogspinner
    .zoneskip Darkshore << Warrior/Paladin
    .bronzetube
    .train 201,1 << NightElf Rogue --单手剑 not trained
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith RogueTrainNoDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_训练|r |T132282:0|t[伏击] |cRXP_WARN_如果你有多余的钱并且|r |T135641:0|t[匕首] |cRXP_WARN_装备好或者放在包里。这会为你节省时间|r
    .train 8676 >>列车 |T132282:0|t[伏击]
    .target Osborne the Night Man
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保你训练了|r |T132320:0|t[隐身]|cRXP_WARN_、|r |T133644:0|t[扒窃]|cRXP_WARN_和|r |T136058:0|t[撬锁] |cRXP_WARN_，因为你稍后会需要它们|r
    .train 1784 >>列车 |T132320:0|t[隐身]
    .train 921 >>列车 |T133644:0|t[扒窃]
    .train 1804 >>列车 |T136058:0|t[撬锁]
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .dungeon !DM
    .train 1784,1
    .train 921,1
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保你训练了|r |T133644:0|t[扒窃]|cRXP_WARN_和|r |T136058:0|t[撬锁] |cRXP_WARN_因为你稍后会需要它们|r
    >>|cRXP_WARN_在接下来的步骤中，一定要非常小心地管理你的资金。只购买必要的法术。你需要有钱才能很快消失，并且需要 75 银才能在返回湿地后获得符文|r
    .train 921 >>列车 |T133644:0|t[扒窃]
    .train 1804 >>列车 |T136058:0|t[撬锁]
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .dungeon !DM
    .train 921,1
step << Rogue
    #xprate >1.59
    #label RogueTrainNoDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保你训练了|r |T136058:0|t[Pick Lock] |cRXP_WARN_因为你稍后会需要它|r
    >>|cRXP_WARN_在接下来的步骤中，一定要非常小心地管理你的资金。只购买必要的法术。你需要有钱才能很快消失，并且需要 75 银才能在返回湿地后获得符文|r
    .train 1804 >>列车 |T136058:0|t[撬锁]
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.799,53.815,15,0
    .goto 1453,77.290,58.138,12,0
    .goto 1453,78.466,60.034,12,0
    .goto 1453,78.560,58.435,6,0
    .goto 1453,75.754,60.369,12 >>前往 SI:7 楼上的 |cRXP_FRIENDLY_Renzik \"The Shiv\"|r 和 |cRXP_FRIENDLY_马蒂亚斯·肖大师|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_\"剃刀\"雷吉克|r, |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r
    .accept 2281 >>接任务: |cRXP_LOOT_赤脊山的联络员|r
    .goto StormwindClassic,75.76,60.35
    .target +“剃刀”雷吉克
    .accept 2360 >>接任务: |cRXP_LOOT_马迪亚斯和迪菲亚潜行者|r
    .goto StormwindClassic,75.78,59.84
    .target +马蒂亚斯·肖大师
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛尔达·维勒|r, 他在里面
    >>|cRXP_BUY_从她那里购买 a|r |T135342:0|t[Kris] |cRXP_BUY_或者去拍卖行看看有没有更好/更便宜的|r
    >>|cRXP_WARN_在接下来的步骤中，一定要非常小心地管理你的资金。如果你没有钱，就只买一把匕首。你需要有钱才能很快消失，并且返回湿地后需要 75 银才能获得符文|r
    .collect 2209,2 --Kris (2)
    .target Marda Weller
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛尔达·维勒|r
    >>|cRXP_WARN_如果你能负担得起的话，从她那里买一个|r |T135342:0|t[Kris] |cRXP_BUY_|r
    >>|cRXP_WARN_在接下来的步骤中，一定要非常小心地管理你的资金。如果你没有钱，就只买一把匕首。你需要有钱才能很快消失，并且返回湿地后需要 75 银才能获得符文|r
    .collect 2209,1 --Kris (2)
    .target Marda Weller
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith NoDMStockadeEnd
    +|cRXP_WARN_装备|r |T135342:0|t[克里斯]
    .use 2209
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .xp <21,1
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师亚克森|r
    >>稍后为你的 |T132290:0|t[毒药] 任务购买 |T134437：0|吨[抗毒液]，其余的则很快在赤脊山更快地交付 << !Dwarf
    >>购买以下物品以便更快地在赤脊山上交 << Dwarf
    >>这将节省你的时间，因为你不需要到处寻找怪物来杀死。如果你不想购买任何怪物，请跳过此步骤
    >>|T134437：0|吨[抗毒] << !Dwarf
    >>|T134172:0|t[巨大血牙兽]
    >>|T134028:0|t[坚韧的秃鹫肉]
    >>|T134321:0|t[酥脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf --Anti-Venom (1)
    .collect 2296,5,92,1 -- 大血牙 Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target Auctioneer Jaxon
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #completewith GryanAll << Human
    #optional << Human
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fp Stormwind >>获取暴风城飞行路线 << !Human
    .fly Westfall >>飞往西部荒野 << Human
    .target Dungar Longdrink
    .zoneskip Westfall << Human
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label GryanAll << Human
    .goto Westfall,56.33,47.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .fp Sentinel Hill >>获取哨兵岭飞行路线 << !Human
    .fly Redridge >>飞往赤脊山 << Human
    .target Thor
    .dungeon !DM
step << Human Rogue
    #xprate >1.59
    #optional
    #completewith WileyStart
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Redridge >>飞往赤脊山
    .target Dungar Longdrink
    .zoneskip Stormwind City,1
    .isOnQuest 65
    .dungeon !DM
step << !Human Rogue
    #xprate >1.59
    .goto Elwynn Forest,65.20,69.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞欧克瑞图斯|r
    .accept 94 >>接任务: |cRXP_LOOT_法师的眼线|r
    .target Theocritus
    .dungeon !DM
step << !Human Rogue
    #xprate >1.59
    #optional
    #completewith WileyStart
    .goto Redridge Mountains,15.27,71.45
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    .dungeon !DM
step << Rogue
    #xprate >1.59 << !Hunter
    #optional
    .goto Redridge Mountains,22.67,43.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厨师布雷纳|r, 他在里面
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
    .itemcount 2296,5 -- 大血牙 Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target Chef Breanna
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label WileyStart
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑衣威利|r, 他在楼上
    .turnin 65 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 132 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
	.target Wiley the Black
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label Rendevous
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卢修斯|r
    .turnin 2281 >>交任务: |cRXP_FRIENDLY_赤脊山的联络员|r
    .accept 2282 >>接任务: |cRXP_LOOT_奥瑟尔伐木场|r
    .target Lucius
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,32.2,48.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头奥斯洛|r
    .accept 89 >>接任务: |cRXP_LOOT_止水湖上的桥|r
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
    >>你可以在前往 Alther's Mill 的路上杀死一些豺狼人。你将在回来的路上完成这个目标
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .isOnQuest 89
    .dungeon !DM
    .mob Redridge Brute
    .mob Redridge Mystic
    .mob Redridge Basher
step << Rogue
    #xprate >1.59
    .goto 1433,51.846,45.116,100 >>前往 Alther's Mill
step << Rogue
    #xprate >1.59
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_你必须为你的|r |T132290:0|t[Poisons] |cRXP_WARN_quest 稍后完成此操作|r
    >>|cRXP_WARN_站在航点位置。调整相机和光标的位置，直到您可以一次点击 3 |cRXP_PICK_Practice Lockboxes|r 而无需移动任何东西|r
    .skill lockpicking,80 >>|cRXP_WARN_打开 Alther's Mill 地面上的 |cRXP_PICK_Practice Lockboxes|r 直到你的|r |T136058:0|t[Lockpicking] 技能达到 80|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
	.goto Redridge Mountains,52.05,44.69
    >>打开 |cRXP_PICK_Lucius 的锁箱|r。从中获取 |cRXP_LOOT_盗窃令牌|r
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
    >>完成对桥梁部分的杀戮 |cRXP_WARN_gnolls|r
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .isOnQuest 89
    .dungeon !DM
    .mob Redridge Brute
    .mob Redridge Mystic
    .mob Redridge Basher
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,32.2,48.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头奥斯洛|r
    .turnin 89 >>交任务: |cRXP_FRIENDLY_止水湖上的桥|r
    .isQuestComplete 89
    .target 工头奥斯洛
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,28.07,52.02
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卢修斯|r
    .turnin 2282 >>交任务: |cRXP_FRIENDLY_奥瑟尔伐木场|r
    .target Lucius
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith DefiasWestfall2
    .destroy 7907 >>摧毁: |cRXP_ENEMY_偷窃技能认证书|r, 它在你的背包中. 不再需要它了
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .xp 21+14325 >>在离开红岭之前，请确保您至少有 14k 经验值达到 21 级。如果您还没有到达那里，请考虑执行 |cRXP_FRIENDLY_Shawn|r 的 |cRXP_ENEMY_Hilary's Necklace|r 任务或 |cRXP_FRIENDLY_工头奥斯洛|r 的 |cRXP_ENEMY_The Lost Tools|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
    .fp Redridge Mountains >>获取赤脊山飞行路线 << !Human
    .fly Westfall >>飞往西部荒野
    .target Ariena Stormfeather
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label DefiasWestfall2
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 132 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 135 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
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
    >>杀死 |cRXP_ENEMY_Pygmy 毒网蜘蛛|r 和 |cRXP_ENEMY_毒网蜘蛛|r。从它们身上搜刮 |cRXP_LOOT_小毒囊|r 和 |cRXP_LOOT_粘稠蜘蛛腿|r
    >>|cRXP_WARN_你需要一个 |cRXP_LOOT_Small Venom Sac|r 来制作|r |T134437：0|吨[抗毒] |cRXP_WARN_later 来稍后移除|r |T136230:0|t[Touch of Zanzil] |cRXP_WARN_debuff|r
    >>|cRXP_WARN_保存 |cRXP_LOOT_Gooey Spider Legs|r 以供日后使用|r
    >>|cRXP_WARN_如果您有|r |T626003:0|t|cFFF48CBAPaladin|r |cRXP_WARN_or|r |T625999:0|t|cFFFF7C0ADruid|r |cRXP_WARN_friend，您可以跳过此步骤并要求他们稍后为您删除它|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob Pygmy Venom Web Spider
    .mob Venom Web Spider
    .itemcount 6452,<1 --Anti Venom (<1)
    .isQuestAvailable 2359
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==关注接下来的部分==|r
    >>|cRXP_WARN_按 Esc，然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用互动键”，并将“与目标互动”选项绑定到按键|r
    >>|cRXP_WARN_此外，建议你启用敌人铭牌（默认键：V），因为它可以让你看到塔内某些角落后面的敌人|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_密探吉尔妮|r
    >>|cRXP_WARN_你必须完成这个任务你的|r |T132290:0|t[毒药]
    .turnin 2360 >>交任务: |cRXP_FRIENDLY_马迪亚斯和迪菲亚潜行者|r
    .accept 2359 >>接任务: |cRXP_LOOT_克拉文之塔|r
    .target Agent Kearnen
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
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_畸形迪菲亚无人机|r。将其拾取以获得 |cRXP_LOOT_迪菲亚塔钥匙|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    >>|cRXP_WARN_|cRXP_ENEMY_Malformed Defias Drone|出现在塔的入口处，然后在塔的外围巡逻|r
    >>|cRXP_WARN_小心，因为他会造成大量伤害。如果你的|r |T132320:0|t[隐身] |cRXP_WARN_被打破，请快速使用|r |T132307:0|t[冲刺] |cRXP_WARN_并逃跑|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频指南
    .mob Malformed Defias Drone
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith Mortwake
    +|cRXP_WARN_如果你还没有|r |T135641:0|t[Dagger] |cRXP_WARN_equipped，请装备|r |T135641:0|t[Curvewood Dagger] |cRXP_WARN_for此任务|r
    .use 15396
    .itemcount 15396,1
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔顶第二层。当 |r |T132320:0|t[潜行] |cRXP_WARN_并且 |cRXP_ENEMY_Defias 塔哨兵|r 不在你身边时，跳到椅子上，然后跳到灯上，然后跳到路径点位置顶部的书架上|r
    >>|cRXP_WARN_手动|r |T132320:0|t[Unstealth]|cRXP_WARN_，然后按“与目标互动”键打开|cRXP_PICK_Duskwood Chest|r。从中获取|r |cRXP_LOOT_Klaven Mortwake 的日记|r
    >>|cRXP_WARN_注意：你的|r|T132320:0|t[隐身]|cRXP_WARN_在掠夺后会暂时停止工作|r|cRXP_LOOT_Klaven Mortwake的日记|r
    >>|cRXP_WARN_如果你没能杀死二楼的 |cRXP_ENEMY_Defias Tower Sentries|r，就要做好逃跑的准备。当你在书架顶部时，它们很可能会永久地激怒你（但不会攻击你），因为这是一个躲避点|r
    >>|cRXP_WARN_如果你的包里或装备中有|r |T135641:0|t[匕首] |cRXP_WARN_，你可以对里面的|cRXP_ENEMY_Defias 塔巡逻者|r 和 |cRXP_ENEMY_Defias 塔哨兵|r 施放|r |T132282:0|t[伏击] |cRXP_WARN_，立即杀死它们。杀死第一个|cRXP_ENEMY_Defias 塔哨兵|r 后，请做好逃跑的准备，并记住你可能会被从上面击中。这样速度会慢一些，但安全得多|r
    >>|cRXP_WARN_如果你必须跑出塔楼，请小心，因为 |cRXP_ENEMY_Malformed Defias Drone|r 和 |cRXP_ENEMY_Defias Drones|r 可能位于塔楼入口处|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频指南
    .mob Defias Tower Patroller
    .mob Defias Tower Sentry
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >>制作 |T134437：0|吨[抗毒液]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437：0|吨[抗毒] 来消除 |T136230:0|t[Touch of Zanzil] 减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .dungeon !DM
step << Dwarf Rogue
    #xprate >1.59
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石像形态] 来消除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .aura -9991
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .xp 22-8200 >>一直磨练直到你距离 22 级还有 8200 经验值。你需要到达暴风城来训练 |T132331:0|t[消失]，这是之后获得极其强大的符文所必需的
step << Rogue
    #xprate >1.59
    #optional
    #completewith KlavenFinish
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .fly Stormwind >>飞往暴风城
    .target Thor
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >>前往 |cRXP_FRIENDLY_Shaina Fuller|r
    .aura -9991
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_珊娜·弗勒|r
    >>|cRXP_WARN_如果您有|r |T626003:0|t|cFFF48CBAPaladin|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0ADruid|r |cRXP_WARN_朋友，请他们为您删除|r |T136230:0|t[Touch of Zanzil] |cRXP_WARN_|r
    .skill firstaid,80 >>|cRXP_WARN_你的|r |T135966:0|t[急救] |cRXP_WARN_to 等级为 80|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_珊娜·弗勒|r
    >>|cRXP_WARN_如果您有|r |T626003:0|t|cFFF48CBAPaladin|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0ADruid|r |cRXP_WARN_朋友，请他们为您删除|r |T136230:0|t[Touch of Zanzil] |cRXP_WARN_|r
    .train 7934 >>|cRXP_WARN_Train|r |T134437：0|吨[反毒液]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >>制作 |T134437：0|吨[抗毒液]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437：0|吨[抗毒] 来消除 |T136230:0|t[Touch of Zanzil] 减益效果|r
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
    .goto StormwindClassic,78.67,60.13,10 >>进入 SI:7 总部。走上楼梯前往 |cRXP_FRIENDLY_马蒂亚斯·肖大师|r
    .dungeon !DM
step << Rogue
    #xprate >1.59 << !Hunter
    #label KlavenFinish
    .goto Stormwind City,75.78,59.84
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r
    >>|cRXP_WARN_如果你切换到 a|r |T135641:0|t[Dagger] |cRXP_WARN_earlier，请记得重新装备你的主要武器|r << Rogue !sod
    .turnin 135 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
--  .accept 141 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .turnin 2359 >>交任务: |cRXP_FRIENDLY_克拉文之塔|r
    .target 马蒂亚斯·肖大师
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Stormwind City,78.2,58.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贾斯伯·菲尔|r
    >>从他那里购买制作 |T132273:0|t[|cRXP_FRIENDLY_Instant Poison|r] 和 |T132331:0|t[|cRXP_FRIENDLY_Vanish|r] 的试剂
    .collect 3371,20 --Empty Vial (20)
    .collect 2928,20 -Dust of Decay (20)
    .collect 5140,20 --Flash Powder (20)
    .target Jasper Fel
step << Rogue
    #xprate >1.59
    >>打开你的法术书，从常规选项卡中找到 |T136242:0|t[|cRXP_FRIENDLY_Poisons|r] 技能。打开它并制作 20 剂速效毒药。|cRXP_WARN_记住在战斗期间将它们涂抹在你的两把武器上|r
    .collect 6947,20 --Instant Poison (20)
step << Rogue
    #xprate >1.59
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_在接下来的步骤中，一定要非常小心地管理你的资金。只购买必要的法术。在湿地完成几个任务后，你将需要 75 银币才能获得符文|r
    >>|cRXP_WARN_Train|r |T132331:0|t[消失] 和 |T132320:0|t[隐身] (等级 2) 你很快将需要它来解锁 |T236270:0|t[致命酿造]
    .train 1856 >>列车 |T132331:0|t[消失]
    .train 1785 >>训练 |T132320:0|t[隐身](等级 2)
    .target Osborne the Night Man
    .dungeon !DM


----End of 2x Non-Deadmines Rogue Class q section----


step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .hs >>炉石到米奈希尔港。|cRXP_WARN_贫民窟炉石，如果正在冷却，则改为从监狱炉石|r
step << Rogue
    #xprate >1.59
    .goto StormwindClassic,39.834,54.360
    >>|cRXP_WARN_进入暴风城监狱|r
    >>|cRXP_WARN_一旦进入:|r
    .link /run InviteUnit("a");C_Timer.After(1,function() LeaveParty() end) >>|cRXP_WARN_单击此处将此宏复制并粘贴到聊天中，然后返回 Auberdine|r
    .zone Darkshore >>|cRXP_WARN_前往: |cRXP_PICK_黑海岸|r|r
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
    .subzone 2257 >>进入 Deeprun 有轨电车
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
    >>|cRXP_WARN_升级你的|r |T135966:0|t[急救] |cRXP_WARN_和|r |T133971:0|t[烹饪] |cRXP_WARN_如果需要在电车上|r
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_考格斯宾|r
    .vendor 5175 >>|cRXP_BUY_从他那里购买 a|r |T133024:0|t[青铜管] |cRXP_BUY_ （如果它上涨的话）|r
--    >>你稍后需要 2 个青铜管来完成任务 << Rogue
    .target Gearcutter Cogspinner
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fp Ironforge >>获取铁炉堡飞行路线
    .target Gryth Thurden
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Wetlands
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_Book: The Powers Below|r] 开始任务|r
    .accept 968 >>接任务: |cRXP_LOOT_深渊之神|r
    .use 5352
    .itemcount 5352,1
    .zoneskip Ironforge,1
    .zoneskip Wetlands
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_葛利·硬骨|r, 他在里面
    .turnin 968 >>交任务: |cRXP_FRIENDLY_深渊之神|r
    .target Gerrig Bonegrip
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fly Menethil >>飞往湿地
    .zoneskip Ironforge,1
    .cooldown item,6948,<0
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
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
    >>|cRXP_WARN_你现在将开始前往死亡矿井|r
    >>|cRXP_WARN_如果需要，请在等待前往米奈希尔港的船时升级你的|r |T135966:0|t[急救] |cRXP_WARN_|r << Warrior/Paladin/Rogue
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << !NightElf
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r
    .fly Ironforge >>飞往铁炉堡
    .target Shellei Brondir
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r
    .fp Menethil Harbor >>获取米奈希尔港飞行路线
    .target Shellei Brondir
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto Wetlands,5.485,64.156,40 >>从码头末端跳下，游向航点
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    .goto Wetlands,2.433,78.689,-1
    .goto Ironforge,17.089,83.373,-1
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r，使用角色解困自助服务功能传送到铁炉堡。您必须在该位置注销并登录另一个角色并呼出帮助菜单，然后向下滚动到自助​​服务。如果您无法解困，请跳过此步骤。
    .link https://www.youtube.com/watch?v=oVoxsr4zcg4 >>点击此处查看视频参考
    .link https://us.battle.net/support/en/help/product/wow/197/834/solution >>点击此处查看未卡住的链接
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
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
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
    .goto Westfall,56.55,52.64,100 >>沿着海岸跑，前往哨兵岭
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .fp Sentinel Hill >>获取哨兵岭飞行路线
    .target Thor
    .zoneskip Ironforge --Skips if you didn't swim from Wetlands
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Westfall,56.33,47.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
    .zoneskip Westfall,1
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Elwynn Forest,36.809,72.429,100,0
    .goto StormwindClassic,69.961,86.583
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .dungeon DM
step << NightElf Priest
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20,0
    .goto StormwindClassic,38.54,26.86,20 >>前往暴风城大教堂内的|cRXP_FRIENDLY_大祭司劳伦娜|r
    .zoneskip Stormwind City,1
    .dungeon DM
step << NightElf Priest
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r, 他在里面
    .trainer >>训练你的职业法术
    .target High Priestess Laurena
    .zoneskip Stormwind City,1
    .dungeon DM
--XX Alt if NE priest cant website unstuck




----End of Hunter/All Night Elves 2x Deadmines swim to Westfall Alternative (and Alt NE Priest Training) section----





step << NightElf Warrior/NightElf Hunter
    #xprate >1.59 << !Hunter
    #optional
    .goto Ironforge,61.177,89.508
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布里维夫·石拳|r, 他在里面
    .train 197 >>训练 2h 斧头 << Warrior
    .train 199 >>训练 2h Maces << Warrior
    .train 266 >>火车枪 << Hunter
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布雷文·寒钢|r, 他在楼下
    >>|cRXP_BUY_从她那里购买|r |T135425:0|t[Keen Throwing Knives] |cRXP_BUY_|r
    .collect 3107,1 --Collect Keen Throwing Knife (200)
    .target Brenwyn Wintersteel
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
    +|cRXP_WARN_Equip the|r |T135425:0|t[敏锐的投掷刀具]
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fp Ironforge >>获取铁炉堡飞行路线
    .target Gryth Thurden
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_Book: The Powers Below|r] 开始任务|r
    .accept 968 >>接任务: |cRXP_LOOT_深渊之神|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_葛利·硬骨|r, 他在里面
    .turnin 968 >>交任务: |cRXP_FRIENDLY_深渊之神|r
    .target Gerrig Bonegrip
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
    .goto Ironforge,31.32,27.80,12 >>前往 |cRXP_FRIENDLY_Ginny Longberry|r 内部
    .dungeon DM
step << Mage
    #xprate >1.59
    .goto Ironforge,31.32,27.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉恩|r, 他在里面
    >>|cRXP_BUY_从她那里购买最多 4|r |T134419:0|t[传送符文] |cRXP_BUY_|r
    .collect 17031,4 --Rune of Teleportation (4)
    .target Ginny Longberry
    .dungeon DM
step << Mage
    #xprate >1.59
    #label MilstaffDM
    .goto Ironforge,25.50,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贝尔斯塔弗·风暴之眼|r
    .train 3562 >>火车 |T135757:0|t[传送：铁炉堡]
    .target Milstaff Stormeye
    .dungeon DM
step << Mage
    #xprate >1.59
    .goto Ironforge,27.18,8.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_丁克|r
    .trainer >>训练你的职业法术
    .target Dink
    .dungeon DM
step << Priest
    #xprate >1.59
    #optional << NightElf
    .goto Ironforge,25.207,10.756
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托德雷·铁矿|r
    .trainer >>训练你的职业法术
    .target Toldren Deepiron
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
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_Jump on top of the pillar above |cRXP_FRIENDLY_Bink|r, then walk slightly east of her onto the arrow position. 前往: |cRXP_PICK_丹莫罗|r, 调整你的角色，直到它们看起来像是漂浮起来，然后通过退出并重新登录来执行跳过操作|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << skip --Warlock
    #xprate >1.59
    .goto Ironforge,51.1,8.7,15,0
    .goto Ironforge,50.343,5.657
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布瑞尔索恩|r
    .trainer >>训练你的职业法术
    .target Briarthorn
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << skip --Warlock
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    .goto 1455,53.164,7.037,10 >>进入 |cRXP_FRIENDLY_Jubahl Corpseseeker|r 的房子
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
step << skip --Warlock
    #xprate >1.59
    .goto Ironforge,52.701,6.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_寻尸者祖贝尔|r
    .vendor 6382 >>|cRXP_BUY_如果你愿意的话，可以购买|r |T133738:0|t[魔法书] |cRXP_BUY_你的宠物|r
    .target Jubahl Corpseseeker
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << skip --Warlock
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    .goto 1455,52.825,5.060
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶，然后跳到书架顶。通过退出并重新登录来跳过退出|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << !Mage !Priest
    #xprate >1.59 << !Hunter
    #completewith DeeprunDM
    #optional
    .goto 1455,53.164,7.037,10 >>进入 |cRXP_FRIENDLY_Jubahl Corpseseeker|r 的房子
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
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶，然后跳到书架顶。通过退出并重新登录来跳过退出|r
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
    .goto 1455,76.414,51.226,20 |cRXP_WARN_Walk onto the railing next to |cRXP_FRIENDLY_布里维夫·石手|r on the arrow position. 前往: |cRXP_PICK_丹莫罗|r, 调整你的角色，直到它们看起来像是漂浮起来，然后通过退出并重新登录来执行跳过操作|r
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
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到狮鹫的头顶。通过登出并重新登录来跳过登出|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_考格斯宾|r
    .vendor 5175 >>|cRXP_BUY_从他那里购买 a|r |T133024:0|t[青铜管] |cRXP_BUY_ （如果它上涨的话）|r
--    >>你稍后需要 2 个青铜管来完成任务 << Rogue
    .target Gearcutter Cogspinner
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
    .subzone 2257 >>进入 Deeprun 有轨电车
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional << NightElf
    #completewith ShoniAccept
    >>|cRXP_WARN_升级你的|r |T135966:0|t[急救] |cRXP_WARN_和|r |T133971:0|t[烹饪] |cRXP_WARN_如果需要在电车上|r
    >>|cRXP_WARN_你需要你的|r |T135966:0|t[急救] |cRXP_WARN_达到 80 以上才能完成稍后的任务|r << Rogue !Dwarf
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Westfall
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_比利巴布·旋轮|r
    .vendor 5519 >>|cRXP_BUY_从他那里购买 a|r |T133024:0|t[青铜管] |cRXP_BUY_（如果价格上涨）|r
--    >>你稍后需要 2 个青铜管来完成任务 << Rogue
    .bronzetube
    .target Billibub Cogspinner
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label ShoniAccept
    .goto StormwindClassic,55.510,12.504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沉默的舒尼|r
    .accept 2040 >>接任务: |cRXP_WARN_地底突袭|r
    .target Shoni the Shilent
    .dungeon DM
step << Human
    #xprate >1.59
    .goto StormwindClassic,58.08,16.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗伦·长须|r
    .turnin 1338 >>交任务: |cRXP_FRIENDLY_卡尔·雷矛的订单|r
    .target Furen Longbeard
    .isOnQuest 1338
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .accept 167 >>接任务: |cRXP_WARN_我的兄弟……|r
    .accept 168 >>接任务: |cRXP_WARN_收集记忆|r
    .goto StormwindClassic,65.438,21.175
    .target Wilder Thistlenettle
    .target Shoni the Shilent
    .dungeon DM
step << Hunter
--   #xprate >1.59
    #sticky
    #label DMPetTrain
    .goto 1453,61.576,15.998
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡瑞娜·麦肯达|r, 他在里面
    .trainer 2879 >>训练你的宠物法术
    .target Karrina Mekenda
    .dungeon DM
step << Hunter
--   #xprate >1.59
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_恩瑞斯·锐矛|r, 他在里面
    .trainer 5515 >>训练你的职业法术
    .target Einris Brightspear
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #requires DMPetTrain << Hunter
    .goto StormwindClassic,65.438,21.175
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维尔德·蓟草|r, 他在里面
    .accept 167 >>接任务: |cRXP_WARN_我的兄弟……|r
    .accept 168 >>接任务: |cRXP_WARN_收集记忆|r
    .target Wilder Thistlenettle
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith RogueTrainDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_训练|r |T132282:0|t[伏击] |cRXP_WARN_如果你有多余的钱并且|r |T135641:0|t[匕首] |cRXP_WARN_装备好或者放在包里。这会为你节省时间|r
    .train 8676 >>列车 |T132282:0|t[伏击]
    .target Osborne the Night Man
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保你训练了|r |T132320:0|t[隐身]|cRXP_WARN_、|r |T133644:0|t[扒窃]|cRXP_WARN_和|r |T136058:0|t[撬锁] |cRXP_WARN_，因为你稍后会需要它们|r
    .train 1784 >>列车 |T132320:0|t[隐身]
    .train 921 >>列车 |T133644:0|t[扒窃]
    .train 1804 >>列车 |T136058:0|t[撬锁]
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .dungeon DM
    .train 1784,1
    .train 921,1
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保你训练了|r |T133644:0|t[扒窃]|cRXP_WARN_和|r |T136058:0|t[撬锁] |cRXP_WARN_因为你稍后会需要它们|r
    .train 921 >>列车 |T133644:0|t[扒窃]
    .train 1804 >>列车 |T136058:0|t[撬锁]
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .dungeon DM
    .train 921,1
step << Rogue
    #xprate >1.59
    #label RogueTrainDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保你训练了|r |T136058:0|t[Pick Lock] |cRXP_WARN_因为你稍后会需要它|r
    .train 1804 >>列车 |T136058:0|t[撬锁]
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.799,53.815,15,0
    .goto 1453,77.290,58.138,12,0
    .goto 1453,78.466,60.034,12,0
    .goto 1453,78.560,58.435,6,0
    .goto 1453,75.754,60.369,12 >>前往 SI:7 楼上的 |cRXP_FRIENDLY_Renzik \"The Shiv\"|r 和 |cRXP_FRIENDLY_马蒂亚斯·肖大师|r
    .dungeon DM
step << Rogue
    #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_\"剃刀\"雷吉克|r, |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r
    .accept 2281 >>接任务: |cRXP_LOOT_赤脊山的联络员|r
    .goto StormwindClassic,75.76,60.35
    .target +“剃刀”雷吉克
    .accept 2360 >>接任务: |cRXP_LOOT_马迪亚斯和迪菲亚潜行者|r
    .goto StormwindClassic,75.78,59.84
    .target +马蒂亚斯·肖大师
    .dungeon DM
step << Warrior
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >>前往指挥中心内的|cRXP_FRIENDLY_Wu Shen|r
    .dungeon DM
step << Warrior
    #xprate >1.59
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_武神|r, 他在楼上
    .trainer >>训练你的职业法术
    .target Wu Shen
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吴平|r
    .train 201 >>训练 1h 剑 << Mage/Rogue/Warlock
    .train 1180 >>训练匕首 << Mage/Druid/Priest
    .train 202 >>训练 2h 剑 << Warrior/Paladin/Hunter
    .target Woo Ping
    .dungeon DM
step << NightElf Warrior
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_Equip the|r |T135329:0|t[刽子手之剑]
    .use 4818
    .itemcount 4818,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon DM
step << Rogue
    #xprate >1.59
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛尔达·维勒|r, 他在里面
    >>|cRXP_BUY_从她那里购买一把|r |T135324:0|t[长剑] |cRXP_BUY_或者去拍卖行看看有没有更好/更便宜的|r
    .collect 923,1 --Longsword (1)
    .target Marda Weller
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
    .dungeon DM
step << Rogue
    #xprate >1.59
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛尔达·维勒|r
    >>|cRXP_WARN_如果你能负担得起，就从她那里买一把|r |T135324:0|t[长剑] |cRXP_BUY_|r
    .collect 923,1 --Longsword (1)
    .target Marda Weller
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
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂内的 |cRXP_FRIENDLY_Duthorian Rall|r
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达索瑞恩·拉尔|r, Tome of Valor
    .use 6776 >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_Tome of Valor|r] 开始任务|r
    .collect 6776,1,1649 --Tome of Valor (1)
    .accept 1649 >>接任务: |cRXP_LOOT_勇气之书|r
    .target Duthorian Rall
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin 1649 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .accept 1650 >>接任务: |cRXP_LOOT_勇气之书|r
    .target Duthorian Rall
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,38.58,32.00,12,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_虔诚的亚瑟|r
    .trainer >>训练你的职业法术
    .target Arthur the Faithful
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,21.40,55.80
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿古斯·夜语|r
    .accept 3765 >>接任务: |cRXP_LOOT_遥远的旅途|r
    .target Argos Nightwhisper
    .dungeon DM
step << Paladin/Warrior
    #xprate >1.59
    #ah
    #optional
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛尔达·维勒|r, 他在里面
    >>|cRXP_BUY_从她那里购买 a|r |T135280:0|t[Dacian Falx] |cRXP_BUY_或者去拍卖行看看有没有更好/更便宜的|r
    .collect 922,1,2040,1 --Collect Dacian Falx (1)
    .target Marda Weller
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.0 --Arbitrary number lower than Falx/Exe
    .dungeon DM
step << Paladin/Warrior
    #xprate >1.59
    #optional
    +|cRXP_WARN_装备|r |T135280:0|t[达契亚之镰]
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿德温·凯伦|r, 他在里面
    .vendor 1312 >>|cRXP_BUY_如果你能负担得起，就从她那里买一把|r |T135469:0|t[黄昏魔杖] |cRXP_BUY_|r
    >>|cRXP_BUY_或者，如果价格低于 52s 47c，可以从拍卖行购买 a|r |T135144:0|t[高级魔杖] |cRXP_BUY_|r
    .collect 5211,1 --Dusk Wand (1)
    .disablecheckbox
    .target Ardwyn Cailen
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
    .dungeon DM
step << Warlock/Priest
    #xprate >1.59
    #ssf
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿德温·凯伦|r, 他在里面
    >>|cRXP_BUY_从她那里购买 a|r |T135469:0|t[黄昏魔杖] |cRXP_BUY_|r
    .collect 5211,1 --Dusk Wand (1)
    .target Ardwyn Cailen
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
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .dungeon DM
step << Warlock/Priest
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r |T135144:0|t[高级魔杖]
    .use 11288
    .itemcount 11288,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .dungeon DM
step << Warlock
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>进入被屠宰的羔羊。下楼
    .dungeon DM
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厄苏拉·德林|r
    .trainer >>训练你的职业法术
    .target Ursula Deline
    .dungeon DM
step << Warlock
    #xprate >1.59
    #sticky
    #label Torment2DM
    .goto StormwindClassic,25.665,77.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯巴克尔|r
    .vendor >>|cRXP_BUY_从她那里购买|r |T133738:0|t[魔典：折磨 (等级 2)] |cRXP_BUY_|r
    .target Spackle Thornberry
    .itemcount 16346,<1 --Grimoire of Torment (<1)
    .train 20317,1
    .dungeon DM
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑暗缚灵者加科因|r
    .accept 1716 >>接任务: |cRXP_LOOT_噬魂者|r
    .target Gakin the Darkbinder
    .dungeon DM
step << Warlock
    #xprate >1.59
    #sticky
    #label Torment2DMEnd
    #requires Torment2DM
    .train 20317 >>|cRXP_WARN_使用|r |T133738:0|t[折磨魔典 (等级 2)]
    .target Spackle Thornberry
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
    >>登上法师塔。穿过绿色传送门
    .goto Stormwind City,39.681,79.538,15 >>前往 |cRXP_FRIENDLY_拉里曼普渡大学|r
    .dungeon DM
step << Mage
    #xprate >1.59
    .goto Stormwind City,39.681,79.538
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉瑞麦尼·普尔度|r
    .train 3561 >>火车 |T135763:0|t[传送：暴风城]
    .target 拉里曼普渡大学
    .dungeon DM
step << !Paladin
    #xprate >1.59
    .goto StormwindClassic,21.40,55.80
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿古斯·夜语|r
    .accept 3765 >>接任务: |cRXP_LOOT_遥远的旅途|r
    .target Argos Nightwhisper
    .dungeon DM
step << Druid
    #xprate >1.59
    .goto 1453,20.883,55.505
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沙德拉斯·月树|r
    .train 6756 >>训练你的职业法术
    .target Sheldras Moontree
    .dungeon DM
step << Hunter
--  #xprate >1.59
    #optional
    #completewith next
    .goto 1453,50.929,57.781,10 >>进入贸易区中环内的空箭筒
    .dungeon DM
step << Hunter
--  #xprate >1.59
    #ssf
    .goto 1453,49.962,57.638
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗德瑞克·斯图瓦|r
    >>|cRXP_BUY_从他那里购买一个|r |T135489:0|t[重型反曲弓] |cRXP_BUY_和一个|r |T134410:0|t[中型箭筒] |cRXP_BUY_|r
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .collect 11362,1 -- Medium Quiver (1)
    .target Landria
    .money <0.7349
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
    .dungeon DM
step << Hunter
--  #xprate >1.59
    #ah
    .goto 1453,49.962,57.638
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗德瑞克·斯图瓦|r
    >>|cRXP_BUY_从他那里购买 a|r |T135489:0|t[重型反曲弓] |cRXP_BUY_和 a|r |T134410:0|t[中型箭筒] |cRXP_BUY_或者去拍卖行看看有没有更好/更便宜的|r
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .collect 11362,1 -- Medium Quiver (1)
    .target Landria
    .money <0.7349
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
    .dungeon DM
step
    #xprate >1.59
    #ah
    #softcore
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师亚克森|r
    >>稍后为你的 |T132290:0|t[毒药] 任务购买 |T134437：0|吨[抗毒液]，其余的则很快在赤脊山更快地交付 << !Dwarf Rogue
    >>购买以下物品，以便更快地在赤脊山和西部荒野上交 << Paladin
    >>购买以下物品以便更快地在赤脊山上交 << !Paladin !Rogue/Dwarf Rogue
    >>这将节省你的时间，因为你不需要到处寻找怪物来杀死。如果你不想购买任何怪物，请跳过此步骤
    >>|T134437：0|吨[抗毒] << !Dwarf Rogue
    >>|T132794:0|t[一瓶油] << Paladin
    >>|T134172:0|t[巨大血牙兽]
    >>|T134028:0|t[坚韧的秃鹫肉]
    >>|T134321:0|t[酥脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    .collect 814,5,103,1 << Paladin -- Flask of Oil (5)
    .collect 2296,5,92,1 -- 大血牙 Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target Auctioneer Jaxon
    .dungeon DM
step
    #xprate >1.59
    #ah
    #hardcore
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师亚克森|r
    >>稍后为你的 |T132290:0|t[毒药] 任务购买 |T134437：0|吨[抗毒液]，其余的可在不久后在赤脊山和西部荒野更快地交付 << !Dwarf Rogue
    >>购买以下物品，以便更快地在赤脊山和西部荒野上交 << !Rogue/Dwarf Rogue
    >>这将节省你的时间，因为你不需要到处寻找怪物来杀死。如果你不想购买任何怪物，请跳过此步骤
    >>|T134437：0|吨[抗毒] << !Dwarf Rogue
    >>|T132794:0|t[一瓶油]
    >>|T134172:0|t[巨大血牙兽]
    >>|T134028:0|t[坚韧的秃鹫肉]
    >>|T134321:0|t[酥脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    .collect 814,5,103,1 -- Flask of Oil (5)
    .collect 2296,5,92,1 -- 大血牙 Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target Auctioneer Jaxon
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #completewith GryanAll << Human
    #optional << Human
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fp Stormwind >>获取暴风城飞行路线 << !Human
    .fly Westfall >>飞往西部荒野 << Human
    .target Dungar Longdrink
    .zoneskip Westfall << Human
    .dungeon DM
step << !Human
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label GryanAll << Human
    .goto Westfall,56.33,47.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional << Human/Warlock
    #requires Torment2DMEnd << Warlock
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .fp Sentinel Hill >>获取哨兵岭飞行路线 << !Human
    .fly Redridge >>飞往赤脊山 << Human/Warlock
    .target Thor
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Redridge >>飞往赤脊山
    .target Dungar Longdrink
    .zoneskip Stormwind City,1
    .dungeon DM
    .isOnQuest 65
step << !Human !Warlock
    #xprate >1.59 << !Hunter
    .goto Elwynn Forest,65.20,69.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞欧克瑞图斯|r
    .accept 94 >>接任务: |cRXP_LOOT_法师的眼线|r
    .target Theocritus
    .dungeon DM
step << !Human !Warlock
    #xprate >1.59 << !Hunter
    #optional
    #completewith WileyStart
    .goto Redridge Mountains,15.27,71.45
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    .goto Redridge Mountains,22.67,43.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厨师布雷纳|r, 他在里面
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
    .itemcount 2296,5 -- 大血牙 Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target Chef Breanna
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label WileyStart
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑衣威利|r, 他在楼上
    .turnin 65 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 132 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
	.target Wiley the Black
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卢修斯|r
    .turnin 2281 >>交任务: |cRXP_FRIENDLY_赤脊山的联络员|r
    .accept 2282 >>接任务: |cRXP_LOOT_奥瑟尔伐木场|r
    .target Lucius
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_你必须为你的|r |T132290:0|t[Poisons] |cRXP_WARN_quest 稍后完成此操作|r
    >>|cRXP_WARN_站在航点位置。调整相机和光标的位置，直到您可以一次点击 3 |cRXP_PICK_Practice Lockboxes|r 而无需移动任何东西|r
    .skill lockpicking,80 >>|cRXP_WARN_打开 Alther's Mill 地面上的 |cRXP_PICK_Practice Lockboxes|r 直到你的|r |T136058:0|t[Lockpicking] 技能达到 80|r
    .dungeon DM
step << Rogue
    #xprate >1.59
	.goto Redridge Mountains,52.05,44.69
    >>打开 |cRXP_PICK_Lucius 的锁箱|r。从中获取 |cRXP_LOOT_盗窃令牌|r
    .complete 2282,1 --Token of Thievery (1)
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,28.07,52.02
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卢修斯|r
    .turnin 2282 >>交任务: |cRXP_FRIENDLY_奥瑟尔伐木场|r
    .target Lucius
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith DefiasWestfall2
    .destroy 7907 >>摧毁: |cRXP_ENEMY_偷窃技能认证书|r, 它在你的背包中. 不再需要它了
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional << Human/Warlock
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
    .fp Redridge Mountains >>获取赤脊山飞行路线 << !Human !Warlock
    .fly Westfall >>飞往西部荒野
    .target Ariena Stormfeather
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label DefiasWestfall2
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 132 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 135 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
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
    >>杀死 |cRXP_ENEMY_Pygmy 毒网蜘蛛|r 和 |cRXP_ENEMY_毒网蜘蛛|r。从它们身上搜刮 |cRXP_LOOT_小毒囊|r 和 |cRXP_LOOT_粘稠蜘蛛腿|r
    >>|cRXP_WARN_你需要一个 |cRXP_LOOT_Small Venom Sac|r 来制作|r |T134437：0|吨[抗毒] |cRXP_WARN_later 来稍后移除|r |T136230:0|t[Touch of Zanzil] |cRXP_WARN_debuff|r
    >>|cRXP_WARN_保存 |cRXP_LOOT_Gooey Spider Legs|r 以供日后使用|r
    >>|cRXP_WARN_如果您有|r |T626003:0|t|cFFF48CBAPaladin|r |cRXP_WARN_or|r |T625999:0|t|cFFFF7C0ADruid|r |cRXP_WARN_friend，您可以跳过此步骤并要求他们稍后为您删除它|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob Pygmy Venom Web Spider
    .mob Venom Web Spider
    .itemcount 6452,<1 --Anti Venom (<1)
    .isQuestAvailable 2359
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==关注接下来的部分==|r
    >>|cRXP_WARN_按 Esc，然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用互动键”，并将“与目标互动”选项绑定到按键|r
    >>|cRXP_WARN_此外，建议你启用敌人铭牌（默认键：V），因为它可以让你看到塔内某些角落后面的敌人|r
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_密探吉尔妮|r
    >>|cRXP_WARN_你必须完成这个任务你的|r |T132290:0|t[毒药]
    .turnin 2360 >>交任务: |cRXP_FRIENDLY_马迪亚斯和迪菲亚潜行者|r
    .accept 2359 >>接任务: |cRXP_LOOT_克拉文之塔|r
    .target Agent Kearnen
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
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_畸形迪菲亚无人机|r。将其拾取以获得 |cRXP_LOOT_迪菲亚塔钥匙|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    >>|cRXP_WARN_|cRXP_ENEMY_Malformed Defias Drone|出现在塔的入口处，然后在塔的外围巡逻|r
    >>|cRXP_WARN_小心，因为他会造成大量伤害。如果你的|r |T132320:0|t[隐身] |cRXP_WARN_被打破，请快速使用|r |T132307:0|t[冲刺] |cRXP_WARN_并逃跑|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频指南
    .mob Malformed Defias Drone
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith Mortwake
    +|cRXP_WARN_如果你还没有|r |T135641:0|t[Dagger] |cRXP_WARN_equipped，请装备|r |T135641:0|t[Curvewood Dagger] |cRXP_WARN_for此任务|r
    .use 15396
    .itemcount 15396,1
    .dungeon DM
step << Rogue
    #xprate >1.59
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔顶第二层。当 |r |T132320:0|t[潜行] |cRXP_WARN_并且 |cRXP_ENEMY_Defias 塔哨兵|r 不在你身边时，跳到椅子上，然后跳到灯上，然后跳到路径点位置顶部的书架上|r
    >>|cRXP_WARN_手动|r |T132320:0|t[Unstealth]|cRXP_WARN_，然后按“与目标互动”键打开|cRXP_PICK_Duskwood Chest|r。从中获取|r |cRXP_LOOT_Klaven Mortwake 的日记|r
    >>|cRXP_WARN_注意：你的|r|T132320:0|t[隐身]|cRXP_WARN_在掠夺后会暂时停止工作|r|cRXP_LOOT_Klaven Mortwake的日记|r
    >>|cRXP_WARN_如果你没能杀死二楼的 |cRXP_ENEMY_Defias Tower Sentries|r，就要做好逃跑的准备。当你在书架顶部时，它们很可能会永久地激怒你（但不会攻击你），因为这是一个躲避点|r
    >>|cRXP_WARN_如果你的包里或装备中有|r |T135641:0|t[匕首] |cRXP_WARN_，你可以对里面的|cRXP_ENEMY_Defias 塔巡逻者|r 和 |cRXP_ENEMY_Defias 塔哨兵|r 施放|r |T132282:0|t[伏击] |cRXP_WARN_，立即杀死它们。杀死第一个|cRXP_ENEMY_Defias 塔哨兵|r 后，请做好逃跑的准备，并记住你可能会被从上面击中。这样速度会慢一些，但安全得多|r
    >>|cRXP_WARN_如果你必须跑出塔楼，请小心，因为 |cRXP_ENEMY_Malformed Defias Drone|r 和 |cRXP_ENEMY_Defias Drones|r 可能位于塔楼入口处|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频指南
    .mob Defias Tower Patroller
    .mob Defias Tower Sentry
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >>制作 |T134437：0|吨[抗毒液]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437：0|吨[抗毒] 来消除 |T136230:0|t[Touch of Zanzil] 减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .dungeon DM
step << Dwarf Rogue
    #xprate >1.59
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石像形态] 来消除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .aura -9991
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #completewith KlavenFinish
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .fly Stormwind >>飞往暴风城
    .target Thor
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >>前往 |cRXP_FRIENDLY_Shaina Fuller|r
    .aura -9991
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_珊娜·弗勒|r
    >>|cRXP_WARN_如果您有|r |T626003:0|t|cFFF48CBAPaladin|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0ADruid|r |cRXP_WARN_朋友，请他们为您删除|r |T136230:0|t[Touch of Zanzil] |cRXP_WARN_|r
    .skill firstaid,80 >>|cRXP_WARN_你的|r |T135966:0|t[急救] |cRXP_WARN_to 等级为 80|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_珊娜·弗勒|r
    >>|cRXP_WARN_如果您有|r |T626003:0|t|cFFF48CBAPaladin|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0ADruid|r |cRXP_WARN_朋友，请他们为您删除|r |T136230:0|t[Touch of Zanzil] |cRXP_WARN_|r
    .train 7934 >>|cRXP_WARN_Train|r |T134437：0|吨[反毒液]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >>制作 |T134437：0|吨[抗毒液]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437：0|吨[抗毒] 来消除 |T136230:0|t[Touch of Zanzil] 减益效果|r
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
    .goto StormwindClassic,78.67,60.13,10 >>进入 SI:7 总部。走上楼梯前往 |cRXP_FRIENDLY_马蒂亚斯·肖大师|r
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label KlavenFinish
    .goto Stormwind City,75.78,59.84
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r
    >>|cRXP_WARN_如果你切换到 a|r |T135641:0|t[Dagger] |cRXP_WARN_earlier，请记得重新装备你的主要武器|r << Rogue
    .turnin 135 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 141 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .turnin 2359 >>交任务: |cRXP_FRIENDLY_克拉文之塔|r << Rogue
    .target 马蒂亚斯·肖大师
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #completewith BandanaStart
    +开始组建一支前往死亡矿井的队伍
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Westfall >>飞往西部荒野
    .target Dungar Longdrink
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 141 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 142 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
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
    .goto Westfall,44.50,69.62,55 >>前往 Moonbrook 的交通
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,44.50,69.62
    .line Westfall,44.50,69.62,44.50,69.62,45.08,69.40,45.21,69.35,45.63,68.69,45.85,67.73,45.62,66.99,45.52,65.71,45.61,64.95,44.28,63.88,44.26,62.80,43.60,59.89,43.37,58.42,43.26,57.01,43.12,54.24,42.15,52.74,41.74,51.42,41.48,49.89,40.91,48.71,38.93,46.05,38.51,45.46,37.85,45.54,36.60,44.21,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.26,43.77,36.87,42.87,36.95,40.85,37.04,39.79,37.91,36.98,39.06,35.58,40.48,34.31,41.27,32.87,41.76,31.27,42.26,30.26,43.20,28.99,44.29,28.19,44.64,26.85,44.57,24.94,44.64,26.85,44.29,28.19,43.20,28.99,42.26,30.26,41.76,31.27,41.27,32.87,40.48,34.31,39.06,35.58,37.91,36.98,37.04,39.79,36.95,40.85,36.87,42.87,36.26,43.77,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.60,44.21,37.85,45.54,38.51,45.46,38.93,46.05,40.91,48.71,41.48,49.89,41.74,51.42,42.15,52.74,43.12,54.24,43.26,57.01,43.37,58.42,43.60,59.89,44.26,62.80,44.28,63.88,45.61,64.95,45.52,65.71,45.62,66.99,45.85,67.73,45.63,68.69,45.21,69.35,45.08,69.40,44.50,69.62
    >>杀死 |cRXP_ENEMY_Defias Messenger|r。搜刮他的 |cRXP_LOOT_Mysterious Message|r
    >>|cRXP_WARN_|cRXP_ENEMY_Defias Messenger|r 出现在 Moonbrook。他沿着 Moonbrook 北部的道路行走，前往 Gold Coast Quarry 和 Jangolode Mine。如果你在路上没有看到他，请等待他在 Moonbrook 出现|r
    >>|cRXP_WARN_他有 4-5 分钟的重生计时器|r
    .complete 142,1 -- A Mysterious Message (1)
    .unitscan Defias Messenger
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 142 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,55.68,47.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_迪菲亚叛徒|r
    >>|cRXP_WARN_如果他不在那里，你可能需要等待 |cRXP_FRIENDLY_The Defias Traitor|r 出现|r
    >>|cRXP_WARN_如果你已经组建了一支队伍，请确保你的队伍在开始护送之前也已经交了前一部分|r
    .accept 155 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target The Defias Traitor
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,42.56,71.71
    >>护送 |cRXP_FRIENDLY_迪菲亚叛徒|r 到死亡矿井
    >>|cRXP_WARN_时刻待在 |cRXP_FRIENDLY_迪菲亚叛徒|r 身边。到达月溪镇后，做好与 |cRXP_ENEMY_迪菲亚掠夺者|r 和 |cRXP_ENEMY_迪菲亚劫掠者|r 战斗的准备|r
    .complete 155,1 -- Escort The Defias Traitor to discover where VanCleef is hiding (1)
    .target The Defias Traitor
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 155 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 166 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label BandanaStart
    .goto Westfall,56.67,47.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵瑞尔|r, 他在塔上
    .accept 214 >>接任务: |cRXP_WARN_红色丝质面罩|r
    .target Scout Riell
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
    >>|cRXP_WARN_在哨兵岭南部磨练|cRXP_ENEMY_Gnolls|r，同时组建一支死亡矿井小组|r
    .subzone 20 >>当你的团队集合完毕后，前往 Moonbrook
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,42.55,71.69
    .subzone 1581 >>与你的团队一起进入迪菲亚藏身处
    .dungeon DM
step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith EnterDM
    +|cRXP_WARN_装备|r |T135280:0|t[达契亚之镰]
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
    >>杀死 |cRXP_ENEMY_Defias|r。掠夺他们的 |cRXP_LOOT_红色丝绸头巾|r
    >>|cRXP_WARN_你也可以在死亡矿井内完成此操作|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #completewith next
    >>杀死 |cRXP_ENEMY_Skeletal Miners|r、|cRXP_ENEMY_Undead Dynamiters|r 和 |cRXP_ENEMY_Undead Excavators|r。掠夺他们的 |cRXP_LOOT_Cards|r
    >>|cRXP_WARN_这是在地下城外完成的|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>杀死 |cRXP_ENEMY_Foreman Thistlenettle|r。夺取他的 |cRXP_LOOT_Badge|r
    >>|cRXP_WARN_这是在地下城外完成的|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan Foreman Thistlenettle
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>杀死 |cRXP_ENEMY_Skeletal Miners|r、|cRXP_ENEMY_Undead Dynamiters|r 和 |cRXP_ENEMY_Undead Excavators|r。掠夺他们的 |cRXP_LOOT_Cards|r
    >>|cRXP_WARN_这是在地下城外完成的|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label EnterDM
    .goto 1415,40.94,79.76,25,0
    .goto 1415,40.86,79.62,20,0
    .goto 1415,40.678,79.578
    .subzone 1581,2 >>进入死亡矿井地下城
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #softcore
    #optional
    #completewith VanCleef << !Paladin
    #completewith DeadminesBackdoor << Paladin
    >>杀死死亡矿井内的 |cRXP_ENEMY_Defias|r。搜刮他们的 |cRXP_LOOT_红色丝绸头巾|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #hardcore
    #optional
    #completewith DeadminesBackdoor
    >>杀死死亡矿井内的 |cRXP_ENEMY_Defias|r。搜刮他们的 |cRXP_LOOT_红色丝绸头巾|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    >>杀死 |cRXP_ENEMY_Sneed|r。从他身上搜刮 |cRXP_LOOT_Gnoam Sprecklesprocket|r
    .complete 2040,1 -- Gnoam Sprecklesprocket (1)
    .dungeon DM
step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith VanCleef
    +|cRXP_WARN_装备|r |T135280:0|t[达契亚之镰]
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
    >>杀死 |cRXP_ENEMY_Edwin VanCleef|r。搜刮他的 |cRXP_LOOT_Head|r 和 |T133471:0|t[|cRXP_LOOT_An Unsent Letter|r]
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
    >>|cRXP_WARN_询问你的团队是否可以留下来帮助你完成圣骑士专属的|cRXP_FRIENDLY_Daphne Stilwell|r 护送任务（如果可能的话）|r << Paladin
    .subzone 920 >>通过 |cRXP_ENEMY_Edwin VanCleef|r 东边的后出口离开死亡矿井
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1436,39.444,85.755
    .goto 1436,40.010,86.514,20 >>前往 |cRXP_FRIENDLY_Daphne Stilwell|r 她的领域
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达芙妮·斯迪威尔|r
    >>|cRXP_WARN_她在她的田地里稍微巡视了一下|r
    >>|cRXP_WARN_要小心，因为这可能有点困难。你将面对 3 波 3 级、4 波、5 波 17-18 级的敌人 |cRXP_ENEMY_Defias Raiders|r
    .turnin 1650 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .accept 1651,1 >>接任务: |cRXP_LOOT_勇气之书|r
    .link https://youtu.be/1-nnLcqIIlQ?si=kZi41eXT8ZQmSBY2&t=10 >>点击此处查看视频指南
    .target Daphne Stilwell
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto 1436,41.311,88.506
    >>保护 |cRXP_FRIENDLY_Daphne Stilwell|r
    >>|cRXP_WARN_如果您或 |cRXP_FRIENDLY_Daphne Stilwell|r 死亡，任务将失败，您必须重试|r
    >>|cRXP_WARN_要小心，因为这可能有点困难。你将面对 3 波 3 级、4 波、5 波 17-18 级的敌人 |cRXP_ENEMY_Defias Raiders|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达芙妮·斯迪威尔|r
    >>|cRXP_WARN_她在她的田地里稍微巡视了一下|r
    .turnin 1651 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .accept 1652 >>接任务: |cRXP_LOOT_勇气之书|r
    .target Daphne Stilwell
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #hardcore << !Paladin
    #optional
    #completewith next
    .goto Westfall,30.01,86.02,40 >>前往西部荒野灯塔
    .dungeon DM
step
    #xprate >1.59
    #ah
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_葛瑞森船长|r
    .accept 104 >>接任务: |cRXP_WARN_海岸上的威胁|r
    .accept 103 >>接任务: |cRXP_WARN_长明的灯塔|r
    .turnin 103 >>交任务: |cRXP_FRIENDLY_长明的灯塔|r
    .target Captain Grayson
    .itemcount 814,5 -- Flask of Oil (5)
    .dungeon DM
step
    #xprate >1.59
    #ssf
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_葛瑞森船长|r
    .accept 104 >>接任务: |cRXP_WARN_海岸上的威胁|r
    .target Captain Grayson
    .dungeon DM
step
    #xprate >1.59
    #ah
    #optional
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_葛瑞森船长|r
    .accept 104 >>接任务: |cRXP_WARN_海岸上的威胁|r
    .target Captain Grayson
    .dungeon DM
step
    #xprate >1.59
    #hardcore << !Paladin
    .goto Westfall,34.43,83.93
    .line Westfall,34.43,83.93,34.43,83.93,33.88,83.32,33.08,82.86,32.56,82.71,32.08,82.49,31.91,82.36,31.55,81.88,30.86,81.42,30.63,81.16,30.33,80.81,30.02,80.11,29.68,79.22,29.32,78.19,29.29,77.60,29.27,77.31,29.18,76.26,29.07,75.29,28.95,74.14,28.85,73.29,28.79,72.48,28.37,71.94,27.84,71.29,27.44,70.25,27.29,69.47,27.13,68.65,27.09,67.57,27.07,67.01,26.74,66.09,27.07,67.01,27.09,67.57,27.13,68.65,27.29,69.47,27.44,70.25,27.84,71.29,28.37,71.94,28.79,72.48,28.85,73.29,28.95,74.14,29.07,75.29,29.18,76.26,29.27,77.31,29.29,77.60,29.32,78.19,29.68,79.22,30.02,80.11,30.33,80.81,30.63,81.16,30.86,81.42,31.55,81.88,31.91,82.36,32.08,82.49,32.56,82.71,33.08,82.86,33.88,83.32,34.43,83.93
    >>杀死 |cRXP_ENEMY_Old Murk-Eye|r。掠夺他的 |cRXP_LOOT_Scale|r
    >>|cRXP_ENEMY_老 Murk-Eye|r |cRXP_WARN_在海岸上巡逻。如果你找不到他，请跳过此步骤|r
    .complete 104,1 -- Scale of Old Murk-Eye (1)
    .unitscan Old Murk-Eye
    .dungeon DM
step
    #xprate >1.59
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_葛瑞森船长|r
    .turnin 104 >>交任务: |cRXP_FRIENDLY_海岸上的威胁|r
    .target Captain Grayson
    .isQuestComplete 104
    .dungeon DM
step
    #xprate >1.59
    #optional
    #hardcore << !Paladin
    #completewith DeadminesEnd
    .abandon 103 >>抛弃火焰守护者
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto Westfall,42.55,71.69
    .subzone 1581 >>独自进入迪菲亚藏身处
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto 1415,40.678,79.578
    >>杀死死亡矿井副本外的 |cRXP_ENEMY_Defias|r。搜刮他们的 |cRXP_LOOT_红色丝绸头巾|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step << !Paladin
    #xprate >1.59 << !Hunter
    >>杀死死亡矿井内的 |cRXP_ENEMY_Defias|r。搜刮他们的 |cRXP_LOOT_红色丝绸头巾|r
    >>|cRXP_WARN_如果死亡矿井内不再有 |cRXP_ENEMY_Defias|r ，则在矿井外将其消灭|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #softcore
    #completewith DeadminesEnd
    .deathskip >>在 |cRXP_FRIENDLY_Spirit Healer|r 处死亡并重生
    .target Spirit Healer
    .dungeon DM
step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith DeadminesEnd
    +|cRXP_WARN_装备|r |T135280:0|t[达契亚之镰]
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 166 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.67,47.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵瑞尔|r, 他在塔上
    .turnin 214 >>交任务: |cRXP_FRIENDLY_红色丝质面罩|r
    .target Scout Riell
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #sticky
    #label LetterLater
    .abandon 373 >>放弃未发送的信件。你稍后会这样做
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾尔莎林|r
    .train 2138 >>训练你的职业法术
    .target Elsharin
    .xp <22,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional << Mage
    #completewith ShoniEnd
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .fly Stormwind >>飞往暴风城
    .zoneskip Stormwind City
    .target Thor
    .dungeon DM
step << Warlock
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>进入被屠宰的羔羊。下楼
    .xp <22,1
    .dungeon DM
step << Warlock
    #xprate >1.59
    #optional
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厄苏拉·德林|r
    .train 6202 >>训练你的职业法术
    .target Ursula Deline
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
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂内的 |cRXP_FRIENDLY_Duthorian Rall|r
    .xp <22,1
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin 1652 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .accept 1653 >>接任务: |cRXP_LOOT_正义试炼|r
    .target Duthorian Rall
    .xp <22,1
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,38.58,32.00,12,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_虔诚的亚瑟|r
    .train 19835 >>训练你的职业法术
    .target Arthur the Faithful
    .xp <22,1
    .dungeon DM
step << Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20,0
    .goto StormwindClassic,38.54,26.86,20 >>前往暴风城大教堂内的|cRXP_FRIENDLY_大祭司劳伦娜|r
    .xp <22,1
    .dungeon DM
step << Priest
    #xprate >1.59
    #optional
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r, 他在里面
    .train 8103 >>训练你的职业法术
    .target High Priestess Laurena
    .xp <22,1
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    .train 1856 >>训练你的职业法术
    .target Osborne the Night Man
    .xp <22,1
    .dungeon DM
step << Warrior
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >>前往指挥中心内的|cRXP_FRIENDLY_Wu Shen|r
    .xp <22,1
    .dungeon DM
step << Warrior
    #xprate >1.59
    #optional
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_武神|r, 他在楼上
    .train 6192 >>训练你的职业法术
    .target Wu Shen
    .xp <22,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,65.438,21.175
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维尔德·蓟草|r, 他在里面
    .turnin 167 >>交任务: |cRXP_FRIENDLY_我的兄弟……|r
    .turnin 168 >>交任务: |cRXP_FRIENDLY_收集记忆|r
    .target Wilder Thistlenettle
    .dungeon DM
step << skip --Hunter - nothing good to train at 22
    #xprate >1.59
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_恩瑞斯·锐矛|r, 他在里面
    .trainer >>训练你的职业法术
    .target Einris Brightspear
    .xp <22,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label ShoniEnd
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沉默的舒尼|r
    .turnin 2040 >>交任务: |cRXP_FRIENDLY_地底突袭|r
    .goto StormwindClassic,55.510,12.504
    .target Shoni the Shilent
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_比利巴布·旋轮|r
    .vendor 5519 >>|cRXP_BUY_从他那里购买 a|r |T133024:0|t[青铜管] |cRXP_BUY_（如果价格上涨）|r
--    >>你稍后需要 2 个青铜管来完成任务 << Rogue
    .bronzetube
    .target Billibub Cogspinner
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,42.917,34.221,15,0
    .goto 1453,41.385,31.547,15,0
    .goto 1453,39.810,29.788,15
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂内的 |cRXP_FRIENDLY_Duthorian Rall|r
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin 1652 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .accept 1653 >>接任务: |cRXP_LOOT_正义试炼|r
    .target Duthorian Rall
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,38.58,32.00,12,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_虔诚的亚瑟|r
    .train 19835 >>训练你的职业法术
    .target Arthur the Faithful
    .xp <22,1
    .dungeon DM
step << Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20,0
    .goto StormwindClassic,38.54,26.86,20 >>前往暴风城大教堂内的|cRXP_FRIENDLY_大祭司劳伦娜|r
    .xp <22,1
    .dungeon DM
step << Priest
    #xprate >1.59
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r, 他在里面
    .train 8103 >>训练你的职业法术
    .target High Priestess Laurena
    .xp <22,1
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    .train 1856 >>训练你的职业法术
    .target Osborne the Night Man
    .xp <22,1
    .dungeon DM
step << Warrior
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >>前往指挥中心内的|cRXP_FRIENDLY_Wu Shen|r
    .xp <22,1
    .dungeon DM
step << Warrior
    #xprate >1.59
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_武神|r, 他在楼上
    .train 6192 >>训练你的职业法术
    .target Wu Shen
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾尔莎林|r, 他在塔上
    .train 2138 >>训练你的职业法术
    .target Elsharin
    .xp <22,1
    .dungeon DM
step << Druid
    #xprate >1.59
    #optional
    #completewith next
	.cast 18960 >>施法传送：月光林地
	.zoneskip Moonglade
step << Druid
    #xprate >1.59
    #optional
    #completewith next
    .goto Moonglade,52.53,40.57
	>>前往月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_洛甘纳尔|r
    .train 8926 >>训练你的职业法术
    .target Loganaar
    .xp <22,1
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #completewith NEIFFP
    .goto 1453,60.972,11.690,30,0
    .goto 1453,65.933,5.771
    .subzone 2257 >>进入 Deeprun 有轨电车
    .zoneskip Ironforge
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #label DeeprunDMNoFP1
    #completewith NEIFFP
    >>|cRXP_WARN_升级你的|r |T135966:0|t[急救] |cRXP_WARN_和|r |T133971:0|t[烹饪] |cRXP_WARN_如果需要在电车上|r
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .zoneskip Ironforge
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #requires DeeprunDMNoFP1
    #label DeeprunDMNoFP2
    #completewith NEIFFP
    .goto 1455,67.842,42.456
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_考格斯宾|r
    .vendor 5175 >>|cRXP_BUY_从他那里购买 a|r |T133024:0|t[青铜管] |cRXP_BUY_ （如果它上涨的话）|r
--    >>你稍后需要 2 个青铜管来完成任务 << Rogue
    .target Gearcutter Cogspinner
    .bronzetube
    .dungeon DM
step << NightElf Warrior/NightElf Hunter
    #xprate >1.59 << !Hunter
    #requires DeeprunDMNoFP2
    #label DeeprunDMNoFP3
    #completewith NEIFFP
    .goto Ironforge,61.177,89.508
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布里维夫·石拳|r, 他在里面
    .train 197 >>训练 2h 斧头 << Warrior
    .train 199 >>训练 2h Maces << Warrior
    .train 266 >>火车枪 << Hunter
    .target 布里维夫·石手
    .dungeon DM
step << NightElf Warrior
    #xprate >1.59
    #requires DeeprunDMNoFP3
    #label DeeprunDMNoFP4
    #completewith NEIFFP
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布雷文·寒钢|r, 他在楼下
    >>|cRXP_BUY_从她那里购买|r |T135427:0|t[重型飞刀] |cRXP_BUY_|r
    .collect 3108,200 --Collect Heavy Throwing Knife (200)
    .target Brenwyn Wintersteel
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7
    .dungeon DM
step << NightElf Warrior
    #xprate >1.59
    #requires DeeprunDMNoFP4
    #label DeeprunDMNoFP5
    #completewith NEIFFP
    +|cRXP_WARN_Equip the|r |T135427:0|t[重型飞刀]
    .use 3108
    .itemcount 3108,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #label NEIFFP
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fp Ironforge >>获取铁炉堡飞行路线
    .target Gryth Thurden
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_Book: The Powers Below|r] 开始任务|r
    .accept 968 >>接任务: |cRXP_LOOT_深渊之神|r
    .use 5352
    .itemcount 5352,1
    .zoneskip Ironforge,1
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_葛利·硬骨|r, 他在里面
    .turnin 968 >>交任务: |cRXP_FRIENDLY_深渊之神|r
    .target Gerrig Bonegrip
    .zoneskip Ironforge,1
    .isOnQuest 968
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #requires LetterLater
    #optional
    .hs >>从炉边到黑海岸
    .zoneskip Darkshore
    .dungeon DM


----End of Hunter/All 2x Deadmines section----

    ]])
