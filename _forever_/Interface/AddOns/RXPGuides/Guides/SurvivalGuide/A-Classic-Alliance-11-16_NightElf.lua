RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（联盟）
#hardcore
#classic
#tbc
<< Alliance
#name 11-13 Darkshore (Night Elf)
#version 1
#group RestedXP Survival Guide (A)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
#next 13-13 Loch Modan (Night Elf)
#defaultfor NightElf
#displayname 11-13 黑海岸（暗夜精灵）
step << NightElf
    .goto Teldrassil,56.25,92.44
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6344 >> 交任务：尼莎·影歌
    .accept 6341 >> 接任务：泰达希尔的渔业
    .target 尼莎·影歌
step << NightElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
	.goto Teldrassil,58.39,94.01
    .turnin 6341 >> 交任务：泰达希尔的渔业
    .accept 6342 >> 接任务：飞往奥伯丁
    .target 维斯派塔斯
step << NightElf
    #completewith WashedA
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Auberdine >> 飞往黑海岸
    .target 维斯派塔斯
step << !NightElf
#map Darkshore
    #completewith next
    .goto Darkshore,36.71,44.98,5,0
    .goto Felwood,19.10,20.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .fp Auberdine >> 获取奥伯丁飞行点
    .target 温尼斯·布莱葛
step << NightElf
#map Darkshore
    #label WashedA
    .goto Felwood,19.10,20.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >> 接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step << !NightElf
#map Darkshore
    #label WashedA
    .goto Darkshore,36.71,44.98,5,0
    .goto Felwood,19.10,20.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >> 接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step << NightElf
#map Darkshore
    .goto Felwood,19.27,19.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱尔德|r 交谈
    .turnin 6342 >> 交任务：飞往奥伯丁
    .target 莱尔德
step
#map Darkshore
    #completewith next
    .goto Felwood,19.27,19.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱尔德|r 交谈
    >>|cRXP_BUY_如有需要，购买食物|r
    .vendor >>|T133918:0|t[长嘴泥鳅] |cRXP_WARN_价格很便宜|r
    .target 莱尔德
step
    #completewith next
    .goto Darkshore,36.70,43.78,5 >> 上楼，前往 |cRXP_FRIENDLY_维兹班恩·曲针|r
step
#map Darkshore
    .goto Felwood,19.51,18.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >> 接任务：传声盒827号
    .target 维兹班恩·曲针
step << !Warrior !Rogue
    #completewith next
    .goto Darkshore,37.120,43.616
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥林迪雅|r 交谈
    >>|cRXP_BUY_如有需要，购买饮水|r
    .target 奥林迪雅
step
    #completewith BigThreat
    .goto Darkshore,37.04,44.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希因|r交谈
    .home >> 将炉石设在奥伯丁
    .target 旅店老板莎希因
step << Warrior/Rogue/Paladin
    .goto Darkshore,38.250,41.008
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库德拉姆·石锤|r交谈
    .train 2581 >> 学习采矿，并施放寻找矿物
    .skill mining,1,1
    .target 库德拉姆·石锤
step << Warrior/Rogue/Paladin
    .goto Darkshore,38.191,40.934
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪尔弗拉姆·火须|r交谈
    .train 2020 >> 学习锻造，以便为武器制作增加 +2 伤害的磨刀石，效果很强。 << Warrior/Rogue
    .train 2020 >> 这样便可为武器制作增加 +2 伤害的平衡石，效果很强。 << Paladin
    .skill blacksmithing,1,1
    .target 迪尔弗拉姆·火须
step << Warrior/Rogue/Paladin
    .goto Darkshore,38.225,41.199
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟尔格拉姆·石锤|r 交谈
    >>|cRXP_BUY_购买|r |T134708:0|t[矿工锄]，|cRXP_BUY_出售者是|r |cRXP_FRIENDLY_瑟尔格拉姆·石锤|r
    .collect 2901,1 --Mining Pick (1)
    .target 瑟尔格拉姆·石锤
step
    .goto Darkshore,38.844,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2118 >> 接任务：瘟疫蔓延
    .target 萨纳瑞恩·绿树
step
#map Darkshore
    #label BigThreat
    .goto Felwood,22.24,18.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 984 >> 接任务：熊怪的威胁
    .target 特伦希斯
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .goto Darkshore,36.096,44.931
    .accept 1141 >> 接任务：钓鱼世家
    .turnin 1141 >> 交任务：钓鱼世家
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target 古博·布拉普
step
    #completewith RabidThistle
    .goto Darkshore,35.88,47.01,0
    .goto Darkshore,36.50,53.30,0
    .goto Darkshore,35.72,55.84,0
    >>击杀 |cRXP_ENEMY_小潮行蟹|r 和 |cRXP_ENEMY_暗礁蟹幼崽|r，拾取它们掉落的 |cRXP_LOOT_蟹腿|r
    >>|cRXP_WARN_你可能需要下水寻找它们|r
    .complete 983,1
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
#map Darkshore
    .goto Felwood,18.81,26.69
    >>搜查 |cRXP_PICK_搁浅的海洋生物|r，拾取 |cRXP_LOOT_海洋生物的骸骨|r
    .complete 3524,1
step << Druid
    #completewith end
    >>|cRXP_WARN_将 |T136065:0|t[草药学] 技能提升至15。收集5个 |T134187:0|t[地根草]，留作后续任务使用|r
    .collect 2449,5,6123,1
step
#map Darkshore
    .goto Felwood,22.39,29.45
    >>发现熊怪营地（跑到图腾旁，然后离开）
    .complete 984,1 -- Find a corrupt furbolg camp
