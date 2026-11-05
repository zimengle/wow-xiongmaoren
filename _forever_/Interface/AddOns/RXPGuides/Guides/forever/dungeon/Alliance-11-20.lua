local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#subgroupdisplayname 1-20
#forever
#version 1
<< Alliance NightElf
#name 11-16 Darkshore/Loch Modan
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
--#groupid RXP-SRGCE-A1
#next 17-18 Hall of Thanes
#displayname 11-16 黑海岸/洛克莫丹

step
    #include RestedXP Forever Guide (A)\14-16 Darkshore@WashedA-DarkshoreEndNE

step
    #include RestedXP Forever Guide (A)\15-16 Loch Modan@SWBoat-IFExit

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板洛雷·火酒|r 交谈
    >>|cRXP_WARN_如果队伍中有法师，则将炉石设在湖畔镇|r
    .goto Ironforge,18.10,51.60
    .home >> 将炉石设在铁炉堡
    .target 旅店老板洛雷·火酒

step
    #completewith next
    .zone Dun Morogh >> 前往丹莫罗

step
    .goto Dun Morogh,59.9,49.5,30,0
    .goto Dun Morogh,61.2,47.2,15,0
    .goto Dun Morogh,62.1,47.3,20 >>沿斜坡上去，前往 |cRXP_ENEMY_瓦加什|r 处

step
    #completewith next
    +将 |cRXP_ENEMY_瓦加什|r 风筝到 |cRXP_FRIENDLY_鲁德拉·冻石|r 处
    >>|cRXP_WARN_尽量不要靠近他，否则他会施放|r |T135848:16|t[寒冰咆哮] |cRXP_WARN_，使你昏迷3秒|r
    .mob 瓦加什

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:16|t与 |cRXP_FRIENDLY_鲁德拉·冻石|r 交谈
    .goto Dun Morogh,63.1,49.8
    .target 鲁德拉·冻石
    .accept 314 >>接任务：保护牲畜

step
    >>将 |cRXP_ENEMY_瓦加什|r 风筝到 |cRXP_FRIENDLY_丹莫罗巡山人|r 处
    >>|cRXP_WARN_确保你对他造成的伤害至少占50%|r
    .goto Dun Morogh,62.8,54.6,10,0
    .mob 瓦加什
    .target 丹莫罗巡山人
    .complete 314, 1

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:16|t与 |cRXP_FRIENDLY_鲁德拉·冻石|r 交谈
    .goto Dun Morogh, 63.1, 49.8
    .target 鲁德拉·冻石
    .turnin 314 >>交任务：保护牲畜

step
    #label QuarryStart
    .goto 1426/0,-1394.24,-5797.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大地先知法森|r 交谈
    .accept 96392 >> 接任务：法森的观察
    .target 大地先知法森

step
    .isOnQuest 96392
    .goto 1426/0,-1394.24,-5797.83
    .gossipoption 139831 >> 与 |cRXP_FRIENDLY_大地先知法森|r 交谈，借助他的视野远眺
    >>|cRXP_WARN_目标完成后即可取消远视术|r
    .target 大地先知法森

step
    .isOnQuest 96392
    .aura -1293681 >> |cRXP_WARN_按ESCAPE取消远视术|r

step << skip
    .goto 1426/0,-1394.24,-5797.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大地先知法森|r 交谈
    >>|cRXP_WARN_目标完成后即可取消远视术|r
    .complete 96392,1 -- Use Farsen's Farsight
    .skipgossip
    .target 大地先知法森

step
    .goto 1426/0,-1394.24,-5797.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大地先知法森|r 交谈
    >>|cRXP_WARN_按ESCAPE取消远视术|r
    .turnin 96392 >> 交任务：法森的观察
    --.accept 96390 >> Accept Nip 'Em in the Bud
    .target 大地先知法森

step
    .goto 1426/0,-2009.87,-5860.22,40,0
    .goto 1426/0,-2034.49,-5922.60
    >>击杀 |cRXP_ENEMY_黑铁间谍|r，拾取 |T237385:0|t[|cRXP_LOOT_黑铁地图|r]
    .use 274268 >>|cRXP_WARN_使用|r |T237385:0|t[|cRXP_LOOT_黑铁地图|r] |cRXP_WARN_接取任务|r
    -->>|cRXP_WARN_You can skip killing |cRXP_ENEMY_Dark Iron Spies|r for the other quest because they are low level once you find the|r |T237385:0|t[|cRXP_LOOT_Dark Iron Map|r]
    --.complete 96390,1 -- Dark Iron Spy slain 10/10
    --.disablecheckbox
    .collect 274268,1,96391,1 -- Dark Iron Map (1)
    .accept 96391 >> 接任务：地下地图
    .mob 黑铁间谍

step
    .goto 1426/0,-1394.24,-5797.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大地先知法森|r 交谈
    .turnin 96391 >> 交任务：地下地图
    .accept 96393 >> 接任务：旧铁炉堡入侵
    .target 大地先知法森

step
    #optional
    .isQuestComplete 96390
    .goto 1426/0,-1394.24,-5797.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大地先知法森|r 交谈
    .turnin 96390 >> 交任务：防患于未然
    .target 大地先知法森

step
    #include RestedXP Forever Guide (A)\15-16 Loch Modan@LochEnter-LochEnd

step << NightElf Druid
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade

step << Druid
    .goto Moonglade,44.2,45.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希尔瓦·菲纳雯斯|r 交谈
    .fly Teldrassil >>飞往鲁瑟兰村
    .target 希尔瓦·菲纳雯斯

step << Druid
    #completewith next
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >> 穿过紫色传送门，进入达纳苏斯

step << Druid
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛斯雷·驭熊者|r 交谈
    .accept 26 >>接任务：必修的课程
    .trainer >> 学习职业法术
    .target 玛斯雷·驭熊者

step << Druid
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade

step << Druid
    .zone Moonglade >> 施放传送：月光林地，前往月光林地

step << Druid
    #season 0
    .goto Moonglade,56.1,30.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德迪利特·星焰|r 交谈
    .turnin 26 >> 交任务：必修的课程
    .accept 29 >> 接任务：湖中试炼
    .target 德迪利特·星焰

step << Druid
    .goto Moonglade,52.6,51.6
    >>游入月神湖
    >>打开 |cRXP_PICK_灵珠容器|r，拾取 |T134125:0|t[神殿灵珠]
    >>|cRXP_WARN_它可能在水下不同位置刷新|r
    .collect 15877,1,29,1 -- Shrine Bauble (1)

step << Druid
    #optional
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .itemcount 15877,1 -- Shrine Bauble (1)

step << Druid
    .goto Moonglade,36.026,41.374
    >>|cRXP_WARN_使用|r |T134125:0|t[神殿灵珠] |cRXP_WARN_，地点在雷姆洛斯神殿的大树旁|r
    .complete 29,1 --Complete the Trial of the Lake.
    .use 15877

step << Druid
    #label TotL
    .goto Moonglade,36.517,40.104
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔加里|r 交谈
    .turnin 29 >> 交任务：湖中试炼
    .accept 272 >> 接任务：海狮试炼
    .target 塔加里

step << NightElf
    .hs >>使用炉石返回铁炉堡
    .zoneskip Ironforge

step << NightElf Priest/NightElf Druid
    #ah
    #label OilWandFood
    #completewith next
    .goto 1455/0,-917.57,-4967.58,-1--c:Ironforge,25.800,75.500
    .goto 1455/0,-904.92,-4962.83,-1--c:Ironforge,24.200,74.600
    .goto 1455/0,-901.76,-4948.06,-1--c:Ironforge,23.800,71.800
    >>|cRXP_WARN_如果资金足够，购买以下物品：|r
    >>|T134711:0|t[初级巫师之油] |cRXP_WARN_和|r |T133906:0|t[烤鼠尾鱼]
    >>|cRXP_WARN_也可寻找每秒伤害更高的|r |T132317:0|t[魔杖] |cRXP_WARN_，选择现在或不久后能使用的升级装备|r << Priest
    >>|cRXP_WARN_这些物品能显著提升前期伤害。如果不想或无法购买，就跳过此步|r
    .collect 20744,1 -- Minor Wizard Oil (1)
    .collect 21072,20 -- Smoked Sagefish (20)
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔

step << NightElf Hunter
    .goto 1455/0,-1266.100,-5006.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷格努斯·雷石|r 交谈
    .trainer >> 学习职业法术
    .target 雷格努斯·雷石

step << NightElf Priest
    .goto 1455/0,-897.200,-4607.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高阶牧师洛汉|r 交谈
    .trainer >> 学习职业法术
    .target 高阶牧师洛汉

step << NightElf Rogue
    .goto Ironforge,51.495,15.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_芬斯维克|r 交谈
    .trainer >> 学习职业法术
    .target 芬斯维克

step << NightElf Warrior
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比尔班·飞钳|r 交谈
    .trainer >> 学习职业法术
    .target 比尔班·飞钳

step << NightElf
    .goto Ironforge,74.645,11.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_勘察员塔伯斯·雷矛|r 交谈
    .turnin 301 >> 交任务：向铁炉堡报告
    .target 勘察员塔伯斯·雷矛
    -- step
    --     .goto 1453/0,673.58,-8867.76
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Allison|r
    --     .home >> Set your Hearthstone to Stormwind City
    --     .target Innkeeper Allison
    --     .bindlocation 16509
    -- step
    --     #ah
    --     .goto 1453/0,660.28,-8814.55
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Auctioneer Jaxon|r
    --     >>|cRXP_BUY_Buy the following items for faster turn ins at Westfall shortly:|r
    --     >>|cRXP_WARN_If you don't want to or can't do this, skip this step|r
    --     >>|T133972:0|t[Stringy Vulture Meat]
    --     >>|T133884:0|t[Murloc Eye]
    --     >>|T135997:0|t[Goretusk Snout]
    --     >>|T134185:0|t[Okra]
    --     >>|T134341:0|t[Goretusk Liver]
    --     >>|T4548890:0|t[Golem Isospring]
    --     >>|T132995:0|t[Harvester Gyrostabilizer]
    --     .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    --     .collect 730,3,38,1 -- Murloc Eye (3)
    --     .collect 731,3,38,1 -- Goretusk Snout (3)
    --     .collect 732,3,38,1 -- Okra (3)
    --     .collect 723,8,22,1 -- Goretusk Liver (8)
    --     .collect 255007,14,92909,1 -- Golem Isospring (14)
    --     .collect 255010,5,92909,1 -- Harvester Gyrostabilizer (5)
    --     .target Auctioneer Jaxon
    -- step
    --     .goto 1453/0,484.200,-8832.500
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dungar Longdrink|r
    --     .fp Stormwind >> Get the Stormwind Flight Path
    --     .target Dungar Longdrink
    -- step
    --     #completewith SaldeanVendor
    --     #optional
    --     .goto 1429/0,875.96,-9814.400
    --     .zone Westfall >> Travel to Westfall
    -- step
    --     .goto 1436/0,918.42,-9851.50
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Farmer Furlbrow|r
    --     .accept 64 >> Accept The Forgotten Heirloom
    --     .target Farmer Furlbrow
    -- step
    --     .goto 1436/0,919.47,-9853.13
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Verna Furlbrow|r
    --     .accept 36 >> Accept Westfall Stew
    --     .accept 151 >> Accept Poor Old Blanchy
    --     .target Verna Furlbrow
    -- step
    --     #completewith SalmaS
    --     .goto 1436/0,1055.27,-10128.70,65 >> Travel to Saldean's Farm
    -- step
    --     .goto 1436/0,1055.27,-10128.70
    --     .target Farmer Saldean
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Farmer Saldean|r
    --     .accept 109 >>Accept Report to Gryan Stoutmantle
    -- step
    --     #label SalmaS
    --     .goto 1436/0,1042.67,-10111.670
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Salma Saldean|r
    --     .turnin 36 >> Turn in Westfall Stew
    --     .target Salma Saldean
    --     .accept 38 >> Accept Westfall Stew
    -- step << Gnome/Dwarf/NightElf
    --     #completewith next
    --     .goto 1436/0,1045.12,-10508.80
    --     .target Gryan Stoutmantle
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    --     .turnin 109 >> Turn in Report to Gryan Stoutmantle
    --     .isOnQuest 109
    -- step
    --     .goto 1436/0,1045.12,-10508.80
    --     .target Gryan Stoutmantle
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    --     .accept 12 >> Accept The People's Militia
    -- step
    --     .goto 1436/0,1041.97,-10511.13
    --     .target Captain Danuvin
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Danuvin|r
    --     .accept 102 >> Accept Patrolling Westfall
    -- step
    -- 	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Scout Galiaan|r
    --     .target Scout Galiaan
    --     .goto 1436/0,1126.67,-10636.670
    --     .accept 153 >> Accept Red Leather Bandanas
    -- step
    --     .goto 1436/0,1166.57,-10653.23
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Heather|r
    --     .vendor >>|cRXP_BUY_Buy food/water if needed|r
    -- 	.target Innkeeper Heather
    -- step
    --     .goto 1436/0,1179.800,-10635.601
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon::253092|r
    --     .target Alba Fairmoon::253092
    --     .accept 92742 >>Accept Testing the Wells
    --     .accept 92744 >>Accept Murloc Gills
    -- step
    -- 	#completewith GnollPaws
    --     >>Open the |cRXP_PICK_Sacks of Oats|r on the ground. Loot them for the |cRXP_LOOT_Handful of Oats|r
    --     >>|cRXP_WARN_You can usually find them near Farm Fences or Buildings|r
    --     .complete 151,1 --Handful of Oats (8)
    -- step
    --     #completewith TravelCompass
    --     >>Kill |cRXP_ENEMY_Young Goretusks|r and |cRXP_ENEMY_Young Fleshrippers|r. Loot them for their |cRXP_LOOT_Vulture Meat|r, |cRXP_LOOT_Snouts|r and |cRXP_LOOT_Livers|r
    --     .collect 729,3,38,1 --Stringy Vulture Meat (3)
    --     .mob +Young Fleshripper
    --     .mob +Fleshripper
    --     .collect 731,3,38,1 --Goretusk Snout (3)
    --     .mob +Young Goretusk
    --     .mob +Goretusk
    -- step
    --     #completewith TravelCompass
    --     >>Kill |cRXP_ENEMY_Defias Trappers|r and |cRXP_ENEMY_Defias Smugglers|r. Loot them for their |T133694:0|t|cRXP_LOOT_Red Leather Bandanas|r
    --     .complete 12,1 -- Defias Trapper slain (15)
    --     .mob +Defias Trapper
    --     .complete 12,2 -- Defias Smuggler slain (15)
    --     .mob +Defias Smuggler
    --     .complete 153,1 -- Red Leather Bandana (15)
    --     .mob +Defias Trapper
    --     .mob +Defias Smuggler
    -- step
    --     #label TravelCompass
    --     .isOnQuest 399
    --     .goto 1436/0,1602.67,-10629.67,75 >> Travel to the Alexston's Farmstead
    --     >>|cRXP_WARN_Work on completing the other quest objectives as you move there|r
    -- step
    --     #sticky
    --     #completewith bennytime
    --     >>Kill |cRXP_ENEMY_Harvest Watchers|r located on any of the fields as you run by them
    --     >>Loot them for their |cRXP_LOOT_Okra|r and |cRXP_LOOT_Flasks of Oil|r
    --     .mob Harvest Watcher
    --     .collect 732,3,38,1 --Okra (3)
    --     .collect 814,5,103,1 --Flask of Oil (5)
    -- step
    --     .goto 1436/0,1748.27,-10672.13
    --     >>Open |cRXP_PICK_Alexston's Chest|r. Loot it for |cRXP_LOOT_A Simple Compass|r
    --     .complete 399,1 --A Simple Compass (1)
    --     .isOnQuest 399
    -- step
    --     .goto 1436/0,1404.200,-10290.900
    --     .use 254545 >>|cRXP_WARN_Use the|r |T236996:0|t[Well Water Sample Kit] |cRXP_WARN_at the Molsen Farm well|r
    --     .complete 92742,2 --|1/1 Molsen Farm Water Sample
    -- step
    --     #completewith bennytime
    --     >>Kill |cRXP_ENEMY_Young Goretusks|r and |cRXP_ENEMY_Young Fleshrippers|r. Loot them for their |cRXP_LOOT_Vulture Meat|r, |cRXP_LOOT_Snouts|r and |cRXP_LOOT_Livers|r
    --     .collect 729,3,38,1 --Stringy Vulture Meat (3)
    --     .mob +Young Fleshripper
    --     .mob +Fleshripper
    --     .collect 731,3,38,1 --Goretusk Snout (3)
    --     .mob +Young Goretusk
    --     .mob +Goretusk
    -- step
    --     #completewith bennytime
    --     >>Kill |cRXP_ENEMY_Defias Trappers|r and |cRXP_ENEMY_Defias Smugglers|r. Loot them for their |T133694:0|t|cRXP_LOOT_Red Leather Bandanas|r
    --     .complete 12,1 -- Defias Trapper slain (15)
    --     .mob +Defias Trapper
    --     .complete 12,2 -- Defias Smuggler slain (15)
    --     .mob +Defias Smuggler
    --     .complete 153,1 -- Red Leather Bandana (15)
    --     .mob +Defias Trapper
    --     .mob +Defias Smuggler
    -- step
    --     .goto 1436/0,1266.67,-9927.33,75 >> Travel to the Jansen Stead, |cRXP_WARN_work on the other quest objectives as you move there|r
    -- step
    -- 	#label bennytime
    --     .goto 1436/0,1289.77,-9849.63
    --     >>Open |cRXP_PICK_Furlbrow's Wardrobe|r. Loot it for |cRXP_LOOT_Furlbrow's Pocket Watch|r
    --     >>|cRXP_WARN_You can loot |cRXP_PICK_Furlbrow's Wardrobe|r from outside if you angle your camera correctly|r
    -- 	>>|cRXP_WARN_Be aware of |cRXP_ENEMY_Benny Blanco|r. He hits hard|r
    --     .complete 64,1 --Furlbrow's Pocket Watch
    -- step
    --     .goto 1436/0,1192.12,-9641.73,60,0
    --     .goto 1436/0,1042.67,-9619.33,60,0
    --     .goto 1436/0,1192.12,-9641.73,60,0
    --     .goto 1436/0,1042.67,-9619.33,60,0
    --     .goto 1436/0,1192.12,-9641.73
    --     .goto 1436/0,1042.67,-9619.33,0
    --     >>Kill |cRXP_ENEMY_Murloc Raiders|r and |cRXP_ENEMY_Murloc Coastrunners|r. Loot them for their |cRXP_LOOT_Eyes|r and |cRXP_LOOT_Gills|r
    --     .collect 730,3,38,1 --Murloc Eye (3)
    --     .complete 92744,1 -- Longshore Murloc Gills 7/7
    --     .mob Murloc Raider
    --     .mob Murloc Coastrunner
    -- step
    --     .goto 1436/0,1035.300,-9835.101
    --     .use 254545 >>|cRXP_WARN_Use the|r |T236996:0|t[Well Water Sample Kit] |cRXP_WARN_at the Jansen Stead well|r
    --     .complete 92742,1 --|1/1 Jansen Stead Water Sample
    -- step
    --     .goto 1436/0,1004.87,-9716.87,60,0
    --     .goto 1436/0,1013.62,-9861.53,60,0
    --     .goto 1436/0,1192.12,-10175.13,60,0
    --     .goto 1436/0,1019.57,-10204.30,60,0
    --     .goto 1436/0,1013.62,-9861.53
    --     >>Open the |cRXP_PICK_Sacks of Oats|r on the ground. Loot them for the |cRXP_LOOT_Handful of Oats|r
    -- 	>>|cRXP_WARN_You can usually find them near Farm Fences or Buildings|r
    -- 	.complete 151,1 --Handful of Oats (8)
    -- step
    --     #label FurlbrowFarm
    -- 	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Farmer Furlbrow|r and |cRXP_FRIENDLY_Verna Furlbrow|r
    --     .turnin 64 >> Turn in The Forgotten Heirloom
    --     .target +Farmer Furlbrow
    --     .goto 1436/0,918.42,-9851.50
    --     .turnin 151 >> Turn in Poor Old Blanchy
    --     .target +Verna Furlbrow
    --     .goto 1436/0,919.47,-9853.13
    -- step
    --     #completewith SaldeanVendor
    -- 	.goto 1436/0,1055.27,-10128.70
    -- 	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Farmer Saldean|r
    --     .vendor >> |cRXP_BUY_Vendor trash|r
    --     >>|cRXP_WARN_Do NOT sell|r |T133884:0|t[Murloc Eyes], |T135997:0|t[Goretusk Snouts], |T134341:0|t[Goretusk Livers] |cRXP_WARN_or|r |T133972:0|t[Stringy Vulture Meat]
    -- 	.target Farmer Saldean
    -- step
    --     #optional
    -- 	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Salma Saldean|r
    --     .goto 1436/0,1042.67,-10111.670
    --     .turnin 38 >> Turn in Westfall Stew
    --     .isQuestComplete 38
    --     .target Salma Saldean
    -- step
    --     #optional
    --     .goto 1436/0,1213.400,-10153.800
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozwin Ironsprocket::253395|r
    --     .target Ozwin Ironsprocket::253395
    --     .accept 92909 >>Accept Harvesting the Harvesters
    --     .turnin 92909 >>Turn in Harvesting the Harvesters
    --     .itemcount 255007,14 -- Golem Isospring (14)
    --     .itemcount 255010,5 -- Harvester Gyrostabilizer (5)
    -- step
    --     #optional
    -- 	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Salma Saldean|r
    --     .goto 1436/0,1042.67,-10111.670
    --     .turnin 38 >> Turn in Westfall Stew
    --     .isQuestComplete 38
    --     .target Salma Saldean
    -- step
    --     .isQuestAvailable 38
    --     .goto 1436/0,1132.27,-10146.67,60,0
    --     .goto 1436/0,1238.67,-9907.73,80,0
    --     .goto 1436/0,1460.22,-10224.83,80,0
    --     .goto 1436/0,1132.27,-10146.67,80,0
    --     .goto 1436/0,1238.67,-9907.73,80,0
    --     .goto 1436/0,1460.22,-10224.83,80,0
    --     .goto 1436/0,1132.27,-10146.67,60,0
    --     .goto 1436/0,1460.22,-10224.83,60,0
    --     .goto 1436/0,1238.67,-9907.73
    --     >>Kill |cRXP_ENEMY_Harvest Watchers|r. Loot them for their |cRXP_LOOT_Okra|r and |cRXP_LOOT_Flasks of Oil|r
    --     .collect 732,3,38,1 --Okra (3)
    --     .collect 814,5,103,1 --Flask of Oil (5)
    -- step
    --     .isQuestTurnedIn 38
    --     #label HarvestW
    --     .goto 1436/0,1132.27,-10146.67,60,0
    --     .goto 1436/0,1238.67,-9907.73,80,0
    --     .goto 1436/0,1460.22,-10224.83,80,0
    --     .goto 1436/0,1132.27,-10146.67,80,0
    --     .goto 1436/0,1238.67,-9907.73,80,0
    --     .goto 1436/0,1460.22,-10224.83,80,0
    --     .goto 1436/0,1132.27,-10146.67,60,0
    --     .goto 1436/0,1460.22,-10224.83,60,0
    --     .goto 1436/0,1238.67,-9907.73
    --     >>Kill |cRXP_ENEMY_Harvest Watchers|r. Loot them for their |cRXP_LOOT_Flasks of Oil|r
    --     .collect 814,5,103,1 --Flask of Oil (5)
    -- step
    --     #optional
    --     .goto 1436/0,1213.400,-10153.800
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozwin Ironsprocket::253395|r
    --     .target Ozwin Ironsprocket::253395
    --     .accept 92909 >>Accept Harvesting the Harvesters
    --     .turnin 92909 >>Turn in Harvesting the Harvesters
    --     .itemcount 255007,14 -- Golem Isospring (14)
    --     .itemcount 255010,5 -- Harvester Gyrostabilizer (5)
    -- step
    --     .goto 1436/0,1179.52,-10382.57,75,0
    --     .goto 1436/0,1138.22,-10474.97,75,0
    --     .goto 1436/0,860.67,-10462.83,75,0
    --     .goto 1436/0,904.07,-10038.87,75,0
    --     .goto 1436/0,1104.62,-9848.000,75,0
    --     .goto 1436/0,1298.52,-10028.13,75,0
    --     .goto 1436/0,1340.52,-10401.93,75,0
    --     .goto 1436/0,1111.97,-10342.20
    --     >>Kill |cRXP_ENEMY_Young Goretusks|r and |cRXP_ENEMY_Young Fleshrippers|r. Loot them for their |cRXP_LOOT_Vulture Meat|r, |cRXP_LOOT_Snouts|r and |cRXP_LOOT_Livers|r
    --     .collect 729,3,38,1 --Stringy Vulture Meat (3)
    --     .mob +Young Fleshripper
    --     .mob +Fleshripper
    --     .collect 731,3,38,1 --Goretusk Snout (3)
    --     .mob +Young Goretusk
    --     .mob +Goretusk
    --     .collect 723,8,22,1 --Goretusk Liver (8)
    --     .mob +Young Goretusk
    --     .mob +Goretusk
    -- step
    --     #label SaldeanVendor
    -- 	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Salma Saldean|r
    -- 	.target Salma Saldean
    --     .goto 1436/0,1042.67,-10111.670
    --     .turnin 38 >> Turn in Westfall Stew
    -- step
    --     #optional
    --     .goto 1436/0,1213.400,-10153.800
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozwin Ironsprocket::253395|r
    --     .target Ozwin Ironsprocket::253395
    --     .accept 92909 >>Accept Harvesting the Harvesters
    --     .turnin 92909 >>Turn in Harvesting the Harvesters
    --     .itemcount 255007,14 -- Golem Isospring (14)
    --     .itemcount 255010,5 -- Harvester Gyrostabilizer (5)
    -- step
    --     #completewith next
    --     >>Kill |cRXP_ENEMY_Defias Trappers|r and |cRXP_ENEMY_Defias Smugglers|r. Loot them for their |T133694:0|t|cRXP_LOOT_Red Leather Bandanas|r
    --     >>|cRXP_WARN_It is a dynamic respawn area meaning if you kill enough they will keep respawning|r
    --     .complete 12,1 -- Defias Trapper slain (15)
    --     .mob +Defias Trapper
    --     .complete 12,2 -- Defias Smuggler slain (15)
    --     .mob +Defias Smuggler
    --     .complete 153,1 -- Red Leather Bandana (15)
    --     .mob +Defias Trapper
    --     .mob +Defias Smuggler
    -- step
    --     .goto 1436/0,1324.200,-10490.400
    --     >>Kill |cRXP_ENEMY_Defias Trappers|r and |cRXP_ENEMY_Defias Smugglers|r. Loot them for their |T133694:0|t|cRXP_LOOT_Red Leather Bandanas|r
    --     >>|cRXP_WARN_It is a dynamic respawn area meaning if you kill enough they will keep respawning|r
    --     .complete 12,1 -- Defias Trapper slain (15)
    --     .mob +Defias Trapper
    --     .complete 12,2 -- Defias Smuggler slain (15)
    --     .mob +Defias Smuggler
    --     .complete 153,1 -- Red Leather Bandana (15)
    --     .mob +Defias Trapper
    --     .mob +Defias Smuggler
    -- step
    -- 	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    -- 	.target Gryan Stoutmantle
    --     .goto 1436/0,1045.12,-10508.80
    --     .turnin 12 >> Turn in The People's Militia
    -- step
    -- 	.xp <14,1
    -- 	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    -- 	.target Gryan Stoutmantle
    --     .goto 1436/0,1045.12,-10508.80
    --     .accept 65 >> Accept The Defias Brotherhood
    -- step
    -- 	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Scout Galiaan|r
    -- 	.target Scout Galiaan
    --     .goto 1436/0,1126.67,-10636.670
    --     .turnin 153 >> Turn in Red Leather Bandanas
    -- step
    --     .goto 1436/0,1179.800,-10635.601
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon::253092|r
    --     .target Alba Fairmoon::253092
    --     .turnin 92742 >>Turn in Testing the Wells
    --     .turnin 92744 >>Turn in Murloc Gills
    -- step
    --     .hs >> Hearth to Stormwind
    --     .bindlocation 16509,1
    --     .cooldown item,6948,>2,1
    --     .zoneskip Stormwind City
    --     .zoneskip Darkshore
    -- step
    --     #completewith DeeprunEnter
    --     .goto 1436/0,1037.42,-10628.27
    -- 	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thor|r
    --     .fly Stormwind >> Fly to Stormwind
    --     .target Thor
    --     .zoneskip Stormwind City
    --     .zoneskip Darkshore
    -- step << Rogue
    --     #ah
    --     .goto 1453/0,609.63,-8787.71
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marda Weller|r
    --     .vendor 1287 >>|cRXP_BUY_Buy a|r |T135343:0|t[Scimitar] |cRXP_BUY_from her or something better from the Auction House and equip it your off-hand|r
    --     .money <0.3815
    --     .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    --     .target Marda Weller
    -- step << Rogue
    --     #ssf
    --     .goto 1453/0,609.63,-8787.71
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marda Weller|r
    --     .vendor 1287 >>|cRXP_BUY_Buy a|r |T135343:0|t[Scimitar] |cRXP_BUY_from her|r
    --     .money <0.3815
    --     .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    --     .target Marda Weller
    -- step << Rogue
    --     .goto 1453/0,377.47,-8752.39
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Osborne|r
    --     .train 1758,1
    --     .trainer >> Train your class spells
    --     .target Osborne the Night Man
    --     .xp <16,1
    -- step << Warrior
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wu|r or |cRXP_FRIENDLY_Ilsa|r
    --     .goto 1453/0,358.25,-8728.28,15,0
    --     .goto 1453/0,302.6,-8685.53,15,0
    -- 	.goto 1453/0,323.3,-8689.29
    --     .train 1160,1
    --     .trainer >> Train your class spells
    --     .target Wu Shen
    --     .target Ilsa Corbin
    --     .xp <16,1
    -- step << Hunter
    --     .goto 1453/0,552.78,-8415.71
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Einris Brightspear|r inside
    --     .trainer >> Train your class spells
    --     .target Einris Brightspear
    --     .xp <16,1
    -- step << Druid
    --     .goto 1453/0,1347.6192,-8591.2168
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theridran|r
    --     .trainer >>Train your class spells
    -- 	.target Theridran
    --     .xp <16,1
    -- step
    --     .goto 1453/0,719.67,-8550.30
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baros Alexston|r
    --     .turnin 399 >> Turn in Humble Beginnings
    --     .target Baros Alexston
    --     .isQuestComplete 399
    -- step << Priest
    --     #optional
    --     #completewith next
    --     .goto 1453/0,809.52,-8579.22,20 >> Travel to the Stormwind Cathedral
    -- step << Priest
    --     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Joshua|r
    --     .goto 1453/0,862.89,-8519.61
    --     .trainer >> Train your class spells
    --     .train 8122,1
    --     .target Brother Joshua
    --     .xp <16,1
    -- step
    --     #optional
    --     #label endOfTheGuide
    -- step
    --     #label DeeprunEnter
    --     #completewith next
    --     .goto 1453/0,562.300,-8385.300,20,0
    --     .goto 1453/0,522.000,-8352.101
    --     .subzone 2257 >>Enter the Deeprun Tram
    --     .zoneskip Ironforge
    --     .zoneskip Loch Modan
    --     .zoneskip Dun Morogh
    -- step
    --     .zone Ironforge >> Take the tram to Ironforge
    --     .zoneskip Loch Modan
    --     .zoneskip Dun Morogh
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#subgroupdisplayname 1-20
#forever
#version 1
<< Alliance !NightElf
#name 13-15 Westfall
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
--#groupid RXP-SRGCE-A1
#next 15-17 Darkshore
#displayname 14-15 西部荒野 << Gnome/Dwarf !Hunter
#displayname 13-15 西部荒野

