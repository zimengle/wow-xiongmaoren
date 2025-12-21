local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
#version 1
#season 2
<< Alliance
#group RestedXP 联盟 1-20级
#name 1-7 寒脊山谷
#next 6-11 丹莫罗 赛季服
#displayname 1-7 寒脊山谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#defaultfor Dwarf/Gnome

step << !Gnome !Dwarf
    #completewith next
    +您选择的指南适用于侏儒和矮人. 请确保选择与您起始职业相同的初始区域
step
    .goto Dun Morogh,29.927,71.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .accept 179 >>接任务: |cRXP_LOOT_矮人的交易|r
    .target Sten Stoutarm
step << Mage/Hunter/Priest/Paladin/Warrior/Warlock
    .goto Dun Morogh,29.47,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    >>|cRXP_BUY_向他出售你的|r|T135005:0|t[衬衫], 并从他那里|cRXP_BUY_购买|r|T135975:0|t[被亵渎要塞的友好预言]|r << Priest
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衫]和 |T132540:0|t[靴子]|cRXP_WARN_(它们无法刻印)|r|cRXP_BUY_并从他处购买 |T133745:0|t[|cRXP_FRIENDLY_殉道者遗志|r]和 |T134916:0|t[|cRXP_FRIENDLY_裁决之书|r]|r << Paladin
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衫]|cRXP_BUY_, 然后从他那里购买|T134419:0|t[|cRXP_FRIENDLY_狂暴冲锋符文|r]|r << Warrior
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衫]|cRXP_BUY_并从他那里购买|r|T133733:0|t[|cRXP_FRIENDLY_ 灵魂盔甲之书]|r << Warlock
    >>|cRXP_BUY_出售垃圾并购买|T134419:0|t[|cRXP_FRIENDLY_暗影之击符文|r]|r << Rogue
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衫]|cRXP_BUY_并从他那里购买|r|T134939:0|t[|cRXP_FRIENDLY_ 法术笔记:烈焰|r]|r << Mage
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衫]和 |T132540:0|t[靴子]|cRXP_WARN_(它们无法刻印)|r|cRXP_BUY_并从他那里购买 |T134419:0|t[|cRXP_FRIENDLY_击杀命令符文|r] 和 |T133739:0|t[|cRXP_FRIENDLY_雄狮之心典籍|r]|r << Hunter
    >>|cRXP_BUY_出售垃圾并购买以下所有符文:|r << Warlock
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel
    .collect 226398,1  << Paladin --Testament of Martyrdom
    .collect 205420,1 << Paladin --Libram of Judgement
    .collect 204716,1 << Warrior --Rune of Frenzied Assault
    .collect 204795,1 << Rogue --Rune of Shadowstrike
    .collect 203746,1 << Mage --Spell Notes: Living Flame
    .collect 209852,1 << Hunter --Rune of Kill Command
    .collect 226401,1 << Hunter --Treatise on the Heart of the Lion
    .collect 205215,1 << Warlock --Rune of Tactics
    .collect 210824,1 << Warlock --Rune of the Pact
    .collect 211477,1 << Warlock --Rune of Incinerate
    .collect 205230,1 << Warlock --Rune of Haunting
    .collect 228797,1 << Warlock --Grimoire of Fel Armor
    >>你很快就会得到剩下的符文
    .target Rune Broker
    .skipgossip
step << Mage/Hunter/Priest/Paladin/Warrior/Warlock
    #sticky
    #optional
    #label Libram << Paladin
    .equip 18 >>装备 |T134916:0|t[正义之书], 30秒后可使用它来学习 |T135891:0|t[十字军打击] << Paladin
    .use 205947 << Priest --Prophecy of a Desecrated Citadel
    .use 226398 << Paladin --Testament of martyrdom
    .use 205420 << Paladin --Libram of Judgement
    .use 204716 << Warrior --Rune of Frenzied Assault
    .use 203746 << Mage --Spell Notes: Living Flame
    .use 209852 << Hunter --Rune of Kill Command
    .use 226401 << Hunter --Treatise on the Heart of the Lion
    .use 228797 << Warlock --Grimoire of Fel Armor
    .train 402852 >>使用 |T135975:0|t[|cRXP_FRIENDLY_亵渎要塞的预言|r] 来训练 |T237570:0|t[人造人] << Priest
    .train 407798 >>使用 |T133745:0|t[|cRXP_FRIENDLY_殉道遗嘱|r] 来训练 |T135961:0|t[殉道之印], |cRXP_WARN_请将其作为您的主要封印|r << Paladin
    .train 425447 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r] << Warrior
    .train 401768 >>使用 |T134939:0|t[|cRXP_FRIENDLY_法术说明:活焰|r] << Mage
    .train 410111 >>使用|T134419:0|t[|cRXP_FRIENDLY_击杀命令符文|r] << Hunter
    .train 409580 >>使用|T133739:0|t[|cRXP_FRIENDLY_雄狮之心论|r]来训练|T132185:0|t[雄狮之心] << Hunter
    .train 403619 >>使用|T133733:0|t[|cRXP_FRIENDLY_痛苦护甲秘典|r]来训练|T136156:0|t[痛苦护甲] << Warlock
    .engrave 7 >>在你的裤子上刻上|T236174:0|t[致命一击] << Hunter
    .engrave 7 >>在你的裤子上刻上[活火] << Mage
    .engrave 7 >>在你的裤子上刻上|T237570:0|t[人造人] << Priest
    .engrave 7 >>在你的裤子上刻上|T236317:0|t[狂暴突袭] << Warrior
    >>|cRXP_WARN_TIP:|r你可以用 |T135812:0|t[火球术]拉住多个|cRXP_ENEMY_Wolves|r, 然后用 |T135820:0|t[活焰]进行范围攻击 << Mage
step << Paladin
    #sticky
    #optional
    #requires Libram
    #label LibramLearn
    .train 410002 >>使用|T134916:0|t[圣光审判之书]学习|T135891:0|t[十字军打击]
step << Hunter
    #optional
    #sticky
    .aura 409583 >>记得激活你的 |T132185:0|t[雄狮之心]
step << Warlock
    #optional
    #sticky
    .aura 403619 >>|cRXP_WARN_ 请务必记得激活你的|r|T136156:0|t[邪能护甲]
step << Paladin
    #optional
    #completewith next
    .aura 407798 >>请记得使用|T135961:0|t[殉道者之印]作为你的封印
step
    #label WolfMeat
    .goto 1426,29.529,73.286,0
    .goto 1426,28.117,75.088,0
    .goto 1426,28.557,72.487,0
    .goto 1426,29.529,73.286,60,0
    .goto 1426,29.054,74.608,60,0
    .goto 1426,28.558,75.781,60,0
    .goto 1426,28.117,75.088,60,0
    .goto 1426,27.562,74.331,60,0
    .goto 1426,27.793,73.123,60,0
    .goto 1426,28.557,72.487,60,0
    >>击杀|cRXP_ENEMY_Ragged Young Wolves|r. 击败后可获得其掉落的|cRXP_LOOT_硬狼肉|r
    .complete 179,1 --Collect Tough Wolf Meat (x8)
    .mob Ragged Young Wolf
step
    #optional
    .goto 1426,29.529,73.286,0
    .goto 1426,28.117,75.088,0
    .goto 1426,28.557,72.487,0
    .goto 1426,29.529,73.286,60,0
    .goto 1426,29.054,74.608,60,0
    .goto 1426,28.558,75.781,60,0
    .goto 1426,28.117,75.088,60,0
    .goto 1426,27.562,74.331,60,0
    .goto 1426,27.793,73.123,60,0
    .goto 1426,28.557,72.487,60,0
    .xp 2 >>升级到2级
    .mob Ragged Young Wolf
step << Warrior/Mage/Warlock/Hunter
    .goto Dun Morogh,29.47,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>|cRXP_BUY_出售垃圾并购买|r|T134419:0|t[|cRXP_FRIENDLY_胜利冲刺符文|r] << Warrior
    .vendor >>|cRXP_BUY_出售垃圾并购买所有关键的范围伤害符文|r << Mage
    .vendor >>|cRXP_BUY_出售垃圾并购买以下所有符文:|r << Hunter/Warlock
    .collect 204806,1 << Warrior --Rune of Victory Rush
    .collect 208799,1 << Mage --Spell Notes: Living Bomb
    .collect 203748,1 << Mage --Spell Notes: Burnout
    .collect 225690,1 << Mage --Spell Notes: Frozen Orb
    .collect 203745,1 << Mage --Spell Notes: Ice Lance
    .collect 206168,1 << Hunter --Rune of the Chimera
    .collect 210818,1 << Hunter --Rune of Lone Wolf
    .collect 213124,1 << Hunter --Rune of Close Combat
    .collect 226252,1 << Hunter --Rune of the Guerrilla
    .collect 216770,1 << Hunter --Treatise on Aspect of the Viper
    .collect 205215,1 << Warlock --Rune of Tactics
    .collect 210824,1 << Warlock --Rune of the Pact
    .collect 211477,1 << Warlock --Rune of Incinerate
    .collect 205230,1 << Warlock --Rune of Haunting
    >>寒冰之枪只有在后续交任务时才有用 << Mage
    >>|cRXP_WARN_稍后您将获得剩余的符文|r
    .target Rune Broker
    .skipgossip
step << Warrior/Mage/Hunter
    .train 403470 >>使用 |T134419:0|t[|cRXP_FRIENDLY_胜利之纹|r] 来训练 |T132342:0|t[胜利冲刺], 你将很快将其刻印 << Warrior
    .train 415936 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: 活体炸弹|r]来训练|T236220:0|t[活体炸弹] << Mage
    .train 401759 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Burnout|r]来训练|T236207:0|t[Burnout] << Mage
    .train 440858 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: 冰霜宝珠|r]来训练|T135851:0|t[冰霜宝珠] << Mage
    .train 401760 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: 寒冰之枪|r]来训练|T135844:0|t[寒冰之枪] << Mage
    .train 410121 >>使用|T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r]来训练|T236176:0|t[奇美拉射击] << Hunter
    .train 410122 >>使用|T134419:0|t[|cRXP_FRIENDLY_独狼符文|r]训练|T132266:0|t[独狼] << Hunter
    .train 416086 >>使用|T134419:0|t[|cRXP_FRIENDLY_近战符文|r]来训练|T132394:0|t[近战专家] << Hunter
    .train 440563 >>使用|T134419:0|t[|cRXP_FRIENDLY_游击符文|r]来训练|T132171:0|t[突袭与撤退] << Hunter
    .train 415423 >>使用|T133739:0|t[|cRXP_FRIENDLY_ 蛇毒之书]来训练|T132160:0|t[蛇毒之姿]|r << Hunter
    .train 416009 >>使用|T134419:0|t[|cRXP_FRIENDLY_战术符文|r]来训练|T136150:0|t[恶魔战术] << Warlock
    .train 425476 >>使用 |T134419:0|t[|cRXP_FRIENDLY_ 契约符文|r] 来训练 |T237562:0|t[恶魔契约] << Warlock
    .train 416015 >>使用 |T134419:0|t[|cRXP_FRIENDLY_灼烧符文|r] 来训练 |T135789:0|t[灼烧] << Warlock
    .train 403919 >>使用|T134419:0|t[|cRXP_FRIENDLY_ 噩梦符文|r]来训练 |T236298:0|t[诅咒之魂] << Warlock
    .use 208799 << Mage --Spell Notes: Living Bomb
    .use 203748 << Mage --Spell Notes: Burnout
    .use 225690 << Mage --Spell Notes: Frozen Orb
    .use 206168 << Hunter --Rune of the Chimera
    .use 210818 << Hunter --Rune of Lone Wolf
    .use 213124 << Hunter --Rune of Close Combat
    .use 226252 << Hunter --Rune of the Guerrilla
    .use 216770 << Hunter --Treatise on Aspect of the Viper
    .use 204806 << Warrior --Rune of Victory Rush
    .use 205215 << Warlock --Rune of Tactics
    .use 210824 << Warlock --Rune of the Pact
    .use 211477 << Warlock --Rune of Incinerate
    .use 205230 << Warlock --Rune of Haunting
