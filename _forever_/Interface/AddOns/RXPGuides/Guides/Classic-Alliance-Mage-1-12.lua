local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 联盟法师
#classic
#tbc
<< Human Mage
#name 1-10 Elwynn Forest Mage AoE
#title 1-10 艾尔文森林：人类法师AoE
#version 1
#group RestedXP Alliance Mage
#subgroupdisplayname RestedXP 联盟法师
#defaultfor Human
#next 10-12 Loch Modan Mage AoE
#displayname 1-10 艾尔文森林（法师 AoE）
step
    #sticky
    #completewith next
    .goto Elwynn Forest,48.171,42.943
    +你选择的是人类起始路线。请选用与你出生区域相符的路线 << Gnome
    +你选择的是法师范围刷怪路线，操作难度通常高于单体练级；升级效率也会受到任务经验加成的影响
step
    >>删除你的炉石
    .goto Elwynn Forest,48.171,42.943
.target 维里副队长
>>与|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 783 >> 接任务：身边的危机
step
    .goto Elwynn Forest,48.923,41.606
>>与 |cRXP_FRIENDLY_治安官玛克布莱德|r 对话
    .turnin 783 >> 交任务：身边的危机
.target 治安官玛克布莱德
    .accept 7 >> 接任务：剿灭狗头人
step
    .goto Elwynn Forest,48.171,42.943
.target 维里副队长
>>与|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 5261 >> 接任务：伊根·派特斯金纳
step
    .goto Elwynn Forest,47.49,41.56
    .vendor >>击杀狼，直到杂物能卖出50铜币。卖掉杂物，再向丹尼尔修士购买10瓶饮水
    .collect 159,10 --Collect Refreshing Spring Water (x10)
step
    .xp 2 >> 刷到2级
step
    .goto Elwynn Forest,48.9,40.2
>>与 |cRXP_FRIENDLY_伊根·派特斯金纳|r 对话
    .turnin 5261 >> 交任务：伊根·派特斯金纳
.target 伊根·派特斯金纳
    .accept 33 >> 接任务：林中的群狼
step
    .goto Elwynn Forest,46.1,40.7,40,0
    .goto Elwynn Forest,46.2,37.6,40,0
    .goto Elwynn Forest,47.6,37.2,40,0
    .goto Elwynn Forest,46.1,40.7,40,0
    .goto Elwynn Forest,46.2,37.6,40,0
    .goto Elwynn Forest,47.6,37.2,40,0
    >>击杀附近的幼狼，拾取硬狼肉
    .complete 33,1 --Collect Tough Wolf Meat (x8)
step
    .goto Elwynn Forest,47.4,35.3,40,0
    .goto Elwynn Forest,49.7,36.2,40,0
    .goto Elwynn Forest,47.4,35.3,40,0
    .goto Elwynn Forest,49.7,36.2,40,0
    .goto Elwynn Forest,47.4,35.3,40,0
    .goto Elwynn Forest,49.7,36.2,40,0
    >>击杀附近的狗头人歹徒
    .complete 7,1 --Kill Kobold Vermin (x10)
step
    .goto Elwynn Forest,48.9,40.2
.target 伊根·派特斯金纳
>>与 |cRXP_FRIENDLY_伊根·派特斯金纳|r 对话
    .turnin 33 >> 交任务：林中的群狼
step
    .goto Elwynn Forest,47.6,41.5
    .vendor >>卖掉杂物，再向丹尼尔修士购买10瓶饮水
step
    .goto Elwynn Forest,48.923,41.606
>>与 |cRXP_FRIENDLY_治安官玛克布莱德|r 对话
    .turnin 7 >> 交任务：剿灭狗头人
.target 治安官玛克布莱德
    .accept 15 >> 接任务：回音山调查行动
    .accept 3104 >> 接任务：雕文信件
step
    .xp 3 >> 刷到3级
step
    .goto Elwynn Forest,47.5,36.3,40,0
    .goto Elwynn Forest,46.6,32.2,40,0
    .goto Elwynn Forest,48.6,34.0,40,0
    .goto Elwynn Forest,47.5,36.3,40,0
    .goto Elwynn Forest,46.6,32.2,40,0
    .goto Elwynn Forest,48.6,34.0,40,0
    >>击杀狗头人劳工
    .complete 15,1 --Kill Kobold Worker (x10)
step
    .goto Elwynn Forest,47.7,41.4
    .xp 3+1110 >>在返回城镇的途中刷怪至1110+/1400经验值
step
    .goto Elwynn Forest,47.7,41.4
    .vendor >>卖掉杂物
step
    .goto Elwynn Forest,48.923,41.606
>>与 |cRXP_FRIENDLY_治安官玛克布莱德|r 对话
    .turnin 15 >> 交任务：回音山调查行动
.target 治安官玛克布莱德
    .accept 21 >> 接任务：回音山清剿行动
step
    >>上楼
    .goto Elwynn Forest,49.3,40.7,15,0
    .goto Elwynn Forest,49.5,40.0,15,0
    .goto Elwynn Forest,49.661,39.402
.target 凯尔登·布雷门
>>与 |cRXP_FRIENDLY_凯尔登·布雷门|r 交谈
    .turnin 3104 >> 交任务：雕文信件
    .trainer >> 学习职业技能
step
    .goto Elwynn Forest,48.171,42.943
.target 维里副队长
>>与|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 18 >> 接任务：潜行者兄弟会
step
    .goto Elwynn Forest,53.7,52.2,60,0
    .goto Elwynn Forest,55.7,47.4,60,0
    .goto Elwynn Forest,54.7,41.9,60,0
    .goto Elwynn Forest,53.7,52.2,60,0
    .goto Elwynn Forest,55.7,47.4,60,0
    .goto Elwynn Forest,54.7,41.9,60,0
    >>击杀迪菲亚暴徒，拾取他们的红色粗麻面罩
    .complete 18,1 --Collect Red Burlap Bandana (x12)
step
    .goto Elwynn Forest,48.171,42.943
>>与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 18 >> 交任务：潜行者兄弟会
.target 维里副队长
    .accept 6 >> 接任务：加瑞克·帕德弗特的赏金
    .accept 3903 >> 接任务：米莉·奥斯沃斯
step
    .goto Elwynn Forest,47.7,41.4
    .vendor >>卖掉杂物并修理
step
    .goto Elwynn Forest,54.7,41.9,60,0
    .goto Elwynn Forest,47.7,31.7,60,0
    .goto Elwynn Forest,50.4,27.0,60,0
    .goto Elwynn Forest,47.7,31.7,60,0
    .goto Elwynn Forest,50.4,27.0,60,0
    .goto Elwynn Forest,47.7,31.7,60,0
    .goto Elwynn Forest,50.4,27.0,60,0
    .goto Elwynn Forest,47.7,31.7,60,0
    .goto Elwynn Forest,50.4,27.0,60,0
    >>击杀矿洞中的狗头人苦力
    .complete 21,1 --Kill Kobold Laborer (x12)
step
    .xp 5 >> 刷到5级
step
    #era/som
    .goto Elwynn Forest,50.7,39.2
>>与 |cRXP_FRIENDLY_米莉·奥斯沃斯|r 对话
    .turnin 3903 >> 交任务：米莉·奥斯沃斯
.target 米莉·奥斯沃斯
    .accept 3904 >> 接任务：米莉的葡萄
step
    #som
    #phase 3-6
    .goto Elwynn Forest,50.7,39.2
.target 米莉·奥斯沃斯
>>与 |cRXP_FRIENDLY_米莉·奥斯沃斯|r 对话
    .turnin 3903 >> 交任务：米莉·奥斯沃斯
step
    #era/som
    >>拾取田里的葡萄桶
    .goto Elwynn Forest,54.5,49.4
    .complete 3904,1 --Collect Milly's Harvest (x8)
step
    .goto Elwynn Forest,57.5,48.2
    >>击杀加瑞克并拾取他的头颅
    .complete 6,1 --Collect Garrick's Head (x1)
step
    .xp 5+1175 >> 在返回途中刷怪至 1175+/2800 经验值
    .goto Elwynn Forest,50.7,39.2
step
    #era/som
    .goto Elwynn Forest,50.7,39.2
>>与 |cRXP_FRIENDLY_米莉·奥斯沃斯|r 对话
    .turnin 3904 >> 交任务：米莉的葡萄
.target 米莉·奥斯沃斯
    .accept 3905 >>接任务：葡萄出货单
step
    .goto Elwynn Forest,48.171,42.943
.target 维里副队长
>>与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 6 >> 交任务：加瑞克·帕德弗特的赏金
step
    .goto Elwynn Forest,48.923,41.606
>>与 |cRXP_FRIENDLY_治安官玛克布莱德|r 对话
    .turnin 21 >> 交任务：回音山清剿行动
.target 治安官玛克布莱德
    .accept 54 >> 接任务：去闪金镇报到
step
     #era/som
     >>沿主楼梯上楼
    .goto Elwynn Forest,49.6,41.6,15,0
    .goto Elwynn Forest,48.9,41.3,15,0
    .goto Elwynn Forest,49.471,41.586
.target 尼尔斯修士
>>与|cRXP_FRIENDLY_尼尔斯修士|r交谈
    .turnin 3905 >>交任务 葡萄出货单
step
    .goto Elwynn Forest,45.6,47.7
.target 法尔坎·伊森斯泰德
>>与 |cRXP_FRIENDLY_法尔坎·伊森斯泰德|r 对话
    .accept 2158 >> 接任务：休息和放松
step
    #softcore
    #sticky
    #completewith next
    .goto Elwynn Forest,39.5,60.5,200 >> 死亡后在灵魂医者处复活，或者跑去闪金镇
step
    .goto Elwynn Forest,41.7,65.9
    .vendor >> 卖掉杂物并修理
step
    .goto Elwynn Forest,42.105,65.927
>>与 |cRXP_FRIENDLY_治安官杜汉|r 交谈
    .turnin 54 >> 交任务：去闪金镇报到
