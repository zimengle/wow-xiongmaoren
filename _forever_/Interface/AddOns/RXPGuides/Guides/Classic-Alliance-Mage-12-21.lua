local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 联盟法师
#classic
#tbc
<< Alliance Mage
#name 12-18 Darkshore Mage AoE
#version 1
#group RestedXP Alliance Mage
#subgroupdisplayname RestedXP 联盟法师
#defaultfor Alliance Mage
#next 18-21 Redridge Mage AoE
#displayname 12-18 黑海岸（法师 AoE）
step
    #completewith next
    .goto Darkshore,36.77,44.28
    .vendor >> 找 [莱尔德] (鱼贩) 购买廉价的、需要 5 级的食物
step
    >>上楼到顶层
    .goto Darkshore,36.98,44.14
.target 维兹班恩·曲针
>>与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >>接受任务 传声盒827号
step
    >>跳到第1层
    .goto Darkshore,37.04,44.13
    .home >> 将你的炉石设置为奥伯丁
step
    .goto Darkshore,37.32,43.64
.target 巴瑞萨斯·月影
>>与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >>接受任务 洞中的蘑菇
step
    .goto Darkshore,37.68,43.38
.target 哨兵戈琳达·纳希恩
>>与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4811 >>接受任务 红色水晶
step
    .goto Darkshore,38.84,43.41
.target 萨纳瑞恩·绿树
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2118 >>接受任务 瘟疫蔓延
step
    .goto Darkshore,39.37,43.49
.target 特伦希斯
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 984 >>接受任务 熊怪的威胁
step
    .goto Darkshore,36.62,45.59
.target 温尼斯·布莱葛
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >>接受任务 搁浅的巨兽
step
    .goto Darkshore,36.34,45.58
    .fp Auberdine >> 获取奥伯丁飞行点
step
    #completewith Bear
     >> 击杀海岸沿线的海蟹
    .complete 983,1 --Crawler Leg (6)
step
    .goto Darkshore,36.38,50.88
     >> 搜寻搁浅的海洋生物，拾取海洋生物的骸骨。
    .complete 3524,1 --Sea Creature Bones (1)
step
    #sticky
    #completewith next
    >> 找到一只狂暴蓟熊，引到它后使用背包中的萨纳瑞恩的希望（紫色宝珠）
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
step
    .goto Darkshore,39.01,53.70
     >> 往熊怪营地附近走
    .complete 984,1 --Find a corrupt furbolg camp (1)
step
    #label Bear
    >> 找到一只狂暴蓟熊，引到它后使用背包中的萨纳瑞恩的希望（紫色宝珠）
    .goto Darkshore,38.47,57.92
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
step
    .goto Darkshore,36.61,54.29,150,0
    .goto Darkshore,36.10,44.42
    >> 击杀海岸沿线的海蟹
    .complete 983,1 --Crawler Leg (6)
step
    #sticky
    #completewith ReadAndy
     >> 把5份陆行鸟肉留到以后用
    .collect 5469,5,2178,1
step
    .goto Darkshore,36.66,46.26
    .turnin 983 >>交任务 传声盒827号
    .accept 1001 >>接受任务 传声盒411号
step
    .goto Darkshore,36.62,45.59
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 3524 >>交任务 搁浅的巨兽
.target 温尼斯·布莱葛
    .accept 4681 >>接受任务 搁浅的巨兽
step
    .goto Darkshore,36.73,44.06,40,0
    >>跑到码头
    .goto Darkshore,35.74,43.70
.target 塞瑞利恩·白爪
>>与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .accept 963 >>接受任务 永志不渝
step
    #sticky
    #completewith Thundris
     >> 击杀海中的黑海岸蛇颈龙
    .complete 1001,1 --Thresher Eye (3)
step
    #completewith next
    .goto Darkshore,33.70,42.45,60 >> 跑到码头, 然后在岔路口跳入水中
step
    .goto Darkshore,31.86,46.33
    >>点击水下的海龟头
    .complete 4681,1 --Sea Turtle Remains (1)
step
    .goto Darkshore,36.62,45.59
    >>返回岸边途中击杀蛇颈龙
.target 温尼斯·布莱葛
>>与 |cRXP_FRIENDLY_温尼斯·布莱葛|r 交谈
    .turnin 4681 >> 交任务: 搁浅的巨兽
step
    .goto Darkshore,38.84,43.41
>>与 |cRXP_FRIENDLY_萨纳瑞恩·绿树|r 交谈
    .turnin 2118 >> 交任务: 瘟疫蔓延
.target 萨纳瑞恩·绿树
    .accept 2138 >> 接任务: 清除疫病
step
    .goto Darkshore,39.37,43.49
>>与 |cRXP_FRIENDLY_特伦希斯|r 交谈
    .turnin 984 >> 交任务: 熊怪的威胁
.target 特伦希斯
    .accept 985 >> 接任务: 熊怪的威胁
    .accept 4761 >> 接任务: 桑迪斯·织风
step
    >> 击杀熊怪
    .goto Darkshore,39.83,56.11
    .goto Darkshore,39.74,53.76,0
    .complete 985,1 --Blackwood Pathfinder (8)
    .complete 985,2 --Blackwood Windtalker (5)
step
    .goto Darkshore,39.37,43.48
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 985 >>交任务 熊怪的威胁
.target 特伦希斯
    .accept 986 >>接受任务 丢失的主人
step
    >>上楼
    .goto Darkshore,39.04,43.55
.target 哨兵艾莉萨·星风
>>与|cRXP_FRIENDLY_哨兵艾莉萨·星风|r交谈
    .accept 965 >>接受任务 奥萨拉克斯之塔
step
    .goto Darkshore,38.11,41.16
.target 高尔博德·钢手
>>与 |cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >> 接任务: 深不可测的海洋
step
    #label Thundris
    .goto Darkshore,37.39,40.13
>>与 |cRXP_FRIENDLY_桑迪斯·织风|r 交谈
    .turnin 4761 >> 交任务: 桑迪斯·织风
