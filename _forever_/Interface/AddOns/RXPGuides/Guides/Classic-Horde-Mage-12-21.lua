local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 部落法师 AoE
#classic
#tbc
<< Horde Mage
#name 12-17 The Barrens AoE
#version 1
#group RestedXP Horde Mage AoE
#subgroupdisplayname RestedXP 部落法师 AoE
#defaultfor Horde Mage
#next 17-21 Stonetalon/Barrens AoE
#displayname 12-17 贫瘠之地 AoE
step << Mage
	#era/som
    #completewith next
	+注意：你选择了 AoE 指南。法师 AoE 升级通常比单体打怪难得多，但升级速度快得多
step << Mage
	#som
	#phase 3-6
    #completewith next
	+注意：你选择了 AoE 指南。法师 AoE 升级通常比单体打怪难得多；由于 SoM 任务经验提高了 100%，这条路线也会更慢
step
    .goto The Barrens,52.2,31.8
.target 图加·符文图腾
>>与|cRXP_FRIENDLY_图加·符文图腾|r交谈
    .accept 870 >>接受任务 遗忘之池
step
    .goto The Barrens,52.2,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 842 >>交任务 十字路口征兵
.target 瑟格拉·黑棘
    .accept 844 >>接受任务 平原陆行鸟的威胁
step << Troll Mage
    .goto The Barrens,52.5,29.8
.target 扎尔夫
>>与|cRXP_FRIENDLY_扎尔夫|r交谈
    .accept 6365 >>接受任务 送往奥格瑞玛的肉
step
    .goto The Barrens,51.9,30.3
.target 加兹罗格
>>与|cRXP_FRIENDLY_加兹罗格|r交谈
    .accept 869 >>接受任务 偷钱的迅猛龙
step
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板伯兰德·草风|r交谈
    .home >> 将炉石设在十字路口
    .target 旅店老板伯兰德·草风
step
    .goto The Barrens,51.5,30.8
.target 索克
>>与|cRXP_FRIENDLY_索克|r交谈
    .accept 871 >>接受任务 野猪人的袭击
    .accept 5041 >>接受任务 十字路口的补给品
step
    .goto The Barrens,51.5,30.4
    .fp The Crossroads >> 获取十字路口飞行点
step << Troll Mage
    >>不要去奥格瑞玛
    .goto The Barrens,51.5,30.3
>>与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .turnin 6365 >>交任务 送往奥格瑞玛的肉
.target 迪弗拉克
    .accept 6384 >>接受任务 飞往奥格瑞玛
step
    .goto The Barrens,51.5,30.1
.target 药剂师赫布瑞姆
>>与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    .accept 848 >>接受任务 菌类孢子
    .accept 1492 >>接受任务 码头管理员迪兹维格
step
    #sticky
    #completewith next
    >>查看这里是否有老陈的空酒桶。拾取它并接取任务；如果没有，之后再拿
    .goto The Barrens,55.7,27.3
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接受任务 老陈的空酒桶
step
    .goto The Barrens,55.6,26.6
    >>击杀该区域的野猪人
    .complete 871,2 --Razormane Thornweaver (8)
    .complete 871,1 --Razormane Water Seeker (8)
    .complete 871,3 --Razormane Hunter (3)
step << !Undead
    #sticky
    #completewith next
    >>如果背包里的有瑕疵的能量石剩余时间不到 10 分钟，就丢弃它，再回去拾取雅克塞罗斯旁的紫色石头
    .turnin 926 >>交任务 有瑕疵的能量石
step << !Undead
    #sticky
    #completewith BeakCave
    >>如果有瑕疵的能量石还剩足够时间，可顺路击杀平原陆行鸟，拾取它们的喙
    .complete 844,1 --Plainstrider Beak (7)
step << !Undead
    .goto The Barrens,50.4,22.0,20 >>从这里跑上山
step << !Undead
    #label BeakCave
    .goto The Barrens,47.6,19.2,20 >>前往被火刃氏族兽人包围的洞穴
step << !Undead
    >>右键点击祭坛
    .goto The Barrens,48.0,19.1
    .collect 4986,1,924 --Collect Flawed Power Stone
    .complete 924,1 --Destroy the Demon Seed (1)
step
    #sticky
    #completewith next
    >>沿途击杀迅猛龙并拾取头颅；剩余的稍后再收集
    .complete 869,1 --Raptor Head (12)
step
    >>击杀平原陆行鸟，拾取它们的喙
    .goto The Barrens,50.8,32.1
    .complete 844,1 --Plainstrider Beak (7)
step
    >>塔顶
    .goto The Barrens,51.5,30.9
>>与|cRXP_FRIENDLY_索克|r交谈
    .turnin 871 >>交任务 野猪人的袭击
.target 索克
    .accept 872 >>接受任务 野猪人的头目
.target 达索克·快刀
>>与|cRXP_FRIENDLY_达索克·快刀|r交谈
    .accept 867 >>接受任务 鹰身强盗
step
    .goto The Barrens,52.2,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 844 >>交任务  平原陆行鸟的威胁
.target 瑟格拉·黑棘
    .accept 845 >>接受任务 斑马的威胁
step
    #sticky
    #completewith Crates
    >>收集补给箱并击杀克里尼格时，顺路击杀钢鬃野猪人
    .complete 872,1 --Razormane Geomancer (8)
    .complete 872,2 --Razormane Defender (8)
step
    #sticky
    #completewith next
    >>拾取该区域的棕色补给箱
    .complete 5041,1 --Crossroads' Supply Crates (1)
step
    #label Kreenig
    >>击杀克里尼格·糟鼻，拾取他的獠牙
    .goto The Barrens,58.6,27.1
    .complete 872,3 --Kreenig Snarlsnout's Tusk (1)
step
    #label Crates
	.goto The Barrens,58.5,27.3,40,0
    .goto The Barrens,58.4,27.0,40,0
    .goto The Barrens,58.5,25.8,40,0
    .goto The Barrens,59.4,24.8,40,0
    >>拾取该区域的棕色补给箱
    .complete 5041,1 --Crossroads' Supply Crates (1)
