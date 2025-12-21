
RXPGuides.RegisterGuide([[
#classic
#version 1
#season 2
<< Alliance
#group RestedXP 联盟 1-20级
#name 12-13 丹莫罗 赛季服
#displayname 12-13 丹莫罗 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 13-16 洛克莫丹 赛季服
#defaultfor !NightElf

step << Warrior
    #season 2
    >>|cRXP_WARN_寻找|r|cRXP_FRIENDLY_游荡剑士|r. |cRXP_WARN_他可能出现在你地图上标记的小区域内任何位置|r
    >>找到他并挑战他进行决斗. 击败他后, 他会刷新出一个小型宝箱, 奖励你一枚|r[|cRXP_FRIENDLY_鲜血狂怒|r]符文|T132334:0|t
    .goto Dun Morogh,52.6,45.0
    .goto Dun Morogh,52.4,47.4,0
    .goto Dun Morogh,52.6,48.8,0
    .goto Dun Morogh,53.6,47.6,0
    .goto Dun Morogh,53.0,46.2,0
    .goto Dun Morogh,55.0,46.6,0
    .collect 204441,1 --Rune of Blood Frenzy (1)
    .unitscan Wandering Swordsman
    .train 412507,1
step << Warrior
    #season 2
    #optional
    #completewith next
    .train 403474 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_血狂符文|r]|cRXP_WARN_进行训练|r|T136012:0|t[血狂]
    .use 204441
    .itemcount 204441,1
step
    #completewith Rudra
    #label Dirt
    .goto Dun Morogh,59.84,49.56,40,0
    .goto Dun Morogh,61.36,47.07,40 >>沿着土路向上走
    .isQuestAvailable 314
step
    #completewith next
    #requires Dirt
    +|cRXP_WARN_风筝|cRXP_ENEMY_瓦加什|r到|cRXP_FRIENDLY_Rudra| 处|r
    .link https://youtu.be/70PX093soq4?si=-cIoU8WWdbC0IdHZ&t=3193 >>|cRXP_WARN_点击此处, 如果你正在遇到困难|r << Mage
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >>|cRXP_WARN_点击此处查看视频参考|r << !Mage
    .mob Vagash
step
    #label Rudra
    .goto Dun Morogh,63.082,49.851
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .accept 314 >>接任务: |cRXP_LOOT_保护牲畜|r
    .target Rudra Amberstill
step << Warrior/Mage
    #season 2
    #sticky
    #optional
    #label rune1
    >>击杀 |cRXP_ENEMY_瓦加什|r. 击败他后搜刮 |T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r << Warrior
    >>击杀|cRXP_ENEMY_瓦加什|r. 击败他后搜刮 |T134939:0|t|cRXP_LOOT_[法术笔记:奥斯特罗夫戒指]|r << Mage
    .collect 204809,1 << Warrior -- Rune of Furious Thunder (1)
    .collect 203753,1 << Mage -- Spell Notes: RING SEFF OSTROF (1)
    .train 403476,1 << Warrior
    .train 401765,1 << Mage
step
    .goto 1426,62.094,47.154,40,0
    .goto 1426,62.434,48.989,40,0
    .goto 1426,62.538,46.195
    >>击杀|cRXP_ENEMY_瓦加什|r. 击败他后搜刮他的|cRXP_LOOT_利牙|r
    >>|cRXP_WARN_把他引到牧场南边的守卫那里. 确保对他造成51%以上的伤害|r
    >>|cRXP_WARN_在尝试击杀|cRXP_ENEMY_瓦加什|r之前, 请先观看下方视频. 该BOSS可由任何职业单刷|r
    .link https://youtu.be/70PX093soq4?si=-cIoU8WWdbC0IdHZ&t=3193 >>|cRXP_WARN_点击此处查看视频参考|r << Mage
    .link https://www.youtube.com/watch?v=ZJX6sCkm5JY >>|cRXP_WARN_点击此处查看视频参考|r << !Mage
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob Vagash
step << Warrior
    #season 2
    #optional
    #requires rune1
    .train 403476 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r|cRXP_WARN_来训练|r|T136048:0|t[狂暴雷霆]
    .use 204809
    .itemcount 204809,1
step << Mage
    #optional
    #season 2
    #requires rune1
    #completewith GolBolarQuarry
    .collect 211779,1 >>你需要从一个|cRXP_FRIENDLY_试剂商|r处获得 |T135933:0|t[理解之魅], 才能使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:RING SEFF OSTROF|r]
    .disablecheckbox
    .train 401765 >>|cRXP_WARN_使用|r|T134939:0|t|cRXP_LOOT_[法术说明:奥斯特罗夫之戒]|r|cRXP_WARN_来训练|r|T236227:0|t[冰霜指环]
    .use 203753
step
    .goto Dun Morogh,63.082,49.851
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .turnin 314 >>交任务: |cRXP_FRIENDLY_保护牲畜|r
    .target Rudra Amberstill
step
    #optional
    #completewith next
    .goto Dun Morogh,68.379,54.492,60 >>前往古博拉采掘场
    .subzoneskip 134
step << !Hunter
    #optional
    #completewith next
    .goto Dun Morogh,68.6,54.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡杉·莫格什|r谈话
    .vendor 1237 >>|cRXP_BUY_如果需要, 最多从他那里购买 10|r|T133968:0|t[刚出炉的面包]|r << Warrior/Rogue
    .vendor 1237 >>|cRXP_BUY_如果需要, 可从他那里购买最多 5 个 |T133968:0|t[刚出炉的面包]|cRXP_BUY_和|r|T132815:0|t[冰镇牛奶]|r << !Warrior !Rogue
    .target Kazan Mogosh
--XX Mud slappers instead
step << Human Warrior/Paladin/Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹克·利刃|r交谈
    .goto Dun Morogh,69.3,55.5
    .train 2581 >>学习采矿技能, 使用“寻找矿物”法术
    .target Dank Drizzlecut
    .skill mining,1
step
    #label QuarryStart
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_参议员梅尔·圣石|r和|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 433 >>接任务: |cRXP_LOOT_公众之仆|r
    .goto Dun Morogh,68.671,55.969
    .accept 432 >>接任务: |cRXP_LOOT_该死的石腭怪！|r
    .goto Dun Morogh,69.084,56.330
    .target Senator Mehr Stonehallow
    .target Foreman Stonebrow
step << !Human Rogue
    #season 2
    #loop
    .goto 1426,70.073,57.030,0
    .goto 1426,68.533,58.372,0
    .goto 1426,68.958,59.357,0
    .waypoint 1426,70.073,57.030,45,0
    .waypoint 1426,69.223,58.242,45,0
    .waypoint 1426,68.533,58.372,45,0
    .waypoint 1426,67.687,60.059,45,0
    .waypoint 1426,68.958,59.357,45,0
    .waypoint 1426,70.475,59.420,45,0
    >>|T133644:0|t[劫掠]|cRXP_ENEMY_石腭击颅者|r和|cRXP_ENEMY_石腭断骨者|r. 搜刮他们以获得 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208215,1 -- Top-Left Map Piece (1)
    .mob Rockjaw Skullthumper
    .mob Rockjaw Bonesnapper
    .train 398196,1
step << !Human Rogue
    #season 2
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_暗铁间谍|r. 击杀他们以获取 |T134331:0|t[黑鼠的笔记] 和 |T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208205,1 --Blackrat's Note (1)
    .collect 208219,1 -- Bottom-Left Map Piece (1)
    .mob Dark Iron Spy
    .train 400094,1
    .train 398196,1
step <<< !Human Rogue
    #season 2
    #optional
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_暗铁间谍|r. 击杀他们以获取 |T134331:0|t[黑鼠的笔记]
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208205,1
    .mob Dark Iron Spy
    .train 400094,1
step <<< !Human Rogue
    #season 2
    #optional
    .goto Dun Morogh,77.86,61.66
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_暗铁间谍|r. 击杀他们以获取 |T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208219,1 -- Bottom-Left Map Piece (1)
    .mob Dark Iron Spy
    .train 398196,1
step <<< !Human Rogue
    #season 2
    .cast 418600 >>|cRXP_WARN_使用任意|r|T134327:0|t[|cRXP_LOOT_地图碎片]|r|cRXP_WARN_将其组合成|r|T134269:0|t[|cRXP_LOOT_丹莫罗藏宝图|r]
    .collect 208220,1
    .itemcount 208219,1
    .itemcount 208213,1
    .itemcount 208215,1
    .itemcount 208218,1
    .use 208219
    .use 208213
    .use 208215
    .use 208218
    .train 398196,1
step << !Human Rogue
    #season 2
    #softcore
    #optional
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
    .train 398196,1
step <<< !Human Rogue
    #season 2
    #completewith next
    .goto Dun Morogh,46.985,43.632
    .cast 418599 >>|cRXP_WARN_使用|r|T134269:0|t[|cRXP_LOOT_丹莫罗藏宝图|r] |cRXP_WARN_在小桥下方. 这将触发一个 |cRXP_PICK_埋藏的宝藏|r出现|r
    .use 208220
    .itemcount 208220,1
    .train 398196,1
step <<< !Human Rogue
    #season 2
    >>打开|cRXP_PICK_Buried Treasure|r. 从中获取 |T134419:0|t[|cRXP_FRIENDLY_迅捷符文|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
step << !Human Rogue
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_迅捷拔枪符文|r]|cRXP_WARN_来训练|r|T134536:0|t[迅捷拔枪]
    .use 203991
    .itemcount 203991,1
step << !Human Rogue
    #season 2
    .goto Dun Morogh,57.256,45.227
    >>与|cRXP_FRIENDLY_黑鼠|r交谈以获得|T134419:0|t[|cRXP_FRIENDLY_残肢符文|r]
    .collect 203990,1
    .skipgossip
    .train 400094,1
step << !Human Rogue
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r]
    .use 203990 -- Rune of Mutilation (1)
    .train 400094,1
