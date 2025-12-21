local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance Mage
#name 12-18 黑海岸法师AoE
#displayname 12-18 黑海岸法师AoE \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟法师
#defaultfor Alliance Mage
#next 18-21级赤脊山法师AoE

step
    #completewith next
    .goto Darkshore,36.77,44.28
    .vendor >>你可以从莱尔德(鱼贩)处购买极为便宜的5级食物
step
    >>上楼到顶层
    .goto Darkshore,36.98,44.14
.target Wizbang Cranktoggle
>>与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >>接任务: |cRXP_LOOT_传声盒827号|r
step
    >>跳到一楼
    .goto Darkshore,37.04,44.13
    .home >>将你的[炉石]设置为奥伯丁
step
    .goto Darkshore,37.32,43.64
.target Barithras Moonshade
>>与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >>接任务: |cRXP_LOOT_洞中的蘑菇|r
step
    .goto Darkshore,37.68,43.38
.target Sentinel Glynda Nal'Shea
>>与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .accept 4811 >>接任务: |cRXP_LOOT_红色水晶|r
step
    .goto Darkshore,38.84,43.41
.target Tharnariun Treetender
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2118 >>接任务: |cRXP_LOOT_瘟疫蔓延|r
step
    .goto Darkshore,39.37,43.49
.target Terenthis
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 984 >>接任务: |cRXP_LOOT_熊怪的威胁|r
step
    .goto Darkshore,36.62,45.59
.target Gwennyth Bly'Leggonde
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >>接任务: |cRXP_LOOT_搁浅的巨兽|r
step
    .goto Darkshore,36.34,45.58
    .fp Auberdine >>获取奥伯丁的飞行路径
step
    #completewith Bear
     >>击杀海岸沿线的海蟹
    .complete 983,1 --Crawler Leg (6)
step
    .goto Darkshore,36.38,50.88
     >>击杀海洋生物并获取战利品
    .complete 3524,1 --Sea Creature Bones (1)
step
    #sticky
    #completewith next
    >>找到一只狂暴的蓟熊, 挑衅其中一只, 并使用背包中的“萨纳瑞恩的希望”(紫色光球)
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
step
    .goto Darkshore,39.01,53.70
     >>前往熊怪营地附近
    .complete 984,1 --Find a corrupt furbolg camp (1)
step
    #label Bear
    >>找到一只狂暴的蓟熊, 挑衅其中一只, 并使用背包中的“萨纳瑞恩的希望”(紫色光球)
    .goto Darkshore,38.47,57.92
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
step
    .goto Darkshore,36.61,54.29,150,0
    .goto Darkshore,36.10,44.42
    >>击杀海岸沿线的海蟹
    .complete 983,1 --Crawler Leg (6)
step
    #sticky
    #completewith ReadAndy
     >>稍后保存5份陆行鸟肉
    .collect 5469,5,2178,1
step
    .goto Darkshore,36.66,46.26
    .turnin 983 >>交任务: |cRXP_FRIENDLY_传声盒827号|r
    .accept 1001 >>接任务: |cRXP_LOOT_传声盒411号|r
step
    .goto Darkshore,36.62,45.59
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 3524 >>交任务: |cRXP_FRIENDLY_搁浅的巨兽|r
.target Gwennyth Bly'Leggonde
    .accept 4681 >>接任务: |cRXP_LOOT_搁浅的巨兽|r
step
    .goto Darkshore,36.73,44.06,40,0
    >>前往码头
    .goto Darkshore,35.74,43.70
.target Cerellean Whiteclaw
>>与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .accept 963 >>接任务: |cRXP_LOOT_永志不渝|r
step
    #sticky
    #completewith Thundris
     >>击杀海中的暗shore捕食者
    .complete 1001,1 --Thresher Eye (3)
step
    #completewith next
    .goto Darkshore,33.70,42.45,60 >>跑到码头, 然后在交叉处跳入水中
step
    .goto Darkshore,31.86,46.33
    >>点击水下的海龟头部
    .complete 4681,1 --Sea Turtle Remains (1)
step
    .goto Darkshore,36.62,45.59
    >>击杀返程途中遇到的掠食者, 返回岸边
.target Gwennyth Bly'Leggonde
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4681 >>交任务: |cRXP_FRIENDLY_搁浅的巨兽|r
step
    .goto Darkshore,38.84,43.41
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2118 >>交任务: |cRXP_FRIENDLY_瘟疫蔓延|r
.target Tharnariun Treetender
    .accept 2138 >>接任务: |cRXP_LOOT_清除疫病|r
step
    .goto Darkshore,39.37,43.49
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 984 >>交任务: |cRXP_FRIENDLY_熊怪的威胁|r
.target Terenthis
    .accept 985 >>接任务: |cRXP_LOOT_熊怪的威胁|r
    .accept 4761 >>接任务: |cRXP_LOOT_桑迪斯·织风|r
step
    >>击杀熊怪
    .goto Darkshore,39.83,56.11
    .goto Darkshore,39.74,53.76,0
    .complete 985,1 --Blackwood Pathfinder (8)
    .complete 985,2 --Blackwood Windtalker (5)
step
    .goto Darkshore,39.37,43.48
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 985 >>交任务: |cRXP_FRIENDLY_熊怪的威胁|r
.target Terenthis
    .accept 986 >>接任务: |cRXP_LOOT_丢失的主人|r
step
    >>上楼
    .goto Darkshore,39.04,43.55
.target Sentinel Elissa Starbreeze
>>与|cRXP_FRIENDLY_哨兵艾莉萨·星风|r交谈
    .accept 965 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
step
    .goto Darkshore,38.11,41.16
.target Gorbold Steelhand
>>与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >>接任务: |cRXP_LOOT_深不可测的海洋|r
step
    #label Thundris
    .goto Darkshore,37.39,40.13
