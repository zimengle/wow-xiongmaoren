local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师
#forever
#disabledungeons
<< Alliance Mage
#name 12-18 Darkshore Mage AoE
#version 1
#group RestedXP Alliance Mage
#defaultfor none Alliance Mage
#next 18-21 Redridge Mage AoE
#displayname 12-18 黑海岸（法师 AoE）
step
    #completewith next
    .goto 1439/1,533.23,6399.77
    .vendor >> 可以向莱尔德（鱼贩）购买非常便宜的5级食物
step
    >>上楼到顶层
    .goto 1439/1,519.48,6405.89
.target 维兹班恩·曲针
>>与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >>接任务：传声盒827号
step
    >>跳到 1 楼
    .goto 1439/1,515.55,6406.32
    .home >> 将炉石绑定在奥伯丁
step
    .goto 1439/1,497.21,6427.72
.target 巴瑞萨斯·月影
>>与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >>接任务：洞中的蘑菇
step
    .goto 1439/1,473.63,6439.07
.target 哨兵戈琳达·纳希恩
>>与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4811 >>接任务：红色水晶
step
    .goto 1439/1,397.65,6437.76
.target 萨纳瑞恩·绿树
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2118 >>接任务：瘟疫蔓延
step
    .goto 1439/1,362.93,6434.27
.target 特伦希斯
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 984 >>接任务：熊怪的威胁
step
    .goto 1439/1,543.06,6342.57
.target 温尼斯·布莱葛
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >>接任务：搁浅的巨兽
step
    .goto 1439/1,561.40,6343.01
    .fp Auberdine >> 获取奥伯丁飞行点
step
    #completewith Bear
     >> 击杀海岸沿线的海蟹
    .complete 983,1 --Crawler Leg (6)
step
    .goto 1439/1,558.78,6111.57
     >> 拾取海洋生物的残骸
    .complete 3524,1 --Sea Creature Bones (1)
step
    #sticky
    #completewith next
    >> 找到一只狂暴蓟熊，吸引它的仇恨，然后使用背包中的萨纳瑞恩的希望（紫色宝珠）
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .use 7586
step
    .goto 1439/1,386.51,5988.430
     >> 往熊怪营地附近走
    .complete 984,1 --Find a corrupt furbolg camp (1)
step
    #label Bear
    >> 找到一只狂暴蓟熊，吸引它的仇恨，然后使用背包中的萨纳瑞恩的希望（紫色宝珠）
    .goto 1439/1,421.88,5804.16
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .use 7586
step
    .goto 1439/1,543.71,5962.67,150,0
    .goto 1439/1,577.12,6393.66
    >> 击杀海岸沿线的海蟹
    .complete 983,1 --Crawler Leg (6)
step
    #sticky
    #completewith ReadAndy
     >> 把5份陆行鸟肉留到以后用
    .collect 5469,5,2178,1
step
    .goto 1439/1,540.44,6313.31
    .turnin 983 >>交任务：传声盒827号
    .accept 1001 >>接任务：传声盒411号
step
    .goto 1439/1,543.06,6342.57
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 3524 >>交任务：搁浅的巨兽
.target 温尼斯·布莱葛
    .accept 4681 >>接任务：搁浅的巨兽
step
    .goto 1439/1,535.85,6409.38,40,0
    >>前往码头
    .goto 1439/1,600.70,6425.100
.target 塞瑞利恩·白爪
>>与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .accept 963 >>接任务：永志不渝
step
    #sticky
    #completewith Thundris
     >> 击杀海中的黑海岸蛇颈龙
    .complete 1001,1 --Thresher Eye (3)
step
    #completewith next
    .goto 1439/1,734.32,6479.68,60 >> 跑到码头，然后在岔路口跳入水中
step
    .goto 1439/1,854.84,6310.26
    >>点击水下的海龟头
    .complete 4681,1 --Sea Turtle Remains (1)
step
    .goto 1439/1,543.06,6342.57
    >>返回岸边途中击杀蛇颈龙
.target 温尼斯·布莱葛
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4681 >> 交任务：搁浅的巨兽
step
    .goto 1439/1,397.65,6437.76
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2118 >> 交任务：瘟疫蔓延
.target 萨纳瑞恩·绿树
    .accept 2138 >> 接任务：清除疫病
step
    .goto 1439/1,362.93,6434.27
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 984 >> 交任务：熊怪的威胁
.target 特伦希斯
    .accept 985 >> 接任务：熊怪的威胁
    .accept 4761 >> 接任务：桑迪斯·织风
step
    >> 击杀熊怪
    .goto 1439/1,332.80,5883.20
    .goto 1439/1,338.70,5985.81,0
    .complete 985,1 --Blackwood Pathfinder (8)
    .complete 985,2 --Blackwood Windtalker (5)
step
    .goto 1439/1,362.93,6434.71
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 985 >>交任务：熊怪的威胁
.target 特伦希斯
    .accept 986 >>接任务：丢失的主人
step
    >>上楼
    .goto 1439/1,384.55,6431.65
.target 哨兵艾莉萨·星风
>>与|cRXP_FRIENDLY_哨兵艾莉萨·星风|r交谈
    .accept 965 >>接任务：奥萨拉克斯之塔
step
    .goto 1439/1,445.46,6536.01
.target 高尔博德·钢手
>>与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >> 接任务：深不可测的海洋
step
    #label Thundris
    .goto 1439/1,492.62,6580.99
>>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
.target 桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .accept 954 >>接任务：巴莎兰
    .accept 958 >>接任务：上层精灵的工具
step
     #label Threshers
     #sticky
     >> 沿海岸游泳，击杀蛇颈龙
    .complete 1001,1 --Thresher Eye (3)
step
    .goto 1439/1,391.75,7052.59,40,0
    .goto 1439/1,437.60,7076.17
     >> 从船体上的洞进入第 1 艘船，然后去船的最底层后部
    .complete 982,1 --Silver Dawning's Lockbox (1)