.target 桑迪斯·织风
    .accept 4762 >> 接任务: 壁泉河
    .accept 954 >>接任务: 巴莎兰
    .accept 958 >>接受任务 上层精灵的工具
step
     #label Threshers
     #sticky
     >> 沿海岸游泳，击杀蛇颈龙
    .complete 1001,1 --Thresher Eye (3)
step
    .goto Darkshore,38.93,29.33,40,0
    .goto Darkshore,38.23,28.79
     >> 从船身的破洞进入第1艘船，再前往船最底层的后部
    .complete 982,1 --Silver Dawning's Lockbox (1)
step
    #requires Threshers
    .goto Darkshore,40.30,27.69,40,0
    .goto Darkshore,39.63,27.45
     >> 从船身的破洞进入第2艘船，再前往船最底层的后部
    .complete 982,2 --Mist Veil's Lockbox (1)
step
    .goto Darkshore,41.96,28.64
    .turnin 1001 >> 交任务: 传声盒411号
    .accept 1002 >> 接任务: 传声盒323号
step
    .goto Darkshore,41.94,31.47
    .accept 4723 >> 接任务: 搁浅的海洋生物
step
    .goto Felwood,27.70,10.03
>>与 |cRXP_FRIENDLY_阿斯特利安|r 交谈
    .turnin 954 >> 交任务: 巴莎兰
.target 阿斯特利安
    .accept 955 >> 接任务: 巴莎兰
step
    .goto Felwood,29.13,12.34
     >> 击杀 劣魔, 获取 耳环
    .complete 955,1 --Grell Earring (8)
step
    .goto Felwood,27.70,10.03
>>与 |cRXP_FRIENDLY_阿斯特利安|r 交谈
    .turnin 955 >> 交任务: 巴莎兰
.target 阿斯特利安
    .accept 956 >> 接任务: 巴莎兰
step
    .goto Felwood,29.60,12.52
     >> 击杀萨特，拾取远古月亮石封印
    .complete 956,1 --Ancient Moonstone Seal (1)
step
    .goto Felwood,27.70,10.03
>>与 |cRXP_FRIENDLY_阿斯特利安|r 交谈
    .turnin 956 >> 交任务: 巴莎兰
.target 阿斯特利安
    .accept 957 >> 接任务: 巴莎兰
step
    #sticky
    #completewith ReadAndy
     >> 击杀任意类型的 月夜猛虎，拾取 月夜猛虎的牙齿
    .complete 1002,1 --Moonstalker Fang (6)
--N don't think unitscan is needed
step
    #sticky
    #completewith ReadAndy
    >>击杀你看到的狂暴蓟熊。确保至少拥有 50% 的法力，在它们对你施加狂犬病减益前将其击杀
    .complete 2138,1 --Rabid Thistle Bear (20)
step
    .goto Darkshore,50.77,25.43
    >>使用背包中的[空的水样试管]
    .complete 4762,1 --Cliffspring River Sample (1)
step
    #sticky
    #completewith ReadAndy
    +保留拾取的小蛋用于后续提升烹饪，所有轻羽毛也一并保存备用
step
    .goto Darkshore,47.11,48.63
     >> 跑到山里的神秘的红色水晶那里
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range (1)
step
    #label ReadAndy
    .goto Darkshore,40.30,59.73
.target 哨兵坦莎·月刃
>>与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 953 >>接受任务 亚米萨兰的毁灭
step
    #sticky
    #label anaya
    .goto Darkshore,42.29,60.46,0
     >> 击杀 安娜雅·晨路，她在亚米萨兰中部巡逻
    .complete 963,1
    .unitscan 安娜雅·晨路
step
    #label ghosts
    #sticky
    .goto Darkshore,42.66,61.90,0
     >> 击杀 幽灵, 获取 遗物
    .complete 958,1 --Highborne Relic (7)
step
    .goto Felwood,25.98,40.62
     >> 点击地上的《亚米萨兰的毁灭》石板。
    .complete 953,2 --Read the Fall of Ameth'Aran (1)
step
    .goto Felwood,25.66,39.11
     >> 点击凉亭里的绿色火炬（上古之火）。
    .complete 957,1 --Destroy the seal at the ancient flame (1)
step
    .goto Felwood,26.71,35.53
     >> 点击地上的《亚米萨兰的衰落》石板。
    .complete 953,1 --Read the Lay of Ameth'Aran (1)
step
#hidewindow
    #requires ghosts
step
    #requires anaya
    .goto Darkshore,40.30,59.73
.target 哨兵坦莎·月刃
>>与 |cRXP_FRIENDLY_哨兵坦莎·月刃|r 交谈
    .turnin 953 >> 交任务: 亚米萨兰的毁灭
step
    .goto Darkshore,38.83,60.82
    >>完成击杀狂暴蓟熊和收集陆行鸟肉的任务目标
    .complete 2138,1 --Rabid Thistle Bear (20)
    .collect 5469,5,2178,1
step
    >>拾取搁浅海龟的残骸
    .goto Darkshore,37.14,62.12
    .accept 4722 >>接受任务 搁浅的海龟
step
    >>拾取搁浅海洋生物的残骸
    .goto Darkshore,36.02,70.79
    .accept 4728 >>接受任务 搁浅的海洋生物
step
    .hs >> 炉石回奥伯丁
step
    .goto Darkshore,38.84,43.42
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >>交任务 清除疫病
.target 萨纳瑞恩·绿树
    .accept 2139 >>接受任务 萨纳瑞恩的希望
step
    .goto Darkshore,38.11,41.17
.target 高尔博德·钢手
>>与 |cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .turnin 982 >>交任务 深不可测的海洋
    .vendor >> 向高尔博德·钢手购买甜香料，直到足够烹饪所有鸡蛋
step
    .goto Darkshore,37.69,40.66
    >>确保烹饪技能达到10点，否则无法接受或交还此任务
.target 奥兰达利亚·夜歌
>>与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >>接受任务 炖陆行鸟
    .turnin 2178 >>交任务 炖陆行鸟