>>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >>交任务: |cRXP_FRIENDLY_桑迪斯·织风|r
.target Thundris Windweaver
    .accept 4762 >>接任务: |cRXP_LOOT_壁泉河|r
    .accept 954 >>接任务: |cRXP_LOOT_巴莎兰|r
    .accept 958 >>接任务: |cRXP_LOOT_上层精灵的工具|r
step
     #label Threshers
     #sticky
     >>沿着海岸游泳, 击杀掠食者鲨
    .complete 1001,1 --Thresher Eye (3)
step
    .goto Darkshore,38.93,29.33,40,0
    .goto Darkshore,38.23,28.79
     >>从船体上的洞口进入第一艘船, 然后前往该船底层的后部
    .complete 982,1 --Silver Dawning's Lockbox (1)
step
    #requires Threshers
    .goto Darkshore,40.30,27.69,40,0
    .goto Darkshore,39.63,27.45
     >>通过船体上的洞进入第二艘船, 然后前往该船最低层的后部
    .complete 982,2 --Mist Veil's Lockbox (1)
step
    .goto Darkshore,41.96,28.64
    .turnin 1001 >>交任务: |cRXP_FRIENDLY_传声盒411号|r
    .accept 1002 >>接任务: |cRXP_LOOT_传声盒323号|r
step
    .goto Darkshore,41.94,31.47
    .accept 4723 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step
    .goto Felwood,27.70,10.03
>>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 954 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
.target Asterion
    .accept 955 >>接任务: |cRXP_LOOT_巴莎兰|r
step
    .goto Felwood,29.13,12.34
     >>击杀格雷尔金斯, 掠夺他们的耳环
    .complete 955,1 --Grell Earring (8)
step
    .goto Felwood,27.70,10.03
>>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 955 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
.target Asterion
    .accept 956 >>接任务: |cRXP_LOOT_巴莎兰|r
step
    .goto Felwood,29.60,12.52
     >>击杀萨特. 击杀后搜刮, 获取封印
    .complete 956,1 --Ancient Moonstone Seal (1)
step
    .goto Felwood,27.70,10.03
>>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 956 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
.target Asterion
    .accept 957 >>接任务: |cRXP_LOOT_巴莎兰|r
step
    #sticky
    #completewith ReadAndy
     >>击杀任意类型的月行者. 掠夺它们的利牙
    .complete 1002,1 --Moonstalker Fang (6)
--N don't think unitscan is needed
step
    #sticky
    #completewith ReadAndy
    >>击杀你看到的狂暴蓟熊. 确保至少拥有50%的法力, 在它们对你施加狂犬病(减益效果)前将其秒杀
    .complete 2138,1 --Rabid Thistle Bear (20)
step
    .goto Darkshore,50.77,25.43
    >>使用背包中的[空的水样试管]
    .complete 4762,1 --Cliffspring River Sample (1)
step
    #sticky
    #completewith ReadAndy
    +把打怪时获得的小蛋存起来, 以后用来提升烹饪等级. 所有获得的轻羽毛也要保存起来以备后用
step
    .goto Darkshore,47.11,48.63
     >>跑到山里的红色水晶那里
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range (1)
step
    #label ReadAndy
    .goto Darkshore,40.30,59.73
.target Sentinel Tysha Moonblade
>>与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 953 >>接任务: |cRXP_LOOT_亚米萨兰的毁灭|r
step
    #sticky
    #label anaya
    .goto Darkshore,42.29,60.46,0
     >>击杀安纳亚·黎明行者. 她会在亚米萨兰中部区域巡逻
    .complete 963,1
    .unitscan ANAYA DAWNRUNNER
step
    #label ghosts
    #sticky
    .goto Darkshore,42.66,61.90,0
     >>击杀幽灵, 搜刮遗物
    .complete 958,1 --Highborne Relic (7)
step
    .goto Felwood,25.98,40.62
     >>点击地面上的石板
    .complete 953,2 --Read the Fall of Ameth'Aran (1)
step
    .goto Felwood,25.66,39.11
     >>点击凉亭中的绿色火把
    .complete 957,1 --Destroy the seal at the ancient flame (1)
step
    .goto Felwood,26.71,35.53
     >>点击地面上的石板
    .complete 953,1 --Read the Lay of Ameth'Aran (1)
step
#hidewindow
    #requires ghosts
step
    #requires anaya
    .goto Darkshore,40.30,59.73
.target Sentinel Tysha Moonblade
>>与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .turnin 953 >>交任务: |cRXP_FRIENDLY_亚米萨兰的毁灭|r
step
    .goto Darkshore,38.83,60.82
    >>完成击杀狂暴蓟熊并获得陆行鸟肉
    .complete 2138,1 --Rabid Thistle Bear (20)
    .collect 5469,5,2178,1
step
    >>击杀海龟获取战利品
    .goto Darkshore,37.14,62.12
    .accept 4722 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    >>击杀海龟获取战利品
    .goto Darkshore,36.02,70.79
    .accept 4728 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step
    .hs >>传送至奥伯丁
step
    .goto Darkshore,38.84,43.42
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >>交任务: |cRXP_FRIENDLY_清除疫病|r
.target Tharnariun Treetender
    .accept 2139 >>接任务: |cRXP_LOOT_萨纳瑞恩的希望|r
step
    .goto Darkshore,38.11,41.17
.target Gorbold Steelhand
>>与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .turnin 982 >>交任务: |cRXP_FRIENDLY_深不可测的海洋|r
    .vendor >>从戈尔博德处购买一些甜香料, 直到数量足够用来烹饪所有鸡蛋
step
    .goto Darkshore,37.69,40.66
    >>确保你在烹饪技能上达到10点, 否则无法接受或提交任务
.target Alanndarian Nightsong
>>与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >>接任务: |cRXP_LOOT_炖陆行鸟|r
    .turnin 2178 >>交任务: |cRXP_FRIENDLY_炖陆行鸟|r
