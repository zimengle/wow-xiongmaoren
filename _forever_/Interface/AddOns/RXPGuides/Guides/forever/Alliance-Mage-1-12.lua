local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师
#forever
#disabledungeons
<< Human Mage
#name 1-10 Elwynn Forest Mage AoE
#version 1
#group RestedXP Alliance Mage
#defaultfor none Human
#next 10-12 Loch Modan Mage AoE
#displayname 1-10 艾尔文森林（法师 AoE）
step
    #sticky
    #completewith next
    .goto 1429/0,-136.52,-8933.53
    +您选择的是人类指南, 请确保选择与角色起始区域相同的指南 << Gnome
    +注意：你选择了 范围练级 指南。法师 范围练级 升级通常比单体打怪难得多，但升级速度快得多
step
    >>删除你的炉石
    .goto 1429/0,-136.52,-8933.53
.target 维里副队长
>>与|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 783 >> 接任务：身边的危机
step
    .goto 1429/0,-162.62,-8902.59
>>与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 783 >> 交任务：身边的危机
.target 治安官玛克布莱德
    .accept 7 >> 接任务：剿灭狗头人
step
    .goto 1429/0,-136.52,-8933.53
.target 维里副队长
>>与|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 5261 >> 接任务：伊根·派特斯金纳
step
    .goto 1429/0,-68.11,-8874.67
    .vendor >>击杀狼，收集价值 50 铜币的杂物。出售杂物后，再向丹尼尔修士购买 10 瓶水
    .collect 159,10 --Collect Refreshing Spring Water (x10)
step
    .xp 2 >> 刷到2级
step
    .goto 1429/0,-161.82,-8870.05
>>与|cRXP_FRIENDLY_伊根·派特斯金纳|r交谈
    .turnin 5261 >> 交任务：伊根·派特斯金纳
.target 伊根·派特斯金纳
    .accept 33 >> 接任务：林中的群狼
step
    .goto 1429/0,-64.64,-8881.62,40,0
    .goto 1429/0,-68.11,-8809.87,40,0
    .goto 1429/0,-116.70,-8800.61,40,0
    .goto 1429/0,-64.64,-8881.62,40,0
    .goto 1429/0,-68.11,-8809.87,40,0
    .goto 1429/0,-116.70,-8800.61,40,0
    >>击杀该区域的幼狼以获取肉
    .complete 33,1 --Collect Tough Wolf Meat (x8)
step
    .goto 1429/0,-109.76,-8756.63,40,0
    .goto 1429/0,-189.59,-8777.46,40,0
    .goto 1429/0,-109.76,-8756.63,40,0
    .goto 1429/0,-189.59,-8777.46,40,0
    .goto 1429/0,-109.76,-8756.63,40,0
    .goto 1429/0,-189.59,-8777.46,40,0
    >>击杀该区域内的狗头人歹徒
    .complete 7,1 --Kill Kobold Vermin (x10)
step
    .goto 1429/0,-161.82,-8870.05
.target 伊根·派特斯金纳
>>与|cRXP_FRIENDLY_伊根·派特斯金纳|r交谈
    .turnin 33 >> 交任务: 林中的群狼
step
    .goto 1429/0,-116.70,-8900.14
    .vendor >>出售杂物，从[丹尼尔修士]处再买 10 瓶水
step
    .goto 1429/0,-162.62,-8902.59
>>与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 7 >> 交任务：剿灭狗头人
.target 治安官玛克布莱德
    .accept 15 >> 接任务：回音山调查行动
    .accept 3104 >> 接任务：雕文信件
step
    .xp 3 >> 刷到3级
step
    .goto 1429/0,-113.23,-8779.78,40,0
    .goto 1429/0,-81.99,-8684.88,40,0
    .goto 1429/0,-151.41,-8726.54,40,0
    .goto 1429/0,-113.23,-8779.78,40,0
    .goto 1429/0,-81.99,-8684.88,40,0
    .goto 1429/0,-151.41,-8726.54,40,0
    >>击杀狗头人劳工
    .complete 15,1 --Kill Kobold Worker (x10)
step
    .goto 1429/0,-120.17,-8897.82
    .xp 3+1110 >>在返回城镇的路上刷怪至 1110+/1400 经验值
step
    .goto 1429/0,-120.17,-8897.82
    .vendor >>卖掉杂物
step
    .goto 1429/0,-162.62,-8902.59
>>与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 15 >> 交任务：回音山调查行动
.target 治安官玛克布莱德
    .accept 21 >> 接任务：回音山清剿行动
step
    >>上楼
    .goto 1429/0,-175.70,-8881.62,15,0
    .goto 1429/0,-182.65,-8865.42,15,0
    .goto 1429/0,-188.23,-8851.58
.target 凯尔登·布雷门
>>与|cRXP_FRIENDLY_凯尔登·布雷门|r交谈
    .turnin 3104 >> 交任务：雕文信件
    .trainer >> 学习职业技能
step
    .goto 1429/0,-136.52,-8933.53
.target 维里副队长
>>与|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 18 >> 接任务：潜行者兄弟会
step
    .goto 1429/0,-328.42,-9147.80,60,0
    .goto 1429/0,-397.84,-9036.70,60,0
    .goto 1429/0,-363.13,-8909.39,60,0
    .goto 1429/0,-328.42,-9147.80,60,0
    .goto 1429/0,-397.84,-9036.70,60,0
    .goto 1429/0,-363.13,-8909.39,60,0
    >>击杀迪菲亚暴徒，拾取他们的红色粗麻面罩
    .complete 18,1 --Collect Red Burlap Bandana (x12)
step
    .goto 1429/0,-136.52,-8933.53
>>与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 18 >> 交任务：潜行者兄弟会
.target 维里副队长
    .accept 6 >> 接任务：加瑞克·帕德弗特的赏金
    .accept 3903 >> 接任务：米莉·奥斯沃斯
step
    .goto 1429/0,-120.17,-8897.82
    .vendor >>卖掉杂物并修理
step
    .goto 1429/0,-363.13,-8909.39,60,0
    .goto 1429/0,-120.17,-8673.31,60,0
    .goto 1429/0,-213.88,-8564.52,60,0
    .goto 1429/0,-120.17,-8673.31,60,0
    .goto 1429/0,-213.88,-8564.52,60,0
    .goto 1429/0,-120.17,-8673.31,60,0
    .goto 1429/0,-213.88,-8564.52,60,0
    .goto 1429/0,-120.17,-8673.31,60,0
    .goto 1429/0,-213.88,-8564.52,60,0
    >>击杀矿井中的狗头人苦力
    .complete 21,1 --Kill Kobold Laborer (x12)
step
    .xp 5 >> 刷到5级
step
    #era/som
    .goto 1429/0,-224.30,-8846.90
>>与|cRXP_FRIENDLY_米莉·奥斯沃斯|r交谈
    .turnin 3903 >> 交任务：米莉·奥斯沃斯
.target 米莉·奥斯沃斯
    .accept 3904 >> 接任务：米莉的葡萄
step
    #som
    #phase 3-6
    .goto 1429/0,-224.30,-8846.90
.target 米莉·奥斯沃斯
>>与|cRXP_FRIENDLY_米莉·奥斯沃斯|r交谈
    .turnin 3903 >> 交任务：米莉·奥斯沃斯
step
    #era/som
    >>捡田里的葡萄桶
    .goto 1429/0,-356.19,-9082.99
    .complete 3904,1 --Collect Milly's Harvest (x8)
step
    .goto 1429/0,-460.31,-9055.21
    >>击杀加瑞克并拾取他的头颅
    .complete 6,1 --Collect Garrick's Head (x1)
step
    .xp 5+1175 >> 在返回途中刷怪至 1175+/2800 经验值
    .goto 1429/0,-224.30,-8846.90
step
    #era/som
    .goto 1429/0,-224.30,-8846.90
>>与|cRXP_FRIENDLY_米莉·奥斯沃斯|r交谈
    .turnin 3904 >> 交任务 米莉的葡萄
.target 米莉·奥斯沃斯
    .accept 3905 >>接受任务 葡萄出货单
step
    .goto 1429/0,-136.52,-8933.53
.target 维里副队长
>>与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 6 >> 交任务: 加瑞克·帕德弗特的赏金
step
    .goto 1429/0,-162.62,-8902.59
>>与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 21 >> 交任务: 回音山清剿行动
.target 治安官玛克布莱德
    .accept 54 >> 接任务：去闪金镇报到
step
     #era/som
     >>走主楼梯上楼
    .goto 1429/0,-186.12,-8902.45,15,0
    .goto 1429/0,-161.82,-8895.51,15,0
    .goto 1429/0,-181.64,-8902.13
.target 尼尔斯修士
>>与 |cRXP_FRIENDLY_尼尔斯修士|r 交谈
    .turnin 3905 >>交任务 葡萄出货单
step
    .goto 1429/0,-47.28,-9043.64
.target 法尔坎·伊森斯泰德
>>与|cRXP_FRIENDLY_法尔坎·伊森斯泰德|r交谈
    .accept 2158 >> 接任务：休息和放松
step
    #softcore
    #sticky
    #completewith next
    .goto 1429/0,164.44,-9339.91,200 >> 死亡后在灵魂医者处复活，或者跑去闪金镇
step
    .goto 1429/0,88.08,-9464.89
    .vendor >> 卖掉杂物并修理
step
    .goto 1429/0,74.02,-9465.52
>>对话 |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 54 >> 交任务: 去闪金镇报到
.target 治安官杜汉
    .accept 62 >> 接任务：法戈第矿洞
step
    .goto 1429/0,46.43,-9460.26,15,0
    >>进旅店后看左前方一点就能看到
    .goto 1429/0,33.14,-9460.75
.target 威廉·匹斯特
>>与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .accept 60 >> 接任务：狗头人的蜡烛
step
    .goto 1429/0,16.20,-9462.65
