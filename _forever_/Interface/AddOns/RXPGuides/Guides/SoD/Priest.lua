RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Penance - 3 (Elwynn Forest)
#title 苦修
#displayname 苦修 - 3（艾尔文森林）
step << Priest
    #season 2
    .goto Elwynn Forest,48.61,27.63
    >>击杀|cRXP_ENEMY_狗头人苦力|r，拾取|T136222:0|t[|cRXP_FRIENDLY_忧虑助祭的回忆|r]
    .collect 205951,1 -- Memory of a Troubled Acolyte (1)
    .mob 狗头人苦力
    .train 402862,1
step << Priest
    #season 2
    .goto Elwynn Forest,49.808,39.489
    >>|cRXP_WARN_在北郡修道院内时，在聊天框中输入 /kneel|r
    >>|cRXP_WARN_你将获得|r |T135934:0|t[圣光之思] |cRXP_WARN_增益|r
    .cast 410958 >> |cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_忧虑助祭的回忆|r] |cRXP_WARN_时，必须拥有|r |T135934:0|t[圣光之思] |cRXP_WARN_增益|r
    .use 205951
    .itemcount 205951,1
    .train 402862,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Penance - 1 (Dun Morogh)
#title 苦修
#displayname 苦修 - 1（丹莫罗）
step << Priest
    #season 2
    .goto Dun Morogh,26.733,72.552
    >>打开地上的|cRXP_PICK_石颚储物箱|r，拾取其中的|T136222:0|t|cRXP_LOOT_[忧虑助祭的回忆]|r
    .collect 205951,1 -- Memory of a Troubled Acolyte (1)
    .train 402862,1
step << Priest
    #season 2
    .goto 1426,28.922,66.378
    .aura 410935 >>|cRXP_WARN_选中里面的 |r|cRXP_FRIENDLY_圣光祭坛|r以获得 |T135934:0|t[圣光之思] |cRXP_WARN_增益|r
    >>|cRXP_WARN_若未生效，选中 |r|cRXP_FRIENDLY_圣光祭坛|r后在聊天框输入 /kneel
    .target 圣光祭坛
    .emote KNEEL,208565
    .train 402862,1
step << Priest
    #season 2
    .train 402862 >> |cRXP_WARN_使用|r |T136222:0|t|cRXP_LOOT_[忧虑助祭的回忆]|r |cRXP_WARN_来学习|r |T133816:0|t[铭刻手套 - 苦修]
    .aura -410935
    .use 205951
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< NightElf Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Penance - 2 (Shadowglen)
#title 苦修
#displayname 苦修 - 2（幽影谷）
step << NightElf Priest
    #season 2
    .goto Teldrassil,59.92,41.74,20,0
    .goto Teldrassil,59.174,40.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_珊达|r交谈
    .accept 77574 >> 接任务：艾露恩之思
    .target 珊达
    .train 402862,1
step << NightElf Priest
    #season 2
    #completewith next
    .isOnQuest 77574
    .goto Teldrassil,59.940,33.052,10 >> 前往幽影谷的月亮井
    .train 402862,1
step << NightElf Priest
    #season 2
    .isOnQuest 77574
    .goto Teldrassil,59.940,33.052
    .aura 419307 >>|cRXP_WARN_到达月亮井后在聊天框输入 /kneel|r
    >>|cRXP_WARN_你将获得|r |T136057:0|t[艾露恩之思] |cRXP_WARN_增益|r
    .train 402862,1
step << NightElf Priest
    #season 2
    #label PenanceRune
    .isOnQuest 77574
    .use 205951 >> |cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_忧虑助祭的回忆|r] |cRXP_WARN_，需拥有|r |T136057:0|t[艾露恩之思] |cRXP_WARN_增益|r
    .complete 77574,1 -- Learn: Engrave Gloves - Penance
    .train 402862,1
step << NightElf Priest
    #season 2
    .goto Teldrassil,59.92,41.74,20,0
    .goto Teldrassil,59.174,40.442
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_珊达|r交谈
    .turnin 77574 >> 交任务：艾露恩之思
    .target 珊达
    .train 402862,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Troll Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Penance - 2 (Durotar)
#title 苦修
    --Rune of Penance
#displayname 苦修 - 2（杜隆塔尔）
step << Priest
    #season 2
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .accept 77642 >>接受任务 洛阿的智慧
    .target 肯杰
step << Priest
    #season 2
    .goto Durotar,55.41,72.84
    >>前往森金村的|cRXP_PICK_洛阿祭坛|r，输入/kneel跪下
    .use 205951 >>|cRXP_FRIENDLY_毒蛇洛阿神灵|r出现后与其交谈，然后使用|T136222:0|t[|cRXP_FRIENDLY_忧虑助祭的回忆|r]
    .complete 77642,1 --Learn Spell: Engrave Gloves - Penance
    .target 毒蛇洛阿神灵
    .skipgossip
step << Priest
    #season 2
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .turnin 77642 >>交任务：洛阿的智慧
    .target 肯杰
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Undead Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Penance - 2 (Tirisfal)
#title 苦修
    --Rune of Penance
#displayname 苦修 - 2（提瑞斯法林地）
step << Priest
    #season 2
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜斯滕|r交谈
    .accept 77670 >>接受任务 亡灵之思
    .target 黑暗牧师杜斯滕
step << Priest
    #season 2
    .goto Tirisfal Glades,31.06,64.80
    >>进入墓地，在聊天框输入/kneel
    .use 205951 >>使用|T136222:0|t[|cRXP_FRIENDLY_忧虑助祭的回忆|r]，需要先获得|T237569:0|t[亡灵之思]增益
    .complete 77670,1 >>学习法术：铭刻手套 - 苦修
step << Priest
    #season 2
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜斯滕|r交谈
    .turnin 77670 >>交任务：亡灵之思
    .target 黑暗牧师杜斯滕
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Homunculi - 8 (Durotar)
#title 裂魂魔
#displayname 裂魂魔 - 8（杜隆塔尔）
step
    .train 402852,1
    #completewith next
    .zone Durotar >>前往杜隆塔尔
step
    .train 402852,1
    .goto Durotar,55.32,72.66
    .emote KNEEL,208309
    .aura 417316 >>在 |cRXP_PICK_洛阿神灵祭坛|r 前输入 /kneel，并与 |cRXP_FRIENDLY_毒蛇洛阿神灵|r 交谈
    .skipgossip 208307,1
    .target 毒蛇洛阿神灵
step
    .train 402852,1
    >>击杀|cRXP_ENEMY_巫毒巨魔|r，拾取|T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]
    .goto Durotar,67.6,86.4
    .collect 205947,1
    .mob 巫毒巨魔
step << Troll
    .train 402852,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>在 |cRXP_PICK_洛阿神灵祭坛|r 前跪下并与 |cRXP_FRIENDLY_毒蛇洛阿神灵|r 对话以获得 |T136077:0|t[洛阿神灵之思] 增益
step << Troll
    .train 402852,1
    .aura 418459 >>|cRXP_WARN_现在需要找到一名拥有[亡灵之思]增益的亡灵牧师。你必须在他面前跪下，他必须对你输入/pray。|r
step << Undead
    .train 402852,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>在|cRXP_PICK_洛阿神灵祭坛|r前跪下，并与|cRXP_FRIENDLY_毒蛇洛阿神灵|r交谈，获得|T136077:0|t[洛阿神灵之思]增益
step << Undead
    .train 402852,1
    .goto Durotar,57.15,73.36
    .aura 418459 >>|cRXP_WARN_在森金村墓地跪下|r，获得|T237569:0|t[亡灵之思]增益
step
    .use 205947
    .itemcount 205947,1
    .train 402852 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] |cRXP_WARN_学习|r |T237570:0|t[裂魂魔]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Homunculi - 7 (Tirisfal Glades)
#title 裂魂魔
#displayname 裂魂魔 - 7（提瑞斯法林地）
step
    .train 402852,1
    #completewith next
    .zone Tirisfal Glades >>前往提瑞斯法林地
step
    .train 402852,1
    >>击杀|cRXP_ENEMY_血色战士|r或|cRXP_ENEMY_血色传教士|r，拾取其掉落的|T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]
    .goto Tirisfal Glades,50.6,67.8,0
    .goto Tirisfal Glades,32.6,48.6
    .collect 205947,1
    .mob 血色战士
    .mob 血色传教士
step << Troll
    .train 402852,1
    .aura 418459 >>|cRXP_WARN_现在需要找到一名拥有|T237569:0|t[亡灵之思]增益的亡灵牧师；在其面前输入 /kneel，并请他以你为目标输入 /pray，分享该增益|r
step << Troll
    #completewith next
    .zone Durotar >>前往杜隆塔尔 (乘坐飞艇前往奥格瑞玛)
step << Troll
    .train 402852,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>在 |cRXP_PICK_洛阿神灵祭坛|r 前跪下并与 |cRXP_FRIENDLY_毒蛇洛阿神灵|r 对话以获得 |T136077:0|t[洛阿神灵之思] 增益
step << Undead
    #completewith next
    .zone Durotar >>前往杜隆塔尔 (乘坐飞艇前往奥格瑞玛)
step << Undead
    .train 402852,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>在|cRXP_PICK_洛阿神灵祭坛|r前跪下，并与|cRXP_FRIENDLY_毒蛇洛阿神灵|r交谈，获得|T136077:0|t[洛阿神灵之思]增益
    *|cRXP_WARN_也可以寻找拥有|T136077:0|t[洛阿神灵之思]增益的巨魔牧师。在他面前跪下，并请他对你使用 /pray|r。
step << Undead
    .train 402852,1
    .goto Durotar,57.15,73.36
    .aura 418459 >>|cRXP_WARN_在森金村墓地跪下|r，获得|T237569:0|t[亡灵之思]增益
step
    .use 205947
    .itemcount 205947,1
    .train 402852 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] |cRXP_WARN_学习|r |T237570:0|t[裂魂魔]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Shared Pain - 13 (Durotar)
#title 分担痛苦
#displayname 分担痛苦 - 13（杜隆塔尔）
step
    #completewith next
    .zone Durotar >>前往杜隆塔尔
step
    .train 402854,1
    >>击杀|cRXP_ENEMY_马卡斯加|r或洞穴中的|cRXP_ENEMY_加祖兹|r，选择离你较近的一个（导航点会指向较近的目标）。拾取|T136222:0|t[|cRXP_FRIENDLY_落难救世主的回忆|r]
    .goto Durotar,52.6,8.8,-1
    .goto Durotar,62.0,66.2,-1
    .collect 205945,1
    .mob 马卡斯加
    .mob 加祖兹
step
    .train 402854,1
    .goto Durotar,55.32,72.66
    .emote KNEEL,208309
    .aura 417316 >>在 |cRXP_PICK_洛阿神灵祭坛|r 前跪下并与 |cRXP_FRIENDLY_毒蛇洛阿神灵|r 对话以获得 |T136077:0|t[洛阿神灵之思] 增益
    .skipgossip 208307,1
    .target 毒蛇洛阿神灵
