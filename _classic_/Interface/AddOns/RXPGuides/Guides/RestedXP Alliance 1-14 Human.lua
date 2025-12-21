local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Alliance
#name 1-11 艾尔文森林
#displayname 1-13 艾尔文森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Warlock
#displayname 1-11 艾尔文森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor Human
#next 12-14 洛克莫丹;11-14 黑海岸;14-20 秘血岛
step << !Human
    #sticky
    #completewith next
    .goto Elwynn Forest,48.171,42.943
    +您已选择适用于人类的指南. 请确保选择与您起始区域相同的起始地带
step << Warlock tbc
    #sticky
    #completewith next
    +击杀|cRXP_LOOT_Wolves|r可获得价值10铜的商人垃圾物品. 建议尽早学习献祭技能
    .goto Elwynn Forest,49.4,45.6
step << Warlock tbc
    .goto Elwynn Forest,50.1,42.7
    >>与|cRXP_FRIENDLY_丹恩·温斯洛|r交谈
    .vendor >>出售垃圾
    .target Dane Winslow
step << Warlock tbc
    .goto Elwynn Forest,49.873,42.649
    >>与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .accept 1598 >>接任务: |cRXP_LOOT_失窃的典籍|r
    .trainer >>训练燃烧
    .target Drusilla La Salle
step << Warlock tbc
    #hardcore
    .goto Elwynn Forest,52.9,44.3,60,0
    >>途中击杀一些狼, |cRXP_WARN_然后观看此视频|r. 拾取书籍后使用[炉石]
    .link https://www.youtube.com/watch?v=_-KEke9Yeik >>点击这里
    .goto Elwynn Forest,56.7,44.0
    .complete 1598,1 --Collect Powers of the Void (x1)
step << Warlock tbc
    .goto Elwynn Forest,52.9,44.3,60,0
    >>途中击杀一些狼, |cRXP_WARN_然后观看此视频|r
    .link https://www.youtube.com/watch?v=_-KEke9Yeik >>点击这里
    .goto Elwynn Forest,56.7,44.0
    .complete 1598,1 --Collect Powers of the Void (x1)
step << Warlock tbc
    .deathskip >>在灵魂医者处死亡并重生
step << Warlock tbc
    #hardcore
    #completewith next
    >>确保你深入帐篷内部, 这样就不会重新吸引仇恨
    .hs >>回到北郡山谷
step << Warlock tbc
    >>与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .goto Elwynn Forest,49.873,42.649
    .turnin 1598 >>交任务: |cRXP_FRIENDLY_失窃的典籍|r
    .target Drusilla La Salle
step
    >>召唤地狱火, 重施恶魔之肤 << Warlock tbc
    >>与|cRXP_FRIENDLY_维里副队长|r交谈
    .target Deputy Willem
    .goto Elwynn Forest,48.17,42.94 << tbc
    .goto Elwynn Forest,48.05,43.55 << wotlk
    .accept 783 >>接任务: |cRXP_LOOT_身边的危机|r
step << Warrior
    #sticky
    #completewith next
    +击杀|cRXP_LOOT_Wolves|r的狼群, 可获得10铜币以上的垃圾物品. 尽早学习战斗怒吼非常值得
    .goto Elwynn Forest,46.4,40.3,60,0
step << Warrior
    >>与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    .target Brother Danil
    .goto Elwynn Forest,47.5,41.6
    .vendor >>出售垃圾
step
    >>与修道院内的|r马歇尔·麦克布里奇|r交谈
    .target Marshal McBride
    .goto Elwynn Forest,48.923,41.606
    .turnin 783 >>交任务: |cRXP_FRIENDLY_身边的危机|r
    .accept 7 >>接任务: |cRXP_LOOT_剿灭狗头人|r
step << Warrior
    >>与|cRXP_FRIENDLY_莱尼·拜舍尔|r交谈
    .target Llane Beshere
    .goto Elwynn Forest,50.242,42.287
    .trainer >>训练战斗怒吼
step
    >>跑回外面去 << Warrior
    >>再次与|cRXP_FRIENDLY_维里副队长|r交谈
    .target Deputy Willem
    .goto Elwynn Forest,48.17,42.94 << tbc
    .goto Elwynn Forest,48.05,43.55 << wotlk
    .accept 5261 >>接任务: |cRXP_LOOT_伊根·派特斯金纳|r
step << Priest tbc/Mage tbc/Warlock tbc
    .goto Elwynn Forest,46.2,40.4
    .vendor >>击杀|cRXP_LOOT_Wolves|r狼群, 直到获得价值50铜币的可售垃圾物品. 然后前往商人处, 从|cRXP_FRIENDLY_丹尼尔修士|r处购买10瓶水
    .target Brother Danil
    .collect 159,10 --Collect Refreshing Spring Water (x10)
step << Priest/Mage
    .goto Elwynn Forest,46.70,37.78
    .xp 2 >>升级至2级
step
    >>与修道院外的|r伊根·派特斯金纳|r交谈
    .target Eagan Peltskinner
    .goto Elwynn Forest,48.9,40.2
    .turnin 5261 >>交任务: |cRXP_FRIENDLY_伊根·派特斯金纳|r
    .accept 33 >>接任务: |cRXP_LOOT_林中的群狼|r
step << tbc
    .goto Elwynn Forest,46.70,37.78
    >>击杀 |cRXP_LOOT_幼狼|r. 从它们身上搜刮 |cRXP_LOOT_肉|r
    .complete 33,1 --Collect Tough Wolf Meat (x8)
step << wotlk
    .goto Elwynn Forest,46.70,37.78
    >>击杀|cRXP_LOOT_Diseased Young Wolves|r. 击杀后搜刮其|cRXP_LOOT_Pelts|r
    .complete 33,1 --Collect Diseased Wolf Pelt (8)
step
    .goto Elwynn Forest,49.05,35.33
    >>击杀|cRXP_ENEMY_狗头人歹徒|r
    .complete 7,1 --Kill Kobold Vermin (x10)
step
    .goto Elwynn Forest,48.9,40.2
    >>返回|cRXP_FRIENDLY_伊根·派特斯金纳|r
    .target Eagan Peltskinner
    .turnin 33,2 >>交任务: |cRXP_FRIENDLY_林中的群狼|r << Warrior/Paladin/Rogue
    .turnin 33 >>交任务: |cRXP_FRIENDLY_林中的群狼|r << !Warrior !Paladin !Rogue
step << Priest tbc/Mage tbc/Warlock tbc
    .goto Elwynn Forest,47.6,41.5
    .vendor >>出售垃圾, 然后从|r丹尼尔修士|cRXP_FRIENDLY_购买10份水
    .target Brother Danil
    .collect 159,10 --Collect Refreshing Spring Water (x10)
step << !Priest !Mage !Warlock/wotlk
    >>与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    .target Brother Danil
    .goto Elwynn Forest,47.6,41.5
    .vendor >>出售垃圾
step
    .goto Elwynn Forest,48.923,41.606
    >>与修道院内的|r马歇尔·麦克布里奇|r交谈
    .target Marshal McBride
    .turnin 7 >>交任务: |cRXP_FRIENDLY_剿灭狗头人|r
    .accept 3100 >>接任务: |cRXP_LOOT_简要的信件|r << Warrior
    .accept 3101 >>接任务: |cRXP_LOOT_圣洁信件|r << Paladin
    .accept 3102 >>接任务: |cRXP_LOOT_密文信件|r << Rogue
    .accept 3103 >>接任务: |cRXP_LOOT_神圣信件|r << Priest
    .accept 3104 >>接任务: |cRXP_LOOT_雕文信件|r << Mage
    .accept 3105 >>接任务: |cRXP_LOOT_被污染的信件|r << Warlock
    .accept 15 >>接任务: |cRXP_LOOT_回音山调查行动|r
step << Warlock wotlk
    >>与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .target Drusilla La Salle
    .goto Elwynn Forest,49.873,42.649
    .turnin 3105 >>交任务: |cRXP_FRIENDLY_被污染的信件|r
    .train 688 >>从你的职业教练处学习召唤小鬼
    >>你需要95铜币, 如果还没攒够钱, 就去刷一点
step
    .goto Elwynn Forest,49.05,35.33
    .xp 3 >>升级至3级
step
    .goto Elwynn Forest,47.42,32.68
    >>击杀|cRXP_ENEMY_狗头人劳工|r
    .complete 15,1 --Kill Kobold Worker (x10)
step
    #sticky
    #completewith thievesaccept
    #label xp3
    .xp 3+1110 >>在返回途中升级至1110/1400经验值
step
    #completewith next
    >>与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    .target Brother Danil
    .goto Elwynn Forest,47.7,41.4
    .vendor >>出售垃圾
step
    #requires xp3
    >>与修道院内的|r马歇尔·麦克布里奇|r交谈
    .target Marshal McBride
    .goto Elwynn Forest,48.923,41.606
    .turnin 15 >>交任务: |cRXP_FRIENDLY_回音山调查行动|r
    .accept 21 >>接任务: |cRXP_LOOT_回音山清剿行动|r
step << Priest/Mage
    #sticky
    #completewith next
    .goto Elwynn Forest,49.3,40.7,15 >>前往此处
step << Mage
    #sticky
    #completewith next
    .goto Elwynn Forest,49.5,40.0,15 >>上楼
step << Mage
    >>与|cRXP_FRIENDLY_凯尔登·布雷门|r交谈
    .target Khelden Bremen
    .goto Elwynn Forest,49.661,39.402
    .turnin 3104 >>交任务: |cRXP_FRIENDLY_雕文信件|r
    .trainer >>训练你的职业法术
step << Priest
    #sticky
    #completewith next
    .goto Elwynn Forest,49.8,40.2,15 >>穿过门口
step << Priest
    >>与|cRXP_FRIENDLY_女牧师安妮塔|r交谈
    .target Priestess Anetta
    .goto Elwynn Forest,49.808,39.489
    .turnin 3103 >>交任务: |cRXP_FRIENDLY_神圣信件|r
    .trainer >>训练你的职业法术
step << Warrior/Paladin
    #sticky
    #completewith next
    .goto Elwynn Forest,49.6,41.8,15 >>待在楼下
step << Warrior
    >>与|cRXP_FRIENDLY_莱尼·拜舍尔|r交谈
    .target Llane Beshere
    .goto Elwynn Forest,50.242,42.287
    .turnin 3100 >>交任务: |cRXP_FRIENDLY_简要的信件|r
    .trainer >>训练你的职业法术
step << Paladin
    >>与|cRXP_FRIENDLY_萨缪尔修士|r交谈
    .target Brother Sammuel
    .goto Elwynn Forest,50.433,42.124
    .turnin 3101 >>交任务: |cRXP_FRIENDLY_圣洁信件|r
    .trainer >>训练你的职业法术
step
    #label thievesaccept
    >>与|cRXP_FRIENDLY_维里副队长|r交谈
    .target Deputy Willem
    .goto Elwynn Forest,48.17,42.94 << tbc
    .goto Elwynn Forest,48.05,43.55 << wotlk
    .accept 18 >>接任务: |cRXP_LOOT_潜行者兄弟会|r
step << Warlock
    >>与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .target Drusilla La Salle
    .goto Elwynn Forest,49.873,42.649
    .turnin 3105 >>交任务: |cRXP_FRIENDLY_被污染的信件|r
    .xp 4 >>升级至4级
    .trainer >>训练腐蚀之触
step
    .goto Elwynn Forest,54.57,49.03
    >>击杀|cRXP_LOOT_迪菲亚暴徒|r. 击败他们以获取|cRXP_LOOT_头巾|r
    .complete 18,1 --Collect Red Burlap Bandana (x12)
step << Rogue
    .xp 4 >>升级至4级
step
    >>与|cRXP_FRIENDLY_维里副队长|r交谈
    .target Deputy Willem
    .goto Elwynn Forest,48.17,42.94 << tbc
    .goto Elwynn Forest,48.05,43.55 << wotlk
    .turnin 18,4 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Paladin
    .turnin 18,1 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Rogue/Warlock
    .turnin 18,5 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Mage
    .turnin 18,2 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Priest
    .turnin 18,3 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Warrior
    .turnin 18 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << !Warrior !Priest !Mage !Rogue !Warlock !Paladin
    .accept 6 >>接任务: |cRXP_LOOT_加瑞克·帕德弗特的赏金|r
    .accept 3903 >>接任务: |cRXP_LOOT_米莉·奥斯沃斯|r