step
    #label RabidThistle
    .goto Darkshore,38.47,57.92,50,0
    .goto Darkshore,39.79,58.33,50,0
    .goto Darkshore,38.86,60.72,50,0
    .goto Darkshore,38.47,57.92
    .use 7586 >>|cRXP_WARN_使用|r |T134335:0|t[萨纳瑞恩的希望] |cRXP_WARN_对准一头|r |cRXP_ENEMY_狂暴蓟熊|r
    .complete 2118,1
    .unitscan 狂暴蓟熊
step
    .goto Darkshore,36.53,53.39,55,0
    .goto Darkshore,36.38,55.96,55,0
    .goto Darkshore,35.11,54.69,55,0
    .goto Darkshore,35.79,47.35,55,0
    .goto Darkshore,36.53,53.39
    >>击杀 |cRXP_ENEMY_小潮行蟹|r 和 |cRXP_ENEMY_暗礁蟹幼崽|r，拾取它们掉落的 |cRXP_LOOT_蟹腿|r
    >>|cRXP_WARN_你可能需要下水寻找它们|r
    .complete 983,1
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
    .xp 12-3550 >> 刷怪，直到只差 3550 经验便可升至 12 级（5250+/8800 经验）
step
#map Darkshore
    .goto Felwood,19.13,21.39
    >>点击地上的 |cRXP_PICK_传声盒827号|r
    .turnin 983 >> 交任务：传声盒827号
step
#map Darkshore
    #era/som
	.goto Felwood,19.13,21.39
    >>点击地上的 |cRXP_PICK_传声盒827号|r
    .accept 1001 >> 接任务：传声盒411号
step
#map Darkshore
    .goto Darkshore,36.71,44.98,10,0
    .goto Felwood,19.10,20.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 3524 >> 交任务：搁浅的巨兽
    .accept 4681 >> 接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step
#map Darkshore
    .goto Felwood,21.63,18.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2118 >> 交任务：瘟疫蔓延
    .accept 2138 >> 接任务：清除疫病
    .target 萨纳瑞恩·绿树
step
#map Darkshore
    .goto Felwood,22.24,18.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 984 >> 交任务：熊怪的威胁
    .accept 985 >> 接任务：熊怪的威胁
    .accept 4761 >> 接任务：桑迪斯·织风
    .target 特伦希斯
step << !Warrior !Rogue
    #completewith next
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor >> |cRXP_WARN_购买|r |T133634:0|t[棕色小包] |cRXP_WARN_，按需购买足够数量|r
    >>|cRXP_WARN_购买|r |T132382:0|t[锋利的箭] |cRXP_WARN_或|r |T132384:0|t[重弹丸] << Hunter
    .target 达蒙德
step
#map Darkshore
    .goto Felwood,19.98,14.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 958 >> 接任务：上层精灵的工具
    .accept 954 >> 接任务：巴莎兰
    .target 桑迪斯·织风
step << Druid
    #completewith next
    .goto Darkshore,42.97,45.47,15,0
    .goto Darkshore,43.50,45.97
    >>|cRXP_WARN_进入枭兽洞穴|r
    .cast 18974 >> |cRXP_WARN_使用|r |T132857:0|t[塞纳里奥月尘] |cRXP_WARN_，在洞内的 |cRXP_PICK_月夜枭兽之石|r 处召唤|r |cRXP_ENEMY_月爪枭兽|r
    .use 15208
    .isOnQuest 6001
step << Druid
    .goto Darkshore,42.97,45.47,15,0
    .goto Darkshore,43.50,45.97
    .use 15208 >> 击杀 |cRXP_ENEMY_月爪枭兽|r. 对话 |cRXP_FRIENDLY_月爪枭兽的灵魂|r
    .skipgossip
    .complete 6001,1 --Defeat Lunaclaw (x1)
    .mob 月爪枭兽
    .target 月爪枭兽的灵魂
    .isOnQuest 6001
step << NightElf
#map Darkshore
    .goto Felwood,19.27,19.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱尔德|r 交谈
    .accept 6343 >> 接任务：飞回泰达希尔
    .target 莱尔德
step << NightElf
    #completewith next
    .goto Darkshore,36.71,44.98,5,0
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fly Teldrassil >> 飞往泰达希尔 --Train 12
    .target 凯莱斯·月羽
step << NightElf
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6343 >> 交任务：飞回泰达希尔
    .target 尼莎·影歌
step << NightElf
    #completewith next
    .goto Teldrassil,55.889,89.456
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯
step << Druid
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 6001 >> 交任务：身心之力
    .trainer >> 学习职业技能
    .target 玛斯雷·驭熊者
step << NightElf Warrior
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿雷亚斯塔·刃歌|r交谈
    .goto Darnassus,58.72,34.92
    .trainer >> 学习职业技能
    .target 阿雷亚斯塔·刃歌
step << NightElf Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊琳尼雅·月火|r交谈
    .skipgossip 11866,1
    .goto Darnassus,57.56,46.72
    .train 2567 >> 学习投掷
    .target 伊琳尼雅·月火
step << NightElf Warrior
    #completewith next
    >>购买200把|cRXP_BUY_锋利飞刀|r，装备到远程栏。 << !tbc
    .goto Darnassus,58.765,44.494
    >>|cRXP_WARN_购买一组|r |T135425:0|t[锋利的飞刀]
    .collect 3107,200 << !tbc
    >>购买1把|cRXP_BUY_锐利的飞刀|r并装备到远程栏；耐久用完后修理即可。 << tbc
    .collect 25873,1 << tbc
    .target 阿瑞耶尔·天影
step << NightElf Priest
    .goto Darnassus,37.90,82.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾德莉亚|r交谈
    .trainer >> 学习职业技能
    .target 贾德莉亚
step << NightElf Rogue
    >>进入塞纳里奥区
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞尤娜|r交谈
    .goto Darnassus,31.84,16.69,30,0
    .goto Darnassus,37.00,21.92
    .trainer >> 学习职业技能
    .target 塞尤娜