.target 旅店老板法雷
>>与|cRXP_FRIENDLY_旅店老板法雷|r交谈
    .turnin 2158 >> 交任务：休息和放松
    .home >> 将你的炉石设置为闪金镇
step
    .xp 6 >> 刷到6级
step
    .goto 1429/0,18.66,-9476.47,12,0
    .goto 1429/0,36.02,-9471.84
    .trainer >> 上楼, 学习职业技能
step
    .goto 1429/0,74.20,-9497.30
.target 雷米
>>与|cRXP_FRIENDLY_雷米|r交谈
    .accept 47 >> 接任务：金砂交易
step
    #sticky
    #completewith BoarMeat1
    >>开始击杀你看到的野猪，收集野猪肉
    .collect 769,4 --Collect Chunk of Boar Meat (x4)
step
    .goto 1429/0,338.47,-9889.69
.target 波尼斯·斯通菲尔德姑妈
>>与|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    .accept 85 >> 接任务：丢失的项链
    .goto 1429/0,332.43,-9894.99--c:Elwynn Forest,34.660,84.482
.target 斯通菲尔德妈妈
>>与|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
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
    .goto 1429/0,38.38,-9923.69
>>与|cRXP_FRIENDLY_比利·马科伦|r交谈
    .turnin 85 >> 交任务: 丢失的项链
.target 比利·马科伦
    .accept 86 >> 接任务: 比利的馅饼
step
    #label BoarMeat1
    .goto 1429/0,36.02,-10013.45
.target 梅贝尔·马科伦
>>与|cRXP_FRIENDLY_梅贝尔·马科伦|r交谈
    .accept 106 >> 接任务：年轻的恋人
step
    .goto 1429/0,63.78,-10008.82
    .vendor >>出售杂物，并尽可能多买些牛奶
step
    #sticky
    #completewith next
    >>击杀你见到的野猪以获取野猪肉
    .collect 769,4 --Collect Chunk of Boar Meat (x4)
step
    .goto 1429/0,499.72,-9930.05--c:Elwynn Forest,29.840,85.997
>>与|cRXP_FRIENDLY_托米·乔·斯通菲尔德|r交谈
    .turnin 106 >> 交任务：年轻的恋人
.target 托米·乔·斯通菲尔德
    .accept 111 >> 接任务：托米的祖母
step
    .goto 1429/0,407.40,-9918.55
    >>收集剩余的野猪肉，完成任务要求
    .complete 86,1 --Collect Chunk of Boar Meat (x4)
step
    .goto 1429/0,338.47,-9889.69
>>与|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    .turnin 86 >> 交任务：比利的馅饼
.target 波尼斯·斯通菲尔德姑妈
    .accept 84 >> 接任务：比利的馅饼
step
    .goto 1429,34.945,83.855
>>与|cRXP_FRIENDLY_米莱德·斯通菲尔德|r交谈
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
    .goto 1429/0,38.38,-9923.69
>>与|cRXP_FRIENDLY_比利·马科伦|r交谈
    .turnin 84 >> 交任务：比利的馅饼
.target 比利·马科伦
    .accept 87 >> 接任务：金牙
step
    >>进入矿井
    .goto 1429/0,129.73,-9844.49
    .complete 62,1 --Scout Through the Fargodeep Mine
step
    >>击杀金牙，拾取波尼斯的项链
    .goto 1429/0,88.08,-9744.96--??
    .complete 87,1 --Collect Bernice's Necklace  (x1)
step
    .xp 7+1600 >>刷怪至 1600+/4500 经验值
step
#hidewindow
    #requires KoboldCandles
step
    #label Goldtooth
    #requires GoldDust
    .goto 1429/0,338.47,-9889.69
.target 波尼斯·斯通菲尔德姑妈
>>与|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    .turnin 87 >> 交任务：金牙
step
    >>一路刷些怪回闪金镇
    .xp 7+2690 >>刷怪至 2690+/4500 经验值
    .goto 1429/0,74.20,-9497.30
step
    .goto 1429/0,74.20,-9497.30
>>与|cRXP_FRIENDLY_雷米|r交谈
    .turnin 47 >> 交任务：金砂交易
.target 雷米
    .accept 40 >> 接任务：鱼人的威胁
step
    .goto 1429/0,88.08,-9464.89
    .vendor >>卖掉杂物并修理
step
    .goto 1429/0,74.02,-9465.52
>>对话 |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 40 >> 交任务：鱼人的威胁
.target 治安官杜汉
    .accept 35 >> 接任务：卫兵托马斯
    .turnin 62 >> 交任务：法戈第矿洞
    .accept 76 >> 接任务：玉石矿洞
step
    .goto 1429/0,88.08,-9464.89
    .vendor >> 卖掉杂物并修理
step
    .goto 1429/0,33.14,-9460.75
>>与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .turnin 60 >> 交任务：狗头人的蜡烛
.target 威廉·匹斯特
    .accept 61 >> 接任务：送往暴风城的货物
    .turnin 107 >> 交任务：给威廉·匹斯特的信
    .accept 112 >> 接任务：收集海藻
step
    .xp 8 >> 刷到8级
step
    .money <0.1250
    .goto 1429/0,8.25,-9464.89
    .vendor >>向布洛葛·哈姆菲斯特购买一个6格背包
step
    .goto 1429/0,18.66,-9476.47,12,0
    .goto 1429/0,36.02,-9471.84
    .trainer >> 上楼, 学习职业技能
step
    .goto 1429/0,16.20,-9462.65
    .vendor >>将 5 级饮料补足至 40 瓶
step
    >>向东一路击杀鱼人并拾取水晶藻叶；如果数量还不够，就去岛上杀怪
    .goto 1429/0,-116.70,-9404.71,60,0
    .goto 1429/0,-248.59,-9434.80,50,0
    .goto 1429/0,-463.78,-9393.14,50,0
    .goto 1429/0,-422.13,-9481.10,50,0
    .goto 1429/0,-331.89,-9485.73,50,0
    .complete 112,1 --Collect Crystal Kelp Frond (x4)
step
    >>进矿井, 一直走中间那条路
    .goto 1429/0,-609.56,-9189.46,60,0
    .goto 1429/0,-560.97,-9101.50
    .complete 76,1 --Scout through the Jasperlode Mine
step
    .goto 1429/0,-1032.06,-9610.23
>>与|cRXP_FRIENDLY_卫兵托马斯|r交谈
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
    .goto 1429/0,-987.88,-9335.28
    .turnin 37 >> 交任务：失踪的卫兵
    .accept 45 >> 接任务：罗尔夫的下落
step
    .goto 1429/0,-1289.22,-9469.80
.target 管理员莱琳
>>与|cRXP_FRIENDLY_管理员莱琳|r交谈
    .accept 5545 >> 接任务：木材危机
step
    .goto 1429/0,-1355.79,-9469.52
    .vendor >> 卖掉杂物并修理
step
    #sticky
    #completewith Bundles
    >>留意树根处的木柴捆
    .collect 13872,8 --Collect Bundle of Wood (x8)
step
    #label Bundles
    .goto 1429/0,-1234.31,-9224.18,60 >> 往守卫的尸体那边走
step
    .goto 1429/0,-1234.31,-9224.18
    >> 清理尸体周围的敌人。拉出小屋前的2只怪物，退开后将一只变羊，击杀另一只，再击杀被变羊的那只。最后搜查地上的尸体
    >> 小心, 这个任务可能有点难
    .turnin 45 >> 交任务: 罗尔夫的下落
    .accept 71 >> 接任务: 回复托马斯
step
    .goto 1429/0,-1130.18,-9383.88,40,0
    .goto 1429/0,-1369.67,-9314.45,40,0
    .goto 1429/0,-1130.18,-9383.88,40,0
    .goto 1429/0,-1369.67,-9314.45,40,0
    .goto 1429/0,-1130.18,-9383.88,40,0
    .goto 1429/0,-1369.67,-9314.45,40,0
    >>返程时拾取剩余的木料捆
    .collect 13872,8 --Collect Bundle of Wood (x8)
step
    #label Bundles2
    .goto 1429/0,-1289.22,-9469.80
.target 管理员莱琳
>>与|cRXP_FRIENDLY_管理员莱琳|r交谈
    .turnin 5545 >> 交任务：木材危机
step
    #label Prowlers
    .xp 9 >> 刷到9级
step
    #label Bears
    .goto 1429/0,-1222.40,-9531.76
.target 萨拉·迪博雷恩
>>与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .accept 83 >> 接任务：红色亚麻布
step
    .goto 1429/0,-1126.71,-9689.41,40,0
    .goto 1429/0,-1230.84,-9876.89,40,0
    .goto 1429/0,-1310.67,-9717.18,40,0
    .goto 1429/0,-1126.71,-9689.41,40,0
    .goto 1429/0,-1230.84,-9876.89,40,0
    .goto 1429/0,-1310.67,-9717.18,40,0
    >>击杀最后的怪物以完成"保卫边境"
    .complete 52,1 --Kill Prowler (x8)
    .complete 52,2 --Kill Young Forest Bear (x5)
step
    .goto 1429/0,-1032.06,-9610.23
>>与|cRXP_FRIENDLY_卫兵托马斯|r交谈
    .turnin 52 >> 交任务：保卫边境
    .turnin 71 >> 交任务：回复托马斯
.target 卫兵托马斯
    .accept 39 >> 接任务：托马斯的报告
    .accept 109 >>接任务：向格里安·斯托曼报到