step
    >>与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    .target Brother Danil
    .goto Elwynn Forest,47.7,41.4
    .vendor >>出售垃圾并修理
step
    .goto Elwynn Forest,47.66,31.88,40,0
    .goto Elwynn Forest,48.61,27.63
    >>在矿井中击杀|cRXP_ENEMY_Laborers|r
    .complete 21,1 --Kill Kobold Laborer (x12)
step
    .xp 5 >>升级至5级
step
#xprate >1.69
    >>与|cRXP_FRIENDLY_米莉·奥斯沃斯|r交谈
    .target Milly Osworth
    .goto Elwynn Forest,50.7,39.2
    .turnin 3903 >>交任务: |cRXP_FRIENDLY_米莉·奥斯沃斯|r
step
#xprate <1.7
    >>与|cRXP_FRIENDLY_米莉·奥斯沃斯|r交谈
    .target Milly Osworth
    .goto Elwynn Forest,50.7,39.2
    .turnin 3903 >>交任务: |cRXP_FRIENDLY_米莉·奥斯沃斯|r
    .accept 3904 >>接任务: |cRXP_LOOT_米莉的葡萄|r
step << Rogue
    >>与|cRXP_FRIENDLY_乔里克·克里丹|r交谈
    .target Jorik Kerridan
    .goto Elwynn Forest,50.314,39.916
    >>你不需要学习任何法术
    .turnin 3102 >>交任务: |cRXP_FRIENDLY_密文信件|r
step
#xprate <1.7
    >>在田野里拾取|cRXP_PICK_葡萄桶|r
    .goto Elwynn Forest,54.5,49.4
    .complete 3904,1 --Collect Milly's Harvest (x8)
step
    .goto Elwynn Forest,57.5,48.2
    >>路上刷怪. 击杀|cRXP_LOOT_Garrick|r并搜刮他的|cRXP_LOOT_Head|r
    .complete 6,1 --Collect Garrick's Head (x1)
step
    .xp 5+1175 >>在返回途中升级, 达到1175+/2800经验值
    .goto Elwynn Forest,50.7,39.2
step
#xprate <1.7
    >>与|cRXP_FRIENDLY_米莉·奥斯沃斯|r交谈
    .target Milly Osworth
    .goto Elwynn Forest,50.7,39.2
    .turnin 3904 >>交任务: |cRXP_FRIENDLY_米莉的葡萄|r
    .accept 3905 >>接任务: |cRXP_LOOT_葡萄出货单|r
step
    >>与|cRXP_FRIENDLY_维里副队长|r交谈
    .target Deputy Willem
    .goto Elwynn Forest,48.17,42.94 << tbc
    .goto Elwynn Forest,48.05,43.55 << wotlk
    .turnin 6,2 >>交任务: |cRXP_FRIENDLY_加瑞克·帕德弗特的赏金|r << Warrior/Rogue/Paladin
    .turnin 6 >>交任务: |cRXP_FRIENDLY_加瑞克·帕德弗特的赏金|r << !Warrior !Rogue !Paladin
step
    >>与修道院内的|r马歇尔·麦克布里奇|r交谈
    .target Marshal McBride
    .goto Elwynn Forest,48.923,41.606
    .turnin 21,2 >>交任务: |cRXP_FRIENDLY_回音山清剿行动|r << Warrior/Paladin
    .turnin 21 >>交任务: |cRXP_FRIENDLY_回音山清剿行动|r << !Warrior !Paladin
    .accept 54 >>接任务: |cRXP_LOOT_去闪金镇报到|r
step
    #sticky
    #completewith next
    .goto Elwynn Forest,49.6,41.6,15,0
    .goto Elwynn Forest,48.9,41.3,10 >>上楼
step
#xprate <1.7
    >>与|cRXP_FRIENDLY_尼尔斯修士|r交谈
    .target Brother Neals
    .goto Elwynn Forest,49.471,41.586
    .turnin 3905 >>交任务: |cRXP_FRIENDLY_葡萄出货单|r
step << Priest
    >>与|cRXP_FRIENDLY_女牧师安妮塔|r交谈
    .target Priestess Anetta
    .goto Elwynn Forest,49.808,39.489
    .accept 5623 >>接任务: |cRXP_LOOT_圣光的恩赐|r
step
    >>离开北郡山谷, 然后与|cRXP_FRIENDLY_法尔坎·伊森斯泰德|r交谈
    .target Falkhaan Isenstrider
    .goto Elwynn Forest,45.6,47.7
    .accept 2158 >>接任务: |cRXP_LOOT_休息和放松|r
step
    #hardcore
    >>与|cRXP_FRIENDLY_马歇尔·杜根|r交谈
    .target Marshal Dughan
    .goto Elwynn Forest,42.105,65.927
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
step
    #softcore
    #completewith Goldshire
    .deathskip >>在灵魂医者处死亡并重生
step << Rogue
    .goto Elwynn Forest,41.706,65.544
    .target Smith Argus
    .train 2018 >>在阿古斯学习锻造技能. 这将让你制作出为武器提供+2伤害的强化石, 效果非常强力. 持续制作直到等级达到约20级 << Rogue
step << Warrior
    .goto Elwynn Forest,41.5,65.9
    .money <0.0509
    .target Corina Steele
    >>修理你的武器. 如果你有足够的钱(5银9铜), 就从科丽娜那里买一把步兵剑. 否则, 跳过这一步(稍后再回来)
    .collect 2488,1 --Collect Gladius
step << Rogue
    .goto Elwynn Forest,41.5,65.9
    .money <0.0382
    .target Corina Steele
    >>修理你的武器. 如果你有足够的钱(3先令82便士), 从科里娜那里买一把卷刃的剑. 否则, 跳过这一步(稍后你会回来处理)
    .collect 2494,1 --Collect Stiletto
step << Paladin
    .goto Elwynn Forest,41.5,65.9
    .money <0.0666
    .target Corina Steele
    >>修理你的武器. 如果你有足够的钱(6先令66铜币), 从科里娜那里购买一把木槌棒；否则, 跳过此步骤(稍后会回来)
    .collect 2493,1 --Collect Wooden Mallet
step << Mage/Priest/Warlock
    #completewith next
    >>与|cRXP_FRIENDLY_安德温·克里顿|r交谈
    .target Andrew Krighton
    .goto Elwynn Forest,41.7,65.9
    .vendor >>出售垃圾并修理
step
    #label Goldshire
    >>与|cRXP_FRIENDLY_马歇尔·杜根|r交谈
    .target Marshal Dughan
    .goto Elwynn Forest,42.105,65.927
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
step
    >>进入旅店后, 在你左侧与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .target William Pestle
    .goto Elwynn Forest,42.9,65.7,15,0
    .goto Elwynn Forest,43.283,65.721
    .accept 60 >>接任务: |cRXP_LOOT_狗头人的蜡烛|r
step
    .goto Elwynn Forest,43.771,65.803
    >>与|cRXP_FRIENDLY_旅店老板法雷|r交谈
    .target Innkeeper Farley
    >>请勿在此处购买任何食物或饮料 << Warlock
    .turnin 2158 >>交任务: |cRXP_FRIENDLY_休息和放松|r
    .home >>将你的[炉石]设置为闪金镇
step
    .xp 6 >>升级至6级
step << Rogue
    >>与|cRXP_FRIENDLY_布洛葛·哈姆菲斯特|r交谈
    .target Brog Hamfist
    .goto Elwynn Forest,43.96,65.92
    .vendor 151 >>从布罗格处购买3级投掷武器. 装备它
step << Warlock
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >>前往旅店老板身后房间, 然后下楼
step << Warlock
    >>与|cRXP_FRIENDLY_玛克西米利安·克洛文|r和|cRXP_FRIENDLY_塞琳娜·达克哈特|r交谈
    .target Maximillian Crowe
    .target Cylina Darkheart
    .goto Elwynn Forest,44.4,66.2
    .trainer >>训练你的职业法术. 它在地下室
    .goto Elwynn Forest,44.4,66.0
    .vendor >>训练后如果有余钱, 就购买血契之书(否则稍后再买) << tbc
step << Mage/Priest/Rogue
    #completewith next
    .goto Elwynn Forest,43.7,66.4,12 >>上楼
step << Mage
    .goto Elwynn Forest,43.2,66.2
    .trainer >>训练你的职业法术
step << Priest
    .goto Elwynn Forest,43.283,65.721
>>与|cRXP_FRIENDLY_女牧师洁塞塔|r交谈
    .turnin 5623 >>交任务: |cRXP_FRIENDLY_圣光的恩赐|r
.target Priestess Josetta
    .accept 5624 >>接任务: |cRXP_LOOT_圣光之衣|r
    .trainer >>训练你的职业法术
step << Rogue
    .money <0.01
    >>与|cRXP_FRIENDLY_科瑞恩·塞尔留斯|r交谈
    .target Keryn Sylvius
    .goto Elwynn Forest,43.9,65.9
    .trainer >>训练你的职业法术
step << Rogue/Warrior
    .money <0.01
    >>与|cRXP_FRIENDLY_米歇尔·贝利|r交谈
    .target Michelle Belle
    .goto Elwynn Forest,43.4,65.5
    .train 3273 >>学习急救技能 - 不要一次性制作所有绷带, 稍后再制作更合适
step << Warrior tbc
    .goto Elwynn Forest,43.771,65.803
    .vendor >>购买5级食物, 价格压至1银
step << Rogue tbc
    .goto Elwynn Forest,43.771,65.803
    .vendor >>最多购买20份5级食物
step << Warrior/Paladin
    .goto Elwynn Forest,41.706,65.544
    .target Smith Argus
    .train 2018 >>在阿古斯学习锻造技能. 这将使你能够制作出为武器提供+2伤害加成的锐化石 << Warrior
    .train 2018 >>在阿古斯学习锻造技能. 这将让你为武器制作+2伤害的加重石 << Paladin
step << Warrior
    >>与|cRXP_FRIENDLY_里瑞亚·杜拉克|r交谈
    .target Lyria Du Lac
    .goto Elwynn Forest,41.087,65.768
    .trainer >>训练你的职业法术
step << Paladin
    >>与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    .target Brother Wilhelm
    .goto Elwynn Forest,41.1,66.0
    .trainer >>训练你的职业法术
step
    >>与|cRXP_FRIENDLY_雷米“两次”|r交谈
    .target Remy "Two Times"
    .goto Elwynn Forest,42.1,67.3
    .accept 47 >>接任务: |cRXP_LOOT_金砂交易|r
step << Priest
    >>对|cRXP_FRIENDLY_卫兵罗伯兹|r使用治疗术(低阶)等级2, 然后施放真言术:坚韧
    .target Guard Roberts
    .goto Elwynn Forest,48.2,68.0
    .complete 5624,1 --Heal and fortify Guard Roberts
step
    #completewith BoarMeat1
    >>开始击杀你看到的野猪, 以获得|T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    .collect 769,4 --Collect Chunk of Boar Meat (x4)
step
    >>与|cRXP_FRIENDLY_斯通菲尔德妈妈|r和|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    .target "Auntie" Bernice Stonefield
    .goto Elwynn Forest,34.486,84.253
    .accept 85 >>接任务: |cRXP_LOOT_丢失的项链|r
    .goto Elwynn Forest,34.660,84.482
    .accept 88 >>接任务: |cRXP_LOOT_公主必须死！|r
step
    #completewith Candles
    >>击杀|cRXP_LOOT_Kobolds|r并从他们身上搜刮|cRXP_LOOT_Candles|r
    .complete 60,1 --Collect Kobold Candle (x8)
step
    #label Candles
    #completewith next
    >>击杀|cRXP_LOOT_Kobolds|r并从他们身上搜刮|cRXP_LOOT_金砂|r
    .complete 47,1 --Collect Gold Dust (x10)
step << Priest/Mage/Warlock
    #label Dust
    >>向东刷怪, 然后与|cRXP_FRIENDLY_比利·马科伦|r交谈
    .target Billy Maclure
    .goto Elwynn Forest,43.132,85.722
    .turnin 85 >>交任务: |cRXP_FRIENDLY_丢失的项链|r
    .accept 86 >>接任务: |cRXP_LOOT_比利的馅饼|r