step
    #requires Threshers
    .goto 1439/1,302.02,7124.2,40,0
    .goto 1439/1,345.90,7134.68
     >> 从船体上的洞进入第 2 艘船，然后去船的最底层后部
    .complete 982,2 --Mist Veil's Lockbox (1)
step
    .goto 1439/1,193.29,7082.72
    .turnin 1001 >> 交任务：传声盒411号
    .accept 1002 >> 接任务：传声盒323号
step
    .goto 1439/1,194.60,6959.14
    .accept 4723 >> 接任务：搁浅的海洋生物
step
    .goto 1448/1,48.92,6748.85
>>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 954 >> 交任务：巴莎兰
.target 阿斯特利安
    .accept 955 >> 接任务：巴莎兰
step
    .goto 1448/1,-33.31,6660.30
     >> 击杀劣魔，获取耳环
    .complete 955,1 --Grell Earring (8)
step
    .goto 1448/1,48.92,6748.85
>>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 955 >> 交任务：巴莎兰
.target 阿斯特利安
    .accept 956 >> 接任务：巴莎兰
step
    .goto 1448/1,-60.33,6653.40
     >> 击杀萨特，拾取远古月亮石封印
    .complete 956,1 --Ancient Moonstone Seal (1)
step
    .goto 1448/1,48.92,6748.85
>>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 956 >> 交任务：巴莎兰
.target 阿斯特利安
    .accept 957 >> 接任务：巴莎兰
step
    #sticky
    #completewith ReadAndy
     >> 击杀任意类型的月夜猛虎，拾取月夜猛虎的牙齿
    .complete 1002,1 --Moonstalker Fang (6)
--N don't think unitscan is needed
step
    #sticky
    #completewith ReadAndy
    >>击杀你看到的狂暴蓟熊。确保至少拥有 50% 的法力，在它们对你施加狂犬病减益前将其击杀
    .complete 2138,1 --Rabid Thistle Bear (20)
step
    .goto 1439/1,-383.77,7222.89
    >>使用背包中的[空的水样试管]
    .complete 4762,1 --Cliffspring River Sample (1)
    .use 12350
step
    #sticky
    #completewith ReadAndy
    +保留拾取的小蛋用于后续提升烹饪，所有轻羽毛也一并保存备用
step
    .goto 1439/1,-144.04,6209.82
     >> 跑到山里的红色水晶那里
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range (1)
step
    #label ReadAndy
    .goto 1439/1,302.02,5726.433
.target 哨兵坦莎·月刃
>>与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 953 >>接任务：亚米萨兰的毁灭
step
    #sticky
    #label anaya
    .goto 1439/1,171.67,5693.25,0
     >> 击杀安娜雅·晨路，她在亚米萨兰中部巡逻
    .complete 963,1
    .unitscan 安娜雅·晨路
step
    #label ghosts
    #sticky
    .goto 1439/1,147.44,5630.370,0
     >> 击杀幽灵，获取遗物
    .complete 958,1 --Highborne Relic (7)
step
    .goto 1448/1,147.82,5576.23
     >> 点击地上的石板
    .complete 953,2 --Read the Fall of Ameth'Aran (1)
step
    .goto 1448/1,166.22,5634.12
     >> 点击凉亭里的绿色火炬
    .complete 957,1 --Destroy the seal at the ancient flame (1)
step
    .goto 1448/1,105.84,5771.35
     >> 点击地上的石板
    .complete 953,1 --Read the Lay of Ameth'Aran (1)
step
#hidewindow
    #requires ghosts
step
    #requires anaya
    .goto 1439/1,302.02,5726.433
.target 哨兵坦莎·月刃
>>与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .turnin 953 >> 交任务：亚米萨兰的毁灭
step
    .goto 1439/1,398.30,5677.53
    >>继续击杀狂暴蓟熊并收集陆行鸟肉
    .complete 2138,1 --Rabid Thistle Bear (20)
    .collect 5469,5,2178,1
step
    >>拾取搁浅海龟的残骸
    .goto 1439/1,509.00,5620.76
    .accept 4722 >>接任务：搁浅的海龟
step
    >>拾取搁浅的海洋生物残骸
    .goto 1439/1,582.36,5242.17
    .accept 4728 >>接任务：搁浅的海洋生物
step
    .hs >> 炉石回奥伯丁
    .cooldown item,6948,>0,1
    .bindlocation 442,1
step
    .subzone 442 >>返回奥伯丁；炉石不可用时请步行返回
step
    .goto 1439/1,397.65,6437.33
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >>交任务：清除疫病
.target 萨纳瑞恩·绿树
    .accept 2139 >>接任务：萨纳瑞恩的希望
step
    .goto 1439/1,445.46,6535.58
.target 高尔博德·钢手
>>与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .turnin 982 >>交任务：深不可测的海洋
    .vendor >> 向高尔博德·钢手购买甜香料，直到足够烹饪所有小蛋
step
    .goto 1439/1,472.97,6557.85
    >>确保你的烹饪有10点，不然接不了也交不了此任务
.target 奥兰达利亚·夜歌
>>与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >>接任务：炖陆行鸟
    .turnin 2178 >>交任务：炖陆行鸟
    .skill cooking,<10,1
step
    .goto 1439/1,491.97,6582.303
>>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 958 >>交任务：上层精灵的工具
    .turnin 4762 >>交任务：壁泉河
.target 桑迪斯·织风
    .accept 4763 >>接任务：黑木熊怪的堕落
step
    .goto 1439/1,489.35,6506.32
.target 考古学家霍莉
>>与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >>接任务：健忘的勘察员
step
    .goto 1439/1,471.66,6439.95
>>与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >> 交任务：红色水晶
.target 哨兵戈琳达·纳希恩
    .accept 4812 >> 接任务：清洗水晶