step
    #optional
    .maxlevel 14,endOfTheGuide

step
    .goto 1453/0,673.58,-8867.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板奥里森|r交谈
    .home >> 将炉石设在暴风城
    .target 旅店老板奥里森
    .bindlocation 16509

step
    #ah
    .goto 1453/0,660.28,-8814.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_BUY_购买以下物品，以便稍后在西部荒野更快交任务：|r
    >>|cRXP_WARN_如果不想做或无法完成此步，就跳过|r
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝]
    -->>|T4548890:0|t[Golem Isospring]
    -->>|T132995:0|t[Harvester Gyrostabilizer]
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- Okra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    --.collect 255007,14,92909,1 -- Golem Isospring (14)
    --.collect 255010,5,92909,1 -- Harvester Gyrostabilizer (5)
    .target 拍卖师亚克森

step << Human
    .goto 1453/0,484.200,-8832.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .turnin 6261 >> 交任务：杜加尔·朗德瑞克
    .accept 6285 >> 接任务：返回西部荒野
    .target 杜加尔·朗德瑞克

step << !Skyborne
    .goto 1453/0,484.200,-8832.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >> 飞往西部荒野 << !NightElf !Dwarf/!Hunter
    .fp Stormwind >> 开通暴风城飞行点 << NightElf/Dwarf Hunter
    .target 杜加尔·朗德瑞克

step
    #completewith SaldeanVendor
    #optional
    .goto 1429/0,875.96,-9814.400
    .zone Westfall >> 前往西部荒野

step
    .goto 1436/0,918.42,-9851.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r交谈
    .accept 64 >> 接任务：遗失的怀表
    .target 农夫法布隆

step
    .goto 1436/0,919.47,-9853.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .accept 36 >> 接任务：杂味炖肉
    .accept 151 >> 接任务：老马布兰契
    .target 弗娜·法布隆

step
    #completewith SalmaS
    .goto 1436/0,1055.27,-10128.70,65 >> 前往萨丁农场

step
    .goto 1436/0,1055.27,-10128.70
    .target 农夫萨丁
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .accept 9 >> 接任务：清理荒野
    .accept 109 >>接任务：向格里安·斯托曼报到 << !Human

step
    #label SalmaS
    .goto 1436/0,1042.67,-10111.670
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .turnin 36 >> 交任务：杂味炖肉
    .target 萨尔玛·萨丁
    .accept 38 >> 接任务：杂味炖肉
    .accept 22 >> 接任务：猪肝馅饼

step << Human
    #label Lewis
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官刘易斯|r交谈
    .target 军需官刘易斯
    .goto 1436/0,1021.67,-10500.63
    .turnin 6285 >> 交任务：返回西部荒野

step << !Human
    #completewith next
    .goto 1436/0,1045.12,-10508.80
    .target 格里安·斯托曼
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 109 >> 交任务：向格里安·斯托曼报到
    .isOnQuest 109

step
    .goto 1436/0,1045.12,-10508.80
    .target 格里安·斯托曼
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 12 >> 接任务：西部荒野人民军

step << skip
    .goto 1436/0,1041.97,-10511.13
    .target 丹努文队长
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹努文队长|r交谈
    .accept 102 >> 接任务：西部荒野的豺狼人

step << Human
    #requires Lewis
    .goto 1436/0,1126.67,-10636.670
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target 哨兵加里安
    .accept 153 >> 接任务：红色皮质面罩

step << !Human
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target 哨兵加里安
    .goto 1436/0,1126.67,-10636.670
    .accept 153 >> 接任务：红色皮质面罩

step
    .goto 1436/0,1166.57,-10653.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    .vendor >>|cRXP_BUY_如有需要，购买食物和水|r
    .target 旅店老板希瑟尔

step
    .goto 1436/0,1179.800,-10635.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿尔巴·晴月::253092|r交谈
    .target 阿尔巴·晴月::253092
    .accept 92742 >>接任务：测试水井
    .accept 92744 >>接任务：鱼人的鳃

step
    #optional
    .abandon 102 >> 放弃任务：西部荒野的豺狼人
    >>|cRXP_WARN_这份指南不会完成这个任务|r

step
    #completewith MurlocEyeGills
    >>打开地上的|cRXP_PICK_燕麦袋|r，拾取|cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_通常可以在农场围栏或建筑附近找到它们|r
    .complete 151,1 --Handful of Oats (8)

step
    #completewith TravelCompass
    >>击杀|cRXP_ENEMY_幼年血牙野猪|r和|cRXP_ENEMY_小碎尸鸟|r，拾取它们的|cRXP_LOOT_秃鹫肉条|r、|cRXP_LOOT_猪头|r和|cRXP_LOOT_猪肝|r
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +小碎尸鸟
    .mob +碎尸鸟
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +幼年血牙野猪
    .mob +血牙野猪
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +幼年血牙野猪
    .mob +血牙野猪

step
    #completewith TravelCompass
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取它们的|T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +迪菲亚走私者
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者

step
    #label TravelCompass
    .isOnQuest 399
    .goto 1436/0,1602.67,-10629.67,75 >> 前往阿历克斯顿农场
    >>|cRXP_WARN_途中顺便完成其他任务目标|r

step << skip -- quests drop rate is beyond dreadful. over 50 kills to complete
    .goto 1436/0,1213.400,-10153.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与谷仓内的|cRXP_FRIENDLY_奥兹温·铁链::253395|r交谈
    .target 奥兹温·铁链::253395
    .accept 92909 >>接任务：收割傀儡被收割

step
    #sticky
    #completewith bennytime
    >>路过田地时击杀其中的|cRXP_ENEMY_看守傀儡|r
    >>拾取它们的|cRXP_LOOT_秋葵|r和|cRXP_LOOT_灯油|r
    .mob 看守傀儡
    .complete 9,1 --Havest Watcher slain (20)
    .collect 732,3,38,1 --Okra (3)
    .collect 814,5,103,1 --Flask of Oil (5)

step
    .goto 1436/0,1748.27,-10672.13
    >>打开|cRXP_PICK_阿历克斯顿的箱子|r，拾取|cRXP_LOOT_简易罗盘|r
    >>|cRXP_WARN_避开烧毁的建筑前方的怪物，从后方烟囱旁拾取。必要时利用烟囱阻断|r|cRXP_ENEMY_迪菲亚掠夺者|r|cRXP_WARN_的施法视线|r
    .complete 399,1 --A Simple Compass (1)
    .isOnQuest 399

step
    #completewith bennytime
    >>击杀|cRXP_ENEMY_幼年血牙野猪|r和|cRXP_ENEMY_小碎尸鸟|r，拾取它们的|cRXP_LOOT_秃鹫肉条|r、|cRXP_LOOT_猪头|r和|cRXP_LOOT_猪肝|r
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +小碎尸鸟
    .mob +碎尸鸟
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +幼年血牙野猪
    .mob +血牙野猪
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +幼年血牙野猪
    .mob +血牙野猪

step
    #completewith bennytime
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取它们的|T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +迪菲亚走私者
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者

step
    .goto 1436/0,1266.67,-9927.33,75 >> 前往詹森农场，|cRXP_WARN_途中继续完成其他任务目标|r

step
    #label bennytime
    .goto 1436/0,1289.77,-9849.63
    >>打开|cRXP_PICK_法布隆的衣柜|r，拾取|cRXP_LOOT_法布隆的怀表|r
    >>|cRXP_WARN_调整好镜头角度后，可以从屋外拾取|r|cRXP_PICK_法布隆的衣柜|r|cRXP_WARN_中的物品|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_本尼·布兰科|r|cRXP_WARN_，他的伤害很高|r
    .complete 64,1 --Furlbrow's Pocket Watch

step << skip
    #completewith next
    >>击杀|cRXP_ENEMY_河爪豺狼人|r和|cRXP_ENEMY_河爪斥候|r，拾取它们的|T134297:0|t|cRXP_LOOT_豺狼人的爪子|r
    .complete 102,1 --Gnoll Paw (8)
    .mob 河爪豺狼人
    .mob 河爪斥候

step
    .goto 1436/0,1035.300,-9835.101
    .use 254545 >>|cRXP_WARN_使用|r |T236996:0|t[井水采样工具包] |cRXP_WARN_在詹森农场的水井取样|r
    .complete 92742,1 --|1/1 Jansen Stead Water Sample

step
    #label MurlocEyeGills
    .goto 1436/0,1192.12,-9641.73,60,0
    .goto 1436/0,1042.67,-9619.33,60,0
    .goto 1436/0,1192.12,-9641.73,60,0
    .goto 1436/0,1042.67,-9619.33,60,0
    .goto 1436/0,1192.12,-9641.73
    .goto 1436/0,1042.67,-9619.33,0
    >>击杀|cRXP_ENEMY_鱼人袭击者|r和|cRXP_ENEMY_滩行鱼人|r，拾取它们的|cRXP_LOOT_眼球|r和|cRXP_LOOT_鳃|r
    >>|cRXP_WARN_如果收集到的|r|cRXP_LOOT_鳃|r|cRXP_WARN_仍然很少，而|r|cRXP_LOOT_眼球|r|cRXP_WARN_已经收集齐，就跳过此步|r
    .collect 730,3,38,1 --Murloc Eye (3)
    .complete 92744,1 -- Longshore Murloc Gills 7/7
    .mob 鱼人袭击者
    .mob 滩行鱼人

step << skip
    #label GnollPaws
    .goto 1436/0,1042.67,-9715.0,60,0
    .goto 1436/0,1517.97,-9743.000,60,0
    .goto 1436/0,1412.62,-9720.83,60,0
    .goto 1436/0,1184.07,-9745.80,60,0
    .goto 1436/0,1026.57,-9715.70,60,0
    .goto 1436/0,1026.57,-9715.70,60,0
    .goto 1436/0,1517.97,-9743.000,60,0
    .goto 1436/0,1184.07,-9745.80,60,0
    .goto 1436/0,1412.62,-9720.83
    .goto 1436/0,1517.97,-9743.000,0
    .goto 1436/0,1184.07,-9745.80,0
    .goto 1436/0,1028.32,-9710.330,0
    >>击杀|cRXP_ENEMY_河爪豺狼人|r和|cRXP_ENEMY_河爪斥候|r，拾取它们的|T134297:0|t|cRXP_LOOT_豺狼人的爪子|r
    .complete 102,1 --Gnoll Paw (8)
    .mob 河爪豺狼人
    .mob 河爪斥候

step
    .goto 1436/0,1004.87,-9716.87,60,0
    .goto 1436/0,1013.62,-9861.53,60,0
    .goto 1436/0,1192.12,-10175.13,60,0
    .goto 1436/0,1019.57,-10204.30,60,0
    .goto 1436/0,1013.62,-9861.53
    >>打开地上的|cRXP_PICK_燕麦袋|r，拾取|cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_通常可以在农场围栏或建筑附近找到它们|r
    .complete 151,1 --Handful of Oats (8)

step << Human Warlock
    #label FurlbrowFarm
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .turnin 64 >> 交任务：遗失的怀表
    .turnin 184 >> 交任务：法布隆的地契
    .target +农夫法布隆
    .goto 1436/0,918.42,-9851.50
    .turnin 151 >> 交任务：老马布兰契
    .goto 1436/0,919.47,-9853.13
    .target +弗娜·法布隆
    .isOnQuest 184

step
    #optional << Human Warlock
    #label FurlbrowFarm << !Human/!Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .turnin 64 >> 交任务：遗失的怀表
    .target +农夫法布隆
    .goto 1436/0,918.42,-9851.50
    .turnin 151 >> 交任务：老马布兰契
    .target +弗娜·法布隆
    .goto 1436/0,919.47,-9853.13

step
    #completewith SaldeanVendor
    .goto 1436/0,1055.27,-10128.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .vendor >> |cRXP_BUY_出售杂物|r
    >>|cRXP_WARN_不要出售|r |T133884:0|t[鱼人的眼球]、|T135997:0|t[血牙野猪的头]、|T134341:0|t[血牙野猪的肝]|cRXP_WARN_或|r |T133972:0|t[秃鹫肉条]
    .target 农夫萨丁

step
    #optional
    .isQuestComplete 9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .target 农夫萨丁
    .goto 1436/0,1055.27,-10128.70
    .turnin 9 >> 交任务：清理荒野

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .goto 1436/0,1042.67,-10111.670
    .turnin 22 >> 交任务：猪肝馅饼
    .turnin 38 >> 交任务：杂味炖肉
    .isQuestComplete 22
    .isQuestComplete 38
    .target 萨尔玛·萨丁

step
    #optional
    .goto 1436/0,1213.400,-10153.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兹温·铁链::253395|r交谈
    .target 奥兹温·铁链::253395
    .accept 92909 >>接任务：收割傀儡被收割
    .turnin 92909 >>交任务：收割傀儡被收割
    .itemcount 255007,14 -- Golem Isospring (14)
    .itemcount 255010,5 -- Harvester Gyrostabilizer (5)

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .goto 1436/0,1042.67,-10111.670
    .turnin 22 >> 交任务：猪肝馅饼
    .isQuestComplete 22
    .target 萨尔玛·萨丁

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .goto 1436/0,1042.67,-10111.670
    .turnin 38 >> 交任务：杂味炖肉
    .isQuestComplete 38
    .target 萨尔玛·萨丁

step
    .isQuestAvailable 38
    .goto 1436/0,1132.27,-10146.67,60,0
    .goto 1436/0,1238.67,-9907.73,80,0
    .goto 1436/0,1460.22,-10224.83,80,0
    .goto 1436/0,1132.27,-10146.67,80,0
    .goto 1436/0,1238.67,-9907.73,80,0
    .goto 1436/0,1460.22,-10224.83,80,0
    .goto 1436/0,1132.27,-10146.67,60,0
    .goto 1436/0,1460.22,-10224.83,60,0
    .goto 1436/0,1238.67,-9907.73
    >>击杀|cRXP_ENEMY_看守傀儡|r，拾取它们的|cRXP_LOOT_秋葵|r和|cRXP_LOOT_灯油|r
    .complete 9,1 --Harvest Watcher (20)
    .mob 看守傀儡
    .collect 732,3,38,1 --Okra (3)
    .collect 814,5,103,1 --Flask of Oil (5)

step
    .isQuestTurnedIn 38
    #label HarvestW
    .goto 1436/0,1132.27,-10146.67,60,0
    .goto 1436/0,1238.67,-9907.73,80,0
    .goto 1436/0,1460.22,-10224.83,80,0
    .goto 1436/0,1132.27,-10146.67,80,0
    .goto 1436/0,1238.67,-9907.73,80,0
    .goto 1436/0,1460.22,-10224.83,80,0
    .goto 1436/0,1132.27,-10146.67,60,0
    .goto 1436/0,1460.22,-10224.83,60,0
    .goto 1436/0,1238.67,-9907.73
    >>击杀|cRXP_ENEMY_看守傀儡|r，拾取它们的|cRXP_LOOT_灯油|r
    .complete 9,1 --Harvest Watcher (20)
    .mob 看守傀儡
    .collect 814,5,103,1 --Flask of Oil (5)

step
    #optional
    .isQuestComplete 9
    .subzoneskip 107,1 -- forces early turnin if already at same farm
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .target 农夫萨丁
    .goto 1436/0,1055.27,-10128.70
    .turnin 9 >> 交任务：清理荒野

step
    #optional
    .goto 1436/0,1213.400,-10153.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兹温·铁链::253395|r交谈
    .target 奥兹温·铁链::253395
    .accept 92909 >>接任务：收割傀儡被收割
    .turnin 92909 >>交任务：收割傀儡被收割
    .itemcount 255007,14 -- Golem Isospring (14)
    .itemcount 255010,5 -- Harvester Gyrostabilizer (5)

step
    .goto 1436/0,1179.52,-10382.57,75,0
    .goto 1436/0,1138.22,-10474.97,75,0
    .goto 1436/0,860.67,-10462.83,75,0
    .goto 1436/0,904.07,-10038.87,75,0
    .goto 1436/0,1104.62,-9848.000,75,0
    .goto 1436/0,1298.52,-10028.13,75,0
    .goto 1436/0,1340.52,-10401.93,75,0
    .goto 1436/0,1111.97,-10342.20
    >>击杀|cRXP_ENEMY_幼年血牙野猪|r和|cRXP_ENEMY_小碎尸鸟|r，拾取它们的|cRXP_LOOT_秃鹫肉条|r、|cRXP_LOOT_猪头|r和|cRXP_LOOT_猪肝|r
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +小碎尸鸟
    .mob +碎尸鸟
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +幼年血牙野猪
    .mob +血牙野猪
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +幼年血牙野猪
    .mob +血牙野猪

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .target 农夫萨丁
    .goto 1436/0,1055.27,-10128.70
    .turnin 9 >> 交任务：清理荒野