step << Warrior
    #label Dust
    >>向东刷怪, 然后与|cRXP_FRIENDLY_比利·马科伦|r交谈
    .target Billy Maclure
    >>如果你在任何时候获得一块劣质的石头, 可通过锻造将其制成磨刀石, 然后用它来强化你的剑
    .goto Elwynn Forest,43.132,85.722
    .turnin 85 >>交任务: |cRXP_FRIENDLY_丢失的项链|r
    .accept 86 >>接任务: |cRXP_LOOT_比利的馅饼|r
step << Rogue
    #label Dust
    >>向东刷怪, 然后与|cRXP_FRIENDLY_比利·马科伦|r交谈
    .target Billy Maclure
    >>如果你在任何时候获得一块劣质的石头, 可以通过锻造将其制成磨刀石, 并应用在你的匕首上
    .goto Elwynn Forest,43.132,85.722
    .turnin 85 >>交任务: |cRXP_FRIENDLY_丢失的项链|r
    .accept 86 >>接任务: |cRXP_LOOT_比利的馅饼|r
step << Paladin
    #label Dust
    >>向东刷怪, 然后与|cRXP_FRIENDLY_比利·马科伦|r交谈
    .target Billy Maclure
    >>如果你在任何时候获得一块劣质的石头, 可以通过锻造将其制成重锤石, 并装备到你的狼牙棒上
    .goto Elwynn Forest,43.132,85.722
    .turnin 85 >>交任务: |cRXP_FRIENDLY_丢失的项链|r
    .accept 86 >>接任务: |cRXP_LOOT_比利的馅饼|r
step
    #label BoarMeat1
    >>与小屋中的|cRXP_FRIENDLY_梅贝尔·马科伦|r交谈
    .target Maybell Maclure
    .goto Elwynn Forest,43.2,89.6
    .accept 106 >>接任务: |cRXP_LOOT_年轻的恋人|r
step << Mage tbc/Priest tbc/Warlock tbc
    .goto Elwynn Forest,42.4,89.4
    >>与|cRXP_FRIENDLY_乔舒·马科伦|r交谈
    .target Joshua Maclure
    .vendor >>商人, 尽可能多购买牛奶
step << !Mage !Priest !Warlock tbc
    >>与|cRXP_FRIENDLY_乔舒·马科伦|r交谈
    .target Joshua Maclure
    .goto Elwynn Forest,42.4,89.4
    .vendor >>出售垃圾
step
    #completewith next
    >>刷怪|cRXP_LOOT_野猪|r途中获得 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    .collect 769,4 --Collect Chunk of Boar Meat (x4)
step
    >>返回斯通菲尔德农场, 然后继续前往河边. 与|cRXP_FRIENDLY_托米·乔·斯通菲尔德|r交谈
    .target Tommy Joe Stonefield
    .goto Elwynn Forest,29.840,85.997
    .turnin 106 >>交任务: |cRXP_FRIENDLY_年轻的恋人|r
    .accept 111 >>接任务: |cRXP_LOOT_托米的祖母|r
step
    .goto Elwynn Forest,32.5,85.5
    >>完成击杀你所见到的|cRXP_LOOT_野猪|r, 以获取 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r|r
    .complete 86,1 --Collect Chunk of Boar Meat (x4)
step
    >>返回至|cRXP_FRIENDLY_“波尼斯·斯通菲尔德姑妈”|r
    .target "Auntie" Bernice Stonefield
    .goto Elwynn Forest,34.486,84.253
    .turnin 86 >>交任务: |cRXP_FRIENDLY_比利的馅饼|r
    .accept 84 >>接任务: |cRXP_LOOT_比利的馅饼|r
step
    >>与屋内的米莱德·斯通菲尔德交谈
    .target Gramma Stonefield
    .goto 1429,34.945,83.855
    .turnin 111 >>交任务: |cRXP_FRIENDLY_托米的祖母|r
    .accept 107 >>接任务: |cRXP_LOOT_给威廉·匹斯特的信|r
step
    #sticky
    #completewith next
    >>击杀|cRXP_LOOT_Kobolds|r并搜刮出|cRXP_LOOT_Candles|r和|cRXP_LOOT_金砂|r
    .complete 47,1 --Collect Gold Dust (x10)
    .complete 60,1 --Collect Kobold Candle (x8)
step
    >>向东在矿井外围刷怪, 然后与农场上的|cRXP_FRIENDLY_比利·马科伦|r交谈
    .target Billy Maclure
    .goto Elwynn Forest,43.132,85.722
    .turnin 84 >>交任务: |cRXP_FRIENDLY_比利的馅饼|r
    .accept 87 >>接任务: |cRXP_LOOT_金牙|r
step
    #completewith next
    >>击杀|cRXP_LOOT_Kobolds|r并搜刮出|cRXP_LOOT_Candles|r和|cRXP_LOOT_金砂|r
    .complete 47,1 --Collect Gold Dust (x10)
    .complete 60,1 --Collect Kobold Candle (x8)
step
    >>进入矿井
    .goto Elwynn Forest,40.5,82.3
    .complete 62,1 --Scout Through the Fargodeep Mine
step << Warrior
    >>|cRXP_WARN_尽可能多地积攒怒气|r(通过击杀其他怪物刷怒气)然后击杀|cRXP_LOOT_金牙|r以获得|cRXP_LOOT_伯妮斯的项链|r
    .goto Elwynn Forest,41.7,78.1
    .complete 87,1 --Collect Bernice's Necklace  (x1)
    .unitscan Goldtooth
step << !Warrior
    >>击杀|cRXP_LOOT_金牙|r以获得|cRXP_LOOT_伯妮斯的项链|r
    .goto Elwynn Forest,41.7,78.1
    .complete 87,1 --Collect Bernice's Necklace  (x1)
    .unitscan Goldtooth
step << Warrior
    #sticky
    #completewith Goldtooth
    +|cRXP_WARN_从现在开始尽量保留一瓶治疗药水, 因为稍后你会用它来治疗罗尔夫的尸体|r
step << Warrior/Rogue
    >>如果你拾取了劣质的石头, 记得制作磨刀石
    .xp 7+1600 >>刷怪直到达到1600/4500经验值
step << Paladin
    >>如果你捡到了劣质的石头, 记得制作重量石
    .xp 7+1600 >>刷怪直到达到1600/4500经验值
step << !Priest !Paladin !Warrior !Rogue
    .xp 7+1600 >>刷怪直到达到1600/4500经验值
step << Priest
    .xp 7+1260 >>升级至1260+/4500经验
step
    #label KoboldTurnins
    .goto Elwynn Forest,40.5,82.3
    >>击杀|cRXP_LOOT_Kobolds|r并搜刮出|cRXP_LOOT_Candles|r和|cRXP_LOOT_金砂|r
    .complete 47,1 --Collect Gold Dust (x10)
    .complete 60,1 --Collect Kobold Candle (x8)
step
    #label Goldtooth
    #requires KoboldTurnins
    >>回到|cRXP_FRIENDLY_“波尼斯·斯通菲尔德姑妈”|r
    .target "Auntie" Bernice Stonefield
    .goto Elwynn Forest,34.486,84.253
    .turnin 87 >>交任务: |cRXP_FRIENDLY_金牙|r
step
    >>击杀一些怪物回到闪金镇
    .xp 7+2690 >>刷怪直到2690/4500经验值 << !Priest
    .xp 7+2350 >>刷怪直到经验值达到2350+/4500 << Priest
    .goto Elwynn Forest,42.1,67.3
step << wotlk
    #completewith next
    .hs >>传送回家园或跑回闪金镇
step
    >>与|cRXP_FRIENDLY_雷米“两倍”|r交谈
    .target Remy "TWo Times"
    .goto Elwynn Forest,42.1,67.3
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
    .accept 40 >>接任务: |cRXP_LOOT_鱼人的威胁|r
step << Rogue
    .goto Elwynn Forest,41.5,65.9
    >>修理你的武器. 如果你有足够的钱(3先令82便士), 从科里娜那里买一把卷刃的剑. 否则, 跳过这一步(稍后你会回来处理)
    .collect 2494,1
step
    >>与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .target Marshal Dughan
    .goto Elwynn Forest,42.105,65.927
    .turnin 40 >>交任务: |cRXP_FRIENDLY_鱼人的威胁|r
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
step
    #completewith next
    .goto Elwynn Forest,41.7,65.9
    .vendor >>出售垃圾并修理
step
    >>进入旅店, 与威廉交谈
    .goto Elwynn Forest,43.283,65.721
>>与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .turnin 60 >>交任务: |cRXP_FRIENDLY_狗头人的蜡烛|r
.target William Pestle
    .accept 61 >>接任务: |cRXP_LOOT_送往暴风城的货物|r
    .turnin 107 >>交任务: |cRXP_FRIENDLY_给威廉·匹斯特的信|r
    .accept 112 >>接任务: |cRXP_LOOT_收集海藻|r
step
    .xp 8 >>升级至8级
step << Warlock
    >>返回地下室
    .goto Elwynn Forest,44.4,66.2
    .trainer >>训练你的职业法术
    .goto Elwynn Forest,44.4,66.0
    .vendor >>如果训练后还有钱, 就购买《火闪》这本书(否则稍后再买) << tbc
step
    .money <0.1250
    .goto Elwynn Forest,44.0,65.9
    .vendor >>从Brog处购买一个6槽位背包
step << Warrior
    .goto Elwynn Forest,41.087,65.768
    .trainer >>训练你的职业法术
step << Paladin
    .goto Elwynn Forest,41.1,66.0
    .trainer >>训练你的职业法术
step << Warrior
    .goto Elwynn Forest,41.5,65.9
    >>修理你的武器. 如果你有足够的钱(5银9铜), 就从科丽娜那里买一把步兵剑. 否则, 跳过这一步(稍后再回来)
    .collect 2488,1
step << Paladin
    .goto Elwynn Forest,41.5,65.9
    >>修理你的武器. 如果你有足够的钱(6先令66铜币), 从科里娜那里购买一把木槌棒；否则, 跳过此步骤(稍后会回来)
    .collect 2493,1 --Collect Wooden Mallet
step << Mage/Priest/Rogue/Warrior
    #completewith next
    .goto Elwynn Forest,43.7,66.4,15 >>上楼
step << Mage
    .goto Elwynn Forest,43.2,66.2
    .trainer >>训练你的职业法术
step << Priest
    .goto Elwynn Forest,43.283,65.721
.target Priestess Josetta
>>与|cRXP_FRIENDLY_女牧师洁塞塔|r交谈
    .turnin 5624 >>交任务: |cRXP_FRIENDLY_圣光之衣|r
    .trainer >>训练你的职业法术
step << Rogue
    .goto Elwynn Forest,43.9,65.9
    .trainer >>训练你的职业法术
step << Rogue/Warrior
    .money <0.01
    .goto Elwynn Forest,43.4,65.5
    .trainer >>学习急救技能 - 不要一次性制作所有绷带, 稍后再制作更合适
step << !Warrior !Rogue tbc
    .goto Elwynn Forest,43.771,65.803
    .vendor >>购买等级5的水, 最多40瓶
step << Warrior/Rogue tbc
    .goto Elwynn Forest,43.771,65.803
    .vendor 295 >>购买5级食物, 最多40份
step
    >>向东击杀鱼人以获取海带叶, 如果还需要更多, 可以去岛上击杀怪物
    .goto Elwynn Forest,47.6,63.3,100,0
    .goto Elwynn Forest,51.4,64.6,100,0
    .goto Elwynn Forest,57.6,62.8,100,0
    .goto Elwynn Forest,56.4,66.6,100,0
    .goto Elwynn Forest,53.8,66.8,100,0
    .goto Elwynn Forest,57.6,62.8
    .complete 112,1 --Collect Crystal Kelp Frond (x4)
step
    >>进入矿井, 沿着中间的路径继续前行
    >>途中刷怪
    .goto Elwynn Forest,61.8,54.0,70,0
    .goto Elwynn Forest,60.4,50.2
    .complete 76,1 --Scout through the Jasperlode Mine
step << wotlk
    #completewith next
    .deathskip >>故意死亡并在阿佐拉塔重生
step
    >>与桥边的卫兵托马斯对话
    .goto Elwynn Forest,73.973,72.179
>>与|cRXP_FRIENDLY_卫兵托马斯|r交谈
    .turnin 35 >>交任务: |cRXP_FRIENDLY_卫兵托马斯|r
.target Guard Thomas
    .accept 37 >>接任务: |cRXP_LOOT_失踪的卫兵|r
    .accept 52 >>接任务: |cRXP_LOOT_保卫边境|r