step
    .goto 1439/1,467.08,6409.38
     >> 在月亮井处灌满空水瓶
    .complete 4812,1
     >> 在月亮井给空的净化碗盛水
    .collect 12347,1,4763,1
    #label bowl
    .use 14338
    .use 12346
step
    #completewith next
    .goto 1439/1,529.30,6415.93
    .vendor >> 从塔尔丹那里买 15 级饮料
step
    >>回码头
    .goto 1448/1,600.92,6424.93
.target 塞瑞利恩·白爪
>>与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .turnin 963 >> 交任务：永志不渝
step
    .goto 1439/1,577.77,6371.39
.target 古博·布拉普
>>与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果
step
    .goto 1439/1,543.06,6342.57
.target 温尼斯·布莱葛
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4722 >>交任务：搁浅的海龟
    .turnin 4723 >>交任务：搁浅的海洋生物
    .turnin 4728 >>交任务：搁浅的海洋生物
step
    .goto 1439/1,-157.79,6206.770
     >> 点击红色水晶
    .turnin 4812 >> 交任务：清洗水晶
    .accept 4813 >> 接任务：水晶中的碎骨
step
    #sticky
    #label MoonstalkersF
     >> 击杀任意类型的月夜猛虎，拾取月夜猛虎的牙齿
    .complete 1002,1 --Moonstalker Fang (6)
    .unitscan 月夜猛虎;月夜猛虎幼崽
step
    .goto 1439/1,47.88,6748.67
.target 阿斯特利安
>>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 957 >>交任务：巴莎兰
step
    .goto 1439/1,-376.56,6805.87
    >>若新获得的魔杖更好，请装备它
    >>从木桶拾取黑木谷物，然后向东南跑向雌蓟熊（不要与怪物战斗）
    .collect 12342,1 --Blackwood Grain Sample (1)
step
    .goto 1439/1,-503.63,6732.95,45,0
    >>击杀雌蓟熊。小心它的幼崽会将你击倒 2 秒
    >>如果觉得困难，先刷到16级再试一次
    .goto 1439/1,-430.27,6662.65
    .complete 2139,1 --Den Mother (1)
step
    >>从木桶里拿黑木坚果
    .goto 1439/1,-451.23,6870.06
    .collect 12343,1 --Blackwood Nut Sample (1)
step
    >>从木桶拾取黑木水果。你面前以及西侧小屋之间会刷新怪物，必要时逃跑
    .goto 1439/1,-520.01,6873.99
    .collect 12341,1 --Blackwood Fruit Sample (1)
step
    >>在营火旁使用背包中装满水的净化碗。这将使附近的全部熊怪变为友好状态
    >>击杀在营地之间出现并绕着火堆跑动的萨特。由于他可能难以对付，请从最大射程开始攻击。击杀后会掉落一个篮子，请将其拾取
    .goto 1439/1,-489.22,6879.67
    .complete 4763,1 --Talisman of Corruption (1)
    .use 12347
step
    #completewith next
    .goto 1439/1,-659.52,6901.50,35 >> 去瀑布上面的洞穴
step
    .goto 1439/1,-704.06,6809.80
     >> 待在洞穴的上半部分。如果顶部尽头没有毒帽蘑菇，就跳下去从下面拿一个
     >> 拾取毒帽蘑菇后，洞口第一个蓝色蘑菇应该已经刷新
    .complete 947,1 --Scaber Stalk (5)
    .complete 947,2 --Death Cap (1)
step
    .goto 1439/1,-658.87,7246.47
>>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 965 >>交任务：奥萨拉克斯之塔
.target 巴苏尔·影击
    .accept 966 >>接任务：奥萨拉克斯之塔
step
    >>击杀暗滩狂热者，获取羊皮卷
    .goto 1439/1,-684.41,7161.32
    .complete 966,1 --Worn Parchment (4)
step
    .goto 1439/1,-658.87,7246.47
>>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 966 >>交任务：奥萨拉克斯之塔
.target 巴苏尔·影击
    .accept 967 >>接任务：奥萨拉克斯之塔
step
    #requires MoonstalkersF
    .goto 1439/1,-537.04,7540.35
    .accept 4727 >>接任务：搁浅的海龟
step
    #sticky
    #completewith Turtles
     >> 击杀海岸边的暗礁蟹即可，无需特意前往完成此任务，不要击杀等级高出你4级或以上的怪物
    .complete 1138,1 --Fine Crab Chunks (6)
step
    .goto 1439/1,-423.72,7277.04,25,0
    .goto 1439/1,-417.83,7262.19
    .turnin 1002 >> 交任务：传声盒323号
    .accept 1003 >> 接任务：传声盒525号
step
    #softcore
    #label Turtles
    >>别把附近鱼人全杀光，接任务后要故意让它们击杀自己，以便在墓地复活赶路
    .goto 1439/1,47.88,7433.800
    .accept 4725 >> 接任务：搁浅的海龟
    #softcoreserver
step
    #label Turtles
    .goto 1439/1,47.88,7433.800
    .accept 4725 >> 接任务：搁浅的海龟
step
    #softcore
    .deathskip >> 死一次，然后在奥伯丁复活
    #softcoreserver
step
    .goto 1439/1,491.97,6582.303
    >>若新获得的魔杖更好，请装备它
.target 桑迪斯·织风
>>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4763 >> 交任务：黑木熊怪的堕落
step
    .goto 1439/1,397.65,6437.33
.target 萨纳瑞恩·绿树
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2139 >>交任务：萨纳瑞恩的希望
step
    .goto 1439/1,471.66,6439.95
.target 哨兵戈琳达·纳希恩
>>与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4813 >>交任务：水晶中的碎骨
step
    .goto 1439/1,497.21,6427.72
>>与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .turnin 947 >> 交任务：洞中的蘑菇
.target 巴瑞萨斯·月影
    .accept 948 >> 接任务：安努
step
    .goto 1439/1,503.10,6401.96
     >> 点击旅店外面的通缉告示
    .accept 4740 >> 接任务：通缉：莫克迪普！