step << Mage
    #season 2
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德林·怒流|r交谈
    >>出售垃圾
    >>|cRXP_BUY_从他那里购买 10|r|T132794:0|t[清凉的泉水]|r
    >>|cRXP_WARN_如果你没有足够的钱, 可以额外击杀|cRXP_ENEMY_破旧幼狼|r来刷取|r
    >>|cRXP_WARN_确保你留出10铜币以备后用|r
    .collect 159,10 --Collect Refreshing Spring Water (x10)
    .target Adlin Pridedrift
    .xp >6,1
step << !Priest !Mage !Warlock !Warrior !Rogue
    #completewith next << !Hunter
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德林·怒流|r交谈
    >>出售垃圾 << Hunter
    >>|cRXP_BUY_从他那里购买 600|r|T132384:0|t[轻弹丸]|r << Hunter
    .vendor >>|cRXP_WARN_出售垃圾|r << !Hunter
    .collect 2516,600 << Hunter --Light Shot (600)
    .target Adlin Pridedrift
    .xp >6,1
step
    .goto Dun Morogh,29.927,71.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    >>|cRXP_WARN_请务必装备此任务获得的手套, 以便为其刻印符文|r
    .turnin 179 >>交任务: |cRXP_FRIENDLY_矮人的交易|r
    .accept 233 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .accept 3106 >>接任务: |cRXP_LOOT_简易符文|r << Dwarf Warrior
    .accept 3107 >>接任务: |cRXP_LOOT_神圣符文|r << Dwarf Paladin
    .accept 3108 >>接任务: |cRXP_LOOT_风蚀符文|r << Dwarf Hunter
    .accept 3109 >>接任务: |cRXP_LOOT_密文符文|r << Dwarf Rogue
    .accept 3110 >>接任务: |cRXP_LOOT_神圣符文|r << Dwarf Priest
    .accept 3112 >>接任务: |cRXP_LOOT_简易备忘录|r << Gnome Warrior
    .accept 3113 >>接任务: |cRXP_LOOT_密文备忘录|r << Gnome Rogue
    .accept 3114 >>接任务: |cRXP_LOOT_雕文备忘录|r << Gnome Mage
    .accept 3115 >>接任务: |cRXP_LOOT_被污染的备忘录|r << Gnome Warlock
    .target Sten Stoutarm
step << Priest/Paladin/Rogue
    .goto Dun Morogh,29.47,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>|cRXP_BUY_购买以下所有符文:|r
    .collect 210979,1 << Rogue --Rune of Shadowstep
    .collect 221428,1 << Rogue --Rune of Foul Play
    .collect 204795,1 << Rogue --Rune of Shadowstrike
    .collect 208772,1 << Rogue --Rune of Saber Slash
    .collect 227922,1 << Rogue --Rune of the Swashbuckler
    .collect 212552,1 << Priest --Psychosophic Epiphany
    .collect 205940,1 << Priest --Memory of a Dark Purpose
    .collect 205951,1 << Priest --Memory of a Troubled Acolyte
    .collect 205932,1 << Priest --Prophecy of a King's Demise
    .collect 235600,1 << Paladin --Rune of Divine Storm
    .collect 211488,1 << Paladin --Rune of the Avenger
    .collect 235602,1 << Paladin --Rune of the Hammer of the Righteous
    .collect 235604,1 << Paladin --Rune of the Shield of Righteousness
    >>你很快就会得到剩下的符文
    .target Rune Broker
    .skipgossip
step << Priest/Paladin/Rogue
    .train 400101 >>使用 |T134419:0|t[|cRXP_FRIENDLY_ 阴影步符文|r] 来训练 |T132303:0|t[阴影步] << Rogue
    .train 432301 >>使用|T134419:0|t[|cRXP_FRIENDLY_卑鄙行径符文|r]来训练|T236285:0|t[不公平优势] << Rogue
    .train 400105 >>使用|T134419:0|t[|cRXP_FRIENDLY_暗影之击符文|r]来训练|T132323:0|t[暗影之击] << Rogue
    .train 424984 >>使用|T134419:0|t[|cRXP_FRIENDLY_萨伯尔斩符文|r]来训练|T132375:0|t[萨伯尔斩] << Rogue
    .train 415922 >>使用|T134419:0|t[|cRXP_FRIENDLY_ 海盗符文|r]来训练|T134538:0|t[火枪] << Rogue
    .train 431663 >>使用|T135791:0|t[心灵顿悟]来训练|T136181:0|t[心灵尖刺] << Priest
    .train 425216 >>使用|T136222:0|t[|cRXP_FRIENDLY_黑暗记忆|r]来训练|T237514:0|t[虚空瘟疫] << Priest
    .train 402862 >>使用|T136222:0|t[|cRXP_FRIENDLY_侍僧的回忆|r]来训练|T237545:0|t[忏悔] << Priest
    .train 402849 >>使用|T135975:0|t[|cRXP_FRIENDLY_国王之死的预言|r]来训练|T136149:0|t[暗影之言:死亡] << Priest
    .train 410014 >>使用|T134419:0|t[|cRXP_FRIENDLY_神圣风暴符文|r]来训练|T236250:0|t[神圣风暴] << Paladin
    .train 410008 >>使用|T134419:0|t[|cRXP_FRIENDLY_ 复仇者之符|r]来训练|T135874:0|t[复仇者之盾] << Paladin
    .train 410013 >>使用|T134419:0|t[|cRXP_FRIENDLY_正义之锤的符文|r]来训练 |T236253:0|t[正义之锤] << Paladin
    .train 440788 >>使用|T134419:0|t[|cRXP_FRIENDLY_正义之盾符文|r]来训练|T236265:0|t[正义之盾] << Paladin
    .use 210979 << Rogue --Rune of Shadowstep
    .use 221428 << Rogue --Rune of Foul Play
    .use 204795 << Rogue --Rune of Shadowstrike
    .use 208772 << Rogue --Rune of Saber Slash
    .use 227922 << Rogue --Rune of the Swashbuckler
    .use 212552 << Priest --Psychosophic Epiphany
    .use 205940 << Priest --Memory of a Dark Purpose
    .use 205951 << Priest --Memory of a Troubled Acolyte
    .use 205932 << Priest --Prophecy of a King's Demise
    .use 235600 << Paladin --Rune of Divine Storm
    .use 211488 << Paladin --Rune of the Avenger
    .use 235602 << Paladin --Rune of the Hammer of the Righteous
    .use 235604 << Paladin --Rune of the Shield of Righteousness
step << Mage
    #optional
    #sticky
    .engrave 15 >>留意任何披风掉落. 一旦获得, 用|T135851:0|t[冰霜宝珠]对其进行附魔
    >>|cRXP_WARN_这个法术极其强大|r
step << Mage/Hunter/Priest
    .equip 10 >>装备 |T132939:0|t[驯狼手套] << Hunter
    .equip 10 >>装备 |T132940:0|t[驯兔手套] << Mage
    .use 6171 << Hunter --Wolf Handler Gloves
    .use 719 << Mage --Rabbit Handler Gloves
    .engrave 10 >>在你的手套上刻印|T236176:0|t[幻影射击] << Hunter
    .engrave 7 >>在你的裤子上刻上[活火] << Mage
    .engrave 10 >>在你的手套上刻上|T236220:0|t[活体炸弹] << Mage
    .engrave 5 >>在你的胸前刻上|T236207:0|t[燃尽] << Mage
step << Priest/Mage/Warlock
    #season 2
    #xprate <1.1
    #completewith EnterAnvilmar
    .goto 1426,27.096,72.545,0
    .goto 1426,26.620,73.548,0
    .goto 1426,25.722,72.261,0
    .goto 1426,24.878,72.329,0
    .goto 1426,24.100,73.749,0
    .goto 1426,24.920,74.697,0
    .goto 1426,21.813,72.584,0
    .goto 1426,19.578,72.086,0
    .goto 1426,20.627,70.415,0
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob Rockjaw Trogg
    .mob Burly Rockjaw Trogg
step << Hunter
    #sticky
    #optional
    >>|cRXP_WARN_请注意任何|r胸甲/腰带/披风|cRXP_WARN_掉落|r|cRXP_WARN_. 装备它们并刻上相应的符文|r
    .engrave 5 >>在你的胸甲上刻上[独狼]
    .engrave 6 >>刻印 |T132394:0|t[近战专家] 在你的 |T132513:0|t[腰带] 上
    .engrave 15 >>在你的|T133771:0|t[斗篷]上刻上|T132171:0|t[突袭]
step << Paladin
    #completewith next
    +击杀更多|cRXP_ENEMY_Wolves|r或|cRXP_ENEMY_Troggs|r, 直到你获得价值88铜的垃圾物品. |cRXP_WARN_你将很快需要用它们来购买武器|r
    .money 0.0088
    .goto 1426,29.529,73.286,0
    .goto 1426,28.117,75.088,0
    .goto 1426,28.557,72.487,0
    .goto 1426,29.529,73.286,60,0
    .goto 1426,29.054,74.608,60,0
    .goto 1426,28.558,75.781,60,0
    .goto 1426,28.117,75.088,60,0
    .goto 1426,27.562,74.331,60,0
    .goto 1426,27.793,73.123,60,0
    .goto 1426,28.557,72.487,60,0
step << !Hunter !Mage
    #season 2
    #label EnterAnvilmar
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12,0
    .goto 1426,28.642,68.375,12 >>进入安威玛尔 << Rogue/Warlock/Paladin
    .goto 1426,28.939,68.387,12 >>进入安威玛尔 << !Rogue !Warlock !Paladin
step << Paladin
    #season 2
    .goto Dun Morogh,28.833,68.332
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r交谈, 他在里面
    .turnin 3107 >>交任务: |cRXP_FRIENDLY_神圣符文|r << Dwarf
    .accept 77657 >>接受圣光遗物 << Dwarf
    .turnin 77657 >>交还光明圣物 << Dwarf
    .target Bromos Grummner