step
    #sticky
    #completewith Prowlers
    #label prowling
    >>像完成其他任务一样, 击杀觅食的灰狼
    .complete 52,1 --Kill Prowler (x8)
step
    #sticky
    #completewith Prowlers
    >>像完成其他任务一样击杀熊, 看到任何熊都杀掉
    .complete 52,2 --Kill Young Forest Bear (x5)
step
    .goto Elwynn Forest,72.7,60.3
    .turnin 37 >>交任务: |cRXP_FRIENDLY_失踪的卫兵|r
    .accept 45 >>接任务: |cRXP_LOOT_罗尔夫的下落|r
step
#xprate <1.7
    .goto Elwynn Forest,81.382,66.112
    >>尽快前往东谷伐木场领取这个任务！
.target Supervisor Raelen
>>与|cRXP_FRIENDLY_管理员莱琳|r交谈
    .accept 5545 >>接任务: |cRXP_LOOT_木材危机|r
step << Paladin tbc
    #sticky
    #completewith Bundles
    +在前往鱼人区域前完成所有任务, 我们要进行一次死亡跳
step
#xprate <1.7
    #sticky
    #completewith next
    .goto Elwynn Forest,76.8,62.4,100,0
    .goto Elwynn Forest,83.7,59.4,100,0
    .goto Elwynn Forest,76.8,62.4,100,0
    .goto Elwynn Forest,83.7,59.4,100,0
    .goto Elwynn Forest,76.8,62.4
    >>在树根处收集木捆. 优先完成此任务
    .complete 5545,1 --Collect Bundle of Wood (x8)
step
    #label Bundles
    .goto Elwynn Forest,79.8,55.5,90 >>前往守卫的尸体所在位置
    .isOnQuest 45
step << Priest
    .goto Elwynn Forest,79.8,55.5
    >>击杀尸体周围的怪物. 提前施放“治疗术”和“盾牌”, 确保法力值满额, 然后将前方小屋前的两只怪物拉怪, 拉开距离后集中火力击杀其中一只. 击杀后立刻撤离, 再处理另一只. 最后拾取地上的尸体
    >>请注意, 这个任务难度较高
    .turnin 45 >>交任务: |cRXP_FRIENDLY_罗尔夫的下落|r
    .accept 71 >>接任务: |cRXP_LOOT_回复托马斯|r
step << !Paladin
    .goto Elwynn Forest,79.8,55.5
    >>击杀尸体周围的怪物. 将前方小屋前的两只怪物拉怪, 移动距离后对其中一只施放“羊群控制”, 同时击杀另一只, 最后击杀被羊群控制的怪物. 拾取地上的尸体 << Mage
    >>激怒目标, 然后击杀尸体周围的两个怪物. 将前方小屋前的两个怪物拉到一起, 远离后先控制一个使其无法行动, 再击杀另一个. 击杀其中一个时(使用弹珠技能), 立即逃跑, 随后重新拉出并击杀另一个. 最后拾取地上的尸体掉落物 << Warrior
    >>击杀尸体周围的怪物. 将前方小屋前的两只怪物拉到安全位置, 远离群体后逐个击破. 使用闪避技能. 击杀其中一只后立即撤离, 再处理另一只. 拾取地上的尸体掉落物 << Rogue
     >>击杀尸体周围的怪物. 将前方小屋前的两只怪物拉到安全位置, 远离后保持一只怪物恐惧状态, 并尽量让两只怪物都维持DOT伤害. 最后拾取地上的尸体 << Warlock
    >>请注意, 这个任务难度较高
    .turnin 45 >>交任务: |cRXP_FRIENDLY_罗尔夫的下落|r
    .accept 71 >>接任务: |cRXP_LOOT_回复托马斯|r
step << Paladin tbc
    #softcore
    .goto Elwynn Forest,79.8,55.5
    >>跑到尸体上方, 然后使用神圣保护, 立即拾取尸体和交任务并接受新任务. 之后你会死亡
    .turnin 45 >>交任务: |cRXP_FRIENDLY_罗尔夫的下落|r
    .accept 71 >>接任务: |cRXP_LOOT_回复托马斯|r
step << Paladin wotlk
    .goto Elwynn Forest,79.8,55.5
    >>击杀尸体周围的怪物. 将前方小屋前的两只怪物拉到安全位置, 远离后, 再对其中一只小屋内的怪物使用爆发技能进行清理. 当两只怪物都锁定你时, 立即使用神圣防护(Divine Protection), 若血量不足则治疗或撤离, 随后返回击杀另一只怪物
    >>请注意, 这个任务难度较高
    .turnin 45 >>交任务: |cRXP_FRIENDLY_罗尔夫的下落|r
    .accept 71 >>接任务: |cRXP_LOOT_回复托马斯|r
step << Paladin tbc
    #softcore
    #sticky
    #completewith Prowlers
    .goto Elwynn Forest,83.6,69.7,120 >>死亡后在灵魂医者处复活, 或者如果有人已清理尸体, 则立即跑回
step
    .goto Elwynn Forest,76.8,62.4,90,0
    .goto Elwynn Forest,83.7,59.4,90,0
    .goto Elwynn Forest,76.8,62.4,90,0
    .goto Elwynn Forest,83.7,59.4,90,0
    .goto Elwynn Forest,76.8,62.4,90,0
    .goto Elwynn Forest,83.7,59.4,90,0
    .goto Elwynn Forest,76.8,62.4
    >>开始往回跑, 清理掉那些包裹
    .complete 5545,1 --Collect Bundle of Wood (x8)
step
    .goto Elwynn Forest,81.382,66.112
.target Supervisor Raelen
>>与|cRXP_FRIENDLY_管理员莱琳|r交谈
    .turnin 5545 >>交任务: |cRXP_FRIENDLY_木材危机|r
step
    #label Prowlers
    .xp 9 >>升级到9级
step
#xprate <1.7
    #label Bears
    .goto Elwynn Forest,79.457,68.789
.target Sara Timberlain
>>与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .accept 83 >>接任务: |cRXP_LOOT_红色亚麻布|r
step
    .goto Elwynn Forest,76.7,75.6,100,0
    .goto Elwynn Forest,79.7,83.7,100,0
    .goto Elwynn Forest,82.0,76.8,100,0
    .goto Elwynn Forest,76.7,75.6,100,0
    .goto Elwynn Forest,79.7,83.7,100,0
    .goto Elwynn Forest,82.0,76.8,100,0
    .goto Elwynn Forest,76.7,75.6
    >>击杀最后的怪物以保卫边境
    .complete 52,1 --Kill Prowler (x8)
    .complete 52,2 --Kill Young Forest Bear (x5)
step
    >>返回卫兵托马斯
    .goto Elwynn Forest,73.973,72.179
>>与|cRXP_FRIENDLY_卫兵托马斯|r交谈
    .turnin 52 >>交任务: |cRXP_FRIENDLY_保卫边境|r
    .turnin 71 >>交任务: |cRXP_FRIENDLY_回复托马斯|r
.target Guard Thomas
    .accept 39 >>接任务: |cRXP_LOOT_托马斯的报告|r
.target Deputy Rainer
.target Marshal Haggard
.target Marshal Dughan
.target Farmer Furlbrow
.target Farmer Saldean
>>与|cRXP_FRIENDLY_农夫萨丁|r交谈
-->>与|cRXP_FRIENDLY_农夫法布隆|r交谈
-->>与|cRXP_FRIENDLY_治安官杜汉|r交谈
--
-->>与|cRXP_FRIENDLY_治安官哈迦德|r交谈
-->>与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .accept 109 >>接任务: |cRXP_LOOT_向格里安·斯托曼报到|r
step
#xprate <1.7
    #completewith Deed
    .use 1972 >>留意迪菲亚兄弟会掉落的“西部荒野地契”(幸运掉落)
    .collect 1972,1,184,1 --Collect Westfall Deed (x1)
    .accept 184 >>接任务: |cRXP_LOOT_法布隆的地契|r
step
#xprate <1.7
    #completewith Grindxp
    .goto Elwynn Forest,69.53,79.47
    >>开始绕着农场巡逻, 击杀迪菲亚成员并搜刮他们的头巾
    >>尽量在最后一次战斗前将血量降到很低, 之后我们进行死亡跳过 << tbc
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .isOnQuest 83
step << Warrior
    .goto Elwynn Forest,69.4,79.2
    >>激怒池塘, 然后击杀公主. 如有需要, 可使用之前获得的治疗药水. 击杀后拾取她的项圈
    .complete 88,1 --Collect Brass Collar (x1)
step << Rogue
    .goto Elwynn Forest,69.4,79.2
    >>确保闪避已开启, 然后击杀公主. 如有需要, 可使用之前准备的初级治疗药水. 击杀后拾取她的项圈
    .complete 88,1 --Collect Brass Collar (x1)
step << !Rogue !Warrior
    .goto Elwynn Forest,69.4,79.2
    >>击杀公主. 如有需要, 可使用之前获得的治疗药水. 击杀后拾取她的项圈
    >>如果你遇到困难, 可以利用栅栏来利用路径机制争取时间
    .complete 88,1 --Collect Brass Collar (x1)
    .link https://www.youtube.com/watch?v=GRrXOV-UvD4 >>如果遇到困难, 请点击这里
step << !Warlock
    #label Grindxp
    .xp 9+3695 >>升级至3695/6500经验值
step << Warlock
    #label Grindxp
    .xp 9+3400 >>升级至3400+/6500经验值
step
#xprate <1.7
    .goto Elwynn Forest,69.53,79.47
    >>开始绕着农场巡逻, 击杀迪菲亚成员并搜刮他们的头巾
    >>尽量在最后一次战斗前将血量降到很低, 之后我们进行死亡跳过 << tbc
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .isOnQuest 83
step << tbc
    #completewith next
    .deathskip >>如果你血量较低, 就去“灵魂医者”处死亡并重生；否则直接跑回去交任务即可
step
#xprate <1.7
    #label Deed
    >>与萨拉·迪博雷恩交谈
    .goto Elwynn Forest,79.5,68.9
.target Sara Timberlain
>>与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .turnin 83 >>交任务: |cRXP_FRIENDLY_红色亚麻布|r
    .isQuestComplete 83
step << !Warlock
    .goto Redridge Mountains,8.5,72.0
    .xp 9+4475 >>升级至4475/6500经验值
step << Paladin
    .goto Redridge Mountains,8.5,72.0
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
step << Paladin
    #sticky
    #completewith next
    .deathskip >>在这里被怪物击杀后, 前往灵魂医者处复活
    .goto Redridge Mountains,11.2,78.4
step << Paladin
    #softcore
    .goto Redridge Mountains,30.6,59.4
    .fp Redridge Mountains >>获取赤脊山飞行点
step << Paladin
    #hardcore
    >>跑向飞行路径. 途中务必小心, 不要激怒或被怪物击杀. 尽量沿路前进, 并时刻留意周围情况
    .goto Redridge Mountains,30.6,59.4
    .fp Redridge Mountains >>获取赤脊山飞行点
step
    .hs >>炉石返回闪金镇
step
    .money <0.1250
    .goto Elwynn Forest,44.0,65.9
    .vendor >>从Brog处购买两个六槽背包
step
    .goto Elwynn Forest,43.283,65.721
    >>提交任务, 但不要等待剧情演出结束
.target William Pestle
>>与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .turnin 112 >>交任务: |cRXP_FRIENDLY_收集海藻|r
step << Warrior/Rogue
    .goto Elwynn Forest,43.4,65.6
    >>与楼上急救教官交谈
    .train 3273 >>学习急救技能
step
    >>出门后与治安官杜汉对话
    .goto Elwynn Forest,42.2,65.8
>>与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 39 >>交任务: |cRXP_FRIENDLY_托马斯的报告|r
    .turnin 76 >>交任务: |cRXP_FRIENDLY_玉石矿洞|r
.target Marshal Dughan
    .accept 239 >>接任务: |cRXP_LOOT_西泉要塞|r
    .accept 59 >>接任务: |cRXP_LOOT_布甲和皮甲|r << Warlock
step << tbc/Warlock wotlk
    >>与铁匠铺的铁匠阿古斯交谈
    .goto Elwynn Forest,41.706,65.544
.target Smith Argus
.target Verner Osgood
>>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
-->>与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
    .accept 1097 >>接任务: |cRXP_LOOT_艾尔默的任务|r
step
    .xp 10 >>升级至10级