step
    .goto Darkshore,37.40,40.13
>>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 958 >>交任务: |cRXP_FRIENDLY_上层精灵的工具|r
    .turnin 4762 >>交任务: |cRXP_FRIENDLY_壁泉河|r
.target Thundris Windweaver
    .accept 4763 >>接任务: |cRXP_LOOT_黑木熊怪的堕落|r
step
    .goto Darkshore,37.44,41.84
.target Archaeologist Hollee
>>与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >>接任务: |cRXP_LOOT_健忘的勘察员|r
step
    .goto Darkshore,37.71,43.36
>>与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .turnin 4811 >>交任务: |cRXP_FRIENDLY_红色水晶|r
.target Sentinel Glynda Nal'Shea
    .accept 4812 >>接任务: |cRXP_LOOT_清洗水晶|r
step
    .goto Darkshore,37.78,44.06
     >>在月井处填充空水瓶
    .complete 4812,1
     >>在月井处填满空碗
    .collect 12347,1,4763,1
step
    #completewith next
    .goto Darkshore,36.83,43.91
    .vendor >>从塔尔丹处购买15级药水
step
    >>返回码头
    .goto Felwood,18.10,18.48
.target Cerellean Whiteclaw
>>与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .turnin 963 >>交任务: |cRXP_FRIENDLY_永志不渝|r
step
    .goto Darkshore,36.09,44.93
.target Gubber Blump
>>与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >>接任务: |cRXP_LOOT_海中的水果|r
step
    .goto Darkshore,36.62,45.59
.target Gwennyth Bly'Leggonde
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4722 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .turnin 4723 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .turnin 4728 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r << Gnome
step
    .goto Darkshore,47.32,48.70
     >>点击红色水晶
    .turnin 4812 >>交任务: |cRXP_FRIENDLY_清洗水晶|r
    .accept 4813 >>接任务: |cRXP_LOOT_水晶中的碎骨|r
step
    #sticky
    #label MoonstalkersF
     >>击杀任意类型的月行者. 掠夺它们的利牙
    .complete 1002,1 --Moonstalker Fang (6)
    .unitscan Moonstalker;Moonstalker Runt
step
    .goto Darkshore,44.18,36.29
.target Asterion
>>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 957 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
step
    .goto Darkshore,50.66,34.98
    >>装备你的新法杖
    >>从桶中拾取黑木谷物样本, 然后向东南方向跑向雌蓟熊(不要与怪物战斗)
    .collect 12342,1 --Blackwood Grain Sample (1)
step
    .goto Darkshore,52.60,36.65,45,0
    >>击杀巢穴之母. 注意她的幼崽会将你击倒2秒
    >>如果觉得困难, 先刷到16级再尝试一次
    .goto Darkshore,51.48,38.26
    .complete 2139,1 --Den Mother (1)
step
    >>从桶中获取黑木坚果样本
    .goto Darkshore,51.80,33.51
    .collect 12343,1 --Blackwood Nut Sample (1)
step
    >>从桶中获取黑木水果样本. 一个怪物会在你面前与西边小屋之间生成——你可能需要跑起来
    .goto Darkshore,52.85,33.42
    .collect 12341,1 --Blackwood Fruit Sample (1)
step
    >>在营地火旁使用背包中装满水的净化碗. 这将使附近的全部熊怪变为友好状态
    >>击杀在营地之间生成并绕着火堆跑动的萨特. 由于他可能难以对付, 请从最大射程开始攻击. 击杀后, 会掉落一个篮子, 请将其拾取
    .goto Darkshore,52.38,33.29
    .complete 4763,1 --Talisman of Corruption (1)
step
    #completewith next
    .goto Darkshore,54.98,32.79,35 >>前往瀑布上方的洞穴
step
    .goto Darkshore,55.66,34.89
     >>待在洞穴的上半部分. 如果顶部尽头没有毒帽蘑菇, 就跳下去从下面拿一个
     >>当你拾取毒帽蘑菇时, 洞口的第一个蓝色怪物应该已经刷新了
    .complete 947,1 --Scaber Stalk (5)
    .complete 947,2 --Death Cap (1)
step
    .goto Darkshore,54.97,24.89
>>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 965 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
.target Balthule Shadowstrike
    .accept 966 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
step
    >>击杀暗影裂隙狂热者, 搜刮他们的羊皮纸
    .goto Darkshore,55.36,26.84
    .complete 966,1 --Worn Parchment (4)
step
    .goto Darkshore,54.97,24.89
>>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 966 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
.target Balthule Shadowstrike
    .accept 967 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
step
    #requires MoonstalkersF
    .goto Darkshore,53.11,18.16
    .accept 4727 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    #sticky
    #completewith Turtles
     >>击杀海岸边的暗礁蟹即可, 无需特意前往完成此任务——不要击杀等级高出你4级或以上的怪物
    .complete 1138,1 --Fine Crab Chunks (6)
step
    .goto Darkshore,51.38,24.19,25,0
    .goto Darkshore,51.29,24.53
    .turnin 1002 >>交任务: |cRXP_FRIENDLY_传声盒323号|r
    .accept 1003 >>接任务: |cRXP_LOOT_传声盒525号|r
step
    #softcore
    #label Turtles
    >>留一些附近的鱼人不杀, 接受任务后你会死在它们手里
    .goto Darkshore,44.18,20.60
    .accept 4725 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    #hardcore
    #label Turtles
    .goto Darkshore,44.18,20.60
    .accept 4725 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    #softcore
    .deathskip >>在奥伯丁死亡并复活
step
    .goto Darkshore,37.40,40.13
    >>装备你的新法杖
.target Thundris Windweaver
>>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4763 >>交任务: |cRXP_FRIENDLY_黑木熊怪的堕落|r
step
    .goto Darkshore,38.84,43.42
.target Tharnariun Treetender
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2139 >>交任务: |cRXP_FRIENDLY_萨纳瑞恩的希望|r
step
    .goto Darkshore,37.71,43.36
