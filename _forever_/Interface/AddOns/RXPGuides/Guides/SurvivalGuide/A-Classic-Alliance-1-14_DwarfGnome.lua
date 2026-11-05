local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（联盟）
#hardcore
#classic
#tbc
#era/som--h
<< Alliance
#name 1-6 Coldridge Valley
#title 寒脊山谷
#version 1
#group RestedXP Survival Guide (A)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
#defaultfor Dwarf/Gnome
#next 6-10 Dun Morogh
#displayname 1-6 寒脊山谷
step << !Gnome !Dwarf
    #sticky
    #completewith next
    .goto Dun Morogh,29.927,71.201
    +你选择了侏儒和矮人专用指南。请选择与你出生地对应的起始区域指南
step << !Warlock
    #completewith next
    .destroy 6948
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯登·粗臂|r 交谈
    .goto Dun Morogh,29.927,71.201
    .accept 179 >> 接任务: 矮人的交易
    .target 斯登·粗臂
step << Warrior
    .goto Dun Morogh,29.68,74.20,40,0
    >>击杀 |cRXP_ENEMY_蓬毛幼狼|r，直到可出售的杂物价值达到 10 铜币以上
    >>|cRXP_WARN_接下来学习|r |T132333:0|t[战斗怒吼] |cRXP_WARN_以加快初期升级速度|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格伦德尔·哈金|r 交谈
    .vendor >> |cRXP_WARN_卖掉杂物|r
    .target +格伦德尔·哈金
    .goto Dun Morogh,28.793,67.838
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯兰·库尔曼|r 交谈
    .train 6673 >>学习 |T132333:0|t[战斗怒吼]
    .target +斯兰·库尔曼
    .goto Dun Morogh,28.832,67.242
    .mob 蓬毛幼狼
    .mob 蓬毛森林狼
step << Warlock
    #completewith next
    .goto Dun Morogh,28.792,68.497,20 >> 进入安威玛尔
    >>|cRXP_WARN_途中卸下胸甲、衬衣、裤子和靴子，稍后将它们卖掉|r
step << Warlock
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德南·弗卡特|r 交谈
    .vendor >> |cRXP_WARN_卖掉胸甲、衬衣、裤子和靴子，以及背包中的食物和水。总共需要 10 铜币|r
    .target 德南·弗卡特
step << Warlock
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿拉玛尔·格里姆|r 交谈
    .train 348 >> 学习 |T135817:0|t[献祭]
    .accept 1599 >> 接任务: 开端
    .target 阿拉玛尔·格里姆
step
    .goto Dun Morogh,30.79,74.48,50,0
    .goto Dun Morogh,29.02,76.38,50,0
    .goto Dun Morogh,26.68,75.57
    >>击杀|cRXP_ENEMY_蓬毛幼狼|r和|cRXP_ENEMY_蓬毛森林狼|r，拾取它们的|cRXP_LOOT_硬狼肉|r
    >>|cRXP_WARN_装备从|r|cRXP_ENEMY_幼狼|r身上拾取的所有布甲 << Warlock
    .complete 179,1 --Collect Tough Wolf Meat (x8)
    .mob 蓬毛幼狼
    .mob 蓬毛森林狼
step
    .xp 2 >> 刷到2级
step << Warlock
    .goto Dun Morogh,29.927,71.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯登·粗臂|r 交谈
    .turnin 179 >> 交任务: 矮人的交易
    .accept 3115 >> 接任务: 被污染的备忘录 << Gnome Warlock
    .accept 233 >> 接任务: 寒脊山谷的送信任务
    .target 斯登·粗臂
step << Warlock
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴尔林·霜锤|r 交谈
    .goto Dun Morogh,29.709,71.255
    .accept 170 >> 接任务: 新的威胁
    .target 巴尔林·霜锤
step << Warlock
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾德林·怒流|r 交谈
    .vendor >> |cRXP_WARN_卖掉杂物|r
    >>|cRXP_BUY_购买 15 瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_。如果钱不够，就继续击杀 |cRXP_ENEMY_蓬毛幼狼|r 赚取所需的钱|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target 艾德林·怒流
step << Warlock
    #completewith next
    .goto Dun Morogh,27.28,81.09,20 >> 进入霜鬃洞穴
step << Warlock
    >>击杀洞内的|cRXP_ENEMY_霜鬃巨魔新兵|r，拾取|cRXP_LOOT_羽毛符咒|r
    >>|cRXP_BUY_装备从|r|cRXP_ENEMY_霜鬃巨魔|r身上拾取的所有布甲
    .goto Dun Morogh,29.0,82.6,50,0
    .goto Dun Morogh,29.0,81.2,60,0
    .goto Dun Morogh,30.1,82.4
    .complete 1599,1 --Collect Feather Charm (x3)
    .mob 霜鬃巨魔新兵
step << Warlock
    #hardcore
    #completewith next
    .hs >> 使用炉石返回 寒脊山谷
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿拉玛尔·格里姆|r 交谈
    .goto Dun Morogh,28.650,66.145
    .turnin 1599 >> 交任务: 开端
    .turnin 3115 >> 交任务: 被污染的备忘录 << Gnome Warlock
    .target 阿拉玛尔·格里姆
step << Priest/Mage
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾德林·怒流|r 交谈
    .vendor >> |cRXP_WARN_卖掉杂物|r
    >>|cRXP_BUY_购买 15 瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_。如果钱不够，就继续击杀 |cRXP_ENEMY_蓬毛幼狼|r 赚取所需的钱|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target 艾德林·怒流
step << Paladin/Warrior
    #completewith next
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾德林·怒流|r 交谈
    .vendor >> |cRXP_WARN_卖掉杂物|r
    .target 艾德林·怒流
step << !Warlock
    .goto Dun Morogh,29.927,71.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯登·粗臂|r 交谈
    .turnin 179 >> 交任务: 矮人的交易
    .accept 233 >> 接任务: 寒脊山谷的送信任务
    .accept 3106 >> 接任务: 简易符文 << Dwarf Warrior
    .accept 3107 >> 接任务: 神圣符文 << Paladin
    .accept 3109 >> 接任务: 密文符文 << Dwarf Rogue
    .accept 3110 >> 接任务: 神圣符文 << Priest
    .accept 3112 >> 接任务: 简易备忘录 << Gnome Warrior
    .accept 3113 >> 接任务: 密文备忘录 << Gnome Rogue
    .accept 3114 >> 接任务: 雕文备忘录 << Mage
    .accept 3108 >>接任务：风蚀符文 << Dwarf Hunter
    .target 斯登·粗臂
step << !Warlock
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴尔林·霜锤|r 交谈
    .goto Dun Morogh,29.709,71.255
    .accept 170 >> 接任务: 新的威胁
    .target 巴尔林·霜锤
step
    #era
    #completewith Rockjaw
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +壮实的石腭怪
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔林·锐眼|r 交谈
    .target 塔林·锐眼
    .goto Dun Morogh,22.601,71.433
    .turnin 233 >> 交任务: 寒脊山谷的送信任务
    .accept 183 >> 接任务: 猎杀野猪
    .accept 234 >> 接任务: 寒脊山谷的送信任务
step
    .goto Dun Morogh,22.2,72.5,40,0
    .goto Dun Morogh,20.5,71.4,40,0
    .goto Dun Morogh,21.1,69.0,40,0
    .goto Dun Morogh,22.8,69.6,40,0
    .goto Dun Morogh,22.2,72.5,40,0
    .goto Dun Morogh,20.5,71.4,40,0
    .goto Dun Morogh,21.79,71.60
    >>击杀|cRXP_ENEMY_小型峭壁野猪|r
    .complete 183,1 --Kill Small Crag Boar (x12)
    .mob 小型峭壁野猪
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔林·锐眼|r 交谈
    .target 塔林·锐眼
    .goto Dun Morogh,22.601,71.433
    .turnin 183 >> 交任务: 猎杀野猪
step << Paladin/Mage/Warlock/Hunter
    #era
    .xp 3+1130 >> 刷怪至 1130+/1400 经验值
    .goto Dun Morogh,23.0,75.0,50,0
    .goto Dun Morogh,24.2,72.5,50,0
    .goto Dun Morogh,27.7,76.3,50,0
    .goto Dun Morogh,23.0,75.0,50,0
    .goto Dun Morogh,24.2,72.5
step
    #label Rockjaw
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格瑞林·白须|r 交谈
    .target 格瑞林·白须
    .goto Dun Morogh,25.076,75.713
    .turnin 234 >> 交任务: 寒脊山谷的送信任务
    .accept 182 >> 接任务: 巨魔洞穴
step << Paladin/Mage/Warlock/Hunter
    .xp 4
step << Paladin/Mage/Warlock/Hunter
    #era
    .goto Dun Morogh,31.37,75.63
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +壮实的石腭怪
step << Paladin/Mage/Warlock/Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_诺里斯·激流|r 交谈
    .target 诺里斯·激流
    .goto Dun Morogh,24.980,75.963
    .accept 3364 >> 接任务: 热酒快递
step << Paladin/Mage/Warlock/Hunter
    #completewith next
    .goto Dun Morogh,28.792,68.497,20 >> 前往安威玛尔
step << Paladin/Mage/Warlock/Hunter
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德南·弗卡特|r 交谈
    .turnin 3364 >> 交任务: 热酒快递
    .accept 3365 >> 接任务: 归还酒杯
    .target 德南·弗卡特
step << Hunter
    .goto Dun Morogh,29.175,67.455
    .target 索加斯·格瑞姆森
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索加斯·格瑞姆森|r 交谈
    .turnin 3108 >>交任务：风蚀符文
    .train 1978 >> 学习 [毒蛇钉刺]
step << Dwarf Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r 交谈
    .target 布罗莫斯·格鲁诺尔
    .goto Dun Morogh,28.833,68.332
    .turnin 3107 >> 交任务: 神圣符文
    .trainer >> 学习职业技能
step << Gnome Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r 交谈
    .target 玛瑞克·斯托纳尔
    .goto Dun Morogh,28.709,66.366
    .turnin 3114 >> 交任务: 雕文备忘录
    .trainer >> 学习职业技能
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿拉玛尔·格里姆|r 交谈
    .target 阿拉玛尔·格里姆
    .goto Dun Morogh,28.650,66.145
    .trainer >> 学习腐蚀术
step << Paladin/Mage/Warlock/Hunter
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴尔林·霜锤|r 交谈
    .target 巴尔林·霜锤
    .goto Dun Morogh,29.709,71.255
    .turnin 170 >> 交任务: 新的威胁
step << Hunter
    #completewith next
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾德林·怒流|r 交谈
    .vendor >> |cRXP_WARN_卖掉杂物|r
    >>|cRXP_WARN_购买 2 组|r |T132384:0|t[轻弹]
    .collect 2516,400 -- Light Shot (400)
    .target 艾德林·怒流
step << Mage/Warlock
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾德林·怒流|r 交谈
    .vendor >> |cRXP_WARN_卖掉杂物|r
    >>|cRXP_BUY_购买 10 瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_。如果钱不够，就继续击杀 |cRXP_ENEMY_蓬毛幼狼|r 赚取所需的钱|r
    .collect 159,10 --Collect Refreshing Spring Water (x15)
    .target 艾德林·怒流
step << !Paladin !Mage !Warlock !Hunter
    #era
    #completewith next
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +壮实的石腭怪
step << Paladin/Mage/Warlock/Hunter
    .goto Dun Morogh,26.3,79.2,40,0
    .goto Dun Morogh,22.7,79.3,40,0
    .goto Dun Morogh,20.9,75.7,40,0
    .goto Dun Morogh,22.7,79.3,40,0
    .goto Dun Morogh,20.9,75.7
    >>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .mob 霜鬃巨魔幼崽
step << !Paladin !Mage !Warlock !Hunter
    .goto Dun Morogh,22.7,79.3,40,0
    .goto Dun Morogh,20.9,75.7,40,0
    .goto Dun Morogh,22.7,79.3,40,0
    .goto Dun Morogh,20.9,75.7,40,0
    .goto Dun Morogh,22.7,79.3,40,0
    .goto Dun Morogh,20.9,75.7,40,0
    .goto Dun Morogh,22.7,79.3
    >>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .mob 霜鬃巨魔幼崽
step << !Paladin !Mage
    #era
    #label TrollTroggs
    .goto Dun Morogh,28.7,77.5
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +壮实的石腭怪
step << !Paladin !Mage !Warlock !Hunter
    .xp 4 >> 刷到4级
step << !Paladin !Mage !Warlock !Hunter
    #era
    #requires TrollTroggs
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格瑞林·白须|r 交谈
    .target 格瑞林·白须
    .goto Dun Morogh,25.076,75.713
    .turnin 182 >> 交任务: 巨魔洞穴
    .accept 218 >> 接任务: 被窃取的日记
step << !Paladin !Mage !Warlock !Hunter
    #som
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格瑞林·白须|r 交谈
    .target 格瑞林·白须
    .goto Dun Morogh,25.076,75.713
    .turnin 182 >> 交任务: 巨魔洞穴
    .accept 218 >> 接任务: 被窃取的日记
step << Paladin/Mage/Warlock/Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格瑞林·白须|r 交谈
    .target 格瑞林·白须
    .goto Dun Morogh,25.076,75.713
    .turnin 182 >> 交任务: 巨魔洞穴
    .accept 218 >> 接任务: 被窃取的日记
step << Paladin/Mage/Warlock/Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_诺里斯·激流|r 交谈
    .target 诺里斯·激流
    .goto Dun Morogh,24.980,75.963
    .turnin 3365 >> 交任务: 归还酒杯
step
    #completewith next
    .goto Dun Morogh,27.28,81.09,20 >> 进入霜鬃洞穴
step
    .goto Dun Morogh,26.8,79.9,30,0
    .goto Dun Morogh,29.0,79.0,15,0
    .goto Dun Morogh,30.6,80.3
    >>击杀|cRXP_ENEMY_冷酷的格瑞克尼尔|r，拾取他的|cRXP_LOOT_日记|r
    .complete 218,1 --Collect Grelin Whitebeard's Journal (x1)
    .mob 冷酷的格瑞克尼尔