step << NightElf Hunter
    #completewith next
    .goto Darnassus,40.377,8.545
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .trainer >> 学习职业技能
    .target 祖卡斯特
step
    #completewith next
    .hs >> 炉石回奥伯丁
    >>若炉石尚未冷却，前往鲁瑟兰村，乘角鹰兽飞回奥伯丁。
step
    #completewith next
    .goto Darkshore,36.88,44.10,8,0
    .goto Darkshore,36.01,43.77,10 >> 前往码头对话 |cRXP_FRIENDLY_塞瑞利恩·白爪|r
step
    .goto Darkshore,35.743,43.708
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .accept 963 >> 接任务：永志不渝
    .target 塞瑞利恩·白爪
step
    #completewith next
    .goto 1439,32.432,43.744,15 >> 走到码头尽头然后跳入水中
step
#map Darkshore
    .goto Felwood,13.63,21.44
    >>搜查 |cRXP_PICK_海龟骸骨|r，拾取 |cRXP_LOOT_海龟的残骸|r
    .complete 4681,1 -- Turtle Remains
step
#map Darkshore
    .goto Darkshore,36.71,44.98,10,0
    .goto Felwood,19.10,20.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4681 >> 交任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step << Warrior/Rogue
#map Darkshore
    #completewith next
    .goto Felwood,19.27,19.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱尔德|r 交谈
    .vendor >>|cRXP_WARN_购买40个|r |T133918:0|t[长嘴泥鳅]
    .target 莱尔德
step
    .goto Darkshore,37.708,43.431
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4811 >> 接任务：红色水晶
    .target 哨兵戈琳达·纳希恩
step
#map Darkshore
    #label Bashal1
    .goto Felwood,27.70,10.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    >>|cRXP_WARN_沿道路前往巴莎兰|r
    >>|cRXP_WARN_沿途不要击杀 |cRXP_ENEMY_野生劣魔|r 和 |cRXP_ENEMY_恶灵劣魔|r|r
    .turnin 954 >> 交任务：巴莎兰
    .accept 955 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    .goto Darkshore,44.78,37.91,40,0
    .goto Darkshore,45.43,39.15,40,0
    .goto Darkshore,46.30,39.01,40,0
    .goto Darkshore,47.36,36.86,40,0
    .goto Darkshore,44.80,36.91,40,0
    .goto Darkshore,46.30,39.01
    >>击杀 |cRXP_ENEMY_野生劣魔|r 和 |cRXP_ENEMY_恶灵劣魔|r，拾取它们掉落的 |cRXP_LOOT_劣魔耳环|r
    .complete 955,1
    .mob 野生劣魔
    .mob 恶灵劣魔
step
#map Darkshore
    .goto Felwood,27.70,10.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 955 >> 交任务：巴莎兰
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    .goto Darkshore,45.88,38.56,40,0
    .goto Darkshore,46.76,39.13,40,0
    .goto Darkshore,47.69,36.73,40,0
    .goto Darkshore,45.07,36.76
    >>击杀 |cRXP_ENEMY_戴瑟雷萨特|r，拾取 |cRXP_LOOT_远古月亮石封印|r
    .complete 956,1
    .mob 戴瑟雷萨特
step
#map Darkshore
    .goto Felwood,27.70,10.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 956 >> 交任务：巴莎兰
    .accept 957 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    #completewith Tysha
    >>|cRXP_WARN_沿道路向南走，留意附近的|r |cRXP_ENEMY_森林陆行鸟雏鸟|r
    >>击杀 |cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取它们掉落的 |cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5
    .mob 森林陆行鸟雏鸟
step
    #label Tysha
    .goto Darkshore,40.30,59.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 953 >> 接任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
step
    #completewith TheLay
    >>击杀 |cRXP_ENEMY_被诅咒的贵族|r、|cRXP_ENEMY_挣扎的贵族|r 和 |cRXP_ENEMY_哀嚎的贵族|r，拾取它们掉落的 |cRXP_LOOT_上层精灵的遗物|r
    .complete 958,1
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
    .mob 哀嚎的贵族
step
    .goto Darkshore,43.30,58.70
    >>点击 |cRXP_PICK_亚米萨兰的衰落|r
    .complete 953,1 -- The Lay of Ameth'Aran
step
#map Darkshore
    .goto Felwood,25.66,39.11
    >>点击 |cRXP_PICK_上古之火|r
    .complete 957,1 -- Ancient Moonstone Destroyed
step
#map Darkshore
    #label TheLay
    .goto Felwood,25.98,40.62
    >>点击 |cRXP_PICK_亚米萨兰的毁灭|r
    .complete 953,2 -- The Fall of Ameth'Aran
step
    .goto Darkshore,41.91,57.92,50,0
    .goto Darkshore,41.81,59.77,50,0
    .goto Darkshore,41.98,62.13,50,0
    .goto Darkshore,42.92,62.50,50,0
    .goto Darkshore,43.30,58.70,50,0
    .goto Darkshore,41.91,57.92,50,0
    .goto Darkshore,41.81,59.77,50,0
    .goto Darkshore,41.98,62.13,50,0
    .goto Darkshore,42.92,62.50,50,0
    .goto Darkshore,43.30,58.70
    >>击杀 |cRXP_ENEMY_被诅咒的贵族|r、|cRXP_ENEMY_挣扎的贵族|r 和 |cRXP_ENEMY_哀嚎的贵族|r，拾取它们掉落的 |cRXP_LOOT_上层精灵的遗物|r
    .complete 958,1
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
    .mob 哀嚎的贵族