.target 治安官杜汉
    .accept 62 >> 接任务：法戈第矿洞
step
    .goto Elwynn Forest,42.9,65.7,15,0
    >>进入旅店后就在左手边近处
    .goto Elwynn Forest,43.283,65.721
.target 威廉·匹斯特
>>与 |cRXP_FRIENDLY_威廉·匹斯特|r 对话
    .accept 60 >> 接任务：狗头人的蜡烛
step
    .goto Elwynn Forest,43.771,65.803
.target 旅店老板法雷
>>与 |cRXP_FRIENDLY_旅店老板法雷|r 对话
    .turnin 2158 >> 交任务：休息和放松
    .home >> 将你的炉石设置为闪金镇
step
    .xp 6 >> 刷到6级
step
    .goto Elwynn Forest,43.7,66.4,12,0
    .goto Elwynn Forest,43.2,66.2
    .trainer >> 上楼, 学习职业技能
step
    .goto Elwynn Forest,42.1,67.3
.target 雷米
>>与 |cRXP_FRIENDLY_雷米|r 对话
    .accept 47 >> 接任务：金砂交易
step
    #sticky
    #completewith BoarMeat1
    >>开始击杀途中看到的野猪，收集大块野猪肉
    .collect 769,4 --Collect Chunk of Boar Meat (x4)
step
    .goto Elwynn Forest,34.486,84.253
.target 波尼斯·斯通菲尔德姑妈
>>与 |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r 交谈
    .accept 85 >> 接任务：丢失的项链
    .goto Elwynn Forest,34.660,84.482
.target 斯通菲尔德妈妈
>>与 |cRXP_FRIENDLY_斯通菲尔德妈妈|r 交谈
    .accept 88 >> 接任务：公主必须死！
step
    #sticky
    #completewith Candles
    >> 击杀附近的狗头人，拾取任务所需的蜡烛。
    .complete 60,1 --Collect Kobold Candle (x8)
step
    #sticky
    #label Candles
    #completewith next
    >> 击杀附近的狗头人，拾取金砂。
    .complete 47,1 --Collect Gold Dust (x10)
step
    #label Dust
    >>沿着矿井外侧向东刷怪
    .goto Elwynn Forest,43.132,85.722
>>与 |cRXP_FRIENDLY_比利·马科伦|r 对话
    .turnin 85 >> 交任务：丢失的项链
.target 比利·马科伦
    .accept 86 >> 接任务：比利的馅饼
step
    #label BoarMeat1
    .goto Elwynn Forest,43.2,89.6
.target 梅贝尔·马科伦
>>与 |cRXP_FRIENDLY_梅贝尔·马科伦|r 对话
    .accept 106 >> 接任务：年轻的恋人
step
    .goto Elwynn Forest,42.4,89.4
    .vendor >>卖掉杂物，尽可能多买些牛奶
step
    #sticky
    #completewith next
    >>击杀途中看到的野猪，收集大块野猪肉
    .collect 769,4 --Collect Chunk of Boar Meat (x4)
step
    .goto Elwynn Forest,29.840,85.997
>>与 |cRXP_FRIENDLY_托米·乔·斯通菲尔德|r 交谈
    .turnin 106 >> 交任务：年轻的恋人
.target 托米·乔·斯通菲尔德
    .accept 111 >> 接任务：托米的祖母
step
    .goto Elwynn Forest,32.5,85.5
    >>收齐剩余的大块野猪肉
    .complete 86,1 --Collect Chunk of Boar Meat (x4)
step
    .goto Elwynn Forest,34.486,84.253
>>与 |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r 交谈
    .turnin 86 >> 交任务：比利的馅饼
.target 波尼斯·斯通菲尔德姑妈
    .accept 84 >> 接任务：比利的馅饼
step
    .goto 1429,34.945,83.855
>>与 |cRXP_FRIENDLY_米莱德·斯通菲尔德|r 交谈
    .turnin 111 >> 交任务：托米的祖母
.target 米莱德·斯通菲尔德
    .accept 107 >> 接任务：给威廉·匹斯特的信
step
    #sticky
    #label KoboldCandles
    >> 击杀附近的狗头人，拾取任务所需的蜡烛。
    .complete 60,1 --Collect Kobold Candle (x8)
step
    #sticky
    #label GoldDust
    >> 击杀附近的狗头人，拾取金砂。
    .complete 47,1 --Collect Gold Dust (x10)
step
    >>沿着矿井外侧向东刷怪
    .goto Elwynn Forest,43.132,85.722
>>与 |cRXP_FRIENDLY_比利·马科伦|r 对话
    .turnin 84 >> 交任务：比利的馅饼
.target 比利·马科伦
    .accept 87 >> 接任务：金牙
step
    >>进入矿洞
    .goto Elwynn Forest,40.5,82.3
    .complete 62,1 --Scout Through the Fargodeep Mine
step
    >>击杀金牙，拾取波尼斯的项链
    .goto Elwynn Forest,41.7,78.1
    .complete 87,1 --Collect Bernice's Necklace  (x1)
step
    .xp 7+1600 >>刷怪至1600+/4500经验值
step
#hidewindow
    #requires KoboldCandles
step
    #label Goldtooth
    #requires GoldDust
    .goto Elwynn Forest,34.486,84.253
.target 波尼斯·斯通菲尔德姑妈
>>与 |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r 交谈
    .turnin 87 >> 交任务：金牙
step
    >>在返回闪金镇的途中刷怪
    .xp 7+2690 >>刷怪至2690+/4500经验值
    .goto Elwynn Forest,42.1,67.3
step
    .goto Elwynn Forest,42.1,67.3
>>与 |cRXP_FRIENDLY_雷米|r 对话
    .turnin 47 >> 交任务：金砂交易
.target 雷米
    .accept 40 >> 接任务：鱼人的威胁
step
    .goto Elwynn Forest,41.7,65.9
    .vendor >>卖掉杂物并修理
step
    .goto Elwynn Forest,42.105,65.927
>>与 |cRXP_FRIENDLY_治安官杜汉|r 交谈
    .turnin 40 >> 交任务：鱼人的威胁
.target 治安官杜汉
    .accept 35 >> 接任务：卫兵托马斯
    .turnin 62 >> 交任务：法戈第矿洞
    .accept 76 >> 接任务：玉石矿洞
step
    .goto Elwynn Forest,41.7,65.9
    .vendor >> 卖掉杂物并修理
step
    .goto Elwynn Forest,43.283,65.721
>>与 |cRXP_FRIENDLY_威廉·匹斯特|r 对话
    .turnin 60 >> 交任务：狗头人的蜡烛
.target 威廉·匹斯特
    .accept 61 >> 接任务：送往暴风城的货物
    .turnin 107 >> 交任务：给威廉·匹斯特的信
    .accept 112 >> 接任务：收集海藻
step
    .xp 8 >> 刷到8级
step
    .money <0.1250
    .goto Elwynn Forest,44.0,65.9
    .vendor >>向布洛葛购买一个6格包
step
    .goto Elwynn Forest,43.7,66.4,12,0
    .goto Elwynn Forest,43.2,66.2
    .trainer >> 上楼, 学习职业技能
step
    .goto Elwynn Forest,43.771,65.803
    .vendor >>购买5级饮水，补充至40瓶
step
    >>向东刷鱼人，拾取水晶藻叶；如果还没收齐，就击杀岛上的怪物
    .goto Elwynn Forest,47.6,63.3,60,0
    .goto Elwynn Forest,51.4,64.6,50,0
    .goto Elwynn Forest,57.6,62.8,50,0
    .goto Elwynn Forest,56.4,66.6,50,0
    .goto Elwynn Forest,53.8,66.8,50,0
    .complete 112,1 --Collect Crystal Kelp Frond (x4)
step
    >>进入矿洞，一直沿中间的道路前进
    .goto Elwynn Forest,61.8,54.0,60,0
    .goto Elwynn Forest,60.4,50.2
    .complete 76,1 --Scout through the Jasperlode Mine
step
    .goto Elwynn Forest,73.973,72.179
>>与 |cRXP_FRIENDLY_卫兵托马斯|r 交谈
    .turnin 35 >> 交任务：卫兵托马斯
.target 卫兵托马斯
    .accept 37 >> 接任务：失踪的卫兵
    .accept 52 >> 接任务：保卫边境
step
    #sticky
    #completewith Prowlers
    >>做其他任务时顺带击杀觅食的灰狼
    .complete 52,1 --Kill Prowler (x8)
step
    #sticky
    #completewith Bears
    >>做其他任务时顺手把熊杀了。见几只杀几只
    .complete 52,2 --Kill Young Forest Bear (x5)
step
    .goto Elwynn Forest,72.7,60.3
    .turnin 37 >> 交任务：失踪的卫兵
    .accept 45 >> 接任务：罗尔夫的下落
step
    .goto Elwynn Forest,81.382,66.112
.target 管理员莱琳
>>与 |cRXP_FRIENDLY_管理员莱琳|r 交谈
    .accept 5545 >> 接任务：木材危机
step
    .goto Elwynn Forest,83.3,66.1
    .vendor >> 卖掉杂物并修理
step
    #sticky
    #completewith Bundles
    >>留意树根旁的木柴捆
    .collect 13872,8 --Collect Bundle of Wood (x8)
step
    #label Bundles
    .goto Elwynn Forest,79.8,55.5,60 >> 往守卫的尸体那边走
step
    .goto Elwynn Forest,79.8,55.5
    >> 清理尸体周围的怪物。拉出棚屋前的2只怪物，后退并用变形术控制其中一只，击杀另一只后再杀掉被变形的那只。搜寻地上的尸体
    >> 小心, 这个任务可能有点难
    .turnin 45 >> 交任务：罗尔夫的下落
    .accept 71 >> 接任务：回复托马斯
step
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    >>开始往回跑，收齐剩余的木柴捆
    .collect 13872,8 --Collect Bundle of Wood (x8)
