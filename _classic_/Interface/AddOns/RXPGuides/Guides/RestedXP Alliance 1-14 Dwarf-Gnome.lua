local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Alliance !Warlock !Hunter
#name 1-6 寒脊山谷
#displayname 1-6 寒脊山谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 6-11 丹莫罗
#version 1
#group RestedXP 联盟 1-20级
#defaultfor Gnome/Dwarf
step << !Gnome !Dwarf
    #sticky
    #completewith next
.goto Dun Morogh,29.927,71.201
    +您选择的指南适用于侏儒和矮人. 请确保选择与您起始职业相同的初始区域
step
    >>|cRXP_WARN_删除你的炉石|r
    >>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
    .accept 179 >>接任务: |cRXP_LOOT_矮人的交易|r
    .target Sten Stoutarm
step << Warrior
    .goto Dun Morogh,28.6,72.2
    +击杀|cRXP_LOOT_Wolves|r的狼群, 获取至少10铜币的垃圾物品, 然后进入建筑学习“战斗怒吼”, 这能显著提升升级速度
step << Warrior
    #completewith next
    .goto Dun Morogh,28.8,69.2,20 >>进入建筑
    .goto Dun Morogh,28.7,67.7
    .vendor >>出售垃圾
step << Warrior
    >>与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .goto Dun Morogh,28.8,67.2
    .train 6673 >>训练战斗怒吼
    .target Thran Khorman
step
    >>击杀|cRXP_LOOT_Wolves|r. 击杀后搜刮出|cRXP_LOOT_硬狼肉|r
.goto Dun Morogh,28.7,74.8
    .complete 179,1 --Collect Tough Wolf Meat (x8)
step
    .xp 2 >>升级至2级
step << Priest/Mage
    .goto Dun Morogh,30.0,71.5
    .vendor >>出售垃圾, 修理装备. 购买15瓶水. 如果钱不够, 就额外刷狼
    .collect 159,15 --Collect Refreshing Spring Water (x15)
step << Paladin/Warrior
    #completewith next
    .goto Dun Morogh,30.0,71.5
    .vendor >>出售垃圾
step << Paladin
    >>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .target Sten Stoutarm
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 3107 >>接任务: |cRXP_LOOT_神圣符文|r
step << Gnome Warrior
    >>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .target Sten Stoutarm
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 3112 >>接任务: |cRXP_LOOT_简易备忘录|r
step << Dwarf Warrior
    >>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .target Sten Stoutarm
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 3106 >>接任务: |cRXP_LOOT_简易符文|r
step << Mage
    >>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .target Sten Stoutarm
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 3114 >>接任务: |cRXP_LOOT_雕文备忘录|r
step << Priest
    >>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .target Sten Stoutarm
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 3110 >>接任务: |cRXP_LOOT_神圣符文|r
step << Gnome Rogue
    >>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .target Sten Stoutarm
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 3113 >>接任务: |cRXP_LOOT_密文备忘录|r
step << Dwarf Rogue
    >>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .target Sten Stoutarm
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 3109 >>接任务: |cRXP_LOOT_密文符文|r
step << !Dwarf !Gnome
    >>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .target Sten Stoutarm
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
step
#xprate <1.5
    >>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .target Sten Stoutarm
    .goto Dun Morogh,29.7,71.2
    .accept 170 >>接任务: |cRXP_LOOT_新的威胁|r
step
#xprate <1.5
    #sticky
    #completewith Rockjaw
    >>击杀你见到的|cRXP_ENEMY_Rockjaw Troggs|r. 你可能需要额外击杀一些壮实的石腭怪, 以触发刷新
    .complete 170,1 --Kill Rockjaw Trogg (x6)
        >>击杀|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .unitscan Rockjaw Trogg
step
    >>与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .target Talin Keeneye
    .goto Dun Morogh,22.601,71.433
    .turnin 233 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
    .accept 183 >>接任务: |cRXP_LOOT_猎杀野猪|r
    .accept 234 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
step
    .goto Dun Morogh,22.2,72.5,40,0
    .goto Dun Morogh,20.5,71.4,40,0
    .goto Dun Morogh,21.1,69.0,40,0
    .goto Dun Morogh,22.8,69.6,40,0
    .goto Dun Morogh,22.2,72.5,40,0
    .goto Dun Morogh,20.5,71.4,40,0
    .goto Dun Morogh,21.1,69.0,40,0
    .goto Dun Morogh,22.8,69.6,40,0
    >>击杀该区域内的小型峭壁野猪|r
    .complete 183,1 --Kill Small Crag Boar (x12)
step
    >>与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .target Talin Keeneye
    .goto Dun Morogh,22.601,71.433
    .turnin 183 >>交任务: |cRXP_FRIENDLY_猎杀野猪|r
step << Paladin/Mage
.xp 3+860 >>刷到860+/1400经验
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
    .target Grelin Whitebeard
    .turnin 234 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
    .accept 182 >>接任务: |cRXP_LOOT_巨魔洞穴|r
step << Paladin/Mage
    >>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .target Nori Pridedrift
    .goto Dun Morogh,25.0,76.0
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    >>一旦接受任务, 将启动5分钟倒计时. 请放松并跟随指引操作
step << Paladin/Mage
#xprate <1.5
    .goto Dun Morogh,28.7,77.5
    >>如果你还没击杀石腭穴居人, 就到这里上去杀了他们
    .complete 170,1 --Kill Rockjaw Trogg (x6)
step << Paladin/Mage
    #sticky
    #completewith Scalding1
    >>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .target Nori Pridedrift
    >>如果你行动太慢而未能完成限时任务, 请重新领取
    .goto Dun Morogh,25.0,76.0,0
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    .goto Dun Morogh,28.8,66.4
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
step << Paladin/Mage
    #label Scalding1
    >>与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .target Durnan Furcutter
    .goto Dun Morogh,28.8,66.4
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .vendor >>出售垃圾
step << Dwarf Paladin
    .goto Dun Morogh,28.8,68.3
.target Bromos Grummner
>>与|cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r交谈
    .turnin 3107 >>交任务: |cRXP_FRIENDLY_神圣符文|r
    .train 20271 >>训练判断力
.train 19740 >>训练力量祝福
.train 465 >>训练虔诚光环
step << Human Paladin/Draenei Paladin
    .goto Dun Morogh,28.8,68.3
    .train 20271 >>训练判断力
.train 19740 >>训练力量祝福
.train 465 >>训练虔诚光环
step << Gnome Mage
    .goto Dun Morogh,28.709,66.366
.target Marryk Nurribit
>>与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r交谈
    .turnin 3114 >>交任务: |cRXP_FRIENDLY_雕文备忘录|r
    .train 1459 >>学习奥术智慧
    .train 116 >>学习冰霜箭
step << Human Mage/Draenei Mage
    .goto Dun Morogh,28.709,66.366
    .train 1459 >>学习奥术智慧
    .train 116 >>学习冰霜箭
step << Paladin/Mage
#xprate <1.5
    .goto Dun Morogh,29.7,71.2
.target Balir Frosthammer
>>与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .turnin 170 >>交任务: |cRXP_FRIENDLY_新的威胁|r
step << Mage
    .goto Dun Morogh,30.0,71.5
    .vendor >>NPC处购买10瓶水
    .collect 159,10 --Collect Refreshing Spring Water (x10)
step << !Paladin !Mage
#xprate <1.5
    #sticky
    #label TrollTroggs
>>在完成巨魔任务时, 杀死你附近看到的任何|cRXP_ENEMY_石腭穴居人|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
step << Paladin/Mage
    .goto Dun Morogh,26.3,79.2,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
>>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
.complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .goto Dun Morogh,25.076,75.713
step << !Paladin !Mage
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
>>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
.complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .goto Dun Morogh,25.076,75.713
step << !Paladin !Mage
    .goto Dun Morogh,25.0,76.0
    .abandon 3364 >>放弃热酒快递 - 你现在还不需要它
step << !Paladin !Mage
    .xp 4 >>升级至4级
step << !Paladin !Mage
    #requires TrollTroggs
    >>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .target Grelin Whitebeard
    .goto Dun Morogh,25.076,75.713
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
    .accept 218 >>接任务: |cRXP_LOOT_被窃取的日记|r
step << Paladin/Mage
    .goto Dun Morogh,25.076,75.713
    >>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .target Grelin Whitebeard
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
    .accept 218 >>接任务: |cRXP_LOOT_被窃取的日记|r
step << !Paladin !Mage
    >>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .target Nori Pridedrift
    .goto Dun Morogh,25.0,76.0
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    >>你现在有5分钟时间去获取《日志》, 然后交出晨酒. 如果任务失败, 死亡后可重新拾取任务
step << Paladin/Mage
    >>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .target Nori Pridedrift
    .goto Dun Morogh,25.0,76.0
    .turnin 3365 >>交任务: |cRXP_FRIENDLY_归还酒杯|r
step
    .goto Dun Morogh,26.8,79.9,30,0
    .goto Dun Morogh,29.0,79.0,15,0
.goto Dun Morogh,30.6,80.3
    >>进入巨魔洞穴, 击杀|cRXP_LOOT_Grik'nir|r, 然后搜刮他的尸体, 获得|cRXP_LOOT_Grelin's journal|r
    .complete 218,1 --Collect Grelin Whitebeard's Journal (x1)
step << !Paladin !Mage
    .goto Dun Morogh,29.5,69.8,100 >>在灵魂医者处死亡并重生
step << !Paladin !Mage
#sticky
#completewith Scalding2
    >>如果你行动太慢而未能完成限时任务, 请去找诺里斯·激流交谈
    .target Nori Pridedrift
    .goto Dun Morogh,25.0,76.0,0
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    .goto Dun Morogh,28.8,66.4
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
step << !Paladin !Mage
    #label Scalding2
    >>与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .target Durnan Furcutter
    .goto Dun Morogh,28.8,66.4
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .vendor >>出售垃圾
step << Gnome Rogue
.goto Dun Morogh,28.4,67.5
.target Solm Hargrin
>>与|cRXP_FRIENDLY_索姆·哈格林|r交谈
    .turnin 3113 >>交任务: |cRXP_FRIENDLY_密文备忘录|r
step << Dwarf Rogue
.goto Dun Morogh,28.4,67.5
.target Solm Hargrin
>>与|cRXP_FRIENDLY_索姆·哈格林|r交谈
    .turnin 3109 >>交任务: |cRXP_FRIENDLY_密文符文|r
step << Dwarf Priest
.goto Dun Morogh,28.600,66.385
.target Branstock Khalder
>>与|cRXP_FRIENDLY_布兰斯托克·卡德尔|r交谈
    .turnin 3110 >>交任务: |cRXP_FRIENDLY_神圣符文|r
    .train 1243 >>学习真言术:坚韧
.train 589 >>学习暗言术:痛
    .train 2052 >>学习次级治疗术(等级2)
step << Human Priest/NightElf Priest/Draenei Priest
.goto Dun Morogh,28.600,66.385
    .train 1243 >>学习真言术:坚韧
.train 589 >>学习暗言术:痛
    .train 2052 >>学习次级治疗术(等级2)
step << Gnome Warrior
.goto Dun Morogh,28.8,67.2
.target Thran Khorman
>>与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .turnin 3112 >>交任务: |cRXP_FRIENDLY_简易备忘录|r
    .train 772 >>训练裂痕
    .train 100 >>火车冲锋
step << Dwarf Warrior
.goto Dun Morogh,28.8,67.2
.target Thran Khorman
>>与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .turnin 3106 >>交任务: |cRXP_FRIENDLY_简易符文|r
    .train 772 >>训练裂痕
    .train 100 >>火车冲锋
step << Human Warrior/NightElf Warrior/Draenei Warrior
.goto Dun Morogh,28.8,67.2
    .train 772 >>训练裂痕
    .train 100 >>火车冲锋
step << !Paladin !Mage
#xprate <1.5
    .goto Dun Morogh,29.7,71.2
.target Balir Frosthammer
>>与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .turnin 170 >>交任务: |cRXP_FRIENDLY_新的威胁|r
step << Priest
.money <0.0024
.goto Dun Morogh,30.0,71.5
    .vendor >>购买5瓶水
    .collect 159,5 --Collect Refreshing Spring Water (x5)
step
    >>稍微刷一下回到这里
    .goto Dun Morogh,25.1,75.8
>>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
.target Grelin Whitebeard
    .accept 282 >>接任务: |cRXP_LOOT_森内尔的观察站|r
step << !Paladin !Mage
    >>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .target Nori Pridedrift
    .goto Dun Morogh,25.0,76.0
    .turnin 3365 >>交任务: |cRXP_FRIENDLY_归还酒杯|r
step
    >>刷一些怪物刷到这里
.goto Dun Morogh,33.484,71.841
>>与|cRXP_FRIENDLY_巡山人萨鲁斯|r交谈
    .turnin 282 >>交任务: |cRXP_FRIENDLY_森内尔的观察站|r
.target Mountaineer Thalos
    .accept 420 >>接任务: |cRXP_LOOT_森内尔的观察站|r
step
    .goto Dun Morogh,33.9,72.2
.target Hands Springsprocket
>>与|cRXP_FRIENDLY_汉兹·跳链|r交谈
    .accept 2160 >>接任务: |cRXP_LOOT_塔诺克的补给品|r
step
.goto Dun Morogh,34.1,71.6,20,0
.goto Dun Morogh,35.7,66.0,20 >>穿过隧道
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Alliance !Warlock !Hunter
#name 6-11 丹莫罗
#displayname 6-11 丹莫罗 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor Gnome/Dwarf
#next 11-14 黑海岸
step
    #sticky
#completewith BoarMeat3
>>击杀野猪, 获取一些野猪肉以备后用
.collect 769,4 --Collect Chunk of Boar Meat (x4)
step
    #sticky
#completewith BoarRibs
>>击杀野猪获取一些猪排, 以备后续使用
.collect 2886,6 --Collect Crag Boar Rib (x6)
step << Dwarf Priest
>>往东北方向击杀野猪, 前往卡拉诺斯
.goto Dun Morogh,36.4,62.9,45,0
    .goto Dun Morogh,37.7,60.5,45,0
    .goto Dun Morogh,43.9,55.7
    .xp 5+2145 >>升级至2145/+2800经验值
step << !Dwarf/!Priest
>>刷野猪往东北方向到卡拉诺斯
.goto Dun Morogh,36.4,62.9,45,0
    .goto Dun Morogh,37.7,60.5,45,0
    .goto Dun Morogh,43.9,55.7
    .xp 5+2415 >>升级至2415/+2800经验值
step
    .goto Dun Morogh,47.0,55.1,75 >>死亡后在灵魂医者处重生, 或者前往卡兰诺斯. 确保你的子区域不是寒脊隘口
step
    #label BoarMeat3
.goto Dun Morogh,47.0,55.1,1500
step
    #label BoarRibs
.goto Dun Morogh,47.0,55.1,1500
step
.goto Dun Morogh,46.726,53.826
.target Senir Whitebeard
>>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .turnin 420 >>交任务: |cRXP_FRIENDLY_森内尔的观察站|r
step
    .goto Dun Morogh,46.7,53.5
    .vendor >>出售垃圾
step << !Priest
    .goto Dun Morogh,48.3,57.0
.xp 6 >>升级至6级
step << !Priest
    .goto Dun Morogh,46.8,52.4
.target Ragnar Thunderbrew
>>与|cRXP_FRIENDLY_拉格纳·雷酒|r交谈
    .accept 384 >>接任务: |cRXP_LOOT_啤酒烤猪排|r
step << !Priest
    .goto Dun Morogh,47.217,52.195
.target Tannok Frosthammer
>>与|cRXP_FRIENDLY_塔诺克·霜锤|r交谈
    .turnin 2160 >>交任务: |cRXP_FRIENDLY_塔诺克的补给品|r
step << Rogue
.goto Dun Morogh,47.2,52.4
    .money <0.0028
    .vendor >>前往克雷格·比尔姆, 购买并装备一件3级投掷武器, 花费28铜币
step << Rogue
.goto Dun Morogh,47.6,52.6
    .train 1757 >>训练邪恶打击(等级2)
    .train 1776 >>学习割裂技能
step << Mage
    .goto Dun Morogh,47.5,52.1
    .train 143 >>学习火球术(等级2)
    .train 2136 >>学习[火球术]
step << Paladin
    .goto Dun Morogh,47.6,52.1
    .train 639 >>学习神圣之光(等级2)
    .train 498 >>学习神圣庇护
step << Dwarf Priest
.goto Dun Morogh,47.3,52.2
.target Maxan Anvol
>>与|cRXP_FRIENDLY_马克萨恩·安沃尔|r交谈
    .accept 5625 >>接任务: |cRXP_LOOT_圣光之衣|r
step << Dwarf Priest
    .goto Dun Morogh,45.8,54.6
     .complete 5625,1 --Heal and fortify Mountaineer Dolf
step << Dwarf Priest
.goto Dun Morogh,47.3,52.2
.target Maxan Anvol
>>与|cRXP_FRIENDLY_马克萨恩·安沃尔|r交谈
    .turnin 5625 >>接任务: |cRXP_LOOT_圣光之衣|r
    .train 591 >>学习制裁术(等级2)
    .train 17 >>学习真言术:盾
    .train 2052 >>学习次级治疗术(等级2)
step << !Dwarf Priest
.goto Dun Morogh,47.3,52.2
    .train 591 >>学习制裁术(等级2)
    .train 17 >>学习真言术:盾
    .train 2052 >>学习次级治疗术(等级2)
step << Priest
    .xp 6 >>升级至6级
step << Priest/Mage/Shaman/Druid
    .goto Dun Morogh,47.4,52.5
    .home >>将你的[炉石]设置为雷酒酿造厂
    .vendor >>尽可能多地购买5级药水
step << !Mage !Priest
    .goto Dun Morogh,47.4,52.5
    .home >>将你的[炉石]设置为雷酒酿造厂
    .vendor >>出售垃圾
step << Warrior
    .goto Dun Morogh,47.4,52.6
    .train 3127 >>学习格挡
step << Paladin/Warrior/Shaman/Druid
    .goto Dun Morogh,45.8,51.8,20 >>进入建筑
step << Gnome Warrior/Human Warrior/NightElf Warrior
    .goto Dun Morogh,45.3,52.2