step
#map Darkshore
    .goto Felwood,23.29,36.73
    .target 哨兵坦莎·月刃
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .turnin 953 >> 交任务：亚米萨兰的毁灭
step
    #completewith BashalFinal
    >>|cRXP_WARN_沿道路向北走，留意附近的|r |cRXP_ENEMY_森林陆行鸟雏鸟|r
    >>击杀 |cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取它们掉落的 |cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5
    .mob 森林陆行鸟雏鸟
step
#map Darkshore
    #completewith BashalFinal
    .goto Felwood,27.70,10.03,60 >> 前往巴莎兰
step
#map Darkshore
    #label BashalFinal
    .goto Felwood,27.70,10.03
    .target 阿斯特利安
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 957 >> 交任务：巴莎兰
step
    .goto Darkshore,45.34,49.70,60,0
    .goto Darkshore,45.48,45.24,60,0
    .goto Darkshore,42.73,45.67,60,0
    .goto Darkshore,45.34,49.70,60,0
    .goto Darkshore,45.48,45.24,60,0
    .goto Darkshore,42.73,45.67
    >>击杀 |cRXP_ENEMY_月夜枭兽|r，拾取它们掉落的 |T132832:0|t[|cRXP_LOOT_小蛋|r]
    >>|cRXP_WARN_稍后将|r |T133971:0|t[烹饪] |cRXP_WARN_技能提升至10，使用材料为|r |T132832:0|t[|cRXP_LOOT_小蛋|r]
    .collect 6889,10,2178 -- Small Egg
    .skill cooking,10,1 -- step displays if cooking skill is less than 10
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
step
    .goto Darkshore,42.014,33.796,80,0
    .goto Darkshore,38.717,33.659,100,0
    .goto Darkshore,46.254,42.955,100,0
    .goto Darkshore,41.216,50.191,100,0
    .goto Darkshore,37.662,49.162,100,0
    .goto Darkshore,46.254,42.955
    >>|cRXP_WARN_小心 |cRXP_ENEMY_蓟熊|r，它们会使你昏迷|r
    >>击杀 |cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取它们掉落的 |cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5
    .mob 森林陆行鸟雏鸟
step
    .goto Darkshore,38.109,41.170,5,0
    .goto Darkshore,37.512,41.674
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    +购买 |T134059:0|t[甜香料]
    >>|cRXP_WARN_使用|r |T134059:0|t[甜香料] |cRXP_WARN_和你的|r |T132832:0|t[小蛋] |cRXP_WARN_制作草药烘蛋，直到烹饪技能达到10|r
    .skill cooking,10,1 -- step only displays if cooking skill is less than 10
    .target 高尔博德·钢手
step
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher than x
    .target 奥兰达利亚·夜歌
step
    #label ToolsTurnin
    #map Darkshore
    .goto Felwood,19.98,14.40
    .target 桑迪斯·织风
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 958 >> 交任务：上层精灵的工具
step
    #label end
    .goto Darkshore,32.417,43.809,15,0
    .goto Darkshore,32.417,43.809,0
    .zone Wetlands >> 乘船前往米奈希尔港
    >>|cRXP_WARN_提升|r |T135966:0|t[急救]|cRXP_WARN_技能，在等待前往米奈希尔港的船时进行|r
step
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_谢尔雷·布隆迪尔|r交谈
    .fp Menethil Harbor >> 获取米奈希尔港飞行点
    .target 谢尔雷·布隆迪尔
step
    #completewith next
    .goto Wetlands,5.485,64.156,40 >> 从码头尽头跳进水里, 游向坐标点
step
    .goto Wetlands,2.433,78.689,-1
    .goto Ironforge,17.089,83.373,-1
    .zone Ironforge >>若角色卡死自助服务可用且已确认目的地为铁炉堡，可下线后通过帮助菜单使用。服务不可用或目的地不符时，手动勾选此步，按下一指南的沿岸路线游往西部荒野，再经暴风城乘地铁前往铁炉堡
    .link https://www.youtube.com/watch?v=oVoxsr4zcg4 >> 点击这里查看视频参考
    --*Please note that the unstuck feature doesn't work on the PTR
    .subzoneskip 809--IF Gates
    .subzoneskip 2257--Deeprun Tram
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（联盟）
#hardcore
#classic
#tbc
<< Alliance
#name 13-13 Loch Modan (Night Elf)
#version 1
#group RestedXP Survival Guide (A)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
#next 13-15 Westfall
#defaultfor NightElf
#displayname 13-13 洛克莫丹（暗夜精灵）
step
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
    .zone Westfall >> 如果网页自助脱困服务不可用，就游泳前往西部荒野
    .zoneskip Ironforge
    .subzoneskip 809--IF Gates
    .subzoneskip 2257--Deeprun Tram
step
    .goto Westfall,54.28,9.26,50,0
    .goto Westfall,55.12,14.64,40,0
    .goto Westfall,56.36,17.81,65,0
    .goto Elwynn Forest,23.24,77.80
    .zone Elwynn Forest >> 继续沿海岸前进，前往艾尔文森林。注意别引到太多|cRXP_ENEMY_海岸鱼人|r；附近有几只会巡逻。
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
step
    .goto Elwynn Forest,36.809,72.429,100,0
    .goto StormwindClassic,69.961,86.583
    .zone Stormwind City >> 前往暴风城
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
step
    .goto StormwindClassic,55.724,65.401
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_凯德雷克·布舍尔|r
    .vendor >> |cRXP_BUY_购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_（如果有货）|r
    .target 凯德雷克·布舍尔
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
step
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fp Stormwind >> 获取暴风城飞行点
    .target 杜加尔·朗德瑞克
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
step
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    .zone Ironforge >> 进入矿道地铁，乘坐地铁前往铁炉堡
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
step
    >>|cRXP_WARN_电车到站后上车, 到对面下车, 在中间站台找到 |cRXP_FRIENDLY_蒙提|r|r
    >>|cRXP_WARN_施放|r |T136221:0|t[召唤虚空行者] |cRXP_WARN_和|r |T135230:0|t[制造初级治疗石] |cRXP_WARN_，可在等待地铁时准备|r << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒙提|r 交谈
    .accept 6661 >> 接任务: 捕捉矿道老鼠
    .target 蒙提
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
step
    .use 17117 >>|cRXP_WARN_使用|r |T133942:0|t[捕鼠者之笛] |cRXP_WARN_捕捉|r |cRXP_ENEMY_矿道老鼠|r
    .complete 6661,1 --Rats Captured (x5)
    .mob 矿道老鼠
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒙提|r 交谈
    .turnin 6661 >> 交任务: 捕捉矿道老鼠
    .timer 11,捕捉矿道老鼠剧情演出
    .accept 6662 >> 接任务: 我的兄弟，尼普希
    .target 蒙提
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
step
    #completewith next
    .goto Ironforge,77.0,51.0
    .zone Ironforge >> 进入铁炉堡