step
    #label Bundles2
    .goto Elwynn Forest,81.382,66.112
.target 管理员莱琳
>>与 |cRXP_FRIENDLY_管理员莱琳|r 交谈
    .turnin 5545 >> 交任务：木材危机
step
    #label Prowlers
    .xp 9 >> 刷到9级
step
    #label Bears
    .goto Elwynn Forest,79.457,68.789
.target 萨拉·迪博雷恩
>>与 |cRXP_FRIENDLY_萨拉·迪博雷恩|r 交谈
    .accept 83 >> 接任务：红色亚麻布
step
    .goto Elwynn Forest,76.7,75.6,40,0
    .goto Elwynn Forest,79.7,83.7,40,0
    .goto Elwynn Forest,82.0,76.8,40,0
    .goto Elwynn Forest,76.7,75.6,40,0
    .goto Elwynn Forest,79.7,83.7,40,0
    .goto Elwynn Forest,82.0,76.8,40,0
    >>击杀剩余的任务怪，完成保卫边境
    .complete 52,1 --Kill Prowler (x8)
    .complete 52,2 --Kill Young Forest Bear (x5)
step
    .goto Elwynn Forest,73.973,72.179
>>与 |cRXP_FRIENDLY_卫兵托马斯|r 交谈
    .turnin 52 >> 交任务：保卫边境
    .turnin 71 >> 交任务：回复托马斯
.target 卫兵托马斯
    .accept 39 >> 接任务：托马斯的报告
-->>Talk to |cRXP_FRIENDLY_Farmer Furlbrow|r
-->>Talk to |cRXP_FRIENDLY_Marshal Dughan|r
--
-->>Talk to |cRXP_FRIENDLY_Marshal Haggard|r
-->>Talk to |cRXP_FRIENDLY_Deputy Rainer|r
    .accept 109 >> 接任务：向格里安·斯托曼报到
step
    #sticky
    #completewith Princess
    >>留意迪菲亚掉落的"西部荒野地契"(幸运掉落)
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >> 接任务：法布隆的地契
step
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
    >>绕着农场击杀迪菲亚成员，拾取他们的红色亚麻面罩
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .isOnQuest 83
step
    #label Princess
    .goto Elwynn Forest,69.4,79.2
    >>击杀公主，拾取黄铜项圈；必要时使用之前获得的次级治疗药水
    >>也可以在农场边缘的栅栏之间来回跳跃，击杀公主和它的护卫
    .complete 88,1 --Collect Brass Collar (x1)
--N link
step
    #softcore
    #sticky
    #completewith next
    .goto Elwynn Forest,83.6,69.7,120 >>如果生命值较低，就死亡后在灵魂医者处复活；否则直接跑回去交任务
step
    .goto Elwynn Forest,79.5,68.9
.target 萨拉·迪博雷恩
>>与 |cRXP_FRIENDLY_萨拉·迪博雷恩|r 交谈
    .turnin 83 >> 交任务：红色亚麻布
    .isQuestComplete 83
step
    .goto Redridge Mountains,7.87,73.85
    .zone Redridge Mountains >>在前往赤脊山的路上刷怪升级
step
    #softcore
    #sticky
    #completewith next
    +让这里的怪物击杀你
    .goto Redridge Mountains,11.2,78.4
step
    #softcore
    >>在灵魂医者处复活
    .goto Redridge Mountains,20.8,56.6,100 >>在灵魂医者处复活
step
    #softcore
    .goto Redridge Mountains,30.6,59.4
    .fp Redridge Mountains >> 获取赤脊山飞行点
step
    #hardcore
    >>跑向飞行点。途中务必小心，避免引到怪物或被击杀。尽量沿道路前进，并留意周围的怪物
    .goto Redridge Mountains,30.6,59.4
    .fp Redridge Mountains >> 获取赤脊山飞行点
step
    .hs >> 炉石回闪金镇
step
    .goto Elwynn Forest,43.283,65.721
    >>不用等候他的剧情演出
.target 威廉·匹斯特
>>与 |cRXP_FRIENDLY_威廉·匹斯特|r 对话
    .turnin 112 >> 交任务：收集海藻
step
    .goto Elwynn Forest,42.2,65.8
>>与 |cRXP_FRIENDLY_治安官杜汉|r 交谈
    .turnin 39 >> 交任务：托马斯的报告
    .turnin 76 >> 交任务：玉石矿洞
.target 治安官杜汉
    .accept 239 >> 接任务：西泉要塞
step
    .goto Elwynn Forest,41.706,65.544
.target 铁匠阿古斯
>>与 |cRXP_FRIENDLY_铁匠阿古斯|r 交谈
-->>Talk to |cRXP_FRIENDLY_Smith Argus|r
    .accept 1097 >> 接任务：艾尔默的任务
step
    .goto Elwynn Forest,41.7,65.9
    .vendor >>卖掉杂物并修理
step
    .goto Elwynn Forest,43.283,65.721
.target 威廉·匹斯特
>>与 |cRXP_FRIENDLY_威廉·匹斯特|r 对话
    .accept 114 >> 接任务：梅贝尔的隐形水
step
    >>跑出旅店, 向南前进
    .goto Elwynn Forest,43.2,89.6
.target 梅贝尔·马科伦
>>与 |cRXP_FRIENDLY_梅贝尔·马科伦|r 对话
    .turnin 114 >> 交任务：梅贝尔的隐形水
step
    .goto Elwynn Forest,34.660,84.482
.target 斯通菲尔德妈妈
>>与 |cRXP_FRIENDLY_斯通菲尔德妈妈|r 交谈
    .turnin 88 >> 交任务：公主必须死！
step
    .goto Elwynn Forest,24.2,74.5
.target 瑞尼尔副队长
>>与 |cRXP_FRIENDLY_瑞尼尔副队长|r 交谈
    .turnin 239 >> 交任务：西泉要塞
step
    .isOnQuest 184
    .goto Westfall,60.0,19.4
.target 农夫法布隆
>>与 |cRXP_FRIENDLY_农夫法布隆|r 交谈
    .turnin 184 >> 交任务：法布隆的地契
step
    .goto Westfall,59.918,19.416
.target 弗娜·法布隆
>>与 |cRXP_FRIENDLY_弗娜·法布隆|r 交谈
    .accept 36 >> 接任务：杂味炖肉
step
    .goto Westfall,56.416,30.519
.target 萨尔玛·萨丁
>>与 |cRXP_FRIENDLY_萨尔玛·萨丁|r 交谈
    .turnin 36 >> 交任务：杂味炖肉
step
    #softcore
    #sticky
    #completewith next
    .goto Westfall,51.7,49.4,150 >> 死亡后在灵魂医者处复活，或者跑去哨兵岭
step
    .goto Westfall,56.327,47.520
.target 格里安·斯托曼
>>与 |cRXP_FRIENDLY_格里安·斯托曼|r 交谈
    .turnin 109 >> 交任务：向格里安·斯托曼报到
step
    .goto Westfall,57.002,47.169
    .vendor >>卖掉杂物
.target 军需官刘易斯
>>与 |cRXP_FRIENDLY_军需官刘易斯|r 交谈
    .accept 6181 >> 接任务：快递消息
step
    #som
    #phase 3-6
    .goto Westfall,56.416,30.519
    .xp 11+3750 >> 刷怪至 3750+/8800 经验值
step
    .goto Westfall,56.6,52.6
    .fp Sentinel Hill >> 获取哨兵岭飞行点
>>与 |cRXP_FRIENDLY_索尔|r 交谈
    .turnin 6181 >> 交任务：快递消息
.target 索尔
    .accept 6281 >> 接任务：赶赴暴风城
    .fly Stormwind >> 飞往暴风城
step
    .goto StormwindClassic,56.2,64.6
    >>选择火箭。火箭伤害很高，还能用来将怪物分开引出
.target 摩根·匹斯特
>>与 |cRXP_FRIENDLY_摩根·匹斯特|r 交谈
    .turnin 61 >> 交任务：送往暴风城的货物
step
    #era/som
    .goto StormwindClassic,57.1,57.7
    .train 201 >>学习单手剑
step
    .goto StormwindClassic,74.3,47.2
.target 奥斯瑞克·斯图恩
>>与 |cRXP_FRIENDLY_奥斯瑞克·斯图恩|r 交谈
    .turnin 6281 >> 交任务：赶赴暴风城
    >>卖掉杂物并修理
step
    #completewith next
    .goto StormwindClassic,51.8,12.1
.target 格瑞曼德·艾尔默
>>与 |cRXP_FRIENDLY_格瑞曼德·艾尔默|r 交谈
    .turnin 1097 >> 交任务：艾尔默的任务
step
    .goto StormwindClassic,51.8,12.1
.target 格瑞曼德·艾尔默
>>与 |cRXP_FRIENDLY_格瑞曼德·艾尔默|r 交谈
    .accept 353 >> 接任务：雷矛的包裹
step
    #sticky
    #completewith next
    .goto StormwindClassic,63.9,8.3,20 >>进入矿道地铁
step
    >>电车到站后上车, 到达另一侧后下车
.target 蒙提
>>与 |cRXP_FRIENDLY_蒙提|r 交谈
    .accept 6661 >> 接任务：捕捉矿道老鼠
step
    >>对周围的老鼠使用捕鼠者之笛
    .use 17117
    .complete 6661,1 --Rats Captured (x5)
step
.target 蒙提
>>与 |cRXP_FRIENDLY_蒙提|r 交谈
    .turnin 6661 >> 交任务：捕捉矿道老鼠
step
    .goto Ironforge,77.0,51.0,30 >>进入铁炉堡
step
    .goto Ironforge,55.501,47.742
    .fp Ironforge >> 获取铁炉堡飞行点
step
    #som
    #phase 3-6
    .goto Ironforge,27.17,8.57
     .trainer >> 学习职业技能
step
    #sticky
    #completewith next
    .goto Dun Morogh,53.5,34.9,100 >>跑出铁炉堡