step << !Paladin !Mage !Warlock !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_诺里斯·激流|r 交谈
    .target 诺里斯·激流
    .goto Dun Morogh,24.980,75.963
    .accept 3364 >> 接任务: 热酒快递
step << !Paladin !Mage !Warlock !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格瑞林·白须|r 交谈
    .target 格瑞林·白须
    .goto Dun Morogh,25.075,75.715
    .turnin 218 >> 交任务: 被窃取的日记
    .accept 282 >> 接任务: 森内尔的观察站
step << !Paladin !Mage !Warlock !Hunter
    #completewith next
    .goto Dun Morogh,28.792,68.497,20 >> 前往安威玛尔
step << !Paladin !Mage !Warlock !Hunter
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德南·弗卡特|r 交谈
    .turnin 3364 >> 交任务: 热酒快递
    .accept 3365 >> 接任务: 归还酒杯
    .target 德南·弗卡特
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索姆·哈格林|r 交谈
    .target 索姆·哈格林
    .goto Dun Morogh,28.4,67.5
    .turnin 3113 >> 交任务: 密文备忘录 << Gnome Rogue
    .turnin 3109 >> 交任务: 密文符文 << Dwarf Rogue
step << Dwarf Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布兰斯托克·卡德尔|r 交谈
    .target 布兰斯托克·卡德尔
    .goto Dun Morogh,28.600,66.385
    .turnin 3110 >> 交任务: 神圣符文
    .trainer >> 学习职业技能
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯兰·库尔曼|r 交谈
    .target 斯兰·库尔曼
    .goto Dun Morogh,28.832,67.242
    .turnin 3106 >> 交任务: 简易符文 << Dwarf Warrior
    .turnin 3112 >> 交任务: 简易备忘录 << Gnome Warrior
    .trainer >> 学习职业技能
step << !Paladin !Mage !Warlock !Hunter
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴尔林·霜锤|r 交谈
    .target 巴尔林·霜锤
    .goto Dun Morogh,29.709,71.255
    .turnin 170 >> 交任务: 新的威胁
step << Priest
    .money <0.0025
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾德林·怒流|r 交谈
    .vendor >> |cRXP_WARN_卖掉杂物|r
    >>|cRXP_BUY_购买10瓶|r |T132794:0|t[清凉的泉水]
    .collect 159,10 --Collect Refreshing Spring Water (x15)
    .target 艾德林·怒流
step << Paladin/Mage/Warlock/Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格瑞林·白须|r 交谈
    .target 格瑞林·白须
    .goto Dun Morogh,25.075,75.715
    .turnin 218 >> 交任务: 被窃取的日记
    .accept 282 >> 接任务: 森内尔的观察站
step << !Paladin !Mage !Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_诺里斯·激流|r 交谈
    .target 诺里斯·激流
    .goto Dun Morogh,24.980,75.963
    .turnin 3365 >> 交任务: 归还酒杯
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人萨鲁斯|r 交谈
    .target 巡山人萨鲁斯
    .goto Dun Morogh,33.484,71.841
    .turnin 282 >> 交任务: 森内尔的观察站
    .accept 420 >> 接任务: 森内尔的观察站
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_汉兹·跳链|r 交谈
    .target 汉兹·跳链
    .goto Dun Morogh,33.847,72.236
    .accept 2160 >> 接任务: 塔诺克的补给品
step
    .goto Dun Morogh,34.32,70.95,15,0
    .goto Dun Morogh,35.65,65.79,15 >> 穿越 寒脊山口
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（联盟）
#hardcore
#era/som--h
#classic
#tbc
<< Alliance
#name 6-10 Dun Morogh
#title 丹莫罗
#version 1
#group RestedXP Survival Guide (A)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
#defaultfor Dwarf/Gnome
#next 10-11 Elwynn (Dwarf/Gnome)
#displayname 6-10 丹莫罗
step
    #completewith BoarMeat44 << !Paladin !Warrior !Rogue
    #completewith BearFur << Paladin/Warrior/Rogue
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,4,317,1 --Collect Chunk of Boar Meat (x4)
    .mob 峭壁野猪
    .mob 大峭壁野猪
step
    #completewith BoarMeat44 << !Paladin !Warrior !Rogue
    #completewith BearFur << Paladin/Warrior/Rogue
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取|cRXP_LOOT_峭壁野猪肋排|r
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
    .mob 大峭壁野猪
step
    .goto Dun Morogh,36.4,62.9,45,0
    .goto Dun Morogh,37.7,60.5,45,0
    .goto Dun Morogh,46.726,53.826
    .xp 5+2145 >> 前往卡拉诺斯, 途中击杀 |cRXP_ENEMY_峭壁野猪|r 刷至 2145+/2800 经验 << Priest
    .xp 5+2415 >> 前往卡拉诺斯, 途中击杀 |cRXP_ENEMY_峭壁野猪|r 刷至 2415+/2800 经验 << !Priest
    .mob 峭壁野猪
    .mob 大峭壁野猪
step
    #completewith next
    .goto Dun Morogh,46.726,53.826,30 >> 前往卡拉诺斯, 途中击杀 |cRXP_ENEMY_峭壁野猪|r
    .mob 峭壁野猪
    .mob 大峭壁野猪
step
    .goto Dun Morogh,46.726,53.826
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_森内尔·白须|r 对话
    .turnin 420 >> 交任务：森内尔的观察站
    .target 森内尔·白须
step << !Priest
    .goto Dun Morogh,48.3,57.0
    .xp 6 >> 刷到6级
step << Warlock
    .goto Dun Morogh,47.329,53.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吉姆瑞兹·黑轮|r 对话
    .trainer >> 学习职业技能
    .target 吉姆瑞兹·黑轮
step << Warlock
    .goto Dun Morogh,47.273,53.684
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹尼·血泡|r 对话
    .vendor >> |cRXP_BUY_购买|r |T133738:0|t[魔典：血契（等级1）] |cRXP_BUY_，若负担不起就稍后再买|r
    .target 丹尼·血泡
step << Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格瑞夫|r
    .trainer >> 学习职业技能
    .train 3044 >> 学习奥术射击
    .target 格瑞夫
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉格纳·雷酒|r 对话
    .target 拉格纳·雷酒
    .goto Dun Morogh,46.825,52.361
    .accept 384 >> 接任务：啤酒烤猪排
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔诺克·霜锤|r 对话
    .target 塔诺克·霜锤
    .goto Dun Morogh,47.217,52.195
    .turnin 2160 >> 交任务：塔诺克的补给品
step << Rogue
    .goto Dun Morogh,47.189,52.403
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克雷格·比尔姆|r 对话
    .vendor >> |cRXP_BUY_购买并装备|r |T135426:0|t[小飞刀]
    .target 克雷格·比尔姆
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在后室与 |cRXP_FRIENDLY_霍格拉尔·巴坎|r 对话
    .target 霍格拉尔·巴坎
    .goto Dun Morogh,47.563,52.608
    .trainer >> 学习职业技能
step << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在楼上与 |cRXP_FRIENDLY_玛济斯·石衣|r 对话
    .target 玛济斯·石衣
    .goto Dun Morogh,47.498,52.076
    .trainer >> 学习职业技能
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在楼上与 |cRXP_FRIENDLY_阿扎尔·战锤|r 对话
    .target 阿扎尔·战锤
    .goto Dun Morogh,47.597,52.070
    .trainer >> 学习职业技能
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马克萨恩·安沃尔|r 对话，位于屋内
    .target 马克萨恩·安沃尔
    .goto Dun Morogh,47.342,52.190
    .accept 5625 >> 接任务：圣光之衣
step << Priest
    >>对|cRXP_FRIENDLY_巡山人多尔夫|r先施放次级治疗术（等级 2），再施放真言术：韧
    .target 巡山人多尔夫
    .goto Dun Morogh,45.805,54.568
    .complete 5625,1 --Heal and fortify Mountaineer Dolf
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马克萨恩·安沃尔|r 对话，位于屋内
    .target 马克萨恩·安沃尔
    .goto Dun Morogh,47.342,52.190
    .turnin 5625 >> 交任务：圣光之衣
    .trainer >> 学习职业技能
step << Priest
    .xp 6 >> 刷到6级
step << Priest/Mage/Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .target 旅店老板贝尔姆
    .goto Dun Morogh,47.377,52.523
    .home >> 将炉石绑定在雷酒酿制厂
    .vendor >> |cRXP_BUY_购买尽可能多的|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_（量力购买）|r
step << !Mage !Priest !Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .target 旅店老板贝尔姆
    .goto Dun Morogh,47.377,52.523
    .home >> 将炉石绑定在雷酒酿制厂
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格兰尼斯·快斧|r 对话，位于屋内
    .target 格兰尼斯·快斧
    .goto Dun Morogh,47.360,52.646
    .trainer >> 学习职业技能
step << Paladin/Warrior
    #completewith next
    .goto Dun Morogh,45.8,51.8,20 >> 前往铁匠铺
step << Gnome Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T135321:0|t[步兵剑]
    .target 格劳恩·索姆温
    .money <0.0536
    .goto Dun Morogh,45.290,52.190
    .collect 2488,1 --Collect Gladius (1)
step << Dwarf Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T132401:0|t[双刃战斧]
    .target 格劳恩·索姆温
    .money <0.0460
    .goto Dun Morogh,45.290,52.190
    .collect 2491,1 --Collect Large Axe (1)
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T135641:0|t[卷刃的剑]
    .target 格劳恩·索姆温
    .money <0.0400
    .goto Dun Morogh,45.290,52.190
    .collect 2494,1 --Collect Stiletto (1)
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T133053:0|t[木槌棒]
    .target 格劳恩·索姆温
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
step << Warrior/Rogue/Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托格努斯·燧火|r 对话
    .target 托格努斯·燧火
    .goto Dun Morogh,45.3,51.9
    .trainer >> 学习|T136241:0|t[锻造]
    >>|cRXP_WARN_这能让你制作 |T135248:0|t[劣质磨刀石] 使你的近战伤害增加 2，在早期非常有用|r << Warrior/Rogue
    >>|cRXP_WARN_这能让你制作 |T135255:0|t[劣质平衡石] 使你的近战伤害增加 2，在早期非常有用|r << Paladin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨雷克·黑石|r 对话
    .target 萨雷克·黑石
    .goto Dun Morogh,46.021,51.676
    .accept 400 >> 接任务：贝尔丁的工具
step
    .goto Dun Morogh,49.426,48.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 对话
    >>|cRXP_WARN_在途中请勿击杀任何 |cRXP_ENEMY_黑熊幼崽|r |r
    .target 驾驶员贝隆·风箱
    .accept 317 >> 接任务：贝尔丁的补给
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员迪恩·石轮|r 对话
    .target 驾驶员迪恩·石轮
    .goto Dun Morogh,49.622,48.612
    .accept 313 >> 接任务：灰色洞穴
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与 |cRXP_FRIENDLY_贝尔丁·钢架|r 对话
    .target 贝尔丁·钢架
    .goto Dun Morogh,50.443,49.092
    .turnin 400 >> 交任务：贝尔丁的工具
step
    #label BoarMeat44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_罗斯洛·鲁治|r 交谈
    .target 罗斯洛·鲁治
    .goto Dun Morogh,50.084,49.420
    .accept 5541 >> 接任务：海格纳的弹药
step << Warrior/Paladin/Rogue
    #completewith next
    .money <0.0091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗斯洛·鲁治|r交谈
    .goto Dun Morogh,50.084,49.420
    >>|cRXP_BUY_购买一把|r|T134708:0|t[矿工锄]|cRXP_BUY_（如果已学习|r|T136241:0|t[锻造]）
    .collect 2901,1
    .target 罗斯洛·鲁治
step << Warrior/Paladin/Rogue
    .goto Dun Morogh,50.01,50.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚尔·锤石|r交谈
    .trainer >>学习 |T134708:0|t[采矿]
    .target 亚尔·锤石
step << Warrior/Paladin/Rogue
    .cast 2580 >> |cRXP_WARN_激活技能:|r |T136025:0|t[寻找矿物]
step << Paladin/Warrior/Rogue
    #completewith BearFur
    >>击杀|cRXP_ENEMY_黑熊幼崽|r，拾取|cRXP_LOOT_厚熊皮|r
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob 黑熊幼崽
step << !Paladin !Warrior !Rogue
    .goto Dun Morogh,52.0,50.1,75,0
    .goto Dun Morogh,51.5,53.9,75,0
    .goto Dun Morogh,50.1,53.9,75,0
    .goto Dun Morogh,49.9,50.9,75,0
    .goto Dun Morogh,48.0,49.5,75,0
    .goto Dun Morogh,48.2,46.9,75,0
    .goto Dun Morogh,43.5,52.5,75,0
    .goto Dun Morogh,52.0,50.1,75,0
    .goto Dun Morogh,51.5,53.9,75,0
    .goto Dun Morogh,50.1,53.9,75,0
    .goto Dun Morogh,49.9,50.9,75,0
    .goto Dun Morogh,48.0,49.5,75,0
    .goto Dun Morogh,48.2,46.9,75,0
    .goto Dun Morogh,43.5,52.5,75,0
    .goto Dun Morogh,52.0,50.1,75,0
    .goto Dun Morogh,51.5,53.9,75,0
    .goto Dun Morogh,50.1,53.9,75,0
    .goto Dun Morogh,49.9,50.9,75,0
    .goto Dun Morogh,48.0,49.5,75,0
    .goto Dun Morogh,48.2,46.9,75,0
    .goto Dun Morogh,43.5,52.5,75,0
    .goto Dun Morogh,52.0,50.1,0
    .goto Dun Morogh,51.5,53.9,0
    .goto Dun Morogh,50.1,53.9,0
    .goto Dun Morogh,49.9,50.9,0
    .goto Dun Morogh,48.0,49.5,0
    .goto Dun Morogh,48.2,46.9,0
    .goto Dun Morogh,43.5,52.5
    >>击杀|cRXP_ENEMY_黑熊幼崽|r，拾取|cRXP_LOOT_厚熊皮|r
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob +黑熊幼崽
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .mob +峭壁野猪
    .mob +大峭壁野猪
    .collect 2886,6,384,1,1 --Collect Crag Boar Rib (x6)
    .mob +峭壁野猪
    .mob +大峭壁野猪