step << Warrior
    .goto Ironforge,70.774,90.279
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_穆伦·雷矛|r
    .accept 1680 >> 接任务: 托姆斯·深炉
    .target 穆伦·雷矛
step
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格莱斯·瑟登|r
    .fp Ironforge >> 获取铁炉堡飞行点
    .target 格莱斯·瑟登
step << Warrior
    .goto Ironforge,48.640,42.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_托姆斯·深炉|r
    .turnin 1680 >> 交任务: 托姆斯·深炉
    .target 托姆斯·深炉
step
    #ah
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁炉堡拍卖师|r交谈
    >>购买以下物品，以便稍后在洛克莫丹快速交还任务
    >>这样可以省去四处找怪击杀的时间。如果不想购买，请跳过此步骤
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
step
    .goto Dun Morogh,53.305,35.112,10,0
    .zone Dun Morogh >> 离开铁炉堡
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_鲁德拉·冻石|r
    .target 鲁德拉·冻石
    .goto Dun Morogh,56.503,47.923,100,0
    .goto Dun Morogh,60.1,52.6,50,0
    .goto Dun Morogh,63.082,49.851
    .accept 314 >> 接任务: 保护牲畜
step
    #completewith next
    .goto Dun Morogh,62.3,50.3,14,0
    .goto Dun Morogh,62.2,49.4,10 >>从这段山坡跑上去
step
    .goto Dun Morogh,62.6,46.1
    >>击杀 |cRXP_ENEMY_瓦加什|r, 获取 |cRXP_LOOT_利牙|r
    >>|cRXP_WARN_这个任务难度较高，如有需要请组队。若找不到队伍且无法单刷，就跳过此步|r
    >>|cRXP_WARN_尝试击杀 |cRXP_ENEMY_瓦加什|r 前请先观看下方视频, 任何职业均可单刷|r
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >> |cRXP_WARN_点击这里查看视频参考|r
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob 瓦加什
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_鲁德拉·冻石|r
    .target 鲁德拉·冻石
    .goto Dun Morogh,63.082,49.851
    .turnin -314,1 >> 交任务: 保护牲畜
step
    #completewith next
    .goto Dun Morogh,68.614,54.643
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_卡杉·莫格什|r
    .vendor >> |cRXP_BUY_购买|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_（如有需要）|r << Warrior/Rogue
    .vendor >> |cRXP_BUY_购买|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_和|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_（如有需要）|r << !Warrior !Rogue
    .target 卡杉·莫格什
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_参议员梅尔·圣石|r 和 |cRXP_FRIENDLY_工头乔尼·石眉|r
    .accept 433 >> 接任务: 公众之仆
    .target +参议员梅尔·圣石
    .goto Dun Morogh,68.671,55.969
    .accept 432 >> 接任务: 该死的石腭怪！
    .goto Dun Morogh,69.084,56.330
    .target +工头乔尼·石眉
step << Warrior/Paladin/Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹克·利刃|r交谈
    .goto Dun Morogh,69.324,55.456
    .train 2575 >>学习 |T134708:0|t[采矿]
step << Warrior/Paladin/Rogue
    .cast 2580 >> |cRXP_WARN_激活技能:|r |T136025:0|t[寻找矿物]
step
    .goto Dun Morogh,70.7,56.4,40,0
    .goto Dun Morogh,70.62,52.39,25,0
    .goto Dun Morogh,70.7,56.4
    >>击杀|cRXP_ENEMY_石腭击颅者|r和|cRXP_ENEMY_石腭断骨者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob +石腭击颅者
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
    .mob +石腭断骨者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_工头乔尼·石眉|r 和 |cRXP_FRIENDLY_参议员梅尔·圣石|r
    .turnin 432 >> 交任务: 该死的石腭怪！
    .target +工头乔尼·石眉
    .goto Dun Morogh,69.084,56.330
    .turnin 433 >> 交任务: 公众之仆
    .target +参议员梅尔·圣石
    .goto Dun Morogh,68.671,55.969
step
    .goto Dun Morogh,81.2,42.7,45,0
    .goto Dun Morogh,83.892,39.188
    .target 驾驶员塞克·锤足
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_驾驶员塞克·锤足|r
    .accept 419 >> 接任务: 失踪的驾驶员
step
    >>点击 |cRXP_PICK_矮人的尸体|r
    .goto Dun Morogh,79.672,36.171
    .turnin 419 >> 交任务: 失踪的驾驶员
    .accept 417 >> 接任务: 驾驶员的复仇
step
    >>击杀|cRXP_ENEMY_癞爪|r，拾取其掉落的|cRXP_LOOT_肮脏的爪子|r
    .goto Dun Morogh,78.97,37.14
    .complete 417,1 --Collect Mangy Claw (x1)
    .unitscan 癞爪