step
    .goto Darkshore,37.40,40.13
>>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 958 >>交任务 上层精灵的工具
    .turnin 4762 >>交任务 壁泉河
.target 桑迪斯·织风
    .accept 4763 >>接受任务 黑木熊怪的堕落
step
    .goto Darkshore,37.44,41.84
.target 考古学家霍莉
>>与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >>接受任务 健忘的勘察员
step
    .goto Darkshore,37.71,43.36
>>与 |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r 交谈
    .turnin 4811 >> 交任务: 红色水晶
.target 哨兵戈琳达·纳希恩
    .accept 4812 >> 接任务: 清洗水晶
step
    .goto Darkshore,37.78,44.06
     >> 在月亮井处灌满空水瓶
    .complete 4812,1
     >> 在月亮井给空的净化碗盛水
    .collect 12347,1,4763,1
step
    #completewith next
    .goto Darkshore,36.83,43.91
    .vendor >> 从塔尔丹那里购买需要 15 级的饮料
step
    >>回码头
    .goto Felwood,18.10,18.48
.target 塞瑞利恩·白爪
>>与 |cRXP_FRIENDLY_塞瑞利恩·白爪|r 交谈
    .turnin 963 >> 交任务: 永志不渝
step
    .goto Darkshore,36.09,44.93
.target 古博·布拉普
>>与 |cRXP_FRIENDLY_古博·布拉普|r 交谈
    .accept 1138 >> 接任务: 海中的水果
step
    .goto Darkshore,36.62,45.59
.target 温尼斯·布莱葛
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4722 >>交任务 搁浅的海龟
    .turnin 4723 >>交任务 搁浅的海洋生物
    .turnin 4728 >>交任务 搁浅的海洋生物 << Gnome
step
    .goto Darkshore,47.32,48.70
     >> 点击神秘的红色水晶
    .turnin 4812 >> 交任务: 清洗水晶
    .accept 4813 >> 接任务: 水晶中的碎片
step
    #sticky
    #label MoonstalkersF
     >> 击杀任意类型的 月夜猛虎，拾取 月夜猛虎的牙齿
    .complete 1002,1 --Moonstalker Fang (6)
    .unitscan 月夜猛虎;月夜猛虎幼崽
step
    .goto Darkshore,44.18,36.29
.target 阿斯特利安
>>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 957 >>交任务 巴莎兰
step
    .goto Darkshore,50.66,34.98
    >>装备你的新魔杖
    >>从木桶拾取黑木谷物，然后向东南跑向雌蓟熊（不要与怪物战斗）
    .collect 12342,1 --Blackwood Grain Sample (1)
step
    .goto Darkshore,52.60,36.65,45,0
    >>击杀雌蓟熊。小心它的幼崽会将你击倒 2 秒
    >>如果觉得困难，先刷到16级再试一次
    .goto Darkshore,51.48,38.26
    .complete 2139,1 --Den Mother (1)
step
    >>从木桶中拾取黑木坚果
    .goto Darkshore,51.80,33.51
    .collect 12343,1 --Blackwood Nut Sample (1)
step
    >>从木桶拾取黑木水果。你面前和西侧小屋之间会刷出怪物，必要时逃跑
    .goto Darkshore,52.85,33.42
    .collect 12341,1 --Blackwood Fruit Sample (1)
step
    >>在营地火旁使用背包中装满水的净化碗。这将使附近的全部熊怪变为友好状态
    >>击杀在营地之间生成并绕着火堆跑动的萨特。由于他可能难以对付，请从最大射程开始攻击。击杀后会掉落一个篮子，请将其拾取
    .goto Darkshore,52.38,33.29
    .complete 4763,1 --Talisman of Corruption (1)
step
    #completewith next
    .goto Darkshore,54.98,32.79,35 >> 去瀑布上面的洞穴
step
    .goto Darkshore,55.66,34.89
     >> 留在洞穴上层；如果上层尽头没有毒帽蘑菇，就跳到下层拾取一个
     >> 拾取毒帽蘑菇后，洞口第一个蓝色蘑菇应该已经刷新
    .complete 947,1 --Scaber Stalk (5)
    .complete 947,2 --Death Cap (1)
step
    .goto Darkshore,54.97,24.89
>>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 965 >>交任务 奥萨拉克斯之塔
.target 巴苏尔·影击
    .accept 966 >>接受任务 奥萨拉克斯之塔
step
    >>击杀暗滩狂热者，拾取它们掉落的破旧的羊皮纸
    .goto Darkshore,55.36,26.84
    .complete 966,1 --Worn Parchment (4)
step
    .goto Darkshore,54.97,24.89
>>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 966 >>交任务 奥萨拉克斯之塔
.target 巴苏尔·影击
    .accept 967 >>接受任务 奥萨拉克斯之塔
step
    #requires MoonstalkersF
    .goto Darkshore,53.11,18.16
    .accept 4727 >>接受任务 搁浅的海龟
step
    #sticky
    #completewith Turtles
     >> 击杀海岸边的暗礁蟹即可, 无需特意前往完成此任务, 不要击杀等级高出你4级或以上的怪物
    .complete 1138,1 --Fine Crab Chunks (6)
step
    .goto Darkshore,51.38,24.19,25,0
    .goto Darkshore,51.29,24.53
    .turnin 1002 >> 交任务: 传声盒323号
    .accept 1003 >> 接任务: 传声盒525号
step
    #softcore
    #label Turtles
    >>别把附近鱼人全杀光, 接任务后要故意让它们击杀自己，以便在墓地复活赶路
    .goto Darkshore,44.18,20.60
    .accept 4725 >> 接任务: 搁浅的海龟
step
    #hardcore
    #label Turtles
    .goto Darkshore,44.18,20.60
    .accept 4725 >> 接任务: 搁浅的海龟
step
    #softcore
    .deathskip >> 死亡后在奥伯丁墓地复活
step
    .goto Darkshore,37.40,40.13
    >>装备你的新魔杖