.vendor >>出售垃圾. 如果你能凑够购买步兵剑(5银9铜)的钱, 就卖掉它；如果还不够, 稍后再回来
step << Gnome Warrior/Human Warrior/NightElf Warrior
    .goto Dun Morogh,45.3,52.2
    .money <0.0509
    >>购买步兵剑并装备上
    .collect 2488,1 --Collect Gladius
step << Dwarf Warrior
    .goto Dun Morogh,45.3,52.2
.vendor >>出售垃圾, 如果能凑够买双刃战斧(4金60银)的钱.  就卖掉它；如果还不够, 稍后再回来
step << Dwarf Warrior
    .money <0.0460
    .goto Dun Morogh,45.3,52.2
    >>购买双刃战斧并装备上
    .collect 2491,1 --Collect Large Axe
step << Paladin
    .goto Dun Morogh,45.3,52.2
.vendor >>出售垃圾. 如果能凑够购买木槌棒(6s 66c)的钱, 就卖掉它；如果不够, 以后再回来处理
step << Paladin
    .money <0.0666
    .goto Dun Morogh,45.3,52.2
    >>购买木槌棒并装备它
    .collect 2493,1 --Collect Wooden Mallet
.goto Durotar,56.5,73.1
step << Druid/Shaman
.vendor >>出售垃圾. 如果能凑够够买手杖(5银4铜)的钱, 就卖掉它；如果不够, 稍后再回来处理
step << Druid/Shaman
    .goto Durotar,56.5,73.1
    .money <0.0504
    >>购买手杖并装备上
    .collect 2495,1 --Collect Walking Stick
step << Warrior/Rogue
    .goto Dun Morogh,45.3,51.9
    .train 2018 >>学习锻造技能. 稍后你会获得采矿技能, 这将让你可以制作锐化石(+2武器伤害, 持续1小时). 建议在等级达到约20级时停止制作这些物品
step << Paladin
    .goto Dun Morogh,45.3,51.9
    .train 2018 >>学习锻造技能. 稍后你会获得采矿技能, 这将让你可以制作重石(持续1小时, 增加武器伤害+2). 你应该在等级达到约20级时停止制作这些物品
step
    .goto Dun Morogh,46.021,51.676
.target Tharek Blackstone
>>与|cRXP_FRIENDLY_萨雷克·黑石|r交谈
    .accept 400 >>接任务: |cRXP_LOOT_贝尔丁的工具|r
step
    #sticky
#completewith next
>>击杀野猪, 获取一些野猪肉以备后用
.collect 769,4 --Collect Chunk of Boar Meat (x4)
step
.goto Dun Morogh,49.426,48.410
    >>不要在途中击杀熊类怪物
.target Pilot Bellowfiz
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .accept 317 >>接任务: |cRXP_LOOT_贝尔丁的补给|r
step
#xprate <1.5
    .goto Dun Morogh,49.622,48.612
.target Pilot Stonegear
>>与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .accept 313 >>接任务: |cRXP_LOOT_灰色洞穴|r
step
    .goto Dun Morogh,50.4,49.1
.target Beldin Steelgrill
>>与|cRXP_FRIENDLY_贝尔丁·钢架|r交谈
    .turnin 400 >>交任务: |cRXP_FRIENDLY_贝尔丁的工具|r
step
    .goto Dun Morogh,50.084,49.420
.target Loslor Rudge
>>与|cRXP_FRIENDLY_罗斯洛·鲁治|r交谈
    .accept 5541 >>接任务: |cRXP_LOOT_海格纳的弹药|r
step << Warrior/Paladin/Rogue
.money <0.0087
    .goto Dun Morogh,50.084,49.420
    .collect 2901,1 >>购买矿工锄
step << Warrior/Paladin/Rogue
.money <0.0010
    .goto Dun Morogh,50.2,50.4
.train 2580 >>进入房子. 训练采矿技能, 施放“寻矿术”
step
    #sticky
#completewith BoarRibs2
>>击杀野猪获取猪排, 以备后用
.collect 2886,6 --Collect Crag Boar Rib (x6)
step << Paladin/Warrior/Rogue
    #sticky
    #completewith BoarMeat
>>在完成任务时, 获取野猪肉交给贝尔丁的补给
.complete 317,1 --Collect Chunk of Boar Meat (x4)
step << Paladin/Warrior/Rogue
    #sticky
    #completewith BearFur
    >>完成任务时, 为贝尔丁的补给获取熊毛
.complete 317,2 --Collect Thick Bear Fur (x2)
step << !Paladin !Warrior !Rogue
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
    >>获取贝尔丁补给的物品
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
.complete 317,2 --Collect Thick Bear Fur (x2)
step << !Paladin !Warrior !Rogue
    .goto Dun Morogh,49.426,48.410
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .turnin 317 >>交任务: |cRXP_FRIENDLY_贝尔丁的补给|r
.target Pilot Bellowfiz
    .accept 318 >>接任务: |cRXP_LOOT_艾沃沙酒|r
step << Warrior
    .goto Dun Morogh,46.9,52.1,20,0
.goto Dun Morogh,47.4,52.5
    .vendor >>尽可能多地购买5级食物
step << Priest/Mage/Shaman/Druid
    .goto Dun Morogh,46.9,52.1,20,0
.goto Dun Morogh,47.4,52.5
    .vendor >>尽可能购买你负担得起的最高等级5级饮品
step << !Paladin !Warrior !Rogue
#xprate <1.5
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
    >>进入洞穴. 击杀温迪戈. 搜刮它们的鬃毛
    >>留意矿脉, 获取粗糙的石头用于磨刀或配重石以增强武器 << Paladin/Warrior/Rogue
    .complete 313,1 --Collect Wendigo Mane (x8)
step
    >>拾取箱子中的物品
.goto Dun Morogh,44.1,56.9
    .complete 5541,1 --Collect Rumbleshot's Ammo (x1)
step
    #label BearFur
.goto Dun Morogh,40.6,62.6,30,0
.goto Dun Morogh,40.682,65.130
.target Hegnar Rumbleshot
>>与|cRXP_FRIENDLY_海格纳·重枪|r交谈
    .turnin 5541 >>交任务: |cRXP_FRIENDLY_海格纳的弹药|r
    .vendor >>商人与修理
step
    #label BoarMeat
step << !Paladin !Warrior !Rogue
    .xp 7 >>升级到7级
step << Paladin/Warrior/Rogue
    .goto Dun Morogh,42.5,66.3,40,0
    .goto Dun Morogh,45.1,65.4,40,0
    .goto Dun Morogh,49.4,62.3,40,0
    .goto Dun Morogh,50.8,59.3,40,0
    .goto Dun Morogh,48.0,59.2,40,0
    .goto Dun Morogh,48.2,55.6,40,0
    .goto Dun Morogh,51.4,50.4,40,0
    .goto Dun Morogh,42.5,66.3,40,0
    .goto Dun Morogh,45.1,65.4,40,0
    .goto Dun Morogh,49.4,62.3,40,0
    .goto Dun Morogh,50.8,59.3,40,0
    .goto Dun Morogh,48.0,59.2,40,0
    .goto Dun Morogh,48.2,55.6,40,0
    .goto Dun Morogh,51.4,50.4,40,0
    >>击杀熊和野猪, 掠夺它们的毛皮与肉
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
step << Warrior/Paladin/Rogue
    .goto Dun Morogh,49.426,48.410
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .turnin 317 >>交任务: |cRXP_FRIENDLY_贝尔丁的补给|r
.target Pilot Bellowfiz
    .accept 318 >>接任务: |cRXP_LOOT_艾沃沙酒|r
step << Warrior/Paladin/Rogue
    .goto Dun Morogh,50.084,49.420
    .collect 2901,1 >>购买矿工锄
step << Warrior/Paladin/Rogue
    .goto Dun Morogh,50.2,50.4
.train 2580 >>进入房子. 训练采矿技能, 施放“寻矿术”
step << Warrior/Paladin/Rogue
    .isOnQuest 313
    .goto Dun Morogh,49.622,48.612
.target Pilot Stonegear
>>与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .turnin 313 >>交任务: |cRXP_FRIENDLY_灰色洞穴|r
step << Warrior/Paladin/Rogue
    .xp 7 >>升级到7级
step << Gnome Warrior/Human Warrior/NightElf Warrior
    .goto Dun Morogh,45.3,52.2
    .money <0.0509
    >>购买步兵剑并装备上
    .collect 2488,1 --Collect Gladius
step << Dwarf Warrior
    .money <0.0460
    .goto Dun Morogh,45.3,52.2
    >>购买双刃战斧并装备上
    .collect 2491,1 --Collect Large Axe
step << Paladin
    .money <0.0666
    .goto Dun Morogh,45.3,52.2
    .vendor >>购买木槌棒并装备它
    .collect 2493,1 --Collect Wooden Mallet
step << Paladin/Warrior/Rogue
    .goto Dun Morogh,47.4,52.5
    .vendor >>尽可能多地购买等级为5的食物
step << Paladin/Warrior/Rogue
    >>在前往目的地的路上刷一些怪物
.goto Dun Morogh,43.0,47.4,50,0
    .goto Dun Morogh,39.6,48.9,50,0
    .goto Dun Morogh,34.6,51.7
.target Tundra MacGrann
>>与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .accept 312 >>接任务: |cRXP_LOOT_马克格拉恩的干肉|r
step << !Paladin !Warrior !Rogue
>>在前往目的地的路上刷一些怪物
    .goto Dun Morogh,35.2,56.4,50,0
    .goto Dun Morogh,36.0,52.0,50,0
    .goto Dun Morogh,34.6,51.7
.target Tundra MacGrann
>>与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .accept 312 >>接任务: |cRXP_LOOT_马克格拉恩的干肉|r
step << !Mage !Priest
.goto Dun Morogh,30.5,46.0
    .vendor >>出售垃圾
step << Priest/Mage/Shaman/Druid
.goto Dun Morogh,30.5,46.0
    .vendor >>NPC处购买10瓶5级饮品
step
.goto Dun Morogh,30.2,45.8
>>与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 318 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
.target Rejold Barleybrew
    .accept 319 >>接任务: |cRXP_LOOT_艾沃沙酒|r
    .accept 315 >>接任务: |cRXP_LOOT_完美烈酒|r
step
    .goto Dun Morogh,30.186,45.531
.target Marleth Barleybrew
>>与|cRXP_FRIENDLY_马莱斯·麦酒|r交谈
    .accept 310 >>接任务: |cRXP_LOOT_针锋相对|r
step
#label BoarRibs2
.goto Dun Morogh,31.5,38.9,40,0
    .goto Dun Morogh,28.3,39.9,40,0
    .goto Dun Morogh,28.7,43.7,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,30.0,51.8,40,0
.goto Dun Morogh,31.5,38.9,40,0
    .goto Dun Morogh,28.3,39.9,40,0
    .goto Dun Morogh,28.7,43.7,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,30.0,51.8,40,0
    >>击杀熊和野猪和豹子
.complete 319,1 --Kill Ice Claw Bear (x6)
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .complete 319,3 --Kill Snow Leopard (x8)
step
>>完成获取猪排
.complete 384,1 --Collect Crag Boar Rib (x6)
step
.goto Dun Morogh,30.189,45.725
>>与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 319 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
.target Rejold Barleybrew
    .accept 320 >>接任务: |cRXP_LOOT_艾沃沙酒|r
step
.xp 7+3735 >>刷怪直到3735/4500经验值
.goto Dun Morogh,31.5,38.9,40,0
    .goto Dun Morogh,28.3,39.9,40,0
    .goto Dun Morogh,28.7,43.7,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,30.0,51.8,40,0
.goto Dun Morogh,31.5,38.9,40,0
    .goto Dun Morogh,28.3,39.9,40,0
    .goto Dun Morogh,28.7,43.7,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,30.0,51.8,40,0
step
    .goto Dun Morogh,30.3,37.5,50 >>前往此处
step
    .isQuestTurnedIn 384
    .xp 7+4360 >>刷怪直到经验值达到4360/4500, 然后前往此处
    .goto Dun Morogh,30.3,37.5,50
step
    .goto Dun Morogh,30.9,33.1,15 >>向北跑上山
step
    .goto Dun Morogh,32.4,29.1,15 >>追踪任务线索到这里
step
.goto Dun Morogh,33.0,27.2,15,0
    .goto Dun Morogh,33.0,25.2,15,0
    .goto Wetlands,11.6,43.4,60,0
.deathskip >>一直向北跑, 跳下去死亡, 然后重生
step
.goto Wetlands,12.7,46.7,30 >>游向岸边
step
.goto Wetlands,9.5,59.7
    .fp Menethil >>获取米奈希尔港的飞行路径
step
    #completewith next
.hs >>炉石到卡拉诺斯
step
.goto Dun Morogh,47.4,52.5
>>从贝尔姆购买狂想麦酒和雷霆麦酒
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .collect 2686,1 --Collect Thunder Ale (x1)
step
    .isOnQuest 310
    .goto Dun Morogh,47.6,52.4,10 >>进入旅店老板身后房间
step
    >>下楼, 然后找贾文对话, 并将雷霆麦酒交给他
    >>等待桶的鼠标悬停提示变为“无人看守”后, 提交任务
    .turnin 310 >>交任务: |cRXP_FRIENDLY_针锋相对|r
    .accept 311 >>接任务: |cRXP_LOOT_向马莱斯回报|r
step
.goto Dun Morogh,46.8,52.4
.target Ragnar Thunderbrew
>>与|cRXP_FRIENDLY_拉格纳·雷酒|r交谈
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
     >>下次见到商人时, 把这张配方卖了
step
    .xp 8 >>升级至8级
step << Rogue
    .goto Dun Morogh,47.6,52.6
    .train 6760 >>学习刺骨(等级2)
    .train 5277 >>训练闪避
step << Mage
    .goto Dun Morogh,47.5,52.1
    .train 205 >>学习冰霜箭(等级2)
.train 118 >>学习变形术
step << Paladin
    .train 853 >>学习[制裁之锤]
    .train 1152 >>训练净化
    .train 3127 >>学习格挡
step << Priest
    .goto Dun Morogh,47.3,52.2
    .train 139 >>训练更新
step << Warrior
.goto Dun Morogh,47.4,52.6
    .train 284 >>学习英雄打击(等级2)
    .train 1715 >>训练腘绳肌
step << Warrior/Rogue/Paladin tbc
    .istrained 3273
.money <0.0095
    .goto Dun Morogh,47.2,52.6
    .train 3273 >>学习急救技能
step << Paladin
    .goto Dun Morogh,45.3,52.2
    .vendor >>购买木槌. 如果需要钱, 可以向商人出售任何找到的背包(如果有)；或者出售武器, 以凑够购买木槌的费用
    .collect 2493,1 --Collect Wooden Mallet
step << Paladin/Warrior/Rogue
.goto Dun Morogh,47.4,52.5
    .vendor >>尽可能从旅店老板那里购买大量5级食物
step << Priest/Mage/Shaman/Druid
.goto Dun Morogh,47.4,52.5
    .vendor >>从旅店老板处购买尽可能多的5级药水
step
    .goto Dun Morogh,46.726,53.826
.target Senir Whitebeard
>>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .accept 287 >>接任务: |cRXP_LOOT_霜鬃巨魔要塞|r
step
#xprate <1.5
    .goto Dun Morogh,49.622,48.612
.target Pilot Stonegear
>>与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .turnin 313 >>交任务: |cRXP_FRIENDLY_灰色洞穴|r
step << !Rogue
    .goto Dun Morogh,49.426,48.410
.target Pilot Bellowfiz
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .turnin 320 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
step << Rogue
    .goto Dun Morogh,49.426,48.410
    >>选择野营匕首. 留到以后再用
.target Pilot Bellowfiz
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .turnin 320 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
step
#xprate <1.5
    .goto Dun Morogh,45.8,49.4
.target Razzle Sprysprocket
>>与|cRXP_FRIENDLY_拉兹·滑链|r交谈
    .accept 412 >>接任务: |cRXP_LOOT_自动净化装置|r
step
.goto Dun Morogh,43.1,45.0,20,0
.goto Dun Morogh,42.1,45.4,20 >>跑上坡道到达微光草
step
    .goto Dun Morogh,40.9,45.3,30,0
    .goto Dun Morogh,41.5,43.6,30,0
    .goto Dun Morogh,39.7,40.0,30,0
    .goto Dun Morogh,42.1,34.3,30,0
    >>清理此区域的怪物. 若需清除中间营地, 请谨慎行事. 如需额外拉两只怪物, 可将小屋内的怪物引出, 并在小屋后方利用视野(LoS)进行控怪. 若情况不利, 立即跑向另一区域
    .complete 315,1 --Collect Shimmerweed (x6)
step
.goto Dun Morogh,38.4,49.9,40 >>跑向老冰须
step << !Mage
    .goto Dun Morogh,38.5,54.0
    >>等到老冰须离开洞穴后, 你就可以潜入并抢夺宝箱, 或者选择这样做
        .link https://www.youtube.com/watch?v=o55Y3LjgKoE >>点击这里
    .complete 312,1 --MacGrann's Dried Meats (1)
step << Mage
    >>变形老冰须, 然后拾取肉块
.goto Dun Morogh,38.5,53.9
    .complete 312,1 --Collect MacGrann's Dried Meats (x1)
step
    .goto Dun Morogh,34.6,51.7
.target Tundra MacGrann
>>与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .turnin 312 >>交任务: |cRXP_FRIENDLY_马克格拉恩的干肉|r
step << Mage/Priest/Druid/Shaman
.goto Dun Morogh,30.4,45.8
.vendor >>尽可能多地购买5级药水
step << Warrior/Paladin/Rogue
.goto Dun Morogh,30.4,45.8
.vendor >>出售垃圾
step
    .goto Dun Morogh,30.189,45.725
>>与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 315 >>交任务: |cRXP_FRIENDLY_完美烈酒|r
.target Rejold Barleybrew
    .accept 413 >>接任务: |cRXP_LOOT_微光酒|r
step
    .goto Dun Morogh,30.186,45.531
.target Marleth Barleybrew
>>与|cRXP_FRIENDLY_马莱斯·麦酒|r交谈
    .turnin 311 >>交任务: |cRXP_FRIENDLY_向马莱斯回报|r
step
#xprate <1.5
    .goto Dun Morogh,27.2,43.0,40,0
    .goto Dun Morogh,24.8,39.3,40,0
    .goto Dun Morogh,25.6,43.4,40,0
    .goto Dun Morogh,24.3,44.0,40,0
    .goto Dun Morogh,25.4,45.4,40,0
    >>击杀麻风侏儒, 搜刮齿轮和齿轮零件
    .complete 412,2 --Collect Gyromechanic Gear (x8)
    .complete 412,1 --Collect Restabilization Cog (x8)