step
    .isQuestComplete 1138
    .goto 1439/1,577.77,6371.39
.target 古博·布拉普
>>与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >>交任务：海中的水果
step
    #label end
    #requires bowl
    .goto 1448/1,543.42,6342.52
.target 温尼斯·布莱葛
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4727 >>交任务：搁浅的海龟
    .turnin 4725 >> 交任务：搁浅的海龟
step
     #completewith Murkdeep
     >> 击杀遇到的月夜雄虎；有把握时也击杀月夜雌虎，拾取它们的毛皮。它们与灰斑蓟熊共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .unitscan 月夜雄虎;月夜雌虎
step
     #completewith Murkdeep
    .goto 1439/1,413.37,4818.17,0
     >> 击杀灰斑蓟熊，拾取头皮
    .complete 1003,1 --Grizzled Scalp (4)
step
    .goto 1439/1,89.14,5002.00
>>与|cRXP_FRIENDLY_安努|r交谈
    .turnin 948 >> 交任务：安努
.target 安努
    .accept 944 >> 接任务：主宰之剑
step
    #completewith next
    .goto 1439/1,79.97,4986.72
    .vendor >> 从提亚尼那里买 15 级水
step << Human
    >>捡残骸
    .goto 1439/1,585.63,5237.370
    .accept 4728 >>接任务：搁浅的海洋生物
step
    #label Murkdeep
    .goto 1439/1,549.61,4990.65
    >> 清掉鱼人营地，远离中间的篝火
    >> 清完营地里的怪物后，到营地中央召唤莫克迪普
    >> 如果运气好，莫克迪普可能已在西侧离岸约 30 码处刷新（若先前有人被它击杀）
    .complete 4740,1 --Murkdeep (1)
step
     >> 沿海岸击杀螃蟹，收集优质蟹肉
    .complete 1138,1 --Fine Crab Chunks (6)
step
    >>捡残骸
    .goto 1439/1,799.82,4808.12
    .accept 4730 >>接任务：搁浅的海洋生物
step
    >>拾取残骸。小心，神谕者的闪电箭会造成 90 点伤害；它们生命低于 55% 时会用治疗波回满血。这里的海龟头部可以阻挡视线
    >>总是给自己留一条退路。潮汐猎手并不可怕，但要注意它们低伤害的毒液能力
    >>尽量把治疗药水留到后面使用，尤其是大瓶的
    .goto 1439/1,865.32,4678.432
    .accept 4731 >>接任务：搁浅的海龟
step
    >>岛上的龟壳有视线遮挡
    .goto 1439/1,896.76,4597.21
    .accept 4732 >>接任务：搁浅的海龟
step
    >>在它的颈部拾取残骸，小心被地形遮住的2只怪物（应该只需击杀3只怪物，就能拾取这处残骸）
    .goto 1439/1,892.83,4517.30
    .accept 4733 >>接任务：搁浅的海洋生物
step
    .goto 1439/1,602.01,4678.87
.target 勘察员雷姆塔维尔
>>与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    .turnin 729 >> 交任务：健忘的勘察员
step
    .goto 1439/1,602.01,4678.87
     >>此任务难度极高，建议找其他玩家组队完成
     >> 开始护送任务
.target 勘察员雷姆塔维尔
>>与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    .accept 731,1 >> 接任务：健忘的勘察员
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
    .goto 1439/1,413.37,4818.17,0
     >> 击杀灰斑蓟熊，拾取头皮
    .complete 1003,1 --Grizzled Scalp (4)
step
    #sticky
    #completewith Therylune
    >>留意掉落的“深渊之神”；它掉率较低，但可触发一个顺路完成的任务
    .collect 5352,1,968 --Book: The Powers Below (1)
    .accept 968 >> 接任务：深渊之神
step
    #label Glaive
    .goto 1439/1,433.02,4529.09
     >> 进入主宰之剑，清掉中央祭坛周围的怪物
    .complete 944,1
step
    #sticky
    #label TheryluneE
    .goto 1439/1,410.09,4519.49
.target 瑟瑞露尼
>>与|cRXP_FRIENDLY_瑟瑞露尼|r交谈
    .accept 945 >> 接任务：护送瑟瑞露尼
step
     >> 使用背包里的占卜之碗，将它放到地上
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接任务：暮光之锤的营地
    .use 5251
step
    .goto 1439/1,416.64,4576.69
     >> 点击基座顶部的书。如果已经开始护送瑟瑞露尼，注意不要让她跑远
    .turnin 949 >> 交任务：暮光之锤的营地
    .accept 950 >> 接任务：向安努回复
step
    #label Therylune
    #requires TheryluneE
    >> 完成护送任务
    >> 击杀离开主宰之剑前的最后一只怪后，生起营火，将剩余的肉和蛋全部烹饪以提升烹饪技能
    >> 夜色镇有个可顺路完成的任务需要 50 点烹饪技能
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .isOnQuest 945
step
     #sticky
    #label MoonstalkerP
    .goto 1439/1,493.28,4321.68,100,0
    .goto 1439/1,389.79,4836.94,100,0
    .goto 1439/1,71.46,4749.17,100,0
    .goto 1439/1,389.79,4836.94,0
     >> 击杀遇到的月夜雄虎；有把握时也击杀月夜雌虎，拾取它们的毛皮。它们与灰斑蓟熊共享刷新点
     >> 如果在刷新和掉落方面运气特别差，可以跳过此任务
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .unitscan 月夜雄虎;月夜雌虎
step
    .goto 1439/1,413.37,4818.170
     >> 击杀黑海岸南部各处的灰斑蓟熊，拾取它们的头皮
    .complete 1003,1 --Grizzled Scalp (4)
step
    .goto 1439/1,229.97,4815.55
    .turnin 1003 >> 交任务：传声盒525号
step
    #requires MoonstalkerP
    .goto 1439/1,89.14,5002.00