.target Sentinel Glynda Nal'Shea
>>与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .turnin 4813 >>交任务: |cRXP_FRIENDLY_水晶中的碎骨|r
step
    .goto Darkshore,37.32,43.64
>>与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .turnin 947 >>交任务: |cRXP_FRIENDLY_洞中的蘑菇|r
.target Barithras Moonshade
    .accept 948 >>接任务: |cRXP_LOOT_安努|r
step
    .goto Darkshore,37.23,44.23
     >>点击旅店外的通缉告示
    .accept 4740 >>接任务: |cRXP_LOOT_通缉：莫克迪普！|r
step
    .isQuestComplete 1138
    .goto Darkshore,36.09,44.93
.target Gubber Blump
>>与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >>交任务: |cRXP_FRIENDLY_海中的水果|r
step
    #label end
    #requires bowl
    .goto Felwood,19.10,20.63
.target Gwennyth Bly'Leggonde
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4727 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .turnin 4725 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
step
     #completewith Murkdeep
     >>击杀你找到的任何月夜雄虎, 如果你觉得安全的话也可以击杀母熊. 从它们身上获取毛皮. 它们与灰白蓟草熊共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .unitscan Moonstalker Sire;Moonstalker Matriarch
step
     #completewith Murkdeep
    .goto Darkshore,38.60,80.50,0
     >>击杀灰蓟熊, 掠夺它们的头皮
    .complete 1003,1 --Grizzled Scalp (4)
step
    .goto Darkshore,43.55,76.29
>>与|cRXP_FRIENDLY_安努|r交谈
    .turnin 948 >>交任务: |cRXP_FRIENDLY_安努|r
.target Onu
    .accept 944 >>接任务: |cRXP_LOOT_主宰之剑|r
step
    #completewith next
    .goto Darkshore,43.69,76.64
    .vendor >>从提亚尼处购买15级水
step << Human
    >>拾取遗骸
    .goto Darkshore,35.97,70.90
    .accept 4728 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step
    #label Murkdeep
    .goto Darkshore,36.52,76.55
    >>清理鱼人营地, 远离中央的篝火
    >>清除所有目标后, 前往营地中心召唤莫克迪普
    >>如果你运气好, 莫克迪普可能已经漂到了西边海岸约30码外的地方(如果之前有人死在他身上的话)
    .complete 4740,1 --Murkdeep (1)
step
     >>沿海岸击杀螃蟹, 收集优质蟹肉
    .complete 1138,1 --Fine Crab Chunks (6)
step
    >>拾取遗骸
    .goto Darkshore,32.70,80.73
    .accept 4730 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step
    >>搜刮残骸. 请注意, 先知会释放造成90点伤害的闪电箭, 并且当它们的生命值低于55%时, 可以使用治疗波恢复至满血. 这里的龟头具有视野阻挡(LoS)
    >>总是给自己留一条退路. 潮汐猎手并不可怕, 但要注意它们低伤害的毒液能力
    >>尽量把你的治疗药水留到后面用, 尤其是大瓶的
    .goto Darkshore,31.70,83.72
    .accept 4731 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    >>岛上的龟壳具有视野遮挡效果
    .goto Darkshore,31.22,85.56
    .accept 4732 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    >>在它颈部获取战利品, 小心被地形遮挡的2个怪物(你只需击杀3个怪物即可获得此战利品)
    .goto Darkshore,31.28,87.39
    .accept 4733 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step
    .goto Darkshore,35.72,83.69
.target Prospector Remtravel
>>与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    .turnin 729 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
step
    .goto Darkshore,35.72,83.69
     >>这个任务非常困难. 如果可能的话, 建议与其他玩家组队完成
     >>开始护送任务
.target Prospector Remtravel
>>与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    .accept 731,1 >>接任务: |cRXP_LOOT_健忘的勘察员|r
step
     >>护送勘察员雷姆塔维尔
     >>让Remtravel吸引所有怪物仇恨(因为怪物需要攻击他才会对他产生仇恨), 然后用火球轰炸怪物
     >>Remtravel非常脆, 所以尽量把其他怪物的仇恨从他身上引开
     >>当穴居人出现时, 先变形他未攻击的那个, 然后在另一个穴居人击中他时将其击杀. 靠近终点处出现的法师, 需等它释放火球攻击勘探者后再施放变形术
     >>如果你第一次无法完成这个任务, 就直接跳过吧——它对技巧要求非常高, 而且非常依赖运气
     .complete 731,1 --护送勘察员雷姆塔维尔 (1)
step
     #completewith Glaive
     >>击杀你找到的任何月夜雄虎, 如果你觉得安全的话也可以击杀母熊. 从它们身上获取毛皮. 它们与灰白蓟草熊共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .unitscan Moonstalker Sire;Moonstalker Matriarch
step
    >>击杀平原行者. 确保至少保留1根轻羽, 以备后用
    .collect 17056,1 --Light Feather (1)
step
     #completewith next
    .goto Darkshore,38.60,80.50,0
     >>击杀灰蓟熊, 掠夺它们的头皮
    .complete 1003,1 --Grizzled Scalp (4)
step
    #sticky
    #completewith Therylune
    >>留意“地下力量”. 这是一个低掉落率的免费任务
    .collect 5352,1,968 --Book: The Powers Below (1)
    .accept 968 >>接任务: |cRXP_LOOT_深渊之神|r
step
    #label Glaive
    .goto Darkshore,38.30,87.12
     >>进入主宰之剑, 清除中央祭坛周围的怪物
    .complete 944,1
step
    #sticky
    #label TheryluneE
    .goto Darkshore,38.65,87.34
.target Therylune
>>与|cRXP_FRIENDLY_瑟瑞露尼|r交谈
    .accept 945 >>接任务: |cRXP_LOOT_护送瑟瑞露尼|r