step
    .isOnQuest 287
    .goto Dun Morogh,24.5,50.8,30 >>进入洞窟
step
    .goto Dun Morogh,22.1,50.3,40,0
    .goto Dun Morogh,21.3,52.9,40,0
    >>击杀洞穴内的猎头者
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    step
    .goto Dun Morogh,23.4,51.5,15 >>返回洞穴深处
step
    >>跳下去
    .goto Dun Morogh,23.0,52.2
    .complete 287,2 --Fully explore Frostmane Hold
step
    .goto Dun Morogh,23.0,52.2
    .xp 9 >>刷到9级
step
    .isOnQuest 287
    .goto Dun Morogh,46.726,53.826
.deathskip >>在灵魂医者处死亡并重生
step
    .goto Dun Morogh,46.726,53.826
>>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .turnin 287 >>交任务: |cRXP_FRIENDLY_霜鬃巨魔要塞|r
.target Senir Whitebeard
    .accept 291 >>接任务: |cRXP_LOOT_森内尔的报告|r
step
#xprate <1.5
    .goto Dun Morogh,45.8,49.4
.target Razzle Sprysprocket
>>与|cRXP_FRIENDLY_拉兹·滑链|r交谈
    .turnin 412 >>交任务: |cRXP_FRIENDLY_自动净化装置|r
step << Warrior tbc
    #sticky
    #completewith next
.money >0.0950
    +开始刷怪直到你拥有价值9金币50铜的可出售物品, 然后前往铁炉堡
step << Warrior tbc
    .goto Dun Morogh,53.5,34.9,30 >>进入铁炉堡
step << Warrior tbc
.goto Ironforge,61.2,89.5
    .train 199 >>学习2小时锤类武器技能
step << Warrior tbc
    #sticky
    #completewith next
.goto Dun Morogh,53.5,34.9,100 >>离开铁炉堡
step
    .goto Dun Morogh,60.1,52.6,50,0
.goto Dun Morogh,63.1,49.8
.target Rudra Amberstill
>>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .accept 314 >>接任务: |cRXP_LOOT_保护牲畜|r
step
    #sticky
    #completewith next
    .goto Dun Morogh,62.3,50.3,12,0
    .goto Dun Morogh,62.2,49.4,8 >>跑上这座山的这一段坡路
step
    >>击杀瓦加什, 搜刮他的利牙
.goto Dun Morogh,62.6,46.1
    .complete 314,1 --Collect Fang of Vagash (x)
step
    .goto Dun Morogh,63.1,49.8
.target Rudra Amberstill
>>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .turnin 314 >>交任务: |cRXP_FRIENDLY_保护牲畜|r
step
    >>路上刷一点
.goto Dun Morogh,68.6,54.7
    .vendor >>出售垃圾
step
    .goto Dun Morogh,68.7,56.0
.target Senator Mehr Stonehallow
>>与|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .accept 433 >>接任务: |cRXP_LOOT_公众之仆|r
step
    .goto Dun Morogh,69.084,56.330
.target Foreman Stonebrow
>>与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 432 >>接任务: |cRXP_LOOT_该死的石腭怪！|r
step
.goto Dun Morogh,70.6,56.6,30,0
.goto Dun Morogh,70.8,53.3,30,0
.goto Dun Morogh,71.9,50.7,30,0
.goto Dun Morogh,72.9,53.1,30,0
.goto Dun Morogh,70.6,56.6,30,0
.goto Dun Morogh,70.8,53.3,30,0
.goto Dun Morogh,71.9,50.7,30,0
.goto Dun Morogh,72.9,53.1,30,0
    >>击杀洞穴中的地精
.complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
step
    .goto Dun Morogh,69.084,56.330
.target Foreman Stonebrow
>>与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .turnin 432 >>交任务: |cRXP_FRIENDLY_该死的石腭怪！|r
step
    .goto Dun Morogh,68.7,56.0
.target Senator Mehr Stonehallow
>>与|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .turnin 433 >>交任务: |cRXP_FRIENDLY_公众之仆|r
step
.goto Dun Morogh,67.1,59.7,40,0
.goto Dun Morogh,70.7,58.2,40,0
.goto Dun Morogh,71.0,53.9,40,0
.xp 10 >>在穴居人处升级到10级
step << !Warrior !Rogue
    .goto Dun Morogh,68.4,54.5
    .vendor >>购买10份5级食物和饮料
step << Warrior/Rogue
    .goto Dun Morogh,68.4,54.5
    .vendor >>购买10份5级食物
step << Priest tbc/Rogue tbc
    .goto Dun Morogh,47.1,55.1,60 >>死亡后在灵魂医者处复活, 或跑回去
step << Priest tbc
    #sticky
#completewith next
.goto Dun Morogh,47.3,52.2
    .train 2006 >>如果你要和其他玩家一起玩, 请学习复活术
step << !NightElf !Draenei Priest tbc
    .goto Dun Morogh,47.3,52.2
.target Laurna Morninglight
>>与|cRXP_FRIENDLY_劳尔娜·晨光|r交谈
    .accept 5636 >>接任务: |cRXP_LOOT_绝望祷言|r
    .train 2053 >>学习初级治疗术(等级3)
    .train 8092 >>训练心灵爆裂
.train 594 >>学习暗言术:痛(等级2)
    .train 13908 >>训练绝望祷言
step << !NightElf !Draenei Priest tbc
    .goto Dun Morogh,47.3,52.2
    .train 2053 >>学习初级治疗术(等级3)
    .train 8092 >>训练心灵爆裂
.train 594 >>学习暗言术:痛(等级2)
step << Rogue tbc
    .goto Dun Morogh,47.6,52.5
.target Hogral Bakkan
>>与后室内的|cRXP_FRIENDLY_霍格拉尔·巴坎|r交谈
    .accept 2218 >>接任务: |cRXP_LOOT_救赎之路|r
    .train 2983 >>学习冲刺技能
    .train 674 >>训练双武器技能
    .train 6770 >>训练萨普
    .train 1784 >>潜行训练
    >>装备露营小刀
step
    .goto Dun Morogh,81.2,42.7,15 >>途中刷会儿怪, 然后进入隧道
step
    .goto Dun Morogh,83.8,39.2
.target Pilot Hammerfoot
>>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .accept 419 >>接任务: |cRXP_LOOT_失踪的驾驶员|r
step
    >>路上刷怪
.goto Dun Morogh,79.7,36.2
    .turnin 419 >>交任务: |cRXP_FRIENDLY_失踪的驾驶员|r
    .accept 417 >>接任务: |cRXP_LOOT_驾驶员的复仇|r
step
    >>击杀Mangeclaw. 搜刮他的爪子
.goto Dun Morogh,80.0,36.4
    .complete 417,1 --Collect Mangy Claw (x1)
step
    .goto Dun Morogh,83.892,39.188
.target Pilot Hammerfoot
>>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .turnin 417 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r
step
    .isOnQuest 413
    .goto Dun Morogh,81.2,42.7,15 >>返回穿过隧道
step
    .goto Dun Morogh,79.6,50.7,50,0
.goto Dun Morogh,82.3,53.5,25,0
    .goto Dun Morogh,86.278,48.812
    .turnin -413 >>交任务: |cRXP_FRIENDLY_微光酒|r
step
    .isQuestTurnedIn 413
    .goto Dun Morogh,86.278,48.812
.target Mountaineer Barleybrew
>>与 |cRXP_FRIENDLY_巡山人维拉特·麦酒|r交谈
    .accept 414 >>接任务: |cRXP_LOOT_卡德雷尔的酒|r
step
    .isOnQuest 414
.goto Dun Morogh,86.2,51.3,20 >>穿过隧道
step << Mage/Rogue
    .goto Loch Modan,22.071,73.127
.target Mountaineer Cobbleflint
>>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >>接任务: |cRXP_LOOT_保卫国王的领土|r
step << Mage/Rogue
    .goto Loch Modan,22.6,75.4,30,0
.goto Loch Modan,23.233,73.675
    >>进入掩体
.target Captain Rugelfuss
>>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .accept 267 >>接任务: |cRXP_LOOT_穴居人的威胁|r
step << Mage/Rogue
    .goto Loch Modan,30.0,68.4,30,0
    .goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    .goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    .goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    >>击杀石裂穴居人. 击杀后搜刮它们的牙齿作为战利品
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
step << Mage/Rogue
    .goto Loch Modan,29.9,68.2,30,0
    .goto Loch Modan,22.2,73.3
.target Mountaineer Cobbleflint
>>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .turnin 224 >>交任务: |cRXP_FRIENDLY_保卫国王的领土|r
step << Mage/Rogue
    .goto Loch Modan,23.233,73.675
.target Captain Rugelfuss
>>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .turnin 267 >>交任务: |cRXP_FRIENDLY_穴居人的威胁|r
step
    #completewith next
    .goto Loch Modan,35.3,46.9,150 >>前往塞尔萨玛
step << Mage
    .goto Loch Modan,35.5,48.4
    .vendor >>购买40份5级牛奶
step << Mage
#xprate <1.5
    .goto Loch Modan,34.828,49.283
.target Vidra Hearthstove
>>与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .accept 418 >>接任务: |cRXP_LOOT_塞尔萨玛血肠|r
step << Rogue tbc
    .goto Loch Modan,35.5,48.4
    .home >>将你的[炉石]设置为塞尔萨玛
step << Mage
    .goto Loch Modan,34.8,48.6
    .vendor >>最多购买3个6槽位的背包
step << !Mage/wotlk
#xprate >1.499 << Mage
    .goto Loch Modan,32.6,49.9,40,0
    .goto Loch Modan,37.2,46.1,40,0
    .goto Loch Modan,36.7,41.6,40,0
    .goto Loch Modan,32.6,49.9,40,0
    .goto Loch Modan,37.2,46.1,40,0
    .goto Loch Modan,36.7,41.6,40,0
    >>找到卡德雷尔, 他沿着主路巡逻
>>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    .turnin 414 >>交任务: |cRXP_FRIENDLY_卡德雷尔的酒|r
.target Mountaineer Kadrell
    .accept 1339 >>接任务: |cRXP_LOOT_巡山人卡尔·雷矛的任务|r << wotlk/Rogue
step << Mage
#xprate <1.5
    .goto Loch Modan,32.6,49.9,40,0
    .goto Loch Modan,37.2,46.1,40,0
    .goto Loch Modan,36.7,41.6,40,0
    .goto Loch Modan,32.6,49.9,40,0
    .goto Loch Modan,37.2,46.1,40,0
    .goto Loch Modan,36.7,41.6,40,0
    >>找到卡德雷尔, 他沿着主路巡逻
>>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    .turnin 414 >>交任务: |cRXP_FRIENDLY_卡德雷尔的酒|r
.target Mountaineer Kadrell
    .accept 416 >>接任务: |cRXP_LOOT_狗头人的耳朵|r
    .accept 1339 >>接任务: |cRXP_LOOT_巡山人卡尔·雷矛的任务|r
    --Mage needs 12 for r3 fireball
step << Gnome/Dwarf
    >>进入建筑内, 然后下楼. 与布洛克交谈
    .goto Loch Modan,37.2,46.9,15,0
.goto Loch Modan,37.019,47.806
.target Brock Stoneseeker
>>与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .accept 6387 >>接任务: |cRXP_LOOT_荣誉学员|r
step << Mage
#xprate <1.5
    #sticky
    #completewith ThelsamarFood
    >>击杀蜘蛛. 掠夺蜘蛛的毒液
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
step << Mage
#xprate <1.5
    #sticky
    #completewith ThelsamarFood
    >>击杀熊, 搜刮出熊肉
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
step << Mage
#xprate <1.5
    #sticky
    #completewith ThelsamarFood
    >>击杀野猪, 杀死它们以获取猪大肠
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
step << Mage
#xprate <1.5
    #label ThelsamarFood
    .goto Loch Modan,23.3,17.9,30 >>跑到北边的掩体, 沿途击杀怪物获取猪大肠和熊肉和蜘蛛的毒液
step << Rogue
#xprate <1.5
.goto Loch Modan,23.3,17.9,30 >>跑到北侧掩体
step << Rogue/Mage
    .goto Loch Modan,24.1,18.2
    .vendor >>出售垃圾并修理
step << Mage
#xprate <1.5
    >>楼上
    .goto Loch Modan,24.7,18.3
>>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 1339 >>交任务: |cRXP_FRIENDLY_巡山人卡尔·雷矛的任务|r
.target Mountaineer Stormpike
    .accept 307 >>接任务: |cRXP_LOOT_肮脏的爪子|r
step << Rogue/wotlk
#xprate >1.499 << Mage
    >>楼上
    .goto Loch Modan,24.7,18.3
>>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 1339 >>交任务: |cRXP_FRIENDLY_巡山人卡尔·雷矛的任务|r
.target Mountaineer Stormpike
    .accept 1338 >>接任务: |cRXP_LOOT_卡尔·雷矛的订单|r
step << Mage
#xprate <1.5
    #completewith next
    .goto Loch Modan,35.5,18.2,40 >>在击杀老鼠的同时前往洞穴入口
step << Mage
#xprate <1.5
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
    >>收集洞穴中找到的箱子. 请注意, 这在11级时难度较高, 且地卜师拥有火焰护盾(免疫火焰伤害)
    .complete 307,1 --Collect Miners' Gear (x4)
step << Mage
#xprate <1.5
    #label Kobolds
    >>击杀狗头人, 搜刮他们的耳朵
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
step << Mage
#xprate <1.5
    #sticky
    #completewith Thelsamar3
    >>击杀该区域的蜘蛛, 以获取塞尔萨玛血肠
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
step << Mage
#xprate <1.5
    #sticky
    #completewith Thelsamar3
    >>在塞尔萨玛血肠区域击杀熊类怪物
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
step << Mage
#xprate <1.5
    #sticky
    #completewith Thelsamar3
    >>在塞尔萨玛区域击杀野猪, 以获取塞尔萨玛血肠
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
step << Mage
#xprate <1.5
    #label Thelsamar3
    .goto Loch Modan,23.3,17.9,40 >>跑回掩体, 途中持续刷怪
step << Mage
#xprate <1.5
    .goto Loch Modan,24.7,18.3
>>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 307 >>交任务: |cRXP_FRIENDLY_肮脏的爪子|r
    .turnin 1339 >>交任务: |cRXP_FRIENDLY_巡山人卡尔·雷矛的任务|r
.target Mountaineer Stormpike
    .accept 1338 >>接任务: |cRXP_LOOT_卡尔·雷矛的订单|r << wotlk
step << Mage
#xprate <1.5
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
    >>击杀熊类怪物, 掠夺它们的肉
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
step << Mage
#xprate <1.5
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
    >>击杀蜘蛛, 搜刮蛛液
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
step << Mage
#xprate <1.5
    #sticky
    #label Intestines9
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
    >>击杀野猪. 搜刮它们的肠子
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
step << Mage
#xprate <1.5
    #requires Meat9
    .zone Loch Modan
step << Mage
#xprate <1.5
    #requires Ichor9
    .zone Loch Modan
step << Mage
#xprate <1.5
    #requires Intestines9
    .zone Loch Modan
step << Mage
#xprate <1.5
    .goto Loch Modan,32.6,49.9,40,0
    .goto Loch Modan,37.2,46.1,40,0
    .goto Loch Modan,36.7,41.6,40,0
    .goto Loch Modan,32.6,49.9,40,0
    .goto Loch Modan,37.2,46.1,40,0
    .goto Loch Modan,36.7,41.6,40,0
    >>找到卡德雷尔, 他沿着主路巡逻
    .goto Loch Modan,36.9,46.1
.target Mountaineer Kadrell
>>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    .turnin 416 >>交任务: |cRXP_FRIENDLY_狗头人的耳朵|r
step << Mage
#xprate <1.5
    .goto Loch Modan,34.828,49.283
.target Vidra Hearthstove
>>与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .turnin 418 >>交任务: |cRXP_FRIENDLY_塞尔萨玛血肠|r
step << Mage
    .xp 12-420 <<tbc
    .xp 12-2310 << wotlk
step << Rogue/wotlk
    #xprate >1.499 << Mage
    .deathskip >>在塞尔萨玛死亡并重生
step << Rogue
#xprate <1.5
    #sticky
    #completewith next
    +刷怪直到你至少拥有33银币价值的金钱和可出售物品
step << Gnome/Dwarf
    .goto Loch Modan,33.938,50.954
    .fp Thelsamar >>获取塞尔萨玛的飞行路径
>>与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .turnin 6387 >>交任务: |cRXP_FRIENDLY_荣誉学员|r
.target Thorgrum Borrelson
    .accept 6391 >>接任务: |cRXP_LOOT_飞往铁炉堡|r
    .fly Ironforge >>飞往铁炉堡
step << !Gnome !Dwarf
    .goto Loch Modan,33.938,50.954
    .fp Thelsamar >>获取塞尔萨玛的飞行路径
    .fly Ironforge >>飞往铁炉堡
step << Gnome/Dwarf
    .goto Ironforge,51.521,26.311
>>与|cRXP_FRIENDLY_高尼尔·石趾|r交谈
    .turnin 6391 >>交任务: |cRXP_FRIENDLY_飞往铁炉堡|r
.target Golnir Bouldertoe
    .accept 6388 >>接任务: |cRXP_LOOT_格莱斯·瑟登|r
step << Dwarf/Gnome
    >>不要飞行到任何地方
.goto Ironforge,55.501,47.742
>>与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .turnin 6388 >>交任务: |cRXP_FRIENDLY_格莱斯·瑟登|r
.target Gryth Thurden
    .accept 6392 >>接任务: |cRXP_LOOT_向布洛克回复|r << Rogue tbc
step << Paladin
    .goto Ironforge,23.131,6.143
    .trainer >>拜访你的职业教练并学习法术
step << Mage
    .goto Ironforge,27.2,8.6
    .train 145 >>学习火球术(等级3)
    .train 604 >>训练削弱魔法
    .train 7300 >>学习冰霜甲(等级2)
    .train 122 >>学习[冰霜新星]
    .train 5504 >>学习召唤水术(等级2)
    .train 5505 >>学习召唤水术(等级2)
step
    .goto Ironforge,39.550,57.490