step
    #label SaldeanVendor
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .target 萨尔玛·萨丁
    .goto 1436/0,1042.67,-10111.670
    .turnin 38 >> 交任务：杂味炖肉
    .turnin 22 >> 交任务：猪肝馅饼

step
    #optional
    .goto 1436/0,1213.400,-10153.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兹温·铁链::253395|r交谈
    .target 奥兹温·铁链::253395
    .accept 92909 >>接任务：收割傀儡被收割
    .turnin 92909 >>交任务：收割傀儡被收割
    .itemcount 255007,14 -- Golem Isospring (14)
    .itemcount 255010,5 -- Harvester Gyrostabilizer (5)

step
    #completewith next
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取它们的|T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_这里是动态刷新区域，击杀足够数量的敌人后，它们会持续刷新|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +迪菲亚走私者
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者

step
    .goto 1436/0,1404.200,-10290.900
    .use 254545 >>|cRXP_WARN_使用|r |T236996:0|t[井水采样工具包] |cRXP_WARN_在莫尔森农场的水井取样|r
    .complete 92742,2 --|1/1 Molsen Farm Water Sample

step
    .isOnQuest 153
    .goto 1436/0,1324.200,-10490.400
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取它们的|T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_这里是动态刷新区域，击杀足够数量的敌人后，它们会持续刷新|r
    >>|cRXP_WARN_如果收集到的|T133694:0|t|r|cRXP_LOOT_红色皮质面罩|r|cRXP_WARN_还远远不够，但已击杀所有任务要求的|r|cRXP_ENEMY_迪菲亚成员|r|cRXP_WARN_，就放弃任务|r[红色皮质面罩]
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +迪菲亚走私者
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者

step
    #optional
    .goto 1436/0,1324.200,-10490.400
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取它们的|T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_这里是动态刷新区域，击杀足够数量的敌人后，它们会持续刷新|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +迪菲亚走私者

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .target 格里安·斯托曼
    .goto 1436/0,1045.12,-10508.80
    .turnin 12 >> 交任务：西部荒野人民军

step
    .xp <14,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .target 格里安·斯托曼
    .goto 1436/0,1045.12,-10508.80
    .accept 65 >> 接任务：迪菲亚兄弟会

step
    #optional
    .isQuestComplete 102
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹努文队长|r交谈
    .target 丹努文队长
    .goto 1436/0,1041.97,-10511.13
    .turnin 102 >> 交任务：西部荒野的豺狼人

step
    .isQuestComplete 153
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target 哨兵加里安
    .goto 1436/0,1126.67,-10636.670
    .turnin 153 >> 交任务：红色皮质面罩

step
    .goto 1436/0,1179.800,-10635.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿尔巴·晴月::253092|r交谈
    .target 阿尔巴·晴月::253092
    .turnin 92742 >>交任务：测试水井
    .turnin 92744 >>交任务：鱼人的鳃
    .isQuestComplete 92744

step
    .goto 1436/0,1179.800,-10635.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿尔巴·晴月::253092|r交谈
    .target 阿尔巴·晴月::253092
    .turnin 92742 >>交任务：测试水井

step
    .hs >> 使用炉石返回暴风城
    .bindlocation 16509,1
    .cooldown item,6948,>2,1
    .zoneskip Stormwind City
    .zoneskip Darkshore

step
    #completewith endOfTheGuide
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >> 飞往暴风城
    .target 索尔
    .zoneskip Stormwind City
    .zoneskip Darkshore

step << Human Rogue
    #ah
    .goto 1453/0,609.63,-8787.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    .vendor 1287 >>|cRXP_BUY_向她购买一把|r |T135343:0|t[弯刀] |cRXP_BUY_，或在拍卖行购买更好的武器，并装备到副手|r
    .money <0.3815
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 玛尔达·维勒

step << Human Rogue
    #ssf
    .goto 1453/0,609.63,-8787.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    .vendor 1287 >>|cRXP_BUY_向她购买一把|r |T135343:0|t[弯刀] |cRXP_BUY_。|r
    .money <0.3815
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 玛尔达·维勒

step << Rogue
    .goto 1453/0,377.47,-8752.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯伯|r交谈
    .train 1758,1
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯

step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_武神|r或|cRXP_FRIENDLY_伊尔萨|r交谈
    .goto 1453/0,358.25,-8728.28,15,0
    .goto 1453/0,302.6,-8685.53,15,0
    .goto 1453/0,323.3,-8689.29
    .train 1160,1
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾

step << Hunter
    .goto 1453/0,552.78,-8415.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进去与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
    >>|cRXP_WARN_如果刚才已经学习过技能，就跳过此步|r
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛

step
    .goto 1453/0,719.67,-8550.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r交谈
    .turnin 399 >> 交任务：童年的记忆
    .target 巴隆斯·阿历克斯顿
    .isQuestComplete 399

step << NightElf Druid
    .goto 1453/0,1347.6192,-8591.2168
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞德兰|r交谈
    .trainer >>学习职业技能
    .target 塞瑞德兰

step << Warlock
    #optional
    #completewith next
    .goto 1453/0,988.44,-8942.15,20,0
    .goto 1453/0,1015.33,-8978.9,15 >> 前往屠羊酒馆并下楼

step << Warlock
    .goto 1453/0,1029.89,-8971.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >> 学习职业技能
    .train 6222,1
    .target 厄苏拉·德林

step << Mage
    #optional
    #completewith next
    .goto 1453/0,874.32,-9014.67,10 >> 前往法师塔

step << Mage
    .goto 1453/0,885.34,-9006.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .train 2137,1
    .trainer >> 学习职业技能
    .target 艾尔莎林

step << Priest/Paladin
    #optional
    #completewith train19742 << Paladin
    #completewith next << Priest
    .goto 1453/0,809.52,-8579.22,20 >> 前往暴风城大教堂

step << Human Paladin
    .isOnQuest 1780
    .goto 1453/0,845.800,-8545.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1780 >>交任务：圣洁之书
    .target 达索瑞恩·拉尔

step << Paladin
    #label train19742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .goto 1453/0,859.13,-8559.14,10,0
    .goto 1453/0,861.14,-8573.03
    .trainer >> 学习职业技能
    .train 19742,1
    .target 虔诚的亚瑟

step
    #optional
    #sticky
    .abandon 153 >> 如果尚未完成，放弃红色皮质面罩任务

step
    #optional
    #sticky
    .abandon 92744 >> 如果尚未完成，放弃鱼人的鳃任务

step
    #optional
    #label endOfTheGuide

step
    .goto 1453/0,673.58,-8867.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板奥里森|r交谈
    .home >> 将炉石设在暴风城
    .target 旅店老板奥里森
    .bindlocation 16509

step
    #ah
    .goto 1453/0,660.28,-8814.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_BUY_购买|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_BUY_和/或|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_BUY_，用于稍后提升|r |T133971:0|t[烹饪] |cRXP_BUY_技能|r
    >>|cRXP_WARN_你的|r |T133971:0|t[烹饪] |cRXP_WARN_技能必须达到10，才能在黑海岸交付|r |T133972:0|t[陆行鸟肉]
    >>|cRXP_WARN_如果不想做或无法完成此步，就跳过|r
    >>|cRXP_BUY_购买以下物品，以便稍后在黑海岸更快交任务：|r
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
    .target 拍卖师亚克森
    .skill cooking,<1,1 -- step only displays if skill is 1 or higher

step
    #ah
    #optional
    .goto 1453/0,660.28,-8814.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_WARN_如果不想做或无法完成此步，就跳过|r
    >>|cRXP_BUY_购买以下物品，以便稍后在黑海岸更快交任务：|r
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target 拍卖师亚克森

step
    .goto 1453/0,765.700,-8804.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯瑟琳·利兰|r交谈
    >>|cRXP_BUY_向她购买一颗|r |T134335:0|t[闪光的小珠] |cRXP_BUY_和三条|r |T134324:0|t[夜色虫] |cRXP_BUY_。这些物品用于一个奖励900经验的任务|r
    .collect 6529,1,95065,1 --|1/1 Shiny Bauble
    .collect 6530,3,95065,1 --|3/3 Nightcrawlers
    .target 凯瑟琳·利兰

step
    .goto 1453/0,1193.100,-8328.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_货单书记员菲尔莫::268511|r交谈
    .target 货单书记员菲尔莫::268511
    .accept 97220 >>接任务：菲尔莫的请求

step
    #label DockTravel
    .goto 1453/0,1269.100,-8540.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉尔伯特·格雷::267118|r交谈
    .target 吉尔伯特·格雷::267118
    .accept 95065 >>接任务：钓鱼时间
    .turnin 95065 >>交任务：钓鱼时间

step
    #optional
    #requires DockTravel
    #label DarkshoreCook1
    #completewith DarkshoreBoat
    >>|cRXP_WARN_在码头等船时：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火] |cRXP_WARN_（在专业技能书中）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50

step
    #optional
    #requires DarkshoreCook1
    #label DarkshoreCook2
    #completewith DarkshoreBoat
    >>|cRXP_WARN_在码头等船时：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火] |cRXP_WARN_（在专业技能书中）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50

step
    #optional
    #requires DarkshoreCook2
    #label DarkshoreCook3
    #completewith DarkshoreBoat
    >>|cRXP_WARN_在码头等船时：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火] |cRXP_WARN_（在专业技能书中）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50

step
    #optional
    #requires DarkshoreCook3
    #label DarkshoreCook4
    #completewith DarkshoreBoat
    >>|cRXP_WARN_需要50点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以完成之后暮色森林的一个任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_以下物品：|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_WARN_制成|r |T133974:0|t[烤野猪肉]
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_WARN_制成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1

step
    #optional
    #requires DarkshoreCook4
    #label DarkshoreCook5
    #completewith DarkshoreBoat
    >>|cRXP_WARN_需要50点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以完成之后暮色森林的一个任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_WARN_制成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1