step << Dwarf Paladin
    #sticky
    #label PalaCloth
    #loop
    .goto 1426,70.073,57.030,0
    .goto 1426,68.533,58.372,0
    .goto 1426,68.958,59.357,0
    .goto 1426,70.750,56.219,0
    .goto 1426,71.344,51.873,0
    .goto 1426,72.570,53.488,0
    .waypoint 1426,70.073,57.030,45,0
    .waypoint 1426,69.223,58.242,45,0
    .waypoint 1426,68.533,58.372,45,0
    .waypoint 1426,67.687,60.059,45,0
    .waypoint 1426,68.958,59.357,45,0
    .waypoint 1426,70.475,59.420,45,0
    >>击杀|cRXP_ENEMY_石腭击颅者|r 和|cRXP_ENEMY_石腭断骨者|r . 击败它们后搜刮出 |T132889:0|t[亚麻布] << Dwarf Paladin
    >>|cRXP_WARN_保存|r|T132889:0|t[亚麻布]|cRXP_WARN_以备后续任务使用|r << Dwarf Paladin
    .collect 2589,10,1648,1 --Linen Cloth (10)
    .mob Rockjaw Skullthumper
    .mob Rockjaw Bonesnapper
step
    #sticky
    #label Skullthumpers
    #loop
    .goto 1426,70.073,57.030,0
    .goto 1426,68.533,58.372,0
    .goto 1426,68.958,59.357,0
    .waypoint 1426,70.073,57.030,45,0
    .waypoint 1426,69.223,58.242,45,0
    .waypoint 1426,68.533,58.372,45,0
    .waypoint 1426,67.687,60.059,45,0
    .waypoint 1426,68.958,59.357,45,0
    .waypoint 1426,70.475,59.420,45,0
    >>在矿井内或矿井外击杀|cRXP_ENEMY_石腭击颅者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob Rockjaw Skullthumper
step
    #optional
    #completewith next
    .goto 1426,70.750,56.219,20 >>进入古博拉采掘场矿坑
    .isOnQuest 433
step
    #loop
    .goto 1426,70.750,56.219,0
    .goto 1426,71.344,51.873,0
    .goto 1426,72.570,53.488,0
    .goto 1426,70.750,56.219,30,0
    .goto 1426,70.964,54.538,30,0
    .goto 1426,70.679,53.301,30,0
    .goto 1426,70.461,52.292,30,0
    .goto 1426,71.344,51.873,30,0
    .goto 1426,71.999,50.204,30,0
    .goto 1426,72.456,51.300,30,0
    .goto 1426,72.613,52.509,30,0
    .goto 1426,72.570,53.488,30,0
    .goto 1426,71.790,52.278,30,0
    .goto 1426,71.591,51.831,30,0
    >>击杀矿井内的|cRXP_ENEMY_石腭断骨者|r
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
    .mob Rockjaw Bonesnapper
step << Mage
    .goto 1426,69.369,58.311
    >>|cRXP_WARN_在|cRXP_ENEMY_Frozen Trogg|r附近或通用聊天频道(输入 /1 进入聊天)寻找其他法师或术士. 如果没人在线, 你也可以独自完成这个任务|r
    >>|cRXP_WARN_对|cRXP_ENEMY_Frozen Trogg|r施放 |T135812:0|t[火球术]|cRXP_WARN_, 叠加一层 |T135805:0|t[施加热量]|cRXP_WARN_. 一次性叠加 5 层即可击杀|cRXP_ENEMY_Frozen Trogg|r. 击败后拾取获得 |T134939:0|t|cRXP_FRIENDLY_[法术说明:烧尽]|r
    >>|cRXP_WARN_如果无人协助, 进入巨魔的近战范围并对其使用|r|T135820:0|t[烈焰]|cRXP_WARN_. 保持在近战范围内以维持仇恨, 并不断在冷却结束后重复使用|r|T135820:0|t[烈焰]|cRXP_WARN_. 通常在施放5-6次后即可击杀巨魔|r
    .collect 203748,1 --Spell Notes: Burnout (1)
    .train 401759,1
    .mob Frozen Trogg
step << Mage
    .train 401759 >>|cRXP_WARN_使用|r|T134939:0|t|cRXP_FRIENDLY_[法术注释:燃尽]|r|cRXP_WARN_来学习|r|T132686:0|t[雕刻胸甲 - 燃尽]
    .use 203748
    .itemcount 203748,1 --Spell Notes: Burnout (1)
step << Dwarf Paladin
    #optional
    #label RockjawEnd
    #requires PalaCloth
step
    #label RockjawEnd << !Paladin
    #requires Skullthumpers
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头乔尼·石眉|r和|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .turnin 432 >>交任务: |cRXP_FRIENDLY_该死的石腭怪！|r
    .goto Dun Morogh,69.084,56.330
    .turnin 433 >>交任务: |cRXP_FRIENDLY_公众之仆|r
    .goto Dun Morogh,68.671,55.969
    .target Senator Mehr Stonehallow
    .target Foreman Stonebrow
step
    #optional
    #completewith next
    .goto 1426,77.189,48.816,50,0
    .goto 1426,81.252,42.650,50,0
    .goto Dun Morogh,83.892,39.188,20 >>前往|cRXP_FRIENDLY_驾驶员塞克·锤足|r
step
    .goto Dun Morogh,83.892,39.188
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .accept 419 >>接任务: |cRXP_LOOT_失踪的驾驶员|r
    .target Pilot Hammerfoot
step
    .goto Dun Morogh,79.672,36.171
    >>点击地面上的|cRXP_PICK_Dwarven Corpse|r
    .turnin 419 >>交任务: |cRXP_FRIENDLY_失踪的驾驶员|r
    .accept 417 >>接任务: |cRXP_LOOT_驾驶员的复仇|r
step << Warrior/Mage
    #season 2
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_癞爪|r. 击败后搜刮其物品, 获得 |T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r << Warrior
    >>击杀|cRXP_ENEMY_癞爪|r. 击败他后搜刮物品, 获得|T134939:0|t|cRXP_LOOT_[法术笔记:奥斯特罗夫之戒]|r << Mage
    .collect 204809,1 << Warrior -- Rune of Furious Thunder (1)
    .collect 203753,1 << Mage -- Spell Notes: RING SEFF OSTROF (1)
    .train 403476,1 << Warrior
    .train 401765,1 << Mage
step
    .goto Dun Morogh,78.97,37.14
    >>击杀|cRXP_ENEMY_癞爪|r. 击败他后搜刮出他的|cRXP_LOOT_肮脏的爪子|r
    .complete 417,1 --Collect Mangy Claw (x1)
    .mob Mangeclaw
step << Warrior
    #season 2
    .train 403476 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r|cRXP_WARN_来训练|r|T136048:0|t[狂暴雷霆]
    .use 204809
    .itemcount 204809,1
step << Mage
    #season 2
    #completewith next
    .collect 211779,1 >>你需要从一个|cRXP_FRIENDLY_试剂商|r处获得 |T135933:0|t[理解之魅], 才能使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:RING SEFF OSTROF|r]
    .disablecheckbox
    .train 401765 >>|cRXP_WARN_使用|r|T134939:0|t|cRXP_LOOT_[法术说明:奥斯特罗夫之戒]|r|cRXP_WARN_来训练|r|T236227:0|t[冰霜指环]
    .use 203753