step
    .goto The Barrens,56.7,25.3
    >>继续击杀钢鬃野猪人，完成任务目标
    .complete 872,1 --Razormane Geomancer (8)
    .complete 872,2 --Razormane Defender (8)
step << !Undead
    #sticky
    #completewith next
    >>击杀沿途的斑马，拾取它们的蹄子
    .complete 845,1 --Zhevra Hooves (4)
step << !Undead
    .goto The Barrens,62.3,20.1
.target 雅克塞罗斯
>>与|cRXP_FRIENDLY_雅克塞罗斯|r交谈
    .turnin 924 >>交任务  恶魔之种
step
    >>击杀沿途的斑马并拾取蹄子；进入棘齿城前确保收集到 4 个
    .goto The Barrens,58.03,19.76,150,0 << Undead
    .goto The Barrens,63.9,35.8
    .complete 845,1 --Zhevra Hooves (4)
step
    >>建筑顶层
    .goto The Barrens,62.7,36.3
.target 加兹鲁维
>>与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .accept 887 >>接受任务 南海海盗
step
    .goto The Barrens,63.1,37.1
    .fp Ratchet >> 获取棘齿城飞行点
step
    .goto The Barrens,63.0,37.2
.target 斯布特瓦夫
>>与|cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .accept 894 >>接受任务 什么什么平衡器
step
    >>点击通缉告示。如有需要，也可以在这里使用银行
    .goto The Barrens,62.6,37.5
    .accept 895 >>接受任务 通缉：巴隆·朗绍尔
step
    .goto The Barrens,62.4,37.7
.target 麦伯克·米希瑞克斯
>>与|cRXP_FRIENDLY_麦伯克·米希瑞克斯|r交谈
    .accept 865 >>接受任务 迅猛龙角
step
    .goto The Barrens,62.3,38.4
>>与|cRXP_FRIENDLY_酿酒师德罗恩|r交谈
    .turnin 819 >>交任务 老陈的空酒桶
.target 酿酒师德罗恩
    .accept 821 >>接受任务 老陈的空酒桶
step
    #sticky
    #label Southsea
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
    .goto The Barrens,62.6,49.7,40,0
    >>击杀巴隆·朗绍尔，拾取他的头颅
    .complete 895,1 --Baron Longshore's Head (1)
step
    #requires Southsea
    .goto The Barrens,62.7,36.3
>>与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .turnin 887 >>交任务  南海海盗
.target 加兹鲁维
    .accept 890 >>接受任务 丢失的货物
    .turnin 895 >>交任务 通缉：巴隆·朗绍尔
step
    .goto The Barrens,63.3,38.4
>>与|cRXP_FRIENDLY_码头管理员迪兹维格|r交谈
    .turnin 1492 >>交任务码头管理员迪兹维格
    .turnin 890 >>交任务  丢失的货物
.target 码头管理员迪兹维格
    .accept 892 >>接受任务 丢失的货物
    .accept 896 >>接受任务 矿工的宝贝
step
    .goto The Barrens,62.7,36.3
>>与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .turnin 892 >>交任务  丢失的货物
.target 加兹鲁维
    .accept 888 >>接受任务 被窃的货物
step
    .goto The Barrens,63.08,37.16
    .fly Crossroads >> 飞往十字路口
step
    .goto The Barrens,51.5,30.8
.target 索克
>>与|cRXP_FRIENDLY_索克|r交谈
    .turnin 5041 >>交任务  十字路口的补给品
    .turnin 872 >>交任务 野猪人的头目
step
    .goto The Barrens,52.2,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 845 >>交任务  斑马的威胁
.target 瑟格拉·黑棘
    .accept 903 >>接受任务 草原上的徘徊者
step
    #sticky
    #completewith next
    >>击杀陆行鸟。拾取它们的肾脏
    .complete 821,2 --Plainstrider Kidney (5)
step
    #label RegtharDeathgate1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 交谈
    .accept 850 >>接任务：科卡尔首领
    .accept 855 >> 接任务：半人马护腕
    .target 雷戈萨·死门
step
    #completewith KodobaneTurnin
    >>击杀|cRXP_ENEMY_科卡尔牧民|r和|cRXP_ENEMY_科卡尔召雷师|r，拾取它们的|cRXP_LOOT_护腕|r
    >>|cRXP_WARN_现在不必完成这个任务|r
    .complete 855,1 --Centaur Bracers (15)
    .mob 科卡尔牧民
    .mob 科卡尔召雷师
step
    #completewith Barak
    >>在遗忘之池周围采集|cRXP_LOOT_丰满的蘑菇|r
    >>|cRXP_WARN_现在不必完成这个任务|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    .goto The Barrens,45.06,22.54
    >>潜入水中，前往|cRXP_PICK_冒泡的裂隙|r
    .complete 870,1 --Explore the waters of the Forgotten Pools
step
    #label Barak
    .goto The Barrens,42.82,23.52
    >>击杀|cRXP_ENEMY_巴拉克·科多班恩|r，拾取他的|cRXP_LOOT_头颅|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_巴拉克·科多班恩|r的近战攻击伤害很高，而且有一名|cRXP_ENEMY_科卡尔牧民|r保护他。它们会用网困住你，并从远处射击|r
    .complete 850,1 --Kodobane's Head (1)
    .mob 巴拉克·科多班恩
step
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨|r交谈
    .turnin 850 >>交任务  科卡尔首领
    .accept 851 >>接受任务 狂热的维罗戈
    .turnin 855 >>交任务  半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855
step
    #label KodobaneTurnin
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨|r交谈
    .turnin 850 >>交任务  科卡尔首领
    .accept 851 >>接受任务 狂热的维罗戈
    .target 雷戈萨·死门
step
    #sticky
    #completewith Claws
    >>沿途击杀迅猛龙并拾取头颅；剩余的稍后再收集
    .complete 869,1 --Raptor Head (12)
