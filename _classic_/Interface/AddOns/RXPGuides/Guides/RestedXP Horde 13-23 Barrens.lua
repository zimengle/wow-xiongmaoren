local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Horde Warrior/Horde Shaman
#name 13-22 贫瘠之地
#displayname 13-22 贫瘠之地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 部落 1-30
#defaultfor Shaman/Warrior
#next 22-25 希尔斯布莱德 / 南贫瘠之地；22-25 希尔斯布莱德丘陵 JJ

step << Tauren Shaman
    .goto Durotar,50.8,43.6
.target Takrin Pathseeker
>>与|cRXP_FRIENDLY_塔克林·寻路者|r交谈
    .accept 840 >>接任务: |cRXP_LOOT_部落的新兵|r
step << Tauren Shaman
    .isOnQuest 1525
    .goto Durotar,52.8,28.7,25 >>进入此处的洞穴
step << Tauren Shaman
    >>击杀火刃祭司以获取钱袋
    .goto Durotar,52.5,26.7
    .complete 1525,2 --Reagent Pouch (1)
step << Tauren Shaman
    .isOnQuest 1525
    .goto Durotar,52.8,28.7,20 >>离开洞穴
step << Tauren Shaman
    .goto The Barrens,62.2,19.4
>>与|cRXP_FRIENDLY_卡加尔·战痕|r交谈
    .turnin 840 >>交任务: |cRXP_FRIENDLY_部落的新兵|r
.target Kargal Battlescar
    .accept 842 >>接任务: |cRXP_LOOT_十字路口征兵|r
step << !Tauren
#xprate >1.499
    .goto The Barrens,52.2,31.8
.target Tonga Runetotem
>>与|cRXP_FRIENDLY_图加·符文图腾|r谈话
    .accept 870 >>接任务: |cRXP_LOOT_遗忘之池|r
step << !Tauren
#xprate >1.499
    #completewith next
    .goto The Barrens,52.3,32.0
    .vendor >>根据需要购买尽可能多的6槽背包
step << !Tauren
#xprate >1.499
    .goto The Barrens,52.2,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 842 >>交任务: |cRXP_FRIENDLY_十字路口征兵|r
.target Sergra Darkthorn
    .accept 844 >>接任务: |cRXP_LOOT_平原陆行鸟的威胁|r
step << Orc/Troll
#xprate >1.499
    .goto The Barrens,52.5,29.8
.target Zargh
>>与|cRXP_FRIENDLY_扎尔夫|r交谈
    .accept 6365 >>接任务: |cRXP_LOOT_送往奥格瑞玛的肉|r
step << !Tauren
#xprate >1.499
    .goto The Barrens,51.9,30.3
.target Gazrog
>>与 |cRXP_FRIENDLY_加兹罗格|r交谈
    .accept 869 >>接任务: |cRXP_LOOT_偷钱的迅猛龙|r
step << !Tauren
#xprate >1.499
    .goto The Barrens,51.5,30.8
.target Thork
>>与|cRXP_FRIENDLY_索克|r交谈
    .accept 871 >>接任务: |cRXP_LOOT_野猪人的袭击|r
    .accept 5041 >>接任务: |cRXP_LOOT_十字路口的补给品|r
step << !Tauren
#xprate >1.499
    .goto The Barrens,51.5,30.4
    .fp >>获取十字路口飞行路径
step << Orc/Troll
#xprate >1.499
    >>不要飞行前往奥格瑞玛
.goto The Barrens,51.5,30.3
>>与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .turnin 6365 >>交任务: |cRXP_FRIENDLY_送往奥格瑞玛的肉|r
.target Devrak
    .accept 6384 >>接任务: |cRXP_LOOT_飞往奥格瑞玛|r
step << !Tauren
#xprate >1.499
.goto The Barrens,51.5,30.1
.target Apothecary Helbrim
>>与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    .accept 1492 >>接任务: |cRXP_LOOT_码头管理员迪兹维格|r
        .accept 848 >>接任务: |cRXP_LOOT_菌类孢子|r
step << Warrior
    .isOnQuest 1502
    .goto The Barrens,57.9,25.5,30 >>爬上这座山
step << Warrior
    >>前往山顶
    .goto The Barrens,57.2,30.3
>>与|cRXP_FRIENDLY_索恩格瑞姆·火眼|r交谈
    .turnin 1502 >>交任务: |cRXP_FRIENDLY_索恩格瑞姆·火眼|r
.target Thun'grim Firegaze
    .accept 1503 >>接任务: |cRXP_LOOT_锻造好的钢锭|r
step << Warrior
    #sticky
    #completewith next
    .goto The Barrens,55.6,26.6
    >>击杀该区域内的刺猪
    .complete 871,2 --Razormane Thornweaver (8)
    .complete 871,1 --Razormane Water Seeker (8)
    .complete 871,3 --Razormane Hunter (3)
step << Warrior
    #label Steel
    >>从灰色箱子里获取锻造好的钢锭
    .goto The Barrens,55.0,26.7
    .complete 1503,1 --Forged Steel Bars (1)
step << Warrior
    #sticky
    #completewith next
    #requires Steel
    >>途中击杀一些平原陆行鸟, 搜刮它们以获取尖喙 << !Tauren
    .complete 844,1 << !Tauren --Plainstrider Beak (7)
    .goto The Barrens,54.7,28.0,20 >>爬上这座山
step << Warrior
    #requires Steel
.goto The Barrens,57.2,30.3
.target Thun'grim Firegaze
>>与|cRXP_FRIENDLY_索恩格瑞姆·火眼|r交谈
    .turnin 1503 >>交任务: |cRXP_FRIENDLY_锻造好的钢锭|r
step << Shaman
    #sticky
    >>击杀剃刀人并掠夺火焰焦油
    .complete 1525,1 --Fire Tar (1)
step
    #sticky
    #completewith next
    >>前往此地寻找陈的空酒桶, 拾取后即可触发任务；否则稍后会自动获得
    .goto The Barrens,55.7,27.3,15,0
    .collect 4926,1,819,1 --Collect Chen's Empty Keg
    .accept 819 >>接任务: |cRXP_LOOT_老陈的空酒桶|r
    .use 4926
--Add invisible automatic waypoint so user doesnt have to manually click it if it isnt there
step
    .goto The Barrens,55.6,26.6
    >>击杀该区域内的刺猪
    .complete 871,2 --Razormane Thornweaver (8)
    .complete 871,1 --Razormane Water Seeker (8)
    .complete 871,3 --Razormane Hunter (3)
step << !Tauren
    #completewith next
    .goto The Barrens,62.4,20.0
    .cooldown item,4986,<5m >>删除你那块有瑕疵的能量石, 然后返回去再次拾取雅克塞罗斯旁边的紫色宝石
step << !Tauren
    .goto The Barrens,62.4,20.0
        .turnin 926 >>交任务: |cRXP_FRIENDLY_有瑕疵的能量石|r
step << !Tauren
    #sticky
#completewith BeakCave
>>如果你有时间, 可以在前往破损能量石的路上击杀一些平原陆行鸟, 从它们身上获取尖喙
    .complete 844,1 --Plainstrider Beak (7)
step << !Tauren
    .isOnQuest 924
.goto The Barrens,50.4,22.0,50 >>爬上这座山
step << !Tauren
    .isOnQuest 924
    #label BeakCave
.goto The Barrens,47.6,19.2,30 >>前往被火刃兽人包围的洞穴
step << !Tauren
    >>右键点击祭坛
.goto The Barrens,48.0,19.1
.collect 4986,1,924 --Collect Flawed Power Stone
    .complete 924,1 --Destroy the Demon Seed (1)
step
    #sticky
    #completewith next
    >>击杀你看到的迅猛龙, 搜刮它们以获取一些迅猛龙的头颅——稍后你会获得更多
    .complete 869,1 --Raptor Head (12)
step << !Tauren
    >>击杀平原陆行鸟. 击杀后搜刮它们的尖喙
.goto The Barrens,50.8,32.1
    .complete 844,1 --Plainstrider Beak (7)
step << Tauren
    .goto The Barrens,55.7,24.0,40,0
    .goto The Barrens,53.8,23.1,40,0
        .goto The Barrens,52.1,21.1,40,0
    .goto The Barrens,51.3,22.9,40,0
    .goto The Barrens,48.3,23.5,40,0
    .goto The Barrens,49.8,31.2
    >>击杀平原陆行鸟. 击杀后搜刮它们的尖喙
    .complete 844,1 --Plainstrider Beak (7)
step
    >>塔顶
.goto The Barrens,51.5,30.9
>>与|cRXP_FRIENDLY_索克|r交谈
    .turnin 871 >>交任务: |cRXP_FRIENDLY_野猪人的袭击|r
.target Thork
    .accept 872 >>接任务: |cRXP_LOOT_野猪人的头目|r
.target Darsok Swiftdagger
>>与|cRXP_FRIENDLY_达索克·快刀|r交谈
    .accept 867 >>接任务: |cRXP_LOOT_鹰身强盗|r
step
    .goto The Barrens,52.2,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 844 >>交任务: |cRXP_FRIENDLY_平原陆行鸟的威胁|r
.target Sergra Darkthorn
    .accept 845 >>接任务: |cRXP_LOOT_斑马的威胁|r
step << Tauren Shaman
    .goto The Barrens,52.2,31.0
.target Sergra Darkthorn
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 842 >>交任务: |cRXP_FRIENDLY_十字路口征兵|r
step
    .goto The Barrens,52.0,29.9
    .home >>将你的炉石设置到十字路口