.target 安努
>>与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >> 交任务：向安努回复
step
    #completewith next
    .goto 1439/1,79.97,4987.16
    .vendor >> 如有需要，从提亚尼那里买食物和饮料
step
    >>接受克罗尼亚的护送任务；若他不在就跳过此步骤
    .goto 1439/1,33.47,4996.33
.target 克罗尼亚·恒影
>>与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈
    .accept 5321 >>接任务：昏昏欲睡
step
    .isOnQuest 5321
    >>拾取克罗尼亚旁边的小灰色箱子
    .goto 1439/1,33.47,4996.33
    .complete 5321,2 --Horn of Awakening (1)
step
    .isOnQuest 5321
    .goto 1440/1,152.23,3260.72
    >>向南前往灰谷。将唤醒号角放入快捷栏；克罗尼亚开始原地踱步并睡着时，对他使用号角
    .complete 5321,1 --Escort Kerlonian Evershade to Maestra's Post (1)
    .use 13536
step
    .isOnQuest 5321
    .goto 1440/1,128.01,3305.31
.target 利拉迪斯·月河
>>与|cRXP_FRIENDLY_利拉迪斯·月河|r交谈
    .turnin 5321 >>交任务：昏昏欲睡
step
    .goto 1440/1,189.71,3185.390
.target 净化者德尔格伦
>>与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 967 >>交任务：奥萨拉克斯之塔
step
    #softcore
    >>沿南边道路前行，前往艾森娜神殿
    -->>Whilst you're doing this, start opening the Website Unstuck tool, and select your character. Do NOT confirm it yet though
    .goto 1440/1,394.43,2677.63
.target 瑟瑞希尔
>>与|cRXP_FRIENDLY_瑟瑞希尔|r交谈
    .turnin 945 >>交任务：护送瑟瑞露尼
    .isQuestComplete 945
step
    #hardcore
    >>沿南边道路前行，前往艾森娜神殿
    .goto 1440/1,394.43,2677.63
.target 瑟瑞希尔
>>与|cRXP_FRIENDLY_瑟瑞希尔|r交谈
    .turnin 945 >>交任务：护送瑟瑞露尼
    .isQuestComplete 945
step
    .hs >> 炉石回奥伯丁
    .cooldown item,6948,>0,1
    .bindlocation 442,1
step
    .subzone 442 >>返回奥伯丁；炉石不可用时请步行返回
step
    .goto 1439/1,577.77,6371.39
.target 古博·布拉普
>>与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >>交任务：海中的水果
step
    .goto 1439/1,543.06,6342.130
.target 温尼斯·布莱葛
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4730 >>交任务：搁浅的海洋生物
    .turnin 4731 >>交任务：搁浅的海龟
    .turnin 4732 >>交任务：搁浅的海龟
    .turnin 4733 >>交任务：搁浅的海洋生物
step
    .goto 1439/1,470.35,6439.07
.target 哨兵戈琳达·纳希恩
>>与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4740 >>交任务：通缉：莫克迪普！
step
    .isQuestComplete 986
    >>保留任务日志中的后续任务，以便继续使用 +3 耐力斗篷。当不再需要该斗篷时，可放弃此任务
    .goto 1439/1,362.93,6434.71
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 986 >>交任务：丢失的主人
.target 特伦希斯
step
    .goto 1439/1,362.93,6434.71
    .accept 993 >>接任务：丢失的主人；保留任务以继续使用任务斗篷
    .target 特伦希斯
    .isQuestTurnedIn 986
step
    .goto 1439/1,489.35,6506.32
.target 考古学家霍莉
>>与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .turnin 731 >> 交任务：健忘的勘察员
    .isQuestComplete 731
step
    .goto 1439/1,489.35,6506.32
.target 考古学家霍莉
>>与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 741 >> 接任务：健忘的勘察员
    .isQuestTurnedIn 731
step
    #completewith next
    .isOnQuest 741
    >>跑回码头，等待前往达纳苏斯的船
    .goto 1439/1,555.50,6418.99,30,0
    .goto 1439/1,769.03,6579.24,40
step
    .isOnQuest 741
    .zone Teldrassil >> 乘船前往达纳苏斯，抵达泰达希尔
step
    .isOnQuest 741
    .goto 1438/1,965.80,8781.63,30 >> 穿过紫色传送门
step
    .questcount >1,741
    .goto 1457/1,2607.74,9642.04
>>与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .turnin 741 >>交任务：健忘的勘察员
.target 首席考古学家杜瑟·灰须
    .accept 942 >>接任务：健忘的勘察员
step
    #completewith ReturnAuberdine
    .zone Teldrassil >>穿过达纳苏斯的紫色传送门前往鲁瑟兰村
    .zoneskip Darnassus,1
    .isQuestTurnedIn 741
step
    #completewith ReturnAuberdine
    .goto 1438/1,841.05,8641.122
    .fp Teldrassil >> 获取泰达希尔飞行点
    .fly Auberdine >> 飞往奥伯丁
    .isQuestTurnedIn 741
    .zoneskip Darkshore
step
    #label ReturnAuberdine
    .subzone 442 >>返回奥伯丁
step
    .goto 1439/1,818.16,6422.92,50,0
    .zone Wetlands >> 乘船前往湿地的米奈希尔港
step
    #completewith next
    .money <0.08
    .goto 1437/0,-819.67,-3691.42,15,0
    .goto 1437/0,-807.26,-3716.22,15,0
    .goto 1437/0,-827.94,-3724.49,15,0
    .goto 1437,10.760,56.721
    >> 如果有 8 银，请检查尼尔·奥雷是否有青铜管，如果有就购买；否则，跳过此步骤
    .collect 4371,1,175,1
step
    .goto 1437/0,-782.03,-3793.12
    .fly Ironforge >> 飞往铁炉堡
step << skip --logout skip
    #completewith next
    .goto 1455/0,-1158.16,-4816.32,0
    +跳到一只狮鹫的头顶，然后登出并重新登录，利用登出机制跳过部分路线
    .link https://www.youtube.com/watch?v=PWMJhodh6Bw >> 点击这里