step
    #xprate <1.49 << Rogue
    .goto Dun Morogh,83.892,39.188
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    >>|cRXP_WARN_选择|r|T135641:0|t[工匠匕首]|cRXP_WARN_. 留待以后使用|r << Rogue
    .turnin 417 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r << !Rogue
    .turnin 417,1 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r << Rogue
    .target Pilot Hammerfoot
step << Rogue
    #xprate >1.49
    .goto Dun Morogh,83.892,39.188
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    >>|cRXP_WARN_选择|r|T135641:0|t[工匠匕首]
    .turnin 417,1 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r
    .target Pilot Hammerfoot
step << Rogue
    #xprate >1.49
    #completewith ShimmerStoutEnd
    +|cRXP_WARN_在你的主手中装备|r|T135641:0|t[工匠匕首]|r
    .use 2218
    .itemcount 2218,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step
    #label enterloch
    #completewith next
    .goto Dun Morogh,84.4,31.1,25 >>穿过隧道前往洛克莫丹
    .zoneskip Loch Modan
step
    #optional
    #completewith lochstart1
    >>击杀|cRXP_ENEMY_老黑熊|r. 击杀后搜刮其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后从它们身上搜刮|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r. 击败它们后搜刮出|cRXP_LOOT_蜘蛛的毒液|r
    >>保存你找到的任何 |cRXP_LOOT_香脆蜘蛛肉|r, 留着以后做任务用
    .collect 1081,5,92,1
    .disablecheckbox
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +Mountain Boar
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +Elder Black Bear
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +Forest Lurker
    >>|cRXP_WARN_保存任何|r|T133970:0|t|cRXP_LOOT_[野猪肉块]|r|cRXP_WARN_用于升级|r|T133971:0|t[烹饪]|cRXP_WARN_稍后使用|r
step << Warlock
    .line Loch Modan,22.87,70.89,24.69,68.20,28.02,65.41,29.47,59.92,31.56,56.66,32.36,50.09,34.94,47.10,32.36,50.09,31.36,47.60,31.54,44.72,32.29,42.34,32.25,41.14,31.08,38.57,30.04,31.45,27.96,25.37,26.73,23.07,26.04,19.16,25.95,15.13,25.53,11.66
    .goto Loch Modan,22.87,70.89,50,0
    .goto Loch Modan,24.69,68.20,50,0
    .goto Loch Modan,28.02,65.41,50,0
    .goto Loch Modan,29.47,59.92,50,0
    .goto Loch Modan,31.56,56.66,50,0
    .goto Loch Modan,32.36,50.09,50,0
    .goto Loch Modan,34.94,47.10,50,0
    .goto Loch Modan,32.36,50.09,50,0
    .goto Loch Modan,31.36,47.60,50,0
    .goto Loch Modan,31.54,44.72,50,0
    .goto Loch Modan,32.29,42.34,50,0
    .goto Loch Modan,32.25,41.14,50,0
    .goto Loch Modan,31.08,38.57,50,0
    .goto Loch Modan,30.04,31.45,50,0
    .goto Loch Modan,27.96,25.37,50,0
    .goto Loch Modan,26.73,23.07,50,0
    .goto Loch Modan,26.04,19.16,50,0
    .goto Loch Modan,25.95,15.13,50,0
    .goto Loch Modan,25.53,11.66
    >>|cRXP_WARN_寻找在洛克莫丹道路上巡逻的|cRXP_FRIENDLY_格雷珊·铁炉|r. 他的巡逻路线已标记在你的地图上|r
    >>|cRXP_BUY_从他那里购买 a|r|T237359:0|t[恶意馅饼]|r
    .collect 208833,1
    .unitscan Greishan Ironstove
    .train 403932,1
step << Warlock
    .use 208833 >>|cRXP_WARN_使用|r|T237359:0|t[恶意馅饼]|cRXP_WARN_吃掉它. 当|r|T132108:0|t[地狱消化不良]|cRXP_WARN_减益效果消失后, 你将获得|r|T134419:0|t[|cRXP_FRIENDLY_引导符文|r]
    .collect 208750,1 -- Rune of Channeling (1)
    .train 403932,1
step << Warlock
    .train 403932 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_引导符文|r]|cRXP_WARN_来训练|r|T136168:0|t[引导大师]
    .use 208750
    .itemcount 208750,1
step << Dwarf Paladin
    .xp 12
step
    #label lochstart1
    #optional
    .goto 1432,34.405,48.276
    .subzone 144 >>前往塞尔萨玛
step
    #completewith lochpatrol3
    .abandon 1338 >>如果你已有任务|cRXP_FRIENDLY_Stormpike's Task|r, 请先放弃它, 否则将无法接受后续任务
step
    #label lochpatrol1
    #completewith lochpatrol2
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .accept 416 >>接任务: |cRXP_LOOT_狗头人的耳朵|r
    .accept 1339 >>接任务: |cRXP_LOOT_巡山人卡尔·雷矛的任务|r
    .target Mountaineer Kadrell
step
    #optional
    #completewith next
    .goto 1432,35.273,47.750,10,0
    .goto 1432,35.433,48.243,12 >>进入豪饮旅店
    .subzoneskip 2101
step
    .goto Loch Modan,34.828,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .accept 418 >>接任务: |cRXP_LOOT_塞尔萨玛血肠|r
    .target Vidra Hearthstove
step << Human
    .goto Loch Modan,34.8,48.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尼·铁心|r对话, 他在里面
    .vendor >>|cRXP_BUY_出售垃圾, 最多可购四件|r|T133634:0|t[小棕色口袋]|cRXP_BUY_如果你仍需要|r
    .target Yanni Stoutheart 
step << Dwarf/Gnome
    #label ThelsaHS
    .goto Loch Modan,35.534,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r交谈
    .home >>将你的[炉石]设置为塞尔萨玛
    .target Innkeeper Hearthstove
step << Dwarf/Gnome
    #label HonorStudents
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.019,47.806
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .accept 6387 >>接任务: |cRXP_LOOT_荣誉学员|r
    .target Brock Stoneseeker
step
    #optional
    #label lochpatrol2
step
    #label lochpatrol3
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .goto Loch Modan,36.72,41.97,15,0
    .goto Loch Modan,37.24,43.19,15,0
    .goto Loch Modan,37.33,45.63,15,0
    .goto Loch Modan,36.77,46.20,15,0
    .goto Loch Modan,35.19,46.88,15,0
    .goto Loch Modan,32.67,49.71,20,0
    .goto Loch Modan,36.77,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .accept 416 >>接任务: |cRXP_LOOT_狗头人的耳朵|r
    .accept 1339 >>接任务: |cRXP_LOOT_巡山人卡尔·雷矛的任务|r
    .target Mountaineer Kadrell

step << Dwarf/Gnome
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .turnin 6387 >>交任务: |cRXP_FRIENDLY_荣誉学员|r
    .accept 6391 >>接任务: |cRXP_LOOT_飞往铁炉堡|r
    .target Thorgrum Borrelson
step << Hunter
    #sticky
	.goto Loch Modan,33.9,54.0
    .goto Loch Modan,36.6,53.2,0
    .goto Loch Modan,30.0,53.5,0
    .train 172551 >>驯服森林潜伏者 
    >>|cRXP_WARN_这是矮人猎人最容易获得的最高DPS宠物, 你最终会用湿地地区的迅猛龙来替换它|r
    .unitscan Forest Lurker
step << Human
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .fp Thelsamar >>获取塞尔萨玛飞行路径
step << Dwarf/Gnome
    #label flyIF
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .fly Ironforge >>飞往铁炉堡
    .target Thorgrum Borrelson
    .zoneskip Ironforge
step << Priest Dwarf
    #season 2
    #completewith end
    .train 402852 >>|cRXP_WARN_ 使用|r|T135975:0|t[|cRXP_FRIENDLY_被亵渎要塞的预言|r]
    >>|cRXP_WARN_你必须在暴风城大教堂和洛克莫丹或铁炉堡神秘区的圣光祭坛旁输入 /pray, 才能获得 2|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buffs|r
    >>|cRXP_WARN_|T136057:0|t|cRXP_PICK_Meidtation on Elune|r增益必须由另一位牧师玩家施放, 方法是在你使用 /kneel 跪下时, 他们对你使用 /pray 祷告表情. 如果你看到其他牧师拥有此冥想增益, 请向他们请求|r
    --.use 205947
    .target Altar of Light
    .itemcount 205947,1
step << Rogue !Human
    #optional
    #completewith next
    .goto 1455,22.283,79.620,30,0
    .goto 1455,27.315,82.828,30,0
    .goto 1455,38.913,71.447,30,0
    .goto 1455,46.624,53.683,30,0
    .goto 1455,60.781,25.800,30,0
    .goto 1455,59.236,14.974,30,0
    .goto 1455,52.941,12.466,12,0
    .goto 1455,51.919,14.468,12,0
    .goto 1455,51.438,16.000,10 >>前往楼下找|cRXP_FRIENDLY_霍夫丹·黑须|r