step << !Hunter !Rogue !Warlock !Mage !Priest
     #sticky
    #completewith next
    .money <0.75
    >>检查里扎雷克斯(地精商人)是否在十字路口. 如果他在, 购买药水和一把重刺狼牙棒
    .unitscan Lizzarik
    .goto The Barrens,52.5,30.7,20,0
.collect 4778,1 --Collect Heavy Spiked Mace
step << Orc/Troll
#xprate <1.5
    .goto The Barrens,52.6,29.9
.target Zargh
>>与|cRXP_FRIENDLY_扎尔夫|r交谈
    .turnin 6386 >>交任务: |cRXP_FRIENDLY_返回十字路口|r
step
    .isOnQuest 872
    .goto The Barrens,57.1,25.3,250 >>前往此处
step
    #sticky
    #completewith Crates
    >>在获取箱子并击杀克里尼格的同时, 杀死剃刀人
    .complete 872,1 --Razormane Geomancer (8)
    .complete 872,2 --Razormane Defender (8)
step
    #sticky
    #completewith Kreenig
>>搜刮该区域发现的补给箱
    .complete 5041,1 --Crossroads' Supply Crates (1)
step
    #label Kreenig
>>击杀克里尼格·斯纳尔索特, 击败他后拾取他的獠牙
.goto The Barrens,58.6,27.1
    .complete 872,3 --Kreenig Snarlsnout's Tusk (1)
    .unitscan Kreenig Snarlsnout
step
#label Crates
>>搜刮该区域发现的箱子
.goto The Barrens,58.5,27.3,40,0
    .goto The Barrens,58.4,27.0,40,0
    .goto The Barrens,58.5,25.8,40,0
    .goto The Barrens,59.4,24.8
    .complete 5041,1 --Crossroads' Supply Crates (1)
step
.goto The Barrens,56.7,25.3
    >>完成击杀剃刀人
    .complete 872,1 --Razormane Geomancer (8)
    .complete 872,2 --Razormane Defender (8)
step << Warrior
    >>在这里拾取酒桶. 如果酒桶未刷新, 请等待其重生
.goto The Barrens,55.8,20.0
.collect 4926,1,819 --Collect Chen's Empty Keg
.accept 819 >>接任务: |cRXP_LOOT_老陈的空酒桶|r
step << !Tauren !Undead
    #sticky
    #completewith next
    >>击杀你见到的任何泽夫拉斯, 搜刮它们以获取蹄子
    .complete 845,1 --Zhevra Hooves (4)
step << Tauren Warrior
    .goto The Barrens,56.7,19.8,60 >>跑到这里, 沿途刷怪
step << !Tauren !Undead
    .goto The Barrens,62.3,20.1
.target Ak'Zeloth
>>与|cRXP_FRIENDLY_雅克塞罗斯|r交谈
    .turnin 924 >>交任务: |cRXP_FRIENDLY_恶魔之种|r
step << Shaman
    .goto Durotar,38.5,58.9
>>与|cRXP_FRIENDLY_泰尔夫·祖拉姆|r交谈
    .turnin 1525 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
.target Telf Joolam
    .accept 1526 >>接任务: |cRXP_LOOT_火焰的召唤|r
step << Shaman
    .use 6636 >>跑到山顶, 使用火焰灵契观察并击杀火元素. 击败后拾取战利品, 然后点击火盆
.goto Durotar,39.0,58.2
    .complete 1526,1 --Glowing Ember (1)
step << Shaman
    .goto Durotar,38.9,58.2
    .turnin 1526 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
    .accept 1527 >>接任务: |cRXP_LOOT_火焰的召唤|r
step << Shaman
    #sticky
    #completewith next
    >>击杀你见到的任何泽夫拉斯, 搜刮它们以获取蹄子
    .complete 845,1 --Zhevra Hooves (4)
step << Shaman
    .goto The Barrens,55.9,19.9
.target Kranal Fiss
>>与|cRXP_FRIENDLY_卡纳尔·菲斯|r交谈
    .turnin 1527 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
step << Shaman
     >>在这里拾取酒桶. 如果酒桶未刷新, 请等待其重生
    .goto The Barrens,55.8,20.0
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >>接任务: |cRXP_LOOT_老陈的空酒桶|r
step
    >>击杀你看到的任何扎夫拉人, 从他们身上搜刮蹄子. 进入棘齿城前, 确保你已收集到4个蹄子
    .goto The Barrens,63.9,35.8
    .complete 845,1 --Zhevra Hooves (4)
step
    >>向南前往棘齿城, 途中升级. 前往建筑的顶层
    .goto The Barrens,62.7,36.3
.target Gazlowe
>>与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .accept 887 >>接任务: |cRXP_LOOT_南海海盗|r
step
    .goto The Barrens,63.1,37.1
    #completewith ratchetfp
    .fp Ratchet >>获取棘齿城飞行路线
step
    .goto The Barrens,63.0,37.2
.target Sputtervalve
>>与|cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .accept 894 >>接任务: |cRXP_LOOT_什么什么平衡器|r
step
    #xprate <1.5
    .maxlevel 16
    .goto The Barrens,63.086,37.607
.target Crane Operator Bigglefuzz
>>与|cRXP_FRIENDLY_起重机操作员比戈弗兹|r交谈
    .accept 959 >>接任务: |cRXP_LOOT_港口的麻烦|r
step
    .goto The Barrens,63.3,38.4
>>与|cRXP_FRIENDLY_码头管理员迪兹维格|r对话
    .turnin 1492 >>交任务: |cRXP_FRIENDLY_码头管理员迪兹维格|r
.target Wharfmaster Dizzywig
    .accept 896 >>接任务: |cRXP_LOOT_矿工的宝贝|r
step
    >>点击通缉海报. 如果你想存钱, 这里也可以进行银行操作
    .goto The Barrens,62.6,37.5
    .accept 895 >>接任务: |cRXP_LOOT_通缉：巴隆·朗绍尔|r
step
    .goto The Barrens,62.4,37.7
.target Mebok Mizzyrix
>>与|cRXP_FRIENDLY_麦伯克·米希瑞克斯|r交谈
    .accept 865 >>接任务: |cRXP_LOOT_迅猛龙角|r
step
    .goto The Barrens,62.3,38.4
>>与酿酒师德罗恩交谈|cRXP_FRIENDLY_Brewmaster Drohn|r
    .turnin 819 >>交任务: |cRXP_FRIENDLY_老陈的空酒桶|r
.target Brewmaster Drohn
    .accept 821 >>接任务: |cRXP_LOOT_老陈的空酒桶|r
step
    #label rachetfp
    .goto The Barrens,62.05,39.41
    >>这里的5级鱼饵超级便宜, 快囤货吧 << Warrior/Rogue
    .vendor >>补充食物和饮水
step
    #sticky
    #completewith next
    >>击杀该区域内的南海海盗
    .complete 887,1 --Southsea Brigand (12)
    .complete 887,2 --Southsea Cannoneer (6)
step
    .goto The Barrens,64.2,47.1,40,0
    .goto The Barrens,63.6,49.1,40,0
    .goto The Barrens,62.6,49.7,40,0
    .goto The Barrens,64.2,47.1,40,0
    .goto The Barrens,63.6,49.1,40,0
    .goto The Barrens,62.6,49.7,40,0
    .goto The Barrens,64.2,47.1,40,0
    .goto The Barrens,63.6,49.1,40,0
    .goto The Barrens,62.6,49.7
    >>在其中一个营地找到并击杀巴隆·朗绍尔, 然后从他身上获取头颅
    .complete 895,1 --Baron Longshore's Head (1)
    .unitscan Baron Longshore
step
    >>击杀南海海盗并完成任务
    .goto The Barrens,64.2,47.1,40,0
    .goto The Barrens,63.6,49.1,40,0
    .goto The Barrens,62.6,49.7,40,0
    .goto The Barrens,64.2,47.1,40,0
    .goto The Barrens,63.6,49.1,40,0
    .goto The Barrens,62.6,49.7,40,0
    .goto The Barrens,64.2,47.1,40,0
    .goto The Barrens,63.6,49.1,40,0
    .goto The Barrens,62.6,49.7
    .complete 887,1 --Southsea Brigand (12)
    .complete 887,2 --Southsea Cannoneer (6)
step << Druid
    >>前往: |cRXP_PICK_月光林地|r
    .goto Moonglade,52.4,40.6
    .trainer 12042 >>学习法术
step
    #completewith next
    .hs >>传送至十字路口
    .cooldown item,6948,>0
step
    .goto The Barrens,51.5,30.8
.target Thork
>>与|cRXP_FRIENDLY_索克|r交谈
    .turnin 5041 >>交任务: |cRXP_FRIENDLY_十字路口的补给品|r
    .turnin 872 >>交任务: |cRXP_FRIENDLY_野猪人的头目|r
step
    .goto The Barrens,52.0,31.6
.target Mankrik
>>与|cRXP_FRIENDLY_曼科里克|r交谈
    .accept 899 >>接任务: |cRXP_LOOT_复仇的怒火|r
    .accept 4921 >>接任务: |cRXP_LOOT_在战斗中失踪|r
step
    .goto The Barrens,52.2,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 845 >>交任务: |cRXP_FRIENDLY_斑马的威胁|r
.target Sergra Darkthorn
    .accept 903 >>接任务: |cRXP_LOOT_草原上的徘徊者|r
step
    #sticky
    #completewith next
>>击杀平原行者, 搜刮他们的肾脏
    .complete 821,2 --Plainstrider Kidney (5)
step
    .goto The Barrens,45.4,28.4