step << !Paladin !Warrior !Rogue
    #completewith Ribs
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取|cRXP_LOOT_峭壁野猪肋排|r
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
    .mob 大峭壁野猪
step << !Paladin !Warrior !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 对话
    .target 驾驶员贝隆·风箱
    .goto Dun Morogh,49.426,48.410
    .turnin 317 >> 交任务：贝尔丁的补给
    .accept 318 >> 接任务：艾沃沙酒
step << Warrior
    #completewith next
    .goto Dun Morogh,46.9,52.1,20,0
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .vendor >> |cRXP_BUY_购买尽可能多的|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_（量力购买）|r
    .target 旅店老板贝尔姆
step << Priest/Mage/Warlock
    #completewith next
    .goto Dun Morogh,46.9,52.1,20,0
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .vendor >> |cRXP_BUY_购买尽可能多的|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_（量力购买）|r
    .target 旅店老板贝尔姆
step
    #completewith next
    .goto Dun Morogh,42.38,55.28,40 >> 前往 灰色洞穴
step
    .goto Dun Morogh,42.25,53.68,40,0
    .goto Dun Morogh,41.07,49.04,50,0
    .goto Dun Morogh,42.25,53.68
    >>击杀|cRXP_ENEMY_雪怪|r和|cRXP_ENEMY_雪怪幼崽|r，拾取|cRXP_LOOT_雪怪的鬃毛|r
    >>|cRXP_WARN_记得留意|r|T134566:0|t[铜矿]|cRXP_WARN_。采矿可以获得|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_，用于制作|r|T135248:0|t[劣质磨刀石] << Warrior/Rogue
    >>|cRXP_WARN_记得留意|r|T134566:0|t[铜矿]|cRXP_WARN_。采矿可以获得|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_，用于制作|r|T135255:0|t[劣质平衡石] << Paladin
    .complete 313,1 --Collect Wendigo Mane (x8)
    .mob 雪怪
    .mob 雪怪幼崽
step
    .goto Dun Morogh,44.13,56.95
    >>打开|cRXP_PICK_弹药箱|r，拾取|cRXP_LOOT_海格纳的弹药|r
    .complete 5541,1 --Collect Rumbleshot's Ammo (x1)
step
    #label BearFur
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_海格纳·重枪|r
    .target 海格纳·重枪
    .goto Dun Morogh,40.6,62.6,50,0
    .goto Dun Morogh,40.682,65.130
    .turnin 5541 >> 交任务：海格纳的弹药
step << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海格纳·重枪|r交谈
    .goto Dun Morogh,40.682,65.130
    >>|cRXP_BUY_购买并装备一把|r |T135611:0|t[精制短枪]|cRXP_BUY_。若负担不起，请跳过此步骤|r
    .collect 2509,1 -- Ornate Blunderbuss (1)
    .money <0.0414
    .target 海格纳·重枪
step << !Paladin !Warrior !Rogue
    .xp 7 >> 刷到7级
step << Paladin/Warrior/Rogue
    .goto Dun Morogh,51.4,50.4
    >>击杀|cRXP_ENEMY_黑熊幼崽|r，拾取|cRXP_LOOT_厚熊皮|r
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob +黑熊幼崽
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .mob +峭壁野猪
    .mob +大峭壁野猪
    .collect 2886,6,384,1,1 --Collect Crag Boar Rib (x6)
    .mob +峭壁野猪
    .mob +大峭壁野猪
step << Paladin/Warrior/Rogue
    #completewith Ribs
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取|cRXP_LOOT_峭壁野猪肋排|r
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
    .mob 大峭壁野猪
step << Warrior/Paladin/Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 对话
    .target 驾驶员贝隆·风箱
    .goto Dun Morogh,49.426,48.410
    .turnin 317 >> 交任务：贝尔丁的补给
    .accept 318 >> 接任务：艾沃沙酒
step << Warrior/Paladin/Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员迪恩·石轮|r 对话
    .target 驾驶员迪恩·石轮
    .goto Dun Morogh,49.622,48.612
    .turnin 313 >> 交任务：灰色洞穴
step << Warrior/Paladin/Rogue
    .goto Dun Morogh,50.084,49.420
    .collect 2901,1 >> 购买一把矿工锄
step << Warrior/Paladin/Rogue
    #era
    .xp 7 >> 刷到7级
step << Warrior/Rogue
    #som
    .xp 8 >> 击杀附近的怪物，升到8级
step << Rogue
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在后室与 |cRXP_FRIENDLY_霍格拉尔·巴坎|r 对话
    .target 霍格拉尔·巴坎
    .goto Dun Morogh,47.563,52.608
    .trainer >> 学习职业技能
step << Paladin
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在楼上与 |cRXP_FRIENDLY_阿扎尔·战锤|r 对话
    .target 阿扎尔·战锤
    .goto Dun Morogh,47.597,52.070
    .trainer >> 学习职业技能
step << Warrior
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格兰尼斯·快斧|r 对话，位于屋内
    .target 格兰尼斯·快斧
    .goto Dun Morogh,47.360,52.646
    .trainer >> 学习职业技能
step << Gnome Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T135321:0|t[步兵剑]
    .target 格劳恩·索姆温
    .money <0.0536
    .goto Dun Morogh,45.290,52.190
    .collect 2488,1 --Collect Gladius (1)
step << Dwarf Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T132401:0|t[双刃战斧]
    .target 格劳恩·索姆温
    .money <0.0460
    .goto Dun Morogh,45.290,52.190
    .collect 2491,1 --Collect Large Axe (1)
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T135641:0|t[卷刃的剑]
    .target 格劳恩·索姆温
    .money <0.0400
    .goto Dun Morogh,45.290,52.190
    .collect 2494,1 --Collect Stiletto (1)
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T133053:0|t[木槌棒]
    .target 格劳恩·索姆温
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
step << Warrior/Rogue/Paladin
    #completewith next
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .vendor >> |cRXP_BUY_补足至20|r |T133968:0|t[刚出炉的面包] << Warrior/Rogue
    .vendor >> |cRXP_BUY_补足至10|r |T133968:0|t[刚出炉的面包] << Paladin
    .target 旅店老板贝尔姆
step << Paladin/Warrior/Rogue
    #completewith next
    .goto Dun Morogh,43.0,47.4,60,0
    .goto Dun Morogh,39.6,48.9,60,0
    .goto Dun Morogh,37.9,50.8,60,0
    .goto Dun Morogh,34.577,51.652,40 >> 前往 |cRXP_FRIENDLY_图德拉·马克格拉恩|r
    >>击杀沿途遇到的|cRXP_ENEMY_野猪|r、|cRXP_ENEMY_熊|r和|cRXP_ENEMY_狼|r
step << Paladin/Warrior/Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图德拉·马克格拉恩|r 对话
    .target 图德拉·马克格拉恩
    .goto Dun Morogh,43.0,47.4,60,0
    .goto Dun Morogh,39.6,48.9,60,0
    .goto Dun Morogh,34.577,51.652
    .accept 312 >> 接任务：马克格拉恩的干肉
step << !Paladin !Warrior !Rogue
    #completewith next
    .goto Dun Morogh,35.2,56.4,60,0
    .goto Dun Morogh,36.0,52.0,60,0
    .goto Dun Morogh,34.577,51.652,40 >> 前往 |cRXP_FRIENDLY_图德拉·马克格拉恩|r
    >>击杀沿途遇到的|cRXP_ENEMY_野猪|r、|cRXP_ENEMY_熊|r和|cRXP_ENEMY_狼|r
step << !Paladin !Warrior !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图德拉·马克格拉恩|r 对话
    .target 图德拉·马克格拉恩
    .goto Dun Morogh,35.2,56.4,100,0
    .goto Dun Morogh,36.0,52.0,100,0
    .goto Dun Morogh,34.577,51.652
    .accept 312 >> 接任务：马克格拉恩的干肉
step
    #completewith next
    .goto Dun Morogh,30.5,46.0,50 >> 前往 烈酒村
step << !Mage !Priest
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基格·吉布恩|r 对话
    .goto Dun Morogh,30.453,46.005
    .vendor >> |cRXP_WARN_出售杂物|r
    .target 基格·吉布恩
step << Priest/Mage/Warlock
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基格·吉布恩|r 对话
    .goto Dun Morogh,30.453,46.005
    .vendor >> |cRXP_BUY_补足至20|r |T132815:0|t[冰镇牛奶]
    .target 基格·吉布恩
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷杰德·麦酒|r 对话
    .target 雷杰德·麦酒
    .goto Dun Morogh,30.190,45.726
    .turnin 318 >> 交任务：艾沃沙酒
    .accept 319 >> 接任务：艾沃沙酒
    .accept 315 >> 接任务：完美烈酒
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马莱斯·麦酒|r 对话
    .target 马莱斯·麦酒
    .goto Dun Morogh,30.186,45.531
    .accept 310 >> 接任务：针锋相对
step
    #label Ribs
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
    .goto Dun Morogh,28.7,43.7
    >>击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +冰爪熊
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +老峭壁野猪
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +雪豹
step
    >>击杀|cRXP_ENEMY_老峭壁野猪|r，拾取|cRXP_LOOT_峭壁野猪肋排|r
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
    .goto Dun Morogh,28.7,43.7
    .complete 384,1 --Collect Crag Boar Rib (x6)
    .mob 老峭壁野猪
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷杰德·麦酒|r 对话
    .target 雷杰德·麦酒
    .goto Dun Morogh,30.189,45.725
    .turnin 319 >> 交任务：艾沃沙酒
    .accept 320 >> 接任务：艾沃沙酒
step
    .isQuestTurnedIn 384
    .xp 7+4360 >>如果已交还《啤酒烤猪排》，则刷怪直到经验值达到 4360+/4500
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
    .goto Dun Morogh,30.0,51.8
step
    .xp 7+3735 >>刷怪，直到经验值达到 3735+/4500
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
    .goto Dun Morogh,30.0,51.8
step
    #softcore
    .goto Dun Morogh,30.3,37.5,60 >> 跑到此处
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
    .goto Wetlands,11.6,43.4,0
    .deathskip >>继续径直向北跑；当综合聊天频道切换到湿地时，跳下去死亡，然后在米奈希尔港复活
step
    #softcore
    #completewith next
    .goto Wetlands,12.7,46.7,30 >> 游向岸边
step
    #softcore
    .goto Wetlands,9.5,59.7
    .fp Wetlands>> 获取米奈希尔港飞行点
step
	#completewith next
    .hs >> 炉石回卡拉诺斯
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买一杯|r|T132800:0|t[狂想麦酒]|cRXP_BUY_和一杯|r|T132800:0|t[雷霆麦酒]
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .collect 2686,1,311 --Collect Thunder Ale (x1)
    .target 旅店老板贝尔姆
step
    #completewith next
    .goto Dun Morogh,47.779,52.426,6,0
    .goto Dun Morogh,47.644,52.655,3,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的 |cRXP_FRIENDLY_加文·雷酒|r 对话
    .turnin 308 >> 交任务：加文的爱好
    .target 加文·雷酒
step
    .goto Dun Morogh,47.716,52.696
    >>点击地上的 |cRXP_PICK_无人守卫的雷酒桶|r
    .turnin 310 >> 交任务：针锋相对
    .accept 311 >> 接任务：向马莱斯回报
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的 |cRXP_FRIENDLY_拉格纳·雷酒|r 对话
    .target 拉格纳·雷酒
    .goto Dun Morogh,46.825,52.361
    .turnin 384 >> 交任务：啤酒烤猪排
step << !Paladin !Rogue !Warrior
    .xp 8 >> 刷到8级
step << Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格瑞夫|r
    .trainer >> 学习职业技能
    .train 5116>> 学习震荡射击
    .target 格瑞夫
step << Warlock
    .goto Dun Morogh,47.327,53.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吉姆瑞兹·黑轮|r 对话
    .target 吉姆瑞兹·黑轮
    .trainer >> 学习职业技能
    .train 5782 >> 学习|T136183:0|t[恐惧术]
step << Warlock
    .goto Dun Morogh,47.273,53.658
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹尼·血泡|r 对话
    .vendor >> |cRXP_BUY_购买|r |T133738:0|t[魔典：火焰箭（等级2）] |cRXP_BUY_，若负担不起就稍后再买|r
    .target 丹尼·血泡
step << Rogue
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在后室与 |cRXP_FRIENDLY_霍格拉尔·巴坎|r 对话
    .target 霍格拉尔·巴坎
    .goto Dun Morogh,47.563,52.608
    .trainer >> 学习职业技能
step << Paladin
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在楼上与 |cRXP_FRIENDLY_阿扎尔·战锤|r 对话
    .target 阿扎尔·战锤
    .goto Dun Morogh,47.597,52.070
    .trainer >> 学习职业技能
step << Warrior
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格兰尼斯·快斧|r 对话，位于屋内
    .target 格兰尼斯·快斧
    .goto Dun Morogh,47.360,52.646
    .trainer >> 学习职业技能
step << Mage
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在楼上与 |cRXP_FRIENDLY_玛济斯·石衣|r 对话
    .target 玛济斯·石衣
    .goto Dun Morogh,47.498,52.076
    .trainer >> 学习职业技能
    .train 118 >> 学习|T136071:0|t[变形术]
step << Priest
    .xp <8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马克萨恩·安沃尔|r 对话，位于屋内
    .target 马克萨恩·安沃尔
    .goto Dun Morogh,47.342,52.190
    .trainer >> 学习职业技能
step
    .goto Dun Morogh,47.180,52.610
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨姆诺·普尔|r 对话
    .train 3273 >> 学习|T135966:0|t[急救]
    .target 萨姆诺·普尔