step
    .use 205945
    .itemcount 205945,1
    .train 402854 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_落难救世主的回忆|r] |cRXP_WARN_学习|r |T136160:0|t[分担痛苦]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Shared Pain - 6 (Tirisfal Glades)
#title 分担痛苦
#displayname 分担痛苦 - 6（提瑞斯法林地）
step
    #completewith next
    .zone Tirisfal Glades >>前往提瑞斯法林地
step
    .train 402854,1
    >>击杀|cRXP_ENEMY_提瑞斯法农夫|r，并从他们身上拾取|T136222:0|t[|cRXP_FRIENDLY_落难救世主的回忆|r]
    .goto Tirisfal Glades,36.2,50.4
    .collect 205945,1
    .mob 提瑞斯法农夫
step << Undead
    .train 402854,1
    .goto Tirisfal Glades,56.39,49.39
    .aura 418459 >>在墓地跪下，直到获得 |T237569:0|t[亡灵之思] 增益
step << Troll
    #completewith SharedPainTirisfalA
    .zone Durotar >>前往杜隆塔尔 (乘坐飞艇前往奥格瑞玛)
step << Troll
    #label SharedPainTirisfalA
    .train 402854,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .aura 417316 >>在 |cRXP_PICK_洛阿神灵祭坛|r 前跪下并与 |cRXP_FRIENDLY_毒蛇洛阿神灵|r 对话以获得 |T136077:0|t[洛阿神灵之思] 增益
    .aura -418459
    >>|cRXP_WARN_也可以找一名拥有|T237569:0|t[亡灵之思]增益的亡灵牧师；在其面前输入 /kneel，并请他以你为目标输入 /pray，分享该增益|r
    .skipgossip 208307,1
step
    .use 205945
    .itemcount 205945,1
    .train 402854 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_落难救世主的回忆|r] |cRXP_WARN_学习|r |T136160:0|t[分担痛苦]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Boots
#subgroupdisplayname 靴子
#name Void Plague - 5 (Durotar)
#title 虚空疫病
#displayname 虚空疫病 - 5（杜隆塔尔）
step
    #completewith next
    .zone Durotar >>前往杜隆塔尔
step
    .train 425216,1
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r 和 |cRXP_ENEMY_库尔提拉斯水兵|r，从他们身上拾取 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]
    .goto Durotar,57.6,55.4
    .collect 205940,1
    .mob 库尔提拉斯水手
    .mob 库尔提拉斯水兵
step
    .train 425216,1
    .goto Durotar,55.32,72.66
    .emote KNEEL,208309
    .aura 417316 >>在 |cRXP_PICK_洛阿神灵祭坛|r 前跪下并与 |cRXP_FRIENDLY_毒蛇洛阿神灵|r 对话，以获得 |T136077:0|t[洛阿神灵之思] 增益
    .skipgossip 208307,1
    .target 毒蛇洛阿神灵
step
    .use 205940
    .itemcount 205940,1
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] |cRXP_WARN_学习|r |T237514:0|t[虚空疫病]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Boots
#subgroupdisplayname 靴子
#name Void Plague - 6 (Tirisfal Glades)
#title 虚空疫病
#displayname 虚空疫病 - 6（提瑞斯法林地）
step
    #completewith next
    .zone Tirisfal Glades >>前往提瑞斯法林地
step
    .train 425216,1
    >>击杀|cRXP_ENEMY_吉尔加|r，拾取|T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]
    .goto Tirisfal Glades,25.6,48.2
    .collect 205940,1
    .mob 吉尔加
step << Undead
    .train 425216,1
    .goto Tirisfal Glades,56.39,49.39
    .aura 418459 >>在墓地跪下，直到获得 |T237569:0|t[亡灵之思] 增益
step << Troll
    #completewith next
    .zone Durotar >>前往杜隆塔尔 (乘坐飞艇前往奥格瑞玛)
step << Troll
    .train 425216,1
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .aura 417316 >>在 |cRXP_PICK_洛阿神灵祭坛|r 前跪下并与 |cRXP_FRIENDLY_毒蛇洛阿神灵|r 对话，以获得 |T136077:0|t[洛阿神灵之思] 增益
    .skipgossip 208307,1
step
    .use 205940
    .itemcount 205940,1
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] |cRXP_WARN_学习|r |T237514:0|t[虚空疫病]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Prayer of Mending - 6 (Durotar)
#title 愈合祷言
#displayname 愈合祷言 - 6（杜隆塔尔）
step
    .goto Durotar,48.04,79.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与科卡尔峭壁内的 |cRXP_FRIENDLY_冒险者之魂|r 交谈
    >>|cRXP_WARN_需要另一名玩家（牧师或萨满祭司）点击传送门。之后拾取|r|cRXP_FRIENDLY_冒险者之魂|r|cRXP_WARN_，获得|r|T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r]
    .collect 205944,1 --Reciprocal Epiphany (1)
    .target 冒险者之魂
    .skipgossip
    .train 402848,1
step
    .use 205944
    .itemcount 205944,1
    .train 402848 >>|cRXP_WARN_使用|r|T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r]|cRXP_WARN_学习|r|T135944:0|t[愈合祷言]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Prayer of Mending - 10 (Mulgore)
#title 愈合祷言
#displayname 愈合祷言 - 10（莫高雷）
step
    .goto Mulgore,60.39,33.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与风险投资公司矿洞外的 |cRXP_FRIENDLY_冒险者之魂|r 交谈
    >>|cRXP_WARN_需要另一名玩家（牧师或萨满祭司）点击传送门。之后拾取|r |cRXP_FRIENDLY_冒险者之魂|r |cRXP_WARN_以获得|r |T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r]
    .collect 205944,1 --Reciprocal Epiphany (1)
    .target 冒险者之魂
    .skipgossip
    .train 402848,1
step
    .use 205944
    .itemcount 205944,1
    .train 402848 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r] |cRXP_WARN_学习|r |T135944:0|t[愈合祷言]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Twisted Faith - 10 (Loch Modan)
#title 扭曲信仰
#displayname 扭曲信仰 - 10（洛克莫丹）
step << Priest
    #completewith next
    .goto Loch Modan,35.50,18.97,20 >> 进入银泉矿洞
    .train 425215,1
step << Priest
    .goto Loch Modan,35.6,20.6
    >>击杀 |cRXP_ENEMY_坑道鼠|r，从它们身上拾取 |T237281:0|t[|cRXP_LOOT_供品硬币|r]
    .collect 208823,1 -- Offering Coin (1)
    .mob 坑道鼠斥候
    .mob 坑道鼠地卜师
    .train 425215,1
step << Priest
    .goto Loch Modan,36.689,20.964
    .use 208823 >> |cRXP_WARN_把|r |T237281:0|t[|cRXP_LOOT_供品硬币|r] |cRXP_WARN_带到银泉矿洞内的水井|r |cRXP_WARN_并使用，取得|r |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r]
    .collect 205905,1 -- Memory of a Devout Champion (1)
    .train 425215,1
step << Priest
    .train 425215 >> |cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r] |cRXP_WARN_学习|r |T237566:0|t[扭曲信仰]
    >>|cRXP_WARN_学习回忆前需先获得一种|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益：暗夜精灵在月亮井旁输入 /kneel；人类或矮人在北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛、铁炉堡秘法区等圣光圣地输入 /kneel。也可请已有增益的牧师传授|r
    .use 205905
    .itemcount 205905,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Twisted Faith - 14 (Westfall)
#title 扭曲信仰
#displayname 扭曲信仰 - 14（西部荒野）
step << Priest
    .goto Westfall,32.6,43.2,60,0
    .goto Westfall,29.8,46.6,60,0
    .goto Westfall,45.0,26.0,60,0
    .goto Westfall,45.6,21.2
    >>击杀 |cRXP_ENEMY_不死的劳工|r，拾取 |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r]
    >>|cRXP_WARN_必须用神圣法术造成最后一击，才能击杀|r |cRXP_ENEMY_不死的劳工|r
    >>|cRXP_WARN_|r|cRXP_ENEMY_不死的劳工|r可能在金海岸矿洞和詹戈洛德矿洞出现
    .collect 205905,1 -- Memory of a Devout Champion (1)
    .unitscan 不死的劳工
    .train 425215,1
step << Priest
    .train 425215 >> |cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r] |cRXP_WARN_学习|r |T237566:0|t[扭曲信仰]
    >>|cRXP_WARN_学习回忆前需先获得一种|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益：暗夜精灵在月亮井旁输入 /kneel；人类或矮人在北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛、铁炉堡秘法区等圣光圣地输入 /kneel。也可请已有增益的牧师传授|r
    .use 205905
    .itemcount 205905,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Twisted Faith - 18 (Darkshore)
#title 扭曲信仰
#displayname 扭曲信仰 - 18（黑海岸）
step << Priest
    .goto Darkshore,59.2,23.4,60,0
    .goto Darkshore,60.0,15.4
    >>击杀|cRXP_ENEMY_雷鳞侍从|r、|cRXP_ENEMY_雷鳞战士|r和|cRXP_ENEMY_雷鳞巫师|r，拾取|T236364:0|t[|cRXP_LOOT_碎矛供品|r]
    .collect 211482,1 -- Shatterspear Offering (1)
    .mob 雷鳞侍从
    .mob 雷鳞战士
    .mob 雷鳞巫师
    .train 425215,1
step << Priest
    .goto Darkshore,59.2,22.6
    .use 211482 >> |cRXP_WARN_在水下的碎矛神像处使用|r |T236364:0|t[|cRXP_LOOT_碎矛供品|r] |cRXP_WARN_，即可获得|r |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r]
    .collect 205905,1 -- Memory of a Devout Champion (1)
    .train 425215,1
step << Priest
    .train 425215 >> |cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r] |cRXP_WARN_学习|r |T237566:0|t[扭曲信仰]
    >>|cRXP_WARN_学习回忆前需先获得一种|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益：暗夜精灵在月亮井旁输入 /kneel；人类或矮人在北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛、铁炉堡秘法区等圣光圣地输入 /kneel。也可请已有增益的牧师传授|r
    .use 205905
    .itemcount 205905,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Shared Pain - 10 (Dun Morogh)
#title 分担痛苦
#displayname 分担痛苦 - 10（丹莫罗）
step << Priest
    .goto Dun Morogh,77.894,62.236
    >>击杀建筑内楼下的|cRXP_ENEMY_贝尔德队长|r，拾取|T136222:0|t[|cRXP_FRIENDLY_落难救世主的回忆|r]。
    .collect 205945,1 -- Memory of an Imprisoned Savior (1)
    .mob 贝尔德队长
    .train 402854,1
step << Priest
    .train 402854 >> |cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_落难救世主的回忆|r] |cRXP_WARN_学习|r |T136160:0|t[分担痛苦]
    >>|cRXP_WARN_学习回忆前需先获得一种|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益：暗夜精灵在月亮井旁输入 /kneel；人类或矮人在北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛、铁炉堡秘法区等圣光圣地输入 /kneel。也可请已有增益的牧师传授|r
    .use 205945
    .itemcount 205945,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Shared Pain - 6 (Elwynn Forest)