step
    #optional
    #requires DarkshoreCook5
    #label DarkshoreCook6
    #completewith DarkshoreBoat
    >>|cRXP_WARN_需要50点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以完成之后暮色森林的一个任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_WARN_制成|r |T133974:0|t[烤野猪肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1

step
    #optional
    .goto 1453/0,1330.100,-8645.400
    >>|cRXP_WARN_如有需要，在等候前往黑海岸的船时提升|r |T135966:0|t[急救] |cRXP_WARN_技能|r
    .zone Darkshore >> 乘船前往黑海岸
    .skill firstaid,<1,1 -- shows if firstaid is >1

step
    #label DarkshoreBoat
    .goto 1453/0,1330.100,-8645.400
    .zone Darkshore >> 乘船前往黑海岸
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#forever
#version 1
<< Alliance !NightElf
#name 15-17 Darkshore
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
#subgroupdisplayname 1-20
--#groupid RXP-SRGCE-A1
#next 17-18 Hall of Thanes
#displayname 15-17 黑海岸
step
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞瑞利恩·白爪|r 交谈
    .accept 963 >> 接任务：永志不渝
    .target 塞瑞利恩·白爪
step
    #optional
    #completewith next
    .goto 1439/1,525.800,6414.800,8 >> 沿坡道上去，前往 |cRXP_FRIENDLY_维兹班恩·曲针|r 处
step
    .goto 1439,36.976,44.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与 |cRXP_FRIENDLY_维兹班恩·曲针|r 交谈
    .accept 983 >> 接任务：传声盒827号
    .target 维兹班恩·曲针
step
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴瑞萨斯·月影|r 交谈
    .accept 947 >> 接任务：洞中的蘑菇
    .target 巴瑞萨斯·月影
step
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r 交谈
    .accept 4811 >> 接任务：红色水晶
    .target 哨兵戈琳达·纳希恩
step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨纳瑞恩·绿树|r 交谈
    .accept 2118 >> 接任务：瘟疫蔓延
    .target 萨纳瑞恩·绿树
step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特伦希斯|r 交谈
    .accept 984 >> 接任务：熊怪的威胁
    .target 特伦希斯
step
    .goto 1439/1,503.100,6402.100
    >>点击 |cRXP_PICK_通缉告示|r
    .accept 98025 >>接任务：通缉：贾伊瓦内尔
step
    #optional
    .goto 1439/1,577.38,6371.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_古博·布拉普|r 交谈
    .accept 1141 >> 接任务：钓鱼世家
    .turnin 1141 >> 交任务：钓鱼世家
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target 古博·布拉普
step
    #label WashedA
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温尼斯·布莱葛|r 交谈
    .accept 3524 >> 接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step
    .goto 1439/1,561.66,6343.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_凯莱斯·月羽|r 交谈
    .fp Auberdine >> 开通奥伯丁飞行点
    .target 凯莱斯·月羽
step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    #optional
    #completewith RabidThistle
    #loop
    .goto 1439/1,272.54,5255.27,0
    .goto 1439/1,271.23,4902.88,0
    .goto 1439/1,438.91,5131.69,0
    .goto 1439/1,272.54,5255.27,40,0
    .goto 1439/1,271.23,4902.88,40,0
    .goto 1439/1,438.91,5131.69,40,0
    >>|cRXP_WARN_派宠物攻击一头 |r|cRXP_ENEMY_蓟熊|r|cRXP_WARN_。宠物被 |r|cRXP_ENEMY_蓟熊|r|cRXP_WARN_ 击晕后，放弃宠物并开始驯服蓟熊|r
    .train 16828 >>|cRXP_WARN_施放|r |T132164:0|t[驯服野兽]，|cRXP_WARN_对一头 |r|cRXP_ENEMY_蓟熊|r|cRXP_WARN_ 使用以驯服它|r
    .target 蓟熊
    .train 17255,1 --skips if they also already know bite r2
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
    >>击杀 |cRXP_ENEMY_小潮行蟹|r 和 |cRXP_ENEMY_暗礁蟹幼崽|r，拾取 |cRXP_LOOT_蟹腿|r
    >>|cRXP_WARN_可能需要下水寻找它们|r
    >>|cRXP_WARN_即使部分怪物已是灰名，也要完成这个任务，它是任务链的一环|r
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
    .isOnQuest 983
step
    .goto 1439,36.371,50.920
    >>打开 |cRXP_PICK_搁浅的海洋生物|r，拾取 |cRXP_LOOT_海洋生物的骸骨|r
    .complete 3524,1 --Sea Creature Bones (1)
step << Druid
    #ah
    #optional
    #completewith CliffspringEnd
    #label GatheringQ
    .skill herbalism,15 >>|cRXP_WARN_提升|r |T136065:0|t[草药学] |cRXP_WARN_至 15，以便采集|r |T134187:0|t[地根草]，|cRXP_WARN_稍后的重要职业任务会用到。完成后可以遗忘草药学|r
    >>|cRXP_WARN_如果打算稍后购买 5 株|r |T134187:0|t[地根草]，|cRXP_WARN_从拍卖行购入即可，跳过此步骤|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox
step << Druid
    #ssf
    #optional
    #completewith CliffspringEnd
    #label GatheringQ
    .skill herbalism,15 >>|cRXP_WARN_提升|r |T136065:0|t[草药学] |cRXP_WARN_至 15，以便采集 5 株|r |T134187:0|t[地根草]，|cRXP_WARN_稍后的重要职业任务会用到。完成后可以遗忘草药学|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox
step << Druid
    #optional
    #completewith CliffspringEnd
    #requires GatheringQ
    >>|cRXP_WARN_收集 5 株 |T134187:0|t[地根草]，通过 |T136065:0|t[草药学] 采集，也可能从 |r|cRXP_PICK_破损的箱子|r|cRXP_WARN_ 中少量获得，后续职业任务会用到|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .skill herbalism,<15,1
step
    #completewith next
    >>|cRXP_WARN_使用|r |T134335:0|t[萨纳瑞恩的希望]，|cRXP_WARN_对一头|r |cRXP_ENEMY_狂暴蓟熊|r 使用 --|cRXP_WARN_. It can be used from any range as long as you're targeting the|r |cRXP_ENEMY_Bear|r
    -->>|cRXP_WARN_==DO NOT USE THE QUEST ITEM IF THERES NO |cRXP_ENEMY_BEAR|r NEARBY==|r
    >>|cRXP_WARN_陷阱可能会被浪费，导致任务无法完成！如果发生这种情况，需要回到任务发布者处再要一个陷阱|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .unitscan 狂暴蓟熊
    .use 7586
step
    .goto 1439/1,393.72,5993.24
    >>跑到熊怪营地边缘
    .complete 984,1 -- Find a corrupt furbolg camp
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
    >>|cRXP_WARN_使用|r |T134335:0|t[萨纳瑞恩的希望]，|cRXP_WARN_对一头|r |cRXP_ENEMY_狂暴蓟熊|r 使用 --|cRXP_WARN_. It can be used from any range as long as you're targeting the bear|r
    -->>|cRXP_WARN_==DO NOT USE THE QUEST ITEM IF THERES NO BEAR NEARBY==|r
    >>|cRXP_WARN_陷阱可能会被浪费，导致任务无法完成！如果发生这种情况，需要回到任务发布者处再要一个陷阱|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .unitscan 狂暴蓟熊
    .use 7586
step
    #label invisThistle
    #optional
    #requires RabidThistle
--XXREQ Placeholder invis step until multiple requires per step
step
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地上的 |cRXP_PICK_传声盒827号|r
    .turnin 983 >> 交任务：传声盒827号
    .accept 1001 >> 接任务：传声盒411号
step
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温尼斯·布莱葛|r 交谈
    .turnin 3524 >> 交任务：搁浅的巨兽
    .accept 4681 >> 接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >> 前往码头上的 |cRXP_FRIENDLY_塞瑞利恩·白爪|r 处
step
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞瑞利恩·白爪|r 交谈
    .accept 963 >> 接任务：永志不渝
    .target 塞瑞利恩·白爪
step
    #optional
    #completewith SeaT1
    .goto 1439,32.432,43.744,15 >> 走到码头尽头，然后跳入水中
step
    #optional
    #completewith washed1
    .goto 1439/1,741.52,6570.95,0
    .goto 1439/1,915.10,6333.84,0
    .goto 1439/1,778.20,6231.66,0
    >>击杀 |cRXP_ENEMY_黑海岸蛇颈龙|r，拾取 |cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
    .isOnQuest 1001
step
    #label SeaT1
    .goto 1439,31.841,46.304
    >>打开 |cRXP_PICK_海龟骸骨|r，拾取 |cRXP_LOOT_海龟的残骸|r
    .complete 4681,1 --Sea Turtle Remains (1)
step
    #label washed1
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温尼斯·布莱葛|r 交谈
    .turnin 4681 >> 交任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴瑞萨斯·月影|r 交谈
    .accept 947 >> 接任务：洞中的蘑菇
    .target 巴瑞萨斯·月影
step
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r 交谈
    .accept 4811 >> 接任务：红色水晶
    .target 哨兵戈琳达·纳希恩
step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨纳瑞恩·绿树|r 交谈
    .turnin 2118 >> 交任务：瘟疫蔓延
    .accept 2138 >> 接任务：清除疫病
    .target 萨纳瑞恩·绿树
step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特伦希斯|r 交谈
    .turnin 984 >> 交任务：熊怪的威胁
    .accept 985 >> 接任务：熊怪的威胁
    .accept 4761 >> 接任务：桑迪斯·织风
    .target 特伦希斯
step
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高尔博德·钢手|r 交谈
    .accept 982 >> 接任务：深不可测的海洋
    .target 高尔博德·钢手
step
    #optional
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥兰达利亚·夜歌|r 交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
step
    #optional
    #completewith next
    .goto 1439/1,488.69,6564.830
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入屋内，与 |cRXP_FRIENDLY_达蒙德|r 交谈
    .vendor 4182 >> |cRXP_BUY_按需购买|r |T133634:0|t[棕色小包] |cRXP_BUY_或|r |T133634:0|t[棕色小皮包]，|cRXP_BUY_由他出售|r
    >>|cRXP_BUY_购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_或|r |T132384:0|t[实心弹]，|cRXP_BUY_向他购买，直到箭袋或弹药包装满|r << Hunter
    .target 达蒙德
step
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_桑迪斯·织风|r 交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .accept 954 >> 接任务：巴莎兰
    .accept 958 >> 接任务：上层精灵的工具 << !sod
    .target 桑迪斯·织风
    .xp >16,1
--XX if 16+, skip Tools
step
    #optional
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_桑迪斯·织风|r 交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .accept 954 >> 接任务：巴莎兰
    .target 桑迪斯·织风
    .xp >18,1
--XX if 18+, skip Bashal
step
    #optional
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_桑迪斯·织风|r 交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
step
    #completewith MistVeil
    .goto 1439/1,620.35,6768.76,0
    .goto 1439/1,602.66,6924.21,0
    .goto 1439/1,537.82,7023.33,0
    .goto 1439/1,404.85,7099.75,0
    .goto 1439/1,310.53,7077.48,0
    .goto 1439/1,620.35,6768.76,55,0
    .goto 1439/1,602.66,6924.21,55,0
    >>击杀 |cRXP_ENEMY_黑海岸蛇颈龙|r，拾取 |cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
    .isOnQuest 1001
    .isOnQuest 982
step
    #optional
    #completewith next
    +|cRXP_WARN_按 Escape，然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用互动按键”，并为“与目标互动”设置快捷键|r
step
    .goto 1439,38.213,28.754
--  .goto 1439,38.234,28.796
    >>|cRXP_WARN_==注意呼吸条==|r
    >>|cRXP_WARN_潜入水中，游到船尾外侧|r
    >>|cRXP_WARN_到达箭头位置后，按“与目标互动”快捷键，从船外拾取 |r|cRXP_LOOT_银色清晨号的保险箱|r
    >>|cRXP_WARN_如果不想这样做，就潜入水中游进船底层，在船内拾取 |r|cRXP_LOOT_银色清晨号的保险箱|r
    .complete 982,1 --Silver Dawning's Lockbox (1)
    .isOnQuest 982
step
    #label MistVeil
    .goto 1439,39.581,27.487
--  .goto 1439,39.629,27.462
    >>|cRXP_WARN_==注意呼吸条==|r
    >>|cRXP_WARN_潜入水中，游到船尾外侧|r
    >>|cRXP_WARN_到达箭头位置后，按“与目标互动”快捷键，从船外拾取 |r|cRXP_LOOT_迷雾之纱号的保险箱|r
    >>|cRXP_WARN_如果不想这样做，就潜入水中游进船底层，在船内拾取 |r|cRXP_LOOT_迷雾之纱号的保险箱|r
    .complete 982,2 --Mist Veil Lockbox (1)
    .isOnQuest 982
step
    #loop
    .goto 1439/1,310.53,7077.48,0
    .goto 1439/1,404.85,7099.75,0
    .goto 1439/1,537.82,7023.33,0
    .goto 1439/1,310.53,7077.48,55,0
    .goto 1439/1,404.85,7099.75,55,0
    .goto 1439/1,537.82,7023.33,55,0
    .goto 1439/1,602.66,6924.21,55,0
    .goto 1439/1,620.35,6768.76,55,0
    .goto 1439/1,602.66,6924.21,55,0
    .goto 1439/1,620.35,6768.76,55,0
    >>击杀 |cRXP_ENEMY_黑海岸蛇颈龙|r，拾取 |cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
    .isOnQuest 1001
step
    .goto 1439,41.901,31.339
    >>点击 |cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >> 接任务：搁浅的海洋生物
step
    .goto 1439,41.960,28.616
    >>点击地上的 |cRXP_PICK_传声盒411号|r
    .turnin 1001 >> 交任务：传声盒411号
    .isQuestComplete 1001
step
    #optional
    #completewith Bashal1
    .goto 1439,44.629,36.316,20,0
    .goto 1439,44.168,36.289,15 >> 前往 |cRXP_FRIENDLY_阿斯特利安|r 处
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿斯特利安|r 交谈
    >>|cRXP_WARN_途中避免击杀 |r|cRXP_ENEMY_野生劣魔|r|cRXP_WARN_ 和 |r|cRXP_ENEMY_恶灵劣魔|r
    .turnin 954 >> 交任务：巴莎兰
    .accept 955 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isOnQuest 954
    .xp >16,1
--XX skip Bashal Aran qline if 16+
step
    #optional
    #label Bashal1
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿斯特利安|r 交谈
    >>|cRXP_WARN_途中避免击杀 |r|cRXP_ENEMY_野生劣魔|r|cRXP_WARN_ 和 |r|cRXP_ENEMY_恶灵劣魔|r
    .turnin 954 >> 交任务：巴莎兰
    .target 阿斯特利安
    .isOnQuest 954
--XX Turn in Breadcrumb if you picked it up earlier before 18
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
    >>击杀 |cRXP_ENEMY_野生劣魔|r 和 |cRXP_ENEMY_恶灵劣魔|r，拾取 |cRXP_LOOT_劣魔耳环|r
    >>|cRXP_WARN_暂时避免击杀 |r|cRXP_ENEMY_戴瑟雷萨特|r
    .complete 955,1 --Grell Earring (8)
    .mob 野生劣魔
    .mob 恶灵劣魔
    .isOnQuest 955
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿斯特利安|r 交谈
    .turnin 955 >> 交任务：巴莎兰
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestComplete 955
step
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿斯特利安|r 交谈
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestTurnedIn 955
step
    #optional
    .abandon 955 >> 放弃“巴莎兰”
step
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
    >>击杀 |cRXP_ENEMY_戴瑟雷萨特|r，拾取 |cRXP_LOOT_远古月亮石封印|r
    >>|cRXP_WARN_注意，它们没有动态刷新机制|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob 戴瑟雷萨特
    .isQuestTurnedIn 955
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿斯特利安|r 交谈
    .turnin 956 >> 交任务：巴莎兰
    .accept 957 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestComplete 956
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿斯特利安|r 交谈
    .accept 957 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestTurnedIn 956
step
    .goto 1439,47.314,48.676
    >>上去寻找 |cRXP_PICK_神秘的红色水晶|r
    >>|cRXP_WARN_小心两组、每组 2 只的 |r|cRXP_ENEMY_狂暴的月夜枭兽|r|cRXP_WARN_，它们在 |r|cRXP_PICK_神秘的红色水晶|r|cRXP_WARN_ 西侧，距离最近的两只会联动|r
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range
step
    #sticky
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
    >>击杀 |cRXP_ENEMY_安娜雅·晨路|r，拾取她的 |cRXP_LOOT_坠饰|r
    -->>|cRXP_WARN_Be aware that she has a 7-8 minute spawn time and 4 different spawnpoints across Ameth'Aran|r
    -->>|cRXP_WARN_You may want to group with others nearby if you can't find her. Ask in General Chat (/1) to group with anyone else that is also looking for her|r
    -->>|cRXP_WARN_If you can't find her and want to try again later at the cost of potentially grinding more mobs soon, skip this step|r
    --much faster spawn time now on forever
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
step
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
    >>击杀 |cRXP_ENEMY_被诅咒的贵族|r、|cRXP_ENEMY_挣扎的贵族|r 和 |cRXP_ENEMY_哀嚎的贵族|r，拾取 |cRXP_LOOT_上层精灵的遗物|r
    .complete 958,1 --Highborne Relic (7)
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
    .mob 哀嚎的贵族
    .isOnQuest 958
step
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵坦莎·月刃|r 交谈
    .accept 953 >> 接任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
    .xp >17,1
step
    .goto 1439,42.652,63.145
    >>点击 |cRXP_PICK_亚米萨兰的毁灭|r
    .complete 953,2 --Read The Fall of Ameth'Aran (1)
    .isOnQuest 953
step << !sod/Warrior/Rogue/Priest
    .goto 1439,42.373,61.815
    >>点击 |cRXP_PICK_远古火焰|r
    .complete 957,1 --Destroy the seal at the ancient flame (1)
    .isOnQuest 957
step
    #label TheLay
    .goto 1439/1,105.52,5770.100
    >>点击 |cRXP_PICK_亚米萨兰的衰落|r
    .complete 953,1 --Read The Lay of Ameth'Aran (1)
    .isOnQuest 953
step
    .isOnQuest 98025
    .waypoint 1439/1,-18.100,5779.800
    >>击杀 |cRXP_ENEMY_贾伊瓦内尔|r，拾取 |cRXP_LOOT_贾伊瓦内尔之羽|r
    .complete 98025,1 --|1/1 Feather of Jai'vhanel
    .mob 贾伊瓦内尔
step
    #optional
    #requires Relics
--XXREQ Placeholder invis step until multiple requires per step
step
    #optional
    #requires Anaya
--XXREQ Placeholder invis step until multiple requires per step
step
    .isQuestComplete 953
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵坦莎·月刃|r 交谈
    .turnin 953 >> 交任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
step
    #optional
    #completewith FurbolgGrind
    >>击杀 |cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心它们施放|r |T135914:0|t[狂犬病]，|cRXP_WARN_若未迅速击杀它们就会中招（近战瞬发：所有生命恢复速度降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
step
    .goto 1439,37.105,62.167
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4722 >> 接任务：搁浅的海龟
step
    #loop
    #label FurbolgGrind
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
    #completewith TOTH
    .goto 1439,36.701,45.122
    .subzone 442 >> 返回奥伯丁
step
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温尼斯·布莱葛|r 交谈
    .turnin 4722 >> 交任务：搁浅的海龟
    .turnin 4723 >> 交任务：搁浅的海洋生物
    .target 温尼斯·布莱葛
step
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >> 返回码头上的 |cRXP_FRIENDLY_塞瑞利恩·白爪|r 处
step
    #optional
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞瑞利恩·白爪|r 交谈
    .turnin 963 >> 交任务：永志不渝
    .target 塞瑞利恩·白爪
    .isQuestComplete 963
step
    .isOnQuest 98025
    .goto 1439/1,472.900,6439.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵戈琳达·纳希恩::2930|r 交谈
    .target 哨兵戈琳达·纳希恩::2930
    .turnin 98025 >>交任务：通缉：贾伊瓦内尔
step
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r 交谈
    .turnin 4811 >> 交任务：红色水晶
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
step
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_使用|r |T134865:0|t[空水瓶]，|cRXP_WARN_在奥伯丁月亮井中取水|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338
step
    #optional
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨纳瑞恩·绿树|r 交谈
    .turnin 2138 >> 交任务：清除疫病
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
    .isQuestComplete 2138
step
    #optional
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨纳瑞恩·绿树|r 交谈
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
    .isQuestTurnedIn 2138
step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特伦希斯|r 交谈
    .turnin 985 >> 交任务：熊怪的威胁
    .target 特伦希斯
step
    #optional
    #completewith next
    .goto 1439,39.280,43.121,6,0
    .goto 1439,39.162,43.194,6 >> 上楼
step
    .goto 1439,39.043,43.555
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与 |cRXP_FRIENDLY_哨兵艾莉萨·星风|r 交谈
    .accept 965 >> 接任务：奥萨拉克斯之塔
    .target 哨兵艾莉萨·星风
step
    #optional
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高尔博德·钢手|r 交谈
    .turnin 982 >> 交任务：深不可测的海洋
    .target 高尔博德·钢手
    .isQuestComplete 982
step
    #optional
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥兰达利亚·夜歌|r 交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
step
    #label TOTH
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_桑迪斯·织风|r 交谈
    .turnin 958 >> 交任务：上层精灵的工具
    .target 桑迪斯·织风
    .isQuestComplete 958
step
    .goto 1439,47.314,48.676
    >>点击 |cRXP_PICK_神秘的红色水晶|r
    >>|cRXP_WARN_小心 2 组、每组 2 只的 |r|cRXP_ENEMY_狂暴的月夜枭兽|r|cRXP_WARN_，它们在 |r|cRXP_PICK_神秘的红色水晶|r|cRXP_WARN_ 西侧，距离最近的两只会联动|r
    .turnin 4812 >> 交任务：清洗水晶
    .accept 4813 >> 接任务：水晶中的碎骨
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿斯特利安|r 交谈
    .turnin 957 >> 交任务：巴莎兰
    .isOnQuest 957
    .target 阿斯特利安
step
    #optional
    #completewith CrabTurtle
    >>击杀 |cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心它们施放|r |T135914:0|t[狂犬病]，|cRXP_WARN_若未迅速击杀它们就会中招（近战瞬发：所有生命恢复速度降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
step
    #label CrabTurtle
    .goto 1439/1,47.88,7433.800
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4725 >> 接任务：搁浅的海龟
step
    .goto 1439/1,-386.39,7219.830
    >>|cRXP_WARN_使用|r |T134865:0|t[空的水样试管]，|cRXP_WARN_在壁泉河下游取样|r
    .complete 4762,1 --Cliffspring River Sample (1)
    .use 12350
step
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
    >>击杀 |cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心它们施放|r |T135914:0|t[狂犬病]，|cRXP_WARN_若未迅速击杀它们就会中招（近战瞬发：所有生命恢复速度降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
step
    #optional
    #completewith next
    .goto 1439,54.934,32.721,20,0
    .goto 1439,55.108,33.600,40 >> 前往壁泉河洞穴
step << Druid
    .goto 1439/1,-660.18,6874.43
    >>|cRXP_WARN_使用|r |T134776:0|t[空的峭壁之泉取样器]，|cRXP_WARN_在壁泉河洞穴入口的水中取样|r
    .complete 6122,1 --Filled Cliffspring Falls Sampler (1)
    .isOnQuest 6122
step
    .goto 1439/1,-690.31,6751.29,12,0
    .goto 1439/1,-706.68,6748.23,12,0
    .goto 1439/1,-719.13,6787.530,12,0
    >>拾取地上的 |cRXP_LOOT_粗柄蘑菇|r 和一朵 |cRXP_LOOT_毒帽蘑菇|r
    >>|cRXP_WARN_留在上层。如果上层尽头没有 |r|cRXP_LOOT_毒帽蘑菇|r|cRXP_WARN_，就跳到下层，从南侧房间拾取一朵|r
    >>|cRXP_WARN_小心 |r|cRXP_ENEMY_雷鳞御浪者|r|cRXP_WARN_ 施放|r |T135836:0|t[水流喷射]，|cRXP_WARN_远程瞬发，对附近敌人造成伤害并击退；注意站位，避免被击落洞穴上层|r
    .complete 947,1 --Scaber Stalk (5)
    .goto 1439/1,-663.45,6877.49,8,0
    .goto 1439/1,-679.17,6848.67,8,0
    .goto 1439/1,-666.73,6819.41,8,0
    .goto 1439/1,-680.48,6779.67,8,0
    .goto 1439/1,-663.45,6877.49,8,0
    .goto 1439/1,-679.17,6848.67,8,0
    .goto 1439/1,-666.73,6819.41,8,0
    .goto 1439/1,-680.48,6779.67,8,0
    .goto 1439/1,-663.45,6877.49
    .complete 947,2 --Death Cap (1)
    .goto 1439/1,-685.72,6746.49
step
    .deathskip >> 死亡后在奥伯丁墓地复活
    .target 灵魂医者
step
    #optional
    #label CavetoAuber
    #completewith CliffspringEnd
    .subzone 442 >> 前往奥伯丁
step
    #label CliffspringEnd
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_桑迪斯·织风|r 交谈
    .turnin 4762 >> 交任务：壁泉河
    .target 桑迪斯·织风
step
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥兰达利亚·夜歌|r 交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
    .itemcount 5469,5 -- strider meat (5)
step << Druid
    #optional
    .isOnQuest 6122
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥兰达利亚·夜歌|r 交谈
    .turnin 6122 >> 交任务：毒水之源
    .accept 6123 >> 接任务：收集解药
    .target 奥兰达利亚·夜歌
step << Druid
    #optional
    .isQuestTurnedIn 6122
    .goto 1439/1,472.32,6556.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥兰达利亚·夜歌|r 交谈
    .accept 6123 >> 接任务：收集解药
    .target 奥兰达利亚·夜歌
step << !Druid
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考古学家霍莉|r 交谈
    .accept 729 >> 接任务：健忘的勘察员
    .target 考古学家霍莉
step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨纳瑞恩·绿树|r 交谈
    .turnin 2138 >> 交任务：清除疫病
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
step
    .goto 1439/1,472.32,6438.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r 交谈
    >>|cRXP_WARN_选择|r |T135641:0|t[曲木匕首]，|cRXP_WARN_尽量保留一把|r |T135641:0|t[匕首]，|cRXP_WARN_用于后续的|r |T132290:0|t[毒药] |cRXP_WARN_任务|r << Rogue
    .turnin 4813 >> 交任务：水晶中的碎骨
    .target 哨兵戈琳达·纳希恩
step
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴瑞萨斯·月影|r 交谈
    .turnin 947 >> 交任务：洞中的蘑菇
    .accept 948 >> 接任务：安努
    .target 巴瑞萨斯·月影
step
    .goto 1439/1,504.41,6402.39
    >>点击 |cRXP_PICK_通缉告示|r
    .accept 4740 >> 接任务：通缉：莫克迪普！
step
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温尼斯·布莱葛|r 交谈
    .turnin 4723 >> 交任务：搁浅的海洋生物
    .turnin 4725 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛
    .isOnQuest 4723,4725
----Start of Druid Quest section----
step << Druid
    #completewith TotL
    .goto 1439,33.213,39.883
    .zone Teldrassil >> 乘船前往达纳苏斯
    .zoneskip Darnassus
step << Druid
    #optional
    #label DruidLesson
    #completewith TotL
    .goto 1438/1,965.80,8780.95
    .zone Darnassus >> 穿过紫色传送门，进入达纳苏斯
step << Druid
    .goto 1457/1,2563.98,10179.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛斯雷·驭熊者|r 交谈
    .accept 26 >> 接任务：必修的课程
    .trainer >> 学习职业技能
    .target 玛斯雷·驭熊者
step << Druid
    #optional
    #completewith next
    .abandon 729 >> 放弃“健忘的勘察员”，以便接取任务“黑海岸的麻烦？”
step << Druid
    #optional
	#completewith TotL
	.cast 18960 >> 施放传送：月光林地
	.zoneskip Moonglade
step << Druid
    .goto 1450/1,-2676.22,8019.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德迪利特·星焰|r 交谈
    .turnin 26 >> 交任务：必修的课程
    .accept 29 >> 接任务：湖中试炼
    .target 德迪利特·星焰
step << Druid
    .goto 1450/1,-2595.43,7697.24
    >>游入月神湖
    >>打开 |cRXP_PICK_灵珠容器|r，拾取 |T134125:0|t[神殿灵珠]
    >>|cRXP_WARN_它可能出现在水下的不同位置|r
    .collect 15877,1,29,1 -- Shrine Bauble (1)
step << Druid
    #optional
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .itemcount 15877,1 -- Shrine Bauble (1)
step << Druid
    .goto 1450/1,-2212.85,7854.68
    >>|cRXP_WARN_使用|r |T134125:0|t[神殿灵珠]，|cRXP_WARN_站在雷姆洛斯神殿的大树旁操作|r
    .complete 29,1 --Complete the Trial of the Lake.
    .use 15877
step << Druid
    #label TotL
    .goto 1450/1,-2224.18,7874.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔加里|r 交谈
    .turnin 29 >> 交任务：湖中试炼
    .accept 272 >> 接任务：海狮试炼
    .target 塔加里
step
    .hs >> 使用炉石返回暴风城
    .zoneskip Stormwind City
    .zoneskip Darkshore
    .zoneskip Ironforge
step
    .goto 1453/0,566.600,-8845.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊莱恩·提亚斯::483|r 交谈
    .target 伊莱恩·提亚斯::483
    .turnin 97220 >>交任务：菲尔莫的请求
    .accept 97222 >>接任务：门楼货物
step
    .goto 1453/0,568.300,-8862.200
    .use 277198 >> |cRXP_WARN_使用|r |T132762:0|t[门楼货物]，|cRXP_WARN_将其放在楼上的 |r|cRXP_PICK_门楼库房门|r|cRXP_WARN_ 前|r
    .complete 97222,1 --|1/1 Gatehouse Shipment delivered
step
    #label Gatehouse
    .goto 1453/0,566.600,-8845.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊莱恩·提亚斯::483|r 交谈
    .target 伊莱恩·提亚斯::483
    .turnin 97222 >>交任务：门楼货物
step << Druid
    .goto 1453/0,1095.500,-8741.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞瑞德兰|r 交谈
    .trainer >>学习职业技能
	.target 塞瑞德兰
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step << Warlock
    #optional
    #completewith next
    .goto 1453/0,988.44,-8942.15,20,0
    .goto 1453/0,1015.33,-8978.9,15 >> 前往已宰的羔羊旅店并下楼
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step << Warlock
    .goto 1453/0,1029.89,-8971.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step << Mage
    #optional
    #completewith next
    .goto 1453/0,874.32,-9014.67,10 >> 前往法师塔
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step << Mage
    .goto 1453/0,885.34,-9006.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾尔莎林|r 交谈
    .trainer >> 学习职业技能
    .target 艾尔莎林
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step << Priest/Paladin
    #optional
    #completewith next
    .goto 1453/0,809.52,-8579.22,20 >> 前往暴风城大教堂
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 交谈
    .goto 1453/0,859.13,-8559.14,10,0
    .goto 1453/0,861.14,-8573.03
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔舒修士|r 交谈
    .goto 1453/0,862.89,-8519.61
    .trainer >> 学习职业技能
    .target 乔舒修士
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step << Hunter
    .goto 1453/0,552.78,-8415.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_恩瑞斯·锐矛|r 交谈
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step << Hunter
    .goto 1453/0,553.22,-8422.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡瑞娜·麦肯达|r 交谈
    .trainer >> 学习宠物技能
    .target 卡瑞娜·麦肯达
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step << Rogue
    .goto 1453/0,377.47,-8752.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 交谈
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_武神|r 或 |cRXP_FRIENDLY_伊尔萨|r 交谈
    .goto 1453/0,358.25,-8728.28,15,0
    .goto 1453/0,302.6,-8685.53,15,0
	.goto 1453/0,323.3,-8689.29
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step
    #completewith next
    .goto 1453/0,562.300,-8385.300,20,0
    .goto 1453/0,522.000,-8352.101
    .subzone 2257 >>进入矿道地铁
    .zoneskip Ironforge
    .zoneskip Dun Morogh
step
    .zone Ironforge >> 乘坐地铁前往铁炉堡
    .zoneskip Dun Morogh
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#subgroupdisplayname 1-20
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
--#groupid RXP-SRGCE-A1
#name 17-18 Hall of Thanes
#next 18-19 Ruins of Lordaeron
#displayname 16-17 领主大厅 << NightElf
#displayname 17-18 领主大厅

step << Skyborne
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 交谈
    .fp Ironforge >> 开通铁炉堡飞行路线
    .target 格莱斯·瑟登

step << !NightElf
    #completewith OII
    +|cRXP_WARN_接下来先完成领主大厅的前置任务，再进入地下城|r

step << !NightElf
    #completewith OII
    .zone Dun Morogh >> 前往丹莫罗

step << !NightElf
    #label QuarryStart
    .goto 1426/0,-1394.24,-5797.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大地先知法森|r 交谈
    .accept 96392 >> 接任务：法森的守望
    .target 大地先知法森

step << !NightElf
    .isOnQuest 96392
    .goto 1426/0,-1394.24,-5797.83
    .gossipoption 139831 >> 与 |cRXP_FRIENDLY_大地先知法森|r 交谈，借助他的视界术观察
    >>|cRXP_WARN_目标完成后即可取消视界术|r
    .target 大地先知法森

step << !NightElf
    .isOnQuest 96392
    .aura -1293681 >> |cRXP_WARN_按 Esc 键取消视界术|r

step << skip
    .goto 1426/0,-1394.24,-5797.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大地先知法森|r 交谈
    >>|cRXP_WARN_目标完成后即可取消视界术|r
    .complete 96392,1 -- Use Farsen's Farsight
    .skipgossip
    .target 大地先知法森

step << !NightElf
    .goto 1426/0,-1394.24,-5797.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大地先知法森|r 交谈
    >>|cRXP_WARN_按 Esc 键取消视界术|r
    .turnin 96392 >> 交任务：法森的守望
    --.accept 96390 >> Accept Nip 'Em in the Bud
    .target 大地先知法森

step << !NightElf
    .goto 1426/0,-2009.87,-5860.22,40,0
    .goto 1426/0,-2034.49,-5922.60
    >>击杀 |cRXP_ENEMY_黑铁间谍|r，拾取 |T237385:0|t[|cRXP_LOOT_黑铁地图|r]
    .use 274268 >>|cRXP_WARN_使用|r |T237385:0|t[|cRXP_LOOT_黑铁地图|r] |cRXP_WARN_接受任务|r
    -->>|cRXP_WARN_You can skip killing |cRXP_ENEMY_Dark Iron Spies|r for the other quest because they are low level once you find the|r |T237385:0|t[|cRXP_LOOT_Dark Iron Map|r]
    --.complete 96390,1 -- Dark Iron Spy slain 10/10
    --.disablecheckbox
    .collect 274268,1,96391,1 -- Dark Iron Map (1)
    .accept 96391 >> 接任务：地下地图
    .mob 黑铁间谍

step << !NightElf
    #label OII
    .goto 1426/0,-1394.24,-5797.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大地先知法森|r 交谈
    .turnin 96391 >> 交任务：地下地图
    .accept 96393 >> 接任务：旧铁炉堡入侵
    .target 大地先知法森

step << !NightElf
    #optional
    .isQuestComplete 96390
    .goto 1426/0,-1394.24,-5797.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大地先知法森|r 交谈
    .turnin 96390 >> 交任务：防患于未然
    .target 大地先知法森

step
    #completewith EnterHoT
    +|cRXP_WARN_开始寻找领主大厅的队伍|r

step
    #optional
    #label InIronforge
    #completewith EnterHoT
    .zone Ironforge >> 前往铁炉堡

step
    #requires InIronforge
    #completewith EnterHoT
    .goto 1455/0,-1054.300,-4843.200,10,0
    .goto 1455/0,-1081.900,-4850.100,10,0
    .goto 1455/0,-1082.800,-4886.000,10,0
    .goto 1455/0,-1087.700,-4821.900,10,0
    .goto 1455/0,-1010.300,-4850.900,10 >> 穿过 |cRXP_FRIENDLY_麦格尼国王|r 的房间，向下进入旧铁炉堡

step
    .goto 1455/0,-971.800,-4820.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿法德拉·顿沃尔|r 交谈
    .accept 96394 >> 接任务：永不安息的亡者
    .target 阿法德拉·顿沃尔

step
    #completewith EnterHoT
    .goto 1455/0,-996.100,-4821.200,10,0
    .goto 1455/0,-972.000,-4803.000,10,0
    .goto 1455/0,-988.900,-4854.400,10 >> |cRXP_WARN_跳到下方的斜坡上|r

step
    .goto 1455/0,-968.200,-4803.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_汤姆·费尔奇|r 交谈
    .accept 96403 >> 接任务：重要的传家宝
    .target 汤姆·费尔奇

step
    #label EnterHoT
    .enabledungeon HOT
    .goto 1455/0,-933.200,-4821.900
    .subzone 16919 >> 进入领主大厅

step
    #completewith FaldrimAnvilmar
    >>拾取领主大厅各处地面上的 |cRXP_PICK_矮人传家宝|r
    >>|cRXP_WARN_地下城尽头也有许多可供收集|r
    .complete 96403,1 -- Dwarven Heirloom (8)

step
    #completewith FaldrimAnvilmar
    >>击杀 |cRXP_ENEMY_被激怒的幽灵|r 和 |cRXP_ENEMY_被折磨的幽魂|r
    .complete 96394,1 -- Enraged Apparition slain (15)
    .mob +被激怒的幽灵
    .complete 96394,2 -- Tormented Soul slain (10)
    .mob +被折磨的幽魂

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鬼魅随从|r 交谈
    .accept 96395 >> 接任务：远古的宿怨
    .target 鬼魅随从

step
    #label FaldrimAnvilmar
    >>击杀 |cRXP_ENEMY_法德林·安威玛尔|r
    .complete 96395,1 -- Faldrim Anvilmar slain (1)
    .mob 法德林·安威玛尔

step
    #completewith next
    +|cRXP_WARN_返回|r |cRXP_FRIENDLY_鬼魅随从|r 处

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鬼魅随从|r 交谈
    .turnin 96395 >> 交任务：远古的宿怨
    .target 鬼魅随从

step
    >>击杀 |cRXP_ENEMY_被激怒的幽灵|r 和 |cRXP_ENEMY_被折磨的幽魂|r
    >>|cRXP_WARN_现在完成此任务，之后可能没有机会|r
    .complete 96394,1 -- Enraged Apparition slain (15)
    .mob +被激怒的幽灵
    .complete 96394,2 -- Tormented Soul slain (10)
    .mob +被折磨的幽魂

step
    #completewith ToU
    >>拾取领主大厅各处地面上的 |cRXP_PICK_矮人传家宝|r
    >>|cRXP_WARN_地下城尽头也有许多可供收集|r
    .complete 96403,1 -- Dwarven Heirloom (8)

step
    >>击杀 |cRXP_ENEMY_杜根·挽锤|r，拾取 |cRXP_LOOT_杜根·挽锤的徽记|r
    .complete 96393,1 -- Durgen Dirgehammer's Head
    .mob 杜根·挽锤

step
    #label ToU
    >>点击 |cRXP_PICK_谅解条约|r
    .accept 98423 >> 接任务：谅解条约

step
    >>拾取领主大厅各处地面上的 |cRXP_PICK_矮人传家宝|r
    .complete 96403,1 -- Dwarven Heirloom (8)

step
    .zone Ironforge >> |cRXP_WARN_离开领主大厅。最快的方法是从最终首领房间沿走廊一直向前跑|r
    .subzoneskip 16919,1

step
    .goto 1455/0,-968.200,-4803.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_汤姆·费尔奇|r 交谈
    .turnin 96403 >> 交任务：重要的传家宝
    .target 汤姆·费尔奇

step
    #completewith next
    .goto 1455/0,-1006.600,-4841.600,10,0
    .goto 1455/0,-969.700,-4841.500,10,0
    .goto 1455/0,-964.300,-4807.500,10,0
    .goto 1455/0,-993.500,-4817.600,10,0
    .goto 1455/0,-983.700,-4847.800,10,0
    .goto 1455/0,-1022.000,-4842.100,10,0
    .goto 1455/0,-994.000,-4843.100,10 >> 沿斜坡向上返回 |cRXP_FRIENDLY_阿法德拉·顿沃尔|r 处

step
    .goto 1455/0,-971.800,-4820.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿法德拉·顿沃尔|r 交谈
    .turnin 96394 >> 交任务：永不安息的亡者
    .target 阿法德拉·顿沃尔

step
    #completewith next
    .goto 1455/0,-1030.200,-4831.000,10,0
    .goto 1455/0,-1090.900,-4830.400,10,0
    .goto 1455/0,-1079.600,-4884.100,10,0
    .goto 1455/0,-1058.000,-4842.500,10 >> 沿斜坡向上前往 |cRXP_FRIENDLY_麦格尼·铜须国王|r 处

step
    .goto 1455/0,-1022.600,-4865.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦格尼·铜须国王|r 交谈
    .turnin 96393 >> 交任务：旧铁炉堡入侵
    .turnin 98423 >> 交任务：谅解条约
    .target 麦格尼·铜须国王

step << Shaman
    .goto 1455/0,-1086.500,-4642.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_埃尔德伦·风暴破坏者::258098|r 交谈
    .target 埃尔德伦·风暴破坏者::258098
    .trainer >> 学习职业技能

step << Priest/Paladin/Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托德雷·铁矿|r 交谈 << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布兰度尔·铁锤|r 交谈 << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丁克|r 交谈 << Mage
    .goto 1455/0,-928.48,-4614.620 << Mage
    .goto 1455/0,-912.88,-4625.99 << Priest
    .goto 1455/0,-896.55,-4601.68 << Paladin
    .trainer >> 学习职业技能
    .target 托德雷·铁矿 << Priest
    .target 布兰度尔·铁锤 << Paladin
    .target 丁克 << Mage

step << Warlock/Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布瑞尔索恩|r 交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_芬斯维克|r 交谈 << Rogue
    .goto 1455/0,-1117.60,-4615.14,15,0 << Warlock
    .goto 1455/0,-1111.62,-4599.09 << Warlock
    .goto 1455/0,-1120.72,-4650.120 << Rogue
    .trainer >> 学习职业技能
    .target 布瑞尔索恩 << Warlock
    .target 芬斯维克 << Rogue

step << Warlock
    .goto 1455/0,-1134.20,-4610.39,15,0
    .goto 1455/0,-1130.26,-4601.270
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_寻尸者祖贝尔|r 交谈
    .vendor >> |cRXP_BUY_购买|r |T133738:0|t[牺牲魔典（等级 1）]
    .target 寻尸者祖贝尔
    .train 20381,1

step << Warrior/Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷格努斯·雷石|r 交谈 << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比尔班·飞钳|r 交谈 << Warrior
    .goto 1455/0,-1266.02,-5006.570 << Hunter
    .goto 1455/0,-1234.65,-5035.67 << Warrior
    .trainer >> 学习职业技能
    .target 雷格努斯·雷石 << Hunter
    .target 比尔班·飞钳 << Warrior

step << Hunter/Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布里维夫·石手|r
    .train 266 >> 学习枪械 << Hunter
    .train 199 >> 学习双手锤（2h） << Druid
    .goto 1455/0,-1197.27,-5041.49
    .target 布里维夫·石手
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#subgroupdisplayname 1-20
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
--#groupid RXP-SRGCE-A1
#name 18-19 Ruins of Lordaeron
#next 19-20 Deadmines
#displayname 17-18 洛丹伦废墟 << NightElf
#displayname 18-19 洛丹伦废墟

step
    #completewith EnterRoL
    +|cRXP_WARN_接下来攻略洛丹伦废墟|r
    >>|cRXP_WARN_所有任务都在地下城内接取|r

step
    .goto 1455/0,-1152.400,-4821.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 交谈
    >>|cRXP_WARN_如果尚未解锁湿地飞行路线，请跳过这一步|r
    .fly Wetlands >> 飞往湿地
    .target 格莱斯·瑟登
    .zoneskip Ironforge,1

step
    .goto 1426/0,-826.400,-5027.100,30,0
    .goto 1426/0,-721.900,-5078.900,30,0
    .goto 1426/0,-426.500,-5181.000,70,0
    .goto 1426/0,-230.400,-5154.600,80,0
    .goto 1426/0,-65.000,-5115.000,100 >> |cRXP_WARN_离开铁炉堡，前往丹莫罗 -> 湿地的死亡跳跃位置|r
    .zoneskip Wetlands
    .zoneskip Hillsbrad Foothills
    .subzoneskip 150 -- menethil
    .subzoneskip 16611 -- ruins of lordaeron

step
    .goto 1426,30.741,34.269,15,0
    .goto 1426,30.812,33.548,15,0
    .goto 1426,31.060,32.543,15,0
    .goto 1426,31.439,32.356,15,0
    .goto 1426,31.675,29.636,15,0
    .goto 1426,32.209,28.777,15,0
    .goto 1426,32.645,27.740,15,0
    .goto 1415,44.910,52.022,15,0
    .goto 1415,44.910,52.030
    .subzone 207 >>|cRXP_WARN_爬上山，再沿锯齿状地形向下走，直到所在区域变为湿地|r
    .zoneskip Hillsbrad Foothills
    .subzoneskip 150 -- menethil
    .subzoneskip 16611 -- ruins of lordaeron

step
    .goto 1415/0,254.0285,-4708.3416,-1
    .goto 1437/0,-874.700,-3341.400,-1
    >>|cRXP_WARN_朝北或西北方向跳下山|r
    .deathskip >> 死亡后在巴拉丁海湾的 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
    .zoneskip Hillsbrad Foothills
    .subzoneskip 150 -- menethil
    .subzoneskip 16611 -- ruins of lordaeron

step
    #completewith next
    .goto 1437/0,-839.800,-3657.900
    .subzone 150 >> 游到米奈希尔港
    .zoneskip Hillsbrad Foothills
    .subzoneskip 16611 -- ruins of lordaeron

step
    .goto 1437/0,-782.000,-3793.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r 交谈
    .fp Menethil Harbor >> 开通湿地飞行路线
    .target 谢尔雷·布隆迪尔
    .zoneskip Hillsbrad Foothills
    .subzoneskip 16611 -- ruins of lordaeron

step
    .goto 1437/0,-581.800,-3722.400
    .zone Hillsbrad Foothills >> 乘船前往南海镇
    .subzoneskip 16611 -- ruins of lordaeron

step
    .goto 1424/0,-512.15,-715.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达尔拉·哈瑞斯|r 交谈
    .fp Southshore >> 开通南海镇飞行路线
    .target 达尔拉·哈瑞斯
    .subzoneskip 16611 -- ruins of lordaeron

step
    #completewith next
    .goto 1424/0,-136.700,-535.800,125 >> |cRXP_WARN_注意：前往希尔斯布莱德农场的途中，可能会遇到等级较高的 |r|cRXP_ENEMY_狮子|r|cRXP_WARN_ 和 |r|cRXP_ENEMY_熊|r
    >>|cRXP_WARN_如果你在 PVP 服务器，请留意部落玩家|r
    .zoneskip 1424,1

step
    #label EnterRoL
    .enabledungeon ROL
    .goto 1424/0,-47.400,-249.400,100,0
    .goto 1416/0,68.400,-46.200,130,0
    .goto 1416/0,45.300,257.100,150,0
    .goto 1416/0,-54.700,812.600,100,0
    .goto 1420/0,7.600,1530.500,70,0
    .goto 1420/0,-21.800,1668.600,20,0
    .goto 1420/0,-56.600,1692.000,10,0
    .goto 1420/0,-55.200,1779.600,15,0
    .goto 1420/0,6.300,1791.500,25,0
    .goto 1420/0,4.300,1847.500,10,0
    .goto 1458/0,238.400,1872.200,20,0
    .goto 1458/0,170.700,1804.700,20 >>前往幽暗城的洛丹伦废墟，进入地下城
    >>|cRXP_WARN_赶路时留意高等级的 |r|cRXP_ENEMY_狮子|r|cRXP_WARN_、|r|cRXP_ENEMY_熊|r|cRXP_WARN_、|r|cRXP_ENEMY_蜘蛛|r|cRXP_WARN_ 或 |r|cRXP_ENEMY_鱼人|r
    >>|cRXP_WARN_一进入幽暗城，你就会自动开启 PVP，可能受到|r |cRXP_ENEMY_部落|r 的攻击
    .link https://www.youtube.com/watch?v=jxmG6_JPFMc >> |cRXP_WARN_点击这里观看进入洛丹伦废墟地下城的视频指南|r

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图曼上尉|r 交谈
    .accept 95250 >> 接任务：憎恶生物
    .target 图曼上尉

step
    #sticky
    #label BaronHead
    >>击杀 |cRXP_ENEMY_男爵|r，拾取他掉落的 |cRXP_LOOT_男爵的徽记|r
    .complete 95250,1 -- Head of the Baron (1)
    .mob 男爵

step
    >>拾取所有怪物掉落的 |T133328:0|t[|cRXP_LOOT_血污徽章|r]
    .use 268535 >> |cRXP_WARN_使用|r |T133328:0|t[|cRXP_LOOT_血污徽章|r] |cRXP_WARN_开启任务|r
    .collect 268535,1,95195,1 -- Bloodied Insignia (1)
    .accept 95195 >> 接任务：血污徽章

step
    #sticky
    #label BloodiedInsignia
    >>拾取所有怪物掉落的 |cRXP_LOOT_血污徽章|r
    .complete 95195,1 -- Bloodied Insignia (10)

step
    #sticky
    #label CrestofLordaeron
    >>拾取地上或挂在墙上的 |T4504543:0|t[|cRXP_LOOT_洛丹伦纹章|r]
    >>|cRXP_WARN_仔细寻找此物品。它可能出现在多个不同位置，而且不容易看见|r
    .use 268579 >> |cRXP_WARN_使用|r |T4504543:0|t[|cRXP_LOOT_洛丹伦纹章|r] |cRXP_WARN_开启任务|r
    .collect 268579,1,95189,1 -- Crest of Lordaeron (1)
    .accept 95189 >> 接任务：洛丹伦纹章

step
    #sticky
    #label CrumpledPaper
    >>点击 |cRXP_PICK_揉皱的纸|r，它在 |cRXP_ENEMY_拉斯玛尔|r 附近的地上
    >>|cRXP_WARN_你可以击杀他之后再做这一步|r
    .accept 92415 >> 接任务：记住我爱你

step
    #requires BaronHead

step
    #requires BloodiedInsignia

step
    #requires CrestofLordaeron

step
    #requires CrumpledPaper

step
    #completewith next
    .goto 1458/0,170.700,1804.700,15 >> |cRXP_WARN_让地下城内的怪物杀死你，可以更快回到入口。墓地就在副本传送门外。|r
    >> |cRXP_WARN_不要在灵魂医者处复活！以|T132331:0|t[鬼魂]状态跑回副本传送门。|r

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图曼上尉|r 交谈
    >>|cRXP_FRIENDLY_图曼上尉|r |cRXP_WARN_在地下城入口处|r
    .turnin 95250 >> 交任务：憎恶生物
    .target 图曼上尉

step
    .hs >> 炉石回暴风城 << !NightElf
    .hs >> 炉石回铁炉堡 << NightElf
    .zoneskip Ironforge
    .zoneskip Stormwind City

step
    #optional
    .goto Ironforge,76.61,51.28,10,0
    .zone Stormwind City >> 乘地铁前往暴风城

step << NightElf
    .goto 1453/0,634.700,-8390.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沉默的舒尼|r 交谈
    .accept 2040 >> 接任务：地底突袭
    .target 沉默的舒尼

step << NightElf
    #optional
    .goto 1453/0,600.22,-8426.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_弗伦·长须|r
    .turnin 1338 >> 交任务：卡尔·雷矛的订单
    .target 弗伦·长须
    .isOnQuest 1338

step << NightElf
    .goto 1453/0,501.200,-8468.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔德·蓟草|r 交谈
    .accept 167 >> 接任务：我的兄弟……
    .accept 168 >> 接任务：收集记忆
    .target 维尔德·蓟草

step << NightElf
    #completewith next
    .goto 1453/0,437.600,-8524.5000,20,0
    .goto 1453/0,408.100,-8478.500,15,0
    .goto 1453/0,502.900,-8358.800,15 >> 前往暴风城图书馆

step << NightElf
    .isOnQuest 95189
    .goto 1453/0,531.000,-8322.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德娜·肯尼迪|r 交谈
    >>|cRXP_WARN_她会在皇家画廊小范围走动|r
    .turnin 95189 >> 交任务：洛丹伦纹章
    .target 德娜·肯尼迪

step << NightElf
    .isOnQuest 92415
    .goto 1453/0,744.400,-8621.101
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_孤儿监护员奈丁加尔|r 交谈
    .turnin 92415 >> 交任务：记住我爱你
    .accept 95161 >> 接任务：记住我爱你
    .target 孤儿监护员奈丁加尔

step << NightElf
    #optional
    .isQuestTurnedIn 92415
    .goto 1453/0,744.400,-8621.101
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_孤儿监护员奈丁加尔|r 交谈
    .accept 95161 >> 接任务：记住我爱你
    .target 孤儿监护员奈丁加尔

step << NightElf Rogue
    .goto 1453/0,377.61,-8752.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 交谈
    >> |cRXP_WARN_务必学习|T136058:0|t[开锁]，稍后的盗贼职业任务会用到。|r
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .target 夜行者奥斯伯
    .xp >20,1
    .xp <18,1

step << NightElf Rogue
    .goto 1453/0,377.61,-8752.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 交谈
    >> |cRXP_WARN_务必学习|T136058:0|t[开锁]，稍后的盗贼职业任务会用到。|r
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .xp <20,1

step << NightElf Rogue
    #completewith next
    .goto 1453/0,374.11,-8762.88,20,0
    .goto 1453/0,326.66,-8818.01,20,0
    .goto 1453/0,323.43,-8817.83,5 >> 进入军情7处总部，上楼前往 |cRXP_FRIENDLY_“剃刀”雷吉克|r 身边

step << NightElf Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_“剃刀”雷吉克|r 交谈
    .accept 2281 >> 接任务: 赤脊山的联络员
    .goto 1453/0,362.55,-8819.80
    .target “剃刀”雷吉克

step << NightElf
    .goto 1453/0,673.58,-8867.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板奥里森|r交谈
    .home >> 将你的炉石设置为暴风城
    .target 旅店老板奥里森
    .bindlocation 16509

step << NightElf
    .goto 1453/0,484.200,-8832.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fp Stormwind >> 获取暴风城飞行点
    .target 杜加尔·朗德瑞克

step << NightElf
    .isOnQuest 95195
    .goto 1453/0,521.000,-8954.101
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马库斯·乔纳森将军|r 交谈
    .turnin 95195 >> 交任务：血污徽章
    .target 马库斯·乔纳森将军

step << !NightElf
    .isOnQuest 92415
    .goto 1453/0,744.400,-8621.101
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_孤儿监护员奈丁加尔|r 交谈
    .turnin 92415 >> 交任务：记住我爱你
    .accept 95161 >> 接任务：记住我爱你
    .target 孤儿监护员奈丁加尔

step << !NightElf
    #optional
    .isQuestTurnedIn 92415
    .goto 1453/0,744.400,-8621.101
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_孤儿监护员奈丁加尔|r 交谈
    .accept 95161 >> 接任务：记住我爱你
    .target 孤儿监护员奈丁加尔

step << !NightElf
    .goto 1453/0,634.700,-8390.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沉默的舒尼|r 交谈
    .accept 2040 >> 接任务：地底突袭
    .target 沉默的舒尼

step << !NightElf
    .goto 1453/0,501.200,-8468.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔德·蓟草|r 交谈
    .accept 167 >> 接任务：我的兄弟……
    .accept 168 >> 接任务：收集记忆
    .target 维尔德·蓟草

step << !NightElf
    #completewith next
    .goto 1453/0,437.600,-8524.5000,20,0
    .goto 1453/0,408.100,-8478.500,15,0
    .goto 1453/0,502.900,-8358.800,15 >> 前往暴风城图书馆

step << !NightElf
    .isOnQuest 95189
    .goto 1453/0,531.000,-8322.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德娜·肯尼迪|r 交谈
    >>|cRXP_WARN_她会在皇家画廊小范围走动|r
    .turnin 95189 >> 交任务：洛丹伦纹章
    .target 德娜·肯尼迪

step << !NightElf
    .isOnQuest 95195
    .goto 1453/0,521.000,-8954.101
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马库斯·乔纳森将军|r 交谈
    .turnin 95195 >> 交任务：血污徽章
    .target 马库斯·乔纳森将军

step << !NightElf Rogue
    .goto 1453/0,377.61,-8752.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 交谈
    >> |cRXP_WARN_务必学习|T136058:0|t[开锁]，稍后的盗贼职业任务会用到。|r
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .target 夜行者奥斯伯
    .xp >20,1
    .xp <18,1

step << !NightElf Rogue
    .goto 1453/0,377.61,-8752.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 交谈
    >> |cRXP_WARN_务必学习|T136058:0|t[开锁]，稍后的盗贼职业任务会用到。|r
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .xp <20,1

step << !NightElf Rogue
    #completewith next
    .goto 1453/0,374.11,-8762.88,20,0
    .goto 1453/0,326.66,-8818.01,20,0
    .goto 1453/0,323.43,-8817.83,5 >> 进入军情7处总部，上楼前往 |cRXP_FRIENDLY_“剃刀”雷吉克|r 身边

step << !NightElf Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_“剃刀”雷吉克|r 交谈
    .accept 2281 >> 接任务: 赤脊山的联络员
    .goto 1453/0,362.55,-8819.80
    .target “剃刀”雷吉克

step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_武神|r 或 |cRXP_FRIENDLY_伊尔萨|r 交谈
    .goto 1453/0,358.25,-8728.28,15,0
    .goto 1453/0,302.6,-8685.53,15,0
    .goto 1453/0,323.3,-8689.29
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾
    .xp <20,1

step << Hunter
    .goto 1453/0,552.78,-8415.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_恩瑞斯·锐矛|r 交谈
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛
    .xp <20,1

step << Druid
    .goto 1453/0,1347.6192,-8591.2168
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞瑞德兰|r 交谈
    .trainer >> 学习职业技能
    .target 塞瑞德兰
    .xp <20,1

step << Warlock
    #optional
    #completewith next
    .goto 1453/0,988.44,-8942.15,20,0
    .goto 1453/0,1015.33,-8978.9,15 >> 前往已宰的羔羊旅店并下楼

step << Warlock
    .goto 1453/0,1029.89,-8971.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
    .xp <20,1

step << Mage
    #optional
    #completewith next
    .goto 1453/0,874.32,-9014.67,10 >> 前往法师塔

step << Mage
    .goto 1453/0,885.34,-9006.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾尔莎林|r 交谈
    .trainer >> 学习职业技能
    .target 艾尔莎林
    .xp <20,1

step << Priest/Paladin
    #optional
    #completewith next
    .goto 1453/0,809.52,-8579.22,20 >> 前往暴风城大教堂

step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 交谈
    .goto 1453/0,859.13,-8559.14,10,0
    .goto 1453/0,861.14,-8573.03
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
    .xp <20,1

step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔舒修士|r 交谈
    .goto 1453/0,862.89,-8519.61
    .trainer >> 学习职业技能
    .target 乔舒修士
    .xp <20,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#subgroupdisplayname 1-20
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
--#groupid RXP-SRGCE-A1
#name 19-20 Deadmines
#next 20-21 Darkshore/Ashenvale
#displayname 18-20 死亡矿井/赤脊山 << NightElf
#displayname 19-20 死亡矿井

step
    #optional
    .goto 1453/0,673.58,-8867.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板奥里森|r交谈
    .home >> 将炉石设在暴风城
    .target 旅店老板奥里森
    .bindlocation 16509

step << !NightElf !Dwarf/!Hunter
    #completewith TDB1
    .goto 1453/0,484.200,-8832.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克

step << Dwarf Hunter/NightElf
    #optional
    #completewith TDB1
    .zone Westfall >> 离开暴风城，前往西部荒野。

step
    #label TDB1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .target 格里安·斯托曼
    .goto 1436/0,1045.12,-10508.80
    .accept 65 >> 接受任务：迪菲亚兄弟会

step << !Skyborne
    #completewith RRDB
    .goto 1453/0,484.200,-8832.500,-1
    .goto 1436/0,1037.42,-10628.27,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r或|cRXP_FRIENDLY_索尔|r交谈
    .fly Redridge >> 飞往赤脊山 << !NightElf !Dwarf/!Hunter
    .fp Westfall >> 获取西部荒野飞行点 << NightElf/Dwarf Hunter
    .target 杜加尔·朗德瑞克
    .target 索尔
    .zoneskip Redridge Mountains
    .zoneskip Elwynn Forest

step
    .isQuestAvailable 132
    .goto 1433/0,-1906.400,-9606.800
    .zone Redridge Mountains >> 前往赤脊山

step << NightElf/Skyborne/Dwarf Hunter
    .goto 1433/0,-1906.400,-9606.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >> 接受任务：豺狼人的入侵
    .target 卫兵帕克

step << NightElf/Skyborne/Dwarf Hunter
    .goto 1433/0,-2237.93,-9443.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >> 交还任务：豺狼人的入侵
    .target 菲尔顿副队长

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .goto 1433/0,-2268.32,-9279.12
    .accept 125 >> 接受任务：丢失的工具
    .target 工头奥斯洛

step
    #label RRDB
    .goto 1433/0,-2164.56,-9213.10,8,0
    .goto 1433/0,-2145.67,-9231.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内楼上的|cRXP_FRIENDLY_黑衣威利|r交谈
    .turnin 65 >> 交还任务：迪菲亚兄弟会
    .accept 132 >> 接受任务：迪菲亚兄弟会
    .target 黑衣威利

step << Rogue
    .goto 1433/0,-2180.19,-9328.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2281 >> 交任务：赤脊山的联络员
    .accept 2282 >> 接任务: 奥瑟尔伐木场
    .target 卢修斯

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖恩|r交谈
    .target 肖恩
    .goto 1433/0,-2207.10,-9351.52
    .accept 3741 >> 接受任务：希拉里的项链

step
    >>|cRXP_WARN_跳入湖中|r
    >>打开|cRXP_PICK_闪光的泥浆|r，拾取|cRXP_LOOT_希拉里的项链|r
    >>|cRXP_WARN_它在湖中有多个刷新位置|r
    .goto 1433/0,-2174.32,-9386.56,0
    .goto 1433/0,-2147.41,-9308.08,0
    .goto 1433/0,-2090.96,-9373.82,0
    .goto 1433/0,-1986.76,-9324.30,0
    .goto 1433/0,-2246.40,-9359.92,0
    .goto 1433/0,-2309.57,-9376.28,0
    .goto 1433/0,-2397.70,-9363.97,0
    .goto 1433/0,-1986.76,-9324.30,70,0
    .goto 1433/0,-2397.70,-9363.97,70,0
    .complete 3741,1 --Hilary's Necklace (1)

step
    >>打开|cRXP_PICK_沉没的箱子|r，拾取|cRXP_LOOT_奥斯洛的工具箱|r
    .goto 1433/0,-2472.16,-9366.72
    .complete 125,1 --Oslow's Toolbox (1)

step << Rogue
    #completewith next
    .subzone 97 >> 前往奥瑟尔伐木场

step << Rogue
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_必须完成这一步，才能进行后续的|r |T132290:0|t[毒药]|cRXP_WARN_任务|r
    >>|cRXP_WARN_站在路点位置，调整镜头和鼠标位置，使你无需移动即可点击 3 个|cRXP_PICK_练习用保险箱|r|r
    .skill lockpicking,80 >>|cRXP_WARN_打开奥瑟尔伐木场地面上的|cRXP_PICK_练习用保险箱|r，直到你的|r |T136058:0|t[开锁]技能达到 80|r

step << Rogue
    .goto 1433/0,-2700.75,-9222.07
    >>打开 |cRXP_PICK_卢修斯的箱子|r, 获取 |cRXP_LOOT_偷窃技能证明物|r
    .complete 2282,1 --Token of Thievery
    .skill lockpicking,<80,1

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .goto 1433/0,-2268.32,-9279.12
    .turnin 125 >> 交还任务：丢失的工具
    .target 工头奥斯洛

step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .target 卢修斯
    .goto 1433/0,-2180.19,-9328.21
    .turnin 2282 >> 交任务: 奥瑟尔伐木场

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希拉里|r交谈
    .target 希拉里
    .goto 1433/0,-2205.58,-9351.52
    .turnin 3741 >> 交还任务：希拉里的项链

step << Rogue
    #optional
    #sticky
    .destroy 7907 >> 摧毁 |T134328:0|t[偷窃技能认证书]。你不再需要它。

step
    #completewith next
    .goto 1433/0,-2234.900,-9435.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fly Westfall >> 飞往西部荒野
    .target 艾蕾娜·斯托姆法瑟

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .target 格里安·斯托曼
    .goto 1436/0,1045.12,-10508.80
    .turnin 132 >> 交还任务：迪菲亚兄弟会
    .accept 135 >> 接受任务：迪菲亚兄弟会

step
    #completewith SWDB
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >> 飞往暴风城
    .target 索尔

step
    #optional
    #completewith next
    .goto 1453/0,374.11,-8762.88,20,0
    .goto 1453/0,326.66,-8818.01,20,0
    .goto 1453/0,323.43,-8817.83,10 >> 进入军情七处（SI:7）总部，上楼前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r所在处

step
    #label SWDB
    .goto 1453/0,362.28,-8815.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔|r交谈
    .turnin 135 >> 交还任务：迪菲亚兄弟会
    .accept 141 >> 接受任务：迪菲亚兄弟会
    .target 马迪亚斯·肖尔

step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔|r交谈
    .accept 2360 >> 接受任务：马迪亚斯和迪菲亚潜行者
    .goto 1453/0,362.28,-8815.23
    .target 马迪亚斯·肖尔
    .xp <20,1

step
    #ah
    .goto 1453/0,660.28,-8814.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>|cRXP_BUY_购买以下物品，以便稍后在西部荒野更快交任务：|r
    >>|cRXP_WARN_如果不想购买或无法购买，请跳过此步骤|r
    >>|T132794:0|t[灯油]
    .collect 814,5,103,1 -- Flask of Oil (5)
    .target 拍卖师亚克森

step
    #completewith EnterDM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .goto 1453/0,484.200,-8832.500
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克

step
    .goto 1436/0,1045.29,-10508.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 141 >> 交还任务：迪菲亚兄弟会
    .accept 142 >> 接受任务：迪菲亚兄弟会
    .target 格里安·斯托曼

step << Druid
    .goto Westfall,52.8,53.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    .target 旅店老板希瑟尔
    .home >> 将炉石设在西部荒野

step
    #optional
    #completewith next
    .goto 1436/0,1459.17,-11024.47,55 >> 前往月溪镇

step
    .goto 1436/0,1459.17,-11024.47
    .line Westfall,44.50,69.62,44.50,69.62,45.08,69.40,45.21,69.35,45.63,68.69,45.85,67.73,45.62,66.99,45.52,65.71,45.61,64.95,44.28,63.88,44.26,62.80,43.60,59.89,43.37,58.42,43.26,57.01,43.12,54.24,42.15,52.74,41.74,51.42,41.48,49.89,40.91,48.71,38.93,46.05,38.51,45.46,37.85,45.54,36.60,44.21,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.26,43.77,36.87,42.87,36.95,40.85,37.04,39.79,37.91,36.98,39.06,35.58,40.48,34.31,41.27,32.87,41.76,31.27,42.26,30.26,43.20,28.99,44.29,28.19,44.64,26.85,44.57,24.94,44.64,26.85,44.29,28.19,43.20,28.99,42.26,30.26,41.76,31.27,41.27,32.87,40.48,34.31,39.06,35.58,37.91,36.98,37.04,39.79,36.95,40.85,36.87,42.87,36.26,43.77,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.60,44.21,37.85,45.54,38.51,45.46,38.93,46.05,40.91,48.71,41.48,49.89,41.74,51.42,42.15,52.74,43.12,54.24,43.26,57.01,43.37,58.42,43.60,59.89,44.26,62.80,44.28,63.88,45.61,64.95,45.52,65.71,45.62,66.99,45.85,67.73,45.63,68.69,45.21,69.35,45.08,69.40,44.50,69.62
    >>击杀|cRXP_ENEMY_迪菲亚信使|r，拾取他的|cRXP_LOOT_神秘的信件|r
    >>|cRXP_ENEMY_迪菲亚信使|r|cRXP_WARN_在月溪镇刷新。他沿月溪镇北面的道路行走，前往金海岸矿洞和詹戈洛德矿洞。如果在路上没有找到他，请在月溪镇等待刷新|r
    .complete 142,1 -- A Mysterious Message (1)
    .unitscan 迪菲亚信使

step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 142 >> 交还任务：迪菲亚兄弟会
    .target 格里安·斯托曼

step
    .goto 1436/0,1067.87,-10508.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪菲亚叛徒|r交谈
    >>|cRXP_WARN_如果|r|cRXP_FRIENDLY_迪菲亚叛徒|r|cRXP_WARN_不在，可能需要等待他刷新|r
    .accept 155 >> 接受任务：迪菲亚兄弟会
    .target 迪菲亚叛徒

step
    .goto 1436/0,1527.07,-11073.23
    >>护送|cRXP_FRIENDLY_迪菲亚叛徒|r前往死亡矿井
    .complete 155,1 -- Escort The Defias Traitor to discover where VanCleef is hiding (1)
    .target 迪菲亚叛徒

step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 155 >> 交还任务：迪菲亚兄弟会
    .accept 166 >> 接受任务：迪菲亚兄弟会
    .target 格里安·斯托曼

step
    .goto 1436/0,1033.22,-10504.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|cRXP_FRIENDLY_哨兵瑞尔|r交谈
    .accept 214 >> 接受任务：红色丝质面罩
    .target 哨兵瑞尔

step
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
    >>|cRXP_WARN_组建死亡矿井队伍期间，在哨兵岭南面击杀|r|cRXP_ENEMY_豺狼人|r|cRXP_WARN_刷经验|r
    .subzone 20 >>组队完成后前往月溪镇

step
    .goto 1436/0,1527.42,-11072.77
    .subzone 1581 >> 与队友一起进入迪菲亚藏身处

step
    #completewith EnterDM
    >>击杀|cRXP_ENEMY_迪菲亚成员|r，拾取他们的|cRXP_LOOT_红色丝质面罩|r
    >>|cRXP_WARN_也可以在死亡矿井内完成此任务|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214

step
    #completewith next
    >>击杀|cRXP_ENEMY_骷髅矿工|r、|cRXP_ENEMY_亡灵爆破者|r和|cRXP_ENEMY_亡灵挖掘者|r，拾取他们的|cRXP_LOOT_矿业工会会员卡|r
    >>|cRXP_WARN_注意：此任务没有其他地下城任务那样的额外经验奖励，完成耗时也明显更长。如果队友同意，可以考虑跳过|r
    >>|cRXP_WARN_此任务在地下城外完成|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob 骷髅矿工
    .mob 亡灵爆破者
    .mob 亡灵挖掘者

step
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_工头希斯耐特|r，拾取|cRXP_LOOT_希斯耐特的徽章|r
    >>|cRXP_WARN_此任务在地下城外完成|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan 工头希斯耐特

step
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_骷髅矿工|r、|cRXP_ENEMY_亡灵爆破者|r和|cRXP_ENEMY_亡灵挖掘者|r，拾取他们的|cRXP_LOOT_矿业工会会员卡|r
    >>|cRXP_WARN_注意：此任务没有其他地下城任务那样的额外经验奖励，完成耗时也明显更长。如果队友同意，可以考虑跳过|r
    >>|cRXP_WARN_此任务在地下城外完成|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob 骷髅矿工
    .mob 亡灵爆破者
    .mob 亡灵挖掘者

step
    #label EnterDM
    .enabledungeon DM
    .goto 1415,40.94,79.76,25,0
    .goto 1415,40.86,79.62,20,0
    .goto 1415,40.678,79.578
    .subzone 1581,2 >> 进入死亡矿井地下城

step
    #completewith DMend
    >>击杀死亡矿井内的|cRXP_ENEMY_迪菲亚成员|r，拾取他们的|cRXP_LOOT_红色丝质面罩|r
    .complete 214,1 -- Red Silk Bandana (10)

step
    >>击杀|cRXP_ENEMY_斯尼德|r，拾取|cRXP_LOOT_小型高能发动机|r
    .complete 2040,1 -- Gnoam Sprecklesprocket (1)

step
    #label DMend
    >>击杀|cRXP_ENEMY_艾德温·范克里夫|r，拾取|cRXP_LOOT_范克里夫的头颅|r和|T133471:0|t[|cRXP_LOOT_未寄出的信|r]
    >>|cRXP_WARN_使用|T133471:0|t[|r|cRXP_LOOT_未寄出的信|r|cRXP_WARN_]开始任务|r
    .collect 2874,1,373 -- An Unsent Letter (1)
    .complete 166,1 -- Head of VanCleef (1)
    .accept 373 >> 接受任务：未寄出的信
    .use 2874 -- An Unsent Letter

step
    #completewith next
    .goto 1436/0,1966.32,-11407.13,40 >> 前往西部荒野灯塔

step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .accept 104 >> 接受任务：海岸上的威胁
    .accept 103 >> 接受任务：长明的灯塔
    .turnin 103 >> 交还任务：长明的灯塔
    .target 葛瑞森船长
    .itemcount 814,5 -- Flask of Oil (5)

step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .accept 104 >> 接受任务：海岸上的威胁
    .target 葛瑞森船长

step
    .goto 1436/0,1811.62,-11358.37
    .line Westfall,34.43,83.93,34.43,83.93,33.88,83.32,33.08,82.86,32.56,82.71,32.08,82.49,31.91,82.36,31.55,81.88,30.86,81.42,30.63,81.16,30.33,80.81,30.02,80.11,29.68,79.22,29.32,78.19,29.29,77.60,29.27,77.31,29.18,76.26,29.07,75.29,28.95,74.14,28.85,73.29,28.79,72.48,28.37,71.94,27.84,71.29,27.44,70.25,27.29,69.47,27.13,68.65,27.09,67.57,27.07,67.01,26.74,66.09,27.07,67.01,27.09,67.57,27.13,68.65,27.29,69.47,27.44,70.25,27.84,71.29,28.37,71.94,28.79,72.48,28.85,73.29,28.95,74.14,29.07,75.29,29.18,76.26,29.27,77.31,29.29,77.60,29.32,78.19,29.68,79.22,30.02,80.11,30.33,80.81,30.63,81.16,30.86,81.42,31.55,81.88,31.91,82.36,32.08,82.49,32.56,82.71,33.08,82.86,33.88,83.32,34.43,83.93
    >>击杀|cRXP_ENEMY_老瞎眼|r，拾取|cRXP_LOOT_老瞎眼的鳞片|r
    .complete 104,1 -- Scale of Old Murk-Eye (1)
    .unitscan 老瞎眼

step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .turnin 104 >> 交还任务：海岸上的威胁
    .target 葛瑞森船长
    .isQuestComplete 104

step << Druid
    .goto 1436/0,1707.2116,-10583.0227
    >>点击地上的|cRXP_PICK_焦焚残骸|r
    .accept 79008 >> 接受任务：……以及你找到的那张字条

step << Druid
    #completewith next
    .goto Westfall,17.928,33.099,50 >> 向外海游去

step << Druid
    .goto Westfall,17.928,33.099
    >>打开|cRXP_PICK_奇怪的保险箱|r，拾取|cRXP_LOOT_水兽耐力坠饰|r
    .collect 15882,1,272,1 --Collect Half Pendant of Aquatic Endurance (x1)

step << !Druid
    .goto 1436/0,1707.2116,-10583.0227
    >>点击地上的|cRXP_PICK_焦焚残骸|r
    .accept 79008 >> 接受任务：……以及你找到的那张字条

step
    #completewith RSB
    .goto 1436/0,1045.12,-10508.80,100 >> 前往哨兵岭

step
    .isQuestComplete 166
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 166 >> 交还任务：迪菲亚兄弟会
    .target 格里安·斯托曼
    .goto 1436/0,1045.12,-10508.80

step
    #label RSB
    .isQuestComplete 214
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|cRXP_FRIENDLY_哨兵瑞尔|r交谈
    .turnin 214 >> 交还任务：红色丝质面罩
    .goto 1436/0,1033.22,-10504.83
    .target 哨兵瑞尔

step
    .maxlevel 19,Level20Check

step
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Redridge >> 飞往赤脊山
    .target 索尔

step
    .goto 1433/0,-1906.400,-9606.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >> 接受任务：豺狼人的入侵
    .target 卫兵帕克

step
    .goto 1433/0,-2237.93,-9443.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >> 交还任务：豺狼人的入侵
    .accept 246 >> 接受任务：审时度势
    .accept 98407 >>接受任务：武力展示
    .target 菲尔顿副队长

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .goto 1433/0,-2298.06,-9284.04
    .accept 20 >> 接受任务：黑石氏族的威胁
    .accept 98387 >>接受任务：黑石封锁线
    .target 治安官马瑞斯

step
    .group
    .goto 1433/0,-2208.600,-9243.500
    >>点击|cRXP_PICK_通缉告示|r
    .accept 95999 >>接受任务：通缉：焚化者加里姆

step
    #loop
    .goto 1433/0,-1913.800,-9490.601,50,0
    .goto 1433/0,-2211.01,-9773.870,45,0
    .goto 1433/0,-2276.79,-9759.11,45,0
    .goto 1433/0,-2508.20,-9620.68,45,0
    .goto 1433/0,-2246.61,-9764.90,45,0
    >>击杀|cRXP_ENEMY_混血赤脊山豺狼人|r和|cRXP_ENEMY_赤脊山偷猎者|r
    >>击杀|cRXP_ENEMY_赤脊山鞭笞者|r，拾取他们的|cRXP_LOOT_尖刺项圈|r
    .complete 246,1 --Redridge Mongrel (10)
    .mob +混血赤脊山豺狼人
    .complete 246,2 --Redridge Poacher (6)
    .mob +赤脊山偷猎者
    .complete 98407,1 --Spiked Collar (5)
    .mob +赤脊山鞭笞者

step
    .group 4
    .isOnQuest 95999
    #sticky
    #label IncineratorGarim
    .waypoint 1433/0,-3261.400,-9824.700
    >>击杀洞内的|cRXP_ENEMY_焚化者加里姆|r，拾取|cRXP_LOOT_焚化者加里姆的断裂法杖|r
    >>|cRXP_WARN_如果无法组队对付他，请跳过此步骤|r
    .complete 95999,1 -- Broken Staff of Incinerator Gar'im (1)
    .mob 焚化者加里姆

step
    #completewith next
    >>拾取地上的|cRXP_PICK_装谷物的袋子|r和|cRXP_PICK_肉块|r，获得|cRXP_LOOT_黑石补给品|r
    >>拾取地上的|cRXP_PICK_武器架|r和|cRXP_PICK_散落的武器|r
    .complete 98387,1 -- Stolen Supplies (10)
    .complete 98387,2 -- Stolen Weapon (8)

step
    #label orcs
    #loop
    >>击杀|cRXP_ENEMY_黑石步兵|r和|cRXP_ENEMY_黑石前锋|r，拾取他们的|cRXP_LOOT_破斧|r
    >>|cRXP_WARN_注意，|r|cRXP_ENEMY_黑石前锋|r|cRXP_WARN_会对你施放|T132149:0|t[投网]|r
    .goto 1433/0,-3177.25,-9718.85,60,0
    .goto 1433/0,-3224.57,-9782.42,60,0
    .goto 1433/0,-3259.74,-9566.82,60,0
    .goto 1433/0,-3092.80,-9694.82,60,0
    .goto 1433/0,-3177.25,-9718.85,60,0
    .complete 20,1 --Battleworn Axe (10)
    .mob 黑石步兵
    .mob 黑石前锋

step
    #loop
    .goto 1433/0,-3177.25,-9718.85,60,0
    .goto 1433/0,-3224.57,-9782.42,60,0
    .goto 1433/0,-3259.74,-9566.82,60,0
    .goto 1433/0,-3092.80,-9694.82,60,0
    .goto 1433/0,-3177.25,-9718.85,60,0
    >>拾取地上的|cRXP_PICK_装谷物的袋子|r和|cRXP_PICK_肉块|r，获得|cRXP_LOOT_黑石补给品|r
    >>拾取地上的|cRXP_PICK_武器架|r和|cRXP_PICK_散落的武器|r
    .complete 98387,1 -- Stolen Supplies (10)
    .complete 98387,2 -- Stolen Weapon (8)

step
    #requires IncineratorGarim

step << Shaman -- most likely not on this quest yet
    #optional
    .isOnQuest 94499
    .goto 1433/0,-3121.100,-9485.000
    .use 265747 >> |cRXP_WARN_在石堡瀑布使用|r |T132829:0|t[空的红色水囊] |cRXP_WARN_装水|r
    .complete 94499,1 --|1/1 Full Red Waterskin

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .target 菲尔顿副队长
    .goto 1433/0,-2237.93,-9443.60
    .turnin 246 >> 交还任务：审时度势
    .turnin 98407 >>交还任务：武力展示

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .target 治安官马瑞斯
    .goto 1433/0,-2298.06,-9284.04
    .turnin 20 >> 交还任务：黑石氏族的威胁
    .turnin 98387 >>交还任务：黑石封锁线

step
    .isQuestComplete 95999
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_所罗门镇长|r交谈
    .target 所罗门镇长
    .goto 1433/0,-2207.10,-9231.34,15,0
    .goto 1433/0,-2221.65,-9218.60
    .turnin 95999 >>交还任务：通缉：焚化者加里姆

step
    #optional
    .xp 20 >> 刷怪升到20级

step
    #label Level20Check

step << !Druid !Rogue
    .hs >> 使用炉石返回暴风城
    .cooldown item,6948,>2,1
    .zoneskip Stormwind City
    .zoneskip Darkshore

step
    #optional
    #completewith DarkshoreBoat
    .goto 1433/0,-2234.900,-9435.300,-1
    .goto 1436/0,1037.42,-10628.27,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r或|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >> 飞往暴风城
    .target 艾蕾娜·斯托姆法瑟
    .target 索尔
    .zoneskip Stormwind City
    .zoneskip Darkshore

step << Rogue
    .isNotOnQuest 2360
    .goto 1453/0,377.47,-8752.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯伯|r交谈
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .train 1785,1
    .xp <20,1
    .xp >22,1

step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔|r交谈
    .accept 2360 >> 接受任务：马迪亚斯和迪菲亚潜行者
    .goto 1453/0,362.28,-8815.23
    .target 马迪亚斯·肖尔

step << Rogue
    #completewith RoguePoison
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .goto 1453/0,484.200,-8832.500
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克

step << !Dwarf Rogue
    .goto 1431/0,404.03,-11014.47,60,0
    .goto 1431/0,432.11,-10878.75,50,0
    .goto 1431/0,551.72,-10688.13
    >>击杀|cRXP_ENEMY_小型结网毒蜘蛛|r和|cRXP_ENEMY_结网毒蜘蛛|r，拾取一个|cRXP_LOOT_小毒囊|r及它们的|cRXP_LOOT_粘糊的蜘蛛腿|r
    >>|cRXP_WARN_你需要一个|r|cRXP_LOOT_小毒囊|r|cRXP_WARN_来制作|r |T134437:0|t[抗毒药剂] |cRXP_WARN_，稍后用来移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_负面效果|r
    >>|cRXP_WARN_保留|r|cRXP_LOOT_粘糊的蜘蛛腿|r|cRXP_WARN_，稍后会用到|r
    >>|cRXP_WARN_如果你有|r |T626003:0|t|cFFF48CBA圣骑士|r|cRXP_WARN_、|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_或|r |T626006:0|t|cFF0070DD萨满祭司|r |cRXP_WARN_朋友，可以跳过此步骤，请他们帮你移除负面效果|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob 小型结网毒蜘蛛
    .mob 结网毒蜘蛛
    .itemcount 6452,<1 --Anti Venom (<1)

step << Rogue
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==请留意接下来的部分==|r
    >>|cRXP_WARN_按Esc键，然后进入：选项→控制|r
    >>|cRXP_WARN_勾选“启用交互按键”，并为“与目标互动”设置快捷键|r
    >>|cRXP_WARN_此外，建议开启敌方姓名板（默认按键：V），以便看到塔内部分拐角后面的敌人|r

step << Rogue
    #label RoguePoison
    .goto 1436/0,619.17,-11035.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密探吉尔妮|r交谈
    >>|cRXP_WARN_必须完成此任务才能学习|r |T132290:0|t[毒药]
    .turnin 2360 >> 交还任务：马迪亚斯和迪菲亚潜行者
    .accept 2359 >> 接受任务：克拉文之塔
    .target 密探吉尔妮

step << Rogue
    #label TowerKey
    #loop
    .goto 1436/0,514.52,-11114.77,0
    .goto 1436/0,531.32,-11166.80,0
    .goto 1436/0,581.37,-11104.97,0
    .goto 1436/0,514.52,-11114.77,30,0
    .goto 1436/0,531.32,-11166.80,30,0
    .goto 1436/0,581.37,-11104.97,30,0
    >>使用|T133644:0|t[搜索]偷取|cRXP_ENEMY_丑陋的迪菲亚懒汉|r的|cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    >>|cRXP_ENEMY_丑陋的迪菲亚懒汉|r|cRXP_WARN_在塔楼入口刷新，然后在塔外巡逻|r
    >>|cRXP_WARN_小心，他的伤害非常高。如果你的|r |T132320:0|t[潜行] |cRXP_WARN_被打破，请立刻使用|r |T132307:0|t[疾跑] |cRXP_WARN_逃走|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频攻略
    .mob 丑陋的迪菲亚懒汉

step << Rogue
    #optional
    #completewith Mortwake
    +|cRXP_WARN_如果尚未装备|r |T135641:0|t[曲木匕首] |cRXP_WARN_或其他|r |T135641:0|t[匕首] |cRXP_WARN_，请在此任务中装备曲木匕首|r
    .use 15396
    .itemcount 15396,1

step << Rogue
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_登上塔楼倒数第2层。在|r |T132320:0|t[潜行] |cRXP_WARN_状态下，趁|r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_不在身旁时，先跳上椅子，再跳到灯上，最后跳到路标位置上方的书架顶端|r
    >>|cRXP_WARN_手动取消|r |T132320:0|t[潜行]|cRXP_WARN_，然后按“与目标互动”快捷键打开|r|cRXP_PICK_暮色森林的箱子|r|cRXP_WARN_，拾取|r |cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_注意：你的|r |T132320:0|t[潜行] |cRXP_WARN_会在拾取|r |cRXP_LOOT_克拉文·摩特维克的日记|r后暂时失效
    >>|cRXP_WARN_如果没有击杀第2层的|r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_，请做好逃跑的准备。站在书架顶端这个可规避攻击的位置时，他们很可能持续对你保持仇恨，但不会攻击你|r
    >>|cRXP_WARN_如果背包中有或已装备|r |T135641:0|t[匕首] |cRXP_WARN_，可以使用|r |T132282:0|t[伏击] |cRXP_WARN_瞬间击杀塔内的|r|cRXP_ENEMY_迪菲亚巡塔员|r|cRXP_WARN_和|r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_。击杀第一个|r|cRXP_ENEMY_迪菲亚哨兵|r|cRXP_WARN_后要做好逃跑准备，记住楼上的敌人也能攻击到你。此方法较慢，但安全得多|r
    >>|cRXP_WARN_如果必须跑出塔楼，请小心，|r|cRXP_ENEMY_丑陋的迪菲亚懒汉|r|cRXP_WARN_和|r|cRXP_ENEMY_迪菲亚苦工|r|cRXP_WARN_可能就在入口处|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频攻略
    .mob 迪菲亚巡塔员
    .mob 迪菲亚哨兵

step << !Dwarf Rogue
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >> 制作一份|T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained

step << !Dwarf Rogue
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包里的|T134437:0|t[抗毒药剂]移除|T136230:0|t[赞吉尔之触]负面效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)