step << Gnome Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T135321:0|t[步兵剑]
    .target 格劳恩·索姆温
    .money <0.0536
    .goto Dun Morogh,45.290,52.190
    .collect 2488,1 --Collect Gladius (1)
step << Dwarf Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T132401:0|t[双刃战斧]
    .target 格劳恩·索姆温
    .money <0.0460
    .goto Dun Morogh,45.290,52.190
    .collect 2491,1 --Collect Large Axe (1)
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T135641:0|t[卷刃的剑]
    .target 格劳恩·索姆温
    .money <0.0400
    .goto Dun Morogh,45.290,52.190
    .collect 2494,1 --Collect Stiletto (1)
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买并装备一把|r |T133053:0|t[木槌棒]
    .target 格劳恩·索姆温
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
step << Warrior/Rogue/Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .goto Dun Morogh,47.377,52.523
    .vendor >> |cRXP_BUY_补足至30|r |T133968:0|t[刚出炉的面包] << Warrior/Rogue
    .vendor >> |cRXP_BUY_补足至15|r |T133968:0|t[刚出炉的面包] << Paladin
    .target 旅店老板贝尔姆
step << Priest/Mage/Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话屋内的 |cRXP_FRIENDLY_旅店老板贝尔姆|r
    .target 旅店老板贝尔姆
    .goto Dun Morogh,47.377,52.523
    .vendor >> |cRXP_BUY_补足至30|r |T132815:0|t[冰镇牛奶]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_森内尔·白须|r 对话
    .target 森内尔·白须
    .goto Dun Morogh,46.726,53.826
    .accept 287 >> 接任务：霜鬃巨魔要塞
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员迪恩·石轮|r 对话
    .target 驾驶员迪恩·石轮
    .goto Dun Morogh,49.622,48.612
    .turnin 313 >> 交任务：灰色洞穴
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员贝隆·风箱|r 对话
    .target 驾驶员贝隆·风箱
    .goto Dun Morogh,49.426,48.410
    >>|cRXP_WARN_选择|r |T135637:0|t[露营小刀] |cRXP_WARN_作为奖励。保留这把小刀，之后会用到|r << Rogue
    .turnin 320 >> 交任务：艾沃沙酒
step
    #era << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉兹·滑链|r 对话
    .target 拉兹·滑链
    .goto Dun Morogh,46.005,48.637,10,0
    .goto Dun Morogh,45.846,49.365
    .accept 412 >> 接任务：自动净化装置
step
    #completewith next
    .goto Dun Morogh,43.1,45.0,20,0
    .goto Dun Morogh,42.1,45.4,20 >> 前往闪耀山脊, 沿箭头指示跑上山
step
    .goto Dun Morogh,40.9,45.3,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,42.1,34.3,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,40.9,45.3
    .goto Dun Morogh,39.5,43.0,0
    .goto Dun Morogh,41.5,36.0,0
    >>击杀|cRXP_ENEMY_霜鬃先知|r，拾取|cRXP_LOOT_微光草|r
    >>|cRXP_LOOT_微光草|r也可以从地上的|cRXP_PICK_微光草篮|r中拾取
    .complete 315,1 --Collect Shimmerweed (x6)
    .mob 霜鬃先知
step << !Mage !Warlock
    .goto Dun Morogh,38.517,53.927
    >>打开 |cRXP_PICK_马克格拉恩的储肉柜|r, 获取 |cRXP_LOOT_马克格拉恩的干肉|r
    >>|cRXP_WARN_等|cRXP_ENEMY_冰须|r 巡逻出洞穴。一旦他离开洞穴， 你就可以偷偷进入并打开|r |cRXP_PICK_马克格拉恩的储肉柜|r
    .link https://www.youtube.com/watch?v=o55Y3LjgKoE >> |cRXP_WARN_点击此处观看示范视频|r
    .complete 312,1 --MacGrann's Dried Meats (1)
step << Mage/Warlock
    .goto Dun Morogh,38.517,53.927
    >>|cRXP_WARN_施放|r|T136071:0|t[变形术]|cRXP_WARN_，目标为|r|cRXP_ENEMY_冰须|r << Mage
    >>|cRXP_WARN_施放|r|T136183:0|t[恐惧术]|cRXP_WARN_，目标为|r|cRXP_ENEMY_冰须|r << Warlock
    >>打开|cRXP_PICK_马克格拉恩的储肉柜|r，拾取|cRXP_LOOT_马克格拉恩的干肉|r
    .complete 312,1 --Collect MacGrann's Dried Meats (x1)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图德拉·马克格拉恩|r 对话
    .target 图德拉·马克格拉恩
    .goto Dun Morogh,34.577,51.652
    .turnin 312 >> 交任务：马克格拉恩的干肉
step << Mage/Priest/Warlock
    #completewith next
    .goto Dun Morogh,30.453,46.005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基格·吉布恩|r 对话
    .vendor >> |cRXP_BUY_最多再购买10瓶|r |T132815:0|t[冰镇牛奶]
    .target 基格·吉布恩
step << Warrior/Paladin/Rogue
    #completewith next
    .goto Dun Morogh,30.453,46.005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基格·吉布恩|r 对话
    .vendor >> |cRXP_WARN_出售杂物|r
    .target 基格·吉布恩
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷杰德·麦酒|r 对话
    .target 雷杰德·麦酒
    .goto Dun Morogh,30.189,45.725
    .turnin 315 >> 交任务：完美烈酒
    .accept 413 >> 接任务：微光酒
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马莱斯·麦酒|r 对话
    .target 马莱斯·麦酒
    .goto Dun Morogh,30.186,45.531
    .turnin 311 >> 交任务：向马莱斯回报
step
    #era << Warlock
    .goto Dun Morogh,27.2,43.0,60,0
    .goto Dun Morogh,24.8,39.3,60,0
    .goto Dun Morogh,25.6,43.4,60,0
    .goto Dun Morogh,24.3,44.0,60,0
    .goto Dun Morogh,25.4,45.4,60,0
    .goto Dun Morogh,25.00,43.50
    >>击杀|cRXP_ENEMY_麻疯侏儒|r，拾取|cRXP_LOOT_多档齿轮|r和|cRXP_LOOT_自适应齿轮|r
    .complete 412,2 --Collect Gyromechanic Gear (x8)
    .complete 412,1 --Collect Restabilization Cog (x8)
    .mob 麻疯侏儒
step
    #era
    .xp 9 >> 刷到9级
step
    #completewith next
    .goto Dun Morogh,24.509,50.831,20 >> 进入霜鬃巨魔要塞
step
    #completewith next
    >>击杀|cRXP_ENEMY_霜鬃猎头者|r
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob 霜鬃猎头者
step
    #hardcore
    >>|cRXP_WARN_从此处跳下，探索霜鬃巨魔要塞。如果下方有怪物，请按正常路线清怪，不要跳下去|r
    .goto Dun Morogh,22.86,52.16
    .complete 287,2 --Fully explore Frostmane Hold
step << Hunter
    #completewith next
    .xp 10-2325
step
    .goto Dun Morogh,24.5,50.8,40,0
    .goto Dun Morogh,22.1,50.3,40,0
    .goto Dun Morogh,21.3,52.9,40,0
    .goto Dun Morogh,24.5,50.8,0
    .goto Dun Morogh,22.1,50.3,0
    .goto Dun Morogh,21.3,52.9,0
    >>击杀|cRXP_ENEMY_霜鬃猎头者|r
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob 霜鬃猎头者
step << Hunter
    .xp 10-1400
step
    #hardcore
	#completewith next
	.hs >> 炉石回卡拉诺斯
	.cooldown item,6948,>0,1
step
    #hardcore
    #completewith next
   .goto Dun Morogh,46.726,53.826,150 >> 前往卡拉诺斯
step << Hunter
   .goto Dun Morogh,46.005,48.637,8,0
   .goto Dun Morogh,45.846,49.365
   >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉兹·滑链|r 对话
   .target 拉兹·滑链
   .turnin 412 >> 交任务：自动净化装置
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_森内尔·白须|r 对话
    .target 森内尔·白须
    .goto Dun Morogh,46.726,53.826
    .turnin 287 >> 交任务：霜鬃巨魔要塞
    .accept 291 >> 接任务：森内尔的报告
step << Rogue
    #level 10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在后室与 |cRXP_FRIENDLY_霍格拉尔·巴坎|r 对话
    .target 霍格拉尔·巴坎
    .goto Dun Morogh,47.563,52.608
    .accept 2218 >> 接任务：救赎之路
step
    .goto Dun Morogh,47.180,52.610
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨姆诺·普尔|r 对话
    .train 3273 >> 学习|T135966:0|t[急救]
    .target 萨姆诺·普尔
step << !Hunter
    .goto Dun Morogh,46.005,48.637,8,0
    .goto Dun Morogh,45.846,49.365
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉兹·滑链|r 对话
    .target 拉兹·滑链
    .turnin 412 >> 交任务：自动净化装置
    .isOnQuest 412
step << Hunter
    .goto Dun Morogh,45.810,53.039
    .target 格瑞夫
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .accept 6064 >>接受任务 驯服野兽
step << Hunter
    .goto Dun Morogh,48.3,56.9
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_，目标为一只|r|cRXP_ENEMY_大峭壁野猪|r
    .complete 6064,1 --Tame a Large Crag Boar (1)
    .mob 大峭壁野猪
step << Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6064 >>交任务 驯服野兽
    .target 格瑞夫
    .accept 6084 >>接受任务 驯服野兽
step << Hunter
    .goto Dun Morogh,49.4,59.4
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_，目标为一只|r|cRXP_ENEMY_雪豹|r
    .complete 6084,1 --Tame a Snow Leopard (1)
    .mob 雪豹
step << Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6084 >>交任务 驯服野兽
    .target 格瑞夫
    .accept 6085 >>接受任务 驯服野兽
step << Hunter
    .goto Dun Morogh,50.4,59.7
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_，目标为一只|r|cRXP_ENEMY_冰爪熊|r
    .complete 6085,1 --Tame an Ice Claw Bear (1)
    .mob 冰爪熊
step << Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6085 >>交任务 驯服野兽
    .target 格瑞夫
    .accept 6086 >>接受任务 训练野兽
step << Warrior
    #sticky
    #completewith next
    .money >0.1030
    +|cRXP_WARN_刷怪，直到拥有 10 银币 30 铜币，再跑进铁炉堡|r
step << Warrior/Hunter
    .goto Dun Morogh,47.58,41.58,40,0
    .goto Dun Morogh,50.19,40.79,20,0
    .goto Ironforge,14.90,87.10,40 >> 前往铁炉堡
step << Hunter
    .goto Ironforge,70.86,85.83
    .target 贝莉亚·雷岩
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贝莉亚·雷岩|r 对话
    .turnin 6086 >> 交任务：训练野兽
step << Warrior
    .goto Ironforge,62.237,89.628
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克斯|r交谈
    .trainer >>学习投掷
    .target 比克斯
step << Warrior
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r |T135641:0|t[平衡飞刀] 并装备|r
    .target 布雷文·寒钢
step << Warrior/Hunter
    #completewith next
	.goto Dun Morogh,53.5,34.9,60,0
    .goto Dun Morogh,52.90,35.62
    .zone Dun Morogh >> 离开铁炉堡
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁德拉·冻石|r 对话
    .target 鲁德拉·冻石
    .goto Dun Morogh,60.1,52.6,50,0
    .goto Dun Morogh,63.082,49.851
    .accept 314 >> 接任务：保护牲畜
step
    #completewith next
    .goto Dun Morogh,62.3,50.3,14,0
    .goto Dun Morogh,62.2,49.4,10 >>从这段山坡跑上去
step
    .goto Dun Morogh,62.6,46.1
    >>击杀 |cRXP_ENEMY_瓦加什|r。拾取他的 |cRXP_LOOT_瓦加什的牙齿|r
    >>|cRXP_WARN_这个任务有点难。如有需要请组队完成。如果你既找不到队伍，也无法单独击杀他，就跳过这一步|r
    >>|cRXP_WARN_请先看以下的短视频，然后再击杀 |cRXP_ENEMY_瓦加什|r。任何职业都可以单刷它|r
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >> |cRXP_WARN_点击此处观看示范视频|r
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob 瓦加什
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁德拉·冻石|r 对话
    >>|cRXP_WARN_选择|r|T133052:0|t[|cRXP_FRIENDLY_寒脊之锤|r]|cRXP_WARN_作为奖励。暂时无法装备也没关系，你很快就会学习双手锤（2H）！|r << Warrior
    .target 鲁德拉·冻石
    .goto Dun Morogh,63.082,49.851
    .turnin 314 >> 交任务：保护牲畜
    .isQuestComplete 314
step
    #completewith next
    .goto Dun Morogh,68.5,54.6,60 >> 前往古博拉采掘场
step
    .goto Dun Morogh,68.379,54.492
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师格瑞姆|r 对话
    .train 2550 >> 学习|T133971:0|t[烹饪]
    .target 厨师格瑞姆
step
    .goto Dun Morogh,68.6,54.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡杉·莫格什|r 对话
    .vendor >> |cRXP_BUY_购买|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_（按需购买）|r << Warrior/Rogue
    .vendor >> |cRXP_BUY_购买|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_和|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_（按需购买）|r << !Warrior !Rogue
    .target 卡杉·莫格什
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_参议员梅尔·圣石|r 和 |cRXP_FRIENDLY_工头乔尼·石眉|r 对话
    .accept 433 >> 接任务：公众之仆
    .target +参议员梅尔·圣石
    .goto Dun Morogh,68.671,55.969
    .accept 432 >> 接任务：该死的石腭怪！
    .goto Dun Morogh,69.084,56.330
    .target +工头乔尼·石眉
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头乔尼·石眉|r 和 |cRXP_FRIENDLY_参议员梅尔·圣石|r 对话
    .turnin 432 >> 交任务：该死的石腭怪！
    .target +工头乔尼·石眉
    .goto Dun Morogh,69.084,56.330
    .turnin 433 >> 交任务：公众之仆
    .goto Dun Morogh,68.671,55.969
    .target +参议员梅尔·圣石