step
    .goto Dun Morogh,60.1,52.6,50,0
    .goto Dun Morogh,63.1,49.8
.target 鲁德拉·冻石
>>与 |cRXP_FRIENDLY_鲁德拉·冻石|r 交谈
    .accept 314 >> 接任务：保护牲畜
step
    #sticky
    #completewith next
    .goto Dun Morogh,62.3,50.3,14,0
    .goto Dun Morogh,62.2,49.4,12 >> 沿着这段山路跑上去
step
    >>击杀瓦加什，拾取瓦加什的牙齿
    >>把它引到牧场南边的守卫处，确保对它造成 51% 以上的伤害
    >>小心，这个任务可能较难
    .goto Dun Morogh,62.6,46.1
    .goto Dun Morogh,62.78,54.60,0
    .complete 314,1 --Collect Fang of Vagash (1)
--N add video tutorial
step
    .goto Dun Morogh,63.1,49.8
.target 鲁德拉·冻石
>>与 |cRXP_FRIENDLY_鲁德拉·冻石|r 交谈
    .turnin 314 >> 交任务：保护牲畜
step
    >>途中顺带刷些怪
    .goto Dun Morogh,68.6,54.7
    .vendor >>卖掉杂物，购买食物和饮水
step
    .goto Dun Morogh,68.7,56.0
.target 参议员梅尔·圣石
>>与 |cRXP_FRIENDLY_参议员梅尔·圣石|r 交谈
    .accept 433 >> 接任务：公众之仆
step
    .goto Dun Morogh,69.084,56.330
.target 工头乔尼·石眉
>>与 |cRXP_FRIENDLY_工头乔尼·石眉|r 交谈
    .accept 432 >> 接任务：该死的石腭怪！
step
    .goto Dun Morogh,70.6,56.6,30,0
    .goto Dun Morogh,70.8,53.3,30,0
    .goto Dun Morogh,71.9,50.7,30,0
    .goto Dun Morogh,72.9,53.1,30,0
    .goto Dun Morogh,70.6,56.6,30,0
    .goto Dun Morogh,70.8,53.3,30,0
    .goto Dun Morogh,71.9,50.7,30,0
    .goto Dun Morogh,72.9,53.1,30,0
    >>击杀洞穴中的穴居人
    .complete 432,1 --Kill Rockjaw Skullthumper (6)
    .complete 433,1 --Kill Rockjaw Bonesnapper (10)
step
    #era/som
    .xp 10+6350 >>刷怪至 6350+/7600 经验值
step
    .goto Dun Morogh,69.084,56.330
.target 工头乔尼·石眉
>>与 |cRXP_FRIENDLY_工头乔尼·石眉|r 交谈
    .turnin 432 >> 交任务：该死的石腭怪！
step
    #completewith next
    .goto Dun Morogh,68.9,55.9
    .vendor >> 卖掉杂物并修理
step
    .goto Dun Morogh,68.7,56.0
.target 参议员梅尔·圣石
>>与 |cRXP_FRIENDLY_参议员梅尔·圣石|r 交谈
    .turnin 433 >> 交任务：公众之仆
step
    #era/som--xpgate
    .xp 11
step
    .goto Dun Morogh,68.6,54.7
    .vendor >>卖掉杂物，向卡杉·莫格什购买30瓶需要5级的饮水
step
    .goto Dun Morogh,68.38,54.49
    >>与|cRXP_FRIENDLY_厨师格瑞姆|r交谈，学习烹饪，为后续的烹饪步骤作准备
    .skill cooking,1 >>学习初级烹饪
    .target 厨师格瑞姆
step
    .goto Dun Morogh,83.892,39.188
.target 驾驶员塞克·锤足
>>与 |cRXP_FRIENDLY_驾驶员塞克·锤足|r 交谈
    .accept 419 >> 接任务：失踪的驾驶员
step
    .goto Dun Morogh,79.7,36.2
    .turnin 419 >> 交任务：失踪的驾驶员
    .accept 417 >> 接任务：驾驶员的复仇
step
    >>击杀癞爪。拾取它的爪子
    .goto Dun Morogh,80.0,36.4
    .complete 417,1 --Collect Mangy Claw (x1)
step
    .goto Dun Morogh,83.892,39.188
.target 驾驶员塞克·锤足
>>与 |cRXP_FRIENDLY_驾驶员塞克·锤足|r 交谈
    .turnin 417 >> 交任务：驾驶员的复仇
step
    .goto Dun Morogh,84.4,31.1,25 >>穿过隧道去洛克莫丹
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 联盟法师
#classic
#tbc
<< Gnome Mage
#name 1-10 Dun Morogh Mage AoE
#title 1-10 丹莫罗：侏儒法师AoE
#version 1
#group RestedXP Alliance Mage
#subgroupdisplayname RestedXP 联盟法师
#defaultfor Dwarf/Gnome
#next 10-12 Loch Modan Mage AoE
#displayname 1-10 丹莫罗（法师 AoE）
step
    #era/som
    #sticky
    #completewith next
    .goto Dun Morogh,29.927,71.201
    +你选择了侏儒和矮人适用的指南。请选择与你出生地相同的起始区域 << Human
    +注意：你选择了范围刷怪指南。范围刷怪通常比法师单体练级难得多，但速度也快得多
step
    #som
    #phase 3-6
    #sticky
    #completewith next
    .goto Dun Morogh,29.927,71.201
    +你选择了侏儒和矮人适用的指南。请选择与你出生地相同的起始区域 << Human
    +注意：你选择了范围刷怪指南。它通常比单体练级更难；在任务经验加成较高的赛季阶段，升级还可能比单体路线更慢
step
    >>删除炉石
    .goto Dun Morogh,29.927,71.201
.target 斯登·粗臂
>>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .accept 179 >> 接任务：矮人的交易
step
    >>击杀狼。从它们身上拾取肉
    .goto Dun Morogh,28.7,74.8
    .complete 179,1 --Collect Tough Wolf Meat (x8)
step
    .xp 2 >> 刷到2级
step
    .goto Dun Morogh,30.0,71.5
    >>出售杂物，购买15瓶水。钱不够就再刷一些狼
    .collect 159,15 --Collect Refreshing Spring Water (x15)
step
    .goto Dun Morogh,29.927,71.201
>>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .turnin 179 >> 交任务：矮人的交易
.target 斯登·粗臂
    .accept 233 >> 接任务：寒脊山谷的送信任务
    .accept 3114 >> 接任务：雕文备忘录
step
    .goto Dun Morogh,29.7,71.2
.target 巴尔林·霜锤
>>与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .accept 170 >> 接任务：新的威胁
step
    #sticky
    #completewith Rockjaw
    >>击杀遇到的普通石腭穴居人
    .complete 170,1 --Kill Rockjaw Trogg (x6)
step
    .goto Dun Morogh,26.9,72.7,30,0
    .goto Dun Morogh,25.1,72.1,30,0
    .goto Dun Morogh,26.9,72.7,30,0
    .goto Dun Morogh,25.1,72.1,30,0
    >>击杀壮实的石腭怪
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
step
    .goto Dun Morogh,22.601,71.433
>>与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .turnin 233 >> 交任务：寒脊山谷的送信任务
.target 塔林·锐眼
    .accept 183 >> 接任务：猎杀野猪
    .accept 234 >> 接任务：寒脊山谷的送信任务
step
    .goto Dun Morogh,22.2,72.5,40,0
    .goto Dun Morogh,20.5,71.4,40,0
    .goto Dun Morogh,21.1,69.0,40,0
    .goto Dun Morogh,22.8,69.6,40,0
    .goto Dun Morogh,22.2,72.5,40,0
    .goto Dun Morogh,20.5,71.4,40,0
    .goto Dun Morogh,21.1,69.0,40,0
    .goto Dun Morogh,22.8,69.6,40,0
    >>击杀这片区域的野猪
    .complete 183,1 --Kill Small Crag Boar (x12)
step
    .goto Dun Morogh,22.601,71.433
.target 塔林·锐眼
>>与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .turnin 183 >> 交任务：猎杀野猪
step
    .xp 3+860 >> 刷怪至 860+/1400 经验值
    .goto Dun Morogh,23.0,75.0,40,0
    .goto Dun Morogh,24.2,72.5,40,0
    .goto Dun Morogh,27.7,76.3,40,0
    .goto Dun Morogh,23.0,75.0,40,0
    .goto Dun Morogh,24.2,72.5,40,0
    .goto Dun Morogh,27.7,76.3,40,0
step
    #label Rockjaw
    .goto Dun Morogh,25.076,75.713
>>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 234 >> 交任务：寒脊山谷的送信任务
.target 格瑞林·白须
    .accept 182 >> 接任务：巨魔洞穴
step
    .goto Dun Morogh,25.0,76.0
.target 诺里斯·激流
>>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .accept 3364 >> 接任务：热酒快递
    >> 接取后会开始 5 分钟倒计时。按指南行动即可
step
    .goto Dun Morogh,28.7,77.5
    >>如果还没完成击杀穴居人的目标，就到这上面击杀它们
    .complete 170,1 --Kill Rockjaw Trogg (x6)
step
    #sticky
    #completewith Scalding1
    >>如果行动太慢导致限时任务失败，先放弃失败的任务，再回去重新接取
    .goto Dun Morogh,25.0,76.0,0
.target 诺里斯·激流
>>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .accept 3364 >> 接任务：热酒快递
    .goto Dun Morogh,28.8,66.4
.target 德南·弗卡特
>>与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .turnin 3364 >> 交任务：热酒快递
step
    #label Scalding1
    .goto Dun Morogh,28.8,66.4
>>与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .turnin 3364 >> 交任务：热酒快递
.target 德南·弗卡特
    .accept 3365 >> 接任务：归还酒杯
    .vendor >> 卖掉杂物
step
    .goto Dun Morogh,28.709,66.366
.target 玛瑞克·斯托纳尔
>>与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r交谈
    .turnin 3114 >> 交任务：雕文备忘录
    .trainer >> 学习职业技能