step
    #sticky
    #completewith Princess
    >>留意迪菲亚掉落的"西部荒野地契"(幸运掉落)
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >> 接任务：法布隆的地契
step
    .goto 1429/0,-911.52,-9735.70,60,0
    .goto 1429/0,-828.22,-9733.39,60,0
    .goto 1429/0,-831.69,-9823.65,60,0
    .goto 1429/0,-921.93,-9812.08,60,0
    .goto 1429/0,-911.52,-9735.70,60,0
    .goto 1429/0,-828.22,-9733.39,60,0
    .goto 1429/0,-831.69,-9823.65,60,0
    .goto 1429/0,-921.93,-9812.08,60,0
    .goto 1429/0,-911.52,-9735.70,60,0
    .goto 1429/0,-828.22,-9733.39,60,0
    .goto 1429/0,-831.69,-9823.65,60,0
    .goto 1429/0,-921.93,-9812.08,60,0
    >>绕着农场击杀迪菲亚成员，拾取他们的红色亚麻面罩
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .isOnQuest 83
step
    #label Princess
    .goto 1429/0,-873.34,-9772.73
    >>击杀公主. 如有需要, 可使用之前获得的次级治疗药水. 击杀后拾取她的项圈
    >>也可在农场边缘的栅栏间来回跳跃，击杀[公主]和她的守卫
    .complete 88,1 --Collect Brass Collar (x1)
--N link
step
    #softcore
    #sticky
    #completewith next
    .goto 1429/0,-1366.20,-9552.85,120 >>如果血量低，就死亡后在灵魂医者处复活；否则直接跑回去交任务
step
    .goto 1429/0,-1223.90,-9534.33
.target 萨拉·迪博雷恩
>>与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .turnin 83 >> 交任务：红色亚麻布
    .isQuestComplete 83
step
    .goto 1433/0,-1741.68,-9644.29
    .zone Redridge Mountains >>在前往赤脊山的路上刷怪升级
step
    #softcore
    #sticky
    #completewith next
    +让这里的怪物击杀你
    .goto 1433/0,-1813.97,-9710.17
step
    #softcore
    >>在灵魂医者处复活
    .goto 1433/0,-2022.37,-9394.52,100 >>在灵魂医者处复活
step
    #softcore
    .goto 1433/0,-2235.11,-9435.06
    .fp Redridge Mountains >> 获取赤脊山飞行点
step
    #hardcore
    >>跑向飞行点。途中务必小心，避免引到怪物或被击杀。尽量沿道路前进，并留意周围的怪物
    .goto 1433/0,-2235.11,-9435.06
    .fp Redridge Mountains >> 获取赤脊山飞行点
step
    .hs >> 炉石回闪金镇
step
    .goto 1429/0,33.14,-9460.75
    >>不用等候他的剧情演出
.target 威廉·匹斯特
>>与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .turnin 112 >> 交任务：收集海藻
step
    .goto 1429/0,70.72,-9462.58
>>对话 |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 39 >> 交任务：托马斯的报告
    .turnin 76 >> 交任务：玉石矿洞
.target 治安官杜汉
    .accept 239 >> 接任务：西泉要塞
step
    .goto 1429/0,87.87,-9456.65
.target 铁匠阿古斯
>>与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
-->>Talk to |cRXP_FRIENDLY_Smith Argus|r
    .accept 1097 >> 接任务：艾尔默的任务
step
    .goto 1429/0,88.08,-9464.89
    .vendor >>卖掉杂物并修理
step
    .goto 1429/0,33.14,-9460.75
.target 威廉·匹斯特
>>与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .accept 114 >> 接任务：梅贝尔的隐形水
step
    >>跑出旅店，向南前进
    .goto 1429/0,36.02,-10013.45
.target 梅贝尔·马科伦
>>与|cRXP_FRIENDLY_梅贝尔·马科伦|r交谈
    .turnin 114 >> 交任务：梅贝尔的隐形水
step
    .goto 1429/0,332.43,-9894.99--c:Elwynn Forest,34.660,84.482
.target 斯通菲尔德妈妈
>>与|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .turnin 88 >> 交任务：公主必须死！
step
    .goto 1429/0,695.47,-9663.95
.target 瑞尼尔副队长
>>对话 |cRXP_FRIENDLY_瑞尼尔副队长|r
    .turnin 239 >> 交任务：西泉要塞
step
    .isOnQuest 184
    .goto 1436/0,916.67,-9852.67
.target 农夫法布隆
>>与|cRXP_FRIENDLY_农夫法布隆|r交谈
    .turnin 184 >> 交任务：法布隆的地契
step
    .goto 1436/0,919.54,-9853.04
.target 弗娜·法布隆
>>与|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .accept 36 >> 接任务：杂味炖肉
step
    .goto 1436/0,1042.11,-10112.11
.target 萨尔玛·萨丁
>>与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .turnin 36 >> 交任务：杂味炖肉
step
    #softcore
    #sticky
    #completewith next
    .goto 1436/0,1207.17,-10552.67,150 >> 死亡后在灵魂医者处复活，或者跑去哨兵岭
step
    .goto 1436/0,1045.22,-10508.800
.target 格里安·斯托曼
>>与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 109 >> 交任务：向格里安·斯托曼报到
step
    .goto 1436/0,1021.60,-10500.61
    .vendor >>卖掉杂物
.target 军需官刘易斯
>>与|cRXP_FRIENDLY_军需官刘易斯|r交谈
    .accept 6181 >> 接任务：快递消息
step
    #phase 3-6
    .goto 1436/0,1042.11,-10112.11
    .xp 11+3750 >> 刷怪至 3750+/8800 经验值
step
    .goto 1436/0,1035.67,-10627.33
    .fp Sentinel Hill >> 获取哨兵岭飞行点
>>与|cRXP_FRIENDLY_索尔|r交谈
    .turnin 6181 >> 交任务：快递消息
.target 索尔
    .accept 6281 >> 接任务：赶赴暴风城
    .fly Stormwind >> 飞往暴风城
step
    .goto 1453/0,625.49,-8857.89
    >>选择火箭。火箭伤害很高，还能用来将怪物分开引出
.target 摩根·匹斯特
>>与|cRXP_FRIENDLY_摩根·匹斯特|r交谈
    .turnin 61 >> 交任务：送往暴风城的货物
step
    #era/som
    .goto 1453/0,613.39,-8796.05
    .train 201 >>学习单手剑
step
    .goto 1453/0,382.18,-8701.93
.target 奥斯瑞克·斯图恩
>>与|cRXP_FRIENDLY_奥斯瑞克·斯图恩|r交谈
    .turnin 6281 >> 交任务：赶赴暴风城
    >>出售杂物并修理装备
step
    #completewith next
    .goto 1453/0,684.64,-8387.31
.target 格瑞曼德·艾尔默
>>与|cRXP_FRIENDLY_格瑞曼德·艾尔默|r交谈
    .turnin 1097 >> 交任务: 艾尔默的任务
step
    .goto 1453/0,684.64,-8387.31
.target 格瑞曼德·艾尔默
>>与|cRXP_FRIENDLY_格瑞曼德·艾尔默|r交谈
    .accept 353 >> 接任务：雷矛的包裹
step
    #sticky
    #completewith next
    .goto 1453/0,521.98,-8353.25,20 >>进入矿道地铁
step
    >>电车到站后上车，到达另一侧后下车
.target 蒙提
>>与|cRXP_FRIENDLY_蒙提|r交谈
    .accept 6661 >> 接任务：捕捉矿道老鼠
step
    >>对周围散落的老鼠使用笛子
    .complete 6661,1 --Rats Captured (x5)
    .use 17117
    .mob 矿道老鼠
step
.target 蒙提
>>与|cRXP_FRIENDLY_蒙提|r交谈
    .turnin 6661 >> 交任务：捕捉矿道老鼠
step
    .goto 1455/0,-1322.37,-4838.32,30 >>进入铁炉堡
step
    .goto 1455/0,-1152.40,-4821.13
    .fp Ironforge >> 获取铁炉堡飞行点
step
    #phase 3-6
    .goto 1455/0,-928.40,-4614.46
     .trainer >> 学习职业技能
step
    #sticky
    #completewith next
    .goto 1426/0,-832.79,-5022.97,100 >>离开铁炉堡
step
    .goto 1426/0,-1157.84,-5604.12,50,0
    .goto 1426/0,-1305.59,-5512.18
.target 鲁德拉·冻石
>>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .accept 314 >> 接任务：保护牲畜
step
    #sticky
    #completewith next
    .goto 1426/0,-1266.19,-5528.60,14,0
    .goto 1426/0,-1261.27,-5499.05,12 >> 沿着这段山路跑上去
step
    >>击杀瓦加什，拾取瓦加什的牙齿
    >>把它引到牧场南边的守卫处，确保对它造成 51% 以上的伤害
    >>小心, 这个任务可能有点难
    .goto 1426/0,-1280.97,-5390.70
    .goto 1426/0,-1289.83,-5669.780,0
    .complete 314,1 --Collect Fang of Vagash (1)
--N add video tutorial
step
    .goto 1426/0,-1305.59,-5512.18
.target 鲁德拉·冻石
>>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .turnin 314 >> 交任务：保护牲畜
step
    >>路上顺手刷一点
    .goto 1426/0,-1576.47,-5673.07
    .vendor >>出售杂物，再购买食物和水
step
    .goto 1426/0,-1581.39,-5715.75
.target 参议员梅尔·圣石
>>与|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .accept 433 >> 接任务：公众之仆
step
    .goto 1426/0,-1600.30,-5726.590
.target 工头乔尼·石眉
>>与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 432 >> 接任务：该死的石腭怪！
step
    .goto 1426/0,-1674.97,-5735.45,30,0
    .goto 1426/0,-1684.82,-5627.10,30,0
    .goto 1426/0,-1738.99,-5541.73,30,0
    .goto 1426/0,-1788.24,-5620.53,30,0
    .goto 1426/0,-1674.97,-5735.45,30,0
    .goto 1426/0,-1684.82,-5627.10,30,0
    .goto 1426/0,-1738.99,-5541.73,30,0
    .goto 1426/0,-1788.24,-5620.53,30,0
    >>击杀洞穴中的穴居人
    .complete 432,1 --Kill Rockjaw Skullthumper (6)
    .complete 433,1 --Kill Rockjaw Bonesnapper (10)
step
    #era/som
    .xp 10+6350 >>刷怪至 6350+/7600 经验值