step << Rogue !Human
    .goto Ironforge,51.958,14.838
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下 |cRXP_FRIENDLY_霍夫丹·黑须|r 交谈
    .turnin 2218 >>交任务: |cRXP_FRIENDLY_救赎之路|r
    .target Hulfdan Blackbeard
step << Rogue !Human
    #season 2
    .goto Ironforge,51.913,13.383
    >>打开外面的|cRXP_PICK_Dusty Chest|r, 从中获取 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_这样做会刷新两个等级为10的|cRXP_ENEMY_刀疤劫匪|r, 他们会攻击你|r
    .collect 204174,1 -- Rune of Precision (1)
    .mob Cut-throat Mugger
    .train 400081,1
    .zoneskip Ironforge,1
step << Rogue !Human
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_来训练|r|T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1
---------pt1
step << Dwarf/Gnome
    #optional
    #completewith next
    .goto 1455,44.029,50.074,20,0
    .goto Ironforge,39.550,57.490,12 >>前往|cRXP_FRIENDLY_参议员巴林·红石|r
step << Dwarf/Gnome
    .goto Ironforge,39.550,57.490
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_参议员巴林·红石|r交谈
    .turnin 291 >>交任务: |cRXP_FRIENDLY_森内尔的报告|r
    .target Senator Barin Redstone
step << !Human Rogue
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_|cRXP_BUY_从她那里购买 [Jambyia]|r
    .collect 2207,1 --Jambyia
    .target Brenwyn Wintersteel
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.0
step << Dwarf/Gnome
    #label Ride
    .goto Ironforge,51.521,26.311
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尼尔·石趾|r交谈
    .turnin 6391 >>交任务: |cRXP_FRIENDLY_飞往铁炉堡|r
    .accept 6388 >>接任务: |cRXP_LOOT_格莱斯·瑟登|r
    .target Golnir Bouldertoe
step << Dwarf/Gnome
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    >>|cRXP_WARN_请勿飞行|r
    .turnin 6388 >>交任务: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .accept 6392 >>接任务: |cRXP_LOOT_向布洛克回复|r
    .target Gryth Thurden
step << Dwarf Paladin
    #optional
    #completewith next
    .goto 1455,44.403,49.020,20,0
    .goto 1455,35.239,32.789,20,0
    .goto 1455,27.208,12.552,20,0
    .goto Ironforge,24.2,6.8,12 >>前往|cRXP_FRIENDLY_布兰度尔·铁锤|r
step << Dwarf Paladin
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰度尔·铁锤|r交谈
    .accept 2999 >>接任务: |cRXP_LOOT_圣洁之书|r
    .trainer >>训练你的职业法术
    .target Brandur Ironhammer
step << Dwarf Paladin
    #optional
    #completewith next
    .goto 1455,25.400,2.676,10,0
    .goto 1455,23.621,2.544,10,0
    .goto 1455,22.014,4.533,10,0
    .goto 1455,21.831,7.651,10,0
    .goto 1455,23.766,11.636,10,0
    .goto 1455,27.622,12.177,12 >>前往楼上的|cRXP_FRIENDLY_蒂萨·热炉|r
step << Dwarf Paladin
    .goto 1455,27.622,12.177
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 2999 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1645 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1645 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Tiza Battleforge
step << Dwarf Paladin
    .goto 1455,27.622,12.177
    >>|cRXP_WARN_使用 |T133739:0|t|cRXP_LOOT_[圣洁之书]|r开始任务|r
    .accept 1646 >>接任务: |cRXP_LOOT_圣洁之书|r
    .use 6916
step << Dwarf Paladin
    .goto 1455,27.622,12.177
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 1646 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1647 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Tiza Battleforge
step << Dwarf Paladin
    #loop
    .line Ironforge,21.750,51.733,22.015,54.945,23.328,61.865,23.723,63.824,26.021,68.382,27.495,71.320,31.352,77.807,32.405,78.563,37.256,82.159,39.204,83.202,42.944,84.113
    .goto 1455,21.750,51.733,0
    .goto 1455,26.021,68.382,0
    .goto 1455,42.944,84.113,0
    .goto 1455,21.750,51.733,20,0
    .goto 1455,22.015,54.945,20,0
    .goto 1455,23.328,61.865,20,0
    .goto 1455,23.723,63.824,20,0
    .goto 1455,26.021,68.382,20,0
    .goto 1455,27.495,71.320,20,0
    .goto 1455,31.352,77.807,20,0
    .goto 1455,32.405,78.563,20,0
    .goto 1455,37.256,82.159,20,0
    .goto 1455,39.204,83.202,20,0
    .goto 1455,42.944,84.113,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_约翰·特纳|r交谈
    >>|cRXP_FRIENDLY_约翰·特纳|r|cRXP_WARN_ 巡逻于铁炉堡外环, 位置在石火酒馆稍后至游客中心稍后之间|r
    .turnin 1647 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1648 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1648 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    --.accept 1778 >>接任务: |cRXP_LOOT_圣洁之书|r
    .unitscan John Turner
step << Gnome Mage
    .goto Ironforge,27.0,8.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_彬克|r交谈
    .trainer >>训练你的职业法术
    .target Bink   
step << Gnome Mage
    #season 2
    .goto Ironforge,19.197,56.094
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞姆·贾根斯塔德|r交谈
    >>|cRXP_BUY_从他那里购买至少 2|r|T135933:0|t[理解魔咒]|r
    >>|cRXP_WARN_学习符文需要这些道具|r
    .collect 211779,2
    .target Barim Jurgenstaad
step << Dwarf/Gnome
    #ah
    #optional
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡拍卖商交谈|r
    >>|cRXP_WARN_如果你不想或无法完成此步骤, 请跳过|r
    >>|cRXP_BUY_请在洛克莫丹尽快购买以下物品, 以加快任务提交进度:|r
    >>|T134342:0|t[猪大肠]
    >>|T134027:0|t[熊肉]
    >>|T134437:0|t[蜘蛛的毒液]
    .collect 3172,3,418,1 -- Boar Intestines (3)
    .collect 3173,3,418,1 -- Bear Meat (3)
    .collect 3174,3,418,1 -- Spider Ichor (3)
    .target Auctioneer Lympkin
    .target Auctioneer Redmuse
    .target Auctioneer Buckler
    .zoneskip Dun Morogh
    .isQuestAvailable 418
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克斯|r和|cRXP_FRIENDLY_布里维夫·石拳|r交谈
    >>如果你之前没有训练投掷和双手锤, 现在就去练吧
    .train 2567 >>投掷训练
    .goto Ironforge,62.237,89.628
    .train 199 >>学习2小时锤类武器技能
    .goto Ironforge,61.177,89.508
    .target Bixi Wobblebonk
    .target Buliwyf Stonehand
step << Warrior !Human
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_楼下的布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r |T135425:0|t[锐利投掷匕首] |r
    .collect 3107,1 --Collect Keen Throwing Knife (200)
    .target Brenwyn Wintersteel
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Warrior !Human
    #optional
    #completewith Dirt
    +|cRXP_WARN_装备|r|T135425:0|t[锐利投掷匕首]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Warrior !Human
    #season 2
    #optional
    #completewith next
    .goto Ironforge,71.54,73.46,10,0
    .goto Ironforge,72.53,76.94,10 >>前往旅店内部, 找到|cRXP_FRIENDLY_布鲁克·麦须|r
    .train 425447,1
step << Warrior !Human
    #season 2
    .goto Ironforge,72.53,76.94
    .gossipoption 110791 >>与|cRXP_FRIENDLY_布鲁克·麦须|r对话, 他在里面
    .target Bruuk Barleybeard
    .skipgossip 5570,1,1
    .train 425447,1
--XX 110793 "How's business?"
--XX 110791 "Sounds like you need someone to bounce him for you."
step << Warrior !Human
    #season 2
    .goto Ironforge,72.40,73.63
    .gossipoption 109084 >>与|cRXP_FRIENDLY_Bruart|r谈话以开启战斗
    >>击败|cRXP_ENEMY_Bruart|r
    >>|cRXP_WARN_小心, 他正在施放|r|T132939:0|t[反手击]|cRXP_WARN_(使你眩晕2秒)|r
    >>|cRXP_WARN_把他风筝到楼上的阳台上, 然后跳到旅店外并使用|r|T133688:0|t[绷带]|cRXP_WARN_(如果你有且需要的话)|r
    .mob Bruart
    .skipgossip 209004,1
    .train 425447,1