step
    #era
    .goto Dun Morogh,67.1,59.7
    .xp 10 >> 刷到10级
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员塞克·锤足|r 对话
    .target 驾驶员塞克·锤足
    .goto Dun Morogh,83.892,39.188
    .accept 419 >> 接任务：失踪的驾驶员
step
    >>点击|cRXP_PICK_矮人尸体|r
    .goto Dun Morogh,79.672,36.171
    .turnin 419 >> 交任务：失踪的驾驶员
    .accept 417 >> 接任务：驾驶员的复仇
step
    >>击杀|cRXP_ENEMY_癞爪|r，拾取|cRXP_LOOT_肮脏的爪子|r
    .goto Dun Morogh,78.97,37.14
    .complete 417,1 --Collect Mangy Claw (x1)
    .mob 癞爪
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_驾驶员塞克·锤足|r 对话
    .target 驾驶员塞克·锤足
    .goto Dun Morogh,83.892,39.188
    .turnin 417 >> 交任务：驾驶员的复仇
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人维拉特·麦酒|r 对话
    .target 巡山人维拉特·麦酒
    .goto Dun Morogh,79.6,50.7,50,0
    .goto Dun Morogh,82.3,53.5,25,0
    .goto Dun Morogh,86.278,48.812
    .turnin 413 >> 交任务：微光酒
    .accept 414 >> 接任务：卡德雷尔的酒
step
    #completewith next
    .goto Dun Morogh,86.203,51.260,15,0
    .goto Loch Modan,22.071,73.127,200 >> 前往洛克莫丹
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人库伯弗林特|r 对话
    .target 巡山人库伯弗林特
    .goto Loch Modan,22.071,73.127
    .accept 224 >> 接任务：保卫国王的领土
step
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在地堡里与 |cRXP_FRIENDLY_拉格弗斯上尉|r 对话
    .target 拉格弗斯上尉
    .accept 267 >> 接任务：穴居人的威胁
step
    #completewith HonorStudents
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡德雷尔|r 对话
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_会沿着穿过塞尔萨玛的道路巡逻|r
    .turnin 414 >> 交任务：卡德雷尔的酒
    .accept 416 >> 接任务：狗头人的耳朵
    .accept 1339 >> 接任务：巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维德拉·壁炉|r 对话
    .target 维德拉·壁炉
    .goto Loch Modan,34.828,49.283
    .accept 418 >> 接任务：塞尔萨玛血肠
step
    #completewith next
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅尼·铁心|r 对话
    .vendor >> |cRXP_BUY_购买一个|r |T133634:0|t[棕色小包] |cRXP_BUY_（按需购买）|r
    .target 雅尼·铁心
step << !Paladin
    .goto Loch Modan,35.534,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r 对话
    .home >> 将炉石绑定在塞尔萨玛
    .target 旅店老板纳克罗·壁炉
step
    #label HonorStudents
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.019,47.806
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布洛克·寻石者|r 对话
    .accept 6387 >> 接任务：荣誉学员
    .target 布洛克·寻石者
step
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡德雷尔|r 对话
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_会沿着穿过塞尔萨玛的道路巡逻|r
    .turnin 414 >> 交任务：卡德雷尔的酒
    .accept 416 >> 接任务：狗头人的耳朵
    .accept 1339 >> 接任务：巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔
step << skip
    #sticky
    #completewith next
    +刷怪，直到现钱与可出售物品的总价值至少达到 33 银币
--N rogue money gate for cutlass+1h swords
step
    #completewith Thelsamar1
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r，拾取|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|cRXP_LOOT_蜘蛛的毒液|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
    >>|cRXP_WARN_保留所有|r|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，以后用来提升|T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_现在不用特意完成此任务，你很快还会返回洛克莫丹|r
step
    #completewith next
    .goto Loch Modan,23.85,17.92,100 >> 向北前往阿尔加兹兵站
step
.group
    .goto Loch Modan,24.764,18.397
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r 对话
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务
    .accept 1338 >> 接任务：卡尔·雷矛的订单
    .accept 307 >> 接任务：肮脏的爪子
    .target 巡山人卡尔·雷矛
step
.solo
    .goto Loch Modan,24.764,18.397
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r 对话
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务
    .accept 1338 >> 接任务：卡尔·雷矛的订单
    .target 巡山人卡尔·雷矛
step
    #softcore
    #completewith next
    .deathskip >> 死一次, 然后在塞尔萨玛复活
step
    .isQuestComplete 418
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维德拉·壁炉|r 对话
    .target 维德拉·壁炉
    .goto Loch Modan,34.828,49.283
    .turnin 418 >> 交任务：塞尔萨玛血肠
step
    #label Thelsamar1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与 |cRXP_FRIENDLY_索格拉姆·伯雷森|r 对话
    .target 索格拉姆·伯雷森
    .goto Loch Modan,33.938,50.954
    .turnin 6387 >> 交任务：荣誉学员
    .accept 6391 >> 接任务：飞往铁炉堡
step
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与 |cRXP_FRIENDLY_索格拉姆·伯雷森|r 对话
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高尼尔·石趾|r 对话
    .target 高尼尔·石趾
    .goto Ironforge,51.521,26.311
    .turnin 6391 >> 交任务：飞往铁炉堡
    .accept 6388 >> 接任务：格莱斯·瑟登
step << Hunter
    >>|cRXP_WARN_不要飞往任何地方|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与 |cRXP_FRIENDLY_格莱斯·瑟登|r 对话
    .target 格莱斯·瑟登
    .goto Ironforge,55.501,47.742
    .turnin 6388 >> 交任务：格莱斯·瑟登
    .accept 6392 >> 接任务：向布洛克回复
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_参议员巴林·红石|r 对话
    .target 参议员巴林·红石
    .goto Ironforge,43.64,50.63,20,0
    .goto Ironforge,39.550,57.490
    .turnin 291 >> 交任务：森内尔的报告
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布里维夫·石手|r交谈
    >>|cRXP_WARN_如果之前没有装备，现在就装备|r|T133052:0|t[|cRXP_FRIENDLY_寒脊之锤|r]|cRXP_WARN_|r
    .target 布里维夫·石手
    .goto Ironforge,61.181,89.514
    .trainer >>学习双手锤（2H）
step << !Hunter
    >>|cRXP_WARN_不要飞往任何地方|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与 |cRXP_FRIENDLY_格莱斯·瑟登|r 对话
    .target 格莱斯·瑟登
    .goto Ironforge,55.501,47.742
    .turnin 6388 >> 交任务：格莱斯·瑟登
    .accept 6392 >> 接任务：向布洛克回复
step << !Hunter skip
    #completewith next
    +跳到一只狮鹫头上, 然后登出再登录, 就能跳过这一段
    .link https://www.youtube.com/watch?v=PWMJhodh6Bw >> |cRXP_WARN_点击这里查看视频参考|r
    .zoneskip Ironforge,1
step
    .goto Ironforge,78.00,52.00,5,0
    >>|cRXP_WARN_进入矿道地铁|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与中站台上的 |cRXP_FRIENDLY_蒙提|r 对话
    .target 蒙提
    .accept 6661 >> 接任务：捕捉矿道老鼠
step
    .use 17117 >>|cRXP_WARN_使用|r|T133942:0|t[捕鼠者之笛]|cRXP_WARN_，目标为|r|cRXP_ENEMY_矿道老鼠|r
    .complete 6661,1 --Rats Captured (x5)
    .mob 矿道老鼠
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒙提|r 对话
    .target 蒙提
    .turnin 6661 >> 交任务：捕捉矿道老鼠
    .timer 11,捕捉矿道老鼠剧情表演
    .accept 6662 >> 接任务：我的兄弟，尼普希
step
    #completewith next
    .zone Stormwind City >> 乘地铁前往暴风城
    >>|cRXP_WARN_在等待地铁期间，如有需要可提升你的 |r|T135966:0|t[急救]|cRXP_WARN_ 和 |r|T133971:0|t[烹饪] |cRXP_WARN_技能|r
    >>|cRXP_WARN_你需要将|r |T135966:0|t[急救]|cRXP_WARN_ 提升至 80，以完成 24 级的一个任务|r << Rogue !Dwarf
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t当你下列车后与 |cRXP_FRIENDLY_尼普希|r 对话
    >>|cRXP_FRIENDLY_尼普希|r |cRXP_WARN_位于中央平台上|r
    .turnin 6662 >> 交任务：我的兄弟，尼普希
    .target 尼普希
step
    .zone Stormwind City >> 进入暴风城
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格瑞曼德·艾尔默|r 对话
    .target 格瑞曼德·艾尔默
    .goto StormwindClassic,51.757,12.091
    .accept 353 >> 接任务：雷矛的包裹
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗伦·长须|r 对话
    .target 弗伦·长须
    .goto StormwindClassic,58.091,16.552
    .turnin 1338 >> 交任务：卡尔·雷矛的订单
step << Priest
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >> 前往 [暴风城大教堂]
step << Priest
    .goto StormwindClassic,38.58,26.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 对话
    .accept 5634 >> 接任务：绝望祷言
    .target 高阶牧师劳瑞娜
    .isNotOnQuest 5635,5636,5637,5638,5639,5640
    .train 13908,1

step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 对话
    .target 高阶牧师劳瑞娜
    .goto StormwindClassic,38.58,26.06
    .trainer >> 学习职业技能
    .turnin -5634 >> 交任务：绝望祷言
    .turnin -5635 >> 交任务：绝望祷言
    .turnin -5636 >> 交任务：绝望祷言
    .turnin -5637 >> 交任务：绝望祷言
    .turnin -5638 >> 交任务：绝望祷言
    .turnin -5639 >> 交任务：绝望祷言
    .turnin -5640 >> 交任务：绝望祷言
step << Priest
    .goto StormwindClassic,38.62,26.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 对话
    .train 13908 >> 学习绝望祷言
    .target 高阶牧师劳瑞娜
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊尔萨·考宾|r 对话
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.503,45.712
    .trainer >> 学习职业技能
    .accept 1638 >> 接任务：战士的训练
    .target 伊尔萨·考宾
step << Warrior
    #completewith next
    .goto StormwindClassic,72.878,51.582,17,0
    .goto StormwindClassic,71.7,39.9,12 >> 进入酒馆
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈里·伯加德|r 对话
    .target 哈里·伯加德
    .goto StormwindClassic,74.249,37.244
    .turnin 1638 >> 交任务：战士的训练
    .accept 1639 >> 接任务：醉鬼巴特莱比
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴特莱比|r 对话
    .target 巴特莱比
    .goto StormwindClassic,73.787,36.323
    .turnin 1639 >> 交任务：醉鬼巴特莱比
    .accept 1640 >> 接任务：击败巴特莱比
step << Warrior
    .goto StormwindClassic,73.787,36.323
    >>攻击|cRXP_ENEMY_巴特莱比|r，他会在生命值降至 1% 时认输
    .complete 1640,1 --Beat Bartleby
    .mob 巴特莱比
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴特莱比|r 对话
    .target 巴特莱比
    .goto StormwindClassic,73.787,36.323
    .turnin 1640 >> 交任务：击败巴特莱比
    .accept 1665 >> 接任务：巴特莱比的酒杯
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈里·伯加德|r 对话
    .target 哈里·伯加德
    .goto StormwindClassic,74.249,37.244
    .turnin 1665 >> 交任务：巴特莱比的酒杯
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往 [已宰的羔羊] 术士训练师处并下楼
step << Warlock
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄苏拉·德林|r 对话
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 对话
    .accept 1688 >> 接任务：苏伦娜·凯尔东
    .target 黑暗缚灵者加科因
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .target 吴平
    .goto StormwindClassic,57.129,57.698
    .trainer >>学习单手剑（1H） << Rogue/Mage
    .trainer >>学习法杖 << Priest
    .trainer >>学习单手剑（1H）和法杖 << Warlock
    .trainer >>学习双手剑（2H） << Warrior/Paladin
step << Dwarf Paladin
    .goto StormwindClassic,52.623,65.701
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与 |cRXP_FRIENDLY_旅店老板奥里森|r 对话
    .home >> 将炉石绑定在暴风城
    .target 旅店老板奥里森
step << Rogue
    .money <0.2000
    .goto StormwindClassic,57.547,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_冈瑟尔·维勒|r 对话
    .target 冈瑟尔·维勒
    .vendor >> |cRXP_WARN_购买|r |T135346:0|t[斗士短剑] |cRXP_WARN_并装备在主手。将之前获得的|r |T135641:0|t[|cRXP_FRIENDLY_露营小刀|r] |cRXP_WARN_装备在副手|r
step << Rogue
    .goto StormwindClassic,57.32,62.08,20,0
    .goto StormwindClassic,58.362,61.678
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔曼·穆比|r 对话
    .vendor >> |cRXP_BUY_购买|r |T135425:0|t[锋利的飞刀]|cRXP_BUY_，达到11级时装备|r
    .target 萨尔曼·穆比
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（联盟）
#hardcore
#era/som--h
#classic
#tbc
<< Alliance
#name 10-11 Elwynn (Dwarf/Gnome)
#title 艾尔文森林
#version 1
#group RestedXP Survival Guide (A)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
#defaultfor Gnome/Dwarf
#next 11-13 Loch Modan (Dwarf/Gnome)
#displayname 10-11 艾尔文森林（矮人/侏儒）
step
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 对话
    .fp Stormwind >> 获取暴风城飞行点
    .target 杜加尔·朗德瑞克
step
    #completewith next
    .goto Elwynn Forest,42.107,65.930,100 >> 前往闪金镇
step
    .goto Elwynn Forest,42.107,65.930
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官杜汉|r 对话
    .target 治安官杜汉
    .accept 62 >> 接任务：法戈第矿洞
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威廉·匹斯特|r 对话
    .target 威廉·匹斯特
    .goto Elwynn Forest,43.318,65.705
    .accept 60 >> 接任务：狗头人的蜡烛