step
    #softcore
    .goto Elwynn Forest,41.7,65.9
    .vendor >>出售垃圾并修理
step << Warrior
    .goto Elwynn Forest,41.087,65.768
.target Ilsa Corbin
.target Lyria Du Lac
>>与|cRXP_FRIENDLY_里瑞亚·杜拉克|r交谈
-->>与|cRXP_FRIENDLY_伊尔萨·考宾|r交谈
    .accept 1638 >>接任务: |cRXP_LOOT_战士的训练|r
    .trainer >>训练你的职业法术
step << Paladin
    .goto Elwynn Forest,41.1,66.0
    .trainer >>训练你的职业法术
step
    >>返回旅馆找威廉
    .goto Elwynn Forest,43.283,65.721
.target William Pestle
>>与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .accept 114 >>接任务: |cRXP_LOOT_梅贝尔的隐形水|r
step << Warlock
    >>回到地下室
    .goto Elwynn Forest,44.4,66.2
.target Remen Marcot
>>与|cRXP_FRIENDLY_雷门·玛考特|r交谈
    .accept 1685 >>接任务: |cRXP_LOOT_加科因的召唤|r
    .trainer >>训练你的职业法术
step << Mage/Priest/Rogue tbc
    #sticky
    #completewith next
    .goto Elwynn Forest,43.7,66.4,10 >>上楼
step << Priest
    .goto Elwynn Forest,43.283,65.721
.target Priestess Josetta
>>与|cRXP_FRIENDLY_女牧师洁塞塔|r交谈
    .accept 5635 >>接任务: |cRXP_LOOT_绝望祷言|r << tbc
    .trainer >>训练你的职业法术
step << Mage
    .goto Elwynn Forest,43.2,66.2
    .trainer >>训练你的职业法术
step << Rogue tbc
    .goto Elwynn Forest,43.9,65.9
    >>别担心武器不够, 我们很快就能再拿到一把
    >>在这里训练时一定要谨慎使用金钱, 升级前你需要准备31金币52银币. 务必确保学习双武器专精和冲刺技能
    .trainer >>训练你的职业法术
step << Rogue tbc
    .goto Elwynn Forest,41.7,65.9
    .money >0.3152
    .vendor >>你没有足够的钱, 所以为你的副手购买[卷刃的剑]
step
    >>跑出旅店, 向南返回梅贝尔·马科伦处
    .goto Elwynn Forest,43.2,89.6
.target Maybell Maclure
>>与|cRXP_FRIENDLY_梅贝尔·马科伦|r交谈
    .turnin 114 >>交任务: |cRXP_FRIENDLY_梅贝尔的隐形水|r
step
    >>返回斯通菲尔德农场
    .goto Elwynn Forest,34.660,84.482
.target Ma Stonefield
>>与|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .turnin 88,2 >>交任务: |cRXP_FRIENDLY_公主必须死！|r << Warrior/Paladin
    .turnin 88 >>交任务: |cRXP_FRIENDLY_公主必须死！|r << !Warrior !Paladin
step << Warlock/Mage wotlk
#xprate >1.3 << Mage
    >>点击周围任意一张通缉海报
    .goto Elwynn Forest,24.6,74.7
    .accept 176 >>接任务: |cRXP_LOOT_通缉：霍格|r
step
    >>与瑞尼尔副队长交谈
    .goto Elwynn Forest,24.2,74.5
.target Deputy Rainer
>>与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 239 >>交任务: |cRXP_FRIENDLY_西泉要塞|r
step << Warlock/Mage wotlk
#xprate >1.3 << Mage
    .goto Elwynn Forest,24.2,74.5
.target Deputy Rainer
>>与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .accept 11 >>接任务: |cRXP_LOOT_悬赏河爪豺狼人|r << Warlock
step << Warrior
    .money >0.2099
    >>刷一下, 直到你有20秒99美分以上的可售物品/金钱
    >>这是用于投掷和双手锤和双手剑训练以及飞往暴风城的
    .goto Elwynn Forest,27.6,93.0
step << Warlock/Mage wotlk
#xprate >1.3 << Mage
    #completewith Armbands
    >>留意金币拾取时间表(幸运掉落), 或格拉夫·疾齿的100%掉率(稀有). 额外获得210点经验值
    .collect 1307,1,123 --Collect Gold Pickup Schedule (x1)
    .accept 123 >>接任务: |cRXP_LOOT_收货人|r
step << Warlock/Mage wotlk
#xprate >1.3 << Mage
    #label Hogger
    .unitscan Hogger
    .goto Elwynn Forest,27.0,86.7,80,0
    .goto Elwynn Forest,26.1,89.9,80,0
    .goto Elwynn Forest,25.2,92.7,80,0
    .goto Elwynn Forest,27.0,93.9,80,0
    .goto Elwynn Forest,27.0,86.7,80,0
    .goto Elwynn Forest,26.1,89.9,80,0
    .goto Elwynn Forest,25.2,92.7,80,0
    .goto Elwynn Forest,27.0,93.9,80,0
    .goto Elwynn Forest,27.0,86.7,80,0
    .goto Elwynn Forest,26.1,89.9,80,0
    .goto Elwynn Forest,25.2,92.7,80,0
    .goto Elwynn Forest,27.0,93.9,80,0
    .goto Elwynn Forest,24.24,80.67,0
    >>霍格可能出现在该区域的多个位置. 保持恐惧链控, 或在血量低于60%时风筝他至坐标24,80的塔楼. 击杀后拾取他的利爪
    >>要小心, 他可能会惊吓其他怪物, 攻击伤害很高, 且能造成眩晕
    .complete 176,1 --Collect Huge Gnoll Claw (1)
step << Warlock
    #label Armbands
    .goto Elwynn Forest,27.0,93.9
    >>击杀豺狼人, 搜刮他们的护腕
    .complete 11,1 --Collect Painted Gnoll Armband (8)
step << Rogue
    #label Armbands
    .money >0.3152
    .goto Elwynn Forest,24.2,74.5
.target Deputy Rainer
>>与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .accept 11 >>接任务: |cRXP_LOOT_悬赏河爪豺狼人|r
step << Rogue
    .goto Elwynn Forest,27.0,93.9
    >>击杀豺狼人, 搜刮他们的护腕
    .complete 11,1 --Collect Painted Gnoll Armband (x8)
    .isOnQuest 11
step << Warlock/Rogue/Mage wotlk
#xprate >1.3 << Mage
    .goto Elwynn Forest,24.2,74.5
.target Deputy Rainer
>>与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 11 >>交任务: |cRXP_FRIENDLY_悬赏河爪豺狼人|r
    .isOnQuest 11
step << Mage wotlk
#xprate >1.3
    #completewith next
    .deathskip >>在闪金镇死亡后重生
step << Mage wotlk
#xprate >1.3
    .goto Elwynn Forest,42.105,65.927
    >>选择法杖. 装备它
.target Marshal Dughan
>>与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    .isQuestComplete 176
step << Rogue
    .abandon 123 >>放弃任务：收货人
step
    >>与弗尔布鲁斯交谈
    .goto Westfall,60.0,19.4
    .turnin -184 >>交任务: |cRXP_FRIENDLY_法布隆的地契|r
.target Verna Furlbrow
>>与|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .accept 36 >>接任务: |cRXP_LOOT_杂味炖肉|r
step
    >>前往萨尔迪恩农场, 进入屋内
    .goto Westfall,56.416,30.519
.target Salma Saldean
>>与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .turnin 36 >>交任务: |cRXP_FRIENDLY_杂味炖肉|r
step
    #completewith next
    .goto Westfall,51.7,49.4,150 >>死亡后在灵魂医者处复活, 或跑到哨兵岭
step << Warlock wotlk
#xprate >1.3
    .goto Westfall,52.8,53.6
    .home >>将你的[炉石]设置为哨兵岭
step << Mage wotlk/Warlock wotlk
#xprate >1.3
    .goto Westfall,54.00,53.00
.target Scout Galiaan
>>与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .accept 153 >>接任务: |cRXP_LOOT_红色皮质面罩|r
step
    >>去找塔楼里的格里安交谈
    .goto Westfall,56.327,47.520
.target Gryan Stoutmantle
>>与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 109 >>交任务: |cRXP_FRIENDLY_向格里安·斯托曼报到|r
step << Mage wotlk/Warlock wotlk
#xprate >1.3
    .goto Westfall,56.327,47.520
.target Gryan Stoutmantle
>>与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 12 >>接任务: |cRXP_LOOT_西部荒野人民军|r
step << Human
    >>与塔楼里的军需官刘易斯对话
    .goto Westfall,57.002,47.169
.target Quartermaster Lewis
>>与|cRXP_FRIENDLY_军需官刘易斯|r交谈
    .accept 6181 >>接任务: |cRXP_LOOT_快递消息|r
step << Mage wotlk
#xprate >1.3
    >>击杀迪菲亚帮派成员, 搜刮他们的头巾
   .goto Westfall,48.21,46.70,60,0
   .goto Westfall,46.74,52.87,60,0
   .goto Westfall,48.21,46.70,-1
   .goto Westfall,46.74,52.87,-1
   .complete 12,1
   .complete 12,2
   .complete 153,1

step << Mage wotlk
#xprate >1.3
    .goto Westfall,54.00,52.90
.target Scout Galiaan
>>与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .turnin 153 >>交任务: |cRXP_FRIENDLY_红色皮质面罩|r
step << Mage wotlk
#xprate >1.3
    .goto Westfall,56.30,47.50
.target Gryan Stoutmantle
>>与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 12 >>交任务: |cRXP_FRIENDLY_西部荒野人民军|r
step << Rogue tbc
    .money >0.3152
    +刷怪直到你拥有31银52铜的可售物品/金钱
step << Human
    >>前往飞行管理员处
    .goto Westfall,56.6,52.6
>>与|cRXP_FRIENDLY_索尔|r交谈
    .turnin 6181 >>交任务: |cRXP_FRIENDLY_快递消息|r
.target Thor
    .accept 6281 >>接任务: |cRXP_LOOT_赶赴暴风城|r
step << Mage wotlk
#xprate >1.3
    .xp 12 >>刷到12级
step
    .goto Westfall,56.6,52.6
    .fly Stormwind >>飞往暴风城
step << Rogue/Warrior tbc
    >>进入建筑内部
    .goto StormwindClassic,57.32,62.08,20,0
    .goto StormwindClassic,58.37,61.69
    .collect 25873,1 >>从瑟曼处购买破损的锋利飞刀. 装备它
step
    .goto StormwindClassic,56.2,64.6
    >>与建筑内的摩根·匹斯特交谈. 使用火箭造成范围伤害或用来分割拉怪
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >>点击此处查看分拉指南(内容较长但信息丰富)
.target Morgan Pestle
>>与|cRXP_FRIENDLY_摩根·匹斯特|r交谈
    .turnin 61,1 >>交任务: |cRXP_FRIENDLY_送往暴风城的货物|r
step << wotlk
    .goto StormwindClassic,52.61,65.71
    .home >>将你的[炉石]设置为暴风城
step << Warrior tbc
    .goto StormwindClassic,57.1,57.7
    .trainer >>学习两小时剑术
step << Priest
    .goto StormwindClassic,57.1,57.7
    .trainer >>训练法杖
step << Mage/Warlock tbc
    .goto StormwindClassic,57.1,57.7
    .trainer >>先练法杖, 如果还有钱的话, 再练单手剑
step << Rogue
    .goto StormwindClassic,57.1,57.7
    .trainer >>学习1小时剑术
step << Rogue
    .goto StormwindClassic,57.6,57.1
    .vendor >>从冈瑟那里购买一把斗士短剑并装备上
step << Paladin
    .goto StormwindClassic,57.1,57.7
    .trainer >>学习两小时剑术
step << Warlock/wotlk
    >>前往矮人区
    .goto StormwindClassic,74.3,47.2
>>与|cRXP_FRIENDLY_奥斯瑞克·斯图恩|r交谈
    .turnin 6281 >>交任务: |cRXP_FRIENDLY_赶赴暴风城|r
.target Osric Strang
    .accept 6261 >>接任务: |cRXP_LOOT_杜加尔·朗德瑞克|r << Warlock
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>进入已宰的羔羊酒馆并下楼
step << Warlock
    .goto StormwindClassic,25.2,78.5
>>与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .turnin 1685 >>交任务: |cRXP_FRIENDLY_加科因的召唤|r
.target Gakin the Darkbinder
    .accept 1688 >>接任务: |cRXP_LOOT_苏伦娜·凯尔东|r