step << Dwarf Rogue
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放|T136225:0|t[石像形态]移除|T136230:0|t[赞吉尔之触]负面效果|r
    .aura -9991

step << Rogue
    .hs >> 使用炉石返回暴风城
    .cooldown item,6948,>2,1
    .zoneskip Stormwind City
    .zoneskip Darkshore

step << Rogue
    #optional
    #completewith KlavenEnd
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >> 飞往暴风城
    .target 索尔
    .zoneskip Stormwind City

step << !Dwarf Rogue
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >> 前往|cRXP_FRIENDLY_珊娜·弗勒|r所在处
    .aura -9991

step << !Dwarf Rogue
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>|cRXP_WARN_如果你有|r |T626003:0|t|cFFF48CBA圣骑士|r|cRXP_WARN_、|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_或|r |T626006:0|t|cFF0070DD萨满祭司|r |cRXP_WARN_朋友，请他们帮你移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_即可|r
    .skill firstaid,80 >> |cRXP_WARN_将|r |T135966:0|t[急救] |cRXP_WARN_练到80点|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)

step << !Dwarf Rogue
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>|cRXP_WARN_如果你有|r |T626003:0|t|cFFF48CBA圣骑士|r|cRXP_WARN_、|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_或|r |T626006:0|t|cFF0070DD萨满祭司|r |cRXP_WARN_朋友，请他们帮你移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_即可|r
    .train 7934 >> |cRXP_WARN_学习制作|r |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)