.target Senator Barin Redstone
>>与|cRXP_FRIENDLY_参议员巴林·红石|r交谈
    .turnin 291 >>交任务: |cRXP_FRIENDLY_森内尔的报告|r
step << Warrior/Rogue
    .goto Ironforge,62.0,88.8
    .collect 25873,1 >>从布伦温·冬钢处购买一把破损的锋利飞刀. 装备它
step << Warrior
    #sticky
    .goto Ironforge,65.9,88.4
    .train 2687 >>训练血怒
    .train 6546 >>训练Rend(等级2)
step << Warrior
    .goto Ironforge,70.9,89.9
    >>与穆伦·雷矛交谈
.target Muren Stormpike
>>与|cRXP_FRIENDLY_穆伦·雷矛|r交谈
    .accept 1678 >>接任务: |cRXP_LOOT_维吉雷克|r
step << Warrior
    >>返回丹莫罗
    .goto Dun Morogh,27.8,58.0
    .complete 1678,1 --Vejrek's Head (1)
step << Warrior
    .goto Ironforge,70.767,90.274
>>与|cRXP_FRIENDLY_穆伦·雷矛|r交谈
    .turnin 1678 >>交任务: |cRXP_FRIENDLY_维吉雷克|r
.target Muren Stormpike
    .accept 1680 >>接任务: |cRXP_LOOT_托姆斯·深炉|r
step << Warrior
    .goto Ironforge,48.642,42.482
.target Tormus Deepforge
>>与|cRXP_FRIENDLY_托姆斯·深炉|r谈话
    .turnin 1680 >>交任务: |cRXP_FRIENDLY_托姆斯·深炉|r
step << Rogue/wotlk
.goto Ironforge,77.0,51.0,30 >>进入矿道地铁
step << Rogue/wotlk
.target Monty
>>与 |cRXP_FRIENDLY_蒙提|r 交谈
    .accept 6661 >>接任务: |cRXP_LOOT_捕捉矿道老鼠|r
step << Rogue/wotlk
    .use 17117>>用你的笛子对付周围散落的老鼠
    .complete 6661,1 --Rats Captured (x5)
step << Rogue/wotlk
>>与 |cRXP_FRIENDLY_蒙提|r 交谈
    .turnin 6661 >>交任务: |cRXP_FRIENDLY_捕捉矿道老鼠|r
.target Monty
    .accept 6662 >>接任务: |cRXP_LOOT_我的兄弟，尼普希|r << Rogue/wotlk
step << !Rogue tbc
    .goto Ironforge,55.501,47.742
    >>返回铁炉堡
    .fly Menethil >>飞往米奈希尔港
step << Rogue/wotlk
     >>骑乘电车到另一侧并提交任务
.target Nipsy
>>与|cRXP_FRIENDLY_尼普希|r交谈
    .turnin 6662 >>交任务: |cRXP_FRIENDLY_我的兄弟，尼普希|r
step << Rogue/wotlk
    .goto StormwindClassic,58.1,16.5
.target Furen Longbeard
>>与|cRXP_FRIENDLY_弗伦·长须|r交谈
    .turnin 1338 >>交任务: |cRXP_FRIENDLY_卡尔·雷矛的订单|r
    .isOnQuest 1338
step << Rogue
    .goto StormwindClassic,57.1,57.7
    .train 201 >>学习1小时剑术
step << Rogue
    .goto StormwindClassic,57.6,57.1
    .vendor >>从冈瑟那里购买一把斗士短剑并装备上
step << Rogue tbc
    #sticky
    #completewith next
.hs >>炉石传送至塞尔萨玛
step << !NightElf Rogue tbc
    .goto Loch Modan,37.019,47.806
.target Brock Stoneseeker
>>与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
.turnin 6392 >>交任务: |cRXP_FRIENDLY_向布洛克回复|r
step << Rogue tbc
    .goto Ironforge,55.501,47.742
    .fly Menethil >>飞往米奈希尔港
step << Gnome/Dwarf
    .abandon 6392 >>放弃向布洛克回复
step << tbc
    .money <0.076
    .goto Wetlands,10.4,56.0,15,0
.goto Wetlands,10.1,56.9,15,0
.goto Wetlands,10.6,57.2,15,0
.goto Wetlands,10.7,56.8
    .vendor >>如果你有 7.6s, 检查尼尔·奥雷的青铜管, 如果存在就购买
    .bronzetube
step << tbc
    .money <0.0385
.goto Wetlands,8.1,56.3
    .vendor >>在Dewin处查看治疗药水, 购买至1秒的使用量
step << tbc
    #sticky
#completewith Darkshore1
+在这里等候船只
.goto Wetlands,4.7,57.3
step << tbc
    #label Darkshore1
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
step << Warlock wotlk/Rogue wotlk
    #xprate <1.5
    .goto StormwindClassic,52.61,65.71
    .home >>将你的[炉石]设置为暴风城
step << wotlk
    .goto StormwindNew,21.8,56.2
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Alliance Warlock
#name 1-12 丹莫罗
#displayname 1-12 丹莫罗 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor Gnome Warlock
#next 12-14 洛克莫丹侏儒；11-14 黑海岸
step << !Gnome !Dwarf
    #sticky
    #completewith next
.goto Dun Morogh,29.927,71.201
    +您选择的指南适用于侏儒和矮人. 请确保选择与您起始职业相同的初始区域
step
    >>删除你的炉石 << tbc
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
.target Sten Stoutarm
>>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .accept 179 >>接任务: |cRXP_LOOT_矮人的交易|r
step << tbc
    #sticky
    #completewith next
    .goto Dun Morogh,28.6,72.2,20,0
    +击杀狼获取10铜币以上后出售垃圾, 然后进入建筑物
step << tbc
    .goto Dun Morogh,28.8,69.2,20 >>进入建筑
step << tbc
    .goto Dun Morogh,28.8,66.2
    .vendor >>与恶魔书商交谈, 出售垃圾
step << tbc
    .goto Dun Morogh,28.6,66.1
    .train 348 >>训练燃烧
.target Alamar Grimm
>>与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r交谈
    .accept 1599 >>接任务: |cRXP_LOOT_开端|r
step
    >>击杀狼群, 掠夺它们的肉
.goto Dun Morogh,28.4,75.4
    .complete 179,1 --Collect Tough Wolf Meat (x8)
step
    .xp 2 >>升级至2级
step << tbc
#sticky
#completewith next
    .goto Dun Morogh,26.8,79.8,30,0
    .goto Dun Morogh,30.1,82.4,30 >>途中击杀一些狼, 然后观看此内容
.link https://www.youtube.com/watch?v=iUvGsRbIVp8 >>点击这里
step << tbc
    >>击杀霜鬃新手, 搜刮羽毛咒符
.goto Dun Morogh,29.0,82.6,20,0
.goto Dun Morogh,29.0,81.2,30,0
.goto Dun Morogh,30.1,82.4,20,0
    .complete 1599,1 --Collect Feather Charm (x3)
step << tbc
    .goto Dun Morogh,29.5,69.8,100 >>在灵魂医者处死亡并重生
step << tbc
    .goto Dun Morogh,28.6,66.1
.target Alamar Grimm
>>与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r交谈
    .turnin 1599 >>交任务: |cRXP_FRIENDLY_开端|r
step
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
>>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
.target Sten Stoutarm
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 3115 >>接任务: |cRXP_LOOT_被污染的备忘录|r
step << tbc
>>召唤小鬼, 加buff
.goto Dun Morogh,30.0,71.5
    .vendor >>出售垃圾, 买15瓶水. 如果钱不够, 就多刷一些以赚更多金币
    .collect 159,15 --Collect Refreshing Spring Water (x15)
step
#xprate <1.5
    .goto Dun Morogh,29.7,71.2
.target Balir Frosthammer
>>与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .accept 170 >>接任务: |cRXP_LOOT_新的威胁|r
step
#xprate <1.5
    #sticky
    #completewith Rockjaw
    >>杀死你看到的普通石腭穴居人
    .complete 170,1 --Kill Rockjaw Trogg (x6)
step
#xprate <1.5
    .goto Dun Morogh,26.9,72.7,30,0
    .goto Dun Morogh,25.1,72.1,30,0
    .goto Dun Morogh,26.9,72.7,30,0
    .goto Dun Morogh,25.1,72.1,30,0
    >>击杀壮实的石腭怪
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
step
    .goto Dun Morogh,22.601,71.433
>>与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .turnin 233 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
.target Talin Keeneye
    .accept 183 >>接任务: |cRXP_LOOT_猎杀野猪|r
    .accept 234 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
step
    .goto Dun Morogh,22.2,72.5,40,0
    .goto Dun Morogh,20.5,71.4,40,0
    .goto Dun Morogh,21.1,69.0,40,0
    .goto Dun Morogh,22.8,69.6,40,0
    .goto Dun Morogh,22.2,72.5,40,0
    .goto Dun Morogh,20.5,71.4,40,0
    .goto Dun Morogh,21.1,69.0,40,0
    .goto Dun Morogh,22.8,69.6,40,0
    >>击杀该区域的野猪
    .complete 183,1 --Kill Small Crag Boar (x12)
step
    .goto Dun Morogh,22.601,71.433
.target Talin Keeneye
>>与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .turnin 183 >>交任务: |cRXP_FRIENDLY_猎杀野猪|r
step
#label Rockjaw
    .goto Dun Morogh,25.076,75.713
>>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 234 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
.target Grelin Whitebeard
    .accept 182 >>接任务: |cRXP_LOOT_巨魔洞穴|r
step
#xprate <1.5
    #sticky
    #label Troggs
    .goto Dun Morogh,28.7,77.5
    >>如果你还没击杀完巨魔, 就到这里来
    .complete 170,1 --Kill Rockjaw Trogg (x6)
step
    .xp 4 >>升级至4级
step
.goto Dun Morogh,25.0,76.0
.target Nori Pridedrift
>>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
>>一旦接受任务, 将启动5分钟倒计时. 请放松并跟随指引操作
step << wotlk
    .hs >>使用你的[炉石]
step
    #sticky
    #completewith next
    #requires Troggs
    >>如果你行动太慢而未能完成限时任务, 请重新领取
    .goto Dun Morogh,25.0,76.0,0
.target Nori Pridedrift
>>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    .goto Dun Morogh,28.8,66.4
.target Durnan Furcutter
>>与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
step
    #requires Troggs
.goto Dun Morogh,28.8,66.4
>>与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
.target Durnan Furcutter
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .vendor >>出售垃圾
step
.goto Dun Morogh,28.6,66.1
    >>上楼
    .train 688 >>召唤小鬼训练 << wotlk
    .train 172 >>训练腐蚀之触
.target Alamar Grimm
>>与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r交谈
    .turnin 3115 >>交任务: |cRXP_FRIENDLY_被污染的备忘录|r
step
#xprate <1.5
    .goto Dun Morogh,29.7,71.2
.target Balir Frosthammer
>>与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .turnin 170 >>交任务: |cRXP_FRIENDLY_新的威胁|r
step << tbc
.goto Dun Morogh,30.0,71.5
    .vendor >>商人, 再买5瓶水
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
    .goto Dun Morogh,25.0,76.0
.target Nori Pridedrift
>>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .turnin 3365 >>交任务: |cRXP_FRIENDLY_归还酒杯|r
step
    .goto Dun Morogh,25.076,75.713
>>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
.target Grelin Whitebeard
    .accept 218 >>接任务: |cRXP_LOOT_被窃取的日记|r
step
    .goto Dun Morogh,26.8,79.9,30,0
    .goto Dun Morogh,29.0,79.0,15,0
.goto Dun Morogh,30.6,80.3
    >>进入巨魔洞穴. 击杀格里克尼尔, 然后搜刮他的日记
    .complete 218,1 --Collect Grelin Whitebeard's Journal (x1)
step
.goto Dun Morogh,28.4,79.7,30,0
.goto Dun Morogh,26.8,79.6,20 >>跑出洞穴外
step
    .goto Dun Morogh,25.076,75.713
>>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
.target Grelin Whitebeard
    .accept 282 >>接任务: |cRXP_LOOT_森内尔的观察站|r
step
    >>刷一些怪物刷到这里
.goto Dun Morogh,33.484,71.841
>>与|cRXP_FRIENDLY_巡山人萨鲁斯|r交谈
    .turnin 282 >>交任务: |cRXP_FRIENDLY_森内尔的观察站|r
.target Mountaineer Thalos
    .accept 420 >>接任务: |cRXP_LOOT_森内尔的观察站|r
step
    .goto Dun Morogh,33.9,72.2
.target Hands Springsprocket
>>与|cRXP_FRIENDLY_汉兹·跳链|r交谈
    .accept 2160 >>接任务: |cRXP_LOOT_塔诺克的补给品|r
step
.goto Dun Morogh,34.1,71.6,20,0
.goto Dun Morogh,35.7,66.0,20 >>穿过隧道
step
    #sticky
#completewith BoarMeat3
>>击杀野猪, 获取一些野猪肉以备后用
.collect 769,4 --Collect Chunk of Boar Meat (x4)
step
    #sticky
#completewith BoarRibs
>>击杀野猪获取一些猪排, 以备后续使用
.collect 2886,6 --Collect Crag Boar Rib (x6)
step
>>往东北方向击杀野猪, 前往卡拉诺斯
.goto Dun Morogh,36.4,62.9,45,0
    .goto Dun Morogh,37.7,60.5,45,0
    .goto Dun Morogh,43.9,55.7
    .xp 5+2415 >>升级至2415/+2800经验值
step
    .goto Dun Morogh,47.0,55.1,75 >>死亡后在灵魂医者处重生, 或者前往卡兰诺斯. 确保你的子区域不是寒脊隘口
step
    #label BoarMeat3
    .zone Dun Morogh
step
    #label BoarRibs
    .zone Dun Morogh
step
.goto Dun Morogh,46.726,53.826
.target Senir Whitebeard
>>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .turnin 420 >>交任务: |cRXP_FRIENDLY_森内尔的观察站|r
step
    .xp 6 >>升级至6级
step
    .goto Dun Morogh,46.7,53.5
    .vendor >>出售垃圾
step << tbc
.goto Dun Morogh,47.3,53.7
    .vendor >>去找丹尼, 购买血契之书并使用它
step
.goto Dun Morogh,47.3,53.7
    >>与吉姆里兹交谈
    .train 695 >>学习暗影箭(等级2)
    .train 1454 >>训练生命窃取
step
    .goto Dun Morogh,46.021,51.676
.target Tharek Blackstone
>>与|cRXP_FRIENDLY_萨雷克·黑石|r交谈
    .accept 400 >>接任务: |cRXP_LOOT_贝尔丁的工具|r
step
    #sticky
#completewith next
>>击杀野猪, 获取一些野猪肉以备后用
.collect 769,4 --Collect Chunk of Boar Meat (x4)
step
.goto Dun Morogh,49.426,48.410
    >>不要在途中击杀熊类怪物
.target Pilot Bellowfiz
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .accept 317 >>接任务: |cRXP_LOOT_贝尔丁的补给|r
step
#xprate <1.5
    .goto Dun Morogh,49.622,48.612
.target Pilot Stonegear
>>与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .accept 313 >>接任务: |cRXP_LOOT_灰色洞穴|r
step
    .goto Dun Morogh,50.4,49.1
.target Beldin Steelgrill
>>与|cRXP_FRIENDLY_贝尔丁·钢架|r交谈
    .turnin 400 >>交任务: |cRXP_FRIENDLY_贝尔丁的工具|r
step
.goto Dun Morogh,50.084,49.420
.target Loslor Rudge
>>与|cRXP_FRIENDLY_罗斯洛·鲁治|r交谈
    .accept 5541 >>接任务: |cRXP_LOOT_海格纳的弹药|r
step
    #sticky
#completewith BoarRibs2
>>击杀野猪获取猪排, 以备后用
.collect 2886,6 --Collect Crag Boar Rib (x6)
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
    >>获取贝尔丁补给的物品
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
.complete 317,2 --Collect Thick Bear Fur (x2)
step
    .goto Dun Morogh,49.426,48.410
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .turnin 317 >>交任务: |cRXP_FRIENDLY_贝尔丁的补给|r
.target Pilot Bellowfiz
    .accept 318 >>接任务: |cRXP_LOOT_艾沃沙酒|r
step
    #sticky
    #completewith supplies
    +如果你之前负担不起技能, 现在就去购买吧
step
    .goto Dun Morogh,46.8,52.4
.target Ragnar Thunderbrew
>>与|cRXP_FRIENDLY_拉格纳·雷酒|r交谈
    .accept 384 >>接任务: |cRXP_LOOT_啤酒烤猪排|r
step
    #label supplies
.goto Dun Morogh,47.217,52.195
.target Tannok Frosthammer
>>与|cRXP_FRIENDLY_塔诺克·霜锤|r交谈
    .turnin 2160 >>交任务: |cRXP_FRIENDLY_塔诺克的补给品|r
step
.goto Dun Morogh,47.4,52.5
    .home >>将你的[炉石]设置为雷酒酿造厂
step
#xprate <1.5
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
    >>进入洞穴. 击杀温迪戈. 搜刮它们的鬃毛
    .complete 313,1 --Collect Wendigo Mane (x8)
step
    >>拾取箱子中的物品
    .goto Dun Morogh,44.1,56.9
    .complete 5541,1 --Collect Rumbleshot's Ammo (x1)
step
    .goto Dun Morogh,40.6,62.6,30,0
    .goto Dun Morogh,40.682,65.130
.target Hegnar Rumbleshot
>>与|cRXP_FRIENDLY_海格纳·重枪|r交谈
    .turnin 5541 >>交任务: |cRXP_FRIENDLY_海格纳的弹药|r
    .vendor >>商人与修理
step
    .xp 7 >>升级到7级
step
>>在前往目的地的路上刷一些怪物
    .goto Dun Morogh,35.2,56.4,50,0
    .goto Dun Morogh,36.0,52.0,50,0
    .goto Dun Morogh,34.6,51.7
.target Tundra MacGrann
>>与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .accept 312 >>接任务: |cRXP_LOOT_马克格拉恩的干肉|r
step
.goto Dun Morogh,30.5,46.0
    .vendor >>商人. 从克雷格处购买10瓶5级饮料
step
    .goto Dun Morogh,30.2,45.8
>>与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 318 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
.target Rejold Barleybrew
    .accept 319 >>接任务: |cRXP_LOOT_艾沃沙酒|r
    .accept 315 >>接任务: |cRXP_LOOT_完美烈酒|r