step
    .zone Stormwind City >> 乘坐矿道地铁前往暴风城
step
    #completewith GoldshireTraining
    .goto 1453/0,638.8,-8341.95
    .vendor >> 如果还没有青铜管，就购买一根
    >>这是限量供应物品，如果NPC没有，就跳过此步骤
    .bronzetube
step << Human
    #label FlyAndy
    .goto 1429/0,409.13,-9100.58
    .zone Elwynn Forest >> 前往：艾尔文森林
step << Gnome
    .goto 1429/0,622.93,-8830.700
    .zone Stormwind City >> 前往：暴风城
step << Gnome
    #label FlyAndy
    >>前往暴风城并开通飞行点
    .goto 1453/0,606.4,-8812.0,50,0
    .goto 1453/0,490.12,-8835.76
    .fp Stormwind City >> 获取暴风城飞行点
step << Gnome
    .goto 1453/0,493.08,-8867.22,12,0
    .goto 1453/0,507.6,-8885.59,18 >> 朝白墙跑，落到下方的小平台。小心！沿着平台跑向暴风城出口
step
    >> 跑进闪金镇旅店二楼
    .goto 1429/0,44.00,-9459.11,15,0
    .goto 1429/0,14.84,-9477.86,15,0
    .goto 1429/0,34.28,-9471.61
    .trainer >> 学习职业技能
    #label GoldshireTraining
step
    .goto 1429/0,-1637.62,-9642.89,125,0
    .zone Redridge Mountains >> 前往：赤脊山，一路向东跑到赤脊山。路上整理好你的按键绑定，确保你的法术在快捷栏中便于施放
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师
#forever
#disabledungeons
<< Alliance Mage
#name 18-21 Redridge Mage AoE
#version 1
#group RestedXP Alliance Mage
#defaultfor none Alliance Mage
#next 21-22 Duskwood Mage AoE
#displayname 18-21 赤脊山（法师 AoE）
step
    #sticky
    #completewith Gnolls
    +遇到任务所需的怪物时，开始以每群3+只的规模用AoE清怪。
    >>如有需要，在另一个标签页打开此教程，参考赤脊山AoE部分：
    .link https://youtu.be/SxMc2GoP33c?t=56 >> 点击这里
step
    >>与卫兵帕克交谈，他在十字路口附近巡逻
    .goto 1429/0,-1902.44,-9609.56
.target 卫兵帕克
>>与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接任务：豺狼人的入侵
step
    #sticky
    #label Gnolls
    .goto 1433/0,-2238.15,-9443.60
>>与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >>交任务：豺狼人的入侵
.target 菲尔顿副队长
    .accept 246 >>接任务：审时度势
step
    .goto 1433/0,-2234.89,-9435.060
    .fp Redridge Mountains >> 获取赤脊山飞行点
step
    #requires Gnolls
    .goto 1433/0,-2298.28,-9283.90
.target 治安官马瑞斯
>>与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .accept 20 >>接任务：黑石氏族的威胁
step
    .goto 1433/0,-2268.54,-9279.27
.target 工头奥斯洛
>>与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .accept 125 >>接任务：丢失的工具
step
    .goto 1433/0,-2242.49,-9259.00
.target 弗纳·奥斯古
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    .accept 118 >>接任务：马掌
step
    >>议政厅内部
    .goto 1433/0,-2216.00,-9215.85
.target 拜里弗·科纳彻尔
>>与|cRXP_FRIENDLY_拜里弗·科纳彻尔|r交谈
    .accept 91 >>接任务：所罗门的律法
step
    .goto 1433/0,-2221.87,-9218.60
    >>进入建筑
.target 所罗门镇长
>>与|cRXP_FRIENDLY_所罗门镇长|r交谈
    .accept 120 >>接任务：送往暴风城的信
step
    .goto 1433/0,-2172.59,-9261.02
.target 码头管理员巴伦
>>与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
    .accept 127 >>接任务：卖鱼
step
    .goto 1433/0,-2151.53,-9247.12
    .accept 180 >>接任务：通缉：范高雷中尉
step
    >>旅店内
    .goto 1433/0,-2158.91,-9235.97
.target 达希
>>与|cRXP_FRIENDLY_达希|r交谈
    .accept 129 >>接任务：免费的午餐
step
    .goto 1433/0,-2157.18,-9223.96
    .home >> 将炉石设为湖畔镇
step
    .goto 1433/0,-2207.32,-9351.66
.target 肖恩
>>与|cRXP_FRIENDLY_肖恩|r交谈
    .accept 3741 >>接任务：希拉里的项链
step
    >>在水下寻找希拉里的项链，它藏在一块棕色泥土中
    .goto 1433/0,-2174.32,-9386.56,90,0
    .goto 1433/0,-2147.41,-9308.08,90,0
    .goto 1433/0,-2090.96,-9373.82,90,0
    .goto 1433/0,-1986.76,-9324.30,90,0
    .goto 1433/0,-2246.40,-9359.92,90,0
    .goto 1433/0,-2309.57,-9376.28,90,0
    .goto 1433/0,-2397.70,-9363.97,90,0
    .complete 3741,1 --Hilary's Necklace (1)
step
    #completewith next
    .goto 1433/0,-1906.66,-9478.500,0
    +使用群伤技能击杀营地里的豺狼人
step
    .goto 1433/0,-1902.54,-9609.83
>>与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .turnin 129 >>交任务：免费的午餐
.target 卫兵帕克
    .accept 130 >>接任务：寻访草药师
step
    .goto 1433/0,-2234.89,-9435.21
    .fly Stormwind >> 飞往暴风城
step
    >>进入暴风城，前往武器训练师处
   .goto 1453/0,612.99,-8796.14
   .trainer >> 学习单手剑（1h）和匕首