.target 桑迪斯·织风
>>与 |cRXP_FRIENDLY_桑迪斯·织风|r 交谈
    .turnin 4763 >> 交任务: 黑木熊怪的堕落
step
    .goto Darkshore,38.84,43.42
.target 萨纳瑞恩·绿树
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2139 >>交任务 萨纳瑞恩的希望
step
    .goto Darkshore,37.71,43.36
.target 哨兵戈琳达·纳希恩
>>与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4813 >>交任务 水晶中的碎片
step
    .goto Darkshore,37.32,43.64
>>与 |cRXP_FRIENDLY_巴瑞萨斯·月影|r 交谈
    .turnin 947 >> 交任务: 洞中的蘑菇
.target 巴瑞萨斯·月影
    .accept 948 >> 接任务: 安努
step
    .goto Darkshore,37.23,44.23
     >> 点击旅店外面的通缉告示
    .accept 4740 >> 接任务: 通缉：莫克迪普！
step
    .isQuestComplete 1138
    .goto Darkshore,36.09,44.93
.target 古博·布拉普
>>与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >>交任务 海中的水果
step
    #label end
    .goto Felwood,19.10,20.63
.target 温尼斯·布莱葛
>>与 |cRXP_FRIENDLY_温尼斯·布莱葛|r 交谈
    .turnin 4727 >> 交任务: 搁浅的海龟
    .turnin 4725 >> 交任务: 搁浅的海龟
step
     #completewith Murkdeep
     >> 击杀遇到的月夜雄虎；有把握时也击杀月夜雌虎，拾取它们的毛皮。它们与灰斑蓟熊共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .unitscan 月夜雄虎;月夜雌虎
step
     #completewith Murkdeep
    .goto Darkshore,38.60,80.50,0
     >> 击杀 灰斑蓟熊，拾取 头皮
    .complete 1003,1 --Grizzled Scalp (4)
step
    .goto Darkshore,43.55,76.29
>>与 |cRXP_FRIENDLY_安努|r交谈
    .turnin 948 >> 交任务: 安努
.target 安努
    .accept 944 >> 接任务: 主宰之剑
step
    #completewith next
    .goto Darkshore,43.69,76.64
    .vendor >> 向提亚尼购买需要 15 级的饮料
step << Human
    >>拾取残骸
    .goto Darkshore,35.97,70.90
    .accept 4728 >>接受任务 搁浅的海洋生物
step
    #label Murkdeep
    .goto Darkshore,36.52,76.55
    >> 清掉鱼人营地, 远离中间的篝火
    >> 清掉营地内所有怪物后，走到营地中央引出莫克迪普
    >> 如果运气好，莫克迪普可能已在西侧离岸约 30 码处刷新（若先前有人被它杀死）
    .complete 4740,1 --Murkdeep (1)
step
     >> 沿海岸击杀螃蟹, 收集优质蟹肉
    .complete 1138,1 --Fine Crab Chunks (6)
step
    >>拾取残骸
    .goto Darkshore,32.70,80.73
    .accept 4730 >>接受任务 搁浅的海洋生物
step
    >>拾取残骸。小心，灰雾智者的闪电箭会造成 90 点伤害；它们生命低于 55% 时会用治疗波回满血。这里的海龟头部可以阻挡视线
    >>始终为自己留好退路。灰雾潮行者的威胁不算太大，但要注意它们伤害较低的毒液技能
    >>尽量把治疗药水留到后面使用，尤其是大瓶的
    .goto Darkshore,31.70,83.72
    .accept 4731 >>接受任务 搁浅的海龟
step
    >>岛上的龟壳可以阻挡视线
    .goto Darkshore,31.22,85.56
    .accept 4732 >>接受任务 搁浅的海龟
step
    >>在它脖子处拾取，小心被地形挡住的2个怪（你只要杀3个怪就能拿到这个）
    .goto Darkshore,31.28,87.39
    .accept 4733 >>接受任务 搁浅的海洋生物
step
    .goto Darkshore,35.72,83.69
.target 勘察员雷姆塔维尔
>>与 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    .turnin 729 >> 交任务: 健忘的勘察员
step
    .goto Darkshore,35.72,83.69
     >>此任务难度极高, 建议找其他玩家组队完成
     >> 开始护送任务
.target 勘察员雷姆塔维尔
>>与 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    .accept 731,1 >> 接任务: 健忘的勘察员
step
     >>护送勘察员雷姆塔维尔
     >>先让怪物击中雷姆塔维尔，使他拉住仇恨，再用火球术攻击怪物
     >>雷姆塔维尔很脆弱，尽量替他拉走其他怪的仇恨
     >>穴居人刷新时，先对雷姆塔维尔没有攻击的那只使用变形术；等另一只击中他后再击杀。终点附近的敌方法师出现后，等它向雷姆塔维尔射出火球，再优先对它使用变形术
     >>如果第一次无法完成此任务，就直接跳过吧——它对技巧要求非常高，而且非常依赖运气
     .complete 731,1 --Escort Prospector Remtravel (1)
step
     #completewith Glaive
     >> 击杀遇到的月夜雄虎；有把握时也击杀月夜雌虎，拾取它们的毛皮。它们与灰斑蓟熊共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .unitscan 月夜雄虎;月夜雌虎
step
    >>击杀陆行鸟，确保至少保留 1 根轻羽毛供稍后使用
    .collect 17056,1 --Light Feather (1)
step
     #completewith next
    .goto Darkshore,38.60,80.50,0
     >> 击杀 灰斑蓟熊，拾取 头皮
    .complete 1003,1 --Grizzled Scalp (4)
step
    #sticky
    #completewith Therylune
    >>留意掉落的“深渊之神”；它掉率较低，但可触发一个顺路完成的任务
    .collect 5352,1,968 --Book: The Powers Below (1)
    .accept 968 >> 接任务: 深渊之神
step
    #label Glaive
    .goto Darkshore,38.30,87.12
     >> 进入主宰之剑, 清掉中央祭坛周围的怪物
    .complete 944,1
step
    #sticky
    #label TheryluneE
    .goto Darkshore,38.65,87.34