.target Regthar Deathgate
>>与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .accept 850 >>接任务: |cRXP_LOOT_科卡尔首领|r
step << !Tauren
#xprate >1.499
    #sticky
    #completewith next
    >>收集被遗忘之池周围的白色蘑菇. 尽量避开怪物
.complete 848,1 --Collect Fungal Spores (x4)
step << !Tauren
#xprate >1.499
>>潜入水下, 抵达气泡裂隙
.goto The Barrens,45.1,22.5
    .complete 870,1 --Explore the waters of the Forgotten Pools
step << !Tauren
#xprate >1.499
>>收集被遗忘之池周围的白色蘑菇. 尽量避开怪物
.goto The Barrens,45.2,23.3,40,0
.goto The Barrens,45.2,22.0,40,0
    .goto The Barrens,44.6,22.5,40,0
    .goto The Barrens,43.9,24.4,40,0
.complete 848,1 --Collect Fungal Spores (x4)
step
>>击杀科多班. 搜刮其头颅. 沿途清理小怪
.goto The Barrens,42.8,23.5
    .complete 850,1 --Kodobane's Head (1)
step
    #sticky
    #completewith Claws
    >>杀死你看到的迅猛龙. 击杀后拾取一些迅猛龙的头颅——不用担心任务进度, 之后还会获得更多
    .complete 869,1 --Raptor Head (12)
step
    #sticky
    #completewith Claws
    #label Tusks
.goto The Barrens,41.4,24.5,40,0
    .goto The Barrens,40.4,20.0,40,0
.goto The Barrens,41.4,24.5,40,0
    .goto The Barrens,40.4,20.0
    .complete 821,1 --Savannah Lion Tusk (5)
step
    #label Claws
>>击杀潜行者, 搜刮它们的爪子和獠牙
.goto The Barrens,41.4,24.5
    .complete 903,1 --Prowler Claws (7)
step
#hidewindow
    #requires Claws
step
    #requires Tusks
.goto The Barrens,40.2,18.9,40,0
    .goto The Barrens,40.7,14.6,40,0
    .goto The Barrens,42.6,15.1,40,0
.goto The Barrens,40.2,18.9,40,0
    .goto The Barrens,40.7,14.6,40,0
    .goto The Barrens,42.6,15.1
    >>击杀鹰身女妖, 搜刮它们的利爪
    .complete 867,1 --Witchwing Talon (8)
step
    >>击杀平原陆行鸟和迅猛龙
    .complete 821,2 --Plainstrider Kidney (5)
    .complete 865,1,3 --Intact Raptor Horn (5)
    .complete 869,1 --Raptor Head (12)
--NEEDS WAYPOINTS. Don't use &, use "and" (can always discuss and we can find and replace one or the other). Remove "in the area" from now on
step
    >>点击控制台
    .goto The Barrens,52.4,11.6
    .turnin 894 >>交任务: |cRXP_FRIENDLY_什么什么平衡器|r
    .accept 900 >>接任务: |cRXP_LOOT_什么什么平衡器|r
step
    >>点击阀门
.goto The Barrens,52.4,11.4
    .complete 900,2 --Shut off Fuel Control Valve (1)
step
    >>点击阀门. 怪物将出现
.goto The Barrens,52.3,11.4
    .complete 900,3 --Shut off Regulator Valve (1)
step
    >>点击阀门. 怪物将出现
    .goto The Barrens,52.3,11.6
    .complete 900,1 --Shut off Main Control Valve (1)
step
    >>点击控制台
.goto The Barrens,52.4,11.6
    .turnin 900 >>交任务: |cRXP_FRIENDLY_什么什么平衡器|r
    .accept 901 >>接任务: |cRXP_LOOT_什么什么平衡器|r
step
    >>击杀建筑内的工匠斯尼格斯. 搜刮出控制台钥匙
.goto The Barrens,52.8,10.4
    .complete 901,1 --Console Key (1)
    .unitscan Tinkerer Sniggles
step
    .goto The Barrens,52.4,11.6
    .turnin 901 >>交任务: |cRXP_FRIENDLY_什么什么平衡器|r
    .accept 902 >>接任务: |cRXP_LOOT_什么什么平衡器|r
step
    >>接任务: |cRXP_LOOT_打火钥匙|r from the Shredder. If someone recently started the escort you'll need to wait for him to respawn.
.goto The Barrens,56.5,7.5
.target Wizzlecrank's Shredder
>>与|cRXP_FRIENDLY_Wizzlecrank's Shredder|r交谈
    .accept 858 >>接任务: |cRXP_LOOT_打火钥匙|r
step
    >>击杀鲁格维兹主管(他会在整座塔内巡逻). 从他身上搜刮打火钥匙
.goto The Barrens,56.3,8.6
    .complete 858,1 --Ignition Key (1)
    .unitscan Supervisor Lugwizzle
step
    >>这将开始护送任务. 准备就绪后即可开始
.goto The Barrens,56.5,7.5
>>与|cRXP_FRIENDLY_Wizzlecrank's Shredder|r交谈
    .turnin 858 >>交任务: |cRXP_FRIENDLY_打火钥匙|r
.target Wizzlecrank's Shredder
    .accept 863 >>接任务: |cRXP_LOOT_梅贝尔的隐形水|r
step
    #label Slugs
>>2个怪物会在某个时间点出现. 杀死它们后, 等待其角色扮演事件结束, 该事件大约持续20秒
.goto The Barrens,55.3,7.8
    .complete 863,1 --Escort Wizzlecrank out of the Venture Co. drill site (1)
step
    .goto The Barrens,55.8,6.2,40,0
    .goto The Barrens,57.2,6.6,40,0
    .goto The Barrens,60.0,7.6,40,0
    .goto The Barrens,60.8,10.6,40,0
    .goto The Barrens,60.4,1.2,40,0
    .goto The Barrens,61.2,13.2
    >>击杀平原行者, 搜刮他们的肾脏
    >>击杀猛禽, 掠夺它们的角和头
    *They both share respawns
    .complete 821,2 --Plainstrider Kidney (5)
    .complete 865,1 --Intact Raptor Horn (5)
    .complete 869,1 --Raptor Head (12)
step
    >>刷怪直到掉落猫眼翡翠
.goto The Barrens,61.5,4.3
    .complete 896,1 -- Cats Eye Emerald (1)
step
    #completewith next
    .goto Orgrimmar,11.5,67.0,50 >>跑向奥格瑞玛西部入口
step << Orc/Troll
#xprate >1.499
    .goto Orgrimmar,54.2,68.6
>>与|cRXP_FRIENDLY_旅店老板格雷什卡|r交谈
    .turnin 6384 >>交任务: |cRXP_FRIENDLY_飞往奥格瑞玛|r
.target Innkeeper Gryshka
    .accept 6385 >>接任务: |cRXP_LOOT_双足飞龙管理员多拉斯|r
step << Orc/Troll
#xprate >1.499
    .goto Orgrimmar,45.120,63.889
     >>交任务, 但不要飞回十字路口
>>与|cRXP_FRIENDLY_多拉斯|r交谈
    .turnin 6385 >>交任务: |cRXP_FRIENDLY_双足飞龙管理员多拉斯|r
.target Doras
    .accept 6386 >>接任务: |cRXP_LOOT_返回十字路口|r
step << Tauren/Undead/BloodElf
    #completewith next
    >>跑向飞行管理员塔, 获取飞行路径
    .goto Orgrimmar,45.120,63.889
    .fp Orgrimmar >>获取奥格瑞玛飞行点
step
    >>贴着左侧前进, 前往格罗玛什要塞
.goto Orgrimmar,39.1,38.1
.target Zor Lonetree
>>与|cRXP_FRIENDLY_佐尔·孤树|r交谈
    .accept 1061 >>接任务: |cRXP_LOOT_石爪之灵|r
step << Paladin
    #completewith next
    .goto Orgrimmar,32.272,35.794
    .trainer >>去训练你的职业法术
step << Shaman
    .goto Orgrimmar,38.8,36.4
.train 8045 >>学习大地震击技能(等级3)
.train 8019 >>学习石化武器(等级3)
.train 325 >>学习闪电之盾(等级2)
.train 526 >>学习解毒术
.train 8154 >>学习石肤图腾(等级2)
step << Shaman
.goto Orgrimmar,31.62,37.82
.target Thrall
>>与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5727 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
step << Warrior
    .goto Orgrimmar,80.391,32.384
    .train 1160 >>训练挫志怒吼(等级1)
    .train 285 >>训练英雄打击(等级3)
step
    #completewith next
    .hs >>传送至十字路口
    .cooldown item,6948,>0
step
    .goto The Barrens,51.9,30.3
>>与 |cRXP_FRIENDLY_加兹罗格|r交谈
    .turnin 869 >>交任务: |cRXP_FRIENDLY_偷钱的迅猛龙|r
.target Gazrog
    .accept 3281 >>接任务: |cRXP_LOOT_被偷走的银币|r
step << !Tauren
#xprate >1.499
    .goto The Barrens,51.5,30.1
.target Apothecary Helbrim
>>与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    .turnin 848 >>交任务: |cRXP_FRIENDLY_菌类孢子|r
step
    >>塔顶
.goto The Barrens,51.6,30.9
.target Darsok Swiftdagger
>>与|cRXP_FRIENDLY_达索克·快刀|r交谈
    .turnin 867 >>交任务: |cRXP_FRIENDLY_鹰身强盗|r
step
#xprate <1.5
    .maxlevel 17
    .goto The Barrens,51.6,30.9