step
    #som
    .goto Dun Morogh,83.892,39.188
    >>选匕首, 先拿它当副手, 直到你买到商店剑 << Rogue
    .target 驾驶员塞克·锤足
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_驾驶员塞克·锤足|r
    .turnin 417 >> 交任务: 驾驶员的复仇
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_驾驶员塞克·锤足|r
    >>|cRXP_WARN_选择|r |T135641:0|t[|cRXP_FRIENDLY_工匠匕首|r] |cRXP_WARN_作为任务奖励，装备到副手|r << Rogue
    .target 驾驶员塞克·锤足
    .goto Dun Morogh,83.892,39.188
    .turnin 417 >> 交任务: 驾驶员的复仇
step
    #completewith next
    .goto Dun Morogh,84.4,31.1,25 >> 前往洛克莫丹
step
    #completewith next
    .goto Loch Modan,24.134,18.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高索·布鲁姆|r交谈
    .vendor >>|cRXP_WARN_按需出售杂物并修理装备|r
    .target 高索·布鲁姆
step
.group
    .goto Loch Modan,24.764,18.397
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r
    .target 巡山人卡尔·雷矛
    .accept 307 >> 接任务: 肮脏的爪子
    >>|cRXP_WARN_先不要接"卡尔·雷矛的订单"任务|r
step
    #completewith ThelsamarFirst
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取其掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取其掉落的|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
    >>|cRXP_WARN_保留所有|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_WARN_用于稍后提升 |T133971:0|t[烹饪] |cRXP_WARN_技能|r
step
    #completewith next
    .goto Loch Modan,34.828,49.283,130 >> 前往塞尔萨玛
step
    #label ThelsamarFirst
    .goto Loch Modan,34.828,49.283
    .target 维德拉·壁炉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_维德拉·壁炉|r
    .accept 418 >> 接任务: 塞尔萨玛血肠
step
    #completewith StormpikeO
    .abandon 1338 >> 放弃任务“卡尔·雷矛的订单”，以解锁“巡山人卡尔·雷矛的任务”；交还后可额外获得 550 点经验。
step
    #completewith next
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雅尼·铁心|r
    .vendor >> |cRXP_WARN_购买1或2个|r |T133634:0|t[棕色小包] |cRXP_WARN_（如有需要）|r
    .target 雅尼·铁心
step
    #label StormpikeO
    .goto Loch Modan,35.534,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r
    .vendor >> |cRXP_BUY_购买|r |T133968:0|t[刚出炉的面包]|cRXP_BUY_，尽量备足约40个|r << Warrior/Rogue
    .vendor >> |cRXP_BUY_购买|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_和|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_，尽量备足约20个|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_和40瓶|r |T132815:0|t[冰镇牛奶] << !Warrior !Rogue
    .target 旅店老板纳克罗·壁炉
step
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人卡德雷尔|r
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .accept 416 >> 接任务: 狗头人的耳朵
    .accept 1339 >> 接任务: 巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔
step
    .group
    #completewith BraveSoul
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取其掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取其掉落的|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    .solo
    #completewith StormpikeStop
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取其掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取其掉落的|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    .group
    #completewith MinerGear
    >>击杀|cRXP_ENEMY_坑道鼠|r，拾取其掉落的|cRXP_LOOT_坑道鼠的耳朵|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob 坑道鼠斥候
    .mob 坑道鼠歹徒
    .mob 坑道鼠征粮官
    .mob 坑道鼠地卜师
    .mob 坑道鼠掘地工
    .mob 坑道鼠勘探员
step
    .group
    #label BraveSoul
    #completewith next
    .goto Loch Modan,35.50,18.97,20 >> 进入银泉矿洞
step
    .group
    #label MinerGear
    .goto Loch Modan,35.93,22.55
    >>打开|cRXP_PICK_矿工联盟的储物箱|r，拾取其中的|cRXP_LOOT_矿工装备|r
    >>|cRXP_WARN_这些|cRXP_PICK_矿工联盟的储物箱|r遍布矿洞各处|r
    >>|cRXP_WARN_如果现在想跳过，可以等等级更高时再完成此任务|r
    .complete 307,1 -- Miners' Gear (4)
step
    .group
    #completewith StormpikeStop
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取其掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取其掉落的|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step << Paladin/Warrior
    .goto Loch Modan,42.867,9.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔伦·安德玛|r交谈
    .vendor >>|cRXP_FRIENDLY_尼尔伦·安德玛|r |cRXP_WARN_出售|r |T133476:0|t[|cRXP_FRIENDLY_重型尖刺钉锤|r] |cRXP_WARN_，数量有限|r
    >>|cRXP_WARN_查看是否有货，并在买得起时购买。如果钱不够，就击杀附近的|cRXP_ENEMY_坑道鼠|r攒钱，直到足够购买|r
    >>|cRXP_WARN_请尽快购买，其他玩家可能抢先买走|r
    .target 尼尔伦·安德玛
step
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82,50,0
    .goto Loch Modan,25.05,30.19,50,0
    .goto Loch Modan,26.06,43.44,50,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82
    >>击杀|cRXP_ENEMY_坑道鼠|r，拾取其掉落的|cRXP_LOOT_坑道鼠的耳朵|r
    >>|cRXP_WARN_确保备有10块|r |T132889:0|t[亚麻布] |cRXP_WARN_，供即将进行的圣骑士职业任务使用|r << Paladin
    >>|cRXP_ENEMY_坑道鼠|r |cRXP_WARN_可能出现在洛克莫丹各处。打开世界地图查看它们的位置|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .collect 2589,10,1644,1,1 << Paladin -- Linen Cloth (10)
    .mob 坑道鼠斥候
    .mob 坑道鼠歹徒
    .mob 坑道鼠征粮官
    .mob 坑道鼠地卜师
    .mob 坑道鼠掘地工
    .mob 坑道鼠勘探员