.target 瑟瑞露尼
>>与 |cRXP_FRIENDLY_瑟瑞露尼|r交谈
    .accept 945 >> 接任务: 护送瑟瑞露尼
step
     >> 使用背包里的占卜之水，在地上放置占卜之碗
    .turnin 944 >> 交任务: 主宰之剑
    .accept 949 >> 接任务: 暮光之锤的营地
step
    .goto Darkshore,38.55,86.03
     >> 点击基座上的书。如果已经开始护送，请留意瑟瑞露尼的位置，别让她独自跑远
    .turnin 949 >> 交任务: 暮光之锤的营地
    .accept 950 >> 接任务: 向安努回复
step
    #label Therylune
    #requires TheryluneE
    >> 完成护送任务
    >> 击杀离开主宰之剑前的最后一只怪后，生起营火，将剩余的肉和蛋全部烹饪以提升烹饪技能
    >> 夜色镇有个可顺路完成的任务需要 50 点烹饪技能
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
step
     #sticky
    #label MoonstalkerP
    .goto Darkshore,37.38,91.87,100,0
    .goto Darkshore,38.96,80.07,100,0
    .goto Darkshore,43.82,82.08,100,0
    .goto Darkshore,38.96,80.07,0
     >> 击杀遇到的月夜雄虎；有把握时也击杀月夜雌虎，拾取它们的毛皮。它们与灰斑蓟熊共享刷新点
     >> 如果你在刷新和掉落方面运气特别差, 可以跳过这个任务
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .unitscan 月夜雄虎;月夜雌虎
step
    .goto Darkshore,38.60,80.50
     >> 击杀黑海岸南部各处的灰斑蓟熊，拾取它们的灰色头皮
    .complete 1003,1 --Grizzled Scalp (4)
step
    .goto Darkshore,41.40,80.56
    .turnin 1003 >> 交任务: 传声盒525号
step
    #requires MoonstalkerP
    .goto Darkshore,43.55,76.29
.target 安努
>>与 |cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >> 交任务: 向安努回复
step
    #completewith next
    .goto Darkshore,43.69,76.63
    .vendor >> 如有需要, 从提亚尼那里买食物和饮料
step
    >>接受克罗尼亚的护送任务；若他不在就跳过此步骤
    .goto Darkshore,44.40,76.42
.target 克罗尼亚·恒影
>>与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈
    .accept 5321 >>接受任务 昏昏欲睡
step
    .isOnQuest 5321
    >>拾取克罗尼亚旁边的小灰色箱子
    .goto Darkshore,44.40,76.42
    .complete 5321,2 --Horn of Awakening (1)
step
    .isOnQuest 5321
    .goto Ashenvale,26.84,36.74
    >>向南前往灰谷。将唤醒号角放入快捷栏；克罗尼亚开始原地踱步并睡着时，对他使用号角
    .complete 5321,1 --Escort Kerlonian Evershade to Maestra's Post (1)
step
    .isOnQuest 5321
    .goto Ashenvale,27.26,35.58
.target 利拉迪斯·月河
>>与|cRXP_FRIENDLY_利拉迪斯·月河|r交谈
    .turnin 5321 >>交任务 昏昏欲睡
step
    .goto Ashenvale,26.19,38.70
.target 净化者德尔格伦
>>与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 967 >>交任务 奥萨拉克斯之塔
step
    #softcore
    >>沿南边道路前行, 前往艾森娜神殿
    -->>Whilst you're doing this, start opening the Website Unstuck tool, and select your character. Do NOT confirm it yet though
    .goto Ashenvale,22.64,51.91
.target 瑟瑞希尔
>>与|cRXP_FRIENDLY_瑟瑞希尔|r交谈
    .turnin 945 >>交任务 护送瑟瑞露尼
step
    #hardcore
    >>沿南边道路前行, 前往艾森娜神殿
    .goto Ashenvale,22.64,51.91
.target 瑟瑞希尔
>>与|cRXP_FRIENDLY_瑟瑞希尔|r交谈
    .turnin 945 >>交任务 护送瑟瑞露尼
step
    .hs >> 炉石回奥伯丁
step
    .goto Darkshore,36.09,44.93
.target 古博·布拉普
>>与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >>交任务 海中的水果
step
    .goto Darkshore,36.62,45.60
.target 温尼斯·布莱葛
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4728 >>交任务 搁浅的海洋生物
    .turnin 4730 >>交任务 搁浅的海洋生物
    .turnin 4731 >>交任务 搁浅的海龟
    .turnin 4732 >>交任务 搁浅的海龟
    .turnin 4733 >>交任务 搁浅的海洋生物
step
    .goto Darkshore,37.73,43.38
.target 哨兵戈琳达·纳希恩
>>与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4740 >>交任务 通缉：莫克迪普！
step
    .isQuestComplete 986
    >>将任务的后续部分保留在任务日志中，以便继续使用+3耐力的披风。不再需要这件披风时，再放弃该任务
    .goto Darkshore,39.37,43.48
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 986 >>交任务 丢失的主人
.target 特伦希斯
    .accept 993 >>接受任务 丢失的主人
step
    .goto Darkshore,37.44,41.84
.target 考古学家霍莉
>>与 |cRXP_FRIENDLY_考古学家霍莉|r 交谈
    .turnin 731 >> 交任务: 健忘的勘察员
    .isQuestComplete 731
step
    .goto Darkshore,37.44,41.84
.target 考古学家霍莉
>>与 |cRXP_FRIENDLY_考古学家霍莉|r 交谈
    .accept 741 >> 接任务: 健忘的勘察员
    .isQuestTurnedIn 731
step
    #completewith next
    .isOnQuest 741
    >>跑回码头, 等待前往达纳苏斯的船
    .goto Darkshore,36.43,43.84,30,0
    .goto Darkshore,33.17,40.17,40
step
    .isOnQuest 741
    .zone Teldrassil >> 乘船前往达纳苏斯，抵达 泰达希尔
step
    .isOnQuest 741
    .goto Teldrassil,55.95,89.86,30 >> 穿过紫色传送门