step
    #ah
    .goto 1453/0,660.17,-8814.51,30,0
    .goto 1453/0,638.26,-8342.31
    +前往拍卖行，如果价格合适就购买一个青铜管
    >>如果这里没有青铜管或价格太高，也可试着向矮人区的比利巴布·旋轮购买
    >>如果找不到，就跳过此步骤
    .bronzetube
step
    .goto 1453/0,660.17,-8814.51,30,0
    .goto 1453/0,638.26,-8342.31
    .vendor >> 到矮人区找比利巴布·旋轮，查看是否有青铜管出售；有货就买一个
    .bronzetube
step
    .goto 1453/0,520.77,-8954.16
>>与|cRXP_FRIENDLY_马库斯·乔纳森将军|r交谈
    .turnin 120 >>交任务：送往暴风城的信
.target 马库斯·乔纳森将军
    .accept 121 >>接任务：送往暴风城的信
step
    >>跑向闪金镇
    .goto 1429/0,87.73,-9456.79
>>与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
    .turnin 118 >>交任务：马掌
.target 铁匠阿古斯
    .accept 119 >>接任务：回复弗纳
step
    >>跑向哨兵岭
    .goto 1436/0,1045.12,-10508.80
.target 格里安·斯托曼
>>与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 65 >>接任务：迪菲亚兄弟会
step
    #completewith LakeshireReturn
    #label hsLakeshire
    .hs Lakeshire >> 如果炉石可用，就返回湖畔镇
    .cooldown item,6948,>0,1
    .bindlocation 69,1
step
    #completewith LakeshireReturn
    #label WFFP
    .goto 1436/0,1037.42,-10628.50
    .fp Westfall >> 获取西部荒野飞行点
    .fly Redridge >> 飞往赤脊山
    .subzoneskip 69
step
    #label LakeshireReturn
    .subzone 69 >>返回湖畔镇；炉石不可用时从哨兵岭乘坐飞行坐骑返回
step
    #requires WFFP
    .goto 1433/0,-2243.14,-9259.43
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    .turnin 119 >>交任务：回复弗纳
.target 弗纳·奥斯古
    .accept 122 >>接任务：雏龙的鳞片
    .accept 124 >>接任务：豺狼人的乱吠
step
    >>进入要塞
    .goto 1433/0,-2220.56,-9218.74
>>与|cRXP_FRIENDLY_所罗门镇长|r交谈
    .turnin 121 >>交任务：送往暴风城的信
.target 所罗门镇长
    .accept 143 >>接任务：送往西部荒野的信
.target 拜里弗·科纳彻尔
>>与|cRXP_FRIENDLY_拜里弗·科纳彻尔|r交谈
    .accept 91 >>接任务：所罗门的律法
step
    >>进旅店顶层
    .goto 1433/0,-2145.45,-9231.63
>>与|cRXP_FRIENDLY_黑衣威利|r交谈
    .turnin 65 >>交任务：迪菲亚兄弟会
.target 黑衣威利
    .accept 132 >>接任务：迪菲亚兄弟会
step
    .goto 1433/0,-2205.58,-9351.52
.target 希拉里
>>与|cRXP_FRIENDLY_希拉里|r交谈
    .turnin 3741 >>交任务：希拉里的项链
step
    #era/som
    #completewith Murlocs
    >>做其他任务时，顺便收集赤脊山炖肉所需的前3种材料；另刷够大块野猪肉，将烹饪练到50
    >>重点击杀[血牙野猪]，暂时不用担心蜘蛛肉
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .collect 1080,5,92,1 --Tough Condor Meat (5)
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
step
    #completewith Murlocs
    >>击杀雏龙，拾取它们掉落的鳞片
    .complete 122,1 --Underbelly Whelp Scale (6)
step
    >>对区域内的豺狼人使用群伤技能；如需参考，可查看群伤教学视频
    >>拉怪进行群伤时，让偷猎者处于无法射击的近距离盲区内，以免被射击
    .goto 1433/0,-2211.45,-9793.71,50,0
    .goto 1433/0,-2321.94,-9776.63,50,0
    .goto 1433/0,-2513.84,-9604.61,50,0
    .goto 1433/0,-2211.45,-9793.71,50,0
    .goto 1433/0,-2321.94,-9776.63,50,0
    .goto 1433/0,-2513.84,-9604.61,50,0
    .complete 246,1 --Redridge Mongrel (10)
    .complete 246,2 --Redridge Poacher (6)
step
    #label Murlocs
    >>对附近的鱼人使用范围攻击；鱼人招潮者会用闪电箭和治疗波，必须单独攻击
    >>鱼人巡滩者会冲锋，鱼人食腐者攻击时可能瞬间吸取 25 点生命值；可对它们使用范围攻击，灵活安排拉怪
    >>把8个鳍留到以后用
    .goto 1433/0,-2630.63,-9581.16
    .complete 127,1 --Spotted Sunfish (10)
    .collect 1468,8,150,1 --Murloc Fin (8)
step
    #era/som
    >>在这个区域附近获取秃鹫肉和幼龙鳞片。如果在等待刷新，可以向东去拿一些斧头，再回来这里
    .goto 1433/0,-2895.91,-9697.86
    .collect 1080,5,92,1 --Tough Condor Meat (5)
    .complete 122,1 --Underbelly Whelp Scale (6)
step
    #som
    #phase 3-6
    >>从这个区域周围的幼龙身上获取鳞片。如果在等待刷新，可以向东去拿一些斧头，然后回来
    .goto 1433/0,-2895.91,-9697.86
    .complete 122,1 --Underbelly Whelp Scale (6)
step
    >>对附近兽人使用范围攻击并拾取它们的斧头。小心黑石前锋的网和黑石叛节者的盾击
    >>尽量避开等级较高的黑石叛节者；每次最多拉 3 只。此处范围攻击风险极高、收益中等
    >>先别把所有斧头都拿了，之后有更好的机会再做完
    .goto 1433/0,-3226.75,-9789.51,50,0
    .goto 1433/0,-3210.46,-9637.19,50,0
    .goto 1433/0,-3226.75,-9789.51,50,0
    .goto 1433/0,-3210.46,-9637.19,50,0
    .collect 3014,8 --Battleworn Axe (8)