step
    #sticky
    #completewith next
    .goto The Barrens,41.4,24.5,40,0
    .goto The Barrens,40.4,20.0,40,0
    .goto The Barrens,41.4,24.5,40,0
    .goto The Barrens,40.4,20.0,40,0
	>>现在不必收集齐所有物品
    .complete 821,1 --Savannah Lion Tusk (5)
step
    #label Claws
    >>击杀草原徘徊者，拾取它们的爪子和獠牙
    .goto The Barrens,41.4,24.5
    .complete 903,1 --Prowler Claws (7)
step
    .goto The Barrens,40.2,18.9,40,0
    .goto The Barrens,40.7,14.6,40,0
    .goto The Barrens,42.6,15.1,40,0
    .goto The Barrens,40.2,18.9,40,0
    .goto The Barrens,40.7,14.6,40,0
    .goto The Barrens,42.6,15.1,40,0
    >>击杀鹰身人，拾取它们的利爪
    .complete 867,1 --Witchwing Talon (8)
step
    #completewith next
    .goto The Barrens,43.8,12.2
    >> 如果仍未获得重型尖刺钉锤，可考虑向弗朗恩·凝血购买 << Druid/Warrior
    .vendor >> 需要时向这名商人出售杂物
step
    #sticky
    #completewith next
    >>击杀陆行鸟。拾取它们的肾脏
    .complete 821,2 --Plainstrider Kidney (5)
step
    .goto The Barrens,54.3,12.3,40,0
    .goto The Barrens,54.6,16.7,40,0
    .goto The Barrens,42.6,15.1,40,0
    .goto The Barrens,54.3,12.3,40,0
    .goto The Barrens,54.6,16.7,40,0
    .goto The Barrens,42.6,15.1,40,0
    >>击杀迅猛龙，拾取它们的头颅
    .complete 869,1 --Raptor Head (12)
step
    >>点击控制台
    .goto The Barrens,52.4,11.6
    .turnin 894 >>交任务  什么什么平衡器
    .accept 900 >>接受任务 什么什么平衡器
step
    >>点击阀门
    .goto The Barrens,52.4,11.4
    .complete 900,2 --Shut off Fuel Control Valve (1)
step
    >>点击阀门。点击任意一个阀门都会刷出怪物
    .goto The Barrens,52.3,11.4
    .complete 900,3 --Shut off Regulator Valve (1)
    .goto The Barrens,52.3,11.6
    .complete 900,1 --Shut off Main Control Valve (1)
step
    >>点击控制台
    .goto The Barrens,52.4,11.6
    .turnin 900 >>交任务  什么什么平衡器
    .accept 901 >>接受任务 什么什么平衡器
step
    >>击杀建筑物内的工匠斯尼格斯。拾取他的控制台钥匙
    .goto The Barrens,52.8,10.4
    .complete 901,1 --Console Key (1)
step
    .goto The Barrens,52.4,11.6
    .turnin 901 >>交任务  什么什么平衡器
    .accept 902 >>接受任务 什么什么平衡器
step
    >>从伐木机处接取“打火钥匙”任务
    .goto The Barrens,56.5,7.5
.target 维兹克兰克的伐木机
>>与|cRXP_FRIENDLY_维兹克兰克的伐木机|r交谈
    .accept 858 >>接受任务 打火钥匙
step
    >>在这里刷怪升到 16 级很重要，因为接下来的 3 个任务很难。
	.xp 16 >> 刷怪到 16 级
step
    >>击杀鲁格维兹主管（他在塔内各层巡逻），拾取打火钥匙
	.goto The Barrens,56.3,8.6
    .complete 858,1 --Ignition Key (1)
step
    >>这会开始护送任务
    .goto The Barrens,56.5,7.5
>>与|cRXP_FRIENDLY_维兹克兰克的伐木机|r交谈
    .turnin 858 >>交任务 打火钥匙
.target 维兹克兰克的伐木机
    .accept 863 >>接受任务 逃跑
step
    #label Slugs
    >>途中会出现 2 只怪物。击杀它们，然后等待他最后的剧情结束
    .goto The Barrens,55.3,7.8
    .complete 863,1 --Escort Wizzlecrank out of the Venture Co. drill site (1)
step
    >>在此区域刷怪，直到打到猫眼翡翠为止
    .goto The Barrens,61.5,4.3
    .complete 896,1 -- Cats Eye Emerald (1)
step
    #completewith next
	.goto Orgrimmar,11.5,67.0,40 >>跑到奥格瑞玛西侧入口
step
    .goto Orgrimmar,38.79,85.68
    .trainer >> 学习职业技能
step << Troll Mage
    .goto Orgrimmar,54.2,68.6
>>与|cRXP_FRIENDLY_旅店老板格雷什卡|r交谈
    .turnin 6384 >>交任务 飞往奥格瑞玛
.target 旅店老板格雷什卡
    .accept 6385 >>接受任务 双足飞龙管理员多拉斯
step
    >>跑到飞行管理员处。不要乘坐航班
    .goto Orgrimmar,45.120,63.889
    .fp Orgrimmar >> 开通奥格瑞玛飞行点 << Undead
>>与|cRXP_FRIENDLY_多拉斯|r交谈
    .turnin 6385 >>交任务：双足飞龙管理员多拉斯 << Troll Mage
.target 多拉斯
    .accept 6386 >>接任务：返回十字路口 << Troll Mage
step
    >>前往格罗玛什要塞
    .goto Orgrimmar,39.1,38.1
.target 佐尔·孤树
>>与|cRXP_FRIENDLY_佐尔·孤树|r交谈
    .accept 1061 >>接受任务石爪之灵
step
    #completewith next
    .hs >>使用炉石返回十字路口
step << Troll Mage
    .goto The Barrens,52.6,29.9
.target 扎尔夫
>>与|cRXP_FRIENDLY_扎尔夫|r交谈
    .turnin 6386 >>交任务 返回十字路口
step
    .goto The Barrens,51.9,30.3