.target Darsok Swiftdagger
>>与|cRXP_FRIENDLY_达索克·快刀|r交谈
    .accept 875 >>接任务: |cRXP_LOOT_鹰身人首领|r
step << !Tauren
#xprate >1.499
    .goto The Barrens,52.2,31.8
>>与|cRXP_FRIENDLY_图加·符文图腾|r谈话
    .turnin 870 >>交任务: |cRXP_FRIENDLY_遗忘之池|r
.target Tonga Runetotem
    .accept 877 >>接任务: |cRXP_LOOT_死水绿洲|r
step
    .goto The Barrens,52.3,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 903 >>交任务: |cRXP_FRIENDLY_草原上的徘徊者|r
.target Sergra Darkthorn
    .accept 881 >>接任务: |cRXP_LOOT_埃其亚基|r
step << Orc/Troll
#xprate >1.499
    .goto The Barrens,52.6,29.9
.target Zargh
>>与|cRXP_FRIENDLY_扎尔夫|r交谈
    .turnin 6386 >>交任务: |cRXP_FRIENDLY_返回十字路口|r
step
#xprate <1.5
    .isOnQuest 875
.goto The Barrens,39.8,17.3,40,0
    .goto The Barrens,37.4,15.8,40,0
    .goto The Barrens,40.3,15.2,40,0
.goto The Barrens,39.8,17.3,40,0
    .goto The Barrens,37.4,15.8,40,0
    .goto The Barrens,40.3,15.2,40,0
.goto The Barrens,39.8,17.3,40,0
    .goto The Barrens,37.4,15.8,40,0
    .goto The Barrens,40.3,15.2
    >>击杀女巫之翼屠夫. 击杀后搜刮出鹰身人首领之戒
    .complete 875,1 --Harpy Lieutenant Ring (6)
step
    #label LionTusks
.goto The Barrens,54.3,14.7
    >>击杀该区域的草原徘徊者, 收集它们的獠牙
    .complete 821,1 --Savannah Lion Tusk (5)
step
    .use 10327 >>使用背包中的埃其亚基的号角召唤埃其亚基, 击败他并击杀后获取他的皮
.goto The Barrens,55.5,17.3
    .complete 881,1 --Echeyakee's Hide (1)
step
    >>返回十字路口
    .goto The Barrens,52.2,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 881 >>交任务: |cRXP_FRIENDLY_埃其亚基|r
.target Sergra Darkthorn
    .accept 905 >>接任务: |cRXP_LOOT_狂暴的镰爪龙|r
step
#xprate <1.5
    .isOnQuest 875
    >>塔顶
.goto The Barrens,51.6,30.9
>>与|cRXP_FRIENDLY_达索克·快刀|r交谈
    .turnin 875 >>交任务: |cRXP_FRIENDLY_鹰身人首领|r
.target Darsok Swiftdagger
    .accept 876 >>接任务: |cRXP_LOOT_塞瑞娜·血羽|r
step
    #completewith next
    .goto The Barrens,51.5,30.3
    .fly Ratchet >>飞往棘齿城
step
    >>前往棘齿城
    .goto The Barrens,63.0,37.2
>>与|cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .turnin 902 >>交任务: |cRXP_FRIENDLY_什么什么平衡器|r
    .turnin 863 >>交任务: |cRXP_FRIENDLY_梅贝尔的隐形水|r
.target Sputtervalve
    .accept 1483 >>接任务: |cRXP_LOOT_菲兹克斯|r
step
    .goto The Barrens,62.7,36.3
>>与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .turnin 887 >>交任务: |cRXP_FRIENDLY_南海海盗|r
.target Gazlowe
    .accept 890 >>接任务: |cRXP_LOOT_丢失的货物|r
    .turnin 895 >>交任务: |cRXP_FRIENDLY_通缉：巴隆·朗绍尔|r
step
    .goto The Barrens,63.3,38.4
>>与|cRXP_FRIENDLY_码头管理员迪兹维格|r对话
    .turnin 896 >>交任务: |cRXP_FRIENDLY_矿工的宝贝|r
    .turnin 890 >>交任务: |cRXP_FRIENDLY_丢失的货物|r
.target Wharfmaster Dizzywig
    .accept 892 >>接任务: |cRXP_LOOT_丢失的货物|r
step
    .goto The Barrens,62.7,36.3
>>与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .turnin 892 >>交任务: |cRXP_FRIENDLY_丢失的货物|r
.target Gazlowe
    .accept 888 >>接任务: |cRXP_LOOT_被窃的货物|r
step
    .goto The Barrens,62.4,37.6
.target Mebok Mizzyrix
>>与|cRXP_FRIENDLY_麦伯克·米希瑞克斯|r交谈
    .accept 1069 >>接任务: |cRXP_LOOT_深苔蜘蛛的卵|r
    .turnin 865 >>交任务: |cRXP_FRIENDLY_迅猛龙角|r
    .accept 1491 >>接任务: |cRXP_LOOT_智慧饮料|r
step
    >>拾取箱子中的物品
.goto The Barrens,63.6,49.2
    .complete 888,2 --Telescopic Lens (1)
step
    >>拾取箱子中的物品
.goto The Barrens,62.6,49.6
    .complete 888,1 --Shipment of Boots (1)
step
    .isOnQuest 865
.goto The Barrens,57.4,52.4,50 >>在前往迅猛龙栖地的路上升级
step
    #sticky
    #completewith Nest
    >>击杀你见到的任何迅猛龙, 搜刮它们的角和羽毛. 离开前你需要收集3根羽毛
    *Be careful as the raptors have a thrash ability.
    .collect 5165,3 --Sunscale Feather (3)
step
    >>从宝箱中获取被偷走的银币
    .goto The Barrens,58.0,53.9
    .complete 3281,1 --Stolen Silver (1)
step
    >>点击水下的气泡裂隙
    .goto The Barrens,55.6,42.7
    .complete 877,1 --Test the Dried Seeds (1)
step
    #sticky
    #label nestegg
    >>为三个迅猛龙巢穴收集3根赤鳞迅猛龙的羽毛
    .collect 5165,3,905,0x3,-1
step
    >>点击蛋. 你需要赤鳞迅猛龙的羽毛
    .goto The Barrens,52.6,46.2
    .complete 905,1 --Visit Blue Raptor Nest (1)
step
    >>点击蛋. 你需要赤鳞迅猛龙的羽毛
    .goto The Barrens,52.5,46.6
    .complete 905,3 --Visit Red Raptor Nest (1)
step
    #label Nest
    >>点击蛋. 你需要赤鳞迅猛龙的羽毛
    .goto The Barrens,52.0,46.5
    .complete 905,2 --Visit Yellow Raptor Nest (1)
step
    >>与曼科里克的妻子交谈
.goto The Barrens,49.3,50.4
    .complete 4921,1 --Find Mankrik's Wife (1)
    .skipgossip
step << Shaman/Warrior
    #xprate >1.4999
    .goto The Barrens,45.10,57.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tatternack|r交谈
    .accept 893 >>接任务: |cRXP_LOOT_野猪人的武器|r
    .target Tatternack Steelforge
step
    .goto The Barrens,45.6,59.0
    #completewith next
    .home >>将你的炉石设置为陶拉祖营地
step
    .goto The Barrens,45.6,59.0
    .vendor >>补充食物和水, 前方有一段难度较高的任务区域
step
    .goto The Barrens,44.5,59.2
.target Mangletooth
>>与|cRXP_FRIENDLY_碎牙|r交谈
    .accept 878 >>接任务: |cRXP_LOOT_野猪人的内战|r
step
    .goto The Barrens,44.5,59.2
    #completewith next
    .fly Crossroads >>飞往十字路口
step
    .goto The Barrens,51.9,30.3
.target Gazrog
>>与 |cRXP_FRIENDLY_加兹罗格|r交谈
    .turnin 3281 >>交任务: |cRXP_FRIENDLY_被偷走的银币|r
step
    .goto The Barrens,52.2,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 905 >>交任务: |cRXP_FRIENDLY_狂暴的镰爪龙|r
.target Sergra Darkthorn
    .accept 3261 >>接任务: |cRXP_LOOT_乔恩·星眼|r
step
    .goto The Barrens,52.2,31.9
>>与|cRXP_FRIENDLY_图加·符文图腾|r谈话
    .turnin 877 >>交任务: |cRXP_FRIENDLY_死水绿洲|r
.target Tonga Runetotem
    .accept 880 >>接任务: |cRXP_LOOT_变异的生物|r
step
    .goto The Barrens,52.0,31.6
.target Mankrik
>>与|cRXP_FRIENDLY_曼科里克|r交谈
    .turnin 4921 >>交任务: |cRXP_FRIENDLY_在战斗中失踪|r
step
    .goto The Barrens,46.1,36.7,35 >>进入WC洞穴
    .isOnQuest 959
step
    .goto Kalimdor,52.0,55.4,20,0
    .goto Kalimdor,52.2,55.2,35,0
    .goto Kalimdor,51.8,54.8,20,0
    .goto Kalimdor,52.0,55.4,20,0
    .goto Kalimdor,52.2,55.2,35,0
    .goto Kalimdor,51.8,54.8,20,0
    .goto Kalimdor,52.0,55.4,20,0
    .goto Kalimdor,52.2,55.2,35,0
    .goto Kalimdor,51.8,54.8,20,0
    .goto Kalimdor,52.0,55.4,20,0
    .goto Kalimdor,52.2,55.2,35,0
    .goto Kalimdor,51.8,54.8,20,0
    .goto Kalimdor,52.2,55.2
    >>寻找疯狂的马格利什(一个地精). 他处于潜行状态, 且有多个刷新点. 击杀并搜刮他, 可获得99年波尔多陈酿
    .complete 959,1 --Collect 99-Year-Old Port (1)
    .unitscan Mad Magglish
    .isOnQuest 959