step
    .goto 1426/0,-1600.30,-5726.590
.target 工头乔尼·石眉
>>与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .turnin 432 >> 交任务：该死的石腭怪！
step
    #completewith next
    .goto 1426/0,-1591.24,-5712.47
    .vendor >> 卖掉杂物并修理
step
    .goto 1426/0,-1581.39,-5715.75
.target 参议员梅尔·圣石
>>与|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .turnin 433 >> 交任务：公众之仆
step
    #era/som--xpgate
    .xp 11
step
    .goto 1426/0,-1576.47,-5673.07
    .vendor >>出售杂物，从[卡杉·莫格什]处购买 30 瓶 5 级饮料
    .train 2550 >>向厨师格瑞姆学习烹饪，后续需要它来接取2个额外任务
step
    .goto 1426/0,-2329.60,-5163.76
.target 驾驶员塞克·锤足
>>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .accept 419 >> 接任务：失踪的驾驶员
step
    .goto 1426/0,-2123.14,-5065.65
    .turnin 419 >> 交任务：失踪的驾驶员
    .accept 417 >> 接任务：驾驶员的复仇
step
    >>击杀癞爪，拾取它的爪子
    .goto 1426/0,-2137.92,-5072.22
    .complete 417,1 --Collect Mangy Claw (x1)
step
    .goto 1426/0,-2329.60,-5163.76
.target 驾驶员塞克·锤足
>>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .turnin 417 >> 交任务：驾驶员的复仇
step
    .goto 1426/0,-2354.62,-4898.20,25 >>穿过隧道去洛克莫丹
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师
#forever
#disabledungeons
<< Gnome Mage
#name 1-10 Dun Morogh Mage AoE
#version 1
#group RestedXP Alliance Mage
#defaultfor none Gnome
#next 10-12 Loch Modan Mage AoE
#displayname 1-10 丹莫罗（法师 AoE）
step
    #era/som
    #sticky
    #completewith next
    .goto 1426/0,328.18,-6214.85
    +你选择了侏儒和矮人专用指南。应选择你所属种族的出生区域指南 << Human
    +注意，你选择了范围练级指南。范围练级 玩法通常比单体法师难得多，但练级速度也快得多
step
    #phase 3-6
    #sticky
    #completewith next
    .goto 1426/0,328.18,-6214.85
    +你选择了侏儒和矮人专用指南。应选择你所属种族的出生区域指南 << Human
    +注意，你选择了范围练级指南。范围练级 玩法通常比单体法师难得多，而最近任务经验提高了 100%，因此范围练级现在也更慢
step
    >>摧毁炉石
    .goto 1426/0,328.18,-6214.85
.target 斯登·粗臂
>>与 |cRXP_FRIENDLY_斯登·粗臂|r 交谈
    .accept 179 >> 接任务：矮人的交易
step
    >>击杀狼，拾取硬狼肉
    .goto 1426/0,388.61,-6333.02
    .complete 179,1 --Collect Tough Wolf Meat (x8)
step
    .xp 2 >> 刷怪升到 2 级
step
    .goto 1426/0,324.58,-6224.67
    >>出售杂物，购买 15 瓶清凉的泉水。钱不够就多杀些狼
    .collect 159,15 --Collect Refreshing Spring Water (x15)
step
    .goto 1426/0,328.18,-6214.85
>>与 |cRXP_FRIENDLY_斯登·粗臂|r 交谈
    .turnin 179 >> 交任务：矮人的交易
.target 斯登·粗臂
    .accept 233 >> 接任务：寒脊山谷的送信任务
    .accept 3114 >> 接任务：雕文备忘录
step
    .goto 1426/0,339.36,-6214.82
.target 巴尔林·霜锤
>>与 |cRXP_FRIENDLY_巴尔林·霜锤|r 交谈
    .accept 170 >> 接任务：新的威胁
step
    #sticky
    #completewith Rockjaw
    >>击杀沿途看到的普通石腭穴居人
    .complete 170,1 --Kill Rockjaw Trogg (x6)
step
    .goto 1426/0,477.26,-6264.07,30,0
    .goto 1426/0,565.91,-6244.37,30,0
    .goto 1426/0,477.26,-6264.07,30,0
    .goto 1426/0,565.91,-6244.37,30,0
    >>击杀壮实的石腭怪
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
step
    .goto 1426/0,688.98,-6222.47
>>与 |cRXP_FRIENDLY_塔林·锐眼|r 交谈
    .turnin 233 >> 交任务：寒脊山谷的送信任务
.target 塔林·锐眼
    .accept 183 >> 接任务：猎杀野猪
    .accept 234 >> 接任务：寒脊山谷的送信任务
step
    .goto 1426/0,708.73,-6257.50,40,0
    .goto 1426/0,792.46,-6221.38,40,0
    .goto 1426/0,762.91,-6142.58,40,0
    .goto 1426/0,679.18,-6162.28,40,0
    .goto 1426/0,708.73,-6257.50,40,0
    .goto 1426/0,792.46,-6221.38,40,0
    .goto 1426/0,762.91,-6142.58,40,0
    .goto 1426/0,679.18,-6162.28,40,0
    >>击杀附近的野猪
    .complete 183,1 --Kill Small Crag Boar (x12)
step
    .goto 1426/0,688.98,-6222.47
.target 塔林·锐眼
>>与 |cRXP_FRIENDLY_塔林·锐眼|r 交谈
    .turnin 183 >> 交任务：猎杀野猪
step
    .xp 3+860 >> 刷怪至经验值达到 860+/1400
    .goto 1426/0,669.33,-6339.58,40,0
    .goto 1426/0,610.23,-6257.50,40,0
    .goto 1426/0,437.86,-6382.27,40,0
    .goto 1426/0,669.33,-6339.58,40,0
    .goto 1426/0,610.23,-6257.50,40,0
    .goto 1426/0,437.86,-6382.27,40,0
step
    #label Rockjaw
    .goto 1426/0,567.09,-6362.99
>>与 |cRXP_FRIENDLY_格瑞林·白须|r 交谈
    .turnin 234 >> 交任务：寒脊山谷的送信任务
.target 格瑞林·白须
    .accept 182 >> 接任务：巨魔洞穴
step
    .goto 1426/0,570.83,-6372.42
.target 诺里斯·激流
>>与 |cRXP_FRIENDLY_诺里斯·激流|r 交谈
    .accept 3364 >> 接任务：热酒快递
    >> 接取后会开始 5 分钟倒计时。不用急，跟着指南走即可
step
    .goto 1426/0,388.61,-6421.67
    >>如果穴居人还没杀够，就上到这里继续击杀
    .complete 170,1 --Kill Rockjaw Trogg (x6)
step
    #sticky
    #completewith Scalding1
    >>如果超时导致任务失败，就返回重新接取
    .goto 1426/0,570.83,-6372.42,0
.target 诺里斯·激流
>>与 |cRXP_FRIENDLY_诺里斯·激流|r 交谈
    .accept 3364 >> 接任务：热酒快递
    .goto 1426/0,383.68,-6057.22
.target 德南·弗卡特
>>与 |cRXP_FRIENDLY_德南·弗卡特|r 交谈
    .turnin 3364 >> 交任务：热酒快递
step
    #label Scalding1
    .goto 1426/0,383.68,-6057.22
>>与 |cRXP_FRIENDLY_德南·弗卡特|r 交谈
    .turnin 3364 >> 交任务：热酒快递
.target 德南·弗卡特
    .accept 3365 >> 接任务：归还酒杯
    .vendor >> 出售杂物
step
    .goto 1426/0,388.17,-6056.10
.target 玛瑞克·斯托纳尔
>>与 |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r 交谈
    .turnin 3114 >> 交任务：雕文备忘录
    .trainer >> 学习职业技能
step
    >>跑回地堡外
    .goto 1426/0,339.36,-6214.82
.target 巴尔林·霜锤
>>与 |cRXP_FRIENDLY_巴尔林·霜锤|r 交谈
    .turnin 170 >> 交任务：新的威胁
step
    .goto 1426/0,324.58,-6224.67
    .vendor >>出售杂物，购买 10 瓶清凉的泉水
    .collect 159,10 --Collect Refreshing Spring Water (x10)
step
    .goto 1426/0,506.81,-6477.48,30,0
    .goto 1426/0,684.11,-6480.77,30,0
    .goto 1426/0,772.76,-6362.57,30,0
    .goto 1426/0,684.11,-6480.77,30,0
    .goto 1426/0,772.76,-6362.57,30,0
    .goto 1426/0,684.11,-6480.77,30,0
    .goto 1426/0,772.76,-6362.57,30,0
    >>击杀霜鬃巨魔幼崽
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
step
    #sticky
    #label Mug
    .goto 1426/0,570.83,-6372.42
.target 诺里斯·激流
>>与 |cRXP_FRIENDLY_诺里斯·激流|r 交谈
    .turnin 3365 >> 交任务：归还酒杯
step
    .goto 1426/0,567.09,-6362.99
>>与 |cRXP_FRIENDLY_格瑞林·白须|r 交谈
    .turnin 182 >> 交任务：巨魔洞穴
.target 格瑞林·白须
    .accept 218 >> 接任务：被窃取的日记
step
    #requires Mug
    .goto 1426/0,482.18,-6500.47,30,0
    .goto 1426/0,373.83,-6470.92,15,0
    .goto 1426/0,295.03,-6513.60
    >>进入巨魔洞穴，击杀冷酷的格瑞克尼尔，拾取格瑞林·白须的日记
    .complete 218,1 --Collect Grelin Whitebeard's Journal (x1)
step
    >>边刷怪边返回这里
    .goto 1426/0,565.91,-6365.85
>>与 |cRXP_FRIENDLY_格瑞林·白须|r 交谈
    .turnin 218 >> 交任务：被窃取的日记
.target 格瑞林·白须
    .accept 282 >> 接任务：森内尔的观察站