step
    >>跑出地堡
    .goto Dun Morogh,29.7,71.2
.target 巴尔林·霜锤
>>与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .turnin 170 >> 交任务：新的威胁
step
    .goto Dun Morogh,30.0,71.5
    .vendor >>出售杂物，再购买 10 瓶水
    .collect 159,10 --Collect Refreshing Spring Water (x10)
step
    .goto Dun Morogh,26.3,79.2,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    >>击杀霜鬃巨魔幼崽
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
step
    #sticky
    #label Mug
    .goto Dun Morogh,25.0,76.0
.target 诺里斯·激流
>>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .turnin 3365 >> 交任务：归还酒杯
step
    .goto Dun Morogh,25.076,75.713
>>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 182 >> 交任务：巨魔洞穴
.target 格瑞林·白须
    .accept 218 >> 接任务：被窃取的日记
step
    #requires Mug
    .goto Dun Morogh,26.8,79.9,30,0
    .goto Dun Morogh,29.0,79.0,15,0
    .goto Dun Morogh,30.6,80.3
    >>进入巨魔洞穴，击杀冷酷的格瑞克尼尔，拾取格瑞林·白须的日记
    .complete 218,1 --Collect Grelin Whitebeard's Journal (x1)
step
    >>沿途刷怪回到这里
    .goto Dun Morogh,25.1,75.8
>>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 218 >> 交任务：被窃取的日记
.target 格瑞林·白须
    .accept 282 >> 接任务：森内尔的观察站
step
    >> 沿途刷怪到这里
    .goto Dun Morogh,33.484,71.841
>>与|cRXP_FRIENDLY_巡山人萨鲁斯|r交谈
    .turnin 282 >> 交任务：森内尔的观察站
.target 巡山人萨鲁斯
    .accept 420 >> 接任务：森内尔的观察站
step
    .goto Dun Morogh,33.9,72.2
.target 汉兹·跳链
>>与|cRXP_FRIENDLY_汉兹·跳链|r交谈
    .accept 2160 >> 接任务：塔诺克的补给品
step
    .goto Dun Morogh,34.1,71.6,20,0
    .goto Dun Morogh,35.7,66.0,20 >>穿过隧道
step
    #sticky
    #completewith BoarMeat44
    >> 击杀野猪获取4份大块野猪肉, 以备后用
    .collect 769,4,317,1 --Collect Chunk of Boar Meat (x4)
step
    #sticky
    #completewith Ribs
    >> 击杀野猪, 收集6个峭壁野猪肋排, 以备后用
    .collect 2886,6 --Collect Crag Boar Rib (x6)
step
    >>向东北前往卡拉诺斯，沿途刷野猪
    .goto Dun Morogh,36.4,62.9,45,0
    .goto Dun Morogh,37.7,60.5,45,0
    .goto Dun Morogh,43.9,55.7
    .xp 5+2415 >> 刷怪至 2415+/2800 经验值
step
    #softcore
    .goto Dun Morogh,47.0,55.1,120 >> 死亡后在灵魂医者处复活，或者跑去卡拉诺斯。确保所在子区域不是寒脊隘口。
step
    .goto Dun Morogh,46.726,53.826
.target 森内尔·白须
>>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .turnin 420 >> 交任务：森内尔的观察站
step
    #completewith next
    .goto Dun Morogh,46.7,53.5
    .vendor >>出售杂物
step
    .goto Dun Morogh,46.8,52.4
.target 拉格纳·雷酒
>>与|cRXP_FRIENDLY_拉格纳·雷酒|r交谈
    .accept 384 >> 接任务：啤酒烤猪排
step
    .goto Dun Morogh,48.3,57.0
    .xp 6 >> 刷到6级
step
    .goto Dun Morogh,47.217,52.195
.target 塔诺克·霜锤
>>与|cRXP_FRIENDLY_塔诺克·霜锤|r交谈
    .turnin 2160 >> 交任务：塔诺克的补给品
step
    >>上楼
    .goto Dun Morogh,47.5,52.1
    .trainer >> 学习职业技能
step
    .goto Dun Morogh,47.4,52.5
    .home >> 将你的炉石设置为雷酒酿造厂
    .vendor >> 在负担得起的范围内尽量多买需要 5 级的饮料
step
    .goto Dun Morogh,46.021,51.676
.target 萨雷克·黑石
>>与|cRXP_FRIENDLY_萨雷克·黑石|r交谈
    .accept 400 >> 接任务：贝尔丁的工具
step
    .goto Dun Morogh,49.426,48.410
    >>不要击杀沿途的熊
.target 驾驶员贝隆·风箱
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .accept 317 >> 接任务：贝尔丁的补给
step
    .goto Dun Morogh,49.622,48.612
.target 驾驶员迪恩·石轮
>>与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .accept 313 >> 接任务：灰色洞穴
step
    .goto Dun Morogh,50.4,49.1
.target 贝尔丁·钢架
>>与|cRXP_FRIENDLY_贝尔丁·钢架|r交谈
    .turnin 400 >> 交任务：贝尔丁的工具
step
    #label BoarMeat44
    .goto Dun Morogh,50.084,49.420
.target 罗斯洛·鲁治
>>与|cRXP_FRIENDLY_罗斯洛·鲁治|r交谈
    .accept 5541 >> 接任务：海格纳的弹药
step
    .goto Dun Morogh,52.0,50.1,40,0
    .goto Dun Morogh,51.5,53.9,40,0
    .goto Dun Morogh,50.1,53.9,40,0
    .goto Dun Morogh,49.9,50.9,40,0
    .goto Dun Morogh,48.0,49.5,40,0
    .goto Dun Morogh,48.2,46.9,40,0
    .goto Dun Morogh,43.5,52.5,40,0
    .goto Dun Morogh,52.0,50.1,40,0
    .goto Dun Morogh,51.5,53.9,40,0
    .goto Dun Morogh,50.1,53.9,40,0
    .goto Dun Morogh,49.9,50.9,40,0
    .goto Dun Morogh,48.0,49.5,40,0
    .goto Dun Morogh,48.2,46.9,40,0
    .goto Dun Morogh,43.5,52.5,40,0
    .goto Dun Morogh,52.0,50.1,40,0
    .goto Dun Morogh,51.5,53.9,40,0
    .goto Dun Morogh,50.1,53.9,40,0
    .goto Dun Morogh,49.9,50.9,40,0
    .goto Dun Morogh,48.0,49.5,40,0
    .goto Dun Morogh,48.2,46.9,40,0
    .goto Dun Morogh,43.5,52.5,40,0
    .goto Dun Morogh,52.0,50.1,40,0
    .goto Dun Morogh,51.5,53.9,40,0
    .goto Dun Morogh,50.1,53.9,40,0
    .goto Dun Morogh,49.9,50.9,40,0
    .goto Dun Morogh,48.0,49.5,40,0
    .goto Dun Morogh,48.2,46.9,40,0
    .goto Dun Morogh,43.5,52.5,40,0
    >>收集“贝尔丁的补给”所需的物品
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .complete 317,2 --Collect Thick Bear Fur (x2)
step
    .goto Dun Morogh,49.426,48.410
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .turnin 317 >> 交任务：贝尔丁的补给
.target 驾驶员贝隆·风箱
    .accept 318 >> 接任务：艾沃沙酒
step
    >>返回旅店
    .goto Dun Morogh,46.9,52.1,20,0
    .goto Dun Morogh,47.4,52.5
    .vendor >> 在负担得起的范围内尽量多买需要 5 级的饮料
    >>可以在旅店外购买剥皮小刀。在获得带属性加成的武器前，它比法杖更好
step
    .goto Dun Morogh,42.5,54.8,40,0
    .goto Dun Morogh,42.4,52.2,40,0
    .goto Dun Morogh,41.0,49.4,40,0
    .goto Dun Morogh,42.5,54.8,40,0
    .goto Dun Morogh,42.4,52.2,40,0
    .goto Dun Morogh,41.0,49.4,40,0
    .goto Dun Morogh,42.5,54.8,40,0
    .goto Dun Morogh,42.4,52.2,40,0
    .goto Dun Morogh,41.0,49.4,40,0
    .goto Dun Morogh,42.5,54.8,40,0
    .goto Dun Morogh,42.4,52.2,40,0
    .goto Dun Morogh,41.0,49.4,40,0
    >> 进入洞穴，击杀雪怪并拾取它们的鬃毛
    .complete 313,1 --Collect Wendigo Mane (x8)
step
    >>拾取箱子里的物品
    .goto Dun Morogh,44.1,56.9
    .complete 5541,1 --Collect Rumbleshot's Ammo (x1)
step
    #label BearFur
    .goto Dun Morogh,40.6,62.6,30,0
    .goto Dun Morogh,40.682,65.130
.target 海格纳·重枪
>>与|cRXP_FRIENDLY_海格纳·重枪|r交谈
    .turnin 5541 >> 交任务：海格纳的弹药
    .vendor >> 出售杂物并修理装备
step
    .xp 7 >> 刷到7级
step
    >>沿途刷怪
    .goto Dun Morogh,35.2,56.4,50,0
    .goto Dun Morogh,36.0,52.0,50,0
    .goto Dun Morogh,34.6,51.7
.target 图德拉·马克格拉恩
>>与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .accept 312 >> 接任务：马克格拉恩的干肉
step
    .goto Dun Morogh,30.5,46.0
    .vendor >> 出售杂物，将需要5级的饮水补充至20瓶
step
    #sticky
    #label Evershine
    .goto Dun Morogh,30.2,45.8
>>与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 318 >> 交任务：艾沃沙酒
.target 雷杰德·麦酒
    .accept 319 >> 接任务：艾沃沙酒
    .accept 315 >> 接任务：完美烈酒
step
    .goto Dun Morogh,30.186,45.531
.target 马莱斯·麦酒
>>与|cRXP_FRIENDLY_马莱斯·麦酒|r交谈
    .accept 310 >> 接任务：针锋相对