step
    .isOnQuest 741
    .goto Darnassus,31.24,84.49
>>与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .turnin 741 >>交任务 健忘的勘察员
.target 首席考古学家杜瑟·灰须
    .accept 942 >>接受任务 健忘的勘察员
step
    .goto Teldrassil,58.40,94.02
    .fp Teldrassil >> 获取泰达希尔飞行点
    .fly Auberdine >> 飞往奥伯丁
step
    .goto Darkshore,32.42,43.75,50,0
    .zone Wetlands >> 乘船前往 湿地的米奈希尔港
step
    #completewith next
    .money <0.08
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto 1437,10.760,56.721
    >> 如果你有 8 银, 请检查尼尔·奥雷是否有青铜管, 如果有就购买;否则, 跳过此步骤
    .collect 4371,1,175,1
step
    .goto Wetlands,9.49,59.69
    .fly Ironforge >> 飞往铁炉堡
step << skip --logout skip
    #completewith next
    .goto Ironforge,56.23,46.83,0
    +跳到一只狮鹫头上，登出后重新登录，利用登出位移赶路
    .link https://www.youtube.com/watch?v=PWMJhodh6Bw >> 点击这里
step
    .zone Stormwind City >> 乘坐矿道地铁前往 暴风城
step
    #completewith FlyAndy
    .goto StormwindClassic,55.21,7.04
    .vendor >> 如果你还没有, 就买一根青铜管
    >>这是限量供应物品, 如果NPC没有, 就跳过这一步
    .bronzetube
step << Human
    #label FlyAndy
    .goto Elwynn Forest,32.45,50.16
    .zone Elwynn Forest >> 前往: 艾尔文森林
step << Gnome
    .goto Elwynn Forest,26.29,38.50
    .zone Stormwind City >> 前往: 暴风城
step << Gnome
    #label FlyAndy
    >>前往暴风城并获取飞行点
    .goto StormwindClassic,57.62,59.48,50,0
    .goto StormwindClassic,66.27,62.13
    .fp Stormwind City >> 获取暴风城飞行点
step << Gnome
    .goto StormwindClassic,66.05,65.64,12,0
    .goto StormwindClassic,64.97,67.69,18 >> 朝白色墙壁跑，让角色落到下方的小平台；小心沿平台走向暴风城出口
step
    >> 跑进闪金镇旅店二楼
    .goto Elwynn Forest,42.97,65.65,15,0
    .goto Elwynn Forest,43.81,66.46,15,0
    .goto Elwynn Forest,43.25,66.19
    .trainer >> 学习职业技能
step
    .goto Elwynn Forest,91.42,73.59,125,0
    .zone Redridge Mountains >> 前往: 赤脊山,一路向东跑到赤脊山。路上整理好你的按键绑定，确保你的法术在快捷栏中便于施放
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 联盟法师
#classic
#tbc
<< Alliance Mage
#name 18-21 Redridge Mage AoE
#version 1
#group RestedXP Alliance Mage
#subgroupdisplayname RestedXP 联盟法师
#defaultfor Alliance Mage
#next 21-22 Duskwood Mage AoE
#displayname 18-21 赤脊山（法师 AoE）
step
    #sticky
    #completewith Gnolls
    +开始对遇到的每组3+只任务怪使用AoE。
    >>需要时可在另一个标签页打开此赤脊山AoE教学：
    .link https://youtu.be/SxMc2GoP33c?t=56 >> 点击此处
step
    >>与卫兵帕克交谈。他会在路口附近短距离巡逻
    .goto Elwynn Forest,99.05,72.15
.target 卫兵帕克
>>与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接受任务 豺狼人的入侵
step
    #sticky
    #label Gnolls
    .goto Redridge Mountains,30.74,59.99
>>与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >>交任务 豺狼人的入侵
.target 菲尔顿副队长
    .accept 246 >>接受任务 审时度势
step
    .goto Redridge Mountains,30.59,59.40
    .fp Redridge Mountains >> 获取赤脊山飞行点
step
    #requires Gnolls
    .goto Redridge Mountains,33.51,48.96
.target 治安官马瑞斯
>>与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .accept 20 >>接受任务 黑石氏族的威胁
step
    .goto Redridge Mountains,32.14,48.64
.target 工头奥斯洛
>>与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .accept 125 >>接受任务 丢失的工具
step
    .goto Redridge Mountains,30.94,47.24
.target 弗纳·奥斯古
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    .accept 118 >>接受任务 马掌
step
    >>在镇公所内
    .goto Redridge Mountains,29.72,44.26
.target 拜里弗·科纳彻尔
>>与|cRXP_FRIENDLY_拜里弗·科纳彻尔|r交谈
    .accept 91 >>接受任务 所罗门的律法
step
    .goto Redridge Mountains,29.99,44.45
    >>进入建筑
.target 所罗门镇长
>>与|cRXP_FRIENDLY_所罗门镇长|r交谈
    .accept 120 >>接受任务 送往暴风城的信
step
    .goto Redridge Mountains,27.72,47.38
.target 码头管理员巴伦
>>与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
    .accept 127 >>接受任务 卖鱼
step
    .goto Redridge Mountains,26.75,46.42
    .accept 180 >>接受任务 通缉：范高雷中尉
step
    >>在旅店内
    .goto Redridge Mountains,27.09,45.65
.target 达希
>>与|cRXP_FRIENDLY_达希|r交谈
    .accept 129 >>接受任务 免费的午餐
step
    .goto Redridge Mountains,27.01,44.82
    .home >> 将你的炉石设置为湖畔镇
step
    .goto Redridge Mountains,29.32,53.64
.target 肖恩
>>与|cRXP_FRIENDLY_肖恩|r交谈
    .accept 3741 >>接受任务 希拉里的项链