step
    >> 边刷怪边前往这里
    .goto 1426/0,153.00,-6235.86
>>与 |cRXP_FRIENDLY_巡山人萨鲁斯|r 交谈
    .turnin 282 >> 交任务：森内尔的观察站
.target 巡山人萨鲁斯
    .accept 420 >> 接任务：森内尔的观察站
step
    .goto 1426/0,132.51,-6247.65
.target 汉兹·跳链
>>与 |cRXP_FRIENDLY_汉兹·跳链|r 交谈
    .accept 2160 >> 接任务：塔诺克的补给品
step
    .goto 1426/0,122.66,-6227.95,20,0
    .goto 1426/0,43.86,-6044.08,20 >>穿过隧道
step
    #sticky
    #completewith BoarMeat44
    >> 击杀野猪，收集 4 块大块野猪肉，留待稍后使用
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
step
    #sticky
    #completewith Ribs
    >> 击杀野猪，收集 6 块峭壁野猪肋排，留待稍后使用
    .collect 2886,6 --Collect Crag Boar Rib (x6)
step
    >>向东北前往卡拉诺斯，沿途击杀野猪
    .goto 1426/0,9.38,-5942.30,45,0
    .goto 1426/0,-54.64,-5863.50,45,0
    .goto 1426/0,-359.99,-5705.90
    .xp 5+2415 >> 刷怪至经验值达到 2415/+2800
step
    #softcore
    .goto 1426/0,-512.67,-5686.2,120 >> 死亡后在灵魂医者处复活，或跑去卡拉诺斯。确保当前子区域不是寒脊山小径
step
    .goto 1426/0,-499.17,-5644.37
.target 森内尔·白须
>>与 |cRXP_FRIENDLY_森内尔·白须|r 交谈
    .turnin 420 >> 交任务：森内尔的观察站
step
    #completewith next
    .goto 1426/0,-497.89,-5633.67
    .vendor >>出售杂物
step
    .goto 1426/0,-502.82,-5597.55
.target 拉格纳·雷酒
>>与 |cRXP_FRIENDLY_拉格纳·雷酒|r 交谈
    .accept 384 >> 接任务：啤酒烤猪排
step
    .goto 1426/0,-576.69,-5748.58
    .xp 6 >> 刷怪升到 6 级
step
    .goto 1426/0,-523.35,-5590.82
.target 塔诺克·霜锤
>>与 |cRXP_FRIENDLY_塔诺克·霜锤|r 交谈
    .turnin 2160 >> 交任务：塔诺克的补给品
step
    >>上楼
    .goto 1426/0,-537.29,-5587.70
    .trainer >> 学习职业技能
step
    .goto 1426/0,-532.37,-5600.83
    .home >> 将炉石绑定在雷酒酿造厂
    .vendor >> 在资金允许范围内，尽量多买些 5 级饮料
step
    .goto 1426/0,-464.45,-5573.78
.target 萨雷克·黑石
>>与 |cRXP_FRIENDLY_萨雷克·黑石|r 交谈
    .accept 400 >> 接任务：贝尔丁的工具
step
    .goto 1426/0,-632.15,-5466.540
    >>沿途不要杀熊
.target 驾驶员贝隆·风箱
>>与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 交谈
    .accept 317 >> 接任务：贝尔丁的补给
step
    .goto 1426/0,-641.80,-5473.18
.target 驾驶员迪恩·石轮
>>与 |cRXP_FRIENDLY_驾驶员迪恩·石轮|r 交谈
    .accept 313 >> 接任务：灰色洞穴
step
    .goto 1426/0,-680.12,-5489.20
.target 贝尔丁·钢架
>>与 |cRXP_FRIENDLY_贝尔丁·钢架|r 交谈
    .turnin 400 >> 交任务：贝尔丁的工具
step
    #label BoarMeat44
    .goto 1426/0,-664.55,-5499.710
.target 罗斯洛·鲁治
>>与 |cRXP_FRIENDLY_罗斯洛·鲁治|r 交谈
    .accept 5541 >> 接任务：海格纳的弹药
step
    .goto 1426/0,-758.92,-5522.03,40,0
    .goto 1426/0,-734.29,-5646.80,40,0
    .goto 1426/0,-665.34,-5646.80,40,0
    .goto 1426/0,-655.49,-5548.30,40,0
    .goto 1426/0,-561.92,-5502.33,40,0
    .goto 1426/0,-571.77,-5416.97,40,0
    .goto 1426/0,-340.29,-5600.83,40,0
    .goto 1426/0,-758.92,-5522.03,40,0
    .goto 1426/0,-734.29,-5646.80,40,0
    .goto 1426/0,-665.34,-5646.80,40,0
    .goto 1426/0,-655.49,-5548.30,40,0
    .goto 1426/0,-561.92,-5502.33,40,0
    .goto 1426/0,-571.77,-5416.97,40,0
    .goto 1426/0,-340.29,-5600.83,40,0
    .goto 1426/0,-758.92,-5522.03,40,0
    .goto 1426/0,-734.29,-5646.80,40,0
    .goto 1426/0,-665.34,-5646.80,40,0
    .goto 1426/0,-655.49,-5548.30,40,0
    .goto 1426/0,-561.92,-5502.33,40,0
    .goto 1426/0,-571.77,-5416.97,40,0
    .goto 1426/0,-340.29,-5600.83,40,0
    .goto 1426/0,-758.92,-5522.03,40,0
    .goto 1426/0,-734.29,-5646.80,40,0
    .goto 1426/0,-665.34,-5646.80,40,0
    .goto 1426/0,-655.49,-5548.30,40,0
    .goto 1426/0,-561.92,-5502.33,40,0
    .goto 1426/0,-571.77,-5416.97,40,0
    .goto 1426/0,-340.29,-5600.83,40,0
    >>收集“贝尔丁的补给”所需物品
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .complete 317,2 --Collect Thick Bear Fur (x2)
step
    .goto 1426/0,-632.15,-5466.540
>>与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 交谈
    .turnin 317 >> 交任务：贝尔丁的补给
.target 驾驶员贝隆·风箱
    .accept 318 >> 接任务：艾沃沙酒
step
    >>返回旅店
    .goto 1426/0,-507.74,-5587.70,20,0
    .goto 1426/0,-532.37,-5600.83
    .vendor >> 在资金允许范围内，尽量多买些 5 级饮料
    >>可以在旅店外买一把剥皮小刀。在拿到带属性加成的武器之前，它比法杖更好
step
    .goto 1426/0,-291.04,-5676.35,40,0
    .goto 1426/0,-286.12,-5590.98,40,0
    .goto 1426/0,-217.17,-5499.05,40,0
    .goto 1426/0,-291.04,-5676.35,40,0
    .goto 1426/0,-286.12,-5590.98,40,0
    .goto 1426/0,-217.17,-5499.05,40,0
    .goto 1426/0,-291.04,-5676.35,40,0
    .goto 1426/0,-286.12,-5590.98,40,0
    .goto 1426/0,-217.17,-5499.05,40,0
    .goto 1426/0,-291.04,-5676.35,40,0
    .goto 1426/0,-286.12,-5590.98,40,0
    .goto 1426/0,-217.17,-5499.05,40,0
    >> 进入洞穴，击杀雪怪，拾取雪怪的鬃毛
    .complete 313,1 --Collect Wendigo Mane (x8)
step
    >>拾取箱子
    .goto 1426/0,-369.84,-5745.30
    .complete 5541,1 --Collect Rumbleshot's Ammo (x1)
step
    #label BearFur
    .goto 1426/0,-197.47,-5932.45,30,0
    .goto 1426/0,-201.51,-6015.520
.target 海格纳·重枪
>>与 |cRXP_FRIENDLY_海格纳·重枪|r 交谈
    .turnin 5541 >> 交任务：海格纳的弹药
    .vendor >> 出售杂物并修理装备
step
    .xp 7 >> 刷怪升到 7 级
step
    >>沿途刷些怪
    .goto 1426/0,68.48,-5728.88,50,0
    .goto 1426/0,29.08,-5584.42,50,0
    .goto 1426/0,98.03,-5574.57
.target 图德拉·马克格拉恩
>>与 |cRXP_FRIENDLY_图德拉·马克格拉恩|r 交谈
    .accept 312 >> 接任务：马克格拉恩的干肉
step
    .goto 1426/0,299.96,-5387.42
    .vendor >> 出售杂物，将 5 级饮料补足到 20 瓶
step
    #sticky
    #label Evershine
    .goto 1426/0,314.73,-5380.85
>>与 |cRXP_FRIENDLY_雷杰德·麦酒|r 交谈
    .turnin 318 >> 交任务：艾沃沙酒
.target 雷杰德·麦酒
    .accept 319 >> 接任务：艾沃沙酒
    .accept 315 >> 接任务：完美烈酒
step
    .goto 1426/0,315.42,-5372.02
.target 马莱斯·麦酒
>>与 |cRXP_FRIENDLY_马莱斯·麦酒|r 交谈
    .accept 310 >> 接任务：针锋相对
step
    #label Ribs
    #requires Evershine
    .goto 1426/0,250.71,-5154.30,60,0
    .goto 1426/0,408.31,-5187.13,60,0
    .goto 1426/0,388.61,-5311.90,60,0
    .goto 1426/0,531.43,-5426.82,60,0
    .goto 1426/0,531.43,-5426.82,60,0
    .goto 1426/0,324.58,-5577.85,60,0
    .goto 1426/0,250.71,-5154.30,60,0
    .goto 1426/0,408.31,-5187.13,60,0
    .goto 1426/0,388.61,-5311.90,60,0
    .goto 1426/0,531.43,-5426.82,60,0
    .goto 1426/0,531.43,-5426.82,60,0
    .goto 1426/0,324.58,-5577.85,60,0
    >> 击杀熊、野猪和雪豹。按北->西->南的方向走
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .complete 319,3 --Kill Snow Leopard (x8)
step
    >>收集剩余的峭壁野猪肋排
    .complete 384,1 --Collect Crag Boar Rib (x6)