step << !Dwarf Rogue
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >> 制作一份|T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained

step << !Dwarf Rogue
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包里的|T134437:0|t[抗毒药剂]移除|T136230:0|t[赞吉尔之触]负面效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)

step << Rogue
    .goto 1453/0,377.47,-8752.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯伯|r交谈
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .train 1785,1
    .xp <20,1
    .xp >22,1

step << Rogue
    .goto 1453/0,377.47,-8752.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯伯|r交谈
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .train 1759,1
    .xp <22,1
    .xp >24,1

step << Rogue
    #optional
    #requires AntiVenomEnd2 << Rogue
    #completewith next
    .goto 1453/0,374.11,-8762.88,20,0
    .goto 1453/0,326.66,-8818.01,20,0
    .goto 1453/0,323.43,-8817.83,10 >> 进入军情七处（SI:7）总部，上楼前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r所在处

step << Rogue
    #label KlavenEnd
    #requires AntiVenomEnd2 << Rogue
    .goto 1453/0,362.28,-8815.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔|r交谈
    >>|cRXP_WARN_如果之前换上了|r |T135641:0|t[匕首] |cRXP_WARN_，记得重新装备主用武器|r << Rogue
    .turnin 2359 >> 交还任务：克拉文之塔
    .target 马迪亚斯·肖尔