step
    >>在水下寻找希拉里的项链。它在棕色的泥土区域
    .goto Redridge Mountains,27.80,56.05,90,0
    .goto Redridge Mountains,26.56,50.63,90,0
    .goto Redridge Mountains,23.96,55.17,90,0
    .goto Redridge Mountains,19.16,51.75,90,0
    .goto Redridge Mountains,31.12,54.21,90,0
    .goto Redridge Mountains,34.03,55.34,90,0
    .goto Redridge Mountains,38.09,54.49,90,0
    .complete 3741,1 --Hilary's Necklace (1)
step
    #completewith next
    .goto Redridge Mountains,15.47,62.40,0
    +用AoE清理营地中的豺狼人
step
    .goto Redridge Mountains,15.28,71.47
>>与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .turnin 129 >>交任务 免费的午餐
.target 卫兵帕克
    .accept 130 >>接受任务 寻访草药师
step
    .goto Redridge Mountains,30.59,59.41
    .fly Stormwind >> 飞往暴风城
step
    >>进入暴风城，前往武器训练师处
   .goto StormwindClassic,57.13,57.71
   .trainer >> 学习单手剑（1h）和匕首
step
    #softcore
    .goto StormwindClassic,53.62,59.76,30,0
    .goto StormwindClassic,55.25,7.08
    +前往拍卖行, 若价格合适购买青铜管
    >>如果这里没有青铜管或价格太高，也可试着向矮人区的比利巴布·旋轮购买
    >>如果买不到，就跳过此步骤
    .bronzetube
step
    #hardcore
    .goto StormwindClassic,53.62,59.76,30,0
    .goto StormwindClassic,55.25,7.08
    .vendor >> 查看矮人区的比利巴布·旋轮是否出售青铜管，有货就买一根
    .bronzetube
step
    .goto StormwindClassic,63.99,75.34
>>与|cRXP_FRIENDLY_马库斯·乔纳森将军|r交谈
    .turnin 120 >>交任务 送往暴风城的信
.target 马库斯·乔纳森将军
    .accept 121 >>接受任务 送往暴风城的信
step
    >>跑到闪金镇
    .goto Elwynn Forest,41.71,65.55
>>与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
    .turnin 118 >>交任务 马掌
.target 铁匠阿古斯
    .accept 119 >>接受任务 回复弗纳
step
    >>跑向哨兵岭
    .goto Westfall,56.33,47.52
.target 格里安·斯托曼
>>与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 65 >>接受任务 迪菲亚兄弟会
step
    #completewith next
    #label hsLakeshire
    .hs Lakeshire >> 炉石可用就回湖畔镇
step
    #completewith hsLakeshire
    #label WFFP
    .goto Westfall,56.55,52.65
    .fp Westfall >> 获取西部荒野飞行点 << Gnome
    .fly Redridge >> 飞往赤脊山
step
    #requires WFFP
    .goto Redridge Mountains,30.97,47.27
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    .turnin 119 >>交任务 回复弗纳
.target 弗纳·奥斯古
    .accept 122 >>接受任务 雏龙的鳞片
    .accept 124 >>接受任务 豺狼人的乱吠
step
    >>进入要塞
    .goto Redridge Mountains,29.93,44.46
>>与|cRXP_FRIENDLY_所罗门镇长|r交谈
    .turnin 121 >>交任务 送往暴风城的信
.target 所罗门镇长
    .accept 143 >>接受任务 送往西部荒野的信
.target 拜里弗·科纳彻尔
>>与|cRXP_FRIENDLY_拜里弗·科纳彻尔|r交谈
    .accept 91 >>接受任务 所罗门的律法
step
    >>进入旅店顶层
    .goto Redridge Mountains,26.47,45.35
>>与|cRXP_FRIENDLY_黑衣威利|r交谈
    .turnin 65 >>交任务 迪菲亚兄弟会
.target 黑衣威利
    .accept 132 >>接受任务 迪菲亚兄弟会
step
    .goto Redridge Mountains,29.24,53.63
.target 希拉里
>>与|cRXP_FRIENDLY_希拉里|r交谈
    .turnin 3741 >>交任务 希拉里的项链
step
    #era/som
    #completewith Murlocs
    >>做其他任务时收集赤脊山炖肉所需的前3种材料，并收集足够的野猪肉，将烹饪提升至50
    >>尽量优先击杀血牙野猪，暂时不用专门收集蜘蛛肉
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .collect 1080,5,92,1 --Tough Condor Meat (5)
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
step
    #completewith Murlocs
    >>击杀雏龙，拾取它们掉落的雏龙的腹鳞
    .complete 122,1 --Underbelly Whelp Scale (6)
step
    >>用AoE清理这里的豺狼人。需要时可参考AoE教学视频
    >>拉怪进行AoE时，卡住偷猎者的射击盲区，避免被射中
    .goto Redridge Mountains,29.51,84.17,50,0
    .goto Redridge Mountains,34.60,82.99,50,0
    .goto Redridge Mountains,43.44,71.11,50,0
    .goto Redridge Mountains,29.51,84.17,50,0
    .goto Redridge Mountains,34.60,82.99,50,0
    .goto Redridge Mountains,43.44,71.11,50,0
    .complete 246,1 --Redridge Mongrel (10)
    .complete 246,2 --Redridge Poacher (6)
step
    #label Murlocs
    >>对附近的鱼人使用范围攻击；鱼人小招潮者会用闪电箭和治疗波，必须单独攻击
    >>鱼人巡滩者会冲锋，鱼人食腐者攻击时可能瞬间吸取 25 点生命值；可对它们使用范围攻击，灵活安排拉怪
    >>保留8个鱼人的鳍以备后用
    .goto Redridge Mountains,48.82,69.49
    .complete 127,1 --Spotted Sunfish (10)
    .collect 1468,8,150,1 --Murloc Fin (8)
step
    #era/som
    >>在这片区域收集硬秃鹫肉和雏龙的腹鳞。如果正在等待刷新，可以先向东收集一些斧头，再返回这里
    .goto Redridge Mountains,61.04,77.55
    .collect 1080,5,92,1 --Tough Condor Meat (5)
    .complete 122,1 --Underbelly Whelp Scale (6)