step
    .goto 1426/0,315.28,-5378.39
>>与 |cRXP_FRIENDLY_雷杰德·麦酒|r 交谈
    .turnin 319 >> 交任务：艾沃沙酒
.target 雷杰德·麦酒
    .accept 320 >> 接任务：艾沃沙酒
step
    .isQuestTurnedIn 384
    .xp 7+4360 >>刷怪至经验值达到 4360+/4500
step
    .xp 7+3735 >>刷怪至经验值达到 3735+/4500
step
    .hs >> 使用炉石返回卡拉诺斯
step
    .goto 1426/0,-532.37,-5600.83
    >> 向贝尔姆购买狂想麦酒和雷霆麦酒
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .collect 2686,1 --Collect Thunder Ale (x1)
step
    .goto 1426/0,-542.22,-5597.55,10,0
    .goto 1426/0,-547.63,-5607.07
    >>下楼与加文交谈，把雷霆麦酒交给他
    >>等待鼠标移到酒桶上时显示“无人看守”，然后交任务
    .turnin 310 >> 交任务：针锋相对
    .accept 311 >> 接任务：向马莱斯回报
step
    .goto 1426/0,-502.82,-5597.55
.target 拉格纳·雷酒
>>与 |cRXP_FRIENDLY_拉格纳·雷酒|r 交谈
    .turnin 384 >> 交任务：啤酒烤猪排
     >>下次出售杂物时把配方卖掉
step
    .xp 8 >> 刷怪升到 8 级
step
    .goto 1426/0,-537.29,-5587.70
    .trainer >> 学习职业技能
    >>务必学习变形术
step
    .goto 1426/0,-532.37,-5600.83
    .vendor >> 向旅店老板购买 5 级饮料，补足到 30 瓶
step
    .goto 1426/0,-499.17,-5644.37
.target 森内尔·白须
>>与 |cRXP_FRIENDLY_森内尔·白须|r 交谈
    .accept 287 >> 接任务：霜鬃巨魔要塞
step
    .goto 1426/0,-641.80,-5473.18
.target 驾驶员迪恩·石轮
>>与 |cRXP_FRIENDLY_驾驶员迪恩·石轮|r 交谈
    .turnin 313 >> 交任务：灰色洞穴
step
    .goto 1426/0,-632.15,-5466.540
.target 驾驶员贝隆·风箱
>>与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 交谈
    .turnin 320 >> 交任务：艾沃沙酒
step
    #era/som
    >>在建筑内
    .goto 1426/0,-453.57,-5499.05
.target 拉兹·滑链
>>与 |cRXP_FRIENDLY_拉兹·滑链|r 交谈
    .accept 412 >> 接任务：自动净化装置
step
    .goto 1426/0,-320.59,-5354.58,25,0
    .goto 1426/0,-271.34,-5367.72,25 >> 沿斜坡上去，前往微光草所在地
step
    .goto 1426/0,-212.24,-5364.43,30,0
    .goto 1426/0,-241.79,-5308.62,30,0
    .goto 1426/0,-153.14,-5190.42,30,0
    .goto 1426/0,-271.34,-5003.27,30,0
    >>清理这片区域的怪物。如果需要清理中间的营地，要小心。若还差 2 只，可以引出屋内的怪物，再绕到屋后利用视线遮挡将它们拉过来。运气不好就去另一片区域
    >>拾取地上的箱子
    .complete 315,1 --Collect Shimmerweed (x6)
step
    >> 对冰须施放变形术，然后拾取干肉
    .goto 1426/0,-94.04,-5646.80
    .complete 312,1 --Collect MacGrann's Dried Meats (x1)
step
    .goto 1426/0,98.03,-5574.57
.target 图德拉·马克格拉恩
>>与 |cRXP_FRIENDLY_图德拉·马克格拉恩|r 交谈
    .turnin 312 >> 交任务：马克格拉恩的干肉
step
    .goto 1426/0,304.88,-5380.85
    .vendor >> 再购买最多 20 瓶 5 级饮料
step
    #sticky
    #label Stout
    .goto 1426/0,315.28,-5378.39
>>与 |cRXP_FRIENDLY_雷杰德·麦酒|r 交谈
    .turnin 315 >> 交任务：完美烈酒
.target 雷杰德·麦酒
    .accept 413 >> 接任务：微光酒
step
    .goto 1426/0,315.42,-5372.02
.target 马莱斯·麦酒
>>与 |cRXP_FRIENDLY_马莱斯·麦酒|r 交谈
    .turnin 311 >> 交任务：向马莱斯回报
step
    #era/som
    #requires Stout
    .goto 1426/0,462.48,-5288.92,40,0
    .goto 1426/0,580.68,-5167.43,40,0
    .goto 1426/0,541.28,-5302.05,40,0
    .goto 1426/0,605.31,-5321.75,40,0
    .goto 1426/0,551.13,-5367.72,40,0
    >>击杀麻疯侏儒，拾取多档齿轮和自适应齿轮
    .complete 412,2 --Collect Gyromechanic Gear (x8)
    .complete 412,1 --Collect Restabilization Cog (x8)
step
    .xp 9 >> 刷怪升到 9 级
step
    .goto 1426/0,595.46,-5545.02,35 >>进入洞穴
step
    .goto 1426/0,713.66,-5528.60,40,0
    .goto 1426/0,753.06,-5613.97,40,0
    >>击杀洞内的霜鬃猎头者
    .complete 287,1 --Kill Frostmane Headhunter (x5)
step
    #hardcore
    >>小心地边刷怪边深入洞穴中的这个角落
    .goto 1426/0,669.33,-5590.98
    .complete 287,2 --Fully explore Frostmane Hold
step
    #softcore
    .goto 1426/0,649.63,-5568.00,15 >>沿洞穴返回上方
step
    #softcore
    >>跳下去，之后角色会死亡
    .goto 1426/0,669.33,-5590.98
    .complete 287,2 --Fully explore Frostmane Hold
step
    #softcore
    .deathskip >> 死亡后在灵魂医者处复活
step
    #hardcore
   .goto 1426/0,-499.17,-5644.37,150 >> 炉石可用就使用，否则边刷怪边返回卡拉诺斯
step
    .goto 1426/0,-499.17,-5644.37
>>与 |cRXP_FRIENDLY_森内尔·白须|r 交谈
    .turnin 287 >> 交任务：霜鬃巨魔要塞
.target 森内尔·白须
    .accept 291 >> 接任务：森内尔的报告
step
    #era/som
    .goto 1426/0,-453.57,-5499.05
.target 拉兹·滑链
>>与 |cRXP_FRIENDLY_拉兹·滑链|r 交谈
    .turnin 412 >> 交任务：自动净化装置
step
    .goto 1426/0,-1157.84,-5604.12,50,0
    .goto 1426/0,-1305.59,-5512.18
.target 鲁德拉·冻石
>>与 |cRXP_FRIENDLY_鲁德拉·冻石|r 交谈
    .accept 314 >> 接任务：保护牲畜
step
    #sticky
    #completewith next
    .goto 1426/0,-1266.19,-5528.60,14,0
    .goto 1426/0,-1261.27,-5499.05,10 >>从这里上山
step
    >>击杀瓦加什，拾取他的牙齿
    >>把他风筝到牧场南边的守卫处。确保你造成了 51%+ 的伤害
    >>小心，这个任务可能较难
    .goto 1426/0,-1280.97,-5390.70
    .complete 314,1 --Collect Fang of Vagash (1)
--N Video tutorial needed
step
    .goto 1426/0,-1305.59,-5512.18
.target 鲁德拉·冻石
>>与 |cRXP_FRIENDLY_鲁德拉·冻石|r 交谈
    .turnin 314 >> 交任务：保护牲畜
step
    >>沿途刷些怪
    .goto 1426/0,-1576.47,-5673.07
    .vendor >>出售杂物，按需购买食物和饮料
step
    .goto 1426/0,-1581.39,-5715.75
.target 参议员梅尔·圣石
>>与 |cRXP_FRIENDLY_参议员梅尔·圣石|r 交谈
    .accept 433 >> 接任务：公众之仆
step
    #completewith next
    .goto 1426/0,-1591.24,-5712.47
    .vendor >> 出售杂物并修理装备
step
    .goto 1426/0,-1600.30,-5726.590
.target 工头乔尼·石眉
>>与 |cRXP_FRIENDLY_工头乔尼·石眉|r 交谈
    .accept 432 >> 接任务：该死的石腭怪！
step
    .goto 1426/0,-1674.97,-5735.45,30,0
    .goto 1426/0,-1684.82,-5627.10,30,0
    .goto 1426/0,-1738.99,-5541.73,30,0
    .goto 1426/0,-1788.24,-5620.53,30,0
    .goto 1426/0,-1674.97,-5735.45,30,0
    .goto 1426/0,-1684.82,-5627.10,30,0
    .goto 1426/0,-1738.99,-5541.73,30,0
    .goto 1426/0,-1788.24,-5620.53,30,0
    >>击杀洞穴内的石腭怪
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
step
    .goto 1426/0,-1600.30,-5726.590
.target 工头乔尼·石眉
>>与 |cRXP_FRIENDLY_工头乔尼·石眉|r 交谈
    .turnin 432 >> 交任务：该死的石腭怪！
step
    #completewith next
    .goto 1426/0,-1591.24,-5712.47
    .vendor >> 出售杂物并修理装备
step
    .goto 1426/0,-1581.39,-5715.75
.target 参议员梅尔·圣石
>>与 |cRXP_FRIENDLY_参议员梅尔·圣石|r 交谈
    .turnin 433 >> 交任务：公众之仆
step
    .goto 1426/0,-1502.59,-5837.23,40,0
    .goto 1426/0,-1679.89,-5787.98,40,0
    .goto 1426/0,-1694.67,-5646.8,40,0
    .xp 10 >> 刷石腭怪升到 10 级