step
    >>潜入水下，拾取灰色箱子
    .goto 1433/0,-2472.16,-9366.72
    .complete 125,1 --Oslow's Toolbox (1)
step
    #era/som
    >>在这里收齐巨型血牙野猪头
    .goto 1433/0,-2267.02,-9596.36
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
step
    .goto 1433/0,-2238.15,-9443.75
.target 菲尔顿副队长
>>与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 246 >>交任务：审时度势
step
    .isQuestComplete 20
    .goto 1433/0,-2298.06,-9283.90
.target 治安官马瑞斯
>>与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .turnin 20 >>交任务：黑石氏族的威胁
step
    .goto 1433/0,-2268.54,-9279.12
>>与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .turnin 125 >>交任务：丢失的工具
.target 工头奥斯洛
    .accept 89 >>接任务：止水湖上的桥
step
    .goto 1433/0,-2243.36,-9259.43
.target 弗纳·奥斯古
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    .turnin 122 >>交任务：雏龙的鳞片
step
    #level 20
    .goto 1433/0,-2172.59,-9261.02
>>与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
    .turnin 127 >>交任务：卖鱼
.target 码头管理员巴伦
    .accept 150 >>接任务：鱼人偷猎者
    .turnin 150 >>交任务：鱼人偷猎者
step
    .goto 1433/0,-2172.59,-9261.02
.target 码头管理员巴伦
>>与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
    .turnin 127 >>交任务：卖鱼
step
    .goto 1433/0,-2045.38,-9245.82
>>与|cRXP_FRIENDLY_玛蒂·詹罗斯|r交谈
    .turnin 130 >>交任务：寻访草药师
.target 玛蒂·詹罗斯
    .accept 131 >>接任务：水仙诉衷情
    .accept 34 >>接任务：不速之客
step
    >>击杀贝利格拉布，将它一路风筝到镇里的卫兵亚当斯身边
    >>小心它的震颤（瞬发80点AoE伤害）和冲锋；尽量让它保持减速，并用冰霜新星定住
    >>确保你造成了多数伤害（51%+）
    >>这个任务非常困难
    .goto 1433/0,-1910.79,-9288.97
    .complete 34,1 --Bellygrub's Tusk (1)
--N Add link
step
    .goto 1433/0,-2045.16,-9245.67
.target 玛蒂·詹罗斯
>>与|cRXP_FRIENDLY_玛蒂·詹罗斯|r交谈
    .turnin 34 >>交任务：不速之客
step
    .goto 1433/0,-2031.70,-9098.71,60,0
    .goto 1433/0,-2313.26,-9149.82,60,0
    .goto 1433/0,-2430.70,-9030.51,60,0
    .goto 1433/0,-2313.26,-9149.82,60,0
    .goto 1433/0,-2031.70,-9098.71,60,0
    .goto 1433/0,-2313.26,-9149.82,60,0
    .goto 1433/0,-2430.70,-9030.51,60,0
    >>击杀豺狼人，拾取它们掉落的铁矛和铁铆钉
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .complete 124,1 --Redridge Brute (10)
    .complete 124,2 --Redridge Mystic (8)
step
    #completewith next
    >>击杀聚在一起的兽人，拾取斧头以完成收集
    >>如果清掉近处的怪后仍然运气不好，稍后还有另一次机会
    .goto 1433/0,-2375.13,-9228.73,50,0
    .goto 1433/0,-2401.83,-9180.95,50,0
    .goto 1433/0,-2449.15,-9161.70,50,0
    .complete 20,1 --Blackrock Axe (10)
step
    #era/som
    #completewith next
    .goto 1433/0,-2639.97,-9149.24,150 >> 跑向蜘蛛区域
step
    #era/som
    >>击杀蜘蛛，拾取它们掉落的肉
    >>小心，它们的毒会造成一些伤害
    >>小心查特（稀有），他有一个持续 8 秒的眩晕
    .goto 1433/0,-2813.20,-9230.04
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
step
    >>继续击杀兽人来拿斧头
    .goto 1433/0,-2911.11,-9195.00
    .complete 20,1 --Blackrock Axe (10)
step
    .goto 1433/0,-2298.06,-9283.90
.target 治安官马瑞斯
>>与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .turnin 20 >>交任务：黑石氏族的威胁
step
    .goto 1433/0,-2268.76,-9279.27
.target 工头奥斯洛
>>与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .turnin 89 >>交任务：止水湖上的桥
step
    .goto 1433/0,-2243.36,-9259.57
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    .turnin 124 >>交任务：豺狼人的乱吠
.target 弗纳·奥斯古
    .accept 126 >>接任务：群山中的嚎叫
step
    .goto 1433/0,-2158.91,-9235.97
.target 达希
>>与|cRXP_FRIENDLY_达希|r交谈
    .turnin 131 >>交任务：水仙诉衷情
step
    .goto 1433/0,-2157.18,-9223.81
    .vendor >> 购买15级饮料
step
    #era/som
    .goto 1433/0,-2063.61,-9212.080
    >>离开旅店，向西进入建筑
.target 厨师布雷纳
>>与|cRXP_FRIENDLY_厨师布雷纳|r交谈
    .accept 92 >> 接任务：赤脊山炖肉
    .turnin 92 >> 交任务：赤脊山炖肉
step
    #era/som
    #completewith next
    .goto 1433/0,-2146.97,-9225.110
    +烹饪野猪肉，直到烹饪技能达到 50 点
    >>如果肉不够，可以在去夜色镇的路上刷些野猪
step
    .goto 1433/0,-1711.94,-9895.21,90,0
    .zone Duskwood >> 前往暮色森林
]])