step
    .goto Kalimdor,51.9,54.9,20 >>进入洞穴深处
    .isOnQuest 1491
step
    .goto Kalimdor,52.1,54.5,30,0
    .goto Kalimdor,52.3,54.6,30,0
    .goto Kalimdor,52.4,55.1,30,0
    .goto Kalimdor,52.8,54.8,30,0
    .goto Kalimdor,52.6,54.5,30,0
    .goto Kalimdor,52.1,54.5,30,0
    .goto Kalimdor,52.3,54.6,30,0
    .goto Kalimdor,52.4,55.1,30,0
    .goto Kalimdor,52.8,54.8,30,0
    .goto Kalimdor,52.6,54.5,30,0
    .goto Kalimdor,52.1,54.5,30,0
    .goto Kalimdor,52.3,54.6,30,0
    .goto Kalimdor,52.4,55.1,30,0
    .goto Kalimdor,52.8,54.8,30,0
    .goto Kalimdor,52.6,54.5,30,0
	.goto Kalimdor,52.6,54.5
    >>击杀幽灵体获取哀嚎精华. 留意洞穴深处的两只稀有怪物(特里戈尔和博恩), 它们可能掉落蓝色绑定拾取的武器
    .complete 1491,1 --Wailing Essence (6)
    .unitscan Trigore the Lasher
    .unitscan Boahn
    .isOnQuest 1491
step
    >>返回科尔卡尔前哨
    .goto The Barrens,45.4,28.4
.target Regthar Deathgate
>>与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 850 >>交任务: |cRXP_FRIENDLY_科卡尔首领|r
    .isOnQuest 850
step
#xprate <1.5
    >>击杀塞丽娜·血羽, 搜刮她的头颅
.goto The Barrens,39.2,12.2
    .complete 876,1 --Serena's Head (1)
step
    .goto The Barrens,35.3,27.9
    >>前往石爪山脉
    .isOnQuest 1061
.target Seereth Stonebreak
>>与|cRXP_FRIENDLY_希雷斯·碎石|r交谈
    .turnin 1061 >>交任务: |cRXP_FRIENDLY_石爪之灵|r
step
    .goto The Barrens,35.3,27.9
.target Seereth Stonebreak
>>与|cRXP_FRIENDLY_希雷斯·碎石|r交谈
    .accept 1062 >>接任务: |cRXP_LOOT_地精侵略者|r
step
    .maxlevel 22
    .goto The Barrens,35.3,27.9
    >>前往石爪山脉
.target Makaba Flathoof
>>与|cRXP_FRIENDLY_玛卡巴·扁蹄|r交谈
    .accept 6548 >>接任务: |cRXP_LOOT_为我的村庄复仇|r
step
    .isOnQuest 6548
    .goto Stonetalon Mountains,80.7,89.2,50,0
    .goto Stonetalon Mountains,82.0,86.0,50,0
    .goto Stonetalon Mountains,84.7,84.3,50,0
    .goto Stonetalon Mountains,82.3,90.0,50,0
    .goto Stonetalon Mountains,80.7,89.2,50,0
    .goto Stonetalon Mountains,82.0,86.0,50,0
    .goto Stonetalon Mountains,84.7,84.3,50,0
    .goto Stonetalon Mountains,82.3,90.0
    >>击杀该区域内的格里姆图腾
    .complete 6548,2 --Kill Grimtotem Mercenary (x6)
    .complete 6548,1 --Kill Grimtotem Ruffian (x8)
step
    .isOnQuest 6548
    .goto The Barrens,35.191,27.791
    >>返回贫瘠之地找任务发布者
>>与|cRXP_FRIENDLY_玛卡巴·扁蹄|r交谈
    .turnin 6548 >>交任务: |cRXP_FRIENDLY_为我的村庄复仇|r
.target Makaba Flathoof
    .accept 6629 >>接任务: |cRXP_LOOT_杀死格鲁迪格·暗云|r
step
.goto Stonetalon Mountains,82.3,98.5,40 >>跑到这里的山上
step
    .goto Stonetalon Mountains,71.4,95.1
.target Xen'Zilla
>>与|cRXP_FRIENDLY_Xen'Zilla|r交谈
    .accept 6461 >>接任务: |cRXP_LOOT_盗窃的蜘蛛|r
step
    #sticky
    #completewith next
    .isOnQuest 6629
    .goto Stonetalon Mountains,71.7,86.7,40 >>前往此处的路径
step
    .isOnQuest 6629
    >>在进入内部任务前, 请确保已击杀全部6个蛮兵. 请在主帐篷前击杀格鲁迪克
    .goto Stonetalon Mountains,74.0,86.2
    .complete 6629,1 --Kill Grundig Darkcloud (x1)
    .complete 6629,2 --Kill Grimtotem Brute (x6)
step
    >>开始护送凯亚
    .goto Stonetalon Mountains,73.5,85.8
.target Kaya Flathoof
>>与|cRXP_FRIENDLY_卡雅·扁蹄|r交谈
    .accept 6523 >>接任务: |cRXP_LOOT_保护卡雅|r
    .isOnQuest 6629
step
       >>护送卡娅并始终紧随其后. 篝火旁会出现3个幽灵图腾. 在她抵达营地前请先进食或饮水
    .goto Stonetalon Mountains,75.8,91.4
    .complete 6523,1 --Kaya Escorted to Camp Aparaje
    .isOnQuest 6523
step
    #sticky
    #completewith next
    >>在前往通缉令目标途中击杀深苔爬行者. 无需立即完成任务
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
step
    >>点击前方道路的通缉海报
    .goto Stonetalon Mountains,59.0,75.7
    .accept 6284 >>接任务: |cRXP_LOOT_贝瑟莱斯|r
step
    .goto Stonetalon Mountains,57.5,76.2,30 >>沿着这条小路跑到西希尔峡谷
step
    #sticky
    #label deepmossegg
    #completewith spiderend
    >>点击树旁的蜘蛛卵. 小心, 怪物可能从卵中生成
    .complete 1069,1 --Collect Deepmoss Egg (x15)
    .isOnQuest 1069
step
    #sticky
    #label besseleth
    #completewith spiderend
    .goto Stonetalon Mountains,54.7,71.9,40,0
    .goto Stonetalon Mountains,52.6,71.8,40,0
    .goto Stonetalon Mountains,52.2,75.6,40,0
    .goto Stonetalon Mountains,53.9,74.2,40,0
    .goto Stonetalon Mountains,54.7,71.9,40,0
    .goto Stonetalon Mountains,52.6,71.8,40,0
    .goto Stonetalon Mountains,52.2,75.6,40,0
    .goto Stonetalon Mountains,53.9,74.2
    >>击杀贝瑟莱斯并夺取他的獠牙
    .complete 6284,1 --Collect Besseleth's Fang (x1)
	.unitscan Besseleth
    .isOnQuest 6284
step
    >>击杀该区域的深苔蜘蛛和贝瑟莱斯. 从贝瑟莱斯身上获取他的獠牙
    .goto Stonetalon Mountains,54.7,71.9,40,0
    .goto Stonetalon Mountains,52.6,71.8,40,0
    .goto Stonetalon Mountains,52.2,75.6,40,0
    .goto Stonetalon Mountains,53.9,74.2,40,0
    .goto Stonetalon Mountains,54.7,71.9,40,0
    .goto Stonetalon Mountains,52.6,71.8,40,0
    .goto Stonetalon Mountains,52.2,75.6,40,0
    .goto Stonetalon Mountains,53.9,74.2
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .complete 6461,2 --Kill Deepmoss Venomspitter (x7)
    .isOnQuest 6461
step
    #label spiderend
    >>前往山后的小屋
    .goto Stonetalon Mountains,58.989,62.599
.target Ziz Fizziks
>>与|cRXP_FRIENDLY_菲兹克斯|r交谈
    .turnin 1483 >>交任务: |cRXP_FRIENDLY_菲兹克斯|r
    .isOnQuest 1483
step
    >>前往山后的小屋
    .goto Stonetalon Mountains,58.989,62.599
.target Ziz Fizziks
>>与|cRXP_FRIENDLY_菲兹克斯|r交谈
    .accept 1093 >>接任务: |cRXP_LOOT_超级收割机6000|r
step
    #sticky
    #completewith next
    >>在寻找操作员以获取蓝图的过程中, 击杀伐木工
    .complete 1062,1 --Kill Venture Co. Logger (x15)
    .isOnQuest 1062
step
    >>击杀风险投资公司操作员, 直到获得蓝图
.goto Stonetalon Mountains,62.8,53.7,40,0
    .goto Stonetalon Mountains,61.7,51.5,40,0
    .goto Stonetalon Mountains,66.8,45.3,40,0
    .goto Stonetalon Mountains,71.7,49.9,40,0
    .goto Stonetalon Mountains,74.3,54.7,40,0
    .goto Stonetalon Mountains,62.8,53.7
    .complete 1093,1 --Collect Super Reaper 6000 Blueprints (x1)
step
    >>击杀伐木工
    .goto Stonetalon Mountains,64.1,56.7,40,0
    .goto Stonetalon Mountains,73.4,54.3,40,0
    .goto Stonetalon Mountains,64.1,56.7,40,0
    .goto Stonetalon Mountains,73.4,54.3,40,0
    .goto Stonetalon Mountains,64.1,56.7,40,0
    .goto Stonetalon Mountains,73.4,54.3,40,0
    .goto Stonetalon Mountains,64.1,56.7,40,0
    .goto Stonetalon Mountains,73.4,54.3
    .complete 1062,1 --Kill Venture Co. Logger (x15)
    .isOnQuest 1062