step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_武神|r或|cRXP_FRIENDLY_伊尔萨|r交谈
    .goto 1453/0,358.25,-8728.28,15,0
    .goto 1453/0,302.6,-8685.53,15,0
    .goto 1453/0,323.3,-8689.29
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾

step
    .isQuestComplete 167
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔德·蓟草|r交谈
    .turnin 167 >> 交还任务：我的兄弟……
    .goto 1453/0,501.200,-8468.601
    .target 维尔德·蓟草

step
    .isQuestComplete 168
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔德·蓟草|r交谈
    .turnin 168 >> 交还任务：收集记忆
    .goto 1453/0,501.200,-8468.601
    .target 维尔德·蓟草

step << Hunter
    .goto 1453/0,552.78,-8415.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛

step << Hunter
    .goto 1453/0,553.22,-8422.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡瑞娜·麦肯达|r交谈
    .trainer >> 学习宠物技能
    .target 卡瑞娜·麦肯达

step
    .isQuestComplete 2040
    .goto 1453/0,634.800,-8390.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沉默的舒尼|r交谈
    .turnin 2040 >> 交还任务：地底突袭
    .target 沉默的舒尼

step << Shaman
    #completewith ShamTrain
    .goto 1453/0,558.96,-8382.54,25,0
    .goto 1453/0,520.64,-8351.460
    .zone Ironforge >> 进入矿道地铁，乘地铁前往铁炉堡

step << Shaman
    .goto 1455/0,-1086.500,-4642.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃尔德伦·风暴破坏者::258098|r交谈
    .target 埃尔德伦·风暴破坏者::258098
    .accept 94494 >>接受任务：水之召唤
    .trainer >> 学习职业技能
    .train 2645 -- ghost wolf

step << Shaman
    #label ShamTrain
    .goto 1455/0,-1086.500,-4642.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃尔德伦·风暴破坏者::258098|r交谈
    .target 埃尔德伦·风暴破坏者::258098
    .trainer >> 学习职业技能
    .train 408342,1 -- fire nova r2
    .xp <22,1

step << Shaman
    .goto 1455/0,-1330.28,-4843.6,5,0
    .zone Stormwind City >> 进入矿道地铁，乘地铁前往暴风城
    .zoneskip Darkshore
    .zoneskip Ashenvale

step
    .goto 1453/0,719.67,-8550.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r交谈
    .turnin 373 >>交还任务：未寄出的信
    .accept 389 >>接受任务：巴吉尔·特雷德
    .target 巴隆斯·阿历克斯顿

step << Warlock
    #optional
    #completewith next
    .goto 1453/0,988.44,-8942.15,20,0
    .goto 1453/0,1015.33,-8978.9,15 >> 前往已宰的羔羊，下楼进入地下室

step << Warlock
    .goto 1453/0,1029.89,-8971.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林

step << Warlock
    .goto 1453/0,1041.54,-8983.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .accept 1716 >> 接受任务：噬魂者
    .target 黑暗缚灵者加科因

step << Mage
    #optional
    #completewith next
    .goto 1453/0,874.32,-9014.67,10 >> 前往法师塔

step << Mage
    .goto 1453/0,885.34,-9006.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .trainer >> 学习职业技能
    .target 艾尔莎林

step << Priest/Paladin
    #optional
    #completewith next
    .goto 1453/0,809.52,-8579.22,20 >> 前往暴风城大教堂

step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .goto 1453/0,859.13,-8559.14,10,0
    .goto 1453/0,861.14,-8573.03
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟

step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒修士|r交谈
    .goto 1453/0,862.89,-8519.61
    .trainer >> 学习职业技能
    .target 乔舒修士

step
    .goto 1453/0,1093.3,-8779.020
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿古斯·夜语|r交谈
    .accept 3765 >> 接受任务：遥远的旅途
    .target 阿古斯·夜语

step << !Druid
    #optional
    .goto 1453/0,1330.100,-8645.400
    >>|cRXP_WARN_等待前往黑海岸的船时，可按需提升|r |T135966:0|t[急救] |cRXP_WARN_技能|r
    .zone Darkshore >> 乘船前往黑海岸
    .skill firstaid,<1,1 -- shows if firstaid is >1

step << !Druid
    #label DarkshoreBoat
    .goto 1453/0,1330.100,-8645.400
    .zone Darkshore >> 乘船前往黑海岸

step
    #optional
    .abandon 95999 >>放弃任务：通缉：焚化者加里姆
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#subgroupdisplayname 1-20
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
--#groupid RXP-SRGCE-A1
#name 20-21 Darkshore/Ashenvale
#next RestedXP Forever Dungeon Guide (A)\21-23 Ashenvale/Stonetalon
#displayname 20-21 黑海岸/灰谷

step << Druid
    #completewith catspirit1
    .cast 18960 >> 施放传送：月光林地

step << Druid
    #completewith next
    .goto 1450/1,-2400.33,7795.33--c:Moonglade,44.148,45.229
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔瓦·菲纳雯斯|r交谈
    .fly Teldrassil >> 飞往鲁瑟兰村
    .skipgossip
    .timer 153,鲁瑟兰村
    .target 希尔瓦·菲纳雯斯
    .zoneskip Darnassus
    .zoneskip Teldrassil

step << NightElf !Druid
    #hidewindow
    #optional
    #completewith next
    .goto 1438/1,965.80,8780.95
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯

step << Druid
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯

step << Druid
    #label catspirit1
    .goto 1457/1,2564.600,10179.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者::4217|r交谈
    .target 玛斯雷·驭熊者::4217
    .accept 98393 >>接受任务：巨豹之灵

step << Druid
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .zoneskip Moonglade

step << Druid
    .goto 1450/1,-2678.900,8020.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰::11802|r交谈
    .target 德迪利特·星焰::11802
    .turnin 98393 >>交任务：巨豹之灵
    .accept 98341 >>接受任务：驭风巨豹之灵 << Skyborne
    .accept 98394 >>接受任务：巨豹之灵 << !Skyborne

step << Druid !Skyborne
    .goto 1450/1,-2640.000,7338.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨豹之灵|r交谈
    .turnin 98394 >>交任务：巨豹之灵
    .accept 98396 >>接受任务：巨豹之灵
    .target 巨豹之灵

step << Druid Skyborne
    .goto 1450/1,-2352.700,7375.600,10,0
    .goto 1450/1,-2394.300,7361.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞利楠的化身::272054|r交谈
    .target 塞利楠的化身::272054
    .turnin 98341 >>交任务：驭风巨豹之灵
    .accept 98404 >>接受任务：驭风巨豹之灵

step << Druid
    #completewith next
    .goto 1450/1,-3046.700,7534.400
    --aura 1309054?
    .subzone 2363 >> 前往怒风兽穴

step << Druid
    >>深入洞穴，过桥后在凹室内找到猎豹雕像，点击雕像旁的小球
    >>拾取|cRXP_LOOT_利爪圣物|r
    .goto 1450/1,-3117.400,7455.300
    .complete 98404,2 << Skyborne --|1/1 Relic of the Claw
    .complete 98396,2 << !Skyborne --|1/1 Relic of the Claw

step << Druid
    >>点击猎豹雕像旁的小球
    >>拾取|cRXP_LOOT_静影圣物|r
    .goto 1450/1,-3099.200,7485.700
    .complete 98404,3  << Skyborne --|1/1 Relic of the Silent Shadow
    .complete 98396,3  << !Skyborne --|1/1 Relic of the Silent Shadow

step << Druid
    >>点击猎豹雕像旁的小球
    >>拾取|cRXP_LOOT_尖牙圣物|r
    .goto 1450/1,-3054.100,7476.800
    .complete 98404,1  << Skyborne --|1/1 Relic of the Fang
    .complete 98396,1  << !Skyborne --|1/1 Relic of the Fang

step << Druid !Skyborne
    .goto 1450/1,-2640.000,7338.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨豹之灵|r交谈
    .turnin 98396 >>交任务：巨豹之灵
    .accept 98731 >>接受任务：巨豹之灵的祝福
    .target 巨豹之灵

step << Druid Skyborne
    .goto 1450/1,-2395.400,7361.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞利楠的化身::272054|r交谈
    .target 塞利楠的化身::272054
    .turnin 98404 >>交任务：驭风巨豹之灵
    .accept 98738 >>接受任务：驭风巨豹之灵的祝福

step << Druid
    .goto 1450/1,-2678.200,8021.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t传送到月光林地，与|cRXP_FRIENDLY_德迪利特·星焰::11802|r交谈
    .target 德迪利特·星焰::11802
    .usespell 18960
    .turnin 98731 >>交任务：巨豹之灵的祝福 << !Skyborne
    .turnin 98738 >>交任务：驭风巨豹之灵的祝福 << Skyborne
    .accept 98397 >>接受任务：前往达纳苏斯 --<< Alliance
    --.accept 98362 >>Accept To Thunder Bluff << Horde

step << Druid
    #completewith catspirit2
    .goto 1450/1,-2400.33,7795.33--c:Moonglade,44.148,45.229
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔瓦·菲纳雯斯|r交谈
    .fly Teldrassil >> 飞往鲁瑟兰村
    .skipgossip
    .timer 153,鲁瑟兰村
    .target 希尔瓦·菲纳雯斯
    .zoneskip Darnassus
    .zoneskip Teldrassil

step << Druid
    #completewith next
    .goto 1450/1,-2400.33,7795.33--c:Moonglade,44.148,45.229
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔瓦·菲纳雯斯|r交谈
    .fly Teldrassil >> 飞往鲁瑟兰村
    .skipgossip
    .timer 153,鲁瑟兰村
    .target 希尔瓦·菲纳雯斯
    .zoneskip Darnassus
    .zoneskip Teldrassil

step << Druid
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯

step << Druid
    #label catspirit2
    .goto 1457/1,2564.400,10179.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者::4217|r交谈
    .target 玛斯雷·驭熊者::4217
    .turnin 98397 >>交任务：前往达纳苏斯

step << Druid
    .goto 1457/1,2626.51,9946.11
    .zone Teldrassil >> 穿过紫色传送门前往鲁瑟兰村
    .zoneskip Darkshore

step << Druid
    .goto 1438/1,841.56,8640.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >> 飞往黑海岸
    .target 维斯派塔斯
    .zoneskip Darkshore

step
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >> 接受任务：洞中的蘑菇
    .target 巴瑞萨斯·月影

step
    #optional
    .isOnQuest 4763
    .goto 1439/1,467.08,6409.38
    >>|cRXP_WARN_使用|r |T133748:0|t[空的净化碗]|cRXP_WARN_在奥伯丁月亮井取水|r
    .collect 12347,1,4763,1 --Filled Cleansing Bowl (1)
    .use 12346

step
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >> 接受任务：健忘的勘察员
    .target 考古学家霍莉

step
    .isQuestTurnedIn 4762
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .accept 4763 >> 接受任务：黑木熊怪的堕落
    .target 桑迪斯·织风

step
    .isOnQuest 3765
    .goto 1439,38.325,43.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈沙拉·夜语|r交谈
    .turnin 3765 >> 交任务：遥远的旅途
    .target 戈沙拉·夜语

step
    .dungeon BFD
    .goto 1439,38.325,43.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈沙拉·夜语|r交谈
    .accept 1275 >> 接受任务：研究堕落
    .target 戈沙拉·夜语

step
    .isQuestTurnedIn 2138
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2139 >> 接受任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树

step
    .goto 1439,39.043,43.555
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与|cRXP_FRIENDLY_哨兵艾莉萨·星风|r交谈
    .accept 965 >> 接受任务：奥萨拉克斯之塔
    .target 哨兵艾莉萨·星风

step
    .isOnQuest 4763
    .goto 1439/1,467.08,6409.38
    >>|cRXP_WARN_使用|r |T133748:0|t[空的净化碗]|cRXP_WARN_在奥伯丁月亮井取水|r
    .collect 12347,1,4763,1 --Filled Cleansing Bowl (1)
    .use 12346

step
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 957 >> 交任务：巴莎兰
    .isOnQuest 957
    .target 阿斯特利安

step
    .isOnQuest 4763
    #sticky
    #label Blackwood1
    #completewith Xabraxxis
    .goto 1439/1,-489.22,6875.30,0
    .goto 1439/1,-376.56,6807.62
    >>打开|cRXP_PICK_黑木谷物|r，拾取其中的|T134059:0|t|cRXP_LOOT_[黑木谷物]|r
    >>|cRXP_WARN_拾取后会出现2只|r|cRXP_ENEMY_黑木熊怪|r|cRXP_WARN_，它们会立即向你冲来。准备好应战，或脱战让它们重置|r
    >>|cRXP_WARN_如果看到|r|cRXP_ENEMY_萨巴克希斯|r|cRXP_WARN_在聊天中喊话，或有人正在与他战斗，就去帮忙。打开他掉在地上的|r|cRXP_PICK_萨巴克希斯的恶魔之包|r|cRXP_WARN_，拾取其中的|r |cRXP_LOOT_堕落护符|r
    .collect 12342,1,4763,1 -- Blackwood Grain Stores (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)

step
    .isOnQuest 2139
    .goto 1439/1,-503.63,6732.95,45,0
    .goto 1439/1,-430.27,6662.65
    >>击杀|cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_蓟熊幼崽|r|cRXP_WARN_会施放|r |T132152:0|t[毁灭]|cRXP_WARN_，这是会使你昏迷2秒的近战瞬发攻击|r
    .complete 2139,1 --Den Mother (1)
    .mob 雌蓟熊

step
    .isOnQuest 4763
    #sticky
    #requires Blackwood1
    #label Blackwood2
    #completewith Xabraxxis
    .goto 1439/1,-489.22,6875.30,0
    .goto 1439/1,-453.20,6870.500
    >>打开|cRXP_PICK_黑木坚果|r，拾取其中的|T133944:0|t|cRXP_LOOT_[黑木坚果]|r
    >>|cRXP_WARN_拾取后会出现2只|r|cRXP_ENEMY_黑木熊怪|r|cRXP_WARN_，它们会立即向你冲来。准备好应战，或脱战让它们重置|r
    >>|cRXP_WARN_如果看到|r|cRXP_ENEMY_萨巴克希斯|r|cRXP_WARN_在聊天中喊话，或有人正在与他战斗，就去帮忙。打开他掉在地上的|r|cRXP_PICK_萨巴克希斯的恶魔之包|r|cRXP_WARN_，拾取其中的|r |cRXP_LOOT_堕落护符|r
    .collect 12343,1,4763,1 -- Blackwood Nut Sample (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)

step
    .isOnQuest 4763
    #sticky
    #requires Blackwood2
    #label Blackwood3
    #completewith Xabraxxis
    .goto 1439/1,-489.22,6875.30,0
    .goto 1439/1,-520.66,6874.43
    >>打开|cRXP_PICK_黑木水果|r，拾取其中的|T134013:0|t|cRXP_LOOT_[黑木水果]|r
    >>|cRXP_WARN_拾取后会出现2只|r|cRXP_ENEMY_黑木熊怪|r|cRXP_WARN_，它们会立即向你冲来。准备好应战，或脱战让它们重置|r
    >>|cRXP_WARN_如果看到|r|cRXP_ENEMY_萨巴克希斯|r|cRXP_WARN_在聊天中喊话，或有人正在与他战斗，就去帮忙。打开他掉在地上的|r|cRXP_PICK_萨巴克希斯的恶魔之包|r|cRXP_WARN_，拾取其中的|r |cRXP_LOOT_堕落护符|r
    .collect 12341,1,4763,1 -- Blackwood Fruit Sample (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)

step
    .isOnQuest 4763
    #optional
    #requires Blackwood3
    #completewith Xabraxxis
    .goto 1439/1,-489.22,6875.30
    .cast 16072 >> |cRXP_WARN_使用|r |T134712:0|t[装满水的净化碗]|cRXP_WARN_，在|r|cRXP_PICK_篝火|r|cRXP_WARN_旁召唤|r |cRXP_ENEMY_萨巴克希斯|r
    .timer 17,黑木熊怪的堕落剧情
    .use 12347

step
    .isOnQuest 4763
    #requires Blackwood3
    #label Xabraxxis
    .goto 1439/1,-489.22,6875.30
    >>击杀|cRXP_ENEMY_萨巴克希斯|r，打开他掉在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r，拾取其中的|cRXP_LOOT_堕落护符|r
    .use 12347
    .complete 4763,1 -- Talisman of Corruption (1)
    .mob 萨巴克希斯

step
    .goto 1439/1,-690.31,6751.29,12,0
    .goto 1439/1,-706.68,6748.23,12,0
    .goto 1439/1,-719.13,6787.530,12,0
    >>拾取地上的|cRXP_LOOT_粗柄蘑菇|r和一朵|cRXP_LOOT_毒帽蘑菇|r
    >>|cRXP_WARN_沿洞穴上层走。如果上层尽头没有|r|cRXP_LOOT_毒帽蘑菇|r|cRXP_WARN_，就跳到下层南边的洞室拾取|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_雷鳞御浪者|r|cRXP_WARN_会施放|r |T135836:0|t[水流喷射]|cRXP_WARN_（远程瞬发：对附近敌人造成伤害并将其击退）。注意站位，避免被击落到洞穴下层|r
    .complete 947,1 --Scaber Stalk (5)
    .goto 1439/1,-663.45,6877.49,8,0
    .goto 1439/1,-679.17,6848.67,8,0
    .goto 1439/1,-666.73,6819.41,8,0
    .goto 1439/1,-680.48,6779.67,8,0
    .goto 1439/1,-663.45,6877.49,8,0
    .goto 1439/1,-679.17,6848.67,8,0
    .goto 1439/1,-666.73,6819.41,8,0
    .goto 1439/1,-680.48,6779.67,8,0
    .goto 1439/1,-663.45,6877.49
    .complete 947,2 --Death Cap (1)
    .goto 1439/1,-685.72,6746.49

step
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 965 >> 交任务：奥萨拉克斯之塔
    .accept 966 >> 接受任务：奥萨拉克斯之塔
    .target 巴苏尔·影击

step
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
    >>击杀|cRXP_ENEMY_暗滩狂热者|r，拾取它们掉落的|cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob 暗滩狂热者

step
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 966 >> 交任务：奥萨拉克斯之塔
    .accept 967 >> 接受任务：奥萨拉克斯之塔
    .target 巴苏尔·影击

step
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .accept 2098 >> 接受任务：基尔卡克的钥匙
    .target 基尔卡克·旋杆

step
    #optional
    #completewith next
    .goto 1439/1,-732.88,7596.24,0
    >>击杀|cRXP_ENEMY_狂暴暗礁蟹|r和|cRXP_ENEMY_硬壳潮行蟹|r，拾取它们掉落的|cRXP_LOOT_基尔卡克钥匙的尾部|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_狂暴暗礁蟹|r|cRXP_WARN_的|r |T132152:0|t[痛击]|cRXP_WARN_技能，它们的近战攻击可能瞬间造成200点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key (1)
    .mob 狂暴暗礁蟹
    .mob 硬壳潮行蟹

step
    .goto 1439/1,-656.25,7801.04
    >>击杀|cRXP_ENEMY_灰雾智者|r和|cRXP_ENEMY_灰雾潮行者|r，拾取它们掉落的|cRXP_LOOT_基尔卡克钥匙的中部|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_灰雾智者|r|cRXP_WARN_的|r |T136048:0|t[闪电箭]|cRXP_WARN_伤害，它们还会用|r |T136052:0|t[治疗波]治疗
    >>小心|cRXP_ENEMY_灰雾潮行者|r会在近战时施放|T136016:0|t[|cRXP_FRIENDLY_毒药|r]，使你每3秒受到13点持续伤害，持续30秒
    >>|cRXP_WARN_你可以绕着沉船卡|r|cRXP_ENEMY_灰雾智者|r|cRXP_WARN_的视野，躲避它们的|r |T136048:0|t[闪电箭]|cRXP_WARN_伤害|r
    .complete 2098,2 -- Middle of Gelkak's Key (1)
    .mob 灰雾潮行者
    .mob 灰雾智者