step << Warlock
    .deathskip >>死亡后使用“生命分流”在灵魂医者处重生, 并站在术士训练师旁边的篝火上
    .zoneskip Elwynn Forest
step << Warlock
    .isOnQuest 123
    .goto Elwynn Forest,42.105,65.927
    >>选择法杖, 然后装备它
.target Marshal Dughan
>>与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    .turnin 123 >>交任务: |cRXP_FRIENDLY_收货人|r
step << Warlock
    .goto Elwynn Forest,42.105,65.927
    >>选择法杖, 然后装备它
.target Marshal Dughan
>>与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
step << Warlock
    .xp 11 >>升级到11级
step << Warlock
    >>路上升级, 顺便提升法杖技能, 为以后做准备
    >>击杀屋内怪物, 注意摩根(他会抓伤并杀死宠物), 用范围伤害技能攻击苏瑞娜. 击杀后搜刮她的颈链
    .goto Elwynn Forest,71.0,80.8
    .complete 1688,1 --Collect Surena's Choker (x1)
step << Warlock
    .goto Elwynn Forest,79.457,68.789
.target Sara Timberlain
>>与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .turnin 59 >>交任务: |cRXP_FRIENDLY_布甲和皮甲|r
step << Warlock wotlk
#xprate >1.3
    .xp 12
step << Warlock
    #sticky
    #completewith next
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r, 在前往 赤脊山 的途中磨练，确保至少拥有 2 个灵魂碎片（使用吸取灵魂）
    .collect 6265,2 --Soul Shard (2)
step << Warlock
    .goto Redridge Mountains,17.4,69.6
.target Guard Parker
>>与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
step << Warlock
    >>小心途中出现的怪物
    .goto Redridge Mountains,30.733,59.996
.target Deputy Feldon
>>与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
step << Warlock wotlk
#xprate >1.3
    .goto Redridge Mountains,29.30,53.60
.target Shawn
>>与|cRXP_FRIENDLY_肖恩|r交谈
    .accept 3741 >>接任务: |cRXP_LOOT_希拉里的项链|r
step << Warlock wotlk
#xprate >1.3
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
step << Warlock wotlk
#xprate >1.3
    .goto Redridge Mountains,29.20,53.60
.target Hilary
>>与|cRXP_FRIENDLY_希拉里|r交谈
    .turnin 3741 >>交任务: |cRXP_FRIENDLY_希拉里的项链|r
step << Warlock
    .goto Redridge Mountains,30.6,59.4
    .fly Stormwind >>飞往暴风城
step << Warlock
    .goto StormwindClassic,66.3,62.1
    .turnin -6261 >>交任务: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
step << Warlock wotlk
#xprate >1.3
    .goto StormwindClassic,66.3,62.1
    .accept 6262 >>接任务: |cRXP_LOOT_返回西部荒野|r
    .isQuestTurnedIn 6261
step << Warlock
    #sticky
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>进入已宰的羔羊酒馆并下楼
step << Warlock
    .goto StormwindClassic,25.2,78.5
>>与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .turnin 1688 >>交任务: |cRXP_FRIENDLY_苏伦娜·凯尔东|r
.target Gakin the Darkbinder
    .accept 1689 >>接任务: |cRXP_LOOT_誓缚|r
step << Warlock
    .goto StormwindClassic,25.2,80.7,14,0
    .goto StormwindClassic,23.2,79.5,14,0
    .goto StormwindClassic,26.3,79.5,14,0
    .goto StormwindClassic,25.5,78.1
    >>前往墓穴底部, 使用血石颈环召唤虚空行者并击杀它
    .complete 1689,1 --Kill Summoned Voidwalker (x1)
step << Warlock
    .goto StormwindClassic,25.2,78.5
    >>学会后不要召唤虚空行者
.target Gakin the Darkbinder
>>与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .turnin 1689 >>交任务: |cRXP_FRIENDLY_誓缚|r
step << Human
    .goto StormwindClassic,74.3,47.2
.target Osric Strang
>>与|cRXP_FRIENDLY_奥斯瑞克·斯图恩|r交谈
    .turnin 6281 >>交任务: |cRXP_FRIENDLY_赶赴暴风城|r
    --.accept 6261 >>接任务: |cRXP_LOOT_杜加尔·朗德瑞克|r
step << Warrior
    .goto StormwindClassic,74.3,37.3
    #completewith next
     >>进入酒馆
.target Harry Burlguard
>>与|cRXP_FRIENDLY_哈里·伯加德|r交谈
     .turnin 1638 >>交任务: |cRXP_FRIENDLY_战士的训练|r
step << Warrior
     .goto StormwindClassic,71.7,39.9,20,0
    .goto StormwindClassic,74.3,37.3
.target Harry Burlguard
>>与|cRXP_FRIENDLY_哈里·伯加德|r交谈
    .accept 1639 >>接任务: |cRXP_LOOT_醉鬼巴特莱比|r
step << Warrior
    .goto StormwindClassic,73.8,36.3
>>与|cRXP_FRIENDLY_巴特莱比|r交谈
    .turnin 1639 >>交任务: |cRXP_FRIENDLY_醉鬼巴特莱比|r
.target Bartleby
    .accept 1640 >>接任务: |cRXP_LOOT_击败巴特莱比|r
    .complete 1640,1 --Beat Bartleby
step << Warrior
    .goto StormwindClassic,73.8,36.3
>>与|cRXP_FRIENDLY_巴特莱比|r交谈
    .turnin 1640 >>交任务: |cRXP_FRIENDLY_击败巴特莱比|r
.target Bartleby
    .accept 1665 >>接任务: |cRXP_LOOT_巴特莱比的酒杯|r
step << Warrior
    >>你现在将学习防御姿态和破甲攻击
    .goto StormwindClassic,74.3,37.3
.target Harry Burlguard
>>与|cRXP_FRIENDLY_哈里·伯加德|r交谈
    .turnin 1665 >>交任务: |cRXP_FRIENDLY_巴特莱比的酒杯|r
step << Priest tbc
    #completewith next
    .goto StormwindClassic,38.8,26.4
.target High Priestess Laurena
>>与|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 5635 >>交任务: |cRXP_FRIENDLY_绝望祷言|r
step << Priest tbc
    .goto StormwindClassic,38.62,26.10
    .train 13908 >>训练绝望祷言
step << Warrior/Paladin/Rogue
    #completewith StormpikeDelivery
    >>把破甲技能放在你的快捷栏上(它的伤害比英勇打击更高) << Warrior tbc
    .goto StormwindClassic,56.3,17.0
    .collect 2901,1 >>购买一把采矿镐, 稍后你会学习采矿技能
step << tbc/Warlock wotlk
    #xprate >1.119 << Warlock wotlk
    #completewith next
    .goto StormwindClassic,51.8,12.1
.target Grimand Elmore
>>与|cRXP_FRIENDLY_格瑞曼德·艾尔默|r交谈
    .turnin 1097 >>交任务: |cRXP_FRIENDLY_艾尔默的任务|r
step << tbc
    #label StormpikeDelivery
    .goto StormwindClassic,51.8,12.1
.target Grimand Elmore
>>与|cRXP_FRIENDLY_格瑞曼德·艾尔默|r交谈
    .accept 353 >>接任务: |cRXP_LOOT_雷矛的包裹|r
step << tbc/Warlock wotlk
#xprate >1.119 << Warlock wotlk
    #completewith next
    .goto StormwindClassic,63.9,8.3,25 >>进入矿道地铁
step << tbc/Warlock wotlk
#xprate >1.119 << Warlock wotlk
    >>电车到达后乘坐, 抵达对岸时下车 << !Rogue !Warrior !Paladin !Warlock
    .link https://www.youtube.com/watch?v=M_tXROi9nMQ >>点击此处跳过电车内的登出流程
    >>电车到达时乘坐. 等待电车及上车期间制作绷带. 抵达对岸时接受任务 << Rogue/Warrior/Paladin
    >>电车到达时乘坐. 施放“召唤虚空行者”并制作治疗石. 在另一侧下车 << Warlock
.target Monty
>>与 |cRXP_FRIENDLY_蒙提|r 交谈
    .accept 6661 >>接任务: |cRXP_LOOT_捕捉矿道老鼠|r
step << tbc/Warlock wotlk
#xprate >1.119 << Warlock wotlk
    >>用你的笛子对付周围散落的老鼠
    .complete 6661,1 --Rats Captured (x5)
step << tbc/Warlock wotlk
#xprate >1.119 << Warlock wotlk
.target Monty
>>与 |cRXP_FRIENDLY_蒙提|r 交谈
    .turnin 6661 >>交任务: |cRXP_FRIENDLY_捕捉矿道老鼠|r
step << Warlock wotlk
#xprate >1.119
    .hs >>传送至哨兵岭
step << Warlock wotlk
#xprate >1.119
    >>击杀迪菲亚帮派成员, 搜刮他们的头巾
    .goto Westfall,48.21,46.70,60,0
    .goto Westfall,46.74,52.87,60,0
    .goto Westfall,48.21,46.70,-1
    .goto Westfall,46.74,52.87,-1
    .complete 12,1
    .complete 12,2
    .complete 153,1
step << Warlock wotlk
#xprate >1.119
    .goto Westfall,54.00,52.90
.target Scout Galiaan
>>与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .turnin 153 >>交任务: |cRXP_FRIENDLY_红色皮质面罩|r
step << Warlock wotlk
#xprate >1.119
    .goto Westfall,56.30,47.50
.target Gryan Stoutmantle
>>与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 12 >>交任务: |cRXP_FRIENDLY_西部荒野人民军|r
step << Warlock wotlk
#xprate >1.119
    .xp 14 >>练级至14级
step << Warlock wotlk
#xprate >1.119
    .goto Westfall,56.6,52.6
    .fly Stormwind >>飞往暴风城
step << Warlock wotlk
#xprate >1.119
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>进入已宰的羔羊酒馆并下楼
step << Warlock wotlk
#xprate >1.119
    .train 6222 >>学习腐蚀之触第2级, 并从术士训练师身上吸取生命
step << Warlock wotlk
#xprate >1.119
    >>进入建筑. 如果你有钱, 就买一根烟尘魔杖
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.84,65.14
    .collect 5208,1 --Smoldering Wand (1)
    .money >0.3174
step << wotlk
#xprate >1.119
    .goto StormwindNew,21.8,56.2
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
    .zoneskip Darnassus
    .zoneskip Teldrassil
    .zoneskip Darkshore
step << tbc
    .goto Ironforge,77.0,51.0
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
step << tbc
    .goto Ironforge,55.501,47.742
    .fp Ironforge >>获取铁炉堡的飞行点
step << Warlock tbc
    .goto Ironforge,20.93,53.19,20,0
    .goto Ironforge,18.16,51.46
    .home >>将你的[炉石]设置为铁炉堡
step << Warrior tbc
    .goto Ironforge,61.2,89.5
    .trainer >>学习2小时锤类武器技能
step << tbc
    #completewith next
    .goto Dun Morogh,53.5,34.9,100 >>离开铁炉堡

--TBC only part:
step << tbc
#xprate >1.3
    .goto Dun Morogh,30.9,33.1,15 >>向北跑上山
step << tbc
#xprate >1.3
    .goto Dun Morogh,32.4,29.1,15 >>追踪任务线索到这里
step << tbc
#xprate >1.3
    .goto Dun Morogh,33.0,27.2,15,0
    .goto Dun Morogh,33.0,25.2,15,0
    .goto Wetlands,11.6,43.4,60,0
    .deathskip >>继续向北直跑, 当通用聊天频道显示“湿地”时, 跳下去死亡, 然后重生
step << tbc
#xprate >1.3
    .goto Wetlands,12.7,46.7,30 >>游向岸边
step << tbc
#xprate >1.3
    .money <0.076
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto 1437,10.760,56.721
    .vendor >>如果你有 7.6s, 检查尼尔·奥雷的青铜管, 如果存在就购买
    .bronzetube
step << tbc
#xprate >1.3
    .goto Wetlands,9.5,59.7
    .fp Menethil >>获取米奈希尔港的飞行路径
step << tbc
#xprate >1.3
    .money <0.0385
    .goto Wetlands,8.1,56.3
    .vendor >>在Dewin处查看治疗药水, 购买至1秒的使用量