step << Mage/Rogue
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >> 前往旅店二楼
step << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r 对话
    .target 扎尔迪玛·维夫希尔特
    .goto Elwynn Forest,43.25,66.19
    .trainer >> 学习职业技能
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科瑞恩·塞尔留斯|r 对话
    .target 科瑞恩·塞尔留斯
    .goto Elwynn Forest,43.872,65.937
    .trainer >> 学习职业技能
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷米|r 对话
    .target 雷米
    .goto Elwynn Forest,42.140,67.254
    .accept 40 >> 接任务：鱼人的威胁
    .accept 47 >> 接任务：金砂交易
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与 |cRXP_FRIENDLY_斯通菲尔德妈妈|r 和 |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r 对话
    .accept 88 >> 接任务：公主必须死！
    .target +斯通菲尔德妈妈
    .goto Elwynn Forest,34.660,84.483
    .accept 85 >> 接任务：丢失的项链
    .target +波尼斯·斯通菲尔德姑妈
    .goto Elwynn Forest,34.486,84.252
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利·马科伦|r 对话
    .target 比利·马科伦
    .goto Elwynn Forest,43.131,85.722
    .turnin 85 >> 交任务：丢失的项链
    .accept 86 >> 接任务：比利的馅饼
step
    .goto Elwynn Forest,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_梅贝尔·马科伦|r 对话
    .accept 106 >> 接任务：年轻的恋人
    .target 梅贝尔·马科伦
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托米·乔·斯通菲尔德|r 对话
    .goto Elwynn Forest,29.840,85.997
    .turnin 106 >> 交任务：年轻的恋人
    .accept 111 >> 接任务：托米的祖母
    .target 托米·乔·斯通菲尔德
step
    .goto Elwynn Forest,34.486,84.252
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r 对话
    >>|cRXP_WARN_如果你没有足够的[大块野猪肉]，就暂时跳过交任务|r
    .turnin 86 >> 交任务：比利的馅饼
    .isQuestComplete 86
    .target 波尼斯·斯通菲尔德姑妈
step
    .goto Elwynn Forest,34.943,83.861
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莱德·斯通菲尔德|r 对话
    .turnin 111 >> 交任务：托米的祖母
    .accept 107 >> 接任务：给威廉·匹斯特的信
    .target 米莱德·斯通菲尔德
step
    #completewith next
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r，拾取|cRXP_LOOT_大蜡烛|r和|cRXP_LOOT_金砂|r
    >>|cRXP_WARN_做这个任务时，5级怪物可能会变为灰色。仍须完成任务，才能解锁后续任务|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob 狗头人隧道工
    .mob 狗头人矿工
step
    .goto Elwynn Forest,40.5,82.3
    >>|cRXP_WARN_进入并探索法戈第矿洞|r
    .complete 62,1 --Scout Through the Fargodeep Mine
step
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76,25,0
    .goto Elwynn Forest,40.5,82.3,25,0
    .goto Elwynn Forest,37.71,83.76,25,0
    .goto Elwynn Forest,40.5,82.3
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r，拾取|cRXP_LOOT_大蜡烛|r和|cRXP_LOOT_金砂|r
    >>|cRXP_WARN_做这个任务时，5级怪物可能会变为灰色。仍须完成任务，才能解锁后续任务|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob 狗头人隧道工
    .mob 狗头人矿工
step
    #completewith next
    .goto Elwynn Forest,42.20,66.00,100 >> 前往闪金镇
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷米|r 对话
    >>|cRXP_WARN_不要出售|r |T133581:0|t[弹子球] |cRXP_WARN_这个任务奖励是一件非常有价值的道具，一直到 60 级都很有用|r
    .target 雷米
    .goto Elwynn Forest,42.140,67.254
    .turnin 47 >> 交任务：金砂交易
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官杜汉|r 对话
    .target 治安官杜汉
    .goto Elwynn Forest,42.108,65.928
    .turnin 62 >> 交任务：法戈第矿洞
    .accept 76 >> 接任务：玉石矿洞
    .turnin 40 >> 交任务：鱼人的威胁
    .accept 35 >> 接任务：卫兵托马斯
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威廉·匹斯特|r 对话
    .target 威廉·匹斯特
    .goto Elwynn Forest,43.318,65.705
    .turnin 60 >> 交任务：狗头人的蜡烛
    .accept 61 >> 接任务：送往暴风城的货物
    .turnin 107 >> 交任务：给威廉·匹斯特的信
    .accept 112 >> 接任务：收集海藻
step
    >>击杀|cRXP_ENEMY_鱼人|r和|cRXP_ENEMY_鱼人士兵|r，拾取|cRXP_LOOT_水晶藻叶|r
    .goto Elwynn Forest,47.6,63.3,60,0
    .goto Elwynn Forest,51.4,64.6,60,0
    .goto Elwynn Forest,57.6,62.8,60,0
    .goto Elwynn Forest,56.4,66.6,60,0
    .goto Elwynn Forest,53.8,66.8,60,0
    .goto Elwynn Forest,57.6,62.8
    .complete 112,1 --Collect Crystal Kelp Frond (x4)
	.mob 鱼人
	.mob 鱼人士兵
step
    #completewith next
    .goto Elwynn Forest,61.654,53.608,15 >> 进入 [玉石矿洞]
step
    >>|cRXP_WARN_沿中间的道路前进，探索玉石矿洞|r
    >>|cRXP_WARN_目标完成后立即离开玉石矿洞|r
    .goto Elwynn Forest,60.4,50.2
    .complete 76,1 --Scout through the Jasperlode Mine
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵托马斯|r 对话
    .target 卫兵托马斯
    .goto Elwynn Forest,73.973,72.179
    .turnin 35 >> 交任务：卫兵托马斯
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵托马斯|r 对话
    .target 卫兵托马斯
    .goto Elwynn Forest,73.973,72.179
    .accept 37 >> 接任务：失踪的卫兵
    .accept 52 >> 接任务：保卫边境
step
    #era
    #completewith Prowlers
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    >>|cRXP_WARN_优先击杀沿途看到的|cRXP_ENEMY_森林熊幼崽|r|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +觅食的灰狼
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob +森林熊幼崽
step
    #era
    >>点击地上的 |cRXP_PICK_被吃掉一半的尸体|r
    .goto Elwynn Forest,72.656,60.334
    .turnin 37 >> 交任务：失踪的卫兵
    .accept 45 >> 接任务：罗尔夫的下落
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_管理员莱琳|r 对话
    .target 管理员莱琳
    .goto Elwynn Forest,81.382,66.112
    .accept 5545 >> 接任务：木材危机
step
    #era
    #completewith Bundles
    >>拾取地上的|cRXP_LOOT_一捆木柴|r，|cRXP_WARN_它们位于树下|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    #era
    #label Prowlers
    .goto Elwynn Forest,79.80,55.50
    >>点击地上的 |cRXP_PICK_罗尔夫的尸体|r
    >>|cRXP_WARN_小心！附近的 |cRXP_ENEMY_鱼人|r 可能会在你点击|r |cRXP_PICK_罗尔夫的尸体|r 后攻击你
    >>|cRXP_ENEMY_鱼人强盗|r |cRXP_WARN_会施放|r |T135915:0|t[喝下初级药水] |cRXP_WARN_，为自己恢复61-68点生命值|r
    .turnin 45 >> 交任务：罗尔夫的下落
    .accept 71 >> 接任务：回复托马斯
step
    #era
    #label Bundles
    .goto Elwynn Forest,76.7,75.6,60,0
    .goto Elwynn Forest,79.7,83.7,60,0
    .goto Elwynn Forest,82.0,76.8,60,0
    .goto Elwynn Forest,76.7,75.6,60,0
    .goto Elwynn Forest,79.7,83.7,60,0
    .goto Elwynn Forest,82.0,76.8,60,0
    .goto Elwynn Forest,86.99,64.83
    >>击杀|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_森林熊幼崽|r
    .complete 52,1 --Kill Prowler (x8)
    .mob +觅食的灰狼
    .complete 52,2 --Kill Young Forest Bear (x5)
    .mob 森林熊幼崽
step
    #era
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4
    >>拾取地上的|cRXP_LOOT_一捆木柴|r，|cRXP_WARN_它们位于树下|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_管理员莱琳|r 对话
    .target 管理员莱琳
    .goto Elwynn Forest,81.382,66.112
    .turnin 5545 >> 交任务：木材危机
step
    #era
    #label Bears
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨拉·迪博雷恩|r 对话
    .target 萨拉·迪博雷恩
    .goto Elwynn Forest,79.457,68.789
    .accept 83 >> 接任务：红色亚麻布
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵托马斯|r 对话
    .target 卫兵托马斯
    .goto Elwynn Forest,73.973,72.179
    .turnin 52 >> 交任务：保卫边境
    .turnin 71 >> 交任务：回复托马斯
    .accept 39 >> 接任务：托马斯的报告
    .accept 109 >> 接任务：向格里安·斯托曼报到
step << Warlock
    .goto Elwynn Forest,71.10,80.66
    >>击杀|cRXP_ENEMY_苏伦娜·凯尔东|r，拾取|cRXP_LOOT_苏伦娜的项圈|r
    >>|cRXP_WARN_集中火力，迅速击杀|cRXP_ENEMY_苏伦娜·凯尔东|r|r
    >>|cRXP_WARN_施放|r|T136183:0|t[恐惧术]|cRXP_WARN_，持续控制|cRXP_ENEMY_收货人莫根|r|r
    .complete 1688,1 --Surena's Choker (1)
    .mob 苏伦娜·凯尔东
step
    #era
    #completewith next
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r，拾取|cRXP_LOOT_红色亚麻面罩|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .mob 迪菲亚强盗
step
    .goto Elwynn Forest,69.3,79.0
    >>击杀|cRXP_ENEMY_公主|r，拾取它的|cRXP_LOOT_黄铜项圈|r
    >>|cRXP_ENEMY_公主|r|cRXP_WARN_会和两只|r|cRXP_ENEMY_公主的随从|r一同进入战斗
    >>|cRXP_ENEMY_公主|r|cRXP_WARN_还会施放|r|T132368:0|t[急速冲锋]|cRXP_WARN_，造成大量伤害|r
    .complete 88,1
    .mob 公主
step
    #completewith next
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r。拾取他们身上的 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r]
    .use 1972>>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] 来接取任务|r
    >>|cRXP_WARN_这个|r|T134939:0|t[|cRXP_LOOT_西部荒野地契|r] |cRXP_WARN_的掉率非常低。如果没有获得，可忽略此步骤|r
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >> 接任务：法布隆的地契
step
    #era
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r，拾取|cRXP_LOOT_红色亚麻面罩|r
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
    .goto Elwynn Forest,69.3,79.0
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .mob 迪菲亚强盗
step
    #era
    #softcore
    #sticky
    #completewith next
    .goto Elwynn Forest,83.6,69.7,120 >>生命值较低时，可死亡后在灵魂医者处复活；否则直接跑回去交任务
step
    #era
    #label Deed
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨拉·迪博雷恩|r 对话
    .target 萨拉·迪博雷恩
    .goto Elwynn Forest,79.457,68.789
    .turnin 83 >> 交任务：红色亚麻布
step
    #completewith next
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >> 前往赤脊山
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卫兵帕克|r 对话
    .target 卫兵帕克
    .goto Redridge Mountains,17.4,69.6
    .accept 244 >> 接任务：豺狼人的入侵
step
    .goto Redridge Mountains,18.581,69.208,15,0
    .goto Redridge Mountains,23.325,71.373,25,0
    .goto Redridge Mountains,29.565,67.930,25,0
    .goto Redridge Mountains,30.733,59.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 对话
    >>|cRXP_WARN_沿主路行进，避开沿途的近距离怪物|r
    .turnin 244 >> 交任务：豺狼人的入侵
    .target 菲尔顿副队长
step
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 对话
    .fp Redridge Mountains >> 获取赤脊山飞行点
    .fly Stormwind >> 飞往暴风城
    .target 艾蕾娜·斯托姆法瑟
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>购买以下物品，以便稍后在洛克莫丹更快交任务
    >>这样就不用四处寻找怪物击杀，可以节省时间。不想购买则跳过此步
    >>还可以多购买一些|T134437:0|t[大块野猪肉]，用于将|T133971:0|t[烹饪]练到50，为后续做准备
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    >>|T134437:0|t[大块野猪肉]
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .collect 769,4,86,1 -- Chunk of Boar Meat (4)
    .target 拍卖师亚克森
step
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩根·匹斯特|r 对话
    .turnin 61,1 >> 交任务：送往暴风城的货物
    >>|cRXP_WARN_我们选择的奖励是|r |T132383:0|t[爆破火箭] |cRXP_WARN_它能造成不错的伤害，还可以用于"分开拉怪"，非常实用|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >> |cRXP_WARN_点击此处观看“分开拉怪”的示范视频。视频很短，这种技巧很值得学习|r
    .target 摩根·匹斯特
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往 [已宰的羔羊] 术士训练师处并下楼
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 对话
    .turnin 1688 >> 交任务：苏伦娜·凯尔东
    .accept 1689 >> 接任务：誓缚
    .target 黑暗缚灵者加科因
step << Warlock
    #completewith next
    .goto StormwindClassic,25.2,80.7,18,0
    .goto StormwindClassic,23.2,79.5,18,0
    .goto StormwindClassic,26.3,79.5,18,0
    .goto StormwindClassic,25.154,77.406
    >>|cRXP_WARN_前往“已宰的羔羊旅店”的最底层|r
    .cast 7728 >> |cRXP_WARN_使用|r |T133292:0|t[血石颈环] |cRXP_WARN_召唤|r |cRXP_ENEMY_虚空行者|r
    .use 6928
step << Warlock
    .goto StormwindClassic,25.154,77.406
    .use 6928 >> 击杀 |cRXP_ENEMY_虚空行者|r
    .complete 1689,1 --Kill Summoned Voidwalker (x1)
    .mob 虚空行者
step << Warlock
     #softcore
    >>在你回到 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 的路上，用生命分流回蓝
    .target 黑暗缚灵者加科因
    .goto StormwindClassic,25.2,78.5
    .turnin 1689 >> 交任务：誓缚