step
    #som
    #phase 3-6
    >>从这片区域的雏龙身上拾取雏龙的腹鳞。如果正在等待刷新，可以先向东收集一些斧头，再返回这里
    .goto Redridge Mountains,61.04,77.55
    .complete 122,1 --Underbelly Whelp Scale (6)
step
    >>对附近兽人使用范围攻击并拾取它们的斧头。小心黑石前锋的网和黑石叛节者的盾击
    >>尽量避开等级较高的黑石叛节者；每次最多拉 3 只。此处范围攻击风险极高、收益中等
    >>暂时不用收齐斧头，稍后还有更好的机会完成
    .goto Redridge Mountains,76.28,83.88,50,0
    .goto Redridge Mountains,75.53,73.36,50,0
    .goto Redridge Mountains,76.28,83.88,50,0
    .goto Redridge Mountains,75.53,73.36,50,0
    .collect 3014,8 --Battleworn Axe (8)
step
    >>潜到水下，拾取灰色箱子
    .goto Redridge Mountains,41.52,54.68
    .complete 125,1 --Oslow's Toolbox (1)
step
    #era/som
    >>在这里收齐巨型血牙野猪头
    .goto Redridge Mountains,32.07,70.54
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
step
    .goto Redridge Mountains,30.74,60.00
.target 菲尔顿副队长
>>与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 246 >>交任务 审时度势
step
    .isQuestComplete 20
    .goto Redridge Mountains,33.50,48.96
.target 治安官马瑞斯
>>与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .turnin 20 >>交任务 黑石氏族的威胁
step
    .goto Redridge Mountains,32.14,48.63
>>与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .turnin 125 >>交任务 丢失的工具
.target 工头奥斯洛
    .accept 89 >>接受任务 止水湖上的桥
step
    .goto Redridge Mountains,30.98,47.27
.target 弗纳·奥斯古
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    .turnin 122 >>交任务 雏龙的鳞片
step
    #level 20
    .goto Redridge Mountains,27.72,47.38
>>与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
    .turnin 127 >>交任务 卖鱼
.target 码头管理员巴伦
    .accept 150 >>接受任务 鱼人偷猎者
    .turnin 150 >>交任务 鱼人偷猎者
step
    .goto Redridge Mountains,27.72,47.38
.target 码头管理员巴伦
>>与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
    .turnin 127 >>交任务 卖鱼
step
    .goto Redridge Mountains,21.86,46.33
>>与|cRXP_FRIENDLY_玛蒂·詹罗斯|r交谈
    .turnin 130 >>交任务 寻访草药师
.target 玛蒂·詹罗斯
    .accept 131 >>接受任务 水仙诉衷情
    .accept 34 >>接受任务 不速之客
step
    >>击杀贝利格拉布，将它一路引到镇内卫兵亚当斯处
    >>小心它的震颤（瞬间造成80点范围伤害）和冲锋；尽可能保持减速，并用冰霜新星定住它
    >>确保你造成了大部分伤害（51%+）
    >>这个任务非常难
    .goto Redridge Mountains,15.66,49.31
    .complete 34,1 --Bellygrub's Tusk (1)
--N Add link
step
    .goto Redridge Mountains,21.85,46.32
.target 玛蒂·詹罗斯
>>与|cRXP_FRIENDLY_玛蒂·詹罗斯|r交谈
    .turnin 34 >>交任务 不速之客
step
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    >>击杀豺狼人，拾取它们掉落的铁矛和铁铆钉
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .complete 124,1 --Redridge Brute (10)
    .complete 124,2 --Redridge Mystic (8)
step
    #completewith next
    >>击杀聚在一起的兽人，拾取并收齐任务所需的斧头
    >>如果清完附近的怪群仍未集齐，稍后还有机会
    .goto Redridge Mountains,37.05,45.15,50,0
    .goto Redridge Mountains,38.28,41.85,50,0
    .goto Redridge Mountains,40.46,40.52,50,0
    .complete 20,1 --Blackrock Axe (10)
step
    #era/som
    #completewith next
    .goto Redridge Mountains,49.25,39.66,150 >> 朝蜘蛛跑去
step
    #era/som
    >>击杀蜘蛛，拾取它们掉落的香脆蜘蛛肉
    >>小心它们的毒，会造成不低的伤害
    >>小心稀有怪查特，它能使你昏迷8秒
    .goto Redridge Mountains,57.23,45.24
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
step
    >>击杀兽人，收齐剩余所需的斧头
    .goto Redridge Mountains,61.74,42.82
    .complete 20,1 --Blackrock Axe (10)
step
    .goto Redridge Mountains,33.50,48.96
.target 治安官马瑞斯
>>与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .turnin 20 >>交任务 黑石氏族的威胁
step
    .goto Redridge Mountains,32.15,48.64
.target 工头奥斯洛
>>与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .turnin 89 >>交任务 止水湖上的桥
step
    .goto Redridge Mountains,30.98,47.28
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    .turnin 124 >>交任务 豺狼人的乱吠
.target 弗纳·奥斯古
    .accept 126 >>接受任务 群山中的嚎叫
step
    .goto Redridge Mountains,27.09,45.65
.target 达希
>>与|cRXP_FRIENDLY_达希|r交谈
    .turnin 131 >>交任务：水仙诉衷情
step
    .goto Redridge Mountains,27.01,44.81
    .vendor >> 购买需要 15 级的饮料
step
    #era/som
    .goto Redridge Mountains,22.70,44.00
    >>离开旅店，向西走并进入建筑
.target 厨师布雷纳
>>与|cRXP_FRIENDLY_厨师布雷纳|r交谈
    .accept 92 >> 接任务：赤脊山炖肉
    .turnin 92 >> 交任务：赤脊山炖肉
step
    #era/som
    #completewith next
    .goto Redridge Mountains,26.54,44.90
    +烹饪野猪肉，直到烹饪技能达到50
    >>如果肉不够，就在前往夜色镇的途中击杀野猪补齐
step
    .goto Redridge Mountains,6.50,91.18,90,0
    .zone Duskwood >> 前往暮色森林
]])