#title 分担痛苦
#displayname 分担痛苦 - 6（艾尔文森林）
step << Priest
    .goto Elwynn Forest,40.6,81.8
    >>击杀|cRXP_ENEMY_狗头人矿工|r，拾取他们掉落的|T136222:0|t[|cRXP_FRIENDLY_落难救世主的回忆|r]
    .collect 205945,1 -- Memory of an Imprisoned Savior (1)
    .mob 狗头人矿工
    .train 402854,1
step << Priest
    .train 402854 >> |cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_落难救世主的回忆|r] |cRXP_WARN_学习|r |T136160:0|t[分担痛苦]
    >>|cRXP_WARN_学习回忆前需先获得一种|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益：暗夜精灵在月亮井旁输入 /kneel；人类或矮人在北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛、铁炉堡秘法区等圣光圣地输入 /kneel。也可请已有增益的牧师传授|r
    .use 205945
    .itemcount 205945,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Homunculi - 8 (Dun Morogh)
#title 裂魂魔
#displayname 裂魂魔 - 8（丹莫罗）
step << Priest
    .goto Dun Morogh,42.0,44.6,50,0
    .goto Dun Morogh,42.4,35.8
    >>击杀|cRXP_ENEMY_霜鬃先知|r，拾取|T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob 霜鬃先知
    .train 402852,1
step << Priest
    .train 402852 >> |cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] |cRXP_WARN_学习|r |T237570:0|t[裂魂魔]
    >>|cRXP_WARN_你必须同时拥有2种|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益：先在本族的神圣场所输入 /kneel（暗夜精灵在月亮井旁，人类或矮人在圣光圣地），再在拥有另一种增益的牧师面前输入 /kneel，请其以你为目标输入 /pray|r
    .use 205947
    .itemcount 205947,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Homunculi - 8 (Elwynn Forest)
#title 裂魂魔
#displayname 裂魂魔 - 8（艾尔文森林）
step << Priest
    .goto Elwynn Forest,74.0,51.8
    >>击杀|cRXP_ENEMY_迪菲亚流浪巫师|r，拾取|T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob 迪菲亚流浪巫师
    .train 402852,1
step << Priest
    .train 402852 >> |cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]，|cRXP_WARN_学习|r |T237570:0|t[裂魂魔]
    >>先在月亮井、北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛，或铁炉堡秘法区输入/kneel，获得一种冥想增益。
    >>再在一名拥有另一种冥想增益的牧师面前输入/kneel，并让对方以你为目标输入/pray，获得第二种增益。
    .use 205947
    .itemcount 205947,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Homunculi - 8 (Teldrassil)
#title 裂魂魔
#displayname 裂魂魔 - 8（泰达希尔）
step << Priest
    #completewith next
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >> 前往地狱石
    .train 402852,1
step << Priest
    .goto Teldrassil,53.60,50.00
    >>击杀|cRXP_ENEMY_邪恶劣魔|r、|cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_影魂劣魔|r，拾取|T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob 邪恶劣魔
    .mob 恶灵劣魔
    .mob 影魂劣魔
    .train 402852,1
step << Priest
    .train 402852 >> |cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]，|cRXP_WARN_学习|r |T237570:0|t[裂魂魔]
    >>先在月亮井、北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛，或铁炉堡秘法区输入/kneel，获得一种冥想增益。
    >>再在一名拥有另一种冥想增益的牧师面前输入/kneel，并让对方以你为目标输入/pray，获得第二种增益。
    .use 205947
    .itemcount 205947,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Prayer of Mending - 6 (Elwynn Forest)
#title 愈合祷言
#displayname 愈合祷言 - 6（艾尔文森林）
step << Priest
    .goto Elwynn Forest,52.28,84.56
    >>|cRXP_WARN_与站在|r|cRXP_FRIENDLY_冒险者的残骸|r旁的另一名牧师或圣骑士组队，或在综合频道（聊天框输入/1）中寻求圣骑士或牧师的帮助
    >>|cRXP_WARN_与地上的 |r|cRXP_FRIENDLY_冒险者的残骸|r 互动以开始仪式；也可点击其他玩家的 |T136223:0|t[灵魂仪式] |cRXP_WARN_（须在同一队伍中）|r
    >>|cRXP_WARN_仪式完成后，|r|cRXP_FRIENDLY_冒险者之灵|r会出现并死亡，拾取其掉落的 |T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r]
    .train 402848 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r] |cRXP_WARN_学习|r |T135944:0|t[愈合祷言]
    .use 205942
    .use 205944
    .skipgossip
    .target 冒险者的残骸
    .target 冒险者之灵
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Prayer of Mending - 8 (Teldrassil)
#title 愈合祷言
#displayname 愈合祷言 - 8（泰达希尔）
step << Priest
    .goto Teldrassil,33.610,35.732
    >>|cRXP_WARN_与站在|r|cRXP_FRIENDLY_冒险者的残骸|r旁的另一名牧师或德鲁伊组队，或在综合频道向德鲁伊或牧师求助（在聊天框输入 /1）
    >>|cRXP_WARN_与地上的 |r|cRXP_FRIENDLY_冒险者的残骸|r 交谈以开始仪式，或点击其他玩家的 |T136223:0|t[灵魂仪式] |cRXP_WARN_（须与其组队）|r
    >>|cRXP_WARN_仪式完成后，一个|r|cRXP_FRIENDLY_冒险者之魂|r会出现并死亡。拾取它获得 |T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r]
    .train 402848 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r] |cRXP_WARN_学习|r |T135944:0|t[愈合祷言]
    .use 205942
    .use 205944
    .skipgossip
    .target 冒险者的残骸
    .target 冒险者之魂
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Prayer of Mending - 6 (Dun Morogh)
#title 愈合祷言
#displayname 愈合祷言 - 6（丹莫罗）
step << Priest
    .goto Dun Morogh,43.0,49.6
    >>|cRXP_WARN_与另一名牧师或圣骑士组队，站在|r|cRXP_FRIENDLY_冒险者的残骸|r旁；也可在综合频道寻求圣骑士或牧师的帮助（在聊天框输入/1）
    >>|cRXP_WARN_与地上的|r|cRXP_FRIENDLY_冒险者的残骸|r交谈以开始仪式，或点击另一名玩家的 |T136223:0|t[灵魂仪式] |cRXP_WARN_（需与其组队）|r
    >>|cRXP_WARN_仪式完成后，一个|r|cRXP_FRIENDLY_冒险者之魂|r会出现并死亡。拾取它获得 |T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r]
    .train 402848 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_互惠顿悟|r] |cRXP_WARN_学习|r |T135944:0|t[愈合祷言]
    .use 205942
    .use 205944
    .skipgossip
    .target 冒险者的残骸
    .target 冒险者之魂
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Shadow Word: Death - 10 (Darkshore)
#title 暗言术：灭
#displayname 暗言术：灭 - 10（黑海岸）
step << Priest
    .goto Darkshore,30.5,47.5
    >>点击小岛上的|cRXP_PICK_遗迹|r，从中拾取|T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言|r]
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .train 402849,1
step << Priest
    >>现在你必须获得两种|T135934:0|t|T136057:0|t[冥想]增益
    >>你必须在以下地点之一使用/kneel跪下：月亮井、北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛，或铁炉堡的秘法区
    >>要获得第二种|T135934:0|t|T136057:0|t[冥想]增益，你需要在一名拥有与你不同的|T135934:0|t|T136057:0|t[冥想]增益的牧师面前使用/kneel跪下；对方必须以你为目标使用/pray祈祷
    .train 402849 >> |cRXP_WARN_获得两种|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_增益后，使用|r|T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言]|r|cRXP_WARN_学习|r|T136149:0|t[暗言术：灭]
    .use 205932
    .itemcount 205932,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Shadow Word - Death - 12 (Loch Modan)
#title 暗言术：灭
#displayname 暗言术：灭 - 12（洛克莫丹）
step << Priest
    #completewith next
    .goto Loch Modan,71.8,27.6
    .subzone 143 >> 前往洛克莫丹的莫格罗什要塞
step << Priest
    #season 2
    .goto Loch Modan,71.8,27.6
    >>选中|cRXP_FRIENDLY_异端神像|r，在其面前输入/kneel跪下。
    .emote KNEEL,209908 >>|cRXP_WARN_若未生效，请选中|r|cRXP_FRIENDLY_异端神像|r，在聊天框输入/kneel
    >>|cRXP_WARN_你将获得|r |T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言|r]
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .target 异端神像
step << Priest
    >>你现在需要获得两种 |T135934:0|t|T136057:0|t[冥想] 增益效果
    >>你必须在以下地点之一输入 /kneel：月亮井、北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛，或铁炉堡的秘法区
    >>要获得第二种 |T135934:0|t|T136057:0|t[冥想] 增益效果，你需要在一名拥有与你不同的 |T135934:0|t|T136057:0|t[冥想] 的牧师面前输入 /kneel，并让对方以你为目标输入 /pray
    .train 402849 >> |cRXP_WARN_获得两种|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益效果后，使用|r |T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言]|r |cRXP_WARN_学习|r |T136149:0|t[暗言术：灭]
    .use 205932
    .itemcount 205932,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Shadow Word: Death - 20 (The Barrens)
#title 暗言术：灭
#displayname 暗言术：灭 - 20（贫瘠之地）
step
    #completewith next
    .zone The Barrens >> 前往贫瘠之地
step
    #loop
    .goto The Barrens,54.8,35.6,40,0
    .goto The Barrens,58.8,37.6,40,0
    >>使用|T135894:0|t[驱散魔法]驱散|cRXP_ENEMY_沙漠魅影|r，拾取|T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言|r]
    *|cRXP_WARN_它是四处巡逻的绿色幽灵。使用 RestedXP 选定目标宏来选中它。|r
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .train 402849,1
    .mob 沙漠魅影
step << Troll
    >>现在需要获得两种|T237569:0|t|T136077:0|t[冥想]增益
    >>在森金村或十字路口的祭坛前输入|cRXP_WARN_/kneel|r 跪下，然后与灵魂交谈|cRXP_WARN_（神龛位置已标在地图上，也可以找有相应增益的牧师将其传给你）|r
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    >>要获得第二种|T237569:0|t|T136077:0|t[冥想]增益，需输入|cRXP_WARN_/kneel|r，跪在拥有|T237569:0|t[亡灵之思]的亡灵牧师面前，让对方选中你并输入 /pray
    .train 402849 >> |cRXP_WARN_获得两种|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_增益后，使用|r|T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言]|r|cRXP_WARN_学习|r|T136149:0|t[暗言术：灭]
    .use 205932
    .itemcount 205932,1
step << Undead
    >>现在需要获得两种|T237569:0|t|T136077:0|t[冥想]增益
    >>在森金村或十字路口的祭坛前输入|cRXP_WARN_/kneel|r 跪下，然后与灵魂交谈
    .emote KNEEL,208309
    .goto The Barrens,51.5,29.5,0
    .goto The Barrens,50.7,32.7,0
    >>要获得第二种|T237569:0|t|T136077:0|t[冥想]增益，在墓地输入|cRXP_WARN_/kneel|r 跪下，即可获得|T237569:0|t[亡灵之思]增益|cRXP_WARN_（神龛和一处墓地已标在地图上，也可以找有相应增益的牧师将其传给你）|r
    .train 402849 >> |cRXP_WARN_获得两种|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_增益后，使用|r|T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言]|r|cRXP_WARN_学习|r|T136149:0|t[暗言术：灭]
    .use 205932
    .itemcount 205932,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Shadow Word: Death - 24 (Silverpine Forest)