step
    .goto Stonetalon Mountains,58.989,62.599
>>与|cRXP_FRIENDLY_菲兹克斯|r交谈
    .turnin 1093 >>交任务: |cRXP_FRIENDLY_超级收割机6000|r
.target Ziz Fizziks
    .accept 1094 >>接任务: |cRXP_LOOT_新的指示|r
step << Druid
    #requires deepmossegg
    >>前往: |cRXP_PICK_月光林地|r
    .goto Moonglade,52.4,40.6
    .trainer 12042 >>学习法术
step
    #requires deepmossegg
    #completewith next
    .hs >>传送至陶拉祖营地
step
    #label eggend
    .goto The Barrens,44.9,59.1
>>与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 3261 >>交任务: |cRXP_FRIENDLY_乔恩·星眼|r
.target Jorn Skyseer
    .accept 882 >>接任务: |cRXP_LOOT_伊沙姆哈尔|r
step
    #sticky
    #label Lizard
    >>击杀风暴烈酒, 搜刮它们以获得其中一只角
    .complete 821,3 --Thunder Lizard Horn (1)
step
    #sticky
    #label Lakota1
    #completewith next
    .goto The Barrens,50.0,53.1,0
    .goto The Barrens,46.0,49.2,0
    .goto The Barrens,45.3,52.5,0
    .goto The Barrens,45.0,51.8,0
    .use 5099 >>在该区域附近寻找并击杀拉克塔曼尼(灰柯多), 拾取他的蹄子. 如果找不到他, 可跳过此任务
    .collect 5099,1,883 --Collect Hoof of Lakota'Mani
    .accept 883 >>接任务: |cRXP_LOOT_拉克塔曼尼|r
    .unitscan Lakota'mani
step
    >>击杀大量长毛猪. 优先击杀荆棘织者和寻水者和地灵术士. 击杀后掠夺它们的獠牙. 将获得的血岩碎片保存起来
    *Water Seekers only spawn in the south western most camps. Go East or North West for Geomancers / Thornweavers.
    .goto The Barrens,51.4,57.7,50,0
    .goto The Barrens,51.4,54.7,50,0
    .goto The Barrens,52.7,52.9
.complete 878,1 --Kill Bristleback Water Seeker (x6)
    .complete 878,2 --Kill Bristleback Thornweaver (x12)
    .complete 878,3 --Kill Bristleback Geomancer (x12)
    .complete 899,1 --Collect Bristleback Quilboar Tusk (x60)
--30 yards is too low for something like this
step
    #requires Lizard
    >>绕湖一圈, 击杀乌龟并收集它们的壳
.goto The Barrens,55.5,42.6
    .complete 880,1 --Altered Snapjaw Shell (8)
step
    >>击杀该区域的一只泽夫拉, 搜刮出一具尸体
.goto The Barrens,61.0,32.2
.collect 10338,1 --Collect Fresh Zhevra Carcass
step
    .use 10338 >>使用枯树旁的新鲜斑马肉召唤伊沙姆哈勒, 击杀并从他身上获取他的利牙
.goto The Barrens,59.9,30.4
    .complete 882,1 --Ishamuhale's Fang (1)
step
    >>跑回棘齿城
.goto The Barrens,62.7,36.3
.target Gazlowe
>>与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .turnin 888 >>交任务: |cRXP_FRIENDLY_被窃的货物|r
step
    .goto The Barrens,63.0,37.2
>>与|cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .turnin 1094 >>交任务: |cRXP_FRIENDLY_新的指示|r
.target Sputtervalve
    .accept 1095 >>接任务: |cRXP_LOOT_新的指示|r
step
    .isOnQuest 959
    .goto The Barrens,63.086,37.607
.target Crane Operator Bigglefuzz
>>与|cRXP_FRIENDLY_起重机操作员比戈弗兹|r交谈
    .turnin 959 >>交任务: |cRXP_FRIENDLY_港口的麻烦|r
step
    .goto The Barrens,62.4,37.6
.target Mebok Mizzyrix
>>与|cRXP_FRIENDLY_麦伯克·米希瑞克斯|r交谈
    .turnin 1069 >>交任务: |cRXP_FRIENDLY_深苔蜘蛛的卵|r
    .turnin 1491 >>交任务: |cRXP_FRIENDLY_智慧饮料|r
step
    #completewith next
    .destroy 5570 >>摧毁: |cRXP_ENEMY_深苔蜘蛛的卵|r
step
    .goto The Barrens,62.3,38.4
.target Brewmaster Drohn
>>与酿酒师德罗恩交谈|cRXP_FRIENDLY_Brewmaster Drohn|r
    .turnin 821 >>交任务: |cRXP_FRIENDLY_老陈的空酒桶|r
step << Warrior
    .goto The Barrens,62.2,38.4
    .vendor >>查看 Grazlix 是否掉落粗链短裤, 如果有钱就购买
step << Druid/Rogue/Warrior/Hunter/Shaman
    .goto The Barrens,62.2,38.5
    .vendor >>在Vexspindle处查看是否有野狼护腕, 如果有且你有钱, 就购买它们
step
    .goto The Barrens,63.1,37.1
    #completewith next
    .fly Crossroads >>飞往十字路口
step
#xprate <1.5
    >>塔顶
.goto The Barrens,51.6,30.9
>>与|cRXP_FRIENDLY_达索克·快刀|r交谈
    .turnin 876 >>交任务: |cRXP_FRIENDLY_塞瑞娜·血羽|r
.target Darsok Swiftdagger
    .accept 1060 >>接任务: |cRXP_LOOT_写给金吉尔的信|r
step
    .goto The Barrens,52.0,31.6
.target Mankrik
>>与|cRXP_FRIENDLY_曼科里克|r交谈
    .turnin 899 >>交任务: |cRXP_FRIENDLY_复仇的怒火|r
step
    .goto The Barrens,52.2,31.9
>>与|cRXP_FRIENDLY_图加·符文图腾|r谈话
    .turnin 880 >>交任务: |cRXP_FRIENDLY_变异的生物|r
.target Tonga Runetotem
    .accept 1489 >>接任务: |cRXP_LOOT_哈缪尔·符文图腾|r
    .accept 3301 >>接任务: |cRXP_LOOT_茉拉·符文图腾|r
step
    #completewith camptflight
    .goto The Barrens,51.5,30.3
    .fly Camp Taurajo >>飞往陶拉霍营地
step
    .goto The Barrens,53.0,52.1
    >>击杀奎尔猪兽获取血岩碎片
.collect 5075 --Collect Blood Shard (1)
step
    #label camptflight
    .goto The Barrens,44.6,59.2
>>与|cRXP_FRIENDLY_碎牙|r交谈
    .turnin 878 >>交任务: |cRXP_FRIENDLY_野猪人的内战|r
.target Mangletooth
    .accept 5052 >>接任务: |cRXP_LOOT_阿迦玛甘的血岩碎片|r
    .turnin 5052 >>交任务: |cRXP_FRIENDLY_阿迦玛甘的血岩碎片|r
    .accept 879 >>接任务: |cRXP_LOOT_内奸|r
step
    .isOnQuest 883
.goto The Barrens,44.8,59.1
>>与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 882 >>交任务: |cRXP_FRIENDLY_伊沙姆哈尔|r
.target Jorn Skyseer
    .accept 907 >>接任务: |cRXP_LOOT_被激怒的雷霆蜥蜴|r
    .turnin 883 >>交任务: |cRXP_FRIENDLY_拉克塔曼尼|r
    .accept 1130 >>接任务: |cRXP_LOOT_梅洛的关注|r
    .accept 6382 >>接任务: |cRXP_LOOT_灰谷狩猎|r
step
    .goto The Barrens,44.8,59.1
>>与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 882 >>交任务: |cRXP_FRIENDLY_伊沙姆哈尔|r
.target Jorn Skyseer
    .accept 907 >>接任务: |cRXP_LOOT_被激怒的雷霆蜥蜴|r
    .accept 1130 >>接任务: |cRXP_LOOT_梅洛的关注|r
    .accept 6382 >>接任务: |cRXP_LOOT_灰谷狩猎|r
step
#sticky
#label Owatanka2
.goto The Barrens,44.2,62.1,75,0
.goto The Barrens,49.2,62.6,75,0
.goto The Barrens,49.6,60.0,75,0
.goto The Barrens,44.2,62.1,75,0
.goto The Barrens,49.2,62.6,75,0
.goto The Barrens,49.6,60.0
>>在这个区域附近寻找奥瓦坦卡(蓝色雷霆蜥蜴). 如果找到他, 拾取他的尾刺并开始任务；如果找不到, 就跳过此任务
.collect 5102,1,884 --Collect Owatanka's Tailspike
.accept 884 >>接任务: |cRXP_LOOT_奥瓦坦卡|r
    .unitscan Owatanka
step
.goto The Barrens,42.5,60.3,50,0
    .goto The Barrens,47.1,63.7,50,0
    .goto The Barrens,50.0,61.1
>>击杀雷霆蜥蜴, 搜刮它们的血液
    .complete 907,1 --Thunder Lizard Blood (3)
step
    #requires Owatanka2
.goto The Barrens,44.9,59.1
>>与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 907 >>交任务: |cRXP_FRIENDLY_被激怒的雷霆蜥蜴|r
.target Jorn Skyseer
    .accept 913 >>接任务: |cRXP_LOOT_雷鹰的嘶鸣|r