>>与|cRXP_FRIENDLY_加兹罗格|r交谈
    .turnin 869 >>交任务  偷钱的迅猛龙
.target 加兹罗格
    .accept 3281 >>接受任务 被偷走的银币
step
    .goto The Barrens,52.3,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 903 >>交任务 草原上的徘徊者
.target 瑟格拉·黑棘
    .accept 881 >>接受任务 埃其亚基
step
    >>使用背包中的埃其亚基的号角召唤埃其亚基。击杀它并拾取它的皮
    .goto The Barrens,55.5,17.3
    .complete 881,1 --Echeyakee's Hide (1)
step
    .goto The Barrens,52.2,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 881 >>交任务  埃其亚基
.target 瑟格拉·黑棘
    .accept 905 >>接受任务 狂暴的镰爪龙
step
    .goto The Barrens,52.20,31.90
>>对话 |cRXP_FRIENDLY_图加·符文图腾|r
    .turnin 870 >> 交任务：遗忘之池
.target 图加·符文图腾
    .accept 877 >> 接任务：死水绿洲
step
    .goto The Barrens,52.00,31.60
.target 曼科里克
>>与 |cRXP_FRIENDLY_曼科里克|r 交谈
    .accept 899 >> 接任务：复仇的怒火
    .accept 4921 >> 接任务：在战斗中失踪
step
    >>塔顶
    .goto The Barrens,51.6,30.9
>>与|cRXP_FRIENDLY_达索克·快刀|r交谈
    .turnin 867 >>交任务  鹰身强盗
.target 达索克·快刀
    .accept 875 >>接受任务 鹰身人首领
step
    .goto The Barrens,51.50,30.20
.target 药剂师赫布瑞姆
>>对话 |cRXP_FRIENDLY_药剂师赫布瑞姆|r
    .turnin 848 >> 交任务：菌类孢子
step
    .goto The Barrens,51.5,30.3
    .fly Ratchet >>飞往棘齿城
step
    .goto The Barrens,63.0,37.2
>>对话 |cRXP_FRIENDLY_斯布特瓦夫|r
    .turnin 902 >>交任务  什么什么平衡器
    .turnin 863 >> 交任务：逃跑
.target 斯布特瓦夫
    .accept 1483 >> 接任务：菲兹克斯
step
    .goto The Barrens,63.30,38.40
.target 码头管理员迪兹维格
>>对话 |cRXP_FRIENDLY_码头管理员迪兹维格|r
    .turnin 896 >> 交任务：矿工的宝贝
step
    .goto The Barrens,62.40,37.70
.target 麦伯克·米希瑞克斯
>>对话 |cRXP_FRIENDLY_麦伯克·米希瑞克斯|r
    .accept 1069 >> 接任务：深苔蜘蛛的卵
step
    >>打开箱子并拾取物品
    .goto The Barrens,63.6,49.2
    .complete 888,2 --Telescopic Lens (1)
step
    >>打开箱子，拾取一箱靴子
    .goto The Barrens,62.6,49.6
    .complete 888,1 --Shipment of Boots (1)
step
    #sticky
    #completewith Nest
    >>击杀沿途的迅猛龙，拾取它们的角和羽毛。小心它们会使用痛击
    .complete 865,1 --Intact Raptor Horn (5)
step
    >>打开箱子，拾取被偷走的银币
    >>保留获得的赤鳞迅猛龙的羽毛，稍后要用
    .goto The Barrens,57.4,52.4,90,0
    .goto The Barrens,58.0,53.9
    .complete 3281,1 --Stolen Silver (1)
step
    #completewith Verog
    >>在死水绿洲周围采集|cRXP_LOOT_丰满的蘑菇|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    >>在水下点击冒泡的裂隙
    .goto The Barrens,55.6,42.7
    .complete 877,1 --Test the Dried Seeds (1)
step
    #sticky
	#completewith next
    >>击杀半人马。拾取它们的护腕
    .complete 855,1 --Centaur Bracers (15)
step
    #label Verog
    >> 击杀湖边的半人马，直到维罗戈出现；刷新时聊天框会出现喊话
    .goto The Barrens,52.95,41.77
    .complete 851,1 --Verog's Head (1)
step
#loop
	.line The Barrens,55.72,42.14,55.49,41.75,55.09,41.58,55.03,42.24,55.27,43.17,55.78,43.47,56.15,43.28,56.08,42.58,55.72,42.14
	.goto The Barrens,55.72,42.14,25,0
	.goto The Barrens,55.49,41.75,25,0
	.goto The Barrens,55.09,41.58,25,0
	.goto The Barrens,55.03,42.24,25,0
	.goto The Barrens,55.27,43.17,25,0
	.goto The Barrens,55.78,43.47,25,0
	.goto The Barrens,56.15,43.28,25,0
	.goto The Barrens,56.08,42.58,25,0
	.goto The Barrens,55.72,42.14,25,0
    >>在死水绿洲周围采集|cRXP_LOOT_丰满的蘑菇|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    >>点击巢中的蛋；需要使用从赤鳞迅猛龙身上获得的羽毛
    .goto The Barrens,52.6,46.2
    .complete 905,1 --Visit Blue Raptor Nest (1)
step
    >>点击巢中的蛋；需要使用从赤鳞迅猛龙身上获得的羽毛
    .goto The Barrens,52.5,46.6
    .complete 905,3 --Visit Red Raptor Nest (1)
step
    #label Nest
    >>点击巢中的蛋；需要使用从赤鳞迅猛龙身上获得的羽毛
    .goto The Barrens,52.0,46.5
    .complete 905,2 --Visit Yellow Raptor Nest (1)
step
    .goto The Barrens,57.3,53.7,40,0
    .goto The Barrens,52.0,46.5,40,0
    .goto The Barrens,57.3,53.7,40,0
    .goto The Barrens,52.0,46.5,40,0
    .goto The Barrens,57.3,53.7,40,0
    .goto The Barrens,52.0,46.5,40,0
    .goto The Barrens,57.3,53.7,40,0
    .goto The Barrens,52.0,46.5,40,0
    >>继续击杀迅猛龙，拾取它们的角
    .complete 865,1 --Intact Raptor Horn (5)