step
    .goto 1439/1,-699.48,7591.87,45,0
    .goto 1439/1,-579.61,7505.41,45,0
    .goto 1439/1,-421.10,7372.67,45,0
    .goto 1439/1,-767.60,7805.84
    >>击杀|cRXP_ENEMY_狂暴暗礁蟹|r和|cRXP_ENEMY_硬壳潮行蟹|r，拾取它们掉落的|cRXP_LOOT_基尔卡克钥匙的尾部|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_狂暴暗礁蟹|r|cRXP_WARN_的|r |T132152:0|t[痛击]|cRXP_WARN_技能，它们的近战攻击可能瞬间造成200点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key (1)
    .mob 狂暴暗礁蟹
    .mob 硬壳潮行蟹

step
    #sticky
    #label foreststriders
    .goto 1439/1,-941.83,7756.06,55,0
    .goto 1439/1,-1080.03,7922.87,50,0
    .goto 1439/1,-1087.24,7780.51,50,0
    .goto 1439/1,-1069.55,7661.74,50,0
    .goto 1439/1,-1080.03,7922.870
    >>击杀|cRXP_ENEMY_凶猛的森林陆行鸟|r，拾取它们掉落的|cRXP_LOOT_基尔卡克钥匙的头部|r
    .complete 2098,1 -- Top of Gelkak's Key (1)
    .mob 凶猛的森林陆行鸟

step << Warrior/Paladin/Rogue/Shaman
    #requires foreststriders
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    >>|cRXP_WARN_开始寻找队伍完成基尔卡克的报复／|r|cRXP_ENEMY_机械打手4100型|r << Warrior/Paladin/Rogue/Shaman
    .turnin 2098 >> 交任务：基尔卡克的钥匙
    .accept 2078 >> 接受任务：基尔卡克的报复
    .target 基尔卡克·旋杆
    .solo

step
    #requires foreststriders
    .group 2 << Warrior/Paladin/Rogue/Shaman
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    >>|cRXP_WARN_开始寻找队伍完成基尔卡克的报复／|r|cRXP_ENEMY_机械打手4100型|r << Warrior/Paladin/Rogue/Shaman
    .turnin 2098 >> 交任务：基尔卡克的钥匙
    .accept 2078 >> 接受任务：基尔卡克的报复
    .target 基尔卡克·旋杆

step
    #optional
    #completewith next
    .goto 1439,55.802,18.290
    .gossipoption 95406 >> 与|cRXP_FRIENDLY_机械打手4100型|r交谈，开始护送
    --  .gossipoption 87696 >> Talk to |cRXP_FRIENDLY_The Threshwackonator 4100|r to start the escort
    >>|cRXP_WARN_这个任务非常困难|r
    .target 机械打手4100型
    .isOnQuest 2078 << Warrior/Paladin/Rogue/Shaman

step
    .goto 1439,56.654,13.484
    #optional
    >>护送|cRXP_FRIENDLY_机械打手4100型|r前往|cRXP_FRIENDLY_基尔卡克·旋杆|r处
    >>|cRXP_ENEMY_机械打手4100型|r变为敌对后将其击杀
    >>|cRXP_WARN_这个任务非常困难|r
    *逃跑时只使用远程攻击，避免进入它的近战范围 << Druid
    >>|cRXP_WARN_尽量完成这个任务，其奖励的|r |T134797:0|t[水下呼吸饮剂]|cRXP_WARN_能为后续的水下任务节省时间|r << !Druid !Warlock !Shaman
    >>|cRXP_WARN_在它变为敌对时施放|r |T136100:0|t[纠缠根须]|cRXP_WARN_，然后拉开距离，用瞬发法术风筝它|r << Druid
    >>|cRXP_WARN_如果无法击杀|r|cRXP_ENEMY_机械打手4100型|r|cRXP_WARN_，就跳过这一步|r
    .complete 2078,1 --Gyromast's Revenge (1)
    .link https://youtu.be/1WRRmKYBr9s >> |cRXP_WARN_点击此处观看视频攻略|r
    .mob 机械打手4100型
    .isOnQuest 2078 << Warrior/Paladin/Rogue/Shaman
    --XX DRUID: Test if you can root

step
    #optional << Warrior/Paladin/Rogue/Shaman
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .turnin 2078 >> 交任务：基尔卡克的报复
    .target 基尔卡克·旋杆
    .isQuestComplete 2078

step
    .isQuestTurnedIn 4681
    .goto 1439,53.113,18.099
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4727 >> 接受任务：搁浅的海龟

step << Druid
    .goto Darkshore,48.87,11.32
    >>|cRXP_WARN_游到外面的水中|r
    >>打开|cRXP_PICK_奇怪的保险箱|r，拾取其中的|cRXP_LOOT_水兽敏捷坠饰|r
    .collect 15883,1,272,1 --Collect Half Pendant of Aquatic Agility (x1)

step << Druid
    #completewith next
    .cast 18960 >> 施放传送：月光林地

step << Druid
    .goto Moonglade,52.53,40.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔

step << Druid
    .goto 1450/1,-2212.25,7854.28
    .use 15883 >>|cRXP_WARN_在雷姆洛斯神殿使用|r |T133443:0|t[水兽敏捷坠饰] |cRXP_WARN_，将它与|r |T133442:0|t[水兽耐力坠饰] |cRXP_WARN_合并|r
    .complete 272,1 --Collect Pendant of the Sea Lion (x1)

step << Druid
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    >>|cRXP_WARN_这样可以节省跑回去的时间|r

step << Druid
    .goto 1450/1,-2678.74,8020.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 272 >> 交还任务：海狮试炼
    .accept 5061 >> 接受任务：水栖形态
    .target 德迪利特·星焰

step << Druid
    #completewith next
    .goto 1450/1,-2400.33,7795.33--c:Moonglade,44.148,45.229
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔瓦·菲纳雯斯|r交谈
    .fly Teldrassil >> 飞往鲁瑟兰村
    .skipgossip
    .timer 153,鲁瑟兰村
    .target 希尔瓦·菲纳雯斯
    .zoneskip Darnassus
    .zoneskip Teldrassil

step << Druid
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯

step << Druid
    .goto 1457/1,2564.400,10179.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 5061 >> 交任务：水栖形态
    .target 玛斯雷·驭熊者

step << Druid
    .goto 1457/1,2626.51,9946.11
    .zone Teldrassil >> 穿过紫色传送门前往鲁瑟兰村
    .zoneskip Darkshore

step << Druid
    .goto 1438/1,841.56,8640.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >> 飞往黑海岸
    .target 维斯派塔斯
    .zoneskip Darkshore

step << Druid
    .isOnQuest 272
    #completewith next
    .cast 18960 >> 施放传送：月光林地

step << Druid
    .isOnQuest 272
    .goto Moonglade,52.53,40.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔

step << Druid
    .goto 1450/1,-2212.25,7854.28
    .use 15883 >>|cRXP_WARN_使用|r |T133443:0|t[水兽敏捷坠饰] |cRXP_WARN_将其与|r |T133442:0|t[水兽耐力坠饰] |cRXP_WARN_在雷姆洛斯神殿合并|r
    .complete 272,1 --Collect Pendant of the Sea Lion (x1)

step << Druid
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    >>|cRXP_WARN_可节省往返时间|r

step << Druid
    .goto 1450/1,-2678.74,8020.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德迪利特·星焰|r 交谈
    .turnin 272 >> 交任务：海狮试炼
    .accept 5061 >> 接任务：水栖形态
    .target 德迪利特·星焰

step << Druid
    .isOnQuest 5061
    .goto 1450/1,-2489.25,7457.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_辛德拉尔|r 交谈
    .target 辛德拉尔
    .fly Darkshore >> 飞往黑海岸
    .zoneskip Darkshore

step
    #sticky
    #optional
    .destroy 7442 >> 从背包中摧毁|T134459:0|t[基尔卡克的钥匙]，之后不再需要它

step
    #completewith ReturnAuberdine
    .subzone 442 >> 返回奥伯丁

step
    .isQuestComplete 2139
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2139 >> 交任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树

step
    .isQuestComplete 4763
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4763 >> 交任务：黑木熊怪的堕落
    .target 桑迪斯·织风

step
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .turnin 947 >> 交任务：洞中的蘑菇
    .accept 948 >> 接受任务：安努
    .target 巴瑞萨斯·月影

step
    .goto 1439/1,504.41,6402.39
    >>点击|cRXP_PICK_通缉告示|r
    .accept 4740 >> 接受任务：通缉：莫克迪普！

step
    #label ReturnAuberdine
    .isOnQuest 4727
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4727 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛

step
    .goto 1439,35.968,70.807
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4728 >> 接受任务：搁浅的海洋生物
    .isQuestTurnedIn 4681

step
    .goto 1439,35.429,76.566,0
    .goto 1439,35.429,76.566,60,0
    .goto 1439/1,541.75,4991.52
    >>|cRXP_WARN_先检查|r|cRXP_ENEMY_莫克迪普|r|cRXP_WARN_是否已在水中刷新（若之前有人挑战失败，或没有杀死与他同时出现的|r|cRXP_ENEMY_灰雾猎人|r|cRXP_WARN_，他可能已经在水里）|r
    >>击杀营地里的|cRXP_ENEMY_灰雾战士|r和|cRXP_ENEMY_灰雾猎人|r
    >>|cRXP_WARN_走到营地中央的篝火处，开始|r|cRXP_ENEMY_莫克迪普|r|cRXP_WARN_的战斗：|r
    >>|cRXP_WARN_敌人会分3波从水中出现，消灭前一波后才会出现下一波：第1波是3只12-13级的|r|cRXP_ENEMY_灰雾滩行者|r|cRXP_WARN_，第2波是2只15-16级的|r|cRXP_ENEMY_灰雾战士|r|cRXP_WARN_，第3波是19级的|r|cRXP_ENEMY_莫克迪普|r|cRXP_WARN_和一只16-17级的|r|cRXP_ENEMY_灰雾猎人|r|cRXP_WARN_。你可以远离篝火，避免引到下一波敌人|r
    .complete 4740,1 -- Murkdeep (1)
    .unitscan 莫克迪普
    .mob 灰雾战士
    .mob 灰雾猎人
    .mob 灰雾滩行者

step
    #label Onu
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 948 >> 交任务：安努
    .accept 944 >> 接受任务：主宰之剑
    .target 安努

step
    #label MasterG
    .goto 1439/1,417.30,4575.82,100 >> 前往主宰之剑
    .subzoneskip 449
    .isOnQuest 944

step
    #optional
    #completewith FunandGames
    >>击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，拾取它们掉落的|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心|r|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会施放|r |T132343:0|t[缴械]|cRXP_WARN_，使你无法使用武器，持续6秒|r << Rogue/Paladin/Warrior/Shaman
    *|cRXP_WARN_小心|r|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_以及施法时间为3秒的|r |T135915:0|t[治疗术]
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .mob 暮光信徒
    .mob 暮光暴徒

step
    #optional
    .goto 1439/1,390.700,4542.700
    >>探索主宰之剑
    .complete 944,1 --Enter the Master's Glaive (1)

step
    #optional
    #completewith next
    .cast 5809 >> |cRXP_WARN_使用|r |T134715:0|t[占卜之水]|cRXP_WARN_，将其放在地上|r
    .use 5251

step
    .goto 1439/1,417.30,4575.82
    >>|cRXP_WARN_点击地上的|r|cRXP_PICK_占卜之碗|r
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接受任务：暮光之锤的营地
    .use 5251

step
    #label FunandGames
    .goto 1439,38.537,86.050
    >>点击北边台座上的|cRXP_PICK_暮光之书|r
    .turnin 949 >> 交任务：暮光之锤的营地
    .accept 950 >> 接受任务：向安努回复
    .accept 98042 >>接受任务：开玩笑也要有个限度……

step
    #completewith TheryluneEnd
    >>击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，拾取它们掉落的|cRXP_LOOT_无双之眼|r和|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心|r|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会施放|r |T132343:0|t[缴械]|cRXP_WARN_，使你无法使用武器，持续6秒|r << Rogue/Paladin/Warrior/Shaman
    *|cRXP_WARN_小心|r|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_以及施法时间为3秒的|r |T135915:0|t[治疗术]
    .complete 98042,1 -- Peerless Eye (1)
    .mob +暮光信徒
    .mob +暮光暴徒
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .disablecheckbox

step
    .goto 1439,38.660,87.305
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟瑞露尼|r交谈，开始护送
    >>|cRXP_WARN_如果她不在，就跳过这一步|r
    .accept 945 >> 接受任务：护送瑟瑞露尼
    .target 瑟瑞露尼

step
    #label TheryluneEnd
    .goto 1439/1,288.26,4530.40
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_瑟瑞露尼|r|cRXP_WARN_离开主宰之剑|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .isOnQuest 945

step
    #loop
    .goto 1439/1,376.800,4608.600,40,0
    .goto 1439/1,453.100,4580.200,40,0
    .goto 1439/1,409.4366,4521.0151,40,0
    >>击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，拾取它们掉落的|cRXP_LOOT_无双之眼|r和|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心|r|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会施放|r |T132343:0|t[缴械]|cRXP_WARN_，使你无法使用武器，持续6秒|r << Rogue/Paladin/Warrior/Shaman
    *|cRXP_WARN_小心|r|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_以及施法时间为3秒的|r |T135915:0|t[治疗术]
    .complete 98042,1 -- Peerless Eye (1)
    .mob +暮光信徒
    .mob +暮光暴徒
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .disablecheckbox

step
    #optional
    #sticky
    .isQuestTurnedIn 949
    .destroy 5251 >> 从背包中摧毁|T134715:0|t[占卜之水]，之后不再需要它

step
    #sticky
    #label prospector
    .goto 1439,35.724,83.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    >>|cRXP_WARN_你可能需要等待他刷新，或等其他人完成护送|r
    .turnin 729 >> 交任务：健忘的勘察员
    .target 勘察员雷姆塔维尔

step
    .goto 1439/1,602.01,4678.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈，开始护送
    .accept 731,1 >> 接受任务：健忘的勘察员
    .target 勘察员雷姆塔维尔

step
    #requires prospector
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_勘察员雷姆塔维尔|r|cRXP_WARN_穿过挖掘场|r
    .complete 731,1
    .isOnQuest 731

step
    .isQuestTurnedIn 4681
    .goto 1439,32.644,80.711
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接受任务：搁浅的海洋生物

step
    .isQuestTurnedIn 4681
    .goto 1439,31.690,83.700
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_灰雾智者|r|cRXP_WARN_的|r |T136048:0|t[闪电箭]|cRXP_WARN_伤害，它们还会用|r |T136052:0|t[治疗波]治疗
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4731 >> 接受任务：搁浅的海龟

step
    .isQuestTurnedIn 4681
    .goto 1439,31.229,85.564
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_灰雾智者|r|cRXP_WARN_的|r |T136048:0|t[闪电箭]|cRXP_WARN_伤害，它们还会用|r |T136052:0|t[治疗波]治疗
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4732 >> 接受任务：搁浅的海龟

step
    .isQuestTurnedIn 4681
    .goto 1439,31.251,87.419
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >> 接受任务：搁浅的海洋生物
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_灰雾智者|r|cRXP_WARN_的|r |T136048:0|t[闪电箭]|cRXP_WARN_伤害，它们还会用|r |T136052:0|t[治疗波]治疗

step
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >> 交任务：向安努回复
    .timer 11,向安努回复剧情
    .target 安努

step
    #optional
    >>|cRXP_WARN_使用|T133743:0|t[|r|cRXP_LOOT_《深渊之神》|r|cRXP_WARN_]接受任务|r
    .accept 968 >> 接受任务：深渊之神
    .use 5352
    .itemcount 5352,1

step
    #optional
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈，开始护送
    >>|cRXP_WARN_如果他不在，就跳过这一步。他最多可能需要25分钟才会刷新|r
    >>|cRXP_WARN_这是限时任务，你必须在20分钟内护送他找到他的背包|r
    .accept 5321 >> 接受任务：昏昏欲睡
    .target 克罗尼亚·恒影
    .isQuestTurnedIn 731 --Only shows if Prospector was already escorted

step
    #optional
    .isOnQuest 5321
    .goto 1439/1,34.78,5001.570
    >>打开|cRXP_PICK_克罗尼亚的箱子|r，拾取其中的|T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
    .isQuestTurnedIn 731 --Only shows if Prospector was already escorted

step
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈，开始护送
    >>|cRXP_WARN_如果他不在，就跳过这一步。他最多可能需要25分钟才会刷新|r
    >>|cRXP_WARN_这是限时任务，你必须在20分钟内护送他找到他的背包|r
    .accept 5321 >> 接受任务：昏昏欲睡
    .target 克罗尼亚·恒影
    .itemcount 13536,<1 --Horn of Awakening

step
    .isOnQuest 5321
    .goto 1439/1,34.78,5001.570
    >>打开|cRXP_PICK_克罗尼亚的箱子|r，拾取其中的|T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
    .itemcount 13536,<1 --Horn of Awakening

step
    #label Kerlonian
    .goto 1439/1,206.400,4402.500
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_克罗尼亚|r|cRXP_WARN_找到他|r|cRXP_WARN_在黑海岸的背包|r
    .use 13536 >> |cRXP_WARN_每当他睡着时，使用|r |T134229:0|t[|cRXP_LOOT_唤醒号角|r]。|cRXP_WARN_使用时要站在|r|cRXP_FRIENDLY_克罗尼亚|r|cRXP_WARN_身边|r
    >>|cRXP_WARN_尽量避开大路，只有走在路上才会刷出敌人|r
    .complete 5321,2
    .isOnQuest 5321

step
    #optional
    .abandon 2138 >> 放弃任务：清除疫病
    .abandon 1002 >> 放弃任务：传声盒323号

step
    #completewith tower
    .zone Ashenvale >> 向南前往灰谷
    .goto 1440/1,-12.70,4150.17

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利拉迪斯·月河|r交谈
    .target 利拉迪斯·月河
    .goto 1440/1,128.01,3305.31
    .turnin 5321 >> 交任务：昏昏欲睡
    .isQuestComplete 5321

step
    #label tower
    .goto 1440/1,189.71,3185.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 967 >> 交任务：奥萨拉克斯之塔
    .accept 970 >> 接受任务：奥萨拉克斯之塔
    .target 净化者德尔格伦

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .target 奥雷迪尔·阔叶
    .goto 1440/1,175.87,3189.61
    .accept 1010 >> 接受任务：巴斯兰的头发
    .xp <20,1

step
    .goto 1440/1,-102.08,3492.890
    >>击杀|cRXP_ENEMY_暗滩祭司|r和|cRXP_ENEMY_暗滩精兵|r，拾取它们掉落的|cRXP_LOOT_发光的灵魂宝石|r
    .complete 970,1
    .mob 暗滩祭司
    .mob 暗滩精兵

step
    .goto 1440/1,-102.08,3492.890
    .xp 20-1650 >>继续击杀|cRXP_ENEMY_暗滩怪物|r，直到距离20级还差1650经验值
    .mob 暗滩祭司
    .mob 暗滩精兵
    .mob 暗滩执行者
    .mob 暗滩挖掘者

step
    #optional
    .goto 1440/1,-203.58,3849.97,50,0
    .goto 1440/1,-2.90,3737.73,40,0
    .goto 1440/1,-138.99,3806.92
    >>打开地上的|cRXP_PICK_草药|r，拾取其中的|cRXP_LOOT_巴斯兰的头发|r
    >>|cRXP_WARN_它们看起来像棕色小袋子，有些半埋在土里，可能不太容易发现|r
    >>|cRXP_WARN_开启|r |T134916:0|t[寻找草药]|cRXP_WARN_，即可在小地图上看到它们|r
    .complete 1010,1 --Bathran's Hair (5)
    .isOnQuest 1010
    .skill herbalism,<1,1

step
    #optional
    .goto 1440/1,-203.58,3849.97,50,0
    .goto 1440/1,-2.90,3737.73,40,0
    .goto 1440/1,-138.99,3806.92
    >>打开地上的|cRXP_PICK_草药|r，拾取其中的|cRXP_LOOT_巴斯兰的头发|r
    >>|cRXP_WARN_它们看起来像棕色小袋子，有些半埋在土里，可能不太容易发现|r
    .complete 1010,1 --Bathran's Hair (5)
    .isOnQuest 1010
    .skill herbalism,1,1

step
    #optional
    .goto 1440/1,175.87,3189.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .turnin 1010 >> 交任务：巴斯兰的头发
    .accept 1020 >> 接受任务：奥雷迪尔的药剂
    .target 奥雷迪尔·阔叶
    .isQuestComplete 1010

step
    #optional
    .goto 1440/1,175.87,3189.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .accept 1020 >> 接受任务：奥雷迪尔的药剂
    .target 奥雷迪尔·阔叶
    .isQuestTurnedIn 1010

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .target 净化者德尔格伦
    .goto 1440/1,189.71,3185.77
    .turnin 970 >> 交任务：奥萨拉克斯之塔
    .accept 973 >> 接受任务：奥萨拉克斯之塔

step
    #optional
    .goto 1440/1,-138.99,3806.92
    .xp 20 >> 刷怪升到20级

step
    .goto 1440/1,175.87,3189.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .accept 1010 >> 接受任务：巴斯兰的头发
    .target 奥雷迪尔·阔叶

step
    #optional
    .goto 1440/1,-203.58,3849.97,50,0
    .goto 1440/1,-2.90,3737.73,40,0
    .goto 1440/1,-138.99,3806.92
    >>打开地上的|cRXP_PICK_草药|r，拾取其中的|cRXP_LOOT_巴斯兰的头发|r
    >>|cRXP_WARN_它们看起来像棕色小袋子，有些半埋在土里，可能不太容易发现|r
    >>|cRXP_WARN_开启|r |T134916:0|t[寻找草药]|cRXP_WARN_，即可在小地图上看到它们|r
    .complete 1010,1 --Bathran's Hair (5)
    .skill herbalism,<1,1

step
    .goto 1440/1,-203.58,3849.97,50,0
    .goto 1440/1,-2.90,3737.73,40,0
    .goto 1440/1,-138.99,3806.92
    >>打开地上的|cRXP_PICK_草药|r，拾取其中的|cRXP_LOOT_巴斯兰的头发|r
    >>|cRXP_WARN_它们看起来像棕色小袋子，有些半埋在土里，可能不太容易发现|r
    .complete 1010,1 --Bathran's Hair (5)
    .skill herbalism,1,1

step
    .goto 1440/1,175.87,3189.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .turnin 1010 >> 交任务：巴斯兰的头发
    .accept 1020 >> 接受任务：奥雷迪尔的药剂
    .target 奥雷迪尔·阔叶

step
    #optional
    #completewith TZS
    .subzone 415 >> 前往阿斯特兰纳

step
    #label AshenvaleEnd
    .goto 1440/1,-283.73,2827.920
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黛琳希亚|r交谈
    .fp Astranaar >> 开通阿斯特兰纳的飞行路线
    .target 黛琳希亚

step
    #label TZS
    .goto 1440/1,-299.30,2796.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛德瑞尔·速火|r交谈
    .accept 1008 >> 接受任务：佐拉姆海岸
    .target 辛德瑞尔·速火

step
    .goto 1440/1,-311.99,2759.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵塞恩希尔|r交谈
    .accept 1070 >> 接受任务：守卫石爪山
    .target 哨兵塞恩希尔

step
    .goto 1440/1,-362.16,2785.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法德瑞斯·戈森沙尔|r交谈
    .accept 1056 >> 接受任务：石爪峰之旅
    .target 法德瑞斯·戈森沙尔

step
    .goto 1440/1,-411.18,2767.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
    .accept 991 >> 接受任务：莱恩的净化
    .accept 1054 >> 接受任务：解除威胁
    .target 莱恩·狼行者

step
    .goto 1440/1,-433.09,2781.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板基姆利雅|r交谈
    .home >> 将炉石绑定在阿斯特兰纳
    .target 旅店老板基姆利雅

step
    .goto 1440/1,-454.43,2682.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
    .target 皮尔图拉斯·怀特姆恩
    .turnin 1020 >> 交任务：奥雷迪尔的药剂
    .timer 24,奥雷迪尔的药剂剧情
    .accept 1033 >> 接受任务：月神之泪
]])