step
    .isOnQuest 884
.goto The Barrens,44.9,59.1
.target Jorn Skyseer
>>与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 884 >>交任务: |cRXP_FRIENDLY_奥瓦坦卡|r
step
.goto The Barrens,44.8,63.2,30,0
.goto The Barrens,47.0,61.6,30,0
.goto The Barrens,44.8,63.2,30,0
.goto The Barrens,47.0,61.6,30,0
.goto The Barrens,44.8,63.2,30,0
.goto The Barrens,47.0,61.6
    >>击杀一只雷霆鹰, 搜刮其翅膀
    .complete 913,1 --Thunderhawk Wings (1)
step
    .goto The Barrens,44.8,59.1
>>与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 913 >>交任务: |cRXP_FRIENDLY_雷鹰的嘶鸣|r
.target Jorn Skyseer
    .accept 874 >>接任务: |cRXP_LOOT_玛伦·星眼|r
step
#xprate <1.5
    .goto The Barrens,44.5,59.1
    #completewith next
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
step
#xprate >1.499
    .goto Thunder Bluff,45.814,64.711
    #completewith next
    >>前往雷霆崖
    .home >>将你的炉石设置为雷霆崖
step
#xprate <1.5
    .goto Thunder Bluff,45.814,64.711
    #completewith next
    .home >>将你的炉石设置为雷霆崖
step << Warrior wotlk
	.train 198 >>训练1小时锤类武器
    .goto Thunder Bluff,40.93,62.71
    .vendor >>购买尖刺流星锤
    .collect 925,1
    .goto Thunder Bluff,53.20,58.27
step << Warrior tbc/Shaman
    #sticky
    #completewith next
    +如果价格更便宜, 可以从拍卖行购买一把绿色品质的双手钉头锤. 如果你准备进入哀嚎洞穴, 可以跳过这一步, 因为任务奖励的法杖要好得多
step << Warrior tbc/Shaman
    .goto Thunder Bluff,53.2,58.2
    .vendor >>购买牢固的木槌
    .collect 924,1
step
    .goto Thunder Bluff,61.538,80.919
    .turnin -1130 >>交任务: |cRXP_FRIENDLY_梅洛的关注|r
.target Melor Stonehoof
>>与|cRXP_FRIENDLY_梅洛·石蹄|r交谈
    .accept 1131 >>接任务: |cRXP_LOOT_钢齿土狼|r
step << Warrior
    .goto Thunder Bluff,57.243,87.372
.target Sorek
>>与|cRXP_FRIENDLY_索瑞克|r交谈
    .accept 1823 >>接任务: |cRXP_LOOT_和鲁迦交谈|r
    .train 845 >>训练劈砍
    .train 6547 >>训练裂痕(等级3)
    .train 20230 >>训练复仇技能
step
    .goto Thunder Bluff,54.7,51.1
.target Zangen Stonehoof
>>与|cRXP_FRIENDLY_赞金·石蹄|r交谈
    .accept 1195 >>接任务: |cRXP_LOOT_神圣之火|r
step << Shaman
    .goto Thunder Bluff,23.6,19.1
.target Xanis Flameweaver
>>与|cRXP_FRIENDLY_萨尼斯·织火|r交谈
    .accept 1529 >>接任务: |cRXP_LOOT_水之召唤|r
.train 8004 >>学习初级治疗波
.train 6363 >>训练灼热图腾(等级2)
.train 913 >>学习治疗波(等级4)
.train 8052 >>训练火焰冲击(等级2)
.train 6390 >>训练石爪图腾(等级2)
.train 8056 >>学习冰霜打击
step
    #completewith next
    .goto Thunder Bluff,47.003,49.832
    .fly Crossroads >>飞往十字路口
step << !Tauren
#xprate >1.499
    .goto The Barrens,51.5,30.1
.target Apothecary Helbrim
>>与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    .accept 853 >>接任务: |cRXP_LOOT_药剂师扎玛|r
step
    .goto The Barrens,35.3,27.9
    .isOnQuest 1062
>>与|cRXP_FRIENDLY_希雷斯·碎石|r交谈
    .turnin 1062 >>交任务: |cRXP_FRIENDLY_地精侵略者|r
.target Seereth Stonebreak
    .accept 1063 >>接任务: |cRXP_LOOT_长者|r
step
    .goto The Barrens,35.3,27.9
    .isQuestTurnedIn 1062
.target Seereth Stonebreak
>>与|cRXP_FRIENDLY_希雷斯·碎石|r交谈
    .accept 1063 >>接任务: |cRXP_LOOT_长者|r
step
    .isOnQuest 6629
    .goto The Barrens,35.3,27.9
.target Makaba Flathoof
>>与|cRXP_FRIENDLY_玛卡巴·扁蹄|r交谈
    .turnin 6629 >>交任务: |cRXP_FRIENDLY_杀死格鲁迪格·暗云|r
step
    .isOnQuest 6523
    .goto The Barrens,35.3,27.9
>>与|cRXP_FRIENDLY_玛卡巴·扁蹄|r交谈
    .turnin 6523 >>交任务: |cRXP_FRIENDLY_保护卡雅|r
.target Makaba Flathoof
    .accept 6401 >>接任务: |cRXP_LOOT_卡雅还活着|r
step
    .isOnQuest 1060
    >>再次上山, 然后进入洞穴
.goto Stonetalon Mountains,74.5,97.8
.target Witch Doctor Jin'Zil
>>与|cRXP_FRIENDLY_术医金兹尔|r交谈
    .turnin 1060 >>交任务: |cRXP_FRIENDLY_写给金吉尔的信|r
step
    .goto Stonetalon Mountains,71.3,95.1
.target Xen'Zilla
>>与|cRXP_FRIENDLY_Xen'Zilla|r交谈
    .turnin 6461 >>交任务: |cRXP_FRIENDLY_盗窃的蜘蛛|r
step
#xprate >1.499
    .isOnQuest 1095
    >>前往山后的小屋
    .goto Stonetalon Mountains,58.989,62.599
.target Ziz Fizziks
>>与|cRXP_FRIENDLY_菲兹克斯|r交谈
    .turnin 1095 >>交任务: |cRXP_FRIENDLY_新的指示|r
step
#xprate <1.5
    >>前往烈日石居
    >>到达太阳石后, 沿左侧的山路上行
    .goto Stonetalon Mountains,49.0,62.8,40,0
    .goto Stonetalon Mountains,47.3,64.2
.target Tsunaman
>>与|cRXP_FRIENDLY_苏纳曼|r交谈
    .accept 6562 >>接任务: |cRXP_LOOT_帮助耶努萨克雷|r
    .maxlevel 24
step
    .goto Stonetalon Mountains,47.2,61.1
.target Maggran Earthbinder
>>与|cRXP_FRIENDLY_马格兰·大地缚者|r交谈
    .turnin 6284 >>交任务: |cRXP_FRIENDLY_贝瑟莱斯|r
    .isQuestComplete 6284
step
    .goto Stonetalon Mountains,47.5,58.3
.target Tammra Windfield
>>与|cRXP_FRIENDLY_塔姆拉·荒原|r交谈
    .turnin 6401 >>交任务: |cRXP_FRIENDLY_卡雅还活着|r
    .isOnQuest 6401
step
    .goto Stonetalon Mountains,45.1,59.8
    .fp Sun Rock >>获取烈日石居飞行路径
step
    .isOnQuest 1095
    .goto Stonetalon Mountains,58.989,62.599
.target Ziz Fizziks
>>与|cRXP_FRIENDLY_菲兹克斯|r交谈
    .turnin 1095 >>交任务: |cRXP_FRIENDLY_新的指示|r
step
#xprate <1.5
    #sticky
    #completewith next
    .goto Stonetalon Mountains,78.2,42.8,30 >>前往塔隆迪普小径
    .maxlevel 22
step
#xprate <1.5
    .goto Ashenvale,42.3,71.0,20 >>穿过洞穴前往灰谷
    .maxlevel 22
step
#xprate <1.5
    .goto Ashenvale,16.3,29.8,90 >>前往佐拉姆加哨站. 途中务必避开阿斯特兰纳守卫
    .maxlevel 22
step
#xprate <1.5
    .goto Ashenvale,12.3,33.8
    .fp Zoram >>获取佐拉姆加哨站的飞行路径
    .maxlevel 22
step
#xprate <1.5
    .goto Ashenvale,11.8,34.7
.target Karang Amakkar
>>与|cRXP_FRIENDLY_卡拉恩·阿玛卡|r交谈
    .accept 216 >>接任务: |cRXP_LOOT_蓟皮熊怪的麻烦|r
    .maxlevel 22
step
#xprate <1.5
    >>与小屋里的巨魔对话
    .goto Ashenvale,11.6,34.9
.target Marukai
>>与|cRXP_FRIENDLY_玛鲁凯|r交谈
    .accept 6442 >>接任务: |cRXP_LOOT_佐拉姆海岸的纳迦|r
.target Mitsuwa
>>与|cRXP_FRIENDLY_米苏瓦|r交谈
    .accept 6462 >>接任务: |cRXP_LOOT_巨魔符咒|r
    .maxlevel 22
step
#xprate <1.5
    .isOnQuest 6562
    .goto Ashenvale,11.6,34.3
.target Je'neu Sancrea
>>与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
    .turnin 6562 >>交任务: |cRXP_FRIENDLY_帮助耶努萨克雷|r
step
#xprate <1.5
    .goto Ashenvale,11.6,34.3