step
    >>找到曼科里克的妻子并与其交互
    .goto The Barrens,49.3,50.4
    .complete 4921,1 --Find Mankrik's Wife (1)
step
    .goto The Barrens,45.6,59.0
    .home >>将炉石设在陶拉祖营地
step
    .goto The Barrens,44.5,59.2
.target 碎牙
>>与|cRXP_FRIENDLY_碎牙|r交谈
    .accept 878 >>接受任务野猪人的内战
step
    .goto The Barrens,44.5,59.2
    .fp Camp Taurajo >> 开通陶拉祖营地飞行点
    .fly Crossroads >>飞往十字路口
step
    .goto The Barrens,51.9,30.3
.target 加兹罗格
>>与|cRXP_FRIENDLY_加兹罗格|r交谈
    .turnin 3281 >>交任务  被偷走的银币
step
    .goto The Barrens,52.2,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 905 >>交任务 狂暴的镰爪龙
.target 瑟格拉·黑棘
    .accept 3261 >>接受任务 乔恩·星眼
step
    .goto The Barrens,52.2,31.9
>>与|cRXP_FRIENDLY_图加·符文图腾|r交谈
    .turnin 877 >>交任务 死水绿洲
.target 图加·符文图腾
    .accept 880 >>接受任务 变异的生物
step
    .goto The Barrens,52.0,31.6
.target 曼科里克
>>与|cRXP_FRIENDLY_曼科里克|r交谈
    .turnin 4921 >>交任务在战斗中失踪
step
    #sticky
	#completewith next
    >>击杀陆行鸟。拾取它们的肾脏
    .complete 821,2 --Plainstrider Kidney (5)
step
    .goto The Barrens,45.39,28.43
>>与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 851 >>交任务  狂热的维罗戈
.target 雷戈萨·死门
    .accept 852 >>接受任务 赫兹鲁尔·血印
step
    .goto The Barrens,45.39,28.43
.target 雷戈萨·死门
>>对话 |cRXP_FRIENDLY_雷戈萨·死门|r
    .turnin 855 >> 交任务  半人马护腕
    .isQuestComplete 855
step
    #sticky
	#label CeBracers
    >>击杀半人马。拾取它们的护腕
    .complete 855,1 --Centaur Bracers (15)
step
    .goto The Barrens,45.87,40.80
    >> 赫兹鲁尔会在哀嚎洞穴附近的大湖周围巡逻
    .complete 852,1 --Hezrul's Head (1)
step
	#requires CeBracers
	.goto The Barrens,45.37,28.43
.target 雷戈萨·死门
>>对话 |cRXP_FRIENDLY_雷戈萨·死门|r
    .turnin 852 >>交任务：赫兹鲁尔·血印
    .turnin 855 >> 交任务  半人马护腕
step
    .goto The Barrens,45.37,28.43
.target 雷戈萨·死门
>>与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .accept 4021 >>接受任务 人马无双！
step
    >> 这项任务单人完成较难。尽量组队；若无人组队，可将目标引到任务发布者附近的建筑旁风筝
    >> 如果难度太高, 就跳过这一步
    .goto The Barrens,44.33,28.14
    .complete 4021,1 --Piece of Krom'zar's Banner (1)
--N Link to safespot abuse
step
    .isQuestComplete 4021
    .goto The Barrens,45.39,28.44
.target 雷戈萨·死门
>>与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 4021 >>交任务  人马无双！
step
    .goto The Barrens,39.8,17.3,80,0
    .goto The Barrens,37.4,15.8,80,0
    .goto The Barrens,40.3,15.2,80,0
    .goto The Barrens,39.8,17.3,80,0
    .goto The Barrens,37.4,15.8,80,0
    .goto The Barrens,40.3,15.2,80,0
    .goto The Barrens,39.8,17.3,80,0
    .goto The Barrens,37.4,15.8,80,0
    .goto The Barrens,40.3,15.2,80,0
    .goto The Barrens,39.8,17.3
    >>击杀巫翼杀戮者。拾取它们的鹰身人首领之戒
    .complete 875,1 --Harpy Lieutenant Ring (6)
step
    .goto The Barrens,41.4,24.5
    >>击杀该区域内的草原徘徊者。拾取它们的獠牙
    .complete 821,1 --Savannah Lion Tusk (5)
step
    .goto The Barrens,35.3,27.9
>>与|cRXP_FRIENDLY_希雷斯·碎石|r交谈
    .turnin 1061 >> 交任务：石爪之灵
.target 希雷斯·碎石
    .accept 1062 >> 接任务：地精侵略者
.target 玛卡巴·扁蹄
>>与|cRXP_FRIENDLY_玛卡巴·扁蹄|r交谈
    .accept 6548 >> 接任务：为我的村庄复仇
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 部落法师 AoE
#classic
#tbc
<< Horde Mage
#name 17-21 Stonetalon/Barrens AoE
#version 1
#group RestedXP Horde Mage AoE
#subgroupdisplayname RestedXP 部落法师 AoE
#defaultfor Horde Mage
#next 21-30 Silverpine/Hillsbrad AoE
#displayname 17-21 石爪山脉/贫瘠之地 AoE
step
    .goto Stonetalon Mountains,80.7,89.2,50,0
    .goto Stonetalon Mountains,82.0,86.0,50,0
    .goto Stonetalon Mountains,84.7,84.3,50,0
    .goto Stonetalon Mountains,82.3,90.0,50,0
    .goto Stonetalon Mountains,80.7,89.2,50,0
    .goto Stonetalon Mountains,82.0,86.0,50,0
    .goto Stonetalon Mountains,84.7,84.3,50,0
    .goto Stonetalon Mountains,82.3,90.0,50,0
    >>击杀该区域的恐怖图腾成员
    .complete 6548,2 --Kill Grimtotem Mercenary (x6)
    .complete 6548,1 --Kill Grimtotem Ruffian (x8)