step << Warlock
    #hardcore
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 对话
    .target 黑暗缚灵者加科因
    .goto StormwindClassic,25.25,78.59
    .turnin 1689 >> 交任务：誓缚
step << Warlock
    #softcore
    #completewith next
    .goto StormwindClassic,25.2,78.5
    .deathskip >> 先用生命分流, 再站到你旁边的篝火上, 然后在灵魂医者处复活
step
    #completewith next
    .goto Elwynn Forest,42.20,66.00,100 >> 前往闪金镇
step << Warrior
    .goto Elwynn Forest,41.09,65.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_里瑞亚·杜拉克|r 对话
    .target 里瑞亚·杜拉克
    .trainer >> 学习职业技能
step
    .isOnQuest 76
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官杜汉|r 对话
    .turnin 76 >> 交任务：玉石矿洞
    .target 治安官杜汉

step
    #era
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官杜汉|r 对话
    .turnin 39 >> 交任务：托马斯的报告
    .accept 239 >> 接任务：西泉要塞
    .target 治安官杜汉
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威廉·匹斯特|r 对话
    .goto Elwynn Forest,43.318,65.705
    .turnin 112 >> 交任务：收集海藻
    .accept 114 >> 接任务：梅贝尔的隐形水
    .target 威廉·匹斯特
step << Mage/Rogue/Priest
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >> 前往旅店二楼
step << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r 对话
    .target 扎尔迪玛·维夫希尔特
    .goto Elwynn Forest,43.25,66.19
    .trainer >> 学习职业技能
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科瑞恩·塞尔留斯|r 对话
    .target 科瑞恩·塞尔留斯
    .goto Elwynn Forest,43.872,65.937
    .trainer >> 学习职业技能
step << Priest
    .goto Elwynn Forest,43.283,65.719
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_女牧师洁塞塔|r 对话
    .target 女牧师洁塞塔
    .trainer >> 学习职业技能
step
    #completewith next
    .goto Elwynn Forest,43.154,89.625,50 >> 前往 [马科伦农场]
step
    .goto Elwynn Forest,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_梅贝尔·马科伦|r 对话
    .turnin 114 >> 交任务：梅贝尔的隐形水
    .target 梅贝尔·马科伦
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯通菲尔德妈妈|r 对话
    .target 斯通菲尔德妈妈
    .turnin 88 >> 交任务：公主必须死！
    .goto Elwynn Forest,34.660,84.483
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r 对话
    >>|cRXP_WARN_如果你没有足够的[大块野猪肉]，就暂时跳过交任务|r
    .target 波尼斯·斯通菲尔德姑妈
    .turnin 86 >> 交任务：比利的馅饼
    .goto Elwynn Forest,34.486,84.252
    .isQuestComplete 86
step
    #sticky
    .abandon 86 >> 放弃<比利的馅饼>
step
    #completewith next
    .goto Elwynn Forest,24.82,76.25,80 >> 前往 [西泉要塞]
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑞尼尔副队长|r 对话
    .turnin -239 >> 交任务：西泉要塞
    .accept 11 >> 接任务：悬赏河爪豺狼人
    .goto Elwynn Forest,24.234,74.450
    >>点击 |cRXP_PICK_通缉告示|r
    .accept 176 >> 接任务：通缉：霍格
    .goto Elwynn Forest,24.548,74.672
    .target 瑞尼尔副队长
step
    .group
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑞尼尔副队长|r 对话
    .turnin -239 >> 交任务：西泉要塞
    .accept 11 >> 接任务：悬赏河爪豺狼人
    .goto Elwynn Forest,24.234,74.450
    >>点击 |cRXP_PICK_通缉告示|r
    .accept 176 >> 接任务：通缉：霍格
    .goto Elwynn Forest,24.548,74.672
    .target 瑞尼尔副队长
step
    .solo
    .goto Elwynn Forest,24.234,74.450
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑞尼尔副队长|r 对话
    .turnin -239 >> 交任务：西泉要塞
    .accept 11 >> 接任务：悬赏河爪豺狼人
    .target 瑞尼尔副队长
step
    #completewith GnollEnd
    >>击杀 |cRXP_ENEMY_矮小的河爪豺狼人|r 和 |cRXP_ENEMY_河爪豺狼人前锋|r，拾取它们掉落的 |T134939:0|t[|cRXP_LOOT_采金日程表|r]
    .use 1307 >>|cRXP_WARN_使用|T134939:0|t[|cRXP_LOOT_采金日程表|r] 来接取任务|r
    >>|cRXP_WARN_这个|r|T134939:0|t[|cRXP_LOOT_采金日程表|r] |cRXP_WARN_掉率非常低。如果没有获得，可忽略此步骤|r
    >>|cRXP_ENEMY_格拉夫·疾齿|r |cRXP_WARN_为稀有刷新怪，但掉落率为 100%|r
    .collect 1307,1,123 --Collect Gold Pickup Schedule (x1)
    .accept 123 >> 接任务：收货人
    .unitscan 格拉夫·疾齿
step << !Warlock
    .group
    #completewith next
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r和|cRXP_ENEMY_河爪豺狼人前锋|r，拾取|cRXP_LOOT_彩色豺狼人臂章|r
    >>|cRXP_WARN_确保留有10块|r|T132889:0|t[亚麻布]|cRXP_WARN_，供接下来的圣骑士职业任务使用|r << Dwarf Paladin
    .complete 11,1 -- Painted Gnoll Armband (8)
    .collect 2589,10,1648,1,1 << Dwarf Paladin -- Linen Cloth (10)
    .mob 矮小的河爪豺狼人
    .mob 河爪豺狼人前锋
step << Warlock
    #completewith next
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r和|cRXP_ENEMY_河爪豺狼人前锋|r，拾取|cRXP_LOOT_彩色豺狼人臂章|r
    >>|cRXP_WARN_确保留有10块|r|T132889:0|t[亚麻布]|cRXP_WARN_，供接下来的圣骑士职业任务使用|r << Dwarf Paladin
    .complete 11,1 -- Painted Gnoll Armband (8)
    .collect 2589,10,1648,1,1 << Dwarf Paladin -- Linen Cloth (10)
    .mob 矮小的河爪豺狼人
    .mob 河爪豺狼人前锋
step << Warlock
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,25.9,93.9
    >>击杀|cRXP_ENEMY_霍格|r，拾取|cRXP_LOOT_巨大的豺狼人爪|r
    >>|cRXP_ENEMY_霍格|r|cRXP_WARN_可能在多个位置刷新|r
    >>|cRXP_WARN_施放|r|T136183:0|t[恐惧术]|cRXP_WARN_持续控制|cRXP_ENEMY_霍格|r，并使用常用的持续伤害技能将其击杀|r
    >>|cRXP_WARN_这个任务难度较高，必要时组队击杀。如果找不到队伍且无法单独击杀，就跳过此步|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .unitscan 霍格
step
    .group
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,25.9,93.9
    >>击杀|cRXP_ENEMY_霍格|r，拾取|cRXP_LOOT_巨大的豺狼人爪|r
    >>|cRXP_ENEMY_霍格|r|cRXP_WARN_可能在多个位置刷新|r
    >>|cRXP_WARN_这个任务难度较高，必要时组队击杀。如果找不到队伍且无法单独击杀，就跳过此步|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .unitscan 霍格
step
    #label GnollEnd
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    .goto Elwynn Forest,25.9,93.9
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r和|cRXP_ENEMY_河爪豺狼人前锋|r，拾取|cRXP_LOOT_彩色豺狼人臂章|r
    >>|cRXP_WARN_确保留有10块|r|T132889:0|t[亚麻布]|cRXP_WARN_，供接下来的圣骑士职业任务使用|r << Dwarf Paladin
    .complete 11,1 -- Painted Gnoll Armband (8)
    .collect 2589,10,1648,1,1 << Dwarf Paladin -- Linen Cloth (10)
    .mob 矮小的河爪豺狼人
    .mob 河爪豺狼人前锋
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官杜汉|r 对话
    .target 治安官杜汉
    .goto Elwynn Forest,42.105,65.927
    .turnin 176 >> 交任务：通缉：霍格
    .isQuestComplete 176
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官杜汉|r 对话
    .target 治安官杜汉
    .goto Elwynn Forest,42.105,65.927
    .turnin 123 >> 交任务：收货人
    .isOnQuest 123
step
    .goto Elwynn Forest,24.234,74.450
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑞尼尔副队长|r 对话
    .turnin 11 >> 交任务：悬赏河爪豺狼人
    .target 瑞尼尔副队长
step
    #completewith WestEntry
    .goto Westfall,59.95,19.35
    .zone Westfall >> 前往西部荒野
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r 对话
    .target 农夫法布隆
    .goto Westfall,59.95,19.35
    .turnin 184 >> 交任务：法布隆的地契
    .isOnQuest 184
step
    #label WestEntry
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_农夫法布隆|r 和 |cRXP_FRIENDLY_弗娜·法布隆|r 对话
    .accept 64 >> 接任务：遗失的怀表
    .target +农夫法布隆
    .goto Westfall,59.95,19.35
    .accept 151 >> 接任务：老马布兰契
    .accept 36 >> 接任务：杂味炖肉
    .goto Westfall,59.92,19.42
	.target +弗娜·法布隆
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_农夫萨丁|r 对话
    .target 农夫萨丁
    .goto Westfall,56.04,31.23
    .accept 9 >> 接任务：清理荒野
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r 对话
    .target 萨尔玛·萨丁
    .goto Westfall,56.40,30.50
    .turnin 36 >> 交任务：杂味炖肉
    .accept 38 >> 接任务：杂味炖肉
    .accept 22 >> 接任务：猪肝馅饼
step
    #softcore
    #sticky
    #completewith next
    .deathskip >> 死亡后在灵魂医者处复活, 或者跑去哨兵岭
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .target 格里安·斯托曼
    .goto Westfall,56.33,47.52
    .turnin 109 >> 交任务：向格里安·斯托曼报到
    .accept 12 >> 接任务：西部荒野人民军
step
    #era
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹努文队长|r 对话
    .target 丹努文队长
    .goto Westfall,56.42,47.62
    .accept 102 >> 接任务：西部荒野的豺狼人
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵加里安|r 对话
    .target 哨兵加里安
    .goto Westfall,54.00,53.00
    .accept 153 >> 接任务：红色皮质面罩
step
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fp Sentinel Hill >> 获取哨兵岭飞行点
    .fly Stormwind >> 飞往暴风城 << Dwarf Paladin
    .target 索尔
step << !Paladin
    .hs >> 炉石回洛克莫丹
step << Dwarf Paladin
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    .zone Ironforge >> 进入矿道地铁，乘地铁前往铁炉堡
    --.link https://www.youtube.com/watch?v=M_tXROi9nMQ >> |cRXP_WARN_Do a logout skip inside the Tram. Click here for video reference|r
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（联盟）
#hardcore
#era/som--h
#classic
#tbc
<< Alliance
#name 11-13 Loch Modan (Dwarf/Gnome)
#title 洛克莫丹
#version 1
#group RestedXP Survival Guide (A)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
#defaultfor Gnome/Dwarf
#next 13-15 Westfall
#displayname 11-13 洛克莫丹（矮人/侏儒）
step << Dwarf Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布兰度尔·铁锤|r 交谈。
    .target 布兰度尔·铁锤
    .goto Ironforge,23.131,6.143
    .accept 2999 >>接受任务圣洁之书
step << Dwarf Paladin
    #completewith next
    .goto Ironforge,25.27,1.53,9,0
    .goto Ironforge,24.35,11.90,10 >> 前往楼上对话 |cRXP_FRIENDLY_蒂萨·热炉|r
step << Dwarf Paladin
    .goto Ironforge,27.628,12.183
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒂萨·热炉|r 交谈。
    .turnin 2999 >>交任务圣洁之书
    .accept 1645 >>接受任务圣洁之书
    .turnin 1645 >>交任务圣洁之书
    .target 蒂萨·热炉
step << Dwarf Paladin
    .goto Ironforge,27.628,12.183
    .use 6916>>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_圣洁之书|r] 开始任务|r
    .accept 1646 >>接受任务圣洁之书
step << Dwarf Paladin
    .goto Ironforge,27.628,12.183
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒂萨·热炉|r 交谈。
    .turnin 1646 >>交任务圣洁之书
    .accept 1647 >>接受任务圣洁之书
step << Dwarf Paladin
    .goto Ironforge,21.643,36.199,20,0
    .goto Ironforge,23.401,62.898,20,0
    .goto Ironforge,32.057,78.286,20,0
    .goto Ironforge,47.132,84.932,20,0
    .goto Ironforge,26.719,69.884
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_约翰·特纳|r 交谈。
    >>|cRXP_FRIENDLY_约翰·特纳|r |cRXP_WARN_在铁炉堡外环靠近拍卖行的位置巡逻|r
    .turnin 1647 >>交任务圣洁之书
    .accept 1648 >>接受任务圣洁之书
    .turnin 1648 >>交任务圣洁之书
    .accept 1778 >>接受任务圣洁之书
    .unitscan 约翰·特纳
step << Dwarf Paladin
    .goto Ironforge,25.27,1.53,9,0
    .goto Ironforge,24.35,11.90,10,0
    .goto Ironforge,27.628,12.183
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒂萨·热炉|r 交谈，她在楼上。
    .target 蒂萨·热炉
    .turnin 1778 >>交任务圣洁之书
    .accept 1779 >>接受任务圣洁之书
step << Dwarf Paladin
    .goto Ironforge,23.539,8.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_穆里顿·热炉|r 交谈。
    .target 穆里顿·热炉
    .turnin 1779 >>交任务圣洁之书
    .accept 1783 >>接受任务圣洁之书
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格莱斯·瑟登|r
    .goto Ironforge,55.501,47.742
    .fly Loch Modan >> 飞往洛克莫丹
    .target 格莱斯·瑟登
    .zoneskip Ironforge,1
step
    #optional
    .isQuestComplete 418
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_维德拉·壁炉|r
    .target 维德拉·壁炉
    .goto Loch Modan,34.828,49.283
    .turnin 418 >> 交任务: 塞尔萨玛血肠