step
     >>将占卜之碗从物品栏中丢到地上
    .turnin 944 >>交任务: |cRXP_FRIENDLY_主宰之剑|r
    .accept 949 >>接任务: |cRXP_LOOT_暮光之锤的营地|r
step
    .goto Darkshore,38.55,86.03
     >>点击基座顶部的书. 如果已经触发任务, 请小心不要让瑟瑞露尼跑掉
    .turnin 949 >>交任务: |cRXP_FRIENDLY_暮光之锤的营地|r
    .accept 950 >>接任务: |cRXP_LOOT_向安努回复|r
step
    #label Therylune
    #requires TheryluneE
    >>完成护送任务
    >>当你击败最后一只从长矛之地出来的怪物时, 生起一个营火, 并将你剩余的所有肉类和蛋类烹饪掉, 以提升你的烹饪技能等级
    >>你需要50点烹饪技能才能接到夜色镇的免费任务
    .complete 945,1 --护送瑟瑞露尼 away from the Master's Glaive (1)
step
     #sticky
    #label MoonstalkerP
    .goto Darkshore,37.38,91.87,100,0
    .goto Darkshore,38.96,80.07,100,0
    .goto Darkshore,43.82,82.08,100,0
    .goto Darkshore,38.96,80.07,0
     >>击杀你找到的任何月夜雄虎, 如果你觉得安全的话也可以击杀母熊. 从它们身上获取毛皮. 它们与灰斑蓟熊共享刷新点
     >>如果你在怪物刷新和掉落率方面运气特别差, 可以跳过这个任务
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .unitscan Moonstalker Sire;Moonstalker Matriarch
step
    .goto Darkshore,38.60,80.50
     >>击杀暗礁海岸南部各地的灰斑蓟熊. 击杀后搜刮它们以获取头皮
    .complete 1003,1 --Grizzled Scalp (4)
step
    .goto Darkshore,41.40,80.56
    .turnin 1003 >>交任务: |cRXP_FRIENDLY_传声盒525号|r
step
    #requires MoonstalkerP
    .goto Darkshore,43.55,76.29
.target Onu
>>与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >>交任务: |cRXP_FRIENDLY_向安努回复|r
step
    #completewith next
    .goto Darkshore,43.69,76.63
    .vendor >>如果需要, 请从提亚尼购买食物或饮料
step
    >>接受凯尔隆的护送任务. 如果他不在那里, 请跳过此步骤
    .goto Darkshore,44.40,76.42
.target Kerlonian Evershade
>>与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈
    .accept 5321 >>接任务: |cRXP_LOOT_昏昏欲睡|r
step
    .isOnQuest 5321
    >>拾取凯洛尼安旁边的那只小灰箱
    .goto Darkshore,44.40,76.42
    .complete 5321,2 --Horn of Awakening (1)
step
    .isOnQuest 5321
    .goto Ashenvale,26.84,36.74
    >>向南前往灰谷. 将唤醒号角绑定到快捷栏, 当凯尔洛尼安开始原地踱步并睡着时使用它
    .complete 5321,1 --Escort Kerlonian Evershade to Maestra's Post (1)
step
    .isOnQuest 5321
    .goto Ashenvale,27.26,35.58
.target Liladris Moonriver
>>与|cRXP_FRIENDLY_利拉迪斯·月河|r交谈
    .turnin 5321 >>交任务: |cRXP_FRIENDLY_昏昏欲睡|r
step
    .goto Ashenvale,26.19,38.70
.target Delgren the Purifier
>>与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 967 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
step
    #softcore
    >>沿着南边的道路跑, 前往艾森娜神殿
    -->>在执行此操作的同时, 打开“网站卡住”工具并选择你的角色, 但暂不要确认
    .goto Ashenvale,22.64,51.91
.target Therysil
>>与|cRXP_FRIENDLY_瑟瑞希尔|r交谈
    .turnin 945 >>交任务: |cRXP_FRIENDLY_护送瑟瑞露尼|r
step
    #hardcore
    >>沿着南边的道路跑, 前往艾森娜神殿
    .goto Ashenvale,22.64,51.91
.target Therysil
>>与|cRXP_FRIENDLY_瑟瑞希尔|r交谈
    .turnin 945 >>交任务: |cRXP_FRIENDLY_护送瑟瑞露尼|r
step
    .hs >>传送至奥伯丁
step
    .goto Darkshore,36.09,44.93
.target Gubber Blump
>>与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >>交任务: |cRXP_FRIENDLY_海中的水果|r
step
    .goto Darkshore,36.62,45.60
.target Gwennyth Bly'Leggonde
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4730 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .turnin 4731 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .turnin 4732 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .turnin 4733 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
step
    .goto Darkshore,37.73,43.38
.target Sentinel Glynda Nal'Shea
>>与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .turnin 4740 >>交任务: |cRXP_FRIENDLY_通缉：莫克迪普！|r
step
    .isQuestComplete 986
    >>保留任务日志中的下一部分以获取+3耐力斗篷. 当你不再需要该斗篷时, 可放弃此任务
    .goto Darkshore,39.37,43.48
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 986 >>交任务: |cRXP_FRIENDLY_丢失的主人|r
.target Terenthis
    .accept 993 >>接任务: |cRXP_LOOT_丢失的主人|r
step
    .goto Darkshore,37.44,41.84
.target Archaeologist Hollee
>>与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .turnin 731 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .isQuestComplete 731
step
    .goto Darkshore,37.44,41.84
.target Archaeologist Hollee
>>与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 741 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .isQuestTurnedIn 731
step
    #completewith next
    .isOnQuest 741
    >>跑回码头, 等待前往达纳苏斯的船只抵达
    .goto Darkshore,36.43,43.84,30,0
    .goto Darkshore,33.17,40.17,40
step
    .isOnQuest 741
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
step
    .isOnQuest 741
    .goto Teldrassil,55.95,89.86,30 >>穿过紫色传送门