#title 暗言术：灭
#displayname 暗言术：灭 - 24（银松森林）
step
    #completewith next
    .zone Silverpine Forest >> 前往银松森林
step
    .goto Silverpine Forest,65.8,23.6
    >>拾取|cRXP_PICK_卷轴|r，位于|cRXP_ENEMY_图勒·鸦爪|r（24级精英）身后，可获得|T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言|r]
    *|cRXP_WARN_卷轴在二楼，组队获取会更容易。|r
    .collect 205932,1 -- Prophecy of a King's Demise (1)
    .train 402849,1
step << Troll
    >>你现在必须获得两种|T237569:0|t|T136077:0|t[冥想]增益
    >>在森金村或十字路口的祭坛前使用|cRXP_WARN_/kneel|r下跪，然后与灵魂交谈|cRXP_WARN_（神龛位置已标记在地图上，你也可以找拥有该增益的牧师，让他们复制给你）|r
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    >>要获得第二种|T237569:0|t|T136077:0|t[冥想]增益，你需要使用|cRXP_WARN_/kneel|r在拥有|T237569:0|t[亡灵之思]的亡灵牧师面前下跪，并让对方选中你使用/pray
    .train 402849 >> |cRXP_WARN_获得两种|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益后，使用|r |T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言]|r |cRXP_WARN_学习|r |T136149:0|t[暗言术：灭]
    .use 205932
    .itemcount 205932,1
step << Undead
    >>你现在必须获得两种|T237569:0|t|T136077:0|t[冥想]增益
    >>在森金村或十字路口的祭坛前使用|cRXP_WARN_/kneel|r下跪，然后与灵魂交谈
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    .goto Silverpine Forest,44.2,42.7,0
    >>要获得第二种|T237569:0|t|T136077:0|t[冥想]增益，请在墓地使用|cRXP_WARN_/kneel|r下跪，获得|T237569:0|t[亡灵之思]增益|cRXP_WARN_（神龛和墓地位置已标记在地图上，你也可以找拥有该增益的牧师，让他们复制给你）|r
    .train 402849 >> |cRXP_WARN_获得两种|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益后，使用|r |T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言]|r |cRXP_WARN_学习|r |T136149:0|t[暗言术：灭]
    .use 205932
    .itemcount 205932,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Twisted Faith - 10 (Silverpine Forest)
#title 扭曲信仰
#displayname 扭曲信仰 - 10（银松森林）
step
    #completewith next
    .zone Silverpine Forest >> 前往银松森林
step
    .train 425215,1
    >>击杀|cRXP_ENEMY_恸哭之灵|r，拾取|T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r]
    .goto Silverpine Forest,57.9,71.5
    .collect 205905,1
    .mob 恸哭之灵
step
    .train 425215 >> |cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r] |cRXP_WARN_学习|r |T237566:0|t[扭曲信仰]
    >>|cRXP_WARN_你必须拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益：输入|r /kneel |cRXP_WARN_在|r|cRXP_PICK_洛阿神龛|r前下跪（杜隆塔尔或贫瘠之地），或跪在另一位拥有该增益的牧师面前，请他对你使用/pray << Troll
    >>|cRXP_WARN_你必须拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益，可输入|r /kneel |cRXP_WARN_在墓地下跪，或跪在另一位拥有该增益的牧师面前，请他对你使用/pray|r << Undead
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    .goto Silverpine Forest,55.6,73.3 << Undead
    .use 205905
    .itemcount 205905,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Twisted Faith - 10 (The Barrens)
#title 扭曲信仰
#displayname 扭曲信仰 - 10（贫瘠之地）
step
    #completewith next
    .zone The Barrens >> 前往贫瘠之地
step
    .train 425215,1
    >>击杀|cRXP_ENEMY_钢鬃野猪人|r，拾取他们掉落的|T236248:0|t[|cRXP_FRIENDLY_援“手”|r]
    .goto The Barrens,54.6,25.6
    .collect 208765,1
    .mob 钢鬃织棘者
    .mob 钢鬃猎手
    .mob 钢鬃寻水者
    .mob 钢鬃防御者
step
    .train 425215,1
    >>|cRXP_WARN_找到可以复活的死亡玩家或宠物（使用|T135955:0|t[复活术]），以获得|r|T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r]
    .collect 205905,1
step
    .train 425215 >> |cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_虔诚勇士的回忆|r]|cRXP_WARN_学习|r|T237566:0|t[扭曲信仰]
    >>|cRXP_WARN_你必须拥有一种|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_增益，在|r /kneel |cRXP_WARN_时面向|r|cRXP_PICK_洛阿神龛|r（位于杜隆塔尔或贫瘠之地）；也可跪在拥有该增益的牧师面前，请他对你输入 /pray 分享增益 << Troll
    >>|cRXP_WARN_你必须拥有一种|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_增益，在墓地输入|r /kneel |cRXP_WARN_即可获得；也可跪在拥有该增益的牧师面前，请他对你输入 /pray 分享增益|r << Undead
    .goto Durotar,55.32,72.66,0
    .goto The Barrens,51.5,29.5,0
    .goto The Barrens,50.7,32.8 << Undead
    .use 205905
    .itemcount 205905,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Boots
#subgroupdisplayname 靴子
#name Void Plague - 6 (Elwynn Forest)
#title 虚空疫病
#displayname 虚空疫病 - 6（艾尔文森林）
step << Priest
    #season 2
    #completewith next
    .goto Elwynn Forest,38.34,81.54,20 >> 进入法戈迪普矿坑
    .train 425216,1
step << Priest
    #season 2
    .goto Elwynn Forest,41.7,78.1
    >>击杀|cRXP_ENEMY_金牙|r，拾取|T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .mob 金牙
    .train 425216,1
step << Priest
    #season 2
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] |cRXP_WARN_学习|r |T237514:0|t[虚空疫病]
    >>|cRXP_WARN_学习回忆前需先获得冥想增益：暗夜精灵在月亮井旁输入 /kneel；人类或矮人在北郡修道院、暴风城大教堂等圣光圣地输入 /kneel。也可请已有增益的牧师传授|r
    .use 205940
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Boots
#subgroupdisplayname 靴子
#name Void Plague - 6 (Dun Morogh)
#title 虚空疫病
#displayname 虚空疫病 - 6（丹莫罗）
step << Priest
    #season 2
    .goto Dun Morogh,27.2,43.0,60,0
    .goto Dun Morogh,24.8,39.3,60,0
    .goto Dun Morogh,25.6,43.4,60,0
    .goto Dun Morogh,24.3,44.0,60,0
    .goto Dun Morogh,25.4,45.4,60,0
    .goto Dun Morogh,25.00,43.50
    >>击杀 |cRXP_ENEMY_麻疯侏儒|r，拾取 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .mob 麻疯侏儒
    .train 425216,1
step << Priest
    #season 2
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] |cRXP_WARN_学习|r |T237514:0|t[虚空疫病]
    >>|cRXP_WARN_学习回忆前需先获得冥想增益：暗夜精灵在月亮井旁输入 /kneel；人类或矮人在北郡修道院、暴风城大教堂等圣光圣地输入 /kneel。也可请已有增益的牧师传授|r
    .use 205940
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Belt
#subgroupdisplayname 腰带
#name Empowered Renew - 27 (Thousand Needles)
#title 恢复增效
-- Empowered Renew
#displayname 恢复增效 - 27（千针石林）
step
    .train 425309,1
    .zone Thousand Needles >>前往|cFFfa9602千针石林|r
step
    .train 425309,1
    .goto Thousand Needles,31.33,37.05,10,0
    .goto Thousand Needles,33.17,35.38,15,0
    .goto Thousand Needles,31.96,31.32,15,0
    .goto Thousand Needles,33.04,27.61,30,0
    .goto Thousand Needles,35.20,31.09,30,0
    .goto Thousand Needles,34.17,38.81
    >>击杀|cRXP_ENEMY_恐怖图腾地卜师|r、|cRXP_ENEMY_恐怖图腾强盗|r、|cRXP_ENEMY_恐怖图腾抢夺者|r和|cRXP_ENEMY_恐怖图腾践踏者|r，拾取|T135975:0|t[|cRXP_LOOT_迅捷天途的预言|r]
    .collect 213140,1
    .mob 恐怖图腾地卜师
    .mob 恐怖图腾强盗
    .mob 恐怖图腾抢夺者
    .mob 恐怖图腾践踏者
step
    .train 425309 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_LOOT_迅捷天途的预言|r] |cRXP_WARN_学习|r |T236254:0|t[恢复增效]
    .use 213140
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Belt
#subgroupdisplayname 腰带
#name Empowered Renew - 33 (Alterac Mountains)
#title 恢复增效
-- Empowered Renew
#displayname 恢复增效 - 33（奥特兰克山脉）
step
    .train 425309,1
    .zone Alterac Mountains >>前往|cFFfa9602奥特兰克山脉|r
step
    .train 425309,1
    #loop
    .goto Alterac Mountains,47.48,58.94,0
    .goto Alterac Mountains,51.73,40.23,70,0
    .goto Alterac Mountains,45.19,33.91,70,0
    .goto Alterac Mountains,51.46,53.84,70,0
    .goto Alterac Mountains,48.54,40.72,70,0
    >>击杀|cRXP_ENEMY_破碎岭食人魔|r和|cRXP_ENEMY_破碎岭蛮兵|r，拾取|T135975:0|t[|cRXP_LOOT_迅捷天途的预言|r]
    .collect 213140,1
    .mob 破碎岭食人魔
    .mob 破碎岭蛮兵
step
    .train 425309 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_LOOT_迅捷天途的预言|r] |cRXP_WARN_学习|r |T236254:0|t[恢复增效]
    .use 213140
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Belt
#subgroupdisplayname 腰带
#name Renewed Hope - 31 (Desolace)
#title 新生希望
-- Renewed Hope
#displayname 新生希望 - 31（凄凉之地）
step
    #optional
    .train 425310,1
    .train 605 >> |cRXP_WARN_你必须先学会|r |T136206:0|t[精神控制] |cRXP_WARN_才能获得|r |T135923:0|t[新生希望] |cRXP_WARN_符文|r
step
    #optional
    .train 425310,1
    .xp 31
    >>|cRXP_WARN_你必须至少达到31级，才能稍后施放|r |T136206:0|t[精神控制] |cRXP_WARN_来控制33级的|r|cRXP_ENEMY_滑刃海潮女祭司|r
step
    .train 425310,1
    #completewith next
    .zone Desolace >>前往|cFFfa9602凄凉之地|r