--XX 109084 "Seems you've had a few too many"
--XX Check if another player can skip the "how's business" dialogue for you (paladin, warrior)
step << Warrior !Human
    #season 2
    .goto Ironforge,72.40,73.63,-1
    .goto Ironforge,72.53,76.94,-1
    >>击败|cRXP_ENEMY_Bruart|r
    >>|cRXP_WARN_小心, 他正在施放|r|T132939:0|t[反手击]|cRXP_WARN_(使你眩晕2秒)|r
    >>|cRXP_WARN_把他风筝到楼上的阳台上, 然后跳到旅店外并使用|r|T133688:0|t[绷带]|cRXP_WARN_(如果你有且需要的话)|r
    >>|cRXP_WARN_击败布鲁亚特后:|r
    >>与|cRXP_FRIENDLY_布鲁克·麦须|r再次对话, 以获得|T134419:0|t[狂怒冲锋符文]
    >>|cRXP_WARN_如果他不给你|r|T134419:0|t[狂暴突袭符文]|cRXP_WARN_, 你可能需要再次与|cRXP_ENEMY_Bruart|r战斗|r
    >>|cRXP_WARN_注意:此任务 solo 可能较困难, 建议寻求帮助；若不想现在完成, 可稍后在指南中再次尝试|r
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target Bruuk Barleybeard
    .skipgossip 5570,2,1
    .skipgossip 209004,1
    .train 425447,1
--XX 109539 "I've taken care of Stuart. He shouldn't be a problem anymore."
step << Warrior !Human
    #season 2
    .train 425447 >>|cRXP_WARN_使用|r|T134419:0|t[狂暴突袭符文]|cRXP_WARN_来学习|r|T134596:0|t[雕刻裤 - 狂暴突袭]
    .use 204716
    .itemcount 204716,1 --Rune of Frenzied Assault (1)
step << Warrior !Human
    #season 2
    #completewith DRT
    .engrave 7 >>|cRXP_WARN_刻印你的|r|T134596:0|t|cRXP_LOOT_[裤子]|r|cRXP_WARN_带有|r|T134596:0|t[刻印裤子 - 狂暴突击]
    .train 425447,3
step << Hunter
    #optional
    #completewith next
    .goto 1455,66.847,83.366,15,0
    .goto Ironforge,70.86,85.83,15 >>前往|cRXP_FRIENDLY_贝莉亚·雷岩|r
step << Hunter
    .goto Ironforge,70.86,85.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝莉亚·雷岩|r交谈
    .turnin 6086 >>交任务: |cRXP_FRIENDLY_训练野兽|r
    .target Belia Thundergranite
step << Paladin Dwarf
    #season 2
    #completewith next
    .goto Ironforge,71.54,73.46,10,0
    .goto Ironforge,72.53,76.94,10 >>前往旅店内部, 找到|cRXP_FRIENDLY_布鲁克·麦须|r
    .train 425621,1
step << Paladin Dwarf
    #season 2
    .goto Ironforge,72.53,76.94
    .gossipoption 110791 >>与|cRXP_FRIENDLY_布鲁克·麦须|r对话, 他在里面
    .target Bruuk Barleybeard
    .skipgossip 5570,1,1
    .train 425621,1
--XX 110793 "How's business?"
--XX 110791 "Sounds like you need someone to bounce him for you."
step << Paladin Dwarf
    #season 2
    .goto Ironforge,72.40,73.63
    .gossipoption 109084 >>与|cRXP_FRIENDLY_Bruart|r谈话以开启战斗
    >>击败|cRXP_ENEMY_Bruart|r
    >>|cRXP_WARN_小心, 他正在施放|r|T132939:0|t[反手击]|cRXP_WARN_(使你眩晕2秒)|r
    >>|cRXP_WARN_记得预先施放|r|T135924:0|t[十字军印记]|cRXP_WARN_给他|r
    >>|cRXP_WARN_切勿意外对他施放|r|T135906:0|t[力量祝福]|r
    >>|cRXP_WARN_风筝他到楼上的阳台, 然后跳到旅店外施放|r |T135920:0|t[圣光] |cRXP_WARN_如有需要|r
    .mob Bruart
    .skipgossip 209004,1
    .train 425621,1
--XX 109084 "Seems you've had a few too many"
--XX Check if another player can skip the "how's business" dialogue for you (paladin, warrior)
step << Paladin Dwarf
    #season 2
    .goto Ironforge,72.40,73.63,-1
    .goto Ironforge,72.53,76.94,-1
    >>击败|cRXP_ENEMY_Bruart|r
    >>|cRXP_WARN_小心, 他正在施放|r|T132939:0|t[反手击]|cRXP_WARN_(使你眩晕2秒)|r
    >>|cRXP_WARN_记得预先施放|r|T135924:0|t[十字军印记]|cRXP_WARN_给他|r
    >>|cRXP_WARN_切勿意外对他施放|r|T135906:0|t[力量祝福]|r
    >>|cRXP_WARN_风筝他到楼上的阳台, 然后跳到旅店外施放|r |T135920:0|t[圣光] |cRXP_WARN_如有需要|r
    >>|cRXP_WARN_击败布鲁亚特后:|r
    >>与|cRXP_FRIENDLY_布鲁克·麦须|r再次对话, 以获得|T134419:0|t[斥责符文]
    >>|cRXP_WARN_如果他不给你|r|T134419:0|t[斥责符文]|cRXP_WARN_, 你可能需要再次击败|cRXP_ENEMY_Bruart|r|r
    .collect 205683,1 --Rune of Rebuke (1)
    .target Bruuk Barleybeard
    .skipgossip 5570,2,1
    .skipgossip 209004,1
    .train 425621,1
--XX 109539 "I've taken care of Stuart. He shouldn't be a problem anymore."
step << Paladin Dwarf
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[斥责符文]|cRXP_WARN_来学习|r|T134596:0|t[刻印长裤 - 斥责]
    .use 205683
    .itemcount 205683,1 --Rune of Rebuke (1)
    .train 425621,1
step << Paladin Dwarf
    #season 2
    #completewith DRT
    .engrave 7 >>|cRXP_WARN_刻印你的|r|T134596:0|t|cRXP_LOOT_[裤子]|r为|r|T134596:0|t[刻印裤子 - 斥责]
    >>|cRXP_WARN_记得将|r|T134919:0|t[斥责]|cRXP_WARN_放到你的快捷栏上|r
    .train 425621,3
-- step << Dwarf/Gnome
--     #label Ride
--     .goto Ironforge,51.521,26.311
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尼尔·石趾|r交谈
--     .fly Loch >>飞往洛克莫丹
--     .target Golnir Bouldertoe
step << Dwarf/Gnome
    #label DRT
    #completewith TramEnd
    .goto Ironforge,78.00,51.40
    .subzone 2257 >>进入矿道地铁
step << Dwarf/Gnome
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与矿道地铁中平台上的|cRXP_FRIENDLY_蒙提|r交谈
    .accept 6661 >>接任务: |cRXP_LOOT_捕捉矿道老鼠|r
    .target Monty
step << Dwarf/Gnome
    >>在矿道地铁中的矿道老鼠身上使用 |T133942:0|t[捕鼠者长笛]
    .complete 6661,1 --Rats Captured (x5)
    .use 17117
    .mob Deeprun Rat
step << Dwarf/Gnome
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与矿道地铁中平台上的|cRXP_FRIENDLY_蒙提|r交谈
    >>完成第一个任务后, 他会进行几秒钟的角色扮演. |cRXP_WARN_如果等待会导致错过电车, 请跳过后续任务|r
    .turnin 6661 >>交任务: |cRXP_FRIENDLY_捕捉矿道老鼠|r
    .timer 11,Deeprun Rat Roundup RP
    .accept 6662 >>接任务: |cRXP_LOOT_我的兄弟，尼普希|r
    .target Monty
step << Dwarf/Gnome
    #label TramEnd
    >>|cRXP_WARN_乘坐矿道地铁前往暴风城一侧|r
    >>|cRXP_WARN_如果需要, 请在等待前往暴风城电车时提升你的|r|T135966:0|t[急救]|cRXP_WARN_技能|r << Rogue/Warrior/Paladin
    >>|cRXP_WARN_你需要|r|T135966:0|t[急救]|cRXP_WARN_达到80级才能接取24级的任务|r << Rogue !Dwarf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城方向矿道地铁中层平台上的|cRXP_FRIENDLY_Nipsy|r交谈
    .turnin 6662 >>交任务: |cRXP_FRIENDLY_我的兄弟，尼普希|r
    .isOnQuest 6662
    .target Nipsy
    .subzoneskip 2257,1 --Deeprun Tram