step
    .goto Dun Morogh,30.186,45.531
.target Marleth Barleybrew
>>与|cRXP_FRIENDLY_马莱斯·麦酒|r交谈
    .accept 310 >>接任务: |cRXP_LOOT_针锋相对|r
step
#label BoarRibs2
    .goto Dun Morogh,31.5,38.9,40,0
    .goto Dun Morogh,28.3,39.9,40,0
    .goto Dun Morogh,28.7,43.7,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,30.0,51.8,40,0
    .goto Dun Morogh,31.5,38.9,40,0
    .goto Dun Morogh,28.3,39.9,40,0
    .goto Dun Morogh,28.7,43.7,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,30.0,51.8,40,0
    >>击杀熊和野猪和豹子
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .complete 319,3 --Kill Snow Leopard (x8)
step
    >>完成获取猪排
    .complete 384,1 --Collect Crag Boar Rib (x6)
step
    .goto Dun Morogh,30.189,45.725
>>与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 319 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
.target Rejold Barleybrew
    .accept 320 >>接任务: |cRXP_LOOT_艾沃沙酒|r
step
    .xp 7+3735 >>刷怪直到3735/4500经验值
    .goto Dun Morogh,31.5,38.9,40,0
    .goto Dun Morogh,28.3,39.9,40,0
    .goto Dun Morogh,28.7,43.7,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,30.0,51.8,40,0
    .goto Dun Morogh,31.5,38.9,40,0
    .goto Dun Morogh,28.3,39.9,40,0
    .goto Dun Morogh,28.7,43.7,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,30.0,51.8,40,0
step
    .goto Dun Morogh,30.3,37.5,50 >>前往此处
step
    .isQuestTurnedIn 384
    .xp 7+4360 >>刷怪直到经验值达到4360/4500, 然后前往此处
    .goto Dun Morogh,30.3,37.5,50
step
    .goto Dun Morogh,30.9,33.1,15 >>向北跑上山
step
    .goto Dun Morogh,32.4,29.1,15 >>追踪任务线索到这里
step
    .goto Dun Morogh,33.0,27.2,15,0
    .goto Dun Morogh,33.0,25.2,15,0
    .goto Wetlands,11.6,43.4,60,0
    .deathskip >>一直向北跑, 跳下去死亡, 然后重生
step
    .goto Wetlands,12.7,46.7,30 >>游向岸边
step
    .goto Wetlands,9.5,59.7
    .fp Menethil >>获取米奈希尔港的飞行路径
step
    .hs >>炉石到卡拉诺斯
step
    .goto Dun Morogh,47.4,52.5
    >>从贝尔姆购买狂想麦酒和雷霆麦酒
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .collect 2686,1,310,1 --Collect Thunder Ale (x1)
step
    .goto Dun Morogh,47.6,52.4,10 >>进入旅店老板身后房间
step
    >>下楼, 然后找贾文对话, 并将雷霆麦酒交给他
    >>等待桶的鼠标悬停提示变为“无人看守”后, 提交任务
    .turnin 310 >>交任务: |cRXP_FRIENDLY_针锋相对|r
    .accept 311 >>接任务: |cRXP_LOOT_向马莱斯回报|r
step
    .goto Dun Morogh,46.8,52.4
.target Ragnar Thunderbrew
>>与|cRXP_FRIENDLY_拉格纳·雷酒|r交谈
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
     >>下次见到商人时, 把这张配方卖了
step
    .xp 8 >>升级至8级
step << tbc
    .goto Dun Morogh,47.3,53.7
    .vendor >>去找丹尼, 购买《火弩箭》(等级2)书籍并使用它
step
    .goto Dun Morogh,47.3,53.7
    >>与吉姆里兹交谈
    .train 980 >>学习痛苦诅咒
    .train 5782 >>训练恐惧
step
    .goto Dun Morogh,46.726,53.826
.target Senir Whitebeard
>>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .accept 287 >>接任务: |cRXP_LOOT_霜鬃巨魔要塞|r
step
#xprate <1.5
    .goto Dun Morogh,49.622,48.612
.target Pilot Stonegear
>>与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .turnin 313 >>交任务: |cRXP_FRIENDLY_灰色洞穴|r
step
    .goto Dun Morogh,49.426,48.410
.target Pilot Bellowfiz
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .turnin 320 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
step
#xprate <1.5
    .goto Dun Morogh,45.8,49.4
.target Razzle Sprysprocket
>>与|cRXP_FRIENDLY_拉兹·滑链|r交谈
    .accept 412 >>接任务: |cRXP_LOOT_自动净化装置|r
step
    #completewith next
    .goto Dun Morogh,43.1,45.0,20,0
    .goto Dun Morogh,42.1,45.4,20 >>跑上坡道到达微光草
step
    .goto Dun Morogh,40.9,45.3,30,0
    .goto Dun Morogh,41.5,43.6,30,0
    .goto Dun Morogh,39.7,40.0,30,0
    .goto Dun Morogh,42.1,34.3,30,0
    >>清理此区域的怪物. 若需清除中间营地, 请谨慎行事. 如需额外拉两只怪物, 可将小屋内的怪物引出, 并在小屋后方利用视野(LoS)进行控怪. 若情况不利, 立即跑向另一区域
    .complete 315,1 --Collect Shimmerweed (x6)
step
    #completewith next
    .goto Dun Morogh,38.4,49.9,40 >>跑向老冰须
step
    >>惧怕老冰须, 然后进入洞穴内拾取宝箱
    .goto Dun Morogh,38.5,53.9
    .complete 312,1 --Collect MacGrann's Dried Meats (x1)
step
    .goto Dun Morogh,34.6,51.7
.target Tundra MacGrann
>>与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .turnin 312 >>交任务: |cRXP_FRIENDLY_马克格拉恩的干肉|r
step << tbc
    .goto Dun Morogh,30.4,45.8
    .vendor >>尽可能多地购买5级药水
step
    .goto Dun Morogh,30.189,45.725
>>与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 315 >>交任务: |cRXP_FRIENDLY_完美烈酒|r
.target Rejold Barleybrew
    .accept 413 >>接任务: |cRXP_LOOT_微光酒|r
step
    .goto Dun Morogh,30.186,45.531
.target Marleth Barleybrew
>>与|cRXP_FRIENDLY_马莱斯·麦酒|r交谈
    .turnin 311 >>交任务: |cRXP_FRIENDLY_向马莱斯回报|r
step
#xprate <1.5
    .goto Dun Morogh,27.2,43.0,40,0
    .goto Dun Morogh,24.8,39.3,40,0
    .goto Dun Morogh,25.6,43.4,40,0
    .goto Dun Morogh,24.3,44.0,40,0
    .goto Dun Morogh,25.4,45.4,40,0
    >>击杀麻风侏儒, 搜刮齿轮和齿轮零件
    .complete 412,2 --Collect Gyromechanic Gear (x8)
    .complete 412,1 --Collect Restabilization Cog (x8)
step
    .xp 9 >>升级到9级
step
    #completewith next
    .goto Dun Morogh,24.5,50.8,30 >>进入洞窟
step
    .goto Dun Morogh,22.1,50.3,40,0
       .goto Dun Morogh,21.3,52.9,40,0
    >>击杀洞穴内的猎头者
    .complete 287,1 --Kill Frostmane Headhunter (x5)
step
    >>跳进下方的凹槽
    .goto Dun Morogh,23.0,52.2
    .complete 287,2 --Fully explore Frostmane Hold
step
    #completewith next
    .deathskip >>在灵魂医者处死亡并重生
step
    .goto Dun Morogh,46.726,53.826
>>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .turnin 287 >>交任务: |cRXP_FRIENDLY_霜鬃巨魔要塞|r
.target Senir Whitebeard
    .accept 291 >>接任务: |cRXP_LOOT_森内尔的报告|r
step
#xprate <1.5
    .goto Dun Morogh,45.8,49.4
.target Razzle Sprysprocket
>>与|cRXP_FRIENDLY_拉兹·滑链|r交谈
    .turnin 412 >>交任务: |cRXP_FRIENDLY_自动净化装置|r
step
    .goto Dun Morogh,60.1,52.6,50,0
    .goto Dun Morogh,63.1,49.8
.target Rudra Amberstill
>>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .accept 314 >>接任务: |cRXP_LOOT_保护牲畜|r
step
    #sticky
    #completewith next
    .goto Dun Morogh,62.3,50.3,12,0
    .goto Dun Morogh,62.2,49.4,8 >>跑上这座山的这一段坡路
step
    >>击杀瓦加什, 搜刮他的利牙
.goto Dun Morogh,62.6,46.1
    .complete 314,1 --Collect Fang of Vagash (x)
step
    .goto Dun Morogh,63.1,49.8
.target Rudra Amberstill
>>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .turnin 314 >>交任务: |cRXP_FRIENDLY_保护牲畜|r
step
    >>路上刷一点
    .goto Dun Morogh,68.6,54.7
    .vendor >>商人处购买10份5级水和5份5级食物
step
    .goto Dun Morogh,68.7,56.0
.target Senator Mehr Stonehallow
>>与|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .accept 433 >>接任务: |cRXP_LOOT_公众之仆|r
step
    .goto Dun Morogh,69.084,56.330
.target Foreman Stonebrow
>>与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 432 >>接任务: |cRXP_LOOT_该死的石腭怪！|r
step
.goto Dun Morogh,70.6,56.6,30,0
.goto Dun Morogh,70.8,53.3,30,0
.goto Dun Morogh,71.9,50.7,30,0
.goto Dun Morogh,72.9,53.1,30,0
.goto Dun Morogh,70.6,56.6,30,0
.goto Dun Morogh,70.8,53.3,30,0
.goto Dun Morogh,71.9,50.7,30,0
.goto Dun Morogh,72.9,53.1,30,0
    >>击杀洞穴中的地精
.complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
step
    .goto Dun Morogh,69.084,56.330
.target Foreman Stonebrow
>>与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .turnin 432 >>交任务: |cRXP_FRIENDLY_该死的石腭怪！|r
step
    .goto Dun Morogh,68.7,56.0
.target Senator Mehr Stonehallow
>>与|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .turnin 433 >>交任务: |cRXP_FRIENDLY_公众之仆|r
step
.xp 10 >>升级至10级
step
    .goto Dun Morogh,81.2,42.7,15 >>途中刷会儿怪, 然后进入隧道
step
    .goto Dun Morogh,83.8,39.2
.target Pilot Hammerfoot
>>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .accept 419 >>接任务: |cRXP_LOOT_失踪的驾驶员|r
step
    >>路上刷怪
.goto Dun Morogh,79.7,36.2
    .turnin 419 >>交任务: |cRXP_FRIENDLY_失踪的驾驶员|r
    .accept 417 >>接任务: |cRXP_LOOT_驾驶员的复仇|r
step
    >>击杀Mangeclaw. 搜刮他的爪子
.goto Dun Morogh,80.0,36.4
    .complete 417,1 --Collect Mangy Claw (x1)
step
    .goto Dun Morogh,83.892,39.188
.target Pilot Hammerfoot
>>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .turnin 417 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r
step
    #completewith next
    .goto Dun Morogh,81.2,42.7,25 >>返回穿过隧道
step
    .goto Dun Morogh,79.6,50.7,50,0
    .goto Dun Morogh,82.3,53.5,25,0
    .goto Dun Morogh,86.278,48.812
>>与 |cRXP_FRIENDLY_巡山人维拉特·麦酒|r交谈
    .turnin 413 >>交任务: |cRXP_FRIENDLY_微光酒|r
.target Mountaineer Barleybrew
    .accept 414 >>接任务: |cRXP_LOOT_卡德雷尔的酒|r
step
    #completewith next
    .goto Dun Morogh,86.2,51.3,20 >>穿过隧道
step
    .goto Loch Modan,22.071,73.127
.target Mountaineer Cobbleflint
>>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >>接任务: |cRXP_LOOT_保卫国王的领土|r
step
    .goto Loch Modan,22.6,75.4,30,0
    .goto Loch Modan,23.233,73.675
    >>进入掩体
.target Captain Rugelfuss
>>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .accept 267 >>接任务: |cRXP_LOOT_穴居人的威胁|r
step << wotlk
    .goto Loch Modan,30.0,72.4,100,0
    .goto Loch Modan,34.7,71.6,100,0
    .goto Loch Modan,30.9,81.1,100,0
    .goto Loch Modan,30.0,72.4,100,0
    .goto Loch Modan,34.7,71.6,100,0
    .goto Loch Modan,30.9,81.1,100,0
    >>击杀石裂穴居人. 击杀后搜刮它们的牙齿作为战利品
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
step << wotlk
    .goto Loch Modan,22.2,73.3
.target Mountaineer Cobbleflint
>>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .turnin 224 >>交任务: |cRXP_FRIENDLY_保卫国王的领土|r
step << wotlk
    .goto Loch Modan,23.233,73.675
.target Captain Rugelfuss
>>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .turnin 267 >>交任务: |cRXP_FRIENDLY_穴居人的威胁|r
step
    .goto Loch Modan,35.3,46.9,150 >>前往塞尔萨玛
step << tbc
    .goto Loch Modan,35.5,48.4
    .home >>将你的[炉石]设置为塞尔萨玛
step << tbc
#xprate <1.5
    .goto Loch Modan,34.828,49.283
.target Vidra Hearthstove
>>与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .accept 418 >>接任务: |cRXP_LOOT_塞尔萨玛血肠|r
step
    .goto Loch Modan,34.0,46.5
    .vendor >>出售垃圾并修理
step
    .goto Loch Modan,32.6,49.9,40,0
    .goto Loch Modan,37.2,46.1,40,0
    .goto Loch Modan,36.7,41.6,40,0
    .goto Loch Modan,32.6,49.9,40,0
    .goto Loch Modan,37.2,46.1,40,0
    .goto Loch Modan,36.7,41.6,40,0
    >>找到卡德雷尔, 他沿着主路巡逻
>>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    .turnin 414 >>交任务: |cRXP_FRIENDLY_卡德雷尔的酒|r
.target Mountaineer Kadrell
    .accept 416 >>接任务: |cRXP_LOOT_狗头人的耳朵|r << tbc
    .accept 1339 >>接任务: |cRXP_LOOT_巡山人卡尔·雷矛的任务|r
step
    >>进入建筑内, 然后下楼. 与布洛克交谈
    .goto Loch Modan,37.2,46.9,15,0
    .goto Loch Modan,37.019,47.806
.target Brock Stoneseeker
>>与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .accept 6387 >>接任务: |cRXP_LOOT_荣誉学员|r
step << tbc
    #sticky
    #completewith ThelsamarFood
    >>击杀蜘蛛. 掠夺蜘蛛的毒液
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
step << tbc
    #sticky
    #completewith ThelsamarFood
    >>击杀熊, 搜刮出熊肉
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
step << tbc
    #sticky
    #completewith ThelsamarFood
    >>击杀野猪, 杀死它们以获取猪大肠
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
step
    #completewith next
    #label ThelsamarFood
    .goto Loch Modan,23.3,17.9,30 >>跑到北边的掩体, 沿途击杀怪物获取猪大肠和熊肉和蜘蛛的毒液
step
    .goto Loch Modan,24.1,18.2
    .vendor >>出售垃圾并修理
step
    >>楼上
    .goto Loch Modan,24.7,18.3
>>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 1339 >>交任务: |cRXP_FRIENDLY_巡山人卡尔·雷矛的任务|r
.target Mountaineer Stormpike
    .accept 307 >>接任务: |cRXP_LOOT_肮脏的爪子|r << tbc
    .accept 1338 >>接任务: |cRXP_LOOT_卡尔·雷矛的订单|r
step
    #label Thelsamar
    .goto Loch Modan,32.0,47.2,150 >>在灵魂医者处死亡并重生, 或跑来这里
step
    .goto Loch Modan,33.938,50.954
    .fp Thelsamar >>获取塞尔萨玛的飞行路径
>>与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .turnin 6387 >>交任务: |cRXP_FRIENDLY_荣誉学员|r
.target Thorgrum Borrelson
    .accept 6391 >>接任务: |cRXP_LOOT_飞往铁炉堡|r
    .fly Ironforge >>飞往铁炉堡
step
    .goto Ironforge,51.521,26.311
>>与|cRXP_FRIENDLY_高尼尔·石趾|r交谈
    .turnin 6391 >>交任务: |cRXP_FRIENDLY_飞往铁炉堡|r
.target Golnir Bouldertoe
    .accept 6388 >>接任务: |cRXP_LOOT_格莱斯·瑟登|r
step
    >>不要飞行到任何地方
.goto Ironforge,55.501,47.742
>>与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .turnin 6388 >>交任务: |cRXP_FRIENDLY_格莱斯·瑟登|r
.target Gryth Thurden
    .accept 6392 >>接任务: |cRXP_LOOT_向布洛克回复|r
step
    .goto Ironforge,39.550,57.490
.target Senator Barin Redstone
>>与|cRXP_FRIENDLY_参议员巴林·红石|r交谈
    .turnin 291 >>交任务: |cRXP_FRIENDLY_森内尔的报告|r
step
    #sticky
    #completewith next
+跳到铁砧上, 然后退出游戏再重新登录
.goto Ironforge,49.7,43.7
step
.goto Ironforge,77.0,51.0,30 >>进入矿道地铁
step
.target Monty
>>与 |cRXP_FRIENDLY_蒙提|r 交谈
    .accept 6661 >>接任务: |cRXP_LOOT_捕捉矿道老鼠|r
step
    .use 17117>>用你的笛子对付周围散落的老鼠
    .complete 6661,1 --Rats Captured (x5)
step
>>与 |cRXP_FRIENDLY_蒙提|r 交谈
    .turnin 6661 >>交任务: |cRXP_FRIENDLY_捕捉矿道老鼠|r
.target Monty
    .accept 6662 >>接任务: |cRXP_LOOT_我的兄弟，尼普希|r
step
     >>骑乘电车到另一侧并提交任务
.target Nipsy
>>与|cRXP_FRIENDLY_尼普希|r交谈
    .turnin 6662 >>交任务: |cRXP_FRIENDLY_我的兄弟，尼普希|r
step
    .goto StormwindClassic,58.1,16.5
.target Furen Longbeard
>>与|cRXP_FRIENDLY_弗伦·长须|r交谈
    .turnin 1338 >>交任务: |cRXP_FRIENDLY_卡尔·雷矛的订单|r