step
    .goto The Barrens,35.191,27.791
>>与 |cRXP_FRIENDLY_玛卡巴·扁蹄|r 交谈
    .turnin 6548 >> 交任务: 为我的村庄复仇
.target 玛卡巴·扁蹄
    .accept 6629 >> 接任务: 杀死格鲁迪格·暗云
step
    >>沿西边的小路进入村庄。先杀完6名蛮兵，再开始村内的任务。在主帐篷前击杀格鲁迪格
    .goto Stonetalon Mountains,71.7,86.7,60,0
    .goto Stonetalon Mountains,74.0,86.2
    .complete 6629,1 --Kill Grundig Darkcloud (x1)
    .complete 6629,2 --Kill Grimtotem Brute (x6)
step
    >>开始护送卡雅
    .goto Stonetalon Mountains,73.5,85.8
.target 卡雅·扁蹄
>>与 |cRXP_FRIENDLY_卡雅·扁蹄|r 交谈
    .accept 6523 >> 接任务: 保护卡雅
step
     >>护送卡雅，紧跟着她。篝火旁会出现3名恐怖图腾成员。在她抵达营地前吃喝恢复
    .goto Stonetalon Mountains,75.8,91.4
    .complete 6523,1 --Kaya Escorted to Camp Aparaje
step
    .goto Stonetalon Mountains,71.4,95.1
.target 辛吉拉
>>与 |cRXP_FRIENDLY_辛吉拉|r 交谈
    .accept 6461 >> 接任务: 盗窃的蜘蛛
step
    #sticky
    #label deepmossegg
    >>点击树木附近的蜘蛛卵
    .complete 1069,1 --Collect Deepmoss Egg (x15)
step
    >>击杀该区域的深苔蜘蛛
    .goto Stonetalon Mountains,57.5,76.2,60,0
    .goto Stonetalon Mountains,54.7,71.9,60,0
    .goto Stonetalon Mountains,52.6,71.8,60,0
    .goto Stonetalon Mountains,52.2,75.6,60,0
    .goto Stonetalon Mountains,53.9,74.2,60,0
    .goto Stonetalon Mountains,54.7,71.9,60,0
    .goto Stonetalon Mountains,52.6,71.8,60,0
    .goto Stonetalon Mountains,52.2,75.6,60,0
    .goto Stonetalon Mountains,53.9,74.2,60,0
    .goto Stonetalon Mountains,54.7,71.9
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .complete 6461,2 --Kill Deepmoss Venomspitter (x7)
step
    .goto Stonetalon Mountains,58.989,62.599
>>与 |cRXP_FRIENDLY_菲兹克斯|r 交谈
    .turnin 1483 >> 交任务: 菲兹克斯
.target 菲兹克斯
    .accept 1093 >> 接任务: 超级收割机6000
step
    #sticky
    #requires deepmossegg
    #completewith next
    >>一边寻找操作员获取设计图，一边击杀风险投资公司樵夫
    .complete 1062,1 --Kill Venture Co. Logger (x15)
step
    #requires deepmossegg
    >>击杀风险投资公司操作员，直到获得蓝图
    .goto Stonetalon Mountains,62.8,53.7,40,0
    .goto Stonetalon Mountains,61.7,51.5,40,0
    .goto Stonetalon Mountains,66.8,45.3,40,0
    .goto Stonetalon Mountains,71.7,49.9,40,0
    .goto Stonetalon Mountains,74.3,54.7,40,0
    .goto Stonetalon Mountains,62.8,53.7,40,0
    .complete 1093,1 --Collect Super Reaper 6000 Blueprints (x1)
step
    >>击杀剩余的风险投资公司樵夫
    .goto Stonetalon Mountains,64.1,56.7,40,0
    .goto Stonetalon Mountains,73.4,54.3,40,0
    .goto Stonetalon Mountains,64.1,56.7,40,0
    .goto Stonetalon Mountains,73.4,54.3,40,0
    .goto Stonetalon Mountains,64.1,56.7,40,0
    .goto Stonetalon Mountains,73.4,54.3,40,0
    .goto Stonetalon Mountains,64.1,56.7,40,0
    .goto Stonetalon Mountains,73.4,54.3,40,0
    .complete 1062,1 --Kill Venture Co. Logger (x15)
step
    .goto Stonetalon Mountains,58.989,62.599
>>与 |cRXP_FRIENDLY_菲兹克斯|r 交谈
    .turnin 1093 >> 交任务: 超级收割机6000
.target 菲兹克斯
    .accept 1094 >> 接任务: 新的指示
step
    .hs >> 炉石回陶拉祖营地
step
    .goto The Barrens,44.9,59.1
>>与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 3261 >>交任务 乔恩·星眼
.target 乔恩·星眼
    .accept 882 >>接受任务 伊沙姆哈尔
step
    #sticky
    #label Lizard
    >>击杀雷角蜥蜴，拾取它们的角
    .complete 821,3 --Thunder Lizard Horn (1)
step
	#sticky
	#label Lakota1
	#completewith next
	.goto The Barrens,50.0,53.1,0
    .goto The Barrens,46.0,49.2,0
    .goto The Barrens,45.3,52.5,0
    .goto The Barrens,45.0,51.8,0
	>>在该区域寻找并击杀拉克塔曼尼（灰色科多兽），拾取它的蹄子。找不到它就跳过此任务
	.collect 5099,1,883 --Collect Hoof of Lakota'Mani
	.accept 883 >>接受任务 拉克塔曼尼