step << Dwarf/Gnome
    #optional
    #completewith Order
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .isOnQuest 1338
step << !Human
    .goto StormwindClassic,51.757,12.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞曼德·艾尔默|r交谈
    .accept 353 >>接任务: |cRXP_LOOT_雷矛的包裹|r
    .target Grimand Elmore
step << Dwarf Priest
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step << Priest Dwarf
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .trainer >>训练你的职业法术
    .turnin 5634 >>交任务: |cRXP_FRIENDLY_绝望祷言|r
    .target High Priestess Laurena
step << Priest Dwarf
    .goto StormwindClassic,38.62,26.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .train 13908 >>训练绝望祷言
    .target High Priestess Laurena
step << Warrior !Human
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.503,45.712
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊尔萨·考宾|r交谈
    .trainer >>训练你的职业法术
    .accept 1638 >>接任务: |cRXP_LOOT_战士的训练|r
    .target Ilsa Corbin
step << Warrior !Human
    #optional
    #completewith next
    .goto StormwindClassic,72.878,51.582,17,0
    .goto StormwindClassic,71.7,39.9,12 >>进入酒馆
step << Warrior !Human
    .goto StormwindClassic,74.249,37.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈里·伯加德|r交谈
    .turnin 1638 >>交任务: |cRXP_FRIENDLY_战士的训练|r
    .accept 1639 >>接任务: |cRXP_LOOT_醉鬼巴特莱比|r
    .target Harry Burlguard
step << Warrior !Human
    .goto StormwindClassic,73.787,36.323
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴特莱比|r交谈
    .turnin 1639 >>交任务: |cRXP_FRIENDLY_醉鬼巴特莱比|r
    .accept 1640 >>接任务: |cRXP_LOOT_击败巴特莱比|r
    .target Bartleby
step << Warrior !Human
    .goto StormwindClassic,73.787,36.323
    >>击败|cRXP_ENEMY_巴特莱比|r
    .complete 1640,1 --Beat Bartleby
    .mob Bartleby
step << Warrior !Human
    .goto StormwindClassic,73.787,36.323
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴特莱比|r交谈
    .turnin 1640 >>交任务: |cRXP_FRIENDLY_击败巴特莱比|r
    .accept 1665 >>接任务: |cRXP_LOOT_巴特莱比的酒杯|r
    .target Bartleby
step << Warrior !Human
    .goto StormwindClassic,74.249,37.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈里·伯加德|r交谈
    .turnin 1665 >>交任务: |cRXP_FRIENDLY_巴特莱比的酒杯|r
    .target Harry Burlguard
step << Warlock !Human
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock !Human
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >>训练你的职业法术
    .target Ursula Deline
step << Warlock !Human
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .accept 1688 >>接任务: |cRXP_LOOT_苏伦娜·凯尔东|r
    .target Gakin the Darkbinder
step << Warlock !Human
    #softcore
    .deathskip >>死亡后使用 |T136126:0|t[生命分流] 并站在你旁边的篝火上, 即可在灵魂医者处复活
    .target Spirit Healer
    .isOnQuest 1688
step << Warlock !Human
    .goto Elwynn Forest,42.105,65.927
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
    .isOnQuest 1688
step << Warlock !Human
    #label SChoker
    .goto Elwynn Forest,71.10,80.66
    >>击杀|cRXP_ENEMY_苏伦娜·凯尔东|r. 搜刮她的|cRXP_LOOT_项圈|r
    >>|cRXP_WARN_集中精力快速击杀|r苏伦娜·凯尔东|r
    >>|cRXP_WARN_持续施放|r|T136183:0|t[恐惧], |cRXP_WARN_目标: |r|cRXP_ENEMY_收货人莫根|r|r
    .complete 1688,1 --Surena's Choker (1)
    .mob Surena Caledon
step << Warlock !Human
    #optional
    #label WlockRedridge
    #completewith next
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
step << Warlock !Human
    .goto Redridge Mountains,17.4,69.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
    .target Guard Parker
step << Warlock !Human
    .goto Redridge Mountains,30.733,59.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    >>|cRXP_WARN_途中请注意高阶怪物|r
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .target Deputy Feldon
step << Warlock !Human
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >>获取赤脊山飞行点
    .target Ariena Stormfeather
step << !Human
    .hs >>炉石前往洛克莫丹
    .cooldown item,6948,>0,1 << !Warlock
step << !Warlock !Human
    #label end
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .goto Ironforge,55.501,47.742
    .fly Loch Modan >>飞往洛克莫丹
    .target Gryth Thurden
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Wetlands
step << Dwarf Paladin/Dwarf Hunter
    .goto Stormwind City,74.182,7.465
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔顿·西弗|r交谈
    >>从他那里购买 |T133745:0|t|cRXP_LOOT_[殉道遗嘱]|r, 用它来训练 |T135961:0|t[殉道印记] << Paladin
    >>从他那里购买 |T133739:0|t|cRXP_LOOT_[狮心论]|r, 用它来训练 |T132185:0|t[狮心之印] << Hunter
    .collect 226401,1 << Hunter
    .collect 226398,1 << Paladin
step << Dwarf Paladin/Dwarf Hunter
    .goto Stormwind City,74.182,7.465
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔顿·西弗|r交谈
    >>如果你有很多闲钱, 可以向米尔顿购买另外两本《圣经》, 以备日后使用 << Paladin
    >>如果你有很多闲钱, 也可以从他那里购买|T133739:0|t|cRXP_LOOT_[论毒蛇之相的论述]|r << Hunter
    .collect 216768,1 << Paladin -- Testament of Enhanced Blessings
    .collect 226400,1 << Paladin -- Testament of the Exorcist
    .collect 216770,1 << Hunter -- Treatise on Aspect of the Viper
    .money <5
step << !Human
    .goto Loch Modan,34.8,48.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅尼·铁心|r对话, 他在里面
    .vendor >>|cRXP_BUY_出售垃圾, 最多可购四件|r|T133634:0|t[小棕色口袋]|cRXP_BUY_如果你仍需要|r
    .target Yanni Stoutheart 
]])