step
    #completewith RTB
    .goto Loch Modan,34.757,48.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雅尼·铁心|r
    .vendor 1682 >> |cRXP_BUY_购买|r |T133634:0|t[棕色小包] |cRXP_BUY_（如有需要）|r
    .target 雅尼·铁心
step
    #completewith RTB
    .goto Loch Modan,35.534,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r
    .vendor 6734 >> |cRXP_BUY_购买一些|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_（如有需要）|r << Warrior/Rogue
    .vendor 6734 >> |cRXP_BUY_购买一些|r |T133968:0|t[刚出炉的面包] |cRXP_BUY_和|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_（如有需要）|r << !Warrior !Rogue
    .target 旅店老板纳克罗·壁炉
step
    #label RTB
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.019,47.806
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布洛克·寻石者|r
    .turnin 6392 >> 交任务: 向布洛克回复
    .target 布洛克·寻石者
step << Hunter
    .goto Loch Modan,35.828,43.457
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维罗克·乱枪|r 交谈。
    >>|cRXP_BUY_购买一把|r |T135613:0|t[猎人火枪]，|cRXP_BUY_如果买得起|r
    .collect 2511,1
    .money <0.1300
    .target 维罗克·乱枪
step
    .group
    #completewith BraveSoul
    >>击杀 |cRXP_ENEMY_老黑熊|r，从它们身上拾取 |cRXP_LOOT_熊肉|r。
    >>击杀 |cRXP_ENEMY_山猪|r，从它们身上拾取 |cRXP_LOOT_猪大肠|r。
    >>击杀 |cRXP_ENEMY_森林潜伏者|r，从它们身上拾取 |cRXP_LOOT_蜘蛛的毒液|r。
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    .solo
    #completewith StormpikeStop
    >>击杀 |cRXP_ENEMY_老黑熊|r，从它们身上拾取 |cRXP_LOOT_熊肉|r。
    >>击杀 |cRXP_ENEMY_山猪|r，从它们身上拾取 |cRXP_LOOT_猪大肠|r。
    >>击杀 |cRXP_ENEMY_森林潜伏者|r，从它们身上拾取 |cRXP_LOOT_蜘蛛的毒液|r。
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    .group
    #completewith MinerGear
    >>击杀 |cRXP_ENEMY_坑道鼠|r，从它们身上拾取 |cRXP_LOOT_耳朵|r。
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
    >>打开 |cRXP_PICK_矿工联盟的储物箱|r，拾取里面的 |cRXP_LOOT_矿工装备|r。
    >>|cRXP_WARN_|cRXP_PICK_矿工联盟的储物箱|r 遍布矿井各处|r
    >>|cRXP_WARN_如果现在想跳过，之后等级更高时也可以回来完成此任务|r
    .complete 307,1 -- Miners' Gear (4)
step
    .group
    #completewith StormpikeStop
    >>击杀 |cRXP_ENEMY_老黑熊|r，从它们身上拾取 |cRXP_LOOT_熊肉|r。
    >>击杀 |cRXP_ENEMY_山猪|r，从它们身上拾取 |cRXP_LOOT_猪大肠|r。
    >>击杀 |cRXP_ENEMY_森林潜伏者|r，从它们身上拾取 |cRXP_LOOT_蜘蛛的毒液|r。
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step << Paladin/Warrior
    .goto Loch Modan,42.867,9.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔伦·安德玛|r 交谈。
    .vendor >>|cRXP_FRIENDLY_尼尔伦·安德玛|r |cRXP_WARN_出售|r |T133476:0|t[|cRXP_FRIENDLY_重型尖刺钉锤|r]，|cRXP_WARN_这是限量供应的物品|r
    >>|cRXP_WARN_检查是否有货，买得起就购买。如果钱不够，就在附近击杀 |cRXP_ENEMY_坑道鼠|r 刷钱，直到攒够为止|r
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
    >>击杀 |cRXP_ENEMY_坑道鼠|r，从它们身上拾取 |cRXP_LOOT_耳朵|r。
    >>|cRXP_ENEMY_坑道鼠|r |cRXP_WARN_会在洛克莫丹各处刷新，打开世界地图查看它们的位置|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_高索·布鲁姆|r 交谈。
    .vendor >>|cRXP_WARN_按需出售杂物并修理装备|r
    .target 高索·布鲁姆
step
.group
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r
    .turnin 307 >> 交任务: 肮脏的爪子
    .target 巡山人卡尔·雷矛
    .isQuestComplete 307
step
    #label StormpikeDelivery
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人卡尔·雷矛|r
    .turnin 353 >> 交任务: 雷矛的包裹
    .target 巡山人卡尔·雷矛
step
    >>击杀 |cRXP_ENEMY_老黑熊|r，从它们身上拾取 |cRXP_LOOT_熊肉|r。
    >>击杀 |cRXP_ENEMY_山猪|r，从它们身上拾取 |cRXP_LOOT_猪大肠|r。
    >>击杀 |cRXP_ENEMY_森林潜伏者|r，从它们身上拾取 |cRXP_LOOT_蜘蛛的毒液|r。
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅尼·铁心|r 交谈。
    >>|cRXP_BUY_购买|r |T135237:0|t[燧石和火绒]，|cRXP_BUY_以及 2 份|r |T135435:0|t[普通木柴]。|cRXP_BUY_购买|r|T133634:0|t[棕色小包]，|cRXP_BUY_如有需要|r
    .collect 4470,2 --Simple Wood (2)
    .collect 4471,1 --Flint and Tinder (1)
    .target 雅尼·铁心
step
    .goto Loch Modan,27.01,48.74,0
    .goto Loch Modan,27.68,56.83,0
    .goto Loch Modan,33.35,71.59,0
    .goto Loch Modan,31.54,74.96,0
    .goto Loch Modan,27.01,48.74,40,0
    .goto Loch Modan,27.68,56.83,40,0
    .goto Loch Modan,33.35,71.59,40,0
    .goto Loch Modan,31.54,74.96,40,0
    .goto Loch Modan,33.88,76.58
    >>击杀 |cRXP_ENEMY_碎石穴居人|r 和 |cRXP_ENEMY_碎石怪斥候|r，从它们身上拾取 |cRXP_LOOT_牙齿|r。
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .mob +碎石穴居人
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .mob +碎石怪斥候
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob +碎石穴居人
    .mob +碎石怪斥候
step
    #era
    .goto Loch Modan,27.4,48.4
    .xp 13+9600 >> 刷怪至 9600+/11400 经验值
step
    #som--xpgate
    .goto Loch Modan,27.4,48.4
    .xp 14-2300 >> 刷怪直到距离14级还差2300点经验(当前9100/11400)
step
    #completewith next
    .goto Loch Modan,24.78,70.17,10,0
    .goto Loch Modan,23.73,75.52,15 >> 沿着土路跑上去, 然后跳进碉堡里
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拉格弗斯上尉|r
    .target 拉格弗斯上尉
    .goto Loch Modan,23.233,73.675
    .turnin 267 >> 交任务: 穴居人的威胁
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_巡山人库伯弗林特|r
    .target 巡山人库伯弗林特
    .goto Loch Modan,22.071,73.127
    .turnin 224 >> 交任务: 保卫国王的领土
step << !Dwarf/!Paladin
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索格拉姆·伯雷森|r
    .fly Ironforge>> 飞往铁炉堡
    .target 索格拉姆·伯雷森
step << Dwarf Paladin
    #completewith next
    .goto Dun Morogh,86.09,51.15
    .zone Dun Morogh >> 前往: 丹莫罗
step << Dwarf Paladin
    #completewith next
    .goto Dun Morogh,78.321,58.088
    .cast 8593 >>|cRXP_WARN_使用|r |T133439:0|t[生命符记]，|cRXP_WARN_目标为|r |cRXP_FRIENDLY_纳姆·法奥克|r
	.use 6866
	.target 纳姆·法奥克
step << Dwarf Paladin
    .goto Dun Morogh,78.321,58.088
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳姆·法奥克|r 交谈。
    .use 6866
    .turnin 1783 >>交任务圣洁之书
    .accept 1784 >>接受任务圣洁之书
    .target 纳姆·法奥克
step << Dwarf Paladin
    .goto Dun Morogh,77.3,60.5,20,0
    .goto Dun Morogh,77.83,61.78
    >>击杀 |cRXP_ENEMY_黑铁间谍|r，从它们身上拾取 |cRXP_LOOT_黑铁手稿|r。
    .complete 1784,1 --Dark Iron Script (1)
    .mob 黑铁间谍
step << Dwarf Paladin
	#completewith next
    .hs >> 炉石回暴风城
step << Paladin
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >> 前往 [暴风城大教堂]
step << Paladin
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_虔诚的亚瑟|r
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
step << Hunter
    .goto Ironforge,69.872,82.890
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷格努斯·雷石|r
    .trainer >> 学习职业技能
    .target 雷格努斯·雷石
step << Warrior
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_比尔班·飞钳|r
    .trainer >> 学习职业技能
    .target 比尔班·飞钳
step << Mage
    .goto Ironforge,27.18,8.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_丁克|r
    .trainer >> 学习职业技能
    .target 丁克
step << Mage/Priest/Warlock
    #ah
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与一位 |cRXP_FRIENDLY_铁炉堡拍卖师|r 交谈。
    >>|cRXP_BUY_购买一把|r |T135144:0|t[强效魔法杖]，|cRXP_BUY_如果价格低于 33银 40铜|r
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    .collect 11288,1 --Greater Magic Wand (1)
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
step << Mage/Priest/Warlock
    .goto Ironforge,22.837,17.094,8,0
    .goto Ironforge,21.131,17.276,5,0
    .goto Ironforge,23.135,15.936
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈瑞克·石鼓|r 交谈，他在楼下。
    >>|cRXP_WARN_如果无法获得|r |T135144:0|t[强效魔法杖]，|cRXP_WARN_请购买|r |T135468:0|t[烟尘魔杖]，|cRXP_WARN_并在 15 级时装备|r
    .collect 5208,1 --Smoldering Wand (1)
    .target 哈瑞克·石鼓
    .itemcount 11288,<1
step << Warlock
    #softcore
    .goto Ironforge,51.1,8.7,15,0 >> 进入建筑
    .goto Ironforge,50.4,6.3
    .trainer >> 学习职业技能
step << Warlock
    #hardcore
    .goto Ironforge,51.1,8.7,15,0
    .goto Ironforge,50.343,5.657
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布瑞尔索恩|r
    .trainer >> 学习职业技能
    .target 布瑞尔索恩
step << Warlock
    .goto Ironforge,53.2,7.8,15,0
    .goto Ironforge,52.701,6.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_寻尸者祖贝尔|r
    .vendor >> |cRXP_BUY_购买|r |T133738:0|t[魔典：吞噬暗影（等级 1）] |cRXP_BUY_和|r |T133738:0|t[魔典：牺牲（等级 1）] |cRXP_BUY_（如果买得起）|r
    .target 寻尸者祖贝尔
step << Rogue
    #optional
    .goto Ironforge,51.958,14.838
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话楼下的 |cRXP_FRIENDLY_霍夫丹·黑须|r
    .turnin -2218 >> 交任务: 救赎之路
    .target 霍夫丹·黑须
step << Rogue
    .goto Ironforge,51.495,15.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_芬斯维克|r
    .trainer >> 学习职业技能
    .target 芬斯维克
step << Priest
    .goto Ironforge,25.207,10.756
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_托德雷·铁矿|r
    .trainer >> 学习职业技能
    .target 托德雷·铁矿
step << !Paladin !Warrior !Hunter !Warlock skip
    #completewith next
    +跳到一只狮鹫头上, 然后登出再登录, 就能跳过这一段
    .link https://www.youtube.com/watch?v=PWMJhodh6Bw >> |cRXP_WARN_点击这里查看视频参考|r
    .zoneskip Ironforge,1
step << !Paladin
    .goto Ironforge,78.00,52.00,5,0
    .zone Stormwind City >> 进入矿道地铁，乘坐地铁前往: 暴风城
    >>|cRXP_WARN_提升|r |T135966:0|t[急救] |cRXP_WARN_和|r |T133971:0|t[烹饪] |cRXP_WARN_如有需要，可在等矿道地铁时练习|r
    >>|cRXP_WARN_你需要将|r |T135966:0|t[急救] |cRXP_WARN_升到 80 点，以便完成 24 级的任务|r << Rogue !Dwarf
step
    #completewith Fly2WF
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_比利巴布·旋轮|r
    .vendor 5519 >> |cRXP_BUY_向他购买|r |T133024:0|t[青铜管] |cRXP_BUY_（如果有货）|r
    >>|cRXP_WARN_这是限量供应的物品. 如果 |cRXP_FRIENDLY_比利巴布·旋轮|r 没有, 请跳过此步骤|r
--    >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 比利巴布·旋轮
step << Rogue
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛尔达·维勒|r 交谈。
    >>|cRXP_BUY_购买 1 或 2 把|r |T135343:0|t[战士阔剑]，|cRXP_BUY_如果买得起；也可从拍卖行购买更好的武器|r
    .collect 2027,1 --Scimitar
    .target 玛尔达·维勒
    .money <0.3815
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    >>|cRXP_BUY_先购买一把；金币充足且副手也需要升级时，可再买第二把|r
step << Rogue
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛尔达·维勒|r 交谈。
    >>|cRXP_BUY_购买 1 或 2 把|r |T135343:0|t[战士阔剑]，|cRXP_BUY_如果买得起|r
    .collect 2027,1 --Scimitar
    .money <0.3815
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 玛尔达·维勒
    >>|cRXP_BUY_先购买一把；金币充足且副手也需要升级时，可再买第二把|r
step << Rogue
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.69
    .xp <14,1
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拍卖师亚克森|r 交谈。
    >>购买以下物品，以便稍后在西部荒野更快交任务。
    >>这样就不必四处寻找怪物击杀，可以节省时间。如果不想购买，请跳过此步骤。
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
    #label Fly2WF
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克
]])