step << Paladin
    .goto Dun Morogh,28.79,67.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦德尔·哈金|r交谈
    >>|cRXP_WARN_由于早期盾牌符文的强大效果, 使用盾牌和单手武器升级会快得多|r
    >>|cRXP_BUY_出售垃圾并购买|r|T134955:0|t[小盾牌]
    .collect 17184,1 --Small Shield (1)
    .target Grundel Harkin
step << Paladin
    .goto Dun Morogh,28.66,67.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷布莱德·寒椅|r交谈
    >>|cRXP_WARN_由于早期盾牌符文的强大效果, 使用盾牌和单手武器升级会快得多|r
    >>|cRXP_BUY_出售垃圾并购买|r|T133485:0|t[短棍]
    .collect 2130,1 --Club (1)
    .target Rybrad Coldbank
step << Paladin
    #sticky
    >>|cRXP_WARN_请注意任何|r|T132624:0|t[胸甲]|cRXP_WARN_和|r|T132602:0|t[护腕]|cRXP_WARN_或|r|T133762:0|t[披风]|cRXP_WARN_您可装备的物品|r
    .engrave 5 >>在你的胸前刻上|T236250:0|t[神圣风暴]
    .engrave 9 >>在你的护腕上刻上 |T236253:0|t[正义之锤]
    .engrave 15 >>在你的斗篷上刻印|T236265:0|t[正义之盾]
step << Paladin
    #optional
    #completewith next
    .equip 16,2130 >>装备 |T133485:0|t[短棍]
    .equip 17,17184 >>装备 |T134955:0|t[小盾牌]
    .use 2130 --Club
    .use 17184 --Small Shield
step << Warlock
    #season 2
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_阿拉玛尔·格里姆|r交谈
    >>|cRXP_WARN_你目前还不需要训练法术, 它们不如符文实用|r
    .accept 1599 >>接任务: |cRXP_LOOT_开端|r
    .turnin 3115 >>交任务: |cRXP_FRIENDLY_被污染的备忘录|r << Gnome
    .accept 77666 >>接任务: |cRXP_WARN_失窃的力量|r << Gnome
    .turnin 77666 >>交任务: |cRXP_FRIENDLY_失窃的力量|r << Gnome
    .target Alamar Grimm
step << Warrior
    #season 2
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_内|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .turnin 3106 >>交任务: |cRXP_FRIENDLY_简易符文|r << Dwarf
    .turnin 3112 >>交任务: |cRXP_FRIENDLY_简易备忘录|r << Gnome
    .accept 77655 >>接受失落的符文 << Dwarf
    .turnin 77655 >>交还失落的符文 << Dwarf
    .accept 77656 >>接受失落的符文 << Gnome
    .turnin 77656 >>交还失落的符文 << Gnome
    .train 6673 >>训练 |T132333:0|t[战斗怒吼]
    .target Thran Khorman
step << Rogue
    #season 2
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索姆·哈格林|r交谈
    .turnin 3109 >>交任务: |cRXP_FRIENDLY_密文符文|r << Dwarf
    .turnin 3113 >>交任务: |cRXP_FRIENDLY_密文备忘录|r << Gnome
    .accept 77658 >>接受“三度被盗” << Dwarf
    .turn in 77658 >>上交三度被盗的物品 << Dwarf
    .accept 77659 >>接受“三度被盗” << Gnome
    .turnin 77659 >>交还三次被盗的物品 << Gnome
    .train 1784 >>训练 |T132320:0|t[潜行]
    .target Solm Hargrin
step << Priest/Rogue
    .goto Dun Morogh,28.77,66.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    >>如果你没有足够的钱购买这两件物品|cRXP_WARN_(60铜)|r, 请击杀更多的|cRXP_ENEMY_狼|r << Priest
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    >>出售垃圾并购买|T132495:0|t[薄布腰带]和|T132543:0|t[薄布靴], 你很快就会用它们来刻印符文 << Priest
    >>出售垃圾并购买 |T132495:0|t[薄布腰带] 和 |T132602:0|t[薄布护腕], 你很快就会用它们来刻印符文 << Rogue
    .collect 3599,1 --Thin Cloth Belt (1)
    .collect 2117,1 << Priest --Thin Cloth Shoes (1)
    .collect 3600,1 << Rogue --Thin Cloth Bracers (1)
    .target Durnan Furcutter
step << Rogue
    .equip 6 >>装备 |T132495:0|t[薄布腰带]
    .equip 9 >>装备 |T132602:0|t[薄布护腕]
    .equip 10 >>装备 |T132952:0|t[破损的皮手套]
    .engrave 6 >>在你的腰带上刻上|T132303:0|t[影步]
    .engrave 9 >>在你的护腕上刻印【不公平优势】|T236285:0|t
    .engrave 10 >>在你的手套上刻上|T132375:0|t[Saber Slash]
    .use 3599 --Thin Cloth Belt
    .use 3600 --Thin Cloth Bracers
    .use 2125 --Cracked Leather Gloves
step << Rogue
    #optional
    #sticky
    .engrave 15 >>留意任何斗篷的掉落. 一旦获得, 就在上面刻上 |T134538:0|t[猎枪]
    >>|cRXP_WARN_这是一个非常强力的范围劈砍技能|r
step << Priest
    #season 2
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰斯托克·卡德尔|r对话, 他在里面
    >>|cRXP_WARN_训练|r|T135987:0|t[真言术:坚韧]|cRXP_WARN_as 你很快就会需要它来完成一个职业任务|r << Dwarf
    .turnin 3110 >>交任务: |cRXP_FRIENDLY_神圣符文|r << Dwarf
    .accept 77661 >>接任务: |cRXP_WARN_圣光之思|r << Dwarf
    .turnin 77661 >>交任务: |cRXP_FRIENDLY_圣光之思|r << Dwarf
    .target Branstock Khalder
step << Gnome Warlock/Dwarf Priest
    #season 2
    #label GlovesEquip
    #completewith Observations
    .equip 10,711 >>|cRXP_WARN_装备|r|T132961:0|t[破布手套]
    .use 711
    .train 402862,3 << Priest
    .train 403919,3 << Warlock
step << Gnome Warlock
    #season 2
    #requires GlovesEquip
    #completewith Observations
    .engrave 10 >>|cRXP_WARN_将你的|r|T132961:0|t[破布手套] 雕刻为|r|T133816:0|t[雕文手套 - 幽魂] << Warlock
    .train 403919,3 << Warlock
step << Priest/Paladin
    .engrave 6 >>在你的腰带上刻上|T136181:0|t[心灵尖刺] << Priest
    .engrave 8 >>在你的靴子上刻上|T237514:0|t[虚空瘟疫] << Priest
    .engrave 10 >>在你的手套上刻印「暗影之言:死」|T136149:0|t << Priest
    .engrave 7 >>在你的裤子上刻上|T135874:0|t[复仇者之盾] << Paladin
    .engrave 10 >>在你的手套上刻印|T135891:0|t[十字军打击] << Paladin
step << Warlock
    .goto Dun Morogh,28.77,66.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    >>|cRXP_BUY_出售垃圾并购买|r|T132602:0|t[薄布护腕]|cRXP_BUY_和|r|T132543:0|t[薄布靴]|cRXP_BUY_, 你将需要用它们来不久后刻印符文|r << Warlock
    .collect 3600,1 << Warlock --Thin Cloth Bracers (1)
    .collect 2117,1 << Warlock --Thin Cloth Shoes (1)
    .target Durnan Furcutter
step << Warrior/Warlock
    .equip 10 >>装备 |T132938:0|t[无光泽的链甲手套] << Warrior
    .engrave 10 >>在你的手套上刻上[胜利冲刺]|T132342:0|t << Warrior
    .use 2385 << Warrior -- Tarnished Chain Gloves
    .use 2125 << Rogue --Cracked Leather Gloves
    .equip 9 >>装备 |T132602:0|t[薄布护腕] << Warlock
    .equip 10 >>装备 |T132543:0|t[薄布靴] << Warlock
    .use 3600 << Warlock --Thin Cloth Bracers
    .use 2117 << Warlock --Thin Cloth Shoes
    .engrave 5 >>在你的胸口刻上|T136150:0|t[恶魔战术] << Warlock
    .engrave 7 >>在你的裤子上刻上|T237562:0|t[恶魔契约] << Warlock
    .engrave 9 >>在你的护腕上刻上[灼烧] |T135789:0|t << Warlock
    .engrave 8 >>在你的靴子上刻上[暗影之焰]|T236302:0|t << Warlock
step << !Paladin !Hunter
    #season 2 << !Warlock --Only Warlock is inside Anvilmar in Era at this step
    #optional
    #completewith Talin
    .goto 1426,28.792,68.804,12 >>离开安威玛尔
    .subzoneskip 77,1
step
    #xprate <1.1
    #completewith Rockjaw
    .goto 1426,27.096,72.545,0
    .goto 1426,26.620,73.548,0
    .goto 1426,25.722,72.261,0
    .goto 1426,24.878,72.329,0
    .goto 1426,24.100,73.749,0
    .goto 1426,24.920,74.697,0
    .goto 1426,21.813,72.584,0
    .goto 1426,19.578,72.086,0
    .goto 1426,20.627,70.415,0
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob Rockjaw Trogg
    .mob Burly Rockjaw Trogg
step
#season 2
    #label Talin
    .goto Dun Morogh,22.601,71.433
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .turnin 233 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
    .accept 234 >>接任务: |cRXP_LOOT_寒脊山谷的送信任务|r
    .target Talin Keeneye
step << Paladin/Warlock/Hunter
    #xprate <1.1
    .goto 1426,27.858,76.482,0
    .goto 1426,30.727,76.831,0
    .goto 1426,29.280,75.500,0
    .goto 1426,27.858,76.482,50,0
    .goto 1426,28.946,77.153,50,0
    .goto 1426,29.716,77.605,50,0
    .goto 1426,30.727,76.831,50,0
    .goto 1426,32.814,75.221,50,0
    .goto 1426,31.138,74.048,50,0
    .goto 1426,30.077,74.479,50,0
    .goto 1426,29.280,75.500,50,0
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob Rockjaw Trogg
    .mob Burly Rockjaw Trogg
step << Paladin/Warlock
    #xprate <1.5
    #loop
    .goto 1426,23.595,72.462,0
    .goto 1426,26.117,74.469,0
    .goto 1426,26.832,74.649,0
    .goto 1426,26.884,72.733,0
    .goto 1426,23.595,72.462,50,0
    .goto 1426,24.290,73.406,50,0
    .goto 1426,24.642,74.138,50,0
    .goto 1426,26.117,74.469,50,0
    .goto 1426,26.832,74.649,50,0
    .goto 1426,26.884,72.733,50,0
    .xp 3+1130 >>升级至1130+/1400经验值
step << Paladin/Warlock
    #xprate >1.49
    #loop
    .goto 1426,23.595,72.462,0
    .goto 1426,26.117,74.469,0
    .goto 1426,26.832,74.649,0
    .goto 1426,26.884,72.733,0
    .goto 1426,23.595,72.462,50,0
    .goto 1426,24.290,73.406,50,0
    .goto 1426,24.642,74.138,50,0
    .goto 1426,26.117,74.469,50,0
    .goto 1426,26.832,74.649,50,0
    .goto 1426,26.884,72.733,50,0
    .xp 3+995 >>升级至995/1400经验值