step
    #label Ribs
    #requires Evershine
    .goto Dun Morogh,31.5,38.9,60,0
    .goto Dun Morogh,28.3,39.9,60,0
    .goto Dun Morogh,28.7,43.7,60,0
    .goto Dun Morogh,25.8,47.2,60,0
    .goto Dun Morogh,25.8,47.2,60,0
    .goto Dun Morogh,30.0,51.8,60,0
    .goto Dun Morogh,31.5,38.9,60,0
    .goto Dun Morogh,28.3,39.9,60,0
    .goto Dun Morogh,28.7,43.7,60,0
    .goto Dun Morogh,25.8,47.2,60,0
    .goto Dun Morogh,25.8,47.2,60,0
    .goto Dun Morogh,30.0,51.8,60,0
    >> 击杀冰爪熊、老峭壁野猪和雪豹；按北→西→南的路线前进
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .complete 319,3 --Kill Snow Leopard (x8)
step
    >>收集齐剩余的峭壁野猪肋排
    .complete 384,1 --Collect Crag Boar Rib (x6)
step
    .goto Dun Morogh,30.189,45.725
>>与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 319 >> 交任务：艾沃沙酒
.target 雷杰德·麦酒
    .accept 320 >> 接任务：艾沃沙酒
step
    .isQuestTurnedIn 384
    .xp 7+4360 >>刷怪至4360+/4500经验值
step
    .xp 7+3735 >>刷怪至3735+/4500经验值
step
    .hs >> 炉石回卡拉诺斯
step
    .goto Dun Morogh,47.4,52.5
    >> 从贝尔姆那里买狂想麦酒和雷霆麦酒
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .collect 2686,1 --Collect Thunder Ale (x1)
step
    .goto Dun Morogh,47.6,52.4,10,0
    .goto Dun Morogh,47.71,52.69
    >>下楼与加文交谈，将雷霆麦酒交给他
    >>等待酒桶的鼠标提示变为“无人看守”，然后交任务
    .turnin 310 >> 交任务：针锋相对
    .accept 311 >> 接任务：向马莱斯回报
step
    .goto Dun Morogh,46.8,52.4
.target 拉格纳·雷酒
>>与|cRXP_FRIENDLY_拉格纳·雷酒|r交谈
    .turnin 384 >> 交任务：啤酒烤猪排
     >>下次遇到商人时出售配方
step
    .xp 8 >> 刷到8级
step
    .goto Dun Morogh,47.5,52.1
    .trainer >> 学习职业技能
    >>务必学习变形术
step
    .goto Dun Morogh,47.4,52.5
    .vendor >> 向旅店老板购买需要5级的饮水，补充至30瓶
step
    .goto Dun Morogh,46.726,53.826
.target 森内尔·白须
>>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .accept 287 >> 接任务：霜鬃巨魔要塞
step
    .goto Dun Morogh,49.622,48.612
.target 驾驶员迪恩·石轮
>>与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .turnin 313 >> 交任务：灰色洞穴
step
    .goto Dun Morogh,49.426,48.410
.target 驾驶员贝隆·风箱
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .turnin 320 >> 交任务：艾沃沙酒
step
    #era/som
    >>进入建筑内
    .goto Dun Morogh,45.8,49.4
.target 拉兹·滑链
>>与|cRXP_FRIENDLY_拉兹·滑链|r交谈
    .accept 412 >> 接任务：自动净化装置
step
    .goto Dun Morogh,43.1,45.0,25,0
    .goto Dun Morogh,42.1,45.4,25 >> 跑上坡道去找微光草
step
    .goto Dun Morogh,40.9,45.3,30,0
    .goto Dun Morogh,41.5,43.6,30,0
    .goto Dun Morogh,39.7,40.0,30,0
    .goto Dun Morogh,42.1,34.3,30,0
    >>清理这片区域的怪物。需要清理中间营地时要小心。如果还差2只怪物，可以引出小屋里的怪物，再绕到屋后阻挡它们的视线。运气不好就去另一片区域
    >>拾取地面箱子里的物品
    .complete 315,1 --Collect Shimmerweed (x6)
step
    >> 对冰须使用变形术，再拾取马克格拉恩的干肉。
    .goto Dun Morogh,38.5,53.9
    .complete 312,1 --Collect MacGrann's Dried Meats (x1)
step
    .goto Dun Morogh,34.6,51.7
.target 图德拉·马克格拉恩
>>与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .turnin 312 >> 交任务：马克格拉恩的干肉
step
    .goto Dun Morogh,30.4,45.8
    .vendor >> 将需要5级的饮水补充至20瓶
step
    #sticky
    #label Stout
    .goto Dun Morogh,30.189,45.725
>>与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 315 >> 交任务：完美烈酒
.target 雷杰德·麦酒
    .accept 413 >> 接任务：微光酒
step
    .goto Dun Morogh,30.186,45.531
.target 马莱斯·麦酒
>>与|cRXP_FRIENDLY_马莱斯·麦酒|r交谈
    .turnin 311 >> 交任务：向马莱斯回报
step
    #era/som
    #requires Stout
    .goto Dun Morogh,27.2,43.0,40,0
    .goto Dun Morogh,24.8,39.3,40,0
    .goto Dun Morogh,25.6,43.4,40,0
    .goto Dun Morogh,24.3,44.0,40,0
    .goto Dun Morogh,25.4,45.4,40,0
    >>击杀麻风侏儒，拾取多档齿轮和自适应齿轮
    .complete 412,2 --Collect Gyromechanic Gear (x8)
    .complete 412,1 --Collect Restabilization Cog (x8)
step
    .xp 9 >> 刷到9级
step
    .goto Dun Morogh,24.5,50.8,35 >>进入洞穴
step
    .goto Dun Morogh,22.1,50.3,40,0
    .goto Dun Morogh,21.3,52.9,40,0
    >>击杀洞穴内的猎头者
    .complete 287,1 --Kill Frostmane Headhunter (x5)
step
    #hardcore
    >>小心地一路清怪，深入洞穴中的这个角落
    .goto Dun Morogh,23.0,52.2
    .complete 287,2 --Fully explore Frostmane Hold
step
    #softcore
    .goto Dun Morogh,23.4,51.5,15 >>返回洞穴上层
step
    #softcore
    >>跳下去，之后会死亡
    .goto Dun Morogh,23.0,52.2
    .complete 287,2 --Fully explore Frostmane Hold
step
    #softcore
    .deathskip >> 死亡后在灵魂医者处复活
step
    #hardcore
   .goto Dun Morogh,46.726,53.826,150 >> 炉石冷却结束就回卡拉诺斯，否则在返回的路上刷怪。
step
    .goto Dun Morogh,46.726,53.826
>>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .turnin 287 >> 交任务：霜鬃巨魔要塞
.target 森内尔·白须
    .accept 291 >> 接任务：森内尔的报告
step
    #era/som
    .goto Dun Morogh,45.8,49.4
.target 拉兹·滑链
>>与|cRXP_FRIENDLY_拉兹·滑链|r交谈
    .turnin 412 >> 交任务：自动净化装置
step
    .goto Dun Morogh,60.1,52.6,50,0
    .goto Dun Morogh,63.1,49.8
.target 鲁德拉·冻石
>>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .accept 314 >> 接任务：保护牲畜
step
    #sticky
    #completewith next
    .goto Dun Morogh,62.3,50.3,14,0
    .goto Dun Morogh,62.2,49.4,10 >>从这里跑上山
step
    >>击杀瓦加什，拾取瓦加什的牙齿
    >>把它引到牧场南边的守卫处，确保对它造成 51% 以上的伤害
    >>小心，这个任务可能比较难
    .goto Dun Morogh,62.6,46.1
    .complete 314,1 --Collect Fang of Vagash (1)
--N Video tutorial needed
step
    .goto Dun Morogh,63.1,49.8
.target 鲁德拉·冻石
>>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .turnin 314 >> 交任务：保护牲畜
step
    >>沿途刷一些怪
    .goto Dun Morogh,68.6,54.7
    .vendor >>出售杂物，按需购买食物和饮水
step
    .goto Dun Morogh,68.7,56.0
.target 参议员梅尔·圣石
>>与|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .accept 433 >> 接任务：公众之仆
step
    #completewith next
    .goto Dun Morogh,68.9,55.9
    .vendor >> 卖掉杂物并修理
step
    .goto Dun Morogh,69.084,56.330
.target 工头乔尼·石眉
>>与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 432 >> 接任务：该死的石腭怪！
step
    .goto Dun Morogh,70.6,56.6,30,0
    .goto Dun Morogh,70.8,53.3,30,0
    .goto Dun Morogh,71.9,50.7,30,0
    .goto Dun Morogh,72.9,53.1,30,0
    .goto Dun Morogh,70.6,56.6,30,0
    .goto Dun Morogh,70.8,53.3,30,0
    .goto Dun Morogh,71.9,50.7,30,0
    .goto Dun Morogh,72.9,53.1,30,0
    >>击杀洞穴中的穴居人
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
step
    .goto Dun Morogh,69.084,56.330
.target 工头乔尼·石眉
>>与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .turnin 432 >> 交任务：该死的石腭怪！
step
    #completewith next
    .goto Dun Morogh,68.9,55.9
    .vendor >> 卖掉杂物并修理
step
    .goto Dun Morogh,68.7,56.0
.target 参议员梅尔·圣石
>>与|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .turnin 433 >> 交任务：公众之仆
step
    .goto Dun Morogh,67.1,59.7,40,0
    .goto Dun Morogh,70.7,58.2,40,0
    .goto Dun Morogh,71.0,53.9,40,0
    .xp 10 >> 击杀石腭怪，刷到10级
step
    .goto Dun Morogh,68.6,54.7
    .vendor >>出售杂物，向卡杉·莫格什补足30瓶需要5级的饮水