step
    .isOnQuest 741
    .goto Darnassus,31.24,84.49
>>与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .turnin 741 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
.target Chief Archaeologist Greywhisker
    .accept 942 >>接任务: |cRXP_LOOT_健忘的勘察员|r
step
    .goto Teldrassil,58.40,94.02
    .fp Teldrassil >>获取泰达希尔飞行路线
    .fly Auberdine >>飞往奥伯丁
step
    .goto Darkshore,32.42,43.75,50,0
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
step
    #completewith next
    .money <0.08
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto 1437,10.760,56.721
    >>如果你有8秒(8s), 请检查尼尔·奥雷是否有青铜管, 如果有就购买；否则, 跳过此步骤
    .collect 4371,1,175,1
step
    .goto Wetlands,9.49,59.69
    .fly Ironforge >>飞往铁炉堡
step << skip --logout skip
    #completewith next
    .goto Ironforge,56.23,46.83,0
    +通过跳上狮鹫头部之一来执行登出跳过, 然后退出再重新登录
    .link https://www.youtube.com/watch?v=PWMJhodh6Bw >>点击这里
step
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step
    #completewith FlyAndy
    .goto StormwindClassic,55.21,7.04
    .vendor >>如果你还没有, 就买一根青铜管吧
    >>这是一个限量供应物品, 如果NPC没有此物品, 请跳过该步骤
    .bronzetube
step << Human
    #label FlyAndy
    .goto Elwynn Forest,32.45,50.16
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
step << Gnome
    .goto Elwynn Forest,26.29,38.50
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << Gnome
    #label FlyAndy
    >>前往暴风城并获取飞行路径
    .goto StormwindClassic,57.62,59.48,50,0
    .goto StormwindClassic,66.27,62.13
    .fp Stormwind City >>获取暴风城飞行点
step << Gnome
    .goto StormwindClassic,66.05,65.64,12,0
    .goto StormwindClassic,64.97,67.69,18 >>撞上白墙, 跳到下方的小平台. 小心！沿其跑向暴风城的出口
step
    >>跑进闪金镇旅店的二楼
    .goto Elwynn Forest,42.97,65.65,15,0
    .goto Elwynn Forest,43.81,66.46,15,0
    .goto Elwynn Forest,43.25,66.19
    .trainer >>训练你的职业法术
step
    .goto Elwynn Forest,91.42,73.59,125,0
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r,一路向东跑到赤脊山。路上整理好你的按键绑定，确保你的法术栏上有足够的空间
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Mage
#name 18-21级赤脊山法师AoE
#displayname 18-21级赤脊山法师AoE \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟法师
#defaultfor Alliance Mage
#next 21-22 暮色森林法师AoE

step
    #sticky
    #completewith Gnolls
    +开始对看到的每组3只及以上需要任务的怪物进行群体攻击(AoE)
    >>如需参考, 请在另一个标签页中打开本教程的赤脊山AoE部分:
    .link https://youtu.be/SxMc2GoP33c?t=56 >>点击这里
step
    >>与帕克警卫交谈. 他会在十字路口附近巡逻
    .goto Elwynn Forest,99.05,72.15
.target Guard Parker
>>与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
step
    #sticky
    #label Gnolls
    .goto Redridge Mountains,30.74,59.99
>>与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
.target Deputy Feldon
    .accept 246 >>接任务: |cRXP_LOOT_审时度势|r
step
    .goto Redridge Mountains,30.59,59.40
    .fp Redridge Mountains >>获取赤脊山飞行点
step
    #requires Gnolls
    .goto Redridge Mountains,33.51,48.96
.target Marshal Marris
>>与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .accept 20 >>接任务: |cRXP_LOOT_黑石氏族的威胁|r
step
    .goto Redridge Mountains,32.14,48.64
.target Foreman Oslow
>>与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .accept 125 >>接任务: |cRXP_LOOT_丢失的工具|r
step
    .goto Redridge Mountains,30.94,47.24
.target Verner Osgood
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    .accept 118 >>接任务: |cRXP_LOOT_马掌|r
step
    >>议政厅内部
    .goto Redridge Mountains,29.72,44.26
.target Bailiff Conacher
>>与|cRXP_FRIENDLY_拜里弗·科纳彻尔|r交谈
    .accept 91 >>接任务: |cRXP_LOOT_所罗门的律法|r
step
    .goto Redridge Mountains,29.99,44.45
    >>进入建筑内部
.target Magistrate Solomon
>>与|cRXP_FRIENDLY_所罗门镇长|r交谈
    .accept 120 >>接任务: |cRXP_LOOT_送往暴风城的信|r
step
    .goto Redridge Mountains,27.72,47.38
.target Dockmaster Baren
>>与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
    .accept 127 >>接任务: |cRXP_LOOT_卖鱼|r
step
    .goto Redridge Mountains,26.75,46.42
    .accept 180 >>接任务: |cRXP_LOOT_通缉：范高雷中尉|r
step
    >>旅店内
    .goto Redridge Mountains,27.09,45.65
.target Darcy
>>与|cRXP_FRIENDLY_达希|r交谈
    .accept 129 >>接任务: |cRXP_LOOT_免费的午餐|r
step
    .goto Redridge Mountains,27.01,44.82
    .home >>将你的[炉石]设置为湖畔镇
step
    .goto Redridge Mountains,29.32,53.64
.target Shawn
>>与|cRXP_FRIENDLY_肖恩|r交谈
    .accept 3741 >>接任务: |cRXP_LOOT_希拉里的项链|r
step
    >>在水下寻找希拉里的项链. 它位于一片棕色的泥土区域中
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
    +对营地里的豺狼人使用范围攻击
step
    .goto Redridge Mountains,15.28,71.47
>>与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .turnin 129 >>交任务: |cRXP_FRIENDLY_免费的午餐|r
.target Guard Parker
    .accept 130 >>接任务: |cRXP_LOOT_寻访草药师|r