step
    #loop
    .goto Desolace,35.4,29.6,60,0
    .goto Desolace,33.6,15.0,60,0
    .goto Desolace,40.0,17.4,60,0
    .goto Desolace,38.6,23.6,60,0
    .train 425310,1
    >>击杀|cRXP_ENEMY_滑刃纳迦|r，拾取|T136222:0|t[|cRXP_LOOT_不安的幻象|r]
    .collect 213599,1
    .mob 滑刃纳迦
    .mob 滑刃战士
    .mob 滑刃智者
    .mob 滑刃侍从
    .mob 滑刃海巫
    .mob 滑刃海潮女祭司
step -- step shows for players that are only level 31
    #optional
    #completewith next
    +|cRXP_WARN_注意：你只能施放|r |T136206:0|t[精神控制] |cRXP_WARN_来控制33级的|r|cRXP_ENEMY_滑刃海潮女祭司|r。对34级目标施放会失败
    .xp >32,1
    .xp <31,1
    .train 425310,1
step
    #label MCPriestess
    #loop
    .goto Desolace,38.8,24.0,60,0
    .goto Desolace,34.6,30.0,60,0
    .goto Desolace,34.6,20.2,60,0
    .aura 435117 >> |cRXP_WARN_施放|r |T136206:0|t[精神控制] |cRXP_WARN_来控制一名|r |cRXP_ENEMY_滑刃海潮女祭司|r
    >>|cRXP_WARN_在|r |T136206:0|t[精神控制]|cRXP_WARN_持续期间选中自己，从宠物动作条施放|r |T136077:0|t[深渊之思] |cRXP_WARN_|r
    >>|cRXP_WARN_随后按Escape取消|r |T136206:0|t[精神控制] |cRXP_WARN_并击杀|r |cRXP_ENEMY_滑刃海潮女祭司|r
    .mob 滑刃海潮女祭司
    .train 425310,1
step
    .train 425310 >> |cRXP_WARN_使用|r |T136222:0|t[|cRXP_LOOT_不安的幻象|r] |cRXP_WARN_学习|r |T135923:0|t[新生希望]
    .use 213599
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Boots
#subgroupdisplayname 靴子
#name Dispersion 40 (Stranglethorn Vale)
#title 消散
-- Dispersion
#displayname 消散 40（荆棘谷）
step
    .train 425314,1
    >>|cRXP_WARN_找一名拥有|r |T132299:0|t[敏锐大师] |cRXP_WARN_符文和|r |T338666:0|t[加尼的护符] |cRXP_WARN_饰品的潜行者，用|r |T133644:0|t[搜索] |cRXP_WARN_从荆棘谷任意|r|cRXP_ENEMY_血顶巨魔|r身上取得 |T237446:0|t[神秘的巨魔卷轴]|cRXP_WARN_。随后请法师使用|r |T135933:0|t[理解魔符] |cRXP_WARN_将其解译成 |T134938:0|t[|r|cRXP_LOOT_解译的巨魔卷轴|r]
    >>|cRXP_WARN_也可购买|r |T237446:0|t[神秘的巨魔卷轴] |cRXP_WARN_，从拍卖行购入后请法师解译，或直接购买已经解译好的 |T134938:0|t[|r|cRXP_LOOT_解译的巨魔卷轴|r]
    .use 216880 >>|cRXP_WARN_使用 |T134938:0|t[|r|cRXP_LOOT_解译的巨魔卷轴|r] 开始任务
    >>|cRXP_WARN_也可以请一名牧师与你共享此任务|r
    .collect 216880,1
    .disablecheckbox
    .accept 79731 >> 接任务：巨魔卷轴
step
    .train 425314,1
    #completewith next
    .zone Stranglethorn Vale >>前往|cFFfa9602荆棘谷|r
    >>|cRXP_WARN_前往该处之前，确保身上同时有2种|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益效果|r
step
    .train 425314,1
    .goto Stranglethorn Vale,28.961,61.931
    >>点击|cRXP_PICK_圣泉|r，拾取|T134712:0|t[|cRXP_LOOT_圣泉之水|r]
    >>|cRXP_WARN_你可能需要击杀|r|cRXP_ENEMY_萨克拉希斯|r(45级稀有)，他守在 |cRXP_PICK_圣泉|r前面
    .collect 737,1 --Holy Spring Water
    .mob 萨克拉希斯
step
    #completewith next
    .subzone 102 >> 前往祖昆达废墟
step
    .train 425314,1
    .goto Stranglethorn Vale,23.569,7.955
    .cast 3591 >> |cRXP_WARN_使用|r |T134712:0|t[|cRXP_LOOT_圣泉之水|r] |cRXP_WARN_，地点在小喷泉旁|r
    >>|cRXP_WARN_你可能需要击杀|r|cRXP_ENEMY_甘祖拉恩|r(41级)及他周围的一小群|cRXP_ENEMY_巨魔|r，才能抵达小喷泉
    .use 737
    .mob 甘祖拉恩
step
    .train 425314,1
    .goto Stranglethorn Vale,23.569,7.955
    >>点击出现的|cRXP_PICK_泉眼|r，拾取|T135975:0|t|cRXP_LOOT_[囚禁憎怨的预言]|r
    .collect 213142,1
step
    .train 425314 >> |cRXP_WARN_使用|r |T135975:0|t|cRXP_LOOT_[囚禁憎怨的预言]|r |cRXP_WARN_学习|r |T237563:0|t[消散]
    .use 213142
step
    .isQuestComplete 79731
    .goto Stranglethorn Vale,35.658,10.808
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫米特·奈辛瓦里|r交谈
    .turnin 79731 >> 交任务：巨魔卷轴
    .target 赫米特·奈辛瓦里
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Boots
#subgroupdisplayname 靴子
#name Pain Suppression - 32 (Azeroth)
#title 痛苦压制
-- Pain Suppression
#displayname 痛苦压制 - 32（艾泽拉斯）
step
    .train 402855,1
    .zone Tirisfal Glades >>前往|cFFfa9602提瑞斯法林地|r
step
    .train 402855,1
    .goto 1415,47.44,19.75,10,0
    .goto 1415,47.45,19.69,5,0
    .goto 1415,47.62,19.59,10,0
    .goto 1415,47.73,19.39,5 >> 进入血色修道院副本：墓地
step
    >>点击无头骑士刷新位置附近的|cRXP_PICK_墓碑|r，收集|cRXP_LOOT_|T136222:0|t[墓地的回响]|r。|cRXP_WARN_强烈建议组成5人队伍完成此步骤。|r
    .link https://imgur.com/a/lqRc0i6 >> |cRXP_WARN_点击此处查看参考图片。|r
    .collect 215426,1
step
    #optional
    .train 402855,1
    .zone Arathi Highlands >>前往阿拉希高地
step
    .train 402855,1
    .goto Arathi Highlands,62.1,54.5
    >>点击戈舍克农场最大建筑旁的 |cRXP_PICK_坟墓|r，收集 |cRXP_LOOT_|T136222:0|t[阿拉希的回响]|r
    .collect 215427,1
step
    .train 402855,1
    .zone Dustwallow Marsh >>前往尘泥沼泽
step
    .train 402855,1
    .goto Dustwallow Marsh,63.7,42.3
    >>点击联盟墓地附近的 |cRXP_PICK_墓碑|r，收集 |cRXP_LOOT_|T136222:0|t[塞拉摩的回响]|r
    .collect 215428,1
step
    .train 402855,1
    .zone Swamp of Sorrows >>前往|cFFfa9602悲伤沼泽|r
step
    .train 402855,1
    .goto Swamp of Sorrows,16.7,53.8
    >>点击湖边树旁的 |cRXP_PICK_坟墓|r，收集 |cRXP_LOOT_|T136222:0|t[沼泽的回响]|r
    .collect 215425,1
step
    .train 402855,1
    .zone Tirisfal Glades >>前往|cFFfa9602提瑞斯法林地|r
step
    .train 402855,1
    .goto 1415,47.44,19.75,10,0
    .goto 1415,47.45,19.69,5,0
    .goto 1415,47.62,19.59,10 >> 进入血色修道院副本: 图书馆. |cRXP_WARN_强烈建议组 5 人队伍再继续|r
step
    .train 402855,1
    .cast 437054 >>在战士雕像前使用|T136222:0|t[沼泽的回响]。
    .use 215425
step
    .train 402855,1
    .cast 437053 >>在法师雕像前使用|T136222:0|t[阿拉希的回响]。
    .use 215427
step
    .train 402855,1
    .cast 436952 >>在圣骑士雕像前使用|T136222:0|t[塞拉摩的回响]。
    .use 215428
step
    .train 402855,1
    .cast 437055 >>在牧师雕像前使用|T136222:0|t[墓地的回响]。
    .use 215426
step
    .train 402855 >>点击房间中央的橙色残片，获得 |T135791:0|t|cRXP_FRIENDLY_[伪仿顿悟]|r，再使用它学习 |T135936:0|t[痛苦压制]
    .use 213143
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Helmet
#subgroupdisplayname 头盔
#name Eye of the Void - 50 (Azeroth)
--x shiek: needs better coordinates and travelsteps
#displayname 虚空之眼 - 50（艾泽拉斯）
step
    #completewith next
    .zone The Hinterlands >>前往辛特兰
    .train 402864,1
step
    .goto The Hinterlands,58.4,72.7
    >>点击 |cRXP_PICK_|T236407:0|t微光之眼|r
    .collect 223334,1 --1/1 Glowing Eye
    .train 402864,1
step
    #completewith next
    .zone Blasted Lands >>前往诅咒之地
    .train 402864,1
step
    .goto Blasted Lands,49.0,14.0
    >>从附近山坡骑乘跳向塔顶，并使用缓落效果（如漂浮术）抵达平台。
    >>点击 |cRXP_PICK_|T236407:0|t颤动之眼|r
    .collect 223330,1 --1/1 Pulsating Eye
    .train 402864,1
step
    #completewith next
    .zone Searing Gorge >>前往灼热峡谷
    .train 402864,1
step
    .goto Searing Gorge,43.8,45.8
    >>点击 |cRXP_PICK_|T236407:0|t震动之眼|r
    .collect 223332,1 --1/1 Vibrating Eye
    .train 402864,1
step
    #completewith next
    .zone Stranglethorn Vale >>前往荆棘谷
    .train 402864,1
step
    .goto Stranglethorn Vale,33,88
    >>点击 |cRXP_PICK_|T236407:0|t灾厄之眼|r
    .collect 223333,1 --1/1 Baleful Eye
    .train 402864,1
step
    #completewith next
    .zone Feralas >>前往菲拉斯
    .train 402864,1
step
    .goto Feralas,57.2,68.7
    >>点击 |cRXP_PICK_|T236407:0|t灼燃之眼|r
    .collect 223337,1 --1/1 Burning Eye
    .train 402864,1
step
    #completewith next
    .zone Tanaris >>前往塔纳利斯
    .train 402864,1
step
    .goto Tanaris,56.4,73.7
    >>点击 |cRXP_PICK_|T236407:0|t渗液之眼|r
    .collect 223335,1 --1/1 Oozing Eye
    .train 402864,1
step
    #completewith next
    .zone Felwood >>前往费伍德森林
    .train 402864,1
step
    .goto Felwood,36.5,55.7
    >>点击 |cRXP_PICK_|T236407:0|t锐利之眼|r
    .collect 223336,1 --1/1 Piercing Eye
    .train 402864,1