step
    >>大量击杀野猪人，拾取它们的獠牙。保留获得的血岩碎片
	.goto The Barrens,44.3,52.3,50,0
    .goto The Barrens,47.1,53.3,50,0
    .goto The Barrens,45.2,54.3,50,0
	.goto The Barrens,44.3,52.3,50,0
    .goto The Barrens,47.1,53.3,50,0
    .goto The Barrens,45.2,54.3,50,0
	.goto The Barrens,44.3,52.3,50,0
    .goto The Barrens,47.1,53.3,50,0
    .goto The Barrens,45.2,54.3,50,0
	.goto The Barrens,44.3,52.3,50,0
    .goto The Barrens,47.1,53.3,50,0
    .goto The Barrens,45.2,54.3,50,0
	.complete 878,1 --Kill Bristleback Water Seeker (x6)
    .complete 878,2 --Kill Bristleback Thornweaver (x12)
    .complete 878,3 --Kill Bristleback Geomancer (x12)
    .complete 899,1 --Collect Bristleback Quilboar Tusk (x60)
step
    #sticky
    #completewith Ishamuhale
    >>击杀平原陆行鸟，拾取它们的肾脏
    .complete 821,2 --Plainstrider Kidney (5)
step
    #requires Lizard
    >>绕湖使用范围攻击击杀绿洲钳嘴龟，拾取变异的钳嘴龟壳
	.goto The Barrens,55.5,42.6
    .complete 880,1 --Altered Snapjaw Shell (8)
step
   #completewith next
	>>在该区域内击杀一只斑马。拾取新鲜的斑马肉
	.goto The Barrens,61.0,32.2
	.collect 10338,1 --Collect Fresh Zhevra Carcass
step
	#label Ishamuhale
    >>在枯树旁使用新鲜的斑马肉，召唤伊沙姆哈尔。击杀它并拾取牙齿
	.goto The Barrens,59.9,30.4
    .complete 882,1 --Ishamuhale's Fang (1)
step
    >>击杀平原陆行鸟，拾取它们的肾脏
    .complete 821,2 --Plainstrider Kidney (5)
step
	.goto The Barrens,62.7,36.3
    >>跑回棘齿城
.target 加兹鲁维
>>与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .turnin 888 >>交任务  被窃的货物
step
    .goto The Barrens,63.0,37.2
>>与|cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .turnin 1094 >>交任务 新的指示
.target 斯布特瓦夫
    .accept 1095 >>接受任务 新的指示
step
    .goto The Barrens,62.4,37.6
.target 麦伯克·米希瑞克斯
>>与|cRXP_FRIENDLY_麦伯克·米希瑞克斯|r交谈
    .turnin 865 >>交任务 迅猛龙角
    .turnin 1069 >>交任务深苔蜘蛛的卵
step
    .goto The Barrens,62.3,38.4
.target 酿酒师德罗恩
>>与|cRXP_FRIENDLY_酿酒师德罗恩|r交谈
    .turnin 821 >>交任务 老陈的空酒桶
step
    .goto The Barrens,63.1,37.1
    .fly Crossroads >>飞往十字路口
step
    .goto The Barrens,52.2,31.9
>>与|cRXP_FRIENDLY_图加·符文图腾|r交谈
    .turnin 880 >>交任务  变异的生物
.target 图加·符文图腾
    .accept 1489 >>接受任务 哈缪尔·符文图腾
    .accept 3301 >>接受任务茉拉·符文图腾
step
    .goto The Barrens,52.0,31.6
.target 曼科里克
>>与|cRXP_FRIENDLY_曼科里克|r交谈
    .turnin 899 >>交任务复仇的怒火
step
    >>塔顶
    .goto The Barrens,51.60,30.90
>>与 |cRXP_FRIENDLY_达索克·快刀|r 交谈
    .turnin 875 >> 交任务: 鹰身人首领
.target 达索克·快刀
    .accept 876 >> 接任务: 塞瑞娜·血羽
step
    >>这会开始一个限时任务
    .goto The Barrens,51.4,30.2
>>与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    .turnin 848 >>交任务 菌类孢子
.target 药剂师赫布瑞姆
    .accept 853 >>接受任务药剂师扎玛
step
    .goto The Barrens,51.5,30.3
    .fly Camp Taurajo >>飞往陶拉祖营地
step
    .goto The Barrens,53.0,52.1
    >>击杀野猪人，获取一块血岩碎片
    .collect 5075 --Blood Shard (1)
step
    .goto The Barrens,44.6,59.2
>>与|cRXP_FRIENDLY_碎牙|r交谈
    .turnin 878 >>交任务野猪人的内战
.target 碎牙
    .accept 5052 >>接受任务阿迦玛甘的血岩碎片
    .turnin 5052 >>交任务阿迦玛甘的血岩碎片
--N Different classes needing different buffs, e.g. need speed buff later for Mulgore run for classes that didnt get FP earlier
step
    .goto The Barrens,44.8,59.1
>>与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 882 >>交任务  伊沙姆哈尔
.target 乔恩·星眼
    .accept 907 >>接受任务 被激怒的雷霆蜥蜴
    .accept 1130 >>接受任务 梅洛的关注
step
    .goto The Barrens,44.8,59.1
    .isOnQuest 883
.target 乔恩·星眼
>>与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 883 >>交任务拉克塔曼尼
step
    #sticky
    #label Owatanka2
    #completewith next
    .goto The Barrens,44.2,62.1,0
    .goto The Barrens,49.2,62.6,0
    .goto The Barrens,49.6,60.0,0
    >>在该区域寻找奥瓦坦卡（蓝色雷霆蜥蜴）。找到后拾取它的尾刺并接取任务。如果找不到，就跳过此任务
    .collect 5102,1,884 --Collect Owatanka's Tailspike
    .accept 884 >>接受任务 奥瓦坦卡
step
    .goto The Barrens,42.5,60.3,30,0
    .goto The Barrens,47.1,63.7,30,0
    .goto The Barrens,50.0,61.1,30,0
    >>击杀雷霆蜥蜴。拾取它们的血液
    .complete 907,1 --Thunder Lizard Blood (3)
step
    .goto The Barrens,44.9,59.1
>>与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 907 >>交任务  被激怒的雷霆蜥蜴
.target 乔恩·星眼
    .accept 913 >>接受任务 雷鹰的嘶鸣
step
    .goto The Barrens,44.9,59.1
.target 乔恩·星眼
>>与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 884 >>交任务奥瓦坦卡
    .isOnQuest 884