step
    #label Rockjaw
    .goto 1426,25.077,75.711
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 234 >>交任务: |cRXP_FRIENDLY_寒脊山谷的送信任务|r
    .accept 182 >>接任务: |cRXP_LOOT_巨魔洞穴|r
    .target Grelin Whitebeard
step << Paladin/Warlock/Hunter
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    >>|cRXP_WARN_这将启动任务的5分钟计时器. 接下来的5分钟内请勿离开或退出游戏|r
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    .target Nori Pridedrift
step << Hunter/Paladin
    .goto 1426,25.861,78.197,0
    .goto 1426,23.716,80.257,0
    .goto 1426,20.671,75.838,0
    .goto 1426,25.861,78.197,45,0
    .goto 1426,26.382,78.409,45,0
    .goto 1426,26.031,79.854,45,0
    .goto 1426,23.716,80.257,45,0
    .goto 1426,22.836,79.962,45,0
    .goto 1426,22.684,78.888,45,0
    .goto 1426,21.029,76.459,45,0
    .goto 1426,20.671,75.838,45,0
    >>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .mob Frostmane Troll Whelp
step << Hunter
    .goto 1426,25.861,78.197,0
    .goto 1426,23.716,80.257,0
    .goto 1426,20.671,75.838,0
    .xp 4 >>升级到4级
step << Warlock
#season 2
#completewith next
    .goto Dun Morogh,26.85,79.83,20 >>进入巨魔洞窟
step << Warlock
#loop
#season 2
    #label Feathers
    .goto 1426,28.696,83.148,0
    .goto 1426,30.216,80.254,0
    .goto 1426,28.696,83.148,40,0
    .goto 1426,28.999,82.504,40,0
    .goto 1426,29.298,81.579,15,0
    .goto 1426,29.041,81.168,40,0
    .goto 1426,30.055,82.385,40,0
    .goto 1426,30.381,80.766,40,0
    .goto 1426,30.216,80.254,40,0
    >>击杀巨魔洞穴内的霜鬃巨魔新兵, 从他们身上搜刮羽毛咒符
    >>|cRXP_WARN_你正在倒计时中. 请勿离开或退出游戏|r
    .complete 1599,1 --Collect Feather Charm (x3)
    .mob Frostmane Novice
step << Warlock/Hunter/Paladin
    #season 2
    #completewith next
    >>|cRXP_WARN_请确保出售物品后至少保留一枚银币. 你需要它来学习|r|T132204:0|t[蛇毒钉刺] << Hunter
    .hs >>炉石到安威玛尔
step << Paladin/Warlock/Hunter
    #optional
    #completewith next
    #label EnterAnvilmar
    .goto 1426,28.792,68.804,12,0
    >>|cRXP_WARN_你有5分钟时间在|r|T132791:0|t[邓肯的炽热晨酿]|cRXP_WARN_expires前返回安威玛尔|r
    .goto 1426,28.939,68.387,20 >>进入安威玛尔
step << Hunter
    #optional
    #completewith HTraining
    #requires EnterAnvilmar
    .goto Dun Morogh,28.77,66.37,0
    .vendor >>|cRXP_BUY_考虑从铁砧堡内的|cRXP_FRIENDLY_德南·弗卡特|r处购买缺失的装备部件, 并在其上雕刻|T134419:0|t|cRXP_WARN_[符文]|r|r
step << Paladin/Warlock/Hunter
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r对话, 他在里面
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .vendor >>出售垃圾
    .target Durnan Furcutter
    .isQuestAvailable 317
step << Hunter
    #season 2
    #label HTraining
    .goto Dun Morogh,29.175,67.455
    .target Thorgas Grimson
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索加斯·格瑞姆森|r交谈
    .turnin 3108 >>交任务: |cRXP_FRIENDLY_风蚀符文|r << Dwarf
    .accept 77660 >>接受“穿越洞穴”任务 << Dwarf
    .turnin 77660 >>提交“穿越洞穴”任务 << Dwarf
    .train 1978 >>训练 |T132204:0|t[蛇毒之刺]
step << Paladin
    #season 2
    .goto Dun Morogh,28.833,68.332
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r交谈, 他在里面
    >>|cRXP_WARN_如果你还没有找到任何|r|T132624:0|t[胸甲]|cRXP_WARN_或|r|T132602:0|t[护腕]|cRXP_WARN_, 请从安威玛尔内的商人那里购买它们, 而不是花钱去学习训练法术. 符文比你能买到的法术更强大|r
    .train >>训练你的职业法术
    .target Bromos Grummner
step << Warlock
    #season 2
    .goto Dun Morogh,28.650,66.145
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_阿拉玛尔·格里姆|r交谈
    .turnin 1599 >>交任务: |cRXP_FRIENDLY_开端|r
    .target Alamar Grimm
step << Paladin/Warlock/Hunter
    #hardcore
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12 >>离开安威玛尔
    .subzoneskip 77,1
step << Paladin/Warlock/Hunter
    #xprate <1.1
    .goto Dun Morogh,29.709,71.255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .turnin 170 >>交任务: |cRXP_FRIENDLY_新的威胁|r
    .target Balir Frosthammer
step << !Paladin !Warlock !Hunter
    #xprate <1.1
    #sticky
    #label TroggEnd
    .goto 1426,24.193,77.305,0
    .goto 1426,22.529,74.512,0
    .goto 1426,24.288,73.154,0
    .goto 1426,29.303,77.337,0
    .waypoint 1426,24.193,77.305,55,0
    .waypoint 1426,23.497,76.707,55,0
    .waypoint 1426,22.828,76.017,55,0
    .waypoint 1426,22.529,74.512,55,0
    .waypoint 1426,22.735,73.285,55,0
    .waypoint 1426,23.616,72.634,55,0
    .waypoint 1426,24.288,73.154,55,0
    .waypoint 1426,24.619,74.280,55,0
    .waypoint 1426,25.920,74.571,55,0
    .waypoint 1426,28.812,76.397,55,0
    .waypoint 1426,29.303,77.337,55,0
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob Rockjaw Trogg
    .mob Burly Rockjaw Trogg
step << !Paladin !Hunter
    #loop
    #label TrollWhelps
    .goto 1426,25.861,78.197,0
    .goto 1426,23.716,80.257,0
    .goto 1426,20.671,75.838,0
    .goto 1426,25.861,78.197,45,0
    .goto 1426,26.382,78.409,45,0
    .goto 1426,26.031,79.854,45,0
    .goto 1426,23.716,80.257,45,0
    .goto 1426,22.836,79.962,45,0
    .goto 1426,22.684,78.888,45,0
    .goto 1426,21.029,76.459,45,0
    .goto 1426,20.671,75.838,45,0
    >>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .mob Frostmane Troll Whelp
step
    #requires TroggEnd << !Paladin !Warlock !Hunter
    .goto Dun Morogh,25.076,75.713
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
    .accept 218 >>接任务: |cRXP_LOOT_被窃取的日记|r
    .target Grelin Whitebeard
step << Paladin/Warlock/Hunter
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .turnin 3365 >>交任务: |cRXP_FRIENDLY_归还酒杯|r
    .target Nori Pridedrift
step << !Paladin !Warlock !Hunter
    #softcore
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    >>|cRXP_WARN_这将启动任务的5分钟计时器. 接下来的5分钟内请勿离开或退出游戏|r
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    .target Nori Pridedrift
step << !Paladin !Warlock !Hunter
    #softcore
    #completewith next
    +|cRXP_WARN_你有5分钟时间获取|cRXP_LOOT_Grelin Whitebeard's Journal|r, 并在|r|T132791:0|t[Duncan's Scalding Mornbrew]|cRXP_WARN_过期前返回安威玛尔|r
    >>|cRXP_WARN_如果你没能完成任务, 也不用担心, 因为稍后可以重新获得这个任务|r
step
    #optional
    #label FrostMCave1
    #completewith Grelin
    .goto 1426,27.098,80.707,20 >>进入霜鬃洞穴
step
    #optional
    #requires FrostMCave1
    #completewith Grelin
    .goto 1426,28.298,79.836,15,0
    .goto 1426,29.252,79.043,15,0
    .goto 1426,30.489,80.165,50 >>前往|cRXP_ENEMY_Grik'nir the Cold|r所在区域
step
    #sticky << Rogue/Hunter
    #label Grelin
    .goto 1426,30.489,80.165,0,0
    >>击杀位于室内的|cRXP_ENEMY_Grik'nir the Cold|r, 搜刮其尸体获得|cRXP_LOOT_Grelin Whitebeard's Journal|r
    >>|cRXP_WARN_尽量确保在出售物品后剩下2银. 你很快就会需要用它来学习法术|r << Warrior
    .complete 218,1 --Collect Grelin Whitebeard's Journal (x1)
    .mob Grik'nir the Cold
--XXSOD xpgate for early 6 training?
step << Rogue
    #season 2
    #hardcore
    .train 400105 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[暗影之击符文]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 暗影之击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
--XX HC as softcore have timed quest turnin in Anvilmar (softcore rogues do it after turnin)
step << !Paladin !Warlock !Hunter
    #softcore
    #requires Grelin << Rogue
    #completewith next
    >|cRXP_WARN_>Make sure you will have two silver after vendoring to be able to train level 4 spells|r << Warrior
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step
    #hardcore << !Paladin !Warlock !Hunter
    #optional
    #requires Grelin << Rogue/Hunter
    #completewith Stolen
    .goto 1426,29.252,79.043,15,0
    .goto 1426,28.298,79.836,15,0
    .goto 1426,27.098,80.707,20 >>离开霜鬃洞穴
    .subzoneskip 132
--XX HC only unless you're a Paladin, Warlock, or Hunter
step << !Paladin !Warlock !Hunter
    #hardcore
    #requires Grelin << Rogue
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    .target Nori Pridedrift
step
    #hardcore << !Paladin !Warlock !Hunter
    #requires Grelin << Rogue/Hunter
    #label Stolen
    .goto Dun Morogh,25.075,75.715
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 282 >>接任务: |cRXP_LOOT_森内尔的观察站|r
    .target Grelin Whitebeard
step << !Paladin !Warlock !Hunter
    #softcore
    #requires Grelin << Rogue
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    >>|cRXP_WARN_如果任务失败, 请跳过此步骤|r
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .vendor >>出售垃圾
    .target Durnan Furcutter
    .isOnQuest 3364
step << !Paladin !Warlock !Hunter
    #optional
    #softcore
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .vendor >>出售垃圾
    .target Durnan Furcutter
    .isQuestTurnedIn 3364
    .isQuestAvailable 317
step << !Paladin !Warlock !Hunter
    #softcore
    #requires Grelin << Rogue
    .abandon 3364 >>放弃滚烫晨 Brew 的配送任务. 稍后会再次拾取
step << Rogue
    #season 2
    #softcore
    .train 400105 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[暗影之击符文]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 暗影之击]
    .use 204795
    .itemcount 204795,1 --Rune of Shadowstrike (1)