step
    #completewith next
    .zone Azshara >>前往艾萨拉
    .train 402864,1
step
    .goto Azshara,89.8,33.6
    >>选中 |cRXP_FRIENDLY_守望者神龛|r
    .emote KNEEL,223590
    .accept 82316,1 >>接受任务 寻找七只眼……
    .target 守望者神龛
    .train 402864,1
step
    .goto Azshara,89.8,33.6
    >>将七只眼睛交给|cRXP_FRIENDLY_守望者神龛|r。
    .turnin 82316 >>交任务：寻找七只眼……
    .target 守望者神龛
    .train 402864,1
step
    >>获得两种不同的冥想增益后，使用|cRXP_LOOT_觉醒混乱的预言|r学习|cRXP_FRIENDLY_虚空之眼|r。
    >>先在本族的神圣场所输入/kneel获得一种增益，再在拥有另一种冥想增益的牧师面前输入/kneel，让对方以你为目标输入/pray。
    .use 221980
    .itemcount 221980,1
    .train 402864 >>学习虚空之眼
]])

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Bracers
#subgroupdisplayname 护腕
#title 圣光涌动
#name Surge of Light - 40 (Tanaris)
-- Surge of Light
#displayname 圣光涌动 - 40（塔纳利斯）
step
    #completewith RuneLearned
    +|cRXP_WARN_在塔纳利斯，你只能在晚上9点至次日早上6点之间获得|r|T135981:0|t[圣光涌动]|cRXP_WARN_符文。|r
    +若想在此时间段之外获取符文，可以考虑前往荆棘谷。
    .train 431669,1
step
    #completewith next
    .zone Tanaris >>前往塔纳利斯
    .train 431669,1
step
    .train 431669,1
    >>击杀 |cRXP_ENEMY_迷失灵魂的回响|r，|cRXP_WARN_使用神圣或奥术法术，或造成这两类伤害的魔杖|r。拾取其掉落的 |T135975:0|t[|cRXP_FRIENDLY_失落部族的预言|r]
    .collect 221981,1
    .goto Tanaris,52,29
    .mob 迷失灵魂的回响
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_需要同时拥有两种冥想增益：找到已有多种冥想增益的牧师，在他面前输入 /kneel，等他以你为目标输入 /pray|r
    .train 431669 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_失落部族的预言|r]|cRXP_WARN_学习|r|T135981:0|t[圣光涌动]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Bracers
#subgroupdisplayname 护腕
#title 圣光涌动
#name Surge of Light - 40 (Swamp of Sorrows)
-- Surge of Light
#displayname 圣光涌动 - 40（悲伤沼泽）
step
    #completewith RuneLearned
    +|cRXP_WARN_在悲伤沼泽只能于晚上9点至早上6点之间获得|r |T135981:0|t[圣光涌动] |cRXP_WARN_符文。|r
    +如果想在此时间段以外获取符文，可以去荆棘谷寻找。
    .train 431669,1
step
    #completewith next
    .zone Swamp of Sorrows >>前往悲伤沼泽
    .train 431669,1
step
    .train 431669,1
    >>击杀|cRXP_ENEMY_迷失灵魂的回响|r时，|cRXP_WARN_要使用神圣或奥术法术，或造成这两类伤害的魔杖|r。拾取|T135975:0|t[|cRXP_FRIENDLY_失落部族的预言|r]
    .collect 221981,1
    .goto Swamp of Sorrows,50,60
    .mob 迷失灵魂的回响
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_需要同时拥有两种冥想增益：找到已有多种冥想增益的牧师，在他面前输入 /kneel，等他以你为目标输入 /pray|r
    .train 431669 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_失落部族的预言|r] |cRXP_WARN_学习|r |T135981:0|t[圣光涌动]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Bracers
#subgroupdisplayname 护腕
#title 圣光涌动
#name Surge of Light - 40 (The Hinterlands)
-- Surge of Light
#displayname 圣光涌动 - 40（辛特兰）
step
    #completewith RuneLearned
    +|cRXP_WARN_在辛特兰只能于晚上9点至早上6点获取|r|T135981:0|t[圣光涌动]|cRXP_WARN_符文。|r
    +若想在此时间段以外获取该符文，可以查看荆棘谷的获取路线。
    .train 431669,1
step
    #completewith next
    .zone The Hinterlands>>前往辛特兰
    .train 431669,1
step
    .train 431669,1
    >>击杀|cRXP_ENEMY_迷失灵魂的回响|r，|cRXP_WARN_使用神圣或奥术法术，或造成这两类伤害的魔杖|r。拾取它掉落的|T135975:0|t[|cRXP_FRIENDLY_失落部族的预言|r]
    .collect 221981,1
    .goto The Hinterlands,73,68
    .mob 迷失灵魂的回响
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_需要同时拥有两种冥想增益：找到已有多种冥想增益的牧师，在他面前输入 /kneel，等他以你为目标输入 /pray|r
    .train 431669 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_失落部族的预言|r]|cRXP_WARN_学习|r|T135981:0|t[圣光涌动]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Bracers
#subgroupdisplayname 护腕
#title 圣光涌动
#name Surge of Light - 40 (Stranglethorn Vale) 2
-- Surge of Light
#displayname 圣光涌动 - 40（荆棘谷） 2
step
    #completewith RuneLearned
    +|cRXP_WARN_这个灵魂可能只会在血月事件结束后出现。你也可以关闭事件参与状态，然后跑到导航点|r.
    .train 431669,1
step
    #completewith next
    .zone Stranglethorn Vale >>前往荆棘谷
    .train 431669,1
step
    .train 431669,1
    >>击杀|cRXP_ENEMY_迷失灵魂的回响|r，|cRXP_WARN_使用神圣或奥术法术，或造成这两类伤害的魔杖|r，拾取 |T135975:0|t[|cRXP_FRIENDLY_失落部族的预言|r]
    .collect 221981,1
    .goto Stranglethorn Vale,40.0,58.0
    .mob 迷失灵魂的回响
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_需要同时拥有两种冥想增益：找到已有多种冥想增益的牧师，在他面前输入 /kneel，等他以你为目标输入 /pray|r
    .train 431669 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_失落部族的预言|r] |cRXP_WARN_学习|r |T135981:0|t[圣光涌动]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Bracers
#subgroupdisplayname 护腕
#title 圣光涌动
#name Surge of Light - 40 (Stranglethorn Vale) 1
-- Surge of Light
#displayname 圣光涌动 - 40（荆棘谷） 1
step
    #completewith RuneLearned
    +|cRXP_WARN_你只能在晚上9点至早上6点之间获取|r |T135981:0|t[圣光涌动] |cRXP_WARN_符文。|r
    +如果想在这个时段之外获取符文，请查看荆棘谷 2。
    .train 431669,1
step
    #completewith next
    .zone Stranglethorn Vale >>前往荆棘谷
    .train 431669,1
step
    .train 431669,1
    >>击杀 |cRXP_ENEMY_迷失灵魂的回响|r |cRXP_WARN_时请使用神圣或奥术法术，或造成这两类伤害的魔杖|r，拾取 |T135975:0|t[|cRXP_FRIENDLY_失落部族的预言|r]
    .collect 221981,1
    .goto Stranglethorn Vale,30.0,73.0
    .mob 迷失灵魂的回响
step
    #label RuneLearned
    .itemcount 221981,1
    .use 221981
    *|cRXP_WARN_需要同时拥有两种冥想增益：找到已有多种冥想增益的牧师，在他面前输入 /kneel，等他以你为目标输入 /pray|r
    .train 431669 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_失落部族的预言|r] |cRXP_WARN_学习|r |T135981:0|t[圣光涌动]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Cloak
#subgroupdisplayname 披风
#title 联结治疗
#name Binding Heal - 58 (Western and Eastern Plaguelands)
#next Priest Racials - 60 (Azeroth)
#displayname 联结治疗 - 58（东西瘟疫之地）
step << Alliance
    #completewith next
    .zone Stormwind City >> 前往暴风城
step << Alliance
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂内的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 交谈
    .accept 84320 >> 接任务: 失落的传家宝
    .target 高阶牧师劳瑞娜
step << Horde
    #completewith next
    .zone Orgrimmar >> 前往奥格瑞玛
step << Horde
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与精神谷的 |cRXP_FRIENDLY_迪特里希·普雷斯|r 交谈
    .accept 84405 >> 接任务: 失落的传家宝
    .target 迪特里希·普雷斯
step
    #completewith next
    .zone Western Plaguelands >> 前往: 西瘟疫之地
step
    .goto Western Plaguelands,51.9,82.4,50 >> 前往悔恨岭旁的大墓穴
step
    .goto Western Plaguelands,54.8,81.2
    >>|cRXP_WARN_进入墓穴后左转，下楼，在右侧的小壁龛中找到木箱，从中拾取|r |T133299:0|t[|cRXP_PICK_家传珍宝|r]
    .collect 227745,1 --Family Heirloom(1)
step
    .goto Western Plaguelands,53.8,80.2
    >>|cRXP_WARN_前往墓穴底部，从右侧书架拾取|r |T133741:0|t[|cRXP_PICK_家族谱系|r]，|cRXP_WARN_从左侧桌上拾取|r |T133735:0|t[|cRXP_PICK_幸存者日记|r] |cRXP_WARN_。|r
    .collect 227747,1 --Family Records
    .collect 227748,1 --Survivor Journal
step << Alliance
    #completewith next
    .zone Stormwind City >> 返回暴风城
step << Alliance
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂内的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 交谈
    .turnin 84320 >> 交任务: 失落的传家宝
    .accept 84321 >> 接任务: 圣光的圣物
    .target 高阶牧师劳瑞娜
step << Horde
    #completewith next
    .zone Orgrimmar >> 返回奥格瑞玛
step << Horde
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与精神谷的 |cRXP_FRIENDLY_迪特里希·普雷斯|r 交谈
    .turnin 84405 >> 交任务: 失落的传家宝
    .accept 84406 >> 接任务: 圣光的圣物
    .target 迪特里希·普雷斯
step
    #completewith next
    >>|cRXP_WARN_下一个任务需要从精英区域拾取物品。可以单人完成，但等级较低或装备不足时，建议找人协助|r
    .zone Western Plaguelands >> 返回: 西瘟疫之地
step
    .goto Western Plaguelands,48.2,21.7,50 >> 前往壁炉谷. |cRXP_WARN_这是精英区域|r
step
    .goto Western Plaguelands,42.2,18.1
    >>|cRXP_WARN_进入壁炉谷议政厅，与讲台上的|r |cRXP_PICK_血色账簿|r |cRXP_WARN_互动。小心，这里布满精英怪物|r
    .turnin 84406 >> 交任务: 圣光的圣物 << Horde
    .turnin 84321 >> 交任务: 圣光的圣物 << Alliance
    .accept 84322 >> 接任务: 血色研究
step
    #completewith next
    >>|cRXP_WARN_下一个任务需要从精英区域拾取物品。可以单人完成，但等级较低或装备不足时，建议找人协助|r
    .zone Eastern Plaguelands >> 前往: 东瘟疫之地