step
    #completewith StormpikeDelivery
    #label StormpikeStop
    .goto Loch Modan,24.134,18.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高索·布鲁姆|r交谈
    .vendor >>|cRXP_WARN_按需出售杂物并修理装备|r
    .target 高索·布鲁姆
step
.group
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r
    .turnin -307,1 >> 交任务: 肮脏的爪子
    .target 巡山人卡尔·雷矛
step
    #label StormpikeDelivery
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r
    .turnin 1339 >> 交任务: 巡山人卡尔·雷矛的任务
    .accept 1338 >> 接任务: 卡尔·雷矛的订单
    .target 巡山人卡尔·雷矛
step
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取其掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取其掉落的|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3173,3,418,1 --Bear Meat (3)
    .mob +老黑熊
    .goto Loch Modan,26.9,10.7,90,0
    .goto Loch Modan,30.9,10.6,90,0
    .goto Loch Modan,28.6,15.4,90,0
    .goto Loch Modan,30.5,26.6,90,0
    .goto Loch Modan,33.4,30.3,90,0
    .goto Loch Modan,39.4,33.3,90,0
    .goto Loch Modan,26.9,10.7,90,0
    .goto Loch Modan,30.9,10.6,90,0
    .goto Loch Modan,28.6,15.4,90,0
    .goto Loch Modan,30.5,26.6,90,0
    .goto Loch Modan,33.4,30.3,90,0
    .goto Loch Modan,39.4,33.3,90,0
    .goto Loch Modan,26.9,10.7
    .collect 3172,3,418,1 --Boar Intestines (3)
    .mob +山猪
    .goto Loch Modan,38.0,34.9,90,0
    .goto Loch Modan,37.1,39.8,90,0
    .goto Loch Modan,29.8,35.9,90,0
    .goto Loch Modan,27.7,25.3,90,0
    .goto Loch Modan,28.6,22.6,90,0
    .goto Loch Modan,38.0,34.9,90,0
    .goto Loch Modan,37.1,39.8,90,0
    .goto Loch Modan,29.8,35.9,90,0
    .goto Loch Modan,27.7,25.3,90,0
    .goto Loch Modan,28.6,22.6,90,0
    .goto Loch Modan,38.0,34.9
    .collect 3174,3,418,1 --Spider Ichor (3)
    .goto Loch Modan,31.9,16.4,90,0
    .goto Loch Modan,28.0,20.6,90,0
    .goto Loch Modan,33.8,40.5,90,0
    .goto Loch Modan,36.2,30.9,90,0
    .goto Loch Modan,39.0,32.1,90,0
    .goto Loch Modan,31.9,16.4,90,0
    .goto Loch Modan,28.0,20.6,90,0
    .goto Loch Modan,33.8,40.5,90,0
    .goto Loch Modan,36.2,30.9,90,0
    .goto Loch Modan,39.0,32.1,90,0
    .goto Loch Modan,31.9,16.4
    .mob +森林潜伏者
step
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人卡德雷尔|r
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .target 巡山人卡德雷尔
    .turnin 416 >> 交任务: 狗头人的耳朵
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_维德拉·壁炉|r
    .target 维德拉·壁炉
    .goto Loch Modan,34.828,49.283
    .turnin 418 >> 交任务: 塞尔萨玛血肠
step
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尼·铁心|r交谈
    >>|cRXP_WARN_购买|r |T135237:0|t[燧石和火绒] |cRXP_WARN_以及1份|r |T135435:0|t[普通木柴]|cRXP_WARN_，并购买|r|T133634:0|t[棕色小包] |cRXP_WARN_（如有需要）|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .target 雅尼·铁心
step
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索格拉姆·伯雷森|r
    .fp Thelsamar >> 获取塞尔萨玛飞行点
    .target 索格拉姆·伯雷森
step
    .goto Loch Modan,22.071,73.127
    .target 巡山人库伯弗林特
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人库伯弗林特|r
    .accept 224 >> 接任务: 保卫国王的领土
step
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话碉堡内的 |cRXP_FRIENDLY_拉格弗斯上尉|r
    .target 拉格弗斯上尉
    .accept 267 >> 接任务: 穴居人的威胁
step
    #completewith next
    .goto Loch Modan,29.9,68.2,45,0
    .goto Loch Modan,30.76,69.97,20 >> 前往碎石怪之谷
step
    .goto Loch Modan,27.01,48.74,0
    .goto Loch Modan,27.68,56.83,0
    .goto Loch Modan,33.35,71.59,0
    .goto Loch Modan,31.54,74.96,0
    .goto Loch Modan,33.35,71.59,50,0
    .goto Loch Modan,31.54,74.96,45,0
    .goto Loch Modan,33.88,76.58,45,0
    .goto Loch Modan,27.01,48.74,40,0
    .goto Loch Modan,27.68,56.83,40,0
    .goto Loch Modan,33.35,71.59,50,0
    .goto Loch Modan,31.54,74.96,45,0
    .goto Loch Modan,33.88,76.58
    >>击杀|cRXP_ENEMY_碎石穴居人|r和|cRXP_ENEMY_碎石怪斥候|r，拾取其掉落的|cRXP_LOOT_穴居人的石牙|r
    >>|cRXP_WARN_确保备有10块|r |T132889:0|t[亚麻布] |cRXP_WARN_，供即将进行的圣骑士职业任务使用|r << Paladin
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .mob +碎石穴居人
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .mob +碎石怪斥候
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob +碎石穴居人
    .mob +碎石怪斥候
    .collect 2589,10,1644,1,1 << Paladin -- Linen Cloth (10)
    .mob +碎石穴居人
    .mob +碎石怪斥候
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人库伯弗林特|r
    .target 巡山人库伯弗林特
    .goto Loch Modan,22.071,73.127
    .turnin 224 >> 交任务: 保卫国王的领土