step
    .goto Dun Morogh,68.38,54.49
    >>与|cRXP_FRIENDLY_厨师格瑞姆|r交谈，学习烹饪，为后续的烹饪步骤作准备
    .skill cooking,1 >>学习初级烹饪
    .target 厨师格瑞姆
step
    .goto Dun Morogh,83.8,39.2
.target 驾驶员塞克·锤足
>>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .accept 419 >> 接任务：失踪的驾驶员
step
    >>沿途刷怪
    .goto Dun Morogh,79.7,36.2
    .turnin 419 >> 交任务：失踪的驾驶员
    .accept 417 >> 接任务：驾驶员的复仇
step
    >>击杀癞爪，拾取它的爪子
    .goto Dun Morogh,80.0,36.4
    .complete 417,1 --Collect Mangy Claw (x1)
step
    .goto Dun Morogh,83.892,39.188
.target 驾驶员塞克·锤足
>>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .turnin 417 >> 交任务：驾驶员的复仇
step
    >>穿过来时的隧道返回
    .goto Dun Morogh,79.6,50.7,50,0
    .goto Dun Morogh,82.3,53.5,25,0
    .goto Dun Morogh,86.278,48.812
>>与|cRXP_FRIENDLY_巡山人维拉特·麦酒|r交谈
    .turnin 413 >> 交任务：微光酒
.target 巡山人维拉特·麦酒
    .accept 414 >> 接任务：卡德雷尔的酒
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 联盟法师
#classic
#tbc
<< Human Mage/Gnome Mage
#name 10-12 Loch Modan Mage AoE
#title 10-12 洛克莫丹：法师AoE
#version 1
#group RestedXP Alliance Mage
#subgroupdisplayname RestedXP 联盟法师
#defaultfor Human Mage/Gnome Mage
#next 12-18 Darkshore Mage AoE
#displayname 10-12 洛克莫丹（法师 AoE）
step
    #era/som
    #completewith next
    +在洛克莫丹做任务时，保留所有获得的大块野猪肉，不要卖给商人，后面会用到的
step
    #era/som
    #sticky
    #completewith CookingPrep
    .skill cooking,10,1
    >>沿途击杀野猪，保留至少9块|cRXP_LOOT_大块野猪肉|r，供等船时烹饪
    .collect 769,9
step << Gnome
    .goto Loch Modan,22.071,73.127
.target 巡山人库伯弗林特
>>与 |cRXP_FRIENDLY_巡山人库伯弗林特|r 交谈
    .accept 224 >> 接任务：保卫国王的领土
step << Gnome
    .goto Loch Modan,23.233,73.675
    >>从后方进入掩体
.target 拉格弗斯上尉
>>与 |cRXP_FRIENDLY_拉格弗斯上尉|r 交谈
    .accept 267 >> 接任务：穴居人的威胁
step << Gnome
    .goto Loch Modan,29.9,68.2,45 >> 前往穴居人洞口
step << Gnome
    .goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    .goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    >>击杀碎石穴居人，拾取穴居人的石牙。
    >>这个任务难度较高，请小心。如果误引到 2 只怪物，立即逃跑。
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
step << Gnome
    .goto Loch Modan,22.071,73.127
.target 巡山人库伯弗林特
>>与 |cRXP_FRIENDLY_巡山人库伯弗林特|r 交谈
    .turnin 224 >> 交任务：保卫国王的领土
step << Gnome
    .goto Loch Modan,23.233,73.675
    >>从后方进入掩体
.target 拉格弗斯上尉
>>与 |cRXP_FRIENDLY_拉格弗斯上尉|r 交谈
    .turnin 267 >> 交任务：穴居人的威胁
step << Human
    .goto Loch Modan,24.1,18.2
    .vendor >>出售杂物并修理装备
step << Human
    .goto Loch Modan,24.764,18.397
>>与 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r 交谈
    .turnin 353 >> 交任务：雷矛的包裹
.target 巡山人卡尔·雷矛
    .accept 307 >> 接任务：肮脏的爪子
step << Human
    #sticky
    #completewith next
    >>击杀这一区域的蜘蛛，拾取蜘蛛的毒液。
    .collect 3174,3 --Collect Spider Ichor (x3)
    >>击杀这一区域的熊，拾取熊肉。
    .collect 3173,3 --Collect Bear Meat (x3)
    >>击杀这一区域的野猪，拾取猪大肠。
    .collect 3172,3 --Collect Boar Intestines (x3)
step << Human
    .goto Loch Modan,35.1,47.8,130 >>沿途刷怪，为稍后的烹饪任务收集材料。
step
    >>跑到塞尔萨玛。不要设置炉石。 << Gnome
    .goto Loch Modan,34.828,49.283
.target 维德拉·壁炉
>>与 |cRXP_FRIENDLY_维德拉·壁炉|r 交谈
    .accept 418 >> 接任务：塞尔萨玛血肠
step << Human
    #sticky
    .abandon 1338 >> 放弃任务“卡尔·雷矛的订单”，以解锁“巡山人卡尔·雷矛的任务”
step
    .goto Loch Modan,34.8,48.6
    .vendor >>购买1-2个6格背包，填满背包栏位。
step
    .goto Loch Modan,35.5,48.4
    .vendor >> 购买食物和饮料，尽量准备 40 瓶需要 5 级的饮料、20 份需要 5 级的食物。
step
    .goto Loch Modan,32.6,49.9,80.0,0
    .goto Loch Modan,37.2,46.1,80.0,0
    .goto Loch Modan,36.7,41.6
    >>寻找巡山人卡德雷尔。他沿塞尔萨玛的道路巡逻。
.target 巡山人卡德雷尔
>>与 |cRXP_FRIENDLY_巡山人卡德雷尔|r 交谈
    .turnin -414 >> 交任务：卡德雷尔的酒
    .accept 416 >> 接任务：狗头人的耳朵
    .accept 1339 >> 接任务：巡山人卡尔·雷矛的任务
step
    #sticky
    #completewith Thelsamar1
    >>击杀该区域的蜘蛛，收集制作塞尔萨玛血肠所需的蜘蛛的毒液
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
step
    #sticky
    #completewith Thelsamar1
    >>击杀该区域的熊，收集制作塞尔萨玛血肠所需的熊肉
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
step
    #sticky
    #completewith Thelsamar1
    >>击杀该区域的野猪，收集制作塞尔萨玛血肠所需的猪大肠
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
step << Gnome
    .goto Loch Modan,24.1,18.2
    .vendor >>出售杂物并修理装备
step << Gnome
    .goto Loch Modan,24.764,18.397
>>与 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r 交谈
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务
.target 巡山人卡尔·雷矛
    .accept 1338 >> 接任务：卡尔·雷矛的订单
    .accept 307 >> 接任务：肮脏的爪子
step << Gnome
    #label Thelsamar1
    .goto Loch Modan,33.71,17.20,130 >>途中刷怪，收集猪大肠、熊肉和蜘蛛的毒液
step << Human
    #label Thelsamar1
    .goto Loch Modan,39.3,27.0,130 >>途中刷怪，收集猪大肠、熊肉和蜘蛛的毒液
step
    #sticky
    #completewith Gear
    >> 击杀坑道鼠，拾取他们的耳朵
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
step
    .goto Loch Modan,35.5,18.2,45 >>一边击杀坑道鼠，一边前往洞穴入口
step
    #label Gear
    .goto Loch Modan,35.5,19.9,12,0
    .goto Loch Modan,36.4,20.7,12,0
    .goto Loch Modan,35.3,22.0,12,0
    .goto Loch Modan,35.9,22.1,12,0
    .goto Loch Modan,36.3,24.7,12,0
    .goto Loch Modan,35.7,24.3,12,0
    .goto Loch Modan,34.9,24.9,12,0
    .goto Loch Modan,35.7,24.3,12,0
    .goto Loch Modan,36.3,24.7,12,0
    .goto Loch Modan,35.9,22.1,12,0
    .goto Loch Modan,35.3,22.0,12,0
    .goto Loch Modan,36.4,20.7,12,0
    .goto Loch Modan,35.5,19.9,12,0
    >>收集洞穴中的箱子。11级时这里难度较高，请小心。
    >>小心，地卜师会在几秒后施放快速烈焰防护结界，获得火焰免疫。
    .complete 307,1 --Collect Miners' Gear (x4)
step
    .goto Loch Modan,39.43,22.58
    >> 击杀坑道鼠，拾取他们的耳朵
    >> 尽量击杀坑道鼠歹徒，避开其他狗头人和地卜师
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
step
    #sticky
    #completewith Thelsamar2
    >>击杀该区域的蜘蛛，收集制作塞尔萨玛血肠所需的蜘蛛的毒液
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
step
    #sticky
    #completewith Thelsamar2
    >>击杀该区域的熊，收集制作塞尔萨玛血肠所需的熊肉
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
step
    #sticky
    #completewith Thelsamar2
    >>击杀该区域的野猪，收集制作塞尔萨玛血肠所需的猪大肠
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
step
    #label Thelsamar2
    .goto Loch Modan,23.3,17.9,60 >>沿途刷怪，返回掩体。
step
    .goto Loch Modan,24.1,18.2
    .vendor >>出售杂物并修理装备
step
    .goto Loch Modan,24.7,18.3
>>与 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r 交谈
    .turnin 307 >> 交任务：肮脏的爪子
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务 << Human
.target 巡山人卡尔·雷矛
    .accept 1338 >> 接任务：卡尔·雷矛的订单 << Human