step
    .goto Eastern Plaguelands,77.5,81.7,50 >> 前往提尔之手. |cRXP_WARN_这是精英区域|r
step
    .goto Eastern Plaguelands,83.6,78.2
    >>|cRXP_WARN_符文|r |T237537:0|t[神圣专精] |cRXP_WARN_也在提尔之手，现在不想获取则跳过|r
    >>|cRXP_WARN_若想获取, 前往地图标记建筑的图书馆区域, 找到书架顶部的书拾取符文. 战斗中无法拾取|r
    >>|cRXP_WARN_可清空房间内的怪物；也可在书旁死亡后释放灵魂，跑尸并在怪物视线外复活，再拾取符文，无需击杀怪物|r
    .collect 226418,1 --Rune of Holy Specialization
    .train 453702,1
step
    #completewith next
    .train 453702 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_神圣专精符文|r] 学习 |T237537:0|t[神圣专精]
    .train 453702,1
    .itemcount 226418,1
step
    .goto Eastern Plaguelands,83.6,78.2
    >>|cRXP_WARN_进入钟楼，前往顶层，与那里的锁住的箱子互动|r
    .turnin 84322 >> 交任务: 血色研究
    .accept 84323 >> 接受「匣中珍宝」任务
step
    .goto Eastern Plaguelands,83.6,78.2
    >>击杀提尔之手内任意血色十字军成员, 拾取 |T134245:0|t[|cRXP_LOOT_遗物仓库钥匙|r]
    >>|cRXP_WARN_可跳过刷钥匙, 找开锁技能 175+ 的盗贼帮你开箱. 若更愿意找盗贼则跳过此步骤|r
    .collect 228912,1 --Artifact Storage Key
    .itemcount 227938,<1 --Skips if you get the Shard of Light without the key
step
    >>用 |T134245:0|t[|cRXP_LOOT_遗物仓库钥匙|r] 解锁 |T133876:0|t[|cRXP_LOOT_谜之匣|r] 或让盗贼开锁, 拾取 |T132874:0|t[|cRXP_LOOT_圣光碎片|r]
    .collect 227938,1 --Shard of Light(1)
step << Alliance
    #completewith next
    .zone Stormwind City >> 返回暴风城
step << Alliance
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂内的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 交谈
    .turnin 84323 >> 交任务: 匣中珍宝
    .target 高阶牧师劳瑞娜
step << Horde
    #completewith next
    .zone Orgrimmar >> 返回奥格瑞玛
step << Horde
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与精神谷的 |cRXP_FRIENDLY_迪特里希·普雷斯|r 交谈
    .turnin 84323 >> 交任务: 匣中珍宝
    .target 迪特里希·普雷斯
step
    .train 402853 >> 使用 |T135791:0|t[|cRXP_FRIENDLY_欣悦顿悟|r] 学习 |T135883:0|t[|cRXP_FRIENDLY_联结治疗|r]
    .use 228123
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Cloak
#subgroupdisplayname 披风
#title 吸血鬼之触
#name Vampiric Touch - 60 (Demon Fall Canyon Dungeon)
#displayname 吸血鬼之触 - 60（屠魔峡谷地下城）
step
    #completewith next
    >>|T135978:0|t[|cRXP_FRIENDLY_吸血鬼之触|r]符文由探索赛季新增地下城屠魔峡谷的最终首领掉落
    .zone Felwood >> |cRXP_WARN_进入地下城前必须先完成一个简短任务，获得其奖励的饰品。前往费伍德森林开始任务|r
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    .goto Felwood,51.4,82.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影齿大使|r交谈
    .accept 84384 >> 接任务：恶魔骗术
    .target 影齿大使
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    #completewith next
    .zone Winterspring >> 前往冬泉谷
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    .goto Winterspring,65.6,21.4
    >>在永望镇以北寻找|cRXP_ENEMY_狂暴枭兽|r。击杀它们并拾取|T237413:0|t[|cRXP_LOOT_枭兽的松果腺|r]
    .complete 84384,1
    .mob 狂暴枭兽
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    #completewith next
    .zone Felwood >> 返回费伍德森林
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    .goto Felwood,51.4,82.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影齿大使|r交谈
    .turnin 84384 >> 交任务：恶魔骗术
    .target 影齿大使
    .itemcount 228172,<1 --Only shows if you don't have the trinket
step
    #completewith next
    +将|T136232:0|t[|cRXP_FRIENDLY_影齿幻象结界|r]装备到任意饰品栏中。必须装备它才能进入地下城
    .use 228172
    .itemcount 228172,1
step
    >>|cRXP_WARN_符文|r |T135978:0|t[|cRXP_FRIENDLY_吸血鬼之触|r] |cRXP_WARN_由探索赛季新增地下城屠魔峡谷的最终首领掉落。前往灰谷途中开始寻找队伍|r
    >>如果乘坐飞行路线，请飞往艾萨拉的塔伦迪斯营地而非阿斯特兰纳，那里更靠近地下城入口 << Alliance
    .zone Ashenvale >> 前往灰谷
step
    .goto Ashenvale,84.5,75.0,50 >> 前往屠魔峡谷地下城入口
step
    >>通关地下城。|T135791:0|t[|cRXP_FRIENDLY_畅导顿悟|r]可用来学习|T135978:0|t[|cRXP_FRIENDLY_吸血鬼之触|r]，由地下城最终首领|cRXP_ENEMY_地狱咆哮的幻灵|r掉落。|cRXP_WARN_务必拾取首领身上的符文！|r
    .collect 228126,1 --Apperitive Epiphany
    .mob 地狱咆哮的幻灵
step
    .train 402857 >> 使用 |T135791:0|t[|cRXP_FRIENDLY_畅导顿悟|r] 学习 |T135978:0|t[|cRXP_FRIENDLY_吸血鬼之触|r]
    .use 228126
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Extras
#subgroupdisplayname 额外内容
#title 牧师种族技能
#name Priest Racials - 60 (Azeroth)
#displayname 牧师种族技能 - 60（艾泽拉斯）
step
    #completewith next
    >>|cRXP_WARN_额外的牧师技能需要全服解锁。如果你的服务器上已经有人完成任务链，你可以跳过整条任务链，直接前往卡拉赞学习新的种族技能。如果尚未解锁，你可以按下方指南完成任务链，为全服解锁！|r
    .zone Deadwind Pass >> 前往逆风小径
step
    .goto Deadwind Pass,40.8,78.4
    >>前往卡拉赞旁的小神龛
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与卡拉赞旁神龛处的|cRXP_FRIENDLY_神圣彻悟|r交谈，选择你想学习的种族技能
    .target 神圣彻悟
step
    #completewith PreQStart
    +这是在全服务器解锁额外牧师种族技能的任务链起点。|cRXP_WARN_你的服务器很可能已经完成了这条任务链，你无需执行以下步骤。只有想体验这条任务链，或确定服务器尚未解锁时才继续|r
step
    #completewith QStart
    +|cRXP_WARN_开始此任务前，你必须已经完成奖励|r|T135883:0|t[|cRXP_FRIENDLY_联结治疗|r]|cRXP_WARN_的任务链。可在披风符文分类中找到相应指南|r
    .train 402853,1
step
    #label PreQStart
    .goto Eastern Plaguelands,48.1,24.0
    >>|cRXP_WARN_交付这条任务链的第一个任务需要4份|r|T134855:0|t[|cRXP_LOOT_斯坦索姆圣水|r]|cRXP_WARN_，以及可从拍卖行购买的其他材料。寻找队伍前往斯坦索姆（亡灵区）|r
    >>|cRXP_WARN_进入副本后，寻找并拾取散布在地面上的补给箱。其中可能装有圣水，也可能是陷阱，打开后会出现难缠的敌人|r
    .collect 13180,4 --Stratholme Holy Water(4)
step << Alliance
    #completewith next
    .zone Stormwind City >> 前往暴风城
step << Alliance
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>从拍卖行购买6条|T133682:0|t[|cRXP_LOOT_厚符文布绷带|r]、4瓶|T134834:0|t[|cRXP_LOOT_特效治疗药水|r]和8枚|T132834:0|t[|cRXP_LOOT_巨蛋|r]。这条任务链的第一个任务需要这些物品，以及你已收集的|T134855:0|t[|cRXP_LOOT_斯坦索姆圣水|r]
    .collect 14530,6 --Heavy runecloth bandage (6)
    .collect 13446,4 --Major Healing Potion (4)
    .collect 12207,8 --Giant Egg(8)
    .collect 13180,4 --Stratholme Holy Water(4)
    .target 拍卖师亚克森
step << Alliance
    #label QStart
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂的|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .accept 84324 >> 接任务：外交手段
    .turnin 84324 >> 交任务：外交手段
    .target 高阶牧师劳瑞娜
step << Horde
    #completewith next
    .zone Orgrimmar >> 前往奥格瑞玛
step << Horde
    .goto Orgrimmar,55.59,62.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拍卖师萨苏恩|r 交谈
    >>从拍卖行购买6条|T133682:0|t[|cRXP_LOOT_厚符文布绷带|r]、4瓶|T134834:0|t[|cRXP_LOOT_特效治疗药水|r]和8枚|T132834:0|t[|cRXP_LOOT_巨蛋|r]。这条任务链的第一个任务需要这些物品，以及你已收集的|T134855:0|t[|cRXP_LOOT_斯坦索姆圣水|r]
    .collect 14530,6 --Heavy runecloth bandage (6)
    .collect 13446,4 --Major Healing Potion (4)
    .collect 12207,8 --Giant Egg(8)
    .collect 13180,4 --Stratholme Holy Water(4)
    .target 拍卖师萨苏恩
step << Horde
    #label QStart
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与精神谷的|cRXP_FRIENDLY_迪特里希·普雷斯|r交谈
    .accept 84408 >> 接任务：外交手段
    .turnin 84408 >> 交任务：外交手段
    .target 迪特里希·普雷斯
step
    #completewith next
    >>|cRXP_WARN_接下来的任务需要找到一名同样在做此任务链的对立阵营牧师，才能继续推进|r
    .zone Eastern Plaguelands >> 前往东瘟疫之地
step
    .goto Eastern Plaguelands,47,58
    >>|cRXP_WARN_前往东瘟疫之地的|r|cRXP_FRIENDLY_协作神龛|r|cRXP_WARN_。与对立阵营牧师互相造成伤害，然后使用交上一个任务获得的|r|T134918:0|t[|cRXP_FRIENDLY_利众结界|r]|cRXP_WARN_互相治疗|r
    >>如果操作正确，|cRXP_FRIENDLY_协作神龛|r会提供任务，接取该任务
    .accept 84325 >> 接任务：「协作神龛」任务 << Alliance
    .accept 84410 >> 接任务：「协作神龛」任务 << Horde
    .use 228130
step << Alliance
    #completewith next
    .zone Stormwind City >> 返回暴风城