.target Je'neu Sancrea
>>与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
    .accept 6563 >>接任务: |cRXP_LOOT_阿库麦尔水晶|r
    .maxlevel 22
step
#xprate <1.5
    >>接受此任务将开启护送流程, 请跟随他
    .goto Ashenvale,12.1,34.4
.target Muglash
>>与|cRXP_FRIENDLY_穆格拉什|r交谈
    .accept 6641 >>接任务: |cRXP_LOOT_鞭笞者沃尔沙|r
    .maxlevel 22
step
#xprate <1.5
    #sticky
    #label wrathtailhead
    >>击杀海滩附近的纳迦, 搜刮它们的头颅
    .goto Ashenvale,15.5,17.1
    .complete 6442,1 --Collect Wrathtail Head (x20)
    .isOnQuest 6442
step
#xprate <1.5
    >>点击火盆. 会出现一波波的纳迦. 当沃莎出现后, 让穆格拉什先吸引仇恨, 再与其战斗
    .goto Ashenvale,9.8,27.4
    .complete 6641,1 --Defeat Vorsha the Lasher
    .isOnQuest 6641
step
#xprate <1.5
    .goto Ashenvale,14.2,14.7,40 >>掉入黑暗深渊
    .isOnQuest 6442
step
#xprate <1.5
    #sticky
    #label Sapphires
    .goto Ashenvale,13.0,13.2,30,0
    .goto Ashenvale,13.6,9.0,30,0
    .goto Ashenvale,13.0,13.2,30,0
    .goto Ashenvale,13.6,9.0,30,0
    .goto Ashenvale,13.0,13.2,30,0
    .goto Ashenvale,13.6,9.0,30,0
    .goto Ashenvale,13.0,13.2,30,0
    .goto Ashenvale,13.6,9.0
    >>潜入水中, 进入黑渊深海. 击杀女祭司, 直到掉落一张“潮湿的便笺”(任务). 然后右键点击它并接受任务
    .collect 16790,1,6564 --Collect Damp Note
    .accept 6564 >>接任务: |cRXP_LOOT_上古之神的仆从|r
    .isOnQuest 6442
    .use 16790
step
#xprate <1.5
    >>从隧道墙壁上采集蓝宝石
    .goto Ashenvale,13.0,13.2,30,0
    .goto Ashenvale,13.6,9.0,30,0
    .goto Ashenvale,13.0,13.2,30,0
    .goto Ashenvale,13.6,9.0,30,0
    .goto Ashenvale,13.0,13.2,30,0
    .goto Ashenvale,13.6,9.0,30,0
    .goto Ashenvale,13.0,13.2,30,0
    .goto Ashenvale,13.6,9.0
    .complete 6563,1 --Collect Sapphire of Aku'Mai (x20)
    .isOnQuest 6563
step
    #xprate <1.5
    .xp 21+14175 >>升级至14175/22400经验值
    .isOnQuest 6641
step
    #requires Sapphires
    #xprate <1.5
    #label zoramend
    #requires wrathtailhead
    >>返回佐拉姆加前哨站
    .goto Ashenvale,12.223,34.216
.target Warsong Runner
>>与|cRXP_FRIENDLY_战歌信使|r交谈
    .turnin 6641 >>交任务: |cRXP_FRIENDLY_鞭笞者沃尔沙|r
    .isOnQuest 6641
step
    #xprate <1.5
    .goto Ashenvale,11.6,34.3
.target Je'neu Sancrea
>>与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
    .turnin 6563 >>交任务: |cRXP_FRIENDLY_阿库麦尔水晶|r
    .isOnQuest 6553
step
    #xprate <1.5
    #sticky
    #completewith next
    .destroy 16784 >>摧毁: |cRXP_ENEMY_阿库麦尔蓝宝石|r
step
#xprate <1.5
    .goto Ashenvale,11.6,34.3
.target Je'neu Sancrea
>>与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
    .turnin 6564 >>交任务: |cRXP_FRIENDLY_上古之神的仆从|r
    .isOnQuest 6564
step
#xprate <1.5
    .goto Ashenvale,11.689,34.905
.target Marukai
>>与|cRXP_FRIENDLY_玛鲁凯|r交谈
    .turnin 6442 >>交任务: |cRXP_FRIENDLY_佐拉姆海岸的纳迦|r
    .isOnQuest 6442
step << Druid
    >>前往: |cRXP_PICK_月光林地|r
    .goto Moonglade,52.4,40.6
    .trainer 12042 >>学习法术
step
    .zoneskip Stonetalon Mountains
    #completewith eldercr
    .hs >>炉石传送至雷霆崖
    .cooldown item,6948,>0
step
#xprate >1.499
    #completewith next
    .goto Stonetalon Mountains,45.1,59.8
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .zoneskip Thunder Bluff
step
    #label eldercr
    .isOnQuest 1063
    .goto Thunder Bluff,69.851,30.910
>>对话:|cRXP_FRIENDLY_玛加萨·恐怖图腾|r
    .turnin 1063 >>交任务: |cRXP_FRIENDLY_长者|r
    >>等待剧情演出结束
.target Magatha Grimtotem
    .accept 1064 >>接任务: |cRXP_LOOT_被遗忘者的援助|r
step
    .isOnQuest 1489
    .goto Thunder Bluff,78.4,28.8
.target Arch Druid Hamuul Runetotem
>>与|cRXP_FRIENDLY_大德鲁伊哈缪尔·符文图腾|r交谈
    .turnin 1489 >>交任务: |cRXP_FRIENDLY_哈缪尔·符文图腾|r
step
    .isQuestAvailable 1490
    .goto Thunder Bluff,78.1,29.3
.target Arch Druid Hamuul Runetotem
>>与|cRXP_FRIENDLY_大德鲁伊哈缪尔·符文图腾|r交谈
    .accept 1490 >>接任务: |cRXP_LOOT_纳拉·蛮鬃|r
step
    .isOnQuest 1490
    .goto Thunder Bluff,75.7,31.3
.target Nara Wildmane
>>与|cRXP_FRIENDLY_纳拉·蛮鬃|r交谈
    .turnin 1490 >>交任务: |cRXP_FRIENDLY_纳拉·蛮鬃|r
step
    .isOnQuest 1064
    >>前往灵魂高地下的水池
    .goto Thunder Bluff,22.9,21.1
>>与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 1064 >>交任务: |cRXP_FRIENDLY_被遗忘者的援助|r
.target Apothecary Zamah
    .accept 1065 >>接任务: |cRXP_LOOT_塔伦米尔之旅|r
step
    .isOnQuest 1065
    .goto Thunder Bluff,28.0,25.2
.target Clarice Foster
>>与|cRXP_FRIENDLY_克拉莉斯·弗斯特|r交谈
    .accept 264 >>接任务: |cRXP_LOOT_至死方休|r
step << !Tauren
#xprate >1.499
    .goto Thunder Bluff,23.0,21.1
.target Apothecary Zamah
>>与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 853 >>交任务: |cRXP_FRIENDLY_药剂师扎玛|r
step << !Shaman
    .goto Thunder Bluff,47.003,49.832
    #completewith next
    .fly Orgrimmar >>飞往奥格瑞玛
step << Shaman
    .goto Thunder Bluff,47.003,49.832
    #completewith next
    .fly Ratchet >>飞往棘齿城
step << Shaman
    .goto The Barrens,65.8,43.8
>>与|cRXP_FRIENDLY_水之先知伊斯伦|r交谈
    .turnin 1529 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.target Islen Waterseer
    .accept 1530 >>接任务: |cRXP_LOOT_水之召唤|r
>>与|cRXP_FRIENDLY_玛伦·星眼|r交谈
    .turnin 874 >>交任务: |cRXP_FRIENDLY_玛伦·星眼|r
.target Mahren Skyseer
    .accept 873 >>接任务: |cRXP_LOOT_依沙瓦克|r
step << Shaman
    .goto The Barrens,63.1,37.1
    #completewith next
    .fly Camp Taurajo >>飞往陶拉霍营地
step << Shaman
    .goto The Barrens,43.4,77.4
>>与|cRXP_FRIENDLY_布瑞恩|r交谈
    .turnin 1530 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.target Brine
    .accept 1535 >>接任务: |cRXP_LOOT_水之召唤|r
step << Shaman
    .goto The Barrens,44.1,76.9
    .complete 1535,1 --Filled Brown Waterskin (1)
step << Shaman
    .goto The Barrens,43.4,77.4
>>与|cRXP_FRIENDLY_布瑞恩|r交谈
    .turnin 1535 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.target Brine
    .accept 1536 >>接任务: |cRXP_LOOT_水之召唤|r
step
    .destroy 11149 >>摧毁: |cRXP_ENEMY_主动式负载平衡器说明书|r
step << Shaman
    .goto Thunder Bluff,44.4,59.0
    #completewith next
    .fly Orgrimmar >>飞往奥格瑞玛
step << Shaman
.goto Orgrimmar,38.6,36.0
    #completewith next
.trainer >>去训练你的职业法术
step << Paladin
    .goto Orgrimmar,32.272,35.794
        #completewith next
    .trainer >>去训练你的职业法术
step << Warrior
.goto Orgrimmar,79.7,31.4
        #completewith next
.trainer >>去训练你的职业法术
step << Warrior tbc
    .goto Orgrimmar,81.2,19.0
    .collect 29009,1 >>从禅刀处购买一把破损的重型飞刀
step << Warrior/Paladin/Shaman
    .goto Orgrimmar,81.5,19.6
    .train 197 >>训练双刃斧
step << Shaman
    .goto Orgrimmar,81.5,19.6
    .train 196 >>训练1小时斧头
]])