step
    .goto 1426/0,-1576.47,-5673.07
    .vendor >>出售杂物，向卡杉·莫格什购买 5 级饮料，补足到 30 瓶
    .train 2550 >>向厨师格瑞姆学习烹饪，稍后需要此技能才能额外接取2个任务
step
    .goto 1426/0,-2325.07,-5164.15
.target 驾驶员塞克·锤足
>>与 |cRXP_FRIENDLY_驾驶员塞克·锤足|r 交谈
    .accept 419 >> 接任务：失踪的驾驶员
step
    >>沿途刷怪
    .goto 1426/0,-2123.14,-5065.65
    .turnin 419 >> 交任务：失踪的驾驶员
    .accept 417 >> 接任务：驾驶员的复仇
step
    >>击杀癞爪，拾取肮脏的爪子
    .goto 1426/0,-2137.92,-5072.22
    .complete 417,1 --Collect Mangy Claw (x1)
step
    .goto 1426/0,-2329.60,-5163.76
.target 驾驶员塞克·锤足
>>与 |cRXP_FRIENDLY_驾驶员塞克·锤足|r 交谈
    .turnin 417 >> 交任务：驾驶员的复仇
step
    >>原路穿过隧道返回
    .goto 1426/0,-2118.22,-5541.73,50,0
    .goto 1426/0,-2251.19,-5633.67,25,0
    .goto 1426/0,-2447.11,-5479.74
>>与 |cRXP_FRIENDLY_巡山人维拉特·麦酒|r 交谈
    .turnin 413 >> 交任务：微光酒
.target 巡山人维拉特·麦酒
    .accept 414 >> 接任务：卡德雷尔的酒
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师
#forever
#disabledungeons
<< Alliance Mage
#name 10-12 Loch Modan Mage AoE
#version 1
#group RestedXP Alliance Mage
#defaultfor none Mage
#next 12-18 Darkshore Mage AoE
#displayname 10-12 洛克莫丹（法师 AoE）
step
    #era/som
    #completewith next
    +在洛克莫丹做任务时，保留所有获得的大块野猪肉，不要卖给商人，后面会用到的
step << Gnome
    .goto 1432/0,-2602.54,-5832.73
.target 巡山人库伯弗林特
>>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >> 接任务：保卫国王的领土
step << Gnome
    .goto 1432/0,-2634.59,-5842.81
    >>从后方进入地堡
.target 拉格弗斯上尉
>>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .accept 267 >> 接任务：穴居人的威胁
step << Gnome
    .goto 1432/0,-2818.49,-5742.10,45 >> 前往穴居人洞口
step << Gnome
    .goto 1432/0,-2821.25,-5819.36,50,0
    .goto 1432/0,-2950.89,-5804.64,50,0
    .goto 1432/0,-2846.07,-5979.40,50,0
    .goto 1432/0,-2821.25,-5819.36,50,0
    .goto 1432/0,-2950.89,-5804.64,50,0
    .goto 1432/0,-2846.07,-5979.40,50,0
    >>击杀碎石穴居人，拾取它们的牙齿。
    >>这个任务难度较高，请小心。如果误引到 2 只怪物，立即逃跑。
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
step << Gnome
    .goto 1432/0,-2602.54,-5832.73
.target 巡山人库伯弗林特
>>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .turnin 224 >> 交任务：保卫国王的领土
step << Gnome
    .goto 1432/0,-2634.59,-5842.81
    >>从后方进入地堡
.target 拉格弗斯上尉
>>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .turnin 267 >> 交任务：穴居人的威胁
step << Human
    .goto 1432/0,-2658.51,-4822.30
    .vendor >>卖掉杂物并修理
step << Human
    .goto 1432/0,-2676.82,-4825.93
>>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 353 >> 交任务：雷矛的包裹
.target 巡山人卡尔·雷矛
    .accept 307 >> 接任务：肮脏的爪子
step << Human
    #sticky
    #completewith next
    >>击杀该区域的蜘蛛以获取蜘蛛毒液
    .collect 3174,3 --Collect Spider Ichor (x3)
    >>在该区域击杀熊以获取熊肉
    .collect 3173,3 --Collect Bear Meat (x3)
    >>击杀该区域的野猪以获取猪大肠
    .collect 3172,3 --Collect Boar Intestines (x3)
step << Human
    .goto 1432/0,-2961.92,-5366.82,130 >>途中刷怪，为后续烹饪任务收集材料
step
    >>跑到塞尔萨玛，不要设置炉石 << Gnome
    .goto 1432/0,-2954.42,-5394.10
.target 维德拉·壁炉
>>与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .accept 418 >> 接任务：塞尔萨玛血肠
step << Human
    #sticky
    .abandon 1338 >> 放弃任务“卡尔·雷矛的订单”，以解锁“巡山人卡尔·雷矛的任务”
step
    .goto 1432/0,-2953.65,-5381.54
    .vendor >>买 1-2 个 6 格背包，把背包栏位填满
step
    .goto 1432/0,-2972.96,-5377.86
    .vendor >> 购买食物和饮料（尽量准备40瓶需要5级的饮料、20份需要5级的食物）。
step
    .goto 1432/0,-2892.97,-5405.45,80.0,0
    .goto 1432/0,-3019.85,-5335.55,80.0,0
    .goto 1432/0,-3006.06,-5252.77
    >>寻找卡德雷尔，他沿塞尔萨玛的道路巡逻
.target 巡山人卡德雷尔
>>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
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
    .goto 1432/0,-2658.51,-4822.30
    .vendor >>卖掉杂物并修理
step << Gnome
    .goto 1432/0,-2676.82,-4825.93
>>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务
.target 巡山人卡尔·雷矛
    .accept 1338 >> 接任务：卡尔·雷矛的订单
    .accept 307 >> 接任务：肮脏的爪子
step << Gnome
    #label Thelsamar1
    .goto 1432/0,-2923.58,-4803.910,130 >>途中刷怪，收集猪大肠、熊肉和蜘蛛的毒液
step << Human
    #label Thelsamar1
    .goto 1432/0,-3077.77,-4984.19,130 >>途中刷怪，收集猪大肠、熊肉和蜘蛛的毒液
step
    #sticky
    #completewith Gear
    >> 击杀坑道鼠，拾取他们的耳朵
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
step
    .goto 1432/0,-2972.96,-4822.30,45 >>一边击杀坑道鼠，一边前往洞穴入口
step
    #label Gear
    .goto 1432/0,-2972.96,-4853.58,12,0
    .goto 1432/0,-2997.78,-4868.29,12,0
    .goto 1432/0,-2967.44,-4892.21,12,0
    .goto 1432/0,-2983.99,-4894.05,12,0
    .goto 1432/0,-2995.02,-4941.88,12,0
    .goto 1432/0,-2978.47,-4934.52,12,0
    .goto 1432/0,-2956.41,-4945.56,12,0
    .goto 1432/0,-2978.47,-4934.52,12,0
    .goto 1432/0,-2995.02,-4941.88,12,0
    .goto 1432/0,-2983.99,-4894.05,12,0
    .goto 1432/0,-2967.44,-4892.21,12,0
    .goto 1432/0,-2997.78,-4868.29,12,0
    .goto 1432/0,-2972.96,-4853.58,12,0
    >>收集洞穴中找到的箱子。注意，这在 11 级时难度较高
    >>小心，坑道鼠地卜师会在几秒后施放快速烈焰防护结界，使其免疫火焰伤害。
    .complete 307,1 --Collect Miners' Gear (x4)
step
    .goto 1432/0,-3081.36,-4902.88
    >> 击杀坑道鼠，拾取他们的耳朵
    >> 尽量击杀坑道鼠歹徒，避开坑道鼠狗头人和坑道鼠地卜师。
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
    .goto 1432/0,-2636.44,-4816.79,60 >>跑回掩体，途中顺手刷怪
step
    .goto 1432/0,-2658.51,-4822.30
    .vendor >>出售杂物并修理装备
step
    .goto 1432/0,-2675.06,-4824.14
>>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 307 >> 交任务：肮脏的爪子
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务 << Human
.target 巡山人卡尔·雷矛
    .accept 1338 >> 接任务：卡尔·雷矛的订单 << Human
step
    #sticky
    #label Meat9
    .goto 1432/0,-2735.74,-4684.34,40,0
    .goto 1432/0,-2846.07,-4682.50,40,0
    .goto 1432/0,-2782.63,-4770.80,40,0
    .goto 1432/0,-2835.04,-4976.83,40,0
    .goto 1432/0,-2915.03,-5044.89,40,0
    .goto 1432/0,-3080.53,-5100.08,40,0
    .goto 1432/0,-2735.74,-4684.34,40,0
    .goto 1432/0,-2846.07,-4682.50,40,0
    .goto 1432/0,-2782.63,-4770.80,40,0
    .goto 1432/0,-2835.04,-4976.83,40,0
    .goto 1432/0,-2915.03,-5044.89,40,0
    .goto 1432/0,-3080.53,-5100.08,40,0
    .goto 1432/0,-2735.74,-4684.34
    >>击杀熊，拾取熊肉
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
step
    #sticky
    #label Ichor9
    .goto 1432/0,-2873.66,-4789.19,40,0
    .goto 1432/0,-2766.08,-4866.45,40,0
    .goto 1432/0,-2926.07,-5232.53,40,0
    .goto 1432/0,-2992.27,-5055.93,40,0
    .goto 1432/0,-3069.5,-5078.01,40,0
    .goto 1432/0,-2873.66,-4789.19,40,0
    .goto 1432/0,-2766.08,-4866.45,40,0
    .goto 1432/0,-2926.07,-5232.53,40,0
    .goto 1432/0,-2992.27,-5055.93,40,0
    .goto 1432/0,-3069.5,-5078.01,40,0
    .goto 1432/0,-2873.66,-4789.19
    >>击杀蜘蛛，拾取蜘蛛的毒液
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
step
    .goto 1432/0,-3041.92,-5129.51,40,0
    .goto 1432/0,-3017.09,-5219.65,40,0
    .goto 1432/0,-2815.73,-5147.91,40,0
    .goto 1432/0,-2757.81,-4952.91,40,0
    .goto 1432/0,-2782.63,-4903.25,40,0
    .goto 1432/0,-3041.92,-5129.51,40,0
    .goto 1432/0,-3017.09,-5219.65,40,0
    .goto 1432/0,-2815.73,-5147.91,40,0
    .goto 1432/0,-2757.81,-4952.91,40,0
    .goto 1432/0,-2782.63,-4903.25,40,0
    .goto 1432/0,-3041.92,-5129.51
    >>击杀野猪，拾取猪大肠
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
step
#hidewindow
    #requires Meat9