step
    .goto Redridge Mountains,30.59,59.41
    .fly Stormwind >>飞往暴风城
step
    >>进入暴风城, 前往武器训练师处
   .goto StormwindClassic,57.13,57.71
   .trainer >>训练1小时剑与匕首
step
    #softcore
    .goto StormwindClassic,53.62,59.76,30,0
    .goto StormwindClassic,55.25,7.08
    +前往拍卖行, 如果价格合适, 购买一根青铜管
    >>如果这里没有或价格太高, 你也可以考虑从矮人区的比利布那里购买一个
    >>如果找不到, 就跳过这一步
    .bronzetube
step
    #hardcore
    .goto StormwindClassic,53.62,59.76,30,0
    .goto StormwindClassic,55.25,7.08
    .vendor >>在矮人区找比利布布, 向他要一个青铜管. 如果有的话就买一个
    .bronzetube
step
    .goto StormwindClassic,63.99,75.34
>>与 |cRXP_FRIENDLY_马库斯·乔纳森将军|r 交谈
    .turnin 120 >>交任务: |cRXP_FRIENDLY_送往暴风城的信|r
.target General Marcus Jonathan
    .accept 121 >>接任务: |cRXP_LOOT_送往暴风城的信|r
step
    >>前往闪金镇
    .goto Elwynn Forest,41.71,65.55
>>与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
    .turnin 118 >>交任务: |cRXP_FRIENDLY_马掌|r
.target Smith Argus
    .accept 119 >>接任务: |cRXP_LOOT_回复弗纳|r
step
    >>奔向哨兵岭
    .goto Westfall,56.33,47.52
.target Gryan Stoutmantle
>>与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
step
    #completewith next
    #label hsLakeshire
    .hs Lakeshire >>如果可用, 传送到湖畔镇
step
    #completewith hsLakeshire
    #label WFFP
    .goto Westfall,56.55,52.65
    .fp Westfall >>获取西部荒野的飞行路径 << Gnome
    .fly Redridge >>飞往赤脊山
step
    #requires WFFP
    .goto Redridge Mountains,30.97,47.27
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    .turnin 119 >>交任务: |cRXP_FRIENDLY_回复弗纳|r
.target Verner Osgood
    .accept 122 >>接任务: |cRXP_LOOT_雏龙的鳞片|r
    .accept 124 >>接任务: |cRXP_LOOT_豺狼人的乱吠|r
step
    >>进入要塞
    .goto Redridge Mountains,29.93,44.46
>>与|cRXP_FRIENDLY_所罗门镇长|r交谈
    .turnin 121 >>交任务: |cRXP_FRIENDLY_送往暴风城的信|r
.target Magistrate Solomon
    .accept 143 >>接任务: |cRXP_LOOT_送往西部荒野的信|r
.target Bailiff Conacher
>>与|cRXP_FRIENDLY_拜里弗·科纳彻尔|r交谈
    .accept 91 >>接任务: |cRXP_LOOT_所罗门的律法|r
step
    >>前往旅店的顶层
    .goto Redridge Mountains,26.47,45.35
>>与|cRXP_FRIENDLY_黑衣威利|r交谈
    .turnin 65 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
.target Wiley the Black
    .accept 132 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
step
    .goto Redridge Mountains,29.24,53.63
.target Hilary
>>与|cRXP_FRIENDLY_希拉里|r交谈
    .turnin 3741 >>交任务: |cRXP_FRIENDLY_希拉里的项链|r
step
    #era/som
    #completewith Murlocs
    >>在完成其他任务的同时, 制作前3个物品以获得赤脊山炖肉. 同时收集足够的野猪肉块, 使你的烹饪技能达到50级
    >>尽量集中精力对付血牙野猪, 暂时不用太担心蜘蛛肉
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .collect 1080,5,92,1 --Tough Condor Meat (5)
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
step
    #completewith Murlocs
    >>击杀幼龙, 搜刮它们的鳞片
    .complete 122,1 --Underbelly Whelp Scale (6)
step
    >>对区域内所有豺狼人使用范围攻击. 如需参考, 可查看AoE教学视频
    >>在AOE拉怪时, 将偷猎者引至死区, 以免被射中
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
    >>对区域内的鱼人进行范围攻击. 你必须单体攻击潮汐召唤者(闪电箭 + 治疗波)
    >>你可以对短矛兵(冲锋)和食肉者(攻击时造成25点即时吸血伤害)进行范围攻击. 创造性地安排拉怪
    >>留着8个鳍以后再用
    .goto Redridge Mountains,48.82,69.49
    .complete 127,1 --Spotted Sunfish (10)
    .collect 1468,8,150,1 --Murloc Fin (8)
step
    #era/som
    >>在这个区域附近获取秃鹫肉和幼龙鳞片. 如果在等待刷新, 可以向东去拿一些斧头, 再回来这里
    .goto Redridge Mountains,61.04,77.55
    .collect 1080,5,92,1 --Tough Condor Meat (5)
    .complete 122,1 --Underbelly Whelp Scale (6)
step
    #som
    #phase 3-6
    >>从这个区域周围的幼龙身上获取鳞片. 如果在等待刷新, 可以向东去拿一些斧头, 然后回来
    .goto Redridge Mountains,61.04,77.55
    .complete 122,1 --Underbelly Whelp Scale (6)
step
    >>该区域有AoE兽人. 击杀他们以获取战斧. 注意躲避冲锋者网和叛逆者的盾击
    >>尽量避免击杀叛徒, 因为它们等级较高. 每次最多拉3个敌人. 此处使用范围攻击风险极高, 回报中等
    >>别急着拿走所有斧头, 稍后你有更好的机会完成任务
    .goto Redridge Mountains,76.28,83.88,50,0
    .goto Redridge Mountains,75.53,73.36,50,0
    .goto Redridge Mountains,76.28,83.88,50,0
    .goto Redridge Mountains,75.53,73.36,50,0
    .collect 3014,8 --Battleworn Axe (8)