step
    #label TroggT
    .goto Loch Modan,23.233,73.675
    .target 拉格弗斯上尉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拉格弗斯上尉|r
    .turnin 267 >> 交任务: 穴居人的威胁
step
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索格拉姆·伯雷森|r
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈瑞克·石鼓|r交谈
    >>|cRXP_BUY_购买|r |T135468:0|t[烟尘魔杖]|cRXP_BUY_，达到15级后若尚未装备就装备上|r
    .goto Ironforge,23.141,15.922
    .collect 5208,1 --Smoldering Wand (1)
    .target 哈瑞克·石鼓
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_托德雷·铁矿|r
    .goto Ironforge,25.204,10.749
    .trainer >> 学习职业技能
    .target 托德雷·铁矿
step << Rogue
    .goto Ironforge,51.494,15.335
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_芬斯维克|r
    .trainer >> 学习职业技能
    .target 芬斯维克
step << Rogue
    .goto Ironforge,61.170,89.539
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布里维夫·石手|r
    .train 198 >> 学习单手锤
    .target 布里维夫·石手
step << Hunter
    .goto Ironforge,69.865,82.886
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷格努斯·雷石|r
    .trainer >> 学习职业技能
    .target 雷格努斯·雷石
step << Warrior
    .goto Ironforge,65.907,88.409
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_比尔班·飞钳|r
    .trainer >> 学习职业技能
    .target 比尔班·飞钳
step << Warrior
    .goto Ironforge,61.170,89.539
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布里维夫·石手|r
    .train 199 >> 学习双手锤
    .target 布里维夫·石手
step << Warrior
    .goto Ironforge,62.551,88.699
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯洛米尔·铁手|r交谈
    .vendor >>|cRXP_BUY_购买|r |T133046:0|t[巨型石锤] |cRXP_BUY_（如果买得起）|r
    .target 凯洛米尔·铁手
step
    .goto Ironforge,74.40,51.10,30,0
    .goto Ironforge,74.40,51.10,0
    >>|cRXP_WARN_进入矿道地铁|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话中间平台上的 |cRXP_FRIENDLY_蒙提|r
    .target 蒙提
    .accept 6661 >> 接任务: 捕捉矿道老鼠
step
    .use 17117 >>|cRXP_WARN_使用|r |T133942:0|t[捕鼠者之笛] |cRXP_WARN_捕捉|r |cRXP_ENEMY_矿道老鼠|r
    .complete 6661,1 --Rats Captured (x5)
    .mob 矿道老鼠
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒙提|r 交谈
    .target 蒙提
    .turnin 6661 >> 交任务: 捕捉矿道老鼠
    .timer 11,捕捉矿道老鼠剧情演出
    .accept 6662 >> 接任务: 我的兄弟，尼普希
step
    #completewith next
    .zone Stormwind City >> 乘坐矿道地铁前往暴风城
    >>|cRXP_WARN_提升|r |T135966:0|t[急救] |cRXP_WARN_和|r |T133971:0|t[烹饪] |cRXP_WARN_，如有需要可在等待地铁时练习|r
    >>|cRXP_WARN_你需要将|r |T135966:0|t[急救] |cRXP_WARN_提升到 80 点，以便完成 24 级时的一个任务|r << Rogue !Dwarf
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t地铁抵达暴风城一侧后，下车与 |cRXP_FRIENDLY_尼普希|r 交谈
    >>|cRXP_FRIENDLY_尼普希|r |cRXP_WARN_在中央平台上|r
    .turnin 6662 >> 交任务: 我的兄弟，尼普希
step
    #completewith next
    .zone Stormwind City >> 进入暴风城
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格瑞曼德·艾尔默|r
    .target 格瑞曼德·艾尔默
    .goto StormwindClassic,51.757,12.091
    .accept 353 >> 接任务: 雷矛的包裹
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_弗伦·长须|r
    .target 弗伦·长须
    .goto StormwindClassic,58.091,16.552
    .turnin 1338 >> 交任务: 卡尔·雷矛的订单
step << Druid
    .goto StormwindClassic,20.898,55.491
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_沙德拉斯·月树|r
    .trainer >> 学习职业技能
    .target 沙德拉斯·月树
step << Druid
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>如果不打算学习|T136065:0|t[草药学]作为主要专业，请购买5份|T134187:0|t[地根草]，供后续任务使用
    >>购买以下物品，以便稍后在西部荒野快速交还任务
    >>这样可以省去四处找怪击杀的时间。如果不想购买，请跳过此步骤
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝]
    >>|T132794:0|t[灯油]
    .collect 2449,5,6123,1 -- Earthroot (5)
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- Okra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    .collect 814,5,103,1 -- Flask of Oil (5)
    .target 拍卖师亚克森
step << !Druid
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>购买以下物品，以便稍后在西部荒野快速交还任务
    >>这样可以省去四处找怪击杀的时间。如果不想购买，请跳过此步骤
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝]
    >>|T132794:0|t[灯油]
    .collect 729,3,38,1 -- Stringy Vulture Meat (3)
    .collect 730,3,38,1 -- Murloc Eye (3)
    .collect 731,3,38,1 -- Goretusk Snout (3)
    .collect 732,3,38,1 -- Okra (3)
    .collect 723,8,22,1 -- Goretusk Liver (8)
    .collect 814,5,103,1 -- Flask of Oil (5)
    .target 拍卖师亚克森
step
    .goto StormwindClassic,55.724,65.401
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_凯德雷克·布舍尔|r
    .vendor >> |cRXP_BUY_购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_（如果有货）|r
    .target 凯德雷克·布舍尔
step
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fp Stormwind >> 获取暴风城飞行点
    .target 杜加尔·朗德瑞克
]])