step
    .goto StormwindClassic,62.5,62.3,30,0
    .goto StormwindClassic,66.3,62.1
    .fp Stormwind >>获取暴风城飞行点
step
    .money <0.2090
    .goto StormwindClassic,57.1,57.7
    .train 227 >>训练法杖
step
    #sticky
    #completewith next
    .goto StormwindClassic,29.2,74.0,15,0
    .goto StormwindClassic,27.2,78.1,10 >>进入已宰的羔羊酒馆
step
    .goto StormwindClassic,25.2,78.5
.target Gakin the Darkbinder
>>与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .accept 1688 >>接任务: |cRXP_LOOT_苏伦娜·凯尔东|r
    .train 1120 >>训练吸取灵魂
    .train 6201 >>学习制作治疗石
    .train 696 >>学习恶魔皮肤(等级2)
    .train 707 >>学习献祭(等级2)
step
    .deathskip >>通过使用“生命分流”并站在你旁边的篝火上, 即可在灵魂医者处死亡并重生
step
    .goto Elwynn Forest,41.7,65.9
    .vendor >>出售垃圾并修理
step << tbc
#xprate <1.5
    .goto Elwynn Forest,42.105,65.927
.target Marshal Dughan
>>与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
step << tbc
#xprate <1.5
    .goto Elwynn Forest,42.9,65.7
    .abandon 109 >>放弃向格里安·斯托曼报到
step << tbc
#xprate <1.5
    #completewith next
    .goto Elwynn Forest,42.9,65.7,15 >>进入旅店
step << tbc
#xprate <1.5
    >>进入时在你左侧
    .goto Elwynn Forest,43.283,65.721
.target William Pestle
>>与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .accept 60 >>接任务: |cRXP_LOOT_狗头人的蜡烛|r
step << tbc
#xprate <1.5
    .goto Elwynn Forest,42.1,67.3
.target Remy "Two Times"
>>与|cRXP_FRIENDLY_雷米“两倍”|r交谈
    .accept 47 >>接任务: |cRXP_LOOT_金砂交易|r
step
.goto Elwynn Forest,42.1,67.3
.target Remy "Two Times"
>>与|cRXP_FRIENDLY_雷米“两倍”|r交谈
    .accept 40 >>接任务: |cRXP_LOOT_鱼人的威胁|r
step << tbc
#xprate <1.5
    #sticky
    #completewith Candles
    >>从附近的狗头人那里获取蜡烛
    .complete 60,1 --Collect Kobold Candle (x8)
step << tbc
#xprate <1.5
    #sticky
#completewith Dust
    >>从附近的狗头人身上获取金砂
    .complete 47,1 --Collect Gold Dust (x10)
step << tbc
#xprate <1.5
    #completewith next
    .goto Elwynn Forest,38.1,81.6,15 >>从下方入口进入
step << tbc
#xprate <1.5
    >>继续沿着矿井前进
.goto Elwynn Forest,40.5,82.3
    .complete 62,1 --Scout Through the Fargodeep Mine
step << tbc
#xprate <1.5
    #label Candles
    .goto Elwynn Forest,38.4,83.4,2500
step << tbc
#xprate <1.5
    #label Dust
    .goto Elwynn Forest,38.4,83.4,2500
step << tbc
#xprate <1.5
    .goto Elwynn Forest,38.4,83.4
    >>击杀狗头人, 搜刮蜡烛和尘埃
    .complete 60,1 --Collect Kobold Candle (x8)
    .complete 47,1 --Collect Gold Dust (x10)
step
    .goto Elwynn Forest,34.660,84.482
.target Ma Stonefield
>>与|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .accept 88 >>接任务: |cRXP_LOOT_公主必须死！|r
step
    .goto Elwynn Forest,24.6,78.2
    .accept 176 >>接任务: |cRXP_LOOT_通缉：霍格|r
step
    #sticky
    #completewith next
    >>留意金币拾取时间表(幸运掉落), 或从格拉夫·疾齿处获取100%掉率的稀有物品, 额外获得210点经验值
    .collect 1307,1,123 --Collect Gold Pickup Schedule (x1)
    .accept 123 >>接任务: |cRXP_LOOT_收货人|r
step
    #label Hogger
.goto Elwynn Forest,27.0,86.7,40,0
.goto Elwynn Forest,26.1,89.9,40,0
.goto Elwynn Forest,25.2,92.7,40,0
.goto Elwynn Forest,27.0,93.9,40,0
.goto Elwynn Forest,27.0,86.7,40,0
.goto Elwynn Forest,26.1,89.9,40,0
.goto Elwynn Forest,25.2,92.7,40,0
.goto Elwynn Forest,27.0,93.9,40,0
.goto Elwynn Forest,27.0,86.7,40,0
.goto Elwynn Forest,26.1,89.9,40,0
.goto Elwynn Forest,25.2,92.7,40,0
.goto Elwynn Forest,27.0,93.9,40,0
    >>霍格可能出现在该区域的多个位置. 保持恐惧链控, 或在血量低于60%时风筝他至坐标24,80的塔楼. 击杀后拾取他的利爪
    .complete 176,1 --Collect Huge Gnoll Claw (x1)
step
#completewith next
    .goto Elwynn Forest,39.5,60.5,200 >>死亡后在灵魂医者处重生, 或跑回闪金镇
step
.goto Elwynn Forest,42.105,65.927
    >>选择法杖. 装备它
>>与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    .turnin 40 >>交任务: |cRXP_FRIENDLY_鱼人的威胁|r
.target Marshal Dughan
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
step
    #sticky
    .isOnQuest 123
    .goto Elwynn Forest,42.105,65.927
.target Marshal Dughan
>>与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 123 >>交任务: |cRXP_FRIENDLY_收货人|r
step << tbc
#xprate <1.5
    .goto Elwynn Forest,42.105,65.927
>>与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
.target Marshal Dughan
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
step << tbc
#xprate <1.5
    .goto Elwynn Forest,42.1,67.3
.target Remy "Two Times"
>>与|cRXP_FRIENDLY_雷米“两倍”|r交谈
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
step
    .abandon 147 >>放弃猎杀收货人
step << tbc
#xprate <1.5
    .goto Elwynn Forest,43.283,65.721
>>与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .turnin 60 >>交任务: |cRXP_FRIENDLY_狗头人的蜡烛|r
.target William Pestle
    .accept 61 >>接任务: |cRXP_LOOT_送往暴风城的货物|r
step
    #sticky
    #completewith soylago
    .goto Elwynn Forest,44.1,66.0,12 >>如果你等级为12级, 请前往旅店老板身后房间, 然后下楼. 否则, 跳过此步骤
    .goto Elwynn Forest,44.4,66.2
    .train 755 >>训练健康药水漏斗
    .train 705 >>学习暗影箭(等级3)
    .xp <12,1
step
    .goto Elwynn Forest,43.771,65.803
    .vendor >>购买10瓶5级饮料
step << tbc
#xprate <1.5
    #label soylago
    .goto Elwynn Forest,47.6,63.3,60,0
    .goto Elwynn Forest,61.8,54.0,20 >>前往矿井外部区域
step << tbc
#xprate <1.5
    >>进入矿井, 沿着中间的路径继续前行
    .goto Elwynn Forest,60.4,50.2
    .complete 76,1 --Scout through the Jasperlode Mine
step
    .goto Elwynn Forest,61.8,54.0,40,0
    .goto Elwynn Forest,73.973,72.179
    >>在前往这里的路上刷一点怪
.target Guard Thomas
>>与|cRXP_FRIENDLY_卫兵托马斯|r交谈
    .turnin 35 >>交任务: |cRXP_FRIENDLY_卫兵托马斯|r
step << tbc
    #xprate <1.5
.target Guard Thomas
>>与|cRXP_FRIENDLY_卫兵托马斯|r交谈
    .accept 37 >>接任务: |cRXP_LOOT_失踪的卫兵|r
    .accept 52 >>接任务: |cRXP_LOOT_保卫边境|r
step << tbc
#xprate <1.5
    #sticky
    #completewith Prowlers
    >>像完成其他任务一样, 击杀觅食的灰狼
    .complete 52,1 --Kill Prowler (x8)
step << tbc
#xprate <1.5
    #sticky
    #completewith Bears
    >>像完成其他任务一样击杀熊, 看到任何熊都杀掉
    .complete 52,2 --Kill Young Forest Bear (x5)
step << tbc
#xprate <1.5
    .goto Elwynn Forest,72.7,60.3
    .turnin 37 >>交任务: |cRXP_FRIENDLY_失踪的卫兵|r
    .accept 45 >>接任务: |cRXP_LOOT_罗尔夫的下落|r
step << tbc
#xprate <1.5
    .goto Elwynn Forest,81.382,66.112
.target Supervisor Raelen
>>与|cRXP_FRIENDLY_管理员莱琳|r交谈
    .accept 5545 >>接任务: |cRXP_LOOT_木材危机|r
step << tbc
#xprate <1.5
    .goto Elwynn Forest,83.3,66.1
    .vendor >>如果需要, 出售垃圾并修理
step << tbc
#xprate <1.5
    #sticky
    #completewith next
    >>留意树根处的木柴捆
    .complete 5545,1 --Collect Bundle of Wood (x8)
step << tbc
#xprate <1.5
    #label Bundles
    .goto Elwynn Forest,79.8,55.5
    >>将怪物拉到小屋前, 拉开距离后保持一个恐惧状态, 并尽量让两个目标都维持DOT效果. 然后拾取地上的尸体
    .turnin 45 >>交任务: |cRXP_FRIENDLY_罗尔夫的下落|r
    .accept 71 >>接任务: |cRXP_LOOT_回复托马斯|r
step << tbc
#xprate <1.5
.goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
.goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    .goto Elwynn Forest,76.8,62.4,40,0
    .goto Elwynn Forest,83.7,59.4,40,0
    >>开始往回跑, 清理掉那些包裹
    .collect 13872,8 --Collect Bundle of Wood (x8)
step << tbc
#xprate <1.5
    .goto Elwynn Forest,81.382,66.112
.target Supervisor Raelen
>>与|cRXP_FRIENDLY_管理员莱琳|r交谈
    .turnin 5545 >>交任务: |cRXP_FRIENDLY_木材危机|r
step << tbc
#xprate <1.5
    #label Bears
.goto Elwynn Forest,79.457,68.789
.target Sara Timberlain
>>与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .accept 83 >>接任务: |cRXP_LOOT_红色亚麻布|r
step << tbc
#xprate <1.5
    #label Prowlers
    .goto Elwynn Forest,79.457,68.789,10000
    step
    .goto Elwynn Forest,76.7,75.6,40,0
    .goto Elwynn Forest,79.7,83.7,40,0
    .goto Elwynn Forest,82.0,76.8,40,0
    .goto Elwynn Forest,76.7,75.6,40,0
    .goto Elwynn Forest,79.7,83.7,40,0
    .goto Elwynn Forest,82.0,76.8,40,0
    >>击杀最后的怪物以保卫边境
    .complete 52,1 --Kill Prowler (x8)
    .complete 52,2 --Kill Young Forest Bear (x5)
step << tbc
#xprate <1.5
    .goto Elwynn Forest,73.973,72.179
>>与|cRXP_FRIENDLY_卫兵托马斯|r交谈
    .turnin 52 >>交任务: |cRXP_FRIENDLY_保卫边境|r
    .turnin 71 >>交任务: |cRXP_FRIENDLY_回复托马斯|r
.target Guard Thomas
    .accept 39 >>接任务: |cRXP_LOOT_托马斯的报告|r
step << tbc
#xprate <1.5
    .goto Elwynn Forest,70.5,77.6,40,0
    .goto Elwynn Forest,68.1,77.5,40,0
    .goto Elwynn Forest,68.2,81.4,40,0
    .goto Elwynn Forest,70.8,80.9,40,0
    .goto Elwynn Forest,70.5,77.6,40,0
    .goto Elwynn Forest,68.1,77.5,40,0
    .goto Elwynn Forest,68.2,81.4,40,0
    .goto Elwynn Forest,70.8,80.9,40,0
    .goto Elwynn Forest,70.5,77.6,40,0
    .goto Elwynn Forest,68.1,77.5,40,0
    .goto Elwynn Forest,68.2,81.4,40,0
    .goto Elwynn Forest,70.8,80.9,40,0
    >>开始绕着农场转圈, 击杀迪菲亚成员并搜刮他们的头巾
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .isOnQuest 83
step
    .goto Elwynn Forest,69.8,79.5
    .abandon 109 >>放弃向格里安·斯托曼报到
step
    >>击杀屋内怪物, 注意摩根(他会抓伤并杀死宠物), 用范围伤害技能攻击苏瑞娜. 击杀后搜刮她的颈链
    .goto Elwynn Forest,71.0,80.8
    .complete 1688,1 --Collect Surena's Choker (x)
step
    #label Deed
    .goto Elwynn Forest,69.8,79.5
    .goto Elwynn Forest,69.5,76.4,0
    .goto Elwynn Forest,71.3,79.2,0
    >>击杀公主. 搜刮她的项圈
    .complete 88,1 --Collect Brass Collar (x1)
step << tbc
#xprate <1.5
    .goto Elwynn Forest,79.5,68.9
.target Sara Timberlain
>>与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .turnin 83 >>交任务: |cRXP_FRIENDLY_红色亚麻布|r
    .isQuestComplete 83
step << tbc
#xprate <1.5
    #sticky
    #completewith next
    .goto Elwynn Forest,83.3,66.1
    .vendor >>出售垃圾并修理
step << tbc
    .xp 12
step
    #sticky
    #completewith next
    .goto Elwynn Forest,91.7,72.3,90 >>路上刷怪时确保至少拥有2个灵魂碎片(使用吸魂术)
    .collect 6265,2 --Collect Soul Shard (x2)
step
    .goto Redridge Mountains,17.4,69.6
.target Guard Parker
>>与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
step
    .abandon 184 >>放弃法布隆的地契
step
    >>小心途中出现的怪物
    .goto Redridge Mountains,30.733,59.996
.target Deputy Feldon
>>与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
step
    .goto Redridge Mountains,29.30,53.60
.target Shawn
>>与|cRXP_FRIENDLY_肖恩|r交谈
    .accept 3741 >>接任务: |cRXP_LOOT_希拉里的项链|r
    .xp <12,1
step
    >>在水下寻找希拉里的项链. 它位于一片棕色的泥土区域中
    .goto Redridge Mountains,27.80,56.05,0
    .goto Redridge Mountains,26.56,50.63,0
    .goto Redridge Mountains,23.96,55.17,0
    .goto Redridge Mountains,19.16,51.75,0
    .goto Redridge Mountains,31.12,54.21,0
    .goto Redridge Mountains,34.03,55.34,0
    .goto Redridge Mountains,38.09,54.49,0
    .goto Redridge Mountains,19.16,51.75,70,0
    .goto Redridge Mountains,38.09,54.49,70,0
    .complete 3741,1 --Hilary's Necklace (1)
    .xp <12,1
step
    .goto Redridge Mountains,29.20,53.60
.target Hilary
>>与|cRXP_FRIENDLY_希拉里|r交谈
    .turnin 3741 >>交任务: |cRXP_FRIENDLY_希拉里的项链|r
    .xp <12,1
step
    .goto Redridge Mountains,30.6,59.4
    .fp Redridge >>获取赤脊山飞行点
    .fly Stormwind >>飞往暴风城
step << wotlk
    .goto StormwindClassic,52.8,65.4
    .home >>将你的炉石设置为暴风城
step << tbc
#xprate <1.5
    >>选择火箭. 这些火箭伤害很高, 而且可以用来分拉怪
    .goto StormwindClassic,56.2,64.6
.target Morgan Pestle
>>与|cRXP_FRIENDLY_摩根·匹斯特|r交谈
    .turnin 61 >>交任务: |cRXP_FRIENDLY_送往暴风城的货物|r
step
    #sticky
    #completewith next
    .goto StormwindClassic,29.2,74.0,15,0
    .goto StormwindClassic,27.2,78.1,10 >>进入已宰的羔羊酒馆
step
.goto StormwindClassic,25.3,78.2
    .train 755 >>训练健康药水漏斗
    .train 705 >>学习暗影箭(等级3)
    .xp <12,1
step
    .goto StormwindClassic,25.2,78.5
>>与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .turnin 1688 >>交任务: |cRXP_FRIENDLY_苏伦娜·凯尔东|r
.target Gakin the Darkbinder
    .accept 1689 >>接任务: |cRXP_LOOT_誓缚|r
step
    .goto StormwindClassic,25.2,80.7,12,0
    .goto StormwindClassic,23.2,79.5,12,0
    .goto StormwindClassic,26.3,79.5,12,0
    .goto StormwindClassic,25.5,78.1
    >>前往墓穴底部, 使用血石颈环召唤虚空行者并击杀它
    .complete 1689,1 --Kill Summoned Voidwalker (x1)
step
    .goto StormwindClassic,25.2,78.5
    >>学会后不要召唤虚空行者
.target Gakin the Darkbinder
>>与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .turnin 1689 >>交任务: |cRXP_FRIENDLY_誓缚|r
step
    .deathskip >>死亡后使用“生命分流”在灵魂医者处重生, 并站在术士训练师旁边的篝火上
step
    .goto Elwynn Forest,41.7,65.9
    .vendor >>出售垃圾并修理
step
    .goto Elwynn Forest,42.105,65.927
    .turnin -76 >>交任务: |cRXP_FRIENDLY_玉石矿洞|r
    .turnin -39 >>交任务: |cRXP_FRIENDLY_托马斯的报告|r
step
    .goto Elwynn Forest,34.660,84.482
.target Ma Stonefield
>>与|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .turnin 88 >>交任务: |cRXP_FRIENDLY_公主必须死！|r
step
    .abandon 59 >>放弃布甲和皮甲
step << wotlk
    .goto Elwynn Forest,27.0,93.9
    .xp 12
step << wotlk
    .goto Elwynn Forest,44.4,66.2
    >>故意死亡并在灰谷重生
    >>前往旅店地下室
    .train 755 >>训练健康药水漏斗
    .train 705 >>学习暗影箭(等级3)
step
    .hs >>炉石前往洛克莫丹 << tbc
    .hs >>炉石传送至暴风城 << wotlk
step << wotlk
    .goto StormwindNew,21.8,56.2
    >>前往: |cRXP_PICK_暴风城|r
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
]])