step
    .goto The Barrens,44.8,63.2,30,0
    .goto The Barrens,47.0,61.6,30,0
    .goto The Barrens,44.8,63.2,30,0
    .goto The Barrens,47.0,61.6,30,0
    .goto The Barrens,44.8,63.2,30,0
    .goto The Barrens,47.0,61.6,30,0
    >>击杀一只雷鹰。拾取它的翅膀
    .complete 913,1 --Thunderhawk Wings (1)
step
    .goto The Barrens,44.8,59.1
.target 乔恩·星眼
>>与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 913 >>交任务 雷鹰的嘶鸣
--    .accept 874 >>Accept Mahren Skyseer
step
    #completewith next
    .goto The Barrens,44.54,59.27
    >>把血岩碎片交给碎牙，获得风之魂增益效果。如果不慎卖掉了碎片，就跳过这一步
.target 碎牙
>>与 |cRXP_FRIENDLY_碎牙|r 交谈
    .turnin 889 >> 交任务: 风之魂
step
    .goto Thunder Bluff,32.0,66.9,60 >>跑到升降梯处，乘坐升降梯进入雷霆崖
step
    .goto Thunder Bluff,45.814,64.711
    .home >>将炉石设为雷霆崖
step
    .goto Thunder Bluff,61.538,80.919
>>与|cRXP_FRIENDLY_梅洛·石蹄|r交谈
    .turnin 1130 >>交任务 梅洛的关注
.target 梅洛·石蹄
    .accept 1131 >>接受任务 钢齿土狼
step
 	>>进入预见之池
	.goto Thunder Bluff,30.1,30.0,30,0
	.goto Thunder Bluff,23.00,21.00
.target 药剂师扎玛
>>与 |cRXP_FRIENDLY_药剂师扎玛|r 交谈
    .turnin 853 >> 交任务: 药剂师扎玛
step
    .goto Thunder Bluff,25.16,20.95
    .trainer >> 学习职业技能
	>>暂时不要洗成AoE天赋（如果你此前选了火焰天赋）
step
    .goto Thunder Bluff,28.4,27.7
.target 克拉莉斯·弗斯特
>>与|cRXP_FRIENDLY_克拉莉斯·弗斯特|r交谈
    .accept 264 >>接受任务 至死方休
step
	.goto Thunder Bluff,47.003,49.832
    .fp Thunder Bluff >> 获取雷霆崖飞行点
    .fly Crossroads >>飞往十字路口
step
    >>击杀塞瑞娜·血羽。拾取她的头颅
	.goto The Barrens,39.2,12.2
    .complete 876,1 --Serena's Head (1)
step
    .goto The Barrens,35.3,27.9
>>与|cRXP_FRIENDLY_希雷斯·碎石|r交谈
    .turnin 1062 >>交任务地精侵略者
>>与|cRXP_FRIENDLY_玛卡巴·扁蹄|r交谈
    .turnin 6629 >>交任务杀死格鲁迪格·暗云
    .turnin 6523 >>交任务保护卡雅
.target 玛卡巴·扁蹄
    .accept 6401 >>接受任务卡雅还活着
.target 希雷斯·碎石
    .accept 1063 >>接受任务 长者
--    .accept 1068 >> Accept Shredding Machines
step
    .goto Stonetalon Mountains,71.3,95.1
.target 辛吉拉
>>与|cRXP_FRIENDLY_辛吉拉|r交谈
    .turnin 6461 >>交任务盗窃的蜘蛛
step
    .goto Stonetalon Mountains,58.989,62.599
.target 菲兹克斯
>>与|cRXP_FRIENDLY_菲兹克斯|r交谈
    .turnin 1095 >>交任务 新的指示
step
    .goto Stonetalon Mountains,47.5,58.4
.target 塔姆拉·荒原
>>与|cRXP_FRIENDLY_塔姆拉·荒原|r交谈
    .turnin 6401 >>交任务 卡雅还活着
step
    .goto Stonetalon Mountains,45.12,59.84
    .fp Sun Rock>> 获取烈日石居飞行点
step
    #completewith next
    .hs >> 炉石回雷霆崖
step
    .goto Thunder Bluff,70.00,30.90
>>与 |cRXP_FRIENDLY_玛加萨·野性图腾|r 交谈
    .turnin 1063 >> 交任务: 长者
.target 玛加萨·野性图腾
    .accept 1064 >> 接任务: 被遗忘者的援助
step
    .goto Thunder Bluff,78.62,28.56
>>与 |cRXP_FRIENDLY_大德鲁伊哈缪尔·符文图腾|r 交谈
    .turnin 1489 >> 交任务: 哈缪尔·符文图腾
.target 大德鲁伊哈缪尔·符文图腾
    .accept 1490 >> 接任务: 纳拉·蛮鬃
step
    .goto Thunder Bluff,75.65,31.62
.target 纳拉·蛮鬃
>>与 |cRXP_FRIENDLY_纳拉·蛮鬃|r 交谈
    .turnin 1490 >> 交任务: 纳拉·蛮鬃
step
    .goto Thunder Bluff,23.00,21.0
>>与 |cRXP_FRIENDLY_药剂师扎玛|r 交谈
    .turnin 1064 >> 交任务: 被遗忘者的援助
.target 药剂师扎玛
    .accept 1065 >> 接任务: 塔伦米尔之旅
step
    .goto Thunder Bluff,25.16,20.95
    .trainer >> 按需学习职业技能
	>>如果尚未洗天赋，改用冰霜AoE天赋
step
    .goto Thunder Bluff,46.8,50.0
    .fly The Crossroads >>飞往十字路口
step
    .goto The Barrens,51.60,30.90
	>>上楼
.target 达索克·快刀
>>与 |cRXP_FRIENDLY_达索克·快刀|r 交谈
    .turnin 876 >> 交任务: 塞瑞娜·血羽
step
    .goto The Barrens,51.50,30.34
    .fly Orgrimmar >> 飞往奥格瑞玛
]])