step
    #sticky
    #label RatCatching
    #requires Ichor9
    .goto 1432/0,-2892.97,-5405.45,80.0,0
    .goto 1432/0,-3019.85,-5335.55,80.0,0
    .goto 1432/0,-3006.06,-5252.77
    >>寻找卡德雷尔，他沿塞尔萨玛的道路巡逻
.target 巡山人卡德雷尔
>>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    .turnin 416 >> 交任务：狗头人的耳朵
step
    #requires Ichor9
    .goto 1432/0,-2954.42,-5394.10
.target 维德拉·壁炉
>>与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .turnin 418 >> 交任务：塞尔萨玛血肠
step
    #era/som
    .goto 1432/0,-2952.55,-5381.91
    .vendor >> 购买 6 格背包，直到背包栏位装满；另买 1 个燧石和火绒、2 个普通木柴
    .collect 4470,2 --Simple Wood (2)
    .collect 4471,1 --Flint and Tinder (1)
step
    .xp 12 >> 刷到12级
step << Gnome
    #completewith next
    #requires RatCatching
    .goto 1432/0,-3781.70,-5702.36
    .vendor >> 查看奥德伦是否出售智者腰带；买得起就买下，留待以后使用。
step << Gnome
    #requires RatCatching
    .goto 1432/0,-3812.59,-5694.63
.target 勘察员基恩萨·铁环
>>与|cRXP_FRIENDLY_勘察员基恩萨·铁环|r交谈
    .accept 298 >>接受任务 挖掘进度报告
step << Gnome
    #softcore
    .goto 1432/0,-3872.73,-5646.07
    .deathskip >> 死亡后在塞尔萨玛复活。
step << Gnome
    #hardcore
    >> 跑回塞尔萨玛，进入建筑
    .goto 1432/0,-3018.75,-5350.08,20,0
    .goto 1432/0,-3014.88,-5367.00
.target 布洛克·寻石者
>>与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .accept 6387 >>接任务：荣誉学员
>>与|cRXP_FRIENDLY_吉恩·角盔|r交谈
    .turnin 298 >>交任务：挖掘进度报告
.target 吉恩·角盔
    .accept 301 >>接任务：向铁炉堡报告
step << Gnome
    #softcore
    >> 进入建筑
    .goto 1432/0,-3018.75,-5350.08,20,0
    .goto 1432/0,-3014.88,-5367.00
.target 布洛克·寻石者
>>与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .accept 6387 >>接任务：荣誉学员
>>与|cRXP_FRIENDLY_吉恩·角盔|r交谈
    .turnin 298 >>交任务：挖掘进度报告
.target 吉恩·角盔
    .accept 301 >>接任务：向铁炉堡报告
step
    #requires RatCatching
    .goto 1432/0,-2929.93,-5424.95
    .fp Thelsamar >> 获取塞尔萨玛飞行点
>>与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .turnin 6387 >>交任务：荣誉学员 << Gnome
.target 索格拉姆·伯雷森
    .accept 6391 >>接任务：飞往铁炉堡 << Gnome
    .fly Ironforge >> 飞往铁炉堡
step << Human
    .goto 1455/0,-928.25,-4614.46
    .trainer >> 学习职业技能
step << skip --logout skip << Human
    #completewith next
    +走向房间后方圣骑士训练师身后的楼梯。走到大约一半的位置，再移到楼梯边缘，直到看起来像悬在空中。退出登录，然后重新登录。
    .link https://www.youtube.com/watch?v=E8b90bzJMSI >> 点击这里查看参考
    >>登出跳到铁炉堡门口
step << Human
    .goto 1455/0,-810.36,-5039.71,120 >> 离开铁炉堡
step << Gnome
    .goto 1455/0,-1303.79,-4631.18
>>与|cRXP_FRIENDLY_勘察员塔伯斯·雷矛|r交谈
    .turnin 301 >>交任务 向铁炉堡报告
.target 勘察员塔伯斯·雷矛
    .accept 302 >>接受任务 铁环的火药
step << Gnome
    >>往大锻炉方向回去，然后右转进建筑
    .goto 1455/0,-1105.66,-4722.04,30,0
    .goto 1455/0,-1120.92,-4708.11
>>与|cRXP_FRIENDLY_高尼尔·石趾|r交谈
    .turnin 6391 >>交任务：飞往铁炉堡
.target 高尼尔·石趾
    .accept 6388 >>接任务：格莱斯·瑟登
step << Gnome
    .goto 1455/0,-1026.28,-4872.56
.target 参议员巴林·红石
>>与|cRXP_FRIENDLY_参议员巴林·红石|r交谈
    .turnin 291 >>交任务：森内尔的报告
step << Gnome
    .goto 1455/0,-1152.39,-4820.914
>>与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .turnin 6388 >>交任务：格莱斯·瑟登
.target 格莱斯·瑟登
    .accept 6392 >>接任务：向布洛克回复
    .fly Thelsamar >> 飞往塞尔萨玛
step << Gnome
    >>进入建筑
    .goto 1432/0,-3018.75,-5350.08,20,0
    .goto 1432/0,-3014.88,-5367.00
.target 布洛克·寻石者
>>与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .turnin 6392 >>交任务：向布洛克回复
    >>返回挖掘场，与|cRXP_FRIENDLY_勘察员基恩萨·铁环|r交谈。
    .goto 1432/0,-3812.59,-5694.63
    .target 勘察员基恩萨·铁环
    .turnin 302 >>交任务 铁环的火药
step << Gnome
    .hs >> 炉石回卡拉诺斯
step << Gnome
    .goto 1426/0,-537.29,-5587.04
    .trainer >> 学习职业技能
step
    #hardcore
    #completewith next
    .goto 1426/0,-1124.84,-5283.99,150 >> 前往捷径起点
step
    #hardcore
    .goto 1426/0,-1128.29,-5282.35,40,0
    .goto 1426/0,-1172.62,-5325.03,40,0
    .goto 1426/0,-1207.09,-5325.03,40,0
    .goto 1426/0,-1212.02,-5265.93,40,0
    .goto 1426/0,-1192.32,-5219.97,40,0
    .goto 1426/0,-1103.67,-5174.0,40,0
    .goto 1426/0,-1167.69,-5144.45,40,0
    .goto 1426/0,-1236.64,-5147.73,40,0
    .goto 1426/0,-1433.64,-4586.28,40,0
    .goto 1426/0,-1438.57,-4287.50,40,0
    .goto 1426/0,-1428.72,-4231.68,40,0
    .goto 1426/0,-1473.04,-4205.42,40,0
    .goto 1426/0,-1492.74,-4156.17,40,0
    .goto 1437/0,-1241.48,-4000.12,50,0
    .goto 1437/0,-1121.55,-4013.90,40,0
    .goto 1437/0,-1084.33,-3947.75,40,0
    .goto 1437/0,-1014.03,-3911.92,40,0
    .goto 1437/0,-889.97,-3809.94,40,0
    >>打开此链接，在另一个屏幕上跟随指引
    >>走丹莫罗→湿地的无死亡捷径
    >>过海时避开鳄鱼
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >> 点击这里查看参考
    .goto 1437/0,-889.97,-3809.94,80 >> 前往米奈希尔港
step
    #softcore
    .goto 1426/0,309.81,-5108.33,50 >> 前往这里
step
    #softcore
    .goto 1426/0,280.26,-4963.87,15 >>向北跑上山
step
    #softcore
    .goto 1426/0,206.38,-4832.53,15 >>沿着山坡向上走到这里
step
    #softcore
    .goto 1426/0,176.83,-4770.15,15,0
    .goto 1426/0,176.83,-4704.48,15,0
    .goto 1437/0,-869.29,-3344.13,60,0
    .deathskip >>一直向北跑, 跳下去并死掉, 然后复活
step
    #softcore
    #completewith next
    .goto 1437/0,-914.78,-3435.09,60 >> 游向岸边
step
    .money <0.08
    .goto 1437/0,-819.67,-3691.42,15,0
    .goto 1437/0,-807.26,-3716.22,15,0
    .goto 1437/0,-827.94,-3724.49,15,0
    .goto 1437,10.760,56.721
    .vendor >> 如果有 8 银，就向尼尔·奥雷查看青铜管；有货便购买
step
    .money <0.04
    .goto 1437/0,-724.55,-3699.69
    .vendor >> 去德温那里看看治疗药水, 买到只剩 1 银
step
    .goto 1437/0,-782.45,-3793.40
    .fp Menethil Harbor >> 获取米奈希尔港飞行点
step
    #era/som
    #sticky
    #completewith Darkshore1
    +在这里等船。从法术书施放基础营火，开始烹饪先前保留的大块野猪肉。现在烹饪技能至少需要10点，之后需要50点，所以把肉全部烹饪掉。
    .goto 1437/0,-583.95,-3727.25
step
    #era/som
    #label Darkshore1
    .zone Darkshore >>船来了就上船，前往黑海岸。如果已完成烹饪，就开始尽量多制造需要5级的饮料。
step
    #som
    #phase 3-6
    #label Darkshore1
    .zone Darkshore >>船来了就上船，前往黑海岸。开始尽量多制造需要5级的饮料。
]])