step
    #sticky
    #label Meat9
    .goto Loch Modan,26.9,10.7,40,0
    .goto Loch Modan,30.9,10.6,40,0
    .goto Loch Modan,28.6,15.4,40,0
    .goto Loch Modan,30.5,26.6,40,0
    .goto Loch Modan,33.4,30.3,40,0
    .goto Loch Modan,39.4,33.3,40,0
    .goto Loch Modan,26.9,10.7,40,0
    .goto Loch Modan,30.9,10.6,40,0
    .goto Loch Modan,28.6,15.4,40,0
    .goto Loch Modan,30.5,26.6,40,0
    .goto Loch Modan,33.4,30.3,40,0
    .goto Loch Modan,39.4,33.3,40,0
    .goto Loch Modan,26.9,10.7
    >>击杀熊，拾取熊肉
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
step
    #sticky
    #label Ichor9
    .goto Loch Modan,31.9,16.4,40,0
    .goto Loch Modan,28.0,20.6,40,0
    .goto Loch Modan,33.8,40.5,40,0
    .goto Loch Modan,36.2,30.9,40,0
    .goto Loch Modan,39.0,32.1,40,0
    .goto Loch Modan,31.9,16.4,40,0
    .goto Loch Modan,28.0,20.6,40,0
    .goto Loch Modan,33.8,40.5,40,0
    .goto Loch Modan,36.2,30.9,40,0
    .goto Loch Modan,39.0,32.1,40,0
    .goto Loch Modan,31.9,16.4
    >>击杀蜘蛛，拾取蜘蛛的毒液
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
step
    .goto Loch Modan,38.0,34.9,40,0
    .goto Loch Modan,37.1,39.8,40,0
    .goto Loch Modan,29.8,35.9,40,0
    .goto Loch Modan,27.7,25.3,40,0
    .goto Loch Modan,28.6,22.6,40,0
    .goto Loch Modan,38.0,34.9,40,0
    .goto Loch Modan,37.1,39.8,40,0
    .goto Loch Modan,29.8,35.9,40,0
    .goto Loch Modan,27.7,25.3,40,0
    .goto Loch Modan,28.6,22.6,40,0
    .goto Loch Modan,38.0,34.9
    >>击杀野猪，拾取猪大肠
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
step
#hidewindow
    #requires Meat9
step
    #sticky
    #label RatCatching
    #requires Ichor9
    .goto Loch Modan,32.6,49.9,80.0,0
    .goto Loch Modan,37.2,46.1,80.0,0
    .goto Loch Modan,36.7,41.6
    >>寻找巡山人卡德雷尔。他沿塞尔萨玛的道路巡逻。
.target 巡山人卡德雷尔
>>与 |cRXP_FRIENDLY_巡山人卡德雷尔|r 交谈
    .turnin 416 >> 交任务：狗头人的耳朵
step
    #requires Ichor9
    .goto Loch Modan,34.828,49.283
.target 维德拉·壁炉
>>与 |cRXP_FRIENDLY_维德拉·壁炉|r 交谈
    .turnin 418 >> 交任务：塞尔萨玛血肠
step
    #era/som
    .goto Loch Modan,34.76,48.62
    .vendor >> 购买 6 格背包，直到背包栏位装满；另买 1 个燧石和火绒、2 个普通木柴
    .collect 4470,2 --Simple Wood (2)
    .collect 4471,1 --Flint and Tinder (1)
step
    .xp 12 >> 刷到12级
step << Gnome
    #completewith next
    #requires RatCatching
    .goto Loch Modan,64.82,66.04
    .vendor >> 查看阿尔德伦是否出售智者腰带；买得起就买下，留待以后使用。
step << Gnome
    #requires RatCatching
    .goto Loch Modan,65.94,65.62
.target 勘察员基恩萨·铁环
>>与|cRXP_FRIENDLY_勘察员基恩萨·铁环|r交谈
    .accept 298 >>接受任务 挖掘进度报告
step << Gnome
    #softcore
    .goto Loch Modan,68.12,62.98
    .deathskip >> 死亡后在塞尔萨玛复活。
step << Gnome
    #hardcore
    >> 跑回塞尔萨玛，进入建筑
    .goto Loch Modan,37.16,46.89,20,0
    .goto Loch Modan,37.02,47.81
.target 布洛克·寻石者
>>与 |cRXP_FRIENDLY_布洛克·寻石者|r 交谈
    .accept 6387 >>接任务：荣誉学员
>>与 |cRXP_FRIENDLY_吉恩·角盔|r 交谈
    .turnin 298 >>交任务：挖掘进度报告
.target 吉恩·角盔
    .accept 301 >>接任务：向铁炉堡报告
step << Gnome
    #softcore
    >> 进入建筑
    .goto Loch Modan,37.16,46.89,20,0
    .goto Loch Modan,37.02,47.81
.target 布洛克·寻石者
>>与 |cRXP_FRIENDLY_布洛克·寻石者|r 交谈
    .accept 6387 >>接任务：荣誉学员
>>与 |cRXP_FRIENDLY_吉恩·角盔|r 交谈
    .turnin 298 >>交任务：挖掘进度报告
.target 吉恩·角盔
    .accept 301 >>接任务：向铁炉堡报告
step
    #requires RatCatching
    .goto Loch Modan,33.94,50.96
    .fp Thelsamar >> 获取塞尔萨玛飞行点
>>与 |cRXP_FRIENDLY_索格拉姆·伯雷森|r 交谈
    .turnin 6387 >>交任务：荣誉学员 << Gnome
.target 索格拉姆·伯雷森
    .accept 6391 >>接任务：飞往铁炉堡 << Gnome
    .fly Ironforge >> 飞往铁炉堡
step << Human
    .goto Ironforge,27.15,8.57
    .trainer >> 学习职业技能
step << skip --logout skip << Human
    #completewith next
    +走向房间后方圣骑士训练师身后的楼梯。走到大约一半的位置，再移到楼梯边缘，直到看起来像悬在空中。退出登录，然后重新登录。
    .link https://www.youtube.com/watch?v=E8b90bzJMSI >> 点击此处查看参考视频
    >>通过退出登录的捷径到达铁炉堡前门
step << Human
    .goto Ironforge,12.24,89.17,120 >> 离开铁炉堡
step << Gnome
    .goto Ironforge,74.65,11.74
>>与|cRXP_FRIENDLY_勘察员塔伯斯·雷矛|r交谈
    .turnin 301 >>交任务 向铁炉堡报告
.target 勘察员塔伯斯·雷矛
    .accept 302 >>接受任务 铁环的火药
step << Gnome
    >>返回大锻炉方向，然后右转进入建筑。
    .goto Ironforge,49.59,28.96,30,0
    .goto Ironforge,51.52,26.32
>>与|cRXP_FRIENDLY_高尼尔·石趾|r交谈
    .turnin 6391 >>交任务 飞往铁炉堡
.target 高尼尔·石趾
    .accept 6388 >>接受任务 格莱斯·瑟登
step << Gnome
    .goto Ironforge,39.55,57.49
.target 参议员巴林·红石
>>与|cRXP_FRIENDLY_参议员巴林·红石|r交谈
    .turnin 291 >>交任务 森内尔的报告
step << Gnome
    .goto Ironforge,55.50,47.74
>>与 |cRXP_FRIENDLY_格莱斯·瑟登|r 交谈
    .turnin 6388 >>交任务：格莱斯·瑟登
.target 格莱斯·瑟登
    .accept 6392 >>接任务：向布洛克回复
    .fly Thelsamar >> 飞往塞尔萨玛
step << Gnome
    >>进入建筑
    .goto Loch Modan,37.16,46.89,20,0
    .goto Loch Modan,37.02,47.81
.target 布洛克·寻石者
>>与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .turnin 6392 >>交任务 向布洛克回复
.target 吉恩·角盔
>>与|cRXP_FRIENDLY_吉恩·角盔|r交谈
    .turnin 302 >>交任务 铁环的火药
step << Gnome
    .hs >> 炉石回卡拉诺斯
step << Gnome
    .goto Dun Morogh,47.50,52.08
    .trainer >> 学习职业技能
step
    #hardcore
    #completewith next
    .goto Dun Morogh,59.43,42.85,150 >> 前往捷径起点
step
    #hardcore
    .goto Dun Morogh,59.5,42.8,40,0
    .goto Dun Morogh,60.4,44.1,40,0
    .goto Dun Morogh,61.1,44.1,40,0
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
    >>打开此链接，在另一块屏幕上跟随视频操作。
    >>使用无需死亡的丹莫罗 -> 湿地捷径
    >>渡海时避开鳄鱼
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >> 点击此处查看参考视频
    .goto Wetlands,12.1,60.3,80 >> 前往米奈希尔港
step
    #softcore
    .goto Dun Morogh,30.3,37.5,50 >> 前往这里
step
    #softcore
    .goto Dun Morogh,30.9,33.1,15 >>向北跑上山
step
    #softcore
    .goto Dun Morogh,32.4,29.1,15 >>继续沿山路上行至此处
step
    #softcore
    .goto Dun Morogh,33.0,27.2,15,0
    .goto Dun Morogh,33.0,25.2,15,0
    .goto Wetlands,11.6,43.4,60,0
    .deathskip >>继续向正北方向直行，跳下去死亡，然后复活。
step
    #softcore
    #completewith next
    .goto Wetlands,12.7,46.7,60 >> 游向岸边
step
    .money <0.08
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto 1437,10.760,56.721
    .vendor >> 如果有 8 银，就向尼尔·奥雷查看青铜管；有货便购买
step
    .money <0.04
    .goto Wetlands,8.1,56.3
    .vendor >> 查看德温是否出售治疗药水，买到只剩 1 银币。
step
    .goto Wetlands,9.5,59.7
    .fp Menethil Harbor >> 获取米奈希尔港飞行点
step
    #era/som
    #label CookingPrep
    >>在此等船，从法术书施放“基础营火”，烹饪先前保留的大块野猪肉。烹饪技能现在至少需 10 点，之后需 50 点，所以将肉全部烹饪掉
    .goto Wetlands,4.7,57.3
    .skill cooking,10 >>将烹饪提升至10点
step
    #era/som
    #label Darkshore1
    .zone Darkshore >>船来了就上去，前往黑海岸。如果烹饪食物已经完成，就开始尽量制造等级5的水
step
    #som
    #phase 3-6
    #label Darkshore1
    .zone Darkshore >>船来了就上去，前往黑海岸。开始尽可能多地制造等级5的水
]])