step << Rogue
    #season 2
    #softcore
    #completewith Observations
    #label Shadowstrike1
    .equip 10 >>|cRXP_WARN_装备一双|r|T132952:0|t|cRXP_LOOT_[手套]|r|cRXP_WARN_如果你已拥有或拾取了一双|r
    .train 400105,3
step << Rogue
    #season 2
    #softcore
    #completewith Observations
    #requires Shadowstrike1
    .engrave 10 >>|cRXP_WARN_刻印你的|r |T132952:0|t|cRXP_LOOT_[手套]|r为|r |T133816:0|t[刻印手套 - 暗影之击]
    .train 400105,3
step << !Paladin !Warlock !Hunter
    #softcore
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r和|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .accept 3364 >>接任务: |cRXP_LOOT_热酒快递|r
    .goto Dun Morogh,24.980,75.963
    .target +Nori Pridedrift
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 282 >>接任务: |cRXP_LOOT_森内尔的观察站|r
    .goto Dun Morogh,25.075,75.715
    .target +Grelin Whitebeard
    .isQuestAvailable 3364
step << !Paladin !Warlock !Hunter
    #softcore
    #optional
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
    .target Durnan Furcutter
step << !Paladin !Warlock !Hunter
    #hardcore
    .goto Dun Morogh,28.769,66.377
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德南·弗卡特|r交谈
    .turnin 3364 >>交任务: |cRXP_FRIENDLY_热酒快递|r
    .accept 3365 >>接任务: |cRXP_LOOT_归还酒杯|r
--  .vendor >>出售垃圾
    .target Durnan Furcutter
    .isQuestAvailable 317




----Start of >1.59x training section----




step << Mage
    #xprate >1.59
    #season 0,1
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .turnin 3114 >>交任务: |cRXP_FRIENDLY_雕文备忘录|r << Gnome
    .trainer >>训练你的职业法术
    .target Marryk Nurribit
step << Mage
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .turnin 3114 >>交任务: |cRXP_FRIENDLY_雕文备忘录|r << Gnome
    .accept 77667 >>接受法术研究 << Gnome
    .turnin 77667 >>提交法术研究 << Gnome
    .trainer >>训练你的职业法术
    .target Marryk Nurribit
step << Rogue
    #xprate >1.59
    #season 0,1
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索姆·哈格林|r交谈
    .turnin 3113 >>交任务: |cRXP_FRIENDLY_密文备忘录|r << Gnome
    .turnin 3109 >>交任务: |cRXP_FRIENDLY_密文符文|r << Dwarf
    .train 1784 >>训练 |T132320:0|t[潜行]
    .trainer >>训练你的职业法术
    .target Solm Hargrin
step << Priest
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰斯托克·卡德尔|r交谈
    .accept 5626 >>接任务: |cRXP_LOOT_圣光的恩赐|r << Dwarf
    .target Branstock Khalder
step << Warrior
    #xprate >1.59
    #season 0,1
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .turnin 3106 >>交任务: |cRXP_FRIENDLY_简易符文|r << Dwarf
    .turnin 3112 >>交任务: |cRXP_FRIENDLY_简易备忘录|r << Gnome
    .trainer >>训练你的职业法术
    .target Thran Khorman
step << Warrior
    #xprate >1.59
    #season 2
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    >>如果你还有2个银色列车 |T132155:0|t [Rend]
    .train 100,1 << Warrior --Charge
    .target Thran Khorman





----End of >1.59x training section----
----Start of <1.59x training section----





step << Mage
    #xprate <1.59
    #season 0,1
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .turnin 3114 >>交任务: |cRXP_FRIENDLY_雕文备忘录|r << Gnome
    .train 1459 >>训练 |T135932:0|t[奥术智慧]
    .train 116 >>训练 |T135846:0|t[冰箭]
    .target Marryk Nurribit
step << Mage
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .turnin 3114 >>交任务: |cRXP_FRIENDLY_雕文备忘录|r << Gnome
    .accept 77667 >>接受法术研究 << Gnome
    .train 1459 >>训练 |T135932:0|t[奥术智慧]
    .train 116 >>训练 |T135846:0|t[冰箭]
    .target Marryk Nurribit
step << Gnome Mage
    #xprate <1.59
    #season 2
    #completewith next
    .train 401760 >>|cRXP_WARN_使用|r|T134939:0|t|cRXP_LOOT_[法术笔记:卡勒·恩奇]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 寒冰之枪]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
step << Gnome Mage
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r, 他在里面
    .turnin 77667 >>提交法术研究
    .target Marryk Nurribit
step << Gnome Mage
    #xprate <1.59
    #season 2
    #label GlovesEquip
    #completewith Observations
    .equip 10,711 >>|cRXP_WARN_装备|r|T132961:0|t[破布手套]
    .use 711
    .train 401760,3
step << Gnome Mage
    #xprate <1.59
    #season 2
    #requires GlovesEquip
    #completewith Observations
    .engrave 10 >>|cRXP_WARN_将你的|r|T132961:0|t[破布手套] 雕刻为|r|T133816:0|t[雕文手套 - 寒冰之枪]
    .train 401760,3
step << Rogue
    #xprate <1.59
    #season 0,1
    .goto Dun Morogh,28.369,67.513
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索姆·哈格林|r交谈
    .turnin 3113 >>交任务: |cRXP_FRIENDLY_密文备忘录|r << Gnome
    .turnin 3109 >>交任务: |cRXP_FRIENDLY_密文符文|r << Dwarf
    .train 1784 >>训练 |T132320:0|t[潜行]
    .target Solm Hargrin
step << Priest
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.600,66.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰斯托克·卡德尔|r交谈
    .train 589 >>训练 |T136207:0|t[暗言术:痛]
    .target Branstock Khalder
step << Warrior
    #xprate <1.59
    #season 0,1
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .turnin 3106 >>交任务: |cRXP_FRIENDLY_简易符文|r << Dwarf
    .turnin 3112 >>交任务: |cRXP_FRIENDLY_简易备忘录|r << Gnome
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Thran Khorman
step << Warrior
    #xprate <1.59
    #season 2
    .goto Dun Morogh,28.832,67.242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯兰·库尔曼|r交谈
    .turnin 77655 >>交还失落的符文 << Dwarf
    .turnin 77656 >>交还失落的符文 << Gnome
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Thran Khorman




----End of <1.59x training section----





step << !Paladin !Warlock !Hunter
    #optional
    #completewith Stolen
    .goto 1426,28.831,68.698,12 >>离开安威玛尔
    .subzoneskip 77,1
step << !Paladin !Warlock !Hunter
    #xprate <1.1
    .goto Dun Morogh,29.709,71.255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .turnin 170 >>交任务: |cRXP_FRIENDLY_新的威胁|r
    .target Balir Frosthammer
step << !Paladin !Warlock !Hunter
    #softcore
    #label Stolen
    .goto Dun Morogh,25.075,75.715
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 282 >>接任务: |cRXP_LOOT_森内尔的观察站|r
    .target Grelin Whitebeard
step << !Paladin !Warlock !Hunter
    .goto Dun Morogh,24.980,75.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .turnin 3365 >>交任务: |cRXP_FRIENDLY_归还酒杯|r
    .target Nori Pridedrift
step << Mage
    #completewith next
    .hs >>使用你的[炉石]
step << Dwarf Paladin/Dwarf Hunter
    #season 2
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12,0
    .goto 1426,28.939,68.387,12 >>进入安威玛尔
step << Dwarf Paladin
    #season 2
    #optional
    .goto Dun Morogh,28.833,68.332
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗莫斯·格鲁诺尔|r交谈
    .turnin 77657 >>交还光明圣物
    .target Bromos Grummner
    .isQuestComplete 77657
    .equip 10 --Show step if you don't have gloves
step << Dwarf Hunter
    #season 2
    #optional
    .goto Dun Morogh,29.175,67.455
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索加斯·格瑞姆森|r交谈
    .turnin 77660 >>提交“穿越洞穴”任务
    .target Thorgas Grimson
    .isQuestComplete 77660
    .equip 10 --Show step if you don't have gloves
step << Dwarf Paladin/Dwarf Hunter
    #season 2
    #optional
    #completewith ColdridgePass
    .abandon 77657 >>放弃光明遗物, 因为你已装备了一对|T132938:0|t[手套] << Paladin
    .abandon 77660 >>放弃穿越洞穴的任务, 因为你已装备了一双|T132952:0|t[手套] << Hunter
step
    .goto Dun Morogh,29.47,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>|cRXP_BUY_从商人那里购买所有你需要的|T134419:0|t|cRXP_WARN_[符文]|r|r
    .target Rune Broker
    .skipgossip
step
    #label Observations
    >>与|cRXP_FRIENDLY_巡山人萨鲁斯|r和|r汉兹·跳链|r交谈
    .turnin 282 >>交任务: |cRXP_FRIENDLY_森内尔的观察站|r
    .accept 420 >>接任务: |cRXP_LOOT_森内尔的观察站|r
    .goto Dun Morogh,33.484,71.841
    .target +Mountaineer Thalos
    .accept 2160 >>接任务: |cRXP_LOOT_塔诺克的补给品|r
    .goto Dun Morogh,33.85,72.24
    .target +Hands Springsprocket
step
    #label ColdridgePass
    .goto Dun Morogh,34.32,70.95,15,0
    .goto Dun Morogh,35.65,65.79,15 >>穿越寒脊山口
    .subzoneskip 800,1
    .isOnQuest 2160
]])