step << Alliance
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>从拍卖行购买2块|T134459:0|t[|cRXP_LOOT_奥金锭|r]、2份|T134086:0|t[|cRXP_LOOT_山脉之血|r]和3颗|T134132:0|t[|cRXP_LOOT_蓝宝石|r]。稍后交任务时需要这些物品，它们可能很贵
    .collect 12360,2 --Arcanite Bar(2)
    .collect 11382,2 --Blood of the Mountain(2)
    .collect 12361,3 --Blue Sapphire(3)
    .target 拍卖师亚克森
step << Alliance
    .goto Stormwind City,38.8,26.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂的|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 84325 >> 交任务：「协作神龛」任务
    .accept 84326 >> 接任务：「外交之戒」任务
    .turnin 84326 >> 交任务：「外交之戒」任务
    .accept 84327 >> 接任务：外交任务
    .target 高阶牧师劳瑞娜
step << Horde
    #completewith next
    .zone Orgrimmar >> 返回奥格瑞玛
step << Horde
    .goto Orgrimmar,55.59,62.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拍卖师萨苏恩|r 交谈
    >>从拍卖行购买2块|T134459:0|t[|cRXP_LOOT_奥金锭|r]、2份|T134086:0|t[|cRXP_LOOT_山脉之血|r]和3颗|T134132:0|t[|cRXP_LOOT_蓝宝石|r]。稍后交任务时需要这些物品，它们可能很贵
    .collect 12360,2 --Arcanite Bar(2)
    .collect 11382,2 --Blood of the Mountain(2)
    .collect 12361,3 --Blue Sapphire(3)
    .target 拍卖师萨苏恩
step << Horde
    .goto Orgrimmar,35.8,87.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与精神谷的|cRXP_FRIENDLY_迪特里希·普雷斯|r交谈
    .turnin 84410 >> 交任务：「协作神龛」任务
    .accept 84411 >> 接任务：「外交之戒」任务
    .turnin 84411 >> 交任务：「外交之戒」任务
    .accept 84412 >> 接任务：外交任务
    .target 迪特里希·普雷斯
step << Horde
    #completewith next
    >>|cRXP_WARN_完成此任务需要再次找到对立阵营牧师，让其在你站在暴风城城门旁时，对你使用|r|T133396:0|t[|cFF0070FF外交之戒|r]|cRXP_WARN_。这样城市卫兵就不会攻击你，你便能安全进入敌方主城|r
    >>|cRXP_WARN_注意：在PvP服务器上，对立阵营玩家仍然可以攻击你！|r
    .zone Elwynn Forest >> 前往暴风城城门
step << Horde
    .goto Stormwind City,38.8,26.6
    >>让对立阵营牧师对你使用|T133396:0|t[|cFF0070FF外交之戒|r]，使城市卫兵不再攻击你，然后前往暴风城大教堂。|cRXP_WARN_其他玩家仍然可以攻击你！|r
    >>|cRXP_WARN_对立阵营牧师必须护送你到任务给予者处，否则你会失去外交豁免增益|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂的|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 84412 >> 交任务：外交任务
    .accept 84413 >> 接任务：「修复碎片」任务
    .target 高阶牧师劳瑞娜
step << Alliance
    #completewith next
    >>|cRXP_WARN_完成此任务需要再次找到对立阵营牧师，让其在你站在奥格瑞玛城门旁时，对你使用|r|T133396:0|t[|cFF0070FF外交之戒|r]|cRXP_WARN_。这样城市卫兵就不会攻击你，你便能安全进入敌方主城|r
    >>|cRXP_WARN_注意：在PvP服务器上，对立阵营玩家仍然可以攻击你！|r
    .zone Durotar >> 前往奥格瑞玛城门
step << Alliance
    .goto Orgrimmar,35.8,87.2
    >>让对立阵营牧师对你使用|T133396:0|t[|cFF0070FF外交之戒|r]，使城市卫兵不再攻击你，然后前往精神谷。|cRXP_WARN_其他玩家仍然可以攻击你！|r
    >>|cRXP_WARN_对立阵营牧师必须护送你到任务给予者处，否则你会失去外交豁免增益|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与精神谷的|cRXP_FRIENDLY_迪特里希·普雷斯|r交谈
    .turnin 84327 >> 交任务：外交任务
    .accept 84328 >> 接任务：「修复碎片」任务
    .target 迪特里希·普雷斯
step
    #completewith next
    >>|cRXP_WARN_开始寻找厄运之槌西区的队伍。下一个任务需要击杀|r|cRXP_ENEMY_卡雷迪斯镇长|r|cRXP_WARN_，他是副本首领之一|r
    .zone Feralas >> 前往菲拉斯
step
    .goto Feralas,59.1,43.2,100 >> 进入厄运之槌区域
step
    .goto Feralas,60.4,30.2
    >>进入厄运之槌西区，击杀|cRXP_ENEMY_卡雷迪斯镇长|r，拾取|T133737:0|t[|cRXP_LOOT_应用神学|r]。他位于副本的幽灵区域
    .collect 227912,1
step << Horde
    #completewith next
    >>|cRXP_WARN_完成此任务需要再次找到对立阵营牧师，让其在你站在暴风城城门旁时，对你使用|r|T133396:0|t[|cFF0070FF外交之戒|r]|cRXP_WARN_。这样城市卫兵就不会攻击你，你便能安全进入敌方主城|r
    >>|cRXP_WARN_注意：在PvP服务器上，对立阵营玩家仍然可以攻击你！|r
    .zone Elwynn Forest >> 前往暴风城城门
step << Horde
    .goto Stormwind City,38.8,26.6
    >>让对立阵营牧师对你使用|T133396:0|t[|cFF0070FF外交之戒|r]，使城市卫兵不再攻击你，然后前往暴风城大教堂。|cRXP_WARN_其他玩家仍然可以攻击你！|r
    >>|cRXP_WARN_对立阵营牧师必须护送你到任务给予者处，否则你会失去外交豁免增益|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风城大教堂的|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 84413 >> 交任务：「修复碎片」任务
    .accept 84329 >> 接任务：「集会召开」任务
    .target 高阶牧师劳瑞娜
step << Alliance
    #completewith next
    >>|cRXP_WARN_完成此任务需要再次找到对立阵营牧师，让其在你站在奥格瑞玛城门旁时，对你使用|r|T133396:0|t[|cFF0070FF外交之戒|r]|cRXP_WARN_。这样城市卫兵就不会攻击你，你便能安全进入敌方主城|r
    >>|cRXP_WARN_注意：在PvP服务器上，对立阵营玩家仍然可以攻击你！|r
    .zone Durotar >> 前往奥格瑞玛城门
step << Alliance
    .goto Orgrimmar,35.8,87.2
    >>让对立阵营牧师对你使用|T133396:0|t[|cFF0070FF外交之戒|r]，使城市卫兵不再攻击你，然后前往精神谷。|cRXP_WARN_其他玩家仍然可以攻击你！|r
    >>|cRXP_WARN_对立阵营牧师必须护送你到任务给予者处，否则你会失去外交豁免增益|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与精神谷的|cRXP_FRIENDLY_迪特里希·普雷斯|r交谈
    .turnin 84328 >> 交任务：「修复碎片」任务
    .accept 84329 >> 接任务：「集会召开」任务
    .target 迪特里希·普雷斯
step
    #completewith next
    .zone Deadwind Pass >> 前往逆风小径
step
    .goto Deadwind Pass,40.8,78.4
    >>前往卡拉赞旁边的小神殿
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与卡拉赞旁神龛处的|cRXP_FRIENDLY_麦丝拉·炉心|r交谈
    .turnin 84329 >> 交任务：「集会召开」任务
step
    +交付上述任务后，任务链应会完成，并在全服务器解锁学习另一个种族牧师种族技能的资格
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Cloak
#subgroupdisplayname 披风
#title 灵魂守护
#name Soul Warding - 60 (Stratholme)
#displayname 灵魂守护 - 60（斯坦索姆）
step
    #completewith next
    >>|cRXP_WARN_获取此符文需要在斯坦索姆地下城（生者区与亡者区）内完成几项任务。开始寻找队伍|r
    .zone Eastern Plaguelands >> 前往东瘟疫之地
step
    .goto Eastern Plaguelands,47.8,24.2
    >>进入斯坦索姆
    >>|cRXP_WARN_请仔细阅读本节，这个符文任务的流程比较特殊|r
    >>要获取符文，你需要从斯坦索姆的首领身上收集3份精华。携带精华的首领|cRXP_WARN_是随机的，每个副本进度都不同|r。要确定当前进度中哪些首领携带精华，需要寻找位于生者区血色建筑内柱子上的线索
    >>收集精华需要3个|T134799:0|t[|cRXP_LOOT_斯坦索姆阴影之瓮|r]，可从副本内的[|cRXP_PICK_邮箱包裹|r]中获得。要打开[|cRXP_PICK_邮箱|r]，你得先击杀|cRXP_ENEMY_斯坦索姆信使|r，从他身上拾取|T134237:0|t[|cRXP_LOOT_邮箱钥匙|r]
    >>收齐所有精华后，返回带有线索的柱子处，使用与各自提示对应的精华激活柱子。柱子旁会出现一个宝珠，拾取它即可获得符文
    +|cRXP_WARN_读完上述说明后，如果想了解各条线索对应哪位首领，请点击此处。需要时随时可以返回这一步|r
step
    >>|cRXP_WARN_以下是线索及其对应的首领：|r
    >>此人栖身亡者之间，与侍僧和寒冰法术为伴 = 苍白的玛勒基
    >>被诅咒守卫高塔的幽魂，财富与权势也无法带来慰藉 = 安娜丝塔丽男爵夫人
    >>被重新发现的古老王国，不过是换了一位主人 = 奈鲁布恩坎
    >>以血肉造就的科学罪孽，遭到被遗忘者精英的追猎 = 吞咽者拉姆斯登
    >>人民在最需要的时候，期盼他能挺身领导 = 巴瑟拉斯镇长
    >>满怀邪恶的勇士，巨大的恐怖造物守卫着他的宫殿 = 瑞文戴尔男爵
    >>神圣的狂热净化罪恶，暗影却仍潜藏其中。 = 巴纳扎尔
    >>房间内弥漫着硫磺气味，这个狂热者用爆炸迎接来客。 = 炮手威利
    +|cRXP_WARN_如果想查看完成此任务的推荐高效顺序，请点击此处。需要时随时可以返回这一步重读线索|r
step
    >>|cRXP_WARN_完成此任务的高效顺序如下：|r
    >>1. 从副本的生者区开始
    >>2. 搜刮三个[|cRXP_PICK_邮箱包裹|r]以获得|T134799:0|t[|cRXP_LOOT_斯坦索姆阴影之瓮|r]。这些罐子是唯一物品，因此需要由不同的玩家各拾取一个
    >>3. 清到基座房间，确定当前副本进度中哪些首领携带精华
    >>4. 推进副本时收集全部精华
    >>5. 返回基座房间，使用对应精华逐个激活基座
    >>6. 拾取出现的宝珠，获得符文
    .collect 228124,1 --Oneiric Epiphany
step
    .train 402850 >> 使用 |T135791:0|t[|cRXP_FRIENDLY_梦谵顿悟|r] 学习 |T135948:0|t[|cRXP_FRIENDLY_灵魂守护|r]
    .use 228124
]])