RXPGuides.RegisterGuide([[
#tbc
<< Alliance Warlock
#name 12-14 洛克莫丹地精
#displayname 12-14 洛克莫丹地精 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor Gnome Warlock
#next 14-20 秘血岛
step
    .goto Loch Modan,34.8,48.6
    .vendor >>购买6格背包, 直到背包插槽全部填满
step
    .goto Loch Modan,34.0,46.5
    .vendor >>出售垃圾并修理
step
#sticky
#completewith Thelsamar
>>击杀该区域的蜘蛛, 以获取塞尔萨玛血肠
.collect 3174,3,418,1 --Collect Spider Ichor (x3)
step
    #sticky
    #completewith Thelsamar
>>在塞尔萨玛血肠区域击杀熊类怪物
.collect 3173,3,418,1 --Collect Bear Meat (x3)
step
    #sticky
    #completewith Thelsamar
>>在塞尔萨玛区域击杀野猪, 以获取塞尔萨玛血肠
.collect 3172,3,418,1 --Collect Boar Intestines (x3)
step
    #label Thelsamar
.goto Loch Modan,39.3,27.0,100 >>在途中击杀一些怪物以获取猪大肠和熊肉和蜘蛛的毒液
step
.goto Loch Modan,35.5,18.2,30 >>在击杀老鼠的同时前往洞穴入口
step
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
    >>收集洞穴中找到的箱子. 请注意, 这可能比较困难, 且地卜师拥有火焰护盾(Fire immunity)
    .complete 307,1 --Collect Miners' Gear (x4)
step
.goto Loch Modan,35.5,18.2,30 >>返回洞穴外
step
    #sticky
    #completewith Kobolds
    .goto Loch Modan,42.9,9.9
    .vendor >>商人, 必要时可修理(可选)
step
    #label Kobolds
    >>击杀狗头人, 搜刮他们的耳朵
.complete 416,1 --Collect Tunnel Rat Ear (x12)
step
#sticky
#completewith Thelsamar3
>>击杀该区域的蜘蛛, 以获取塞尔萨玛血肠
.collect 3174,3,418,1 --Collect Spider Ichor (x3)
step
    #sticky
    #completewith Thelsamar3
>>在塞尔萨玛血肠区域击杀熊类怪物
.collect 3173,3,418,1 --Collect Bear Meat (x3)
step
    #sticky
    #completewith Thelsamar3
>>在塞尔萨玛区域击杀野猪, 以获取塞尔萨玛血肠
.collect 3172,3,418,1 --Collect Boar Intestines (x3)
step
    #label Thelsamar3
.goto Loch Modan,23.3,17.9,30 >>跑回掩体, 途中持续刷怪
step
    .goto Loch Modan,24.1,18.2
    .vendor >>NPC和修理
step
    .goto Loch Modan,24.7,18.3
.target Mountaineer Stormpike
>>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 307 >>交任务: |cRXP_FRIENDLY_肮脏的爪子|r
step
    .xp 13 >>升级到13级
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
    >>击杀熊类怪物, 掠夺它们的肉
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
    >>击杀蜘蛛, 搜刮蛛液
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
step
    #sticky
#label Intestines9
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
    >>击杀野猪. 搜刮它们的肠子
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
step
    #requires Meat9
.goto Loch Modan,36.9,46.1,2500
step
    #requires Ichor9
.goto Loch Modan,36.9,46.1,2500
step
    #requires Intestines9
.goto Loch Modan,36.9,46.1,2500
step
.goto Loch Modan,32.6,49.9,40,0
.goto Loch Modan,37.2,46.1,40,0
.goto Loch Modan,36.7,41.6,40,0
.goto Loch Modan,32.6,49.9,40,0
.goto Loch Modan,37.2,46.1,40,0
.goto Loch Modan,36.7,41.6,40,0
    >>找到卡德雷尔, 他沿着主路巡逻
.goto Loch Modan,36.9,46.1
.target Mountaineer Kadrell
>>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    .turnin 416 >>交任务: |cRXP_FRIENDLY_狗头人的耳朵|r
step
    >>进入建筑内部
    .goto Loch Modan,37.2,46.9,15,0
    .goto Loch Modan,37.019,47.806
.target Brock Stoneseeker
>>与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .turnin 6392 >>交任务: |cRXP_FRIENDLY_向布洛克回复|r
step
    .goto Loch Modan,34.828,49.283
.target Vidra Hearthstove
>>与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .turnin 418 >>交任务: |cRXP_FRIENDLY_塞尔萨玛血肠|r
step
    .goto Loch Modan,30.0,68.4,30,0
.goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
.goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
.goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    >>击杀石裂穴居人. 击杀后搜刮它们的牙齿作为战利品
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
step
    #sticky
    #completewith FlyIF
    .money >0.5642
    .goto Loch Modan,30.0,68.4,30,0
.goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
.goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
.goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    +刷怪直到你拥有价值56银42铜的可售物品+金钱, 然后跳过此步骤
step
.goto Loch Modan,32.7,76.5,0
.xp 13+9200 >>升级至9200/11000经验值
step
.goto Loch Modan,22.2,73.3
.target Mountaineer Cobbleflint
>>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .turnin 224 >>交任务: |cRXP_FRIENDLY_保卫国王的领土|r
step
.goto Loch Modan,23.233,73.675
.target Captain Rugelfuss
>>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .turnin 267 >>交任务: |cRXP_FRIENDLY_穴居人的威胁|r
step
    .xp 14 >>在特罗格斯处升级到14级
step
    #sticky
    #completewith next
    .goto Loch Modan,32.0,47.2,150 >>前往塞尔萨玛
step
.goto Loch Modan,33.938,50.954
    .fly Ironforge >>飞往铁炉堡
step
    #sticky
    #label Wand1
    #completewith Wand2
.goto Ironforge,25.8,75.2,0 >>或者, 如果价格低于30秒6铜币, 从拍卖行(AH)购买一根强效魔法杖
.collect 11288,1 --Collect Greater Magic Wand
step
    #label Wand2
    #completewith Wand1
    .goto Ironforge,24.0,16.7,20,0
.goto Ironforge,22.6,16.5
    .vendor >>进入建筑, 然后下楼. 购买一根烟尘魔杖
step
    #requires Wand2
.goto Ironforge,51.1,8.7,18 >>进入建筑
.goto Ironforge,50.4,6.3
    .train 6222 >>训练腐蚀之触(等级2)
    .train 755 >>训练健康药水漏斗
    .train 705 >>学习暗影箭(等级3)
step
    .goto Ironforge,53.2,7.8,18 >>进入建筑
.goto Ironforge,53.0,6.4
    .vendor >>购买消耗品“暗影之魂”(等级1), 然后进行献祭(等级1)
step
    .goto Ironforge,55.501,47.742
    .fly Menethil >>飞往米奈希尔港
step
    .money <0.076
    .goto Wetlands,10.4,56.0,15,0
.goto Wetlands,10.1,56.9,15,0
.goto Wetlands,10.6,57.2,15,0
.goto Wetlands,10.7,56.8
    .vendor >>如果你有 7.6s, 检查尼尔·奥雷的青铜管, 如果存在就购买
    .bronzetube
step
    .money <0.0385
.goto Wetlands,8.1,56.3
    .vendor >>在Dewin处查看治疗药水, 购买至1秒的使用量
step
    #sticky
#completewith next
+在这里等候船只
.goto Wetlands,4.7,57.3
step
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
step
    #sticky
    #completewith next
.goto Darkshore,36.8,44.3,0
.vendor >>如果您愿意, 可以在旅店底层从莱尔德处购买便宜的食物(20铜币, 5级食物)
step
    >>旅店顶层
.goto Darkshore,37.0,44.1
.target Wizbang Cranktoggle
>>与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >>接任务: |cRXP_LOOT_传声盒827号|r
step
    .goto Darkshore,38.8,43.4
.target Tharnariun Treetender
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2118 >>接任务: |cRXP_LOOT_瘟疫蔓延|r
step
    .goto Darkshore,39.3,43.4
.target Terenthis
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 984 >>接任务: |cRXP_LOOT_熊怪的威胁|r
step
    .goto Darkshore,36.621,45.594
.target Gwennyth Bly'Leggonde
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >>接任务: |cRXP_LOOT_搁浅的巨兽|r
step
    .goto Darkshore,36.3,45.6
    .fp Auberdine >>获取奥伯丁的飞行路径
step
    #sticky
#completewith Darkshore2
>>击杀爬行者. 在完成其他任务时, 从它们身上获取腿部道具
    .complete 983,1 --Collect Crawler Leg (x6)
step
    .goto Darkshore,36.4,50.9
    .complete 3524,1 --Collect Sea Creature Bones (x1)
step
    .goto Darkshore,38.3,52.7,30,0
    .goto Darkshore,38.9,62.0,30,0
    .goto Darkshore,38.3,52.7,30,0
    .goto Darkshore,38.9,62.0,30,0
    .goto Darkshore,38.3,52.7
    >>继续向南走, 直到找到一只狂暴熊, 当你触发仇恨时使用背包中的“萨纳瑞恩的希望”
    .complete 2118,1 --Rabid Thistle Bear Captured
step
    #label Darkshore2
.goto Darkshore,39.0,53.2
    .complete 984,1 --Find a corrupt furbolg camp
step
.goto Darkshore,36.7,52.4,40,0
.goto Darkshore,35.6,47.6,40,0
.goto Darkshore,36.2,44.5,40,0
.goto Darkshore,36.7,52.4,40,0
.goto Darkshore,35.6,47.6,40,0
.goto Darkshore,36.2,44.5,40,0
>>击杀爬行者, 搜刮它们的腿
    .complete 983,1 --Collect Crawler Leg (x6)
step
    .goto Darkshore,36.6,46.3
    .turnin 983 >>交任务: |cRXP_FRIENDLY_传声盒827号|r
step
    .goto Darkshore,36.621,45.594
.target Gwennyth Bly'Leggonde
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 3524 >>交任务: |cRXP_FRIENDLY_搁浅的巨兽|r
step
    .goto Darkshore,38.8,43.4
.target Tharnariun Treetender
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2118 >>交任务: |cRXP_FRIENDLY_瘟疫蔓延|r
step
    .goto Darkshore,39.3,43.4
.target Terenthis
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 984 >>交任务: |cRXP_FRIENDLY_熊怪的威胁|r
step
    .goto Darkshore,36.621,45.594
    .abandon 1001 >>放弃传声盒411号
step
    #sticky
#completewith Azuremyst
+在这里等候船只
.goto Darkshore,30.8,41.0
step
    .goto Darkshore,30.8,41.0
.abandon 4681 >>放弃搁浅的巨兽
step
    #label Azuremyst
    .zone Azuremyst Isle >>前往: |cRXP_PICK_秘蓝岛|r
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Alliance Hunter
#name 1-11 丹莫罗
#displayname 1-11 丹莫罗 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor Dwarf Hunter
#next 11-14 黑海岸
step << !Gnome !Dwarf
    #sticky
    #completewith next
.goto Dun Morogh,29.927,71.201
    +您选择的指南适用于侏儒和矮人. 请确保选择与您起始职业相同的初始区域
step
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
    >>与斯登·粗臂交谈
.target Sten Stoutarm
>>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .accept 179 >>接任务: |cRXP_LOOT_矮人的交易|r
step
    .goto Dun Morogh,29.0,74.4
    .complete 179,1 --Tough Wolf Meat (8)
step
    .goto Dun Morogh,29.93,71.20 << tbc
    .goto Dun Morogh,29.87,71.87 << wotlk
>>与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
.target Sten Stoutarm
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 3108 >>接任务: |cRXP_LOOT_风蚀符文|r
step
#xprate <1.5
    .goto Dun Morogh,29.7,71.3
    >>与巴尔林·霜锤交谈
.target Balir Frosthammer
>>与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .accept 170 >>接任务: |cRXP_LOOT_新的威胁|r
step
#xprate <1.5
    #sticky
    #label Rockjaw
    >>杀死你看到的普通石腭穴居人
    .complete 170,1 --Kill Rockjaw Trogg (x6)
step
#xprate <1.5
    .goto Dun Morogh,26.9,72.7,30,0
    .goto Dun Morogh,25.1,72.1,30,0
    .goto Dun Morogh,26.9,72.7,30,0
    .goto Dun Morogh,25.1,72.1,30,0
    >>击杀壮实的石腭怪
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
step
    .goto Dun Morogh,22.601,71.433
    >>与塔林·锐眼交谈
>>与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .turnin 233 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
.target Talin Keeneye
    .accept 234 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 183 >>接任务: |cRXP_LOOT_猎杀野猪|r
step
    .goto Dun Morogh,22.2,72.5,40,0
    .goto Dun Morogh,20.5,71.4,40,0
    .goto Dun Morogh,21.1,69.0,40,0
    .goto Dun Morogh,22.8,69.6,40,0
    .goto Dun Morogh,22.2,72.5,40,0
    .goto Dun Morogh,20.5,71.4,40,0
    .goto Dun Morogh,21.1,69.0,40,0
    .goto Dun Morogh,22.8,69.6,40,0
    >>击杀该区域的野猪
    .complete 183,1 --Kill Small Crag Boar (x12)
step
    .goto Dun Morogh,22.601,71.433
.target Talin Keeneye
>>与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .turnin 183 >>交任务: |cRXP_FRIENDLY_猎杀野猪|r
step
    .goto Dun Morogh,25.076,75.713
    >>与格瑞林·白须交谈
>>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 234 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
.target Grelin Whitebeard
    .accept 182 >>接任务: |cRXP_LOOT_巨魔洞穴|r
step
#completewith next
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
>>击杀霜鬃巨魔幼崽
.complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .goto Dun Morogh,25.076,75.713
step
    .xp 4 >>升级至4级
step
    #requires Rockjaw
    .goto Dun Morogh,25.0,75.9
.target Nori Pridedrift
>>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
step
    #completewith next
    .hs >>回到起始区域
step
#xprate <1.5
    .goto Dun Morogh,29.7,71.3
    >>与巴尔林·霜锤交谈
.target Balir Frosthammer
>>与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .turnin 170 >>交任务: |cRXP_FRIENDLY_新的威胁|r
step
    .goto Dun Morogh,29.1,67.5
    >>与索加斯·格瑞姆森交谈
.target Thorgas Grimson
>>与|cRXP_FRIENDLY_索加斯·格瑞姆森|r交谈
    .turnin 3108 >>交任务: |cRXP_FRIENDLY_风蚀符文|r
        .train 1978 >>训练毒蛇钉刺
step
    .goto Dun Morogh,28.8,66.5
    >>与德南·弗卡特交谈
>>与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
.target Durnan Furcutter
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
step
    .goto Dun Morogh,25.0,75.9
.target Nori Pridedrift
>>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .turnin 3365 >>交任务: |cRXP_FRIENDLY_归还酒杯|r
step
#completewith next
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
    .goto Dun Morogh,22.7,79.3,30,0
    .goto Dun Morogh,20.9,75.7,30,0
>>击杀霜鬃巨魔幼崽
.complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .goto Dun Morogh,25.076,75.713
step
    .goto Dun Morogh,25.0,75.9
>>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
.target Grelin Whitebeard
    .accept 218 >>接任务: |cRXP_LOOT_被窃取的日记|r
step
    .goto Dun Morogh,26.8,79.9,30,0
    .goto Dun Morogh,29.0,79.0,15,0
.goto Dun Morogh,30.6,80.3
    >>进入巨魔洞穴, 击杀格里克尼尔, 然后搜刮他的尸体获取格雷林的日记
    .complete 218,1 --Collect Grelin Whitebeard's Journal (x1)
step
.goto Dun Morogh,28.4,79.7,30,0
.goto Dun Morogh,26.8,79.6,20 >>跑出洞穴外
step
    .goto Dun Morogh,25.076,75.713
>>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
.target Grelin Whitebeard
    .accept 282 >>接任务: |cRXP_LOOT_森内尔的观察站|r
step
    .goto Dun Morogh,33.484,71.841
    >>与巡山人萨鲁斯交谈
>>与|cRXP_FRIENDLY_巡山人萨鲁斯|r交谈
    .turnin 282 >>交任务: |cRXP_FRIENDLY_森内尔的观察站|r
.target Mountaineer Thalos
    .accept 420 >>接任务: |cRXP_LOOT_森内尔的观察站|r
step
    .goto Dun Morogh,33.8,72.2
    >>与汉兹·跳链交谈
.target Hands Springsprocket
>>与|cRXP_FRIENDLY_汉兹·跳链|r交谈
    .accept 2160 >>接任务: |cRXP_LOOT_塔诺克的补给品|r
step
.goto Dun Morogh,34.1,71.6,20,0
.goto Dun Morogh,35.7,66.0,20 >>穿过隧道
step
    #sticky
#completewith BoarMeat3
>>击杀野猪, 获取一些野猪肉以备后用
.collect 769,4 --Collect Chunk of Boar Meat (x4)
step
    #sticky
#completewith BoarRibs
>>击杀野猪获取一些猪排, 以备后续使用
.collect 2886,6 --Collect Crag Boar Rib (x6)
step
    #label BoarMeat3
.goto Dun Morogh,46.726,53.826,100 >>前往卡拉诺斯
step
    #label BoarRibs
.zone Dun Morogh
step
.goto Dun Morogh,46.726,53.826
.target Senir Whitebeard
>>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .turnin 420 >>交任务: |cRXP_FRIENDLY_森内尔的观察站|r
step
    .goto Dun Morogh,46.8,52.4
    >>与拉格纳·雷酒交谈
.target Ragnar Thunderbrew
>>与|cRXP_FRIENDLY_拉格纳·雷酒|r交谈
    .accept 384 >>接任务: |cRXP_LOOT_啤酒烤猪排|r
step
    .goto Dun Morogh,47.217,52.195
    >>与塔诺克·霜锤交谈
.target Tannok Frosthammer
>>与|cRXP_FRIENDLY_塔诺克·霜锤|r交谈
    .turnin 2160 >>交任务: |cRXP_FRIENDLY_塔诺克的补给品|r
step
    .goto Dun Morogh,46.021,51.676
    >>与萨雷克·黑石交谈
.target Tharek Blackstone
>>与|cRXP_FRIENDLY_萨雷克·黑石|r交谈
    .accept 400 >>接任务: |cRXP_LOOT_贝尔丁的工具|r
step
    .goto Dun Morogh,49.5,48.3
    >>与驾驶员贝隆·风箱交谈
.target Pilot Bellowfiz
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .accept 317 >>接任务: |cRXP_LOOT_贝尔丁的补给|r
step
#xprate <1.5
    .goto Dun Morogh,49.6,48.5
    >>与驾驶员迪恩·石轮交谈
.target Pilot Stonegear
>>与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .accept 313 >>接任务: |cRXP_LOOT_灰色洞穴|r
step
    .goto Dun Morogh,50.084,49.420
    >>与罗斯洛·鲁治交谈
.target Loslor Rudge
>>与|cRXP_FRIENDLY_罗斯洛·鲁治|r交谈
    .accept 5541 >>接任务: |cRXP_LOOT_海格纳的弹药|r
step
    .goto Dun Morogh,50.4,49.1
    >>与贝尔丁·钢架交谈
.target Beldin Steelgrill
>>与|cRXP_FRIENDLY_贝尔丁·钢架|r交谈
    .turnin 400 >>交任务: |cRXP_FRIENDLY_贝尔丁的工具|r
step
    #sticky
#completewith BoarRibs2
>>击杀野猪获取猪排, 以备后用
.collect 2886,6 --Collect Crag Boar Rib (x6)
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
    >>获取贝尔丁补给的物品
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
.complete 317,2 --Collect Thick Bear Fur (x2)
step
    .goto Dun Morogh,49.426,48.410
    >>与驾驶员贝隆·风箱交谈
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .turnin 317 >>交任务: |cRXP_FRIENDLY_贝尔丁的补给|r
.target Pilot Bellowfiz
    .accept 318 >>接任务: |cRXP_LOOT_艾沃沙酒|r
step
    .xp 6
step << Hunter
    .goto Dun Morogh,45.8,53.1
    .train 3044 >>学习奥术射击
step
    >>拾取箱子中的物品
.goto Dun Morogh,44.1,56.9
    .complete 5541,1 --Rumbleshot's Ammo (1)
step
    .goto Dun Morogh,40.682,65.130
    >>与海格纳·重枪交谈
.target Hegnar Rumbleshot
>>与|cRXP_FRIENDLY_海格纳·重枪|r交谈
    .turnin 5541 >>交任务: |cRXP_FRIENDLY_海格纳的弹药|r
step << Hunter
    .goto Dun Morogh,40.682,65.130
    >>购买4级枪械升级, 若金钱不足则跳过此步骤
    .collect 2509,1
step
#xprate <1.5
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
    >>进入洞穴. 击杀温迪戈. 搜刮它们的鬃毛
    .complete 313,1 --Collect Wendigo Mane (x8)
step
    .xp 7
step
>>在前往目的地的路上刷一些怪物
    .goto Dun Morogh,35.2,56.4,50,0
    .goto Dun Morogh,36.0,52.0,50,0
    .goto Dun Morogh,34.6,51.7
.target Tundra MacGrann
>>与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .accept 312 >>接任务: |cRXP_LOOT_马克格拉恩的干肉|r
step
    .goto Dun Morogh,38.5,54.0
    >>等到老冰须离开洞穴后, 你就可以潜入并抢夺宝箱, 或者选择这样做
        .link https://www.youtube.com/watch?v=o55Y3LjgKoE >>点击这里
    .complete 312,1 --MacGrann's Dried Meats (1)
step
    .goto Dun Morogh,34.6,51.6
.target Tundra MacGrann
>>与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .turnin 312 >>交任务: |cRXP_FRIENDLY_马克格拉恩的干肉|r
step
    .goto Dun Morogh,30.2,45.8
    >>与雷杰德·麦酒交谈
>>与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 318 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
.target Rejold Barleybrew
    .accept 319 >>接任务: |cRXP_LOOT_艾沃沙酒|r
    .accept 315 >>接任务: |cRXP_LOOT_完美烈酒|r
step
    .goto Dun Morogh,30.2,45.4
    >>与马莱斯·麦酒交谈
.target Marleth Barleybrew
>>与|cRXP_FRIENDLY_马莱斯·麦酒|r交谈
    .accept 310 >>接任务: |cRXP_LOOT_针锋相对|r
    #label BoarRibs2
step
    #title Secondary objective
    #completewith next
    >>击杀熊和野猪和豹子
.complete 319,1 --Kill Ice Claw Bear (x6)
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .complete 319,3 --Kill Snow Leopard (x8)
step << Hunter
>>在前往卡拉诺斯的路上, 一边继续完成其他任务目标, 一边向回移动
    .xp 8-1400
    .complete 384,1
step << Hunter
#xprate <1.5
    .goto Dun Morogh,49.6,48.5
.target Pilot Stonegear
>>与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .turnin 313 >>交任务: |cRXP_FRIENDLY_灰色洞穴|r
step
    .goto Dun Morogh,47.4,52.5
    >>从旅店老板处购买以下物品:
    .complete 384,2 --Rhapsody Malt (1)
    .collect 2686,1,311 --Thunder Ale
step
    .goto Dun Morogh,47.7,52.6
    >>下楼, 将雷霆麦酒交给贾文, 然后点击无人看守的木桶
    .turnin 310 >>交任务: |cRXP_FRIENDLY_针锋相对|r
    .accept 311 >>接任务: |cRXP_LOOT_向马莱斯回报|r
step
    .goto Dun Morogh,47.3,52.5
    .home >>将你的[炉石]设置为卡拉诺斯
step
    .goto Dun Morogh,46.9,52.4
    >>与拉格纳·雷酒交谈
.target Ragnar Thunderbrew
>>与|cRXP_FRIENDLY_拉格纳·雷酒|r交谈
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
step
    .goto Dun Morogh,46.7,53.9
.target Senir Whitebeard
>>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .accept 287 >>接任务: |cRXP_LOOT_霜鬃巨魔要塞|r
step << Hunter
    .goto Dun Morogh,45.810,53.039
    .train 5116>>训练震荡射击
step
    .goto Dun Morogh,63.1,49.8
    >>与鲁德拉·冻石交谈
.target Rudra Amberstill
>>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .accept 314 >>接任务: |cRXP_LOOT_保护牲畜|r
step
    #sticky
    #completewith next
    .goto Dun Morogh,62.3,50.3,12,0
    .goto Dun Morogh,62.2,49.4,8 >>跑上这座山的这一段坡路
step
    >>击杀瓦加什, 搜刮他的利牙
.goto Dun Morogh,62.6,46.1
    .complete 314,1 --Collect Fang of Vagash (x)
step
    .goto Dun Morogh,63.1,49.8
.target Rudra Amberstill
>>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .turnin 314 >>交任务: |cRXP_FRIENDLY_保护牲畜|r
step
    .goto Dun Morogh,69.084,56.330
    >>与工头乔尼·石眉交谈
.target Foreman Stonebrow
>>与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 432 >>接任务: |cRXP_LOOT_该死的石腭怪！|r
step
    >>击杀洞穴巨魔
.goto Dun Morogh,70.6,58.7,40,0
    .goto Dun Morogh,67.2,59.4,40,0
    .complete 432,1 --Rockjaw Skullthumper (6)
step
    .goto Dun Morogh,69.1,56.4
.target Foreman Stonebrow
>>与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .turnin 432 >>交任务: |cRXP_FRIENDLY_该死的石腭怪！|r
step
    .goto Dun Morogh,68.9,55.9
    .vendor >>出售垃圾并修理
step
    #completewith next
    .goto Dun Morogh,81.2,42.7,25 >>途中刷会儿怪, 然后进入隧道
step
    .goto Dun Morogh,83.8,39.2
.target Pilot Hammerfoot
>>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .accept 419 >>接任务: |cRXP_LOOT_失踪的驾驶员|r
step
    >>路上刷怪
.goto Dun Morogh,79.7,36.2
    .turnin 419 >>交任务: |cRXP_FRIENDLY_失踪的驾驶员|r
    .accept 417 >>接任务: |cRXP_LOOT_驾驶员的复仇|r
step
    >>击杀Mangeclaw. 搜刮他的爪子
.goto Dun Morogh,80.0,36.4
    .complete 417,1 --Collect Mangy Claw (x1)
step
    .goto Dun Morogh,83.892,39.188
.target Pilot Hammerfoot
>>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .turnin 417 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r
step << tbc
    #sticky
    #completewith next
    .deathskip >>故意死亡并在卡拉诺斯复活
step << wotlk
    .goto Loch Modan,23.2,17.7
    .zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r
step << wotlk
    >>到达洛克莫丹后, 故意死亡, 然后在塞尔萨玛复活
    .goto Loch Modan,33.938,50.954
    .fp Thelsamar >>获取塞尔萨玛的飞行路径
step << wotlk
    .hs >>炉石到卡拉诺斯
step
#xprate <1.5
    .goto Dun Morogh,45.8,49.4
.target Razzle Sprysprocket
>>与|cRXP_FRIENDLY_拉兹·滑链|r交谈
    .accept 412 >>接任务: |cRXP_LOOT_自动净化装置|r
step
#completewith next
.goto Dun Morogh,43.1,45.0,20,0
.goto Dun Morogh,42.1,45.4,20 >>跑上坡道到达微光草
step
    .goto Dun Morogh,40.9,45.3,30,0
    .goto Dun Morogh,41.5,43.6,30,0
    .goto Dun Morogh,39.7,40.0,30,0
    .goto Dun Morogh,42.1,34.3,30,0
    >>清理此区域的怪物. 若需清除中间营地, 请谨慎行事. 如需额外拉两只怪物, 可将小屋内的怪物引出, 并在小屋后方利用视野(LoS)进行控怪. 若情况不利, 立即跑向另一区域
    .complete 315,1 --Collect Shimmerweed (x6)
step
    .goto Dun Morogh,30.186,45.531
.target Marleth Barleybrew
>>与|cRXP_FRIENDLY_马莱斯·麦酒|r交谈
    .turnin 311 >>交任务: |cRXP_FRIENDLY_向马莱斯回报|r
>>与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 315 >>交任务: |cRXP_FRIENDLY_完美烈酒|r
.target Rejold Barleybrew
    .accept 413 >>接任务: |cRXP_LOOT_微光酒|r << tbc
step
    .goto Dun Morogh,31.5,38.9,40,0
    .goto Dun Morogh,28.3,39.9,40,0
    .goto Dun Morogh,28.7,43.7,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,30.0,51.8,40,0
.goto Dun Morogh,31.5,38.9,40,0
    .goto Dun Morogh,28.3,39.9,40,0
    .goto Dun Morogh,28.7,43.7,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,25.8,47.2,40,0
    .goto Dun Morogh,30.0,51.8,40,0
    >>击杀熊和野猪和豹子
.complete 319,1 --Kill Ice Claw Bear (x6)
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .complete 319,3 --Kill Snow Leopard (x8)
step
    .goto Dun Morogh,30.189,45.725
    >>与雷杰德·麦酒交谈
>>与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 319 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
.target Rejold Barleybrew
    .accept 320 >>接任务: |cRXP_LOOT_艾沃沙酒|r
step
    #sticky
#label hh
    .complete 287,2 --Frostmane Headhunter (5)
step
    >>一定要小心, 别在这里挂掉
    .goto Dun Morogh,22.3,50.7,20,0
    .goto Dun Morogh,22.5,51.5,20,0
.goto Dun Morogh,22.7,52.0
    .complete 287,1 --Fully explore Frostmane Hold (1)
step
#xprate <1.5
    #requires hh
    .goto Dun Morogh,27.2,43.0,40,0
    .goto Dun Morogh,24.8,39.3,40,0
    .goto Dun Morogh,25.6,43.4,40,0
    .goto Dun Morogh,24.3,44.0,40,0
    .goto Dun Morogh,25.4,45.4,40,0
.goto Dun Morogh,27.2,43.0,40,0
    .goto Dun Morogh,24.8,39.3,40,0
    .goto Dun Morogh,25.6,43.4,40,0
    .goto Dun Morogh,24.3,44.0,40,0
    .goto Dun Morogh,25.4,45.4,40,0
    >>击杀麻风侏儒, 搜刮齿轮和齿轮零件
    .complete 412,2 --Collect Gyromechanic Gear (x8)
    .complete 412,1 --Collect Restabilization Cog (x8)
step << tbc
    .goto Dun Morogh,30.9,33.1,15 >>向北跑上山
step << tbc
    .goto Dun Morogh,32.4,29.1,15 >>追踪任务线索到这里
step << tbc
.goto Dun Morogh,33.0,27.2,15,0
    .goto Dun Morogh,33.0,25.2,15,0
    .goto Wetlands,11.6,43.4,60,0
.deathskip >>一直向北跑, 跳下去死亡, 然后重生
step << tbc
.goto Wetlands,12.7,46.7,30 >>游向岸边
step << tbc
.goto Wetlands,9.5,59.7
    .fp Menethil >>获取米奈希尔港的飞行路径
step << tbc
    #completewith next
    .hs >>回到卡拉诺斯
step
    .goto Dun Morogh,46.7,53.7
    >>与森内尔·白须交谈
>>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .turnin 287 >>交任务: |cRXP_FRIENDLY_霜鬃巨魔要塞|r
.target Senir Whitebeard
    .accept 291 >>接任务: |cRXP_LOOT_森内尔的报告|r
step
#xprate <1.5
    .goto Dun Morogh,45.9,49.4
    >>与拉兹·滑链交谈
.target Razzle Sprysprocket
>>与|cRXP_FRIENDLY_拉兹·滑链|r交谈
    .turnin 412 >>交任务: |cRXP_FRIENDLY_自动净化装置|r
step
    .goto Dun Morogh,49.4,48.3
    >>与驾驶员贝隆·风箱交谈
.target Pilot Bellowfiz
>>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .turnin 320 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
step
    .goto Dun Morogh,45.810,53.039
    >>与格瑞夫·威尔哈特交谈
.target Grif Wildheart
>>与|cRXP_FRIENDLY_格瑞夫|r交谈
    .accept 6064 >>接任务: |cRXP_LOOT_驯服野兽|r
step
    .goto Dun Morogh,48.3,56.9
>>在你的物品栏中点击驯兽棒, 对一只大型峭壁野猪使用. 尽量在最大距离(30码)处进行操作
    .complete 6064,1 --Tame a Large Crag Boar (1)
step
    .goto Dun Morogh,45.810,53.039
>>与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6064 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
.target Grif Wildheart
    .accept 6084 >>接任务: |cRXP_LOOT_驯服野兽|r
step
    .goto Dun Morogh,49.4,59.4
>>在你的物品栏中使用驯服棒对雪豹进行驯服, 尽量在最大距离(30码)外操作
    .complete 6084,1 --Tame a Snow Leopard (1)
step
    .goto Dun Morogh,45.810,53.039
>>与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6084 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
.target Grif Wildheart
    .accept 6085 >>接任务: |cRXP_LOOT_驯服野兽|r
step
    .goto Dun Morogh,50.4,59.7
>>在你的物品栏中点击驯服棒, 对冰爪熊使用. 尽量在最大距离(30码)外进行操作
    .complete 6085,1 --Tame an Ice Claw Bear (1)
step
    .goto Dun Morogh,45.810,53.039
>>与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6085 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
.target Grif Wildheart
    .accept 6086 >>接任务: |cRXP_LOOT_训练野兽|r
step << tbc
    #sticky
#completewith next
    +在前往铁炉堡的路上驯服一只冰爪熊或一只冬狼
    .goto Dun Morogh,49.0,44.6,30,0
.goto Dun Morogh,45.7,42.2,30,0
step << tbc
    .goto Ironforge,16.5,84.1
.zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
step << wotlk
#completewith next
    .tame >>驯服一只8级或以上的狼
step << wotlk
    .goto Dun Morogh,30.9,33.1,15 >>向北跑上山
step << wotlk
    .goto Dun Morogh,32.4,29.1,15 >>追踪任务线索到这里
step << wotlk
.goto Dun Morogh,33.0,27.2,15,0
    .goto Dun Morogh,33.0,25.2,15,0
    .goto Wetlands,11.6,43.4,60,0
.deathskip >>一直向北跑, 跳下去死亡, 然后重生
step << wotlk
.goto Wetlands,12.7,46.7,30 >>游向岸边
step << wotlk
.goto Wetlands,9.5,59.7
    .fp Menethil >>获取米奈希尔港的飞行路径
    .fly Ironforge >>飞往铁炉堡
step
    .goto Ironforge,39.6,56.9
.target Senator Barin Redstone
>>与|cRXP_FRIENDLY_参议员巴林·红石|r交谈
    .turnin 291 >>交任务: |cRXP_FRIENDLY_森内尔的报告|r
step
    #sticky
    .money <0.1500
    .goto Ironforge,61.5,89.2
    >>购买9级枪械升级
    .collect 2511,1
step
    .goto Ironforge,70.863,85.831
    >>与贝莉亚·雷岩交谈
.target Belia Thundergranite
>>与|cRXP_FRIENDLY_贝莉亚·雷岩|r交谈
    .turnin 6086 >>交任务: |cRXP_FRIENDLY_训练野兽|r
step
#completewith next
.goto Ironforge,77.0,51.0,20 >>进入矿道地铁
step
    >>与火车站中央平台的侏儒对话
.target Monty
>>与 |cRXP_FRIENDLY_蒙提|r 交谈
    .accept 6661 >>接任务: |cRXP_LOOT_捕捉矿道老鼠|r
step
    .use 17117>>用你的笛子对付周围散落的老鼠
    .complete 6661,1 --Rats Captured (x5)
step << wotlk
>>与 |cRXP_FRIENDLY_蒙提|r 交谈
    .turnin 6661 >>交任务: |cRXP_FRIENDLY_捕捉矿道老鼠|r
.target Monty
    .accept 6662 >>接任务: |cRXP_LOOT_我的兄弟，尼普希|r
step << wotlk
     >>骑乘电车到另一侧并提交任务
.target Nipsy
>>与|cRXP_FRIENDLY_尼普希|r交谈
    .turnin 6662 >>交任务: |cRXP_FRIENDLY_我的兄弟，尼普希|r
step << wotlk
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << wotlk
    .goto StormwindClassic,57.0,57.6
    .trainer >>在贸易区练习弩箭技能
step << wotlk
    >>前往暴风城港口
    .goto StormwindNew,21.8,56.2
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
step << tbc
.goto Ironforge,77.0,51.0,40 >>返回铁炉堡
step << tbc
    .goto Ironforge,55.501,47.742
    .fly Menethil >>飞往米奈希尔港
step << tbc
    .goto Wetlands,4.6,57.2
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r, 乘船前往。等待的时候制作绷带或磨刀石。
]])