RXPGuides.RegisterGuide([[
#season 2
#classic
#version 1
<< Alliance --!Hunter
#group RestedXP 联盟 1-20级
#name 6-11 丹莫罗 赛季服
#displayname 7-12 丹莫罗 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 12-13 丹莫罗 赛季服
#defaultfor Dwarf/Gnome

step
    #optional
    #label BoarMeatQuest
    #completewith SenirEnd
    >>前往卡拉诺斯途中击杀|cRXP_ENEMY_Crag Boars|r. 击败它们可获得|T133970:0|t|cRXP_LOOT_[野猪肉块]|r和|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_保存所有|r|T133970:0|t|cRXP_LOOT_[野猪肉块]|r|cRXP_WARN_你从“贝尔丁的补给”任务中获得的, 然后用于提升你的|r|T133971:0|t[烹饪] |cRXP_WARN_等级|r
    .collect 769,4,317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob Crag Boar
    .subzoneskip 131 --Kharanos
--XX 270 from priest quest
--XX 340 from quest, 45 from explore
step
    #label SenirEnd
    .goto Dun Morogh,46.726,53.826
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .turnin 420 >>交任务: |cRXP_FRIENDLY_森内尔的观察站|r
    .accept 287 >>接任务: |cRXP_WARN_霜鬃巨魔要塞|r
    .target Senir Whitebeard
step << Warlock
    .goto Dun Morogh,47.329,53.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉姆瑞兹·黑轮|r交谈
    .trainer >>训练你的职业法术
    .target Gimrizz Shadowcog
step
    .goto Dun Morogh,46.825,52.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉格纳·雷酒|r交谈
    .accept 384 >>接任务: |cRXP_LOOT_啤酒烤猪排|r
    .target Ragnar Thunderbrew
step
    #optional
    #completewith next
    .goto 1426,46.952,52.050,8,0
    .goto 1426,47.153,51.939,8 >>进入雷霆酒厂
step
    .goto Dun Morogh,47.217,52.195
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔诺克·霜锤|r交谈
    .turnin 2160,1 >>交任务: |cRXP_FRIENDLY_塔诺克的补给品|r << Warrior/Rogue
    .turnin 2160,2 >>交任务: |cRXP_FRIENDLY_塔诺克的补给品|r << !Warrior !Rogue
    .target Tannok Frosthammer
step << Rogue
    .goto Dun Morogh,47.189,52.403
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克雷格·比尔姆|r交谈
    >>|cRXP_WARN_购买|r |T135641:0|t[破损的平衡飞刀]
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target Kreg Bilmn
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #optional
    #sticky
    #label BalancedDaggers1
    +|cRXP_WARN_装备|r|T135641:0|t[破损的平衡飞刀]
    .use 2946
    .itemcount 2946,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Rogue
    #optional
    #sticky
    #requires BalancedDaggers1
    #label DeleteOldDaggers
    .destroy 2947 >>摧毁: |cRXP_ENEMY_破损的小飞刀|r, 它在你的背包中. 不再需要它了
step << Rogue
    .goto Dun Morogh,47.563,52.608
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与后室内的|cRXP_FRIENDLY_霍格拉尔·巴坎|r交谈
    .trainer >>训练你的职业法术
    .train 921 >>确保训练 |T133644:0|t|cRXP_PICK_扒窃|r, 稍后你需要这个技能来获取符文
    .target Hogral Bakkan
step << Mage
    .goto Dun Morogh,47.498,52.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_玛济斯·石衣|r交谈
    .trainer >>训练你的职业法术
    .target Magis Sparkmantle
step << Paladin
    .goto Dun Morogh,47.597,52.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_阿扎尔·战锤|r交谈
    .trainer >>训练你的职业法术
    .target Azar Stronghammer
step << Priest
    .goto Dun Morogh,47.342,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克萨恩·安沃尔|r交谈
    .accept 5625 >>接任务: |cRXP_LOOT_圣光之衣|r
    .target Maxan Anvol
step << Priest
    .goto Dun Morogh,45.805,54.568
    >>对|cRXP_FRIENDLY_巡山人多尔夫|r施放 |T135929:0|t[次级治疗术](等级2), 然后施放 |T135987:0|t[真言术:坚韧]
    .complete 5625,1 --Heal and fortify Mountaineer Dolf
    .target Mountaineer Dolf
step << Priest
    .goto Dun Morogh,47.342,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克萨恩·安沃尔|r交谈
    .turnin 5625 >>交任务: |cRXP_FRIENDLY_圣光之衣|r
    .trainer >>训练你的职业法术
    .target Maxan Anvol
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    .home >>将你的[炉石]设置为雷酒酿造厂
    .vendor >>|cRXP_BUY_尽可能多地购买|r|T132815:0|t[冰镇牛奶]|r << Mage
    .target Innkeeper Belm
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店老板贝尔姆交谈|cRXP_FRIENDLY_Innkeeper Belm|r
    >>从他那里购买一瓶 |T132800:0|t[|cRXP_LOOT_狂想麦酒|r]
    .collect 2894,1 --Rhapsody Malt (1)
    .itemcount 2886,6 --Crag Boar Ribs (6)
step
    .goto Dun Morogh,46.825,52.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉格纳·雷酒|r交谈
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
    .target Ragnar Thunderbrew
    .isQuestComplete 384
step << Warrior
    .goto Dun Morogh,47.360,52.646
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格兰尼斯·快斧|r_交谈
    .trainer >>训练你的职业法术
    .target Granis Swiftaxe
step << Paladin/Warrior/Rogue
    #optional
    #completewith Blacksmithing1
    .goto 1426,45.695,51.911,20 >>进入铁匠铺
step << Gnome Warrior
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T135321:0|t[步兵剑]
    .target Grawn Thromwyn
    .money <0.0536
    .collect 2488,1 --Collect Gladius (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Gnome Warrior
    #completewith next
    +|cRXP_WARN_装备|r|T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
step << Dwarf Warrior
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r|T132401:0|t[双刃战斧]
    .target Grawn Thromwyn
    .money <0.0460
    .collect 2491,1 --Collect Large Axe (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.30
step << Dwarf Warrior
    #completewith next
    +|cRXP_WARN_装备|r|T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.29
step << Rogue
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T135641:0|t[卷刃的剑]
    .target Grawn Thromwyn
    .money <0.0400
    .collect 2494,1 --Collect Stiletto (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith next
    +|cRXP_WARN_装备|r|T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Paladin
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T133053:0|t[木槌棒]
    .target Grawn Thromwyn
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.00
step << Paladin
    #completewith next
    +|cRXP_WARN_装备|r|T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.99
step << Warrior/Rogue/Paladin
    #label Blacksmithing1
    .goto 1426,45.344,51.936
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托格努斯·燧火|r交谈
    >>|cRXP_WARN_这将使你制作|r|T135248:0|t[劣质磨刀石]|cRXP_WARN_, 提升你的近战伤害2点|r << Warrior/Rogue
    >>|cRXP_WARN_这将让你制作|r|T135255:0|t[劣质平衡石]|cRXP_WARN_, 使你的近战伤害提高2点|r << Paladin
    >>|cRXP_WARN_如果你不想这样做, 请跳过此步骤|r
    .train 2018 >>训练 |T136241:0|t[锻造]
    .target Tognus Flintfire
step
    #requires DeleteOldDaggers << Rogue
    .goto Dun Morogh,46.021,51.676
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨雷克·黑石|r交谈
    .accept 400 >>接任务: |cRXP_LOOT_贝尔丁的工具|r
    .target Tharek Blackstone
step << Rogue
    #season 2
    .goto Dun Morogh,47.658,51.706,5,0
    .goto Dun Morogh,47.160,52.335,5,0
    .goto Dun Morogh,46.917,51.995
    >>|cRXP_WARN_爬上卡拉诺斯旅店的屋顶, 然后跳到那个巨大的酒桶上, 接着沿箭头指示前进|r
    >>打开|cRXP_PICK_Rusty Lockbox|r(生锈的锁箱). 将其打开后获得 |T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r]
    .collect 203993,1 -- Rune of Slaughter (1)
    .train 424992,1
step << Rogue
    #season 2
    .train 424992 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_屠杀符文|r]|cRXP_WARN_来训练|r|T236280:0|t[暗影屠杀]
    .use 203993
    .itemcount 203993,1
step
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_峭壁野猪|r, 从其身上搜刮 |T133970:0|t|cRXP_LOOT_[野猪肉块]|r和|cRXP_LOOT_峭壁野猪肋排|r
    .collect 769,4,317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob Crag Boar
    .subzoneskip 131 --Kharanos
step
    #label StartStocking
    .goto Dun Morogh,49.426,48.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    >>|cRXP_WARN_途中不要杀死任何黑熊幼崽|cRXP_ENEMY_Young Black Bears|r|r
    .accept 317 >>接任务: |cRXP_LOOT_贝尔丁的补给|r
    .target Pilot Bellowfiz
step
    .goto Dun Morogh,49.622,48.612
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .accept 313 >>接任务: |cRXP_LOOT_灰色洞穴|r
    .target +Pilot Stonegear
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔丁·钢架|r和|cRXP_FRIENDLY_罗斯洛·鲁治|r交谈
    .turnin 400 >>交任务: |cRXP_FRIENDLY_贝尔丁的工具|r
    .goto Dun Morogh,50.443,49.092
    .target +Beldin Steelgrill
    .accept 5541 >>接任务: |cRXP_LOOT_海格纳的弹药|r
    .goto Dun Morogh,50.084,49.420
    .target +Loslor Rudge
step << Warrior/Paladin/Rogue
    #optional
    .goto Dun Morogh,50.01,50.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_亚尔·锤石|r 在楼下交谈
    >>|cRXP_WARN_如果你负担不起, 就跳过这一步|r
    .train 2575 >>训练 |T134708:0|t[采矿]
    .target Yarr Hammerstone
    .train 2018,3 --Blacksmithing
step << Warrior/Paladin/Rogue
    #optional
    #completewith QuarryEnd
    .cast 2580 >>|cRXP_WARN_Cast|r|T136025:0|t[采集矿物]
    .usespell 2580
    .train 2575,3 --Mining
step << Hunter
    #season 2
    #sticky
    #label pigmeat
    >>击杀|cRXP_ENEMY_野猪|r. 击杀后搜刮出 |T134026:0|t[丹莫罗猪肉]
    .collect 208192,1
    .mob Crag Boar
    .mob Elder Crag Boar
    .mob Large Crag Boar
    .mob Scarred Crag Boar
    .train 425762,1
step
    #loop
    .goto Dun Morogh,52.0,50.1,0
    .goto Dun Morogh,43.5,52.5,0
    .goto Dun Morogh,52.0,50.1,75,0
    .goto Dun Morogh,51.5,53.9,75,0
    .goto Dun Morogh,50.1,53.9,75,0
    .goto Dun Morogh,49.9,50.9,75,0
    .goto Dun Morogh,48.0,49.5,75,0
    .goto Dun Morogh,48.2,46.9,75,0
    .goto Dun Morogh,43.5,52.5,75,0
    >>击杀|cRXP_ENEMY_黑熊幼崽|r. 击败它们获取|cRXP_LOOT_厚熊皮|r
    >>击杀|cRXP_ENEMY_大峭壁野猪|r和|cRXP_ENEMY_峭壁野猪|r. 击杀后拾取其掉落的 |T133970:0|t|cRXP_LOOT_野猪肉块|r和|cRXP_LOOT_峭壁野猪肋排|r
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob +Young Black Bear
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .disablecheckbox
    .mob Large Crag Boar
    .mob Crag Boar
step
    #optional
    #completewith EvershineEnd
    >>击杀|cRXP_ENEMY_大峭壁野猪|r 和|cRXP_ENEMY_峭壁野猪|r , 掠夺它们的|cRXP_LOOT_峭壁野猪肋排|r
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob Large Crag Boar
    .mob Crag Boar
step
    .goto Dun Morogh,49.426,48.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .turnin 317 >>交任务: |cRXP_FRIENDLY_贝尔丁的补给|r
    .accept 318 >>接任务: |cRXP_LOOT_艾沃沙酒|r
    .target Pilot Bellowfiz
step << Mage
    #optional
    #completewith next
    .goto 1426,46.952,52.050,8,0
    .goto 1426,47.153,51.939,8 >>进入雷霆酒厂
step << Mage
    #completewith next
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    .vendor 1247 >>|cRXP_BUY_只要你负担得起, 就尽可能多地向他购买|r |T132815:0|t[冰镇牛奶] |r
    .target Innkeeper Belm
    .money <0.0125
    .itemcount 1179,<1 --Ice Cold Milk (1)
    .xp >10,1
step << Warlock
    .xp 8
    --should be 8.5 here with 2.5x
step << Warlock
    .goto Dun Morogh,47.327,53.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉姆瑞兹·黑轮|r交谈
    .trainer >>训练你的职业法术
    .target Gimrizz Shadowcog
step << Warlock
    .goto Dun Morogh,47.273,53.658
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼·血泡|r交谈
    .vendor 6328 >>|cRXP_BUY_如果你买得起, 就买|r|T133738:0|t[魔典：火焰箭(等级 2)]|cRXP_BUY_. 如果负担不起, 可以稍后再买|r
    .target Gimrizz Shadowcog
    .money <0.100
step << Priest
    #season 2
    .goto Dun Morogh,40.9,45.3,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,42.1,34.3,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,40.9,45.3
    .goto Dun Morogh,39.5,43.0,0
    .goto Dun Morogh,41.5,36.0,0
    >>击杀|r|cRXP_ENEMY_霜鬃先知|r. 击败他们后可获得物品:|T135975:0|t[|cRXP_FRIENDLY_亵渎要塞的预言|r]
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob Frostmane Seer
    .train 402852,1
    --410935
step << Priest !NightElf
    #season 2
    #completewith end
    .train 402852 >>|cRXP_WARN_ 使用|r|T135975:0|t[|cRXP_FRIENDLY_被亵渎要塞的预言|r]
    >>|cRXP_WARN_你必须在暴风城大教堂和洛克莫丹或铁炉堡神秘区的圣光祭坛旁输入 /pray, 才能获得 2|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buffs|r
    >>|cRXP_WARN_|T136057:0|t|cRXP_PICK_Meidtation on Elune|r增益必须由另一位牧师玩家施放, 方法是在你使用 /kneel 跪下时, 他们对你使用 /pray 祷告表情. 如果你看到其他牧师拥有此冥想增益, 请向他们请求|r
    --.use 205947
    .target Altar of Light
    .itemcount 205947,1
step << Mage
    #season 2
    .goto Dun Morogh,40.9,45.3,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,42.1,34.3,50,0
    .goto Dun Morogh,39.7,40.0,50,0
    .goto Dun Morogh,41.5,43.6,50,0
    .goto Dun Morogh,40.9,45.3
    .goto Dun Morogh,39.5,43.0,0
    .goto Dun Morogh,41.5,36.0,0
    >>击杀|cRXP_ENEMY_霜鬃先知|r. 击败他们后搜刮出 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:米尔金·瓦尔夫]|r
    .collect 203752,1
    .mob Frostmane Seer
    .train 401768,1
step << Mage
    #completewith end
    #season 2
    .collect 211779,1 >>你需要从一个|cRXP_FRIENDLY_试剂商|r处获得 |T135933:0|t[理解之咒], 才能使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:米尔金·瓦尔夫]|r
    .train 401768 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_法术笔记:米尔金·瓦尔夫]|r|cRXP_WARN_来训练|r|T135820:0|t[活体之焰]
    .use 203752
step << Warrior/Paladin/Rogue
    #optional
    .goto Dun Morogh,50.084,49.420
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗斯洛·鲁治|r交谈
    >>|cRXP_BUY_从他那里购买 a|r |T134708:0|t[矿工锄] |r
    .collect 2901,1 --Mining Pick (1)
    .target Loslor Rudge
    .train 2018,3 --Blacksmithing
step << Warrior/Paladin/Rogue
    #optional
    .goto Dun Morogh,50.01,50.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_亚尔·锤石|r 在楼下交谈
    .train 2575 >>训练 |T134708:0|t[采矿]
    .target Yarr Hammerstone
    .train 2018,3 --Blacksmithing
step
    #optional
    #completewith next
    .goto 1426,46.952,52.050,8,0
    .goto 1426,47.153,51.939,8 >>进入雷霆酒厂
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_从他那里购买 a|r|T132800:0|t[狂想麦酒]|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .target Innkeeper Belm
    .itemcount 2886,6 --Crag Boar Rib (6)
step
    .goto Dun Morogh,46.825,52.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉格纳·雷酒|r外的|r交谈
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
    .target Ragnar Thunderbrew
    .isQuestComplete 384
step << Paladin/Warrior/Rogue
    #optional
    #completewith Blacksmithing1
    .goto 1426,45.695,51.911,20 >>进入铁匠铺
step << Gnome Warrior
#optional
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T135321:0|t[步兵剑]
    .target Grawn Thromwyn
    .money <0.0536
    .collect 2488,1 --Collect Gladius (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.80
step << Gnome Warrior
#optional
    #completewith next
    +|cRXP_WARN_装备|r|T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.79
step << Dwarf Warrior
#optional
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r|T132401:0|t[双刃战斧]
    .target Grawn Thromwyn
    .money <0.0460
    .collect 2491,1 --Collect Large Axe (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.30
step << Dwarf Warrior
#optional
    #completewith next
    +|cRXP_WARN_装备|r|T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.29
step << Rogue
#optional
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T135641:0|t[卷刃的剑]
    .target Grawn Thromwyn
    .money <0.0400
    .collect 2494,1 --Collect Stiletto (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
#optional
    #completewith next
    +|cRXP_WARN_装备|r|T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.29
step << Paladin
#optional
    .goto 1426,45.288,52.193
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳恩·索姆温|r交谈
    >>|cRXP_BUY_购买|r |T133053:0|t[木槌棒]
    .target Grawn Thromwyn
    .money <0.0631
    .goto Dun Morogh,45.290,52.190
    .collect 2493,1 --Collect Wooden Mallet (1)
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.00
step << Paladin
#optional
    #completewith next
    +|cRXP_WARN_装备|r|T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.99
step << Hunter
    #optional
    .xp 6 >>升级至6级
step << Hunter
    #season 2
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .train 1130 >>训练 |T132212:0|t[猎人印记]
    >>|cRXP_WARN_如果你钱不够, 可以在卡尔纳斯附近刷怪. 稍后你会需要用到这个法术来制作符文|r
    .target Grif Wildheart

step
    #optional
    #completewith next
    .goto 1426,42.982,54.755
    .subzone 136 >>前往灰色洞穴
    .isOnQuest 313
step
    #loop
    .goto 1426,42.982,54.755,0
    .goto 1426,41.918,54.053,0
    .goto 1426,41.100,48.927,0
    .goto 1426,42.982,54.755,40,0
    .goto 1426,41.901,55.217,40,0
    .goto 1426,41.918,54.053,40,0
    .goto 1426,42.177,53.274,40,0
    .goto 1426,41.100,48.927,40,0
    >>击杀 |cRXP_ENEMY_雪怪|r和 |cRXP_ENEMY_雪怪幼崽|r. 击败它们后可获得其 |cRXP_LOOT_雪怪的鬃毛|r
    .complete 313,1 --Collect Wendigo Mane (x8)
    .mob Wendigo
    .mob Young Wendigo
step
    .goto Dun Morogh,44.13,56.95
    >>打开|cRXP_PICK_弹药箱|r. 从中获取|cRXP_LOOT_Rumbleshot's Ammo|r
    .complete 5541,1 --Collect Rumbleshot's Ammo (x1)
step
    #optional
    #completewith next
    .goto 1426,40.632,62.794,40,0
    .goto Dun Morogh,40.682,65.130,15 >>前往|cRXP_FRIENDLY_海格纳·重枪|r
step << Hunter
    #optional
    .goto Dun Morogh,40.682,65.130
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海格纳·重枪|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135611:0|t[精制短枪]|r
    >>|cRXP_WARN_如果你负担不起, 就跳过这一步|r
    .turnin 5541 >>交任务: |cRXP_FRIENDLY_海格纳的弹药|r
    .collect 2509,1 -- Ornate Blunderbuss (1)
    .target Hegnar Rumbleshot
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.95
step
    #label BearFur
    .goto Dun Morogh,40.682,65.130
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海格纳·重枪|r交谈
    .turnin 5541 >>交任务: |cRXP_FRIENDLY_海格纳的弹药|r
    .target Hegnar Rumbleshot
step
    #label Tundra
    .goto Dun Morogh,34.577,51.652
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .accept 312 >>接任务: |cRXP_LOOT_马克格拉恩的干肉|r
    .target Tundra MacGrann
step
    .goto Dun Morogh,38.517,53.927
    >>打开|cRXP_PICK_马克格拉恩的储肉柜|r. 将其打开后获得|cRXP_LOOT_马克格拉恩的风干肉|r
    >>|cRXP_WARN_等待|cRXP_ENEMY_冰须|r离开洞穴巡逻. 当他离开洞穴后, 你便可进入并拾取|cRXP_PICK_马克格拉恩的储肉柜|r
    .link https://www.youtube.com/watch?v=o55Y3LjgKoE >>|cRXP_WARN_点击此处查看视频参考|r
    .complete 312,1 --MacGrann's Dried Meats (1)
step
    .goto Dun Morogh,36.4,52.8
    >>尝试击杀洞穴外的野猪, 以获取|T133972:0|t[|cRXP_LOOT_峭壁野猪肋排|r]. |cRXP_WARN_如果附近没有野猪, 请跳过此步骤|r
    >>|cRXP_WARN_确保你已拾取 |T134026:0|t[丹莫罗猪肉]. |cRXP_WARN_你现在需要它来获取符文|r << Hunter
    .collect 2886,6 --Crag Boar Rib (6)
    .collect 208192,1 << Hunter --Dun Morogh Pig Meat (1)
step
    .goto Dun Morogh,34.577,51.652
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图德拉·马克格拉恩|r交谈
    .turnin 312 >>交任务: |cRXP_FRIENDLY_马克格拉恩的干肉|r
    .target Tundra MacGrann
step << Hunter
    #season 2
    #requires pigmeat
    .train 425762,1
    .goto Dun Morogh,37.78,42.55
    >>在洞穴内尸体附近使用 |T134026:0|t[丹莫罗猪肉] 召唤|cRXP_ENEMY_Jorul|r
    >>击杀|cRXP_ENEMY_Jorul|r. 击败他后搜刮出 |T134419:0|t|cRXP_LOOT_[侧翼符文]|r
    .collect 205979,1
    .use 208192
    .mob Jorul
step << Hunter
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[侧翼符文]|r|cRXP_WARN_来训练|r|T132175:0|t[侧翼打击]
    .use 205979
    .itemcount 205979,1
step
    #completewith next
    .goto Dun Morogh,30.453,46.005
    .subzone 137 >>前往布伦诺村
step << Mage
    #completewith next
    .goto Dun Morogh,30.453,46.005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    >>|cRXP_BUY_从他那里购买最多 20|r|T132815:0|t[冰镇牛奶]|r
    .collect 1179,20
    .target Keeg Gibn
    .isOnQuest 318
step
    #label EvershineEnd
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .turnin 318 >>交任务: |cRXP_FRIENDLY_艾沃沙酒|r
    .goto Dun Morogh,30.190,45.726
    .target +Rejold Barleybrew
step << Hunter
    #season 2
    #sticky
    #label Marksmanship1
    .goto Dun Morogh,28.852,49.859
    >>对|cRXP_ENEMY_Rustling Bush|r施放 |T132212:0|t[猎人印记]
    >>击杀生成的|cRXP_ENEMY_剃刀爪偷猎者|r, 从他身上搜刮|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Razormane Poacher
    .train 410113,1
step << Hunter
    #season 2
    #sticky
    #label Marksmanship2
    #requires Marksmanship1
    .cast 402265 >>使用 |T134419:0|t[|cRXP_FRIENDLY_射击天赋符文|r]
    .use 206155
    .train 410113,1
step << Priest
    #season 2
    >>击杀|r|cRXP_ENEMY_麻疯侏儒|r. 击败他们后搜刮, 获得|r|cRXP_FRIENDLY_黑暗意图的记忆|r
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .mob Leper Gnome
    .train 425216,1
step << Priest
    #season 2
    #loop
    .goto 1426,26.653,43.844,0
    .goto 1426,24.601,40.790,0
    .goto 1426,25.540,45.374,0
    .goto 1426,26.653,43.844,55,0
    .goto 1426,26.587,42.702,55,0
    .goto 1426,26.175,41.822,55,0
    .goto 1426,26.052,40.769,55,0
    .goto 1426,24.739,39.481,55,0
    .goto 1426,24.601,40.790,55,0
    .goto 1426,24.662,41.770,55,0
    .goto 1426,24.487,43.265,55,0
    .goto 1426,24.805,43.848,55,0
    .goto 1426,24.871,44.693,55,0
    .goto 1426,25.540,45.374,55,0
    .goto 1426,25.950,43.930,55,0
    >>击杀|r|cRXP_ENEMY_麻疯侏儒|r. 击败他们后搜刮, 获得|r|cRXP_FRIENDLY_黑暗意图的记忆|r
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .mob Leper Gnome
    .train 425216,1
step << Priest
    #season 2
    .train 425216 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_黑暗目的的记忆|r]|cRXP_WARN_来训练|r|T237514:0|t[虚空瘟疫]
    >>|cRXP_WARN_你必须在神圣区域(例如北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区)输入 /kneel, 才能获得|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buff|r
    .use 205940
step << Rogue
    #season 2
    #loop
    .goto 1426,26.653,43.844,0
    .goto 1426,24.601,40.790,0
    .goto 1426,25.540,45.374,0
    .goto 1426,26.653,43.844,55,0
    .goto 1426,26.587,42.702,55,0
    .goto 1426,26.175,41.822,55,0
    .goto 1426,26.052,40.769,55,0
    .goto 1426,24.739,39.481,55,0
    .goto 1426,24.601,40.790,55,0
    .goto 1426,24.662,41.770,55,0
    .goto 1426,24.487,43.265,55,0
    .goto 1426,24.805,43.848,55,0
    .goto 1426,24.871,44.693,55,0
    .goto 1426,25.540,45.374,55,0
    .goto 1426,25.950,43.930,55,0
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_麻风侏儒|r. 击杀他们以获取 |T134269:0|t[|cRXP_LOOT_右下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208218,1 -- Bottom-Right Map Piece (1)
    .mob Leper Gnome
    .train 398196,1
step
    #optional
    #requires ForceFavorRibYes
step
    #optional
    .goto 1426,24.975,50.473,20,0
    .goto 1426,24.682,50.836,20 >>沿着洞穴入口的岩壁跑上去, 然后跳进霜鬃巨魔要塞
    .isOnQuest 287
step
    #sticky
    #label Headhunters
    #loop
    .goto 1426,22.390,51.701,0
    .goto 1426,23.136,50.886,0
    .goto 1426,24.301,50.898,0
    .waypoint 1426,22.390,51.701,30,0
    .waypoint 1426,21.113,51.717,30,0
    .waypoint 1426,21.131,51.024,30,0
    .waypoint 1426,22.067,50.215,30,0
    .waypoint 1426,23.136,50.886,30,0
    .waypoint 1426,23.373,51.385,30,0
    .waypoint 1426,23.568,50.924,30,0
    .waypoint 1426,24.301,50.898,30,0
    >>击杀洞穴内的霜鬃猎头者
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob Frostmane Headhunter
step << Rogue
    #season 2
    #loop
    .goto 1426,22.390,51.701,0
    .goto 1426,23.136,50.886,0
    .goto 1426,24.301,50.898,0
    .waypoint 1426,22.390,51.701,30,0
    .waypoint 1426,21.113,51.717,30,0
    .waypoint 1426,21.131,51.024,30,0
    .waypoint 1426,22.067,50.215,30,0
    .waypoint 1426,23.136,50.886,30,0
    .waypoint 1426,23.373,51.385,30,0
    .waypoint 1426,23.568,50.924,30,0
    .waypoint 1426,24.301,50.898,30,0
    #completewith ShimmerweedCollect
    >>|T133644:0|t[扒窃] |cRXP_ENEMY_霜鬃巨魔|r. 击杀他们以获取 |T134327:0|t[|cRXP_LOOT_右上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    .collect 208213,1 -- Top-Right Map Piece (1)
    .mob Frostmane Seer
    .mob Frostmane Headhunter
    .mob Frostmane Snowstrider
    .train 398196,1
step
    #requires Headhunters
    .goto Dun Morogh,22.86,52.16
    >>|cRXP_WARN_掉入洞穴中那个小死胡同房间|r
    .complete 287,2 --Fully explore Frostmane Hold
step
    #completewith dm10end
    .deathskip >>死亡后在卡拉诺斯复活
    .subzoneskip 131
step
    .goto Dun Morogh,47.377,52.523
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132800:0|t[狂想麦酒]|cRXP_BUY_和|r|T132800:0|t[雷霆麦酒]|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .itemcount 2886,6 --Crag Boar Rib (6)
    .target Innkeeper Belm
step
    .goto Dun Morogh,46.825,52.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉格纳·雷酒|r外的|r交谈
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
    .target Ragnar Thunderbrew
    .isQuestComplete 384
step
    #label dm10end
    .goto Dun Morogh,46.726,53.826
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .turnin 287 >>交任务: |cRXP_FRIENDLY_霜鬃巨魔要塞|r
    .accept 291 >>接任务: |cRXP_LOOT_森内尔的报告|r
    .target Senir Whitebeard
step << Hunter
    #label dm10end
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .trainer >>训练你的职业法术
    .accept 6064 >>接任务: |cRXP_LOOT_驯服野兽|r << Dwarf
    .target Grif Wildheart
step << Dwarf Hunter
    .goto Dun Morogh,48.3,56.9
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_大峭壁野猪|r
    .complete 6064,1 --Tame a Large Crag Boar (1)
    .use 15911
    .mob Large Crag Boar
step << Dwarf Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6064 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6084 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Grif Wildheart
step << Dwarf Hunter
    .goto Dun Morogh,49.4,59.4
    >>|cRXP_WARN_|cRXP_WARN_请选中|r |cRXP_ENEMY_雪豹|r并使用|r|T132164:0|t[驯兽棒]|r
    .complete 6084,1 --Tame a Snow Leopard (1)
    .use 15913
    .mob Snow Leopard
step << Dwarf Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6084 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6085 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Grif Wildheart
step << Dwarf Hunter
    .goto Dun Morogh,50.4,59.7
    >>|cRXP_WARN_使用|r|T132164:0|t[驯兽棒] |cRXP_WARN_对一只|r|cRXP_ENEMY_冰爪熊|r
    .complete 6085,1 --Tame an Ice Claw Bear (1)
    .use 15908
    .mob Ice Claw Bear
step << Dwarf Hunter
    .goto Dun Morogh,45.810,53.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞夫|r交谈
    .turnin 6085 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6086 >>接任务: |cRXP_LOOT_训练野兽|r
    .target Grif Wildheart
step << Rogue
    .goto Dun Morogh,47.563,52.608
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与后室内的|cRXP_FRIENDLY_霍格拉尔·巴坎|r交谈
    >>|cRXP_WARN_仅训练|r|T132147:0|t[双持]|cRXP_WARN_和|r|T132307:0|t[冲刺]|cRXP_WARN_. 不要学习其他技能, 以节省金币留待日后使用|r
    .train 674 >>训练 |T132147:0|t[双武器战斗]
    .train 2983 >>训练 |T132307:0|t[冲刺]
    .accept 2218 >>接任务: |cRXP_LOOT_救赎之路|r
    .target Hogral Bakkan
step << Paladin
    .goto Dun Morogh,47.597,52.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_阿扎尔·战锤|r交谈
    .trainer >>训练你的职业法术
    .target Azar Stronghammer
step << Warrior
    .goto Dun Morogh,47.360,52.646
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格兰尼斯·快斧|r_交谈
    .trainer >>训练你的职业法术
    .target Granis Swiftaxe
step << Mage
    .goto Dun Morogh,47.498,52.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_玛济斯·石衣|r交谈
    .train 118 >>训练 |T136071:0|t[变形术]
    .target Magis Sparkmantle
step << Priest
    .goto Dun Morogh,47.342,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克萨恩·安沃尔|r交谈
    .trainer >>训练你的职业法术
    .target Maxan Anvol
step << Warrior/Rogue/Paladin
    .goto Dun Morogh,47.180,52.610
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨姆诺·普尔|r交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Thamner Pol
    .money <0.01
step
    .goto Dun Morogh,49.622,48.612
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .turnin 313 >>交任务: |cRXP_FRIENDLY_灰色洞穴|r
    .target Pilot Stonegear
step << Warrior
    #optional
    #completewith next
    +|cRXP_WARN_刷怪直到你拥有价值10银30铜的可出售物品|r
    .money >0.1030
step << Warrior
    .goto Dun Morogh,47.58,41.58,40,0
    .goto Dun Morogh,50.19,40.79,20,0
    .goto Ironforge,14.90,87.10,40 >>前往: |cRXP_PICK_铁炉堡|r
step << Warrior
    .goto Ironforge,62.237,89.628
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克斯|r 或|cRXP_FRIENDLY_布里维夫·石拳|r 交谈
    .trainer >>如果你在队伍中或有队友帮你击杀|cRXP_ENEMY_瓦加什|r, 就从|cRXP_FRIENDLY_布里维夫·石拳|r处学习双手锤技能(需2小时训练)；否则, 从|cRXP_FRIENDLY_比克斯|r处学习投掷武器技能. 如果不确定该学哪个, 直接选择投掷武器即可
    .target Bixi Wobblebonk
    .target Buliwyf Stonehand
step << Warrior
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_楼下的布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r |T135425:0|t[锐利投掷匕首] |r
    .collect 3107,200 --Collect Keen Throwing Knife (200)
    .target Brenwyn Wintersteel
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Warrior
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_楼下的布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135641:0|t[破损的平衡飞刀]|r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target Brenwyn Wintersteel
    .xp >11,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #optional
    #completewith Dirt
    +|cRXP_WARN_装备|r|T135425:0|t[锐利投掷匕首]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Warrior
    #optional
    #completewith Dirt
    +|cRXP_WARN_装备|r|T135641:0|t[破损的平衡飞刀]
    .use 2946
    .itemcount 2946,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0

]])