step << tbc
#xprate >1.3
    .goto Wetlands,4.7,57.3
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
    >>利用这段时间提升你的急救技能或制作武器石 << Warrior/Rogue/Paladin
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Alliance
-- Alliance tbc/Alliance Warlock
#name 11-12 洛克莫丹 << !Warlock
#name 12-14 洛克莫丹 << Warlock
#displayname 11-12 洛克莫丹 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << !Warlock
#displayname 12-14 洛克莫丹 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Warlock
#xprate <1.2 << wotlk
#version 1
#group RestedXP 联盟 1-20级
#defaultfor Human
#next 14-14 黑海岸 << Warlock
#next 11-14 黑海岸 << !Warlock
step
    #xprate <1.2
    #completewith next
    .isOnQuest 1097
    .goto StormwindClassic,51.8,12.1
.target Grimand Elmore
>>与|cRXP_FRIENDLY_格瑞曼德·艾尔默|r交谈
    .turnin 1097 >>交任务: |cRXP_FRIENDLY_艾尔默的任务|r
step
    #label StormpikeDelivery
    #xprate <1.2
    .goto StormwindClassic,51.8,12.1
.target Grimand Elmore
>>与|cRXP_FRIENDLY_格瑞曼德·艾尔默|r交谈
    .accept 353 >>接任务: |cRXP_LOOT_雷矛的包裹|r
step
#xprate <1.2
    #completewith next
    .goto StormwindClassic,63.9,8.3,25 >>进入矿道地铁
step
#xprate <1.2
    >>电车到达后乘坐, 抵达对岸时下车 << !Rogue !Warrior !Paladin !Warlock
    .link https://www.youtube.com/watch?v=M_tXROi9nMQ >>点击此处跳过电车内的登出流程
    >>电车到达时乘坐. 等待电车及上车期间制作绷带. 抵达对岸时接受任务 << Rogue/Warrior/Paladin
    >>电车到达时乘坐. 施放“召唤虚空行者”并制作治疗石. 在另一侧下车 << Warlock
.target Monty
>>与 |cRXP_FRIENDLY_蒙提|r 交谈
    .accept 6661 >>接任务: |cRXP_LOOT_捕捉矿道老鼠|r
step
#xprate <1.2
    >>用你的笛子对付周围散落的老鼠
    .complete 6661,1 --Rats Captured (x5)
step
    #xprate <1.2
    .isOnQuest 6661
.target Monty
>>与 |cRXP_FRIENDLY_蒙提|r 交谈
    .turnin 6661 >>交任务: |cRXP_FRIENDLY_捕捉矿道老鼠|r
step
    #xprate <1.2
    .goto Ironforge,77.0,51.0
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .zoneskip Dun Morogh
step
    #xprate <1.2
    .goto Ironforge,55.501,47.742
    .fp Ironforge >>获取铁炉堡的飞行点
    .zoneskip Ironforge,1
step << Warrior tbc
    #xprate <1.2
    .goto Ironforge,61.2,89.5
    .trainer >>学习2小时锤类武器技能
step
    #xprate <1.2
    #completewith next
    .goto Dun Morogh,53.5,34.9,100 >>离开铁炉堡
    .zoneskip Ironforge,1
step
    #xprate <1.2
    .goto Dun Morogh,60.1,52.6,50,0
    .goto Dun Morogh,63.1,49.8
.target Rudra Amberstill
>>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .accept 314 >>接任务: |cRXP_LOOT_保护牲畜|r
step
    #xprate <1.2
    #completewith next
    .goto Dun Morogh,62.3,50.3,14,0
    .goto Dun Morogh,62.2,49.4,12 >>跑上这座山的这一段坡路
step
    #xprate <1.2
    >>击杀瓦加什, 搜刮他的獠牙
    .goto Dun Morogh,62.6,46.1
    .complete 314,1 --Collect Fang of Vagash (1)
step
    #xprate <1.2
    .goto Dun Morogh,63.1,49.8
.target Rudra Amberstill
>>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .turnin 314 >>交任务: |cRXP_FRIENDLY_保护牲畜|r
step
    #xprate <1.2
    .goto Dun Morogh,68.7,56.0
.target Senator Mehr Stonehallow
>>与|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .accept 433 >>接任务: |cRXP_LOOT_公众之仆|r
step
    #xprate <1.2
    .goto Dun Morogh,69.084,56.330
.target Foreman Stonebrow
>>与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 432 >>接任务: |cRXP_LOOT_该死的石腭怪！|r
step
    #xprate <1.2
    .goto Dun Morogh,70.7,56.4,40,0
    .goto Dun Morogh,70.62,52.39
    >>击杀洞穴中的地精
    .complete 432,1 --Kill Rockjaw Skullthumper (6)
    .complete 433,1 --Kill Rockjaw Bonesnapper (10)
step << !Warlock
    .xp 10+6350 >>升级至6350/7600
step << Warlock
    .xp 12
step
    #xprate <1.2
    .goto Dun Morogh,69.084,56.330
.target Foreman Stonebrow
>>与|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .turnin 432 >>交任务: |cRXP_FRIENDLY_该死的石腭怪！|r
step
    #xprate <1.2
    .goto Dun Morogh,68.7,56.0
.target Senator Mehr Stonehallow
>>与|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .turnin 433 >>交任务: |cRXP_FRIENDLY_公众之仆|r
step << !Warlock
    .xp 11
step << Mage/Warlock/Priest
    #xprate <1.2
    .goto Dun Morogh,68.6,54.7
    .vendor >>商人, 购买5级饮品
step
    #xprate <1.2
    .goto Dun Morogh,78.1,49.5,30,0
    .goto Dun Morogh,81.2,42.7,45,0
    .goto Dun Morogh,83.892,39.188
.target Pilot Hammerfoot
>>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .accept 419 >>接任务: |cRXP_LOOT_失踪的驾驶员|r
step
    #xprate <1.2
    >>点击矮人尸体
    .goto Dun Morogh,79.7,36.2
    .turnin 419 >>交任务: |cRXP_FRIENDLY_失踪的驾驶员|r
    .accept 417 >>接任务: |cRXP_LOOT_驾驶员的复仇|r
step
    #xprate <1.2
    >>击杀Mangeclaw. 搜刮他的爪子
    .goto Dun Morogh,78.9,37.0
    .complete 417,1 --Collect Mangy Claw (x1)
step
    #xprate <1.2
    #label LochEntrance
    .goto Dun Morogh,83.892,39.188
    >>选择匕首, 并将其作为副手武器使用 << Rogue
.target Pilot Hammerfoot
>>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .turnin 417 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r
step
    #xprate <1.2
    #completewith next
    .goto Dun Morogh,84.4,31.1
    .zoneskip Loch Modan >>穿过隧道前往洛克莫丹
step
    .goto Loch Modan,24.764,18.397
.target Mountaineer Stormpike
>>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 353 >>交任务: |cRXP_FRIENDLY_雷矛的包裹|r
step << Warlock/Mage/Rogue
    #xprate <1.5
    .goto Loch Modan,24.764,18.397
.target Mountaineer Stormpike
>>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .accept 307 >>接任务: |cRXP_LOOT_肮脏的爪子|r
step << !Mage !Rogue
#xprate >1.3 << Warlock
    #softcore
    #completewith next
    .goto Loch Modan,28.14,18.29
    .deathskip >>死亡后重生至塞尔萨玛
step << Warlock/Mage/Rogue
#xprate <1.5
    #completewith next
    >>击杀该区域的蜘蛛以获取蜘蛛的毒液
    .collect 3174,3 --Collect Spider Ichor (x3)
    >>在该区域击杀熊以获取熊肉
    .collect 3173,3 --Collect Bear Meat (x3)
    >>击杀该区域的野猪以获取野猪肠
    .collect 3172,3 --Collect Boar Intestines (x3)
step << Warlock/Mage/Rogue
#xprate <1.5
    .goto Loch Modan,34.828,49.283
.target Vidra Hearthstove
>>与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .accept 418 >>接任务: |cRXP_LOOT_塞尔萨玛血肠|r
step << Warlock/Mage/Rogue
#xprate <1.5
    #sticky
    #label StormpikeO
    .abandon 1338 >>放弃风暴峭壁的命令. 这将解锁巡山人卡尔·雷矛的任务
step << Warlock/Mage/Rogue
    .goto Loch Modan,34.8,48.6
    .vendor >>购买1-2个6槽背包
step << Warlock/Mage/Rogue
    .goto Loch Modan,35.5,48.4
    .vendor >>购买食物/水(尽量准备40份5级饮料, 20份5级食物) << Mage/Warlock
    .vendor >>购买食物, 尽量准备约40份5级食物 << Rogue
step << Warlock/Mage/Rogue
#xprate <1.5
    #requires StormpikeO
    .goto Loch Modan,32.6,49.9,80.0,0
    .goto Loch Modan,37.2,46.1,80.0,0
    .goto Loch Modan,36.7,41.6
    >>找到卡德雷尔. 他沿塞尔萨玛路巡逻
.target Mountaineer Kadrell
>>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    .accept 416 >>接任务: |cRXP_LOOT_狗头人的耳朵|r
    .accept 1339 >>接任务: |cRXP_LOOT_巡山人卡尔·雷矛的任务|r
step << Warlock/Mage/Rogue
#xprate <1.5
    #completewith Thelsamar1
    >>击杀该区域的蜘蛛, 以获取塞尔萨玛血肠
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
step << Warlock/Mage/Rogue
#xprate <1.5
    #completewith Thelsamar1
    >>在塞尔萨玛血肠区域击杀熊类怪物
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
step << Warlock/Mage/Rogue
#xprate <1.5
    #completewith Thelsamar1
    >>击杀该区域的野猪, 以制作塞尔萨玛血香肠
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
step << Warlock/Mage/Rogue
#xprate <1.5
    #label Thelsamar1
    .goto Loch Modan,39.3,27.0,130 >>在途中击杀一些怪物以获取猪大肠和熊肉和蜘蛛的毒液
step << Warlock/Mage/Rogue
#xprate <1.5
    .goto Loch Modan,35.5,18.2,45 >>在击杀老鼠的同时前往洞穴入口
step << Warlock/Mage/Rogue
#xprate <1.5
    .goto Loch Modan,36.3,24.7
    >>收集洞穴中找到的箱子. 请注意, 这在11级时难度较高
    >>小心, 地卜师几秒后会施放火焰护盾(火系免疫) << Mage/Warlock
    >>你可以在洞穴中再深入探索一次后再返回, 因为箱子会在你身后重新生成
    .complete 307,1 --Collect Miners' Gear (x4)
step << Warlock/Mage/Rogue
#xprate <1.5
    >>击杀狗头人, 搜刮他们的耳朵
    .goto Loch Modan,36.3,24.7
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .collect 2589,10 << Paladin
step << Warlock/Mage/Rogue
#xprate <1.5
    #completewith Ichor9
    >>击杀该区域的蜘蛛, 以获取塞尔萨玛血肠
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
step << Warlock/Mage/Rogue
#xprate <1.5
    #completewith Meat9
    >>在塞尔萨玛血肠区域击杀熊类怪物
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
step << Warlock/Mage/Rogue
#xprate <1.5
    #completewith Intest9
    >>在塞尔萨玛区域击杀野猪, 以获取塞尔萨玛血肠
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
step << Warlock/Mage/Rogue
#xprate <1.5
    .goto Loch Modan,23.3,17.9,45 >>跑回掩体, 途中持续刷怪
step << Warlock/Mage/Rogue
#xprate <1.5
    #completewith next
    .goto Loch Modan,24.1,18.2
    .vendor >>供应商与维修 - 请勿出售用于[塞尔萨玛血肠]的任何物品
step << Warlock/Mage/Rogue
#xprate <1.5
    .goto Loch Modan,24.7,18.3
.target Mountaineer Stormpike
>>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 307 >>交任务: |cRXP_FRIENDLY_肮脏的爪子|r
    .turnin 1339 >>交任务: |cRXP_FRIENDLY_巡山人卡尔·雷矛的任务|r