step
    >>潜入水下. 搜刮灰色箱子
    .goto Redridge Mountains,41.52,54.68
    .complete 125,1 --Oslow's Toolbox (1)
step
    #era/som
    >>在这里击杀血牙野猪的鼻部目标
    .goto Redridge Mountains,32.07,70.54
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
step
    .goto Redridge Mountains,30.74,60.00
.target Deputy Feldon
>>与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 246 >>交任务: |cRXP_FRIENDLY_审时度势|r
step
    .isQuestComplete 20
    .goto Redridge Mountains,33.50,48.96
.target Marshal Marris
>>与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .turnin 20 >>交任务: |cRXP_FRIENDLY_黑石氏族的威胁|r
step
    .goto Redridge Mountains,32.14,48.63
>>与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .turnin 125 >>交任务: |cRXP_FRIENDLY_丢失的工具|r
.target Foreman Oslow
    .accept 89 >>接任务: |cRXP_LOOT_止水湖上的桥|r
step
    .goto Redridge Mountains,30.98,47.27
.target Verner Osgood
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    .turnin 122 >>交任务: |cRXP_FRIENDLY_雏龙的鳞片|r
step
    #level 20
    .goto Redridge Mountains,27.72,47.38
>>与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
    .turnin 127 >>交任务: |cRXP_FRIENDLY_卖鱼|r
.target Dockmaster Baren
    .accept 150 >>接任务: |cRXP_LOOT_鱼人偷猎者|r
    .turnin 150 >>交任务: |cRXP_FRIENDLY_鱼人偷猎者|r
step
    .goto Redridge Mountains,27.72,47.38
.target Dockmaster Baren
>>与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
    .turnin 127 >>交任务: |cRXP_FRIENDLY_卖鱼|r
step
    .goto Redridge Mountains,21.86,46.33
>>与|cRXP_FRIENDLY_玛蒂·詹罗斯|r交谈
    .turnin 130 >>交任务: |cRXP_FRIENDLY_寻访草药师|r
.target Martie Jainrose
    .accept 131 >>接任务: |cRXP_LOOT_水仙诉衷情|r
    .accept 34 >>接任务: |cRXP_LOOT_不速之客|r
step
    >>击杀肚皮虫. 风筝引怪回到镇上卫兵亚当斯处
    >>注意, 她会震颤(造成80点范围瞬时伤害)和冲锋(尽可能让她减速, 并在可能时施放新星)
    >>确保你造成的伤害超过51%(大部分伤害)
    >>这个任务非常困难
    .goto Redridge Mountains,15.66,49.31
    .complete 34,1 --Bellygrub's Tusk (1)
--N Add link
step
    .goto Redridge Mountains,21.85,46.32
.target Martie Jainrose
>>与|cRXP_FRIENDLY_玛蒂·詹罗斯|r交谈
    .turnin 34 >>交任务: |cRXP_FRIENDLY_不速之客|r
step
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    >>击杀豺狼人, 搜刮他们的长矛和铆钉
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .complete 124,1 --Redridge Brute (10)
    .complete 124,2 --Redridge Mystic (8)
step
    #completewith next
    >>击杀整齐排列的兽人群体. 掠夺他们以收集完成任务所需的斧头
    >>如果你在清理近处的敌对群体后运气不佳, 稍后还会有一次机会
    .goto Redridge Mountains,37.05,45.15,50,0
    .goto Redridge Mountains,38.28,41.85,50,0
    .goto Redridge Mountains,40.46,40.52,50,0
    .complete 20,1 --Blackrock Axe (10)
step
    #era/som
    #completewith next
    .goto Redridge Mountains,49.25,39.66,150 >>朝蜘蛛跑去
step
    #era/som
    >>击杀蜘蛛, 从它们身上获取肉作为战利品
    >>注意, 它们的毒液会造成一定伤害
    >>小心查特(稀有), 因为他会施放一个持续8秒的眩晕效果
    .goto Redridge Mountains,57.23,45.24
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
step
    >>用斧头杀光兽人
    .goto Redridge Mountains,61.74,42.82
    .complete 20,1 --Blackrock Axe (10)
step
    .goto Redridge Mountains,33.50,48.96
.target Marshal Marris
>>与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .turnin 20 >>交任务: |cRXP_FRIENDLY_黑石氏族的威胁|r
step
    .goto Redridge Mountains,32.15,48.64
.target Foreman Oslow
>>与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .turnin 89 >>交任务: |cRXP_FRIENDLY_止水湖上的桥|r
step
    .goto Redridge Mountains,30.98,47.28
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
    .turnin 124 >>交任务: |cRXP_FRIENDLY_豺狼人的乱吠|r
.target Verner Osgood
    .accept 126 >>接任务: |cRXP_LOOT_群山中的嚎叫|r
step
    .goto Redridge Mountains,27.09,45.65
.target Darcy
>>与|cRXP_FRIENDLY_达希|r交谈
    .turnin 131 >>交任务: |cRXP_FRIENDLY_水仙诉衷情|r
step
    .goto Redridge Mountains,27.01,44.81
    .vendor >>购买15级饮品
step
    #era/som
    .goto Redridge Mountains,22.70,44.00
    >>离开旅店. 向西走, 然后进入建筑
.target Chef Breanna
>>与 |cRXP_FRIENDLY_厨师布雷纳|r交谈
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
step
    #era/som
    #completewith next
    .goto Redridge Mountains,26.54,44.90
    +将所有野猪肉烹饪至烹饪技能达到50级
    >>如果你肉不够, 可以在去往夜色镇的路上刷些野猪
step
    .goto Redridge Mountains,6.50,91.18,90,0
    .zone Duskwood >>前往: |cRXP_PICK_暮色森林|r
]])