RXPGuides.RegisterGuide([[
#classic
#version 1
#season 2
<< Alliance
#group RestedXP 联盟 1-20级
#name 13-16 洛克莫丹 赛季服
#displayname 13-16 洛克莫丹 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 16-17 西部荒野 赛季服
#defaultfor !NightElf

step << Hunter
#optional
    .goto Loch Modan,35.828,43.457
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维罗克·乱枪|r交谈
    >>|cRXP_BUY_如果你负担得起, 就买 a|r|T135613:0|t[猎人的火枪]|r
    .collect 2511,1
    .money <0.1300
    .target Vrok Blunderblast
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.00
step << Dwarf/Gnome
    .goto Loch Modan,37.17,47.94,8,0
    .goto Loch Modan,37.019,47.806
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛克·寻石者|r交谈
    .turnin 6392 >>交任务: |cRXP_FRIENDLY_向布洛克回复|r
    .target Brock Stoneseeker
step
    .goto Loch Modan,22.071,73.127
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >>接任务: |cRXP_LOOT_保卫国王的领土|r
    .target Mountaineer Cobbleflint
step
    #optional
    #completewith next
    .goto Loch Modan,23.27,75.65,12,0
    .goto Loch Modan,23.62,75.42,12,0
    .goto Loch Modan,23.12,73.93,12 >>进入掩体. 前往顶层
step
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碉堡内的拉格弗斯上尉|r交谈
    .accept 267 >>接任务: |cRXP_LOOT_穴居人的威胁|r
    .target Captain Rugelfuss

step
#completewith next
    .goto Loch Modan,30.0,68.4,0
    .goto Loch Modan,30.0,68.4,30,0 >>前往碎石裂谷
    .subzoneskip 923
step << Warrior
    #season 2
    #sticky
    #label Geode
    #loop
    .goto Loch Modan,27.01,48.74,0
    .goto Loch Modan,27.68,56.83,0
    .goto Loch Modan,33.35,71.59,0
    .goto Loch Modan,31.54,74.96,0
    .waypoint Loch Modan,27.01,48.74,50,0
    .waypoint Loch Modan,27.68,56.83,50,0
    .waypoint Loch Modan,33.35,71.59,50,0
    .waypoint Loch Modan,31.54,74.96,50,0
    .waypoint Loch Modan,33.88,76.58,50,0
    >>击杀|cRXP_ENEMY_Troggs|r. 击杀后搜刮出|cRXP_LOOT_Skull-Shaped Geode|r
    .collect 208847,1 -- Skull-Shaped Geode (1)
    .mob Stonesplinter Scout
    .mob Stonesplinter Trogg
    .train 425443,1
step << Warrior
    #season 2
    #sticky
    #label geode2
    #requires Geode
    .goto Loch Modan,33.2,73.8,0,0
    >>攻击|cRXP_ENEMY_碎石怪击颅者|r
    >>|cRXP_WARN_在战斗中它会击中你, 将|cRXP_LOOT_骷髅形晶石|r变成|r|T236489:0|t[|cRXP_LOOT_碎裂的骷髅形晶石|r]
    .collect 208848,1 -- Cracked Skull-Shaped Geode (1)
    .mob Stonesplinter Skullthumper
    .train 425443,1
step << Warrior
    .goto Loch Modan,33.2,73.8,0,0
    #season 2
    #sticky
    #requires geode2
    .use 208848 >>|cRXP_WARN_使用|r|T236489:0|t[|cRXP_LOOT_裂开的骷髅形矿石|r]|cRXP_WARN_来获取|r|T134419:0|t[|cRXP_FRIENDLY_迅击符文|r]
    .collect 208778,1 -- Rune of Quick Strike (1)
    .train 425443,1
step << Mage
    #sticky
    #completewith next
    .goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    .goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    .goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    >>击杀|cRXP_ENEMY_碎石穴居人|r 和|cRXP_ENEMY_碎石怪斥候|r . 击杀后掠夺其掉落的|cRXP_LOOT_穴居人石牙|r
    >>|cRXP_WARN_注意, |cRXP_ENEMY_碎石怪斥候|r 施法|r|T132222:0|t[射击]|cRXP_WARN_(远程施法:造成14-20点伤害)|r
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob Stonesplinter Trogg
    .mob Stonesplinter Scout
step << Mage
    #season 2
    .goto Loch Modan,29.2,81.2,15,0
    .goto Loch Modan,28.8,83.4,15,0
    .goto Loch Modan,30.0,83.8,15,0
    .goto Loch Modan,32.2,87.2,15,0
    .goto Loch Modan,33.8,88.6,15,0
    .goto Loch Modan,36.0,88.0,15,0
    .goto Loch Modan,36.6,81.2,15,0
    .goto Loch Modan,36.6,79.6,15,0
    .train 415936,1
    >>击杀|cRXP_ENEMY_碎石怪先知|r并从其身上搜刮出|cRXP_LOOT_|T134939:0|t[咀嚼过的法术笔记]|r
    .collect 208854,1
    .mob Stonesplinter Seer
step << Mage
    #season 2
    .collect 211779,1 >>你需要从|cRXP_FRIENDLY_试剂商|r处获得一个|T135933:0|t[理解之魅]才能使用该物品
    .train 415936 >>|T134939:0|t[|cRXP_FRIENDLY_咀嚼过的法术笔记|r]可学习 |T236220:0|t[活体炸弹]
    .use 208854
step << Mage
    #season 2
    #optional
    #completewith next
    .train 415936,3
    .engrave 9,400613 >>打开角色面板, 在手套上刻印|T236220:0|t[活体炸弹]
step
#loop
    .goto Loch Modan,34.7,71.6,0
    .goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    .goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    .goto Loch Modan,30.0,72.4,50,0
    .goto Loch Modan,34.7,71.6,50,0
    .goto Loch Modan,30.9,81.1,50,0
    >>击杀|cRXP_ENEMY_碎石穴居人|r 和|cRXP_ENEMY_碎石怪斥候|r . 击杀后掠夺其掉落的|cRXP_LOOT_穴居人石牙|r
    >>|cRXP_WARN_注意, |cRXP_ENEMY_碎石怪斥候|r 施法|r|T132222:0|t[射击]|cRXP_WARN_(远程施法:造成14-20点伤害)|r
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob Stonesplinter Trogg
    .mob Stonesplinter Scout
step
    #requires geode2 << Warrior
    .goto Loch Modan,23.233,73.675
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碉堡内的拉格弗斯上尉|r交谈
    .turnin 267 >>交任务: |cRXP_FRIENDLY_穴居人的威胁|r
    .target Captain Rugelfuss
step
    .goto Loch Modan,22.071,73.127
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .turnin 224 >>交任务: |cRXP_FRIENDLY_保卫国王的领土|r
    .target Mountaineer Cobbleflint
step << !Human
    #completewith Algaz
    .hs >>炉石传送至塞尔萨玛
    .cooldown item,6948,>0
    .subzoneskip 924,1--valley of kings

step
    #optional
    #completewith Algaz2
    >>击杀|cRXP_ENEMY_老黑熊|r. 击杀后搜刮其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后从它们身上搜刮|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r. 击败它们后搜刮出|cRXP_LOOT_蜘蛛的毒液|r
    >>保存你找到的任何 |cRXP_LOOT_香脆蜘蛛肉|r, 留着以后做任务用
    .collect 1081,5,92,1
    .disablecheckbox
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +Mountain Boar
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +Elder Black Bear
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +Forest Lurker
    >>|cRXP_WARN_保存任何|r|T133970:0|t|cRXP_LOOT_[野猪肉块]|r|cRXP_WARN_用于升级 |T133971:0|t[烹饪]|cRXP_WARN_稍后使用|r
    >>|cRXP_WARN_现在不必特意去完成这个任务. 你很快就会回到洛克莫丹|r
    .isOnQuest 418
    .subzoneskip 925 --Algaz Station
step
    #optional
    #label Algaz
    #completewith Stormpike1
    .goto 1432,23.490,18.008
    .subzone 925 >>前往阿尔加兹车站
step
    #optional
    #requires Algaz
    #completewith Stormpike1
    .goto 1432,23.490,18.008,15,0
    .goto 1432,24.279,17.959,12 >>进入掩体. 前往顶层
step
    #label Stormpike1
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_掩体内的巡山人卡尔·雷矛|r交谈
    .turnin -353 >>交任务: |cRXP_FRIENDLY_雷矛的包裹|r
    .turnin 1339 >>交任务: |cRXP_FRIENDLY_巡山人卡尔·雷矛的任务|r
    .accept 1338 >>接任务: |cRXP_LOOT_卡尔·雷矛的订单|r
    .accept 307 >>接任务: |cRXP_LOOT_肮脏的爪子|r
    .target Mountaineer Stormpike
step
    #label Algaz2
    #completewith next
    .goto Loch Modan,35.50,18.97,20 >>进入银溪矿井
step
    .goto Loch Modan,35.93,22.55
    >>打开|cRXP_PICK_矿工联盟的储物箱|r. 搜刮其中的|cRXP_LOOT_矿工联盟装备|r
    >>|cRXP_WARN_|cRXP_PICK_矿工联盟的储物箱|r 可在矿井各处找到|r
    >>击杀|cRXP_ENEMY_Tunnel Rats|r. 击杀后搜刮其|cRXP_LOOT_Ears|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .disablecheckbox
    .complete 307,1 -- Miners' Gear (4)
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Vermin
    .mob Tunnel Rat Forager
    .mob Tunnel Rat Geomancer
    .mob Tunnel Rat Digger
    .mob Tunnel Rat Surveyor
step
    #optional
    #completewith RatEar
    >>击杀|cRXP_ENEMY_老黑熊|r. 击杀后搜刮其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后从它们身上搜刮|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r. 掠夺他们的|cRXP_LOOT_脓液|r
    >>保存你找到的任何 |cRXP_LOOT_香脆蜘蛛肉|r, 留着以后做任务用
    .collect 1081,5,92,1
    .disablecheckbox
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +Mountain Boar
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +Elder Black Bear
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +Forest Lurker
step
    .goto Loch Modan,24.77,18.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 307 >>交任务: |cRXP_FRIENDLY_肮脏的爪子|r
    .target Mountaineer Stormpike
step << Mage
    #season 2
    #sticky
    #completewith next
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    .goto Loch Modan,37.71,16.84,0
    .goto Loch Modan,35.48,16.82,0
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    >>击杀|cRXP_ENEMY_Tunnel Rats|r. 击杀后搜刮其|cRXP_LOOT_Ears|r
    >>|cRXP_ENEMY_隧道鼠|r|cRXP_WARN_可在洛克莫丹各地刷新. 请查看你的世界地图以确定它们的位置|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Vermin
    .mob Tunnel Rat Forager
    .mob Tunnel Rat Geomancer
    .mob Tunnel Rat Digger
    .mob Tunnel Rat Surveyor
step << Mage
    #season 2
    #label Loch1
    .goto Loch Modan,50.7,23.9,200 >>前往洛赫湖北部的岛屿
    .train 401767,1
step << Mage
    #season 2
    #optional
    #completewith next
    .goto 1432,54.33,26.82,5 >>进入岛屿东侧的帐篷
    .train 401767,1
step << Mage
    #season 2
    .goto 1432,54.33,26.82,5,0
    .goto 1432,54.17,27.03
    >>打开里面的|cRXP_PICK_被偷走的书堆|r, 从中获取 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:天基罗妮拉|r]
    .collect 208754,1 --Spell Notes: TENGI RONEERA (1)
    .train 401767,1
step << Mage
    #season 2
    .train 401767 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_ 法术说明:天机龙妮娅|r]|cRXP_WARN_来学习|r|T133815:0|t[雕刻胸甲 - 再生]
    .use 208754
    .itemcount 208754,1 --Spell Notes: TENGI RONEERA (1)
step << Paladin/Warrior
    #label BuyMace
    #optional
    #completewith RatEar
    .goto Loch Modan,42.867,9.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔伦·安德玛|r交谈
    >>|cRXP_BUY_购买|r|T133476:0|t[重型尖刺钉锤]|cRXP_BUY_(如果可用)|r
    >>|cRXP_WARN_不要购买|r|T133053:0|t[铁木槌] |cRXP_WARN_如果|r|T133476:0|t[重型尖刺钉锤] |cRXP_WARN_不存在. 你很快会在暴风城获得更好的武器|r
    >>|cRXP_WARN_如果你买不起这个, 但差距不大, 那就去附近的|r|cRXP_ENEMY_隧道老鼠|r|刷钱, 直到凑够足够的金额|r
    >>|cRXP_WARN_请尽快完成此操作, 因为其他玩家可能会先于你购买|r
    >>|cRXP_WARN_如果你不想这样做, 请跳过此步骤|r
    .collect 4778,1,307,1 --Heavy Spiked Mace (1)
    .target Nillen Andemar
    .itemcount 4778,<1 --Heavy Spiked Mace (<1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step
    #label RatEar
    .goto Loch Modan,25.05,30.19,0
    .goto Loch Modan,26.06,43.44,0
    .goto Loch Modan,37.71,16.84,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82,50,0
    .goto Loch Modan,25.05,30.19,50,0
    .goto Loch Modan,26.06,43.44,50,0
    .goto Loch Modan,37.71,16.84,50,0
    .goto Loch Modan,35.48,16.82
    >>击杀|cRXP_ENEMY_Tunnel Rats|r. 击杀后搜刮其|cRXP_LOOT_Ears|r
    >>|cRXP_ENEMY_隧道鼠|r|cRXP_WARN_可在洛克莫丹各地刷新. 请查看你的世界地图以确定它们的位置|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Vermin
    .mob Tunnel Rat Forager
    .mob Tunnel Rat Geomancer
    .mob Tunnel Rat Digger
    .mob Tunnel Rat Surveyor
step
    >>击杀|cRXP_ENEMY_老黑熊|r. 击杀后搜刮其掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_山猪|r. 击杀后从它们身上搜刮|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r. 掠夺他们的|cRXP_LOOT_脓液|r
    .collect 3173,3,418,1 --Bear Meat (3)
    .mob +Elder Black Bear
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
    .mob +Mountain Boar
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
    .mob +Forest Lurker
step
    #season 2
    .xp 16-4650
step
    #completewith next
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
step
    #label ratcatching
    #sticky
    #loop
    .line Loch Modan,36.72,41.97,37.24,43.19,37.33,45.63,36.77,46.20,35.19,46.88,32.67,49.71,35.19,46.88,36.77,46.20,37.33,45.63,37.24,43.19,36.72,41.97
    .waypoint Loch Modan,36.72,41.97,15,0
    .waypoint Loch Modan,37.24,43.19,15,0
    .waypoint Loch Modan,37.33,45.63,15,0
    .waypoint Loch Modan,36.77,46.20,15,0
    .waypoint Loch Modan,35.19,46.88,15,0
    .waypoint Loch Modan,32.67,49.71,20,0
    .waypoint Loch Modan,36.77,46.20,15,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_在塞尔萨玛的道路上巡逻|r
    .target Mountaineer Kadrell
    .turnin 416 >>交任务: |cRXP_FRIENDLY_狗头人的耳朵|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .target Vidra Hearthstove
    .goto Loch Modan,34.828,49.283
    .turnin 418 >>交任务: |cRXP_FRIENDLY_塞尔萨玛血肠|r
step << Human
    .hs >>炉石传送至暴风城
step << !Human
    #requires ratcatching
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆|r交谈
    .fly Ironforge >>飞往铁炉堡
    .target Thorgrum Borrelson
step << Warrior/Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷格努斯·雷石|r交谈 << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比尔班·飞钳|r交谈 << Warrior
    .goto Ironforge,69.872,82.890 << Hunter
    .goto Ironforge,65.905,88.405 << Warrior
    .trainer >>训练你的职业法术
    .target Regnus Thundergranite << Hunter
    .target Bilban Tosslespanner << Warrior
step << Warrior !Human
    #season 2
    #optional
    #completewith next
    .goto Ironforge,71.54,73.46,10,0
    .goto Ironforge,72.53,76.94,10 >>前往旅店内部, 找到|cRXP_FRIENDLY_布鲁克·麦须|r
    .train 425447,1
step << Warrior !Human
    #season 2
    .goto Ironforge,72.53,76.94
    .gossipoption 110791 >>与|cRXP_FRIENDLY_布鲁克·麦须|r对话, 他在里面
    .target Bruuk Barleybeard
    .skipgossip 5570,1,1
    .train 425447,1
--XX 110793 "How's business?"
--XX 110791 "Sounds like you need someone to bounce him for you."
step << Warrior !Human
    #season 2
    .goto Ironforge,72.40,73.63
    .gossipoption 109084 >>与|cRXP_FRIENDLY_Bruart|r谈话以开启战斗
    >>击败|cRXP_ENEMY_Bruart|r
    >>|cRXP_WARN_小心, 他正在施放|r|T132939:0|t[反手击]|cRXP_WARN_(使你眩晕2秒)|r
    >>|cRXP_WARN_把他风筝到楼上的阳台上, 然后跳到旅店外并使用|r|T133688:0|t[绷带]|cRXP_WARN_(如果你有且需要的话)|r
    .mob Bruart
    .skipgossip 209004,1
    .train 425447,1
--XX 109084 "Seems you've had a few too many"
--XX Check if another player can skip the "how's business" dialogue for you (paladin, warrior)
step << Warrior !Human
    #season 2
    #optional
    .goto Ironforge,72.40,73.63,-1
    .goto Ironforge,72.53,76.94,-1
    >>击败|cRXP_ENEMY_Bruart|r
    >>|cRXP_WARN_小心, 他正在施放|r|T132939:0|t[反手击]|cRXP_WARN_(使你眩晕2秒)|r
    >>|cRXP_WARN_把他风筝到楼上的阳台上, 然后跳到旅店外并使用|r|T133688:0|t[绷带]|cRXP_WARN_(如果你有且需要的话)|r
    >>|cRXP_WARN_击败布鲁亚特后:|r
    >>与|cRXP_FRIENDLY_布鲁克·麦须|r再次对话, 以获得|T134419:0|t[狂怒冲锋符文]
    >>|cRXP_WARN_如果他不给你|r|T134419:0|t[狂暴突袭符文]|cRXP_WARN_, 你可能需要再次与|cRXP_ENEMY_Bruart|r战斗|r
    >>|cRXP_WARN_注意:此任务 solo 可能较困难, 建议寻求帮助；若不想现在完成, 可稍后在指南中再次尝试|r
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target Bruuk Barleybeard
    .skipgossip 5570,2,1
    .skipgossip 209004,1
    .train 425447,1
--XX 109539 "I've taken care of Stuart. He shouldn't be a problem anymore."
step << Warrior !Human
    #season 2
    .train 425447 >>|cRXP_WARN_使用|r|T134419:0|t[狂暴突袭符文]|cRXP_WARN_来学习|r|T134596:0|t[雕刻裤 - 狂暴突袭]
    .use 204716
    .itemcount 204716,1 --Rune of Frenzied Assault (1)
step << Warrior !Human
    #season 2
    #completewith DRT
    .engrave 7 >>|cRXP_WARN_刻印你的|r|T134596:0|t|cRXP_LOOT_[裤子]|r|cRXP_WARN_带有|r|T134596:0|t[刻印裤子 - 狂暴突击]
    .train 425447,3
step << !Human
    .goto Ironforge,78.00,51.40
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .isQuestTurnedIn 6662
step << !Human
    .goto Ironforge,78.00,51.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡一侧的|r蒙提|c交谈, 然后与暴风城一侧的|r尼普希|c交谈
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .accept 6662 >>接任务: |cRXP_WARN_我的兄弟，尼普希|r,，然后乘坐地铁前往
    .turnin 6662 >>交任务: |cRXP_FRIENDLY_我的兄弟，尼普希|r
    .isQuestAvailable 6662
    .target Monty
    .target Nipsy
]])