step << Warlock/Mage/Rogue
#xprate <1.5
    #sticky
    #label Meat9
    .goto Loch Modan,26.9,10.7,100,0
    .goto Loch Modan,30.9,10.6,100,0
    .goto Loch Modan,28.6,15.4,100,0
    .goto Loch Modan,30.5,26.6,100,0
    .goto Loch Modan,33.4,30.3,100,0
    .goto Loch Modan,39.4,33.3,100,0
    .goto Loch Modan,26.9,10.7,100,0
    .goto Loch Modan,30.9,10.6,100,0
    .goto Loch Modan,28.6,15.4,100,0
    .goto Loch Modan,30.5,26.6,100,0
    .goto Loch Modan,33.4,30.3,100,0
    .goto Loch Modan,39.4,33.3,100,0
    .goto Loch Modan,26.9,10.7
    >>击杀熊类怪物, 掠夺它们的肉
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
step << Warlock/Mage/Rogue
#xprate <1.5
    #sticky
    #label Ichor9
    .goto Loch Modan,31.9,16.4,100,0
    .goto Loch Modan,28.0,20.6,100,0
    .goto Loch Modan,33.8,40.5,100,0
    .goto Loch Modan,36.2,30.9,100,0
    .goto Loch Modan,39.0,32.1,100,0
    .goto Loch Modan,31.9,16.4,100,0
    .goto Loch Modan,28.0,20.6,100,0
    .goto Loch Modan,33.8,40.5,100,0
    .goto Loch Modan,36.2,30.9,100,0
    .goto Loch Modan,39.0,32.1,100,0
    .goto Loch Modan,31.9,16.4
    >>击杀蜘蛛, 搜刮蛛液
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
step << Warlock/Mage/Rogue
#xprate <1.5
    #label Intest9
    .goto Loch Modan,38.0,34.9,100,0
    .goto Loch Modan,37.1,39.8,100,0
    .goto Loch Modan,29.8,35.9,100,0
    .goto Loch Modan,27.7,25.3,100,0
    .goto Loch Modan,28.6,22.6,100,0
    .goto Loch Modan,38.0,34.9,100,0
    .goto Loch Modan,37.1,39.8,100,0
    .goto Loch Modan,29.8,35.9,100,0
    .goto Loch Modan,27.7,25.3,100,0
    .goto Loch Modan,28.6,22.6,100,0
    .goto Loch Modan,38.0,34.9
    >>击杀野猪. 搜刮它们的肠子
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
step << Warlock/Mage/Rogue
#xprate <1.5
    #requires Meat9
step << Warlock/Mage/Rogue
#xprate <1.5
    #label RatCatching
    #requires Ichor9
    .goto Loch Modan,32.6,49.9,80.0,0
    .goto Loch Modan,37.2,46.1,80.0,0
    .goto Loch Modan,36.7,41.6
    >>找到卡德雷尔. 他沿塞尔萨玛路巡逻
.target Mountaineer Kadrell
>>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    .turnin 416 >>交任务: |cRXP_FRIENDLY_狗头人的耳朵|r
    .unitscan Mountaineer Kadrell
step << Warlock/Mage/Rogue
#xprate <1.2
    .goto Loch Modan,34.828,49.283
.target Vidra Hearthstove
>>与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .turnin 418 >>交任务: |cRXP_FRIENDLY_塞尔萨玛血肠|r
step
    #xprate <1.2
    .goto Loch Modan,33.938,50.954
    .fp Thelsamar >>获取塞尔萨玛的飞行路径
    .hs >>炉石传送至暴风城 << !Warlock
step << Warlock
    .goto Loch Modan,22.071,73.127
.target Mountaineer Cobbleflint
>>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >>接任务: |cRXP_LOOT_保卫国王的领土|r
step << Warlock
    .goto Loch Modan,23.233,73.675
    >>从后方进入掩体
.target Captain Rugelfuss
>>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .accept 267 >>接任务: |cRXP_LOOT_穴居人的威胁|r
step << Warlock
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
step << Warlock
#xprate <1.2
    #completewith TroggT
    .money >0.7150
    .goto Loch Modan,32.7,76.5,0
    +在这里刷怪, 直到你拥有71银50铜的可售物品+金钱, 然后交任务
step << Warlock
#xprate <1.2
    .goto Loch Modan,32.7,76.5,0
    .xp 14-1820 >>刷怪直到距离14级还差1800点经验值
step << Warlock
#xprate >1.499
    .goto Loch Modan,32.7,76.5,0
    .xp 14-2730 >>刷怪直到距离14级还差2730点经验

step << Warlock
    .goto Loch Modan,22.2,73.3
.target Mountaineer Cobbleflint
>>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .turnin 224 >>交任务: |cRXP_FRIENDLY_保卫国王的领土|r
step << Warlock
    #label TroggT
    .goto Loch Modan,23.233,73.675
.target Captain Rugelfuss
>>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .turnin 267 >>交任务: |cRXP_FRIENDLY_穴居人的威胁|r
step << Warlock
    .xp 14 >>升级至14级
step << Warlock
    #label HearthIF
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r << tbc
    .hs >>炉石传送至暴风城 << wotlk
step << !Warlock wotlk
        .hs >>炉石传送至暴风城
step << Warlock wotlk
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>进入已宰的羔羊酒馆并下楼
step << Warlock wotlk
    .train 6222 >>学习腐蚀之触第2级, 并从术士训练师身上吸取生命
step << Warlock wotlk
    >>进入建筑. 如果你有钱, 就买一根烟尘魔杖
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.84,65.14
    .collect 5208,1 --Smoldering Wand (1)
    .money >0.3174
step << wotlk
    #xprate <1.2
    .goto StormwindNew,21.8,56.2
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
    .zoneskip Darnassus
    .zoneskip Teldrassil
    .zoneskip Darkshore
step << Warlock tbc
    #label Wand1
    #completewith Wand2
    .goto Ironforge,25.8,75.2,0 >>或者, 如果价格低于30秒6铜币, 从拍卖行(AH)购买一根强效魔法杖
    .collect 11288,1 --Collect Greater Magic Wand
step << Warlock tbc
    #label Wand2
    #completewith Wand1
    .goto Ironforge,24.0,16.7,20,0
    .goto Ironforge,22.6,16.5
    .vendor >>进入建筑, 然后下楼. 购买一根烟尘魔杖
step << Warlock tbc
    #requires Wand2
    .goto Ironforge,51.1,8.7,15,0 >>进入建筑
    .goto Ironforge,50.4,6.3
    .trainer >>训练你的职业法术
step << Warlock tbc
    .goto Ironforge,53.2,7.8,15,0 >>进入建筑
    .goto Ironforge,53.0,6.4
    .vendor >>购买消耗品“暗影之魂”(等级1), 然后进行献祭(等级1)
step << !Warlock
    .goto Ironforge,65.90,88.41 << Warrior
    .goto Ironforge,51.50,15.34 << Rogue
    .goto Ironforge,25.21,10.75 << Priest
    .goto Ironforge,27.17,8.57 << Mage
    .goto Ironforge,24.55,4.46 << Paladin
     .trainer >>训练你的职业法术
step << tbc
    .goto Dun Morogh,53.5,34.9,60 >>前往: |cRXP_PICK_丹莫罗|r
step << tbc
    #hardcore
    #completewith next
    .goto Dun Morogh,59.43,42.85,150 >>前往跳跃点
step << tbc
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
    >>打开此链接, 并在另一个屏幕上查看指引
    >>完成不死者任务：丹莫罗 -> 湿地 跳过
    >>过海时避开鳄鱼
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >>点击此处参考
    .goto Wetlands,12.1,60.3,80 >>前往: |cRXP_PICK_湿地|r
step << tbc
    #softcore
    .goto Dun Morogh,30.9,33.1,15 >>向北跑上山
step << tbc
    #softcore
    .goto Dun Morogh,32.4,29.1,15 >>追踪任务线索到这里
step << tbc
    #softcore
    .goto Dun Morogh,33.0,27.2,15,0
    .goto Dun Morogh,33.0,25.2,15,0
    .goto Wetlands,11.6,43.4,60,0
    .deathskip >>继续向北直跑, 跳下悬崖死亡, 然后在灵魂医师处复活
step << tbc
    #softcore
    .goto Wetlands,12.7,46.7,30 >>游向岸边
step << tbc
    .money <0.076
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto 1437,10.760,56.721
    .vendor >>如果你有 7.6s, 检查尼尔·奥雷的青铜管, 如果存在就购买
    .bronzetube
step << tbc
    .goto Wetlands,9.5,59.7
    .fp Menethil >>获取米奈希尔港的飞行路径
step << tbc
    .money <0.0385
    .goto Wetlands,8.1,56.3
    .vendor >>在Dewin处查看治疗药水, 购买至1秒的使用量
step << tbc
    .goto Wetlands,4.7,57.3
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
    >>利用这段时间提升你的急救技能或制作武器石 << Warrior/Rogue/Paladin
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Alliance Warlock
#name 14-14 黑海岸
#displayname 14-14 黑海岸 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor Human Warlock
#next 14-20 秘血岛
#xprate <1.5 << wotlk

step
    .maxlevel 13
    #completewith next
    .goto Darkshore,36.8,44.3,0
    .vendor >>如果您愿意, 可以在旅店底层从莱尔德处购买便宜的食物(20铜币, 5级食物)
step
    .maxlevel 13
    >>旅店顶层
    .goto Darkshore,37.0,44.1
.target Wizbang Cranktoggle
>>与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >>接任务: |cRXP_LOOT_传声盒827号|r
step
    .maxlevel 13
    >>接受奥伯丁附近的任务
.target Tharnariun Treetender
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2118 >>接任务: |cRXP_LOOT_瘟疫蔓延|r
    .goto Darkshore,38.8,43.4
.target Terenthis
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 984 >>接任务: |cRXP_LOOT_熊怪的威胁|r
    .goto Darkshore,39.3,43.4
.target Gwennyth Bly'Leggonde
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >>接任务: |cRXP_LOOT_搁浅的巨兽|r
    .goto Darkshore,36.621,45.594
step
    .maxlevel 13
    .goto Darkshore,36.3,45.6
    .fp Auberdine >>获取奥伯丁的飞行路径
step
    .isOnQuest 983
    #completewith Darkshore2
    >>击杀爬行者. 在完成其他任务时, 从它们身上获取腿部道具
    .complete 983,1 --Collect Crawler Leg (x6)
step
    .isOnQuest 3524
    .goto Darkshore,36.4,50.9
    .complete 3524,1 --Collect Sea Creature Bones (x1)
step
    .isOnQuest 2118
    .goto Darkshore,38.3,52.7,70,0
    .goto Darkshore,38.9,62.0,70,0
    .goto Darkshore,38.3,52.7,70,0
    .goto Darkshore,38.9,62.0,70,0
    .goto Darkshore,38.3,52.7
    >>继续向南走, 直到找到一只狂暴熊, 当你触发仇恨时使用背包中的“萨纳瑞恩的希望”
    .complete 2118,1 --Rabid Thistle Bear Captured
    .unitscan Rabid Thistle Bear
step
    .isOnQuest 984
    #label Darkshore2
.goto Darkshore,39.0,53.2
    .complete 984,1 --Find a corrupt furbolg camp
step
    .isOnQuest 983
    .goto Darkshore,36.7,52.4,70,0
    .goto Darkshore,35.6,47.6,70,0
    .goto Darkshore,36.2,44.5,70,0
    .goto Darkshore,36.7,52.4
    >>击杀爬行者, 搜刮它们的腿
    .complete 983,1 --Collect Crawler Leg (x6)
step
    .isOnQuest 983
    .goto Darkshore,36.6,46.3
    .turnin 983 >>交任务: |cRXP_FRIENDLY_传声盒827号|r
step
    .isOnQuest 3524
    .goto Darkshore,36.621,45.594
.target Gwennyth Bly'Leggonde
>>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 3524 >>交任务: |cRXP_FRIENDLY_搁浅的巨兽|r
step
    .isOnQuest 2118
    .goto Darkshore,38.8,43.4
.target Tharnariun Treetender
>>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2118 >>交任务: |cRXP_FRIENDLY_瘟疫蔓延|r
step
    .isOnQuest 984
    .goto Darkshore,39.3,43.4
.target Terenthis
>>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 984 >>交任务: |cRXP_FRIENDLY_熊怪的威胁|r
step
    .goto Darkshore,36.621,45.594
    .abandon 1001 >>放弃传声盒411号
step
    .goto Darkshore,30.8,41.0
    .abandon 4681 >>放弃搁浅的巨兽
step
    #label Azuremyst
        .goto Darkshore,30.8,41.0
    .zone Azuremyst Isle >>前往: |cRXP_PICK_秘蓝岛|r
    >>在等待时, 升级急救技能或制作武器石 << Warrior/Rogue/Paladin
]])
